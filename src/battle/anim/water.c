#include "global.h"
#include "battle_anim.h"
#include "decompress.h"
#include "palette.h"
#include "random.h"
#include "rom_8077ABC.h"
#include "scanline_effect.h"
#include "trig.h"
#include "util.h"

asm(".include \"constants/gba_constants.inc\"");

extern s16 gBattleAnimArgs[];
extern u16 gBattlerPartyIndexes[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern u8 gAnimVisualTaskCount;
extern u16 gPlttBufferFaded[];
extern u16 gBattle_BG1_X;
extern u16 gBattle_BG1_Y;

extern const u8 *gUnknown_08E70968;
extern const u8 *gUnknown_08E70C38;
extern const u8 *gUnknown_08E70F0C;
extern const u8 gBattleAnimBackgroundImage_Surf;
extern const u8 gBattleAnimBackgroundPalette_Surf;
extern const u8 gBattleAnimBackgroundImageMuddyWater_Pal;

extern const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA318[];
extern const union AnimCmd *const gSpriteAnimTable_83D9BC8[];
extern const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB4D8;

void sub_80D37FC(struct Sprite *sprite);
void sub_80D3838(struct Sprite *sprite);
void sub_80D3874(struct Sprite *sprite);
void sub_80D4044(struct Sprite *sprite);
void sub_80D40A8(struct Sprite *sprite);
void sub_80D452C(struct Sprite *sprite);
void sub_80D47D0(struct Sprite *sprite);
void sub_80D487C(struct Sprite *sprite);
void sub_80D4B3C(struct Sprite *sprite);
void sub_80D4BA4(struct Sprite *sprite);
void sub_80D4BF0(struct Sprite *sprite);
void sub_80D4C18(struct Sprite *sprite);
void sub_80D4C64(struct Sprite *sprite);
void sub_80D4CEC(struct Sprite *sprite);
void sub_80D4AD0(struct Task *task);
void sub_80D3B60(u8 taskId);
void sub_80D3D68(u8 taskId);
void sub_80D4150(u8 taskId);
void sub_80D463C(u8 taskId);
void sub_80D4988(u8 taskId);
void sub_80E1864(u8 taskId);
void sub_80D4D64(struct Sprite *sprite, int a1, int y);
void sub_80D4418(struct Task *task, u8 taskId);
void sub_80D472C(struct Task *task, u8 taskId);
u8 sub_80D4394();

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

void sub_80D3874(struct Sprite *sprite)
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

void sub_80D38BC(u8 taskId)
{
    struct Struct_sub_8078914 subStruct;
    u32 r3;
    u8 *r2;
    u8 newTaskId;

    subStruct.field_c = 0;
    // r10 = taskId
    REG_BLDCNT = 0x3f42;
    REG_BLDALPHA = 0x1000;
    REG_BG1CNT_BITFIELD.priority = 1;
    REG_BG1CNT_BITFIELD.screenSize = 1;

    sub_8078914(&subStruct);
    r2 = subStruct.field_0;
    r3 = 0x2000;

    subStruct.field_c = 0;
    do {
        REG_DMA3SAD = (vu32)&subStruct + 16;
        REG_DMA3DAD = (vu32)r2;
        REG_DMA3CNT = 0x85000400;
        r2 += 0x1000;
        r3 -= 0x1000;
    } while (r3 > 0x1000);

    REG_DMA3SAD = (vu32)&subStruct + 16;
    REG_DMA3DAD = (vu32)r2;
    REG_DMA3CNT = 0x85004000;

    REG_DMA3SAD = (vu32)&subStruct + 16;
    REG_DMA3DAD = (vu32)subStruct.field_4;
    REG_DMA3CNT = 0x85000400;

    if (!IsContest())
    {
        REG_BG1CNT_BITFIELD.charBaseBlock = 1;

        if (GetBattlerSide(gAnimBankAttacker) == 1)
        {
            // 080D39AA
            LZDecompressVram(&gUnknown_08E70968, subStruct.field_4);
        }
        else
        {
            // 080D39A8
            LZDecompressVram(&gUnknown_08E70C38, subStruct.field_4);
        }
    }
    else
    {
        // 080D39B8
        LZDecompressVram(&gUnknown_08E70F0C, subStruct.field_4);
        sub_80763FC(subStruct.field_8, (u16 *)subStruct.field_4, 0, 1);

    }
    // 080D39CE
    LZDecompressVram(&gBattleAnimBackgroundImage_Surf, subStruct.field_0);

    if (!gBattleAnimArgs[0])
    {
        LoadCompressedPalette(&gBattleAnimBackgroundPalette_Surf, subStruct.field_8 << 4, 32);
    }
    else
    {
        // 080D3A00
        LoadCompressedPalette(&gBattleAnimBackgroundImageMuddyWater_Pal, subStruct.field_8 << 4, 32);
    }
    // 080D3A0E
    newTaskId = CreateTask(sub_80D3D68, gTasks[taskId].priority + 1);
    gTasks[taskId].data[15] = newTaskId;
    gTasks[newTaskId].data[0] = 0;
    gTasks[newTaskId].data[1] = 0x1000;
    gTasks[newTaskId].data[2] = 0x1000;

    if (IsContest())
    {
        gBattle_BG1_X = 65456;
        gBattle_BG1_Y = 65488;
        gTasks[taskId].data[0] = 2;
        gTasks[taskId].data[1] = 1;
        gTasks[newTaskId].data[3] = 0;
    }
    else
    {
        // 080D3A94
        if (GetBattlerSide(gAnimBankAttacker) == 1)
        {
            gBattle_BG1_X = 0xff20;
            gBattle_BG1_Y = 0x100;
            gTasks[taskId].data[0] = 2;
            gTasks[taskId].data[1] = 0xffff;
            gTasks[newTaskId].data[3] = 1;
        }
        else
        {
            // 080D3AD8
            gBattle_BG1_X = 0;
            gBattle_BG1_Y = 0xffd0;
            gTasks[taskId].data[0] = 0xfffe;
            gTasks[taskId].data[1] = 1;
            gTasks[newTaskId].data[3] = 0;
        }
    }
    // 080D3AEE
    REG_BG1HOFS = gBattle_BG1_X;
    REG_BG1VOFS = gBattle_BG1_Y;

    if (gTasks[newTaskId].data[3] == 0)
    {
        gTasks[newTaskId].data[4] = 0x30;
        gTasks[newTaskId].data[5] = 0x70;
    }
    else
    {
        // 080D3B34
        gTasks[newTaskId].data[4] = 0;
        gTasks[newTaskId].data[5] = 0;
    }
    // 080D3B38
    gTasks[taskId].data[6] = 1;
    gTasks[taskId].func = sub_80D3B60;
}

/*NAKED
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
}*/

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
	ldr r0, _080D3D44 @ =gTasks\n\
	lsls r4, r7, 2\n\
	adds r4, r7\n\
	lsls r4, 3\n\
	adds r4, r0\n\
	ldrh r0, [r4, 0x8]\n\
	ldr r1, _080D3D48 @ =gBattle_BG1_X\n\
	ldrh r1, [r1]\n\
	adds r0, r1\n\
	ldr r2, _080D3D48 @ =gBattle_BG1_X\n\
	strh r0, [r2]\n\
	ldrh r0, [r4, 0xA]\n\
	ldr r3, _080D3D4C @ =gBattle_BG1_Y\n\
	ldrh r3, [r3]\n\
	adds r0, r3\n\
	ldr r1, _080D3D4C @ =gBattle_BG1_Y\n\
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
	ldr r1, _080D3D50 @ =gPlttBufferFaded\n\
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
	ldr r1, _080D3D44 @ =gTasks\n\
	lsls r0, r7, 2\n\
	adds r0, r7\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	strh r2, [r0, 0x12]\n\
_080D3C02:\n\
	ldr r1, _080D3D44 @ =gTasks\n\
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
	ldr r1, _080D3D54 @ =0x040000d4\n\
	movs r4, 0x80\n\
	lsls r4, 5\n\
	mov r8, r6\n\
	ldr r0, _080D3D58 @ =0x85000400\n\
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
	ldr r0, _080D3D54 @ =0x040000d4\n\
	str r6, [r0]\n\
	str r1, [r0, 0x4]\n\
	ldr r1, _080D3D58 @ =0x85000400\n\
	str r1, [r0, 0x8]\n\
	ldr r0, [r0, 0x8]\n\
	bl IsContest\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	bne _080D3D02\n\
	ldr r2, _080D3D5C @ =REG_BG1CNT\n\
	ldrb r1, [r2]\n\
	movs r0, 0xD\n\
	negs r0, r0\n\
	ands r0, r1\n\
	strb r0, [r2]\n\
_080D3D02:\n\
	ldr r0, _080D3D48 @ =gBattle_BG1_X\n\
	strh r4, [r0]\n\
	ldr r1, _080D3D4C @ =gBattle_BG1_Y\n\
	strh r4, [r1]\n\
	ldr r0, _080D3D60 @ =REG_BLDCNT\n\
	strh r4, [r0]\n\
	adds r0, 0x2\n\
	strh r4, [r0]\n\
	ldr r2, _080D3D44 @ =gTasks\n\
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
	ldr r1, _080D3D64 @ =0x0000ffff\n\
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
_080D3D44: .4byte gTasks\n\
_080D3D48: .4byte gBattle_BG1_X\n\
_080D3D4C: .4byte gBattle_BG1_Y\n\
_080D3D50: .4byte gPlttBufferFaded\n\
_080D3D54: .4byte 0x040000d4\n\
_080D3D58: .4byte 0x85000400\n\
_080D3D5C: .4byte REG_BG1CNT\n\
_080D3D60: .4byte REG_BLDCNT\n\
_080D3D64: .4byte 0x0000ffff");
}

#ifdef NONMATCHING
void sub_80D3D68(u8 taskId)
{
    // Functionally equivalent - register swaps with the '& 0xffff's
    s16 i;
    struct ScanlineEffectParams scanlineParams;
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
        case 0:
            for (i = 0; i < task->data[4]; i++) {
                u16 bits;
                u16 *temp = &gScanlineEffectRegBuffers[0][i];
                gScanlineEffectRegBuffers[1][i] = task->data[2];
                bits = 0xffff;
                *temp = bits & task->data[2];
            };
            for (i = task->data[4]; i < task->data[5]; i++)
            {
                u16 bits;
                u16 *temp = &gScanlineEffectRegBuffers[0][i];
                gScanlineEffectRegBuffers[1][i] = task->data[1];
                bits = 0xffff;
                *temp = task->data[1] & bits;
            }
            for (i = task->data[5]; i <= 0x9f; i++)
            {
                u16 bits;
                u16 *temp = &gScanlineEffectRegBuffers[0][i];
                gScanlineEffectRegBuffers[1][i] = task->data[2];
                bits = 0xffff;
                *temp = bits & task->data[2];
            }
            if (!task->data[4])
            {
                u16 *temp = &gScanlineEffectRegBuffers[0][i];
                gScanlineEffectRegBuffers[1][i] = task->data[1];
                *temp = task->data[1];
            }
            else
            {
                u16 *temp = &gScanlineEffectRegBuffers[0][i];
                gScanlineEffectRegBuffers[1][i] = task->data[2];
                *temp = task->data[2];
            }
            scanlineParams.dmaDest = &REG_BLDALPHA;
            scanlineParams.dmaControl = 0xa2600001;
            scanlineParams.initState = 1;
            scanlineParams.unused9 = 0;
            ScanlineEffect_SetParams(scanlineParams);
            task->data[0]++;
            break;
        case 1:
            if (!task->data[3])
            {
                if (--task->data[4] <= 0)
                {
                    task->data[4] = 0;
                    task->data[0]++;
                }
            }
            else
            {
                if (++task->data[5] > 0x6f)
                {
                    task->data[0]++;
                }
            }
            for (i = 0; i < task->data[4]; i++)
            {
                gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][i] = task->data[2];
            }
            for (i = task->data[4]; i < task->data[5]; i++)
            {
                gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][i] = task->data[1];
            }
            for (i = task->data[5]; i <= 0x9f; i++)
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
            for (i = task->data[5]; i <= 0x9f; i++)
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
	ldr r1, _080D3D90 @ =gTasks\n\
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
_080D3D90: .4byte gTasks\n\
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
	ldr r1, _080D3E6C @ =gScanlineEffectRegBuffers\n\
	mov r12, r1\n\
	cmp r3, r0\n\
	bge _080D3DDA\n\
	mov r7, r12\n\
	movs r5, 0xF0\n\
	lsls r5, 3\n\
	add r5, r12\n\
	ldr r6, _080D3E70 @ =0x0000ffff\n\
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
	ldr r5, _080D3E6C @ =gScanlineEffectRegBuffers\n\
	movs r0, 0xF0\n\
	lsls r0, 3\n\
	adds r6, r5, r0\n\
	ldr r7, _080D3E70 @ =0x0000ffff\n\
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
	ldr r5, _080D3E6C @ =gScanlineEffectRegBuffers\n\
	movs r0, 0xF0\n\
	lsls r0, 3\n\
	adds r6, r5, r0\n\
	ldr r7, _080D3E70 @ =0x0000ffff\n\
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
_080D3E6C: .4byte gScanlineEffectRegBuffers\n\
_080D3E70: .4byte 0x0000ffff\n\
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
	ldr r0, _080D3EB4 @ =REG_BLDALPHA\n\
	str r0, [sp]\n\
	ldr r0, _080D3EB8 @ =0xa2600001\n\
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
_080D3EB4: .4byte REG_BLDALPHA\n\
_080D3EB8: .4byte 0xa2600001\n\
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
	ldr r6, _080D3F80 @ =gScanlineEffectRegBuffers\n\
	ldr r5, _080D3F84 @ =gScanlineEffect\n\
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
	ldr r6, _080D3F80 @ =gScanlineEffectRegBuffers\n\
	ldr r5, _080D3F84 @ =gScanlineEffect\n\
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
	ldr r6, _080D3F80 @ =gScanlineEffectRegBuffers\n\
	ldr r5, _080D3F84 @ =gScanlineEffect\n\
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
_080D3F80: .4byte gScanlineEffectRegBuffers\n\
_080D3F84: .4byte gScanlineEffect\n\
_080D3F88:\n\
	movs r3, 0\n\
	movs r1, 0x10\n\
	ldrsh r0, [r4, r1]\n\
	cmp r3, r0\n\
	bge _080D3FBC\n\
	ldr r6, _080D403C @ =gScanlineEffectRegBuffers\n\
	ldr r5, _080D4040 @ =gScanlineEffect\n\
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
	ldr r6, _080D403C @ =gScanlineEffectRegBuffers\n\
	ldr r5, _080D4040 @ =gScanlineEffect\n\
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
	ldr r6, _080D403C @ =gScanlineEffectRegBuffers\n\
	ldr r5, _080D4040 @ =gScanlineEffect\n\
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
_080D403C: .4byte gScanlineEffectRegBuffers\n\
_080D4040: .4byte gScanlineEffect\n");
}
#endif

void sub_80D4044(struct Sprite *sprite)
{
    s16 rand1, rand2;

    sprite->oam.tileNum += 8;
    sub_8078764(sprite, 1);

    rand1 = (Random() & 0xff) | 0x100;
    rand2 = Random() & 0x1ff;

    if (rand2 > 255)
    {
        rand2 = 256 - rand2;
    }

    sprite->data[1] = rand1;
    sprite->data[2] = rand2;

    sprite->callback = sub_80D40A8;
}

void sub_80D40A8(struct Sprite *sprite)
{
    sprite->data[3] += sprite->data[1];
    sprite->data[4] += sprite->data[2];

    if (sprite->data[1] & 1)
    {
        sprite->pos2.x = -(sprite->data[3] >> 8);
    }
    else
    {
        sprite->pos2.x = sprite->data[3] >> 8;
    }
    sprite->pos2.y = sprite->data[4] >> 8;

    if (++sprite->data[0] == 21)
    {
        DestroyAnimSprite(sprite);
    }
}

void sub_80D40F4(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    task->data[15] = GetAnimBattlerSpriteId(0);
    task->data[5] = gSprites[task->data[15]].pos1.y;
    task->data[1] = sub_80D4394();
    sub_8078E70(task->data[15], 0);
    task->func = sub_80D4150;
}

void sub_80D4150(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    u8 v1, v2, v3;

    switch (task->data[0])
    {
        case 0:
            sub_8079C08(task, task->data[15], 256, 256, 224, 512, 32);
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

            v1 = sub_8079C74(task);
            if (!v1)
            {
                sub_8079A64(task->data[15]);
                gSprites[task->data[15]].pos2.x = v1;
                task->data[3] = v1;
                task->data[4] = v1;
                task->data[0]++;
            }
            break;
        case 2:
            if (++task->data[3] > 4)
            {
                sub_8079C08(task, task->data[15], 224, 512, 384, 224, 8);
                task->data[3] = 0;
                task->data[0]++;
            }
            break;
        case 3:
            v2 = sub_8079C74(task);
            if (!v2)
            {
                task->data[3] = v2;
                task->data[4] = v2;
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
                {
                    gSprites[task->data[15]].pos2.y += 2;
                }
                else
                {
                    gSprites[task->data[15]].pos2.y -= 2;
                }

                if (task->data[4] == 10)
                {
                    sub_8079C08(task, task->data[15], 384, 224, 256, 256, 8);
                    task->data[3] = 0;
                    task->data[4] = 0;
                    task->data[0]++;
                }
            }
            break;
        case 6:
            gSprites[task->data[15]].pos1.y--;
            v3 = sub_8079C74(task);
            if (!v3)
            {
                sub_8078F40(task->data[15]);
                gSprites[task->data[15]].pos1.y = task->data[5];
                task->data[4] = v3;
                task->data[0]++;
            }
            break;
        case 7:
            if (!task->data[2])
            {
                DestroyAnimVisualTask(taskId);
            }
            break;
    }
}

u8 sub_80D4394()
{
    struct Pokemon *pokemon;
    u16 maxHp, hp, quarterHp;
    u8 i;

    if (!GetBattlerSide(gAnimBankAttacker))
    {
        pokemon = &gPlayerParty[gBattlerPartyIndexes[gAnimBankAttacker]];
    }
    else
    {
        pokemon = &gEnemyParty[gBattlerPartyIndexes[gAnimBankAttacker]];
    }
    maxHp = GetMonData(pokemon, MON_DATA_MAX_HP);
    hp = GetMonData(pokemon, MON_DATA_HP);
    quarterHp = maxHp / 4;
    for (i = 0; i < 3; i++)
    {
        if (hp < quarterHp * (i + 1))
        {
            return i;
        }
    }
    return 3;
}

#ifdef NONMATCHING
void sub_80D4418(struct Task *task, u8 taskId) {
    u8 x;
    u8 y;
    u16 index; // ??
    u8 priority;
    u16 r1;
    u16 i; // ??
    u16 x2, y2;
    int r8;
    u8 newSpriteId;
    int t;
    // r7 = task
    // [sp] = taskId

    x = GetBattlerSpriteCoord(gAnimBankAttacker, 2);//r8
    y = GetBattlerSpriteCoord(gAnimBankAttacker, 3);//r6
    index = 172;//r5
    priority = sub_8079E90(gAnimBankAttacker) - 1;//sp,8

    r1 = 4 - task->data[1];
    if ((s16)r1 <= 0) {
        r1 = 1;
    }

    i = 0;//sp,4
    x2 = x * 16;//sp,c
    y2 = y * 16;//sp,10
    r8 = (s16)r1;
    do
    {
        newSpriteId = CreateSprite(&gSpriteTemplate_83D9378, x, y, priority);//r2
        t = index << 16;
        if (newSpriteId != 64)
        {
            gSprites[newSpriteId].data[1] = i;
            gSprites[newSpriteId].data[2] = x2;
            gSprites[newSpriteId].data[3] = y2;
            // r4 = r6 >> 16 (s16)
            gSprites[newSpriteId].data[4] = Cos(index, 64);
            gSprites[newSpriteId].data[5] = Sin(index, 64);
            gSprites[newSpriteId].data[6] = taskId;
            gSprites[newSpriteId].data[7] = 2;
            if (task->data[2] & 1)
            {
                sub_80D452C(&gSprites[newSpriteId]);
            }
            ++task->data[2];
        }
        // 44ea
        index = ((r8 * 2) + (t >> 16)) & 0xff;
        i += r8;
    } while ((s16)i <= 19);
}
#else
NAKED
void sub_80D4418(struct Task *task, u8 taskId)
{
    asm_unified("push {r4-r7,lr}\n\
	mov r7, r10\n\
	mov r6, r9\n\
	mov r5, r8\n\
	push {r5-r7}\n\
	sub sp, 0x14\n\
	adds r7, r0, 0\n\
	lsls r1, 24\n\
	lsrs r1, 24\n\
	str r1, [sp]\n\
	ldr r4, _080D4520 @ =gAnimBankAttacker\n\
	ldrb r0, [r4]\n\
	movs r1, 0x2\n\
	bl GetBattlerSpriteCoord\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	mov r8, r0\n\
	ldrb r0, [r4]\n\
	movs r1, 0x3\n\
	bl GetBattlerSpriteCoord\n\
	lsls r0, 24\n\
	lsrs r6, r0, 24\n\
	movs r5, 0xAC\n\
	ldrb r0, [r4]\n\
	bl sub_8079E90\n\
	subs r0, 0x1\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	str r0, [sp, 0x8]\n\
	ldrh r1, [r7, 0xA]\n\
	movs r0, 0x4\n\
	subs r0, r1\n\
	lsls r0, 16\n\
	lsrs r1, r0, 16\n\
	cmp r0, 0\n\
	bgt _080D4468\n\
	movs r1, 0x1\n\
_080D4468:\n\
	movs r0, 0\n\
	str r0, [sp, 0x4]\n\
	lsls r0, r1, 16\n\
	mov r10, r8\n\
	mov r9, r6\n\
	mov r1, r10\n\
	lsls r1, 4\n\
	str r1, [sp, 0xC]\n\
	mov r1, r9\n\
	lsls r1, 4\n\
	str r1, [sp, 0x10]\n\
	asrs r0, 16\n\
	mov r8, r0\n\
_080D4482:\n\
	ldr r0, _080D4524 @ =gSpriteTemplate_83D9378\n\
	mov r1, r10\n\
	mov r2, r9\n\
	ldr r3, [sp, 0x8]\n\
	bl CreateSprite\n\
	lsls r0, 24\n\
	lsrs r2, r0, 24\n\
	lsls r6, r5, 16\n\
	cmp r2, 0x40\n\
	beq _080D44EA\n\
	ldr r1, _080D4528 @ =gSprites\n\
	lsls r0, r2, 4\n\
	adds r0, r2\n\
	lsls r0, 2\n\
	adds r5, r0, r1\n\
	mov r0, sp\n\
	ldrh r0, [r0, 0x4]\n\
	strh r0, [r5, 0x30]\n\
	mov r1, sp\n\
	ldrh r1, [r1, 0xC]\n\
	strh r1, [r5, 0x32]\n\
	mov r0, sp\n\
	ldrh r0, [r0, 0x10]\n\
	strh r0, [r5, 0x34]\n\
	asrs r4, r6, 16\n\
	adds r0, r4, 0\n\
	movs r1, 0x40\n\
	bl Cos\n\
	strh r0, [r5, 0x36]\n\
	adds r0, r4, 0\n\
	movs r1, 0x40\n\
	bl Sin\n\
	strh r0, [r5, 0x38]\n\
	mov r1, sp\n\
	ldrh r1, [r1]\n\
	strh r1, [r5, 0x3A]\n\
	movs r0, 0x2\n\
	strh r0, [r5, 0x3C]\n\
	ldrh r1, [r7, 0xC]\n\
	movs r0, 0x1\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080D44E4\n\
	adds r0, r5, 0\n\
	bl sub_80D452C\n\
_080D44E4:\n\
	ldrh r0, [r7, 0xC]\n\
	adds r0, 0x1\n\
	strh r0, [r7, 0xC]\n\
_080D44EA:\n\
	mov r1, r8\n\
	lsls r0, r1, 1\n\
	asrs r1, r6, 16\n\
	adds r1, r0\n\
	lsls r1, 16\n\
	movs r0, 0xFF\n\
	lsls r0, 16\n\
	ands r0, r1\n\
	lsrs r5, r0, 16\n\
	ldr r1, [sp, 0x4]\n\
	lsls r0, r1, 16\n\
	asrs r0, 16\n\
	add r0, r8\n\
	lsls r0, 16\n\
	lsrs r1, r0, 16\n\
	str r1, [sp, 0x4]\n\
	asrs r0, 16\n\
	cmp r0, 0x13\n\
	ble _080D4482\n\
	add sp, 0x14\n\
	pop {r3-r5}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	mov r10, r5\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080D4520: .4byte gAnimBankAttacker\n\
_080D4524: .4byte gSpriteTemplate_83D9378\n\
_080D4528: .4byte gSprites");
}
#endif

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
            if ((u16) (sprite->pos1.x + 8) > 256 || sprite->pos1.y < -8 || sprite->pos1.y > 120)
            {
                gTasks[sprite->data[6]].data[sprite->data[7]]--;
                DestroySprite(sprite);
            }
    }
}

void sub_80D45D8(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    task->data[1] = sub_80D4394();
    if (!GetBattlerSide(gAnimBankAttacker))
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

#ifdef NONMATCHING
void sub_80D463C(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0]) {
        case 0:
            // 080D4664
            if (++task->data[2] > 2)
            {
                task->data[2] = 0;
                sub_80D472C(task, taskId);
            }
            // 080d467a
            if (task->data[10] && !task->data[13]) {
                u8 newTaskId;

                gBattleAnimArgs[0] = 1;
                gBattleAnimArgs[1] = 0;
                gBattleAnimArgs[2] = 12;
                newTaskId = CreateTask(sub_80E1864, 80);
                if (newTaskId != 255)
                {
                    gTasks[newTaskId].func(newTaskId);
                    ++gAnimVisualTaskCount;
                }

                // 080d46c4
                gBattleAnimArgs[0] = 3;
                newTaskId = CreateTask(sub_80E1864, 80);
                if (newTaskId != 255)
                {
                    gTasks[newTaskId].func(newTaskId);
                    ++gAnimVisualTaskCount;
                }
                // 080d46f0
                task->data[13] = 1;
            }
            // 080d46f4
            if (task->data[11] >= task->data[12])
            {
                ++task->data[0];
            }
            break;
        case 1:
            //080D4714
            if (!task->data[9])
            {
                DestroyAnimVisualTask(taskId);
            }
    }
}
#else
NAKED
void sub_80D463C(u8 taskId)
{
    asm_unified("push {r4-r7,lr}\n\
	mov r7, r8\n\
	push {r7}\n\
	lsls r0, 24\n\
	lsrs r1, r0, 24\n\
	lsls r0, r1, 2\n\
	adds r0, r1\n\
	lsls r0, 3\n\
	ldr r7, _080D4660 @ =gTasks\n\
	adds r4, r0, r7\n\
	movs r0, 0x8\n\
	ldrsh r2, [r4, r0]\n\
	cmp r2, 0\n\
	beq _080D4664\n\
	cmp r2, 0x1\n\
	beq _080D4714\n\
	b _080D4722\n\
	.align 2, 0\n\
_080D4660: .4byte gTasks\n\
_080D4664:\n\
	ldrh r0, [r4, 0xC]\n\
	adds r0, 0x1\n\
	strh r0, [r4, 0xC]\n\
	lsls r0, 16\n\
	asrs r0, 16\n\
	cmp r0, 0x2\n\
	ble _080D467A\n\
	strh r2, [r4, 0xC]\n\
	adds r0, r4, 0\n\
	bl sub_80D472C\n\
_080D467A:\n\
	movs r1, 0x1C\n\
	ldrsh r0, [r4, r1]\n\
	cmp r0, 0\n\
	beq _080D46F4\n\
	movs r2, 0x22\n\
	ldrsh r0, [r4, r2]\n\
	cmp r0, 0\n\
	bne _080D46F4\n\
	ldr r5, _080D4708 @ =gBattleAnimArgs\n\
	movs r1, 0x1\n\
	mov r8, r1\n\
	mov r2, r8\n\
	strh r2, [r5]\n\
	strh r0, [r5, 0x2]\n\
	movs r0, 0xC\n\
	strh r0, [r5, 0x4]\n\
	ldr r6, _080D470C @ =sub_80E1864\n\
	adds r0, r6, 0\n\
	movs r1, 0x50\n\
	bl CreateTask\n\
	lsls r0, 24\n\
	lsrs r2, r0, 24\n\
	cmp r2, 0xFF\n\
	beq _080D46C4\n\
	lsls r0, r2, 2\n\
	adds r0, r2\n\
	lsls r0, 3\n\
	adds r0, r7\n\
	ldr r1, [r0]\n\
	adds r0, r2, 0\n\
	bl _call_via_r1\n\
	ldr r1, _080D4710 @ =gAnimVisualTaskCount\n\
	ldrb r0, [r1]\n\
	adds r0, 0x1\n\
	strb r0, [r1]\n\
_080D46C4:\n\
	movs r0, 0x3\n\
	strh r0, [r5]\n\
	adds r0, r6, 0\n\
	movs r1, 0x50\n\
	bl CreateTask\n\
	lsls r0, 24\n\
	lsrs r2, r0, 24\n\
	cmp r2, 0xFF\n\
	beq _080D46F0\n\
	lsls r0, r2, 2\n\
	adds r0, r2\n\
	lsls r0, 3\n\
	adds r0, r7\n\
	ldr r1, [r0]\n\
	adds r0, r2, 0\n\
	bl _call_via_r1\n\
	ldr r1, _080D4710 @ =gAnimVisualTaskCount\n\
	ldrb r0, [r1]\n\
	adds r0, 0x1\n\
	strb r0, [r1]\n\
_080D46F0:\n\
	mov r0, r8\n\
	strh r0, [r4, 0x22]\n\
_080D46F4:\n\
	movs r2, 0x1E\n\
	ldrsh r1, [r4, r2]\n\
	movs r2, 0x20\n\
	ldrsh r0, [r4, r2]\n\
	cmp r1, r0\n\
	blt _080D4722\n\
	ldrh r0, [r4, 0x8]\n\
	adds r0, 0x1\n\
	strh r0, [r4, 0x8]\n\
	b _080D4722\n\
	.align 2, 0\n\
_080D4708: .4byte gBattleAnimArgs\n\
_080D470C: .4byte sub_80E1864\n\
_080D4710: .4byte gAnimVisualTaskCount\n\
_080D4714:\n\
	movs r2, 0x1A\n\
	ldrsh r0, [r4, r2]\n\
	cmp r0, 0\n\
	bne _080D4722\n\
	adds r0, r1, 0\n\
	bl DestroyAnimVisualTask\n\
_080D4722:\n\
	pop {r3}\n\
	mov r8, r3\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0");
}
#endif

void sub_80D472C(struct Task *task, u8 taskId)
{
    u16 sinVal;
    u8 newSpriteId;

    sinVal = ((gSineTable[task->data[8]] + 3) >> 4) + task->data[6];
    newSpriteId = CreateSprite(&gSpriteTemplate_83D9378, task->data[7], 0, 0);
    if (newSpriteId != 64)
    {
        gSprites[newSpriteId].callback = sub_80D47D0;
        gSprites[newSpriteId].data[5] = sinVal;
        gSprites[newSpriteId].data[6] = taskId;
        gSprites[newSpriteId].data[7] = 9;
        task->data[9]++;
    }
    task->data[11]++;
    task->data[8] += 39;
    task->data[8] &= 0xff;
    task->data[7] = ((task->data[7] * 1103515245 + 12345) % task->data[5]) + task->data[4];
}

void sub_80D47D0(struct Sprite *sprite)
{
    if (!sprite->data[0])
    {
        sprite->pos1.y += 8;
        if (sprite->pos1.y >= sprite->data[5])
        {
            gTasks[sprite->data[6]].data[10] = 1;
            sprite->data[1] = CreateSprite(&gBattleAnimSpriteTemplate_83DB4D8, sprite->pos1.x, sprite->pos1.y, 1);

            if (sprite->data[1] != 64)
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

#ifdef NONMATCHING
void sub_80D48F4(u8 taskId)
{
    struct Task *task;
    u8 side;
    int t;

    task = &gTasks[taskId];
    task->data[3] = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    task->data[4] = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
    side = GetBattlerSide(gAnimBankAttacker);
    t = -1;
    if (!side)
    {
        t = 1;
    }
    task->data[7] = t;

    if (IsContest()) {
        task->data[7] *= -1;
    }

    task->data[5] = task->data[3] + task->data[7] * 8;
    task->data[6] = task->data[4] - task->data[7] * 8;
    task->data[9] = 0xffe0;
    task->data[0] = task->data[1] = 0;
    task->func = sub_80D4988;
}
#else
NAKED
void sub_80D48F4(u8 taskId)
{
    asm_unified("push {r4-r6,lr}\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	lsls r1, r0, 2\n\
	adds r1, r0\n\
	lsls r1, 3\n\
	ldr r0, _080D4978 @ =gTasks\n\
	adds r5, r1, r0\n\
	ldr r4, _080D497C @ =gAnimBankAttacker\n\
	ldrb r0, [r4]\n\
	movs r1, 0x2\n\
	bl GetBattlerSpriteCoord\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	movs r6, 0\n\
	strh r0, [r5, 0xE]\n\
	ldrb r0, [r4]\n\
	movs r1, 0x3\n\
	bl GetBattlerSpriteCoord\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	strh r0, [r5, 0x10]\n\
	ldrb r0, [r4]\n\
	bl GetBattlerSide\n\
	lsls r0, 24\n\
	movs r2, 0x1\n\
	negs r2, r2\n\
	adds r1, r2, 0\n\
	cmp r0, 0\n\
	bne _080D4938\n\
	movs r1, 0x1\n\
_080D4938:\n\
	strh r1, [r5, 0x16]\n\
	bl IsContest\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	beq _080D494C\n\
	movs r1, 0x16\n\
	ldrsh r0, [r5, r1]\n\
	negs r0, r0\n\
	strh r0, [r5, 0x16]\n\
_080D494C:\n\
	movs r2, 0x16\n\
	ldrsh r0, [r5, r2]\n\
	lsls r0, 3\n\
	ldrh r1, [r5, 0xE]\n\
	adds r0, r1\n\
	strh r0, [r5, 0x12]\n\
	movs r2, 0x16\n\
	ldrsh r1, [r5, r2]\n\
	lsls r1, 3\n\
	ldrh r0, [r5, 0x10]\n\
	subs r0, r1\n\
	strh r0, [r5, 0x14]\n\
	ldr r0, _080D4980 @ =0x0000ffe0\n\
	strh r0, [r5, 0x1A]\n\
	strh r6, [r5, 0xA]\n\
	strh r6, [r5, 0x8]\n\
	ldr r0, _080D4984 @ =sub_80D4988\n\
	str r0, [r5]\n\
	pop {r4-r6}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080D4978: .4byte gTasks\n\
_080D497C: .4byte gAnimBankAttacker\n\
_080D4980: .4byte 0x0000ffe0\n\
_080D4984: .4byte sub_80D4988");
}
#endif

void sub_80D4988(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
        case 0:
            sub_80D4AD0(task);
            if (task->data[10])
            {
                task->data[0]++;
            }
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
            if ((u16) (task->data[5] + 16) > 272)
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
            {
                task->data[0]++;
            }
            break;
        case 4:
            sub_80D4AD0(task);
            task->data[5] -= task->data[7] * 6;
            if ((u16) (task->data[5] + 16) > 272)
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
            {
                task->data[0] = 2;
            }
            break;
        case 6:
            if (!task->data[8])
            {
                task->data[0]++;
            }
            break;
        default:
            DestroyAnimVisualTask(taskId);
            break;
    }
}

void sub_80D4AD0(struct Task *task)
{
    if (++task->data[2] > 1)
    {
        u8 newSpriteId;
        task->data[2] = 0;
        newSpriteId = CreateSprite(&gSpriteTemplate_83D9378, task->data[3], task->data[4], 10);
        if (newSpriteId != 64)
        {
            gSprites[newSpriteId].data[0] = 16;
            gSprites[newSpriteId].data[2] = task->data[5];
            gSprites[newSpriteId].data[4] = task->data[6];
            gSprites[newSpriteId].data[5] = task->data[9];

            InitAnimArcTranslation(&gSprites[newSpriteId]);
            gSprites[newSpriteId].callback = sub_80D4B3C;
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
        sprite->data[2] = (Random() & 31) + 65520 + sprite->pos1.x;
        sprite->data[4] = (Random() & 31) + 65520 + sprite->pos1.y;
        sprite->data[5] = ~(Random() & 7);
        InitAnimArcTranslation(sprite);
        sprite->callback = sub_80D4BA4;
    }
}

void sub_80D4BA4(struct Sprite *sprite)
{
    if (TranslateAnimArc(sprite))
    {
        u16 i;
        for (i = 0; i < 16; i++)
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
    sprite->data[5] += sprite->data[1];
    sprite->data[5] &= 0xff;
    sprite->pos2.x = Sin(sprite->data[5], sprite->data[2]);
    if (--sprite->data[3] == 0)
    {
        DestroyAnimSprite(sprite);
    }
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
    InitAnimSpritePos(sprite, 1);
    sprite->data[1] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 3);
    sprite->data[3] = gBattleAnimArgs[2];
    sprite->data[4] = gBattleAnimArgs[3];
    sprite->callback = sub_80D4CEC;
}

void sub_80D4CEC(struct Sprite *sprite)
{
    int x = sprite->data[1] - sprite->pos1.x;
    int y = sprite->data[2] - sprite->pos1.y;

    sprite->pos2.x = sprite->data[0] * x / sprite->data[3];
    sprite->pos2.y = sprite->data[0] * y / sprite->data[3];

    if (++sprite->data[5] == sprite->data[4])
    {
        sprite->data[5] = 0;
        sub_80D4D64(sprite, x, y);
    }

    if (sprite->data[3] == sprite->data[0])
    {
        DestroyAnimSprite(sprite);
    }
    sprite->data[0]++;
}

#ifdef NONMATCHING
void sub_80D4D64(struct Sprite *sprite, int x, int y)
{
    s16 v1;
    s16 sumX, sumY;
    s16 rand1, rand2;
    int i;

    v1 = (sprite->data[0] + (sprite->data[0] >> 31)) << 15 >> 16; // sp
    sumX = sprite->pos1.x + sprite->pos2.x; // r8
    sumY = sprite->pos1.y + sprite->pos2.y; // r10

    rand1 =  y + (Random() % 10) - 5; // r9
    rand2 = -x + (Random() % 10) - 5; // r7

    i = 0;
    do
    {
        u8 spriteId = CreateSprite(&gSpriteTemplate_83D9420, sumX, sumY + v1, 0x82);
        gSprites[spriteId].data[0] = 20;
        gSprites[spriteId].data[1] = rand1;
        gSprites[spriteId].subpriority = sub_8079E90(gAnimBankAttacker) -1;

        if (rand2 < 0) {
            gSprites[spriteId].data[2] = -rand2;
        } else {
            gSprites[spriteId].data[2] = rand2;
        }
    } while (i++ <= 0);

    i = 0;
    do
    {
        u8 spriteId = CreateSprite(&gSpriteTemplate_83D9420, sumX, sumY - v1, 0x82);
        gSprites[spriteId].data[0] = 20;
        gSprites[spriteId].data[1] = rand1;
        gSprites[spriteId].subpriority = sub_8079E90(gAnimBankAttacker) -1;
        if (rand2 > 0)
        {
            gSprites[spriteId].data[2] = -rand2;
        }
        else
        {
            // 080D4EB8
            gSprites[spriteId].data[2] = rand2;
        }
    } while (i++ <= 0);
}
#else
NAKED
void sub_80D4D64(struct Sprite *sprite, int x, int y)
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
	ldr r0, _080D4E34 @ =gSpriteTemplate_83D9420\n\
	mov r2, r8\n\
	asrs r1, r2, 16\n\
	mov r3, r10\n\
	asrs r2, r3, 16\n\
	movs r3, 0x82\n\
	bl CreateSprite\n\
	lsls r0, 24\n\
	lsrs r2, r0, 24\n\
	ldr r1, _080D4E38 @ =gSprites\n\
	lsls r0, r2, 4\n\
	adds r0, r2\n\
	lsls r0, 2\n\
	adds r4, r0, r1\n\
	movs r0, 0x14\n\
	strh r0, [r4, 0x2E]\n\
	mov r0, r9\n\
	strh r0, [r4, 0x30]\n\
	ldr r0, _080D4E3C @ =gAnimBankAttacker\n\
	ldrb r0, [r0]\n\
	bl sub_8079E90\n\
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
_080D4E34: .4byte gSpriteTemplate_83D9420\n\
_080D4E38: .4byte gSprites\n\
_080D4E3C: .4byte gAnimBankAttacker\n\
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
	ldr r0, _080D4EAC @ =gSpriteTemplate_83D9420\n\
	mov r2, r8\n\
	asrs r1, r2, 16\n\
	mov r3, r10\n\
	asrs r2, r3, 16\n\
	movs r3, 0x82\n\
	bl CreateSprite\n\
	lsls r0, 24\n\
	lsrs r2, r0, 24\n\
	ldr r1, _080D4EB0 @ =gSprites\n\
	lsls r0, r2, 4\n\
	adds r0, r2\n\
	lsls r0, 2\n\
	adds r4, r0, r1\n\
	movs r0, 0x14\n\
	strh r0, [r4, 0x2E]\n\
	mov r0, r9\n\
	strh r0, [r4, 0x30]\n\
	ldr r0, _080D4EB4 @ =gAnimBankAttacker\n\
	ldrb r0, [r0]\n\
	bl sub_8079E90\n\
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
_080D4EAC: .4byte gSpriteTemplate_83D9420\n\
_080D4EB0: .4byte gSprites\n\
_080D4EB4: .4byte gAnimBankAttacker\n\
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
	bx r0");
}
#endif