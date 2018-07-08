#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "random.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80CFFD8(struct Sprite* sprite);
static void sub_80D0030(struct Sprite* sprite);
static void sub_80D00B4(struct Sprite* sprite);

// bullet (shoot seeds as ammunition.)
// Used by Bullet Seed.

const union AffineAnimCmd gSpriteAffineAnim_83D7614[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 20, 1),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D7624[] =
{
    gSpriteAffineAnim_83D7614,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7628 =
{
    .tileTag = 10006,
    .paletteTag = 10006,
    .oam = &gOamData_837DF8C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D7624,
    .callback = sub_80CFFD8,
};

void sub_80CFFD8(struct Sprite* sprite)
{
    InitAnimSpritePos(sprite, 1);
    sprite->data[0] = 20;
    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3);
    sprite->callback = StartAnimLinearTranslation;
    sprite->affineAnimPaused = 1;
    StoreSpriteCallbackInData(sprite, sub_80D0030);
}

static void sub_80D0030(struct Sprite* sprite)
{
    int i;
    u16 rand;
    s16* ptr;
    PlaySE12WithPanning(0xA6, BattleAnimAdjustPanning(0x3F));
    sprite->pos1.x += sprite->pos2.x;
    sprite->pos1.y += sprite->pos2.y;
    sprite->pos2.y = 0;
    sprite->pos2.x = 0;
    ptr = &sprite->data[7];
    for (i = 0; i < 8; i++)
    {
        ptr[i - 7] = 0;
    }

    rand = Random();
    sprite->data[6] = 0xFFF4 - (rand & 7);
    rand = Random();
    sprite->data[7] = (rand % 0xA0) + 0xA0;
    sprite->callback = sub_80D00B4;
    sprite->affineAnimPaused = 0;
}

static void sub_80D00B4(struct Sprite* sprite)
{
    sprite->data[0] += sprite->data[7];
    sprite->pos2.x = sprite->data[0] >> 8;
    if (sprite->data[7] & 1)
        sprite->pos2.x = -sprite->pos2.x;

    sprite->pos2.y = Sin(sprite->data[1], sprite->data[6]);
    sprite->data[1] += 8;
    if (sprite->data[1] > 0x7E)
    {
        sprite->data[1] = 0;
        sprite->data[2] /= 2;
        if (++sprite->data[3] == 1)
            DestroyAnimSprite(sprite);
    }
}
