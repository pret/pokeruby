#include "gba/io_reg.h"
#include "gba/macro.h"
#include "main.h"
#include "menu.h"
#include "sprite.h"
#include "task.h"
#include "global.h"
#include "text.h"
#include "palette.h"
#include "rtc.h"

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

extern const struct WindowConfig gWindowConfig_81E6C3C;
extern const struct WindowConfig gWindowConfig_81E6CE4;
extern struct SpriteTemplate gSpriteTemplate_83F7AD8;
extern struct SpriteTemplate gSpriteTemplate_83F7AF0;
extern struct SpriteTemplate gSpriteTemplate_83F7B28;
extern struct SpriteTemplate gSpriteTemplate_83F7B40;

extern void sub_810A704(void);
void sub_810AB3C(void);
extern void sub_810ADC0(u8 taskId);
void sub_810AB54(u8 taskId);
extern void sub_810AB84(u8 taskId);
void sub_810AC60(u8 taskId);
u16 sub_810AEAC(u16 r0, u8 r1, u8 r2);
extern void sub_810AEFC(u8 r0, u8 r1);
extern void c3_80BF560(u8 taskId);
extern void sub_810AD58(u8 taskId);
void sub_810AD9C(u8 taskId);
void sub_810ADF0(u8 taskId);
void sub_810AE28(u8 taskId);
void sub_810AE60(u8 taskId);

//ToDo: Figure out these damn DMA operations!
void LoadWallClockGraphics(void)
{
    u8 *addr;
    u32 r4;
    
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
    r4 = 0x18000;
    do
    {
        u16 temp = 0;
        DmaSet(3, &temp, addr, 0x81000800);
        addr += 0x1000;
        r4 -= 0x1000;
    }
    while(r4 > 0x1000);
    
    {
        u16 temp = 0; //sp
        DmaSet(3, &temp, addr, 0x81000100);
    }
    {
        u16 temp = 0; //sp + 4
        DmaSet(3, &temp, 0x07000000, 0x85000100);
    }
    {
        u16 temp = 0; //sp
        DmaSet(3, &temp, 0x05000000, 0x81000200);
    }
    
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

void sub_810A864(void)
{
    u16 ime;
    
    BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
    ime = REG_IME;
    REG_IME = 0;
    REG_IE |= 0x1;
    REG_IME = ime;
    REG_DISPSTAT |= 0x8;
    SetVBlankCallback(sub_810A704);
    SetMainCallback2(sub_810AB3C);
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
    gTasks[taskId].data[2] = 10;
    gTasks[taskId].data[3] = 0;
    gTasks[taskId].data[4] = 0;
    gTasks[taskId].data[5] = 0;
    gTasks[taskId].data[6] = 0;
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = 300;
    
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
    
    sub_810A864();
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
    sub_810AFE0(taskId);
    if(gTasks[taskId].data[2] == 0)
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
    
    sub_810A864();
}

void sub_810AB3C(void)
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
    if(gTasks[taskId].data[0] % 6)
    {
        gTasks[taskId].data[0] = sub_810AEAC(gTasks[taskId].data[0], gTasks[taskId].data[4], gTasks[taskId].data[6]);
    }
    else
    {
        //_0810ABB8
        gTasks[taskId].data[0] = gTasks[taskId].data[3] * 6;
        gTasks[taskId].data[1] = (gTasks[taskId].data[2] % 12) * 30 + (gTasks[taskId].data[3] / 10) * 5;
        if(gMain.newKeys & 1)
        {
            gTasks[taskId].func = sub_810AC60;
            return;
        }
        else
        {
            gTasks[taskId].data[4] = gMain.newKeys & 1;
            if(gMain.heldKeys & 0x20)
                gTasks[taskId].data[4] = 1;
            if(gMain.heldKeys & 0x10)
                gTasks[taskId].data[4] = 2;
            if(gTasks[taskId].data[4] != 0)
            {
                if(gTasks[taskId].data[6] <= 0xFE)
                    gTasks[taskId].data[6]++;
                gTasks[taskId].data[0] = sub_810AEAC(gTasks[taskId].data[0], gTasks[taskId].data[4], gTasks[taskId].data[6]);
                sub_810AEFC(taskId, gTasks[taskId].data[4]);
            }
            else
            {
                gTasks[taskId].data[6] = 0;
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
    RtcInitLocalTimeOffset(gTasks[taskId].data[2], gTasks[taskId].data[3]);
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
    sub_810AFE0(taskId);
    if(gMain.newKeys & 3)
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

u8 sub_810AE84(u8 n)
{
    if(n + 1 > (unsigned)60)
        return 6;
    else if(n > (unsigned)30)
        return 3;
    else if(n > (unsigned)10)
        return 2;
    else
        return 1;
}

u16 sub_810AEAC(u16 a, u8 b, u8 c)
{
    switch(b)
    {
        case 1:
        {
            
        }
        case 2:
        {
            
        }
    }
}