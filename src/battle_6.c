#include "battle_message.h"
#include "global.h"
#include "battle.h"
#include "menu_cursor.h"
#include "text.h"

extern u16 gUnknown_030042A4;
extern u16 gUnknown_030042A0;

extern struct Window gUnknown_03004210;

extern void (*gUnknown_03004330[])(void);

extern u8 gUnknown_02024A60;
extern u8 gUnknown_02024E60[];
extern u8 gUnknown_020238CC[];

extern u16 gUnknown_030042C0;
extern u16 gUnknown_030041B4;
extern u16 gUnknown_03004288;
extern u16 gUnknown_03004280;
extern u16 gUnknown_030041B0;
extern u16 gUnknown_030041B8;

extern const u8 gUnknown_08400CA8[];
extern const u8 gUnknown_08400CF3[];

#if ENGLISH
#define SUB_803037C_TILE_DATA_OFFSET 440
#elif GERMAN
#define SUB_803037C_TILE_DATA_OFFSET 444
#endif

void sub_803037C(void) {
    int r4;

    gUnknown_030042A4 = 0;
    gUnknown_030042A0 = 160;
    FillWindowRect(&gUnknown_03004210, 10, 2, 15, 27, 18);
    FillWindowRect(&gUnknown_03004210, 10, 2, 35, 16, 38);

    gUnknown_03004330[gUnknown_02024A60] = sub_802C098;

    InitWindow(&gUnknown_03004210, gUnknown_08400CF3, 400, 18, 35);
    sub_8002F44(&gUnknown_03004210);
    sub_814A5C0(0, 0xFFFF, 12, 11679, 0);

    for (r4 = 0; r4 < 4; r4++)
    {
        nullsub_8(r4);
    }

    sub_802E3E4(gUnknown_02024E60[gUnknown_02024A60], 0);

    get_battle_strings_((u8 *) gUnknown_08400CA8);
    InitWindow(&gUnknown_03004210, gUnknown_020238CC, SUB_803037C_TILE_DATA_OFFSET, 2, 35);
    sub_8002F44(&gUnknown_03004210);
}
