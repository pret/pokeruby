#include "global.h"
#include "link.h"
#include "main.h"
#include "palette.h"
#include "rng.h"
#include "sprite.h"
#include "task.h"

struct GcmbStruct
{
    u16 gcmb_field_0;
    u8 gcmb_field_2;
};

extern u16 gUnknown_02039318;
extern u16 gUnknown_02039358;
extern u16 gUnknown_0203935A;

extern u32 gUnknown_03005ED0;
extern struct GcmbStruct gUnknown_03005EE0;
extern u16 gSaveFileStatus;

extern const u16 gUnknown_08406974[];
extern const u8 gUnknown_08406B74[];
extern const u8 gUnknown_08406F28[];
extern const u8 gUnknown_0840725C[];
extern const u8 gUnknown_0840754C[];
extern const u8 gUnknown_08407764[];
extern union AffineAnimCmd *gUnknown_0840AE80[];
extern const struct SpriteTemplate gSpriteTemplate_840AFF0;
extern const u8 gUnknown_0840B008[];
extern const u8 gUnknown_0840B018[];
extern const struct SpritePalette gUnknown_0840B028[];
extern const struct SpriteSheet gIntro2BrendanSpriteSheet;
extern const struct SpriteSheet gIntro2MaySpriteSheet;
extern const struct SpriteSheet gIntro2BicycleSpriteSheet;
extern const struct SpriteSheet gIntro2LatiosSpriteSheet;
extern const struct SpriteSheet gIntro2LatiasSpriteSheet;
extern const struct SpritePalette gIntro2SpritePalettes[];

extern const u8 gIntroCopyright_Gfx[];
extern const u16 gIntroCopyright_Pal[];
extern const u16 gIntroCopyright_Tilemap[];

extern void LoadCompressedObjectPic(struct SpriteSheet *);
extern void CB2_InitTitleScreen(void);
extern u8 sub_8148EC0(/*TODO: arg types*/);
extern u8 sub_8149310(/*TODO: arg types*/);
extern u8 sub_8149368(/*TODO: arg types*/);

void CB2_813B7EC(void);
void task_intro_1(u8);
void task_intro_2(u8);
void task_intro_3(u8);
void task_intro_4(u8);
void task_intro_5(u8);
void task_intro_6(u8);
void sub_813BF70(u8);
void sub_813C080(u8);
void intro_reset_and_hide_bgs(void);
void sub_813CCE8(u8);
u8 sub_813D584(/*TODO: arg types*/);
void sub_813D788(struct Sprite *);
void sub_813D880(struct Sprite *);
sub_813D954(/*TODO: arg types*/);

void sub_813B784(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void CB2_813B798(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    if (gMain.newKeys && !gPaletteFade.active)
        SetMainCallback2(CB2_813B7EC);
    else if (gUnknown_03005ED0 != -1)
        gUnknown_03005ED0++;
}

void CB2_813B7EC(void)
{
    if (!UpdatePaletteFade())
        SetMainCallback2(CB2_InitTitleScreen);
}

void sub_813B808(u16 a1, u16 a2, u16 a3)
{
    LZ77UnCompVram(gIntroCopyright_Gfx, (void *)(VRAM + a1));
    LoadPalette(gIntroCopyright_Pal, a3, 0x20);
    CpuCopy16(gIntroCopyright_Tilemap, (void *)(VRAM + a2), 0x500);
}

void SerialCb_CopyrightScreen(void)
{
    GameCubeMultiBoot_HandleSerialInterrupt(&gUnknown_03005EE0);
}

u8 SetUpCopyrightScreen(void)
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
        sub_813B808(0, 14336, 0);
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
        REG_DISPSTAT |= 8;
        SetVBlankCallback(sub_813B784);
        REG_DISPCNT = 320;
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
        CreateTask(task_intro_1, 0);
        SetMainCallback2(CB2_813B798);
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

void task_intro_1(u8 taskId)
{
    SetVBlankCallback(NULL);
    gUnknown_02039318 = Random() & 1;
    intro_reset_and_hide_bgs();
    REG_BG3VOFS = 0;
    REG_BG2VOFS = 0x50;
    REG_BG1VOFS = 0x18;
    REG_BG0VOFS = 0x28;
    LZ77UnCompVram(gUnknown_08407764, (void *)VRAM);
    LZ77UnCompVram(gUnknown_08406B74, (void *)(VRAM + 0x8000));
    DmaClear16(3, VRAM + 0x8800, 0x800);
    LZ77UnCompVram(gUnknown_08406F28, (void *)(VRAM + 0x9000));
    DmaClear16(3, VRAM + 0x9800, 0x800);
    LZ77UnCompVram(gUnknown_0840725C, (void *)(VRAM + 0xA000));
    DmaClear16(3, VRAM + 0xA800, 0x800);
    LZ77UnCompVram(gUnknown_0840754C, (void *)(VRAM + 0xB000));
    DmaClear16(3, VRAM + 0xB800, 0x800);
    LoadPalette(gUnknown_08406974, 0, 0x200);
    REG_BG3CNT = 0x9603;
    REG_BG2CNT = 0x9402;
    REG_BG1CNT = 0x9201;
    REG_BG0CNT = 0x9000;
    LoadCompressedObjectPic(gUnknown_0840B008);
    LoadCompressedObjectPic(gUnknown_0840B018);
    LoadSpritePalettes(gUnknown_0840B028);
    CpuCopy16(gPlttBufferUnfaded + 0x100, gPlttBufferUnfaded + 0x1F0, 0x20);
    CpuCopy16(gPlttBufferUnfaded + 0x100, gPlttBufferUnfaded + 0x1E1, 0x1E);
    CpuCopy16(gPlttBufferUnfaded + 0x100, gPlttBufferUnfaded + 0x1D2, 0x1C);
    CpuCopy16(gPlttBufferUnfaded + 0x100, gPlttBufferUnfaded + 0x1C3, 0x1A);
    CpuCopy16(gPlttBufferUnfaded + 0x100, gPlttBufferUnfaded + 0x1B4, 0x18);
    CpuCopy16(gPlttBufferUnfaded + 0x100, gPlttBufferUnfaded + 0x1A5, 0x16);
    CpuCopy16(gPlttBufferUnfaded + 0x100, gPlttBufferUnfaded + 0x196, 0x14);
    gTasks[taskId].data[0] = sub_813D584(0xEC, -14, 0x200, 1, 0x78, 0);
    gTasks[taskId].func = task_intro_2;
}

void task_intro_2(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0x10, 0, 0);
    SetVBlankCallback(sub_813B784);
    REG_DISPCNT = 0x1F40;
    gTasks[taskId].func = task_intro_3;
    gUnknown_03005ED0 = 0;
    m4aSongNumStart(0x19E);
    ResetSerial();
}

void task_intro_3(u8 taskId)
{
    if (gUnknown_03005ED0 == 0x4C)
        gSprites[gTasks[taskId].data[0]].data0 = 1;
    if (gUnknown_03005ED0 == 0xFB)
        gSprites[gTasks[taskId].data[0]].data0 = 2;
    if (gUnknown_03005ED0 == 0x170)
        sub_813D584(0x30, 0, 0x400, 5, 0x70, 1);
    if (gUnknown_03005ED0 == 0x180)
        sub_813D584(0xC8, 0x3C, 0x400, 9, 0x80, 1);
    if (gUnknown_03005ED0 == 0x230)
        sub_813D954(0x78, 0x50, CreateTask(sub_813CCE8, 0));
    if (gUnknown_03005ED0 > 0x2E3)
    {
        gTasks[taskId].data[1] = 0x50;
        gTasks[taskId].data[2] = 0;
        gTasks[taskId].data[3] = 0x18;
        gTasks[taskId].data[4] = 0;
        gTasks[taskId].data[5] = 0x28;
        gTasks[taskId].data[6] = 0;
        gTasks[taskId].func = task_intro_4;
    }
}

void task_intro_4(u8 taskId)
{
    if (gUnknown_03005ED0 <= 0x387)
    {
        s32 r2;
        
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
        if (gUnknown_03005ED0 == 0x370)
        {
            u8 spriteId = CreateSprite(&gSpriteTemplate_840AFF0, 0xC8, 0xA0, 10);
            
            gSprites[spriteId].invisible = 1;
        }
    }
    else
    {
        if (gUnknown_03005ED0 > 0x3EF)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0x10, 0xFFFF);
            gTasks[taskId].func = task_intro_5;
        }
    }
}

void task_intro_5(u8 taskId)
{
    if (gUnknown_03005ED0 > 0x402)
        gTasks[taskId].func = task_intro_6;
}

void task_intro_6(u8 taskId)
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
    gTasks[taskId].func = sub_813BF70;
}

void sub_813BF70(u8 taskId)
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
        spriteId = sub_8149310(0x110, 100);
    else
        spriteId = sub_8149368(0x110, 100);
    gSprites[spriteId].callback = sub_813D788;
    gSprites[spriteId].anims = gUnknown_0840AE80;
    gTasks[taskId].data[1] = spriteId;
#ifdef SAPPHIRE
    spriteId = sapphire_sub_81494A0(-0x40, 0x3C);
#else
    spriteId = sub_8149424(-0x40, 0x3C);
#endif
    gSprites[spriteId].callback = sub_813D880;
    gTasks[taskId].data[2] = spriteId;
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0x10, 0, 0xFFFF);
    SetVBlankCallback(sub_813B784);
#ifdef SAPPHIRE
    gTasks[taskId].data[0] = sub_8148EC0(0, 0x4000, 0x40, 0x10);
    sub_8148C78(0);
#else
    gTasks[taskId].data[0] = sub_8148EC0(1, 0x4000, 0x400, 0x10);
    sub_8148C78(1);
#endif
    gTasks[taskId].func = sub_813C080;
}
