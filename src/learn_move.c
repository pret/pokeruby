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
#include "strings.h"
#include "strings2.h"
#include "task.h"
#include "trig.h"

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
extern const struct SpriteSheet gUnknown_08402D80;
extern const struct SpritePalette gUnknown_08402D88;

extern void sub_809D9F0(struct Pokemon *, u8, u8, void *, u32);

struct Struct2017000
{
    u8 unk0;
    u8 filler1;
    u8 unk2;
    u8 unk3[2];
    //u8 unk4;
    u8 unk5[16];
    u8 filler15[3];
    u8 unk18;
    u8 unk19;
    u8 unk1A;
    u8 unk1B;
    u8 unk1C;
    u8 unk1D;
    u8 unk1E;
    u8 filler1F;
    //u16 unk20[4];
    //u8 filler28[0x2C3-0x28];
    u16 unk20[20];
    u8 filler48[0x52-0x48];
    //u8 unk52[0x2C3-0x52];
    u8 unk52[6][0x19];
    u8 fillerE8[0x2C3-0xE8];
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

const struct UnknownStruct1 gUnknown_08402D08[][4] =
{
    {
        {OtherText_Battle,   1, 1, 0},
        {OtherText_Power,    1, 4, 1},
        {OtherText_Accuracy, 1, 9, 2},
        {NULL,               0, 0, 0},
    },
    {
        {OtherText_Contest,  1, 1, 0},
        {OtherText_Appeal,   1, 4, 1},
        {OtherText_Jam,      1, 9, 2},
        {NULL,               0, 0, 0},
    },
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
void sub_8133AEC(u8, int);
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

    gSprites[gUnknown_030007B0->unk3[0]].invisible = FALSE;
    gSprites[gUnknown_030007B0->unk3[1]].invisible = FALSE;
    for (i = 0; i < 16; i++)
    {
        // Hmm...
        gSprites[*((u8 *)gUnknown_030007B0 + i + 7)].invisible = TRUE;
    }
    for (i = 0; gUnknown_08402D08[0][i].unk0 != NULL; i++)
    {
        sub_8072C74(gTileBuffer, gUnknown_08402D08[0][i].unk0, 64, 2);
        MenuPrint(gTileBuffer, gUnknown_08402D08[0][i].unk4, gUnknown_08402D08[0][i].unk5);
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

void sub_8133140(bool8 a)
{
    s32 i;

    gSprites[gUnknown_030007B0->unk3[0]].invisible = FALSE;
    gSprites[gUnknown_030007B0->unk3[1]].invisible = FALSE;
    for (i = 0; i < 16; i++)
    {
        // Hmm...
        gSprites[*((u8 *)gUnknown_030007B0 + i + 7)].invisible = FALSE;
    }
    for (i = 0; gUnknown_08402D08[0][i].unk0 != NULL; i++)
    {
        sub_8072C74(gTileBuffer, gUnknown_08402D08[1][i].unk0, 64, 2);
        MenuPrint(gTileBuffer, gUnknown_08402D08[1][i].unk4, gUnknown_08402D08[1][i].unk5);
        if (i != 0)
        {
            MenuZeroFillWindowRect(
              gUnknown_08402D08[1][i].unk4,
              gUnknown_08402D08[1][i].unk5 + 2,
              gUnknown_08402D08[1][i].unk4 + 7,
              gUnknown_08402D08[1][i].unk5 + 3);
        }
    }
    if (!a)
        sub_8072AB0(gOtherText_TeachWhichMove, 24, 120, 192, 32, 1);
}

u8 sub_8133248(void)
{
    u32 r4 = ((gMain.newKeys & 0x30) != 0);

    if (gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR
     && (gMain.newKeys & 0x300))
        r4++;

    if (r4 != 0)
    {
        PlaySE(SE_SELECT);
        gUnknown_030007B0->unk0 = 3;
        gUnknown_030007B0->unk2C4 = 0;
    }

    return r4;
}

void sub_81332A0(void)
{
    s32 i;

    gUnknown_030007B0->unk0 = 0;
    gUnknown_030007B0->unk2 = 0;
    gUnknown_030007B0->unk19 = 0;
    gUnknown_030007B0->unk18 = 0;
    gUnknown_030007B0->unk1C = 0;
    gUnknown_030007B0->unk1A = 0;
    gUnknown_030007B0->unk1B = 0;
    gUnknown_030007B0->unk1D = 0;
    gUnknown_030007B0->unk1E = 0;
    gUnknown_030007B0->unk2C3 = 0;
    gUnknown_030007B0->unk2C4 = 0;
    for (i = 0; i < 20; i++)
        gUnknown_030007B0->unk20[i] = 0;
}

void sub_8133300(struct Sprite *sprite)
{
    s16 var = (sprite->data1 * 10) & 0xFF;

    switch (sprite->data0)
    {
    case 0:
        break;
    case 1:
        sprite->pos2.x = Sin(var, 3) * sprite->data2;
        break;
    case 2:
        sprite->pos2.y = Sin(var, 1) * sprite->data2;
        break;
    }
    sprite->data1++;
}

extern const struct SpriteTemplate gSpriteTemplate_8402D90;
extern const struct SpriteTemplate gSpriteTemplate_8402DC0;
extern const struct SpriteTemplate gSpriteTemplate_8402E08;

void sub_8133358(void)
{
    s32 i;

    gUnknown_030007B0->unk3[0] = CreateSprite(&gSpriteTemplate_8402D90, 8, 16, 0);
    gSprites[gUnknown_030007B0->unk3[0]].data0 = 1;
    gSprites[gUnknown_030007B0->unk3[0]].data2 = -1;

    gUnknown_030007B0->unk3[1] = CreateSprite(&gSpriteTemplate_8402D90, 72, 16, 0);
    StartSpriteAnim(&gSprites[gUnknown_030007B0->unk3[1]], 1);
    gSprites[gUnknown_030007B0->unk3[1]].data0 = 1;
    gSprites[gUnknown_030007B0->unk3[1]].data2 = 1;

    gUnknown_030007B0->unk3[2] = CreateSprite(&gSpriteTemplate_8402DC0, 160, 4, 0);
    StartSpriteAnim(&gSprites[gUnknown_030007B0->unk3[2]], 1);
    gSprites[gUnknown_030007B0->unk3[2]].data0 = 2;
    gSprites[gUnknown_030007B0->unk3[2]].data2 = -1;

    gUnknown_030007B0->unk3[3] = CreateSprite(&gSpriteTemplate_8402DC0, 160, 60, 0);
    gSprites[gUnknown_030007B0->unk3[3]].data0 = 2;
    gSprites[gUnknown_030007B0->unk3[3]].data2 = 1;

    for (i = 0; i < 8; i++)
    {
        gUnknown_030007B0->unk3[i + 4] = CreateSprite(&gSpriteTemplate_8402E08, (i - (i / 4) * 4) * 8 + 0x1C, (i / 4) * 8 + 0x34, 0);
        StartSpriteAnim(&gSprites[gUnknown_030007B0->unk3[i + 4]], 2);
    }

    for (i = 0; i < 8; i++)
    {
        gUnknown_030007B0->unk3[i + 12] = CreateSprite(&gSpriteTemplate_8402E08, (i - (i / 4) * 4) * 8 + 0x1C, (i / 4) * 8 + 0x5C, 0);
        StartSpriteAnim(&gSprites[gUnknown_030007B0->unk3[i + 12]], 2);
    }

    for (i = 0; i < 20; i++)
        gSprites[gUnknown_030007B0->unk3[i]].invisible = TRUE;

    CreateBlendedOutlineCursor(16, 0xFFFF, 12, 0x2D9F, 18);
}

void sub_8133558(void)
{
    s32 i;
    u8 nickname[POKEMON_NAME_LENGTH + 1];

    gUnknown_030007B0->unk1A = GetMoveRelearnerMoves(&gPlayerParty[gUnknown_030007B0->unk2C5], gUnknown_030007B0->unk20);
    for (i = 0; i < gUnknown_030007B0->unk1A; i++)
        StringCopy(gUnknown_030007B0->unk52[i], gMoveNames[gUnknown_030007B0->unk20[i]]);
    GetMonData(&gPlayerParty[gUnknown_030007B0->unk2C5], MON_DATA_NICKNAME, nickname);
    StringCopy10(gStringVar1, nickname);
    StringCopy(gUnknown_030007B0->unk52[gUnknown_030007B0->unk1A], gUnknownText_Exit);
    gUnknown_030007B0->unk1A++;
}

void sub_813360C(s8 a)
{
    gUnknown_030007B0->unk1C = gUnknown_030007B0->unk18;
    gUnknown_030007B0->unk18 += a;
    gUnknown_030007B0->unk1D = 1;
}

void sub_813362C(void)
{
    if (gMain.newAndRepeatedKeys & 0x40)
    {
        if (gUnknown_030007B0->unk1B != 0)
        {
            PlaySE(SE_SELECT);
            gUnknown_030007B0->unk1B--;
            gUnknown_030007B0->unk2C3 = 1;
            if (gUnknown_030007B0->unk18 != 0)
            {
                sub_813360C(-1);
            }
            else if (gUnknown_030007B0->unk19 != 0)
            {
                gUnknown_030007B0->unk19--;
                gUnknown_030007B0->unk1E++;
            }
        }
    }
    else if (gMain.newAndRepeatedKeys & 0x80)
    {
        if (gUnknown_030007B0->unk1B < gUnknown_030007B0->unk1A - 1)
        {
            PlaySE(SE_SELECT);
            gUnknown_030007B0->unk1B++;
            gUnknown_030007B0->unk2C3 = 1;
            if (gUnknown_030007B0->unk18 != 2)
            {
                sub_813360C(1);
            }
            else if (gUnknown_030007B0->unk19 != gUnknown_030007B0->unk1A - 3)
            {
                gUnknown_030007B0->unk19++;
                gUnknown_030007B0->unk1E++;
            }
        }
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        if (gUnknown_030007B0->unk1B != gUnknown_030007B0->unk1A - 1)
        {
            gUnknown_030007B0->unk0 = 8;
            StringCopy(gStringVar2, gUnknown_030007B0->unk52[gUnknown_030007B0->unk1B]);
            StringExpandPlaceholders(gStringVar4, gOtherText_TeachSpecificMove);
            MenuPrintMessage(gStringVar4, 3, 15);
        }
        else
        {
            StringExpandPlaceholders(gStringVar4, gOtherText_GiveUpTeachingMove);
            MenuPrintMessage(gStringVar4, 3, 15);
            gUnknown_030007B0->unk0 = 12;
        }
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_SELECT);
        gUnknown_030007B0->unk0 = 12;
        StringExpandPlaceholders(gStringVar4, gOtherText_GiveUpTeachingMove);
        MenuPrintMessage(gStringVar4, 3, 15);
    }
    if (gUnknown_030007B0->unk1A > 3)
    {
        gSprites[2].invisible = FALSE;
        gSprites[3].invisible = FALSE;
        if (gUnknown_030007B0->unk19 == 0)
            gSprites[2].invisible = TRUE;
        else if (gUnknown_030007B0->unk19 == gUnknown_030007B0->unk1A - 3)
            gSprites[3].invisible = TRUE;
    }
}

extern const u8 *const gUnknown_083CAF70[];

struct ContestMove
{
    u8 effect;
    u8 contestCategory:3;
    u8 comboStarterId;
    u8 comboMoves[4];
};

extern const struct ContestMove gContestMoves[];
extern const u8 gTypeNames[][7];

void sub_8133800(void)
{
    u8 r6 = gUnknown_030007B0->unk19;
    u8 *str = gTileBuffer;
    s32 i;

    for (i = 0; i < 3; i++)
    {
        if (r6 >= gUnknown_030007B0->unk1A)
        {
            str = sub_8072C74(str, gEmptyString_81E72B0, 0x90, 0);
        }
        else if (r6 == gUnknown_030007B0->unk1A - 1)
        {
            str = sub_8072C74(str, gUnknownText_Exit, 0x90, 0);
        }
        else
        {
            u16 moveId = gUnknown_030007B0->unk20[r6];

            if (gUnknown_030007B0->unk2C4 != 0)
                str = sub_8072C74(str, gUnknown_083CAF70[gContestMoves[moveId].contestCategory], 0x27, 0);
            else
                str = sub_8072C74(str, gTypeNames[gBattleMoves[moveId].type], 0x27, 0);

            str = sub_8072C74(str, gUnknown_030007B0->unk52[r6], 0x72, 0);

            str[0] = 0xCA;
            str[1] = 0xCA;
            str[2] = 0xBA;
            str += 3;

            str = sub_8072C14(str, gBattleMoves[moveId].pp, 0x90, 0);
        }
        *str++ = 0xFE;
        r6++;
    }
    *str = 0xFF;
    MenuPrint(gTileBuffer, 11, 1);
    sub_813360C(0);
}

struct ContestEffect
{
    u8 effectType;
    u8 appeal;
    u8 jam;
};

extern const struct ContestEffect gContestEffects[];

void sub_8133940(u16 a, const u8 *b)
{
    u8 str[0x34];
    u8 numHearts;
    u8 i;

    StringCopy(str, gExpandedPlaceholder_Empty);
    switch (b[2])
    {
    case 1:
        break;
    case 2:
        if (gBattleMoves[a].power < 2)
            sub_8072C74(str, gOtherText_ThreeDashes2, 32, 2);
        else
            sub_8072C14(str, gBattleMoves[a].power, 32, 2);
        MenuPrint(str, b[0], b[1]);
        break;
    case 4:
        if (gBattleMoves[a].accuracy == 0)
            sub_8072C74(str, gOtherText_ThreeDashes2, 32, 2);
        else
            sub_8072C14(str, gBattleMoves[a].accuracy, 32, 2);
        MenuPrint(str, b[0], b[1]);
        break;
    case 6:
        MenuZeroFillWindowRect(b[0], b[1], b[0], b[1] + 1);
        numHearts = gContestEffects[gContestMoves[a].effect].appeal / 10;
        if (numHearts == 255)
            numHearts = 0;
        for (i = 0; i < 8; i++)
        {
            if (i < numHearts)
                StartSpriteAnim(&gSprites[gUnknown_030007B0->unk3[i + 4]], 1);
            else
                StartSpriteAnim(&gSprites[gUnknown_030007B0->unk3[i + 4]], 0);
        }
        break;
    case 7:
        MenuZeroFillWindowRect(b[0], b[1], b[0], b[1] + 1);
        numHearts = gContestEffects[gContestMoves[a].effect].jam / 10;
        if (numHearts == 255)
            numHearts = 0;
        for (i = 0; i < 8; i++)
        {
            if (i < numHearts)
                StartSpriteAnim(&gSprites[gUnknown_030007B0->unk3[i + 12]], 3);
            else
                StartSpriteAnim(&gSprites[gUnknown_030007B0->unk3[i + 12]], 2);
        }
        break;
    }
}

extern const u8 gUnknown_08402E24[][3];
extern const u8 gUnknown_08402E3D[];
extern const u8 gUnknown_08402E39[];

extern const u8 *const gUnknown_083CADD4[];
extern const u8 *const gMoveDescriptions[];

void sub_8133AEC(u8 a, int unused)
{
    u16 i;

    if (gUnknown_030007B0->unk1B != gUnknown_030007B0->unk1A - 1)
    {
        u16 r5 = gUnknown_030007B0->unk20[gUnknown_030007B0->unk1B];

        if (a != 0)
        {
            for (i = 0; i < 16; i++)
                gSprites[gUnknown_030007B0->unk3[i + 4]].invisible = FALSE;
            for (i = 0; i < 3; i++)
                sub_8133940(r5, gUnknown_08402E24[gUnknown_08402E3D[i]]);
            sub_8072AB0(gUnknown_083CADD4[gContestMoves[r5].effect], 0x58, 0x48, 0x90, 32, 1);
        }
        //_08133BA0
        else
        {
            u8 var;

            for (i = 0; i < 4; i++)
                sub_8133940(r5, gUnknown_08402E24[gUnknown_08402E39[i]]);
            var = sub_8072A18(gMoveDescriptions[r5 - 1], 0x58, 0x48, 0x90, 1);
            if (var < 2)
            {
                u8 r1 = var * 2 + 9;

                MenuFillWindowRectWithBlankTile(11, r1, 28, 12);
            }
        }
    }
    else
    {
        if (a != 0)
        {
            MenuZeroFillWindowRect(gUnknown_08402E24[5][0], gUnknown_08402E24[5][1], gUnknown_08402E24[5][0], gUnknown_08402E24[5][1] + 1);
            MenuZeroFillWindowRect(gUnknown_08402E24[6][0], gUnknown_08402E24[6][1], gUnknown_08402E24[6][0], gUnknown_08402E24[6][1] + 1);
            for (i = 0; i < 16; i++)
                gSprites[gUnknown_030007B0->unk3[i + 4]].invisible = TRUE;
        }
        else
        {
            MenuZeroFillWindowRect(gUnknown_08402E24[1][0], gUnknown_08402E24[1][1], gUnknown_08402E24[1][0] + 3, gUnknown_08402E24[1][1] + 1);
            MenuZeroFillWindowRect(gUnknown_08402E24[3][0], gUnknown_08402E24[3][1], gUnknown_08402E24[3][0] + 3, gUnknown_08402E24[3][1] + 1);
        }
        MenuZeroFillWindowRect(11, 9, 28, 12);
    }
}

void sub_8133CA4(void)
{
    MenuZeroFillWindowRect(21, 7, 27, 12);
    sub_8133AEC(gUnknown_030007B0->unk2C4, 0);
}
