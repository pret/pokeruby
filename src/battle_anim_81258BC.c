#include "global.h"
#include "battle_anim_81258BC.h"
#include "battle.h"
#include "battle_message.h"
#include "menu_cursor.h"
#include "text.h"

extern struct Window gUnknown_03004210;
extern u8 gDisplayedStringBattle[];
extern u8 gActionSelectionCursor[];

extern const u8 gUnknown_08400CBB[];
extern u8 gActiveBank;
extern const u8 gUnknown_08400D15[];

extern void *gBattleBankFunc[];
extern u16 gUnknown_030042A0;
extern u16 gUnknown_030042A4;

#if ENGLISH
#define SUB_812BB10_TILE_DATA_OFFSET 440
#elif GERMAN
#define SUB_812BB10_TILE_DATA_OFFSET 444
#endif

void sub_812BB10(void) {
    int i;

    gUnknown_030042A4 = 0;
    gUnknown_030042A0 = 160;
    gUnknown_03004210.paletteNum = 0;
    FillWindowRect_DefaultPalette(&gUnknown_03004210, 10, 2, 15, 27, 18);
    FillWindowRect_DefaultPalette(&gUnknown_03004210, 10, 2, 35, 16, 36);
    gBattleBankFunc[gActiveBank] = bx_battle_menu_t6_2;

    InitWindow(&gUnknown_03004210, gUnknown_08400D15, 400, 18, 35);
    sub_8002F44(&gUnknown_03004210);
    sub_814A5C0(0, 0xFFFF, 12, 11679, 0);

    for (i = 0; i < 4; i++)
    {
        nullsub_8(i);
    }

    sub_802E3E4(gActionSelectionCursor[gActiveBank], 0);
    StrCpyDecodeToDisplayedStringBattle((u8 *) gUnknown_08400CBB);

    InitWindow(&gUnknown_03004210, gDisplayedStringBattle, SUB_812BB10_TILE_DATA_OFFSET, 2, 35);
    sub_8002F44(&gUnknown_03004210);
}