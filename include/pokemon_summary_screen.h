#ifndef GUARD_POKEMON_SUMMARY_SCREEN_H
#define GUARD_POKEMON_SUMMARY_SCREEN_H

extern const u8 *const gNatureNames[];

void ShowPokemonSummaryScreen(struct Pokemon *, u8, u8, void (*)(u8), int);
void sub_809D9F0(struct Pokemon *party, u8, u8, void *, u32);
void sub_809D9F0(struct Pokemon *, u8, u8, void *, u32);
u8 sub_809FA30(void);
u8 pokemon_ailments_get_primary(u32);
u8 GetMonStatusAndPokerus();
u8 *sub_80A1E9C(u8 *dest, const u8 *src, u8);
u8 *PokemonSummaryScreen_CopyPokemonLevel(u8 *dest, u8 level);
u8 PokemonSummaryScreen_CheckOT(struct Pokemon *pokemon);

#endif // GUARD_POKEMON_SUMMARY_SCREEN_H
