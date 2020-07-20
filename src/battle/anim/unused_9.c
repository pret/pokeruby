#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "palette.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimAttacker;
extern u8 gBattleAnimTarget;

void sub_80CFDFC(struct Sprite* sprite);
static void sub_80CFE2C(struct Sprite* sprite);

// unused_9? (Most likely an unused effect.)
// I cannot find any reference to this sprite template used to call this.

const struct SpriteTemplate gSpriteTemplate_83D75AC =
{
    .tileTag = ANIM_TAG_UNUSED_VOID_LINES,
    .paletteTag = ANIM_TAG_UNUSED_VOID_LINES,
    .oam = &gOamData_837E05C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CFDFC,
};

void sub_80CFDFC(struct Sprite* sprite)
{
    InitAnimSpritePos(sprite, 0);
    sprite->data[0] = 0x100 + (IndexOfSpritePaletteTag(gSpriteTemplate_83D75AC.paletteTag) << 4);
    sprite->callback = sub_80CFE2C;
}

static void sub_80CFE2C(struct Sprite* sprite)
{
    u16 r7;
    u16 r5;
    int i;
    if (++sprite->data[1] == 2)
    {
        sprite->data[1] = 0;
        r5 = sprite->data[0];
        r7 = gPlttBufferFaded[r5 + 8];
        for (i = 8; i < 16; i++)
        {
            gPlttBufferFaded[r5 + i] = gPlttBufferFaded[r5 + i + 1];
        }
        gPlttBufferFaded[r5 + 15] = r7;

        if (++sprite->data[2] == 0x18)
            DestroyAnimSprite(sprite);
    }
}
