#ifndef GUARD_BATTLE_PARTY_MENU_H
#define GUARD_BATTLE_PARTY_MENU_H

struct UnknownStruct1
{
    u8 filler0[0x259];
    u8 unk259;
    u8 filler25A[6];
    u8 unk260;
    u8 filler261[1];
    u8 unk262;
    s16 unk264;
    s16 unk266;
};

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
#define EWRAM_1B000 (*(struct UnknownStruct1 *)(unk_2000000 + 0x1B000))

#endif
