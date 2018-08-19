#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "blend_palette.h"
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
#include "constants/species.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern u8 gAnimVisualTaskCount;
extern u8 gAnimFriendship;
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
extern const struct SpriteTemplate gSpriteTemplate_84028CC;
extern const struct SpriteTemplate gSpriteTemplate_840294C;
extern const struct SpriteTemplate gSpriteTemplate_84029AC;
extern const union AffineAnimCmd *const gSpriteAffineAnimTable_81E7C18[];
extern const union AffineAnimCmd *const gSpriteAffineAnimTable_81E7BEC[];
extern const union AffineAnimCmd gUnknown_08402400[];
extern const union AffineAnimCmd gUnknown_084024B0[];
extern const union AffineAnimCmd gUnknown_08402518[];
extern const union AffineAnimCmd gUnknown_08402540[];
extern const union AffineAnimCmd gUnknown_08402590[];
extern const union AffineAnimCmd gUnknown_08402610[];
extern const union AffineAnimCmd gUnknown_08402750[];
extern const union AffineAnimCmd gUnknown_084028AC[];
extern const union AffineAnimCmd gUnknown_084029DC[];
extern const u32 gUnknown_08D2AA98[];
extern const u32 gUnknown_08D2A9E0[];
extern const u16 gUnknown_08D2AA80[];
extern const s8 gUnknown_084025C0[];
extern const s8 gUnknown_08402604[];
extern const u8 gUnknown_08402608[];
extern const struct SpriteTemplate gBattleAnimSpriteTemplate_84025EC;
extern const u8 gUnknown_08D2E014[];
extern const u8 gUnknown_08D2E170[];
extern const u16 gUnknown_08D2E150[];
extern u8 gBattleMonForms[];
extern u8 gBankSpriteIds[];
extern u16 gBattlerPartyIndexes[];
extern s16 gUnknown_084028E4[];

extern u8 sub_8046234(s16 x, s16 y, u8 a3);
extern void sub_80DA48C(struct Sprite *);
extern void sub_80E3C4C(u8 taskId, int unused, u16 arg2, u8 battler1, u8 arg4, u8 arg5, u8 arg6, u8 arg7, const u8 *arg8, const u8 *arg9, const u16 *palette);

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
static void sub_812ED24(struct Sprite *sprite);
static void sub_812EE00(struct Sprite *sprite);
static void sub_812EEEC(struct Sprite *sprite);
/*static*/ void sub_812F238(u8 taskId);
static void sub_812F290(u8 taskId);
static void sub_812F474(u8 taskId);
static void sub_812F76C(u8 taskId);
static void sub_812F8DC(struct Sprite *sprite);
static void sub_812FE20(u8 taskId);
static void sub_812FEB8(u8, bool8);
static void sub_813003C(u8 taskId);
static void sub_81301B4(struct Sprite *sprite);
static void sub_81302E4(u8 taskId);
static void sub_8130424(s16, s16, s16, s16, u8, u8, s16*, s16*);
static void sub_81306A4(u8 taskId);
static void sub_813085C(struct Sprite *sprite);
static void sub_8130970(u8 taskId);
static void sub_8130A94(struct Sprite *sprite);
static void sub_8130B38(struct Sprite *sprite);
static void sub_8130DBC(u8 taskId);
static void sub_8130FE0(struct Sprite *sprite);
static void sub_8131408(u8 taskId);
static void sub_81315C8(struct Sprite *sprite);
static void sub_8131810(u8 taskId);
static void sub_8131838(struct Sprite *sprite);


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
    sprite->callback = StartAnimLinearTranslation;
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

    InitAnimArcTranslation(sprite);
    sprite->callback = sub_812C798;
}

static void sub_812C798(struct Sprite *sprite)
{
    if (TranslateAnimArc(sprite))
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
        sprite->callback = StartAnimLinearTranslation;
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

void sub_812EA4C(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        if (gBattleAnimArgs[2] == 0)
        {
            sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
            sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
        }

        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
        sprite->data[1] = 0x80;
        sprite->data[2] = 0x300;
        sprite->data[3] = gBattleAnimArgs[1];
        sprite->data[0]++;
    }
    else
    {
        sprite->pos2.x = sprite->data[1] >> 8;
        sprite->pos2.y += sprite->data[2] >> 8;
        if (sprite->data[4] == 0 && sprite->pos2.y > -sprite->data[3])
        {
            sprite->data[4] = 1;
            sprite->data[2] = (-sprite->data[2] / 3) * 2;
        }

        sprite->data[1] += 192;
        sprite->data[2] += 128;
        if (sprite->animEnded)
            DestroyAnimSprite(sprite);
    }
}

void sub_812EB10(u8 taskId)
{
    u8 spriteId;

    if (gTasks[taskId].data[0] == 0)
    {
        if (gBattleAnimArgs[0] == 0)
            gTasks[taskId].data[11] = gAnimBankAttacker;
        else
            gTasks[taskId].data[11] = gAnimBankTarget;

        spriteId = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);
        gTasks[taskId].data[10] = spriteId;
        sub_8078E70(spriteId, 0);

        switch (gBattleAnimArgs[1])
        {
        case 0:
            obj_id_set_rotscale(spriteId, 0xE0, 0x140, 0);
            sub_8079A64(spriteId);
            break;
        case 1:
            obj_id_set_rotscale(spriteId, 0xD0, 0x130, 0xF00);
            sub_8079A64(spriteId);
            if (IsContest() || GetBattlerSide(gTasks[taskId].data[11]) == B_SIDE_PLAYER)
                gSprites[spriteId].pos2.y += 16;
            break;
        case 2:
            obj_id_set_rotscale(spriteId, 0xD0, 0x130, 0xF100);
            sub_8079A64(spriteId);
            if (IsContest() || GetBattlerSide(gTasks[taskId].data[11]) == B_SIDE_PLAYER)
                gSprites[spriteId].pos2.y += 16;
            break;
        }

        gSprites[spriteId].pos2.x = 2;
        gTasks[taskId].data[0]++;
    }
    else
    {
        spriteId = gTasks[taskId].data[10];
        if (++gTasks[taskId].data[2] == 3)
        {
            gTasks[taskId].data[2] = 0;
            gSprites[spriteId].pos2.x = -gSprites[spriteId].pos2.x;
        }

        if (++gTasks[taskId].data[1] == 13)
        {
            sub_8078F40(spriteId);
            gSprites[spriteId].pos2.x = 0;
            gSprites[spriteId].pos2.y = 0;
            DestroyAnimVisualTask(taskId);
        }
    }
}

void sub_812EC78(struct Sprite *sprite)
{
    u8 tileOffset;
    int rand1;
    int rand2;

    tileOffset = Random() % 12;
    sprite->oam.tileNum += tileOffset;
    rand1 = Random() & 0x1FF;
    rand2 = Random() & 0xFF;

    if (rand1 & 1)
        sprite->data[0] = 0x5E0 + rand1;
    else
        sprite->data[0] = 0x5E0 - rand1;

    if (rand2 & 1)
        sprite->data[1] = 0x480 + rand2;
    else
        sprite->data[1] = 0x480 - rand2;

    sprite->data[2] = gBattleAnimArgs[0];
    if (sprite->data[2] == 0)
        sprite->pos1.x = -8;
    else
        sprite->pos1.x = 248;

    sprite->pos1.y = 104;
    sprite->callback = sub_812ED24;
}

static void sub_812ED24(struct Sprite *sprite)
{
    if (sprite->data[2] == 0)
    {
        sprite->pos2.x += sprite->data[0] >> 8;
        sprite->pos2.y -= sprite->data[1] >> 8;
    }
    else
    {
        sprite->pos2.x -= sprite->data[0] >> 8;
        sprite->pos2.y -= sprite->data[1] >> 8;
    }

    sprite->data[0] -= 22;
    sprite->data[1] -= 48;
    if (sprite->data[0] < 0)
        sprite->data[0] = 0;

    if (++sprite->data[3] == 31)
        DestroyAnimSprite(sprite);
}

void sub_812ED84(struct Sprite *sprite)
{
    REG_WINOUT = 0x1F3F;
    REG_DISPCNT |= DISPCNT_OBJWIN_ON;
    gBattle_WIN0H = 0;
    gBattle_WIN0V = 0;
    REG_WIN0H = 0;
    REG_WIN0V = 0;

    sprite->data[0] = gBattleAnimArgs[2];
    sub_8078764(sprite, 0);
    sprite->oam.objMode = ST_OAM_OBJ_WINDOW;
    sprite->invisible = 1;
    sprite->callback = sub_812EE00;
}

static void sub_812EE00(struct Sprite *sprite)
{
    switch (sprite->data[1])
    {
    case 0:
        sprite->invisible = 0;
        if (sprite->affineAnimEnded)
            sprite->data[1]++;
        break;
    case 1:
        if (--sprite->data[0] == 0)
        {
            ChangeSpriteAffineAnim(sprite, 1);
            sprite->data[1]++;
        }
        break;
    case 2:
        if (sprite->affineAnimEnded)
        {
            sprite->invisible = 1;
            sprite->data[1]++;
        }
        break;
    case 3:
        REG_WINOUT = 0x3F3F;
        REG_DISPCNT ^= DISPCNT_OBJWIN_ON;
        DestroyAnimSprite(sprite);
        break;
    }
}

void sub_812EEA4(struct Sprite *sprite)
{
    sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
    sprite->data[0] = gBattleAnimArgs[0];
    sprite->data[1] = gBattleAnimArgs[1];
    sprite->callback = sub_812EEEC;
    sprite->callback(sprite);
}

static void sub_812EEEC(struct Sprite *sprite)
{
    sprite->pos2.x = Sin(sprite->data[1], sprite->data[2] >> 8);
    sprite->pos2.y = Cos(sprite->data[1], sprite->data[3] >> 8);
    sprite->data[1] = (sprite->data[1] + 9) & 0xFF;

    if ((u16)sprite->data[1] < 64 || sprite->data[1] > 195)
        sprite->subpriority = sub_8079E90(gAnimBankAttacker) - 1;
    else
        sprite->subpriority = sub_8079E90(gAnimBankAttacker) + 1;

    if (sprite->data[5] == 0)
    {
        sprite->data[2] += 0x400;
        sprite->data[3] += 0x100;
        sprite->data[4]++;
        if (sprite->data[4] == sprite->data[0])
        {
            sprite->data[4] = 0;
            sprite->data[5] = 1;
        }
    }
    else if (sprite->data[5] == 1)
    {
        sprite->data[2] -= 0x400;
        sprite->data[3] -= 0x100;
        sprite->data[4]++;
        if (sprite->data[4] == sprite->data[0])
            DestroyAnimSprite(sprite);
    }
}

#ifdef NONMATCHING // functionally equivalent, but seems to be missing a temporary variable
void sub_812EFC8(u8 taskId)
{
    u8 isBackPic;
    u32 personality;
    u32 otId;
    u16 species;
    s16 xOffset;
    u32 priority;
    u8 spriteId;
    s16 coord1, coord2;

    GetAnimBattlerSpriteId(0);
    if (IsContest())
    {
        isBackPic = 1;
        personality = eWRAM_19348Struct->personality;
        otId = eWRAM_19348Struct->otId;
        species = eWRAM_19348Struct->species;
        xOffset = 20;
    }
    else
    {
        if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
        {
            isBackPic = 0;
            personality = GetMonData(&gPlayerParty[gBattlerPartyIndexes[gAnimBankTarget]], MON_DATA_PERSONALITY);
            otId = GetMonData(&gPlayerParty[gBattlerPartyIndexes[gAnimBankTarget]], MON_DATA_OT_ID);
            if (eTransformStatuses[gAnimBankTarget].species == SPECIES_NONE)
            {
                if (GetBattlerSide(gAnimBankTarget) == B_SIDE_PLAYER)
                    species = GetMonData(&gPlayerParty[gBattlerPartyIndexes[gAnimBankTarget]], MON_DATA_SPECIES);
                else
                    species = GetMonData(&gEnemyParty[gBattlerPartyIndexes[gAnimBankTarget]], MON_DATA_SPECIES);
            }
            else
            {
                species = eTransformStatuses[gAnimBankTarget].species;
            }

            xOffset = 20;
        }
        else
        {
            isBackPic = 1;
            personality = GetMonData(&gEnemyParty[gBattlerPartyIndexes[gAnimBankTarget]], MON_DATA_PERSONALITY);
            otId = GetMonData(&gEnemyParty[gBattlerPartyIndexes[gAnimBankTarget]], MON_DATA_OT_ID);
            if (eTransformStatuses[gAnimBankTarget].species == SPECIES_NONE)
            {
                if (GetBattlerSide(gAnimBankTarget) == B_SIDE_PLAYER)
                    species = GetMonData(&gPlayerParty[gBattlerPartyIndexes[gAnimBankTarget]], MON_DATA_SPECIES);
                else
                    species = GetMonData(&gEnemyParty[gBattlerPartyIndexes[gAnimBankTarget]], MON_DATA_SPECIES);
            }
            else
            {
                species = eTransformStatuses[gAnimBankTarget].species;
            }

            xOffset = -20;
        }
    }

    priority = sub_8079ED4(gAnimBankAttacker);
    coord1 = GetBattlerSpriteCoord(gAnimBankAttacker, 0);
    coord2 = GetBattlerSpriteCoord(gAnimBankAttacker, 1);
    spriteId = sub_8079F44(species, isBackPic, 0, coord1 + xOffset, coord2, 5, personality, otId);

    gSprites[spriteId].oam.priority = priority;
    gSprites[spriteId].oam.objMode = ST_OAM_OBJ_BLEND;
    FillPalette(RGB(31, 31, 31), (gSprites[spriteId].oam.paletteNum << 4) + 0x100, 32);
    gSprites[spriteId].oam.priority = priority;
    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = ((16 - gTasks[taskId].data[1]) << 8) | gTasks[taskId].data[1];

    gTasks[taskId].data[0] = spriteId;
    gTasks[taskId].func = sub_812F238;
}
#else
NAKED
void sub_812EFC8(u8 taskId)
{
    asm(".syntax unified\n\
    .equ REG_BLDCNT, 0x4000050\n\
    .equ REG_BLDALPHA, 0x4000052\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x18\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    str r0, [sp, 0x10]\n\
    movs r0, 0\n\
    bl GetAnimBattlerSpriteId\n\
    bl IsContest\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _0812F004\n\
    movs r0, 0x1\n\
    str r0, [sp, 0x14]\n\
    ldr r0, _0812F000 @ =gSharedMem + 0x19348\n\
    ldr r1, [r0, 0x10]\n\
    mov r9, r1\n\
    ldr r2, [r0, 0xC]\n\
    mov r8, r2\n\
    ldrh r6, [r0, 0x2]\n\
    movs r3, 0x14\n\
    b _0812F13C\n\
    .align 2, 0\n\
_0812F000: .4byte gSharedMem + 0x19348\n\
_0812F004:\n\
    ldr r0, _0812F070 @ =gAnimBankAttacker\n\
    ldrb r0, [r0]\n\
    bl GetBattlerSide\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _0812F0AC\n\
    movs r0, 0\n\
    str r0, [sp, 0x14]\n\
    ldr r6, _0812F074 @ =gBattlerPartyIndexes\n\
    ldr r4, _0812F078 @ =gAnimBankTarget\n\
    ldrb r0, [r4]\n\
    lsls r0, 1\n\
    adds r0, r6\n\
    ldrh r0, [r0]\n\
    movs r5, 0x64\n\
    muls r0, r5\n\
    ldr r7, _0812F07C @ =gPlayerParty\n\
    adds r0, r7\n\
    movs r1, 0\n\
    bl GetMonData\n\
    mov r9, r0\n\
    ldrb r0, [r4]\n\
    lsls r0, 1\n\
    adds r0, r6\n\
    ldrh r0, [r0]\n\
    muls r0, r5\n\
    adds r0, r7\n\
    movs r1, 0x1\n\
    bl GetMonData\n\
    mov r8, r0\n\
    ldrb r2, [r4]\n\
    lsls r1, r2, 2\n\
    ldr r0, _0812F080 @ =gSharedMem + 0x17800\n\
    adds r1, r0\n\
    ldrh r0, [r1, 0x2]\n\
    cmp r0, 0\n\
    bne _0812F0A4\n\
    adds r0, r2, 0\n\
    bl GetBattlerSide\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _0812F084\n\
    ldrb r0, [r4]\n\
    lsls r0, 1\n\
    adds r0, r6\n\
    ldrh r0, [r0]\n\
    muls r0, r5\n\
    adds r0, r7\n\
    b _0812F092\n\
    .align 2, 0\n\
_0812F070: .4byte gAnimBankAttacker\n\
_0812F074: .4byte gBattlerPartyIndexes\n\
_0812F078: .4byte gAnimBankTarget\n\
_0812F07C: .4byte gPlayerParty\n\
_0812F080: .4byte gSharedMem + 0x17800\n\
_0812F084:\n\
    ldrb r0, [r4]\n\
    lsls r0, 1\n\
    adds r0, r6\n\
    ldrh r0, [r0]\n\
    muls r0, r5\n\
    ldr r1, _0812F0A0 @ =gEnemyParty\n\
    adds r0, r1\n\
_0812F092:\n\
    movs r1, 0xB\n\
    bl GetMonData\n\
    lsls r0, 16\n\
    lsrs r6, r0, 16\n\
    b _0812F0A6\n\
    .align 2, 0\n\
_0812F0A0: .4byte gEnemyParty\n\
_0812F0A4:\n\
    ldrh r6, [r1, 0x2]\n\
_0812F0A6:\n\
    movs r1, 0x14\n\
    mov r10, r1\n\
    b _0812F13E\n\
_0812F0AC:\n\
    movs r2, 0x1\n\
    str r2, [sp, 0x14]\n\
    ldr r6, _0812F10C @ =gBattlerPartyIndexes\n\
    ldr r4, _0812F110 @ =gAnimBankTarget\n\
    ldrb r0, [r4]\n\
    lsls r0, 1\n\
    adds r0, r6\n\
    ldrh r0, [r0]\n\
    movs r5, 0x64\n\
    muls r0, r5\n\
    ldr r7, _0812F114 @ =gEnemyParty\n\
    adds r0, r7\n\
    movs r1, 0\n\
    bl GetMonData\n\
    mov r9, r0\n\
    ldrb r0, [r4]\n\
    lsls r0, 1\n\
    adds r0, r6\n\
    ldrh r0, [r0]\n\
    muls r0, r5\n\
    adds r0, r7\n\
    movs r1, 0x1\n\
    bl GetMonData\n\
    mov r8, r0\n\
    ldrb r2, [r4]\n\
    lsls r1, r2, 2\n\
    ldr r0, _0812F118 @ =gSharedMem + 0x17800\n\
    adds r1, r0\n\
    ldrh r0, [r1, 0x2]\n\
    cmp r0, 0\n\
    bne _0812F138\n\
    adds r0, r2, 0\n\
    bl GetBattlerSide\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _0812F120\n\
    ldrb r0, [r4]\n\
    lsls r0, 1\n\
    adds r0, r6\n\
    ldrh r0, [r0]\n\
    muls r0, r5\n\
    ldr r1, _0812F11C @ =gPlayerParty\n\
    adds r0, r1\n\
    b _0812F12C\n\
    .align 2, 0\n\
_0812F10C: .4byte gBattlerPartyIndexes\n\
_0812F110: .4byte gAnimBankTarget\n\
_0812F114: .4byte gEnemyParty\n\
_0812F118: .4byte gSharedMem + 0x17800\n\
_0812F11C: .4byte gPlayerParty\n\
_0812F120:\n\
    ldrb r0, [r4]\n\
    lsls r0, 1\n\
    adds r0, r6\n\
    ldrh r0, [r0]\n\
    muls r0, r5\n\
    adds r0, r7\n\
_0812F12C:\n\
    movs r1, 0xB\n\
    bl GetMonData\n\
    lsls r0, 16\n\
    lsrs r6, r0, 16\n\
    b _0812F13A\n\
_0812F138:\n\
    ldrh r6, [r1, 0x2]\n\
_0812F13A:\n\
    ldr r3, _0812F218 @ =0x0000ffec\n\
_0812F13C:\n\
    mov r10, r3\n\
_0812F13E:\n\
    ldr r0, _0812F21C @ =gAnimBankAttacker\n\
    ldrb r0, [r0]\n\
    bl sub_8079ED4\n\
    lsls r0, 24\n\
    lsrs r7, r0, 24\n\
    ldr r5, _0812F21C @ =gAnimBankAttacker\n\
    ldrb r0, [r5]\n\
    movs r1, 0\n\
    bl GetBattlerSpriteCoord\n\
    adds r4, r0, 0\n\
    lsls r4, 24\n\
    lsrs r4, 24\n\
    ldrb r0, [r5]\n\
    movs r1, 0x1\n\
    bl GetBattlerSpriteCoord\n\
    lsls r0, 24\n\
    mov r2, r10\n\
    lsls r1, r2, 16\n\
    asrs r1, 16\n\
    adds r4, r1\n\
    lsls r4, 16\n\
    asrs r4, 16\n\
    lsrs r0, 24\n\
    str r0, [sp]\n\
    movs r0, 0x5\n\
    str r0, [sp, 0x4]\n\
    mov r3, r9\n\
    str r3, [sp, 0x8]\n\
    mov r0, r8\n\
    str r0, [sp, 0xC]\n\
    adds r0, r6, 0\n\
    ldr r1, [sp, 0x14]\n\
    movs r2, 0\n\
    adds r3, r4, 0\n\
    bl sub_8079F44\n\
    adds r6, r0, 0\n\
    lsls r6, 24\n\
    lsrs r6, 24\n\
    ldr r0, _0812F220 @ =gSprites\n\
    lsls r5, r6, 4\n\
    adds r5, r6\n\
    lsls r5, 2\n\
    adds r5, r0\n\
    movs r0, 0x3\n\
    ands r7, r0\n\
    lsls r7, 2\n\
    mov r8, r7\n\
    ldrb r0, [r5, 0x5]\n\
    movs r4, 0xD\n\
    negs r4, r4\n\
    adds r1, r4, 0\n\
    ands r1, r0\n\
    mov r2, r8\n\
    orrs r1, r2\n\
    strb r1, [r5, 0x5]\n\
    ldrb r2, [r5, 0x1]\n\
    adds r0, r4, 0\n\
    ands r0, r2\n\
    movs r2, 0x4\n\
    orrs r0, r2\n\
    strb r0, [r5, 0x1]\n\
    ldr r0, _0812F224 @ =0x00007fff\n\
    lsrs r1, 4\n\
    lsls r1, 4\n\
    movs r3, 0x80\n\
    lsls r3, 1\n\
    adds r2, r3, 0\n\
    orrs r1, r2\n\
    movs r2, 0x20\n\
    bl FillPalette\n\
    ldrb r0, [r5, 0x5]\n\
    ands r4, r0\n\
    mov r0, r8\n\
    orrs r4, r0\n\
    strb r4, [r5, 0x5]\n\
    ldr r1, _0812F228 @ =REG_BLDCNT\n\
    movs r2, 0xFD\n\
    lsls r2, 6\n\
    adds r0, r2, 0\n\
    strh r0, [r1]\n\
    ldr r3, _0812F22C @ =REG_BLDALPHA\n\
    ldr r0, _0812F230 @ =gTasks\n\
    ldr r2, [sp, 0x10]\n\
    lsls r1, r2, 2\n\
    adds r1, r2\n\
    lsls r1, 3\n\
    adds r1, r0\n\
    ldrh r2, [r1, 0xA]\n\
    movs r0, 0x10\n\
    subs r0, r2\n\
    lsls r0, 8\n\
    orrs r0, r2\n\
    strh r0, [r3]\n\
    strh r6, [r1, 0x8]\n\
    ldr r0, _0812F234 @ =sub_812F238\n\
    str r0, [r1]\n\
    add sp, 0x18\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0812F218: .4byte 0x0000ffec\n\
_0812F21C: .4byte gAnimBankAttacker\n\
_0812F220: .4byte gSprites\n\
_0812F224: .4byte 0x00007fff\n\
_0812F228: .4byte REG_BLDCNT\n\
_0812F22C: .4byte REG_BLDALPHA\n\
_0812F230: .4byte gTasks\n\
_0812F234: .4byte sub_812F238\n\
    .syntax divided\n");
}
#endif // NONMATCHING

/*static*/ void sub_812F238(u8 taskId)
{
    if (gTasks[taskId].data[10]++ > 1)
    {
        gTasks[taskId].data[10] = 0;
        gTasks[taskId].data[1]++;
        REG_BLDALPHA = ((16 - gTasks[taskId].data[1]) << 8) | gTasks[taskId].data[1];
        if (gTasks[taskId].data[1] == 10)
        {
            gTasks[taskId].data[10] = 256;
            gTasks[taskId].data[11] = 256;
            gTasks[taskId].func = sub_812F290;
        }
    }
}

static void sub_812F290(u8 taskId)
{
    u8 spriteId = gTasks[taskId].data[0];
    gTasks[taskId].data[10] -= 16;
    gTasks[taskId].data[11] += 128;
    gSprites[spriteId].oam.affineMode |= 2;
    sub_8078FDC(&gSprites[spriteId], 1, gTasks[taskId].data[10], gTasks[taskId].data[11], 0);
    if (++gTasks[taskId].data[12] == 9)
    {
        sub_8079098(&gSprites[spriteId]);
        sub_807A0F4(&gSprites[spriteId]);
        gTasks[taskId].func = sub_8078634;
    }
}

void sub_812F314(u8 taskId)
{
    u8 battler;
    u16 bgX, bgY;
    s16 y, i;
    struct ScanlineEffectParams scanlineParams;
    struct Task *task = &gTasks[taskId];

    if (gBattleAnimArgs[0] == 0)
        battler = gAnimBankAttacker;
    else
        battler = gAnimBankTarget;

    task->data[0] = 0;
    task->data[1] = 0;
    task->data[2] = 0;
    task->data[3] = 16;
    task->data[4] = 0;
    task->data[5] = battler;
    task->data[6] = 32;
    task->data[7] = 0;
    task->data[8] = 24;

    if (GetBattlerSide(battler) == B_SIDE_OPPONENT)
        task->data[8] *= -1;

    task->data[13] = sub_8077FC0(battler) - 34;
    if (task->data[13] < 0)
        task->data[13] = 0;

    task->data[14] = task->data[13] + 66;
    task->data[15] = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);
    if (GetBattlerPosition_permutated(battler) == 1)
    {
        scanlineParams.dmaDest = &REG_BG1HOFS;
        REG_BLDCNT = 0x3F42;
        bgX = gBattle_BG1_X;
        bgY = gBattle_BG1_Y;
    }
    else
    {
        scanlineParams.dmaDest = &REG_BG2HOFS;
        REG_BLDCNT = 0x3F44;
        bgX = gBattle_BG2_X;
        bgY = gBattle_BG2_Y;
    }

    for (y = 0, i = 0; y < 160; y++, i += 2)
    {
        gScanlineEffectRegBuffers[0][i] = bgX;
        gScanlineEffectRegBuffers[1][i] = bgX;
        gScanlineEffectRegBuffers[0][i + 1] = bgY;
        gScanlineEffectRegBuffers[1][i + 1] = bgY;
    }

    scanlineParams.dmaControl = 0xA6600001;
    scanlineParams.initState = 1;
    scanlineParams.unused9 = 0;
    ScanlineEffect_SetParams(scanlineParams);
    task->func = sub_812F474;
}

static void sub_812F474(u8 taskId)
{
    struct Task *task;
    s16 var1;
    s16 var2;
    s16 bgX, bgY;
    s16 offset;
    s16 var0;
    s16 i;
    s16 sineIndex;
    s16 var3;

    task = &gTasks[taskId];
    if (GetBattlerPosition_permutated(task->data[5]) == 1)
    {
        bgX = gBattle_BG1_X;
        bgY = gBattle_BG1_Y;
    }
    else
    {
        bgX = gBattle_BG2_X;
        bgY = gBattle_BG2_Y;
    }

    switch (task->data[0])
    {
    case 0:
        offset = task->data[14] * 2;
        var1 = 0;
        var2 = 0;
        i = 0;
        task->data[1] = (task->data[1] + 2) & 0xFF;
        sineIndex = task->data[1];
        task->data[9] = 0x7E0 / task->data[6];
        task->data[10] = -((task->data[7] * 2) / task->data[9]);
        task->data[11] = task->data[7];
        var3 = task->data[11] >> 5;
        task->data[12] = var3;
        var0 = task->data[14];
        while (var0 > task->data[13])
        {
            gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][offset + 1] = (i - var2) + bgY;
            gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][offset] = bgX + var3 + (gSineTable[sineIndex] >> 5);
            sineIndex = (sineIndex + 10) & 0xFF;
            task->data[11] += task->data[10];
            var3 = task->data[11] >> 5;
            task->data[12] = var3;

            i++;
            offset -= 2;
            var1 += task->data[6];
            var2 = var1 >> 5;
            var0--;
        }

        var0 *= 2;
        while (var0 >= 0)
        {
            gScanlineEffectRegBuffers[0][var0] = bgX + 240;
            gScanlineEffectRegBuffers[1][var0] = bgX + 240;
            var0 -= 2;
        }

        if (++task->data[6] > 63)
        {
            task->data[6] = 64;
            task->data[2]++;
            if (task->data[2] & 1)
                task->data[3]--;
            else
                task->data[4]++;

            REG_BLDALPHA = (task->data[4] << 8) | task->data[3];
            if (task->data[3] == 0 && task->data[4] == 16)
            {
                task->data[2] = 0;
                task->data[3] = 0;
                task->data[0]++;
            }
        }
        else
        {
            task->data[7] += task->data[8];
        }
        break;
    case 1:
        if (++task->data[2] > 12)
        {
            gScanlineEffect.state = 3;
            task->data[2] = 0;
            task->data[0]++;
        }
        break;
    case 2:
        task->data[2]++;
        if (task->data[2] & 1)
            task->data[3]++;
        else
            task->data[4]--;

        REG_BLDALPHA = (task->data[4] << 8) | task->data[3];
        if (task->data[3] == 16 && task->data[4] == 0)
        {
            task->data[2] = 0;
            task->data[3] = 0;
            task->data[0]++;
        }
        break;
    case 3:
        DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_812F724(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    task->data[0] = 0;
    task->data[15] = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);
    sub_80798F4(&gTasks[taskId], task->data[15], &gUnknown_08402750);
    task->func = sub_812F76C;
}

static void sub_812F76C(u8 taskId)
{
    u16 var0;

    struct Task *task = &gTasks[taskId];
    var0 = task->data[0];
    task->data[0]++;
    var0 -= 20;
    if (var0 < 23)
    {
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;
            task->data[2]++;
            if (task->data[2] & 1)
                gSprites[task->data[15]].pos2.x = 1;
            else
                gSprites[task->data[15]].pos2.x = -1;
        }
    }
    else
    {
        gSprites[task->data[15]].pos2.x = 0;
    }

    if (!sub_807992C(&gTasks[taskId]))
        DestroyAnimVisualTask(taskId);
}

static void sub_812F804(struct Sprite *sprite, s16 b, s16 c, s16 d, s16 e, u16 f)
{
    sprite->pos1.x = b;
    sprite->pos1.y = c;
    sprite->data[4] = b << 4;
    sprite->data[5] = c << 4;
    sprite->data[6] = ((d - b) << 4) / f;
    sprite->data[7] = ((e - c) << 4) / f;
}

void sub_812F86C(struct Sprite *sprite)
{
    sprite->data[4] += sprite->data[6];
    sprite->data[5] += sprite->data[7];
    sprite->pos1.x = sprite->data[4] >> 4;
    sprite->pos1.y = sprite->data[5] >> 4;
}

void sub_812F88C(struct Sprite *sprite)
{
    s16 x = sprite->pos1.x;
    s16 y = sprite->pos1.y;

    sub_8078650(sprite);
    StartSpriteAffineAnim(sprite, gBattleAnimArgs[0]);
    sub_812F804(sprite, sprite->pos1.x, sprite->pos1.y, x, y, 64);
    sprite->data[0] = 0;
    sprite->callback = sub_812F8DC;
}

static void sub_812F8DC(struct Sprite *sprite)
{
    int index;

    sprite->data[0]++;
    index = (sprite->data[0] * 8) & 0xFF;
    sub_812F86C(sprite);
    sprite->pos2.y = Sin(index, 8);
    if (sprite->data[0] > 58)
    {
        if (++sprite->data[1] > 1)
        {
            sprite->data[1] = 0;
            sprite->data[2]++;
            sprite->invisible = sprite->data[2] & 1;
            if (sprite->data[2] > 3)
                move_anim_8074EE0(sprite);
        }
    }
}

void sub_812F948(struct Sprite *sprite)
{
    sprite->data[0] = gBattleAnimArgs[3];
    StartSpriteAffineAnim(sprite, gBattleAnimArgs[0]);
    if (GetBattlerSide(gAnimBankTarget) != B_SIDE_PLAYER)
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];

    sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2) + gBattleAnimArgs[1];
    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3) + gBattleAnimArgs[2];
    sprite->callback = sub_80DA48C;
}

static void sub_812F9B0(u8 taskId)
{
    u16 var0 = 0;
    u16 var1 = 0;

    gTasks[taskId].data[0]--;
    if ((gTasks[taskId].data[6] & 0x8000) && (--gTasks[taskId].data[1] == -1))
    {
        if (gTasks[taskId].data[9] == 0)
        {
            gTasks[taskId].data[9] = gTasks[taskId].data[4];
            gTasks[taskId].data[4] = -gTasks[taskId].data[4];
        }
        else
        {
            gTasks[taskId].data[9] = 0;
        }

        if (gTasks[taskId].data[10] == 0)
        {
            gTasks[taskId].data[10] = gTasks[taskId].data[5];
            gTasks[taskId].data[5] = -gTasks[taskId].data[5];
        }
        else
        {
            gTasks[taskId].data[10] = 0;
        }

        gTasks[taskId].data[1] = gTasks[taskId].data[13];
    }

    var0 = gTasks[taskId].data[7];
    var1 = gTasks[taskId].data[8];
    if (gTasks[taskId].data[2] & 0x8000)
        gSprites[gTasks[taskId].data[15]].pos2.x = gTasks[taskId].data[9] - (var0 >> 8);
    else
        gSprites[gTasks[taskId].data[15]].pos2.x = gTasks[taskId].data[9] + (var0 >> 8);

    if (gTasks[taskId].data[3] & 0x8000)
        gSprites[gTasks[taskId].data[15]].pos2.y = gTasks[taskId].data[10] - (var1 >> 8);
    else
        gSprites[gTasks[taskId].data[15]].pos2.y = gTasks[taskId].data[10] + (var1 >> 8);

    if (gTasks[taskId].data[0] < 1)
    {
        DestroyTask(taskId);
        gAnimVisualTaskCount--;
    }
}

static void sub_812FAF8(u8 taskId)
{
    u16 var0 = 0;
    u16 var1 = 0;

    gTasks[taskId].data[0]--;
    if ((gTasks[taskId].data[6] & 0x8000) && (--gTasks[taskId].data[1] == -1))
    {
        if (gTasks[taskId].data[9] == 0)
        {
            gTasks[taskId].data[9] = gTasks[taskId].data[4];
            gTasks[taskId].data[4] = -gTasks[taskId].data[4];
        }
        else
        {
            gTasks[taskId].data[9] = var0;
        }

        if (gTasks[taskId].data[10] == 0)
        {
            gTasks[taskId].data[10] = gTasks[taskId].data[5];
            gTasks[taskId].data[5] = -gTasks[taskId].data[5];
        }
        else
        {
            gTasks[taskId].data[10] = 0;
        }

        gTasks[taskId].data[1] = gTasks[taskId].data[13];
    }

    var0 = (gTasks[taskId].data[2] & 0x7FFF) + gTasks[taskId].data[7];
    var1 = (gTasks[taskId].data[3] & 0x7FFF) + gTasks[taskId].data[8];
    if (gTasks[taskId].data[2] & 0x8000)
        gSprites[gTasks[taskId].data[15]].pos2.x = gTasks[taskId].data[9] - (var0 >> 8);
    else
        gSprites[gTasks[taskId].data[15]].pos2.x = gTasks[taskId].data[9] + (var0 >> 8);

    if (gTasks[taskId].data[3] & 0x8000)
        gSprites[gTasks[taskId].data[15]].pos2.y = gTasks[taskId].data[10] - (var1 >> 8);
    else
        gSprites[gTasks[taskId].data[15]].pos2.y = gTasks[taskId].data[10] + (var1 >> 8);

    gTasks[taskId].data[7] = var0;
    gTasks[taskId].data[8] = var1;
    if (gTasks[taskId].data[0] < 1)
    {
        gTasks[taskId].data[0] = 30;
        gTasks[taskId].data[13] = 0;
        gTasks[taskId].func = sub_812F9B0;
    }
}

void sub_812FC68(u8 taskId)
{
    gTasks[taskId].data[15] = gBankSpriteIds[gAnimBankAttacker];
    gTasks[taskId].data[14] = gBattleAnimArgs[0];
    gTasks[taskId].data[0] = gBattleAnimArgs[0];
    gTasks[taskId].data[13] = gBattleAnimArgs[6];
    if (gBattleAnimArgs[3])
        gTasks[taskId].data[6] = gTasks[taskId].data[6] | -0x8000;

    if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
    {
        gTasks[taskId].data[2] = gBattleAnimArgs[1];
        gTasks[taskId].data[3] = gBattleAnimArgs[2];
    }
    else
    {
        if (gBattleAnimArgs[1] & 0x8000)
            gTasks[taskId].data[2] = gBattleAnimArgs[1] & 0x7FFF;
        else
            gTasks[taskId].data[2] = gBattleAnimArgs[1] | -0x8000;

        if (gBattleAnimArgs[2] & 0x8000)
            gTasks[taskId].data[3] = gBattleAnimArgs[2] & 0x7FFF;
        else
            gTasks[taskId].data[3] = gBattleAnimArgs[2] | -0x8000;
    }

    gTasks[taskId].data[8] = 0;
    gTasks[taskId].data[7] = 0;
    gTasks[taskId].data[4] = gBattleAnimArgs[4];
    gTasks[taskId].data[5] = gBattleAnimArgs[5];
    gTasks[taskId].func = sub_812FAF8;
}

void sub_812FD7C(u8 taskId)
{
    u8 battler;
    struct Task *task = &gTasks[taskId];

    if (gBattleAnimArgs[1] == 0)
        DestroyAnimVisualTask(taskId);
    
    task->data[0] = 0;
    task->data[1] = 0;
    task->data[2] = 0;
    task->data[3] = gBattleAnimArgs[1];
    if (gBattleAnimArgs[0] == 0)
        battler = gAnimBankAttacker;
    else
        battler = gAnimBankTarget;

    task->data[4] = GetBattlerSpriteCoord(battler, 0);
    task->data[5] = GetBattlerSpriteCoord(battler, 1);
    task->data[6] = sub_8079E90(battler);
    task->data[15] = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);
    sub_80798F4(task, task->data[15], &gUnknown_084028AC);
    task->func = sub_812FE20;
}

static void sub_812FE20(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        if (++task->data[1] == 6)
            sub_812FEB8(taskId, TRUE);

        if (task->data[1] == 18)
            sub_812FEB8(taskId, FALSE);

        if (!sub_807992C(task))
        {
            if (--task->data[3] == 0)
            {
                task->data[0]++;
            }
            else
            {
                task->data[1] = 0;
                sub_80798F4(task, task->data[15], &gUnknown_084028AC);
            }
        }
        break;
    case 1:
        if (task->data[2] == 0)
            DestroyAnimVisualTask(taskId);
        break;
    }
}

static void sub_812FEB8(u8 taskId, bool8 arg1)
{
    u8 i;
    s8 xOffset, yOffset;
    struct Task *task;
    s16 xCoords[4];
    s16 yCoords[2];

    task = &gTasks[taskId];
    if (!arg1)
    {
        xOffset = 18;
        yOffset = -20;
    }
    else
    {
        xOffset = 30;
        yOffset = 20;
    }

    xCoords[0] = task->data[4] - xOffset;
    xCoords[1] = task->data[4] - xOffset - 4;
    xCoords[2] = task->data[4] + xOffset;
    xCoords[3] = task->data[4] + xOffset + 4;
    yCoords[0] = task->data[5] + yOffset;
    yCoords[1] = task->data[5] + yOffset + 6;

    for (i = 0; i < 4; i++)
    {
        u8 spriteId = CreateSprite(&gSpriteTemplate_84028CC, xCoords[i], yCoords[i & 1], task->data[6] - 5);
        if (spriteId != MAX_SPRITES)
        {
            gSprites[spriteId].data[0] = 0;
            gSprites[spriteId].data[1] = i < 2 ? -2 : 2;
            gSprites[spriteId].data[2] = -1;
            gSprites[spriteId].data[3] = taskId;
            gSprites[spriteId].data[4] = 2;
            task->data[2]++;
        }
    }
}

void sub_812FF94(struct Sprite *sprite)
{
    sprite->pos1.x += sprite->data[1];
    sprite->pos1.y += sprite->data[2];
    if (++sprite->data[0] > 6)
    {
        gTasks[sprite->data[3]].data[sprite->data[4]]--;
        DestroySprite(sprite);
    }
}

void sub_812FFE4(u8 taskId)
{
    u8 spriteId;

    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = gBattleAnimArgs[1];
    spriteId = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);
    gTasks[taskId].data[2] = 0x100 + gSprites[spriteId].oam.paletteNum * 16;
    gTasks[taskId].func = sub_813003C;
}

static void sub_813003C(u8 taskId)
{
    if (gTasks[taskId].data[1])
    {
        BlendPalette(gTasks[taskId].data[2], 16, 8, gUnknown_084028E4[gTasks[taskId].data[0]]);
        if (++gTasks[taskId].data[0] > 23)
            gTasks[taskId].data[0] = 0;
        
        gTasks[taskId].data[1]--;
    }
    else
    {
        BlendPalette(gTasks[taskId].data[2], 16, 0, RGB(0, 0, 0));
        DestroyAnimVisualTask(taskId);
    }
}

void sub_81300A4(u8 taskId)
{
    sub_80E3C4C(
        taskId,
        0,
        0x1A0,
        gAnimBankAttacker,
        gBattleAnimArgs[0],
        10,
        2,
        30,
        gUnknown_08D2E014,
        gUnknown_08D2E170,
        gUnknown_08D2E150);
}

void sub_81300F4(struct Sprite *sprite)
{
    if (GetBattlerSide(gAnimBankAttacker) == B_SIDE_OPPONENT)
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
    
    sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 0) + gBattleAnimArgs[0];
    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 1) + gBattleAnimArgs[1];
    if (gBattleAnimArgs[2] == 0)
    {
        sprite->data[0] = 640;
        sprite->data[1] = -640;
    }
    else if (gBattleAnimArgs[2] == 1)
    {
        sprite->vFlip = 1;
        sprite->data[0] = 640;
        sprite->data[1] = 640;
    }
    else
    {
        StartSpriteAnim(sprite, 1);
        sprite->data[0] = 640;
    }

    if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
    {
        sprite->data[0] = -sprite->data[0];
        sprite->hFlip = 1;
    }

    sprite->callback = sub_81301B4;
}

static void sub_81301B4(struct Sprite *sprite)
{
    sprite->data[6] += sprite->data[0];
    sprite->data[7] += sprite->data[1];
    sprite->pos2.x = sprite->data[6] >> 8;
    sprite->pos2.y = sprite->data[7] >> 8;
    if (++sprite->data[5] == 14)
        DestroyAnimSprite(sprite);
}

void sub_81301EC(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (IsContest())
    {
        task->data[5] = 8;
        task->data[6] = 3;
        task->data[7] = 1;
    }
    else
    {
        task->data[5] = 12;
        task->data[6] = 3;
        task->data[7] = 0;
    }

    if (GetBattlerSide(gAnimBankAttacker) == B_SIDE_PLAYER)
        task->data[11] = GetBattlerSpriteCoord(gAnimBankAttacker, 2) + sub_807A100(gAnimBankAttacker, 0) / 4;
    else
        task->data[11] = GetBattlerSpriteCoord(gAnimBankAttacker, 2) - sub_807A100(gAnimBankAttacker, 0) / 4;

    task->data[12] = GetBattlerSpriteCoord(gAnimBankAttacker, 3) - sub_807A100(gAnimBankAttacker, 0) / 4;
    task->data[13] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
    task->data[14] = GetBattlerSpriteCoord(gAnimBankTarget, 3);
    task->func = sub_81302E4;
}

static void sub_81302E4(u8 taskId)
{
    u8 i;
    s16 x, y;
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        if (++task->data[1] > 3)
        {
            task->data[1] = 0;
            sub_8130424(
                task->data[11],
                task->data[12],
                task->data[13],
                task->data[14],
                task->data[5],
                task->data[2],
                &x,
                &y);

            for (i = 0; i < 2; i++)
            {
                u8 spriteId = CreateSprite(&gSpriteTemplate_840294C, x, y, 35);
                if (spriteId != MAX_SPRITES)
                {
                    if (task->data[7] == 0)
                    {
                        if (i == 0)
                            gSprites[spriteId].pos2.x = gSprites[spriteId].pos2.y = -task->data[6];
                        else
                            gSprites[spriteId].pos2.x = gSprites[spriteId].pos2.y = task->data[6];
                    }
                    else
                    {
                        if (i == 0)
                        {
                            gSprites[spriteId].pos2.x = -task->data[6];
                            gSprites[spriteId].pos2.y = task->data[6];
                        }
                        else
                        {
                            gSprites[spriteId].pos2.x = task->data[6];
                            gSprites[spriteId].pos2.y = -task->data[6];
                        }
                    }

                    gSprites[spriteId].data[0] = 0;
                    gSprites[spriteId].data[1] = taskId;
                    gSprites[spriteId].data[2] = 10;
                    task->data[10]++;
                }
            }

            if (task->data[2] == task->data[5])
                task->data[0]++;

            task->data[2]++;
        }
        break;
    case 1:
        if (task->data[10] == 0)
            DestroyAnimVisualTask(taskId);
        break;
    }
}

static void sub_8130424(s16 arg0, s16 arg1, s16 arg2, s16 arg3, u8 arg4, u8 arg5, s16 *x, s16 *y)
{
    int x2;
    int y2;

    if (arg5 == 0)
    {
        *x = arg0;
        *y = arg1;
        return;
    }

    if (arg5 >= arg4)
    {
        *x = arg2;
        *y = arg3;
        return;
    }

    arg4--;
    x2 = (arg0 << 8) + arg5 * (((arg2 - arg0) << 8) / arg4);
    y2 = (arg1 << 8) + arg5 * (((arg3 - arg1) << 8) / arg4);
    *x = x2 >> 8;
    *y = y2 >> 8;
}

void sub_81304DC(struct Sprite *sprite)
{
    if (++sprite->data[0] > 36)
    {
        gTasks[sprite->data[1]].data[sprite->data[2]]--;
        DestroySprite(sprite);
    }
}

void sub_813051C(struct Sprite *sprite)
{
    sprite->pos1.x = gBattleAnimArgs[0];
    sprite->pos1.y = gBattleAnimArgs[1];
    sprite->data[2] = gBattleAnimArgs[2];
    sprite->data[4] = gBattleAnimArgs[3];
    sprite->data[0] = gBattleAnimArgs[4];
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    sprite->callback = sub_8078CC0;
}

void sub_8130554(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    task->data[11] = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    task->data[12] = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
    task->data[13] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
    task->data[14] = GetBattlerSpriteCoord(gAnimBankTarget, 3) + sub_807A100(gAnimBankTarget, 0) / 4;
    task->data[15] = CreateSprite(&gSpriteTemplate_84029AC, task->data[11], task->data[12], sub_8079E90(gAnimBankTarget) - 5);
    if (task->data[15] != MAX_SPRITES)
    {
        gSprites[task->data[15]].data[0] = 16;
        gSprites[task->data[15]].data[2] = task->data[13];
        gSprites[task->data[15]].data[4] = task->data[14];
        gSprites[task->data[15]].data[5] = -32;
        InitAnimArcTranslation(&gSprites[task->data[15]]);
        if (GetBattlerSide(gAnimBankAttacker) == B_SIDE_OPPONENT)
            StartSpriteAffineAnim(&gSprites[task->data[15]], 1);
        
        task->func = sub_81306A4;
    }
    else
    {
        DestroyAnimVisualTask(taskId);
    }
}

static void sub_81306A4(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;
            TranslateAnimArc(&gSprites[task->data[15]]);
            if (++task->data[2] > 7)
                task->data[0]++;
        }
        break;
    case 1:
        if (TranslateAnimArc(&gSprites[task->data[15]]))
        {
            task->data[1] = 0;
            task->data[2] = 0;
            task->data[0]++;
        }
        break;
    case 2:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;
            task->data[2]++;
            gSprites[task->data[15]].invisible = task->data[2] & 1;
            if (task->data[2] == 16)
            {
                FreeOamMatrix(gSprites[task->data[15]].oam.matrixNum);
                DestroySprite(&gSprites[task->data[15]]);
                task->data[0]++;
            }
        }
        break;
    case 3:
        DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_81307B0(struct Sprite *sprite)
{
    u8 battler;

    if (gBattleAnimArgs[0] == 0)
        battler = gAnimBankAttacker;
    else
        battler = gAnimBankTarget;

    sprite->oam.tileNum += 16;
    sprite->data[6] = gBattleAnimArgs[2];
    sprite->data[7] = gBattleAnimArgs[1] == 0 ? -1 : 1;
    sprite->pos1.y = GetBattlerSpriteCoord(battler, 3);
    if (gBattleAnimArgs[1] == 0)
    {
        sprite->oam.matrixNum |= 0x8;
        sprite->pos1.x = sub_807A100(battler, 4) - 8;
    }
    else
    {
        sprite->pos1.x = sub_807A100(battler, 5) + 8;
    }

    sprite->callback = sub_813085C;
}

static void sub_813085C(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        if (++sprite->data[1] > 1)
        {
            sprite->data[1] = 0;
            sprite->pos2.x += sprite->data[7];
            if (++sprite->data[2] == 12)
                sprite->data[0]++;
        }
        break;
    case 1:
        if (++sprite->data[1] == 8)
        {
            sprite->data[1] = 0;
            sprite->data[0]++;
        }
        break;
    case 2:
        sprite->pos2.x -= sprite->data[7] * 4;
        if (++sprite->data[1] == 6)
        {
            sprite->data[1] = 0;
            sprite->data[0]++;
        }
        break;
    case 3:
        sprite->pos2.x += sprite->data[7] * 3;
        if (++sprite->data[1] == 8)
        {
            if (--sprite->data[6])
            {
                sprite->data[1] = 0;
                sprite->data[0]--;
            }
            else
            {
                DestroyAnimSprite(sprite);
            }
        }
        break;
    }
}

void sub_8130918(u8 taskId)
{
    if (gBattleAnimArgs[0] == 0)
    {
        DestroyAnimVisualTask(taskId);
    }
    else
    {
        gTasks[taskId].data[0] = gBattleAnimArgs[1];
        gTasks[taskId].data[15] = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);
        sub_80798F4(&gTasks[taskId], gTasks[taskId].data[15], &gUnknown_084029DC);
        gTasks[taskId].func = sub_8130970;
    }
}

static void sub_8130970(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (++task->data[1] > 1)
    {
        task->data[1] = 0;
        if (!(task->data[2] & 1))
            gSprites[task->data[15]].pos2.x = 2;
        else
            gSprites[task->data[15]].pos2.x = -2;
    }

    if (!sub_807992C(task))
    {
        gSprites[task->data[15]].pos2.x = 0;
        if (--task->data[0])
        {
            sub_80798F4(&gTasks[taskId], gTasks[taskId].data[15], &gUnknown_084029DC);
            task->data[1] = 0;
            task->data[2] = 0;
        }
        else
        {
            DestroyAnimVisualTask(taskId);
        }
    }
}

void sub_8130A2C(struct Sprite *sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
        sprite->pos1.y = sub_807A100(gAnimBankAttacker, 2);
    }
    else
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankTarget, 2);
        sprite->pos1.y = sub_807A100(gAnimBankTarget, 2);
    }

    if (sprite->pos1.y < 8)
        sprite->pos1.y = 8;

    sprite->data[0] = 0;
    sprite->data[1] = gBattleAnimArgs[1];
    sprite->data[2] = 0;
    sprite->data[3] = gBattleAnimArgs[2];
    sprite->callback = sub_8130A94;
}

static void sub_8130A94(struct Sprite *sprite)
{
    if (++sprite->data[0] >= sprite->data[1])
    {
        sprite->data[0] = 0;
        sprite->data[2] = (sprite->data[2] + 1) & 1;
        sprite->invisible = sprite->data[2];
        if (sprite->data[2] && --sprite->data[3] == 0)
            DestroyAnimSprite(sprite);
    }
}

void sub_8130AEC(struct Sprite *sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->oam.matrixNum |= 0x8;
        sprite->pos1.x = 100;
        sprite->data[7] = 1;
    }
    else
    {
        sprite->pos1.x = 140;
        sprite->data[7] = -1;
    }

    sprite->pos1.y = 56;
    sprite->callback = sub_8130B38;
}

static void sub_8130B38(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->pos1.y -= sprite->data[7] * 2;
        if (sprite->data[1] & 1)
            sprite->pos1.x -= sprite->data[7] * 2;

        if (++sprite->data[1] == 9)
        {
            sprite->data[1] = 0;
            sprite->data[0]++;
        }
        break;
    case 1:
        if (++sprite->data[1] == 4)
        {
            sprite->data[1] = 0;
            sprite->data[0]++;
        }
        break;
    case 2:
        sprite->data[1]++;
        sprite->pos1.y += sprite->data[7] * 3;
        sprite->pos2.x = sprite->data[7] * (gSineTable[sprite->data[1] * 10] >> 3);
        if (sprite->data[1] == 12)
        {
            sprite->data[1] = 0;
            sprite->data[0]++;
        }
        break;
    case 3:
        if (++sprite->data[1] == 2)
        {
            sprite->data[1] = 0;
            sprite->data[0]++;
        }
        break;
    case 4:
        sprite->data[1]++;
        sprite->pos1.y -= sprite->data[7] * 3;
        sprite->pos2.x = sprite->data[7] * (gSineTable[sprite->data[1] * 10] >> 3);
        if (sprite->data[1] == 12)
            sprite->data[0]++;
        break;
    case 5:
        sprite->data[1]++;
        sprite->pos1.y += sprite->data[7] * 3;
        sprite->pos2.x = sprite->data[7] * (gSineTable[sprite->data[1] * 10] >> 3);
        if (sprite->data[1] == 15)
            sprite->oam.tileNum += 16;
        
        if (sprite->data[1] == 18)
        {
            sprite->data[1] = 0;
            sprite->data[0]++;
        }
        break;
    case 6:
        sprite->pos1.x += sprite->data[7] * 6;
        if (++sprite->data[1] == 9)
        {
            sprite->data[1] = 0;
            sprite->data[0]++;
        }
        break;
    case 7:
        sprite->pos1.x += sprite->data[7] * 2;
        if (++sprite->data[1] == 1)
        {
            sprite->data[1] = 0;
            sprite->data[0]++;
        }
        break;
    case 8:
        sprite->pos1.x -= sprite->data[7] * 3;
        if (++sprite->data[1] == 5)
            DestroyAnimSprite(sprite);
        break;
    }
}

void sub_8130D20(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    task->data[15] = GetAnimBattlerSpriteId(0);
    if (!IsContest())
    {
        if (IsDoubleBattle() == TRUE)
        {
            int x = GetBattlerSpriteCoord(gAnimBankAttacker, 0);
            int y = GetBattlerSpriteCoord(gAnimBankAttacker ^ 2, 0);
            if (x > y)
                task->data[14] = 1;
            else
                task->data[14] = -1;
        }
        else
        {
            if (GetBattlerSide(gAnimBankAttacker) == B_SIDE_PLAYER)
                task->data[14] = -1;
            else
                task->data[14] = 1;
        }
    }
    else
    {
        task->data[14] = 1;
    }

    task->func = sub_8130DBC;
}

static void sub_8130DBC(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        if (++task->data[1] == 13)
        {
            task->data[1] = 0;
            task->data[0]++;
        }
        break;
    case 1:
        gSprites[task->data[15]].pos2.x -= task->data[14] * 3;
        if (++task->data[1] == 6)
        {
            task->data[1] = 0;
            task->data[0]++;
        }
        break;
    case 2:
        gSprites[task->data[15]].pos2.x += task->data[14] * 3;
        if (++task->data[1] == 6)
        {
            task->data[1] = 0;
            task->data[0]++;
        }
        break;
    case 3:
        if (++task->data[1] == 2)
        {
            task->data[1] = 0;
            if (task->data[2] == 0)
            {
                task->data[2]++;
                task->data[0] = 1;
            }
            else
            {
                task->data[0]++;
            }
        }
        break;
    case 4:
        gSprites[task->data[15]].pos2.x += task->data[14];
        if (++task->data[1] == 3)
        {
            task->data[1] = 0;
            task->data[0]++;
        }
        break;
    case 5:
        if (++task->data[1] == 6)
        {
            task->data[1] = 0;
            task->data[0]++;
        }
        break;
    case 6:
        gSprites[task->data[15]].pos2.x -= task->data[14] * 4;
        if (++task->data[1] == 5)
        {
            task->data[1] = 0;
            task->data[0]++;
        }
        break;
    case 7:
        gSprites[task->data[15]].pos2.x += task->data[14] * 4;
        if (++task->data[1] == 5)
        {
            task->data[1] = 0;
            task->data[0]++;
        }
        break;
    case 8:
        gSprites[task->data[15]].pos2.x = 0;
        DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_8130F5C(struct Sprite *sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        InitAnimSpritePos(sprite, 1);
        sprite->data[7] = gAnimBankAttacker;
    }
    else
    {
        sprite->data[7] = gAnimBankTarget;
    }

    if (GetBattlerSide(sprite->data[7]) == B_SIDE_OPPONENT)
        sprite->oam.matrixNum = 8;

    sprite->oam.priority = sub_8079ED4(sprite->data[7]);
    sprite->oam.objMode = ST_OAM_OBJ_BLEND;
    sprite->callback = sub_8130FE0;
}

static void sub_8130FE0(struct Sprite *sprite)
{
    u16 x, y;

    switch (sprite->data[5])
    {
    case 0:
        switch (sprite->data[6])
        {
        default:
            sprite->data[6] = 0;
        case 0:
        case 4:
            x = sub_807A100(sprite->data[7], 5) - 4;
            y = sub_807A100(sprite->data[7], 3) - 4;
            break;
        case 1:
            x = sub_807A100(sprite->data[7], 5) - 4;
            y = sub_807A100(sprite->data[7], 2) + 4;
            break;
        case 2:
            x = sub_807A100(sprite->data[7], 4) + 4;
            y = sub_807A100(sprite->data[7], 3) - 4;
            break;
        case 3:
            x = sub_807A100(sprite->data[7], 4) + 4;
            y = sub_807A100(sprite->data[7], 2) - 4;
            break;
        case 5:
            x = GetBattlerSpriteCoord(sprite->data[7], 2);
            y = GetBattlerSpriteCoord(sprite->data[7], 3);
            break;
        }

        if (sprite->data[6] == 4)
            sprite->data[0] = 24;
        else if (sprite->data[6] == 5)
            sprite->data[0] = 6;
        else
            sprite->data[0] = 12;

        sprite->data[1] = sprite->pos1.x;
        sprite->data[2] = x;
        sprite->data[3] = sprite->pos1.y;
        sprite->data[4] = y;
        InitAnimLinearTranslation(sprite);
        sprite->data[5]++;
        break;
    case 1:
        if (TranslateAnimLinear(sprite))
        {
            switch (sprite->data[6])
            {
            default:
                sprite->pos1.x += sprite->pos2.x;
                sprite->pos1.y += sprite->pos2.y;
                sprite->pos2.y = 0;
                sprite->pos2.x = 0;
                sprite->data[0] = 0;
                sprite->data[5]++;
                sprite->data[6]++;
                break;
            case 4:
                sprite->pos1.x += sprite->pos2.x;
                sprite->pos1.y += sprite->pos2.y;
                sprite->pos2.y = 0;
                sprite->pos2.x = 0;
                sprite->data[5] = 0;
                sprite->data[6]++;
                break;
            case 5:
                sprite->data[0] = 0;
                sprite->data[1] = 16;
                sprite->data[2] = 0;
                sprite->data[5] = 3;
                break;
            }
        }
        break;
    case 2:
        if (++sprite->data[0] == 4)
            sprite->data[5] = 0;
        break;
    case 3:
        if (!(sprite->data[0] & 1))
            sprite->data[1]--;
        else
            sprite->data[2]++;

        REG_BLDALPHA = (sprite->data[2] << 8) | sprite->data[1];
        if (++sprite->data[0] == 32)
        {
            sprite->invisible = 1;
            sprite->data[5]++;
        }
        break;
    case 4:
        DestroyAnimSprite(sprite);
        break;
    }
}

static void sub_81311E4(struct Sprite *sprite)
{
    sprite->pos2.x = ((sprite->data[2] - sprite->data[0]) * sprite->data[5]) / sprite->data[4];
    sprite->pos2.y = ((sprite->data[3] - sprite->data[1]) * sprite->data[5]) / sprite->data[4];
    if (!(sprite->data[5] & 1))
    {
        CreateSprite(
            &gSpriteTemplate_8402500,
            sprite->pos1.x + sprite->pos2.x,
            sprite->pos1.y + sprite->pos2.y, 5);
    }
    
    if (sprite->data[5] == sprite->data[4])
        DestroyAnimSprite(sprite);

    sprite->data[5]++;
}

void sub_8131264(struct Sprite *sprite)
{
    GetBattlerSpriteCoord(gAnimBankTarget, 2); // unused local variable
    GetBattlerSpriteCoord(gAnimBankTarget, 3); // unused local variable

    if (GetBattlerSide(gAnimBankTarget) == B_SIDE_PLAYER || IsContest())
    {
        sprite->data[0] = sprite->pos1.x - gBattleAnimArgs[0];
        sprite->data[2] = sprite->pos1.x - gBattleAnimArgs[2];
    }
    else
    {
        sprite->data[0] = sprite->pos1.x + gBattleAnimArgs[0];
        sprite->data[2] = sprite->pos1.x + gBattleAnimArgs[2];
    }

    sprite->data[1] = sprite->pos1.y + gBattleAnimArgs[1];
    sprite->data[3] = sprite->pos1.y + gBattleAnimArgs[3];
    sprite->data[4] = gBattleAnimArgs[4];
    sprite->pos1.x = sprite->data[0];
    sprite->pos1.y = sprite->data[1];
    sprite->callback = sub_81311E4;
}

void sub_81312E4(u8 taskId)
{
    int i;
    u8 spriteId = GetAnimBattlerSpriteId(0);

    if (gTasks[taskId].data[0] == 0)
    {
        sub_8078E70(spriteId, 0);
        gTasks[taskId].data[1] = 0x100;
        gTasks[taskId].data[2] = 0x100;
        gTasks[taskId].data[0]++;
    }
    else if (gTasks[taskId].data[0] == 1)
    {
        gTasks[taskId].data[1] += 0x60;
        gTasks[taskId].data[2] -= 0xD;
        obj_id_set_rotscale(spriteId, gTasks[taskId].data[1], gTasks[taskId].data[2], 0);
        if (++gTasks[taskId].data[3] == 9)
        {
            gTasks[taskId].data[3] = 0;
            sub_8078F40(spriteId);
            gSprites[spriteId].invisible = 1;
            gTasks[taskId].data[0]++;
        }
    }
    else
    {
        refresh_graphics_maybe(gAnimBankAttacker, 0, spriteId);
        if (IsContest())
        {
            gSprites[gBankSpriteIds[gAnimBankAttacker]].affineAnims = gSpriteAffineAnimTable_81E7C18;
            StartSpriteAffineAnim(&gSprites[gBankSpriteIds[gAnimBankAttacker]], 0);
        }

        for (i = 0; i < 16; i++)
            gTasks[taskId].data[i] = 0;
        
        gTasks[taskId].func = sub_8131408;
    }
}

static void sub_8131408(u8 taskId)
{
    u8 spriteId = GetAnimBattlerSpriteId(0);

    switch (gTasks[taskId].data[0])
    {
    case 0:
        gSprites[spriteId].pos2.y = -200;
        gSprites[spriteId].pos2.x = 200;
        gSprites[spriteId].invisible = 0;
        gTasks[taskId].data[10] = 0;
        gTasks[taskId].data[0]++;
        break;
    case 1:
        gTasks[taskId].data[10] += 112;
        gSprites[spriteId].pos2.y += gTasks[taskId].data[10] >> 8;
        if (gSprites[spriteId].pos1.y + gSprites[spriteId].pos2.y >= -32)
            gSprites[spriteId].pos2.x = 0;

        if (gSprites[spriteId].pos2.y > 0)
            gSprites[spriteId].pos2.y = 0;

        if (gSprites[spriteId].pos2.y == 0)
        {
            PlaySE12WithPanning(SE_W145B, BattleAnimAdjustPanning(-64));
            gTasks[taskId].data[10] -= 0x800;
            gTasks[taskId].data[0]++;
        }
        break;
    case 2:
        gTasks[taskId].data[10] -= 112;
        if (gTasks[taskId].data[10] < 0)
            gTasks[taskId].data[10] = 0;

        gSprites[spriteId].pos2.y -= gTasks[taskId].data[10] >> 8;
        if (gTasks[taskId].data[10] == 0)
            gTasks[taskId].data[0]++;
        break;
    case 3:
        gTasks[taskId].data[10] += 112;
        gSprites[spriteId].pos2.y += gTasks[taskId].data[10] >> 8;
        if (gSprites[spriteId].pos2.y > 0)
            gSprites[spriteId].pos2.y = 0;

        if (gSprites[spriteId].pos2.y == 0)
        {
            PlaySE12WithPanning(SE_W145B, BattleAnimAdjustPanning(-64));
            DestroyAnimVisualTask(taskId);
        }
        break;
    }
}

void sub_8131564(struct Sprite *sprite)
{
    s16 y2;

    if (GetBattlerSide(gAnimBankTarget) == B_SIDE_PLAYER)
    {
        sprite->subpriority = sub_8079E90(gAnimBankTarget) - 2;
        y2 = -144;
    }
    else
    {
        sprite->subpriority = sub_8079E90(gAnimBankTarget) + 2;
        y2 = -96;
    }

    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankTarget, 3);
    sprite->pos2.y = y2;
    sprite->callback = sub_81315C8;
}

static void sub_81315C8(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->pos2.y += 10;
        if (sprite->pos2.y >= 0)
        {
            PlaySE12WithPanning(SE_W166, BattleAnimAdjustPanning(63));
            sprite->pos2.y = 0;
            sprite->data[0]++;
        }
        break;
    case 1:
        sprite->data[1] += 4;
        sprite->pos2.y = -(gSineTable[sprite->data[1]] >> 3);
        if (sprite->data[1] > 127)
        {
            PlaySE12WithPanning(SE_W166, BattleAnimAdjustPanning(63));
            sprite->data[1] = 0;
            sprite->pos2.y = 0;
            sprite->data[0]++;
        }
        break;
    case 2:
        sprite->data[1] += 6;
        sprite->pos2.y = -(gSineTable[sprite->data[1]] >> 4);
        if (sprite->data[1] > 127)
        {
            sprite->data[1] = 0;
            sprite->pos2.y = 0;
            sprite->data[0]++;
        }
        break;
    case 3:
        if (++sprite->data[1] > 8)
        {
            PlaySE12WithPanning(SE_W043, BattleAnimAdjustPanning(63));
            sprite->data[1] = 0;
            sprite->data[0]++;
        }
        break;
    case 4:
        if (++sprite->data[1] > 8)
        {
            sprite->data[1] = 0;
            sprite->data[2]++;
            sprite->invisible = sprite->data[2] & 1;
            if (sprite->data[2] == 7)
                DestroyAnimSprite(sprite);
        }
        break;
    }
}

void sub_81316F8(u8 taskId)
{
    s16 spriteId1, spriteId2;

    if (IsContest())
    {
        DestroyAnimVisualTask(taskId);
        return;
    }

    spriteId1 = duplicate_obj_of_side_rel2move_in_transparent_mode(1);
    if (spriteId1 < 0)
    {
        DestroyAnimVisualTask(taskId);
        return;
    }

    spriteId2 = duplicate_obj_of_side_rel2move_in_transparent_mode(1);
    if (spriteId2 < 0)
    {
        obj_delete_but_dont_free_vram(&gSprites[spriteId1]);
        DestroyAnimVisualTask(taskId);
        return;
    }

    gSprites[spriteId2].pos2.x += 24;
    gSprites[spriteId1].pos2.x -= 24;
    gSprites[spriteId2].data[0] = 0;
    gSprites[spriteId1].data[0] = 0;
    gSprites[spriteId2].data[1] = 0;
    gSprites[spriteId1].data[1] = 0;
    gSprites[spriteId2].data[2] = 0;
    gSprites[spriteId1].data[2] = 0;
    gSprites[spriteId2].data[3] = 16;
    gSprites[spriteId1].data[3] = -16;
    gSprites[spriteId2].data[4] = 0;
    gSprites[spriteId1].data[4] = 128;
    gSprites[spriteId2].data[5] = 24;
    gSprites[spriteId1].data[5] = 24;
    gSprites[spriteId2].data[6] = taskId;
    gSprites[spriteId1].data[6] = taskId;
    gSprites[spriteId2].data[7] = 0;
    gSprites[spriteId1].data[7] = 0;
    gTasks[taskId].data[0] = 2;
    gSprites[spriteId2].invisible = 0;
    gSprites[spriteId1].invisible = 1;
    gSprites[spriteId2].oam.objMode = ST_OAM_OBJ_NORMAL;
    gSprites[spriteId1].oam.objMode = ST_OAM_OBJ_NORMAL;
    gSprites[spriteId2].callback = sub_8131838;
    gSprites[spriteId1].callback = sub_8131838;
    gTasks[taskId].func = sub_8131810;
}

static void sub_8131810(u8 taskId)
{
    if (gTasks[taskId].data[0] == 0)
        DestroyAnimVisualTask(taskId);
}

static void sub_8131838(struct Sprite *sprite)
{
    if (++sprite->data[1] > 1)
    {
        sprite->data[1] = 0;
        sprite->invisible ^= 1;
    }

    sprite->data[4] = (sprite->data[4] + sprite->data[3]) & 0xFF;
    sprite->pos2.x = Cos(sprite->data[4], sprite->data[5]);
    switch (sprite->data[0])
    {
    case 0:
        if (++sprite->data[2] == 60)
        {
            sprite->data[2] = 0;
            sprite->data[0]++;
        }
        break;
    case 1:
        if (++sprite->data[2] > 0)
        {
            sprite->data[2] = 0;
            sprite->data[5] -= 2;
            if (sprite->data[5] < 0)
            {
                gTasks[sprite->data[6]].data[sprite->data[7]]--;
                obj_delete_but_dont_free_vram(sprite);
            }
        }
        break;
    }
}
