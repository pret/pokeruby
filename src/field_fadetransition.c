#include "global.h"
#include "cable_club.h"
#include "fieldmap.h"
#include "field_door.h"
#include "field_effect.h"
#include "field_fadetransition.h"
#include "event_object_movement.h"
#include "field_player_avatar.h"
#include "field_special_scene.h"
#include "field_weather.h"
#include "fldeff_flash.h"
#include "link.h"
#include "main.h"
#include "map_obj_lock.h"
#include "metatile_behavior.h"
#include "palette.h"
#include "overworld.h"
#include "script.h"
#include "constants/songs.h"
#include "sound.h"
#include "start_menu.h"
#include "task.h"

void sub_8080B9C(u8);
void task_map_chg_seq_0807E20C(u8);
void task_map_chg_seq_0807E2CC(u8);
void task0A_fade_n_map_maybe(u8);
void sub_808115C(u8);

void palette_bg_fill_white(void)
{
    CpuFastFill16(RGB_WHITE, gPlttBufferFaded, PLTT_SIZE);
}

void palette_bg_fill_black(void)
{
    CpuFastFill16(RGB_BLACK, gPlttBufferFaded, PLTT_SIZE);
}

void pal_fill_for_map_transition(void)
{
    u8 map_light = get_map_type_from_warp0();
    switch (fade_type_for_given_maplight_pair(map_light, Overworld_GetMapTypeOfSaveblockLocation()))
    {
    case 0:
        FadeScreen(0, 0);
        palette_bg_fill_black();
        break;
    case 1:
        FadeScreen(2, 0);
        palette_bg_fill_white();
    }
}

void pal_fill_black(void)
{
    FadeScreen(0, 0);
    palette_bg_fill_black();
}

void fade_8080918(void)
{
    u8 light_level = Overworld_GetMapTypeOfSaveblockLocation();
    switch (sub_810CDB8(light_level, warp1_get_mapheader()->mapType))
    {
    case 0:
        FadeScreen(1, 0);
        break;
    case 1:
        FadeScreen(3, 0);
    }
}

void sub_8080958(u8 arg)
{
    sub_8059B88(!arg);
}

void task0A_asap_script_env_2_enable_and_set_ctx_running(u8 taskID)
{
    if (sub_8080E70() == TRUE)
    {
        DestroyTask(taskID);
        EnableBothScriptContexts();
    }
}

void sub_8080990(void)
{
    ScriptContext2_Enable();
    Overworld_PlaySpecialMapMusic();
    pal_fill_black();
    CreateTask(task0A_asap_script_env_2_enable_and_set_ctx_running, 10);
}

void sub_80809B0(void)
{
    ScriptContext2_Enable();
    pal_fill_black();
    CreateTask(task0A_asap_script_env_2_enable_and_set_ctx_running, 10);
}

void task_mpl_807DD60(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        task->data[1] = sub_8083664();
        task->data[0]++;
        break;
    case 1:
        if (gTasks[task->data[1]].isActive != TRUE)
        {
            pal_fill_for_map_transition();
            task->data[0]++;
        }
        break;
    case 2:
        if (sub_8080E70() == TRUE)
        {
            ScriptContext2_Disable();
            DestroyTask(taskId);
        }
    }
}

void sub_8080A3C(void)
{
    ScriptContext2_Enable();
    Overworld_PlaySpecialMapMusic();
    palette_bg_fill_black();
    CreateTask(task_mpl_807DD60, 10);
}

void sub_8080A5C(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        sub_80084A4();
        task->data[0]++;
        break;
    case 1:
        if (IsLinkTaskFinished())
        {
            pal_fill_for_map_transition();
            task->data[0]++;
        }
        break;
    case 2:
        if (sub_8080E70() == TRUE)
        {
            sub_8007B14();
            ScriptContext2_Disable();
            DestroyTask(taskId);
        }
    }
}

void sub_8080AC4(void)
{
    ScriptContext2_Enable();
    Overworld_PlaySpecialMapMusic();
    palette_bg_fill_black();
    CreateTask(sub_8080A5C, 10);
}

void sub_8080AE4(void)
{
    s16 x, y;
    u8 behavior;
    TaskFunc func;
    PlayerGetDestCoords(&x, &y);
    behavior = MapGridGetMetatileBehaviorAt(x, y);
    if (MetatileBehavior_IsDoor(behavior) == TRUE)
        func = sub_8080B9C;
    else if (MetatileBehavior_IsNonAnimDoor(behavior) == TRUE)
        func = task_map_chg_seq_0807E20C;
    else
        func = task_map_chg_seq_0807E2CC;
    CreateTask(func, 10);
}

void mapldr_default(void)
{
    Overworld_PlaySpecialMapMusic();
    pal_fill_for_map_transition();
    sub_8080AE4();
    ScriptContext2_Enable();
}

void sub_8080B60(void)
{
    Overworld_PlaySpecialMapMusic();
    pal_fill_black();
    sub_8080AE4();
    ScriptContext2_Enable();
}

void sub_8080B78(void)
{
    Overworld_PlaySpecialMapMusic();
    pal_fill_for_map_transition();
    PlaySE(SE_TK_WARPOUT);
    CreateTask(task_map_chg_seq_0807E2CC, 10);
    ScriptContext2_Enable();
}

void sub_8080B9C(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    s16 *x = &task->data[2];
    s16 *y = &task->data[3];

    switch (task->data[0])
    {
    case 0:
        sub_8080958(0);
        FreezeMapObjects();
        PlayerGetDestCoords(x, y);
        FieldSetDoorOpened(*x, *y);
        task->data[0] = 1;
        break;
    case 1:
        if (sub_8080E70())
        {
            u8 mapObjId;
            sub_8080958(1);
            mapObjId = GetFieldObjectIdByLocalIdAndMap(0xFF, 0, 0);
            FieldObjectSetSpecialAnim(&gMapObjects[mapObjId], 8);
            task->data[0] = 2;
        }
        break;
    case 2:
        if (walkrun_is_standing_still())
        {
            u8 mapObjId;
            task->data[1] = FieldAnimateDoorClose(*x, *y);
            mapObjId = GetFieldObjectIdByLocalIdAndMap(0xFF, 0, 0);
            FieldObjectClearAnimIfSpecialAnimFinished(&gMapObjects[mapObjId]);
            task->data[0] = 3;
        }
        break;
    case 3:
        if (task->data[1] < 0 || gTasks[task->data[1]].isActive != TRUE)
        {
            UnfreezeMapObjects();
            task->data[0] = 4;
        }
        break;
    case 4:
        ScriptContext2_Disable();
        DestroyTask(taskId);
        break;
    }
}

void task_map_chg_seq_0807E20C(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    s16 *x = &task->data[2];
    s16 *y = &task->data[3];

    switch (task->data[0])
    {
    case 0:
        sub_8080958(0);
        FreezeMapObjects();
        PlayerGetDestCoords(x, y);
        task->data[0] = 1;
        break;
    case 1:
        if (sub_8080E70())
        {
            u8 mapObjId;
            sub_8080958(1);
            mapObjId = GetFieldObjectIdByLocalIdAndMap(0xFF, 0, 0);
            FieldObjectSetSpecialAnim(&gMapObjects[mapObjId], GetGoSpeed0AnimId(player_get_direction_lower_nybble()));
            task->data[0] = 2;
        }
        break;
    case 2:
        if (walkrun_is_standing_still())
        {
            UnfreezeMapObjects();
            task->data[0] = 3;
        }
        break;
    case 3:
        ScriptContext2_Disable();
        DestroyTask(taskId);
        break;
    }
}

void task_map_chg_seq_0807E2CC(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
    case 0:
        FreezeMapObjects();
        ScriptContext2_Enable();
        gTasks[taskId].data[0]++;
        break;
    case 1:
        if (sub_8080E70())
        {
            UnfreezeMapObjects();
            ScriptContext2_Disable();
            DestroyTask(taskId);
        }
        break;
    }
}

void sub_8080DC4(u8 taskId)
{
    if (sub_8080E70() == TRUE)
    {
        DestroyTask(taskId);
        CreateTask(sub_80712B4, 80);
    }
}

void sub_8080DEC(void)
{
    pal_fill_black();
    CreateStartMenuTask(sub_8080DC4);
    ScriptContext2_Enable();
}

void task_mpl_807E3C8(u8 taskId)
{
    if (sub_8080E70() == 1)
    {
        ScriptContext2_Disable();
        DestroyTask(taskId);
        sub_8064E2C();
    }
}

void sub_8080E28(void)
{
    ScriptContext2_Enable();
    pal_fill_black();
    CreateTask(task_mpl_807E3C8, 10);
}

void sub_8080E44(void)
{
    ScriptContext2_Enable();
    Overworld_PlaySpecialMapMusic();
    pal_fill_black();
    CreateTask(task_mpl_807E3C8, 10);
}

bool32 sub_8080E64(void)
{
    return gPaletteFade.active;
}

bool32 sub_8080E70(void)
{
    if (IsWeatherNotFadingIn() == TRUE)
        return TRUE;
    else
        return FALSE;
}

void sub_8080E88(void)
{
    ScriptContext2_Enable();
    sub_8053FF8();
    fade_8080918();
    PlayRainSoundEffect();
    PlaySE(SE_KAIDAN);
    gFieldCallback = mapldr_default;
    CreateTask(task0A_fade_n_map_maybe, 10);
}

void sp13E_warp_to_last_warp(void)
{
    ScriptContext2_Enable();
    sub_8053FF8();
    fade_8080918();
    PlayRainSoundEffect();
    gFieldCallback = mapldr_default;
    CreateTask(task0A_fade_n_map_maybe, 10);
}

void sub_8080EF0(void)
{
    ScriptContext2_Enable();
    gFieldCallback = mapldr_default;
    CreateTask(sub_808115C, 10);
}

void sp13F_fall_to_last_warp(void)
{
    sp13E_warp_to_last_warp();
    gFieldCallback = sub_8086748;
}

void sub_8080F2C(u8 metatileBehavior)
{
    ScriptContext2_Enable();
    sub_8086A2C(metatileBehavior, 10);
}

void sub_8080F48(void)
{
    ScriptContext2_Enable();
    sub_80871B8(10);
}

void sub_8080F58(void)
{
    ScriptContext2_Enable();
    sub_8087654(10);
}

void sub_8080F68(void)
{
    ScriptContext2_Enable();
    sub_8053FF8();
    fade_8080918();
    PlaySE(SE_TK_WARPIN);
    CreateTask(task0A_fade_n_map_maybe, 10);
    gFieldCallback = sub_8080B78;
}

void sub_8080F9C(void)
{
    ScriptContext2_Enable();
    fade_8080918();
    CreateTask(task0A_fade_n_map_maybe, 10);
    gFieldCallback = sub_80C791C;
}

void sub_8080FC4(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        ScriptContext2_Enable();
        task->data[0]++;
        break;
    case 1:
        if (!sub_8080E64() && sub_8054034())
        {
            task->data[0]++;
        }
        break;
    case 2:
        warp_in();
        SetMainCallback2(sub_8054588);
        DestroyTask(taskId);
        break;
    }
}

void DoCableClubWarp(void)
{
    ScriptContext2_Enable();
    sub_8053FF8();
    fade_8080918();
    PlaySE(SE_KAIDAN);
    CreateTask(sub_8080FC4, 10);
}

void sub_8081050(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        ClearLinkCallback_2();
        FadeScreen(1, 0);
        sub_8053FF8();
        PlaySE(SE_KAIDAN);
        data[0]++;
        break;
    case 1:
        if (!sub_8080E64() && sub_8054034())
        {
            sub_800832C();
            data[0]++;
        }
        break;
    case 2:
        if (!gReceivedRemoteLinkPlayers)
        {
            warp_in();
            SetMainCallback2(CB2_LoadMap);
            DestroyTask(taskId);
        }
        break;
    }
}

void sub_80810DC(void)
{
    CreateTask(sub_8081050, 10);
}

#if DEBUG

__attribute__((naked))
void debug_sub_80888D8()
{
    asm("\
    PUSH    {LR}\n\
    BL      debug_sub_8052E04\n\
    BL      sub_8080E88\n\
    BL      ScriptContext2_Enable\n\
    POP     {R0}\n\
    BX      R0");
}

#endif

void task0A_fade_n_map_maybe(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        FreezeMapObjects();
        ScriptContext2_Enable();
        task->data[0]++;
        break;
    case 1:
        if (!sub_8080E64() && sub_8054034())
        {
            task->data[0]++;
        }
        break;
    case 2:
        warp_in();
        SetMainCallback2(CB2_LoadMap);
        DestroyTask(taskId);
        break;
    }
}

void sub_808115C(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    s16 *x = &task->data[2];
    s16 *y = &task->data[3];

    switch (task->data[0])
    {
    case 0:
        FreezeMapObjects();
        PlayerGetDestCoords(x, y);
        PlaySE(GetDoorSoundEffect(*x, *y - 1));
        task->data[1] = FieldAnimateDoorOpen(*x, *y - 1);
        task->data[0] = 1;
        break;
    case 1:
        if (task->data[1] < 0 || gTasks[task->data[1]].isActive != TRUE)
        {
            u8 mapObjId;
            mapObjId = GetFieldObjectIdByLocalIdAndMap(0xFF, 0, 0);
            FieldObjectClearAnimIfSpecialAnimActive(&gMapObjects[mapObjId]);
            mapObjId = GetFieldObjectIdByLocalIdAndMap(0xFF, 0, 0);
            FieldObjectSetSpecialAnim(&gMapObjects[mapObjId], 9);
            task->data[0] = 2;
        }
        break;
    case 2:
        if (walkrun_is_standing_still())
        {
            u8 mapObjId;
            task->data[1] = FieldAnimateDoorClose(*x, *y - 1);
            mapObjId = GetFieldObjectIdByLocalIdAndMap(0xFF, 0, 0);
            FieldObjectClearAnimIfSpecialAnimFinished(&gMapObjects[mapObjId]);
            sub_8080958(0);
            task->data[0] = 3;
        }
        break;
    case 3:
        if (task->data[1] < 0 || gTasks[task->data[1]].isActive != TRUE)
        {
            task->data[0] = 4;
        }
        break;
    case 4:
        sub_8053FF8();
        fade_8080918();
        PlayRainSoundEffect();
        task->data[0] = 0;
        task->func = task0A_fade_n_map_maybe;
        break;
    }
}

void sub_80812C8(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        FreezeMapObjects();
        ScriptContext2_Enable();
        task->data[0]++;
        break;
    case 1:
        if (!sub_8080E64() && sub_8054034())
        {
            task->data[0]++;
        }
        break;
    case 2:
        warp_in();
        SetMainCallback2(sub_8054534);
        DestroyTask(taskId);
        break;
    }
}

void sub_8081334(void)
{
    ScriptContext2_Enable();
    sub_8053FF8();
    fade_8080918();
    PlayRainSoundEffect();
    PlaySE(SE_KAIDAN);
    gFieldCallback = sub_8080B60;
    CreateTask(sub_80812C8, 10);
}
