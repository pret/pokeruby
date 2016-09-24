#include "global.h"
#include "text.h"
#include "text_window.h"
#include "task.h"
#include "string_util.h"
#include "field_message_box.h"

extern struct Window gFieldMessageBoxWindow;
extern u16 gFieldMessageBoxBaseTileNum;

extern u16 gMenuTextTileOffset;

static u8 sMessageBoxMode;

void textbox_fdecode_auto_and_task_add(u8 *);
void textbox_auto_and_task_add(void);

void sub_8064A74(void)
{
    sMessageBoxMode = FIELD_MESSAGE_BOX_HIDDEN;
    SetMessageBoxBaseTileNum(gFieldMessageBoxBaseTileNum);
    InitWindowFromConfig(&gFieldMessageBoxWindow, (struct WindowConfig *)&gWindowConfig_81E6CE4);
}

void sub_8064AA0(u8 taskId)
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

void task_add_textbox(void)
{
    CreateTask(sub_8064AA0, 80);
}

void task_del_textbox()
{
    u8 taskId = FindTaskIdByFunc(sub_8064AA0);
    if (taskId != 0xFF)
        DestroyTask(taskId);
}

bool8 box_related_two__2(u8 *message)
{
    if (sMessageBoxMode != FIELD_MESSAGE_BOX_HIDDEN)
    {
        return FALSE;
    }
    else
    {
        textbox_fdecode_auto_and_task_add(message);
        sMessageBoxMode = FIELD_MESSAGE_BOX_NORMAL;
        return TRUE;
    }
}

bool8 box_related_two__3(u8 *message)
{
    if (sMessageBoxMode != FIELD_MESSAGE_BOX_HIDDEN)
    {
        return FALSE;
    }
    else
    {
        sMessageBoxMode = FIELD_MESSAGE_BOX_AUTO_SCROLL;
        textbox_fdecode_auto_and_task_add(message);
        return TRUE;
    }
}

bool8 unref_sub_8064BB8(u8 *message)
{
    sMessageBoxMode = FIELD_MESSAGE_BOX_AUTO_SCROLL;
    textbox_fdecode_auto_and_task_add(message);
    return TRUE;
}

bool8 unref_sub_8064BD0(u8 *message)
{
    if (sMessageBoxMode != FIELD_MESSAGE_BOX_HIDDEN)
    {
        return FALSE;
    }
    else
    {
        sMessageBoxMode = FIELD_MESSAGE_BOX_NORMAL;
        textbox_auto_and_task_add();
        return TRUE;
    }
}

void textbox_fdecode_auto_and_task_add(u8 *message)
{
    StringExpandPlaceholders(gStringVar4, message);
    sub_8002EB0(&gFieldMessageBoxWindow, gStringVar4, gMenuTextTileOffset, 2, 15);
    task_add_textbox();
}

void textbox_auto_and_task_add(void)
{
    sub_8002EB0(&gFieldMessageBoxWindow, gStringVar4, gMenuTextTileOffset, 2, 15);
    task_add_textbox();
}

void textbox_close()
{
    task_del_textbox();
    sub_806536C(&gFieldMessageBoxWindow);
    sMessageBoxMode = FIELD_MESSAGE_BOX_HIDDEN;
}

u8 textbox_any_visible()
{
    return sMessageBoxMode;
}

bool8 sub_8064C84()
{
    if (sMessageBoxMode == FIELD_MESSAGE_BOX_HIDDEN)
        return TRUE;
    else
        return FALSE;
}

void unref_sub_8064CA0()
{
    task_del_textbox();
    DrawStandardMessageBox(&gFieldMessageBoxWindow);
    sMessageBoxMode = FIELD_MESSAGE_BOX_HIDDEN;
}
