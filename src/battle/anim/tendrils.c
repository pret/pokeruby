#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80CB25C(struct Sprite* sprite);
static void sub_80CB298(struct Sprite* sprite);
static void sub_80CB2D4(struct Sprite* sprite);

// tendrils
// Used by Constrict.

const union AnimCmd gSpriteAnim_83D6528[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_FRAME(64, 4),
    ANIMCMD_FRAME(96, 4),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D653C[] =
{
    ANIMCMD_FRAME(0,  4, .hFlip = TRUE),
    ANIMCMD_FRAME(32, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(64, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(96, 4, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D6550[] =
{
    gSpriteAnim_83D6528,
    gSpriteAnim_83D653C,
};

const union AffineAnimCmd gSpriteAffineAnim_83D6558[] = {
    AFFINEANIMCMD_FRAME(256, 256, 0, 0),
    AFFINEANIMCMD_FRAME(-11, 0, 0, 6),
    AFFINEANIMCMD_FRAME(11, 0, 0, 6),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83D6578[] = {
    AFFINEANIMCMD_FRAME(-256, 256, 0, 0),
    AFFINEANIMCMD_FRAME(11, 0, 0, 6),
    AFFINEANIMCMD_FRAME(-11, 0, 0, 6),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D6598[] = {
    gSpriteAffineAnim_83D6558,
    gSpriteAffineAnim_83D6578,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D65A0 =
{
    .tileTag = 10186,
    .paletteTag = 10186,
    .oam = &gOamData_837DFBC,
    .anims = gSpriteAnimTable_83D6550,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D6598,
    .callback = sub_80CB25C,
};

void sub_80CB25C(struct Sprite* sprite)
{
    sub_8078764(sprite, 0);
    sprite->affineAnimPaused = 1;
    StartSpriteAffineAnim(sprite, gBattleAnimArgs[2]);
    sprite->data[6] = gBattleAnimArgs[2];
    sprite->data[7] = gBattleAnimArgs[3];
    sprite->callback = sub_80CB298;
}

static void sub_80CB298(struct Sprite* sprite)
{
    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
    {
        sprite->affineAnimPaused = 0;
        GetAnimBattlerSpriteId(1);
        sprite->data[0] = 0x100;
        sprite->callback = sub_80CB2D4;
    }
}

static void sub_80CB2D4(struct Sprite* sprite)
{
    GetAnimBattlerSpriteId(1);
    if (!sprite->data[2])
    {
        sprite->data[0] += 11;
    }
    else
    {
        sprite->data[0] -= 11;
    }
    sprite->data[1]++;
    if (sprite->data[1] == 6)
    {
        sprite->data[1] = 0;
        sprite->data[2] ^= 1;
    }

    if (sprite->affineAnimEnded)
    {
        sprite->data[7]--;
        if (sprite->data[7] > 0)
        {
            StartSpriteAffineAnim(sprite, sprite->data[6]);
        }
        else
        {
            DestroyAnimSprite(sprite);
        }
    }
}