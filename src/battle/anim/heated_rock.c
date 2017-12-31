#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"

extern s16 gBattleAnimArgs[8];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern u16 gBattleTypeFlags;

void sub_80D59B0(struct Sprite *);
static void sub_80D5A74(struct Sprite *);

// heated_rock (moves heated rock sprites)
// Used in Eruption.

void sub_80D58FC(struct Sprite *sprite)
{
    sub_80D59B0(sprite);

    if (sprite->invisible)
    {
        gTasks[sprite->data[6]].data[sprite->data[7]]--;
        DestroySprite(sprite);
    }
}

u16 sub_80D5940(u8 spriteId)
{
    u16 var1 = gSprites[spriteId].pos1.y + gSprites[spriteId].pos2.y + gSprites[spriteId].centerToCornerVecY;

    if (GetBankSide(gAnimBankAttacker) == 0)
    {
        var1 = ((var1 << 16) + 0x4A0000) >> 16;
    }
    else
    {
        var1 = ((var1 << 16) + 0x2C0000) >> 16;
    }

    return var1;
}

void sub_80D5994(struct Sprite *sprite, s16 x, s16 y)
{
    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->data[2] = (u16)sprite->pos1.x * 8;
    sprite->data[3] = (u16)sprite->pos1.y * 8;
    sprite->data[4] = x * 8;
    sprite->data[5] = y * 8;
}

#ifdef NONMATCHING
void sub_80D59B0(struct Sprite *sprite)
{
    int var1;
    int var2;

    if (++sprite->data[0] > 2)
    {
        sprite->data[0] = 0;
        ++sprite->data[1];
        sprite->data[3] += ((u16)sprite->data[1] * (u16)sprite->data[1]);
    }

    var1 = (u16)sprite->data[4] + (u16)sprite->data[2];
    sprite->data[2] = var1;
    var1 = (s16)var1 >> 3;
    sprite->pos1.x = var1;

    var2 = (u16)sprite->data[5] + (u16)sprite->data[3];
    sprite->data[3] = var2;
    var2 = (s16)var2 >> 3;
    sprite->pos1.y = var2;

    if ((u32)((var1 + 8) << 16) > 0x1000000 || var2 < -8 || var2 > 120)
    {
        sprite->invisible = 1;
    }
}
#else
__attribute__((naked))
void sub_80D59B0(struct Sprite *sprite)
{
    asm(".syntax unified\n\
    push {lr}\n\
    adds r2, r0, 0\n\
    ldrh r0, [r2, 0x2E]\n\
    adds r0, 0x1\n\
    strh r0, [r2, 0x2E]\n\
    lsls r0, 16\n\
    asrs r0, 16\n\
    cmp r0, 0x2\n\
    ble _080D59DA\n\
    movs r0, 0\n\
    strh r0, [r2, 0x2E]\n\
    ldrh r0, [r2, 0x30]\n\
    adds r0, 0x1\n\
    strh r0, [r2, 0x30]\n\
    ldrh r0, [r2, 0x30]\n\
    adds r1, r0, 0\n\
    muls r1, r0\n\
    adds r0, r1, 0\n\
    ldrh r3, [r2, 0x34]\n\
    adds r0, r3\n\
    strh r0, [r2, 0x34]\n\
_080D59DA:\n\
    ldrh r0, [r2, 0x36]\n\
    ldrh r1, [r2, 0x32]\n\
    adds r0, r1\n\
    strh r0, [r2, 0x32]\n\
    lsls r0, 16\n\
    asrs r0, 19\n\
    strh r0, [r2, 0x20]\n\
    ldrh r1, [r2, 0x38]\n\
    ldrh r3, [r2, 0x34]\n\
    adds r1, r3\n\
    strh r1, [r2, 0x34]\n\
    lsls r1, 16\n\
    asrs r3, r1, 19\n\
    strh r3, [r2, 0x22]\n\
    adds r0, 0x8\n\
    lsls r0, 16\n\
    movs r1, 0x80\n\
    lsls r1, 17\n\
    cmp r0, r1\n\
    bhi _080D5A10\n\
    adds r1, r3, 0\n\
    movs r0, 0x8\n\
    negs r0, r0\n\
    cmp r1, r0\n\
    blt _080D5A10\n\
    cmp r1, 0x78\n\
    ble _080D5A1C\n\
_080D5A10:\n\
    adds r0, r2, 0\n\
    adds r0, 0x3E\n\
    ldrb r1, [r0]\n\
    movs r2, 0x4\n\
    orrs r1, r2\n\
    strb r1, [r0]\n\
_080D5A1C:\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided\n");
}
#endif // NONMATCHING

void sub_80D5A20(struct Sprite *sprite)
{
    sprite->pos1.x = gBattleAnimArgs[0];
    sprite->pos1.y = gBattleAnimArgs[1];

    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->data[2] = 0;
    sprite->data[6] = gBattleAnimArgs[2];
    sprite->data[7] = gBattleAnimArgs[3];

    sprite->oam.tileNum += gBattleAnimArgs[4] * 16;
    sprite->callback = sub_80D5A74;
}

static void sub_80D5A74(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        if (sprite->data[6] != 0)
        {
            sprite->data[6]--;
            return;
        }

        sprite->data[0]++;
        // fall through
    case 1:
        sprite->pos1.y += 8;
        if (sprite->pos1.y >= sprite->data[7])
        {
            sprite->pos1.y = sprite->data[7];
            sprite->data[0]++;
        }
        break;
    case 2:
        if (++sprite->data[1] > 1)
        {
            sprite->data[1] = 0;
            if ((++sprite->data[2] & 1) != 0)
            {
                sprite->pos2.y = -3;
            }
            else
            {
                sprite->pos2.y = 3;
            }
        }

        if (++sprite->data[3] > 16)
        {
            DestroyAnimSprite(sprite);
        }
        break;
    }
}
