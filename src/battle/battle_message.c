#include "global.h"
#include "battle.h"
#include "battle_message.h"
#include "battle_tower.h"
#include "item.h"
#include "items.h"
#include "pokemon.h"
#include "data2.h"
#include "text.h"
#include "string_util.h"
#include "link.h"
#include "battle_setup.h"
#include "battle_tower.h"
#include "flags.h"

#define BATTLESTRING_TO_SUB 12
#define BATTLESTRINGS_NO    351
#define BATTLESTRINGS_MAX   BATTLESTRINGS_NO + BATTLESTRING_TO_SUB

extern const u8* const gBattleStringsTable[BATTLESTRINGS_NO];

extern u16 gLastUsedItem;
extern u8 gLastUsedAbility;
extern u8 gActiveBank;
extern u8 gBankAttacker;
extern u8 gBankTarget;
extern u8 gStringBank;
extern u8 gEffectBank;
extern u8 gAbilitiesPerBank[4];
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
extern u16 gBattlePartyID[4];
extern struct BattleEnigmaBerry gEnigmaBerries[4];
extern u8 gBattleBufferA[4][0x200];

extern const u8 gUnknown_084005DB[];
extern const u8 gUnknown_084005C7[];
extern const u8 gUnknown_084005AA[];
extern const u8 gUnknown_08400568[];
extern const u8 gUnknown_08400590[];
extern const u8 gUnknown_0840057B[];
extern const u8 gUnknown_08400555[];
extern const u8 gUnknown_084006F1[];
extern const u8 gUnknown_084006A4[];
extern const u8 gUnknown_0840069C[];
extern const u8 gUnknown_0840065C[];
extern const u8 gUnknown_08400645[];
extern const u8 gUnknown_08400608[];
extern const u8 gUnknown_08400635[];
extern const u8 gUnknown_084005F5[];
extern const u8 gUnknown_08400709[];
extern const u8 gUnknown_08400727[];
extern const u8 gUnknown_08400736[];
extern const u8 gUnknown_08400749[];
extern const u8 gUnknown_08400781[];
extern const u8 gUnknown_08400771[];
extern const u8 gUnknown_0840075E[];
extern const u8 gUnknown_084006B3[];
extern const u8 gUnknown_084006BB[];
extern const u8 gUnknown_084006C6[];
extern const u8 gUnknown_084006D5[];
extern const u8 gUnknown_0840068C[];
extern const u8 gUnknown_0840067C[];
extern const u8 gUnknown_08400622[];
extern const u8 gUnknown_084007BD[];
extern const u8 gUnknown_083FFEFC[];
extern const u8 gUnknown_083FFFF7[];
extern const u8 gUnknown_083FFFEA[];
extern const u8 gUnknown_083FFF6A[];
extern const u8 gUnknown_083FFF99[];
extern const u8 gUnknown_083FFFCB[];
extern const u8 gUnknown_083FFF56[];
extern const u8 gUnknown_083FFF81[];
extern const u8 gUnknown_083FFFB3[];
extern const u8 gUnknown_08400A78[];
extern const u8 gUnknown_08400A85[];
extern const u8 gUnknown_08400797[];
extern const u8 gUnknown_08400791[];
extern const u8 gUnknown_084007B7[];
extern const u8 gUnknown_084007B2[];
extern const u8 gUnknown_0840079C[];
extern const u8 gUnknown_084007A1[];
extern const u8 gUnknown_084007A7[];
extern const u8 gUnknown_084007AC[];
extern const u8 gUnknown_084009ED[];
extern const u8 gUnknown_084009F7[];
extern const u8 gUnknown_084007C8[];
extern const u8 gUnknown_084007CA[];
extern const u8 gUnknown_084007CC[];
extern const u8 gUnknown_084007CE[];
extern const u8 gUnknown_084007D0[];
extern const u8 gUnknown_08400E5E[];
extern const u8 gUnknown_08400E62[];

extern const u16 gUnknown_084016BC[]; // a table of moves

extern const u8* const gUnknown_08401674[]; // table of pointers to 'a -TYPE' strings
extern const u8* const gUnknown_08400F58[]; // table of pointers to stat strings
extern const u8* const gUnknown_08400F78[]; // table of pointers to flavour strings

struct StatusFlagString
{
    u8* flag;
    u8* ptr;
};

extern const struct StatusFlagString gUnknown_081FA6D4[7]; // status flag/text
extern const u8 gUnknown_084017A8[8]; // empty flags

extern struct StringInfoBattle* gSelectedOrderFromParty;
#define gStringInfo gSelectedOrderFromParty

void sub_8121D1C(u8* textBuff);
void sub_8121D74(u8* textBuff);
void StrCpyDecodeBattleTextBuff(u8* src, u8* dst);

u8 GetBankSide(u8 bank);
s32 sub_803FC34(u16);
void get_trainer_name(u8* dst);
u8 get_trainer_class_name_index(void);
u8 GetMultiplayerId(void);
u8 GetBankByPlayerAI(u8 ID);
u8 GetBankSide(u8 bank);
u8 GetBankIdentity(u8 bank);
#ifdef GERMAN
extern u8 *de_sub_804110C();
#endif

void BufferStringBattle(u16 stringID)
{
    int i;
    const u8* stringPtr = NULL;

    gStringInfo = (struct StringInfoBattle*)(&gBattleBufferA[gActiveBank][4]);
    gLastUsedItem = gStringInfo->lastItem;
    gLastUsedAbility = gStringInfo->lastAbility;
    BATTLE_STRUCT->scriptingActive = gStringInfo->scrActive;
    BATTLE_STRUCT->unk1605E = gStringInfo->unk1605E;
    BATTLE_STRUCT->hpScale = gStringInfo->hpScale;
    gStringBank = gStringInfo->StringBank;
    BATTLE_STRUCT->stringMoveType = gStringInfo->moveType;
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
                    stringPtr = gUnknown_084005DB;
                else
                    stringPtr = gUnknown_084005C7;
            }
            else
            {
                stringPtr = gUnknown_084005AA;
#ifdef GERMAN
                stringPtr = de_sub_804110C(0xFFFF, stringPtr);
#endif
            }
        }
        else
        {
            if (gBattleTypeFlags & BATTLE_TYPE_LEGENDARY)
                stringPtr = gUnknown_08400568;
            else if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE) // interesting, looks like they had something planned for wild double battles
                stringPtr = gUnknown_08400590;
            else if (gBattleTypeFlags & BATTLE_TYPE_WALLY_TUTORIAL)
                stringPtr = gUnknown_0840057B;
            else
                stringPtr = gUnknown_08400555;
        }
        break;
    case 1: // poke first send-out
        if (GetBankSide(gActiveBank) == 0)
        {
            if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
            {
                if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
                    stringPtr = gUnknown_084006F1;
                else
                    stringPtr = gUnknown_084006A4;
            }
            else
                stringPtr = gUnknown_0840069C;
        }
        else
        {
            if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
            {
                if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
                    stringPtr = gUnknown_0840065C;
                else if (gBattleTypeFlags & BATTLE_TYPE_LINK)
                    stringPtr = gUnknown_08400645;
                else
                {
                    stringPtr = gUnknown_08400608;
#ifdef GERMAN
                    stringPtr = de_sub_804110C(0xFFFF, stringPtr);
#endif
                }
            }
            else if (gBattleTypeFlags & BATTLE_TYPE_LINK)
                stringPtr = gUnknown_08400635;
            else
            {
                stringPtr = gUnknown_084005F5;
#ifdef GERMAN
                stringPtr = de_sub_804110C(0xFFFF, stringPtr);
#endif
            }
        }
        break;
    case 2: // sending poke to ball msg
        if (GetBankSide(gActiveBank) == 0)
        {
            if (BATTLE_STRUCT->hpScale == 0)
                stringPtr = gUnknown_08400709;
            else if (BATTLE_STRUCT->hpScale == 1 || gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
                stringPtr = gUnknown_08400727;
            else if (BATTLE_STRUCT->hpScale == 2)
                stringPtr = gUnknown_08400736;
            else
                stringPtr = gUnknown_08400749;
        }
        else
        {
            if (gTrainerBattleOpponent == 0x800)
            {
                if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
                    stringPtr = gUnknown_08400781;
                else
                    stringPtr = gUnknown_08400771;
            }
            else
            {
                stringPtr = gUnknown_0840075E;
#ifdef GERMAN
                stringPtr = de_sub_804110C(0xFFFF, stringPtr);
#endif
            }
        }
        break;
    case 3: // switch-in msg
        if (GetBankSide(BATTLE_STRUCT->scriptingActive) == 0)
        {
            if (BATTLE_STRUCT->hpScale == 0 || gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
                stringPtr = gUnknown_084006B3;
            else if (BATTLE_STRUCT->hpScale == 1)
                stringPtr = gUnknown_084006BB;
            else if (BATTLE_STRUCT->hpScale == 2)
                stringPtr = gUnknown_084006C6;
            else
                stringPtr = gUnknown_084006D5;
        }
        else
        {
            if (gBattleTypeFlags & BATTLE_TYPE_LINK)
            {
                if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
                    stringPtr = gUnknown_0840068C;
                else
                    stringPtr = gUnknown_0840067C;
            }
            else
            {
                stringPtr = gUnknown_08400622;
#ifdef GERMAN
                stringPtr = de_sub_804110C(0xFFFF, stringPtr);
#endif
            }
        }
        break;
    case 4: // pokemon used a move msg
        sub_8121D1C(gBattleTextBuff1);
        if (gStringInfo->currentMove > 0x162)
            StringCopy(gBattleTextBuff2, gUnknown_08401674[BATTLE_STRUCT->stringMoveType]);
        else
            StringCopy(gBattleTextBuff2, gMoveNames[gStringInfo->currentMove]);
        sub_8121D74(gBattleTextBuff2);
        stringPtr = gUnknown_084007BD;
        break;
    case 5: // battle end
        if (gBattleTextBuff1[0] & 0x80)
        {
            gBattleTextBuff1[0] &= ~(0x80);
            if (GetBankSide(gActiveBank) == 1 && gBattleTextBuff1[0] != 3)
                gBattleTextBuff1[0] ^= 3;
            if (gBattleTextBuff1[0] == BATTLE_LOST || gBattleTextBuff1[0] == BATTLE_DREW)
                stringPtr = gUnknown_083FFEFC;
            else
            {
                if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
                    stringPtr = gUnknown_083FFFF7;
                else
                    stringPtr = gUnknown_083FFFEA;
            }
        }
        else
        {
            if (GetBankSide(gActiveBank) == 1 && gBattleTextBuff1[0] != 3)
                gBattleTextBuff1[0] ^= 3;
            if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
            {
                switch (gBattleTextBuff1[0])
                {
                case BATTLE_WON:
                    stringPtr = gUnknown_083FFF6A;
                    break;
                case BATTLE_LOST:
                    stringPtr = gUnknown_083FFF99;
                    break;
                case BATTLE_DREW:
                    stringPtr = gUnknown_083FFFCB;
                    break;
                }
            }
            else
            {
                switch (gBattleTextBuff1[0])
                {
                case BATTLE_WON:
                    stringPtr = gUnknown_083FFF56;
                    break;
                case BATTLE_LOST:
                    stringPtr = gUnknown_083FFF81;
                    break;
                case BATTLE_DREW:
                    stringPtr = gUnknown_083FFFB3;
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
#ifdef GERMAN
            stringPtr = de_sub_804110C(stringID, stringPtr);
#endif
        }
        break;
    }
    StrCpyDecodeToDisplayedStringBattle(stringPtr);
}

u32 StrCpyDecodeToDisplayedStringBattle(const u8* src)
{
    StrCpyDecodeBattle(src, gDisplayedStringBattle);
}

const u8* AppendStatusString(u8* src)
{
    u32 i;
    u8 status[8];
    u32 flag1, flag2;
    u8* statusPtr;

    memcpy(status, gUnknown_084017A8, 8);

    statusPtr = status;
    for (i = 0; i < sizeof(struct StatusFlagString); i++)
    {
        if (*src == EOS)
            break;
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

#ifdef GERMAN
extern u8 *de_sub_8073174(u8 *, const u8 *);
extern u8 *de_sub_8041024(s32, u32);
#endif

#ifdef ENGLISH
#define HANDLE_NICKNAME_STRING_CASE(bank, monIndex)                     \
    if (GetBankSide(bank) != 0)                                         \
    {                                                                   \
        if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)                     \
            toCpy = gUnknown_08400797;                                  \
        else                                                            \
            toCpy = gUnknown_08400791;                                  \
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
    StringGetEnd10(text);                                               \
    toCpy = text;
#else
#define HANDLE_NICKNAME_STRING_CASE(bank, monIndex)                     \
    if (GetBankSide(bank) != 0)                                         \
    {                                                                   \
        GetMonData(&gEnemyParty[monIndex], MON_DATA_NICKNAME, text);    \
        StringGetEnd10(text);                                           \
        toCpy = text;                                                   \
        while (*toCpy != EOS)                                           \
        {                                                               \
            dst[dstID] = *toCpy;                                        \
            dstID++;                                                    \
            toCpy++;                                                    \
        }                                                               \
        if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)                     \
            toCpy = gUnknown_08400797;                                  \
        else                                                            \
            toCpy = gUnknown_08400791;                                  \
    }                                                                   \
    else                                                                \
    {                                                                   \
        GetMonData(&gPlayerParty[monIndex], MON_DATA_NICKNAME, text);   \
        StringGetEnd10(text);                                           \
        toCpy = text;                                                   \
    }
#endif

u32 StrCpyDecodeBattle(const u8* src, u8* dst)
{
    u32 dstID = 0; // if they used dstID, why not use srcID as well?
    const u8* toCpy = NULL;
    u8 text[12];
    u8 multiplayerID = GetMultiplayerId();

    while (*src != EOS)
    {
        if (*src == 0xFD)
        {
            src++;
            switch (*src)
            {
            case 0:
                if (gBattleTextBuff1[0] == 0xFD)
                {
                    StrCpyDecodeBattleTextBuff(gBattleTextBuff1, gStringVar1);
                    toCpy = gStringVar1;
                }
                else
                {
                    toCpy = AppendStatusString(gBattleTextBuff1);
                    if (toCpy == 0)
                        toCpy = gBattleTextBuff1;
                }
                break;
            case 1:
                if (gBattleTextBuff2[0] == 0xFD)
                {
                    StrCpyDecodeBattleTextBuff(gBattleTextBuff2, gStringVar2);
                    toCpy = gStringVar2;
                }
                else
                    toCpy = gBattleTextBuff2;
                break;
            case 42:
                if (gBattleTextBuff3[0] == 0xFD)
                {
                    StrCpyDecodeBattleTextBuff(gBattleTextBuff3, gStringVar3);
                    toCpy = gStringVar3;
                }
                else
                    toCpy = gBattleTextBuff3;
                break;
            case 2: // first player poke name
                GetMonData(&gPlayerParty[gBattlePartyID[GetBankByPlayerAI(0)]], MON_DATA_NICKNAME, text);
                StringGetEnd10(text);
                toCpy = text;
                break;
            case 3: // first enemy poke name
                GetMonData(&gEnemyParty[gBattlePartyID[GetBankByPlayerAI(1)]], MON_DATA_NICKNAME, text);
                StringGetEnd10(text);
                toCpy = text;
                break;
            case 4: // second player poke name
                GetMonData(&gPlayerParty[gBattlePartyID[GetBankByPlayerAI(2)]], MON_DATA_NICKNAME, text);
                StringGetEnd10(text);
                toCpy = text;
                break;
            case 5: // second enemy poke name
                GetMonData(&gEnemyParty[gBattlePartyID[GetBankByPlayerAI(3)]], MON_DATA_NICKNAME, text);
                StringGetEnd10(text);
                toCpy = text;
                break;
            case 6: // link first player poke name
                GetMonData(&gPlayerParty[gBattlePartyID[gLinkPlayers[multiplayerID].lp_field_18]], MON_DATA_NICKNAME, text);
                StringGetEnd10(text);
                toCpy = text;
                break;
            case 7: // link first opponent poke name
                GetMonData(&gEnemyParty[gBattlePartyID[gLinkPlayers[multiplayerID].lp_field_18 ^ 1]], MON_DATA_NICKNAME, text);
                StringGetEnd10(text);
                toCpy = text;
                break;
            case 8: // link second player poke name
                GetMonData(&gPlayerParty[gBattlePartyID[gLinkPlayers[multiplayerID].lp_field_18 ^ 2]], MON_DATA_NICKNAME, text);
                StringGetEnd10(text);
                toCpy = text;
                break;
            case 9: // link second opponent poke name
                GetMonData(&gEnemyParty[gBattlePartyID[gLinkPlayers[multiplayerID].lp_field_18 ^ 3]], MON_DATA_NICKNAME, text);
                StringGetEnd10(text);
                toCpy = text;
                break;
            case 10: // attacker name with prefix, only bank 0/1
                HANDLE_NICKNAME_STRING_CASE(gBankAttacker, gBattlePartyID[GetBankByPlayerAI(GetBankIdentity(gBankAttacker) & 1)])
                break;
            case 11: // attacker partner name, only bank 0/1
                if (GetBankSide(gBankAttacker) == 0)
                    GetMonData(&gPlayerParty[gBattlePartyID[GetBankByPlayerAI(GetBankIdentity(gBankAttacker) & 1) + 2]], MON_DATA_NICKNAME, text);
                else
                    GetMonData(&gEnemyParty[gBattlePartyID[GetBankByPlayerAI(GetBankIdentity(gBankAttacker) & 1) + 2]], MON_DATA_NICKNAME, text);

                StringGetEnd10(text);
                toCpy = text;
                break;
            case 12: // attacker name with prefix
                HANDLE_NICKNAME_STRING_CASE(gBankAttacker, gBattlePartyID[gBankAttacker])
                break;
            case 13: // target name with prefix
                HANDLE_NICKNAME_STRING_CASE(gBankTarget, gBattlePartyID[gBankTarget])
                break;
            case 14: // effect bank name with prefix
                HANDLE_NICKNAME_STRING_CASE(gEffectBank, gBattlePartyID[gEffectBank])
                break;
            case 15: // active bank name with prefix
                HANDLE_NICKNAME_STRING_CASE(gActiveBank, gBattlePartyID[gActiveBank])
                break;
            case 16: // scripting active bank name with prefix
                HANDLE_NICKNAME_STRING_CASE(BATTLE_STRUCT->scriptingActive, gBattlePartyID[BATTLE_STRUCT->scriptingActive])
                break;
            case 17: // current move name
                if (gStringInfo->currentMove > 0x162)
                    toCpy = (void*) &gUnknown_08401674[BATTLE_STRUCT->stringMoveType];
                else
                    toCpy = gMoveNames[gStringInfo->currentMove];
                break;
            case 18: // last used move name
                if (gStringInfo->lastMove > 0x162)
                    toCpy = (void*) &gUnknown_08401674[BATTLE_STRUCT->stringMoveType];
                else
                    toCpy = gMoveNames[gStringInfo->lastMove];
                break;
            case 19: // last used item
                if (gBattleTypeFlags & BATTLE_TYPE_LINK)
                {
                    if (gLastUsedItem == ITEM_ENIGMA_BERRY)
                    {
                        if (gLinkPlayers[BATTLE_STRUCT->linkPlayerIndex].lp_field_18 == gStringBank)
                        {
                            StringCopy(text, gEnigmaBerries[gStringBank].name);
#ifdef ENGLISH
                            StringAppend(text, gUnknown_08400A85);
#else
                            de_sub_8073174(text, gUnknown_08400A85);
#endif
                            toCpy = text;
                        }
                        else
                            toCpy = gUnknown_08400A78;
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
            case 20: // last used ability
                toCpy = gAbilityNames[gLastUsedAbility];
                break;
            case 21: // attacker ability
                toCpy = gAbilityNames[gAbilitiesPerBank[gBankAttacker]];
                break;
            case 22: // target ability
                toCpy = gAbilityNames[gAbilitiesPerBank[gBankTarget]];
                break;
            case 23: // scripting active ability
                toCpy = gAbilityNames[gAbilitiesPerBank[BATTLE_STRUCT->scriptingActive]];
                break;
            case 24: // effect bank ability
                toCpy = gAbilityNames[gAbilitiesPerBank[gEffectBank]];
                break;
            case 25: // trainer class name
#ifdef ENGLISH
                if (gTrainerBattleOpponent == 0x400)
                    toCpy = gTrainerClassNames[GetSecretBaseTrainerNameIndex()];
                else if (gBattleTypeFlags & BATTLE_TYPE_BATTLE_TOWER)
                    toCpy = gTrainerClassNames[get_trainer_class_name_index()];
                else if (gBattleTypeFlags & BATTLE_TYPE_EREADER_TRAINER)
                    toCpy = gTrainerClassNames[GetEReaderTrainerClassNameIndex()];
                else
                    toCpy = gTrainerClassNames[gTrainers[gTrainerBattleOpponent].trainerClass];
                break;
#else
                if (gTrainerBattleOpponent == 0x400)
                    toCpy = de_sub_8041024(gTrainerBattleOpponent, 0);
                else if (gBattleTypeFlags & BATTLE_TYPE_BATTLE_TOWER)
                    toCpy = de_sub_8041024(BATTLE_TYPE_BATTLE_TOWER, 0);
                else if (gBattleTypeFlags & BATTLE_TYPE_EREADER_TRAINER)
                    toCpy = de_sub_8041024(BATTLE_TYPE_EREADER_TRAINER, 0);
                else
                    toCpy = de_sub_8041024(0, gTrainerBattleOpponent);
                break;
#endif
            case 26: // trainer name
                if (gTrainerBattleOpponent == 0x400)
                {
                    memset(text, 0xFF, 8);
                    memcpy(text, &ewram[0x17002], 7);
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
            case 27: // link player name?
                toCpy = gLinkPlayers[multiplayerID].name;
                break;
            case 28: // link partner name?
                toCpy = gLinkPlayers[sub_803FC34(2 ^ gLinkPlayers[multiplayerID].lp_field_18)].name;
                break;
            case 29: // link opponent 1 name?
                toCpy = gLinkPlayers[sub_803FC34(1 ^ gLinkPlayers[multiplayerID].lp_field_18)].name;
                break;
            case 30: // link opponent 2 name?
                toCpy = gLinkPlayers[sub_803FC34(3 ^ gLinkPlayers[multiplayerID].lp_field_18)].name;
                break;
            case 31: // link scripting active name
                toCpy = gLinkPlayers[sub_803FC34(BATTLE_STRUCT->scriptingActive)].name;
                break;
            case 32: // player name
                toCpy = gSaveBlock2.playerName;
                break;
            case 33: // ?
                toCpy = sub_8082830();
                break;
            case 34: // ?
                HANDLE_NICKNAME_STRING_CASE(BATTLE_STRUCT->scriptingActive, BATTLE_STRUCT->unk1605E)
                break;
            case 35: // lanette pc
                if (FlagGet(SYS_PC_LANETTE))
                    toCpy = gUnknown_084009F7;
                else
                    toCpy = gUnknown_084009ED;
                break;
            case 38:
                if (GetBankSide(gBankAttacker) == 0)
                    toCpy = gUnknown_084007AC;
                else
                    toCpy = gUnknown_084007A7;
                break;
            case 39:
                if (GetBankSide(gBankTarget) == 0)
                    toCpy = gUnknown_084007AC;
                else
                    toCpy = gUnknown_084007A7;
                break;
            case 36:
                if (GetBankSide(gBankAttacker) == 0)
                    toCpy = gUnknown_084007A1;
                else
                    toCpy = gUnknown_0840079C;
                break;
            case 37:
                if (GetBankSide(gBankTarget) == 0)
                    toCpy = gUnknown_084007A1;
                else
                    toCpy = gUnknown_0840079C;
                break;
            case 40:
                if (GetBankSide(gBankAttacker) == 0)
                    toCpy = gUnknown_084007B7;
                else
                    toCpy = gUnknown_084007B2;
                break;
            case 41:
                if (GetBankSide(gBankTarget) == 0)
                    toCpy = gUnknown_084007B7;
                else
                    toCpy = gUnknown_084007B2;
                break;
            }
            //if (toCpy != NULL) really GF, why did you forget about this?
            while (*toCpy != EOS)
            {
                dst[dstID] = *toCpy;
                dstID++;
                toCpy++;
            }
            if (*src == 33)
            {
                dst[dstID] = 0xFC;
                dstID++;
                dst[dstID] = 9;
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

#define ByteRead16(ptr) ((ptr)[0] | ((ptr)[1] << 8))
#define ByteRead32(ptr) ((ptr)[0] | (ptr)[1] << 8 | (ptr)[2] << 16 | (ptr)[3] << 24)

void StrCpyDecodeBattleTextBuff(u8* src, u8* dst)
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
        case 0: // battle string
            hword = ByteRead16(&src[srcID + 1]);
#ifdef GERMAN
            if (hword == 209 || hword == 211)
                srcID += 3;
#endif
            StringAppend(dst, gBattleStringsTable[hword - BATTLESTRING_TO_SUB]);
            srcID += 3;
            break;
        case 1: // int to string
            switch (src[srcID + 1])
            {
            case 1:
                value = src[srcID + 3];
                break;
            case 2:
                value = ByteRead16(&src[srcID + 3]);
                break;
            case 4:
                value = ByteRead32(&src[srcID + 3]);
                break;
            }
            ConvertIntToDecimalStringN(dst, value, 0, src[srcID + 2]);
            srcID += src[srcID + 1] + 3;
            break;
        case 2: // move name
            StringAppend(dst, gMoveNames[ByteRead16(&src[srcID + 1])]);
            srcID += 3;
            break;
        case 3: // type name
            StringAppend(dst, gTypeNames[src[srcID + 1]]);
            srcID += 2;
            break;
        case 4: // poke nick with prefix
#ifdef ENGLISH
            if (GetBankSide(src[srcID + 1]) == 0)
            {
                GetMonData(&gPlayerParty[src[srcID + 2]], MON_DATA_NICKNAME, text);
            }
            else
            {
                if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
                    StringAppend(dst, gUnknown_08400797);
                else
                    StringAppend(dst, gUnknown_08400791);
                GetMonData(&gEnemyParty[src[srcID + 2]], MON_DATA_NICKNAME, text);
            }
            StringGetEnd10(text);
            StringAppend(dst, text);
#else
            if (GetBankSide(src[srcID + 1]) == 0)
            {
                GetMonData(&gPlayerParty[src[srcID + 2]], MON_DATA_NICKNAME, text);
                StringGetEnd10(text);
                StringAppend(dst, text);
            }
            else
            {
                GetMonData(&gEnemyParty[src[srcID + 2]], MON_DATA_NICKNAME, text);
                StringGetEnd10(text);
                StringAppend(dst, text);
                if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
                    StringAppend(dst, gUnknown_08400797);
                else
                    StringAppend(dst, gUnknown_08400791);
            }
#endif
            srcID += 3;
            break;
        case 5: // stats
            StringAppend(dst, gUnknown_08400F58[src[srcID + 1]]);
            srcID += 2;
            break;
        case 6: // species name
            GetSpeciesName(dst, ByteRead16(&src[srcID + 1]));
            srcID += 3;
            break;
        case 7: // poke nick without prefix
            if (GetBankSide(src[srcID + 1]) == 0)
                GetMonData(&gPlayerParty[src[srcID + 2]], MON_DATA_NICKNAME, dst);
            else
                GetMonData(&gEnemyParty[src[srcID + 2]], MON_DATA_NICKNAME, dst);
            StringGetEnd10(dst);
            srcID += 3;
            break;
        case 8: // flavour table
            StringAppend(dst, gUnknown_08400F78[src[srcID + 1]]);
            srcID += 2;
            break;
        case 9: // ability names
            StringAppend(dst, gAbilityNames[src[srcID + 1]]);
            srcID += 2;
            break;
        case 10: // item name
            {
                hword = ByteRead16(&src[srcID + 1]);
                if (gBattleTypeFlags & BATTLE_TYPE_LINK)
                {
                    if (hword == ITEM_ENIGMA_BERRY)
                    {
                        if (gLinkPlayers[BATTLE_STRUCT->linkPlayerIndex].lp_field_18 == gStringBank)
                        {
                            StringCopy(dst, gEnigmaBerries[gStringBank].name);
#ifdef ENGLISH
                            StringAppend(dst, gUnknown_08400A85);
#else
                            de_sub_8073174(dst, gUnknown_08400A85);
#endif
                        }
                        else
                            StringAppend(dst, gUnknown_08400A78);
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

void sub_8121D1C(u8* textBuff)
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
            StringCopy(textBuff, gUnknown_08400E5E); // is
        else if (counter <= 4)
            StringCopy(textBuff, gUnknown_08400E62); // 's
    }
}

void sub_8121D74(u8* dst)
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
        StringCopy(dst, gUnknown_084007C8);
        break;
    case 1:
        StringCopy(dst, gUnknown_084007CA);
        break;
    case 2:
        StringCopy(dst, gUnknown_084007CC);
        break;
    case 3:
        StringCopy(dst, gUnknown_084007CE);
        break;
    case 4:
        StringCopy(dst, gUnknown_084007D0);
        break;
    }
}
