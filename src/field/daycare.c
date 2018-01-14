#include "global.h"
#include "daycare.h"
#include "event_data.h"
#include "field_effect.h"
#include "constants/items.h"
#include "mail_data.h"
#include "main.h"
#include "menu.h"
#include "constants/moves.h"
#include "name_string_util.h"
#include "overworld.h"
#include "party_menu.h"
#include "pokemon.h"
#include "pokemon_storage_system.h"
#include "random.h"
#include "script.h"
#include "constants/songs.h"
#include "sound.h"
#include "constants/species.h"
#include "string_util.h"
#include "strings2.h"
#include "text.h"
#include "trade.h"

// RAM buffers used to assist with BuildEggMoveset()
IWRAM_DATA u16 gHatchedEggLevelUpMoves[52];
IWRAM_DATA u16 gHatchedEggFatherMoves[4];
IWRAM_DATA u16 gHatchedEggFinalMoves[4];
IWRAM_DATA u16 gHatchedEggEggMoves[12];
IWRAM_DATA u16 gHatchedEggMotherMoves[4];

extern u16 gMoveToLearn;

static void ClearDaycareMail(struct DayCareMail *);
static void SetInitialEggData(struct Pokemon *, u16, struct DayCare *);
static u8 GetDaycareCompatibilityScore(struct DayCare *);

#include "../data/pokemon/egg_moves.h"

static const u8 *const sCompatibilityMessages[] = {
    DaycareText_GetAlongVeryWell,
    DaycareText_GetAlong,
    DaycareText_DontLikeOther,
    DaycareText_PlayOther
};

const u8 sJapaneseEggNickname[] = _("タマゴ");

u8 *GetMonNick(struct Pokemon *mon, u8 *dest)
{
    s8 nickname[POKEMON_NAME_LENGTH * 2];

    GetMonData(mon, MON_DATA_NICKNAME, nickname);
    return StringCopy10(dest, nickname);
}

u8 *GetBoxMonNick(struct BoxPokemon *mon, u8 *dest)
{
    s8 nickname[POKEMON_NAME_LENGTH * 2];

    GetBoxMonData(mon, MON_DATA_NICKNAME, nickname);
    return StringCopy10(dest, nickname);
}

u8 CountPokemonInDaycare(struct DayCare *daycare)
{
    u8 i, count;
    count = 0;

    for (i = 0; i < 2; i++)
    {
        if (GetBoxMonData(&daycare->mons[i], MON_DATA_SPECIES) != 0)
            count++;
    }

    return count;
}

void InitDaycareMailRecordMixing(struct BoxPokemon * daycareMons, struct RecordMixingDayCareMail * daycareMail)
{
    u8 i;
    u8 numDaycareMons = 0;

    for (i = 0; i < 2; i++)
    {
        if (GetBoxMonData(&daycareMons[i], MON_DATA_SPECIES) != SPECIES_NONE)
        {
            numDaycareMons++;
            if (GetBoxMonData(&daycareMons[i], MON_DATA_HELD_ITEM) == ITEM_NONE)
            {
                daycareMail->itemsHeld[i] = 0;
            }
            else
            {
                daycareMail->itemsHeld[i] = 1;
            }
        }
        else
        {
            daycareMail->itemsHeld[i] = 1;
        }
    }

    daycareMail->numDaycareMons = numDaycareMons;
}

static s8 Daycare_FindEmptySpot(struct BoxPokemon * daycareMons)
{
    u8 i;

    for (i = 0; i < 2; i++)
    {
        if (GetBoxMonData(&daycareMons[i], MON_DATA_SPECIES) == 0)
            return i;
    }

    return -1;
}

static void StorePokemonInDaycare(struct Pokemon * mon, struct DayCare * daycare)
{
    s8 emptySlot;
    u8 mail;
    u8 *names;

    emptySlot = Daycare_FindEmptySpot(daycare->mons);
    if (MonHasMail(mon))
    {
        StringCopy((names = daycare->misc.mail[emptySlot].names), gSaveBlock2.playerName);
        PadNameString(names, 0xFC);
        names += 8;
        GetMonNick(mon, names);
        mail = GetMonData(mon, MON_DATA_MAIL);
        daycare->misc.mail[emptySlot].message = gSaveBlock1.mail[mail];
        TakeMailFromMon(mon);
    }

    daycare->mons[emptySlot] = mon->box;
    BoxMonRestorePP(&daycare->mons[emptySlot]);
    daycare->misc.countersEtc.steps[emptySlot] = 0;
    ZeroMonData(mon);
    party_compaction();
    CalculatePlayerPartyCount();
}

void StoreSelectedPokemonInDaycare(void)
{
    StorePokemonInDaycare(&gPlayerParty[gLastFieldPokeMenuOpened], &gSaveBlock1.daycare);
}

// Shifts the second daycare pokemon slot into the first slot.
static void ShiftDaycareSlots(struct DayCare * daycare)
{
    // This condition is only satisfied when the player takes out the first pokemon from the daycare.
    if (GetBoxMonData(&daycare->mons[1], MON_DATA_SPECIES) != 0 && GetBoxMonData(&daycare->mons[0], MON_DATA_SPECIES) == 0)
    {
        daycare->mons[0] = daycare->mons[1];
        ZeroBoxMonData(&daycare->mons[1]);

        daycare->misc.mail[0] = daycare->misc.mail[1];
        daycare->misc.countersEtc.steps[0] = daycare->misc.countersEtc.steps[1];
        daycare->misc.countersEtc.steps[1] = 0;
        ClearDaycareMail(&daycare->misc.mail[1]);
    }
}

static void ApplyDaycareExperience(struct Pokemon * mon)
{
    s32 i;
    bool8 firstMove;
    u16 learnedMove;

    for (i = 0; i < MAX_LEVEL; i++)
    {
        // Add the mon's gained daycare experience level by level until it can't level up anymore.
        if (TryIncrementMonLevel(mon))
        {
            // Teach the mon new moves it learned while in the daycare.
            firstMove = TRUE;
            while ((learnedMove = MonTryLearningNewMove(mon, firstMove)) != 0)
            {
                firstMove = FALSE;
                if (learnedMove == 0xffff)
                {
                    // Mon already knows 4 moves.
                    DeleteFirstMoveAndGiveMoveToMon(mon, gMoveToLearn);
                }
            }
        }
        else
        {
            break;
        }
    }

    // Re-calculate the mons stats at its new level.
    CalculateMonStats(mon);
}

static u16 TakeSelectedPokemonFromDaycare(struct DayCare * daycare, u8 slot)
{
    u16 species;
    u32 experience;
    struct Pokemon pokemon;

    GetBoxMonNick(&daycare->mons[slot], gStringVar1);
    species = GetBoxMonData(&daycare->mons[slot], MON_DATA_SPECIES);
    sub_803B4B4(&daycare->mons[slot], &pokemon);

    if (GetMonData(&pokemon, MON_DATA_LEVEL) != MAX_LEVEL)
    {
        experience = GetMonData(&pokemon, MON_DATA_EXP) + daycare->misc.countersEtc.steps[slot];
        SetMonData(&pokemon, MON_DATA_EXP, &experience);
        ApplyDaycareExperience(&pokemon);
    }

    gPlayerParty[PARTY_SIZE - 1] = pokemon;
    if (daycare->misc.mail[slot].message.itemId)
    {
        GiveMailToMon2(&gPlayerParty[PARTY_SIZE - 1], &daycare->misc.mail[slot].message);
        ClearDaycareMail(&daycare->misc.mail[slot]);
    }

    party_compaction();
    ZeroBoxMonData(&daycare->mons[slot]);
    daycare->misc.countersEtc.steps[slot] = 0;
    ShiftDaycareSlots(daycare);
    CalculatePlayerPartyCount();
    return species;
}

u16 TakePokemonFromDaycare(void)
{
    return TakeSelectedPokemonFromDaycare(&gSaveBlock1.daycare, gSpecialVar_0x8004);
}

static u8 GetLevelAfterDaycareSteps(struct BoxPokemon * mon, u32 steps)
{
    struct BoxPokemon tempMon = *mon;

    u32 experience = GetBoxMonData(mon, MON_DATA_EXP) + steps;
    SetBoxMonData(&tempMon, MON_DATA_EXP,  &experience);
    return GetLevelFromBoxMonExp(&tempMon);
}

static u8 GetNumLevelsGainedFromSteps(struct DayCare *daycare, u8 slot)
{
    u8 levelBefore;
    u8 levelAfter;

    levelBefore = GetLevelFromBoxMonExp(&daycare->mons[slot]);
    levelAfter = GetLevelAfterDaycareSteps(&daycare->mons[slot], daycare->misc.countersEtc.steps[slot]);
    return levelAfter - levelBefore;
}

static u8 GetNumLevelsGainedForDaycareSlot(struct DayCare *daycare, u8 slot)
{
    u8 numLevelsGained = GetNumLevelsGainedFromSteps(daycare, slot);
    GetBoxMonNick(&daycare->mons[slot], gStringVar1);
    ConvertIntToDecimalStringN(gStringVar2, numLevelsGained, STR_CONV_MODE_LEFT_ALIGN, 2);
    return numLevelsGained;
}

static u16 GetDaycareCostForSelectedMon(struct DayCare *daycare, u8 slot)
{
    u16 cost;

    u8 numLevelsGained = GetNumLevelsGainedFromSteps(daycare, slot);
    GetBoxMonNick(&daycare->mons[slot], gStringVar1);
    cost = 100 + 100 * numLevelsGained;
    ConvertIntToDecimalStringN(gStringVar2, cost, STR_CONV_MODE_LEFT_ALIGN, 5);
    return cost;
}

void GetDaycareCost(void)
{
    gSpecialVar_0x8005 = GetDaycareCostForSelectedMon(&gSaveBlock1.daycare, gSpecialVar_0x8004);
}

void Debug_AddDaycareSteps(u16 numSteps)
{
    gSaveBlock1.daycare.misc.countersEtc.steps[0] += numSteps;
    gSaveBlock1.daycare.misc.countersEtc.steps[1] += numSteps;
}

u8 GetNumLevelsGainedFromDaycare(void)
{
    if (GetBoxMonData(&gSaveBlock1.daycare.mons[gSpecialVar_0x8004], MON_DATA_SPECIES) != 0)
        return GetNumLevelsGainedForDaycareSlot(&gSaveBlock1.daycare, gSpecialVar_0x8004);

    return 0;
}

static void ClearDaycareMail(struct DayCareMail *mail)
{
    u8 *names;
    u8 *names2;
    s32 i;
    u8 zero = 0;

    for (i = 7, names = &mail->names[7]; i >= 0; i--)
    {
        *names-- = zero;
    }

    names2 = &mail->names[8];
    zero = 0;
    names = &mail->names[18];
    do *names-- = zero; while ((s32)names >= (s32)names2);
    ClearMailStruct(&mail->message);
}

void unref_sub_8041824(struct DayCare *daycare)
{
    u8 slot;
    for (slot = 0; slot < ARRAY_COUNT(daycare->mons); slot++)
    {
        ZeroBoxMonData(&daycare->mons[slot]);
        daycare->misc.countersEtc.steps[slot] = 0;
        ClearDaycareMail(&daycare->misc.mail[slot]);
    }

    daycare->misc.countersEtc.pendingEggPersonality = 0;
    daycare->misc.countersEtc.eggCycleStepsRemaining = 0;
}

// Determines what the species of an Egg would be based on the given species.
// It determines this by working backwards through the evolution chain of the
// given species.
u16 GetEggSpecies(u16 species)
{
    int i, j, k;
    bool8 found;

    // Working backwards up to 5 times seems arbitrary, since the maximum number
    // of times would only be 3 for 3-stage evolutions.
    for (i = 0; i < 5; i++)
    {
        found = FALSE;
        for (j = 1; j < NUM_SPECIES; j++)
        {
            for (k = 0; k < 5; k++)
            {
                if (gEvolutionTable[j][k].targetSpecies == species)
                {
                    species = j;
                    found = TRUE;
                    break;
                }
            }

            if (found)
                break;
        }

        if (j == NUM_SPECIES)
            break;
    }

    return species;
}

static void _TriggerPendingDaycareEgg(struct DayCare *daycare)
{
    daycare->misc.countersEtc.pendingEggPersonality = (Random() % 0xfffe) + 1;
    FlagSet(FLAG_PENDING_DAYCARE_EGG);
}

static void _TriggerPendingDaycareMaleEgg(struct DayCare *daycare)
{
    daycare->misc.countersEtc.pendingEggPersonality = Random() | 0x8000;
    FlagSet(FLAG_PENDING_DAYCARE_EGG);
}

void TriggerPendingDaycareEgg(void)
{
    _TriggerPendingDaycareEgg(&gSaveBlock1.daycare);
}

void TriggerPendingDaycareMaleEgg(void)
{
    _TriggerPendingDaycareMaleEgg(&gSaveBlock1.daycare);
}

// Removes the selected index from the given IV list and shifts the remaining
// elements to the left.
static void RemoveIVIndexFromList(u8 *ivs, u8 selectedIv)
{
    s32 i, j;
    u8 temp[NUM_STATS];

    ivs[selectedIv] = 0xff;
    for (i = 0; i < NUM_STATS; i++)
    {
        temp[i] = ivs[i];
    }

    j = 0;
    for (i = 0; i < NUM_STATS; i++)
    {
        if (temp[i] != 0xff)
            ivs[j++] = temp[i];
    }
}

static void InheritIVs(struct Pokemon *egg, struct DayCare *daycare)
{
    u8 i;
    u8 selectedIvs[3];
    u8 availableIVs[NUM_STATS];
    u8 whichParent[ARRAY_COUNT(selectedIvs)];
    u8 iv;

    // Initialize a list of IV indices.
    for (i = 0; i < NUM_STATS; i++)
    {
        availableIVs[i] = i;
    }

    // Select the 3 IVs that will be inherited.
    for (i = 0; i < ARRAY_COUNT(selectedIvs); i++)
    {
        // Randomly pick an IV from the available list.
        selectedIvs[i] = availableIVs[Random() % (NUM_STATS - i)];

        // Remove the selected IV index from the available IV indicies.
        RemoveIVIndexFromList(availableIVs, selectedIvs[i]);
    }

    // Determine which parent each of the selected IVs should inherit from.
    for (i = 0; i < ARRAY_COUNT(selectedIvs); i++)
    {
        whichParent[i] = Random() % 2;
    }

    // Set each of inherited IVs on the egg mon.
    for (i = 0; i < ARRAY_COUNT(selectedIvs); i++)
    {
        switch (selectedIvs[i])
        {
            case 0:
                iv = GetBoxMonData(&daycare->mons[whichParent[i]], MON_DATA_HP_IV);
                SetMonData(egg, MON_DATA_HP_IV, &iv);
                break;
            case 1:
                iv = GetBoxMonData(&daycare->mons[whichParent[i]], MON_DATA_ATK_IV);
                SetMonData(egg, MON_DATA_ATK_IV, &iv);
                break;
            case 2:
                iv = GetBoxMonData(&daycare->mons[whichParent[i]], MON_DATA_DEF_IV);
                SetMonData(egg, MON_DATA_DEF_IV, &iv);
                break;
            case 3:
                iv = GetBoxMonData(&daycare->mons[whichParent[i]], MON_DATA_SPEED_IV);
                SetMonData(egg, MON_DATA_SPEED_IV, &iv);
                break;
            case 4:
                iv = GetBoxMonData(&daycare->mons[whichParent[i]], MON_DATA_SPATK_IV);
                SetMonData(egg, MON_DATA_SPATK_IV, &iv);
                break;
            case 5:
                iv = GetBoxMonData(&daycare->mons[whichParent[i]], MON_DATA_SPDEF_IV);
                SetMonData(egg, MON_DATA_SPDEF_IV, &iv);
                break;
        }
    }
}

#ifdef NONMATCHING
static
#endif
// Counts the number of egg moves a pokemon learns and stores the moves in
// the given array.
u8 GetEggMoves(struct Pokemon *pokemon, u16 *eggMoves)
{
    u16 eggMoveIdx;
    u16 numEggMoves;
    u16 species;
    u16 i;

    numEggMoves = 0;
    eggMoveIdx = 0;
    species = GetMonData(pokemon, MON_DATA_SPECIES);
    for (i = 0; i < ARRAY_COUNT(gEggMoves) - 1; i++)
    {
        if (gEggMoves[i] == species + EGG_MOVES_SPECIES_OFFSET)
        {
            eggMoveIdx = i + 1;
            break;
        }
    }

    for (i = 0; i < 10; i++)
    {
        if (gEggMoves[eggMoveIdx + i] > EGG_MOVES_SPECIES_OFFSET)
        {
            // TODO: the curly braces around this if statement are required for a matching build.
            break;
        }

        eggMoves[i] = gEggMoves[eggMoveIdx + i];
        numEggMoves++;
    }

    return numEggMoves;
}

#ifdef NONMATCHING
void BuildEggMoveset(struct Pokemon *egg, struct BoxPokemon *father, struct BoxPokemon *mother)
{
    u16 numSharedParentMoves;
    u8 numLevelUpMoves;
    u16 numEggMoves;
    u16 i, j;

    numSharedParentMoves = 0;
    for (i = 0; i < 4; i++)
    {
        gHatchedEggMotherMoves[i] = 0;
        gHatchedEggFatherMoves[i] = 0;
        gHatchedEggFinalMoves[i] = 0;
    }
    for (i = 0; i < 10; i++)
        gHatchedEggEggMoves[i] = 0;
    for (i = 0; i < 50; i++)
        gHatchedEggLevelUpMoves[i] = 0;

    numLevelUpMoves = GetLevelUpMovesBySpecies(GetMonData(egg, MON_DATA_SPECIES), gHatchedEggLevelUpMoves);
    for (i = 0; i < 4; i++)
    {
        gHatchedEggFatherMoves[i] = GetBoxMonData(father, MON_DATA_MOVE1 + i);
        gHatchedEggMotherMoves[i] = GetBoxMonData(mother, MON_DATA_MOVE1 + i);
    }

    numEggMoves = GetEggMoves(egg, gHatchedEggEggMoves);

    for (i = 0; i < 4; i++)
    {
        if (gHatchedEggFatherMoves[i] != MOVE_NONE)
        {
            for (j = 0; j < (u32)numEggMoves; j++)
            {
                if (gHatchedEggFatherMoves[i] == gHatchedEggEggMoves[j])
                {
                    if (GiveMoveToMon(egg, gHatchedEggFatherMoves[i]) == 0xffff)
                        DeleteFirstMoveAndGiveMoveToMon(egg, gHatchedEggFatherMoves[i]);
                    break;
                }
            }
        }
        else
            break;
    }
    for (i = 0; i < 4; i++)
    {
        if (gHatchedEggFatherMoves[i] != MOVE_NONE)
        {
            for (j = 0; j < NUM_TECHNICAL_MACHINES + NUM_HIDDEN_MACHINES; j++)
            {
                if (gHatchedEggFatherMoves[i] == ItemIdToBattleMoveId(ITEM_TM01_FOCUS_PUNCH + j) && CanMonLearnTMHM(egg, j))
                {
                    if (GiveMoveToMon(egg, gHatchedEggFatherMoves[i]) == 0xffff)
                        DeleteFirstMoveAndGiveMoveToMon(egg, gHatchedEggFatherMoves[i]);
                }
            }
        }
    }
    for (i = 0; i < 4; i++)
    {
        if (gHatchedEggFatherMoves[i] == MOVE_NONE)
            break;
        for (j = 0; j < 4; j++)
        {
            if (gHatchedEggFatherMoves[i] == gHatchedEggMotherMoves[j] && gHatchedEggFatherMoves[i] != MOVE_NONE)
                gHatchedEggFinalMoves[numSharedParentMoves++] = gHatchedEggFatherMoves[i];
        }
    }

    for (i = 0; i < 4; i++)
    {
        if (gHatchedEggFinalMoves[i] == MOVE_NONE)
            break;
        for (j = 0; j < numLevelUpMoves; j++)
        {
            if (gHatchedEggLevelUpMoves[j] != MOVE_NONE && gHatchedEggFinalMoves[i] == gHatchedEggLevelUpMoves[j])
            {
                if (GiveMoveToMon(egg, gHatchedEggFinalMoves[i]) == 0xffff)
                    DeleteFirstMoveAndGiveMoveToMon(egg, gHatchedEggFinalMoves[i]);
                break;
            }
        }
    }
}
#else
__attribute__((naked))
void BuildEggMoveset(struct Pokemon *egg, struct BoxPokemon *father, struct BoxPokemon *mother)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                    "\tmov r7, r10\n"
                    "\tmov r6, r9\n"
                    "\tmov r5, r8\n"
                    "\tpush {r5-r7}\n"
                    "\tsub sp, 0xC\n"
                    "\tadds r7, r0, 0\n"
                    "\tmov r10, r1\n"
                    "\tmov r9, r2\n"
                    "\tmovs r0, 0\n"
                    "\tstr r0, [sp]\n"
                    "\tmovs r6, 0\n"
                    "\tldr r5, _08041CC8 @ =gHatchedEggMotherMoves\n"
                    "\tmovs r2, 0\n"
                    "\tldr r4, _08041CCC @ =gHatchedEggFatherMoves\n"
                    "\tldr r3, _08041CD0 @ =gHatchedEggFinalMoves\n"
                    "_08041BE4:\n"
                    "\tlsls r1, r6, 1\n"
                    "\tadds r0, r1, r5\n"
                    "\tstrh r2, [r0]\n"
                    "\tadds r0, r1, r4\n"
                    "\tstrh r2, [r0]\n"
                    "\tadds r1, r3\n"
                    "\tstrh r2, [r1]\n"
                    "\tadds r0, r6, 0x1\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r6, r0, 16\n"
                    "\tcmp r6, 0x3\n"
                    "\tbls _08041BE4\n"
                    "\tmovs r6, 0\n"
                    "\tldr r2, _08041CD4 @ =gHatchedEggEggMoves\n"
                    "\tmovs r1, 0\n"
                    "_08041C02:\n"
                    "\tlsls r0, r6, 1\n"
                    "\tadds r0, r2\n"
                    "\tstrh r1, [r0]\n"
                    "\tadds r0, r6, 0x1\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r6, r0, 16\n"
                    "\tcmp r6, 0x9\n"
                    "\tbls _08041C02\n"
                    "\tmovs r6, 0\n"
                    "\tldr r2, _08041CD8 @ =gHatchedEggLevelUpMoves\n"
                    "\tmovs r1, 0\n"
                    "_08041C18:\n"
                    "\tlsls r0, r6, 1\n"
                    "\tadds r0, r2\n"
                    "\tstrh r1, [r0]\n"
                    "\tadds r0, r6, 0x1\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r6, r0, 16\n"
                    "\tcmp r6, 0x31\n"
                    "\tbls _08041C18\n"
                    "\tadds r0, r7, 0\n"
                    "\tmovs r1, 0xB\n"
                    "\tbl GetMonData\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r0, 16\n"
                    "\tldr r1, _08041CD8 @ =gHatchedEggLevelUpMoves\n"
                    "\tbl GetLevelUpMovesBySpecies\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r0, 24\n"
                    "\tstr r0, [sp, 0x4]\n"
                    "\tmovs r6, 0\n"
                    "\tldr r1, _08041CCC @ =gHatchedEggFatherMoves\n"
                    "\tmov r8, r1\n"
                    "_08041C46:\n"
                    "\tadds r5, r6, 0\n"
                    "\tadds r5, 0xD\n"
                    "\tmov r0, r10\n"
                    "\tadds r1, r5, 0\n"
                    "\tbl GetBoxMonData\n"
                    "\tlsls r4, r6, 1\n"
                    "\tmov r2, r8\n"
                    "\tadds r1, r4, r2\n"
                    "\tstrh r0, [r1]\n"
                    "\tmov r0, r9\n"
                    "\tadds r1, r5, 0\n"
                    "\tbl GetBoxMonData\n"
                    "\tldr r1, _08041CC8 @ =gHatchedEggMotherMoves\n"
                    "\tadds r4, r1\n"
                    "\tstrh r0, [r4]\n"
                    "\tadds r0, r6, 0x1\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r6, r0, 16\n"
                    "\tcmp r6, 0x3\n"
                    "\tbls _08041C46\n"
                    "\tldr r1, _08041CD4 @ =gHatchedEggEggMoves\n"
                    "\tadds r0, r7, 0\n"
                    "\tbl GetEggMoves\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r0, 24\n"
                    "\tmov r8, r0\n"
                    "\tmovs r6, 0\n"
                    "_08041C82:\n"
                    "\tldr r0, _08041CCC @ =gHatchedEggFatherMoves\n"
                    "\tlsls r1, r6, 1\n"
                    "\tadds r2, r1, r0\n"
                    "\tldrh r1, [r2]\n"
                    "\tmov r9, r0\n"
                    "\tcmp r1, 0\n"
                    "\tbeq _08041CF8\n"
                    "\tmovs r5, 0\n"
                    "\tcmp r5, r8\n"
                    "\tbcs _08041CEA\n"
                    "\tadds r4, r2, 0\n"
                    "\tldr r2, _08041CDC @ =0x0000ffff\n"
                    "_08041C9A:\n"
                    "\tldr r0, _08041CD4 @ =gHatchedEggEggMoves\n"
                    "\tlsls r1, r5, 1\n"
                    "\tadds r1, r0\n"
                    "\tldrh r0, [r4]\n"
                    "\tldrh r1, [r1]\n"
                    "\tcmp r0, r1\n"
                    "\tbne _08041CE0\n"
                    "\tadds r1, r0, 0\n"
                    "\tadds r0, r7, 0\n"
                    "\tstr r2, [sp, 0x8]\n"
                    "\tbl GiveMoveToMon\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r0, 16\n"
                    "\tldr r2, [sp, 0x8]\n"
                    "\tcmp r0, r2\n"
                    "\tbne _08041CEA\n"
                    "\tldrh r1, [r4]\n"
                    "\tadds r0, r7, 0\n"
                    "\tbl DeleteFirstMoveAndGiveMoveToMon\n"
                    "\tb _08041CEA\n"
                    "\t.align 2, 0\n"
                    "_08041CC8: .4byte gHatchedEggMotherMoves\n"
                    "_08041CCC: .4byte gHatchedEggFatherMoves\n"
                    "_08041CD0: .4byte gHatchedEggFinalMoves\n"
                    "_08041CD4: .4byte gHatchedEggEggMoves\n"
                    "_08041CD8: .4byte gHatchedEggLevelUpMoves\n"
                    "_08041CDC: .4byte 0x0000ffff\n"
                    "_08041CE0:\n"
                    "\tadds r0, r5, 0x1\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r5, r0, 16\n"
                    "\tcmp r5, r8\n"
                    "\tbcc _08041C9A\n"
                    "_08041CEA:\n"
                    "\tadds r0, r6, 0x1\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r6, r0, 16\n"
                    "\tldr r3, _08041E14 @ =gHatchedEggFatherMoves\n"
                    "\tmov r9, r3\n"
                    "\tcmp r6, 0x3\n"
                    "\tbls _08041C82\n"
                    "_08041CF8:\n"
                    "\tmovs r6, 0\n"
                    "_08041CFA:\n"
                    "\tlsls r0, r6, 1\n"
                    "\tmov r2, r9\n"
                    "\tadds r1, r0, r2\n"
                    "\tldrh r1, [r1]\n"
                    "\tadds r2, r0, 0\n"
                    "\tadds r6, 0x1\n"
                    "\tmov r8, r6\n"
                    "\tcmp r1, 0\n"
                    "\tbeq _08041D5C\n"
                    "\tmovs r5, 0\n"
                    "\tldr r0, _08041E14 @ =gHatchedEggFatherMoves\n"
                    "\tadds r4, r2, r0\n"
                    "\tldr r6, _08041E18 @ =0x0000ffff\n"
                    "\tmov r9, r0\n"
                    "_08041D16:\n"
                    "\tldr r3, _08041E1C @ =0x00000121\n"
                    "\tadds r0, r5, r3\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r0, 16\n"
                    "\tbl ItemIdToBattleMoveId\n"
                    "\tldrh r1, [r4]\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r0, 16\n"
                    "\tcmp r1, r0\n"
                    "\tbne _08041D52\n"
                    "\tlsls r1, r5, 24\n"
                    "\tlsrs r1, 24\n"
                    "\tadds r0, r7, 0\n"
                    "\tbl CanMonLearnTMHM\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _08041D52\n"
                    "\tldrh r1, [r4]\n"
                    "\tadds r0, r7, 0\n"
                    "\tbl GiveMoveToMon\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r0, 16\n"
                    "\tcmp r0, r6\n"
                    "\tbne _08041D52\n"
                    "\tldrh r1, [r4]\n"
                    "\tadds r0, r7, 0\n"
                    "\tbl DeleteFirstMoveAndGiveMoveToMon\n"
                    "_08041D52:\n"
                    "\tadds r0, r5, 0x1\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r5, r0, 16\n"
                    "\tcmp r5, 0x39\n"
                    "\tbls _08041D16\n"
                    "_08041D5C:\n"
                    "\tmov r1, r8\n"
                    "\tlsls r0, r1, 16\n"
                    "\tlsrs r6, r0, 16\n"
                    "\tcmp r6, 0x3\n"
                    "\tbls _08041CFA\n"
                    "\tmovs r6, 0\n"
                    "\tmov r2, r9\n"
                    "\tldrh r0, [r2]\n"
                    "\tldr r3, _08041E20 @ =gHatchedEggFinalMoves\n"
                    "\tmov r10, r3\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _08041DC6\n"
                    "\tmov r4, r9\n"
                    "\tldr r0, _08041E24 @ =gHatchedEggMotherMoves\n"
                    "\tmov r9, r0\n"
                    "\tmov r12, r10\n"
                    "_08041D7C:\n"
                    "\tmovs r5, 0\n"
                    "\tlsls r2, r6, 1\n"
                    "\tadds r6, 0x1\n"
                    "\tmov r8, r6\n"
                    "\tadds r3, r2, r4\n"
                    "_08041D86:\n"
                    "\tlsls r0, r5, 1\n"
                    "\tadd r0, r9\n"
                    "\tldrh r2, [r3]\n"
                    "\tadds r1, r2, 0\n"
                    "\tldrh r0, [r0]\n"
                    "\tcmp r1, r0\n"
                    "\tbne _08041DA8\n"
                    "\tcmp r1, 0\n"
                    "\tbeq _08041DA8\n"
                    "\tldr r1, [sp]\n"
                    "\tadds r0, r1, 0x1\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r0, 16\n"
                    "\tstr r0, [sp]\n"
                    "\tlsls r1, 1\n"
                    "\tadd r1, r12\n"
                    "\tstrh r2, [r1]\n"
                    "_08041DA8:\n"
                    "\tadds r0, r5, 0x1\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r5, r0, 16\n"
                    "\tcmp r5, 0x3\n"
                    "\tbls _08041D86\n"
                    "\tmov r1, r8\n"
                    "\tlsls r0, r1, 16\n"
                    "\tlsrs r6, r0, 16\n"
                    "\tcmp r6, 0x3\n"
                    "\tbhi _08041DC6\n"
                    "\tlsls r0, r6, 1\n"
                    "\tadds r0, r4\n"
                    "\tldrh r0, [r0]\n"
                    "\tcmp r0, 0\n"
                    "\tbne _08041D7C\n"
                    "_08041DC6:\n"
                    "\tmovs r6, 0\n"
                    "\tmov r2, r10\n"
                    "\tldrh r0, [r2]\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _08041E50\n"
                    "_08041DD0:\n"
                    "\tmovs r5, 0\n"
                    "\tadds r3, r6, 0x1\n"
                    "\tmov r8, r3\n"
                    "\tldr r0, [sp, 0x4]\n"
                    "\tcmp r5, r0\n"
                    "\tbcs _08041E38\n"
                    "\tldr r2, _08041E18 @ =0x0000ffff\n"
                    "_08041DDE:\n"
                    "\tldr r1, _08041E28 @ =gHatchedEggLevelUpMoves\n"
                    "\tlsls r0, r5, 1\n"
                    "\tadds r0, r1\n"
                    "\tldrh r1, [r0]\n"
                    "\tcmp r1, 0\n"
                    "\tbeq _08041E2C\n"
                    "\tlsls r0, r6, 1\n"
                    "\tmov r3, r10\n"
                    "\tadds r4, r0, r3\n"
                    "\tldrh r0, [r4]\n"
                    "\tcmp r0, r1\n"
                    "\tbne _08041E2C\n"
                    "\tadds r1, r0, 0\n"
                    "\tadds r0, r7, 0\n"
                    "\tstr r2, [sp, 0x8]\n"
                    "\tbl GiveMoveToMon\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r0, 16\n"
                    "\tldr r2, [sp, 0x8]\n"
                    "\tcmp r0, r2\n"
                    "\tbne _08041E38\n"
                    "\tldrh r1, [r4]\n"
                    "\tadds r0, r7, 0\n"
                    "\tbl DeleteFirstMoveAndGiveMoveToMon\n"
                    "\tb _08041E38\n"
                    "\t.align 2, 0\n"
                    "_08041E14: .4byte gHatchedEggFatherMoves\n"
                    "_08041E18: .4byte 0x0000ffff\n"
                    "_08041E1C: .4byte 0x00000121\n"
                    "_08041E20: .4byte gHatchedEggFinalMoves\n"
                    "_08041E24: .4byte gHatchedEggMotherMoves\n"
                    "_08041E28: .4byte gHatchedEggLevelUpMoves\n"
                    "_08041E2C:\n"
                    "\tadds r0, r5, 0x1\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r5, r0, 16\n"
                    "\tldr r0, [sp, 0x4]\n"
                    "\tcmp r5, r0\n"
                    "\tbcc _08041DDE\n"
                    "_08041E38:\n"
                    "\tmov r1, r8\n"
                    "\tlsls r0, r1, 16\n"
                    "\tlsrs r6, r0, 16\n"
                    "\tcmp r6, 0x3\n"
                    "\tbhi _08041E50\n"
                    "\tldr r0, _08041E60 @ =gHatchedEggFinalMoves\n"
                    "\tlsls r1, r6, 1\n"
                    "\tadds r1, r0\n"
                    "\tldrh r1, [r1]\n"
                    "\tmov r10, r0\n"
                    "\tcmp r1, 0\n"
                    "\tbne _08041DD0\n"
                    "_08041E50:\n"
                    "\tadd sp, 0xC\n"
                    "\tpop {r3-r5}\n"
                    "\tmov r8, r3\n"
                    "\tmov r9, r4\n"
                    "\tmov r10, r5\n"
                    "\tpop {r4-r7}\n"
                    "\tpop {r0}\n"
                    "\tbx r0\n"
                    "\t.align 2, 0\n"
                    "_08041E60: .4byte gHatchedEggFinalMoves");
}
#endif

static void RemoveEggFromDayCare(struct DayCare *daycare)
{
    daycare->misc.countersEtc.pendingEggPersonality = 0;
    daycare->misc.countersEtc.eggCycleStepsRemaining = 0;
}

void RejectEggFromDayCare(void)
{
    RemoveEggFromDayCare(&gSaveBlock1.daycare);
}

static void AlterEggSpeciesWithIncenseItem(u16 *species, struct DayCare *daycare)
{
    u16 motherItem, fatherItem;
    if (*species == SPECIES_WYNAUT || *species == SPECIES_AZURILL)
    {
        motherItem = GetBoxMonData(&daycare->mons[0], MON_DATA_HELD_ITEM);
        fatherItem = GetBoxMonData(&daycare->mons[1], MON_DATA_HELD_ITEM);
        if (*species == SPECIES_WYNAUT && motherItem != ITEM_LAX_INCENSE && fatherItem != ITEM_LAX_INCENSE)
        {
            *species = SPECIES_WOBBUFFET;
        }

        if (*species == SPECIES_AZURILL && motherItem != ITEM_SEA_INCENSE && fatherItem != ITEM_SEA_INCENSE)
        {
            *species = SPECIES_MARILL;
        }
    }
}

static u16 DetermineEggSpeciesAndParentSlots(struct DayCare *daycare, u8 *parentSlots)
{
    u16 i;
    u16 species[2];
    u16 eggSpecies;

    // Determine which of the daycare mons is the mother and father of the egg.
    // The 0th index of the parentSlots array is considered the mother slot, and the
    // 1st index is the father slot.
    for (i = 0; i < 2; i++)
    {
        species[i] = GetBoxMonData(&daycare->mons[i], MON_DATA_SPECIES);
        if (species[i] == SPECIES_DITTO)
        {
            parentSlots[0] = i ^ 1;
            parentSlots[1] = i;
        }
        else if (GetBoxMonGender(&daycare->mons[i]) == MON_FEMALE)
        {
            parentSlots[0] = i;
            parentSlots[1] = i ^ 1;
        }
    }

    eggSpecies = GetEggSpecies(species[parentSlots[0]]);
    if (eggSpecies == SPECIES_NIDORAN_F && daycare->misc.countersEtc.pendingEggPersonality & 0x8000)
    {
        eggSpecies = SPECIES_NIDORAN_M;
    }
    if (eggSpecies == SPECIES_ILLUMISE && daycare->misc.countersEtc.pendingEggPersonality & 0x8000)
    {
        eggSpecies = SPECIES_VOLBEAT;
    }

    // Make Ditto the "mother" slot if the other daycare mon is male.
    if (species[parentSlots[1]] == SPECIES_DITTO && GetBoxMonGender(&daycare->mons[parentSlots[0]]) != MON_FEMALE)
    {
        u8 temp = parentSlots[1];
        parentSlots[1] = parentSlots[0];
        parentSlots[0] = temp;
    }

    return eggSpecies;
}

static void _GiveEggFromDaycare(struct DayCare *daycare) // give_egg
{
    struct Pokemon egg;
    u16 species;
    u8 parentSlots[2]; // 0th index is "mother" daycare slot, 1st is "father"
    u8 isEgg;

    species = DetermineEggSpeciesAndParentSlots(daycare, parentSlots);
    AlterEggSpeciesWithIncenseItem(&species, daycare);
    SetInitialEggData(&egg, species, daycare);
    InheritIVs(&egg, daycare);
    BuildEggMoveset(&egg, &daycare->mons[parentSlots[1]], &daycare->mons[parentSlots[0]]);
    isEgg = TRUE;
    SetMonData(&egg, MON_DATA_IS_EGG, &isEgg);
    gPlayerParty[5] = egg;
    party_compaction();
    CalculatePlayerPartyCount();
    RemoveEggFromDayCare(daycare);
}


void CreateEgg(struct Pokemon *mon, u16 species, bool8 setMetLocation)
{
    u8 metLevel;
    u16 ball;
    u8 language;
    u8 metLocation;
    u8 isEgg;

    CreateMon(mon, species, 5, 0x20, FALSE, 0, FALSE, 0);
    metLevel = 0;
    ball = ITEM_POKE_BALL;
    language = LANGUAGE_JAPANESE;
    SetMonData(mon, MON_DATA_POKEBALL, &ball);
    SetMonData(mon, MON_DATA_NICKNAME, sJapaneseEggNickname);
    SetMonData(mon, MON_DATA_FRIENDSHIP, &gBaseStats[species].eggCycles);
    SetMonData(mon, MON_DATA_MET_LEVEL, &metLevel);
    SetMonData(mon, MON_DATA_LANGUAGE, &language);
    if (setMetLocation)
    {
        metLocation = 253; // hot springs; see PokemonSummaryScreen_PrintEggTrainerMemo
        SetMonData(mon, MON_DATA_MET_LOCATION, &metLocation);
    }

    isEgg = TRUE;
    SetMonData(mon, MON_DATA_IS_EGG, &isEgg);
}

static void SetInitialEggData(struct Pokemon *mon, u16 species, struct DayCare *daycare)
{
    u32 personality;
    u16 ball;
    u8 metLevel;
    u8 language;

    personality = daycare->misc.countersEtc.pendingEggPersonality | (Random() << 16);
    CreateMon(mon, species, 5, 0x20, TRUE, personality, FALSE, 0);
    metLevel = 0;
    ball = ITEM_POKE_BALL;
    language = LANGUAGE_JAPANESE;
    SetMonData(mon, MON_DATA_POKEBALL, &ball);
    SetMonData(mon, MON_DATA_NICKNAME, sJapaneseEggNickname);
    SetMonData(mon, MON_DATA_FRIENDSHIP, &gBaseStats[species].eggCycles);
    SetMonData(mon, MON_DATA_MET_LEVEL, &metLevel);
    SetMonData(mon, MON_DATA_LANGUAGE, &language);
}

void GiveEggFromDaycare(void)
{
    _GiveEggFromDaycare(&gSaveBlock1.daycare);
}

#ifdef NONMATCHING
static bool8 _ShouldEggHatch(struct DayCare *daycare)
{
    struct BoxPokemon *parent;
    u32 i;
    int v0;
    int steps;
    v0 = 0;
    for (i=0, parent=&daycare->mons[0]; i<2; parent++, i++)
    {
        if (GetBoxMonData(parent, MON_DATA_SANITY_BIT2, v0))
        {
            daycare->misc.countersEtc.steps[i]++;
            v0++;
        }
    }
    if (daycare->misc.countersEtc.pendingEggPersonality == 0 && v0 == 2 && daycare->misc.extra.misc[4] == 0xff && GetDaycareCompatibilityScore(daycare) > (u32)((u32)(Random() * 100) / 0xffff))
    {
        TriggerPendingDaycareEgg();
    }
    if ((++daycare->misc.countersEtc.eggCycleStepsRemaining) == 0xff)
    {
        for (i=0; i<gPlayerPartyCount; i++)
        {
            if (GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG))
            {
                steps = GetMonData(&gPlayerParty[i], MON_DATA_FRIENDSHIP);
                if (steps == 0)
                {
                    gSpecialVar_0x8004 = i;
                    return TRUE;
                }
                steps--;
                SetMonData(&gPlayerParty[i], MON_DATA_FRIENDSHIP, &steps);
            }
        }
    }
    return FALSE;
}
#else
__attribute__((naked))
static bool8 _ShouldEggHatch(struct DayCare *daycare)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                    "\tsub sp, 0x8\n"
                    "\tadds r7, r0, 0\n"
                    "\tmovs r2, 0\n"
                    "\tmovs r6, 0\n"
                    "\tadds r5, r7, 0\n"
                    "_080421BC:\n"
                    "\tlsls r4, r6, 2\n"
                    "\tadds r0, r5, 0\n"
                    "\tmovs r1, 0x5\n"
                    "\tstr r2, [sp, 0x4]\n"
                    "\tbl GetBoxMonData\n"
                    "\tldr r2, [sp, 0x4]\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _080421DE\n"
                    "\tmovs r0, 0x88\n"
                    "\tlsls r0, 1\n"
                    "\tadds r1, r7, r0\n"
                    "\tadds r1, r4\n"
                    "\tldr r0, [r1]\n"
                    "\tadds r0, 0x1\n"
                    "\tstr r0, [r1]\n"
                    "\tadds r2, 0x1\n"
                    "_080421DE:\n"
                    "\tadds r5, 0x50\n"
                    "\tadds r6, 0x1\n"
                    "\tcmp r6, 0x1\n"
                    "\tbls _080421BC\n"
                    "\tmovs r1, 0x8C\n"
                    "\tlsls r1, 1\n"
                    "\tadds r0, r7, r1\n"
                    "\tldrh r0, [r0]\n"
                    "\tcmp r0, 0\n"
                    "\tbne _08042226\n"
                    "\tcmp r2, 0x2\n"
                    "\tbne _08042226\n"
                    "\tsubs r1, 0x4\n"
                    "\tadds r0, r7, r1\n"
                    "\tldrb r0, [r0]\n"
                    "\tcmp r0, 0xFF\n"
                    "\tbne _08042226\n"
                    "\tadds r0, r7, 0\n"
                    "\tbl GetDaycareCompatibilityScore\n"
                    "\tadds r4, r0, 0\n"
                    "\tlsls r4, 24\n"
                    "\tlsrs r4, 24\n"
                    "\tbl Random\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r0, 16\n"
                    "\tmovs r1, 0x64\n"
                    "\tmuls r0, r1\n"
                    "\tldr r1, _08042240 @ =0x0000ffff\n"
                    "\tbl __udivsi3\n"
                    "\tcmp r4, r0\n"
                    "\tbls _08042226\n"
                    "\tbl TriggerPendingDaycareEgg\n"
                    "_08042226:\n"
                    "\tmovs r0, 0x8D\n"
                    "\tlsls r0, 1\n"
                    "\tadds r1, r7, r0\n"
                    "\tldrb r0, [r1]\n"
                    "\tadds r0, 0x1\n"
                    "\tstrb r0, [r1]\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r0, 24\n"
                    "\tcmp r0, 0xFF\n"
                    "\tbne _08042290\n"
                    "\tmovs r6, 0\n"
                    "\tb _08042288\n"
                    "\t.align 2, 0\n"
                    "_08042240: .4byte 0x0000ffff\n"
                    "_08042244:\n"
                    "\tmovs r0, 0x64\n"
                    "\tadds r1, r6, 0\n"
                    "\tmuls r1, r0\n"
                    "\tldr r0, _08042270 @ =gPlayerParty\n"
                    "\tadds r4, r1, r0\n"
                    "\tadds r0, r4, 0\n"
                    "\tmovs r1, 0x2D\n"
                    "\tbl GetMonData\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _08042286\n"
                    "\tadds r0, r4, 0\n"
                    "\tmovs r1, 0x20\n"
                    "\tbl GetMonData\n"
                    "\tstr r0, [sp]\n"
                    "\tcmp r0, 0\n"
                    "\tbne _08042278\n"
                    "\tldr r0, _08042274 @ =gSpecialVar_0x8004\n"
                    "\tstrh r6, [r0]\n"
                    "\tmovs r0, 0x1\n"
                    "\tb _08042292\n"
                    "\t.align 2, 0\n"
                    "_08042270: .4byte gPlayerParty\n"
                    "_08042274: .4byte gSpecialVar_0x8004\n"
                    "_08042278:\n"
                    "\tsubs r0, 0x1\n"
                    "\tstr r0, [sp]\n"
                    "\tadds r0, r4, 0\n"
                    "\tmovs r1, 0x20\n"
                    "\tmov r2, sp\n"
                    "\tbl SetMonData\n"
                    "_08042286:\n"
                    "\tadds r6, 0x1\n"
                    "_08042288:\n"
                    "\tldr r0, _0804229C @ =gPlayerPartyCount\n"
                    "\tldrb r0, [r0]\n"
                    "\tcmp r6, r0\n"
                    "\tbcc _08042244\n"
                    "_08042290:\n"
                    "\tmovs r0, 0\n"
                    "_08042292:\n"
                    "\tadd sp, 0x8\n"
                    "\tpop {r4-r7}\n"
                    "\tpop {r1}\n"
                    "\tbx r1\n"
                    "\t.align 2, 0\n"
                    "_0804229C: .4byte gPlayerPartyCount");
}
#endif

bool8 ShouldEggHatch(void)
{
    return _ShouldEggHatch(&gSaveBlock1.daycare);
}

static bool8 IsEggPending(struct DayCare *daycare)
{
    return (u32)((-daycare->misc.countersEtc.pendingEggPersonality) | daycare->misc.countersEtc.pendingEggPersonality) >> 31;
}

static void _GetDaycareMonNicknames(struct DayCare *daycare)
{
    u8 language;
    if (GetBoxMonData(&daycare->mons[0], MON_DATA_SPECIES) != 0)
    {
        GetBoxMonNick(&daycare->mons[0], gStringVar1);
        language = GetBoxMonData(&daycare->mons[0], MON_DATA_LANGUAGE);
        GetBoxMonData(&daycare->mons[0], MON_DATA_OT_NAME, gStringVar3);
        ConvertInternationalString(gStringVar3, language);
    }

    if (GetBoxMonData(&daycare->mons[1], MON_DATA_SPECIES) != 0)
    {
        GetBoxMonNick(&daycare->mons[1], gStringVar2);
    }
}

u16 GetSelectedDaycareMonNickname(void)
{
    GetBoxMonNick(&gPlayerParty[gLastFieldPokeMenuOpened].box, gStringVar1);
    return GetBoxMonData(&gPlayerParty[gLastFieldPokeMenuOpened].box, MON_DATA_SPECIES);
}

void GetDaycareMonNicknames(void)
{
    _GetDaycareMonNicknames(&gSaveBlock1.daycare);
}

u8 GetDaycareState(void)
{
    // The daycare can be in 4 possible states:
    //   0: default state--no deposited mons, no egg
    //   1: there is an egg waiting for the player to pick it up
    //   2: there is a single pokemon in the daycare
    //   3: there are two pokemon in the daycare, no egg

    u8 numMons;
    if (IsEggPending(&gSaveBlock1.daycare))
    {
        // There is an Egg waiting for the player.
        return 1;
    }

    numMons = CountPokemonInDaycare(&gSaveBlock1.daycare);
    if (numMons != 0)
    {
        return numMons + 1;
    }

    return 0;
}

#ifdef NONMATCHING
static
#endif
bool8 EggGroupsOverlap(u16 *eggGroups1, u16 *eggGroups2)
{
    // Determine if the two given egg group lists contain any of the
    // same egg groups.
    s32 i, j;
    u16 *v0, *v1, v2;

    for (i = 0, v0 = eggGroups1; i < 2; v0++, i++)
    {
        for (j = 0, v2 = *v0, v1 = eggGroups2; j < 2; v1++, j++)
        {
            if (v2 == *v1)
            {
                return TRUE;
            }
        }
    }

    return FALSE;
}

#ifdef NONMATCHING
static u8 GetDaycareCompatibilityScore(struct DayCare *daycare)
{
    u16 species[2];
    u32 otIds[2];
    u32 genders[2];
    u16 eggGroups[2][2];
    int i;
    u16 *spc;
    u32 *ids;
    u32 *gnd;
    u16 *egg1;
    u16 *egg2;
    struct BoxPokemon *parent;

    for (i=0, parent=&daycare->mons[0], spc=species, ids=otIds, gnd=genders, egg1=&eggGroups[0][0], egg2=&eggGroups[0][1]; i<2; spc++, egg1+=2, egg2+=2, parent++, i++)
    {
        *spc = GetBoxMonData(parent, MON_DATA_SPECIES);
        *ids++ = GetBoxMonData(parent, MON_DATA_OT_ID);
        *gnd++ = GetGenderFromSpeciesAndPersonality(*spc, GetBoxMonData(parent, MON_DATA_PERSONALITY));
        *egg1 = gBaseStats[*spc].eggGroup1;
        *egg2 = gBaseStats[*spc].eggGroup2;
    }
    if (eggGroups[0][0] == 0xf)
    {
        return 0;
    }
    if (eggGroups[1][0] == 0xf)
    {
        return 0;
    }
    if (eggGroups[0][0] == 0xd && eggGroups[1][0] == 0xd)
    {
        return 0;
    }
    else if (eggGroups[0][0] == 0xd || eggGroups[1][0] == 0xd)
    {
        if (otIds[0] == otIds[1])
        {
            return 20;
        }
        return 50;
    }
    if (genders[0] == genders[1] || genders[0] == MON_GENDERLESS || genders[1] == MON_GENDERLESS)
    {
        return 0;
    }
    if (!EggGroupsOverlap(eggGroups[0], eggGroups[1]))
    {
        return 0;
    }
    if (species[0] == species[1])
    {
        if (otIds[0] == otIds[1])
        {
            return 50;
        }
        return 70;
    }
    else
    {
        if (otIds[0] != otIds[1])
        {
            return 50;
        }
        return 20;
    }
}
#else
__attribute__((naked))
static u8 GetDaycareCompatibilityScore(struct DayCare *daycare)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                    "\tmov r7, r10\n"
                    "\tmov r6, r9\n"
                    "\tmov r5, r8\n"
                    "\tpush {r5-r7}\n"
                    "\tsub sp, 0x2C\n"
                    "\tmovs r1, 0\n"
                    "\tmov r8, r1\n"
                    "\tmov r2, sp\n"
                    "\tadds r2, 0x8\n"
                    "\tstr r2, [sp, 0x1C]\n"
                    "\tadd r1, sp, 0xC\n"
                    "\tmov r10, r1\n"
                    "\tadds r2, 0xC\n"
                    "\tstr r2, [sp, 0x20]\n"
                    "\tmov r1, sp\n"
                    "\tadds r1, 0x2\n"
                    "\tldr r2, _08042488 @ =gBaseStats\n"
                    "\tmov r9, r2\n"
                    "\tldr r5, [sp, 0x1C]\n"
                    "\tadds r7, r1, 0\n"
                    "\tmov r6, sp\n"
                    "\tldr r1, [sp, 0x20]\n"
                    "\tstr r1, [sp, 0x24]\n"
                    "\tmov r2, r10\n"
                    "\tstr r2, [sp, 0x28]\n"
                    "\tadds r4, r0, 0\n"
                    "_0804240E:\n"
                    "\tadds r0, r4, 0\n"
                    "\tmovs r1, 0xB\n"
                    "\tbl GetBoxMonData\n"
                    "\tstrh r0, [r5]\n"
                    "\tadds r0, r4, 0\n"
                    "\tmovs r1, 0x1\n"
                    "\tbl GetBoxMonData\n"
                    "\tldr r1, [sp, 0x28]\n"
                    "\tstm r1!, {r0}\n"
                    "\tstr r1, [sp, 0x28]\n"
                    "\tadds r0, r4, 0\n"
                    "\tmovs r1, 0\n"
                    "\tbl GetBoxMonData\n"
                    "\tadds r1, r0, 0\n"
                    "\tldrh r0, [r5]\n"
                    "\tbl GetGenderFromSpeciesAndPersonality\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r0, 24\n"
                    "\tldr r2, [sp, 0x24]\n"
                    "\tstm r2!, {r0}\n"
                    "\tstr r2, [sp, 0x24]\n"
                    "\tldrh r1, [r5]\n"
                    "\tlsls r0, r1, 3\n"
                    "\tsubs r0, r1\n"
                    "\tlsls r0, 2\n"
                    "\tadd r0, r9\n"
                    "\tldrb r0, [r0, 0x14]\n"
                    "\tstrh r0, [r6]\n"
                    "\tldrh r1, [r5]\n"
                    "\tlsls r0, r1, 3\n"
                    "\tsubs r0, r1\n"
                    "\tlsls r0, 2\n"
                    "\tadd r0, r9\n"
                    "\tldrb r0, [r0, 0x15]\n"
                    "\tstrh r0, [r7]\n"
                    "\tadds r5, 0x2\n"
                    "\tadds r7, 0x4\n"
                    "\tadds r6, 0x4\n"
                    "\tadds r4, 0x50\n"
                    "\tmovs r0, 0x1\n"
                    "\tadd r8, r0\n"
                    "\tmov r1, r8\n"
                    "\tcmp r1, 0x1\n"
                    "\tbls _0804240E\n"
                    "\tmov r0, sp\n"
                    "\tldrh r1, [r0]\n"
                    "\tcmp r1, 0xF\n"
                    "\tbeq _08042484\n"
                    "\tldrh r0, [r0, 0x4]\n"
                    "\tcmp r0, 0xF\n"
                    "\tbeq _08042484\n"
                    "\tcmp r1, 0xD\n"
                    "\tbne _0804248C\n"
                    "\tcmp r0, 0xD\n"
                    "\tbne _08042490\n"
                    "_08042484:\n"
                    "\tmovs r0, 0\n"
                    "\tb _080424E4\n"
                    "\t.align 2, 0\n"
                    "_08042488: .4byte gBaseStats\n"
                    "_0804248C:\n"
                    "\tcmp r0, 0xD\n"
                    "\tbne _0804249C\n"
                    "_08042490:\n"
                    "\tldr r1, [sp, 0xC]\n"
                    "\tmov r2, r10\n"
                    "\tldr r0, [r2, 0x4]\n"
                    "\tcmp r1, r0\n"
                    "\tbeq _080424DE\n"
                    "\tb _080424E2\n"
                    "_0804249C:\n"
                    "\tldr r0, [sp, 0x14]\n"
                    "\tldr r2, [sp, 0x20]\n"
                    "\tldr r1, [r2, 0x4]\n"
                    "\tcmp r0, r1\n"
                    "\tbeq _08042484\n"
                    "\tcmp r0, 0xFF\n"
                    "\tbeq _08042484\n"
                    "\tcmp r1, 0xFF\n"
                    "\tbeq _08042484\n"
                    "\tadd r1, sp, 0x4\n"
                    "\tmov r0, sp\n"
                    "\tbl EggGroupsOverlap\n"
                    "\tlsls r0, 24\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _08042484\n"
                    "\tldr r0, [sp, 0x1C]\n"
                    "\tldrh r1, [r0, 0x2]\n"
                    "\tldrh r0, [r0]\n"
                    "\tcmp r0, r1\n"
                    "\tbne _080424D4\n"
                    "\tldr r1, [sp, 0xC]\n"
                    "\tmov r2, r10\n"
                    "\tldr r0, [r2, 0x4]\n"
                    "\tcmp r1, r0\n"
                    "\tbeq _080424E2\n"
                    "\tmovs r0, 0x46\n"
                    "\tb _080424E4\n"
                    "_080424D4:\n"
                    "\tldr r1, [sp, 0xC]\n"
                    "\tmov r2, r10\n"
                    "\tldr r0, [r2, 0x4]\n"
                    "\tcmp r1, r0\n"
                    "\tbne _080424E2\n"
                    "_080424DE:\n"
                    "\tmovs r0, 0x14\n"
                    "\tb _080424E4\n"
                    "_080424E2:\n"
                    "\tmovs r0, 0x32\n"
                    "_080424E4:\n"
                    "\tadd sp, 0x2C\n"
                    "\tpop {r3-r5}\n"
                    "\tmov r8, r3\n"
                    "\tmov r9, r4\n"
                    "\tmov r10, r5\n"
                    "\tpop {r4-r7}\n"
                    "\tpop {r1}\n"
                    "\tbx r1");
}
#endif

u8 GetDaycareCompatibilityScoreFromSave(void)
{
    return GetDaycareCompatibilityScore(&gSaveBlock1.daycare);
}

void SetDaycareCompatibilityString(void)
{
    u8 whichString;
    u8 relationshipScore;

    relationshipScore = GetDaycareCompatibilityScoreFromSave();
    whichString = 0;
    if (relationshipScore == 0)
        whichString = 3;
    if (relationshipScore == 20)
        whichString = 2;
    if (relationshipScore == 50)
        whichString = 1;
    if (relationshipScore == 70)
        whichString = 0;

    StringCopy(gStringVar4, sCompatibilityMessages[whichString]);
}

#ifdef NONMATCHING
bool8 NameHasGenderSymbol(const u8 *name, u8 genderRatio)
{
    u8 i;
    u8 flags[2];

    // This portion is nonmatching
    flags[1] = 0;
    flags[0] = 0;
    for (i = 0; name[i] != EOS; i++)
    // End nonmatching portion

    {
        if (name[i] == CHAR_MALE) flags[0]++;
        if (name[i] == CHAR_FEMALE) flags[1]++;
    }
    if (genderRatio == MON_MALE && flags[0] && !flags[1]) return TRUE;
    if (genderRatio == MON_FEMALE && flags[1] && !flags[0]) return TRUE;
    return FALSE;
}
#else
__attribute__((naked))
bool8 NameHasGenderSymbol(const u8 *name, u8 genderRatio)
{
    asm_unified("\n"
                    "\tpush {r4,r5,lr}\n"
                    "\tsub sp, 0x4\n"
                    "\tadds r4, r0, 0\n"
                    "\tlsls r1, 24\n"
                    "\tlsrs r5, r1, 24\n"
                    "\tmov r2, sp\n"
                    "\tmov r1, sp\n"
                    "\tmovs r0, 0\n"
                    "\tstrb r0, [r1, 0x1]\n"
                    "\tstrb r0, [r2]\n"
                    "\tmovs r3, 0\n"
                    "\tldrb r0, [r4]\n"
                    "\tcmp r0, 0xFF\n"
                    "\tbeq _0804258C\n"
                    "_08042564:\n"
                    "\tadds r1, r4, r3\n"
                    "\tldrb r0, [r1]\n"
                    "\tcmp r0, 0xB5\n"
                    "\tbne _08042572\n"
                    "\tldrb r0, [r2]\n"
                    "\tadds r0, 0x1\n"
                    "\tstrb r0, [r2]\n"
                    "_08042572:\n"
                    "\tldrb r0, [r1]\n"
                    "\tcmp r0, 0xB6\n"
                    "\tbne _0804257E\n"
                    "\tldrb r0, [r2, 0x1]\n"
                    "\tadds r0, 0x1\n"
                    "\tstrb r0, [r2, 0x1]\n"
                    "_0804257E:\n"
                    "\tadds r0, r3, 0x1\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r3, r0, 24\n"
                    "\tadds r0, r4, r3\n"
                    "\tldrb r0, [r0]\n"
                    "\tcmp r0, 0xFF\n"
                    "\tbne _08042564\n"
                    "_0804258C:\n"
                    "\tcmp r5, 0\n"
                    "\tbne _080425A0\n"
                    "\tmov r0, sp\n"
                    "\tldrb r0, [r0]\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _080425A0\n"
                    "\tmov r0, sp\n"
                    "\tldrb r0, [r0, 0x1]\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _080425B4\n"
                    "_080425A0:\n"
                    "\tcmp r5, 0xFE\n"
                    "\tbne _080425B8\n"
                    "\tmov r0, sp\n"
                    "\tldrb r0, [r0, 0x1]\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _080425B8\n"
                    "\tmov r0, sp\n"
                    "\tldrb r0, [r0]\n"
                    "\tcmp r0, 0\n"
                    "\tbne _080425B8\n"
                    "_080425B4:\n"
                    "\tmovs r0, 0x1\n"
                    "\tb _080425BA\n"
                    "_080425B8:\n"
                    "\tmovs r0, 0\n"
                    "_080425BA:\n"
                    "\tadd sp, 0x4\n"
                    "\tpop {r4,r5}\n"
                    "\tpop {r1}\n"
                    "\tbx r1");
}
#endif

static u8 *AppendGenderSymbol(u8 *name, u8 gender)
{
    if (gender == MON_MALE)
    {
        if (!NameHasGenderSymbol(name, MON_MALE))
            return StringAppend(name, gOtherText_MaleSymbol3);
    }
    else if (gender == MON_FEMALE)
    {
        if (!NameHasGenderSymbol(name, MON_FEMALE))
            return StringAppend(name, gOtherText_FemaleSymbol3);
    }

    return StringAppend(name, gOtherText_GenderlessSymbol);
}

static u8 *AppendMonGenderSymbol(u8 *name, struct BoxPokemon *boxMon)
{
    return AppendGenderSymbol(name, GetBoxMonGender(boxMon));
}

static void GetDaycareLevelMenuText(struct DayCare *daycare, u8 *dest)
{
    u8 monNames[2][20];
    u8 i;

    *dest = EOS;
    for (i = 0; i < 2; i++)
    {
        GetBoxMonNick(&daycare->mons[i], monNames[i]);
        AppendMonGenderSymbol(monNames[i], &daycare->mons[i]);
    }

    StringCopy(dest, monNames[0]);
    StringAppend(dest, gOtherText_NewLine2);
    StringAppend(dest, monNames[1]);
    StringAppend(dest, gOtherText_NewLine2);
    StringAppend(dest, gOtherText_CancelAndLv);
}

static void GetDaycareLevelMenuLevelText(struct DayCare *daycare, u8 *dest)
{
    u8 i;
    u8 level;

    *dest = EOS;
    for (i = 0; i < 2; i++)
    {
        level = GetLevelAfterDaycareSteps(&daycare->mons[i], daycare->misc.countersEtc.steps[i]);
        dest[0] = 0x34;
        dest[1] = 0xFC;
        dest[2] = 0x14;
        dest[3] = 0x06;
        dest = ConvertIntToDecimalStringN(dest + 4, level, STR_CONV_MODE_RIGHT_ALIGN, 3);
        dest[0] = 0xFC;
        dest[1] = 0x14;
        dest[2] = 0x00;
        dest = StringCopy(dest + 3, gOtherText_NewLine2);
    }

    *dest = EOS;
}

static void HandleDaycareLevelMenuInput(u8 taskId)
{
    if (gMain.newKeys & DPAD_UP)
    {
        if (gTasks[taskId].data[0] != 0)
        {
            gTasks[taskId].data[0] --;
            Menu_MoveCursor(-1);
            PlaySE(SE_SELECT);
        }
    }
    else if (gMain.newKeys & DPAD_DOWN)
    {
        if (gTasks[taskId].data[0] != 2)
        {
            gTasks[taskId].data[0]++;
            Menu_MoveCursor(+1);
            PlaySE(SE_SELECT);
        }
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        Menu_DestroyCursor();
        PlaySE(SE_SELECT);
        gLastFieldPokeMenuOpened = gSpecialVar_Result = gTasks[taskId].data[0];
        DestroyTask(taskId);
        Menu_EraseWindowRect(15, 6, 29, 13);
        EnableBothScriptContexts();
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        Menu_DestroyCursor();
        gLastFieldPokeMenuOpened = gSpecialVar_Result = 2;
        DestroyTask(taskId);
        Menu_EraseWindowRect(15, 6, 29, 13);
        EnableBothScriptContexts();
    }
}

void ShowDaycareLevelMenu(void)
{
    u8 buffer[100];
    Menu_DrawStdWindowFrame(15, 6, 29, 13);
    GetDaycareLevelMenuText(&gSaveBlock1.daycare, buffer);
    Menu_PrintText(buffer, 16, 7);
    GetDaycareLevelMenuLevelText(&gSaveBlock1.daycare, buffer);
    Menu_PrintTextPixelCoords(buffer, 0xce, 0x38, TRUE);
    InitMenu(0, 16, 7, 3, 0, 13);
    CreateTask(HandleDaycareLevelMenuInput, 3);
}

void ChooseSendDaycareMon(void)
{
    OpenPartyMenu(PARTY_MENU_TYPE_DAYCARE, 0);
    gMain.savedCallback = c2_exit_to_overworld_2_switch;
}
