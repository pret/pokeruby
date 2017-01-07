#include "global.h"
#include "intro.h"
#include "asm.h"
#include "gba/m4a_internal.h"
#include "m4a.h"
#include "libgncmultiboot.h"
#include "save.h"
#include "decompress.h"
#include "title_screen.h"
#include "new_game.h"
#include "link.h"
#include "main.h"
#include "palette.h"
#include "rng.h"
#include "songs.h"
#include "sound.h"
#include "species.h"
#include "task.h"
#include "trig.h"

extern void *species_and_otid_get_pal(/*TODO: arg types*/);
extern void sub_8143648(int, u8);
extern void sub_8143680(int, u8);

struct MonCoords
{
    u8 x, y;
};


extern struct SpriteTemplate gUnknown_02024E8C;
extern u16 gUnknown_02039318;
extern u16 gUnknown_0203931A;
extern u16 gUnknown_02039358;
extern u16 gUnknown_0203935A;

extern u32 gIntroFrameCounter;
extern struct GcmbStruct gUnknown_03005EE0;
extern u16 gSaveFileStatus;
extern u8 gReservedSpritePaletteCount;
extern struct SpriteSheet gMonFrontPicTable[];
extern struct MonCoords gMonFrontPicCoords[];
extern struct SpriteSheet gMonBackPicTable[];
extern struct MonCoords gMonBackPicCoords[];
extern struct SpriteSheet gTrainerBackPicTable[];
extern struct MonCoords gTrainerBackPicCoords[];
extern struct SpritePalette gTrainerBackPicPaletteTable[];

extern const u16 gIntro1BGPals[];
extern const u8 gIntro1BG0_Tilemap[];
extern const u8 gIntro1BG1_Tilemap[];
extern const u8 gIntro1BG2_Tilemap[];
extern const u8 gIntro1BG3_Tilemap[];
extern const u8 gIntro1BGLeavesGfx[];
extern const u8 gIntro3PokeballPal[];
extern const u8 gIntro3Pokeball_Tilemap[];
extern const u8 gIntro3Pokeball_Gfx[];
extern const u16 gIntro3Streaks_Pal[];
extern const u8 gIntro3Streaks_Gfx[];
extern const u8 gIntro3Streaks_Tilemap[];
extern union AnimCmd *gUnknown_0840AE80[];
extern const struct SpriteTemplate gSpriteTemplate_840AFF0;
extern const struct SpriteSheet gUnknown_0840B008;
extern const struct SpriteSheet gUnknown_0840B018;
extern const struct SpritePalette gUnknown_0840B028[];
extern const struct SpriteTemplate gSpriteTemplate_840B1F4;
extern const struct SpriteSheet gIntro3PokeballGfx_Table;
extern const struct SpriteSheet gIntro3MiscGfx_Table;
extern const struct SpritePalette gInterfacePokeballPal_Table;
extern const struct SpritePalette gIntro3MiscPal_Table[];
extern const struct SpriteSheet gIntro2BrendanSpriteSheet;
extern const struct SpriteSheet gIntro2MaySpriteSheet;
extern const struct SpriteSheet gIntro2BicycleSpriteSheet;
extern const struct SpriteSheet gIntro2LatiosSpriteSheet;
extern const struct SpriteSheet gIntro2LatiasSpriteSheet;
extern const struct SpritePalette gIntro2SpritePalettes[];

extern const struct SpriteTemplate gSpriteTemplate_840AE20;

extern const u8 gIntroCopyright_Gfx[];
extern const u16 gIntroCopyright_Pal[];
extern const u16 gIntroCopyright_Tilemap[];

extern const u16 gUnknown_08393E64[];
extern const s16 gUnknown_0840AF50[][2];
extern const s16 gUnknown_0840AF74[][2];
extern const struct SpriteTemplate gSpriteTemplate_840AF94;
extern const struct SpriteTemplate gSpriteTemplate_840AFAC;
extern const struct SpriteTemplate gSpriteTemplate_840AFC4;
extern union AnimCmd *gUnknown_0840B064[];
extern const struct SpriteTemplate gSpriteTemplate_840B084;
extern const struct SpriteTemplate gSpriteTemplate_840B0B0;
extern const struct SpriteTemplate gSpriteTemplate_840B0DC;
extern const struct SpriteTemplate gSpriteTemplate_840B0F4;
extern void *gUnknown_0840B5A0[];

extern const s16 gSineTable[];

static void MainCB2_EndIntro(void);
static void Task_IntroLoadPart1Graphics(u8);
static void Task_IntroFadeIn(u8);
static void Task_IntroWaterDrops(u8);
static void Task_IntroScrollDownAndShowEon(u8);
static void Task_IntroWaitToSetupPart2(u8);
static void Task_IntroLoadPart2Graphics(u8);
static void Task_IntroStartBikeRide(u8);
static void Task_IntroHandleBikeAndEonMovement(u8);
static void Task_IntroWaitToSetupPart3(u8);
static void Task_IntroLoadPart3Graphics(u8);
static void Task_IntroSpinAndZoomPokeball(u8);
static void Task_IntroWaitToSetupPart3DoubleFight(u8);
static void Task_IntroLoadPart3Streaks(u8);
static void task_intro_14(u8);
static void task_intro_15(u8);
static void task_intro_16(u8);
static void task_intro_17(u8);
void Task_IntroPokemonBattle(u8);
static void task_intro_19(u8);
void task_intro_20(u8 taskId);  //should be static, but the compiler complains

void sub_813D220(struct Sprite *sprite);
void sub_813D368(struct Sprite *sprite);
void sub_813D414(struct Sprite *sprite);
void SpriteCB_WaterDropFall(struct Sprite *sprite);

static void VBlankCB_Intro(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void MainCB2_Intro(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    if (gMain.newKeys && !gPaletteFade.active)
        SetMainCallback2(MainCB2_EndIntro);
    else if (gIntroFrameCounter != -1)
        gIntroFrameCounter++;
}

static void MainCB2_EndIntro(void)
{
    if (!UpdatePaletteFade())
        SetMainCallback2(CB2_InitTitleScreen);
}

static void LoadCopyrightGraphics(u16 a1, u16 a2, u16 a3)
{
    LZ77UnCompVram(gIntroCopyright_Gfx, (void *)(VRAM + a1));
    LoadPalette(gIntroCopyright_Pal, a3, 0x20);
    CpuCopy16(gIntroCopyright_Tilemap, (void *)(VRAM + a2), 0x500);
}

static void SerialCb_CopyrightScreen(void)
{
    GameCubeMultiBoot_HandleSerialInterrupt(&gUnknown_03005EE0);
}

static u8 SetUpCopyrightScreen(void)
{
    u16 ime;

    switch (gMain.state)
    {
    case 0:
        SetVBlankCallback(NULL);
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        REG_BLDY = 0;
        *(u16 *)PLTT = 0x7FFF;
        REG_DISPCNT = 0;
        REG_BG0HOFS = 0;
        REG_BG0VOFS = 0;
        DmaFill16(3, 0, (void *)VRAM, VRAM_SIZE);
        DmaFill32(3, 0, (void *)OAM, OAM_SIZE);
        DmaFill16(3, 0, (void *)(PLTT + 2), PLTT_SIZE - 2);
        ResetPaletteFade();
        LoadCopyrightGraphics(0, 14336, 0);
        remove_some_task();
        ResetTasks();
        ResetSpriteData();
        FreeAllSpritePalettes();
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0x10, 0, 0xFFFF);
        REG_BG0CNT = 1792;
        ime = REG_IME;
        REG_IME = 0;
        REG_IE |= INTR_FLAG_VBLANK;
        REG_IME = ime;
        REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;
        SetVBlankCallback(VBlankCB_Intro);
        REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON;
        SetSerialCallback(SerialCb_CopyrightScreen);
        GameCubeMultiBoot_Init(&gUnknown_03005EE0);
    default:
        UpdatePaletteFade();
        gMain.state++;
        GameCubeMultiBoot_Main(&gUnknown_03005EE0);
        break;
    case 140:
        GameCubeMultiBoot_Main(&gUnknown_03005EE0);
        if (gUnknown_03005EE0.gcmb_field_2 != 1)
        {
            BeginNormalPaletteFade(0xFFFFFFFFu, 0, 0, 0x10, 0);
            gMain.state++;
        }
        break;
    case 141:
        if (UpdatePaletteFade())
            break;
        CreateTask(Task_IntroLoadPart1Graphics, 0);
        SetMainCallback2(MainCB2_Intro);
        if (gUnknown_03005EE0.gcmb_field_2)
        {
            GameCubeMultiBoot_ExecuteProgram(&gUnknown_03005EE0);
        }
        else
        {
            GameCubeMultiBoot_Quit();
            SetSerialCallback(SerialCB);
        }
        return 0;
    }

    return 1;
}

void c2_copyright_1(void)
{
    if (!SetUpCopyrightScreen())
    {
        sub_8052E4C();
        sub_81251B8();
        sub_8125EC8(0);
        if (gSaveFileStatus == 0 || gSaveFileStatus == 2)
            ClearSav2();
        SetPokemonCryStereo(gSaveBlock2.optionsSound);
    }
}

void CB2_InitCopyrightScreen(void)
{
    SetUpCopyrightScreen();
}

static void Task_IntroLoadPart1Graphics(u8 taskId)
{
    SetVBlankCallback(NULL);
    gUnknown_02039318 = Random() & 1;
    intro_reset_and_hide_bgs();
    REG_BG3VOFS = 0;
    REG_BG2VOFS = 0x50;
    REG_BG1VOFS = 0x18;
    REG_BG0VOFS = 0x28;
    LZ77UnCompVram(gIntro1BGLeavesGfx, (void *)VRAM);
    LZ77UnCompVram(gIntro1BG0_Tilemap, (void *)(VRAM + 0x8000));
    DmaClear16(3, VRAM + 0x8800, 0x800);
    LZ77UnCompVram(gIntro1BG1_Tilemap, (void *)(VRAM + 0x9000));
    DmaClear16(3, VRAM + 0x9800, 0x800);
    LZ77UnCompVram(gIntro1BG2_Tilemap, (void *)(VRAM + 0xA000));
    DmaClear16(3, VRAM + 0xA800, 0x800);
    LZ77UnCompVram(gIntro1BG3_Tilemap, (void *)(VRAM + 0xB000));
    DmaClear16(3, VRAM + 0xB800, 0x800);
    LoadPalette(gIntro1BGPals, 0, 0x200);
    REG_BG3CNT = 0x9603;
    REG_BG2CNT = 0x9402;
    REG_BG1CNT = 0x9201;
    REG_BG0CNT = 0x9000;
    LoadCompressedObjectPic(&gUnknown_0840B008);
    LoadCompressedObjectPic(&gUnknown_0840B018);
    LoadSpritePalettes(gUnknown_0840B028);
    CpuCopy16(gPlttBufferUnfaded + 0x100, gPlttBufferUnfaded + 0x1F0, 0x20);
    CpuCopy16(gPlttBufferUnfaded + 0x100, gPlttBufferUnfaded + 0x1E1, 0x1E);
    CpuCopy16(gPlttBufferUnfaded + 0x100, gPlttBufferUnfaded + 0x1D2, 0x1C);
    CpuCopy16(gPlttBufferUnfaded + 0x100, gPlttBufferUnfaded + 0x1C3, 0x1A);
    CpuCopy16(gPlttBufferUnfaded + 0x100, gPlttBufferUnfaded + 0x1B4, 0x18);
    CpuCopy16(gPlttBufferUnfaded + 0x100, gPlttBufferUnfaded + 0x1A5, 0x16);
    CpuCopy16(gPlttBufferUnfaded + 0x100, gPlttBufferUnfaded + 0x196, 0x14);
    gTasks[taskId].data[0] = CreateWaterDrop(236, -14, 0x200, 1, 0x78, FALSE);
    gTasks[taskId].func = Task_IntroFadeIn;
}

static void Task_IntroFadeIn(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
    SetVBlankCallback(VBlankCB_Intro);
    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_ON;
    gTasks[taskId].func = Task_IntroWaterDrops;
    gIntroFrameCounter = 0;
    m4aSongNumStart(0x19E);
    ResetSerial();
}

static void Task_IntroWaterDrops(u8 taskId)
{
    //start moving rock
    if (gIntroFrameCounter == 76)
        gSprites[gTasks[taskId].data[0]].data0 = 1;
    
    //drop rock
    if (gIntroFrameCounter == 251)
        gSprites[gTasks[taskId].data[0]].data0 = 2;
        
    if (gIntroFrameCounter == 368)
        CreateWaterDrop(48, 0, 0x400, 5, 0x70, TRUE);
    if (gIntroFrameCounter == 384)
        CreateWaterDrop(200, 60, 0x400, 9, 0x80, TRUE);
    
    if (gIntroFrameCounter == 560)
        CreateGameFreakLogo(DISPLAY_WIDTH / 2, DISPLAY_HEIGHT / 2, CreateTask(sub_813CCE8, 0));
    
    if (gIntroFrameCounter > 739)
    {
        gTasks[taskId].data[1] = 0x50;
        gTasks[taskId].data[2] = 0;
        gTasks[taskId].data[3] = 0x18;
        gTasks[taskId].data[4] = 0;
        gTasks[taskId].data[5] = 0x28;
        gTasks[taskId].data[6] = 0;
        gTasks[taskId].func = Task_IntroScrollDownAndShowEon;
    }
}

static void Task_IntroScrollDownAndShowEon(u8 taskId)
{
    if (gIntroFrameCounter < 904)
    {
        s32 r2;
        
        //slide backgrounds downward
        r2 = (gTasks[taskId].data[1] << 16) + (u16)gTasks[taskId].data[2] - 0xC000;
        gTasks[taskId].data[1] = r2 >> 16;
        gTasks[taskId].data[2] = r2;
        REG_BG2VOFS = gTasks[taskId].data[1];
        r2 = (gTasks[taskId].data[3] << 16) + (u16)gTasks[taskId].data[4] - 0x10000;
        gTasks[taskId].data[3] = r2 >> 16;
        gTasks[taskId].data[4] = r2;
        REG_BG1VOFS = gTasks[taskId].data[3];
        r2 = (gTasks[taskId].data[5] << 16) + (u16)gTasks[taskId].data[6] - 0x18000;
        gTasks[taskId].data[5] = r2 >> 16;
        gTasks[taskId].data[6] = r2;
        REG_BG0VOFS = gTasks[taskId].data[5];
        
        //show Lati@s sprite
        if (gIntroFrameCounter == 880)
        {
            u8 spriteId = CreateSprite(&gSpriteTemplate_840AFF0, 200, 160, 10);
            
            gSprites[spriteId].invisible = 1;
        }
    }
    else
    {
        //fade to white
        if (gIntroFrameCounter > 1007)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0xFFFF);
            gTasks[taskId].func = Task_IntroWaitToSetupPart2;
        }
    }
}

static void Task_IntroWaitToSetupPart2(u8 taskId)
{
    if (gIntroFrameCounter > 1026)
        gTasks[taskId].func = Task_IntroLoadPart2Graphics;
}

static void Task_IntroLoadPart2Graphics(u8 taskId)
{
    intro_reset_and_hide_bgs();
    SetVBlankCallback(NULL);
    ResetSpriteData();
    FreeAllSpritePalettes();
    gUnknown_02039358 = 0;
    gUnknown_0203935A = 0;
#ifdef SAPPHIRE
    load_intro_part2_graphics(0);
#else
    load_intro_part2_graphics(1);
#endif
    gTasks[taskId].func = Task_IntroStartBikeRide;
}

static void Task_IntroStartBikeRide(u8 taskId)
{
    u8 spriteId;
    
    if (gUnknown_02039318 == 0)
        LoadCompressedObjectPic(&gIntro2BrendanSpriteSheet);
    else
        LoadCompressedObjectPic(&gIntro2MaySpriteSheet);
    LoadCompressedObjectPic(&gIntro2BicycleSpriteSheet);
#ifdef SAPPHIRE
    LoadCompressedObjectPic(&gIntro2LatiasSpriteSheet);
#else
    LoadCompressedObjectPic(&gIntro2LatiosSpriteSheet);
#endif
    LoadSpritePalettes(gIntro2SpritePalettes);
    if (gUnknown_02039318 == 0)
        spriteId = intro_create_brendan_sprite(0x110, 100);
    else
        spriteId = intro_create_may_sprite(0x110, 100);
    gSprites[spriteId].callback = sub_813D788;
    gSprites[spriteId].anims = gUnknown_0840AE80;
    gTasks[taskId].data[1] = spriteId;
#ifdef SAPPHIRE
    spriteId = intro_create_latias_sprite(-0x40, 0x3C);
#else
    spriteId = intro_create_latios_sprite(-0x40, 0x3C);
#endif
    gSprites[spriteId].callback = sub_813D880;
    gTasks[taskId].data[2] = spriteId;
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0xFFFF);
    SetVBlankCallback(VBlankCB_Intro);
#ifdef SAPPHIRE
    gTasks[taskId].data[0] = sub_8148EC0(0, 0x4000, 0x40, 0x10);
    sub_8148C78(0);
#else
    gTasks[taskId].data[0] = sub_8148EC0(1, 0x4000, 0x400, 0x10);
    sub_8148C78(1);
#endif
    gTasks[taskId].func = Task_IntroHandleBikeAndEonMovement;
}

static void Task_IntroHandleBikeAndEonMovement(u8 taskId)
{
    s16 a;
    u16 sine;
    
    if (gIntroFrameCounter > 1823)
    {
        BeginNormalPaletteFade(0xFFFFFFFF, 16, 0, 16, 0xFFFF);
        gTasks[taskId].func = Task_IntroWaitToSetupPart3;
    }
    if (gIntroFrameCounter == 1109)
        gSprites[gTasks[taskId].data[1]].data0 = 1;
    if (gIntroFrameCounter == 1214)
        gSprites[gTasks[taskId].data[1]].data0 = 0;
    if (gIntroFrameCounter == 1394)
        gSprites[gTasks[taskId].data[2]].data0 = 1;
    if (gIntroFrameCounter == 1398)
        gSprites[gTasks[taskId].data[1]].data0 = 2;
    if (gIntroFrameCounter == 1586)
        gSprites[gTasks[taskId].data[1]].data0 = 3;
    if (gIntroFrameCounter == 1727)
        gSprites[gTasks[taskId].data[1]].data0 = 4;
    
    //TODO: Clean this up
    a = (((u16)gTasks[taskId].data[3] << 16) >> 18) & 0x7F;
    sine = Sin(a, 48);
    gUnknown_0203935A = sine;
    if (gTasks[taskId].data[3] < 512)
        gTasks[taskId].data[3]++;
#ifdef SAPPHIRE
    sub_8149020(0);
#else
    sub_8149020(1);
#endif
}

static void Task_IntroWaitToSetupPart3(u8 taskId)
{
    if (gIntroFrameCounter > 2068)
    {
        DestroyTask(gTasks[taskId].data[0]);
        gTasks[taskId].func = Task_IntroLoadPart3Graphics;
    }
}

static void Task_IntroLoadPart3Graphics(u8 taskId)
{
    intro_reset_and_hide_bgs();
    LZ77UnCompVram(gIntro3Pokeball_Gfx, (void *)VRAM);
    LZ77UnCompVram(gIntro3Pokeball_Tilemap, (void *)(VRAM + 0x4000));
    LoadPalette(gIntro3PokeballPal, 0, 0x200);
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = 0;
    gTasks[taskId].data[2] = 0;
    gTasks[taskId].data[3] = 0;
    sub_813CE30(0x78, 0x50, 0, 0);
    ResetSpriteData();
    FreeAllSpritePalettes();
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0x10, 0, 0xFFFF);
    REG_BG2CNT = 0x4883;
    REG_DISPCNT = DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG2_ON | DISPCNT_OBJ_ON;
    gTasks[taskId].func = Task_IntroSpinAndZoomPokeball;
    gIntroFrameCounter = 0;
    m4aSongNumStart(0x1BA);
}

static void Task_IntroSpinAndZoomPokeball(u8 taskId)
{
    gTasks[taskId].data[0] += 0x400;
    if (gTasks[taskId].data[1] <= 0x6BF)
    {
        gTasks[taskId].data[1] += gTasks[taskId].data[2];
        gTasks[taskId].data[2]++;
    }
    else
    {
        gTasks[taskId].func = Task_IntroWaitToSetupPart3DoubleFight;
    }
    sub_813CE30(0x78, 0x50, 0x10000 / gTasks[taskId].data[1], gTasks[taskId].data[0]);
    if (gIntroFrameCounter == 44)
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0x10, 0xFFFF);
}

static void Task_IntroWaitToSetupPart3DoubleFight(u8 taskId)
{
    if (gIntroFrameCounter > 59)
        gTasks[taskId].func = Task_IntroLoadPart3Streaks;
}

extern u8 unk_2000000[][32];

static void Task_IntroLoadPart3Streaks(u8 taskId)
{
    u16 i;
    void *vram;
    
    intro_reset_and_hide_bgs();
    for (i = 0; i < 32; i++)
    {
        unk_2000000[0][i] = 0;
        unk_2000000[1][i] = 17;
        unk_2000000[2][i] = 34;
    }
    vram = (void *)VRAM;
    DmaCopy16(3, unk_2000000, vram, 0x60);
    for (i = 0; i < 0x280; i++)
        ((u16 *)(VRAM + 0x3000))[i] = 0xF001;
    for (i = 0; i < 0x80; i++)
        ((u16 *)(VRAM + 0x3800))[i] = 0xF002;
    for (i = 0; i < 0x180; i++)
        ((u16 *)(VRAM + 0x3900))[i] = 0xF000;
    for (i = 0; i < 0x80; i++)
        ((u16 *)(VRAM + 0x3C00))[i] = 0xF002;
    gPlttBufferUnfaded[0xF0] = RGB_WHITE;
    gPlttBufferFaded[0xF0] = RGB_WHITE;
    sub_813D084(1);
    gPlttBufferUnfaded[0xF2] = RGB_BLACK;
    gPlttBufferFaded[0xF2] = RGB_BLACK;
    LZ77UnCompVram(gIntro3Streaks_Gfx, (void *)(VRAM + 0x4000));
    LZ77UnCompVram(gIntro3Streaks_Tilemap, (void *)(VRAM + 0x7000));
    LoadPalette(gIntro3Streaks_Pal, 0, 0x20);
    ResetSpriteData();
    FreeAllSpritePalettes();
    gReservedSpritePaletteCount = 8;
    LoadCompressedObjectPic(&gIntro3PokeballGfx_Table);
    LoadCompressedObjectPic(&gIntro3MiscGfx_Table);
    LoadCompressedObjectPalette(&gInterfacePokeballPal_Table);
    LoadSpritePalettes(gIntro3MiscPal_Table);
    gTasks[taskId].func = task_intro_14;
}

static void task_intro_14(u8 taskId)
{
    REG_WIN0H = 0xF0;
    REG_WIN0V = 0xA0;
    REG_WININ = 0x1C;
    REG_WINOUT = 0x1D;
    REG_BG3CNT = 0x603;
    REG_BG0CNT = 0x700;
    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG3_ON | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON;
    gTasks[taskId].data[15] = CreateTask(task_intro_20, 0);
    gTasks[gTasks[taskId].data[15]].data[0] = 0;
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].func = task_intro_15;
}

static void task_intro_15(u8 taskId)
{
    u16 foo = gTasks[taskId].data[0];
    
    if (gTasks[taskId].data[0] != 32)
    {
        u32 bar; //needed to match for some reason
        
        gTasks[taskId].data[0] += 4;
        REG_WIN0V = (gTasks[taskId].data[0] * 256) - (bar = foo - 0x9C);
    }
    else
    {
        REG_WIN0V = 0x2080;
        gTasks[taskId].func = task_intro_16;
    }
}

static void task_intro_16(u8 taskId)
{
    gTasks[taskId].func = task_intro_17;
}

static void task_intro_17(u8 taskId)
{
    gUnknown_0203931A = 0;
    gTasks[taskId].func = Task_IntroPokemonBattle;
}

void Task_IntroPokemonBattle(u8 taskId)
{
    u8 spriteId;
    
    if (gIntroFrameCounter == 80)
    {
        spriteId = sub_813CE88(SPECIES_SHARPEDO, 0xF0, 0xA0, 5, 1);
        gSprites[spriteId].callback = sub_813DB9C;
        gSprites[spriteId].data1 = 1;
        gSprites[spriteId].data2 = 0;
    }
    if (gIntroFrameCounter == 152)
    {
        spriteId = sub_813CE88(SPECIES_DUSKULL, 0, 0xA0, 4, 1);
        gSprites[spriteId].callback = sub_813DB9C;
        gSprites[spriteId].data1 = 2;
        gSprites[spriteId].data2 = 1;
    }
    if (gIntroFrameCounter == 219)
    {
        sub_813D084(0);
        spriteId = sub_813CFA8(gUnknown_02039318, 0x110, 0x60, 6);
        gSprites[spriteId].callback = sub_813DE70;
        gTasks[taskId].data[1] = spriteId;
    }
    if (gIntroFrameCounter == 304)
    {
        gTasks[gTasks[taskId].data[15]].data[0] = 4;
        gSprites[gTasks[taskId].data[1]].data0 = 2;
    }
    if (gIntroFrameCounter == 384)
    {
        gTasks[gTasks[taskId].data[15]].data[0] = 0;
        gSprites[gTasks[taskId].data[1]].data0 = 4;
    }
    if (gIntroFrameCounter == 400)
    {
        BeginNormalPaletteFade(0xFF0000, 0, 0x10, 0, 0x7EFF);
    }
    if (gIntroFrameCounter == 432)
    {
        gSprites[gTasks[taskId].data[1]].data0 = 5;
    }
    if (gIntroFrameCounter == 462)
    {
        gSprites[gTasks[taskId].data[1]].data0 = 6;
        gTasks[gTasks[taskId].data[15]].data[0] = 2;
    }
    if (gIntroFrameCounter == 463)
    {
        sub_813D084(1);
        spriteId = sub_813CE88(SPECIES_SHARPEDO, 0xD0, 8, 5, 1);
        gSprites[spriteId].callback = sub_813E10C;
        gTasks[taskId].data[2] = spriteId;
        sub_813E7C0(spriteId);
    }
    if (gIntroFrameCounter == 539)
    {
        spriteId = sub_813CE88(SPECIES_DUSKULL, 0xF8, 0x10, 4, 1);
        gSprites[spriteId].callback = sub_813E10C;
        gTasks[taskId].data[3] = spriteId;
        sub_813E930(spriteId);
    }
    if (gIntroFrameCounter == 623)
    {
        gSprites[gTasks[taskId].data[2]].data0 = 2;
        gSprites[gTasks[taskId].data[3]].data0 = 2;
        gTasks[gTasks[taskId].data[15]].data[0] = 3;
    }
    if (gIntroFrameCounter == 624)
    {
        sub_813D084(0);
        spriteId = sub_813CE88(SPECIES_MUDKIP, 0x20, 0x98, 0, 0);
        gSprites[spriteId].callback = sub_813E210;
        gTasks[taskId].data[4] = spriteId;
        InitIntroMudkipAttackAnim(spriteId);
    }
    if (gIntroFrameCounter == 700)
    {
        spriteId = sub_813CE88(SPECIES_TORCHIC, -8, 0x90, 1, 0);
        gSprites[spriteId].callback = sub_813E210;
        gTasks[taskId].data[5] = spriteId;
        InitIntroTorchicAttackAnim(spriteId);
    }
    if (gIntroFrameCounter == 776)
    {
        gUnknown_0203931A = 1;
        gSprites[gTasks[taskId].data[4]].data0 = 2;
        gSprites[gTasks[taskId].data[5]].data0 = 2;
        gTasks[gTasks[taskId].data[15]].data[0] = 0;
    }
    if (gIntroFrameCounter == 781)
    {
        sub_813D084(2);
        gSprites[gTasks[taskId].data[2]].data0 = 3;
        gSprites[gTasks[taskId].data[3]].data0 = 3;
        gSprites[gTasks[taskId].data[4]].data0 = 3;
        gSprites[gTasks[taskId].data[5]].data0 = 3;
        spriteId = CreateSprite(&gSpriteTemplate_840B1F4, 0x78, 0x50, 15);
        gSprites[spriteId].invisible = 1;
    }
    if (gIntroFrameCounter == 800)
        PlaySE(SE_OP_BASYU);
    if (gIntroFrameCounter == 850)
        BeginNormalPaletteFade(0xFFFFFFFF, 4, 0, 0x10, 0xFFFF);
    if (gIntroFrameCounter == 946)
        gTasks[taskId].func = task_intro_19;
}

static void task_intro_19(u8 taskId)
{
    DestroyTask(taskId);
    SetMainCallback2(MainCB2_EndIntro);
}

void task_intro_20(u8 taskId)
{
    gTasks[taskId].data[15]++;
    switch (gTasks[taskId].data[0])
    {
    case 0:
        REG_DISPCNT = 0x3940;
        REG_BG2CNT = 0;
        gTasks[taskId].data[0] = 0xFF;
        break;
    case 2:
        BeginNormalPaletteFade(1, 0, 0x10, 0, 0xFFFF);
        REG_BG2CNT = 0x0E07;
        REG_DISPCNT = 0x3D40;
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].data[2] = 0;
        gTasks[taskId].data[0] = 20;
        //fall through
    case 20:
        REG_BG2VOFS = gTasks[taskId].data[1];
        REG_BG2HOFS = gTasks[taskId].data[2];
        gTasks[taskId].data[1] += 6;
        gTasks[taskId].data[2] -= 8;
        break;
    case 3:
        BeginNormalPaletteFade(1, 0, 0x10, 0, 0xFFFF);
        REG_BG2CNT = 0x0E07;
        REG_DISPCNT = 0x3D40;
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].data[2] = 0;
        gTasks[taskId].data[0] = 0x1E;
        //fall through
    case 0x1E:
        REG_BG2VOFS = gTasks[taskId].data[1];
        REG_BG2HOFS = gTasks[taskId].data[2];
        gTasks[taskId].data[1] -= 6;
        gTasks[taskId].data[2] += 8;
        break;
    case 4:
        BeginNormalPaletteFade(1, 5, 0, 0x10, 0x37F7);
        REG_BG2CNT = 0x0E07;
        REG_DISPCNT = 0x3D40;
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].data[2] = 0;
        gTasks[taskId].data[3] = 8;
        gTasks[taskId].data[0] = 0x28;
        //fall through
    case 0x28:
        REG_BG2VOFS = gTasks[taskId].data[1];
        REG_BG2HOFS = gTasks[taskId].data[2];
        gTasks[taskId].data[1] -= gTasks[taskId].data[3];
        gTasks[taskId].data[2] += gTasks[taskId].data[3];
        if (!(gTasks[taskId].data[15] & 7) && gTasks[taskId].data[3] != 0)
            gTasks[taskId].data[3]--;
        break;
    case 0xFF:  //needed to prevent jump table optimization
        break;
    }
}

void intro_reset_and_hide_bgs(void)
{
    REG_DISPCNT = 0;
    REG_BG3HOFS = 0;
    REG_BG3VOFS = 0;
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    REG_BLDY = 0;
}

#ifdef NONMATCHING
void sub_813CCE8(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
    default:
    case 0:
        REG_BLDCNT = 0x3F50;
        REG_BLDALPHA = 0x1000;
        REG_BLDY = 0;
        gTasks[taskId].data[1] = 0x40;
        gTasks[taskId].data[0] = 1;
        return;
    case 1:
        if (gTasks[taskId].data[1] != 0)
        {
            u32 foo;
            u32 bar asm("r2");
            
            gTasks[taskId].data[1]--;
            //tail merge at _0813CDC2
            foo = gTasks[taskId].data[1] + (gTasks[taskId].data[1] < 0);
            bar = 0x1FE;
            REG_BLDALPHA = gUnknown_08393E64[(foo & bar) / 2];
        }
        else
        {
            REG_BLDALPHA = gUnknown_08393E64[0];
            gTasks[taskId].data[1] = 0x80;
            gTasks[taskId].data[0]++;
        }
        return;
    case 2:
        if (gTasks[taskId].data[1] != 0)
        {
            //tail merge at _0813CE0E
            gTasks[taskId].data[1]--;
        }
        else
        {
            gTasks[taskId].data[1] = 0;  //redundant?
            gTasks[taskId].data[0]++;
        }
        return;
    case 3:
        if (gTasks[taskId].data[1] <= 0x3D)
        {
            u32 foo;
            u32 bar asm("r2");
            
            gTasks[taskId].data[1]++;
            //_0813CDC2
            foo = gTasks[taskId].data[1] + (gTasks[taskId].data[1] < 0);
            bar = 0x1FE;
            REG_BLDALPHA = gUnknown_08393E64[(foo & bar) / 2];
        }
        else
        {
            //_0813CDE0
            REG_BLDALPHA = gUnknown_08393E64[0x1F];
            gTasks[taskId].data[1] = 0x10;
            gTasks[taskId].data[0]++;
        }
        return;
    case 4:
        if (gTasks[taskId].data[1] != 0)
        {
            gTasks[taskId].data[1]--;
        }
        else
        {
            REG_BLDCNT = 0;
            REG_BLDALPHA = 0;
            REG_BLDY = 0;
            DestroyTask(taskId);
        }
        return;
    }
}
#else
__attribute__((naked))
void sub_813CCE8(u8 taskId)
{
    asm("\n\
    .equ REG_BLDCNT, 0x4000050\n\
    .equ REG_BLDALPHA, 0x4000052\n\
    .syntax unified\n\
    push {r4,lr}\n\
    lsls r0, 24\n\
    lsrs r3, r0, 24\n\
    ldr r1, _0813CD0C @ =gTasks\n\
    lsls r0, r3, 2\n\
    adds r0, r3\n\
    lsls r0, 3\n\
    adds r0, r1\n\
    movs r2, 0x8\n\
    ldrsh r0, [r0, r2]\n\
    adds r2, r1, 0\n\
    cmp r0, 0x4\n\
    bhi _0813CD28\n\
    lsls r0, 2\n\
    ldr r1, _0813CD10 @ =_0813CD14\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_0813CD0C: .4byte gTasks\n\
_0813CD10: .4byte _0813CD14\n\
    .align 2, 0\n\
_0813CD14:\n\
    .4byte _0813CD28\n\
    .4byte _0813CD5C\n\
    .4byte _0813CD8C\n\
    .4byte _0813CDA8\n\
    .4byte _0813CDFC\n\
_0813CD28:\n\
    ldr r1, _0813CD54 @ =REG_BLDCNT\n\
    ldr r4, _0813CD58 @ =0x00003f50\n\
    adds r0, r4, 0\n\
    strh r0, [r1]\n\
    adds r1, 0x2\n\
    movs r4, 0x80\n\
    lsls r4, 5\n\
    adds r0, r4, 0\n\
    strh r0, [r1]\n\
    adds r1, 0x2\n\
    movs r0, 0\n\
    strh r0, [r1]\n\
    lsls r0, r3, 2\n\
    adds r0, r3\n\
    lsls r0, 3\n\
    adds r0, r2\n\
    movs r1, 0x40\n\
    strh r1, [r0, 0xA]\n\
    movs r1, 0x1\n\
    strh r1, [r0, 0x8]\n\
    b _0813CE26\n\
    .align 2, 0\n\
_0813CD54: .4byte REG_BLDCNT\n\
_0813CD58: .4byte 0x00003f50\n\
_0813CD5C:\n\
    lsls r0, r3, 2\n\
    adds r0, r3\n\
    lsls r0, 3\n\
    adds r2, r0, r2\n\
    ldrh r1, [r2, 0xA]\n\
    movs r3, 0xA\n\
    ldrsh r0, [r2, r3]\n\
    cmp r0, 0\n\
    beq _0813CD78\n\
    subs r0, r1, 0x1\n\
    strh r0, [r2, 0xA]\n\
    movs r4, 0xA\n\
    ldrsh r0, [r2, r4]\n\
    b _0813CDC2\n\
_0813CD78:\n\
    ldr r1, _0813CD84 @ =REG_BLDALPHA\n\
    ldr r0, _0813CD88 @ =gUnknown_08393E64\n\
    ldrh r0, [r0]\n\
    strh r0, [r1]\n\
    movs r0, 0x80\n\
    b _0813CDEA\n\
    .align 2, 0\n\
_0813CD84: .4byte REG_BLDALPHA\n\
_0813CD88: .4byte gUnknown_08393E64\n\
_0813CD8C:\n\
    lsls r0, r3, 2\n\
    adds r0, r3\n\
    lsls r0, 3\n\
    adds r1, r0, r2\n\
    ldrh r0, [r1, 0xA]\n\
    movs r3, 0xA\n\
    ldrsh r2, [r1, r3]\n\
    cmp r2, 0\n\
    bne _0813CE0E\n\
    strh r2, [r1, 0xA]\n\
    ldrh r0, [r1, 0x8]\n\
    adds r0, 0x1\n\
    strh r0, [r1, 0x8]\n\
    b _0813CE26\n\
_0813CDA8:\n\
    lsls r0, r3, 2\n\
    adds r0, r3\n\
    lsls r0, 3\n\
    adds r2, r0, r2\n\
    ldrh r1, [r2, 0xA]\n\
    movs r4, 0xA\n\
    ldrsh r0, [r2, r4]\n\
    cmp r0, 0x3D\n\
    bgt _0813CDE0\n\
    adds r0, r1, 0x1\n\
    strh r0, [r2, 0xA]\n\
    movs r1, 0xA\n\
    ldrsh r0, [r2, r1]\n\
_0813CDC2:\n\
    lsrs r1, r0, 31\n\
    adds r0, r1\n\
    movs r2, 0xFF\n\
    lsls r2, 1\n\
    ldr r3, _0813CDD8 @ =REG_BLDALPHA\n\
    ldr r1, _0813CDDC @ =gUnknown_08393E64\n\
    ands r0, r2\n\
    adds r0, r1\n\
    ldrh r0, [r0]\n\
    strh r0, [r3]\n\
    b _0813CE26\n\
    .align 2, 0\n\
_0813CDD8: .4byte REG_BLDALPHA\n\
_0813CDDC: .4byte gUnknown_08393E64\n\
_0813CDE0:\n\
    ldr r1, _0813CDF4 @ =REG_BLDALPHA\n\
    ldr r0, _0813CDF8 @ =gUnknown_08393E64\n\
    ldrh r0, [r0, 0x3E]\n\
    strh r0, [r1]\n\
    movs r0, 0x10\n\
_0813CDEA:\n\
    strh r0, [r2, 0xA]\n\
    ldrh r0, [r2, 0x8]\n\
    adds r0, 0x1\n\
    strh r0, [r2, 0x8]\n\
    b _0813CE26\n\
    .align 2, 0\n\
_0813CDF4: .4byte REG_BLDALPHA\n\
_0813CDF8: .4byte gUnknown_08393E64\n\
_0813CDFC:\n\
    lsls r0, r3, 2\n\
    adds r0, r3\n\
    lsls r0, 3\n\
    adds r1, r0, r2\n\
    ldrh r0, [r1, 0xA]\n\
    movs r4, 0xA\n\
    ldrsh r2, [r1, r4]\n\
    cmp r2, 0\n\
    beq _0813CE14\n\
_0813CE0E:\n\
    subs r0, 0x1\n\
    strh r0, [r1, 0xA]\n\
    b _0813CE26\n\
_0813CE14:\n\
    ldr r0, _0813CE2C @ =REG_BLDCNT\n\
    strh r2, [r0]\n\
    adds r0, 0x2\n\
    strh r2, [r0]\n\
    adds r0, 0x2\n\
    strh r2, [r0]\n\
    adds r0, r3, 0\n\
    bl DestroyTask\n\
_0813CE26:\n\
    pop {r4}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0813CE2C: .4byte REG_BLDCNT\n\
    .syntax divided\n");
}
#endif

void sub_813CE30(u16 scrX, u16 scrY, u16 zoom, u16 alpha)
{
    struct BgAffineSrcData src;
    struct BgAffineDstData dest;
    
    src.texX = 0x8000;
    src.texY = 0x8000;
    src.scrX = scrX;
    src.scrY = scrY;
    src.sx = zoom;
    src.sy = zoom;
    src.alpha = alpha;
    BgAffineSet(&src, &dest, 1);
    REG_BG2PA = dest.pa;
    REG_BG2PB = dest.pb;
    REG_BG2PC = dest.pc;
    REG_BG2PD = dest.pd;
    REG_BG2X = dest.dx;
    REG_BG2Y = dest.dy;
}

u8 sub_813CE88(u16 species, s16 x, s16 y, u16 d, u8 front)
{
    void *pal;
    u8 spriteId;
    
    if (front)
        LoadSpecialPokePic(&gMonFrontPicTable[species], gMonFrontPicCoords[species].x, gMonFrontPicCoords[species].y, 0x2000000, gUnknown_0840B5A0[d], species, 0, 1);
    else
        LoadSpecialPokePic(&gMonBackPicTable[species], gMonBackPicCoords[species].x, gMonBackPicCoords[species].y, 0x2000000, gUnknown_0840B5A0[d], species, 0, 0);
    pal = species_and_otid_get_pal(species, 0, 0xFFFF);
    LoadCompressedPalette(pal, 0x100 + d * 0x10, 0x20);
    sub_8143648(d, d);
    spriteId = CreateSprite(&gUnknown_02024E8C, x, y, (d + 1) * 4);
    gSprites[spriteId].oam.paletteNum = d;
    gSprites[spriteId].oam.priority = 1;
    return spriteId;
}

u8 sub_813CFA8(u16 a, u16 b, u16 c, u16 d)
{
    u8 spriteId;
    
    DecompressPicFromTable_2(&gTrainerBackPicTable[a], gTrainerBackPicCoords[a].x, gTrainerBackPicCoords[a].y, (void *)0x2000000, gUnknown_0840B5A0[d], a);
    LoadCompressedPalette(gTrainerBackPicPaletteTable[a].data, 0x100 + d * 0x10, 0x20);
    sub_8143680(d, d);
    gUnknown_02024E8C.anims = gUnknown_0840B064;
    spriteId = CreateSprite(&gUnknown_02024E8C, b, c, 1);
    gSprites[spriteId].oam.paletteNum = d;
    gSprites[spriteId].oam.priority = 1;
    return spriteId;
}

void sub_813D084(u8 a)
{
    u16 color;
    
    switch (a)
    {
    default:
    case 0:
        color = RGB(22, 31, 15);
        break;
    case 1:
        color = RGB(31, 14, 12);
        break;
    case 2:
        color = RGB(12, 12, 20);
        break;
    }
    gPlttBufferUnfaded[241] = color;
    gPlttBufferFaded[241] = color;
}

void sub_813D0CC(struct Sprite *sprite)
{
    u8 r0;
    
    if (sprite->data2 >= 192)
    {
        if (sprite->data3 != 0)
        {
            sprite->data3--;
        }
        else
        {
            sprite->invisible = FALSE;
            SetOamMatrix(sprite->data1, sprite->data2, 0, 0, sprite->data2);
            sprite->data2 = (sprite->data2 * 95) / 100;
            r0 = (sprite->data2 - 192) / 128 + 9;
            if (r0 > 15)
                r0 = 15;
            sprite->oam.paletteNum = r0;
        }
    }
    else
    {
        DestroySprite(sprite);
    }
}

void sub_813D158(struct Sprite *sprite)
{
    if (gSprites[sprite->data7].data7 != 0)
    {
        sprite->invisible = TRUE;
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        StartSpriteAnim(sprite, 3);
        sprite->data2 = 1024;
        sprite->data3 = 8 * (sprite->data1 & 3);
        sprite->callback = sub_813D0CC;
        sprite->oam.shape = 1;
        sprite->oam.size = 3;
        CalcCenterToCornerVec(sprite, 1, 3, 2);
    }
    else
    {
        sprite->pos2.x = gSprites[sprite->data7].pos2.x;
        sprite->pos2.y = gSprites[sprite->data7].pos2.y;
        sprite->pos1.x = gSprites[sprite->data7].pos1.x;
        sprite->pos1.y = gSprites[sprite->data7].pos1.y;
    }
}

void sub_813D208(struct Sprite *sprite)
{
    if (sprite->data0 != 0)
        sprite->callback = sub_813D220;
}

void sub_813D220(struct Sprite *sprite)
{
    if (sprite->pos1.x <= 116)
    {
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.y = 0;
        sprite->pos1.x += 4;
        sprite->pos2.x = -4;
        sprite->data4 = 128;
        sprite->callback = sub_813D368;
    }
    else
    {
        u16 data2;
        u16 data3;
        u16 data4;
        s16 sin1;
        s16 sin2;
        s16 sin3;
        s16 sin4;
        s16 var1;
        s16 var2;
        s16 var3;
        s16 var4;
        s16 temp;
        
        data4 = sprite->data4;
        sin1 = gSineTable[(u8)data4];
        sin2 = gSineTable[(u8)(data4 + 64)];
        sprite->data4 += 2;
        sprite->pos2.y = sin1 / 32;
        sprite->pos1.x--;
        if (sprite->pos1.x & 1)
            sprite->pos1.y++;
        temp = -sin2 / 16;
        data2 = sprite->data2;
        data3 = sprite->data3;
        sin3 = gSineTable[(u8)(temp - 16)];
        sin4 = gSineTable[(u8)(temp + 48)];
        var1 = sin4 * data2 / 256;
        var2 = -sin3 * data3 / 256;
        var3 = sin3 * data2 / 256;
        var4 = sin4 * data3 / 256;
        SetOamMatrix(sprite->data1, data2, 0, 0, data3);
        SetOamMatrix(sprite->data1 + 1, var1, var3, var2, var4);
        SetOamMatrix(sprite->data1 + 2, var1, var3, var2 * 2, var4 * 2);
    }
}

void sub_813D368(struct Sprite *sprite)
{
    SetOamMatrix(sprite->data1, sprite->data6 + 64, 0, 0, sprite->data6 + 64);
    SetOamMatrix(sprite->data1 + 1, sprite->data6 + 64, 0, 0, sprite->data6 + 64);
    SetOamMatrix(sprite->data1 + 2, sprite->data6 + 64, 0, 0, sprite->data6 + 64);
    if (sprite->data4 != 64)
    {
        u16 data4;
        
        sprite->data4 -= 8;
        data4 = sprite->data4;
        sprite->pos2.x = gSineTable[(u8)(data4 + 64)] / 64;
        sprite->pos2.y = gSineTable[(u8)data4] / 64;
    }
    else
    {
        sprite->data4 = 0;
        sprite->callback = sub_813D414;
    }
}

void sub_813D414(struct Sprite *sprite)
{
    if (sprite->data0 != 2)
    {
        s16 r2;
        
        sprite->data4 += 8;
        r2 = gSineTable[(u8)sprite->data4] / 16 + 64;
        sprite->pos2.x = gSineTable[(u8)(r2 + 64)] / 64;
        sprite->pos2.y = gSineTable[(u8)r2] / 64;
    }
    else
    {
        sprite->callback = SpriteCB_WaterDropFall;
    }
}

void SpriteCB_WaterDropFall(struct Sprite *sprite)
{
    if (sprite->pos1.y < sprite->data5)
    {
        sprite->pos1.y += 4;
    }
    else
    {
        sprite->data7 = 1;
        sprite->invisible = TRUE;
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        StartSpriteAnim(sprite, 3);
        sprite->data2 = 1024;
        sprite->data3 = 8 * (sprite->data1 & 3);
        sprite->callback = sub_813D0CC;
        sprite->oam.shape = 1;
        sprite->oam.size = 3;
        CalcCenterToCornerVec(sprite, 1, 3, 2);
    }
}

//Duplicate function
void SpriteCB_WaterDropFall_2(struct Sprite *sprite)
{
    if (sprite->pos1.y < sprite->data5)
    {
        sprite->pos1.y += 4;
    }
    else
    {
        sprite->data7 = 1;
        sprite->invisible = TRUE;
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        StartSpriteAnim(sprite, 3);
        sprite->data2 = 1024;
        sprite->data3 = 8 * (sprite->data1 & 3);
        sprite->callback = sub_813D0CC;
        sprite->oam.shape = 1;
        sprite->oam.size = 3;
        CalcCenterToCornerVec(sprite, 1, 3, 2);
    }
}

u8 CreateWaterDrop(s16 x, s16 y, u16 c, u16 d, u16 e, u8 fallImmediately)
{
    u8 spriteId;
    u8 oldSpriteId;
    
    spriteId = CreateSprite(&gSpriteTemplate_840AE20, x, y, 0);
    gSprites[spriteId].data0 = 0;
    gSprites[spriteId].data7 = 0;
    gSprites[spriteId].data1 = d;
    gSprites[spriteId].data2 = c;
    gSprites[spriteId].data3 = c;
    gSprites[spriteId].data5 = e;
    gSprites[spriteId].data6 = c;
    gSprites[spriteId].oam.affineMode = 3;
    gSprites[spriteId].oam.matrixNum = d;
    CalcCenterToCornerVec(&gSprites[spriteId], 0, 2, 2);
    StartSpriteAnim(&gSprites[spriteId], 2);
    if (!fallImmediately)
        gSprites[spriteId].callback = sub_813D208;
    else
        gSprites[spriteId].callback = SpriteCB_WaterDropFall_2;
    oldSpriteId = spriteId;
    
    spriteId = CreateSprite(&gSpriteTemplate_840AE20, x, y, 0);
    gSprites[spriteId].data7 = oldSpriteId;
    gSprites[spriteId].data1 = d + 1;
    gSprites[spriteId].oam.affineMode = 3;
    gSprites[spriteId].oam.matrixNum = d + 1;
    CalcCenterToCornerVec(&gSprites[spriteId], 0, 2, 2);
    gSprites[spriteId].callback = sub_813D158;
    
    spriteId = CreateSprite(&gSpriteTemplate_840AE20, x, y, 0);
    gSprites[spriteId].data7 = oldSpriteId;
    gSprites[spriteId].data1 = d + 2;
    StartSpriteAnim(&gSprites[spriteId], 1);
    gSprites[spriteId].oam.affineMode = 3;
    gSprites[spriteId].oam.matrixNum = d + 2;
    CalcCenterToCornerVec(&gSprites[spriteId], 0, 2, 2);
    gSprites[spriteId].callback = sub_813D158;
    
    SetOamMatrix(d, c + 32, 0, 0, c + 32);
    SetOamMatrix(d + 1, c + 32, 0, 0, c + 32);
    SetOamMatrix(d + 2, c + 32, 0, 0, 2 * (c + 32));
    
    return oldSpriteId;
}

void sub_813D788(struct Sprite *sprite)
{
    switch (sprite->data0)
    {
        case 0:
            StartSpriteAnimIfDifferent(sprite, 0);
            sprite->pos1.x--;
            break;
        case 1:
            StartSpriteAnimIfDifferent(sprite, 0);
            if (gIntroFrameCounter & 7)
                return;
            sprite->pos1.x++;
            break;
        case 2:
            StartSpriteAnimIfDifferent(sprite, 2);
            if (sprite->pos1.x <= 120 || (gIntroFrameCounter & 7))
                sprite->pos1.x++;
            break;
        case 3:
            StartSpriteAnimIfDifferent(sprite, 3);
            break;
        case 4:
            StartSpriteAnimIfDifferent(sprite, 0);
            if (sprite->pos1.x > -32)
                sprite->pos1.x -= 2;
            break;
    }
    if (gIntroFrameCounter & 7)
        return;
    if (sprite->pos2.y != 0)
    {
        sprite->pos2.y = 0;
    }
    else
    {
        switch (Random() & 3)
        {
            case 0:
                sprite->pos2.y = -1;
                break;
            case 1:
                sprite->pos2.y = 1;
                break;
            case 2:
            case 3:
                sprite->pos2.y = 0;
                break;
        }
    }
}

void sub_813D880(struct Sprite *sprite)
{
    switch (sprite->data0)
    {
        case 0:
            break;
        case 1:
            if (sprite->pos2.x + sprite->pos1.x < 304)
                sprite->pos2.x += 8;
            else
                sprite->data0 = 2;
            break;
        case 2:
            if (sprite->pos2.x + sprite->pos1.x > 120)
                sprite->pos2.x -= 1;
            else
                sprite->data0 = 3;
            break;
        case 3:
            if (sprite->pos2.x > 0)
                sprite->pos2.x -= 2;
            break;
    }
    sprite->pos2.y = Sin((u8)sprite->data1, 8) - gUnknown_0203935A;
    sprite->data1 += 4;
}

void sub_813D908(struct Sprite *sprite)
{
    if (gTasks[sprite->data0].data[0] == 0)
    {
        sprite->invisible = TRUE;
    }
    else if (gTasks[sprite->data0].data[0] != 4)
    {
        sprite->invisible = FALSE;
    }
    else
    {
        DestroySprite(sprite);
    }
}

u8 CreateGameFreakLogo(s16 a, s16 b, u8 c)
{
    u8 spriteId;
    u16 i;
    
    for (i = 0; i < 9; i++)
    {
        spriteId = CreateSprite(&gSpriteTemplate_840AF94, gUnknown_0840AF50[i][1] + a, b - 4, 0);
        gSprites[spriteId].data0 = c;
        StartSpriteAnim(&gSprites[spriteId], gUnknown_0840AF50[i][0]);
    }
    for (i = 0; i < 8; i++)
    {
        spriteId = CreateSprite(&gSpriteTemplate_840AFAC, gUnknown_0840AF74[i][1] + a, b + 12, 0);
        gSprites[spriteId].data0 = c;
        StartSpriteAnim(&gSprites[spriteId], gUnknown_0840AF74[i][0]);
    }
    spriteId = CreateSprite(&gSpriteTemplate_840AFC4, 120, b - 4, 0);
    gSprites[spriteId].data0 = c;
    
    return spriteId;
}

#ifdef NONMATCHING
void sub_813DA64(struct Sprite *sprite)
{
    sprite->data7++;
    
    switch(sprite->data0)
    {
    case 0:
    default:
        sprite->oam.affineMode = 3;
        sprite->oam.matrixNum = 1;
        CalcCenterToCornerVec(sprite, 1, 3, 3);
        sprite->invisible = FALSE;
        sprite->data0 = 1;
        sprite->data1 = 128;
        sprite->data2 = -24;
        sprite->data3 = 0;
        break;
    case 1:
    {
        s16 r3;
        s16 sin1;
        s16 r6;
        s16 foo;
        s16 r5;
        s16 r2;
        
        //_0813DAC0
        if (sprite->data3 < 0x50)
        {
            sprite->pos2.y = -Sin((u8)sprite->data3, 0x78);
            sprite->pos2.x = -Sin((u8)sprite->data3, 0x8C);
            if (sprite->data3 > 64)
                sprite->oam.priority = 3;
        }
        //_0813DAF8
        r3 = gSineTable[(u8)sprite->data2];
        sin1 = gSineTable[(u8)(sprite->data2 + 64)];
        r6 = sin1 * sprite->data1 / 256;
        foo = sin1 * sprite->data1 / 256;
        r5 = -r3 * sprite->data1 / 256;
        r2 = r3 * sprite->data1 / 256;
        
        SetOamMatrix(1, r6, r2, r5, foo);
        
        if (sprite->data1 < 0x100)
            sprite->data1 += 8;
        else
            sprite->data1 += 32;
        if (sprite->data2 < 0x18)
            sprite->data2 += 1;
        if (sprite->data3 < 64)
            sprite->data3 += 2;
        else if (!(sprite->data7 & 3))
            sprite->data3 += 1;
        break;
    }
    }
    //_0813DB92
}
#else
__attribute__((naked))
void sub_813DA64(struct Sprite *sprite)
{
    asm(".syntax unified\n\
	push {r4-r6,lr}\n\
	sub sp, 0x4\n\
	adds r4, r0, 0\n\
	ldrh r0, [r4, 0x3C]\n\
	adds r0, 0x1\n\
	strh r0, [r4, 0x3C]\n\
	movs r1, 0x2E\n\
	ldrsh r0, [r4, r1]\n\
	cmp r0, 0\n\
	beq _0813DA7C\n\
	cmp r0, 0x1\n\
	beq _0813DAC0\n\
_0813DA7C:\n\
	ldrb r0, [r4, 0x1]\n\
	movs r1, 0x3\n\
	orrs r0, r1\n\
	strb r0, [r4, 0x1]\n\
	ldrb r1, [r4, 0x3]\n\
	movs r0, 0x3F\n\
	negs r0, r0\n\
	ands r0, r1\n\
	movs r1, 0x2\n\
	orrs r0, r1\n\
	strb r0, [r4, 0x3]\n\
	adds r0, r4, 0\n\
	movs r1, 0x1\n\
	movs r2, 0x3\n\
	movs r3, 0x3\n\
	bl CalcCenterToCornerVec\n\
	adds r2, r4, 0\n\
	adds r2, 0x3E\n\
	ldrb r1, [r2]\n\
	movs r0, 0x5\n\
	negs r0, r0\n\
	ands r0, r1\n\
	strb r0, [r2]\n\
	movs r0, 0x1\n\
	strh r0, [r4, 0x2E]\n\
	movs r0, 0x80\n\
	strh r0, [r4, 0x30]\n\
	ldr r0, _0813DABC @ =0x0000ffe8\n\
	strh r0, [r4, 0x32]\n\
	movs r0, 0\n\
	b _0813DB92\n\
	.align 2, 0\n\
_0813DABC: .4byte 0x0000ffe8\n\
_0813DAC0:\n\
	ldrh r1, [r4, 0x34]\n\
	movs r2, 0x34\n\
	ldrsh r0, [r4, r2]\n\
	cmp r0, 0x4F\n\
	bgt _0813DAF8\n\
	lsls r0, r1, 24\n\
	lsrs r0, 24\n\
	movs r1, 0x78\n\
	bl Sin\n\
	negs r0, r0\n\
	strh r0, [r4, 0x26]\n\
	ldrh r0, [r4, 0x34]\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	movs r1, 0x8C\n\
	bl Sin\n\
	negs r0, r0\n\
	strh r0, [r4, 0x24]\n\
	movs r1, 0x34\n\
	ldrsh r0, [r4, r1]\n\
	cmp r0, 0x40\n\
	ble _0813DAF8\n\
	ldrb r0, [r4, 0x5]\n\
	movs r1, 0xC\n\
	orrs r0, r1\n\
	strb r0, [r4, 0x5]\n\
_0813DAF8:\n\
	ldr r2, _0813DB60 @ =gSineTable\n\
	ldrh r1, [r4, 0x32]\n\
	lsls r0, r1, 24\n\
	lsrs r0, 23\n\
	adds r0, r2\n\
	ldrh r3, [r0]\n\
	adds r1, 0x40\n\
	lsls r1, 24\n\
	lsrs r1, 23\n\
	adds r1, r2\n\
	movs r2, 0\n\
	ldrsh r0, [r1, r2]\n\
	movs r1, 0x30\n\
	ldrsh r2, [r4, r1]\n\
	adds r1, r0, 0\n\
	muls r1, r2\n\
	adds r0, r1, 0\n\
	cmp r1, 0\n\
	bge _0813DB20\n\
	adds r0, 0xFF\n\
_0813DB20:\n\
	lsls r0, 8\n\
	lsrs r6, r0, 16\n\
	lsls r0, r3, 16\n\
	asrs r3, r0, 16\n\
	negs r0, r3\n\
	muls r0, r2\n\
	cmp r0, 0\n\
	bge _0813DB32\n\
	adds r0, 0xFF\n\
_0813DB32:\n\
	lsls r0, 8\n\
	lsrs r5, r0, 16\n\
	adds r0, r3, 0\n\
	muls r0, r2\n\
	cmp r0, 0\n\
	bge _0813DB40\n\
	adds r0, 0xFF\n\
_0813DB40:\n\
	lsls r0, 8\n\
	lsrs r2, r0, 16\n\
	adds r1, r6, 0\n\
	adds r3, r5, 0\n\
	str r1, [sp]\n\
	movs r0, 0x1\n\
	bl SetOamMatrix\n\
	ldrh r1, [r4, 0x30]\n\
	movs r2, 0x30\n\
	ldrsh r0, [r4, r2]\n\
	cmp r0, 0xFF\n\
	bgt _0813DB64\n\
	adds r0, r1, 0\n\
	adds r0, 0x8\n\
	b _0813DB68\n\
	.align 2, 0\n\
_0813DB60: .4byte gSineTable\n\
_0813DB64:\n\
	adds r0, r1, 0\n\
	adds r0, 0x20\n\
_0813DB68:\n\
	strh r0, [r4, 0x30]\n\
	ldrh r1, [r4, 0x32]\n\
	movs r2, 0x32\n\
	ldrsh r0, [r4, r2]\n\
	cmp r0, 0x17\n\
	bgt _0813DB78\n\
	adds r0, r1, 0x1\n\
	strh r0, [r4, 0x32]\n\
_0813DB78:\n\
	ldrh r2, [r4, 0x34]\n\
	movs r1, 0x34\n\
	ldrsh r0, [r4, r1]\n\
	cmp r0, 0x3F\n\
	bgt _0813DB86\n\
	adds r0, r2, 0x2\n\
	b _0813DB92\n\
_0813DB86:\n\
	ldrh r1, [r4, 0x3C]\n\
	movs r0, 0x3\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _0813DB94\n\
	adds r0, r2, 0x1\n\
_0813DB92:\n\
	strh r0, [r4, 0x34]\n\
_0813DB94:\n\
	add sp, 0x4\n\
	pop {r4-r6}\n\
	pop {r0}\n\
	bx r0\n\
    .syntax divided\n");
}
#endif

void sub_813DB9C(struct Sprite *sprite)
{
    switch (sprite->data0)
    {
    case 0:
    default:
        if (sprite->data2 != 0)
            sprite->hFlip = TRUE;
        else
            sprite->hFlip = FALSE;
        sprite->data0 = 1;
        //fall through
    case 1:
        if (sprite->pos1.y > 96)
        {
            sprite->pos1.y -= 4;
            if (sprite->data2 != 0)
                sprite->pos1.x += 2;
            else
                sprite->pos1.x -= 2;
        }
        else
        {
            sprite->data0++;
            sprite->data3 = 8;
        }
        break;
    case 2:
        if (sprite->data3 != 0)
        {
            sprite->data3--;
        }
        else
        {
            sprite->data0++;
            sprite->data3 = 0;  //redundant?
        }
        break;
    case 3:
        sprite->oam.affineMode = 3;
        sprite->oam.matrixNum = sprite->data1;
        CalcCenterToCornerVec(sprite, 0, 3, 3);
        if (sprite->data2 != 0)
            SetOamMatrix(sprite->data1, -256, 0, 0, 256);
        else
            SetOamMatrix(sprite->data1, 256, 0, 0, 256);
        sprite->data0++;
        sprite->data4 = 0;
        break;
    case 4:
        sprite->data4++;
        if (sprite->pos1.y + sprite->pos2.y > -32
         && sprite->pos1.x + sprite->pos2.x > -64)
        {
            u16 r2;
            
            sprite->pos2.y = -(sprite->data4 * sprite->data4) / 8;
            if (sprite->data2 != 0)
                sprite->pos2.x += sprite->data4;
            else
                sprite->pos2.x -= sprite->data4;
            if (sprite->data3 < 128)
                sprite->data3 += 8;
            r2 = 256 - sprite->data3;
            if (sprite->data2 != 0)
                SetOamMatrix(sprite->data1, -r2, 0, 0, r2);
            else
                SetOamMatrix(sprite->data1, r2, 0, 0, r2);
        }
        else
        {
            DestroySprite(sprite);
        } 
    }
}

void sub_813DD58(struct Sprite *sprite)
{
    switch (sprite->data0)
    {
    case 0:
    default:
        sprite->invisible = FALSE;
        sprite->oam.affineMode = 1;
        sprite->oam.matrixNum = sprite->data1;
        sprite->data3 = 2048;
        sprite->data0 = 1;
        //fall through
    case 1:
        if (sprite->data3 > 256)
        {
            sprite->data3 -= 128;
            if (sprite->data2 != 0)
                SetOamMatrix(sprite->data1, -sprite->data3, 0, 0, sprite->data3);
            else
                SetOamMatrix(sprite->data1, sprite->data3, 0, 0, sprite->data3);
        }
        else
        {
            if (sprite->data2 != 0)
                SetOamMatrix(sprite->data1, -256, 0, 0, 256);
            else
                SetOamMatrix(sprite->data1, 256, 0, 0, 256);
            sprite->data0++;
        }
        break;
    case 2:
        break;
    case 3:
        sprite->data4++;
        sprite->pos2.y = sprite->data4 * sprite->data4 / 32;
        if (sprite->data2 != 0)
            sprite->pos2.x = sprite->data4 / 4;
        else
            sprite->pos2.x = -(sprite->data4 / 4);
        break;
    }
}

void sub_813DE70(struct Sprite *sprite)
{
    switch (sprite->data0)
    {
    case 0:
    default:
        if (sprite->pos1.x > 40)
        {
            sprite->pos1.x -= 4;
        }
        else
        {
            StartSpriteAnim(sprite, 1);
            sprite->data6 = CreateSprite(&gSpriteTemplate_840B084, 16, 104, 100);
            sprite->data7 = CreateSprite(&gSpriteTemplate_840B084, 12, 106, 101);
            sprite->data0 = 1;
        }
        break;
    case 1:
        break;
    case 2:
        StartSpriteAnim(sprite, 2);
        gSprites[sprite->data6].data0 = 1;
        gSprites[sprite->data7].data0 = 2;
        sprite->data0++;
        break;
    case 3:
        if (sprite->pos1.y > 160)
        {
            sprite->invisible = 1;
            sprite->data0 = 1;
        }
        else
        {
            sprite->pos1.y += 2;
            sprite->pos1.x--;
        }
        break;
    case 4:
    {
        s16 r4, r5;
        
        r5 = gSprites[sprite->data6].pos1.x + gSprites[sprite->data6].pos2.x;
        r4 = gSprites[sprite->data6].pos1.y + gSprites[sprite->data6].pos2.y;
        DestroySprite(&gSprites[sprite->data6]);
        sprite->data6 = sub_813CE88(SPECIES_TORCHIC, r5, r4, 2, 1);
        gSprites[sprite->data6].callback = sub_813DD58;
        gSprites[sprite->data6].invisible = TRUE;
        gSprites[sprite->data6].data1 = 1;
        gSprites[sprite->data6].data2 = 1;
        sub_813E580(r5, r4);
        
        r5 = gSprites[sprite->data7].pos1.x + gSprites[sprite->data7].pos2.x;
        r4 = gSprites[sprite->data7].pos1.y + gSprites[sprite->data7].pos2.y;
        DestroySprite(&gSprites[sprite->data7]);
        sprite->data7 = sub_813CE88(SPECIES_MUDKIP, r5, r4, 3, 1);
        gSprites[sprite->data7].callback = sub_813DD58;
        gSprites[sprite->data7].invisible = TRUE;
        gSprites[sprite->data7].data1 = 2;
        gSprites[sprite->data7].data2 = 0;
        sub_813E580(r5, r4);
        
        BeginNormalPaletteFade(0xFF0000, 0, 16, 16, RGB(31, 23, 31));
        sprite->data0 = 1;
        break;
    }
    case 5:
        gSprites[sprite->data6].data0 = 3;
        gSprites[sprite->data7].data0 = 3;
        break;
    case 6:
        DestroySprite(&gSprites[sprite->data6]);
        DestroySprite(&gSprites[sprite->data7]);
        DestroySprite(sprite);
        break;
    }
}

void sub_813E10C(struct Sprite *sprite)
{
    switch (sprite->data0)
    {
    case 0:
    default:
        if (sprite->pos2.x > -56)
        {
            sprite->pos2.x -= 8;
            sprite->pos2.y += 6;
        }
        else
        {
            sprite->data6 = sprite->pos1.x;
            sprite->data7 = sprite->pos1.y;
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->pos2.x = 0;
            sprite->pos2.y = 0;
            sprite->data0 = 1;
            sprite->data1 = 0;
        }
        break;
    case 1:
        if (!(sprite->data1 & 1))
        {
            if (sprite->data1 & 2)
            {
                sprite->pos2.x = -1;
                sprite->pos2.y = 1;
            }
            else
            {
                sprite->pos2.x = 0;
                sprite->pos2.y = 0;
            }
        }
        sprite->data1++;
        break;
    case 2:
        sprite->invisible = TRUE;
        sprite->pos1.x = sprite->data6;
        sprite->pos1.y = sprite->data7;
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        break;
    case 3:
        sprite->invisible = FALSE;
        sprite->data1++;
        //fall through
    case 4:
        if (sprite->pos2.x > -56)
        {
            sprite->pos2.x -= 4;
            sprite->pos2.y += 3;
        }
        else
        {
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->pos2.x = 0;
            sprite->pos2.y = 0;
            sprite->data0 = 1;
        }
        break;
    }
}

void sub_813E210(struct Sprite *sprite)
{
    switch (sprite->data0)
    {
    case 0:
    default:
        if (sprite->pos2.x < 56)
        {
            sprite->pos2.x += 8;
            sprite->pos2.y -= 6;
        }
        else
        {
            sprite->data6 = sprite->pos1.x;
            sprite->data7 = sprite->pos1.y;
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->pos2.x = 0;
            sprite->pos2.y = 0;
            sprite->data0 = 1;
            sprite->data1 = 0;
        }
        break;
    case 1:
        if (!(sprite->data1 & 1))
        {
            if (sprite->data1 & 2)
            {
                sprite->pos2.x = 1;
                sprite->pos2.y = -1;
            }
            else
            {
                sprite->pos2.x = 0;
                sprite->pos2.y = 0;
            }
        }
        sprite->data1++;
        break;
    case 2:
        sprite->invisible = TRUE;
        sprite->pos1.x = sprite->data6;
        sprite->pos1.y = sprite->data7;
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        break;
    case 3:
        sprite->invisible = FALSE;
        sprite->data1++;
        //fall through
    case 4:
        if (sprite->pos2.x < 56)
        {
            sprite->pos2.x += 4;
            sprite->pos2.y -= 3;
        }
        else
        {
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->pos2.x = 0;
            sprite->pos2.y = 0;
            sprite->data0 = 1;
        }
        break;
    }
}

void sub_813E30C(struct Sprite *sprite)
{
    u16 r4, r1;
    
    sprite->data7++;
    switch (sprite->data0)
    {
    case 0:
    default:
        break;
    case 1:
        sprite->oam.affineMode = 1;
        sprite->oam.matrixNum = 1;
        sprite->data0 = 10;
        sprite->data4 = 36;
        //fall through
    case 10:
        if (sprite->pos1.x <= 144)
        {
            sprite->pos1.x += 4;
            sprite->pos1.y -= 1;
            sprite->pos2.y = -Sin((u8)sprite->data2, 24);
            sprite->data2 += 4;
        }
        sprite->data3 -= sprite->data4;
        if ((sprite->data7 & 1) && sprite->data4 != 0)
            sprite->data4--;
        r4 = gSineTable[(u8)sprite->data3];
        r1 = gSineTable[(u8)(sprite->data3 + 64)];
        SetOamMatrix(1, r1, r4, -r4, r1);
        break;
    case 2:
        sprite->oam.affineMode = 1;
        sprite->oam.matrixNum = 2;
        sprite->data0 = 20;
        sprite->data4 = 36;
        //fall through
    case 20:
        if (sprite->pos1.x <= 96)
        {
            sprite->pos1.x += 3;
            sprite->pos1.y -= 1;
            sprite->pos2.y = -Sin((u8)sprite->data2, 24);
            sprite->data2 += 4;
        }
        sprite->data3 -= sprite->data4;
        if ((sprite->data7 & 1) && sprite->data4 != 0)
            sprite->data4--;
        r4 = gSineTable[(u8)sprite->data3];
        r1 = gSineTable[(u8)(sprite->data3 + 64)];
        SetOamMatrix(2, r1, r4, -r4, r1);
        break;
    }
}

void sub_813E4B8(struct Sprite *sprite)
{
    u16 r4;
    u16 r2;
    u16 r1;
    
    sprite->data7++;
    if (sprite->data7 & 1)
        sprite->invisible = FALSE;
    else
        sprite->invisible = TRUE;
    if (sprite->data2 >= 64)
    {
        DestroySprite(sprite);
        return;
    }
    sprite->data2 += 2;
    r4 = Sin((u8)sprite->data2, 40);
    sprite->pos2.x = Cos((u8)(sprite->data0 * 32), r4);
    sprite->pos2.y = Sin((u8)(sprite->data0 * 32), r4);
    if (sprite->data0 == 0)
    {
        sprite->data3 -= sprite->data1;
        if ((sprite->data7 & 1) && sprite->data1 != 0)
            sprite->data1--;
        r2 = gSineTable[(u8)sprite->data3];
        r1 = gSineTable[(u8)(sprite->data3 + 64)];
        SetOamMatrix(16, r1, r2, -r2, r1);
    }
}

void sub_813E580(u16 a, u16 b)
{
    u8 i;
    u8 spriteId;
    
    for (i = 0; i < 8; i++)
    {
        spriteId = CreateSprite(&gSpriteTemplate_840B0B0, a, b, 0);
        gSprites[spriteId].oam.affineMode = 1;
        gSprites[spriteId].oam.matrixNum = 16;
        gSprites[spriteId].data0 = i;
        gSprites[spriteId].data1 = 32;
    }
}

void sub_813E5E0(struct Sprite *sprite)
{
    if (gUnknown_0203931A != 0)
    {
        DestroySprite(sprite);
    }
    else
    {
        sprite->invisible = gSprites[sprite->data0].invisible;
        if (sprite->data7 < 12)
            sprite->data7++;
        sprite->data6 += 4;
        sprite->pos1.x = sprite->data4 + gSineTable[(u8)(sprite->data3 + 64)] * sprite->data6 / 256;
        //This useless '+ 0' is needed to make the asm match
        sprite->pos1.y = sprite->data5 + gSineTable[(u8)(sprite->data3 + 0)] * sprite->data6 / 256;
        sprite->pos2.y = gSineTable[(u8)(sprite->data1 + 0)] * sprite->data7 / 256;
        sprite->data1 += 16;
        if (sprite->pos1.y > sprite->data2)
            DestroySprite(sprite);
    }
}

void sub_813E6C0(struct Sprite *sprite)
{
    u8 spriteId;
    u8 i;
    s16 var1;
    s16 var2;
    
    if (gUnknown_0203931A != 0)
    {
        DestroySprite(sprite);
    }
    else
    {
        sprite->data7++;
        sprite->invisible = TRUE;
        if (gSprites[sprite->data0].data0 == 1 && !(sprite->data7 & 3))
        {
            var1 = sprite->data1 + gSprites[sprite->data0].pos1.x;
            var2 = sprite->data2 + gSprites[sprite->data0].pos1.y;
            for (i = 0; i < 3; i++)
            {
                u8 r3 = gSprites[sprite->data0].subpriority - 1;
                //Make redundant copies of these variables to get the asm to match
                s16 _var1 = var1;
                s16 _var2 = var2;
                
                spriteId = CreateSprite(&gSpriteTemplate_840B0DC, _var1, _var2, r3);
                if (spriteId != 64)
                {
                    gSprites[spriteId].data0 = sprite->data0;
                    gSprites[spriteId].data1 = (((sprite->data7 >> 2) & 7) << 5) + i * 85;
                    gSprites[spriteId].data2 = sprite->data3;
                    gSprites[spriteId].data3 = 104;
                    gSprites[spriteId].data4 = var1;
                    gSprites[spriteId].data5 = var2;
                    gSprites[spriteId].data6 = 0;
                }
            }
        }
    }
}

void sub_813E7C0(u8 a)
{
    u8 spriteId;
    
    spriteId = CreateSprite(&gSpriteTemplate_840B0F4, 0, 0, 0);
    if (spriteId != 64)
    {
        gSprites[spriteId].data0 = a;
        gSprites[spriteId].data1 = -12;
        gSprites[spriteId].data2 = 0;
        gSprites[spriteId].data3 = 136;
    }
}

