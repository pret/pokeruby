//
// Created by Scott Norton on 5/31/17.
//

#include "global.h"
#include "main.h"
#include "asm.h"
#include "rom4.h"
#include "pokemon.h"
#include "pokenav.h"
#include "palette.h"
#include "text.h"
#include "menu.h"
#include "use_pokeblock.h"

asm(".text\n"
    ".include \"constants/gba_constants.inc\"");

void *gUnknown_02039308;
void *gUnknown_0203930C;
u8 gUnknown_02039310;

extern struct UnkPokenavStruct_Sub1 *gUnknown_02039304;
extern u16 gKeyRepeatStartDelay;

void launch_c3_walk_stairs_and_run_once(void (*const)(void));
void sub_81361E4(void);
void sub_813622C(void);
void sub_8136244(void);
void sub_8136294(void);
void sub_81365A0(void);
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

#ifdef NONMATCHING
void sub_8136294(void)
{
    u32 dma3sad;
    bool32 c1LinkRelatedActive;
    switch (gUnknown_02039304->unk50)
    {
        case 0:
            c1LinkRelatedActive = is_c1_link_related_active();
            gUnknown_083DFEC4->unk6DAC = c1LinkRelatedActive;
            if ((bool8)c1LinkRelatedActive == FALSE)
            {
                gUnknown_02039304->unk55 = 0;
                launch_c3_walk_stairs_and_run_once(sub_81365A0);
                gUnknown_02039304->unk50++;
            }
            break;
        case 1:
            ResetSpriteData();
            FreeAllSpritePalettes();
            gUnknown_02039304->unk50++;
            break;
        case 2:
            SetVBlankCallback(NULL);
            gUnknown_02039304->unk50++;
            break;
        case 3:
            SetUpWindowConfig(&gWindowConfig_81E7080);
            gUnknown_02039304->unk50++;
            break;
        case 4:
            MultistepInitMenuWindowBegin(&gWindowConfig_81E7080);
            gUnknown_02039304->unk50++;
            break;
        case 5:
            if (MultistepInitMenuWindowContinue())
            {
                gUnknown_02039304->unk50++;
            }
            break;
        case 6:
            gUnknown_083DFEC4->unk76AA = 0;
            gUnknown_083DFEC4->unk87E0 = NULL;
            gUnknown_083DFEC4->unk030C = 0x20;
            gUnknown_02039304->unk50++;
            break;
        case 7:
            sub_80F2688();
            gUnknown_02039304->unk50++;
            // fallthrough
        case 8:
            if (!sub_80F26BC())
            {
                gUnknown_02039304->unk50++;
            }
            break;
        case 9:
            sub_80F2C80(1);
            gUnknown_02039304->unk50++;
            // fallthrough
        case 10:
            if (!sub_80F2CBC(1))
            {
                gUnknown_02039304->unk50++;
            }
            break;
        case 11:
            gKeyRepeatStartDelay = 20;
            gUnknown_083DFEC4->unk8828 = CalculatePlayerPartyCount();
            gUnknown_083DFEC4->unk9344 = 0;
            gUnknown_083DFEC4->unk8768 = NULL;
            sub_80F4BD0();
            gUnknown_083DFEC4->unkD160 = 0;
            gUnknown_02039304->unk50++;
            break;
        case 12:
            if (!sub_80F1778())
            {
                REG_BG2VOFS = 6;
                REG_BG3VOFS = 6;
                gUnknown_02039304->unk50++;
            }
            break;
        case 13:
            sub_80F2E18(0);
            gUnknown_083DFEC4->unk8768->unk26 = 0xffd8;
            gUnknown_02039304->unk50++;
            break;
        case 14:
            if (!sub_80F170C())
            {
                gUnknown_02039304->unk50++;
            }
            break;
        case 15:
            sub_80F33A8();
            gUnknown_02039304->unk50++;
            break;
        case 16:
            dma3sad = 0;
            REG_DMA3SAD = (vu32)&dma3sad;
            REG_DMA3DAD = 0x600F800;
            REG_DMA3CNT = 0x85000200;
            REG_BG1VOFS = 0;
            REG_BG1HOFS = 0;
            REG_BG1CNT = 0x1f00;
            gUnknown_02039304->unk50++;
            break;
        case 17:
            sub_80F567C(&gUnknown_083DFEC4->unk8ff0, &gUnknown_083DFEC4->unk9004);
            sub_80F5B38();
            gUnknown_02039304->unk50++;
            break;
        case 18:
            if (!sub_80F5B50())
            {
                gUnknown_02039304->unk50++;
            }
            break;
        case 19:
            sub_80F556C(&gUnknown_083DFEC4->unk9004);
            gUnknown_02039304->unk50++;
            break;
        case 20:
            sub_80F1934();
            gUnknown_02039304->unk50++;
            break;
        case 21:
            REG_WIN0H = 0xf0;
            REG_WIN1H = 0x9b;
            REG_WIN0V = 0x3273;
            REG_WIN1V = 0x3273;
            REG_WININ = 0x3f3f;
            REG_WINOUT = 0x1b;
            REG_BG0VOFS = 0x28;
            REG_DISPCNT = 0x7f40;
            // fallthrough
        case 22:
            gUnknown_02039304->unk55 = 1;
            launch_c3_walk_stairs_and_run_once(sub_81365C8);
            break;
    }
}
#else
__attribute__((naked))
void sub_8136294(void)
{
    asm(".syntax unified\n"
    "\tpush {r4,r5,lr}\n"
    "\tsub sp, 0x4\n"
    "\tldr r1, _081362B4 @ =gUnknown_02039304\n"
    "\tldr r0, [r1]\n"
    "\tadds r0, 0x50\n"
    "\tldrb r0, [r0]\n"
    "\tadds r3, r1, 0\n"
    "\tcmp r0, 0x16\n"
    "\tbls _081362A8\n"
    "\tb _0813657A\n"
    "_081362A8:\n"
    "\tlsls r0, 2\n"
    "\tldr r1, _081362B8 @ =_081362BC\n"
    "\tadds r0, r1\n"
    "\tldr r0, [r0]\n"
    "\tmov pc, r0\n"
    "\t.align 2, 0\n"
    "_081362B4: .4byte gUnknown_02039304\n"
    "_081362B8: .4byte _081362BC\n"
    "\t.align 2, 0\n"
    "_081362BC:\n"
    "\t.4byte _08136318\n"
    "\t.4byte _08136354\n"
    "\t.4byte _0813635E\n"
    "\t.4byte _08136366\n"
    "\t.4byte _08136374\n"
    "\t.4byte _08136380\n"
    "\t.4byte _0813638C\n"
    "\t.4byte _081363B8\n"
    "\t.4byte _081363C8\n"
    "\t.4byte _081363DC\n"
    "\t.4byte _081363EE\n"
    "\t.4byte _08136404\n"
    "\t.4byte _08136448\n"
    "\t.4byte _08136464\n"
    "\t.4byte _08136488\n"
    "\t.4byte _08136494\n"
    "\t.4byte _0813649A\n"
    "\t.4byte _081364D8\n"
    "\t.4byte _081364FC\n"
    "\t.4byte _08136508\n"
    "\t.4byte _08136520\n"
    "\t.4byte _08136538\n"
    "\t.4byte _0813656C\n"
    "_08136318:\n"
    "\tbl is_c1_link_related_active\n"
    "\tldr r1, _08136344 @ =gUnknown_083DFEC4\n"
    "\tldr r1, [r1]\n"
    "\tldr r2, _08136348 @ =0x00006dac\n"
    "\tadds r1, r2\n"
    "\tstrb r0, [r1]\n"
    "\tlsls r0, 24\n"
    "\tlsrs r1, r0, 24\n"
    "\tcmp r1, 0\n"
    "\tbeq _08136330\n"
    "\tb _0813657A\n"
    "_08136330:\n"
    "\tldr r4, _0813634C @ =gUnknown_02039304\n"
    "\tldr r0, [r4]\n"
    "\tadds r0, 0x55\n"
    "\tstrb r1, [r0]\n"
    "\tldr r0, _08136350 @ =sub_81365A0\n"
    "\tbl launch_c3_walk_stairs_and_run_once\n"
    "\tldr r1, [r4]\n"
    "\tb _08136528\n"
    "\t.align 2, 0\n"
    "_08136344: .4byte gUnknown_083DFEC4\n"
    "_08136348: .4byte 0x00006dac\n"
    "_0813634C: .4byte gUnknown_02039304\n"
    "_08136350: .4byte sub_81365A0\n"
    "_08136354:\n"
    "\tbl ResetSpriteData\n"
    "\tbl FreeAllSpritePalettes\n"
    "\tb _08136524\n"
    "_0813635E:\n"
    "\tmovs r0, 0\n"
    "\tbl SetVBlankCallback\n"
    "\tb _08136524\n"
    "_08136366:\n"
    "\tldr r0, _08136370 @ =gWindowConfig_81E7080\n"
    "\tbl SetUpWindowConfig\n"
    "\tb _08136524\n"
    "\t.align 2, 0\n"
    "_08136370: .4byte gWindowConfig_81E7080\n"
    "_08136374:\n"
    "\tldr r0, _0813637C @ =gWindowConfig_81E7080\n"
    "\tbl MultistepInitMenuWindowBegin\n"
    "\tb _08136524\n"
    "\t.align 2, 0\n"
    "_0813637C: .4byte gWindowConfig_81E7080\n"
    "_08136380:\n"
    "\tbl MultistepInitMenuWindowContinue\n"
    "\tcmp r0, 0\n"
    "\tbne _0813638A\n"
    "\tb _0813657A\n"
    "_0813638A:\n"
    "\tb _08136524\n"
    "_0813638C:\n"
    "\tldr r0, _081363AC @ =gUnknown_083DFEC4\n"
    "\tldr r1, [r0]\n"
    "\tldr r4, _081363B0 @ =0x000076aa\n"
    "\tadds r0, r1, r4\n"
    "\tmovs r2, 0\n"
    "\tstrb r2, [r0]\n"
    "\tldr r4, _081363B4 @ =0x000087e0\n"
    "\tadds r0, r1, r4\n"
    "\tstr r2, [r0]\n"
    "\tmovs r0, 0xC3\n"
    "\tlsls r0, 2\n"
    "\tadds r1, r0\n"
    "\tmovs r0, 0x20\n"
    "\tstrh r0, [r1]\n"
    "\tldr r1, [r3]\n"
    "\tb _08136528\n"
    "\t.align 2, 0\n"
    "_081363AC: .4byte gUnknown_083DFEC4\n"
    "_081363B0: .4byte 0x000076aa\n"
    "_081363B4: .4byte 0x000087e0\n"
    "_081363B8:\n"
    "\tbl sub_80F2688\n"
    "\tldr r0, _081363D8 @ =gUnknown_02039304\n"
    "\tldr r1, [r0]\n"
    "\tadds r1, 0x50\n"
    "\tldrb r0, [r1]\n"
    "\tadds r0, 0x1\n"
    "\tstrb r0, [r1]\n"
    "_081363C8:\n"
    "\tbl sub_80F26BC\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbeq _081363D4\n"
    "\tb _0813657A\n"
    "_081363D4:\n"
    "\tb _08136524\n"
    "\t.align 2, 0\n"
    "_081363D8: .4byte gUnknown_02039304\n"
    "_081363DC:\n"
    "\tmovs r0, 0x1\n"
    "\tbl sub_80F2C80\n"
    "\tldr r0, _08136400 @ =gUnknown_02039304\n"
    "\tldr r1, [r0]\n"
    "\tadds r1, 0x50\n"
    "\tldrb r0, [r1]\n"
    "\tadds r0, 0x1\n"
    "\tstrb r0, [r1]\n"
    "_081363EE:\n"
    "\tmovs r0, 0x1\n"
    "\tbl sub_80F2CBC\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbeq _081363FC\n"
    "\tb _0813657A\n"
    "_081363FC:\n"
    "\tb _08136524\n"
    "\t.align 2, 0\n"
    "_08136400: .4byte gUnknown_02039304\n"
    "_08136404:\n"
    "\tldr r1, _08136434 @ =gKeyRepeatStartDelay\n"
    "\tmovs r0, 0x14\n"
    "\tstrh r0, [r1]\n"
    "\tbl CalculatePlayerPartyCount\n"
    "\tldr r1, _08136438 @ =gUnknown_083DFEC4\n"
    "\tldr r4, [r1]\n"
    "\tldr r2, _0813643C @ =0x00008828\n"
    "\tadds r1, r4, r2\n"
    "\tmovs r5, 0\n"
    "\tstrb r0, [r1]\n"
    "\tldr r1, _08136440 @ =0x00009344\n"
    "\tadds r0, r4, r1\n"
    "\tstrb r5, [r0]\n"
    "\tsubs r2, 0xC0\n"
    "\tadds r0, r4, r2\n"
    "\tstr r5, [r0]\n"
    "\tbl sub_80F4BD0\n"
    "\tldr r0, _08136444 @ =0x0000d160\n"
    "\tadds r4, r0\n"
    "\tstrh r5, [r4]\n"
    "\tb _08136524\n"
    "\t.align 2, 0\n"
    "_08136434: .4byte gKeyRepeatStartDelay\n"
    "_08136438: .4byte gUnknown_083DFEC4\n"
    "_0813643C: .4byte 0x00008828\n"
    "_08136440: .4byte 0x00009344\n"
    "_08136444: .4byte 0x0000d160\n"
    "_08136448:\n"
    "\tbl sub_80F1778\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbeq _08136454\n"
    "\tb _0813657A\n"
    "_08136454:\n"
    "\tldr r0, _08136460 @ =REG_BG2VOFS\n"
    "\tmovs r1, 0x6\n"
    "\tstrh r1, [r0]\n"
    "\tadds r0, 0x4\n"
    "\tstrh r1, [r0]\n"
    "\tb _08136524\n"
    "\t.align 2, 0\n"
    "_08136460: .4byte REG_BG2VOFS\n"
    "_08136464:\n"
    "\tmovs r0, 0\n"
    "\tbl sub_80F2E18\n"
    "\tldr r0, _0813647C @ =gUnknown_083DFEC4\n"
    "\tldr r0, [r0]\n"
    "\tldr r1, _08136480 @ =0x00008768\n"
    "\tadds r0, r1\n"
    "\tldr r1, [r0]\n"
    "\tldr r0, _08136484 @ =0x0000ffd8\n"
    "\tstrh r0, [r1, 0x26]\n"
    "\tb _08136524\n"
    "\t.align 2, 0\n"
    "_0813647C: .4byte gUnknown_083DFEC4\n"
    "_08136480: .4byte 0x00008768\n"
    "_08136484: .4byte 0x0000ffd8\n"
    "_08136488:\n"
    "\tbl sub_80F170C\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _0813657A\n"
    "\tb _08136524\n"
    "_08136494:\n"
    "\tbl sub_80F33A8\n"
    "\tb _08136524\n"
    "_0813649A:\n"
    "\tldr r1, _081364C4 @ =0x0600f800\n"
    "\tmovs r2, 0\n"
    "\tstr r2, [sp]\n"
    "\tldr r0, _081364C8 @ =0x040000d4\n"
    "\tmov r4, sp\n"
    "\tstr r4, [r0]\n"
    "\tstr r1, [r0, 0x4]\n"
    "\tldr r1, _081364CC @ =0x85000200\n"
    "\tstr r1, [r0, 0x8]\n"
    "\tldr r0, [r0, 0x8]\n"
    "\tldr r0, _081364D0 @ =REG_BG1VOFS\n"
    "\tstrh r2, [r0]\n"
    "\tsubs r0, 0x2\n"
    "\tstrh r2, [r0]\n"
    "\tldr r1, _081364D4 @ =REG_BG1CNT\n"
    "\tmovs r2, 0xF8\n"
    "\tlsls r2, 5\n"
    "\tadds r0, r2, 0\n"
    "\tstrh r0, [r1]\n"
    "\tldr r1, [r3]\n"
    "\tb _08136528\n"
    "\t.align 2, 0\n"
    "_081364C4: .4byte 0x0600f800\n"
    "_081364C8: .4byte 0x040000d4\n"
    "_081364CC: .4byte 0x85000200\n"
    "_081364D0: .4byte REG_BG1VOFS\n"
    "_081364D4: .4byte REG_BG1CNT\n"
    "_081364D8:\n"
    "\tldr r0, _081364F0 @ =gUnknown_083DFEC4\n"
    "\tldr r1, [r0]\n"
    "\tldr r4, _081364F4 @ =0x00008ff0\n"
    "\tadds r0, r1, r4\n"
    "\tldr r2, _081364F8 @ =0x00009004\n"
    "\tadds r1, r2\n"
    "\tbl sub_80F567C\n"
    "\tbl sub_80F5B38\n"
    "\tb _08136524\n"
    "\t.align 2, 0\n"
    "_081364F0: .4byte gUnknown_083DFEC4\n"
    "_081364F4: .4byte 0x00008ff0\n"
    "_081364F8: .4byte 0x00009004\n"
    "_081364FC:\n"
    "\tbl sub_80F5B50\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _0813657A\n"
    "\tb _08136524\n"
    "_08136508:\n"
    "\tldr r0, _08136518 @ =gUnknown_083DFEC4\n"
    "\tldr r0, [r0]\n"
    "\tldr r4, _0813651C @ =0x00009004\n"
    "\tadds r0, r4\n"
    "\tbl sub_80F556C\n"
    "\tb _08136524\n"
    "\t.align 2, 0\n"
    "_08136518: .4byte gUnknown_083DFEC4\n"
    "_0813651C: .4byte 0x00009004\n"
    "_08136520:\n"
    "\tbl sub_80F1934\n"
    "_08136524:\n"
    "\tldr r0, _08136534 @ =gUnknown_02039304\n"
    "\tldr r1, [r0]\n"
    "_08136528:\n"
    "\tadds r1, 0x50\n"
    "\tldrb r0, [r1]\n"
    "\tadds r0, 0x1\n"
    "\tstrb r0, [r1]\n"
    "\tb _0813657A\n"
    "\t.align 2, 0\n"
    "_08136534: .4byte gUnknown_02039304\n"
    "_08136538:\n"
    "\tldr r1, _08136584 @ =REG_WIN0H\n"
    "\tmovs r0, 0xF0\n"
    "\tstrh r0, [r1]\n"
    "\tadds r1, 0x2\n"
    "\tmovs r0, 0x9B\n"
    "\tstrh r0, [r1]\n"
    "\tldr r0, _08136588 @ =REG_WIN0V\n"
    "\tldr r2, _0813658C @ =0x00003273\n"
    "\tadds r1, r2, 0\n"
    "\tstrh r1, [r0]\n"
    "\tadds r0, 0x2\n"
    "\tstrh r1, [r0]\n"
    "\tldr r1, _08136590 @ =REG_WININ\n"
    "\tldr r4, _08136594 @ =0x00003f3f\n"
    "\tadds r0, r4, 0\n"
    "\tstrh r0, [r1]\n"
    "\tadds r1, 0x2\n"
    "\tmovs r0, 0x1B\n"
    "\tstrh r0, [r1]\n"
    "\tsubs r1, 0x38\n"
    "\tmovs r0, 0x28\n"
    "\tstrh r0, [r1]\n"
    "\tsubs r1, 0x12\n"
    "\tldr r2, _08136598 @ =0x00007f40\n"
    "\tadds r0, r2, 0\n"
    "\tstrh r0, [r1]\n"
    "_0813656C:\n"
    "\tldr r0, [r3]\n"
    "\tadds r0, 0x55\n"
    "\tmovs r1, 0x1\n"
    "\tstrb r1, [r0]\n"
    "\tldr r0, _0813659C @ =sub_81365C8\n"
    "\tbl launch_c3_walk_stairs_and_run_once\n"
    "_0813657A:\n"
    "\tadd sp, 0x4\n"
    "\tpop {r4,r5}\n"
    "\tpop {r0}\n"
    "\tbx r0\n"
    "\t.align 2, 0\n"
    "_08136584: .4byte REG_WIN0H\n"
    "_08136588: .4byte REG_WIN0V\n"
    "_0813658C: .4byte 0x00003273\n"
    "_08136590: .4byte REG_WININ\n"
    "_08136594: .4byte 0x00003f3f\n"
    "_08136598: .4byte 0x00007f40\n"
    "_0813659C: .4byte sub_81365C8\n"
    ".syntax divided\n");
}
#endif

void sub_81365A0(void)
{
    while (!gUnknown_02039304->unk55)
    {
        sub_8136294();
    }
}
