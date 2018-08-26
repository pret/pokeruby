#ifndef GUARD_POKEDEX_H
#define GUARD_POKEDEX_H

#include "sprite.h"

#define HOENN_DEX_COUNT 202
#define NATIONAL_DEX_COUNT 386

void ResetPokedex(void);
void sub_808C0A0(void);
void CB2_InitPokedex(void);
u8 sub_809070C(u16 dexNum, u32 b, u32 c);
const u8 *GetPokemonCategory(u16);
u16 GetPokedexHeightWeight(u16 dexNum, u8 data);

enum
{
    FLAG_GET_SEEN,
    FLAG_GET_CAUGHT,
    FLAG_SET_SEEN,
    FLAG_SET_CAUGHT
};

s8 GetSetPokedexFlag(u16, u8);

u16 GetNationalPokedexCount(u8);
u16 GetHoennPokedexCount(u8);
bool8 CompletedHoennPokedex(void);
bool16 CompletedNationalPokedex(void);

extern bool8 gUnknown_03005CE8;

struct PokedexEntry
{
    /*0x00*/ u8 categoryName[12];
    /*0x0C*/ u16 height; //in decimeters
    /*0x0E*/ u16 weight; //in hectograms
    /*0x10*/ const u8 *descriptionPage1;
    /*0x14*/ const u8 *descriptionPage2;
    /*0x18*/ u16 unused;
    /*0x1A*/ u16 pokemonScale;
    /*0x1C*/ u16 pokemonOffset;
    /*0x1E*/ u16 trainerScale;
    /*0x20*/ u16 trainerOffset;
};  /*size = 0x24*/

extern const struct PokedexEntry gPokedexEntries[];

u16 sub_8091A4C(u16 gender, s16 x, s16 y, u16 paletteNum);
u16 sub_80918EC(u16 num, s16 x, s16 y, u16 paletteNum);

void sub_8091738(u16, u16, u16);

#endif // GUARD_POKEDEX_H
