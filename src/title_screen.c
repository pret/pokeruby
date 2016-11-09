#include "global.h"
#include "gba/m4a_internal.h"
#include "main.h"
#include "palette.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"

extern void m4aSongNumStart(u16);
extern void CB2_InitCopyrightScreen(void);
extern void CB2_InitMainMenu(void);
extern void CB2_InitClearSaveDataScreen(void);
extern void CB2_InitResetRtcScreen(void);

extern u8 gReservedSpritePaletteCount;
extern struct MusicPlayerInfo gMPlay_BGM;
extern u8 gUnknown_0202F7E4;
extern u16 gUnknown_030041B4;
extern u16 gUnknown_030042C0;
extern u8 gUnknown_08393210[];
extern u8 gUnknown_08393250[];
extern u8 gUnknown_083939EC[];
extern u8 gUnknown_08393BF8[];
extern u16 gUnknown_08393E64[];
extern struct SpriteTemplate gSpriteTemplate_8393ECC;
extern struct SpriteTemplate gSpriteTemplate_8393EE4;
extern u8 gUnknown_08393EFC[];
extern struct SpriteTemplate gSpriteTemplate_8393F74;
extern u8 gUnknown_08393F8C[];
extern u8 gUnknown_08393F9C[];
extern struct SpriteTemplate gSpriteTemplate_8393FC0;
extern u8 gUnknown_08393FD8[];
extern u8 gUnknown_08E9D8CC[];
extern u8 gUnknown_08E9F624[];
extern u8 gUnknown_08E9F7E4[];

static void sub_807C454(void);
void sub_807C46C(u8);
void sub_807C580(u8);
void sub_807C644(u8);
void CB2_GoToMainMenu(void);
void CB2_GoToClearSaveDataScreen(void);
void CB2_GoToResetRtcScreen(void);
void CB2_GoToCopyrightScreen(void);
void sub_807C7E4(u8);

#define _RGB(r, g, b) ((((b) & 31) << 10) + (((g) & 31) << 5) + ((r) & 31))

#ifdef SAPPHIRE
//Red Kyogre markings
#define MARKING_COLOR(c) RGB((c), 0, 0)
#else
//Blue Groundon markings
#define MARKING_COLOR(c) RGB(0, 0, (c))
#endif


#ifdef SAPPHIRE
#define PLTT_BUFFER_INDEX 26
#else
#define PLTT_BUFFER_INDEX 21
#endif

#define CLEAR_SAVE_BUTTON_COMBO (B_BUTTON | SELECT_BUTTON | DPAD_UP)
#define RESET_RTC_BUTTON_COMBO (B_BUTTON | SELECT_BUTTON | DPAD_LEFT)

void item_menu_type_2(struct Sprite *sprite)
{
    struct Task *task = &gTasks[sprite->data1];
    
    if (task->data[1] != 0)
    {
        sprite->oam.objMode = 0;
        sprite->pos1.y = 66;
        sprite->invisible = FALSE;
    }
    else
    {
        if (task->data[5] != 0)
            task->data[5]--;
        if (task->data[5] <= 63)
        {
            sprite->invisible = FALSE;
            if (sprite->pos1.y != 66)
                sprite->pos1.y++;
            REG_BLDALPHA = gUnknown_08393E64[task->data[5] / 2];
        }
    }
}

void sub_807BE90(struct Sprite *sprite)
{
    struct Task *task = &gTasks[sprite->data1];
    
    if (task->data[1] != 0)
    {
        sprite->oam.objMode = 0;
        sprite->pos1.y = 66;
        sprite->invisible = FALSE;
    }
    else
    {
        if (task->data[5] <= 63)
        {
            sprite->invisible = FALSE;
            if (sprite->pos1.y != 66)
                sprite->pos1.y++;
        }
    }
}

void sub_807BEF0(struct Sprite *sprite)
{
    if (sprite->data0 == 1)
    {
        sprite->data1++;
        if (!(sprite->data1 & 0x10))
            sprite->invisible = TRUE;
        else
            sprite->invisible = FALSE;
    }
    else
        sprite->invisible = FALSE;
}


void sub_807BF28(s16 x, s16 y)
{
    u8 i;
    u8 spriteId;
    
    x -= 32;
    for (i = 0; i < 3; i++, x += 32)
    {
        spriteId = CreateSprite(&gSpriteTemplate_8393F74, x, y, 0);
        StartSpriteAnim(&gSprites[spriteId], i);
        gSprites[spriteId].data0 = 1;
    }
}

void sub_807BF84(s16 x, s16 y)
{
    u8 i;
    u8 spriteId;
    
    x -= 64;
    for (i = 0; i < 5; i++, x += 32)
    {
        spriteId = CreateSprite(&gSpriteTemplate_8393F74, x, y, 0);
        StartSpriteAnim(&gSprites[spriteId], i + 3);
    }
}

void sub_807BFE0(struct Sprite *sprite)
{
    u16 color;
    
    if (gTasks[gUnknown_0202F7E4].data[1] == 0 && sprite->pos1.x <= 271)
    {
        if (sprite->data0 != 0)
        {
            if (sprite->pos1.x <= 119)
            {
                if (sprite->data1 < 31)
                    sprite->data1++;
                if (sprite->data1 < 31)
                    sprite->data1++;
            }
            else
            {
                if (sprite->data1 != 0)
                    sprite->data1--;
                if (sprite->data1 != 0)
                    sprite->data1--;
            }
            color = _RGB(sprite->data1, sprite->data1, sprite->data1);
            gPlttBufferFaded[0] = color;
            gPlttBufferFaded[PLTT_BUFFER_INDEX] = color;
        }
        sprite->pos1.x += 4;
        return;
    }
    else
    {
        gPlttBufferFaded[0] = 0;
        gPlttBufferFaded[PLTT_BUFFER_INDEX] = 0;
        DestroySprite(sprite);
    }
}

void sub_807C088(u8 a)
{
    u8 spriteId = CreateSprite(&gSpriteTemplate_8393FC0, 0, 68, 0);
    
    gSprites[spriteId].oam.objMode = 2;
    gSprites[spriteId].data0 = a;
}

void sub_807C0C8(void)
{
    sub_8089668();
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    REG_BG1VOFS = gUnknown_030041B4;
}

void CB2_InitTitleScreen(void)
{
    switch(gMain.state)
    {
        default:
        case 0:
            SetVBlankCallback(NULL);
            REG_BLDCNT = 0;
            REG_BLDALPHA = 0;
            REG_BLDY = 0;
            *((u16 *)PLTT) = 0x7FFF;
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
            DmaFill16(3, 0, (void *)VRAM, 0x18000);
            DmaFill32(3, 0, (void *)OAM, 0x400);
            DmaFill16(3, 0, (void *)(PLTT + 2), 0x3FE);
            ResetPaletteFade();
            gMain.state = 1;
            break;
        case 1:
            LZ77UnCompVram(gUnknown_08E9D8CC, (void *)VRAM);
            LZ77UnCompVram(gUnknown_08E9F7E4, (void *)(VRAM + 0x4800));
            LoadPalette(gUnknown_08E9F624, 0, 0x1C0);
            LZ77UnCompVram(gUnknown_08393250, (void *)(VRAM + 0x8000));
            LZ77UnCompVram(gUnknown_083939EC, (void *)(VRAM + 0xC000));
            LZ77UnCompVram(gUnknown_08393BF8, (void *)(VRAM + 0xC800));
            LoadPalette(gUnknown_08393210, 0xE0, 0x40);
            remove_some_task();
            ResetTasks();
            ResetSpriteData();
            FreeAllSpritePalettes();
            gReservedSpritePaletteCount = 14;
            LoadCompressedObjectPic(gUnknown_08393EFC);
            LoadCompressedObjectPic(gUnknown_08393F8C);
            LoadCompressedObjectPic(gUnknown_08393FD8);
            LoadPalette(gUnknown_08E9F624, 0x100, 0x1C0);
            LoadSpritePalette(gUnknown_08393F9C);
            gMain.state = 2;
            break;
        case 2:
        {
            u8 taskId = CreateTask(sub_807C46C, 0);
            
            gTasks[taskId].data[0] = 0x100;
            gTasks[taskId].data[1] = 0;
            gTasks[taskId].data[2] = -16;
            gTasks[taskId].data[3] = -32;
            gUnknown_0202F7E4 = taskId;
            gMain.state = 3;
            break;
        }
        case 3:
            BeginNormalPaletteFade(-1, 1, 0x10, 0, 0xFFFF);
            SetVBlankCallback(sub_807C0C8);
            gMain.state = 4;
            break;
        case 4:
        {
            u16 savedIme;
            
            sub_813CE30(0x78, 0x50, 0x100, 0);
            REG_BG2X = 0xFFFFE300;
            REG_BG2Y = 0xFFFFDF00;
            REG_WIN0H = 0;
            REG_WIN0V = 0;
            REG_WIN1H = 0;
            REG_WIN1V = 0;
            REG_WININ = 0x1F1F;
            REG_WINOUT = 0x3F1F;
            REG_BLDCNT = 0x84;
            REG_BLDALPHA = 0;
            REG_BLDY = 0x8;
            REG_BG0CNT = 0x180B;
            REG_BG1CNT = 0x190A;
            REG_BG2CNT = 0x4981;
            savedIme = REG_IME;
            REG_IME = 0;
            REG_IE |= INTR_FLAG_VBLANK;
            REG_IME = savedIme;
            REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;
            REG_DISPCNT = DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG2_ON | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON | DISPCNT_OBJWIN_ON;
            m4aSongNumStart(0x19D);
            gMain.state = 5;
            break;
        }
        case 5:
            if (!UpdatePaletteFade())
            {
                sub_807C088(0);
                sub_8089944(0, 0xA0, 4, 4, 0, 4, 1);
                SetMainCallback2(sub_807C454);
            }
            break;
    }
}

void sub_807C454(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_807C46C(u8 taskId)
{
    if ((gMain.newKeys & (A_BUTTON | B_BUTTON | START_BUTTON | SELECT_BUTTON)) || gTasks[taskId].data[1] != 0)
    {
        gTasks[taskId].data[1] = 1;
        gTasks[taskId].data[0] = 0;
    }
    if (gTasks[taskId].data[0] != 0)
    {
        u16 data0 = gTasks[taskId].data[0];
        
        if (data0 == 0xA0 || data0 == 0x40)
            sub_807C088(1);
        gTasks[taskId].data[0]--;
    }
    else
    {
        u8 spriteId;
        
        REG_DISPCNT = DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG2_ON | DISPCNT_OBJ_ON;
        REG_WININ = 0;
        REG_WINOUT = 0;
        REG_BLDCNT = 0x3F50;
        REG_BLDALPHA = 0x1F;
        REG_BLDY = 0;
        
        //Version left
        spriteId = CreateSprite(&gSpriteTemplate_8393ECC, 0x62, 0x1A, 0);
        gSprites[spriteId].invisible = TRUE;
        gSprites[spriteId].data1 = taskId;
        
        //Version right
        spriteId = CreateSprite(&gSpriteTemplate_8393EE4, 0xA2, 0x1A, 0);
        gSprites[spriteId].invisible = TRUE;
        gSprites[spriteId].data1 = taskId;
        
        gTasks[taskId].data[5] = 0x58;
        gTasks[taskId].data[0] = 0x90;
        gTasks[taskId].func = sub_807C580;
    }
}

void sub_807C580(u8 taskId)
{
    if ((gMain.newKeys & (A_BUTTON | B_BUTTON | START_BUTTON | SELECT_BUTTON)) || gTasks[taskId].data[1] != 0)
    {
        gTasks[taskId].data[1] = 1;
        gTasks[taskId].data[0] = 0;
    }
    if (gTasks[taskId].data[0] != 0)
        gTasks[taskId].data[0]--;
    else
    {
        gTasks[taskId].data[1] = 1;
        REG_DISPCNT = DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG1_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_ON;
        sub_807BF28(120, 108);
        sub_807BF84(120, 148);
        gTasks[taskId].data[4] = 0;
        gTasks[taskId].func = sub_807C644;
    }
    if (!(gTasks[taskId].data[0] & 1) && gTasks[taskId].data[3] != 0)
        gTasks[taskId].data[3]++;
    REG_BG2Y = gTasks[taskId].data[3] * 256;
}

void sub_807C644(u8 taskId)
{    
    REG_BLDCNT = 0x2142;
    REG_BLDALPHA = 0x1F0F;
    REG_BLDY = 0;
    
    if ((gMain.newKeys & A_BUTTON) || (gMain.newKeys & START_BUTTON))
    {
        FadeOutBGM(4);
        BeginNormalPaletteFade(-1, 0, 0, 0x10, 0xFFFF);
        SetMainCallback2(CB2_GoToMainMenu);
    }
    else
    {
        if ((gMain.heldKeys & CLEAR_SAVE_BUTTON_COMBO) == CLEAR_SAVE_BUTTON_COMBO)
            SetMainCallback2(CB2_GoToClearSaveDataScreen);
        if ((gMain.heldKeys & RESET_RTC_BUTTON_COMBO) == RESET_RTC_BUTTON_COMBO
          && sub_80691DC() == 1)
        {
            FadeOutBGM(4);
            BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
            SetMainCallback2(CB2_GoToResetRtcScreen);
        }
        else
        {
            REG_BG2Y = 0;
            gTasks[taskId].data[0]++;
            if (gTasks[taskId].data[0] & 1)
            {
                gTasks[taskId].data[4]++;
                gUnknown_030041B4 = gTasks[taskId].data[4];
                gUnknown_030042C0 = 0;
            }
            sub_807C7E4(gTasks[taskId].data[0]);
            if ((gMPlay_BGM.status & 0xFFFF) == 0)
            {
                BeginNormalPaletteFade(-1, 0, 0, 0x10, 0xFFFF);
                SetMainCallback2(CB2_GoToCopyrightScreen);
            }
        }
    }
}

void CB2_GoToMainMenu(void)
{
    if (!UpdatePaletteFade())
        SetMainCallback2(CB2_InitMainMenu);
}

void CB2_GoToCopyrightScreen(void)
{
    if (!UpdatePaletteFade())
        SetMainCallback2(CB2_InitCopyrightScreen);
}

void CB2_GoToClearSaveDataScreen(void)
{
    if (!UpdatePaletteFade())
        SetMainCallback2(CB2_InitClearSaveDataScreen);
}

void CB2_GoToResetRtcScreen(void)
{
    if (!UpdatePaletteFade())
        SetMainCallback2(CB2_InitResetRtcScreen);
}

//bits 0-1: disable update if nonzero
//bits 2-6: intensity
//bit 7: fade direction
void sub_807C7E4(u8 a)
{
    u16 palette;

    
    if ((a & 3) == 0)
    {
        u8 intensity = (a >> 2) & 0x1F;

        if (((a >> 2) & 0x20) == 0)
            palette = MARKING_COLOR(intensity);
        else
            palette = MARKING_COLOR(31 - intensity);
        LoadPalette(&palette, 0xEF, sizeof(palette));
   }
}

