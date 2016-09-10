#include "global.h"
#include "text.h"
#include "string_util.h"
#include "pokemon.h"
#include "species.h"
#include "main.h"

extern u8 sav1_map_get_name();

extern struct Pokemon gPlayerParty[6]; // 0x3004360
extern struct Pokemon gEnemyParty[6]; // 0x30045C0

extern u8 unk_2000000[];
extern u16 word_2024E82;
extern u8 byte_2024E88;

extern u32 gExperienceTables[8][101];
extern struct BaseStats gBaseStats[];
extern struct BattleMove gBattleMoves[];
extern const u16 *gLevelUpLearnsetPointers[];

void ZeroPokemonBoxData(struct Pokemon *mon)
{
    u8 *raw = (u8 *)mon;
    u32 i;
    for (i = 0; i < sizeof(struct BoxPokemon); i++)
        raw[i] = 0;
}

void zero_pokemon_struct(struct Pokemon *mon)
{
    u32 arg;
    ZeroPokemonBoxData(mon);
    arg = 0;
    SetMonData(mon, MON_DATA_STATUS, (u8 *)&arg);
    SetMonData(mon, MON_DATA_LEVEL, (u8 *)&arg);
    SetMonData(mon, MON_DATA_HP, (u8 *)&arg);
    SetMonData(mon, MON_DATA_MAX_HP, (u8 *)&arg);
    SetMonData(mon, MON_DATA_ATK, (u8 *)&arg);
    SetMonData(mon, MON_DATA_DEF, (u8 *)&arg);
    SetMonData(mon, MON_DATA_SPD, (u8 *)&arg);
    SetMonData(mon, MON_DATA_SPATK, (u8 *)&arg);
    SetMonData(mon, MON_DATA_SPDEF, (u8 *)&arg);
    arg = 255;
    SetMonData(mon, MON_DATA_64, (u8 *)&arg);
}

void zero_player_party_data(void)
{
    s32 i;
    for (i = 0; i < 6; i++)
        zero_pokemon_struct(&gPlayerParty[i]);
}

void zero_enemy_party_data(void)
{
    s32 i;
    for (i = 0; i < 6; i++)
        zero_pokemon_struct(&gEnemyParty[i]);
}

void create_pokemon_set_level(struct Pokemon *mon, u16 species, u8 level, u8 fixedIV, u8 hasFixedPersonality, u32 fixedPersonality, u8 otIdType, u32 fixedOtId)
{
    u32 arg;
    zero_pokemon_struct(mon);
    create_pokemon(mon, species, level, fixedIV, hasFixedPersonality, fixedPersonality, otIdType, fixedOtId);
    SetMonData(mon, MON_DATA_LEVEL, &level);
    arg = 255;
    SetMonData(mon, MON_DATA_64, (u8 *)&arg);
    pokemon_calc_effective_stats(mon);
}

void create_pokemon(struct Pokemon *mon, u16 species, u8 level, u8 fixedIV, u8 hasFixedPersonality, u32 fixedPersonality, u8 otIdType, u32 fixedOtId)
{
    u8 speciesName[10];
    u32 personality;
    u32 value;
    u16 checksum;

    ZeroPokemonBoxData(mon);

    if (hasFixedPersonality)
    {
        personality = fixedPersonality;
    }
    else
    {
        u32 r = Random();
        personality = (u16)r | (Random() << 16);
    }

    SetMonBoxData(mon, MON_DATA_PERSONALITY, (u8 *)&personality);

    if (otIdType == 2)
    {
        u32 shinyValue;
        do
        {
            u32 r = Random();
            value = (u16)r | (Random() << 16);
            asm(""); // needed to match for some reason
            shinyValue = ((value & 0xFFFF0000) >> 16) ^ (value & 0x0000FFFF) ^ ((personality & 0xFFFF0000) >> 16) ^ (personality & 0x0000FFFF);
        } while (shinyValue < 8);
    }
    else if (otIdType == 1)
    {
        value = fixedOtId;
    }
    else
    {
        value = gSaveBlock2.playerTrainerId[0]
              | (gSaveBlock2.playerTrainerId[1] << 8)
              | (gSaveBlock2.playerTrainerId[2] << 16)
              | (gSaveBlock2.playerTrainerId[3] << 24);
    }

    SetMonBoxData(mon, MON_DATA_OT_ID, (u8 *)&value);

    checksum = pokemon_calc_checksum(mon);
    SetMonBoxData(mon, MON_DATA_CHECKSUM, (u8 *)&checksum);
    EncryptMon(mon);
    GetSpeciesName(speciesName, species);
    SetMonBoxData(mon, MON_DATA_NICKNAME, speciesName);
    SetMonBoxData(mon, MON_DATA_LANGUAGE, &gGameLanguage);
    SetMonBoxData(mon, MON_DATA_OT_NAME, gSaveBlock2.playerName);
    SetMonBoxData(mon, MON_DATA_SPECIES, (u8 *)&species);
    SetMonBoxData(mon, MON_DATA_EXP, (u8 *)&gExperienceTables[gBaseStats[species].growthRate][level]);
    SetMonBoxData(mon, MON_DATA_FRIENDSHIP, &gBaseStats[species].friendship);
    value = sav1_map_get_name();
    SetMonBoxData(mon, MON_DATA_MET_LOCATION, (u8 *)&value);
    SetMonBoxData(mon, MON_DATA_MET_LEVEL, &level);
    SetMonBoxData(mon, MON_DATA_MET_GAME, &gGameVersion);
    value = 4;
    SetMonBoxData(mon, MON_DATA_POKEBALL, (u8 *)&value);
    SetMonBoxData(mon, MON_DATA_OT_GENDER, &gSaveBlock2.playerGender);

    if (fixedIV < 32)
    {
        SetMonBoxData(mon, MON_DATA_HP_IV, &fixedIV);
        SetMonBoxData(mon, MON_DATA_ATK_IV, &fixedIV);
        SetMonBoxData(mon, MON_DATA_DEF_IV, &fixedIV);
        SetMonBoxData(mon, MON_DATA_SPD_IV, &fixedIV);
        SetMonBoxData(mon, MON_DATA_SPATK_IV, &fixedIV);
        SetMonBoxData(mon, MON_DATA_SPDEF_IV, &fixedIV);
    }
    else
    {
        u32 iv;
        value = (u16)Random();

        iv = value & 0x1F;
        SetMonBoxData(mon, MON_DATA_HP_IV, (u8 *)&iv);
        iv = (value & 0x3E0) >> 5;
        SetMonBoxData(mon, MON_DATA_ATK_IV, (u8 *)&iv);
        iv = (value &0x7C00) >> 10;
        SetMonBoxData(mon, MON_DATA_DEF_IV, (u8 *)&iv);

        value = (u16)Random();

        iv = value & 0x1F;
        SetMonBoxData(mon, MON_DATA_SPD_IV, (u8 *)&iv);
        iv = (value & 0x3E0) >> 5;
        SetMonBoxData(mon, MON_DATA_SPATK_IV, (u8 *)&iv);
        iv = (value &0x7C00) >> 10;
        SetMonBoxData(mon, MON_DATA_SPDEF_IV, (u8 *)&iv);
    }

    if (gBaseStats[species].ability2)
    {
        value = personality & 1;
        SetMonBoxData(mon, MON_DATA_ALT_ABILITY, (u8 *)&value);
    }

    sub_803B720(mon);
}

void pokemon_make_with_nature(struct Pokemon *mon, u16 species, u8 level, u8 fixedIV, u8 nature)
{
    u32 personality;

    do
    {
        u32 r = Random();
        personality = (u16)r | (Random() << 16);
    }
    while (nature != GetNatureFromPersonality(personality));

    create_pokemon_set_level(mon, species, level, fixedIV, 1, personality, 0, 0);
}

void unref_sub_803AB44(struct Pokemon *mon, u16 species, u8 level, u8 fixedIV, u8 gender, u8 nature, u8 unownLetter)
{
    u32 personality;

    if ((u8)(unownLetter - 1) < 28)
    {
        u16 actualLetter;

        do
        {
            u32 r = Random();
            personality = (u16)r | (Random() << 16);
            actualLetter = ((((personality & 0x3000000) >> 18) | ((personality & 0x30000) >> 12) | ((personality & 0x300) >> 6) | personality & 0x3) % 28);
        }
        while (nature != GetNatureFromPersonality(personality)
            || gender != pokemon_species_get_gender_info(species, personality)
            || actualLetter != unownLetter - 1);
    }
    else
    {
        do
        {
            u32 r = Random();
            personality = (u16)r | (Random() << 16);
        }
        while (nature != GetNatureFromPersonality(personality)
            || gender != pokemon_species_get_gender_info(species, personality));
    }

    create_pokemon_set_level(mon, species, level, fixedIV, 1, personality, 0, 0);
}

void sub_803AC44(struct Pokemon *mon, u16 species, u8 level)
{
    u32 personality;
    u32 otId;

    do
    {
        u32 r1, r2;
        r1 = Random();
        otId = (u16)r1 | (Random() << 16);
        r2 = Random();
        personality = (u16)r2 | (Random() << 16);
    }
    while (pokemon_species_get_gender_info(species, personality) != MALE);
    create_pokemon_set_level(mon, species, level, 32, 1, personality, 1, otId);
}

void sub_803ACAC(struct Pokemon *mon, u16 species, u8 level, u32 ivs, u32 personality)
{
    create_pokemon_set_level(mon, species, level, 0, 1, personality, 0, 0);
    SetMonData(mon, MON_DATA_IVS, (u8 *)&ivs);
    pokemon_calc_effective_stats(mon);
}

void unref_sub_803ACEC(struct Pokemon *mon, u16 species, u8 level, u8 *ivs, u32 otId)
{
    create_pokemon_set_level(mon, species, level, 0, 0, 0, 1, otId);
    SetMonData(mon, MON_DATA_HP_IV, &ivs[0]);
    SetMonData(mon, MON_DATA_ATK_IV, &ivs[1]);
    SetMonData(mon, MON_DATA_DEF_IV, &ivs[2]);
    SetMonData(mon, MON_DATA_SPD_IV, &ivs[3]);
    SetMonData(mon, MON_DATA_SPATK_IV, &ivs[4]);
    SetMonData(mon, MON_DATA_SPDEF_IV, &ivs[5]);
    pokemon_calc_effective_stats(mon);
}

void pokemon_make_ev_something(struct Pokemon *mon, u16 species, u8 level, u8 fixedIV, u8 evSpread)
{
    register s32 i asm("r5");
    register u32 temp asm("r4");
    s32 statCount = 0;
    u16 evAmount;
    register u32 mask1 asm("r1");
    u8 mask2;

    create_pokemon_set_level(mon, species, level, fixedIV, 0, 0, 0, 0);

    temp = evSpread;
    mask1 = 1;
    i = 5;
    do
    {
        if (temp & mask1)
            statCount++;
        temp >>= 1;
        i--;
    } while (i >= 0);


    evAmount = 510 / statCount;
    mask2 = 1;
    i = 0;
    do
    {
        if (evSpread & mask2)
            SetMonData(mon, MON_DATA_HP_EV + i, (u8 *)&evAmount);
        mask2 <<= 1;
        i++;
    } while (i < 6);

    pokemon_calc_effective_stats(mon);
}

void sub_803ADE8(struct Pokemon *mon, struct UnknownPokemonStruct *src)
{
    s32 i;
    u8 nickname[11];
    u8 language;
    u8 value;

    create_pokemon_set_level(mon, src->species, src->level, 0, 1, src->personality, 1, src->otId);

    for (i = 0; i < 4; i++)
        sub_803B6A4(mon, src->moves[i], i);

    SetMonData(mon, MON_DATA_PP_BONUSES, (u8 *)&(src->ppBonuses));
    SetMonData(mon, MON_DATA_HELD_ITEM, (u8 *)&(src->heldItem));

    StringCopy(nickname, src->nickname);

    if (nickname[0] == 0xFC && nickname[1] == 0x15)
        language = 1;
    else
        language = 2;

    SetMonData(mon, MON_DATA_LANGUAGE, &language);
    SkipExtCtrlCodes(nickname);
    SetMonData(mon, MON_DATA_NICKNAME, nickname);
    SetMonData(mon, MON_DATA_FRIENDSHIP, (u8 *)&(src->friendship));
    SetMonData(mon, MON_DATA_HP_EV, (u8 *)&(src->hpEV));
    SetMonData(mon, MON_DATA_ATK_EV, (u8 *)&(src->attackEV));
    SetMonData(mon, MON_DATA_DEF_EV, (u8 *)&(src->defenseEV));
    SetMonData(mon, MON_DATA_SPD_EV, (u8 *)&(src->speedEV));
    SetMonData(mon, MON_DATA_SPATK_EV, (u8 *)&(src->spAttackEV));
    SetMonData(mon, MON_DATA_SPDEF_EV, (u8 *)&(src->spDefenseEV));
    value = src->altAbility;
    SetMonData(mon, MON_DATA_ALT_ABILITY, &value);
    value = src->hpIV;
    SetMonData(mon, MON_DATA_HP_IV, &value);
    value = src->attackIV;
    SetMonData(mon, MON_DATA_ATK_IV, &value);
    value = src->defenseIV;
    SetMonData(mon, MON_DATA_DEF_IV, &value);
    value = src->speedIV;
    SetMonData(mon, MON_DATA_SPD_IV, &value);
    value = src->spAttackIV;
    SetMonData(mon, MON_DATA_SPATK_IV, &value);
    value = src->spDefenseIV;
    SetMonData(mon, MON_DATA_SPDEF_IV, &value);
    pokemon_calc_effective_stats(mon);
}

void sub_803AF78(struct Pokemon *mon, struct UnknownPokemonStruct *dest)
{
    s32 i;
    u16 heldItem;

    dest->species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    heldItem = GetMonData(mon, MON_DATA_HELD_ITEM, NULL);

    if (heldItem == 175)
        heldItem = 0;

    dest->heldItem = heldItem;

    for (i = 0; i < 4; i++)
        dest->moves[i] = GetMonData(mon, MON_DATA_MOVE1 + i, NULL);

    dest->level = GetMonData(mon, MON_DATA_LEVEL, NULL);
    dest->ppBonuses = GetMonData(mon, MON_DATA_PP_BONUSES, NULL);
    dest->otId = GetMonData(mon, MON_DATA_OT_ID, NULL);
    dest->hpEV = GetMonData(mon, MON_DATA_HP_EV, NULL);
    dest->attackEV = GetMonData(mon, MON_DATA_ATK_EV, NULL);
    dest->defenseEV = GetMonData(mon, MON_DATA_DEF_EV, NULL);
    dest->speedEV = GetMonData(mon, MON_DATA_SPD_EV, NULL);
    dest->spAttackEV = GetMonData(mon, MON_DATA_SPATK_EV, NULL);
    dest->spDefenseEV = GetMonData(mon, MON_DATA_SPDEF_EV, NULL);
    dest->friendship = GetMonData(mon, MON_DATA_FRIENDSHIP, NULL);
    dest->hpIV = GetMonData(mon, MON_DATA_HP_IV, NULL);
    dest->attackIV = GetMonData(mon, MON_DATA_ATK_IV, NULL);
    dest->defenseIV = GetMonData(mon, MON_DATA_DEF_IV, NULL);
    dest->speedIV  = GetMonData(mon, MON_DATA_SPD_IV, NULL);
    dest->spAttackIV  = GetMonData(mon, MON_DATA_SPATK_IV, NULL);
    dest->spDefenseIV  = GetMonData(mon, MON_DATA_SPDEF_IV, NULL);
    dest->altAbility = GetMonData(mon, MON_DATA_ALT_ABILITY, NULL);
    dest->personality = GetMonData(mon, MON_DATA_PERSONALITY, NULL);
    GetMonData(mon, MON_DATA_NICKNAME, dest->nickname);
}

u16 pokemon_calc_checksum(struct Pokemon *mon)
{
    u16 checksum = 0;
    union PokemonSubstruct *substruct0 = GetSubstruct(mon, mon->box.personality, 0);
    union PokemonSubstruct *substruct1 = GetSubstruct(mon, mon->box.personality, 1);
    union PokemonSubstruct *substruct2 = GetSubstruct(mon, mon->box.personality, 2);
    union PokemonSubstruct *substruct3 = GetSubstruct(mon, mon->box.personality, 3);
    s32 i;

    for (i = 0; i < 6; i++)
        checksum += substruct0->raw[i];

    for (i = 0; i < 6; i++)
        checksum += substruct1->raw[i];

    for (i = 0; i < 6; i++)
        checksum += substruct2->raw[i];

    for (i = 0; i < 6; i++)
        checksum += substruct3->raw[i];

    return checksum;
}

#define CALC_STAT(base, iv, ev, statIndex, field)               \
{                                                               \
    u8 baseStat = gBaseStats[species].base;                     \
    s32 n = (((2 * baseStat + iv + ev / 4) * level) / 100) + 5; \
    u8 nature = GetNature(mon);                                 \
    n = nature_stat_mod(nature, n, statIndex);                  \
    SetMonData(mon, field, (u8 *)&n);                           \
}

void pokemon_calc_effective_stats(struct Pokemon *mon)
{
    s32 oldMaxHP = GetMonData(mon, MON_DATA_MAX_HP, NULL);
    s32 currentHP = GetMonData(mon, MON_DATA_HP, NULL);
    s32 hpIV = GetMonData(mon, MON_DATA_HP_IV, NULL);
    s32 hpEV = GetMonData(mon, MON_DATA_HP_EV, NULL);
    s32 attackIV = GetMonData(mon, MON_DATA_ATK_IV, NULL);
    s32 attackEV = GetMonData(mon, MON_DATA_ATK_EV, NULL);
    s32 defenseIV = GetMonData(mon, MON_DATA_DEF_IV, NULL);
    s32 defenseEV = GetMonData(mon, MON_DATA_DEF_EV, NULL);
    s32 speedIV = GetMonData(mon, MON_DATA_SPD_IV, NULL);
    s32 speedEV = GetMonData(mon, MON_DATA_SPD_EV, NULL);
    s32 spAttackIV = GetMonData(mon, MON_DATA_SPATK_IV, NULL);
    s32 spAttackEV = GetMonData(mon, MON_DATA_SPATK_EV, NULL);
    s32 spDefenseIV = GetMonData(mon, MON_DATA_SPDEF_IV, NULL);
    s32 spDefenseEV = GetMonData(mon, MON_DATA_SPDEF_EV, NULL);
    u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    s32 level = level_by_exp(mon);
    s32 newMaxHP;
    u8 nature;

    SetMonData(mon, MON_DATA_LEVEL, (u8 *)&level);

    if (species == SPECIES_SHEDINJA)
    {
        newMaxHP = 1;
    }
    else
    {
        s32 n = 2 * gBaseStats[species].baseHP + hpIV;
        newMaxHP = (((n + hpEV / 4) * level) / 100) + level + 10;
    }

    unk_2000000[0x160FA] = newMaxHP - oldMaxHP;
    if (unk_2000000[0x160FA] == 0)
        unk_2000000[0x160FA] = 1;

    SetMonData(mon, MON_DATA_MAX_HP, (u8 *)&newMaxHP);

    CALC_STAT(baseAttack, attackIV, attackEV, 1, MON_DATA_ATK)
    CALC_STAT(baseDefense, defenseIV, defenseEV, 2, MON_DATA_DEF)
    CALC_STAT(baseSpeed, speedIV, speedEV, 3, MON_DATA_SPD)
    CALC_STAT(baseSpAttack, spAttackIV, spAttackEV, 4, MON_DATA_SPATK)
    CALC_STAT(baseSpDefense, spDefenseIV, spDefenseEV, 5, MON_DATA_SPDEF)

    if (species == SPECIES_SHEDINJA)
    {
        if (currentHP != 0 || oldMaxHP == 0)
        {
            currentHP = 1;
            goto set_hp;
        }
    }
    else
    {
        if (currentHP != 0 || oldMaxHP == 0)
        {
            if (currentHP != 0)
                currentHP += newMaxHP - oldMaxHP;
            else if (oldMaxHP == 0)
                currentHP = newMaxHP;
        set_hp:
            SetMonData(mon, MON_DATA_HP, (u8 *)&currentHP);
        }
    }
}

void sub_803B4B4(struct Pokemon *src, struct Pokemon *dest)
{
    u32 value = 0;
    memcpy(&(dest->box), &(src->box), sizeof(struct BoxPokemon));
    SetMonData(dest, MON_DATA_STATUS, (u8 *)&value);
    SetMonData(dest, MON_DATA_HP, (u8 *)&value);
    SetMonData(dest, MON_DATA_MAX_HP, (u8 *)&value);
    value = 255;
    SetMonData(dest, MON_DATA_64, (u8 *)&value);
    pokemon_calc_effective_stats(dest);
}

u8 level_by_exp(struct Pokemon *mon)
{
    u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    u32 exp = GetMonData(mon, MON_DATA_EXP, NULL);
    s32 level = 1;

    while (level <= 100 && gExperienceTables[gBaseStats[species].growthRate][level] <= exp)
        level++;

    return level - 1;
}

u8 sub_803B570(struct BoxPokemon *mon)
{
    u16 species = GetMonBoxData(mon, MON_DATA_SPECIES, NULL);
    u32 exp = GetMonBoxData(mon, MON_DATA_EXP, NULL);
    s32 level = 1;

    while (level <= 100 && gExperienceTables[gBaseStats[species].growthRate][level] <= exp)
        level++;

    return level - 1;
}

u16 pokemon_moveset_pad_(struct Pokemon *mon, u16 value)
{
    return pokemon_moveset_pad(mon, value);
}

u16 pokemon_moveset_pad(struct Pokemon *mon, u16 value)
{
    s32 i;
    for (i = 0; i < 4; i++)
    {
        u16 move = GetMonBoxData(&(mon->box), MON_DATA_MOVE1 + i, NULL);
        if (!move)
        {
            SetMonBoxData(mon, MON_DATA_MOVE1 + i, (u8 *)&value);
            SetMonBoxData(mon, MON_DATA_PP1 + i, &(gBattleMoves[value].pp));
            return value;
        }
        if (move == value)
            return -2;
    }
    return -1;
}

u16 sub_803B660(struct BattlePokemon *mon, u16 value)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        if (!mon->moves[i])
        {
            mon->moves[i] = value;
            mon->pp[i] = gBattleMoves[value].pp;
            return value;
        }
    }

    return -1;
}

void sub_803B6A4(struct Pokemon *mon, u16 move, u8 slot)
{
    SetMonData(mon, MON_DATA_MOVE1 + slot, (u8 *)&move);
    SetMonData(mon, MON_DATA_PP1 + slot, &(gBattleMoves[move].pp));
}

void sub_803B6E4(struct BattlePokemon *mon, u16 move, u8 slot)
{
    mon->moves[slot] = move;
    mon->pp[slot] = gBattleMoves[move].pp;
}

void unref_sub_803B714(struct Pokemon *mon)
{
    sub_803B720(mon);
}

void sub_803B720(struct Pokemon *mon)
{
    u16 species = GetMonBoxData(&(mon->box), MON_DATA_SPECIES, NULL);
    s32 level = sub_803B570(&(mon->box));
    s32 i;

    for (i = 0; gLevelUpLearnsetPointers[species][i] != (u16)-1; i++)
    {
        u16 moveLevel;
        u16 move;

        moveLevel = (gLevelUpLearnsetPointers[species][i] & 0xFE00);

        if (moveLevel > (level << 9))
            break;

        move = (gLevelUpLearnsetPointers[species][i] & 0x1FF);

        if (pokemon_moveset_pad(mon, move) == (u16)-1)
            sub_803B980(mon, move);
    }
}

u16 sub_803B7C8(struct Pokemon *mon, u8 a2)
{
    u32 retVal = 0;
    u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    u8 level = GetMonData(mon, MON_DATA_LEVEL, NULL);

    if (a2)
    {
        byte_2024E88 = retVal;

        while ((gLevelUpLearnsetPointers[species][byte_2024E88] & 0xFE00) != (level << 9))
        {
            byte_2024E88++;
            if (gLevelUpLearnsetPointers[species][byte_2024E88] == (u16)-1)
                return 0;
        }
    }

    if ((gLevelUpLearnsetPointers[species][byte_2024E88] & 0xFE00) == (level << 9))
    {
        word_2024E82 = (gLevelUpLearnsetPointers[species][byte_2024E88] & 0x1FF);
        byte_2024E88++;
        retVal = pokemon_moveset_pad_(mon, word_2024E82);
    }

    return retVal;
}

void sub_803B8D4(struct Pokemon *mon, u16 move)
{
    s32 i;
    u16 moves[4];
    u8 pp[4];
    u8 ppBonuses;

    for (i = 0; i < 3; i++)
    {
        moves[i] = GetMonData(mon, MON_DATA_MOVE2 + i, NULL);
        pp[i]= GetMonData(mon, MON_DATA_PP2 + i, NULL);
    }

    ppBonuses = GetMonData(mon, MON_DATA_PP_BONUSES, NULL);
    ppBonuses >>= 2;
    moves[3] = move;
    pp[3] = gBattleMoves[move].pp;

    for (i = 0; i < 4; i++)
    {
        SetMonData(mon, MON_DATA_MOVE1 + i, (u8 *)&moves[i]);
        SetMonData(mon, MON_DATA_PP1 + i, &pp[i]);
    }

    SetMonData(mon, MON_DATA_PP_BONUSES, &ppBonuses);
}

void sub_803B980(struct Pokemon *mon, u16 move)
{
    s32 i;
    u16 moves[4];
    u8 pp[4];
    u8 ppBonuses;

    for (i = 0; i < 3; i++)
    {
        moves[i] = GetMonBoxData(mon, MON_DATA_MOVE2 + i, NULL);
        pp[i]= GetMonBoxData(mon, MON_DATA_PP2 + i, NULL);
    }

    ppBonuses = GetMonBoxData(mon, MON_DATA_PP_BONUSES, NULL);
    ppBonuses >>= 2;
    moves[3] = move;
    pp[3] = gBattleMoves[move].pp;

    for (i = 0; i < 4; i++)
    {
        SetMonBoxData(mon, MON_DATA_MOVE1 + i, (u8 *)&moves[i]);
        SetMonBoxData(mon, MON_DATA_PP1 + i, &pp[i]);
    }

    SetMonBoxData(mon, MON_DATA_PP_BONUSES, &ppBonuses);
}
