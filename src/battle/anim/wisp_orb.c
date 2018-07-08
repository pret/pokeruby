#include "global.h"
#include "battle_anim.h"
#include "constants/songs.h"
#include "rom_8077ABC.h"
#include "sound.h"
#include "trig.h"

extern s16 gBattleAnimArgs[8];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern u16 gBattleTypeFlags;
extern u8 gUnknown_0202F7D2;

void sub_80D5B0C(struct Sprite *sprite);
static void sub_80D5C5C(struct Sprite *);

// wisp_orb (animates the wisp orbs)
// Used in Will-O-Wisp

const union AnimCmd gSpriteAnim_83D9710[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_FRAME(4, 5),
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_FRAME(12, 5),
    ANIMCMD_JUMP(0),
};

const union AnimCmd gSpriteAnim_83D9724[] =
{
    ANIMCMD_FRAME(16, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D972C[] =
{
    ANIMCMD_FRAME(20, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D9734[] =
{
    ANIMCMD_FRAME(20, 5),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D973C[] =
{
    gSpriteAnim_83D9710,
    gSpriteAnim_83D9724,
    gSpriteAnim_83D972C,
    gSpriteAnim_83D9734,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D974C =
{
    .tileTag = 10231,
    .paletteTag = 10231,
    .oam = &gOamData_837DF2C,
    .anims = gSpriteAnimTable_83D973C,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D5B0C,
};

void sub_80D5B0C(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        InitAnimSpritePos(sprite, 0);
        StartSpriteAnim(sprite, gBattleAnimArgs[2]);
        sprite->data[7] = gBattleAnimArgs[2];

        if (GetBattlerSide(gAnimBankAttacker) != 0)
        {
            sprite->data[4] = 4;
        }
        else
        {
            sprite->data[4] = -4;
        }

        sprite->oam.priority = sub_8079ED4(gAnimBankTarget);
        sprite->data[0]++;
        break;
    case 1:
        sprite->data[1] += 192;
        if (GetBattlerSide(gAnimBankAttacker) != 0)
        {
            sprite->pos2.y = -(sprite->data[1] >> 8);
        }
        else
        {
            sprite->pos2.y = sprite->data[1] >> 8;
        }

        sprite->pos2.x = Sin(sprite->data[2], sprite->data[4]);
        sprite->data[2] = (sprite->data[2] + 4) & 0xFF;

        if (++sprite->data[3] == 1)
        {
            sprite->data[3] = 0;
            sprite->data[0]++;
        }
        break;
    case 2:
        sprite->pos2.x = Sin(sprite->data[2], sprite->data[4]);
        sprite->data[2] = (sprite->data[2] + 4) & 0xFF;
        
        if (++sprite->data[3] == 31)
        {
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->pos2.y = 0;
            sprite->pos2.x = 0;

            sprite->data[0] = 256;
            sprite->data[1] = sprite->pos1.x;
            sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
            sprite->data[3] = sprite->pos1.y;
            sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3);

            sub_8078BD4(sprite);
            sprite->callback = sub_80D5C5C;
        }
        break;
    }
}

static void sub_80D5C5C(struct Sprite *sprite)
{
    s16 initialData5;
    s16 newData5;

    if (!TranslateAnimLinear(sprite))
    {
        sprite->pos2.x += Sin(sprite->data[5], 16);
        initialData5 = sprite->data[5];
        sprite->data[5] = (sprite->data[5] + 4) & 0xFF;
        newData5 = sprite->data[5];

        if ((initialData5 == 0 || initialData5 > 196) && newData5 > 0 && sprite->data[7] == 0)
        {
            PlaySE12WithPanning(SE_W172, gUnknown_0202F7D2);
        }
    }
    else
    {
        DestroyAnimSprite(sprite);
    }
}
