#include "global.h"

enum
{
    STOPPED,
    RUNNING,
    MAXED_OUT
};

extern u8 gPlayTimeCounterState;

void PlayTimeCounter_SetToMax();

void PlayTimeCounter_Reset()
{
    gPlayTimeCounterState = STOPPED;

    gSaveBlock2.playTimeHours = 0;
    gSaveBlock2.playTimeMinutes = 0;
    gSaveBlock2.playTimeSeconds = 0;
    gSaveBlock2.playTimeVBlanks = 0;
}

void PlayTimeCounter_Start()
{
    gPlayTimeCounterState = RUNNING;

    if (gSaveBlock2.playTimeHours > 999)
        PlayTimeCounter_SetToMax();
}

void PlayTimeCounter_Stop()
{
    gPlayTimeCounterState = STOPPED;
}

void PlayTimeCounter_Update()
{
    if (gPlayTimeCounterState == RUNNING)
    {
        gSaveBlock2.playTimeVBlanks++;

        if (gSaveBlock2.playTimeVBlanks > 59)
        {
            gSaveBlock2.playTimeVBlanks = 0;
            gSaveBlock2.playTimeSeconds++;

            if (gSaveBlock2.playTimeSeconds > 59)
            {
                gSaveBlock2.playTimeSeconds = 0;
                gSaveBlock2.playTimeMinutes++;

                if (gSaveBlock2.playTimeMinutes > 59)
                {
                    gSaveBlock2.playTimeMinutes = 0;
                    gSaveBlock2.playTimeHours++;

                    if (gSaveBlock2.playTimeHours > 999)
                        PlayTimeCounter_SetToMax();
                }
            }
        }
    }
}

void PlayTimeCounter_SetToMax()
{
    gPlayTimeCounterState = MAXED_OUT;

    gSaveBlock2.playTimeHours = 999;
    gSaveBlock2.playTimeMinutes = 59;
    gSaveBlock2.playTimeSeconds = 59;
    gSaveBlock2.playTimeVBlanks = 59;
}
