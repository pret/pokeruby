#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimAttacker;
extern u8 gBattleAnimTarget;

extern const union AnimCmd *const gSpriteAnimTable_83D62D4[];

void sub_80CB4CC(struct Sprite* sprite);

// copy_orb
// Used in Mimic.

const union AffineAnimCmd gSpriteAffineAnim_83D65B8[] = {
    AFFINEANIMCMD_FRAME(0, 0, 0, 0),
    AFFINEANIMCMD_FRAME(48, 48, 0, 14),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83D65D0[] = {
    AFFINEANIMCMD_FRAME(-16, -16, 0, 1),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D65E0[] = {
    gSpriteAffineAnim_83D65B8,
    gSpriteAffineAnim_83D65D0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D65E8 =
{
    .tileTag = ANIM_TAG_ORBS,
    .paletteTag = ANIM_TAG_ORBS,
    .oam = &gOamData_837DFEC,
    .anims = gSpriteAnimTable_83D62D4,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D65E0,
    .callback = sub_80CB4CC,
};

void sub_80CB4CC(struct Sprite* sprite)
{
    switch (sprite->data[0])
    {
    case 0:
    {
        if (GetBattlerSide(gBattleAnimTarget) == 0)
        {
            s16 a = gBattleAnimArgs[0];
            gBattleAnimArgs[0] = -a;
        }

        sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimTarget, 0) + gBattleAnimArgs[0];
        sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimTarget, 1) + gBattleAnimArgs[1];
        sprite->invisible = 1;
        sprite->data[0]++;
        break;
    }
    case 1:
    {
        sprite->invisible = 0;
        if (sprite->affineAnimEnded)
        {
            ChangeSpriteAffineAnim(sprite, 1);
            sprite->data[0] = 25;
            sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
            sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
            sprite->callback = sub_8078CC0;
            StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
            break;
        }
    }
    }
}
