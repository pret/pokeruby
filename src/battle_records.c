#include "global.h"
#include "menu.h"
#include "strings2.h"

void PrintLinkBattleWinsLossesDraws(void *);

void PrintLinkBattleRecord(void *, u8);

void ShowLinkBattleRecords(void)
{
    s32 i;
    MenuDrawTextWindow(1, 0, 28, 18);
    sub_8072BD8((u8 *)gOtherText_BattleResults, 0, 1, 240);

    PrintLinkBattleWinsLossesDraws(gSaveBlock1.linkBattleRecords);
#if ENGLISH
    MenuPrint(gOtherText_WinLoseDraw, 12, 6);
#elif GERMAN
    MenuPrint_PixelCoords((u8 *)gOtherText_WinLoseDraw, 88, 48, 1);
#endif

    for (i = 0; i < 5; i++)
    {
        PrintLinkBattleRecord(gSaveBlock1.linkBattleRecords[i], 6 + (i + 1) * 2);
    }
}
