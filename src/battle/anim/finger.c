#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

extern void sub_80CEF44(u8 bank, struct Sprite* sprite);

void sub_80CF040(struct Sprite* sprite);
void sub_80CF0BC(struct Sprite* sprite);
void sub_80CF1C8(struct Sprite* sprite);
static void sub_80CF088(struct Sprite* sprite);
static void sub_80CF138(struct Sprite* sprite);
static void sub_80CF158(struct Sprite* sprite);
static void sub_80CF228(struct Sprite* sprite);
static void sub_80CF264(struct Sprite* sprite);

// wave_finger
// Used by Metronome, Follow Me, and Taunt.

const union AffineAnimCmd gSpriteAffineAnim_83D7238[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x10, 0, 0),
    AFFINEANIMCMD_FRAME(0x1E, 0x1E, 0, 8),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83D7250[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 4, 11),
    AFFINEANIMCMD_FRAME(0x0, 0x0, -4, 11),
    AFFINEANIMCMD_LOOP(2),
    AFFINEANIMCMD_FRAME(0xFFE2, 0xFFE2, 0, 8),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83D7278[] =
{
    AFFINEANIMCMD_FRAME(16, 16, 0, 0),
    AFFINEANIMCMD_FRAME(30, 30, 0, 8),
    AFFINEANIMCMD_FRAME(0, 0, 0, 16),
    AFFINEANIMCMD_LOOP(0),
    AFFINEANIMCMD_FRAME(0, 0, 4, 11),
    AFFINEANIMCMD_FRAME(0, 0, -4, 11),
    AFFINEANIMCMD_LOOP(2),
    AFFINEANIMCMD_FRAME(-30, -30, 0, 8),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D72C0[] =
{
    gSpriteAffineAnim_83D7238,
    gSpriteAffineAnim_83D7250,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D72C8 =
{
    .tileTag = 10064,
    .paletteTag = 10064,
    .oam = &gOamData_837DFF4,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D72C0,
    .callback = sub_80CF040,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D72E0 =
{
    .tileTag = 10064,
    .paletteTag = 10064,
    .oam = &gOamData_837DF94,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D72C0,
    .callback = sub_80CF0BC,
};

const union AnimCmd gSpriteAnim_83D72F8[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D7300[] =
{
    ANIMCMD_FRAME(0, 1, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D7308[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D7328[] =
{
    ANIMCMD_FRAME(0, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(16, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(32, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(16, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(16, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(32, 4, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D7348[] =
{
    gSpriteAnim_83D72F8,
    gSpriteAnim_83D7300,
    gSpriteAnim_83D7308,
    gSpriteAnim_83D7328,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7358 =
{
    .tileTag = 10214,
    .paletteTag = 10214,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D7348,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CF1C8,
};

void sub_80CF040(struct Sprite* sprite)
{
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gAnimBankAttacker;
    else
        bank = gAnimBankTarget;

    sub_80CEF44(bank, sprite);
    sprite->data[0] = 0;
    StoreSpriteCallbackInData(sprite, sub_80CF088);
    sprite->callback = sub_80785E4;
}

static void sub_80CF088(struct Sprite* sprite)
{
    if (++sprite->data[0] > 16)
    {
        StartSpriteAffineAnim(sprite, 1);
        StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
        sprite->callback = sub_80785E4;
    }
}

void sub_80CF0BC(struct Sprite* sprite)
{
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gAnimBankAttacker;
    else
        bank = gAnimBankTarget;

    sprite->pos1.x = GetBattlerSpriteCoord(bank, 0);
    sprite->pos1.y = sub_807A100(bank, 2);
    if (sprite->pos1.y <= 9)
        sprite->pos1.y = 10;

    sprite->data[0] = 1;
    sprite->data[1] = 0;
    sprite->data[2] = sprite->subpriority;
    sprite->data[3] = sprite->subpriority + 4;
    sprite->data[4] = 0;
    StoreSpriteCallbackInData(sprite, sub_80CF138);
    sprite->callback = sub_80785E4;
}

static void sub_80CF138(struct Sprite* sprite)
{
    if (++sprite->data[4] > 12)
        sprite->callback = sub_80CF158;
}

static void sub_80CF158(struct Sprite* sprite)
{
    s16 temp;
    s16 temp2;
    sprite->data[1] += 4;
    if (sprite->data[1] > 0xFE)
    {
        if (--sprite->data[0] == 0)
        {
            sprite->pos2.x = 0;
            sprite->callback = sub_80CF088;
            return;
        }
        else
        {
            sprite->data[1] &= 0xFF;
        }
    }

    if (sprite->data[1] > 0x4F)
        sprite->subpriority = sprite->data[3];

    if (sprite->data[1] > 0x9F)
        sprite->subpriority = sprite->data[2];

    temp = gSineTable[sprite->data[1]];
    sprite->pos2.x = (temp2 = temp >> 3) + (temp2 >> 1);
}

void sub_80CF1C8(struct Sprite* sprite)
{
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gAnimBankAttacker;
    else
        bank = gAnimBankTarget;

    sub_80CEF44(bank, sprite);
    if (GetBattlerSide(bank) == 0)
    {
        StartSpriteAnim(sprite, 0);
        sprite->data[0] = 2;
    }
    else
    {
        StartSpriteAnim(sprite, 1);
        sprite->data[0] = 3;
    }

    sprite->callback = sub_80CF228;
}

static void sub_80CF228(struct Sprite* sprite)
{
    if (++sprite->data[1] > 10)
    {
        sprite->data[1] = 0;
        StartSpriteAnim(sprite, sprite->data[0]);
        StoreSpriteCallbackInData(sprite, sub_80CF264);
        sprite->callback = sub_8078600;
    }
}

static void sub_80CF264(struct Sprite* sprite)
{
    if (++sprite->data[1] > 5)
        DestroyAnimSprite(sprite);
}
