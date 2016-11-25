#include "global.h"
#include "link.h"
#include "main.h"
#include "palette.h"
#include "rng.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

struct GcmbStruct
{
    u16 gcmb_field_0;
    u8 gcmb_field_2;
};

extern u16 gUnknown_02039318;
extern u16 gUnknown_0203931A;
extern u16 gUnknown_02039358;
extern u16 gUnknown_0203935A;

extern u32 gUnknown_03005ED0;
extern struct GcmbStruct gUnknown_03005EE0;
extern u16 gSaveFileStatus;
extern u8 gReservedSpritePaletteCount;

extern const u16 gUnknown_08406974[];
extern const u8 gUnknown_08406B74[];
extern const u8 gUnknown_08406F28[];
extern const u8 gUnknown_0840725C[];
extern const u8 gUnknown_0840754C[];
extern const u8 gUnknown_08407764[];
extern const u8 gUnknown_084098D4[];
extern const u8 gUnknown_08409AD4[];
extern const u8 gUnknown_08409C04[];
extern const u16 gUnknown_0840A758[];
extern const u8 gUnknown_0840A778[];
extern const u8 gUnknown_0840A7E4[];
extern union AnimCmd *gUnknown_0840AE80[];
extern const struct SpriteTemplate gSpriteTemplate_840AFF0;
extern const struct SpriteSheet gUnknown_0840B008;
extern const struct SpriteSheet gUnknown_0840B018;
extern const struct SpritePalette gUnknown_0840B028[];
extern const struct SpriteTemplate gSpriteTemplate_840B1F4;
extern const struct SpriteSheet gUnknown_0840B20C;
extern const struct SpriteSheet gUnknown_0840B21C;
extern const struct SpritePalette gUnknown_0840B22C;
extern const struct SpritePalette gUnknown_0840B23C[];
extern const struct SpriteSheet gIntro2BrendanSpriteSheet;
extern const struct SpriteSheet gIntro2MaySpriteSheet;
extern const struct SpriteSheet gIntro2BicycleSpriteSheet;
extern const struct SpriteSheet gIntro2LatiosSpriteSheet;
extern const struct SpriteSheet gIntro2LatiasSpriteSheet;
extern const struct SpritePalette gIntro2SpritePalettes[];

extern const u8 gIntroCopyright_Gfx[];
extern const u16 gIntroCopyright_Pal[];
extern const u16 gIntroCopyright_Tilemap[];

extern void LoadCompressedObjectPic(const struct SpriteSheet *);
extern void LoadCompressedObjectPalette(const struct SpritePalette *);
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
void task_intro_7(u8);
void task_intro_8(u8);
void task_intro_9(u8);
void task_intro_10(u8);
void task_intro_11(u8);
void task_intro_12(u8);
void task_intro_13(u8);
void task_intro_14(u8);
void task_intro_15(u8);
void task_intro_16(u8);
void task_intro_17(u8);
void task_intro_18(u8);
void task_intro_19(u8);
void sub_813CAF4(u8);
void intro_reset_and_hide_bgs(void);
void sub_813CCE8(u8);
void sub_813CE30(u16, u16, u16, u16);
u8 sub_813CE88(/*TODO: arg types*/);
u8 sub_813CFA8(/*TODO: arg types*/);
u8 sub_813D584(/*TODO: arg types*/);
void sub_813D788(struct Sprite *);
void sub_813D880(struct Sprite *);
sub_813D954(/*TODO: arg types*/);
void sub_813DB9C(struct Sprite *);
void sub_813DE70(struct Sprite *);
void sub_813E10C(struct Sprite *);
void sub_813E210(struct Sprite *);
void sub_813E7C0(u8);
void sub_813EB4C(u8);

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
    gTasks[taskId].func = task_intro_7;
}

void task_intro_7(u8 taskId)
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
    gTasks[taskId].func = task_intro_8;
}

#ifdef NONMATCHING
//TODO: Fix Sin() arguments
void task_intro_8(u8 taskId)
{
    s16 foo;
    u16 bar;
    
    asm("nop");
    if (gUnknown_03005ED0 > 0x71F)
    {
        BeginNormalPaletteFade(0xFFFFFFFF, 0x10, 0, 0x10, 0xFFFF);
        gTasks[taskId].func = task_intro_9;
    }
    if (gUnknown_03005ED0 == 0x455)
        gSprites[gTasks[taskId].data[1]].data0 = 1;
    if (gUnknown_03005ED0 == 0x4BE)
        gSprites[gTasks[taskId].data[1]].data0 = 0;
    if (gUnknown_03005ED0 == 0x572)
        gSprites[gTasks[taskId].data[2]].data0 = 1;
    if (gUnknown_03005ED0 == 0x576)
        gSprites[gTasks[taskId].data[1]].data0 = 2;
    if (gUnknown_03005ED0 == 0x632)
        gSprites[gTasks[taskId].data[1]].data0 = 3;
    if (gUnknown_03005ED0 == 0x6BF)
        gSprites[gTasks[taskId].data[1]].data0 = 4;
    
    //foo = (u32)gTasks[taskId].data[3] / 4;
    //gUnknown_0203935A = Sin(foo % 128, 0x30);
    foo = (gTasks[taskId].data[3] / 4);
    
    bar = Sin(foo & 0x7F, 0x30);
    gUnknown_0203935A = bar;
    if (gTasks[taskId].data[3] < 0x200)
        gTasks[taskId].data[3]++;
#ifdef SAPPHIRE
    sub_8149020(0);
#else
    sub_8149020(1);
#endif
}
#else
__attribute__((naked))
void task_intro_8(u8 taskId)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    sub sp, 0x4\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    adds r6, r4, 0\n\
    ldr r5, _0813C1BC @ =gUnknown_03005ED0\n\
    ldr r1, [r5]\n\
    ldr r0, _0813C1C0 @ =0x0000071f\n\
    cmp r1, r0\n\
    bls _0813C0B4\n\
    movs r0, 0x1\n\
    negs r0, r0\n\
    ldr r1, _0813C1C4 @ =0x0000ffff\n\
    str r1, [sp]\n\
    movs r1, 0x10\n\
    movs r2, 0\n\
    movs r3, 0x10\n\
    bl BeginNormalPaletteFade\n\
    ldr r1, _0813C1C8 @ =gTasks\n\
    lsls r0, r4, 2\n\
    adds r0, r4\n\
    lsls r0, 3\n\
    adds r0, r1\n\
    ldr r1, _0813C1CC @ =task_intro_9\n\
    str r1, [r0]\n\
_0813C0B4:\n\
    ldr r1, [r5]\n\
    ldr r0, _0813C1D0 @ =0x00000455\n\
    ldr r3, _0813C1C8 @ =gTasks\n\
    cmp r1, r0\n\
    bne _0813C0D8\n\
    ldr r2, _0813C1D4 @ =gSprites\n\
    lsls r0, r4, 2\n\
    adds r0, r4\n\
    lsls r0, 3\n\
    adds r0, r3\n\
    movs r7, 0xA\n\
    ldrsh r1, [r0, r7]\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r2\n\
    movs r1, 0x1\n\
    strh r1, [r0, 0x2E]\n\
_0813C0D8:\n\
    ldr r1, [r5]\n\
    ldr r0, _0813C1D8 @ =0x000004be\n\
    cmp r1, r0\n\
    bne _0813C0FA\n\
    ldr r2, _0813C1D4 @ =gSprites\n\
    lsls r0, r4, 2\n\
    adds r0, r4\n\
    lsls r0, 3\n\
    adds r0, r3\n\
    movs r7, 0xA\n\
    ldrsh r1, [r0, r7]\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r2\n\
    movs r1, 0\n\
    strh r1, [r0, 0x2E]\n\
_0813C0FA:\n\
    ldr r1, [r5]\n\
    ldr r0, _0813C1DC @ =0x00000572\n\
    cmp r1, r0\n\
    bne _0813C11C\n\
    ldr r2, _0813C1D4 @ =gSprites\n\
    lsls r0, r4, 2\n\
    adds r0, r4\n\
    lsls r0, 3\n\
    adds r0, r3\n\
    movs r7, 0xC\n\
    ldrsh r1, [r0, r7]\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r2\n\
    movs r1, 0x1\n\
    strh r1, [r0, 0x2E]\n\
_0813C11C:\n\
    ldr r1, [r5]\n\
    ldr r0, _0813C1E0 @ =0x00000576\n\
    cmp r1, r0\n\
    bne _0813C13E\n\
    ldr r2, _0813C1D4 @ =gSprites\n\
    lsls r0, r4, 2\n\
    adds r0, r4\n\
    lsls r0, 3\n\
    adds r0, r3\n\
    movs r7, 0xA\n\
    ldrsh r1, [r0, r7]\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r2\n\
    movs r1, 0x2\n\
    strh r1, [r0, 0x2E]\n\
_0813C13E:\n\
    ldr r1, [r5]\n\
    ldr r0, _0813C1E4 @ =0x00000632\n\
    cmp r1, r0\n\
    bne _0813C160\n\
    ldr r2, _0813C1D4 @ =gSprites\n\
    lsls r0, r4, 2\n\
    adds r0, r4\n\
    lsls r0, 3\n\
    adds r0, r3\n\
    movs r7, 0xA\n\
    ldrsh r1, [r0, r7]\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r2\n\
    movs r1, 0x3\n\
    strh r1, [r0, 0x2E]\n\
_0813C160:\n\
    ldr r1, [r5]\n\
    ldr r0, _0813C1E8 @ =0x000006bf\n\
    cmp r1, r0\n\
    bne _0813C182\n\
    ldr r2, _0813C1D4 @ =gSprites\n\
    lsls r0, r4, 2\n\
    adds r0, r4\n\
    lsls r0, 3\n\
    adds r0, r3\n\
    movs r4, 0xA\n\
    ldrsh r1, [r0, r4]\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r2\n\
    movs r1, 0x4\n\
    strh r1, [r0, 0x2E]\n\
_0813C182:\n\
    lsls r0, r6, 2\n\
    adds r0, r6\n\
    lsls r0, 3\n\
    adds r4, r0, r3\n\
    ldrh r0, [r4, 0xE]\n\
    lsls r0, 16\n\
    asrs r0, 18\n\
    movs r1, 0x7F\n\
    ands r0, r1\n\
    movs r1, 0x30\n\
    bl Sin\n\
    ldr r1, _0813C1EC @ =gUnknown_0203935A\n\
    strh r0, [r1]\n\
    ldrh r2, [r4, 0xE]\n\
    movs r7, 0xE\n\
    ldrsh r1, [r4, r7]\n\
    ldr r0, _0813C1F0 @ =0x000001ff\n\
    cmp r1, r0\n\
    bgt _0813C1AE\n\
    adds r0, r2, 0x1\n\
    strh r0, [r4, 0xE]\n\
_0813C1AE:\n"
#ifdef SAPPHIRE
    "movs r0, 0\n"
#else
    "movs r0, 0x1\n"
#endif
    "bl sub_8149020\n\
    add sp, 0x4\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0813C1BC: .4byte gUnknown_03005ED0\n\
_0813C1C0: .4byte 0x0000071f\n\
_0813C1C4: .4byte 0x0000ffff\n\
_0813C1C8: .4byte gTasks\n\
_0813C1CC: .4byte task_intro_9\n\
_0813C1D0: .4byte 0x00000455\n\
_0813C1D4: .4byte gSprites\n\
_0813C1D8: .4byte 0x000004be\n\
_0813C1DC: .4byte 0x00000572\n\
_0813C1E0: .4byte 0x00000576\n\
_0813C1E4: .4byte 0x00000632\n\
_0813C1E8: .4byte 0x000006bf\n\
_0813C1EC: .4byte gUnknown_0203935A\n\
_0813C1F0: .4byte 0x000001ff\n\
    .syntax divided\n");
}
#endif

void task_intro_9(u8 taskId)
{
    if (gUnknown_03005ED0 > 0x814)
    {
        DestroyTask(gTasks[taskId].data[0]);
        gTasks[taskId].func = task_intro_10;
    }
}

void task_intro_10(u8 taskId)
{
    intro_reset_and_hide_bgs();
    LZ77UnCompVram(gUnknown_08409C04, (void *)VRAM);
    LZ77UnCompVram(gUnknown_08409AD4, (void *)(VRAM + 0x4000));
    LoadPalette(gUnknown_084098D4, 0, 0x200);
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = 0;
    gTasks[taskId].data[2] = 0;
    gTasks[taskId].data[3] = 0;
    sub_813CE30(0x78, 0x50, 0, 0);
    ResetSpriteData();
    FreeAllSpritePalettes();
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0x10, 0, 0xFFFF);
    REG_BG2CNT = 0x4883;
    REG_DISPCNT = 0x1441;
    gTasks[taskId].func = task_intro_11;
    gUnknown_03005ED0 = 0;
    m4aSongNumStart(0x1BA);
}

void task_intro_11(u8 taskId)
{
    gTasks[taskId].data[0] += 0x400;
    if (gTasks[taskId].data[1] <= 0x6BF)
    {
        gTasks[taskId].data[1] += gTasks[taskId].data[2];
        gTasks[taskId].data[2]++;
    }
    else
    {
        gTasks[taskId].func = task_intro_12;
    }
    sub_813CE30(0x78, 0x50, 0x10000 / gTasks[taskId].data[1], gTasks[taskId].data[0]);
    if (gUnknown_03005ED0 == 0x2C)
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0x10, 0xFFFF);
}

void task_intro_12(u8 taskId)
{
    if (gUnknown_03005ED0 > 0x3B)
        gTasks[taskId].func = task_intro_13;
}

extern u8 unk_2000000[][32];

void task_intro_13(u8 taskId)
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
    LZ77UnCompVram(gUnknown_0840A778, (void *)(VRAM + 0x4000));
    LZ77UnCompVram(gUnknown_0840A7E4, (void *)(VRAM + 0x7000));
    LoadPalette(gUnknown_0840A758, 0, 0x20);
    ResetSpriteData();
    FreeAllSpritePalettes();
    gReservedSpritePaletteCount = 8;
    LoadCompressedObjectPic(&gUnknown_0840B20C);
    LoadCompressedObjectPic(&gUnknown_0840B21C);
    LoadCompressedObjectPalette(&gUnknown_0840B22C);
    LoadSpritePalettes(gUnknown_0840B23C);
    gTasks[taskId].func = task_intro_14;
}

void task_intro_14(u8 taskId)
{
    u8 newTaskId;
    
    REG_WIN0H = 0xF0;
    REG_WIN0V = 0xA0;
    REG_WININ = 0x1C;
    REG_WINOUT = 0x1D;
    REG_BG3CNT = 0x603;
    REG_BG0CNT = 0x700;
    REG_DISPCNT = 0x3940;
    gTasks[taskId].data[15] = CreateTask(sub_813CAF4, 0);
    gTasks[gTasks[taskId].data[15]].data[0] = 0;
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].func = task_intro_15;
}

void task_intro_15(u8 taskId)
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

void task_intro_16(u8 taskId)
{
    gTasks[taskId].func = task_intro_17;
}

void task_intro_17(u8 taskId)
{
    gUnknown_0203931A = 0;
    gTasks[taskId].func = task_intro_18;
}

void task_intro_18(u8 taskId)
{
    u8 spriteId;
    
    if (gUnknown_03005ED0 == 0x50)
    {
        spriteId = sub_813CE88(0x14B, 0xF0, 0xA0, 5, 1);
        gSprites[spriteId].callback = sub_813DB9C;
        gSprites[spriteId].data1 = 1;
        gSprites[spriteId].data2 = 0;
    }
    if (gUnknown_03005ED0 == 0x98)
    {
        spriteId = sub_813CE88(0x169, 0, 0xA0, 4, 1);
        gSprites[spriteId].callback = sub_813DB9C;
        gSprites[spriteId].data1 = 2;
        gSprites[spriteId].data2 = 1;
    }
    if (gUnknown_03005ED0 == 0xDB)
    {
        sub_813D084(0);
        spriteId = sub_813CFA8(gUnknown_02039318, 0x110, 0x60, 6);
        gSprites[spriteId].callback = sub_813DE70;
        gTasks[taskId].data[1] = spriteId;
    }
    if (gUnknown_03005ED0 == 0x130)
    {
        gTasks[gTasks[taskId].data[15]].data[0] = 4;
        gSprites[gTasks[taskId].data[1]].data0 = 2;
    }
    if (gUnknown_03005ED0 == 0x180)
    {
        gTasks[gTasks[taskId].data[15]].data[0] = 0;
        gSprites[gTasks[taskId].data[1]].data0 = 4;
    }
    if (gUnknown_03005ED0 == 0x190)
    {
        BeginNormalPaletteFade(0xFF0000, 0, 0x10, 0, 0x7EFF);
    }
    if (gUnknown_03005ED0 == 0x1B0)
    {
        gSprites[gTasks[taskId].data[1]].data0 = 5;
    }
    if (gUnknown_03005ED0 == 0x1CE)
    {
        gSprites[gTasks[taskId].data[1]].data0 = 6;
        gTasks[gTasks[taskId].data[15]].data[0] = 2;
    }
    if (gUnknown_03005ED0 == 0x1CF)
    {
        sub_813D084(1);
        spriteId = sub_813CE88(0x14B, 0xD0, 8, 5, 1);
        gSprites[spriteId].callback = sub_813E10C;
        gTasks[taskId].data[2] = spriteId;
        sub_813E7C0(spriteId);
    }
    if (gUnknown_03005ED0 == 0x21B)
    {
        spriteId = sub_813CE88(0x169, 0xF8, 0x10, 4, 1);
        gSprites[spriteId].callback = sub_813E10C;
        gTasks[taskId].data[3] = spriteId;
        sub_813E930(spriteId);
    }
    if (gUnknown_03005ED0 == 0x26F)
    {
        gSprites[gTasks[taskId].data[2]].data0 = 2;
        gSprites[gTasks[taskId].data[3]].data0 = 2;
        gTasks[gTasks[taskId].data[15]].data[0] = 3;
    }
    if (gUnknown_03005ED0 == 0x270)
    {
        sub_813D084(0);
        spriteId = sub_813CE88(0x11B, 0x20, 0x98, 0, 0);
        gSprites[spriteId].callback = sub_813E210;
        gTasks[taskId].data[4] = spriteId;
        sub_813EDBC(spriteId);
    }
    if (gUnknown_03005ED0 == 0x2BC)
    {
        spriteId = sub_813CE88(0x118, -8, 0x90, 1, 0);
        gSprites[spriteId].callback = sub_813E210;
        gTasks[taskId].data[5] = spriteId;
        sub_813EB4C(spriteId);
    }
    if (gUnknown_03005ED0 == 0x308)
    {
        gUnknown_0203931A = 1;
        gSprites[gTasks[taskId].data[4]].data0 = 2;
        gSprites[gTasks[taskId].data[5]].data0 = 2;
        gTasks[gTasks[taskId].data[15]].data[0] = 0;
    }
    if (gUnknown_03005ED0 == 0x30D)
    {
        sub_813D084(2);
        gSprites[gTasks[taskId].data[2]].data0 = 3;
        gSprites[gTasks[taskId].data[3]].data0 = 3;
        gSprites[gTasks[taskId].data[4]].data0 = 3;
        gSprites[gTasks[taskId].data[5]].data0 = 3;
        spriteId = CreateSprite(&gSpriteTemplate_840B1F4, 0x78, 0x50, 15);
        gSprites[spriteId].invisible = 1;
    }
    if (gUnknown_03005ED0 == 0x320)
        PlaySE(SE_OP_BASYU);
    if (gUnknown_03005ED0 == 0x352)
        BeginNormalPaletteFade(0xFFFFFFFF, 4, 0, 0x10, 0xFFFF);
    if (gUnknown_03005ED0 == 0x3B2)
        gTasks[taskId].func = task_intro_19;
}

void task_intro_19(u8 taskId)
{
    DestroyTask(taskId);
    SetMainCallback2(CB2_813B7EC);
}
