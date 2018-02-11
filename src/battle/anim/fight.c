#include "global.h"
#include "battle_anim.h"
#include "random.h"
#include "rom_8077ABC.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "constants/battle_constants.h"

extern s16 gBattleAnimArgs[];
extern u8 gBankAttacker;
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern u8 gBankSpriteIds[];
extern u8 gBanksBySide[];
extern u16 gBattle_BG1_X;
extern u16 gBattle_BG1_Y;
extern u16 gBattle_BG2_X;
extern u16 gBattle_BG2_Y;
extern u16 gBattle_BG3_X;
extern u16 gBattle_BG3_Y;
extern u16 gBattle_WIN0H;
extern u16 gBattle_WIN0V;
extern u16 gBattlePartyID[];
extern u8 gAnimMoveTurn;

extern struct SpriteTemplate gBasicHitSplatSpriteTemplate;

static void sub_80D927C(struct Sprite *sprite);
static void sub_80D9328(struct Sprite *sprite);
static void sub_80D9404(struct Sprite *sprite);
static void sub_80D9474(struct Sprite *sprite);
static void sub_80D94CC(struct Sprite *sprite);
static void sub_80D9524(struct Sprite *sprite);
static void sub_80D9640(struct Sprite *sprite);
static void sub_80D97A0(struct Sprite *sprite);
static void sub_80D986C(struct Sprite *sprite);
static void sub_80D9934(struct Sprite *sprite);
static void sub_80D99F4(struct Sprite *sprite);


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
        InitAnimSpritePos(sprite, 1);
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
    sprite->data[7] = CreateSprite(&gBasicHitSplatSpriteTemplate, sprite->pos1.x, sprite->pos1.y, sprite->subpriority + 1);
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

    InitAnimSpriteTranslationDeltas(sprite);

    sprite->data[5] = gBattleAnimArgs[5];
    sprite->data[6] = gBattleAnimArgs[4];
    sprite->data[7] = 0;

    sprite->callback = sub_80D9404;
}

static void sub_80D9404(struct Sprite *sprite)
{
    if (!TranslateAnimSpriteByDeltas(sprite))
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

void sub_80D95D0(struct Sprite *sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->pos1.x = GetBankPosition(gAnimBankAttacker, 0);
        sprite->pos1.y = GetBankPosition(gAnimBankAttacker, 1);
    }
    else
    {
        sprite->pos1.x = GetBankPosition(gAnimBankTarget, 0);
        sprite->pos1.y = GetBankPosition(gAnimBankTarget, 1);
    }

    sprite->pos1.x += gBattleAnimArgs[1];
    sprite->pos1.y += gBattleAnimArgs[2];

    sprite->data[0] = 0;
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[2] = gBattleAnimArgs[4];
    sprite->data[3] = 0;
    sprite->callback = sub_80D9640;
}

static void sub_80D9640(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        if (--sprite->data[1] == 0)
        {
            if (sprite->data[2] == 0)
                DestroyAnimSprite(sprite);
            else
                sprite->data[0]++;
        }
        break;
    case 1:
        if (++sprite->data[1] > 1)
        {
            sprite->data[1] = 0;
            sprite->data[3]++;
            if (sprite->data[3] & 1)
                sprite->pos2.x = 2;
            else
                sprite->pos2.x = -2;
        }

        if (--sprite->data[2] == 0)
            DestroyAnimSprite(sprite);
        break;
    }
}

void sub_80D96B8(struct Sprite *sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->pos1.x = GetBankPosition(gAnimBankAttacker, 0) + gBattleAnimArgs[2];
        sprite->pos1.y = GetBankPosition(gAnimBankAttacker, 1) + gBattleAnimArgs[3];
    }
    else
    {
        sprite->pos1.x = GetBankPosition(gAnimBankTarget, 0) + gBattleAnimArgs[2];
        sprite->pos1.y = GetBankPosition(gAnimBankTarget, 1) + gBattleAnimArgs[3];
    }

    sprite->oam.tileNum += gBattleAnimArgs[1] * 16;
    sprite->data[0] = 0;

    switch (gBattleAnimArgs[1])
    {
    case 0:
        sprite->data[6] = -3;
        sprite->data[7] = -3;
        break;
    case 1:
        sprite->data[6] = 3;
        sprite->data[7] = -3;
        break;
    case 2:
        sprite->data[6] = -3;
        sprite->data[7] = 3;
        break;
    case 3:
        sprite->data[6] = 3;
        sprite->data[7] = 3;
        break;
    default:
        DestroyAnimSprite(sprite);
        return;
    }

    sprite->callback = sub_80D97A0;
}

static void sub_80D97A0(struct Sprite *sprite)
{
    sprite->pos1.x += sprite->data[6];
    sprite->pos1.y += sprite->data[7];

    if (++sprite->data[0] > 40)
        DestroyAnimSprite(sprite);
}

void sub_80D97CC(struct Sprite *sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->pos1.x = GetBankPosition(gBankAttacker, 2);
        sprite->pos1.y = GetBankPosition(gBankAttacker, 3);
        sprite->oam.priority = sub_8079ED4(gAnimBankAttacker);
        sprite->data[7] = gAnimBankTarget;
    }
    else
    {
        sprite->oam.priority = sub_8079ED4(gAnimBankTarget);
        sprite->data[7] = gAnimBankAttacker;
    }

    sprite->data[0] = 0;
    sprite->data[1] = 12;
    sprite->data[2] = 8;
    sprite->callback = sub_80D986C;
}

static void sub_80D986C(struct Sprite *sprite)
{
    if (++sprite->data[0] == 180)
    {
        REG_BLDCNT = 0;

        sprite->data[0] = 16;
        sprite->data[1] = sprite->pos1.x;
        sprite->data[2] = GetBankPosition(sprite->data[7], 2);
        sprite->data[3] = sprite->pos1.y;
        sprite->data[4] = GetBankPosition(sprite->data[7], 3);

        InitAnimSpriteTranslationDeltas(sprite);
        StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
        sprite->callback = sub_8078BB8;
    }
}

void sub_80D98D8(struct Sprite *sprite)
{
    sprite->pos1.x = gBattleAnimArgs[0];
    sprite->pos1.y = 120;

    sprite->data[0] = gBattleAnimArgs[3];
    sub_8079BF4(&sprite->data[4], &sprite->data[5], (void *)(sprite->pos1.y << 8));

    sprite->data[6] = gBattleAnimArgs[1];
    sprite->oam.tileNum += gBattleAnimArgs[2] * 4;

    sprite->callback = sub_80D9934;
}

static void sub_80D9934(struct Sprite *sprite)
{
    void *var0;

    if (sprite->data[0] != 0)
    {
        var0 = sub_8079BFC(sprite->data[4], sprite->data[5]);
        var0 -= sprite->data[6];
        sub_8079BF4(&sprite->data[4], &sprite->data[5], var0);

        var0 = (void *)(((intptr_t)var0) >> 8);
        sprite->pos1.y = (intptr_t)var0;
        if (sprite->pos1.y < -8)
            DestroyAnimSprite(sprite);
        else
            sprite->data[0]--;
    }
    else
    {
        s16 pos0 = GetBankPosition(gAnimBankAttacker, 2);
        s16 pos1 = GetBankPosition(gAnimBankAttacker, 3);
        s16 pos2 = GetBankPosition(gAnimBankTarget, 2);
        s16 pos3 = GetBankPosition(gAnimBankTarget, 3);

        sprite->data[0] = pos2 - pos0;
        sprite->data[1] = pos3 - pos1;
        sprite->data[2] = sprite->pos1.x << 4;
        sprite->data[3] = sprite->pos1.y << 4;

        sprite->callback = sub_80D99F4;
    }
}

static void sub_80D99F4(struct Sprite *sprite)
{
    u16 edgeX;

    sprite->data[2] += sprite->data[0];
    sprite->data[3] += sprite->data[1];
    sprite->pos1.x = sprite->data[2] >> 4;
    sprite->pos1.y = sprite->data[3] >> 4;

    edgeX = sprite->pos1.x + 8;
    if (edgeX > 256 || sprite->pos1.y < -8 || sprite->pos1.y > 120)
        DestroyAnimSprite(sprite);
}

void sub_80D9A38(struct Sprite *sprite)
{
    u8 bank;

    if (gBattleAnimArgs[0] == 0)
    {
        sprite->pos1.x = GetBankPosition(gBankAttacker, 2);
        sprite->pos1.y = GetBankPosition(gBankAttacker, 3);
        bank = gAnimBankTarget;
        sprite->oam.priority = sub_8079ED4(gAnimBankAttacker);
    }
    else
    {
        bank = gAnimBankAttacker;
        sprite->oam.priority = sub_8079ED4(gAnimBankTarget);
    }

    if (IsContest())
        sprite->oam.matrixNum |= 0x8;
    else if (GetBankSide(bank) == SIDE_PLAYER)
        sprite->oam.matrixNum |= 0x18;

    sprite->data[0] = 16;
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = GetBankPosition(bank, 2);
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = GetBankPosition(bank, 3);

    InitAnimSpriteTranslationDeltas(sprite);
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    sprite->callback = sub_8078BB8;
}

static void sub_80D9B24(struct Sprite *sprite)
{
    if (sprite->data[0] == sprite->data[4])
        DestroyAnimSprite(sprite);

    sprite->data[0]++;
}

void sub_80D9B48(struct Sprite *sprite)
{
    u8 turn;

    sprite->pos1.x = GetBankPosition(gAnimBankTarget, 2);
    sprite->pos1.y = GetBankPosition(gAnimBankTarget, 3);
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[2] = gBattleAnimArgs[0];
    sprite->data[3] = gBattleAnimArgs[1];
    sprite->data[4] = gBattleAnimArgs[2];

    turn = gAnimMoveTurn;
    if (GetBankSide(gAnimBankTarget) == SIDE_PLAYER)
        turn++;

    if (turn & 1)
    {
        sprite->data[2] = -sprite->data[2];
        sprite->data[1]++;
    }

    StartSpriteAnim(sprite, sprite->data[1]);
    sprite->pos2.x = sprite->data[2];
    sprite->pos2.y = sprite->data[3];
    sprite->callback = sub_80D9B24;
}

void sub_80D9BD4(struct Sprite *sprite)
{
    if (gBattleAnimArgs[2] == 0)
        InitAnimSpritePos(sprite, 0);
    else
        sub_8078764(sprite, 0);

    if (IsContest())
    {
        StartSpriteAnim(sprite, 2);
    }
    else if (GetBankSide(gAnimBankAttacker) != SIDE_PLAYER)
    {
        StartSpriteAnim(sprite, 1);
    }

    sprite->callback = sub_8078600;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

void sub_80D9C40(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
    {
        sprite->data[1] = (sprite->data[1] + 40) & 0xFF;
        sprite->pos2.x = Sin(sprite->data[1], 2);

        if (++sprite->data[0] > 40)
        {
            DestroyAnimSprite(sprite);
        }
    }
}

void sub_80D9C80(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        sub_80789D4(0);
        task->data[8] = gBattleAnimArgs[0];
        task->data[0]++;
        break;
    case 1:
        if (--task->data[8] == -1)
            task->data[0]++;
        break;
    case 2:
    default:
        task->data[9] += 1280;
        break;
    }

    task->data[10] += 2816;

    if (GetBankSide(gAnimBankTarget) == SIDE_PLAYER)
        gBattle_BG3_X += task->data[9] >> 8;
    else
        gBattle_BG3_X -= task->data[9] >> 8;

    gBattle_BG3_Y += task->data[10] >> 8;

    task->data[9] &= 0xFF;
    task->data[10] &= 0xFF;

    if (gBattleAnimArgs[7] == -1)
    {
        gBattle_BG3_X = 0;
        gBattle_BG3_Y = 0;
        sub_80789D4(1);
        DestroyAnimVisualTask(taskId);
    }
}
