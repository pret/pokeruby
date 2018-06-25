#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"
#include "trig.h"

extern s16 gBattleAnimArgs[8];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

extern const union AnimCmd *const gSpriteAnimTable_83D70D8[];

void sub_80D2E68(struct Sprite *sprite);
void sub_80D2EC8(struct Sprite *sprite);
static void sub_80D2F80(struct Sprite *);
static void sub_80D2FA4(struct Sprite *);

// note_spin (spins music notes around, and rotates them)
// Used in Perish Song.

const union AffineAnimCmd gSpriteAffineAnim_83D7CE0[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 5),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83D7CF0[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, -8, 16),
    AFFINEANIMCMD_END_ALT(1),
};

const union AffineAnimCmd gSpriteAffineAnim_83D7D00[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 8, 16),
    AFFINEANIMCMD_END_ALT(1),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D7D10[] =
{
    gSpriteAffineAnim_83D7CE0,
    gSpriteAffineAnim_83D7CF0,
    gSpriteAffineAnim_83D7D00,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7D1C =
{
    .tileTag = 10206,
    .paletteTag = 10206,
    .oam = &gOamData_837DF8C,
    .anims = gSpriteAnimTable_83D70D8,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D7D10,
    .callback = sub_80D2EC8,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7D34 =
{
    .tileTag = 10206,
    .paletteTag = 10206,
    .oam = &gOamData_837DF8C,
    .anims = gSpriteAnimTable_83D70D8,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D7D10,
    .callback = sub_80D2E68,
};

void sub_80D2E68(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->data[1] = 120 - gBattleAnimArgs[0];
        sprite->invisible = 1;
    }

    if (++sprite->data[0] == sprite->data[1])
    {
        sub_8079108(sprite->oam.paletteNum + 16, 0);
    }

    if (sprite->data[0] == sprite->data[1] + 80)
    {
        DestroyAnimSprite(sprite);
    }
}

void sub_80D2EC8(struct Sprite *sprite)
{
    int index;
    int var2;

    if (sprite->data[0] == 0)
    {
        sprite->pos1.x = 120;
        sprite->pos1.y = (gBattleAnimArgs[0] + (((u16)gBattleAnimArgs[0]) >> 31)) / 2 - 15;

        StartSpriteAnim(sprite, gBattleAnimArgs[1]);

        sprite->data[5] = 120;
        sprite->data[3] = gBattleAnimArgs[2];
    }

    sprite->data[0]++;

    sprite->data[1] = (sprite->data[0] + ((u16)sprite->data[0] >> 31)) / 2;
    index = ((sprite->data[0] * 3) + (u16)sprite->data[3]);
    var2 = 0xFF;
    sprite->data[6] = (sprite->data[6] + 10) & 0xFF;

    index &= var2;
    sprite->pos2.x = Cos(index, 100);

    sprite->pos2.y = sprite->data[1] + Sin(index, 10) + Cos(sprite->data[6], 4);

    if (sprite->data[0] > sprite->data[5])
    {
        sprite->callback = sub_80D2F80;

        sprite->data[0] = 0;
        oamt_add_pos2_onto_pos1(sprite);
        sprite->data[2] = 5;
        sprite->data[4] = 0;
        sprite->data[3] = 0;

        StartSpriteAffineAnim(sprite, 1);
    }
}

static void sub_80D2F80(struct Sprite *sprite)
{
    if (++sprite->data[0] > 10)
    {
        sprite->data[0] = 0;
        sprite->callback = sub_80D2FA4;
    }
}

static void sub_80D2FA4(struct Sprite *sprite)
{
    sprite->data[3] += sprite->data[2];
    sprite->pos2.y = sprite->data[3];

    sprite->data[2]++;

    if (sprite->data[3] > 48 && sprite->data[2] > 0)
    {
        sprite->data[2] = sprite->data[4] - 5;
        sprite->data[4]++;
    }

    if (sprite->data[4] > 3)
    {
        int var1 = sprite->data[2];
        sprite->invisible = var1 - (((s32)(var1 + ((u32)var1 >> 31)) >> 1) << 1);
        DestroyAnimSprite(sprite);
    }

    if (sprite->data[4] == 4)
    {
        DestroyAnimSprite(sprite);
    }
}
