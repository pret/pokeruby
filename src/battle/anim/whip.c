#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80CC82C(struct Sprite* sprite);
void sub_80CC884(struct Sprite* sprite);

// whip (does a hitting animation that uses a rotating sprite to invoke the sprite getting hit.)
// Used by Slam and Vine Whip.

const union AnimCmd gSpriteAnim_83D69AC[] =
{
    ANIMCMD_FRAME(64, 3),
    ANIMCMD_FRAME(80, 3),
    ANIMCMD_FRAME(96, 3),
    ANIMCMD_FRAME(112, 6),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D69C0[] =
{
    ANIMCMD_FRAME(64, 3, .hFlip = TRUE),
    ANIMCMD_FRAME(80, 3, .hFlip = TRUE),
    ANIMCMD_FRAME(96, 3, .hFlip = TRUE),
    ANIMCMD_FRAME(112, 6, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D69D4[] =
{
    gSpriteAnim_83D69AC,
    gSpriteAnim_83D69C0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D69DC =
{
    .tileTag = 10056,
    .paletteTag = 10056,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D69D4,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CC884,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D69F4 =
{
    .tileTag = 10287,
    .paletteTag = 10287,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D69D4,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CC884,
};

const union AnimCmd gSpriteAnim_83D6A0C[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_FRAME(48, 4),
    ANIMCMD_FRAME(64, 5),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D6A24[] =
{
    gSpriteAnim_83D6A0C,
};

const struct SpriteTemplate gSpriteTemplate_83D6A28 =
{
    .tileTag = 10021,
    .paletteTag = 10021,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D6A24,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CC82C,
};

const struct SpriteTemplate gSpriteTemplate_83D6A40 =
{
    .tileTag = 10022,
    .paletteTag = 10022,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D6A24,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CC82C,
};

static void sub_80CC810(struct Sprite* sprite)
{
    if (sprite->animEnded)
        DestroyAnimSprite(sprite);
}

void sub_80CC82C(struct Sprite* sprite)
{
    if (GetBattlerSide(gAnimBankAttacker) != 0)
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
    }
    else
    {
        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
    }

    sprite->callback = sub_8078600;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

void sub_80CC884(struct Sprite* sprite)
{
    if (GetBattlerSide(gAnimBankAttacker) == 0)
        StartSpriteAnim(sprite, 1);

    sprite->callback = sub_80CC810;
    sub_807867C(sprite, gBattleAnimArgs[0]);
    sprite->pos1.y += gBattleAnimArgs[1];
}
