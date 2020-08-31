#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "palette.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "main.h"
#include "random.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimAttacker;
extern u8 gBattleAnimTarget;
extern u8 gAnimVisualTaskCount;
extern struct OamMatrix gOamMatrices[];
extern u8 gBattlerPositions[];
extern const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB538;

void sub_80785E4(struct Sprite *sprite);
static void sub_80DA034(struct Sprite *sprite);
static void sub_80DA05C(struct Sprite *sprite);
static void sub_80DA16C(struct Sprite *sprite);
static void sub_80DA1EC(struct Sprite *sprite);
static void sub_80DA208(struct Sprite *sprite);
static void sub_80DA300(struct Sprite *sprite);
static void sub_80DA348(struct Sprite *sprite);
static void sub_80DA38C(struct Sprite *sprite);
static void AnimFallingFeather(struct Sprite *sprite);
static void sub_80DA410(struct Sprite *sprite);
static void DestroyAnimSpriteAfterTimer(struct Sprite *sprite);
static void sub_80DAD30(struct Sprite *sprite);
static void sub_80DAD84(struct Sprite *sprite);
static void sub_80DAF0C(struct Sprite *sprite);
static void sub_80DB000(struct Sprite *sprite);
static void sub_80DB0A0(struct Sprite *sprite);
static void sub_80DB194(struct Sprite *sprite);
static void sub_80DB1F4(struct Sprite *sprite);
static void sub_80DB288(struct Sprite *sprite);
static void sub_80DB2D0(struct Sprite *sprite);
static void sub_80DB330(struct Sprite *sprite);
static void sub_80DB374(struct Sprite *sprite);
static void sub_80DB458(struct Sprite *sprite);
static void sub_80DB508(struct Sprite *sprite);
static void sub_80DB564(struct Sprite *sprite);
static void sub_80DB578(struct Sprite *sprite);
static void sub_80DB5E4(struct Sprite *sprite);
static void sub_80DB6A0(struct Sprite *sprite);

static void sub_80DA0DC(u8 taskId);

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA380 =
{
    .tileTag = ANIM_TAG_GUST,
    .paletteTag = ANIM_TAG_GUST,
    .oam = &gOamData_837DF7C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DA034,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA398[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0xA, 0x0, 0, 24),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA3B0[] =
{
    gSpriteAffineAnim_83DA398,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA3B4 =
{
    .tileTag = ANIM_TAG_GUST,
    .paletteTag = ANIM_TAG_GUST,
    .oam = &gOamData_837DFDC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA3B0,
    .callback = sub_80DA16C,
};

const union AnimCmd gSpriteAnim_83DA3CC[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(0, 3, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 3, .vFlip = TRUE),
    ANIMCMD_FRAME(0, 3, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_83DA3E0[] =
{
    gSpriteAnim_83DA3CC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA3E4 =
{
    .tileTag = ANIM_TAG_AIR_WAVE_2,
    .paletteTag = ANIM_TAG_AIR_WAVE_2,
    .oam = &gOamData_837DF54,
    .anims = gSpriteAnimTable_83DA3E0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DA208,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA3FC[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x28, 0x0, 0, 6),
    AFFINEANIMCMD_FRAME(0x0, 0xFFE0, 0, 5),
    AFFINEANIMCMD_FRAME(0xFFF0, 0x20, 0, 10),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA424[] =
{
        gSpriteAffineAnim_83DA3FC,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA428[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 50, 1),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA438[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, -40, 1),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA448[] =
{
    gSpriteAffineAnim_83DA428,
    gSpriteAffineAnim_83DA438,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA450 =
{
    .tileTag = ANIM_TAG_ROUND_SHADOW,
    .paletteTag = ANIM_TAG_ROUND_SHADOW,
    .oam = &gOamData_837DFFC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA424,
    .callback = sub_80DA300,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA468 =
{
    .tileTag = ANIM_TAG_ROUND_SHADOW,
    .paletteTag = ANIM_TAG_ROUND_SHADOW,
    .oam = &gOamData_837DF9C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA448,
    .callback = sub_80DA38C,
};

const union AnimCmd gSpriteAnim_83DA480[] =
{
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DA488[] =
{
    ANIMCMD_FRAME(16, 0, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83DA490[] =
{
    gSpriteAnim_83DA480,
    gSpriteAnim_83DA488,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA498 =
{
    .tileTag = ANIM_TAG_WHITE_FEATHER,
    .paletteTag = ANIM_TAG_WHITE_FEATHER,
    .oam = &gOamData_837DF94,
    .anims = gSpriteAnimTable_83DA490,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimFallingFeather,
};

const u16 gUnknownPalette_83DA4B0[] = INCBIN_U16("graphics/unknown/unknown_3DA4B0.gbapal");

const struct SpriteTemplate gSpriteTemplate_83DA4D0 =
{
    .tileTag = ANIM_TAG_SMALL_BUBBLES,
    .paletteTag = ANIM_TAG_SMALL_BUBBLES,
    .oam = &gOamData_837DF2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DAD30,
};

const struct SpriteTemplate gSpriteTemplate_83DA4E8 =
{
    .tileTag = ANIM_TAG_WHITE_FEATHER,
    .paletteTag = ANIM_TAG_WHITE_FEATHER,
    .oam = &gOamData_837DF94,
    .anims = gSpriteAnimTable_83DA490,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DAD84,
};

const union AnimCmd gSpriteAnim_83DA500[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_FRAME(8, 1),
    ANIMCMD_FRAME(16, 1),
    ANIMCMD_FRAME(8, 1, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 1, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83DA518[] =
{
    gSpriteAnim_83DA500,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA51C =
{
    .tileTag = ANIM_TAG_WHIRLWIND_LINES,
    .paletteTag = ANIM_TAG_WHIRLWIND_LINES,
    .oam = &gOamData_837DF54,
    .anims = gSpriteAnimTable_83DA518,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DB000,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA534[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x28, 0x0, 0, 6),
    AFFINEANIMCMD_FRAME(0x0, 0xFFE0, 0, 5),
    AFFINEANIMCMD_FRAME(0xFFEC, 0x0, 0, 7),
    AFFINEANIMCMD_FRAME(0xFFEC, 0xFFEC, 0, 5),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA564[] =
{
    gSpriteAffineAnim_83DA534,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA568 =
{
    .tileTag = ANIM_TAG_ROUND_SHADOW,
    .paletteTag = ANIM_TAG_ROUND_SHADOW,
    .oam = &gOamData_837DFFC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA564,
    .callback = sub_80DB194,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA580[] =
{
    AFFINEANIMCMD_FRAME(0xA0, 0x100, 0, 0),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA590[] =
{
    gSpriteAffineAnim_83DA580,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA594 =
{
    .tileTag = ANIM_TAG_ROUND_SHADOW,
    .paletteTag = ANIM_TAG_ROUND_SHADOW,
    .oam = &gOamData_837DFFC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA590,
    .callback = sub_80DB1F4,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA5AC[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x28, 0x0, 0, 6),
    AFFINEANIMCMD_FRAME(0x0, 0xFFE0, 0, 5),
    AFFINEANIMCMD_FRAME(0xFFF0, 0x20, 0, 10),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA5D4[] =
{
    gSpriteAffineAnim_83DA5AC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA5D8 =
{
    .tileTag = ANIM_TAG_ROUND_SHADOW,
    .paletteTag = ANIM_TAG_ROUND_SHADOW,
    .oam = &gOamData_837DFFC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA5D4,
    .callback = sub_80DB288,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA5F0[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x0, 0, 0),
    AFFINEANIMCMD_FRAME(0x0, 0x20, 0, 12),
    AFFINEANIMCMD_FRAME(0x0, 0xFFE0, 0, 11),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA610[] =
{
    gSpriteAffineAnim_83DA5F0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA614 =
{
    .tileTag = ANIM_TAG_SPLASH,
    .paletteTag = ANIM_TAG_SPLASH,
    .oam = &gOamData_837DFFC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DB374,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA62C =
{
    .tileTag = ANIM_TAG_SWEAT_BEAD,
    .paletteTag = ANIM_TAG_SWEAT_BEAD,
    .oam = &gOamData_837DF24,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DB458,
};

const struct SpriteTemplate gSpriteTemplate_83DA644 =
{
    .tileTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .paletteTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .oam = &gOamData_837E05C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DB564,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA65C =
{
    .tileTag = ANIM_TAG_BIRD,
    .paletteTag = ANIM_TAG_BIRD,
    .oam = &gOamData_837DFFC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DB5E4,
};

static void sub_80DA034(struct Sprite *sprite)
{
    sub_8078764(sprite, FALSE);
    sprite->pos1.y += 20;
    sprite->data[1] = 0xBF;
    sprite->callback = sub_80DA05C;
    sub_80DA05C(sprite);
}

static void sub_80DA05C(struct Sprite *sprite) {
    sprite->pos2.x = Sin(sprite->data[1], 0x20);
    sprite->pos2.y = Cos(sprite->data[1], 0x8);
    sprite->data[1] = (sprite->data[1] + 5) & 0xFF;
    if (++sprite->data[0] == 0x47) {
        DestroyAnimSprite(sprite);
    }
}

void sub_80DA09C(u8 taskId)
{
    gTasks[taskId].data[0] = gBattleAnimArgs[1];
    gTasks[taskId].data[1] = gBattleAnimArgs[0];
    gTasks[taskId].data[2] = IndexOfSpritePaletteTag(0x2719);
    gTasks[taskId].func = sub_80DA0DC;
}

static void sub_80DA0DC(u8 taskId)
{
    u8 data2;
    u16 temp;
    int i, base;

    if (gTasks[taskId].data[10]++ == gTasks[taskId].data[1])
    {
        gTasks[taskId].data[10] = 0;

        data2 = gTasks[taskId].data[2];
        temp = gPlttBufferFaded[16 * data2 + 0x108];

        i = 7;
        base = data2 * 16;

        do
        {
            gPlttBufferFaded[base + 0x101 + i] = gPlttBufferFaded[base + 0x100 + i];
            i--;
        }
        while (i > 0);

        gPlttBufferFaded[base + 0x101] = temp;
    }

    if (--gTasks[taskId].data[0] == 0)
    {
        DestroyAnimVisualTask(taskId);
    }
}

static void sub_80DA16C(struct Sprite *sprite)
{
    InitAnimSpritePos(sprite, 1);
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, 2) + gBattleAnimArgs[2];
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, 3) + gBattleAnimArgs[3];
    InitAnimLinearTranslation(sprite);
    sprite->callback = sub_80785E4;
    StoreSpriteCallbackInData(sprite, sub_80DA1EC);
}

static void sub_80DA1EC(struct Sprite *sprite)
{
    if (TranslateAnimLinear(sprite) != 0)
    {
        DestroyAnimSprite(sprite);
    }
}

static void sub_80DA208(struct Sprite *sprite)
{
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
    {
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
    }

    if (IsContest())
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
    }

    sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
    sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
    sprite->pos1.x += gBattleAnimArgs[0];
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[4];

    if (gBattleAnimArgs[6] == 0)
    {
        sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, 2);
        sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, 3);
    }
    else
    {
        SetAverageBattlerPositions(gBattleAnimTarget, 1, &sprite->data[2], &sprite->data[4]);
    }

    sprite->data[2] = sprite->data[2] + gBattleAnimArgs[2];
    sprite->data[4] = sprite->data[4] + gBattleAnimArgs[3];
    sprite->callback = StartAnimLinearTranslation;

    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    SeekSpriteAnim(sprite, gBattleAnimArgs[5]);
}

static void sub_80DA300(struct Sprite *sprite)
{
    InitAnimSpritePos(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->callback = sub_80DA348;
    gSprites[GetAnimBattlerSpriteId(0)].invisible = 1;
}

static void sub_80DA348(struct Sprite *sprite)
{
    if (sprite->data[0] > 0)
    {
        sprite->data[0]--;
    }
    else
    {
        sprite->data[2] += sprite->data[1];
        sprite->pos2.y -= (sprite->data[2] >> 8);
    }

    if (sprite->pos1.y + sprite->pos2.y < -32)
    {
        DestroyAnimSprite(sprite);
    }
}

static void sub_80DA38C(struct Sprite *sprite)
{
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
    {
        sprite->pos1.x = 272;
        sprite->pos1.y = -32;
        StartSpriteAffineAnim(sprite, 1);
    }
    else
    {
        sprite->pos1.x = -32;
        sprite->pos1.y = -32;
    }

    sprite->data[0] = gBattleAnimArgs[0];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, 2);
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, 3);

    InitAnimLinearTranslation(sprite);
    sprite->callback = sub_80DA410;
}

static void sub_80DA410(struct Sprite *sprite)
{
    sprite->data[0] = 1;
    TranslateAnimLinear(sprite);

    if (((u16) sprite->data[3] >> 8) > 200)
    {
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos2.x = 0;
        sprite->data[3] &= 0xFF;
    }

    //The below if statement relies on overflow when cast to unsigned whenver pos1.x and pos2.x add up to less than 32.
    if ((u32) (sprite->pos1.x + sprite->pos2.x + 32) > 304 || sprite->pos1.y + sprite->pos2.y > 160)
    {
        gSprites[GetAnimBattlerSpriteId(0)].invisible = 0;
        DestroyAnimSprite(sprite);
    }
}

void sub_80DA48C(struct Sprite *sprite)
{
    if (sprite->data[0]-- > 0)
        return;
    if (sprite->oam.affineMode & 1)
    {
        FreeOamMatrix(sprite->oam.matrixNum);
        sprite->oam.affineMode = 0;
    }

    DestroySprite(sprite);
    gAnimVisualTaskCount--;
}

struct FeatherDanceData
{
    u16 unk0_0a : 1;
    u16 unk0_0b : 1;
    u16 unk0_0c : 1;
    u16 unk0_0d : 1;
    u16 unk0_1 : 4;
    u16 unk1 : 8;
    u16 unk2;
    s16 unk4;
    u16 unk6;
    u16 unk8;
    u16 unkA;
    u8 unkC[2];

    u16 unkE_0 : 1;
    u16 unkE_1 : 15;
};
#define ANIM_SWITCH(sprite)                                                                        \
    {                                                                                              \
        (sprite)->hFlip ^= 1;                                                                      \
        (sprite)->animNum = (sprite)->hFlip;                                                       \
        (sprite)->animBeginning = TRUE;                                                            \
        (sprite)->animEnded = FALSE;                                                               \
    }

#define CHANGE_PRIORITY(sprite, data)                                                              \
    {                                                                                              \
        if ((data)->unk0_0c)                                                                       \
        {                                                                                          \
            if (gMain.inBattle)                                                                    \
            {                                                                                      \
                if ((data)->unkE_0 == 0)                                                           \
                {                                                                                  \
                    (sprite)->oam.priority--;                                                      \
                    (data)->unkE_0 ^= 1;                                                           \
                }                                                                                  \
                else                                                                               \
                {                                                                                  \
                    (sprite)->oam.priority++;                                                      \
                    (data)->unkE_0 ^= 1;                                                           \
                }                                                                                  \
            }                                                                                      \
            else                                                                                   \
            {                                                                                      \
                if ((data)->unkE_0 == 0)                                                           \
                {                                                                                  \
                    (sprite)->subpriority -= 12;                                                   \
                    (data)->unkE_0 ^= 1;                                                           \
                }                                                                                  \
                else                                                                               \
                {                                                                                  \
                    (sprite)->subpriority += 12;                                                   \
                    (data)->unkE_0 ^= 1;                                                           \
                }                                                                                  \
            }                                                                                      \
        }                                                                                          \
    }

static void AnimFallingFeather(struct Sprite *sprite)
{
    u8 battler, sinIndex;
    u32 matrixNum;
    s16 sinVal;

    struct FeatherDanceData *data = (struct FeatherDanceData *)sprite->data;

    battler =  (gBattleAnimArgs[7] & 0x100) ? gBattleAnimAttacker : gBattleAnimTarget;

    if (GetBattlerSide(battler) == B_SIDE_PLAYER)
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];

    sprite->pos1.x = GetBattlerSpriteCoord(battler, BATTLER_COORD_ATTR_HEIGHT) + gBattleAnimArgs[0];
    sinVal = GetBattlerSpriteCoord(battler, BATTLER_COORD_ATTR_WIDTH);
    sprite->pos1.y = sinVal + gBattleAnimArgs[1];

    data->unk8 = (u16)sprite->pos1.y << 8;
    data->unkE_1 = (u16)(sinVal + gBattleAnimArgs[6]);

    data->unk0_0c = 1;
    data->unk2 = (u16)(gBattleAnimArgs[2] & 0xFF);
    data->unkA = (u16)gBattleAnimArgs[2] >> 8;
    data->unk4 = gBattleAnimArgs[3];
    data->unk6 = (u16)gBattleAnimArgs[4];
    *((u16 *)data->unkC) = (u16)gBattleAnimArgs[5];

    if (data->unk2 >= 64 && data->unk2 < 192)
    {
        if (gMain.inBattle)
        {
            sprite->oam.priority = GetBattlerSpriteBGPriority(battler) + 1;
        }
        else
        {
            sprite->oam.priority = GetBattlerSpriteBGPriority(battler);
        }

        data->unkE_0 = 0;

        if (!(data->unk4 & 0x8000))
        {
            ANIM_SWITCH(sprite);
        }
    }
    else
    {
        sprite->oam.priority = GetBattlerSpriteBGPriority(battler);
        data->unkE_0 = 1;

        if (data->unk4 & 0x8000)
        {
            ANIM_SWITCH(sprite);
        }
    }

    data->unk0_1 = data->unk2/64;
    
    sprite->pos2.x = (gSineTable[data->unk2] * (s32)data->unkC[0]) >> 8;
    matrixNum = sprite->oam.matrixNum;

    sinIndex = ((-sprite->pos2.x >> 1) + data->unkA) & 0xFF;
    sinVal = gSineTable[sinIndex];

    gOamMatrices[matrixNum].a = gOamMatrices[matrixNum].d = gSineTable[sinIndex + 64];
    gOamMatrices[matrixNum].b = sinVal;
    gOamMatrices[matrixNum].c = -sinVal;

    sprite->callback = DestroyAnimSpriteAfterTimer;
}

static void DestroyAnimSpriteAfterTimer(struct Sprite *sprite)
{
    // (Probably) Functionally equivalent

    u8 sinIndex;
    u32 matrixNum;
    s16 sinVal = 0;
    struct FeatherDanceData *data = (struct FeatherDanceData *)sprite->data;

    if (data->unk0_0a)
    {
        if (data->unk1-- > 0) return;
        data->unk0_0a = 0;
        data->unk1 = 0;
        return;
    }
    switch (data->unk2 / 64)
    {
    case 0:
        if ((u8)data->unk0_1 == 1) // this must be cast to u8
        {
            data->unk0_0d = 1;
            data->unk0_0a = 1;
            data->unk1 = 0;
        }
        else if ((u8)data->unk0_1 == 3)
        {
            data->unk0_0b ^= 1;
            data->unk0_0a = 1;
            data->unk1 = 0;
        }
        else if (data->unk0_0d)
        {
            ANIM_SWITCH(sprite);
            CHANGE_PRIORITY(sprite, data);
            data->unk0_0d = 0;
        }
        data->unk0_1 = 0;
        break;
    case 1:
        if ((u8)data->unk0_1 == 0)
        {
            data->unk0_0d = 1;
            data->unk0_0a = 1;
            data->unk1 = 0;
        }
        else if ((u8)data->unk0_1 == 2)
        {
            data->unk0_0a = 1;
            data->unk1 = 0;
        }
        else if (data->unk0_0d)
        {
            ANIM_SWITCH(sprite);
            CHANGE_PRIORITY(sprite, data);
            data->unk0_0d = 0;
        }
        data->unk0_1 = 1;
        break;
    case 2:
        if ((u8)data->unk0_1 == 3)
        {
            data->unk0_0d = 1;
            data->unk0_0a = 1;
            data->unk1 = 0;
        }
        else if ((u8)data->unk0_1 == 1)
        {
            data->unk0_0a = 1;
            data->unk1 = 0;
        }
        else if (data->unk0_0d)
        {
            ANIM_SWITCH(sprite);
            CHANGE_PRIORITY(sprite, data)
            data->unk0_0d = 0;
        }
        data->unk0_1 = 2;
        break;
    case 3:
        if ((u8)data->unk0_1 == 2)
        {
            data->unk0_0d = 1;
        }
        else if ((u8)data->unk0_1 == 0)
        {
            data->unk0_0b ^= 1;
            data->unk0_0a = 1;
            data->unk1 = 0;
        }
        else if (data->unk0_0d)
        {
            ANIM_SWITCH(sprite);
            CHANGE_PRIORITY(sprite, data);
            data->unk0_0d = 0;
        }
        data->unk0_1 = 3;
        break;
    }

    sprite->pos2.x = ((s32)(data->unkC[data->unk0_0b]) * gSineTable[data->unk2]) >> 8;
    matrixNum = sprite->oam.matrixNum;

    sinIndex = ((-sprite->pos2.x >> 1) + data->unkA) & 0xFF;
    sinVal = gSineTable[sinIndex];

    gOamMatrices[matrixNum].a = gOamMatrices[matrixNum].d = gSineTable[sinIndex + 64];
    gOamMatrices[matrixNum].b = sinVal;
    gOamMatrices[matrixNum].c = -sinVal;

    data->unk8 += data->unk6;
    sprite->pos1.y = (s16)(data->unk8 >> 8);
    if (data->unk4 & 0x8000)
        data->unk2 = (data->unk2 - (data->unk4 & 0x7FFF)) & 0xFF;
    else
        data->unk2 = (data->unk2 + (data->unk4 & 0x7FFF)) & 0xFF;
    // 080dacfe
    if (sprite->pos1.y + sprite->pos2.y >= data->unkE_1)
    {
        sprite->data[0] = 0;
        sprite->callback = sub_80DA48C;
    }
}

static void sub_80DAD30(struct Sprite *sprite)
{
    sprite->oam.priority = GetBattlerSpriteBGPriority(gBattleAnimTarget);
    sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
    sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
    sprite->callback = TranslateAnimSpriteToTargetMonLocation;
}

static void sub_80DAD84(struct Sprite * sprite)
{
    u32 matrixNum;
    s16 rand;
    s16 sinVal;

    sprite->data[1] = gBattleAnimArgs[0];
    sprite->data[2] = gBattleAnimArgs[1];
    sprite->data[3] = gBattleAnimArgs[2];

    if (gMain.inBattle)
    {
        if (gBattlerPositions[gBattleAnimTarget] & 1)
        {
            sprite->data[7] = GetBattlerSpriteCoord(gBattleAnimTarget, 1) + gBattleAnimArgs[3];
        }
        else
        {
            // 080dade0
            sprite->data[7] = GetBattlerSpriteCoord(gBattleAnimTarget, 1) + 40;
        }

        if (gBattleAnimArgs[4])
        {
            sprite->oam.priority = GetBattlerSpriteBGPriority(gBattleAnimTarget) + 1;
            // 080dae24
        }
        else
        {
            sprite->oam.priority = GetBattlerSpriteBGPriority(gBattleAnimTarget);
        }
    }
    else
    {
        sprite->data[7] = GetBattlerSpriteCoord(gBattleAnimTarget, 1) + gBattleAnimArgs[3];
    }

    sprite->data[4] = gSineTable[sprite->data[1] & 0xff];
    sprite->data[5] = -gSineTable[(sprite->data[1] & 0xff) + 64];
    sprite->data[6] = 0;
    sprite->pos2.x = sprite->pos2.y = 0;

    matrixNum = sprite->oam.matrixNum;
    sprite->data[1] = ((u16)sprite->data[1] >> 8);

    rand = Random();
    if (rand & 0x8000)
    {
        sprite->data[1] = 0xff - sprite->data[1];
    }

    sinVal = gSineTable[sprite->data[1]];

    gOamMatrices[matrixNum].a = gOamMatrices[matrixNum].d = gSineTable[sprite->data[1] + 64];
    gOamMatrices[matrixNum].b = sinVal;
    gOamMatrices[matrixNum].c = -sinVal;

    sprite->animBeginning = 1;
    sprite->animEnded = 0;

    if (rand & 1)
    {
        sprite->animNum = 1;
        sprite->hFlip = 1;
    }

    sprite->callback = sub_80DAF0C;

}

static void sub_80DAF0C(struct Sprite *sprite)
{
    u16 dataCpy[8];
    struct FeatherDanceData *data = (struct FeatherDanceData *)sprite->data;

    if (++sprite->data[0] < 5)
        return;

    sprite->pos2.x = (sprite->data[4] * sprite->data[6]) >> 8;
    sprite->pos2.y = (sprite->data[5] * sprite->data[6]) >> 8;

    sprite->data[6] += sprite->data[3] & 0xff;

    if (sprite->data[6] < (sprite->data[2] & 0xff))
        return;
    sprite->pos1.x += sprite->pos2.x;
    sprite->pos1.y += sprite->pos2.y;

    sprite->pos2.x = 0;
    sprite->pos2.y = 0;

    memcpy(dataCpy, sprite->data, 16);
    memset(sprite->data, 0, 16);

    data->unk8 = (u16)sprite->pos1.y << 8;
    data->unk6 = dataCpy[3] >> 8;
    data->unk2 = 0;
    data->unkA = dataCpy[1];

    if (sprite->animNum != 0)
    {
        if (data->unk6 & 8)
        {
            data->unk4 = 0x8001;
        }
        else
        {
            data->unk4 = 0x8002;
        }
    }
    else
    {
        if (data->unk6 & 8)
        {
            data->unk4 = 1;
        }
        else
        {
            data->unk4 = 2;
        }
    }

    data->unkC[0] = (u8)(dataCpy[2] >> 8);
    data->unkC[1] = data->unkC[0] - 2;
    data->unkE_1 = dataCpy[7];

    sprite->callback = DestroyAnimSpriteAfterTimer;
}

static void sub_80DB000(struct Sprite *sprite)
{
    u16 arg;
    u8 mult;

    if (gBattleAnimArgs[2] == 0)
    {
        InitAnimSpritePos(sprite, 0);
    }
    else
    {
        sub_8078764(sprite, FALSE);
    }

    if ((!gBattleAnimArgs[2] && !GetBattlerSide(gBattleAnimAttacker))
        || (gBattleAnimArgs[2] == 1 && !GetBattlerSide(gBattleAnimTarget)))
    {
        sprite->pos1.x += 8;
    }

    SeekSpriteAnim(sprite, gBattleAnimArgs[4]);
    sprite->pos1.x -= 32;
    sprite->data[1] = 0x0ccc;

    arg = gBattleAnimArgs[4];
    mult = 12;
    sprite->pos2.x += mult * arg;
    sprite->data[0] = arg;
    sprite->data[7] = gBattleAnimArgs[3];
    sprite->callback = sub_80DB0A0;
}

static void sub_80DB0A0(struct Sprite *sprite)
{
    sprite->pos2.x += sprite->data[1] >> 8;

    if (++sprite->data[0] == 6)
    {
        sprite->data[0] = 0;
        sprite->pos2.x = 0;
        StartSpriteAnim(sprite, 0);
    }

    if (sprite->data[7]-- == 0)
    {
        DestroyAnimSprite(sprite);
    }
}

void sub_80DB0E8(u8 task)
{
    u16 data = gTasks[task].data[0];
    if ((data & 31) == 0)
    {
        ++gAnimVisualTaskCount;

        gBattleAnimArgs[0] = Sin(gTasks[task].data[0], -13);
        gBattleAnimArgs[1] = Cos(gTasks[task].data[0], -13);
        gBattleAnimArgs[2] = 1;
        gBattleAnimArgs[3] = 3;

        CreateSpriteAndAnimate(&gBattleAnimSpriteTemplate_83DB538,
                               GetBattlerSpriteCoord(gBattleAnimTarget, 2),
                               GetBattlerSpriteCoord(gBattleAnimTarget, 3),
                               3);
    }

    gTasks[task].data[0] += 8;

    if (gTasks[task].data[0] > 0xff)
    {
        DestroyAnimVisualTask(task);
    }
}

static void sub_80DB194(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
        case 0:
            InitAnimSpritePos(sprite, 1);
            gSprites[GetAnimBattlerSpriteId(0)].invisible = 1;
            ++sprite->data[0];
            break;
        case 1:
            if (sprite->affineAnimEnded)
            {
                DestroyAnimSprite(sprite);
            }
    }
}

static void sub_80DB1F4(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
        case 0:
            sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimTarget, 1);
            sprite->pos2.y = -sprite->pos1.y - 32;
            ++sprite->data[0];
            break;
        case 1:
            sprite->pos2.y += 10;
            if (sprite->pos2.y >= 0)
            {
                ++sprite->data[0];
            }
            break;
        case 2:
            sprite->pos2.y -= 10;
            if (sprite->pos1.y + sprite->pos2.y < -32)
            {
                gSprites[GetAnimBattlerSpriteId(0)].invisible = 0;
                DestroyAnimSprite(sprite);
            }
    }
}

static void sub_80DB288(struct Sprite *sprite)
{
    InitAnimSpritePos(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->callback = sub_80DB2D0;
    gSprites[GetAnimBattlerSpriteId(0)].invisible = 1;
}

static void sub_80DB2D0(struct Sprite *sprite)
{
    if (sprite->data[0] > 0)
    {
        --sprite->data[0];
    }
    else if (sprite->pos1.y + sprite->pos2.y > -32)
    {
        sprite->data[2] += sprite->data[1];
        sprite->pos2.y -= (sprite->data[2] >> 8);
    }
    else
    {
        sprite->invisible = 1;
        if (sprite->data[3]++ > 20)
        {
            sprite->callback = sub_80DB330;
        }
    }
}

static void sub_80DB330(struct Sprite *sprite)
{
    sprite->pos2.y += sprite->data[2] >> 8;

    if (sprite->pos1.y + sprite->pos2.y > -32)
    {
        sprite->invisible = 0;
    }

    if (sprite->pos2.y > 0)
    {
        DestroyAnimSprite(sprite);
    }
}

static void sub_80DB374(struct Sprite *sprite)
{
    u32 matrixNum;
    int t1, t2;

    switch (sprite->data[0])
    {
    case 0:
        if (!gBattleAnimArgs[0])
        {
            sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimAttacker, 0);
            sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimAttacker, 1);
        }
        else
        {
            sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimTarget, 0);
            sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimTarget, 1);
        }

        sprite->data[1] = 512;

        sub_8078FDC(sprite, 0, 256, sprite->data[1], 0);
        sprite->data[0]++;
        break;
    case 1:
        if (sprite->data[2] <= 11)
            sprite->data[1] -= 40;
        else
            sprite->data[1] += 40;

        sprite->data[2]++;

        sub_8078FDC(sprite, 0, 256, sprite->data[1], 0);

        matrixNum = sprite->oam.matrixNum;

        t1 = 15616;
        t2 = t1 / gOamMatrices[matrixNum].d + 1;

        if (t2 > 128)
            t2 = 128;

        t2 = (64 - t2) / 2;
        sprite->pos2.y = t2;

        if (sprite->data[2] == 24)
        {
            sub_8079098(sprite);
            DestroyAnimSprite(sprite);
        }
        break;
    }
}

static void sub_80DB458(struct Sprite *sprite)
{
    int v1, v2;

    v1 = 0x1ff & Random();
    v2 = 0x7f & Random();

    if (v1 & 1)
    {
        sprite->data[0] = 736 + v1;
    }
    else
    {
        sprite->data[0] = 736 - v1;
    }

    if (v2 & 1)
    {
        sprite->data[1] = 896 + v2;
    }
    else
    {
        sprite->data[1] = 896 - v2;
    }

    sprite->data[2] = gBattleAnimArgs[0];

    if (sprite->data[2])
    {
        sprite->oam.matrixNum = 8;
    }

    if (gBattleAnimArgs[1] == 0)
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimAttacker, 0);
        sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimAttacker, 1) + 32;
    }
    else
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimTarget, 0);
        sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimTarget, 1) + 32;
    }

    sprite->callback = sub_80DB508;
}

static void sub_80DB508(struct Sprite *sprite)
{
    if (sprite->data[2] == 0)
    {
        sprite->pos2.x += sprite->data[0] >> 8;
        sprite->pos2.y -= sprite->data[1] >> 8;
    }
    else
    {
        sprite->pos2.x -= sprite->data[0] >> 8;
        sprite->pos2.y -= sprite->data[1] >> 8;
    }

    sprite->data[0] = sprite->data[0];
    sprite->data[1] -= 32;

    if (sprite->data[0] < 0)
    {
        sprite->data[0] = 0;
    }

    if (++sprite->data[3] == 31)
    {
        DestroyAnimSprite(sprite);
    }
}

static void sub_80DB564(struct Sprite *sprite)
{
    sprite->data[6] = 0;
    sprite->data[7] = 0x40;
    sprite->callback = sub_80DB578;
}

static void sub_80DB578(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
        case 0:
            if (++sprite->data[1] > 8)
            {
                sprite->data[1] = 0;
                sprite->invisible ^= 1;
                if (++sprite->data[2] > 5 && sprite->invisible)
                {
                    sprite->data[0]++;
                }
            }
            break;
        case 1:
            DestroyAnimSprite(sprite);
    }
}

static void sub_80DB5E4(struct Sprite *sprite)
{
    s16 posx, posy;
    u16 rotation;

    posx = sprite->pos1.x;
    posy = sprite->pos1.y;

    sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
    sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);

    sprite->data[4] = sprite->pos1.x << 4;
    sprite->data[5] = sprite->pos1.y << 4;

    sprite->data[6] = ((posx - sprite->pos1.x) << 4) / 12;
    sprite->data[7] = ((posy - sprite->pos1.y) << 4) / 12;

    rotation = ArcTan2Neg(posx - sprite->pos1.x, posy - sprite->pos1.y);
    rotation += 0xc000;

    sub_8078FDC(sprite, 1, 0x100, 0x100, rotation);

    sprite->callback = sub_80DB6A0;
}

static void sub_80DB6A0(struct Sprite *sprite)
{
    sprite->data[4] += sprite->data[6];
    sprite->data[5] += sprite->data[7];

    sprite->pos1.x = sprite->data[4] >> 4;
    sprite->pos1.y = sprite->data[5] >> 4;

    if ((u16) (sprite->pos1.x + 0x2d) > 0x14a || sprite->pos1.y > 0x9d || sprite->pos1.y < -0x2d)
    {
        DestroySpriteAndMatrix(sprite);
    }
}

void unref_sub_80DB6E4(u8 taskId)
{
    if (gBattleAnimArgs[0] == 0)
    {
        u8 spriteId = GetAnimBattlerSpriteId(0);
        gSprites[spriteId].invisible = 1;
    }
    else
    {
        u8 spriteId = GetAnimBattlerSpriteId(0);
        gSprites[spriteId].invisible = 0;
    }

    DestroyAnimVisualTask(taskId);
}
