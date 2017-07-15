#include "global.h"
#include "battle_records.h"
#include "game_stat.h"
#include "link.h"
#include "menu.h"
#include "rom4.h"
#include "string_util.h"
#include "strings2.h"
#include "trainer_card.h"

extern struct LinkPlayerMapObject gLinkPlayerMapObjects[4];
extern u8 gBattleOutcome;

static void sub_810FF78(struct LinkBattleRecord *record)
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
        sub_810FF78(records + i);
    }
    SetGameStat(GAME_STAT_LINK_BATTLE_WINS, 0);
    SetGameStat(GAME_STAT_LINK_BATTLE_LOSSES, 0);
    SetGameStat(GAME_STAT_LINK_BATTLE_DRAWS, 0);
}

static int sub_810FFDC(struct LinkBattleRecord *record)
{
    return record->wins + record->losses + record->draws;
}

static int sub_810FFEC(struct LinkBattleRecord *records, u8 *name, u16 trainerId)
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

static void sub_811003C(struct LinkBattleRecord *records)
{
    int i, j;

    for (i = 4; i > 0; i--)
    {
        for (j = i - 1; j >= 0; j--)
        {
            int totalBattlesI = sub_810FFDC(records + i);
            int totalBattlesJ = sub_810FFDC(records + j);

            if (totalBattlesI > totalBattlesJ)
            {
                struct LinkBattleRecord temp = *(records + i);
                *(records + i) = *(records + j);
                *(records + j) = temp;
            }
        }
    }
}

static void sub_81100B8(struct LinkBattleRecord *record, int battleOutcome)
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

static void sub_811011C(int battleOutcome)
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

static void sub_8110158(struct LinkBattleRecord *records, u8 *name, u16 trainerId, int battleOutcome, u8 language)
{
    int index;
    sub_811011C(battleOutcome);
    sub_811003C(records);
    index = sub_810FFEC(records, name, trainerId);
    if (index == 5)
    {
        index = 4;
        sub_810FF78(records + index);
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
    sub_81100B8(records + index, battleOutcome);
    sub_811003C(records);
}

void InitLinkBattleRecords(void)
{
    InitLinkBattleRecords_(gSaveBlock1.linkBattleRecords);
}

static void IncWins(int id)
{
    u16 *wins = &gTrainerCards[id].linkBattleWins;
    (*wins)++;
    if (*wins > 9999)
        *wins = 9999;
}

static void IncLosses(int id)
{
    u16 *losses = &gTrainerCards[id].linkBattleLosses;
    (*losses)++;
    if (*losses > 9999)
        *losses = 9999;
}

static void sub_8110254(int id)
{
    switch (gBattleOutcome)
    {
    case 1:
        IncWins(id ^ 1);
        IncLosses(id);
        break;
    case 2:
        IncLosses(id ^ 1);
        IncWins(id);
        break;
    }
}

void UpdateLinkBattleRecords(int id)
{
    sub_8110254(id);
    sub_8110158(
        gSaveBlock1.linkBattleRecords,
        gTrainerCards[id].playerName,
        gTrainerCards[id].trainerId,
        gBattleOutcome,
        gLinkPlayers[gLinkPlayerMapObjects[id].linkPlayerId].language);
}

static void PrintLinkBattleWinsLossesDraws(struct LinkBattleRecord *records)
{
    ConvertIntToDecimalStringN_DigitWidth6(gStringVar1, GetGameStat(GAME_STAT_LINK_BATTLE_WINS), STR_CONV_MODE_RIGHT_ALIGN, 4);
    ConvertIntToDecimalStringN_DigitWidth6(gStringVar2, GetGameStat(GAME_STAT_LINK_BATTLE_LOSSES), STR_CONV_MODE_RIGHT_ALIGN, 4);
    ConvertIntToDecimalStringN_DigitWidth6(gStringVar3, GetGameStat(GAME_STAT_LINK_BATTLE_DRAWS), STR_CONV_MODE_RIGHT_ALIGN, 4);
    MenuPrint(gOtherText_WinRecord, 3, 3);
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
        MenuPrint(buffer, 3, y);
        StringCopy(buffer + 6, gOtherText_FourDashes);
        MenuPrint(buffer, 11, y);
        MenuPrint(buffer, 17, y);
        MenuPrint(buffer, 23, y);
    }
    else
    {
        StringFillWithTerminator(gStringVar1, 8);
        StringCopyN(gStringVar1, record->name, 7);
        MenuPrint(gStringVar1, 3, y);
        gStringVar1[0] = EXT_CTRL_CODE_BEGIN;
        gStringVar1[1] = 0x14;
        gStringVar1[2] = 6;
        ConvertIntToDecimalStringN(gStringVar1 + 3, record->wins, STR_CONV_MODE_RIGHT_ALIGN, 4);
        MenuPrint(gStringVar1, 11, y);
        ConvertIntToDecimalStringN(gStringVar1 + 3, record->losses, STR_CONV_MODE_RIGHT_ALIGN, 4);
        MenuPrint(gStringVar1, 17, y);
        ConvertIntToDecimalStringN(gStringVar1 + 3, record->draws, STR_CONV_MODE_RIGHT_ALIGN, 4);
        MenuPrint(gStringVar1, 23, y);
    }
}

void ShowLinkBattleRecords(void) {
    s32 i;
    MenuDrawTextWindow(1, 0, 28, 18);
    sub_8072BD8((u8 *) gOtherText_BattleResults, 0, 1, 240);

    PrintLinkBattleWinsLossesDraws(gSaveBlock1.linkBattleRecords);
#if ENGLISH
    MenuPrint(gOtherText_WinLoseDraw, 12, 6);
#elif GERMAN
    MenuPrint_PixelCoords(gOtherText_WinLoseDraw, 88, 48, 1);
#endif

    for (i = 0; i < 5; i++)
    {
        PrintLinkBattleRecord(&gSaveBlock1.linkBattleRecords[i], 6 + (i + 1) * 2);
    }
}

static bool32 sub_8110494(u8 a1)
{
    struct SaveBlock2_Sub *sb2sub = &gSaveBlock2.filler_A8;

    switch (sb2sub->var_4AE[a1])
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

static void sub_81104E8(const u8 *str, u16 streak, u8 left, u8 top)
{
    MenuPrint(str, left, top);
    if (streak > 9999)
        streak = 9999;
    sub_8072C14(gStringVar1, streak, 24, 1);
    MenuPrint(gOtherText_WinStreak, left + 7, top);
}

static void sub_8110538(u8 a1, u8 left, u8 top)
{
    struct SaveBlock2_Sub *sb2sub = &gSaveBlock2.filler_A8;
    u16 winStreak = sb2sub->recordWinStreak[a1];
    sub_81104E8(gOtherText_Record, winStreak, left, top);
}

static u16 sub_811056C(u8 a1)
{
    u16 result = gSaveBlock2.filler_A8.winStreak[a1];
    if (result > 9999)
        result = 9999;
    return result;
}

static void sub_8110594(u8 a1, u8 left, u8 top)
{
    u16 winStreak = sub_811056C(a1);
    if (sub_8110494(a1) == TRUE)
        sub_81104E8(gOtherText_Current, winStreak, left, top);
    else
        sub_81104E8(gOtherText_Prev, winStreak, left, top);
}

void ShowBattleTowerRecords(void)
{
    u16 i;
    MenuDrawTextWindow(3, 1, 27, 17);
    sub_8072BD8(gOtherText_BattleTowerResults, 3, 2, 0xC8);
    MenuPrint(gOtherText_Lv50, 5, 6);
    MenuPrint(gOtherText_Lv100, 5, 12);
    for (i = 5; i < 26; i++)
    {
        sub_8071F60(CHAR_HYPHEN, i, 10);
    }
    sub_8110594(0, 10, 6);
    sub_8110538(0, 10, 8);
    sub_8110594(1, 10, 12);
    sub_8110538(1, 10, 14);
}
