#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "blend_palette.h"
#include "decompress.h"
#include "palette.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "ewram.h"

extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern bool8 gAnimScriptActive;
extern void (*gAnimScriptCallback)(void);
extern s16 gBattleAnimArgs[];
extern u8 gAnimBankTarget;
extern u8 gBankSpriteIds[];
extern const struct CompressedSpriteSheet gBattleAnimPicTable[];
extern const struct CompressedSpritePalette gBattleAnimPaletteTable[];
extern const u8 *const gBattleAnims_StatusConditions[];
extern const struct OamData gOamData_837E05C;
extern const struct OamData gOamData_837DF24;

extern u8 GetBattlerSpriteCoord(u8, u8);
extern void sub_80E32E0(u8);


static const struct Subsprite gSubspriteTable_83931B8[] =
{
    {.x = -16, .y = -16, .shape = ST_OAM_SQUARE,      .size = 3, .tileOffset =   0, .priority = 2},
    {.x = -16, .y =  48, .shape = ST_OAM_H_RECTANGLE, .size = 3, .tileOffset =  64, .priority = 2},
    {.x =  48, .y = -16, .shape = ST_OAM_V_RECTANGLE, .size = 3, .tileOffset =  96, .priority = 2},
    {.x =  48, .y =  48, .shape = ST_OAM_SQUARE,      .size = 2, .tileOffset = 128, .priority = 2},
};

static const struct SubspriteTable gSubspriteTables_83931D8[] =
{
    {ARRAY_COUNT(gSubspriteTable_83931B8), gSubspriteTable_83931B8},
};

static const struct SpriteTemplate gSpriteTemplate_83931E0 =
{
    .tileTag = 10010,
    .paletteTag = 10010,
    .oam = &gOamData_837E05C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static void sub_807B870(struct Sprite *);
static const struct SpriteTemplate gSpriteTemplate_83931F8 =
{
    .tileTag = 10136,
    .paletteTag = 10136,
    .oam = &gOamData_837DF24,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_807B870,
};

static void sub_807B7E0(u8);
static void sub_807B8A4(struct Sprite *);
static void sub_807B9D8(u8);
static void sub_807BA24(u8);
static void sub_807BAD4(u8);
static void sub_807BB24(u8);
static void sub_807BDAC(u8);

u8 unref_sub_807B69C(u8 a, u8 b)
{
    u8 spriteId1 = gBankSpriteIds[a];
    u8 taskId = CreateTask(sub_807B7E0, 10);
    u8 spriteId2;
    u8 i;

    LoadCompressedObjectPic(&gBattleAnimPicTable[136]);
    LoadCompressedObjectPalette(&gBattleAnimPaletteTable[136]);
    gTasks[taskId].data[0] = a;
    if (b != 0)
    {
        gTasks[taskId].data[1] = 0x1F;
        for (i = 0; i < 10; i++)
        {
            spriteId2 = CreateSprite(&gSpriteTemplate_83931F8, gSprites[spriteId1].pos1.x, gSprites[spriteId1].pos1.y + 32, 0);
            gSprites[spriteId2].data[0] = i * 51;
            gSprites[spriteId2].data[1] = -256;
            gSprites[spriteId2].invisible = TRUE;
            if (i > 4)
                gSprites[spriteId2].data[6] = 21;
        }
    }
    else
    {
        gTasks[taskId].data[1] = 0x7C00;
        for (i = 0; i < 10; i++)
        {
            spriteId2 = CreateSprite(&gSpriteTemplate_83931F8, gSprites[spriteId1].pos1.x, gSprites[spriteId1].pos1.y - 32, 0);
            gSprites[spriteId2].data[0] = i * 51;
            gSprites[spriteId2].data[1] = 256;
            gSprites[spriteId2].invisible = TRUE;
            if (i > 4)
                gSprites[spriteId2].data[6] = 21;
        }
    }
    gSprites[spriteId2].data[7] = 1;
    return taskId;
}

static void sub_807B7E0(u8 taskId)
{
    if (gTasks[taskId].data[2] == 2)
    {
        gTasks[taskId].data[2] = 0;
        BlendPalette(0x100 + gTasks[taskId].data[0] * 16, 16, gTasks[taskId].data[4], gTasks[taskId].data[1]);
        if (gTasks[taskId].data[5] == 0)
        {
            gTasks[taskId].data[4]++;
            if (gTasks[taskId].data[4] > 8)
                gTasks[taskId].data[5] ^= 1;
        }
        else
        {
            u16 var = gTasks[taskId].data[4];

            gTasks[taskId].data[4]--;
            if (gTasks[taskId].data[4] < 0)
            {
                gTasks[taskId].data[4] = var;
                gTasks[taskId].data[5] ^= 1;
                gTasks[taskId].data[3]++;
                if (gTasks[taskId].data[3] == 2)
                    DestroyTask(taskId);
            }
        }
    }
    else
    {
        gTasks[taskId].data[2]++;
    }
}

static void sub_807B870(struct Sprite *sprite)
{
    if (sprite->data[6] == 0)
    {
        sprite->invisible = FALSE;
        sprite->callback = sub_807B8A4;
        sub_807B8A4(sprite);
    }
    else
    {
        sprite->data[6] --;
    }
}

static void sub_807B8A4(struct Sprite *sprite)
{
    sprite->pos2.x = Cos(sprite->data[0], 32);
    sprite->pos2.y = Sin(sprite->data[0], 8);
    if (sprite->data[0] < 128)
        sprite->subpriority = 29;
    else
        sprite->subpriority = 31;
    sprite->data[0] = (sprite->data[0] + 8) & 0xFF;
    sprite->data[5] += sprite->data[1];
    sprite->pos2.y += sprite->data[5] >> 8;
    sprite->data[2]++;
    if (sprite->data[2] == 52)
    {
        if (sprite->data[7] != 0)
            DestroySpriteAndFreeResources(sprite);
        else
            DestroySprite(sprite);
    }
}

void sub_807B920(u8 taskId)
{
    s16 x = GetBattlerSpriteCoord(gAnimBankTarget, 2) - 32;
    s16 y = GetBattlerSpriteCoord(gAnimBankTarget, 3) - 36;
    u8 spriteId;

    if (IsContest())
        x -= 6;
    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = 0x1000;
    spriteId = CreateSprite(&gSpriteTemplate_83931E0, x, y, 4);
    SetSubspriteTables(&gSprites[spriteId], gSubspriteTables_83931D8);
    gTasks[taskId].data[15] = spriteId;
    gTasks[taskId].func = sub_807B9D8;
}

static void sub_807B9D8(u8 taskId)
{
    gTasks[taskId].data[1]++;
    if (gTasks[taskId].data[1] == 10)
    {
        gTasks[taskId].func = sub_807BA24;
        gTasks[taskId].data[1] = 0;
    }
    else
    {
        u8 var = gTasks[taskId].data[1];

        REG_BLDALPHA = ((16 - var) << 8) | var;
    }
}

static void sub_807BA24(u8 taskId)
{
    u8 r2 = IndexOfSpritePaletteTag(0x271A);

    if (gTasks[taskId].data[1]++ > 13)
    {
        gTasks[taskId].data[2]++;
        if (gTasks[taskId].data[2] == 3)
        {
            u16 temp;

            temp = gPlttBufferFaded[0x100 + r2 * 16 + 13];
            gPlttBufferFaded[0x100 + r2 * 16 + 13] = gPlttBufferFaded[0x100 + r2 * 16 + 14];
            gPlttBufferFaded[0x100 + r2 * 16 + 14] = gPlttBufferFaded[0x100 + r2 * 16 + 15];
            gPlttBufferFaded[0x100 + r2 * 16 + 15] = temp;

            gTasks[taskId].data[2] = 0;
            gTasks[taskId].data[3]++;
            if (gTasks[taskId].data[3] == 3)
            {
                gTasks[taskId].data[3] = 0;
                gTasks[taskId].data[1] = 0;
                gTasks[taskId].data[4]++;
                if (gTasks[taskId].data[4] == 2)
                {
                    gTasks[taskId].data[1] = 9;
                    gTasks[taskId].func = sub_807BAD4;
                }
            }
        }
    }
}

static void sub_807BAD4(u8 taskId)
{
    gTasks[taskId].data[1]--;
    if (gTasks[taskId].data[1] == -1)
    {
        gTasks[taskId].func = sub_807BB24;
        gTasks[taskId].data[1] = 0;
    }
    else
    {
        u8 var = gTasks[taskId].data[1];

        REG_BLDALPHA = ((16 - var) << 8) | var;
    }
}

static void sub_807BB24(u8 taskId)
{
    gTasks[taskId].data[1]++;
    if (gTasks[taskId].data[1] == 37)
    {
        u8 spriteId = gTasks[taskId].data[15];

        FreeSpriteOamMatrix(&gSprites[spriteId]);
        DestroySprite(&gSprites[spriteId]);
    }
    else if (gTasks[taskId].data[1] == 39)
    {
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        DestroyAnimVisualTask(taskId);
    }
}

void sub_807BB88(u8 taskId)
{
    s16 r5;
    s16 r2;
    s16 r3 = 0;

    switch (ewram17840.unk0)
    {
    case 15:  r5 = 0;  r2 = 0;  break;
    case 16:  r5 = 0;  r2 = 1;  break;
    case 17:  r5 = 0;  r2 = 3;  break;
    case 18:  r5 = 0;  r2 = 5;  break;
    case 19:  r5 = 0;  r2 = 6;  break;
    case 20:  r5 = 0;  r2 = 2;  break;
    case 21:  r5 = 0;  r2 = 4;  break;
    case 22:  r5 = 1;  r2 = 0;  break;
    case 23:  r5 = 1;  r2 = 1;  break;
    case 24:  r5 = 1;  r2 = 3;  break;
    case 25:  r5 = 1;  r2 = 5;  break;
    case 26:  r5 = 1;  r2 = 6;  break;
    case 27:  r5 = 1;  r2 = 2;  break;
    case 28:  r5 = 1;  r2 = 4;  break;
    case 39:  r5 = 0;  r2 = 0;     r3 = 1;  break;
    case 40:  r5 = 0;  r2 = 1;     r3 = 1;  break;
    case 41:  r5 = 0;  r2 = 3;     r3 = 1;  break;
    case 42:  r5 = 0;  r2 = 5;     r3 = 1;  break;
    case 43:  r5 = 0;  r2 = 6;     r3 = 1;  break;
    case 44:  r5 = 0;  r2 = 2;     r3 = 1;  break;
    case 45:  r5 = 0;  r2 = 4;     r3 = 1;  break;
    case 46:  r5 = 1;  r2 = 0;     r3 = 1;  break;
    case 47:  r5 = 1;  r2 = 1;     r3 = 1;  break;
    case 48:  r5 = 1;  r2 = 3;     r3 = 1;  break;
    case 49:  r5 = 1;  r2 = 5;     r3 = 1;  break;
    case 50:  r5 = 1;  r2 = 6;     r3 = 1;  break;
    case 51:  r5 = 1;  r2 = 2;     r3 = 1;  break;
    case 52:  r5 = 1;  r2 = 4;     r3 = 1;  break;
    case 55:  r5 = 0;  r2 = 0xFF;  r3 = 0;  break;
    case 56:  r5 = 0;  r2 = 0xFF;  r3 = 1;  break;
    case 57:  r5 = 1;  r2 = 0xFF;  r3 = 0;  break;
    case 58:  r5 = 1;  r2 = 0xFF;  r3 = 1;  break;

    default:
        DestroyAnimVisualTask(taskId);
        return;
    }

    gBattleAnimArgs[0] = r5;
    gBattleAnimArgs[1] = r2;
    gBattleAnimArgs[2] = 0;
    gBattleAnimArgs[3] = 0;
    gBattleAnimArgs[4] = r3;
    gTasks[taskId].func = sub_80E32E0;
    sub_80E32E0(taskId);
}

void move_anim_start_t2(u8 a, u8 b)
{
    u8 taskId;

    gAnimBankAttacker = a;
    gAnimBankTarget = a;
    LaunchBattleAnimation(gBattleAnims_StatusConditions, b, 0);
    taskId = CreateTask(sub_807BDAC, 10);
    gTasks[taskId].data[0] = a;
}

static void sub_807BDAC(u8 taskId)
{
    gAnimScriptCallback();
    if (!gAnimScriptActive)
    {
        ewram17810[gTasks[taskId].data[0]].unk0_4 = 0;
        DestroyTask(taskId);
    }
}
