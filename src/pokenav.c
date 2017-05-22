#include "global.h"
#include "battle.h"
#include "string_util.h"

struct UnkPokenavStruct_Sub {
    /*0x0*/ u16 unk0;
    /*0x2*/ u8 filler2[6];
};


struct UnkPokenavStruct {
    /*0x0000*/ u8 filler0000[0xCEE8];
    /*0xCEE8*/ struct UnkPokenavStruct_Sub unkCEE8[78];
    /*0xD158*/ u16 unkD158;

};

extern struct UnkPokenavStruct *gUnknown_083DFEC4;

extern const struct Trainer gTrainers[];
extern const u8 gTrainerClassNames[][13];


u8 *de_sub_8041024(s32 arg0, u32 arg1);

void sub_80F700C(u8 *arg0, u16 arg1) {
    struct Trainer *trainer;
    u8 *ptr;

    const u16 trainerIndex = gUnknown_083DFEC4->unkCEE8[arg1].unk0;
    trainer = (struct Trainer *) &gTrainers[trainerIndex];

    ptr = arg0;
    if (arg1 < gUnknown_083DFEC4->unkD158)
    {
        ptr = StringCopy(ptr, de_sub_8041024(0, trainerIndex));

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
