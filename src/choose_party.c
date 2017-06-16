#include "global.h"
#include "asm.h"
#include "menu.h"
#include "palette.h"
#include "party_menu.h"
#include "pokemon.h"
#include "songs.h"
#include "sound.h"
#include "strings.h"
#include "task.h"
#include "text.h"

struct UnknownPokemonStruct2
{
    /*0x00*/ u16 species;
    /*0x02*/ u16 heldItem;
    /*0x04*/ u8 nickname[11];
    /*0x0F*/ u8 level;
    /*0x10*/ u16 hp;
    /*0x12*/ u16 maxhp;
    /*0x14*/ u32 status;
    /*0x18*/ u32 personality;
    /*0x1C*/ u8 gender;
    /*0x1D*/ u8 language;
};

extern u8 gSelectedOrderFromParty[];
extern u8 gPlayerPartyCount;
extern u8 gLastFieldPokeMenuOpened;
extern u8 gUnknown_020384F0;
extern struct UnknownPokemonStruct2 gUnknown_02023A00[];
extern u8 gUnknown_0202E8F6;
extern struct Pokemon gUnknown_030042FC[];

extern const u16 gBattleTowerBanlist[];
extern const struct PartyMenuItem gUnknown_084017B0[];
extern const struct PartyPopupMenu gUnknown_084017D8[];

extern void OpenPartyMenu();
extern void TryCreatePartyMenuMonIcon(u8, u8, struct Pokemon *);
extern void LoadHeldItemIconGraphics(void);
extern void CreateHeldItemIcons_806DC34();
extern u8 sub_806BD58(u8, u8);
extern void PartyMenuPrintMonsLevelOrStatus(void);
extern void PrintPartyMenuMonNicknames(void);
extern void sub_806BC3C(u8, u8);
extern u8 sub_806B58C(u8);
extern void sub_806D538();
extern void sub_806E750(u8, const struct PartyPopupMenu *, const struct PartyMenuItem *, int);
extern u16 sub_806BE38();
extern u8 sub_806CA38();
extern void sub_808B5B4();
extern TaskFunc PartyMenuGetPopupMenuFunc(u8, const struct PartyPopupMenu *, const struct PartyMenuItem *, u8);
extern u8 sub_806B124();
extern void sub_806C994();
extern void sub_806C658();
extern void sub_806AEDC(void);
extern void sub_806AF4C();
extern void ShowPokemonSummaryScreen(struct Pokemon *, u8, u8, void (*)(void), int);
extern void sub_806C890();
extern void sub_806D5A4();
extern void sub_806B908(void);
extern void CreateMonIcon_806D99C(int, u8, int, struct UnknownPokemonStruct2 *);
extern void sub_806D50C(int, u8);
extern void CreatePartyMenuMonIcon();
extern void CreateHeldItemIcon_806DCD4(int, u8, int);
extern u8 GetMonStatusAndPokerus();
extern void PartyMenuPrintHP();
extern void PartyMenuPutStatusTilemap(int, int, u8);
extern void PartyMenuPrintLevel();
extern void PartyMenuPutNicknameTilemap();
extern void PrintPartyMenuMonNickname();
extern void PartyMenuDrawHPBar();

void sub_8121E58(void);
bool8 sub_8122030(struct Pokemon *);
void sub_812238C(u8);
void sub_8122450(u8);
void sub_81224A8(u8);
void sub_8122728(u8);
void sub_8122838(u8);
void sub_81228E8(u8);
void sub_8122950(u8);
void sub_81229B8(void);

void sub_8121E10(void)
{
    sub_8121E58();
    ewram1B000.unk263 = 0;
    OpenPartyMenu(4, 0);
}

void sub_8121E34(void)
{
    sub_8121E58();
    ewram1B000.unk263 = 1;
    OpenPartyMenu(4, 0);
}

void sub_8121E58(void)
{
    u8 i;

    for (i = 0; i < 3; i++)
        gSelectedOrderFromParty[i] = 0;
}

bool8 sub_8121E78(void)
{
    u8 i;

    switch (ewram1B000_alt.unk264)
    {
    case 0:
        if (ewram1B000_alt.unk266 < gPlayerPartyCount)
        {
            TryCreatePartyMenuMonIcon(ewram1B000_alt.unk260, ewram1B000_alt.unk266, &gPlayerParty[ewram1B000_alt.unk266]);
            ewram1B000_alt.unk266++;
        }
        else
        {
            ewram1B000_alt.unk266 = 0;
            ewram1B000_alt.unk264++;
        }
        break;
    case 1:
        LoadHeldItemIconGraphics();
        ewram1B000_alt.unk264++;
        break;
    case 2:
        CreateHeldItemIcons_806DC34(ewram1B000_alt.unk260);
        ewram1B000_alt.unk264++;
        break;
    case 3:
        if (sub_806BD58(ewram1B000_alt.unk260, ewram1B000_alt.unk266) == 1)
        {
            ewram1B000_alt.unk266 = 0;
            ewram1B000_alt.unk264++;
        }
        else
        {
            ewram1B000_alt.unk266++;
        }
        break;
    case 4:
        PartyMenuPrintMonsLevelOrStatus();
        ewram1B000_alt.unk264++;
        break;
    case 5:
        PrintPartyMenuMonNicknames();
        ewram1B000_alt.unk264++;
        break;
    case 6:
        for (i = 0; i < gPlayerPartyCount; i++)
        {
            u8 j;

            for (j = 0; j < 3; j++)
            {
                if (gSelectedOrderFromParty[j] == i + 1)
                {
                    sub_806BC3C(i, j * 14 + 0x1C);
                    break;
                }
            }
            if (j == 3)
            {
                if (sub_8122030(&gPlayerParty[i]) == TRUE)
                    sub_806BC3C(i, 0x70);
                else
                    sub_806BC3C(i, 0x7E);
            }
        }
        ewram1B000_alt.unk264++;
        break;
    case 7:
        if (sub_806B58C(ewram1B000_alt.unk266) == 1)
        {
            ewram1B000_alt.unk266 = 0;
            ewram1B000_alt.unk264 = 0;
            return TRUE;
        }
        else
        {
            ewram1B000_alt.unk266++;
        }
        break;
    }
    return FALSE;
}

#ifdef NONMATCHING
bool8 sub_8122030(struct Pokemon *pkmn)
{
    u16 r3;
    s32 i;

    if (GetMonData(pkmn, MON_DATA_IS_EGG))
        return FALSE;

    if (ewram1B000.unk263 == 0)
    {
        if (GetMonData(pkmn, MON_DATA_HP) == 0)
            return FALSE;
        else
            return TRUE;
    }

    if ((gSaveBlock2.filler_A8.var_4AC & 1) == 0
     && GetMonData(pkmn, MON_DATA_LEVEL) > 50)
        return FALSE;

    r3 = GetMonData(pkmn, MON_DATA_SPECIES);
    // Can't stop the compiler from optimizing out the first index
    for (i = 0; gBattleTowerBanlist[i] != 0xFFFF; i++)
    {
        if (gBattleTowerBanlist[i] == r3)
            return FALSE;
    }
    return TRUE;
}
#else
__attribute__((naked))
bool8 sub_8122030(struct Pokemon *pkmn)
{
    asm_unified(
	"push {r4,lr}\n\
	adds r4, r0, 0\n\
	movs r1, 0x2D\n\
	bl GetMonData\n\
	cmp r0, 0\n\
	bne _0812207C\n\
	ldr r0, _08122058 @ =0x0201b000\n\
	ldr r1, _0812205C @ =0x00000263\n\
	adds r0, r1\n\
	ldrb r0, [r0]\n\
	cmp r0, 0\n\
	bne _08122060\n\
	adds r0, r4, 0\n\
	movs r1, 0x39\n\
	bl GetMonData\n\
	cmp r0, 0\n\
	beq _0812207C\n\
	b _081220B6\n\
	.align 2, 0\n\
_08122058: .4byte 0x0201b000\n\
_0812205C: .4byte 0x00000263\n\
_08122060:\n\
	ldr r0, _08122080 @ =gSaveBlock2\n\
	ldr r1, _08122084 @ =0x00000554\n\
	adds r0, r1\n\
	ldrb r1, [r0]\n\
	movs r0, 0x1\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _08122088\n\
	adds r0, r4, 0\n\
	movs r1, 0x38\n\
	bl GetMonData\n\
	cmp r0, 0x32\n\
	bls _08122088\n\
_0812207C:\n\
	movs r0, 0\n\
	b _081220B8\n\
	.align 2, 0\n\
_08122080: .4byte gSaveBlock2\n\
_08122084: .4byte 0x00000554\n\
_08122088:\n\
	adds r0, r4, 0\n\
	movs r1, 0xB\n\
	bl GetMonData\n\
	lsls r0, 16\n\
	lsrs r3, r0, 16\n\
	ldr r1, _081220C0 @ =gBattleTowerBanlist\n\
	movs r0, 0\n\
	lsls r0, 1\n\
	adds r2, r0, r1\n\
	ldrh r0, [r2]\n\
	ldr r1, _081220C4 @ =0x0000ffff\n\
	cmp r0, r1\n\
	beq _081220B6\n\
	adds r4, r1, 0\n\
	adds r1, r2, 0\n\
_081220A8:\n\
	ldrh r0, [r1]\n\
	cmp r0, r3\n\
	beq _0812207C\n\
	adds r1, 0x2\n\
	ldrh r0, [r1]\n\
	cmp r0, r4\n\
	bne _081220A8\n\
_081220B6:\n\
	movs r0, 0x1\n\
_081220B8:\n\
	pop {r4}\n\
	pop {r1}\n\
	bx r1\n\
	.align 2, 0\n\
_081220C0: .4byte gBattleTowerBanlist\n\
_081220C4: .4byte 0x0000ffff\n"
    );
}
#endif

u8 sub_81220C8(void)
{
    u8 i;

    if (ewram1B000.unk263 == 0)
        return 0xFF;
    if (gSelectedOrderFromParty[2] == 0)
        return 0x11;
    for (i = 0; i < 2; i++)
    {
        u8 j;

        ewram1B000.unk282 = GetMonData(&gUnknown_030042FC[gSelectedOrderFromParty[i]], MON_DATA_SPECIES);
        ewram1B000.unk280 = GetMonData(&gUnknown_030042FC[gSelectedOrderFromParty[i]], MON_DATA_HELD_ITEM);
        for (j = i + 1; j < 3; j++)
        {
            if (ewram1B000.unk282 == GetMonData(&gUnknown_030042FC[gSelectedOrderFromParty[j]], MON_DATA_SPECIES))
                return 0x12;
            if (ewram1B000.unk280 != 0 && ewram1B000.unk280 == GetMonData(&gUnknown_030042FC[gSelectedOrderFromParty[j]], MON_DATA_HELD_ITEM))
                return 0x13;
        }
    }
    return 0xFF;
}

bool8 sub_81221CC(u8 a)
{
    u8 i;

    for (i = 0; i < 3; i++)
    {
        if (gSelectedOrderFromParty[i] == a)
            return TRUE;
    }
    return FALSE;
}

void sub_81221F8(u8 taskId)
{
    sub_806D538(5, 1);
    if (sub_8122030(&gPlayerParty[gLastFieldPokeMenuOpened]) == TRUE)
    {
        if (sub_81221CC(gLastFieldPokeMenuOpened + 1) == TRUE)
        {
            gTasks[taskId].data[4] = 1;
            sub_806E750(1, gUnknown_084017D8, gUnknown_084017B0, 0);
        }
        else
        {
            gTasks[taskId].data[4] = 0;
            sub_806E750(0, gUnknown_084017D8, gUnknown_084017B0, 0);
        }
    }
    else
    {
        gTasks[taskId].data[4] = 2;
        sub_806E750(2, gUnknown_084017D8, gUnknown_084017B0, 0);
    }
}

void sub_81222B0(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        switch (sub_806BE38(taskId))
        {
        case 1:
            PlaySE(SE_SELECT);
            gLastFieldPokeMenuOpened = sub_806CA38(taskId);
            if (gLastFieldPokeMenuOpened != 6)
            {
                GetMonNickname(&gPlayerParty[gLastFieldPokeMenuOpened], gStringVar1);
                sub_81221F8(taskId);
                gTasks[taskId].func = sub_812238C;
            }
            else
            {
                gTasks[taskId].func = sub_81224A8;
            }
            sub_808B5B4(taskId);
            break;
        case 2:
            PlaySE(SE_SELECT);
            sub_8121E58();
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
            gTasks[taskId].func = sub_8122450;
            break;
        }
    }
}

// Handle input
void sub_812238C(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        if (gMain.newAndRepeatedKeys & 0x40)
        {
            if (GetMenuCursorPos() != 0)
            {
                PlaySE(SE_SELECT);
                MoveMenuCursor(-1);
            }
            return;
        }
        if (gMain.newAndRepeatedKeys & 0x80)
        {
            if (GetMenuCursorPos() != 3)
            {
                PlaySE(SE_SELECT);
                MoveMenuCursor(1);
            }
            return;
        }
        if (gMain.newKeys & A_BUTTON)
        {
            TaskFunc popupMenuFunc;

            PlaySE(SE_SELECT);
            popupMenuFunc = PartyMenuGetPopupMenuFunc(
              gTasks[taskId].data[4],
              gUnknown_084017D8,
              gUnknown_084017B0,
              GetMenuCursorPos());
            popupMenuFunc(taskId);
            return;
        }
        if (gMain.newKeys & B_BUTTON)
        {
            sub_8122838(taskId);
            return;
        }
    }
}

// Return from menu?
void sub_8122450(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(gMain.savedCallback);
        DestroyTask(taskId);
    }
}

// Wait for A or B press
void sub_8122480(u8 taskId)
{
    if ((gMain.newKeys & A_BUTTON) || (gMain.newKeys & B_BUTTON))
        sub_8122838(taskId);
}

void sub_81224A8(u8 taskId)
{
    u8 val = sub_81220C8();

    if (val != 0xFF)
    {
        sub_806D538(val, 0);
        gTasks[taskId].func = sub_8122480;
    }
    else
    {
        if (gSelectedOrderFromParty[0] != 0)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
            gTasks[taskId].func = sub_8122450;
        }
        else
        {
            PlaySE(SE_HAZURE);
            sub_806D538(14, 0);
            gTasks[taskId].func = sub_8122480;
        }
    }
}

// CB2 for menu?
void sub_8122530(void)
{
    while (1)
    {
        if (sub_806B124() == 1)
        {
            sub_806C994(ewram1B000.unk260, gUnknown_020384F0);
            sub_806C658(ewram1B000.unk260, 0);
            GetMonNickname(&gPlayerParty[gUnknown_020384F0], gStringVar1);
            gLastFieldPokeMenuOpened = gUnknown_020384F0;
            sub_81221F8(ewram1B000.unk260);
            SetMainCallback2(sub_806AEDC);
            break;
        }
        if (sub_80F9344() == 1)
            break;
    }
}

void sub_81225A4(void)
{
    gPaletteFade.bufferTransferDisabled = TRUE;
    sub_806AF4C(4, 0xFF, sub_812238C, 5);
    SetMainCallback2(sub_8122530);
}

// Wait for fade, then show summary screen
void sub_81225D4(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        u8 r4 = gSprites[gTasks[taskId].data[3] >> 8].data0;

        DestroyTask(taskId);
        ewram1B000.unk262 = 1;
        ShowPokemonSummaryScreen(gPlayerParty, r4, gPlayerPartyCount - 1, sub_81225A4, 0);
    }
}

// Summary callback?
void sub_812265C(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
    gTasks[taskId].func = sub_81225D4;
}

void sub_8122694(u8 taskId)
{
    u8 i;

    for (i = 0; i < 3; i++)
    {
        if (gSelectedOrderFromParty[i] == 0)
        {
            gSelectedOrderFromParty[i] = gLastFieldPokeMenuOpened + 1;
            sub_806BC3C(gLastFieldPokeMenuOpened, i * 14 + 0x1C);
            if (i == 2)
                sub_806C890(taskId);
            sub_8122838(taskId);
            return;
        }
    }
    PlaySE(SE_HAZURE);
    MenuZeroFillWindowRect(20, 10, 29, 19);
    HandleDestroyMenuCursors();
    sub_806D5A4();
    sub_806E834(gOtherText_NoMoreThreePoke, 1);
    gTasks[taskId].func = sub_8122728;
}

void sub_8122728(u8 taskId)
{
    if (gUnknown_0202E8F6 == 1)
        return;

    if ((gMain.newKeys & A_BUTTON) || (gMain.newKeys & B_BUTTON))
    {
        MenuZeroFillWindowRect(0, 14, 29, 19);
        HandleDestroyMenuCursors();
        sub_8122838(taskId);
    }
}

void sub_8122770(u8 taskId)
{
    u8 i;

    for (i = 0; i < 3; i++)
    {
        if (gSelectedOrderFromParty[i] == gLastFieldPokeMenuOpened + 1)
        {
            gSelectedOrderFromParty[i] = 0;
            switch (i)
            {
            case 0:
                gSelectedOrderFromParty[0] = gSelectedOrderFromParty[1];
                gSelectedOrderFromParty[1] = gSelectedOrderFromParty[2];
                gSelectedOrderFromParty[2] = 0;
                break;
            case 1:
                gSelectedOrderFromParty[1] = gSelectedOrderFromParty[2];
                gSelectedOrderFromParty[2] = 0;
                break;
            }
            break;  // exit loop
        }
    }
    sub_806BC3C(gLastFieldPokeMenuOpened, 0x70);
    if (gSelectedOrderFromParty[0] != 0)
        sub_806BC3C(gSelectedOrderFromParty[0] - 1, 0x1C);
    if (gSelectedOrderFromParty[1] != 0)
        sub_806BC3C(gSelectedOrderFromParty[1] - 1, 0x2A);
    sub_8122838(taskId);
}

void sub_81227FC(u8 taskId)
{
    MenuZeroFillWindowRect(20, 10, 29, 19);
    HandleDestroyMenuCursors();
    sub_806D538(0, 0);
    gTasks[taskId].func = sub_81222B0;
}

void sub_8122838(u8 taskId)
{
    PlaySE(SE_SELECT);
    sub_81227FC(taskId);
}

bool8 sub_8122854(void)
{
    switch (ewram1B000_alt.unk264)
    {
    case 0:
        sub_81228E8(ewram1B000_alt.unk260);
        ewram1B000_alt.unk264++;
        break;
    case 1:
        LoadHeldItemIconGraphics();
        ewram1B000_alt.unk264++;
        break;
    case 2:
        sub_8122950(ewram1B000_alt.unk260);
        ewram1B000_alt.unk264++;
        break;
    case 3:
        sub_81229B8();
        ewram1B000_alt.unk264++;
        break;
    case 4:
        sub_806B908();
        return TRUE;
    }
    return FALSE;
}

void sub_81228E8(u8 a)
{
    u8 i;
    
    for (i = 0; i < 3; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES) != 0)
            CreatePartyMenuMonIcon(a, i, 3, &gPlayerParty[i]);
        if (gUnknown_02023A00[i].species != 0)
        {
            CreateMonIcon_806D99C(a, i + 3, 3, &gUnknown_02023A00[i]);
            sub_806D50C(a, i + 3);
        }
    }
}

void sub_8122950(u8 a)
{
    u8 i;
    
    for (i = 0; i < 3; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES) != 0)
        {
            u16 item = GetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM);
            
            CreateHeldItemIcon_806DCD4(a, i, item);
        }
        if (gUnknown_02023A00[i].species != 0)
            CreateHeldItemIcon_806DCD4(a, i + 3, gUnknown_02023A00[i].heldItem);
    }
}

void sub_81229B8(void)
{
    u8 i;
    
    for (i = 0; i < 3; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES) != 0)
        {
            u8 status;
            
            PartyMenuPrintHP(i, 3, &gPlayerParty[i]);
            status = GetMonStatusAndPokerus(&gPlayerParty[i]);
            if (status != 0 && status != 6)
                PartyMenuPutStatusTilemap(i, 3, status - 1);
            else
                PartyMenuPrintLevel(i, 3, &gPlayerParty[i]);
            PartyMenuPutNicknameTilemap(i, 3, &gPlayerParty[i]);
            PrintPartyMenuMonNickname(i, 3, &gPlayerParty[i]);
            PartyMenuDrawHPBar(i, 3, &gPlayerParty[i]);
        }
    }
}
