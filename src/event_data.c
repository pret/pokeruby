#include "global.h"
#include "event_data.h"
#include "pokedex.h"

#define TEMP_FLAGS_SIZE 0x4
#define TEMP_UPPER_FLAGS_SIZE 0x8
#define TEMP_VARS_SIZE 0x20

EWRAM_DATA u16 gSpecialVar_0x8000 = 0;
EWRAM_DATA u16 gSpecialVar_0x8001 = 0;
EWRAM_DATA u16 gSpecialVar_0x8002 = 0;
EWRAM_DATA u16 gSpecialVar_0x8003 = 0;
EWRAM_DATA u16 gSpecialVar_0x8004 = 0;
EWRAM_DATA u16 gSpecialVar_0x8005 = 0;
EWRAM_DATA u16 gSpecialVar_0x8006 = 0;
EWRAM_DATA u16 gSpecialVar_0x8007 = 0;
EWRAM_DATA u16 gSpecialVar_0x8008 = 0;
EWRAM_DATA u16 gSpecialVar_0x8009 = 0;
EWRAM_DATA u16 gSpecialVar_0x800A = 0;
EWRAM_DATA u16 gSpecialVar_0x800B = 0;
EWRAM_DATA u16 gScriptResult = 0;
EWRAM_DATA u16 gScriptLastTalked = 0;
EWRAM_DATA u16 gScriptFacing = 0;
EWRAM_DATA u8 gUnknown_0202E8E2[16] = {0};

extern u16 *gSpecialVars[];

void InitEventData(void)
{
    memset(gSaveBlock1.flags, 0, sizeof(gSaveBlock1.flags));
    memset(gSaveBlock1.vars, 0, sizeof(gSaveBlock1.vars));
    memset(gUnknown_0202E8E2, 0, sizeof(gUnknown_0202E8E2));
}

void ClearTempFieldEventData(void)
{
    memset(gSaveBlock1.flags, 0, TEMP_FLAGS_SIZE);
    memset(gSaveBlock1.vars, 0, TEMP_VARS_SIZE);
    FlagReset(SYS_ENC_UP_ITEM);
    FlagReset(SYS_ENC_DOWN_ITEM);
    FlagReset(SYS_USE_STRENGTH);
    FlagReset(SYS_CTRL_OBJ_DELETE);
}

// probably had different flag splits at one point.
void ClearUpperFlags(void)
{
    memset(gSaveBlock1.flags + 0x118, 0, TEMP_UPPER_FLAGS_SIZE);
}

void DisableNationalPokedex(void)
{
    u16 *nationalDexVar = GetVarPointer(VAR_NATIONAL_DEX);
    gSaveBlock2.pokedex.nationalMagic = 0;
    *nationalDexVar = 0;
    FlagReset(SYS_NATIONAL_DEX);
}

void EnableNationalPokedex(void)
{
    u16 *nationalDexVar = GetVarPointer(VAR_NATIONAL_DEX);
    gSaveBlock2.pokedex.nationalMagic = 0xDA;
    *nationalDexVar = 0x302;
    FlagSet(SYS_NATIONAL_DEX);
    gSaveBlock2.pokedex.unknown1 = 1;
    gSaveBlock2.pokedex.order = 0;
    sub_808C0A0();
}

bool32 IsNationalPokedexEnabled(void)
{
    if (gSaveBlock2.pokedex.nationalMagic == 0xDA && VarGet(VAR_NATIONAL_DEX) == 0x302 && FlagGet(SYS_NATIONAL_DEX))
        return TRUE;
    else
        return FALSE;
}

void DisableMysteryGift(void)
{
    FlagReset(SYS_EXDATA_ENABLE);
}

void EnableMysteryGift(void)
{
    FlagSet(SYS_EXDATA_ENABLE);
}

bool32 IsMysteryGiftEnabled(void)
{
    return FlagGet(SYS_EXDATA_ENABLE);
}

void DisableResetRTC(void)
{
    VarSet(VAR_RESET_RTC_ENABLE, 0);
    FlagReset(SYS_RESET_RTC_ENABLE);
}

void EnableResetRTC(void)
{
    VarSet(VAR_RESET_RTC_ENABLE, 0x920);
    FlagSet(SYS_RESET_RTC_ENABLE);
}

bool32 CanResetRTC(void)
{
    if (FlagGet(SYS_RESET_RTC_ENABLE) && VarGet(VAR_RESET_RTC_ENABLE) == 0x920)
        return TRUE;
    else
        return FALSE;
}

u16 *GetVarPointer(u16 id)
{
    if (id < 0x4000)
        return NULL;

    if ((s16)id >= 0)
        return &gSaveBlock1.vars[id - 0x4000];

    return gSpecialVars[id - 0x8000];
}

u16 VarGet(u16 id)
{
    u16 *ptr = GetVarPointer(id);
    if (!ptr)
        return id;
    return *ptr;
}

bool8 VarSet(u16 id, u16 value)
{
    u16 *ptr = GetVarPointer(id);
    if (!ptr)
        return FALSE;
    *ptr = value;
    return TRUE;
}

u8 VarGetFieldObjectGraphicsId(u8 id)
{
    return VarGet(0x4010 + id);
}

u8 *GetFlagPointer(u16 id)
{
    if (id == 0)
        return 0;

    if (id < 0x4000)
        return &gSaveBlock1.flags[id / 8];

    return &gUnknown_0202E8E2[(id - 0x4000) / 8];
}

u8 FlagSet(u16 id)
{
    u8 *ptr = GetFlagPointer(id);
    if (ptr)
        *ptr |= 1 << (id & 7);
    return 0;
}

u8 FlagReset(u16 id)
{
    u8 *ptr = GetFlagPointer(id);
    if (ptr)
        *ptr &= ~(1 << (id & 7));
    return 0;
}

bool8 FlagGet(u16 id)
{
    u8 *ptr = GetFlagPointer(id);

    if (!ptr)
        return FALSE;

    if (!(((*ptr) >> (id & 7)) & 1))
        return FALSE;

    return TRUE;
}
