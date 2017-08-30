#include "global.h"
#include "daycare.h"
#include "pokemon.h"
#include "species.h"
#include "items.h"
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
    daycare_data->mail.extra.unk70[empty_slot] = 0;
    ZeroMonData(mon);
    party_compaction();
    CalculatePlayerPartyCount();
}

void Daycare_SendPokemon_Special()
{
    Daycare_SendPokemon(gPlayerParty + gLastFieldPokeMenuOpened, &gSaveBlock1.daycareData);
}

void sub_80417F4(u8 *);

void sub_80414C0(struct BoxPokemon * daycare_data)
{
    u32 second_species;
    if((GetBoxMonData(&daycare_data[1], MON_DATA_SPECIES) != 0) && ((second_species = GetBoxMonData(&daycare_data[0], MON_DATA_SPECIES)) == 0)){
        daycare_data[0] = daycare_data[1];
        ZeroBoxMonData(&daycare_data[1]);
        memcpy(daycare_data + 2, (u8 *) (daycare_data + 1) + 0x88, 0x38);
        *((u32 *)(daycare_data) + 68) = *((u32 *)(daycare_data) + 69);
        *((u32 *)(daycare_data) + 69) = second_species;
        sub_80417F4((u8 *) (daycare_data + 1) + 0x88);
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

__attribute__((naked))
u16 sub_8041570(struct DayCareData * daycare_data, u8 a2){
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r9\n\
    mov r6, r8\n\
    push {r6,r7}\n\
    sub sp, 0x68\n\
    adds r5, r0, 0\n\
    lsls r1, 24\n\
    lsrs r4, r1, 24\n\
    lsls r7, r4, 2\n\
    adds r0, r7, r4\n\
    lsls r0, 4\n\
    adds r6, r5, r0\n\
    ldr r1, _08041640 @ =gStringVar1\n\
    adds r0, r6, 0\n\
    bl GetBoxMonNick\n\
    adds r0, r6, 0\n\
    movs r1, 0xB\n\
    bl GetBoxMonData\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    mov r9, r0\n\
    adds r0, r6, 0\n\
    mov r1, sp\n\
    bl sub_803B4B4\n\
    mov r0, sp\n\
    movs r1, 0x38\n\
    bl GetMonData\n\
    cmp r0, 0x64\n\
    beq _080415D8\n\
    mov r0, sp\n\
    movs r1, 0x19\n\
    bl GetMonData\n\
    movs r2, 0x88\n\
    lsls r2, 1\n\
    adds r1, r5, r2\n\
    adds r1, r7\n\
    ldr r1, [r1]\n\
    adds r0, r1\n\
    str r0, [sp, 0x64]\n\
    add r2, sp, 0x64\n\
    mov r0, sp\n\
    movs r1, 0x19\n\
    bl SetMonData\n\
    mov r0, sp\n\
    bl sub_804151C\n\
_080415D8:\n\
    ldr r0, _08041644 @ =gPlayerParty\n\
    movs r1, 0xFA\n\
    lsls r1, 1\n\
    adds r1, r0\n\
    mov r8, r1\n\
    mov r0, r8\n\
    mov r1, sp\n\
    movs r2, 0x64\n\
    bl memcpy\n\
    lsls r0, r4, 3\n\
    subs r0, r4\n\
    lsls r1, r0, 3\n\
    adds r0, r5, r1\n\
    adds r0, 0xC0\n\
    ldrh r0, [r0]\n\
    cmp r0, 0\n\
    beq _08041610\n\
    adds r4, r1, 0\n\
    adds r4, 0xA0\n\
    adds r4, r5, r4\n\
    mov r0, r8\n\
    adds r1, r4, 0\n\
    bl GiveMailToMon2\n\
    adds r0, r4, 0\n\
    bl sub_80417F4\n\
_08041610:\n\
    bl party_compaction\n\
    adds r0, r6, 0\n\
    bl ZeroBoxMonData\n\
    movs r2, 0x88\n\
    lsls r2, 1\n\
    adds r0, r5, r2\n\
    adds r0, r7\n\
    movs r1, 0\n\
    str r1, [r0]\n\
    adds r0, r5, 0\n\
    bl sub_80414C0\n\
    bl CalculatePlayerPartyCount\n\
    mov r0, r9\n\
    add sp, 0x68\n\
    pop {r3,r4}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    pop {r4-r7}\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_08041640: .4byte gStringVar1\n\
_08041644: .4byte gPlayerParty\n\
    .syntax divided");
}

extern u8 gSpecialVar_0x8004;

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
