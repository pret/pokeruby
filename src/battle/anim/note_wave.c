#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "palette.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

extern u16 gUnknown_083D712C[4][6];

static void sub_80CEBC4(s16 a, s16 b, s16* c, s16* d, s8 e);
static void sub_80CEC1C(struct Sprite* sprite);

// note_wave
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
        a = GetBankPosition(gAnimBankTarget, 2);
        b = GetBankPosition(gAnimBankTarget, 3);
    }

    sprite->data[4] = sprite->pos1.x << 4;
    sprite->data[5] = sprite->pos1.y << 4;
    sub_80CEBC4(a - sprite->pos1.x, b - sprite->pos1.y, &sprite->data[6], &sprite->data[7], 0x28);
    sprite->callback = sub_80CEC1C;
}

void sub_80CEBC4(s16 a, s16 b, s16* c, s16* d, s8 e)
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

void sub_80CEC1C(struct Sprite* sprite)
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
