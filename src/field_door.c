#include "global.h"
#include "asm.h"
#include "task.h"
#include "field_camera.h"

struct DoorGraphics
{
    u16 metatileNum;
    u8 unk2;
    void *tiles;
    void *palette;
};

struct DoorAnimFrame
{
    u8 time;
    u16 offset;
};

extern struct DoorAnimFrame gDoorOpenAnimFrames[];
extern struct DoorAnimFrame gDoorCloseAnimFrames[];
extern struct DoorGraphics gDoorAnimGraphicsTable[];

static void CopyDoorTilesToVram(void *src)
{
    CpuFastSet(src, (void *)(VRAM + 0x7F00), 0x40);
}

static void door_build_blockdef(u16 *a, u16 b, u8 *c)
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

static void DrawCurrentDoorAnimFrame(u32 x, u32 y, u8 *c)
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

static void DrawDoor(struct DoorGraphics *gfx, struct DoorAnimFrame *frame, u32 x, u32 y)
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

static struct DoorAnimFrame *GetLastDoorFrame(struct DoorAnimFrame *frame, void *unused)
{
    while (frame->time != 0)
        frame++;
    return frame - 1;
}

static struct DoorGraphics *GetDoorGraphics(struct DoorGraphics *gfx, u16 metatileNum)
{
    while (gfx->tiles != NULL)
    {
        if (gfx->metatileNum == metatileNum)
            return gfx;
        gfx++;
    }
    return NULL;
}

static s8 StartDoorAnimationTask(struct DoorGraphics *gfx, struct DoorAnimFrame *frames, u32 x, u32 y)
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

static void DrawClosedDoor(struct DoorGraphics *unused, u32 x, u32 y)
{
    DrawClosedDoorTiles(x, y);
}

static void DrawOpenedDoor(struct DoorGraphics *gfx, u32 x, u32 y)
{
    gfx = GetDoorGraphics(gfx, MapGridGetMetatileIdAt(x, y));
    if (gfx != NULL)
        DrawDoor(gfx, GetLastDoorFrame(gDoorOpenAnimFrames, gDoorOpenAnimFrames), x, y);
}

static s8 StartDoorOpenAnimation(struct DoorGraphics *gfx, u32 x, u32 y)
{
    gfx = GetDoorGraphics(gfx, MapGridGetMetatileIdAt(x, y));
    if (gfx == NULL)
        return -1;
    else
        return StartDoorAnimationTask(gfx, gDoorOpenAnimFrames, x, y);
}

static s8 StartDoorCloseAnimation(struct DoorGraphics *gfx, u32 x, u32 y)
{
    gfx = GetDoorGraphics(gfx, MapGridGetMetatileIdAt(x, y));
    if (gfx == NULL)
        return -1;
    else
        return StartDoorAnimationTask(gfx, gDoorCloseAnimFrames, x, y);
}

static s8 cur_mapdata_get_door_x2_at(struct DoorGraphics *gfx, u32 x, u32 y)
{
    gfx = GetDoorGraphics(gfx, MapGridGetMetatileIdAt(x, y));
    if (gfx == NULL)
        return -1;
    else
        return gfx->unk2;
}

static void unref_sub_805869C(u32 x, u32 y)
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

u8 sub_8058790(u32 x, u32 y)
{
    if (cur_mapdata_get_door_x2_at(gDoorAnimGraphicsTable, x, y) == 0)
        return 8;
    else
        return 18;
}
