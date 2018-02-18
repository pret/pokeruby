#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

extern u16 gUnknown_083D712C[4][6];

static void sub_80CEEE8(struct Sprite* sprite);

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
    InitAnimSpriteTranslationDeltas(sprite);
    sprite->data[5] = gBattleAnimArgs[3];
    sprite->callback = sub_80CEEE8;
}

void sub_80CEEE8(struct Sprite* sprite)
{
    if (TranslateAnimSpriteByDeltas(sprite) == 0)
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
