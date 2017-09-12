#include "global.h"
#include "event_data.h"
#include "field_effect.h"
#include "main.h"
#include "palette.h"
#include "pokemon_menu.h"
#include "rom4.h"
#include "rom6.h"
#include "script.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"

struct FlashStruct
{
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    void (*func)(void);
};

extern struct FlashStruct gUnknown_083F7FC4[];
extern u16 gCaveTransitionPalette_White[];
extern u16 gCaveTransitionPalette_Black[];
extern u16 gUnknown_083F808C[];
extern u16 gUnknown_083F809C[];
extern u16 gCaveTransitionTilemap[];
extern u8 gCaveTransitionTiles[];

extern u8 gLastFieldPokeMenuOpened;
extern void (*gUnknown_03005CE4)(void);

extern u8 gUnknown_081B694A[];

void sub_810CBFC(void);
void sub_810CC34(void);
bool8 sub_810CD5C(void);
void sub_810CE5C(u8);
void sub_810CE78(u8);
void sub_810CF18(u8);
void sub_810CF5C(u8);
void sub_810CFC4(u8);
void sub_810D00C(u8);
void sub_810D028(u8);
void sub_810D0C4(u8);
void sub_810D128(u8);

bool8 SetUpFieldMove_Flash(void)
{
    if (gMapHeader.cave == TRUE && !FlagGet(SYS_USE_FLASH))
    {
        gFieldCallback = FieldCallback_Teleport;
        gUnknown_03005CE4 = sub_810CBFC;
        return TRUE;
    }

    return FALSE;
}

void sub_810CBFC(void)
{
    u8 taskId = oei_task_add();
    gFieldEffectArguments[0] = gLastFieldPokeMenuOpened;
    gTasks[taskId].data[8] = (uintptr_t)sub_810CC34 >> 16;
    gTasks[taskId].data[9] = (uintptr_t)sub_810CC34;
}

void sub_810CC34(void)
{
    PlaySE(SE_W115);
    FlagSet(SYS_USE_FLASH);
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

bool8 sub_810CD5C(void)
{
    u8 i;
    u8 v0 = get_map_type_from_warp0();
    u8 v1 = Overworld_GetMapTypeOfSaveblockLocation();

    for (i = 0; gUnknown_083F7FC4[i].unk0; i++)
    {
        if (gUnknown_083F7FC4[i].unk0 == v0 && gUnknown_083F7FC4[i].unk1 == v1)
        {
            gUnknown_083F7FC4[i].func();
            return TRUE;
        }
    }

    return FALSE;
}

u8 sub_810CDB8(u8 a1, u8 a2)
{
    u8 i;
    u8 v0 = a1;
    u8 v1 = a2;

    for (i = 0; gUnknown_083F7FC4[i].unk0; i++)
    {
        if (gUnknown_083F7FC4[i].unk0 == v0 && gUnknown_083F7FC4[i].unk1 == v1)
        {
            return gUnknown_083F7FC4[i].unk2;
        }
    }

    return FALSE;
}

u8 fade_type_for_given_maplight_pair(u8 a1, u8 a2)
{
    u8 i;
    u8 v0 = a1;
    u8 v1 = a2;

    for (i = 0; gUnknown_083F7FC4[i].unk0; i++)
    {
        if (gUnknown_083F7FC4[i].unk0 == v0 && gUnknown_083F7FC4[i].unk1 == v1)
        {
            return gUnknown_083F7FC4[i].unk3;
        }
    }

    return FALSE;
}

void sub_810CE48(void)
{
    CreateTask(sub_810CE5C, 0);
}

void sub_810CE5C(u8 taskId)
{
    gTasks[taskId].func = sub_810CE78;
}

void sub_810CE78(u8 taskId)
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

void sub_810CF18(u8 taskId)
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

void sub_810CF5C(u8 taskId)
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

void sub_810CFC4(u8 taskId)
{
    if (gTasks[taskId].data[2])
        gTasks[taskId].data[2]--;
    else
        SetMainCallback2(gMain.savedCallback);
}

void sub_810CFF8(void)
{
    CreateTask(sub_810D00C, 0);
}

void sub_810D00C(u8 taskId)
{
    gTasks[taskId].func = sub_810D028;
}

void sub_810D028(u8 taskId)
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

void sub_810D0C4(u8 taskId)
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

void sub_810D128(u8 taskId)
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
