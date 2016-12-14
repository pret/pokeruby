#include "global.h"
#include "starter_choose.h"
#include "asm.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "pokedex.h"
#include "songs.h"
#include "sound.h"
#include "string_util.h"
#include "task.h"
#include "trig.h"
#include "decompress.h"
#include "sprite.h"

struct MonCoords
{
    u8 x, y;
};

extern void * const gUnknown_081FAF4C[];
extern const u8 gStarterChoose_PokeballCoords[][2];
extern u8 gBirchHelpGfx[];
extern u8 gBirchBagTilemap[];
extern u8 gBirchGrassTilemap[];
extern struct SpriteSheet gUnknown_083F7794;
extern struct SpriteSheet gUnknown_083F77A4;
extern u8 gBirchBagGrassPal[];
extern const u8 gStarterChoose_LabelCoords[][2];
extern u16 gStarterMons[];
extern union AffineAnimCmd *gUnknown_083F778C[];
extern u8 gOtherText_DoYouChoosePoke[];
extern u16 gScriptResult;
extern u8 gSpeciesNames[][11];
extern u8 gOtherText_Poke[];
extern const struct SpriteSheet gMonFrontPicTable[];
extern const struct MonCoords gMonFrontPicCoords[];
extern const struct SpritePalette gMonPaletteTable[];
extern u8 gUnknown_083F76E4[][2];
extern u8 gOtherText_BirchInTrouble[];

extern struct SpriteTemplate gSpriteTemplate_83F77E4;
extern struct SpriteTemplate gSpriteTemplate_83F77CC;
extern struct SpritePalette gUnknown_083F77B4[];
extern struct SpriteTemplate gSpriteTemplate_83F77FC;
extern struct SpriteTemplate gUnknown_02024E8C;

static void MainCallback2(void);
static void Task_StarterChoose1(u8 taskId);
static void Task_StarterChoose2(u8 taskId);
static void Task_StarterChoose3(u8 taskId);
static void Task_StarterChoose4(u8 taskId);
static void Task_StarterChoose5(u8 taskId);
static void Task_StarterChoose6(u8 taskId);

static void CreateStarterPokemonLabel(u8, u8);
static u8 CreatePokemonFrontSprite(u16, u8, u8);

//Position of the sprite of the selected starter Pokemon
#define STARTER_PKMN_POS_X 120
#define STARTER_PKMN_POS_Y 64

//Task data
enum {
    TD_STARTERSELECTION,
    TD_PKMN_SPRITE_ID,
    TD_CIRCLE_SPRITE_ID,
};

//Retrieves one of the available starter Pokemon
u16 GetStarterPokemon(u16 n)
{
    if(n > 3)
        n = 0;
    return gStarterMons[n];
}

static void VblankCallback(void)
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
    
    LZ77UnCompVram(&gBirchHelpGfx, (void *)VRAM);
    LZ77UnCompVram(&gBirchBagTilemap, (void *)(VRAM + 0x3000));
    LZ77UnCompVram(&gBirchGrassTilemap, (void *)(VRAM + 0x3800));
    remove_some_task();
    ResetTasks();
    ResetSpriteData();
    ResetPaletteFade();
    FreeAllSpritePalettes();
    LoadPalette(gBirchBagGrassPal, 0, 0x40);
    LoadCompressedObjectPic(&gUnknown_083F7794);
    LoadCompressedObjectPic(&gUnknown_083F77A4);
    LoadSpritePalettes(gUnknown_083F77B4);
    SetUpWindowConfig(&gWindowConfig_81E6C3C);
    InitMenuWindow(&gWindowConfig_81E6CE4);
    BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
    
    savedIme = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_IME = savedIme;
    REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;
    
    SetVBlankCallback(VblankCallback);
    SetMainCallback2(MainCallback2);
    
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
    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG2_ON | DISPCNT_BG3_ON | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON;
    
    taskId = CreateTask(Task_StarterChoose1, 0);
    gTasks[taskId].data[TD_STARTERSELECTION] = 1;
    
    //Create hand sprite
    spriteId = CreateSprite(&gSpriteTemplate_83F77CC, 120, 56, 2);
    gSprites[spriteId].data0 = taskId;
    
    //Create three Pokeball sprites
    spriteId = CreateSprite(
      &gSpriteTemplate_83F77E4,
      gStarterChoose_PokeballCoords[0][0], gStarterChoose_PokeballCoords[0][1], 2);
    gSprites[spriteId].data0 = taskId;
    gSprites[spriteId].data1 = 0;
    spriteId = CreateSprite(
      &gSpriteTemplate_83F77E4,
      gStarterChoose_PokeballCoords[1][0], gStarterChoose_PokeballCoords[1][1], 2);
    gSprites[spriteId].data0 = taskId;
    gSprites[spriteId].data1 = 1;
    spriteId = CreateSprite(
      &gSpriteTemplate_83F77E4,
      gStarterChoose_PokeballCoords[2][0], gStarterChoose_PokeballCoords[2][1], 2);
    gSprites[spriteId].data0 = taskId;
    gSprites[spriteId].data1 = 2;
}

static void MainCallback2(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void Task_StarterChoose1(u8 taskId)
{
    CreateStarterPokemonLabel(0xFF, gTasks[taskId].data[TD_STARTERSELECTION]);
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
        
        MenuZeroFillWindowRect(
          gStarterChoose_LabelCoords[selection][0],
          gStarterChoose_LabelCoords[selection][1],
          gStarterChoose_LabelCoords[selection][0] + 13,
          gStarterChoose_LabelCoords[selection][1] + 3);
        
        REG_WIN0H = 0;
        REG_WIN0V = 0;
        
        //Create white circle background
        spriteId = CreateSprite(
          &gSpriteTemplate_83F77FC,
          gStarterChoose_PokeballCoords[selection][0],
          gStarterChoose_PokeballCoords[selection][1],
          1);
        gTasks[taskId].data[TD_CIRCLE_SPRITE_ID] = spriteId;
        
        //Create Pokemon sprite
        spriteId = CreatePokemonFrontSprite(
          GetStarterPokemon(gTasks[taskId].data[TD_STARTERSELECTION]),
          gStarterChoose_PokeballCoords[selection][0],
          gStarterChoose_PokeballCoords[selection][1]);
        gSprites[spriteId].affineAnims = gUnknown_083F778C;
        gSprites[spriteId].callback = StarterPokemonSpriteAnimCallback;
        gTasks[taskId].data[TD_PKMN_SPRITE_ID] = spriteId;
        
        gTasks[taskId].func = Task_StarterChoose3;
    }
    else
    {
        if((gMain.newKeys & DPAD_LEFT) && selection > 0)
        {
            gTasks[taskId].data[TD_STARTERSELECTION]--;
            CreateStarterPokemonLabel(selection, gTasks[taskId].data[TD_STARTERSELECTION]);
        }
        else if((gMain.newKeys & DPAD_RIGHT) && selection < 2)
        {
            gTasks[taskId].data[TD_STARTERSELECTION]++;
            CreateStarterPokemonLabel(selection, gTasks[taskId].data[TD_STARTERSELECTION]);
        }
    }
}

static void Task_StarterChoose3(u8 taskId)
{
    if(gSprites[gTasks[taskId].data[TD_CIRCLE_SPRITE_ID]].affineAnimEnded &&
      gSprites[gTasks[taskId].data[TD_CIRCLE_SPRITE_ID]].pos1.x == STARTER_PKMN_POS_X &&
      gSprites[gTasks[taskId].data[TD_CIRCLE_SPRITE_ID]].pos1.y == STARTER_PKMN_POS_Y)
    {
        gTasks[taskId].func = Task_StarterChoose4;
    }
}

static void Task_StarterChoose4(u8 taskId)
{
    PlayCry1(GetStarterPokemon(gTasks[taskId].data[TD_STARTERSELECTION]), 0);
    MenuDrawTextWindow(2, 14, 27, 19);
    //"Do you choose this POKEMON?"
    MenuPrint(gOtherText_DoYouChoosePoke, 3, 15);
    DisplayYesNoMenu(21, 7, 1);
    gTasks[taskId].func = Task_StarterChoose5;
}

static void Task_StarterChoose5(u8 taskId)
{
    u8 spriteId;
    
    switch(ProcessMenuInputNoWrap_())
    {
        case 0:		//YES
            //Return the starter choice and exit.
            gScriptResult = gTasks[taskId].data[TD_STARTERSELECTION];
            SetMainCallback2(gMain.field_8);
            break;
        case 1:     //NO
        case -1:    //B button
            PlaySE(SE_SELECT);
            MenuZeroFillWindowRect(21, 7, 27, 12);
            
            spriteId = gTasks[taskId].data[TD_PKMN_SPRITE_ID];
            FreeSpritePaletteByTag(GetSpritePaletteTagByPaletteNum(gSprites[spriteId].oam.paletteNum));
            FreeOamMatrix(gSprites[spriteId].oam.matrixNum);
            DestroySprite(&gSprites[spriteId]);
            
            spriteId = gTasks[taskId].data[TD_CIRCLE_SPRITE_ID];
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

static void AddTextColorCtrlCode(u8 *string, u8 bgColor, u8 textColor, u8 shadowColor)
{
    *(string++) = EXT_CTRL_CODE_BEGIN;
    *(string++) = 4;
    *(string++) = textColor;
    *(string++) = bgColor;
    *(string++) = shadowColor;
}

#define SET_CHAR(str, index, c) \
{                               \
    u8 *p = str + index;        \
    *p = c;                     \
}

static void CreateStarterPokemonLabel(u8 prevSelection, u8 selection)
{
    u8 labelText[72];
    u8 *category;
    u8 srcIndex;
    u8 dstIndex;
    u16 species;
    
    u8 labelLeft;
    u8 labelRight;
    u8 labelTop;
    u8 labelBottom;
    
    if(prevSelection != 0xFF)
    {
        //Remove the old Pokemon label
        MenuZeroFillWindowRect(
          gStarterChoose_LabelCoords[prevSelection][0],
          gStarterChoose_LabelCoords[prevSelection][1],
          gStarterChoose_LabelCoords[prevSelection][0] + 13,
          gStarterChoose_LabelCoords[prevSelection][1] + 3);
        REG_WIN0H = 0;
        REG_WIN0V = 0;
    }
    species = GetStarterPokemon(selection);
    category = GetPokemonCategory(SpeciesToNationalPokedexNum(species));
    AddTextColorCtrlCode(labelText, 0, 15, 8);
    dstIndex = 5;
    SET_CHAR(labelText, 5, EXT_CTRL_CODE_BEGIN);
    SET_CHAR(labelText, 6, 0x11);
    SET_CHAR(labelText, 7, dstIndex);
    
    //Copy category string to label
    dstIndex = 8;
    srcIndex = 0;
    while(category[srcIndex] != EOS && srcIndex <= 10)
    {
        labelText[dstIndex] = category[srcIndex];
        srcIndex++;
        dstIndex++;
    }
    labelText[dstIndex++] = CHAR_SPACE;
    
    //Copy POKEMON string to label
    StringCopy(labelText + dstIndex, gOtherText_Poke);
    MenuPrint(
      labelText,
      gStarterChoose_LabelCoords[selection][0],
      gStarterChoose_LabelCoords[selection][1]);
    AddTextColorCtrlCode(labelText, 0, 15, 8);
    
    //Copy Pokemon name to label
    sub_8072C74(labelText + 5, gSpeciesNames[species], 0x6B, 1);
    MenuPrint(
      labelText,
      gStarterChoose_LabelCoords[selection][0],
      gStarterChoose_LabelCoords[selection][1] + 2);
    
    labelLeft = gStarterChoose_LabelCoords[selection][0] * 8 + 4;
    labelRight = (gStarterChoose_LabelCoords[selection][0] + 13) * 8 + 4;
    labelTop = gStarterChoose_LabelCoords[selection][1] * 8;
    labelBottom = (gStarterChoose_LabelCoords[selection][1] + 4) * 8;
    REG_WIN0H = WIN_RANGE(labelLeft, labelRight);
    REG_WIN0V = WIN_RANGE(labelTop, labelBottom);
}

void nullsub_72(struct Sprite *sprite)
{
    
}

static u8 CreatePokemonFrontSprite(u16 species, u8 x, u8 y)
{
    u8 spriteId;
    
    DecompressPicFromTable_2(
      &gMonFrontPicTable[species],
      gMonFrontPicCoords[species].x, gMonFrontPicCoords[species].y,
      gUnknown_081FAF4C[0], gUnknown_081FAF4C[1],
      species);
    LoadCompressedObjectPalette(&gMonPaletteTable[species]);
    GetMonSpriteTemplate_803C56C(species, 1);
    spriteId = CreateSprite(&gUnknown_02024E8C, x, y, 0);
    gSprites[spriteId].callback = nullsub_72;
    gSprites[spriteId].oam.priority = 0;
    return spriteId;
}

//Sprite callback
void sub_810A62C(struct Sprite *sprite)
{
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
void StarterPokemonSpriteAnimCallback(struct Sprite *sprite)
{
    //Move sprite to upper center of screen
    if(sprite->pos1.x > STARTER_PKMN_POS_X)
        sprite->pos1.x -= 4;
    if(sprite->pos1.x < STARTER_PKMN_POS_X)
        sprite->pos1.x += 4;
    if(sprite->pos1.y > STARTER_PKMN_POS_Y)
        sprite->pos1.y -= 2;
    if(sprite->pos1.y < STARTER_PKMN_POS_Y)
        sprite->pos1.y += 2;
}
