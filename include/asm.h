#ifndef PROJECT_ASM_H
#define PROJECT_ASM_H

#include "asm_fieldmap.h"
#include "main.h"
#include "sprite.h"
#include "task.h"

struct FieldInput
{
    u8 pressedAButton:1;
    u8 input_field_0_1:1;
    u8 pressedStartButton:1;
    u8 pressedSelectButton:1;
    u8 input_field_0_4:1;
    u8 input_field_0_5:1;
    u8 input_field_0_6:1;
    u8 pressedBButton:1;
    u8 input_field_1_0:1;
    u8 input_field_1_1:1;
    u8 input_field_1_2:1;
    u8 input_field_1_3:1;
    u8 input_field_1_4:1;
    u8 input_field_1_5:1;
    u8 input_field_1_6:1;
    u8 input_field_1_7:1;
    u8 dpadDirection;
    u8 input_field_3;
};

struct UnknownStruct_FPA
{
    u8 unk0;
    u8 unk1;
    u8 unk2;
    s16 unk4;
    s16 unk6;
    u8 unk8;
    u8 unk9;
    u8 unkA_0:4;
    u8 unkA_4:4;
    u16 unkC;
    u16 unkE;
    u32 unk10;
    u16 unk14;
};

struct CryRelatedStruct
{
    u16 unk0;
    u8 unk2;
    u8 paletteNo;
    u8 xPos;
    u8 yPos;
};

#include "asm.inc.h"

#endif //PROJECT_ASM_H
