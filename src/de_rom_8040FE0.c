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

u8 de_sub_81364AC(void);
u8 get_trainer_class_name_index(void);
u8 de_sub_81364F8(void);

//arg0 should be u32, arg1 should be u16
u8 *de_sub_8041024(s32 arg0, u32 arg1)
{
    u8 nameIndex, trainerClass;
    u8 gender;
    u8 * retVal;
    switch (arg0)
    {
    case 0x400:
        nameIndex = GetSecretBaseTrainerNameIndex();
        gender = eSecretBaseRecord->gender;
        if (nameIndex == TRAINER_CLASS_SCHOOL_KID) 
        {
            retVal = de_sub_8040FE0(gender);
            break;
        }

        retVal = gTrainerClassNames[nameIndex];
            
        break;
    case 0x100:
        trainerClass = de_sub_81364AC();
        nameIndex = get_trainer_class_name_index();
        if (trainerClass == FACILITY_CLASS_SCHOOL_KID_F)
        {
            retVal = de_sub_8040FE0(FEMALE);
            break;
        } 
        if (trainerClass == FACILITY_CLASS_MAY_1 || trainerClass == FACILITY_CLASS_MAY_2 || trainerClass == FACILITY_CLASS_MAY_3)
        {
            retVal = de_sub_8040FF4(FEMALE);
            break;
        }
        retVal = gTrainerClassNames[nameIndex];
        break;
    case 0x800:
        trainerClass = de_sub_81364F8();
        nameIndex = GetEReaderTrainerClassNameIndex();
        if (trainerClass == FACILITY_CLASS_SCHOOL_KID_F)
        {
            retVal = de_sub_8040FE0(FEMALE);
            break;
        } 
        if (trainerClass == FACILITY_CLASS_MAY_1 || trainerClass == FACILITY_CLASS_MAY_2 || trainerClass == FACILITY_CLASS_MAY_3)
        {
            retVal = de_sub_8040FF4(FEMALE);
            break;
        }
        retVal = gTrainerClassNames[nameIndex];
        break;
    default:
        nameIndex = gTrainers[arg1].trainerClass;
        gender = sub_803FC58(arg1);
        
        if (nameIndex == FACILITY_CLASS_LEADER_F) {


            retVal =  de_sub_8040FE0(gender);
        }

        else if (nameIndex == FACILITY_CLASS_BIRD_KEEPER && gender == FEMALE) {
            retVal =  de_sub_8040FF4(FEMALE);
        }
        
        else if  (nameIndex == FACILITY_CLASS_ELITE_FOUR_F) {

            if (gTrainers[arg1].doubleBattle == TRUE)
                gender = FEMALE;
            else
                gender = MALE;
            retVal = de_sub_804100C(gender);
        }
        else
            retVal = gTrainerClassNames[nameIndex];
        break;
    }
    return retVal;
}

u32 de_sub_804110C(u32 arg0, u32 arg1)
{
    return arg1;
}

#endif
