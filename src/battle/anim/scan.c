#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "palette.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80CD3E0(struct Sprite* sprite);
void sub_80CD6CC(struct Sprite* sprite);
static void sub_80CD408(struct Sprite* sprite);
static void sub_80CD4B8(struct Sprite* sprite);
static void sub_80CD4EC(struct Sprite* sprite);
static void sub_80CD5A8(struct Sprite* sprite);
static void sub_80CD654(struct Sprite* sprite);
static void sub_80CD67C(struct Sprite* sprite);

// scan
// Used by Lock-On.

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D6DAC =
{
    .tileTag = 10014,
    .paletteTag = 10014,
    .oam = &gOamData_837DF34,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CD3E0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D6DC4 =
{
    .tileTag = 10014,
    .paletteTag = 10014,
    .oam = &gOamData_837DF2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CD6CC,
};

const s8 gUnknown_083D6DDC[][2] =
{
    { 64,  64},
    {  0, -64},
    {-64,  64},
    { 32, -32},
};

void sub_80CD3E0(struct Sprite* sprite)
{
    sprite->pos1.x -= 32;
    sprite->pos1.y -= 32;
    sprite->data[0] = 20;
    sprite->callback = WaitAnimForDuration;
    StoreSpriteCallbackInData(sprite, sub_80CD408);
}

static void sub_80CD408(struct Sprite* sprite)
{
    switch (sprite->data[5] & 1)
    {
    case 0:
        sprite->data[0] = 1;
        sprite->callback = WaitAnimForDuration;
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
        sprite->callback = StartAnimLinearTranslation;
        StoreSpriteCallbackInData(sprite, sub_80CD4B8);
        sprite->data[5] += 0x100;
        PlaySE12WithPanning(0xD2, BattleAnimAdjustPanning(0x3F));
        break;
    }

    sprite->data[5] ^= 1;
}

static void sub_80CD4B8(struct Sprite* sprite)
{
    if ((sprite->data[5] >> 8) == 4)
    {
        sprite->data[0] = 10;
        sprite->callback = WaitAnimForDuration;
        StoreSpriteCallbackInData(sprite, sub_80CD4EC);
    }
    else
    {
        sprite->callback = sub_80CD408;
    }
}

static void sub_80CD4EC(struct Sprite* sprite)
{
    s16 a;
    s16 b;
    if (sprite->oam.affineParam == 0)
    {
        sprite->data[0] = 3;
        sprite->data[1] = 0;
        sprite->data[2] = 0;
        sprite->callback = WaitAnimForDuration;
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
        sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2) + a;
        sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3) + b;
        sprite->callback = StartAnimLinearTranslation;
        StoreSpriteCallbackInData(sprite, sub_80CD654);
    }
}

static void sub_80CD5A8(struct Sprite* sprite)
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

    BlendPalettes(sub_80791A8(1, 1, 1, 1, 1, 0, 0), sprite->data[1], RGB(31, 31, 31));
    if (sprite->data[1] == 16)
    {
        int pal;
        sprite->data[2]++;
        pal = sprite->oam.paletteNum;
        LoadPalette(&gPlttBufferUnfaded[0x108 + pal * 16], pal * 16 | 0x101, 4);
        PlaySE12WithPanning(0xC0, BattleAnimAdjustPanning(0x3F));
    }
    else if (sprite->data[1] == 0)
    {
        sprite->callback = sub_80CD654;
    }
}

static void sub_80CD654(struct Sprite* sprite)
{
    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
    {
        sprite->data[1] = 0;
        sprite->data[0] = 0;
        sprite->callback = sub_80CD67C;
    }
}

static void sub_80CD67C(struct Sprite* sprite)
{
    if (sprite->data[0] % 3 == 0)
    {
        sprite->data[1]++;
        sprite->invisible ^= 1;
    }

    sprite->data[0]++;
    if (sprite->data[1] == 8)
        DestroyAnimSprite(sprite);
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
