#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80CFE9C(struct Sprite* sprite);
void sub_80CFF50(struct Sprite* sprite);
static void sub_80CFF68(struct Sprite* sprite);

// money
// Used by Pay Day.

const union AnimCmd gSpriteAnim_83D75C4[] =
{
    ANIMCMD_FRAME(8, 1),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D75CC[] =
{
    gSpriteAnim_83D75C4,
};

const union AffineAnimCmd gSpriteAffineAnim_83D75D0[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 10, 1),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D75E0[] =
{
    gSpriteAffineAnim_83D75D0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D75E4 =
{
    .tileTag = 10100,
    .paletteTag = 10100,
    .oam = &gOamData_837DF8C,
    .anims = gSpriteAnimTable_83D75CC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CFE9C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D75FC =
{
    .tileTag = 10100,
    .paletteTag = 10100,
    .oam = &gOamData_837DF8C,
    .anims = gSpriteAnimTable_83D75CC,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D75E0,
    .callback = sub_80CFF50,
};

void sub_80CFE9C(struct Sprite* sprite)
{
    s16 r6;
    s16 r7;
    u16 var;

    InitAnimSpritePos(sprite, 1);
    r6 = GetBattlerSpriteCoord(gAnimBankTarget, 2);
    r7 = GetBattlerSpriteCoord(gAnimBankTarget, 3) + gBattleAnimArgs[3];
    if (GetBattlerSide(gAnimBankAttacker) != 0)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];

    r6 += gBattleAnimArgs[2];
    var = ArcTan2Neg(r6 - sprite->pos1.x, r7 - sprite->pos1.y);
    var += 0xC000;
    sub_8078FDC(sprite, 0, 0x100, 0x100, var);
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = r6;
    sprite->data[4] = r7;
    sprite->callback = sub_8078C00;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

void sub_80CFF50(struct Sprite* sprite)
{
    sprite->data[2] = -16;
    sprite->pos1.y += 8;
    sprite->callback = sub_80CFF68;
}

static void sub_80CFF68(struct Sprite* sprite)
{
    sprite->data[0] += 0x80;
    sprite->pos2.x = sprite->data[0] >> 8;
    if (GetBattlerSide(gAnimBankAttacker) == 0)
        sprite->pos2.x = -sprite->pos2.x;

    sprite->pos2.y = Sin(sprite->data[1], sprite->data[2]);
    sprite->data[1] += 5;
    if (sprite->data[1] > 0x7E)
    {
        sprite->data[1] = 0;
        sprite->data[2] /= 2;
        if (++sprite->data[3] == 2)
            DestroyAnimSprite(sprite);
    }
}
