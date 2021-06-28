#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimAttacker;
extern u8 gBattleAnimTarget;

void sub_80CD274(struct Sprite* sprite);
static void sub_80CD2D4(struct Sprite* sprite);

// unused_3 (seems to be some sort of popping effect with a growing diamond shape)

const union AnimCmd gSpriteAnim_83D6CB8[] =
{
    ANIMCMD_FRAME(0, 10),
    ANIMCMD_FRAME(4, 10),
    ANIMCMD_FRAME(8, 10),
    ANIMCMD_FRAME(12, 10),
    ANIMCMD_FRAME(16, 26),
    ANIMCMD_FRAME(16, 5),
    ANIMCMD_FRAME(20, 5),
    ANIMCMD_FRAME(24, 15),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D6CDC[] =
{
    ANIMCMD_FRAME(0, 10, .hFlip = TRUE),
    ANIMCMD_FRAME(4, 10, .hFlip = TRUE),
    ANIMCMD_FRAME(8, 10, .hFlip = TRUE),
    ANIMCMD_FRAME(12, 10, .hFlip = TRUE),
    ANIMCMD_FRAME(16, 26, .hFlip = TRUE),
    ANIMCMD_FRAME(16, 5, .hFlip = TRUE),
    ANIMCMD_FRAME(20, 5, .hFlip = TRUE),
    ANIMCMD_FRAME(24, 15, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D6D00[] =
{
    gSpriteAnim_83D6CB8,
    gSpriteAnim_83D6CDC,
};

const struct SpriteTemplate gSpriteTemplate_83D6D08 =
{
    .tileTag = ANIM_TAG_UNUSED_BUBBLE_BURST,
    .paletteTag = ANIM_TAG_UNUSED_BUBBLE_BURST,
    .oam = &gOamData_837DF2C,
    .anims = gSpriteAnimTable_83D6D00,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CD274,
};

void sub_80CD274(struct Sprite* sprite)
{
    sub_8078650(sprite);
    if (GetBattlerSide(gBattleAnimAttacker) == 0)
    {
        sprite->x += gBattleAnimArgs[0];
        sprite->y += gBattleAnimArgs[1];
    }
    else
    {
        sprite->x -= gBattleAnimArgs[0];
        sprite->y += gBattleAnimArgs[1];
        StartSpriteAnim(sprite, 1);
    }

    sprite->callback = sub_80CD2D4;
}

static void sub_80CD2D4(struct Sprite* sprite)
{
    if (++sprite->data[0] > 30)
    {
        sprite->y2 = (30 - sprite->data[0]) / 3;
        sprite->x2 = Sin(sprite->data[1] * 4, 3);
        sprite->data[1]++;
    }

    if (sprite->animEnded)
        DestroyAnimSprite(sprite);
}
