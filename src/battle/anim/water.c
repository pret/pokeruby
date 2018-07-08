#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "util.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

extern const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA318[];
extern const union AnimCmd *const gSpriteAnimTable_83D9BC8[];

void sub_80D37FC(struct Sprite *sprite);
void sub_80D3838(struct Sprite *sprite);
void sub_80D4044(struct Sprite *sprite);
void sub_80D452C(struct Sprite *sprite);
void sub_80D4BF0(struct Sprite *sprite);
void sub_80D4C64(struct Sprite *sprite);
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
    .tileTag = 10155,
    .paletteTag = 10155,
    .oam = &gOamData_837E04C,
    .anims = gSpriteAnimTable_83D9310,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80794A8,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9330 =
{
    .tileTag = 10155,
    .paletteTag = 10155,
    .oam = &gOamData_837E10C,
    .anims = gSpriteAnimTable_83D9314,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA318,
    .callback = sub_80D37FC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9348 =
{
    .tileTag = 10141,
    .paletteTag = 10141,
    .oam = &gOamData_837DF24,
    .anims = gSpriteAnimTable_83D9BC8,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D3838,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9360 =
{
    .tileTag = 10155,
    .paletteTag = 10155,
    .oam = &gOamData_837DF24,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D4044,
};

const struct SpriteTemplate gSpriteTemplate_83D9378 =
{
    .tileTag = 10268,
    .paletteTag = 10268,
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
    .tileTag = 10155,
    .paletteTag = 10155,
    .oam = &gOamData_837DF24,
    .anims = gSpriteAnimTable_83D93A8,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D4BF0,
};

const struct SpriteTemplate gSpriteTemplate_83D9420 =
{
    .tileTag = 10155,
    .paletteTag = 10155,
    .oam = &gOamData_837DF84,
    .anims = gSpriteAnimTable_83D93A8,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D93FC,
    .callback = sub_80D4C64,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9438 =
{
    .tileTag = 10155,
    .paletteTag = 10155,
    .oam = &gOamData_837DF8C,
    .anims = gSpriteAnimTable_83D93B0,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9404,
    .callback = sub_807A9BC,
};

void sub_80D37FC(struct Sprite *sprite)
{
    sub_8078764(sprite, 1);

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
        sub_8078764(sprite, 1);
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
void sub_80D38BC(u8 taskId)
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
    ldr r0, _080D39A0 @ =gAnimBankAttacker\n\
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
_080D39A0: .4byte gAnimBankAttacker\n\
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
    ldr r0, _080D3AC4 @ =gAnimBankAttacker\n\
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
_080D3AC4: .4byte gAnimBankAttacker\n\
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
