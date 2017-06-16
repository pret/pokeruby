#ifndef GUARD_BATTLE_PARTY_MENU_H
#define GUARD_BATTLE_PARTY_MENU_H

#include "task.h"

struct PartyMenuItem
{
    const u8 *text;
    TaskFunc func;
};

struct PartyPopupMenu
{
    u8 unk0;
    u8 unk1;
    const u8 *unk4;
};

extern u8 unk_2000000[];

void SetUpBattlePokemonMenu(u8);

#define EWRAM_1609D unk_2000000[0x1609D]

#endif
