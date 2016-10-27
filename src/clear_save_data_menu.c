#include "global.h"
#include "task.h"
#include "songs.h"
#include "menu.h"
#include "main.h"
#include "sprite.h"
#include "palette.h"
#include "sound.h"

extern bool8 sub_8148970(void);
extern void sub_8148830(u8);
extern void sub_81488BC(u8);

extern u8 gSystemText_ClearAllSaveDataPrompt[];
extern u8 gSystemText_ClearingData[];
extern u8 *gUnknown_08376D74[][2];

void sub_8148930(u8);
void sub_8148B34(void);

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

void sub_81488BC(u8 taskId)
{
    switch (ProcessMenuInputNoWrap_())
    {
    case 0:
        PlaySE(SE_SELECT);
        sub_8071F40(gSystemText_ClearingData);
        gTasks[taskId].func = sub_8148930;
        break;
    case -1:
    case 1:
        PlaySE(SE_SELECT);
        DestroyTask(taskId);
        SetMainCallback2(sub_8148B34);
        break;
    }
    AnimateSprites();
    BuildOamBuffer();
}
