#ifndef GUARD_BATTLE_H
#define GUARD_BATTLE_H

#include "sprite.h"

#define F_TARGET_SELECTED_POKEMON 0
#define F_TARGET_SPECIAL          (1 << 0)
#define F_TARGET_UNK2             (1 << 1)
#define F_TARGET_RANDOM           (1 << 2)
#define F_TARGET_BOTH_ENEMIES     (1 << 3)
#define F_TARGET_USER             (1 << 4)
#define F_TARGET_ALL_EXCEPT_USER  (1 << 5)
#define F_TARGET_ENEMY_SIDE       (1 << 6)

#define F_MAKES_CONTACT           (1 << 0)
#define F_AFFECTED_BY_PROTECT     (1 << 1)
#define F_AFFECTED_BY_MAGIC_COAT  (1 << 2)
#define F_AFFECTED_BY_SNATCH      (1 << 3)
#define F_MIRROR_MOVE_COMPATIBLE  (1 << 4)
#define F_AFFECTED_BY_KINGS_ROCK  (1 << 5)

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

#define BATTLE_TYPE_LINK_DOUBLE     (BATTLE_TYPE_MULTI | BATTLE_TYPE_TRAINER | BATTLE_TYPE_LINK | BATTLE_TYPE_DOUBLE)

#define BATTLE_WON                  0x1
#define BATTLE_LOST                 0x2
#define BATTLE_DREW                 0x3
#define BATTLE_RAN                  0x4
#define BATTLE_PLAYER_TELEPORTED    0x5
#define BATTLE_POKE_FLED            0x6
#define BATTLE_CAUGHT               0x7
#define BATTLE_OPPONENT_TELEPORTED  0xA

#define AI_ACTION_DONE          0x0001
#define AI_ACTION_FLEE          0x0002
#define AI_ACTION_WATCH         0x0004
#define AI_ACTION_DO_NOT_ATTACK 0x0008
#define AI_ACTION_UNK5          0x0010
#define AI_ACTION_UNK6          0x0020
#define AI_ACTION_UNK7          0x0040
#define AI_ACTION_UNK8          0x0080

#define STATUS_SLEEP            0x7
#define STATUS_POISON           0x8
#define STATUS_BURN             0x10
#define STATUS_FREEZE           0x20
#define STATUS_PARALYSIS        0x40
#define STATUS_TOXIC_POISON     0x80
#define STATUS_TOXIC_COUNTER    0xF00

#define STATUS_PSN_ANY          ((STATUS_POISON | STATUS_TOXIC_POISON))
#define STATUS_ANY              ((STATUS_SLEEP | STATUS_POISON | STATUS_BURN | STATUS_FREEZE | STATUS_PARALYSIS | STATUS_TOXIC_POISON))

#define STATUS2_CONFUSION           0x00000007
#define STATUS2_FLINCHED            0x00000008
#define STATUS2_UPROAR              0x00000070
#define STATUS2_BIDE                0x00000300  //two bits 0x100 0x200
#define STATUS2_LOCK_CONFUSE        0x00000C00
#define STATUS2_MULTIPLETURNS       0x00001000
#define STATUS2_WRAPPED             0x0000E000
#define STATUS2_INFATUATION         0x000F0000
#define STATUS2_FOCUS_ENERGY        0x00100000
#define STATUS2_TRANSFORMED         0x00200000
#define STATUS2_RECHARGE            0x00400000
#define STATUS2_RAGE                0x00800000
#define STATUS2_SUBSTITUTE          0x01000000
#define STATUS2_DESTINY_BOND        0x02000000
#define STATUS2_ESCAPE_PREVENTION   0x04000000
#define STATUS2_NIGHTMARE           0x08000000
#define STATUS2_CURSED              0x10000000
#define STATUS2_FORESIGHT           0x20000000
#define STATUS2_DEFENSE_CURL        0x40000000
#define STATUS2_TORMENT             0x80000000

#define STATUS3_LEECHSEED_BANK          0x3
#define STATUS3_LEECHSEED               0x4
#define STATUS3_ALWAYS_HITS             0x18    //two bits
#define STATUS3_PERISH_SONG             0x20
#define STATUS3_ON_AIR                  0x40
#define STATUS3_UNDERGROUND             0x80
#define STATUS3_MINIMIZED               0x100
#define STATUS3_ROOTED                  0x400
#define STATUS3_CHARGED_UP              0x200
#define STATUS3_YAWN                    0x1800  //two bits
#define STATUS3_IMPRISIONED             0x2000
#define STATUS3_GRUDGE                  0x4000
#define STATUS3_CANT_SCORE_A_CRIT       0x8000
#define STATUS3_MUDSPORT                0x10000
#define STATUS3_WATERSPORT              0x20000
#define STATUS3_UNDERWATER              0x40000
#define STATUS3_INTIMIDATE_POKES        0x80000
#define STATUS3_TRACE                   0x100000

#define STATUS3_SEMI_INVULNERABLE       ((STATUS3_UNDERGROUND | STATUS3_ON_AIR | STATUS3_UNDERWATER))

#define HITMARKER_x20                   0x00000020
#define HITMARKER_DESTINYBOND           0x00000040
#define HITMARKER_NO_ANIMATIONS         0x00000080
#define HITMARKER_IGNORE_SUBSTITUTE     0x00000100
#define HITMARKER_NO_ATTACKSTRING       0x00000200
#define HITMARKER_ATTACKSTRING_PRINTED  0x00000400
#define HITMARKER_NO_PPDEDUCT           0x00000800
#define HITMARKER_PURSUIT_TRAP          0x00001000
#define HITMARKER_IGNORE_SAFEGUARD      0x00002000
#define HITMARKER_SYNCHRONISE_EFFECT    0x00004000
#define HITMARKER_IGNORE_ON_AIR         0x00010000
#define HITMARKER_IGNORE_UNDERGROUND    0x00020000
#define HITMARKER_IGNORE_UNDERWATER     0x00040000
#define HITMARKER_UNABLE_TO_USE_MOVE    0x00080000
#define HITMARKER_x100000               0x00100000
#define HITMARKER_x200000               0x00200000
#define HITMARKER_x400000               0x00400000
#define HITMARKER_x800000               0x00800000
#define HITMARKER_GRUDGE                0x01000000
#define HITMARKER_OBEYS                 0x02000000
#define HITMARKER_x8000000              0x08000000
#define HITMARKER_FAINTED(bank)         ((gBitTable[bank] << 0x1C))
#define HITMARKER_UNK(bank)             ((0x10000000 << bank))

#define SIDE_STATUS_REFLECT          (1 << 0)
#define SIDE_STATUS_LIGHTSCREEN      (1 << 1)
#define SIDE_STATUS_X4               (1 << 2)
#define SIDE_STATUS_SPIKES           (1 << 4)
#define SIDE_STATUS_SAFEGUARD        (1 << 5)
#define SIDE_STATUS_FUTUREATTACK     (1 << 6)
#define SIDE_STATUS_MIST             (1 << 8)
#define SIDE_STATUS_SPIKES_DAMAGED   (1 << 9)

#define ABILITYEFFECT_ON_SWITCHIN         0x0
#define ABILITYEFFECT_ENDTURN             0x1
#define ABILITYEFFECT_MOVES_BLOCK         0x2
#define ABILITYEFFECT_ABSORBING           0x3
#define ABILITYEFFECT_CONTACT             0x4
#define ABILITYEFFECT_IMMUNITY            0x5
#define ABILITYEFFECT_FORECAST            0x6
#define ABILITYEFFECT_SYNCHRONIZE         0x7
#define ABILITYEFFECT_ATK_SYNCHRONIZE     0x8
#define ABILITYEFFECT_INTIMIDATE1         0x9
#define ABILITYEFFECT_INTIMIDATE2         0xA
#define ABILITYEFFECT_TRACE               0xB
#define ABILITYEFFECT_CHECK_OTHER_SIDE    0xC
#define ABILITYEFFECT_CHECK_BANK_SIDE     0xD
#define ABILITYEFFECT_FIELD_SPORT         0xE
#define ABILITYEFFECT_CHECK_FIELD_EXCEPT_BANK   0xF
#define ABILITYEFFECT_COUNT_OTHER_SIZE    0x10
#define ABILITYEFFECT_COUNT_BANK_SIDE     0x11
#define ABILITYEFFECT_COUNT_ON_FIELD      0x12
#define ABILITYEFFECT_CHECK_ON_FIELD      0x13

#define WEATHER_HAS_EFFECT ((!AbilityBattleEffects(ABILITYEFFECT_CHECK_ON_FIELD, 0, ABILITY_CLOUD_NINE, 0, 0) && !AbilityBattleEffects(ABILITYEFFECT_CHECK_ON_FIELD, 0, ABILITY_AIR_LOCK, 0, 0)))

#define MOVESTATUS_MISSED             (1 << 0)
#define MOVESTATUS_SUPEREFFECTIVE     (1 << 1)
#define MOVESTATUS_NOTVERYEFFECTIVE   (1 << 2)
#define MOVESTATUS_NOTAFFECTED        (1 << 3)
#define MOVESTATUS_ONEHITKO           (1 << 4)
#define MOVESTATUS_FAILED             (1 << 5)
#define MOVESTATUS_ENDURED            (1 << 6)
#define MOVESTATUS_HUNGON             (1 << 7)

#define MOVESTATUS_NOEFFECT ((MOVESTATUS_MISSED | MOVESTATUS_NOTAFFECTED | MOVESTATUS_FAILED))

#define MAX_TRAINER_ITEMS 4
#define MAX_MON_MOVES 4
#define MAX_BANKS_BATTLE 4

#define WEATHER_RAIN_TEMPORARY      (1 << 0)
#define WEATHER_RAIN_DOWNPOUR       (1 << 1)
#define WEATHER_RAIN_PERMANENT      (1 << 2)
#define WEATHER_RAIN_ANY ((WEATHER_RAIN_TEMPORARY | WEATHER_RAIN_DOWNPOUR | WEATHER_RAIN_PERMANENT))
#define WEATHER_SANDSTORM_TEMPORARY (1 << 3)
#define WEATHER_SANDSTORM_PERMANENT (1 << 4)
#define WEATHER_SANDSTORM_ANY ((WEATHER_SANDSTORM_TEMPORARY | WEATHER_SANDSTORM_PERMANENT))
#define WEATHER_SUN_TEMPORARY       (1 << 5)
#define WEATHER_SUN_PERMANENT       (1 << 6)
#define WEATHER_SUN_ANY ((WEATHER_SUN_TEMPORARY | WEATHER_SUN_PERMANENT))
#define WEATHER_HAIL                (1 << 7)

// status animation table
#define B_ANIM_STATUS_PSN               0x0
#define B_ANIM_STATUS_CONFUSION         0x1
#define B_ANIM_STATUS_BRN               0x2
#define B_ANIM_STATUS_INFATUATION       0x3
#define B_ANIM_STATUS_SLP               0x4
#define B_ANIM_STATUS_PRZ               0x5
#define B_ANIM_STATUS_FRZ               0x6
#define B_ANIM_STATUS_CURSED            0x7
#define B_ANIM_STATUS_NIGHTMARE         0x8
#define B_ANIM_STATUS_WRAPPED           0x9

// general animation table
#define B_ANIM_CASTFORM_CHANGE          0x0
#define B_ANIM_STATS_CHANGE             0x1
#define B_ANIM_SUBSTITUTE_FADE          0x2
#define B_ANIM_SUBSTITUTE_APPEAR        0x3
#define B_ANIM_POKEBLOCK_THROW          0x4
#define B_ANIM_ITEM_KNOCKOFF            0x5
#define B_ANIM_TURN_TRAP                0x6
#define B_ANIM_ITEM_EFFECT              0x7
#define B_ANIM_SMOKEBALL_ESCAPE         0x8
#define B_ANIM_HANGED_ON                0x9
#define B_ANIM_RAIN_CONTINUES           0xA
#define B_ANIM_SUN_CONTINUES            0xB
#define B_ANIM_SANDSTORM_CONTINUES      0xC
#define B_ANIM_HAIL_CONTINUES           0xD
#define B_ANIM_LEECH_SEED_DRAIN         0xE
#define B_ANIM_MON_HIT                  0xF
#define B_ANIM_ITEM_STEAL               0x10
#define B_ANIM_SNATCH_MOVE              0x11
#define B_ANIM_FUTURE_SIGHT_HIT         0x12
#define B_ANIM_DOOM_DESIRE_HIT          0x13
#define B_ANIM_FOCUS_PUNCH_SET_UP       0x14
#define B_ANIM_INGRAIN_HEAL             0x15
#define B_ANIM_WISH_HEAL                0x16

// special animation table
#define B_ANIM_LVL_UP                   0x0
#define B_ANIM_SWITCH_OUT_PLAYER_MON    0x1
#define B_ANIM_SWITCH_OUT_OPPONENT_MON  0x2
#define B_ANIM_BALL_THROW               0x3
#define B_ANIM_SAFARI_BALL_THROW        0x4
#define B_ANIM_SUBSTITUTE_TO_MON        0x5
#define B_ANIM_MON_TO_SUBSTITUTE        0x6

enum
{
    BATTLE_TERRAIN_GRASS,
    BATTLE_TERRAIN_LONG_GRASS,
    BATTLE_TERRAIN_SAND,
    BATTLE_TERRAIN_UNDERWATER,
    BATTLE_TERRAIN_WATER,
    BATTLE_TERRAIN_POND,
    BATTLE_TERRAIN_MOUNTAIN,
    BATTLE_TERRAIN_CAVE,
    BATTLE_TERRAIN_BUILDING,
    BATTLE_TERRAIN_PLAIN,
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
    /*0x00000*/ u8 unk0;
    /*0x00001*/ bool8 unk1;
    /*0x00002*/ u8 unk2;
    /*0x00003*/ bool8 unk3;
    u8 filler4[0x15DDA];
    /*0x15DDE*/ u8 unk15DDE;
    /*0x15DDF*/ u8 unk15DDF;
    /*0x15DE0*/ u8 filler15DE0[0x220];
    /*0x16000*/ u8 turnEffectsTracker;
    /*0x16001*/ u8 turnEffectsBank;
    /*0x16002*/ u8 animTurn;
    /*0x16003*/ u8 scriptingActive;
    /*0x16004*/ u8 wrappedMove[8];
    /*0x1600C*/ u8 cmd49StateTracker;
    /*0x1600D*/ u8 unk1600D;
    /*0x1600E*/ u8 turncountersTracker;
    /*0x1600F*/ u8 getexpStateTracker;
    /*0x16010*/ u8 moveTarget[4];
    /*0x16014*/ u8 unk16014;
    /*0x16015*/ u8 unk16015;
    /*0x16016*/ u8 unk16016;
    /*0x16017*/ u8 unk16017;
    /*0x16018*/ u8 expGetterID;
    /*0x16019*/ u8 unk16019;
    /*0x1601A*/ u8 atk5A_StateTracker; //also atk5B, statetracker
    /*0x1601B*/ u8 wildVictorySong;
    /*0x1601C*/ u8 dynamicMoveType;
    /*0x1601D*/ u8 unk1601D;
    /*0x1601E*/ u8 statChanger;
    /*0x1601F*/ u8 dmgMultiplier;
    /*0x16020*/ u8 wrappedBy[4];
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
    /*0x16056*/ u8 moneyMultiplier;
    /*0x16057*/ u8 unk16057;
    /*0x16058*/ u8 unk16058;
    /*0x16059*/ u8 sub80173A4_Tracker;
    /*0x1605A*/ u8 unk1605A;
    /*0x1605B*/ u8 unk1605B;
    /*0x1605C*/ u16 exp;
    /*0x1605E*/ u8 unk1605E;
    /*0x1605F*/ u8 sentInPokes;
    /*0x16060*/ u8 unk16060[4];
    /*0x16064*/ u8 unk16064[4];
    /*0x16068*/ u8 unk16068[4];
    /*0x1606C*/ u8 unk1606C[4][3];
    /*0x16078*/ u8 unk16078;
    /*0x16079*/ u8 caughtNick[11];
    /*0x16084*/ u8 unk16084;
    /*0x16085*/ u8 unk16085;
    /*0x16086*/ u8 unk16086;
    /*0x16087*/ u8 unk16087;
    /*0x16088*/ u8 safariFleeRate;
    /*0x16089*/ u8 unk16089;
    /*0x1608A*/ u8 unk1608A;
    /*0x1608B*/ u8 unk1608B;
    /*0x1608C*/ u8 ChosenMoveID[4];
    /*0x16090*/ s32 bideDmg;
    /*0x16094*/ u8 unk16094;
    /*0x16095*/ u8 unk16095;
    /*0x16096*/ u8 unk16096;
    /*0x16097*/ u8 unk16097;
    /*0x16098*/ u8 unk16098;
    /*0x16099*/ u8 unk16099;
    /*0x1609A*/ u8 unk1609a;
    /*0x1609B*/ u8 castformToChangeInto;
    /*0x1609C*/ u8 atk6C_statetracker;
    /*0x1609D*/ u8 unk1609D;
    /*0x1609E*/ u8 unk1609E;
    /*0x1609F*/ u8 unk1609F;
    /*0x160A0*/ u8 stringMoveType;
    /*0x160A1*/ u8 animTargetsHit;
    /*0x160A2*/ u8 expGetterBank;
    /*0x160A3*/ u8 unk160A3;
    /*0x160A4*/ u8 animArg1;
    /*0x160A5*/ u8 animArg2;
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
    /*0x160BC*/ u16 HP_OnSwitchout[2];
    /*0x160C0*/ u8 unk160C0;
    /*0x160C1*/ u8 hpScale;
    /*0x160C2*/ u8 unk160C2;
    /*0x160C3*/ u8 unk160C3;
    /*0x160C4*/ u8 unk160C4;
    /*0x160C5*/ u8 unk160C5;
    /*0x160C6*/ u8 unk160C6;
    /*0x160C7*/ u8 unk160C7;
    /*0x160C8*/ u8 unk160C8;
    /*0x160C9*/ u8 unk160C9;
    /*0x160CA*/ u8 synchroniseEffect;
    /*0x160CB*/ u8 linkPlayerIndex;
    /*0x160CC*/ u16 usedHeldItems[4];
    /*0x160D4*/ u8 unk160D4;
    /*0x160D5*/ u8 unk160D5;
    /*0x160D6*/ u8 unk160D6;
    /*0x160D7*/ u8 unk160D7;
    /*0x160D8*/ u8 unk160D8;
    /*0x160D9*/ u8 unk160D9;
    /*0x160DA*/ u8 unk160DA;
    /*0x160DB*/ u8 unk160DB;
    /*0x160DC*/ u8 unk160DC;
    /*0x160DD*/ u8 intimidateBank;
    /*0x160DE*/ u8 unk160DE;
    /*0x160DF*/ u8 unk160DF;
    /*0x160E0*/ u8 unk160E0;
    /*0x160E1*/ u8 unk160E1;
    /*0x160E2*/ u8 unk160E2;
    /*0x160E3*/ u8 unk160E3;
    /*0x160E4*/ u8 unk160E4;
    /*0x160E5*/ u8 unk160E5;
    /*0x160E6*/ u8 unk160E6;
    /*0x160E7*/ u8 atkCancellerTracker;
    /*0x160E8*/ u8 unk160E8;
    /*0x160E9*/ u8 unk160E9;
    /*0x160EA*/ u8 unk160EA;
    /*0x160EB*/ u8 unk160EB;
    /*0x160EC*/ u8 unk160EC;
    /*0x160ED*/ u8 unk160ED;
    /*0x160EE*/ u8 unk160EE;
    /*0x160EF*/ u8 unk160EF;
    /*0x160F0*/ u8 unk160F0;
    /*0x160F1*/ u8 unk160F1;
    /*0x160F2*/ u8 unk160F2;
    /*0x160F3*/ u8 unk160F3;
    /*0x160F4*/ u8 unk160F4;
    /*0x160F5*/ u8 unk160F5;
    /*0x160F6*/ u8 unk160F6;
    /*0x160F7*/ u8 unk160F7;
    /*0x160F8*/ u8 unk160F8;
    /*0x160F9*/ u8 unk160F9;
    /*0x160FA*/ u8 unk160FA;
    /*0x160FB*/ u8 unk160FB;
    /*0x160FC*/ u8 turnSideTracker;
    /*0x160FD*/ u8 unk160FD;
    /*0x160FE*/ u8 unk160FE;
    /*0x160FF*/ u8 unk160FF;
	/*0x16100*/ u8 unk16100;
    /*0x16101*/ u8 unk16101;
    /*0x16102*/ u8 unk16102;
    /*0x16103*/ u8 unk16103;
    /*0x16104*/ u8 unk16104;
    /*0x16105*/ u8 unk16105;
    /*0x16106*/ u8 unk16106;
    /*0x16107*/ u8 unk16107;
    /*0x16108*/ u8 unk16108;
    /*0x16109*/ u8 unk16109;
    /*0x1610A*/ u8 unk1610A;
    /*0x1610B*/ u8 unk1610B;
    /*0x1610C*/ u8 unk1610C;
    /*0x1610D*/ u8 unk1610D;
    /*0x1610E*/ u8 unk1610E;
    /*0x1610F*/ u8 unk1610F;
    /*0x16110*/ u8 sub80170DC_Tracker;
    /*0x16111*/ u8 sub80170DC_Bank;
    /*0x16112*/ u8 unk16112;
    /*0x16113*/ u8 unk16113;
    /*0x16114*/ u8 unk16114;
    /*0x16115*/ u8 unk16115;
    /*0x16116*/ u8 unk16116;
    /*0x16117*/ u8 unk16117;
    /*0x16118*/ u8 unk16118;
    /*0x16119*/ u8 unk16119;
    /*0x1611A*/ u8 unk1611A;
    /*0x1611B*/ u8 unk1611B;
    /*0x1611C*/ u8 unk1611C;
    /*0x1611D*/ u8 unk1611D;
    /*0x1611E*/ u8 unk1611E;
    /*0x1611F*/ u8 unk1611F;

    //u8 filler2[0x72E];
    /* 0x16A00 */ struct UnkBattleStruct1 unk_2016A00_2;
};

struct DisableStruct
{
    /*0x00*/ u32 unk0;
    /*0x04*/ u16 disabledMove;
    /*0x06*/ u16 encoredMove;
    /*0x08*/ u8 protectUses;
    /*0x09*/ u8 stockpileCounter;
    /*0x0A*/ u8 substituteHP;
    /*0x0B*/ u8 disableTimer1 : 4;
    /*0x0B*/ u8 disableTimer2 : 4;
    /*0x0C*/ u8 encoredMovePos;
    /*0x0D*/ u8 unkD;
    /*0x0E*/ u8 encoreTimer1 : 4;
    /*0x0E*/ u8 encoreTimer2 : 4;
    /*0x0F*/ u8 perishSong1 : 4;
    /*0x0F*/ u8 perishSong2 : 4;
    /*0x10*/ u8 furyCutterCounter;
    /*0x11*/ u8 rolloutTimer1 : 4;
    /*0x11*/ u8 rolloutTimer2 : 4;
    /*0x12*/ u8 chargeTimer1 : 4;
    /*0x12*/ u8 chargeTimer2 : 4;
    /*0x13*/ u8 tauntTimer1:4;
    /*0x13*/ u8 tauntTimer2:4;
    /*0x14*/ u8 bankPreventingEscape;
    /*0x15*/ u8 bankWithSureHit;
    /*0x16*/ u8 isFirstTurn;
    /*0x17*/ u8 unk17;
    /*0x18*/ u8 truantCounter : 1;
    /*0x18*/ u8 unk18_a : 3;
    /*0x18*/ u8 unk18_b : 4;
    /*0x19*/ u8 rechargeCounter;
    /*0x1A*/ u8 unk1A[2];
};

struct BattleResults
{
    u8 playerFaintCounter;    // 0x0
    u8 opponentFaintCounter;  // 0x1
    u8 unk2;                  // 0x2
    u8 unk3;                  // 0x3
    u8 unk4;                  // 0x4
    u8 unk5_0:1;              // 0x5
    u8 unk5_1:1;              // 0x5
    u16 poke1Species;         // 0x6
    u8 pokeString1[10];       // 0x8
    u8 unk12;
    u8 battleTurnCounter;     // 0x13
    u8 pokeString2[10];       // 0x14
    u8 filler1E[2];
    u16 lastOpponentSpecies;  // 0x20
    u16 lastUsedMove;         // 0x22
    u16 opponentMove;         // 0x24
    u16 opponentSpecies;      // 0x26
    u16 caughtPoke;           // 0x28
    u8 caughtNick[10];        // 0x2A
    u8 filler34[2];
    u8 unk36[10];  // usedBalls?
};

struct Struct2017100
{
    u32 arr[4];
};

struct Struct2019348
{
    u16 unk0;
    u16 unk2;
    u8 unk4;
    u32 unk8;
    u32 unkC;
    u32 unk10;
};

struct Struct2017800
{
    u8 invisible:1;
    u8 unk0_1:1;
    u8 substituteSprite:1;
    u8 unk0_3:1;
    u8 unk0_4:1;
    u16 transformedSpecies;
};

struct Struct2017810
{
 /*0x00*/ u8 unk0_0:1;
 /*0x00*/ u8 unk0_1:1;
 /*0x00*/ u8 unk0_2:1;
 /*0x00*/ u8 unk0_3:1;
 /*0x00*/ u8 unk0_4:1;
 /*0x00*/ u8 unk0_5:1;
 /*0x00*/ u8 unk0_6:1;
 /*0x00*/ u8 unk0_7:1;
 /*0x01*/ u8 unk1_0:1;
 /*0x01*/ u8 unk1_1:5;
 /*0x02*/ u8 unk2;
 /*0x03*/ u8 unk3;
 /*0x04*/ u8 unk4;
 /*0x05*/ u8 unk5;
 /*0x06*/ u8 unk6;
 /*0x07*/ u8 unk7;
 /*0x08*/ u8 unk8;
 /*0x09*/ u8 unk9;
 /*0x0A*/ u8 fillerA[2];
};

struct Struct2017840
{
    u16 unk0;
    u8 filler2[6];
    u8 unk8;
    u8 unk9_0:1;
};

struct Struct20238C8
{
    u8 unk0_0:7;
    u8 unk0_7:1;
};

struct ProtectStruct
{
    /*field0*/
    u32 protected:1;
    u32 endured:1;
    u32 onlyStruggle:1;
    u32 helpingHand:1;
    u32 bounceMove:1;
    u32 stealMove:1;
    u32 flag0Unknown:1;
    u32 prlzImmobility:1;
    /*field1*/
    u32 confusionSelfDmg:1;
    u32 notEffective:1;
    u32 chargingTurn:1;
    u32 fleeFlag:2; //for RunAway and Smoke Ball
    u32 usedImprisionedMove:1;
    u32 loveImmobility:1;
    u32 usedDisabledMove:1;
    /*field2*/
    u32 usedTauntedMove:1;
    u32 flag2Unknown:1;
    u32 flinchImmobility:1;
    u32 notFirstStrike:1;
    u32 free : 4;
    /*field3*/
    u32 field3 : 8;
    u32 physicalDmg;
    u32 specialDmg;
    u8 physicalBank;
    u8 specialBank;
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
    s32 moveturnLostHP;
    s32 moveturnLostHP_physical;
    s32 moveturnLostHP_special;
    u8 moveturnPhysicalBank;
    u8 moveturnSpecialBank;
    u8 field12;
    u8 field13;
};

struct sideTimer
{
    u8 reflectTimer;        //0x0
    u8 lightscreenTimer;    //0x1
    u8 mistTimer;           //0x2
    u8 field3;              //0x3
    u16 field4;              //0x4
    u8 spikesAmount;        //0x6
    u8 safeguardTimer;      //0x7
    u8 followmeTimer;       //0x8
    u8 followmeTarget;      //0x9
    u8 fieldA;              //0xA
    u8 fieldB;              //0xB
};

struct WishFutureKnock
{
    u8 futureSightCounter[MAX_BANKS_BATTLE];
    u8 futureSightAttacker[MAX_BANKS_BATTLE];
    s32 futureSightDmg[MAX_BANKS_BATTLE];
    u16 futureSightMove[MAX_BANKS_BATTLE];
    u8 wishCounter[MAX_BANKS_BATTLE];
    u8 wishUserID[MAX_BANKS_BATTLE];
    u8 weatherDuration;
    u16 knockedOffPokes;
};

extern struct UnkBattleStruct1 unk_2016A00;
extern struct DisableStruct gDisableStructs[MAX_BANKS_BATTLE];
extern struct BattleResults gBattleResults;
extern struct ProtectStruct gProtectStructs[MAX_BANKS_BATTLE];
extern struct SpecialStatus gSpecialStatuses[MAX_BANKS_BATTLE];
extern struct sideTimer gSideTimer[2];
extern struct WishFutureKnock gWishFutureKnock;
extern struct AI_ThinkingStruct gAIThinkingSpace;
extern struct Struct20238C8 gUnknown_020238C8;

// used in many battle files, it seems as though Hisashi Sogabe wrote
// some sort of macro to replace the use of actually calling memset.
// Perhaps it was thought calling memset was much slower?

// The compiler wont allow us to locally declare ptr in this macro; some
// functions that invoke this macro will not match without this egregeous
// assumption about the variable names, so in order to avoid this assumption,
// we opt to pass the variables themselves, even though it is likely that
// Sogabe assumed the variables were named src and dest. Trust me: I tried to
// avoid assuming variable names, but the ROM just will not match without the
// assumptions. Therefore, these macros are bad practice, but I'm putting them
// here anyway.
#define MEMSET_ALT(data, c, size, var, dest)    \
{    \
    dest = (u8 *)data;    \
    for(var = 0; var < (u32)size; var++)    \
        dest[var] = c;    \
}    \

#define MEMCPY_ALT(data, dest, size, var, src)    \
{    \
    src = (u8 *)data;    \
    for(var = 0; var < (u32)size; var++)    \
        dest[var] = src[var];    \
}    \

typedef void (*BattleCmdFunc)(void);

struct funcStack
{
    void* ptr[8];
    u8 size;
};

struct scriptsStack
{
    u8* ptr[8];
    u8 size;
};

extern u8 gBattleTextBuff1[];

//function declarations of buffer emits
void EmitGetAttributes(u8 buffID, u8 request, u8 c);    //0x0
void Emitcmd1(u8 a, u8 b, u8 c); //0x1
void EmitSetAttributes(u8 a, u8 request, u8 c, u8 bytes, void *data);  //0x2
void EmitSendOutPoke(u8 a, u8 b, u8 c); //0x5
void EmitReturnPokeToBall(u8 a, u8 b); //0x6
void EmitTrainerSlide(u8 a); //0x8
void Emitcmd10(u8 a);  //0xA
void EmitBallThrow(u8 a, u8 shakes);  //0xD
//void EmitMoveAnimation(u8 a, u16 move, u8 turn, u16 power, s32 dmg, u8 happiness, void *disable_struct); //0xF
void EmitPrintString(u8 a, u16 stringID);  //0x10
//void EmitPrintStringPlayerOnly(u8 a, u16 stringID); //0x11
void EmitChoosePokemon(u8 a, u8 b, u8 c, u8 d, u8 *e); //0x16
//void EmitHealthBarUpdate(u8 a, u16 b); //0x18; Had to declare the second arg as u16 because s16 wont match in atk0b
//void EmitExpBarUpdate(u8 a, u8 b, u16 c); //0x19
void EmitStatusIconUpdate(u8 a, u32 b, u32 c); //0x1A
void EmitStatusAnimation(u8 a, u8 b, u32 c); //0x1B
void EmitStatusXor(u8 a, u8 b); //0x1C
void EmitHitAnimation(u8 a); //0x29
void EmitEffectivenessSound(u8 a, u16 sound); //0x2B
void Emitcmd44(u8 a, u16 sound);    //0x2C
void EmitFaintingCry(u8 a); //0x2D
void EmitIntroSlide(u8 a, u8 b); //0x2E
void Emitcmd49(u8 a);  //0x31
void EmitSpriteInvisibility(u8 a, u8 b); //0x33
void EmitBattleAnimation(u8 a, u8 b, u16 c); //0x34
void EmitResetActionMoveSelection(u8 a, u8 b); //0x36
void Emitcmd55(u8 a, u8 b); //0x37

#define REQUEST_ALL_BATTLE      0x0
#define REQUEST_SPECIES_BATTLE  0x1
#define REQUEST_HELDITEM_BATTLE 0x2
#define REQUEST_MOVES_PP_BATTLE 0x3
#define REQUEST_PPMOVE1_BATTLE  0x9
#define REQUEST_PPMOVE2_BATTLE  0xA
#define REQUEST_PPMOVE3_BATTLE  0xB
#define REQUEST_PPMOVE4_BATTLE  0xC
#define REQUEST_STATUS_BATTLE   0x28
#define REQUEST_HP_BATTLE       0x2A

void MarkBufferBankForExecution(u8 bank);

extern u8 gBattleTextBuff1[];

// asm/battle_1.o
void sub_800D6D4();
void sub_800D74C();
void DrawMainBattleBackground(void);
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
u8 GetWhoStrikesFirst(u8, u8, u8);
void TurnValuesCleanUp(u8);
void SpecialStatusesClear(void);
void sub_80138F0(void);
void sub_80155A4();
void CancelMultiTurnMoves(u8 bank);
void PrepareStringBattle();
void sub_80156DC();
void sub_80157C4(u8 index);

// asm/battle_3.o
u8 CheckMoveLimitations(u8 bank, u8 unusableMoves, u8 check);
u8 UpdateTurnCounters(void);
u8 TurnBasedEffects(void);
u8 sub_80170DC();
u8 sub_80173A4();
u8 AbilityBattleEffects(u8 caseID, u8 bank, u8 ability, u8 special, u16 move);
u8 ItemBattleEffects(u8 caseID, u8 bank, bool8 moveTurn);

// asm/battle_4.o
void AI_CalcDmg(u8, u8);
u8 TypeCalc(u16 move, u8 bank_atk, u8 bank_def);

// asm/battle_5.o
void nullsub_91(void);
void SetBankFuncToPlayerBufferRunCommand(void);
void sub_802C098();
void c3_0802FDF4(u8);
void sub_802E3E4(u8, int);
void nullsub_8(u8);
void sub_802E414(void);
void sub_802E424(void);

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
