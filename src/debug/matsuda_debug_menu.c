#include "global.h"
#include "matsuda_debug_menu.h"
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
#include "unknown_task.h"

extern u8 gUnknown_0203856C;
extern u8 gUnknown_0203857D[][64];
extern u16 gUnknown_02038670[];
extern u16 gUnknown_02038678[];
extern u16 gUnknown_02038680[];
extern u8 gUnknown_02038690[];
extern u8 gUnknown_02038694;
extern u8 gIsLinkContest;
extern u8 gUnknown_0203869B;
extern u8 gContestPlayerMonIndex;
extern u16 gScriptContestCategory;
extern u16 gScriptContestRank;

extern u16 gUnknown_030042A4;
extern u16 gUnknown_030042A0;
extern u16 gUnknown_030042C0;
extern u16 gUnknown_030041B4;
extern u16 gUnknown_03004288;
extern u16 gUnknown_03004280;
extern u16 gUnknown_030041B0;
extern u16 gUnknown_030041B8;
extern struct Window gUnknown_03004210;
extern u8 (*gCallback_03004AE8)(void);

extern u8 gUnknown_083C926E[][2];
extern u8 gUnknown_083C9282[];
extern const u8 gUnknown_083C928E[][2];
extern u8 gUnknown_083C9296[];
extern u8 gUnknown_083C92A8[];
extern u8 unk_2000000[];
extern u8 gMatsudaDebugMenu_GoBackText[];
extern u8 gMatsudaDebugMenu_BattlePointsText[];
extern u8 gMatsudaDebugMenu_StartText[];

extern struct SpritePalette gUnknown_083C92BC;
extern struct SpriteSheet gUnknown_083C92B4;
extern struct SpriteTemplate gSpriteTemplate_83C92CC;
extern void (*gUnknown_083C92E4[][2])(struct Sprite *, s8);
extern u32 gUnknown_083C9400[2];


extern u8 gMatsudaDebugMenu_UnknownByteArray[];
extern u8* gMatsudaDebugMenuTextList1[];
extern u8* gMatsudaDebugMenuTextList2[];
extern u8* gMatsudaDebugMenuTextList3[];
extern u8 gMatsudaDebugMenuContestTopLeft[][2];

extern bool8 gReceivedRemoteLinkPlayers;

extern struct MenuAction gMatsudaDebugMenuActions[];

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

u8 unref_sub_80A9B28(void)
{
    MenuZeroFillScreen();
    MenuDrawTextWindow(0, 0, 17, 18);
    PrintMenuItems(1, 1, 7, gMatsudaDebugMenuActions);
    InitMenu(0, 1, 1, 7, 0, 16);
    gCallback_03004AE8 = sub_80A9B78;
    return 0;
}

static bool8 sub_80A9B78(void)
{
    s8 choice = ProcessMenuInput();

    switch (choice)
    {
    case -2:
        return FALSE;
    default:
        gCallback_03004AE8 = gMatsudaDebugMenuActions[choice].func;
        return FALSE;
    case -1:
        CloseMenu();
        return TRUE;
    }
}

s8 MatsudaDebugMenu_ContestResults(void)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
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

s8 MatsudaDebugMenu_Contest(void)
{
    gIsLinkContest = 0;
    sub_80AA10C();
    return 0;
}

s8 MatsudaDebugMenu_ContestComm(void)
{
    sub_80AA10C();
    return 0;
}

s8 MatsudaDebugMenu_CommTest(void)
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
    sub_80AE098(0);
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
   sub_80AE82C((u8)gScriptContestCategory);
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
    SetUpWindowConfig(&gWindowConfig_81E6C3C);
    InitWindowFromConfig(&gMenuWindow, &gWindowConfig_81E6C3C);
    REG_MOSAIC = 0;
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    REG_BLDY = 0;
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    gUnknown_030042A4 = 0;
    gUnknown_030042A0 = 0;
    gUnknown_030042C0 = 0;
    gUnknown_030041B4 = 0;
    gUnknown_03004288 = 0;
    gUnknown_03004280 = 0;
    gUnknown_030041B0 = 0;
    gUnknown_030041B8 = 0;
}

static void sub_80A9FE4(void)
{
    u8 *addr;
    u32 i;
    u8 ptr[5];

    memcpy(ptr, gMatsudaDebugMenu_UnknownByteArray, 5);

    addr = (void *)VRAM;
    i = VRAM_SIZE;

    while (1)
    {
        DmaFill32(3, 0, addr, 0x1000);
        addr += 0x1000;
        i -= 0x1000;
        if (i <= 0x1000)
        {
            DmaFill32(3, 0, addr, i);
            break;
        }
    }
    sub_80034D4((void *)VRAM, ptr);
    LoadFontDefaultPalette(&gWindowConfig_81E6C3C);
}

static void sub_80AA064(void)
{
    AnimateSprites();
    BuildOamBuffer();
    RunTasks();
    UpdatePaletteFade();
    if (gMain.newKeys == 4)
        SetMainCallback2(sub_805469C);
}

static void sub_80AA090(void)
{
    REG_BG0HOFS = gUnknown_030042A4;
    REG_BG0VOFS = gUnknown_030042A0;
    REG_BG1HOFS = gUnknown_030042C0;
    REG_BG1VOFS = gUnknown_030041B4;
    REG_BG2HOFS = gUnknown_03004288;
    REG_BG2VOFS = gUnknown_03004280;
    REG_BG3HOFS = gUnknown_030041B0;
    REG_BG3VOFS = gUnknown_030041B8;
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    sub_8089668();
}

static void sub_80AA10C(void)
{
    u8 i;
    u8 zero;
    u8 spriteId;

    gPaletteFade.bufferTransferDisabled = 1;
    SetVBlankCallback(0);
    sub_80A9F50();
    dp12_8087EA4();
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
        sub_80AE398(0, 0);

    sub_80AE098(gUnknown_02038694);

    for (i = 0; i < 6; i++)
    {
        sub_8003460(&gMenuWindow, gMatsudaDebugMenuTextList1[i],
            (0xA * i + 0x2A), gMatsudaDebugMenuContestTopLeft[i][0],
            gMatsudaDebugMenuContestTopLeft[i][1]);
    }

    gScriptContestCategory = gScriptContestRank = 0;
    zero = 0; // it's possible this was some assignment that matsuda used to quickly edit and test things without changing whats passed to the later functions.
    sub_80AA5BC(zero);
    sub_80AA5E8(gScriptContestRank);
    sub_8003460(&gMenuWindow, gMatsudaDebugMenu_GoBackText, 0xD6, 0x12, 0x12);
    sub_8003460(&gMenuWindow, gMatsudaDebugMenu_BattlePointsText, 0xDC, zero, 0xC);
    LoadSpriteSheet(&gUnknown_083C92B4);
    LoadSpritePalette(&gUnknown_083C92BC);
    sub_80AA280(3);
    sub_80AA658(3);
    sub_80AA614(3, zero);
    spriteId = CreateSprite(&gSpriteTemplate_83C92CC, gUnknown_083C9296[3], gUnknown_083C92A8[1], 5);
    gSprites[spriteId].data0 = 1;
    gSprites[spriteId].data1 = 1;
    gSprites[spriteId].data2 = 3;
    gSprites[spriteId].data3 = zero; // only this assignment of zero is necessary. other replacements of 0 with zero do not change the asm, compiler will treat it the same.
}

void sub_80AA280(u8 var) // no?
{
    u8 i;

    FillWindowRect_DefaultPalette(&gMenuWindow, 0, 0, 0, 0x1E, 3);
    StringCopy(unk_2000000, gMatsudaDebugMenu_StartText);
    StringAppend(unk_2000000, &gUnknown_0203857D[var][0]);

    for (i = 0; i < 4; i++)
    {
        if (var == i)
        {
            sub_8003460(&gMenuWindow, unk_2000000, (10 * i + 2), gUnknown_083C926E[i][0], gUnknown_083C926E[i][1]);
        }
        else
        {
            u8 *ptr = gUnknown_0203857D[i];
            sub_8003460(&gMenuWindow, ptr, (10 * i + 2), gUnknown_083C926E[i][0], gUnknown_083C926E[i][1]);
        }
    }
}

static void sub_80AA340(u8 var)
{
    ConvertIntToDecimalStringN(unk_2000000, gContestMons[var].cool, STR_CONV_MODE_RIGHT_ALIGN, 3);
    sub_8003460(&gMenuWindow, unk_2000000, 0x66, gUnknown_083C9282[0], gUnknown_083C9282[1]);
}

static void sub_80AA388(u8 var)
{
    ConvertIntToDecimalStringN(unk_2000000, gContestMons[var].cute, STR_CONV_MODE_RIGHT_ALIGN, 3);
    sub_8003460(&gMenuWindow, unk_2000000, 0x6C, gUnknown_083C9282[2], gUnknown_083C9282[3]);
}

static void sub_80AA3D0(u8 var)
{
    ConvertIntToDecimalStringN(unk_2000000, gContestMons[var].beauty, STR_CONV_MODE_RIGHT_ALIGN, 3);
    sub_8003460(&gMenuWindow, unk_2000000, 0x72, gUnknown_083C9282[4], gUnknown_083C9282[5]);
}

static void sub_80AA418(u8 var)
{
    ConvertIntToDecimalStringN(unk_2000000, gContestMons[var].smart, STR_CONV_MODE_RIGHT_ALIGN, 3);
    sub_8003460(&gMenuWindow, unk_2000000, 0x78, gUnknown_083C9282[6], gUnknown_083C9282[7]);
}

static void sub_80AA460(u8 var)
{
    ConvertIntToDecimalStringN(unk_2000000, gContestMons[var].tough, STR_CONV_MODE_RIGHT_ALIGN, 3);
    sub_8003460(&gMenuWindow, unk_2000000, 0x7E, gUnknown_083C9282[8], gUnknown_083C9282[9]);
}

static void sub_80AA4A8(u8 var)
{
    ConvertIntToDecimalStringN(unk_2000000, gContestMons[var].sheen, STR_CONV_MODE_RIGHT_ALIGN, 3);
    sub_8003460(&gMenuWindow, unk_2000000, 0x84, gUnknown_083C9282[10], gUnknown_083C9282[11]);
}

static void sub_80AA4F0(u8 var1, u8 var2)
{
    FillWindowRect_DefaultPalette(&gMenuWindow, 0, gUnknown_083C928E[var2][0], gUnknown_083C928E[var2][1], gUnknown_083C928E[var2][0] + 7, gUnknown_083C928E[var2][1] + 1);
    sub_8003460(&gMenuWindow, gMoveNames[gContestMons[var1].moves[var2]], 0x8A + var2 * 14, gUnknown_083C928E[var2][0], gUnknown_083C928E[var2][1]);
    ConvertIntToDecimalStringN(gStringVar1, gContestMons[var1].moves[var2], STR_CONV_MODE_LEADING_ZEROS, 3);
    sub_8003460(&gMenuWindow, gStringVar1, 0xFA + var2 * 6, gUnknown_083C928E[var2][0] + 7, gUnknown_083C928E[var2][1]);
}

static void sub_80AA5BC(u8 var)
{
    sub_8003460(&gMenuWindow, gMatsudaDebugMenuTextList2[var], 0xC2, 3, 0x12);
}

void sub_80AA5E8(u8 var)
{
    sub_8003460(&gMenuWindow, gMatsudaDebugMenuTextList3[var], 0xE8, 3, 4);
}

static void sub_80AA614(u8 var1, u8 var2)
{
    u16 var = sub_80AE770(var1, var2);

    ConvertIntToDecimalStringN(unk_2000000, var, STR_CONV_MODE_RIGHT_ALIGN, 3);
    sub_8003460(&gMenuWindow, unk_2000000, 0xE2, 3, 0xC);
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
    SetMonData(&gPlayerParty[0], MON_DATA_MOVE1, (const u8 *) &gContestMons[gContestPlayerMonIndex].moves[0]);
    SetMonData(&gPlayerParty[0], MON_DATA_MOVE2, (const u8 *) &gContestMons[gContestPlayerMonIndex].moves[1]);
    SetMonData(&gPlayerParty[0], MON_DATA_MOVE3, (const u8 *) &gContestMons[gContestPlayerMonIndex].moves[2]);
    SetMonData(&gPlayerParty[0], MON_DATA_MOVE4, (const u8 *) &gContestMons[gContestPlayerMonIndex].moves[3]);
}

void sub_80AA754(struct Sprite *sprite)
{
    switch (gMain.newAndRepeatedKeys)
    {
    case DPAD_RIGHT:
    case DPAD_LEFT:
        sprite->data0 ^= 1;
        break;
    case DPAD_UP:
        if (sprite->data1 == 0)
            sprite->data1 = 8;
        else
            sprite->data1--;
        break;
    case DPAD_DOWN:
        if (sprite->data1 == 8)
            sprite->data1 = 0;
        else
            sprite->data1++;
        break;
    case A_BUTTON:
        gUnknown_083C92E4[sprite->data1][sprite->data0](sprite, 1);
        sub_80AA614(sprite->data2, sprite->data3);
        break;
    case B_BUTTON:
        gUnknown_083C92E4[sprite->data1][sprite->data0](sprite, -1);
        sub_80AA614(sprite->data2, sprite->data3);
        break;
    case R_BUTTON:
        gUnknown_083C92E4[sprite->data1][sprite->data0](sprite, 10);
        sub_80AA614(sprite->data2, sprite->data3);
        break;
    case L_BUTTON:
        gUnknown_083C92E4[sprite->data1][sprite->data0](sprite, -10);
        sub_80AA614(sprite->data2, sprite->data3);
        break;
    case START_BUTTON:
        sub_80AAD08(sprite, 1);
        break;
    }
    sprite->pos1.x = gUnknown_083C9296[sprite->data0 + sprite->data1 * 2];
    sprite->pos1.y = gUnknown_083C92A8[sprite->data1];
}

static void sub_80AA8A0(struct Sprite *sprite, s8 var1, u8 var2)
{
    if (var1 == 1)
    {
        sprite->data2 = var2;
        sub_80AA280(var2);
        sub_80AA658(sprite->data2);
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

void sub_80AA930(struct Sprite *sprite, u8 var2)
{
    u8 val = sprite->data2;

    gContestMons[sprite->data2].cool = sub_80AA908(val, gContestMons[sprite->data2].cool, var2);
    sub_80AA340(sprite->data2);
}

void sub_80AA974(struct Sprite *sprite, u8 var2)
{
    u8 val = sprite->data2;

    gContestMons[sprite->data2].cute = sub_80AA908(val, gContestMons[sprite->data2].cute, var2);
    sub_80AA388(sprite->data2);
}

void sub_80AA9B8(struct Sprite *sprite, u8 var2)
{
    u8 val = sprite->data2;

    gContestMons[sprite->data2].beauty = sub_80AA908(val, gContestMons[sprite->data2].beauty, var2);
    sub_80AA3D0(sprite->data2);
}

void sub_80AA9FC(struct Sprite *sprite, u8 var2)
{
    u8 val = sprite->data2;

    gContestMons[sprite->data2].smart = sub_80AA908(val, gContestMons[sprite->data2].smart, var2);
    sub_80AA418(sprite->data2);
}

void sub_80AAA40(struct Sprite *sprite, u8 var2)
{
    u8 val = sprite->data2;

    gContestMons[sprite->data2].tough = sub_80AA908(val, gContestMons[sprite->data2].tough, var2);
    sub_80AA460(sprite->data2);
}

void sub_80AAA84(struct Sprite *sprite, u8 var2)
{
    u8 val = sprite->data2;

    gContestMons[sprite->data2].sheen = sub_80AA908(val, gContestMons[sprite->data2].sheen, var2);
    sub_80AA4A8(sprite->data2);
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

void sub_80AAAF0(struct Sprite *sprite, u8 var2)
{
    u8 val = sprite->data2;

    gContestMons[sprite->data2].moves[0] = sub_80AAAC8(val, gContestMons[sprite->data2].moves[0], var2);
    sub_80AA4F0(sprite->data2, 0);
}

void sub_80AAB30(struct Sprite *sprite, u8 var2)
{
    u8 val = sprite->data2;

    gContestMons[sprite->data2].moves[1] = sub_80AAAC8(val, gContestMons[sprite->data2].moves[1], var2);
    sub_80AA4F0(sprite->data2, 1);
}

void sub_80AAB70(struct Sprite *sprite, u8 var2)
{
    u8 val = sprite->data2;

    gContestMons[sprite->data2].moves[2] = sub_80AAAC8(val, gContestMons[sprite->data2].moves[2], var2);
    sub_80AA4F0(sprite->data2, 2);
}

void sub_80AABB0(struct Sprite *sprite, u8 var2)
{
    u8 val = sprite->data2;

    gContestMons[sprite->data2].moves[3] = sub_80AAAC8(val, gContestMons[sprite->data2].moves[3], var2);
    sub_80AA4F0(sprite->data2, 3);
}

void sub_80AABF0(struct Sprite *sprite, s8 var2)
{
    s8 a = (var2 > 0) ? 1 : -1;
    s8 r4 = sprite->data3 + a;

    if (r4 < 0)
        r4 = 0;
    else if (r4 > 4)
        r4 = 4;
    sub_80AA5BC(r4);
    sprite->data3 = r4;
    gScriptContestCategory = sprite->data3;
    sub_80AE398(sprite->data3, gScriptContestRank);
    sub_80AA280(sprite->data2);
    sub_80AA658(sprite->data2);
}

void sub_80AAC5C(struct Sprite *sprite, s8 var2)
{
    if (var2 > 0)
        gScriptContestRank++;
    else if (gScriptContestRank != 0)
        gScriptContestRank--;
    if (gScriptContestRank > 3)
        gScriptContestRank = 3;
    sub_80AA5E8(gScriptContestRank);
    sub_80AE398(gScriptContestCategory, gScriptContestRank);
    sub_80AA280(sprite->data2);
    sub_80AA658(sprite->data2);
}

void sub_80AACC4(void)
{
    UpdatePaletteFade();
    if (!gPaletteFade.active)
    {
        SetDebugMonForContest();
        if (!(gIsLinkContest & 1))
            sub_80AE82C(unk_2000000[0]);
        SetMainCallback2(sub_80AB47C);
    }
}

void sub_80AAD08(struct Sprite *sprite, s8 var2)
{
    if (var2 == 1)
    {
        unk_2000000[0] = sprite->data3;
        SetMainCallback2(sub_80AACC4);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0x10, 0);
    }
}

void sub_80AAD44(struct Sprite *sprite, s8 var2)
{
    if (var2 == 1)
    {
        int i;

        SetDebugMonForContest();
        for (i = 0; i < 4; i++)
            gUnknown_02038670[i] = sub_80AE770(i, gScriptContestCategory);
        SetMainCallback2(sub_805469C);
    }
}

//Do this later
/*
void sub_80AAD84(u8 *string, u8 b, u8 c, u8 d)
{
    u32 r5;
    u16 r7;
    u8 r7_2;
    //u32 sp44;
    //u32 sp48;
    u32 sp58;

    gMain.state = 0;

    r5 = d + 1;
    //Could also be DmaClear32
    DmaFill32(3, 0, (u8 *)VRAM + 0x18000 - r5 * 256, 0x100);

    r7 = StringLength(string);
    if (r7 > 8)
        r7 = 8;
    sp58 = d * 2;

    //More stuff

    r7_2 = 0x7C - sp58;

}
*/

__attribute__((naked))
void sub_80AAD84(u8 *string, u8 b, u8 c, u8 d)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x64\n\
    mov r9, r0\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
    str r1, [sp, 0x48]\n\
    lsls r2, 24\n\
    lsrs r2, 24\n\
    str r2, [sp, 0x4C]\n\
    lsls r3, 24\n\
    lsrs r3, 24\n\
    mov r10, r3\n\
    mov r5, r10\n\
    adds r5, 0x1\n\
    lsls r1, r5, 8\n\
    ldr r0, _080AAEC4 @ =0x06018000\n\
    subs r1, r0, r1\n\
    movs r0, 0\n\
    str r0, [sp, 0x44]\n\
    ldr r4, _080AAEC8 @ =0x040000d4\n\
    add r0, sp, 0x44\n\
    str r0, [r4]\n\
    str r1, [r4, 0x4]\n\
    ldr r0, _080AAECC @ =0x85000040\n\
    str r0, [r4, 0x8]\n\
    ldr r0, [r4, 0x8]\n\
    mov r0, r9\n\
    bl StringLength\n\
    lsls r0, 16\n\
    lsrs r7, r0, 16\n\
    cmp r7, 0x8\n\
    bls _080AADD0\n\
    movs r7, 0x8\n\
_080AADD0:\n\
    movs r6, 0\n\
    mov r8, r5\n\
    mov r1, r10\n\
    lsls r1, 1\n\
    str r1, [sp, 0x58]\n\
    ldr r2, [sp, 0x48]\n\
    adds r2, 0x20\n\
    str r2, [sp, 0x5C]\n\
    cmp r6, r7\n\
    bge _080AAE1E\n\
    add r5, sp, 0x40\n\
    add r0, sp, 0x20\n\
    mov r10, r0\n\
    ldr r2, _080AAEC4 @ =0x06018000\n\
_080AADEC:\n\
    mov r1, r9\n\
    adds r0, r1, r6\n\
    ldrb r0, [r0]\n\
    strb r0, [r5]\n\
    movs r0, 0xFF\n\
    strb r0, [r5, 0x1]\n\
    mov r0, sp\n\
    adds r1, r5, 0\n\
    str r2, [sp, 0x60]\n\
    bl sub_80034D4\n\
    mov r1, r8\n\
    lsls r0, r1, 8\n\
    ldr r2, [sp, 0x60]\n\
    subs r0, r2, r0\n\
    mov r1, r10\n\
    str r1, [r4]\n\
    str r0, [r4, 0x4]\n\
    ldr r0, _080AAED0 @ =0x84000008\n\
    str r0, [r4, 0x8]\n\
    ldr r0, [r4, 0x8]\n\
    adds r2, 0x20\n\
    adds r6, 0x1\n\
    cmp r6, r7\n\
    blt _080AADEC\n\
_080AAE1E:\n\
    movs r1, 0x7C\n\
    ldr r2, [sp, 0x58]\n\
    subs r1, r2\n\
    lsls r1, 24\n\
    lsrs r7, r1, 24\n\
    ldr r0, _080AAED4 @ =gMain\n\
    mov r9, r0\n\
    lsls r3, r7, 3\n\
    add r3, r9\n\
    ldr r0, _080AAED8 @ =gUnknown_083C9400\n\
    ldr r1, [r0]\n\
    ldr r2, [r0, 0x4]\n\
    str r1, [sp, 0x50]\n\
    str r2, [sp, 0x54]\n\
    str r1, [r3, 0x3C]\n\
    str r2, [r3, 0x40]\n\
    mov r2, r8\n\
    lsls r0, r2, 3\n\
    movs r1, 0x80\n\
    lsls r1, 3\n\
    adds r2, r1, 0\n\
    subs r2, r0\n\
    adds r6, r3, 0\n\
    adds r6, 0x40\n\
    ldr r0, _080AAEDC @ =0x000003ff\n\
    mov r8, r0\n\
    mov r1, r8\n\
    ands r2, r1\n\
    ldrh r5, [r6]\n\
    ldr r4, _080AAEE0 @ =0xfffffc00\n\
    adds r0, r4, 0\n\
    ands r0, r5\n\
    orrs r0, r2\n\
    strh r0, [r6]\n\
    ldrh r5, [r3, 0x3E]\n\
    ldr r2, _080AAEE4 @ =0xfffffe00\n\
    adds r0, r2, 0\n\
    ands r0, r5\n\
    ldr r1, [sp, 0x48]\n\
    orrs r0, r1\n\
    strh r0, [r3, 0x3E]\n\
    adds r3, 0x3C\n\
    add r0, sp, 0x4C\n\
    ldrb r0, [r0]\n\
    strb r0, [r3]\n\
    adds r1, r7, 0x1\n\
    lsls r1, 3\n\
    mov r0, r9\n\
    adds r7, r1, r0\n\
    ldr r0, [sp, 0x50]\n\
    ldr r1, [sp, 0x54]\n\
    str r0, [r7, 0x3C]\n\
    str r1, [r7, 0x40]\n\
    ldrh r0, [r6]\n\
    lsls r0, 22\n\
    lsrs r0, 22\n\
    adds r0, 0x4\n\
    adds r5, r7, 0\n\
    adds r5, 0x40\n\
    mov r1, r8\n\
    ands r0, r1\n\
    ldrh r3, [r5]\n\
    ands r4, r3\n\
    orrs r4, r0\n\
    strh r4, [r5]\n\
    ldrh r0, [r7, 0x3E]\n\
    ands r2, r0\n\
    ldr r0, [sp, 0x5C]\n\
    orrs r2, r0\n\
    strh r2, [r7, 0x3E]\n\
    adds r1, r7, 0\n\
    adds r1, 0x3C\n\
    add r2, sp, 0x4C\n\
    ldrb r2, [r2]\n\
    strb r2, [r1]\n\
    add sp, 0x64\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080AAEC4: .4byte 0x06018000\n\
_080AAEC8: .4byte 0x040000d4\n\
_080AAECC: .4byte 0x85000040\n\
_080AAED0: .4byte 0x84000008\n\
_080AAED4: .4byte gMain\n\
_080AAED8: .4byte gUnknown_083C9400\n\
_080AAEDC: .4byte 0x000003ff\n\
_080AAEE0: .4byte 0xfffffc00\n\
_080AAEE4: .4byte 0xfffffe00\n\
    .syntax divided\n");
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
    sub_80AE098(0);

    for (i = 3; i > -1; i--)
        gUnknown_02038690[i] = 3 - i;

    for (i = 0; i < 3; i++)
    {
        gUnknown_02038670[i] = 0;
        gUnknown_02038680[i] = 0;
        gUnknown_02038678[i] = 0;
        memcpy(&gContestMons[i], &gContestMons[3], sizeof(struct ContestPokemon));
    }

    gUnknown_02038670[3] = 0x12C;
    gUnknown_02038680[3] = 0x190;
    gUnknown_02038678[3] = 0x190;
    sub_80B2A7C(0xFE);
}

//Don't know size of return type
int MatsudaDebugMenu_SetHighScore(void)
{
    sub_80AAF30();
    CloseMenu();
    return 1;
}

//Don't know size of return type
int MatsudaDebugMenu_ResetHighScore(void)
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

//Don't know size of return type
int MatsudaDebugMenu_SetArtMuseumItems(void)
{
    s32 i;

    gContestPlayerMonIndex = 3;
    sub_80AE098(0);
    for (i = 3; i > -1; i--)
        gUnknown_02038690[i] = 3 - i;
    for (gScriptContestCategory = 0; gScriptContestCategory < 5; gScriptContestCategory++)
        sub_80B2A7C(0xFF);
    CloseMenu();
    return 1;
}

void unref_sub_80AB084(u8 *text)
{
    u16 savedIme;
    u8 *addr;
    size_t size;

    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG3HOFS = 0;
    REG_BG3VOFS = 0;
    REG_WIN0H = 0;
    REG_WIN0V = 0;
    REG_WIN1H = 0;
    REG_WIN1V = 0;
    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_ON;

    savedIme = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_IME = savedIme;
    REG_DISPSTAT = 8;
    ResetTasks();
    ResetSpriteData();
    SetMainCallback2(sub_80AB184);

    addr = (void *)VRAM;
    size = 0x18000;
    while (1)
    {
        DmaFill32(3, 0, addr, 0x1000);
        addr += 0x1000;
        size -= 0x1000;
        if (size <= 0x1000)
        {
            DmaFill32(3, 0, addr, size);
            break;
        }
    }
    SetUpWindowConfig(&gWindowConfig_81E6FD8);
    InitWindowFromConfig(&gUnknown_03004210, &gWindowConfig_81E6FD8);
    LoadFontDefaultPalette(&gWindowConfig_81E6FD8);
    sub_8003460(&gUnknown_03004210, text, 1, 9, 7);
}

void sub_80AB184(void)
{
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG3HOFS = 0;
    REG_BG3VOFS = 0;
}
