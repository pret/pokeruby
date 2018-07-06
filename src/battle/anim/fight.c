#include "global.h"
#include "battle_anim.h"
#include "random.h"
#include "rom_8077ABC.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "constants/battle_constants.h"

extern s16 gBattleAnimArgs[];
extern u8 gBankAttacker;
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern u8 gBankSpriteIds[];
extern u8 gBanksBySide[];
extern u16 gBattle_BG1_X;
extern u16 gBattle_BG1_Y;
extern u16 gBattle_BG2_X;
extern u16 gBattle_BG2_Y;
extern u16 gBattle_BG3_X;
extern u16 gBattle_BG3_Y;
extern u16 gBattle_WIN0H;
extern u16 gBattle_WIN0V;
extern u16 gBattlerPartyIndexes[];
extern u8 gAnimMoveTurn;

extern struct SpriteTemplate gBasicHitSplatSpriteTemplate;

void sub_080B08A0(struct Sprite *sprite);
void sub_80D902C(struct Sprite *sprite);
void sub_80D9078(struct Sprite *sprite);
void AnimBasicFistOrFoot(struct Sprite *sprite);
void sub_80D90F4(struct Sprite *sprite);
void sub_80D92D0(struct Sprite *sprite);
void sub_80D9378(struct Sprite *sprite);
void AnimSpinningKickOrPunch(struct Sprite *sprite);
void AnimSpinningKickOrPunch(struct Sprite *sprite);
void AnimStompFoot(struct Sprite *sprite);
void sub_80D9540(struct Sprite *sprite);
void sub_80D95D0(struct Sprite *sprite);
void sub_80D96B8(struct Sprite *sprite);
void sub_80D97CC(struct Sprite *sprite);
void sub_80D98D8(struct Sprite *sprite);
void sub_80D9A38(struct Sprite *sprite);
void sub_80D9B48(struct Sprite *sprite);
void sub_80D9BD4(struct Sprite *sprite);
void sub_80D9C40(struct Sprite *sprite);
static void sub_80D927C(struct Sprite *sprite);
static void sub_80D9328(struct Sprite *sprite);
static void sub_80D9404(struct Sprite *sprite);
static void AnimSpinningKickOrPunchFinish(struct Sprite *sprite);
static void AnimStompFootStep(struct Sprite *sprite);
static void AnimStompFootEnd(struct Sprite *sprite);
static void sub_80D9640(struct Sprite *sprite);
static void sub_80D97A0(struct Sprite *sprite);
static void sub_80D986C(struct Sprite *sprite);
static void sub_80D9934(struct Sprite *sprite);
static void sub_80D99F4(struct Sprite *sprite);

const struct SpriteTemplate gSpriteTemplate_83D9F24 =
{
    .tileTag = 10050,
    .paletteTag = 10050,
    .oam = &gOamData_837DF34,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_080B08A0,
};

const union AnimCmd gSpriteAnim_83D9F3C[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D9F44[] =
{
    ANIMCMD_FRAME(16, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D9F4C[] =
{
    ANIMCMD_FRAME(32, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D9F54[] =
{
    ANIMCMD_FRAME(48, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D9F5C[] =
{
    ANIMCMD_FRAME(48, 1, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D9F64[] =
{
    gSpriteAnim_83D9F3C,
};

const union AnimCmd *const gSpriteAnimTable_83D9F68[] =
{
    gSpriteAnim_83D9F44,
    gSpriteAnim_83D9F4C,
};

const union AnimCmd *const gSpriteAnimTable_83D9F70[] =
{
    gSpriteAnim_83D9F54,
    gSpriteAnim_83D9F5C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9F78 =
{
    .tileTag = 10143,
    .paletteTag = 10143,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D9F64,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D902C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9F90 =
{
    .tileTag = 10143,
    .paletteTag = 10143,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D9F64,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D9078,
};

const struct SpriteTemplate gFistFootSpriteTemplate =
{
    .tileTag = 10143,
    .paletteTag = 10143,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D9F64,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimBasicFistOrFoot,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9FC0 =
{
    .tileTag = 10143,
    .paletteTag = 10143,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D9F64,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D90F4,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9FD8 =
{
    .tileTag = 10143,
    .paletteTag = 10143,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D9F70,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D92D0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9FF0 =
{
    .tileTag = 10143,
    .paletteTag = 10143,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D9F68,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D9378,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA008[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0xFFF8, 0xFFF8, 20, 1),
    AFFINEANIMCMD_JUMP(1),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA020[] =
{
    gSpriteAffineAnim_83DA008,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA024 =
{
    .tileTag = 10143,
    .paletteTag = 10143,
    .oam = &gOamData_837DFF4,
    .anims = gSpriteAnimTable_83D9F64,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA020,
    .callback = AnimSpinningKickOrPunch,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA03C[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0xFFFC, 0xFFFC, 20, 1),
    AFFINEANIMCMD_JUMP(1),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA054[] =
{
    gSpriteAffineAnim_83DA03C,
};

const struct SpriteTemplate gMegaPunchKickSpriteTemplate =
{
    .tileTag = 10143,
    .paletteTag = 10143,
    .oam = &gOamData_837DFF4,
    .anims = gSpriteAnimTable_83D9F64,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA054,
    .callback = AnimSpinningKickOrPunch,
};

const struct SpriteTemplate gStompFootSpriteTemplate =
{
    .tileTag = 10143,
    .paletteTag = 10143,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D9F68,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimStompFoot,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA088 =
{
    .tileTag = 10073,
    .paletteTag = 10073,
    .oam = &gOamData_837DF2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D9540,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA0A0 =
{
    .tileTag = 10167,
    .paletteTag = 10167,
    .oam = &gOamData_837E05C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D95D0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA0B8 =
{
    .tileTag = 10208,
    .paletteTag = 10208,
    .oam = &gOamData_837DF34,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D96B8,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA0D0[] =
{
    AFFINEANIMCMD_FRAME(0x20, 0x20, 0, 0),
    AFFINEANIMCMD_FRAME(0x4, 0x4, 0, 64),
    AFFINEANIMCMD_FRAME(0xFFFA, 0xFFFA, 0, 8),
    AFFINEANIMCMD_FRAME(0x6, 0x6, 0, 8),
    AFFINEANIMCMD_JUMP(2),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA0F8[] =
{
    gSpriteAffineAnim_83DA0D0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA0FC =
{
    .tileTag = 10212,
    .paletteTag = 10212,
    .oam = &gOamData_837E11C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA0F8,
    .callback = sub_80D97CC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA114 =
{
    .tileTag = 10257,
    .paletteTag = 10257,
    .oam = &gOamData_837DF2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D98D8,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA12C =
{
    .tileTag = 10256,
    .paletteTag = 10256,
    .oam = &gOamData_837DF3C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D9A38,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA144 =
{
    .tileTag = 10143,
    .paletteTag = 10143,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D9F64,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D9B48,
};

const union AnimCmd gSpriteAnim_83DA15C[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DA16C[] =
{
    ANIMCMD_FRAME(0, 4, .vFlip = TRUE),
    ANIMCMD_FRAME(16, 4, .vFlip = TRUE),
    ANIMCMD_FRAME(32, 4, .vFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DA17C[] =
{
    ANIMCMD_FRAME(0, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(16, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(32, 4, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83DA18C[] =
{
    gSpriteAnim_83DA15C,
    gSpriteAnim_83DA16C,
    gSpriteAnim_83DA17C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA198 =
{
    .tileTag = 10245,
    .paletteTag = 10245,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83DA18C,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D9BD4,
};

const union AnimCmd gSpriteAnim_83DA1B0[] =
{
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(64, 6),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DA1BC[] =
{
    ANIMCMD_FRAME(0, 6, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_FRAME(64, 6, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DA1C8[] =
{
    ANIMCMD_FRAME(0, 6, .hFlip = TRUE),
    ANIMCMD_FRAME(64, 6, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83DA1D4[] =
{
    gSpriteAnim_83DA1B0,
    gSpriteAnim_83DA1BC,
    gSpriteAnim_83DA1C8,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA1E0 =
{
    .tileTag = 10246,
    .paletteTag = 10246,
    .oam = &gOamData_837DF3C,
    .anims = gSpriteAnimTable_83DA1D4,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D9BD4,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA1F8[] =
{
    AFFINEANIMCMD_FRAME(0x200, 0x200, 0, 0),
    AFFINEANIMCMD_FRAME(0xFFE0, 0xFFE0, 0, 8),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA210[] =
{
    gSpriteAffineAnim_83DA1F8,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA214 =
{
    .tileTag = 10143,
    .paletteTag = 10143,
    .oam = &gOamData_837DFF4,
    .anims = gSpriteAnimTable_83D9F64,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA210,
    .callback = sub_80D9C40,
};

void sub_080B08A0(struct Sprite *sprite)
{
    sub_807867C(sprite, gBattleAnimArgs[0]);
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = 15;
    sprite->callback = WaitAnimForDuration;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

void sub_80D902C(struct Sprite *sprite)
{
    if (gBattleAnimArgs[7] == 1 && GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
    }

    StartSpriteAnim(sprite, gBattleAnimArgs[6]);
    gBattleAnimArgs[6] = 0;
    sub_8079534(sprite);
}

void sub_80D9078(struct Sprite *sprite)
{
    if (IsContest())
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
    }

    sub_80D902C(sprite);
}

// Displays a basic fist or foot sprite for a given duration.
// Used by many fighting moves (and elemental "punch" moves).
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: duration
// arg 3: ? (todo: related to initial pixel offsets)
// arg 4: anim num
void AnimBasicFistOrFoot(struct Sprite *sprite)
{
    StartSpriteAnim(sprite, gBattleAnimArgs[4]);

    if (gBattleAnimArgs[3] == 0)
        InitAnimSpritePos(sprite, 1);
    else
        sub_8078764(sprite, 1);

    sprite->data[0] = gBattleAnimArgs[2];
    sprite->callback = WaitAnimForDuration;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

void sub_80D90F4(struct Sprite *sprite)
{
    u8 bank;
    s16 xMod, yMod;
    s16 x, y;

    if (gBattleAnimArgs[0] == 0)
        bank = gAnimBankAttacker;
    else
        bank = gAnimBankTarget;

    if (gBattleAnimArgs[2] < 0)
        gBattleAnimArgs[2] = Random() % 5;

    StartSpriteAnim(sprite, gBattleAnimArgs[2]);
    sprite->pos1.x = GetBattlerSpriteCoord(bank, 2);
    sprite->pos1.y = GetBattlerSpriteCoord(bank, 3);

    xMod = sub_807A100(bank, 1) / 2;
    yMod = sub_807A100(bank, 0) / 4;

    x = Random() % xMod;
    y = Random() % yMod;

    if (Random() & 1)
        x *= -1;
    if (Random() & 1)
        y *= -1;

    if ((gBanksBySide[bank] & 1) == 0)
        y += 0xFFF0;

    sprite->pos1.x += x;
    sprite->pos1.y += y;

    sprite->data[0] = gBattleAnimArgs[1];
    sprite->data[7] = CreateSprite(&gBasicHitSplatSpriteTemplate, sprite->pos1.x, sprite->pos1.y, sprite->subpriority + 1);
    if (sprite->data[7] != 64)
    {
        StartSpriteAffineAnim(&gSprites[sprite->data[7]], 0);
        gSprites[sprite->data[7]].callback = SpriteCallbackDummy;
    }

    sprite->callback = sub_80D927C;
}

static void sub_80D927C(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        if (sprite->data[7] != 64)
        {
            FreeOamMatrix(gSprites[sprite->data[7]].oam.matrixNum);
            DestroySprite(&gSprites[sprite->data[7]]);
        }

        DestroyAnimSprite(sprite);
    }
    else
    {
        sprite->data[0]--;
    }
}

void sub_80D92D0(struct Sprite *sprite)
{
    sub_8078764(sprite, 1);
    sprite->data[0] = 30;

    if (gBattleAnimArgs[2] == 0)
    {
        sprite->data[2] = sprite->pos1.x - 20;
    }
    else
    {
        sprite->data[2] = sprite->pos1.x + 20;
        sprite->hFlip = 1;
    }

    sprite->data[4] = sprite->pos1.y - 20;
    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData(sprite, sub_80D9328);
}

static void sub_80D9328(struct Sprite *sprite)
{
    if (++sprite->data[5] == 11)
    {
        sprite->data[2] = sprite->pos1.x - sprite->pos2.x;
        sprite->data[4] = sprite->pos1.y - sprite->pos2.y;
        sprite->data[0] = 8;
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.y = 0;
        sprite->pos2.x = 0;

        sprite->callback = StartAnimLinearTranslation;
        StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    }
}

void sub_80D9378(struct Sprite *sprite)
{
    if ((gAnimBankAttacker ^ 2) == gAnimBankTarget && GetBattlerPosition(gAnimBankTarget) < 2)
        gBattleAnimArgs[0] *= -1;

    sub_8078764(sprite, 1);

    if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];

    sprite->data[0] = gBattleAnimArgs[3];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = sprite->pos1.x + gBattleAnimArgs[2];
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = sprite->pos1.y;

    InitAnimLinearTranslation(sprite);

    sprite->data[5] = gBattleAnimArgs[5];
    sprite->data[6] = gBattleAnimArgs[4];
    sprite->data[7] = 0;

    sprite->callback = sub_80D9404;
}

static void sub_80D9404(struct Sprite *sprite)
{
    if (!TranslateAnimLinear(sprite))
    {
        sprite->pos2.y += Sin(sprite->data[7] >> 8, sprite->data[5]);
        sprite->data[7] += sprite->data[6];
    }
    else
    {
        DestroyAnimSprite(sprite);
    }
}

// Animates the spinning, shrinking kick or punch, which then
// reappears at full size. Used by moves such as MOVE_MEGA_PUNCH and MOVE_MEGA_KICK.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: anim num
// arg 3: spin duration
void AnimSpinningKickOrPunch(struct Sprite *sprite)
{
    sub_8078764(sprite, 1);
    StartSpriteAnim(sprite, gBattleAnimArgs[2]);
    sprite->data[0] = gBattleAnimArgs[3];

    sprite->callback = WaitAnimForDuration;
    StoreSpriteCallbackInData(sprite, AnimSpinningKickOrPunchFinish);
}

static void AnimSpinningKickOrPunchFinish(struct Sprite *sprite)
{
    StartSpriteAffineAnim(sprite, 0);
    sprite->affineAnimPaused = 1;
    sprite->data[0] = 20;

    sprite->callback = WaitAnimForDuration;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

// Animates MOVE_STOMP's foot that slides downward.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: initial wait duration
void AnimStompFoot(struct Sprite *sprite)
{
    sub_8078764(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[2];

    sprite->callback = AnimStompFootStep;
}

static void AnimStompFootStep(struct Sprite *sprite)
{
    if (--sprite->data[0] == -1)
    {
        sprite->data[0] = 6;
        sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
        sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3);

        sprite->callback = StartAnimLinearTranslation;
        StoreSpriteCallbackInData(sprite, AnimStompFootEnd);
    }
}

static void AnimStompFootEnd(struct Sprite *sprite)
{
    sprite->data[0] = 15;

    sprite->callback = WaitAnimForDuration;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

void sub_80D9540(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        sub_8078764(sprite, 1);
        sprite->data[1] = gBattleAnimArgs[2];
        sprite->data[2] = gBattleAnimArgs[3];
        sprite->data[0]++;
    }
    else
    {
        sprite->data[4] += sprite->data[1];
        sprite->pos2.x = sprite->data[4] >> 8;
        sprite->pos2.y = Sin(sprite->data[3], sprite->data[2]);
        sprite->data[3] = (sprite->data[3] + 3) & 0xFF;

        if (sprite->data[3] > 100)
            sprite->invisible = sprite->data[3] % 2;

        if (sprite->data[3] > 120)
            DestroyAnimSprite(sprite);
    }
}

void sub_80D95D0(struct Sprite *sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 0);
        sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 1);
    }
    else
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankTarget, 0);
        sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankTarget, 1);
    }

    sprite->pos1.x += gBattleAnimArgs[1];
    sprite->pos1.y += gBattleAnimArgs[2];

    sprite->data[0] = 0;
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[2] = gBattleAnimArgs[4];
    sprite->data[3] = 0;
    sprite->callback = sub_80D9640;
}

static void sub_80D9640(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        if (--sprite->data[1] == 0)
        {
            if (sprite->data[2] == 0)
                DestroyAnimSprite(sprite);
            else
                sprite->data[0]++;
        }
        break;
    case 1:
        if (++sprite->data[1] > 1)
        {
            sprite->data[1] = 0;
            sprite->data[3]++;
            if (sprite->data[3] & 1)
                sprite->pos2.x = 2;
            else
                sprite->pos2.x = -2;
        }

        if (--sprite->data[2] == 0)
            DestroyAnimSprite(sprite);
        break;
    }
}

void sub_80D96B8(struct Sprite *sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 0) + gBattleAnimArgs[2];
        sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 1) + gBattleAnimArgs[3];
    }
    else
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankTarget, 0) + gBattleAnimArgs[2];
        sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankTarget, 1) + gBattleAnimArgs[3];
    }

    sprite->oam.tileNum += gBattleAnimArgs[1] * 16;
    sprite->data[0] = 0;

    switch (gBattleAnimArgs[1])
    {
    case 0:
        sprite->data[6] = -3;
        sprite->data[7] = -3;
        break;
    case 1:
        sprite->data[6] = 3;
        sprite->data[7] = -3;
        break;
    case 2:
        sprite->data[6] = -3;
        sprite->data[7] = 3;
        break;
    case 3:
        sprite->data[6] = 3;
        sprite->data[7] = 3;
        break;
    default:
        DestroyAnimSprite(sprite);
        return;
    }

    sprite->callback = sub_80D97A0;
}

static void sub_80D97A0(struct Sprite *sprite)
{
    sprite->pos1.x += sprite->data[6];
    sprite->pos1.y += sprite->data[7];

    if (++sprite->data[0] > 40)
        DestroyAnimSprite(sprite);
}

void sub_80D97CC(struct Sprite *sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gBankAttacker, 2);
        sprite->pos1.y = GetBattlerSpriteCoord(gBankAttacker, 3);
        sprite->oam.priority = sub_8079ED4(gAnimBankAttacker);
        sprite->data[7] = gAnimBankTarget;
    }
    else
    {
        sprite->oam.priority = sub_8079ED4(gAnimBankTarget);
        sprite->data[7] = gAnimBankAttacker;
    }

    sprite->data[0] = 0;
    sprite->data[1] = 12;
    sprite->data[2] = 8;
    sprite->callback = sub_80D986C;
}

static void sub_80D986C(struct Sprite *sprite)
{
    if (++sprite->data[0] == 180)
    {
        REG_BLDCNT = 0;

        sprite->data[0] = 16;
        sprite->data[1] = sprite->pos1.x;
        sprite->data[2] = GetBattlerSpriteCoord(sprite->data[7], 2);
        sprite->data[3] = sprite->pos1.y;
        sprite->data[4] = GetBattlerSpriteCoord(sprite->data[7], 3);

        InitAnimLinearTranslation(sprite);
        StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
        sprite->callback = TranslateAnimLinearUntil;
    }
}

void sub_80D98D8(struct Sprite *sprite)
{
    sprite->pos1.x = gBattleAnimArgs[0];
    sprite->pos1.y = 120;

    sprite->data[0] = gBattleAnimArgs[3];
    sub_8079BF4(&sprite->data[4], &sprite->data[5], (void *)(sprite->pos1.y << 8));

    sprite->data[6] = gBattleAnimArgs[1];
    sprite->oam.tileNum += gBattleAnimArgs[2] * 4;

    sprite->callback = sub_80D9934;
}

static void sub_80D9934(struct Sprite *sprite)
{
    void *var0;

    if (sprite->data[0] != 0)
    {
        var0 = sub_8079BFC(sprite->data[4], sprite->data[5]);
        var0 -= sprite->data[6];
        sub_8079BF4(&sprite->data[4], &sprite->data[5], var0);

        var0 = (void *)(((intptr_t)var0) >> 8);
        sprite->pos1.y = (intptr_t)var0;
        if (sprite->pos1.y < -8)
            DestroyAnimSprite(sprite);
        else
            sprite->data[0]--;
    }
    else
    {
        s16 pos0 = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
        s16 pos1 = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
        s16 pos2 = GetBattlerSpriteCoord(gAnimBankTarget, 2);
        s16 pos3 = GetBattlerSpriteCoord(gAnimBankTarget, 3);

        sprite->data[0] = pos2 - pos0;
        sprite->data[1] = pos3 - pos1;
        sprite->data[2] = sprite->pos1.x << 4;
        sprite->data[3] = sprite->pos1.y << 4;

        sprite->callback = sub_80D99F4;
    }
}

static void sub_80D99F4(struct Sprite *sprite)
{
    u16 edgeX;

    sprite->data[2] += sprite->data[0];
    sprite->data[3] += sprite->data[1];
    sprite->pos1.x = sprite->data[2] >> 4;
    sprite->pos1.y = sprite->data[3] >> 4;

    edgeX = sprite->pos1.x + 8;
    if (edgeX > 256 || sprite->pos1.y < -8 || sprite->pos1.y > 120)
        DestroyAnimSprite(sprite);
}

void sub_80D9A38(struct Sprite *sprite)
{
    u8 bank;

    if (gBattleAnimArgs[0] == 0)
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gBankAttacker, 2);
        sprite->pos1.y = GetBattlerSpriteCoord(gBankAttacker, 3);
        bank = gAnimBankTarget;
        sprite->oam.priority = sub_8079ED4(gAnimBankAttacker);
    }
    else
    {
        bank = gAnimBankAttacker;
        sprite->oam.priority = sub_8079ED4(gAnimBankTarget);
    }

    if (IsContest())
        sprite->oam.matrixNum |= 0x8;
    else if (GetBattlerSide(bank) == B_SIDE_PLAYER)
        sprite->oam.matrixNum |= 0x18;

    sprite->data[0] = 16;
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = GetBattlerSpriteCoord(bank, 2);
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = GetBattlerSpriteCoord(bank, 3);

    InitAnimLinearTranslation(sprite);
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    sprite->callback = TranslateAnimLinearUntil;
}

static void sub_80D9B24(struct Sprite *sprite)
{
    if (sprite->data[0] == sprite->data[4])
        DestroyAnimSprite(sprite);

    sprite->data[0]++;
}

void sub_80D9B48(struct Sprite *sprite)
{
    u8 turn;

    sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankTarget, 2);
    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankTarget, 3);
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[2] = gBattleAnimArgs[0];
    sprite->data[3] = gBattleAnimArgs[1];
    sprite->data[4] = gBattleAnimArgs[2];

    turn = gAnimMoveTurn;
    if (GetBattlerSide(gAnimBankTarget) == B_SIDE_PLAYER)
        turn++;

    if (turn & 1)
    {
        sprite->data[2] = -sprite->data[2];
        sprite->data[1]++;
    }

    StartSpriteAnim(sprite, sprite->data[1]);
    sprite->pos2.x = sprite->data[2];
    sprite->pos2.y = sprite->data[3];
    sprite->callback = sub_80D9B24;
}

void sub_80D9BD4(struct Sprite *sprite)
{
    if (gBattleAnimArgs[2] == 0)
        InitAnimSpritePos(sprite, 0);
    else
        sub_8078764(sprite, 0);

    if (IsContest())
    {
        StartSpriteAnim(sprite, 2);
    }
    else if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
    {
        StartSpriteAnim(sprite, 1);
    }

    sprite->callback = sub_8078600;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

void sub_80D9C40(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
    {
        sprite->data[1] = (sprite->data[1] + 40) & 0xFF;
        sprite->pos2.x = Sin(sprite->data[1], 2);

        if (++sprite->data[0] > 40)
        {
            DestroyAnimSprite(sprite);
        }
    }
}

void sub_80D9C80(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        sub_80789D4(0);
        task->data[8] = gBattleAnimArgs[0];
        task->data[0]++;
        break;
    case 1:
        if (--task->data[8] == -1)
            task->data[0]++;
        break;
    case 2:
    default:
        task->data[9] += 1280;
        break;
    }

    task->data[10] += 2816;

    if (GetBattlerSide(gAnimBankTarget) == B_SIDE_PLAYER)
        gBattle_BG3_X += task->data[9] >> 8;
    else
        gBattle_BG3_X -= task->data[9] >> 8;

    gBattle_BG3_Y += task->data[10] >> 8;

    task->data[9] &= 0xFF;
    task->data[10] &= 0xFF;

    if (gBattleAnimArgs[7] == -1)
    {
        gBattle_BG3_X = 0;
        gBattle_BG3_Y = 0;
        sub_80789D4(1);
        DestroyAnimVisualTask(taskId);
    }
}
