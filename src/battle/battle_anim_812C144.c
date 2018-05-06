#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "palette.h"
#include "rom_8077ABC.h"
#include "trig.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern u8 gAnimVisualTaskCount;
extern s32 gAnimMoveDmg;
extern u16 gBattle_WIN0H;
extern u16 gBattle_WIN0V;

extern u8 sub_8046234(s16 x, s16 y, u8 a3);

static void sub_812C184(struct Sprite *sprite);
static void sub_812C268(struct Sprite *sprite);
static void sub_812C2A4(struct Sprite *sprite);
static void sub_812C380(struct Sprite *sprite);
static void sub_812C40C(struct Sprite *sprite);
static void sub_812C450(struct Sprite *sprite);
static void sub_812C4FC(struct Sprite *sprite);
static void sub_812C588(u8 taskId);
static void sub_812C64C(u8 taskId);
static void sub_812C798(struct Sprite *sprite);
static void sub_812C7C8(struct Sprite *sprite);
extern void sub_812CA04(struct Sprite *sprite);

void sub_812C144(struct Sprite *sprite)
{
    sprite->pos1.x += gBattleAnimArgs[0];
    sprite->pos1.y += gBattleAnimArgs[1];

    if (gBattleAnimArgs[3] == 0)
        sprite->data[0] = gBattleAnimArgs[2];
    else
        sprite->data[0] = -gBattleAnimArgs[2];

    sprite->data[1] = gBattleAnimArgs[4];
    sprite->callback = sub_812C184;
}

static void sub_812C184(struct Sprite *sprite)
{
    if (sprite->data[1] > 0)
    {
        sprite->pos2.x = sprite->data[2] >> 8;
        sprite->data[2] += sprite->data[0];
        sprite->invisible ^= 1;
        sprite->data[1]--;
    }
    else
    {
        DestroyAnimSprite(sprite);
    }
}

void sub_812C1D0(u8 taskId)
{
    sub_8046234(
        GetBattlerSpriteCoord(gAnimBankTarget, 2) + 8,
        GetBattlerSpriteCoord(gAnimBankTarget, 3) + 8,
        0);
    DestroyAnimVisualTask(taskId);

}

void sub_812C220(struct Sprite *sprite)
{
    sprite->data[0] = 90;
    sprite->callback = WaitAnimForDuration;
    sprite->data[1] = 7;
    StoreSpriteCallbackInData(sprite, sub_812C268);
    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = ((16 - sprite->data[1]) << 8) | sprite->data[1];
}

static void sub_812C268(struct Sprite *sprite)
{
    REG_BLDALPHA = ((16 - sprite->data[1]) << 8) | sprite->data[1];
    if (--sprite->data[1] < 0)
    {
        sprite->invisible = 1;
        sprite->callback = sub_812C2A4;
    }
}

static void sub_812C2A4(struct Sprite *sprite)
{
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    DestroyAnimSprite(sprite);
}

void sub_812C2BC(struct Sprite *sprite)
{
    u16 rotation;
    u8 x = GetBattlerSpriteCoord(gAnimBankTarget, 2);
    u8 y = GetBattlerSpriteCoord(gAnimBankTarget, 3);

    sub_8078764(sprite, 1);

    rotation = ArcTan2Neg(sprite->pos1.x - x, sprite->pos1.y - y);
    rotation += 0x6000;
    if (IsContest())
        rotation += 0x4000;

    sub_8078FDC(sprite, 0, 0x100, 0x100, rotation);

    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[2] = x;
    sprite->data[4] = y;
    sprite->callback = StartTranslateAnimSpriteByDeltas;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

void sub_812C358(struct Sprite *sprite)
{
    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = 0x1000;
    sprite->data[0] = 4;
    sprite->callback = sub_812C380;
}

static void sub_812C380(struct Sprite *sprite)
{
    REG_BLDALPHA = ((16 - sprite->data[0]) << 8) | sprite->data[0];

    if (sprite->data[1])
        sprite->data[0]--;
    else
        sprite->data[0]++;

    if (sprite->data[0] == 15 || sprite->data[0] == 4)
        sprite->data[1] ^= 1;

    if (sprite->data[2]++ > 70)
    {
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        StartSpriteAffineAnim(sprite, 1);
        sprite->data[2] = 0;
        sprite->invisible = 1;
        sprite->affineAnimPaused = 1;
        sprite->callback = sub_812C40C;
    }
}

static void sub_812C40C(struct Sprite *sprite)
{
    if (sprite->data[2]++ > 9)
    {
        sprite->invisible = 0;
        sprite->affineAnimPaused = 0;
        if (sprite->affineAnimEnded)
            sprite->callback = sub_812C450;
    }
}

static void sub_812C450(struct Sprite *sprite)
{
    switch (sprite->data[3])
    {
    case 0:
    case 1:
        sprite->pos2.x = 1;
        sprite->pos2.y = 0;
        break;
    case 2:
    case 3:
        sprite->pos2.x = -1;
        sprite->pos2.y = 0;
        break;
    case 4:
    case 5:
        sprite->pos2.x = 0;
        sprite->pos2.y = 1;
        break;
    case 6:
    default:
        sprite->pos2.x = 0;
        sprite->pos2.y = -1;
        break;
    }

    if (++sprite->data[3] > 7)
        sprite->data[3] = 0;

    if (sprite->data[4]++ > 15)
    {
        sprite->data[0] = 16;
        sprite->data[1] = 0;
        REG_BLDCNT = 0x3F40;
        REG_BLDALPHA = sprite->data[0];
        sprite->callback = sub_812C4FC;
    }
}

static void sub_812C4FC(struct Sprite *sprite)
{
    REG_BLDALPHA = ((16 - sprite->data[0]) << 8) | sprite->data[0];

    if (sprite->data[1]++ > 1)
    {
        sprite->data[0]--;
        sprite->data[1] = 0;
    }

    if (sprite->data[0] == 0)
        sprite->invisible = 1;

    if (sprite->data[0] < 0)
    {
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        DestroyAnimSprite(sprite);
    }
}

void sub_812C560(u8 taskId)
{
    gTasks[taskId].func = sub_812C588;
    gAnimVisualTaskCount--;
}

static void sub_812C588(u8 taskId)
{
    int i;
    u16 lastColor;
    u8 paletteIndex = sub_80789BC();

    if (++gTasks[taskId].data[5] == 4)
    {
        lastColor = gPlttBufferFaded[paletteIndex * 16 + 11];
        for (i = 10; i > 0; i--)
            gPlttBufferFaded[paletteIndex * 16 + i + 1] = gPlttBufferFaded[paletteIndex * 16 + i];

        gPlttBufferFaded[paletteIndex * 16 + 1] = lastColor;
        gTasks[taskId].data[5] = 0;
    }

    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
        DestroyTask(taskId);
}

void sub_812C624(u8 taskId)
{
    gTasks[taskId].func = sub_812C64C;
    gAnimVisualTaskCount--;
}

static void sub_812C64C(u8 taskId)
{
    int i;
    u16 lastColor;
    u8 paletteIndex = sub_80789BC();

    if (++gTasks[taskId].data[5] == 4)
    {
        lastColor = gPlttBufferFaded[paletteIndex * 16 + 11];
        for (i = 10; i > 0; i--)
            gPlttBufferFaded[paletteIndex * 16 + i + 1] = gPlttBufferFaded[paletteIndex * 16 + i];
        gPlttBufferFaded[paletteIndex * 16 + 1] = lastColor;

        lastColor = gPlttBufferUnfaded[paletteIndex * 16 + 11];
        for (i = 10; i > 0; i--)
            gPlttBufferUnfaded[paletteIndex * 16 + i + 1] = gPlttBufferUnfaded[paletteIndex * 16 + i];
        gPlttBufferUnfaded[paletteIndex * 16 + 1] = lastColor;

        gTasks[taskId].data[5] = 0;
    }

    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
        DestroyTask(taskId);
}

void sub_812C720(struct Sprite *sprite)
{
    u16 x;
    u16 y;

    InitAnimSpritePos(sprite, 1);
    SetAverageBattlerPositions(gAnimBankTarget, 0, &x, &y);

    if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = x + gBattleAnimArgs[2];
    sprite->data[4] = y + gBattleAnimArgs[3];
    sprite->data[5] = -50;

    InitAnimSpriteTranslationOverDuration(sprite);
    sprite->callback = sub_812C798;
}

static void sub_812C798(struct Sprite *sprite)
{
    if (TranslateAnimSpriteLinearAndSine(sprite))
    {
        sprite->data[0] = 30;
        sprite->data[1] = 0;
        sprite->callback = WaitAnimForDuration;
        StoreSpriteCallbackInData(sprite, sub_812C7C8);
    }
}

static void sub_812C7C8(struct Sprite *sprite)
{
    if (sprite->data[1] & 1)
        sprite->invisible ^= 1;

    if (++sprite->data[1] == 16)
        DestroyAnimSprite(sprite);
}

void sub_812C80C(struct Sprite *sprite)
{
    sub_8078650(sprite);
    sub_807867C(sprite, gBattleAnimArgs[0]);
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->callback = sub_8078600;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

// This is likely fakematching due to some strange type casting behavior.
void sub_812C848(struct Sprite *sprite)
{
    int var0;
    int var1;
    if (sprite->data[0] == 0)
    {
        sub_8078650(sprite);
        sub_807867C(sprite, gBattleAnimArgs[0]);

        if (!IsContest())
        {
            if (GetBattlerSide(gAnimBankAttacker) == B_SIDE_PLAYER)
            {
                sprite->data[1] = gBattleAnimArgs[2];
                sprite->data[2] = gBattleAnimArgs[3];
            }
            else
            {
                var1 = -gBattleAnimArgs[2];
                sprite->data[1] = var1;
                var1 = -gBattleAnimArgs[3];
                sprite->data[2] = var1;
            }
        }
        else
        {
            var1 = -gBattleAnimArgs[2];
            sprite->data[1] = var1;
            sprite->data[2] = gBattleAnimArgs[3];
        }
    }

    sprite->data[0]++;
    var0 = (sprite->data[0] * 20) & 0xFF;
    sprite->data[3] += sprite->data[1];
    sprite->data[4] += sprite->data[2];
    sprite->pos2.x = (sprite->data[3] + (s32)((u32)sprite->data[3] >> 31)) >> 1;
    sprite->pos2.y = Sin(var0 & 0xFF, 5) + ((s32)(sprite->data[4] + ((u32)sprite->data[4] >> 31)) >> 1);

    if ((u16)(sprite->pos1.x + sprite->pos2.x) > 240)
        DestroyAnimSprite(sprite);
}

void sub_812C908(struct Sprite *sprite)
{
    if (sprite->animEnded)
        DestroyAnimSprite(sprite);
}

void sub_812C924(u8 taskId)
{
    if (GetBattlerSide(gAnimBankTarget) == B_SIDE_OPPONENT)
        gBattleAnimArgs[7] = 0;
    else
        gBattleAnimArgs[7] = 1;

    DestroyAnimVisualTask(taskId);
}

void sub_812C960(u8 taskId)
{
    if (gAnimMoveDmg > 0)
        gBattleAnimArgs[7] = 0;
    else
        gBattleAnimArgs[7] = 1;

    DestroyAnimVisualTask(taskId);
}

void sub_812C990(struct Sprite *sprite)
{
    REG_WINOUT = 0x1F3F;
    REG_DISPCNT |= DISPCNT_OBJWIN_ON;
    gBattle_WIN0H = 0;
    gBattle_WIN0V = 0;
    REG_WIN0H = 0;
    REG_WIN0V = 0;

    sub_8078764(sprite, 0);

    sprite->oam.objMode = ST_OAM_OBJ_WINDOW;
    sprite->invisible = 1;
    sprite->callback = sub_812CA04;
}
