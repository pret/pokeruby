#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"

extern s16 gBattleAnimArgs[8];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern u16 gBattleTypeFlags;

void sub_80D61C8(struct Sprite *sprite);
static void sub_80D6218(struct Sprite *);

// thunder (positions the lightning bolts)
// Used in Thunder, Thunder Punch, and Tri Attack.

const union AnimCmd gSpriteAnim_83D97B4[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_FRAME(16, 5),
    ANIMCMD_FRAME(32, 8),
    ANIMCMD_FRAME(48, 5),
    ANIMCMD_FRAME(64, 5),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D97CC[] =
{
    gSpriteAnim_83D97B4,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D97D0 =
{
    .tileTag = 10037,
    .paletteTag = 10037,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D97CC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D61C8,
};

void sub_80D61C8(struct Sprite *sprite)
{
    if (GetBattlerSide(gAnimBankAttacker) != 0)
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
    }
    else
    {
        sprite->pos1.x += gBattleAnimArgs[0];
    }

    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->callback = sub_80D6218;
}

static void sub_80D6218(struct Sprite *sprite)
{
    if (sprite->animEnded)
    {
        DestroyAnimSprite(sprite);
    }
}
