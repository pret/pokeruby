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

extern u8 gLastFieldPokeMenuOpened;

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

u8 Daycare_CountPokemon(struct BoxPokemon *daycare_data)
{
    u8 i, count;
    count = 0;

    for(i = 0;i <= 1;i++)
        if(GetBoxMonData(daycare_data + i, MON_DATA_SPECIES) != 0)
            count++;

    return count;
}

void sub_8041324(struct BoxPokemon * box_pokemon, struct DayCareMailEtc * void_pointer)
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
                void_pointer->extra.rc.unk74[i] = 0;
            } else
            {
                void_pointer->extra.rc.unk74[i] = 1;
            }
        } else
        {
            void_pointer->extra.rc.unk74[i] = 1;
        }
    }
    void_pointer->extra.rc.unk70 = specCount;
}

s8 Daycare_FindEmptySpot(struct BoxPokemon * daycare_data)
{
    u8 i;

    for(i = 0;i <= 1;i++)
        if(GetBoxMonData(daycare_data + i, MON_DATA_SPECIES) == 0)
            return i;

    return -1;
}

void Daycare_SendPokemon(struct Pokemon * mon, struct DayCareData * daycare_data){ // unfinished
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
    daycare_data->mail.extra.steps[empty_slot] = 0;
    ZeroMonData(mon);
    party_compaction();
    CalculatePlayerPartyCount();
}

void Daycare_SendPokemon_Special()
{
    Daycare_SendPokemon(gPlayerParty + gLastFieldPokeMenuOpened, &gSaveBlock1.daycareData);
}

void sub_80417F4(struct DayCareMail *);

void sub_80414C0(struct DayCareData * daycare_data)
{
    if((GetBoxMonData(&daycare_data->mons[1], MON_DATA_SPECIES) != 0) && GetBoxMonData(&daycare_data->mons[0], MON_DATA_SPECIES) == 0)
    {
        daycare_data->mons[0] = daycare_data->mons[1];
        ZeroBoxMonData(&daycare_data->mons[1]);
        daycare_data->mail.data[0] = daycare_data->mail.data[1];
        daycare_data->mail.extra.steps[0] = daycare_data->mail.extra.steps[1];
        daycare_data->mail.extra.steps[1] = 0;
        sub_80417F4(&daycare_data->mail.data[1]);
    }
}

u8 TryIncrementMonLevel(struct Pokemon *);
extern u16 word_2024E82;

void sub_804151C(struct Pokemon * mon)
{
    s32 i;
    u8 r6;
    u16 temp;

    for(i = 0; i < 100; i++){
        if(TryIncrementMonLevel(mon) == FALSE) goto end;

        r6 = 1;
        while((temp = sub_803B7C8(mon, r6)) != 0){
            r6 = 0;
            if(temp == 0xffff){
                DeleteFirstMoveAndGiveMoveToMon(mon, word_2024E82);
            }
        }
    }

    end:

    CalculateMonStats(mon);
}

u16 sub_8041570(struct DayCareData * daycare_data, u8 slot)
{
    u16 species;
    u32 experience;
    struct Pokemon pokemon;

    GetBoxMonNick(&daycare_data->mons[slot], gStringVar1);
    species = GetBoxMonData(&daycare_data->mons[slot], MON_DATA_SPECIES);
    sub_803B4B4(&daycare_data->mons[slot], &pokemon);
    if (GetMonData(&pokemon, MON_DATA_LEVEL) != MAX_LEVEL)
    {
        experience = GetMonData(&pokemon, MON_DATA_EXP) + daycare_data->mail.extra.steps[slot];
        SetMonData(&pokemon, MON_DATA_EXP, (u8 *)&experience);
        sub_804151C(&pokemon);
    }
    gPlayerParty[PARTY_SIZE - 1] = pokemon;
    if (daycare_data->mail.data[slot].mail.itemId)
    {
        GiveMailToMon2(&gPlayerParty[PARTY_SIZE - 1], &daycare_data->mail.data[slot].mail);
        sub_80417F4(&daycare_data->mail.data[slot]);
    }
    party_compaction();
    ZeroBoxMonData(&daycare_data->mons[slot]);
    daycare_data->mail.extra.steps[slot] = 0;
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

u8 sub_80416A0(struct DayCareData *daycareData, u8 slot)
{
    u8 levelBefore;
    u8 levelAfter;

    levelBefore = GetLevelFromBoxMonExp(&daycareData->mons[slot]);
    levelAfter = Daycare_GetLevelAfterSteps(&daycareData->mons[slot], daycareData->mail.extra.steps[slot]);
    return levelAfter - levelBefore;
}

u8 sub_80416E8(struct DayCareData *dayCareData, u8 slot)
{
    u8 levelDelta = sub_80416A0(dayCareData, slot);
    GetBoxMonNick(&dayCareData->mons[slot], gStringVar1);
    ConvertIntToDecimalStringN(gStringVar2, levelDelta, STR_CONV_MODE_LEFT_ALIGN, 2);
    return levelDelta;
}

u16 sub_8041728(struct DayCareData *dayCareData, u8 slot)
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
    gSaveBlock1.daycareData.mail.extra.steps[0] += i;
    gSaveBlock1.daycareData.mail.extra.steps[1] += i;
}

u8 sub_80417B8(void)
{
    if (GetBoxMonData(&gSaveBlock1.daycareData.mons[gSpecialVar_0x8004], MON_DATA_SPECIES) != 0)
        return sub_80416E8(&gSaveBlock1.daycareData, gSpecialVar_0x8004);
    return 0;
}

void sub_80417F4(struct DayCareMail *mail)
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
        dayCareData->mail.extra.steps[slot] = 0;
        sub_80417F4(&dayCareData->mail.data[slot]);
    }
    dayCareData->unk_118 = 0;
    dayCareData->unk_11a = 0;
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
