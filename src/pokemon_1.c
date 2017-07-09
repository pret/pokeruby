#include "global.h"
#include "data2.h"
#include "items.h"
#include "main.h"
#include "pokemon.h"
#include "rng.h"
#include "rom4.h"
#include "species.h"
#include "sprite.h"
#include "string_util.h"
#include "text.h"

//Extracts the upper 16 bits of a 32-bit number
#define HIHALF(n) (((n) & 0xFFFF0000) >> 16)

//Extracts the lower 16 bits of a 32-bit number
#define LOHALF(n) ((n) & 0xFFFF)

extern u8 unk_2000000[];
extern u16 word_2024E82;
extern u8 byte_2024E88;

void ZeroBoxMonData(struct BoxPokemon *boxMon)
{
    u8 *raw = (u8 *)boxMon;
    u32 i;
    for (i = 0; i < sizeof(struct BoxPokemon); i++)
        raw[i] = 0;
}

void ZeroMonData(struct Pokemon *mon)
{
    u32 arg;
    ZeroBoxMonData(&mon->box);
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
    SetMonData(mon, MON_DATA_MAIL, (u8 *)&arg);
}

void ZeroPlayerPartyMons(void)
{
    s32 i;
    for (i = 0; i < 6; i++)
        ZeroMonData(&gPlayerParty[i]);
}

void ZeroEnemyPartyMons(void)
{
    s32 i;
    for (i = 0; i < 6; i++)
        ZeroMonData(&gEnemyParty[i]);
}

void CreateMon(struct Pokemon *mon, u16 species, u8 level, u8 fixedIV, u8 hasFixedPersonality, u32 fixedPersonality, u8 otIdType, u32 fixedOtId)
{
    u32 arg;
    ZeroMonData(mon);
    CreateBoxMon(&mon->box, species, level, fixedIV, hasFixedPersonality, fixedPersonality, otIdType, fixedOtId);
    SetMonData(mon, MON_DATA_LEVEL, &level);
    arg = 255;
    SetMonData(mon, MON_DATA_MAIL, (u8 *)&arg);
    CalculateMonStats(mon);
}

void CreateBoxMon(struct BoxPokemon *boxMon, u16 species, u8 level, u8 fixedIV, u8 hasFixedPersonality, u32 fixedPersonality, u8 otIdType, u32 fixedOtId)
{
    u8 speciesName[POKEMON_NAME_LENGTH + 1];
    u32 personality;
    u32 value;
    u16 checksum;

    ZeroBoxMonData(boxMon);

    if (hasFixedPersonality)
        personality = fixedPersonality;
    else
        personality = Random32();

    SetBoxMonData(boxMon, MON_DATA_PERSONALITY, (u8 *)&personality);

    //Determine original trainer ID
    if (otIdType == 2) //Pokemon cannot be shiny
    {
        u32 shinyValue;
        do
        {
            value = Random32();
            shinyValue = HIHALF(value) ^ LOHALF(value) ^ HIHALF(personality) ^ LOHALF(personality);
        } while (shinyValue < 8);
    }
    else if (otIdType == 1) //Pokemon has a preset OT ID
    {
        value = fixedOtId;
    }
    else //Player is the OT
    {
        value = gSaveBlock2.playerTrainerId[0]
              | (gSaveBlock2.playerTrainerId[1] << 8)
              | (gSaveBlock2.playerTrainerId[2] << 16)
              | (gSaveBlock2.playerTrainerId[3] << 24);
    }

    SetBoxMonData(boxMon, MON_DATA_OT_ID, (u8 *)&value);

    checksum = CalculateBoxMonChecksum(boxMon);
    SetBoxMonData(boxMon, MON_DATA_CHECKSUM, (u8 *)&checksum);
    EncryptBoxMon(boxMon);
    GetSpeciesName(speciesName, species);
    SetBoxMonData(boxMon, MON_DATA_NICKNAME, speciesName);
    SetBoxMonData(boxMon, MON_DATA_LANGUAGE, &gGameLanguage);
    SetBoxMonData(boxMon, MON_DATA_OT_NAME, gSaveBlock2.playerName);
    SetBoxMonData(boxMon, MON_DATA_SPECIES, (u8 *)&species);
    SetBoxMonData(boxMon, MON_DATA_EXP, (u8 *)&gExperienceTables[gBaseStats[species].growthRate][level]);
    SetBoxMonData(boxMon, MON_DATA_FRIENDSHIP, &gBaseStats[species].friendship);
    value = sav1_map_get_name();
    SetBoxMonData(boxMon, MON_DATA_MET_LOCATION, (u8 *)&value);
    SetBoxMonData(boxMon, MON_DATA_MET_LEVEL, &level);
    SetBoxMonData(boxMon, MON_DATA_MET_GAME, &gGameVersion);
    value = 4;
    SetBoxMonData(boxMon, MON_DATA_POKEBALL, (u8 *)&value);
    SetBoxMonData(boxMon, MON_DATA_OT_GENDER, &gSaveBlock2.playerGender);

    if (fixedIV < 32)
    {
        SetBoxMonData(boxMon, MON_DATA_HP_IV, &fixedIV);
        SetBoxMonData(boxMon, MON_DATA_ATK_IV, &fixedIV);
        SetBoxMonData(boxMon, MON_DATA_DEF_IV, &fixedIV);
        SetBoxMonData(boxMon, MON_DATA_SPD_IV, &fixedIV);
        SetBoxMonData(boxMon, MON_DATA_SPATK_IV, &fixedIV);
        SetBoxMonData(boxMon, MON_DATA_SPDEF_IV, &fixedIV);
    }
    else
    {
        u32 iv;
        value = Random();

        iv = value & 0x1F;
        SetBoxMonData(boxMon, MON_DATA_HP_IV, (u8 *)&iv);
        iv = (value & 0x3E0) >> 5;
        SetBoxMonData(boxMon, MON_DATA_ATK_IV, (u8 *)&iv);
        iv = (value & 0x7C00) >> 10;
        SetBoxMonData(boxMon, MON_DATA_DEF_IV, (u8 *)&iv);

        value = Random();

        iv = value & 0x1F;
        SetBoxMonData(boxMon, MON_DATA_SPD_IV, (u8 *)&iv);
        iv = (value & 0x3E0) >> 5;
        SetBoxMonData(boxMon, MON_DATA_SPATK_IV, (u8 *)&iv);
        iv = (value & 0x7C00) >> 10;
        SetBoxMonData(boxMon, MON_DATA_SPDEF_IV, (u8 *)&iv);
    }

    if (gBaseStats[species].ability2)
    {
        value = personality & 1;
        SetBoxMonData(boxMon, MON_DATA_ALT_ABILITY, (u8 *)&value);
    }

    GiveBoxMonInitialMoveset(boxMon);
}

void CreateMonWithNature(struct Pokemon *mon, u16 species, u8 level, u8 fixedIV, u8 nature)
{
    u32 personality;

    do
    {
        personality = Random32();
    }
    while (nature != GetNatureFromPersonality(personality));

    CreateMon(mon, species, level, fixedIV, 1, personality, 0, 0);
}

void CreateMonWithGenderNatureLetter(struct Pokemon *mon, u16 species, u8 level, u8 fixedIV, u8 gender, u8 nature, u8 unownLetter)
{
    u32 personality;

    if ((u8)(unownLetter - 1) < 28)
    {
        u16 actualLetter;

        do
        {
            personality = Random32();
            actualLetter = ((((personality & 0x3000000) >> 18) | ((personality & 0x30000) >> 12) | ((personality & 0x300) >> 6) | (personality & 0x3)) % 28);
        }
        while (nature != GetNatureFromPersonality(personality)
            || gender != GetGenderFromSpeciesAndPersonality(species, personality)
            || actualLetter != unownLetter - 1);
    }
    else
    {
        do
        {
            personality = Random32();
        }
        while (nature != GetNatureFromPersonality(personality)
            || gender != GetGenderFromSpeciesAndPersonality(species, personality));
    }

    CreateMon(mon, species, level, fixedIV, 1, personality, 0, 0);
}

// This is only used to create Wally's Ralts.
void CreateMaleMon(struct Pokemon *mon, u16 species, u8 level)
{
    u32 personality;
    u32 otId;

    do
    {
        otId = Random32();
        personality = Random32();
    }
    while (GetGenderFromSpeciesAndPersonality(species, personality) != MON_MALE);
    CreateMon(mon, species, level, 32, 1, personality, 1, otId);
}

void CreateMonWithIVsPersonality(struct Pokemon *mon, u16 species, u8 level, u32 ivs, u32 personality)
{
    CreateMon(mon, species, level, 0, 1, personality, 0, 0);
    SetMonData(mon, MON_DATA_IVS, (u8 *)&ivs);
    CalculateMonStats(mon);
}

void CreateMonWithIVsOTID(struct Pokemon *mon, u16 species, u8 level, u8 *ivs, u32 otId)
{
    CreateMon(mon, species, level, 0, 0, 0, 1, otId);
    SetMonData(mon, MON_DATA_HP_IV, &ivs[0]);
    SetMonData(mon, MON_DATA_ATK_IV, &ivs[1]);
    SetMonData(mon, MON_DATA_DEF_IV, &ivs[2]);
    SetMonData(mon, MON_DATA_SPD_IV, &ivs[3]);
    SetMonData(mon, MON_DATA_SPATK_IV, &ivs[4]);
    SetMonData(mon, MON_DATA_SPDEF_IV, &ivs[5]);
    CalculateMonStats(mon);
}

void CreateMonWithEVSpread(struct Pokemon *mon, u16 species, u8 level, u8 fixedIV, u8 evSpread)
{
    s32 i;
    register u32 temp asm("r4");
    s32 statCount = 0;
    u16 evAmount;
    register u32 mask1 asm("r1");
    u8 mask2;

    CreateMon(mon, species, level, fixedIV, 0, 0, 0, 0);
    temp = evSpread;
    mask1 = 1;
    for (i = 5; i >= 0; i--)
    {
        if (temp & mask1)
            statCount++;
        temp >>= 1;
    }

    evAmount = 510 / statCount;
    mask2 = 1;
    for (i = 0; i < 6; i++)
    {
        if (evSpread & mask2)
            SetMonData(mon, MON_DATA_HP_EV + i, (u8 *)&evAmount);
        mask2 <<= 1;
    }

    CalculateMonStats(mon);
}

void sub_803ADE8(struct Pokemon *mon, struct UnknownPokemonStruct *src)
{
    s32 i;
    u8 nickname[POKEMON_NAME_LENGTH + 1];
    u8 language;
    u8 value;

    CreateMon(mon, src->species, src->level, 0, 1, src->personality, 1, src->otId);

    for (i = 0; i < 4; i++)
        SetMonMoveSlot(mon, src->moves[i], i);

    SetMonData(mon, MON_DATA_PP_BONUSES, (u8 *)&src->ppBonuses);
    SetMonData(mon, MON_DATA_HELD_ITEM, (u8 *)&src->heldItem);

    StringCopy(nickname, src->nickname);

    if (nickname[0] == 0xFC && nickname[1] == 0x15)
        language = LANGUAGE_JAPANESE;
    else
        language = GAME_LANGUAGE;

    SetMonData(mon, MON_DATA_LANGUAGE, &language);
    StripExtCtrlCodes(nickname);
    SetMonData(mon, MON_DATA_NICKNAME, nickname);
    SetMonData(mon, MON_DATA_FRIENDSHIP, (u8 *)&src->friendship);
    SetMonData(mon, MON_DATA_HP_EV, (u8 *)&src->hpEV);
    SetMonData(mon, MON_DATA_ATK_EV, (u8 *)&src->attackEV);
    SetMonData(mon, MON_DATA_DEF_EV, (u8 *)&src->defenseEV);
    SetMonData(mon, MON_DATA_SPD_EV, (u8 *)&src->speedEV);
    SetMonData(mon, MON_DATA_SPATK_EV, (u8 *)&src->spAttackEV);
    SetMonData(mon, MON_DATA_SPDEF_EV, (u8 *)&src->spDefenseEV);
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
    CalculateMonStats(mon);
}

void sub_803AF78(struct Pokemon *mon, struct UnknownPokemonStruct *dest)
{
    s32 i;
    u16 heldItem;

    dest->species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    heldItem = GetMonData(mon, MON_DATA_HELD_ITEM, NULL);

    if (heldItem == ITEM_ENIGMA_BERRY)
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

u16 CalculateBoxMonChecksum(struct BoxPokemon *boxMon)
{
    u16 checksum = 0;
    union PokemonSubstruct *substruct0 = GetSubstruct(boxMon, boxMon->personality, 0);
    union PokemonSubstruct *substruct1 = GetSubstruct(boxMon, boxMon->personality, 1);
    union PokemonSubstruct *substruct2 = GetSubstruct(boxMon, boxMon->personality, 2);
    union PokemonSubstruct *substruct3 = GetSubstruct(boxMon, boxMon->personality, 3);
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

void CalculateMonStats(struct Pokemon *mon)
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
    s32 level = GetLevelFromMonExp(mon);
    s32 newMaxHP;

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

#ifdef DEBUG
__attribute__((naked))
void debug_sub_803F55C()
{
    asm(
        "	push	{r4, r5, r6, r7, lr}\n"
        "	mov	r7, sl\n"
        "	mov	r6, r9\n"
        "	mov	r5, r8\n"
        "	push	{r5, r6, r7}\n"
        "	add	sp, sp, #0xffffffc4\n"
        "	add	r5, r0, #0\n"
        "	mov	r1, #0x39\n"
        "	mov	r2, #0x0\n"
        "	bl	GetMonData\n"
        "	str	r0, [sp, #0x1c]\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0x27\n"
        "	mov	r2, #0x0\n"
        "	bl	GetMonData\n"
        "	add	r7, r0, #0\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0x1a\n"
        "	mov	r2, #0x0\n"
        "	bl	GetMonData\n"
        "	add	r4, r0, #0\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0x28\n"
        "	mov	r2, #0x0\n"
        "	bl	GetMonData\n"
        "	mov	r9, r0\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0x1b\n"
        "	mov	r2, #0x0\n"
        "	bl	GetMonData\n"
        "	mov	r8, r0\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0x29\n"
        "	mov	r2, #0x0\n"
        "	bl	GetMonData\n"
        "	str	r0, [sp, #0x20]\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0x1c\n"
        "	mov	r2, #0x0\n"
        "	bl	GetMonData\n"
        "	mov	sl, r0\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0x2a\n"
        "	mov	r2, #0x0\n"
        "	bl	GetMonData\n"
        "	str	r0, [sp, #0x24]\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0x1d\n"
        "	mov	r2, #0x0\n"
        "	bl	GetMonData\n"
        "	str	r0, [sp, #0x28]\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0x2b\n"
        "	mov	r2, #0x0\n"
        "	bl	GetMonData\n"
        "	str	r0, [sp, #0x2c]\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0x1e\n"
        "	mov	r2, #0x0\n"
        "	bl	GetMonData\n"
        "	str	r0, [sp, #0x30]\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0x2c\n"
        "	mov	r2, #0x0\n"
        "	bl	GetMonData\n"
        "	str	r0, [sp, #0x34]\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0x1f\n"
        "	mov	r2, #0x0\n"
        "	bl	GetMonData\n"
        "	str	r0, [sp, #0x38]\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0xb\n"
        "	mov	r2, #0x0\n"
        "	bl	GetMonData\n"
        "	lsl	r0, r0, #0x10\n"
        "	lsr	r6, r0, #0x10\n"
        "	add	r0, r5, #0\n"
        "	bl	GetLevelFromMonExp\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	str	r0, [sp]\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0x38\n"
        "	mov	r2, sp\n"
        "	bl	SetMonData\n"
        "	ldr	r0, ._71\n"
        "	cmp	r6, r0\n"
        "	bne	._69	@cond_branch\n"
        "	mov	r0, #0x1\n"
        "	str	r0, [sp, #0x4]\n"
        "	lsl	r7, r6, #0x3\n"
        "	b	._70\n"
        "._72:\n"
        "	.align	2, 0\n"
        "._71:\n"
        "	.word	0x12f\n"
        "._69:\n"
        "	ldr	r1, ._80\n"
        "	lsl	r2, r6, #0x3\n"
        "	sub	r0, r2, r6\n"
        "	lsl	r0, r0, #0x2\n"
        "	add	r0, r0, r1\n"
        "	ldrb	r0, [r0]\n"
        "	lsl	r0, r0, #0x1\n"
        "	add	r1, r0, r7\n"
        "	add	r0, r4, #0\n"
        "	add	r7, r2, #0\n"
        "	cmp	r0, #0\n"
        "	bge	._73	@cond_branch\n"
        "	add	r0, r0, #0x3\n"
        "._73:\n"
        "	asr	r0, r0, #0x2\n"
        "	add	r0, r1, r0\n"
        "	ldr	r4, [sp]\n"
        "	mul	r0, r0, r4\n"
        "	mov	r1, #0x64\n"
        "	bl	gScriptFuncs_End+0x3d30\n"
        "	add	r0, r0, r4\n"
        "	add	r0, r0, #0xa\n"
        "	str	r0, [sp, #0x4]\n"
        "._70:\n"
        "	add	r2, sp, #0x4\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0x3a\n"
        "	bl	SetMonData\n"
        "	ldr	r1, ._80\n"
        "	sub	r0, r7, r6\n"
        "	lsl	r0, r0, #0x2\n"
        "	add	r6, r0, r1\n"
        "	ldrb	r0, [r6, #0x1]\n"
        "	lsl	r0, r0, #0x1\n"
        "	mov	r2, r9\n"
        "	add	r1, r0, r2\n"
        "	mov	r0, r8\n"
        "	cmp	r0, #0\n"
        "	bge	._74	@cond_branch\n"
        "	add	r0, r0, #0x3\n"
        "._74:\n"
        "	asr	r0, r0, #0x2\n"
        "	add	r0, r1, r0\n"
        "	ldr	r1, [sp]\n"
        "	mul	r0, r0, r1\n"
        "	mov	r1, #0x64\n"
        "	bl	gScriptFuncs_End+0x3d30\n"
        "	add	r0, r0, #0x5\n"
        "	str	r0, [sp, #0x8]\n"
        "	add	r0, r5, #0\n"
        "	bl	GetNature\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	add	r4, sp, #0x8\n"
        "	ldrh	r1, [r4]\n"
        "	mov	r2, #0x1\n"
        "	bl	nature_stat_mod\n"
        "	lsl	r0, r0, #0x10\n"
        "	lsr	r0, r0, #0x10\n"
        "	str	r0, [sp, #0x8]\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0x3b\n"
        "	add	r2, r4, #0\n"
        "	bl	SetMonData\n"
        "	ldrb	r0, [r6, #0x2]\n"
        "	lsl	r0, r0, #0x1\n"
        "	ldr	r2, [sp, #0x20]\n"
        "	add	r1, r0, r2\n"
        "	mov	r0, sl\n"
        "	cmp	r0, #0\n"
        "	bge	._75	@cond_branch\n"
        "	add	r0, r0, #0x3\n"
        "._75:\n"
        "	asr	r0, r0, #0x2\n"
        "	add	r0, r1, r0\n"
        "	ldr	r1, [sp]\n"
        "	mul	r0, r0, r1\n"
        "	mov	r1, #0x64\n"
        "	bl	gScriptFuncs_End+0x3d30\n"
        "	add	r0, r0, #0x5\n"
        "	str	r0, [sp, #0xc]\n"
        "	add	r0, r5, #0\n"
        "	bl	GetNature\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	add	r4, sp, #0xc\n"
        "	ldrh	r1, [r4]\n"
        "	mov	r2, #0x2\n"
        "	bl	nature_stat_mod\n"
        "	lsl	r0, r0, #0x10\n"
        "	lsr	r0, r0, #0x10\n"
        "	str	r0, [sp, #0xc]\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0x3c\n"
        "	add	r2, r4, #0\n"
        "	bl	SetMonData\n"
        "	ldrb	r0, [r6, #0x3]\n"
        "	lsl	r0, r0, #0x1\n"
        "	ldr	r2, [sp, #0x24]\n"
        "	add	r1, r0, r2\n"
        "	ldr	r0, [sp, #0x28]\n"
        "	cmp	r0, #0\n"
        "	bge	._76	@cond_branch\n"
        "	add	r0, r0, #0x3\n"
        "._76:\n"
        "	asr	r0, r0, #0x2\n"
        "	add	r0, r1, r0\n"
        "	ldr	r1, [sp]\n"
        "	mul	r0, r0, r1\n"
        "	mov	r1, #0x64\n"
        "	bl	gScriptFuncs_End+0x3d30\n"
        "	add	r0, r0, #0x5\n"
        "	str	r0, [sp, #0x10]\n"
        "	add	r0, r5, #0\n"
        "	bl	GetNature\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	add	r4, sp, #0x10\n"
        "	ldrh	r1, [r4]\n"
        "	mov	r2, #0x3\n"
        "	bl	nature_stat_mod\n"
        "	lsl	r0, r0, #0x10\n"
        "	lsr	r0, r0, #0x10\n"
        "	str	r0, [sp, #0x10]\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0x3d\n"
        "	add	r2, r4, #0\n"
        "	bl	SetMonData\n"
        "	ldrb	r0, [r6, #0x4]\n"
        "	lsl	r0, r0, #0x1\n"
        "	ldr	r2, [sp, #0x2c]\n"
        "	add	r1, r0, r2\n"
        "	ldr	r0, [sp, #0x30]\n"
        "	cmp	r0, #0\n"
        "	bge	._77	@cond_branch\n"
        "	add	r0, r0, #0x3\n"
        "._77:\n"
        "	asr	r0, r0, #0x2\n"
        "	add	r0, r1, r0\n"
        "	ldr	r1, [sp]\n"
        "	mul	r0, r0, r1\n"
        "	mov	r1, #0x64\n"
        "	bl	gScriptFuncs_End+0x3d30\n"
        "	add	r0, r0, #0x5\n"
        "	str	r0, [sp, #0x14]\n"
        "	add	r0, r5, #0\n"
        "	bl	GetNature\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	add	r4, sp, #0x14\n"
        "	ldrh	r1, [r4]\n"
        "	mov	r2, #0x4\n"
        "	bl	nature_stat_mod\n"
        "	lsl	r0, r0, #0x10\n"
        "	lsr	r0, r0, #0x10\n"
        "	str	r0, [sp, #0x14]\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0x3e\n"
        "	add	r2, r4, #0\n"
        "	bl	SetMonData\n"
        "	ldrb	r0, [r6, #0x5]\n"
        "	lsl	r0, r0, #0x1\n"
        "	ldr	r1, [sp, #0x34]\n"
        "	add	r2, r0, r1\n"
        "	ldr	r0, [sp, #0x38]\n"
        "	cmp	r0, #0\n"
        "	bge	._78	@cond_branch\n"
        "	add	r0, r0, #0x3\n"
        "._78:\n"
        "	asr	r0, r0, #0x2\n"
        "	add	r0, r2, r0\n"
        "	ldr	r1, [sp]\n"
        "	mul	r0, r0, r1\n"
        "	mov	r1, #0x64\n"
        "	bl	gScriptFuncs_End+0x3d30\n"
        "	add	r0, r0, #0x5\n"
        "	str	r0, [sp, #0x18]\n"
        "	add	r0, r5, #0\n"
        "	bl	GetNature\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	add	r4, sp, #0x18\n"
        "	ldrh	r1, [r4]\n"
        "	mov	r2, #0x5\n"
        "	bl	nature_stat_mod\n"
        "	lsl	r0, r0, #0x10\n"
        "	lsr	r0, r0, #0x10\n"
        "	str	r0, [sp, #0x18]\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0x3f\n"
        "	add	r2, r4, #0\n"
        "	bl	SetMonData\n"
        "	ldr	r1, [sp, #0x4]\n"
        "	ldr	r0, [sp, #0x1c]\n"
        "	cmp	r1, r0\n"
        "	bge	._79	@cond_branch\n"
        "	str	r1, [sp, #0x1c]\n"
        "._79:\n"
        "	add	r2, sp, #0x1c\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0x39\n"
        "	bl	SetMonData\n"
        "	add	sp, sp, #0x3c\n"
        "	pop	{r3, r4, r5}\n"
        "	mov	r8, r3\n"
        "	mov	r9, r4\n"
        "	mov	sl, r5\n"
        "	pop	{r4, r5, r6, r7}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._81:\n"
        "	.align	2, 0\n"
        "._80:\n"
        "	.word	gBaseStats\n"
        "\n"
    );
}
#endif

void sub_803B4B4(struct Pokemon *src, struct Pokemon *dest)
{
    u32 value = 0;
    memcpy(&dest->box, &src->box, sizeof(struct BoxPokemon));
    SetMonData(dest, MON_DATA_STATUS, (u8 *)&value);
    SetMonData(dest, MON_DATA_HP, (u8 *)&value);
    SetMonData(dest, MON_DATA_MAX_HP, (u8 *)&value);
    value = 255;
    SetMonData(dest, MON_DATA_MAIL, (u8 *)&value);
    CalculateMonStats(dest);
}

u8 GetLevelFromMonExp(struct Pokemon *mon)
{
    u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    u32 exp = GetMonData(mon, MON_DATA_EXP, NULL);
    s32 level = 1;

    while (level <= 100 && gExperienceTables[gBaseStats[species].growthRate][level] <= exp)
        level++;

    return level - 1;
}

u8 GetLevelFromBoxMonExp(struct BoxPokemon *boxMon)
{
    u16 species = GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL);
    u32 exp = GetBoxMonData(boxMon, MON_DATA_EXP, NULL);
    s32 level = 1;

    while (level <= 100 && gExperienceTables[gBaseStats[species].growthRate][level] <= exp)
        level++;

    return level - 1;
}

u16 GiveMoveToMon(struct Pokemon *mon, u16 move)
{
    return GiveMoveToBoxMon(&mon->box, move);
}

u16 GiveMoveToBoxMon(struct BoxPokemon *boxMon, u16 move)
{
    s32 i;
    for (i = 0; i < 4; i++)
    {
        u16 existingMove = GetBoxMonData(boxMon, MON_DATA_MOVE1 + i, NULL);
        if (!existingMove)
        {
            SetBoxMonData(boxMon, MON_DATA_MOVE1 + i, (u8 *)&move);
            SetBoxMonData(boxMon, MON_DATA_PP1 + i, &gBattleMoves[move].pp);
            return move;
        }
        if (existingMove == move)
            return -2;
    }
    return -1;
}

u16 GiveMoveToBattleMon(struct BattlePokemon *mon, u16 move)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        if (!mon->moves[i])
        {
            mon->moves[i] = move;
            mon->pp[i] = gBattleMoves[move].pp;
            return move;
        }
    }

    return -1;
}

void SetMonMoveSlot(struct Pokemon *mon, u16 move, u8 slot)
{
    SetMonData(mon, MON_DATA_MOVE1 + slot, (u8 *)&move);
    SetMonData(mon, MON_DATA_PP1 + slot, &gBattleMoves[move].pp);
}

void SetBattleMonMoveSlot(struct BattlePokemon *mon, u16 move, u8 slot)
{
    mon->moves[slot] = move;
    mon->pp[slot] = gBattleMoves[move].pp;
}

void GiveMonInitialMoveset(struct Pokemon *mon)
{
    GiveBoxMonInitialMoveset(&mon->box);
}

void GiveBoxMonInitialMoveset(struct BoxPokemon *boxMon)
{
    u16 species = GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL);
    s32 level = GetLevelFromBoxMonExp(boxMon);
    s32 i;

    for (i = 0; gLevelUpLearnsets[species][i] != (u16)-1; i++)
    {
        u16 moveLevel;
        u16 move;

        moveLevel = (gLevelUpLearnsets[species][i] & 0xFE00);

        if (moveLevel > (level << 9))
            break;

        move = (gLevelUpLearnsets[species][i] & 0x1FF);

        if (GiveMoveToBoxMon(boxMon, move) == (u16)-1)
            DeleteFirstMoveAndGiveMoveToBoxMon(boxMon, move);
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

        while ((gLevelUpLearnsets[species][byte_2024E88] & 0xFE00) != (level << 9))
        {
            byte_2024E88++;
            if (gLevelUpLearnsets[species][byte_2024E88] == (u16)-1)
                return 0;
        }
    }

    if ((gLevelUpLearnsets[species][byte_2024E88] & 0xFE00) == (level << 9))
    {
        word_2024E82 = (gLevelUpLearnsets[species][byte_2024E88] & 0x1FF);
        byte_2024E88++;
        retVal = GiveMoveToMon(mon, word_2024E82);
    }

    return retVal;
}

void DeleteFirstMoveAndGiveMoveToMon(struct Pokemon *mon, u16 move)
{
    s32 i;
    u16 moves[4];
    u8 pp[4];
    u8 ppBonuses;

    for (i = 0; i < 3; i++)
    {
        moves[i] = GetMonData(mon, MON_DATA_MOVE2 + i, NULL);
        pp[i] = GetMonData(mon, MON_DATA_PP2 + i, NULL);
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

void DeleteFirstMoveAndGiveMoveToBoxMon(struct BoxPokemon *boxMon, u16 move)
{
    s32 i;
    u16 moves[4];
    u8 pp[4];
    u8 ppBonuses;

    for (i = 0; i < 3; i++)
    {
        moves[i] = GetBoxMonData(boxMon, MON_DATA_MOVE2 + i, NULL);
        pp[i] = GetBoxMonData(boxMon, MON_DATA_PP2 + i, NULL);
    }

    ppBonuses = GetBoxMonData(boxMon, MON_DATA_PP_BONUSES, NULL);
    ppBonuses >>= 2;
    moves[3] = move;
    pp[3] = gBattleMoves[move].pp;

    for (i = 0; i < 4; i++)
    {
        SetBoxMonData(boxMon, MON_DATA_MOVE1 + i, (u8 *)&moves[i]);
        SetBoxMonData(boxMon, MON_DATA_PP1 + i, &pp[i]);
    }

    SetBoxMonData(boxMon, MON_DATA_PP_BONUSES, &ppBonuses);
}
