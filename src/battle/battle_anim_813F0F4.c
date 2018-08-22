#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_anim_813F0F4.h"
#include "battle_interface.h"
#include "blend_palette.h"
#include "decompress.h"
#include "ewram.h"
#include "m4a.h"
#include "main.h"
#include "palette.h"
#include "pokeball.h"
#include "rom_8077ABC.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "util.h"
#include "constants/items.h"
#include "constants/songs.h"

extern int gUnknown_03005F0C;
extern u16 gUnknown_03005F10;
extern u16 gUnknown_03005F14;

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern u8 gHealthboxIDs[];
extern u8 gBankSpriteIds[];
extern u16 gBattlerPartyIndexes[];
extern u16 gLastUsedItem;
extern u8 gDoingBattleAnim;
extern u8 gEffectBank;

extern const u8 gUnknown_08D2EE48[];
extern const u8 gUnknown_08D2EDFC[];
extern const u16 gUnknown_08D2E150[];
extern const struct CompressedSpritePalette gBallOpenParticlePalettes[];
extern const struct SpriteTemplate gSpriteTemplates_840B3B4[];
extern const struct SpriteTemplate gSpriteTemplate_8402500;
extern const struct SpriteTemplate gBattleAnimSpriteTemplate_84024E8;
extern const u8 gBallOpenParticleAnimNums[];
extern const struct CompressedSpriteSheet gBallOpenParticleSpritesheets[];
extern const TaskFunc gBallOpenParticleAnimationFuncs[];
extern const u16 gUnknown_0840B4D4[];
extern const struct CompressedSpriteSheet gBattleAnimPicTable[];
extern const struct CompressedSpritePalette gBattleAnimPaletteTable[];

static void sub_813F300(u8 taskId);
static void sub_813F6CC(u8 taskId);
static void sub_813FD34(u8 taskId);
static void sub_813FD90(struct Sprite *sprite);
static void sub_813FB7C(u8 taskId);
static void sub_813FCBC(u8 taskId);
static void sub_813FDC0(struct Sprite *sprite);
static void sub_813FE70(struct Sprite *sprite);
static void sub_81407B8(struct Sprite *sprite);
static void sub_813FEC8(struct Sprite *sprite);
static void sub_8140014(struct Sprite *sprite);
static void sub_8140058(struct Sprite *sprite);
static void sub_8140410(struct Sprite *sprite);
static void sub_8140158(struct Sprite *sprite);
static void sub_81401A0(struct Sprite *sprite);
static void sub_8140434(struct Sprite *sprite);
static void sub_81405F4(struct Sprite *sprite);
static void sub_8140454(struct Sprite *sprite);
static void sub_81404E4(struct Sprite *sprite);
static void sub_81405C8(struct Sprite *sprite);
static void sub_81406BC(struct Sprite *sprite);
static void sub_81407F4(struct Sprite *sprite);
static void PokeBallOpenParticleAnimation_Step1(struct Sprite *sprite);
static void PokeBallOpenParticleAnimation_Step2(struct Sprite *sprite);
static void DestroyBallOpenAnimationParticle(struct Sprite *sprite);
static void FanOutBallOpenParticles_Step1(struct Sprite *sprite);
static void RepeatBallOpenParticleAnimation_Step1(struct Sprite *sprite);
static void PremierBallOpenParticleAnimation_Step1(struct Sprite *sprite);
static void sub_81413DC(u8 taskId);
static void sub_814146C(u8 taskId);
static void sub_81414BC(u8 taskId);
static void sub_814191C(u8 taskId);
static void sub_8141B20(struct Sprite *sprite);
static void sub_8141B74(struct Sprite *sprite);
static void sub_8141AD8(u8 taskId);
static void sub_8141CBC(struct Sprite *sprite);
static void sub_8141CF4(struct Sprite *sprite);
static void sub_8141D20(struct Sprite *sprite);


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
    u8 priority, subpriority;
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
        gTasks[taskId].data[10] = AnimateBallOpenParticles(x, y + 32, priority, subpriority, ballIndex);
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
    LoadBallGraphics(ballIndex);
    DestroyAnimVisualTask(taskId);
}

void sub_813F9B8(u8 taskId)
{
    u8 ballIndex = ball_number_to_ball_processing_index(gLastUsedItem);
    FreeBallGraphics(ballIndex);
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

static void sub_813FB7C(u8 taskId)
{
    u8 spriteId = gTasks[taskId].data[0];
    if ((u16)gSprites[spriteId].data[0] == 0xFFFF)
        DestroyAnimVisualTask(taskId);
}

void sub_813FBB8(u8 taskId)
{
    int x, y;
    u8 ballIndex;
    u8 subpriority;
    u8 spriteId;

    if (gBattleTypeFlags & BATTLE_TYPE_WALLY_TUTORIAL)
    {
        x = 32;
        y = 11;
    }
    else
    {
        x = 23;
        y = 5;
    }

    ballIndex = ball_number_to_ball_processing_index(gLastUsedItem);
    subpriority = sub_8079E90(GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT)) + 1;
    spriteId = CreateSprite(&gBallSpriteTemplates[ballIndex], x + 32, y | 80, subpriority);
    gSprites[spriteId].data[0] = 34;
    gSprites[spriteId].data[1] = GetBattlerSpriteCoord(gAnimBankTarget, 0);
    gSprites[spriteId].data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 1) - 16;
    gSprites[spriteId].callback = SpriteCallbackDummy;
    StartSpriteAnim(&gSprites[gBankSpriteIds[GetBattlerAtPosition(B_POSITION_PLAYER_LEFT)]], 1);
    gTasks[taskId].data[0] = spriteId;
    gTasks[taskId].func = sub_813FCBC;
}

static void sub_813FCBC(u8 taskId)
{
    if (gSprites[gBankSpriteIds[GetBattlerAtPosition(B_POSITION_PLAYER_LEFT)]].animCmdIndex == 1)
    {
        PlaySE12WithPanning(SE_NAGERU, 0);
        gSprites[gTasks[taskId].data[0]].callback = sub_813FD90;
        CreateTask(sub_813FD34, 10);
        gTasks[taskId].func = sub_813FB7C;
    }
}

static void sub_813FD34(u8 taskId)
{
    if (gSprites[gBankSpriteIds[GetBattlerAtPosition(B_POSITION_PLAYER_LEFT)]].animEnded)
    {
        StartSpriteAnim(&gSprites[gBankSpriteIds[GetBattlerAtPosition(B_POSITION_PLAYER_LEFT)]], 0);
        DestroyTask(taskId);
    }
}

static void sub_813FD90(struct Sprite *sprite)
{
    u16 temp = sprite->data[1];
    u16 temp2 = sprite->data[2];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = temp;
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = temp2;
    sprite->data[5] = -40;
    InitAnimArcTranslation(sprite);
    sprite->callback = sub_813FDC0;
}

static void sub_813FDC0(struct Sprite *sprite)
{
    int i;
    u8 ballIndex;
    int ballIndex2; // extra var needed to match

    if (TranslateAnimArc(sprite))
    {
        if (ewram17840.unk8 == 5)
        {
            sprite->callback = sub_81407B8;
        }
        else
        {
            StartSpriteAnim(sprite, 1);
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->pos2.x = 0;
            sprite->pos2.y = 0;

            for (i = 0; i < 8; i++)
            {
                sprite->data[i] = 0;
            }

            sprite->data[5] = 0;
            sprite->callback = sub_813FE70;
            ballIndex = ball_number_to_ball_processing_index(gLastUsedItem);
            ballIndex2 = ballIndex;
            if (ballIndex2 > 11)
                return;
            if (ballIndex2 < 0)
                return;

            AnimateBallOpenParticles(sprite->pos1.x, sprite->pos1.y - 5, 1, 28, ballIndex);
            sub_8141314(0, gAnimBankTarget, 14, ballIndex);
        }
    }
}

static void sub_813FE70(struct Sprite *sprite)
{
    if (++sprite->data[5] == 10)
    {
        sprite->data[5] = CreateTask(TaskDummy, 50);
        sprite->callback = sub_813FEC8;
        gSprites[gBankSpriteIds[gAnimBankTarget]].data[1] = 0;
    }
}

static void sub_813FEC8(struct Sprite *sprite)
{
    u8 spriteId;
    u8 taskId;

    spriteId = gBankSpriteIds[gAnimBankTarget];
    taskId = sprite->data[5];

    if (++gTasks[taskId].data[1] == 11)
        PlaySE(SE_SUIKOMU);

    switch (gTasks[taskId].data[0])
    {
    case 0:
        sub_8078E70(spriteId, 0);
        gTasks[taskId].data[10] = 256;
        gUnknown_03005F0C = 28;
        gUnknown_03005F14 = (gSprites[spriteId].pos1.y + gSprites[spriteId].pos2.y) - (sprite->pos1.y + sprite->pos2.y);
        gUnknown_03005F10 = (u32)(gUnknown_03005F14 * 256) / 28;
        gTasks[taskId].data[2] = gUnknown_03005F10;
        gTasks[taskId].data[0]++;
        break;
    case 1:
        gTasks[taskId].data[10] += 0x20;
        obj_id_set_rotscale(spriteId, gTasks[taskId].data[10], gTasks[taskId].data[10], 0);
        gTasks[taskId].data[3] += gTasks[taskId].data[2];
        gSprites[spriteId].pos2.y = -gTasks[taskId].data[3] >> 8;
        if (gTasks[taskId].data[10] >= 0x480)
            gTasks[taskId].data[0]++;
        break;
    case 2:
        sub_8078F40(spriteId);
        gSprites[spriteId].invisible = 1;
        gTasks[taskId].data[0]++;
        break;
    default:
        if (gTasks[taskId].data[1] > 10)
        {
            DestroyTask(taskId);
            StartSpriteAnim(sprite, 2);
            sprite->data[5] = 0;
            sprite->callback = sub_8140014;
        }
        break;
    }
}

static void sub_8140014(struct Sprite *sprite)
{
    int angle;

    if (sprite->animEnded)
    {
        sprite->data[3] = 0;
        sprite->data[4] = 32;
        sprite->data[5] = 0;
        angle = 0;
        sprite->pos1.y += Cos(angle, 32);
        sprite->pos2.y = -Cos(angle, sprite->data[4]);
        sprite->callback = sub_8140058;
    }
}

static void sub_8140058(struct Sprite *sprite)
{
    bool8 lastBounce;
    int bounceCount;

    lastBounce = 0;

    switch (sprite->data[3] & 0xFF)
    {
    case 0:
        sprite->pos2.y = -Cos(sprite->data[5], sprite->data[4]);
        sprite->data[5] += (sprite->data[3] >> 8) + 4;
        if (sprite->data[5] >= 64)
        {
            sprite->data[4] -= 10;
            sprite->data[3] += 257;

            bounceCount = sprite->data[3] >> 8;
            if (bounceCount == 4)
                lastBounce = 1;

            // Play a different sound effect for each pokeball bounce.
            switch (bounceCount)
            {
            case 1:
                PlaySE(SE_KON);
                break;
            case 2:
                PlaySE(SE_KON2);
                break;
            case 3:
                PlaySE(SE_KON3);
                break;
            default:
                PlaySE(SE_KON4);
                break;
            }
        }
        break;
    case 1:
        sprite->pos2.y = -Cos(sprite->data[5], sprite->data[4]);
        sprite->data[5] -= (sprite->data[3] >> 8) + 4;
        if (sprite->data[5] <= 0)
        {
            sprite->data[5] = 0;
            sprite->data[3] &= -0x100;
        }
        break;
    }

    if (lastBounce)
    {
        sprite->data[3] = 0;
        sprite->pos1.y += Cos(64, 32);
        sprite->pos2.y = 0;
        if (ewram17840.unk8 == 0)
        {
            sprite->data[5] = 0;
            sprite->callback = sub_8140410;
        }
        else
        {
            sprite->callback = sub_8140158;
            sprite->data[4] = 1;
            sprite->data[5] = 0;
        }
    }
}

static void sub_8140158(struct Sprite *sprite)
{
    if (++sprite->data[3] == 31)
    {
        sprite->data[3] = 0;
        sprite->affineAnimPaused = 1;
        StartSpriteAffineAnim(sprite, 1);
        ewram17840.unkC = 0;
        sprite->callback = sub_81401A0;
        PlaySE(SE_BOWA);
    }
}

static void sub_81401A0(struct Sprite *sprite)
{
    s8 state;
    u16 var0;

    switch (sprite->data[3] & 0xFF)
    {
    case 0:
        if ((s16)ewram17840.unkC > 0xFF)
        {
            sprite->pos2.x += sprite->data[4];
            ewram17840.unkC &= 0xFF;
        }
        else
        {
            ewram17840.unkC += 0xB0;
        }

        sprite->data[5]++;
        sprite->affineAnimPaused = 0;
        var0 = sprite->data[5] + 7;
        if (var0 > 14)
        {
            ewram17840.unkC = 0;
            sprite->data[3]++;
            sprite->data[5] = 0;
        }
        break;
    case 1:
        if (++sprite->data[5] == 1)
        {
            sprite->data[5] = 0;
            sprite->data[4] = -sprite->data[4];
            sprite->data[3]++;
            sprite->affineAnimPaused = 0;
            if (sprite->data[4] < 0)
                ChangeSpriteAffineAnim(sprite, 2);
            else
                ChangeSpriteAffineAnim(sprite, 1);
        }
        else
        {
            sprite->affineAnimPaused = 1;
        }
        break;
    case 2:
        if ((s16)ewram17840.unkC > 0xFF)
        {
            sprite->pos2.x += sprite->data[4];
            ewram17840.unkC &= 0xFF;
        }
        else
        {
            ewram17840.unkC += 0xB0;
        }

        sprite->data[5]++;
        sprite->affineAnimPaused = 0;
        var0 = sprite->data[5] + 12;
        if (var0 > 24)
        {
            ewram17840.unkC = 0;
            sprite->data[3]++;
            sprite->data[5] = 0;
        }
        break;
    case 3:
        if (sprite->data[5]++ < 0)
        {
            sprite->affineAnimPaused = 1;
            break;
        }

        sprite->data[5] = 0;
        sprite->data[4] = -sprite->data[4];
        sprite->data[3]++;
        sprite->affineAnimPaused = 0;
        if (sprite->data[4] < 0)
            ChangeSpriteAffineAnim(sprite, 2);
        else
            ChangeSpriteAffineAnim(sprite, 1);
        // fall through
    case 4:
        if ((s16)ewram17840.unkC > 0xFF)
        {
            sprite->pos2.x += sprite->data[4];
            ewram17840.unkC &= 0xFF;
        }
        else
        {
            ewram17840.unkC += 0xB0;
        }

        sprite->data[5]++;
        sprite->affineAnimPaused = 0;
        var0 = sprite->data[5] + 4;
        if (var0 > 8)
        {
            ewram17840.unkC = 0;
            sprite->data[3]++;
            sprite->data[5] = 0;
            sprite->data[4] = -sprite->data[4];
        }
        break;
    case 5:
        sprite->data[3] += 0x100;
        state = sprite->data[3] >> 8;
        if (state == ewram17840.unk8)
        {
            sprite->affineAnimPaused = 1;
            sprite->callback = sub_8140410;
        }
        else
        {
            if (ewram17840.unk8 == 4 && state == 3)
            {
                sprite->callback = sub_8140434;
                sprite->affineAnimPaused = 1;
            }
            else
            {
                sprite->data[3]++;
                sprite->affineAnimPaused = 1;
            }
        }
        break;
    case 6:
    default:
        if (++sprite->data[5] == 31)
        {
            sprite->data[5] = 0;
            sprite->data[3] &= -0x100;
            StartSpriteAffineAnim(sprite, 3);
            if (sprite->data[4] < 0)
                StartSpriteAffineAnim(sprite, 2);
            else
                StartSpriteAffineAnim(sprite, 1);

            PlaySE(SE_BOWA);
        }
        break;
    }
}

static void sub_8140410(struct Sprite *sprite)
{
    if (++sprite->data[5] == 31)
    {
        sprite->data[5] = 0;
        sprite->callback = sub_81405F4;
    }
}

static void sub_8140434(struct Sprite *sprite)
{
    sprite->animPaused = 1;
    sprite->callback = sub_8140454;
    sprite->data[3] = 0;
    sprite->data[4] = 0;
    sprite->data[5] = 0;
}

static void sub_8140454(struct Sprite *sprite)
{
    u8 *battler = &gAnimBankTarget;

    sprite->data[4]++;
    if (sprite->data[4] == 40)
        return;

    if (sprite->data[4] == 95)
    {
        gDoingBattleAnim = 0;
        UpdateOamPriorityInAllHealthboxes(1);
        m4aMPlayAllStop();
        PlaySE(MUS_FANFA5);
    }
    else if (sprite->data[4] == 315)
    {
        FreeOamMatrix(gSprites[gBankSpriteIds[*battler]].oam.matrixNum);
        DestroySprite(&gSprites[gBankSpriteIds[*battler]]);
        sprite->data[0] = 0;
        sprite->callback = sub_81404E4;
    }
}

static void sub_81404E4(struct Sprite *sprite)
{
    u8 paletteIndex;

    switch (sprite->data[0])
    {
    case 0:
        sprite->data[1] = 0;
        sprite->data[2] = 0;
        sprite->oam.objMode = ST_OAM_OBJ_BLEND;
        REG_BLDCNT = 0x3F40;
        REG_BLDALPHA = 0x0010;
        paletteIndex = IndexOfSpritePaletteTag(sprite->template->paletteTag);
        BeginNormalPaletteFade(1 << (paletteIndex + 0x10), 0, 0, 16, RGB(31, 31, 31));
        sprite->data[0]++;
        break;
    case 1:
        if (sprite->data[1]++ > 0)
        {
            sprite->data[1] = 0;
            sprite->data[2]++;
            REG_BLDALPHA = (sprite->data[2] << 8) | (16 - sprite->data[2]);
            if (sprite->data[2] == 16)
                sprite->data[0]++;
        }
        break;
    case 2:
        sprite->invisible = 1;
        sprite->data[0]++;
        break;
    default:
        if (!gPaletteFade.active)
        {
            REG_BLDCNT = 0;
            REG_BLDALPHA = 0;
            sprite->data[0] = 0;
            sprite->callback = sub_81405C8;
        }
        break;
    }
}

static void sub_81405C8(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->data[0] = -1;
    }
    else
    {
        FreeSpriteOamMatrix(sprite);
        DestroySprite(sprite);
    }
}

// fakematching. I think the return type of ball_number_to_ball_processing_index()
// is wrong because of the weird required casting.
static void sub_81405F4(struct Sprite *sprite)
{
    u8 ballIndex;
    int ballIndex2; // extra var needed to match

    StartSpriteAnim(sprite, 1);
    StartSpriteAffineAnim(sprite, 0);
    sprite->callback = sub_81406BC;

    ballIndex = ball_number_to_ball_processing_index(gLastUsedItem);
    ballIndex2 = ballIndex;
    if (ballIndex2 > 11)
        goto LABEL;
    if (ballIndex2 < 0)
        goto LABEL;

    AnimateBallOpenParticles(sprite->pos1.x, sprite->pos1.y - 5, 1, 28, ballIndex);
    sub_8141314(1, gAnimBankTarget, 14, ballIndex);

    LABEL:
    gSprites[gBankSpriteIds[gAnimBankTarget]].invisible = 0;
    StartSpriteAffineAnim(&gSprites[gBankSpriteIds[gAnimBankTarget]], 1);
    AnimateSprite(&gSprites[gBankSpriteIds[gAnimBankTarget]]);
    gSprites[gBankSpriteIds[gAnimBankTarget]].data[1] = 0x1000;
}

static void sub_81406BC(struct Sprite *sprite)
{
    int next = FALSE;

    if (sprite->animEnded)
        sprite->invisible = 1;
    
    if (gSprites[gBankSpriteIds[gAnimBankTarget]].affineAnimEnded)
    {
        StartSpriteAffineAnim(&gSprites[gBankSpriteIds[gAnimBankTarget]], 0);
        next = TRUE;
    }
    else
    {
        gSprites[gBankSpriteIds[gAnimBankTarget]].data[1] -= 288;
        gSprites[gBankSpriteIds[gAnimBankTarget]].pos2.y = gSprites[gBankSpriteIds[gAnimBankTarget]].data[1] >> 8;   
    }

    if (sprite->animEnded && next)
    {
        gSprites[gBankSpriteIds[gAnimBankTarget]].pos2.y = 0;
        gSprites[gBankSpriteIds[gAnimBankTarget]].invisible = ewram17840.unk9_1;
        sprite->data[0] = 0;
        sprite->callback = sub_81405C8;
        gDoingBattleAnim = 0;
        UpdateOamPriorityInAllHealthboxes(1);
    }
}

static void sub_81407B8(struct Sprite *sprite)
{
    int i;

    sprite->pos1.x += sprite->pos2.x;
    sprite->pos1.y += sprite->pos2.y;
    sprite->pos2.y = 0;
    sprite->pos2.x = 0;
    for (i = 0; i < 6; i++)
        sprite->data[i] = 0;

    sprite->callback = sub_81407F4;
}

#ifdef NONMATCHING
// there is some weird typing going on with var0 and var1.
static void sub_81407F4(struct Sprite *sprite)
{
    s16 var0, var1;

    var0 = sprite->data[0] + 0x800;
    var1 = sprite->data[1] + 0x680;
    sprite->pos2.x -= var1 >> 8;
    sprite->pos2.y += var0 >> 8;
    sprite->data[0] = var0 & 0xFF;
    sprite->data[1] = var1 & 0xFF;

    if (sprite->pos1.y + sprite->pos2.y > 160
     || sprite->pos1.x + sprite->pos2.x < -8)
    {
        sprite->data[0] = 0;
        sprite->callback = sub_81405C8;
        gDoingBattleAnim = 0;
        UpdateOamPriorityInAllHealthboxes(1);
    }
}
#else
NAKED
static void sub_81407F4(struct Sprite *sprite)
{
    asm(".syntax unified\n\
    push {r4,lr}\n\
    adds r4, r0, 0\n\
    movs r0, 0x80\n\
    lsls r0, 4\n\
    adds r2, r0, 0\n\
    ldrh r1, [r4, 0x2E]\n\
    adds r2, r1\n\
    movs r0, 0xD0\n\
    lsls r0, 3\n\
    adds r3, r0, 0\n\
    ldrh r1, [r4, 0x30]\n\
    adds r3, r1\n\
    lsls r1, r3, 16\n\
    asrs r1, 24\n\
    ldrh r0, [r4, 0x24]\n\
    subs r0, r1\n\
    strh r0, [r4, 0x24]\n\
    lsls r0, r2, 16\n\
    asrs r0, 24\n\
    ldrh r1, [r4, 0x26]\n\
    adds r0, r1\n\
    strh r0, [r4, 0x26]\n\
    movs r0, 0xFF\n\
    ands r2, r0\n\
    strh r2, [r4, 0x2E]\n\
    ands r3, r0\n\
    strh r3, [r4, 0x30]\n\
    movs r2, 0x22\n\
    ldrsh r0, [r4, r2]\n\
    movs r2, 0x26\n\
    ldrsh r1, [r4, r2]\n\
    adds r0, r1\n\
    cmp r0, 0xA0\n\
    bgt _0814084A\n\
    movs r1, 0x20\n\
    ldrsh r0, [r4, r1]\n\
    movs r2, 0x24\n\
    ldrsh r1, [r4, r2]\n\
    adds r0, r1\n\
    movs r1, 0x8\n\
    negs r1, r1\n\
    cmp r0, r1\n\
    bge _0814085E\n\
_0814084A:\n\
    movs r0, 0\n\
    strh r0, [r4, 0x2E]\n\
    ldr r0, _08140864 @ =sub_81405C8\n\
    str r0, [r4, 0x1C]\n\
    ldr r1, _08140868 @ =gDoingBattleAnim\n\
    movs r0, 0\n\
    strb r0, [r1]\n\
    movs r0, 0x1\n\
    bl UpdateOamPriorityInAllHealthboxes\n\
_0814085E:\n\
    pop {r4}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08140864: .4byte sub_81405C8\n\
_08140868: .4byte gDoingBattleAnim\n\
    .syntax divided\n");
}
#endif // NONMATCHING

u8 AnimateBallOpenParticles(u8 x, u8 y, u8 priority, u8 subpriority, u8 ballIndex)
{
    u8 taskId;

    if (GetSpriteTileStartByTag(gBallOpenParticleSpritesheets[ballIndex].tag) == 0xFFFF)
    {
        LoadCompressedObjectPic(&gBallOpenParticleSpritesheets[ballIndex]);
        LoadCompressedObjectPalette(&gBallOpenParticlePalettes[ballIndex]);
    }

    taskId = CreateTask(gBallOpenParticleAnimationFuncs[ballIndex], 5);
    gTasks[taskId].data[1] = x;
    gTasks[taskId].data[2] = y;
    gTasks[taskId].data[3] = priority;
    gTasks[taskId].data[4] = subpriority;
    gTasks[taskId].data[15] = ballIndex;
    PlaySE(SE_BOWA2);
    if (gMain.inBattle)
        ewram17840.unkA++;

    return taskId;
}

void PokeBallOpenParticleAnimation(u8 taskId)
{
    u8 spriteId;
    u8 x, y;
    u8 priority, subpriority;
    u8 ballIndex;
    u8 var0;

    ballIndex = gTasks[taskId].data[15];
    if (gTasks[taskId].data[0] < 16)
    {
        x = gTasks[taskId].data[1];
        y = gTasks[taskId].data[2];
        priority = gTasks[taskId].data[3];
        subpriority = gTasks[taskId].data[4];

        spriteId = CreateSprite(&gSpriteTemplates_840B3B4[ballIndex], x, y, subpriority);
        StartSpriteAnim(&gSprites[spriteId], gBallOpenParticleAnimNums[ballIndex]);
        gSprites[spriteId].callback = PokeBallOpenParticleAnimation_Step1;
        gSprites[spriteId].oam.priority = priority;

        var0 = (u8)gTasks[taskId].data[0];
        if (var0 >= 8)
            var0 -= 8;

        gSprites[spriteId].data[0] = var0 * 32;
        if (gTasks[taskId].data[0] == 15)
        {
            gSprites[spriteId].data[7] = 1;
            DestroyTask(taskId);
            return;
        }
    }

    gTasks[taskId].data[0]++;
}

static void PokeBallOpenParticleAnimation_Step1(struct Sprite *sprite)
{
    if (sprite->data[1] == 0)
        sprite->callback = PokeBallOpenParticleAnimation_Step2;
    else
        sprite->data[1]--;
}

static void PokeBallOpenParticleAnimation_Step2(struct Sprite *sprite)
{
    sprite->pos2.x = Sin(sprite->data[0], sprite->data[1]);
    sprite->pos2.y = Cos(sprite->data[0], sprite->data[1]);
    sprite->data[1] += 2;
    if (sprite->data[1] == 50)
        DestroyBallOpenAnimationParticle(sprite);
}

void TimerBallOpenParticleAnimation(u8 taskId)
{
    u8 i;
    u8 x, y, priority, subpriority, ballIndex;
    u8 spriteId;

    ballIndex = gTasks[taskId].data[15];
    x = gTasks[taskId].data[1];
    y = gTasks[taskId].data[2];
    priority = gTasks[taskId].data[3];
    subpriority = gTasks[taskId].data[4];

    for (i = 0; i < 8; i++)
    {
        spriteId = CreateSprite(&gSpriteTemplates_840B3B4[ballIndex], x, y, subpriority);
        StartSpriteAnim(&gSprites[spriteId], gBallOpenParticleAnimNums[ballIndex]);
        gSprites[spriteId].callback = FanOutBallOpenParticles_Step1;
        gSprites[spriteId].oam.priority = priority;
        gSprites[spriteId].data[0] = i * 32;
        gSprites[spriteId].data[4] = 10;
        gSprites[spriteId].data[5] = 2;
        gSprites[spriteId].data[6] = 1;
    }

    gSprites[spriteId].data[7] = 1;
    DestroyTask(taskId);
}

void DiveBallOpenParticleAnimation(u8 taskId)
{
    u8 i;
    u8 x, y, priority, subpriority, ballIndex;
    u8 spriteId;

    ballIndex = gTasks[taskId].data[15];
    x = gTasks[taskId].data[1];
    y = gTasks[taskId].data[2];
    priority = gTasks[taskId].data[3];
    subpriority = gTasks[taskId].data[4];

    for (i = 0; i < 8; i++)
    {
        spriteId = CreateSprite(&gSpriteTemplates_840B3B4[ballIndex], x, y, subpriority);
        StartSpriteAnim(&gSprites[spriteId], gBallOpenParticleAnimNums[ballIndex]);
        gSprites[spriteId].callback = FanOutBallOpenParticles_Step1;
        gSprites[spriteId].oam.priority = priority;
        gSprites[spriteId].data[0] = i * 32;
        gSprites[spriteId].data[4] = 10;
        gSprites[spriteId].data[5] = 1;
        gSprites[spriteId].data[6] = 2;
    }

    gSprites[spriteId].data[7] = 1;
    DestroyTask(taskId);
}

void SafariBallOpenParticleAnimation(u8 taskId)
{
    u8 i;
    u8 x, y, priority, subpriority, ballIndex;
    u8 spriteId;

    ballIndex = gTasks[taskId].data[15];
    x = gTasks[taskId].data[1];
    y = gTasks[taskId].data[2];
    priority = gTasks[taskId].data[3];
    subpriority = gTasks[taskId].data[4];

    for (i = 0; i < 8; i++)
    {
        spriteId = CreateSprite(&gSpriteTemplates_840B3B4[ballIndex], x, y, subpriority);
        StartSpriteAnim(&gSprites[spriteId], gBallOpenParticleAnimNums[ballIndex]);
        gSprites[spriteId].callback = FanOutBallOpenParticles_Step1;
        gSprites[spriteId].oam.priority = priority;
        gSprites[spriteId].data[0] = i * 32;
        gSprites[spriteId].data[4] = 4;
        gSprites[spriteId].data[5] = 1;
        gSprites[spriteId].data[6] = 1;
    }

    gSprites[spriteId].data[7] = 1;
    DestroyTask(taskId);
}

void UltraBallOpenParticleAnimation(u8 taskId)
{
    u8 i;
    u8 x, y, priority, subpriority, ballIndex;
    u8 spriteId;

    ballIndex = gTasks[taskId].data[15];
    x = gTasks[taskId].data[1];
    y = gTasks[taskId].data[2];
    priority = gTasks[taskId].data[3];
    subpriority = gTasks[taskId].data[4];

    for (i = 0; i < 10; i++)
    {
        spriteId = CreateSprite(&gSpriteTemplates_840B3B4[ballIndex], x, y, subpriority);
        StartSpriteAnim(&gSprites[spriteId], gBallOpenParticleAnimNums[ballIndex]);
        gSprites[spriteId].callback = FanOutBallOpenParticles_Step1;
        gSprites[spriteId].oam.priority = priority;
        gSprites[spriteId].data[0] = i * 25;
        gSprites[spriteId].data[4] = 5;
        gSprites[spriteId].data[5] = 1;
        gSprites[spriteId].data[6] = 1;
    }

    gSprites[spriteId].data[7] = 1;
    DestroyTask(taskId);
}

void GreatBallOpenParticleAnimation(u8 taskId)
{
    u8 i;
    u8 x, y, priority, subpriority, ballIndex;
    u8 spriteId;

    if (gTasks[taskId].data[7])
    {
        gTasks[taskId].data[7]--;
    }
    else
    {
        ballIndex = gTasks[taskId].data[15];
        x = gTasks[taskId].data[1];
        y = gTasks[taskId].data[2];
        priority = gTasks[taskId].data[3];
        subpriority = gTasks[taskId].data[4];

        for (i = 0; i < 8; i++)
        {
            spriteId = CreateSprite(&gSpriteTemplates_840B3B4[ballIndex], x, y, subpriority);
            StartSpriteAnim(&gSprites[spriteId], gBallOpenParticleAnimNums[ballIndex]);
            gSprites[spriteId].callback = FanOutBallOpenParticles_Step1;
            gSprites[spriteId].oam.priority = priority;
            gSprites[spriteId].data[0] = i * 32;
            gSprites[spriteId].data[4] = 8;
            gSprites[spriteId].data[5] = 2;
            gSprites[spriteId].data[6] = 2;
        }

        gTasks[taskId].data[7] = 8;
        if (++gTasks[taskId].data[0] == 2)
        {
            gSprites[spriteId].data[7] = 1;
            DestroyTask(taskId);
        }
    }
}

static void FanOutBallOpenParticles_Step1(struct Sprite *sprite)
{
    sprite->pos2.x = Sin(sprite->data[0], sprite->data[1]);
    sprite->pos2.y = Cos(sprite->data[0], sprite->data[2]);
    sprite->data[0] = (sprite->data[0] + sprite->data[4]) & 0xFF;
    sprite->data[1] += sprite->data[5];
    sprite->data[2] += sprite->data[6];
    if (++sprite->data[3] == 51)
        DestroyBallOpenAnimationParticle(sprite);
}

void RepeatBallOpenParticleAnimation(u8 taskId)
{
    u8 i;
    u8 x, y, priority, subpriority, ballIndex;
    u8 spriteId;

    ballIndex = gTasks[taskId].data[15];
    x = gTasks[taskId].data[1];
    y = gTasks[taskId].data[2];
    priority = gTasks[taskId].data[3];
    subpriority = gTasks[taskId].data[4];

    for (i = 0; i < 12; i++)
    {
        spriteId = CreateSprite(&gSpriteTemplates_840B3B4[ballIndex], x, y, subpriority);
        StartSpriteAnim(&gSprites[spriteId], gBallOpenParticleAnimNums[ballIndex]);
        gSprites[spriteId].callback = RepeatBallOpenParticleAnimation_Step1;
        gSprites[spriteId].oam.priority = priority;
        gSprites[spriteId].data[0] = i * 21;
    }

    gSprites[spriteId].data[7] = 1;
    DestroyTask(taskId);
}

static void RepeatBallOpenParticleAnimation_Step1(struct Sprite *sprite)
{
    sprite->pos2.x = Sin(sprite->data[0], sprite->data[1]);
    sprite->pos2.y = Cos(sprite->data[0], Sin(sprite->data[0], sprite->data[2]));
    sprite->data[0] = (sprite->data[0] + 6) & 0xFF;
    sprite->data[1]++;
    sprite->data[2]++;
    if (++sprite->data[3] == 51)
        DestroyBallOpenAnimationParticle(sprite);
}

void MasterBallOpenParticleAnimation(u8 taskId)
{
    u8 i, j;
    u8 x, y, priority, subpriority, ballIndex;
    u8 spriteId;

    ballIndex = gTasks[taskId].data[15];
    x = gTasks[taskId].data[1];
    y = gTasks[taskId].data[2];
    priority = gTasks[taskId].data[3];
    subpriority = gTasks[taskId].data[4];

    for (j = 0; j < 2; j++)
    {
        for (i = 0; i < 8; i++)
        {
            spriteId = CreateSprite(&gSpriteTemplates_840B3B4[ballIndex], x, y, subpriority);
            StartSpriteAnim(&gSprites[spriteId], gBallOpenParticleAnimNums[ballIndex]);
            gSprites[spriteId].callback = FanOutBallOpenParticles_Step1;
            gSprites[spriteId].oam.priority = priority;
            gSprites[spriteId].data[0] = i * 32;
            gSprites[spriteId].data[4] = 8;

            if (j == 0)
            {
                gSprites[spriteId].data[5] = 2;
                gSprites[spriteId].data[6] = 1;
            }
            else
            {
                gSprites[spriteId].data[5] = 1;
                gSprites[spriteId].data[6] = 2;
            }
        }
    }

    gSprites[spriteId].data[7] = 1;
    DestroyTask(taskId);
}

void PremierBallOpenParticleAnimation(u8 taskId)
{
    u8 i;
    u8 x, y, priority, subpriority, ballIndex;
    u8 spriteId;

    ballIndex = gTasks[taskId].data[15];
    x = gTasks[taskId].data[1];
    y = gTasks[taskId].data[2];
    priority = gTasks[taskId].data[3];
    subpriority = gTasks[taskId].data[4];

    for (i = 0; i < 8; i++)
    {
        spriteId = CreateSprite(&gSpriteTemplates_840B3B4[ballIndex], x, y, subpriority);
        StartSpriteAnim(&gSprites[spriteId], gBallOpenParticleAnimNums[ballIndex]);
        gSprites[spriteId].callback = PremierBallOpenParticleAnimation_Step1;
        gSprites[spriteId].oam.priority = priority;
        gSprites[spriteId].data[0] = i * 32;
    }

    gSprites[spriteId].data[7] = 1;
    DestroyTask(taskId);
}

static void PremierBallOpenParticleAnimation_Step1(struct Sprite *sprite)
{
    sprite->pos2.x = Sin(sprite->data[0], sprite->data[1]);
    sprite->pos2.y = Cos(sprite->data[0], Sin(sprite->data[0] & 0x3F, sprite->data[2]));
    sprite->data[0] = (sprite->data[0] + 10) & 0xFF;
    sprite->data[1]++;
    sprite->data[2]++;
    if (++sprite->data[3] == 51)
        DestroyBallOpenAnimationParticle(sprite);
}

static void DestroyBallOpenAnimationParticle(struct Sprite *sprite)
{
    int i;
    int temp;

    if (!gMain.inBattle)
    {
        temp = sprite->data[7]; // temp var needed to match
        if (temp == 1)
            DestroySpriteAndFreeResources(sprite);
        else
            DestroySprite(sprite);
    }
    else if (sprite->data[7] == 1)
    {
        if (--ewram17840.unkA == 0)
        {
            for (i = 0; i < 12; i++)
            {
                FreeSpriteTilesByTag(gBallOpenParticleSpritesheets[i].tag);
                FreeSpritePaletteByTag(gBallOpenParticlePalettes[i].tag);
            }

            DestroySprite(sprite);
        }
        else
            DestroySprite(sprite);
    }
    else
        DestroySprite(sprite);
}

u8 sub_8141314(u8 arg0, u8 battler, u32 selectedPalettes, u8 ballIndex)
{
    u8 taskId;

    taskId = CreateTask(sub_81413DC, 5);
    gTasks[taskId].data[15] = ballIndex;
    gTasks[taskId].data[3] = battler;
    gTasks[taskId].data[10] = selectedPalettes;
    gTasks[taskId].data[11] = selectedPalettes >> 16;

    if (!arg0)
    {
        BlendPalette(battler * 16 + 0x100, 16, 0, gUnknown_0840B4D4[ballIndex]);
        gTasks[taskId].data[1] = 1;
    }
    else
    {
        BlendPalette(battler * 16 + 0x100, 16, 16, gUnknown_0840B4D4[ballIndex]);
        gTasks[taskId].data[0] = 16;
        gTasks[taskId].data[1] = -1;
        gTasks[taskId].func = sub_814146C;
    }

    BeginNormalPaletteFade(selectedPalettes, 0, 0, 16, RGB(31, 31, 31));
    return taskId;
}

static void sub_81413DC(u8 taskId)
{
    u8 ballIndex = gTasks[taskId].data[15];

    if (gTasks[taskId].data[2] <= 16)
    {
        BlendPalette(gTasks[taskId].data[3] * 16 + 0x100, 16, gTasks[taskId].data[0], gUnknown_0840B4D4[ballIndex]);
        gTasks[taskId].data[0] += gTasks[taskId].data[1];
        gTasks[taskId].data[2]++;
    }
    else if (!gPaletteFade.active)
    {
        u32 selectedPalettes = (u16)gTasks[taskId].data[10] | ((u16)gTasks[taskId].data[11] << 16);
        BeginNormalPaletteFade(selectedPalettes, 0, 16, 0, RGB(31, 31, 31));
        DestroyTask(taskId);
    }
}

static void sub_814146C(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        u32 selectedPalettes = (u16)gTasks[taskId].data[10] | ((u16)gTasks[taskId].data[11] << 16);
        BeginNormalPaletteFade(selectedPalettes, 0, 16, 0, RGB(31, 31, 31));
        gTasks[taskId].func = sub_81414BC;
    }
}

static void sub_81414BC(u8 taskId)
{
    u8 ballIndex = gTasks[taskId].data[15];

    if (gTasks[taskId].data[2] <= 16)
    {
        BlendPalette(gTasks[taskId].data[3] * 16 + 0x100, 16, gTasks[taskId].data[0], gUnknown_0840B4D4[ballIndex]);
        gTasks[taskId].data[0] += gTasks[taskId].data[1];
        gTasks[taskId].data[2]++;
    }
    else
    {
        DestroyTask(taskId);
    }
}

void sub_814151C(u8 taskId)
{
    u8 spriteId;
    u32 x;
    u32 done;
    
    done = FALSE;
    spriteId = gBankSpriteIds[gAnimBankAttacker];
    switch (gTasks[taskId].data[10])
    {
    case 0:
        gTasks[taskId].data[11] = gBattleAnimArgs[0];
        gTasks[taskId].data[0] += 0x500;
        if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
            gSprites[spriteId].pos2.x += gTasks[taskId].data[0] >> 8;
        else
            gSprites[spriteId].pos2.x -= gTasks[taskId].data[0] >> 8;

        gTasks[taskId].data[0] &= 0xFF;
        x = gSprites[spriteId].pos1.x + gSprites[spriteId].pos2.x + 32;
        if (x > 304)
            gTasks[taskId].data[10]++;
        break;
    case 1:
        refresh_graphics_maybe(gAnimBankAttacker, gTasks[taskId].data[11], spriteId);
        gTasks[taskId].data[10]++;
        break;
    case 2:
        gTasks[taskId].data[0] += 0x500;
        if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
            gSprites[spriteId].pos2.x -= gTasks[taskId].data[0] >> 8;
        else
            gSprites[spriteId].pos2.x += gTasks[taskId].data[0] >> 8;

        gTasks[taskId].data[0] &= 0xFF;
        if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
        {
            if (gSprites[spriteId].pos2.x <= 0)
            {
                gSprites[spriteId].pos2.x = 0;
                // done = FALSE; // fakematching--can't get the tail merge correct
                goto DONE;
            }
        }
        else
        {
            if (gSprites[spriteId].pos2.x >= 0)
            {
                gSprites[spriteId].pos2.x = 0;
                done = TRUE;
            }
        }

        if (done)
        {
            DONE:
            DestroyAnimVisualTask(taskId);
        }
        break;
    }
}

void sub_81416C4(u8 taskId)
{
    u8 spriteId;

    switch (gTasks[taskId].data[15])
    {
    case 0:
        if (GetBattlerPosition_permutated(gAnimBankAttacker) == 1)
            REG_BLDCNT = 0x3F42;
        else
            REG_BLDCNT = 0x3F44;

        REG_BLDALPHA = 0x0010;
        gTasks[taskId].data[15]++;
        break;
    case 1:
        if (gTasks[taskId].data[1]++ > 1)
        {
            gTasks[taskId].data[1] = 0;
            gTasks[taskId].data[0]++;
            REG_BLDALPHA = (gTasks[taskId].data[0] << 8) | (16 - gTasks[taskId].data[0]);
            if (gTasks[taskId].data[0] == 16)
                gTasks[taskId].data[15]++;
        }
        break;
    case 2:
        spriteId = gBankSpriteIds[gAnimBankAttacker];
        DmaClear32(3, (void *)OBJ_VRAM0 + gSprites[spriteId].oam.tileNum * TILE_SIZE_4BPP, 0x800);
        sub_80324E0(gAnimBankAttacker);
        DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_81417D8(u8 taskId)
{
    gBattleAnimArgs[7] = ewram17800[gAnimBankAttacker].substituteSprite;
    DestroyAnimVisualTask(taskId);
}

void sub_8141808(u8 taskId)
{
    gAnimBankTarget = gEffectBank;
    DestroyAnimVisualTask(taskId);
}

void sub_8141828(u8 battler, struct Pokemon *mon)
{
    int isShiny;
    u32 otId, personality;
    u32 shinyValue;
    u8 taskId1, taskId2;

    isShiny = 0;
    ewram17810[battler].unk0_7 = 1;
    otId = GetMonData(mon, MON_DATA_OT_ID);
    personality = GetMonData(mon, MON_DATA_PERSONALITY);

    if (IsAnimBankSpriteVisible(battler))
    {
        shinyValue = HIHALF(otId) ^ LOHALF(otId) ^ HIHALF(personality) ^ LOHALF(personality);
        if (shinyValue < 8)
            isShiny = TRUE;

        if (isShiny)
        {
            if (GetSpriteTileStartByTag(0x27F9) == 0xFFFF)
            {
                LoadCompressedObjectPic(&gBattleAnimPicTable[233]);
                LoadCompressedObjectPalette(&gBattleAnimPaletteTable[233]);
            }

            taskId1 = CreateTask(sub_814191C, 10);
            taskId2 = CreateTask(sub_814191C, 10);
            gTasks[taskId1].data[0] = battler;
            gTasks[taskId2].data[0] = battler;
            gTasks[taskId1].data[1] = 0;
            gTasks[taskId2].data[1] = 1;
            return;
        }
    }

    ewram17810[battler].unk1_0 = 1;
}

static void sub_814191C(u8 taskId)
{
    u8 battler;
    u8 x, y;
    u8 spriteId;
    u16 counter;
    s16 state;
    u8 pan;

    if (gTasks[taskId].data[13] < 60)
    {
        gTasks[taskId].data[13]++;
        return;
    }
    
    if (ewram17840.unkA)
        return;

    counter = gTasks[taskId].data[10]++;
    if (counter & 3)
        return;

    battler = gTasks[taskId].data[0];
    x = GetBattlerSpriteCoord(battler, 0);
    y = GetBattlerSpriteCoord(battler, 1);
    state = gTasks[taskId].data[11];
    if (state == 0)
    {
        spriteId = CreateSprite(&gBattleAnimSpriteTemplate_84024E8, x, y, 5);
    }
    else if (state >= 0 && gTasks[taskId].data[11] < 4)
    {
        spriteId = CreateSprite(&gSpriteTemplate_8402500, x, y, 5);
        gSprites[spriteId].oam.tileNum += 4;
    }
    else
    {
        spriteId = CreateSprite(&gSpriteTemplate_8402500, x, y, 5);
        gSprites[spriteId].oam.tileNum += 5;
    }

    if (gTasks[taskId].data[1] == 0)
    {
        gSprites[spriteId].callback = sub_8141B20;
    }
    else
    {
        gSprites[spriteId].callback = sub_8141B74;
        gSprites[spriteId].pos2.x = -32;
        gSprites[spriteId].pos2.y = 32;
        gSprites[spriteId].invisible = 1;
        if (gTasks[taskId].data[11] == 0)
        {
            if (GetBattlerSide(battler) == B_SIDE_PLAYER)
                pan = 192;
            else
                pan = 63;

            PlaySE12WithPanning(SE_REAPOKE, pan);
        }
    }

    gSprites[spriteId].data[0] = taskId;
    gTasks[taskId].data[11]++;
    gTasks[taskId].data[12]++;
    if (gTasks[taskId].data[11] == 5)
        gTasks[taskId].func = sub_8141AD8;
}

static void sub_8141AD8(u8 taskId)
{
    u8 battler;

    if (gTasks[taskId].data[12] == 0)
    {
        if (gTasks[taskId].data[1] == 1)
        {
            battler = gTasks[taskId].data[0];
            ewram17810[battler].unk1_0 = 1;
        }

        DestroyTask(taskId);
    }
}

static void sub_8141B20(struct Sprite *sprite)
{
    sprite->pos2.x = Sin(sprite->data[1], 24);
    sprite->pos2.y = Cos(sprite->data[1], 24);
    sprite->data[1] += 12;
    if (sprite->data[1] > 0xFF)
    {
        gTasks[sprite->data[0]].data[12]--;
        FreeSpriteOamMatrix(sprite);
        DestroySprite(sprite);
    }
}

static void sub_8141B74(struct Sprite *sprite)
{
    if (sprite->data[1] < 4)
    {
        sprite->data[1]++;
    }
    else
    {
        sprite->invisible = 0;
        sprite->pos2.x += 5;
        sprite->pos2.y -= 5;
        if (sprite->pos2.x > 32)
        {
            gTasks[sprite->data[0]].data[12]--;
            FreeSpriteOamMatrix(sprite);
            DestroySprite(sprite);
        }
    }
}

void sub_8141BD4(u8 taskId)
{
    u8 paletteIndex;

    LoadCompressedObjectPic(&gBattleAnimPicTable[269]);
    LoadCompressedObjectPalette(&gBattleAnimPaletteTable[269]);
    paletteIndex = IndexOfSpritePaletteTag(0x281D); // unused
    DestroyAnimVisualTask(taskId);
}

void sub_8141C08(u8 taskId)
{
    FreeSpriteTilesByTag(0x281D);
    FreeSpritePaletteByTag(0x281D);
    DestroyAnimVisualTask(taskId);
}

void sub_8141C30(struct Sprite *sprite)
{
    InitAnimSpritePos(sprite, 0);
    sprite->data[0] = 30;
    sprite->data[2] = GetBattlerSpriteCoord(GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT), 0) + gBattleAnimArgs[2];
    sprite->data[4] = GetBattlerSpriteCoord(GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT), 1) + gBattleAnimArgs[3];
    sprite->data[5] = -32;
    InitAnimArcTranslation(sprite);
    StartSpriteAnim(&gSprites[gBankSpriteIds[gAnimBankAttacker]], 1);
    sprite->callback = sub_8141CBC;
}

static void sub_8141CBC(struct Sprite *sprite)
{
    if (gSprites[gBankSpriteIds[gAnimBankAttacker]].animCmdIndex == 1)
        sprite->callback = sub_8141CF4;
}

static void sub_8141CF4(struct Sprite *sprite)
{
    if (TranslateAnimArc(sprite))
    {
        sprite->data[0] = 0;
        sprite->invisible = 1;
        sprite->callback = sub_8141D20;
    }
}

static void sub_8141D20(struct Sprite *sprite)
{
    if (gSprites[gBankSpriteIds[gAnimBankAttacker]].animEnded)
    {
        if (++sprite->data[0] > 0)
        {
            StartSpriteAnim(&gSprites[gBankSpriteIds[gAnimBankAttacker]], 0);
            DestroyAnimSprite(sprite);
        }
    }
}

void sub_8141D7C(u8 taskId)
{
    gAnimBankAttacker = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
    gAnimBankTarget = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
    DestroyAnimVisualTask(taskId);
}

void sub_8141DAC(u8 taskId)
{
    if (ewram17840.unk0 == 83)
        gBattleAnimArgs[0] = 1;
    else if (ewram17840.unk0 == 250)
        gBattleAnimArgs[0] = 2;
    else if (ewram17840.unk0 == 128)
        gBattleAnimArgs[0] = 3;
    else if (ewram17840.unk0 == 328)
        gBattleAnimArgs[0] = 4;
    else
        gBattleAnimArgs[0] = 0;

    DestroyAnimVisualTask(taskId);
}

void sub_8141E10(u8 taskId)
{
    gAnimBankAttacker = ewram17840.unk0;
    gAnimBankTarget = ewram17840.unk0 >> 8;
    DestroyAnimVisualTask(taskId);
}
