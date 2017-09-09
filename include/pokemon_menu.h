#ifndef GUARD_POKEMON_MENU_H
#define GUARD_POKEMON_MENU_H

#define POKEMENU_FIRST_FIELD_MOVE_ID 10

enum
{
    POKEMENU_SUMMARY,           // 0
    POKEMENU_SWITCH,            // 1
    POKEMENU_ITEM,              // 2
    POKEMENU_CANCEL,            // 3
    POKEMENU_GIVE_ITEM,         // 4
    POKEMENU_TAKE_ITEM,         // 5
    POKEMENU_TAKE_MAIL,         // 6
    POKEMENU_MAIL,              // 7
    POKEMENU_READ_MAIL,         // 8
    POKEMENU_CANCEL_SUBMENU,    // 9
    POKEMENU_CUT,               // 10
	POKEMENU_FLASH,             // 11
	POKEMENU_ROCK_SMASH,        // 12
	POKEMENU_STRENGTH,          // 13
	POKEMENU_SURF,              // 14
	POKEMENU_FLY,               // 15
	POKEMENU_DIVE,              // 16
	POKEMENU_WATERFALL,         // 17
	POKEMENU_TELEPORT,          // 18
	POKEMENU_DIG,               // 19
	POKEMENU_SECRET_POWER,      // 20
	POKEMENU_MILK_DRINK,        // 21
	POKEMENU_SOFT_BOILED,       // 22
	POKEMENU_SWEET_SCENT,       // 23
};

extern u8 gLastFieldPokeMenuOpened;
extern void (*gUnknown_03005CE4)(void);

void sub_808B5B4(u32 taskID);
void sub_8089A70(void);
void sub_808A004(u8 taskID);
void sub_808AB90(void);
void sub_808AD58(void);
void sub_808B020(void);
void sub_808B0C0(u8 taskID);
void sub_808B508(u8);
void sub_808B564(void);

#endif // GUARD_POKEMON_MENU_H
