#include "gba/gba.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "pokemon.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
#include "trig.h"

//Functions that need to be put in headers
void LZ77UnCompVram(const void *src, void *dest);
void remove_some_task(void);
void LoadCompressedObjectPic(void *);
void LoadCompressedObjectPalette(const struct SpritePalette *);
u16 SpeciesToNationalPokedexNum(u16);
void DecompressPicFromTable_2(const struct SpriteSheet *, u8, u8, void *, void *, u32);

struct MonCoords
{
    u8 x, y;
};

extern void * const gUnknown_081FAF4C[];
extern const u8 gStarterChoose_PokeballCoords[][2];
extern u8 gUnknown_083F66F0[];
extern u8 gBirchBagTilemap[];
extern u8 gBirchGrassTilemap[];
extern u8 gUnknown_083F7794[];
extern u8 gUnknown_083F77A4[];
extern u8 gUnknown_083F62EC[];
extern const u8 gUnknown_083F76BE[][2];
extern u16 gStarterMons[];
extern union AffineAnimCmd *gUnknown_083F778C[];
extern char gOtherText_DoYouChoosePoke[];
extern u16 gScriptResult;
extern char gSpeciesNames[][11];
extern char gOtherText_Poke[];
extern const struct SpriteSheet gMonFrontPicTable[];
extern const struct MonCoords gMonFrontPicCoords[];
extern const struct SpritePalette gMonPaletteTable[];
extern u8 gUnknown_083F76E4[][2];

//Text
extern char gOtherText_BirchInTrouble[];

extern struct WindowConfig gWindowConfig_81E6C3C;
extern struct WindowConfig gWindowConfig_81E6CE4;
extern struct SpriteTemplate gSpriteTemplate_83F77E4;
extern struct SpriteTemplate gSpriteTemplate_83F77CC;
extern struct SpritePalette gUnknown_083F77B4[];
extern struct SpriteTemplate gSpriteTemplate_83F77FC;
extern struct SpriteTemplate gUnknown_02024E8C;

u16 sub_8109E50(u16);   //This seems to be used in other modules
static void sub_810A11C(void);
static void Task_StarterChoose1(u8 taskId);
static void Task_StarterChoose2(u8 taskId);
static void Task_StarterChoose3(u8 taskId);
static void Task_StarterChoose4(u8 taskId);
static void Task_StarterChoose5(u8 taskId);
static void Task_StarterChoose6(u8 taskId);

static void sub_810A42C(u8, u8);
static u8 sub_810A580(u16, u8, u8);
void sub_810A6C4(struct Sprite *);
extern u8 *sub_8090D3C(u16);

//Task data
enum {
    TD_STARTERSELECTION,
};

u16 sub_8109E50(u16 a)
{
    if(a > 3)
        a = 0;
    return gStarterMons[a];
}

static void sub_8109E6C(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void CB2_ChooseStarter(void)
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
    
    taskId = CreateTask(Task_StarterChoose1, 0);
    gTasks[taskId].data[TD_STARTERSELECTION] = 1;
    
    //Create hand sprite, maybe?
    spriteId = CreateSprite(&gSpriteTemplate_83F77CC, 120, 56, 2);
    gSprites[spriteId].data0 = taskId;
    
    //Create Pokeball sprites, maybe?
    spriteId = CreateSprite(&gSpriteTemplate_83F77E4, gStarterChoose_PokeballCoords[0][0], gStarterChoose_PokeballCoords[0][1], 2);
    gSprites[spriteId].data0 = taskId;
    gSprites[spriteId].data1 = 0;
    
    spriteId = CreateSprite(&gSpriteTemplate_83F77E4, gStarterChoose_PokeballCoords[1][0], gStarterChoose_PokeballCoords[1][1], 2);
    gSprites[spriteId].data0 = taskId;
    gSprites[spriteId].data1 = 1;
    
    spriteId = CreateSprite(&gSpriteTemplate_83F77E4, gStarterChoose_PokeballCoords[2][0], gStarterChoose_PokeballCoords[2][1], 2);
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

static void Task_StarterChoose1(u8 taskId)
{
    sub_810A42C(0xFF, gTasks[taskId].data[TD_STARTERSELECTION]);
    MenuDrawTextWindow(2, 14, 27, 19);
    MenuPrint(gOtherText_BirchInTrouble, 3, 15);
    gTasks[taskId].func = Task_StarterChoose2;
}

static void Task_StarterChoose2(u8 taskId)
{
    u8 selection = gTasks[taskId].data[TD_STARTERSELECTION];
    
    if(gMain.newKeys & A_BUTTON)
    {
        u8 spriteId;
        
        MenuZeroFillWindowRect(gUnknown_083F76BE[selection][0],
          gUnknown_083F76BE[selection][1],
          gUnknown_083F76BE[selection][0] + 13,
          gUnknown_083F76BE[selection][1] + 3);
        
        REG_WIN0H = 0;
        REG_WIN0V = 0;
        
        spriteId = CreateSprite(&gSpriteTemplate_83F77FC,
          gStarterChoose_PokeballCoords[selection][0],
          gStarterChoose_PokeballCoords[selection][1],
          1);
        gTasks[taskId].data[2] = spriteId;
        spriteId = sub_810A580(sub_8109E50(gTasks[taskId].data[TD_STARTERSELECTION]),
          gStarterChoose_PokeballCoords[selection][0],
          gStarterChoose_PokeballCoords[selection][1]);
          
        gSprites[spriteId].affineAnims = gUnknown_083F778C;
        gSprites[spriteId].callback = sub_810A6C4;
        gTasks[taskId].data[1] = spriteId;
        gTasks[taskId].func = Task_StarterChoose3;
    }
    else
    {
        if((gMain.newKeys & DPAD_LEFT) && selection != 0)
        {
            gTasks[taskId].data[TD_STARTERSELECTION]--;
            sub_810A42C(selection, gTasks[taskId].data[TD_STARTERSELECTION]);
        }
        else if((gMain.newKeys & DPAD_RIGHT) && selection <= 1)
        {
            gTasks[taskId].data[TD_STARTERSELECTION]++;
            sub_810A42C(selection, gTasks[taskId].data[TD_STARTERSELECTION]);
        }
    }
}

static void Task_StarterChoose3(u8 taskId)
{
    if(gSprites[gTasks[taskId].data[2]].affineAnimEnded &&
      gSprites[gTasks[taskId].data[2]].pos1.x == 120 &&
      gSprites[gTasks[taskId].data[2]].pos1.y == 64)
    {
        gTasks[taskId].func = Task_StarterChoose4;
    }
}

static void Task_StarterChoose4(u8 taskId)
{
    PlayCry1(sub_8109E50(gTasks[taskId].data[TD_STARTERSELECTION]), 0);
    MenuDrawTextWindow(2, 14, 27, 19);
    MenuPrint(gOtherText_DoYouChoosePoke, 3, 15);
    DisplayYesNoMenu(21, 7, 1);
    gTasks[taskId].func = Task_StarterChoose5;
}

static void Task_StarterChoose5(u8 taskId)
{
    u8 spriteId;
    
    switch(ProcessMenuInputNoWrap_())
    {
        case 0:
            gScriptResult = gTasks[taskId].data[TD_STARTERSELECTION];
            SetMainCallback2(gMain.field_8);
            break;
        case 1:
        case -1:
            PlaySE(SE_SELECT);
            MenuZeroFillWindowRect(21, 7, 27, 12);
            spriteId = gTasks[taskId].data[1];
            FreeSpritePaletteByTag(GetSpritePaletteTagByPaletteNum(gSprites[spriteId].oam.paletteNum));
            FreeOamMatrix(gSprites[spriteId].oam.matrixNum);
            DestroySprite(&gSprites[spriteId]);
            spriteId = gTasks[taskId].data[2];
            FreeOamMatrix(gSprites[spriteId].oam.matrixNum);
            DestroySprite(&gSprites[spriteId]);
            gTasks[taskId].func = Task_StarterChoose6;
            break;
    }
}

static void Task_StarterChoose6(u8 taskId)
{
    gTasks[taskId].func = Task_StarterChoose1;
}

static void sub_810A410(u8 *arr, u8 b, u8 c, u8 d)
{
    *(arr++) = 0xFC;
    *(arr++) = 4;
    *(arr++) = c;
    *(arr++) = b;
    *(arr++) = d;
}

static void sub_810A42C(u8 a, u8 b)
{
    u8 arr[0x48];
    u8 *ptr;
    u8 d;
    u8 e;
    u16 species;
    
    if(a != 0xFF)
    {
        MenuZeroFillWindowRect(gUnknown_083F76BE[a][0],
          gUnknown_083F76BE[a][1],
          gUnknown_083F76BE[a][0] + 0xD,
          gUnknown_083F76BE[a][1] + 3);
        REG_WIN0H = 0;
        REG_WIN0V = 0;
    }
    species = sub_8109E50(b);
    ptr = sub_8090D3C(SpeciesToNationalPokedexNum(species));
    sub_810A410(arr, 0, 15, 5);

    //FixMe: Compiler insists on optimizing the array indexes,
    //and I can't stop it from doing so.
    {
        u8 *p = arr;
        p += 5;
        *p = 0xFC;
    }
    {
        u8 *p = arr;
        p += 6;
        *p = 0x11;
    }
    {
        u8 *p = arr;
        p += 7;
        *p = 5;
    }
    e = 8;
    d = 0;
    while(*ptr != 0xFF)
    {
        arr[e] = ptr[d];
        d++;
        e++;        
        if(ptr[d] == 0xFF)
            break;
        if(d > 0xA)
            break;
    }
    e++;
    arr[e] = 0;
    StringCopy(arr + e, gOtherText_Poke);
    MenuPrint(arr, gUnknown_083F76BE[b][0], gUnknown_083F76BE[b][1]);
    sub_810A410(arr, 0, 15, 8);
    sub_8072C74(arr + 5, gSpeciesNames[species], 0x6B, 1);
    MenuPrint(arr, gUnknown_083F76BE[b][0], gUnknown_083F76BE[b][1] + 2);
    //ToDo: finish this
}

void nullsub_72(struct Sprite *sprite)
{
    
}

static u8 sub_810A580(u16 a, u8 b, u8 c)
{
    u8 spriteId;
    
    DecompressPicFromTable_2(&gMonFrontPicTable[a], gMonFrontPicCoords[a].x, gMonFrontPicCoords[a].y, gUnknown_081FAF4C[0], gUnknown_081FAF4C[1], a);
    LoadCompressedObjectPalette(&gMonPaletteTable[a]);
    GetMonSpriteTemplate_803C56C(a, 1);
    spriteId = CreateSprite(&gUnknown_02024E8C, b, c, 0);
    gSprites[spriteId].callback = nullsub_72;
    gSprites[spriteId].oam.priority = 0;
    return spriteId;
}

//Sprite callback
void sub_810A62C(struct Sprite *sprite)
{
    //Wow, the compiler is very stupid with optimization here!
    sprite->pos1.x = gUnknown_083F76E4[gTasks[sprite->data0].data[TD_STARTERSELECTION]][0];
    sprite->pos1.y = gUnknown_083F76E4[gTasks[sprite->data0].data[TD_STARTERSELECTION]][1];
    sprite->pos2.y = Sin(sprite->data1, 8);
    sprite->data1 = (u8)sprite->data1 + 4;
}

//Sprite callback
void sub_810A68C(struct Sprite *sprite)
{
    if(gTasks[sprite->data0].data[TD_STARTERSELECTION] == sprite->data1)
        StartSpriteAnimIfDifferent(sprite, 1);
    else
        StartSpriteAnimIfDifferent(sprite, 0);
}

//Sprite callback
void sub_810A6C4(struct Sprite *sprite)
{
    if(sprite->pos1.x > 0x78)
        sprite->pos1.x -= 4;
    if(sprite->pos1.x <= 0x77)
        sprite->pos1.x += 4;
    if(sprite->pos1.y > 0x40)
        sprite->pos1.y -= 2;
    if(sprite->pos1.y <= 0x3F)
        sprite->pos1.y += 2;
}
