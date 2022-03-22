#include "global.h"
#include "battle.h"
#include "battle_message.h"
#include "battle_tower.h"
#include "item.h"
#include "event_data.h"
#include "constants/items.h"
#include "pokemon.h"
#include "data2.h"
#include "text.h"
#include "string_util.h"
#include "link.h"
#include "battle_setup.h"
#include "battle_tower.h"
#include "constants/flags.h"
#include "ewram.h"

#define BATTLESTRING_TO_SUB 12
#define BATTLESTRINGS_NO    351
#define BATTLESTRINGS_MAX   BATTLESTRINGS_NO + BATTLESTRING_TO_SUB

#if GERMAN
#include "data/battle_strings_de.h" // TODO: German
#else
#include "data/battle_strings_en.h"
#endif

// This is four lists of moves which use a different attack string in Japanese
// to the default. See the documentation for ChooseTypeOfMoveUsedString for more detail.
const u16 gUnknown_084016BC[] =
{
    MOVE_SWORDS_DANCE,
    MOVE_STRENGTH,
    MOVE_GROWTH,
    MOVE_HARDEN,
    MOVE_MINIMIZE,
    MOVE_SMOKESCREEN,
    MOVE_WITHDRAW,
    MOVE_DEFENSE_CURL,
    MOVE_EGG_BOMB,
    MOVE_SMOG,
    MOVE_BONE_CLUB,
    MOVE_FLASH,
    MOVE_SPLASH,
    MOVE_ACID_ARMOR,
    MOVE_BONEMERANG,
    MOVE_REST,
    MOVE_SHARPEN,
    MOVE_SUBSTITUTE,
    MOVE_MIND_READER,
    MOVE_SNORE,
    MOVE_PROTECT,
    MOVE_SPIKES,
    MOVE_ENDURE,
    MOVE_ROLLOUT,
    MOVE_SWAGGER,
    MOVE_SLEEP_TALK,
    MOVE_HIDDEN_POWER,
    MOVE_PSYCH_UP,
    MOVE_EXTREME_SPEED,
    MOVE_FOLLOW_ME,
    MOVE_TRICK,
    MOVE_ASSIST,
    MOVE_INGRAIN,
    MOVE_KNOCK_OFF,
    MOVE_CAMOUFLAGE,
    MOVE_ASTONISH,
    MOVE_ODOR_SLEUTH,
    MOVE_GRASS_WHISTLE,
    MOVE_SHEER_COLD,
    MOVE_MUDDY_WATER,
    MOVE_IRON_DEFENSE,
    MOVE_BOUNCE,
    0,
    MOVE_TELEPORT,
    MOVE_RECOVER,
    MOVE_BIDE,
    MOVE_AMNESIA,
    MOVE_FLAIL,
    MOVE_TAUNT,
    MOVE_BULK_UP,
    0,
    MOVE_MEDITATE,
    MOVE_AGILITY,
    MOVE_MIMIC,
    MOVE_DOUBLE_TEAM,
    MOVE_BARRAGE,
    MOVE_TRANSFORM,
    MOVE_STRUGGLE,
    MOVE_SCARY_FACE,
    MOVE_CHARGE,
    MOVE_WISH,
    MOVE_BRICK_BREAK,
    MOVE_YAWN,
    MOVE_FEATHER_DANCE,
    MOVE_TEETER_DANCE,
    MOVE_MUD_SPORT,
    MOVE_FAKE_TEARS,
    MOVE_WATER_SPORT,
    MOVE_CALM_MIND,
    0,
    MOVE_POUND,
    MOVE_SCRATCH,
    MOVE_VICE_GRIP,
    MOVE_WING_ATTACK,
    MOVE_FLY,
    MOVE_BIND,
    MOVE_SLAM,
    MOVE_HORN_ATTACK,
    MOVE_WRAP,
    MOVE_THRASH,
    MOVE_TAIL_WHIP,
    MOVE_LEER,
    MOVE_BITE,
    MOVE_GROWL,
    MOVE_ROAR,
    MOVE_SING,
    MOVE_PECK,
    MOVE_ABSORB,
    MOVE_STRING_SHOT,
    MOVE_EARTHQUAKE,
    MOVE_FISSURE,
    MOVE_DIG,
    MOVE_TOXIC,
    MOVE_SCREECH,
    MOVE_METRONOME,
    MOVE_LICK,
    MOVE_CLAMP,
    MOVE_CONSTRICT,
    MOVE_POISON_GAS,
    MOVE_BUBBLE,
    MOVE_SLASH,
    MOVE_SPIDER_WEB,
    MOVE_NIGHTMARE,
    MOVE_CURSE,
    MOVE_FORESIGHT,
    MOVE_CHARM,
    MOVE_ATTRACT,
    MOVE_ROCK_SMASH,
    MOVE_UPROAR,
    MOVE_SPIT_UP,
    MOVE_SWALLOW,
    MOVE_TORMENT,
    MOVE_FLATTER,
    MOVE_ROLE_PLAY,
    MOVE_ENDEAVOR,
    MOVE_TICKLE,
    MOVE_COVET,
    0,
};

const u8 gUnknown_084017A8[] = {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF}; // empty flags

extern const u8* const gBattleStringsTable[BATTLESTRINGS_NO];

extern u16 gLastUsedItem;
extern u8 gLastUsedAbility;
extern u8 gActiveBattler;
extern u8 gBattlerAttacker;
extern u8 gBattlerTarget;
extern u8 gPotentialItemEffectBattler;
extern u8 gEffectBattler;
extern u8 gBattleTextBuff1[];
extern u8 gBattleTextBuff2[];
extern u8 gBattleTextBuff3[];
extern u8 gStringVar1[];
extern u8 gStringVar2[];
extern u8 gStringVar3[];
extern u16 gBattleTypeFlags;
extern u16 gTrainerBattleOpponent;
extern u8 gDisplayedStringBattle[];
extern u8 gStringVar1[];
extern u8 gStringVar2[];
extern u8 gStringVar3[];
extern u16 gBattlerPartyIndexes[4];
extern struct BattleEnigmaBerry gEnigmaBerries[4];
extern u8 gBattleBufferA[4][0x200];

EWRAM_DATA u8 gAbilitiesPerBank[4] = {0};

extern const u8* const gUnknown_08401674[]; // table of pointers to 'a -TYPE' strings
extern const u8* const gUnknown_08400F58[]; // table of pointers to stat strings
extern const u8* const gUnknown_08400F78[]; // table of pointers to flavour strings

struct StatusFlagString
{
    u8* flag;
    u8* ptr;
};

extern const struct StatusFlagString gUnknown_081FA6D4[7]; // status flag/text

extern struct StringInfoBattle* gSelectedOrderFromParty;
#define gStringInfo gSelectedOrderFromParty

void ChooseMoveUsedParticle(u8* textBuff);
void ChooseTypeOfMoveUsedString(u8* textBuff);
void ExpandBattleTextBuffPlaceholders(u8* src, u8* dst);

u8 GetBattlerSide(u8 bank);
s32 sub_803FC34(u16);
void get_trainer_name(u8* dst);
u8 get_trainer_class_name_index(void);
u8 GetMultiplayerId(void);
u8 GetBattlerAtPosition(u8 ID);
u8 GetBattlerSide(u8 bank);
u8 GetBattlerPosition(u8 bank);
#if GERMAN
extern u8 *de_sub_804110C();
#endif

void BufferStringBattle(u16 stringID)
{
    int i;
    const u8* stringPtr = NULL;

    gStringInfo = (struct StringInfoBattle*)(&gBattleBufferA[gActiveBattler][4]);
    gLastUsedItem = gStringInfo->lastItem;
    gLastUsedAbility = gStringInfo->lastAbility;
    gBattleStruct->scriptingActive = gStringInfo->scrActive;
    gBattleStruct->unk1605E = gStringInfo->unk1605E;
    gBattleStruct->hpScale = gStringInfo->hpScale;
    gPotentialItemEffectBattler = gStringInfo->StringBank;
    gBattleStruct->stringMoveType = gStringInfo->moveType;
    for (i = 0; i < 4; i++)
    {
        gAbilitiesPerBank[i] = gStringInfo->abilities[i];
    }
    for (i = 0; i < 0x10; i++)
    {
        gBattleTextBuff1[i] = gStringInfo->textBuffs[0][i];
        gBattleTextBuff2[i] = gStringInfo->textBuffs[1][i];
        gBattleTextBuff3[i] = gStringInfo->textBuffs[2][i];
    }
    switch (stringID)
    {
    case 0: // first battle msg
        if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
        {
            if (gBattleTypeFlags & BATTLE_TYPE_LINK)
            {
                if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
                    stringPtr = BattleText_DoubleWantToBattle;
                else
                    stringPtr = BattleText_SingleWantToBattle2;
            }
            else
            {
                stringPtr = BattleText_SingleWantToBattle1;
#if GERMAN
                stringPtr = de_sub_804110C(0xFFFF, stringPtr);
#endif
            }
        }
        else
        {
            if (gBattleTypeFlags & BATTLE_TYPE_LEGENDARY)
                stringPtr = BattleText_WildAppeared2;
            else if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE) // interesting, looks like they had something planned for wild double battles
                stringPtr = BattleText_WildDoubleAppeared;
            else if (gBattleTypeFlags & BATTLE_TYPE_WALLY_TUTORIAL)
                stringPtr = BattleText_WildAppeared3;
            else
                stringPtr = BattleText_WildAppeared1;
        }
        break;
    case 1: // poke first send-out
        if (GetBattlerSide(gActiveBattler) == 0)
        {
            if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
            {
                if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
                    stringPtr = BattleText_SentOutSingle11;
                else
                    stringPtr = BattleText_SentOutDouble4;
            }
            else
                stringPtr = BattleText_SentOutSingle6;
        }
        else
        {
            if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
            {
                if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
                    stringPtr = BattleText_SentOutDouble3;
                else if (gBattleTypeFlags & BATTLE_TYPE_LINK)
                    stringPtr = BattleText_SentOutDouble2;
                else
                {
                    stringPtr = BattleText_SentOutDouble1;
#if GERMAN
                    stringPtr = de_sub_804110C(0xFFFF, stringPtr);
#endif
                }
            }
            else if (gBattleTypeFlags & BATTLE_TYPE_LINK)
                stringPtr = BattleText_SentOutSingle3;
            else
            {
                stringPtr = BattleText_SentOutSingle1;
#if GERMAN
                stringPtr = de_sub_804110C(0xFFFF, stringPtr);
#endif
            }
        }
        break;
    case 2: // sending poke to ball msg
        if (GetBattlerSide(gActiveBattler) == 0)
        {
            if (gBattleStruct->hpScale == 0)
                stringPtr = BattleText_ComeBackSingle1;
            else if (gBattleStruct->hpScale == 1 || gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
                stringPtr = BattleText_ComeBackSingle2;
            else if (gBattleStruct->hpScale == 2)
                stringPtr = BattleText_ComeBackSingle3;
            else
                stringPtr = BattleText_ComeBackSingle4;
        }
        else
        {
            if (gTrainerBattleOpponent == LINK_BATTLE_OPPONENT)
            {
                if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
                    stringPtr = BattleText_WithdrewPoke3;
                else
                    stringPtr = BattleText_WithdrewPoke2;
            }
            else
            {
                stringPtr = BattleText_WithdrewPoke1;
#if GERMAN
                stringPtr = de_sub_804110C(0xFFFF, stringPtr);
#endif
            }
        }
        break;
    case 3: // switch-in msg
        if (GetBattlerSide(gBattleStruct->scriptingActive) == 0)
        {
            if (gBattleStruct->hpScale == 0 || gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
                stringPtr = BattleText_SentOutSingle7;
            else if (gBattleStruct->hpScale == 1)
                stringPtr = BattleText_SentOutSingle8;
            else if (gBattleStruct->hpScale == 2)
                stringPtr = BattleText_SentOutSingle9;
            else
                stringPtr = BattleText_SentOutSingle10;
        }
        else
        {
            if (gBattleTypeFlags & BATTLE_TYPE_LINK)
            {
                if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
                    stringPtr = BattleText_SentOutSingle5;
                else
                    stringPtr = BattleText_SentOutSingle4;
            }
            else
            {
                stringPtr = BattleText_SentOutSingle2;
#if GERMAN
                stringPtr = de_sub_804110C(0xFFFF, stringPtr);
#endif
            }
        }
        break;
    case 4: // pokemon used a move msg
        ChooseMoveUsedParticle(gBattleTextBuff1);
        if (gStringInfo->currentMove > 0x162)
            StringCopy(gBattleTextBuff2, gUnknown_08401674[gBattleStruct->stringMoveType]);
        else
            StringCopy(gBattleTextBuff2, gMoveNames[gStringInfo->currentMove]);
        ChooseTypeOfMoveUsedString(gBattleTextBuff2);
        stringPtr = BattleText_OpponentUsedMove;
        break;
    case 5: // battle end
        if (gBattleTextBuff1[0] & 0x80)
        {
            gBattleTextBuff1[0] &= ~(0x80);
            if (GetBattlerSide(gActiveBattler) == 1 && gBattleTextBuff1[0] != 3)
                gBattleTextBuff1[0] ^= 3;
            if (gBattleTextBuff1[0] == B_OUTCOME_LOST || gBattleTextBuff1[0] == B_OUTCOME_DREW)
                stringPtr = BattleText_GotAwaySafely;
            else
            {
                if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
                    stringPtr = BattleText_FledDouble;
                else
                    stringPtr = BattleText_FledSingle;
            }
        }
        else
        {
            if (GetBattlerSide(gActiveBattler) == 1 && gBattleTextBuff1[0] != 3)
                gBattleTextBuff1[0] ^= 3;
            if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
            {
                switch (gBattleTextBuff1[0])
                {
                case B_OUTCOME_WON:
                    stringPtr = BattleText_PlayerDefeatedTrainers;
                    break;
                case B_OUTCOME_LOST:
                    stringPtr = BattleText_PlayerLostTrainers;
                    break;
                case B_OUTCOME_DREW:
                    stringPtr = BattleText_PlayerTiedTrainers;
                    break;
                }
            }
            else
            {
                switch (gBattleTextBuff1[0])
                {
                case B_OUTCOME_WON:
                    stringPtr = BattleText_PlayerDefeatedTrainer;
                    break;
                case B_OUTCOME_LOST:
                    stringPtr = BattleText_PlayerLostTrainer;
                    break;
                case B_OUTCOME_DREW:
                    stringPtr = BattleText_PlayerTiedTrainer;
                    break;
                }
            }
        }
        break;
    default: // load a string from the table
        if (stringID >= BATTLESTRINGS_MAX)
        {
            gDisplayedStringBattle[0] = EOS;
            return;
        }
        else
        {
            stringPtr = gBattleStringsTable[stringID - BATTLESTRING_TO_SUB];
#if GERMAN
            stringPtr = de_sub_804110C(stringID, stringPtr);
#endif
        }
        break;
    }
    BattleStringExpandPlaceholdersToDisplayedString(stringPtr);
}

u32 BattleStringExpandPlaceholdersToDisplayedString(const u8* src)
{
    BattleStringExpandPlaceholders(src, gDisplayedStringBattle);
}

const u8* TryGetStatusString(u8* src)
{
    u32 i;
    u8 status[8];
    u32 flag1, flag2;
    u8* statusPtr;

    memcpy(status, gUnknown_084017A8, 8);

    statusPtr = status;
    for (i = 0; i < sizeof(struct StatusFlagString); i++)
    {
        if (*src == EOS) break; // oneline required to match with -g
        *statusPtr = *src;
        src++;
        statusPtr++;
    }
    flag1 = *(u32*)(&status[0]);
    flag2 = *(u32*)(&status[4]);
    for (i = 0; i < 7; i++)
    {
        if (flag1 == *(u32*)(&gUnknown_081FA6D4[i].flag[0]) && flag2 == *(u32*)(&gUnknown_081FA6D4[i].flag[4]))
            return gUnknown_081FA6D4[i].ptr;
    }
    return NULL;
}

#if GERMAN
extern u8 *de_sub_8073174(u8 *, const u8 *);
extern u8 *de_sub_8041024(s32, u32);
#endif

#ifdef ENGLISH
#define HANDLE_NICKNAME_STRING_CASE(bank, monIndex)                     \
    if (GetBattlerSide(bank) != 0)                                         \
    {                                                                   \
        if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)                     \
            toCpy = BattleText_Foe;                                  \
        else                                                            \
            toCpy = BattleText_Wild;                                  \
        while (*toCpy != EOS)                                           \
        {                                                               \
            dst[dstID] = *toCpy;                                        \
            dstID++;                                                    \
            toCpy++;                                                    \
        }                                                               \
        GetMonData(&gEnemyParty[monIndex], MON_DATA_NICKNAME, text);    \
    }                                                                   \
    else                                                                \
    {                                                                   \
        GetMonData(&gPlayerParty[monIndex], MON_DATA_NICKNAME, text);   \
    }                                                                   \
    StringGet_Nickname(text);                                               \
    toCpy = text;
#else
#define HANDLE_NICKNAME_STRING_CASE(bank, monIndex)                     \
    if (GetBattlerSide(bank) != 0)                                         \
    {                                                                   \
        GetMonData(&gEnemyParty[monIndex], MON_DATA_NICKNAME, text);    \
        StringGet_Nickname(text);                                           \
        toCpy = text;                                                   \
        while (*toCpy != EOS)                                           \
        {                                                               \
            dst[dstID] = *toCpy;                                        \
            dstID++;                                                    \
            toCpy++;                                                    \
        }                                                               \
        if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)                     \
            toCpy = BattleText_Foe;                                  \
        else                                                            \
            toCpy = BattleText_Wild;                                  \
    }                                                                   \
    else                                                                \
    {                                                                   \
        GetMonData(&gPlayerParty[monIndex], MON_DATA_NICKNAME, text);   \
        StringGet_Nickname(text);                                           \
        toCpy = text;                                                   \
    }
#endif

u32 BattleStringExpandPlaceholders(const u8* src, u8* dst)
{
    u32 dstID = 0; // if they used dstID, why not use srcID as well?
    const u8* toCpy = NULL;
    u8 text[12];
    u8 multiplayerID = GetMultiplayerId();

    while (*src != EOS)
    {
        if (*src == B_BUFF_PLACEHOLDER_BEGIN)
        {
            src++;
            switch (*src)
            {
            case B_TXT_BUFF1:
                if (gBattleTextBuff1[0] == B_BUFF_PLACEHOLDER_BEGIN)
                {
                    ExpandBattleTextBuffPlaceholders(gBattleTextBuff1, gStringVar1);
                    toCpy = gStringVar1;
                }
                else
                {
                    toCpy = TryGetStatusString(gBattleTextBuff1);
                    if (toCpy == NULL)
                        toCpy = gBattleTextBuff1;
                }
                break;
            case B_TXT_BUFF2:
                if (gBattleTextBuff2[0] == B_BUFF_PLACEHOLDER_BEGIN)
                {
                    ExpandBattleTextBuffPlaceholders(gBattleTextBuff2, gStringVar2);
                    toCpy = gStringVar2;
                }
                else
                    toCpy = gBattleTextBuff2;
                break;
            case B_TXT_BUFF3:
                if (gBattleTextBuff3[0] == B_BUFF_PLACEHOLDER_BEGIN)
                {
                    ExpandBattleTextBuffPlaceholders(gBattleTextBuff3, gStringVar3);
                    toCpy = gStringVar3;
                }
                else
                    toCpy = gBattleTextBuff3;
                break;
            case B_TXT_PLAYER_MON1_NAME: // first player poke name
                GetMonData(&gPlayerParty[gBattlerPartyIndexes[GetBattlerAtPosition(0)]], MON_DATA_NICKNAME, text);
                StringGet_Nickname(text);
                toCpy = text;
                break;
            case B_TXT_OPPONENT_MON1_NAME: // first enemy poke name
                GetMonData(&gEnemyParty[gBattlerPartyIndexes[GetBattlerAtPosition(1)]], MON_DATA_NICKNAME, text);
                StringGet_Nickname(text);
                toCpy = text;
                break;
            case B_TXT_PLAYER_MON2_NAME: // second player poke name
                GetMonData(&gPlayerParty[gBattlerPartyIndexes[GetBattlerAtPosition(2)]], MON_DATA_NICKNAME, text);
                StringGet_Nickname(text);
                toCpy = text;
                break;
            case B_TXT_OPPONENT_MON2_NAME: // second enemy poke name
                GetMonData(&gEnemyParty[gBattlerPartyIndexes[GetBattlerAtPosition(3)]], MON_DATA_NICKNAME, text);
                StringGet_Nickname(text);
                toCpy = text;
                break;
            case B_TXT_LINK_PLAYER_MON1_NAME: // link first player poke name
                GetMonData(&gPlayerParty[gBattlerPartyIndexes[gLinkPlayers[multiplayerID].id]], MON_DATA_NICKNAME, text);
                StringGet_Nickname(text);
                toCpy = text;
                break;
            case B_TXT_LINK_OPPONENT_MON1_NAME: // link first opponent poke name
                GetMonData(&gEnemyParty[gBattlerPartyIndexes[gLinkPlayers[multiplayerID].id ^ 1]], MON_DATA_NICKNAME, text);
                StringGet_Nickname(text);
                toCpy = text;
                break;
            case B_TXT_LINK_PLAYER_MON2_NAME: // link second player poke name
                GetMonData(&gPlayerParty[gBattlerPartyIndexes[gLinkPlayers[multiplayerID].id ^ 2]], MON_DATA_NICKNAME, text);
                StringGet_Nickname(text);
                toCpy = text;
                break;
            case B_TXT_LINK_OPPONENT_MON2_NAME: // link second opponent poke name
                GetMonData(&gEnemyParty[gBattlerPartyIndexes[gLinkPlayers[multiplayerID].id ^ 3]], MON_DATA_NICKNAME, text);
                StringGet_Nickname(text);
                toCpy = text;
                break;
            case B_TXT_ATK_NAME_WITH_PREFIX_MON1: // attacker name with prefix, only bank 0/1
                HANDLE_NICKNAME_STRING_CASE(gBattlerAttacker, gBattlerPartyIndexes[GetBattlerAtPosition(GetBattlerPosition(gBattlerAttacker) & 1)])
                break;
            case B_TXT_ATK_PARTNER_NAME: // attacker partner name, only bank 0/1
                if (GetBattlerSide(gBattlerAttacker) == 0)
                    GetMonData(&gPlayerParty[gBattlerPartyIndexes[GetBattlerAtPosition(GetBattlerPosition(gBattlerAttacker) & 1) + 2]], MON_DATA_NICKNAME, text);
                else
                    GetMonData(&gEnemyParty[gBattlerPartyIndexes[GetBattlerAtPosition(GetBattlerPosition(gBattlerAttacker) & 1) + 2]], MON_DATA_NICKNAME, text);

                StringGet_Nickname(text);
                toCpy = text;
                break;
            case B_TXT_ATK_NAME_WITH_PREFIX: // attacker name with prefix
                HANDLE_NICKNAME_STRING_CASE(gBattlerAttacker, gBattlerPartyIndexes[gBattlerAttacker])
                break;
            case B_TXT_DEF_NAME_WITH_PREFIX: // target name with prefix
                HANDLE_NICKNAME_STRING_CASE(gBattlerTarget, gBattlerPartyIndexes[gBattlerTarget])
                break;
            case B_TXT_EFF_NAME_WITH_PREFIX: // effect bank name with prefix
                HANDLE_NICKNAME_STRING_CASE(gEffectBattler, gBattlerPartyIndexes[gEffectBattler])
                break;
            case B_TXT_ACTIVE_NAME_WITH_PREFIX: // active bank name with prefix
                HANDLE_NICKNAME_STRING_CASE(gActiveBattler, gBattlerPartyIndexes[gActiveBattler])
                break;
            case B_TXT_SCR_ACTIVE_NAME_WITH_PREFIX: // scripting active bank name with prefix
                HANDLE_NICKNAME_STRING_CASE(gBattleStruct->scriptingActive, gBattlerPartyIndexes[gBattleStruct->scriptingActive])
                break;
            case B_TXT_CURRENT_MOVE: // current move name
                if (gStringInfo->currentMove >= NUM_MOVES)
                    toCpy = (void*) &gUnknown_08401674[gBattleStruct->stringMoveType];
                else
                    toCpy = gMoveNames[gStringInfo->currentMove];
                break;
            case B_TXT_LAST_MOVE: // last used move name
                if (gStringInfo->lastMove >= NUM_MOVES)
                    toCpy = (void*) &gUnknown_08401674[gBattleStruct->stringMoveType];
                else
                    toCpy = gMoveNames[gStringInfo->lastMove];
                break;
            case B_TXT_LAST_ITEM: // last used item
                if (gBattleTypeFlags & BATTLE_TYPE_LINK)
                {
                    if (gLastUsedItem == ITEM_ENIGMA_BERRY)
                    {
                        if (gLinkPlayers[gBattleStruct->multiplayerId].id == gPotentialItemEffectBattler)
                        {
                            StringCopy(text, gEnigmaBerries[gPotentialItemEffectBattler].name);
#ifdef ENGLISH
                            StringAppend(text, BattleText_Berry);
#else
                            de_sub_8073174(text, BattleText_Berry);
#endif
                            toCpy = text;
                        }
                        else
                            toCpy = BattleText_EnigmaBerry;
                    }
                    else
                    {
                        CopyItemName(gLastUsedItem, text);
                        toCpy = text;
                    }
                }
                else
                {
                    CopyItemName(gLastUsedItem, text);
                    toCpy = text;
                }
                break;
            case B_TXT_LAST_ABILITY: // last used ability
                toCpy = gAbilityNames[gLastUsedAbility];
                break;
            case B_TXT_ATK_ABILITY: // attacker ability
                toCpy = gAbilityNames[gAbilitiesPerBank[gBattlerAttacker]];
                break;
            case B_TXT_DEF_ABILITY: // target ability
                toCpy = gAbilityNames[gAbilitiesPerBank[gBattlerTarget]];
                break;
            case B_TXT_SCR_ACTIVE_ABILITY: // scripting active ability
                toCpy = gAbilityNames[gAbilitiesPerBank[gBattleStruct->scriptingActive]];
                break;
            case B_TXT_EFF_ABILITY: // effect bank ability
                toCpy = gAbilityNames[gAbilitiesPerBank[gEffectBattler]];
                break;
            case B_TXT_TRAINER1_CLASS: // trainer class name
#ifdef ENGLISH
                if (gTrainerBattleOpponent == SECRET_BASE_OPPONENT)
                    toCpy = gTrainerClassNames[GetSecretBaseTrainerNameIndex()];
                else if (gBattleTypeFlags & BATTLE_TYPE_BATTLE_TOWER)
                    toCpy = gTrainerClassNames[get_trainer_class_name_index()];
                else if (gBattleTypeFlags & BATTLE_TYPE_EREADER_TRAINER)
                    toCpy = gTrainerClassNames[GetEReaderTrainerClassNameIndex()];
                else
                    toCpy = gTrainerClassNames[gTrainers[gTrainerBattleOpponent].trainerClass];
                break;
#else
                if (gTrainerBattleOpponent == SECRET_BASE_OPPONENT)
                    toCpy = de_sub_8041024(gTrainerBattleOpponent, 0);
                else if (gBattleTypeFlags & BATTLE_TYPE_BATTLE_TOWER)
                    toCpy = de_sub_8041024(BATTLE_TYPE_BATTLE_TOWER, 0);
                else if (gBattleTypeFlags & BATTLE_TYPE_EREADER_TRAINER)
                    toCpy = de_sub_8041024(BATTLE_TYPE_EREADER_TRAINER, 0);
                else
                    toCpy = de_sub_8041024(0, gTrainerBattleOpponent);
                break;
#endif
            case B_TXT_TRAINER1_NAME: // trainer name
                if (gTrainerBattleOpponent == SECRET_BASE_OPPONENT)
                {
                    memset(text, 0xFF, 8);
                    memcpy(text, eSecretBaseRecord->playerName, 7);
                    toCpy = text;
                }
                else if (gBattleTypeFlags & BATTLE_TYPE_BATTLE_TOWER)
                {
                    get_trainer_name(text);
                    toCpy = text;
                }
                else if (gBattleTypeFlags & BATTLE_TYPE_EREADER_TRAINER)
                {
                    SetEReaderTrainerName(text);
                    toCpy = text;
                }
                else
                    toCpy = gTrainers[gTrainerBattleOpponent].trainerName;
                break;
            case B_TXT_LINK_PLAYER_NAME: // link player name?
                toCpy = gLinkPlayers[multiplayerID].name;
                break;
            case B_TXT_LINK_PARTNER_NAME: // link partner name?
                toCpy = gLinkPlayers[sub_803FC34(2 ^ gLinkPlayers[multiplayerID].id)].name;
                break;
            case B_TXT_LINK_OPPONENT1_NAME: // link opponent 1 name?
                toCpy = gLinkPlayers[sub_803FC34(1 ^ gLinkPlayers[multiplayerID].id)].name;
                break;
            case B_TXT_LINK_OPPONENT2_NAME: // link opponent 2 name?
                toCpy = gLinkPlayers[sub_803FC34(3 ^ gLinkPlayers[multiplayerID].id)].name;
                break;
            case B_TXT_LINK_SCR_TRAINER_NAME: // link scripting active name
                toCpy = gLinkPlayers[sub_803FC34(gBattleStruct->scriptingActive)].name;
                break;
            case B_TXT_PLAYER_NAME: // player name
                toCpy = gSaveBlock2.playerName;
                break;
            case B_TXT_TRAINER1_LOSE_TEXT: // ?
                toCpy = GetTrainerLoseText();
                break;
            case B_TXT_22: // ?
                HANDLE_NICKNAME_STRING_CASE(gBattleStruct->scriptingActive, gBattleStruct->unk1605E)
                break;
            case B_TXT_PC_CREATOR_NAME: // lanette pc
                if (FlagGet(FLAG_SYS_PC_LANETTE))
                    toCpy = BattleText_Lanette;
                else
                    toCpy = BattleText_Someone;
                break;
            case B_TXT_ATK_PREFIX2:
                if (GetBattlerSide(gBattlerAttacker) == 0)
                    toCpy = BattleText_Ally2;
                else
                    toCpy = BattleText_Foe3;
                break;
            case B_TXT_DEF_PREFIX2:
                if (GetBattlerSide(gBattlerTarget) == 0)
                    toCpy = BattleText_Ally2;
                else
                    toCpy = BattleText_Foe3;
                break;
            case B_TXT_ATK_PREFIX1:
                if (GetBattlerSide(gBattlerAttacker) == 0)
                    toCpy = BattleText_Ally;
                else
                    toCpy = BattleText_Foe2;
                break;
            case B_TXT_DEF_PREFIX1:
                if (GetBattlerSide(gBattlerTarget) == 0)
                    toCpy = BattleText_Ally;
                else
                    toCpy = BattleText_Foe2;
                break;
            case B_TXT_ATK_PREFIX3:
                if (GetBattlerSide(gBattlerAttacker) == 0)
                    toCpy = BattleText_Ally3;
                else
                    toCpy = BattleText_Foe4;
                break;
            case B_TXT_DEF_PREFIX3:
                if (GetBattlerSide(gBattlerTarget) == 0)
                    toCpy = BattleText_Ally3;
                else
                    toCpy = BattleText_Foe4;
                break;
            }
            //if (toCpy != NULL) really GF, why did you forget about this?
            while (*toCpy != EOS)
            {
                dst[dstID] = *toCpy;
                dstID++;
                toCpy++;
            }
            if (*src == B_TXT_TRAINER1_LOSE_TEXT)
            {
                dst[dstID] = EXT_CTRL_CODE_BEGIN;
                dstID++;
                dst[dstID] = EXT_CTRL_CODE_PAUSE_UNTIL_PRESS;
                dstID++;
            }
        }
        else
        {
            dst[dstID] = *src;
            dstID++;
        }
        src++;
    }
    dst[dstID] = *src;
    dstID++;
    return dstID;
}

void ExpandBattleTextBuffPlaceholders(u8* src, u8* dst)
{
    u32 srcID = 1;
    u32 value = 0;
    u8 text[12];
    u16 hword;

    *dst = EOS;
    while (src[srcID] != EOS)
    {
        switch (src[srcID])
        {
        case B_BUFF_STRING: // battle string
            hword = T1_READ_16(&src[srcID + 1]);
#if GERMAN
            if (hword == 209 || hword == 211)
                srcID += 3;
#endif
            StringAppend(dst, gBattleStringsTable[hword - BATTLESTRING_TO_SUB]);
            srcID += 3;
            break;
        case B_BUFF_NUMBER: // int to string
            switch (src[srcID + 1])
            {
            case 1:
                value = T1_READ_8(&src[srcID + 3]);
                break;
            case 2:
                value = T1_READ_16(&src[srcID + 3]);
                break;
            case 4:
                value = T1_READ_32(&src[srcID + 3]);
                break;
            }
            ConvertIntToDecimalStringN(dst, value, 0, src[srcID + 2]);
            srcID += src[srcID + 1] + 3;
            break;
        case B_BUFF_MOVE: // move name
            StringAppend(dst, gMoveNames[T1_READ_16(&src[srcID + 1])]);
            srcID += 3;
            break;
        case B_BUFF_TYPE: // type name
            StringAppend(dst, gTypeNames[src[srcID + 1]]);
            srcID += 2;
            break;
        case B_BUFF_MON_NICK_WITH_PREFIX: // poke nick with prefix
#ifdef ENGLISH
            if (GetBattlerSide(src[srcID + 1]) == 0)
            {
                GetMonData(&gPlayerParty[src[srcID + 2]], MON_DATA_NICKNAME, text);
            }
            else
            {
                if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
                    StringAppend(dst, BattleText_Foe);
                else
                    StringAppend(dst, BattleText_Wild);
                GetMonData(&gEnemyParty[src[srcID + 2]], MON_DATA_NICKNAME, text);
            }
            StringGet_Nickname(text);
            StringAppend(dst, text);
#else
            if (GetBattlerSide(src[srcID + 1]) == 0)
            {
                GetMonData(&gPlayerParty[src[srcID + 2]], MON_DATA_NICKNAME, text);
                StringGet_Nickname(text);
                StringAppend(dst, text);
            }
            else
            {
                GetMonData(&gEnemyParty[src[srcID + 2]], MON_DATA_NICKNAME, text);
                StringGet_Nickname(text);
                StringAppend(dst, text);
                if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
                    StringAppend(dst, BattleText_Foe);
                else
                    StringAppend(dst, BattleText_Wild);
            }
#endif
            srcID += 3;
            break;
        case B_BUFF_STAT: // stats
            StringAppend(dst, gUnknown_08400F58[src[srcID + 1]]);
            srcID += 2;
            break;
        case B_BUFF_SPECIES: // species name
            GetSpeciesName(dst, T1_READ_16(&src[srcID + 1]));
            srcID += 3;
            break;
        case B_BUFF_MON_NICK: // poke nick without prefix
            if (GetBattlerSide(src[srcID + 1]) == 0)
                GetMonData(&gPlayerParty[src[srcID + 2]], MON_DATA_NICKNAME, dst);
            else
                GetMonData(&gEnemyParty[src[srcID + 2]], MON_DATA_NICKNAME, dst);
            StringGet_Nickname(dst);
            srcID += 3;
            break;
        case B_BUFF_NEGATIVE_FLAVOR: // flavour table
            StringAppend(dst, gUnknown_08400F78[src[srcID + 1]]);
            srcID += 2;
            break;
        case B_BUFF_ABILITY: // ability names
            StringAppend(dst, gAbilityNames[src[srcID + 1]]);
            srcID += 2;
            break;
        case B_BUFF_ITEM: // item name
            {
                hword = T1_READ_16(&src[srcID + 1]);
                if (gBattleTypeFlags & BATTLE_TYPE_LINK)
                {
                    if (hword == ITEM_ENIGMA_BERRY)
                    {
                        if (gLinkPlayers[gBattleStruct->multiplayerId].id == gPotentialItemEffectBattler)
                        {
                            StringCopy(dst, gEnigmaBerries[gPotentialItemEffectBattler].name);
#ifdef ENGLISH
                            StringAppend(dst, BattleText_Berry);
#else
                            de_sub_8073174(dst, BattleText_Berry);
#endif
                        }
                        else
                            StringAppend(dst, BattleText_EnigmaBerry);
                    }
                    else
                        CopyItemName(hword, dst);
                }
                else
                    CopyItemName(hword, dst);
                srcID += 3;
            }
            break;
        }
    }
}

// Loads one of two text strings into the provided buffer. This is functionally
// unused, since the value loaded into the buffer is not read; it loaded one of
// two particles (either "は" or "の") which works in tandem with ChooseTypeOfMoveUsedString
// below to effect changes in the meaning of the line.
void ChooseMoveUsedParticle(u8* textBuff)
{
    s32 counter = 0;
    u32 i = 0;

    while (counter != 4)
    {
        if (gUnknown_084016BC[i] == 0)
            counter++;
        if (gUnknown_084016BC[i++] == gStringInfo->currentMove)
            break;
    }

    if (counter >= 0)
    {
        if (counter <= 2)
            StringCopy(textBuff, BattleText_Format10); // is
        else if (counter <= 4)
            StringCopy(textBuff, BattleText_Format11); // 's
    }
}

// Appends "!" to the text buffer `dst`. In the original Japanese this looked
// into the table of moves at gUnknown_084016BC and varied the line accordingly.
// 
// BattleText_Exclamation was a plain "!", used for any attack not on the list.
// It resulted in the translation "<NAME>'s <ATTACK>!".
// 
// BattleText_Exclamation2 was "を つかった！". This resulted in the translation
// "<NAME> used <ATTACK>!", which was used for all attacks in English.
// 
// BattleText_Exclamation3 was "した！". This was used for those moves whose
// names were verbs, such as Recover, and resulted in translations like "<NAME>
// recovered itself!".
// 
// BattleText_Exclamation4 was "を した！" This resulted in a translation of
// "<NAME> did an <ATTACK>!".
// 
// BattleText_Exclamation5 was " こうげき！" This resulted in a translation of
// "<NAME>'s <ATTACK> attack!".
void ChooseTypeOfMoveUsedString(u8* dst)
{
    s32 counter = 0;
    s32 i = 0;

    while (*dst != EOS)
        dst++;

    while (counter != 4)
    {
        if (gUnknown_084016BC[i] == 0)
            counter++;
        if (gUnknown_084016BC[i++] == gStringInfo->currentMove)
            break;
    }

    switch (counter)
    {
    case 0:
        StringCopy(dst, BattleText_Exclamation2);
        break;
    case 1:
        StringCopy(dst, BattleText_Exclamation3);
        break;
    case 2:
        StringCopy(dst, BattleText_Exclamation4);
        break;
    case 3:
        StringCopy(dst, BattleText_Exclamation5);
        break;
    case 4:
        StringCopy(dst, BattleText_Exclamation);
        break;
    }
}
