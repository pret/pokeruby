
// Includes
#include "global.h"
#include "ewram.h"
#include "trig.h"
#include "pokenav.h"

// Static type declarations

// Static RAM declarations

EWRAM_DATA u8 gUnknown_020388B0[4] = {};
EWRAM_DATA u16 gUnknown_020388B4 = 0;

// Static ROM declarations

// .rodata

struct UnkPokenavStruct *const gPokenavStructPtr = (struct UnkPokenavStruct *)gSharedMem;

extern const u8 gUnknown_083E4890[];

// .text

void sub_80F55AC(u8 *a0, struct UnkPokenav11 a1[])
{
    u16 i;
    u8 r2 = gUnknown_083E4890[*a0++];
    u8 r7;
    s8 r12;

    a1[0].unk0 = 0x9b;
    a1[0].unk2 = 0x5b - r2;

    r7 = 0x40;
    r12 = 0;
    for (i = 1; i < 5; i++)
    {
        r7 += 0x33;
        r12--;
        if (r12 < 0)
            r12 = 4;
        if (r12 == 2)
            r7++;
        r2 = gUnknown_083E4890[*a0++];
        a1[r12].unk0 = ((r2 * gSineTable[r7 + 0x40]) >> 8) + 0x9b;
        a1[r12].unk2 = 0x5b - ((r2 * gSineTable[r7]) >> 8);

        if (r12 <= 2 && (r2 != 0x20 || r12 != 2))
            a1[r12].unk0 = ((r2 * gSineTable[r7 + 0x40]) >> 8) + 0x9c;
    }
}

void sub_80F567C(u8 *a0, struct UnkPokenav11 a1[])
{
    sub_80F55AC(a0, a1);
}
