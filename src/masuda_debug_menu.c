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
extern u8 gUnknown_083C928E[][2];
extern u8 unk_2000000[];
extern u8 gMasudaDebugMenu_GoBackText[];
extern u8 gMasudaDebugMenu_BattlePointsText[];
extern u8 gMasudaDebugMenu_StartText[];

extern u8 gUnknown_083C92BC[];
extern u8 gUnknown_083C92B4[];
extern struct SpriteTemplate gSpriteTemplate_83C92CC;

extern u8 gMoveNames[][13];

extern u8 gMasudaDebugMenu_UnknownByteArray[];
extern u32 gMasudaDebugMenuTextList1[];
extern u8 gMasudaDebugMenuContestTopLeft[][2];

struct UnknownStruct
{
    u8 text[2];
    u8 unk2;
    u8 filler3[28];
    u16 unk1E[1];
    u8 filler4[5];
    u8 unkArr[6];
    u8 filler[20];
};

extern struct UnknownStruct gUnknown_02038570[];

extern bool8 gReceivedRemoteLinkPlayers;
extern u16 gBlockRecvBuffer[MAX_LINK_PLAYERS][BLOCK_BUFFER_SIZE / 2];

struct DebugMenuAction
{
   u8 *text;
   u8 (*func)(void);
};

extern struct DebugMenuAction gMasudaDebugMenuActions[];

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
    PrintMenuItems(1, 1, 7, gMasudaDebugMenuActions);
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
        gCallback_03004AE8 = gMasudaDebugMenuActions[choice].func;
        return 0;
    case -1:
        sub_8071C20();
        return 1;
    }
}

s8 MasudaDebugMenu_ContestResults(void)
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

s8 MasudaDebugMenu_Contest(void)
{
    gUnknown_0203869A = 0;
    sub_80AA10C();
    return 0;
}

s8 MasudaDebugMenu_ContestComm(void)
{
    sub_80AA10C();
    return 0;
}

s8 MasudaDebugMenu_CommTest(void)
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
    
    memcpy(ptr, gMasudaDebugMenu_UnknownByteArray, 5);

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
        sub_8003460(&gMenuWindow, gMasudaDebugMenuTextList1[i], 
            (0xA * i + 0x2A), gMasudaDebugMenuContestTopLeft[i][0], 
            gMasudaDebugMenuContestTopLeft[i][1]);
    }

    gScriptContestCategory = gScriptContestRank = 0;
    zero = 0;
    sub_80AA5BC(zero);
    sub_80AA5E8((u8)gScriptContestRank);
    sub_8003460(&gMenuWindow, gMasudaDebugMenu_GoBackText, 0xD6, 0x12, 0x12);
    sub_8003460(&gMenuWindow, gMasudaDebugMenu_BattlePointsText, 0xDC, zero, 0xC);
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
    StringCopy(unk_2000000, &gMasudaDebugMenu_StartText);
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

#ifdef NONMATCHING
void sub_80AA340(u8 var)
{
    ConvertIntToDecimalStringN(unk_2000000, gUnknown_02038570[var].unkArr[1], STR_CONV_MODE_RIGHT_ALIGN, 3);
    sub_8003460(&gMenuWindow, unk_2000000, 0x66, gUnknown_083C9282[0], gUnknown_083C9282[1]);
}
#else
__attribute__((naked))
void sub_80AA340(u8 var)
{
    asm(".syntax unified\n\
    push {r4,lr}\n\
    sub sp, 0x4\n\
    lsls r0, 24\n\
    ldr r4, _080AA378 @ =0x02000000\n\
    ldr r1, _080AA37C @ =gUnknown_02038570\n\
    lsrs r0, 18\n\
    adds r0, r1\n\
    adds r0, 0x26\n\
    ldrb r1, [r0]\n\
    adds r0, r4, 0\n\
    movs r2, 0x1\n\
    movs r3, 0x3\n\
    bl ConvertIntToDecimalStringN\n\
    ldr r0, _080AA380 @ =gMenuWindow\n\
    ldr r1, _080AA384 @ =gUnknown_083C9282\n\
    ldrb r3, [r1]\n\
    ldrb r1, [r1, 0x1]\n\
    str r1, [sp]\n\
    adds r1, r4, 0\n\
    movs r2, 0x66\n\
    bl sub_8003460\n\
    add sp, 0x4\n\
    pop {r4}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080AA378: .4byte 0x02000000\n\
_080AA37C: .4byte gUnknown_02038570\n\
_080AA380: .4byte gMenuWindow\n\
_080AA384: .4byte gUnknown_083C9282\n\
    .syntax divided");
}    
#endif

#ifdef NONMATCHING
void sub_80AA388(u8 var)
{
    ConvertIntToDecimalStringN(unk_2000000, gUnknown_02038570[var].unkArr[3], STR_CONV_MODE_RIGHT_ALIGN, 3);
    sub_8003460(&gMenuWindow, unk_2000000, 0x6C, gUnknown_083C9282[2], gUnknown_083C9282[3]);
}
#else
__attribute__((naked))
void sub_80AA388(u8 var)
{
    asm(".syntax unified\n\
    push {r4,lr}\n\
    sub sp, 0x4\n\
    lsls r0, 24\n\
    ldr r4, _080AA3C0 @ =0x02000000\n\
    ldr r1, _080AA3C4 @ =gUnknown_02038570\n\
    lsrs r0, 18\n\
    adds r0, r1\n\
    adds r0, 0x28\n\
    ldrb r1, [r0]\n\
    adds r0, r4, 0\n\
    movs r2, 0x1\n\
    movs r3, 0x3\n\
    bl ConvertIntToDecimalStringN\n\
    ldr r0, _080AA3C8 @ =gMenuWindow\n\
    ldr r1, _080AA3CC @ =gUnknown_083C9282\n\
    ldrb r3, [r1, 0x2]\n\
    ldrb r1, [r1, 0x3]\n\
    str r1, [sp]\n\
    adds r1, r4, 0\n\
    movs r2, 0x6C\n\
    bl sub_8003460\n\
    add sp, 0x4\n\
    pop {r4}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080AA3C0: .4byte 0x02000000\n\
_080AA3C4: .4byte gUnknown_02038570\n\
_080AA3C8: .4byte gMenuWindow\n\
_080AA3CC: .4byte gUnknown_083C9282\n\
    .syntax divided");
}    
#endif

#ifdef NONMATCHING
void sub_80AA3D0(u8 var)
{
    ConvertIntToDecimalStringN(unk_2000000, gUnknown_02038570[var].unkArr[2], STR_CONV_MODE_RIGHT_ALIGN, 3);
    sub_8003460(&gMenuWindow, unk_2000000, 0x72, gUnknown_083C9282[4], gUnknown_083C9282[5]);
}
#else
__attribute__((naked))
void sub_80AA3D0(u8 var)
{
    asm(".syntax unified\n\
    push {r4,lr}\n\
    sub sp, 0x4\n\
    lsls r0, 24\n\
    ldr r4, _080AA408 @ =0x02000000\n\
    ldr r1, _080AA40C @ =gUnknown_02038570\n\
    lsrs r0, 18\n\
    adds r0, r1\n\
    adds r0, 0x27\n\
    ldrb r1, [r0]\n\
    adds r0, r4, 0\n\
    movs r2, 0x1\n\
    movs r3, 0x3\n\
    bl ConvertIntToDecimalStringN\n\
    ldr r0, _080AA410 @ =gMenuWindow\n\
    ldr r1, _080AA414 @ =gUnknown_083C9282\n\
    ldrb r3, [r1, 0x4]\n\
    ldrb r1, [r1, 0x5]\n\
    str r1, [sp]\n\
    adds r1, r4, 0\n\
    movs r2, 0x72\n\
    bl sub_8003460\n\
    add sp, 0x4\n\
    pop {r4}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080AA408: .4byte 0x02000000\n\
_080AA40C: .4byte gUnknown_02038570\n\
_080AA410: .4byte gMenuWindow\n\
_080AA414: .4byte gUnknown_083C9282\n\
    .syntax divided");
}    
#endif

#ifdef NONMATCHING
void sub_80AA418(u8 var)
{
    ConvertIntToDecimalStringN(unk_2000000, gUnknown_02038570[var].unkArr[4], STR_CONV_MODE_RIGHT_ALIGN, 3);
    sub_8003460(&gMenuWindow, unk_2000000, 0x78, gUnknown_083C9282[6], gUnknown_083C9282[7]);
}
#else
__attribute__((naked))
void sub_80AA418(u8 var)
{
    asm(".syntax unified\n\
    push {r4,lr}\n\
    sub sp, 0x4\n\
    lsls r0, 24\n\
    ldr r4, _080AA450 @ =0x02000000\n\
    ldr r1, _080AA454 @ =gUnknown_02038570\n\
    lsrs r0, 18\n\
    adds r0, r1\n\
    adds r0, 0x29\n\
    ldrb r1, [r0]\n\
    adds r0, r4, 0\n\
    movs r2, 0x1\n\
    movs r3, 0x3\n\
    bl ConvertIntToDecimalStringN\n\
    ldr r0, _080AA458 @ =gMenuWindow\n\
    ldr r1, _080AA45C @ =gUnknown_083C9282\n\
    ldrb r3, [r1, 0x6]\n\
    ldrb r1, [r1, 0x7]\n\
    str r1, [sp]\n\
    adds r1, r4, 0\n\
    movs r2, 0x78\n\
    bl sub_8003460\n\
    add sp, 0x4\n\
    pop {r4}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080AA450: .4byte 0x02000000\n\
_080AA454: .4byte gUnknown_02038570\n\
_080AA458: .4byte gMenuWindow\n\
_080AA45C: .4byte gUnknown_083C9282\n\
    .syntax divided");
}    
#endif

#ifdef NONMATCHING
void sub_80AA460(u8 var)
{
    ConvertIntToDecimalStringN(unk_2000000, gUnknown_02038570[var].unkArr[5], STR_CONV_MODE_RIGHT_ALIGN, 3);
    sub_8003460(&gMenuWindow, unk_2000000, 0x7E, gUnknown_083C9282[8], gUnknown_083C9282[9]);
}
#else
__attribute__((naked))
void sub_80AA460(u8 var)
{
    asm(".syntax unified\n\
    push {r4,lr}\n\
    sub sp, 0x4\n\
    lsls r0, 24\n\
    ldr r4, _080AA498 @ =0x02000000\n\
    ldr r1, _080AA49C @ =gUnknown_02038570\n\
    lsrs r0, 18\n\
    adds r0, r1\n\
    adds r0, 0x2A\n\
    ldrb r1, [r0]\n\
    adds r0, r4, 0\n\
    movs r2, 0x1\n\
    movs r3, 0x3\n\
    bl ConvertIntToDecimalStringN\n\
    ldr r0, _080AA4A0 @ =gMenuWindow\n\
    ldr r1, _080AA4A4 @ =gUnknown_083C9282\n\
    ldrb r3, [r1, 0x8]\n\
    ldrb r1, [r1, 0x9]\n\
    str r1, [sp]\n\
    adds r1, r4, 0\n\
    movs r2, 0x7E\n\
    bl sub_8003460\n\
    add sp, 0x4\n\
    pop {r4}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080AA498: .4byte 0x02000000\n\
_080AA49C: .4byte gUnknown_02038570\n\
_080AA4A0: .4byte gMenuWindow\n\
_080AA4A4: .4byte gUnknown_083C9282\n\
    .syntax divided");
}    
#endif

#ifdef NONMATCHING
void sub_80AA4A8(u8 var)
{
    ConvertIntToDecimalStringN(unk_2000000, gUnknown_02038570[var].unkArr[6], STR_CONV_MODE_RIGHT_ALIGN, 3);
    sub_8003460(&gMenuWindow, unk_2000000, 0x84, gUnknown_083C9282[10], gUnknown_083C9282[11]);
}
#else
__attribute__((naked))
void sub_80AA4A8(u8 var)
{
    asm(".syntax unified\n\
    push {r4,lr}\n\
    sub sp, 0x4\n\
    lsls r0, 24\n\
    ldr r4, _080AA4E0 @ =0x02000000\n\
    ldr r1, _080AA4E4 @ =gUnknown_02038570\n\
    lsrs r0, 18\n\
    adds r0, r1\n\
    adds r0, 0x2B\n\
    ldrb r1, [r0]\n\
    adds r0, r4, 0\n\
    movs r2, 0x1\n\
    movs r3, 0x3\n\
    bl ConvertIntToDecimalStringN\n\
    ldr r0, _080AA4E8 @ =gMenuWindow\n\
    ldr r1, _080AA4EC @ =gUnknown_083C9282\n\
    ldrb r3, [r1, 0xA]\n\
    ldrb r1, [r1, 0xB]\n\
    str r1, [sp]\n\
    adds r1, r4, 0\n\
    movs r2, 0x84\n\
    bl sub_8003460\n\
    add sp, 0x4\n\
    pop {r4}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080AA4E0: .4byte 0x02000000\n\
_080AA4E4: .4byte gUnknown_02038570\n\
_080AA4E8: .4byte gMenuWindow\n\
_080AA4EC: .4byte gUnknown_083C9282\n\
    .syntax divided");
}    
#endif

#ifdef NONMATCHING
void sub_80AA4F0(u8 var1, u8 var2)
{
    u8 temp = gUnknown_083C928E[var2][0] + 7;
    u8 temp2 = gUnknown_083C928E[var2][1] + 1;

    FillWindowRect_DefaultPalette(&gMenuWindow, 0, temp, temp2, temp, temp2);
    sub_8003460(&gMenuWindow, gMoveNames[gUnknown_02038570[var1].unk1E[var2]], var2 * 14 + 0x8A, temp, temp2);
    ConvertIntToDecimalStringN(gStringVar1, gUnknown_02038570[var1].unk1E[var2], STR_CONV_MODE_LEADING_ZEROS, 3);
    sub_8003460(&gMenuWindow, gStringVar1, var2 * 2 + 0xFA, temp, temp2);
}
#else
__attribute__((naked))
void sub_80AA4F0(u8 var1, u8 var2)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x8\n\
    adds r4, r0, 0\n\
    adds r6, r1, 0\n\
    lsls r4, 24\n\
    lsrs r4, 24\n\
    lsls r6, 24\n\
    lsrs r6, 24\n\
    ldr r7, _080AA5A8 @ =gMenuWindow\n\
    ldr r0, _080AA5AC @ =gUnknown_083C928E\n\
    lsls r5, r6, 1\n\
    adds r1, r5, r0\n\
    ldrb r1, [r1]\n\
    mov r9, r1\n\
    adds r0, 0x1\n\
    adds r0, r5, r0\n\
    ldrb r0, [r0]\n\
    mov r10, r0\n\
    movs r0, 0x7\n\
    add r0, r9\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r8, r0\n\
    str r0, [sp]\n\
    mov r0, r10\n\
    adds r0, 0x1\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    str r0, [sp, 0x4]\n\
    adds r0, r7, 0\n\
    movs r1, 0\n\
    mov r2, r9\n\
    mov r3, r10\n\
    bl FillWindowRect_DefaultPalette\n\
    ldr r0, _080AA5B0 @ =gUnknown_02038570\n\
    lsls r4, 6\n\
    adds r4, r5, r4\n\
    adds r0, 0x1E\n\
    adds r4, r0\n\
    ldrh r1, [r4]\n\
    movs r0, 0xD\n\
    muls r1, r0\n\
    ldr r0, _080AA5B4 @ =gMoveNames\n\
    adds r1, r0\n\
    lsls r2, r6, 3\n\
    subs r2, r6\n\
    lsls r2, 17\n\
    movs r0, 0x8A\n\
    lsls r0, 16\n\
    adds r2, r0\n\
    lsrs r2, 16\n\
    mov r0, r10\n\
    str r0, [sp]\n\
    adds r0, r7, 0\n\
    mov r3, r9\n\
    bl sub_8003460\n\
    ldr r0, _080AA5B8 @ =gStringVar1\n\
    mov r9, r0\n\
    ldrh r1, [r4]\n\
    movs r2, 0x2\n\
    movs r3, 0x3\n\
    bl ConvertIntToDecimalStringN\n\
    adds r5, r6\n\
    lsls r5, 17\n\
    movs r0, 0xFA\n\
    lsls r0, 16\n\
    adds r5, r0\n\
    lsrs r5, 16\n\
    mov r0, r10\n\
    str r0, [sp]\n\
    adds r0, r7, 0\n\
    mov r1, r9\n\
    adds r2, r5, 0\n\
    mov r3, r8\n\
    bl sub_8003460\n\
    add sp, 0x8\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080AA5A8: .4byte gMenuWindow\n\
_080AA5AC: .4byte gUnknown_083C928E\n\
_080AA5B0: .4byte gUnknown_02038570\n\
_080AA5B4: .4byte gMoveNames\n\
_080AA5B8: .4byte gStringVar1\n\
    .syntax divided");
}
#endif

/*
    thumb_func_start sub_80AA4F0
sub_80AA4F0: @ 80AA4F0
    push {r4-r7,lr}
    mov r7, r10
    mov r6, r9
    mov r5, r8
    push {r5-r7}
    sub sp, 0x8
    adds r4, r0, 0
    adds r6, r1, 0
    lsls r4, 24
    lsrs r4, 24
    lsls r6, 24
    lsrs r6, 24
    ldr r7, _080AA5A8 @ =gMenuWindow
    ldr r0, _080AA5AC @ =gUnknown_083C928E
    lsls r5, r6, 1
    adds r1, r5, r0
    ldrb r1, [r1]
    mov r9, r1
    adds r0, 0x1
    adds r0, r5, r0
    ldrb r0, [r0]
    mov r10, r0
    movs r0, 0x7
    add r0, r9
    lsls r0, 24
    lsrs r0, 24
    mov r8, r0
    str r0, [sp]
    mov r0, r10
    adds r0, 0x1
    lsls r0, 24
    lsrs r0, 24
    str r0, [sp, 0x4]
    adds r0, r7, 0
    movs r1, 0
    mov r2, r9
    mov r3, r10
    bl FillWindowRect_DefaultPalette
    ldr r0, _080AA5B0 @ =gUnknown_02038570
    lsls r4, 6
    adds r4, r5, r4
    adds r0, 0x1E
    adds r4, r0
    ldrh r1, [r4]
    movs r0, 0xD
    muls r1, r0
    ldr r0, _080AA5B4 @ =gMoveNames
    adds r1, r0
    lsls r2, r6, 3
    subs r2, r6
    lsls r2, 17
    movs r0, 0x8A
    lsls r0, 16
    adds r2, r0
    lsrs r2, 16
    mov r0, r10
    str r0, [sp]
    adds r0, r7, 0
    mov r3, r9
    bl sub_8003460
    ldr r0, _080AA5B8 @ =gStringVar1
    mov r9, r0
    ldrh r1, [r4]
    movs r2, 0x2
    movs r3, 0x3
    bl ConvertIntToDecimalStringN
    adds r5, r6
    lsls r5, 17
    movs r0, 0xFA
    lsls r0, 16
    adds r5, r0
    lsrs r5, 16
    mov r0, r10
    str r0, [sp]
    adds r0, r7, 0
    mov r1, r9
    adds r2, r5, 0
    mov r3, r8
    bl sub_8003460
    add sp, 0x8
    pop {r3-r5}
    mov r8, r3
    mov r9, r4
    mov r10, r5
    pop {r4-r7}
    pop {r0}
    bx r0
    .align 2, 0
_080AA5A8: .4byte gMenuWindow
_080AA5AC: .4byte gUnknown_083C928E
_080AA5B0: .4byte gUnknown_02038570
_080AA5B4: .4byte gMoveNames
_080AA5B8: .4byte gStringVar1
    thumb_func_end sub_80AA4F0
*/
