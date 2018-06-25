#include "global.h"
#include "battle.h"
#include "battle_tower.h"
#include "ewram.h"
#include "trainer.h"

#if GERMAN

extern u8 gTrainerClassNames[][13];
extern struct Trainer gTrainers[];

u8 *de_sub_8040FE0(u8 gender)
{
    if (gender)
        gender++;
    gender = TRAINER_CLASS_SCHOOL_KID;
    return gTrainerClassNames[gender];
}

u8 *de_sub_8040FF4(u8 gender)
{
    if (gender)
        gender++;
    gender = TRAINER_CLASS_POKEMON_TRAINER_3;
    return gTrainerClassNames[gender];
}

u8 *de_sub_804100C(u8 gender)
{
    if (gender)
        gender++;
    gender = TRAINER_CLASS_LEADER;
    return gTrainerClassNames[gender];
}

#ifdef NONMATCHING

u8 de_sub_81364AC(void);
u8 get_trainer_class_name_index(void);
u8 de_sub_81364F8(void);

u8 *de_sub_8041024(s32 arg0, u32 arg1)
{
    u8 nameIndex, trainerClass, gender;
    struct Trainer *trainer;
    u8 local2;

    switch (arg0)
    {
    case 0x400:
        nameIndex = GetSecretBaseTrainerNameIndex();
        gender = eSecretBaseRecord.gender;
        if (nameIndex == TRAINER_CLASS_SCHOOL_KID)
            return de_sub_8040FE0(gender);
        return gTrainerClassNames[nameIndex];
    case 0x100:
        trainerClass = de_sub_81364AC();
        nameIndex = get_trainer_class_name_index();
        if (trainerClass == FACILITY_CLASS_SCHOOL_KID_F)
            return de_sub_8040FE0(FEMALE);
        if (trainerClass == FACILITY_CLASS_MAY_1 || trainerClass == FACILITY_CLASS_MAY_2 || trainerClass == FACILITY_CLASS_MAY_3)
            return de_sub_8040FF4(FEMALE);
        return gTrainerClassNames[nameIndex];
    case 0x800:
        trainerClass = de_sub_81364F8();
        nameIndex = GetEReaderTrainerClassNameIndex();
        if (trainerClass == FACILITY_CLASS_SCHOOL_KID_F)
            return de_sub_8040FE0(FEMALE);
        if (trainerClass == FACILITY_CLASS_MAY_1 || trainerClass == FACILITY_CLASS_MAY_2 || trainerClass == FACILITY_CLASS_MAY_3)
            return de_sub_8040FF4(FEMALE);
        return gTrainerClassNames[nameIndex];
    default:
        trainer = &gTrainers[arg1];
        trainerClass = trainer->trainerClass;
        local2 = sub_803FC58(arg1);
        if (trainerClass == FACILITY_CLASS_LEADER_F)
            return de_sub_8040FE0(local2);
        if (trainerClass == FACILITY_CLASS_BIRD_KEEPER && local2 == FEMALE)
            return de_sub_8040FF4(FEMALE);
        if (trainerClass == FACILITY_CLASS_ELITE_FOUR_F)
        {
            if (gTrainers[arg1].doubleBattle == TRUE)
                return de_sub_804100C(FEMALE);
            else
                return de_sub_804100C(MALE);
        }
        return gTrainerClassNames[trainerClass];
    }
}
#else

NAKED
void de_sub_8041024(void) {
    asm(".syntax unified\n\
    push {r4-r6,lr}\n\
    adds r2, r0, 0\n\
    adds r6, r1, 0\n\
    movs r0, 0x80\n\
    lsls r0, 3\n\
    cmp r2, r0\n\
    beq _0804104A\n\
    cmp r2, r0\n\
    bgt _08041040\n\
    movs r0, 0x80\n\
    lsls r0, 1\n\
    cmp r2, r0\n\
    beq _08041064\n\
    b _0804109C\n\
_08041040:\n\
    movs r0, 0x80\n\
    lsls r0, 4\n\
    cmp r2, r0\n\
    beq _08041086\n\
    b _0804109C\n\
_0804104A:\n\
    bl GetSecretBaseTrainerNameIndex\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    ldr r0, _08041060 @ =gSharedMem + 0x17000\n\
    ldrb r0, [r0, 0x1]\n\
    lsls r0, 27\n\
    lsrs r2, r0, 31\n\
    cmp r5, 0x1A\n\
    beq _080410B8\n\
    b _080410F8\n\
    .align 2, 0\n\
_08041060: .4byte gSharedMem + 0x17000\n\
_08041064:\n\
    bl de_sub_81364AC\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    bl get_trainer_class_name_index\n\
_08041070:\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    cmp r4, 0x1E\n\
    beq _08041094\n\
    adds r0, r4, 0\n\
    subs r0, 0x3D\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0x2\n\
    bls _080410CC\n\
    b _080410F8\n\
_08041086:\n\
    bl de_sub_81364F8\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    bl GetEReaderTrainerClassNameIndex\n\
    b _08041070\n\
_08041094:\n\
    movs r0, 0x1\n\
    bl de_sub_8040FE0\n\
    b _08041102\n\
_0804109C:\n\
    ldr r1, _080410C0 @ =gTrainers\n\
    lsls r4, r6, 2\n\
    adds r0, r4, r6\n\
    lsls r0, 3\n\
    adds r0, r1\n\
    ldrb r5, [r0, 0x1]\n\
    lsls r0, r6, 16\n\
    lsrs r0, 16\n\
    bl sub_803FC58\n\
    lsls r0, 24\n\
    lsrs r2, r0, 24\n\
    cmp r5, 0x1A\n\
    bne _080410C4\n\
_080410B8:\n\
    adds r0, r2, 0\n\
    bl de_sub_8040FE0\n\
    b _08041102\n\
    .align 2, 0\n\
_080410C0: .4byte gTrainers\n\
_080410C4:\n\
    cmp r5, 0x2E\n\
    bne _080410D4\n\
    cmp r2, 0x1\n\
    bne _080410D4\n\
_080410CC:\n\
    movs r0, 0x1\n\
    bl de_sub_8040FF4\n\
    b _08041102\n\
_080410D4:\n\
    cmp r5, 0x19\n\
    bne _080410F8\n\
    ldr r0, _080410F4 @ =gTrainers\n\
    adds r1, r4, r6\n\
    lsls r1, 3\n\
    adds r1, r0\n\
    ldrb r0, [r1, 0x18]\n\
    movs r2, 0\n\
    cmp r0, 0x1\n\
    bne _080410EA\n\
    movs r2, 0x1\n\
_080410EA:\n\
    adds r0, r2, 0\n\
    bl de_sub_804100C\n\
    b _08041102\n\
    .align 2, 0\n\
_080410F4: .4byte gTrainers\n\
_080410F8:\n\
    movs r0, 0xD\n\
    adds r1, r5, 0\n\
    muls r1, r0\n\
    ldr r0, _08041108 @ =gTrainerClassNames\n\
    adds r0, r1, r0\n\
_08041102:\n\
    pop {r4-r6}\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_08041108: .4byte gTrainerClassNames\n\
    .syntax divided\n");
}
#endif

u32 de_sub_804110C(u32 arg0, u32 arg1)
{
    return arg1;
}

#endif
