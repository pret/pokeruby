#include "global.h"
#include "battle_anim.h"
#include "palette.h"
#include "rom_8077ABC.h"
#include "sprite.h"
#include "task.h"

extern s16 gBattleAnimArgs[8];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void AnimAuroraRings(struct Sprite *sprite);
static void AnimGrowAuroraRings(struct Sprite *);
static void AnimTask_RotateMonPalette2(u8);

const union AnimCmd gSpriteAnim_83D9190[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D9198[] =
{
    ANIMCMD_FRAME(4, 1),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D91A0[] =
{
    gSpriteAnim_83D9190,
    gSpriteAnim_83D9198,
};

const union AffineAnimCmd gSpriteAffineAnim_83D91A8[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 1),
    AFFINEANIMCMD_FRAME(0x60, 0x60, 0, 1),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D91C0[] =
{
    gSpriteAffineAnim_83D91A8,
};

// Multi-colored rings used in Aurora Beam.
const struct SpriteTemplate RainbowRingSpriteTemplate =
{
    .tileTag = 10140,
    .paletteTag = 10140,
    .oam = &gOamData_837E024,
    .anims = gSpriteAnimTable_83D91A0,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D91C0,
    .callback = AnimAuroraRings,
};

// Animates the colorful rings in Aurora Beam linearly towards the target mon.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: target x offset
// arg 3: target y offset
// arg 4: duration
void AnimAuroraRings(struct Sprite *sprite)
{
    s16 r6;

    InitAnimSpritePos(sprite, 1);
    if (GetBattlerSide(gAnimBankAttacker) != 0)
        r6 = -gBattleAnimArgs[2];
    else
        r6 = gBattleAnimArgs[2];
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2) + r6;
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3) + gBattleAnimArgs[3];
    InitAnimLinearTranslation(sprite);
    sprite->callback = AnimGrowAuroraRings;
    sprite->affineAnimPaused = TRUE;
    sprite->callback(sprite);
}

// Grows the rings in Aurora Beam.
// arg 7: if -1, grow the rings
static void AnimGrowAuroraRings(struct Sprite *sprite)
{
    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
    {
        StartSpriteAnim(sprite, 1);
        sprite->affineAnimPaused = FALSE;
    }
    if (TranslateAnimLinear(sprite) != 0)
        DestroyAnimSprite(sprite);
}

// This seems to rotate the palette of the attacking mon, but the visual 
// effect is not noticeable in-game.
// arg 0: duration
void AnimTask_RotateMonPalette1(u8 taskId)
{
    gTasks[taskId].data[0] = gBattleAnimArgs[0];
    gTasks[taskId].data[2] = 0x100 + IndexOfSpritePaletteTag(0x279C) * 16;
    gTasks[taskId].func = AnimTask_RotateMonPalette2;
}

static void AnimTask_RotateMonPalette2(u8 taskId)
{
    gTasks[taskId].data[10]++;
    if (gTasks[taskId].data[10] == 3)
    {
        u16 r5;
        u16 r6;
        s32 i;

        gTasks[taskId].data[10] = 0;
        r5 = gTasks[taskId].data[2] + 1;
        r6 = gPlttBufferFaded[r5];
        for (i = 1; i < 8; i++)
            gPlttBufferFaded[r5 + i - 1] = gPlttBufferFaded[r5 + i];
        gPlttBufferFaded[r5 + 7] = r6;
    }
    gTasks[taskId].data[11]++;
    if (gTasks[taskId].data[11] == gTasks[taskId].data[0])
        DestroyAnimVisualTask(taskId);
}
