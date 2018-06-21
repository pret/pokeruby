
// Includes
#include "global.h"
#include "ewram.h"
#include "overworld.h"
#include "palette.h"
#include "random.h"
#include "main.h"
#include "menu.h"
#include "script.h"
#include "task.h"
#include "sound.h"
#include "graphics.h"
#include "constants/songs.h"
#include "decompress.h"
#include "field_weather.h"
#include "event_object_movement.h"
#include "scanline_effect.h"
#include "event_data.h"
#include "cable_car_util.h"
#include "constants/event_objects.h"
#include "constants/weather.h"

extern u8 (*gMenuCallback)(void);

// Static type declarations

struct CableCarEwramStruct1
{
    u8 unk_0000;
    u8 unk_0001;
    u8 unk_0002;
    u8 unk_0003;
    u16 unk_0004;
    u16 unk_0006;
    u8 unk_0008;
    u8 unk_0009;
    u8 filler_000a[2];
    u8 unk_000c;
    u8 unk_000d;
    u8 filler_0000e[6];
    u8 unk_0014;
    u8 unk_0015;
    u8 unk_0016;
    u8 unk_0017;
    u8 unk_0018;
    u8 unk_0019;
    u8 unk_001a;
    u8 unk_001b;
    u8 unk_001c;
    u8 unk_001d;
    u8 unk_001e;
    u8 unk_001f;
    u8 unk_0020;
    u16 unk_0022[9][12];
    u8 filler_00fa[2];
    u16 unk_00fc[0x20][0x20];
    u16 unk_08fc[0x20][0x20];
}; // size 0x10FC

struct CableCarEwramStruct2
{
    /* 0x000 */ u16 mtChimneyTilemap[0xb4];
    /* 0x168 */ u16 treeTilemap[0x1e0];
    /* 0x528 */ u16 mountainTilemap[0x258];
    /* 0x9d8 */ u16 pylonStemTilemap[0x628]; // size not actually known
};

// Static RAM declarations

EWRAM_DATA struct CableCarEwramStruct1 *sCableCarPtr = NULL;
EWRAM_DATA u8 gUnknown_02039278 = 0;
EWRAM_DATA u8 gUnknown_02039279 = 0;
EWRAM_DATA u8 gUnknown_0203927A = 0;
EWRAM_DATA u8 gUnknown_0203927B = 0;
EWRAM_DATA u8 gUnknown_0203927C = 0;
EWRAM_DATA u8 gUnknown_0203927D = 0;
EWRAM_DATA u32 filler_02039280 = 0;

// Static ROM declarations

static void CableCarMainCallback_Setup(void);
static void CableCarMainCallback_Run(void);
static void sub_8123878(u8 taskId);
static void sub_81239E4(u8 taskId);
static void sub_8123AF8(u8 taskId);
static void CableCarVblankCallback(void);
static void nullsub_76(struct Sprite *sprite);
static void sub_8123CB8(struct Sprite *sprite);
static void sub_8123EB8(struct Sprite *sprite);
static void sub_8123F44(struct Sprite *sprite);
static void sub_8123FBC(u8);
static void LoadSprites(void);
static void sub_812453C(void);
static void sub_8124598(void);
static void sub_81245F4(void);
static void sub_812476C(void);
static void sub_81248AC(u8);

// .rodata

#if DEBUG

void debug_sub_8138D74(void);
void debug_sub_8138D8C(void);
u8 debug_sub_8138C14(void);
u8 debug_sub_8138C34(void);
u8 debug_sub_810CD9C(void);

const u8 Str_842DBD0[] = _("CABLE CAR U");
const u8 Str_842DBDC[] = _("CABLE CAR D");
const u8 Str_842DBE8[] = _("ROULETTE1");
const u8 Str_842DBF2[] = _("ROULETTE3");
const u8 Str_842DBFC[] = _("View a MAIL");

const struct MenuAction gUnkDebug4Menu[] =
{
    {Str_842DBD0, (u8 (*)(void))debug_sub_8138D74},  // why do these two functions have a different prototype?
    {Str_842DBDC, (u8 (*)(void))debug_sub_8138D8C},
    {Str_842DBE8, debug_sub_8138C14},
    {Str_842DBF2, debug_sub_8138C34},
    {Str_842DBFC, debug_sub_810CD9C},
};

#endif

static const u8 gCableCarMtChimneyTilemap[] = INCBIN_U8("graphics/misc/cable_car_mt_chimney_map.bin.lz");

static const u8 gCableCarTreeTilemap[] = INCBIN_U8("graphics/misc/cable_car_tree_map.bin.lz");

static const u8 gCableCarMountainTilemap[] = INCBIN_U8("graphics/misc/cable_car_mountain_map.bin.lz");

static const u16 gCableCarPylonHookTilemapEntries[] = {
    0x3000,
    0x3001,
    0x3002,
    0x3003,
    0x3004,
    0x3005,
    0x3006,
    0x3007,
    0x3008,
    0x3009
};

static const u8 gCableCarPylonStemTilemap[] = INCBIN_U8("graphics/misc/cable_car_pylon_stem_map.bin.lz");

static const struct CompressedSpriteSheet gUnknown_08401CF8[] = {
    { gCableCar_Gfx,     0x800, 1 },
    { gCableCarDoor_Gfx,  0x40, 2 },
    { gCableCarCord_Gfx,  0x80, 3 },
    {                             }
};
static const struct SpritePalette gUnknown_08401D18[] = {
    { gCableCar_Pal, 1 },
    {                  }
};

static const struct OamData gOamData_8401D28 = {
    .affineMode = ST_OAM_AFFINE_DOUBLE,
    .size = 3,
    .priority = 2
};

static const struct OamData gOamData_8401D30 = {
    .affineMode = ST_OAM_AFFINE_DOUBLE,
    .shape = ST_OAM_H_RECTANGLE,
    .priority = 2
};

static const struct OamData gOamData_8401D38 = {
    .affineMode = ST_OAM_AFFINE_DOUBLE,
    .size = 1,
    .priority = 2
};

static const struct SpriteTemplate gSpriteTemplate_8401D40[] =
{
    {
        .tileTag = 1,
        .paletteTag = 1,
        .oam = &gOamData_8401D28,
        .anims = gDummySpriteAnimTable,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = sub_8123CB8,
    },
    {
        .tileTag = 2,
        .paletteTag = 1,
        .oam = &gOamData_8401D30,
        .anims = gDummySpriteAnimTable,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = sub_8123CB8,
    },
    {
        .tileTag = 3,
        .paletteTag = 1,
        .oam = &gOamData_8401D38,
        .anims = gDummySpriteAnimTable,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = nullsub_76,
    }
};

#if DEBUG

extern u8 unk_203955C;

extern const u8 MauvilleCity_GameCorner_EventScript_1C407E[];
extern const u8 MauvilleCity_GameCorner_EventScript_1C40AC[];

u8 debug_sub_8138C14(void)
{
    unk_203955C = 1;
    ScriptContext1_SetupScript(MauvilleCity_GameCorner_EventScript_1C407E);
    CloseMenu();
    return 1;
}

u8 debug_sub_8138C34(void)
{
    unk_203955C = 1;
    ScriptContext1_SetupScript(MauvilleCity_GameCorner_EventScript_1C40AC);
    CloseMenu();
    return 1;
}

u8 debug_sub_8138C54(void)
{
    if (gMain.newKeys == DPAD_UP)
        Menu_MoveCursor(-1);
    if (gMain.newKeys == DPAD_DOWN)
        Menu_MoveCursor(1);
    if (gMain.newKeys == A_BUTTON)
        return gUnkDebug4Menu[Menu_GetCursorPos()].func();
    if (gMain.newKeys == (R_BUTTON | A_BUTTON))
    {
        gSpecialVar_0x8004 = 1;
        return gUnkDebug4Menu[Menu_GetCursorPos()].func();
    }
    if (gMain.newKeys == B_BUTTON)
    {
        CloseMenu();
        return 1;
    }
    return 0;
}

u8 debug_sub_8138CC4(void)
{
    gSpecialVar_0x8004 = 0;
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(19, 0, 29, 12);
    Menu_PrintItems(20, 1, 5, gUnkDebug4Menu);
    InitMenu(0, 20, 1, 5, 0, 8);
    gMenuCallback = debug_sub_8138C54;
    return 0;
}

#endif

static void CableCarTask1(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(CableCarMainCallback_Setup);
        DestroyTask(taskId);
    }
}

void CableCar(void)
{
    ScriptContext2_Enable();
    CreateTask(CableCarTask1, 1);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
}

#if DEBUG

void debug_sub_8138D74(void)
{
    gSpecialVar_0x8004 = 0;
    CloseMenu();
    CableCar();
}

void debug_sub_8138D8C(void)
{
    gSpecialVar_0x8004 = 1;
    CloseMenu();
    CableCar();
}

#endif

static void CableCarMainCallback_Setup(void)
{
    u8 i;
    u16 imebak;

    switch (gMain.state)
    {
        case 0:
        default:
            SetVBlankCallback(NULL);
            ScanlineEffect_Stop();
            DmaFill16Large(3, 0, VRAM, VRAM_SIZE, 0x1000);
            DmaFill32Defvars(3, 0, OAM, OAM_SIZE);
            DmaFill16Defvars(3, 0, PLTT, PLTT_SIZE);
            sCableCarPtr = eCableCar1;
            DmaFill16Large(3, 0, eCableCar1, 0x10FC, 0x1000);
            gMain.state++;
            break;
        case 1:
            ResetSpriteData();
            ResetTasks();
            FreeAllSpritePalettes();
            ResetPaletteFade();
            StartWeather();
            for (i = 0; i < 20; i++)
            {
                gWeatherPtr->sprites.s2.ashSprites[i] = NULL;
            }
            InitMapMusic();
            ResetMapMusic();
            gSpriteCoordOffsetX = gSpriteCoordOffsetY = 0;
            gMain.state++;
            break;
        case 2:
            for (i = 0; i < 3; i++)
            {
                LoadCompressedObjectPic(&gUnknown_08401CF8[i]);
            }
            LoadSpritePalettes(gUnknown_08401D18);
            LZDecompressWram(gCableCarMtChimneyTilemap, eCableCar2->mtChimneyTilemap);
            LZDecompressWram(gCableCarTreeTilemap, eCableCar2->treeTilemap);
            LZDecompressWram(gCableCarMountainTilemap, eCableCar2->mountainTilemap);
            LZDecompressWram(gCableCarPylonStemTilemap, eCableCar2->pylonStemTilemap);
            LoadPalette(gCableCarBG_Pal, 0, 0x80);
            LZ77UnCompVram(gCableCarBG_Gfx, (u16 *)BG_VRAM);
            gMain.state++;
            break;
        case 3:
            LoadSprites();
            RunTasks();
            gMain.state++;
            break;
        case 4:
            if (sCableCarPtr->unk_0002 == 7)
            {
                gMain.state++;
            }
            else if (gWeatherPtr->sprites.s2.ashSprites[0] != NULL)
            {
                for (i = 0; i < 20; i++)
                {
                    if (gWeatherPtr->sprites.s2.ashSprites[i] != NULL)
                    {
                        gWeatherPtr->sprites.s2.ashSprites[i]->oam.priority = 0;
                    }
                }
                gMain.state++;
            }
            break;
        case 5:
            CableCarUtil_CopyWrapped((void *)BG_SCREEN_ADDR(29), eCableCar2->treeTilemap, 0, 17, 32, 15);
            CableCarUtil_CopyWrapped((void *)BG_SCREEN_ADDR(30), eCableCar2->mountainTilemap, 0, 0, 30, 20);
            CableCarUtil_CopyWrapped(sCableCarPtr->unk_08fc, gCableCarPylonHookTilemapEntries, 0, 0, 5, 2);
            CableCarUtil_CopyWrapped(sCableCarPtr->unk_08fc, eCableCar2->pylonStemTilemap, 0, 2, 2, 20);
            gMain.state++;
            break;
        case 6:
            sub_81248AC(gSpecialVar_0x8004);
            CableCarUtil_CopyWrapped(sCableCarPtr->unk_00fc, eCableCar2->mtChimneyTilemap + 0x48, 0, 14, 12, 3);
            CableCarUtil_CopyWrapped(sCableCarPtr->unk_00fc, eCableCar2->mtChimneyTilemap + 0x6C, 12, 17, 12, 3);
            CableCarUtil_CopyWrapped(sCableCarPtr->unk_00fc, eCableCar2->mtChimneyTilemap + 0x90, 24, 20, 12, 3);
            CableCarUtil_CopyWrapped(sCableCarPtr->unk_00fc, eCableCar2->mtChimneyTilemap + 0x00, 0, 17, 12, 3);
            CableCarUtil_CopyWrapped(sCableCarPtr->unk_00fc, eCableCar2->mtChimneyTilemap + 0x24, 0, 20, 12, 3);
            CableCarUtil_CopyWrapped(sCableCarPtr->unk_00fc, eCableCar2->mtChimneyTilemap + 0x00, 12, 20, 12, 3);
            CableCarUtil_CopyWrapped(sCableCarPtr->unk_00fc, eCableCar2->mtChimneyTilemap + 0x24, 12, 23, 12, 3);
            CableCarUtil_CopyWrapped(sCableCarPtr->unk_00fc, eCableCar2->mtChimneyTilemap + 0x00, 24, 23, 12, 3);
            gMain.state++;
            break;
        case 7:
            BeginNormalPaletteFade(0xFFFFFFFF, 3, 16, 0, RGB(0, 0, 0));
            FadeInNewBGM(MUS_ROPEWAY, 1);
            sub_8123FBC(1);
            gMain.state++;
            break;
        case 8:
            imebak = REG_IME;
            REG_IME = 0;
            REG_IE |= INTR_FLAG_VBLANK;
            REG_IME = imebak;
            SetVBlankCallback(CableCarVblankCallback);
            SetMainCallback2(CableCarMainCallback_Run);
            CreateTask(sub_8123878, 0);
            if (gSpecialVar_0x8004 == 0)
            {
                sCableCarPtr->unk_0000 = CreateTask(sub_81239E4, 1);
            }
            else
            {
                sCableCarPtr->unk_0000 = CreateTask(sub_8123AF8, 1);
            }
            break;
    }
}

static void CableCarMainCallback_Run(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    MapMusicMain();
}

static void sub_8123740(void)
{
    u8 i;

    i = 0;
    sub_8123FBC(0);
    gSpriteCoordOffsetX = 0;
    sub_807C9B4(WEATHER_NONE);
    for (; i < 20; i++)
    {
        gWeatherPtr->sprites.s2.ashSprites[i] = NULL;
    }
    ResetTasks();
    ResetSpriteData();
    ResetPaletteFade();
    DmaFill32Large(3, 0, gSharedMem, 0x20000, 0x1000);
    sCableCarPtr = NULL;
    DmaFill16Large(3, 0, VRAM, VRAM_SIZE, 0x1000);
    DmaFill32Defvars(3, 0, OAM, OAM_SIZE);
    DmaFill16Defvars(3, 0, PLTT, PLTT_SIZE);
    WarpIntoMap();
    gFieldCallback = NULL;
    SetMainCallback2(CB2_LoadMap);
}

static void sub_8123878(u8 taskId)
{
    u8 i;

    i = 0;
    sCableCarPtr->unk_0006++;
    switch (sCableCarPtr->unk_0001)
    {
        case 0:
            if (sCableCarPtr->unk_0006 == sCableCarPtr->unk_0004)
            {
                ChangeWeather(sCableCarPtr->unk_0002);
                sCableCarPtr->unk_0001 = 1;
            }
            break;
        case 1:
            switch (sCableCarPtr->unk_0002)
            {
                case 7:
                    if (gWeatherPtr->sprites.s2.ashSprites[0] != NULL && gWeatherPtr->sprites.s2.ashSprites[0]->oam.priority != 0)
                    {
                        for (; i < 20; i++)
                        {
                            if (gWeatherPtr->sprites.s2.ashSprites[i] != NULL)
                            {
                                gWeatherPtr->sprites.s2.ashSprites[i]->oam.priority = 0;
                            }
                        }
                        sCableCarPtr->unk_0001 = 2;
                    }
                    break;
                case 2:
                    if (gWeatherPtr->currWeather == 2)
                    {
                        sCableCarPtr->unk_0001 = 2;
                    }
                    else if (sCableCarPtr->unk_0006 >= sCableCarPtr->unk_0004 + 8)
                    {
                        for (; i < 20; i++)
                        {
                            if (gWeatherPtr->sprites.s2.ashSprites[i] != NULL)
                            {
                                gWeatherPtr->sprites.s2.ashSprites[i]->invisible ^= TRUE;
                            }
                        }
                    }
                    break;
            }
            break;
        case 2:
            if (sCableCarPtr->unk_0006 == 570)
            {
                sCableCarPtr->unk_0001 = 3;
                BeginNormalPaletteFade(0xFFFFFFFF, 3, 0, 16, RGB(0, 0, 0));
                FadeOutBGM(4);
            }
            break;
        case 3:
            if (!gPaletteFade.active)
            {
                sCableCarPtr->unk_0001 = 255;
            }
            break;
        case 255:
            SetVBlankCallback(NULL);
            DestroyTask(taskId);
            DestroyTask(sCableCarPtr->unk_0000);
            SetMainCallback2(sub_8123740);
            break;
    }
}

static void sub_81239E4(u8 taskId)
{
    if (sCableCarPtr->unk_0001 != 255)
    {
        sCableCarPtr->unk_0014--;
        if ((sCableCarPtr->unk_0006 % 2) == 0)
        {
            sCableCarPtr->unk_0015--;
        }
        if ((sCableCarPtr->unk_0006 % 8) == 0)
        {
            sCableCarPtr->unk_000c--;
            sCableCarPtr->unk_000d--;
        }
        switch (sCableCarPtr->unk_0014)
        {
            case 175:
                CableCarUtil_FillWrapped(sCableCarPtr->unk_08fc, 0, 0, 22, 2, 10);
                break;
            case 40:
                CableCarUtil_FillWrapped(sCableCarPtr->unk_08fc, 0, 3, 0, 2, 2);
                break;
            case 32:
                CableCarUtil_FillWrapped(sCableCarPtr->unk_08fc, 0, 2, 0, 1, 2);
                break;
            case 16:
                CableCarUtil_CopyWrapped(sCableCarPtr->unk_08fc, gCableCarPylonHookTilemapEntries, 0, 0, 5, 2);
                CableCarUtil_CopyWrapped(sCableCarPtr->unk_08fc, eCableCar2->pylonStemTilemap, 0, 2, 2, 30);
                sCableCarPtr->unk_0015 = 64;
                break;
        }
    }
    sub_812453C();
    gSpriteCoordOffsetX = (gSpriteCoordOffsetX + 1) % 128;
}

static void sub_8123AF8(u8 taskId)
{
    if (sCableCarPtr->unk_0001 != 255)
    {
        sCableCarPtr->unk_0014++;
        if ((sCableCarPtr->unk_0006 % 2) == 0)
        {
            sCableCarPtr->unk_0015++;
        }
        if ((sCableCarPtr->unk_0006 % 8) == 0)
        {
            sCableCarPtr->unk_000c++;
            sCableCarPtr->unk_000d++;
        }
        switch (sCableCarPtr->unk_0014)
        {
            case 176:
                CableCarUtil_CopyWrapped(sCableCarPtr->unk_08fc, eCableCar2->pylonStemTilemap, 0, 2, 2, 30);
                break;
            case 16:
                CableCarUtil_FillWrapped(sCableCarPtr->unk_08fc, 0, 2, 0, 3, 2);
                CableCarUtil_FillWrapped(sCableCarPtr->unk_08fc, 0, 0, 22, 2, 10);
                sCableCarPtr->unk_0015 = 192;
                break;
            case 32:
                sCableCarPtr->unk_08fc[0][2] = (gCableCarPylonHookTilemapEntries + 2)[0];
                sCableCarPtr->unk_08fc[0][3] = (gCableCarPylonHookTilemapEntries + 2)[1];
                sCableCarPtr->unk_08fc[1][2] = (gCableCarPylonHookTilemapEntries + 2)[5];
                sCableCarPtr->unk_08fc[1][3] = (gCableCarPylonHookTilemapEntries + 2)[6];
                break;
            case 40:
                sCableCarPtr->unk_08fc[0][4] = (gCableCarPylonHookTilemapEntries + 4)[0];
                sCableCarPtr->unk_08fc[1][4] = (gCableCarPylonHookTilemapEntries + 4)[5];
                break;
        }
    }
    sub_8124598();
    if (sCableCarPtr->unk_0006 < sCableCarPtr->unk_0004) {
        gSpriteCoordOffsetX = (gSpriteCoordOffsetX + 247) % 248;
    }
    else
    {
        gWeatherPtr->unknown_6FC = (gWeatherPtr->unknown_6FC + 247) % 248;
    }
}

static void CableCarVblankCallback(void)
{
    DmaCopy16(3, sCableCarPtr->unk_00fc, BG_SCREEN_ADDR(28), 0x800);
    DmaCopy16(3, sCableCarPtr->unk_08fc, BG_SCREEN_ADDR(31), 0x800);
    REG_BG3HOFS = sCableCarPtr->unk_0014;
    REG_BG3VOFS = sCableCarPtr->unk_0015;
    REG_BG1HOFS = sCableCarPtr->unk_000c;
    REG_BG1VOFS = sCableCarPtr->unk_000d;
    REG_BG0HOFS = sCableCarPtr->unk_0008;
    REG_BG0VOFS = sCableCarPtr->unk_0009;
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void nullsub_76(struct Sprite *sprite)
{

}

static void sub_8123CB8(struct Sprite *sprite)
{
    if (sCableCarPtr->unk_0001 != 255)
    {
        if (gSpecialVar_0x8004 == 0)
        {
            sprite->pos1.x = sprite->data[0] - (u8)(0.14f * S16TOPOSFLOAT(sCableCarPtr->unk_0006));
            sprite->pos1.y = sprite->data[1] - (u8)(0.067f * S16TOPOSFLOAT(sCableCarPtr->unk_0006));
        }
        else
        {
            sprite->pos1.x = sprite->data[0] + (u8)(0.14f * S16TOPOSFLOAT(sCableCarPtr->unk_0006));
            sprite->pos1.y = sprite->data[1] + (u8)(0.067f * S16TOPOSFLOAT(sCableCarPtr->unk_0006));
        }
    }
}

static void sub_8123D98(struct Sprite *sprite)
{
    if (sCableCarPtr->unk_0001 != 255)
    {
        if (gSpecialVar_0x8004 == 0)
        {
            sprite->pos1.x = sprite->data[0] - (u8)(0.14f * S16TOPOSFLOAT(sCableCarPtr->unk_0006));
            sprite->pos1.y = sprite->data[1] - (u8)(0.067f * S16TOPOSFLOAT(sCableCarPtr->unk_0006));
        }
        else
        {
            sprite->pos1.x = sprite->data[0] + (u8)(0.14f * S16TOPOSFLOAT(sCableCarPtr->unk_0006));
            sprite->pos1.y = sprite->data[1] + (u8)(0.067f * S16TOPOSFLOAT(sCableCarPtr->unk_0006));
        }
        switch (sprite->data[2])
        {
            case 0:
                sprite->pos2.y = 17;
                if (sprite->data[3] ++ > 9)
                {
                    sprite->data[3] = 0;
                    sprite->data[2] ++;
                }
                break;
            default:
                sprite->pos2.y = 16;
                if (sprite->data[3] ++ > 9)
                {
                    sprite->data[3] = 0;
                    sprite->data[2] = 0;
                }
                break;
        }
    }
}

static void sub_8123EB8(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->pos1.x += 2 * sprite->centerToCornerVecX;
        sprite->pos1.y += 16 + sprite->centerToCornerVecY;
    }
    if (++sprite->data[0] >= sprite->data[2])
    {
        switch (sprite->data[1])
        {
            case 0:
                sprite->pos1.x++;
                if ((sprite->data[0] % 4) == 0)
                {
                    sprite->pos1.y++;
                }
                break;
            case 1:
                if ((sprite->data[0] % 2) != 0)
                {
                    sprite->pos1.x++;
                    if ((sprite->pos1.x % 4) == 0)
                    {
                        sprite->pos1.y++;
                    }
                }
                break;
        }
        if (sprite->pos1.y > 0xa0)
        {
            DestroySprite(sprite);
        }
    }
}

static void sub_8123F44(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->pos1.y += 16 + sprite->centerToCornerVecY;
    }
    if (++sprite->data[0] >= sprite->data[2])
    {
        switch (sprite->data[1])
        {
            case 0:
                sprite->pos1.x--;
                if ((sprite->data[0] % 4) == 0)
                {
                    sprite->pos1.y--;
                }
                break;
            case 1:
                if ((sprite->data[0] % 2) != 0)
                {
                    sprite->pos1.x--;
                    if ((sprite->pos1.x % 4) == 0)
                    {
                        sprite->pos1.y--;
                    }
                }
                break;
        }
        if (sprite->pos1.y < 0x50)
        {
            DestroySprite(sprite);
        }
    }
}

static void sub_8123FBC(bool8 which)
{
    switch (which)
    {
        case FALSE:
        default:
            REG_WININ = 0;
            REG_WINOUT = 0;
            REG_WIN0H = 0;
            REG_WIN1H = 0;
            REG_WIN0V = 0;
            REG_WIN1V = 0;
            REG_DISPCNT = 0;
            REG_BG3CNT = 0;
            REG_BG2CNT = 0;
            REG_BG1CNT = 0;
            REG_BG0CNT = 0;
            REG_BG3HOFS = 0;
            REG_BG3VOFS = 0;
            REG_BG2HOFS = 0;
            REG_BG2VOFS = 0;
            REG_BG1HOFS = 0;
            REG_BG1VOFS = 0;
            REG_BG0HOFS = 0;
            REG_BG0VOFS = 0;
            REG_BLDCNT = 0;
            break;
        case TRUE:
            REG_WININ = 0;
            REG_WINOUT = 0;
            REG_WIN0H = 0;
            REG_WIN1H = 0;
            REG_WIN0V = 0;
            REG_WIN1V = 0;
            if (gSpecialVar_0x8004 == 0)
            {
                sCableCarPtr->unk_0014 = 0xb0;
                sCableCarPtr->unk_0015 = 0x10;
                sCableCarPtr->unk_000c = 0x00;
                sCableCarPtr->unk_000d = 0x50;
                sCableCarPtr->unk_0009 = 0;
                sCableCarPtr->unk_0009 = 0;
            }
            else
            {
                sCableCarPtr->unk_0014 = 0x60;
                sCableCarPtr->unk_0015 = 0xe8;
                sCableCarPtr->unk_000c = 0x00;
                sCableCarPtr->unk_000d = 0x04;
                sCableCarPtr->unk_0009 = 0;
                sCableCarPtr->unk_0009 = 0;
            }
            REG_BG3HOFS = sCableCarPtr->unk_0014;
            REG_BG3VOFS = sCableCarPtr->unk_0015;
            REG_BG2HOFS = 0;
            REG_BG2VOFS = 0;
            REG_BG1HOFS = sCableCarPtr->unk_000c;
            REG_BG1VOFS = sCableCarPtr->unk_000d;
            REG_BG0HOFS = sCableCarPtr->unk_0008;
            REG_BG0VOFS = sCableCarPtr->unk_0009;
            REG_BG0CNT = BGCNT_PRIORITY(1) | BGCNT_SCREENBASE(28) | BGCNT_WRAP;
            REG_BG1CNT = BGCNT_PRIORITY(2) | BGCNT_SCREENBASE(29) | BGCNT_WRAP;
            REG_BG2CNT = BGCNT_PRIORITY(3) | BGCNT_SCREENBASE(30) | BGCNT_WRAP;
            REG_BG3CNT = BGCNT_PRIORITY(0) | BGCNT_SCREENBASE(31) | BGCNT_WRAP;
            REG_DISPCNT = DISPCNT_OBJ_1D_MAP | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_ON;
            REG_BLDCNT = 0x3f00;
            break;
    }
}

static void LoadSprites(void)
{
    u8 spriteId;
    u8 i;

    u8 playerGraphicsIds[2] = {
        EVENT_OBJ_GFX_RIVAL_BRENDAN_NORMAL,
        EVENT_OBJ_GFX_RIVAL_MAY_NORMAL
    };
    u16 rval = Random();
    u8 hikerGraphicsIds[4] = {
        EVENT_OBJ_GFX_HIKER,
        EVENT_OBJ_GFX_CAMPER,
        EVENT_OBJ_GFX_PICNICKER,
        EVENT_OBJ_GFX_POOCHYENA
    };
    s16 hikerCoords[2][2] = {
        {   0,  80 },
        { 240, 146 }
    };
    u8 hikerMovementDelayTable[4] = {
        0,
        60,
        120,
        170
    };
    void (*callbacks[2])(struct Sprite *) = {
        sub_8123EB8,
        sub_8123F44
    };

    switch (gSpecialVar_0x8004)
    {
        case 0:
        default:
            spriteId = AddPseudoEventObject(playerGraphicsIds[gSaveBlock2.playerGender], sub_8123D98, 0xc8, 0x49, 0x66);
            if (spriteId != MAX_SPRITES)
            {
                gSprites[spriteId].oam.priority = 2;
                gSprites[spriteId].pos2.x = 0x08;
                gSprites[spriteId].pos2.y = 0x10;
                gSprites[spriteId].data[0] = 0xc8;
                gSprites[spriteId].data[1] = 0x49;
            }
            spriteId = CreateSprite(&gSpriteTemplate_8401D40[0], 0xb0, 0x2b, 0x67);
            gSprites[spriteId].pos2.x = gSprites[spriteId].pos2.y = 0x20;
            gSprites[spriteId].data[0] = 0xb0;
            gSprites[spriteId].data[1] = 0x2b;
            spriteId = CreateSprite(&gSpriteTemplate_8401D40[1], 0xc8, 0x63, 0x65);
            gSprites[spriteId].pos2.x = 8;
            gSprites[spriteId].pos2.y = 4;
            gSprites[spriteId].data[0] = 0xc8;
            gSprites[spriteId].data[1] = 0x63;
            sCableCarPtr->unk_0002 = 7;
            sCableCarPtr->unk_0004 = 0x15e;
            sub_807C9B4(WEATHER_SUNNY);
            break;
        case 1:
            CableCarUtil_CopyWrapped(sCableCarPtr->unk_00fc, eCableCar2->mtChimneyTilemap + 0x24, 0x18, 0x1a, 0x0c, 0x03);
            spriteId = AddPseudoEventObject(playerGraphicsIds[gSaveBlock2.playerGender], sub_8123D98, 0x80, 0x27, 0x66);
            if (spriteId != MAX_SPRITES)
            {
                gSprites[spriteId].oam.priority = 2;
                gSprites[spriteId].pos2.x = 0x08;
                gSprites[spriteId].pos2.y = 0x10;
                gSprites[spriteId].data[0] = 0x80;
                gSprites[spriteId].data[1] = 0x27;
            }
            spriteId = CreateSprite(&gSpriteTemplate_8401D40[0], 0x68, 0x09, 0x67);
            gSprites[spriteId].pos2.x = gSprites[spriteId].pos2.y = 0x20;
            gSprites[spriteId].data[0] = 0x68;
            gSprites[spriteId].data[1] = 0x09;
            spriteId = CreateSprite(&gSpriteTemplate_8401D40[1], 0x80, 0x41, 0x65);
            gSprites[spriteId].pos2.x = 8;
            gSprites[spriteId].pos2.y = 4;
            gSprites[spriteId].data[0] = 0x80;
            gSprites[spriteId].data[1] = 0x41;
            sCableCarPtr->unk_0002 = 2;
            sCableCarPtr->unk_0004 = 0x109;
            sub_807C9B4(WEATHER_ASH);
            break;
    }
    for (i = 0; i < 9; i++)
    {
        spriteId = CreateSprite(&gSpriteTemplate_8401D40[2], 16 * i + 0x60, 8 * i - 8, 0x68);
        gSprites[spriteId].pos2.x = 8;
        gSprites[spriteId].pos2.y = 8;
    }
    if ((rval % 64) == 0)
    {
        spriteId = AddPseudoEventObject(hikerGraphicsIds[rval % 3], callbacks[gSpecialVar_0x8004], hikerCoords[gSpecialVar_0x8004][0], hikerCoords[gSpecialVar_0x8004][1], 0x6a);
        if (spriteId != MAX_SPRITES)
        {
            gSprites[spriteId].oam.priority = 2;
            gSprites[spriteId].pos2.x = -gSprites[spriteId].centerToCornerVecX;
            gSprites[spriteId].pos2.y = -gSprites[spriteId].centerToCornerVecY;
            if (gSpecialVar_0x8004 == 0)
            {
                if (rval % 2)
                {
                    StartSpriteAnim(&gSprites[spriteId], 6);
                    gSprites[spriteId].data[1] = 1;
                    gSprites[spriteId].pos1.y += 2;
                }
                else
                {
                    StartSpriteAnim(&gSprites[spriteId], 7);
                    gSprites[spriteId].data[1] = 0;
                }
            }
            else
            {
                if (rval % 2)
                {
                    StartSpriteAnim(&gSprites[spriteId], 7);
                    gSprites[spriteId].data[1] = 1;
                    gSprites[spriteId].pos1.y += 2;
                }
                else
                {
                    StartSpriteAnim(&gSprites[spriteId], 6);
                    gSprites[spriteId].data[1] = 0;
                }
            }
            gSprites[spriteId].data[2] = hikerMovementDelayTable[rval % 4];
        }
    }
}

static void sub_812446C(void)
{
    u8 i;
    u8 j;
    u8 k;
    u8 offset;

    for (i = 0, k = 0, offset = 0x24 * (sCableCarPtr->unk_001b + 2); i < 3; i++)
    {
        for (j = 0; j < 12; j++)
        {
            sCableCarPtr->unk_0022[i][j] = *(eCableCar2->mtChimneyTilemap + (offset++));
            sCableCarPtr->unk_0022[i + 3][j] = eCableCar2->mtChimneyTilemap[k];
            sCableCarPtr->unk_0022[i + 6][j] = (eCableCar2->mtChimneyTilemap + 0x24)[k];
            k++;
        }
    }
    sCableCarPtr->unk_001b = (sCableCarPtr->unk_001b + 1) % 3;
}

static void sub_812453C(void)
{
    sCableCarPtr->unk_001c = (sCableCarPtr->unk_001c + 1) % 0x60;
    sCableCarPtr->unk_0008 = sCableCarPtr->unk_001f - sCableCarPtr->unk_001d;
    sCableCarPtr->unk_0009 = sCableCarPtr->unk_0020 - sCableCarPtr->unk_001e;
    sCableCarPtr->unk_001d++;
    if ((sCableCarPtr->unk_001d % 4) == 0)
    {
        sCableCarPtr->unk_001e++;
    }
    if (sCableCarPtr->unk_001d > 16)
    {
        sub_81245F4();
    }
}

static void sub_8124598(void)
{
    sCableCarPtr->unk_001c = (sCableCarPtr->unk_001c + 1) % 0x60;
    sCableCarPtr->unk_0008 = sCableCarPtr->unk_001f + sCableCarPtr->unk_001d;
    sCableCarPtr->unk_0009 = sCableCarPtr->unk_0020 + sCableCarPtr->unk_001e;
    sCableCarPtr->unk_001d++;
    if ((sCableCarPtr->unk_001d % 4) == 0)
    {
        sCableCarPtr->unk_001e++;
    }
    if (sCableCarPtr->unk_001d > 16)
    {
        sub_812476C();
    }
}

static void sub_81245F4(void)
{
    u8 i = 0;

    sCableCarPtr->unk_001d = sCableCarPtr->unk_001e = 0;
    sCableCarPtr->unk_001f = sCableCarPtr->unk_0008;
    sCableCarPtr->unk_0020 = sCableCarPtr->unk_0009;
    sCableCarPtr->unk_0019 = (sCableCarPtr->unk_0019 + 30) % 32;
    sCableCarPtr->unk_0018 -= 2;
    gUnknown_0203927A = (sCableCarPtr->unk_001a + 23) % 32;
    for (i = 0; i < 9; i++)
    {
        gUnknown_02039278 = sCableCarPtr->unk_0019;
        gUnknown_02039279 = (gUnknown_0203927A + i) % 32;
        sCableCarPtr->unk_00fc[gUnknown_02039279][gUnknown_02039278] = sCableCarPtr->unk_0022[i][sCableCarPtr->unk_0018];
        gUnknown_02039278 = (gUnknown_02039278 + 1) % 32;
        sCableCarPtr->unk_00fc[gUnknown_02039279][gUnknown_02039278] = sCableCarPtr->unk_0022[i][sCableCarPtr->unk_0018 + 1];
    }
    gUnknown_02039278 = (sCableCarPtr->unk_0019 + 30) % 32;
    CableCarUtil_FillWrapped(sCableCarPtr->unk_00fc, 0, gUnknown_02039278, 0, 2, 32);
    if (sCableCarPtr->unk_0018 == 0)
    {
        sCableCarPtr->unk_001a = (sCableCarPtr->unk_001a + 29) % 32;
        sCableCarPtr->unk_0018 = 12;
        sub_812446C();
        gUnknown_02039278 = (sCableCarPtr->unk_001a + 1) % 32;
        CableCarUtil_FillWrapped(sCableCarPtr->unk_00fc, 0, 0, gUnknown_02039278, 32, 9);
    }
}

static void sub_812476C(void)
{
    u8 i = 0;

    sCableCarPtr->unk_001d = sCableCarPtr->unk_001e = 0;
    sCableCarPtr->unk_001f = sCableCarPtr->unk_0008;
    sCableCarPtr->unk_0020 = sCableCarPtr->unk_0009;
    sCableCarPtr->unk_0019 = (sCableCarPtr->unk_0019 + 2) % 32;
    sCableCarPtr->unk_0018 += 2;
    gUnknown_0203927D = sCableCarPtr->unk_001a;
    for (i = 0; i < 9; i++)
    {
        gUnknown_0203927B = sCableCarPtr->unk_0019;
        gUnknown_0203927C = (gUnknown_0203927D + i) % 32;
        sCableCarPtr->unk_00fc[gUnknown_0203927C][gUnknown_0203927B] = sCableCarPtr->unk_0022[i][sCableCarPtr->unk_0018];
        gUnknown_0203927B = (gUnknown_0203927B + 1) % 32;
        sCableCarPtr->unk_00fc[gUnknown_0203927C][gUnknown_0203927B] = sCableCarPtr->unk_0022[i][sCableCarPtr->unk_0018 + 1];
    }
    gUnknown_0203927C = (sCableCarPtr->unk_001a + 23) % 32;
    CableCarUtil_FillWrapped(sCableCarPtr->unk_00fc, 0, sCableCarPtr->unk_0019, gUnknown_0203927C, 2, 9);
    if (sCableCarPtr->unk_0018 == 10)
    {
        sCableCarPtr->unk_001a = (sCableCarPtr->unk_001a + 3) % 32;
        sCableCarPtr->unk_0018 = 0xfe;
        sub_812446C();
    }
}

static void sub_81248AC(u8 a0)
{
    switch (a0)
    {
        case 0:
        default:
            sCableCarPtr->unk_001b = 2;
            sCableCarPtr->unk_0019 = 0;
            sCableCarPtr->unk_001a = 20;
            sCableCarPtr->unk_0018 = 12;
            sub_812446C();
            sub_81245F4();
            break;
        case 1:
            sCableCarPtr->unk_001b = 2;
            sCableCarPtr->unk_0019 = 28;
            sCableCarPtr->unk_001a = 20;
            sCableCarPtr->unk_0018 = 4;
            sub_812446C();
            sub_812476C();
            break;
    }
    sCableCarPtr->unk_001c = 0;
}
