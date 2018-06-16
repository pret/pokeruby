#include "global.h"
#include "event_data.h"
#include "field_camera.h"
#include "menu.h"
#include "palette.h"
#include "overworld.h"
#include "script.h"
#include "task.h"
#include "text.h"
#include "scanline_effect.h"

const static u16 sFlashLevelPixelRadii[] = { 200, 72, 56, 40, 24, 0 };

const s32 gMaxFlashLevel = 4;

const static struct ScanlineEffectParams sFlashEffectParams =
{
    (void *)REG_ADDR_WIN0H,
    ((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_DEST_RELOAD) << 16) | 1,
    1
};

static void SetFlashScanlineEffectWindowBoundary(u16 *dest, u32 y, s32 left, s32 right)
{
    if (y <= 160)
    {
        if (left < 0)
            left = 0;
        if (left > 255)
            left = 255;
        if (right < 0)
            right = 0;
        if (right > 255)
            right = 255;
        dest[y] = (left << 8) | right;
    }
}

static void SetFlashScanlineEffectWindowBoundaries(u16 *dest, s32 centerX, s32 centerY, s32 radius)
{
    s32 r = radius;
    s32 v2 = radius;
    s32 v3 = 0;
    while (r >= v3)
    {
        SetFlashScanlineEffectWindowBoundary(dest, centerY - v3, centerX - r, centerX + r);
        SetFlashScanlineEffectWindowBoundary(dest, centerY + v3, centerX - r, centerX + r);
        SetFlashScanlineEffectWindowBoundary(dest, centerY - r, centerX - v3, centerX + v3);
        SetFlashScanlineEffectWindowBoundary(dest, centerY + r, centerX - v3, centerX + v3);
        v2 -= (v3 * 2) - 1;
        v3++;
        if (v2 < 0)
        {
            v2 += 2 * (r - 1);
            r--;
        }
    }
}

#define tFlashCenterX        data[1]
#define tFlashCenterY        data[2]
#define tCurFlashRadius      data[3]
#define tDestFlashRadius     data[4]
#define tFlashRadiusDelta    data[5]
#define tClearScanlineEffect data[6]

static void UpdateFlashLevelEffect(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        SetFlashScanlineEffectWindowBoundaries(gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer], tFlashCenterX, tFlashCenterY, tCurFlashRadius);
        data[0] = 1;
        break;
    case 1:
        SetFlashScanlineEffectWindowBoundaries(gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer], tFlashCenterX, tFlashCenterY, tCurFlashRadius);
        data[0] = 0;
        tCurFlashRadius += tFlashRadiusDelta;
        if (tCurFlashRadius > tDestFlashRadius)
        {
            if (tClearScanlineEffect == 1)
            {
                ScanlineEffect_Stop();
                data[0] = 2;
            }
            else
            {
                DestroyTask(taskId);
            }
        }
        break;
    case 2:
        ScanlineEffect_Clear();
        DestroyTask(taskId);
        break;
    }
}

static void sub_80814E8(u8 taskId)
{
    if (!FuncIsActiveTask(UpdateFlashLevelEffect))
    {
        EnableBothScriptContexts();
        DestroyTask(taskId);
    }
}

static void sub_8081510(void)
{
    if (!FuncIsActiveTask(sub_80814E8))
        CreateTask(sub_80814E8, 80);
}

static u8 sub_8081534(s32 centerX, s32 centerY, s32 initialFlashRadius, s32 destFlashRadius, s32 clearScanlineEffect, u8 delta)
{
    u8 taskId = CreateTask(UpdateFlashLevelEffect, 80);
    s16 *data = gTasks[taskId].data;

    tCurFlashRadius = initialFlashRadius;
    tDestFlashRadius = destFlashRadius;
    tFlashCenterX = centerX;
    tFlashCenterY = centerY;
    tClearScanlineEffect = clearScanlineEffect;

    if (initialFlashRadius < destFlashRadius)
        tFlashRadiusDelta = delta;
    else
        tFlashRadiusDelta = -delta;

    return taskId;
}

#undef tCurFlashRadius
#undef tDestFlashRadius
#undef tFlashRadiusDelta
#undef tClearScanlineEffect

void sub_8081594(u8 flashLevel)
{
    u8 curFlashLevel = Overworld_GetFlashLevel();
    u8 value = 0;
    if (!flashLevel)
        value = 1;
    sub_8081534(120, 80, sFlashLevelPixelRadii[curFlashLevel], sFlashLevelPixelRadii[flashLevel], value, 1);
    sub_8081510();
    ScriptContext2_Enable();
}

void WriteFlashScanlineEffectBuffer(u8 flashLevel)
{
    if (flashLevel)
    {
        SetFlashScanlineEffectWindowBoundaries(&gScanlineEffectRegBuffers[0][0], 120, 80, sFlashLevelPixelRadii[flashLevel]);
        CpuFastSet(&gScanlineEffectRegBuffers[0], &gScanlineEffectRegBuffers[1], 480);
    }
}

static void sub_808161C(u8 a1)
{
    int i;
    u16 color[1];

    if (!a1)
        color[0] = 0x1F;
    else
        color[0] = 0x7C00;

    for (i = 0; i < 16; i++)
    {
        LoadPalette(color, 0xF0 + i, 2);
    }
}

static bool8 sub_8081658(u16 a1)
{
    u8 lo = REG_BLDALPHA & 0xFF;
    u8 hi = REG_BLDALPHA >> 8;

    if (a1)
    {
        if (lo)
        {
            lo--;
        }
    }
    else
    {
        if (hi < 0x10)
        {
            hi++;
        }
    }

    REG_BLDALPHA = (hi << 8) | lo;

    if (lo == 0 && hi == 0x10)
    {
        return TRUE;
    }

    return FALSE;
}

static void sub_80816A8(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        data[6] = REG_DISPCNT;
        data[7] = REG_BLDCNT;
        data[8] = REG_BLDALPHA;
        data[9] = REG_WININ;
        data[10] = REG_WINOUT;
        REG_DISPCNT &= 0xBFFF;
        REG_BLDCNT |= gUnknown_081E29E8[0];
        REG_BLDALPHA = 1804;
        REG_WININ = 63;
        REG_WINOUT = 30;
        SetFlashScanlineEffectWindowBoundaries(&gScanlineEffectRegBuffers[0][0], data[2], data[3], 1);
        CpuFastSet(&gScanlineEffectRegBuffers[0], &gScanlineEffectRegBuffers[1], 480);
        ScanlineEffect_SetParams(sFlashEffectParams);
        data[0] = 1;
        break;
    case 1:
        Menu_BlankWindowRect(0, 0, 29, 19);
        sub_808161C(data[1]);
        sub_8081534(data[2], data[3], 1, 160, 1, 2);
        data[0] = 2;
        break;
    case 2:
        if (!FuncIsActiveTask(UpdateFlashLevelEffect))
        {
            EnableBothScriptContexts();
            data[0] = 3;
        }
        break;
    case 3:
        InstallCameraPanAheadCallback();
        SetCameraPanningCallback(NULL);
        data[5] = 0;
        data[4] = 4;
        data[0] = 4;
        break;
    case 4:
        data[4]--;
        if (!data[4])
        {
            s32 panning;
            data[4] = 4;
            data[5] ^= 1;
            if (data[5])
                panning = 4;
            else
                panning = -4;
            SetCameraPanning(0, panning);
        }
        break;
    case 6:
        InstallCameraPanAheadCallback();
        data[4] = 8;
        data[0] = 7;
        break;
    case 7:
        data[4]--;
        if (!data[4])
        {
            data[4] = 8;
            data[5] ^= 1;
            if (sub_8081658(data[5]) == TRUE)
                data[0] = 5;
        }
        break;
    case 5:
        Menu_EraseWindowRect(0, 0, 29, 19);
        LoadFontDefaultPalette(&gMenuTextWindowTemplate);
        REG_WIN0H = 255;
        REG_DISPCNT = data[6];
        REG_BLDCNT = data[7];
        REG_BLDALPHA = data[8];
        REG_WININ = data[9];
        REG_WINOUT = data[10];
        EnableBothScriptContexts();
        DestroyTask(taskId);
        break;
    }
}

void sub_80818A4(void)
{
    u8 taskId = CreateTask(sub_80816A8, 80);
    s16 *data = gTasks[taskId].data;

    if (gSpecialVar_Result == 0)
    {
        data[1] = 0;
        data[2] = 104;
    }
    else if (gSpecialVar_Result == 1)
    {
        data[1] = 1;
        data[2] = 104;
    }
    else if (gSpecialVar_Result == 2)
    {
        data[1] = 0;
        data[2] = 120;
    }
    else
    {
        data[1] = 1;
        data[2] = 120;
    }

    data[3] = 80;
}

void sub_80818FC(void)
{
    u8 taskId = FindTaskIdByFunc(sub_80816A8);
    gTasks[taskId].data[0] = 6;
}

static void task50_0807F0C8(u8);

void sub_8081924(void)
{
    Overworld_FadeOutMapMusic();
    CreateTask(task50_0807F0C8, 80);
}

static void task50_0807F0C8(u8 taskId)
{
    if (BGMusicStopped() == TRUE)
    {
        DestroyTask(taskId);
        EnableBothScriptContexts();
    }
}
