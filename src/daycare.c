#include "global.h"
#include "daycare.h"
#include "pokemon.h"
#include "event_data.h"
#include "species.h"
#include "items.h"
#include "text.h"
#include "string_util.h"
#include "mail_data.h"
#include "name_string_util.h"
#include "pokemon_storage_system.h"
#include "rng.h"
#include "moves.h"
#include "trade.h"
#include "strings2.h"
#include "data/pokemon/egg_moves.h"
#include "party_menu.h"
#include "field_effect.h"
#include "main.h"
#include "menu.h"
#include "sound.h"
#include "songs.h"
#include "script.h"
#include "rom4.h"

extern u16 word_2024E82;

IWRAM_DATA u16 gUnknown_03000470[52];
IWRAM_DATA u16 gUnknown_030004D8[4];
IWRAM_DATA u16 gUnknown_030004E0[4];
IWRAM_DATA u16 gUnknown_030004E8[12];
IWRAM_DATA u16 gUnknown_03000500[4];

static void sub_80417F4(struct DayCareMail *);
static void sub_80420FC(struct Pokemon *, u16, struct DayCareData *);
static u8 daycare_relationship_score(struct DayCareData *);

const u8 *const gUnknown_08209AC4[] = {
    DaycareText_GetAlongVeryWell,
    DaycareText_GetAlong,
    DaycareText_DontLikeOther,
    DaycareText_PlayOther
};

const u8 gUnknown_08209AD4[] = _("タマゴ");

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

u8 Daycare_CountPokemon(struct DayCareData *daycare_data)
{
    u8 i, count;
    count = 0;

    for(i = 0;i <= 1;i++)
        if(GetBoxMonData(&daycare_data->mons[i], MON_DATA_SPECIES) != 0)
            count++;

    return count;
}

void sub_8041324(struct BoxPokemon * box_pokemon, struct RecordMixingDayCareMail * daycareMailEtc)
{
    u8 i;
    u8 specCount;
    specCount = 0;
    for (i=0; i<2; i++)
    {
        if (GetBoxMonData(&box_pokemon[i], MON_DATA_SPECIES) != SPECIES_NONE)
        {
            specCount ++;
            if (GetBoxMonData(&box_pokemon[i], MON_DATA_HELD_ITEM) == ITEM_NONE)
            {
                daycareMailEtc->unk74[i] = 0;
            } else
            {
                daycareMailEtc->unk74[i] = 1;
            }
        } else
        {
            daycareMailEtc->unk74[i] = 1;
        }
    }
    daycareMailEtc->unk70 = specCount;
}

static s8 Daycare_FindEmptySpot(struct BoxPokemon * daycare_data)
{
    u8 i;

    for(i = 0;i <= 1;i++)
        if(GetBoxMonData(daycare_data + i, MON_DATA_SPECIES) == 0)
            return i;

    return -1;
}

static void Daycare_SendPokemon(struct Pokemon * mon, struct DayCareData * daycare_data)
{
    s8 empty_slot;
    u8 mail;
    u8 *names;

    empty_slot = Daycare_FindEmptySpot(daycare_data->mons);
    if(MonHasMail(mon)) {
        StringCopy((names = daycare_data->mail.data[empty_slot].names), gSaveBlock2.playerName);
        PadNameString(names, 0xFC);
        names += 8;
        GetMonNick(mon, names);
        mail = GetMonData(mon, MON_DATA_MAIL);
        daycare_data->mail.data[empty_slot].mail = gSaveBlock1.mail[mail];
        TakeMailFromMon(mon);
    }
    daycare_data->mons[empty_slot] = mon->box;
    BoxMonRestorePP(&daycare_data->mons[empty_slot]);
    daycare_data->mail.egg.steps[empty_slot] = 0;
    ZeroMonData(mon);
    party_compaction();
    CalculatePlayerPartyCount();
}

void Daycare_SendPokemon_Special()
{
    Daycare_SendPokemon(gPlayerParty + gLastFieldPokeMenuOpened, &gSaveBlock1.daycareData);
}

static void sub_80414C0(struct DayCareData * daycare_data)
{
    if((GetBoxMonData(&daycare_data->mons[1], MON_DATA_SPECIES) != 0) && GetBoxMonData(&daycare_data->mons[0], MON_DATA_SPECIES) == 0)
    {
        daycare_data->mons[0] = daycare_data->mons[1];
        ZeroBoxMonData(&daycare_data->mons[1]);
        daycare_data->mail.data[0] = daycare_data->mail.data[1];
        daycare_data->mail.egg.steps[0] = daycare_data->mail.egg.steps[1];
        daycare_data->mail.egg.steps[1] = 0;
        sub_80417F4(&daycare_data->mail.data[1]);
    }
}

static void DayCare_LevelUpMoves(struct Pokemon * mon)
{
    s32 i;
    u8 r6;
    u16 temp;

    for (i = 0; i < 100; i++)
    {
        if (TryIncrementMonLevel(mon))
        {
            r6 = 1;
            while ((temp = sub_803B7C8(mon, r6)) != 0)
            {
                r6 = 0;
                if (temp == 0xffff)
                    DeleteFirstMoveAndGiveMoveToMon(mon, word_2024E82);
            }
        }
        else
            break;
    }

    CalculateMonStats(mon);
}

static u16 sub_8041570(struct DayCareData * daycare_data, u8 slot)
{
    u16 species;
    u32 experience;
    struct Pokemon pokemon;

    GetBoxMonNick(&daycare_data->mons[slot], gStringVar1);
    species = GetBoxMonData(&daycare_data->mons[slot], MON_DATA_SPECIES);
    sub_803B4B4(&daycare_data->mons[slot], &pokemon);
    if (GetMonData(&pokemon, MON_DATA_LEVEL) != MAX_LEVEL)
    {
        experience = GetMonData(&pokemon, MON_DATA_EXP) + daycare_data->mail.egg.steps[slot];
        SetMonData(&pokemon, MON_DATA_EXP, (u8 *)&experience);
        DayCare_LevelUpMoves(&pokemon);
    }
    gPlayerParty[PARTY_SIZE - 1] = pokemon;
    if (daycare_data->mail.data[slot].mail.itemId)
    {
        GiveMailToMon2(&gPlayerParty[PARTY_SIZE - 1], &daycare_data->mail.data[slot].mail);
        sub_80417F4(&daycare_data->mail.data[slot]);
    }
    party_compaction();
    ZeroBoxMonData(&daycare_data->mons[slot]);
    daycare_data->mail.egg.steps[slot] = 0;
    sub_80414C0(daycare_data);
    CalculatePlayerPartyCount();
    return species;
}

u16 sub_8041648()
{
    return sub_8041570(&gSaveBlock1.daycareData, gSpecialVar_0x8004);
}

u8 Daycare_GetLevelAfterSteps(struct BoxPokemon * mon, u32 steps){
    struct BoxPokemon temp = *mon;
    u32 new_exp = GetBoxMonData(mon, MON_DATA_EXP) + steps;
    SetBoxMonData(&temp, MON_DATA_EXP, (u8 *) &new_exp);
    return GetLevelFromBoxMonExp(&temp);
}

static u8 sub_80416A0(struct DayCareData *daycareData, u8 slot)
{
    u8 levelBefore;
    u8 levelAfter;

    levelBefore = GetLevelFromBoxMonExp(&daycareData->mons[slot]);
    levelAfter = Daycare_GetLevelAfterSteps(&daycareData->mons[slot], daycareData->mail.egg.steps[slot]);
    return levelAfter - levelBefore;
}

static u8 sub_80416E8(struct DayCareData *dayCareData, u8 slot)
{
    u8 levelDelta = sub_80416A0(dayCareData, slot);
    GetBoxMonNick(&dayCareData->mons[slot], gStringVar1);
    ConvertIntToDecimalStringN(gStringVar2, levelDelta, STR_CONV_MODE_LEFT_ALIGN, 2);
    return levelDelta;
}

static u16 sub_8041728(struct DayCareData *dayCareData, u8 slot)
{
    u16 cost;

    u8 levelDelta = sub_80416A0(dayCareData, slot);
    GetBoxMonNick(&dayCareData->mons[slot], gStringVar1);
    cost = 100 + 100 * levelDelta;
    ConvertIntToDecimalStringN(gStringVar2, cost, STR_CONV_MODE_LEFT_ALIGN, 5);
    return cost;
}

void sub_8041770(void)
{
    gSpecialVar_0x8005 = sub_8041728(&gSaveBlock1.daycareData, gSpecialVar_0x8004);
}

void sub_8041790(u16 i)
{
    gSaveBlock1.daycareData.mail.egg.steps[0] += i;
    gSaveBlock1.daycareData.mail.egg.steps[1] += i;
}

u8 sub_80417B8(void)
{
    if (GetBoxMonData(&gSaveBlock1.daycareData.mons[gSpecialVar_0x8004], MON_DATA_SPECIES) != 0)
        return sub_80416E8(&gSaveBlock1.daycareData, gSpecialVar_0x8004);
    return 0;
}

static void sub_80417F4(struct DayCareMail *mail)
{
    u8 zero;
    u8 *names;
    u8 *names2;
    int i;
    zero = 0;
    for (i = 7, names = mail->names + 7; i >= 0; i --)
        *names-- = zero;
    names2 = mail->names + 8;
    zero = 0;
    names = mail->names + 18;
    do *names-- = zero; while ((int)names >= (int)names2);
    ClearMailStruct(&mail->mail);
}

void unref_sub_8041824(struct DayCareData *dayCareData)
{
    u8 slot;
    for (slot = 0; slot < ARRAY_COUNT(dayCareData->mons); slot ++)
    {
        ZeroBoxMonData(&dayCareData->mons[slot]);
        dayCareData->mail.egg.steps[slot] = 0;
        sub_80417F4(&dayCareData->mail.data[slot]);
    }
    dayCareData->mail.egg.personalityLo = 0;
    dayCareData->mail.egg.unk_11a = 0;
}

u16 sub_8041870(u16 species)
{
    int i, j, k;
    bool8 found;
    for (i = 0; i < 5; i ++)
    {
        found = FALSE;
        for (j = 1; j < NUM_SPECIES; j ++)
        {
            for (k = 0; k < 5; k ++)
            {
                if (gEvolutionTable[j].evolutions[k].targetSpecies == species)
                {
                    species = j;
                    found = TRUE;
                    break;
                }
            }
            if (found)
                break;
        }
        if (j == 412)
            break;
    }
    return species;
}

static void sub_80418F0(struct DayCareData *dayCareData)
{
    dayCareData->mail.egg.personalityLo = (Random() % 0xfffe) + 1;
    FlagSet(0x86);
}

static void sub_804191C(struct DayCareData *dayCareData)
{
    dayCareData->mail.egg.personalityLo = Random() | 0x8000;
    FlagSet(0x86);
}

void sub_8041940(void)
{
    sub_80418F0(&gSaveBlock1.daycareData);
}

void sub_8041950(void)
{
    sub_804191C(&gSaveBlock1.daycareData);
}

static void sub_8041960(u8 *data, u8 idx)
{
    int i, j;
    u8 temp[6];
    data[idx] = 0xff;
    for (i = 0; i < 6; i ++)
        temp[i] = data[i];
    j = 0;
    for (i = 0; i < 6; i ++)
        if (temp[i] != 0xff)
            data[j++] = temp[i];
}

static void InheritIVs(struct Pokemon *egg, struct DayCareData *dayCareData)
{
    u8 i;
    u8 selectedIvs[3];
    u8 allIvs[6];
    u8 whichParent[3];
    u8 iv;
    for (i = 0; i < 6; i ++)
        allIvs[i] = i;
    for (i = 0; i < 3; i ++)
    {
        selectedIvs[i] = allIvs[Random() % (6 - i)];
        sub_8041960(allIvs, selectedIvs[i]);
    }
    for (i = 0; i < 3; i ++)
        whichParent[i] = Random() % 2;
    for (i = 0; i < 3; i ++)
    {
        switch (selectedIvs[i])
        {
            case 0:
                iv = GetBoxMonData(&dayCareData->mons[whichParent[i]], MON_DATA_HP_IV);
                SetMonData(egg, MON_DATA_HP_IV, &iv);
                break;
            case 1:
                iv = GetBoxMonData(&dayCareData->mons[whichParent[i]], MON_DATA_ATK_IV);
                SetMonData(egg, MON_DATA_ATK_IV, &iv);
                break;
            case 2:
                iv = GetBoxMonData(&dayCareData->mons[whichParent[i]], MON_DATA_DEF_IV);
                SetMonData(egg, MON_DATA_DEF_IV, &iv);
                break;
            case 3:
                iv = GetBoxMonData(&dayCareData->mons[whichParent[i]], MON_DATA_SPD_IV);
                SetMonData(egg, MON_DATA_SPD_IV, &iv);
                break;
            case 4:
                iv = GetBoxMonData(&dayCareData->mons[whichParent[i]], MON_DATA_SPATK_IV);
                SetMonData(egg, MON_DATA_SPATK_IV, &iv);
                break;
            case 5:
                iv = GetBoxMonData(&dayCareData->mons[whichParent[i]], MON_DATA_SPDEF_IV);
                SetMonData(egg, MON_DATA_SPDEF_IV, &iv);
                break;
        }
    }
}

#ifdef NONMATCHING
static
#endif
u8 pokemon_get_eggmoves(struct Pokemon *pokemon, u16 *eggMoves)
{
    u16 eggMoveIdx;
    u16 numMovesFound;
    u16 species;
    u16 i;

    numMovesFound = 0;
    eggMoveIdx = 0;
    species = GetMonData(pokemon, MON_DATA_SPECIES);
    for (i = 0; i < ARRAY_COUNT(gEggMoves) - 1; i ++)
    {
        if (gEggMoves[i] == species + EGG_MOVES_SPECIES_OFFSET)
        {
            eggMoveIdx = i + 1;
            break;
        }
    }
    for (i = 0; i < 10; i ++)
    {
        if (gEggMoves[eggMoveIdx + i] > EGG_MOVES_SPECIES_OFFSET)
        {
            break;
        }
        eggMoves[i] = gEggMoves[eggMoveIdx + i];
        numMovesFound++;
    }
    return numMovesFound;
}

#ifdef NONMATCHING

void daycare_build_child_moveset(struct Pokemon *egg, struct BoxPokemon *dad, struct BoxPokemon *mom)
{
    u16 numSharedParentMoves;
    u8 numLevelUpMoves;
    u8 numEggMoves;
    u16 i, j;

    numSharedParentMoves = 0;
    for (i = 0; i < 4; i ++)
    {
        gUnknown_03000500[i] = 0;
        gUnknown_030004D8[i] = 0;
        gUnknown_030004E0[i] = 0;
    }
    for (i = 0; i < 10; i ++)
        gUnknown_030004E8[i] = 0;
    for (i = 0; i < 50; i ++)
        gUnknown_03000470[i] = 0;

    numLevelUpMoves = GetLevelUpMovesBySpecies(GetMonData(egg, MON_DATA_SPECIES), gUnknown_03000470);
    for (i = 0; i < 4; i ++)
    {
        gUnknown_030004D8[i] = GetBoxMonData(dad, MON_DATA_MOVE1 + i);
        gUnknown_03000500[i] = GetBoxMonData(mom, MON_DATA_MOVE1 + i);
    }
    numEggMoves = pokemon_get_eggmoves(egg, gUnknown_030004E8);

    for (i = 0; i < 4; i ++)
    {
        if (gUnknown_030004D8[i] != MOVE_NONE)
        {
            for (j = 0; j < numEggMoves; j ++)
            {
                if (gUnknown_030004D8[i] == gUnknown_030004E8[j])
                {
                    if (GiveMoveToMon(egg, gUnknown_030004D8[i]) == 0xffff)
                        DeleteFirstMoveAndGiveMoveToMon(egg, gUnknown_030004D8[i]);
                    break;
                }
            }
        }
        else
            break;
    }
    for (i = 0; i < 4; i ++)
    {
        if (gUnknown_030004D8[i] != MOVE_NONE)
        {
            for (j = 0; j < 50 + 8; j ++)
            {
                if (gUnknown_030004D8[i] == ItemIdToBattleMoveId(ITEM_TM01 + j) && CanMonLearnTMHM(egg, j))
                {
                    if (GiveMoveToMon(egg, gUnknown_030004D8[i]) == 0xffff)
                        DeleteFirstMoveAndGiveMoveToMon(egg, gUnknown_030004D8[i]);
                }
            }
        }
    }
    for (i = 0; i < 4; i ++)
    {
        if (gUnknown_030004D8[i] == MOVE_NONE)
            break;
        for (j = 0; j < 4; j ++)
        {
            if (gUnknown_030004D8[i] == gUnknown_03000500[j] && gUnknown_030004D8[i] != MOVE_NONE)
                gUnknown_030004E0[numSharedParentMoves++] = gUnknown_030004D8[i];
        }
    }
    for (i = 0; i < 4; i ++)
    {
        if (gUnknown_030004E0[i] == MOVE_NONE)
            break;
        for (j = 0; j < numLevelUpMoves; j ++)
        {
            if (gUnknown_03000470[j] != MOVE_NONE && gUnknown_030004E0[i] == gUnknown_03000470[j])
            {
                if (GiveMoveToMon(egg, gUnknown_030004E0[i]) == 0xffff)
                    DeleteFirstMoveAndGiveMoveToMon(egg, gUnknown_030004E0[i]);
                break;
            }
        }
    }
}
#else
__attribute__((naked))
void daycare_build_child_moveset(struct Pokemon *egg, struct BoxPokemon *dad, struct BoxPokemon *mom)
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
                    "\tldr r5, _08041CC8 @ =gUnknown_03000500\n"
                    "\tmovs r2, 0\n"
                    "\tldr r4, _08041CCC @ =gUnknown_030004D8\n"
                    "\tldr r3, _08041CD0 @ =gUnknown_030004E0\n"
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
                    "\tldr r2, _08041CD4 @ =gUnknown_030004E8\n"
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
                    "\tldr r2, _08041CD8 @ =gUnknown_03000470\n"
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
                    "\tldr r1, _08041CD8 @ =gUnknown_03000470\n"
                    "\tbl GetLevelUpMovesBySpecies\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r0, 24\n"
                    "\tstr r0, [sp, 0x4]\n"
                    "\tmovs r6, 0\n"
                    "\tldr r1, _08041CCC @ =gUnknown_030004D8\n"
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
                    "\tldr r1, _08041CC8 @ =gUnknown_03000500\n"
                    "\tadds r4, r1\n"
                    "\tstrh r0, [r4]\n"
                    "\tadds r0, r6, 0x1\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r6, r0, 16\n"
                    "\tcmp r6, 0x3\n"
                    "\tbls _08041C46\n"
                    "\tldr r1, _08041CD4 @ =gUnknown_030004E8\n"
                    "\tadds r0, r7, 0\n"
                    "\tbl pokemon_get_eggmoves\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r0, 24\n"
                    "\tmov r8, r0\n"
                    "\tmovs r6, 0\n"
                    "_08041C82:\n"
                    "\tldr r0, _08041CCC @ =gUnknown_030004D8\n"
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
                    "\tldr r0, _08041CD4 @ =gUnknown_030004E8\n"
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
                    "_08041CC8: .4byte gUnknown_03000500\n"
                    "_08041CCC: .4byte gUnknown_030004D8\n"
                    "_08041CD0: .4byte gUnknown_030004E0\n"
                    "_08041CD4: .4byte gUnknown_030004E8\n"
                    "_08041CD8: .4byte gUnknown_03000470\n"
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
                    "\tldr r3, _08041E14 @ =gUnknown_030004D8\n"
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
                    "\tldr r0, _08041E14 @ =gUnknown_030004D8\n"
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
                    "\tldr r3, _08041E20 @ =gUnknown_030004E0\n"
                    "\tmov r10, r3\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _08041DC6\n"
                    "\tmov r4, r9\n"
                    "\tldr r0, _08041E24 @ =gUnknown_03000500\n"
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
                    "\tldr r1, _08041E28 @ =gUnknown_03000470\n"
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
                    "_08041E14: .4byte gUnknown_030004D8\n"
                    "_08041E18: .4byte 0x0000ffff\n"
                    "_08041E1C: .4byte 0x00000121\n"
                    "_08041E20: .4byte gUnknown_030004E0\n"
                    "_08041E24: .4byte gUnknown_03000500\n"
                    "_08041E28: .4byte gUnknown_03000470\n"
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
                    "\tldr r0, _08041E60 @ =gUnknown_030004E0\n"
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
                    "_08041E60: .4byte gUnknown_030004E0");
}
#endif

static void RemoveEggFromDayCare(struct DayCareData *dayCareData)
{
    dayCareData->mail.egg.personalityLo = 0;
    dayCareData->mail.egg.unk_11a = 0;
}

void sub_8041E7C(void)
{
    RemoveEggFromDayCare(&gSaveBlock1.daycareData);
}

static void incense_effects(u16 *species, struct DayCareData *dayCareData)
{
    u16 momItem, dadItem;
    if (*species == SPECIES_WYNAUT || *species == SPECIES_AZURILL)
    {
        momItem = GetBoxMonData(&dayCareData->mons[0], MON_DATA_HELD_ITEM);
        dadItem = GetBoxMonData(&dayCareData->mons[1], MON_DATA_HELD_ITEM);
        if (*species == SPECIES_WYNAUT && momItem != ITEM_LAX_INCENSE && dadItem != ITEM_LAX_INCENSE)
        {
            *species = SPECIES_WOBBUFFET;
        }
        if (*species == SPECIES_AZURILL && momItem != ITEM_SEA_INCENSE && dadItem != ITEM_SEA_INCENSE)
        {
            *species = SPECIES_MARILL;
        }
    }
}

static u16 sub_8041EEC(struct DayCareData *dayCareData, u8 *a1) // inherit_species_from_mom
{
    u16 i;
    u16 species[2];
    u16 eggSpecies;
    u8 buffer;
    for (i=0; i<2; i++)
    {
        species[i] = GetBoxMonData(&dayCareData->mons[i], MON_DATA_SPECIES);
        if (species[i] == SPECIES_DITTO)
        {
            a1[0] = i ^ 1;
            a1[1] = i;
        }
        else if (GetBoxMonGender(&dayCareData->mons[i]) == MON_FEMALE)
        {
            a1[0] = i;
            a1[1] = i ^ 1;
        }
    }
    eggSpecies = sub_8041870(species[a1[0]]);
    if (eggSpecies == SPECIES_NIDORAN_F && dayCareData->mail.egg.personalityLo & 0x8000)
    {
        eggSpecies = SPECIES_NIDORAN_M;
    }
    if (eggSpecies == SPECIES_ILLUMISE && dayCareData->mail.egg.personalityLo & 0x8000)
    {
        eggSpecies = SPECIES_VOLBEAT;
    }
    if (species[a1[1]] == SPECIES_DITTO && GetBoxMonGender(&dayCareData->mons[a1[0]]) != MON_FEMALE)
    {
        buffer = a1[1];
        a1[1] = a1[0];
        a1[0] = buffer;
    }
    return eggSpecies;
}

static void sub_8041FC4(struct DayCareData *dayCareData) // give_egg
{
    struct Pokemon egg;
    u16 species;
    u8 parents[2];
    u8 isEgg;
    species = sub_8041EEC(dayCareData, parents);
    incense_effects(&species, dayCareData);
    sub_80420FC(&egg, species, dayCareData);
    InheritIVs(&egg, dayCareData);
    daycare_build_child_moveset(&egg, &dayCareData->mons[parents[1]], &dayCareData->mons[parents[0]]);
    isEgg = TRUE;
    SetMonData(&egg, MON_DATA_IS_EGG, &isEgg);
    gPlayerParty[5] = egg;
    party_compaction();
    CalculatePlayerPartyCount();
    RemoveEggFromDayCare(dayCareData);
}


void sub_8042044(struct Pokemon *mon, u16 species, u8 overwriteMetLocation) // scr_create_egg
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
    SetMonData(mon, MON_DATA_POKEBALL, (u8 *)&ball);
    SetMonData(mon, MON_DATA_NICKNAME, gUnknown_08209AD4);
    SetMonData(mon, MON_DATA_FRIENDSHIP, &gBaseStats[species].eggCycles);
    SetMonData(mon, MON_DATA_MET_LEVEL, &metLevel);
    SetMonData(mon, MON_DATA_LANGUAGE, &language);
    if (overwriteMetLocation)
    {
        metLocation = 0xfd;
        SetMonData(mon, MON_DATA_MET_LOCATION, &metLocation);
    }
    isEgg = TRUE;
    SetMonData(mon, MON_DATA_IS_EGG, &isEgg);
}

static void sub_80420FC(struct Pokemon *mon, u16 species, struct DayCareData *dayCareData)
{
    u32 personality;
    u16 ball;
    u8 metLevel;
    u8 language;
    personality = dayCareData->mail.egg.personalityLo | (Random() << 16);
    CreateMon(mon, species, 5, 0x20, TRUE, personality, FALSE, 0);
    metLevel = 0;
    ball = ITEM_POKE_BALL;
    language = LANGUAGE_JAPANESE;
    SetMonData(mon, MON_DATA_POKEBALL, (u8 *)&ball);
    SetMonData(mon, MON_DATA_NICKNAME, gUnknown_08209AD4);
    SetMonData(mon, MON_DATA_FRIENDSHIP, &gBaseStats[species].eggCycles);
    SetMonData(mon, MON_DATA_MET_LEVEL, &metLevel);
    SetMonData(mon, MON_DATA_LANGUAGE, &language);
}

void sp0B8_daycare(void)
{
    sub_8041FC4(&gSaveBlock1.daycareData);
}

#ifdef NONMATCHING
static bool8 sub_80421B0(struct DayCareData *dayCareData)
{
    struct BoxPokemon *parent;
    u32 i;
    int v0;
    int steps;
    v0 = 0;
    for (i=0, parent=&dayCareData->mons[0]; i<2; parent++, i++)
    {
        if (GetBoxMonData(parent, MON_DATA_SANITY_BIT2, v0))
        {
            dayCareData->mail.egg.steps[i]++;
            v0++;
        }
    }
    if (dayCareData->mail.egg.personalityLo == 0 && v0 == 2 && dayCareData->mail.extra.misc[4] == 0xff && daycare_relationship_score(dayCareData) > (u32)((u32)(Random() * 100) / 0xffff))
    {
        sub_8041940();
    }
    if ((++dayCareData->mail.egg.unk_11a) == 0xff)
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
                SetMonData(&gPlayerParty[i], MON_DATA_FRIENDSHIP, (u8 *)&steps);
            }
        }
    }
    return FALSE;
}
#else
__attribute__((naked))
static bool8 sub_80421B0(struct DayCareData *dayCareData)
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
                    "\tbl daycare_relationship_score\n"
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
                    "\tbl sub_8041940\n"
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

bool8 sub_80422A0(void)
{
    return sub_80421B0(&gSaveBlock1.daycareData);
}

static bool8 sub_80422B4(struct DayCareData *dayCareData)
{
    return (u32)((-dayCareData->mail.egg.personalityLo) | dayCareData->mail.egg.personalityLo) >> 31;
}

static void sub_80422C4(struct DayCareData *dayCareData)
{
    u8 language;
    if (GetBoxMonData(&dayCareData->mons[0], MON_DATA_SPECIES) != 0)
    {
        GetBoxMonNick(&dayCareData->mons[0], gStringVar1);
        language = GetBoxMonData(&dayCareData->mons[0], MON_DATA_LANGUAGE);
        GetBoxMonData(&dayCareData->mons[0], MON_DATA_OT_NAME, gStringVar3);
        ConvertInternationalString(gStringVar3, language);
    }
    if (GetBoxMonData(&dayCareData->mons[1], MON_DATA_SPECIES) != 0)
    {
        GetBoxMonNick(&dayCareData->mons[1], gStringVar2);
    }
}

u16 sub_8042328(void)
{
    GetBoxMonNick(&gPlayerParty[gLastFieldPokeMenuOpened].box, gStringVar1);
    return GetBoxMonData(&gPlayerParty[gLastFieldPokeMenuOpened].box, MON_DATA_SPECIES);
}

void sp0B5_daycare(void)
{
    sub_80422C4(&gSaveBlock1.daycareData);
}

u8 sp0B6_daycare(void)
{
    u8 monCount;
    if (sub_80422B4(&gSaveBlock1.daycareData))
    {
        return 1;
    }
    monCount = Daycare_CountPokemon(&gSaveBlock1.daycareData);
    if (monCount != 0)
    {
        return monCount + 1;
    }
    return 0;
}

#ifdef NONMATCHING
static
#endif
bool8 sub_80423A8(u16 *a, u16 *b)
{
    int i, j;
    u16 *v0, *v1, v2;
    for (i=0, v0=a; i<2; v0++, i++)
    {
        for (j=0, v2=*v0, v1=b; j<2; v1++, j++)
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
static u8 daycare_relationship_score(struct DayCareData *dayCareData)
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
    for (i=0, parent=&dayCareData->mons[0], spc=species, ids=otIds, gnd=genders, egg1=&eggGroups[0][0], egg2=&eggGroups[0][1]; i<2; spc++, egg1+=2, egg2+=2, parent++, i++)
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
    if (!sub_80423A8(eggGroups[0], eggGroups[1]))
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
static u8 daycare_relationship_score(struct DayCareData *dayCareData)
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
                    "\tbl sub_80423A8\n"
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

u8 daycare_relationship_score_from_savegame(void)
{
    return daycare_relationship_score(&gSaveBlock1.daycareData);
}

void sp0B9_daycare_relationship_comment(void)
{
    u8 whichString;
    u8 relationshipScore;

    relationshipScore = daycare_relationship_score_from_savegame();
    whichString = 0;
    if (relationshipScore == 0)
        whichString = 3;
    if (relationshipScore == 20)
        whichString = 2;
    if (relationshipScore == 50)
        whichString = 1;
    if (relationshipScore == 70)
        whichString = 0;
    StringCopy(gStringVar4, gUnknown_08209AC4[whichString]);
}

#ifdef NONMATCHING
bool8 NameHasGenderSymbol(const u8 *name, u8 genderRatio)
{
    u8 i;
    u8 flags[2];

    // This portion is nonmatching
    flags[1] = 0;
    flags[0] = 0;
    for (i = 0; name[i] != EOS; i ++)
    // End nonmatching portion

    {
        if (name[i] == CHAR_MALE) flags[0] ++;
        if (name[i] == CHAR_FEMALE) flags[1] ++;
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

static u8 *MonAppendGenderSymbol(u8 *name, struct BoxPokemon *boxMon)
{
    return AppendGenderSymbol(name, GetBoxMonGender(boxMon));
}

static void DaycareLevelMenuGetText(struct DayCareData *dayCareData, u8 *dest)
{
    u8 buffers[2][20];
    u8 i;
    *dest = EOS;
    for (i = 0; i < 2; i ++)
    {
        GetBoxMonNick(&dayCareData->mons[i], buffers[i]);
        MonAppendGenderSymbol(buffers[i], &dayCareData->mons[i]);
    }
    StringCopy(dest, buffers[0]);
    StringAppend(dest, gOtherText_NewLine2);
    StringAppend(dest, buffers[1]);
    StringAppend(dest, gOtherText_NewLine2);
    StringAppend(dest, gOtherText_CancelAndLv);
}

static void DaycareLevelMenuGetLevelText(struct DayCareData *dayCareData, u8 *dest)
{
    u8 i;
    u8 level;
    *dest = EOS;
    for (i = 0; i < 2; i ++)
    {
        level = Daycare_GetLevelAfterSteps(&dayCareData->mons[i], dayCareData->mail.egg.steps[i]);
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

static void DaycareLevelMenuProcessKeyInput(u8 taskId)
{
    if (gMain.newKeys & DPAD_UP)
    {
        if (gTasks[taskId].data[0] != 0)
        {
            gTasks[taskId].data[0] --;
            MoveMenuCursor(-1);
            PlaySE(SE_SELECT);
        }
    }
    else if (gMain.newKeys & DPAD_DOWN)
    {
        if (gTasks[taskId].data[0] != 2)
        {
            gTasks[taskId].data[0] ++;
            MoveMenuCursor(+1);
            PlaySE(SE_SELECT);
        }
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        HandleDestroyMenuCursors();
        PlaySE(SE_SELECT);
        gLastFieldPokeMenuOpened = gScriptResult = gTasks[taskId].data[0];
        DestroyTask(taskId);
        MenuZeroFillWindowRect(15, 6, 29, 13);
        EnableBothScriptContexts();
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        HandleDestroyMenuCursors();
        gLastFieldPokeMenuOpened = gScriptResult = 2;
        DestroyTask(taskId);
        MenuZeroFillWindowRect(15, 6, 29, 13);
        EnableBothScriptContexts();
    }
}

void ShowDaycareLevelMenu(void)
{
    u8 buffer[100];
    MenuDrawTextWindow(15, 6, 29, 13);
    DaycareLevelMenuGetText(&gSaveBlock1.daycareData, buffer);
    MenuPrint(buffer, 16, 7);
    DaycareLevelMenuGetLevelText(&gSaveBlock1.daycareData, buffer);
    MenuPrint_PixelCoords(buffer, 0xce, 0x38, TRUE);
    InitMenu(0, 16, 7, 3, 0, 13);
    CreateTask(DaycareLevelMenuProcessKeyInput, 3);
}

void ChooseSendDaycareMon(void)
{
    OpenPartyMenu(6, 0);
    gMain.savedCallback = c2_exit_to_overworld_2_switch;
}
