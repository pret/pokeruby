#include "global.h"
#include "battle.h"
#include "decompress.h"
#include "graphics.h"
#include "battle_anim.h"
#include "random.h"
#include "rom_8077ABC.h"
#include "sprite.h"
#include "trig.h"
#include "util.h"
#include "scanline_effect.h"
#include "palette.h"
#include "constants/battle_anim.h"

extern u8 gAnimVisualTaskCount;
extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimAttacker;
extern u8 gBattleAnimTarget;
extern u16 gBattlerPartyIndexes[];
extern const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB4D8;

extern const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA318[];
extern const union AnimCmd *const gSpriteAnimTable_83D9BC8[];

void PrepareBattlerSpriteForRotScale(u8, u8);
void sub_8078F40(u8);
void sub_8079A64(u8);
void sub_80D37FC(struct Sprite *sprite);
void sub_80D3838(struct Sprite *sprite);
void sub_80D3B60(u8 taskId);
void sub_80D3D68(u8 taskId);
void sub_80D4044(struct Sprite *sprite);
void sub_80D40A8(struct Sprite *);
void sub_80D4150(u8);
u8 sub_80D4394(void);
void sub_80D4418(struct Task *, u8);
void sub_80D452C(struct Sprite *sprite);
void sub_80D463C(u8);
void sub_80D472C(struct Task *, u8);
void sub_80D47D0(struct Sprite *);
void sub_80D487C(struct Sprite *);
void sub_80D4988(u8);
void sub_80D4AD0(struct Task *);
void sub_80D4B3C(struct Sprite *);
void sub_80D4BA4(struct Sprite *);
void sub_80D4BF0(struct Sprite *sprite);
void sub_80D4C18(struct Sprite *);
void sub_80D4CEC(struct Sprite *);
void sub_80D4C64(struct Sprite *sprite);
void sub_80D4D64(struct Sprite*, s32, s32);
void sub_80E1864(u8);
static void sub_80D3874(struct Sprite *sprite);

const union AnimCmd gSpriteAnim_83D9300[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D9308[] =
{
    ANIMCMD_FRAME(4, 1),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D9310[] =
{
    gSpriteAnim_83D9300,
};

const union AnimCmd *const gSpriteAnimTable_83D9314[] =
{
    gSpriteAnim_83D9308,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9318 =
{
    .tileTag = ANIM_TAG_SMALL_BUBBLES,
    .paletteTag = ANIM_TAG_SMALL_BUBBLES,
    .oam = &gOamData_837E04C,
    .anims = gSpriteAnimTable_83D9310,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80794A8,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9330 =
{
    .tileTag = ANIM_TAG_SMALL_BUBBLES,
    .paletteTag = ANIM_TAG_SMALL_BUBBLES,
    .oam = &gOamData_837E10C,
    .anims = gSpriteAnimTable_83D9314,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA318,
    .callback = sub_80D37FC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9348 =
{
    .tileTag = ANIM_TAG_ICE_CRYSTALS,
    .paletteTag = ANIM_TAG_ICE_CRYSTALS,
    .oam = &gOamData_837DF24,
    .anims = gSpriteAnimTable_83D9BC8,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D3838,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9360 =
{
    .tileTag = ANIM_TAG_SMALL_BUBBLES,
    .paletteTag = ANIM_TAG_SMALL_BUBBLES,
    .oam = &gOamData_837DF24,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D4044,
};

const struct SpriteTemplate gSpriteTemplate_83D9378 =
{
    .tileTag = ANIM_TAG_GLOWY_BLUE_ORB,
    .paletteTag = ANIM_TAG_GLOWY_BLUE_ORB,
    .oam = &gOamData_837DF24,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D452C,
};

const union AnimCmd gSpriteAnim_83D9390[] =
{
    ANIMCMD_FRAME(8, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D9398[] =
{
    ANIMCMD_FRAME(9, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D93A0[] =
{
    ANIMCMD_FRAME(4, 1),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D93A8[] =
{
    gSpriteAnim_83D9390,
    gSpriteAnim_83D9398,
};

const union AnimCmd *const gSpriteAnimTable_83D93B0[] =
{
    gSpriteAnim_83D93A0,
};

const union AffineAnimCmd gSpriteAffineAnim_83D93B4[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0xFFF6, 0xFFF6, 0, 15),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83D93CC[] =
{
    AFFINEANIMCMD_FRAME(0xE0, 0xE0, 0, 0),
    AFFINEANIMCMD_FRAME(0xFFF8, 0xFFF8, 0, 15),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83D93E4[] =
{
    AFFINEANIMCMD_FRAME(0x150, 0x150, 0, 0),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 15),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D93FC[] =
{
    gSpriteAffineAnim_83D93B4,
    gSpriteAffineAnim_83D93CC,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D9404[] =
{
    gSpriteAffineAnim_83D93E4,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9408 =
{
    .tileTag = ANIM_TAG_SMALL_BUBBLES,
    .paletteTag = ANIM_TAG_SMALL_BUBBLES,
    .oam = &gOamData_837DF24,
    .anims = gSpriteAnimTable_83D93A8,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D4BF0,
};

const struct SpriteTemplate gSpriteTemplate_83D9420 =
{
    .tileTag = ANIM_TAG_SMALL_BUBBLES,
    .paletteTag = ANIM_TAG_SMALL_BUBBLES,
    .oam = &gOamData_837DF84,
    .anims = gSpriteAnimTable_83D93A8,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D93FC,
    .callback = sub_80D4C64,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9438 =
{
    .tileTag = ANIM_TAG_SMALL_BUBBLES,
    .paletteTag = ANIM_TAG_SMALL_BUBBLES,
    .oam = &gOamData_837DF8C,
    .anims = gSpriteAnimTable_83D93B0,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9404,
    .callback = sub_807A9BC,
};

void sub_80D37FC(struct Sprite *sprite)
{
    sub_8078764(sprite, TRUE);

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = sprite->x + gBattleAnimArgs[2];
    sprite->data[4] = sprite->y + gBattleAnimArgs[4];

    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

void sub_80D3838(struct Sprite *sprite)
{
    if (gBattleAnimArgs[3] != 0)
    {
        sub_8078764(sprite, TRUE);
    }
    else
    {
        InitAnimSpritePos(sprite, 1);
    }

    sprite->data[7] = gBattleAnimArgs[2];
    sprite->callback = sub_80D3874;
}

static void sub_80D3874(struct Sprite *sprite)
{
    sprite->data[0] = (sprite->data[0] + 11) & 0xFF;
    sprite->x2 = Sin(sprite->data[0], 4);

    sprite->data[1] += 48;
    sprite->y2 = -(sprite->data[1] >> 8);

    if (--sprite->data[7] == -1)
    {
        DestroyAnimSprite(sprite);
    }
}

void AnimTask_CreateSurfWave(u8 taskId)
{
    struct Struct_sub_8078914 subStruct;
    u8 taskId2;
    u16 *BGptrX = &gBattle_BG1_X;
    u16 *BGptrY = &gBattle_BG1_Y;
    vu8 cpuDelay; // explanation below

    REG_BLDCNT = BLDCNT_TGT1_BG1 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_ALL;
    REG_BLDALPHA = 0x1000;
    REG_BG1CNT_BITFIELD.priority = 1;
    REG_BG1CNT_BITFIELD.screenSize = 1;
    sub_8078914(&subStruct);

    // This is gone in FireRed and Emerald.
    Dma3FillLarge32_(0, subStruct.field_0, 0x2000); // !
    /*
        Many games use wasteful NOPs; some of which are
        even moreso than regular ones. This is so that
        hardware operations can finish.

        This is just an example. Also, this is apparently
        not a macro, as making it a macro results in a
        NONMATCHING.
    */
    cpuDelay = 0; // stall the CPU
    cpuDelay = 0; // stall the CPU
    Dma3FillLarge32_(0, subStruct.field_4, 0x1000); // !

    if (!IsContest())
    {
        REG_BG1CNT_BITFIELD.charBaseBlock = 1;
        if (GetBattlerSide(gBattleAnimAttacker) == 1)
            LZDecompressVram(&gUnknown_08E70968, subStruct.field_4);
        else
            LZDecompressVram(&gUnknown_08E70C38, subStruct.field_4);
    }
    else
    {
        LZDecompressVram(&gUnknown_08E70F0C, subStruct.field_4);
        sub_80763FC(subStruct.field_8, (u16 *)subStruct.field_4, 0, 1);
    }
    LZDecompressVram(&gBattleAnimBackgroundImage_Surf, subStruct.field_0);
    if (gBattleAnimArgs[0] == 0)
        LoadCompressedPalette(&gBattleAnimBackgroundPalette_Surf, 16 * subStruct.field_8, 32);
    else
        LoadCompressedPalette(&gBattleAnimBackgroundImageMuddyWater_Pal, 16 * subStruct.field_8, 32);
    taskId2 = CreateTask(sub_80D3D68, gTasks[taskId].priority + 1);
    gTasks[taskId].data[15] = taskId2;
    gTasks[taskId2].data[0] = 0;
    gTasks[taskId2].data[1] = 0x1000;
    gTasks[taskId2].data[2] = 0x1000;
    if (IsContest())
    {
        *BGptrX = -80;
        *BGptrY = -48;
        gTasks[taskId].data[0] = 2;
        gTasks[taskId].data[1] = 1;
        gTasks[taskId2].data[3] = 0;
    }
    else if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_OPPONENT)
    {
        *BGptrX = -224;
        *BGptrY = 256;
        gTasks[taskId].data[0] = 2;
        gTasks[taskId].data[1] = -1;
        gTasks[taskId2].data[3] = 1;
    }
    else
    {
        *BGptrX = 0;
        *BGptrY = -48;
        gTasks[taskId].data[0] = -2;
        gTasks[taskId].data[1] = 1;
        gTasks[taskId2].data[3] = 0;
    }
    REG_BG1HOFS = *BGptrX;
    REG_BG1VOFS = *BGptrY;
    if(gTasks[taskId2].data[3] == 0)
    {
        gTasks[taskId2].data[4] = 48;
        gTasks[taskId2].data[5] = 112;
    }
    else
    {
        gTasks[taskId2].data[4] = 0;
        gTasks[taskId2].data[5] = 0;
    }
    gTasks[taskId].data[6] = 1;
    gTasks[taskId].func = sub_80D3B60;
}

#ifdef NONMATCHING
void sub_80D3B60(u8 taskId)
{
    struct Struct_sub_8078914 unk;

    vu8 cpuDelay; // yet again
    u8 i;
    u16 rgbBuffer;
    u16 *BGptrX = &gBattle_BG1_X;
    u16 *BGptrY = &gBattle_BG1_Y;
    s16 unkUse;
    u32 palOffset;
    u16 palNum;

    *BGptrX += gTasks[taskId].data[0];
    *BGptrY += gTasks[taskId].data[1];
    sub_8078914(&unk);
    gTasks[taskId].data[2] += gTasks[taskId].data[1];
    if (++gTasks[taskId].data[5] == 4)
    {
        rgbBuffer = gPlttBufferFaded[unk.field_8 * 16 + 7];
        for (i = 6; i != 0; i--)
        {
            palNum = unk.field_8 * 16;
            palOffset = 1 + i;
            gPlttBufferFaded[palNum + palOffset] = gPlttBufferFaded[palNum + palOffset - 1];
        }
        gPlttBufferFaded[unk.field_8 * 16 + 1] = rgbBuffer;
        gTasks[taskId].data[5] = 0;
    }
    if (++gTasks[taskId].data[6] > 1)
    {
        // there is some weird math going on here
        gTasks[taskId].data[6] = 0;
        unkUse = ++gTasks[taskId].data[3];
        if (unkUse <= 13)
        {
            gTasks[gTasks[taskId].data[15]].data[1] = unkUse | ((16 - unkUse) * 256);
            gTasks[taskId].data[4]++;
        }
        if (gTasks[taskId].data[3] > 54)
        {
            unkUse = --gTasks[taskId].data[4];
            gTasks[gTasks[taskId].data[15]].data[1] = unkUse | ((16 - unkUse) * 256);
        }
    }
    if (!(gTasks[gTasks[taskId].data[15]].data[1] & 0x1F))
    {
        Dma3FillLarge32_(0, unk.field_0, 0x2000); // !
        cpuDelay = 0; // stall the CPU
        cpuDelay = 0; // stall the CPU
        Dma3FillLarge32_(0, unk.field_4, 0x1000); // !
        if (!IsContest)
            REG_BG1CNT_BITFIELD.charBaseBlock = 1;
        *BGptrX = 0;
        *BGptrY = 0;

        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;

        gTasks[gTasks[taskId].data[15]].data[15] = 0xffff;
        DestroyAnimVisualTask(taskId);
    }
}
#else
NAKED
void sub_80D3B60(u8 taskId)
{
    asm_unified("push {r4-r7,lr}\n\
	mov r7, r10\n\
	mov r6, r9\n\
	mov r5, r8\n\
	push {r5-r7}\n\
	sub sp, 0x18\n\
	lsls r0, 24\n\
	lsrs r7, r0, 24\n\
	ldr r0, =gTasks\n\
	lsls r4, r7, 2\n\
	adds r4, r7\n\
	lsls r4, 3\n\
	adds r4, r0\n\
	ldrh r0, [r4, 0x8]\n\
	ldr r1, =gBattle_BG1_X\n\
	ldrh r1, [r1]\n\
	adds r0, r1\n\
	ldr r2, =gBattle_BG1_X\n\
	strh r0, [r2]\n\
	ldrh r0, [r4, 0xA]\n\
	ldr r3, =gBattle_BG1_Y\n\
	ldrh r3, [r3]\n\
	adds r0, r3\n\
	ldr r1, =gBattle_BG1_Y\n\
	strh r0, [r1]\n\
	add r5, sp, 0x4\n\
	adds r0, r5, 0\n\
	bl sub_8078914\n\
	ldrh r0, [r4, 0xA]\n\
	ldrh r2, [r4, 0xC]\n\
	adds r0, r2\n\
	strh r0, [r4, 0xC]\n\
	ldrh r0, [r4, 0x12]\n\
	adds r0, 0x1\n\
	strh r0, [r4, 0x12]\n\
	lsls r0, 16\n\
	asrs r0, 16\n\
	mov r10, r5\n\
	cmp r0, 0x4\n\
	bne _080D3C02\n\
	ldr r1, =gPlttBufferFaded\n\
	ldrb r0, [r5, 0x8]\n\
	lsls r0, 4\n\
	adds r0, 0x7\n\
	lsls r0, 1\n\
	adds r0, r1\n\
	ldrh r6, [r0]\n\
	movs r2, 0x6\n\
	adds r5, r1, 0\n\
	adds r3, r5, 0\n\
	mov r4, r10\n\
_080D3BC8:\n\
	ldrb r0, [r4, 0x8]\n\
	lsls r0, 4\n\
	adds r1, r2, 0x1\n\
	adds r0, r1\n\
	lsls r1, r0, 1\n\
	adds r1, r3\n\
	subs r0, 0x1\n\
	lsls r0, 1\n\
	adds r0, r3\n\
	ldrh r0, [r0]\n\
	strh r0, [r1]\n\
	subs r0, r2, 0x1\n\
	lsls r0, 24\n\
	lsrs r2, r0, 24\n\
	cmp r2, 0\n\
	bne _080D3BC8\n\
	mov r3, r10\n\
	ldrb r0, [r3, 0x8]\n\
	lsls r0, 4\n\
	adds r0, 0x1\n\
	lsls r0, 1\n\
	adds r0, r5\n\
	strh r6, [r0]\n\
	ldr r1, =gTasks\n\
	lsls r0, r7, 2\n\
	adds r0, r7\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	strh r2, [r0, 0x12]\n\
_080D3C02:\n\
	ldr r1, =gTasks\n\
	lsls r2, r7, 2\n\
	adds r0, r2, r7\n\
	lsls r0, 3\n\
	adds r3, r0, r1\n\
	ldrh r0, [r3, 0x14]\n\
	adds r0, 0x1\n\
	strh r0, [r3, 0x14]\n\
	lsls r0, 16\n\
	asrs r0, 16\n\
	adds r4, r1, 0\n\
	str r2, [sp, 0x14]\n\
	cmp r0, 0x1\n\
	ble _080D3C70\n\
	movs r0, 0\n\
	strh r0, [r3, 0x14]\n\
	ldrh r0, [r3, 0xE]\n\
	adds r2, r0, 0x1\n\
	strh r2, [r3, 0xE]\n\
	lsls r0, r2, 16\n\
	asrs r0, 16\n\
	cmp r0, 0xD\n\
	bgt _080D3C4C\n\
	movs r1, 0x26\n\
	ldrsh r0, [r3, r1]\n\
	lsls r1, r0, 2\n\
	adds r1, r0\n\
	lsls r1, 3\n\
	adds r1, r4\n\
	movs r0, 0x10\n\
	subs r0, r2\n\
	lsls r0, 8\n\
	orrs r2, r0\n\
	strh r2, [r1, 0xA]\n\
	ldrh r0, [r3, 0x10]\n\
	adds r0, 0x1\n\
	strh r0, [r3, 0x10]\n\
_080D3C4C:\n\
	movs r2, 0xE\n\
	ldrsh r0, [r3, r2]\n\
	cmp r0, 0x36\n\
	ble _080D3C70\n\
	ldrh r2, [r3, 0x10]\n\
	subs r2, 0x1\n\
	strh r2, [r3, 0x10]\n\
	movs r1, 0x26\n\
	ldrsh r0, [r3, r1]\n\
	lsls r1, r0, 2\n\
	adds r1, r0\n\
	lsls r1, 3\n\
	adds r1, r4\n\
	movs r0, 0x10\n\
	subs r0, r2\n\
	lsls r0, 8\n\
	orrs r2, r0\n\
	strh r2, [r1, 0xA]\n\
_080D3C70:\n\
	ldr r2, [sp, 0x14]\n\
	adds r0, r2, r7\n\
	lsls r0, 3\n\
	adds r0, r4\n\
	movs r3, 0x26\n\
	ldrsh r1, [r0, r3]\n\
	lsls r0, r1, 2\n\
	adds r0, r1\n\
	lsls r0, 3\n\
	adds r0, r4\n\
	ldrh r1, [r0, 0xA]\n\
	movs r0, 0x1F\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _080D3D32\n\
	ldr r2, [sp, 0x4]\n\
	movs r3, 0x80\n\
	lsls r3, 6\n\
	add r6, sp, 0x10\n\
	movs r5, 0\n\
	ldr r1, =0x040000d4\n\
	movs r4, 0x80\n\
	lsls r4, 5\n\
	mov r8, r6\n\
	ldr r0, =0x85000400\n\
	mov r12, r0\n\
	movs r0, 0x85\n\
	lsls r0, 24\n\
	mov r9, r0\n\
_080D3CAA:\n\
	str r5, [sp, 0x10]\n\
	mov r0, r8\n\
	str r0, [r1]\n\
	str r2, [r1, 0x4]\n\
	mov r0, r12\n\
	str r0, [r1, 0x8]\n\
	ldr r0, [r1, 0x8]\n\
	adds r2, r4\n\
	subs r3, r4\n\
	cmp r3, r4\n\
	bhi _080D3CAA\n\
	str r5, [sp, 0x10]\n\
	str r6, [r1]\n\
	str r2, [r1, 0x4]\n\
	lsrs r0, r3, 2\n\
	mov r2, r9\n\
	orrs r0, r2\n\
	str r0, [r1, 0x8]\n\
	ldr r0, [r1, 0x8]\n\
	mov r0, sp\n\
	movs r1, 0\n\
	strb r1, [r0]\n\
	strb r1, [r0]\n\
	mov r3, r10\n\
	ldr r1, [r3, 0x4]\n\
	movs r4, 0\n\
	str r4, [sp, 0x10]\n\
	ldr r0, =0x040000d4\n\
	str r6, [r0]\n\
	str r1, [r0, 0x4]\n\
	ldr r1, =0x85000400\n\
	str r1, [r0, 0x8]\n\
	ldr r0, [r0, 0x8]\n\
	bl IsContest\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	bne _080D3D02\n\
	ldr r2, =0x0400000a\n\
	ldrb r1, [r2]\n\
	movs r0, 0xD\n\
	negs r0, r0\n\
	ands r0, r1\n\
	strb r0, [r2]\n\
_080D3D02:\n\
	ldr r0,=gBattle_BG1_X\n\
	strh r4, [r0]\n\
	ldr r1, =gBattle_BG1_Y\n\
	strh r4, [r1]\n\
	ldr r0, =0x04000050\n\
	strh r4, [r0]\n\
	adds r0, 0x2\n\
	strh r4, [r0]\n\
	ldr r2, =gTasks\n\
	ldr r3, [sp, 0x14]\n\
	adds r0, r3, r7\n\
	lsls r0, 3\n\
	adds r0, r2\n\
	movs r3, 0x26\n\
	ldrsh r1, [r0, r3]\n\
	lsls r0, r1, 2\n\
	adds r0, r1\n\
	lsls r0, 3\n\
	adds r0, r2\n\
	ldr r1, =0x0000ffff\n\
	strh r1, [r0, 0x26]\n\
	adds r0, r7, 0\n\
	bl DestroyAnimVisualTask\n\
_080D3D32:\n\
	add sp, 0x18\n\
	pop {r3-r5}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	mov r10, r5\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
	.pool");
}
#endif

void sub_80D3D68(u8 taskId)
{
    s16 i;
    struct ScanlineEffectParams params;
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
        case 0:
            for (i = 0; i < task->data[4]; i++)
            {
                /* variable initialization isn't literal to ASM */
                gScanlineEffectRegBuffers[0][i] = gScanlineEffectRegBuffers[1][i] = task->data[2];
            }
            for (i = task->data[4]; i < task->data[5]; i++)
            {
                gScanlineEffectRegBuffers[0][i] = gScanlineEffectRegBuffers[1][i] = task->data[1];
            }
            for (i = task->data[5]; i < 160; i++)
            {
                gScanlineEffectRegBuffers[0][i] = gScanlineEffectRegBuffers[1][i] = task->data[2];
            }
            if (task->data[4] == 0)
            {
                gScanlineEffectRegBuffers[0][i] = gScanlineEffectRegBuffers[1][i] = task->data[1];
            }
            else
            {
                gScanlineEffectRegBuffers[0][i] = gScanlineEffectRegBuffers[1][i] = task->data[2];
            }
            params.dmaDest = (vu16 *)REG_ADDR_BLDALPHA;
            params.dmaControl = SCANLINE_EFFECT_DMACNT_16BIT;
            params.initState = 1;
            params.unused9 = 0;
            ScanlineEffect_SetParams(params);
            task->data[0]++;
            break;
        case 1:
            if (task->data[3] == 0)
            {
                if (--task->data[4] <= 0)
                {
                    task->data[4] = 0;
                    task->data[0]++;
                }
            }
            else if (++task->data[5] > 111)
            {
                task->data[0]++;
            }
            for (i = 0; i < task->data[4]; i++)
            {
                gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][i] = task->data[2];
            }
            for (i = task->data[4]; i < task->data[5]; i++)
            {
                gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][i] = task->data[1];
            }
            for (i = task->data[5]; i < 160; i++)
            {
                gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][i] = task->data[2];
            }
            break;
        case 2:
            for (i = 0; i < task->data[4]; i++)
            {
                gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][i] = task->data[2];
            }
            for (i = task->data[4]; i < task->data[5]; i++)
            {
                gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][i] = task->data[1];
            }
            for (i = task->data[5]; i < 160; i++)
            {
                gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][i] = task->data[2];
            }
            if (task->data[15] == -1)
            {
                ScanlineEffect_Stop();
                DestroyTask(taskId);
            }
            break;
    }
}

void sub_80D4044(struct Sprite *sprite)
{
    s16 randData;
    s16 randData2;

    sprite->oam.tileNum += 8;
    sub_8078764(sprite, TRUE);
    randData = (Random() & 0xFF) | 256;
    randData2 = (Random() & 0x1FF);
    if (randData2 > 255)
        randData2 = 256 - randData2;
    sprite->data[1] = randData;
    sprite->data[2] = randData2;
    sprite->callback = sub_80D40A8;
}

void sub_80D40A8(struct Sprite *sprite)
{
    sprite->data[3] += sprite->data[1];
    sprite->data[4] += sprite->data[2];
    if (sprite->data[1] & 1)
        sprite->x2 = -(sprite->data[3] >> 8);
    else
        sprite->x2 = sprite->data[3] >> 8;
    sprite->y2 = sprite->data[4] >> 8;
    if (++sprite->data[0] == 21)
        DestroyAnimSprite(sprite);
}

void sub_80D40F4(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    task->data[15] = GetAnimBattlerSpriteId(ANIM_BATTLER_ATTACKER);
    task->data[5] = gSprites[task->data[15]].y;
    task->data[1] = sub_80D4394();
    PrepareBattlerSpriteForRotScale(task->data[15], ST_OAM_OBJ_NORMAL);
    task->func = sub_80D4150;
}

void sub_80D4150(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
        case 0:
            sub_8079C08(task, task->data[15], 0x100, 0x100, 224, 0x200, 32);
            task->data[0]++;
        case 1:
            if (++task->data[3] > 1)
            {
                task->data[3] = 0;
                if (++task->data[4] & 1)
                {
                    gSprites[task->data[15]].x2 = 3;
                    gSprites[task->data[15]].y++;
                }
                else
                {
                    gSprites[task->data[15]].x2 = -3;
                }
            }
            if (sub_8079C74(task) == 0)
            {
                sub_8079A64(task->data[15]);
                gSprites[task->data[15]].x2 = 0;
                task->data[3] = 0;
                task->data[4] = 0;
                task->data[0]++;
            }
            break;
        case 2:
            if (++task->data[3] > 4)
            {
                sub_8079C08(task, task->data[15], 224, 0x200, 384, 224, 8);
                task->data[3] = 0;
                task->data[0]++;
            }
            break;
        case 3:
            if (sub_8079C74(task) == 0)
            {
                task->data[3] = 0;
                task->data[4] = 0;
                task->data[0]++;
            }
            break;
        case 4:
            sub_80D4418(task, taskId);
            task->data[0]++;
        case 5:
            if (++task->data[3] > 1)
            {
                task->data[3] = 0;
                if (++task->data[4] & 1)
                    gSprites[task->data[15]].y2 += 2;
                else
                    gSprites[task->data[15]].y2 -= 2;
                if (task->data[4] == 10)
                {
                    sub_8079C08(task, task->data[15], 384, 224, 0x100, 0x100, 8);
                    task->data[3] = 0;
                    task->data[4] = 0;
                    task->data[0]++;
                }
            }
            break;
        case 6:
            gSprites[task->data[15]].y--;
            if (sub_8079C74(task) == 0)
            {
                sub_8078F40(task->data[15]);
                gSprites[task->data[15]].y = task->data[5];
                task->data[4] = 0;
                task->data[0]++;
            }
            break;
        case 7:
            if (task->data[2] == 0)
                DestroyAnimVisualTask(taskId);
            break;
    }
}

u8 sub_80D4394(void)
{
    u8 i;
    u16 hp;
    u16 maxhp;
    u16 partyIndex;
    struct Pokemon *slot;

    if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER)
    {
        partyIndex = gBattlerPartyIndexes[gBattleAnimAttacker];
        slot =  &gPlayerParty[partyIndex];
        maxhp = GetMonData(slot, MON_DATA_MAX_HP);
        hp = GetMonData(slot, MON_DATA_HP);
        maxhp /= 4;
    }
    else
    {
        partyIndex = gBattlerPartyIndexes[gBattleAnimAttacker];
        slot =  &gEnemyParty[partyIndex];
        maxhp = GetMonData(slot, MON_DATA_MAX_HP);
        hp = GetMonData(slot, MON_DATA_HP);
        maxhp /= 4;
    }
    for (i = 0; i < 3; i++)
    {
        if (hp < maxhp * (i + 1))
            return i;
    }
    return 3;
}

void sub_80D4418(struct Task *task, u8 taskId)
{
    s16 i;
    s16 attackerCoordX = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
    s16 attackerCoordY = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
    s16 trigIndex = 172;
    u8 subpriority = GetBattlerSubpriority(gBattleAnimAttacker) - 1;
    s16 increment = 4 - task->data[1];
    u8 spriteId;

    if (increment <= 0)
        increment = 1;
    for (i = 0; i < 20; i += increment)
    {
        spriteId = CreateSprite(&gSpriteTemplate_83D9378, attackerCoordX, attackerCoordY, subpriority);
        if (spriteId != MAX_SPRITES)
        {
            gSprites[spriteId].data[1] = i;
            gSprites[spriteId].data[2] = attackerCoordX * 16;
            gSprites[spriteId].data[3] = attackerCoordY * 16;
            gSprites[spriteId].data[4] = Cos(trigIndex, 64);
            gSprites[spriteId].data[5] = Sin(trigIndex, 64);
            gSprites[spriteId].data[6] = taskId;
            gSprites[spriteId].data[7] = 2;
            if (task->data[2] & 1)
                sub_80D452C(&gSprites[spriteId]);
            task->data[2]++;
        }
        trigIndex = (trigIndex + increment * 2);
        trigIndex &= 0xFF;
    }
}

void sub_80D452C(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
        case 0:
            sprite->data[4] += (sprite->data[1] % 6) * 3;
            sprite->data[5] += (sprite->data[1] % 3) * 3;
            sprite->data[0]++;
        case 1:
            sprite->data[2] += sprite->data[4];
            sprite->data[3] += sprite->data[5];
            sprite->x = sprite->data[2] >> 4;
            sprite->y = sprite->data[3] >> 4;
            if (sprite->x < -8 || sprite->x > 248 || sprite->y < -8 || sprite->y > 120)
            {
                gTasks[sprite->data[6]].data[sprite->data[7]]--;
                DestroySprite(sprite);
            }
            break;
    }
}

void sub_80D45D8(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    task->data[1] = sub_80D4394();
    if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER)
    {
        task->data[4] = 136;
        task->data[6] = 40;
    }
    else
    {
        task->data[4] = 16;
        task->data[6] = 80;
    }
    task->data[5] = 98;
    task->data[7] = task->data[4] + 49;
    task->data[12] = task->data[1] * 5 + 5;
    task->func = sub_80D463C;
}

void sub_80D463C(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    u8 taskId2;

    switch (task->data[0])
    {
        case 0:
            if (++task->data[2] > 2)
            {
                task->data[2] = 0;
                sub_80D472C(task, taskId);
            }
            if (task->data[10] != 0 && task->data[13] == 0)
            {
                gBattleAnimArgs[0] = 1;
                gBattleAnimArgs[1] = 0;
                gBattleAnimArgs[2] = 12;
                taskId2 = CreateTask(sub_80E1864, 80);
                if (taskId2 != 0xFF)
                {
                    gTasks[taskId2].func(taskId2);
                    gAnimVisualTaskCount++;
                }
                gBattleAnimArgs[0] = 3;
                taskId2 = CreateTask(sub_80E1864, 80);
                if (taskId2 != 0xFF)
                {
                    gTasks[taskId2].func(taskId2);
                    gAnimVisualTaskCount++;
                }
                task->data[13] = 1;
            }
            if (task->data[11] >= task->data[12])
                task->data[0]++;
            break;
        case 1:
            if (task->data[9] == 0)
                DestroyAnimVisualTask(taskId);
            break;
    }
}

void sub_80D472C(struct Task *task, u8 taskId)
{
    u16 yPosArg = ((gSineTable[task->data[8]] + 3) >> 4) + task->data[6];
    u8 spriteId = CreateSprite(&gSpriteTemplate_83D9378, task->data[7], 0, 0);

    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].callback = sub_80D47D0;
        gSprites[spriteId].data[5] = yPosArg;
        gSprites[spriteId].data[6] = taskId;
        gSprites[spriteId].data[7] = 9;
        task->data[9]++;
    }
    task->data[11]++;
    task->data[8] = (task->data[8] + 39) & 0xFF;
    task->data[7] = ((task->data[7] * 0x41c64e6d + 0x3039) % task->data[5]) + task->data[4];
}

void sub_80D47D0(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->y += 8;
        if (sprite->y >= sprite->data[5])
        {
            gTasks[sprite->data[6]].data[10] = 1;
            sprite->data[1] = CreateSprite(&gBattleAnimSpriteTemplate_83DB4D8, sprite->x, sprite->y, 1);
            if (sprite->data[1] != MAX_SPRITES)
            {
                StartSpriteAffineAnim(&gSprites[sprite->data[1]], 3);
                gSprites[sprite->data[1]].data[6] = sprite->data[6];
                gSprites[sprite->data[1]].data[7] = sprite->data[7];
                gSprites[sprite->data[1]].callback = sub_80D487C;
            }
            DestroySprite(sprite);
        }
    }
}

void sub_80D487C(struct Sprite *sprite)
{
    if (++sprite->data[1] > 1)
    {
        sprite->data[1] = 0;
        sprite->invisible ^= 1;
        if (++sprite->data[2] == 12)
        {
            gTasks[sprite->data[6]].data[sprite->data[7]]--;
            FreeOamMatrix(sprite->oam.matrixNum);
            DestroySprite(sprite);
        }
    }
}

void sub_80D48F4(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    task->data[3] = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
    task->data[4] = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
    task->data[7] = (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER) ? 1 : -1;
    if (IsContest())
        task->data[7] *= -1;
    task->data[5] = task->data[3] + task->data[7] * 8;
    task->data[6] = task->data[4] - task->data[7] * 8;
    task->data[9] = -32;
    task->data[1] = 0;
    task->data[0] = 0;
    task->func = sub_80D4988;
}

void sub_80D4988(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
        case 0:
            sub_80D4AD0(task);
            if (task->data[10] != 0)
                task->data[0]++;
            break;
        case 1:
            sub_80D4AD0(task);
            if (++task->data[1] > 16)
            {
                task->data[1] = 0;
                task->data[0]++;
            }
            break;
        case 2:
            sub_80D4AD0(task);
            task->data[5] += task->data[7] * 6;
            if (!(task->data[5] >= -16 && task->data[5] <= 256))
            {
                if (++task->data[12] > 2)
                {
                    task->data[13] = 1;
                    task->data[0] = 6;
                    task->data[1] = 0;
                }
                else
                {
                    task->data[1] = 0;
                    task->data[0]++;
                }
            }
            break;
        case 3:
            sub_80D4AD0(task);
            task->data[6] -= task->data[7] * 2;
            if (++task->data[1] > 7)
                task->data[0]++;
            break;
        case 4:
            sub_80D4AD0(task);
            task->data[5] -= task->data[7] * 6;
            if (!(task->data[5] >= -16 && task->data[5] <= 256))
            {
                task->data[12]++;
                task->data[1] = 0;
                task->data[0]++;
            }
            break;
        case 5:
            sub_80D4AD0(task);
            task->data[6] -= task->data[7] * 2;
            if (++task->data[1] > 7)
                task->data[0] = 2;
            break;
        case 6:
            if (task->data[8] == 0)
                task->data[0]++;
            break;
        default:
            DestroyAnimVisualTask(taskId);
            break;
    }
}

void sub_80D4AD0(struct Task *task)
{
    u8 spriteId;

    if (++task->data[2] > 1)
    {
        task->data[2] = 0;
        spriteId = CreateSprite(&gSpriteTemplate_83D9378, task->data[3], task->data[4], 10);
        if (spriteId != MAX_SPRITES)
        {
            gSprites[spriteId].data[0] = 16;
            gSprites[spriteId].data[2] = task->data[5];
            gSprites[spriteId].data[4] = task->data[6];
            gSprites[spriteId].data[5] = task->data[9];
            InitAnimArcTranslation(&gSprites[spriteId]);
            gSprites[spriteId].callback = sub_80D4B3C;
            task->data[8]++;
        }
    }
}

void sub_80D4B3C(struct Sprite *sprite)
{
    if (TranslateAnimArc(sprite))
    {
        sprite->x += sprite->x2;
        sprite->y += sprite->y2;
        sprite->data[0] = 6;
        sprite->data[2] = (Random() & 0x1F) - 16 + sprite->x;
        sprite->data[4] = (Random() & 0x1F) - 16 + sprite->y;
        sprite->data[5] = ~(Random() & 7);
        InitAnimArcTranslation(sprite);
        sprite->callback = sub_80D4BA4;
    }
}

void sub_80D4BA4(struct Sprite *sprite)
{
    u16 i;

    if (TranslateAnimArc(sprite))
    {
        for (i = 0; i < NUM_TASKS; i++)
        {
            if (gTasks[i].func == sub_80D4988)
            {
                gTasks[i].data[10] = 1;
                gTasks[i].data[8]--;
                DestroySprite(sprite);
            }
        }
    }
}

void sub_80D4BF0(struct Sprite *sprite)
{
    sprite->x = gBattleAnimArgs[0];
    sprite->y = gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[2] = gBattleAnimArgs[4];
    sprite->data[3] = gBattleAnimArgs[5];
    sprite->callback = sub_80D4C18;
}

void sub_80D4C18(struct Sprite *sprite)
{
    sprite->data[4] -= sprite->data[0];
    sprite->y2 = sprite->data[4] / 10;
    sprite->data[5] = (sprite->data[5] + sprite->data[1]) & 0xFF;
    sprite->x2 = Sin(sprite->data[5], sprite->data[2]);
    if (--sprite->data[3] == 0)
        DestroyAnimSprite(sprite);
}

void sub_80D4C64(struct Sprite *sprite)
{
    sprite->data[3] += sprite->data[1];
    sprite->data[4] += sprite->data[2];
    sprite->x2 = sprite->data[3] >> 7;
    sprite->y2 = sprite->data[4] >> 7;
    if (--sprite->data[0] == 0)
    {
        FreeSpriteOamMatrix(sprite);
        DestroySprite(sprite);
    }
}

void sub_80D4CA4(struct Sprite *sprite)
{
    InitAnimSpritePos(sprite, TRUE);
    sprite->data[1] = GetBattlerSpriteCoord(gBattleAnimTarget, 2);
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, 3);
    sprite->data[3] = gBattleAnimArgs[2];
    sprite->data[4] = gBattleAnimArgs[3];
    sprite->callback = sub_80D4CEC;
}

void sub_80D4CEC(struct Sprite *sprite)
{
    int xDiff = sprite->data[1] - sprite->x;
    int yDiff = sprite->data[2] - sprite->y;

    sprite->x2 = (sprite->data[0] * xDiff) / sprite->data[3];
    sprite->y2 = (sprite->data[0] * yDiff) / sprite->data[3];
    if (++sprite->data[5] == sprite->data[4])
    {
        sprite->data[5] = 0;
        sub_80D4D64(sprite, xDiff, yDiff);
    }
    if (sprite->data[3] == sprite->data[0])
        DestroyAnimSprite(sprite);
    sprite->data[0]++;
}

void sub_80D4D64(struct Sprite *sprite, s32 xDiff, s32 yDiff)
{
    s16 i;
    u8 spriteId;

    s16 combinedX;
    s16 combinedY;
    s16 something;
    s16 randomSomethingX;
    s16 randomSomethingY;

    something = sprite->data[0] / 2;
    // regalloc acts strange here...
    combinedX = sprite->x + sprite->x2;
    combinedY = sprite->y + sprite->y2;

    // ...then goes back to normal right here.
    // Nothing but this appears to reproduce the behavior.
    if (xDiff) // yDiff works too, but not sprite.
    {
        u8 unk = -unk; // this can be any sort of negation
    }

    randomSomethingY = yDiff + (Random() % 10) - 5;
    randomSomethingX = -xDiff + (Random() % 10) - 5;

    for (i = 0; i <= 0; i++)
    {
        spriteId = CreateSprite(&gSpriteTemplate_83D9420, combinedX, combinedY + something, 130);
        gSprites[spriteId].data[0] = 20;
        gSprites[spriteId].data[1] = randomSomethingY;
        gSprites[spriteId].subpriority = GetBattlerSubpriority(gBattleAnimAttacker) - 1;
        if (randomSomethingX < 0)
            gSprites[spriteId].data[2] = -randomSomethingX;
        else
            gSprites[spriteId].data[2] = randomSomethingX;
    }
    for (i = 0; i <= 0; i++)
    {
        spriteId = CreateSprite(&gSpriteTemplate_83D9420, combinedX, combinedY - something, 130);
        gSprites[spriteId].data[0] = 20;
        gSprites[spriteId].data[1] = randomSomethingY;
        gSprites[spriteId].subpriority = GetBattlerSubpriority(gBattleAnimAttacker) - 1;
        if (randomSomethingX > 0)
            gSprites[spriteId].data[2] = -randomSomethingX;
        else
            gSprites[spriteId].data[2] = randomSomethingX;
    }
}
