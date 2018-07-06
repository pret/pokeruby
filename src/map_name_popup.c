#include "global.h"
#include "map_name_popup.h"
#include "event_data.h"
#include "menu.h"
#include "region_map.h"
#include "task.h"

EWRAM_DATA static u8 sTaskId = 0;

static void Task_MapNamePopup(u8);
static void DrawMapNamePopup(void);

bool8 unref_sub_80A2F44(void)
{
    CloseMenu();
    ShowMapNamePopup();
    return 1;
}

void ShowMapNamePopup(void)
{
    if (FlagGet(FLAG_SPECIAL_FLAG_0) != TRUE)
    {
        if (!FuncIsActiveTask(Task_MapNamePopup))
        {
            sTaskId = CreateTask(Task_MapNamePopup, 90);
            REG_BG0VOFS = 32;
            DrawMapNamePopup();
            gTasks[sTaskId].data[0] = 0;
            gTasks[sTaskId].data[2] = 32;
        }
        else
        {
            if (gTasks[sTaskId].data[0] != 2)
                gTasks[sTaskId].data[0] = 2;
            gTasks[sTaskId].data[3] = 1;
        }
    }
}

void Task_MapNamePopup(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        task->data[2] -= 2;
        if (task->data[2] <= 0 )
        {
            task->data[0] = 1;
            gTasks[sTaskId].data[1] = 0;
        }
        break;
    case 1:
        task->data[1]++;
        if (task->data[1] > 120 )
        {
            task->data[1] = 0;
            task->data[0] = 2;
        }
        break;
    case 2:
        task->data[2] += 2;
        if (task->data[2] > 31)
        {
            if (task->data[3])
            {
                DrawMapNamePopup();
                task->data[0] = 0;
                task->data[3] = 0;
            }
            else
            {
                task->data[0] = 4;
                return;
            }
        }
        break;
    case 4:
        HideMapNamePopup();
        return;
    }

    REG_BG0VOFS = task->data[2];
}

void HideMapNamePopup(void)
{
    if (FuncIsActiveTask(Task_MapNamePopup))
    {
        Menu_LoadStdFrameGraphics();
        Menu_EraseWindowRect(0, 0, 13, 3);
        REG_BG0VOFS = 0;
        DestroyTask(sTaskId);
    }
}

void DrawMapNamePopup(void)
{
    u8 name[20];

    Menu_LoadStdFrameGraphicsOverrideStyle(0);
    GetMapSectionName(name, gMapHeader.regionMapSectionId, 0);
    Menu_DrawStdWindowFrame(0, 0, 13, 3);
    MenuPrint_Centered(name, 1, 1, 0x60);
}
