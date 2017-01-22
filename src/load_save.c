#include "global.h"
#include "load_save.h"
#include "asm.h"
#include "main.h"
#include "pokemon.h"
#include "rom4.h"

extern u8 gPlayerPartyCount;
extern u32 gUnknown_3004820;

struct LoadedSaveData
{
    struct ItemSlot items[20];
    struct ItemSlot keyItems[20];
    struct ItemSlot pokeBalls[16];
    struct ItemSlot TMsHMs[64];
    struct ItemSlot berries[46];
    struct MailStruct mail[16];
};

extern struct LoadedSaveData gLoadedSaveData[];

void CheckForFlashMemory(void)
{
    if (!IdentifyFlash())
    {
        gUnknown_3004820 = 1;
        InitFlashTimer();
    }
    else
        gUnknown_3004820 = 0;
}

bool32 GetSecretBase2Field_9(void)
{
    return gSaveBlock2.specialSaveWarp;
}

void ClearSecretBase2Field_9(void)
{
    gSaveBlock2.specialSaveWarp = 0;
}

void SetSecretBase2Field_9(void)
{
    gSaveBlock2.specialSaveWarp = 1;
}

void SetSecretBase2Field_9_AndHideBG(void) // note: no other function sets specialSaveWarp to values other than 0 or 1, hence clear and set distinctions.
{
    gpu_sync_bg_hide(0); // the function doesn't use the parameter passed to it, but this is necessary to match.
    gSaveBlock2.specialSaveWarp = 1;
}

void ClearSecretBase2Field_9_2(void) // duplicate function
{
    gSaveBlock2.specialSaveWarp = 0;
}

void SavePlayerParty(void)
{
    int i;

    gSaveBlock1.playerPartyCount = gPlayerPartyCount;

    for (i = 0; i < 6; i++)
        gSaveBlock1.playerParty[i] = gPlayerParty[i];
}

void LoadPlayerParty(void)
{
    int i;

    gPlayerPartyCount = gSaveBlock1.playerPartyCount;

    for (i = 0; i < 6; i++)
        gPlayerParty[i] = gSaveBlock1.playerParty[i];
}

static void SaveMapObjects(void)
{
    int i;

    for (i = 0; i < 16; i++)
        gSaveBlock1.mapObjects[i] = gMapObjects[i];
}

static void LoadMapObjects(void)
{
    int i;

    for (i = 0; i < 16; i++)
        gMapObjects[i] = gSaveBlock1.mapObjects[i];
}

void SaveSerializedGame(void)
{
    SavePlayerParty();
    SaveMapObjects();
}

void LoadSerializedGame(void)
{
    LoadPlayerParty();
    LoadMapObjects();
}

void LoadPlayerBag(void)
{
    int i;

    // load player items.
    for (i = 0; i < 20; i++)
        gLoadedSaveData->items[i] = gSaveBlock1.bagPocket_Items[i];

    // load player key items.
    for (i = 0; i < 20; i++)
        gLoadedSaveData->keyItems[i] = gSaveBlock1.bagPocket_KeyItems[i];

    // load player pokeballs.
    for (i = 0; i < 16; i++)
        gLoadedSaveData->pokeBalls[i] = gSaveBlock1.bagPocket_PokeBalls[i];

    // load player TMs and HMs.
    for (i = 0; i < 64; i++)
        gLoadedSaveData->TMsHMs[i] = gSaveBlock1.bagPocket_TMHM[i];

    // load player berries.
    for (i = 0; i < 46; i++)
        gLoadedSaveData->berries[i] = gSaveBlock1.bagPocket_Berries[i];

    // load mail.
    for (i = 0; i < 16; i++)
        gLoadedSaveData->mail[i] = gSaveBlock1.mail[i];
}

void SavePlayerBag(void)
{
    int i;

    // save player items.
    for (i = 0; i < 20; i++)
        gSaveBlock1.bagPocket_Items[i] = gLoadedSaveData->items[i];

    // save player key items.
    for (i = 0; i < 20; i++)
        gSaveBlock1.bagPocket_KeyItems[i] = gLoadedSaveData->keyItems[i];

    // save player pokeballs.
    for (i = 0; i < 16; i++)
        gSaveBlock1.bagPocket_PokeBalls[i] = gLoadedSaveData->pokeBalls[i];

    // save player TMs and HMs.
    for (i = 0; i < 64; i++)
        gSaveBlock1.bagPocket_TMHM[i] = gLoadedSaveData->TMsHMs[i];

    // save player berries.
    for (i = 0; i < 46; i++)
        gSaveBlock1.bagPocket_Berries[i] = gLoadedSaveData->berries[i];

    // save mail.
    for (i = 0; i < 16; i++)
        gSaveBlock1.mail[i] = gLoadedSaveData->mail[i];
}
