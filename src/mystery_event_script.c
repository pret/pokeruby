#include "global.h"
#include "berry.h"
#include "battle_tower.h"
#include "easy_chat.h"
#include "event_data.h"
#include "mail_data.h"
#include "mystery_event_script.h"
#include "pokedex.h"
#include "pokemon.h"
#include "pokemon_size_record.h"
#include "script.h"
#include "constants/species.h"
#include "strings.h"
#include "string_util.h"
#include "text.h"
#include "util.h"
#include "mystery_event_msg.h"

#if ENGLISH
#define LANGUAGE_MASK 0x2
#elif GERMAN
#define LANGUAGE_MASK 0x4
#endif

#ifdef SAPPHIRE
#define VERSION_MASK 0x100
#else
#define VERSION_MASK 0x80
#endif

extern void party_compaction(void);

extern ScrCmdFunc gMysteryEventScriptCmdTable[];
extern ScrCmdFunc gMysteryEventScriptCmdTableEnd[];

static EWRAM_DATA struct ScriptContext sMysteryEventScriptContext = {0};

static bool32 CheckCompatibility(u16 a1, u32 a2, u16 a3, u32 a4)
{
    if (!(a1 & LANGUAGE_MASK))
        return FALSE;

    if (!(a2 & LANGUAGE_MASK))
        return FALSE;

    if (!(a3 & 0x4))
        return FALSE;

    if (!(a4 & VERSION_MASK))
        return FALSE;

    return TRUE;
}

static void SetIncompatible(void)
{
    StringExpandPlaceholders(gStringVar4, gOtherText_DataCannotUseVersion);
    SetMysteryEventScriptStatus(3);
}

static void InitMysteryEventScript(struct ScriptContext *ctx, u8 *script)
{
    InitScriptContext(ctx, gMysteryEventScriptCmdTable, gMysteryEventScriptCmdTableEnd);
    SetupBytecodeScript(ctx, script);
    ctx->data[0] = (u32)script;
    ctx->data[1] = 0;
    ctx->data[2] = 0;
    ctx->data[3] = 0;
}

static bool32 RunMysteryEventScriptCommand(struct ScriptContext *ctx)
{
    if (RunScriptCommand(ctx) && ctx->data[3])
        return TRUE;
    else
        return FALSE;
}

u32 RunMysteryEventScript(u8 *script)
{
    struct ScriptContext *ctx = &sMysteryEventScriptContext;
    InitMysteryEventScript(ctx, script);
    while (RunMysteryEventScriptCommand(ctx))
        ;
    return ctx->data[2];
}

void SetMysteryEventScriptStatus(u32 val)
{
    sMysteryEventScriptContext.data[2] = val;
}

static int CalcChecksum(u8 *data, int size)
{
    unsigned int i;
    int sum = 0;

    for (i = 0; i < size; i++)
        sum += data[i];

    return sum;
}

static u32 GetWord(u8 *ptr)
{
    return ptr[0] | (ptr[1] << 8) | (ptr[2] << 16) | (ptr[3] << 24);
}

static void SetWord(u8 *ptr, u32 val)
{
    ptr[0] = val;
    ptr[1] = val >> 8;
    ptr[2] = val >> 16;
    ptr[3] = val >> 24;
}

bool8 debug_sub_81261B4(u8 *a1, const u8 * _a2)
{
    int a2 = (int)_a2;
    if (a1[0x0] == 1 && a1[0x11] == 15 && !GetWord(a1 + 0x12))
    {
        int v4 = GetWord(a1 + 0x16) - a2 + (int)a1;
        int v5 = GetWord(a1 + 0x1A);
        int v6 = CalcChecksum((u8*)v4, v5 - a2 + (int)a1 - v4);
        SetWord(a1 + 0x12, v6);
        return TRUE;
    }

    return FALSE;
}

bool8 debug_sub_812620C(u8 *a1, const u8 * _a2)
{
    int a2 = (int)_a2;
    if (a1[0x0] == 1 && a1[0x11] == 16 && !GetWord(a1 + 0x12))
    {
        int v4 = GetWord(a1 + 0x16) - a2 + (int)a1;
        int v5 = GetWord(a1 + 0x1A);
        int v6 = CalcCRC16((u8*)v4, v5 - a2 + (int)a1 - v4);
        SetWord(a1 + 0x12, v6);
        return TRUE;
    }

    return FALSE;
}

static u32 CalcRecordMixingGiftChecksum(void)
{
    u32 sum = 0;
    int i;
    char *data = (char *)&gSaveBlock1.recordMixingGift.data;

    for (i = 0; i < sizeof(gSaveBlock1.recordMixingGift.data); i++)
    {
        sum += data[i];
    }

    return sum;
}

static bool32 IsRecordMixingGiftValid(void)
{
    struct RecordMixingGiftData *data = &gSaveBlock1.recordMixingGift.data;

    u32 checksum = CalcRecordMixingGiftChecksum();

    if (!data->unk0)
        return FALSE;

    if (!data->quantity)
        return FALSE;

    if (!data->itemId)
        return FALSE;

    if (checksum == 0)
        return FALSE;

    if (checksum == gSaveBlock1.recordMixingGift.checksum)
        return TRUE;
    else
        return FALSE;
}

static void ClearRecordMixingGift(void)
{
    CpuFill16(0, &gSaveBlock1.recordMixingGift, sizeof(gSaveBlock1.recordMixingGift));
}

static void SetRecordMixingGift(u8 unk, u8 quantity, u16 itemId)
{
    if (!unk || !quantity || !itemId)
    {
        ClearRecordMixingGift();
    }
    else
    {
        gSaveBlock1.recordMixingGift.data.unk0 = unk;
        gSaveBlock1.recordMixingGift.data.quantity = quantity;
        gSaveBlock1.recordMixingGift.data.itemId = itemId;
        gSaveBlock1.recordMixingGift.checksum = CalcRecordMixingGiftChecksum();
    }
}

u16 GetRecordMixingGift(void)
{
    struct RecordMixingGiftData *data = &gSaveBlock1.recordMixingGift.data;

    if (!IsRecordMixingGiftValid())
    {
        ClearRecordMixingGift();
        return 0;
    }
    else
    {
        u16 itemId = data->itemId;
        data->quantity--;
        if (data->quantity == 0)
            ClearRecordMixingGift();
        else
            gSaveBlock1.recordMixingGift.checksum = CalcRecordMixingGiftChecksum();
        return itemId;
    }
}

bool8 MEScrCmd_end(struct ScriptContext *ctx)
{
    StopScript(ctx);
    return TRUE;
}

bool8 MEScrCmd_checkcompat(struct ScriptContext *ctx)
{
    u16 v1;
    u32 v2;
    u16 v3;
    u32 v4;

    ctx->data[1] = ScriptReadWord(ctx);
    v1 = ScriptReadHalfword(ctx);
    v2 = ScriptReadWord(ctx);
    v3 = ScriptReadHalfword(ctx);
    v4 = ScriptReadWord(ctx);

    if (CheckCompatibility(v1, v2, v3, v4) == TRUE)
        ctx->data[3] = 1;
    else
        SetIncompatible();

    return TRUE;
}

bool8 MEScrCmd_nop(struct ScriptContext *ctx)
{
    return FALSE;
}

bool8 MEScrCmd_setstatus(struct ScriptContext *ctx)
{
    u8 value = ScriptReadByte(ctx);
    ctx->data[2] = value;
    return FALSE;
}

bool8 MEScrCmd_setmsg(struct ScriptContext *ctx)
{
    u8 value = ScriptReadByte(ctx);
    u8 *str = (u8 *)(ScriptReadWord(ctx) - ctx->data[1] + ctx->data[0]);
    if (value == 255 || value == ctx->data[2])
        StringExpandPlaceholders(gStringVar4, str);
    return FALSE;
}

bool8 MEScrCmd_runscript(struct ScriptContext *ctx)
{
    u8 *script = (u8 *)(ScriptReadWord(ctx) - ctx->data[1] + ctx->data[0]);
    ScriptContext2_RunNewScript(script);
    return FALSE;
}

bool8 MEScrCmd_setenigmaberry(struct ScriptContext *ctx)
{
    u8 *str;
    const u8 *message;
    bool32 haveBerry = IsEnigmaBerryValid();
    u8 *berry = (u8 *)(ScriptReadWord(ctx) - ctx->data[1] + ctx->data[0]);
    StringCopyN(gStringVar1, gSaveBlock1.enigmaBerry.berry.name, 7);
    SetEnigmaBerry(berry);
    StringCopyN(gStringVar2, gSaveBlock1.enigmaBerry.berry.name, 7);

    if (!haveBerry)
    {
        str = gStringVar4;
        message = gOtherText_BerryObtainedDadHasIt;
    }
    else if (StringCompare(gStringVar1, gStringVar2))
    {
        str = gStringVar4;
        message = gOtherText_BerryTransformed;
    }
    else
    {
        str = gStringVar4;
        message = gOtherText_BerryAlreadyObtained;
    }

    StringExpandPlaceholders(str, message);

    ctx->data[2] = 2;

    if (IsEnigmaBerryValid() == TRUE)
        VarSet(VAR_ENIGMA_BERRY_AVAILABLE, 1);
    else
        ctx->data[2] = 1;

    return FALSE;
}

bool8 MEScrCmd_giveribbon(struct ScriptContext *ctx)
{
    u8 index = ScriptReadByte(ctx);
    u8 ribbonId = ScriptReadByte(ctx);
    GiveGiftRibbonToParty(index, ribbonId);
    StringExpandPlaceholders(gStringVar4, gOtherText_SpecialRibbonReceived);
    ctx->data[2] = 2;
    return FALSE;
}

bool8 MEScrCmd_initramscript(struct ScriptContext *ctx)
{
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 objectId = ScriptReadByte(ctx);
    u8 *script = (u8 *)(ScriptReadWord(ctx) - ctx->data[1] + ctx->data[0]);
    u8 *scriptEnd = (u8 *)(ScriptReadWord(ctx) - ctx->data[1] + ctx->data[0]);
    InitRamScript(script, scriptEnd - script, mapGroup, mapNum, objectId);
    return FALSE;
}

bool8 MEScrCmd_givenationaldex(struct ScriptContext *ctx)
{
    EnableNationalPokedex();
    StringExpandPlaceholders(gStringVar4, gOtherText_DexUpgraded);
    ctx->data[2] = 2;
    return FALSE;
}

bool8 MEScrCmd_addrareword(struct ScriptContext *ctx)
{
    sub_80EB890(ScriptReadByte(ctx));
    StringExpandPlaceholders(gStringVar4, gOtherText_RareWordAdded);
    ctx->data[2] = 2;
    return FALSE;
}

bool8 MEScrCmd_setrecordmixinggift(struct ScriptContext *ctx)
{
    u8 unk = ScriptReadByte(ctx);
    u8 quantity = ScriptReadByte(ctx);
    u16 itemId = ScriptReadHalfword(ctx);
    SetRecordMixingGift(unk, quantity, itemId);
    return FALSE;
}

bool8 MEScrCmd_givepokemon(struct ScriptContext *ctx)
{
    struct MailStruct mail;
    struct Pokemon pokemon;
    u16 species;
    u16 heldItem;
    u32 data = ScriptReadWord(ctx) - ctx->data[1] + ctx->data[0];
    void *pokemonPtr = (void *)data;
    void *mailPtr = (void *)(data + sizeof(struct Pokemon));

    pokemon = *(struct Pokemon *)pokemonPtr;
    species = GetMonData(&pokemon, MON_DATA_SPECIES2);

    if (species == SPECIES_EGG)
        StringCopyN(gStringVar1, gSystemText_Egg, 11);
    else
        StringCopyN(gStringVar1, gSystemText_Pokemon2, 11);

    if (gPlayerPartyCount == 6)
    {
        StringExpandPlaceholders(gStringVar4, gOtherText_PartyIsFull);
        ctx->data[2] = 3;
    }
    else
    {
        memcpy(&gPlayerParty[5], pokemonPtr, sizeof(struct Pokemon));
        memcpy(&mail, mailPtr, sizeof(struct MailStruct));

        if (species != SPECIES_EGG)
        {
            u16 pokedexNum = SpeciesToNationalPokedexNum(species);
            GetSetPokedexFlag(pokedexNum, 2);
            GetSetPokedexFlag(pokedexNum, 3);
        }

        heldItem = GetMonData(&gPlayerParty[5], MON_DATA_HELD_ITEM);
        if (ItemIsMail(heldItem))
            GiveMailToMon2(&gPlayerParty[5], &mail);
        party_compaction();
        CalculatePlayerPartyCount();
        StringExpandPlaceholders(gStringVar4, gOtherText_PokeWasSentOver);
        ctx->data[2] = 2;
    }

    return FALSE;
}

bool8 MEScrCmd_addtrainer(struct ScriptContext *ctx)
{
    u32 data = ScriptReadWord(ctx) - ctx->data[1] + ctx->data[0];
    memcpy(&gSaveBlock2.battleTower.ereaderTrainer, (void *)data, sizeof(gSaveBlock2.battleTower.ereaderTrainer));
    ValidateEReaderTrainer();
    StringExpandPlaceholders(gStringVar4, gOtherText_NewTrainerInHoenn);
    ctx->data[2] = 2;
    return FALSE;
}

bool8 MEScrCmd_enableresetrtc(struct ScriptContext *ctx)
{
    EnableResetRTC();
    StringExpandPlaceholders(gStringVar4, gSystemText_ClockAdjustmentUsable);
    ctx->data[2] = 2;
    return FALSE;
}

bool8 MEScrCmd_checksum(struct ScriptContext *ctx)
{
    int checksum = ScriptReadWord(ctx);
    u8 *data = (u8 *)(ScriptReadWord(ctx) - ctx->data[1] + ctx->data[0]);
    u8 *dataEnd = (u8 *)(ScriptReadWord(ctx) - ctx->data[1] + ctx->data[0]);
    if (checksum != CalcChecksum(data, dataEnd - data))
    {
        ctx->data[3] = 0;
        ctx->data[2] = 1;
    }
    return TRUE;
}

bool8 MEScrCmd_crc(struct ScriptContext *ctx)
{
    int crc = ScriptReadWord(ctx);
    u8 *data = (u8 *)(ScriptReadWord(ctx) - ctx->data[1] + ctx->data[0]);
    u8 *dataEnd = (u8 *)(ScriptReadWord(ctx) - ctx->data[1] + ctx->data[0]);
    if (crc != CalcCRC16(data, dataEnd - data))
    {
        ctx->data[3] = 0;
        ctx->data[2] = 1;
    }
    return TRUE;
}
