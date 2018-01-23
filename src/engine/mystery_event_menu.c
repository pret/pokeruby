#include "global.h"
#include "mystery_event_menu.h"
#include "link.h"
#include "main.h"
#include "menu.h"
#include "mystery_event_script.h"
#include "palette.h"
#include "save.h"
#include "constants/songs.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "strings2.h"
#include "task.h"
#include "text.h"
#include "ewram.h"

static EWRAM_DATA u8 gUnknown_02039338 = 0;

static void VBlankCB(void);
static bool8 CheckLanguageMatch(void);
static bool8 GetEventLoadMessage(u8 *dest, u32 status);
static void CB2_MysteryEventMenu(void);

static void VBlankCB(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static bool8 CheckLanguageMatch(void)
{
    bool8 val = FALSE;

    if (gLinkPlayers[0].language == gLinkPlayers[1].language)
        val = TRUE;

    return val;
}

void CB2_InitMysteryEventMenu(void)
{
    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetTasks();
    SetVBlankCallback(VBlankCB);
    Text_LoadWindowTemplate(&gWindowTemplate_81E6CE4);
    InitMenuWindow(&gWindowTemplate_81E6CE4);
    Menu_EraseScreen();
    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON;
    REG_BLDCNT = 0;
    CreateTask(Task_DestroySelf, 0);
    StopMapMusic();
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    FillPalette(0, 0, 2);
    SetMainCallback2(CB2_MysteryEventMenu);
}

static bool8 GetEventLoadMessage(u8 *dest, u32 status)
{
    bool8 retVal = 1;

    if (status == 0)
    {
        StringCopy(dest, gSystemText_EventLoadSuccess);
        retVal = 0;
    }

    if (status == 2)
        retVal = 0;

    if (status == 1)
        StringCopy(dest, gSystemText_LoadingError);

    return retVal;
}

static void CB2_MysteryEventMenu(void)
{
    u16 unkVal;

    switch (gMain.state)
    {
    case 0:
        Menu_DrawStdWindowFrame(0, 14, 29, 19);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0x10, 0, 0);
        gMain.state++;
        break;
    case 1:
        if (gPaletteFade.active)
            break;
        MenuPrintMessageDefaultCoords(gSystemText_LinkStandby);
        gMain.state++;
        break;
    case 2:
        if (Menu_UpdateWindowText())
        {
            gMain.state++;
            gLinkType = 21761;
            OpenLink();
        }
        break;
    case 3:
        if ((gLinkStatus & 0x20) && (gLinkStatus & 0x1C) > 4)
        {
            PlaySE(SE_PIN);
            MenuPrintMessageDefaultCoords(gSystemText_LoadEventPressA);
            gMain.state++;
        }
        if (gMain.newKeys & B_BUTTON)
        {
            PlaySE(SE_SELECT);
            CloseLink();
            gMain.state = 15;
        }
        break;
    case 4:
        if (Menu_UpdateWindowText())
            gMain.state++;
        break;
#ifdef NONMATCHING
    case 5:
        if (GetLinkPlayerCount_2() != 2)
        {
            GetEventLoadMessage(gStringVar4, 1);
            MenuPrintMessageDefaultCoords(gStringVar4);
            gMain.state = 13;
            break;
        }
        if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            sub_8007F4C();
            Menu_DrawStdWindowFrame(6, 5, 23, 8);
            Menu_PrintText(gSystemText_LoadingEvent, 7, 6);
            gMain.state++;
        }
        else if (gMain.newKeys & B_BUTTON)
        {
            PlaySE(SE_SELECT);
            CloseLink();
            gMain.state = 15;
        }
        break;
    case 6:
        if (IsLinkConnectionEstablished())
        {
            if (!gReceivedRemoteLinkPlayers)
                break;

            if (GetLinkPlayerDataExchangeStatusTimed() == 3)
            {
                sub_800832C();
                Menu_EraseWindowRect(6, 5, 23, 8);
                GetEventLoadMessage(gStringVar4, 1);
                MenuPrintMessageDefaultCoords(gStringVar4);
                gMain.state = 13;
                break;
            }
            else if (CheckLanguageMatch())
            {
                MenuPrintMessageDefaultCoords(gSystemText_DontCutLink);
                gMain.state++;
                break;
            }
            else
            {
                CloseLink();
                Menu_EraseWindowRect(6, 5, 23, 8);
                GetEventLoadMessage(gStringVar4, 1);
                MenuPrintMessageDefaultCoords(gStringVar4);
                gMain.state = 13;
                break;
            }
        }
        if (gMain.newKeys & B_BUTTON)
        {
            PlaySE(SE_SELECT);
            CloseLink();
            gMain.state = 15;
            break;
        }
        break;
#else
    case 5:
        if (GetLinkPlayerCount_2() != 2)
        {
            goto label;
        }
        if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            sub_8007F4C();
            Menu_DrawStdWindowFrame(6, 5, 23, 8);
            Menu_PrintText(gSystemText_LoadingEvent, 7, 6);
            gMain.state++;
        }
        else if (gMain.newKeys & B_BUTTON)
        {
            PlaySE(SE_SELECT);
            CloseLink();
            gMain.state = 15;
        }
        break;
    case 6:
        if (IsLinkConnectionEstablished())
        {
            register u8 *ptr asm("r0");
            register u32 offset1 asm("r2");
            register u32 offset2 asm("r1");

            if (!gReceivedRemoteLinkPlayers)
                break;

            if (GetLinkPlayerDataExchangeStatusTimed() == 3)
            {
                sub_800832C();
                Menu_EraseWindowRect(6, 5, 23, 8);
                GetEventLoadMessage(gStringVar4, 1);
                MenuPrintMessageDefaultCoords(gStringVar4);
                ptr = (u8 *)&gMain;
                offset1 = offsetof(struct Main, state);
                asm("" ::: "r1");
                ptr += offset1;
                *ptr = 13;
            }
            else if (CheckLanguageMatch())
            {
                register u8 *ptr2 asm("r1");
                register int offset3 asm("r0");
                register int dummy asm("r2");
                MenuPrintMessageDefaultCoords(gSystemText_DontCutLink);
                ptr2 = (u8 *)&gMain;
                offset3 = offsetof(struct Main, state);
                if (dummy)
                    dummy++;
                ptr2 += offset3;
                (*ptr2)++;
                break;
            }
            else
            {
                CloseLink();
                Menu_EraseWindowRect(6, 5, 23, 8);
            label:
                GetEventLoadMessage(gStringVar4, 1);
                MenuPrintMessageDefaultCoords(gStringVar4);
                ptr = (u8 *)&gMain;
                offset2 = offsetof(struct Main, state);
                ptr += offset2;
                *ptr = 13;
            }
            break;
        }
        if (gMain.newKeys & B_BUTTON)
        {
            PlaySE(SE_SELECT);
            CloseLink();
            gMain.state = 15;
            break;
        }
        break;
#endif
    case 7:
        if (Menu_UpdateWindowText())
            gMain.state++;
        break;
    case 8:
        if (GetBlockReceivedStatus())
        {
            ResetBlockReceivedFlags();
            gMain.state++;
        }
        break;
    case 9:
        gMain.state++;
        break;
    case 10:
        sub_800832C();
        gMain.state++;
        break;
    case 11:
        if (gReceivedRemoteLinkPlayers)
            break;
        unkVal = RunMysteryEventScript(gSharedMem);
        CpuFill32(0, gSharedMem, 0x7D4);
        if (!GetEventLoadMessage(gStringVar4, unkVal))
            Save_WriteData(SAVE_NORMAL);
        gMain.state++;
        break;
    case 12:
        MenuPrintMessageDefaultCoords(gStringVar4);
        gMain.state++;
        break;
    case 13:
        Menu_EraseWindowRect(6, 5, 23, 8);
        if (Menu_UpdateWindowText())
        {
            gMain.state++;
            gUnknown_02039338 = 0;
        }
        break;
    case 14:
        if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            gMain.state++;
        }
        break;
    case 15:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0x10, 0);
        gMain.state++;
        break;
    case 16:
        if (!gPaletteFade.active)
            DoSoftReset();
        break;
    }

    if (gLinkStatus & 0x40)
    {
        if (!IsLinkMaster())
        {
            CloseLink();
            Menu_EraseWindowRect(6, 5, 23, 8);
            GetEventLoadMessage(gStringVar4, 1);
            MenuPrintMessageDefaultCoords(gStringVar4);
            gMain.state = 13;
        }
    }

    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

#if DEBUG

void debug_sub_815D1D8();

__attribute__((naked))
void debug_sub_815D04C()
{
    asm(
        "	push	{r4, r5, r6, lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r5, r0, #0x18\n"
        "	ldr	r1, ._125\n"
        "	lsl	r0, r5, #0x2\n"
        "	add	r0, r0, r5\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r4, r0, r1\n"
        "	mov	r1, #0x8\n"
        "	ldsh	r0, [r4, r1]\n"
        "	cmp	r0, #0\n"
        "	bne	._121	@cond_branch\n"
        "	mov	r0, #0x4\n"
        "	mov	r1, #0x4\n"
        "	mov	r2, #0xd\n"
        "	mov	r3, #0x7\n"
        "	bl	Menu_DrawStdWindowFrame\n"
        "	ldr	r1, ._125 + 4\n"
        "	mov	r2, #0xa\n"
        "	ldsh	r0, [r4, r2]\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r0, r0, r1\n"
        "	ldr	r0, [r0]\n"
        "	mov	r1, #0x5\n"
        "	mov	r2, #0x5\n"
        "	bl	Menu_PrintText\n"
        "	ldrh	r0, [r4, #0x8]\n"
        "	add	r0, r0, #0x1\n"
        "	strh	r0, [r4, #0x8]\n"
        "._121:\n"
        "	ldr	r2, ._125 + 8\n"
        "	ldrh	r1, [r2, #0x2e]\n"
        "	mov	r0, #0x20\n"
        "	and	r0, r0, r1\n"
        "	add	r6, r2, #0\n"
        "	cmp	r0, #0\n"
        "	beq	._122	@cond_branch\n"
        "	ldrh	r1, [r4, #0xa]\n"
        "	mov	r2, #0xa\n"
        "	ldsh	r0, [r4, r2]\n"
        "	cmp	r0, #0\n"
        "	bne	._123	@cond_branch\n"
        "	ldr	r0, ._125 + 12\n"
        "	ldrb	r0, [r0]\n"
        "	sub	r0, r0, #0x1\n"
        "	b	._124\n"
        "._126:\n"
        "	.align	2, 0\n"
        "._125:\n"
        "	.word	gTasks\n"
        "	.word	gUnknown_Debug_842E2D0\n"
        "	.word	gMain\n"
        "	.word	gUnknown_Debug_842E350\n"
        "._123:\n"
        "	sub	r0, r1, #1\n"
        "._124:\n"
        "	strh	r0, [r4, #0xa]\n"
        "	ldr	r0, ._130\n"
        "	lsl	r1, r5, #0x2\n"
        "	add	r1, r1, r5\n"
        "	lsl	r1, r1, #0x3\n"
        "	add	r1, r1, r0\n"
        "	mov	r0, #0x0\n"
        "	strh	r0, [r1, #0x8]\n"
        "._122:\n"
        "	ldrh	r1, [r6, #0x2e]\n"
        "	mov	r0, #0x10\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._127	@cond_branch\n"
        "	ldr	r1, ._130\n"
        "	lsl	r2, r5, #0x2\n"
        "	add	r0, r2, r5\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r4, r0, r1\n"
        "	mov	r0, #0xa\n"
        "	ldsh	r3, [r4, r0]\n"
        "	ldr	r0, ._130 + 4\n"
        "	ldrb	r0, [r0]\n"
        "	sub	r0, r0, #0x1\n"
        "	cmp	r3, r0\n"
        "	bne	._128	@cond_branch\n"
        "	mov	r0, #0x0\n"
        "	b	._129\n"
        "._131:\n"
        "	.align	2, 0\n"
        "._130:\n"
        "	.word	gTasks\n"
        "	.word	gUnknown_Debug_842E350\n"
        "._128:\n"
        "	ldrh	r0, [r4, #0xa]\n"
        "	add	r0, r0, #0x1\n"
        "._129:\n"
        "	strh	r0, [r4, #0xa]\n"
        "	add	r0, r2, r5\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r0, r0, r1\n"
        "	mov	r1, #0x0\n"
        "	strh	r1, [r0, #0x8]\n"
        "._127:\n"
        "	ldrh	r1, [r6, #0x2e]\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._132	@cond_branch\n"
        "	ldr	r1, ._133\n"
        "	lsl	r0, r5, #0x2\n"
        "	add	r0, r0, r5\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r0, r0, r1\n"
        "	mov	r2, #0xa\n"
        "	ldsh	r1, [r0, r2]\n"
        "	lsl	r1, r1, #0x3\n"
        "	ldr	r0, ._133 + 4\n"
        "	add	r0, r0, #0x4\n"
        "	add	r1, r1, r0\n"
        "	ldr	r0, ._133 + 8\n"
        "	ldr	r1, [r1]\n"
        "	bl	_call_via_r1\n"
        "	ldr	r0, ._133 + 12\n"
        "	add	r1, r6, r0\n"
        "	ldrb	r0, [r1]\n"
        "	add	r0, r0, #0x1\n"
        "	strb	r0, [r1]\n"
        "	add	r0, r5, #0\n"
        "	bl	DestroyTask\n"
        "._132:\n"
        "	pop	{r4, r5, r6}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._134:\n"
        "	.align	2, 0\n"
        "._133:\n"
        "	.word	gTasks\n"
        "	.word	gUnknown_Debug_842E2D0\n"
        "	.word	+0x2004000\n"
        "	.word	0x43c\n"
        "\n"
    );
}

void debug_sub_815D15C(void)
{
    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetTasks();
    SetVBlankCallback(VBlankCB);
    Text_LoadWindowTemplate(&gWindowTemplate_81E6CE4);
    InitMenuWindow(&gWindowTemplate_81E6CE4);
    Menu_EraseScreen();
    REG_DISPCNT = DISPCNT_BG0_ON | DISPCNT_OBJ_1D_MAP | DISPCNT_MODE_0;
    REG_BLDCNT = 0;

    CreateTask(Task_DestroySelf, 0);
    StopMapMusic();
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    FillPalette(0, 0, 2);
    SetMainCallback2(debug_sub_815D1D8);
}

__attribute__((naked))
void debug_sub_815D1D8()
{
    asm(
        "	push	{r4, lr}\n"
        "	add	sp, sp, #0xfffffffc\n"
        "	ldr	r1, ._139\n"
        "	ldr	r2, ._139 + 4\n"
        "	add	r0, r1, r2\n"
        "	ldrb	r0, [r0]\n"
        "	add	r4, r1, #0\n"
        "	cmp	r0, #0xb\n"
        "	bls	._137	@cond_branch\n"
        "	b	._196\n"
        "._137:\n"
        "	lsl	r0, r0, #0x2\n"
        "	ldr	r1, ._139 + 8\n"
        "	add	r0, r0, r1\n"
        "	ldr	r0, [r0]\n"
        "	mov	pc, r0\n"
        "._140:\n"
        "	.align	2, 0\n"
        "._139:\n"
        "	.word	gMain\n"
        "	.word	0x43c\n"
        "	.word	._141\n"
        "._141:\n"
        "	.word	._142\n"
        "	.word	._143\n"
        "	.word	._144\n"
        "	.word	._145\n"
        "	.word	._146\n"
        "	.word	._196\n"
        "	.word	._148\n"
        "	.word	._149\n"
        "	.word	._150\n"
        "	.word	._151\n"
        "	.word	._152\n"
        "	.word	._153\n"
        "._142:\n"
        "	mov	r0, #0x3\n"
        "	mov	r1, #0xe\n"
        "	mov	r2, #0x1b\n"
        "	mov	r3, #0x13\n"
        "	bl	Menu_DrawStdWindowFrame\n"
        "	mov	r0, #0x1\n"
        "	neg	r0, r0\n"
        "	mov	r1, #0x0\n"
        "	str	r1, [sp]\n"
        "	mov	r2, #0x10\n"
        "	mov	r3, #0x0\n"
        "	bl	BeginNormalPaletteFade\n"
        "	ldr	r1, ._155\n"
        "	ldr	r0, ._155 + 4\n"
        "	add	r1, r1, r0\n"
        "	b	._189\n"
        "._156:\n"
        "	.align	2, 0\n"
        "._155:\n"
        "	.word	gMain\n"
        "	.word	0x43c\n"
        "._143:\n"
        "	ldr	r0, ._161\n"
        "	ldrb	r1, [r0, #0x7]\n"
        "	mov	r0, #0x80\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._157	@cond_branch\n"
        "	b	._196\n"
        "._157:\n"
        "	ldrh	r1, [r4, #0x2c]\n"
        "	mov	r0, #0x80\n"
        "	lsl	r0, r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._159	@cond_branch\n"
        "	ldr	r1, ._161 + 4\n"
        "	ldrb	r0, [r1]\n"
        "	add	r0, r0, #0x1\n"
        "	strb	r0, [r1]\n"
        "._159:\n"
        "	ldr	r0, ._161 + 8\n"
        "	mov	r1, #0x4\n"
        "	mov	r2, #0xf\n"
        "	bl	MenuPrintMessage\n"
        "	ldr	r2, ._161 + 12\n"
        "	add	r1, r4, r2\n"
        "	b	._189\n"
        "._162:\n"
        "	.align	2, 0\n"
        "._161:\n"
        "	.word	gPaletteFade\n"
        "	.word	gUnknown_Debug_30030E0\n"
        "	.word	Str_843DA70\n"
        "	.word	0x43c\n"
        "._144:\n"
        "	bl	Menu_UpdateWindowText\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	bne	._163	@cond_branch\n"
        "	b	._196\n"
        "._163:\n"
        "	ldr	r1, ._166\n"
        "	ldr	r0, ._166 + 4\n"
        "	add	r1, r1, r0\n"
        "	ldrb	r0, [r1]\n"
        "	add	r0, r0, #0x1\n"
        "	strb	r0, [r1]\n"
        "	ldr	r1, ._166 + 8\n"
        "	ldr	r2, ._166 + 12\n"
        "	add	r0, r2, #0\n"
        "	strh	r0, [r1]\n"
        "	bl	OpenLink\n"
        "	b	._196\n"
        "._167:\n"
        "	.align	2, 0\n"
        "._166:\n"
        "	.word	gMain\n"
        "	.word	0x43c\n"
        "	.word	gLinkType\n"
        "	.word	0x5501\n"
        "._145:\n"
        "	ldr	r0, ._171\n"
        "	ldrb	r0, [r0]\n"
        "	cmp	r0, #0\n"
        "	bne	._168	@cond_branch\n"
        "	b	._196\n"
        "._168:\n"
        "	ldr	r1, ._171 + 4\n"
        "	add	r0, r4, r1\n"
        "	ldrb	r1, [r0]\n"
        "	add	r1, r1, #0x1\n"
        "	strb	r1, [r0]\n"
        "	ldr	r0, ._171 + 8\n"
        "	mov	r1, #0x4\n"
        "	mov	r2, #0xf\n"
        "	bl	MenuPrintMessage\n"
        "	b	._196\n"
        "._172:\n"
        "	.align	2, 0\n"
        "._171:\n"
        "	.word	gReceivedRemoteLinkPlayers\n"
        "	.word	0x43c\n"
        "	.word	Str_843DA84\n"
        "._146:\n"
        "	bl	Menu_UpdateWindowText\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	bne	._173	@cond_branch\n"
        "	b	._196\n"
        "._173:\n"
        "	ldr	r0, ._176\n"
        "	mov	r1, #0xa\n"
        "	bl	CreateTask\n"
        "	ldr	r1, ._176 + 4\n"
        "	ldr	r2, ._176 + 8\n"
        "	add	r1, r1, r2\n"
        "	b	._189\n"
        "._177:\n"
        "	.align	2, 0\n"
        "._176:\n"
        "	.word	debug_sub_815D04C+1\n"
        "	.word	gMain\n"
        "	.word	0x43c\n"
        "._148:\n"
        "	ldr	r0, ._179\n"
        "	mov	r1, #0x4\n"
        "	mov	r2, #0xf\n"
        "	bl	MenuPrintMessage\n"
        "	ldr	r1, ._179 + 4\n"
        "	ldr	r2, ._179 + 8\n"
        "	mov	r0, #0x0\n"
        "	bl	SendBlock\n"
        "	ldr	r1, ._179 + 12\n"
        "	ldr	r0, ._179 + 16\n"
        "	add	r1, r1, r0\n"
        "	b	._189\n"
        "._180:\n"
        "	.align	2, 0\n"
        "._179:\n"
        "	.word	Str_843DA98\n"
        "	.word	0x2004000\n"
        "	.word	0x2004\n"
        "	.word	gMain\n"
        "	.word	0x43c\n"
        "._149:\n"
        "	bl	Menu_UpdateWindowText\n"
        "	bl	sub_8007ECC\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	beq	._196	@cond_branch\n"
        "	ldr	r1, ._183\n"
        "	ldr	r2, ._183 + 4\n"
        "	add	r1, r1, r2\n"
        "	b	._189\n"
        "._184:\n"
        "	.align	2, 0\n"
        "._183:\n"
        "	.word	gMain\n"
        "	.word	0x43c\n"
        "._150:\n"
        "	bl	sub_800832C\n"
        "	ldr	r1, ._186\n"
        "	ldr	r0, ._186 + 4\n"
        "	add	r1, r1, r0\n"
        "	b	._189\n"
        "._187:\n"
        "	.align	2, 0\n"
        "._186:\n"
        "	.word	gMain\n"
        "	.word	0x43c\n"
        "._151:\n"
        "	ldr	r0, ._190\n"
        "	ldrb	r0, [r0]\n"
        "	cmp	r0, #0\n"
        "	bne	._196	@cond_branch\n"
        "	mov	r0, #0x4\n"
        "	mov	r1, #0xf\n"
        "	mov	r2, #0x1a\n"
        "	mov	r3, #0x12\n"
        "	bl	Menu_BlankWindowRect\n"
        "	ldr	r0, ._190 + 4\n"
        "	mov	r1, #0x4\n"
        "	mov	r2, #0xf\n"
        "	bl	Menu_PrintText\n"
        "	ldr	r1, ._190 + 8\n"
        "	ldr	r2, ._190 + 12\n"
        "	add	r1, r1, r2\n"
        "	b	._189\n"
        "._191:\n"
        "	.align	2, 0\n"
        "._190:\n"
        "	.word	gReceivedRemoteLinkPlayers\n"
        "	.word	Str_843DAA3\n"
        "	.word	gMain\n"
        "	.word	0x43c\n"
        "._152:\n"
        "	ldrh	r1, [r4, #0x2e]\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._196	@cond_branch\n"
        "	mov	r0, #0x1\n"
        "	neg	r0, r0\n"
        "	mov	r1, #0x0\n"
        "	str	r1, [sp]\n"
        "	mov	r2, #0x0\n"
        "	mov	r3, #0x10\n"
        "	bl	BeginNormalPaletteFade\n"
        "	ldr	r0, ._194\n"
        "	add	r1, r4, r0\n"
        "._189:\n"
        "	ldrb	r0, [r1]\n"
        "	add	r0, r0, #0x1\n"
        "	strb	r0, [r1]\n"
        "	b	._196\n"
        "._195:\n"
        "	.align	2, 0\n"
        "._194:\n"
        "	.word	0x43c\n"
        "._153:\n"
        "	ldr	r0, ._197\n"
        "	ldrb	r1, [r0, #0x7]\n"
        "	mov	r0, #0x80\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	bne	._196	@cond_branch\n"
        "	ldr	r0, ._197 + 4\n"
        "	bl	SetMainCallback2\n"
        "._196:\n"
        "	bl	RunTasks\n"
        "	bl	AnimateSprites\n"
        "	bl	BuildOamBuffer\n"
        "	bl	UpdatePaletteFade\n"
        "	add	sp, sp, #0x4\n"
        "	pop	{r4}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._198:\n"
        "	.align	2, 0\n"
        "._197:\n"
        "	.word	gPaletteFade\n"
        "	.word	CB2_InitTitleScreen+1\n"
        "\n"
    );
}

#endif
