#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "palette.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80CEB0C(struct Sprite* sprite);
void sub_80CECE8(struct Sprite* sprite);
void sub_80CEDF0(struct Sprite* sprite);
void sub_80CEE60(struct Sprite* sprite);
static void sub_80CEBC4(s16 a, s16 b, s16* c, s16* d, s8 e);
static void sub_80CEC1C(struct Sprite* sprite);
static void sub_80CED78(struct Sprite* sprite);
static void sub_80CEEE8(struct Sprite* sprite);

const union AnimCmd gSpriteAnim_83D7098[] =
{
    ANIMCMD_FRAME(0, 10),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D70A0[] =
{
    ANIMCMD_FRAME(4, 10),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D70A8[] =
{
    ANIMCMD_FRAME(8, 41),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D70B0[] =
{
    ANIMCMD_FRAME(12, 10),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D70B8[] =
{
    ANIMCMD_FRAME(16, 10),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D70C0[] =
{
    ANIMCMD_FRAME(20, 10),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D70C8[] =
{
    ANIMCMD_FRAME(0, 10, .vFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D70D0[] =
{
    ANIMCMD_FRAME(4, 10, .vFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D70D8[] =
{
    gSpriteAnim_83D7098,
    gSpriteAnim_83D70A0,
    gSpriteAnim_83D70A8,
    gSpriteAnim_83D70B0,
    gSpriteAnim_83D70B8,
    gSpriteAnim_83D70C0,
    gSpriteAnim_83D70C8,
    gSpriteAnim_83D70D0,
};

const union AffineAnimCmd gSpriteAffineAnim_83D70F8[] =
{
    AFFINEANIMCMD_FRAME(0xC, 0xC, 0, 16),
    AFFINEANIMCMD_FRAME(0xFFF4, 0xFFF4, 0, 16),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D7110[] =
{
    gSpriteAffineAnim_83D70F8,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7114 =
{
    .tileTag = 10072,
    .paletteTag = 10072,
    .oam = &gOamData_837DFEC,
    .anims = gSpriteAnimTable_83D70D8,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D7110,
    .callback = sub_80CEB0C,
};

const u16 gUnknown_083D712C[][6] =
{
    {10072, RGB(31, 31, 31), RGB(31, 26, 28), RGB(31, 22, 26), RGB(31, 17, 24), RGB(31, 13, 22)},
    {10097, RGB(31, 31, 31), RGB(25, 31, 26), RGB(20, 31, 21), RGB(15, 31, 16), RGB(10, 31, 12)},
    {10185, RGB(31, 31, 31), RGB(31, 31, 24), RGB(31, 31, 17), RGB(31, 31, 10), RGB(31, 31, 3)},
    {10175, RGB(31, 31, 31), RGB(26, 28, 31), RGB(21, 26, 31), RGB(16, 24, 31), RGB(12, 22, 31)},
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D715C =
{
    .tileTag = 10072,
    .paletteTag = 10072,
    .oam = &gOamData_837DFEC,
    .anims = gSpriteAnimTable_83D70D8,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D7110,
    .callback = sub_80CECE8,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7174 =
{
    .tileTag = 10193,
    .paletteTag = 10193,
    .oam = &gOamData_837DF34,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CEDF0,
};

const union AffineAnimCmd gSpriteAffineAnim_83D718C[] =
{
    AFFINEANIMCMD_FRAME(0xA0, 0xA0, 0, 0),
    AFFINEANIMCMD_FRAME(0x4, 0x4, 0, 1),
    AFFINEANIMCMD_JUMP(1),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D71A4[] =
{
    gSpriteAffineAnim_83D718C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D71A8 =
{
    .tileTag = 10072,
    .paletteTag = 10072,
    .oam = &gOamData_837DFEC,
    .anims = gSpriteAnimTable_83D70D8,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D71A4,
    .callback = sub_80CEE60,
};

// musical (music notes, drum)
// Used by Grasswhistle, Belly Drum, and Sing.

// rainbow effect for musical notes
void sub_80CEA20(u8 taskId)
{
    u16 i;
    u16 j;
    u16 index;

    index = IndexOfSpritePaletteTag(gUnknown_083D712C[0][0]);
    if (index != 0xFF)
    {
        index = (index << 4) + 0x100;
        for (i = 1; i < 6; i++)
        {
            gPlttBufferFaded[index + i] = gUnknown_083D712C[0][i];
        }
    }

    for (j = 1; j < 4; j++)
    {
        index = AllocSpritePalette(gUnknown_083D712C[j][0]);
        if (index != 0xFF)
        {
            index = (index << 4) + 0x100;
            for (i = 1; i < 6; i++)
            {
                gPlttBufferFaded[index + i] = gUnknown_083D712C[j][i];
            }
        }
    }
    DestroyAnimVisualTask(taskId);
}

// clears the rainbow effect for musical notes.
void sub_80CEAD8(u8 taskId)
{
    u16 i;
    for (i = 1; i < 4; i++)
    {
        FreeSpritePaletteByTag(gUnknown_083D712C[i][0]);
    }

    DestroyAnimVisualTask(taskId);
}

void sub_80CEB0C(struct Sprite* sprite)
{
    u8 index;
    u8 a;
    u8 b;
    sub_8078650(sprite);
    StartSpriteAnim(sprite, gBattleAnimArgs[0]);
    if ((index = IndexOfSpritePaletteTag(gUnknown_083D712C[gBattleAnimArgs[1]][0])) != 0xFF)
        sprite->oam.paletteNum = index;

    sprite->data[1] = gBattleAnimArgs[1];
    sprite->data[2] = 0;
    sprite->data[3] = gBattleAnimArgs[2];
    if (IsContest())
    {
        a = 0x30;
        b = 0x28;
    }
    else
    {
        a = GetBattlerSpriteCoord(gAnimBankTarget, 2);
        b = GetBattlerSpriteCoord(gAnimBankTarget, 3);
    }

    sprite->data[4] = sprite->pos1.x << 4;
    sprite->data[5] = sprite->pos1.y << 4;
    sub_80CEBC4(a - sprite->pos1.x, b - sprite->pos1.y, &sprite->data[6], &sprite->data[7], 0x28);
    sprite->callback = sub_80CEC1C;
}

static void sub_80CEBC4(s16 a, s16 b, s16* c, s16* d, s8 e)
{
    int f;
    int g;
    if (a < 0)
        e = -e;

    f = a << 8;
    g = f / e;
    if (g == 0)
        g = 1;

    *c = f / g;
    *d = (b << 8) / g;
}

static void sub_80CEC1C(struct Sprite* sprite)
{
    int b;
    s16 a;
    int c;
    u8 index;
    sprite->data[0]++;
    b = sprite->data[0] * 5 - ((sprite->data[0] * 5 / 256) << 8);
    sprite->data[4] += sprite->data[6];
    sprite->data[5] += sprite->data[7];
    sprite->pos1.x = sprite->data[4] >> 4;
    sprite->pos1.y = sprite->data[5] >> 4;
    sprite->pos2.y = Sin(b, 15);
    a = (u16)sprite->pos1.y;
    c = (u16)sprite->pos1.x;

    if ((u32)((c + 16) << 16) > (0x110) << 16 || a < -16 || a > 0x80)
    {
        move_anim_8074EE0(sprite);
    }
    else
    {
        if (sprite->data[3] && ++sprite->data[2] > sprite->data[3])
        {
            sprite->data[2] = 0;
            if (++sprite->data[1] > 3)
                sprite->data[1] = 0;

            index = IndexOfSpritePaletteTag(gUnknown_083D712C[sprite->data[1]][0]);
            if (index != 0xFF)
                sprite->oam.paletteNum = index;
        }
    }
}

// note_scatter
// Used by Teeter Dance.

void sub_80CECE8(struct Sprite* sprite)
{
    int a; 
    if (GetBattlerSide(gAnimBankAttacker) == 1)
    {
        a = gBattleAnimArgs[1]; 
        (u16)gBattleAnimArgs[1] = -a;
    }

    sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2) + gBattleAnimArgs[1];
    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3) + gBattleAnimArgs[2];
    StartSpriteAnim(sprite, gBattleAnimArgs[0]);
    sprite->data[2] = 0;
    sprite->data[3] = 0;
    sprite->data[4] = sprite->pos1.x << 4;
    sprite->data[5] = sprite->pos1.y << 4;
    sprite->data[6] = (gBattleAnimArgs[1] << 4) / 5;
    sprite->data[7] = (gBattleAnimArgs[2] << 7) / 5;
    sprite->callback = sub_80CED78;
}

static void sub_80CED78(struct Sprite* sprite)
{
    sprite->data[4] += sprite->data[6];
    sprite->data[5] += sprite->data[7];
    sprite->pos1.x = sprite->data[4] >> 4;
    sprite->pos1.y = sprite->data[5] >> 4;
    if (sprite->data[0] > 5 && sprite->data[3] == 0)
    {
        sprite->data[2] = (sprite->data[2] + 16) & 0xFF;
        sprite->pos2.x = Cos(sprite->data[2], 18);
        sprite->pos2.y = Sin(sprite->data[2], 18);
        if (sprite->data[2] == 0)
            sprite->data[3] = 1;
    }

    if (++sprite->data[0] == 0x30)
        move_anim_8074EE0(sprite);
}

// drum (using hands to slap the Pokemon's belly in a rhythm.)
// Used in Belly Drum.

void sub_80CEDF0(struct Sprite* sprite)
{
    s16 a;
    if (gBattleAnimArgs[0] == 1)
    {
        sprite->oam.matrixNum = 8;
        a = 16;
    }
    else
    {
        a = -16;
    }

    sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2) + a;
    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3) + 8;
    sprite->data[0] = 8;
    sprite->callback = WaitAnimForDuration;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

// note_scatter_2 (slower scatter of notes.)
// Used in Belly Drum.

void sub_80CEE60(struct Sprite* sprite)
{
    s16 a;
    u8 index;
    sub_8078650(sprite);
    sprite->pos1.y += 8;
    StartSpriteAnim(sprite, gBattleAnimArgs[1]);
    index = IndexOfSpritePaletteTag(gUnknown_083D712C[gBattleAnimArgs[2]][0]);
    if (index != 0xFF)
        sprite->oam.paletteNum = index;

    a = (gBattleAnimArgs[0] == 0) ? 0xFFE0 : 0x20;
    sprite->data[0] = 40;
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = a + sprite->data[1];
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = sprite->data[3] - 40;
    InitAnimLinearTranslation(sprite);
    sprite->data[5] = gBattleAnimArgs[3];
    sprite->callback = sub_80CEEE8;
}

static void sub_80CEEE8(struct Sprite* sprite)
{
    if (TranslateAnimLinear(sprite) == 0)
    {
        s16 a;
        a = Sin(sprite->data[5], 8);
        if (sprite->pos2.x < 0)
            a = -a;

        sprite->pos2.x += a;
        sprite->pos2.y += Sin(sprite->data[5], 4);
        sprite->data[5] = (sprite->data[5] + 8) & 0xFF;
    }
    else
    {
        DestroyAnimSprite(sprite);
    }
}
