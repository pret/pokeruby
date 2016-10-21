#include "gba/gba.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "rng.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "text.h"

struct PokedexListItem {
    u16 a;
    u16 seen:1;
    u16 owned:1;
    //u8 c;
};

struct PokedexView {
    struct PokedexListItem unk0[386];    //data on the 386 different Pokemon
    u16 unk608;
    u8 unk60A_1:1;
    u8 unk60A_2:1;
    u8 unk60B;
    u16 unk60C;
    u16 unk60E;     //selected Pokemon (index of unk0)
    u16 unk610;
    u16 unk612;
    u16 unk614;
    u16 unk616;     //order
    u16 unk618;
    u16 unk61A;
    u16 unk61C;
    u16 unk61E[4];
    u16 unk626;     //some sprite id
    u16 unk628;
    u16 unk62A;
    u8 unk62C;
    u8 unk62D;
    u8 unk62E;
    u8 unk62F;
    s16 unk630;
    s16 unk632;
    u16 unk634;
    u16 unk636;
    u16 unk638;
    u16 unk63A[4];
    u8 filler642[8];
    u8 unk64A;
    u8 unk64B;
    u8 unk64C_1:1;
    u8 unk64D;
    u8 unk64E;
    u8 unk64F;
    u8 unk650;      //menuIsOpen
    u8 unk651;
    u16 unk652;     //Menu cursor position
    s16 unk654;     //Menu Y position (inverted because we use REG_BG0VOFS for this)
    u8 unk656[8];
    u8 unk65E[8];
};

extern struct MusicPlayerInfo gMPlay_BGM;
extern u8 gReservedSpritePaletteCount;
extern struct PokedexView *gUnknown_0202FFB4;
extern u16 gUnknown_0202FFB8;
extern u8 gUnknown_0202FFBA;
extern u8 gUnknown_03005CE8;
extern u8 gPokedexMenu_Gfx[];
extern u8 gUnknown_08E96738[];
extern u8 gUnknown_08E9C6DC[];
extern u8 gUnknown_08E96888[];
extern u8 gUnknown_08E96994[];
extern u8 gUnknown_083A05CC[];
extern struct SpritePalette gUnknown_083A05DC[];
extern u8 gUnknown_0839FA7C[];
extern u8 gUnknown_0839F67C[];
extern u8 gPokedexMenu_Pal[];
extern u8 gUnknown_0839F73C[];

extern void m4aMPlayVolumeControl(struct MusicPlayerInfo *mplayInfo, u16 trackBits, u16 volume);
extern bool8 BeginNormalPaletteFade(u32, s8, u8, u8, u16);
extern void remove_some_task(void);
extern bool32 sub_806912C(void);
extern u16 pokedex_count(u8);
extern u8 sub_8091E3C(void);
extern void sub_80690C8(void);
extern void sub_805469C(void);
extern void LoadCompressedObjectPic(void *);
extern void LZ77UnCompVram(const void *, void *);
extern u16 HoennToNationalOrder(u16);
extern u16 NationalToHoennOrder(u16);
extern u16 gPokedexOrder_Alphabetical[];
extern u16 gPokedexOrder_Weight[];
extern u16 gPokedexOrder_Height[];
extern u8 gSpeciesNames[][11];

void ClearPokedexView(struct PokedexView *);
void Task_PokedexShowMainScreen(u8 taskId);
void sub_808C0B8(void);
void MainCB(void);
bool8 sub_808D344(u8);
void Task_PokedexMainScreen(u8 taskId);
void sub_808E6BC(void);
void sub_808EDB8(struct Sprite *);
void sub_808CA64(u8 taskId);
void Task_PokedexMainScreenMenu(u8 taskId);
void sub_808CB8C(u8 taskId);
u16 sub_808E48C(u16, u16);
void sub_808C898(u8 taskId);
void Task_ClosePokedex(u8 taskId);
void sub_8091060(u16);
void sub_808CAE4(u8 taskId);
void sub_808D198(u8 taskId);
bool8 sub_808E208(u8, u8, u8);
bool32 sub_808E82C(void); //Not sure about return type
void sub_808E0CC(u16, u16);
u8 sub_808F210(struct PokedexListItem *, u8);
void sub_808F284(struct PokedexListItem *, u8);
bool8 sub_808F250(u8);
bool8 sub_808E71C(void);
void sub_808CCC4(u8 taskId);
u16 sub_8090F68(u8);
void sub_808D690(u8, u8);
void Task_PokedexResultsScreen(u8 taskId);
void sub_808D118(u8 taskId);
void Task_PokedexResultsScreenMenu(u8 taskId);
void Task_PokedexResultsScreenReturnToMainScreen(u8 taskId);
void sub_808CEF8(u8 taskId);
void Task_PokedexResultsScreenExitPokedex(u8 taskId);
void sub_808D640(void);
void sub_808E978(u8);
bool8 sub_8090D90(u16, u8);
void sub_808E090(u8, u8, u16);
void sub_808DEB0(u16, u8, u8, u16);
void sub_808DF88(u16, u8, u8, u16);
u8 sub_808DFE4(u16, u8, u8);
u16 sub_808E888(u16);
u32 sub_808E8C8(u16, u16, u16);
void sub_808EE28(struct Sprite *sprite);
u16 sub_8091818(u8, u16, u16, u16);

void sub_808C02C(void)
{
    u16 i;
    
    gUnknown_0202FFB8 = 0;
    gUnknown_0202FFBA = 0x40;
    gUnknown_03005CE8 = 0;
    gSaveBlock2.pokedex.unknown1 = 0;
    gSaveBlock2.pokedex.order = 0;
    gSaveBlock2.pokedex.nationalMagic = 0;
    gSaveBlock2.pokedex.unknown2 = 0;
    gSaveBlock2.pokedex.unownPersonality = 0;
    gSaveBlock2.pokedex.spindaPersonality = 0;
    gSaveBlock2.pokedex.unknown3 = 0;
    sub_80690C8();
    for(i = 0; i <= 51; i++)
    {
        gSaveBlock2.pokedex.owned[i] = 0;
        gSaveBlock2.pokedex.seen[i] = 0;
        gSaveBlock1.unk938[i] = 0;
        gSaveBlock1.unk3A8C[i] = 0;
    }
}

void sub_808C0A0(void)
{
    gUnknown_0202FFB8 = 0;
    gUnknown_0202FFBA = 0x40;
}

void sub_808C0B8(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void ClearPokedexView(struct PokedexView *pokedexView)
{
    u16 i;
    struct UnknownStruct3 *p;
    
    for(i = 0; i <= 385; i++)
    {
        pokedexView->unk0[i].a |= 0x0000FFFF;
        pokedexView->unk0[i].seen = 0;
        pokedexView->unk0[i].owned = 0;
    }
    pokedexView->unk608 = 0;
    pokedexView->unk60A_1 = 0;
    pokedexView->unk60A_2 = 0;
    pokedexView->unk60C = 0;
    pokedexView->unk60E = 0;
    pokedexView->unk610 = 0;
    pokedexView->unk612 = 0;
    pokedexView->unk614 = 0;
    pokedexView->unk616 = 0;
    pokedexView->unk618 = 0;
    pokedexView->unk61A = 0;
    pokedexView->unk61C = 0;
    for(i = 0; i <= 3; i++)
        pokedexView->unk61E[i] |= 0xFFFF;
    pokedexView->unk628 = 0;
    pokedexView->unk62A = 0;
    pokedexView->unk62C = 0;
    pokedexView->unk62D = 0;
    pokedexView->unk62E = 0;
    pokedexView->unk62F = 0;
    pokedexView->unk630 = 0;
    pokedexView->unk632 = 0;
    pokedexView->unk634 = 0;
    pokedexView->unk636 = 0;
    pokedexView->unk638 = 0;
    for(i = 0; i <= 3; i++)
        pokedexView->unk63A[i] = 0;
    pokedexView->unk64A = 0;
    pokedexView->unk64B = 0;
    pokedexView->unk64C_1 = 0;
    pokedexView->unk64D = 0;
    pokedexView->unk64F = 0;
    pokedexView->unk650 = 0;
    pokedexView->unk652 = 0;
    pokedexView->unk654 = 0;
    for(i = 0; i <= 7; i++)
        pokedexView->unk656[i] = 0;
    for(i = 0; i <= 7; i++)
        pokedexView->unk65E[i] = 0;
}

void CB2_InitPokedex(void)
{
    switch(gMain.state)
    {
        case 0:
        default:
        {
            u8 *addr;
            u32 size;
            
            SetVBlankCallback(NULL);
            sub_8091060(0);
            addr = (u8 *)VRAM;
            size = VRAM_SIZE;
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
            gMain.state = 1;
            break;
        }
        case 1:
            remove_some_task();
            ResetTasks();
            ResetSpriteData();
            ResetPaletteFade();
            FreeAllSpritePalettes();
            gReservedSpritePaletteCount = 8;
            SetUpWindowConfig(&gWindowConfig_81E7048);
            InitMenuWindow(&gWindowConfig_81E7048);
            gMain.state++;
            break;
        case 2:
            switch(Random() & 3)
            {
                case 0:
                default:
                    gUnknown_0202FFB4 = (struct PokedexView *)0x02018000;
                    break;
                case 1:
                    gUnknown_0202FFB4 = (struct PokedexView *)0x02018800;
                    break;
                case 2:
                    gUnknown_0202FFB4 = (struct PokedexView *)0x02019000;
                    break;
                case 3:
                    gUnknown_0202FFB4 = (struct PokedexView *)0x02019800;
                    break;
            }
            ClearPokedexView(gUnknown_0202FFB4);
            CreateTask(Task_PokedexShowMainScreen, 0);
            gUnknown_0202FFB4->unk612 = gSaveBlock2.pokedex.unknown1;
            if(!sub_806912C())
                gUnknown_0202FFB4->unk612 = 0;
            gUnknown_0202FFB4->unk616 = gSaveBlock2.pokedex.order;
            gUnknown_0202FFB4->unk60E = gUnknown_0202FFB8;
            gUnknown_0202FFB4->unk62C = gUnknown_0202FFBA;
            gUnknown_0202FFB4->unk64D = 0;
            gUnknown_0202FFB4->unk64E = 0;
            if(!sub_806912C())
            {
                gUnknown_0202FFB4->unk61A = sub_8090F68(0);
                gUnknown_0202FFB4->unk61C = sub_8090F68(1);
            }
            else
            {
                gUnknown_0202FFB4->unk61A = pokedex_count(0);
                gUnknown_0202FFB4->unk61C = pokedex_count(1);
            }
            gUnknown_0202FFB4->unk62D = 8;
            gMain.state++;
            break;
        case 3:
        {
            u16 savedIme;
            
            savedIme = REG_IME;
            REG_IME = 0;
            REG_IE |= 1;
            REG_IME = savedIme;
            REG_DISPSTAT |= 8;
            SetVBlankCallback(sub_808C0B8);
            SetMainCallback2(MainCB);
            sub_808D690(gUnknown_0202FFB4->unk612, gUnknown_0202FFB4->unk616);
            m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 0x80);
        }
    }
}

u8 unref_sub_808C540(void (*func)(u8))
{
    u16 savedIme;
    u8 taskId;
    
    SetVBlankCallback(NULL);
    sub_8091060(0x200);
    remove_some_task();
    ResetTasks();
    ResetPaletteFade();
    savedIme = REG_IME;
    REG_IME = 0;
    REG_IE |= 1;
    REG_IME = savedIme;
    REG_DISPSTAT |= 0x8;
    SetVBlankCallback(sub_808C0B8);
    SetMainCallback2(MainCB);
    if(!gUnknown_0202FFB4->unk64B)
        taskId = CreateTask(sub_808CAE4, 0);
    else
        taskId = CreateTask(sub_808D198, 0);
    gTasks[taskId].data[0] = CreateTask(func, 0);
    return gTasks[taskId].data[0];
}

void MainCB(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void Task_PokedexShowMainScreen(u8 taskId)
{
    gUnknown_0202FFB4->unk64C_1 = 0;
    if(sub_808D344(0))
    {
        gTasks[taskId].func = Task_PokedexMainScreen;
    }
}

//Hide menu and process input on main screen
void Task_PokedexMainScreen(u8 taskId)
{
    REG_BG0VOFS = gUnknown_0202FFB4->unk654;
    
    //If menu is open, slide it down, off screen
    if(gUnknown_0202FFB4->unk654)
        gUnknown_0202FFB4->unk654 -= 8;
    else
    {
        if((gMain.newKeys & A_BUTTON) && gUnknown_0202FFB4->unk0[gUnknown_0202FFB4->unk60E].seen)
        {
            sub_808E6BC();
            BeginNormalPaletteFade(
              ~(1 << (gSprites[gUnknown_0202FFB4->unk626].oam.paletteNum + 16)),
              0, 0, 0x10, 0);
            gSprites[gUnknown_0202FFB4->unk626].callback = sub_808EDB8;
            gTasks[taskId].func = sub_808CA64;
            PlaySE(SE_PIN);
        }
        else if(gMain.newKeys & START_BUTTON)
        {
            //Open menu
            gUnknown_0202FFB4->unk654 = 0;
            gUnknown_0202FFB4->unk650 = 1;
            gUnknown_0202FFB4->unk652 = 0;
            gTasks[taskId].func = Task_PokedexMainScreenMenu;
            PlaySE(SE_SELECT);
        }
        else if(gMain.newKeys & SELECT_BUTTON)
        {
            PlaySE(SE_SELECT);
            BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
            gTasks[taskId].data[0] = sub_8091E3C();
            gUnknown_0202FFB4->unk64F = 0;
            gUnknown_0202FFB4->unk62A = gUnknown_0202FFB4->unk62C;
            gUnknown_0202FFB4->unk610 = gUnknown_0202FFB4->unk60E;
            gUnknown_0202FFB4->unk614 = gUnknown_0202FFB4->unk612;
            gUnknown_0202FFB4->unk618 = gUnknown_0202FFB4->unk616;
            gTasks[taskId].func = sub_808CB8C;
            PlaySE(SE_PC_LOGON);
        }
        else if(gMain.newKeys & B_BUTTON)
        {
            BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
            gTasks[taskId].func = Task_ClosePokedex;
            PlaySE(SE_PC_OFF);
        }
        else
        {
            //Handle D-pad
            gUnknown_0202FFB4->unk60E = sub_808E48C(gUnknown_0202FFB4->unk60E, 0xE);
            if(gUnknown_0202FFB4->unk62E)
                gTasks[taskId].func = sub_808C898;
        }
    }
}

void sub_808C898(u8 taskId)
{
    if(sub_808E208(gUnknown_0202FFB4->unk62F, gUnknown_0202FFB4->unk634, gUnknown_0202FFB4->unk636))
    {
        gTasks[taskId].func = Task_PokedexMainScreen;
    }
}

//Bring up menu and process menu input
void Task_PokedexMainScreenMenu(u8 taskId)
{
    REG_BG0VOFS = gUnknown_0202FFB4->unk654;
    
    //If menu is not open, slide it up, on screen
    if(gUnknown_0202FFB4->unk654 != 80)
        gUnknown_0202FFB4->unk654 += 8;
    else
    {
        if(gMain.newKeys & A_BUTTON)
        {
            switch(gUnknown_0202FFB4->unk652)
            {
                case 0: //BACK TO LIST
                default:
                    gMain.newKeys |= START_BUTTON;  //Exit menu
                    break;
                case 1: //LIST TOP
                    gUnknown_0202FFB4->unk60E = 0;
                    gUnknown_0202FFB4->unk62C = 0x40;
                    sub_808E82C();
                    sub_808E0CC(gUnknown_0202FFB4->unk60E, 0xE);
                    gMain.newKeys |= START_BUTTON;  //Exit menu
                    break;
                case 2: //LIST BOTTOM
                    gUnknown_0202FFB4->unk60E = gUnknown_0202FFB4->unk60C - 1;
                    gUnknown_0202FFB4->unk62C = gUnknown_0202FFB4->unk60C * 16 + 0x30;
                    sub_808E82C();
                    sub_808E0CC(gUnknown_0202FFB4->unk60E, 0xE);
                    gMain.newKeys |= START_BUTTON;  //Exit menu
                    break;
                case 3: //CLOSE POKEDEX
                    BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
                    gTasks[taskId].func = Task_ClosePokedex;
                    PlaySE(SE_PC_OFF);
                    break;
            }
        }
        
        //Exit menu when Start or B is pressed
        if(gMain.newKeys & (START_BUTTON | B_BUTTON))
        {
            gUnknown_0202FFB4->unk650 = 0;
            gTasks[taskId].func = Task_PokedexMainScreen;
            PlaySE(SE_SELECT);
        }
        else if((gMain.newAndRepeatedKeys & DPAD_UP) && gUnknown_0202FFB4->unk652 != 0)
        {
            gUnknown_0202FFB4->unk652--;
            PlaySE(SE_SELECT);
        }
        else if((gMain.newAndRepeatedKeys & DPAD_DOWN) && gUnknown_0202FFB4->unk652 <= 2)
        {
            gUnknown_0202FFB4->unk652++;
            PlaySE(SE_SELECT);
        }
    }
}

void sub_808CA64(u8 taskId)
{
    if(gSprites[gUnknown_0202FFB4->unk626].pos1.x == 0x30 &&
    gSprites[gUnknown_0202FFB4->unk626].pos1.y == 0x38)
    {
        gUnknown_0202FFB4->unk64B = gUnknown_0202FFB4->unk64A;
        gTasks[taskId].data[0] = sub_808F210(&gUnknown_0202FFB4->unk0[gUnknown_0202FFB4->unk60E], gUnknown_0202FFB4->unk626);
        gTasks[taskId].func = sub_808CAE4;
    }
}

void sub_808CAE4(u8 taskId)
{
    if(gTasks[gTasks[taskId].data[0]].isActive)
    {
        if(gUnknown_0202FFB4->unk64A == 1 &&
        !sub_808F250(gTasks[taskId].data[0]) &&
        sub_808E71C())
        {
            sub_808F284(&gUnknown_0202FFB4->unk0[gUnknown_0202FFB4->unk60E], gTasks[taskId].data[0]);
        }
    }
    else
    {
        gUnknown_0202FFB8 = gUnknown_0202FFB4->unk60E;
        gUnknown_0202FFBA = gUnknown_0202FFB4->unk62C;
        gTasks[taskId].func = Task_PokedexShowMainScreen;
    }
}

void sub_808CB8C(u8 taskId)
{
    bool8 isActive = gTasks[gTasks[taskId].data[0]].isActive;
    
    if(!isActive)
    {
        if(gUnknown_0202FFB4->unk64F)
        {
            gUnknown_0202FFB4->unk60E = isActive;
            gUnknown_0202FFB4->unk62C = 0x40;
            gTasks[taskId].func = sub_808CCC4;
        }
        else
        {
            gUnknown_0202FFB4->unk62C = gUnknown_0202FFB4->unk62A;
            gUnknown_0202FFB4->unk60E = gUnknown_0202FFB4->unk610;
            gUnknown_0202FFB4->unk612 = gUnknown_0202FFB4->unk614;
            if(!sub_806912C())
                gUnknown_0202FFB4->unk612 = 0;
            gUnknown_0202FFB4->unk616 = gUnknown_0202FFB4->unk618;
            gTasks[taskId].func = Task_PokedexShowMainScreen;
        }
    }
}

void Task_ClosePokedex(u8 taskId)
{
    if(!gPaletteFade.active)
    {
        gSaveBlock2.pokedex.unknown1 = gUnknown_0202FFB4->unk612;
        if(!sub_806912C())
            gSaveBlock2.pokedex.unknown1 = 0;
        gSaveBlock2.pokedex.order = gUnknown_0202FFB4->unk616;
        DestroyTask(taskId);
        SetMainCallback2(sub_805469C);
        m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 0x100);
    }
}

void sub_808CCC4(u8 taskId)
{
    gUnknown_0202FFB4->unk64C_1 = 1;
    if(sub_808D344(3))
        gTasks[taskId].func = Task_PokedexResultsScreen;
}

void Task_PokedexResultsScreen(u8 taskId)
{
    REG_BG0VOFS = gUnknown_0202FFB4->unk654;
    
    if(gUnknown_0202FFB4->unk654)
        gUnknown_0202FFB4->unk654 -= 8;
    else
    {
        if((gMain.newKeys & A_BUTTON) && gUnknown_0202FFB4->unk0[gUnknown_0202FFB4->unk60E].seen)
        {
            u32 a;
            
            sub_808E6BC();
            a = (1 << (gSprites[gUnknown_0202FFB4->unk626].oam.paletteNum + 16));
            gSprites[gUnknown_0202FFB4->unk626].callback = sub_808EDB8;
            BeginNormalPaletteFade(~a, 0, 0, 0x10, 0);
            gTasks[taskId].func = sub_808D118;
            PlaySE(SE_PIN);
        }
        else if(gMain.newKeys & START_BUTTON)
        {
            gUnknown_0202FFB4->unk654 = 0;
            gUnknown_0202FFB4->unk650 = 1;
            gUnknown_0202FFB4->unk652 = 0;
            gTasks[taskId].func = Task_PokedexResultsScreenMenu;
            PlaySE(SE_SELECT);
        }
        else if(gMain.newKeys & SELECT_BUTTON)
        {
            BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
            gTasks[taskId].data[0] = sub_8091E3C();
            gUnknown_0202FFB4->unk64F = 0;
            gTasks[taskId].func = sub_808CB8C;
            PlaySE(SE_PC_LOGON);
        }
        else if(gMain.newKeys & B_BUTTON)
        {
            BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
            gTasks[taskId].func = Task_PokedexResultsScreenReturnToMainScreen;
            PlaySE(SE_PC_OFF);
        }
        else
        {
            //Handle D-pad            
            gUnknown_0202FFB4->unk60E = sub_808E48C(gUnknown_0202FFB4->unk60E, 0xE);
            if(gUnknown_0202FFB4->unk62E)
                gTasks[taskId].func = sub_808CEF8;
        }
    }
}

void sub_808CEF8(u8 taskId)
{
    if(sub_808E208(gUnknown_0202FFB4->unk62F, gUnknown_0202FFB4->unk634, gUnknown_0202FFB4->unk636))
        gTasks[taskId].func = Task_PokedexResultsScreen;
}

void Task_PokedexResultsScreenMenu(u8 taskId)
{
    REG_BG0VOFS = gUnknown_0202FFB4->unk654;
    
    if(gUnknown_0202FFB4->unk654 != 0x60)
        gUnknown_0202FFB4->unk654 += 8;
    else
    {
        if(gMain.newKeys & A_BUTTON)
        {
            switch(gUnknown_0202FFB4->unk652)
            {
                case 0: //BACK TO LIST
                default:
                    gMain.newKeys |= START_BUTTON;
                    break;
                case 1: //LIST TOP
                    gUnknown_0202FFB4->unk60E = 0;
                    gUnknown_0202FFB4->unk62C = 0x40;
                    sub_808E82C();
                    sub_808E0CC(gUnknown_0202FFB4->unk60E, 0xE);
                    gMain.newKeys |= START_BUTTON;
                    break;
                case 2: //LIST BOTTOM
                    gUnknown_0202FFB4->unk60E = gUnknown_0202FFB4->unk60C - 1;
                    gUnknown_0202FFB4->unk62C = gUnknown_0202FFB4->unk60C * 16 + 0x30;
                    sub_808E82C();
                    sub_808E0CC(gUnknown_0202FFB4->unk60E, 0xE);
                    gMain.newKeys |= START_BUTTON;
                    break;
                case 3: //BACK TO POKEDEX
                    BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
                    gTasks[taskId].func = Task_PokedexResultsScreenReturnToMainScreen;
                    PlaySE(SE_TRACK_DOOR);
                    break;
                case 4: //CLOSE POKEDEX
                    BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
                    gTasks[taskId].func = Task_PokedexResultsScreenExitPokedex;
                    PlaySE(SE_PC_OFF);
                    break;
            }
        }
        
        //Exit menu when Start or B is pressed
        if(gMain.newKeys & (START_BUTTON | B_BUTTON))
        {
            gUnknown_0202FFB4->unk650 = 0;
            gTasks[taskId].func = Task_PokedexResultsScreen;
            PlaySE(SE_SELECT);
        }
        else if((gMain.newAndRepeatedKeys & DPAD_UP) && gUnknown_0202FFB4->unk652)
        {
            gUnknown_0202FFB4->unk652--;
            PlaySE(SE_SELECT);
        }
        else if((gMain.newAndRepeatedKeys & DPAD_DOWN) && gUnknown_0202FFB4->unk652 <= 3)
        {
            gUnknown_0202FFB4->unk652++;
            PlaySE(SE_SELECT);
        }
    }
}

void sub_808D118(u8 taskId)
{
    if(gSprites[gUnknown_0202FFB4->unk626].pos1.x == 0x30 &&
    gSprites[gUnknown_0202FFB4->unk626].pos1.y == 0x38)
    {
        gUnknown_0202FFB4->unk64B = gUnknown_0202FFB4->unk64A;
        gTasks[taskId].data[0] = sub_808F210(&gUnknown_0202FFB4->unk0[gUnknown_0202FFB4->unk60E], gUnknown_0202FFB4->unk626);
        gTasks[taskId].func = sub_808D198;
    }
}

void sub_808D198(u8 taskId)
{
    if(gTasks[gTasks[taskId].data[0]].isActive)
    {
        if(gUnknown_0202FFB4->unk64A == 1 &&
        !sub_808F250(gTasks[taskId].data[0]) &&
        sub_808E71C())
        {
            sub_808F284(&gUnknown_0202FFB4->unk0[gUnknown_0202FFB4->unk60E], gTasks[taskId].data[0]);
        }
    }
    else
    {
        gTasks[taskId].func = sub_808CCC4;
    }
}

void Task_PokedexResultsScreenReturnToMainScreen(u8 taskId)
{
    if(!gPaletteFade.active)
    {
        gUnknown_0202FFB4->unk62C = gUnknown_0202FFB4->unk62A;
        gUnknown_0202FFB4->unk60E = gUnknown_0202FFB4->unk610;
        gUnknown_0202FFB4->unk612 = gUnknown_0202FFB4->unk614;
        if(!sub_806912C())
            gUnknown_0202FFB4->unk612 = 0;
        gUnknown_0202FFB4->unk616 = gUnknown_0202FFB4->unk618;
        gTasks[taskId].func = Task_PokedexShowMainScreen;
    }
}

void Task_PokedexResultsScreenExitPokedex(u8 taskId)
{
    if(!gPaletteFade.active)
    {
        gUnknown_0202FFB4->unk62C = gUnknown_0202FFB4->unk62A;
        gUnknown_0202FFB4->unk60E = gUnknown_0202FFB4->unk610;
        gUnknown_0202FFB4->unk612 = gUnknown_0202FFB4->unk614;
        if(!sub_806912C())
            gUnknown_0202FFB4->unk612 = 0;
        gUnknown_0202FFB4->unk616 = gUnknown_0202FFB4->unk618;
        gTasks[taskId].func = Task_ClosePokedex;
    }
}


bool8 sub_808D344(u8 a)
{
    switch(gMain.state)
    {
        case 0:
        default:
            if(gPaletteFade.active)
                return 0;
            //_0808D39E
            SetVBlankCallback(NULL);
            gUnknown_0202FFB4->unk64A = a;
            sub_8091060(0);
            REG_BG2VOFS = gUnknown_0202FFB4->unk62D;
            LZ77UnCompVram(gPokedexMenu_Gfx, (void *)(VRAM));
            LZ77UnCompVram(gUnknown_08E96738, (void *)(VRAM + 0x6800));
            LZ77UnCompVram(gUnknown_08E9C6DC, (void *)(VRAM + 0x7800));
            DmaClear16(3, VRAM + 0x6000, 0x500);
            if(a == 0)
                LZ77UnCompVram(gUnknown_08E96888, (void *)(VRAM + 0x6500));
            else
                LZ77UnCompVram(gUnknown_08E96994, (void *)(VRAM + 0x6500));
            ResetPaletteFade();
            if(a == 0)
                gUnknown_0202FFB4->unk64C_1 = 0;
            else
                gUnknown_0202FFB4->unk64C_1 = 1;
            sub_808D640();
            gMain.state = 1;
            break;
        case 1:
            ResetSpriteData();
            FreeAllSpritePalettes();
            gReservedSpritePaletteCount = 8;
            LoadCompressedObjectPic(gUnknown_083A05CC);
            LoadSpritePalettes(gUnknown_083A05DC);
            sub_808E978(a);
            gMain.state++;
            break;
        case 2:
            SetUpWindowConfig(&gWindowConfig_81E7048);
            InitMenuWindow(&gWindowConfig_81E7048);
            LZ77UnCompVram(gUnknown_0839FA7C, (void *)(VRAM + 0xFF80));
            gMain.state++;
            break;
        case 3:
            if(a == 0)
                sub_808D690(gUnknown_0202FFB4->unk612, gUnknown_0202FFB4->unk616);
            sub_808E0CC(gUnknown_0202FFB4->unk60E, 0xE);
            gUnknown_0202FFB4->unk650 = 0;
            gUnknown_0202FFB4->unk654 = 0;
            gMain.state++;
            break;
        case 4:
            BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
            SetVBlankCallback(sub_808C0B8);
            gMain.state++;
            break;
        case 5:
            REG_WININ = 0x3F3F;
            REG_WINOUT = 0x1D3F;
            REG_WIN0H = 0;
            REG_WIN0V = 0;
            REG_WIN1H = 0;
            REG_WIN1V = 0;
            REG_BLDCNT = 0;
            REG_BLDALPHA = 0;
            REG_BLDY = 0;
            REG_BG3CNT = 0xF03;
            REG_BG1CNT = 0xD01;
            REG_BG0CNT = 0xC00;
            REG_DISPCNT = 0x9F40;
            gMain.state++;
            break;
        case 6:
            if(!gPaletteFade.active)
            {
                gMain.state = 0;
                return 1;
            }
            else
                return 0;
    }
    return 0;
}

void sub_808D640(void)
{
    if(gUnknown_0202FFB4->unk64C_1)
        LoadPalette(gUnknown_0839F67C + 0x2, 1, 0xBE);
    else if(!sub_806912C())
        LoadPalette(gPokedexMenu_Pal + 0x2, 1, 0xBE);
    else
        LoadPalette(gUnknown_0839F73C + 0x2, 1, 0xBE);
}

//Pokedex sorting function
void sub_808D690(u8 a, u8 mode)
{
    u16 vars[3]; //I have no idea why three regular variables are stored in an array, but whatever.
    s16 i;
    
    gUnknown_0202FFB4->unk60C = 0;
    
    switch(a)
    {
        default:
        case 0:
            vars[0] = 202;
            vars[1] = 1;
            break;
        case 1:
            if(sub_806912C())
            {
                vars[0] = 386;
                vars[1] = 0;
            }
            else
            {
                vars[0] = 202;
                vars[1] = a;
            }
            break;
    }
    
    switch(mode)
    {
        case 0:
        {
            if(vars[1])
            {
                for(i = 0; i < vars[0]; i++)
                {
                    vars[2] = HoennToNationalOrder(i + 1);
                    gUnknown_0202FFB4->unk0[i].a = vars[2];
                    gUnknown_0202FFB4->unk0[i].seen = sub_8090D90(vars[2], 0);
                    gUnknown_0202FFB4->unk0[i].owned = sub_8090D90(vars[2], 1);
                    if(gUnknown_0202FFB4->unk0[i].seen)
                        gUnknown_0202FFB4->unk60C = i + 1;
                }
            }
            else
            {
                bool32 r10;
                s16 r5;

                r10 = r5 = i = 0;
                for(i = 0; i < vars[0]; i++)
                {
                    vars[2] = i + 1;
                    if(sub_8090D90(vars[2], 0))
                        r10 = 1;
                    if(r10)
                    {
                        asm("");    //Needed to match for some reason
                        gUnknown_0202FFB4->unk0[r5].a = vars[2];
                        gUnknown_0202FFB4->unk0[r5].seen = sub_8090D90(vars[2], 0);
                        gUnknown_0202FFB4->unk0[r5].owned = sub_8090D90(vars[2], 1);
                        if(gUnknown_0202FFB4->unk0[r5].seen)
                            gUnknown_0202FFB4->unk60C = r5 + 1;
                        r5++;
                    }
                }
            }
            break;
        }
        case 1:
            for(i = 0; i < 411; i++)
            {
                vars[2] = gPokedexOrder_Alphabetical[i];
                
                if(NationalToHoennOrder(vars[2]) <= vars[0] && sub_8090D90(vars[2], 0))
                {
                    gUnknown_0202FFB4->unk0[gUnknown_0202FFB4->unk60C].a = vars[2];
                    gUnknown_0202FFB4->unk0[gUnknown_0202FFB4->unk60C].seen = 1;
                    gUnknown_0202FFB4->unk0[gUnknown_0202FFB4->unk60C].owned = sub_8090D90(vars[2], 1);
                    gUnknown_0202FFB4->unk60C++;
                }
            }
            break;
        case 2:
            for(i = 385; i >= 0; i--)
            {
                vars[2] = gPokedexOrder_Weight[i];
                
                if(NationalToHoennOrder(vars[2]) <= vars[0] && sub_8090D90(vars[2], 1))
                {
                    gUnknown_0202FFB4->unk0[gUnknown_0202FFB4->unk60C].a = vars[2];
                    gUnknown_0202FFB4->unk0[gUnknown_0202FFB4->unk60C].seen = 1;
                    gUnknown_0202FFB4->unk0[gUnknown_0202FFB4->unk60C].owned = 1;
                    gUnknown_0202FFB4->unk60C++;
                }
            }
            break;
        case 3:
            for(i = 0; i < 386; i++)
            {
                vars[2] = gPokedexOrder_Weight[i];
                
                if(NationalToHoennOrder(vars[2]) <= vars[0] && sub_8090D90(vars[2], 1))
                {
                    gUnknown_0202FFB4->unk0[gUnknown_0202FFB4->unk60C].a = vars[2];
                    gUnknown_0202FFB4->unk0[gUnknown_0202FFB4->unk60C].seen = 1;
                    gUnknown_0202FFB4->unk0[gUnknown_0202FFB4->unk60C].owned = 1;
                    gUnknown_0202FFB4->unk60C++;
                }
            }
            break;
        case 4:
            for(i = 385; i >=0; i--)
            {
                vars[2] = gPokedexOrder_Height[i];
                
                if(NationalToHoennOrder(vars[2]) <= vars[0] && sub_8090D90(vars[2], 1))
                {
                    gUnknown_0202FFB4->unk0[gUnknown_0202FFB4->unk60C].a = vars[2];
                    gUnknown_0202FFB4->unk0[gUnknown_0202FFB4->unk60C].seen = 1;
                    gUnknown_0202FFB4->unk0[gUnknown_0202FFB4->unk60C].owned = 1;
                    gUnknown_0202FFB4->unk60C++;
                }
            }
            break;
        case 5:
            for(i = 0; i < 386; i++)
            {
                vars[2] = gPokedexOrder_Height[i];
                
                if(NationalToHoennOrder(vars[2]) <= vars[0] && sub_8090D90(vars[2], 1))
                {
                    gUnknown_0202FFB4->unk0[gUnknown_0202FFB4->unk60C].a = vars[2];
                    gUnknown_0202FFB4->unk0[gUnknown_0202FFB4->unk60C].seen = 1;
                    gUnknown_0202FFB4->unk0[gUnknown_0202FFB4->unk60C].owned = 1;
                    gUnknown_0202FFB4->unk60C++;
                }
            }
            break;        
    }
    for(i = gUnknown_0202FFB4->unk60C; i < 386; i++)
    {
        gUnknown_0202FFB4->unk0[i].a |= 0xFFFF;
        gUnknown_0202FFB4->unk0[i].seen = 0;
        gUnknown_0202FFB4->unk0[i].owned = 0;
    }
}

void sub_808DBE8(u8 a, u16 b, u16 c)
{
    switch(a)
    {
        case 0:
        default:
        {
            u16 i;
            s16 _b = b - 5;
            
            for(i = 0; i <= 10; i++)
            {
                if((u16)_b > 385 || gUnknown_0202FFB4->unk0[_b].a == 0xFFFF)
                    sub_808E090(0x11, i * 2, c);
                else
                {
                    sub_808E090(0x11, i * 2, c);
                    if(gUnknown_0202FFB4->unk0[_b].seen)
                    {
                        sub_808DEB0(_b, 0x12, i * 2, c);
                        sub_808DF88(gUnknown_0202FFB4->unk0[_b].owned, 0x11, i * 2, c);
                        sub_808DFE4(gUnknown_0202FFB4->unk0[_b].a, 0x17, i * 2);
                    }
                    else
                    {
                        sub_808DEB0(_b, 0x12, i * 2, c);
                        sub_808DF88(0, 0x11, i * 2, c);
                        sub_808DFE4(0, 0x17, i * 2);
                    }
                }
                _b++;
            }
            break;
        }
        case 1:
        {
            s16 _b = b - 5;
            
            if((u16)_b > 385 || gUnknown_0202FFB4->unk0[_b].a == 0xFFFF)
                sub_808E090(0x11, gUnknown_0202FFB4->unk630 * 2, c);
            else
            {
                sub_808E090(0x11, gUnknown_0202FFB4->unk630 * 2, c);
                if(gUnknown_0202FFB4->unk0[_b].seen)
                {
                    sub_808DEB0(_b, 0x12, gUnknown_0202FFB4->unk630 * 2, c);
                    sub_808DF88(gUnknown_0202FFB4->unk0[_b].owned, 0x11, gUnknown_0202FFB4->unk630 * 2, c);
                    sub_808DFE4(gUnknown_0202FFB4->unk0[_b].a, 0x17, gUnknown_0202FFB4->unk630 * 2);
                }
                else
                {
                    sub_808DEB0(_b, 0x12, gUnknown_0202FFB4->unk630 * 2, c);
                    sub_808DF88(0, 0x11, gUnknown_0202FFB4->unk630 * 2, c);
                    sub_808DFE4(0, 0x17, gUnknown_0202FFB4->unk630 * 2);
                }
            }
            break;
        }
        case 2:
        {
            s16 _b = b + 5;
            u16 r2 = gUnknown_0202FFB4->unk630 + 10;
            
            if(r2 > 15)
                r2 -= 16;
            if((u16)_b > 385 || gUnknown_0202FFB4->unk0[_b].a == 0xFFFF)
                sub_808E090(0x11, r2 * 2, c);
            else
            {
                sub_808E090(0x11, r2 * 2, c);
                if(gUnknown_0202FFB4->unk0[_b].seen)
                {
                    sub_808DEB0(_b, 0x12, r2 * 2, c);
                    sub_808DF88(gUnknown_0202FFB4->unk0[_b].owned, 0x11, r2 * 2, c);
                    sub_808DFE4(gUnknown_0202FFB4->unk0[_b].a, 0x17, r2 * 2);
                }
                else
                {
                    sub_808DEB0(_b, 0x12, r2 * 2, c);
                    sub_808DF88(0, 0x11, r2 * 2, c);
                    sub_808DFE4(0, 0x17, r2 * 2);
                }
            }
            break;
        }
    }
}

void sub_808DEB0(u16 a, u8 b, u8 c, u16 d)
{
    u8 text[4];
    u16 unk[2];
    u16 r7 = gUnknown_0202FFB4->unk0[a].a;
    
    if(gUnknown_0202FFB4->unk612 == 0)
        r7 = NationalToHoennOrder(r7);
    unk[0] = 0x3FC;
    unk[1] = 0x3FD;
    text[0] = r7 / 100 + 0xA1;
    text[1] = (r7 % 100) / 10 + 0xA1;
    text[2] = (r7 % 100) % 10 + 0xA1;
    text[3] = 0xFF;
    *(u16 *)(VRAM + d * 0x800 + c * 0x40 + b * 2) = unk[0];
    *(u16 *)(VRAM + 0x40 + d * 0x800 + c * 0x40 + b * 2) = unk[1];
    MenuPrint(text, b - 15, c);
}

void sub_808DF88(u16 a, u8 b, u8 c, u16 d)
{
    u16 unk[2];
    
    if(a)
    {
        unk[0] = 0x3FE;
        unk[1] = 0x3FF;
    }
    else
    {
        unk[0] = 0;
        unk[1] = 0;
    }
    *(u16 *)(VRAM + d * 0x800 + c * 0x40 + b * 2) = unk[0];
    *(u16 *)(VRAM + 0x40 + d * 0x800 + c * 0x40 + b * 2) = unk[1];
}

#ifdef NONMATCHING
//FixMe
u8 sub_808DFE4(u16 a, u8 b, u8 c)
{
    u8 text[10];
    u8 i;
    u32 species;
    
    for(i = 0; i < 10; i++)
        text[i] = 0;
    text[i] = EOS;
    species = NationalPokedexNumToSpecies(a);
    if(species)
    {
        for(i = 0; gSpeciesNames[species][i] != EOS && i < 10; i++)
            text[i] = gSpeciesNames[species][i];
    }
    else
    {
        for(i = 0; i < 10; i++)
            text[i] = 0xAE;
    }
    sub_80729D8(text, (b - 0x11) * 8 + 0xFC, c * 8, 0);
}
#else
__attribute__((naked))
u8 sub_808DFE4(u16 a, u8 b, u8 c)
{
    asm(".syntax unified\n\
    push {r4-r6,lr}\n\
    sub sp, 0xC\n\
    lsls r0, 16\n\
    lsrs r3, r0, 16\n\
    lsls r1, 24\n\
    lsrs r5, r1, 24\n\
    lsls r2, 24\n\
    lsrs r6, r2, 24\n\
    movs r4, 0\n\
    movs r1, 0\n\
_0808DFF8:\n\
    mov r2, sp\n\
    adds r0, r2, r4\n\
    strb r1, [r0]\n\
    adds r0, r4, 0x1\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    cmp r4, 0x9\n\
    bls _0808DFF8\n\
    adds r0, r2, r4\n\
    movs r1, 0xFF\n\
    strb r1, [r0]\n\
    adds r0, r3, 0\n\
    bl NationalPokedexNumToSpecies\n\
    adds r3, r0, 0\n\
    cmp r3, 0\n\
    beq _0808E058\n\
    movs r4, 0\n\
    ldr r2, _0808E054\n\
    movs r0, 0xB\n\
    adds r1, r3, 0\n\
    muls r1, r0\n\
    adds r0, r1, r2\n\
    ldrb r0, [r0]\n\
    subs r5, 0x11\n\
    lsls r6, 19\n\
    cmp r0, 0xFF\n\
    beq _0808E070\n\
    adds r3, r1, 0\n\
_0808E032:\n\
    mov r0, sp\n\
    adds r1, r0, r4\n\
    adds r0, r4, r3\n\
    adds r0, r2\n\
    ldrb r0, [r0]\n\
    strb r0, [r1]\n\
    adds r0, r4, 0x1\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    adds r0, r4, r3\n\
    adds r0, r2\n\
    ldrb r0, [r0]\n\
    cmp r0, 0xFF\n\
    beq _0808E070\n\
    cmp r4, 0x9\n\
    bls _0808E032\n\
    b _0808E070\n\
    .align 2, 0\n\
_0808E054: .4byte gSpeciesNames\n\
_0808E058:\n\
    movs r4, 0\n\
    subs r5, 0x11\n\
    lsls r6, 19\n\
    movs r1, 0xAE\n\
_0808E060:\n\
    mov r2, sp\n\
    adds r0, r2, r4\n\
    strb r1, [r0]\n\
    adds r0, r4, 0x1\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    cmp r4, 0x9\n\
    bls _0808E060\n\
_0808E070:\n\
    lsls r1, r5, 27\n\
    movs r0, 0xFC\n\
    lsls r0, 24\n\
    adds r1, r0\n\
    lsrs r1, 24\n\
    lsrs r2, r6, 16\n\
    mov r0, sp\n\
    movs r3, 0\n\
    bl sub_80729D8\n\
    adds r0, r4, 0\n\
    add sp, 0xC\n\
    pop {r4-r6}\n\
    pop {r1}\n\
    bx r1\n\
    .syntax divided\n");
}
#endif

void sub_808E090(u8 a, u8 b, u16 c)
{
    u8 i;
    
    for(i = 0; i < 12; i++)
    {
        *(u16 *)(VRAM + c * 0x800 + b * 64 + (a + i) * 2) = 0;
        *(u16 *)(VRAM + 0x40 + c * 0x800 + b * 64 + (a + i) * 2) = 0;
    }
}

void sub_808E0CC(u16 a, u16 b)
{
    u8 i;
    u16 unk;
    u8 spriteId;
    
    for(i = 0; i < 4; i++)
        gUnknown_0202FFB4->unk61E[i] |= 0xFFFF;
    gUnknown_0202FFB4->unk626 = 0xFFFF;
    sub_808DBE8(0, a, b);
    REG_BG2VOFS = gUnknown_0202FFB4->unk62D;
    unk = sub_808E888(a - 1);
    if(unk != 0xFFFF)
    {
        spriteId = sub_808E8C8(unk, 0x60, 0x50);
        gSprites[spriteId].callback = sub_808EE28;
        gSprites[spriteId].data5 = -32;
    }
    unk = sub_808E888(a);
    if(unk != 0xFFFF)
    {
        spriteId = sub_808E8C8(unk, 0x60, 0x50);
        gSprites[spriteId].callback = sub_808EE28;
        gSprites[spriteId].data5 = 0;
    }
    unk = sub_808E888(a + 1);
    if(unk != 0xFFFF)
    {
        spriteId = sub_808E8C8(unk, 0x60, 0x50);
        gSprites[spriteId].callback = sub_808EE28;
        gSprites[spriteId].data5 = 32;
    }
    gUnknown_0202FFB4->unk630 = 0;
    gUnknown_0202FFB4->unk632 = 0;
}

bool8 sub_808E208(u8 a, u8 b, u8 c)
{
    u16 i;
    u8 foo;
 
    if(gUnknown_0202FFB4->unk62E)
    {
        gUnknown_0202FFB4->unk62E--;
        switch(a)
        {
            case 1:
                for(i = 0; i < 4; i++)
                {
                    if(gUnknown_0202FFB4->unk61E[i] != 0xFFFF)
                        gSprites[gUnknown_0202FFB4->unk61E[i]].data5 += b;
                }
                foo = 16 * (c - gUnknown_0202FFB4->unk62E) / c;
                REG_BG2VOFS = gUnknown_0202FFB4->unk62D + gUnknown_0202FFB4->unk632 * 16 - foo;
                gUnknown_0202FFB4->unk62C -= gUnknown_0202FFB4->unk628;
                break;
            case 2:
                for(i = 0; i < 4; i++)
                {
                    if(gUnknown_0202FFB4->unk61E[i] != 0xFFFF)
                        gSprites[gUnknown_0202FFB4->unk61E[i]].data5 -= b;
                }
                foo = 16 * (c - gUnknown_0202FFB4->unk62E) / c;
                REG_BG2VOFS = gUnknown_0202FFB4->unk62D + gUnknown_0202FFB4->unk632 * 16 + foo;
                gUnknown_0202FFB4->unk62C += gUnknown_0202FFB4->unk628;
                break;
        }
        return 0;
    }
    //_0808E36C
    else
    {
        REG_BG2VOFS = gUnknown_0202FFB4->unk62D + gUnknown_0202FFB4->unk630 * 16;
        return 1;
    }
}

void sub_808E398(u8 a, u16 b)
{
    u16 unk;
    u8 spriteId;
    
    gUnknown_0202FFB4->unk632 = gUnknown_0202FFB4->unk630;
    switch(a)
    {
        case 1:
        {
            unk = sub_808E888(b - 1);
            if(unk != 0xFFFF)
            {
                spriteId = sub_808E8C8(unk, 0x60, 0x50);
                gSprites[spriteId].callback = sub_808EE28;
                gSprites[spriteId].data5 = 0xFFC0;
            }
            if(gUnknown_0202FFB4->unk630 > 0)
                gUnknown_0202FFB4->unk630--;
            else
                gUnknown_0202FFB4->unk630 = 0xF;
            break;
        }
        case 2:
        {
            unk = sub_808E888(b + 1);
            if(unk != 0xFFFF)
            {
                spriteId = sub_808E8C8(unk, 0x60, 0x50);
                gSprites[spriteId].callback = sub_808EE28;
                gSprites[spriteId].data5 = 0x40;
            }
            if(gUnknown_0202FFB4->unk630 <= 0xE)
                gUnknown_0202FFB4->unk630++;
            else
                gUnknown_0202FFB4->unk630 = 0;
            break;
        }
    }
}

/*
u16 sub_808E48C(u16 a, u16 b)
{
    if((gMain.heldKeys & 0x40) || a == 0)
    {
        //_0808E4B6
        if(gMain.heldKeys & 0x80)
        {
            
        }
        //_0808E4CE
    }
    //_0808E5E4
    else
    {
        sub_8091818(1, a, 0, gUnknown_0202FFB4->unk60C - 1);
        sub_808E398(1, a);
        sub_808DBE8(1, a, b);
        PlaySE(0x6C);
    }
    
}
*/
