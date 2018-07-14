#include "global.h"
#include "event_data.h"
#include "field_effect.h"
#include "main.h"
#include "palette.h"
#include "pokemon_menu.h"
#include "overworld.h"
#include "rom6.h"
#include "script.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "constants/map_types.h"
#include "constants/songs.h"

struct MapTypeFadePairs
{
    u8 mapTypeA;
    u8 mapTypeB;
    u8 fadeToType;   // 0 = fade to black,   1 = fade to white
    u8 fadeFromType; // 0 = fade from black, 1 = fade from white
    void (*func)(void);
};

extern u8 gLastFieldPokeMenuOpened;
extern void (*gPostMenuFieldCallback)(void);

extern u8 gUnknown_081B694A[];

static void sub_810CBFC(void);
static void sub_810CC34(void);
static bool8 sub_810CD5C(void);
static void sub_810CE5C(u8);
static void sub_810CE78(u8);
static void sub_810CF18(u8);
static void sub_810CF5C(u8);
static void sub_810CFC4(u8);
static void sub_810D00C(u8);
static void sub_810D028(u8);
static void sub_810D0C4(u8);
static void sub_810D128(u8);
static void CreateEnterUndergroundEffectTask(void);
static void CreateExitUndergroundTask(void);

static const struct MapTypeFadePairs gMapTypeFadePairs[] =
{
    {MAP_TYPE_TOWN,        MAP_TYPE_UNDERGROUND, 1, 0, CreateEnterUndergroundEffectTask},
    {MAP_TYPE_CITY,        MAP_TYPE_UNDERGROUND, 1, 0, CreateEnterUndergroundEffectTask},
    {MAP_TYPE_ROUTE,       MAP_TYPE_UNDERGROUND, 1, 0, CreateEnterUndergroundEffectTask},
    {MAP_TYPE_UNDERWATER,  MAP_TYPE_UNDERGROUND, 1, 0, CreateEnterUndergroundEffectTask},
    {MAP_TYPE_6,           MAP_TYPE_UNDERGROUND, 1, 0, CreateEnterUndergroundEffectTask},
    {MAP_TYPE_7,           MAP_TYPE_UNDERGROUND, 1, 0, CreateEnterUndergroundEffectTask},
    {MAP_TYPE_INDOOR,      MAP_TYPE_UNDERGROUND, 1, 0, CreateEnterUndergroundEffectTask},
    {MAP_TYPE_SECRET_BASE, MAP_TYPE_UNDERGROUND, 1, 0, CreateEnterUndergroundEffectTask},
    {MAP_TYPE_UNDERGROUND, MAP_TYPE_TOWN,        0, 1, CreateExitUndergroundTask},
    {MAP_TYPE_UNDERGROUND, MAP_TYPE_CITY,        0, 1, CreateExitUndergroundTask},
    {MAP_TYPE_UNDERGROUND, MAP_TYPE_ROUTE,       0, 1, CreateExitUndergroundTask},
    {MAP_TYPE_UNDERGROUND, MAP_TYPE_UNDERWATER,  0, 1, CreateExitUndergroundTask},
    {MAP_TYPE_UNDERGROUND, MAP_TYPE_6,           0, 1, CreateExitUndergroundTask},
    {MAP_TYPE_UNDERGROUND, MAP_TYPE_7,           0, 1, CreateExitUndergroundTask},
    {MAP_TYPE_UNDERGROUND, MAP_TYPE_INDOOR,      0, 1, CreateExitUndergroundTask},
    {MAP_TYPE_UNDERGROUND, MAP_TYPE_SECRET_BASE, 0, 1, CreateExitUndergroundTask},
    {0, 0, 0, 0, NULL},
};

// TODO: Make these extracted palettes?
static const u16 gCaveTransitionPalette_White[] = {0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF};
static const u16 gCaveTransitionPalette_Black[] = {0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000};

static const u16 gUnknown_083F808C[] = INCBIN_U16("graphics/misc/83F808C.gbapal");
static const u16 gUnknown_083F809C[] = INCBIN_U16("graphics/misc/83F809C.gbapal");
static const u16 gCaveTransitionTilemap[] = INCBIN_U16("graphics/misc/cave_transition_map.bin.lz");
static const u8 gCaveTransitionTiles[] = INCBIN_U8("graphics/misc/cave_transition.4bpp.lz");

#if DEBUG

void debug_sub_8122080(void)
{
    if (gMapHeader.cave == 1 && !FlagGet(FLAG_SYS_USE_FLASH))
        sub_810CBFC();
    else
        ScriptContext2_Disable();
}

#endif

bool8 SetUpFieldMove_Flash(void)
{
    if (gMapHeader.cave == TRUE && !FlagGet(FLAG_SYS_USE_FLASH))
    {
        gFieldCallback = FieldCallback_PrepareFadeInFromMenu;
        gPostMenuFieldCallback = sub_810CBFC;
        return TRUE;
    }

    return FALSE;
}

static void sub_810CBFC(void)
{
    u8 taskId = oei_task_add();
    gFieldEffectArguments[0] = gLastFieldPokeMenuOpened;
    gTasks[taskId].data[8] = (uintptr_t)sub_810CC34 >> 16;
    gTasks[taskId].data[9] = (uintptr_t)sub_810CC34;
}

static void sub_810CC34(void)
{
    PlaySE(SE_W115);
    FlagSet(FLAG_SYS_USE_FLASH);
    ScriptContext1_SetupScript(gUnknown_081B694A);
}

void sub_810CC54(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void VBlankCB(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_810CC80(void)
{
    u16 ime;

    SetVBlankCallback(NULL);
    REG_DISPCNT = 0;
    REG_BG2CNT = 0;
    REG_BG1CNT = 0;
    REG_BG0CNT = 0;
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    DmaFill16(3, 0, (void *)VRAM, VRAM_SIZE);
    DmaFill32(3, 0, (void *)OAM, OAM_SIZE);
    DmaFill16(3, 0, (void *)(PLTT + 2), PLTT_SIZE - 2);
    ResetPaletteFade();
    ResetTasks();
    ResetSpriteData();
    ime = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_IME = ime;
    SetVBlankCallback(VBlankCB);
    SetMainCallback2(sub_810CC54);
    if (!sub_810CD5C())
        SetMainCallback2(gMain.savedCallback);
}

static bool8 sub_810CD5C(void)
{
    u8 i;
    u8 prevMapType = GetLastUsedWarpMapType();
    u8 curMapType = Overworld_GetMapTypeOfSaveblockLocation();

    for (i = 0; gMapTypeFadePairs[i].mapTypeA; i++)
    {
        if (gMapTypeFadePairs[i].mapTypeA == prevMapType && gMapTypeFadePairs[i].mapTypeB == curMapType)
        {
            gMapTypeFadePairs[i].func();
            return TRUE;
        }
    }

    return FALSE;
}

u8 GetMapPairFadeToType(u8 currentMapType, u8 destinationMapType)
{
    u8 i;
    u8 curMapType = currentMapType;
    u8 destMapType = destinationMapType;

    for (i = 0; gMapTypeFadePairs[i].mapTypeA; i++)
    {
        if (gMapTypeFadePairs[i].mapTypeA == curMapType && gMapTypeFadePairs[i].mapTypeB == destMapType)
            return gMapTypeFadePairs[i].fadeToType;
    }

    return FALSE;
}

u8 GetMapPairFadeFromType(u8 currentMapType, u8 destinationMapType)
{
    u8 i;
    u8 curMapType = currentMapType;
    u8 destMapType = destinationMapType;

    for (i = 0; gMapTypeFadePairs[i].mapTypeA; i++)
    {
        if (gMapTypeFadePairs[i].mapTypeA == curMapType && gMapTypeFadePairs[i].mapTypeB == destMapType)
        {
            return gMapTypeFadePairs[i].fadeFromType;
        }
    }

    return FALSE;
}

static void CreateExitUndergroundTask(void)
{
    CreateTask(sub_810CE5C, 0);
}

static void sub_810CE5C(u8 taskId)
{
    gTasks[taskId].func = sub_810CE78;
}

static void sub_810CE78(u8 taskId)
{
    REG_DISPCNT = 0;
    LZ77UnCompVram(gCaveTransitionTiles, (void *)0x600C000);
    LZ77UnCompVram(gCaveTransitionTilemap, (void *)0x600F800);
    LoadPalette(gCaveTransitionPalette_White, 0xE0, 0x20);
    LoadPalette(gUnknown_083F809C, 0xE0, 0x10);
    REG_BLDCNT = 15937;
    REG_BLDALPHA = 0;
    REG_BLDY = 0;
    REG_BG0CNT = 7948;
    REG_DISPCNT = 4416;
    gTasks[taskId].func = sub_810CF18;
    gTasks[taskId].data[0] = 16;
    gTasks[taskId].data[1] = 0;
}

static void sub_810CF18(u8 taskId)
{
    u16 count = gTasks[taskId].data[1];
    u16 blend = count + 0x1000;
    REG_BLDALPHA = blend;
    if (count <= 0x10)
    {
        gTasks[taskId].data[1]++;
    }
    else
    {
        gTasks[taskId].data[2] = 0;
        gTasks[taskId].func = sub_810CF5C;
    }
}

static void sub_810CF5C(u8 taskId)
{
    u16 count;

    REG_BLDALPHA = 4112;

    count = gTasks[taskId].data[2];

    if (count < 8)
    {
        gTasks[taskId].data[2]++;
        LoadPalette(&gUnknown_083F809C[count], 0xE0, 16 - 2 * count);
    }
    else
    {
        LoadPalette(gCaveTransitionPalette_White, 0, 0x20);
        gTasks[taskId].func = sub_810CFC4;
        gTasks[taskId].data[2] = 8;
    }
}

static void sub_810CFC4(u8 taskId)
{
    if (gTasks[taskId].data[2])
        gTasks[taskId].data[2]--;
    else
        SetMainCallback2(gMain.savedCallback);
}

static void CreateEnterUndergroundEffectTask(void)
{
    CreateTask(sub_810D00C, 0);
}

static void sub_810D00C(u8 taskId)
{
    gTasks[taskId].func = sub_810D028;
}

static void sub_810D028(u8 taskId)
{
    REG_DISPCNT = 0;
    LZ77UnCompVram(gCaveTransitionTiles, (void *)0x600C000);
    LZ77UnCompVram(gCaveTransitionTilemap, (void *)0x600F800);
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    REG_BLDY = 0;
    REG_BG0CNT = 7948;
    REG_DISPCNT = 4416;
    LoadPalette(gCaveTransitionPalette_White, 0xE0, 0x20);
    LoadPalette(gCaveTransitionPalette_Black, 0, 0x20);
    gTasks[taskId].func = sub_810D0C4;
    gTasks[taskId].data[0] = 16;
    gTasks[taskId].data[1] = 0;
    gTasks[taskId].data[2] = 0;
}

static void sub_810D0C4(u8 taskId)
{
    u16 count = gTasks[taskId].data[2];
    if (count < 16)
    {
        gTasks[taskId].data[2]++;
        gTasks[taskId].data[2]++;
        LoadPalette(&gUnknown_083F808C[15 - count], 0xE0, 2 * (count + 1));
    }
    else
    {
        REG_BLDALPHA = 4112;
        REG_BLDCNT = 15937;
        gTasks[taskId].func = sub_810D128;
    }
}

static void sub_810D128(u8 taskId)
{
    u16 count = 16 - gTasks[taskId].data[1];
    u16 blend = count + 0x1000;
    REG_BLDALPHA = blend;
    if (count)
    {
        gTasks[taskId].data[1]++;
    }
    else
    {
        LoadPalette(gCaveTransitionPalette_Black, 0, 0x20);
        SetMainCallback2(gMain.savedCallback);
    }
}
