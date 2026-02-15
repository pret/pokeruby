#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

extern s16 gBattleAnimArgs[8];
extern u8 gBattleAnimAttacker;
extern u8 gBattleAnimTarget;
extern const union AffineAnimCmd *const gSpriteAffineAnimTable_83D752C[];

void sub_80D3554(struct Sprite *sprite);
void sub_80D3698(struct Sprite *sprite);
void sub_80D3728(struct Sprite *sprite);
static void sub_80D35DC(struct Sprite *);
static void sub_80D365C(u8);
static void sub_80D370C(struct Sprite *);

// energy_wave (animates steady "waves" of energy)
// Used in Hydro Pump, Mud Shot, Signal Beam, Flamethrower, Psywave, and
// Hydro Cannon.

const union AnimCmd gSpriteAnim_83D91DC[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_FRAME(4, 1),
    ANIMCMD_FRAME(8, 1),
    ANIMCMD_FRAME(12, 1),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_83D91F0[] =
{
    gSpriteAnim_83D91DC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D91F4 =
{
    .tileTag = ANIM_TAG_WATER_ORB,
    .paletteTag = ANIM_TAG_WATER_ORB,
    .oam = &gOamData_837E04C,
    .anims = gSpriteAnimTable_83D91F0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D3554,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D920C =
{
    .tileTag = ANIM_TAG_BROWN_ORB,
    .paletteTag = ANIM_TAG_BROWN_ORB,
    .oam = &gOamData_837E04C,
    .anims = gSpriteAnimTable_83D91F0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D3554,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9224 =
{
    .tileTag = ANIM_TAG_GLOWY_RED_ORB,
    .paletteTag = ANIM_TAG_GLOWY_RED_ORB,
    .oam = &gOamData_837DF24,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D3554,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D923C =
{
    .tileTag = ANIM_TAG_GLOWY_GREEN_ORB,
    .paletteTag = ANIM_TAG_GLOWY_GREEN_ORB,
    .oam = &gOamData_837DF24,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D3554,
};

const union AnimCmd gSpriteAnim_83D9254[] =
{
    ANIMCMD_FRAME(16, 2),
    ANIMCMD_FRAME(32, 2),
    ANIMCMD_FRAME(48, 2),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_83D9264[] =
{
    gSpriteAnim_83D9254,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9268 =
{
    .tileTag = ANIM_TAG_SMALL_EMBER,
    .paletteTag = ANIM_TAG_SMALL_EMBER,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D9264,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D3554,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9280 =
{
    .tileTag = ANIM_TAG_BLUE_RING,
    .paletteTag = ANIM_TAG_BLUE_RING,
    .oam = &gOamData_837E034,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D752C,
    .callback = sub_80D3554,
};

const union AffineAnimCmd gSpriteAffineAnim_83D9298[] =
{
    AFFINEANIMCMD_FRAME(0x3, 0x3, 10, 50),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 10),
    AFFINEANIMCMD_FRAME(0xFFEC, 0xFFEC, -10, 20),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83D92B8[] =
{
    AFFINEANIMCMD_FRAME(0x150, 0x150, 0, 0),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D92C8[] =
{
    gSpriteAffineAnim_83D9298,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D92CC[] =
{
    gSpriteAffineAnim_83D92B8,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D92D0 =
{
    .tileTag = ANIM_TAG_WATER_ORB,
    .paletteTag = ANIM_TAG_WATER_ORB,
    .oam = &gOamData_837E10C,
    .anims = gSpriteAnimTable_83D91F0,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D92C8,
    .callback = sub_80D3698,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D92E8 =
{
    .tileTag = ANIM_TAG_WATER_ORB,
    .paletteTag = ANIM_TAG_WATER_ORB,
    .oam = &gOamData_837E10C,
    .anims = gSpriteAnimTable_83D91F0,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D92CC,
    .callback = sub_80D3728,
};

void sub_80D3554(struct Sprite *sprite)
{
    InitAnimSpritePos(sprite, 1);

    sprite->data[0] = 30;
    sprite->data[1] = sprite->x;
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, 2);
    sprite->data[3] = sprite->y;
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, 3);

    InitAnimLinearTranslation(sprite);

    sprite->data[5] = 0xD200 / sprite->data[0];
    sprite->data[7] = gBattleAnimArgs[3];

    if (gBattleAnimArgs[7] > 127)
    {
        sprite->data[6] = (gBattleAnimArgs[7] - 127) << 8;
        sprite->data[7] = -sprite->data[7];
    }
    else
    {
        sprite->data[6] = gBattleAnimArgs[7] << 8;
    }

    sprite->callback = sub_80D35DC;
    sprite->callback(sprite);
}

static void sub_80D35DC(struct Sprite *sprite)
{
    if (TranslateAnimLinear(sprite))
    {
        DestroyAnimSprite(sprite);
    }

    sprite->y2 += Sin(sprite->data[6] >> 8, sprite->data[7]);
    if (((sprite->data[6] + sprite->data[5]) >> 8) > 127)
    {
        sprite->data[6] = 0;
        sprite->data[7] = -sprite->data[7];
    }
    else
    {
        sprite->data[6] += sprite->data[5];
    }
}

void sub_80D3630(u8 taskId)
{
    gTasks[taskId].data[0] = gBattleAnimArgs[0];
    gBattleAnimArgs[7] = 0;
    gTasks[taskId].func = sub_80D365C;
}

static void sub_80D365C(u8 taskId)
{
    gBattleAnimArgs[7] = (gBattleAnimArgs[7] + 3) & 0xFF;
    if (--gTasks[taskId].data[0] == 0)
    {
        DestroyAnimVisualTask(taskId);
    }
}

void sub_80D3698(struct Sprite *sprite)
{
    u8 subpriority;

    sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, 0);
    sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, 1);
    sprite->y2 = -10;

    subpriority = GetBattlerSpriteSubpriority(gBattleAnimAttacker);

    if (!IsContest())
    {
        if (GetBattlerSide(gBattleAnimAttacker) == 0)
        {
            sprite->x2 = 10;
            sprite->subpriority = subpriority + 2;
        }
        else
        {
            sprite->x2 = -10;
            sprite->subpriority = subpriority - 2;
        }
    }
    else
    {
        sprite->x2 = -10;
        sprite->subpriority = subpriority + 2;
    }

    sprite->callback = sub_80D370C;
}

static void sub_80D370C(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
    {
        DestroyAnimSprite(sprite);
    }
}

void sub_80D3728(struct Sprite *sprite)
{
    int var1, var2;

    if (GetBattlerSide(gBattleAnimAttacker) == GetBattlerSide(gBattleAnimTarget))
    {
        gBattleAnimArgs[0] *= -1;

        if (GetBattlerPosition(gBattleAnimAttacker) == 0 || GetBattlerPosition(gBattleAnimAttacker) == 1)
        {
            gBattleAnimArgs[0] *= -1;
        }

    }

    if ((gBattleAnimArgs[5] & 0xFF00) == 0)
        var1 = 1;
    else
        var1 = 0;

    if ((u8)gBattleAnimArgs[5] == 0)
        var2 = 3;
    else
        var2 = 1;

    InitAnimSpritePos(sprite, var1);

    if (GetBattlerSide(gBattleAnimAttacker) != 0)
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, 2) + gBattleAnimArgs[2];
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, var2) + gBattleAnimArgs[3];
    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}
