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

void sub_80D59B0(struct Sprite *sprite)
{
    int var1;
    if (++sprite->data[0] > 2)
    {
        sprite->data[0] = 0;
        ++sprite->data[1];
        var1 = (u16)sprite->data[1] * (u16)sprite->data[1];
        sprite->data[3] += var1;
    }

    sprite->data[2] += sprite->data[4];
    sprite->pos1.x = sprite->data[2] >> 3;
    sprite->data[3] += sprite->data[5];
    sprite->pos1.y = sprite->data[3] >> 3;

    if (sprite->pos1.x < -8 || sprite->pos1.x > 0xf8 || sprite->pos1.y < -8 || sprite->pos1.y > 120)
        sprite->invisible = TRUE;
}

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
