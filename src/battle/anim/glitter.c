#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80CD140(struct Sprite* sprite);
void sub_80CD190(struct Sprite* sprite);

// glitter (the sparkling effect seen on Pokemon, usually after healing or a beneficial effect.)
// Used by Heal Bell, Cosmic Power, and Aromatherapy.

const union AnimCmd gSpriteAnim_83D6C60[] =
{
    ANIMCMD_FRAME(0, 7),
    ANIMCMD_FRAME(16, 7),
    ANIMCMD_FRAME(32, 7),
    ANIMCMD_FRAME(48, 7),
    ANIMCMD_FRAME(64, 7),
    ANIMCMD_FRAME(80, 7),
    ANIMCMD_FRAME(96, 7),
    ANIMCMD_FRAME(112, 7),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_83D6C84[] =
{
    gSpriteAnim_83D6C60,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D6C88 =
{
    .tileTag = 10049,
    .paletteTag = 10049,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D6C84,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CD140,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D6CA0 =
{
    .tileTag = 10049,
    .paletteTag = 10049,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D6C84,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CD190,
};

void sub_80CD140(struct Sprite* sprite)
{
    if (!gBattleAnimArgs[2])
        sub_8078650(sprite);

    sub_807867C(sprite, gBattleAnimArgs[0]);
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[5];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[2] = gBattleAnimArgs[4];
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    sprite->callback = sub_8078394;
}

void sub_80CD190(struct Sprite* sprite)
{
    u8 bank;
    if (!gBattleAnimArgs[2])
        bank = gAnimBankAttacker;
    else
        bank = gAnimBankTarget;

    if (IsDoubleBattle() && IsAnimBankSpriteVisible(bank ^ 2))
    {
        SetAverageBattlerPositions(bank, gBattleAnimArgs[6], &sprite->pos1.x, &sprite->pos1.y);
        sub_807867C(sprite, gBattleAnimArgs[0]);
        sprite->pos1.y += gBattleAnimArgs[1];
    }
    else
    {
        if (!gBattleAnimArgs[6])
        {
            sprite->pos1.x = GetBattlerSpriteCoord(bank, 0);
            sprite->pos1.y = GetBattlerSpriteCoord(bank, 1) + gBattleAnimArgs[1];
        }
        else
        {
            sprite->pos1.x = GetBattlerSpriteCoord(bank, 2);
            sprite->pos1.y = GetBattlerSpriteCoord(bank, 3) + gBattleAnimArgs[1];
        }

        sub_807867C(sprite, gBattleAnimArgs[0]);
    }

    sprite->data[0] = gBattleAnimArgs[5];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[2] = gBattleAnimArgs[4];
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    sprite->callback = sub_8078394;
}
