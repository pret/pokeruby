#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "util.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80D31C8(struct Sprite* sprite);
static void sub_80D32E8(struct Sprite *sprite);
static void sub_80D3370(struct Sprite *sprite);
static void sub_80D3398(struct Sprite *sprite);

// bubble (indidivual bubble that floats around)
// Used in Bubble and Bubblebeam

const union AffineAnimCmd gSpriteAffineAnim_83D9148[] =
{
    AFFINEANIMCMD_FRAME(0xFFFB, 0xFFFB, 0, 10),
    AFFINEANIMCMD_FRAME(0x5, 0x5, 0, 10),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D9160[] =
{
    gSpriteAffineAnim_83D9148,
};

const union AnimCmd gSpriteAnim_83D9164[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_FRAME(4, 5),
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D9174[] =
{
    gSpriteAnim_83D9164,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9178 =
{
    .tileTag = 10146,
    .paletteTag = 10146,
    .oam = &gOamData_837E0AC,
    .anims = gSpriteAnimTable_83D9174,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9160,
    .callback = sub_80D31C8,
};

void sub_80D31C8(struct Sprite* sprite)
{
    u8 newSpriteId;

    if (GetBattlerSide(gAnimBankAttacker) != 0)
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2) - gBattleAnimArgs[0];
        sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3) + gBattleAnimArgs[1];
    }
    else
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2) + gBattleAnimArgs[0];
        sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3) + gBattleAnimArgs[1];
    }

    sprite->animPaused = 1;

    if (GetBattlerSide(gAnimBankAttacker) != 0)
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }

    sprite->data[0] = gBattleAnimArgs[6];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3);

    InitAnimLinearTranslation(sprite);

    newSpriteId = CreateInvisibleSpriteWithCallback(SpriteCallbackDummy);
    sprite->data[5] = newSpriteId;

    sprite->pos1.x -= Sin((u8)gBattleAnimArgs[4], gBattleAnimArgs[2]);
    sprite->pos1.y -= Cos((u8)gBattleAnimArgs[4], gBattleAnimArgs[3]);

    gSprites[newSpriteId].data[0] = gBattleAnimArgs[2];
    gSprites[newSpriteId].data[1] = gBattleAnimArgs[3];
    gSprites[newSpriteId].data[2] = gBattleAnimArgs[5];
    gSprites[newSpriteId].data[3] = (u8)gBattleAnimArgs[4] * 256;
    gSprites[newSpriteId].data[4] = gBattleAnimArgs[6];

    sprite->callback = sub_80D32E8;
    sprite->callback(sprite);
}

static void sub_80D32E8(struct Sprite *sprite)
{
    u8 spriteId = sprite->data[5];

    u8 counter = gSprites[spriteId].data[4];
    u16 index = gSprites[spriteId].data[3];

    sprite->data[0] = 1;
    TranslateAnimLinear(sprite);

    sprite->pos2.x += Sin(index / 256, gSprites[spriteId].data[0]);
    sprite->pos2.y += Cos(index / 256, gSprites[spriteId].data[1]);

    gSprites[spriteId].data[3] = gSprites[spriteId].data[2] + index;

    if (--counter != 0)
    {
        gSprites[spriteId].data[4] = counter;
    }
    else
    {
        sprite->callback = sub_80D3370;
        DestroySprite(&gSprites[spriteId]);
    }
}

static void sub_80D3370(struct Sprite *sprite)
{
    sprite->animPaused = 0;
    sprite->callback = sub_8078600;
    StoreSpriteCallbackInData(sprite, sub_80D3398);
}

static void sub_80D3398(struct Sprite *sprite)
{
    sprite->data[0] = 10;
    sprite->callback = WaitAnimForDuration;
    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
}
