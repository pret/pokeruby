#ifndef GUARD_TRAINER_CARD_H
#define GUARD_TRAINER_CARD_H

struct TrainerCard {
    /*0x00*/ u8 gender;
    /*0x01*/ u8 stars;
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
    /*0x18*/ u16 battleTowerWins;
    /*0x1A*/ u16 battleTowerLosses;
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
void sub_8093390(struct TrainerCard *);
u8 sub_80934C4(u8 id);

// gUnknown_083B5EBC:: @ 83B5EBC
bool8 sub_8093864();
bool8 sub_80938A8();
bool8 sub_80938CC();
bool8 sub_8093918();
bool8 sub_8093938();
bool8 sub_8093954();
bool8 sub_8093980();

// gUnknown_083B5ED8:: @ 83B5ED8
bool8 sub_8093AA0();
bool8 sub_8093AF0();
bool8 sub_8093C0C(struct TrainerCard *trainerCard);
bool8 sub_8093C38();
bool8 sub_8093D50(void);

#endif // GUARD_TRAINER_CARD_H
