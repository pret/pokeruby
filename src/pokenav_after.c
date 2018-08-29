#include "global.h"
#include "main.h"
#include "pokenav.h"
#include "battle.h"
#include "data2.h"
#include "text.h"
#include "de_rom_8040FE0.h"
#include "string_util.h"

void sub_80F700C(u8 *arg0, u16 arg1)
{
    const struct Trainer *trainer = &gTrainers[gUnknown_083DFEC4->unkCEE8[arg1].unk0];
    u8 *ptr = arg0;

    ptr = arg0;
    if (arg1 < gUnknown_083DFEC4->unkD158)
    {
#if ENGLISH
        ptr = StringCopy(ptr, gTrainerClassNames[trainer->trainerClass]);
#elif GERMAN
        ptr = StringCopy(ptr, de_sub_8041024(0, gUnknown_083DFEC4->unkCEE8[arg1].unk0));
#endif

        ptr[0] = EXT_CTRL_CODE_BEGIN;
        ptr[1] = 0x13;
        ptr[2] = 0x4B;
        ptr += 3;
        ptr = StringCopy(ptr, trainer->trainerName);
    }

    ptr[0] = EXT_CTRL_CODE_BEGIN;
    ptr[1] = 0x13;
    ptr[2] = 0x80;
    ptr[3] = 0xFF;
}
