
// Includes
#include "global.h"
#include "roulette_util.h"

// Static type declarations

// Static RAM declarations

// Static ROM declarations

// .rodata

// .text

void sub_8124918(roulette_util_t *util)
{
    util->unk_00 = 0;
    util->unk_02 = 0;
    memset(&util->unk_04, 0, sizeof(roulette_util_t) - offsetof(roulette_util_t, unk_04)
    );
}
