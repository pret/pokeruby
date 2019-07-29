#include "global.h"
#include "battle_records.h"
#include "constants/game_stat.h"
#include "link.h"
#include "menu.h"
#include "overworld.h"
#include "string_util.h"
#include "strings2.h"
#include "trainer_card.h"

struct DebugStruct1
{
    u16 var0;
    u8 var1[10];
};

extern struct LinkPlayerEventObject gLinkPlayerEventObjects[4];
extern u8 gBattleOutcome;

#if DEBUG
const struct DebugStruct1 gUnknown_Debug_4245CC[] =
{
    { 1, _("NUMBER1") },
    { 2, _("ナンバー2") },
    { 3, _("ナンバー3") },
    { 4, _("ナンバー4") },
    { 5, _("ナンバー5") },
    { 6, _("ナンバー6") },
    { 7, _("ナンバー7") },
};

const struct {u8 unk0; u8 unk1;} gUnknown_Debug_8424620[] =
{
    { 1, 1 },
    { 2, 1 },
    { 3, 1 },
};
#endif

static void InitLinkBattleRecord(struct LinkBattleRecord *record)
{
    CpuFill16(0, record, sizeof(struct LinkBattleRecord));
    record->name[0] = 0xFF;
    record->trainerId = 0;
    record->wins = 0;
    record->losses = 0;
    record->draws = 0;
}

static void InitLinkBattleRecords_(struct LinkBattleRecord *records)
{
    int i;
    for (i = 0; i < 5; i++)
    {
        InitLinkBattleRecord(records + i);
    }
    SetGameStat(GAME_STAT_LINK_BATTLE_WINS, 0);
    SetGameStat(GAME_STAT_LINK_BATTLE_LOSSES, 0);
    SetGameStat(GAME_STAT_LINK_BATTLE_DRAWS, 0);
}

static int GetLinkBattleRecordTotalBattles(struct LinkBattleRecord *record)
{
    return record->wins + record->losses + record->draws;
}

static int FindLinkBattleRecord(struct LinkBattleRecord *records, const u8 *name, u16 trainerId)
{
    int i;

    for (i = 0; i < 5; i++)
    {
        memcpy(gStringVar1, records[i].name, 7);
        gStringVar1[7] = EOS;
        if (!StringCompareWithoutExtCtrlCodes(gStringVar1, name) && records[i].trainerId == trainerId)
            return i;
    }

    return 5;
}

static void SortLinkBattleRecords(struct LinkBattleRecord *records)
{
    int i, j;

    for (i = 4; i > 0; i--)
    {
        for (j = i - 1; j >= 0; j--)
        {
            int totalBattlesI = GetLinkBattleRecordTotalBattles(records + i);
            int totalBattlesJ = GetLinkBattleRecordTotalBattles(records + j);

            if (totalBattlesI > totalBattlesJ)
            {
                struct LinkBattleRecord temp = *(records + i);
                *(records + i) = *(records + j);
                *(records + j) = temp;
            }
        }
    }
}

static void UpdateLinkBattleRecord(struct LinkBattleRecord *record, int battleOutcome)
{
    switch (battleOutcome)
    {
    case 1:
        record->wins++;
        if (record->wins > 9999)
            record->wins = 9999;
        break;
    case 2:
        record->losses++;
        if (record->losses > 9999)
            record->losses = 9999;
        break;
    case 3:
        record->draws++;
        if (record->draws > 9999)
            record->draws = 9999;
        break;
    }
}

static void UpdateLinkBattleGameStats(int battleOutcome)
{
    u8 stat;

    switch (battleOutcome)
    {
    case 1:
        stat = GAME_STAT_LINK_BATTLE_WINS;
        break;
    case 2:
        stat = GAME_STAT_LINK_BATTLE_LOSSES;
        break;
    case 3:
        stat = GAME_STAT_LINK_BATTLE_DRAWS;
        break;
    default:
        return;
    }

    if (GetGameStat(stat) < 9999)
        IncrementGameStat(stat);
}

static void UpdateLinkBattleRecords_(struct LinkBattleRecord *records, const u8 *name, u16 trainerId, int battleOutcome, u8 language)
{
    int index;
    UpdateLinkBattleGameStats(battleOutcome);
    SortLinkBattleRecords(records);
    index = FindLinkBattleRecord(records, name, trainerId);
    if (index == 5)
    {
        index = 4;
        InitLinkBattleRecord(records + index);
        if (language == LANGUAGE_JAPANESE)
        {
            records[index].name[0] = EXT_CTRL_CODE_BEGIN;
            records[index].name[1] = 0x15;
            StringCopyN(records[index].name + 2, name, 5);
        }
        else
        {
            StringCopyN(records[index].name, name, 7);
        }

        // needed block to match
        {
            struct LinkBattleRecord *record = records + index;
            record->trainerId = trainerId;
        }
    }
    UpdateLinkBattleRecord(records + index, battleOutcome);
    SortLinkBattleRecords(records);
}

void InitLinkBattleRecords(void)
{
    InitLinkBattleRecords_(gSaveBlock1.linkBattleRecords);
}

static void IncTrainerCardWins(int id)
{
    u16 *wins = &gTrainerCards[id].linkBattleWins;
    (*wins)++;
    if (*wins > 9999)
        *wins = 9999;
}

static void IncTrainerCardLosses(int id)
{
    u16 *losses = &gTrainerCards[id].linkBattleLosses;
    (*losses)++;
    if (*losses > 9999)
        *losses = 9999;
}

static void UpdateTrainerCardWinsLosses(int id)
{
    switch (gBattleOutcome)
    {
    case 1:
        IncTrainerCardWins(id ^ 1);
        IncTrainerCardLosses(id);
        break;
    case 2:
        IncTrainerCardLosses(id ^ 1);
        IncTrainerCardWins(id);
        break;
    }
}

void UpdateLinkBattleRecords(int id)
{
    UpdateTrainerCardWinsLosses(id);
    UpdateLinkBattleRecords_(
        gSaveBlock1.linkBattleRecords,
        gTrainerCards[id].playerName,
        gTrainerCards[id].trainerId,
        gBattleOutcome,
        gLinkPlayers[gLinkPlayerEventObjects[id].linkPlayerId].language);
}

#if DEBUG
void debug_sub_81257E0(void)
{
    u32 i;

    InitLinkBattleRecords();
    for (i = 0; i < 3; i++)
    {
        u32 id = gUnknown_Debug_8424620[i].unk0 - 1;

        UpdateLinkBattleRecords_(
            gSaveBlock1.linkBattleRecords,
            gUnknown_Debug_4245CC[id].var1,
            gUnknown_Debug_4245CC[id].var0,
            gUnknown_Debug_8424620[i].unk1,
            gLinkPlayers[gLinkPlayerEventObjects[id].linkPlayerId].language);
    }
}
#endif

static void PrintLinkBattleWinsLossesDraws(struct LinkBattleRecord *records)
{
    ConvertIntToDecimalStringN_DigitWidth6(gStringVar1, GetGameStat(GAME_STAT_LINK_BATTLE_WINS), STR_CONV_MODE_RIGHT_ALIGN, 4);
    ConvertIntToDecimalStringN_DigitWidth6(gStringVar2, GetGameStat(GAME_STAT_LINK_BATTLE_LOSSES), STR_CONV_MODE_RIGHT_ALIGN, 4);
    ConvertIntToDecimalStringN_DigitWidth6(gStringVar3, GetGameStat(GAME_STAT_LINK_BATTLE_DRAWS), STR_CONV_MODE_RIGHT_ALIGN, 4);
    Menu_PrintText(gOtherText_WinRecord, 3, 3);
}

static void PrintLinkBattleRecord(struct LinkBattleRecord *record, u8 y)
{
    if (!record->wins && !record->losses && !record->draws)
    {
        u8 buffer[16];
        buffer[0] = EXT_CTRL_CODE_BEGIN;
        buffer[1] = 0x14;
        buffer[2] = 6;
        buffer[3] = EXT_CTRL_CODE_BEGIN;
        buffer[4] = 0x11;
        buffer[5] = 1;
        StringCopy(buffer + 6, gOtherText_SevenDashes);
        Menu_PrintText(buffer, 3, y);
        StringCopy(buffer + 6, gOtherText_FourDashes);
        Menu_PrintText(buffer, 11, y);
        Menu_PrintText(buffer, 17, y);
        Menu_PrintText(buffer, 23, y);
    }
    else
    {
        StringFillWithTerminator(gStringVar1, 8);
        StringCopyN(gStringVar1, record->name, 7);
        Menu_PrintText(gStringVar1, 3, y);
        gStringVar1[0] = EXT_CTRL_CODE_BEGIN;
        gStringVar1[1] = 0x14;
        gStringVar1[2] = 6;
        ConvertIntToDecimalStringN(gStringVar1 + 3, record->wins, STR_CONV_MODE_RIGHT_ALIGN, 4);
        Menu_PrintText(gStringVar1, 11, y);
        ConvertIntToDecimalStringN(gStringVar1 + 3, record->losses, STR_CONV_MODE_RIGHT_ALIGN, 4);
        Menu_PrintText(gStringVar1, 17, y);
        ConvertIntToDecimalStringN(gStringVar1 + 3, record->draws, STR_CONV_MODE_RIGHT_ALIGN, 4);
        Menu_PrintText(gStringVar1, 23, y);
    }
}

void ShowLinkBattleRecords(void)
{
    s32 i;
    Menu_DrawStdWindowFrame(1, 0, 28, 18);
    MenuPrint_Centered(gOtherText_BattleResults, 0, 1, 240);

    PrintLinkBattleWinsLossesDraws(gSaveBlock1.linkBattleRecords);
#if ENGLISH
    Menu_PrintText(gOtherText_WinLoseDraw, 12, 6);
#elif GERMAN
    Menu_PrintTextPixelCoords(gOtherText_WinLoseDraw, 88, 48, 1);
#endif

    for (i = 0; i < 5; i++)
    {
        PrintLinkBattleRecord(&gSaveBlock1.linkBattleRecords[i], 6 + (i + 1) * 2);
    }
}

static bool32 sub_8110494(u8 level)
{
    struct BattleTowerData *battleTower = &gSaveBlock2.battleTower;

    switch (battleTower->var_4AE[level])
    {
    case 0:
        return FALSE;
    case 1:
        return FALSE;
    case 2:
        return TRUE;
    case 4:
        return FALSE;
    case 3:
        return TRUE;
    case 5:
        return FALSE;
    case 6:
        return TRUE;
    default:
        return FALSE;
    }
}

static void PrintWinStreak(const u8 *str, u16 streak, u8 left, u8 top)
{
    Menu_PrintText(str, left, top);
    if (streak > 9999)
        streak = 9999;
    AlignInt1InMenuWindow(gStringVar1, streak, 24, 1);
    Menu_PrintText(gOtherText_WinStreak, left + 7, top);
}

static void PrintRecordWinStreak(u8 level, u8 left, u8 top)
{
    struct BattleTowerData *battleTower = &gSaveBlock2.battleTower;
    u16 winStreak = battleTower->recordWinStreaks[level];
    PrintWinStreak(gOtherText_Record, winStreak, left, top);
}

static u16 GetLastWinStreak(u8 level)
{
    u16 winStreak = gSaveBlock2.battleTower.currentWinStreaks[level];
    if (winStreak > 9999)
        winStreak = 9999;

    return winStreak;
}

static void PrintLastWinStreak(u8 level, u8 left, u8 top)
{
    u16 winStreak = GetLastWinStreak(level);
    if (sub_8110494(level) == TRUE)
        PrintWinStreak(gOtherText_Current, winStreak, left, top);
    else
        PrintWinStreak(gOtherText_Prev, winStreak, left, top);
}

void ShowBattleTowerRecords(void)
{
    u16 i;
    Menu_DrawStdWindowFrame(3, 1, 27, 17);
    MenuPrint_Centered(gOtherText_BattleTowerResults, 3, 2, 0xC8);
    Menu_PrintText(gOtherText_Lv50, 5, 6);
    Menu_PrintText(gOtherText_Lv100, 5, 12);
    for (i = 5; i < 26; i++)
    {
        sub_8071F60(CHAR_HYPHEN, i, 10);
    }
    PrintLastWinStreak(0, 10, 6);
    PrintRecordWinStreak(0, 10, 8);
    PrintLastWinStreak(1, 10, 12);
    PrintRecordWinStreak(1, 10, 14);
}
