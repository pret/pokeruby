#include "global.h"
#include "field_message_box.h"
#include "menu.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
#include "text_window.h"

static EWRAM_DATA struct Window gFieldMessageBoxWindow = {0};

static u8 sMessageBoxMode;

static void Task_FieldMessageBox(u8 taskId);
static void CreateFieldMessageBoxTask(void);
static void DestroyFieldMessageBoxTask(void);
static void PrintFieldMessage(const u8 *message);
static void PrintFieldMessageFromStringVar4(void);

void InitFieldMessageBox(void)
{
    sMessageBoxMode = FIELD_MESSAGE_BOX_HIDDEN;
    SetMessageBoxBaseTileNum(gMenuTextWindowContentTileOffset);
    InitWindowFromConfig(&gFieldMessageBoxWindow, &gWindowConfig_81E6CE4);
}

static void Task_FieldMessageBox(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    switch (task->data[0])
    {
    case 0:
        LoadMessageBoxTiles(&gFieldMessageBoxWindow);
        task->data[0]++;
        break;
    case 1:
        DrawStandardMessageBox(&gFieldMessageBoxWindow);
        task->data[0]++;
        break;
    case 2:
        switch (sMessageBoxMode)
        {
        case FIELD_MESSAGE_BOX_NORMAL:
            if (!sub_80035AC(&gFieldMessageBoxWindow))
                return;
            break;
        case FIELD_MESSAGE_BOX_AUTO_SCROLL:
            if (!sub_8003778(&gFieldMessageBoxWindow))
                return;
            break;
        }
        sMessageBoxMode = FIELD_MESSAGE_BOX_HIDDEN;
        DestroyTask(taskId);
    }
}

static void CreateFieldMessageBoxTask(void)
{
    CreateTask(Task_FieldMessageBox, 80);
}

static void DestroyFieldMessageBoxTask(void)
{
    u8 taskId = FindTaskIdByFunc(Task_FieldMessageBox);
    if (taskId != 0xFF)
        DestroyTask(taskId);
}

bool8 ShowFieldMessage(const u8 *message)
{
    if (sMessageBoxMode != FIELD_MESSAGE_BOX_HIDDEN)
    {
        return FALSE;
    }
    else
    {
        PrintFieldMessage(message);
        sMessageBoxMode = FIELD_MESSAGE_BOX_NORMAL;
        return TRUE;
    }
}

bool8 ShowFieldAutoScrollMessage(const u8 *message)
{
    if (sMessageBoxMode != FIELD_MESSAGE_BOX_HIDDEN)
    {
        return FALSE;
    }
    else
    {
        sMessageBoxMode = FIELD_MESSAGE_BOX_AUTO_SCROLL;
        PrintFieldMessage(message);
        return TRUE;
    }
}

bool8 unref_sub_8064BB8(const u8 *message)
{
    sMessageBoxMode = FIELD_MESSAGE_BOX_AUTO_SCROLL;
    PrintFieldMessage(message);
    return TRUE;
}

bool8 unref_sub_8064BD0(const u8 *message)
{
    if (sMessageBoxMode != FIELD_MESSAGE_BOX_HIDDEN)
    {
        return FALSE;
    }
    else
    {
        sMessageBoxMode = FIELD_MESSAGE_BOX_NORMAL;
        PrintFieldMessageFromStringVar4();
        return TRUE;
    }
}

static void PrintFieldMessage(const u8 *message)
{
    StringExpandPlaceholders(gStringVar4, message);
    sub_8002EB0(&gFieldMessageBoxWindow, gStringVar4, gMenuTextTileOffset, 2, 15);
    CreateFieldMessageBoxTask();
}

static void PrintFieldMessageFromStringVar4(void)
{
    sub_8002EB0(&gFieldMessageBoxWindow, gStringVar4, gMenuTextTileOffset, 2, 15);
    CreateFieldMessageBoxTask();
}

void HideFieldMessageBox(void)
{
    DestroyFieldMessageBoxTask();
    ClearStandardMessageBox(&gFieldMessageBoxWindow);
    sMessageBoxMode = FIELD_MESSAGE_BOX_HIDDEN;
}

u8 GetFieldMessageBoxMode(void)
{
    return sMessageBoxMode;
}

bool8 IsFieldMessageBoxHidden(void)
{
    if (sMessageBoxMode == FIELD_MESSAGE_BOX_HIDDEN)
        return TRUE;
    else
        return FALSE;
}

void unref_sub_8064CA0(void)
{
    DestroyFieldMessageBoxTask();
    DrawStandardMessageBox(&gFieldMessageBoxWindow);
    sMessageBoxMode = FIELD_MESSAGE_BOX_HIDDEN;
}
