#include "gba/gba.h"
#include "main.h"
#include "palette.h"
#include "rng.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "text.h"

struct UnknownStruct2 {
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u8 unk4;
};

struct UnknownStruct {
    u8 filler0[0xE];
    u16 unkE;
    u8 filler10[0x5FC];
    //ToDo: figure out how to make the compiler not optimize these offsets
    u16 unk60C;
    u16 unk60E;
    u16 unk610;
    u16 unk612;
    u16 unk614;
    u16 unk616;
    u16 unk618;
    u16 unk61A;
    u16 unk61C;
    u8 filler61E[0x08];
    u16 unk626;
    u8 filler628[2];
    u16 unk62A;
    u8 unk62C;
    u8 unk62D;
    u8 unk62E;
    u8 unk62F;
    u8 filler630[4];
    u8 unk634;
    u8 unk635;
    u8 unk636;
    u8 filler637[0x13];
    u8 unk64A;
    u8 unk64B;
    u8 unk1:1;
    u8 unk64D;
    u8 unk64E;
    u8 unk64F;
    u8 unk650;
    u8 unk651;
    u16 unk652;
    s16 unk654;
};

extern struct MusicPlayerInfo gMPlay_BGM;
extern u8 gReservedSpritePaletteCount;
extern struct UnknownStruct *gUnknown_0202FFB4;
extern u16 gUnknown_0202FFB8;
extern u8 gUnknown_0202FFBA;

extern void m4aMPlayVolumeControl(struct MusicPlayerInfo *mplayInfo, u16 trackBits, u16 volume);
extern bool8 BeginNormalPaletteFade(u32, s8, u8, u8, u16);
extern void remove_some_task(void);
extern bool32 sub_806912C(void);
extern u16 pokedex_count(u8);
extern u8 sub_8091E3C(void);

void sub_808C0CC(void *);
void sub_808C608(u8 taskId);
void sub_808C0B8(void);
void sub_808C5F0(void);
bool8 sub_808D344(u8);
void sub_808C650(u8 taskId);
void sub_808E6BC(void);
void sub_808EDB8(struct Sprite *);
void sub_808CA64(u8 taskId);
void sub_808C8E8(u8 taskId);
void sub_808CB8C(u8 taskId);
u32 sub_808E48C(u16, u16);
void sub_808C898(u8 taskId);
void sub_808CC50(u8 taskId);
void sub_8091060(u16);
void sub_808CAE4(u8 taskId);
void sub_808D198(u8 taskId);
bool8 sub_808E208(u8, u8, u8);
bool32 sub_808E82C(void); //Not sure about return type
void sub_808E0CC(u16, u16);
u8 sub_808F210(u32, u8);
void sub_808F284(u32, u8);
bool8 sub_808F250(u8);
bool8 sub_808E71C(void);
void sub_808CCC4(u8 taskId);
u16 sub_8090F68(u8);
void sub_808D690(u8, u8);

void sub_808C27C(void)
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
                default: //This useless "default" is needed to match the original ROM.
                    gUnknown_0202FFB4 = (struct UnknownStruct *)0x02018000;
                    break;
                case 1:
                    gUnknown_0202FFB4 = (struct UnknownStruct *)0x02018800;
                    break;
                case 2:
                    gUnknown_0202FFB4 = (struct UnknownStruct *)0x02019000;
                    break;
                case 3:
                    gUnknown_0202FFB4 = (struct UnknownStruct *)0x02019800;
                    break;
            }
            sub_808C0CC(gUnknown_0202FFB4);
            CreateTask(sub_808C608, 0);
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
            SetMainCallback2(sub_808C5F0);
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
    SetMainCallback2(sub_808C5F0);
    if(!gUnknown_0202FFB4->unk64B)
        taskId = CreateTask(sub_808CAE4, 0);
    else
        taskId = CreateTask(sub_808D198, 0);
    gTasks[taskId].data[0] = CreateTask(func, 0);
    return gTasks[taskId].data[0];
}

void sub_808C5F0(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_808C608(u8 taskId)
{
    gUnknown_0202FFB4->unk1 = 0;
    if(sub_808D344(0))
    {
        gTasks[taskId].func = sub_808C650;
    }
}

/*
//FixMe
void sub_808C650(u8 taskId)
{
    REG_BG0VOFS = gUnknown_0202FFB4->unk654;
    
    if(gUnknown_0202FFB4->unk654)
    {
        gUnknown_0202FFB4->unk654 -= 8;
    }
    else
    {
        //_0808C68C
        if((gMain.newKeys & A_BUTTON) &&
        (((struct UnknownStruct2 *)gUnknown_0202FFB4)[gUnknown_0202FFB4->unk60E].unk3 << 31))
        {
            sub_808E6BC();
            BeginNormalPaletteFade(
              ~(1 << (gSprites[gUnknown_0202FFB4->unk626].oam.paletteNum + 16)),
              0, 0, 0x10, gUnknown_0202FFB4->unk654);
            gSprites[gUnknown_0202FFB4->unk626].callback = sub_808EDB8;
            gTasks[taskId].func = sub_808CA64;
            PlaySE(0x15);
        }
        //_0808C724
        else if(gMain.newKeys & 0x8)
        {
            gUnknown_0202FFB4->unk654 = 0;
            gUnknown_0202FFB4->unk650 = 1;
            gUnknown_0202FFB4->unk652 = 0;
            gTasks[taskId].func = sub_808C8E8;
            PlaySE(SE_SELECT);
        }
        //_0808C774
        else if(gMain.newKeys & 0x4)
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
            PlaySE(2);
        }
        //_0808C814
        else if(gMain.newKeys & 0x2)
        {
            BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
            gTasks[taskId].func = sub_808CC50;
            PlaySE(3);
        }
        else
        {
            //_0808C84C
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
        gTasks[taskId].func = sub_808C650;
    }
}

//FixMe
void sub_808C8E8(u8 taskId)
{
    REG_BG0VOFS = gUnknown_0202FFB4->unk654;
    if(gUnknown_0202FFB4->unk654 != 0x50)
    {
        gUnknown_0202FFB4->unk654 += 8;
        return;
    }
    //_0808C91C
    if(gMain.newKeys & A_BUTTON)
    {
        switch(gUnknown_0202FFB4->unk652)
        {
            case 1:
                gUnknown_0202FFB4->unk60E = 0;
                //goto _0808C978
                gUnknown_0202FFB4->unk62C = 0x40;
                sub_808E82C();
                sub_808E0CC(gUnknown_0202FFB4->unk60E, 0xE);
                gMain.newKeys |= 0x8;
                break;
            case 2:
                gUnknown_0202FFB4->unk60E = gUnknown_0202FFB4->unk60C - 1;
                gUnknown_0202FFB4->unk62C = gUnknown_0202FFB4->unk60C * 16 + 0x30;
                sub_808E82C();
                sub_808E0CC(gUnknown_0202FFB4->unk60E, 0xE);
                gMain.newKeys |= 0x8;
                break;
            case 3:
                BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
                gTasks[taskId].func = sub_808CC50;
                PlaySE(3);
                break;
            case 0:
            default:
                gMain.newKeys |= 0x8;
                break;
        }
    }
    //_0808C9C4
    if(gMain.newKeys & 0xA)
    {
        gUnknown_0202FFB4->unk650 = 0;
        gTasks[taskId].func = sub_808C650;
        //goto _0808CA20
        PlaySE(SE_SELECT);
        return;
        
    }
    else
    {
        //_0808CA04
        if((gMain.newAndRepeatedKeys & 0x40) && gUnknown_0202FFB4->unk652)
        {
            gUnknown_0202FFB4->unk652--;
            PlaySE(SE_SELECT);
            return;
        }
    }
    //_0808CA30
    if((gMain.newAndRepeatedKeys & 0x80) && gUnknown_0202FFB4->unk652 <= 2)
    {
        gUnknown_0202FFB4->unk652++;
        PlaySE(SE_SELECT);
    }
}

void sub_808CA64(u8 taskId)
{
    if(gSprites[gUnknown_0202FFB4->unk626].pos1.x == 0x30 &&
    gSprites[gUnknown_0202FFB4->unk626].pos1.y == 0x38)
    {
        gUnknown_0202FFB4->unk64B = gUnknown_0202FFB4->unk64A;
        gTasks[taskId].data[0] = sub_808F210((u32)gUnknown_0202FFB4 + *(u16 *)((u32)&gUnknown_0202FFB4->unk64B - 0x3D) * 4, gUnknown_0202FFB4->unk626);
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
            sub_808F284((u32)gUnknown_0202FFB4 + gUnknown_0202FFB4->unk60E * 4, gTasks[taskId].data[8]);
        }
    }
    else
    {
        //_0808CB50
        gUnknown_0202FFB8 = gUnknown_0202FFB4->unk60E;
        gUnknown_0202FFBA = gUnknown_0202FFB4->unk62C;
        gTasks[taskId].func = sub_808C608;
    }
}

//FixMe
void sub_808CB8C(u8 taskId)
{
    bool8 isActive = gTasks[gTasks[taskId].data[0]].isActive;
    
    if(!isActive)
    {
        if(gUnknown_0202FFB4->unk64F)
        {
            *(u16 *)((u32)&gUnknown_0202FFB4->unk64F - 0x41) = isActive;
            gUnknown_0202FFB4->unk62C = 0x40;
            gTasks[taskId].func = sub_808CCC4;
        }
        else
        {
            //_0808CBE4
            gUnknown_0202FFB4->unk62C = gUnknown_0202FFB4->unk62A;
            *(u16 *)((u32)&gUnknown_0202FFB4->unk62C - 0x1E) = gUnknown_0202FFB4->unk610;
            
            if(!sub_806912C())
                gUnknown_0202FFB4->unk612 = 0;
            gUnknown_0202FFB4->unk618 = gUnknown_0202FFB4->unk616;
            gTasks[taskId].func = sub_808C608;
        }
    }
}
*/