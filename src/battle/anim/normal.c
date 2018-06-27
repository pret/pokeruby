#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "blend_palette.h"
#include "palette.h"
#include "random.h"
#include "rom_8077ABC.h"
#include "task.h"
#include "trig.h"
#include "constants/battle_constants.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern u8 gHealthboxIDs[];
extern u8 gBattlersCount;
extern u8 gBankSpriteIds[];
extern u8 gBattleTerrain;

extern void sub_80DA48C(struct Sprite *);

static void sub_80E1CB4(struct Sprite *sprite);
static void sub_80E1D84(struct Sprite *sprite);
static void sub_80E1E2C(struct Sprite *sprite);
static void sub_80E1F3C(struct Sprite *sprite);
static void sub_80E24B8(struct Sprite *sprite);
/*static*/ void sub_80E27A0(struct Sprite *sprite);
static void sub_80E2838(struct Sprite *sprite);
static void sub_80E2870(struct Sprite *sprite);
static void sub_80E2908(struct Sprite *sprite);
static void sub_80E2978(struct Sprite *sprite);
static void sub_80E29C0(struct Sprite *sprite);
static void sub_80E27E8(struct Sprite *sprite);
static void sub_80E1D20(struct Sprite *sprite);
u32 sub_80E1DC4(s16);
static void sub_80E1E0C(struct Sprite *sprite);
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
/*static*/ void sub_80E2C8C(u8 taskId, u32 selectedPalettes);
static void sub_80E2CD0(u8 taskId);
static void sub_80E2DB8(u8 taskId);
void sub_80E2E10(u8 taskId);

const union AnimCmd gSpriteAnim_83DB37C[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(4, 8),
    ANIMCMD_FRAME(0, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(8, 8),
    ANIMCMD_JUMP(0),
};

const union AnimCmd gSpriteAnim_83DB390[] =
{
    ANIMCMD_FRAME(0, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(4, 8),
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(8, 8),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_83DB3A4[] =
{
    gSpriteAnim_83DB37C,
    gSpriteAnim_83DB390,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB3AC =
{
    .tileTag = 10073,
    .paletteTag = 10073,
    .oam = &gOamData_837DF2C,
    .anims = gSpriteAnimTable_83DB3A4,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80E1CB4,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB3C4 =
{
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &gDummyOamData,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80E1D84,
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

static void sub_80E1CB4(struct Sprite *sprite)
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
    sprite->callback = sub_80E1D20;
    sprite->callback(sprite);
}

static void sub_80E1D20(struct Sprite *sprite)
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

static void sub_80E1D84(struct Sprite *sprite)
{
    u32 selectedPalettes = sub_80E1DC4(gBattleAnimArgs[0]);
    BeginNormalPaletteFade(selectedPalettes, gBattleAnimArgs[1], gBattleAnimArgs[2], gBattleAnimArgs[3], gBattleAnimArgs[4]);
    sprite->invisible = 1;
    sprite->callback = sub_80E1E0C;
}

u32 sub_80E1DC4(s16 a)
{
    u8 arg0 = a & 1;
    u8 arg1 = (a >> 1) & 1;
    u8 arg2 = (a >> 2) & 1;
    u8 arg3 = (a >> 3) & 1;
    u8 arg4 = (a >> 4) & 1;
    u8 arg5 = (a >> 5) & 1;
    u8 arg6 = (a >> 6) & 1;
    return sub_80791A8(arg0, arg1, arg2, arg3, arg4, arg5, arg6);
}

static void sub_80E1E0C(struct Sprite *sprite)
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

    selectedPalettes = sub_80E1DC4(sprite->data[7]);
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

    selectedPalettes = sub_80E1DC4(sprite->data[7]);
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
        selectedPalettes = sub_80E1DC4(sprite->data[7]);
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
    u32 selectedPalettes = sub_80E1DC4(gTasks[taskId].data[0]);
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

/*static*/ void sub_80E27A0(struct Sprite *sprite)
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
    u32 selectedPalettes = sub_80E1DC4(gBattleAnimArgs[0]);
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
    selectedPalettes = sub_80E1DC4(1);
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
    u32 selectedPalettes = sub_80E1DC4(gBattleAnimArgs[0]);

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

/*static*/ void sub_80E2C8C(u8 taskId, u32 selectedPalettes)
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
