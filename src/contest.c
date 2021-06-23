#include "global.h"
#include "contest.h"
#include "battle.h"
#include "battle_anim.h"
#include "blend_palette.h"
#include "constants/event_objects.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/songs.h"
#include "constants/species.h"
#include "contest_ai.h"
#include "contest_effect.h"
#include "contest_link.h"
#include "data2.h"
#include "decompress.h"
#include "ewram.h"
#include "graphics.h"
#include "link.h"
#include "m4a.h"
#include "main.h"
#include "menu.h"
#include "menu_cursor.h"
#include "overworld.h"
#include "palette.h"
#include "random.h"
#include "rom_8077ABC.h"
#include "scanline_effect.h"
#include "script.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
#include "tv.h"
#include "util.h"

#include "contest_internal.h"

extern u8 gUnknown_020297ED;

extern void sub_80C8A38(u8);
extern void sub_80C8AD0(u8);
extern void Task_LinkContest_CommunicateAppealsState(u8);

extern u8 gBattleMonForms[];
extern u8 gDisplayedStringBattle[];
extern u16 gBattleTypeFlags;
extern u8 gBattlerAttacker;
extern u8 gBattlerTarget;
extern u8 gBattlerPositions[];
extern u8 gBattlerSpriteIds[];
extern struct Window gWindowTemplate_Contest_MoveDescription;
u32 gContestRngValue;

extern const u8 gUnknown_083CA340[][4];
extern const u8 gText_Contest_WhichMoveWillBePlayed[];
extern const u8 gText_Contest_ButItCantParticipate[];
extern const u8 gUnknown_083CAFD7[];
extern const u8 gUnknown_083CB00D[];
extern const u8 ContestString_JudgeExpectantly2[];
extern const u8 ContestString_WentOverWell[];
extern const u8 ContestString_WentOverVeryWell[];
extern const u8 ContestString_AppealComboExcellently[];
extern const u8 gUnknown_083CBF60[];
extern const u8 gUnknown_083CB02C[];
extern const u8 *const gContestStandOutStrings[];
extern const u8 ContestString_DissapointedRepeat[];
extern const u8 ContestString_WentOverGreat[];
extern const u8 ContestString_DidntGoWell[];
extern const u8 ContestString_GotCrowdGoing[];
extern const u8 ContestString_CantAppealNextTurn[];
extern const u8 ContestString_CrowdWatches[];
extern const u8 ContestString_Ignored2[];
extern const u8 *const gContestCategoryStrings[];
extern const u8 *const gUnknown_083CC330[];
extern const u8 gUnknownText_UnknownFormatting2[];
extern const u8 gUnknownText_UnknownFormatting3[];

EWRAM_DATA u8 gUnknown_0203856C = 0;
EWRAM_DATA struct ContestPokemon gContestMons[4] = {0};
EWRAM_DATA s16 gContestMonRound1Points[4] = {0};
EWRAM_DATA s16 gContestMonTotalPoints[4] = {0};
EWRAM_DATA s16 gContestMonAppealPointTotals[4] = {0};
EWRAM_DATA s16 gContestMonRound2Points[4] = {0};
EWRAM_DATA u8 gContestFinalStandings[4] = {0};  // What "place" each participant came in.
EWRAM_DATA u8 gContestMonPartyIndex = 0;
EWRAM_DATA u8 gContestPlayerMonIndex = 0;
EWRAM_DATA u8 gContestantTurnOrder[4] = {0};
EWRAM_DATA u8 gIsLinkContest = 0;
EWRAM_DATA u8 gContestLinkLeaderIndex = 0;
EWRAM_DATA u16 gSpecialVar_ContestCategory = 0;
EWRAM_DATA u16 gSpecialVar_ContestRank = 0;

void nullsub_89(u8 taskId)
{
}

void ResetLinkContestBoolean(void)
{
    gIsLinkContest = FALSE;
}

void ResetContestGpuRegs(void)
{
    u16 savedIme;

    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP;
    savedIme = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_IME = savedIme;
    REG_DISPSTAT = DISPSTAT_VBLANK_INTR;
    REG_BG0CNT = 0x9800;
    REG_BG1CNT = 0x9E09;
    REG_BG2CNT = 0x9C00;
    REG_BG3CNT = 0x3A03;
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    REG_BLDY = 0;
    REG_WININ = 0x3F3F;
    REG_WINOUT = 0x3F3F;
    REG_DISPCNT |= 0x7F00;

    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    gBattle_BG1_X = 0;
    gBattle_BG1_Y = 0;
    gBattle_BG2_X = 0;
    gBattle_BG2_Y = 0;
    gBattle_BG3_X = 0;
    gBattle_BG3_Y = 0;
    gBattle_WIN0H = 0;
    gBattle_WIN0V = 0;
    gBattle_WIN1H = 0;
    gBattle_WIN1V = 0;
}
void LoadContestBgAfterMoveAnim(void)
{
    s32 i;

    LZDecompressVram(gContestMiscGfx, (void *)VRAM);
    LZDecompressVram(gContestAudienceGfx, (void *)(VRAM + 0x2000));
    LZDecompressVram(gUnknown_08D1725C, (void *)(VRAM + 0xD000));
    LoadCompressedPalette(gUnknown_08D17144, 0, 0x200);
    sub_80AB350();
    for (i = 0; i < 4; i++)
    {
        u32 var = 5 + i;

        LoadPalette(eContestTempSave.cachedWindowPalettes[var], 16 * (5 + gContestantTurnOrder[i]), 16 * sizeof(u16));
    }
}

void SetUpContestWindow(void)
{
    Text_LoadWindowTemplate(&gWindowTemplate_81E6FD8);
    Text_InitWindowWithTemplate(&gWindowTemplate_Contest_MoveDescription, &gWindowTemplate_81E6FD8);
    Text_InitWindowWithTemplate(&gMenuWindow, &gWindowTemplate_81E6FF4);
}

void sub_80AB350(void)
{
    u8 i;

    LoadFontDefaultPalette(&gWindowTemplate_81E6FD8);
    FillPalette(0, 0, 2);
    for (i = 10; i < 14; i++)
        LoadPalette(gPlttBufferUnfaded + 241, 240 + i, 2);
    FillPalette(0x7E3F, 0xF3, 2);
}

void ClearContestVars(void)
{
    s32 i;

    memset(&sContest, 0, sizeof(sContest));
    for (i = 0; i < 4; i++)
        sContest.unk19206[i] = 0xFF;

    for (i = 0; i < 4; i++)
        memset(&sContestantStatus[i], 0, sizeof(sContestantStatus[i]));
    for (i = 0; i < 4; i++)
    {
        sContestantStatus[i].ranking = 0;
        sContestantStatus[i].effectStringId = CONTEST_STRING_NONE;
        sContestantStatus[i].effectStringId2 = CONTEST_STRING_NONE;
    }

    memset(&eContestAppealResults, 0, sizeof(eContestAppealResults));
    memset(eContestAI, 0, sizeof(struct ContestAIInfo));
    memset(&eContestExcitement, 0, sizeof(eContestExcitement));
    memset(eContestGfxState, 0, 4 * sizeof(*eContestGfxState));
    if (!(gIsLinkContest & 1))
        SortContestants(0);
    for (i = 0; i < 4; i++)
    {
        sContestantStatus[i].nextTurnOrder = 0xFF;
        sContest.prevTurnOrder[i] = gContestantTurnOrder[i];
    }
    ApplyNextTurnOrder();
}

void CB2_StartContest(void)
{
    switch (gMain.state)
    {
    case 0:
        SetVBlankCallback(NULL);
        SetUpContestWindow();
        ResetContestGpuRegs();
        ScanlineEffect_Clear();
        ResetPaletteFade();
        gPaletteFade.bufferTransferDisabled = TRUE;
        DmaClearLarge32(3, (void *)VRAM, VRAM_SIZE, 0x1000);
        ResetSpriteData();
        ResetTasks();
        FreeAllSpritePalettes();
        gReservedSpritePaletteCount = 4;
        //eContestTempSave.unk18000 = 0;
        eEnableContestDebugging = 0;
        ClearBattleMonForms();
        ClearContestVars();
        gMain.state++;
        break;
    case 1:
        sub_80AB350();
        gMain.state++;
        break;
    case 2:
        if (sub_80AB70C(&sContest.unk1925D) == 0)
            break;
        sContest.unk1925D = 0;
        gMain.state++;
        break;
    case 3:
        SetBgForCurtainDrop();
        gBattle_BG1_X = 0;
        gBattle_BG1_Y = 0;
        BeginFastPaletteFade(2);
        gPaletteFade.bufferTransferDisabled = FALSE;
        SetVBlankCallback(ContestVBlankCallback);
        sContest.mainTaskId = CreateTask(sub_80AB5D4, 10);
        SetMainCallback2(ContestMainCallback2);
        break;
    }
}

void sub_80AB5D4(u8 taskId)
{
    if (!gPaletteFade.active)
        gTasks[taskId].func = sub_80AB604;
}

void sub_80AB604(u8 taskId)
{
    if (gIsLinkContest & 1)
    {
        if (!gPaletteFade.active)
        {
            gPaletteFade.bufferTransferDisabled = FALSE;
            ContestPrintLinkStandby();
            CreateTask(sub_80AB678, 0);
            gTasks[taskId].func = nullsub_89;
        }
    }
    else
    {
        gTasks[taskId].func = sub_80AB960;
    }
}

void sub_80AB678(u8 taskId)
{
    SetTaskFuncWithFollowupFunc(taskId, sub_80C89DC, sub_80AB694);
}

void sub_80AB694(u8 taskId)
{
    u16 one = 1;

    gTasks[taskId].data[0] = one;
    gTasks[taskId].func = sub_80AB6B4;
}

void sub_80AB6B4(u8 taskId)
{
    if (--gTasks[taskId].data[0] > 0)
        return;
    GetMultiplayerId(); // unused return value
    DestroyTask(taskId);
    gTasks[sContest.mainTaskId].func = sub_80AB960;
    gRngValue = gContestRngValue;
}

u8 sub_80AB70C(u8 *a)
{
    u16 sp0[16];
    u16 sp20[16];

    switch (*a)
    {
    case 0:
        gPaletteFade.bufferTransferDisabled = TRUE;
        DmaClearLarge32(3, (void *)VRAM, VRAM_SIZE, 0x1000);
        break;
    case 1:
        LZDecompressVram(gContestMiscGfx, (void *)VRAM);
        break;
    case 2:
        LZDecompressVram(gContestAudienceGfx, (void *)(VRAM + 0x2000));
        DmaCopyLarge32(3, (void *)(VRAM + 0x2000), ewram15800, 0x2000, 0x1000);
        break;
    case 3:
        LZDecompressVram(gUnknown_08D1725C, (void *)(VRAM + 0xD000));
        break;
    case 4:
        LZDecompressVram(gUnknown_08D17424, (void *)(VRAM + 0xE000));
        DmaCopy32Defvars(3, (void *)(VRAM + 0xE000), eContestTempSave.unk18A04, 0x800);
        break;
    case 5:
        LoadCompressedPalette(gUnknown_08D17144, 0, 0x200);
        CpuCopy32(gPlttBufferUnfaded + 128, sp0, 16 * sizeof(u16));
        CpuCopy32(gPlttBufferUnfaded + (5 + gContestPlayerMonIndex) * 16, sp20, 16 * sizeof(u16));
        CpuCopy32(sp20, gPlttBufferUnfaded + 128, 16 * sizeof(u16));
        CpuCopy32(sp0, gPlttBufferUnfaded + (5 + gContestPlayerMonIndex) * 16, 16 * sizeof(u16));
        DmaCopy32Defvars(3, gPlttBufferUnfaded, eContestTempSave.cachedWindowPalettes, 0x200);
        sub_80AB350();
        break;
    case 6:
        DrawContestantWindows();
        FillContestantWindowBgs();
        SwapMoveDescAndContestTilemaps();
        sContest.unk19216 = CreateJudgeSpeechBubbleSprite();
        CreateSliderHeartSprites();
        sub_80B0034();
        CreateApplauseMeterSprite();
        sub_80B0324();
        sub_80B0518();
        gBattlerPositions[0] = 0;
        gBattlerPositions[1] = 1;
        gBattlerPositions[2] = 3;
        gBattlerPositions[3] = 2;
        gBattleTypeFlags = 0;
        gBattlerAttacker = 2;
        gBattlerTarget = 3;
        gBattlerSpriteIds[gBattlerAttacker] = CreateJudgeSprite();
        CreateInvisibleBattleTargetSprite();
        break;
    default:
        *a = 0;
        return 1;
    }

    (*a)++;
    return 0;
}

void sub_80AB960(u8 taskId)
{
    gPaletteFade.bufferTransferDisabled = FALSE;
    if (!gPaletteFade.active)
    {
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].func = sub_80AB9A0;
    }
}

void sub_80AB9A0(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
    case 0:
        if (gTasks[taskId].data[1]++ <= 60)
            break;
        gTasks[taskId].data[1] = 0;
        PlaySE12WithPanning(SE_CONTEST_CURTAIN_RISE, 0);
        gTasks[taskId].data[0]++;
        break;
    case 1:
        if ((s16)(gBattle_BG1_Y += 7) <= 160)
            break;
        gTasks[taskId].data[0]++;
        break;
    case 2:
        UpdateContestantBoxOrder();
        gTasks[taskId].data[0]++;
        break;
    case 3:
        REG_BG0CNT_BITFIELD.priority = 0;
        REG_BG2CNT_BITFIELD.priority = 0;
        SlideApplauseMeterIn();
        gTasks[taskId].data[0]++;
        break;
    case 4:
    default:
        if (sContest.applauseMeterIsMoving)
            break;
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].func = sub_80ABB70;
        break;
    }
}

void ContestMainCallback2(void)
{
#if DEBUG
    if (gUnknown_020297ED == 1 && gMain.newKeys == 4)
	ContestDebugTogglePointTotal();
#endif
    AnimateSprites();
    RunTasks();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void ContestVBlankCallback(void)
{
    REG_BG0HOFS = gBattle_BG0_X;
    REG_BG0VOFS = gBattle_BG0_Y;
    REG_BG1HOFS = gBattle_BG1_X;
    REG_BG1VOFS = gBattle_BG1_Y;
    REG_BG2HOFS = gBattle_BG2_X;
    REG_BG2VOFS = gBattle_BG2_Y;
    REG_BG3HOFS = gBattle_BG3_X;
    REG_BG3VOFS = gBattle_BG3_Y;
    REG_WIN0H = gBattle_WIN0H;
    REG_WIN0V = gBattle_WIN0V;
    REG_WIN1H = gBattle_WIN1H;
    REG_WIN1V = gBattle_WIN1V;
    TransferPlttBuffer();
    LoadOam();
    ProcessSpriteCopyRequests();
    ScanlineEffect_InitHBlankDmaTransfer();
}

void sub_80ABB70(u8 taskId)
{
    gBattle_BG0_Y = 0;
    gBattle_BG2_Y = 0;
    ContestDebugDoPrint();
    DmaCopy32Defvars(3, gPlttBufferUnfaded, eContestTempSave.unk18204, 0x400);
    if (!Contest_IsMonsTurnDisabled(gContestPlayerMonIndex))
        StringCopy(gDisplayedStringBattle, gText_Contest_WhichMoveWillBePlayed);
    else
        StringCopy(gDisplayedStringBattle, gText_Contest_ButItCantParticipate);
    InsertStringDigit(gDisplayedStringBattle, sContest.turnNumber + 1);
    ContestClearGeneralTextWindow();
    StringExpandPlaceholders(gStringVar4, gDisplayedStringBattle);
    Text_InitWindow8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
    gTasks[taskId].func = sub_80ABC3C;
}

void sub_80ABC3C(u8 taskId)
{
    if (Text_UpdateWindowInContest(&gMenuWindow) == 1)
        gTasks[taskId].func = sub_80ABC70;
}

void sub_80ABC70(u8 taskId)
{
    if ((gMain.newKeys & A_BUTTON) || (gMain.newKeys == B_BUTTON))
    {
        PlaySE(SE_SELECT);
        if (!Contest_IsMonsTurnDisabled(gContestPlayerMonIndex))
        {
            sub_80AFFE0(TRUE);
            gTasks[taskId].func = sub_80ABCDC;
        }
        else
        {
            gTasks[taskId].func = sub_80AC0C8;
        }
    }
}

// Print the move list
void sub_80ABCDC(u8 taskId)
{
    u8 i;
    u8 sp8[32];

    gBattle_BG0_Y = 0xA0;
    gBattle_BG2_Y = 0xA0;
    Text_FillWindowRectDefPalette(
      &gWindowTemplate_Contest_MoveDescription,
      0,
      gUnknown_083CA340[0][0],
      gUnknown_083CA340[0][1],
      gUnknown_083CA340[0][2],
      gUnknown_083CA340[0][3]);

    for (i = 0; i < 4; i++)
    {
        u16 move = gContestMons[gContestPlayerMonIndex].moves[i];
        u8 *r5 = sp8;

        if (sContestantStatus[gContestPlayerMonIndex].prevMove != MOVE_NONE
         &&
            IsContestantAllowedToCombo(gContestPlayerMonIndex)
         && AreMovesContestCombo(sContestantStatus[gContestPlayerMonIndex].prevMove, move) != 0
         && sContestantStatus[gContestPlayerMonIndex].hasJudgesAttention)
        {
            r5 = StringCopy(sp8, gUnknownText_UnknownFormatting2);
        }
        else if (move != 0
         && sContestantStatus[gContestPlayerMonIndex].prevMove == move
         && gContestMoves[move].effect != CONTEST_EFFECT_REPETITION_NOT_BORING)
        {
            // Gray the text because it is a repeated move
            r5 = StringCopy(sp8, gUnknownText_UnknownFormatting3);
        }
        r5 = StringCopy(r5, gMoveNames[move]);

        Text_InitWindow8002E4C(
          &gWindowTemplate_Contest_MoveDescription,
          sp8,
          776 + i * 20,
          gUnknown_083CA340[i][0] * 8 + 4,
          gUnknown_083CA340[i][1] * 8,
          1);
        Text_PrintWindow8002F44(&gWindowTemplate_Contest_MoveDescription);
    }

    MenuCursor_Create814A5C0(0, 0xFFFF, 12, 0x2D9F, 72);
    sub_80AC0AC(sContest.playerMoveChoice);
    PrintContestMoveDescription(gContestMons[gContestPlayerMonIndex].moves[sContest.playerMoveChoice]);
    gTasks[taskId].func = sub_80ABEA0;
}

void debug_sub_80B9EBC(u8);

// Handle move selection input
void sub_80ABEA0(u8 taskId)
{
    u8 numMoves = 0;
    s32 i;

    for (i = 0; i < 4; i++)
    {
        if (gContestMons[gContestPlayerMonIndex].moves[i] != MOVE_NONE)
            numMoves++;
    }

    if (gMain.newKeys & A_BUTTON)
    {
        DestroyMenuCursor();
        PlaySE(SE_SELECT);
        gTasks[taskId].func = sub_80AC0C8;
    }
    else
    {
        switch (gMain.newAndRepeatedKeys)
        {
        case B_BUTTON:
            sub_814A904();
            PlaySE(SE_SELECT);
            sub_80AFFE0(FALSE);
            Text_FillWindowRectDefPalette(
              &gWindowTemplate_Contest_MoveDescription,
              0,
              gUnknown_083CA340[0][0],
              gUnknown_083CA340[0][1],
              gUnknown_083CA340[0][2],
              gUnknown_083CA340[0][3]);
            if (!Contest_IsMonsTurnDisabled(gContestPlayerMonIndex))
                StringCopy(gDisplayedStringBattle, gText_Contest_WhichMoveWillBePlayed);
            else
                StringCopy(gDisplayedStringBattle, gText_Contest_ButItCantParticipate);
            InsertStringDigit(gDisplayedStringBattle, sContest.turnNumber + 1);
            ContestClearGeneralTextWindow();
            StringExpandPlaceholders(gStringVar4, gDisplayedStringBattle);
            Text_InitWindowAndPrintText(&gMenuWindow, gStringVar4, 776, 1, 15);
            gBattle_BG0_Y = 0;
            gBattle_BG2_Y = 0;
            gTasks[taskId].func = sub_80ABC70;
            break;
        case DPAD_LEFT:
        case DPAD_RIGHT:
            break;
        case DPAD_UP:
            nullsub_17(sContest.playerMoveChoice);
            if (sContest.playerMoveChoice == 0)
                sContest.playerMoveChoice = numMoves - 1;
            else
                sContest.playerMoveChoice--;
            sub_80AC0AC(sContest.playerMoveChoice);
            sub_80AED58();
            PrintContestMoveDescription(gContestMons[gContestPlayerMonIndex].moves[sContest.playerMoveChoice]);
            if (numMoves > 1)
                PlaySE(SE_SELECT);
            break;
        case DPAD_DOWN:
            nullsub_17(sContest.playerMoveChoice);
            if (sContest.playerMoveChoice == numMoves - 1)
                sContest.playerMoveChoice = 0;
            else
                sContest.playerMoveChoice++;
            sub_80AC0AC(sContest.playerMoveChoice);
            sub_80AED58();
            PrintContestMoveDescription(gContestMons[gContestPlayerMonIndex].moves[sContest.playerMoveChoice]);
            if (numMoves > 1)
                PlaySE(SE_SELECT);
            break;
#if DEBUG
	case START_BUTTON:
	    if (gUnknown_020297ED == 1 && !(gIsLinkContest & 1))
	    {
		gTasks[taskId].data[0] = 0;
		gTasks[taskId].data[1] = gContestMons[gContestPlayerMonIndex].moves[0];
		gTasks[taskId].func = debug_sub_80B9EBC;
	    }
	    break;
#endif
        }
    }
}

#if DEBUG

void debug_sub_80BA054(u8);

void debug_sub_80B9EBC(u8 taskId)
{
    u8 text[100];

    switch (gTasks[taskId].data[0])
    {
    case 0:
	Text_FillWindowRectDefPalette(
	  &gWindowTemplate_Contest_MoveDescription,
	  0,
	  gUnknown_083CA340[0][0],
	  gUnknown_083CA340[0][1],
	  gUnknown_083CA340[0][2],
	  gUnknown_083CA340[0][3]);
	Text_InitWindowAndPrintText(
	  &gWindowTemplate_Contest_MoveDescription,
	  gMoveNames[gTasks[taskId].data[1]],
	  776,
	  gUnknown_083CA340[0][0],
	  gUnknown_083CA340[0][1]);
	ConvertIntToDecimalStringN(text, gTasks[taskId].data[1], 2, 3);
	Text_InitWindowAndPrintText(
	  &gWindowTemplate_Contest_MoveDescription,
	  text,
	  796,
	  gUnknown_083CA340[1][0],
	  gUnknown_083CA340[1][1]);
	sub_80AED58();
	PrintContestMoveDescription(gTasks[taskId].data[1]);
	gTasks[taskId].data[0]++;
	break;
    case 1:
	switch (gMain.newAndRepeatedKeys)
	{
	case 0x20:
	    gTasks[taskId].data[1] -= 1;
	    if (gTasks[taskId].data[1] < 1)
		gTasks[taskId].data[1] = 354;
	    gTasks[taskId].data[0]--;
	    break;
	case 0x200:
	    gTasks[taskId].data[1] -= 10;
	    if (gTasks[taskId].data[1] < 1)
		gTasks[taskId].data[1] = 354;
	    gTasks[taskId].data[0]--;
	    break;
	case 0x10:
	    gTasks[taskId].data[1] += 1;
	    if (gTasks[taskId].data[1] > 354)
		gTasks[taskId].data[1] = 1;
	    gTasks[taskId].data[0]--;
	    break;
	case 0x100:
	    gTasks[taskId].data[1] += 10;
	    if (gTasks[taskId].data[1] > 354)
		gTasks[taskId].data[1] = 1;
	    gTasks[taskId].data[0]--;
	    break;
	case 4:
	case 8:
	    gBattle_BG0_Y = 0;
	    gBattle_BG2_Y = 0;
	    SlideApplauseMeterOut();
	    gTasks[taskId].data[0] = 0;
	    gTasks[taskId].func = debug_sub_80BA054;
	    break;
	case 2:
	    gBattle_BG0_Y = DISPLAY_HEIGHT;
	    gBattle_BG2_Y = DISPLAY_HEIGHT;
	    gContestMons[gContestPlayerMonIndex].moves[0] = gTasks[taskId].data[1];
	    gTasks[taskId].data[0] = 0;
	    gTasks[taskId].data[1] = 0;
	    gTasks[taskId].data[2] = 0;
	    gTasks[taskId].data[3] = 0;
	    gTasks[taskId].func = sub_80ABCDC;
	    break;
	}
	break;
    }
}

void debug_sub_80BA054(u8 taskId)
{
    s32 i;
    u8 r6;

    switch (gTasks[taskId].data[0])
    {
    case 0:
	for (i = 0; i < 4; i++)
	    gBattleMonForms[i] = 0;
	memset(&gContestResources__moveAnim, 0, sizeof(gContestResources__moveAnim));
	sub_80B28F0(gContestPlayerMonIndex);
	r6 = CreateContestantSprite(
	  gContestMons[gContestPlayerMonIndex].species, 
	  gContestMons[gContestPlayerMonIndex].otId, 
	  gContestMons[gContestPlayerMonIndex].personality);
	gSprites[r6].pos2.x = 120;
	gSprites[r6].callback = sub_80AD8FC;
	gTasks[taskId].data[2] = r6;
	gBattlerSpriteIds[gBattlerAttacker] = r6;
	gTasks[taskId].data[3] = 0;
	gTasks[taskId].data[0]++;
	sContest.moveAnimTurnCount = 0;
	break;
    case 1:
	r6 = gTasks[taskId].data[2];
	if (gSprites[r6].callback == SpriteCallbackDummy)
	{
	    sContestantStatus[gContestPlayerMonIndex].currMove = gTasks[taskId].data[1];
	    sub_80B2790(gContestPlayerMonIndex);
	    sub_80B28F0(gContestPlayerMonIndex);
	    SelectContestMoveBankTarget(gTasks[taskId].data[1]);
	    DoMoveAnim(gTasks[taskId].data[1]);
	    gTasks[taskId].data[3] = 0;
	    gTasks[taskId].data[0]++;
	}
	break;
    case 2:
	gAnimScriptCallback();
	if (!gAnimScriptActive)
	{
	    sub_80B28CC(gContestPlayerMonIndex);
	    if (sContest.moveAnimTurnCount != 0)
	    {
		gTasks[taskId].data[10] = 0;
		gTasks[taskId].data[0] = 20;
	    }
	    else
	    {
		gTasks[taskId].data[0]++;
	    }
	}
	break;
    case 3:
	gTasks[taskId].data[3]++;
	if (gTasks[taskId].data[3] == 21)
	{
	    r6 = gTasks[taskId].data[2];
	    gSprites[r6].callback = sub_80AD92C;
	    SlideApplauseMeterIn();
	    gTasks[taskId].data[3] = 0;
	    gTasks[taskId].data[0]++;
	}
	break;
    case 4:
	r6 = gTasks[taskId].data[2];
	if (gSprites[r6].invisible)
	{
	    FreeSpriteOamMatrix(&gSprites[r6]);
	    DestroySprite(&gSprites[r6]);
	    gTasks[taskId].data[0] = 0;
	    gTasks[taskId].func = debug_sub_80B9EBC;
	    gBattle_BG0_Y = DISPLAY_HEIGHT;
	    gBattle_BG2_Y = DISPLAY_HEIGHT;
	}
	break;
    case 20:
	if (gTasks[taskId].data[10]++ > 30)
	{
	    gTasks[taskId].data[10] = 0;
	    gTasks[taskId].data[0] = 1;
	}
	break;
    }
}

#endif

void sub_80AC0AC(s8 a)
{
    MenuCursor_SetPos814A880(4, 88 + a * 16);
}

void nullsub_17(s8 a)
{
}

void sub_80AC0C8(u8 taskId)
{
    if (gIsLinkContest & 1)
    {
        u16 var = GetChosenMove(gContestPlayerMonIndex);
        u8 taskId2;

        sContestantStatus[gContestPlayerMonIndex].currMove = var;
        taskId2 = CreateTask(sub_80C8A38, 0);
        SetTaskFuncWithFollowupFunc(taskId2, sub_80C8A38, sub_80AC15C);
        gTasks[taskId].func = nullsub_89;
        ContestPrintLinkStandby();
        sub_80AFFE0(FALSE);
    }
    else
    {
        GetAllChosenMoves();
        gTasks[taskId].func = sub_80AC188;
    }
}

void sub_80AC15C(u8 taskId)
{
    DestroyTask(taskId);
    gTasks[sContest.mainTaskId].func = sub_80AC188;
}

void sub_80AC188(u8 taskId)
{
    ContestClearGeneralTextWindow();
    gBattle_BG0_Y = 0;
    gBattle_BG2_Y = 0;
    sub_80AFFE0(FALSE);
    DmaCopy32Defvars(3, gPlttBufferFaded, eContestTempSave.unk18604, 0x400);
    LoadPalette(eContestTempSave.unk18204, 0, 0x400);
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = 0;
    gTasks[taskId].func = sub_80AC204;
}

void sub_80AC204(u8 taskId)
{
    if (++gTasks[taskId].data[0] > 2)
    {
        gTasks[taskId].data[0] = 0;
        if (++gTasks[taskId].data[1] == 2)
        {
            SlideApplauseMeterOut();
            AnimateSliderHearts(1);
            gTasks[taskId].func = sub_80AC250;
        }
    }
}

void sub_80AC250(u8 taskId)
{
    if (!sContest.applauseMeterIsMoving && !sContest.sliderHeartsAnimating)
        gTasks[taskId].func = sub_80AC284;
}

void sub_80AC284(u8 taskId)
{
    if (++gTasks[taskId].data[0] > 19)
    {
        sContest.unk19214 = 0;
        sContest.unk1921C = gRngValue;
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = sub_80AC2CC;
    }
}

void sub_80AC2CC(u8 taskId)
{
    u8 spriteId;
    s32 i;
    u8 r7 = sContest.unk19215;
    s8 r4;

    switch (gTasks[taskId].data[0])
    {
    case 0:
        ContestDebugDoPrint();
        for (i = 0; sContest.unk19214 != eContestAppealResults.turnOrder[i]; i++)
            ;
        sContest.unk19215 = i;
        r7 = sContest.unk19215;
        if (gIsLinkContest & 1)
        {
            u8 taskId2;

            sContest.waitForLink = 1;
            if (IsPlayerLinkLeader())
                CalculateAppealMoveImpact(sContest.unk19215);
            taskId2 = CreateTask(Task_LinkContest_CommunicateAppealsState, 0);
            SetTaskFuncWithFollowupFunc(
                taskId2, Task_LinkContest_CommunicateAppealsState, Task_EndWaitForLink);
            ContestPrintLinkStandby();
            gTasks[taskId].data[0] = 1;
        }
        else
        {
            CalculateAppealMoveImpact(sContest.unk19215);
            gTasks[taskId].data[0] = 2;
        }
        return;
    case 1:
        if (!sContest.waitForLink)
            gTasks[taskId].data[0] = 2;
        return;
    case 2:
        if (sContestantStatus[r7].numTurnsSkipped != 0
         || sContestantStatus[r7].noMoreTurns)
        {
            gTasks[taskId].data[0] = 31;
        }
        else
        {
            ContestClearGeneralTextWindow();
            Unused_EndBlinkingState(r7, 0);
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 3;
        }
        return;
    case 3:
        for (i = 0; i < 4; i++)
            gBattleMonForms[i] = 0;
        memset(&gContestResources__moveAnim, 0, sizeof(gContestResources__moveAnim));
        SetMoveAnimAttackerData(sContest.unk19215);
        spriteId = CreateContestantSprite(
          gContestMons[sContest.unk19215].species,
          gContestMons[sContest.unk19215].otId,
          gContestMons[sContest.unk19215].personality);
        gSprites[spriteId].pos2.x = 120;
        gSprites[spriteId].callback = sub_80AD8FC;
        gTasks[taskId].data[2] = spriteId;
        gBattlerSpriteIds[gBattlerAttacker] = spriteId;
        BlinkContestantBox(CreateContestantBoxBlinkSprites(sContest.unk19215), FALSE);
        gTasks[taskId].data[0] = 4;
        return;
    case 4:
        spriteId = gTasks[taskId].data[2];
        if (gSprites[spriteId].callback == SpriteCallbackDummy)
        {
            if (!eContestGfxState[r7].boxBlinking)
                gTasks[taskId].data[0] = 5;
        }
        return;
    case 5:
        if (sContestantStatus[r7].nervous)
        {
            gTasks[taskId].data[0] = 33;
        }
        else
        {
            ContestClearGeneralTextWindow();
            StringCopy(gStringVar1, gContestMons[r7].nickname);
            if (sContestantStatus[r7].currMove < NUM_MOVES)
                StringCopy(gStringVar2, gMoveNames[sContestantStatus[r7].currMove]);
            else
                StringCopy(gStringVar2, gUnknown_083CC330[sContestantStatus[r7].moveCategory]);
            StringExpandPlaceholders(gStringVar4, gUnknown_083CAFD7);
            Text_InitWindow8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
            gTasks[taskId].data[0] = 6;
        }
        return;
    case 6:
        if (Text_UpdateWindowInContest(&gMenuWindow) != 0)
        {
            sContest.moveAnimTurnCount = 0;
            gTasks[taskId].data[0] = 7;
        }
        return;
    case 7:
        {
            u16 move = SanitizeMove(sContestantStatus[sContest.unk19215].currMove);

            SetMoveSpecificAnimData(sContest.unk19215);
            SetMoveAnimAttackerData(sContest.unk19215);
            SelectContestMoveBankTarget(move);
            DoMoveAnim(move);
            gTasks[taskId].data[0] = 8;
        }
        return;
    case 8:
        gAnimScriptCallback();
        if (!gAnimScriptActive)
        {
            ClearMoveAnimData(r7);
            if (sContest.moveAnimTurnCount != 0)
            {
                gTasks[taskId].data[10] = 0;
                gTasks[taskId].data[0] = 9;
            }
            else
            {
                if (!sContestantStatus[r7].hasJudgesAttention)
                    sub_80B03A8(r7);
                DrawUnnervedSymbols();
                gTasks[taskId].data[0] = 23;
            }
        }
        return;
    case 9:
        if (gTasks[taskId].data[10]++ > 30)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 7;
        }
        return;
    case 23:
        gTasks[taskId].data[1] = 0;
        if (sContestantStatus[r7].effectStringId != CONTEST_STRING_NONE)
        {
            PrintAppealMoveResultText(r7, sContestantStatus[r7].effectStringId);
            sContestantStatus[r7].effectStringId = CONTEST_STRING_NONE;
            gTasks[taskId].data[0] = 24;
        }
        else
        {
            if (sContestantStatus[r7].effectStringId2 != CONTEST_STRING_NONE)
            {
                for (i = 0; i < 4; i++)
                {
                    if (i != r7 && sContestantStatus[i].effectStringId != CONTEST_STRING_NONE)
                        break;
                }
                if (i == 4)
                {
                    PrintAppealMoveResultText(r7, sContestantStatus[r7].effectStringId2);
                    sContestantStatus[r7].effectStringId2 = CONTEST_STRING_NONE;
                    gTasks[taskId].data[0] = 24;
                }
                else
                {
                    gTasks[taskId].data[0] = 48;
                }
            }
            else
            {
                gTasks[taskId].data[0] = 48;
            }
        }
        return;
    case 24:
        if (Text_UpdateWindowInContest(&gMenuWindow) != 0)
            gTasks[taskId].data[0] = 23;
        return;
    case 48:
        if (sContestantStatus[r7].turnOrderModAction == 1)
        {
            DoJudgeSpeechBubble(5);
        }
        else if (sContestantStatus[r7].turnOrderModAction == 2)
        {
            DoJudgeSpeechBubble(6);
        }
        else if (sContestantStatus[r7].turnOrderModAction == 3)
        {
            DoJudgeSpeechBubble(7);
        }
        else
        {
            gTasks[taskId].data[0] = 47;
            return;
        }
        gTasks[taskId].data[0] = 49;
        return;
    case 49:
        if (!sContest.waitForJudgeSpeechBubble)
            gTasks[taskId].data[0] = 47;
        return;
    case 47:
        ShowHideNextTurnGfx(TRUE);
        gTasks[taskId].data[0] = 12;
        return;
    case 12:
        UpdateAppealHearts(0, sContestantStatus[r7].appeal, r7);
        gTasks[taskId].data[0] = 13;
        return;
    case 13:
        if (!eContestGfxState[sContest.unk19215].updatingAppealHearts)
            gTasks[taskId].data[0] = 35;
        return;
    case 35:
        if (sContestantStatus[r7].conditionMod == 1)
            DoJudgeSpeechBubble(8);
        gTasks[taskId].data[0] = 36;
        return;
    case 36:
        if (!sContest.waitForJudgeSpeechBubble)
            gTasks[taskId].data[0] = 37;
        return;
    case 37:
        if (UpdateConditionStars(r7, 1))
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 38;
        }
        else
        {
            gTasks[taskId].data[0] = 50;
        }
        return;
    case 38:
        if (++gTasks[taskId].data[10] > 20)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 50;
        }
        return;
    case 50:
        if (DrawStatusSymbol(r7))
            PlaySE(SE_CONTEST_ICON_CHANGE);
        gTasks[taskId].data[0] = 25;
        return;
    case 25:
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].data[0] = 26;
        return;
    case 26:
        {
            s32 r2 = 0;

            r4 = 0;
            for (i = gTasks[taskId].data[1]; i < 4; i++)
            {
                r4 = 0;
                for (r2 = 0; r2 < 4; r2++)
                {
                    if (r2 != r7 && gContestantTurnOrder[r2] == i
                     && sContestantStatus[r2].effectStringId != CONTEST_STRING_NONE)
                    {
                        r4 = 1;
                        break;
                    }
                }
                if (r4 != 0)
                    break;
            }
            if (r4)
            {
                gTasks[taskId].data[1] = gContestantTurnOrder[r2];
                PrintAppealMoveResultText(r2, sContestantStatus[r2].effectStringId);
                sContestantStatus[r2].effectStringId = CONTEST_STRING_NONE;
                gTasks[taskId].data[0] = 27;
            }
            else
            {
                gTasks[taskId].data[1] = 0;
                gTasks[taskId].data[10] = 0;
                gTasks[taskId].data[0] = 51;
                DrawStatusSymbols();
            }
        }
        return;
    case 27:
        if (Text_UpdateWindowInContest(&gMenuWindow) != 0)
            gTasks[taskId].data[0] = 28;
        return;
    case 28:
        for (i = 0; gTasks[taskId].data[1] != gContestantTurnOrder[i]; i++)
            ;
        UpdateAppealHearts(
            sContestantStatus[i].appeal + sContestantStatus[i].jam, -sContestantStatus[i].jam, i);
        gTasks[taskId].data[0] = 29;
        return;
    case 29:
        for (i = 0; gTasks[taskId].data[1] != gContestantTurnOrder[i]; i++)
            ;
        if (!eContestGfxState[i].updatingAppealHearts)
            gTasks[taskId].data[0] = 39;
        return;
    case 39:
        for (i = 0; gTasks[taskId].data[1] != gContestantTurnOrder[i]; i++)
            ;
        if (UpdateConditionStars(i, 1))
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 40;
        }
        else
        {
            gTasks[taskId].data[0] = 30;
        }
        return;
    case 40:
        if (++gTasks[taskId].data[10] > 20)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 30;
        }
        return;
    case 30:
        for (i = 0; i < 4; i++)
        {
            if (gContestantTurnOrder[i] == gTasks[taskId].data[1])
                break;
        }
        if (DrawStatusSymbol(i))
            PlaySE(SE_CONTEST_ICON_CHANGE);
        else
            PlaySE(SE_CONTEST_ICON_CLEAR);
        if (sContestantStatus[i].judgesAttentionWasRemoved)
        {
            sub_80B03A8(i);
            sContestantStatus[i].judgesAttentionWasRemoved = 0;
        }
        gTasks[taskId].data[1]++;
        gTasks[taskId].data[0] = 26;
        return;
    case 51:
        if (gTasks[taskId].data[10]++ > 9)
        {
            gTasks[taskId].data[10] = 0;
            if (sContestantStatus[r7].numTurnsSkipped != 0
             || sContestantStatus[r7].turnSkipped)
            {
                ContestClearGeneralTextWindow();
                StringCopy(gStringVar1, gContestMons[r7].nickname);
                StringExpandPlaceholders(gStringVar4, ContestString_CantAppealNextTurn);
                Text_InitWindow8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
            }
            gTasks[taskId].data[0] = 52;
        }
        return;
    case 52:
        if (Text_UpdateWindowInContest(&gMenuWindow) != 0)
        {
            if (!sContestantStatus[r7].usedComboMove)
                gTasks[taskId].data[0] = 17;
            else
                gTasks[taskId].data[0] = 14;
        }
        return;
    case 14:
        r4 = sContestantStatus[r7].completedCombo;
        if (sContestantStatus[r7].completedCombo != 0)
        {
            ContestClearGeneralTextWindow();
            if (r4 == 1)
                Text_InitWindow8002EB0(&gMenuWindow, ContestString_WentOverWell, 776, 1, 15);
            else if (r4 == 2)
                Text_InitWindow8002EB0(&gMenuWindow, ContestString_WentOverVeryWell, 776, 1, 15);
            else
                Text_InitWindow8002EB0(&gMenuWindow, ContestString_AppealComboExcellently, 776, 1, 15);
            DoJudgeSpeechBubble(3);
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 45;
        }
        else
        {
            ContestClearGeneralTextWindow();
            StringCopy(gStringVar1, gContestMons[r7].nickname);
            StringExpandPlaceholders(gStringVar4, ContestString_JudgeExpectantly2);
            Text_InitWindow8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
            DoJudgeSpeechBubble(2);
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 45;
        }
        return;
    case 45:
        if (!sContest.waitForJudgeSpeechBubble)
        {
            StartStopFlashJudgeAttentionEye(sContest.unk19215);
            gTasks[taskId].data[0] = 15;
        }
        return;
    case 15:
        if (Text_UpdateWindowInContest(&gMenuWindow) != 0)
        {
            if (++gTasks[taskId].data[10] > 50)
            {
                if (!sContestantStatus[r7].hasJudgesAttention)
                {
                    UpdateAppealHearts(
                        sContestantStatus[r7].appeal, sContestantStatus[r7].comboAppealBonus, r7);
                    sContestantStatus[r7].appeal += sContestantStatus[r7].comboAppealBonus;
                }
                gTasks[taskId].data[0] = 16;
            }
        }
        return;
    case 16:
        if (!eContestGfxState[r7].updatingAppealHearts)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 17;
        }
        return;
    case 17:
        if (sContestantStatus[r7].disappointedRepeat)
        {
            ContestClearGeneralTextWindow();
            StringCopy(gStringVar1, gContestMons[r7].nickname);
            StringExpandPlaceholders(gStringVar4, ContestString_DissapointedRepeat);
            Text_InitWindow8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
            gTasks[taskId].data[10] = 0;
            DoJudgeSpeechBubble(0);
            gTasks[taskId].data[0] = 46;
        }
        else
        {
            gTasks[taskId].data[0] = 41;
        }
        return;
    case 46:
        if (!sContest.waitForJudgeSpeechBubble)
            gTasks[taskId].data[0] = 19;
        return;
    case 19:
        if (Text_UpdateWindowInContest(&gMenuWindow) != 0)
        {
            UpdateAppealHearts(sContestantStatus[r7].appeal, -sContestantStatus[r7].unk18, r7);
            sContestantStatus[r7].appeal -= sContestantStatus[r7].unk18;
            gTasks[taskId].data[0] = 18;
        }
        return;
    case 18:
        ContestDebugDoPrint();
        if (!eContestGfxState[r7].updatingAppealHearts)
        {
            gTasks[taskId].data[10] = 0;
            ContestClearGeneralTextWindow();
            gTasks[taskId].data[0] = 41;
        }
        return;
    case 41:
        if (eContestExcitement.excitementFrozen && r7 != eContestExcitement.excitementFreezer)
        {
            gTasks[taskId].data[0] = 57;
        }
        else
        {
            r4 = eContestExcitement.moveExcitement;
            if (sContestantStatus[r7].overrideCategoryExcitementMod)
            {
                r4 = 1;
                StringCopy(gStringVar3, gMoveNames[sContestantStatus[r7].currMove]);
            }
            else
            {
                StringCopy(gStringVar3, gContestCategoryStrings[gContestMoves[sContestantStatus[r7].currMove].contestCategory]);
            }
            if (r4 > 0)
            {
                if (sContestantStatus[r7].disappointedRepeat)
                    r4 = 0;
            }
            ContestClearGeneralTextWindow();
            StringCopy(gStringVar1, gContestMons[r7].nickname);
            sContest.applauseLevel += r4;
            if (sContest.applauseLevel < 0)
                sContest.applauseLevel = 0;
            if (r4 == 0)
            {
                gTasks[taskId].data[0] = 55;
            }
            else
            {
                if (r4 < 0)
                    StringExpandPlaceholders(gStringVar4, ContestString_DidntGoWell);
                else if (r4 > 0 && sContest.applauseLevel <= 4)
                    StringExpandPlaceholders(gStringVar4, ContestString_WentOverGreat);
                else
                    StringExpandPlaceholders(gStringVar4, ContestString_GotCrowdGoing);
                Text_InitWindow8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
                gTasks[taskId].data[10] = 0;
                gTasks[taskId].data[11] = 0;
                if (r4 < 0)
                    gTasks[taskId].data[0] = 53;
                else
                    gTasks[taskId].data[0] = 54;
            }
        }
        return;
    case 53:
        switch (gTasks[taskId].data[10])
        {
        case 0:
            BlendAudienceBackground(-1, 1);
            PlayFanfare(MUS_TOO_BAD);
            gTasks[taskId].data[10]++;
            break;
        case 1:
            if (!sContest.waitForAudienceBlend && Text_UpdateWindowInContest(&gMenuWindow) != 0)
            {
                ShowAndUpdateApplauseMeter(-1);
                gTasks[taskId].data[10]++;
            }
            break;
        case 2:
            if (!sContest.isShowingApplauseMeter)
            {
                if (gTasks[taskId].data[11]++ > 29)
                {
                    gTasks[taskId].data[11] = 0;
                    BlendAudienceBackground(-1, -1);
                    gTasks[taskId].data[10]++;
                }
            }
            break;
        case 3:
            if (!gPaletteFade.active)
            {
                gTasks[taskId].data[10] = 0;
                gTasks[taskId].data[11] = 0;
                gTasks[taskId].data[0] = 43;
            }
            break;
        }
        return;
    case 54:
        switch (gTasks[taskId].data[10])
        {
        case 0:
            if (Text_UpdateWindowInContest(&gMenuWindow) != 0)
            {
                BlendAudienceBackground(1, 1);
                gTasks[taskId].data[10]++;
            }
            break;
        case 1:
            if (!sContest.waitForAudienceBlend)
            {
                AnimateAudience();
                PlaySE(SE_M_ENCORE2);
                ShowAndUpdateApplauseMeter(1);
                gTasks[taskId].data[10]++;
            }
            break;
        case 2:
            if (!sContest.isShowingApplauseMeter)
            {
                if (gTasks[taskId].data[11]++ > 29)
                {
                    gTasks[taskId].data[11] = 0;
                    UpdateAppealHearts(
                        sContestantStatus[r7].appeal, eContestExcitement.excitementAppealBonus, r7);
                    sContestantStatus[r7].appeal += eContestExcitement.excitementAppealBonus;
                    gTasks[taskId].data[10]++;
                }
            }
            break;
        case 3:
            if (!eContestGfxState[r7].updatingAppealHearts)
            {
                if (!sContest.animatingAudience)
                {
                    BlendAudienceBackground(1, -1);
                    gTasks[taskId].data[10]++;
                }
            }
            break;
        case 4:
            if (!gPaletteFade.active)
            {
                gTasks[taskId].data[10] = 0;
                gTasks[taskId].data[11] = 0;
                gTasks[taskId].data[0] = 43;
            }
            break;
        }
        return;
    case 43:
        if (!eContestGfxState[r7].updatingAppealHearts)
        {
            ContestClearGeneralTextWindow();
            gTasks[taskId].data[0] = 55;
        }
        return;
    case 57:
        ContestClearGeneralTextWindow();
        StringCopy(gStringVar3, gContestMons[eContestExcitement.excitementFreezer].nickname);
        StringCopy(gStringVar1, gContestMons[r7].nickname);
        StringCopy(gStringVar2, gMoveNames[sContestantStatus[r7].currMove]);
        StringExpandPlaceholders(gStringVar4, ContestString_CrowdWatches);
        Text_InitWindow8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
        gTasks[taskId].data[0] = 58;
        return;
    case 58:
        if (Text_UpdateWindowInContest(&gMenuWindow) != 0)
        {
            ContestClearGeneralTextWindow();
            StringExpandPlaceholders(gStringVar4, ContestString_Ignored2);
            Text_InitWindow8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
            gTasks[taskId].data[0] = 59;
        }
        return;
    case 59:
        if (Text_UpdateWindowInContest(&gMenuWindow) != 0)
        {
            ContestClearGeneralTextWindow();
            gTasks[taskId].data[0] = 55;
        }
        return;
    case 33:
        if (sContestantStatus[r7].hasJudgesAttention)
            sContestantStatus[r7].hasJudgesAttention = 0;
        StartStopFlashJudgeAttentionEye(r7);
        StringCopy(gStringVar1, gContestMons[r7].nickname);
        StringCopy(gStringVar2, gMoveNames[sContestantStatus[r7].currMove]);
        StringExpandPlaceholders(gStringVar4, gUnknown_083CBF60);
        Text_InitWindow8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
        gTasks[taskId].data[0] = 34;
        return;
    case 34:
        if (Text_UpdateWindowInContest(&gMenuWindow) != 0)
            gTasks[taskId].data[0] = 55;
        return;
    case 55:
        SlideApplauseMeterOut();
        gTasks[taskId].data[0] = 56;
        return;
    case 56:
        if (!sContest.applauseMeterIsMoving)
        {
            if (sContest.applauseLevel > 4)
            {
                sContest.applauseLevel = 0;
                UpdateApplauseMeter();
            }
            gTasks[taskId].data[0] = 10;
        }
        return;
    case 10:
        spriteId = gTasks[taskId].data[2];
        gSprites[spriteId].callback = sub_80AD92C;
        gTasks[taskId].data[0] = 11;
        return;
    case 11:
        spriteId = gTasks[taskId].data[2];
        if (gSprites[spriteId].invisible)
        {
            FreeSpriteOamMatrix(&gSprites[spriteId]);
            DestroySprite(&gSprites[spriteId]);
            gTasks[taskId].data[0] = 20;
        }
        return;
    case 20:
        for (i = 0; i < 4; i++)
            Unused_EndBlinkingState(i, 1);
        gTasks[taskId].data[10] = 0;
        gTasks[taskId].data[0] = 21;
        return;
    case 31:
        ContestClearGeneralTextWindow();
        StringCopy(gStringVar1, gContestMons[r7].nickname);
        StringExpandPlaceholders(gStringVar4, gUnknown_083CB00D);
        Text_InitWindow8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
        gTasks[taskId].data[0] = 32;
        return;
    case 32:
        if (Text_UpdateWindowInContest(&gMenuWindow) != 0)
            gTasks[taskId].data[0] = 21;
        return;
    case 21:
        if (++gTasks[taskId].data[10] > 29)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 22;
        }
        return;
    case 22:
        if (++sContest.unk19214 == 4)
        {
            gTasks[taskId].data[0] = 0;
            gTasks[taskId].data[1] = 0;
            gTasks[taskId].data[2] = 0;
            gTasks[taskId].func = sub_80AD960;
        }
        else
        {
            gTasks[taskId].data[0] = 0;
        }
        nullsub_18(0);
        return;
    }
}

void Task_EndWaitForLink(u8 taskId)
{
    sContest.waitForLink = 0;
    DestroyTask(taskId);
}

void sub_80AD8FC(struct Sprite *sprite)
{
    if (sprite->pos2.x != 0)
    {
        sprite->pos2.x -= 2;
    }
    else
    {
        if (++sprite->data[0] == 31)
        {
            sprite->data[0] = 0;
            sprite->callback = SpriteCallbackDummy;
        }
    }
}

void sub_80AD92C(struct Sprite *sprite)
{
    sprite->pos2.x -= 6;
    if (sprite->pos1.x + sprite->pos2.x < -32)
    {
        sprite->callback = SpriteCallbackDummy;
        sprite->invisible = TRUE;
    }
}

void sub_80AD960(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
    case 0:
        if (gIsLinkContest & 1)
        {
            u8 taskId2;

            sContest.waitForLink = 1;
            if (IsPlayerLinkLeader())
            {
                RankContestants();
                SetAttentionLevels();
            }
            taskId2 = CreateTask(Task_LinkContest_CommunicateAppealsState, 0);
            SetTaskFuncWithFollowupFunc(
                taskId2, Task_LinkContest_CommunicateAppealsState, Task_EndWaitForLink);
            ContestPrintLinkStandby();
            gTasks[taskId].data[0] = 1;
        }
        else
        {
            RankContestants();
            SetAttentionLevels();
            gTasks[taskId].data[0] = 2;
        }
        break;
    case 1:
        if (!sContest.waitForLink)
            gTasks[taskId].data[0] = 2;
        break;
    case 2:
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = sub_80ADA1C;
        break;
    }
}

void sub_80ADA1C(u8 taskId)
{
    ShowHideNextTurnGfx(FALSE);
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = 0;
    gTasks[taskId].func = sub_80ADA4C;
}

void sub_80ADA4C(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
    case 0:
        if (++gTasks[taskId].data[1] > 20)
        {
            AnimateSliderHearts(2);
            gTasks[taskId].data[1] = 0;
            gTasks[taskId].data[0]++;
        }
        break;
    case 1:
        if (!sContest.sliderHeartsAnimating)
        {
            if (++gTasks[taskId].data[1] > 20)
            {
                gTasks[taskId].data[1] = 0;
                gTasks[taskId].data[0]++;
            }
        }
        break;
    case 2:
        sub_80AFF10();
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].func = sub_80ADAD8;
        break;
    }
}

void sub_80ADAD8(u8 taskId)
{
    if (sub_80AFF28())
        gTasks[taskId].func = sub_80ADB04;
}

void sub_80ADB04(u8 taskId)
{
    DmaCopy32Defvars(3, eContestTempSave.unk18204, gPlttBufferUnfaded, 0x400);
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = 2;
    gTasks[taskId].func = sub_80ADB48;
}

void sub_80ADB48(u8 taskId)
{
    if (++gTasks[taskId].data[0] > 2)
    {
        gTasks[taskId].data[0] = 0;
        if (--gTasks[taskId].data[1] == 0)
            gTasks[taskId].func = sub_80ADB88;
    }
}

void sub_80ADB88(u8 taskId)
{
    u8 r4 = sContestantStatus[gContestPlayerMonIndex].attentionLevel;

    ContestClearGeneralTextWindow();
    StringCopy(gStringVar1, gContestMons[gContestPlayerMonIndex].nickname);
    StringExpandPlaceholders(gStringVar4, gContestStandOutStrings[r4]);
    Text_InitWindow8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
    gTasks[taskId].func = sub_80ADC10;
}

void sub_80ADC10(u8 taskId)
{
    if (Text_UpdateWindowInContest(&gMenuWindow) == 1)
    {
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = sub_80ADC4C;
        ContestDebugDoPrint();
    }
}

void sub_80ADC4C(u8 taskId)
{
    if (gTasks[taskId].data[0]++ > 29)
    {
        gTasks[taskId].data[0] = 0;
        sub_80AFF10();
        gTasks[taskId].func = sub_80ADC84;
    }
}

void sub_80ADC84(u8 taskId)
{
    if (sub_80AFF28())
    {
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = sub_80ADCB4;
    }
}

void sub_80ADCB4(u8 taskId)
{
    SetBgForCurtainDrop();
    gTasks[taskId].func = Task_StartDropCurtainAtRoundEnd;
}

void Task_UpdateContestantBoxOrder(u8 taskId)
{
    UpdateContestantBoxOrder();
    gTasks[taskId].func = sub_80ADD04;
}

void sub_80ADD04(u8 taskId)
{
    REG_BG0CNT_BITFIELD.priority = 0;
    REG_BG2CNT_BITFIELD.priority = 0;
    if (++sContest.turnNumber == 5)
    {
        gTasks[taskId].func = sub_80ADDA4;
    }
    else
    {
        SlideApplauseMeterIn();
        gTasks[taskId].func = sub_80ADD74;
    }
}

void sub_80ADD74(u8 taskId)
{
    if (!sContest.applauseMeterIsMoving)
        gTasks[taskId].func = sub_80ABB70;
}

void sub_80ADDA4(u8 taskId)
{
    s32 i;

    gBattle_BG0_Y = 0;
    gBattle_BG2_Y = 0;
    for (i = 0; i < 4; i++)
        gContestMonAppealPointTotals[i] = sContestantStatus[i].pointTotal;
    CalculateFinalScores();
    ContestClearGeneralTextWindow();
    sub_80BE23C(sContestantStatus[gContestPlayerMonIndex].prevMove);
    gContestRngValue = gRngValue;
    StringExpandPlaceholders(gStringVar4, gUnknown_083CB02C);
    Text_InitWindow8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
    gTasks[taskId].data[2] = 0;
    gTasks[taskId].func = sub_80ADE54;
}

void sub_80ADE54(u8 taskId)
{
    if (Text_UpdateWindowInContest(&gMenuWindow) == 1)
    {
        SetBgForCurtainDrop();
        gBattle_BG1_X = 0;
        gBattle_BG1_Y = 160;
        PlaySE12WithPanning(SE_CONTEST_CURTAIN_FALL, 0);
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = sub_80ADEAC;
    }
}

void sub_80ADEAC(u8 taskId)
{
    if ((s16)(gBattle_BG1_Y -= 7) < 0)
        gBattle_BG1_Y = 0;
    if (gBattle_BG1_Y == 0)  // Why cast?
    {
        gTasks[taskId].func = sub_80ADEEC;
        gTasks[taskId].data[0] = 0;
    }
}

void sub_80ADEEC(u8 taskId)
{
    if (gTasks[taskId].data[0]++ >= 50)
    {
        gTasks[taskId].data[0] = 0;
        if (gIsLinkContest & 1)
        {
            gTasks[taskId].func = sub_80ADF4C;
        }
        else
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
            gTasks[taskId].func = sub_80ADFD8;
        }
    }
}

void sub_80ADF4C(u8 taskId)
{
    u8 taskId2 = CreateTask(sub_80C8AD0, 0);

    SetTaskFuncWithFollowupFunc(taskId2, sub_80C8AD0, sub_80ADF98);
    gTasks[taskId].func = nullsub_89;
    ContestPrintLinkStandby();
    sub_80AFFE0(FALSE);
}

void sub_80ADF98(u8 taskId)
{
    DestroyTask(taskId);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
    gTasks[sContest.mainTaskId].func = sub_80ADFD8;
}

void sub_80ADFD8(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        DestroyTask(taskId);
        gFieldCallback = sub_80AE010;
        SetMainCallback2(CB2_ReturnToField);
    }
}

void sub_80AE010(void)
{
    // Why disable and re-enable again?
    ScriptContext2_Disable();
    EnableBothScriptContexts();
}

// Expands a one-digit number in the string
void InsertStringDigit(u8 *str, s32 n)
{
    while (1)
    {
        if (*str == EOS)
            break;
        // Find the EXT_CTRL_CODE_BEGIN, 0 sequence, and place the number there
        if (*str == EXT_CTRL_CODE_BEGIN && *(str + 1) == 0)
        {
            u8 *end;

            end = ConvertIntToDecimalStringN(str, n, STR_CONV_MODE_LEFT_ALIGN, 1);
            *end = EOS;  // ConvertIntToDecimalStringN already does this.
            StringAppend(end, str + 2);  // Shift the rest of the string over.
            break;
        }
        str++;
    }
}

// File boundary
