#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "decompress.h"
#include "palette.h"
#include "rom_8077ABC.h"
#include "sound.h"
#include "task.h"
#include "trig.h"
#include "constants/songs.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern s32 gAnimMoveDmg;
extern u16 gBattle_BG1_X;
extern u16 gBattle_BG1_Y;
extern u16 gBattle_BG3_Y;

extern const u8 gBattleAnimBackgroundTilemap_SandstormBrew[];
extern const u8 gBattleAnimBackgroundImage_SandstormBrew[];
extern const u16 gBattleAnimSpritePalette_261[];
extern const union AnimCmd *const gSpriteAnimTable_83D91F0[];
extern const union AnimCmd *const gSpriteAnimTable_83D95E0[];

extern void AnimMoveTwisterParticle(struct Sprite *sprite);

void sub_80DCE9C(struct Sprite *sprite);
void sub_80DCF60(struct Sprite *sprite);
void sub_80DCFE4(struct Sprite *sprite);
void sub_80DD3AC(struct Sprite *sprite);
void sub_80DD490(struct Sprite *sprite);
void sub_80DD87C(struct Sprite *sprite);
void sub_80DD8E8(struct Sprite *sprite);
void sub_80DD978(struct Sprite *sprite);
void sub_80DD9A4(struct Sprite *sprite);
static void sub_80DCF1C(struct Sprite *sprite);
static void sub_80DD02C(struct Sprite *sprite);
static void sub_80DD190(u8 taskId);
static void sub_80DD604(u8 taskId);
static void sub_80DD774(struct Task *task);
static u8 sub_80DD8BC(void);
static void sub_80DD928(struct Sprite *sprite);
static void sub_80DD9FC(struct Sprite *sprite);

const union AnimCmd gSpriteAnim_83DAC28[] =
{
    ANIMCMD_FRAME(32, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DAC30[] =
{
    ANIMCMD_FRAME(48, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DAC38[] =
{
    ANIMCMD_FRAME(64, 1),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83DAC40[] =
{
    gSpriteAnim_83DAC28,
    gSpriteAnim_83DAC30,
    gSpriteAnim_83DAC38,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DAC4C =
{
    .tileTag = 10058,
    .paletteTag = 10058,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83DAC40,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DCE9C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DAC64 =
{
    .tileTag = 10058,
    .paletteTag = 10058,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83DAC40,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DCF60,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DAC7C =
{
    .tileTag = 10074,
    .paletteTag = 10074,
    .oam = &gOamData_837DF24,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DCFE4,
};

const union AffineAnimCmd gSpriteAffineAnim_83DAC94[] =
{
    AFFINEANIMCMD_FRAME(0xC0, 0xC0, 0, 0),
    AFFINEANIMCMD_FRAME(0x2, 0xFFFD, 0, 5),
    AFFINEANIMCMD_FRAME(0xFFFE, 0x3, 0, 5),
    AFFINEANIMCMD_JUMP(1),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DACB4[] =
{
    gSpriteAffineAnim_83DAC94,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DACB8 =
{
    .tileTag = 10149,
    .paletteTag = 10149,
    .oam = &gOamData_837E0AC,
    .anims = gSpriteAnimTable_83D91F0,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DACB4,
    .callback = sub_80DCFE4,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DACD0 =
{
    .tileTag = 10029,
    .paletteTag = 10029,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D95E0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DCFE4,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DACE8 =
{
    .tileTag = 10261,
    .paletteTag = 10261,
    .oam = &gOamData_837DF54,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DD3AC,
};

const struct Subsprite gSubspriteTable_83DAD00[] =
{
    {.x = -16, .y = 0, .shape = ST_OAM_H_RECTANGLE, .size = 2, .tileOffset = 0, .priority = 1},
    {.x =  16, .y = 0, .shape = ST_OAM_H_RECTANGLE, .size = 2, .tileOffset = 8, .priority = 1},
};

const struct SubspriteTable gSubspriteTables_83DAD10[] =
{
    {ARRAY_COUNT(gSubspriteTable_83DAD00), gSubspriteTable_83DAD00},
};

const union AnimCmd gSpriteAnim_83DAD18[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DAD20[] =
{
    ANIMCMD_FRAME(16, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DAD28[] =
{
    ANIMCMD_FRAME(32, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DAD30[] =
{
    ANIMCMD_FRAME(48, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DAD38[] =
{
    ANIMCMD_FRAME(64, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DAD40[] =
{
    ANIMCMD_FRAME(80, 1),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83DAD48[] =
{
    gSpriteAnim_83DAD18,
    gSpriteAnim_83DAD20,
};

const union AnimCmd *const gSpriteAnimTable_83DAD50[] =
{
    gSpriteAnim_83DAD28,
    gSpriteAnim_83DAD30,
};

const union AnimCmd *const gSpriteAnimTable_83DAD58[] =
{
    gSpriteAnim_83DAD38,
    gSpriteAnim_83DAD40,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DAD60 =
{
    .tileTag = 10058,
    .paletteTag = 10058,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83DAD48,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DD490,
};

const struct SpriteTemplate gSpriteTemplate_83DAD78 =
{
    .tileTag = 10074,
    .paletteTag = 10074,
    .oam = &gOamData_837DF24,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DD87C,
};

const struct SpriteTemplate gSpriteTemplate_83DAD90 =
{
    .tileTag = 10058,
    .paletteTag = 10058,
    .oam = &gOamData_837DF34,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DD87C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DADA8 =
{
    .tileTag = 10058,
    .paletteTag = 10058,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83DAD48,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DD8E8,
};

const union AffineAnimCmd gSpriteAffineAnim_83DADC0[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, -5, 5),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd gSpriteAffineAnim_83DADD0[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 5, 5),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DADE0[] =
{
    gSpriteAffineAnim_83DADC0,
    gSpriteAffineAnim_83DADD0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DADE8 =
{
    .tileTag = 10058,
    .paletteTag = 10058,
    .oam = &gOamData_837DF94,
    .anims = gSpriteAnimTable_83DAD48,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DADE0,
    .callback = sub_80DD978,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DAE00 =
{
    .tileTag = 10058,
    .paletteTag = 10058,
    .oam = &gOamData_837DF94,
    .anims = gSpriteAnimTable_83DAD48,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DADE0,
    .callback = sub_80DD9A4,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DAE18 =
{
    .tileTag = 10058,
    .paletteTag = 10058,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83DAD58,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DADE0,
    .callback = AnimMoveTwisterParticle,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DAE30 =
{
    .tileTag = 10058,
    .paletteTag = 10058,
    .oam = &gOamData_837DF94,
    .anims = gSpriteAnimTable_83DAD50,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DADE0,
    .callback = sub_807A9BC,
};

void sub_80DCE9C(struct Sprite *sprite)
{
    if (gBattleAnimArgs[3] != 0)
        SetAverageBattlerPositions(gAnimBankTarget, 0, &sprite->pos1.x, &sprite->pos1.y);

    sprite->pos1.x += gBattleAnimArgs[0];
    sprite->pos1.y += 14;

    StartSpriteAnim(sprite, gBattleAnimArgs[1]);
    AnimateSprite(sprite);

    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->data[2] = 4;
    sprite->data[3] = 16;
    sprite->data[4] = -70;
    sprite->data[5] = gBattleAnimArgs[2];

    StoreSpriteCallbackInData(sprite, sub_80DCF1C);
    sprite->callback = sub_8078278;
    sprite->callback(sprite);
}

static void sub_80DCF1C(struct Sprite *sprite)
{
    sprite->pos1.x += sprite->data[5];

    sprite->data[0] = 192;
    sprite->data[1] = sprite->data[5];
    sprite->data[2] = 4;
    sprite->data[3] = 32;
    sprite->data[4] = -24;

    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
    sprite->callback = sub_8078278;
    sprite->callback(sprite);
}

void sub_80DCF60(struct Sprite *sprite)
{
    StartSpriteAnim(sprite, gBattleAnimArgs[5]);
    AnimateSprite(sprite);

    if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
        sprite->pos1.x -= gBattleAnimArgs[0];
    else
        sprite->pos1.x += gBattleAnimArgs[0];

    sprite->pos1.y += gBattleAnimArgs[1];

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = sprite->pos1.x + gBattleAnimArgs[2];
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = sprite->pos1.y + gBattleAnimArgs[3];

    InitSpriteDataForLinearTranslation(sprite);
    sprite->data[3] = 0;
    sprite->data[4] = 0;

    sprite->callback = sub_8078394;
    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
}

void sub_80DCFE4(struct Sprite *sprite)
{
    if (gBattleAnimArgs[6] == 0)
        InitAnimSpritePos(sprite, 0);
    else
        sub_8078764(sprite, 0);

    sprite->data[0] = gBattleAnimArgs[3];
    sprite->data[1] = gBattleAnimArgs[2];
    sprite->data[2] = gBattleAnimArgs[4];
    sprite->data[3] = gBattleAnimArgs[5];

    sprite->callback = sub_80DD02C;
}

static void sub_80DD02C(struct Sprite *sprite)
{
    sprite->data[4] += sprite->data[1];
    sprite->pos2.y = -(sprite->data[4] >> 8);
    sprite->pos2.x = Sin(sprite->data[5], sprite->data[3]);
    sprite->data[5] = (sprite->data[5] + sprite->data[2]) & 0xFF;

    if (--sprite->data[0] == -1)
    {
        DestroyAnimSprite(sprite);
    }
}

void do_boulder_dust(u8 taskId)
{
    struct Struct_sub_8078914 subStruct;
    int var0 = 0;

    REG_BLDCNT = 0x3F42;
    REG_BLDALPHA = 0x1000;
    REG_BG1CNT_BITFIELD.priority = 1;
    REG_BG1CNT_BITFIELD.screenSize = 0;

    if (!IsContest())
        REG_BG1CNT_BITFIELD.charBaseBlock = 1;

    gBattle_BG1_X = 0;
    gBattle_BG1_Y = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;

    sub_8078914(&subStruct);
    DmaFill32Defvars(3, 0, subStruct.field_4, 0x1000);
    LZDecompressVram(&gBattleAnimBackgroundTilemap_SandstormBrew, subStruct.field_4);
    LZDecompressVram(&gBattleAnimBackgroundImage_SandstormBrew, subStruct.field_0);
    LoadCompressedPalette(&gBattleAnimSpritePalette_261, subStruct.field_8 << 4, 32);

    if (IsContest())
        sub_80763FC(subStruct.field_8, (u16 *)subStruct.field_4, 0, 0);

    if (gBattleAnimArgs[0] != 0 && GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
        var0 = 1;

    gTasks[taskId].data[0] = var0;
    gTasks[taskId].func = sub_80DD190;
}

static void sub_80DD190(u8 taskId)
{    
    struct Struct_sub_8078914 subStruct;

    if (gTasks[taskId].data[0] == 0)
        gBattle_BG1_X += 0xFFFA;
    else
        gBattle_BG1_X += 6;

    gBattle_BG1_Y += -1;

    switch (gTasks[taskId].data[12])
    {
    case 0:
        if (++gTasks[taskId].data[10] == 4)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[11]++;
            REG_BLDALPHA = gTasks[taskId].data[11] | ((16 - gTasks[taskId].data[11]) << 8);
            if (gTasks[taskId].data[11] == 7)
            {
                gTasks[taskId].data[12]++;
                gTasks[taskId].data[11] = 0;
            }
        }
        break;
    case 1:
        if (++gTasks[taskId].data[11] == 101)
        {
            gTasks[taskId].data[11] = 7;
            gTasks[taskId].data[12]++;
        }
        break;
    case 2:
        if (++gTasks[taskId].data[10] == 4)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[11]--;
            REG_BLDALPHA = gTasks[taskId].data[11] | ((16 - gTasks[taskId].data[11]) << 8);
            if (gTasks[taskId].data[11] == 0)
            {
                gTasks[taskId].data[12]++;
                gTasks[taskId].data[11] = 0;
            }
        }
        break;
    case 3:
        sub_8078914(&subStruct);
        DmaFill32Large(3, 0, subStruct.field_0, 0x2000, 0x1000);
        DmaClear32(3, subStruct.field_4, 0x800);
        if (!IsContest())
            REG_BG1CNT_BITFIELD.charBaseBlock = 0;

        gTasks[taskId].data[12]++;
        // fall through
    case 4:
        gBattle_BG1_X = 0;
        gBattle_BG1_Y = 0;
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        REG_BG1CNT_BITFIELD.priority = 1;
        DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_80DD3AC(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        if (gBattleAnimArgs[3] != 0 && GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
        {
            sprite->pos1.x = 304;
            gBattleAnimArgs[1] = -gBattleAnimArgs[1];
            sprite->data[5] = 1;
            sprite->oam.matrixNum = 8;
        }
        else
        {
            sprite->pos1.x = -64;
        }

        sprite->pos1.y = gBattleAnimArgs[0];
        SetSubspriteTables(sprite, gSubspriteTables_83DAD10);
        sprite->data[1] = gBattleAnimArgs[1];
        sprite->data[2] = gBattleAnimArgs[2];
        sprite->data[0]++;
    }
    else
    {
        sprite->data[3] += sprite->data[1];
        sprite->data[4] += sprite->data[2];
        sprite->pos2.x += (sprite->data[3] >> 8);
        sprite->pos2.y += (sprite->data[4] >> 8);
        sprite->data[3] &= 0xFF;
        sprite->data[4] &= 0xFF;

        if (sprite->data[5] == 0)
        {
            if (sprite->pos1.x + sprite->pos2.x > 272)
            {
                sprite->callback = DestroyAnimSprite;
            }
        }
        else if (sprite->pos1.x + sprite->pos2.x < -32)
        {
            sprite->callback = DestroyAnimSprite;
        }
    }
}

void sub_80DD490(struct Sprite *sprite)
{
    StartSpriteAnim(sprite, gBattleAnimArgs[4]);
    InitAnimSpritePos(sprite, 0);

    sprite->data[0] = gBattleAnimArgs[3];
    sprite->data[2] = sprite->pos1.x;
    sprite->data[4] = sprite->pos1.y + gBattleAnimArgs[2];

    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

void sub_80DD4D4(u8 taskId)
{
    u16 var0, var1, var2, var3;
    u8 var4;
    int var5;
    s16 pan1, pan2;
    struct Task *task;

    task = &gTasks[taskId];

    var0 = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    var1 = GetBattlerSpriteCoord(gAnimBankAttacker, 1) + 24;
    var2 = GetBattlerSpriteCoord(gAnimBankTarget, 2);
    var3 = GetBattlerSpriteCoord(gAnimBankTarget, 1) + 24;

    if ((gAnimBankAttacker ^ 2) == gAnimBankTarget)
        var3 = var1;

    var4 = sub_80DD8BC();
    if (var4 == 1)
        task->data[8] = 32;
    else
        task->data[8] = 48 - (var4 * 8);

    task->data[0] = 0;
    task->data[11] = 0;
    task->data[9] = 0;
    task->data[12] = 1;

    var5 = task->data[8];
    if (var5 < 0)
        var5 += 7;

    task->data[10] = (var5 >> 3) - 1;

    task->data[2] = var0 * 8;
    task->data[3] = var1 * 8;
    task->data[4] = ((var2 - var0) * 8) / task->data[8];
    task->data[5] = ((var3 - var1) * 8) / task->data[8];
    task->data[6] = 0;
    task->data[7] = 0;

    pan1 = BattleAnimAdjustPanning(-64);
    pan2 = BattleAnimAdjustPanning(63);

    task->data[13] = pan1;
    task->data[14] = (pan2 - pan1) / task->data[8];
    task->data[1] = var4;
    task->data[15] = GetAnimBattlerSpriteId(0);

    task->func = sub_80DD604;
}

static void sub_80DD604(u8 taskId)
{
    struct Task *task;

    task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        task->data[6] -= task->data[4];
        task->data[7] -= task->data[5];
        gSprites[task->data[15]].pos2.x = task->data[6] >> 3;
        gSprites[task->data[15]].pos2.y = task->data[7] >> 3;

        if (++task->data[9] == 10)
        {
            task->data[11] = 20;
            task->data[0]++;
        }

        PlaySE12WithPanning(SE_W029, task->data[13]);
        break;
    case 1:
        if (--task->data[11] == 0)
            task->data[0]++;
        break;
    case 2:
        if (--task->data[9] != 0)
        {
            task->data[6] += task->data[4];
            task->data[7] += task->data[5];
        }
        else
        {
            task->data[6] = 0;
            task->data[7] = 0;
            task->data[0]++;
        }

        gSprites[task->data[15]].pos2.x = task->data[6] >> 3;
        gSprites[task->data[15]].pos2.y = task->data[7] >> 3;
        break;
    case 3:
        task->data[2] += task->data[4];
        task->data[3] += task->data[5];
        if (++task->data[9] >= task->data[10])
        {
            task->data[9] = 0;
            sub_80DD774(task);
            task->data[13] += task->data[14];
            PlaySE12WithPanning(SE_W091, task->data[13]);
        }

        if (--task->data[8] == 0)
        {
            task->data[0]++;
        }
        break;
    case 4:
        if (task->data[11] == 0)
            DestroyAnimVisualTask(taskId);
        break;
    }
}

static void sub_80DD774(struct Task *task)
{
    const struct SpriteTemplate *spriteTemplate;
    int var0;
    u16 x, y;
    u8 spriteId;

    switch (task->data[1])
    {
    case 1:
        spriteTemplate = &gSpriteTemplate_83DAD78;
        var0 = 0;
        break;
    case 2:
    case 3:
        spriteTemplate = &gSpriteTemplate_83DAD90;
        var0 = 80;
        break;
    case 4:
        spriteTemplate = &gSpriteTemplate_83DAD90;
        var0 = 64;
        break;
    case 5:
        spriteTemplate = &gSpriteTemplate_83DAD90;
        var0 = 48;
        break;
    default:
        return;
    }

    x = task->data[2] >> 3;
    y = task->data[3] >> 3;
    x += (task->data[12] * 4);

    spriteId = CreateSprite(spriteTemplate, x, y, 35);
    if (spriteId != 64)
    {
        gSprites[spriteId].data[0] = 18;
        gSprites[spriteId].data[2] = ((task->data[12] * 20) + x) + (task->data[1] * 3);
        gSprites[spriteId].data[4] = y;
        gSprites[spriteId].data[5] = -16 - (task->data[1] * 2);
        gSprites[spriteId].oam.tileNum += var0;

        InitAnimArcTranslation(&gSprites[spriteId]);
        task->data[11]++;
    }

    task->data[12] *= -1;
}

void sub_80DD87C(struct Sprite *sprite)
{
    if (TranslateAnimArc(sprite))
    {
        u8 taskId = FindTaskIdByFunc(sub_80DD604);
        if (taskId != 0xFF)
            gTasks[taskId].data[11]--;

        DestroySprite(sprite);
    }
}

u8 sub_80DD8BC(void)
{
    u8 retVal = gAnimDisableStructPtr->rolloutTimer2 - gAnimDisableStructPtr->rolloutTimer1;
    u8 var0 = retVal - 1;
    if (var0 > 4)
    {
        retVal = 1;
    }

    return retVal;
}

void sub_80DD8E8(struct Sprite *sprite)
{
    StartSpriteAnim(sprite, gBattleAnimArgs[4]);

    sprite->pos2.x = gBattleAnimArgs[0];
    sprite->data[2] = gBattleAnimArgs[1];
    sprite->data[3] -= gBattleAnimArgs[2];
    sprite->data[0] = 3;
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->callback = sub_80DD928;
    sprite->invisible = 1;
}

static void sub_80DD928(struct Sprite *sprite)
{
    sprite->invisible = 0;
    if (sprite->data[3] != 0)
    {
        sprite->pos2.y = sprite->data[2] + sprite->data[3];
        sprite->data[3] += sprite->data[0];
        sprite->data[0]++;
        if (sprite->data[3] > 0)
        {
            sprite->data[3] = 0;
        }
    }
    else
    {
        if (--sprite->data[1] == 0)
        {
            DestroyAnimSprite(sprite);
        }
    }
}

void sub_80DD978(struct Sprite *sprite)
{
    if (GetBattlerSide(gAnimBankAttacker) == B_SIDE_OPPONENT)
        StartSpriteAffineAnim(sprite, 1);

    TranslateAnimSpriteToTargetMonLocation(sprite);
}

void sub_80DD9A4(struct Sprite *sprite)
{
    sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankTarget, 0);
    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankTarget, 1);
    sprite->pos1.x += gBattleAnimArgs[0];
    sprite->pos1.y += gBattleAnimArgs[1];

    sprite->data[1] = gBattleAnimArgs[0];
    sprite->data[2] = gBattleAnimArgs[1];
    sprite->data[5] = gBattleAnimArgs[2];

    StartSpriteAnim(sprite, gBattleAnimArgs[3]);
    sprite->callback = sub_80DD9FC;
}

static void sub_80DD9FC(struct Sprite *sprite)
{
    sprite->data[0] += 8;
    sprite->data[3] += sprite->data[1];
    sprite->data[4] += sprite->data[2];

    sprite->pos2.x += sprite->data[3] / 40;
    sprite->pos2.y -= Sin(sprite->data[0], sprite->data[5]);

    if (sprite->data[0] > 140)
        DestroyAnimSprite(sprite);
}

void sub_80DDA4C(u8 taskId)
{
    if (gAnimMoveDmg < 33)
        gBattleAnimArgs[7] = 0;
    if ((u32)gAnimMoveDmg - 33 < 33)
        gBattleAnimArgs[7] = 1;
    if (gAnimMoveDmg > 65)
        gBattleAnimArgs[7] = 2;

    DestroyAnimVisualTask(taskId);
}

void sub_80DDA8C(u8 taskId)
{
    if (gTasks[taskId].data[0] == 0)
    {
        sub_80789D4(0);
        gTasks[taskId].data[1] = 200;
    }

    gBattle_BG3_Y += gTasks[taskId].data[1] / 10;
    gTasks[taskId].data[1] -= 3;

    if (gTasks[taskId].data[0] == 120)
    {
        sub_80789D4(1);
        DestroyAnimVisualTask(taskId);
    }

    gTasks[taskId].data[0]++;
}

void sub_80DDAF0(u8 taskId)
{
    if (gTasks[taskId].data[0] == 0)
    {
        sub_80789D4(0);
        gTasks[taskId].data[0]++;
        gTasks[taskId].data[2] = gBattle_BG3_Y;
    }

    gTasks[taskId].data[1] += 80;
    gTasks[taskId].data[1] &= 0xFF;
    gBattle_BG3_Y = gTasks[taskId].data[2] + Cos(4, gTasks[taskId].data[1]);

    if (gBattleAnimArgs[7] == 0xFFF)
    {
        gBattle_BG3_Y = 0;
        sub_80789D4(1);
        DestroyAnimVisualTask(taskId);
    }
}
