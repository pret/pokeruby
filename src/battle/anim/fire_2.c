#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "heated_rock.h"
#include "rom_8077ABC.h"
#include "task.h"
#include "trig.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void AnimEmberFlare(struct Sprite *sprite);
void sub_80D5210(struct Sprite *sprite);
void AnimFireRing(struct Sprite *sprite);
void AnimFireCross(struct Sprite *sprite);
void sub_80D53B4(struct Sprite *sprite);
void sub_80D58FC(struct Sprite *sprite);
void sub_80D5A20(struct Sprite *sprite);
static void AnimFireRingStep1(struct Sprite *);
static void UpdateFireRingCircleOffset(struct Sprite *);
static void AnimFireRingStep2(struct Sprite *);
static void AnimFireRingStep3(struct Sprite *);
static void sub_80D53F4(struct Sprite *);
static void sub_80D541C(struct Sprite *);
static void sub_80D54E0(u8 taskId);
static void sub_80D57C4(u8 spriteId, u8 taskId, u8 a3);
static void sub_80D59B0(struct Sprite *);
static void sub_80D5A74(struct Sprite *);

const union AnimCmd gSpriteAnim_83D95C8[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_FRAME(48, 4),
    ANIMCMD_FRAME(64, 4),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_83D95E0[] =
{
    gSpriteAnim_83D95C8,
};

const struct SpriteTemplate gEmberSpriteTemplate =
{
    .tileTag = 10029,
    .paletteTag = 10029,
    .oam = &gOamData_837DF34,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = TranslateAnimSpriteToTargetMonLocation,
};

const struct SpriteTemplate gEmberFlareSpriteTemplate =
{
    .tileTag = 10029,
    .paletteTag = 10029,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D95E0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimEmberFlare,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9614 =
{
    .tileTag = 10029,
    .paletteTag = 10029,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D95E0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D5210,
};

const struct SpriteTemplate gFireRingSpriteTemplate =
{
    .tileTag = 10029,
    .paletteTag = 10029,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D95E0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimFireRing,
};

const union AnimCmd gSpriteAnim_83D9644[] =
{
    ANIMCMD_FRAME(32, 6),
    ANIMCMD_FRAME(48, 6),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_83D9650[] =
{
    gSpriteAnim_83D9644,
};

const union AffineAnimCmd gSpriteAffineAnim_83D9654[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 1),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83D9664[] =
{
    AFFINEANIMCMD_FRAME(0xA0, 0xA0, 0, 0),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D9674[] =
{
    gSpriteAffineAnim_83D9654,
    gSpriteAffineAnim_83D9664,
};

const struct SpriteTemplate gFireCrossSpriteTemplate =
{
    .tileTag = 10029,
    .paletteTag = 10029,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D9650,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimFireCross,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9694 =
{
    .tileTag = 10029,
    .paletteTag = 10029,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D95E0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D53B4,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D96AC =
{
    .tileTag = 10029,
    .paletteTag = 10029,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D95E0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_807A9BC,
};


const struct SpriteTemplate gSpriteTemplate_83D96C4 =
{
    .tileTag = 10201,
    .paletteTag = 10201,
    .oam = &gOamData_837DF2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D58FC,
};

const s16 gHeatedRockCoords[][2] =
{
    {-2, -5},
    {-1, -1},
    { 3, -6},
    { 4, -2},
    { 2, -8},
    {-5, -5},
    { 4, -7},
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D96F8 =
{
    .tileTag = 10201,
    .paletteTag = 10201,
    .oam = &gOamData_837DF34,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D5A20,
};

// Animates the secondary effect of MOVE_EMBER, where the flames grow and slide
// horizontally a bit.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: target x pixel offset
// arg 3: target y pixel offset
// arg 4: duration
// arg 5: ? (todo: something related to which mon the pixel offsets are based on)
// arg 6: ? (todo: something related to which mon the pixel offsets are based on)
void AnimEmberFlare(struct Sprite *sprite)
{
    if (GetBattlerSide(gAnimBankAttacker) == GetBattlerSide(gAnimBankTarget)
        && (gAnimBankAttacker == GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT)
            || gAnimBankAttacker == GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT)))
            gBattleAnimArgs[2] = -gBattleAnimArgs[2];

    sprite->callback = sub_8079534;
    sprite->callback(sprite);
}

void sub_80D5210(struct Sprite *sprite)
{
    gBattleAnimArgs[0] = -gBattleAnimArgs[0];
    gBattleAnimArgs[2] = -gBattleAnimArgs[2];

    sprite->callback = sub_8079534;
}

// Animates the a fire sprite in the first-half of the MOVE_FIRE_BLAST
// animation.  The fire sprite first moves in a circle around the mon,
// and then it is translated towards the target mon, while still rotating.
// Lastly, it moves in a circle around the target mon.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: initial wave offset
void AnimFireRing(struct Sprite *sprite)
{
    InitAnimSpritePos(sprite, 1);

    sprite->data[7] = gBattleAnimArgs[2];
    sprite->data[0] = 0;

    sprite->callback = AnimFireRingStep1;
}

static void AnimFireRingStep1(struct Sprite *sprite)
{
    UpdateFireRingCircleOffset(sprite);

    if (++sprite->data[0] == 0x12)
    {
        sprite->data[0] = 0x19;
        sprite->data[1] = sprite->pos1.x;
        sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
        sprite->data[3] = sprite->pos1.y;
        sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3);

        InitAnimLinearTranslation(sprite);

        sprite->callback = AnimFireRingStep2;
    }
}

static void AnimFireRingStep2(struct Sprite *sprite)
{
    if (TranslateAnimLinear(sprite))
    {
        sprite->data[0] = 0;

        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankTarget, 2);
        sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankTarget, 3);
        sprite->pos2.y = 0;
        sprite->pos2.x = 0;

        sprite->callback = AnimFireRingStep3;
        sprite->callback(sprite);
    }
    else
    {
        sprite->pos2.x += Sin(sprite->data[7], 28);
        sprite->pos2.y += Cos(sprite->data[7], 28);

        sprite->data[7] = (sprite->data[7] + 20) & 0xFF;
    }
}

static void AnimFireRingStep3(struct Sprite *sprite)
{
    UpdateFireRingCircleOffset(sprite);

    if (++sprite->data[0] == 0x1F)
        DestroyAnimSprite(sprite);
}

static void UpdateFireRingCircleOffset(struct Sprite *sprite)
{
    sprite->pos2.x = Sin(sprite->data[7], 28);
    sprite->pos2.y = Cos(sprite->data[7], 28);

    sprite->data[7] = (sprite->data[7] + 20) & 0xFF;
}

// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: duration
// arg 3: x delta
// arg 4: y delta 
void AnimFireCross(struct Sprite *sprite)
{
    sprite->pos1.x += gBattleAnimArgs[0];
    sprite->pos1.y += gBattleAnimArgs[1];

    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[2] = gBattleAnimArgs[4];

    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);

    sprite->callback = TranslateSpriteOverDuration;
}

void sub_80D53B4(struct Sprite *sprite)
{
    InitAnimSpritePos(sprite, 1);

    sprite->data[1] = gBattleAnimArgs[2];
    sprite->data[0] = gBattleAnimArgs[3];

    sprite->invisible = TRUE;
    sprite->callback = WaitAnimForDuration;

    StoreSpriteCallbackInData(sprite, sub_80D53F4);
}

static void sub_80D53F4(struct Sprite *sprite)
{
    sprite->invisible = FALSE;

    sprite->data[0] = sprite->data[1];
    sprite->data[1] = 0;

    sprite->callback = sub_80D541C;
    sub_80D541C(sprite);
}

static void sub_80D541C(struct Sprite *sprite)
{
    sprite->pos2.x = Sin(sprite->data[1], sprite->data[2] >> 8);
    sprite->pos2.y = Cos(sprite->data[1], sprite->data[2] >> 8);

    sprite->data[1] = (sprite->data[1] + 10) & 0xFF;
    sprite->data[2] += 0xD0;

    if (--sprite->data[0] == -1)
        DestroyAnimSprite(sprite);
}

void sub_80D5470(u8 taskId) // initialize animation task for Move_ERUPTION?
{
    struct Task *task = &gTasks[taskId];

    task->data[15] = GetAnimBattlerSpriteId(0);

    task->data[0] = 0;
    task->data[1] = 0;
    task->data[2] = 0;
    task->data[3] = 0;
    task->data[4] = gSprites[task->data[15]].pos1.y;
    task->data[5] = GetBattlerSide(gAnimBankAttacker);
    task->data[6] = 0;

    sub_8078E70(task->data[15], 0);

    task->func = sub_80D54E0;
}

static void sub_80D54E0(u8 taskId) // animate Move_ERUPTION?
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        sub_8079C08(task, task->data[15], 0x100, 0x100, 0xE0, 0x200, 0x20);

        task->data[0]++;
    case 1:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;

            if (++task->data[2] & 0x1)
                gSprites[task->data[15]].pos2.x = 3;
            else
                gSprites[task->data[15]].pos2.x = -3;
        }

        if (task->data[5])
        {
            if (++task->data[3] > 4)
            {
                task->data[3] = 0;
                gSprites[task->data[15]].pos1.y++;
            }
        }

        if(!sub_8079C74(task))
        {
            sub_8079A64(task->data[15]);
            gSprites[task->data[15]].pos2.x = 0;

            task->data[1] = 0;
            task->data[2] = 0;
            task->data[3] = 0;
            task->data[0]++;
        }
        break;
    case 2:
        if (++task->data[1] > 4)
        {
            if (task->data[5])
                sub_8079C08(task, task->data[15], 0xE0, 0x200, 0x180, 0xF0, 0x6);
            else
                sub_8079C08(task, task->data[15], 0xE0, 0x200, 0x180, 0xC0, 0x6);

            task->data[1] = 0;
            task->data[0]++;
        }
        break;
    case 3:
        if (!sub_8079C74(task))
        {
            sub_80D57C4(task->data[15], taskId, 6);

            task->data[0]++;
        }
        break;
    case 4:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;

            if (++task->data[2] & 1)
                gSprites[task->data[15]].pos2.y += 3;
            else
                gSprites[task->data[15]].pos2.y -= 3;
        }

        if (++task->data[3] > 0x18)
        {
            if (task->data[5])
                sub_8079C08(task, task->data[15], 0x180, 0xF0, 0x100, 0x100, 0x8);
            else
                sub_8079C08(task, task->data[15], 0x180, 0xC0, 0x100, 0x100, 0x8);

            if (task->data[2] & 1)
                gSprites[task->data[15]].pos2.y -= 3;

            task->data[1] = 0;
            task->data[2] = 0;
            task->data[3] = 0;
            task->data[0]++;
        }
        break;
    case 5:
        if (task->data[5])
            gSprites[task->data[15]].pos1.y--;

        if (!sub_8079C74(task))
        {
            gSprites[task->data[15]].pos1.y = task->data[4];
            sub_8078F40(task->data[15]);

            task->data[2] = 0;
            task->data[0]++;
        }
        break;
    case 6:
        if (!task->data[6])
            DestroyAnimVisualTask(taskId);

        break;
    default:
    }
}

static void sub_80D57C4(u8 spriteId, u8 taskId, u8 a3)
{
    u16 i, j;
    s8 sign;

    u16 y = sub_80D5940(spriteId);
    u16 x = gSprites[spriteId].pos1.x;

    if(!GetBattlerSide(gAnimBankAttacker))
    {
        x -= 0xC;
        sign = 1;
    }
    else
    {
        x += 0x10;
        sign = -1;
    }

    for (i = 0, j = 0; i <= 6; i++)
    {
        u8 spriteId = CreateSprite(&gSpriteTemplate_83D96C4, x, y, 2);

        if (spriteId != 0x40)
        {
            gSprites[spriteId].oam.tileNum += j * 4 + 0x40;

            if (++j >= 5)
                j = 0;

            sub_80D5994(&gSprites[spriteId], gHeatedRockCoords[i][0] * sign, gHeatedRockCoords[i][1]);
            gSprites[spriteId].data[6] = taskId;
            gSprites[spriteId].data[7] = a3;

            gTasks[taskId].data[a3]++;
        }
    }
}

void sub_80D58FC(struct Sprite *sprite)
{
    sub_80D59B0(sprite);

    if (sprite->invisible)
    {
        gTasks[sprite->data[6]].data[sprite->data[7]]--;
        DestroySprite(sprite);
    }
}

u16 sub_80D5940(u8 spriteId)
{
    u16 var1 = gSprites[spriteId].pos1.y + gSprites[spriteId].pos2.y + gSprites[spriteId].centerToCornerVecY;

    if (GetBattlerSide(gAnimBankAttacker) == 0)
    {
        var1 = ((var1 << 16) + 0x4A0000) >> 16;
    }
    else
    {
        var1 = ((var1 << 16) + 0x2C0000) >> 16;
    }

    return var1;
}

void sub_80D5994(struct Sprite *sprite, s16 x, s16 y)
{
    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->data[2] = (u16)sprite->pos1.x * 8;
    sprite->data[3] = (u16)sprite->pos1.y * 8;
    sprite->data[4] = x * 8;
    sprite->data[5] = y * 8;
}

static void sub_80D59B0(struct Sprite *sprite)
{
    int var1;
    if (++sprite->data[0] > 2)
    {
        sprite->data[0] = 0;
        ++sprite->data[1];
        var1 = (u16)sprite->data[1] * (u16)sprite->data[1];
        sprite->data[3] += var1;
    }

    sprite->data[2] += sprite->data[4];
    sprite->pos1.x = sprite->data[2] >> 3;
    sprite->data[3] += sprite->data[5];
    sprite->pos1.y = sprite->data[3] >> 3;

    if (sprite->pos1.x < -8 || sprite->pos1.x > 0xf8 || sprite->pos1.y < -8 || sprite->pos1.y > 120)
        sprite->invisible = TRUE;
}

void sub_80D5A20(struct Sprite *sprite)
{
    sprite->pos1.x = gBattleAnimArgs[0];
    sprite->pos1.y = gBattleAnimArgs[1];

    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->data[2] = 0;
    sprite->data[6] = gBattleAnimArgs[2];
    sprite->data[7] = gBattleAnimArgs[3];

    sprite->oam.tileNum += gBattleAnimArgs[4] * 16;
    sprite->callback = sub_80D5A74;
}

static void sub_80D5A74(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        if (sprite->data[6] != 0)
        {
            sprite->data[6]--;
            return;
        }

        sprite->data[0]++;
        // fall through
    case 1:
        sprite->pos1.y += 8;
        if (sprite->pos1.y >= sprite->data[7])
        {
            sprite->pos1.y = sprite->data[7];
            sprite->data[0]++;
        }
        break;
    case 2:
        if (++sprite->data[1] > 1)
        {
            sprite->data[1] = 0;
            if ((++sprite->data[2] & 1) != 0)
            {
                sprite->pos2.y = -3;
            }
            else
            {
                sprite->pos2.y = 3;
            }
        }

        if (++sprite->data[3] > 16)
        {
            DestroyAnimSprite(sprite);
        }
        break;
    }
}
