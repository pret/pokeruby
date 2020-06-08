#include "global.h"
#include "play_time.h"

enum
{
    STOPPED,
    RUNNING,
    MAXED_OUT
};

static u8 sPlayTimeCounterState;

void PlayTimeCounter_Reset()
{
    sPlayTimeCounterState = STOPPED;

    gSaveBlock2.playTimeHours = 0;
    gSaveBlock2.playTimeMinutes = 0;
    gSaveBlock2.playTimeSeconds = 0;
    gSaveBlock2.playTimeVBlanks = 0;
}

void PlayTimeCounter_Start()
{
    sPlayTimeCounterState = RUNNING;

    if (gSaveBlock2.playTimeHours > 999)
        PlayTimeCounter_SetToMax();
}

void PlayTimeCounter_Stop()
{
    sPlayTimeCounterState = STOPPED;
}

void PlayTimeCounter_Update(void)
{
    if (sPlayTimeCounterState != RUNNING)
        return;

    gSaveBlock2.playTimeVBlanks++;

    if (gSaveBlock2.playTimeVBlanks < 60)
        return;

    gSaveBlock2.playTimeVBlanks = 0;
    gSaveBlock2.playTimeSeconds++;

    if (gSaveBlock2.playTimeSeconds < 60)
        return;

    gSaveBlock2.playTimeSeconds = 0;
    gSaveBlock2.playTimeMinutes++;

    if (gSaveBlock2.playTimeMinutes < 60)
        return;

    gSaveBlock2.playTimeMinutes = 0;
    gSaveBlock2.playTimeHours++;

    if (gSaveBlock2.playTimeHours > 999)
        PlayTimeCounter_SetToMax();
}

void PlayTimeCounter_SetToMax()
{
    sPlayTimeCounterState = MAXED_OUT;

    gSaveBlock2.playTimeHours = 999;
    gSaveBlock2.playTimeMinutes = 59;
    gSaveBlock2.playTimeSeconds = 59;
    gSaveBlock2.playTimeVBlanks = 59;
}
