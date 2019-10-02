#include "global.h"
#include "battle.h"
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
void sub_80D4D64(struct Sprite*, int, int);
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
    sprite->data[2] = sprite->pos1.x + gBattleAnimArgs[2];
    sprite->data[4] = sprite->pos1.y + gBattleAnimArgs[4];

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
    sprite->pos2.x = Sin(sprite->data[0], 4);

    sprite->data[1] += 48;
    sprite->pos2.y = -(sprite->data[1] >> 8);

    if (--sprite->data[7] == -1)
    {
        DestroyAnimSprite(sprite);
    }
}

NAKED
void AnimTask_CreateSurfWave(u8 taskId)
{
    asm(".syntax unified\n\
    .equ REG_BLDCNT, 0x4000050\n\
    .equ REG_BG1CNT, 0x400000A\n\
    .equ REG_BG1HOFS, 0x4000014\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x14\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r10, r0\n\
    ldr r1, _080D398C @ =REG_BLDCNT\n\
    ldr r2, _080D3990 @ =0x00003f42\n\
    adds r0, r2, 0\n\
    strh r0, [r1]\n\
    adds r1, 0x2\n\
    movs r3, 0x80\n\
    lsls r3, 5\n\
    adds r0, r3, 0\n\
    strh r0, [r1]\n\
    ldr r2, _080D3994 @ =REG_BG1CNT\n\
    ldrb r1, [r2]\n\
    movs r0, 0x4\n\
    negs r0, r0\n\
    ands r0, r1\n\
    movs r1, 0x1\n\
    orrs r0, r1\n\
    strb r0, [r2]\n\
    ldrb r1, [r2, 0x1]\n\
    movs r0, 0x3F\n\
    ands r0, r1\n\
    movs r1, 0x40\n\
    orrs r0, r1\n\
    strb r0, [r2, 0x1]\n\
    mov r0, sp\n\
    bl sub_8078914\n\
    ldr r2, [sp]\n\
    movs r3, 0x80\n\
    lsls r3, 6\n\
    add r6, sp, 0x10\n\
    add r0, sp, 0xC\n\
    mov r12, r0\n\
    movs r5, 0\n\
    ldr r1, _080D3998 @ =0x040000d4\n\
    movs r4, 0x80\n\
    lsls r4, 5\n\
    mov r8, r6\n\
    ldr r7, _080D399C @ =0x85000400\n\
    movs r0, 0x85\n\
    lsls r0, 24\n\
    mov r9, r0\n\
_080D3920:\n\
    str r5, [sp, 0x10]\n\
    mov r0, r8\n\
    str r0, [r1]\n\
    str r2, [r1, 0x4]\n\
    str r7, [r1, 0x8]\n\
    ldr r0, [r1, 0x8]\n\
    adds r2, r4\n\
    subs r3, r4\n\
    cmp r3, r4\n\
    bhi _080D3920\n\
    str r5, [sp, 0x10]\n\
    str r6, [r1]\n\
    str r2, [r1, 0x4]\n\
    lsrs r0, r3, 2\n\
    mov r2, r9\n\
    orrs r0, r2\n\
    str r0, [r1, 0x8]\n\
    ldr r0, [r1, 0x8]\n\
    movs r0, 0\n\
    mov r3, r12\n\
    strb r0, [r3]\n\
    strb r0, [r3]\n\
    ldr r1, [sp, 0x4]\n\
    movs r0, 0\n\
    str r0, [sp, 0x10]\n\
    ldr r0, _080D3998 @ =0x040000d4\n\
    str r6, [r0]\n\
    str r1, [r0, 0x4]\n\
    ldr r1, _080D399C @ =0x85000400\n\
    str r1, [r0, 0x8]\n\
    ldr r0, [r0, 0x8]\n\
    bl IsContest\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _080D39B8\n\
    ldr r2, _080D3994 @ =REG_BG1CNT\n\
    ldrb r1, [r2]\n\
    movs r0, 0xD\n\
    negs r0, r0\n\
    ands r0, r1\n\
    movs r1, 0x4\n\
    orrs r0, r1\n\
    strb r0, [r2]\n\
    ldr r0, _080D39A0 @ =gBattleAnimAttacker\n\
    ldrb r0, [r0]\n\
    bl GetBattlerSide\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0x1\n\
    bne _080D39A8\n\
    ldr r0, _080D39A4 @ =gUnknown_08E70968\n\
    b _080D39AA\n\
    .align 2, 0\n\
_080D398C: .4byte REG_BLDCNT\n\
_080D3990: .4byte 0x00003f42\n\
_080D3994: .4byte REG_BG1CNT\n\
_080D3998: .4byte 0x040000d4\n\
_080D399C: .4byte 0x85000400\n\
_080D39A0: .4byte gBattleAnimAttacker\n\
_080D39A4: .4byte gUnknown_08E70968\n\
_080D39A8:\n\
    ldr r0, _080D39B4 @ =gUnknown_08E70C38\n\
_080D39AA:\n\
    ldr r1, [sp, 0x4]\n\
    bl LZDecompressVram\n\
    b _080D39CE\n\
    .align 2, 0\n\
_080D39B4: .4byte gUnknown_08E70C38\n\
_080D39B8:\n\
    ldr r0, _080D39F0 @ =gUnknown_08E70F0C\n\
    ldr r1, [sp, 0x4]\n\
    bl LZDecompressVram\n\
    mov r0, sp\n\
    ldrb r0, [r0, 0x8]\n\
    ldr r1, [sp, 0x4]\n\
    movs r2, 0\n\
    movs r3, 0x1\n\
    bl sub_80763FC\n\
_080D39CE:\n\
    ldr r0, _080D39F4 @ =gBattleAnimBackgroundImage_Surf\n\
    ldr r1, [sp]\n\
    bl LZDecompressVram\n\
    ldr r0, _080D39F8 @ =gBattleAnimArgs\n\
    movs r1, 0\n\
    ldrsh r0, [r0, r1]\n\
    cmp r0, 0\n\
    bne _080D3A00\n\
    ldr r0, _080D39FC @ =gBattleAnimBackgroundPalette_Surf\n\
    mov r1, sp\n\
    ldrb r1, [r1, 0x8]\n\
    lsls r1, 4\n\
    movs r2, 0x20\n\
    bl LoadCompressedPalette\n\
    b _080D3A0E\n\
    .align 2, 0\n\
_080D39F0: .4byte gUnknown_08E70F0C\n\
_080D39F4: .4byte gBattleAnimBackgroundImage_Surf\n\
_080D39F8: .4byte gBattleAnimArgs\n\
_080D39FC: .4byte gBattleAnimBackgroundPalette_Surf\n\
_080D3A00:\n\
    ldr r0, _080D3A78 @ =gBattleAnimBackgroundImageMuddyWater_Pal\n\
    mov r1, sp\n\
    ldrb r1, [r1, 0x8]\n\
    lsls r1, 4\n\
    movs r2, 0x20\n\
    bl LoadCompressedPalette\n\
_080D3A0E:\n\
    ldr r0, _080D3A7C @ =sub_80D3D68\n\
    ldr r4, _080D3A80 @ =gTasks\n\
    mov r2, r10\n\
    lsls r5, r2, 2\n\
    adds r1, r5, r2\n\
    lsls r1, 3\n\
    adds r6, r1, r4\n\
    ldrb r1, [r6, 0x7]\n\
    adds r1, 0x1\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
    bl CreateTask\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r8, r0\n\
    movs r3, 0\n\
    mov r9, r3\n\
    mov r0, r8\n\
    strh r0, [r6, 0x26]\n\
    mov r1, r8\n\
    lsls r0, r1, 2\n\
    add r0, r8\n\
    lsls r0, 3\n\
    adds r7, r0, r4\n\
    mov r2, r9\n\
    strh r2, [r7, 0x8]\n\
    movs r0, 0x80\n\
    lsls r0, 5\n\
    strh r0, [r7, 0xA]\n\
    strh r0, [r7, 0xC]\n\
    bl IsContest\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    cmp r4, 0\n\
    beq _080D3A94\n\
    ldr r3, _080D3A84 @ =0x0000ffb0\n\
    adds r0, r3, 0\n\
    ldr r1, _080D3A88 @ =gBattle_BG1_X\n\
    strh r0, [r1]\n\
    ldr r2, _080D3A8C @ =0x0000ffd0\n\
    adds r0, r2, 0\n\
    ldr r3, _080D3A90 @ =gBattle_BG1_Y\n\
    strh r0, [r3]\n\
    movs r0, 0x2\n\
    strh r0, [r6, 0x8]\n\
    movs r0, 0x1\n\
    strh r0, [r6, 0xA]\n\
    mov r0, r9\n\
    strh r0, [r7, 0xE]\n\
    b _080D3AEE\n\
    .align 2, 0\n\
_080D3A78: .4byte gBattleAnimBackgroundImageMuddyWater_Pal\n\
_080D3A7C: .4byte sub_80D3D68\n\
_080D3A80: .4byte gTasks\n\
_080D3A84: .4byte 0x0000ffb0\n\
_080D3A88: .4byte gBattle_BG1_X\n\
_080D3A8C: .4byte 0x0000ffd0\n\
_080D3A90: .4byte gBattle_BG1_Y\n\
_080D3A94:\n\
    ldr r0, _080D3AC4 @ =gBattleAnimAttacker\n\
    ldrb r0, [r0]\n\
    bl GetBattlerSide\n\
    lsls r0, 24\n\
    lsrs r1, r0, 24\n\
    cmp r1, 0x1\n\
    bne _080D3AD8\n\
    ldr r2, _080D3AC8 @ =0x0000ff20\n\
    adds r0, r2, 0\n\
    ldr r3, _080D3ACC @ =gBattle_BG1_X\n\
    strh r0, [r3]\n\
    movs r2, 0x80\n\
    lsls r2, 1\n\
    adds r0, r2, 0\n\
    ldr r3, _080D3AD0 @ =gBattle_BG1_Y\n\
    strh r0, [r3]\n\
    movs r0, 0x2\n\
    strh r0, [r6, 0x8]\n\
    ldr r0, _080D3AD4 @ =0x0000ffff\n\
    strh r0, [r6, 0xA]\n\
    strh r1, [r7, 0xE]\n\
    b _080D3AEE\n\
    .align 2, 0\n\
_080D3AC4: .4byte gBattleAnimAttacker\n\
_080D3AC8: .4byte 0x0000ff20\n\
_080D3ACC: .4byte gBattle_BG1_X\n\
_080D3AD0: .4byte gBattle_BG1_Y\n\
_080D3AD4: .4byte 0x0000ffff\n\
_080D3AD8:\n\
    ldr r0, _080D3B1C @ =gBattle_BG1_X\n\
    strh r4, [r0]\n\
    ldr r1, _080D3B20 @ =0x0000ffd0\n\
    adds r0, r1, 0\n\
    ldr r2, _080D3B24 @ =gBattle_BG1_Y\n\
    strh r0, [r2]\n\
    ldr r0, _080D3B28 @ =0x0000fffe\n\
    strh r0, [r6, 0x8]\n\
    movs r0, 0x1\n\
    strh r0, [r6, 0xA]\n\
    strh r4, [r7, 0xE]\n\
_080D3AEE:\n\
    ldr r1, _080D3B2C @ =REG_BG1HOFS\n\
    ldr r3, _080D3B1C @ =gBattle_BG1_X\n\
    ldrh r0, [r3]\n\
    strh r0, [r1]\n\
    adds r1, 0x2\n\
    ldr r2, _080D3B24 @ =gBattle_BG1_Y\n\
    ldrh r0, [r2]\n\
    strh r0, [r1]\n\
    ldr r1, _080D3B30 @ =gTasks\n\
    mov r3, r8\n\
    lsls r0, r3, 2\n\
    add r0, r8\n\
    lsls r0, 3\n\
    adds r2, r0, r1\n\
    movs r3, 0xE\n\
    ldrsh r0, [r2, r3]\n\
    cmp r0, 0\n\
    bne _080D3B34\n\
    movs r0, 0x30\n\
    strh r0, [r2, 0x10]\n\
    movs r0, 0x70\n\
    b _080D3B38\n\
    .align 2, 0\n\
_080D3B1C: .4byte gBattle_BG1_X\n\
_080D3B20: .4byte 0x0000ffd0\n\
_080D3B24: .4byte gBattle_BG1_Y\n\
_080D3B28: .4byte 0x0000fffe\n\
_080D3B2C: .4byte REG_BG1HOFS\n\
_080D3B30: .4byte gTasks\n\
_080D3B34:\n\
    movs r0, 0\n\
    strh r0, [r2, 0x10]\n\
_080D3B38:\n\
    strh r0, [r2, 0x12]\n\
    mov r2, r10\n\
    adds r0, r5, r2\n\
    lsls r0, 3\n\
    adds r0, r1\n\
    movs r1, 0x1\n\
    strh r1, [r0, 0x14]\n\
    ldr r1, _080D3B5C @ =sub_80D3B60\n\
    str r1, [r0]\n\
    add sp, 0x14\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080D3B5C: .4byte sub_80D3B60\n\
    .syntax divided\n");
}

#ifdef NONMATCHING
void sub_80D3B60(u8 taskId)
{
    struct Struct_sub_8078914 unk;
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
        gTasks[taskId].data[0] = gTasks[gTasks[taskId].data[15]].data[1] & 0x1F;
        gTasks[taskId].func = sub_80D3D68;
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

#ifdef NONMATCHING
void sub_80D3D68(u8 taskId)
{
    s16 i;
    struct ScanlineEffectParams params;
    struct Task *task = &gTasks[taskId];
    // u16 *scanlineBuffer;

    switch (task->data[0])
    {
        case 0:
            for (i = 0; i < task->data[4]; i++)
            {
                /* scanlineBuffer = &gScanlineEffectRegBuffers[0][i];
                *(u16 *)(&gScanlineEffect) = task->data[2];
                *scanlineBuffer = task->data[2] & -1; */
                gScanlineEffectRegBuffers[1][i] = task->data[2];
                gScanlineEffectRegBuffers[0][i] = (u16)((int)(task->data[2] & 0xFFFF));
            }
            for (i = task->data[4]; i < task->data[5]; i++)
            {
                gScanlineEffectRegBuffers[1][i] = task->data[1];
                gScanlineEffectRegBuffers[0][i] = (u16)((int)(task->data[1] & 0xFFFF));
            }
            for (i = task->data[5]; i < 160; i++)
            {
                gScanlineEffectRegBuffers[1][i] = task->data[2];
                gScanlineEffectRegBuffers[0][i] = (u16)((int)(task->data[2] & 0xFFFF));
            }
            if (task->data[4] == 0)
            {
                gScanlineEffectRegBuffers[1][i] = task->data[1];
                gScanlineEffectRegBuffers[0][i] = task->data[1];
            }
            else
            {
                gScanlineEffectRegBuffers[1][i] = task->data[2];
                gScanlineEffectRegBuffers[0][i] = task->data[2];
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
#else
NAKED
void sub_80D3D68(u8 taskId)
{
    asm_unified("push {r4-r7,lr}\n\
	sub sp, 0xC\n\
	lsls r0, 24\n\
	lsrs r7, r0, 24\n\
	lsls r0, r7, 2\n\
	adds r0, r7\n\
	lsls r0, 3\n\
	ldr r1, =gTasks\n\
	adds r4, r0, r1\n\
	movs r1, 0x8\n\
	ldrsh r0, [r4, r1]\n\
	cmp r0, 0x1\n\
	bne _080D3D84\n\
	b _080D3EBC\n\
_080D3D84:\n\
	cmp r0, 0x1\n\
	bgt _080D3D94\n\
	cmp r0, 0\n\
	beq _080D3D9C\n\
	b _080D4032\n\
	.align 2, 0\n\
	.pool\n\
_080D3D94:\n\
	cmp r0, 0x2\n\
	bne _080D3D9A\n\
	b _080D3F88\n\
_080D3D9A:\n\
	b _080D4032\n\
_080D3D9C:\n\
	movs r3, 0\n\
	movs r2, 0x10\n\
	ldrsh r0, [r4, r2]\n\
	ldr r1, =gScanlineEffectRegBuffers\n\
	mov r12, r1\n\
	cmp r3, r0\n\
	bge _080D3DDA\n\
	mov r7, r12\n\
	movs r5, 0xF0\n\
	lsls r5, 3\n\
	add r5, r12\n\
	ldr r6, =0x0000ffff\n\
_080D3DB4:\n\
	lsls r2, r3, 16\n\
	asrs r2, 16\n\
	lsls r1, r2, 1\n\
	adds r3, r1, r7\n\
	adds r1, r5\n\
	ldrh r0, [r4, 0xC]\n\
	strh r0, [r1]\n\
	ldrh r1, [r4, 0xC]\n\
	adds r0, r6, 0\n\
	ands r0, r1\n\
	strh r0, [r3]\n\
	adds r2, 0x1\n\
	lsls r2, 16\n\
	lsrs r3, r2, 16\n\
	asrs r2, 16\n\
	movs r1, 0x10\n\
	ldrsh r0, [r4, r1]\n\
	cmp r2, r0\n\
	blt _080D3DB4\n\
_080D3DDA:\n\
	ldrh r3, [r4, 0x10]\n\
	lsls r2, r3, 16\n\
	asrs r1, r2, 16\n\
	movs r3, 0x12\n\
	ldrsh r0, [r4, r3]\n\
	cmp r1, r0\n\
	bge _080D3E14\n\
	ldr r5, =gScanlineEffectRegBuffers\n\
	movs r0, 0xF0\n\
	lsls r0, 3\n\
	adds r6, r5, r0\n\
	ldr r7, =0x0000ffff\n\
_080D3DF2:\n\
	asrs r2, 16\n\
	lsls r1, r2, 1\n\
	adds r3, r1, r5\n\
	adds r1, r6\n\
	ldrh r0, [r4, 0xA]\n\
	strh r0, [r1]\n\
	ldrh r1, [r4, 0xA]\n\
	adds r0, r7, 0\n\
	ands r0, r1\n\
	strh r0, [r3]\n\
	adds r2, 0x1\n\
	lsls r2, 16\n\
	asrs r1, r2, 16\n\
	movs r3, 0x12\n\
	ldrsh r0, [r4, r3]\n\
	cmp r1, r0\n\
	blt _080D3DF2\n\
_080D3E14:\n\
	ldrh r3, [r4, 0x12]\n\
	lsls r2, r3, 16\n\
	asrs r0, r2, 16\n\
	cmp r0, 0x9F\n\
	bgt _080D3E4A\n\
	ldr r5, =gScanlineEffectRegBuffers\n\
	movs r0, 0xF0\n\
	lsls r0, 3\n\
	adds r6, r5, r0\n\
	ldr r7, =0x0000ffff\n\
_080D3E28:\n\
	asrs r2, 16\n\
	lsls r1, r2, 1\n\
	adds r3, r1, r5\n\
	adds r1, r6\n\
	ldrh r0, [r4, 0xC]\n\
	strh r0, [r1]\n\
	ldrh r1, [r4, 0xC]\n\
	adds r0, r7, 0\n\
	ands r0, r1\n\
	strh r0, [r3]\n\
	adds r2, 0x1\n\
	lsls r2, 16\n\
	lsrs r3, r2, 16\n\
	lsls r2, r3, 16\n\
	asrs r0, r2, 16\n\
	cmp r0, 0x9F\n\
	ble _080D3E28\n\
_080D3E4A:\n\
	movs r1, 0x10\n\
	ldrsh r0, [r4, r1]\n\
	cmp r0, 0\n\
	bne _080D3E74\n\
	lsls r0, r3, 16\n\
	asrs r0, 15\n\
	mov r3, r12\n\
	adds r2, r0, r3\n\
	movs r1, 0xF0\n\
	lsls r1, 3\n\
	add r1, r12\n\
	adds r0, r1\n\
	ldrh r1, [r4, 0xA]\n\
	strh r1, [r0]\n\
	ldrh r0, [r4, 0xA]\n\
	b _080D3E8A\n\
	.align 2, 0\n\
	.pool\n\
_080D3E74:\n\
	lsls r0, r3, 16\n\
	asrs r0, 15\n\
	mov r1, r12\n\
	adds r2, r0, r1\n\
	movs r1, 0xF0\n\
	lsls r1, 3\n\
	add r1, r12\n\
	adds r0, r1\n\
	ldrh r1, [r4, 0xC]\n\
	strh r1, [r0]\n\
	ldrh r0, [r4, 0xC]\n\
_080D3E8A:\n\
	strh r0, [r2]\n\
	ldr r0, =0x04000052\n\
	str r0, [sp]\n\
	ldr r0, =0xa2600001\n\
	str r0, [sp, 0x4]\n\
	mov r1, sp\n\
	movs r2, 0\n\
	movs r0, 0x1\n\
	strb r0, [r1, 0x8]\n\
	mov r0, sp\n\
	strb r2, [r0, 0x9]\n\
	ldr r0, [sp]\n\
	ldr r1, [sp, 0x4]\n\
	ldr r2, [sp, 0x8]\n\
	bl ScanlineEffect_SetParams\n\
	ldrh r0, [r4, 0x8]\n\
	adds r0, 0x1\n\
	strh r0, [r4, 0x8]\n\
	b _080D4032\n\
	.align 2, 0\n\
	.pool\n\
_080D3EBC:\n\
	movs r2, 0xE\n\
	ldrsh r1, [r4, r2]\n\
	cmp r1, 0\n\
	bne _080D3ED4\n\
	ldrh r0, [r4, 0x10]\n\
	subs r0, 0x1\n\
	strh r0, [r4, 0x10]\n\
	lsls r0, 16\n\
	cmp r0, 0\n\
	bgt _080D3EE8\n\
	strh r1, [r4, 0x10]\n\
	b _080D3EE2\n\
_080D3ED4:\n\
	ldrh r0, [r4, 0x12]\n\
	adds r0, 0x1\n\
	strh r0, [r4, 0x12]\n\
	lsls r0, 16\n\
	asrs r0, 16\n\
	cmp r0, 0x6F\n\
	ble _080D3EE8\n\
_080D3EE2:\n\
	ldrh r0, [r4, 0x8]\n\
	adds r0, 0x1\n\
	strh r0, [r4, 0x8]\n\
_080D3EE8:\n\
	movs r3, 0\n\
	movs r1, 0x10\n\
	ldrsh r0, [r4, r1]\n\
	cmp r3, r0\n\
	bge _080D3F1C\n\
	ldr r6, =gScanlineEffectRegBuffers\n\
	ldr r5, =gScanlineEffect\n\
_080D3EF6:\n\
	lsls r1, r3, 16\n\
	asrs r1, 16\n\
	lsls r3, r1, 1\n\
	ldrb r2, [r5, 0x14]\n\
	lsls r0, r2, 4\n\
	subs r0, r2\n\
	lsls r0, 7\n\
	adds r3, r0\n\
	adds r3, r6\n\
	ldrh r0, [r4, 0xC]\n\
	strh r0, [r3]\n\
	adds r1, 0x1\n\
	lsls r1, 16\n\
	lsrs r3, r1, 16\n\
	asrs r1, 16\n\
	movs r2, 0x10\n\
	ldrsh r0, [r4, r2]\n\
	cmp r1, r0\n\
	blt _080D3EF6\n\
_080D3F1C:\n\
	ldrh r3, [r4, 0x10]\n\
	lsls r2, r3, 16\n\
	asrs r1, r2, 16\n\
	movs r3, 0x12\n\
	ldrsh r0, [r4, r3]\n\
	cmp r1, r0\n\
	bge _080D3F50\n\
	ldr r6, =gScanlineEffectRegBuffers\n\
	ldr r5, =gScanlineEffect\n\
_080D3F2E:\n\
	asrs r3, r2, 16\n\
	lsls r2, r3, 1\n\
	ldrb r1, [r5, 0x14]\n\
	lsls r0, r1, 4\n\
	subs r0, r1\n\
	lsls r0, 7\n\
	adds r2, r0\n\
	adds r2, r6\n\
	ldrh r0, [r4, 0xA]\n\
	strh r0, [r2]\n\
	adds r3, 0x1\n\
	lsls r2, r3, 16\n\
	asrs r1, r2, 16\n\
	movs r3, 0x12\n\
	ldrsh r0, [r4, r3]\n\
	cmp r1, r0\n\
	blt _080D3F2E\n\
_080D3F50:\n\
	ldrh r3, [r4, 0x12]\n\
	lsls r1, r3, 16\n\
	asrs r0, r1, 16\n\
	cmp r0, 0x9F\n\
	bgt _080D4032\n\
	ldr r6, =gScanlineEffectRegBuffers\n\
	ldr r5, =gScanlineEffect\n\
_080D3F5E:\n\
	asrs r3, r1, 16\n\
	lsls r2, r3, 1\n\
	ldrb r1, [r5, 0x14]\n\
	lsls r0, r1, 4\n\
	subs r0, r1\n\
	lsls r0, 7\n\
	adds r2, r0\n\
	adds r2, r6\n\
	ldrh r0, [r4, 0xC]\n\
	strh r0, [r2]\n\
	adds r3, 0x1\n\
	lsls r1, r3, 16\n\
	asrs r0, r1, 16\n\
	cmp r0, 0x9F\n\
	ble _080D3F5E\n\
	b _080D4032\n\
	.align 2, 0\n\
	.pool\n\
_080D3F88:\n\
	movs r3, 0\n\
	movs r1, 0x10\n\
	ldrsh r0, [r4, r1]\n\
	cmp r3, r0\n\
	bge _080D3FBC\n\
	ldr r6, =gScanlineEffectRegBuffers\n\
	ldr r5, =gScanlineEffect\n\
_080D3F96:\n\
	lsls r1, r3, 16\n\
	asrs r1, 16\n\
	lsls r3, r1, 1\n\
	ldrb r2, [r5, 0x14]\n\
	lsls r0, r2, 4\n\
	subs r0, r2\n\
	lsls r0, 7\n\
	adds r3, r0\n\
	adds r3, r6\n\
	ldrh r0, [r4, 0xC]\n\
	strh r0, [r3]\n\
	adds r1, 0x1\n\
	lsls r1, 16\n\
	lsrs r3, r1, 16\n\
	asrs r1, 16\n\
	movs r2, 0x10\n\
	ldrsh r0, [r4, r2]\n\
	cmp r1, r0\n\
	blt _080D3F96\n\
_080D3FBC:\n\
	ldrh r3, [r4, 0x10]\n\
	lsls r2, r3, 16\n\
	asrs r1, r2, 16\n\
	movs r3, 0x12\n\
	ldrsh r0, [r4, r3]\n\
	cmp r1, r0\n\
	bge _080D3FF0\n\
	ldr r6, =gScanlineEffectRegBuffers\n\
	ldr r5, =gScanlineEffect\n\
_080D3FCE:\n\
	asrs r3, r2, 16\n\
	lsls r2, r3, 1\n\
	ldrb r1, [r5, 0x14]\n\
	lsls r0, r1, 4\n\
	subs r0, r1\n\
	lsls r0, 7\n\
	adds r2, r0\n\
	adds r2, r6\n\
	ldrh r0, [r4, 0xA]\n\
	strh r0, [r2]\n\
	adds r3, 0x1\n\
	lsls r2, r3, 16\n\
	asrs r1, r2, 16\n\
	movs r3, 0x12\n\
	ldrsh r0, [r4, r3]\n\
	cmp r1, r0\n\
	blt _080D3FCE\n\
_080D3FF0:\n\
	ldrh r3, [r4, 0x12]\n\
	lsls r1, r3, 16\n\
	asrs r0, r1, 16\n\
	cmp r0, 0x9F\n\
	bgt _080D401C\n\
	ldr r6, =gScanlineEffectRegBuffers\n\
	ldr r5, =gScanlineEffect\n\
_080D3FFE:\n\
	asrs r3, r1, 16\n\
	lsls r2, r3, 1\n\
	ldrb r1, [r5, 0x14]\n\
	lsls r0, r1, 4\n\
	subs r0, r1\n\
	lsls r0, 7\n\
	adds r2, r0\n\
	adds r2, r6\n\
	ldrh r0, [r4, 0xC]\n\
	strh r0, [r2]\n\
	adds r3, 0x1\n\
	lsls r1, r3, 16\n\
	asrs r0, r1, 16\n\
	cmp r0, 0x9F\n\
	ble _080D3FFE\n\
_080D401C:\n\
	movs r0, 0x26\n\
	ldrsh r1, [r4, r0]\n\
	movs r0, 0x1\n\
	negs r0, r0\n\
	cmp r1, r0\n\
	bne _080D4032\n\
	bl ScanlineEffect_Stop\n\
	adds r0, r7, 0\n\
	bl DestroyTask\n\
_080D4032:\n\
	add sp, 0xC\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
	.pool\n");
}
#endif

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
        sprite->pos2.x = -(sprite->data[3] >> 8);
    else
        sprite->pos2.x = sprite->data[3] >> 8;
    sprite->pos2.y = sprite->data[4] >> 8;
    if (++sprite->data[0] == 21)
        DestroyAnimSprite(sprite);
}

void sub_80D40F4(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    task->data[15] = GetAnimBattlerSpriteId(ANIM_BATTLER_ATTACKER);
    task->data[5] = gSprites[task->data[15]].pos1.y;
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
                    gSprites[task->data[15]].pos2.x = 3;
                    gSprites[task->data[15]].pos1.y++;
                }
                else
                {
                    gSprites[task->data[15]].pos2.x = -3;
                }
            }
            if (sub_8079C74(task) == 0)
            {
                sub_8079A64(task->data[15]);
                gSprites[task->data[15]].pos2.x = 0;
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
                    gSprites[task->data[15]].pos2.y += 2;
                else
                    gSprites[task->data[15]].pos2.y -= 2;
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
            gSprites[task->data[15]].pos1.y--;
            if (sub_8079C74(task) == 0)
            {
                sub_8078F40(task->data[15]);
                gSprites[task->data[15]].pos1.y = task->data[5];
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
            sprite->pos1.x = sprite->data[2] >> 4;
            sprite->pos1.y = sprite->data[3] >> 4;
            if (sprite->pos1.x < -8 || sprite->pos1.x > 248 || sprite->pos1.y < -8 || sprite->pos1.y > 120)
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
        sprite->pos1.y += 8;
        if (sprite->pos1.y >= sprite->data[5])
        {
            gTasks[sprite->data[6]].data[10] = 1;
            sprite->data[1] = CreateSprite(&gBattleAnimSpriteTemplate_83DB4D8, sprite->pos1.x, sprite->pos1.y, 1);
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
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->data[0] = 6;
        sprite->data[2] = (Random() & 0x1F) - 16 + sprite->pos1.x;
        sprite->data[4] = (Random() & 0x1F) - 16 + sprite->pos1.y;
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
    sprite->pos1.x = gBattleAnimArgs[0];
    sprite->pos1.y = gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[2] = gBattleAnimArgs[4];
    sprite->data[3] = gBattleAnimArgs[5];
    sprite->callback = sub_80D4C18;
}

void sub_80D4C18(struct Sprite *sprite)
{
    sprite->data[4] -= sprite->data[0];
    sprite->pos2.y = sprite->data[4] / 10;
    sprite->data[5] = (sprite->data[5] + sprite->data[1]) & 0xFF;
    sprite->pos2.x = Sin(sprite->data[5], sprite->data[2]);
    if (--sprite->data[3] == 0)
        DestroyAnimSprite(sprite);
}

void sub_80D4C64(struct Sprite *sprite)
{
    sprite->data[3] += sprite->data[1];
    sprite->data[4] += sprite->data[2];
    sprite->pos2.x = sprite->data[3] >> 7;
    sprite->pos2.y = sprite->data[4] >> 7;
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
    int xDiff = sprite->data[1] - sprite->pos1.x;
    int yDiff = sprite->data[2] - sprite->pos1.y;

    sprite->pos2.x = (sprite->data[0] * xDiff) / sprite->data[3];
    sprite->pos2.y = (sprite->data[0] * yDiff) / sprite->data[3];
    if (++sprite->data[5] == sprite->data[4])
    {
        sprite->data[5] = 0;
        sub_80D4D64(sprite, xDiff, yDiff);
    }
    if (sprite->data[3] == sprite->data[0])
        DestroyAnimSprite(sprite);
    sprite->data[0]++;
}

#ifdef NONMATCHING
void sub_80D4D64(struct Sprite *sprite, int xDiff, int yDiff)
{
    s16 something = sprite->data[0] / 2;
    s16 combinedX = sprite->pos1.x + sprite->pos2.x;
    s16 combinedY = sprite->pos1.y + sprite->pos2.y;
    s16 randomSomethingY = yDiff + (Random() % 10) - 5;
    s16 randomSomethingX = -xDiff + (Random() % 10) - 5;
    s16 i;
    u8 spriteId;

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
#else
NAKED
void sub_80D4D64(struct Sprite *sprite, int xDiff, int yDiff)
{
    asm_unified("push {r4-r7,lr}\n\
	mov r7, r10\n\
	mov r6, r9\n\
	mov r5, r8\n\
	push {r5-r7}\n\
	sub sp, 0x18\n\
	adds r4, r1, 0\n\
	adds r5, r2, 0\n\
	movs r2, 0x2E\n\
	ldrsh r1, [r0, r2]\n\
	lsrs r2, r1, 31\n\
	adds r1, r2\n\
	lsls r1, 15\n\
	lsrs r1, 16\n\
	str r1, [sp]\n\
	ldrh r1, [r0, 0x24]\n\
	ldrh r3, [r0, 0x20]\n\
	adds r1, r3\n\
	lsls r1, 16\n\
	lsrs r1, 16\n\
	mov r8, r1\n\
	ldrh r1, [r0, 0x26]\n\
	ldrh r0, [r0, 0x22]\n\
	adds r1, r0\n\
	lsls r1, 16\n\
	lsrs r1, 16\n\
	mov r10, r1\n\
	bl Random\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	movs r1, 0xA\n\
	bl __umodsi3\n\
	adds r0, r5, r0\n\
	subs r0, 0x5\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	mov r9, r0\n\
	bl Random\n\
	negs r4, r4\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	movs r1, 0xA\n\
	bl __umodsi3\n\
	adds r4, r0\n\
	subs r4, 0x5\n\
	lsls r4, 16\n\
	lsrs r7, r4, 16\n\
	movs r6, 0\n\
	mov r0, r8\n\
	lsls r0, 16\n\
	mov r8, r0\n\
	mov r1, r10\n\
	lsls r1, 16\n\
	str r1, [sp, 0xC]\n\
	ldr r2, [sp]\n\
	lsls r2, 16\n\
	str r2, [sp, 0x10]\n\
	asrs r1, 16\n\
	lsls r0, r7, 16\n\
	asrs r5, r0, 16\n\
	str r0, [sp, 0x14]\n\
	negs r3, r5\n\
	str r3, [sp, 0x4]\n\
	asrs r0, r2, 16\n\
	adds r1, r0\n\
	lsls r1, 16\n\
	mov r10, r1\n\
_080D4DF2:\n\
	ldr r0, =gSpriteTemplate_83D9420\n\
	mov r2, r8\n\
	asrs r1, r2, 16\n\
	mov r3, r10\n\
	asrs r2, r3, 16\n\
	movs r3, 0x82\n\
	bl CreateSprite\n\
	lsls r0, 24\n\
	lsrs r2, r0, 24\n\
	ldr r1, =gSprites\n\
	lsls r0, r2, 4\n\
	adds r0, r2\n\
	lsls r0, 2\n\
	adds r4, r0, r1\n\
	movs r0, 0x14\n\
	strh r0, [r4, 0x2E]\n\
	mov r0, r9\n\
	strh r0, [r4, 0x30]\n\
	ldr r0, =gBattleAnimAttacker\n\
	ldrb r0, [r0]\n\
	bl GetBattlerSubpriority\n\
	subs r0, 0x1\n\
	adds r1, r4, 0\n\
	adds r1, 0x43\n\
	strb r0, [r1]\n\
	cmp r5, 0\n\
	bge _080D4E40\n\
	mov r1, sp\n\
	ldrh r1, [r1, 0x4]\n\
	strh r1, [r4, 0x32]\n\
	b _080D4E42\n\
	.align 2, 0\n\
	.pool\n\
_080D4E40:\n\
	strh r7, [r4, 0x32]\n\
_080D4E42:\n\
	lsls r0, r6, 16\n\
	movs r2, 0x80\n\
	lsls r2, 9\n\
	adds r0, r2\n\
	lsrs r6, r0, 16\n\
	cmp r0, 0\n\
	ble _080D4DF2\n\
	movs r6, 0\n\
	ldr r3, [sp, 0xC]\n\
	asrs r1, r3, 16\n\
	ldr r0, [sp, 0x14]\n\
	asrs r5, r0, 16\n\
	negs r2, r5\n\
	str r2, [sp, 0x8]\n\
	ldr r3, [sp, 0x10]\n\
	asrs r0, r3, 16\n\
	subs r1, r0\n\
	lsls r1, 16\n\
	mov r10, r1\n\
_080D4E68:\n\
	ldr r0, =gSpriteTemplate_83D9420\n\
	mov r2, r8\n\
	asrs r1, r2, 16\n\
	mov r3, r10\n\
	asrs r2, r3, 16\n\
	movs r3, 0x82\n\
	bl CreateSprite\n\
	lsls r0, 24\n\
	lsrs r2, r0, 24\n\
	ldr r1, =gSprites\n\
	lsls r0, r2, 4\n\
	adds r0, r2\n\
	lsls r0, 2\n\
	adds r4, r0, r1\n\
	movs r0, 0x14\n\
	strh r0, [r4, 0x2E]\n\
	mov r0, r9\n\
	strh r0, [r4, 0x30]\n\
	ldr r0, =gBattleAnimAttacker\n\
	ldrb r0, [r0]\n\
	bl GetBattlerSubpriority\n\
	subs r0, 0x1\n\
	adds r1, r4, 0\n\
	adds r1, 0x43\n\
	strb r0, [r1]\n\
	cmp r5, 0\n\
	ble _080D4EB8\n\
	mov r1, sp\n\
	ldrh r1, [r1, 0x8]\n\
	strh r1, [r4, 0x32]\n\
	b _080D4EBA\n\
	.align 2, 0\n\
	.pool\n\
_080D4EB8:\n\
	strh r7, [r4, 0x32]\n\
_080D4EBA:\n\
	lsls r0, r6, 16\n\
	movs r2, 0x80\n\
	lsls r2, 9\n\
	adds r0, r2\n\
	lsrs r6, r0, 16\n\
	cmp r0, 0\n\
	ble _080D4E68\n\
	add sp, 0x18\n\
	pop {r3-r5}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	mov r10, r5\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n");
}
#endif
