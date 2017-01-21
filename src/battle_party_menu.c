#include "global.h"
#include "asm.h"
#include "main.h"
#include "palette.h"
#include "pokemon.h"
#include "songs.h"
#include "sound.h"
#include "task.h"
#include "text.h"

struct PartyMenuItem
{
    const u8 *text;
    void (*func)(void);
};

struct UnknownStruct2
{
    u8 unk0;
    u8 unk1;
    const u8 *unk4;
};

extern u8 IsLinkDoubleBattle(void);
extern void TryCreatePartyMenuMonIcon(u8, u8, struct Pokemon *);
extern void LoadHeldItemIconGraphics(void);
extern void CreateHeldItemIcons_806DC34();
extern u8 sub_806BD58(u8, u8);
extern void PartyMenuPrintMonsLevelOrStatus(void);
extern void PrintPartyMenuMonNicknames(void);
extern void PartyMenuTryPrintMonsHP(void);
extern void nullsub_13(void);
extern void PartyMenuDrawHPBars(void);
extern u8 sub_806B58C(u8);
extern u8 GetItemEffectType();
extern void sub_806E750(u8, const struct UnknownStruct2 *, const struct PartyMenuItem *, int);
extern u16 sub_806BD80();
extern u8 sub_806CA38();
extern void sub_806D5A4(void);
extern void sub_802E414(void);
extern void sub_8094D60(void);
extern void sub_80A6DCC(void);
extern void sub_806AF4C();

struct UnknownStruct1
{
    u8 filler0[0x259];
    u8 unk259;
    u8 filler25A[6];
    u8 unk260;
    u8 filler261[3];
    s16 unk264;
    s16 unk266;
};

extern u8 unk_2000000[];

#define EWRAM_1B000 (*(struct UnknownStruct1 *)(unk_2000000 + 0x1B000))

extern u16 gScriptItemId;
extern u8 gUnknown_0202E8F4;
extern u8 gUnknown_02038473;
extern void (*gUnknown_03004AE4)();  //don't know types yet
extern const struct PartyMenuItem gUnknown_083B5FCC[];
extern const struct UnknownStruct2 gUnknown_083B5FF4[];

void sub_80952E4(u8);
void sub_8095408(u8);
void sub_809527C(u8);
void sub_80952B4(u8);
void sub_8095330(u8);
void sub_809538C(void);

int SetUpBattlePartyMenu(void)
{
    switch (EWRAM_1B000.unk264)
    {
    case 0:
        //TODO: try to get rid of this duplicate code
        if (IsLinkDoubleBattle() == TRUE)
        {
            if (EWRAM_1B000.unk266 != 6)
            {
                TryCreatePartyMenuMonIcon(EWRAM_1B000.unk260, EWRAM_1B000.unk266, &gPlayerParty[EWRAM_1B000.unk266]);
                EWRAM_1B000.unk266++;
            }
            else
            {
                EWRAM_1B000.unk266 = 0;
                EWRAM_1B000.unk264++;
            }
        }
        else
        {
            if (EWRAM_1B000.unk266 <= 5)
            {
                TryCreatePartyMenuMonIcon(EWRAM_1B000.unk260, EWRAM_1B000.unk266, &gPlayerParty[EWRAM_1B000.unk266]);
                EWRAM_1B000.unk266++;
            }
            else
            {
                EWRAM_1B000.unk266 = 0;
                EWRAM_1B000.unk264++;
            }                
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
        if (sub_806BD58(EWRAM_1B000.unk260, EWRAM_1B000.unk266) == 1)
        {
            EWRAM_1B000.unk266 = 0;
            EWRAM_1B000.unk264++;
        }
        else
        {
            EWRAM_1B000.unk266++;
        }
        break;
    case 4:
        PartyMenuPrintMonsLevelOrStatus();
        EWRAM_1B000.unk264++;
        break;
    case 5:
        PrintPartyMenuMonNicknames();
        EWRAM_1B000.unk264++;
        break;
    case 6:
        PartyMenuTryPrintMonsHP();
        EWRAM_1B000.unk264++;
        break;
    case 7:
        nullsub_13();
        EWRAM_1B000.unk264++;
        break;
    case 8:
        PartyMenuDrawHPBars();
        EWRAM_1B000.unk264++;
        break;
    case 9:
        if (sub_806B58C(EWRAM_1B000.unk266) == 1)
        {
            EWRAM_1B000.unk266 = 0;
            EWRAM_1B000.unk264++;
        }
        else
        {
            EWRAM_1B000.unk266++;
        }
        break;
    case 10:
        if (gUnknown_02038473 == 3)
        {
            if (GetItemEffectType(gScriptItemId) == 10)
                EWRAM_1B000.unk259 = 0xFF;
            else
                EWRAM_1B000.unk259 = 3;
        }
        return TRUE;
    }
    return FALSE;
}

void sub_8095050(u8 a, u8 b)
{
    if (!GetMonData(&gPlayerParty[b], MON_DATA_IS_EGG))
    {
        if (gUnknown_02038473 == 1)
        {
            gTasks[EWRAM_1B000.unk260].data[4] = 1;
            gTasks[EWRAM_1B000.unk260].data[5] = 1;
        }
        else
        {
            gTasks[EWRAM_1B000.unk260].data[4] = 0;
            gTasks[EWRAM_1B000.unk260].data[5] = 0;
        }
    }
    else
    {
        gTasks[EWRAM_1B000.unk260].data[4] = 2;
        gTasks[EWRAM_1B000.unk260].data[5] = 2;
    }
    sub_806E750(gTasks[a].data[4], gUnknown_083B5FF4, gUnknown_083B5FCC, 0);
}

void SetUpBattlePokemonMenu(u8 a)
{
    if (!gPaletteFade.active)
    {
        if (gUnknown_02038473 == 3 && GetItemEffectType(gScriptItemId) == 10)
        {
            gUnknown_03004AE4(a, gScriptItemId, sub_80952E4);
            return;
        }
        
        switch (sub_806BD80(a))
        {
        case 1:
            if (gUnknown_02038473 == 3)
            {
                if (GetMonData(&gPlayerParty[sub_806CA38(a)], MON_DATA_IS_EGG))
                {
                    PlaySE(SE_HAZURE);
                }
                else
                {
                    sub_806D5A4();
                    gUnknown_03004AE4(a, gScriptItemId, sub_80952E4);
                }
            }
            else
            {
                PlaySE(SE_SELECT);
                GetMonNickname(&gPlayerParty[sub_806CA38(a)], gStringVar1);
                sub_8095050(a, sub_806CA38(a));
                SetTaskFuncWithFollowupFunc(a, sub_8095408, SetUpBattlePokemonMenu);
            }
            break;
        case 2:
            if (gUnknown_02038473 == 1)
            {
                PlaySE(SE_HAZURE);
            }
            else
            {
                PlaySE(SE_SELECT);
                if (gUnknown_02038473 == 3)
                {
                    gUnknown_0202E8F4 = 0;
                    gTasks[a].func = sub_80952E4;
                }
                else
                {
                    gUnknown_0202E8F4 = 0;
                    gTasks[a].func = sub_809527C;
                }
            }
            break;
        }
    }
}

void sub_809527C(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
    gTasks[taskId].func = sub_80952B4;
}

void sub_80952B4(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        sub_8094D60();
        DestroyTask(taskId);
        SetMainCallback2(sub_802E414);
    }
}

void sub_80952E4(u8 taskId)
{
    if (gUnknown_0202E8F4 != 0)
    {
        sub_809527C(taskId);
    }
    else
    {
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
        gTasks[taskId].func = sub_8095330;
    }
}

void sub_8095330(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        sub_8094D60();
        DestroyTask(taskId);
        sub_80A6DCC();
    }
}

void sub_809535C(u8 taskId)
{
    gPaletteFade.bufferTransferDisabled = TRUE;
    sub_806AF4C(1, 0xFF, SetUpBattlePokemonMenu, 5);
    SetMainCallback2(sub_809538C);
}
