#include "global.h"
#include "flag.h"
#include "main.h"
#include "script.h"
#include "string_util.h"

struct UnkSafariZoneStruct
{
    /*0x00*/ s16 x;
    /*0x02*/ s16 y;
    /*0x04*/ s8 mapNum;
    /*0x05*/ u8 counter;
    /*0x06*/ u8 field_4;
    /*0x07*/ u8 field_5;
    /*0x08*/ struct Pokeblock pokeblock;
};


void ClearEveryUnkSafariZoneStruct(void);
void sub_80C8508(void);
extern void c2_exit_to_overworld_2_switch(void);
extern void c2_exit_to_overworld_1_continue_scripts_restart_music(void);
extern void sub_8080E44(void);
extern void CB2_LoadMap(void);
extern void sav12_xor_increment(u8);
extern void warp_in(void);
extern void GetXYCoordsOneStepInFrontOfPlayer(void *, void *);
extern void PlayerGetDestCoords(u16 *, u16 *);

extern u8 gUnknown_02024D26;
extern u8 gUnknown_02038808;
extern u16 gUnknown_0203880A;

extern struct UnkSafariZoneStruct gUnkSafariZoneStructArr[10];

extern void (*gUnknown_0300485C)(void);

extern u8 gUnknown_081C340A;
extern u8 gUnknown_081C342D;
extern u8 gUnknown_081C3448;
extern u8 gUnknown_081C3459;
extern u8 *gUnknown_083F7EB8[];

extern u16 gScriptResult;

bool32 GetSafariZoneFlag(void)
{
    bool8 ret = FlagGet(SYS_SAFARI_MODE);

    return ret;
}

void SetSafariZoneFlag(void)
{
    FlagSet(SYS_SAFARI_MODE);
}

void ResetSafariZoneFlag(void)
{
    FlagReset(SYS_SAFARI_MODE);
}

void sub_80C81B8(void)
{
    sav12_xor_increment(0x11);
    SetSafariZoneFlag();
    ClearEveryUnkSafariZoneStruct();

    gUnknown_02038808 = 0x1E;
    gUnknown_0203880A = 0x1F4;
}

void sub_80C81E4(void)
{
    ResetSafariZoneFlag();
    ClearEveryUnkSafariZoneStruct();

    gUnknown_02038808 = 0;
    gUnknown_0203880A = 0;
}

bool8 safari_step(void)
{
    if (GetSafariZoneFlag() == FALSE)
    {
        return FALSE;
    }

    sub_80C8508();

    if (!(--gUnknown_0203880A))
    {
        ScriptContext1_SetupScript(&gUnknown_081C3448);
        return TRUE;
    }

    return FALSE;
}

void sub_80C823C(void)
{
    ScriptContext1_SetupScript(&gUnknown_081C342D);
}

void sub_80C824C(void)
{
    if (gUnknown_02038808 != 0)
    {
        SetMainCallback2(c2_exit_to_overworld_2_switch);
    }
    else if (gUnknown_02024D26 == 8)
    {
        ScriptContext2_RunNewScript(&gUnknown_081C340A);
        warp_in();
        gUnknown_0300485C = sub_8080E44;
        SetMainCallback2(CB2_LoadMap);
    }
    else if (gUnknown_02024D26 == 7)
    {
        ScriptContext1_SetupScript(&gUnknown_081C3459);
        ScriptContext1_Stop();
        SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
    }
}

void ClearSingleUnkSafariZoneStruct(u8 index)
{
    memset(&gUnkSafariZoneStructArr[index], 0,
        sizeof(struct UnkSafariZoneStruct));
}

void ClearEveryUnkSafariZoneStruct(void)
{
    // 10 is the number of struct UnkSafariZoneStruct's in
    // gUnkSafariZoneStructArr. It might be a good idea to create a #define
    // for it.
    memset(gUnkSafariZoneStructArr, 0, sizeof(struct UnkSafariZoneStruct)
        * 10);
}

void sub_80C82EC(void)
{
    s16 x, y;
    u16 i;

    GetXYCoordsOneStepInFrontOfPlayer(&x, &y);

    // 10 is the number of struct UnkSafariZoneStruct's in
    // gUnkSafariZoneStructArr. It might be a good idea to create a #define
    // for it.
    for (i = 0; i < 10; i++)
    {
        if (gSaveBlock1.location.mapNum == gUnkSafariZoneStructArr[i].mapNum
            && gUnkSafariZoneStructArr[i].x == x
            && gUnkSafariZoneStructArr[i].y == y)
        {
            gScriptResult = i;

            StringCopy(gStringVar1, gUnknown_083F7EB8
                [gUnkSafariZoneStructArr[i].pokeblock.color]);

            return;
        }
    }

    gScriptResult = -1;
}

void sub_80C837C(void)
{
    s16 x, y;
    u16 i;

    PlayerGetDestCoords(&x, &y);

    // 10 is the number of struct UnkSafariZoneStruct's in
    // gUnkSafariZoneStructArr. It might be a good idea to create a #define
    // for it.
    for (i = 0; i < 10; i++)
    {
        if (gSaveBlock1.location.mapNum
            == gUnkSafariZoneStructArr[i].mapNum)
        {
            x -= gUnkSafariZoneStructArr[i].x;
            y -= gUnkSafariZoneStructArr[i].y;

            if (x < 0)
            {
                x *= -1;
            }
            if (y < 0)
            {
                y *= -1;
            }

            if ((x + y) <= 5)
            {
                gScriptResult = i;
                return;
            }
        }
    }

    gScriptResult = -1;
}

struct Pokeblock *unref_sub_80C8418(void)
{
    sub_80C82EC();

    if (gScriptResult == 0xFFFF)
    {
        return NULL;
    }

    return &gUnkSafariZoneStructArr[gScriptResult].pokeblock;
}


struct Pokeblock *sub_80C8448(void)
{
    sub_80C837C();

    if (gScriptResult == 0xFFFF)
    {
        return NULL;
    }

    return &gUnkSafariZoneStructArr[gScriptResult].pokeblock;
}


void sub_80C8478(u8 pokeblock_index)
{
    s16 x, y;
    u8 i;

    // 10 is the number of struct UnkSafariZoneStruct's in
    // gUnkSafariZoneStructArr. It might be a good idea to create a #define
    // for it.
    for (i = 0; i < 10; i++)
    {
        if (gUnkSafariZoneStructArr[i].mapNum == 0
            && gUnkSafariZoneStructArr[i].x == 0
            && gUnkSafariZoneStructArr[i].y == 0)
        {
            GetXYCoordsOneStepInFrontOfPlayer(&x, &y);

            gUnkSafariZoneStructArr[i].mapNum
                = gSaveBlock1.location.mapNum;

            gUnkSafariZoneStructArr[i].pokeblock
                = gSaveBlock1.pokeblocks[pokeblock_index];

            gUnkSafariZoneStructArr[i].counter = 0x64;
            gUnkSafariZoneStructArr[i].x = x;
            gUnkSafariZoneStructArr[i].y = y;
            break;
        }
    }
}

void sub_80C8508(void)
{
    u8 i;

    // 10 is the number of struct UnkSafariZoneStruct's in
    // gUnkSafariZoneStructArr. It might be a good idea to create a #define
    // for it.
    for (i = 0; i < 10; i++)
    {
        if (gUnkSafariZoneStructArr[i].counter != 0)
        {
            gUnkSafariZoneStructArr[i].counter--;

            if (gUnkSafariZoneStructArr[i].counter == 0)
            {
                ClearSingleUnkSafariZoneStruct(i);
            }
        }
    }
}

bool8 unref_sub_80C853C(void)
{
    sub_80C82EC();

    if (gScriptResult == 0xFFFF)
    {
        return FALSE;
    }

    ConvertIntToDecimalStringN(gStringVar2,
        gUnkSafariZoneStructArr[gScriptResult].counter,
        STR_CONV_MODE_LEADING_ZEROS, 3);

    return TRUE;
}
