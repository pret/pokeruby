#include "global.h"
#include "wallclock.h"
#include "asm.h"
#include "decompress.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "rtc.h"
#include "songs.h"
#include "task.h"
#include "trig.h"
#include "sound.h"

extern u16 gSpecialVar_0x8004;
extern u16 gMiscClockMale_Pal[];
extern u16 gMiscClockFemale_Pal[];
extern u8 gMiscClock_Gfx[];
extern struct SpriteSheet gUnknown_083F7A90;
extern struct SpritePalette gUnknown_083F7AA0;
extern u8 gUnknown_08E95774[];
extern u8 gUnknown_08E954B0[];
extern u8 gOtherText_CorrectTimePrompt[];
extern u8 * const gUnknown_08376D74[][2];
extern s8 gClockHandCoords[][2];

extern struct SpriteTemplate gSpriteTemplate_83F7AD8;
extern struct SpriteTemplate gSpriteTemplate_83F7AF0;
extern struct SpriteTemplate gSpriteTemplate_83F7B28;
extern struct SpriteTemplate gSpriteTemplate_83F7B40;

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

//Task data
enum {
    TD_MHAND_ANGLE,
    TD_HHAND_ANGLE,
    TD_HOURS,
    TD_MINUTES,
    TD_SETDIRECTION,    //Movement direction when setting the clock
    TD_PERIOD,          //Whether the time is AM or PM
    TD_SETSPEED,        //Movement speed when setting the clock
};

enum {
    AM,
    PM
};

enum {
    BACKWARD = 1,
    FORWARD
};

static void WallClockVblankCallback(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void LoadWallClockGraphics(void)
{
    u8 *addr;
    u32 size;
    
    SetVBlankCallback(0);
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
    
    addr = (void *)VRAM;
    size = 0x18000;
    while(1)
    {
        DmaFill16(3, 0, addr, 0x1000);
        addr += 0x1000;
        size -= 0x1000;
        if(size <= 0x1000)
        {
            DmaFill16(3, 0, addr, size);
            break;
        }
    }
    DmaClear32(3, OAM, OAM_SIZE);
    DmaClear16(3, PLTT, PLTT_SIZE);
    
    LZ77UnCompVram(gMiscClock_Gfx, (void *)VRAM);
    if(gSpecialVar_0x8004 == MALE)
        LoadPalette(gMiscClockMale_Pal, 0, 32);
    else
        LoadPalette(gMiscClockFemale_Pal, 0, 32);
    remove_some_task();
    ResetTasks();
    ResetSpriteData();
    ResetPaletteFade();
    FreeAllSpritePalettes();
    LoadCompressedObjectPic(&gUnknown_083F7A90);
    LoadSpritePalettes(&gUnknown_083F7AA0);
    SetUpWindowConfig(&gWindowConfig_81E6C3C);
    InitMenuWindow(&gWindowConfig_81E6CE4);
}

static void WallClockInit(void)
{
    u16 ime;
    
    BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
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
    REG_BG3CNT = 0x701;
    REG_BG0CNT = 0x1F08;
    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON |
      DISPCNT_BG3_ON | DISPCNT_OBJ_ON;
}

//Allow player to set the clock
void Cb2_StartWallClock(void)
{
    u8 taskId;
    u8 spriteId;
    
    LoadWallClockGraphics();
    LZ77UnCompVram(&gUnknown_08E954B0, (void *)(VRAM + 0x3800));
    
    taskId = CreateTask(Task_SetClock1, 0);
    gTasks[taskId].data[TD_HOURS] = 10;
    gTasks[taskId].data[TD_MINUTES] = 0;
    gTasks[taskId].data[TD_SETDIRECTION] = 0;
    gTasks[taskId].data[TD_PERIOD] = AM;
    gTasks[taskId].data[TD_SETSPEED] = 0;
    gTasks[taskId].data[TD_MHAND_ANGLE] = 0;
    gTasks[taskId].data[TD_HHAND_ANGLE] = 300;
    
    spriteId = CreateSprite(&gSpriteTemplate_83F7AD8, 0x78, 0x50, 1);
    gSprites[spriteId].data0 = taskId;
    gSprites[spriteId].oam.affineMode = ST_OAM_AFFINE_NORMAL;
    gSprites[spriteId].oam.matrixNum = 0;
    
    spriteId = CreateSprite(&gSpriteTemplate_83F7AF0, 0x78, 0x50, 0);
    gSprites[spriteId].data0 = taskId;
    gSprites[spriteId].oam.affineMode = ST_OAM_AFFINE_NORMAL;
    gSprites[spriteId].oam.matrixNum = 1;
    
    spriteId = CreateSprite(&gSpriteTemplate_83F7B28, 0x78, 0x50, 2);
    gSprites[spriteId].data0 = taskId;
    gSprites[spriteId].data1 = 45;
    
    spriteId = CreateSprite(&gSpriteTemplate_83F7B40, 0x78, 0x50, 2);
    gSprites[spriteId].data0 = taskId;
    gSprites[spriteId].data1 = 90;
    
    WallClockInit();
}

//View, but don't set, the clock
void Cb2_ViewWallClock(void)
{
    u8 taskId;
    s16 angle1;
    s16 angle2;
    u8 spriteId;
    
    LoadWallClockGraphics();
    LZ77UnCompVram(gUnknown_08E95774, (void *)(VRAM + 0x3800));
    
    taskId = CreateTask(Task_ViewClock1, 0);
    InitClockWithRtc(taskId);
    if(gTasks[taskId].data[TD_PERIOD] == 0)
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
    gSprites[spriteId].data0 = taskId;
    gSprites[spriteId].oam.affineMode = ST_OAM_AFFINE_NORMAL;
    gSprites[spriteId].oam.matrixNum = 0;
    
    spriteId = CreateSprite(&gSpriteTemplate_83F7AF0, 120, 80, 0);
    gSprites[spriteId].data0 = taskId;
    gSprites[spriteId].oam.affineMode = ST_OAM_AFFINE_NORMAL;
    gSprites[spriteId].oam.matrixNum = 1;
    
    spriteId = CreateSprite(&gSpriteTemplate_83F7B28, 120, 80, 2);
    gSprites[spriteId].data0 = taskId;
    gSprites[spriteId].data1 = angle1;
    
    spriteId = CreateSprite(&gSpriteTemplate_83F7B40, 120, 80, 2);
    gSprites[spriteId].data0 = taskId;
    gSprites[spriteId].data1 = angle2;
    
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
    if(!gPaletteFade.active)
        gTasks[taskId].func = Task_SetClock2;
}

//Handle keypresses when setting clock
static void Task_SetClock2(u8 taskId)
{
    if(gTasks[taskId].data[TD_MHAND_ANGLE] % 6)
    {
        gTasks[taskId].data[TD_MHAND_ANGLE] = CalcNewMinHandAngle(
          gTasks[taskId].data[TD_MHAND_ANGLE],
          gTasks[taskId].data[TD_SETDIRECTION],
          gTasks[taskId].data[TD_SETSPEED]);
    }
    else
    {
        gTasks[taskId].data[TD_MHAND_ANGLE] = gTasks[taskId].data[TD_MINUTES] * 6;
        gTasks[taskId].data[TD_HHAND_ANGLE] = (gTasks[taskId].data[TD_HOURS] % 12) * 30 + (gTasks[taskId].data[TD_MINUTES] / 10) * 5;
        if(gMain.newKeys & A_BUTTON)
        {
            gTasks[taskId].func = Task_SetClock3;
            return;
        }
        else
        {
            gTasks[taskId].data[TD_SETDIRECTION] = gMain.newKeys & A_BUTTON;
            if(gMain.heldKeys & DPAD_LEFT)
                gTasks[taskId].data[TD_SETDIRECTION] = BACKWARD;
            if(gMain.heldKeys & DPAD_RIGHT)
                gTasks[taskId].data[TD_SETDIRECTION] = FORWARD;
            if(gTasks[taskId].data[TD_SETDIRECTION])
            {
                if(gTasks[taskId].data[TD_SETSPEED] <= 0xFE)
                    gTasks[taskId].data[TD_SETSPEED]++;
                gTasks[taskId].data[TD_MHAND_ANGLE] = CalcNewMinHandAngle(
                  gTasks[taskId].data[TD_MHAND_ANGLE],
                  gTasks[taskId].data[TD_SETDIRECTION],
                  gTasks[taskId].data[TD_SETSPEED]);
                AdvanceClock(taskId, gTasks[taskId].data[TD_SETDIRECTION]);
            }
            else
            {
                gTasks[taskId].data[TD_SETSPEED] = 0;
            }
        }
    }
}

//Ask player "Is this the correct time?"
static void Task_SetClock3(u8 taskId)
{
    MenuDrawTextWindow(2, 16, 27, 19);
    MenuPrint(gOtherText_CorrectTimePrompt, 3, 17);
    MenuDrawTextWindow(23, 8, 29, 13);
    PrintMenuItems(24, 9, 2, gUnknown_08376D74);
    InitMenu(0, 24, 9, 2, 1, 5);
    gTasks[taskId].func = Task_SetClock4;
}

//Get menu selection
static void Task_SetClock4(u8 taskId)
{
    switch(ProcessMenuInputNoWrap_())
    {
        case 0:     //YES
            PlaySE(SE_SELECT);
            gTasks[taskId].func = Task_SetClock5;   //Move on
            return;
        case -1:    //B button
        case 1:     //NO
            sub_8072DEC();
            PlaySE(SE_SELECT);
            MenuZeroFillWindowRect(23, 8, 29, 13);
            MenuZeroFillWindowRect(2, 16, 27, 19);
            gTasks[taskId].func = Task_SetClock2;   //Go back and let player adjust clock
    }
}

//Set the time offset based on the wall clock's time
static void Task_SetClock5(u8 taskId)
{
    RtcInitLocalTimeOffset(gTasks[taskId].data[TD_HOURS], gTasks[taskId].data[TD_MINUTES]);
    BeginNormalPaletteFade(-1, 0, 0, 16, 0);
    gTasks[taskId].func = Task_SetClock6;
}

static void Task_SetClock6(u8 taskId)
{
    if(!gPaletteFade.active)
        SetMainCallback2((MainCallback)gMain.field_8);
}

static void Task_ViewClock1(u8 taskId)
{
    if(!gPaletteFade.active)
        gTasks[taskId].func = Task_ViewClock2;
}

//Wait for A or B press
static void Task_ViewClock2(u8 taskId)
{
    InitClockWithRtc(taskId);
    if(gMain.newKeys & (A_BUTTON | B_BUTTON))
        gTasks[taskId].func = Task_ViewClock3;
}

static void Task_ViewClock3(u8 taskId)
{
    BeginNormalPaletteFade(-1, 0, 0, 16, 0);
    gTasks[taskId].func = Task_ViewClock4;
}

static void Task_ViewClock4(u8 taskId)
{
    if(!gPaletteFade.active)
        SetMainCallback2((MainCallback)gMain.field_8);
}

static u8 CalcMinHandDelta(u16 speed)
{
    if(speed > 60)
        return 6;
    else if(speed > 30)
        return 3;
    else if(speed > 10)
        return 2;
    else
        return 1;
}

//Calculates the new position of the minute hand when setting the clock
static u16 CalcNewMinHandAngle(u16 angle, u8 direction, u8 speed)
{
    u8 delta = CalcMinHandDelta(speed);
    
    switch(direction)
    {
        case BACKWARD:
            if(angle)
                angle = angle - delta;
            else
                angle = 360 - delta;
            break;
        case FORWARD:
            if(angle < 360 - delta)
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
    switch(direction)
    {
        case BACKWARD:
            if(gTasks[taskId].data[TD_MINUTES] > 0)
                gTasks[taskId].data[TD_MINUTES]--;
            else
            {
                gTasks[taskId].data[TD_MINUTES] = 59;
                if(gTasks[taskId].data[TD_HOURS] > 0)
                    gTasks[taskId].data[TD_HOURS]--;
                else
                    gTasks[taskId].data[TD_HOURS] = 23;
                UpdateClockPeriod(taskId, direction);
            }
            break;
        case FORWARD:
            if(gTasks[taskId].data[TD_MINUTES] <= 58)
                gTasks[taskId].data[TD_MINUTES]++;
            else
            {
                gTasks[taskId].data[TD_MINUTES] = 0;
                if(gTasks[taskId].data[TD_HOURS] <= 22)
                    gTasks[taskId].data[TD_HOURS]++;
                else
                    gTasks[taskId].data[TD_HOURS] = 0;
                UpdateClockPeriod(taskId, direction);
            }
            break;
    }
    return 0;
}

//Updates the clock period (AM/PM) if it needs to change
static void UpdateClockPeriod(u8 taskId, u8 direction)
{
    u8 hours = gTasks[taskId].data[TD_HOURS];
    
    switch(direction)
    {
        case BACKWARD:
            switch(hours)
            {
                case 11:
                    gTasks[taskId].data[TD_PERIOD] = AM;
                    break;
                case 23:
                    gTasks[taskId].data[TD_PERIOD] = PM;
                    break;
            }
            break;
        case FORWARD:
            switch(hours)
            {
                case 0:
                    gTasks[taskId].data[TD_PERIOD] = AM;
                    break;
                case 12:
                    gTasks[taskId].data[TD_PERIOD] = PM;
                    break;
            }
            break;
    }
}

static void InitClockWithRtc(u8 taskId)
{
    RtcCalcLocalTime();
    gTasks[taskId].data[TD_HOURS] = gLocalTime.hours;
    gTasks[taskId].data[TD_MINUTES] = gLocalTime.minutes;
    gTasks[taskId].data[TD_MHAND_ANGLE] = gTasks[taskId].data[TD_MINUTES] * 6;
    gTasks[taskId].data[TD_HHAND_ANGLE] = (gTasks[taskId].data[TD_HOURS] % 12) * 30 + (gTasks[taskId].data[TD_MINUTES] / 10) * 5;
    if(gLocalTime.hours <= 11)
        gTasks[taskId].data[TD_PERIOD] = AM;
    else
        gTasks[taskId].data[TD_PERIOD] = PM;
}

void sub_810B05C(struct Sprite *sprite)
{
    u16 angle;
    s16 sin;
    s16 cos;
    u16 x;
    u16 y;
    
    angle = gTasks[sprite->data0].data[TD_MHAND_ANGLE];
    sin = Sin2(angle) / 16;
    cos = Cos2(angle) / 16;
    SetOamMatrix(0, cos, sin, -sin, cos);
    x = gClockHandCoords[angle][0];
    y = gClockHandCoords[angle][1];
    
    //Manual sign extension
    if(x > 0x80)
        x |= 0xFF00;
    if(y > 0x80)
        y |= 0xFF00;
    
    sprite->pos2.x = x;
    sprite->pos2.y = y;
}

void sub_810B0F4(struct Sprite *sprite)
{
    u16 angle;
    s16 sin;
    s16 cos;
    u16 x;
    u16 y;
    
    angle = gTasks[sprite->data0].data[TD_HHAND_ANGLE];
    sin = Sin2(angle) / 16;
    cos = Cos2(angle) / 16;
    SetOamMatrix(1, cos, sin, -sin, cos);
    x = gClockHandCoords[angle][0];
    y = gClockHandCoords[angle][1];
    
    //Manual sign extension
    if(x > 0x80)
        x |= 0xFF00;
    if(y > 0x80)
        y |= 0xFF00;
    
    sprite->pos2.x = x;
    sprite->pos2.y = y;
}

void sub_810B18C(struct Sprite *sprite)
{
    s16 sin;
    s16 cos;
    
    if(gTasks[sprite->data0].data[TD_PERIOD] != AM)
    {
        if((u16)(sprite->data1 - 60) <= 29)
            sprite->data1 += 5;
        if(sprite->data1 <= 59)
            sprite->data1++;
    }
    else
    {
        if((u16)(sprite->data1 - 46) <= 29)
            sprite->data1 -= 5;
        if(sprite->data1 > 75)
            sprite->data1--;
    }
    cos = Cos2((u16)sprite->data1);
    sprite->pos2.x =  cos * 30 / 4096;
    sin = Sin2((u16)sprite->data1);
    sprite->pos2.y = sin * 30 / 4096;
}

void sub_810B230(struct Sprite *sprite)
{
    s16 sin;
    s16 cos;
    
    if(gTasks[sprite->data0].data[TD_PERIOD] != AM)
    {
        if(sprite->data1 >= 105 && sprite->data1 < 135)
            sprite->data1 += 5;
        if(sprite->data1 < 105)
            sprite->data1++;
    }
    else
    {
        if(sprite->data1 > 90 && sprite->data1 <= 120)
            sprite->data1 -= 5;
        if(sprite->data1 > 120)
            sprite->data1--;
    }
    cos = Cos2((u16)sprite->data1);
    sprite->pos2.x =  cos * 30 / 4096;
    sin = Sin2((u16)sprite->data1);
    sprite->pos2.y = sin * 30 / 4096;
}
