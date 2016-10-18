#include "gba/gba.h"
#include "main.h"
#include "palette.h"
#include "rng.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "text.h"

struct PokedexListItem {
    u16 a;
    u8 seen:1;
    u8 owned:1;
    u8 c;
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
    u16 unk630;
    u16 unk632;
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

extern void m4aMPlayVolumeControl(struct MusicPlayerInfo *mplayInfo, u16 trackBits, u16 volume);
extern bool8 BeginNormalPaletteFade(u32, s8, u8, u8, u16);
extern void remove_some_task(void);
extern bool32 sub_806912C(void);
extern u16 pokedex_count(u8);
extern u8 sub_8091E3C(void);
extern void sub_80690C8(void);
extern void sub_805469C(void);

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
