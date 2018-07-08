#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern const union AffineAnimCmd *const gSpriteAffineAnimTable_83DB1B0[];

void sub_80CF458(struct Sprite* sprite);
static void sub_80CF490(struct Sprite* sprite);
static void sub_80CF4B8(struct Sprite* sprite);

// unused_8

const struct SpriteTemplate gSpriteTemplate_83D73C4 =
{
    .tileTag = 10145,
    .paletteTag = 10145,
    .oam = &gOamData_837E0BC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DB1B0,
    .callback = sub_80CF458,
};

const union AnimCmd gSpriteAnim_83D73DC[] =
{
    ANIMCMD_FRAME(0, 9),
    ANIMCMD_FRAME(16, 3),
    ANIMCMD_FRAME(32, 3),
    ANIMCMD_FRAME(48, 3),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D73F0[] =
{
    gSpriteAnim_83D73DC,
};

const union AffineAnimCmd gSpriteAffineAnim_83D73F4[] =
{
    AFFINEANIMCMD_FRAME(0x50, 0x50, 0, 0),
    AFFINEANIMCMD_FRAME(0x9, 0x9, 0, 18),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D740C[] =
{
    gSpriteAffineAnim_83D73F4,
};

const struct SpriteTemplate gSpriteTemplate_83D7410 =
{
    .tileTag = 10007,
    .paletteTag = 10007,
    .oam = &gOamData_837DF94,
    .anims = gSpriteAnimTable_83D73F0,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D740C,
    .callback = sub_80793C4,
};

void sub_80CF458(struct Sprite* sprite)
{
    InitAnimSpritePos(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[5] = gBattleAnimArgs[4];
    sprite->callback = WaitAnimForDuration;
    StoreSpriteCallbackInData(sprite, sub_80CF490);
}

static void sub_80CF490(struct Sprite* sprite)
{
    sprite->data[0] = sprite->data[1];
    sprite->data[2] = sprite->pos1.x;
    sprite->data[4] = sprite->pos1.y + 15;
    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData(sprite, sub_80CF4B8);
}

static void sub_80CF4B8(struct Sprite* sprite)
{
    if (sprite->data[5] == 0)
        DestroyAnimSprite(sprite);
    else
        sprite->data[5]--;
}
