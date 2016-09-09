#include "global.h"
#include "text.h"
#include "string_util.h"
#include "pokemon.h"

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
    u8 pokerus;
    u8 metLocation;

    u16 metLevel:7;
    u16 metGame:4;
    u16 pokeball:4;
    u16 otGender:1;

    u32 hpIV:5;
    u32 attackIV:5;
    u32 defenseIV:5;
    u32 speedIV:5;
    u32 spAttackIV:5;
    u32 spDefenseIV:5;
    u32 isEgg:1;
    u32 altAbility:1;

    u32 coolRibbon:3;
    u32 beautyRibbon:3;
    u32 cuteRibbon:3;
    u32 smartRibbon:3;
    u32 toughRibbon:3;
    u32 championRibbon:1;
    u32 winningRibbon:1;
    u32 victoryRibbon:1;
    u32 artistRibbon:1;
    u32 effortRibbon:1;
    u32 giftRibbon1:1;
    u32 giftRibbon2:1;
    u32 giftRibbon3:1;
    u32 giftRibbon4:1;
    u32 giftRibbon5:1;
    u32 giftRibbon6:1;
    u32 giftRibbon7:1;
    u32 fatefulEncounter:5; // unused in Ruby/Sapphire, but the high bit must be set for Mew/Deoxys to obey in FR/LG/Emerald
};

union PokemonSubstruct
{
    struct PokemonSubstruct0 type0;
    struct PokemonSubstruct1 type1;
    struct PokemonSubstruct2 type2;
    struct PokemonSubstruct3 type3;
};

struct BoxPokemon
{
    u32 personality;
    u32 otId;
    u8 nickname[10];
    u8 language;
    u8 isBadEgg:1;
    u8 sanity2:1;
    u8 sanity3:1;
    u8 unused:5;
    u8 otName[7];
    u8 markings;
    u16 checksum;
    u16 unknown;

    union
    {
        u32 raw[12];
        union PokemonSubstruct substructs[4];
    } secure;
};

struct Pokemon
{
    struct BoxPokemon box;
    u32 status;
    u8 level;
    u8 pokerus;
    u16 hp;
    u16 maxHP;
    u16 attack;
    u16 defense;
    u16 speed;
    u16 spAttack;
    u16 spDefense;
};

void ZeroPokemonBoxData(struct BoxPokemon *mon);

u16 pokemon_calc_checksum(struct Pokemon *mon);

void EncryptMon(struct Pokemon *mon);
void DecryptMon(struct Pokemon *mon);
union PokemonSubstruct *GetSubstruct(struct Pokemon *mon, u32 personality, u8 substructType);
u32 GetMonData(struct Pokemon *mon, s32 field, u8 *data);
u32 GetMonBoxData(struct Pokemon *mon, s32 field, u8 *data);

extern u8 gBadEggNickname[];
extern u8 gEggNickname[];
extern u32 gBitTable[];

/*
void ZeroPokemonBoxData(struct BoxPokemon *mon)
{
    u8 *raw = (u8 *)mon;
    u32 i;
    for (i = 0; i < sizeof(struct BoxPokemon); i++)
        raw[i] = 0;
}
*/

void EncryptMon(struct Pokemon *mon)
{
    u32 i;
    for (i = 0; i < 12; i++)
    {
        mon->box.secure.raw[i] ^= mon->box.personality;
        mon->box.secure.raw[i] ^= mon->box.otId;
    }
}

void DecryptMon(struct Pokemon *mon)
{
    u32 i;
    for (i = 0; i < 12; i++)
    {
        mon->box.secure.raw[i] ^= mon->box.otId;
        mon->box.secure.raw[i] ^= mon->box.personality;
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

union PokemonSubstruct *GetSubstruct(struct Pokemon *mon, u32 personality, u8 substructType)
{
    union PokemonSubstruct *substruct = NULL;

    union PokemonSubstruct *substructs0 = mon->box.secure.substructs;
    union PokemonSubstruct *substructs1 = mon->box.secure.substructs;
    union PokemonSubstruct *substructs2 = mon->box.secure.substructs;
    union PokemonSubstruct *substructs3 = mon->box.secure.substructs;
    union PokemonSubstruct *substructs4 = mon->box.secure.substructs;
    union PokemonSubstruct *substructs5 = mon->box.secure.substructs;
    union PokemonSubstruct *substructs6 = mon->box.secure.substructs;
    union PokemonSubstruct *substructs7 = mon->box.secure.substructs;
    union PokemonSubstruct *substructs8 = mon->box.secure.substructs;
    union PokemonSubstruct *substructs9 = mon->box.secure.substructs;
    union PokemonSubstruct *substructs10 = mon->box.secure.substructs;
    union PokemonSubstruct *substructs11 = mon->box.secure.substructs;
    union PokemonSubstruct *substructs12 = mon->box.secure.substructs;
    union PokemonSubstruct *substructs13 = mon->box.secure.substructs;
    union PokemonSubstruct *substructs14 = mon->box.secure.substructs;
    union PokemonSubstruct *substructs15 = mon->box.secure.substructs;
    union PokemonSubstruct *substructs16 = mon->box.secure.substructs;
    union PokemonSubstruct *substructs17 = mon->box.secure.substructs;
    union PokemonSubstruct *substructs18 = mon->box.secure.substructs;
    union PokemonSubstruct *substructs19 = mon->box.secure.substructs;
    union PokemonSubstruct *substructs20 = mon->box.secure.substructs;
    union PokemonSubstruct *substructs21 = mon->box.secure.substructs;
    union PokemonSubstruct *substructs22 = mon->box.secure.substructs;
    union PokemonSubstruct *substructs23 = mon->box.secure.substructs;

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
    case MON_DATA_SPD:
        return mon->speed;
    case MON_DATA_SPATK:
        return mon->spAttack;
    case MON_DATA_SPDEF:
        return mon->spDefense;
    case MON_DATA_64:
        return mon->pokerus;
    default:
        return GetMonBoxData(mon, field, data);
    }
}

u32 GetMonBoxData(struct Pokemon *mon, s32 field, u8 *data)
{
    u32 retVal = 0;
    struct PokemonSubstruct0 *substruct0 = NULL;
    struct PokemonSubstruct1 *substruct1 = NULL;
    struct PokemonSubstruct2 *substruct2 = NULL;
    struct PokemonSubstruct3 *substruct3 = NULL;

    if (field > MON_DATA_10)
    {
        substruct0 = &(GetSubstruct(mon, mon->box.personality, 0)->type0);
        substruct1 = &(GetSubstruct(mon, mon->box.personality, 1)->type1);
        substruct2 = &(GetSubstruct(mon, mon->box.personality, 2)->type2);
        substruct3 = &(GetSubstruct(mon, mon->box.personality, 3)->type3);

        DecryptMon(mon);

        if (pokemon_calc_checksum(mon) != mon->box.checksum)
        {
            mon->box.isBadEgg = 1;
            mon->box.sanity3 = 1;
            substruct3->isEgg = 1;
        }
    }

    switch (field)
    {
        case MON_DATA_PERSONALITY:
            retVal = mon->box.personality;
            break;
        case MON_DATA_OT_ID:
            retVal = mon->box.otId;
            break;
        case MON_DATA_NICKNAME:
        {
            if (mon->box.isBadEgg)
            {
                StringCopy(data, gBadEggNickname);
                retVal = StringLength(data);
            }
            else if (mon->box.sanity3)
            {
                StringCopy(data, gEggNickname);
                retVal = StringLength(data);
            }
            else
            {
                retVal = 0;

                while (retVal < 10 && mon->box.nickname[retVal] != EOS)
                {
                    data[retVal] = mon->box.nickname[retVal];
                    retVal++;
                }

                data[retVal] = EOS;
                ConvertInternationalString(data, mon->box.language);
                retVal = StringLength(data);
            }
            break;
        }
        case MON_DATA_LANGUAGE:
            retVal = mon->box.language;
            break;
        case MON_DATA_SANITY_BIT1:
            retVal = mon->box.isBadEgg;
            break;
        case MON_DATA_SANITY_BIT2:
            retVal = mon->box.sanity2;
            break;
        case MON_DATA_SANITY_BIT3:
            retVal = mon->box.sanity3;
            break;
        case MON_DATA_OT_NAME:
        {
            retVal = 0;

            while (retVal < 7 && mon->box.otName[retVal] != EOS)
            {
                data[retVal] = mon->box.otName[retVal];
                retVal++;
            }

            data[retVal] = EOS;
            break;
        }
        case MON_DATA_MARKINGS:
            retVal = mon->box.markings;
            break;
        case MON_DATA_CHECKSUM:
            retVal = mon->box.checksum;
            break;
        case MON_DATA_10:
            retVal = mon->box.unknown;
            break;
        case MON_DATA_SPECIES:
            retVal = mon->box.isBadEgg ? 412 : substruct0->species;
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
        case MON_DATA_SPD_EV:
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
        case MON_DATA_SPD_IV:
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
            if (substruct0->species && (substruct3->isEgg || mon->box.isBadEgg))
                retVal = 412;
            break;
        case MON_DATA_IVS:
            retVal = substruct3->hpIV | (substruct3->attackIV << 5) | (substruct3->defenseIV << 10) | (substruct3->speedIV << 15) | (substruct3->spAttackIV << 20) | (substruct3->spDefenseIV << 25);
            break;
        case MON_DATA_KNOWN_MOVES:
            if (substruct0->species && !substruct3->isEgg)
            {
                u16 *moves = (u16 *)data;
                s32 i = 0;

                while (moves[i] != 355)
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
        EncryptMon(mon);

    return retVal;
}
