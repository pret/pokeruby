#include "global.h"
#include "battle.h"
#include "data2.h"
#include "string_util.h"

struct UnkPokenavStruct_Sub
{
    /*0x0*/ u16 unk0;
    /*0x2*/ u8 filler2[6];
};

struct UnkPokenavStruct
{
    /*0x0000*/ u8 filler0000[0xCEE8];
    /*0xCEE8*/ struct UnkPokenavStruct_Sub unkCEE8[78];
    /*0xD158*/ u16 unkD158;
};

extern struct UnkPokenavStruct *gUnknown_083DFEC4;

void sub_80F700C(u8 *arg0, u16 arg1)
{
    struct Trainer *trainer;
    u8 *ptr;

    trainer = (struct Trainer *)&gTrainers[gUnknown_083DFEC4->unkCEE8[arg1].unk0];

    ptr = arg0;
    if (arg1 < gUnknown_083DFEC4->unkD158)
    {
        ptr = StringCopy(ptr, gTrainerClassNames[trainer->trainerClass]);

        ptr[0] = 0xFC;
        ptr[1] = 0x13;
        ptr[2] = 0x4B;
        ptr += 3;
        ptr = StringCopy(ptr, trainer->trainerName);
    }

    ptr[0] = 0xFC;
    ptr[1] = 0x13;
    ptr[2] = 0x80;
    ptr[3] = 0xFF;
}
