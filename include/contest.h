#ifndef GUARD_CONTEST_H
#define GUARD_CONTEST_H

struct ContestMove
{
    u8 effect;
    u8 contestCategory:3;
    u8 comboStarterId;
    u8 comboMoves[4];
};

struct ContestEffect
{
    u8 effectType;
    u8 appeal;
    u8 jam;
};

struct ContestPokemon
{
	/*0x00*/ u16 species;
	/*0x02*/ u8 nickname[POKEMON_NAME_LENGTH + 1];
	/*0x0D*/ u8 trainerName[8];
	/*0x15*/ u8 unk15;
	/*0x16*/ u8 unk16;
	/*0x17*/ u8 filler17;
	/*0x18*/ u32 unk18;
	/*0x1C*/ u8 filler1C[2];
	/*0x1E*/ u16 moves[4]; // moves
	/*0x26*/ u8 cool; // cool
	/*0x27*/ u8 beauty; // beauty
	/*0x28*/ u8 cute; // cute
	/*0x29*/ u8 smart; // smart
	/*0x2A*/ u8 tough; // tough
	/*0x2B*/ u8 sheen; // sheen
	/*0x2C*/ u8 unk2C;
	/*0x2D*/ u8 unk2D[11];
	/*0x38*/ u32 personality;  // personality
	/*0x3C*/ u32 otId;  // otId
}; // wow

extern struct ContestPokemon gContestMons[];
void ResetLinkContestBoolean(void);
void sub_80AB2AC(void);
void sub_80AB47C(void);
void sub_80AE098(u8);
void sub_80AE398(u8, u8);
u8 sub_80AE47C(struct Pokemon *party);
u32 sub_80AE770(u8, u8);
void sub_80AE82C(u8);
u8 sub_80AEB1C();
void sub_80AF668(void);
void sub_80B0F28(u8);
int sub_80B2A7C(u8);  //Don't know return type size
u8 sub_80B2C4C(u8, u8);
void sub_80B2D1C(void);

#endif // GUARD_CONTEST_H
