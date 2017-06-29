//
// Created by Scott Norton on 5/31/17.
//

#include "global.h"
#include "main.h"
#include "rom4.h"
#include "string_util.h"
#include "strings.h"
#include "pokemon.h"
#include "pokenav.h"
#include "palette.h"
#include "text.h"
#include "menu.h"
#include "sound.h"
#include "songs.h"
#include "pokeblock.h"
#include "pokeblock_feed.h"
#include "use_pokeblock.h"

asm(".text\n"
    ".include \"constants/gba_constants.inc\"");

extern MainCallback gUnknown_02039308;
extern struct Pokeblock *gUnknown_0203930C;
u8 gUnknown_02039310;

extern struct UnkPokenavStruct_Sub1 *gUnknown_02039304;
extern u16 gKeyRepeatStartDelay;
extern u16 gScriptItemId; // remove after merge of #349 Pokeblock

void launch_c3_walk_stairs_and_run_once(void (*const)(void));
void sub_81361E4(void);
void sub_813622C(void);
void sub_8136244(void);
void sub_8136264(void);
void sub_8136294(void);
void sub_81365A0(void);
void sub_81365C8(void);
void sub_8136638(void);
void sub_81368A4(void);
void sub_8089668(void);
void sub_8136B44(void);
u8 sub_81370E4(u8);
void sub_8136BB8(void);
s8 sub_8136C40(void);
bool8 sub_8137058(void);
void sub_8136D60(void);
void sub_8136808(void);
void sub_8136D8C(void);
u8 sub_81370A4(u8);
void sub_81369CC(void);
void sub_8136EF0(void);
void sub_8137138(void);
void sub_8136C6C(void);
bool8 sub_8136D00(void);
void sub_8136DC0(u8 *, u8, u8);
void sub_8136DA0(u8 *);

void sub_8136130(struct Pokeblock *pokeblock, MainCallback callback)
{
    gUnknown_02039304 = &gUnknown_083DFEC4->unkD164;
    gUnknown_02039304->pokeblock = pokeblock;
    gUnknown_02039304->callback = callback;
    gUnknown_083DFEC4->unkD162[0] = 2;
    launch_c3_walk_stairs_and_run_once(sub_8136294);
    SetMainCallback2(sub_8136244);
}

void sub_8136174(void)
{
    gUnknown_02039304->pokeblock = gUnknown_0203930C;
    gUnknown_02039304->callback = gUnknown_02039308;
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

void sub_8136294(void)
{
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
            DmaClear32(3, BG_SCREEN_ADDR(31), 0x800);
            REG_BG1VOFS = 0;
            REG_BG1HOFS = 0;
            REG_BG1CNT = BGCNT_SCREENBASE(31);
            gUnknown_02039304->unk50++;
            break;
        case 17:
            sub_80F567C(&gUnknown_083DFEC4->unk8ff0, gUnknown_083DFEC4->unk9004);
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
            sub_80F556C(gUnknown_083DFEC4->unk9004);
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
            REG_DISPCNT = DISPCNT_OBJ_1D_MAP | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON | DISPCNT_WIN1_ON;
            // fallthrough
        case 22:
            gUnknown_02039304->unk55 = 1;
            launch_c3_walk_stairs_and_run_once(sub_81365C8);
            break;
    }
}

void sub_81365A0(void)
{
    while (!gUnknown_02039304->unk55)
    {
        sub_8136294();
    }
}

void sub_81365C8(void)
{
    switch (gUnknown_02039304->unk50)
    {
        case 0:
            BeginNormalPaletteFade(-1, 0, 16, 0, 0);
            SetVBlankCallback(sub_8136264);
            gUnknown_02039304->unk50++;
            break;
        case 1:
            if (!gPaletteFade.active)
            {
                sub_80F3C94();
                sub_80F3D00();
                launch_c3_walk_stairs_and_run_once(sub_8136638);
            }
            break;
    }
}

void sub_8136638(void)
{
    switch (gUnknown_02039304->unk50)
    {
        case 0:
            if (gMain.heldKeys & DPAD_UP)
            {
                PlaySE(SE_SELECT);
                sub_80F5060(TRUE);
                move_anim_execute();
                gUnknown_02039304->unk50 = 1;
            }
            else if (gMain.heldKeys & DPAD_DOWN)
            {
                PlaySE(SE_SELECT);
                sub_80F5060(FALSE);
                move_anim_execute();
                gUnknown_02039304->unk50 = 1;
            }
            else if (gMain.newKeys & B_BUTTON)
            {
                PlaySE(SE_SELECT);
                gUnknown_02039304->unk50 = 3;
            }
            else if (gMain.newKeys & A_BUTTON)
            {
                PlaySE(SE_SELECT);
                if (gUnknown_083DFEC4->unk87DC == gUnknown_083DFEC4->unk87DA - 1)
                {
                    gUnknown_02039304->unk50 = 3;
                }
                else
                {
                    gUnknown_02039304->unk50 = 5;
                }
            }
            break;
        case 1:
            if (!gpu_sync_bg_show())
            {
                gUnknown_02039304->unk50++;
            }
            break;
        case 2:
            if (!sub_8055870())
            {
                sub_80F1934();
                sub_80F3D00();
                gUnknown_02039304->unk50 = 0;
            }
            break;
        case 3:
            launch_c3_walk_stairs_and_run_once(sub_8136B44);
            break;
        case 4:
            break;
        case 5:
            sub_8136BB8();
            gUnknown_02039304->unk50++;
            break;
        case 6:
            switch (sub_8136C40())
            {
                case 1:
                case -1:
                    gUnknown_02039304->unk50 = 0;
                    break;
                case 0:
                    if (sub_8137058())
                    {
                        sub_8136D60();
                        gUnknown_02039304->unk50 = 7;
                    }
                    else
                    {
                        launch_c3_walk_stairs_and_run_once(sub_8136808);
                    }
                    break;
            }
            break;
        case 7:
            if (gMain.newKeys & (A_BUTTON | B_BUTTON))
            {
                sub_8136D8C();
                gUnknown_02039304->unk50 = 0;
            }
            break;
    }
}

void sub_8136808(void)
{
    switch (gUnknown_02039304->unk50)
    {
        case 0:
            gUnknown_02039310 = sub_81370A4(gUnknown_083DFEC4->unk87DC);
            gUnknown_02039308 = gUnknown_02039304->callback;
            gUnknown_0203930C = gUnknown_02039304->pokeblock;
            BeginNormalPaletteFade(-1, 0, 0, 16, 0);
            gUnknown_02039304->unk50++;
            break;
        case 1:
            if (!gPaletteFade.active)
            {
                gMain.savedCallback = sub_8136174;
                SetMainCallback2(sub_8147ADC);
            }
            break;
    }
}

void sub_81368A4(void)
{
    switch (gUnknown_02039304->unk50)
    {
        case 0:
            if (gUnknown_083DFEC4->unk87DC != gUnknown_02039310)
            {
                sub_80F5060(gUnknown_02039304->unk56);
                gUnknown_02039304->unk50++;
            }
            else
            {
                gUnknown_02039304->unk50 = 3;
            }
            break;
        case 1:
            if (!gpu_sync_bg_show())
            {
                gUnknown_02039304->unk50++;
            }
            break;
        case 2:
            if (!sub_8055870())
            {
                sub_80F1934();
                gUnknown_02039304->unk50 = 0;
            }
            break;
        case 3:
            BlendPalettes(-1, 16, 0);
            gUnknown_02039304->unk50++;
            break;
        case 4:
            REG_DISPCNT = DISPCNT_OBJ_1D_MAP | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON | DISPCNT_WIN1_ON;
            gUnknown_02039304->unk50++;
            break;
        case 5:
            SetVBlankCallback(sub_8136264);
            BeginNormalPaletteFade(-1, 0, 16, 0, 0);
            gUnknown_02039304->unk50++;
            break;
        case 6:
            if (!gPaletteFade.active)
            {
                sub_80F3C94();
                sub_80F3D00();
                launch_c3_walk_stairs_and_run_once(sub_81369CC);
                SetMainCallback2(sub_8136244);
            }
            break;
    }
}

void sub_81369CC(void)
{
    switch (gUnknown_02039304->unk50)
    {
        case 0:
            gUnknown_02039304->pokemon = &gPlayerParty[0];
            gUnknown_02039304->pokemon = &gPlayerParty[gUnknown_083DFEC4->unk893c[gUnknown_083DFEC4->unk87DC].partyIdx];
            move_anim_execute();
            gUnknown_02039304->unk50++;
            break;
        case 1:
            if (gMain.newKeys & (A_BUTTON | B_BUTTON))
                gUnknown_02039304->unk50++;
            break;
        case 2:
            sub_8136EF0();
            sub_80F567C(gUnknown_02039304->unk5c, gUnknown_083DFEC4->unk9040);
            sub_80F5550(gUnknown_083DFEC4->unk9004[gUnknown_083DFEC4->unk8fe9], gUnknown_083DFEC4->unk9040);
            sub_8137138();
            gUnknown_02039304->unk50++;
            break;
        case 3:
            if (!sub_80F555C())
            {
                sub_80F7224(sub_81370A4(gUnknown_083DFEC4->unk87DC));
                sub_80F3D00();
                gUnknown_02039304->unk52 = 0;
                gUnknown_02039304->unk50++;
            }
            break;
        case 4:
            if ((++gUnknown_02039304->unk52) > 16)
            {
                sub_8136C6C();
                gUnknown_02039304->unk50++;
            }
            break;
        case 5:
            if (gMain.newKeys & (A_BUTTON | B_BUTTON) && !sub_8136D00())
            {
                sub_810CA6C((u8)gScriptItemId);
                launch_c3_walk_stairs_and_run_once(sub_8136B44);
            }
            break;
    }
}

void sub_8136B44(void)
{
    switch (gUnknown_02039304->unk50)
    {
        case 0:
            BeginNormalPaletteFade(-1, 0, 0, 16, 0);
            gUnknown_02039304->unk50++;
            break;
        case 1:
            if (!gPaletteFade.active)
            {
                gUnknown_02039304->unk50 = 2;
            }
            break;
        case 2:
            sub_80F5BDC();
            gUnknown_02039304->unk50++;
            break;
        case 3:
            SetMainCallback2(gUnknown_02039304->callback);
            break;
    }
}

void sub_8136BB8(void)
{
    GetMonData(&gPlayerParty[sub_81370A4(gUnknown_083DFEC4->unk87DC)], MON_DATA_NICKNAME, gUnknown_02039304->stringBuffer);
    StringGetEnd10(gUnknown_02039304->stringBuffer);
    StringAppend(gUnknown_02039304->stringBuffer, gOtherText_GetsAPokeBlock);
    BasicInitMenuWindow(&gWindowConfig_81E709C);
    MenuDrawTextWindow(0, 16, 29, 19);
    MenuPrint(gUnknown_02039304->stringBuffer, 1, 17);
    DisplayYesNoMenu(23, 10, 1);
    MoveMenuCursor(0);
}

s8 sub_8136C40(void)
{
    s8 retval = ProcessMenuInputNoWrap();
    if ((u8)(retval + 1) < 3)
    {
        MenuZeroFillScreen();
        BasicInitMenuWindow(&gWindowConfig_81E7080);
    }
    return retval;
}

void sub_8136C6C(void)
{
    BasicInitMenuWindow(&gWindowConfig_81E709C);
    MenuDrawTextWindow(0, 16, 29, 19);
    for (gUnknown_02039304->unk53 = 0; gUnknown_02039304->unk53 < 5 && gUnknown_02039304->unk61[gUnknown_02039304->unk53] == 0; gUnknown_02039304->unk53++);
    if (gUnknown_02039304->unk53 < 5)
    {
        sub_8136DC0(gUnknown_02039304->stringBuffer, gUnknown_02039304->unk53, gUnknown_02039304->unk61[gUnknown_02039304->unk53]);
    }
    else
    {
        sub_8136DC0(gUnknown_02039304->stringBuffer, gUnknown_02039304->unk53, 0);
    }
    sub_8136DA0(gUnknown_02039304->stringBuffer);
}
