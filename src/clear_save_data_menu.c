#include "global.h"
#include "task.h"

extern bool8 sub_8148970(void);
extern void sub_8148830(u8);
extern void sub_81488BC(u8);

extern u8 gSystemText_ClearAllSaveDataPrompt[];
extern u8 *gUnknown_08376D74[][2];

void c2_clear_save_data_screen_2(void)
{
    if (sub_8148970())
    {
        CreateTask(sub_8148830, 0);
    }
}

void sub_814881C(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_8148830(u8 taskId)
{
    ResetSpriteData();

    REG_DISPCNT = DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG3_ON | DISPCNT_OBJ_ON;

    SetVBlankCallback(sub_814881C);
    MenuDrawTextWindow(2, 14, 27, 19);
    MenuPrint(gSystemText_ClearAllSaveDataPrompt, 3, 15);

    MenuDrawTextWindow(2, 1, 8, 6);
    PrintMenuItems(3, 2, 2, gUnknown_08376D74);
    InitMenu(0, 3, 2, 2, 1, 5);

    gTasks[taskId].func = sub_81488BC;
}
