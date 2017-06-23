//
// Created by scott on 6/22/2017.
//

#include "global.h"
#include "task.h"
#include "main.h"
#include "rom4.h"
#include "clock.h"
#include "script.h"
#include "field_special_scene.h"
#include "secret_base.h"
#include "field_tasks.h"

void DummyPerStepCallback(u8);
void PerStepCallback_8069F64(u8);
void PerStepCallback_8069AA0(u8);
void PerStepCallback_8069864(u8);
void PerStepCallback_8069DD4(u8);
void PerStepCallback_806A07C(u8);

void (*const gUnknown_08376364[])(u8) = {
    DummyPerStepCallback,
    PerStepCallback_8069F64,
    PerStepCallback_8069AA0,
    PerStepCallback_8069864,
    PerStepCallback_8069DD4,
    EndTruckSequence,
    sub_80BCF1C,
    PerStepCallback_806A07C
};

void Task_RunPerStepCallback(u8 taskId)
{
    int idx = gTasks[taskId].data[0];
    gUnknown_08376364[idx](taskId);
}

void RunTimeBasedEvents(s16 *taskData)
{
    switch (*taskData)
    {
        case 0:
            if (gMain.vblankCounter1 & 0x1000)
            {
                DoTimeBasedEvents();
                (*taskData)++;
            }
            break;
        case 1:
            if (!(gMain.vblankCounter1 & 0x1000))
            {
                (*taskData)--;
            }
            break;
    }
}

void Task_RunTimeBasedEvents(u8 taskId)
{
    s16 *taskData = gTasks[taskId].data;
    if (!ScriptContext2_IsEnabled())
    {
        RunTimeBasedEvents(taskData);
        sub_80540D0(taskData + 1, taskData + 2);
    }
}
