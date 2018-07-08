#include "global.h"
#include "constants/hold_effects.h"
#include "constants/moves.h"
#include "battle.h"
#include "battle_util.h"
#include "data2.h"
#include "event_data.h"
#include "main.h"
#include "pokemon.h"
#include "random.h"
#include "rom_8077ABC.h"
#include "constants/species.h"
#include "sprite.h"
#include "string_util.h"
#include "strings2.h"
#include "text.h"
#include "trainer.h"
#include "util.h"
#include "ewram.h"

extern u8 gPlayerPartyCount;
extern u8 gEnemyPartyCount;

extern u16 gBattleTypeFlags;
extern u8 gActiveBattler;
extern struct BattlePokemon gBattleMons[4];
extern u16 gCurrentMove;
extern u8 gLastUsedAbility;
extern u8 gBankAttacker;
extern u8 gBankTarget;
extern u8 gAbsentBattlerFlags;
extern u8 gXXX_CritRelated;
extern u16 gBattleWeather;
extern struct BattleEnigmaBerry gEnigmaBerries[];
extern u16 gBattleMovePower;
extern u16 gTrainerBattleOpponent;
extern struct PokemonStorage gPokemonStorage;

EWRAM_DATA struct SpriteTemplate gUnknown_02024E8C = {0};

extern u8 gBadEggNickname[];
extern const struct SpriteTemplate gSpriteTemplate_8208288[];
//array of pointers to arrays of pointers to union AnimCmd (We probably need to typedef this.)
extern u8 gTrainerClassToPicIndex[];
extern u8 gTrainerClassToNameIndex[];

extern const u8 gPPUpReadMasks[];
extern const u8 gPPUpWriteMasks[];

extern void sub_80105A0(struct Sprite *);
extern void oac_poke_opponent(struct Sprite *);

u8 CountAliveMons(u8 a1)
{
    s32 i;
    u8 retVal = 0;

    switch (a1)
    {
    case 0:
        for (i = 0; i < 4; i++)
        {
            if (i != gActiveBattler && !(gAbsentBattlerFlags & gBitTable[i]))
                retVal++;
        }
        break;
    case 1:
        for (i = 0; i < 4; i++)
        {
            if (GetBattlerSide(i) == GetBattlerSide(gBankAttacker) && !(gAbsentBattlerFlags & gBitTable[i]))
                retVal++;
        }
        break;
    case 2:
        for (i = 0; i < 4; i++)
        {
            if (GetBattlerSide(i) == GetBattlerSide(gBankTarget) && !(gAbsentBattlerFlags & gBitTable[i]))
                retVal++;
        }
        break;
    }

    return retVal;
}

u8 sub_803C434(u8 a1)
{
    u8 status = GetBattlerPosition(a1) & 1;

    status ^= 1;
    if (!(gBattleTypeFlags & BATTLE_TYPE_DOUBLE))
        return GetBattlerAtPosition(status);
    if (CountAliveMons(0) > 1)
    {
        u8 val;

        if ((Random() & 1) == 0)
            val = status ^ 2;
        else
            val = status;
        return GetBattlerAtPosition(val);
    }
    else
    {
        if ((gAbsentBattlerFlags & gBitTable[status]))
            return GetBattlerAtPosition(status ^ 2);
        else
            return GetBattlerAtPosition(status);
    }
}

u8 GetMonGender(struct Pokemon *mon)
{
    return GetBoxMonGender(&mon->box);
}

u8 GetBoxMonGender(struct BoxPokemon *boxMon)
{
    u16 species = GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL);
    u32 personality = GetBoxMonData(boxMon, MON_DATA_PERSONALITY, NULL);

    switch (gBaseStats[species].genderRatio)
    {
    case MON_MALE:
    case MON_FEMALE:
    case MON_GENDERLESS:
        return gBaseStats[species].genderRatio;
    }

    if (gBaseStats[species].genderRatio > (personality & 0xFF))
        return MON_FEMALE;
    else
        return MON_MALE;
}

u8 GetGenderFromSpeciesAndPersonality(u16 species, u32 personality)
{
    switch (gBaseStats[species].genderRatio)
    {
    case MON_MALE:
    case MON_FEMALE:
    case MON_GENDERLESS:
        return gBaseStats[species].genderRatio;
    }

    if (gBaseStats[species].genderRatio > (personality & 0xFF))
        return MON_FEMALE;
    else
        return MON_MALE;
}

const struct SpriteTemplate gSpriteTemplate_8208288[] =
{
    {0xFFFF, 0, &gOamData_81F96F0, NULL, gSpriteImageTable_81E7A10, gSpriteAffineAnimTable_81E7B70, sub_80105A0},
    {0xFFFF, 0, &gOamData_81F96E8, NULL, gSpriteImageTable_81E7A30, gSpriteAffineAnimTable_81E7BEC, oac_poke_opponent},
    {0xFFFF, 0, &gOamData_81F96F0, NULL, gSpriteImageTable_81E7A50, gSpriteAffineAnimTable_81E7B70, sub_80105A0},
    {0xFFFF, 0, &gOamData_81F96E8, NULL, gSpriteImageTable_81E7A70, gSpriteAffineAnimTable_81E7BEC, oac_poke_opponent},
};

void GetMonSpriteTemplate_803C56C(u16 species, u8 a2)
{
    gUnknown_02024E8C = gSpriteTemplate_8208288[a2];
    gUnknown_02024E8C.paletteTag = species;
    gUnknown_02024E8C.anims = (const union AnimCmd *const *)gSpriteAnimTable_81E7C64;  //Why do I have to cast this?
}

void GetMonSpriteTemplate_803C5A0(u16 species, u8 a2)
{
    gUnknown_02024E8C = gSpriteTemplate_8208288[a2];
    gUnknown_02024E8C.paletteTag = species;
    if (a2 == 0 || a2 == 2)
        gUnknown_02024E8C.anims = gUnknown_081ECACC[species];
    else
        gUnknown_02024E8C.anims = gUnknown_081EC2A4[species];
}

void EncryptBoxMon(struct BoxPokemon *boxMon)
{
    u32 i;
    for (i = 0; i < 12; i++)
    {
        boxMon->secure.raw[i] ^= boxMon->personality;
        boxMon->secure.raw[i] ^= boxMon->otId;
    }
}

void DecryptBoxMon(struct BoxPokemon *boxMon)
{
    u32 i;
    for (i = 0; i < 12; i++)
    {
        boxMon->secure.raw[i] ^= boxMon->otId;
        boxMon->secure.raw[i] ^= boxMon->personality;
    }
}

#define SUBSTRUCT_CASE(n, v1, v2, v3, v4)  \
case n:                                    \
    switch (substructType)                 \
    {                                      \
    case 0:                                \
        substruct = &substructs ## n [v1]; \
        break;                             \
    case 1:                                \
        substruct = &substructs ## n [v2]; \
        break;                             \
    case 2:                                \
        substruct = &substructs ## n [v3]; \
        break;                             \
    case 3:                                \
        substruct = &substructs ## n [v4]; \
        break;                             \
    }                                      \
    break;

union PokemonSubstruct *GetSubstruct(struct BoxPokemon *boxMon, u32 personality, u8 substructType)
{
    union PokemonSubstruct *substruct = NULL;

    union PokemonSubstruct *substructs0 = boxMon->secure.substructs;
    union PokemonSubstruct *substructs1 = boxMon->secure.substructs;
    union PokemonSubstruct *substructs2 = boxMon->secure.substructs;
    union PokemonSubstruct *substructs3 = boxMon->secure.substructs;
    union PokemonSubstruct *substructs4 = boxMon->secure.substructs;
    union PokemonSubstruct *substructs5 = boxMon->secure.substructs;
    union PokemonSubstruct *substructs6 = boxMon->secure.substructs;
    union PokemonSubstruct *substructs7 = boxMon->secure.substructs;
    union PokemonSubstruct *substructs8 = boxMon->secure.substructs;
    union PokemonSubstruct *substructs9 = boxMon->secure.substructs;
    union PokemonSubstruct *substructs10 = boxMon->secure.substructs;
    union PokemonSubstruct *substructs11 = boxMon->secure.substructs;
    union PokemonSubstruct *substructs12 = boxMon->secure.substructs;
    union PokemonSubstruct *substructs13 = boxMon->secure.substructs;
    union PokemonSubstruct *substructs14 = boxMon->secure.substructs;
    union PokemonSubstruct *substructs15 = boxMon->secure.substructs;
    union PokemonSubstruct *substructs16 = boxMon->secure.substructs;
    union PokemonSubstruct *substructs17 = boxMon->secure.substructs;
    union PokemonSubstruct *substructs18 = boxMon->secure.substructs;
    union PokemonSubstruct *substructs19 = boxMon->secure.substructs;
    union PokemonSubstruct *substructs20 = boxMon->secure.substructs;
    union PokemonSubstruct *substructs21 = boxMon->secure.substructs;
    union PokemonSubstruct *substructs22 = boxMon->secure.substructs;
    union PokemonSubstruct *substructs23 = boxMon->secure.substructs;

    switch (personality % 24)
    {
    SUBSTRUCT_CASE( 0,0,1,2,3)
    SUBSTRUCT_CASE( 1,0,1,3,2)
    SUBSTRUCT_CASE( 2,0,2,1,3)
    SUBSTRUCT_CASE( 3,0,3,1,2)
    SUBSTRUCT_CASE( 4,0,2,3,1)
    SUBSTRUCT_CASE( 5,0,3,2,1)
    SUBSTRUCT_CASE( 6,1,0,2,3)
    SUBSTRUCT_CASE( 7,1,0,3,2)
    SUBSTRUCT_CASE( 8,2,0,1,3)
    SUBSTRUCT_CASE( 9,3,0,1,2)
    SUBSTRUCT_CASE(10,2,0,3,1)
    SUBSTRUCT_CASE(11,3,0,2,1)
    SUBSTRUCT_CASE(12,1,2,0,3)
    SUBSTRUCT_CASE(13,1,3,0,2)
    SUBSTRUCT_CASE(14,2,1,0,3)
    SUBSTRUCT_CASE(15,3,1,0,2)
    SUBSTRUCT_CASE(16,2,3,0,1)
    SUBSTRUCT_CASE(17,3,2,0,1)
    SUBSTRUCT_CASE(18,1,2,3,0)
    SUBSTRUCT_CASE(19,1,3,2,0)
    SUBSTRUCT_CASE(20,2,1,3,0)
    SUBSTRUCT_CASE(21,3,1,2,0)
    SUBSTRUCT_CASE(22,2,3,1,0)
    SUBSTRUCT_CASE(23,3,2,1,0)
    }

    return substruct;
}

u32 GetMonData(struct Pokemon *mon, s32 field, u8 *data)
{
    switch (field)
    {
    case MON_DATA_STATUS:
        return mon->status;
    case MON_DATA_LEVEL:
        return mon->level;
    case MON_DATA_HP:
        return mon->hp;
    case MON_DATA_MAX_HP:
        return mon->maxHP;
    case MON_DATA_ATK:
        return mon->attack;
    case MON_DATA_DEF:
        return mon->defense;
    case MON_DATA_SPEED:
        return mon->speed;
    case MON_DATA_SPATK:
        return mon->spAttack;
    case MON_DATA_SPDEF:
        return mon->spDefense;
    case MON_DATA_MAIL:
        return mon->mail;
    default:
        return GetBoxMonData(&mon->box, field, data);
    }
}

u32 GetBoxMonData(struct BoxPokemon *boxMon, s32 field, u8 *data)
{
    u32 retVal = 0;
    struct PokemonSubstruct0 *substruct0 = NULL;
    struct PokemonSubstruct1 *substruct1 = NULL;
    struct PokemonSubstruct2 *substruct2 = NULL;
    struct PokemonSubstruct3 *substruct3 = NULL;

    if (field > MON_DATA_10)
    {
        substruct0 = &(GetSubstruct(boxMon, boxMon->personality, 0)->type0);
        substruct1 = &(GetSubstruct(boxMon, boxMon->personality, 1)->type1);
        substruct2 = &(GetSubstruct(boxMon, boxMon->personality, 2)->type2);
        substruct3 = &(GetSubstruct(boxMon, boxMon->personality, 3)->type3);

        DecryptBoxMon(boxMon);

        if (CalculateBoxMonChecksum(boxMon) != boxMon->checksum)
        {
            boxMon->isBadEgg = 1;
            boxMon->isEgg = 1;
            substruct3->isEgg = 1;
        }
    }

    switch (field)
    {
    case MON_DATA_PERSONALITY:
        retVal = boxMon->personality;
        break;
    case MON_DATA_OT_ID:
        retVal = boxMon->otId;
        break;
    case MON_DATA_NICKNAME:
    {
        if (boxMon->isBadEgg)
        {
            StringCopy(data, gBadEggNickname);
            retVal = StringLength(data);
        }
        else if (boxMon->isEgg)
        {
            StringCopy(data, gEggNickname);
            retVal = StringLength(data);
        }
        else
        {
            retVal = 0;

            while (retVal < POKEMON_NAME_LENGTH && boxMon->nickname[retVal] != EOS)
            {
                data[retVal] = boxMon->nickname[retVal];
                retVal++;
            }

            data[retVal] = EOS;
            ConvertInternationalString(data, boxMon->language);
            retVal = StringLength(data);
        }
        break;
    }
    case MON_DATA_LANGUAGE:
        retVal = boxMon->language;
        break;
    case MON_DATA_SANITY_BIT1:
        retVal = boxMon->isBadEgg;
        break;
    case MON_DATA_SANITY_BIT2:
        retVal = boxMon->hasSpecies;
        break;
    case MON_DATA_SANITY_BIT3:
        retVal = boxMon->isEgg;
        break;
    case MON_DATA_OT_NAME:
    {
        retVal = 0;

        while (retVal < OT_NAME_LENGTH && boxMon->otName[retVal] != EOS)
        {
            data[retVal] = boxMon->otName[retVal];
            retVal++;
        }

        data[retVal] = EOS;
        break;
    }
    case MON_DATA_MARKINGS:
        retVal = boxMon->markings;
        break;
    case MON_DATA_CHECKSUM:
        retVal = boxMon->checksum;
        break;
    case MON_DATA_10:
        retVal = boxMon->unknown;
        break;
    case MON_DATA_SPECIES:
        retVal = boxMon->isBadEgg ? SPECIES_EGG : substruct0->species;
        break;
    case MON_DATA_HELD_ITEM:
        retVal = substruct0->heldItem;
        break;
    case MON_DATA_EXP:
        retVal = substruct0->experience;
        break;
    case MON_DATA_PP_BONUSES:
        retVal = substruct0->ppBonuses;
        break;
    case MON_DATA_FRIENDSHIP:
        retVal = substruct0->friendship;
        break;
    case MON_DATA_MOVE1:
    case MON_DATA_MOVE2:
    case MON_DATA_MOVE3:
    case MON_DATA_MOVE4:
        retVal = substruct1->moves[field - MON_DATA_MOVE1];
        break;
    case MON_DATA_PP1:
    case MON_DATA_PP2:
    case MON_DATA_PP3:
    case MON_DATA_PP4:
        retVal = substruct1->pp[field - MON_DATA_PP1];
        break;
    case MON_DATA_HP_EV:
        retVal = substruct2->hpEV;
        break;
    case MON_DATA_ATK_EV:
        retVal = substruct2->attackEV;
        break;
    case MON_DATA_DEF_EV:
        retVal = substruct2->defenseEV;
        break;
    case MON_DATA_SPEED_EV:
        retVal = substruct2->speedEV;
        break;
    case MON_DATA_SPATK_EV:
        retVal = substruct2->spAttackEV;
        break;
    case MON_DATA_SPDEF_EV:
        retVal = substruct2->spDefenseEV;
        break;
    case MON_DATA_COOL:
        retVal = substruct2->cool;
        break;
    case MON_DATA_BEAUTY:
        retVal = substruct2->beauty;
        break;
    case MON_DATA_CUTE:
        retVal = substruct2->cute;
        break;
    case MON_DATA_SMART:
        retVal = substruct2->smart;
        break;
    case MON_DATA_TOUGH:
        retVal = substruct2->tough;
        break;
    case MON_DATA_SHEEN:
        retVal = substruct2->sheen;
        break;
    case MON_DATA_POKERUS:
        retVal = substruct3->pokerus;
        break;
    case MON_DATA_MET_LOCATION:
        retVal = substruct3->metLocation;
        break;
    case MON_DATA_MET_LEVEL:
        retVal = substruct3->metLevel;
        break;
    case MON_DATA_MET_GAME:
        retVal = substruct3->metGame;
        break;
    case MON_DATA_POKEBALL:
        retVal = substruct3->pokeball;
        break;
    case MON_DATA_OT_GENDER:
        retVal = substruct3->otGender;
        break;
    case MON_DATA_HP_IV:
        retVal = substruct3->hpIV;
        break;
    case MON_DATA_ATK_IV:
        retVal = substruct3->attackIV;
        break;
    case MON_DATA_DEF_IV:
        retVal = substruct3->defenseIV;
        break;
    case MON_DATA_SPEED_IV:
        retVal = substruct3->speedIV;
        break;
    case MON_DATA_SPATK_IV:
        retVal = substruct3->spAttackIV;
        break;
    case MON_DATA_SPDEF_IV:
        retVal = substruct3->spDefenseIV;
        break;
    case MON_DATA_IS_EGG:
        retVal = substruct3->isEgg;
        break;
    case MON_DATA_ALT_ABILITY:
        retVal = substruct3->altAbility;
        break;
    case MON_DATA_COOL_RIBBON:
        retVal = substruct3->coolRibbon;
        break;
    case MON_DATA_BEAUTY_RIBBON:
        retVal = substruct3->beautyRibbon;
        break;
    case MON_DATA_CUTE_RIBBON:
        retVal = substruct3->cuteRibbon;
        break;
    case MON_DATA_SMART_RIBBON:
        retVal = substruct3->smartRibbon;
        break;
    case MON_DATA_TOUGH_RIBBON:
        retVal = substruct3->toughRibbon;
        break;
    case MON_DATA_CHAMPION_RIBBON:
        retVal = substruct3->championRibbon;
        break;
    case MON_DATA_WINNING_RIBBON:
        retVal = substruct3->winningRibbon;
        break;
    case MON_DATA_VICTORY_RIBBON:
        retVal = substruct3->victoryRibbon;
        break;
    case MON_DATA_ARTIST_RIBBON:
        retVal = substruct3->artistRibbon;
        break;
    case MON_DATA_EFFORT_RIBBON:
        retVal = substruct3->effortRibbon;
        break;
    case MON_DATA_GIFT_RIBBON_1:
        retVal = substruct3->giftRibbon1;
        break;
    case MON_DATA_GIFT_RIBBON_2:
        retVal = substruct3->giftRibbon2;
        break;
    case MON_DATA_GIFT_RIBBON_3:
        retVal = substruct3->giftRibbon3;
        break;
    case MON_DATA_GIFT_RIBBON_4:
        retVal = substruct3->giftRibbon4;
        break;
    case MON_DATA_GIFT_RIBBON_5:
        retVal = substruct3->giftRibbon5;
        break;
    case MON_DATA_GIFT_RIBBON_6:
        retVal = substruct3->giftRibbon6;
        break;
    case MON_DATA_GIFT_RIBBON_7:
        retVal = substruct3->giftRibbon7;
        break;
    case MON_DATA_FATEFUL_ENCOUNTER:
        retVal = substruct3->fatefulEncounter;
        break;
    case MON_DATA_SPECIES2:
        retVal = substruct0->species;
        if (substruct0->species && (substruct3->isEgg || boxMon->isBadEgg))
            retVal = SPECIES_EGG;
        break;
    case MON_DATA_IVS:
        retVal = substruct3->hpIV | (substruct3->attackIV << 5) | (substruct3->defenseIV << 10) | (substruct3->speedIV << 15) | (substruct3->spAttackIV << 20) | (substruct3->spDefenseIV << 25);
        break;
    case MON_DATA_KNOWN_MOVES:
        if (substruct0->species && !substruct3->isEgg)
        {
            u16 *moves = (u16 *)data;
            s32 i = 0;

            while (moves[i] != NUM_MOVES)
            {
                u16 move = moves[i];
                if (substruct1->moves[0] == move
                    || substruct1->moves[1] == move
                    || substruct1->moves[2] == move
                    || substruct1->moves[3] == move)
                    retVal |= gBitTable[i];
                i++;
            }
        }
        break;
    case MON_DATA_RIBBON_COUNT:
        retVal = 0;
        if (substruct0->species && !substruct3->isEgg)
        {
            retVal += substruct3->coolRibbon;
            retVal += substruct3->beautyRibbon;
            retVal += substruct3->cuteRibbon;
            retVal += substruct3->smartRibbon;
            retVal += substruct3->toughRibbon;
            retVal += substruct3->championRibbon;
            retVal += substruct3->winningRibbon;
            retVal += substruct3->victoryRibbon;
            retVal += substruct3->artistRibbon;
            retVal += substruct3->effortRibbon;
            retVal += substruct3->giftRibbon1;
            retVal += substruct3->giftRibbon2;
            retVal += substruct3->giftRibbon3;
            retVal += substruct3->giftRibbon4;
            retVal += substruct3->giftRibbon5;
            retVal += substruct3->giftRibbon6;
            retVal += substruct3->giftRibbon7;
        }
        break;
    case MON_DATA_RIBBONS:
        retVal = 0;
        if (substruct0->species && !substruct3->isEgg)
        {
            retVal = substruct3->championRibbon
                | (substruct3->coolRibbon << 1)
                | (substruct3->beautyRibbon << 4)
                | (substruct3->cuteRibbon << 7)
                | (substruct3->smartRibbon << 10)
                | (substruct3->toughRibbon << 13)
                | (substruct3->winningRibbon << 16)
                | (substruct3->victoryRibbon << 17)
                | (substruct3->artistRibbon << 18)
                | (substruct3->effortRibbon << 19)
                | (substruct3->giftRibbon1 << 20)
                | (substruct3->giftRibbon2 << 21)
                | (substruct3->giftRibbon3 << 22)
                | (substruct3->giftRibbon4 << 23)
                | (substruct3->giftRibbon5 << 24)
                | (substruct3->giftRibbon6 << 25)
                | (substruct3->giftRibbon7 << 26);
        }
        break;
    default:
        break;
    }

    if (field > MON_DATA_10)
        EncryptBoxMon(boxMon);

    return retVal;
}

#define SET8(lhs) (lhs) = *data
#define SET16(lhs) (lhs) = data[0] + (data[1] << 8)
#define SET32(lhs) (lhs) = data[0] + (data[1] << 8) + (data[2] << 16) + (data[3] << 24)

void SetMonData(struct Pokemon *mon, s32 field, const u8 *data)
{
    switch (field)
    {
    case MON_DATA_STATUS:
        SET32(mon->status);
        break;
    case MON_DATA_LEVEL:
        SET8(mon->level);
        break;
    case MON_DATA_HP:
        SET16(mon->hp);
        break;
    case MON_DATA_MAX_HP:
        SET16(mon->maxHP);
        break;
    case MON_DATA_ATK:
        SET16(mon->attack);
        break;
    case MON_DATA_DEF:
        SET16(mon->defense);
        break;
    case MON_DATA_SPEED:
        SET16(mon->speed);
        break;
    case MON_DATA_SPATK:
        SET16(mon->spAttack);
        break;
    case MON_DATA_SPDEF:
        SET16(mon->spDefense);
        break;
    case MON_DATA_MAIL:
        SET8(mon->mail);
        break;
    case MON_DATA_SPECIES2:
        break;
    default:
        SetBoxMonData(&mon->box, field, data);
        break;
    }
}

void SetBoxMonData(struct BoxPokemon *boxMon, s32 field, const u8 *data)
{
    struct PokemonSubstruct0 *substruct0 = NULL;
    struct PokemonSubstruct1 *substruct1 = NULL;
    struct PokemonSubstruct2 *substruct2 = NULL;
    struct PokemonSubstruct3 *substruct3 = NULL;

    if (field > MON_DATA_10)
    {
        substruct0 = &(GetSubstruct(boxMon, boxMon->personality, 0)->type0);
        substruct1 = &(GetSubstruct(boxMon, boxMon->personality, 1)->type1);
        substruct2 = &(GetSubstruct(boxMon, boxMon->personality, 2)->type2);
        substruct3 = &(GetSubstruct(boxMon, boxMon->personality, 3)->type3);

        DecryptBoxMon(boxMon);

        if (CalculateBoxMonChecksum(boxMon) != boxMon->checksum)
        {
            boxMon->isBadEgg = 1;
            boxMon->isEgg = 1;
            substruct3->isEgg = 1;
            EncryptBoxMon(boxMon);
            return;
        }
    }

    switch (field)
    {
    case MON_DATA_PERSONALITY:
        SET32(boxMon->personality);
        break;
    case MON_DATA_OT_ID:
        SET32(boxMon->otId);
        break;
    case MON_DATA_NICKNAME:
    {
        s32 i;
        for (i = 0; i < POKEMON_NAME_LENGTH; i++)
            boxMon->nickname[i] = data[i];
        break;
    }
    case MON_DATA_LANGUAGE:
        SET8(boxMon->language);
        break;
    case MON_DATA_SANITY_BIT1:
        SET8(boxMon->isBadEgg);
        break;
    case MON_DATA_SANITY_BIT2:
        SET8(boxMon->hasSpecies);
        break;
    case MON_DATA_SANITY_BIT3:
        SET8(boxMon->isEgg);
        break;
    case MON_DATA_OT_NAME:
    {
        s32 i;
        for (i = 0; i < OT_NAME_LENGTH; i++)
            boxMon->otName[i] = data[i];
        break;
    }
    case MON_DATA_MARKINGS:
        SET8(boxMon->markings);
        break;
    case MON_DATA_CHECKSUM:
        SET16(boxMon->checksum);
        break;
    case MON_DATA_10:
        SET16(boxMon->unknown);
        break;
    case MON_DATA_SPECIES:
    {
        SET16(substruct0->species);
        if (substruct0->species)
            boxMon->hasSpecies = 1;
        else
            boxMon->hasSpecies = 0;
        break;
    }
    case MON_DATA_HELD_ITEM:
        SET16(substruct0->heldItem);
        break;
    case MON_DATA_EXP:
        SET32(substruct0->experience);
        break;
    case MON_DATA_PP_BONUSES:
        SET8(substruct0->ppBonuses);
        break;
    case MON_DATA_FRIENDSHIP:
        SET8(substruct0->friendship);
        break;
    case MON_DATA_MOVE1:
    case MON_DATA_MOVE2:
    case MON_DATA_MOVE3:
    case MON_DATA_MOVE4:
        SET16(substruct1->moves[field - MON_DATA_MOVE1]);
        break;
    case MON_DATA_PP1:
    case MON_DATA_PP2:
    case MON_DATA_PP3:
    case MON_DATA_PP4:
        SET8(substruct1->pp[field - MON_DATA_PP1]);
        break;
    case MON_DATA_HP_EV:
        SET8(substruct2->hpEV);
        break;
    case MON_DATA_ATK_EV:
        SET8(substruct2->attackEV);
        break;
    case MON_DATA_DEF_EV:
        SET8(substruct2->defenseEV);
        break;
    case MON_DATA_SPEED_EV:
        SET8(substruct2->speedEV);
        break;
    case MON_DATA_SPATK_EV:
        SET8(substruct2->spAttackEV);
        break;
    case MON_DATA_SPDEF_EV:
        SET8(substruct2->spDefenseEV);
        break;
    case MON_DATA_COOL:
        SET8(substruct2->cool);
        break;
    case MON_DATA_BEAUTY:
        SET8(substruct2->beauty);
        break;
    case MON_DATA_CUTE:
        SET8(substruct2->cute);
        break;
    case MON_DATA_SMART:
        SET8(substruct2->smart);
        break;
    case MON_DATA_TOUGH:
        SET8(substruct2->tough);
        break;
    case MON_DATA_SHEEN:
        SET8(substruct2->sheen);
        break;
    case MON_DATA_POKERUS:
        SET8(substruct3->pokerus);
        break;
    case MON_DATA_MET_LOCATION:
        SET8(substruct3->metLocation);
        break;
    case MON_DATA_MET_LEVEL:
    {
        u8 metLevel = *data;
        substruct3->metLevel = metLevel;
        break;
    }
    case MON_DATA_MET_GAME:
        SET8(substruct3->metGame);
        break;
    case MON_DATA_POKEBALL:
    {
        u8 pokeball = *data;
        substruct3->pokeball = pokeball;
        break;
    }
    case MON_DATA_OT_GENDER:
        SET8(substruct3->otGender);
        break;
    case MON_DATA_HP_IV:
        SET8(substruct3->hpIV);
        break;
    case MON_DATA_ATK_IV:
        SET8(substruct3->attackIV);
        break;
    case MON_DATA_DEF_IV:
        SET8(substruct3->defenseIV);
        break;
    case MON_DATA_SPEED_IV:
        SET8(substruct3->speedIV);
        break;
    case MON_DATA_SPATK_IV:
        SET8(substruct3->spAttackIV);
        break;
    case MON_DATA_SPDEF_IV:
        SET8(substruct3->spDefenseIV);
        break;
    case MON_DATA_IS_EGG:
        SET8(substruct3->isEgg);
        if (substruct3->isEgg)
            boxMon->isEgg = 1;
        else
            boxMon->isEgg = 0;
        break;
    case MON_DATA_ALT_ABILITY:
        SET8(substruct3->altAbility);
        break;
    case MON_DATA_COOL_RIBBON:
        SET8(substruct3->coolRibbon);
        break;
    case MON_DATA_BEAUTY_RIBBON:
        SET8(substruct3->beautyRibbon);
        break;
    case MON_DATA_CUTE_RIBBON:
        SET8(substruct3->cuteRibbon);
        break;
    case MON_DATA_SMART_RIBBON:
        SET8(substruct3->smartRibbon);
        break;
    case MON_DATA_TOUGH_RIBBON:
        SET8(substruct3->toughRibbon);
        break;
    case MON_DATA_CHAMPION_RIBBON:
        SET8(substruct3->championRibbon);
        break;
    case MON_DATA_WINNING_RIBBON:
        SET8(substruct3->winningRibbon);
        break;
    case MON_DATA_VICTORY_RIBBON:
        SET8(substruct3->victoryRibbon);
        break;
    case MON_DATA_ARTIST_RIBBON:
        SET8(substruct3->artistRibbon);
        break;
    case MON_DATA_EFFORT_RIBBON:
        SET8(substruct3->effortRibbon);
        break;
    case MON_DATA_GIFT_RIBBON_1:
        SET8(substruct3->giftRibbon1);
        break;
    case MON_DATA_GIFT_RIBBON_2:
        SET8(substruct3->giftRibbon2);
        break;
    case MON_DATA_GIFT_RIBBON_3:
        SET8(substruct3->giftRibbon3);
        break;
    case MON_DATA_GIFT_RIBBON_4:
        SET8(substruct3->giftRibbon4);
        break;
    case MON_DATA_GIFT_RIBBON_5:
        SET8(substruct3->giftRibbon5);
        break;
    case MON_DATA_GIFT_RIBBON_6:
        SET8(substruct3->giftRibbon6);
        break;
    case MON_DATA_GIFT_RIBBON_7:
        SET8(substruct3->giftRibbon7);
        break;
    case MON_DATA_FATEFUL_ENCOUNTER:
        SET8(substruct3->fatefulEncounter);
        break;
    case MON_DATA_IVS:
    {
#ifdef BUGFIX_SETMONIVS
        u32 ivs = data[0] | (data[1] << 8) | (data[2] << 16) | (data[3] << 24);
#else
        u32 ivs = *data; // Bug: Only the HP IV and the lower 3 bits of the Attack IV are read. The rest become 0.
#endif
        substruct3->hpIV = ivs & 0x1F;
        substruct3->attackIV = (ivs >> 5) & 0x1F;
        substruct3->defenseIV = (ivs >> 10) & 0x1F;
        substruct3->speedIV = (ivs >> 15) & 0x1F;
        substruct3->spAttackIV = (ivs >> 20) & 0x1F;
        substruct3->spDefenseIV = (ivs >> 25) & 0x1F;
        break;
    }
    default:
        break;
    }

    if (field > MON_DATA_10)
    {
        boxMon->checksum = CalculateBoxMonChecksum(boxMon);
        EncryptBoxMon(boxMon);
    }
}

void CopyMon(void *dest, void *src, size_t size)
{
    memcpy(dest, src, size);
}

u8 GiveMonToPlayer(struct Pokemon *mon)
{
    s32 i;

    SetMonData(mon, MON_DATA_OT_NAME, gSaveBlock2.playerName);
    SetMonData(mon, MON_DATA_OT_GENDER, &gSaveBlock2.playerGender);
    SetMonData(mon, MON_DATA_OT_ID, gSaveBlock2.playerTrainerId);

    i = 0;

    while (i < 6 && GetMonData(&gPlayerParty[i], MON_DATA_SPECIES, NULL) != SPECIES_NONE)
        i++;

    if (i >= 6)
        return SendMonToPC(mon);

    CopyMon(&gPlayerParty[i], mon, sizeof(*mon));
    gPlayerPartyCount = i + 1;
    return 0;
}

u8 SendMonToPC(struct Pokemon *mon)
{
    s32 i = gPokemonStorage.currentBox;

    do
    {
        s32 j;
        for (j = 0; j < 30; j++)
        {
            if (GetBoxMonData(&gPokemonStorage.boxes[i][j], MON_DATA_SPECIES, NULL) == SPECIES_NONE)
            {
                MonRestorePP(mon);
                CopyMon(&gPokemonStorage.boxes[i][j], &mon->box, sizeof(mon->box));
                return 1;
            }
        }

        i++;
        if (i == 14)
            i = 0;
    } while (i != gPokemonStorage.currentBox);

    return 2;
}

u8 CalculatePlayerPartyCount(void)
{
    gPlayerPartyCount = 0;

    while (gPlayerPartyCount < 6
        && GetMonData(&gPlayerParty[gPlayerPartyCount], MON_DATA_SPECIES, NULL) != SPECIES_NONE)
    {
        gPlayerPartyCount++;
    }

    return gPlayerPartyCount;
}

u8 CalculateEnemyPartyCount(void)
{
    gEnemyPartyCount = 0;

    while (gEnemyPartyCount < 6
        && GetMonData(&gEnemyParty[gEnemyPartyCount], MON_DATA_SPECIES, NULL) != SPECIES_NONE)
    {
        gEnemyPartyCount++;
    }

    return gEnemyPartyCount;
}

u8 sub_803DAA0(void)
{
    s32 aliveCount = 0;
    s32 i;
    CalculatePlayerPartyCount();

    if (gPlayerPartyCount == 1)
        return gPlayerPartyCount;

    for (i = 0; i < gPlayerPartyCount; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_HP, NULL) != 0
         && GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2, NULL) != SPECIES_NONE
         && GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2, NULL) != SPECIES_EGG)
            aliveCount++;
    }

    return (aliveCount > 1) ? 0 : 2;
}

u8 GetAbilityBySpecies(u16 species, bool8 altAbility)
{
    if (altAbility)
        gLastUsedAbility = gBaseStats[species].ability2;
    else
        gLastUsedAbility = gBaseStats[species].ability1;

    return gLastUsedAbility;
}

u8 GetMonAbility(struct Pokemon *mon)
{
    u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    u8 altAbility = GetMonData(mon, MON_DATA_ALT_ABILITY, NULL);
    return GetAbilityBySpecies(species, altAbility);
}

void CreateSecretBaseEnemyParty(struct SecretBaseRecord *secretBaseRecord)
{
    s32 i, j;

    ZeroEnemyPartyMons();
    *eSecretBaseRecord = *secretBaseRecord;

    for (i = 0; i < 6; i++)
    {
        if (eSecretBaseRecord->partySpecies[i])
        {
            CreateMon(&gEnemyParty[i],
                eSecretBaseRecord->partySpecies[i],
                eSecretBaseRecord->partyLevels[i],
                15,
                1,
                eSecretBaseRecord->partyPersonality[i],
                2,
                0);

            // these two SetMonData calls require the (u8 *) cast since SetMonData is declared in this function.
            SetMonData(&gEnemyParty[i], MON_DATA_HELD_ITEM, (u8 *)&eSecretBaseRecord->partyHeldItems[i]);

            for (j = 0; j < 6; j++)
                SetMonData(&gEnemyParty[i], MON_DATA_HP_EV + j, &eSecretBaseRecord->partyEVs[i]);

            for (j = 0; j < 4; j++)
            {
                SetMonData(&gEnemyParty[i], MON_DATA_MOVE1 + j, (u8 *)&eSecretBaseRecord->partyMoves[i * 4 + j]);
                SetMonData(&gEnemyParty[i], MON_DATA_PP1 + j, &gBattleMoves[eSecretBaseRecord->partyMoves[i * 4 + j]].pp);
            }
        }
    }

    gBattleTypeFlags = BATTLE_TYPE_TRAINER;
    gTrainerBattleOpponent = SECRET_BASE_OPPONENT;
}

const u8 gSecretBaseTrainerClasses[][5] = {
    // male
    {FACILITY_CLASS_YOUNGSTER, FACILITY_CLASS_BUG_CATCHER,  FACILITY_CLASS_RICH_BOY, FACILITY_CLASS_CAMPER,    FACILITY_CLASS_COOL_TRAINER_M},
    // female
    {FACILITY_CLASS_LASS,      FACILITY_CLASS_SCHOOL_KID_F, FACILITY_CLASS_LADY,     FACILITY_CLASS_PICNICKER, FACILITY_CLASS_COOL_TRAINER_F}
};

u8 GetSecretBaseTrainerPicIndex(void)
{
    u8 trainerClass = gSecretBaseTrainerClasses[eSecretBaseRecord->gender][eSecretBaseRecord->trainerId[0] % 5];
    return gTrainerClassToPicIndex[trainerClass];
}

u8 GetSecretBaseTrainerNameIndex(void)
{
    u8 trainerClass = gSecretBaseTrainerClasses[eSecretBaseRecord->gender][eSecretBaseRecord->trainerId[0] % 5];
    return gTrainerClassToNameIndex[trainerClass];
}

u8 PlayerPartyAndPokemonStorageFull(void)
{
    s32 i;

    for (i = 0; i < 6; i++)
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES, NULL) == SPECIES_NONE)
            return 0;

    return PokemonStorageFull();
}

u8 PokemonStorageFull(void)
{
    s32 i, j;

    for (i = 0; i < 14; i++)
        for (j = 0; j < 30; j++)
            if (GetBoxMonData(&gPokemonStorage.boxes[i][j], MON_DATA_SPECIES, NULL) == SPECIES_NONE)
                return 0;

    return 1;
}

void GetSpeciesName(u8 *name, u16 species)
{
    s32 i;

    for (i = 0; i <= POKEMON_NAME_LENGTH; i++)
    {
        if (species > NUM_SPECIES)
            name[i] = gSpeciesNames[0][i];
        else
            name[i] = gSpeciesNames[species][i];

        if (name[i] == EOS)
            break;
    }

    name[i] = EOS;
}

u8 CalculatePPWithBonus(u16 move, u8 ppBonuses, u8 moveIndex)
{
    u8 basePP = gBattleMoves[move].pp;
    return basePP + ((basePP * 20 * ((gPPUpReadMasks[moveIndex] & ppBonuses) >> (2 * moveIndex))) / 100);
}

void RemoveMonPPBonus(struct Pokemon *mon, u8 moveIndex)
{
    u8 ppBonuses = GetMonData(mon, MON_DATA_PP_BONUSES, NULL);
    ppBonuses &= gPPUpWriteMasks[moveIndex];
    SetMonData(mon, MON_DATA_PP_BONUSES, &ppBonuses);
}

void RemoveBattleMonPPBonus(struct BattlePokemon *mon, u8 moveIndex)
{
    mon->ppBonuses &= gPPUpWriteMasks[moveIndex];
}

void CopyPlayerPartyMonToBattleData(u8 battleIndex, u8 partyIndex)
{
    s32 i;
    s8 nickname[POKEMON_NAME_LENGTH * 2];

    gBattleMons[battleIndex].species = GetMonData(&gPlayerParty[partyIndex], MON_DATA_SPECIES, NULL);
    gBattleMons[battleIndex].item = GetMonData(&gPlayerParty[partyIndex], MON_DATA_HELD_ITEM, NULL);

    for (i = 0; i < 4; i++)
    {
        gBattleMons[battleIndex].moves[i] = GetMonData(&gPlayerParty[partyIndex], MON_DATA_MOVE1 + i, NULL);
        gBattleMons[battleIndex].pp[i] = GetMonData(&gPlayerParty[partyIndex], MON_DATA_PP1 + i, NULL);
    }

    gBattleMons[battleIndex].ppBonuses = GetMonData(&gPlayerParty[partyIndex], MON_DATA_PP_BONUSES, NULL);
    gBattleMons[battleIndex].friendship = GetMonData(&gPlayerParty[partyIndex], MON_DATA_FRIENDSHIP, NULL);
    gBattleMons[battleIndex].experience = GetMonData(&gPlayerParty[partyIndex], MON_DATA_EXP, NULL);
    gBattleMons[battleIndex].hpIV = GetMonData(&gPlayerParty[partyIndex], MON_DATA_HP_IV, NULL);
    gBattleMons[battleIndex].attackIV = GetMonData(&gPlayerParty[partyIndex], MON_DATA_ATK_IV, NULL);
    gBattleMons[battleIndex].defenseIV = GetMonData(&gPlayerParty[partyIndex], MON_DATA_DEF_IV, NULL);
    gBattleMons[battleIndex].speedIV = GetMonData(&gPlayerParty[partyIndex], MON_DATA_SPEED_IV, NULL);
    gBattleMons[battleIndex].spAttackIV = GetMonData(&gPlayerParty[partyIndex], MON_DATA_SPATK_IV, NULL);
    gBattleMons[battleIndex].spDefenseIV = GetMonData(&gPlayerParty[partyIndex], MON_DATA_SPDEF_IV, NULL);
    gBattleMons[battleIndex].personality = GetMonData(&gPlayerParty[partyIndex], MON_DATA_PERSONALITY, NULL);
    gBattleMons[battleIndex].status1 = GetMonData(&gPlayerParty[partyIndex], MON_DATA_STATUS, NULL);
    gBattleMons[battleIndex].level = GetMonData(&gPlayerParty[partyIndex], MON_DATA_LEVEL, NULL);
    gBattleMons[battleIndex].hp = GetMonData(&gPlayerParty[partyIndex], MON_DATA_HP, NULL);
    gBattleMons[battleIndex].maxHP = GetMonData(&gPlayerParty[partyIndex], MON_DATA_MAX_HP, NULL);
    gBattleMons[battleIndex].attack = GetMonData(&gPlayerParty[partyIndex], MON_DATA_ATK, NULL);
    gBattleMons[battleIndex].defense = GetMonData(&gPlayerParty[partyIndex], MON_DATA_DEF, NULL);
    gBattleMons[battleIndex].speed = GetMonData(&gPlayerParty[partyIndex], MON_DATA_SPEED, NULL);
    gBattleMons[battleIndex].spAttack = GetMonData(&gPlayerParty[partyIndex], MON_DATA_SPATK, NULL);
    gBattleMons[battleIndex].spDefense = GetMonData(&gPlayerParty[partyIndex], MON_DATA_SPDEF, NULL);
    gBattleMons[battleIndex].isEgg = GetMonData(&gPlayerParty[partyIndex], MON_DATA_IS_EGG, NULL);
    gBattleMons[battleIndex].altAbility = GetMonData(&gPlayerParty[partyIndex], MON_DATA_ALT_ABILITY, NULL);
    gBattleMons[battleIndex].otId = GetMonData(&gPlayerParty[partyIndex], MON_DATA_OT_ID, NULL);
    gBattleMons[battleIndex].type1 = gBaseStats[gBattleMons[battleIndex].species].type1;
    gBattleMons[battleIndex].type2 = gBaseStats[gBattleMons[battleIndex].species].type2;
    gBattleMons[battleIndex].ability = GetAbilityBySpecies(gBattleMons[battleIndex].species, gBattleMons[battleIndex].altAbility);
    GetMonData(&gPlayerParty[partyIndex], MON_DATA_NICKNAME, nickname);
    StringCopy10(gBattleMons[battleIndex].nickname, nickname);
    GetMonData(&gPlayerParty[partyIndex], MON_DATA_OT_NAME, gBattleMons[battleIndex].otName);
    ewram160BC[GetBattlerSide(battleIndex)] = gBattleMons[battleIndex].hp;

    for (i = 0; i < 8; i++)
        gBattleMons[battleIndex].statStages[i] = 6;

    gBattleMons[battleIndex].status2 = 0;
    sub_80157C4(battleIndex);
    sub_8032AA8(battleIndex, 0);
}
