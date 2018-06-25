#include "global.h"
#include "matsuda_debug_menu.h"
#include "battle.h"
#include "contest.h"
#include "contest_link_80C2020.h"
#include "contest_link_80C857C.h"
#include "data2.h"
#include "link.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "overworld.h"
#include "sprite.h"
#include "start_menu.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
#include "scanline_effect.h"
#include "ewram.h"

extern u8 gUnknown_0203856C;
extern u8 gUnknown_02038694;
extern u16 gSpecialVar_ContestCategory;
extern u16 gSpecialVar_ContestRank;

extern u8 (*gMenuCallback)(void);

static bool8 sub_80A9B78(void);
static void sub_80A9BE4(u8 taskId);
static void sub_80A9C98(u8);
static void sub_80A9CC0(u8);
static void sub_80A9CDC(u8);
static void sub_80A9D58(u8);
static void sub_80A9DBC(u8);
static void sub_80A9DD8(u8);
static void sub_80A9E04(u8 taskId);
static void sub_80A9E3C(u8 taskId);
static void sub_80A9E80(u8);
static void sub_80A9ED8(u8);
static void sub_80A9F10(u8);
static void sub_80AA10C(void);
static void sub_80AA5BC(u8);
static void sub_80AA614(u8, u8);
static void sub_80AAD08(struct Sprite *, s8);

// unused
const u8 gText_Unused83C9150[] = _("テストです"); // "test"
const u8 gMatsudaDebugMenu_ActionContestText[] = _("Contest");
const u8 gMatsudaDebugMenu_ActionContestResultsText[] = _("Contest results");
// unused
const u8 gMatsudaDebugMenu_ActionChangePerimeterText[] = _("パラメータへんこう"); // "Change parameter"
// unused
const u8 gMatsudaDebugMenu_ActionChangeMoveText[] = _("わざ へんこう"); // "Change move"
const u8 gMatsudaDebugMenu_ActionContestCommText[] = _("Contest (comm.)");
const u8 gMatsudaDebugMenu_ActionCommTestText[] = _("Init comm. data");
const u8 gMatsudaDebugMenu_ActionSetHighScoreText[] = _("Set highest score");
const u8 gMatsudaDebugMenu_ActionResetHighScoreText[] = _("Reset highest score");
const u8 gMatsudaDebugMenu_ActionSetAllArtMuseumText[] = _("Set all art museum items");

const struct MenuAction gMatsudaDebugMenuActions[] =
{
    {gMatsudaDebugMenu_ActionContestText, MatsudaDebugMenu_Contest},
    {gMatsudaDebugMenu_ActionContestResultsText, MatsudaDebugMenu_ContestResults},
    {gMatsudaDebugMenu_ActionContestCommText, MatsudaDebugMenu_ContestComm},
    {gMatsudaDebugMenu_ActionCommTestText, MatsudaDebugMenu_CommTest},
    {gMatsudaDebugMenu_ActionSetHighScoreText, MatsudaDebugMenu_SetHighScore},
    {gMatsudaDebugMenu_ActionResetHighScoreText, MatsudaDebugMenu_ResetHighScore},
    {gMatsudaDebugMenu_ActionSetAllArtMuseumText, MatsudaDebugMenu_SetArtMuseumItems},
};

u8 InitMatsudaDebugMenu(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 17, 18);
    Menu_PrintItems(1, 1, 7, gMatsudaDebugMenuActions);
    InitMenu(0, 1, 1, 7, 0, 16);
    gMenuCallback = sub_80A9B78;
    return 0;
}

static bool8 sub_80A9B78(void)
{
    s8 choice = Menu_ProcessInput();

    switch (choice)
    {
    case -2:
        return FALSE;
    default:
        gMenuCallback = gMatsudaDebugMenuActions[choice].func;
        return FALSE;
    case -1:
        CloseMenu();
        return TRUE;
    }
}

u8 MatsudaDebugMenu_ContestResults(void)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
    CreateTask(sub_80A9BE4, 0xFF);
    return 1;
}

static void sub_80A9BE4(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        DestroyTask(taskId);

        if (!(gIsLinkContest & 1))
            sub_80AF668();

        sub_80C2358();
    }
}

u8 MatsudaDebugMenu_Contest(void)
{
    gIsLinkContest = 0;
    sub_80AA10C();
    return 0;
}

u8 MatsudaDebugMenu_ContestComm(void)
{
    sub_80AA10C();
    return 0;
}

u8 MatsudaDebugMenu_CommTest(void)
{
    u8 newTaskId;
    u8 newTaskId2;

    newTaskId = CreateTask(sub_80A9E3C, 0);
    SetTaskFuncWithFollowupFunc(newTaskId, sub_80A9E3C, sub_80A9C98);
    newTaskId2 = CreateTask(sub_80A9E04, 1);
    gTasks[newTaskId2].data[10] = newTaskId;
    gTasks[newTaskId].data[10] = newTaskId2;
    return 1;
}

static void sub_80A9C98(u8 taskId)
{
    Contest_CreatePlayerMon(0);
    SetTaskFuncWithFollowupFunc(taskId, sub_80C8734, sub_80A9CC0);
}

static void sub_80A9CC0(u8 taskId)
{
    SetTaskFuncWithFollowupFunc(taskId, sub_80C88AC, sub_80A9CDC);
}

static void sub_80A9CDC(u8 taskId)
{
    SetTaskFuncWithFollowupFunc(taskId, sub_80C8E1C, sub_80A9D58);
}

static void sub_80A9CF8(u8 taskId)
{
    if (gReceivedRemoteLinkPlayers == FALSE)
    {
        DestroyTask(gTasks[taskId].data[10]);
        DestroyTask(taskId);
        CloseMenu();
    }
}

static void sub_80A9D30(u8 taskId)
{
    sub_800832C();
    gTasks[taskId].func = sub_80A9CF8;
}

static void sub_80A9D58(u8 taskId)
{
   int i;
   u8 dest[4];

   for (i = 0; i < 4; i++)
       dest[i] = gTasks[taskId].data[5 + i];

   gUnknown_0203869B = sub_80C4B34(dest);
   sub_80AE82C((u8)gSpecialVar_ContestCategory);
   sub_80B0F28(0);
   SetTaskFuncWithFollowupFunc(taskId, sub_80C8EBC, sub_80A9DBC);
}

static void sub_80A9DBC(u8 taskId)
{
    SetTaskFuncWithFollowupFunc(taskId, sub_80C8F34, sub_80A9DD8);
}

static void sub_80A9DD8(u8 taskId)
{
    DestroyTask(gTasks[taskId].data[10]);
    DestroyTask(taskId);
    CloseMenu();
}

static void sub_80A9E04(u8 taskId)
{
    if (gMain.newKeys == 2)
        gTasks[(u8)gTasks[taskId].data[10]].func = sub_80A9D30;
}

static void sub_80A9E3C(u8 taskId)
{
    u8 i;

    OpenLink();

    for (i = 0; i < 4; i++)
        gBlockRecvBuffer[i][0] = 255;

    gTasks[taskId].data[0] = 0;
    gTasks[taskId].func = sub_80A9E80;
}

static void sub_80A9E80(u8 taskId)
{
    TaskFunc func;

    if (gTasks[taskId].data[0] < 10)
        gTasks[taskId].data[0]++;
    else
    {
        if (GetLinkPlayerCount_2() > 3)
        {
            gTasks[taskId].data[0] = 0;

            if (IsLinkMaster())
            {
                func = sub_80A9ED8;
                gTasks[taskId].func = (TaskFunc)func;
            }
            else
            {
                func = sub_80A9F10;
                gTasks[taskId].func = (TaskFunc)func;
            }
        }
    }
}

static void sub_80A9ED8(u8 taskId)
{
    gTasks[taskId].data[0] = gTasks[taskId].data[0] + 1;
    if ((gTasks[taskId].data[0]) == 101)
    {
        sub_8007F4C();
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = sub_80A9F10;
    }
}

static void sub_80A9F10(u8 taskId)
{
    if (gReceivedRemoteLinkPlayers)
    {
        gContestPlayerMonIndex = GetMultiplayerId();
        if (GetLinkPlayerCount() == 4)
        {
            gIsLinkContest = 1;
            SwitchTaskToFollowupFunc(taskId);
        }
    }
}

static void sub_80A9F50(void)
{
    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP;
    REG_DISPCNT |= DISPCNT_OBJ_ON | DISPCNT_BG0_ON;
    Text_LoadWindowTemplate(&gWindowTemplate_81E6C3C);
    Text_InitWindowWithTemplate(&gMenuWindow, &gWindowTemplate_81E6C3C);
    REG_MOSAIC = 0;
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    REG_BLDY = 0;
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    gBattle_BG1_X = 0;
    gBattle_BG1_Y = 0;
    gBattle_BG2_X = 0;
    gBattle_BG2_Y = 0;
    gBattle_BG3_X = 0;
    gBattle_BG3_Y = 0;
}

static void sub_80A9FE4(void)
{
    u8 ptr[] = _("{HIGHLIGHT WHITE2} ");
    DmaFill32Large(3, 0, (void *)VRAM, VRAM_SIZE, 0x1000);
    sub_80034D4((void *)VRAM, ptr);
    LoadFontDefaultPalette(&gWindowTemplate_81E6C3C);
}

//const u8 gMatsudaDebugMenu_UnknownByteArray[] = {0xFC, 0x02, 0x0F, 0x00, 0xFF};
const u8 Unknown_083C922D[] = INCBIN_U8("graphics/unknown/ball.4bpp");
const u16 Unknown_083C924E[] = INCBIN_U16("graphics/unknown/ball.gbapal");

const u8 gUnknown_083C926E[][2] =
    {
        {2,  0},
        {17, 0},
        {2,  2},
        {17, 2},
    };

const u8 gMatsudaDebugMenuContestTopLeft[][2] =
    {
        {0,   6},
        {15,  6},
        {0,   8},
        {15,  8},
        {0,  10},
        {15, 10},
    };

const u8 gUnknown_083C9282[] =
    {
        // TODO: 2d array?
        7,   6,
        22,  6,
        7,   8,
        22,  8,
        7,  10,
        22, 10,
    };

const u8 gUnknown_083C928E[][2] =
    {
        {2,  14},
        {17, 14},
        {2,  16},
        {17, 16},
    };

const u8 gUnknown_083C9296[] = {0x08, 0x80, 0x08, 0x80, 0x10, 0x10, 0x30, 0xA8, 0x30, 0xA8, 0x30, 0xA8, 0x08, 0x80, 0x08, 0x80, 0x10, 0x88};
const u8 gUnknown_083C92A8[] = {0x08, 0x18, 0x28, 0x38, 0x48, 0x58, 0x78, 0x88, 0x98};

const struct SpriteSheet gUnknown_083C92B4[] = {Unknown_083C922D, 32, 0x4B0};
const struct SpritePalette gUnknown_083C92BC[] = {Unknown_083C924E, 0x4B0};

const struct OamData gOamData_83C92C4 =
    {
        .y = 0,
        .affineMode = 0,
        .objMode = 0,
        .mosaic = 0,
        .bpp = 0,
        .shape = 0,
        .x = 0,
        .matrixNum = 0,
        .size = 0,
        .tileNum = 0,
        .priority = 0,
        .paletteNum = 0,
        .affineParam = 0,
    };

const struct SpriteTemplate gSpriteTemplate_83C92CC =
    {
        .tileTag = 1200,
        .paletteTag = 1200,
        .oam = &gOamData_83C92C4,
        .anims = gDummySpriteAnimTable,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = sub_80AA754,
    };

static void (* const gUnknown_083C92E4[][2])(struct Sprite *, s8) =
    {
        {sub_80AA8C8, sub_80AA8D8},
        {sub_80AA8E8, sub_80AA8F8},
        {sub_80AAC5C, sub_80AAC5C},
        {sub_80AA930, sub_80AA974},
        {sub_80AA9B8, sub_80AA9FC},
        {sub_80AAA40, sub_80AAA84},
        {sub_80AAAF0, sub_80AAB30},
        {sub_80AAB70, sub_80AABB0},
        {sub_80AABF0, sub_80AAD44},
    };

static const u8 gMatsudaDebugMenu_StartText[] = _("{COLOR CYAN}{HIGHLIGHT RED}");
static const u8 gMatsudaDebugMenu_StartJapText[] = _("かいし"); // because StartText is only called by StringCopy, this part appears to be unused.
static const u8 gMatsudaDebugMenu_GoBackText[] = _("もどる");

#ifdef GERMAN
static const u8 gMatsudaDebugMenu_BattlePointsText[] = _("{COLOR MAGENTA}BP,");
#else
static const u8 gMatsudaDebugMenu_BattlePointsText[] = _("{COLOR MAGENTA}BP.");
#endif

static const u8 MatsudaDebugMenuText_Cool[] = _("かっこよさ"); // cool
static const u8 MatsudaDebugMenuText_Cute[] = _("かわいさ"); // cute
static const u8 MatsudaDebugMenuText_Beauty[] = _("うつくしさ"); // beauty
static const u8 MatsudaDebugMenuText_Smart[] = _("かしこさ"); // smart
static const u8 MatsudaDebugMenuText_Tough[] = _("たくましさ"); // tough
static const u8 MatsudaDebugMenuText_Sheen[] = _("けづや"); // sheen

static const u8 *const gMatsudaDebugMenuTextList1[] =
    {
        MatsudaDebugMenuText_Cool,
        MatsudaDebugMenuText_Cute,
        MatsudaDebugMenuText_Beauty,
        MatsudaDebugMenuText_Smart,
        MatsudaDebugMenuText_Tough,
        MatsudaDebugMenuText_Sheen,
    };

static const u8 MatsudaDebugMenuText_CoolContest[] = _("かっこよさコンテスト");
static const u8 MatsudaDebugMenuText_BeautyContest[] = _("うつくしさコンテスト");
static const u8 MatsudaDebugMenuText_CuteContest[] = _("かわいさコンテスト　");
static const u8 MatsudaDebugMenuText_SmartContest[] = _("かしこさコンテスト　");
static const u8 MatsudaDebugMenuText_ToughContest[] = _("たくましさコンテスト");

static const u8 *const gMatsudaDebugMenuTextList2[] =
    {
        MatsudaDebugMenuText_CoolContest,
        MatsudaDebugMenuText_BeautyContest,
        MatsudaDebugMenuText_CuteContest,
        MatsudaDebugMenuText_SmartContest,
        MatsudaDebugMenuText_ToughContest,
    };

static const u8 MatsudaDebugMenuText_Fallarbor[] = _("ハジツゲ/ノーマル"); // Fallarbor / Normal
static const u8 MatsudaDebugMenuText_Verdanturf[] = _("シダケ/スーパー　"); // Verdanturf / Super
static const u8 MatsudaDebugMenuText_Slateport[] = _("カイナ/ハイパー　"); // Slateport / Hyper
static const u8 MatsudaDebugMenuText_Lilycove[] = _("ミナモ/マスター　"); // Lilycove / Master

static const u8 *const gMatsudaDebugMenuTextList3[] =
    {
        MatsudaDebugMenuText_Fallarbor,
        MatsudaDebugMenuText_Verdanturf,
        MatsudaDebugMenuText_Slateport,
        MatsudaDebugMenuText_Lilycove,
    };

static const struct OamData gUnknown_083C9400 =
    {
        .y = 0,
        .affineMode = 0,
        .objMode = 0,
        .mosaic = 0,
        .bpp = 0,
        .shape = 1,
        .x = 0,
        .matrixNum = 0,
        .size = 1,
        .tileNum = 1023,
        .priority = 0,
        .paletteNum = 15,
        .affineParam = 0,
    };

static void sub_80AA064(void)
{
    AnimateSprites();
    BuildOamBuffer();
    RunTasks();
    UpdatePaletteFade();
    if (gMain.newKeys == 4)
        SetMainCallback2(c2_exit_to_overworld_1_sub_8080DEC);
}

static void sub_80AA090(void)
{
    REG_BG0HOFS = gBattle_BG0_X;
    REG_BG0VOFS = gBattle_BG0_Y;
    REG_BG1HOFS = gBattle_BG1_X;
    REG_BG1VOFS = gBattle_BG1_Y;
    REG_BG2HOFS = gBattle_BG2_X;
    REG_BG2VOFS = gBattle_BG2_Y;
    REG_BG3HOFS = gBattle_BG3_X;
    REG_BG3VOFS = gBattle_BG3_Y;
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    ScanlineEffect_InitHBlankDmaTransfer();
}

static void sub_80AA10C(void)
{
    u8 i;
    u8 zero;
    u8 spriteId;

    gPaletteFade.bufferTransferDisabled = 1;
    SetVBlankCallback(0);
    sub_80A9F50();
    ScanlineEffect_Clear();
    ResetPaletteFade();
    ResetSpriteData();
    ResetTasks();
    FreeAllSpritePalettes();
    sub_80A9FE4();
    SetVBlankCallback(sub_80AA090);
    SetMainCallback2(sub_80AA064);
    gPaletteFade.bufferTransferDisabled = 0;
    gUnknown_02038694 = 0;

    if (!(gContestMons[0].nickname[0]))
        Contest_InitAllPokemon(0, 0);

    Contest_CreatePlayerMon(gUnknown_02038694);

    for (i = 0; i < 6; i++)
    {
        Text_InitWindowAndPrintText(&gMenuWindow, gMatsudaDebugMenuTextList1[i],
            (0xA * i + 0x2A), gMatsudaDebugMenuContestTopLeft[i][0],
            gMatsudaDebugMenuContestTopLeft[i][1]);
    }

    gSpecialVar_ContestCategory = gSpecialVar_ContestRank = 0;
    zero = 0; // it's possible this was some assignment that matsuda used to quickly edit and test things without changing whats passed to the later functions.
    sub_80AA5BC(zero);
    sub_80AA5E8(gSpecialVar_ContestRank);
    Text_InitWindowAndPrintText(&gMenuWindow, gMatsudaDebugMenu_GoBackText, 0xD6, 0x12, 0x12);
    Text_InitWindowAndPrintText(&gMenuWindow, gMatsudaDebugMenu_BattlePointsText, 0xDC, zero, 0xC);
    LoadSpriteSheet(gUnknown_083C92B4);
    LoadSpritePalette(gUnknown_083C92BC);
    sub_80AA280(3);
    sub_80AA658(3);
    sub_80AA614(3, zero);
    spriteId = CreateSprite(&gSpriteTemplate_83C92CC, gUnknown_083C9296[3], gUnknown_083C92A8[1], 5);
    gSprites[spriteId].data[0] = 1;
    gSprites[spriteId].data[1] = 1;
    gSprites[spriteId].data[2] = 3;
    gSprites[spriteId].data[3] = zero; // only this assignment of zero is necessary. other replacements of 0 with zero do not change the asm, compiler will treat it the same.
}

void sub_80AA280(u8 var) // no?
{
    u8 i;

    Text_FillWindowRectDefPalette(&gMenuWindow, 0, 0, 0, 0x1E, 3);
    StringCopy(gSharedMem, gMatsudaDebugMenu_StartText);
    StringAppend(gSharedMem, gContestMons[var].trainerName);

    for (i = 0; i < 4; i++)
    {
        if (var == i)
            Text_InitWindowAndPrintText(&gMenuWindow, gSharedMem, 10 * i + 2, gUnknown_083C926E[i][0], gUnknown_083C926E[i][1]);
        else
            Text_InitWindowAndPrintText(&gMenuWindow, gContestMons[i].trainerName, 10 * i + 2, gUnknown_083C926E[i][0], gUnknown_083C926E[i][1]);
    }
}

static void sub_80AA340(u8 var)
{
    ConvertIntToDecimalStringN(gSharedMem, gContestMons[var].cool, STR_CONV_MODE_RIGHT_ALIGN, 3);
    Text_InitWindowAndPrintText(&gMenuWindow, gSharedMem, 0x66, gUnknown_083C9282[0], gUnknown_083C9282[1]);
}

static void sub_80AA388(u8 var)
{
    ConvertIntToDecimalStringN(gSharedMem, gContestMons[var].cute, STR_CONV_MODE_RIGHT_ALIGN, 3);
    Text_InitWindowAndPrintText(&gMenuWindow, gSharedMem, 0x6C, gUnknown_083C9282[2], gUnknown_083C9282[3]);
}

static void sub_80AA3D0(u8 var)
{
    ConvertIntToDecimalStringN(gSharedMem, gContestMons[var].beauty, STR_CONV_MODE_RIGHT_ALIGN, 3);
    Text_InitWindowAndPrintText(&gMenuWindow, gSharedMem, 0x72, gUnknown_083C9282[4], gUnknown_083C9282[5]);
}

static void sub_80AA418(u8 var)
{
    ConvertIntToDecimalStringN(gSharedMem, gContestMons[var].smart, STR_CONV_MODE_RIGHT_ALIGN, 3);
    Text_InitWindowAndPrintText(&gMenuWindow, gSharedMem, 0x78, gUnknown_083C9282[6], gUnknown_083C9282[7]);
}

static void sub_80AA460(u8 var)
{
    ConvertIntToDecimalStringN(gSharedMem, gContestMons[var].tough, STR_CONV_MODE_RIGHT_ALIGN, 3);
    Text_InitWindowAndPrintText(&gMenuWindow, gSharedMem, 0x7E, gUnknown_083C9282[8], gUnknown_083C9282[9]);
}

static void sub_80AA4A8(u8 var)
{
    ConvertIntToDecimalStringN(gSharedMem, gContestMons[var].sheen, STR_CONV_MODE_RIGHT_ALIGN, 3);
    Text_InitWindowAndPrintText(&gMenuWindow, gSharedMem, 0x84, gUnknown_083C9282[10], gUnknown_083C9282[11]);
}

static void sub_80AA4F0(u8 var1, u8 var2)
{
    Text_FillWindowRectDefPalette(&gMenuWindow, 0, gUnknown_083C928E[var2][0], gUnknown_083C928E[var2][1], gUnknown_083C928E[var2][0] + 7, gUnknown_083C928E[var2][1] + 1);
    Text_InitWindowAndPrintText(&gMenuWindow, gMoveNames[gContestMons[var1].moves[var2]], 0x8A + var2 * 14, gUnknown_083C928E[var2][0], gUnknown_083C928E[var2][1]);
    ConvertIntToDecimalStringN(gStringVar1, gContestMons[var1].moves[var2], STR_CONV_MODE_LEADING_ZEROS, 3);
    Text_InitWindowAndPrintText(&gMenuWindow, gStringVar1, 0xFA + var2 * 6, gUnknown_083C928E[var2][0] + 7, gUnknown_083C928E[var2][1]);
}

static void sub_80AA5BC(u8 var)
{
    Text_InitWindowAndPrintText(&gMenuWindow, gMatsudaDebugMenuTextList2[var], 0xC2, 3, 0x12);
}

void sub_80AA5E8(u8 var)
{
    Text_InitWindowAndPrintText(&gMenuWindow, gMatsudaDebugMenuTextList3[var], 0xE8, 3, 4);
}

static void sub_80AA614(u8 var1, u8 var2)
{
    u16 var = sub_80AE770(var1, var2);

    ConvertIntToDecimalStringN(gSharedMem, var, STR_CONV_MODE_RIGHT_ALIGN, 3);
    Text_InitWindowAndPrintText(&gMenuWindow, gSharedMem, 0xE2, 3, 0xC);
}

void sub_80AA658(u8 var)
{
    u8 i;

    sub_80AA340(var);
    sub_80AA388(var);
    sub_80AA3D0(var);
    sub_80AA418(var);
    sub_80AA460(var);
    sub_80AA4A8(var);

    for (i = 0; i < 4; i++)
        sub_80AA4F0(var, i);
}

void SetDebugMonForContest(void)
{
    SetMonData(&gPlayerParty[0], MON_DATA_COOL, &gContestMons[gContestPlayerMonIndex].cool);
    SetMonData(&gPlayerParty[0], MON_DATA_CUTE, &gContestMons[gContestPlayerMonIndex].cute);
    SetMonData(&gPlayerParty[0], MON_DATA_BEAUTY, &gContestMons[gContestPlayerMonIndex].beauty);
    SetMonData(&gPlayerParty[0], MON_DATA_SMART, &gContestMons[gContestPlayerMonIndex].smart);
    SetMonData(&gPlayerParty[0], MON_DATA_TOUGH, &gContestMons[gContestPlayerMonIndex].tough);
    SetMonData(&gPlayerParty[0], MON_DATA_SHEEN, &gContestMons[gContestPlayerMonIndex].sheen);
    SetMonData(&gPlayerParty[0], MON_DATA_MOVE1, &gContestMons[gContestPlayerMonIndex].moves[0]);
    SetMonData(&gPlayerParty[0], MON_DATA_MOVE2, &gContestMons[gContestPlayerMonIndex].moves[1]);
    SetMonData(&gPlayerParty[0], MON_DATA_MOVE3, &gContestMons[gContestPlayerMonIndex].moves[2]);
    SetMonData(&gPlayerParty[0], MON_DATA_MOVE4, &gContestMons[gContestPlayerMonIndex].moves[3]);
}

void sub_80AA754(struct Sprite *sprite)
{
    switch (gMain.newAndRepeatedKeys)
    {
    case DPAD_RIGHT:
    case DPAD_LEFT:
        sprite->data[0] ^= 1;
        break;
    case DPAD_UP:
        if (sprite->data[1] == 0)
            sprite->data[1] = 8;
        else
            sprite->data[1]--;
        break;
    case DPAD_DOWN:
        if (sprite->data[1] == 8)
            sprite->data[1] = 0;
        else
            sprite->data[1]++;
        break;
    case A_BUTTON:
        gUnknown_083C92E4[sprite->data[1]][sprite->data[0]](sprite, 1);
        sub_80AA614(sprite->data[2], sprite->data[3]);
        break;
    case B_BUTTON:
        gUnknown_083C92E4[sprite->data[1]][sprite->data[0]](sprite, -1);
        sub_80AA614(sprite->data[2], sprite->data[3]);
        break;
    case R_BUTTON:
        gUnknown_083C92E4[sprite->data[1]][sprite->data[0]](sprite, 10);
        sub_80AA614(sprite->data[2], sprite->data[3]);
        break;
    case L_BUTTON:
        gUnknown_083C92E4[sprite->data[1]][sprite->data[0]](sprite, -10);
        sub_80AA614(sprite->data[2], sprite->data[3]);
        break;
    case START_BUTTON:
        sub_80AAD08(sprite, 1);
        break;
    }
    sprite->pos1.x = gUnknown_083C9296[sprite->data[0] + sprite->data[1] * 2];
    sprite->pos1.y = gUnknown_083C92A8[sprite->data[1]];
}

static void sub_80AA8A0(struct Sprite *sprite, s8 var1, u8 var2)
{
    if (var1 == 1)
    {
        sprite->data[2] = var2;
        sub_80AA280(var2);
        sub_80AA658(sprite->data[2]);
    }
}

void sub_80AA8C8(struct Sprite *sprite, s8 var1)
{
    sub_80AA8A0(sprite, var1, 0);
}

void sub_80AA8D8(struct Sprite *sprite, s8 var1)
{
    sub_80AA8A0(sprite, var1, 1);
}

void sub_80AA8E8(struct Sprite *sprite, s8 var1)
{
    sub_80AA8A0(sprite, var1, 2);
}

void sub_80AA8F8(struct Sprite *sprite, s8 var1)
{
    sub_80AA8A0(sprite, var1, 3);
}

static u8 sub_80AA908(u32 a1, u8 a2, s8 a3) // first param is unused.
{
    s16 val = a2 + a3;

    if (val > 255)
        val = 255;
    else if (val < 0)
        val = 0;

    return val;
}

void sub_80AA930(struct Sprite *sprite, s8 var2)
{
    u8 val = sprite->data[2];

    gContestMons[sprite->data[2]].cool = sub_80AA908(val, gContestMons[sprite->data[2]].cool, var2);
    sub_80AA340(sprite->data[2]);
}

void sub_80AA974(struct Sprite *sprite, s8 var2)
{
    u8 val = sprite->data[2];

    gContestMons[sprite->data[2]].cute = sub_80AA908(val, gContestMons[sprite->data[2]].cute, var2);
    sub_80AA388(sprite->data[2]);
}

void sub_80AA9B8(struct Sprite *sprite, s8 var2)
{
    u8 val = sprite->data[2];

    gContestMons[sprite->data[2]].beauty = sub_80AA908(val, gContestMons[sprite->data[2]].beauty, var2);
    sub_80AA3D0(sprite->data[2]);
}

void sub_80AA9FC(struct Sprite *sprite, s8 var2)
{
    u8 val = sprite->data[2];

    gContestMons[sprite->data[2]].smart = sub_80AA908(val, gContestMons[sprite->data[2]].smart, var2);
    sub_80AA418(sprite->data[2]);
}

void sub_80AAA40(struct Sprite *sprite, s8 var2)
{
    u8 val = sprite->data[2];

    gContestMons[sprite->data[2]].tough = sub_80AA908(val, gContestMons[sprite->data[2]].tough, var2);
    sub_80AA460(sprite->data[2]);
}

void sub_80AAA84(struct Sprite *sprite, s8 var2)
{
    u8 val = sprite->data[2];

    gContestMons[sprite->data[2]].sheen = sub_80AA908(val, gContestMons[sprite->data[2]].sheen, var2);
    sub_80AA4A8(sprite->data[2]);
}

// a similar function is at 0x80AA908, however, it apparently returns the wrong type (u8 vs u16).
static u16 sub_80AAAC8(u32 a1, u16 a2, s8 a3) // first param is unused.
{
    s16 val = a2 + a3;

    if (val > 354)
        val = 1;
    else if (val < 0)
        val = 354;

    return val;
}

void sub_80AAAF0(struct Sprite *sprite, s8 var2)
{
    u8 val = sprite->data[2];

    gContestMons[sprite->data[2]].moves[0] = sub_80AAAC8(val, gContestMons[sprite->data[2]].moves[0], var2);
    sub_80AA4F0(sprite->data[2], 0);
}

void sub_80AAB30(struct Sprite *sprite, s8 var2)
{
    u8 val = sprite->data[2];

    gContestMons[sprite->data[2]].moves[1] = sub_80AAAC8(val, gContestMons[sprite->data[2]].moves[1], var2);
    sub_80AA4F0(sprite->data[2], 1);
}

void sub_80AAB70(struct Sprite *sprite, s8 var2)
{
    u8 val = sprite->data[2];

    gContestMons[sprite->data[2]].moves[2] = sub_80AAAC8(val, gContestMons[sprite->data[2]].moves[2], var2);
    sub_80AA4F0(sprite->data[2], 2);
}

void sub_80AABB0(struct Sprite *sprite, s8 var2)
{
    u8 val = sprite->data[2];

    gContestMons[sprite->data[2]].moves[3] = sub_80AAAC8(val, gContestMons[sprite->data[2]].moves[3], var2);
    sub_80AA4F0(sprite->data[2], 3);
}

void sub_80AABF0(struct Sprite *sprite, s8 var2)
{
    s8 a = (var2 > 0) ? 1 : -1;
    s8 r4 = sprite->data[3] + a;

    if (r4 < 0)
        r4 = 0;
    else if (r4 > 4)
        r4 = 4;
    sub_80AA5BC(r4);
    sprite->data[3] = r4;
    gSpecialVar_ContestCategory = sprite->data[3];
    Contest_InitAllPokemon(sprite->data[3], gSpecialVar_ContestRank);
    sub_80AA280(sprite->data[2]);
    sub_80AA658(sprite->data[2]);
}

void sub_80AAC5C(struct Sprite *sprite, s8 var2)
{
    if (var2 > 0)
        gSpecialVar_ContestRank++;
    else if (gSpecialVar_ContestRank != 0)
        gSpecialVar_ContestRank--;
    if (gSpecialVar_ContestRank > 3)
        gSpecialVar_ContestRank = 3;
    sub_80AA5E8(gSpecialVar_ContestRank);
    Contest_InitAllPokemon(gSpecialVar_ContestCategory, gSpecialVar_ContestRank);
    sub_80AA280(sprite->data[2]);
    sub_80AA658(sprite->data[2]);
}

void sub_80AACC4(void)
{
    UpdatePaletteFade();
    if (!gPaletteFade.active)
    {
        SetDebugMonForContest();
        if (!(gIsLinkContest & 1))
            sub_80AE82C(eMatsudaDebugVar);
        SetMainCallback2(CB2_StartContest);
    }
}

void sub_80AAD08(struct Sprite *sprite, s8 var2)
{
    if (var2 == 1)
    {
        eMatsudaDebugVar = sprite->data[3];
        SetMainCallback2(sub_80AACC4);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
    }
}

void sub_80AAD44(struct Sprite *sprite, s8 var2)
{
    if (var2 == 1)
    {
        int i;

        SetDebugMonForContest();
        for (i = 0; i < 4; i++)
            gUnknown_02038670[i] = sub_80AE770(i, gSpecialVar_ContestCategory);
        SetMainCallback2(c2_exit_to_overworld_1_sub_8080DEC);
    }
}

void sub_80AAD84(u8 *string, u8 b, u8 c, u8 d)
{
    u16 len;
    u8 r7;
    s32 i;
    u8 sp0[32];
    u8 sp20[32];
    u8 str2[2];

    DmaClear32(3, (void *)(VRAM + 0x18000 - (d + 1) * 256), 0x100);

    len = StringLength(string);
    if (len > 8)
        len = 8;

    for (i = 0; i < len; i++)
    {
        str2[0] = string[i];
        str2[1] = EOS;
        sub_80034D4(sp0, str2);
        DmaCopy32Defvars(3, sp20, (void *)(VRAM + 0x18000 - (d + 1) * 256 + i * 32), sizeof(sp0));
    }

    r7 = 124 - d * 2;

    gMain.oamBuffer[r7] = gUnknown_083C9400;
    gMain.oamBuffer[r7].tileNum = 1024 - (d + 1) * 8;
    gMain.oamBuffer[r7].x = b;
    gMain.oamBuffer[r7].y = c;

    gMain.oamBuffer[r7 + 1] = gUnknown_083C9400;
    gMain.oamBuffer[r7 + 1].tileNum = gMain.oamBuffer[r7].tileNum + 4;
    gMain.oamBuffer[r7 + 1].x = b + 32;
    gMain.oamBuffer[r7 + 1].y = c;
}

void unref_sub_80AAEE8(s32 a, u8 b, u8 c, u8 d)
{
    u8 string[12];
    u8 offset = 0;

    if (a < 0)
    {
        string[0] = 0xAE;
        offset = 1;
    }
    ConvertIntToDecimalStringN(string + offset, (a < 0) ? -a : a, 0, 8);
    sub_80AAD84(string, b, c, d);
}

void sub_80AAF30(void)
{
    s32 i;

    gUnknown_0203856C = 1;
    gContestPlayerMonIndex = 3;
    Contest_CreatePlayerMon(0);

    for (i = 3; i > -1; i--)
        gContestFinalStandings[i] = 3 - i;

    for (i = 0; i < 3; i++)
    {
        gUnknown_02038670[i] = 0;
        gUnknown_02038680[i] = 0;
        gUnknown_02038678[i] = 0;
        gContestMons[i] = gContestMons[3];
    }

    gUnknown_02038670[3] = 0x12C;
    gUnknown_02038680[3] = 0x190;
    gUnknown_02038678[3] = 0x190;
    Contest_SaveWinner(0xFE);
}

u8 MatsudaDebugMenu_SetHighScore(void)
{
    sub_80AAF30();
    CloseMenu();
    return 1;
}

u8 MatsudaDebugMenu_ResetHighScore(void)
{
    s32 i;

    gUnknown_0203856C = 0;
    for (i = 0; i < 4; i++)
    {
        gUnknown_02038670[i] = 0;
        gUnknown_02038680[i] = 0;
        gUnknown_02038678[i] = 0;
    }
    CloseMenu();
    return 1;
}

u8 MatsudaDebugMenu_SetArtMuseumItems(void)
{
    s32 i;

    gContestPlayerMonIndex = 3;
    Contest_CreatePlayerMon(0);
    for (i = 3; i > -1; i--)
        gContestFinalStandings[i] = 3 - i;
    for (gSpecialVar_ContestCategory = 0; gSpecialVar_ContestCategory < 5; gSpecialVar_ContestCategory++)
        Contest_SaveWinner(0xFF);
    CloseMenu();
    return 1;
}
