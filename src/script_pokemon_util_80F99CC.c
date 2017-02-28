#include "global.h"
#include "script.h"
#include "task.h"
#include "palette.h"
#include "battle_party_menu.h"

extern u8 gPlayerPartyCount;

extern void OpenPartyMenu(u8, u8);
extern void TryCreatePartyMenuMonIcon(u8, u8, struct Pokemon *);
extern void LoadHeldItemIconGraphics(void);
extern void CreateHeldItemIcons_806DC34(); // undefined args
extern u8 sub_806BD58(u8, u8);
extern void PartyMenuPrintMonsLevelOrStatus(void);
extern void PrintPartyMenuMonNicknames(void);
extern void sub_80F9C00(void);
extern u8 sub_806B58C(u8);

void sub_80F9A8C(u8);

void sub_80F99CC(void)
{
    u8 taskId;

    ScriptContext2_Enable();
    taskId = CreateTask((void *)sub_80F9A8C, 0xA);
    gTasks[taskId].data[0] = 2;
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
}

void sub_80F9A0C(void)
{
    u8 taskId;

    ScriptContext2_Enable();
    taskId = CreateTask((void *)sub_80F9A8C, 0xA);
    gTasks[taskId].data[0] = 3;
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
}

void sub_80F9A4C(void)
{
    u8 taskId;

    ScriptContext2_Enable();
    taskId = CreateTask((void *)sub_80F9A8C, 0xA);
    gTasks[taskId].data[0] = 7;
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
}

void sub_80F9A8C(u8 taskId)
{
    if(!gPaletteFade.active)
    {
        gPaletteFade.bufferTransferDisabled = 1;
        OpenPartyMenu(gTasks[taskId].data[0], 0);
        DestroyTask(taskId);
    }
}

bool8 sub_80F9ACC(void)
{
    switch(EWRAM_1B000.unk264)
    {
        case 0:
            if(EWRAM_1B000.unk266 < gPlayerPartyCount)
            {
                TryCreatePartyMenuMonIcon(EWRAM_1B000.unk260, EWRAM_1B000.unk266, &gPlayerParty[EWRAM_1B000.unk266]);
                EWRAM_1B000.unk266++;
            }
            else
            {
                EWRAM_1B000.unk266 = 0;
                EWRAM_1B000.unk264++;
                
            }
            break;
        case 1:
            LoadHeldItemIconGraphics();
            EWRAM_1B000.unk264++;
            break;
        case 2:
            CreateHeldItemIcons_806DC34(EWRAM_1B000.unk260);
            EWRAM_1B000.unk264++;
            break;
        case 3:
            if(sub_806BD58(EWRAM_1B000.unk260, EWRAM_1B000.unk266) != 1)
            {
                EWRAM_1B000.unk266++;
                break;
            }
            else
            {
                EWRAM_1B000.unk266 = 0;
                EWRAM_1B000.unk264++;
                break;
            }
        case 4:
            PartyMenuPrintMonsLevelOrStatus();
            EWRAM_1B000.unk264++;
            break;
        case 5:
            PrintPartyMenuMonNicknames();
            EWRAM_1B000.unk264++;
            break;
        case 6:
            sub_80F9C00();
            EWRAM_1B000.unk264++;
            break;
        case 7: // the only case that can return true.
            if(sub_806B58C(EWRAM_1B000.unk266) != 1)
            {
                EWRAM_1B000.unk266++;
                break;
            }
            else
            {
                EWRAM_1B000.unk266 = 0;
                EWRAM_1B000.unk264 = 0;
                return TRUE;
            }
    }
    return FALSE;
}
