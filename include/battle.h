#ifndef GUARD_BATTLE_H
#define GUARD_BATTLE_H

#define BATTLE_TYPE_DOUBLE          0x0001
#define BATTLE_TYPE_LINK            0x0002
#define BATTLE_TYPE_WILD            0x0004
#define BATTLE_TYPE_TRAINER         0x0008
#define BATTLE_TYPE_FIRST_BATTLE    0x0010
#define BATTLE_TYPE_20              0x0020
#define BATTLE_TYPE_40              0x0040
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

// needed to match the hack that is get_item, thanks cam, someone else clean this up later.
extern u8 unk_2000000[];

// to do: maybe try to reduce the defines needed to match?
#define BATTLE_STRUCT ((struct BattleStruct *)(unk_2000000))
#define AI_THINKING_STRUCT ((struct AI_ThinkingStruct *)(unk_2000000 + 0x16800))
#define UNK_2016A00_STRUCT ((struct UnknownStruct1 *)(unk_2000000 + 0x16A00))
#define UNK_2016C00_STRUCT ((struct UnknownStruct3 *)(unk_2000000 + 0x16C00))
#define AI_ARRAY_160CC     ((struct SmallItemStruct *)(unk_2000000 + 0x160CC))

struct Trainer
{
    /*0x00*/ u8 partyFlags;
    /*0x01*/ u8 trainerClass;
    /*0x02*/ u8 encounterMusic:7;
    /*0x02*/ u8 gender:1;
    /*0x03*/ u8 trainerPic;
    /*0x04*/ u8 trainerName[12];
    /*0x10*/ u16 items[4];
    /*0x18*/ bool8 doubleBattle;
    /*0x1C*/ u32 aiFlags;
    /*0x20*/ u8 partySize;
    /*0x24*/ void *party;
};

struct UnknownStruct1
{
    /*0x00*/ u16 unk0[2][8];
    /*0x20*/ u8 unk20[2];
    /*0x22*/ u8 unk22[2];
    /*0x24*/ u16 items[4];
    /*0x2C*/ u8 unk8;
};

struct UnknownStruct3
{
    u8 *ptr[8];
    u8 unk20;
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
/* 0x18 */ u8 unk18[4];
};

struct SmallBattleStruct1
{
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u8 unk4;
};

struct SmallItemStruct
{
    u8 itemLocal[2][3];
};

struct BattleStruct /* 0x2000000 */
{
    u8 filler0[0x1601C];
    struct SmallBattleStruct1 unk;
    u8 filler1[0x68]; // 0x2016020
    u8 safariFleeRate;
    u8 filler1_2[0x42];
    /* 0x160CB */ u8 linkPlayerIndex;
    /* 0x160CC */ struct SmallItemStruct item;
    u8 filler2[0x72E];
    /* 0x16800 */ struct AI_ThinkingStruct ai; /* 0x2016800 */
	u8 filler1681C[0x1E4];
	/* 0x16A00 */ struct UnknownStruct1 unk_2016A00_2;
};

struct UnknownStruct4
{
    u8 filler0[0x3];
    u16 unk4;
    u16 unk6;
    u8 unk8;
    u8 unk9;
    u8 fillerA[0x9];
    u8 taunt:4;
    u8 unkC:4;
    u8 fillerD[0x2];
    u8 unk16;
    u8 filler17[0x4];
};

extern struct UnknownStruct1 unk_2016A00;
extern struct UnknownStruct3 unk_2016C00;
extern struct UnknownStruct4 gUnknown_02024CA8[];
extern struct AI_ThinkingStruct gAIThinkingSpace;

#endif // GUARD_BATTLE_H
