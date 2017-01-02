#include "global.h"
#include "asm.h"
#include "link.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "rom4.h"
#include "sprite.h"
#include "start_menu.h"
#include "string_util.h"
#include "task.h"
#include "text.h"

#define BIT(n) (1 << (n))

extern u8 gIsLinkContest;
extern u8 gUnknown_0203869B;
extern u8 gContestPlayerMonIndex;
extern u16 gScriptContestCategory;
extern u16 gScriptContestRank;
extern u8 (*gCallback_03004AE8)(void);

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

extern struct SpritePalette gUnknown_083C92BC;
extern struct SpriteSheet gUnknown_083C92B4;
extern struct SpriteTemplate gSpriteTemplate_83C92CC;

extern u8 gMoveNames[][13];

extern u8 gMatsudaDebugMenu_UnknownByteArray[];
extern u8* gMatsudaDebugMenuTextList1[];
extern u8* gMatsudaDebugMenuTextList2[];
extern u8* gMatsudaDebugMenuTextList3[];
extern u8 gMatsudaDebugMenuContestTopLeft[][2];

struct ContestPokemon
{
 /* 0x00 */ u16 species;
 /* 0x02 */ u8 nickname[POKEMON_NAME_LENGTH];
 /* 0x0D */ u8 trainerName[8];
 /* 0x15 */ u8 filler15[9];
 /* 0x1E */ u16 moves[4]; // moves
 /* 0x26 */ u8 cool; // cool
 /* 0x27 */ u8 beauty; // beauty
 /* 0x28 */ u8 cute; // cute
 /* 0x29 */ u8 smart; // smart
 /* 0x2A */ u8 tough; // tough
 /* 0x2B */ u8 sheen; // sheen
 /* 0x2C */ u8 filler2C[20];
};

extern struct ContestPokemon gContestMons[];

extern bool8 gReceivedRemoteLinkPlayers;
extern u16 gBlockRecvBuffer[MAX_LINK_PLAYERS][BLOCK_BUFFER_SIZE / 2];

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
    
    switch(choice)
    {
    case -2:
        return FALSE;
    default:
        gCallback_03004AE8 = gMatsudaDebugMenuActions[choice].func;
        return FALSE;
    case -1:
        sub_8071C20();
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
    if(!gPaletteFade.active)
    {
        DestroyTask(taskId);

        if(!(gIsLinkContest & 1))
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
    if(gReceivedRemoteLinkPlayers == FALSE)
    {
        DestroyTask(gTasks[taskId].data[10]);
        DestroyTask(taskId);
        sub_8071C20();
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

   for(i = 0; i < 4; i++)
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
    sub_8071C20();
}

static void sub_80A9E04(u8 taskId)
{
    if(gMain.newKeys == 2)
        gTasks[(u8)gTasks[taskId].data[10]].func = sub_80A9D30;
}

static void sub_80A9E3C(u8 taskId)
{
    u8 i;
    
    OpenLink();

    for(i = 0; i < 4; i++)
        gBlockRecvBuffer[i][0] = 255;

    gTasks[taskId].data[0] = 0;
    gTasks[taskId].func = sub_80A9E80;
}

static void sub_80A9E80(u8 taskId)
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

static void sub_80A9ED8(u8 taskId)
{
    gTasks[taskId].data[0] = gTasks[taskId].data[0] + 1;
    if((gTasks[taskId].data[0]) == 101)
    {
        sub_8007F4C();
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = sub_80A9F10;
    }
}

static void sub_80A9F10(u8 taskId)
{
    if(gReceivedRemoteLinkPlayers)
    {
        gContestPlayerMonIndex = GetMultiplayerId();
        if(GetLinkPlayerCount() == 4)
        {
            gIsLinkContest = 1;
            SwitchTaskToFollowupFunc(taskId);
        }
    }
}

static void sub_80A9F50(void)
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

static void sub_80A9FE4(void)
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
    sub_80034D4((void *)VRAM, ptr);
    LoadFontDefaultPalette(&gWindowConfig_81E6C3C);
}

static void sub_80AA064(void)
{
    AnimateSprites();
    BuildOamBuffer();
    RunTasks();
    UpdatePaletteFade();
    if(gMain.newKeys == 4)
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

    if(!(gContestMons[0].nickname[0]))
        sub_80AE398(0, 0);

    sub_80AE098(gUnknown_02038694);

    for(i = 0; i < 6; i++)
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

void sub_80AA280(u8 var)
{
    u8 i;

    FillWindowRect_DefaultPalette(&gMenuWindow, 0, 0, 0, 0x1E, 3);
    StringCopy(unk_2000000, gMatsudaDebugMenu_StartText);
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

	for(i = 0; i < 4; i++)
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

// too complicated
__attribute__((naked))
void sub_80AA754(struct Sprite *sprite)
{
	asm(".syntax unified\n\
	push {r4,lr}\n\
	adds r4, r0, 0\n\
	ldr r0, _080AA774 @ =gMain\n\
	ldrh r1, [r0, 0x30]\n\
	cmp r1, 0x20\n\
	beq _080AA7A2\n\
	cmp r1, 0x20\n\
	bgt _080AA782\n\
	cmp r1, 0x2\n\
	beq _080AA7F8\n\
	cmp r1, 0x2\n\
	bgt _080AA778\n\
	cmp r1, 0x1\n\
	beq _080AA7D8\n\
	b _080AA870\n\
	.align 2, 0\n\
_080AA774: .4byte gMain\n\
_080AA778:\n\
	cmp r1, 0x8\n\
	beq _080AA868\n\
	cmp r1, 0x10\n\
	beq _080AA7A2\n\
	b _080AA870\n\
_080AA782:\n\
	cmp r1, 0x80\n\
	beq _080AA7C2\n\
	cmp r1, 0x80\n\
	bgt _080AA790\n\
	cmp r1, 0x40\n\
	beq _080AA7AC\n\
	b _080AA870\n\
_080AA790:\n\
	movs r0, 0x80\n\
	lsls r0, 1\n\
	cmp r1, r0\n\
	beq _080AA814\n\
	movs r0, 0x80\n\
	lsls r0, 2\n\
	cmp r1, r0\n\
	beq _080AA834\n\
	b _080AA870\n\
_080AA7A2:\n\
	ldrh r0, [r4, 0x2E]\n\
	movs r1, 0x1\n\
	eors r0, r1\n\
	strh r0, [r4, 0x2E]\n\
	b _080AA870\n\
_080AA7AC:\n\
	ldrh r1, [r4, 0x30]\n\
	movs r2, 0x30\n\
	ldrsh r0, [r4, r2]\n\
	cmp r0, 0\n\
	bne _080AA7BC\n\
	movs r0, 0x8\n\
	strh r0, [r4, 0x30]\n\
	b _080AA870\n\
_080AA7BC:\n\
	subs r0, r1, 0x1\n\
	strh r0, [r4, 0x30]\n\
	b _080AA870\n\
_080AA7C2:\n\
	ldrh r1, [r4, 0x30]\n\
	movs r3, 0x30\n\
	ldrsh r0, [r4, r3]\n\
	cmp r0, 0x8\n\
	bne _080AA7D2\n\
	movs r0, 0\n\
	strh r0, [r4, 0x30]\n\
	b _080AA870\n\
_080AA7D2:\n\
	adds r0, r1, 0x1\n\
	strh r0, [r4, 0x30]\n\
	b _080AA870\n\
_080AA7D8:\n\
	ldr r2, _080AA7F4 @ =gUnknown_083C92E4\n\
	movs r1, 0x2E\n\
	ldrsh r0, [r4, r1]\n\
	lsls r0, 2\n\
	movs r3, 0x30\n\
	ldrsh r1, [r4, r3]\n\
	lsls r1, 3\n\
	adds r0, r1\n\
	adds r0, r2\n\
	ldr r2, [r0]\n\
	adds r0, r4, 0\n\
	movs r1, 0x1\n\
	b _080AA84E\n\
	.align 2, 0\n\
_080AA7F4: .4byte gUnknown_083C92E4\n\
_080AA7F8:\n\
	ldr r1, _080AA810 @ =gUnknown_083C92E4\n\
	movs r0, 0x2E\n\
	ldrsh r2, [r4, r0]\n\
	lsls r2, 2\n\
	movs r3, 0x30\n\
	ldrsh r0, [r4, r3]\n\
	lsls r0, 3\n\
	adds r2, r0\n\
	adds r2, r1\n\
	movs r1, 0x1\n\
	negs r1, r1\n\
	b _080AA84A\n\
	.align 2, 0\n\
_080AA810: .4byte gUnknown_083C92E4\n\
_080AA814:\n\
	ldr r2, _080AA830 @ =gUnknown_083C92E4\n\
	movs r1, 0x2E\n\
	ldrsh r0, [r4, r1]\n\
	lsls r0, 2\n\
	movs r3, 0x30\n\
	ldrsh r1, [r4, r3]\n\
	lsls r1, 3\n\
	adds r0, r1\n\
	adds r0, r2\n\
	ldr r2, [r0]\n\
	adds r0, r4, 0\n\
	movs r1, 0xA\n\
	b _080AA84E\n\
	.align 2, 0\n\
_080AA830: .4byte gUnknown_083C92E4\n\
_080AA834:\n\
	ldr r1, _080AA864 @ =gUnknown_083C92E4\n\
	movs r0, 0x2E\n\
	ldrsh r2, [r4, r0]\n\
	lsls r2, 2\n\
	movs r3, 0x30\n\
	ldrsh r0, [r4, r3]\n\
	lsls r0, 3\n\
	adds r2, r0\n\
	adds r2, r1\n\
	movs r1, 0xA\n\
	negs r1, r1\n\
_080AA84A:\n\
	ldr r2, [r2]\n\
	adds r0, r4, 0\n\
_080AA84E:\n\
	bl _call_via_r2\n\
	ldrh r0, [r4, 0x32]\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	ldrh r1, [r4, 0x34]\n\
	lsls r1, 24\n\
	lsrs r1, 24\n\
	bl sub_80AA614\n\
	b _080AA870\n\
	.align 2, 0\n\
_080AA864: .4byte gUnknown_083C92E4\n\
_080AA868:\n\
	adds r0, r4, 0\n\
	movs r1, 0x1\n\
	bl sub_80AAD08\n\
_080AA870:\n\
	ldr r2, _080AA898 @ =gUnknown_083C9296\n\
	movs r0, 0x2E\n\
	ldrsh r1, [r4, r0]\n\
	movs r3, 0x30\n\
	ldrsh r0, [r4, r3]\n\
	lsls r0, 1\n\
	adds r1, r0\n\
	adds r1, r2\n\
	ldrb r0, [r1]\n\
	strh r0, [r4, 0x20]\n\
	ldr r1, _080AA89C @ =gUnknown_083C92A8\n\
	movs r2, 0x30\n\
	ldrsh r0, [r4, r2]\n\
	adds r0, r1\n\
	ldrb r0, [r0]\n\
	strh r0, [r4, 0x22]\n\
	pop {r4}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080AA898: .4byte gUnknown_083C9296\n\
_080AA89C: .4byte gUnknown_083C92A8\n\
	.syntax divided");
}

static void sub_80AA8A0(struct Sprite *sprite, s8 var1, u8 var2)
{
	if(var1 == 1)
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

// hard/weird function #2
__attribute__((naked))
void sub_80AABF0(struct Sprite *sprite, u8 var2)
{
	asm(".syntax unified\n\
	push {r4,r5,lr}\n\
	adds r5, r0, 0\n\
	lsls r1, 24\n\
	movs r0, 0xFF\n\
	cmp r1, 0\n\
	ble _080AABFE\n\
	movs r0, 0x1\n\
_080AABFE:\n\
	lsls r0, 24\n\
	asrs r0, 24\n\
	ldrh r1, [r5, 0x34]\n\
	adds r0, r1\n\
	lsls r0, 24\n\
	lsrs r4, r0, 24\n\
	asrs r0, 24\n\
	cmp r0, 0\n\
	bge _080AAC14\n\
	movs r4, 0\n\
	b _080AAC1A\n\
_080AAC14:\n\
	cmp r0, 0x4\n\
	ble _080AAC1A\n\
	movs r4, 0x4\n\
_080AAC1A:\n\
	lsls r4, 24\n\
	lsrs r0, r4, 24\n\
	bl sub_80AA5BC\n\
	asrs r4, 24\n\
	strh r4, [r5, 0x34]\n\
	ldr r0, _080AAC54 @ =gScriptContestCategory\n\
	strh r4, [r0]\n\
	lsls r4, 24\n\
	lsrs r4, 24\n\
	ldr r0, _080AAC58 @ =gScriptContestRank\n\
	ldrb r1, [r0]\n\
	adds r0, r4, 0\n\
	bl sub_80AE398\n\
	ldrh r0, [r5, 0x32]\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	bl sub_80AA280\n\
	ldrh r0, [r5, 0x32]\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	bl sub_80AA658\n\
	pop {r4,r5}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080AAC54: .4byte gScriptContestCategory\n\
_080AAC58: .4byte gScriptContestRank\n\
	.syntax divided");
}

/*
	thumb_func_start sub_80AABF0
sub_80AABF0: @ 80AABF0
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	movs r0, 0xFF
	cmp r1, 0
	ble _080AABFE
	movs r0, 0x1
_080AABFE:
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r5, 0x34]
	adds r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	asrs r0, 24
	cmp r0, 0
	bge _080AAC14
	movs r4, 0
	b _080AAC1A
_080AAC14:
	cmp r0, 0x4
	ble _080AAC1A
	movs r4, 0x4
_080AAC1A:
	lsls r4, 24
	lsrs r0, r4, 24
	bl sub_80AA5BC
	asrs r4, 24
	strh r4, [r5, 0x34]
	ldr r0, _080AAC54 @ =gScriptContestCategory
	strh r4, [r0]
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080AAC58 @ =gScriptContestRank
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_80AE398
	ldrh r0, [r5, 0x32]
	lsls r0, 24
	lsrs r0, 24
	bl sub_80AA280
	ldrh r0, [r5, 0x32]
	lsls r0, 24
	lsrs r0, 24
	bl sub_80AA658
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AAC54: .4byte gScriptContestCategory
_080AAC58: .4byte gScriptContestRank
	thumb_func_end sub_80AABF0
*/

/*
	thumb_func_start sub_80AA754
sub_80AA754: @ 80AA754
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080AA774 @ =gMain
	ldrh r1, [r0, 0x30]
	cmp r1, 0x20
	beq _080AA7A2
	cmp r1, 0x20
	bgt _080AA782
	cmp r1, 0x2
	beq _080AA7F8
	cmp r1, 0x2
	bgt _080AA778
	cmp r1, 0x1
	beq _080AA7D8
	b _080AA870
	.align 2, 0
_080AA774: .4byte gMain
_080AA778:
	cmp r1, 0x8
	beq _080AA868
	cmp r1, 0x10
	beq _080AA7A2
	b _080AA870
_080AA782:
	cmp r1, 0x80
	beq _080AA7C2
	cmp r1, 0x80
	bgt _080AA790
	cmp r1, 0x40
	beq _080AA7AC
	b _080AA870
_080AA790:
	movs r0, 0x80
	lsls r0, 1
	cmp r1, r0
	beq _080AA814
	movs r0, 0x80
	lsls r0, 2
	cmp r1, r0
	beq _080AA834
	b _080AA870
_080AA7A2:
	ldrh r0, [r4, 0x2E]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x2E]
	b _080AA870
_080AA7AC:
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080AA7BC
	movs r0, 0x8
	strh r0, [r4, 0x30]
	b _080AA870
_080AA7BC:
	subs r0, r1, 0x1
	strh r0, [r4, 0x30]
	b _080AA870
_080AA7C2:
	ldrh r1, [r4, 0x30]
	movs r3, 0x30
	ldrsh r0, [r4, r3]
	cmp r0, 0x8
	bne _080AA7D2
	movs r0, 0
	strh r0, [r4, 0x30]
	b _080AA870
_080AA7D2:
	adds r0, r1, 0x1
	strh r0, [r4, 0x30]
	b _080AA870
_080AA7D8:
	ldr r2, _080AA7F4 @ =gUnknown_083C92E4
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	lsls r0, 2
	movs r3, 0x30
	ldrsh r1, [r4, r3]
	lsls r1, 3
	adds r0, r1
	adds r0, r2
	ldr r2, [r0]
	adds r0, r4, 0
	movs r1, 0x1
	b _080AA84E
	.align 2, 0
_080AA7F4: .4byte gUnknown_083C92E4
_080AA7F8:
	ldr r1, _080AA810 @ =gUnknown_083C92E4
	movs r0, 0x2E
	ldrsh r2, [r4, r0]
	lsls r2, 2
	movs r3, 0x30
	ldrsh r0, [r4, r3]
	lsls r0, 3
	adds r2, r0
	adds r2, r1
	movs r1, 0x1
	negs r1, r1
	b _080AA84A
	.align 2, 0
_080AA810: .4byte gUnknown_083C92E4
_080AA814:
	ldr r2, _080AA830 @ =gUnknown_083C92E4
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	lsls r0, 2
	movs r3, 0x30
	ldrsh r1, [r4, r3]
	lsls r1, 3
	adds r0, r1
	adds r0, r2
	ldr r2, [r0]
	adds r0, r4, 0
	movs r1, 0xA
	b _080AA84E
	.align 2, 0
_080AA830: .4byte gUnknown_083C92E4
_080AA834:
	ldr r1, _080AA864 @ =gUnknown_083C92E4
	movs r0, 0x2E
	ldrsh r2, [r4, r0]
	lsls r2, 2
	movs r3, 0x30
	ldrsh r0, [r4, r3]
	lsls r0, 3
	adds r2, r0
	adds r2, r1
	movs r1, 0xA
	negs r1, r1
_080AA84A:
	ldr r2, [r2]
	adds r0, r4, 0
_080AA84E:
	bl _call_via_r2
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x34]
	lsls r1, 24
	lsrs r1, 24
	bl sub_80AA614
	b _080AA870
	.align 2, 0
_080AA864: .4byte gUnknown_083C92E4
_080AA868:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80AAD08
_080AA870:
	ldr r2, _080AA898 @ =gUnknown_083C9296
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	movs r3, 0x30
	ldrsh r0, [r4, r3]
	lsls r0, 1
	adds r1, r0
	adds r1, r2
	ldrb r0, [r1]
	strh r0, [r4, 0x20]
	ldr r1, _080AA89C @ =gUnknown_083C92A8
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r4, 0x22]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA898: .4byte gUnknown_083C9296
_080AA89C: .4byte gUnknown_083C92A8
	thumb_func_end sub_80AA754
*/
