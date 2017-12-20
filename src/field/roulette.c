
// Includes
#include "global.h"
#include "task.h"
#include "ewram.h"
#include "roulette_util.h"
#include "roulette.h"

// Static type declarations

struct RouletteData {
    u8 filler_000[0xb8];
    roulette_util_t unk_0b8;
};

// Static RAM declarations

// Static ROM declarations

// .rodata

// .text

void CB2_Roulette(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    if (eRoulette1->unk_0b8.unk_00)
    {
        task_tutorial_controls_fadein(&eRoulette1->unk_0b8);
    }
}
