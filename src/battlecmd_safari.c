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

// this file's functions
void SafariHandleGetAttributes(void);
void sub_812B870(void);
void sub_812B87C(void);
void sub_812B888(void);
void sub_812B894(void);
void sub_812B8A0(void);
void sub_812B8AC(void);
void sub_812B8B8(void);
void sub_812B994(void);
void sub_812B9A0(void);
void sub_812B9AC(void);
void sub_812B9B8(void);
void sub_812B9C4(void);
void sub_812BA14(void);
void sub_812BA70(void);
void sub_812BA7C(void);
void SafariHandlePrintString(void);
void SafariHandlePrintStringPlayerOnly(void);
void sub_812BB10(void);
void sub_812BBFC(void);
void sub_812BC08(void);
void sub_812BC14(void);
void sub_812BC54(void);
void sub_812BC60(void);
void sub_812BC6C(void);
void sub_812BC78(void);
void sub_812BC84(void);
void sub_812BCC0(void);
void sub_812BCCC(void);
void sub_812BCD8(void);
void sub_812BCE4(void);
void sub_812BCF0(void);
void sub_812BCFC(void);
void sub_812BD08(void);
void sub_812BD14(void);
void sub_812BD20(void);
void sub_812BD2C(void);
void sub_812BD38(void);
void sub_812BD44(void);
void sub_812BD50(void);
void sub_812BD5C(void);
void sub_812BD68(void);
void sub_812BD74(void);
void sub_812BD80(void);
void sub_812BDC4(void);
void sub_812BDF4(void);
void dp01t_2E_6_battle_intro(void);
void sub_812BE64(void);
void sub_812BEB0(void);
void sub_812BEBC(void);
void sub_812BEC8(void);
void sub_812BED4(void);
void sub_812BEE0(void);
void sub_812BF3C(void);
void sub_812BF48(void);
void sub_812BF54(void);
void nullsub_78(void);

// const data
typedef void (*BattleBufferCmd) (void);
const BattleBufferCmd gSafariBufferCommands[] =
{
	SafariHandleGetAttributes,
	sub_812B870,
	sub_812B87C,
	sub_812B888,
	sub_812B894,
	sub_812B8A0,
	sub_812B8AC,
	sub_812B8B8,
	sub_812B994,
	sub_812B9A0,
	sub_812B9AC,
	sub_812B9B8,
	sub_812B9C4,
	sub_812BA14,
	sub_812BA70,
	sub_812BA7C,
	SafariHandlePrintString,
	SafariHandlePrintStringPlayerOnly,
	sub_812BB10,
	sub_812BBFC,
	sub_812BC08,
	sub_812BC14,
	sub_812BC54,
	sub_812BC60,
	sub_812BC6C,
	sub_812BC78,
	sub_812BC84,
	sub_812BCC0,
	sub_812BCCC,
	sub_812BCD8,
	sub_812BCE4,
	sub_812BCF0,
	sub_812BCFC,
	sub_812BD08,
	sub_812BD14,
	sub_812BD20,
	sub_812BD2C,
	sub_812BD38,
	sub_812BD44,
	sub_812BD50,
	sub_812BD5C,
	sub_812BD68,
	sub_812BD74,
	sub_812BD80,
	sub_812BDC4,
	sub_812BDF4,
	dp01t_2E_6_battle_intro,
	sub_812BE64,
	sub_812BEB0,
	sub_812BEBC,
	sub_812BEC8,
	sub_812BED4,
	sub_812BEE0,
	sub_812BF3C,
	sub_812BF48,
	sub_812BF54,
	nullsub_78,
};
// code

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
