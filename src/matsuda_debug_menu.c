#include "global.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "task.h"
#include "link.h"
#include "text.h"
#include "sprite.h"
#include "string_util.h"

#define BIT(n) (1 << (n))

extern u8 gUnknown_0203869A;
extern u8 gUnknown_0203869B;
extern u8 gUnknown_02038695;
extern u16 gScriptContestCategory;
extern u16 gScriptContestRank;
extern u8 (*gCallback_03004AE8)(void);
extern void sub_80034D4(u8 *, u8 *);
extern void sub_80AF668(void);
extern void sub_80C2358(void);
extern void sub_8071C20(void);
extern void sub_80AA10C(void);
extern void sub_80A9C98(u8);
extern void sub_80C8734(void);
extern void sub_80A9CC0(u8);
extern void sub_80C88AC(u8);
extern void sub_80A9CDC(u8);
extern void sub_80C8E1C(u8);
extern void sub_80A9D58(u8);
extern void sub_80C8EBC(u8);
extern void sub_80A9DBC(u8);
extern u8 sub_80C4B34(u8 *);
extern void sub_80B0F28(u8);
extern void sub_80C8F34(u8);
extern void sub_80A9DD8(u8);
extern void sub_80A9F10(u8);
extern void sub_805469C(void);
extern void sub_80AE398(u8, u8);
extern void sub_80AE098(u8);
extern void sub_80AA5BC(u8);
extern void sub_80AA5E8(u16);
extern void sub_80AA658(u8);
extern void sub_80AA614(u8, u8);

extern struct Window gMenuWindow;

extern u16 gUnknown_030042A4;
extern u16 gUnknown_030042A0;
extern u16 gUnknown_030042C0;
extern u16 gUnknown_030041B4;
extern u16 gUnknown_03004288;
extern u16 gUnknown_03004280;
extern u16 gUnknown_030041B0;
extern u16 gUnknown_030041B8;

extern u8 gUnknown_02038694;
extern u8 gUnknown_083C9296[];
extern u8 gUnknown_083C92A8[];
extern u8 gUnknown_083C9282[];
extern u8 gUnknown_0203857D[][64];
extern u8 gUnknown_083C926E[][2];
extern const u8 gUnknown_083C928E[][2];
extern u8 unk_2000000[];
extern u8 gMatsudaDebugMenu_GoBackText[];
extern u8 gMatsudaDebugMenu_BattlePointsText[];
extern u8 gMatsudaDebugMenu_StartText[];

extern u8 gUnknown_083C92BC[];
extern u8 gUnknown_083C92B4[];
extern struct SpriteTemplate gSpriteTemplate_83C92CC;

extern u8 gMoveNames[][13];

extern u8 gMatsudaDebugMenu_UnknownByteArray[];
extern u32 gMatsudaDebugMenuTextList1[];
extern u8 gMatsudaDebugMenuContestTopLeft[][2];

struct UnknownStruct
{
    u8 text[2];
    u8 unk2;
    u8 filler3[27];
    u16 unk1E[4];
    u8 unk26;
    u8 unk27;
    u8 unk28;
    u8 unk29;
    u8 unk2A;
    u8 unk2B;
    u8 filler2C[20];
};

extern struct UnknownStruct gUnknown_02038570[];

extern bool8 gReceivedRemoteLinkPlayers;
extern u16 gBlockRecvBuffer[MAX_LINK_PLAYERS][BLOCK_BUFFER_SIZE / 2];

struct DebugMenuAction
{
   u8 *text;
   u8 (*func)(void);
};

extern struct DebugMenuAction gMatsudaDebugMenuActions[];

s8 sub_80A9B78(void);
void sub_80A9BE4(u8 taskId);
void sub_80A9E04(u8 taskId);
void sub_80A9E3C(u8 taskId);
void sub_80A9ED8(u8);
void sub_80A9E80(u8);
void sub_80AA280(u8);

u8 unref_sub_80A9B28(void)
{
    MenuZeroFillScreen();
    MenuDrawTextWindow(0, 0, 17, 18);
    PrintMenuItems(1, 1, 7, gMatsudaDebugMenuActions);
    InitMenu(0, 1, 1, 7, 0, 16);
    gCallback_03004AE8 = sub_80A9B78;
    return 0;
}

s8 sub_80A9B78(void)
{
    s8 choice = ProcessMenuInput();
    
    switch(choice)
    {
    case -2:
        return 0;
    default:
        gCallback_03004AE8 = gMatsudaDebugMenuActions[choice].func;
        return 0;
    case -1:
        sub_8071C20();
        return 1;
    }
}

s8 MatsudaDebugMenu_ContestResults(void)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
    CreateTask(sub_80A9BE4, 0xFF);
    return 1;
}

void sub_80A9BE4(u8 taskId)
{
    if(!gPaletteFade.active)
    {
        DestroyTask(taskId);

        if(!(gUnknown_0203869A & 1))
            sub_80AF668();

        sub_80C2358();
    }
}

s8 MatsudaDebugMenu_Contest(void)
{
    gUnknown_0203869A = 0;
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

void sub_80A9C98(u8 taskId)
{
    sub_80AE098(0);
    SetTaskFuncWithFollowupFunc(taskId, sub_80C8734, sub_80A9CC0);
}

void sub_80A9CC0(u8 taskId)
{
    SetTaskFuncWithFollowupFunc(taskId, sub_80C88AC, sub_80A9CDC);
}

void sub_80A9CDC(u8 taskId)
{
    SetTaskFuncWithFollowupFunc(taskId, sub_80C8E1C, sub_80A9D58);
}

void sub_80A9CF8(u8 taskId)
{
    if(gReceivedRemoteLinkPlayers == FALSE)
    {
        DestroyTask(gTasks[taskId].data[10]);
        DestroyTask(taskId);
        sub_8071C20();
    }
}

void sub_80A9D30(u8 taskId)
{
    sub_800832C();
    gTasks[taskId].func = sub_80A9CF8;
}

void sub_80A9D58(u8 taskId)
{
   int i;
   u8 dest[4];

   for(i = 0; i < 4; i++)
       dest[i] = gTasks[taskId].data[5 + i];

   gUnknown_0203869B = sub_80C4B34(&dest);
   sub_80AE82C((u8)gScriptContestCategory);
   sub_80B0F28(0);
   SetTaskFuncWithFollowupFunc(taskId, sub_80C8EBC, sub_80A9DBC);
}

void sub_80A9DBC(u8 taskId)
{
    SetTaskFuncWithFollowupFunc(taskId, sub_80C8F34, sub_80A9DD8);
}

void sub_80A9DD8(u8 taskId)
{
    DestroyTask(gTasks[taskId].data[10]);
    DestroyTask(taskId);
    sub_8071C20();
}

void sub_80A9E04(u8 taskId)
{
    if(gMain.newKeys == 2)
        gTasks[(u8)gTasks[taskId].data[10]].func = sub_80A9D30;
}

void sub_80A9E3C(u8 taskId)
{
    u8 i;
    
    OpenLink();

    for(i = 0; i < 4; i++)
        gBlockRecvBuffer[i][0] = 255;

    gTasks[taskId].data[0] = 0;
    gTasks[taskId].func = sub_80A9E80;
}

void sub_80A9E80(u8 taskId)
{
    TaskFunc func;

    if(gTasks[taskId].data[0] < 10)
        gTasks[taskId].data[0]++;
    else
    {
        if(GetLinkPlayerCount_2() > 3)
        {
            gTasks[taskId].data[0] = 0;
    
            if(IsLinkMaster())
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

void sub_80A9ED8(u8 taskId)
{
    gTasks[taskId].data[0] = gTasks[taskId].data[0] + 1;
    if((gTasks[taskId].data[0]) == 101)
    {
        sub_8007F4C();
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = sub_80A9F10;
    }
}

void sub_80A9F10(u8 taskId)
{
    if(gReceivedRemoteLinkPlayers)
    {
        gUnknown_02038695 = GetMultiplayerId();
        if(GetLinkPlayerCount() == 4)
        {
            gUnknown_0203869A = 1;
            SwitchTaskToFollowupFunc(taskId);
        }
    }
}

void sub_80A9F50(void)
{
    REG_DISPCNT = DISPCNT_OBJ_1D_MAP;
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

void sub_80A9FE4(void)
{
    u8 *addr;
    u32 i;
    u8 ptr[5];
    
    memcpy(ptr, gMatsudaDebugMenu_UnknownByteArray, 5);

    addr = (void *)VRAM;
    i = VRAM_SIZE;

    while(1)
    {
        DmaFill32(3, 0, addr, 0x1000);
        addr += 0x1000;
        i -= 0x1000;
        if(i <= 0x1000)
        {
            DmaFill32(3, 0, addr, i);
            break;
        }
    }
    sub_80034D4(VRAM, &ptr);
    LoadFontDefaultPalette(&gWindowConfig_81E6C3C);
}

void sub_80AA064(void)
{
    AnimateSprites();
    BuildOamBuffer();
    RunTasks();
    UpdatePaletteFade();
    if(gMain.newKeys == 4)
        SetMainCallback2(sub_805469C);
}

void sub_80AA090(void)
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

void sub_80AA10C(void)
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

    if(!(gUnknown_02038570[0].unk2))
        sub_80AE398(0, 0);

    sub_80AE098(gUnknown_02038694);

    for(i = 0; i < 6; i++)
    {
        sub_8003460(&gMenuWindow, gMatsudaDebugMenuTextList1[i], 
            (0xA * i + 0x2A), gMatsudaDebugMenuContestTopLeft[i][0], 
            gMatsudaDebugMenuContestTopLeft[i][1]);
    }

    gScriptContestCategory = gScriptContestRank = 0;
    zero = 0;
    sub_80AA5BC(zero);
    sub_80AA5E8((u8)gScriptContestRank);
    sub_8003460(&gMenuWindow, gMatsudaDebugMenu_GoBackText, 0xD6, 0x12, 0x12);
    sub_8003460(&gMenuWindow, gMatsudaDebugMenu_BattlePointsText, 0xDC, zero, 0xC);
    LoadSpriteSheet(gUnknown_083C92B4);
    LoadSpritePalette(gUnknown_083C92BC);
    sub_80AA280(3);
    sub_80AA658(3);
    sub_80AA614(3, zero);
    spriteId = CreateSprite(&gSpriteTemplate_83C92CC, gUnknown_083C9296[3], gUnknown_083C92A8[1], 5);
    gSprites[spriteId].data0 = 1;
    gSprites[spriteId].data1 = 1;
    gSprites[spriteId].data2 = 3;
    gSprites[spriteId].data3 = zero; // only this assignment of zero is necessary. other replacements of 0 with zero do not change the asm, compiler will treat it the same.
}

void sub_80AA280(u8 var)
{
    u8 i;

    FillWindowRect_DefaultPalette(&gMenuWindow, 0, 0, 0, 0x1E, 3);
    StringCopy(unk_2000000, &gMatsudaDebugMenu_StartText);
    StringAppend(unk_2000000, &gUnknown_0203857D[var][0]);

    for(i = 0; i < 4; i++)
    {
        if(var == i)
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

void sub_80AA340(u8 var)
{
    ConvertIntToDecimalStringN(unk_2000000, gUnknown_02038570[var].unk26, STR_CONV_MODE_RIGHT_ALIGN, 3);
    sub_8003460(&gMenuWindow, unk_2000000, 0x66, gUnknown_083C9282[0], gUnknown_083C9282[1]);
}

void sub_80AA388(u8 var)
{
    ConvertIntToDecimalStringN(unk_2000000, gUnknown_02038570[var].unk28, STR_CONV_MODE_RIGHT_ALIGN, 3);
    sub_8003460(&gMenuWindow, unk_2000000, 0x6C, gUnknown_083C9282[2], gUnknown_083C9282[3]);
}

void sub_80AA3D0(u8 var)
{
    ConvertIntToDecimalStringN(unk_2000000, gUnknown_02038570[var].unk27, STR_CONV_MODE_RIGHT_ALIGN, 3);
    sub_8003460(&gMenuWindow, unk_2000000, 0x72, gUnknown_083C9282[4], gUnknown_083C9282[5]);
}

void sub_80AA418(u8 var)
{
    ConvertIntToDecimalStringN(unk_2000000, gUnknown_02038570[var].unk29, STR_CONV_MODE_RIGHT_ALIGN, 3);
    sub_8003460(&gMenuWindow, unk_2000000, 0x78, gUnknown_083C9282[6], gUnknown_083C9282[7]);
}

void sub_80AA460(u8 var)
{
    ConvertIntToDecimalStringN(unk_2000000, gUnknown_02038570[var].unk2A, STR_CONV_MODE_RIGHT_ALIGN, 3);
    sub_8003460(&gMenuWindow, unk_2000000, 0x7E, gUnknown_083C9282[8], gUnknown_083C9282[9]);
}

void sub_80AA4A8(u8 var)
{
    ConvertIntToDecimalStringN(unk_2000000, gUnknown_02038570[var].unk2B, STR_CONV_MODE_RIGHT_ALIGN, 3);
    sub_8003460(&gMenuWindow, unk_2000000, 0x84, gUnknown_083C9282[10], gUnknown_083C9282[11]);
}

void sub_80AA4F0(u8 var1, u8 var2)
{
    FillWindowRect_DefaultPalette(&gMenuWindow, 0, gUnknown_083C928E[var2][0], gUnknown_083C928E[var2][1], gUnknown_083C928E[var2][0] + 7, gUnknown_083C928E[var2][1] + 1);
    sub_8003460(&gMenuWindow, gMoveNames[gUnknown_02038570[var1].unk1E[var2]], 0x8A + var2 * 14, gUnknown_083C928E[var2][0], gUnknown_083C928E[var2][1]);
    ConvertIntToDecimalStringN(gStringVar1, gUnknown_02038570[var1].unk1E[var2], STR_CONV_MODE_LEADING_ZEROS, 3);
    sub_8003460(&gMenuWindow, gStringVar1, 0xFA + var2 * 6, gUnknown_083C928E[var2][0] + 7, gUnknown_083C928E[var2][1]);
}
