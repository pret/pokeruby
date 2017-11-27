#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "palette.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

extern s8 gUnknown_083D6DDC[4][2];

static void sub_80CD408(struct Sprite* sprite);
static void sub_80CD4B8(struct Sprite* sprite);
static void sub_80CD4EC(struct Sprite* sprite);
static void sub_80CD5A8(struct Sprite* sprite);
static void sub_80CD654(struct Sprite* sprite);
static void sub_80CD67C(struct Sprite* sprite);

// scan
// Used by Lock-On.

void sub_80CD3E0(struct Sprite* sprite)
{
    sprite->pos1.x -= 32;
    sprite->pos1.y -= 32;
    sprite->data[0] = 20;
    sprite->callback = sub_80782D8;
    StoreSpriteCallbackInData(sprite, sub_80CD408);
}

void sub_80CD408(struct Sprite* sprite)
{
    switch (sprite->data[5] & 1)
    {
    case 0:
        sprite->data[0] = 1;
        sprite->callback = sub_80782D8;
        StoreSpriteCallbackInData(sprite, sub_80CD408);
        break;
    case 1:
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.y = 0;
        sprite->pos2.x = 0;
        sprite->data[0] = 8;
        sprite->data[2] = sprite->pos1.x + gUnknown_083D6DDC[sprite->data[5] >> 8][0];
        sprite->data[4] = sprite->pos1.y + gUnknown_083D6DDC[sprite->data[5] >> 8][1];
        sprite->callback = sub_8078B34;
        StoreSpriteCallbackInData(sprite, sub_80CD4B8);
        sprite->data[5] += 0x100;
        PlaySE12WithPanning(0xD2, sub_8076F98(0x3F));
        break;
    }

    sprite->data[5] ^= 1;
}

void sub_80CD4B8(struct Sprite* sprite)
{
    if ((sprite->data[5] >> 8) == 4)
    {
        sprite->data[0] = 10;
        sprite->callback = sub_80782D8;
        StoreSpriteCallbackInData(sprite, sub_80CD4EC);
    }
    else
    {
        sprite->callback = sub_80CD408;
    }
}

void sub_80CD4EC(struct Sprite* sprite)
{
    s16 a;
    s16 b;
    if (sprite->oam.affineParam == 0)
    {
        sprite->data[0] = 3;
        sprite->data[1] = 0;
        sprite->data[2] = 0;
        sprite->callback = sub_80782D8;
        StoreSpriteCallbackInData(sprite, sub_80CD5A8);
    }
    else
    {
        switch (sprite->oam.affineParam)
        {
        case 1:
            a = -8;
            b = -8;
            break;
        case 2:
            a = -8;
            b = 8;
            break;
        case 3:
            a = 8;
            b = -8;
            break;
        default:
            a = 8;
            b = 8;
            break;
        }

        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.y = 0;
        sprite->pos2.x = 0;
        sprite->data[0] = 6;
        sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 2) + a;
        sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 3) + b;
        sprite->callback = sub_8078B34;
        StoreSpriteCallbackInData(sprite, sub_80CD654);
    }
}

void sub_80CD5A8(struct Sprite* sprite)
{
    if (sprite->data[2] == 0)
    {
        if ((sprite->data[1] += 3) > 16)
            sprite->data[1] = 16;
    }
    else if ((sprite->data[1] -= 3) < 0)
    {
        sprite->data[1] = 0;
    }

    BlendPalettes(sub_80791A8(1, 1, 1, 1, 1, 0, 0), sprite->data[1], 0x7FFF);
    if (sprite->data[1] == 16)
    {
        int pal;
        sprite->data[2]++;
        pal = sprite->oam.paletteNum;
        LoadPalette(&gPlttBufferUnfaded[0x108 + pal * 16], pal * 16 | 0x101, 4);
        PlaySE12WithPanning(0xC0, sub_8076F98(0x3F));
    }
    else if (sprite->data[1] == 0)
    {
        sprite->callback = sub_80CD654;
    }
}

void sub_80CD654(struct Sprite* sprite)
{
    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
    {
        sprite->data[1] = 0;
        sprite->data[0] = 0;
        sprite->callback = sub_80CD67C;
    }
}

void sub_80CD67C(struct Sprite* sprite)
{
    if (sprite->data[0] % 3 == 0)
    {
        sprite->data[1]++;
        sprite->invisible ^= 1;
    }

    sprite->data[0]++;
    if (sprite->data[1] == 8)
        move_anim_8072740(sprite);
}

void sub_80CD6CC(struct Sprite* sprite)
{
    sprite->oam.affineParam = gBattleAnimArgs[0];
    if ((s16)sprite->oam.affineParam == 1)
    {
        sprite->pos1.x -= 0x18;
        sprite->pos1.y -= 0x18;
    }
    else if ((s16)sprite->oam.affineParam == 2)
    {
        sprite->pos1.x -= 0x18;
        sprite->pos1.y += 0x18;
        sprite->oam.matrixNum = 16;
    }
    else if ((s16)sprite->oam.affineParam == 3)
    {
        sprite->pos1.x += 0x18;
        sprite->pos1.y -= 0x18;
        sprite->oam.matrixNum = 8;
    }
    else
    {
        sprite->pos1.x += 0x18;
        sprite->pos1.y += 0x18;
        sprite->oam.matrixNum = 24;
    }

    sprite->oam.tileNum = (sprite->oam.tileNum + 16);
    sprite->callback = sub_80CD3E0;
    sub_80CD3E0(sprite);
}
