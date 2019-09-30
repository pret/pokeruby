#ifndef GUARD_POKEMON_H
#define GUARD_POKEMON_H

#include "constants/pokemon.h"
#include "sprite.h"

enum {
    EGG_GROUP_NONE,
    EGG_GROUP_MONSTER,
    EGG_GROUP_WATER_1,
    EGG_GROUP_BUG,
    EGG_GROUP_FLYING,
    EGG_GROUP_FIELD,
    EGG_GROUP_FAIRY,
    EGG_GROUP_GRASS,
    EGG_GROUP_HUMAN_LIKE,
    EGG_GROUP_WATER_3,
    EGG_GROUP_MINERAL,
    EGG_GROUP_AMORPHOUS,
    EGG_GROUP_WATER_2,
    EGG_GROUP_DITTO,
    EGG_GROUP_DRAGON,
    EGG_GROUP_UNDISCOVERED
};

enum {
    NATURE_HARDY,
    NATURE_LONELY,
    NATURE_BRAVE,
    NATURE_ADAMANT,
    NATURE_NAUGHTY,
    NATURE_BOLD,
    NATURE_DOCILE,
    NATURE_RELAXED,
    NATURE_IMPISH,
    NATURE_LAX,
    NATURE_TIMID,
    NATURE_HASTY,
    NATURE_SERIOUS,
    NATURE_JOLLY,
    NATURE_NAIVE,
    NATURE_MODEST,
    NATURE_MILD,
    NATURE_QUIET,
    NATURE_BASHFUL,
    NATURE_RASH,
    NATURE_CALM,
    NATURE_GENTLE,
    NATURE_SASSY,
    NATURE_CAREFUL,
    NATURE_QUIRKY,
};

struct PokemonSubstruct0
{
    u16 species;
    u16 heldItem;
    u32 experience;
    u8 ppBonuses;
    u8 friendship;
};

struct PokemonSubstruct1
{
    u16 moves[4];
    u8 pp[4];
};

struct PokemonSubstruct2
{
    u8 hpEV;
    u8 attackEV;
    u8 defenseEV;
    u8 speedEV;
    u8 spAttackEV;
    u8 spDefenseEV;
    u8 cool;
    u8 beauty;
    u8 cute;
    u8 smart;
    u8 tough;
    u8 sheen;
};

struct PokemonSubstruct3
{
    /*0x00*/ u8 pokerus;
    /*0x01*/ u8 metLocation;

    /*0x02*/ u16 metLevel:7;
    /*0x02*/ u16 metGame:4;
    /*0x03*/ u16 pokeball:4;
    /*0x03*/ u16 otGender:1;

    /*0x04*/ u32 hpIV:5;
    /*0x04*/ u32 attackIV:5;
    /*0x05*/ u32 defenseIV:5;
    /*0x05*/ u32 speedIV:5;
    /*0x05*/ u32 spAttackIV:5;
    /*0x06*/ u32 spDefenseIV:5;
    /*0x07*/ u32 isEgg:1;
    /*0x07*/ u32 altAbility:1;

    /*0x08*/ u32 coolRibbon:3;
    /*0x08*/ u32 beautyRibbon:3;
    /*0x08*/ u32 cuteRibbon:3;
    /*0x09*/ u32 smartRibbon:3;
    /*0x09*/ u32 toughRibbon:3;
    /*0x09*/ u32 championRibbon:1;
    /*0x0A*/ u32 winningRibbon:1;
    /*0x0A*/ u32 victoryRibbon:1;
    /*0x0A*/ u32 artistRibbon:1;
    /*0x0A*/ u32 effortRibbon:1;
    /*0x0A*/ u32 giftRibbon1:1;
    /*0x0A*/ u32 giftRibbon2:1;
    /*0x0A*/ u32 giftRibbon3:1;
    /*0x0A*/ u32 giftRibbon4:1;
    /*0x0B*/ u32 giftRibbon5:1;
    /*0x0B*/ u32 giftRibbon6:1;
    /*0x0B*/ u32 giftRibbon7:1;
    /*0x0B*/ u32 fatefulEncounter:5; // unused in Ruby/Sapphire, but the high bit must be set for Mew/Deoxys to obey in FR/LG/Emerald
};

union PokemonSubstruct
{
    struct PokemonSubstruct0 type0;
    struct PokemonSubstruct1 type1;
    struct PokemonSubstruct2 type2;
    struct PokemonSubstruct3 type3;
    u16 raw[6];
};

struct BoxPokemon
{
    /*0x00*/ u32 personality;
    /*0x04*/ u32 otId;
    /*0x08*/ u8 nickname[POKEMON_NAME_LENGTH];
    /*0x12*/ u8 language;
    /*0x13*/ u8 isBadEgg:1;
             u8 hasSpecies:1;
             u8 isEgg:1;
    /*0x14*/ u8 otName[OT_NAME_LENGTH];
    /*0x1B*/ u8 markings;
    /*0x1C*/ u16 checksum;
    /*0x1E*/ u16 unknown;

    union
    {
        u32 raw[12];
        union PokemonSubstruct substructs[4];
    } secure;
}; /*size = 0x50*/

struct Pokemon
{
    /*0x00*/ struct BoxPokemon box;
    /*0x50*/ u32 status;
    /*0x54*/ u8 level;
    /*0x55*/ u8 mail;
    /*0x56*/ u16 hp;
    /*0x58*/ u16 maxHP;
    /*0x5A*/ u16 attack;
    /*0x5C*/ u16 defense;
    /*0x5E*/ u16 speed;
    /*0x60*/ u16 spAttack;
    /*0x62*/ u16 spDefense;
};

struct UnknownPokemonStruct
{
    /*0x00*/u16 species;
    /*0x02*/u16 heldItem;
    /*0x04*/u16 moves[4];
    /*0x0C*/u8 level;
    /*0x0D*/u8 ppBonuses;
    /*0x0E*/u8 hpEV;
    /*0x0F*/u8 attackEV;
    /*0x10*/u8 defenseEV;
    /*0x11*/u8 speedEV;
    /*0x12*/u8 spAttackEV;
    /*0x13*/u8 spDefenseEV;
    /*0x14*/u32 otId;
    /*0x18*/u32 hpIV:5;
    /*0x18*/u32 attackIV:5;
    /*0x19*/u32 defenseIV:5;
    /*0x19*/u32 speedIV:5;
    /*0x1A*/u32 spAttackIV:5;
    /*0x1A*/u32 spDefenseIV:5;
    /*0x1B*/u32 gap:1;
    /*0x1B*/u32 altAbility:1;
    /*0x1C*/u32 personality;
    /*0x20*/u8 nickname[POKEMON_NAME_LENGTH + 1];
    /*0x2B*/u8 friendship;
};

#define BATTLE_STATS_NO 8

struct BattlePokemon
{
    /*0x00*/ u16 species;
    /*0x02*/ u16 attack;
    /*0x04*/ u16 defense;
    /*0x06*/ u16 speed;
    /*0x08*/ u16 spAttack;
    /*0x0A*/ u16 spDefense;
    /*0x0C*/ u16 moves[4];
    /*0x14*/ u32 hpIV:5;
    /*0x14*/ u32 attackIV:5;
    /*0x15*/ u32 defenseIV:5;
    /*0x15*/ u32 speedIV:5;
    /*0x16*/ u32 spAttackIV:5;
    /*0x17*/ u32 spDefenseIV:5;
    /*0x17*/ u32 isEgg:1;
    /*0x17*/ u32 altAbility:1;
    /*0x18*/ s8 statStages[BATTLE_STATS_NO];
    /*0x20*/ u8 ability;
    /*0x21*/ u8 type1;
    /*0x22*/ u8 type2;
    /*0x23*/ u8 unknown;
    /*0x24*/ u8 pp[4];
    /*0x28*/ u16 hp;
    /*0x2A*/ u8 level;
    /*0x2B*/ u8 friendship;
    /*0x2C*/ u16 maxHP;
    /*0x2E*/ u16 item;
    /*0x30*/ u8 nickname[POKEMON_NAME_LENGTH + 1];
    /*0x3B*/ u8 ppBonuses;
    /*0x3C*/ u8 otName[8];
    /*0x44*/ u32 experience;
    /*0x48*/ u32 personality;
    /*0x4C*/ u32 status1;
    /*0x50*/ u32 status2;
    /*0x54*/ u32 otId;
};

// Shouldn't these be the same enum?

enum
{
    STAT_STAGE_HP,       // 0
    STAT_STAGE_ATK,      // 1
    STAT_STAGE_DEF,      // 2
    STAT_STAGE_SPEED,    // 3
    STAT_STAGE_SPATK,    // 4
    STAT_STAGE_SPDEF,    // 5
    STAT_STAGE_ACC,      // 6
    STAT_STAGE_EVASION,  // 7
};

enum
{
    STAT_HP,     // 0
    STAT_ATK,    // 1
    STAT_DEF,    // 2
    STAT_SPD,    // 3
    STAT_SPATK,  // 4
    STAT_SPDEF,  // 5
};

struct BaseStats
{
    /*0x00*/ u8 baseHP;
    /*0x01*/ u8 baseAttack;
    /*0x02*/ u8 baseDefense;
    /*0x03*/ u8 baseSpeed;
    /*0x04*/ u8 baseSpAttack;
    /*0x05*/ u8 baseSpDefense;
    /*0x06*/ u8 type1;
    /*0x07*/ u8 type2;
    /*0x08*/ u8 catchRate;
    /*0x09*/ u8 expYield;
    /*0x0A*/ u16 evYield_HP:2;
    /*0x0A*/ u16 evYield_Attack:2;
    /*0x0A*/ u16 evYield_Defense:2;
    /*0x0A*/ u16 evYield_Speed:2;
    /*0x0B*/ u16 evYield_SpAttack:2;
    /*0x0B*/ u16 evYield_SpDefense:2;
    /*0x0C*/ u16 item1;
    /*0x0E*/ u16 item2;
    /*0x10*/ u8 genderRatio;
    /*0x11*/ u8 eggCycles;
    /*0x12*/ u8 friendship;
    /*0x13*/ u8 growthRate;
    /*0x14*/ u8 eggGroup1;
    /*0x15*/ u8 eggGroup2;
    /*0x16*/ u8 ability1;
    /*0x17*/ u8 ability2;
    /*0x18*/ u8 safariZoneFleeRate;
    /*0x19*/ u8 bodyColor:7;
             u8 noFlip:1;
};

struct BattleMove
{
    u8 effect;
    u8 power;
    u8 type;
    u8 accuracy;
    u8 pp;
    u8 secondaryEffectChance;
    u8 target;
    s8 priority;
    u8 flags;
};

struct PokemonStorage
{
    /*0x0000*/ u8 currentBox;
    /*0x0004*/ struct BoxPokemon boxes[14][30];
    /*0x8344*/ u8 boxNames[14][9];
    /*0x83c2*/ u8 wallpaper[14];
};

struct SpindaSpot
{
    u8 x, y;
    u16 image[16];
};

struct __attribute__((packed)) LevelUpMove {
    u16 move:9;
    u16 level:7;
};

enum {
    GROWTH_MEDIUM_FAST,
    GROWTH_ERRATIC,
    GROWTH_FLUCTUATING,
    GROWTH_MEDIUM_SLOW,
    GROWTH_FAST,
    GROWTH_SLOW
};

enum {
    BODY_COLOR_RED,
    BODY_COLOR_BLUE,
    BODY_COLOR_YELLOW,
    BODY_COLOR_GREEN,
    BODY_COLOR_BLACK,
    BODY_COLOR_BROWN,
    BODY_COLOR_PURPLE,
    BODY_COLOR_GRAY,
    BODY_COLOR_WHITE,
    BODY_COLOR_PINK
};

#define EVO_FRIENDSHIP       0x0001 // Pokémon levels up with friendship ≥ 220
#define EVO_FRIENDSHIP_DAY   0x0002 // Pokémon levels up during the day with friendship ≥ 220
#define EVO_FRIENDSHIP_NIGHT 0x0003 // Pokémon levels up at night with friendship ≥ 220
#define EVO_LEVEL            0x0004 // Pokémon reaches the specified level
#define EVO_TRADE            0x0005 // Pokémon is traded
#define EVO_TRADE_ITEM       0x0006 // Pokémon is traded while it's holding the specified item
#define EVO_ITEM             0x0007 // specified item is used on Pokémon
#define EVO_LEVEL_ATK_GT_DEF 0x0008 // Pokémon reaches the specified level with attack > defense
#define EVO_LEVEL_ATK_EQ_DEF 0x0009 // Pokémon reaches the specified level with attack = defense
#define EVO_LEVEL_ATK_LT_DEF 0x000a // Pokémon reaches the specified level with attack < defense
#define EVO_LEVEL_SILCOON    0x000b // Pokémon reaches the specified level with a Silcoon personality value
#define EVO_LEVEL_CASCOON    0x000c // Pokémon reaches the specified level with a Cascoon personality value
#define EVO_LEVEL_NINJASK    0x000d // Pokémon reaches the specified level (special value for Ninjask)
#define EVO_LEVEL_SHEDINJA   0x000e // Pokémon reaches the specified level (special value for Shedinja)
#define EVO_BEAUTY           0x000f // Pokémon levels up with beauty ≥ specified value

struct Evolution
{
    u16 method;
    u16 param;
    u16 targetSpecies;
};

struct EvolutionData
{
    struct Evolution evolutions[5];
};

extern u8 gPlayerPartyCount;
extern struct Pokemon gPlayerParty[PARTY_SIZE];
extern u8 gEnemyPartyCount;
extern struct Pokemon gEnemyParty[PARTY_SIZE];
extern const u8 *const gItemEffectTable[];
extern const struct BaseStats gBaseStats[];
extern const u32 gExperienceTables[][101];
extern const u16 *gLevelUpLearnsets[];
extern struct Evolution gEvolutionTable[][5];
extern struct PokemonStorage gPokemonStorage;

void ZeroBoxMonData(struct BoxPokemon *boxMon);
void ZeroMonData(struct Pokemon *mon);
void ZeroPlayerPartyMons(void);
void ZeroEnemyPartyMons(void);
void CreateMon(struct Pokemon *mon, u16 species, u8 level, u8 fixedIV, u8 hasFixedPersonality, u32 fixedPersonality, u8 otIdType, u32 fixedOtId);
void CreateBoxMon(struct BoxPokemon *boxMon, u16 species, u8 level, u8 fixedIV, u8 hasFixedPersonality, u32 fixedPersonality, u8 otIdType, u32 fixedOtId);
void CreateMonWithNature(struct Pokemon *mon, u16 species, u8 level, u8 fixedIV, u8 nature);
void CreateMonWithGenderNatureLetter(struct Pokemon *mon, u16 species, u8 level, u8 fixedIV, u8 gender, u8 nature, u8 unownLetter);
void CreateMaleMon(struct Pokemon *mon, u16 species, u8 level);
void CreateMonWithIVsPersonality(struct Pokemon *mon, u16 species, u8 level, u32 ivs, u32 personality);
void CreateMonWithIVsOTID(struct Pokemon *mon, u16 species, u8 level, u8 *ivs, u32 otId);
void CreateMonWithEVSpread(struct Pokemon *mon, u16 species, u8 level, u8 fixedIV, u8 evSpread);
void sub_803ADE8(struct Pokemon *mon, struct UnknownPokemonStruct *src);
void sub_803AF78(struct Pokemon *mon, struct UnknownPokemonStruct *dest);
u16 CalculateBoxMonChecksum(struct BoxPokemon *boxMon);
void CalculateMonStats(struct Pokemon *mon);
void ExpandBoxMon(const struct BoxPokemon *src, struct Pokemon *dest);
u8 GetLevelFromMonExp(struct Pokemon *mon);
u8 GetLevelFromBoxMonExp(struct BoxPokemon *boxMon);
u16 GiveMoveToMon(struct Pokemon *mon, u16 move);
u16 GiveMoveToBoxMon(struct BoxPokemon *boxMon, u16 move);
u16 GiveMoveToBattleMon(struct BattlePokemon *mon, u16 move);
void SetMonMoveSlot(struct Pokemon *mon, u16 move, u8 slot);
void SetBattleMonMoveSlot(struct BattlePokemon *mon, u16 move, u8 slot);
void GiveMonInitialMoveset(struct Pokemon *mon);
void GiveBoxMonInitialMoveset(struct BoxPokemon *boxMon);
u16 MonTryLearningNewMove(struct Pokemon *mon, bool8 firstMove);
void DeleteFirstMoveAndGiveMoveToMon(struct Pokemon *mon, u16 move);
void DeleteFirstMoveAndGiveMoveToBoxMon(struct BoxPokemon *boxMon, u16 move);

u8 CountAliveMons(u8 a1);
u8 sub_803C434(u8 a1);
u8 GetMonGender(struct Pokemon *mon);
u8 GetBoxMonGender(struct BoxPokemon *boxMon);
u8 GetGenderFromSpeciesAndPersonality(u16 species, u32 personality);
void GetMonSpriteTemplate_803C56C(u16 species, u8 a2);
void GetMonSpriteTemplate_803C5A0(u16 species, u8 a2);
void EncryptBoxMon(struct BoxPokemon *boxMon);
void DecryptBoxMon(struct BoxPokemon *boxMon);
union PokemonSubstruct *GetSubstruct(struct BoxPokemon *boxMon, u32 personality, u8 substructType);

// These are full type signatures for GetMonData() and GetBoxMonData(),
// but they are not used since some code erroneously omits the third arg.
// u32 GetMonData(struct Pokemon *mon, s32 field, u8 *data);
// u32 GetBoxMonData(struct BoxPokemon *boxMon, s32 field, u8 *data);
// void SetMonData(struct Pokemon *mon, s32 field, const void *dataArg);
// void SetBoxMonData(struct BoxPokemon *boxMon, s32 field, const void *dataArg);
u32 GetMonData();
u32 GetBoxMonData();
void SetMonData();
void SetBoxMonData();

void CopyMon(void *dest, void *src, size_t size);
u8 GiveMonToPlayer(struct Pokemon *mon);
u8 SendMonToPC(struct Pokemon *mon);
u8 CalculatePlayerPartyCount(void);
u8 CalculateEnemyPartyCount(void);
u8 sub_803DAA0(void);
u8 GetAbilityBySpecies(u16 species, bool8 altAbility);
u8 GetMonAbility(struct Pokemon *mon);
void CreateSecretBaseEnemyParty(struct SecretBaseRecord *secretBaseRecord);
u8 GetSecretBaseTrainerPicIndex(void);
u8 GetSecretBaseTrainerNameIndex(void);
u8 PlayerPartyAndPokemonStorageFull(void);
u8 PokemonStorageFull(void);
void GetSpeciesName(u8 *name, u16 species);
u8 CalculatePPWithBonus(u16 move, u8 ppBonuses, u8 moveIndex);
void RemoveMonPPBonus(struct Pokemon *mon, u8 moveIndex);
void RemoveBattleMonPPBonus(struct BattlePokemon *mon, u8 moveIndex);
void CopyPlayerPartyMonToBattleData(u8 battleIndex, u8 partyIndex);

u8 GetNature(struct Pokemon *mon);
u8 GetNatureFromPersonality(u32 personality);

u16 GetEvolutionTargetSpecies(struct Pokemon *mon, u8 type, u16 evolutionItem);

u16 nature_stat_mod(u8 nature, u16 n, u8 statIndex);

void MonRestorePP(struct Pokemon *);

u8 *sub_803F378(u16 itemId);

u16 SpeciesToPokedexNum(u16 species);
u16 NationalPokedexNumToSpecies(u16 nationalNum);
u16 NationalToHoennOrder(u16);
u16 SpeciesToNationalPokedexNum(u16);
u16 HoennToNationalOrder(u16);
u16 SpeciesToCryId(u16 species);
void DrawSpindaSpots(u16, u32, u8 *, u8);
u8 sub_803FBBC(void);
u8 sub_803FC58(u16);
void AdjustFriendship(struct Pokemon *, u8);
u8 CheckPartyHasHadPokerus(struct Pokemon *, u8);
void UpdatePartyPokerusTime(u16);
u32 CanMonLearnTMHM(struct Pokemon *, u8);
u8 GetMoveTutorMoves(struct Pokemon *mon, u16 *moves);
u8 sub_8040574(struct Pokemon *party);
void ClearBattleMonForms(void);
void sub_80408BC();
void current_map_music_set__default_for_battle(u16);
const u8 *GetMonSpritePal(struct Pokemon *mon);
const u8 *GetMonSpritePalFromOtIdPersonality(u16, u32, u32);
const struct CompressedSpritePalette *GetMonSpritePalStructFromOtIdPersonality(u16, u32, u32);
bool8 IsOtherTrainer(u32, u8 *);
void sub_8040B8C(void);
void SetWildMonHeldItem(void);
u8 *sub_8040D08();
bool32 ShouldHideGenderIconForLanguage(u16 species, u8 *name, u8 language);
bool32 ShouldHideGenderIcon(u16 species, u8 *name);
s8 sub_8040A54(struct Pokemon *, u8);
u16 GetMonEVCount(struct Pokemon *);
u16 GetEvolutionTargetSpecies(struct Pokemon *, u8, u16);
const struct CompressedSpritePalette *GetMonSpritePalStruct(struct Pokemon *);
bool8 IsPokeSpriteNotFlipped(u16);
u8 GetLevelUpMovesBySpecies(u16, u16 *);
u8 TryIncrementMonLevel(struct Pokemon *);
bool8 IsShiny(struct Pokemon *mon);
void RandomlyGivePartyPokerus(struct Pokemon *party);
void PartySpreadPokerus(struct Pokemon *party);

struct Sprite *sub_80F7920(u16, u16, const u16 *);
void BoxMonRestorePP(struct BoxPokemon *);

bool8 HealStatusConditions(struct Pokemon *mon, u32 unused, u32 healMask, u8 battleId);
u8 GetItemEffectParamOffset(u16 itemId, u8 effectByte, u8 effectBit);

#if DEBUG
void Nakamura_NakaGenderTest_RecalcStats(struct Pokemon *);
#endif // DEBUG

#endif // GUARD_POKEMON_H
