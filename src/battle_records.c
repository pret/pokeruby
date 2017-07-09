#include "global.h"
#include "battle_records.h"
#include "menu.h"
#include "strings2.h"

struct DebugStruct1
{
    u16 var0;
    u8 var1[10];
};
#ifdef DEBUG
const struct DebugStruct1 gUnknown_Debug_4245CC[] = {
    { 1, _("NUMBER1") },
    { 2, _("ナンバー2") },
    { 3, _("ナンバー3") },
    { 4, _("ナンバー4") },
    { 5, _("ナンバー5") },
    { 6, _("ナンバー6") },
    { 7, _("ナンバー7") },
};

const u8 gUnknown_Debug_8424620[][4] = {
    { 1, 1, 0, 0 },
    { 2, 1, 0, 0 },
    { 3, 1, 0, 0 },
};
#endif

void ShowLinkBattleRecords(void) {
    s32 i;
    MenuDrawTextWindow(1, 0, 28, 18);
    sub_8072BD8((u8 *) gOtherText_BattleResults, 0, 1, 240);

    PrintLinkBattleWinsLossesDraws(gSaveBlock1.linkBattleRecords);
#if ENGLISH
    MenuPrint(gOtherText_WinLoseDraw, 12, 6);
#elif GERMAN
    MenuPrint_PixelCoords((u8 *) gOtherText_WinLoseDraw, 88, 48, 1);
#endif

    for (i = 0; i < 5; i++)
    {
        PrintLinkBattleRecord(gSaveBlock1.linkBattleRecords[i], 6 + (i + 1) * 2);
    }
}
