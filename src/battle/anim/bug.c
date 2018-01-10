#include "global.h"
#include "battle_anim.h"
#include "contest.h"
#include "rom_8077ABC.h"
#include "trig.h"
// #include "util.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

static void sub_80DCA38(struct Sprite *sprite);
static void sub_80DCAEC(struct Sprite *sprite);
static void sub_80DCB5C(struct Sprite *sprite);
static void sub_80DCBB4(struct Sprite *sprite);
void sub_80DCD78(struct Sprite *sprite);

// used in Move_MEGAHORN
void sub_80DC824(struct Sprite *sprite)
{
    if (IsContest())
    {
        StartSpriteAffineAnim(sprite, 2);
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
    }
    else if (!GetBankSide(gAnimBankTarget))
    {
        StartSpriteAffineAnim(sprite, 1);
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
    }

    sprite->pos1.x = sub_8077EE4(gAnimBankTarget, 2) + gBattleAnimArgs[0];
    sprite->pos1.y = sub_8077EE4(gAnimBankTarget, 3) + gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[4];

    sprite->data[2] = GetBankPosition(gAnimBankTarget, 2) + gBattleAnimArgs[2];
    sprite->data[4] = GetBankPosition(gAnimBankTarget, 3) + gBattleAnimArgs[3];
    
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

// used in Move_LEECH_LIFE
void sub_80DC8F4(struct Sprite *sprite)
{
    if (IsContest())
    {
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
        StartSpriteAffineAnim(sprite, 2);
    }
    else if (!GetBankSide(gAnimBankTarget))
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
    }

    sprite->pos1.x = sub_8077EE4(gAnimBankTarget, 2) + gBattleAnimArgs[0];
    sprite->pos1.y = sub_8077EE4(gAnimBankTarget, 3) + gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[2];

    sprite->data[2] = GetBankPosition(gAnimBankTarget, 2);
    sprite->data[4] = GetBankPosition(gAnimBankTarget, 3);
    
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

// used in 2 moves:
//         Move_STRING_SHOT, Move_SPIDER_WEB
void sub_80DC9A0(struct Sprite *sprite)
{
    if (IsContest())
        gBattleAnimArgs[2] /= 2;

    sub_80787B0(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[3] = sprite->pos1.y;

    if (!gBattleAnimArgs[4])
    {
        sprite->data[2] = GetBankPosition(gAnimBankTarget, 2);
        sprite->data[4] = GetBankPosition(gAnimBankTarget, 3);
    }
    else
    {
        sub_807A3FC(gAnimBankTarget, 1, &sprite->data[2], &sprite->data[4]);
    }

    sub_8078BD4(sprite);
    sprite->data[5] = gBattleAnimArgs[3];
    sprite->callback = sub_80DCA38;
}

static void sub_80DCA38(struct Sprite *sprite)
{
    if (sub_8078B5C(sprite))
    {
        DestroyAnimSprite(sprite);
        return;
    }

    sprite->pos2.x += Sin(sprite->data[6], sprite->data[5]);
    sprite->data[6] = (sprite->data[6] + 13) & 0xFF;
}

// used in Move_STRING_SHOT
void sub_80DCA70(struct Sprite *sprite)
{
    sub_807A3FC(gAnimBankTarget, 0, &sprite->pos1.x, &sprite->pos1.y);
    if (GetBankSide(gAnimBankAttacker))
        sprite->pos1.x -= gBattleAnimArgs[0];
    else
        sprite->pos1.x += gBattleAnimArgs[0];

    sprite->pos1.y += gBattleAnimArgs[1];
    if (!GetBankSide(gAnimBankTarget))
        sprite->pos1.y += 8;

    sprite->callback = sub_80DCAEC;
}

static void sub_80DCAEC(struct Sprite *sprite)
{
    if (++sprite->data[0] == 3)
    {
        sprite->data[0] = 0;
        sprite->invisible ^= 1;
    }

    if (++sprite->data[1] == 51)
    {
        DestroyAnimSprite(sprite);
    }
}

// used in Move_SPIDER_WEB
void sub_80DCB38(struct Sprite *sprite)
{
    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = 16;

    sprite->data[0] = 16;
    sprite->callback = sub_80DCB5C;
}

static void sub_80DCB5C(struct Sprite *sprite)
{
    if (sprite->data[2] < 20)
    {
        sprite->data[2]++;
    }
    else if (sprite->data[1]++ & 1)
    {
        sprite->data[0]--;
        REG_BLDALPHA = sprite->data[0] | ((16 - sprite->data[0]) << 8);

        if (sprite->data[0] == 0)
        {
            sprite->invisible = TRUE;
            sprite->callback = sub_80DCBB4;
        }
    }
}

static void sub_80DCBB4(struct Sprite *sprite)
{
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    DestroyAnimSprite(sprite);
}

// used in 3 moves:
//         Move_POISON_STING, Move_TWINEEDLE, Move_SPIKE_CANNON
void sub_80DCBCC(struct Sprite *sprite)
{
    s16 lVarX, lVarY;
    u16 rot;

    if (IsContest())
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }
    else
    {
        if (GetBankSide(gAnimBankAttacker))
        {
            gBattleAnimArgs[2] = -gBattleAnimArgs[2];
            gBattleAnimArgs[1] = -gBattleAnimArgs[1];
            gBattleAnimArgs[3] = -gBattleAnimArgs[3];
        }
    }

    if (!IsContest())
    {
        if (GetBankSide(gAnimBankAttacker) == GetBankSide(gAnimBankTarget))
        {
            if (GetBankIdentity(gAnimBankTarget) == 0 || GetBankIdentity(gAnimBankTarget) == 1)
            {
                s16 temp1, temp2;

                temp1 = gBattleAnimArgs[2];
                gBattleAnimArgs[2] = -temp1;

                temp2 = gBattleAnimArgs[0];
                gBattleAnimArgs[0] = -temp2;
            }
        }
    }

    sub_80787B0(sprite, 1);

    lVarX = GetBankPosition(gAnimBankTarget, 2) + gBattleAnimArgs[2];
    lVarY = GetBankPosition(gAnimBankTarget, 3) + gBattleAnimArgs[3];
    rot = sub_80790F0(lVarX - sprite->pos1.x, lVarY - sprite->pos1.y);
    rot += 0xC000;
    sub_8078FDC(sprite, FALSE, 0x100, 0x100, rot);

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = lVarX;
    sprite->data[4] = lVarY;

    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

// used in 2 moves:
//         Move_PIN_MISSILE, Move_ICICLE_SPEAR
void sub_80DCCFC(struct Sprite *sprite)
{
    sub_80787B0(sprite, 1);

    if (GetBankSide(gAnimBankAttacker))
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = GetBankPosition(gAnimBankTarget, 2) + gBattleAnimArgs[2];
    sprite->data[4] = GetBankPosition(gAnimBankTarget, 3) + gBattleAnimArgs[3];
    sprite->data[5] = gBattleAnimArgs[5];
    sub_80786EC(sprite);

    sprite->callback = sub_80DCD78;
    sprite->invisible = TRUE;
}

#ifdef NONMATCHING
void sub_80DCD78(struct Sprite *sprite)
{
    int i;
    s16 x1, x2, y1, y2;
    // s16 scale;
    // u16 *data;
    u16 tempData[8];
    s16 rot;

    sprite->invisible = FALSE;

    if (sub_8078718(sprite))
    {
        DestroyAnimSprite(sprite);
        return;
    }

    // data = &sprite->data[7];
    x1 = sprite->pos1.x;
    x2 = sprite->pos2.x;
    y1 = sprite->pos1.y;
    y2 = sprite->pos2.y;
    for (i = 0; i < 8; i++)
    {
        tempData[i] = sprite->data[i];
    }
    x2 += x1;
    y2 += y1;

    if (!sub_8078718(sprite))
    {
        rot = sub_80790F0(sprite->pos1.x + sprite->pos2.x - x2,
                        sprite->pos1.y + sprite->pos2.y - y2);
        rot += 0xC000;
        // scale = 0x100
        sub_8078FDC(sprite, FALSE, 0x100, 0x100, rot);

        for (i = 0; i < 8; i++)
        {
            sprite->data[i] = tempData[i];
        }
    }
}
#else
__attribute__((naked))
void sub_80DCD78(struct Sprite *sprite)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r8\n\
    push {r7}\n\
    sub sp, 0x14\n\
    adds r4, r0, 0\n\
    adds r2, r4, 0\n\
    adds r2, 0x3E\n\
    ldrb r0, [r2]\n\
    movs r1, 0x5\n\
    negs r1, r1\n\
    ands r1, r0\n\
    strb r1, [r2]\n\
    adds r0, r4, 0\n\
    bl sub_8078718\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _080DCDA4\n\
    adds r0, r4, 0\n\
    bl DestroyAnimSprite\n\
    b _080DCE34\n\
_080DCDA4:\n\
    movs r0, 0x2E\n\
    adds r0, r4\n\
    mov r8, r0\n\
    ldrh r7, [r4, 0x20]\n\
    ldrh r5, [r4, 0x24]\n\
    ldrh r1, [r4, 0x22]\n\
    mov r12, r1\n\
    ldrh r6, [r4, 0x26]\n\
    mov r2, r8\n\
    add r1, sp, 0x4\n\
    movs r3, 0x7\n\
_080DCDBA:\n\
    ldrh r0, [r2]\n\
    strh r0, [r1]\n\
    adds r2, 0x2\n\
    adds r1, 0x2\n\
    subs r3, 0x1\n\
    cmp r3, 0\n\
    bge _080DCDBA\n\
    adds r0, r7, r5\n\
    lsls r0, 16\n\
    lsrs r5, r0, 16\n\
    mov r2, r12\n\
    adds r0, r2, r6\n\
    lsls r0, 16\n\
    lsrs r6, r0, 16\n\
    adds r0, r4, 0\n\
    bl sub_8078718\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _080DCE34\n\
    ldrh r0, [r4, 0x24]\n\
    ldrh r1, [r4, 0x20]\n\
    adds r0, r1\n\
    lsls r1, r5, 16\n\
    asrs r1, 16\n\
    subs r0, r1\n\
    lsls r0, 16\n\
    asrs r0, 16\n\
    ldrh r1, [r4, 0x26]\n\
    ldrh r2, [r4, 0x22]\n\
    adds r1, r2\n\
    lsls r2, r6, 16\n\
    asrs r2, 16\n\
    subs r1, r2\n\
    lsls r1, 16\n\
    asrs r1, 16\n\
    bl sub_80790F0\n\
    lsls r0, 16\n\
    movs r1, 0xC0\n\
    lsls r1, 24\n\
    adds r0, r1\n\
    lsrs r0, 16\n\
    movs r3, 0x80\n\
    lsls r3, 1\n\
    str r0, [sp]\n\
    adds r0, r4, 0\n\
    movs r1, 0\n\
    adds r2, r3, 0\n\
    bl sub_8078FDC\n\
    add r2, sp, 0x4\n\
    mov r1, r8\n\
    movs r3, 0x7\n\
_080DCE26:\n\
    ldrh r0, [r2]\n\
    strh r0, [r1]\n\
    adds r2, 0x2\n\
    adds r1, 0x2\n\
    subs r3, 0x1\n\
    cmp r3, 0\n\
    bge _080DCE26\n\
_080DCE34:\n\
    add sp, 0x14\n\
    pop {r3}\n\
    mov r8, r3\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided\n");
}
#endif // NONMATCHING

void sub_80DCE40(struct Sprite *sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->pos1.x = GetBankPosition(gAnimBankAttacker, 2);
        sprite->pos1.y = GetBankPosition(gAnimBankAttacker, 3) + 18;
    }
    else
    {
        sprite->pos1.x = GetBankPosition(gAnimBankTarget, 2);
        sprite->pos1.y = GetBankPosition(gAnimBankTarget, 3) + 18;
    }

    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
    sprite->callback = sub_80785E4;
}
