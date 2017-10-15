
// Includes
#include "global.h"
#include "overworld.h"
#include "palette.h"
#include "main.h"
#include "script.h"
#include "task.h"
#include "sound.h"
#include "songs.h"
#include "decompress.h"
#include "field_weather.h"
#include "unknown_task.h"
#include "event_data.h"
#include "cable_car_util.h"

// Static type declarations

// Credits to Made (dolphin emoji)
#define S16TOPOSFLOAT(val)   \
({                           \
    s16 v = (val);           \
    float f = (float)v;      \
    if(v < 0) f += 65536.0f; \
    f;                       \
})

struct Unk_2017000 {
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
    u8 filler_0016[0xe6];
    u16 unk_00fc[0x400];
    u16 unk_08fc[0x400];
}; // size 0x10FC

struct Unk_2019000 {
    /* 0x000 */ u16 mtChimneyTilemap[0xb4];
    /* 0x168 */ u16 treeTilemap[0x1e0];
    /* 0x528 */ u16 mountainTilemap[0x258];
    /* 0x9d8 */ u16 pylonStemTilemap[0x628]; // size not actually known
};

#define ewram_17000 (*(struct Unk_2017000 *)(ewram + 0x17000))
#define ewram_19000 (*(struct Unk_2019000 *)(ewram + 0x19000))

// Static RAM declarations

EWRAM_DATA struct Unk_2017000 *gUnknown_02039274 = NULL;
EWRAM_DATA u8 gUnknown_02039278 = 0;
EWRAM_DATA u8 gUnknown_02039279 = 0;
EWRAM_DATA u8 gUnknown_0203927A = 0;
EWRAM_DATA u8 gUnknown_0203927B = 0;
EWRAM_DATA u8 gUnknown_0203927C = 0;
EWRAM_DATA u8 gUnknown_0203927D = 0;
EWRAM_DATA u32 filler_02039280 = 0;

// Static ROM declarations

void sub_8123244(void);
void sub_8124118(void);
void sub_81248AC(u8);
void sub_8123FBC(u8);
void sub_8123C40(void);
void sub_8123724(void);
void sub_8123878(u8 taskId);
void sub_81239E4(u8 taskId);
void sub_8123AF8(u8 taskId);
void sub_812453C(void);
void sub_8124598(void);

// .rodata

extern const u8 gCableCar_Gfx[];
extern const u8 gCableCarDoor_Gfx[];
extern const u8 gCableCarCord_Gfx[];
extern const u16 gCableCar_Pal[];
extern const u16 gCableCarBG_Pal[];
extern const u8 gCableCarBG_Gfx[];

const u8 gCableCarMtChimneyTilemap[] = INCBIN_U8("graphics/misc/cable_car_mt_chimney_map.bin.lz");

const u8 gCableCarTreeTilemap[] = INCBIN_U8("graphics/misc/cable_car_tree_map.bin.lz");

const u8 gCableCarMountainTilemap[] = INCBIN_U8("graphics/misc/cable_car_mountain_map.bin.lz");

const u16 gCableCarPylonHookTilemapEntries[] = {
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

const u8 gCableCarPylonStemTilemap[] = INCBIN_U8("graphics/misc/cable_car_pylon_stem_map.bin.lz");

const struct CompressedSpriteSheet gUnknown_08401CF8[] = {
    { gCableCar_Gfx,     0x800, 1 },
    { gCableCarDoor_Gfx,  0x40, 2 },
    { gCableCarCord_Gfx,  0x80, 3 },
    {                             }
};
const struct SpritePalette gUnknown_08401D18[] = {
    { gCableCar_Pal, 1 },
    {                  }
};

// .text

void sub_81231EC(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(sub_8123244);
        DestroyTask(taskId);
    }
}

void sub_8123218(void)
{
    ScriptContext2_Enable();
    CreateTask(sub_81231EC, 1);
    BeginNormalPaletteFade(-1, 0, 0, 16, 0);
}

void sub_8123244(void)
{
    u8 i;
    u16 imebak;

    switch (gMain.state)
    {
        case 0:
        default:
            SetVBlankCallback(NULL);
            remove_some_task();
            DmaFill16Large(3, 0, VRAM, VRAM_SIZE, 0x1000);
            DmaFill32Defvars(3, 0, OAM, OAM_SIZE);
            DmaFill16Defvars(3, 0, PLTT, PLTT_SIZE);
            gUnknown_02039274 = &ewram_17000;
            DmaFill16Large(3, 0, &ewram_17000, 0x10FC, 0x1000);
            gMain.state ++;
            break;
        case 1:
            ResetSpriteData();
            ResetTasks();
            FreeAllSpritePalettes();
            ResetPaletteFade();
            sub_807C828();
            for (i = 0; i < 20; i ++)
            {
                gUnknown_08396FC4->unk_0f0[i] = NULL;
            }
            InitMapMusic();
            ResetMapMusic();
            gSpriteCoordOffsetX = gSpriteCoordOffsetY = 0;
            gMain.state ++;
            break;
        case 2:
            for (i = 0; i < 3; i ++)
            {
                LoadCompressedObjectPic(&gUnknown_08401CF8[i]);
            }
            LoadSpritePalettes(gUnknown_08401D18);
            LZDecompressWram(gCableCarMtChimneyTilemap, ewram_19000.mtChimneyTilemap);
            LZDecompressWram(gCableCarTreeTilemap, ewram_19000.treeTilemap);
            LZDecompressWram(gCableCarMountainTilemap, ewram_19000.mountainTilemap);
            LZDecompressWram(gCableCarPylonStemTilemap, ewram_19000.pylonStemTilemap);
            LoadPalette(gCableCarBG_Pal, 0, 0x80);
            LZ77UnCompVram(gCableCarBG_Gfx, (u16 *)BG_VRAM);
            gMain.state ++;
            break;
        case 3:
            sub_8124118();
            RunTasks();
            gMain.state ++;
            break;
        case 4:
            if (gUnknown_02039274->unk_0002 == 7)
            {
                gMain.state ++;
            }
            else if (gUnknown_08396FC4->unk_0f0[0] != NULL)
            {
                for (i = 0; i < 20; i ++)
                {
                    if (gUnknown_08396FC4->unk_0f0[i] != NULL)
                    {
                        gUnknown_08396FC4->unk_0f0[i]->oam.priority = 0;
                    }
                }
                gMain.state ++;
            }
            break;
        case 5:
            sub_8124F08((u16 *)BG_SCREEN_ADDR(29), ewram_19000.treeTilemap, 0, 17, 32, 15);
            sub_8124F08((u16 *)BG_SCREEN_ADDR(30), ewram_19000.mountainTilemap, 0, 0, 30, 20);
            sub_8124F08(gUnknown_02039274->unk_08fc, gCableCarPylonHookTilemapEntries, 0, 0, 5, 2);
            sub_8124F08(gUnknown_02039274->unk_08fc, ewram_19000.pylonStemTilemap, 0, 2, 2, 20);
            gMain.state ++;
            break;
        case 6:
            sub_81248AC(gSpecialVar_0x8004);
            sub_8124F08(gUnknown_02039274->unk_00fc, ewram_19000.mtChimneyTilemap + 0x48, 0, 14, 12, 3);
            sub_8124F08(gUnknown_02039274->unk_00fc, ewram_19000.mtChimneyTilemap + 0x6C, 12, 17, 12, 3);
            sub_8124F08(gUnknown_02039274->unk_00fc, ewram_19000.mtChimneyTilemap + 0x90, 24, 20, 12, 3);
            sub_8124F08(gUnknown_02039274->unk_00fc, ewram_19000.mtChimneyTilemap + 0x00, 0, 17, 12, 3);
            sub_8124F08(gUnknown_02039274->unk_00fc, ewram_19000.mtChimneyTilemap + 0x24, 0, 20, 12, 3);
            sub_8124F08(gUnknown_02039274->unk_00fc, ewram_19000.mtChimneyTilemap + 0x00, 12, 20, 12, 3);
            sub_8124F08(gUnknown_02039274->unk_00fc, ewram_19000.mtChimneyTilemap + 0x24, 12, 23, 12, 3);
            sub_8124F08(gUnknown_02039274->unk_00fc, ewram_19000.mtChimneyTilemap + 0x00, 24, 23, 12, 3);
            gMain.state ++;
            break;
        case 7:
            BeginNormalPaletteFade(-1, 3, 16, 0, 0);
            FadeInNewBGM(BGM_ROPEWAY, 1);
            sub_8123FBC(1);
            gMain.state ++;
            break;
        case 8:
            imebak = REG_IME;
            REG_IME = 0;
            REG_IE |= INTR_FLAG_VBLANK;
            REG_IME = imebak;
            SetVBlankCallback(sub_8123C40);
            SetMainCallback2(sub_8123724);
            CreateTask(sub_8123878, 0);
            if (gSpecialVar_0x8004 == 0)
            {
                gUnknown_02039274->unk_0000 = CreateTask(sub_81239E4, 1);
            }
            else
            {
                gUnknown_02039274->unk_0000 = CreateTask(sub_8123AF8, 1);
            }
            break;
    }
}

void sub_8123724(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    MapMusicMain();
}

void sub_8123740(void)
{
    u8 i;

    i = 0;
    sub_8123FBC(0);
    gSpriteCoordOffsetX = 0;
    sub_807C9B4(0);
    for (; i < 20; i ++)
    {
        gUnknown_08396FC4->unk_0f0[i] = NULL;
    }
    ResetTasks();
    ResetSpriteData();
    ResetPaletteFade();
    DmaFill32Large(3, 0, ewram, 0x20000, 0x1000);
    gUnknown_02039274 = NULL;
    DmaFill16Large(3, 0, VRAM, VRAM_SIZE, 0x1000);
    DmaFill32Defvars(3, 0, OAM, OAM_SIZE);
    DmaFill16Defvars(3, 0, PLTT, PLTT_SIZE);
    warp_in();
    gFieldCallback = NULL;
    SetMainCallback2(CB2_LoadMap);
}

void sub_8123878(u8 taskId)
{
    u8 i;

    i = 0;
    gUnknown_02039274->unk_0006 ++;
    switch (gUnknown_02039274->unk_0001)
    {
        case 0:
            if (gUnknown_02039274->unk_0006 == gUnknown_02039274->unk_0004)
            {
                DoWeatherEffect(gUnknown_02039274->unk_0002);
                gUnknown_02039274->unk_0001 = 1;
            }
            break;
        case 1:
            switch (gUnknown_02039274->unk_0002)
            {
                case 7:
                    if (gUnknown_08396FC4->unk_0f0[0] != NULL && gUnknown_08396FC4->unk_0f0[0]->oam.priority != 0)
                    {
                        for (; i < 20; i ++)
                        {
                            if (gUnknown_08396FC4->unk_0f0[i] != NULL)
                            {
                                gUnknown_08396FC4->unk_0f0[i]->oam.priority = 0;
                            }
                        }
                        gUnknown_02039274->unk_0001 = 2;
                    }
                    break;
                case 2:
                    if (gUnknown_08396FC4->unknown_6D0 == 2)
                    {
                        gUnknown_02039274->unk_0001 = 2;
                    }
                    else if (gUnknown_02039274->unk_0006 >= gUnknown_02039274->unk_0004 + 8)
                    {
                        for (; i < 20; i ++)
                        {
                            if (gUnknown_08396FC4->unk_0f0[i] != NULL)
                            {
                                gUnknown_08396FC4->unk_0f0[i]->invisible ^= TRUE;
                            }
                        }
                    }
                    break;
            }
            break;
        case 2:
            if (gUnknown_02039274->unk_0006 == 570)
            {
                gUnknown_02039274->unk_0001 = 3;
                BeginNormalPaletteFade(-1, 3, 0, 16, 0);
                FadeOutBGM(4);
            }
            break;
        case 3:
            if (!gPaletteFade.active)
            {
                gUnknown_02039274->unk_0001 = 255;
            }
            break;
        case 255:
            SetVBlankCallback(NULL);
            DestroyTask(taskId);
            DestroyTask(gUnknown_02039274->unk_0000);
            SetMainCallback2(sub_8123740);
            break;
    }
}

void sub_81239E4(u8 taskId)
{
    if (gUnknown_02039274->unk_0001 != 255)
    {
        gUnknown_02039274->unk_0014 --;
        if ((gUnknown_02039274->unk_0006 % 2) == 0)
        {
            gUnknown_02039274->unk_0015 --;
        }
        if ((gUnknown_02039274->unk_0006 % 8) == 0)
        {
            gUnknown_02039274->unk_000c --;
            gUnknown_02039274->unk_000d --;
        }
        switch (gUnknown_02039274->unk_0014)
        {
            case 175:
                sub_8124E7C(gUnknown_02039274->unk_08fc, 0, 0, 22, 2, 10);
                break;
            case 40:
                sub_8124E7C(gUnknown_02039274->unk_08fc, 0, 3, 0, 2, 2);
                break;
            case 32:
                sub_8124E7C(gUnknown_02039274->unk_08fc, 0, 2, 0, 1, 2);
                break;
            case 16:
                sub_8124F08(gUnknown_02039274->unk_08fc, gCableCarPylonHookTilemapEntries, 0, 0, 5, 2);
                sub_8124F08(gUnknown_02039274->unk_08fc, ewram_19000.pylonStemTilemap, 0, 2, 2, 30);
                gUnknown_02039274->unk_0015 = 64;
                break;
        }
    }
    sub_812453C();
    gSpriteCoordOffsetX = (gSpriteCoordOffsetX + 1) % 128;
}

void sub_8123AF8(u8 taskId)
{
    if (gUnknown_02039274->unk_0001 != 255)
    {
        gUnknown_02039274->unk_0014 ++;
        if ((gUnknown_02039274->unk_0006 % 2) == 0)
        {
            gUnknown_02039274->unk_0015 ++;
        }
        if ((gUnknown_02039274->unk_0006 % 8) == 0)
        {
            gUnknown_02039274->unk_000c ++;
            gUnknown_02039274->unk_000d ++;
        }
        switch (gUnknown_02039274->unk_0014)
        {
            case 176:
                sub_8124F08(gUnknown_02039274->unk_08fc, ewram_19000.pylonStemTilemap, 0, 2, 2, 30);
                break;
            case 16:
                sub_8124E7C(gUnknown_02039274->unk_08fc, 0, 2, 0, 3, 2);
                sub_8124E7C(gUnknown_02039274->unk_08fc, 0, 0, 22, 2, 10);
                gUnknown_02039274->unk_0015 = 192;
                break;
            case 32:
                gUnknown_02039274->unk_08fc[2] = (gCableCarPylonHookTilemapEntries + 2)[0];
                gUnknown_02039274->unk_08fc[3] = (gCableCarPylonHookTilemapEntries + 2)[1];
                gUnknown_02039274->unk_08fc[34] = (gCableCarPylonHookTilemapEntries + 2)[5];
                gUnknown_02039274->unk_08fc[35] = (gCableCarPylonHookTilemapEntries + 2)[6];
                break;
            case 40:
                gUnknown_02039274->unk_08fc[4] = (gCableCarPylonHookTilemapEntries + 4)[0];
                gUnknown_02039274->unk_08fc[36] = (gCableCarPylonHookTilemapEntries + 4)[5];
                break;
        }
    }
    sub_8124598();
    if (gUnknown_02039274->unk_0006 < gUnknown_02039274->unk_0004) {
        gSpriteCoordOffsetX = (gSpriteCoordOffsetX + 247) % 248;
    }
    else
    {
        gUnknown_08396FC4->unknown_6FC = (gUnknown_08396FC4->unknown_6FC + 247) % 248;
    }
}

void sub_8123C40(void)
{
    DmaCopy16(3, gUnknown_02039274->unk_00fc, BG_SCREEN_ADDR(28), 0x800);
    DmaCopy16(3, gUnknown_02039274->unk_08fc, BG_SCREEN_ADDR(31), 0x800);
    REG_BG3HOFS = gUnknown_02039274->unk_0014;
    REG_BG3VOFS = gUnknown_02039274->unk_0015;
    REG_BG1HOFS = gUnknown_02039274->unk_000c;
    REG_BG1VOFS = gUnknown_02039274->unk_000d;
    REG_BG0HOFS = gUnknown_02039274->unk_0008;
    REG_BG0VOFS = gUnknown_02039274->unk_0009;
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void nullsub_76(void)
{

}

void sub_8123CB8(struct Sprite *sprite)
{
    if (gUnknown_02039274->unk_0001 != 255)
    {
        if (gSpecialVar_0x8004 == 0)
        {
            sprite->pos1.x = sprite->data0 - (u8)(0.14f * S16TOPOSFLOAT(gUnknown_02039274->unk_0006));
            sprite->pos1.y = sprite->data1 - (u8)(0.067f * S16TOPOSFLOAT(gUnknown_02039274->unk_0006));
        }
        else
        {
            sprite->pos1.x = sprite->data0 + (u8)(0.14f * S16TOPOSFLOAT(gUnknown_02039274->unk_0006));
            sprite->pos1.y = sprite->data1 + (u8)(0.067f * S16TOPOSFLOAT(gUnknown_02039274->unk_0006));
        }
    }
}

void sub_8123D98(struct Sprite *sprite)
{
    if (gUnknown_02039274->unk_0001 != 255)
    {
        if (gSpecialVar_0x8004 == 0)
        {
            sprite->pos1.x = sprite->data0 - (u8)(0.14f * S16TOPOSFLOAT(gUnknown_02039274->unk_0006));
            sprite->pos1.y = sprite->data1 - (u8)(0.067f * S16TOPOSFLOAT(gUnknown_02039274->unk_0006));
        }
        else
        {
            sprite->pos1.x = sprite->data0 + (u8)(0.14f * S16TOPOSFLOAT(gUnknown_02039274->unk_0006));
            sprite->pos1.y = sprite->data1 + (u8)(0.067f * S16TOPOSFLOAT(gUnknown_02039274->unk_0006));
        }
        switch (sprite->data2)
        {
            case 0:
                sprite->pos2.y = 17;
                if (sprite->data3 ++ > 9)
                {
                    sprite->data3 = 0;
                    sprite->data2 ++;
                }
                break;
            default:
                sprite->pos2.y = 16;
                if (sprite->data3 ++ > 9)
                {
                    sprite->data3 = 0;
                    sprite->data2 = 0;
                }
                break;
        }
    }
}

void sub_8123EB8(struct Sprite *sprite)
{
    if (sprite->data0 == 0)
    {
        sprite->pos1.x += 2 * sprite->centerToCornerVecX;
        sprite->pos1.y += 16 + sprite->centerToCornerVecY;
    }
    if (++ sprite->data0 >= sprite->data2)
    {
        switch (sprite->data1)
        {
            case 0:
                sprite->pos1.x ++;
                if ((sprite->data0 % 4) == 0)
                {
                    sprite->pos1.y ++;
                }
                break;
            case 1:
                if ((sprite->data0 % 2) != 0)
                {
                    sprite->pos1.x ++;
                    if ((sprite->pos1.x % 4) == 0)
                    {
                        sprite->pos1.y ++;
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

void sub_8123F44(struct Sprite *sprite)
{
    if (sprite->data0 == 0)
    {
        sprite->pos1.y += 16 + sprite->centerToCornerVecY;
    }
    if (++ sprite->data0 >= sprite->data2)
    {
        switch (sprite->data1)
        {
            case 0:
                sprite->pos1.x --;
                if ((sprite->data0 % 4) == 0)
                {
                    sprite->pos1.y --;
                }
                break;
            case 1:
                if ((sprite->data0 % 2) != 0)
                {
                    sprite->pos1.x --;
                    if ((sprite->pos1.x % 4) == 0)
                    {
                        sprite->pos1.y --;
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

void sub_8123FBC(bool8 which)
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
                gUnknown_02039274->unk_0014 = 0xb0;
                gUnknown_02039274->unk_0015 = 0x10;
                gUnknown_02039274->unk_000c = 0x00;
                gUnknown_02039274->unk_000d = 0x50;
                gUnknown_02039274->unk_0009 = 0;
                gUnknown_02039274->unk_0009 = 0;
            }
            else
            {
                gUnknown_02039274->unk_0014 = 0x60;
                gUnknown_02039274->unk_0015 = 0xe8;
                gUnknown_02039274->unk_000c = 0x00;
                gUnknown_02039274->unk_000d = 0x04;
                gUnknown_02039274->unk_0009 = 0;
                gUnknown_02039274->unk_0009 = 0;
            }
            REG_BG3HOFS = gUnknown_02039274->unk_0014;
            REG_BG3VOFS = gUnknown_02039274->unk_0015;
            REG_BG2HOFS = 0;
            REG_BG2VOFS = 0;
            REG_BG1HOFS = gUnknown_02039274->unk_000c;
            REG_BG1VOFS = gUnknown_02039274->unk_000d;
            REG_BG0HOFS = gUnknown_02039274->unk_0008;
            REG_BG0VOFS = gUnknown_02039274->unk_0009;
            REG_BG0CNT = BGCNT_PRIORITY(1) | BGCNT_SCREENBASE(28) | BGCNT_WRAP;
            REG_BG1CNT = BGCNT_PRIORITY(2) | BGCNT_SCREENBASE(29) | BGCNT_WRAP;
            REG_BG2CNT = BGCNT_PRIORITY(3) | BGCNT_SCREENBASE(30) | BGCNT_WRAP;
            REG_BG3CNT = BGCNT_PRIORITY(0) | BGCNT_SCREENBASE(31) | BGCNT_WRAP;
            REG_DISPCNT = DISPCNT_OBJ_1D_MAP | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_ON;
            REG_BLDCNT = 0x3f00;
            break;
    }
}
