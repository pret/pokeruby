#ifndef GUARD_BATTLE_H
#define GUARD_BATTLE_H

#include "sprite.h"

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

#define STATUS_SLEEP 0x7
#define STATUS_POISON 0x8
#define STATUS_BURN 0x10
#define STATUS_FREEZE 0x20
#define STATUS_PARALYSIS 0x40
#define STATUS_TOXIC_POISON 0x80

#define STATUS2_CONFUSION           0x00000007
#define STATUS2_UPROAR              0x00000070
#define STATUS2_LOCK_CONFUSE        0x00000C00
#define STATUS2_MULTIPLETURNS       0x00001000
#define STATUS2_WRAPPED             0x0000E000
#define STATUS2_FOCUS_ENERGY        0x00100000
#define STATUS2_TRANSFORMED         0x00200000
#define STATUS2_RECHARGE            0x00400000
#define STATUS2_RAGE                0x00800000
#define STATUS2_SUBSTITUTE          0x01000000
#define STATUS2_ESCAPE_PREVENTION   0x04000000
#define STATUS2_NIGHTMARE           0x08000000
#define STATUS2_CURSED              0x10000000
#define STATUS2_FORESIGHT           0x20000000

#define STATUS3_LEECHSEED_RECEIVER      0x3     //two bits for the bank that gets hp
#define STATUS3_LEECHSEED               0x4
#define STATUS3_ALWAYS_HITS             0x18    //two bits
#define STATUS3_PERISH_SONG             0x20
#define STATUS3_ON_AIR                  0x40
#define STATUS3_UNDERGROUND             0x80
#define STATUS3_MINIMIZED               0x100
#define STATUS3_CHARGED_UP              0x200
#define STATUS3_ROOTED                  0x400
#define STATUS3_GRUDGE                  0x4000
#define STATUS3_CANT_SCORE_A_CRIT       0x8000
#define STATUS3_MUDSPORT                0x10000
#define STATUS3_WATERSPORT              0x20000
#define STATUS3_UNDERWATER              0x40000

#define HITMARKER_x20                   0x0000020
#define HITMARKER_DESTINYBOND           0x0000040
#define HITMARKER_NO_ANIMATIONS         0x0000080
#define HITMARKER_IGNORE_SUBSTITUTE     0x0000100
#define HITMARKER_NO_ATTACKSTRING       0x0000200
#define HITMARKER_ATTACKSTRING_PRINTED  0x0000400
#define HITMARKER_NO_PPDEDUCT           0x0000800
#define HITMARKER_IGNORE_SAFEGUARD      0x0002000
#define HITMARKER_SYNCHRONISE_EFFECT    0x0004000
#define HITMARKER_IGNORE_ON_AIR         0x0010000
#define HITMARKER_IGNORE_UNDERGROUND    0x0020000
#define HITMARKER_IGNORE_UNDERWATER     0x0040000
#define HITMARKER_x80000                0x0080000
#define HITMARKER_x100000               0x0100000
#define HITMARKER_x400000               0x0400000
#define HITMARKER_x800000               0x0800000
#define HITMARKER_GRUDGE                0x1000000
#define HITMARKER_OBEYS                 0x2000000
#define HITMARKER_FAINTED(bank)         ((gBitTable[bank] << 0x1C))
#define HITMARKER_UNK(bank)             ((0x10000000 << bank))

#define MAX_TRAINER_ITEMS 4
#define MAX_MON_MOVES 4
#define MAX_BANKS_BATTLE 4

#define weather_rain 1
#define weather_downpour 2
#define weather_permament_rain 4
#define WEATHER_RAINY ((weather_rain | weather_downpour | weather_permament_rain))

#define weather_sandstorm 8
#define weather_permament_sandstorm 0x10
#define WEATHER_SANDSTORMY ((weather_sandstorm | weather_permament_sandstorm))

#define weather_sun 0x20
#define weather_permament_sun 0x40
#define WEATHER_SUNNY ((weather_sun | weather_permament_sun))

#define weather_hail 0x80

// needed to match the hack that is get_item, thanks cam, someone else clean this up later.
extern u8 unk_2000000[];

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

struct BattleStruct /* 0x2000000 */
{
    u8 filler0[0x15DDE];
    /*0x15DDE*/ u8 unk15DDE;
    /*0x15DDF*/ u8 unk15DDF;
    /*0x15DE0*/ u8 filler15DE0[0x222];
    /*0x16002*/ u8 AnimTurn;
    /*0x16003*/ u8 ScriptingActive;
    /*0x16004*/ u8 WrappedMove1[4];
    /*0x16008*/ u8 WrappedMove2[4];
    /*0x1600C*/ u8 cmd49StateTracker;
    /*0x1600D*/ u8 unk1600D;
    /*0x1600E*/ u8 unk1600E;
    /*0x1600F*/ u8 atk23StateTracker;
    /*0x16010*/ u8 unk16010;
    /*0x16011*/ u8 unk16011;
    /*0x16012*/ u8 unk16012;
    /*0x16013*/ u8 unk16013;
    /*0x16014*/ u8 unk16014;
    /*0x16015*/ u8 unk16015;
    /*0x16016*/ u8 unk16016;
    /*0x16017*/ u8 unk16017;
    /*0x16018*/ u8 expGetterID;
    /*0x16019*/ u8 unk16019;
    /*0x1601A*/ u8 unk1601A;
    /*0x1601B*/ u8 wildVictorySong;
    /*0x1601C*/ u8 DynamicMoveType;
    /*0x1601D*/ u8 unk1601D;
    /*0x1601E*/ u8 statChanger;
    /*0x1601F*/ u8 DmgMultiplier;
    /*0x16020*/ u8 WrappedBy[4];
    /*0x16024*/ u8 unk16024;
    /*0x16025*/ u8 unk16025;
    /*0x16026*/ u8 unk16026;
    /*0x16027*/ u8 unk16027;
    /*0x16028*/ u8 unk16028;
    /*0x16029*/ u8 unk16029;
    /*0x1602A*/ u8 unk1602A;
    /*0x1602B*/ u8 unk1602B;
    /*0x1602C*/ u8 unk1602C;
    /*0x1602D*/ u8 unk1602D;
    /*0x1602E*/ u8 unk1602E;
    /*0x1602F*/ u8 unk1602F;
    /*0x16030*/ u8 unk16030;
    /*0x16031*/ u8 unk16031;
    /*0x16032*/ u8 unk16032;
    /*0x16033*/ u8 unk16033;
    /*0x16034*/ u8 unk16034;
    /*0x16035*/ u8 unk16035;
    /*0x16036*/ u8 unk16036;
    /*0x16037*/ u8 unk16037;
    /*0x16038*/ u8 unk16038;
    /*0x16039*/ u8 unk16039;
    /*0x1603A*/ u8 unk1603A;
    /*0x1603B*/ u8 unk1603B;
    /*0x1603C*/ u8 unk1603C;
    /*0x1603D*/ u8 unk1603D;
    /*0x1603E*/ u8 unk1603E;
    /*0x1603F*/ u8 unk1603F;
    /*0x16040*/ u8 unk16040;
    /*0x16041*/ u8 unk16041;
    /*0x16042*/ u8 unk16042;
    /*0x16043*/ u8 unk16043;
    /*0x16044*/ u8 unk16044;
    /*0x16045*/ u8 unk16045;
    /*0x16046*/ u8 unk16046;
    /*0x16047*/ u8 unk16047;
    /*0x16048*/ u8 unk16048;
    /*0x16049*/ u8 unk16049;
    /*0x1604A*/ u8 unk1604A;
    /*0x1604B*/ u8 unk1604B;
    /*0x1604C*/ u8 unk1604C;
    /*0x1604D*/ u8 unk1604D;
    /*0x1604E*/ u8 unk1604E;
    /*0x1604F*/ u8 unk1604F;
    /*0x16050*/ u8 unk16050;
    /*0x16051*/ u8 unk16051;
    /*0x16052*/ u8 unk16052;
    /*0x16053*/ u8 unk16053;
    /*0x16054*/ u8 unk16054;
    /*0x16055*/ u8 unk16055;
    /*0x16056*/ u8 unk16056;
    /*0x16057*/ u8 unk16057;
    /*0x16058*/ u8 unk16058;
    /*0x16059*/ u8 unk16059;
    /*0x1605A*/ u8 unk1605A;
    /*0x1605B*/ u8 unk1605B;
    /*0x1605C*/ u16 exp;
    /*0x1605E*/ u8 unk1605E;
    /*0x1605F*/ u8 sentInPokes;
    /*0x16060*/ u8 unk16060[4];
    /*0x16064*/ u8 unk16064;
    /*0x16065*/ u8 unk16065;
    /*0x16066*/ u8 unk16066;
    /*0x16067*/ u8 unk16067;
    /*0x16068*/ u8 unk16068;
    /*0x16069*/ u8 unk16069;
    /*0x1606A*/ u8 unk1606A;
    /*0x1606B*/ u8 unk1606B;
    /*0x1606C*/ u8 unk1606C;
    /*0x1606D*/ u8 unk1606D;
    /*0x1606E*/ u8 unk1606E;
    /*0x1606F*/ u8 unk1606F;
    /*0x16070*/ u8 unk16070;
    /*0x16071*/ u8 unk16071;
    /*0x16072*/ u8 unk16072;
    /*0x16073*/ u8 unk16073;
    /*0x16074*/ u8 unk16074;
    /*0x16075*/ u8 unk16075;
    /*0x16076*/ u8 unk16076;
    /*0x16077*/ u8 unk16077;
    /*0x16078*/ u8 unk16078;
    /*0x16079*/ u8 unk16079;
    /*0x1607A*/ u8 unk1607A;
    /*0x1607B*/ u8 unk1607B;
    /*0x1607C*/ u8 unk1607C;
    /*0x1607D*/ u8 unk1607D;
    /*0x1607E*/ u8 unk1607E;
    /*0x1607F*/ u8 unk1607F;
    /*0x16080*/ u8 unk16080;
    /*0x16081*/ u8 unk16081;
    /*0x16082*/ u8 unk16082;
    /*0x16083*/ u8 unk16083;
    /*0x16084*/ u8 unk16084;
    /*0x16085*/ u8 unk16085;
    /*0x16086*/ u8 unk16086;
    /*0x16087*/ u8 unk16087;
    /*0x16088*/ u8 safariFleeRate;
    /*0x16089*/ u8 unk16089;
    /*0x1608A*/ u8 unk1608A;
    /*0x1608B*/ u8 unk1608B;
    /*0x1608C*/ u8 ChosenMoveID[4];
    /*0x16090*/ u8 unk16090;
    /*0x16091*/ u8 unk16091;
    /*0x16092*/ u8 unk16092;
    /*0x16093*/ u8 unk16093;
    /*0x16094*/ u8 unk16094;
    /*0x16095*/ u8 unk16095;
    /*0x16096*/ u8 unk16096;
    /*0x16097*/ u8 unk16097;
    /*0x16098*/ u8 unk16098;
    /*0x16099*/ u8 unk16099;
    /*0x1609A*/ u8 unk1609a;
    /*0x1609B*/ u8 unk1609b;
    /*0x1609C*/ u8 unk1609C;
    /*0x1609D*/ u8 unk1609D;
    /*0x1609E*/ u8 unk1609E;
    /*0x1609F*/ u8 unk1609F;
    /*0x160A0*/ u8 unk160a0;
    /*0x160A1*/ u8 AnimTargetsHit;
    /*0x160A2*/ u8 expGetterBank;
    /*0x160A3*/ u8 unk160A3;
    /*0x160A4*/ u8 AnimArg1;
    /*0x160A5*/ u8 AnimArg2;
    /*0x160A6*/ u8 unk160A6;
    /*0x160A7*/ u8 unk160A7;
    /*0x160A8*/ u8 unk160A8;
    /*0x160A9*/ u8 unk160A9;
    /*0x160AA*/ u8 unk160Aa;
    /*0x160AB*/ u8 unk160Ab;
    /*0x160AC*/ u8 unk160AC;
    /*0x160AD*/ u8 unk160AD;
    /*0x160AE*/ u8 unk160AE;
    /*0x160AF*/ u8 unk160AF;
    /*0x160B0*/ u8 unk160B0;
    /*0x160B1*/ u8 unk160B1;
    /*0x160B2*/ u8 unk160B2;
    /*0x160B3*/ u8 unk160B3;
    /*0x160B4*/ u8 unk160B4;
    /*0x160B5*/ u8 unk160B5;
    /*0x160B6*/ u8 unk160B6;
    /*0x160B7*/ u8 unk160B7;
    /*0x160B8*/ u8 unk160B8;
    /*0x160B9*/ u8 unk160B9;
    /*0x160BA*/ u8 unk160Ba;
    /*0x160BB*/ u8 unk160Bb;
    /*0x160BC*/ u8 unk160BC;
    /*0x160BD*/ u8 unk160BD;
    /*0x160BE*/ u8 unk160BE;
    /*0x160BF*/ u8 unk160BF;
    /*0x160C0*/ u8 unk160C0;
    /*0x160C1*/ u8 unk160C1;
    /*0x160C2*/ u8 unk160C2;
    /*0x160C3*/ u8 unk160C3;
    /*0x160C4*/ u8 unk160C4;
    /*0x160C5*/ u8 unk160C5;
    /*0x160C6*/ u8 unk160C6;
    /*0x160C7*/ u8 unk160C7;
    /*0x160C8*/ u8 unk160C8;
    /*0x160C9*/ u8 unk160C9;
    /*0x160CA*/ u8 SynchroniseEffect;
    /*0x160CB*/ u8 linkPlayerIndex;
    /*0x160CC*/ u16 UsedHeldItems[4];
    u8 filler2[0x72E];
    /* 0x16A00 */ struct UnkBattleStruct1 unk_2016A00_2;
};

struct DisableStruct
{
    /*0x00*/ u8 filler0[0x3];
    /*0x04*/ u16 DisabledMove;
    /*0x06*/ u16 EncoredMove;
    /*0x08*/ u8 ProtectUses;
    /*0x09*/ u8 StockpileCounter;
    /*0x0A*/ u8 SubstituteHP;
             u8 fillerB[4];
             u8 unkF_0:4;
             u8 unkF_4:4;
             u8 filler10[3];
    /*0x13*/ u8 taunt:4;
    /*0x13*/ u8 unkC:4;
    /*0x14*/ u8 BankPreventingEscape;
    /*0x15*/ u8 BankWithSureHit;
    /*0x16*/ u8 IsFirstTurn;
    /*0x17*/ u8 unk17;
    /*0x18*/ u8 TruantCounter;
    /*0x19*/ u8 RechargeCounter;
    /*0x1A*/ u8 unk1A[2];
};

struct BattleResults
{
    u8 PlayerFaintCounter;    // 0x0
    u8 OpponentFaintCounter;  // 0x1
    u8 unk2;                  // 0x2
    u8 unk3;                  // 0x3
    u8 unk4;                  // 0x4
    u8 unk5_0:1;              // 0x5
    u8 unk5_1:1;              // 0x5
    u16 Poke1Species;         // 0x6
    u8 PokeString1[10];       // 0x8
    u8 unk12;
    u8 BattleTurnCounter;     // 0x13
    u8 PokeString2[10];       // 0x14
    u8 filler1E[2];
    u16 LastOpponentSpecies;  // 0x20
    u16 LastUsedMove;         // 0x22
    u16 OpponentMove;         // 0x24
    u16 OpponentSpecies;      // 0x26
    u16 CaughtPoke;           // 0x28
    u8 CaughtNick[10];        // 0x2A
    u8 filler34[2];
    u8 unk36[10];
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
    u8 unk9_0:1;
};

struct ProtectStruct
{
    /*field0*/
    u32 Protected:1;
    u32 Endured:1;
    u32 OnlyStruggle:1;
    u32 HelpingHand:1;
    u32 BounceMove:1;
    u32 StealMove:1;
    u32 Flag0Unknown:1;
    u32 PrlzImmobility:1;
    /*field1*/
    u32 ConfusionSelfDmg:1;
    u32 NotEffective:1;
    u32 ChargingTurn:1;
    u32 FleeFlag:2; //for RunAway and Smoke Ball
    u32 UsedImprisionedMove:1;
    u32 LoveImmobility:1;
    u32 UsedDisabledMove:1;
    /*field2*/
    u32 UsedTauntedMove:1;
    u32 Flag2Unknown:1;
    u32 FlinchImmobility:1;
    u32 NotFirstStrike:1;
    u32 Free : 4;
    /*field3*/
    u32 field3 : 8;
    u32 PhysicalDmg;
    u32 SpecialDmg;
    u8 PhysicalBank;
    u8 SpecialBank;
    u16 fieldE;
};

struct SpecialStatus
{
    u8 statLowered : 1;
    u8 lightningRodRedirected : 1;
    u8 restoredBankSprite: 1;
    u8 intimidatedPoke : 1;
    u8 traced : 1;
    u8 flag20 : 1;
    u8 flag40 : 1;
    u8 focusBanded : 1;
    u8 field1[3];
    u32 moveturnLostHP;
    u32 moveturnlostHP_physical;
    u32 moveturnLostHP_special;
    u8 moveturnPhysicalBank;
    u8 moveturnSpecialBank;
    u8 field12;
    u8 field13;
};

struct sideTimer
{
    u8 reflectTimer;
    u8 reflectBank;
    u8 lightscreenTimer;
    u8 lightscreenBank;
    u8 mistTimer;
    u8 mistBank;
    u8 safeguardTimer;
    u8 safeguardBank;
    u8 followmeTimer;
    u8 followmeTarget;
    u8 spikesAmount;
    u8 fieldB;
};

struct WishFutureKnock
{
    u8 futureSightCounter[MAX_BANKS_BATTLE];
    u8 futureSightAttacker[MAX_BANKS_BATTLE];
    s32 futureSightDmg[MAX_BANKS_BATTLE];
    u16 futureSightMove[MAX_BANKS_BATTLE];
    u8 wishCounter[MAX_BANKS_BATTLE];
    u8 wishUserBank[MAX_BANKS_BATTLE];
    u8 weatherDuration;
    u8 knockedOffPokes[2];
};

extern struct UnkBattleStruct1 unk_2016A00;
extern struct DisableStruct gDisableStructs[MAX_BANKS_BATTLE];
extern struct BattleResults gBattleResults;
extern struct ProtectStruct gProtectStructs[MAX_BANKS_BATTLE];
extern struct SpecialStatus gSpecialStatuses[MAX_BANKS_BATTLE];
extern struct sideTimer gSideTimer[2];
extern struct WishFutureKnock gWishFutureKnock;
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

// asm/battle_1.o
void sub_800D6D4();
void sub_800D74C();
void sub_800D7B8(void);
void sub_800DAB8();
void sub_800DE30(u8);
void sub_800E23C();

// src/battle_2.o
void sub_800E7C4(void);
void InitBattle(void);
void sub_800EC9C(void);
void sub_800F104(void);
void sub_800F298(void);
void sub_800F808(void);
void sub_800F838(struct Sprite *);
u8 CreateNPCTrainerParty(struct Pokemon *, u16);
void sub_800FCFC(void);
void c2_8011A1C(void);
void sub_80101B8(void);
void c2_081284E0(void);
void sub_8010278(struct Sprite *);
void sub_80102AC(struct Sprite *);
void nullsub_37(struct Sprite *);
void sub_8010320(struct Sprite *);
void sub_8010494(struct Sprite *);
void sub_801053C(struct Sprite *);
void oac_poke_ally_(struct Sprite *);
void nullsub_86(struct Sprite *);
void objc_dp11b_pingpong(struct Sprite *);
void nullsub_41(void);
void sub_8010800(void);
void sub_8010824(void);
void sub_8010874(void);
void bc_8012FAC(void);
void sub_8011384(void);
void bc_801333C(void);
void bc_battle_begin_message(void);
void bc_8013568(void);
void sub_8011800(void);
void sub_8011834(void);
void bc_801362C(void);
void sub_8011970(void);
void sub_80119B4(void);
void BattleBeginFirstTurn(void);
void BattleTurnPassed(void);

// asm/battle_2.o
void sub_8012324(void);
void sub_8012FBC(u8, u8);
u8 b_first_side(u8, u8, u8);
void TurnValuesCleanUp(u8);
void SpecialStatusesClear(void);
void sub_80138F0(void);
void MarkBufferBankForExecution();
void sub_80155A4();
void CancelMultiTurnMoves(u8);
void PrepareStringBattle();
void sub_80156DC();
void sub_80157C4(u8 index);

// asm/battle_3.o
u8 sub_8015A98(u8, u8, u8);
u8 UpdateTurnCounters();
u8 TurnBasedEffects();
u8 sub_80170DC();
u8 sub_80173A4();
u8 AbilityBattleEffects(u8, u8, u8, u8, u16);
u8 sub_801A02C();

// asm/battle_4.o
void AI_CalcDmg(u8, u8);
void TypeCalc(u16, u8, u8);

// asm/battle_5.o
void nullsub_91(void);
void SetBankFuncToPlayerBufferRunCommand(void);
void sub_802C098();
void c3_0802FDF4(u8);
void sub_802E3E4(u8, int);
void nullsub_8(u8);
void sub_802E414(void);

// asm/battle_7.o
void move_anim_start_t4(u8 a, u8 b, u8 c, u8 d);
void nullsub_9(u16);
void nullsub_10(int);
void load_gfxc_health_bar();
u8 battle_load_something();
void sub_8031F88(u8);
void sub_80324F8(struct Pokemon *, u8);
void sub_8032638();
void sub_8032AA8(u8, u8);
void SetBankFuncToOpponentBufferRunCommand(void);

// asm/battle_9.o
void SetBankFuncToLinkOpponentBufferRunCommand(void);

#endif // GUARD_BATTLE_H
