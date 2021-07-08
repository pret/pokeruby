#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimAttacker;
extern u8 gBattleAnimTarget;

void sub_80CDD74(struct Sprite* sprite);
void sub_80CDDDC(struct Sprite* sprite);
void sub_80CDE24(struct Sprite* sprite);
static void sub_80CDE78(struct Sprite* sprite);
static void sub_80CDEB0(struct Sprite* sprite);
static void sub_80CDEC0(struct Sprite* sprite);

// slash (a cutting animation)
// Used in Slash and False Swipe.

const union AnimCmd gSpriteAnim_83D6E14[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_FRAME(48, 4),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D6E28[] =
{
    ANIMCMD_FRAME(48, 4),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D6E30[] =
{
    gSpriteAnim_83D6E14,
    gSpriteAnim_83D6E28,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D6E38 =
{
    .tileTag = ANIM_TAG_SLASH,
    .paletteTag = ANIM_TAG_SLASH,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D6E30,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CDD74,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D6E50 =
{
    .tileTag = ANIM_TAG_SLASH_2,
    .paletteTag = ANIM_TAG_SLASH_2,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D6E30,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CDDDC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D6E68 =
{
    .tileTag = ANIM_TAG_SLASH_2,
    .paletteTag = ANIM_TAG_SLASH_2,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D6E30,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CDE24,
};

void sub_80CDD74(struct Sprite* sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2) + gBattleAnimArgs[1];
        sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, 3) + gBattleAnimArgs[2];
    }
    else
    {
        sprite->x = GetBattlerSpriteCoord(gBattleAnimTarget, 2) + gBattleAnimArgs[1];
        sprite->y = GetBattlerSpriteCoord(gBattleAnimTarget, 3) + gBattleAnimArgs[2];
    }

    sprite->data[0] = 0;
    sprite->data[1] = 0;
    StoreSpriteCallbackInData(sprite, sub_80CDEC0);
    sprite->callback = sub_8078600;
}

void sub_80CDDDC(struct Sprite* sprite)
{
    sprite->x = GetBattlerSpriteCoord(gBattleAnimTarget, 2) + 0xFFD0;
    sprite->y = GetBattlerSpriteCoord(gBattleAnimTarget, 3);
    StoreSpriteCallbackInData(sprite, sub_80CDE78);
    sprite->callback = sub_8078600;
}

void sub_80CDE24(struct Sprite* sprite)
{
    sprite->x = sprite->x = GetBattlerSpriteCoord(gBattleAnimTarget, 2) + 0xFFD0 + gBattleAnimArgs[0];
    sprite->y = GetBattlerSpriteCoord(gBattleAnimTarget, 3);
    StartSpriteAnim(sprite, 1);
    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->callback = sub_80CDEC0;
}

static void sub_80CDE78(struct Sprite* sprite)
{
    if (++sprite->data[0] > 8)
    {
        sprite->data[0] = 12;
        sprite->data[1] = 8;
        sprite->data[2] = 0;
        StoreSpriteCallbackInData(sprite, sub_80CDEB0);
        sprite->callback = TranslateSpriteOverDuration;
    }
}

static void sub_80CDEB0(struct Sprite* sprite)
{
    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->callback = sub_80CDEC0;
}

static void sub_80CDEC0(struct Sprite* sprite)
{
    if (++sprite->data[0] > 1)
    {
        sprite->data[0] = 0;
        sprite->invisible = !sprite->invisible;
        if (++sprite->data[1] > 8)
            DestroyAnimSprite(sprite);
    }
}
