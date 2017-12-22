#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "ewram.h"
#include "palette.h"
#include "decompress.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

extern u16 gUnknown_083D7A5C[5];

extern struct INCBIN_U8 gBattleAnimSpritePalette_206;

// glow (a whitening effect where the Pokemon glows white in a cycle.)
// Used in Heal Bell.

void sub_80D1ADC(u8 taskId)
{
    int i;
    u8 sp[8];
    void* src;
    void* dest;
    void* what;
    sp[0] = IndexOfSpritePaletteTag(0x27DE);
    for (i = 1; i <= 4; i++)
    {
        sp[i] = AllocSpritePalette(0x2710 - i);
    }

    src = &gBattleAnimSpritePalette_206;
    dest = (NotInBattle()) ? gSharedMem + 0x18000 - 0x3800: gSharedMem + 0x18000;
    LZDecompressWram(src, dest);
    for (i = 0; i <= 4; i++)
    {
        what = ((NotInBattle()) ? gSharedMem + 0x14800 : gSharedMem + 0x18000) + (i << 5);
        LoadPalette(what, (u16)((sp[i] << 4) + 0x100), 32);
    }

    DestroyAnimVisualTask(taskId);
}

void sub_80D1B80(u8 taskId)
{
    int i;
    for (i = 0; i < 5; i++)
    {
        FreeSpritePaletteByTag(gUnknown_083D7A5C[i]);
    }

    DestroyAnimVisualTask(taskId);
}
