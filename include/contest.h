#ifndef GUARD_CONTEST_H
#define GUARD_CONTEST_H

struct ContestPokemon
{
 /* 0x00 */ u16 species;
 /* 0x02 */ u8 nickname[POKEMON_NAME_LENGTH];
 /* 0x0D */ u8 trainerName[8];
 /* 0x15 */ u8 unk15;
 /* 0x16 */ u8 unk16;
 /* 0x17 */ u8 filler17[7];
 /* 0x1E */ u16 moves[4]; // moves
 /* 0x26 */ u8 cool; // cool
 /* 0x27 */ u8 beauty; // beauty
 /* 0x28 */ u8 cute; // cute
 /* 0x29 */ u8 smart; // smart
 /* 0x2A */ u8 tough; // tough
 /* 0x2B */ u8 sheen; // sheen
 /* 0x2C */ u8 filler2C[12];
 /* 0x38 */ u32 unk38;
 /* 0x3C */ u32 unk3C;
}; // wow

extern struct ContestPokemon gContestMons[];

#endif // GUARD_CONTEST_H
