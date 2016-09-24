#include "global.h"
#include "text.h"
#include "text_window.h"
#include "task.h"
#include "string_util.h"

extern struct Window unk_202E87C;
extern u16 word_202E9D2;

extern u16 gMenuTextTileOffset;

extern u8 byte_30005A8;

void textbox_fdecode_auto_and_task_add(u8 *);
void textbox_auto_and_task_add(void);

void sub_8064A74(void)
{
    byte_30005A8 = 0;
    SetMessageBoxBaseTileNum(word_202E9D2);
    InitWindowFromConfig(&unk_202E87C, (struct WindowConfig *)&gWindowConfig_81E6CE4);
}

void sub_8064AA0(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    switch (task->data[0])
    {
    case 0:
        LoadMessageBoxTiles(&unk_202E87C);
        task->data[0]++;
        break;
    case 1:
        DrawStandardMessageBox(&unk_202E87C);
        task->data[0]++;
        break;
    case 2:
        switch (byte_30005A8)
        {
        case 2:
            if (!sub_80035AC(&unk_202E87C))
                return;
            break;
        case 3:
            if (!sub_8003778(&unk_202E87C))
                return;
            break;
        }
        byte_30005A8 = 0;
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

bool8 box_related_two__2(u8 *a1)
{
    if (byte_30005A8)
    {
        return FALSE;
    }
    else
    {
        textbox_fdecode_auto_and_task_add(a1);
        byte_30005A8 = 2;
        return TRUE;
    }
}

bool8 box_related_two__3(u8 *a1)
{
    if (byte_30005A8)
    {
        return FALSE;
    }
    else
    {
        byte_30005A8 = 3;
        textbox_fdecode_auto_and_task_add(a1);
        return TRUE;
    }
}

bool8 unref_sub_8064BB8(u8 *a1)
{
    byte_30005A8 = 3;
    textbox_fdecode_auto_and_task_add(a1);
    return TRUE;
}

bool8 unref_sub_8064BD0(u8 *a1)
{
    if (byte_30005A8)
    {
        return FALSE;
    }
    else
    {
        byte_30005A8 = 2;
        textbox_auto_and_task_add();
        return TRUE;
    }
}

void textbox_fdecode_auto_and_task_add(u8 *a1)
{
    StringExpandPlaceholders(gStringVar4, a1);
    sub_8002EB0(&unk_202E87C, gStringVar4, gMenuTextTileOffset, 2, 15);
    task_add_textbox();
}

void textbox_auto_and_task_add(void)
{
    sub_8002EB0(&unk_202E87C, gStringVar4, gMenuTextTileOffset, 2, 15);
    task_add_textbox();
}

void textbox_close()
{
    task_del_textbox();
    sub_806536C(&unk_202E87C);
    byte_30005A8 = 0;
}

u8 textbox_any_visible()
{
    return byte_30005A8;
}

bool8 sub_8064C84()
{
    if (byte_30005A8 == 0)
        return TRUE;
    else
        return FALSE;
}

void unref_sub_8064CA0()
{
    task_del_textbox();
    DrawStandardMessageBox(&unk_202E87C);
    byte_30005A8 = 0;
}
