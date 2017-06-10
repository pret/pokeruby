#ifndef GUARD_BATTLE_H
#define GUARD_BATTLE_H

#define BATTLE_TYPE_DOUBLE          0x0001
#define BATTLE_TYPE_LINK            0x0002
#define BATTLE_TYPE_WILD            0x0004
#define BATTLE_TYPE_TRAINER         0x0008
#define BATTLE_TYPE_FIRST_BATTLE    0x0010
#define BATTLE_TYPE_20              0x0020
#define BATTLE_TYPE_MULTI           0x0040
#define BATTLE_TYPE_SAFARI          0x0080
#define BATTLE_TYPE_BATTLE_TOWER    0x0100
#define BATTLE_TYPE_WALLY_TUTORIAL  0x0200
#define BATTLE_TYPE_ROAMER          0x0400
#define BATTLE_TYPE_EREADER_TRAINER 0x0800
#define BATTLE_TYPE_KYOGRE_GROUDON  0x1000
#define BATTLE_TYPE_LEGENDARY       0x2000
#define BATTLE_TYPE_REGI            0x4000

#define AI_ACTION_DONE          0x0001
#define AI_ACTION_FLEE          0x0002
#define AI_ACTION_WATCH          0x0004
#define AI_ACTION_DO_NOT_ATTACK          0x0008
#define AI_ACTION_UNK5          0x0010
#define AI_ACTION_UNK6          0x0020
#define AI_ACTION_UNK7          0x0040
#define AI_ACTION_UNK8          0x0080

#define MAX_TRAINER_ITEMS 4
#define MAX_MON_MOVES 4

enum
{
    WEATHER_SUN,
    WEATHER_RAIN,
    WEATHER_SANDSTORM,
    WEATHER_HAIL,
};

struct Trainer
{
    /*0x00*/ u8 partyFlags;
    /*0x01*/ u8 trainerClass;
    /*0x02*/ u8 encounterMusic_gender;
    /*0x03*/ u8 trainerPic;
    /*0x04*/ u8 trainerName[12];
    /*0x10*/ u16 items[4];
    /*0x18*/ bool8 doubleBattle;
    /*0x1C*/ u32 aiFlags;
    /*0x20*/ u8 partySize;
    /*0x24*/ void *party;
};

struct UnkBattleStruct1 // AI_Opponent_Info?
{
    /*0x00*/ u16 movesUsed[2][8]; // 0xFFFF means move not used (confuse self hit, etc)
    /*0x20*/ u8 unk20[2];
    /*0x22*/ u8 unk22[2];
    /*0x24*/ u16 items[4];
    /*0x2C*/ u8 numOfItems;
};

struct AI_Stack
{
    u8 *ptr[8];
    u8 size;
};

struct AI_ThinkingStruct /* 0x2016800 */
{
/* 0x00 */ u8 aiState;
/* 0x01 */ u8 movesetIndex;
/* 0x02 */ u16 moveConsidered;
/* 0x04 */ s8 score[4]; // score?
/* 0x08 */ u32 funcResult;
/* 0x0C */ u32 aiFlags;
/* 0x10 */ u8 aiAction;
/* 0x11 */ u8 aiLogicId;
/* 0x12 */ u8 filler12[6];
/* 0x18 */ u8 simulatedRNG[4];
};

struct SmallBattleStruct1
{
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    // unknown size
};

struct SmallItemStruct
{
    u8 itemLocal[2][3];
};

struct BattleStruct /* 0x2000000 */
{
    u8 filler0[0x15DDE];
	/*0x15DDE*/ u8 unk15DDE;
	/*0x15DDF*/ u8 unk15DDF;
	/*0x15DE0*/ u8 filler15DE0[0x23C]; // 0xAF off?
    struct SmallBattleStruct1 unk;
    u8 filler1[0x68];
    /* 0x16089 */ u8 safariFleeRate;
    u8 filler1_2[0x42];
    /* 0x160CB */ u8 linkPlayerIndex;
    /* 0x160CC */ struct SmallItemStruct item;
    u8 filler2[0x72E];
    /* 0x16800 */ struct AI_ThinkingStruct ai; /* 0x2016800 */
    u8 filler1681C[0x1E4];
    /* 0x16A00 */ struct UnkBattleStruct1 unk_2016A00_2;
};

struct UnkBattleStruct4
{
    /*0x00*/ u8 filler0[0x3];
    /*0x04*/ u16 unk4;
    /*0x06*/ u16 unk6;
    /*0x08*/ u8 unk8;
    /*0x09*/ u8 unk9;
    /*0x0A*/ u8 unkA;
             u8 fillerB[4];
             u8 unkF_0:4;
             u8 unkF_4:4;
             u8 filler10[3];
    /*0x13*/ u8 taunt:4;
    /*0x13*/ u8 unkC:4;
    /*0x14*/ u8 unk14;
    /*0x15*/ u8 unk15;
    /*0x16*/ u8 unk16;
    /*0x17*/ u8 filler17[0x4];
};

struct Struct2017800
{
    u8 unk0_0:1;
    u8 unk0_1:1;
    u8 unk0_2:1;
    u8 unk0_3:1;
    u8 unk0_4:1;
    u16 unk2;
};

struct Struct2017810
{
    u8 unk0_0:1;
    u8 unk0_1:1;
    u8 unk0_2:1;
    u8 unk0_3:1;
    u8 unk0_4:1;
    u8 unk0_5:1;
    u8 unk0_6:1;
    u8 unk0_7:1;
    u8 unk1_0:1;
    u8 unk2;
    u8 unk3;
    //u8 filler2[2];
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    u8 unk8;
    u8 unk9;
    u8 fillerA[2];
};

struct Struct2017840
{
    u16 unk0;
    u8 filler2[7];
    u8 unk9;
};

extern struct UnknownStruct1 unk_2016A00;
extern struct UnkBattleStruct4 gUnknown_02024CA8[];
extern struct AI_ThinkingStruct gAIThinkingSpace;

// TODO: move ewram to global.h
extern u8 ewram[];

#define BATTLE_STRUCT      ((struct BattleStruct *)     (ewram + 0x00000))
#define AI_THINKING_STRUCT ((struct AI_ThinkingStruct *)(ewram + 0x16800))
#define UNK_2016A00_STRUCT ((struct UnkBattleStruct1 *) (ewram + 0x16A00))
#define AI_STACK           ((struct AI_Stack *)         (ewram + 0x16C00))
#define AI_ARRAY_160CC     ((struct SmallItemStruct *)  (ewram + 0x160CC))
#define ewram17800         ((struct Struct2017800 *)    (ewram + 0x17800))
#define ewram17810         ((struct Struct2017810 *)    (ewram + 0x17810))
#define ewram17840         (*(struct Struct2017840 *)   (ewram + 0x17840))

#endif // GUARD_BATTLE_H
