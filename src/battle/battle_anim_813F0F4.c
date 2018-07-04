#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "blend_palette.h"
#include "decompress.h"
#include "ewram.h"
#include "palette.h"
#include "pokeball.h"
#include "rom_8077ABC.h"
#include "sprite.h"
#include "task.h"
#include "util.h"
#include "constants/items.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern u8 gHealthboxIDs[];
extern u8 gBankSpriteIds[];
extern u16 gBattlerPartyIndexes[];
extern u16 gLastUsedItem;

extern const u8 gUnknown_08D2EE48[];
extern const u8 gUnknown_08D2EDFC[];
extern const u16 gUnknown_08D2E150[];

static void sub_813F300(u8 taskId);
static void sub_813F6CC(u8 taskId);
u8 ball_number_to_ball_processing_index(u16);
u8 sub_814086C(u8, u8, int, int, u8);
u8 sub_8141314(u8, u8, int, u8);
void sub_813FD90(struct Sprite *sprite);
void sub_813FB7C(u8 taskId);


void unref_sub_813F0F4(u8 taskId)
{
    struct Struct_sub_8078914 subStruct;
    u8 healthBoxSpriteId;
    u8 battler;
    u8 spriteId1, spriteId2, spriteId3, spriteId4;

    battler = gAnimBankAttacker;
    gBattle_WIN0H = 0;
    gBattle_WIN0V = 0;
    REG_WININ = 0x3F3F;
    REG_WINOUT = 0x3F3D;
    REG_DISPCNT |= DISPCNT_OBJWIN_ON;
    REG_BLDCNT = 0x3F42;
    REG_BLDALPHA = 0x1000;
    REG_BG1CNT_BITFIELD.priority = 0;
    REG_BG1CNT_BITFIELD.screenSize = 0;
    REG_BG1CNT_BITFIELD.areaOverflowMode = 1;
    REG_BG1CNT_BITFIELD.charBaseBlock = 1;

    healthBoxSpriteId = gHealthboxIDs[battler];
    spriteId1 = gSprites[healthBoxSpriteId].oam.affineParam;
    spriteId2 = gSprites[healthBoxSpriteId].data[5];
    spriteId3 = CreateInvisibleSpriteWithCallback(SpriteCallbackDummy);
    spriteId4 = CreateInvisibleSpriteWithCallback(SpriteCallbackDummy);
    gSprites[healthBoxSpriteId].oam.priority = 1;
    gSprites[spriteId1].oam.priority = 1;
    gSprites[spriteId2].oam.priority = 1;
    gSprites[spriteId3] = gSprites[healthBoxSpriteId];
    gSprites[spriteId4] = gSprites[spriteId1];
    gSprites[spriteId3].oam.objMode = ST_OAM_OBJ_WINDOW;
    gSprites[spriteId4].oam.objMode = ST_OAM_OBJ_WINDOW;
    gSprites[spriteId3].callback = SpriteCallbackDummy;
    gSprites[spriteId4].callback = SpriteCallbackDummy;

    sub_8078914(&subStruct);
    DmaFill32Defvars(3, 0, subStruct.field_4, 0x1000);
    LZDecompressVram(&gUnknown_08D2EE48, subStruct.field_4);
    LZDecompressVram(&gUnknown_08D2EDFC, subStruct.field_0);
    LoadCompressedPalette(gUnknown_08D2E150, subStruct.field_8 << 4, 32);

    gBattle_BG1_X = -gSprites[spriteId3].pos1.x + 32;
    gBattle_BG1_Y = -gSprites[spriteId3].pos1.y - 32;
    gTasks[taskId].data[1] = 640;
    gTasks[taskId].data[0] = spriteId3;
    gTasks[taskId].data[2] = spriteId4;
    gTasks[taskId].func = sub_813F300;
}

static void sub_813F300(u8 taskId)
{
    struct Struct_sub_8078914 subStruct;
    u8 spriteId1, spriteId2;
    u8 battler;

    battler = gAnimBankAttacker;
    gTasks[taskId].data[13] += gTasks[taskId].data[1];
    gBattle_BG1_Y += (u16)gTasks[taskId].data[13] >> 8;
    gTasks[taskId].data[13] &= 0xFF;

    switch (gTasks[taskId].data[15])
    {
    case 0:
        if (gTasks[taskId].data[11]++ > 1)
        {
            gTasks[taskId].data[11] = 0;
            gTasks[taskId].data[12]++;
            REG_BLDALPHA = ((16 - gTasks[taskId].data[12]) << 8) | gTasks[taskId].data[12];
            if (gTasks[taskId].data[12] == 8)
                gTasks[taskId].data[15]++;
        }
        break;
    case 1:
        if (++gTasks[taskId].data[10] == 30)
            gTasks[taskId].data[15]++;
        break;
    case 2:
        if (gTasks[taskId].data[11]++ > 1)
        {
            gTasks[taskId].data[11] = 0;
            gTasks[taskId].data[12]--;
            REG_BLDALPHA = ((16 - gTasks[taskId].data[12]) << 8) | gTasks[taskId].data[12];
            if (gTasks[taskId].data[12] == 0)
            {
                sub_8076464(0);
                gBattle_WIN0H = 0;
                gBattle_WIN0V = 0;
                REG_WININ = 0x3F3F;
                REG_WINOUT = 0x3F3F;
                if (!IsContest())
                    REG_BG1CNT_BITFIELD.charBaseBlock = 0;

                REG_DISPCNT ^= DISPCNT_OBJWIN_ON;
                REG_BLDCNT = 0;
                REG_BLDALPHA = 0;
                DestroySprite(&gSprites[gTasks[taskId].data[0]]);
                DestroySprite(&gSprites[gTasks[taskId].data[2]]);
                sub_8078914(&subStruct);
                DmaFill32Defvars(3, 0, subStruct.field_4, 0x800);
                REG_BG1CNT_BITFIELD.areaOverflowMode = 0;
                spriteId1 = gSprites[gHealthboxIDs[battler]].oam.affineParam;
                spriteId2 = gSprites[gHealthboxIDs[battler]].data[5];
                gSprites[gHealthboxIDs[battler]].oam.priority = 1;
                gSprites[spriteId1].oam.priority = 1;
                gSprites[spriteId2].oam.priority = 1;
                DestroyAnimVisualTask(taskId);
            }
        }
        break;
    }
}

void sub_813F4EC(u8 taskId)
{
    u8 healthBoxSpriteId;
    u8 spriteId1, spriteId2;
    u8 paletteNum1, paletteNum2;
    u16 offset1, offset2;

    healthBoxSpriteId = gHealthboxIDs[gAnimBankAttacker];
    spriteId1 = gSprites[healthBoxSpriteId].oam.affineParam;
    spriteId2 = gSprites[healthBoxSpriteId].data[5];
    paletteNum1 = AllocSpritePalette(0xD709);
    paletteNum2 = AllocSpritePalette(0xD70A);

    offset1 = (gSprites[healthBoxSpriteId].oam.paletteNum * 16) + 0x100;
    offset2 = (gSprites[spriteId2].oam.paletteNum * 16) + 0x100;
    LoadPalette(&gPlttBufferUnfaded[offset1], paletteNum1 * 16 + 0x100, 0x20);
    LoadPalette(&gPlttBufferUnfaded[offset2], paletteNum2 * 16 + 0x100, 0x20);

    gSprites[healthBoxSpriteId].oam.paletteNum = paletteNum1;
    gSprites[spriteId1].oam.paletteNum = paletteNum1;
    gSprites[spriteId2].oam.paletteNum = paletteNum2;
    DestroyAnimVisualTask(taskId);
}

void sub_813F5E8(u8 taskId)
{
    u8 healthBoxSpriteId;
    u8 spriteId1, spriteId2;
    u8 paletteIndex1, paletteIndex2;

    healthBoxSpriteId = gHealthboxIDs[gAnimBankAttacker];
    spriteId1 = gSprites[healthBoxSpriteId].oam.affineParam;
    spriteId2 = gSprites[healthBoxSpriteId].data[5];

    FreeSpritePaletteByTag(0xD709);
    FreeSpritePaletteByTag(0xD70A);
    paletteIndex1 = IndexOfSpritePaletteTag(0xD6FF);
    paletteIndex2 = IndexOfSpritePaletteTag(0xD704);
    gSprites[healthBoxSpriteId].oam.paletteNum = paletteIndex1;
    gSprites[spriteId1].oam.paletteNum = paletteIndex1;
    gSprites[spriteId2].oam.paletteNum = paletteIndex2;

    DestroyAnimVisualTask(taskId);
}

void sub_813F6A0(u8 taskId)
{
    gTasks[taskId].data[10] = gBattleAnimArgs[0];
    gTasks[taskId].data[11] = gBattleAnimArgs[1];
    gTasks[taskId].func = sub_813F6CC;
}

static void sub_813F6CC(u8 taskId)
{
    u8 paletteNum;
    int paletteOffset, colorOffset;

    gTasks[taskId].data[0]++;
    if (gTasks[taskId].data[0]++ >= gTasks[taskId].data[11])
    {
        gTasks[taskId].data[0] = 0;
        paletteNum = IndexOfSpritePaletteTag(0xD709);
        colorOffset = gTasks[taskId].data[10] == 0 ? 6 : 2;
        switch (gTasks[taskId].data[1])
        {
        case 0:
            gTasks[taskId].data[2] += 2;
            if (gTasks[taskId].data[2] > 16)
                gTasks[taskId].data[2] = 16;

            paletteOffset = paletteNum * 16 + 0x100;
            BlendPalette(paletteOffset + colorOffset, 1, gTasks[taskId].data[2], RGB(20, 27, 31));
            if (gTasks[taskId].data[2] == 16)
                gTasks[taskId].data[1]++;
            break;
        case 1:
            gTasks[taskId].data[2] -= 2;
            if (gTasks[taskId].data[2] < 0)
                gTasks[taskId].data[2] = 0;

            paletteOffset = paletteNum * 16 + 0x100;
            BlendPalette(paletteOffset + colorOffset, 1, gTasks[taskId].data[2], RGB(20, 27, 31));
            if (gTasks[taskId].data[2] == 0)
                DestroyAnimVisualTask(taskId);
            break;
        }
    }
}

void sub_813F798(u8 taskId)
{
    u8 spriteId;

    spriteId = gBankSpriteIds[gAnimBankAttacker];
    switch (gTasks[taskId].data[0])
    {
    case 0:
        sub_8078E70(spriteId, 0);
        gTasks[taskId].data[10] = 0x100;
        gTasks[taskId].data[0]++;
        break;
    case 1:
        gTasks[taskId].data[10] += 0x30;
        obj_id_set_rotscale(spriteId, gTasks[taskId].data[10], gTasks[taskId].data[10], 0);
        sub_8079A64(spriteId);
        if (gTasks[taskId].data[10] >= 0x2D0)
            gTasks[taskId].data[0]++;
        break;
    case 2:
        sub_8078F40(spriteId);
        gSprites[spriteId].invisible = 1;
        DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_813F844(u8 taskId)
{
    u8 spriteId;
    u16 ball;
    u8 ballIndex;
    u8 x, y;
    int priority, subpriority;
    u32 selectedPalettes;

    spriteId = gBankSpriteIds[gAnimBankAttacker];
    if (GetBattlerSide(gAnimBankAttacker) == B_SIDE_PLAYER)
        ball = GetMonData(&gPlayerParty[gBattlerPartyIndexes[gAnimBankAttacker]], MON_DATA_POKEBALL);
    else
        ball = GetMonData(&gEnemyParty[gBattlerPartyIndexes[gAnimBankAttacker]], MON_DATA_POKEBALL);

    ballIndex = ball_number_to_ball_processing_index(ball);
    switch (gTasks[taskId].data[0])
    {
    case 0:
        x = GetBattlerSpriteCoord(gAnimBankAttacker, 0);
        y = GetBattlerSpriteCoord(gAnimBankAttacker, 1);
        priority = gSprites[spriteId].oam.priority;
        subpriority = gSprites[spriteId].subpriority;
        gTasks[taskId].data[10] = sub_814086C(x, y + 32, priority, subpriority, ballIndex);
        selectedPalettes = sub_80791A8(1, 0, 0, 0, 0, 0, 0);
        gTasks[taskId].data[11] = sub_8141314(0, gAnimBankAttacker, selectedPalettes, ballIndex);
        gTasks[taskId].data[0]++;
        break;
    case 1:
        if (!gTasks[gTasks[taskId].data[10]].isActive && !gTasks[gTasks[taskId].data[11]].isActive)
            DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_813F990(u8 taskId)
{
    u8 ballIndex = ball_number_to_ball_processing_index(gLastUsedItem);
    sub_80478DC(ballIndex);
    DestroyAnimVisualTask(taskId);
}

void sub_813F9B8(u8 taskId)
{
    u8 ballIndex = ball_number_to_ball_processing_index(gLastUsedItem);
    sub_804794C(ballIndex);
    DestroyAnimVisualTask(taskId);
}

void sub_813F9E0(u8 taskId)
{
    if (ewram17840.unk8 == 5)
        gBattleAnimArgs[7] = -1;
    else
        gBattleAnimArgs[7] = 0;

    DestroyAnimVisualTask(taskId);
}

u8 ball_number_to_ball_processing_index(u16 ballItem)
{
    switch (ballItem)
    {
    case ITEM_MASTER_BALL:
        return 4;
    case ITEM_ULTRA_BALL:
        return 3;
    case ITEM_GREAT_BALL:
        return 1;
    case ITEM_SAFARI_BALL:
        return 2;
    case ITEM_NET_BALL:
        return 5;
    case ITEM_DIVE_BALL:
        return 6;
    case ITEM_NEST_BALL:
        return 7;
    case ITEM_REPEAT_BALL:
        return 8;
    case ITEM_TIMER_BALL:
        return 9;
    case ITEM_LUXURY_BALL:
        return 10;
    case ITEM_PREMIER_BALL:
        return 11;
    case ITEM_POKE_BALL:
    default:
        return 0;
    }
}

void sub_813FA94(u8 taskId)
{
    u8 ballIndex;
    u8 spriteId;

    ballIndex = ball_number_to_ball_processing_index(gLastUsedItem);
    spriteId = CreateSprite(&gBallSpriteTemplates[ballIndex], 32, 80, 29);
    gSprites[spriteId].data[0] = 34;
    gSprites[spriteId].data[1] = GetBattlerSpriteCoord(gAnimBankTarget, 0);
    gSprites[spriteId].data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 1) - 16;
    gSprites[spriteId].callback = sub_813FD90;
    ewram17840.unk9_1 = gSprites[gBankSpriteIds[gAnimBankTarget]].invisible;
    gTasks[taskId].data[0] = spriteId;
    gTasks[taskId].func = sub_813FB7C;
}
