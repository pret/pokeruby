#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

extern void sub_80CEF44(u8 bank, struct Sprite* sprite);

void sub_80CF2D0(struct Sprite* sprite);
static void sub_80CF310(struct Sprite* sprite);

// unused_6

const union AnimCmd gSpriteAnim_83D7388[] =
{
    ANIMCMD_FRAME(4, 1),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D7390[] =
{
    gSpriteAnim_83D7388,
};

const struct SpriteTemplate gSpriteTemplate_83D7394 =
{
    .tileTag = 10072,
    .paletteTag = 10072,
    .oam = &gOamData_837DF2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CF2D0,
};

void sub_80CF2D0(struct Sprite* sprite)
{
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gAnimBankAttacker;
    else
        bank = gAnimBankTarget;

    sub_80CEF44(bank, sprite);
    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->callback = sub_80CF310;
}

static void sub_80CF310(struct Sprite* sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->pos2.y -= 3;
        if (++sprite->data[1] == 6)
            sprite->data[0]++;
        break;
    case 1:
        sprite->pos2.y += 3;
        if (--sprite->data[1] == 0)
            sprite->data[0]++;
        break;
    case 2:
        if (++sprite->data[1] == 0x40)
            DestroyAnimSprite(sprite);
        break;
    }
}
