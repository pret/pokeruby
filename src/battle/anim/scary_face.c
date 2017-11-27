#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "decompress.h"
#include "palette.h"

struct Struct_sub_8078914
{
    u8 *field_0;
    u8 *field_4;
    u8 field_8;
};

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

extern struct INCBIN_U8 gBattleAnimBackgroundTilemap_ScaryFaceContest;
extern struct INCBIN_U8 gBattleAnimBackgroundTilemap_ScaryFacePlayer;
extern struct INCBIN_U8 gBattleAnimBackgroundTilemap_ScaryFaceOpponent;
extern struct INCBIN_U8 gBattleAnimBackgroundImage_ScaryFace;
extern struct INCBIN_U8 gBattleAnimBackgroundPalette_ScaryFace;

extern u16 gUnknown_030041B4;
extern u16 gUnknown_030042C0;

static void sub_80D24E0(u8 taskId);

// scary_face (darkens the screen and shows a scary face.)
// Used in Glare and Scary Face.

void sub_80D23B4(u8 taskId)
{
    struct Struct_sub_8078914 subStruct;
    u8* tempvar;
    REG_BLDCNT = 0x3F42;
    REG_BLDALPHA = 0x1000;
    REG_BG1CNT_BITFIELD.priority = 1;
    REG_BG1CNT_BITFIELD.screenSize = 0;
    if (!NotInBattle())
        REG_BG1CNT_BITFIELD.charBaseBlock = 1;

    gUnknown_030042C0 = 0;
    gUnknown_030041B4 = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    sub_8078914(&subStruct);
    tempvar = subStruct.field_4;
    DmaFill32(3, 0x0, tempvar, 0x1000);
    if (NotInBattle())
        LZDecompressVram(&gBattleAnimBackgroundTilemap_ScaryFaceContest, subStruct.field_4);
    else if (GetBankSide(gBattleAnimBankTarget) == 1)
        LZDecompressVram(&gBattleAnimBackgroundTilemap_ScaryFacePlayer, subStruct.field_4);
    else
        LZDecompressVram(&gBattleAnimBackgroundTilemap_ScaryFaceOpponent, subStruct.field_4);

    LZDecompressVram(&gBattleAnimBackgroundImage_ScaryFace, subStruct.field_0);
    LoadCompressedPalette(&gBattleAnimBackgroundPalette_ScaryFace, subStruct.field_8 << 4, 32);
    if (NotInBattle())
        sub_80763FC(subStruct.field_8, (u16 *)subStruct.field_4, 0, 0);

    gTasks[taskId].func = sub_80D24E0;
}

void sub_80D24E0(u8 taskId)
{
    struct Struct_sub_8078914 subStruct;

    switch (gTasks[taskId].data[12])
    {
    case 0:
        if (++gTasks[taskId].data[10] == 2)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[11]++;
            REG_BLDALPHA = gTasks[taskId].data[11] | ((16 - gTasks[taskId].data[11]) << 8);
            if (gTasks[taskId].data[11] == 14)
            {
                gTasks[taskId].data[12]++;
                gTasks[taskId].data[11] = 0;
            }
        }
        break;
    case 1:
        if (++gTasks[taskId].data[11] == 0x15)
        {
            gTasks[taskId].data[11] = 14;
            gTasks[taskId].data[12]++;
        }
        break;
    case 2:
        if (++gTasks[taskId].data[10] == 2)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[11]--;
            REG_BLDALPHA = gTasks[taskId].data[11] | ((16 - gTasks[taskId].data[11]) << 8);
            if (gTasks[taskId].data[11] == 0)
            {
                gTasks[taskId].data[12]++;
                gTasks[taskId].data[11] = 0;
            }
        }
        break;
    case 3:
        sub_8078914(&subStruct);
        {
            u8 *addr = subStruct.field_0;
            u32 size = 0x2000;
            while (1)
            {
                DmaFill32(3, 0, addr, 0x1000);
                addr += 0x1000;
                size -= 0x1000;
                if (size <= 0x1000)
                {
                    DmaFill32(3, 0, addr, size);
                    break;
                }
            }
        }
        DmaClear32(3, subStruct.field_4, 0x800);
        if (!NotInBattle())
            REG_BG1CNT_BITFIELD.charBaseBlock = 0;

        gTasks[taskId].data[12]++;
        // fall through
    case 4:
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        REG_BG1CNT_BITFIELD.priority = 1;
        DestroyAnimVisualTask(taskId);
        break;
    }
}
