#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "decompress.h"
#include "palette.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

extern const u8 gBattleAnimBackgroundTilemap_ScaryFaceContest[];
extern const u8 gBattleAnimBackgroundTilemap_ScaryFacePlayer[];
extern const u8 gBattleAnimBackgroundTilemap_ScaryFaceOpponent[];
extern const u8 gBattleAnimBackgroundImage_ScaryFace[];
extern const u8 gBattleAnimBackgroundPalette_ScaryFace[];

extern u16 gBattle_BG1_Y;
extern u16 gBattle_BG1_X;

static void sub_80D24E0(u8 taskId);

// scary_face (darkens the screen and shows a scary face.)
// Used in Glare and Scary Face.

void sub_80D23B4(u8 taskId)
{
    struct Struct_sub_8078914 subStruct;

    REG_BLDCNT = 0x3F42;
    REG_BLDALPHA = 0x1000;
    REG_BG1CNT_BITFIELD.priority = 1;
    REG_BG1CNT_BITFIELD.screenSize = 0;
    if (!IsContest())
        REG_BG1CNT_BITFIELD.charBaseBlock = 1;

    gBattle_BG1_X = 0;
    gBattle_BG1_Y = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    sub_8078914(&subStruct);
    DmaFill32Defvars(3, 0, subStruct.field_4, 0x1000);
    if (IsContest())
        LZDecompressVram(&gBattleAnimBackgroundTilemap_ScaryFaceContest, subStruct.field_4);
    else if (GetBattlerSide(gAnimBankTarget) == 1)
        LZDecompressVram(&gBattleAnimBackgroundTilemap_ScaryFacePlayer, subStruct.field_4);
    else
        LZDecompressVram(&gBattleAnimBackgroundTilemap_ScaryFaceOpponent, subStruct.field_4);

    LZDecompressVram(&gBattleAnimBackgroundImage_ScaryFace, subStruct.field_0);
    LoadCompressedPalette(&gBattleAnimBackgroundPalette_ScaryFace, subStruct.field_8 << 4, 32);
    if (IsContest())
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
        DmaFill32Large(3, 0, subStruct.field_0, 0x2000, 0x1000);
        DmaClear32(3, subStruct.field_4, 0x800);
        if (!IsContest())
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
