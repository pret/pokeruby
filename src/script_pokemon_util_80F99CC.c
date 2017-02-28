#include "global.h"
#include "script.h"
#include "task.h"
#include "palette.h"
#include "battle_party_menu.h"
#include "sound.h"
#include "asm.h"
#include "rom4.h"
#include "pokemon.h"
#include "text.h"
#include "string_util.h"

extern u8 gPlayerPartyCount;
extern u16 gSpecialVar_0x8004;
extern u16 gSpecialVar_0x8005;
extern u8 gUnknown_02038694;
extern u16 gScriptResult;

extern u8 gMoveNames[][13];

extern void (*gUnknown_0300485C)(void);

extern void OpenPartyMenu(u8, u8);
extern void TryCreatePartyMenuMonIcon(u8, u8, struct Pokemon *);
extern void LoadHeldItemIconGraphics(void);
extern void CreateHeldItemIcons_806DC34(); // undefined args
extern u8 sub_806BD58(u8, u8);
extern void PartyMenuPrintMonsLevelOrStatus(void);
extern void PrintPartyMenuMonNicknames(void);
extern u8 sub_806B58C(u8);
extern u8 sub_80AE47C(struct Pokemon *party);
extern void sub_806BC3C(u8, u8);
extern u16 sub_806BD80(); // undefined args in battle_party_menu.c
extern u8 sub_806CA38();
extern void sub_8123138(u8);
extern u8 sub_8040574(struct Pokemon *party);
extern void sub_809D9F0(struct Pokemon *party, u8, u8, void *, u32);

void sub_80F9A8C(u8);
void sub_80F9C00(void);
void sub_80F9E1C(void);

struct UnknownStruct2018000
{
    u8 filler0[0x8];
    u8 unk8;
};

extern struct UnknownStruct2018000 unk_2018000;

void sub_80F99CC(void)
{
    u8 taskId;

    ScriptContext2_Enable();
    taskId = CreateTask((void *)sub_80F9A8C, 0xA);
    gTasks[taskId].data[0] = 2;
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
}

void sub_80F9A0C(void)
{
    u8 taskId;

    ScriptContext2_Enable();
    taskId = CreateTask((void *)sub_80F9A8C, 0xA);
    gTasks[taskId].data[0] = 3;
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
}

void sub_80F9A4C(void)
{
    u8 taskId;

    ScriptContext2_Enable();
    taskId = CreateTask((void *)sub_80F9A8C, 0xA);
    gTasks[taskId].data[0] = 7;
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
}

void sub_80F9A8C(u8 taskId)
{
    if(!gPaletteFade.active)
    {
        gPaletteFade.bufferTransferDisabled = 1;
        OpenPartyMenu(gTasks[taskId].data[0], 0);
        DestroyTask(taskId);
    }
}

bool8 sub_80F9ACC(void)
{
    switch(EWRAM_1B000.unk264)
    {
        case 0:
            if(EWRAM_1B000.unk266 < gPlayerPartyCount)
            {
                TryCreatePartyMenuMonIcon(EWRAM_1B000.unk260, EWRAM_1B000.unk266, &gPlayerParty[EWRAM_1B000.unk266]);
                EWRAM_1B000.unk266++;
            }
            else
            {
                EWRAM_1B000.unk266 = 0;
                EWRAM_1B000.unk264++;
            }
            break;
        case 1:
            LoadHeldItemIconGraphics();
            EWRAM_1B000.unk264++;
            break;
        case 2:
            CreateHeldItemIcons_806DC34(EWRAM_1B000.unk260);
            EWRAM_1B000.unk264++;
            break;
        case 3:
            if(sub_806BD58(EWRAM_1B000.unk260, EWRAM_1B000.unk266) != 1)
            {
                EWRAM_1B000.unk266++;
                break;
            }
            else
            {
                EWRAM_1B000.unk266 = 0;
                EWRAM_1B000.unk264++;
                break;
            }
        case 4:
            PartyMenuPrintMonsLevelOrStatus();
            EWRAM_1B000.unk264++;
            break;
        case 5:
            PrintPartyMenuMonNicknames();
            EWRAM_1B000.unk264++;
            break;
        case 6:
            sub_80F9C00();
            EWRAM_1B000.unk264++;
            break;
        case 7: // the only case that can return true.
            if(sub_806B58C(EWRAM_1B000.unk266) != 1)
            {
                EWRAM_1B000.unk266++;
                break;
            }
            else
            {
                EWRAM_1B000.unk266 = 0;
                EWRAM_1B000.unk264 = 0;
                return TRUE;
            }
    }
    return FALSE;
}

void sub_80F9C00(void)
{
    u8 i;
    
    for(i = 0; i < gPlayerPartyCount; i++)
    {
        switch(sub_80AE47C(&gPlayerParty[i]))
        {
            case 0:
            case 3:
            case 4:
                sub_806BC3C(i, 0x7E);
                break;
            case 1:
            case 2:
                sub_806BC3C(i, 0x70);
                break;
        }
    }
}

void sub_80F9C6C(u8 var)
{
    if(!gPaletteFade.active)
    {
        switch(sub_806BD80(var))
        {
            case 1:
                PlaySE(5);
                gUnknown_02038694 = sub_806CA38(var);
                gSpecialVar_0x8004 = gUnknown_02038694;
                sub_8123138(var);
                break;
            case 2:
                PlaySE(5);
                gUnknown_02038694 = 0xFF;
                gSpecialVar_0x8004 = 0xFF;
                sub_8123138(var);
                break;
        }
    }
}

bool8 sub_80F9CE8(void) // this is the same function as sub_80F9ACC except case 6 calls a different function. why
{
    switch(EWRAM_1B000.unk264)
    {
        case 0:
            if(EWRAM_1B000.unk266 < gPlayerPartyCount)
            {
                TryCreatePartyMenuMonIcon(EWRAM_1B000.unk260, EWRAM_1B000.unk266, &gPlayerParty[EWRAM_1B000.unk266]);
                EWRAM_1B000.unk266++;
            }
            else
            {
                EWRAM_1B000.unk266 = 0;
                EWRAM_1B000.unk264++;
            }
            break;
        case 1:
            LoadHeldItemIconGraphics();
            EWRAM_1B000.unk264++;
            break;
        case 2:
            CreateHeldItemIcons_806DC34(EWRAM_1B000.unk260);
            EWRAM_1B000.unk264++;
            break;
        case 3:
            if(sub_806BD58(EWRAM_1B000.unk260, EWRAM_1B000.unk266) != 1)
            {
                EWRAM_1B000.unk266++;
                break;
            }
            else
            {
                EWRAM_1B000.unk266 = 0;
                EWRAM_1B000.unk264++;
                break;
            }
        case 4:
            PartyMenuPrintMonsLevelOrStatus();
            EWRAM_1B000.unk264++;
            break;
        case 5:
            PrintPartyMenuMonNicknames();
            EWRAM_1B000.unk264++;
            break;
        case 6:
            sub_80F9E1C();
            EWRAM_1B000.unk264++;
            break;
        case 7: // the only case that can return true.
            if(sub_806B58C(EWRAM_1B000.unk266) != 1)
            {
                EWRAM_1B000.unk266++;
                break;
            }
            else
            {
                EWRAM_1B000.unk266 = 0;
                EWRAM_1B000.unk264 = 0;
                return TRUE;
            }
    }
    return FALSE;
}

void sub_80F9E1C(void)
{
    u8 i;
    
    for(i = 0; i < gPlayerPartyCount; i++)
    {
        if(!sub_8040574(&gPlayerParty[i]))
            sub_806BC3C(i, 0x9A);
        else
            sub_806BC3C(i, 0x8C);
    }
}

void sub_80F9E64(u8 var)
{
    if(!gPaletteFade.active)
    {
        switch(sub_806BD80(var))
        {
            case 1:
                PlaySE(5);
                gSpecialVar_0x8004 = sub_806CA38(var);
                gSpecialVar_0x8005 = sub_8040574(&gPlayerParty[gSpecialVar_0x8004]);
                sub_8123138(var);
                break;
            case 2:
                PlaySE(5);
                gSpecialVar_0x8004 = 0xFF;
                sub_8123138(var);
        }
    }
}

void sub_80F9EEC(void)
{
    sub_809D9F0(&gPlayerParty[0], gSpecialVar_0x8004, gPlayerPartyCount - 1, c2_exit_to_overworld_2_switch, 0);
    unk_2018000.unk8 = 3;
    gUnknown_0300485C = sub_8080990;
}

void sub_80F9F3C(void) // count pokemon moves
{
    u8 i;

    gScriptResult = 0;
    
    for(i = 0; i < 4; i++) // checks MOVE1-MOVE4
        if(GetMonData(&gPlayerParty[gSpecialVar_0x8004], i + 13))
            gScriptResult++;
}

void sub_80F9F84(void)
{
    struct Pokemon *party = &gPlayerParty[gSpecialVar_0x8004];
    u16 data = GetMonData(party, gSpecialVar_0x8005 + 13);

    GetMonNickname(party, gStringVar1);
    StringCopy(gStringVar2, gMoveNames[data]);
}
