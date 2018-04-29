#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "constants/songs.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80CDFB0(struct Sprite* sprite);
static void sub_80CE000(struct Sprite* sprite);

// cube (shows a sphere sharpening into a cube.)
// Used in Sharpen.

const union AnimCmd gSpriteAnim_83D6EB0[] =
{
    ANIMCMD_FRAME(0, 18),
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(16, 18),
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(16, 6),
    ANIMCMD_FRAME(32, 18),
    ANIMCMD_FRAME(16, 6),
    ANIMCMD_FRAME(32, 6),
    ANIMCMD_FRAME(48, 18),
    ANIMCMD_FRAME(32, 6),
    ANIMCMD_FRAME(48, 6),
    ANIMCMD_FRAME(64, 18),
    ANIMCMD_FRAME(48, 6),
    ANIMCMD_FRAME(64, 54),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D6EEC[] =
{
    gSpriteAnim_83D6EB0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D6EF0 =
{
    .tileTag = 10185,
    .paletteTag = 10185,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D6EEC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CDFB0,
};

void sub_80CDFB0(struct Sprite* sprite)
{
    sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3) - 12;
    sprite->data[0] = 0;
    sprite->data[1] = 2;
    sprite->data[2] = 0;
    sprite->data[3] = 0;
    sprite->data[4] = 0;
    sprite->data[5] = BattleAnimAdjustPanning(-0x40);
    sprite->callback = sub_80CE000;
}

static void sub_80CE000(struct Sprite* sprite)
{
    if (++sprite->data[0] >= sprite->data[1])
    {
        sprite->invisible = !sprite->invisible;
        if (!sprite->invisible)
        {
            sprite->data[4]++;
            if (!(sprite->data[4] & 1))
                PlaySE12WithPanning(SE_W207B, sprite->data[5]);
        }

        sprite->data[0] = 0;
        if (++sprite->data[2] > 1)
        {
            sprite->data[2] = 0;
            sprite->data[1]++;
        }
    }

    if (sprite->animEnded && sprite->data[1] > 16 && sprite->invisible)
        DestroyAnimSprite(sprite);
}
