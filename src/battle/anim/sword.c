#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80CF690(struct Sprite* sprite);
static void sub_80CF6B4(struct Sprite* sprite);

// sword (sword appears and floats upward.)
// Used in Swords Dance.

const union AffineAnimCmd gSpriteAffineAnim_83D7468[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x14, 0x0, 0, 12),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 32),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D7488[] =
{
    gSpriteAffineAnim_83D7468,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D748C =
{
    .tileTag = 10005,
    .paletteTag = 10005,
    .oam = &gOamData_837E0FC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D7488,
    .callback = sub_80CF690,
};

void sub_80CF690(struct Sprite* sprite)
{
    InitAnimSpritePos(sprite, 0);
    sprite->callback = sub_80785E4;
    StoreSpriteCallbackInData(sprite, sub_80CF6B4);
}

static void sub_80CF6B4(struct Sprite* sprite)
{
    sprite->data[0] = 6;
    sprite->data[2] = sprite->pos1.x;
    sprite->data[4] = sprite->pos1.y - 32;
    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}
