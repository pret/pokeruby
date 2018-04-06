#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

#define SPRITE gSprites[TASK.data[0]]

extern s16 gBattleAnimArgs[8];

extern u8 gBankSpriteIds[];
extern s32 gAnimMoveDmg;
extern u16 gAnimMovePower;
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

static void AnimTask_ShakeMonStep(u8 taskId);
static void AnimTask_ShakeMon2Step(u8 taskId);
static void AnimTask_ShakeMonInPlaceStep(u8 taskId);
static void AnimTask_ShakeAndSinkMonStep(u8 taskId);
static void sub_80A8488(u8 taskId);
static void DoHorizontalLunge(struct Sprite *sprite);
static void ReverseHorizontalLungeDirection(struct Sprite *sprite);
static void DoVerticalDip(struct Sprite *sprite);
static void ReverseVerticalDipDirection(struct Sprite* sprite);
static void SlideMonToOriginalPos(struct Sprite *sprite);
static void SlideMonToOriginalPosStep(struct Sprite *sprite);
static void SlideMonToOffset(struct Sprite *sprite);
static void sub_80A8818(struct Sprite *sprite);
static void sub_80A88F0(struct Sprite *sprite);
static void AnimTask_WindUpLungePart1(u8 taskId);
static void AnimTask_WindUpLungePart2(u8 taskId);
static void AnimTask_SwayMonStep(u8 taskId);
static void AnimTask_ScaleMonAndRestoreStep(u8 taskId);
static void sub_80A8FD8(u8 taskId);
static void sub_80A913C(u8 taskId);

const struct SpriteTemplate gHorizontalLungeSpriteTemplate =
{
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &gDummyOamData,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = DoHorizontalLunge,
};

const struct SpriteTemplate gVerticalDipSpriteTemplate =
{
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &gDummyOamData,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = DoVerticalDip,
};

const struct SpriteTemplate gSlideMonToOriginalPosSpriteTemplate =
{
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &gDummyOamData,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SlideMonToOriginalPos,
};

const struct SpriteTemplate gSlideMonToOffsetSpriteTemplate =
{
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &gDummyOamData,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SlideMonToOffset,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83C2010 =
{
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &gDummyOamData,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80A8818,
};

// Task to facilitate simple shaking of a pokemon's picture in battle.
// The shaking alternates between the original position and the target position.
// arg 0: anim battler
// arg 1: x pixel offset
// arg 2: y pixel offset
// arg 3: num times to shake
// arg 4: frame delay
void AnimTask_ShakeMon(u8 taskId)
{
    u8 spriteId;
    spriteId = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);
    if (spriteId == 0xff)
    {
        DestroyAnimVisualTask(taskId);
        return;
    }
    gSprites[spriteId].pos2.x = gBattleAnimArgs[1];
    gSprites[spriteId].pos2.y = gBattleAnimArgs[2];
    TASK.data[0] = spriteId;
    TASK.data[1] = gBattleAnimArgs[3];
    TASK.data[2] = gBattleAnimArgs[4];
    TASK.data[3] = gBattleAnimArgs[4];
    TASK.data[4] = gBattleAnimArgs[1];
    TASK.data[5] = gBattleAnimArgs[2];
    TASK.func = AnimTask_ShakeMonStep;
    AnimTask_ShakeMonStep(taskId);
}

static void AnimTask_ShakeMonStep(u8 taskId)
{
    if (TASK.data[3] == 0)
    {
        if (SPRITE.pos2.x == 0)
        {
            SPRITE.pos2.x = TASK.data[4];
        }
        else
        {
            SPRITE.pos2.x = 0;
        }
        if (SPRITE.pos2.y == 0)
        {
            SPRITE.pos2.y = TASK.data[5];
        }
        else
        {
            SPRITE.pos2.y = 0;
        }
        TASK.data[3] = TASK.data[2];
        if (--TASK.data[1] == 0)
        {
            SPRITE.pos2.x = 0;
            SPRITE.pos2.y = 0;
            DestroyAnimVisualTask(taskId);
            return;
        }
    }
    else
    {
        TASK.data[3]--;
    }
}

// Task to facilitate simple shaking of a pokemon's picture in battle.
// The shaking alternates between the positive and negative versions of the specified pixel offsets.
// arg 0: anim battler
// arg 1: x pixel offset
// arg 2: y pixel offset
// arg 3: num times to shake
// arg 4: frame delay
void AnimTask_ShakeMon2(u8 taskId)
{
    u8 sprite;
    bool8 destroy;
    u8 side;
    destroy = FALSE;
    if (gBattleAnimArgs[0] < 4)
    {
        sprite = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);
        if (sprite == 0xff)
        {
            DestroyAnimVisualTask(taskId);
            return;
        }
    }
    else if (gBattleAnimArgs[0] != 8)
    {
        switch (gBattleAnimArgs[0])
        {
        case 4:
            side = GetBattlerAtPosition(0);
            break;
        case 5:
            side = GetBattlerAtPosition(2);
            break;
        case 6:
            side = GetBattlerAtPosition(1);
            break;
        case 7:
        default:
            side = GetBattlerAtPosition(3);
            break;
        }

        if (IsAnimBankSpriteVisible(side) == FALSE)
            destroy = TRUE;

        sprite = gBankSpriteIds[side];
    }
    else
    {
        sprite = gBankSpriteIds[gAnimBankAttacker];
    }

    if (destroy)
    {
        DestroyAnimVisualTask(taskId);
        return;
    }

    gSprites[sprite].pos2.x = gBattleAnimArgs[1];
    gSprites[sprite].pos2.y = gBattleAnimArgs[2];
    TASK.data[0] = sprite;
    TASK.data[1] = gBattleAnimArgs[3];
    TASK.data[2] = gBattleAnimArgs[4];
    TASK.data[3] = gBattleAnimArgs[4];
    TASK.data[4] = gBattleAnimArgs[1];
    TASK.data[5] = gBattleAnimArgs[2];
    TASK.func = AnimTask_ShakeMon2Step;
    TASK.func(taskId);
}

static void AnimTask_ShakeMon2Step(u8 taskId)
{
    if (TASK.data[3] == 0)
    {
        if (SPRITE.pos2.x == TASK.data[4])
            SPRITE.pos2.x = -TASK.data[4];
        else
            SPRITE.pos2.x = TASK.data[4];

        if (SPRITE.pos2.y == TASK.data[5])
            SPRITE.pos2.y = -TASK.data[5];
        else
            SPRITE.pos2.y = TASK.data[5];

        TASK.data[3] = TASK.data[2];
        if (--TASK.data[1] == 0)
        {
            SPRITE.pos2.x = 0;
            SPRITE.pos2.y = 0;
            DestroyAnimVisualTask(taskId);
            return;
        }
    }
    else
    {
        TASK.data[3]--;
    }
}

// Task to facilitate simple shaking of a pokemon's picture in battle.
// The shaking alternates between the positive and negative versions of the specified pixel offsets
// with respect to the current location of the mon's picture.
// arg 0: battler
// arg 1: x offset
// arg 2: y offset
// arg 3: num shakes
// arg 4: delay
void AnimTask_ShakeMonInPlace(u8 taskId)
{
    u8 spriteId = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);
    if (spriteId == 0xff)
    {
        DestroyAnimVisualTask(taskId);
        return;
    }

    gSprites[spriteId].pos2.x += gBattleAnimArgs[1];
    gSprites[spriteId].pos2.y += gBattleAnimArgs[2];
    TASK.data[0] = spriteId;
    TASK.data[1] = 0;
    TASK.data[2] = gBattleAnimArgs[3];
    TASK.data[3] = 0;
    TASK.data[4] = gBattleAnimArgs[4];
    TASK.data[5] = gBattleAnimArgs[1] * 2;
    TASK.data[6] = gBattleAnimArgs[2] * 2;
    TASK.func = AnimTask_ShakeMonInPlaceStep;
    TASK.func(taskId);
}

static void AnimTask_ShakeMonInPlaceStep(u8 taskId)
{
    if (TASK.data[3] == 0)
    {
        if (TASK.data[1] & 1)
        {
            SPRITE.pos2.x += TASK.data[5];
            SPRITE.pos2.y += TASK.data[6];
        }
        else
        {
            SPRITE.pos2.x -= TASK.data[5];
            SPRITE.pos2.y -= TASK.data[6];
        }
        TASK.data[3] = TASK.data[4];
        if (++TASK.data[1] >= TASK.data[2])
        {
            if (TASK.data[1] & 1)
            {
                SPRITE.pos2.x += TASK.data[5] / 2;
                SPRITE.pos2.y += TASK.data[6] / 2;
            }
            else
            {
                SPRITE.pos2.x -= TASK.data[5] / 2;
                SPRITE.pos2.y -= TASK.data[6] / 2;
            }
            DestroyAnimVisualTask(taskId);
            return;
        }
    }
    else
    {
        TASK.data[3]--;
    }
}

// Shakes a mon bg horizontally and moves it downward linearly.
// arg 0: battler
// arg 1: x offset
// arg 2: frame delay between each movement
// arg 3: downward speed (subpixel)
// arg 4: duration
void AnimTask_ShakeAndSinkMon(u8 taskId)
{
    u8 sprite = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);
    gSprites[sprite].pos2.x = gBattleAnimArgs[1];
    TASK.data[0] = sprite;
    TASK.data[1] = gBattleAnimArgs[1];
    TASK.data[2] = gBattleAnimArgs[2];
    TASK.data[3] = gBattleAnimArgs[3];
    TASK.data[4] = gBattleAnimArgs[4];
    TASK.func = AnimTask_ShakeAndSinkMonStep;
    TASK.func(taskId);
}

static void AnimTask_ShakeAndSinkMonStep(u8 taskId)
{
    s16 x;
    u8 sprite;
    sprite = TASK.data[0];
    x = TASK.data[1];
    if (TASK.data[2] == TASK.data[8]++)
    {
        TASK.data[8] = 0;
        if (gSprites[sprite].pos2.x == x)
            x = -x;

        gSprites[sprite].pos2.x += x;
    }

    TASK.data[1] = x;
    TASK.data[9] += TASK.data[3];
    gSprites[sprite].pos2.y = TASK.data[9] >> 8;
    if (--TASK.data[4] == 0)
    {
        DestroyAnimVisualTask(taskId);
        return;
    }
}

// Moves a mon bg picture along an elliptical path that begins
// and ends at the mon's origin location.
// arg 0: battler
// arg 1: ellipse width
// arg 2: ellipse height
// arg 3: num loops
// arg 4: speed (valid values are 0-5)
void AnimTask_TranslateMonElliptical(u8 taskId)
{
    u8 i;
    u8 spriteId;
    u8 wavePeriod;

    wavePeriod = 1;
    spriteId = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);
    if (gBattleAnimArgs[4] > 5)
        gBattleAnimArgs[4] = 5;

    for (i = 0; i < gBattleAnimArgs[4]; i++)
    {
        wavePeriod <<= 1;
    }

    TASK.data[0] = spriteId;
    TASK.data[1] = gBattleAnimArgs[1];
    TASK.data[2] = gBattleAnimArgs[2];
    TASK.data[3] = gBattleAnimArgs[3];
    TASK.data[4] = wavePeriod;
    TASK.func = sub_80A8488;
    TASK.func(taskId);
}

static void sub_80A8488(u8 taskId)
{
    u8 spriteId = TASK.data[0];
    gSprites[spriteId].pos2.x = Sin(TASK.data[5], TASK.data[1]);
    gSprites[spriteId].pos2.y = -Cos(TASK.data[5], TASK.data[2]);
    gSprites[spriteId].pos2.y += TASK.data[2];
    TASK.data[5] += TASK.data[4];
    TASK.data[5] &= 0xff;

    if (TASK.data[5] == 0)
        TASK.data[3]--;

    if (TASK.data[3] == 0)
    {
        gSprites[spriteId].pos2.x = 0;
        gSprites[spriteId].pos2.y = 0;
        DestroyAnimVisualTask(taskId);
        return;
    }
}

// Moves a mon bg picture along an elliptical path that begins
// and ends at the mon's origin location. Reverses the direction
// of the path if it's not on the player's side of the battle.
// arg 0: battler
// arg 1: ellipse width
// arg 2: ellipse height
// arg 3: num loops
// arg 4: speed (valid values are 0-5)
void AnimTask_TranslateMonEllipticalRespectSide(u8 taskId)
{
    if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];

    AnimTask_TranslateMonElliptical(taskId);
}

// Performs a simple horizontal lunge, where the mon moves
// horizontally, and then moves back in the opposite direction.
// arg 0: duration of single lunge direction
// arg 1: x pixel delta that is applied each frame
static void DoHorizontalLunge(struct Sprite *sprite)
{
    sprite->invisible = TRUE;
    if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
        sprite->data[1] = -gBattleAnimArgs[1];
    else
        sprite->data[1] = gBattleAnimArgs[1];

    sprite->data[0] = gBattleAnimArgs[0];
    sprite->data[2] = 0;
    sprite->data[3] = gBankSpriteIds[gAnimBankAttacker];
    sprite->data[4] = gBattleAnimArgs[0];
    StoreSpriteCallbackInData(sprite, ReverseHorizontalLungeDirection);
    sprite->callback = TranslateMonBGUntil;
}

static void ReverseHorizontalLungeDirection(struct Sprite *sprite)
{
    sprite->data[0] = sprite->data[4];
    sprite->data[1] = -sprite->data[1];
    sprite->callback = TranslateMonBGUntil;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

// Performs a simple vertical dipping motion, where moves vertically, and then
// moves back in the opposite direction.
// arg 0: duration of single dip direction
// arg 1: y pixel delta that is applied each frame
// arg 2: battler
static void DoVerticalDip(struct Sprite *sprite)
{
    u8 spriteId;
    sprite->invisible = TRUE;
    spriteId = GetAnimBattlerSpriteId(gBattleAnimArgs[2]);
    sprite->data[0] = gBattleAnimArgs[0];
    sprite->data[1] = 0;
    sprite->data[2] = gBattleAnimArgs[1];
    sprite->data[3] = spriteId;
    sprite->data[4] = gBattleAnimArgs[0];
    StoreSpriteCallbackInData(sprite, ReverseVerticalDipDirection);
    sprite->callback = TranslateMonBGUntil;
}

static void ReverseVerticalDipDirection(struct Sprite *sprite)
{
    sprite->data[0] = sprite->data[4];
    sprite->data[2] = -sprite->data[2];
    sprite->callback = TranslateMonBGUntil;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

// Linearly slides a mon's bg picture back to its original sprite position.
// The sprite parameter is a dummy sprite used for facilitating the movement with its callback.
// arg 0: 1 = target or 0 = attacker
// arg 1: direction (0 = horizontal and vertical, 1 = horizontal only, 2 = vertical only)
// arg 2: duration
static void SlideMonToOriginalPos(struct Sprite *sprite)
{
    int something;
    int monSpriteId;
    if (!gBattleAnimArgs[0])
        monSpriteId = gBankSpriteIds[gAnimBankAttacker];
    else
        monSpriteId = gBankSpriteIds[gAnimBankTarget];

    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gSprites[monSpriteId].pos1.x + gSprites[monSpriteId].pos2.x;
    sprite->data[2] = gSprites[monSpriteId].pos1.x;
    sprite->data[3] = gSprites[monSpriteId].pos1.y + gSprites[monSpriteId].pos2.y;
    sprite->data[4] = gSprites[monSpriteId].pos1.y;
    something = 0;
    InitSpriteDataForLinearTranslation(sprite);
    sprite->data[3] = something;
    sprite->data[4] = something;
    sprite->data[5] = gSprites[monSpriteId].pos2.x;
    sprite->data[6] = gSprites[monSpriteId].pos2.y;
    sprite->invisible = TRUE;

    if (gBattleAnimArgs[1] == 1)
        sprite->data[2] = something;
    else if (gBattleAnimArgs[1] == 2)
        sprite->data[1] = something;

    sprite->data[7] = gBattleAnimArgs[1];
    sprite->data[7] |= monSpriteId << 8;
    sprite->callback = SlideMonToOriginalPosStep;
}

static void SlideMonToOriginalPosStep(struct Sprite *sprite)
{
    s8 monSpriteId;
    u8 lo;
    struct Sprite *monSprite;

    lo = sprite->data[7] & 0xff;
    monSpriteId = sprite->data[7] >> 8;
    monSprite = &gSprites[monSpriteId];
    if (sprite->data[0] == 0)
    {
        if (lo < 2)
            monSprite->pos2.x = 0;

        if (lo == 2 || lo == 0)
            monSprite->pos2.y = 0;

        DestroyAnimSprite(sprite);
    }
    else
    {
        sprite->data[0]--;
        sprite->data[3] += sprite->data[1];
        sprite->data[4] += sprite->data[2];
        monSprite->pos2.x = (s8)(sprite->data[3] >> 8) + sprite->data[5];
        monSprite->pos2.y = (s8)(sprite->data[4] >> 8) + sprite->data[6];
    }
}

// Linearly translates a mon to a target offset. The horizontal offset
// is mirrored for the opponent's pokemon, and the vertical offset
// is only mirrored if arg 3 is set to 1.
// arg 0: 0 = attacker, 1 = target
// arg 1: target x pixel offset
// arg 2: target y pixel offset
// arg 3: mirror vertical translation for opposite battle side
// arg 4: duration
static void SlideMonToOffset(struct Sprite *sprite)
{
    u8 battler;
    u8 monSpriteId;
    if (!gBattleAnimArgs[0])
        battler = gAnimBankAttacker;
    else
        battler = gAnimBankTarget;

    monSpriteId = gBankSpriteIds[battler];
    if (GetBattlerSide(battler) != B_SIDE_PLAYER)
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        if (gBattleAnimArgs[3] == 1)
        {
            gBattleAnimArgs[2] = -gBattleAnimArgs[2];
        }
    }

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[1] = gSprites[monSpriteId].pos1.x;
    sprite->data[2] = gSprites[monSpriteId].pos1.x + gBattleAnimArgs[1];
    sprite->data[3] = gSprites[monSpriteId].pos1.y;
    sprite->data[4] = gSprites[monSpriteId].pos1.y + gBattleAnimArgs[2];
    InitSpriteDataForLinearTranslation(sprite);
    sprite->data[3] = 0;
    sprite->data[4] = 0;
    sprite->data[5] = monSpriteId;
    sprite->invisible = TRUE;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    sprite->callback = TranslateMonBGSubPixelUntil;
}

static void sub_80A8818(struct Sprite *sprite)
{
    u8 spriteId;
    u8 v1;
    sprite->invisible = TRUE;
    if (!gBattleAnimArgs[0])
    {
        v1 = gAnimBankAttacker;
    }
    else
    {
        v1 = gAnimBankTarget;
    }
    spriteId = gBankSpriteIds[v1];
    if (GetBattlerSide(v1))
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        if (gBattleAnimArgs[3] == 1)
        {
            gBattleAnimArgs[2] = -gBattleAnimArgs[2];
        }
    }
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[1] = gSprites[spriteId].pos1.x + gSprites[spriteId].pos2.x;
    sprite->data[2] = sprite->data[1] + gBattleAnimArgs[1];
    sprite->data[3] = gSprites[spriteId].pos1.y + gSprites[spriteId].pos2.y;
    sprite->data[4] = sprite->data[3] + gBattleAnimArgs[2];
    InitSpriteDataForLinearTranslation(sprite);
    sprite->data[3] = gSprites[spriteId].pos2.x << 8;
    sprite->data[4] = gSprites[spriteId].pos2.y << 8;
    sprite->data[5] = spriteId;
    sprite->data[6] = gBattleAnimArgs[5];
    if (!gBattleAnimArgs[5])
    {
        StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    }
    else
    {
        StoreSpriteCallbackInData(sprite, sub_80A88F0);
    }
    sprite->callback = TranslateMonBGSubPixelUntil;
}


static void sub_80A88F0(struct Sprite *sprite)
{
    gSprites[sprite->data[5]].pos2.x = 0;
    gSprites[sprite->data[5]].pos2.y = 0;
    DestroyAnimSprite(sprite);
}

// Task to facilitate a two-part translation animation, in which the sprite
// is first translated in an arc to one position.  Then, it "lunges" to a target
// x offset.  Used in TAKE_DOWN, for example.
// arg 0: anim bank
// arg 1: horizontal speed (subpixel)
// arg 2: wave amplitude
// arg 3: first duration
// arg 4: delay before starting lunge
// arg 5: target x offset for lunge
// arg 6: lunge duration
void AnimTask_WindUpLunge(u8 taskId)
{
    s16 wavePeriod = 0x8000 / gBattleAnimArgs[3];
    if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[5] = -gBattleAnimArgs[5];
    }
    TASK.data[0] = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);
    TASK.data[1] = (gBattleAnimArgs[1] << 8) / gBattleAnimArgs[3];
    TASK.data[2] = gBattleAnimArgs[2];
    TASK.data[3] = gBattleAnimArgs[3];
    TASK.data[4] = gBattleAnimArgs[4];
    TASK.data[5] = (gBattleAnimArgs[5] << 8) / gBattleAnimArgs[6];
    TASK.data[6] = gBattleAnimArgs[6];
    TASK.data[7] = wavePeriod;
    TASK.func = AnimTask_WindUpLungePart1;
}

static void AnimTask_WindUpLungePart1(u8 taskId)
{
    u8 spriteId;
    spriteId = TASK.data[0];
    TASK.data[11] += TASK.data[1];
    gSprites[spriteId].pos2.x = TASK.data[11] >> 8;
    gSprites[spriteId].pos2.y = Sin((u8)(TASK.data[10] >> 8), TASK.data[2]);
    TASK.data[10] += TASK.data[7];
    if (--TASK.data[3] == 0)
    {
        TASK.func = AnimTask_WindUpLungePart2;
    }
}

static void AnimTask_WindUpLungePart2(u8 taskId)
{
    u8 spriteId;
    if (TASK.data[4] > 0)
    {
        TASK.data[4]--;
    }
    else
    {
        spriteId = TASK.data[0];
        TASK.data[12] += TASK.data[5];
        gSprites[spriteId].pos2.x = (TASK.data[12] >> 8) + (TASK.data[11] >> 8);
        if (--TASK.data[6] == 0)
        {
            DestroyAnimVisualTask(taskId);
            return;
        }
    }
}

static void sub_80A8B3C(u8 taskId);

void sub_80A8A80(u8 taskId)
{
    u8 spriteId;
    switch (gBattleAnimArgs[0])
    {
    case 0:
    case 1:
        spriteId = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);
        break;
    case 2:
        if (!IsAnimBankSpriteVisible(gAnimBankAttacker ^ 2))
        {
            DestroyAnimVisualTask(taskId);
            return;
        }
        spriteId = gBankSpriteIds[gAnimBankAttacker ^ 2];
        break;
    case 3:
        if (!IsAnimBankSpriteVisible(gAnimBankTarget ^ 2))
        {
            DestroyAnimVisualTask(taskId);
            return;
        }
        spriteId = gBankSpriteIds[gAnimBankTarget ^ 2];
        break;
    default:
        DestroyAnimVisualTask(taskId);
        return;
    }
    TASK.data[0] = spriteId;
    if (GetBattlerSide(gAnimBankTarget))
    {
        TASK.data[1] = gBattleAnimArgs[1];
    }
    else
    {
        TASK.data[1] = -gBattleAnimArgs[1];
    }
    TASK.func = sub_80A8B3C;
}

static void sub_80A8B3C(u8 taskId)
{
    u8 spriteId = TASK.data[0];
    gSprites[spriteId].pos2.x += TASK.data[1];
    if (gSprites[spriteId].pos2.x + gSprites[spriteId].pos1.x + 0x20 > 0x130u)
    {
        DestroyAnimVisualTask(taskId);
        return;
    }
}

// Task that facilitates translating the mon bg picture back and forth
// in a swaying motion (uses Sine wave). It can sway either horizontally
// or vertically, but not both.
// arg 0: direction (0 = horizontal, 1 = vertical)
// arg 1: wave amplitude
// arg 2: wave period
// arg 3: num sways
// arg 4: which mon (0 = attacker, 1`= target)
void AnimTask_SwayMon(u8 taskId)
{
    u8 spriteId;
    if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];

    spriteId = GetAnimBattlerSpriteId(gBattleAnimArgs[4]);
    TASK.data[0] = gBattleAnimArgs[0];
    TASK.data[1] = gBattleAnimArgs[1];
    TASK.data[2] = gBattleAnimArgs[2];
    TASK.data[3] = gBattleAnimArgs[3];
    TASK.data[4] = spriteId;

    if (gBattleAnimArgs[4] == 0)
        TASK.data[5] = gAnimBankAttacker;
    else
        TASK.data[5] = gAnimBankTarget;

    TASK.data[12] = 1;
    TASK.func = AnimTask_SwayMonStep;
}

static void AnimTask_SwayMonStep(u8 taskId)
{
    s16 sineValue;
    u8 spriteId;
    int waveIndex;
    u16 sineIndex;

    spriteId = TASK.data[4];
    sineIndex = TASK.data[10] + TASK.data[2];
    TASK.data[10] = sineIndex;
    waveIndex = sineIndex >> 8;
    sineValue = Sin(waveIndex, TASK.data[1]);

    if (TASK.data[0] == 0)
    {
        gSprites[spriteId].pos2.x = sineValue;
    }
    else
    {
        if (GetBattlerSide(TASK.data[5]) == B_SIDE_PLAYER)
        {
            gSprites[spriteId].pos2.y = (sineValue >= 0) ? sineValue : -sineValue;
        }
        else
        {
            gSprites[spriteId].pos2.y = (sineValue >= 0) ? -sineValue : sineValue;
        }
    }

    if (((waveIndex >= 0x80u) && (TASK.data[11] == 0) && (TASK.data[12] == 1))
        || ((waveIndex < 0x7fu) && (TASK.data[11] == 1) && (TASK.data[12] == 0)))
    {
        TASK.data[11] ^= 1;
        TASK.data[12] ^= 1;
        if (--TASK.data[3] == 0)
        {
            gSprites[spriteId].pos2.x = 0;
            gSprites[spriteId].pos2.y = 0;
            DestroyAnimVisualTask(taskId);
            return;
        }
    }
}

// Scales a mon's sprite, and then scales back to its original dimensions.
// arg 0: x scale delta
// arg 1: y scale delta
// arg 2: duration
// arg 3: anim bank
// arg 4: sprite object mode
void AnimTask_ScaleMonAndRestore(u8 taskId)
{
    u8 spriteId;
    spriteId = GetAnimBattlerSpriteId(gBattleAnimArgs[3]);
    sub_8078E70(spriteId, gBattleAnimArgs[4]);
    TASK.data[0] = gBattleAnimArgs[0];
    TASK.data[1] = gBattleAnimArgs[1];
    TASK.data[2] = gBattleAnimArgs[2];
    TASK.data[3] = gBattleAnimArgs[2];
    TASK.data[4] = spriteId;
    TASK.data[10] = 0x100;
    TASK.data[11] = 0x100;
    TASK.func = AnimTask_ScaleMonAndRestoreStep;
}

static void AnimTask_ScaleMonAndRestoreStep(u8 taskId)
{
    u8 spriteId;
    TASK.data[10] += TASK.data[0];
    TASK.data[11] += TASK.data[1];
    spriteId = TASK.data[4];
    obj_id_set_rotscale(spriteId, TASK.data[10], TASK.data[11], 0);
    if (--TASK.data[2] == 0)
    {
        if (TASK.data[3] > 0)
        {
            TASK.data[0] = -TASK.data[0];
            TASK.data[1] = -TASK.data[1];
            TASK.data[2] = TASK.data[3];
            TASK.data[3] = 0;
        }
        else
        {
            sub_8078F40(spriteId);
            DestroyAnimVisualTask(taskId);
            return;
        }
    }
}

void sub_80A8E04(u8 taskId)
{
    u8 spriteId;
    spriteId = GetAnimBattlerSpriteId(gBattleAnimArgs[2]);
    sub_8078E70(spriteId, 0);
    TASK.data[1] = 0;
    TASK.data[2] = gBattleAnimArgs[0];
    if (gBattleAnimArgs[3] != 1)
    {
        TASK.data[3] = 0;
    }
    else
    {
        TASK.data[3] = gBattleAnimArgs[0] * gBattleAnimArgs[1];
    }
    TASK.data[4] = gBattleAnimArgs[1];
    TASK.data[5] = spriteId;
    TASK.data[6] = gBattleAnimArgs[3];
    if (IsContest())
    {
        TASK.data[7] = 1;
    }
    else
    {
        if (gBattleAnimArgs[2] == 0)
        {
            TASK.data[7] = !GetBattlerSide(gAnimBankAttacker);
        }
        else
        {
            TASK.data[7] = !GetBattlerSide(gAnimBankTarget);
        }
    }
    if (TASK.data[7])
    {
        if (!IsContest())
        {
            TASK.data[3] *= -1;
            TASK.data[4] *= -1;
        }
    }
    TASK.func = sub_80A8FD8;
}

void sub_80A8EFC(u8 taskId)
{
    u8 spriteId;
    spriteId = GetAnimBattlerSpriteId(gBattleAnimArgs[2]);
    sub_8078E70(spriteId, 0);
    TASK.data[1] = 0;
    TASK.data[2] = gBattleAnimArgs[0];
    if (gBattleAnimArgs[2] == 0)
    {
        if (GetBattlerSide(gAnimBankAttacker))
        {
            gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        }
    }
    else
    {
        if (GetBattlerSide(gAnimBankTarget))
        {
            gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        }
    }
    if (gBattleAnimArgs[3] != 1)
    {
        TASK.data[3] = 0;
    }
    else
    {
        TASK.data[3] = gBattleAnimArgs[0] * gBattleAnimArgs[1];
    }
    TASK.data[4] = gBattleAnimArgs[1];
    TASK.data[5] = spriteId;
    TASK.data[6] = gBattleAnimArgs[3];
    TASK.data[7] = 1;
    TASK.data[3] *= -1;
    TASK.data[4] *= -1;
    TASK.func = sub_80A8FD8;
}

static void sub_80A8FD8(u8 taskId)
{
    TASK.data[3] += TASK.data[4];
    obj_id_set_rotscale(TASK.data[5], 0x100, 0x100, TASK.data[3]);
    if (TASK.data[7])
    {
        sub_8078F9C(TASK.data[5]);
    }
    if (++TASK.data[1] >= TASK.data[2])
    {
        switch (TASK.data[6])
        {
        case 1:
            sub_8078F40(TASK.data[5]);
        case 0:
        default:
            DestroyAnimVisualTask(taskId);
            return;
        case 2:
            TASK.data[1] = 0;
            TASK.data[4] *= -1;
            TASK.data[6] = 1;
            break;
        }
    }
}

void sub_80A9058(u8 taskId)
{
    if (!gBattleAnimArgs[0])
    {
        TASK.data[15] = gAnimMovePower / 12;
        if (TASK.data[15] < 1)
        {
            TASK.data[15] = 1;
        }
        if (TASK.data[15] > 16)
        {
            TASK.data[15] = 16;
        }
    }
    else
    {
        TASK.data[15] = gAnimMoveDmg / 12;
        if (TASK.data[15] < 1)
        {
            TASK.data[15] = 1;
        }
        if (TASK.data[15] > 16)
        {
            TASK.data[15] = 16;
        }
    }
    TASK.data[14] = TASK.data[15] / 2;
    TASK.data[13] = TASK.data[14] + (TASK.data[15] & 1);
    TASK.data[12] = 0;
    TASK.data[10] = gBattleAnimArgs[3];
    TASK.data[11] = gBattleAnimArgs[4];
    TASK.data[7] = GetAnimBattlerSpriteId(1);
    TASK.data[8] = gSprites[TASK.data[7]].pos2.x;
    TASK.data[9] = gSprites[TASK.data[7]].pos2.y;
    TASK.data[0] = 0;
    TASK.data[1] = gBattleAnimArgs[1];
    TASK.data[2] = gBattleAnimArgs[2];
    TASK.func = sub_80A913C;
}

static void sub_80A913C(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    if (++task->data[0] > task->data[1])
    {
        task->data[0] = 0;
        task->data[12] = (task->data[12] + 1) & 1;
        if (task->data[10])
        {
            if (task->data[12])
            {
                gSprites[task->data[7]].pos2.x = task->data[8] + task->data[13];
            }
            else
            {
                gSprites[task->data[7]].pos2.x = task->data[8] - task->data[14];
            }
        }
        if (task->data[11])
        {
            if (task->data[12])
            {
                gSprites[task->data[7]].pos2.y = task->data[15];
            }
            else
            {
                gSprites[task->data[7]].pos2.y = 0;
            }
        }
        if (!--task->data[2])
        {
            gSprites[task->data[7]].pos2.x = 0;
            gSprites[task->data[7]].pos2.y = 0;
            DestroyAnimVisualTask(taskId);
            return;
        }
    }
}
