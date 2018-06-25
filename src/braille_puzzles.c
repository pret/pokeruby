#include "global.h"
#include "braille_puzzles.h"
#include "event_data.h"
#include "field_camera.h"
#include "field_effect.h"
#include "fieldmap.h"
#include "main.h"
#include "event_obj_lock.h"
#include "menu.h"
#include "rom6.h"
#include "script.h"
#include "sound.h"
#include "task.h"
#include "text.h"
#include "constants/field_effects.h"
#include "constants/flags.h"
#include "constants/maps.h"
#include "constants/songs.h"
#include "constants/species.h"

extern u8 gPlayerPartyCount;
extern u8 gLastFieldPokeMenuOpened;

extern u8 S_OpenRegiceChamber[]; // regiice event script

bool8 ShouldDoBrailleDigEffect(void)
{
    if (!FlagGet(FLAG_SYS_BRAILLE_DIG)
     && (gSaveBlock1.location.mapGroup == MAP_GROUP(SEALED_CHAMBER_OUTER_ROOM)
     && gSaveBlock1.location.mapNum == MAP_NUM(SEALED_CHAMBER_OUTER_ROOM)))
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
    FlagSet(FLAG_SYS_BRAILLE_DIG);
    ScriptContext2_Disable();
}

bool8 CheckRelicanthWailord(void)
{
    // First comes Relicanth.
    if (GetMonData(&gPlayerParty, MON_DATA_SPECIES2, 0) == SPECIES_RELICANTH)
    {
        CalculatePlayerPartyCount();
        // Last comes Wailord
        if (GetMonData(&gPlayerParty[gPlayerPartyCount - 1], MON_DATA_SPECIES2, 0) == SPECIES_WAILORD)
            return TRUE;
    }
    return FALSE;
}

bool8 ShouldDoBrailleStrengthEffect(void)
{
    if (!FlagGet(FLAG_SYS_BRAILLE_STRENGTH) && (gSaveBlock1.location.mapGroup == MAP_GROUP(DESERT_RUINS) && gSaveBlock1.location.mapNum == MAP_NUM(DESERT_RUINS)))
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
    FieldEffectActiveListRemove(FLDEFF_USE_STRENGTH);
    MapGridSetMetatileIdAt(14, 26, 554);
    MapGridSetMetatileIdAt(15, 26, 555);
    MapGridSetMetatileIdAt(16, 26, 556);
    MapGridSetMetatileIdAt(14, 27, 3634);
    MapGridSetMetatileIdAt(15, 27, 563);
    MapGridSetMetatileIdAt(16, 27, 3636);
    DrawWholeMapView();
    PlaySE(SE_BAN);
    FlagSet(FLAG_SYS_BRAILLE_STRENGTH);
    ScriptContext2_Disable();
}

bool8 ShouldDoBrailleFlyEffect(void)
{
    if (!FlagGet(FLAG_SYS_BRAILLE_FLY) && (gSaveBlock1.location.mapGroup == MAP_GROUP(ANCIENT_TOMB) && gSaveBlock1.location.mapNum == MAP_NUM(ANCIENT_TOMB)))
    {
        if (gSaveBlock1.pos.x == 8 && gSaveBlock1.pos.y == 25)
            return TRUE;
    }

    return FALSE;
}

void DoBrailleFlyEffect(void)
{
    gFieldEffectArguments[0] = gLastFieldPokeMenuOpened;
    FieldEffectStart(FLDEFF_USE_FLY_ANCIENT_TOMB);
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
    FieldEffectActiveListRemove(FLDEFF_USE_FLY_ANCIENT_TOMB);
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
    FlagSet(FLAG_SYS_BRAILLE_FLY);
    ScriptContext2_Disable();
}

void DoBrailleWait(void)
{
    if (!FlagGet(FLAG_SYS_BRAILLE_WAIT))
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
            Menu_EraseScreen();
            PlaySE(SE_SELECT);
            data[0] = 2;
        }
        else
        {
            data[1] = data[1] - 1;
            if (data[1] == 0)
            {
                Menu_EraseScreen();
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
        ScriptUnfreezeEventObjects();
        DestroyTask(taskId);
        ScriptContext2_Disable();
        break;
    case 3:
        data[1] = data[1] - 1;
        if (data[1] == 0)
            data[0] = 4;
        break;
    case 4:
        ScriptUnfreezeEventObjects();
        ScriptContext1_SetupScript(S_OpenRegiceChamber);
        DestroyTask(taskId);
        break;
    }
}

bool32 BrailleWait_CheckButtonPress(void)
{
    u16 keyMask = A_BUTTON | B_BUTTON | START_BUTTON | SELECT_BUTTON | DPAD_ANY;

    if (gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR)
        keyMask |= L_BUTTON | R_BUTTON;
    if (gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_L_EQUALS_A)
        keyMask |= L_BUTTON;

    if (gMain.newKeys & keyMask)
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
