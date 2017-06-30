//
// Created by Scott Norton on 5/31/17.
//

#include "global.h"
#include "main.h"
#include "rom4.h"
#include "string_util.h"
#include "strings.h"
#include "sprite.h"
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

#define GFX_TAG_CONDITIONUPDOWN 0

#ifdef GERMAN
const u16 ConditionUpDownPalette[16];
const u32 ConditionUpDownTiles[0x80];
#else
const u16 ConditionUpDownPalette[] = INCBIN_U16("graphics/misc/condition_up_down.gbapal");
const u32 ConditionUpDownTiles[] = INCBIN_U32("graphics/misc/condition_up_down.4bpp");
#endif

const u32 gUnknown_08406118[] = {
    MON_DATA_COOL,
    MON_DATA_TOUGH,
    MON_DATA_SMART,
    MON_DATA_CUTE,
    MON_DATA_BEAUTY
};

const u8 gUnknown_0840612C[] = {
    0, 4, 3, 2, 1
};

const u8 *const gUnknown_08406134[] = {
    OtherText_Coolness,
    OtherText_Toughness,
    OtherText_Smartness,
    OtherText_Cuteness,
    OtherText_Beauty
};

const struct SpriteSheet gSpriteSheet_ConditionUpDown = {
    (u8 *)ConditionUpDownTiles,
    sizeof ConditionUpDownTiles,
    GFX_TAG_CONDITIONUPDOWN
};

const struct SpritePalette gSpritePalette_ConditionUpDown = {
    ConditionUpDownPalette,
    GFX_TAG_CONDITIONUPDOWN
};

const s16 gUnknown_08406158[][2] = {
    {0x9c, 0x1e},
    {0x75, 0x35},
    {0x75, 0x70},
    {0xc5, 0x70},
    {0xc5, 0x35}
};

const struct OamData gOamData_840616C = {
    .shape = 1,
    .size = 2,
    .priority = 1
};

const union AnimCmd gSpriteAnim_8406174[] = {
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_840617C[] = {
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_8406184[] = {
    gSpriteAnim_8406174,
    gSpriteAnim_840617C
};

const struct SpriteTemplate gSpriteTemplate_840618C = {
    GFX_TAG_CONDITIONUPDOWN,
    GFX_TAG_CONDITIONUPDOWN,
    &gOamData_840616C,
    gSpriteAnimTable_8406184,
    NULL,
    gDummySpriteAffineAnimTable,
    SpriteCallbackDummy
};

asm(".text\n"
    ".include \"constants/gba_constants.inc\"");

extern struct UnkPokenavStruct_Sub1 *gUnknown_02039304;
extern MainCallback gUnknown_02039308;
extern struct Pokeblock *gUnknown_0203930C;
extern u8 gUnknown_02039310;

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
void sub_8136DC0(u8 *, u8, s16);
void sub_8136DA0(const u8 *);
void sub_8136F74(struct Pokeblock *, struct Pokemon *);
void sub_81371DC(struct Sprite *);

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

#ifdef NONMATCHING
bool8 sub_8136D00(void)
{
    while (1)
    {
        if (++gUnknown_02039304->unk53 >= 5)
        {
            break;
        }
        if (gUnknown_02039304->unk61[gUnknown_02039304->unk53] != 0)
        {
            sub_8136DC0(gUnknown_02039304->stringBuffer, gUnknown_02039304->unk53, gUnknown_02039304->unk61[gUnknown_02039304->unk53]);
            sub_8136DA0(gUnknown_02039304->stringBuffer);
            return TRUE;
        }
    }
    gUnknown_02039304->unk53 = 5;
    return FALSE;
}
#else
__attribute__((naked))
bool8 sub_8136D00(void)
{
    asm_unified("\tpush {r4,r5,lr}\n"
                    "\tldr r4, _08136D30 @ =gUnknown_02039304\n"
                    "\tadds r3, r4, 0\n"
                    "\tmovs r5, 0x5\n"
                    "_08136D08:\n"
                    "\tldr r0, [r3]\n"
                    "\tadds r0, 0x53\n"
                    "\tldrb r1, [r0]\n"
                    "\tadds r1, 0x1\n"
                    "\tstrb r1, [r0]\n"
                    "\tldr r2, [r3]\n"
                    "\tadds r1, r2, 0\n"
                    "\tadds r1, 0x53\n"
                    "\tldrb r0, [r1]\n"
                    "\tcmp r0, 0x4\n"
                    "\tbhi _08136D34\n"
                    "\tadds r0, r2, 0\n"
                    "\tadds r0, 0x61\n"
                    "\tldrb r1, [r1]\n"
                    "\tadds r0, r1\n"
                    "\tldrb r0, [r0]\n"
                    "\tcmp r0, 0\n"
                    "\tbne _08136D3A\n"
                    "\tb _08136D08\n"
                    "\t.align 2, 0\n"
                    "_08136D30: .4byte gUnknown_02039304\n"
                    "_08136D34:\n"
                    "\tstrb r5, [r1]\n"
                    "\tmovs r0, 0\n"
                    "\tb _08136D5A\n"
                    "_08136D3A:\n"
                    "\tldr r2, [r4]\n"
                    "\tadds r0, r2, 0\n"
                    "\tadds r0, 0x10\n"
                    "\tadds r1, r2, 0\n"
                    "\tadds r1, 0x53\n"
                    "\tldrb r1, [r1]\n"
                    "\tadds r2, 0x61\n"
                    "\tadds r2, r1\n"
                    "\tldrb r2, [r2]\n"
                    "\tbl sub_8136DC0\n"
                    "\tldr r0, [r4]\n"
                    "\tadds r0, 0x10\n"
                    "\tbl sub_8136DA0\n"
                    "\tmovs r0, 0x1\n"
                    "_08136D5A:\n"
                    "\tpop {r4,r5}\n"
                    "\tpop {r1}\n"
                    "\tbx r1");
}
#endif

void sub_8136D60(void)
{
    BasicInitMenuWindow(&gWindowConfig_81E709C);
    MenuDrawTextWindow(0, 16, 29, 19);
    MenuPrint(gOtherText_WontEat, 1, 17);
}

void sub_8136D8C(void)
{
    MenuZeroFillScreen();
    BasicInitMenuWindow(&gWindowConfig_81E7080);
}

void sub_8136DA0(const u8 *message)
{
    MenuDrawTextWindow(0, 16, 29, 19);
    MenuPrint(message, 1, 17);
}

#ifdef NONMATCHING
void sub_8136DC0(u8 *dest, u8 a1, s16 a2)
{
    u16 v0 = a2;
    if (a2 != 0)
    {
        if ((v0 = max(a2, 0)) == 0);
        StringCopy(dest, gUnknown_08406134[a1]);
        StringAppend(dest, gOtherText_WasEnhanced);
    }
    else
    {
        StringCopy(dest, gOtherText_NothingChanged);
    }
}
#else
__attribute__((naked))
void sub_8136DC0(u8 *dest, u8 a1, s16 a2)
{
    asm_unified("\tpush {r4,lr}\n"
                    "\tadds r4, r0, 0\n"
                    "\tlsls r1, 24\n"
                    "\tlsrs r3, r1, 24\n"
                    "\tlsls r2, 16\n"
                    "\tlsrs r0, r2, 16\n"
                    "\tasrs r2, 16\n"
                    "\tcmp r2, 0\n"
                    "\tbeq _08136DFC\n"
                    "\tcmp r2, 0\n"
                    "\tble _08136DD8\n"
                    "\tmovs r0, 0\n"
                    "_08136DD8:\n"
                    "\tlsls r0, 16\n"
                    "\tldr r1, _08136DF4 @ =gUnknown_08406134\n"
                    "\tlsls r0, r3, 2\n"
                    "\tadds r0, r1\n"
                    "\tldr r1, [r0]\n"
                    "\tadds r0, r4, 0\n"
                    "\tbl StringCopy\n"
                    "\tldr r1, _08136DF8 @ =gOtherText_WasEnhanced\n"
                    "\tadds r0, r4, 0\n"
                    "\tbl StringAppend\n"
                    "\tb _08136E04\n"
                    "\t.align 2, 0\n"
                    "_08136DF4: .4byte gUnknown_08406134\n"
                    "_08136DF8: .4byte gOtherText_WasEnhanced\n"
                    "_08136DFC:\n"
                    "\tldr r1, _08136E0C @ =gOtherText_NothingChanged\n"
                    "\tadds r0, r4, 0\n"
                    "\tbl StringCopy\n"
                    "_08136E04:\n"
                    "\tpop {r4}\n"
                    "\tpop {r0}\n"
                    "\tbx r0\n"
                    "\t.align 2, 0\n"
                    "_08136E0C: .4byte gOtherText_NothingChanged");
}
#endif

void sub_8136E10(struct Pokemon *pokemon, u8 *data)
{
    u16 i;
    for (i=0; i<5; i++)
    {
        data[i] = GetMonData(pokemon, gUnknown_08406118[i]);
    }
}

void sub_8136E40(struct Pokeblock *pokeblock, struct Pokemon *pokemon)
{
    u16 i;
    s16 cstat;
    u8 data;
    if (GetMonData(pokemon, MON_DATA_SHEEN) != 255)
    {
        sub_8136F74(pokeblock, pokemon);
        for (i=0; i<5; i++)
        {
            data = GetMonData(pokemon, gUnknown_08406118[i]);
            cstat = data + gUnknown_02039304->unk66[i];
            if (cstat < 0)
                cstat = 0;
            if (cstat > 255)
                cstat = 255;
            data = cstat;
            SetMonData(pokemon, gUnknown_08406118[i], &data);
        }
        cstat = (u8)GetMonData(pokemon, MON_DATA_SHEEN);
        cstat = cstat + pokeblock->feel;
        if (cstat > 255)
            cstat = 255;
        data = cstat;
        SetMonData(pokemon, MON_DATA_SHEEN, &data);
    }
}

void sub_8136EF0(void)
{
    u16 i;
    struct Pokemon *pokemon = gPlayerParty;
    pokemon += gUnknown_083DFEC4->unk893c[gUnknown_083DFEC4->unk87DC].partyIdx;
    sub_8136E10(pokemon, gUnknown_02039304->unk57);
    sub_8136E40(gUnknown_02039304->pokeblock, pokemon);
    sub_8136E10(pokemon, gUnknown_02039304->unk5c);
    for (i=0; i<5; i++)
    {
        gUnknown_02039304->unk61[i] = gUnknown_02039304->unk5c[i] - gUnknown_02039304->unk57[i];
    }
}

void sub_8136F74(struct Pokeblock *pokeblock, struct Pokemon *pokemon)
{
    s8 direction;
    s8 i;
    s16 amount;
    s8 boost;
    s8 taste;
    gUnknown_02039304->unk66[0] = pokeblock->spicy;
    gUnknown_02039304->unk66[1] = pokeblock->sour;
    gUnknown_02039304->unk66[2] = pokeblock->bitter;
    gUnknown_02039304->unk66[3] = pokeblock->sweet;
    gUnknown_02039304->unk66[4] = pokeblock->dry;
    if (gUnknown_02039312 > 0)
        direction = 1;
    else if (gUnknown_02039312 < 0)
        direction = -1;
    else
        return;
    for (i=0; i<5; i++)
    {
        amount = gUnknown_02039304->unk66[i];
        boost = amount / 10;
        if (amount % 10 >= 5) // round to the nearest
            boost++;
        taste = sub_8040A54(pokemon, gUnknown_0840612C[i]);
        if (taste == direction)
        {
            gUnknown_02039304->unk66[i] += boost * taste;
        }
    }
}

bool8 sub_8137058(void)
{
    struct Pokemon *pokemon = gPlayerParty;
    pokemon += gUnknown_083DFEC4->unk893c[gUnknown_083DFEC4->unk87DC].partyIdx;
    if (GetMonData(pokemon, MON_DATA_SHEEN) == 255)
        return TRUE;
    return FALSE;
}

u8 sub_81370A4(u8 a0)
{
    u8 i;
    for (i=0; i<PARTY_SIZE; i++)
    {
        if (!GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG))
        {
            if (a0 == 0)
                return i;
            a0--;
        }
    }
    return 0;
}

u8 sub_81370E4(u8 a0)
{
    u8 ct;
    u8 i;
    for (i=0, ct=0; i<a0; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG))
        {
            ct++;
        }
    }
    return a0 - ct;
}

u8 sub_8137124(u8 a0)
{
    return sub_81370A4(a0);
}

void sub_8137138(void)
{
    u16 flavor;
    u8 spriteidx;
    LoadSpriteSheet(&gSpriteSheet_ConditionUpDown);
    LoadSpritePalette(&gSpritePalette_ConditionUpDown);
    gUnknown_02039304->unk54 = 0;
    for (flavor=0; flavor<5; flavor++)
    {
        if (gUnknown_02039304->unk61[flavor] != 0)
        {
            spriteidx = CreateSprite(&gSpriteTemplate_840618C, gUnknown_08406158[flavor][0], gUnknown_08406158[flavor][1], 0);
            if (spriteidx != MAX_SPRITES)
            {
                if (gUnknown_02039304->unk61[flavor] != 0)
                {
                    gSprites[spriteidx].callback = sub_81371DC;
                }
                gUnknown_02039304->unk54++;
            }
        }
    }
}

void sub_81371DC(struct Sprite *sprite)
{
    if (sprite->data0 <= 5)
        sprite->pos2.y -= 2;
    else if (sprite->data0 <= 11)
        sprite->pos2.y += 2;
    if ((++sprite->data0) > 60)
    {
        DestroySprite(sprite);
        gUnknown_02039304->unk54--;
    }
}
