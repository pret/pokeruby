#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "util.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

static void sub_80D3874(struct Sprite *);

void sub_80D37FC(struct Sprite *sprite)
{
    sub_8078764(sprite, 1);

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = sprite->pos1.x + gBattleAnimArgs[2];
    sprite->data[4] = sprite->pos1.y + gBattleAnimArgs[4];

    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
}

void sub_80D3838(struct Sprite *sprite)
{
    if (gBattleAnimArgs[3] != 0)
    {
        sub_8078764(sprite, 1);
    }
    else
    {
        sub_80787B0(sprite, 1);
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
        move_anim_8072740(sprite);
    }
}

__attribute__((naked))
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
    bl NotInBattle\n\
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
    ldr r0, _080D39A0 @ =gBattleAnimBankAttacker\n\
    ldrb r0, [r0]\n\
    bl GetBankSide\n\
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
_080D39A0: .4byte gBattleAnimBankAttacker\n\
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
    bl NotInBattle\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    cmp r4, 0\n\
    beq _080D3A94\n\
    ldr r3, _080D3A84 @ =0x0000ffb0\n\
    adds r0, r3, 0\n\
    ldr r1, _080D3A88 @ =gUnknown_030042C0\n\
    strh r0, [r1]\n\
    ldr r2, _080D3A8C @ =0x0000ffd0\n\
    adds r0, r2, 0\n\
    ldr r3, _080D3A90 @ =gUnknown_030041B4\n\
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
_080D3A88: .4byte gUnknown_030042C0\n\
_080D3A8C: .4byte 0x0000ffd0\n\
_080D3A90: .4byte gUnknown_030041B4\n\
_080D3A94:\n\
    ldr r0, _080D3AC4 @ =gBattleAnimBankAttacker\n\
    ldrb r0, [r0]\n\
    bl GetBankSide\n\
    lsls r0, 24\n\
    lsrs r1, r0, 24\n\
    cmp r1, 0x1\n\
    bne _080D3AD8\n\
    ldr r2, _080D3AC8 @ =0x0000ff20\n\
    adds r0, r2, 0\n\
    ldr r3, _080D3ACC @ =gUnknown_030042C0\n\
    strh r0, [r3]\n\
    movs r2, 0x80\n\
    lsls r2, 1\n\
    adds r0, r2, 0\n\
    ldr r3, _080D3AD0 @ =gUnknown_030041B4\n\
    strh r0, [r3]\n\
    movs r0, 0x2\n\
    strh r0, [r6, 0x8]\n\
    ldr r0, _080D3AD4 @ =0x0000ffff\n\
    strh r0, [r6, 0xA]\n\
    strh r1, [r7, 0xE]\n\
    b _080D3AEE\n\
    .align 2, 0\n\
_080D3AC4: .4byte gBattleAnimBankAttacker\n\
_080D3AC8: .4byte 0x0000ff20\n\
_080D3ACC: .4byte gUnknown_030042C0\n\
_080D3AD0: .4byte gUnknown_030041B4\n\
_080D3AD4: .4byte 0x0000ffff\n\
_080D3AD8:\n\
    ldr r0, _080D3B1C @ =gUnknown_030042C0\n\
    strh r4, [r0]\n\
    ldr r1, _080D3B20 @ =0x0000ffd0\n\
    adds r0, r1, 0\n\
    ldr r2, _080D3B24 @ =gUnknown_030041B4\n\
    strh r0, [r2]\n\
    ldr r0, _080D3B28 @ =0x0000fffe\n\
    strh r0, [r6, 0x8]\n\
    movs r0, 0x1\n\
    strh r0, [r6, 0xA]\n\
    strh r4, [r7, 0xE]\n\
_080D3AEE:\n\
    ldr r1, _080D3B2C @ =REG_BG1HOFS\n\
    ldr r3, _080D3B1C @ =gUnknown_030042C0\n\
    ldrh r0, [r3]\n\
    strh r0, [r1]\n\
    adds r1, 0x2\n\
    ldr r2, _080D3B24 @ =gUnknown_030041B4\n\
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
_080D3B1C: .4byte gUnknown_030042C0\n\
_080D3B20: .4byte 0x0000ffd0\n\
_080D3B24: .4byte gUnknown_030041B4\n\
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
