#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80CEF9C(struct Sprite* sprite);
static void sub_80CF008(struct Sprite* sprite);

// thought (thought bubble)
// Used in Metronome and Taunt.

const union AnimCmd gSpriteAnim_83D71C0[] =
{
    ANIMCMD_FRAME(0, 2, .hFlip = TRUE),
    ANIMCMD_FRAME(16, 2, .hFlip = TRUE),
    ANIMCMD_FRAME(32, 2, .hFlip = TRUE),
    ANIMCMD_FRAME(48, 2, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D71D4[] =
{
    ANIMCMD_FRAME(48, 2, .hFlip = TRUE),
    ANIMCMD_FRAME(32, 2, .hFlip = TRUE),
    ANIMCMD_FRAME(16, 2, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 2, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D71E8[] =
{
    ANIMCMD_FRAME(0, 2),
    ANIMCMD_FRAME(16, 2),
    ANIMCMD_FRAME(32, 2),
    ANIMCMD_FRAME(48, 2),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D71FC[] =
{
    ANIMCMD_FRAME(48, 2),
    ANIMCMD_FRAME(32, 2),
    ANIMCMD_FRAME(16, 2),
    ANIMCMD_FRAME(0, 2),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D7210[] =
{
    gSpriteAnim_83D71C0,
    gSpriteAnim_83D71E8,
    gSpriteAnim_83D71D4,
    gSpriteAnim_83D71FC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7220 =
{
    .tileTag = 10209,
    .paletteTag = 10209,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D7210,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CEF9C,
};

void sub_80CEF44(u8 bank, struct Sprite* sprite)
{
    if (GetBattlerSide(bank) == 0)
        sprite->pos1.x = sub_807A100(bank, 5) + 8;
    else
        sprite->pos1.x = sub_807A100(bank, 4) - 8;

    sprite->pos1.y = GetBattlerSpriteCoord(bank, 3) - (s16)sub_807A100(bank, 0) / 4;
}

void sub_80CEF9C(struct Sprite* sprite)
{
    u8 a;
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gAnimBankAttacker;
    else
        bank = gAnimBankTarget;

    sub_80CEF44(bank, sprite);
    a = (GetBattlerSide(bank) == 0) ? 0 : 1;
    sprite->data[0] = gBattleAnimArgs[1];
    sprite->data[1] = a + 2;
    StartSpriteAnim(sprite, a);
    StoreSpriteCallbackInData(sprite, sub_80CF008);
    sprite->callback = sub_8078600;
}

static void sub_80CF008(struct Sprite* sprite)
{
    if (--sprite->data[0] == 0)
    {
        StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
        StartSpriteAnim(sprite, sprite->data[1]);
        sprite->callback = sub_8078600;
    }
}
