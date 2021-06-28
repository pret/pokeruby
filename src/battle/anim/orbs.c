#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "random.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimAttacker;
extern u8 gBattleAnimTarget;

void sub_80CA7B0(struct Sprite* sprite);
void sub_80CA800(struct Sprite* sprite);
void sub_80CA858(struct Sprite* sprite);
void sub_80CA9A8(struct Sprite* sprite);
void sub_80CAA14(struct Sprite* sprite);
static void sub_80CA8B4(struct Sprite* sprite);
static void sub_80CA9F8(struct Sprite* sprite);
static void sub_80CAACC(struct Sprite* sprite);

const union AnimCmd gSpriteAnim_83D626C[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D6274[] =
{
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D627C[] =
{
    ANIMCMD_FRAME(2, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D6284[] =
{
    ANIMCMD_FRAME(3, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D628C[] =
{
    ANIMCMD_FRAME(4, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D6294[] =
{
    ANIMCMD_FRAME(5, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D629C[] =
{
    ANIMCMD_FRAME(6, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D62A4[] =
{
    ANIMCMD_FRAME(7, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D62AC[] =
{
    ANIMCMD_FRAME(8, 1),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D62B4[] =
{
    gSpriteAnim_83D626C,
    gSpriteAnim_83D6274,
    gSpriteAnim_83D627C,
    gSpriteAnim_83D6284,
    gSpriteAnim_83D628C,
    gSpriteAnim_83D6294,
    gSpriteAnim_83D629C,
};

const union AnimCmd *const gSpriteAnimTable_83D62D0[] =
{
    gSpriteAnim_83D62A4,
};

const union AnimCmd *const gSpriteAnimTable_83D62D4[] =
{
    gSpriteAnim_83D62AC,
};

const union AffineAnimCmd gSpriteAffineAnim_83D62D8[] = {
    AFFINEANIMCMD_FRAME(-5, -5, 0, 1),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D62E8[] = {
    gSpriteAffineAnim_83D62D8,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D62EC =
{
    .tileTag = ANIM_TAG_ORBS,
    .paletteTag = ANIM_TAG_ORBS,
    .oam = &gOamData_837E0AC,
    .anims = gSpriteAnimTable_83D62D4,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D62E8,
    .callback = sub_80CA7B0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D6304 =
{
    .tileTag = ANIM_TAG_ORBS,
    .paletteTag = ANIM_TAG_ORBS,
    .oam = &gOamData_837DF24,
    .anims = gSpriteAnimTable_83D62B4,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CA800,
};

const struct SpriteTemplate gSpriteTemplate_83D631C =
{
    .tileTag = ANIM_TAG_ORBS,
    .paletteTag = ANIM_TAG_ORBS,
    .oam = &gOamData_837DF24,
    .anims = gSpriteAnimTable_83D62D0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CA858,
};

const union AffineAnimCmd gSpriteAffineAnim_83D6334[] = {
    AFFINEANIMCMD_FRAME(320, 320, 0, 0),
    AFFINEANIMCMD_FRAME(-14, -14, 0, 1),
    AFFINEANIMCMD_JUMP(1),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D634C[] = {
    gSpriteAffineAnim_83D6334,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D6350 =
{
    .tileTag = ANIM_TAG_GRAY_ORB,
    .paletteTag = ANIM_TAG_GRAY_ORB,
    .oam = &gOamData_837DFE4,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D634C,
    .callback = sub_80CA7B0,
};

const union AffineAnimCmd gSpriteAffineAnim_83D6368[] = {
    AFFINEANIMCMD_FRAME(-5, -5, 0, 1),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D6378[] = {
    gSpriteAffineAnim_83D6368,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D637C =
{
    .tileTag = ANIM_TAG_ORBS,
    .paletteTag = ANIM_TAG_ORBS,
    .oam = &gOamData_837E0AC,
    .anims = gSpriteAnimTable_83D62D4,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D6378,
    .callback = sub_80CA9A8,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D6394 =
{
    .tileTag = ANIM_TAG_ORBS,
    .paletteTag = ANIM_TAG_ORBS,
    .oam = &gOamData_837DF24,
    .anims = gSpriteAnimTable_83D62B4,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CAA14,
};


// orbs
// Used by Solar Beam, Absorb, Hyper Beam, and Leech Seed.

void sub_80CA7B0(struct Sprite* sprite)
{
    InitAnimSpritePos(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData(sprite, DestroySpriteAndMatrix);
}

void sub_80CA800(struct Sprite* sprite)
{
    InitAnimSpritePos(sprite, 1);
    StartSpriteAnim(sprite, gBattleAnimArgs[3]);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, 2);
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, 3);
    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

void sub_80CA858(struct Sprite* sprite)
{
    InitAnimSpritePos(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = sprite->x;
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, 2);
    sprite->data[3] = sprite->y;
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, 3);
    InitAnimLinearTranslation(sprite);
    sprite->data[5] = gBattleAnimArgs[3];
    sprite->callback = sub_80CA8B4;
    sub_80CA8B4(sprite);
}

static void sub_80CA8B4(struct Sprite* sprite)
{
    if (TranslateAnimLinear(sprite))
    {
        DestroySprite(sprite);
    }
    else
    {
        if (sprite->data[5] > 0x7F)
        {
            sprite->subpriority = GetBattlerSubpriority(gBattleAnimTarget) + 1;
        }
        else
        {
            sprite->subpriority = GetBattlerSubpriority(gBattleAnimTarget) + 6;
        }
        sprite->x2 += Sin(sprite->data[5], 5);
        sprite->y2 += Cos(sprite->data[5], 14);
        sprite->data[5] = (sprite->data[5] + 15) & 0xFF;
    }
}

void sub_80CA928(u8 taskId)
{
    gTasks[taskId].data[0]--;
    if (gTasks[taskId].data[0] == -1)
    {
        gTasks[taskId].data[1]++;
        gTasks[taskId].data[0] = 6;
        gBattleAnimArgs[0] = 15;
        gBattleAnimArgs[1] = 0;
        gBattleAnimArgs[2] = 80;
        gBattleAnimArgs[3] = 0;
        CreateSpriteAndAnimate(&gSpriteTemplate_83D631C, 0, 0, GetBattlerSubpriority(gBattleAnimTarget) + 1);
    }

    if (gTasks[taskId].data[1] == 15)
        DestroyAnimVisualTask(taskId);
}

void sub_80CA9A8(struct Sprite* sprite)
{
    sub_8078764(sprite, TRUE);
    sprite->data[0] = gBattleAnimArgs[3];
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
    sprite->data[5] = gBattleAnimArgs[2];
    InitAnimArcTranslation(sprite);
    sprite->callback = sub_80CA9F8;
}

static void sub_80CA9F8(struct Sprite* sprite)
{
    if (TranslateAnimArc(sprite))
        DestroyAnimSprite(sprite);
}

void sub_80CAA14(struct Sprite* sprite)
{
    u16 a = Random();
    u16 b;
    
    StartSpriteAnim(sprite, a & 7);
    sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
    sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
    if (GetBattlerSide(gBattleAnimAttacker))
    {
        sprite->x -= 20;
    }
    else
    {
        sprite->x += 20;
    }

    b = Random();
    sprite->data[0] = (b & 31) + 64;
    sprite->data[1] = sprite->x;
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, 2);
    sprite->data[3] = sprite->y;
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, 3);
    sub_8078D60(sprite);
    sprite->data[5] = Random() & 0xFF;
    sprite->data[6] = sprite->subpriority;
    sprite->callback = sub_80CAACC;
    sub_80CAACC(sprite);
}

static void sub_80CAACC(struct Sprite* sprite)
{
    if (sub_8078CE8(sprite))
    {
        DestroyAnimSprite(sprite);
    }
    else
    {
        sprite->y2 += Cos(sprite->data[5], 12);
        if (sprite->data[5] <= 0x7E)
        {
            sprite->subpriority = sprite->data[6];
        }
        else
        {
            sprite->subpriority = sprite->data[6] + 1;
        }

        sprite->data[5] = (sprite->data[5] + 24) & 0xFF;
    }
}
