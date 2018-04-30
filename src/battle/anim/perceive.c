#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80D2920(struct Sprite* sprite);

// perceive (shows a sparkle in a set of eyes, usually for heightened perception.)
// Used in Glare, Tickle, and Scary Face.

const union AnimCmd gSpriteAnim_83D7B78[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(4, 4),
    ANIMCMD_FRAME(8, 4),
    ANIMCMD_FRAME(4, 4),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D7B90[] =
{
    gSpriteAnim_83D7B78,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7B94 =
{
    .tileTag = 10218,
    .paletteTag = 10218,
    .oam = &gOamData_837DF2C,
    .anims = gSpriteAnimTable_83D7B90,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D2920,
};

static void sub_80D2904(struct Sprite* sprite)
{
    if (sprite->animEnded)
        DestroyAnimSprite(sprite);
}

void sub_80D2920(struct Sprite* sprite)
{
    InitAnimSpritePos(sprite, 1);
    sprite->callback = sub_80D2904;
}
