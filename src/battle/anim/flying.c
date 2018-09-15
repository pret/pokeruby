#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "palette.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "main.h"
#include "random.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern u8 gAnimVisualTaskCount;
extern struct OamMatrix gOamMatrices[];
extern u8 gBanksBySide[];
extern const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB538;

void sub_80785E4(struct Sprite *sprite);
void sub_80DA034(struct Sprite *sprite);
void sub_80DA05C(struct Sprite *sprite);
void sub_80DA16C(struct Sprite *sprite);
void sub_80DA1EC(struct Sprite *sprite);
void sub_80DA208(struct Sprite *sprite);
void sub_80DA300(struct Sprite *sprite);
void sub_80DA348(struct Sprite *sprite);
void sub_80DA38C(struct Sprite *sprite);
void sub_80DA4D8(struct Sprite *sprite);
void sub_80DA410(struct Sprite *sprite);
void sub_80DA6F0(struct Sprite *sprite);
void sub_80DAD30(struct Sprite *sprite);
void sub_80DAD84(struct Sprite *sprite);
void sub_80DAF0C(struct Sprite *sprite);
void sub_80DB000(struct Sprite *sprite);
void sub_80DB0A0(struct Sprite *sprite);
void sub_80DB194(struct Sprite *sprite);
void sub_80DB1F4(struct Sprite *sprite);
void sub_80DB288(struct Sprite *sprite);
void sub_80DB2D0(struct Sprite *sprite);
void sub_80DB330(struct Sprite *sprite);
void sub_80DB374(struct Sprite *sprite);
void sub_80DB458(struct Sprite *sprite);
void sub_80DB508(struct Sprite *sprite);
void sub_80DB564(struct Sprite *sprite);
void sub_80DB578(struct Sprite *sprite);
void sub_80DB5E4(struct Sprite *sprite);
void sub_80DB6A0(struct Sprite *sprite);

void sub_80DA0DC(u8 taskId);

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA380 =
{
    .tileTag = 10009,
    .paletteTag = 10009,
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
    .tileTag = 10009,
    .paletteTag = 10009,
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
    .tileTag = 10154,
    .paletteTag = 10154,
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
    .tileTag = 10156,
    .paletteTag = 10156,
    .oam = &gOamData_837DFFC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA424,
    .callback = sub_80DA300,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA468 =
{
    .tileTag = 10156,
    .paletteTag = 10156,
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
    .tileTag = 10270,
    .paletteTag = 10270,
    .oam = &gOamData_837DF94,
    .anims = gSpriteAnimTable_83DA490,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DA4D8,
};

const u16 gUnknownPalette_83DA4B0[] = INCBIN_U16("graphics/unknown/unknown_3DA4B0.gbapal");

const struct SpriteTemplate gSpriteTemplate_83DA4D0 =
{
    .tileTag = 10155,
    .paletteTag = 10155,
    .oam = &gOamData_837DF2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DAD30,
};

const struct SpriteTemplate gSpriteTemplate_83DA4E8 =
{
    .tileTag = 10270,
    .paletteTag = 10270,
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
    .tileTag = 10162,
    .paletteTag = 10162,
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
    .tileTag = 10156,
    .paletteTag = 10156,
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
    .tileTag = 10156,
    .paletteTag = 10156,
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
    .tileTag = 10156,
    .paletteTag = 10156,
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
    .tileTag = 10272,
    .paletteTag = 10272,
    .oam = &gOamData_837DFFC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DB374,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA62C =
{
    .tileTag = 10273,
    .paletteTag = 10273,
    .oam = &gOamData_837DF24,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DB458,
};

const struct SpriteTemplate gSpriteTemplate_83DA644 =
{
    .tileTag = 10212,
    .paletteTag = 10212,
    .oam = &gOamData_837E05C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DB564,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA65C =
{
    .tileTag = 10284,
    .paletteTag = 10284,
    .oam = &gOamData_837DFFC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DB5E4,
};

void sub_80DA034(struct Sprite *sprite)
{
    sub_8078764(sprite, 0);
    sprite->pos1.y += 20;
    sprite->data[1] = 0xBF;
    sprite->callback = sub_80DA05C;
    sub_80DA05C(sprite);
}

void sub_80DA05C(struct Sprite *sprite) {
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

void sub_80DA0DC(u8 taskId)
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

void sub_80DA16C(struct Sprite *sprite)
{
    InitAnimSpritePos(sprite, 1);
    if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2) + gBattleAnimArgs[2];
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3) + gBattleAnimArgs[3];
    InitAnimLinearTranslation(sprite);
    sprite->callback = sub_80785E4;
    StoreSpriteCallbackInData(sprite, sub_80DA1EC);
}

void sub_80DA1EC(struct Sprite *sprite)
{
    if (TranslateAnimLinear(sprite) != 0)
    {
        DestroyAnimSprite(sprite);
    }
}

void sub_80DA208(struct Sprite *sprite)
{
    if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
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

    sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
    sprite->pos1.x += gBattleAnimArgs[0];
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[4];

    if (gBattleAnimArgs[6] == 0)
    {
        sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
        sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3);
    }
    else
    {
        SetAverageBattlerPositions(gAnimBankTarget, 1, &sprite->data[2], &sprite->data[4]);
    }

    sprite->data[2] = sprite->data[2] + gBattleAnimArgs[2];
    sprite->data[4] = sprite->data[4] + gBattleAnimArgs[3];
    sprite->callback = StartAnimLinearTranslation;

    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    SeekSpriteAnim(sprite, gBattleAnimArgs[5]);
}

void sub_80DA300(struct Sprite *sprite)
{
    InitAnimSpritePos(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->callback = sub_80DA348;
    gSprites[GetAnimBattlerSpriteId(0)].invisible = 1;
}

void sub_80DA348(struct Sprite *sprite)
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

void sub_80DA38C(struct Sprite *sprite)
{
    if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
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
    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3);

    InitAnimLinearTranslation(sprite);
    sprite->callback = sub_80DA410;
}

void sub_80DA410(struct Sprite *sprite)
{
    sprite->data[0] = 1;
    TranslateAnimLinear(sprite);

    if (((u16) sprite->data[3] >> 8) > 200)
    {
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos2.x = 0;
        sprite->data[3] &= 0xFF;
    }

    if ((u32) (sprite->pos1.x + sprite->pos2.x + 32) > 304 || sprite->pos1.y + sprite->pos2.y > 160)
    {
        gSprites[GetAnimBattlerSpriteId(0)].invisible = 0;
        DestroyAnimSprite(sprite);
    }
}

void sub_80DA48C(struct Sprite *sprite)
{
    if (sprite->data[0]-- <= 0)
    {
        if (sprite->oam.affineMode & 1)
        {
            FreeOamMatrix(sprite->oam.matrixNum);
            sprite->oam.affineMode = 0;
        }

        DestroySprite(sprite);
        gAnimVisualTaskCount--;
    }
}

// FAKEMATCHING
void sub_80DA4D8(struct Sprite *sprite)
{
    s16 *data;
    u8 slot;
    s16 spriteCoord;
    int t1, t2;
    u32 arg2;
    u32 matrixNum;
    u8 sinIndex;
    register s16 sinVal asm ("r4");
    register int sinVal2 asm ("r0");

    data = sprite->data;

    if (gBattleAnimArgs[7] & 0x100)
    {
        slot = gAnimBankAttacker;
    }
    else
    {
        slot = gAnimBankTarget;
    }

    if (GetBattlerSide(slot) == 0)
    {
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
    }

    sprite->pos1.x = GetBattlerSpriteCoord(slot, 0) + gBattleAnimArgs[0];
    spriteCoord = GetBattlerSpriteCoord(slot, 1);
    sprite->pos1.y = spriteCoord + gBattleAnimArgs[1];
    data[4] = sprite->pos1.y << 8;

    t1 = (spriteCoord + (u16) gBattleAnimArgs[6]) << 1;
    data[7] = (data[7] & 1) | t1;
    ((u8 *) data)[0] |= 4;

    arg2 = (u16) gBattleAnimArgs[2];
    data[1] = (u8) gBattleAnimArgs[2];
    arg2 <<= 16;
    data[5] = arg2 >> 24;
    data[2] = gBattleAnimArgs[3];
    data[3] = gBattleAnimArgs[4];
    data[6] = gBattleAnimArgs[5];

    if ((u16) (data[1] - 64) <= 0x7f)
    {
        if (gMain.inBattle)
        {
            sprite->oam.priority = sub_8079ED4(slot) + 1;
        }
        else
        {
            sprite->oam.priority = sub_8079ED4(slot);
        }

        ((u8 *) data)[14] = data[7] & -2;

        if (!(data[2] & 0x8000))
        {
            sprite->hFlip ^= 1;
            sprite->animNum = sprite->hFlip;

            sprite->animBeginning = 1;
            sprite->animEnded = 0;
        }
    }
    else
    {
        sprite->oam.priority = sub_8079ED4(slot);
        ((u8 *) data)[14] |= 1;

        if (data[2] & 0x8000)
        {
            sprite->hFlip ^= 1;
            sprite->animNum = sprite->hFlip;

            sprite->animBeginning = 1;
            sprite->animEnded = 0;
        }
    }

    t2 = (u16) data[1] >> 6 << 4;
    ((u8 *) data)[0] = (15 & data[0]) | t2;

    sprite->pos2.x = (gSineTable[(u16) data[1]] * (u8) data[6]) >> 8;

    matrixNum = sprite->oam.matrixNum;

    sinIndex = (-sprite->pos2.x >> 1) + data[5];
    sinVal = gSineTable[sinIndex];

    gOamMatrices[matrixNum].a = gOamMatrices[matrixNum].d = gSineTable[sinIndex + 64];
    gOamMatrices[matrixNum].b = sinVal;
    sinVal2 = -sinVal;
    gOamMatrices[matrixNum].c = sinVal2;

    sprite->callback = sub_80DA6F0;
}

#ifdef NONMATCHING
void sub_80DA6F0(struct Sprite * sprite)
{
    // (Probably) Functionally equivalent

    struct dataStruct {
        u8 one:1;
        u8 two:1;
        u8 three:1;
        u8 four:1;
        u8 fiveeight:4;
    };

    u8 zero;
    s16 * data;
    u8 * dataByte;

    u16 r8;
    u32 matrixNum;
    u8 sinIndex;
    s16 sinVal;

    zero = 0;
    data = sprite->data;
    dataByte = (u8 *)data;

    if (dataByte[0] & 1)
    {
        u32 t1;

        t1 = dataByte[1];
        dataByte[1] += 0xff;

        t1 <<= 24;
        if (t1 == 0)
        {
            // 080da724
            ((struct dataStruct *)dataByte)[0].one = 0;
            dataByte[1] = zero;
        }

    }
    else
    {
        // 080da730
        u16 tData;
        u16 t2;

        tData = data[1];
        t2 = tData >> 6;
        r8 = tData;

        switch (t2)
        {
            case (0):
                // 080da756

                if (dataByte[0] >> 4 == 1)
                {
                    dataByte[0] |= 8;
                    dataByte[0] |= 1;
                    dataByte[1] = zero;
                }
                else if (dataByte[0] >> 4 == 3)
                {
                    /*080da76c*/
                    ((struct dataStruct *)dataByte)[0].two ^= 1;
                    ((struct dataStruct *)dataByte)[0].one = 1;
                    dataByte[1] = zero;
                }
                else
                {
                    // 080da790
                    if (dataByte[0] & 8)
                    {
                        sprite->hFlip ^= 1;
                        sprite->animNum = sprite->hFlip;
                        sprite->animBeginning = 1;
                        sprite->animEnded = 0;

                        if ((dataByte)[0] & 4)
                        {
                            u8 b;
                            if (gMain.inBattle)
                            {
                                if (!(dataByte[14] & 1))
                                {
                                    sprite->oam.priority -= 1;
                                }
                                else
                                {
                                    // 080da814
                                    sprite->oam.priority += 1;
                                }
                            }
                            else
                            {
                                // 080da82e
                                if (!(dataByte[14] & 1))
                                {
                                    sprite->subpriority -= 12;
                                }
                                else
                                {
                                    // 080da85c
                                    sprite->subpriority += 12;
                                }
                            }
                            b = (((u32)(dataByte[14] << 31) >> 31) ^ 1) & 1;
                            dataByte[14] = (dataByte[14] & -2) | b;
                        }
                        // 080da87a
                        ((struct dataStruct *)dataByte)[0].four = 0;
                        r8 = data[1];
                    }
                }

                // 080da88a
                dataByte[0] &= 15;
                // 080dac52
                break;
            case (1):
                // 080da896
                if (dataByte[0] >> 4 == 0)
                {
                    dataByte[0] |= 8;
                    dataByte[0] |= 1;
                    dataByte[1] = zero;
                }
                else/*080da8ac*/if (dataByte[0] >> 4 == 2)
                {
                    dataByte[0] |= 1;
                    dataByte[1] = zero;
                }
                else
                    {
                    // 080da8be
                    if (dataByte[0] & 8)
                    {
                        sprite->hFlip ^= 1;
                        sprite->animNum = sprite->hFlip;
                        sprite->animBeginning = 1;
                        sprite->animEnded = 0;

                        if (dataByte[0] & 4)
                        {
                            u8 b;
                            if (gMain.inBattle)
                            {
                                if (!(dataByte[14] & 1))
                                {
                                    sprite->oam.priority -= 1;
                                }
                                else
                                {
                                    // 080da948
                                    sprite->oam.priority += 1;
                                }
                            }
                            else
                            {
                                // 080da962
                                if (!(dataByte[14] & 1))
                                {
                                    sprite->subpriority -=12;
                                }
                                else
                                {
                                    // 080da98c
                                    sprite->subpriority += 12;
                                }
                            }
                            // 080da978 + 080da996
                            b = (((u32)(dataByte[14] << 31) >> 31) ^ 1) & 1;
                            dataByte[14] = (dataByte[14] & -2) | b;
                        }
                        // 080da9ac
                        ((struct dataStruct *)dataByte)[0].four = 0;
                        r8 = data[1];
                    }
                }
                // 080da9bc
                dataByte[0] &= 15;
                dataByte[0] |= 16;
                // 080dac52
                break;
            case (2):
                // 080da9c8
                if (dataByte[0] >> 4 == 3)
                {
                    dataByte[0] |= 8;
                    dataByte[0] |= 1;
                    dataByte[1] = zero;
                }
                else/*080da9de*/if (dataByte[0] >> 4 == 1)
                {
                    dataByte[0] |= 1;
                    dataByte[1] = zero;
                }
                else
                {
                    // 080da9f0
                    if (dataByte[0] & 8)
                    {
                        // 080da9fa
                        sprite->hFlip ^= 1;
                        sprite->animNum = sprite->hFlip;
                        sprite->animBeginning = 1;
                        sprite->animEnded = 0;

                        if (dataByte[0] & 4)
                        {
                            u8 b;
                            if (gMain.inBattle)
                            {
                                if (!(dataByte[14] & 1))
                                {
                                    sprite->oam.priority -= 1;
                                }
                                else
                                {
                                    // 080daa74
                                    sprite->oam.priority += 1;
                                }
                            }
                            else
                            {
                                // 080daaa4
                                if (!(dataByte[14] & 1))
                                {
                                    sprite->subpriority -= 12;
                                }
                                else
                                {
                                    // 080daace
                                    sprite->subpriority += 12;
                                }
                            }
                            b = (((u32)(dataByte[14] << 31) >> 31) ^ 1) & 1;
                            dataByte[14] = (dataByte[14] & -2) | b;
                        }
                        // 080daaec
                        ((struct dataStruct *)dataByte)[0].four = 0;
                        r8 = data[1];
                    }
                }
                // 080daafe
                dataByte[0] &= 15;
                dataByte[0] |= 32;
                // 080dac52
                break;
            case (3):
                // 080dab0e
                if (dataByte[0] >> 4 == 2)
                {
                    dataByte[0] |= 8;
                    // 080dac42
                }
                else/*080dab20*/if (dataByte[0] >> 4 == 0)
                {
                    ((struct dataStruct *)dataByte)[0].two ^= 1;
                    ((struct dataStruct *)dataByte)[0].one = 1;
                    dataByte[1] = zero;
                    // 080dac42
                }
                else
                {
                    // 080dab44
                    if (dataByte[0] & 8)
                    {
                        sprite->hFlip ^= 1;
                        sprite->animNum = sprite->hFlip;
                        sprite->animBeginning = 1;
                        sprite->animEnded = 0;

                        if (dataByte[0] & 4)
                        {
                            u8 b;
                            if (gMain.inBattle)
                            {
                                if (!(dataByte[14] & 1))
                                {
                                    sprite->oam.priority -= 1;
                                }
                                else
                                {
                                    // 080dabcc
                                    sprite->oam.priority += 1;
                                }
                            }
                            else
                            {
                                // 080dabe6
                                if (!(dataByte[14] & 1))
                                {
                                    sprite->subpriority -= 12;
                                }
                                else
                                {
                                    // 080dac14
                                    sprite->subpriority += 12;
                                }
                            }
                            // 080dac00 + 080dac1e
                            b = (((u32)(dataByte[14]) << 31 >> 31) ^ 1) & 1;
                            dataByte[14] = (-2 & dataByte[14]) | b;
                        }
                        // 080dac32
                        ((struct dataStruct *)dataByte)[0].four = 0;
                        r8 = data[1];
                    }
                }
                // 080dac42
                dataByte[0] &= 15;
                dataByte[0] |= 48;
                break;
        }

        // 080dac52

        sprite->pos2.x = (dataByte[12 + ((struct dataStruct *)dataByte)[0].two] * gSineTable[r8]) >> 8;

        matrixNum = sprite->oam.matrixNum;

        sinIndex = (-sprite->pos2.x >> 1) + dataByte[10];
        sinVal = gSineTable[sinIndex];

        gOamMatrices[matrixNum].a = gOamMatrices[matrixNum].d = gSineTable[sinIndex + 64];
        gOamMatrices[matrixNum].b = sinVal;
        gOamMatrices[matrixNum].c = -sinVal;

        data[4] += data[3];

        sprite->pos1.y = (u16)data[4] >> 8;

        if (data[2] & (0x80 << 8))
        {
            data[1] = (data[1] - (data[2] & ((0x80 << 8) - 1))) & 0xff;
        }
        else
        {
            // 080dace8
            data[1] = ((data[2] & 0x7fff) + data[1]) & 0xff;
        }
        // 080dacfe
        if (sprite->pos1.y + sprite->pos2.y >= (u16)data[7] / 2)
        {
            sprite->data[0] = 0;
            sprite->callback = sub_80DA48C;
        }
    }
}
#else
NAKED
void sub_80DA6F0(struct Sprite *sprite)
{
    asm_unified("push {r4-r7,lr}\n\
	mov r7, r9\n\
	mov r6, r8\n\
	push {r6,r7}\n\
	adds r5, r0, 0\n\
	movs r6, 0\n\
	movs r0, 0x2E\n\
	adds r0, r5\n\
	mov r12, r0\n\
	ldrb r2, [r0]\n\
	movs r7, 0x1\n\
	movs r1, 0x1\n\
	mov r9, r1\n\
	mov r0, r9\n\
	ands r0, r2\n\
	cmp r0, 0\n\
	beq _080DA730\n\
	mov r3, r12\n\
	ldrb r0, [r3, 0x1]\n\
	adds r1, r0, 0\n\
	adds r1, 0xFF\n\
	strb r1, [r3, 0x1]\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	beq _080DA724\n\
	b _080DAD1A\n\
_080DA724:\n\
	movs r0, 0x2\n\
	negs r0, r0\n\
	ands r0, r2\n\
	strb r0, [r3]\n\
	strb r6, [r3, 0x1]\n\
	b _080DAD1A\n\
_080DA730:\n\
	mov r4, r12\n\
	ldrh r0, [r4, 0x2]\n\
	lsrs r4, r0, 6\n\
	mov r8, r0\n\
	cmp r4, 0x1\n\
	bne _080DA73E\n\
	b _080DA896\n\
_080DA73E:\n\
	cmp r4, 0x1\n\
	bgt _080DA748\n\
	cmp r4, 0\n\
	beq _080DA756\n\
	b _080DAC52\n\
_080DA748:\n\
	cmp r4, 0x2\n\
	bne _080DA74E\n\
	b _080DA9C8\n\
_080DA74E:\n\
	cmp r4, 0x3\n\
	bne _080DA754\n\
	b _080DAB0E\n\
_080DA754:\n\
	b _080DAC52\n\
_080DA756:\n\
	lsls r1, r2, 24\n\
	lsrs r0, r1, 28\n\
	cmp r0, 0x1\n\
	bne _080DA76C\n\
	movs r0, 0x8\n\
	orrs r0, r2\n\
	orrs r0, r7\n\
	mov r1, r12\n\
	strb r0, [r1]\n\
	strb r6, [r1, 0x1]\n\
	b _080DA88A\n\
_080DA76C:\n\
	lsrs r0, r1, 28\n\
	cmp r0, 0x3\n\
	bne _080DA790\n\
	lsls r0, r2, 30\n\
	lsrs r0, 31\n\
	movs r1, 0x1\n\
	eors r0, r1\n\
	ands r0, r7\n\
	lsls r0, 1\n\
	movs r1, 0x3\n\
	negs r1, r1\n\
	ands r1, r2\n\
	orrs r1, r0\n\
	orrs r1, r7\n\
	mov r2, r12\n\
	strb r1, [r2]\n\
	strb r6, [r2, 0x1]\n\
	b _080DA88A\n\
_080DA790:\n\
	movs r0, 0x8\n\
	ands r0, r2\n\
	cmp r0, 0\n\
	beq _080DA88A\n\
	adds r3, r5, 0\n\
	adds r3, 0x3F\n\
	ldrb r2, [r3]\n\
	lsls r1, r2, 31\n\
	lsrs r1, 31\n\
	movs r4, 0x1\n\
	eors r1, r4\n\
	ands r1, r7\n\
	movs r6, 0x2\n\
	negs r6, r6\n\
	adds r0, r6, 0\n\
	ands r0, r2\n\
	orrs r0, r1\n\
	strb r0, [r3]\n\
	lsls r0, 31\n\
	lsrs r0, 31\n\
	adds r1, r5, 0\n\
	adds r1, 0x2A\n\
	strb r0, [r1]\n\
	ldrb r0, [r3]\n\
	movs r1, 0x4\n\
	orrs r0, r1\n\
	movs r1, 0x11\n\
	negs r1, r1\n\
	ands r0, r1\n\
	strb r0, [r3]\n\
	mov r3, r12\n\
	ldrb r1, [r3]\n\
	movs r0, 0x4\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080DA87A\n\
	ldr r0, _080DA80C @ =gMain\n\
	ldr r1, _080DA810 @ =0x0000043d\n\
	adds r0, r1\n\
	ldrb r1, [r0]\n\
	movs r0, 0x2\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080DA82E\n\
	ldrb r1, [r3, 0xE]\n\
	mov r0, r9\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _080DA814\n\
	ldrb r2, [r5, 0x5]\n\
	lsls r1, r2, 28\n\
	lsrs r1, 30\n\
	subs r1, 0x1\n\
	movs r0, 0x3\n\
	ands r1, r0\n\
	lsls r1, 2\n\
	movs r0, 0xD\n\
	negs r0, r0\n\
	ands r0, r2\n\
	orrs r0, r1\n\
	strb r0, [r5, 0x5]\n\
	b _080DA868\n\
	.align 2, 0\n\
_080DA80C: .4byte gMain\n\
_080DA810: .4byte 0x0000043d\n\
_080DA814:\n\
	ldrb r2, [r5, 0x5]\n\
	lsls r1, r2, 28\n\
	lsrs r1, 30\n\
	adds r1, 0x1\n\
	movs r0, 0x3\n\
	ands r1, r0\n\
	lsls r1, 2\n\
	movs r0, 0xD\n\
	negs r0, r0\n\
	ands r0, r2\n\
	orrs r0, r1\n\
	strb r0, [r5, 0x5]\n\
	b _080DA866\n\
_080DA82E:\n\
	mov r0, r12\n\
	ldrb r1, [r0, 0xE]\n\
	mov r0, r9\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _080DA85C\n\
	adds r1, r5, 0\n\
	adds r1, 0x43\n\
	ldrb r0, [r1]\n\
	subs r0, 0xC\n\
	strb r0, [r1]\n\
	mov r1, r12\n\
	ldrb r2, [r1, 0xE]\n\
	lsls r0, r2, 31\n\
	lsrs r0, 31\n\
	eors r0, r4\n\
	ands r0, r7\n\
	adds r1, r6, 0\n\
	ands r1, r2\n\
	orrs r1, r0\n\
	mov r2, r12\n\
	strb r1, [r2, 0xE]\n\
	b _080DA87A\n\
_080DA85C:\n\
	adds r1, r5, 0\n\
	adds r1, 0x43\n\
	ldrb r0, [r1]\n\
	adds r0, 0xC\n\
	strb r0, [r1]\n\
_080DA866:\n\
	mov r3, r12\n\
_080DA868:\n\
	ldrb r2, [r3, 0xE]\n\
	lsls r0, r2, 31\n\
	lsrs r0, 31\n\
	eors r0, r4\n\
	ands r0, r7\n\
	adds r1, r6, 0\n\
	ands r1, r2\n\
	orrs r1, r0\n\
	strb r1, [r3, 0xE]\n\
_080DA87A:\n\
	mov r4, r12\n\
	ldrb r1, [r4]\n\
	movs r0, 0x9\n\
	negs r0, r0\n\
	ands r0, r1\n\
	strb r0, [r4]\n\
	ldrh r0, [r4, 0x2]\n\
	mov r8, r0\n\
_080DA88A:\n\
	mov r2, r12\n\
	ldrb r1, [r2]\n\
	movs r0, 0xF\n\
	ands r0, r1\n\
	strb r0, [r2]\n\
	b _080DAC52\n\
_080DA896:\n\
	lsls r1, r2, 24\n\
	lsrs r0, r1, 28\n\
	cmp r0, 0\n\
	bne _080DA8AC\n\
	movs r0, 0x8\n\
	orrs r0, r2\n\
	orrs r0, r7\n\
	mov r3, r12\n\
	strb r0, [r3]\n\
	strb r6, [r3, 0x1]\n\
	b _080DA9BC\n\
_080DA8AC:\n\
	lsrs r0, r1, 28\n\
	cmp r0, 0x2\n\
	bne _080DA8BE\n\
	adds r0, r2, 0\n\
	orrs r0, r7\n\
	mov r4, r12\n\
	strb r0, [r4]\n\
	strb r6, [r4, 0x1]\n\
	b _080DA9BC\n\
_080DA8BE:\n\
	movs r0, 0x8\n\
	ands r0, r2\n\
	cmp r0, 0\n\
	beq _080DA9BC\n\
	adds r3, r5, 0\n\
	adds r3, 0x3F\n\
	ldrb r2, [r3]\n\
	lsls r1, r2, 31\n\
	lsrs r1, 31\n\
	movs r4, 0x1\n\
	eors r1, r4\n\
	ands r1, r7\n\
	movs r6, 0x2\n\
	negs r6, r6\n\
	adds r0, r6, 0\n\
	ands r0, r2\n\
	orrs r0, r1\n\
	strb r0, [r3]\n\
	lsls r0, 31\n\
	lsrs r0, 31\n\
	adds r1, r5, 0\n\
	adds r1, 0x2A\n\
	strb r0, [r1]\n\
	ldrb r0, [r3]\n\
	movs r1, 0x4\n\
	orrs r0, r1\n\
	movs r1, 0x11\n\
	negs r1, r1\n\
	ands r0, r1\n\
	strb r0, [r3]\n\
	mov r0, r12\n\
	ldrb r1, [r0]\n\
	movs r0, 0x4\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080DA9AC\n\
	ldr r0, _080DA940 @ =gMain\n\
	ldr r1, _080DA944 @ =0x0000043d\n\
	adds r0, r1\n\
	ldrb r1, [r0]\n\
	movs r0, 0x2\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080DA962\n\
	mov r2, r12\n\
	ldrb r1, [r2, 0xE]\n\
	mov r0, r9\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _080DA948\n\
	ldrb r2, [r5, 0x5]\n\
	lsls r1, r2, 28\n\
	lsrs r1, 30\n\
	subs r1, 0x1\n\
	movs r0, 0x3\n\
	ands r1, r0\n\
	lsls r1, 2\n\
	movs r0, 0xD\n\
	negs r0, r0\n\
	ands r0, r2\n\
	orrs r0, r1\n\
	strb r0, [r5, 0x5]\n\
	mov r3, r12\n\
	b _080DA978\n\
	.align 2, 0\n\
_080DA940: .4byte gMain\n\
_080DA944: .4byte 0x0000043d\n\
_080DA948:\n\
	ldrb r2, [r5, 0x5]\n\
	lsls r1, r2, 28\n\
	lsrs r1, 30\n\
	adds r1, 0x1\n\
	movs r0, 0x3\n\
	ands r1, r0\n\
	lsls r1, 2\n\
	movs r0, 0xD\n\
	negs r0, r0\n\
	ands r0, r2\n\
	orrs r0, r1\n\
	strb r0, [r5, 0x5]\n\
	b _080DA996\n\
_080DA962:\n\
	mov r3, r12\n\
	ldrb r1, [r3, 0xE]\n\
	mov r0, r9\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _080DA98C\n\
	adds r1, r5, 0\n\
	adds r1, 0x43\n\
	ldrb r0, [r1]\n\
	subs r0, 0xC\n\
	strb r0, [r1]\n\
_080DA978:\n\
	ldrb r2, [r3, 0xE]\n\
	lsls r0, r2, 31\n\
	lsrs r0, 31\n\
	eors r0, r4\n\
	ands r0, r7\n\
	adds r1, r6, 0\n\
	ands r1, r2\n\
	orrs r1, r0\n\
	strb r1, [r3, 0xE]\n\
	b _080DA9AC\n\
_080DA98C:\n\
	adds r1, r5, 0\n\
	adds r1, 0x43\n\
	ldrb r0, [r1]\n\
	adds r0, 0xC\n\
	strb r0, [r1]\n\
_080DA996:\n\
	mov r0, r12\n\
	ldrb r2, [r0, 0xE]\n\
	lsls r0, r2, 31\n\
	lsrs r0, 31\n\
	eors r0, r4\n\
	ands r0, r7\n\
	adds r1, r6, 0\n\
	ands r1, r2\n\
	orrs r1, r0\n\
	mov r2, r12\n\
	strb r1, [r2, 0xE]\n\
_080DA9AC:\n\
	mov r3, r12\n\
	ldrb r1, [r3]\n\
	movs r0, 0x9\n\
	negs r0, r0\n\
	ands r0, r1\n\
	strb r0, [r3]\n\
	ldrh r4, [r3, 0x2]\n\
	mov r8, r4\n\
_080DA9BC:\n\
	mov r1, r12\n\
	ldrb r0, [r1]\n\
	movs r1, 0xF\n\
	ands r1, r0\n\
	movs r0, 0x10\n\
	b _080DAC4C\n\
_080DA9C8:\n\
	lsls r1, r2, 24\n\
	lsrs r0, r1, 28\n\
	cmp r0, 0x3\n\
	bne _080DA9DE\n\
	movs r0, 0x8\n\
	orrs r0, r2\n\
	orrs r0, r7\n\
	mov r3, r12\n\
	strb r0, [r3]\n\
	strb r6, [r3, 0x1]\n\
	b _080DAAFE\n\
_080DA9DE:\n\
	lsrs r0, r1, 28\n\
	cmp r0, 0x1\n\
	bne _080DA9F0\n\
	adds r0, r2, 0\n\
	orrs r0, r7\n\
	mov r4, r12\n\
	strb r0, [r4]\n\
	strb r6, [r4, 0x1]\n\
	b _080DAAFE\n\
_080DA9F0:\n\
	movs r0, 0x8\n\
	ands r0, r2\n\
	cmp r0, 0\n\
	bne _080DA9FA\n\
	b _080DAAFE\n\
_080DA9FA:\n\
	adds r3, r5, 0\n\
	adds r3, 0x3F\n\
	ldrb r2, [r3]\n\
	lsls r1, r2, 31\n\
	lsrs r1, 31\n\
	movs r6, 0x1\n\
	eors r1, r6\n\
	ands r1, r7\n\
	movs r0, 0x2\n\
	negs r0, r0\n\
	mov r8, r0\n\
	ands r0, r2\n\
	orrs r0, r1\n\
	strb r0, [r3]\n\
	lsls r0, 31\n\
	lsrs r0, 31\n\
	adds r1, r5, 0\n\
	adds r1, 0x2A\n\
	strb r0, [r1]\n\
	ldrb r0, [r3]\n\
	movs r1, 0x4\n\
	orrs r0, r1\n\
	movs r1, 0x11\n\
	negs r1, r1\n\
	ands r0, r1\n\
	strb r0, [r3]\n\
	mov r2, r12\n\
	ldrb r1, [r2]\n\
	movs r0, 0x4\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080DAAEC\n\
	ldr r0, _080DAA6C @ =gMain\n\
	ldr r3, _080DAA70 @ =0x0000043d\n\
	adds r0, r3\n\
	ldrb r0, [r0]\n\
	ands r4, r0\n\
	cmp r4, 0\n\
	beq _080DAAA4\n\
	ldrb r1, [r2, 0xE]\n\
	mov r0, r9\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _080DAA74\n\
	ldrb r2, [r5, 0x5]\n\
	lsls r1, r2, 28\n\
	lsrs r1, 30\n\
	subs r1, 0x1\n\
	movs r0, 0x3\n\
	ands r1, r0\n\
	lsls r1, 2\n\
	movs r0, 0xD\n\
	negs r0, r0\n\
	ands r0, r2\n\
	orrs r0, r1\n\
	strb r0, [r5, 0x5]\n\
	b _080DAAD8\n\
	.align 2, 0\n\
_080DAA6C: .4byte gMain\n\
_080DAA70: .4byte 0x0000043d\n\
_080DAA74:\n\
	ldrb r2, [r5, 0x5]\n\
	lsls r1, r2, 28\n\
	lsrs r1, 30\n\
	adds r1, 0x1\n\
	movs r0, 0x3\n\
	ands r1, r0\n\
	lsls r1, 2\n\
	movs r0, 0xD\n\
	negs r0, r0\n\
	ands r0, r2\n\
	orrs r0, r1\n\
	strb r0, [r5, 0x5]\n\
	mov r0, r12\n\
	ldrb r2, [r0, 0xE]\n\
	lsls r0, r2, 31\n\
	lsrs r0, 31\n\
	eors r0, r6\n\
	ands r0, r7\n\
	mov r1, r8\n\
	ands r1, r2\n\
	orrs r1, r0\n\
	mov r2, r12\n\
	strb r1, [r2, 0xE]\n\
	b _080DAAEC\n\
_080DAAA4:\n\
	mov r3, r12\n\
	ldrb r1, [r3, 0xE]\n\
	mov r0, r9\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _080DAACE\n\
	adds r1, r5, 0\n\
	adds r1, 0x43\n\
	ldrb r0, [r1]\n\
	subs r0, 0xC\n\
	strb r0, [r1]\n\
	ldrb r2, [r3, 0xE]\n\
	lsls r0, r2, 31\n\
	lsrs r0, 31\n\
	eors r0, r6\n\
	ands r0, r7\n\
	mov r1, r8\n\
	ands r1, r2\n\
	orrs r1, r0\n\
	strb r1, [r3, 0xE]\n\
	b _080DAAEC\n\
_080DAACE:\n\
	adds r1, r5, 0\n\
	adds r1, 0x43\n\
	ldrb r0, [r1]\n\
	adds r0, 0xC\n\
	strb r0, [r1]\n\
_080DAAD8:\n\
	mov r4, r12\n\
	ldrb r2, [r4, 0xE]\n\
	lsls r0, r2, 31\n\
	lsrs r0, 31\n\
	eors r0, r6\n\
	ands r0, r7\n\
	mov r1, r8\n\
	ands r1, r2\n\
	orrs r1, r0\n\
	strb r1, [r4, 0xE]\n\
_080DAAEC:\n\
	mov r0, r12\n\
	ldrb r1, [r0]\n\
	movs r0, 0x9\n\
	negs r0, r0\n\
	ands r0, r1\n\
	mov r1, r12\n\
	strb r0, [r1]\n\
	ldrh r2, [r1, 0x2]\n\
	mov r8, r2\n\
_080DAAFE:\n\
	mov r3, r12\n\
	ldrb r0, [r3]\n\
	movs r1, 0xF\n\
	ands r1, r0\n\
	movs r0, 0x20\n\
	orrs r1, r0\n\
	strb r1, [r3]\n\
	b _080DAC52\n\
_080DAB0E:\n\
	lsls r1, r2, 24\n\
	lsrs r0, r1, 28\n\
	cmp r0, 0x2\n\
	bne _080DAB20\n\
	movs r0, 0x8\n\
	orrs r0, r2\n\
	mov r4, r12\n\
	strb r0, [r4]\n\
	b _080DAC42\n\
_080DAB20:\n\
	lsrs r0, r1, 28\n\
	cmp r0, 0\n\
	bne _080DAB44\n\
	lsls r0, r2, 30\n\
	lsrs r0, 31\n\
	movs r1, 0x1\n\
	eors r0, r1\n\
	ands r0, r7\n\
	lsls r0, 1\n\
	movs r1, 0x3\n\
	negs r1, r1\n\
	ands r1, r2\n\
	orrs r1, r0\n\
	orrs r1, r7\n\
	mov r0, r12\n\
	strb r1, [r0]\n\
	strb r6, [r0, 0x1]\n\
	b _080DAC42\n\
_080DAB44:\n\
	movs r0, 0x8\n\
	ands r0, r2\n\
	cmp r0, 0\n\
	beq _080DAC42\n\
	adds r3, r5, 0\n\
	adds r3, 0x3F\n\
	ldrb r2, [r3]\n\
	lsls r1, r2, 31\n\
	lsrs r1, 31\n\
	movs r4, 0x1\n\
	eors r1, r4\n\
	ands r1, r7\n\
	movs r6, 0x2\n\
	negs r6, r6\n\
	adds r0, r6, 0\n\
	ands r0, r2\n\
	orrs r0, r1\n\
	strb r0, [r3]\n\
	lsls r0, 31\n\
	lsrs r0, 31\n\
	adds r1, r5, 0\n\
	adds r1, 0x2A\n\
	strb r0, [r1]\n\
	ldrb r0, [r3]\n\
	movs r1, 0x4\n\
	orrs r0, r1\n\
	movs r1, 0x11\n\
	negs r1, r1\n\
	ands r0, r1\n\
	strb r0, [r3]\n\
	mov r2, r12\n\
	ldrb r1, [r2]\n\
	movs r0, 0x4\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080DAC32\n\
	ldr r0, _080DABC4 @ =gMain\n\
	ldr r3, _080DABC8 @ =0x0000043d\n\
	adds r0, r3\n\
	ldrb r1, [r0]\n\
	movs r0, 0x2\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080DABE6\n\
	ldrb r1, [r2, 0xE]\n\
	mov r0, r9\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _080DABCC\n\
	ldrb r2, [r5, 0x5]\n\
	lsls r1, r2, 28\n\
	lsrs r1, 30\n\
	subs r1, 0x1\n\
	movs r0, 0x3\n\
	ands r1, r0\n\
	lsls r1, 2\n\
	movs r0, 0xD\n\
	negs r0, r0\n\
	ands r0, r2\n\
	orrs r0, r1\n\
	strb r0, [r5, 0x5]\n\
	mov r0, r12\n\
	ldrb r2, [r0, 0xE]\n\
	b _080DAC00\n\
	.align 2, 0\n\
_080DABC4: .4byte gMain\n\
_080DABC8: .4byte 0x0000043d\n\
_080DABCC:\n\
	ldrb r2, [r5, 0x5]\n\
	lsls r1, r2, 28\n\
	lsrs r1, 30\n\
	adds r1, 0x1\n\
	movs r0, 0x3\n\
	ands r1, r0\n\
	lsls r1, 2\n\
	movs r0, 0xD\n\
	negs r0, r0\n\
	ands r0, r2\n\
	orrs r0, r1\n\
	strb r0, [r5, 0x5]\n\
	b _080DAC1E\n\
_080DABE6:\n\
	mov r0, r12\n\
	ldrb r1, [r0, 0xE]\n\
	mov r0, r9\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _080DAC14\n\
	adds r1, r5, 0\n\
	adds r1, 0x43\n\
	ldrb r0, [r1]\n\
	subs r0, 0xC\n\
	strb r0, [r1]\n\
	mov r1, r12\n\
	ldrb r2, [r1, 0xE]\n\
_080DAC00:\n\
	lsls r0, r2, 31\n\
	lsrs r0, 31\n\
	eors r0, r4\n\
	ands r0, r7\n\
	adds r1, r6, 0\n\
	ands r1, r2\n\
	orrs r1, r0\n\
	mov r2, r12\n\
	strb r1, [r2, 0xE]\n\
	b _080DAC32\n\
_080DAC14:\n\
	adds r1, r5, 0\n\
	adds r1, 0x43\n\
	ldrb r0, [r1]\n\
	adds r0, 0xC\n\
	strb r0, [r1]\n\
_080DAC1E:\n\
	mov r3, r12\n\
	ldrb r2, [r3, 0xE]\n\
	lsls r0, r2, 31\n\
	lsrs r0, 31\n\
	eors r0, r4\n\
	ands r0, r7\n\
	adds r1, r6, 0\n\
	ands r1, r2\n\
	orrs r1, r0\n\
	strb r1, [r3, 0xE]\n\
_080DAC32:\n\
	mov r4, r12\n\
	ldrb r1, [r4]\n\
	movs r0, 0x9\n\
	negs r0, r0\n\
	ands r0, r1\n\
	strb r0, [r4]\n\
	ldrh r0, [r4, 0x2]\n\
	mov r8, r0\n\
_080DAC42:\n\
	mov r1, r12\n\
	ldrb r0, [r1]\n\
	movs r1, 0xF\n\
	ands r1, r0\n\
	movs r0, 0x30\n\
_080DAC4C:\n\
	orrs r1, r0\n\
	mov r2, r12\n\
	strb r1, [r2]\n\
_080DAC52:\n\
	mov r3, r12\n\
	ldrb r1, [r3]\n\
	lsls r1, 30\n\
	lsrs r1, 31\n\
	mov r0, r12\n\
	adds r0, 0xC\n\
	adds r0, r1\n\
	ldrb r1, [r0]\n\
	ldr r3, _080DACE0 @ =gSineTable\n\
	mov r4, r8\n\
	lsls r0, r4, 1\n\
	adds r0, r3\n\
	movs r2, 0\n\
	ldrsh r0, [r0, r2]\n\
	muls r0, r1\n\
	asrs r0, 8\n\
	strh r0, [r5, 0x24]\n\
	ldrb r2, [r5, 0x3]\n\
	lsls r2, 26\n\
	lsrs r2, 27\n\
	movs r4, 0x24\n\
	ldrsh r0, [r5, r4]\n\
	negs r0, r0\n\
	asrs r0, 1\n\
	mov r1, r12\n\
	ldrb r1, [r1, 0xA]\n\
	adds r0, r1\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	lsls r1, r0, 1\n\
	adds r1, r3\n\
	ldrh r6, [r1]\n\
	ldr r1, _080DACE4 @ =gOamMatrices\n\
	lsls r2, 3\n\
	adds r2, r1\n\
	adds r0, 0x40\n\
	lsls r0, 1\n\
	adds r0, r3\n\
	ldrh r0, [r0]\n\
	strh r0, [r2, 0x6]\n\
	strh r0, [r2]\n\
	strh r6, [r2, 0x2]\n\
	lsls r0, r6, 16\n\
	asrs r0, 16\n\
	negs r0, r0\n\
	strh r0, [r2, 0x4]\n\
	mov r2, r12\n\
	ldrh r0, [r2, 0x6]\n\
	ldrh r3, [r2, 0x8]\n\
	adds r0, r3\n\
	strh r0, [r2, 0x8]\n\
	lsls r0, 16\n\
	lsrs r0, 24\n\
	strh r0, [r5, 0x22]\n\
	movs r4, 0x4\n\
	ldrsh r0, [r2, r4]\n\
	movs r1, 0x80\n\
	lsls r1, 8\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080DACE8\n\
	ldrh r0, [r2, 0x4]\n\
	subs r1, 0x1\n\
	ands r1, r0\n\
	ldrh r0, [r2, 0x2]\n\
	subs r0, r1\n\
	movs r1, 0xFF\n\
	ands r0, r1\n\
	strh r0, [r2, 0x2]\n\
	b _080DACFE\n\
	.align 2, 0\n\
_080DACE0: .4byte gSineTable\n\
_080DACE4: .4byte gOamMatrices\n\
_080DACE8:\n\
	mov r1, r12\n\
	ldrh r0, [r1, 0x4]\n\
	ldr r1, _080DAD28 @ =0x00007fff\n\
	ands r1, r0\n\
	mov r2, r12\n\
	ldrh r2, [r2, 0x2]\n\
	adds r1, r2\n\
	movs r0, 0xFF\n\
	ands r1, r0\n\
	mov r3, r12\n\
	strh r1, [r3, 0x2]\n\
_080DACFE:\n\
	movs r4, 0x22\n\
	ldrsh r1, [r5, r4]\n\
	movs r2, 0x26\n\
	ldrsh r0, [r5, r2]\n\
	adds r1, r0\n\
	mov r3, r12\n\
	ldrh r0, [r3, 0xE]\n\
	lsrs r0, 1\n\
	cmp r1, r0\n\
	blt _080DAD1A\n\
	movs r0, 0\n\
	strh r0, [r5, 0x2E]\n\
	ldr r0, _080DAD2C @ =sub_80DA48C\n\
	str r0, [r5, 0x1C]\n\
_080DAD1A:\n\
	pop {r3,r4}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080DAD28: .4byte 0x00007fff\n\
_080DAD2C: .4byte sub_80DA48C\n");
};
#endif

void sub_80DAD30(struct Sprite *sprite)
{
    sprite->oam.priority = sub_8079ED4(gAnimBankTarget);
    sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
    sprite->callback = TranslateAnimSpriteToTargetMonLocation;
}

void sub_80DAD84(struct Sprite * sprite)
{
    s16 matrixNum;
    s16 rand;
    s16 sinVal;

    sprite->data[1] = gBattleAnimArgs[0];
    sprite->data[2] = gBattleAnimArgs[1];
    sprite->data[3] = gBattleAnimArgs[2];

    if (gMain.inBattle)
    {
        if (gBanksBySide[gAnimBankTarget] & 1)
        {
            sprite->data[7] = GetBattlerSpriteCoord(gAnimBankTarget, 1) + gBattleAnimArgs[3];
        }
        else
        {
            // 080dade0
            sprite->data[7] = GetBattlerSpriteCoord(gAnimBankTarget, 1) + 40;
        }

        if (gBattleAnimArgs[4])
        {
            sprite->oam.priority = sub_8079ED4(gAnimBankTarget) + 1;
            // 080dae24
        }
        else
        {
            sprite->oam.priority = sub_8079ED4(gAnimBankTarget);
        }
    }
    else
    {
        sprite->data[7] = GetBattlerSpriteCoord(gAnimBankTarget, 1) + gBattleAnimArgs[3];
    }

    sprite->data[4] = gSineTable[sprite->data[1] & 0xff];
    sprite->data[5] = -gSineTable[(sprite->data[1] & 0xff) + 64];
    sprite->data[6] = 0;
    sprite->pos2.x = sprite->pos2.y = 0;

    matrixNum = sprite->oam.matrixNum;
    sprite->data[1] = (u8) (sprite->data[1] >> 8);

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

#ifdef NONMATCHING
void sub_80DAF0C(struct Sprite *sprite)
{

    /* NONMATCHING - Functionally equivalent
     *
     * differences:
     *
     * asm contains useless:
     * movs r1, 0
     * mov r8, r1
     * where r8 is never used can't be matched
     *
     * 0x8001 and 0x8002 loaded then added with 0 to r0 instead of loaded straight there */

    u16 *data;
    u16 dataCpy[8];
    int higher;

    data = sprite->data;

    if (++sprite->data[0] > 4)
    {
        sprite->pos2.x = (sprite->data[4] * sprite->data[6]) >> 8;
        sprite->pos2.y = (sprite->data[5] * sprite->data[6]) >> 8;

        sprite->data[6] += sprite->data[3] & 0xff;

        if (sprite->data[6] >= (sprite->data[2] & 0xff))
        {
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;

            sprite->pos2.x = 0;
            sprite->pos2.y = 0;

            memcpy(dataCpy, data, 16);
            memset(data, 0, 16);

            data[4] = sprite->pos1.y << 8;
            data[3] = dataCpy[3] >> 8;
            data[1] = 0;
            data[5] = dataCpy[1];

            if (sprite->animNum != 0)
            {
                if (data[3] & 8)
                {
                    data[2] = 0x8001;
                }
                else
                {
                    data[2] = 0x8002;
                }
            }
            else
            {
                if (data[3] & 8)
                {
                    data[2] = 1;
                }
                else
                {
                    data[2] = 2;
                }
            }

            ((u8 *) data)[12] = dataCpy[2] >> 8;
            ((u8 *) data)[13] = (u8) data[6] - 2;

            higher = dataCpy[7] << 1;
            data[7] = (data[7] & 1) | higher;

            sprite->callback = sub_80DA6F0;
        }
    }
}
#else
NAKED
void sub_80DAF0C(struct Sprite *sprite)
{
    asm_unified("push {r4-r7,lr}\n\
    	mov r7, r8\n\
    	push {r7}\n\
    	sub sp, 0x10\n\
    	adds r4, r0, 0\n\
    	adds r5, r4, 0\n\
    	adds r5, 0x2E\n\
    	ldrh r0, [r4, 0x2E]\n\
    	adds r0, 0x1\n\
    	movs r1, 0\n\
    	mov r8, r1\n\
    	movs r7, 0\n\
    	strh r0, [r4, 0x2E]\n\
    	lsls r0, 16\n\
    	asrs r0, 16\n\
    	cmp r0, 0x4\n\
    	ble _080DAFF0\n\
    	movs r2, 0x36\n\
    	ldrsh r1, [r4, r2]\n\
    	movs r2, 0x3A\n\
    	ldrsh r0, [r4, r2]\n\
    	muls r0, r1\n\
    	asrs r6, r0, 8\n\
    	strh r6, [r4, 0x24]\n\
    	movs r0, 0x38\n\
    	ldrsh r1, [r4, r0]\n\
    	movs r2, 0x3A\n\
    	ldrsh r0, [r4, r2]\n\
    	muls r0, r1\n\
    	asrs r3, r0, 8\n\
    	strh r3, [r4, 0x26]\n\
    	ldrh r2, [r4, 0x34]\n\
    	movs r1, 0xFF\n\
    	adds r0, r1, 0\n\
    	ands r0, r2\n\
    	ldrh r2, [r4, 0x3A]\n\
    	adds r0, r2\n\
    	strh r0, [r4, 0x3A]\n\
    	ldrh r2, [r4, 0x32]\n\
    	lsls r0, 16\n\
    	asrs r0, 16\n\
    	ands r1, r2\n\
    	cmp r0, r1\n\
    	blt _080DAFF0\n\
    	ldrh r0, [r4, 0x20]\n\
    	adds r0, r6\n\
    	strh r0, [r4, 0x20]\n\
    	ldrh r0, [r4, 0x22]\n\
    	adds r0, r3\n\
    	strh r0, [r4, 0x22]\n\
    	strh r7, [r4, 0x24]\n\
    	strh r7, [r4, 0x26]\n\
    	mov r0, sp\n\
    	adds r1, r5, 0\n\
    	movs r2, 0x10\n\
    	bl memcpy\n\
    	adds r0, r5, 0\n\
    	movs r1, 0\n\
    	movs r2, 0x10\n\
    	bl memset\n\
    	ldrh r0, [r4, 0x22]\n\
    	lsls r0, 8\n\
    	strh r0, [r5, 0x8]\n\
    	mov r0, sp\n\
    	ldrh r0, [r0, 0x6]\n\
    	lsrs r1, r0, 8\n\
    	strh r1, [r5, 0x6]\n\
    	strh r7, [r5, 0x2]\n\
    	mov r0, sp\n\
    	ldrh r0, [r0, 0x2]\n\
    	strh r0, [r5, 0xA]\n\
    	adds r0, r4, 0\n\
    	adds r0, 0x2A\n\
    	ldrb r0, [r0]\n\
    	cmp r0, 0\n\
    	beq _080DAFC0\n\
    	movs r0, 0x8\n\
    	ands r1, r0\n\
    	cmp r1, 0\n\
    	beq _080DAFB8\n\
    	ldr r0, _080DAFB4 @ =0x00008001\n\
    	b _080DAFCE\n\
    	.align 2, 0\n\
    _080DAFB4: .4byte 0x00008001\n\
    _080DAFB8:\n\
    	ldr r0, _080DAFBC @ =0x00008002\n\
    	b _080DAFCE\n\
    	.align 2, 0\n\
    _080DAFBC: .4byte 0x00008002\n\
    _080DAFC0:\n\
    	movs r0, 0x8\n\
    	ands r1, r0\n\
    	cmp r1, 0\n\
    	beq _080DAFCC\n\
    	movs r0, 0x1\n\
    	b _080DAFCE\n\
    _080DAFCC:\n\
    	movs r0, 0x2\n\
    _080DAFCE:\n\
    	strh r0, [r5, 0x4]\n\
    	mov r0, sp\n\
    	ldrh r0, [r0, 0x4]\n\
    	lsrs r0, 8\n\
    	strb r0, [r5, 0xC]\n\
    	subs r0, 0x2\n\
    	strb r0, [r5, 0xD]\n\
    	mov r0, sp\n\
    	ldrh r1, [r0, 0xE]\n\
    	lsls r1, 1\n\
    	ldrh r2, [r5, 0xE]\n\
    	movs r0, 0x1\n\
    	ands r0, r2\n\
    	orrs r0, r1\n\
    	strh r0, [r5, 0xE]\n\
    	ldr r0, _080DAFFC @ =sub_80DA6F0\n\
    	str r0, [r4, 0x1C]\n\
    _080DAFF0:\n\
    	add sp, 0x10\n\
    	pop {r3}\n\
    	mov r8, r3\n\
    	pop {r4-r7}\n\
    	pop {r0}\n\
    	bx r0\n\
    	.align 2, 0\n\
    _080DAFFC: .4byte sub_80DA6F0\n");

}
#endif

void sub_80DB000(struct Sprite *sprite)
{
    u16 arg;
    u8 mult;

    if (gBattleAnimArgs[2] == 0)
    {
        InitAnimSpritePos(sprite, 0);
    }
    else
    {
        sub_8078764(sprite, 0);
    }

    if ((!gBattleAnimArgs[2] && !GetBattlerSide(gAnimBankAttacker))
        || (gBattleAnimArgs[2] == 1 && !GetBattlerSide(gAnimBankTarget)))
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

void sub_80DB0A0(struct Sprite *sprite)
{
    sprite->pos2.x += sprite->data[1] >> 8;

    if (++sprite->data[0] == 6)
    {
        sprite->data[0] = 0;
        sprite->pos2.x = 0;
        StartSpriteAnim(sprite, 0);
    }

    if (--sprite->data[7] == -1)
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
                               GetBattlerSpriteCoord(gAnimBankTarget, 2),
                               GetBattlerSpriteCoord(gAnimBankTarget, 3),
                               3);
    }

    gTasks[task].data[0] += 8;

    if (gTasks[task].data[0] > 0xff)
    {
        DestroyAnimVisualTask(task);
    }
}

void sub_80DB194(struct Sprite *sprite)
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

void sub_80DB1F4(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
        case 0:
            sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankTarget, 1);
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

void sub_80DB288(struct Sprite *sprite)
{
    InitAnimSpritePos(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->callback = sub_80DB2D0;
    gSprites[GetAnimBattlerSpriteId(0)].invisible = 1;
}

void sub_80DB2D0(struct Sprite *sprite)
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

void sub_80DB330(struct Sprite *sprite)
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

#ifdef NONMATCHING
void sub_80DB374(struct Sprite *sprite)
{
    // NONMATCHING - Functionally equivalent - slight register swap at end

    u32 matrixNum;
    int t1, t3;
    s16 t2;

    switch (sprite->data[0])
    {

        case 0:
            if (!gBattleAnimArgs[0])
            {
                sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 0);
                sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 1);
            }
            else
            {
                sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankTarget, 0);
                sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankTarget, 1);
            }

            sprite->data[1] = 512;

            sub_8078FDC(sprite, 0, 256, sprite->data[1], 0);
            ++sprite->data[0];
            break;
        case 1:
            if (sprite->data[2] <= 11)
            {
                sprite->data[1] -= 40;
            }
            else
            {
                sprite->data[1] += 40;
            }

            ++sprite->data[2];

            sub_8078FDC(sprite, 0, 256, sprite->data[1], 0);

            matrixNum = sprite->oam.matrixNum;

            t1 = 15616;
            t2 = gOamMatrices[matrixNum].d;
            t3 = t1 / t2 + 1;

            if (t3 > 128)
            {
                t3 = 128;
            }

            /* NONMATCHING
             * compiles to:
             *  asr	r0, r0, #0x1
                strh	r0, [r5, #0x26]
             * needed:
             *  asrs r1, r0, 1
             *  strh r1, [r5, 0x26] */
            sprite->pos2.y = (64 - t3) / 2;

            if (sprite->data[2] == 24)
            {
                sub_8079098(sprite);
                DestroyAnimSprite(sprite);
            }
    }
}
#else
NAKED
void sub_80DB374(struct Sprite *sprite)
{
    asm_unified("push {r4,r5,lr}\n\
	sub sp, 0x4\n\
	adds r5, r0, 0\n\
	movs r1, 0x2E\n\
	ldrsh r0, [r5, r1]\n\
	cmp r0, 0\n\
	beq _080DB388\n\
	cmp r0, 0x1\n\
	beq _080DB3E0\n\
	b _080DB44C\n\
_080DB388:\n\
	ldr r0, _080DB398 @ =gBattleAnimArgs\n\
	movs r2, 0\n\
	ldrsh r0, [r0, r2]\n\
	cmp r0, 0\n\
	bne _080DB3A0\n\
	ldr r4, _080DB39C @ =gAnimBankAttacker\n\
	b _080DB3A2\n\
	.align 2, 0\n\
_080DB398: .4byte gBattleAnimArgs\n\
_080DB39C: .4byte gAnimBankAttacker\n\
_080DB3A0:\n\
	ldr r4, _080DB3DC @ =gAnimBankTarget\n\
_080DB3A2:\n\
	ldrb r0, [r4]\n\
	movs r1, 0\n\
	bl GetBattlerSpriteCoord\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	strh r0, [r5, 0x20]\n\
	ldrb r0, [r4]\n\
	movs r1, 0x1\n\
	bl GetBattlerSpriteCoord\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	strh r0, [r5, 0x22]\n\
	movs r0, 0\n\
	movs r3, 0x80\n\
	lsls r3, 2\n\
	strh r3, [r5, 0x30]\n\
	movs r2, 0x80\n\
	lsls r2, 1\n\
	str r0, [sp]\n\
	adds r0, r5, 0\n\
	movs r1, 0\n\
	bl sub_8078FDC\n\
	ldrh r0, [r5, 0x2E]\n\
	adds r0, 0x1\n\
	strh r0, [r5, 0x2E]\n\
	b _080DB44C\n\
	.align 2, 0\n\
_080DB3DC: .4byte gAnimBankTarget\n\
_080DB3E0:\n\
	movs r1, 0x32\n\
	ldrsh r0, [r5, r1]\n\
	cmp r0, 0xB\n\
	bgt _080DB3EE\n\
	ldrh r0, [r5, 0x30]\n\
	subs r0, 0x28\n\
	b _080DB3F2\n\
_080DB3EE:\n\
	ldrh r0, [r5, 0x30]\n\
	adds r0, 0x28\n\
_080DB3F2:\n\
	strh r0, [r5, 0x30]\n\
	ldrh r0, [r5, 0x32]\n\
	adds r0, 0x1\n\
	movs r1, 0\n\
	strh r0, [r5, 0x32]\n\
	movs r2, 0x80\n\
	lsls r2, 1\n\
	movs r0, 0x30\n\
	ldrsh r3, [r5, r0]\n\
	str r1, [sp]\n\
	adds r0, r5, 0\n\
	bl sub_8078FDC\n\
	ldrb r1, [r5, 0x3]\n\
	lsls r1, 26\n\
	lsrs r1, 27\n\
	movs r0, 0xF4\n\
	lsls r0, 6\n\
	ldr r2, _080DB454 @ =gOamMatrices\n\
	lsls r1, 3\n\
	adds r1, r2\n\
	movs r2, 0x6\n\
	ldrsh r1, [r1, r2]\n\
	bl __divsi3\n\
	adds r1, r0, 0x1\n\
	cmp r1, 0x80\n\
	ble _080DB42C\n\
	movs r1, 0x80\n\
_080DB42C:\n\
	movs r0, 0x40\n\
	subs r0, r1\n\
	lsrs r1, r0, 31\n\
	adds r0, r1\n\
	asrs r1, r0, 1\n\
	strh r1, [r5, 0x26]\n\
	movs r1, 0x32\n\
	ldrsh r0, [r5, r1]\n\
	cmp r0, 0x18\n\
	bne _080DB44C\n\
	adds r0, r5, 0\n\
	bl sub_8079098\n\
	adds r0, r5, 0\n\
	bl DestroyAnimSprite\n\
_080DB44C:\n\
	add sp, 0x4\n\
	pop {r4,r5}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080DB454: .4byte gOamMatrices\n");
}
#endif

void sub_80DB458(struct Sprite *sprite)
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
        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 0);
        sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 1) + 32;
    }
    else
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankTarget, 0);
        sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankTarget, 1) + 32;
    }

    sprite->callback = sub_80DB508;
}

void sub_80DB508(struct Sprite *sprite)
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

void sub_80DB564(struct Sprite *sprite)
{
    sprite->data[6] = 0;
    sprite->data[7] = 0x40;
    sprite->callback = sub_80DB578;
}

void sub_80DB578(struct Sprite *sprite)
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

void sub_80DB5E4(struct Sprite *sprite)
{
    s16 posx, posy;
    u16 rotation;

    posx = sprite->pos1.x;
    posy = sprite->pos1.y;

    sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3);

    sprite->data[4] = sprite->pos1.x << 4;
    sprite->data[5] = sprite->pos1.y << 4;

    sprite->data[6] = ((posx - sprite->pos1.x) << 4) / 12;
    sprite->data[7] = ((posy - sprite->pos1.y) << 4) / 12;

    rotation = ArcTan2Neg(posx - sprite->pos1.x, posy - sprite->pos1.y);
    rotation += 0xc000;

    sub_8078FDC(sprite, 1, 0x100, 0x100, rotation);

    sprite->callback = sub_80DB6A0;
}

void sub_80DB6A0(struct Sprite *sprite)
{
    sprite->data[4] += sprite->data[6];
    sprite->data[5] += sprite->data[7];

    sprite->pos1.x = sprite->data[4] >> 4;
    sprite->pos1.y = sprite->data[5] >> 4;

    if ((u16) (sprite->pos1.x + 0x2d) > 0x14a || sprite->pos1.y > 0x9d || sprite->pos1.y < -0x2d)
    {
        move_anim_8074EE0(sprite);
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