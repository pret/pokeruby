#include "global.h"
#include "field_door.h"
#include "field_camera.h"
#include "fieldmap.h"
#include "metatile_behavior.h"
#include "constants/songs.h"
#include "task.h"

const u8 DoorAnimTiles_04[][0x100] =
{
    INCBIN_U8("graphics/door_anims/04/0.4bpp"),
    INCBIN_U8("graphics/door_anims/04/1.4bpp"),
    INCBIN_U8("graphics/door_anims/04/2.4bpp"),
};

// TODO: Make these blank palette includes?
asm(".space 32");

const u8 DoorAnimTiles_05[][0x100] =
{
    INCBIN_U8("graphics/door_anims/05/0.4bpp"),
    INCBIN_U8("graphics/door_anims/05/1.4bpp"),
    INCBIN_U8("graphics/door_anims/05/2.4bpp"),
};

const u8 DoorAnimTiles_08[][0x100] =
{
    INCBIN_U8("graphics/door_anims/08/0.4bpp"),
    INCBIN_U8("graphics/door_anims/08/1.4bpp"),
    INCBIN_U8("graphics/door_anims/08/2.4bpp"),
};

asm(".space 32");

const u8 DoorAnimTiles_15[][0x100] =
{
    INCBIN_U8("graphics/door_anims/15/0.4bpp"),
    INCBIN_U8("graphics/door_anims/15/1.4bpp"),
    INCBIN_U8("graphics/door_anims/15/2.4bpp"),
};

asm(".space 32");

const u8 DoorAnimTiles_16[][0x100] =
{
    INCBIN_U8("graphics/door_anims/16/0.4bpp"),
    INCBIN_U8("graphics/door_anims/16/1.4bpp"),
    INCBIN_U8("graphics/door_anims/16/2.4bpp"),
};

asm(".space 32");

const u8 DoorAnimTiles_00[][0x100] =
{
    INCBIN_U8("graphics/door_anims/00/0.4bpp"),
    INCBIN_U8("graphics/door_anims/00/1.4bpp"),
    INCBIN_U8("graphics/door_anims/00/2.4bpp"),
};

const u8 DoorAnimTiles_01[][0x100] =
{
    INCBIN_U8("graphics/door_anims/01/0.4bpp"),
    INCBIN_U8("graphics/door_anims/01/1.4bpp"),
    INCBIN_U8("graphics/door_anims/01/2.4bpp"),
};

const u8 DoorAnimTiles_02[][0x100] =
{
    INCBIN_U8("graphics/door_anims/02/0.4bpp"),
    INCBIN_U8("graphics/door_anims/02/1.4bpp"),
    INCBIN_U8("graphics/door_anims/02/2.4bpp"),
};

const u8 DoorAnimTiles_03[][0x100] =
{
    INCBIN_U8("graphics/door_anims/03/0.4bpp"),
    INCBIN_U8("graphics/door_anims/03/1.4bpp"),
    INCBIN_U8("graphics/door_anims/03/2.4bpp"),
};

const u8 DoorAnimTiles_06[][0x100] =
{
    INCBIN_U8("graphics/door_anims/06/0.4bpp"),
    INCBIN_U8("graphics/door_anims/06/1.4bpp"),
    INCBIN_U8("graphics/door_anims/06/2.4bpp"),
};

const u8 DoorAnimTiles_07[][0x100] =
{
    INCBIN_U8("graphics/door_anims/07/0.4bpp"),
    INCBIN_U8("graphics/door_anims/07/1.4bpp"),
    INCBIN_U8("graphics/door_anims/07/2.4bpp"),
};

const u8 DoorAnimTiles_09[][0x100] =
{
    INCBIN_U8("graphics/door_anims/09/0.4bpp"),
    INCBIN_U8("graphics/door_anims/09/1.4bpp"),
    INCBIN_U8("graphics/door_anims/09/2.4bpp"),
};

asm(".space 32");

const u8 DoorAnimTiles_10[][0x100] =
{
    INCBIN_U8("graphics/door_anims/10/0.4bpp"),
    INCBIN_U8("graphics/door_anims/10/1.4bpp"),
    INCBIN_U8("graphics/door_anims/10/2.4bpp"),
};

asm(".space 32");

const u8 DoorAnimTiles_11[][0x100] =
{
    INCBIN_U8("graphics/door_anims/11/0.4bpp"),
    INCBIN_U8("graphics/door_anims/11/1.4bpp"),
    INCBIN_U8("graphics/door_anims/11/2.4bpp"),
};

asm(".space 32");

const u8 DoorAnimTiles_12[][0x100] =
{
    INCBIN_U8("graphics/door_anims/12/0.4bpp"),
    INCBIN_U8("graphics/door_anims/12/1.4bpp"),
    INCBIN_U8("graphics/door_anims/12/2.4bpp"),
};

asm(".space 32");

const u8 DoorAnimTiles_13[][0x100] =
{
    INCBIN_U8("graphics/door_anims/13/0.4bpp"),
    INCBIN_U8("graphics/door_anims/13/1.4bpp"),
    INCBIN_U8("graphics/door_anims/13/2.4bpp"),
};

asm(".space 32");

const u8 DoorAnimTiles_14[][0x100] =
{
    INCBIN_U8("graphics/door_anims/14/0.4bpp"),
    INCBIN_U8("graphics/door_anims/14/1.4bpp"),
    INCBIN_U8("graphics/door_anims/14/2.4bpp"),
};

asm(".space 32");

const u8 DoorAnimTiles_17[][0x100] =
{
    INCBIN_U8("graphics/door_anims/17/0.4bpp"),
    INCBIN_U8("graphics/door_anims/17/1.4bpp"),
    INCBIN_U8("graphics/door_anims/17/2.4bpp"),
};

asm(".space 32");

const u8 DoorAnimTiles_18[][0x100] =
{
    INCBIN_U8("graphics/door_anims/18/0.4bpp"),
    INCBIN_U8("graphics/door_anims/18/1.4bpp"),
    INCBIN_U8("graphics/door_anims/18/2.4bpp"),
};

asm(".space 32");

const u8 DoorAnimTiles_19[][0x100] =
{
    INCBIN_U8("graphics/door_anims/19/0.4bpp"),
    INCBIN_U8("graphics/door_anims/19/1.4bpp"),
    INCBIN_U8("graphics/door_anims/19/2.4bpp"),
};

asm(".space 32");

const u8 DoorAnimTiles_20[][0x100] =
{
    INCBIN_U8("graphics/door_anims/20/0.4bpp"),
    INCBIN_U8("graphics/door_anims/20/1.4bpp"),
    INCBIN_U8("graphics/door_anims/20/2.4bpp"),
};

asm(".space 32");

const u8 DoorAnimTiles_21[][0x100] =
{
    INCBIN_U8("graphics/door_anims/21/0.4bpp"),
    INCBIN_U8("graphics/door_anims/21/1.4bpp"),
    INCBIN_U8("graphics/door_anims/21/2.4bpp"),
};

asm(".space 32");

const u8 DoorAnimTiles_22[][0x100] =
{
    INCBIN_U8("graphics/door_anims/22/0.4bpp"),
    INCBIN_U8("graphics/door_anims/22/1.4bpp"),
    INCBIN_U8("graphics/door_anims/22/2.4bpp"),
};

asm(".space 32");

const u8 DoorAnimTiles_23[][0x100] =
{
    INCBIN_U8("graphics/door_anims/23/0.4bpp"),
    INCBIN_U8("graphics/door_anims/23/1.4bpp"),
    INCBIN_U8("graphics/door_anims/23/2.4bpp"),
};

asm(".space 32");

const u8 DoorAnimTiles_24[][0x100] =
{
    INCBIN_U8("graphics/door_anims/24/0.4bpp"),
    INCBIN_U8("graphics/door_anims/24/1.4bpp"),
    INCBIN_U8("graphics/door_anims/24/2.4bpp"),
};

asm(".space 32");

const u8 DoorAnimTiles_25[][0x100] =
{
    INCBIN_U8("graphics/door_anims/25/0.4bpp"),
    INCBIN_U8("graphics/door_anims/25/1.4bpp"),
    INCBIN_U8("graphics/door_anims/25/2.4bpp"),
};

asm(".space 32");

const u8 DoorAnimTiles_26[][0x100] =
{
    INCBIN_U8("graphics/door_anims/26/0.4bpp"),
    INCBIN_U8("graphics/door_anims/26/1.4bpp"),
    INCBIN_U8("graphics/door_anims/26/2.4bpp"),
};

asm(".space 32");

const u8 DoorAnimTiles_27[][0x100] =
{
    INCBIN_U8("graphics/door_anims/27/0.4bpp"),
    INCBIN_U8("graphics/door_anims/27/1.4bpp"),
    INCBIN_U8("graphics/door_anims/27/2.4bpp"),
};

asm(".space 32");

const u8 DoorAnimTiles_28[][0x100] =
{
    INCBIN_U8("graphics/door_anims/28/0.4bpp"),
    INCBIN_U8("graphics/door_anims/28/1.4bpp"),
    INCBIN_U8("graphics/door_anims/28/2.4bpp"),
};

asm(".space 32");

const u8 DoorAnimTiles_29[][0x100] =
{
    INCBIN_U8("graphics/door_anims/29/0.4bpp"),
    INCBIN_U8("graphics/door_anims/29/1.4bpp"),
    INCBIN_U8("graphics/door_anims/29/2.4bpp"),
};

asm(".space 32");

const u8 DoorAnimTiles_30[][0x100] =
{
    INCBIN_U8("graphics/door_anims/30/0.4bpp"),
    INCBIN_U8("graphics/door_anims/30/1.4bpp"),
    INCBIN_U8("graphics/door_anims/30/2.4bpp"),
};

asm(".space 32");

const u8 DoorAnimTiles_31[][0x100] =
{
    INCBIN_U8("graphics/door_anims/31/0.4bpp"),
    INCBIN_U8("graphics/door_anims/31/1.4bpp"),
    INCBIN_U8("graphics/door_anims/31/2.4bpp"),
};

asm(".space 32");

const u8 DoorAnimTiles_32[][0x100] =
{
    INCBIN_U8("graphics/door_anims/32/0.4bpp"),
    INCBIN_U8("graphics/door_anims/32/1.4bpp"),
    INCBIN_U8("graphics/door_anims/32/2.4bpp"),
};

asm(".space 32");

const u8 DoorAnimTiles_33[][0x100] =
{
    INCBIN_U8("graphics/door_anims/33/0.4bpp"),
    INCBIN_U8("graphics/door_anims/33/1.4bpp"),
    INCBIN_U8("graphics/door_anims/33/2.4bpp"),
};

asm(".space 32");

static const struct DoorAnimFrame gDoorOpenAnimFrames[] =
{
    {4, -1},
    {4, 0},
    {4, 0x100},
    {4, 0x200},
    {0, 0},
};

static const struct DoorAnimFrame gDoorCloseAnimFrames[] =
{
    {4, 0x200},
    {4, 0x100},
    {4, 0},
    {4, -1},
    {0, 0},
};

const u8 DoorAnimPalettes_830F8A4[] = {1, 1, 1, 1, 1, 1, 1, 1}; // door 00
const u8 DoorAnimPalettes_830F8AC[] = {1, 1, 1, 1, 1, 1, 1, 1}; // door 01
const u8 DoorAnimPalettes_830F8B4[] = {5, 5, 5, 5, 5, 5, 5, 5}; // door 02
const u8 DoorAnimPalettes_830F8BC[] = {0, 0, 1, 1, 1, 1, 1, 1}; // door 03
const u8 DoorAnimPalettes_830F8C4[] = {6, 6, 6, 6, 6, 6, 6, 6}; // door 04
const u8 DoorAnimPalettes_830F8CC[] = {8, 8, 8, 8, 8, 8, 8, 8}; // door 05
const u8 DoorAnimPalettes_830F8D4[] = {11, 11, 11, 11, 11, 11, 11, 11}; // door 06
const u8 DoorAnimPalettes_830F8DC[] = {10, 10, 10, 10, 10, 10, 10, 10}; // door 07
const u8 DoorAnimPalettes_830F8E4[] = {7, 7, 7, 7, 7, 7, 7, 7}; // door 08
const u8 DoorAnimPalettes_830F8EC[] = {8, 8, 8, 8, 8, 8, 8, 8}; // door 09
const u8 DoorAnimPalettes_830F8F4[] = {9, 9, 9, 9, 9, 9, 9, 9}; // door 10
const u8 DoorAnimPalettes_830F8FC[] = {9, 9, 1, 1, 1, 1, 1, 1}; // door 11
const u8 DoorAnimPalettes_830F904[] = {8, 8, 8, 8, 8, 8, 8, 8}; // door 12
const u8 DoorAnimPalettes_830F90C[] = {9, 9, 9, 9, 9, 9, 9, 9}; // door 13
const u8 DoorAnimPalettes_830F914[] = {6, 6, 6, 6, 6, 6, 6, 6}; // door 14
const u8 DoorAnimPalettes_830F91C[] = {6, 6, 6, 6, 6, 6, 6, 6}; // door 15
const u8 DoorAnimPalettes_830F924[] = {0, 0, 5, 5, 5, 5, 5, 5}; // door 16
const u8 DoorAnimPalettes_830F92C[] = {6, 6, 1, 1, 1, 1, 1, 1}; // door 17
const u8 DoorAnimPalettes_830F934[] = {7, 7, 7, 7, 7, 7, 7, 7}; // door 18
const u8 DoorAnimPalettes_830F93C[] = {6, 6, 5, 5, 5, 5, 5, 5}; // door 19
const u8 DoorAnimPalettes_830F944[] = {5, 5, 5, 5, 5, 5, 5, 5}; // door 20
const u8 DoorAnimPalettes_830F94C[] = {1, 1, 1, 1, 1, 1, 1, 1}; // door 21
const u8 DoorAnimPalettes_830F954[] = {6, 6, 7, 7, 7, 7, 7, 7}; // door 22
const u8 DoorAnimPalettes_830F95C[] = {7, 7, 7, 7, 7, 7, 7, 7}; // door 23
const u8 DoorAnimPalettes_830F964[] = {5, 5, 5, 5, 5, 5, 5, 5}; // door 24
const u8 DoorAnimPalettes_830F96C[] = {9, 9, 9, 9, 9, 9, 9, 9}; // door 25
const u8 DoorAnimPalettes_830F974[] = {8, 8, 8, 8, 8, 8, 8, 8}; // door 26
const u8 DoorAnimPalettes_830F97C[] = {6, 6, 6, 6, 6, 6, 6, 6}; // door 27
const u8 DoorAnimPalettes_830F984[] = {7, 7, 7, 7, 7, 7, 7, 7}; // door 28
const u8 DoorAnimPalettes_830F98C[] = {11, 11, 7, 7, 7, 7, 7, 7}; // door 29
const u8 DoorAnimPalettes_830F994[] = {7, 7, 7, 7, 7, 7, 7, 7}; // door 30
const u8 DoorAnimPalettes_830F99C[] = {6, 6, 7, 7, 7, 7, 7, 7}; // door 31
const u8 DoorAnimPalettes_830F9A4[] = {9, 9, 9, 9, 9, 9, 9, 9}; // door 32
const u8 DoorAnimPalettes_830F9AC[] = {7, 7, 7, 7, 7, 7, 7, 7}; // door 33

static const struct DoorGraphics gDoorAnimGraphicsTable[] =
{
    {0x021, 0, DoorAnimTiles_00, DoorAnimPalettes_830F8A4}, // door 00
    {0x061, 1, DoorAnimTiles_01, DoorAnimPalettes_830F8AC}, // door 01
    {0x1CD, 1, DoorAnimTiles_02, DoorAnimPalettes_830F8B4}, // door 02
    {0x041, 1, DoorAnimTiles_03, DoorAnimPalettes_830F8BC}, // door 03
    {0x248, 0, DoorAnimTiles_04, DoorAnimPalettes_830F8C4}, // door 04
    {0x249, 0, DoorAnimTiles_05, DoorAnimPalettes_830F8CC}, // door 05
    {0x22F, 0, DoorAnimTiles_06, DoorAnimPalettes_830F8D4}, // door 06
    {0x21F, 0, DoorAnimTiles_07, DoorAnimPalettes_830F8DC}, // door 07
    {0x2A5, 0, DoorAnimTiles_08, DoorAnimPalettes_830F8E4}, // door 08
    {0x287, 0, DoorAnimTiles_09, DoorAnimPalettes_830F8F4}, // door 09
    {0x2AC, 0, DoorAnimTiles_10, DoorAnimPalettes_830F934}, // door 10
    {0x3A1, 0, DoorAnimTiles_11, DoorAnimPalettes_830F93C}, // door 11
    {0x2DC, 0, DoorAnimTiles_12, DoorAnimPalettes_830F92C}, // door 12
    {0x225, 0, DoorAnimTiles_13, DoorAnimPalettes_830F924}, // door 13
    {0x1DB, 1, DoorAnimTiles_14, DoorAnimPalettes_830F94C}, // door 14
    {0x246, 0, DoorAnimTiles_15, DoorAnimPalettes_830F8EC}, // door 15
    {0x28E, 0, DoorAnimTiles_16, DoorAnimPalettes_830F944}, // door 16
    {0x2A1, 0, DoorAnimTiles_17, DoorAnimPalettes_830F8FC}, // door 17
    {0x21C, 0, DoorAnimTiles_18, DoorAnimPalettes_830F914}, // door 18
    {0x21E, 0, DoorAnimTiles_19, DoorAnimPalettes_830F91C}, // door 19
    {0x21D, 1, DoorAnimTiles_20, DoorAnimPalettes_830F904}, // door 20
    {0x21A, 0, DoorAnimTiles_21, DoorAnimPalettes_830F90C}, // door 21
    {0x224, 0, DoorAnimTiles_22, DoorAnimPalettes_830F954}, // door 22
    {0x289, 0, DoorAnimTiles_23, DoorAnimPalettes_830F95C}, // door 23
    {0x30C, 1, DoorAnimTiles_24, DoorAnimPalettes_830F964}, // door 24
    {0x32D, 1, DoorAnimTiles_25, DoorAnimPalettes_830F96C}, // door 25
    {0x2ED, 1, DoorAnimTiles_26, DoorAnimPalettes_830F974}, // door 26
    {0x264, 1, DoorAnimTiles_27, DoorAnimPalettes_830F97C}, // door 27
    {0x22B, 0, DoorAnimTiles_28, DoorAnimPalettes_830F984}, // door 28
    {0x2F7, 0, DoorAnimTiles_29, DoorAnimPalettes_830F98C}, // door 29
    {0x297, 0, DoorAnimTiles_30, DoorAnimPalettes_830F994}, // door 30
    {0x285, 1, DoorAnimTiles_31, DoorAnimPalettes_830F99C}, // door 31
    {0x25D, 1, DoorAnimTiles_32, DoorAnimPalettes_830F9A4}, // door 32
    {0x20E, 1, DoorAnimTiles_33, DoorAnimPalettes_830F9AC}, // door 33
    {0, 0, NULL, NULL},
};

static void CopyDoorTilesToVram(const void *src)
{
    CpuFastSet(src, (void *)(VRAM + 0x7F00), 0x40);
}

static void door_build_blockdef(u16 *a, u16 b, const u8 *c)
{
    int i;
    u16 unk;

    for (i = 0; i < 4; i++)
    {
        unk = *(c++) << 12;
        a[i] = unk | (b + i);
    }
    for (; i < 8; i++)
    {
        unk = *(c++) << 12;
        a[i] = unk;
    }
}

static void DrawCurrentDoorAnimFrame(u32 x, u32 y, const u8 *c)
{
    u16 arr[8];

    door_build_blockdef(arr, 0x3F8, c);
    DrawDoorMetatileAt(x, y - 1, arr);
    door_build_blockdef(arr, 0x3FC, c + 4);
    DrawDoorMetatileAt(x, y, arr);
}

static void DrawClosedDoorTiles(u32 x, u32 y)
{
    CurrentMapDrawMetatileAt(x, y - 1);
    CurrentMapDrawMetatileAt(x, y);
}

static void DrawDoor(const struct DoorGraphics *gfx, const struct DoorAnimFrame *frame, u32 x, u32 y)
{
    if (frame->offset == 0xFFFF)
        DrawClosedDoorTiles(x, y);
    else
    {
        CopyDoorTilesToVram(gfx->tiles + frame->offset);
        DrawCurrentDoorAnimFrame(x, y, gfx->palette);
    }
}

enum
{
    TD_FRAMELIST = 0,
    TD_GFX = 2,
    TD_FRAME = 4,
    TD_COUNTER,
    TD_X,
    TD_Y
};

static bool32 sub_8058464(struct DoorGraphics *gfx, struct DoorAnimFrame *frames, s16 *taskData)
{
    if (taskData[TD_COUNTER] == 0)
        DrawDoor(gfx, &frames[taskData[TD_FRAME]], taskData[TD_X], taskData[TD_Y]);
    if (taskData[TD_COUNTER] == frames[taskData[TD_FRAME]].time)
    {
        taskData[TD_COUNTER] = 0;
        taskData[TD_FRAME]++;
        if (frames[taskData[TD_FRAME]].time == 0)
            return FALSE;
        else
            return TRUE;
    }
    taskData[TD_COUNTER]++;
    return TRUE;
}

static void Task_AnimateDoor(u8 taskId)
{
    u16 *taskData = gTasks[taskId].data;
    struct DoorAnimFrame *frames = (struct DoorAnimFrame *)(taskData[TD_FRAMELIST] << 16 | taskData[TD_FRAMELIST + 1]);
    struct DoorGraphics *gfx = (struct DoorGraphics *)(taskData[TD_GFX] << 16 | taskData[TD_GFX + 1]);

    if (sub_8058464(gfx, frames, taskData) == FALSE)
        DestroyTask(taskId);
}

static const struct DoorAnimFrame *GetLastDoorFrame(const struct DoorAnimFrame *frame, const void *unused)
{
    while (frame->time != 0)
        frame++;
    return frame - 1;
}

static const struct DoorGraphics *GetDoorGraphics(const struct DoorGraphics *gfx, u16 metatileNum)
{
    while (gfx->tiles != NULL)
    {
        if (gfx->metatileNum == metatileNum)
            return gfx;
        gfx++;
    }
    return NULL;
}

static s8 StartDoorAnimationTask(const struct DoorGraphics *gfx, const struct DoorAnimFrame *frames, u32 x, u32 y)
{
    if (FuncIsActiveTask(Task_AnimateDoor) == TRUE)
        return -1;
    else
    {
        u8 taskId = CreateTask(Task_AnimateDoor, 0x50);
        s16 *taskData = gTasks[taskId].data;

        taskData[TD_X] = x;
        taskData[TD_Y] = y;

        taskData[TD_FRAMELIST + 1] = (u32)frames;
        taskData[TD_FRAMELIST] = (u32)frames >> 16;

        taskData[TD_GFX + 1] = (u32)gfx;
        taskData[TD_GFX] = (u32)gfx >> 16;

        return taskId;
    }
}

static void DrawClosedDoor(const struct DoorGraphics *unused, u32 x, u32 y)
{
    DrawClosedDoorTiles(x, y);
}

static void DrawOpenedDoor(const struct DoorGraphics *gfx, u32 x, u32 y)
{
    gfx = GetDoorGraphics(gfx, MapGridGetMetatileIdAt(x, y));
    if (gfx != NULL)
        DrawDoor(gfx, GetLastDoorFrame(gDoorOpenAnimFrames, gDoorOpenAnimFrames), x, y);
}

static s8 StartDoorOpenAnimation(const struct DoorGraphics *gfx, u32 x, u32 y)
{
    gfx = GetDoorGraphics(gfx, MapGridGetMetatileIdAt(x, y));
    if (gfx == NULL)
        return -1;
    else
        return StartDoorAnimationTask(gfx, gDoorOpenAnimFrames, x, y);
}

static s8 StartDoorCloseAnimation(const struct DoorGraphics *gfx, u32 x, u32 y)
{
    gfx = GetDoorGraphics(gfx, MapGridGetMetatileIdAt(x, y));
    if (gfx == NULL)
        return -1;
    else
        return StartDoorAnimationTask(gfx, gDoorCloseAnimFrames, x, y);
}

static s8 cur_mapdata_get_door_x2_at(const struct DoorGraphics *gfx, u32 x, u32 y)
{
    gfx = GetDoorGraphics(gfx, MapGridGetMetatileIdAt(x, y));
    if (gfx == NULL)
        return -1;
    else
        return gfx->unk2;
}

void unref_sub_805869C(u32 x, u32 y)
{
    StartDoorOpenAnimation(gDoorAnimGraphicsTable, x, y);
}

void FieldSetDoorOpened(u32 x, u32 y)
{
    if (MetatileBehavior_IsDoor(MapGridGetMetatileBehaviorAt(x, y)))
        DrawOpenedDoor(gDoorAnimGraphicsTable, x, y);
}

void FieldSetDoorClosed(u32 x, u32 y)
{
    if (MetatileBehavior_IsDoor(MapGridGetMetatileBehaviorAt(x, y)))
        DrawClosedDoor(gDoorAnimGraphicsTable, x, y);
}

s8 FieldAnimateDoorClose(u32 x, u32 y)
{
    if (!MetatileBehavior_IsDoor(MapGridGetMetatileBehaviorAt(x, y)))
        return -1;
    else
        return StartDoorCloseAnimation(gDoorAnimGraphicsTable, x, y);
}

s8 FieldAnimateDoorOpen(u32 x, u32 y)
{
    if (!MetatileBehavior_IsDoor(MapGridGetMetatileBehaviorAt(x, y)))
        return -1;
    else
        return StartDoorOpenAnimation(gDoorAnimGraphicsTable, x, y);
}

bool8 FieldIsDoorAnimationRunning(void)
{
    return FuncIsActiveTask(Task_AnimateDoor);
}

u32 GetDoorSoundEffect(u32 x, u32 y)
{
    if (cur_mapdata_get_door_x2_at(gDoorAnimGraphicsTable, x, y) == 0)
        return SE_DOOR;
    else
        return SE_JIDO_DOA;
}
