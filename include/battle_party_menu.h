#ifndef GUARD_BATTLE_PARTY_MENU_H
#define GUARD_BATTLE_PARTY_MENU_H

extern u8 unk_2000000[];
#define EWRAM_1609D unk_2000000[0x1609D]

void SetUpBattlePokemonMenu(u8);
bool8 SetUpBattlePartyMenu(void);

#endif
