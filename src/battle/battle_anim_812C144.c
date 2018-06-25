#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "contest.h"
#include "data2.h"
#include "decompress.h"
#include "ewram.h"
#include "palette.h"
#include "random.h"
#include "rom_8077ABC.h"
#include "scanline_effect.h"
#include "sound.h"
#include "trig.h"
#include "constants/songs.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern u8 gAnimVisualTaskCount;
extern s32 gAnimMoveDmg;
extern u16 gBattle_WIN0H;
extern u16 gBattle_WIN0V;
extern u16 gBattle_WIN1H;
extern u16 gBattle_WIN1V;
extern u16 gBattle_BG1_X;
extern u16 gBattle_BG1_Y;
extern u16 gBattle_BG2_X;
extern u16 gBattle_BG2_Y;

extern const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7220;
extern const struct SpriteTemplate gSpriteTemplate_8402500;
extern const union AffineAnimCmd *const gSpriteAffineAnimTable_81E7C18[];
extern const union AffineAnimCmd *const gSpriteAffineAnimTable_81E7BEC[];
extern const union AffineAnimCmd gUnknown_08402400[];
extern const union AffineAnimCmd gUnknown_084024B0[];
extern const union AffineAnimCmd gUnknown_08402518[];
extern const union AffineAnimCmd gUnknown_08402540[];
extern const union AffineAnimCmd gUnknown_08402590[];
extern const union AffineAnimCmd gUnknown_08402610[];
extern const u32 gUnknown_08D2AA98[];
extern const u32 gUnknown_08D2A9E0[];
extern const u16 gUnknown_08D2AA80[];
extern const s8 gUnknown_084025C0[];
extern const s8 gUnknown_08402604[];
extern const u8 gUnknown_08402608[];
extern const struct SpriteTemplate gBattleAnimSpriteTemplate_84025EC;
extern u8 gBattleMonForms[];
extern u8 gBankSpriteIds[];

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
static void sub_812CA04(struct Sprite *sprite);
static void sub_812CAD0(struct Sprite *sprite);
static void sub_812CBB4(struct Sprite *sprite);
static void sub_812CD64(struct Sprite *sprite);
static void sub_812CEF0(u8 taskId);
static void sub_812D06C(u8 taskId);
static void sub_812D254(struct Sprite *sprite);
static void sub_812D4EC(struct Sprite *sprite);
static void sub_812D5E8(struct Sprite *sprite);
static void sub_812DFEC(struct Sprite *sprite);
static void sub_812E09C(struct Sprite *sprite);
static void sub_812E0F8(struct Sprite *sprite);
static void sub_812E638(u8 taskId);
static void sub_812E7F0(struct Sprite *sprite);
static void sub_812E8B4(u8 taskId);


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

static void sub_812CA04(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->invisible = 0;
        if (sprite->affineAnimEnded)
            sprite->data[0]++;
        break;
    case 1:
    case 3:
        sprite->data[1] += 117;
        sprite->pos2.x = sprite->data[1] >> 8;
        if (++sprite->data[2] == 21)
        {
            sprite->data[2] = 0;
            sprite->data[0]++;
        }
        break;
    case 2:
        sprite->data[1] -= 117;
        sprite->pos2.x = sprite->data[1] >> 8;
        if (++sprite->data[2] == 41)
        {
            sprite->data[2] = 0;
            sprite->data[0]++;
        }
        break;
    case 4:
        ChangeSpriteAffineAnim(sprite, 1);
        sprite->data[0]++;
        break;
    case 5:
        if (sprite->affineAnimEnded)
        {
            sprite->invisible = 1;
            sprite->callback = sub_812CAD0;
        }
        break;
    }
}

static void sub_812CAD0(struct Sprite *sprite)
{
    REG_WINOUT = 0x3F3F;
    REG_DISPCNT ^= DISPCNT_OBJWIN_ON;
    DestroyAnimSprite(sprite);
}

void sub_812CAFC(struct Sprite *sprite)
{
    if (gBattleAnimArgs[3] == 0)
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 0);
        sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 1);
    }

    sprite->pos1.x += gBattleAnimArgs[0];
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->oam.tileNum += 16;

    if (gBattleAnimArgs[2] == 0)
    {
        sprite->oam.matrixNum = 8;
        sprite->pos2.x = -12;
        sprite->data[1] = 2;
    }
    else
    {
        sprite->pos2.x = 12;
        sprite->data[1] = -2;
    }

    sprite->data[0] = gBattleAnimArgs[4];

    if (sprite->data[3] != 255)
        sprite->data[3] = gBattleAnimArgs[2];

    sprite->callback = sub_812CBB4;
}

static void sub_812CBB4(struct Sprite *sprite)
{
    if (sprite->data[2] == 0)
    {
        sprite->pos2.x += sprite->data[1];
        if (sprite->pos2.x == 0)
        {
            sprite->data[2]++;
            if (sprite->data[3] == 0)
            {
                PlaySE1WithPanning(222, BattleAnimAdjustPanning(-64));
            }
        }
    }
    else
    {
        sprite->pos2.x -= sprite->data[1];
        if (abs(sprite->pos2.x) == 12)
        {
            sprite->data[0]--;
            sprite->data[2]--;
        }

    }

    if (sprite->data[0] == 0)
        DestroyAnimSprite(sprite);
}

void sub_812CC28(struct Sprite *sprite)
{
    sprite->oam.objMode = ST_OAM_OBJ_WINDOW;
    sprite->data[3] = 255;
    sub_812CAFC(sprite);
}

void sub_812CC44(u8 taskId)
{
    if (IsContest())
    {
        REG_WININ = 0x1F3F;
        gBattle_WIN1H = 0x98F0;
        gBattle_WIN1V = 0x00A0;
        REG_WIN1H = gBattle_WIN0H;
        REG_WIN1V = gBattle_WIN0V;
    }

    DestroyAnimVisualTask(taskId);
}

void sub_812CCA8(u8 taskId)
{
    if (IsContest())
    {
        REG_WININ = 0x3F3F;
        gBattle_WIN1H = 0;
        gBattle_WIN1V = 0;
    }

    DestroyAnimVisualTask(taskId);
}

void sub_812CCE8(struct Sprite *sprite)
{
    int var0;
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 0) + gBattleAnimArgs[1];
        sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 1);
    }
    else
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankTarget, 0) + gBattleAnimArgs[1];
        sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankTarget, 1);
    }

    sprite->pos2.y = gBattleAnimArgs[2];
    var0 = 0;
    if (sprite->pos2.y > gBattleAnimArgs[3])
        var0 = 1;

    sprite->data[0] = var0;
    sprite->data[1] = 0;
    sprite->data[2] = gBattleAnimArgs[4];
    sprite->data[3] = gBattleAnimArgs[5];
    sprite->data[4] = gBattleAnimArgs[3];
    sprite->callback = sub_812CD64;
}

static void sub_812CD64(struct Sprite *sprite)
{
    sprite->data[1] = (sprite->data[1] + sprite->data[2]) & 0xFF;
    sprite->pos2.x = gSineTable[sprite->data[1]] >> 4;
    sprite->pos2.y += sprite->data[3];

    if (sprite->data[0])
    {
        if (sprite->pos2.y < sprite->data[4])
            DestroyAnimSprite(sprite);
    }
    else
    {
        if (sprite->pos2.y > sprite->data[4])
            DestroyAnimSprite(sprite);
    }
}

void sub_812CDC8(u8 taskId)
{
    s16 var0;
    u8 toBG2;
    s16 var2;
    int var3;
    int var4;
    s16 i;
    struct ScanlineEffectParams scanlineParams;
    struct Task *task = &gTasks[taskId];

    if (gBattleAnimArgs[0] == 0)
    {
        var0 = sub_8077FC0(gAnimBankAttacker);
        toBG2 = GetBattlerPosition_permutated(gAnimBankAttacker);
    }
    else
    {
        var0 = sub_8077FC0(gAnimBankTarget);
        toBG2 = GetBattlerPosition_permutated(gAnimBankTarget);
    }

    task->data[0] = var0 + 36;
    task->data[1] = task->data[0];
    task->data[2] = var0 - 33;
    if (task->data[2] < 0)
        task->data[2] = 0;

    task->data[3] = task->data[0];
    task->data[4] = 8;
    task->data[5] = gBattleAnimArgs[1];
    task->data[6] = 0;
    task->data[7] = 0;

    if (toBG2 == 1)
    {
        var3 = gBattle_BG1_X;
        task->data[8] = var3;
        var4 = var3 + 240;
    }
    else
    {
        var3 = gBattle_BG2_X;
        task->data[8] = var3;
        var4 = var3 + 240;
    }

    task->data[9] = var4;
    task->data[10] = gBattleAnimArgs[2];

    if (gBattleAnimArgs[2] == 0)
    {
        task->data[11] = var4;
        var2 = task->data[8];
    }
    else
    {
        task->data[11] = var3;
        var2 = task->data[9];
    }

    task->data[15] = 0;

    i = task->data[2];
    while (i <= task->data[3])
    {
        gScanlineEffectRegBuffers[0][i] = var2;
        gScanlineEffectRegBuffers[1][i] = var2;
        i++;
    }

    if (toBG2 == 1)
        scanlineParams.dmaDest = &REG_BG1HOFS;
    else
        scanlineParams.dmaDest = &REG_BG2HOFS;

    scanlineParams.dmaControl = 0xA2600001;
    scanlineParams.initState = 1;
    scanlineParams.unused9 = 0;
    ScanlineEffect_SetParams(scanlineParams);

    task->func = sub_812CEF0;
}

static void sub_812CEF0(u8 taskId)
{
    s16 i;
    struct Task *task = &gTasks[taskId];

    task->data[0] -= task->data[5];
    if (task->data[0] < task->data[2])
        task->data[0] = task->data[2];

    if (task->data[4] == 0)
    {
        task->data[1] -= task->data[5];
        if (task->data[1] < task->data[2])
        {
            task->data[1] = task->data[2];
            task->data[15] = 1;
        }
    }
    else
    {
        task->data[4]--;
    }

    if (++task->data[6] > 1)
    {
        task->data[6] = 0;
        task->data[7] = task->data[7] == 0 ? 1 : 0;

        if (task->data[7])
            task->data[12] = task->data[8];
        else
            task->data[12] = task->data[9];        
    }

    i = task->data[0];
    while (i < task->data[1])
    {
        gScanlineEffectRegBuffers[0][i] = task->data[12];
        gScanlineEffectRegBuffers[1][i] = task->data[12];
        i++;
    }

    i = task->data[1];
    while (i <= task->data[3])
    {
        gScanlineEffectRegBuffers[0][i] = task->data[11];
        gScanlineEffectRegBuffers[1][i] = task->data[11];
        i++;
    }

    if (task->data[15])
    {
        if (task->data[10])
            gScanlineEffect.state = 3;

        DestroyAnimVisualTask(taskId);
    }
}

void sub_812D008(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    task->data[0] = 0;
    task->data[1] = 0;
    task->data[2] = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    task->data[3] = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
    task->data[4] = 32;
    task->data[5] = -20;
    task->data[6] = 0;
    task->data[15] = GetAnimBattlerSpriteId(0);
    task->func = sub_812D06C;
}

static void sub_812D06C(u8 taskId)
{
    int var0, var1;
    s16 x, y;
    u16 i, j;
    u8 spriteId;
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        var0 = task->data[2];
        if (task->data[1] & 1)
        {
            var1 = task->data[4];
            x = var0 - var1;
        }
        else
        {
            var1 = task->data[4];
            x = var0 + var1;
        }

        y = task->data[3] + task->data[5];
        spriteId = CreateSprite(&gBattleAnimSpriteTemplate_83D7220, x, y, 6 - task->data[1]);
        PlaySE12WithPanning(186, BattleAnimAdjustPanning(-64));

        if (spriteId != MAX_SPRITES)
        {
            gSprites[spriteId].hFlip = task->data[1] & 1;
            gSprites[spriteId].callback = SpriteCallbackDummy;
        }

        if (task->data[1] & 1)
        {
            task->data[4] -= 6;
            task->data[5] -= 6;
        }

        sub_80798F4(task, task->data[15], gUnknown_08402400);
        task->data[1]++;
        task->data[0] = 1;
        break;
    case 1:
        if (sub_807992C(task) == 0)
        {
            if (task->data[1] == 6)
            {
                task->data[6] = 8;
                task->data[0] = 3;
            }
            else
            {
                if (task->data[1] <= 2)
                    task->data[6] = 10;
                else
                    task->data[6] = 0;

                task->data[0] = 2;
            }
        }
        break;
    case 2:
        if (task->data[6] != 0)
            task->data[6]--;
        else
            task->data[0] = 0;
        break;
    case 3:
        if (task->data[6] != 0)
            task->data[6]--;
        else
            task->data[0] = 4;
        break;
    case 4:
        for (i = 0, j = 0; i < MAX_SPRITES; i++)
        {
            if (gSprites[i].template == &gBattleAnimSpriteTemplate_83D7220)
            {
                gSprites[i].data[0] = taskId;
                gSprites[i].data[1] = 6;
                StartSpriteAnim(&gSprites[i], 2);
                gSprites[i].callback = sub_812D254;

                if (++j == 6)
                    break;
            }
        }

        task->data[6] = j;
        task->data[0] = 5;
        break;
    case 5:
        if (task->data[6] == 0)
            DestroyAnimVisualTask(taskId);
        break;
    }
}

static void sub_812D254(struct Sprite *sprite)
{
    if (sprite->animEnded)
    {
        gTasks[sprite->data[0]].data[sprite->data[1]]--;
        DestroySprite(sprite);
    }
}

void sub_812D294(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
        InitAnimSpritePos(sprite, 0);

    sprite->data[0]++;
    if (sprite->data[0] < 40)
    {
        u16 var = sprite->data[0];
        if ((var & 1) == 0)
            sprite->invisible = 1;
        else
            sprite->invisible = 0;
    }

    if (sprite->data[0] > 30)
        sprite->invisible = 0;

    if (sprite->data[0] == 61)
    {
        StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        sprite->data[0] = 20;
        sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
        sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3);
        sprite->callback = StartTranslateAnimSpriteByDeltas;
    }
}

void sub_812D350(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
    case 0:
        sub_80798F4(&gTasks[taskId], GetAnimBattlerSpriteId(0), &gUnknown_084024B0);
        gTasks[taskId].data[0]++;
        break;
    case 1:
        if (sub_807992C(&gTasks[taskId]) == 0)
            DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_812D3AC(struct Sprite *sprite)
{
    u8 spriteId = GetAnimBattlerSpriteId(0);

    switch (sprite->data[0])
    {
    case 0:
        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
        sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
        sub_8078E70(spriteId, 0);
        sprite->data[1] = 256;
        sprite->data[2] = 256;
        sprite->data[0]++;
        break;
    case 1:
        sprite->data[1] += 96;
        sprite->data[2] -= 26;
        obj_id_set_rotscale(spriteId, sprite->data[1], sprite->data[2], 0);

        if (++sprite->data[3] == 5)
            sprite->data[0]++;
        // fall through
    case 2:
        sprite->data[1] += 96;
        sprite->data[2] += 48;
        obj_id_set_rotscale(spriteId, sprite->data[1], sprite->data[2], 0);

        if (++sprite->data[3] == 9)
        {
            sprite->data[3] = 0;
            gSprites[spriteId].invisible = 1;
            sub_8078F40(spriteId);
            sprite->data[0]++;
        }
        break;
    case 3:
        sprite->pos2.y -= 6;
        if (sprite->pos1.y + sprite->pos2.y < -32)
            DestroyAnimSprite(sprite);
        break;
    }
}

void sub_812D4B4(struct Sprite *sprite)
{
    if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
        sprite->pos1.x = -16;
    else
        sprite->pos1.x = 256;

    sprite->pos1.y = 0;
    sprite->callback = sub_812D4EC;
}

static void sub_812D4EC(struct Sprite *sprite)
{
    u32 newX;

    sprite->data[0] += 72;
    if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
        sprite->pos2.x = sprite->data[0] >> 4;
    else
        sprite->pos2.x = -(sprite->data[0] >> 4);

    sprite->data[1] += 16;
    sprite->pos2.y += sprite->data[1] >> 8;

    if (++sprite->data[2] % 3 == 0)
    {
        CreateSpriteAndAnimate(
            &gSpriteTemplate_8402500,
            sprite->pos1.x + sprite->pos2.x,
            sprite->pos1.y + sprite->pos2.y,
            sprite->subpriority + 1);
    }

    newX = sprite->pos1.x + sprite->pos2.x + 32;
    if (newX > 304)
        DestroyAnimSprite(sprite);
}

void sub_812D588(struct Sprite *sprite)
{
    u8 rand;
    s8 y;

    rand = Random() & 3;
    if (rand == 0)
        sprite->oam.tileNum += 4;
    else
        sprite->oam.tileNum += 5;

    y = Random() & 7;
    if (y > 3)
        y = -y;

    sprite->pos2.y = y;
    sprite->callback = sub_812D5E8;
}

static void sub_812D5E8(struct Sprite *sprite)
{
    if (++sprite->data[0] < 30)
    {
        if (++sprite->data[1] == 2)
        {
            sprite->invisible ^= 1;
            sprite->data[1] = 0;
        }
    }
    else
    {
        if (sprite->data[1] == 2)
            sprite->invisible = 0;

        if (sprite->data[1] == 3)
        {
            sprite->invisible = 1;
            sprite->data[1] = -1;
        }

        sprite->data[1]++;
    }

    if (sprite->data[0] > 60)
        DestroySprite(sprite);
}

void sub_812D674(u8 taskId)
{
    if (gTasks[taskId].data[0] == 0)
    {
        sub_80798F4(&gTasks[taskId], GetAnimBattlerSpriteId(0), &gUnknown_08402518);
        gTasks[taskId].data[0]++;
    }
    else
    {
        if (sub_807992C(&gTasks[taskId]) == 0)
            DestroyAnimVisualTask(taskId);
    }
}

void sub_812D6CC(u8 taskId)
{
    if (gTasks[taskId].data[0] == 0)
    {
        sub_80798F4(&gTasks[taskId], GetAnimBattlerSpriteId(0), &gUnknown_08402540);
        gTasks[taskId].data[0]++;
    }
    else
    {
        if (sub_807992C(&gTasks[taskId]) == 0)
            DestroyAnimVisualTask(taskId);
    }
}

void sub_812D724(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        InitAnimSpritePos(sprite, 0);
        sprite->data[1] = 0x900;
        sprite->data[2] = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
        sprite->data[0]++;
        break;
    case 1:
        sprite->pos2.y -= sprite->data[1] >> 8;
        sprite->data[1] -= 96;
        if (sprite->pos1.y + sprite->pos2.y > sprite->data[2])
            DestroyAnimSprite(sprite);
        break;
    }
}

void sub_812D790(u8 taskId)
{
    if (gTasks[taskId].data[0] == 0)
    {
        sub_80798F4(&gTasks[taskId], GetAnimBattlerSpriteId(0), &gUnknown_08402590);
        gTasks[taskId].data[0]++;
    }
    else
    {
        if (sub_807992C(&gTasks[taskId]) == 0)
            DestroyAnimVisualTask(taskId);
    }
}

void sub_812D7E8(u8 taskId)
{
    int i, j;
    u8 position;
    struct Struct_sub_8078914 subStruct;
    u8 *dest;
    u8 *src;
    u16 *field_4;
    u16 *ptr;
    u16 stretch;

    switch (gTasks[taskId].data[0])
    {
    case 0:
        REG_MOSAIC = 0;
        if (GetBattlerPosition_permutated(gAnimBankAttacker) == 1)
            REG_BG1CNT_BITFIELD.mosaic = 1;
        else
            REG_BG2CNT_BITFIELD.mosaic = 1;

        gTasks[taskId].data[10] = gBattleAnimArgs[0];
        gTasks[taskId].data[0]++;
        break;
    case 1:
        if (gTasks[taskId].data[2]++ > 1)
        {
            gTasks[taskId].data[2] = 0;
            gTasks[taskId].data[1]++;
            stretch = gTasks[taskId].data[1];
            REG_MOSAIC = (stretch << 4) | stretch;
            if (stretch == 15)
                gTasks[taskId].data[0]++;
        }
        break;
    case 2:
        sub_8031FC4(gAnimBankAttacker, gAnimBankTarget, gTasks[taskId].data[10]);
        sub_8078954(&subStruct, gAnimBankAttacker);

        if (IsContest())
            position = 0;
        else
            position = GetBattlerPosition(gAnimBankAttacker);

        dest = gUnknown_081FAF4C[position] + (gBattleMonForms[gAnimBankAttacker] << 11);
        src = subStruct.field_0;
        DmaCopy32(3, dest, src, 0x800);

        if (IsContest())
        {
            if (IsSpeciesNotUnown(EWRAM_19348[0]) != IsSpeciesNotUnown(EWRAM_19348[1]))
            {
                field_4 = (u16 *)subStruct.field_4;
                for (i = 0; i < 8; i++)
                {
                    for (j = 0; j < 4; j++)
                    {
                        u16 temp = field_4[j + i * 0x20];
                        field_4[j + i * 0x20] = field_4[(7 - j) + i * 0x20];
                        field_4[(7 - j) + i * 0x20] = temp;
                    }
                }

                for (i = 0; i < 8; i++)
                {
                    for (j = 0; j < 8; j++)
                    {
                       field_4[j + i * 0x20] ^= 0x400;
                    }
                }
            }

            ptr = EWRAM_19348;
            if (IsSpeciesNotUnown(ptr[1]))
                gSprites[gBankSpriteIds[gAnimBankAttacker]].affineAnims = gSpriteAffineAnimTable_81E7C18;
            else
                gSprites[gBankSpriteIds[gAnimBankAttacker]].affineAnims = gSpriteAffineAnimTable_81E7BEC;

            StartSpriteAffineAnim(&gSprites[gBankSpriteIds[gAnimBankAttacker]], 0);
        }

        gTasks[taskId].data[0]++;
        break;
    case 3:
        if (gTasks[taskId].data[2]++ > 1)
        {
            gTasks[taskId].data[2] = 0;
            gTasks[taskId].data[1]--;
            stretch = gTasks[taskId].data[1];
            REG_MOSAIC = (stretch << 4) | stretch;

            if (stretch == 0)
                gTasks[taskId].data[0]++;
        }
        break;
    case 4:
        REG_MOSAIC = 0;
        if (GetBattlerPosition_permutated(gAnimBankAttacker) == 1)
            REG_BG1CNT_BITFIELD.mosaic = 0;
        else
            REG_BG2CNT_BITFIELD.mosaic = 0;

        if (!IsContest())
        {
            if (GetBattlerSide(gAnimBankAttacker) == B_SIDE_OPPONENT)
            {
                if (gTasks[taskId].data[10] == 0)
                    sub_8032984(gAnimBankAttacker, eTransformStatuses[gAnimBankAttacker].species);
            }
        }

        DestroyAnimVisualTask(taskId);
        break;
    }
}

void c3_80DFBE4(u8 taskId)
{
    gBattleAnimArgs[7] = gSprites[gBankSpriteIds[gAnimBankAttacker]].invisible;
    DestroyAnimVisualTask(taskId);
}

void sub_812DB58(u8 taskId)
{
    sub_8031FC4(gAnimBankAttacker, gAnimBankTarget, 1);
    DestroyAnimVisualTask(taskId);
}

void sub_812DB84(u8 taskId)
{
    struct Struct_sub_8078914 subStruct;

    switch (gTasks[taskId].data[0])
    {
    case 0:
        REG_BLDCNT = BLDCNT_TGT2_BD | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1
                   | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT1_BG1;
        REG_BLDALPHA = 0x1000;
        REG_BG1CNT_BITFIELD.screenSize = 0;
        REG_BG1CNT_BITFIELD.priority = 1;
        if (!IsContest())
            REG_BG1CNT_BITFIELD.charBaseBlock = 1;

        sub_8078914(&subStruct);
        DmaClear32(3, subStruct.field_4, 0x1000);
        LZDecompressVram(gUnknown_08D2AA98, subStruct.field_4);
        LZDecompressVram(gUnknown_08D2A9E0, subStruct.field_0);
        LoadCompressedPalette(gUnknown_08D2AA80, subStruct.field_8 * 16, 32);
        if (IsContest())
        {
            sub_80763FC(subStruct.field_8, (u16 *)subStruct.field_4, 0, 0);
            gBattle_BG1_X = -56;
            gBattle_BG1_Y = 0;
        }
        else
        {
            if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
                gBattle_BG1_X = -135;
            else
                gBattle_BG1_X = -10;

            gBattle_BG1_Y = 0;
        }

        gTasks[taskId].data[10] = gBattle_BG1_X;
        gTasks[taskId].data[11] = gBattle_BG1_Y;

        gTasks[taskId].data[0]++;
        PlaySE12WithPanning(SE_W234, BattleAnimAdjustPanning(-64));
        break;
    case 1:
        if (gTasks[taskId].data[4]++ > 0)
        {
            gTasks[taskId].data[4] = 0;
            if (++gTasks[taskId].data[1] > 12)
                gTasks[taskId].data[1] = 12;
            
            REG_BLDALPHA = ((16 - gTasks[taskId].data[1]) << 8) | gTasks[taskId].data[1];

            if (gTasks[taskId].data[1] == 12)
                gTasks[taskId].data[0]++;
        }
        break;
    case 2:
        if (--gTasks[taskId].data[1] < 0)
            gTasks[taskId].data[1] = 0;

        REG_BLDALPHA = ((16 - gTasks[taskId].data[1]) << 8) | gTasks[taskId].data[1];

        if (gTasks[taskId].data[1] == 0)
        {
            gBattle_BG1_X = gUnknown_084025C0[gTasks[taskId].data[2]] + gTasks[taskId].data[10];
            if (++gTasks[taskId].data[2] == 4)
                gTasks[taskId].data[0] = 4;
            else
                gTasks[taskId].data[0] = 3;
        }
        break;
    case 3:
        if (++gTasks[taskId].data[3] == 4)
        {
            gTasks[taskId].data[3] = 0;
            gTasks[taskId].data[0] = 1;
            PlaySE12WithPanning(SE_W234, BattleAnimAdjustPanning(-64));
        }
        break;
    case 4:
        sub_8078914(&subStruct);
        DmaFill32Large(3, 0, subStruct.field_0, 0x2000, 0x1000);
        DmaClear32(3, subStruct.field_4, 0x800);

        if (!IsContest())
            REG_BG1CNT_BITFIELD.charBaseBlock = 0;

        REG_BG1CNT_BITFIELD.priority = 1;
        gBattle_BG1_X = 0;
        gBattle_BG1_Y = 0;
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_812DEAC(struct Sprite *sprite)
{
    s16 var0;
    u8 spriteId1;
    u8 spriteId2;

    var0 = Random();
    var0 &= 0x3F;
    if (var0 > 31)
        var0 = 32 - var0;
    
    sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 0) + var0;
    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 1) + 32;
    sprite->data[1] = gBattleAnimArgs[0];
    sprite->data[2] = gBattleAnimArgs[1];

    spriteId1 = CreateSprite(&gBattleAnimSpriteTemplate_84025EC, sprite->pos1.x, sprite->pos1.y, sprite->subpriority + 1);
    spriteId2 = CreateSprite(&gBattleAnimSpriteTemplate_84025EC, sprite->pos1.x, sprite->pos1.y, sprite->subpriority + 1);
    StartSpriteAnim(&gSprites[spriteId1], 1);
    StartSpriteAnim(&gSprites[spriteId2], 2);

    gSprites[spriteId1].data[1] = gBattleAnimArgs[0];
    gSprites[spriteId1].data[2] = gBattleAnimArgs[1];
    gSprites[spriteId2].data[1] = gBattleAnimArgs[0];
    gSprites[spriteId2].data[2] = gBattleAnimArgs[1];
    gSprites[spriteId1].data[7] = -1;
    gSprites[spriteId2].data[7] = -1;
    gSprites[spriteId1].invisible = 1;
    gSprites[spriteId2].invisible = 1;
    gSprites[spriteId1].callback = sub_812E0F8;
    gSprites[spriteId2].callback = sub_812E0F8;

    sprite->data[6] = spriteId1;
    sprite->data[7] = spriteId2;
    sprite->callback = sub_812DFEC;
}

static void sub_812DFEC(struct Sprite *sprite)
{
    int var0;
    s8 var1;
    
    var0 = (u16)sprite->data[2] + (u16)sprite->data[3];
    var1 = var0 >> 8;
    sprite->pos2.y -= var1;
    sprite->data[3] = var0 & 0xFF;
    if (sprite->data[4] == 0 && sprite->pos2.y < -8)
    {
        gSprites[sprite->data[6]].invisible = 0;
        sprite->data[4]++;
    }

    if (sprite->data[4] == 1 && sprite->pos2.y < -16)
    {
        gSprites[sprite->data[7]].invisible = 0;
        sprite->data[4]++;
    }

    if (--sprite->data[1] == -1)
    {
        sprite->invisible = 1;
        sprite->callback = sub_812E09C;
    }
}

static void sub_812E09C(struct Sprite *sprite)
{
    if (gSprites[sprite->data[6]].callback == SpriteCallbackDummy
     && gSprites[sprite->data[7]].callback == SpriteCallbackDummy)
    {
        DestroySprite(&gSprites[sprite->data[6]]);
        DestroySprite(&gSprites[sprite->data[7]]);
        DestroyAnimSprite(sprite);
    }
}

static void sub_812E0F8(struct Sprite *sprite)
{
    u16 d2;
    register u16 d3 asm("r1");
    int var0;
    s8 var1;
    
    if (!sprite->invisible)
    {
        d2 = sprite->data[2];
        d3 = sprite->data[3];
        var0 = d2 + d3;
        var1 = var0 >> 8;
        sprite->pos2.y -= var1;
        sprite->data[3] = var0 & 0xFF;
        if (--sprite->data[1] == -1)
        {
            sprite->invisible = 1;
            sprite->callback = SpriteCallbackDummy;
        }
    }
}

void sub_812E14C(u8 taskId)
{
    struct Struct_sub_8078914 subStruct;

    switch (gTasks[taskId].data[0])
    {
    case 0:
        REG_BLDCNT = BLDCNT_TGT2_BD | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1
                   | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT1_BG1;
        REG_BLDALPHA = 0xD03;
        REG_BG1CNT_BITFIELD.screenSize = 0;
        REG_BG1CNT_BITFIELD.priority = 1;

        if (!IsContest())
            REG_BG1CNT_BITFIELD.charBaseBlock = 1;

        sub_8078914(&subStruct);
        DmaClear32(3, subStruct.field_4, 0x1000);
        LZDecompressVram(gUnknown_08D2AA98, subStruct.field_4);
        LZDecompressVram(gUnknown_08D2A9E0, subStruct.field_0);
        LoadCompressedPalette(gUnknown_08D2AA80, subStruct.field_8 * 16, 32);

        if (IsContest())
        {
            sub_80763FC(subStruct.field_8, (u16 *)subStruct.field_4, 0, 0);
            gBattle_BG1_X = -56;
            gBattle_BG1_Y = 0;
        }
        else
        {
            u8 position = GetBattlerPosition(gAnimBankTarget);
            if (IsDoubleBattle() == TRUE)
            {
                if (position == B_POSITION_OPPONENT_LEFT)
                    gBattle_BG1_X = -155;
                if (position == B_POSITION_OPPONENT_RIGHT)
                    gBattle_BG1_X = -115;
                if (position == B_POSITION_PLAYER_LEFT)
                    gBattle_BG1_X = 14;
                if (position == B_POSITION_PLAYER_RIGHT)
                    gBattle_BG1_X = -20;
            }
            else
            {
                if (position == B_POSITION_OPPONENT_LEFT)
                    gBattle_BG1_X = -135;
                if (position == B_POSITION_PLAYER_LEFT)
                    gBattle_BG1_X = -10;
            }

            gBattle_BG1_Y = 0;
        }

        gTasks[taskId].data[10] = gBattle_BG1_X;
        gTasks[taskId].data[11] = gBattle_BG1_Y;
        gTasks[taskId].data[0]++;
        break;
    case 1:
        gTasks[taskId].data[3] = 0;
        if (GetBattlerSide(gAnimBankTarget) == B_SIDE_OPPONENT)
            gBattle_BG1_X = gTasks[taskId].data[10] + gUnknown_08402604[gTasks[taskId].data[2]];
        else
            gBattle_BG1_X = gTasks[taskId].data[10] - gUnknown_08402604[gTasks[taskId].data[2]];

        if (++gTasks[taskId].data[2] == 5)
            gTasks[taskId].data[0] = 5;
        else
            gTasks[taskId].data[0]++;
        break;
    case 2:
        if (--gTasks[taskId].data[1] <= 4)
            gTasks[taskId].data[1] = 5;

        REG_BLDALPHA = (gTasks[taskId].data[1] << 8) | 3;
        if (gTasks[taskId].data[1] == 5)
            gTasks[taskId].data[0]++;
        break;
    case 3:
        if (++gTasks[taskId].data[3] > gUnknown_08402608[gTasks[taskId].data[2]])
            gTasks[taskId].data[0]++;
        break;
    case 4:
        if (++gTasks[taskId].data[1] > 13)
            gTasks[taskId].data[1] = 13;

        REG_BLDALPHA = (gTasks[taskId].data[1] << 8) | 3;
        if (gTasks[taskId].data[1] == 13)
            gTasks[taskId].data[0] = 1;
        break;
    case 5:
        sub_8078914(&subStruct);
        DmaClear32(3, subStruct.field_4, 0x800);

        if (!IsContest())
            REG_BG1CNT_BITFIELD.charBaseBlock = 0;
        
        REG_BG1CNT_BITFIELD.priority = 1;
        gBattle_BG1_X = 0;
        gBattle_BG1_Y = 0;
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_812E498(u8 taskId)
{
    if (gTasks[taskId].data[0] == 0)
    {
        sub_80798F4(&gTasks[taskId], GetAnimBattlerSpriteId(0), &gUnknown_08402610);
        gTasks[taskId].data[0]++;
    }
    else
    {
        if (!sub_807992C(&gTasks[taskId]))
        {
            DestroyAnimVisualTask(taskId);
        }
    }
}

void sub_812E4F0(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        InitAnimSpritePos(sprite, 0);
        sprite->data[0]++;
    }
    else if (sprite->data[0]++ > 20)
    {
        sprite->data[1] += 160;
        sprite->data[2] += 128;

        if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
            sprite->pos2.x = -(sprite->data[1] >> 8);
        else
            sprite->pos2.x = sprite->data[1] >> 8;

        sprite->pos2.y += sprite->data[2] >> 8;
        if (sprite->pos2.y > 64)
            DestroyAnimSprite(sprite);
    }
}

void sub_812E568(u8 taskId)
{
    u8 side;
    struct Task *task = &gTasks[taskId];

    if (gBattleAnimArgs[1] == 0)
    {
        DestroyAnimVisualTask(taskId);
        return;
    }

    if (gBattleAnimArgs[2] < 0)
        gBattleAnimArgs[2] = 0;
    if (gBattleAnimArgs[2] > 2)
        gBattleAnimArgs[2] = 2;

    task->data[0] = 0;
    task->data[1] = 0;
    task->data[2] = 0;
    task->data[3] = 8 - (2 * gBattleAnimArgs[2]);
    task->data[4] = 0x100 + (gBattleAnimArgs[2] * 128);
    task->data[5] = gBattleAnimArgs[2] + 2;
    task->data[6] = gBattleAnimArgs[1] - 1;
    task->data[15] = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);

    if (gBattleAnimArgs[0] == 0)
        side = GetBattlerSide(gAnimBankAttacker);
    else
        side = GetBattlerSide(gAnimBankTarget);

    if (side == B_SIDE_OPPONENT)
    {
        task->data[4] *= -1;
        task->data[5] *= -1;
    }

    sub_8078E70(task->data[15], 0);
    task->func = sub_812E638;
}

static void sub_812E638(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        gSprites[task->data[15]].pos2.x += task->data[5];
        task->data[2] -= task->data[4];
        obj_id_set_rotscale(task->data[15], 0x100, 0x100, task->data[2]);
        sub_8078F9C(task->data[15]);
        if (++task->data[1] >= task->data[3])
        {
            task->data[1] = 0;
            task->data[0]++;
        }
        break;
    case 1:
        gSprites[task->data[15]].pos2.x -= task->data[5];
        task->data[2] += task->data[4];
        obj_id_set_rotscale(task->data[15], 0x100, 0x100, task->data[2]);
        sub_8078F9C(task->data[15]);
        if (++task->data[1] >= task->data[3] * 2)
        {
            task->data[1] = 0;
            task->data[0]++;
        }
        break;
    case 2:
        gSprites[task->data[15]].pos2.x += task->data[5];
        task->data[2] -= task->data[4];
        obj_id_set_rotscale(task->data[15], 0x100, 0x100, task->data[2]);
        sub_8078F9C(task->data[15]);
        if (++task->data[1] >= task->data[3])
        {
            if (task->data[6])
            {
                task->data[6]--;
                task->data[1] = 0;
                task->data[0] = 0;
            }
            else
            {
                task->data[0]++;
            }
        }
        break;
    case 3:
        sub_8078F40(task->data[15]);
        DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_812E7A0(struct Sprite *sprite)
{
    if (GetBattlerSide(gAnimBankAttacker) == B_SIDE_PLAYER)
    {
        sprite->pos1.x = 0;
        sprite->pos1.y = gBattleAnimArgs[0];
    }
    else
    {
        sprite->pos1.x = 240;
        sprite->pos1.y = gBattleAnimArgs[0] - 30;
    }

    sprite->data[2] = gBattleAnimArgs[2];
    StartSpriteAnim(sprite, gBattleAnimArgs[1]);
    sprite->callback = sub_812E7F0;
}

static void sub_812E7F0(struct Sprite *sprite)
{
    sprite->data[0] += 3;
    if (GetBattlerSide(gAnimBankAttacker) == B_SIDE_PLAYER)
    {
        sprite->pos1.x += 5;
        sprite->pos1.y -= 1;

        if (sprite->pos1.x > 240)
            DestroyAnimSprite(sprite);

        sprite->pos2.y = Sin(sprite->data[0] & 0xFF, 16);
    }
    else
    {
        sprite->pos1.x -= 5;
        sprite->pos1.y += 1;

        if (sprite->pos1.x < 0)
            DestroyAnimSprite(sprite);

        sprite->pos2.y = Cos(sprite->data[0] & 0xFF, 16);
    }
}

void sub_812E860(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    task->data[0] = 0;
    task->data[1] = 0;
    task->data[2] = 0;
    task->data[3] = 0;
    task->data[12] = 0x20;
    task->data[13] = 0x40;
    task->data[14] = 0x800;
    task->data[15] = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);

    sub_8078E70(task->data[15], 0);
    task->func = sub_812E8B4;
}

static void sub_812E8B4(u8 taskId)
{
    int temp;
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        task->data[2] += 0x200;
        if (task->data[2] >= task->data[14])
        {
            s16 diff = task->data[14] - task->data[2];
            s16 div = diff / (task->data[14] * 2);
            s16 mod = diff % (task->data[14] * 2);

            if ((div & 1) == 0)
            {
                task->data[2] = task->data[14] - mod;
                task->data[0] = 1;
            }
            else
            {
                task->data[2] = mod - task->data[14];
            }
        }
        break;
    case 1:
        task->data[2] -= 0x200;
        if (task->data[2] <= -task->data[14])
        {
            s16 diff = task->data[14] - task->data[2];
            s16 div = diff / (task->data[14] * 2);
            s16 mod = diff % (task->data[14] * 2);

            if ((1 & div) == 0)
            {
                task->data[2] = mod - task->data[14];
                task->data[0] = 0;
            }
            else
            {
                task->data[2] = task->data[14] - mod;
            }
        }
        break;
    case 2:
        sub_8078F40(task->data[15]);
        DestroyAnimVisualTask(taskId);
        return;
    }

    obj_id_set_rotscale(task->data[15], 0x100, 0x100, task->data[2]);
    sub_8078F9C(task->data[15]);
    gSprites[task->data[15]].pos2.x = -(((temp = task->data[2]) >= 0 ? task->data[2] : temp + 63) >> 6);
    
    if (++task->data[1] > 8)
    {
        if (task->data[12])
        {
            task->data[12]--;
            task->data[14] -= task->data[13];
            if (task->data[14] < 16)
                task->data[14] = 16;
        }
        else
        {
            task->data[0] = 2;
        }
    }
}
