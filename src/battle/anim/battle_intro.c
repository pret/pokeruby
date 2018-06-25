#include "global.h"
#include "constants/battle_constants.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_anim_80CA710.h"
#include "data2.h"
#include "ewram.h"
#include "main.h"
#include "rom_8077ABC.h"
#include "scanline_effect.h"
#include "task.h"
#include "trig.h"

extern u16 gBattleTypeFlags;
extern u16 gUnknown_02024DE8;
extern u8 gBattleMonForms[];

extern void sub_800FE20(struct Sprite *);

static void BattleIntroTask_ScrollScenery(u8);
static void BattleIntroTask_FadeScenery(u8);
static void BattleIntroTask_ScrollAndFadeScenery(u8);
static void BattleIntroTask_80E4C34(u8);

static const TaskFunc sBattleIntroTaskFuncs[] =
{
    BattleIntroTask_ScrollScenery,
    BattleIntroTask_ScrollScenery,
    BattleIntroTask_FadeScenery,
    BattleIntroTask_FadeScenery,
    BattleIntroTask_FadeScenery,
    BattleIntroTask_ScrollScenery,
    BattleIntroTask_ScrollScenery,
    BattleIntroTask_ScrollScenery,
    BattleIntroTask_ScrollAndFadeScenery,
    BattleIntroTask_ScrollAndFadeScenery,
};

#define tState data[0]
#define tBgXOffset data[2]
#define tFramesUntilBg1Slide data[3]

void StartBattleIntroAnim(u8 a)
{
    u8 taskId;

    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        taskId = CreateTask(BattleIntroTask_80E4C34, 0);
    }
    else if ((gBattleTypeFlags & BATTLE_TYPE_KYOGRE_GROUDON) && gGameVersion != VERSION_RUBY)
    {
        a = 3;
        taskId = CreateTask(BattleIntroTask_FadeScenery, 0);
    }
    else
    {
        taskId = CreateTask(sBattleIntroTaskFuncs[a], 0);
    }

    gTasks[taskId].tState = 0;
    gTasks[taskId].data[1] = a;
    gTasks[taskId].tBgXOffset = 0;
    gTasks[taskId].tFramesUntilBg1Slide = 0;
    gTasks[taskId].data[4] = 0;
    gTasks[taskId].data[5] = 0;
    gTasks[taskId].data[6] = 0;
}

static void EndBattleIntroTask(u8 taskId)
{
    DestroyTask(taskId);
    gBattle_BG1_X = 0;
    gBattle_BG1_Y = 0;
    gBattle_BG2_X = 0;
    gBattle_BG2_Y = 0;
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    REG_BLDY = 0;
    REG_WININ = 0x3F3F;
    REG_WINOUT = 0x3F3F;
}

static void BattleIntroTask_ScrollScenery(u8 taskId)
{
    s32 i;

    gBattle_BG1_X += 6;

    switch (gTasks[taskId].tState)
    {
    case 0:
        if (gBattleTypeFlags & BATTLE_TYPE_LINK)
        {
            gTasks[taskId].tBgXOffset = 16;
            gTasks[taskId].tState++;
        }
        else
        {
            gTasks[taskId].tBgXOffset = 1;
            gTasks[taskId].tState++;
        }
        break;
    case 1:
        gTasks[taskId].tBgXOffset--;
        if (gTasks[taskId].tBgXOffset == 0)
        {
            gTasks[taskId].tState++;
            REG_WININ = 0x3F;
        }
        break;
    case 2:
        // Open up the window
        gBattle_WIN0V -= WIN_RANGE(1, 0);  // decrement min Y
        gBattle_WIN0V += WIN_RANGE(0, 1);  // increment max Y
        if ((gBattle_WIN0V & 0xFF00) == 0x3000)
        {
            gTasks[taskId].tState++;
            gTasks[taskId].tBgXOffset = DISPLAY_WIDTH;
            gTasks[taskId].tFramesUntilBg1Slide = 32;
            gUnknown_02024DE8 &= ~1;
        }
        break;
    case 3:
        if (gTasks[taskId].tFramesUntilBg1Slide != 0)
        {
            gTasks[taskId].tFramesUntilBg1Slide--;
        }
        else
        {
            if (gTasks[taskId].data[1] == 1)
            {
                if (gBattle_BG1_Y != 0xFFB0)
                    gBattle_BG1_Y -= 2;
            }
            else
            {
                if (gBattle_BG1_Y != 0xFFC8)
                    gBattle_BG1_Y -= 1;
            }
        }

        if ((gBattle_WIN0V & 0xFF00) != 0)
            gBattle_WIN0V -= 1020;

        if (gTasks[taskId].tBgXOffset != 0)
            gTasks[taskId].tBgXOffset -= 2;

        // Slide in the top half of the BG from the left
        for (i = 0; i < DISPLAY_HEIGHT / 2; i++)
            gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][i] = gTasks[taskId].tBgXOffset;
        // Slide in the bottom half of the BG from the right
        for (; i < DISPLAY_HEIGHT; i++)
            gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][i] = -gTasks[taskId].tBgXOffset;

        if (gTasks[taskId].tBgXOffset == 0)
        {
            gScanlineEffect.state = 3;
            gTasks[taskId].tState++;
            CpuFill32(0, (void *)(VRAM + 0xE000), 0x800);
            REG_BG1CNT = 0x9C00;
            REG_BG2CNT = 0x5E00;
        }
        break;
    case 4:
        EndBattleIntroTask(taskId);
        break;
    }
}

static void BattleIntroTask_FadeScenery(u8 taskId)
{
    s32 i;

    switch (gTasks[taskId].data[1])
    {
    case 2:
    case 4:
        gBattle_BG1_X += 8;
        break;
    case 3:
        gBattle_BG1_X += 6;
        break;
    }

    if (gTasks[taskId].data[1] == 4)
    {
        gBattle_BG1_Y = Cos2(gTasks[taskId].data[6]) / 512 - 8;
        if (gTasks[taskId].data[6] < 0xB4)
            gTasks[taskId].data[6] += 4;
        else
            gTasks[taskId].data[6] += 6;
        if (gTasks[taskId].data[6] == 0x168)
            gTasks[taskId].data[6] = 0;
    }

    switch (gTasks[taskId].tState)
    {
    case 0:
        gTasks[taskId].data[4] = 16;
        if (gBattleTypeFlags & BATTLE_TYPE_LINK)
        {
            gTasks[taskId].tBgXOffset = 16;
            gTasks[taskId].tState++;
        }
        else
        {
            gTasks[taskId].tBgXOffset = 1;
            gTasks[taskId].tState++;
        }
        break;
    case 1:
        gTasks[taskId].tBgXOffset--;
        if (gTasks[taskId].tBgXOffset == 0)
        {
            gTasks[taskId].tState++;
            REG_WININ = 0x3F;
        }
        break;
    case 2:
        // Open up window
        gBattle_WIN0V -= WIN_RANGE(1, 0);  // decrement min Y
        gBattle_WIN0V += WIN_RANGE(0, 1);  // increment max Y
        if ((gBattle_WIN0V & 0xFF00) == 0x3000)
        {
            gTasks[taskId].tState++;
            gTasks[taskId].tBgXOffset = DISPLAY_WIDTH;
            gTasks[taskId].tFramesUntilBg1Slide = 32;
            gTasks[taskId].data[5] = 1;
            gUnknown_02024DE8 &= ~1;
        }
        break;
    case 3:
        if (gTasks[taskId].tFramesUntilBg1Slide != 0)
        {
            gTasks[taskId].tFramesUntilBg1Slide--;
            if (gTasks[taskId].tFramesUntilBg1Slide == 0)
            {
                REG_BLDCNT = 0x1842;
                REG_BLDALPHA = 0xF;
                REG_BLDY = 0;
            }
        }
        else
        {
            if ((gTasks[taskId].data[4] & 0x1F) && --gTasks[taskId].data[5] == 0)
            {
                gTasks[taskId].data[4] += 255;
                gTasks[taskId].data[5] = 4;
            }
        }

        if ((gBattle_WIN0V & 0xFF00) != 0)
            gBattle_WIN0V -= 1020;

        if (gTasks[taskId].tBgXOffset != 0)
            gTasks[taskId].tBgXOffset -= 2;

        // Slide in the top half of the BG from the left
        for (i = 0; i < DISPLAY_HEIGHT / 2; i++)
            gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][i] = gTasks[taskId].tBgXOffset;
        // Slide in the bottom half of the BG from the right
        for (; i < DISPLAY_HEIGHT; i++)
            gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][i] = -gTasks[taskId].tBgXOffset;

        if (gTasks[taskId].tBgXOffset == 0)
        {
            gScanlineEffect.state = 3;
            gTasks[taskId].tState++;
            CpuFill32(0, (void *)(VRAM + 0xE000), 0x800);
            REG_BG1CNT = 0x9C00;
            REG_BG2CNT = 0x5E00;
        }
        break;
    case 4:
        EndBattleIntroTask(taskId);
        break;
    }

    if (gTasks[taskId].tState != 4)
        REG_BLDALPHA = gTasks[taskId].data[4];
}

static void BattleIntroTask_ScrollAndFadeScenery(u8 taskId)
{
    s32 i;

    gBattle_BG1_X += 8;

    switch (gTasks[taskId].tState)
    {
    case 0:
        REG_BLDCNT = 0x1842;
        REG_BLDALPHA = 0x0808;
        REG_BLDY = 0;
        gTasks[taskId].data[4] = 0x0808;
        if (gBattleTypeFlags & BATTLE_TYPE_LINK)
        {
            gTasks[taskId].tBgXOffset = 16;
            gTasks[taskId].tState++;
        }
        else
        {
            gTasks[taskId].tBgXOffset = 1;
            gTasks[taskId].tState++;
        }
        break;
    case 1:
        gTasks[taskId].tBgXOffset--;
        if (gTasks[taskId].tBgXOffset == 0)
        {
            gTasks[taskId].tState++;
            REG_WININ = 0x3F;
        }
        break;
    case 2:
        // Open up window
        gBattle_WIN0V -= WIN_RANGE(1, 0);  // decrement min Y
        gBattle_WIN0V += WIN_RANGE(0, 1);  // increment max Y
        if ((gBattle_WIN0V & 0xFF00) == 0x3000)
        {
            gTasks[taskId].tState++;
            gTasks[taskId].tBgXOffset = DISPLAY_WIDTH;
            gTasks[taskId].tFramesUntilBg1Slide = 32;
            gTasks[taskId].data[5] = 1;
            gUnknown_02024DE8 &= ~1;
        }
        break;
    case 3:
        if (gTasks[taskId].tFramesUntilBg1Slide != 0)
        {
            gTasks[taskId].tFramesUntilBg1Slide--;
        }
        else
        {
            if ((gTasks[taskId].data[4] & 0xF) && --gTasks[taskId].data[5] == 0)
            {
                gTasks[taskId].data[4] += 255;
                gTasks[taskId].data[5] = 6;
            }
        }

        if ((gBattle_WIN0V & 0xFF00) != 0)
            gBattle_WIN0V -= 1020;

        if (gTasks[taskId].tBgXOffset != 0)
            gTasks[taskId].tBgXOffset -= 2;

        // Slide in the top half of the BG from the left
        for (i = 0; i < DISPLAY_HEIGHT / 2; i++)
            gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][i] = gTasks[taskId].tBgXOffset;
        // Slide in the bottom half of the BG from the right
        for (; i < DISPLAY_HEIGHT; i++)
            gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][i] = -gTasks[taskId].tBgXOffset;

        if (gTasks[taskId].tBgXOffset == 0)
        {
            gScanlineEffect.state = 3;
            gTasks[taskId].tState++;
            CpuFill32(0, (void *)(VRAM + 0xE000), 0x800);
            REG_BG1CNT = 0x9C00;
            REG_BG2CNT = 0x5E00;
        }
        break;
    case 4:
        EndBattleIntroTask(taskId);
        break;
    }

    if (gTasks[taskId].tState != 4)
        REG_BLDALPHA = gTasks[taskId].data[4];
}

// Seems to only be used for link battles.
static void BattleIntroTask_80E4C34(u8 taskId)
{
    s32 i;

    if (gTasks[taskId].tState > 1 && gTasks[taskId].data[4] == 0)
    {
        if ((gBattle_BG1_X & 0x8000) || gBattle_BG1_X < 80)  // hmm...
        {
            gBattle_BG1_X += 3;
            gBattle_BG2_X -= 3;
        }
        else
        {
            CpuFill32(0, (void *)(VRAM + 0xE000), 0x800);
            CpuFill32(0, (void *)(VRAM + 0xF000), 0x800);
            gTasks[taskId].data[4] = 1;
        }
    }

    switch (gTasks[taskId].tState)
    {
    case 0:
        gTasks[taskId].tBgXOffset = 16;
        gTasks[taskId].tState++;
        break;
    case 1:
        gTasks[taskId].tBgXOffset--;
        if (gTasks[taskId].tBgXOffset == 0)
        {
            gTasks[taskId].tState++;
            gSprites[ewram1608A].oam.objMode = 2;
            gSprites[ewram1608A].callback = sub_800FE20;
            gSprites[ewram1608B].oam.objMode = 2;
            gSprites[ewram1608B].callback = sub_800FE20;
            REG_WININ = 0x3F;
            REG_WINOUT = 0x3F06;
        }
        break;
    case 2:
        // Open up window
        gBattle_WIN0V -= WIN_RANGE(1, 0);  // decrement min Y
        gBattle_WIN0V += WIN_RANGE(0, 1);  // increment max Y
        if ((gBattle_WIN0V & 0xFF00) == 0x3000)
        {
            gTasks[taskId].tState++;
            gTasks[taskId].tBgXOffset = DISPLAY_WIDTH;
            gTasks[taskId].tFramesUntilBg1Slide = 32;
            gUnknown_02024DE8 &= ~1;
        }
        break;
    case 3:
        if ((gBattle_WIN0V & 0xFF00) != 0)
            gBattle_WIN0V -= 1020;

        if (gTasks[taskId].tBgXOffset != 0)
            gTasks[taskId].tBgXOffset -= 2;

        // Slide in the top half of the BG from the left
        for (i = 0; i < DISPLAY_HEIGHT / 2; i++)
            gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][i] = gTasks[taskId].tBgXOffset;
        // Slide in the bottom half of the BG from the right
        for (; i < DISPLAY_HEIGHT; i++)
            gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][i] = -gTasks[taskId].tBgXOffset;

        if (gTasks[taskId].tBgXOffset == 0)
        {
            gScanlineEffect.state = 3;
            gTasks[taskId].tState++;
            REG_BG1CNT = 0x9C00;
            REG_BG2CNT = 0x5E00;
        }
        break;
    case 4:
        EndBattleIntroTask(taskId);
        break;
    }
}

void unref_sub_80E4EC8(u8 a, u8 b, u8 c, u8 d)
{
    sub_80E4EF8(a, b, c, d, 0x4000, 30, 1);
}

// draws some 8x8 tilemap
void sub_80E4EF8(u8 left, u8 top, u8 c, u8 paletteNum, u16 e, u8 bgMap, u8 g)
{
    u32 tileNum;
    s32 x;
    s32 y;
    u8 bank = GetBattlerAtPosition(c);

    DmaCopy16(3, gUnknown_081FAF4C[c] + gBattleMonForms[bank] * 0x800, (void *)(VRAM + e), 0x800);
    tileNum = e / 32 - g * 512;
    for (y = top; y < top + 8; y++)
    {
        for (x = left; x < left + 8; x++)
        {
            *(u16 *)(VRAM + x * 2 + bgMap * 0x800 + y * 64) = tileNum | (paletteNum << 12);
            tileNum++;
        }
    }
}

void unref_sub_80E4FDC(u8 left, u8 top, u8 c, u8 form, u8 paletteNum, u16 f, u8 bgMap, u8 h)
{
    u32 tileNum;
    s32 x;
    s32 y;

    DmaCopy16(3, gUnknown_081FAF4C[c] + form * 0x800, (void *)(VRAM + f), 0x800);
    tileNum = f / 32 - h * 512;
    for (y = top; y < top + 8; y++)
    {
        for (x = left; x < left + 8; x++)
        {
            *(u16 *)(VRAM + x * 2 + bgMap * 0x800 + y * 64) = tileNum | (paletteNum << 12);
            tileNum++;
        }
    }
}
