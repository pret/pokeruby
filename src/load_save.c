#include "global.h"
#include "gba/flash_internal.h"
#include "load_save.h"
#include "main.h"
#include "pokemon.h"
#include "overworld.h"

extern u8 gPlayerPartyCount;

bool32 gFlashMemoryPresent;

struct LoadedSaveData
{
    struct ItemSlot items[20];
    struct ItemSlot keyItems[20];
    struct ItemSlot pokeBalls[16];
    struct ItemSlot TMsHMs[64];
    struct ItemSlot berries[46];
    struct MailStruct mail[16];
};

EWRAM_DATA struct SaveBlock2 gSaveBlock2 = {0};
EWRAM_DATA struct SaveBlock1 gSaveBlock1 = {0};

static EWRAM_DATA struct LoadedSaveData gLoadedSaveData = {0};

void CheckForFlashMemory(void)
{
    if (!IdentifyFlash())
    {
        gFlashMemoryPresent = TRUE;
        InitFlashTimer();
    }
    else
        gFlashMemoryPresent = FALSE;
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

    for (i = 0; i < PARTY_SIZE; i++)
        gSaveBlock1.playerParty[i] = gPlayerParty[i];
}

void LoadPlayerParty(void)
{
    int i;

    gPlayerPartyCount = gSaveBlock1.playerPartyCount;

    for (i = 0; i < PARTY_SIZE; i++)
        gPlayerParty[i] = gSaveBlock1.playerParty[i];
}

static void SaveEventObjects(void)
{
    int i;

    for (i = 0; i < EVENT_OBJECTS_COUNT; i++)
        gSaveBlock1.eventObjects[i] = gEventObjects[i];
}

static void LoadEventObjects(void)
{
    int i;

    for (i = 0; i < EVENT_OBJECTS_COUNT; i++)
        gEventObjects[i] = gSaveBlock1.eventObjects[i];
}

void SaveSerializedGame(void)
{
    SavePlayerParty();
    SaveEventObjects();
}

void LoadSerializedGame(void)
{
    LoadPlayerParty();
    LoadEventObjects();
}

void LoadPlayerBag(void)
{
    int i;

    // load player items.
    for (i = 0; i < BAG_ITEMS_COUNT; i++)
        gLoadedSaveData.items[i] = gSaveBlock1.bagPocket_Items[i];

    // load player key items.
    for (i = 0; i < BAG_KEYITEMS_COUNT; i++)
        gLoadedSaveData.keyItems[i] = gSaveBlock1.bagPocket_KeyItems[i];

    // load player pokeballs.
    for (i = 0; i < BAG_POKEBALLS_COUNT; i++)
        gLoadedSaveData.pokeBalls[i] = gSaveBlock1.bagPocket_PokeBalls[i];

    // load player TMs and HMs.
    for (i = 0; i < BAG_TMHM_COUNT; i++)
        gLoadedSaveData.TMsHMs[i] = gSaveBlock1.bagPocket_TMHM[i];

    // load player berries.
    for (i = 0; i < BAG_BERRIES_COUNT; i++)
        gLoadedSaveData.berries[i] = gSaveBlock1.bagPocket_Berries[i];

    // load mail.
    for (i = 0; i < MAIL_COUNT; i++)
        gLoadedSaveData.mail[i] = gSaveBlock1.mail[i];
}

void SavePlayerBag(void)
{
    int i;

    // save player items.
    for (i = 0; i < BAG_ITEMS_COUNT; i++)
        gSaveBlock1.bagPocket_Items[i] = gLoadedSaveData.items[i];

    // save player key items.
    for (i = 0; i < BAG_KEYITEMS_COUNT; i++)
        gSaveBlock1.bagPocket_KeyItems[i] = gLoadedSaveData.keyItems[i];

    // save player pokeballs.
    for (i = 0; i < BAG_POKEBALLS_COUNT; i++)
        gSaveBlock1.bagPocket_PokeBalls[i] = gLoadedSaveData.pokeBalls[i];

    // save player TMs and HMs.
    for (i = 0; i < BAG_TMHM_COUNT; i++)
        gSaveBlock1.bagPocket_TMHM[i] = gLoadedSaveData.TMsHMs[i];

    // save player berries.
    for (i = 0; i < BAG_BERRIES_COUNT; i++)
        gSaveBlock1.bagPocket_Berries[i] = gLoadedSaveData.berries[i];

    // save mail.
    for (i = 0; i < MAIL_COUNT; i++)
        gSaveBlock1.mail[i] = gLoadedSaveData.mail[i];
}
