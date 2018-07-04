#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "blend_palette.h"
#include "decompress.h"
#include "ewram.h"
#include "palette.h"
#include "random.h"
#include "rom_8077ABC.h"
#include "sound.h"
#include "task.h"
#include "trig.h"
#include "constants/battle_constants.h"
#include "constants/songs.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern u8 gHealthboxIDs[];
extern u8 gBattlersCount;
extern u8 gBankSpriteIds[];
extern u8 gBattleTerrain;
extern u16 gBattlerPartyIndexes[];
extern u8 gBankTarget;
extern u8 gEffectBank;
extern u8 gBankAttacker;
extern u8 gAnimVisualTaskCount;

extern const u8 gUnknown_08D20A14[];
extern const u8 gUnknown_08D20A30[];
extern const u8 gBattleStatMask1_Tilemap[];
extern const u8 gBattleStatMask2_Tilemap[];
extern const u8 gBattleStatMask_Gfx[];
extern const u16 gBattleStatMask1_Pal[];
extern const u16 gBattleStatMask2_Pal[];
extern const u16 gBattleStatMask3_Pal[];
extern const u16 gBattleStatMask4_Pal[];
extern const u16 gBattleStatMask5_Pal[];
extern const u16 gBattleStatMask6_Pal[];
extern const u16 gBattleStatMask7_Pal[];
extern const u16 gBattleStatMask8_Pal[];

extern void sub_80DA48C(struct Sprite *);

static void AnimConfusionDuck(struct Sprite *sprite);
static void AnimSimplePaletteBlend(struct Sprite *sprite);
static void sub_80E1E2C(struct Sprite *sprite);
static void sub_80E1F3C(struct Sprite *sprite);
static void sub_80E24B8(struct Sprite *sprite);
static void sub_80E27A0(struct Sprite *sprite);
static void sub_80E2838(struct Sprite *sprite);
static void sub_80E2870(struct Sprite *sprite);
static void sub_80E2908(struct Sprite *sprite);
static void sub_80E2978(struct Sprite *sprite);
static void sub_80E29C0(struct Sprite *sprite);
static void sub_80E27E8(struct Sprite *sprite);
static void AnimConfusionDuckStep(struct Sprite *sprite);
static u32 UnpackSelectedBattleAnimPalettes(s16);
static void AnimSimplePaletteBlendStep(struct Sprite *sprite);
static void sub_80E1E80(struct Sprite *sprite);
static void sub_80E1F0C(struct Sprite *sprite);
static void sub_80E1FDC(u8, u8, u8);
static void sub_80E202C(u8 taskId);
static void sub_80E20E4(u8, u8, u8);
static void sub_80E2140(u8 taskId);
static void sub_80E2214(u8 taskId);
static void sub_80E22CC(u8 taskId);
static void sub_80E260C(void);
static void sub_80E255C(struct Sprite *sprite);
static void sub_80E2710(u8 taskId);
static void sub_80E29FC(struct Sprite *sprite);
static void sub_80E2C8C(u8 taskId, u32 selectedPalettes);
static void sub_80E2CD0(u8 taskId);
static void sub_80E2DB8(u8 taskId);
static void sub_80E2E10(u8 taskId);
static void sub_80E2EE8(struct Sprite *sprite);
static void sub_80E3194(u8 taskId);
static void sub_80E3338(u8 taskId);
static void sub_80E3704(u8 taskId);
static void sub_80E38F8(u8 taskId);
static void sub_80E39BC(u32, u16);
static void sub_80E3AD0(u8 taskId);
static void sub_80E3E64(u8 taskId);
static void sub_80E4368(u8 taskId);

const union AnimCmd gConfusionDuckSpriteAnim1[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(4, 8),
    ANIMCMD_FRAME(0, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(8, 8),
    ANIMCMD_JUMP(0),
};

const union AnimCmd gConfusionDuckSpriteAnim2[] =
{
    ANIMCMD_FRAME(0, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(4, 8),
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(8, 8),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gConfusionDuckSpriteAnimTable[] =
{
    gConfusionDuckSpriteAnim1,
    gConfusionDuckSpriteAnim2,
};

const struct SpriteTemplate gConfusionDuckSpriteTemplate =
{
    .tileTag = 10073,
    .paletteTag = 10073,
    .oam = &gOamData_837DF2C,
    .anims = gConfusionDuckSpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimConfusionDuck,
};

const struct SpriteTemplate gSimplePaletteBlendSpriteTemplate =
{
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &gDummyOamData,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSimplePaletteBlend,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB3DC =
{
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &gDummyOamData,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80E1E2C,
};

const union AnimCmd gSpriteAnim_83DB3F4[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(16, 3),
    ANIMCMD_FRAME(32, 3),
    ANIMCMD_FRAME(48, 3),
    ANIMCMD_FRAME(64, 3),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_83DB40C[] =
{
    gSpriteAnim_83DB3F4,
};

const struct SpriteTemplate gSpriteTemplate_83DB410 =
{
    .tileTag = 10071,
    .paletteTag = 10071,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83DB40C,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80E1F3C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB428 =
{
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &gDummyOamData,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80E24B8,
};

const union AffineAnimCmd gSpriteAffineAnim_83DB440[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 8),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83DB450[] =
{
    AFFINEANIMCMD_FRAME(0xD8, 0xD8, 0, 0),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 8),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83DB468[] =
{
    AFFINEANIMCMD_FRAME(0xB0, 0xB0, 0, 0),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 8),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83DB480[] =
{
    AFFINEANIMCMD_FRAME(0x80, 0x80, 0, 0),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 8),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DB498[] =
{
    gSpriteAffineAnim_83DB440,
    gSpriteAffineAnim_83DB450,
    gSpriteAffineAnim_83DB468,
    gSpriteAffineAnim_83DB480,
};

const struct SpriteTemplate gBasicHitSplatSpriteTemplate =
{
    .tileTag = 10135,
    .paletteTag = 10135,
    .oam = &gOamData_837E0B4,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DB498,
    .callback = sub_80E27A0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB4C0 =
{
    .tileTag = 10135,
    .paletteTag = 10135,
    .oam = &gOamData_837E0B4,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DB498,
    .callback = sub_80E2838,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB4D8 =
{
    .tileTag = 10148,
    .paletteTag = 10148,
    .oam = &gOamData_837E0B4,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DB498,
    .callback = sub_80E27A0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB4F0 =
{
    .tileTag = 10135,
    .paletteTag = 10135,
    .oam = &gOamData_837E0B4,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DB498,
    .callback = sub_80E2870,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB508 =
{
    .tileTag = 10135,
    .paletteTag = 10135,
    .oam = &gOamData_837E0B4,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DB498,
    .callback = sub_80E2908,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB520 =
{
    .tileTag = 10285,
    .paletteTag = 10285,
    .oam = &gOamData_837E054,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80E2978,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB538 =
{
    .tileTag = 10135,
    .paletteTag = 10135,
    .oam = &gOamData_837DF94,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DB498,
    .callback = sub_80E29C0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB550 =
{
    .tileTag = 10135,
    .paletteTag = 10135,
    .oam = &gOamData_837E0B4,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DB498,
    .callback = sub_80E27E8,
};

const u16 gUnknown_083DB568 = RGB(31, 31, 31);

// Moves a spinning duck around the mon's head.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: initial wave offset
// arg 3: wave period (higher means faster wave)
// arg 4: duration
static void AnimConfusionDuck(struct Sprite *sprite)
{
    sprite->pos1.x += gBattleAnimArgs[0];
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[2];
    if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
    {
        sprite->data[1] = -gBattleAnimArgs[3];
        sprite->data[4] = 1;
    }
    else
    {
        sprite->data[1] = gBattleAnimArgs[3];
        sprite->data[4] = 0;
        StartSpriteAnim(sprite, 1);
    }

    sprite->data[3] = gBattleAnimArgs[4];
    sprite->callback = AnimConfusionDuckStep;
    sprite->callback(sprite);
}

static void AnimConfusionDuckStep(struct Sprite *sprite)
{
    sprite->pos2.x = Cos(sprite->data[0], 30);
    sprite->pos2.y = Sin(sprite->data[0], 10);

    if ((u16)sprite->data[0] < 128)
        sprite->oam.priority = 1;
    else
        sprite->oam.priority = 3;

    sprite->data[0] = (sprite->data[0] + sprite->data[1]) & 0xFF;
    if (++sprite->data[2] == sprite->data[3])
        DestroyAnimSprite(sprite);
}

// Performs a simple color blend on a specified sprite.
// arg 0: palette selector
// arg 1: delay
// arg 2: start blend amount
// arg 3: end blend amount
// arg 4: blend color
static void AnimSimplePaletteBlend(struct Sprite *sprite)
{
    u32 selectedPalettes = UnpackSelectedBattleAnimPalettes(gBattleAnimArgs[0]);
    BeginNormalPaletteFade(selectedPalettes, gBattleAnimArgs[1], gBattleAnimArgs[2], gBattleAnimArgs[3], gBattleAnimArgs[4]);
    sprite->invisible = 1;
    sprite->callback = AnimSimplePaletteBlendStep;
}

// Unpacks a bitfield and returns a bitmask of its selected palettes.
// Bits 0-6 of the selector parameter result in the following palettes being selected:
//   0: battle background palettes (BG palettes 1, 2, and 3)
//   1: gAnimBankAttacker OBJ palette
//   2: gAnimBankTarget OBJ palette
//   3: gAnimBankAttacker partner OBJ palette
//   4: gAnimBankTarget partner OBJ palette
//   5: BG palette 4
//   6: BG palette 5
static u32 UnpackSelectedBattleAnimPalettes(s16 selector)
{
    u8 arg0 = selector & 1;
    u8 arg1 = (selector >> 1) & 1;
    u8 arg2 = (selector >> 2) & 1;
    u8 arg3 = (selector >> 3) & 1;
    u8 arg4 = (selector >> 4) & 1;
    u8 arg5 = (selector >> 5) & 1;
    u8 arg6 = (selector >> 6) & 1;
    return sub_80791A8(arg0, arg1, arg2, arg3, arg4, arg5, arg6);
}

static void AnimSimplePaletteBlendStep(struct Sprite *sprite)
{
    if (!gPaletteFade.active)
        DestroyAnimSprite(sprite);
}

static void sub_80E1E2C(struct Sprite *sprite)
{
    u32 selectedPalettes;

    sprite->data[0] = gBattleAnimArgs[1];
    sprite->data[1] = gBattleAnimArgs[1];
    sprite->data[2] = gBattleAnimArgs[2];
    sprite->data[3] = gBattleAnimArgs[3];
    sprite->data[4] = gBattleAnimArgs[4];
    sprite->data[5] = gBattleAnimArgs[5];
    sprite->data[6] = gBattleAnimArgs[6];
    sprite->data[7] = gBattleAnimArgs[0];

    selectedPalettes = UnpackSelectedBattleAnimPalettes(sprite->data[7]);
    BlendPalettes(selectedPalettes, gBattleAnimArgs[4], gBattleAnimArgs[3]);
    sprite->invisible = 1;
    sprite->callback = sub_80E1E80;
}

static void sub_80E1E80(struct Sprite *sprite)
{
    u32 selectedPalettes;

    if (sprite->data[0] > 0)
    {
        sprite->data[0]--;
        return;
    }

    if (gPaletteFade.active)
        return;

    if (sprite->data[2] == 0)
    {
        sprite->callback = sub_80E1F0C;
        return;
    }

    selectedPalettes = UnpackSelectedBattleAnimPalettes(sprite->data[7]);
    if (sprite->data[1] & 0x100)
        BlendPalettes(selectedPalettes, sprite->data[4], sprite->data[3]);
    else
        BlendPalettes(selectedPalettes, sprite->data[6], sprite->data[5]);

    sprite->data[1] ^= 0x100;
    sprite->data[0] = sprite->data[1] & 0xFF;
    sprite->data[2]--;
}

static void sub_80E1F0C(struct Sprite *sprite)
{
    u32 selectedPalettes;

    if (!gPaletteFade.active)
    {
        selectedPalettes = UnpackSelectedBattleAnimPalettes(sprite->data[7]);
        BlendPalettes(selectedPalettes, 0, 0);
        DestroyAnimSprite(sprite);
    }
}

static void sub_80E1F3C(struct Sprite *sprite)
{
    sprite->pos1.x += gBattleAnimArgs[0];
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = 0;
    sprite->data[1] = 10;
    sprite->data[2] = 8;
    sprite->data[3] = 40;
    sprite->data[4] = 112;
    sprite->data[5] = 0;
    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
    sprite->callback = sub_8078174;
    sprite->callback(sprite);
}

void sub_80E1F8C(u8 taskId)
{
    gTasks[taskId].data[0] = gBattleAnimArgs[0];
    gTasks[taskId].data[1] = gBattleAnimArgs[1];
    gTasks[taskId].data[2] = gBattleAnimArgs[2];
    gTasks[taskId].data[3] = gBattleAnimArgs[3];
    gTasks[taskId].data[4] = gBattleAnimArgs[4];
    gTasks[taskId].data[5] = gBattleAnimArgs[5];
    gTasks[taskId].data[8] = 0;
    sub_80E1FDC(taskId, 0, gTasks[taskId].data[4]);
    gTasks[taskId].func = sub_80E202C;
}

static void sub_80E1FDC(u8 taskId, u8 initialBlendAmount, u8 targetBlendAmount)
{
    u32 selectedPalettes = UnpackSelectedBattleAnimPalettes(gTasks[taskId].data[0]);
    BeginNormalPaletteFade(
        selectedPalettes,
        gTasks[taskId].data[1],
        initialBlendAmount,
        targetBlendAmount,
        gTasks[taskId].data[5]);

    gTasks[taskId].data[2]--;
    gTasks[taskId].data[8] ^= 1;
}

static void sub_80E202C(u8 taskId)
{
    u8 initialBlendAmount, targetBlendAmount;
    if (!gPaletteFade.active)
    {
        if (gTasks[taskId].data[2] > 0)
        {
            if (gTasks[taskId].data[8] == 0)
            {
                initialBlendAmount = gTasks[taskId].data[3];
                targetBlendAmount = gTasks[taskId].data[4];
            }
            else
            {
                initialBlendAmount = gTasks[taskId].data[4];
                targetBlendAmount = gTasks[taskId].data[3];
            }

            if (gTasks[taskId].data[2] == 1)
                targetBlendAmount = 0;

            sub_80E1FDC(taskId, initialBlendAmount, targetBlendAmount);
        }
        else
        {
            DestroyAnimVisualTask(taskId);
        }
    }
}

void sub_80E2094(u8 taskId)
{
    gTasks[taskId].data[0] = gBattleAnimArgs[0];
    gTasks[taskId].data[1] = gBattleAnimArgs[1];
    gTasks[taskId].data[2] = gBattleAnimArgs[2];
    gTasks[taskId].data[3] = gBattleAnimArgs[3];
    gTasks[taskId].data[4] = gBattleAnimArgs[4];
    gTasks[taskId].data[5] = gBattleAnimArgs[5];
    gTasks[taskId].data[8] = 0;
    sub_80E20E4(taskId, 0, gTasks[taskId].data[4]);
    gTasks[taskId].func = sub_80E2140;
}

static void sub_80E20E4(u8 taskId, u8 initialBlendAmount, u8 targetBlendAmount)
{
    u8 paletteIndex = IndexOfSpritePaletteTag(gTasks[taskId].data[0]);
    BeginNormalPaletteFade(
        1 << (paletteIndex + 16),
        gTasks[taskId].data[1],
        initialBlendAmount,
        targetBlendAmount,
        gTasks[taskId].data[5]);

    gTasks[taskId].data[2]--;
    gTasks[taskId].data[8] ^= 1;
}

static void sub_80E2140(u8 taskId)
{
    u8 initialBlendAmount, targetBlendAmount;
    if (!gPaletteFade.active)
    {
        if (gTasks[taskId].data[2] > 0)
        {
            if (gTasks[taskId].data[8] == 0)
            {
                initialBlendAmount = gTasks[taskId].data[3];
                targetBlendAmount = gTasks[taskId].data[4];
            }
            else
            {
                initialBlendAmount = gTasks[taskId].data[4];
                targetBlendAmount = gTasks[taskId].data[3];
            }

            if (gTasks[taskId].data[2] == 1)
                targetBlendAmount = 0;

            sub_80E20E4(taskId, initialBlendAmount, targetBlendAmount);
        }
        else
        {
            DestroyAnimVisualTask(taskId);
        }
    }
}

void sub_80E21A8(u8 taskId)
{
    u8 paletteIndex;

    gTasks[taskId].data[0] = gBattleAnimArgs[1];
    gTasks[taskId].data[1] = gBattleAnimArgs[1];
    gTasks[taskId].data[2] = gBattleAnimArgs[2];
    gTasks[taskId].data[3] = gBattleAnimArgs[3];
    gTasks[taskId].data[4] = gBattleAnimArgs[4];
    gTasks[taskId].data[5] = gBattleAnimArgs[5];
    gTasks[taskId].data[6] = gBattleAnimArgs[6];
    gTasks[taskId].data[7] = gBattleAnimArgs[0];

    paletteIndex = IndexOfSpritePaletteTag(gBattleAnimArgs[0]);
    BeginNormalPaletteFade(
        1 << (paletteIndex + 16),
        0,
        gBattleAnimArgs[4],
        gBattleAnimArgs[4],
        gBattleAnimArgs[3]);

    gTasks[taskId].func = sub_80E2214;
}

static void sub_80E2214(u8 taskId)
{
    u32 selectedPalettes;

    if (gTasks[taskId].data[0] > 0)
    {
        gTasks[taskId].data[0]--;
        return;
    }

    if (gPaletteFade.active)
        return;

    if (gTasks[taskId].data[2] == 0)
    {
        gTasks[taskId].func = sub_80E22CC;
        return;
    }

    selectedPalettes = 1 << (IndexOfSpritePaletteTag(gTasks[taskId].data[7]) + 16);
    if (gTasks[taskId].data[1] & 0x100)
    {
        BeginNormalPaletteFade(
            selectedPalettes,
            0,
            gTasks[taskId].data[4],
            gTasks[taskId].data[4],
            gTasks[taskId].data[3]);
    }
    else
    {
        BeginNormalPaletteFade(
            selectedPalettes,
            0,
            gTasks[taskId].data[6],
            gTasks[taskId].data[6],
            gTasks[taskId].data[5]);
    }

    gTasks[taskId].data[1] ^= 0x100;
    gTasks[taskId].data[0] = gTasks[taskId].data[1] & 0xFF;
    gTasks[taskId].data[2]--;
}

static void sub_80E22CC(u8 taskId)
{
    u32 selectedPalettes;

    if (!gPaletteFade.active)
    {
        selectedPalettes = 1 << (IndexOfSpritePaletteTag(gTasks[taskId].data[7]) + 16);
        BeginNormalPaletteFade(selectedPalettes, 0, 0, 0, RGB(0, 0, 0));
        DestroyAnimVisualTask(taskId);
    }
}

void sub_80E2324(u8 taskId)
{
    u32 selectedPalettes = 0;
    u8 attackerBattler = gAnimBankAttacker;
    u8 targetBattler = gAnimBankTarget;

    if (gBattleAnimArgs[0] & 0x100)
        selectedPalettes = sub_80791A8(1, 0, 0, 0, 0, 0, 0);

    if (gBattleAnimArgs[1] & 0x100)
        selectedPalettes |= (0x10000 << attackerBattler);

    if (gBattleAnimArgs[2] & 0x100)
        selectedPalettes |= (0x10000 << targetBattler);

    InvertPlttBuffer(selectedPalettes);
    DestroyAnimVisualTask(taskId);
}

void unref_sub_80E23A8(u8 taskId)
{
    u8 attackerBattler;
    u8 targetBattler;
    u8 paletteIndex;
    u32 selectedPalettes = 0;

    if (gTasks[taskId].data[0] == 0)
    {
        gTasks[taskId].data[2] = gBattleAnimArgs[0];
        gTasks[taskId].data[3] = gBattleAnimArgs[1];
        gTasks[taskId].data[4] = gBattleAnimArgs[2];
        gTasks[taskId].data[1] = gBattleAnimArgs[3];
        gTasks[taskId].data[5] = gBattleAnimArgs[4];
        gTasks[taskId].data[6] = gBattleAnimArgs[5];
        gTasks[taskId].data[7] = gBattleAnimArgs[6];
    }

    gTasks[taskId].data[0]++;
    attackerBattler = gAnimBankAttacker;
    targetBattler = gAnimBankTarget;

    if (gTasks[taskId].data[2] & 0x100)
        selectedPalettes = 0x0000FFFF;

    if (gTasks[taskId].data[2] & 0x1)
    {
        paletteIndex = IndexOfSpritePaletteTag(gSprites[gHealthboxIDs[attackerBattler]].template->paletteTag);
        selectedPalettes |= ((1 << paletteIndex) << 16);
    }
    
    if (gTasks[taskId].data[3] & 0x100)
        selectedPalettes |= ((1 << attackerBattler) << 16);

    if (gTasks[taskId].data[4] & 0x100)
        selectedPalettes |= ((1 << targetBattler) << 16);

    TintPlttBuffer(selectedPalettes, gTasks[taskId].data[5], gTasks[taskId].data[6], gTasks[taskId].data[7]);
    if (gTasks[taskId].data[0] == gTasks[taskId].data[1])
    {
        UnfadePlttBuffer(selectedPalettes);
        DestroyAnimVisualTask(taskId);
    }
}

static void sub_80E24B8(struct Sprite *sprite)
{
    u16 var0;

    sprite->invisible = 1;
    sprite->data[0] = -gBattleAnimArgs[0];
    sprite->data[1] = gBattleAnimArgs[1];
    sprite->data[2] = gBattleAnimArgs[1];
    sprite->data[3] = gBattleAnimArgs[2];

    switch (gBattleAnimArgs[3])
    {
    case 0:
        StoreSpriteCallbackInData(sprite, (void *)&gBattle_BG3_X);
        break;
    case 1:
        StoreSpriteCallbackInData(sprite, (void *)&gBattle_BG3_Y);
        break;
    case 2:
        StoreSpriteCallbackInData(sprite, (void *)&gSpriteCoordOffsetX);
        break;
    default:
        StoreSpriteCallbackInData(sprite, (void *)&gSpriteCoordOffsetY);
        break;
    }

    sprite->data[4] = *(u32 *)(sprite->data[6] | (sprite->data[7] << 16));
    sprite->data[5] = gBattleAnimArgs[3];
    var0 = sprite->data[5] - 2;
    if (var0 < 2)
        sub_80E260C();

    sprite->callback = sub_80E255C;
}

static void sub_80E255C(struct Sprite *sprite)
{
    u8 i;
    u16 var0;

    if (sprite->data[3] > 0)
    {
        sprite->data[3]--;
        if (sprite->data[1] > 0)
        {
            sprite->data[1]--;
        }
        else
        {
            sprite->data[1] = sprite->data[2];
            *(u32 *)(sprite->data[6] | (sprite->data[7] << 16)) += sprite->data[0];
            sprite->data[0] = -sprite->data[0];
        }
    }
    else
    {
        *(u32 *)(sprite->data[6] | (sprite->data[7] << 16)) = sprite->data[4];
        var0 = sprite->data[5] - 2;
        if (var0 < 2)
        {
            for (i = 0; i < gBattlersCount; i++)
                gSprites[gBankSpriteIds[i]].coordOffsetEnabled = 0;
        }

        DestroyAnimSprite(sprite);
    }
}

static void sub_80E260C(void)
{
    gSprites[gBankSpriteIds[gAnimBankAttacker]].coordOffsetEnabled = 0;
    gSprites[gBankSpriteIds[gAnimBankTarget]].coordOffsetEnabled = 0;

    if (gBattleAnimArgs[4] == 2)
    {
        gSprites[gBankSpriteIds[gAnimBankAttacker]].coordOffsetEnabled = 1;
        gSprites[gBankSpriteIds[gAnimBankTarget]].coordOffsetEnabled = 1;
    }
    else
    {
        if (gBattleAnimArgs[4] == 0)
            gSprites[gBankSpriteIds[gAnimBankAttacker]].coordOffsetEnabled = 1;
        else
            gSprites[gBankSpriteIds[gAnimBankTarget]].coordOffsetEnabled = 1;
    }
}

void sub_80E26BC(u8 taskId)
{
    gTasks[taskId].data[0] = gBattleAnimArgs[0];
    gTasks[taskId].data[1] = gBattleAnimArgs[1];
    gTasks[taskId].data[2] = gBattleAnimArgs[2];
    gTasks[taskId].data[3] = gBattleAnimArgs[3];
    gTasks[taskId].data[8] = gBattleAnimArgs[3];
    gBattle_BG3_X = gBattleAnimArgs[0];
    gBattle_BG3_Y = gBattleAnimArgs[1];
    gTasks[taskId].func = sub_80E2710;
    gTasks[taskId].func(taskId);
}

static void sub_80E2710(u8 taskId)
{
    if (gTasks[taskId].data[3] == 0)
    {
        if (gBattle_BG3_X == gTasks[taskId].data[0])
            gBattle_BG3_X = -gTasks[taskId].data[0];
        else
            gBattle_BG3_X = gTasks[taskId].data[0];

        if (gBattle_BG3_Y == -gTasks[taskId].data[1])
            gBattle_BG3_Y = 0;
        else
            gBattle_BG3_Y = -gTasks[taskId].data[1];

        gTasks[taskId].data[3] = gTasks[taskId].data[8];
        if (--gTasks[taskId].data[2] == 0)
        {
            gBattle_BG3_X = 0;
            gBattle_BG3_Y = 0;
            DestroyAnimVisualTask(taskId);
        }
    }
    else
    {
        gTasks[taskId].data[3]--;
    }
}

static void sub_80E27A0(struct Sprite *sprite)
{
    StartSpriteAffineAnim(sprite, gBattleAnimArgs[3]);
    if (gBattleAnimArgs[2] == 0)
        InitAnimSpritePos(sprite, 1);
    else
        sub_8078764(sprite, 1);

    sprite->callback = sub_80785E4;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

static void sub_80E27E8(struct Sprite *sprite)
{
    StartSpriteAffineAnim(sprite, gBattleAnimArgs[3]);
    if (gBattleAnimArgs[2] == 0)
        InitAnimSpritePos(sprite, 1);
    else
        sub_8078764(sprite, 1);

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->callback = sub_80785E4;
    StoreSpriteCallbackInData(sprite, sub_80DA48C);
}

static void sub_80E2838(struct Sprite *sprite)
{
    if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER && !IsContest())
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
    
    sub_80E27A0(sprite);
}

static void sub_80E2870(struct Sprite *sprite)
{
    if (gBattleAnimArgs[1] == -1)
        gBattleAnimArgs[1] = Random() & 3;

    StartSpriteAffineAnim(sprite, gBattleAnimArgs[1]);
    if (gBattleAnimArgs[0] == 0)
        InitAnimSpritePos(sprite, 0);
    else
        sub_8078764(sprite, 0);

    sprite->pos2.x += (Random() % 48) - 24;
    sprite->pos2.y += (Random() % 24) - 12;

    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
    sprite->callback = sub_80785E4;
}

static void sub_80E2908(struct Sprite *sprite)
{
    sprite->data[0] = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);
    sprite->pos1.x = gSprites[sprite->data[0]].pos1.x + gSprites[sprite->data[0]].pos2.x;
    sprite->pos1.y = gSprites[sprite->data[0]].pos1.y + gSprites[sprite->data[0]].pos2.y;
    sprite->pos2.x = gBattleAnimArgs[1];
    sprite->pos2.y = gBattleAnimArgs[2];
    StartSpriteAffineAnim(sprite, gBattleAnimArgs[3]);
    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
    sprite->callback = sub_80785E4;
}

static void sub_80E2978(struct Sprite *sprite)
{
    if (gBattleAnimArgs[2] == 0)
        InitAnimSpritePos(sprite, 1);
    else
        sub_8078764(sprite, 1);

    sprite->data[0] = gBattleAnimArgs[3];
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    sprite->callback = WaitAnimForDuration;
}

static void sub_80E29C0(struct Sprite *sprite)
{
    StartSpriteAffineAnim(sprite, gBattleAnimArgs[3]);
    if (gBattleAnimArgs[2] == 0)
        InitAnimSpritePos(sprite, 1);
    else
        sub_8078764(sprite, 1);

    sprite->callback = sub_80E29FC;
}

static void sub_80E29FC(struct Sprite *sprite)
{
    sprite->invisible ^= 1;
    if (sprite->data[0]++ > 12)
        DestroyAnimSprite(sprite);
}

void sub_80E2A38(u8 taskId)
{
    u32 selectedPalettes = UnpackSelectedBattleAnimPalettes(gBattleAnimArgs[0]);
    selectedPalettes |= sub_80792C0(
        (gBattleAnimArgs[0] >> 7)  & 1,
        (gBattleAnimArgs[0] >> 8)  & 1,
        (gBattleAnimArgs[0] >> 9)  & 1,
        (gBattleAnimArgs[0] >> 10) & 1);

    sub_80E2C8C(taskId, selectedPalettes);
}

void sub_80E2A7C(u8 taskId)
{
    u8 battler;
    u32 selectedPalettes;
    u8 sp[2];

    sp[1] = 0xFF;
    selectedPalettes = UnpackSelectedBattleAnimPalettes(1);
    switch (gBattleAnimArgs[0])
    {
    case 2:
        selectedPalettes = 0;
        // fall through
    case 0:
        sp[0] = gAnimBankAttacker;
        break;
    case 3:
        selectedPalettes = 0;
        // fall through
    case 1:
        sp[0] = gAnimBankTarget;
        break;
    case 4:
        sp[0] = gAnimBankAttacker;
        sp[1] = gAnimBankTarget;
        break;
    case 5:
        sp[0] = 0xFF;
        break;
    case 6:
        selectedPalettes = 0;
        sp[0] = gAnimBankAttacker ^ 2;
        break;
    case 7:
        selectedPalettes = 0;
        sp[0] = gAnimBankTarget ^ 2;
        break;
    }

    for (battler = 0; battler < 4; battler++)
    {
        if (battler != sp[0] && battler != sp[1] && IsAnimBankSpriteVisible(battler))
        {
            u8 paletteIndex = sub_80793A8(battler);
            selectedPalettes |= (0x10000 << paletteIndex);
        }
    }

    sub_80E2C8C(taskId, selectedPalettes);
}

void sub_80E2B74(u8 taskId)
{
    u32 selectedPalettes = UnpackSelectedBattleAnimPalettes(gBattleAnimArgs[0]);

    switch (gBattleTerrain)
    {
    case BATTLE_TERRAIN_GRASS:
        gBattleAnimArgs[4] = 0x0B0C;
        break;
    case BATTLE_TERRAIN_LONG_GRASS:
        gBattleAnimArgs[4] = 0x09E0;
        break;
    case BATTLE_TERRAIN_SAND:
        gBattleAnimArgs[4] = 0x2F1E;
        break;
    case BATTLE_TERRAIN_UNDERWATER:
        gBattleAnimArgs[4] = 0x4800;
        break;
    case BATTLE_TERRAIN_WATER:
        gBattleAnimArgs[4] = 0x7ECB;
        break;
    case BATTLE_TERRAIN_POND:
        gBattleAnimArgs[4] = 0x7ECB;
        break;
    case BATTLE_TERRAIN_MOUNTAIN:
        gBattleAnimArgs[4] = 0x2A16;
        break;
    case BATTLE_TERRAIN_CAVE:
        gBattleAnimArgs[4] = 0x0D2E;
        break;
    case BATTLE_TERRAIN_BUILDING:
        gBattleAnimArgs[4] = 0x7FFF;
        break;
    case BATTLE_TERRAIN_PLAIN:
        gBattleAnimArgs[4] = 0x7FFF;
        break;
    }

    sub_80E2C8C(taskId, selectedPalettes);
}

void sub_80E2C60(u8 taskId)
{
    u8 paletteIndex = IndexOfSpritePaletteTag(gBattleAnimArgs[0]);
    sub_80E2C8C(taskId, 1 << (paletteIndex + 16));
}

static void sub_80E2C8C(u8 taskId, u32 selectedPalettes)
{
    gTasks[taskId].data[0] = selectedPalettes;
    gTasks[taskId].data[1] = selectedPalettes >> 16;
    gTasks[taskId].data[2] = gBattleAnimArgs[1];
    gTasks[taskId].data[3] = gBattleAnimArgs[2];
    gTasks[taskId].data[4] = gBattleAnimArgs[3];
    gTasks[taskId].data[5] = gBattleAnimArgs[4];
    gTasks[taskId].data[10] = gBattleAnimArgs[2];
    gTasks[taskId].func = sub_80E2CD0;
    gTasks[taskId].func(taskId);
}

static void sub_80E2CD0(u8 taskId)
{
    u32 selectedPalettes;
    u16 singlePaletteMask = 0;

    if (gTasks[taskId].data[9] == gTasks[taskId].data[2])
    {
        gTasks[taskId].data[9] = 0;
        selectedPalettes = gTasks[taskId].data[0] | (gTasks[taskId].data[1] << 16);
        while (selectedPalettes != 0)
        {
            if (selectedPalettes & 1)
                BlendPalette(singlePaletteMask, 16, gTasks[taskId].data[10], gTasks[taskId].data[5]);
            singlePaletteMask += 0x10;
            selectedPalettes >>= 1;
        }

        if (gTasks[taskId].data[10] < gTasks[taskId].data[4])
            gTasks[taskId].data[10]++;
        else if (gTasks[taskId].data[10] > gTasks[taskId].data[4])
            gTasks[taskId].data[10]--;
        else
            DestroyAnimVisualTask(taskId);
    }
    else
    {
        gTasks[taskId].data[9]++;
    }
}

void sub_80E2D78(u8 taskId)
{
    BeginHardwarePaletteFade(
        gBattleAnimArgs[0],
        gBattleAnimArgs[1],
        gBattleAnimArgs[2],
        gBattleAnimArgs[3],
        gBattleAnimArgs[4]);

    gTasks[taskId].func = sub_80E2DB8;
}

static void sub_80E2DB8(u8 taskId)
{
    if (!gPaletteFade.active)
        DestroyAnimVisualTask(taskId);
}

void sub_80E2DD8(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    task->data[0] = gBattleAnimArgs[0];
    task->data[1] = 0;
    task->data[2] = gBattleAnimArgs[1];
    task->data[3] = gBattleAnimArgs[2];
    task->data[4] = gBattleAnimArgs[3];
    task->data[5] = 0;
    task->func = sub_80E2E10;
}

static void sub_80E2E10(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (task->data[4])
    {
        if (task->data[1])
        {
            task->data[1]--;
        }
        else
        {
            task->data[6] = duplicate_obj_of_side_rel2move_in_transparent_mode(task->data[0]);
            if (task->data[6] >= 0)
            {
                gSprites[task->data[6]].oam.priority = task->data[0] ? 1 : 2;
                gSprites[task->data[6]].data[0] = task->data[3];
                gSprites[task->data[6]].data[1] = taskId;
                gSprites[task->data[6]].data[2] = 5;
                gSprites[task->data[6]].callback = sub_80E2EE8;
                task->data[5]++;
            }

            task->data[4]--;
            task->data[1] = task->data[2];
        }
    }
    else if (task->data[5] == 0)
    {
        DestroyAnimVisualTask(taskId);
    }
}

static void sub_80E2EE8(struct Sprite *sprite)
{
    if (sprite->data[0])
    {
        sprite->data[0]--;
    }
    else
    {
        gTasks[sprite->data[1]].data[sprite->data[2]]--;
        obj_delete_but_dont_free_vram(sprite);
    }
}

void sub_80E2F2C(u8 taskId)
{
    u16 species;
    int spriteId, newSpriteId;
    u16 var0;
    struct Struct_sub_8078914 subStruct;

    var0 = 0;
    gBattle_WIN0H = 0;
    gBattle_WIN0V = 0;
    REG_WININ = 0x3F3F;
    REG_WINOUT = 0x3F3D;
    REG_DISPCNT |= DISPCNT_OBJWIN_ON;
    REG_BLDCNT = 0x3F42;
    REG_BLDALPHA = 0x0C08;
    REG_BG1CNT_BITFIELD.priority = 0;
    REG_BG1CNT_BITFIELD.screenSize = 0;
    REG_BG1CNT_BITFIELD.areaOverflowMode = 1;

    if (!IsContest())
        REG_BG1CNT_BITFIELD.charBaseBlock = 1;

    if (IsDoubleBattle() && !IsContest())
    {
        if (GetBattlerPosition(gAnimBankAttacker) == B_POSITION_OPPONENT_RIGHT
         || GetBattlerPosition(gAnimBankAttacker) == B_POSITION_PLAYER_LEFT)
        {
            if (IsAnimBankSpriteVisible(gAnimBankAttacker ^ 2) == TRUE)
            {
                gSprites[gBankSpriteIds[gAnimBankAttacker ^ 2]].oam.priority -= 1;
                REG_BG1CNT_BITFIELD.priority = 1;
                var0 = 1;
            }
        }
    }

    if (IsContest())
    {
        species = eWRAM_19348Struct->species2;
    }
    else
    {
        if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
            species = GetMonData(&gEnemyParty[gBattlerPartyIndexes[gAnimBankAttacker]], MON_DATA_SPECIES);
        else
            species = GetMonData(&gPlayerParty[gBattlerPartyIndexes[gAnimBankAttacker]], MON_DATA_SPECIES);
    }

    spriteId = GetAnimBattlerSpriteId(0);
    newSpriteId = sub_807A4A0(gAnimBankAttacker, spriteId, species);
    sub_8078914(&subStruct);
    DmaFill32Defvars(3, 0, subStruct.field_4, 0x1000);
    LZDecompressVram(&gUnknown_08D20A30, subStruct.field_4);
    if (IsContest())
        sub_80763FC(subStruct.field_8, (u16 *)subStruct.field_4, 0, 0);
    
    LZDecompressVram(&gUnknown_08D20A14, subStruct.field_0);
    LoadPalette(&gUnknown_083DB568, subStruct.field_8 * 16 + 1, 2);

    gBattle_BG1_X = -gSprites[spriteId].pos1.x + 32;
    gBattle_BG1_Y = -gSprites[spriteId].pos1.y + 32;
    gTasks[taskId].data[0] = newSpriteId;
    gTasks[taskId].data[6] = var0;
    gTasks[taskId].func = sub_80E3194;
}

static void sub_80E3194(u8 taskId)
{
    struct Struct_sub_8078914 subStruct;
    struct Sprite *sprite;

    gTasks[taskId].data[10] += 4;
    gBattle_BG1_Y -= 4;
    if (gTasks[taskId].data[10] == 64)
    {
        gTasks[taskId].data[10] = 0;
        gBattle_BG1_Y += 64;
        if (++gTasks[taskId].data[11] == 4)
        {
            sub_8076464(0);
            gBattle_WIN0H = 0;
            gBattle_WIN0V = 0;
            REG_WININ = 0x3F3F;
            REG_WINOUT = 0x3F3F;

            if (!IsContest())
                REG_BG1CNT_BITFIELD.charBaseBlock = 0;

            REG_DISPCNT ^= DISPCNT_OBJWIN_ON;
            REG_BLDCNT = 0;
            REG_BLDALPHA = 0;
            sprite = &gSprites[GetAnimBattlerSpriteId(0)]; // unused
            sprite = &gSprites[gTasks[taskId].data[0]];
            DestroySprite(sprite);

            sub_8078914(&subStruct);
            DmaFill32Defvars(3, 0, subStruct.field_4, 0x800);
            if (gTasks[taskId].data[6] == 1)
                gSprites[gBankSpriteIds[gAnimBankAttacker ^ 2]].oam.priority++;

            REG_BG1CNT_BITFIELD.areaOverflowMode = 0;
            do {} while(0); // needed to match. perhaps part of a debug macro
            gBattle_BG1_Y = 0;
            DestroyAnimVisualTask(taskId);
        }
    }
}

void sub_80E32E0(u8 taskId)
{
    u8 i;

    for (i = 0; i < 8; i++)
        gTasks[taskId].data[i] = gBattleAnimArgs[i];

    gTasks[taskId].func = sub_80E3338;
}

static void sub_80E3338(u8 taskId)
{
    int i;
    u8 battler1, battler2;
    u16 species;
    u8 spriteId, spriteId2;
    u16 var0;
    struct Struct_sub_8078914 subStruct;
    s16 taskData[8];

    spriteId2 = 0;
    var0 = 0;

    for (i = 0; i < 8; i++)
    {
        taskData[i] = gTasks[taskId].data[i]; 
        gTasks[taskId].data[i] = 0;
    }

    if (taskData[2] == 0)
        battler1 = gAnimBankAttacker;
    else
        battler1 = gAnimBankTarget;

    battler2 = battler1 ^ 2;
    if (IsContest() || (taskData[3] && !IsAnimBankSpriteVisible(battler2)))
        taskData[3] = 0;

    gBattle_WIN0H = 0;
    gBattle_WIN0V = 0;
    REG_WININ = 0x3F3F;
    REG_WINOUT = 0x3F3D;
    REG_DISPCNT |= DISPCNT_OBJWIN_ON;
    REG_BLDCNT = 0x3F42;
    REG_BLDALPHA = 0x1000;
    REG_BG1CNT_BITFIELD.priority = 0;
    REG_BG1CNT_BITFIELD.screenSize = 0;
    REG_BG1CNT_BITFIELD.areaOverflowMode = 1;
    if (!IsContest())
        REG_BG1CNT_BITFIELD.charBaseBlock = 1;

    if (IsDoubleBattle() && taskData[3] == 0)
    {
        if (GetBattlerPosition(battler1) == B_POSITION_OPPONENT_RIGHT
         || GetBattlerPosition(battler1) == B_POSITION_PLAYER_LEFT)
        {
            if (IsAnimBankSpriteVisible(battler2) == TRUE)
            {
                gSprites[gBankSpriteIds[battler2]].oam.priority -= 1;
                REG_BG1CNT_BITFIELD.priority = 1;
                var0 = 1;
            }
        }
    }

    if (IsContest())
    {
        species = eWRAM_19348Struct->species2;
    }
    else
    {
        if (GetBattlerSide(battler1) != B_SIDE_PLAYER)
            species = GetMonData(&gEnemyParty[gBattlerPartyIndexes[battler1]], MON_DATA_SPECIES);
        else
            species = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler1]], MON_DATA_SPECIES);
    }

    spriteId = sub_807A4A0(battler1, gBankSpriteIds[battler1], species);
    if (taskData[3])
        spriteId2 = sub_807A4A0(battler2, gBankSpriteIds[battler2], species);
    
    sub_8078914(&subStruct);
    if (taskData[0] == 0)
        LZDecompressVram(&gBattleStatMask1_Tilemap, subStruct.field_4);
    else
        LZDecompressVram(&gBattleStatMask2_Tilemap, subStruct.field_4);

    if (IsContest())
        sub_80763FC(subStruct.field_8, (u16 *)subStruct.field_4, 0, 0);

    LZDecompressVram(&gBattleStatMask_Gfx, subStruct.field_0);

    if (taskData[1] == 0)
        LoadCompressedPalette(gBattleStatMask2_Pal, subStruct.field_8 << 4, 32);
    else if (taskData[1] == 1)
        LoadCompressedPalette(gBattleStatMask1_Pal, subStruct.field_8 << 4, 32);
    else if (taskData[1] == 2)
        LoadCompressedPalette(gBattleStatMask3_Pal, subStruct.field_8 << 4, 32);
    else if (taskData[1] == 3)
        LoadCompressedPalette(gBattleStatMask4_Pal, subStruct.field_8 << 4, 32);
    else if (taskData[1] == 4)
        LoadCompressedPalette(gBattleStatMask6_Pal, subStruct.field_8 << 4, 32);
    else if (taskData[1] == 5)
        LoadCompressedPalette(gBattleStatMask7_Pal, subStruct.field_8 << 4, 32);
    else if (taskData[1] == 6)
        LoadCompressedPalette(gBattleStatMask8_Pal, subStruct.field_8 << 4, 32);
    else
        LoadCompressedPalette(gBattleStatMask5_Pal, subStruct.field_8 << 4, 32);

    gBattle_BG1_X = 0;
    gBattle_BG1_Y = 0;

    if (taskData[0] == 1)
    {
        gBattle_BG1_X = 64;
        gTasks[taskId].data[1] = -3;
    }
    else
    {
        gTasks[taskId].data[1] = 3;
    }

    if (taskData[4] == 0)
    {
        gTasks[taskId].data[4] = 10;
        gTasks[taskId].data[5] = 20;
    }
    else
    {
        gTasks[taskId].data[4] = 13;
        gTasks[taskId].data[5] = 30;
    }

    gTasks[taskId].data[0] = spriteId;
    gTasks[taskId].data[2] = taskData[3];
    gTasks[taskId].data[3] = spriteId2;
    gTasks[taskId].data[6] = var0;
    gTasks[taskId].data[7] = gBankSpriteIds[battler2];
    gTasks[taskId].func = sub_80E3704;

    if (taskData[0] == 0)
        PlaySE12WithPanning(SE_W287, BattleAnimAdjustPanning2(-64));
    else
        PlaySE12WithPanning(SE_W287B, BattleAnimAdjustPanning2(-64));
}

static void sub_80E3704(u8 taskId)
{
    gBattle_BG1_Y += gTasks[taskId].data[1];

    switch (gTasks[taskId].data[15])
    {
    case 0:
        if (gTasks[taskId].data[11]++ > 0)
        {
            gTasks[taskId].data[11] = 0;
            gTasks[taskId].data[12]++;
            REG_BLDALPHA = ((16 - gTasks[taskId].data[12]) << 8) | gTasks[taskId].data[12];
            if (gTasks[taskId].data[12] == gTasks[taskId].data[4])
                gTasks[taskId].data[15]++;
        }
        break;
    case 1:
        if (++gTasks[taskId].data[10] == gTasks[taskId].data[5])
            gTasks[taskId].data[15]++;
        break;
    case 2:
        if (gTasks[taskId].data[11]++ > 0)
        {
            gTasks[taskId].data[11] = 0;
            gTasks[taskId].data[12]--;
            REG_BLDALPHA = ((16 - gTasks[taskId].data[12]) << 8) | gTasks[taskId].data[12];
            if (gTasks[taskId].data[12] == 0)
            {
                sub_8076464(0);
                gBattle_WIN0H = 0;
                gBattle_WIN0V = 0;
                REG_WININ = 0x3F3F;
                REG_WINOUT = 0x3F3F;

                if (!IsContest())
                    REG_BG1CNT_BITFIELD.charBaseBlock = 0;

                REG_DISPCNT ^= DISPCNT_OBJWIN_ON;
                REG_BLDCNT = 0;
                REG_BLDALPHA = 0;
                DestroySprite(&gSprites[gTasks[taskId].data[0]]);
                if (gTasks[taskId].data[2])
                    DestroySprite(&gSprites[gTasks[taskId].data[3]]);

                if (gTasks[taskId].data[6] == 1)
                    gSprites[gTasks[taskId].data[7]].oam.priority++;

                REG_BG1CNT_BITFIELD.areaOverflowMode = 0;
                DestroyAnimVisualTask(taskId);
            }
        }
        break;
    }
}

void sub_80E388C(u8 taskId)
{
    u32 selectedPalettes = sub_80792C0(1, 1, 1, 1);
    sub_80E39BC(selectedPalettes, 0);
    gTasks[taskId].data[14] = selectedPalettes >> 16;

    selectedPalettes = sub_80791A8(1, 0, 0, 0, 0, 0, 0) & 0xFFFF;
    sub_80E39BC(selectedPalettes, 0xFFFF);
    gTasks[taskId].data[15] = selectedPalettes;

    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = 0;
    gTasks[taskId].func = sub_80E38F8;
}

static void sub_80E38F8(u8 taskId)
{
    u16 i;
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        if (++task->data[1] > 6)
        {
            task->data[1] = 0;
            task->data[2] = 16;
            task->data[0]++;
        }
        break;
    case 1:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;
            task->data[2]--;

            for (i = 0; i < 16; i++)
            {
                if ((task->data[15] >> i) & 1)
                {
                    u16 paletteOffset = i * 16;
                    BlendPalette(paletteOffset, 16, task->data[2], 0xFFFF);
                }

                if ((task->data[14] >> i) & 1)
                {
                    u16 paletteOffset = i * 16 + 0x100;
                    BlendPalette(paletteOffset, 16, task->data[2], 0);
                }
            }

            if (task->data[2] == 0)
                task->data[0]++;
        }
        break;
    case 2:
        DestroyAnimVisualTask(taskId);
        break;
    }
}

static void sub_80E39BC(u32 selectedPalettes, u16 color)
{
    u16 i;

    for (i = 0; i < 32; i++)
    {
        if (selectedPalettes & 1)
        {
            u16 curOffset = i * 16;
            u16 paletteOffset = curOffset;
            while (curOffset < paletteOffset + 16)
            {
                gPlttBufferFaded[curOffset] = color;
                curOffset++;
            }
        }

        selectedPalettes >>= 1;
    }
}

void sub_80E3A08(u8 taskId)
{
    u32 i;
    int j;
    u32 selectedPalettes = 0;

    for (i = 0; i < 4; i++)
    {
        if (gAnimBankAttacker != i)
            selectedPalettes |= 1 << (i + 16);
    }

    for (j = 5; j != 0; j--)
        gBattleAnimArgs[j] = gBattleAnimArgs[j - 1];

    sub_80E2C8C(taskId, selectedPalettes);
}

void sub_80E3A58(u8 taskId)
{
    u8 newTaskId;

    sub_80789D4(0);
    newTaskId = CreateTask(sub_80E3AD0, 5);
    if (gBattleAnimArgs[2] && GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
    {
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
    }

    gTasks[newTaskId].data[1] = gBattleAnimArgs[0];
    gTasks[newTaskId].data[2] = gBattleAnimArgs[1];
    gTasks[newTaskId].data[3] = gBattleAnimArgs[3];
    gTasks[newTaskId].data[0]++;
    DestroyAnimVisualTask(taskId);
}

static void sub_80E3AD0(u8 taskId)
{
    gTasks[taskId].data[10] += gTasks[taskId].data[1];
    gTasks[taskId].data[11] += gTasks[taskId].data[2];
    gBattle_BG3_X += gTasks[taskId].data[10] >> 8;
    gBattle_BG3_Y += gTasks[taskId].data[11] >> 8;
    gTasks[taskId].data[10] &= 0xFF;
    gTasks[taskId].data[11] &= 0xFF;

    if (gBattleAnimArgs[7] == gTasks[taskId].data[3])
    {
        gBattle_BG3_X = 0;
        gBattle_BG3_Y = 0;
        sub_80789D4(1);
        DestroyTask(taskId);
    }
}

void sub_80E3B4C(u8 taskId)
{
    gBattleAnimArgs[7] = GetBattlerSide(gAnimBankAttacker);
    DestroyAnimVisualTask(taskId);
}

void sub_80E3B78(u8 taskId)
{
    gBattleAnimArgs[7] = GetBattlerSide(gAnimBankTarget);
    DestroyAnimVisualTask(taskId);
}

void sub_80E3BA4(u8 taskId)
{
    gBattleAnimArgs[7] = (gAnimBankAttacker ^ 2) == gAnimBankTarget;
    DestroyAnimVisualTask(taskId);
}

void sub_80E3BDC(u8 taskId)
{
    u16 i;

    for (i = 0; i < 4; i++)
    {
        if (i != gAnimBankAttacker && IsAnimBankSpriteVisible(i))
            gSprites[gBankSpriteIds[i]].invisible = gBattleAnimArgs[0];
    }

    DestroyAnimVisualTask(taskId);
}

void sub_80E3C4C(u8 taskId, int unused, u16 arg2, u8 battler1, u8 arg4, u8 arg5, u8 arg6, u8 arg7, const u8 *arg8, const u8 *arg9, const u16 *palette)
{
    u16 species;
    u8 spriteId, spriteId2;
    struct Struct_sub_8078914 subStruct;
    u8 battler2;

    spriteId2 = 0;
    battler2 = battler1 ^ 2;

    if (IsContest() || (arg4 && !IsAnimBankSpriteVisible(battler2)))
        arg4 = 0;

    gBattle_WIN0H = 0;
    gBattle_WIN0V = 0;
    REG_WININ = 0x3F3F;
    REG_WINOUT = 0x3F3D;
    REG_DISPCNT |= DISPCNT_OBJWIN_ON;
    REG_BLDCNT = 0x3F42;
    REG_BLDALPHA = 0x1000;
    REG_BG1CNT_BITFIELD.priority = 0;
    REG_BG1CNT_BITFIELD.screenSize = 0;
    REG_BG1CNT_BITFIELD.areaOverflowMode = 1;
    if (!IsContest())
        REG_BG1CNT_BITFIELD.charBaseBlock = 1;

    if (IsContest())
    {
        species = eWRAM_19348Struct->species2;
    }
    else
    {
        if (GetBattlerSide(battler1) != B_SIDE_PLAYER)
            species = GetMonData(&gEnemyParty[gBattlerPartyIndexes[battler1]], MON_DATA_SPECIES);
        else
            species = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler1]], MON_DATA_SPECIES);
    }

    spriteId = sub_807A4A0(battler1, gBankSpriteIds[battler1], species);
    if (arg4)
        spriteId2 = sub_807A4A0(battler2, gBankSpriteIds[battler2], species);

    sub_8078914(&subStruct);
    LZDecompressVram(arg9, subStruct.field_4);
    if (IsContest())
        sub_80763FC(subStruct.field_8, (u16 *)subStruct.field_4, 0, 0);

    LZDecompressVram(arg8, subStruct.field_0);
    LoadCompressedPalette(palette, subStruct.field_8 << 4, 32);
    gBattle_BG1_X = 0;
    gBattle_BG1_Y = 0;
    gTasks[taskId].data[1] = arg2;
    gTasks[taskId].data[4] = arg5;
    gTasks[taskId].data[5] = arg7;
    gTasks[taskId].data[6] = arg6;
    gTasks[taskId].data[0] = spriteId;
    gTasks[taskId].data[2] = arg4;
    gTasks[taskId].data[3] = spriteId2;
    gTasks[taskId].func = sub_80E3E64;
}

static void sub_80E3E64(u8 taskId)
{
    gTasks[taskId].data[13] += gTasks[taskId].data[1] < 0 ? -gTasks[taskId].data[1] : gTasks[taskId].data[1];
    if (gTasks[taskId].data[1] < 0)
        gBattle_BG1_Y -= gTasks[taskId].data[13] >> 8;
    else
        gBattle_BG1_Y += gTasks[taskId].data[13] >> 8;

    gTasks[taskId].data[13] &= 0xFF;
    switch (gTasks[taskId].data[15])
    {
    case 0:
        if (gTasks[taskId].data[11]++ >= gTasks[taskId].data[6])
        {
            gTasks[taskId].data[11] = 0;
            gTasks[taskId].data[12]++;
            REG_BLDALPHA = ((16 - gTasks[taskId].data[12]) << 8) | gTasks[taskId].data[12];
            if (gTasks[taskId].data[12] == gTasks[taskId].data[4])
                gTasks[taskId].data[15]++;
        }
        break;
    case 1:
        if (++gTasks[taskId].data[10] == gTasks[taskId].data[5])
            gTasks[taskId].data[15]++;
        break;
    case 2:
        if (gTasks[taskId].data[11]++ >= gTasks[taskId].data[6])
        {
            gTasks[taskId].data[11] = 0;
            gTasks[taskId].data[12]--;
            REG_BLDALPHA = ((16 - gTasks[taskId].data[12]) << 8) | gTasks[taskId].data[12];
            if (gTasks[taskId].data[12] == 0)
            {
                sub_8076464(0);
                gBattle_WIN0H = 0;
                gBattle_WIN0V = 0;
                REG_WININ = 0x3F3F;
                REG_WINOUT = 0x3F3F;

                if (!IsContest())
                    REG_BG1CNT_BITFIELD.charBaseBlock = 0;

                REG_DISPCNT ^= DISPCNT_OBJWIN_ON;
                REG_BLDCNT = 0;
                REG_BLDALPHA = 0;
                DestroySprite(&gSprites[gTasks[taskId].data[0]]);
                if (gTasks[taskId].data[2])
                    DestroySprite(&gSprites[gTasks[taskId].data[3]]);

                REG_BG1CNT_BITFIELD.areaOverflowMode = 0;
                DestroyAnimVisualTask(taskId);
            }
        }
        break;
    }
}

void sub_80E4008(u8 taskId)
{
    gBattleAnimArgs[0] = gBattleTerrain;
    DestroyAnimVisualTask(taskId);
}

void sub_80E4028(u8 taskId)
{
    u32 selectedPalettes;
    u8 *dest;
    int offset;
    int i = 0;

    if (gBattleAnimArgs[0] == 0)
    {
        selectedPalettes = sub_80791A8(1, 0, 0, 0, 0, 0, 0);
        while ((selectedPalettes & 1) == 0)
        {
            selectedPalettes >>= 1;
            i++;
        }
    }
    else if (gBattleAnimArgs[0] == 1)
    {
        i = gAnimBankAttacker + 16;
    }
    else if (gBattleAnimArgs[0] == 2)
    {
        i = gAnimBankTarget + 16;
    }

    offset = gBattleAnimArgs[1] * 32;
    dest = IsContest() ? &ewram14800[offset] : &ewram18000_2[offset];
    // This doesn't match when u16* is used.
    memcpy(dest, &((u8 *)gPlttBufferUnfaded)[i * 32], 32);
    DestroyAnimVisualTask(taskId);
}


void sub_80E40D0(u8 taskId)
{
    u32 selectedPalettes;
    u8 *src;
    u8 *dest;
    int offset;
    int i = 0;

    if (gBattleAnimArgs[0] == 0)
    {
        selectedPalettes = sub_80791A8(1, 0, 0, 0, 0, 0, 0);
        while ((selectedPalettes & 1) == 0)
        {
            selectedPalettes >>= 1;
            i++;
        }
    }
    else if (gBattleAnimArgs[0] == 1)
    {
        i = gAnimBankAttacker + 16;
    }
    else if (gBattleAnimArgs[0] == 2)
    {
        i = gAnimBankTarget + 16;
    }

    dest = &((u8 *)gPlttBufferUnfaded)[i * 32];
    offset = gBattleAnimArgs[1] * 32;
    src = IsContest() ? &ewram14800[offset] : &ewram18000_2[offset];
    // This doesn't match when u16* is used.
    memcpy(dest, src, 32);
    DestroyAnimVisualTask(taskId);
}

void sub_80E4178(u8 taskId)
{
    u32 selectedPalettes;
    int i = 0;

    if (gBattleAnimArgs[0] == 0)
    {
        selectedPalettes = sub_80791A8(1, 0, 0, 0, 0, 0, 0);
        while ((selectedPalettes & 1) == 0)
        {
            selectedPalettes >>= 1;
            i++;
        }
    }
    else if (gBattleAnimArgs[0] == 1)
    {
        i = gAnimBankAttacker + 16;
    }
    else if (gBattleAnimArgs[0] == 2)
    {
        i = gAnimBankTarget + 16;
    }

    memcpy(&gPlttBufferUnfaded[i * 16], &gPlttBufferFaded[i * 16], 32);
    DestroyAnimVisualTask(taskId);
}

void sub_80E4200(u8 taskId)
{
    if (IsContest())
        gBattleAnimArgs[7] = 1;
    else
        gBattleAnimArgs[7] = 0;

    DestroyAnimVisualTask(taskId);
}

void sub_80E4234(u8 taskId)
{
    gAnimBankAttacker = gBankTarget;
    gAnimBankTarget = gEffectBank;
    DestroyAnimVisualTask(taskId);
}

void sub_80E4264(u8 taskId)
{
    if (GetBattlerSide(gAnimBankAttacker) == GetBattlerSide(gAnimBankTarget))
        gBattleAnimArgs[7] = 1;
    else
        gBattleAnimArgs[7] = 0;

    DestroyAnimVisualTask(taskId);
}

void sub_80E42B0(u8 taskId)
{
    gAnimBankTarget = gBankTarget;
    DestroyAnimVisualTask(taskId);
}

void sub_80E42D0(u8 taskId)
{
    gAnimBankAttacker = gBankAttacker;
    gAnimBankTarget = gEffectBank;
    DestroyAnimVisualTask(taskId);
}

void sub_80E4300(u8 taskId)
{
    if (IsContest())
    {
        DestroyAnimVisualTask(taskId);
    }
    else
    {
        gTasks[taskId].data[0] = ewram17800[gAnimBankAttacker].invisible;
        ewram17800[gAnimBankAttacker].invisible = 1;
        gTasks[taskId].func = sub_80E4368;
        gAnimVisualTaskCount--;
    }
}

static void sub_80E4368(u8 taskId)
{
    if (gBattleAnimArgs[7] == 0x1000)
    {
        ewram17800[gAnimBankAttacker].invisible = gTasks[taskId].data[0] & 1;
        DestroyTask(taskId);
    }
}
