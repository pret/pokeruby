#include "global.h"
#include "pokemon.h"
#include "task.h"

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
extern u8 gUnknown_02038473;
extern const struct PartyMenuItem gUnknown_083B5FCC[];
extern const struct UnknownStruct2 gUnknown_083B5FF4[];

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
