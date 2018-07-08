#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80CABF8(struct Sprite* sprite);
void sub_80CAD54(struct Sprite* sprite);
void sub_80CAE20(struct Sprite* sprite);
static void sub_80CAC44(struct Sprite* sprite);
static void sub_80CADA8(struct Sprite* sprite);
static void sub_80CAE74(struct Sprite* sprite);

const union AnimCmd gSpriteAnim_83D63E0[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D63E8[] =
{
    ANIMCMD_FRAME(4, 7),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D63F0[] =
{
    gSpriteAnim_83D63E0,
    gSpriteAnim_83D63E8,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D63F8 =
{
    .tileTag = 10158,
    .paletteTag = 10158,
    .oam = &gOamData_837DF2C,
    .anims = gSpriteAnimTable_83D63F0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CABF8,
};

const union AnimCmd gSpriteAnim_83D6410[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D6418[] =
{
    ANIMCMD_FRAME(4, 1),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D6420[] =
{
    gSpriteAnim_83D6410,
};

const union AnimCmd *const gSpriteAnimTable_83D6424[] =
{
    gSpriteAnim_83D6418,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D6428 =
{
    .tileTag = 10159,
    .paletteTag = 10159,
    .oam = &gOamData_837DF2C,
    .anims = gSpriteAnimTable_83D6420,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CAD54,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D6440 =
{
    .tileTag = 10159,
    .paletteTag = 10159,
    .oam = &gOamData_837DF24,
    .anims = gSpriteAnimTable_83D6424,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CAE20,
};

void sub_80CABF8(struct Sprite* sprite)
{
    sub_8078764(sprite, 1);
    StartSpriteAnim(sprite, gBattleAnimArgs[4]);
    if (gBattleAnimArgs[4] == 1)
    {
        sprite->oam.objMode = 1;
    }

    sprite->data[0] = gBattleAnimArgs[3];
    sprite->data[1] = gBattleAnimArgs[2];
    sprite->callback = sub_80CAC44;
    sub_80CAC44(sprite);
}

static void sub_80CAC44(struct Sprite* sprite)
{
    u8 var1;
    
    sprite->pos2.x = Sin(sprite->data[1], 32);
    sprite->pos2.y = Cos(sprite->data[1], -3) + ((sprite->data[2] += 24) >> 8);
    if ((u16)(sprite->data[1] - 0x40) < 0x80)
    {
        sprite->oam.priority = (sub_8079ED4(gAnimBankTarget) & 3);
    }
    else
    {
        var1 = sub_8079ED4(gAnimBankTarget) + 1;
        if (var1 > 3)
        {
            var1 = 3;
        }

        sprite->oam.priority = var1;
    }

    sprite->data[1] = (sprite->data[1] + 2) & 0xFF;
    sprite->data[0]--;
    if (sprite->data[0] == -1)
        DestroyAnimSprite(sprite);
}

void sub_80CACEC(u8 taskId)
{
    if (IsContest() || !IsDoubleBattle())
    {
        DestroyAnimVisualTask(taskId);
    }
    else
    {
        if (GetBattlerPosition_permutated(gAnimBankTarget) == 1)
        {
            REG_BG2CNT_BITFIELD.priority = 3;
        }
        else
        {
            REG_BG1CNT_BITFIELD.priority = 1;
        }

        DestroyAnimVisualTask(taskId);
    }
}

void sub_80CAD54(struct Sprite* sprite)
{
    InitAnimSpritePos(sprite, 0);
    sprite->data[0] = gBattleAnimArgs[3];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = sprite->pos1.x;
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankAttacker, 3) + gBattleAnimArgs[2];
    InitAnimLinearTranslation(sprite);
    sprite->data[5] = 0x40;
    sprite->callback = sub_80CADA8;
    sub_80CADA8(sprite);
}

static void sub_80CADA8(struct Sprite* sprite)
{
    if (!TranslateAnimLinear(sprite))
    {
        sprite->pos2.x += Sin(sprite->data[5], 32);
        sprite->pos2.y += Cos(sprite->data[5], -5);
        if ((u16)(sprite->data[5] - 0x40) < 0x80)
        {
            sprite->subpriority = sub_8079E90(gAnimBankAttacker) - 1;
        }
        else
        {
            sprite->subpriority = sub_8079E90(gAnimBankAttacker) + 1;
        }

        sprite->data[5] = (sprite->data[5] + 5) & 0xFF;
    }
    else
    {
        DestroyAnimSprite(sprite);
    }
}

void sub_80CAE20(struct Sprite* sprite)
{
    InitAnimSpritePos(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[3];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = sprite->pos1.x;
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankAttacker, 3) + gBattleAnimArgs[2];
    InitAnimLinearTranslation(sprite);
    sprite->data[5] = 0x40;
    sprite->callback = sub_80CAE74;
    sub_80CAE74(sprite);
}

static void sub_80CAE74(struct Sprite* sprite)
{
    if (!TranslateAnimLinear(sprite))
    {
        sprite->pos2.x += Sin(sprite->data[5], 8);
        if ((u16)(sprite->data[5] - 0x3B) < 5 || (u16)(sprite->data[5] - 0xBB) < 5)
        {
            sprite->oam.matrixNum ^= 8;
        }

        sprite->data[5] = (sprite->data[5] + 5) & 0xFF;
    }
    else
    {
       DestroyAnimSprite(sprite);
    }
}
