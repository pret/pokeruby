#ifndef GUARD_BATTLE_MESSAGE_H
#define GUARD_BATTLE_MESSAGE_H

struct StringInfoBattle
{
    u16 currentMove;
    u16 lastMove;
    u16 lastItem;
    u8 lastAbility;
    u8 scrActive;
    u8 unk1605E;
    u8 hpScale;
    u8 StringBank;
    u8 moveType;
    u8 abilities[4];
    u8 textBuffs[3][0x10];
};

// for B_TXT_BUFF1, B_TXT_BUFF2 and B_TXT_BUFF3

#define B_BUFF_STRING                   0
#define B_BUFF_NUMBER                   1
#define B_BUFF_MOVE                     2
#define B_BUFF_TYPE                     3
#define B_BUFF_MON_NICK_WITH_PREFIX     4
#define B_BUFF_STAT                     5
#define B_BUFF_SPECIES                  6
#define B_BUFF_MON_NICK                 7
#define B_BUFF_NEGATIVE_FLAVOR          8
#define B_BUFF_ABILITY                  9
#define B_BUFF_ITEM                     10

#define B_BUFF_PLACEHOLDER_BEGIN        0xFD
#define B_BUFF_EOS                      0xFF

#define PREPARE_FLAVOR_BUFFER(textVar, flavorId)                            \
{                                                                           \
    textVar[0] = B_BUFF_PLACEHOLDER_BEGIN;                                  \
    textVar[1] = B_BUFF_NEGATIVE_FLAVOR;                                    \
    textVar[2] = flavorId;                                                  \
    textVar[3] = B_BUFF_EOS;                                                \
}

#define PREPARE_STAT_BUFFER(textVar, statId)                                \
{                                                                           \
    textVar[0] = B_BUFF_PLACEHOLDER_BEGIN;                                  \
    textVar[1] = B_BUFF_STAT;                                               \
    textVar[2] = statId;                                                    \
    textVar[3] = B_BUFF_EOS;                                                \
}

#define PREPARE_ABILITY_BUFFER(textVar, abilityId)                          \
{                                                                           \
    textVar[0] = B_BUFF_PLACEHOLDER_BEGIN;                                  \
    textVar[1] = B_BUFF_ABILITY;                                            \
    textVar[2] = abilityId;                                                 \
    textVar[3] = B_BUFF_EOS;                                                \
}

#define PREPARE_TYPE_BUFFER(textVar, typeId)                                \
{                                                                           \
    textVar[0] = B_BUFF_PLACEHOLDER_BEGIN;                                  \
    textVar[1] = B_BUFF_TYPE;                                               \
    textVar[2] = typeId;                                                    \
    textVar[3] = B_BUFF_EOS;                                                \
}

#define PREPARE_BYTE_NUMBER_BUFFER(textVar, maxDigits, number)  \
{                                                               \
    textVar[0] = B_BUFF_PLACEHOLDER_BEGIN;                      \
    textVar[1] = B_BUFF_NUMBER;                                 \
    textVar[2] = 1;                                             \
    textVar[3] = maxDigits;                                     \
    textVar[4] = (number);                                      \
    textVar[5] = B_BUFF_EOS;                                    \
}

#define PREPARE_HWORD_NUMBER_BUFFER(textVar, maxDigits, number)             \
{                                                                           \
    textVar[0] = B_BUFF_PLACEHOLDER_BEGIN;                                  \
    textVar[1] = B_BUFF_NUMBER;                                             \
    textVar[2] = 2;                                                         \
    textVar[3] = maxDigits;                                                 \
    textVar[4] = (number);                                                  \
    textVar[5] = (number & 0x0000FF00) >> 8;                                \
    textVar[6] = B_BUFF_EOS;                                                \
}

#define PREPARE_WORD_NUMBER_BUFFER(textVar, maxDigits, number)  \
{                                                               \
    textVar[0] = B_BUFF_PLACEHOLDER_BEGIN;                      \
    textVar[1] = B_BUFF_NUMBER;                                 \
    textVar[2] = 4;                                             \
    textVar[3] = maxDigits;                                     \
    textVar[4] = (number);                                      \
    textVar[5] = (number & 0x0000FF00) >> 8;                    \
    textVar[6] = (number & 0x00FF0000) >> 16;                   \
    textVar[7] = (number & 0xFF000000) >> 24;                   \
    textVar[8] = B_BUFF_EOS;                                    \
}

#define PREPARE_STRING_BUFFER(textVar, stringId)                \
{                                                               \
    textVar[0] = B_BUFF_PLACEHOLDER_BEGIN;                      \
    textVar[1] = B_BUFF_STRING;                                 \
    textVar[2] = stringId;                                      \
    textVar[3] = (stringId & 0xFF00) >> 8;                      \
    textVar[4] = B_BUFF_EOS;                                    \
}

#define PREPARE_MOVE_BUFFER(textVar, move)                      \
{                                                               \
    textVar[0] = B_BUFF_PLACEHOLDER_BEGIN;                      \
    textVar[1] = B_BUFF_MOVE;                                   \
    textVar[2] = move;                                          \
    textVar[3] = (move & 0xFF00) >> 8;                          \
    textVar[4] = B_BUFF_EOS;                                    \
}

#define PREPARE_ITEM_BUFFER(textVar, item)                      \
{                                                               \
    textVar[0] = B_BUFF_PLACEHOLDER_BEGIN;                      \
    textVar[1] = B_BUFF_ITEM;                                   \
    textVar[2] = item;                                          \
    textVar[3] = (item & 0xFF00) >> 8;                          \
    textVar[4] = B_BUFF_EOS;                                    \
}

#define PREPARE_SPECIES_BUFFER(textVar, species)                \
{                                                               \
    textVar[0] = B_BUFF_PLACEHOLDER_BEGIN;                      \
    textVar[1] = B_BUFF_SPECIES;                                \
    textVar[2] = species;                                       \
    textVar[3] = (species & 0xFF00) >> 8;                       \
    textVar[4] = B_BUFF_EOS;                                    \
}

#define PREPARE_MON_NICK_WITH_PREFIX_BUFFER(textVar, bank, partyId)         \
{                                                                           \
    textVar[0] = B_BUFF_PLACEHOLDER_BEGIN;                                  \
    textVar[1] = B_BUFF_MON_NICK_WITH_PREFIX;                               \
    textVar[2] = bank;                                                      \
    textVar[3] = partyId;                                                   \
    textVar[4] = B_BUFF_EOS;                                                \
}

#define PREPARE_MON_NICK_BUFFER(textVar, bank, partyId)         \
{                                                               \
    textVar[0] = B_BUFF_PLACEHOLDER_BEGIN;                      \
    textVar[1] = B_BUFF_MON_NICK;                               \
    textVar[2] = bank;                                          \
    textVar[3] = partyId;                                       \
    textVar[4] = B_BUFF_EOS;                                    \
}

void BufferStringBattle(u16 stringID);
u32 StrCpyDecodeToDisplayedStringBattle(const u8* src);
u32 StrCpyDecodeBattle(const u8* src, u8* dst);

#endif // GUARD_BATTLE_MESSAGE_H
