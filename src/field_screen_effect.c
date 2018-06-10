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

const static u16 gUnknown_0839ACDC[] = { 0xC8, 0x48, 0x38, 0x28, 0x18, 0x0 };

const s32 gMaxFlashLevel = 4;

const static struct ScanlineEffectParams gUnknown_0839ACEC =
{
    (void *)REG_ADDR_WIN0H,
    ((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_DEST_RELOAD) << 16) | 1,
    1
};

static void sub_808136C(u16 *dest, u32 a2, s32 a3, s32 a4)
{
    if (a2 <= 0xA0)
    {
        if (a3 < 0)
            a3 = 0;
        if (a3 > 255)
            a3 = 255;
        if (a4 < 0)
            a4 = 0;
        if (a4 > 255)
            a4 = 255;
        dest[a2] = (a3 << 8) | a4;
    }
}

static void sub_8081398(u16 *dest, s32 a2, s32 a3, s32 a4)
{
    s32 v1 = a4;
    s32 v2 = a4;
    s32 v3 = 0;
    while (v1 >= v3)
    {
        sub_808136C(dest, a3 - v3, a2 - v1, a2 + v1);
        sub_808136C(dest, a3 + v3, a2 - v1, a2 + v1);
        sub_808136C(dest, a3 - v1, a2 - v3, a2 + v3);
        sub_808136C(dest, a3 + v1, a2 - v3, a2 + v3);
        v2 -= (v3 * 2) - 1;
        v3++;
        if (v2 < 0)
        {
            v2 += 2 * (v1 - 1);
            v1--;
        }
    }
}

static void sub_8081424(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        sub_8081398(gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer], data[1], data[2], data[3]);
        data[0] = 1;
        break;
    case 1:
        sub_8081398(gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer], data[1], data[2], data[3]);
        data[0] = 0;
        data[3] += data[5];
        if (data[3] > data[4])
        {
            if (data[6] == 1)
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
    if (!FuncIsActiveTask(sub_8081424))
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

static u8 sub_8081534(s32 a1, s32 a2, s32 a3, s32 a4, s32 a5, u8 a6)
{
    u8 taskId = CreateTask(sub_8081424, 80);
    s16 *data = gTasks[taskId].data;

    data[3] = a3;
    data[4] = a4;
    data[1] = a1;
    data[2] = a2;
    data[6] = a5;

    if (a3 < a4)
        data[5] = a6;
    else
        data[5] = -a6;

    return taskId;
}

void sub_8081594(u8 a1)
{
    u8 flashLevel = Overworld_GetFlashLevel();
    u8 value = 0;
    if (!a1)
        value = 1;
    sub_8081534(120, 80, gUnknown_0839ACDC[flashLevel], gUnknown_0839ACDC[a1], value, 1);
    sub_8081510();
    ScriptContext2_Enable();
}

void sub_80815E0(u8 a1)
{
    if (a1)
    {
        sub_8081398(&gScanlineEffectRegBuffers[0][0], 120, 80, gUnknown_0839ACDC[a1]);
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
        sub_8081398(&gScanlineEffectRegBuffers[0][0], data[2], data[3], 1);
        CpuFastSet(&gScanlineEffectRegBuffers[0], &gScanlineEffectRegBuffers[1], 480);
        //ScanlineEffect_SetParams(gUnknown_0839ACEC[0], gUnknown_0839ACEC[1], gUnknown_0839ACEC[2]);
        ScanlineEffect_SetParams(gUnknown_0839ACEC);
        data[0] = 1;
        break;
    case 1:
        Menu_BlankWindowRect(0, 0, 29, 19);
        sub_808161C(data[1]);
        sub_8081534(data[2], data[3], 1, 160, 1, 2);
        data[0] = 2;
        break;
    case 2:
        if (!FuncIsActiveTask(sub_8081424))
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
    if (sub_8054034() == TRUE)
    {
        DestroyTask(taskId);
        EnableBothScriptContexts();
    }
}
