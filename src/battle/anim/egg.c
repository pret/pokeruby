#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

static void sub_80D13AC(struct Sprite* sprite);
static void sub_80D1424(struct Sprite* sprite);
static void sub_80D144C(struct Sprite* sprite);
static void sub_80D14C4(struct Sprite* sprite);
static void sub_80D1504(struct Sprite* sprite);
static void sub_80D154C(struct Sprite* sprite);
static void sub_80D158C(struct Sprite* sprite);

// egg (a hatching egg)
// Used in Softboiled.

void sub_80D1368(struct Sprite* sprite)
{
    s16 r1;
    InitAnimSpritePos(sprite, 0);
    r1 = (GetBattlerSide(gAnimBankAttacker)) ? -0xA0 : 0xA0;
    sprite->data[0] = 0x380;
    sprite->data[1] = r1;
    sprite->data[7] = gBattleAnimArgs[2];
    sprite->callback = sub_80D13AC;
}

void sub_80D13AC(struct Sprite* sprite)
{
    s16 add;
    sprite->pos2.y -= (sprite->data[0] >> 8);
    sprite->pos2.x = sprite->data[1] >> 8;
    sprite->data[0] -= 32;
    add = (GetBattlerSide(gAnimBankAttacker)) ? -0xA0 : 0xA0;
    sprite->data[1] += add;
    if (sprite->pos2.y > 0)
    {
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos2.y = 0;
        sprite->pos2.x = 0;
        sprite->data[0] = 0;
        StartSpriteAffineAnim(sprite, 1);
        sprite->callback = sub_80D1424;
    }
}

void sub_80D1424(struct Sprite* sprite)
{
    if (sprite->data[0]++ > 19)
    {
        StartSpriteAffineAnim(sprite, 2);
        sprite->callback = sub_80D144C;
    }
}

void sub_80D144C(struct Sprite* sprite)
{
    if (sprite->affineAnimEnded)
    {
        StartSpriteAffineAnim(sprite, 1);
        sprite->data[0] = 0;
        if (sprite->data[7] == 0)
        {
            sprite->oam.tileNum += 16;
            sprite->callback = sub_80D14C4;
        }
        else
        {
            sprite->oam.tileNum += 32;
            sprite->callback = sub_80D154C;
        }
    }
}

void sub_80D14C4(struct Sprite* sprite)
{
    sprite->pos2.y -= 2;
    if (++sprite->data[0] == 9)
    {
        sprite->data[0] = 16;
        sprite->data[1] = 0;
        REG_BLDCNT = 0x3F40;
        REG_BLDALPHA = sprite->data[0];
        sprite->callback = sub_80D1504;
    }
}

void sub_80D1504(struct Sprite* sprite)
{
    if (sprite->data[1]++ % 3 == 0)
    {
        sprite->data[0]--;
        REG_BLDALPHA = sprite->data[0] | ((16 - sprite->data[0]) << 8);
        if (sprite->data[0] == 0)
            sprite->callback = sub_80D154C;
    }
}

void sub_80D154C(struct Sprite* sprite)
{
    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
    {
        sprite->invisible = 1;
        if (sprite->data[7] == 0)
            sprite->callback = sub_80D158C;
        else
            sprite->callback = DestroyAnimSprite;
    }
}

void sub_80D158C(struct Sprite* sprite)
{
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    DestroyAnimSprite(sprite);
}
