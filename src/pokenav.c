#include "global.h"
#include "pokenav.h"
#include "battle.h"
#include "data2.h"
#include "string_util.h"

void sub_80F700C(u8 *arg0, u16 arg1) {
    struct Trainer *trainer;
    u8 *ptr;

    trainer = (struct Trainer *) &gTrainers[gUnknown_083DFEC4->unkCEE8[arg1].unk0];

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
