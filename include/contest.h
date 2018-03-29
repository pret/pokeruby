#ifndef GUARD_CONTEST_H
#define GUARD_CONTEST_H

enum
{
    CONTEST_CATEGORY_COOL,
    CONTEST_CATEGORY_BEAUTY,
    CONTEST_CATEGORY_CUTE,
    CONTEST_CATEGORY_SMART,
    CONTEST_CATEGORY_TOUGH,
};

enum
{
    CONTEST_EFFECT_HIGHLY_APPEALING,
    CONTEST_EFFECT_USER_MORE_STARTLED,
    CONTEST_EFFECT_APPEAL_ONLY_ONCE,
    CONTEST_EFFECT_REPEATABLE,
    CONTEST_EFFECT_AVOID_STARTLE_ONCE,
    CONTEST_EFFECT_AVOID_STARTLE,
    CONTEST_EFFECT_AVOID_STARTLE_LITTLE,
    //...
};

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
    /*0x15*/ u8 trainerGfxId;
    /*0x18*/ u32 flags;
    /*0x1C*/ u8 whichRank:2;
             u8 aiPool_Cool:1;
             u8 aiPool_Beauty:1;
             u8 aiPool_Cute:1;
             u8 aiPool_Smart:1;
             u8 aiPool_Tough:1;
    /*0x1E*/ u16 moves[4]; // moves
    /*0x26*/ u8 cool; // cool
    /*0x27*/ u8 beauty; // beauty
    /*0x28*/ u8 cute; // cute
    /*0x29*/ u8 smart; // smart
    /*0x2A*/ u8 tough; // tough
    /*0x2B*/ u8 sheen; // sheen
    /*0x2C*/ u8 unk2C[12];
    /*0x38*/ u32 personality;  // personality
    /*0x3C*/ u32 otId;  // otId
}; // wow

struct ContestAIInfo {
 /*0x00*/ u8 aiState;
 /*0x02*/ u16 unk2;
 /*0x04*/ u8 unk4;
 /*0x05*/ u8 unk5[4];
 /*0x09*/ u8 aiAction;
 /*0x0A*/ u8 fillerA[0x6]; // TODO: don't know what's here
 /*0x10*/ u8 unk10;
 /*0x14*/ u32 flags;
 /*0x18*/ s16 scriptResult;
 /*0x1A*/ s16 scriptArr[3];
 /*0x20*/ u32 stack[8];
 /*0x40*/ u8 unk40;
 /*0x41*/ u8 unk41;
};

extern struct ContestPokemon gContestMons[];
extern const struct ContestMove gContestMoves[];
extern const struct ContestEffect gContestEffects[];
extern const u8 *const gContestEffectStrings[];

void ResetLinkContestBoolean(void);
void LoadContestBgAfterMoveAnim(void);
void CB2_StartContest(void);
void Contest_CreatePlayerMon(u8);
void Contest_InitAllPokemon(u8, u8);
u8 sub_80AE47C(struct Pokemon *party);
u16 sub_80AE770(u8, u8);
void sub_80AE82C(u8);
u8 IsSpeciesNotUnown(u16);
void sub_80AF668(void);
void sub_80B0F28(u8);
bool8 Contest_SaveWinner(u8);
u8 sub_80B2C4C(u8, u8);
void Contest_ResetWinners(void);
s8 Contest_GetMoveExcitement(u16);

// Contest Shared EWRAM

struct Shared18000
{
    /*0x18000*/ u8 unk18000;
    /*0x18001*/ u8 filler18001[3];
    /*0x18004*/ u16 unk18004[16][16];
    /*0x18204*/ u16 unk18204[0x200];
    /*0x18604*/ u16 unk18604[0x200];
    /*0x18A04*/ u8 unk18A04[0x800];
};

struct Contest
{
    /*0x19204*/ u8 playerMoveChoice;
    /*0x19205*/ u8 turnNumber;
    /*0x19206*/ u8 unk19206[4];    // seems to only be used by an unref function
    /*0x1920A*/ u16 unk1920A_0:1;  // Task active flags?
                u16 unk1920A_1:1;
                u16 unk1920A_2:1;
                u16 unk1920A_3:1;
                u16 unk1920A_4:1;
                u16 unk1920A_5:1;
                u16 unk1920A_6:1;
                u16 unk1920A_7:1;
    /*0x1920B*/ u16 unk1920B_0:1;
                u16 unk1920B_1:1;
                u16 unk1920B_2:1;
    /*0x1920C*/ u8 mainTaskId;
    /*0x1920D*/ u8 unk1920D[4];
    /*0x19211*/ u8 unk19211;
    /*0x19212*/ u8 unk19212;
    /*0x19213*/ u8 filler19213;
    /*0x19214*/ u8 unk19214;
    /*0x19215*/ u8 unk19215;
    /*0x19216*/ u8 unk19216;    // sprite ID
    /*0x19217*/ s8 applauseLevel;
    /*0x19218*/ u8 unk19218[4];
    /*0x1921C*/ u32 unk1921C;   // saved RNG value?
                u16 unk19220[5][4];  // move history?
                u8 unk19248[5][4];  // excitement history
                u8 applauseMeterSpriteId;    // sprite ID
    /*0x1925D*/ u8 unk1925D;
    /*0x1925E*/ u8 unk1925E;
};

struct ContestantStatus
{
 /*0x00*/ s16 appeal1;  // move appeal?
 /*0x02*/ s16 appeal2;  // final appeal after end of turn, maybe?
 /*0x04*/ s16 unk4;
 /*0x06*/ u16 currMove;
 /*0x08*/ u16 prevMove;
 /*0x0A*/ u8 moveCategory;
 /*0x0B*/ u8 unkB_0:2;
          u8 unkB_2:2;
          u8 moveRepeatCount:3;
          u8 unkB_7:1;  // used a one-time move?
 /*0x0C*/ u8 unkC_0:1;
          u8 unkC_1:2;
 /*0x0D*/ s8 unkD;
 /*0x0E*/ u8 unkE;
 /*0x0F*/ u8 unkF;
 /*0x10*/ u8 unk10_0:1;
          u8 unk10_1:1;
          u8 unk10_2:1;
          u8 unk10_3:1;
          u8 unk10_4:2;
          u8 unk10_6:2;
 /*0x11*/ u8 unk11_0:2;
          u8 unk11_2:1;
          u8 unk11_3:1;
          u8 unk11_4:1;
          u8 unk11_5:1;
 /*0x12*/ u8 unk12;
 /*0x13*/ u8 unk13;   // status action?
 /*0x14*/ u8 unk14;
 /*0x15*/ u8 disappointedRepeat:1;
          u8 unk15_1:1;
          u8 unk15_2:1;
          u8 unk15_3:1;
          u8 unk15_4:1;
          u8 unk15_5:1;
          u8 unk15_6:1;
 /*0x16*/ u8 unk16;
 /*0x17*/ u8 unk17;
 /*0x18*/ u8 unk18;
 /*0x19*/ u8 unk19;  // turn position
 /*0x1A*/ u8 attentionLevel;  // How much the Pokemon "stood out"
 /*0x1B*/ u8 unk1B;
};

struct UnknownContestStruct3
{
    u8 unk0;
    u8 unk1;
    //u8 unk2_0:1;
    //u8 unk2_1:1;
    u8 unk2;  // maybe a bitfield
    u8 filler3;
};

// possibly the same as UnknownContestStruct3?
struct UnknownContestStruct4
{
    u8 unk0;  // sprite ID
    u8 unk1;  // sprite ID
    u8 unk2_0:1;
    u8 unk2_1:1;
    u8 unk2_2:1;
    u8 filler3;
};

struct UnknownContestStruct5
{
    s8 bits_0;  // current move excitement?
    u8 bits_8:1;
    u8 bits_9:3;
    u8 bits_C:4;
    s8 unk2;
    u8 filler3;
};

struct UnknownContestStruct7
{
    u8 unk0[4];
    u16 unk4;
    u16 unk6;
    u8 unk8[5];
    u8 unkD[4];
    u8 unk11;
    u8 filler12[2];
};

struct UnknownContestStruct8
{
    u16 unk0;
    u16 unk2;
    u8 unk4_0:1;
    u8 unk5;
    u8 filler6[2];
    u32 unk8;
    u32 unkC;
    u32 unk10;
};

struct UnknownContestStruct6
{
    s32 unk0;
    s32 unk4;
    s32 unk8;
    s32 unkC;
};

// TODO: Please move these to ewram.h once the defines are settled down and figured out completely.
#define shared15800 (gSharedMem + 0x15800)
#define shared15DE0 (*(struct ContestWinner *)(gSharedMem + 0x15DE0))
#define shared16800 (gSharedMem + 0x16800)
#define shared18000 (*(struct Shared18000 *)(gSharedMem + 0x18000))
#define shared18004 ((u16 *)(gSharedMem + 0x18004))
#define sContest (*(struct Contest *)(gSharedMem + 0x19204))
#define sContestantStatus ((struct ContestantStatus *)(gSharedMem + 0x19260))
#define shared192E4 (gSharedMem + 0x192E4)
#define shared19328 (*(struct UnknownContestStruct5 *)(gSharedMem + 0x19328))
#define shared19338 ((struct UnknownContestStruct4 *)(gSharedMem + 0x19338))
#define shared19348 (*(struct UnknownContestStruct8 *)(gSharedMem + 0x19348))

extern u8 gContestPlayerMonIndex;
extern u8 gIsLinkContest;
extern u32 gContestRngValue;
extern u8 gUnknown_02038696[4];
extern s16 gUnknown_02038670[4];
extern s16 gUnknown_02038678[4];
extern s16 gUnknown_02038680[4];
extern u16 gUnknown_02038688[4];
extern u8 gContestFinalStandings[4];
extern u8 gUnknown_02038696[4];
extern u8 gUnknown_0203869B;
void SetContestantStatusUnk13(u8 a, u8 b);
void SetContestantStatusUnk14(u8 a, u8 b);

#endif // GUARD_CONTEST_H
