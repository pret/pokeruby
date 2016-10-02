#include "gba/io_reg.h"
#include "gba/macro.h"
#include "global.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "rtc.h"
#include "sprite.h"
#include "task.h"
#include "text.h"

extern u16 gUnknown_0202E8CC;
extern u16 gMiscClockMale_Pal[];
extern u16 gMiscClockFemale_Pal[];

extern u8 gMiscClock_Gfx[];
extern u8 gUnknown_083F7A90[];
extern struct SpritePalette gUnknown_083F7AA0;
extern u8 gUnknown_08E95774[];
extern u8 gUnknown_08E954B0[];
extern u8 gOtherText_CorrectTimePrompt[];
extern u8 * const gUnknown_08376D74[][2];
extern s8 gClockHandCoords[][2];

extern struct WindowConfig gWindowConfig_81E6C3C;
extern struct WindowConfig gWindowConfig_81E6CE4;
extern struct SpriteTemplate gSpriteTemplate_83F7AD8;
extern struct SpriteTemplate gSpriteTemplate_83F7AF0;
extern struct SpriteTemplate gSpriteTemplate_83F7B28;
extern struct SpriteTemplate gSpriteTemplate_83F7B40;

static void WallClockVblankCallback(void);
static void WallClockMainCallback(void);
static void WallClockInit(void);
void sub_810ADC0(u8 taskId);
void sub_810AB54(u8 taskId);
void sub_810AB84(u8 taskId);
void sub_810AC60(u8 taskId);
static u16 GetNewMinHandAngle(u16 angle, u8 direction, u8 speed);
static u8 AdvanceClock(u8 taskId, u8 r1);
void c3_80BF560(u8 taskId);
void sub_810AD58(u8 taskId);
void sub_810AD9C(u8 taskId);
void sub_810ADF0(u8 taskId);
void sub_810AE28(u8 taskId);
void sub_810AE60(u8 taskId);
void sub_810AF98(u8 taskId, u8 b);
static void InitClockWithRtc(u8 taskId);

//Task data
enum {
    TD_MHAND_ANGLE,
    TD_HHAND_ANGLE,
    TD_HOURS,
    TD_MINUTES,
    TD_SETDIRECTION,
    TD_PERIOD,
    TD_SETSPEED,
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

//ToDo: Figure out these damn DMA operations!
void LoadWallClockGraphics(void)
{
    u8 *addr;
    u32 foo;
    
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
    
    addr = VRAM;
    for(foo = 0x18000; foo > 0x1000; foo -= 0x1000)
    {
        DmaFill16(3, 0, addr, 0x1000);
        addr += 0x1000;
    }
    DmaFill16(3, 0, addr, 0x1000);
    DmaFill32(3, 0, OAM, OAM_SIZE);
    DmaFill16(3, 0, PLTT, PLTT_SIZE);
    
    LZ77UnCompVram(gMiscClock_Gfx, VRAM);
    if(gUnknown_0202E8CC)
        LoadPalette(gMiscClockFemale_Pal, 0, 32);
    else
        LoadPalette(gMiscClockMale_Pal, 0, 32);
    remove_some_task();
    ResetTasks();
    ResetSpriteData();
    ResetPaletteFade();
    FreeAllSpritePalettes();
    LoadCompressedObjectPic(gUnknown_083F7A90);
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
    REG_IE |= 0x1;
    REG_IME = ime;
    REG_DISPSTAT |= 0x8;
    SetVBlankCallback(WallClockVblankCallback);
    SetMainCallback2(WallClockMainCallback);
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    REG_BLDY = 0;
    REG_BG3CNT = 0x701;
    REG_BG0CNT = 0x1F08;
    REG_DISPCNT = 0x1940;
}

void Cb2_StartWallClock(void)
{
    u8 taskId;
    u8 spriteId;
    
    LoadWallClockGraphics();
    LZ77UnCompVram(&gUnknown_08E954B0, 0x6003800);
    
    taskId = CreateTask(sub_810AB54, 0);
    gTasks[taskId].data[TD_HOURS] = 10;
    gTasks[taskId].data[TD_MINUTES] = 0;
    gTasks[taskId].data[TD_SETDIRECTION] = 0;
    gTasks[taskId].data[TD_PERIOD] = AM;
    gTasks[taskId].data[TD_SETSPEED] = 0;
    gTasks[taskId].data[TD_MHAND_ANGLE] = 0;
    gTasks[taskId].data[TD_HHAND_ANGLE] = 300;
    
    spriteId = CreateSprite(&gSpriteTemplate_83F7AD8, 0x78, 0x50, 1);
    gSprites[spriteId].data0 = taskId;
    gSprites[spriteId].oam.affineMode = 1;
    gSprites[spriteId].oam.matrixNum = 0;
    
    spriteId = CreateSprite(&gSpriteTemplate_83F7AF0, 0x78, 0x50, 0);
    gSprites[spriteId].data0 = taskId;
    gSprites[spriteId].oam.affineMode = 1;
    gSprites[spriteId].oam.matrixNum = 1;
    
    spriteId = CreateSprite(&gSpriteTemplate_83F7B28, 0x78, 0x50, 2);
    gSprites[spriteId].data0 = taskId;
    gSprites[spriteId].data1 = 45;
    
    spriteId = CreateSprite(&gSpriteTemplate_83F7B40, 0x78, 0x50, 2);
    gSprites[spriteId].data0 = taskId;
    gSprites[spriteId].data1 = 90;
    
    WallClockInit();
}

void Cb2_ViewWallClock(void)
{
    u8 taskId;
    s16 angle1;
    s16 angle2;
    u8 spriteId;
    
    LoadWallClockGraphics();
    LZ77UnCompVram(gUnknown_08E95774, 0x6003800);
    
    taskId = CreateTask(sub_810ADC0, 0);
    InitClockWithRtc(taskId);
    if(gTasks[taskId].data[TD_HOURS] == 0)
    {
        angle1 = 45;
        angle2 = 90;
    }
    else
    {
        angle1 = 90;
        angle2 = 135;
    }
    
    spriteId = CreateSprite(&gSpriteTemplate_83F7AD8, 0x78, 0x50, 1);
    gSprites[spriteId].data0 = taskId;
    gSprites[spriteId].oam.affineMode = 1;
    gSprites[spriteId].oam.matrixNum = 0;
    
    spriteId = CreateSprite(&gSpriteTemplate_83F7AF0, 0x78, 0x50, 0);
    gSprites[spriteId].data0 = taskId;
    gSprites[spriteId].oam.affineMode = 1;
    gSprites[spriteId].oam.matrixNum = 1;
    
    spriteId = CreateSprite(&gSpriteTemplate_83F7B28, 0x78, 0x50, 2);
    gSprites[spriteId].data0 = taskId;
    gSprites[spriteId].data1 = angle1;
    
    spriteId = CreateSprite(&gSpriteTemplate_83F7B40, 0x78, 0x50, 2);
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

void sub_810AB54(u8 taskId)
{
    if(!gPaletteFade.active)
        gTasks[taskId].func = sub_810AB84;
}

void sub_810AB84(u8 taskId)
{
    if(gTasks[taskId].data[TD_MHAND_ANGLE] % 6)
    {
        gTasks[taskId].data[TD_MHAND_ANGLE] = GetNewMinHandAngle(gTasks[taskId].data[TD_MHAND_ANGLE], gTasks[taskId].data[TD_SETDIRECTION], gTasks[taskId].data[TD_SETSPEED]);
    }
    else
    {
        gTasks[taskId].data[TD_MHAND_ANGLE] = gTasks[taskId].data[TD_MINUTES] * 6;
        gTasks[taskId].data[TD_HHAND_ANGLE] = (gTasks[taskId].data[TD_HOURS] % 12) * 30 + (gTasks[taskId].data[TD_MINUTES] / 10) * 5;
        if(gMain.newKeys & A_BUTTON)
        {
            gTasks[taskId].func = sub_810AC60;
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
                gTasks[taskId].data[TD_MHAND_ANGLE] = GetNewMinHandAngle(gTasks[taskId].data[TD_MHAND_ANGLE], gTasks[taskId].data[TD_SETDIRECTION], gTasks[taskId].data[TD_SETSPEED]);
                AdvanceClock(taskId, gTasks[taskId].data[TD_SETDIRECTION]);
            }
            else
            {
                gTasks[taskId].data[TD_SETSPEED] = 0;
            }
        }
    }
}

void sub_810AC60(u8 taskId)
{
    MenuDrawTextWindow(2, 16, 27, 19);
    MenuPrint(gOtherText_CorrectTimePrompt, 3, 17);
    MenuDrawTextWindow(23, 8, 29, 13);
    PrintMenuItems(24, 9, 2, gUnknown_08376D74);
    InitMenu(0, 24, 9, 2, 1, 5);
    gTasks[taskId].func = c3_80BF560;
}

void c3_80BF560(u8 taskId)
{
    switch(ProcessMenuInputNoWrap_())
    {
        case 0:
            audio_play(5);
            gTasks[taskId].func = sub_810AD58;
            return;
        case -1:
        case 1:
            sub_8072DEC();
            audio_play(5);
            MenuZeroFillWindowRect(23, 8, 29, 13);
            MenuZeroFillWindowRect(2, 16, 27, 19);
            gTasks[taskId].func = sub_810AB84;
    }
}

void sub_810AD58(u8 taskId)
{
    RtcInitLocalTimeOffset(gTasks[taskId].data[TD_HOURS], gTasks[taskId].data[TD_MINUTES]);
    BeginNormalPaletteFade(-1, 0, 0, 16, 0);
    gTasks[taskId].func = sub_810AD9C;
}

void sub_810AD9C(u8 taskId)
{
    if(!gPaletteFade.active)
        SetMainCallback2(gMain.field_8);
}

void sub_810ADC0(u8 taskId)
{
    if(!gPaletteFade.active)
        gTasks[taskId].func = sub_810ADF0;
}

void sub_810ADF0(u8 taskId)
{
    InitClockWithRtc(taskId);
    if(gMain.newKeys & (A_BUTTON | B_BUTTON))
        gTasks[taskId].func = sub_810AE28;
}

void sub_810AE28(u8 taskId)
{
    BeginNormalPaletteFade(-1, 0, 0, 16, 0);
    gTasks[taskId].func = sub_810AE60;
}

void sub_810AE60(u8 taskId)
{
    if(!gPaletteFade.active)
        SetMainCallback2(gMain.field_8);
}

static u8 GetMinHandDelta(u8 speed)
{
    if(speed + 1 > (unsigned)60)
        return 6;
    else if(speed > (unsigned)30)
        return 3;
    else if(speed > (unsigned)10)
        return 2;
    else
        return 1;
}

static u16 GetNewMinHandAngle(u16 angle, u8 direction, u8 speed)
{
    u8 delta = GetMinHandDelta(speed);
    
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

static u8 AdvanceClock(u8 taskId, u8 b)
{
    switch(b)
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
                sub_810AF98(taskId, b);
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
                sub_810AF98(taskId, b);
            }
            break;
    }
    return 0;
}

void sub_810AF98(u8 taskId, u8 b)
{
    u8 hours = gTasks[taskId].data[TD_HOURS];
    
    switch(b)
    {
        case 1:
            switch(hours)
            {
                case 11:
                    gTasks[taskId].data[TD_PERIOD] = AM;
                    break;
                case 23:
                    gTasks[taskId].data[TD_PERIOD] = b;
                    break;
            }
            break;
        case 2:
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
    u16 a;
    u16 b;
    u16 c;
    u16 d;
    u16 x;
    u16 y;
    
    angle = gTasks[sprite->data0].data[TD_MHAND_ANGLE];
    sin = Sin2(angle);
    b = sin / 16;
    cos = Cos2(angle);
    a = cos / 16;
    d = a;
    c = -b;     //Hmm... can't get this right
    SetOamMatrix(0, a, b, c, d);
    x = gClockHandCoords[angle][0];
    y = gClockHandCoords[angle][1];
    
    //Manual sign extension - why?
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
    u16 a;
    u16 b;
    u16 c;
    u16 d;
    u16 x;
    u16 y;
    
    angle = gTasks[sprite->data0].data[TD_HHAND_ANGLE];
    sin = Sin2(angle);
    b = sin / 16;
    cos = Cos2(angle);
    a = cos / 16;
    d = a;
    c = -b;     //Hmm... can't get this right
    SetOamMatrix(0, a, b, c, d);
    x = gClockHandCoords[angle][0];
    y = gClockHandCoords[angle][1];
    
    //Manual sign extension - why?
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
        if((u16)(sprite->data1 - 105) <= 29)
            sprite->data1 += 5;
        if(sprite->data1 <= 104)
            sprite->data1++;
    }
    else
    {
        if((u16)(sprite->data1 - 91) <= 29)
            sprite->data1 -= 5;
        if(sprite->data1 > 120)
            sprite->data1--;
    }
    cos = Cos2((u16)sprite->data1);
    sprite->pos2.x =  cos * 30 / 4096;
    sin = Sin2((u16)sprite->data1);
    sprite->pos2.y = sin * 30 / 4096;
}
