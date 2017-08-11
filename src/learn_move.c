#include "global.h"
#include "data2.h"
#include "field_fadetransition.h"
#include "main.h"
#include "menu.h"
#include "menu_cursor.h"
#include "palette.h"
#include "pokemon.h"
#include "rom4.h"
#include "script.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "strings2.h"
#include "task.h"

struct UnknownStruct1
{
    const u8 *unk0;
    u8 unk4;
    u8 unk5;
    u8 unk6;
};

extern u8 ewram[];
extern u16 gSpecialVar_0x8004;
extern u16 gSpecialVar_0x8005;
extern u8 gTileBuffer[];

extern const struct WindowConfig gWindowConfig_81E6CE4;
extern const struct WindowConfig gWindowConfig_81E7240;
extern const struct UnknownStruct1 gUnknown_08402D08[];
extern const struct SpriteSheet gUnknown_08402D80;
extern const struct SpritePalette gUnknown_08402D88;

extern void sub_809D9F0(struct Pokemon *, u8, u8, void *, u32);

struct Struct2017000
{
    u8 unk0;
    u8 filler1[2];
    u8 unk3;
    u8 unk4;
    u8 unk5[16];
    u8 filler15[3];
    u8 unk18;
    u8 filler19[0x1B-0x19];
    u8 unk1B;
    u8 filler1C;
    u8 unk1D;
    u8 unk1E;
    u8 filler1F;
    u16 unk20[4];
    u8 filler28[0x2C3-0x28];
    u8 unk2C3;
    u8 unk2C4;
    u8 unk2C5;
    u8 unk2C6;
};

extern struct Struct2017000 *gUnknown_030007B0;

const u16 gDexArrows_Pal[] = INCBIN_U16("graphics/pokedex/arrows.gbapal");

const u8 gDexArrows_Gfx[] = INCBIN_U8("graphics/pokedex/arrows.4bpp");

const u8 gUnknown_08402CF8[][4] =
{
    { 0,  0,  9, 13},
    {10,  0, 29,  7},
    { 2, 14, 27, 19},
    {10,  8, 29, 13},
};

const struct UnknownStruct1 gUnknown_08402D08[] =
{
    {OtherText_Battle,   1, 1, 0},
    {OtherText_Power,    1, 4, 1},
    {OtherText_Accuracy, 1, 9, 2},
    {NULL,               0, 0, 0},
    {OtherText_Contest,  1, 1, 0},
    {OtherText_Appeal,   1, 4, 1},
    {OtherText_Jam,      1, 9, 2},
    {NULL,               0, 0, 0},
};

void sub_813269C(u8);
void sub_81326D8(void);
void sub_8132870(void);
void sub_8132908(void);
void sub_8132FEC(void);
void sub_8133030(u8);
u8 sub_81330E8(void);
void sub_8133140(u8);
u8 sub_8133248(void);
void sub_81332A0(void);
void sub_8133358(void);
void sub_8133558(void);
void sub_813362C(void);
void sub_8133800(void);
void sub_8133AEC();
void sub_8133CA4(void);

void sub_813265C(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_8132670(void)
{
    ScriptContext2_Enable();
    CreateTask(sub_813269C, 10);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
}

void sub_813269C(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(sub_81326D8);
        gFieldCallback = sub_8080990;
        DestroyTask(taskId);
    }
}

void sub_81326D8(void)
{
    REG_DISPCNT = 0;
    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetTasks();
    gUnknown_030007B0 = (struct Struct2017000 *)(ewram + 0x17000);
    sub_81332A0();
    gUnknown_030007B0->unk2C5 = gSpecialVar_0x8004;
    sub_8133558();
    SetVBlankCallback(sub_813265C);

    SetUpWindowConfig(&gWindowConfig_81E7240);
    InitMenuWindow(&gWindowConfig_81E7240);
    MenuZeroFillScreen();

    SetUpWindowConfig(&gWindowConfig_81E6CE4);
    InitMenuWindow(&gWindowConfig_81E6CE4);
    MenuZeroFillScreen();

    REG_BG0VOFS = 0;
    REG_BG0VOFS = 0;  // huh?
    REG_BG1HOFS = 0;
    REG_BG1HOFS = 0;  // huh?

    LoadSpriteSheet(&gUnknown_08402D80);
    LoadSpritePalette(&gUnknown_08402D88);
    sub_8133358();
    FillPalette(0, 0, 2);
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    SetMainCallback2(sub_8132870);
}

void sub_81327A4(void)
{
    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetTasks();
    gUnknown_030007B0 = (struct Struct2017000 *)(ewram + 0x17000);
    sub_8133558();
    gUnknown_030007B0->unk2C6 = gSpecialVar_0x8005;
    SetVBlankCallback(sub_813265C);

    SetUpWindowConfig(&gWindowConfig_81E7240);
    InitMenuWindow(&gWindowConfig_81E7240);
    MenuZeroFillScreen();

    SetUpWindowConfig(&gWindowConfig_81E6CE4);
    InitMenuWindow(&gWindowConfig_81E6CE4);
    MenuZeroFillScreen();

    REG_DISPCNT = 0x1340;
    REG_BG0VOFS = 0;
    REG_BG0HOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1HOFS = 0;  // huh?

    LoadSpriteSheet(&gUnknown_08402D80);
    LoadSpritePalette(&gUnknown_08402D88);
    sub_8133358();
    FillPalette(0, 0, 2);
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    SetMainCallback2(sub_8132870);
}

void sub_8132870(void)
{
    sub_8132908();
    if (gUnknown_030007B0->unk1D != 0)
    {
        gUnknown_030007B0->unk1D = 0;
        sub_814AD7C(0x58, (gUnknown_030007B0->unk18 * 2 + 1) * 8);
    }
    if (gUnknown_030007B0->unk1E != 0)
    {
        gUnknown_030007B0->unk1E = 0;
        sub_8133800();
    }
    if (gUnknown_030007B0->unk2C3 != 0)
    {
        sub_8133AEC(gUnknown_030007B0->unk2C4, 1);
        gUnknown_030007B0->unk2C3 = 0;
    }
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_81328E8(const u8 *a)
{
    StringExpandPlaceholders(gStringVar4, a);
    MenuPrintMessage(gStringVar4, 3, 15);
}

void sub_8132908(void)
{
    switch (gUnknown_030007B0->unk0)
    {
    case 0:
        gUnknown_030007B0->unk0++;
        sub_8132FEC();
        sub_8133030(0);
        sub_8133800();
        gSprites[1].pos1.x = 0x48;
        gUnknown_030007B0->unk2C3 = 1;
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
        REG_DISPCNT = 0x1340;
        break;
    case 1:
        if (!gPaletteFade.active)
            gUnknown_030007B0->unk0 = 4;
        break;
    case 2:
        gUnknown_030007B0->unk0++;
        break;
    case 3:
        sub_8133030(0);
        sub_8133800();
        gUnknown_030007B0->unk2C3 = 1;
        gUnknown_030007B0->unk0++;
        gSprites[1].pos1.x = 0x48;
        break;
    case 4:
        if (sub_81330E8() == 0)
            sub_813362C();
        return;
    case 5:
        sub_8133140(0);
        sub_8133800();
        gUnknown_030007B0->unk2C3 = 1;
        gSprites[1].pos1.x = 0x48;
        gUnknown_030007B0->unk0++;
        break;
    case 6:
        if (sub_8133248() == 0)
            sub_813362C();
        break;
    case 8:
        if (MenuUpdateWindowText())
        {
            DisplayYesNoMenu(21, 7, 1);
            gUnknown_030007B0->unk0++;
        }
        break;
    case 9:
        {
            s8 var = ProcessMenuInputNoWrap_();

            if (var == 0)
            {
                sub_8133CA4();
                if (GiveMoveToMon(&gPlayerParty[gUnknown_030007B0->unk2C5], gUnknown_030007B0->unk20[gUnknown_030007B0->unk1B]) != 0xFFFF)
                {
                    sub_81328E8(gOtherText_PokeLearnedMove);
                    gSpecialVar_0x8004 = 1;
                    gUnknown_030007B0->unk0 = 31;
                }
                else
                {
                    gUnknown_030007B0->unk0 = 16;
                }
            }
            else if (var == -1 || var == 1)
            {
                sub_8133CA4();
                if (gUnknown_030007B0->unk2C4 == 0)
                    gUnknown_030007B0->unk0 = 3;
                if (gUnknown_030007B0->unk2C4 == 1)
                    gUnknown_030007B0->unk0 = 5;
            }
        }
        break;
    case 12:
        if (MenuUpdateWindowText())
        {
            DisplayYesNoMenu(21, 7, 1);
            gUnknown_030007B0->unk0++;
        }
        break;
    case 13:
        {
            s8 r4 = ProcessMenuInputNoWrap_();

            if (r4 == 0)
            {
                sub_8133CA4();
                gSpecialVar_0x8004 = r4;
                gUnknown_030007B0->unk0 = 14;
            }
            else if (r4 == -1 || r4 == 1)
            {
                sub_8133CA4();
                if (gUnknown_030007B0->unk2C4 == 0)
                    gUnknown_030007B0->unk0 = 3;
                if (gUnknown_030007B0->unk2C4 == 1)
                    gUnknown_030007B0->unk0 = 5;
            }
        }
        break;
    case 16:
        sub_81328E8(gOtherText_DeleteOlderMove);
        gUnknown_030007B0->unk0++;
        break;
    case 17:
        if (MenuUpdateWindowText())
        {
            DisplayYesNoMenu(21, 7, 1);
            gUnknown_030007B0->unk0 = 18;
        }
        break;
    case 18:
        {
            s8 var = ProcessMenuInputNoWrap_();

            if (var == 0)
            {
                sub_8133CA4();
                sub_81328E8(gOtherText_WhichMoveToForget);
                gUnknown_030007B0->unk0 = 19;
            }
            else if (var == -1 || var == 1)
            {
                sub_8133CA4();
                gUnknown_030007B0->unk0 = 24;
            }
        }
        break;
    case 24:
        sub_81328E8(gOtherText_StopLearningMove);
        gUnknown_030007B0->unk0++;
        break;
    case 25:
        if (MenuUpdateWindowText())
        {
            gUnknown_030007B0->unk0 = 26;
            DisplayYesNoMenu(21, 7, 1);
        }
        break;
    case 26:
        {
            s8 var = ProcessMenuInputNoWrap_();

            if (var == 0)
            {
                sub_8133CA4();
                gUnknown_030007B0->unk0 = 27;
            }
            else if (var == -1 || var == 1)
            {
                sub_8133CA4();

                // What's the point? It gets set to 16, anyway.
                if (gUnknown_030007B0->unk2C4 == 0)
                    gUnknown_030007B0->unk0 = 3;
                if (gUnknown_030007B0->unk2C4 == 1)
                    gUnknown_030007B0->unk0 = 5;
                gUnknown_030007B0->unk0 = 16;
            }
        }
        break;
    case 27:
        if (MenuUpdateWindowText())
        {
            if (gUnknown_030007B0->unk2C4 == 0)
                gUnknown_030007B0->unk0 = 3;
            if (gUnknown_030007B0->unk2C4 == 1)
                gUnknown_030007B0->unk0 = 5;
        }
        break;
    case 19:
        if (MenuUpdateWindowText())
        {
            gUnknown_030007B0->unk0 = 20;
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
        }
        break;
    case 20:
        if (!gPaletteFade.active)
        {
            sub_809D9F0(gPlayerParty, gUnknown_030007B0->unk2C5, gPlayerPartyCount - 1, sub_81327A4, gUnknown_030007B0->unk20[gUnknown_030007B0->unk1B]);
            gUnknown_030007B0->unk0 = 28;
        }
        break;
    case 21:
        if (MenuUpdateWindowText())
            gUnknown_030007B0->unk0 = 14;
        break;
    case 22:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
        break;
    case 14:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
        gUnknown_030007B0->unk0++;
        break;
    case 15:
        if (!gPaletteFade.active)
            SetMainCallback2(c2_exit_to_overworld_2_switch);
        break;
    case 28:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
        gUnknown_030007B0->unk0++;
        sub_8132FEC();
        sub_8133800();
        if (gUnknown_030007B0->unk2C4 == 0)
            sub_8133030(1);
        if (gUnknown_030007B0->unk2C4 == 1)
        {
            gSprites[1].pos1.x = 0x48;
            sub_8133140(1);
        }
        sub_8133AEC(gUnknown_030007B0->unk2C4, 1);
        break;
    case 29:
        if (!gPaletteFade.active)
        {
            if (gUnknown_030007B0->unk2C6 == 4)
            {
                gUnknown_030007B0->unk0 = 24;
            }
            else
            {
                u16 moveId = GetMonData(&gPlayerParty[gUnknown_030007B0->unk2C5], MON_DATA_MOVE1 + gUnknown_030007B0->unk2C6);

                StringCopy(gStringVar3, gMoveNames[moveId]);
                RemoveMonPPBonus(&gPlayerParty[gUnknown_030007B0->unk2C5], gUnknown_030007B0->unk2C6);
                SetMonMoveSlot(&gPlayerParty[gUnknown_030007B0->unk2C5], gUnknown_030007B0->unk20[gUnknown_030007B0->unk1B], gUnknown_030007B0->unk2C6);
                StringCopy(gStringVar2, gMoveNames[gUnknown_030007B0->unk20[gUnknown_030007B0->unk1B]]);
                sub_81328E8(gOtherText_ForgotMove123);
                gUnknown_030007B0->unk0 = 30;
                gSpecialVar_0x8004 = 1;
            }
        }
        break;
    case 30:
        if (MenuUpdateWindowText())
        {
#ifdef ENGLISH
            sub_81328E8(gOtherText_ForgotOrDidNotLearnMove);
#else
            sub_81328E8(deuOtherText_ForgotAndLearned);
#endif
            gUnknown_030007B0->unk0 = 31;
            PlayFanfare(BGM_FANFA1);
        }
        break;
    case 31:
        if (MenuUpdateWindowText())
        {
            PlayFanfare(BGM_FANFA1);
            gUnknown_030007B0->unk0 = 32;
        }
        break;
    case 32:
        if (IsFanfareTaskInactive())
            gUnknown_030007B0->unk0 = 33;
        break;
    case 33:
        if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            gUnknown_030007B0->unk0 = 14;
        }
        break;
    }
}

void sub_8132FEC(void)
{
    u32 i;

    BasicInitMenuWindow(&gWindowConfig_81E7240);
    for (i = 0; i < 4; i++)
    {
        MenuDrawTextWindow(
          gUnknown_08402CF8[i][0],
          gUnknown_08402CF8[i][1],
          gUnknown_08402CF8[i][2],
          gUnknown_08402CF8[i][3]);
    }
    BasicInitMenuWindow(&gWindowConfig_81E6CE4);
}

void sub_8133030(bool8 a)
{
    s32 i;

    gSprites[gUnknown_030007B0->unk3].invisible = FALSE;
    gSprites[gUnknown_030007B0->unk4].invisible = FALSE;
    for (i = 0; i < 16; i++)
    {
        // Hmm...
        gSprites[*((u8 *)gUnknown_030007B0 + i + 7)].invisible = TRUE;
    }
    for (i = 0; gUnknown_08402D08[i].unk0 != NULL; i++)
    {
        sub_8072C74(gTileBuffer, gUnknown_08402D08[i].unk0, 64, 2);
        MenuPrint(gTileBuffer, gUnknown_08402D08[i].unk4, gUnknown_08402D08[i].unk5);
    }
    if (!a)
    {
        sub_8072AB0(gOtherText_TeachWhichMove, 24, 120, 192, 32, 1);
    }
}

u8 sub_81330E8(void)
{
    u32 r4 = ((gMain.newKeys & 0x30) != 0);

    if (gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR
     && (gMain.newKeys & 0x300))
        r4++;

    if (r4 != 0)
    {
        PlaySE(SE_SELECT);
        gUnknown_030007B0->unk0 = 5;
        gUnknown_030007B0->unk2C4 = 1;
    }

    return r4;
}
