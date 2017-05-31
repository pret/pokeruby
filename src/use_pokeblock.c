//
// Created by Scott Norton on 5/31/17.
//

#include "global.h"
#include "main.h"
#include "pokemon.h"
#include "pokenav.h"
#include "use_pokeblock.h"

asm(".text");

extern struct UnkPokenavStruct_Sub1 *gUnknown_02039304;
void launch_c3_walk_stairs_and_run_once(void *);
void sub_8136244(void);
void sub_8136294(void);

void sub_8136130(u32 a0, u32 a1)
{
    gUnknown_02039304 = &gUnknown_083DFEC4->unkD164;
    gUnknown_02039304->unk8 = a0;
    gUnknown_02039304->unk4 = a1;
    gUnknown_083DFEC4->unkD162[0] = 2;
    launch_c3_walk_stairs_and_run_once(sub_8136294);
    SetMainCallback2(sub_8136244);
}
