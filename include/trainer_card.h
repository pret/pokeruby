#ifndef GUARD_TRAINER_CARD_H
#define GUARD_TRAINER_CARD_H

struct TrainerCard {
	/*0x00*/ u8 gender;
	/*0x01*/ u8 var_1;
	/*0x02*/ bool8 hasPokedex;
	/*0x03*/ bool8 var_3;
	/*0x04*/ bool8 var_4;
	/*0x05*/ u8 var_5;
	/*0x06*/ u16 firstHallOfFameA;
	/*0x08*/ u16 firstHallOfFameB;
	/*0x0A*/ u16 firstHallOfFameC;
	/*0x0C*/ u16 pokedexSeen;
	/*0x0E*/ u16 trainerId;
	/*0x10*/ u16 playTimeHours;
	/*0x12*/ u16 playTimeMinutes;
	/*0x14*/ u16 linkBattleWins;
	/*0x16*/ u16 linkBattleLosses;
	/*0x18*/ u16 var_18;
	/*0x1A*/ u16 var_1A;
	/*0x1C*/ u16 contestsWithFriends;
	/*0x1E*/ u16 pokeblocksWithFriends;
	/*0x20*/ u16 pokemonTrades;
	/*0x22*/ u16 var_22;
	/*0x24*/ u32 money;
	/*0x28*/ u16 var_28[4];
	/*0x30*/ u8 playerName[8];
};

void sub_8093110(void (*)(void));
void sub_8093130(u8, void (*)(void));
void sub_8093324(void);
void sub_8093390(struct TrainerCard *);
u8 sub_80934C4(u8 id);
void sub_8093598(void);
void sub_80935EC(void);
void sub_8093610(void);
void sub_8093688(void);
// sub_80936D4
void sub_80937A4(void);
void sub_80937BC(void);
void sub_80937D8(void);
void sub_80937F0(void);
void nullsub_15(void);
void sub_8093800(void);
// sub_809380C
// sub_809382C
// sub_8093864
// sub_80938A8
// sub_80938CC
// sub_8093918
// sub_8093938
// sub_8093954
// sub_8093980
// sub_80939A4
// sub_80939C0
// sub_80939DC
// sub_8093A28
// sub_8093A48
// sub_8093A68
// sub_8093AA0
// sub_8093AF0
// sub_8093C0C
// sub_8093C38
// sub_8093D50
// sub_8093D7C
// sub_8093DAC
// sub_8093DC8
// sub_8093DEC
// sub_8093E04
// sub_8093E28
// sub_8093EA0
// sub_8093EF8
// sub_8093F14
// sub_8093F48
// sub_8093F64
// sub_8093F80
// sub_8093FD0
// sub_8094038
// sub_80940E4
// sub_8094110
// sub_8094140
// sub_8094188
// sub_80941D8
// sub_8094200
// sub_8094218
// sub_8094250
// sub_809429C
// sub_80942F8
// sub_8094334
// sub_8094354
// sub_80943C4
// sub_80943E4
// sub_8094428
// sub_8094448
// sub_8094498
// sub_80944B8
// sub_80944E8
// sub_8094508
// sub_8094538
// sub_8094558
// unref_sub_8094588

#endif // GUARD_TRAINER_CARD_H
