//
// Created by Scott Norton on 5/31/17.
//

#include "global.h"
#include "main.h"
#include "asm.h"
#include "sprite.h"
#include "pokemon.h"
#include "pokenav.h"
#include "palette.h"
#include "use_pokeblock.h"

asm(".text");

void *gUnknown_02039308;
void *gUnknown_0203930C;
u8 gUnknown_02039310;

extern struct UnkPokenavStruct_Sub1 *gUnknown_02039304;
void launch_c3_walk_stairs_and_run_once(void (*const)(void));
void sub_81361E4(void);
void sub_813622C(void);
void sub_8136244(void);
void sub_8136294(void);
void sub_81365C8(void);
void sub_81368A4(void);
u8 sub_81370E4(u8);

void sub_8136130(void *a0, void *a1)
{
    gUnknown_02039304 = &gUnknown_083DFEC4->unkD164;
    gUnknown_02039304->unk8 = a0;
    gUnknown_02039304->unk4 = a1;
    gUnknown_083DFEC4->unkD162[0] = 2;
    launch_c3_walk_stairs_and_run_once(sub_8136294);
    SetMainCallback2(sub_8136244);
}

void sub_8136174(void)
{
    gUnknown_02039304->unk8 = gUnknown_0203930C;
    gUnknown_02039304->unk4 = gUnknown_02039308;
    gUnknown_02039310 = sub_81370E4(gUnknown_02039310);
    gUnknown_02039304->unk56 = gUnknown_02039310 < 4 ? 0 : 1;
    gUnknown_083DFEC4->unkD162[0] = 2;
    launch_c3_walk_stairs_and_run_once(sub_8136294);
    SetMainCallback2(sub_81361E4);
}

void sub_81361E4(void)
{
    gUnknown_02039304->unk0();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    if (gUnknown_02039304->unk0 == sub_81365C8)
    {
        REG_DISPCNT = 0;
        gUnknown_02039304->unk50 = 0;
        SetMainCallback2(sub_813622C);
    }
}

void sub_813622C(void)
{
    sub_81368A4();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_8136244(void)
{
    gUnknown_02039304->unk0();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_8136264(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    sub_80F5CDC(6);
    sub_8089668();
}

void launch_c3_walk_stairs_and_run_once(void (*const func)(void))
{
    gUnknown_02039304->unk0 = func;
    gUnknown_02039304->unk50 = 0;
}
