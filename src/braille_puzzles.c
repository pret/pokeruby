#include "global.h"
#include "braille_puzzles.h"
#include "asm.h"
#include "event_data.h"
#include "field_camera.h"
#include "field_effect.h"
#include "flags.h"
#include "map_obj_lock.h"
#include "menu.h"
#include "rom6.h"
#include "script.h"
#include "songs.h"
#include "sound.h"
#include "species.h"
#include "task.h"
#include "text.h"

extern u8 gPlayerPartyCount;
extern u8 gLastFieldPokeMenuOpened;

extern u32 gUnknown_0202FF84[];

extern u8 gIslandCave_EventScript_OpenRegiiceChamber[]; // regiice event script

bool8 ShouldDoBrailleDigEffect(void)
{
    if (!FlagGet(SYS_BRAILLE_DIG) && (gSaveBlock1.location.mapGroup == 0x18 && gSaveBlock1.location.mapNum == 0x47))
    {
        if (gSaveBlock1.pos.x == 10 && gSaveBlock1.pos.y == 3)
            return TRUE;
        else if (gSaveBlock1.pos.x == 9 && gSaveBlock1.pos.y == 3)
            return TRUE;
        else if (gSaveBlock1.pos.x == 11 && gSaveBlock1.pos.y == 3)
            return TRUE;
    }

    return FALSE;
}

void DoBrailleDigEffect(void)
{
    MapGridSetMetatileIdAt(16, 8, 554);
    MapGridSetMetatileIdAt(17, 8, 555);
    MapGridSetMetatileIdAt(18, 8, 556);
    MapGridSetMetatileIdAt(16, 9, 3634);
    MapGridSetMetatileIdAt(17, 9, 563);
    MapGridSetMetatileIdAt(18, 9, 3636);
    DrawWholeMapView();
    PlaySE(SE_BAN);
    FlagSet(SYS_BRAILLE_DIG);
    ScriptContext2_Disable();
}

bool8 CheckRelicanthWailord(void)
{
    if (GetMonData(&gPlayerParty, MON_DATA_SPECIES2, 0) == SPECIES_RELICANTH)
    {
        CalculatePlayerPartyCount();

        if (GetMonData(&gPlayerParty[gPlayerPartyCount - 1], MON_DATA_SPECIES2, 0) == SPECIES_WAILORD)
            return TRUE;
    }
    return FALSE;
}

bool8 ShouldDoBrailleStrengthEffect(void)
{
    if (!FlagGet(SYS_BRAILLE_STRENGTH) && (gSaveBlock1.location.mapGroup == 0x18 && gSaveBlock1.location.mapNum == 0x6))
    {
        if (gSaveBlock1.pos.x == 10 && gSaveBlock1.pos.y == 23)
            return TRUE;
        else if (gSaveBlock1.pos.x == 9 && gSaveBlock1.pos.y == 23)
            return TRUE;
        else if (gSaveBlock1.pos.x == 11 && gSaveBlock1.pos.y == 23)
            return TRUE;
    }

    return FALSE;
}

void DoBrailleStrengthEffect(void)
{
    FieldEffectActiveListRemove(0x28);
    MapGridSetMetatileIdAt(14, 26, 554);
    MapGridSetMetatileIdAt(15, 26, 555);
    MapGridSetMetatileIdAt(16, 26, 556);
    MapGridSetMetatileIdAt(14, 27, 3634);
    MapGridSetMetatileIdAt(15, 27, 563);
    MapGridSetMetatileIdAt(16, 27, 3636);
    DrawWholeMapView();
    PlaySE(SE_BAN);
    FlagSet(SYS_BRAILLE_STRENGTH);
    ScriptContext2_Disable();
}

bool8 ShouldDoBrailleFlyEffect(void)
{
    if (!FlagGet(SYS_BRAILLE_FLY) && (gSaveBlock1.location.mapGroup == 0x18 && gSaveBlock1.location.mapNum == 0x44))
    {
        if (gSaveBlock1.pos.x == 8 && gSaveBlock1.pos.y == 25)
            return TRUE;
    }

    return FALSE;
}

void DoBrailleFlyEffect(void)
{
    gUnknown_0202FF84[0] = gLastFieldPokeMenuOpened;
    FieldEffectStart(0x3C);
}

bool8 FldEff_UseFlyAncientTomb(void)
{
    u8 taskId = oei_task_add();

    gTasks[taskId].data[8] = (u32)UseFlyAncientTomb_Callback >> 16;
    gTasks[taskId].data[9] = (u32)UseFlyAncientTomb_Callback;
    return FALSE;
}

void UseFlyAncientTomb_Callback(void)
{
    FieldEffectActiveListRemove(0x3C);
    UseFlyAncientTomb_Finish();
}

void UseFlyAncientTomb_Finish(void)
{
    MapGridSetMetatileIdAt(14, 26, 554);
    MapGridSetMetatileIdAt(15, 26, 555);
    MapGridSetMetatileIdAt(16, 26, 556);
    MapGridSetMetatileIdAt(14, 27, 3634);
    MapGridSetMetatileIdAt(15, 27, 563);
    MapGridSetMetatileIdAt(16, 27, 3636);
    DrawWholeMapView();
    PlaySE(SE_BAN);
    FlagSet(SYS_BRAILLE_FLY);
    ScriptContext2_Disable();
}

void DoBrailleWait(void)
{
    if (!FlagGet(SYS_BRAILLE_WAIT))
        CreateTask(Task_BrailleWait, 0x50);
}

void Task_BrailleWait(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        data[1] = 7200;
        data[0] = 1;
        break;
    case 1:
        if (BrailleWait_CheckButtonPress() != FALSE)
        {
            MenuZeroFillScreen();
            PlaySE(5);
            data[0] = 2;
        }
        else
        {
            data[1] = data[1] - 1;
            if (data[1] == 0)
            {
                MenuZeroFillScreen();
                data[0] = 3;
                data[1] = 30;
            }
        }
        break;
    case 2:
        if (BrailleWait_CheckButtonPress() == FALSE)
        {
            data[1] = data[1] - 1;
            if (data[1] == 0)
                data[0] = 4;
            break;
        }
        sub_8064E2C();
        DestroyTask(taskId);
        ScriptContext2_Disable();
        break;
    case 3:
        data[1] = data[1] - 1;
        if (data[1] == 0)
            data[0] = 4;
        break;
    case 4:
        sub_8064E2C();
        ScriptContext1_SetupScript(gIslandCave_EventScript_OpenRegiiceChamber);
        DestroyTask(taskId);
        break;
    }
}

bool32 BrailleWait_CheckButtonPress(void)
{
    u16 var = 0xFF;

    if (gSaveBlock2.optionsButtonMode == 1)
        var |= 0x300;
    if (gSaveBlock2.optionsButtonMode == 2)
        var |= 0x200;

    if ((var & gMain.newKeys) != FALSE)
        return TRUE;
    else
        return FALSE;
}

void DoSealedChamberShakingEffect1(void)
{
    u8 taskId = CreateTask(SealedChamberShakingEffect, 0x9);

    gTasks[taskId].data[1] = 0;
    gTasks[taskId].data[2] = 0;
    gTasks[taskId].data[4] = 2;
    gTasks[taskId].data[5] = 5;
    gTasks[taskId].data[6] = 50;
    SetCameraPanningCallback(0);
}

void DoSealedChamberShakingEffect2(void)
{
    u8 taskId = CreateTask(SealedChamberShakingEffect, 0x9);

    gTasks[taskId].data[1] = 0;
    gTasks[taskId].data[2] = 0;
    gTasks[taskId].data[4] = 3;
    gTasks[taskId].data[5] = 5;
    gTasks[taskId].data[6] = 2;
    SetCameraPanningCallback(0);
}

void SealedChamberShakingEffect(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    task->data[1]++;

    if (!(task->data[1] % task->data[5]))
    {
        task->data[1] = 0;
        task->data[2]++;
        task->data[4] = -task->data[4];
        SetCameraPanning(0, task->data[4]);
        if (task->data[2] == task->data[6])
        {
            DestroyTask(taskId);
            EnableBothScriptContexts();
            InstallCameraPanAheadCallback();
        }
    }
}
