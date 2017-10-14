
// Includes
#include "global.h"
#include "palette.h"
#include "main.h"
#include "task.h"

// Static type declarations

// Static RAM declarations

// Static ROM declarations

void sub_8123244(void);

// .rodata

// .text

void sub_81231EC(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(sub_8123244);
        DestroyTask(taskId);
    }
}
