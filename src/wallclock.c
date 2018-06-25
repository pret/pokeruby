#include "global.h"
#include "wallclock.h"
#include "decompress.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "rtc.h"
#include "constants/songs.h"
#include "sound.h"
#include "strings2.h"
#include "task.h"
#include "trig.h"
#include "scanline_effect.h"

extern u16 gSpecialVar_0x8004;
extern u8 gMiscClock_Gfx[];
extern u8 gUnknown_08E95774[];
extern u8 gUnknown_08E954B0[];
extern u16 gMiscClockMale_Pal[];
extern u16 gMiscClockFemale_Pal[];

//--------------------------------------------------
// Graphics Data
//--------------------------------------------------

static const u8 ClockGfx_Misc[] = INCBIN_U8("graphics/misc/clock_misc.4bpp.lz");
static const struct CompressedSpriteSheet gUnknown_083F7A90[] =
{
    {ClockGfx_Misc, 0x2000, 0x1000},
    {NULL},
};
static const struct SpritePalette gUnknown_083F7AA0[] =
{
    {gMiscClockMale_Pal, 0x1000},
    {gMiscClockFemale_Pal, 0x1001},
    {NULL},
};
static const struct OamData gOamData_83F7AB8 =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};
static const union AnimCmd gSpriteAnim_83F7AC0[] =
{
    ANIMCMD_FRAME(0, 30),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_83F7AC8[] =
{
    ANIMCMD_FRAME(64, 30),
    ANIMCMD_END,
};
static const union AnimCmd *const gSpriteAnimTable_83F7AD0[] =
{
    gSpriteAnim_83F7AC0,
};
static const union AnimCmd *const gSpriteAnimTable_83F7AD4[] =
{
    gSpriteAnim_83F7AC8,
};
static void sub_810B05C(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_83F7AD8 =
{
    .tileTag = 0x1000,
    .paletteTag = 0x1000,
    .oam = &gOamData_83F7AB8,
    .anims = gSpriteAnimTable_83F7AD0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_810B05C,
};
static void sub_810B0F4(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_83F7AF0 =
{
    .tileTag = 0x1000,
    .paletteTag = 0x1000,
    .oam = &gOamData_83F7AB8,
    .anims = gSpriteAnimTable_83F7AD4,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_810B0F4,
};
static const struct OamData gOamData_83F7B08 =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 1,
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0,
};
static const union AnimCmd gSpriteAnim_83F7B10[] =
{
    ANIMCMD_FRAME(132, 30),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_83F7B18[] =
{
    ANIMCMD_FRAME(128, 30),
    ANIMCMD_END,
};
static const union AnimCmd *const gSpriteAnimTable_83F7B20[] =
{
    gSpriteAnim_83F7B10,
};
static const union AnimCmd *const gSpriteAnimTable_83F7B24[] =
{
    gSpriteAnim_83F7B18,
};
static void sub_810B18C(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_83F7B28 =
{
    .tileTag = 0x1000,
    .paletteTag = 0x1000,
    .oam = &gOamData_83F7B08,
    .anims = gSpriteAnimTable_83F7B20,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_810B18C,
};
static void sub_810B230(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_83F7B40 =
{
    .tileTag = 0x1000,
    .paletteTag = 0x1000,
    .oam = &gOamData_83F7B08,
    .anims = gSpriteAnimTable_83F7B24,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_810B230,
};

static void WallClockVblankCallback(void);
static void LoadWallClockGraphics(void);
static void WallClockMainCallback(void);
static void WallClockInit(void);
static void Task_SetClock1(u8 taskId);
static void Task_SetClock2(u8 taskId);
static void Task_SetClock3(u8 taskId);
static void Task_SetClock4(u8 taskId);
static void Task_SetClock5(u8 taskId);
static void Task_SetClock6(u8 taskId);
static void Task_ViewClock1(u8 taskId);
static void Task_ViewClock2(u8 taskId);
static void Task_ViewClock3(u8 taskId);
static void Task_ViewClock4(u8 taskId);
static u8 CalcMinHandDelta(u16 speed);
static u16 CalcNewMinHandAngle(u16 angle, u8 direction, u8 speed);
static u8 AdvanceClock(u8 taskId, u8 direction);
static void UpdateClockPeriod(u8 taskId, u8 direction);
static void InitClockWithRtc(u8 taskId);

enum
{
    PERIOD_AM,
    PERIOD_PM,
};

enum
{
    MVMT_NONE,
    MVMT_BACKWARD,
    MVMT_FORWARD,
};

static void WallClockVblankCallback(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void LoadWallClockGraphics(void)
{
    SetVBlankCallback(NULL);
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

    DmaFill16Large(3, 0, (void *)(VRAM + 0x0), 0x18000, 0x1000);
    DmaClear32(3, OAM, OAM_SIZE);
    DmaClear16(3, PLTT, PLTT_SIZE);

    LZ77UnCompVram(gMiscClock_Gfx, (void *)VRAM);
    if (gSpecialVar_0x8004 == MALE)
        LoadPalette(gMiscClockMale_Pal, 0, 32);
    else
        LoadPalette(gMiscClockFemale_Pal, 0, 32);
    ScanlineEffect_Stop();
    ResetTasks();
    ResetSpriteData();
    ResetPaletteFade();
    FreeAllSpritePalettes();
    LoadCompressedObjectPic(&gUnknown_083F7A90[0]);
    LoadSpritePalettes(gUnknown_083F7AA0);
    Text_LoadWindowTemplate(&gWindowTemplate_81E6C3C);
    InitMenuWindow(&gMenuTextWindowTemplate);
}

static void WallClockInit(void)
{
    u16 ime;

    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
    ime = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_IME = ime;
    REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;
    SetVBlankCallback(WallClockVblankCallback);
    SetMainCallback2(WallClockMainCallback);
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    REG_BLDY = 0;
    REG_BG3CNT = BGCNT_PRIORITY(1) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(7)  | BGCNT_16COLOR | BGCNT_TXT256x256;
    REG_BG0CNT = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(2) | BGCNT_SCREENBASE(31) | BGCNT_16COLOR | BGCNT_TXT256x256;
    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON |
      DISPCNT_BG3_ON | DISPCNT_OBJ_ON;
}

#define tMinuteHandAngle data[0]
#define tHourHandAngle data[1]
#define tHours data[2]
#define tMinutes data[3]
#define tMvmtDir data[4]
#define tPeriod data[5]
#define tMvmtSpeed data[6]

//Allow player to set the clock
void CB2_StartWallClock(void)
{
    u8 taskId;
    u8 spriteId;

    LoadWallClockGraphics();
    LZ77UnCompVram(&gUnknown_08E954B0, (void *)(VRAM + 0x3800));

    taskId = CreateTask(Task_SetClock1, 0);
    gTasks[taskId].tHours = 10;
    gTasks[taskId].tMinutes = 0;
    gTasks[taskId].tMvmtDir = MVMT_NONE;
    gTasks[taskId].tPeriod = PERIOD_AM;
    gTasks[taskId].tMvmtSpeed = 0;
    gTasks[taskId].tMinuteHandAngle = 0;
    gTasks[taskId].tHourHandAngle = 300;

    spriteId = CreateSprite(&gSpriteTemplate_83F7AD8, DISPLAY_WIDTH / 2, DISPLAY_HEIGHT / 2, 1);
    gSprites[spriteId].data[0] = taskId;
    gSprites[spriteId].oam.affineMode = ST_OAM_AFFINE_NORMAL;
    gSprites[spriteId].oam.matrixNum = 0;

    spriteId = CreateSprite(&gSpriteTemplate_83F7AF0, DISPLAY_WIDTH / 2, DISPLAY_HEIGHT / 2, 0);
    gSprites[spriteId].data[0] = taskId;
    gSprites[spriteId].oam.affineMode = ST_OAM_AFFINE_NORMAL;
    gSprites[spriteId].oam.matrixNum = 1;

    spriteId = CreateSprite(&gSpriteTemplate_83F7B28, DISPLAY_WIDTH / 2, DISPLAY_HEIGHT / 2, 2);
    gSprites[spriteId].data[0] = taskId;
    gSprites[spriteId].data[1] = 45;

    spriteId = CreateSprite(&gSpriteTemplate_83F7B40, DISPLAY_WIDTH / 2, DISPLAY_HEIGHT / 2, 2);
    gSprites[spriteId].data[0] = taskId;
    gSprites[spriteId].data[1] = 90;

    WallClockInit();
}

//View, but don't set, the clock
void CB2_ViewWallClock(void)
{
    u8 taskId;
    s16 angle1;
    s16 angle2;
    u8 spriteId;

    LoadWallClockGraphics();
    LZ77UnCompVram(gUnknown_08E95774, (void *)(VRAM + 0x3800));

    taskId = CreateTask(Task_ViewClock1, 0);
    InitClockWithRtc(taskId);
    if (gTasks[taskId].tPeriod == PERIOD_AM)
    {
        angle1 = 45;
        angle2 = 90;
    }
    else
    {
        angle1 = 90;
        angle2 = 135;
    }

    spriteId = CreateSprite(&gSpriteTemplate_83F7AD8, 120, 80, 1);
    gSprites[spriteId].data[0] = taskId;
    gSprites[spriteId].oam.affineMode = ST_OAM_AFFINE_NORMAL;
    gSprites[spriteId].oam.matrixNum = 0;

    spriteId = CreateSprite(&gSpriteTemplate_83F7AF0, 120, 80, 0);
    gSprites[spriteId].data[0] = taskId;
    gSprites[spriteId].oam.affineMode = ST_OAM_AFFINE_NORMAL;
    gSprites[spriteId].oam.matrixNum = 1;

    spriteId = CreateSprite(&gSpriteTemplate_83F7B28, 120, 80, 2);
    gSprites[spriteId].data[0] = taskId;
    gSprites[spriteId].data[1] = angle1;

    spriteId = CreateSprite(&gSpriteTemplate_83F7B40, 120, 80, 2);
    gSprites[spriteId].data[0] = taskId;
    gSprites[spriteId].data[1] = angle2;

    WallClockInit();
}

static void WallClockMainCallback(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void Task_SetClock1(u8 taskId)
{
    if (!gPaletteFade.active)
        gTasks[taskId].func = Task_SetClock2;
}

//Handle keypresses when setting clock
static void Task_SetClock2(u8 taskId)
{
    if (gTasks[taskId].tMinuteHandAngle % 6)
    {
        gTasks[taskId].tMinuteHandAngle = CalcNewMinHandAngle(
          gTasks[taskId].tMinuteHandAngle,
          gTasks[taskId].tMvmtDir,
          gTasks[taskId].tMvmtSpeed);
    }
    else
    {
        gTasks[taskId].tMinuteHandAngle = gTasks[taskId].tMinutes * 6;
        gTasks[taskId].tHourHandAngle = (gTasks[taskId].tHours % 12) * 30 + (gTasks[taskId].tMinutes / 10) * 5;
        if (gMain.newKeys & A_BUTTON)
        {
            gTasks[taskId].func = Task_SetClock3;
            return;
        }
        else
        {
            gTasks[taskId].tMvmtDir = gMain.newKeys & A_BUTTON;
            if (gMain.heldKeys & DPAD_LEFT)
                gTasks[taskId].tMvmtDir = MVMT_BACKWARD;
            if (gMain.heldKeys & DPAD_RIGHT)
                gTasks[taskId].tMvmtDir = MVMT_FORWARD;
            if (gTasks[taskId].tMvmtDir)
            {
                if (gTasks[taskId].tMvmtSpeed < 0xFF)
                    gTasks[taskId].tMvmtSpeed++;
                gTasks[taskId].tMinuteHandAngle = CalcNewMinHandAngle(
                  gTasks[taskId].tMinuteHandAngle,
                  gTasks[taskId].tMvmtDir,
                  gTasks[taskId].tMvmtSpeed);
                AdvanceClock(taskId, gTasks[taskId].tMvmtDir);
            }
            else
            {
                gTasks[taskId].tMvmtSpeed = 0;
            }
        }
    }
}

//Ask player "Is this the correct time?"
static void Task_SetClock3(u8 taskId)
{
    Menu_DrawStdWindowFrame(2, 16, 27, 19);
    Menu_PrintText(gOtherText_CorrectTimePrompt, 3, 17);
    Menu_DrawStdWindowFrame(23, 8, 29, 13);
    Menu_PrintItems(24, 9, 2, gMenuYesNoItems);
    InitMenu(0, 24, 9, 2, 1, 5);
    gTasks[taskId].func = Task_SetClock4;
}

//Get menu selection
static void Task_SetClock4(u8 taskId)
{
    switch (Menu_ProcessInputNoWrap_())
    {
    case 0:     //YES
        PlaySE(SE_SELECT);
        gTasks[taskId].func = Task_SetClock5;   //Move on
        return;
    case -1:    //B button
    case 1:     //NO
        Menu_DestroyCursor();
        PlaySE(SE_SELECT);
        Menu_EraseWindowRect(23, 8, 29, 13);
        Menu_EraseWindowRect(2, 16, 27, 19);
        gTasks[taskId].func = Task_SetClock2;   //Go back and let player adjust clock
    }
}

//Set the time offset based on the wall clock's time
static void Task_SetClock5(u8 taskId)
{
    RtcInitLocalTimeOffset(gTasks[taskId].tHours, gTasks[taskId].tMinutes);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
    gTasks[taskId].func = Task_SetClock6;
}

static void Task_SetClock6(u8 taskId)
{
    if (!gPaletteFade.active)
        SetMainCallback2((MainCallback)gMain.savedCallback);
}

static void Task_ViewClock1(u8 taskId)
{
    if (!gPaletteFade.active)
        gTasks[taskId].func = Task_ViewClock2;
}

//Wait for A or B press
static void Task_ViewClock2(u8 taskId)
{
    InitClockWithRtc(taskId);
    if (gMain.newKeys & (A_BUTTON | B_BUTTON))
        gTasks[taskId].func = Task_ViewClock3;
}

static void Task_ViewClock3(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
    gTasks[taskId].func = Task_ViewClock4;
}

static void Task_ViewClock4(u8 taskId)
{
    if (!gPaletteFade.active)
        SetMainCallback2((MainCallback)gMain.savedCallback);
}

static u8 CalcMinHandDelta(u16 speed)
{
    if (speed > 60)
        return 6;
    else if (speed > 30)
        return 3;
    else if (speed > 10)
        return 2;
    else
        return 1;
}

//Calculates the new angle of the minute hand when setting the clock
static u16 CalcNewMinHandAngle(u16 angle, u8 direction, u8 speed)
{
    u8 delta = CalcMinHandDelta(speed);

    switch (direction)
    {
    case MVMT_BACKWARD:
        if (angle)
            angle = angle - delta;
        else
            angle = 360 - delta;
        break;
    case MVMT_FORWARD:
        if (angle < 360 - delta)
            angle = angle + delta;
        else
            angle = 0;
        break;
    }
    return angle;
}

//Advances clock forward or backward by 1 minute
static u8 AdvanceClock(u8 taskId, u8 direction)
{
    switch (direction)
    {
    case MVMT_BACKWARD:
        if (gTasks[taskId].tMinutes > 0)
            gTasks[taskId].tMinutes--;
        else
        {
            gTasks[taskId].tMinutes = 59;
            if (gTasks[taskId].tHours > 0)
                gTasks[taskId].tHours--;
            else
                gTasks[taskId].tHours = 23;
            UpdateClockPeriod(taskId, direction);
        }
        break;
    case MVMT_FORWARD:
        if (gTasks[taskId].tMinutes < 59)
            gTasks[taskId].tMinutes++;
        else
        {
            gTasks[taskId].tMinutes = 0;
            if (gTasks[taskId].tHours < 23)
                gTasks[taskId].tHours++;
            else
                gTasks[taskId].tHours = 0;
            UpdateClockPeriod(taskId, direction);
        }
        break;
    }
    return 0;
}

//Updates the clock period (AM/PM) if it needs to change
static void UpdateClockPeriod(u8 taskId, u8 direction)
{
    u8 hours = gTasks[taskId].tHours;

    switch (direction)
    {
    case MVMT_BACKWARD:
        switch (hours)
        {
        case 11:
            gTasks[taskId].tPeriod = PERIOD_AM;
            break;
        case 23:
            gTasks[taskId].tPeriod = PERIOD_PM;
            break;
        }
        break;
    case MVMT_FORWARD:
        switch (hours)
        {
        case 0:
            gTasks[taskId].tPeriod = PERIOD_AM;
            break;
        case 12:
            gTasks[taskId].tPeriod = PERIOD_PM;
            break;
        }
        break;
    }
}

static void InitClockWithRtc(u8 taskId)
{
    RtcCalcLocalTime();
    gTasks[taskId].tHours = gLocalTime.hours;
    gTasks[taskId].tMinutes = gLocalTime.minutes;
    gTasks[taskId].tMinuteHandAngle = gTasks[taskId].tMinutes * 6;
    gTasks[taskId].tHourHandAngle = (gTasks[taskId].tHours % 12) * 30 + (gTasks[taskId].tMinutes / 10) * 5;
    if (gLocalTime.hours <= 11)
        gTasks[taskId].tPeriod = PERIOD_AM;
    else
        gTasks[taskId].tPeriod = PERIOD_PM;
}

static const s8 gClockHandCoords[][2] =
{
    {  0, -24},
    {  1, -25},
    {  1, -25},
    {  2, -25},
    {  2, -25},
    {  2, -25},
    {  3, -24},
    {  3, -25},
    {  4, -25},
    {  4, -25},
    {  4, -25},
    {  5, -25},
    {  5, -25},
    {  6, -24},
    {  6, -24},
    {  6, -24},
    {  7, -24},
    {  7, -24},
    {  7, -24},
    {  8, -24},
    {  8, -24},
    {  9, -24},
    {  9, -24},
    { 10, -23},
    { 10, -23},
    { 11, -22},
    { 11, -22},
    { 11, -22},
    { 12, -22},
    { 12, -21},
    { 13, -21},
    { 13, -21},
    { 13, -21},
    { 14, -21},
    { 14, -21},
    { 14, -20},
    { 14, -20},
    { 15, -20},
    { 15, -19},
    { 16, -19},
    { 16, -19},
    { 16, -19},
    { 16, -18},
    { 16, -18},
    { 17, -18},
    { 17, -17},
    { 17, -17},
    { 18, -17},
    { 18, -17},
    { 18, -16},
    { 18, -16},
    { 19, -16},
    { 19, -15},
    { 19, -15},
    { 20, -15},
    { 20, -14},
    { 20, -14},
    { 20, -13},
    { 20, -13},
    { 21, -13},
    { 21, -13},
    { 21, -12},
    { 22, -12},
    { 22, -12},
    { 22, -11},
    { 22, -11},
    { 22, -10},
    { 23, -10},
    { 23,  -9},
    { 23,  -9},
    { 23,  -9},
    { 23,  -9},
    { 23,  -8},
    { 23,  -8},
    { 23,  -7},
    { 23,  -7},
    { 23,  -6},
    { 24,  -6},
    { 24,  -6},
    { 25,  -5},
    { 25,  -5},
    { 24,  -4},
    { 25,  -4},
    { 24,  -3},
    { 25,  -3},
    { 25,  -3},
    { 25,  -2},
    { 25,  -2},
    { 24,  -1},
    { 25,  -1},
    { 24,   0},
    { 24,   0},
    { 24,   0},
    { 24,   1},
    { 24,   1},
    { 25,   2},
    { 24,   2},
    { 25,   2},
    { 24,   3},
    { 24,   3},
    { 25,   4},
    { 24,   4},
    { 24,   5},
    { 24,   5},
    { 24,   5},
    { 24,   6},
    { 23,   6},
    { 23,   6},
    { 23,   7},
    { 23,   8},
    { 23,   8},
    { 23,   8},
    { 23,   9},
    { 23,   9},
    { 23,  10},
    { 22,  10},
    { 22,  10},
    { 22,  11},
    { 22,  11},
    { 22,  11},
    { 22,  12},
    { 21,  12},
    { 21,  12},
    { 21,  13},
    { 20,  13},
    { 20,  13},
    { 19,  13},
    { 19,  13},
    { 19,  14},
    { 19,  14},
    { 19,  15},
    { 19,  15},
    { 18,  15},
    { 18,  16},
    { 17,  16},
    { 17,  16},
    { 17,  17},
    { 17,  17},
    { 16,  17},
    { 16,  18},
    { 16,  18},
    { 15,  18},
    { 14,  18},
    { 15,  19},
    { 14,  19},
    { 14,  19},
    { 13,  19},
    { 13,  20},
    { 13,  20},
    { 13,  20},
    { 12,  20},
    { 12,  20},
    { 12,  21},
    { 11,  21},
    { 11,  21},
    { 11,  21},
    { 10,  21},
    { 10,  22},
    { 10,  22},
    {  9,  22},
    {  9,  22},
    {  8,  22},
    {  7,  22},
    {  7,  23},
    {  7,  23},
    {  6,  23},
    {  6,  23},
    {  5,  23},
    {  5,  23},
    {  5,  24},
    {  4,  24},
    {  4,  24},
    {  4,  24},
    {  3,  24},
    {  2,  24},
    {  2,  24},
    {  1,  24},
    {  1,  24},
    {  0,  24},
    {  0,  24},
    { -1,  23},
    {  0,  24},
    {  0,  24},
    { -1,  24},
    { -1,  24},
    { -2,  24},
    { -2,  24},
    { -3,  24},
    { -3,  24},
    { -4,  24},
    { -4,  24},
    { -5,  24},
    { -5,  23},
    { -5,  23},
    { -6,  23},
    { -6,  23},
    { -7,  23},
    { -7,  23},
    { -7,  23},
    { -8,  23},
    { -8,  22},
    { -9,  22},
    { -9,  22},
    {-10,  22},
    {-10,  22},
    {-10,  21},
    {-11,  21},
    {-11,  21},
    {-11,  21},
    {-11,  20},
    {-12,  20},
    {-12,  20},
    {-13,  20},
    {-13,  20},
    {-13,  19},
    {-14,  19},
    {-14,  19},
    {-14,  19},
    {-14,  18},
    {-15,  18},
    {-15,  18},
    {-15,  17},
    {-16,  17},
    {-16,  17},
    {-17,  17},
    {-17,  16},
    {-17,  16},
    {-18,  16},
    {-17,  15},
    {-18,  15},
    {-18,  15},
    {-19,  15},
    {-19,  14},
    {-19,  14},
    {-19,  13},
    {-19,  13},
    {-20,  13},
    {-20,  12},
    {-20,  12},
    {-21,  12},
    {-21,  12},
    {-21,  11},
    {-21,  11},
    {-21,  10},
    {-21,  10},
    {-21,   9},
    {-22,   9},
    {-22,   9},
    {-22,   8},
    {-22,   8},
    {-22,   7},
    {-23,   7},
    {-23,   7},
    {-23,   6},
    {-23,   6},
    {-23,   5},
    {-24,   5},
    {-23,   4},
    {-23,   4},
    {-24,   4},
    {-24,   4},
    {-24,   3},
    {-24,   3},
    {-24,   2},
    {-24,   2},
    {-24,   1},
    {-24,   1},
    {-24,   1},
    {-24,   0},
    {-25,   0},
    {-24,  -1},
    {-25,  -1},
    {-24,  -1},
    {-24,  -2},
    {-24,  -2},
    {-24,  -3},
    {-24,  -3},
    {-24,  -4},
    {-24,  -4},
    {-24,  -4},
    {-24,  -5},
    {-24,  -5},
    {-24,  -6},
    {-24,  -6},
    {-23,  -6},
    {-23,  -7},
    {-23,  -7},
    {-23,  -8},
    {-23,  -8},
    {-23,  -9},
    {-23,  -9},
    {-22,  -9},
    {-22,  -9},
    {-22, -10},
    {-22, -10},
    {-21, -10},
    {-21, -11},
    {-22, -11},
    {-22, -12},
    {-21, -12},
    {-21, -13},
    {-21, -13},
    {-20, -13},
    {-21, -14},
    {-20, -14},
    {-20, -14},
    {-19, -14},
    {-19, -15},
    {-19, -15},
    {-18, -16},
    {-18, -16},
    {-18, -16},
    {-18, -17},
    {-18, -17},
    {-17, -17},
    {-17, -18},
    {-17, -18},
    {-16, -18},
    {-16, -18},
    {-16, -19},
    {-16, -19},
    {-15, -19},
    {-15, -19},
    {-15, -20},
    {-14, -20},
    {-14, -20},
    {-14, -21},
    {-13, -21},
    {-13, -21},
    {-13, -21},
    {-12, -21},
    {-12, -22},
    {-11, -22},
    {-11, -22},
    {-11, -22},
    {-10, -22},
    {-10, -22},
    { -9, -22},
    { -9, -23},
    { -9, -23},
    { -8, -23},
    { -8, -23},
    { -7, -23},
    { -7, -23},
    { -7, -24},
    { -6, -24},
    { -6, -24},
    { -5, -24},
    { -5, -24},
    { -4, -24},
    { -4, -24},
    { -4, -24},
    { -4, -25},
    { -3, -25},
    { -2, -25},
    { -2, -24},
    { -2, -24},
    { -1, -25},
    { -1, -25},
    {  0, -25},
};

static void sub_810B05C(struct Sprite *sprite)
{
    u16 angle;
    s16 sin;
    s16 cos;
    u16 x;
    u16 y;

    angle = gTasks[sprite->data[0]].tMinuteHandAngle;
    sin = Sin2(angle) / 16;
    cos = Cos2(angle) / 16;
    SetOamMatrix(0, cos, sin, -sin, cos);
    x = gClockHandCoords[angle][0];
    y = gClockHandCoords[angle][1];

    //Manual sign extension
    if (x > 0x80)
        x |= 0xFF00;
    if (y > 0x80)
        y |= 0xFF00;

    sprite->pos2.x = x;
    sprite->pos2.y = y;
}

static void sub_810B0F4(struct Sprite *sprite)
{
    u16 angle;
    s16 sin;
    s16 cos;
    u16 x;
    u16 y;

    angle = gTasks[sprite->data[0]].tHourHandAngle;
    sin = Sin2(angle) / 16;
    cos = Cos2(angle) / 16;
    SetOamMatrix(1, cos, sin, -sin, cos);
    x = gClockHandCoords[angle][0];
    y = gClockHandCoords[angle][1];

    //Manual sign extension
    if (x > 0x80)
        x |= 0xFF00;
    if (y > 0x80)
        y |= 0xFF00;

    sprite->pos2.x = x;
    sprite->pos2.y = y;
}

static void sub_810B18C(struct Sprite *sprite)
{
    s16 sin;
    s16 cos;

    if (gTasks[sprite->data[0]].tPeriod != PERIOD_AM)
    {
        if (sprite->data[1] >= 60 && sprite->data[1] < 90)
            sprite->data[1] += 5;
        if (sprite->data[1] < 60)
            sprite->data[1]++;
    }
    else
    {
        if (sprite->data[1] > 45 && sprite->data[1] <= 75)
            sprite->data[1] -= 5;
        if (sprite->data[1] > 75)
            sprite->data[1]--;
    }
    cos = Cos2((u16)sprite->data[1]);
    sprite->pos2.x =  cos * 30 / 4096;
    sin = Sin2((u16)sprite->data[1]);
    sprite->pos2.y = sin * 30 / 4096;
}

static void sub_810B230(struct Sprite *sprite)
{
    s16 sin;
    s16 cos;

    if (gTasks[sprite->data[0]].tPeriod != PERIOD_AM)
    {
        if (sprite->data[1] >= 105 && sprite->data[1] < 135)
            sprite->data[1] += 5;
        if (sprite->data[1] < 105)
            sprite->data[1]++;
    }
    else
    {
        if (sprite->data[1] > 90 && sprite->data[1] <= 120)
            sprite->data[1] -= 5;
        if (sprite->data[1] > 120)
            sprite->data[1]--;
    }
    cos = Cos2((u16)sprite->data[1]);
    sprite->pos2.x =  cos * 30 / 4096;
    sin = Sin2((u16)sprite->data[1]);
    sprite->pos2.y = sin * 30 / 4096;
}
