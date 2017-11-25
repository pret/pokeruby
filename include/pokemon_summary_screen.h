#ifndef GUARD_POKEMON_SUMMARY_SCREEN_H
#define GUARD_POKEMON_SUMMARY_SCREEN_H

#include "main.h"
#include "task.h"

extern const u8 *const gNatureNames[];

struct SummaryScreenStruct
{
    /*0x00*/ union {
        struct Pokemon *partyMons;
        struct BoxPokemon *boxMons;
    } unk0;
    /*0x04*/ MainCallback unk4;
    /*0x08*/ u8 unk8;
    /*0x09*/ u8 unk9;
    /*0x0A*/ u8 unkA;
    /*0x0B*/ u8 unkB;
    /*0x0C*/ u8 unkC;
    /*0x0D*/ u8 unkD;
    /*0x0E*/ u8 unkE;
    /*0x0F*/ u8 unkF;
    /*0x10*/ struct Pokemon unk10;
    /*0x74*/ u8 unk74;
    /*0x75*/ u8 unk75;
    /*0x76*/ u8 unk76;
    /*0x77*/ u8 unk77;
    /*0x78*/ u8 unk78;
    /*0x79*/ u8 unk79;
    /*0x7A*/ u8 unk7A;
    /*0x7B*/ u8 unk7B;
    /*0x7C*/ u16 unk7C;
    /*0x7E*/ u8 unk7E;
    /*0x7F*/ u8 unk7F;
    /*0x80*/ u8 unk80;
    /*0x81*/ u8 filler81;
    /*0x84*/ TaskFunc unk84;
};

void ShowPokemonSummaryScreen(struct Pokemon *, u8, u8, MainCallback, u8);
void sub_809D9F0(struct Pokemon *, u8, u8, MainCallback, u16);
u8 sub_809FA30(void);
u8 pokemon_ailments_get_primary(u32);
u8 GetMonStatusAndPokerus();
u8 *sub_80A1E9C(u8 *dest, const u8 *src, u8);
u8 *PokemonSummaryScreen_CopyPokemonLevel(u8 *dest, u8 level);
u8 PokemonSummaryScreen_CheckOT(struct Pokemon *pokemon);
bool8 CheckPartyPokerus(struct Pokemon *, u8);


#endif // GUARD_POKEMON_SUMMARY_SCREEN_H
