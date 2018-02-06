#include "global.h"
#include "battle_anim.h"
#include "blend_palette.h"
#include "decompress.h"
#include "ewram.h"
#include "palette.h"
#include "random.h"
#include "rom_8077ABC.h"
#include "scanline_effect.h"
#include "sound.h"
#include "sprite.h"
#include "trig.h"
#include "constants/battle_constants.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern u8 gObjectBankIDs[];
extern u8 gBanksBySide[];
extern u16 gBattle_BG1_X;
extern u16 gBattle_BG1_Y;
extern u16 gBattle_BG2_X;
extern u16 gBattle_BG2_Y;
extern u16 gBattle_WIN0H;
extern u16 gBattle_WIN0V;
extern u16 gBattlePartyID[];
extern u8 gAnimMoveTurn;

extern struct SpriteTemplate gBattleAnimSpriteTemplate_83DB4A8;

static void sub_80D927C(struct Sprite *sprite);
static void sub_80D9328(struct Sprite *sprite);
static void sub_80D9404(struct Sprite *sprite);
static void sub_80D9474(struct Sprite *sprite);
static void sub_80D94CC(struct Sprite *sprite);
static void sub_80D9524(struct Sprite *sprite);

void sub_080B08A0(struct Sprite *sprite)
{
    sub_807867C(sprite, gBattleAnimArgs[0]);
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = 15;
    sprite->callback = sub_80782D8;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

void sub_80D902C(struct Sprite *sprite)
{
    if (gBattleAnimArgs[7] == 1 && GetBankSide(gAnimBankAttacker) != SIDE_PLAYER)
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
    }

    StartSpriteAnim(sprite, gBattleAnimArgs[6]);
    gBattleAnimArgs[6] = 0;
    sub_8079534(sprite);
}

void sub_80D9078(struct Sprite *sprite)
{
    if (IsContest())
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
    }

    sub_80D902C(sprite);
}

void sub_80D90A4(struct Sprite *sprite)
{
    StartSpriteAnim(sprite, gBattleAnimArgs[4]);

    if (gBattleAnimArgs[3] == 0)
        sub_80787B0(sprite, 1);
    else
        sub_8078764(sprite, 1);

    sprite->data[0] = gBattleAnimArgs[2];
    sprite->callback = sub_80782D8;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

void sub_80D90F4(struct Sprite *sprite)
{
    u8 bank;
    s16 xMod, yMod;
    s16 x, y;

    if (gBattleAnimArgs[0] == 0)
        bank = gAnimBankAttacker;
    else
        bank = gAnimBankTarget;

    if (gBattleAnimArgs[2] < 0)
        gBattleAnimArgs[2] = Random() % 5;

    StartSpriteAnim(sprite, gBattleAnimArgs[2]);
    sprite->pos1.x = GetBankPosition(bank, 2);
    sprite->pos1.y = GetBankPosition(bank, 3);

    xMod = sub_807A100(bank, 1) / 2;
    yMod = sub_807A100(bank, 0) / 4;

    x = Random() % xMod;
    y = Random() % yMod;

    if (Random() & 1)
        x *= -1;
    if (Random() & 1)
        y *= -1;

    if ((gBanksBySide[bank] & 1) == 0)
        y += 0xFFF0;

    sprite->pos1.x += x;
    sprite->pos1.y += y;

    sprite->data[0] = gBattleAnimArgs[1];
    sprite->data[7] = CreateSprite(&gBattleAnimSpriteTemplate_83DB4A8, sprite->pos1.x, sprite->pos1.y, sprite->subpriority + 1);
    if (sprite->data[7] != 64)
    {
        StartSpriteAffineAnim(&gSprites[sprite->data[7]], 0);
        gSprites[sprite->data[7]].callback = SpriteCallbackDummy;
    }

    sprite->callback = sub_80D927C;
}

static void sub_80D927C(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        if (sprite->data[7] != 64)
        {
            FreeOamMatrix(gSprites[sprite->data[7]].oam.matrixNum);
            DestroySprite(&gSprites[sprite->data[7]]);
        }

        DestroyAnimSprite(sprite);
    }
    else
    {
        sprite->data[0]--;
    }
}

void sub_80D92D0(struct Sprite *sprite)
{
    sub_8078764(sprite, 1);
    sprite->data[0] = 30;

    if (gBattleAnimArgs[2] == 0)
    {
        sprite->data[2] = sprite->pos1.x - 20;
    }
    else
    {
        sprite->data[2] = sprite->pos1.x + 20;
        sprite->hFlip = 1;
    }

    sprite->data[4] = sprite->pos1.y - 20;
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, sub_80D9328);
}

static void sub_80D9328(struct Sprite *sprite)
{
    if (++sprite->data[5] == 11)
    {
        sprite->data[2] = sprite->pos1.x - sprite->pos2.x;
        sprite->data[4] = sprite->pos1.y - sprite->pos2.y;
        sprite->data[0] = 8;
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.y = 0;
        sprite->pos2.x = 0;

        sprite->callback = sub_8078B34;
        StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    }
}

void sub_80D9378(struct Sprite *sprite)
{
    if ((gAnimBankAttacker ^ 2) == gAnimBankTarget && GetBankIdentity(gAnimBankTarget) < 2)
        gBattleAnimArgs[0] *= -1;

    sub_8078764(sprite, 1);

    if (GetBankSide(gAnimBankAttacker) != SIDE_PLAYER)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];

    sprite->data[0] = gBattleAnimArgs[3];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = sprite->pos1.x + gBattleAnimArgs[2];
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = sprite->pos1.y;

    obj_translate_based_on_private_1_2_3_4(sprite);

    sprite->data[5] = gBattleAnimArgs[5];
    sprite->data[6] = gBattleAnimArgs[4];
    sprite->data[7] = 0;

    sprite->callback = sub_80D9404;
}

static void sub_80D9404(struct Sprite *sprite)
{
    if (!sub_8078B5C(sprite))
    {
        sprite->pos2.y += Sin(sprite->data[7] >> 8, sprite->data[5]);
        sprite->data[7] += sprite->data[6];
    }
    else
    {
        DestroyAnimSprite(sprite);
    }
}

void sub_80D943C(struct Sprite *sprite)
{
    sub_8078764(sprite, 1);
    StartSpriteAnim(sprite, gBattleAnimArgs[2]);
    sprite->data[0] = gBattleAnimArgs[3];

    sprite->callback = sub_80782D8;
    StoreSpriteCallbackInData(sprite, sub_80D9474);
}

static void sub_80D9474(struct Sprite *sprite)
{
    StartSpriteAffineAnim(sprite, 0);
    sprite->affineAnimPaused = 1;
    sprite->data[0] = 20;

    sprite->callback = sub_80782D8;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

void sub_80D94A8(struct Sprite *sprite)
{
    sub_8078764(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[2];

    sprite->callback = sub_80D94CC;
}

static void sub_80D94CC(struct Sprite *sprite)
{
    if (--sprite->data[0] == -1)
    {
        sprite->data[0] = 6;
        sprite->data[2] = GetBankPosition(gAnimBankTarget, 2);
        sprite->data[4] = GetBankPosition(gAnimBankTarget, 3);

        sprite->callback = sub_8078B34;
        StoreSpriteCallbackInData(sprite, sub_80D9524);
    }
}

static void sub_80D9524(struct Sprite *sprite)
{
    sprite->data[0] = 15;

    sprite->callback = sub_80782D8;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

void sub_80D9540(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        sub_8078764(sprite, 1);
        sprite->data[1] = gBattleAnimArgs[2];
        sprite->data[2] = gBattleAnimArgs[3];
        sprite->data[0]++;
    }
    else
    {
        sprite->data[4] += sprite->data[1];
        sprite->pos2.x = sprite->data[4] >> 8;
        sprite->pos2.y = Sin(sprite->data[3], sprite->data[2]);
        sprite->data[3] = (sprite->data[3] + 3) & 0xFF;

        if (sprite->data[3] > 100)
            sprite->invisible = sprite->data[3] % 2;

        if (sprite->data[3] > 120)
            DestroyAnimSprite(sprite);
    }
}
