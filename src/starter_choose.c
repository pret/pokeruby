#include "gba/gba.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "sprite.h"
#include "task.h"
#include "text.h"

//Functions that need to be put in headers
void LZ77UnCompVram(const void *src, void *dest);
void remove_some_task(void);
void LoadCompressedObjectPic(void *);

extern u8 gUnknown_083F76B8[];
extern u8 gUnknown_083F66F0[];
extern u8 gBirchBagTilemap[];
extern u8 gBirchGrassTilemap[];
extern u8 gUnknown_083F7794[];
extern u8 gUnknown_083F77A4[];
extern u8 gUnknown_083F62EC[];
extern u8 gUnknown_083F76BE[];
extern u16 gUnknown_083F76C4[];

//Text
extern u8 gOtherText_BirchInTrouble[];

extern struct WindowConfig gWindowConfig_81E6C3C;
extern struct WindowConfig gWindowConfig_81E6CE4;
extern struct SpriteTemplate gSpriteTemplate_83F77E4;
extern struct SpriteTemplate gSpriteTemplate_83F77CC;
extern struct SpritePalette gUnknown_083F77B4[];
extern struct SpriteTemplate gSpriteTemplate_83F77FC;

static u16 sub_8109E50(u16);
static void sub_810A11C(void);
static void sub_810A134(u8 taskId);
static void sub_810A178(u8 taskId);

extern void sub_810A42C(u8, u8);
extern u8 sub_810A580(u16, u8, u8);

static u16 sub_8109E50(u16 a)
{
    if(a > 3)
        a = 0;
    return gUnknown_083F76C4[a];
}

static void sub_8109E6C(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_8109E80(void)
{
    u16 savedIme;
    u8 taskId;
    u8 spriteId;
    
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
    
    //ToDo: DMA
    DmaFill16(3, 0, VRAM, VRAM_SIZE);
    DmaFill32(3, 0, OAM, OAM_SIZE);
    DmaFill16(3, 0, PLTT, PLTT_SIZE);
    
    LZ77UnCompVram(&gUnknown_083F66F0, (void *)VRAM);
    LZ77UnCompVram(&gBirchBagTilemap, (void *)(VRAM + 0x3000));
    LZ77UnCompVram(&gBirchGrassTilemap, (void *)(VRAM + 0x3800));
    remove_some_task();
    ResetTasks();
    ResetSpriteData();
    ResetPaletteFade();
    FreeAllSpritePalettes();
    LoadPalette(gUnknown_083F62EC, 0, 0x40);
    LoadCompressedObjectPic(gUnknown_083F7794);
    LoadCompressedObjectPic(gUnknown_083F77A4);
    LoadSpritePalettes(gUnknown_083F77B4);
    SetUpWindowConfig(&gWindowConfig_81E6C3C);
    InitMenuWindow(&gWindowConfig_81E6CE4);
    BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
    
    savedIme = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_IME = savedIme;
    REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;
    
    SetVBlankCallback(sub_8109E6C);
    SetMainCallback2(sub_810A11C);
    
    REG_WININ = 0x3F;
    REG_WINOUT = 0x1F;
    REG_WIN0H = 0;
    REG_WIN0V = 0;
    REG_BLDCNT = 0xFE;
    REG_BLDALPHA = 0;
    REG_BLDY = 0x7;
    REG_BG3CNT = 0x703;
    REG_BG2CNT = 0x602;
    REG_BG0CNT = 0x1F08;
    REG_DISPCNT = 0x3D40;
    
    taskId = CreateTask(sub_810A134, 0);
    gTasks[taskId].data[0] = 1;
    
    //Create bag sprite, maybe?
    spriteId = CreateSprite(&gSpriteTemplate_83F77CC, 120, 56, 2);
    gSprites[spriteId].data0 = taskId;
    
    //Create Pokeball sprites, maybe?
    spriteId = CreateSprite(&gSpriteTemplate_83F77E4, gUnknown_083F76B8[0], gUnknown_083F76B8[1], 2);
    gSprites[spriteId].data0 = taskId;
    gSprites[spriteId].data1 = 0;
    
    spriteId = CreateSprite(&gSpriteTemplate_83F77E4, gUnknown_083F76B8[2], gUnknown_083F76B8[3], 2);
    gSprites[spriteId].data0 = taskId;
    gSprites[spriteId].data1 = 1;
    
    spriteId = CreateSprite(&gSpriteTemplate_83F77E4, gUnknown_083F76B8[4], gUnknown_083F76B8[5], 2);
    gSprites[spriteId].data0 = taskId;
    gSprites[spriteId].data1 = 2;
}

static void sub_810A11C(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_810A134(u8 taskId)
{
    sub_810A42C(0xFF, gTasks[taskId].data[0]);
    MenuDrawTextWindow(2, 14, 27, 19);
    MenuPrint(gOtherText_BirchInTrouble, 3, 15);
    gTasks[taskId].func = sub_810A178;
}

static void sub_810A178(u8 taskId)
{
    u8 data0 = gTasks[taskId].data[0];
    u8 spriteId;
    
    if(gMain.newKeys & 1)
    {
        u8 unk1;
        u8 unk2;
        
        MenuZeroFillWindowRect(gUnknown_083F76BE[data0 * 2],
          gUnknown_083F76BE[2 * data0 + 1],
          gUnknown_083F76BE[2 * data0] + 13,
          gUnknown_083F76BE[2 * data0 + 1] + 3);
        REG_WIN0H = 0;
        REG_WIN0V = 0;
        
        unk1 = gUnknown_083F76B8[data0 * 2];
        unk2 = gUnknown_083F76B8[data0 * 2 + 1];
        
        spriteId = CreateSprite(&gSpriteTemplate_83F77FC,
          unk1,
          unk2,
          1);
        gTasks[taskId].data[2] = spriteId;
        sub_810A580(sub_8109E50(gTasks[taskId].data[0]),
          unk1,
          unk2);
    }
}