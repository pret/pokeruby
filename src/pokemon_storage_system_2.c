
// Includes
#include "global.h"
#include "decompress.h"
#include "constants/songs.h"
#include "constants/species.h"
#include "data2.h"
#include "sound.h"
#include "ewram.h"
#include "task.h"
#include "main.h"
#include "palette.h"
#include "menu.h"
#include "graphics.h"
#include "strings.h"
#include "string_util.h"
#include "pokemon_summary_screen.h"
#include "mail_data.h"
#include "naming_screen.h"
#include "pokemon_storage_system.h"

// Static type declarations

// Static RAM declarations

EWRAM_DATA u8 gUnknown_0203847C = 0;
EWRAM_DATA u8 gUnknown_0203847D = 0;
EWRAM_DATA u8 gUnknown_0203847E = 0;
EWRAM_DATA u8 gUnknown_0203847F = 0;

// Static ROM declarations

void sub_8096884(void);
void sub_8096AFC(void);
void sub_8096B38(void);
void SetPSSCallback(void (*func)(void));
void sub_8096BF0(void);
void sub_8096C68(void);
void sub_8096C84(void);
void sub_8096FC8(void);
void sub_8097004(void);
void sub_8097078(void);
void sub_80972A8(void);
void sub_80972FC(void);
void c3_0808DC50(void);
void sub_8097390(void);
void sub_809746C(void);
void sub_8097594(void);
void sub_8097788(void);
void sub_80977E4(void);
void sub_8097858(void);
void sub_809789C(void);
void sub_8097974(void);
void sub_8097A64(void);
void sub_8097B44(void);
void sub_8097BA0(void);
void sub_8097CC0(void);
void sub_8097DE0(void);
void sub_8097E44(void);
void sub_8097E70(void);
void sub_8097F58(void);
void sub_8097FB8(void);
void sub_809801C(void);
void BoxSetMosaic(void);
void sub_8098090(struct Sprite *sprite);
void sub_80980D4(void);
void sub_80981F0(u16 species, u32 pid);
void sub_80982B4(void);
void sub_8098350(void);
void sub_8098400(void);
void add_to_c3_somehow(void);
void sub_8098780(void);
void sub_8098690(bool8 flag);
bool8 sub_80985CC(void);
void sub_80986E8(void);
void sub_8098710(void);
void sub_8098734(void);
void sub_80987DC(void);
void sub_809880C(void);
bool8 sub_8098830(void);
void PrintStorageActionText(u8 index);
void sub_8098A38(s8);
void sub_8098A5C(void);
void sub_8098A80(void);
void sub_8098AA8(u8 a0);

// .rodata

const u16 gPokemonStorageScrollingBGPalette[] = INCBIN_U16("graphics/pokemon_storage/scrolling_bg.gbapal");

const u16 gPokemonStorageScrollingBGTile[] = INCBIN_U16("graphics/pokemon_storage/scrolling_bg.4bpp");

const u8 gPokemonStorageScrollingBGTilemap[] = INCBIN_U8("graphics/pokemon_storage/scrolling_bg_map.bin.lz");

const u16 sUnknownTilemap[] = {
    0x1281,
    0x1282,
    0x1283,
    0x1284,
    0x1285,
    0x1286,
    0x1287,
    0x1288,
    0x128C,
    0x128D,
    0x128E,
    0x128F,
    0x1290,
    0x1291,
    0x1292,
    0x1293,
    0x0281,
    0x0282,
    0x0283,
    0x0284,
    0x0285,
    0x0286,
    0x0287,
    0x0288,
    0x028C,
    0x028D,
    0x028E,
    0x028F,
    0x0290,
    0x0291,
    0x0292,
    0x0293,
    0x12AD,
    0x12AE,
    0x12A8,
    0x12A8
};

const u16 WaveformPalette[] = INCBIN_U16("graphics/pokemon_storage/waveform.gbapal");

const u8 WaveformTiles[] = INCBIN_U8("graphics/pokemon_storage/waveform.4bpp");

const u16 gUnknown_083B6D74[] = INCBIN_U16("graphics/pokemon_storage/83B6D74.gbapal");

const u16 gUnknown_083B6D94[] = INCBIN_U16("graphics/pokemon_storage/83B6D94.gbapal");

struct PokemonStorageSystemData *const gPokemonStorageSystemPtr = &ePokemonStorageSystem;

u8 *const gUnknown_083B6DB8 = gTileBuffer;

const struct SpritePalette gWaveformSpritePalette = {
    WaveformPalette, 0xdacd
};

// .text

void task_intro_29(u8 whichMenu)
{
    gUnknown_0203847D = whichMenu;
    gPokemonStorageSystemPtr->unk_0005 = whichMenu;
    SetMainCallback2(sub_8096884);
}

void sub_80967DC(void)
{
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG2HOFS = 0;
    REG_BG3HOFS = 0;
    REG_BG3VOFS = 0;
}

void sub_8096804(void)
{
    ResetPaletteFade();
    ResetSpriteData();
    FreeSpriteTileRanges();
    FreeAllSpritePalettes();
    ResetTasks();
    gReservedSpriteTileCount = 0x280;
    sub_809CFDC(&gPokemonStorageSystemPtr->unk_0020, gPokemonStorageSystemPtr->unk_0028, 8);
    gKeyRepeatStartDelay = 20;
}

void sub_8096848(void)
{
    sub_809B0D4();
    gUnknown_0203847C = (gPokemonStorageSystemPtr->unk_0005 == 1 ? 1 : 0);
    gUnknown_0203847E = 0;
}

void sub_8096874(void)
{
    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_ON;
}

extern u8 unk_2038790;

void sub_8096884(void)
{
    switch (gMain.state)
    {
    case 0:
        SetVBlankCallback(NULL);
        REG_DISPCNT = 0;
        sub_8096804();
#if DEBUG
        unk_2038790 = 0;
#endif
        gMain.state++;
        break;
    case 1:
        Text_LoadWindowTemplate(&gWindowTemplate_81E6D00);
        gMain.state++;
        break;
    case 2:
        InitMenuWindow(&gWindowTemplate_81E6D00);
        Menu_EraseScreen();
        gMain.state++;
        break;
    case 3:
        sub_80967DC();
        sub_8096848();
        gMain.state++;
        break;
    case 4:
        ResetPSSMonIconSprites();
        sub_809AA24();
        gMain.state++;
        break;
    case 5:
        sub_8097DE0();
        gMain.state++;
        break;
    case 6:
        sub_8097E70();
        gMain.state++;
        break;
    case 7:
        sub_8098400();
        gMain.state++;
        break;
    case 8:
        sub_8099BF8(gPokemonStorage.currentBox);
        gPokemonStorageSystemPtr->unk_12bc.baseTileTag = 0x000a;
        gPokemonStorageSystemPtr->unk_12bc.basePaletteTag = 0xdacb;
        sub_80F727C(&gPokemonStorageSystemPtr->unk_12bc);
        sub_80F7404();
        gMain.state++;
        break;
    case 9:
        sub_8096874();
        SetPSSCallback(sub_8096BF0);
        SetMainCallback2(sub_8096B38);
        SetVBlankCallback(sub_8096AFC);
        gMain.state++;
        break;
    }
}

void sub_80969A0(void)
{
    switch (gMain.state)
    {
    case 0:
        SetVBlankCallback(NULL);
        REG_DISPCNT = 0;
        gPokemonStorageSystemPtr->unk_0005 = gUnknown_0203847D;
        sub_8096804();
        if (gUnknown_0203847F == 1)
            sub_809BBC0();
        if (gUnknown_0203847F == 0)
            sub_809BD14();
        gMain.state++;
        break;
    case 1:
        Text_LoadWindowTemplate(&gWindowTemplate_81E6D00);
        gMain.state++;
        break;
    case 2:
        InitMenuWindow(&gWindowTemplate_81E6D00);
        Menu_EraseScreen();
        gMain.state++;
        break;
    case 3:
        sub_80967DC();
        gMain.state++;
        break;
    case 4:
        ResetPSSMonIconSprites();
        sub_809AA98();
        gMain.state++;
        break;
    case 5:
        sub_8097DE0();
        gMain.state++;
        break;
    case 6:
        sub_8097E70();
        gMain.state++;
        break;
    case 7:
        sub_8098400();
        gMain.state++;
        break;
    case 8:
        sub_8099BF8(gPokemonStorage.currentBox);
        gPokemonStorageSystemPtr->unk_12bc.baseTileTag = 0x000a;
        gPokemonStorageSystemPtr->unk_12bc.basePaletteTag = 0xdacb;
        sub_80F727C(&gPokemonStorageSystemPtr->unk_12bc);
        sub_80F7404();
        gMain.state++;
        break;
    case 9:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
        SetVBlankCallback(sub_8096AFC);
        gMain.state++;
        break;
    case 10:
        sub_8096874();
        SetPSSCallback(sub_8096C68);
        SetMainCallback2(sub_8096B38);
        gMain.state++;
        break;
    }
}

#if DEBUG

void debug_sub_80A4300(void)
{
    gUnknown_0203847D = 0;
    gPokemonStorageSystemPtr->unk_0005 = 0;
    sub_8096884();
    if (gMain.callback2 == sub_8096B38)
        unk_2038790 = 1;
}

extern void (*unk_2038794)(void);
extern struct Pokemon * unk_2038798;

extern void sub_809CB94(struct Pokemon *);

void debug_sub_80A433C(struct Pokemon * a, void (*b)(void))
{
    unk_2038794 = b;
    unk_2038798 = a;
    SetMainCallback2(debug_sub_80A4300);
}

void debug_sub_80A435C(void)
{
    switch (gPokemonStorageSystemPtr->unk_0004)
    {
    case 0:
        sub_809CB94(unk_2038798);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        gPokemonStorageSystemPtr->unk_0004++;
        break;
    case 1:
        if (!UpdatePaletteFade())
            unk_2038794();
        break;
    }
}

#endif

void sub_8096AFC(void)
{
    REG_BG2HOFS = gPokemonStorageSystemPtr->unk_08b4;
    REG_BG3HOFS = gPokemonStorageSystemPtr->unk_000a;
    REG_BG3VOFS = gPokemonStorageSystemPtr->unk_0008;
    LoadOam();
    ProcessSpriteCopyRequests();
    sub_809CFF0();
    TransferPlttBuffer();
}

void sub_8096B38(void)
{
    gPokemonStorageSystemPtr->unk_0000();
    sub_8097E44();
    sub_8098734();
    AnimateSprites();
    BuildOamBuffer();
}

void sub_8096B5C(void)
{
    switch (gPokemonStorageSystemPtr->unk_0006)
    {
    case 0:
        ShowPokemonSummaryScreen(gPokemonStorageSystemPtr->unk_2690.pokemon, gPokemonStorageSystemPtr->unk_268d, gPokemonStorageSystemPtr->unk_268c, sub_80969A0, gPokemonStorageSystemPtr->unk_268e);
        break;
    case 1:
        DoNamingScreen(1, gPokemonStorage.boxNames[gPokemonStorage.currentBox], 0, 0, 0, sub_80969A0);
        break;
    }
}

void SetPSSCallback(void (*func)(void))
{
    gPokemonStorageSystemPtr->unk_0000 = func;
    gPokemonStorageSystemPtr->unk_0004 = 0;
}

void sub_8096BF0(void)
{
    switch (gPokemonStorageSystemPtr->unk_0004)
    {
    case 0:
        BlendPalettes(0xFFFFFFFF, 16, RGB(0, 0, 0));
        gPokemonStorageSystemPtr->unk_0004++;
        break;
    case 1:
        PlaySE(SE_PC_LOGON);
        gPokemonStorageSystemPtr->unk_000c.tileTag = 14;
        gPokemonStorageSystemPtr->unk_000c.paletteTag = 0xdad0;
        gPokemonStorageSystemPtr->unk_000c.unk04 = 0;
        gPokemonStorageSystemPtr->unk_000c.unk06 = 0;
        sub_80C5CD4(&gPokemonStorageSystemPtr->unk_000c);
        BlendPalettes(0xFFFFFFFF, 0, RGB(0, 0, 0));
        gPokemonStorageSystemPtr->unk_0004++;
        break;
    case 2:
        if (sub_80C5DCC())
            SetPSSCallback(sub_8096C84);
        break;
    }
}

void sub_8096C68(void)
{
    if (!UpdatePaletteFade())
        SetPSSCallback(sub_8096C84);
}

void sub_8096C84(void)
{
    switch (gPokemonStorageSystemPtr->unk_0004)
    {
    case 0:
        switch (sub_809CA40())
        {
        case 1:
            PlaySE(SE_SELECT);
            gPokemonStorageSystemPtr->unk_0004 = 1;
            break;
        case 5:
            if (gPokemonStorageSystemPtr->unk_0005 != 2)
            {
                PrintStorageActionText(PC_TEXT_WHICH_ONE_WILL_TAKE);
                gPokemonStorageSystemPtr->unk_0004 = 3;
            }
            else
            {
                sub_809B0D4();
                SetPSSCallback(sub_8096FC8);
            }
            break;
        case 6:
            if (gPokemonStorageSystemPtr->unk_0005 == 2)
            {
                if (sub_809BF20() && ItemIsMail(gPokemonStorageSystemPtr->unk_11f2))
                    gPokemonStorageSystemPtr->unk_0004 = 5;
                else
                    SetPSSCallback(sub_8097004);
            }
            break;
        case 4:
#if DEBUG
            if (unk_2038790 != 0)
                break;
#endif
            SetPSSCallback(sub_8097BA0);
            break;
        case 16:
#if DEBUG
            if (unk_2038790 != 0)
                break;
#endif
            SetPSSCallback(sub_8097CC0);
            break;
        case 7:
            PlaySE(SE_SELECT);
            SetPSSCallback(sub_809789C);
            break;
        case 8:
            PlaySE(SE_SELECT);
            SetPSSCallback(sub_8097078);
            break;
        case 9:
            PlaySE(SE_SELECT);
            gPokemonStorageSystemPtr->unk_08b2 = gPokemonStorage.currentBox + 1;
            if (gPokemonStorageSystemPtr->unk_08b2 > 13)
                gPokemonStorageSystemPtr->unk_08b2 = 0;
            sub_8099C70(gPokemonStorageSystemPtr->unk_08b2);
            gPokemonStorageSystemPtr->unk_0004 = 2;
            break;
        case 10:
            PlaySE(SE_SELECT);
            gPokemonStorageSystemPtr->unk_08b2 = gPokemonStorage.currentBox - 1;
            if (gPokemonStorageSystemPtr->unk_08b2 < 0)
                gPokemonStorageSystemPtr->unk_08b2 = 13;
            sub_8099C70(gPokemonStorageSystemPtr->unk_08b2);
            gPokemonStorageSystemPtr->unk_0004 = 2;
            break;
        case 11:
            if (!sub_809BE80())
            {
                if (ItemIsMail(gPokemonStorageSystemPtr->unk_11f2))
                {
                    gPokemonStorageSystemPtr->unk_0004 = 5;
                }
                else
                {
                    PlaySE(SE_SELECT);
                    SetPSSCallback(sub_809746C);
                }
            }
            else
            {
                gPokemonStorageSystemPtr->unk_0004 = 4;
            }
            break;
        case 13:
            if (sub_809BE80())
            {
                gPokemonStorageSystemPtr->unk_0004 = 4;
            }
            else
            {
                PlaySE(SE_SELECT);
                SetPSSCallback(sub_80972A8);
            }
            break;
        case 14:
            if (!sub_809BEBC())
            {
                gPokemonStorageSystemPtr->unk_0004 = 4;
            }
            else
            {
                PlaySE(SE_SELECT);
                SetPSSCallback(c3_0808DC50);
            }
            break;
        case 12:
            PlaySE(SE_SELECT);
            SetPSSCallback(sub_8097390);
            break;
        case 15:
            PlaySE(SE_SELECT);
            SetPSSCallback(sub_80972FC);
            break;
        }
        break;
    case 1:
        if (!sub_809AC00())
        {
            if (sub_809BF48())
                sub_80986E8();
            else
                sub_8098710();
            if (gPokemonStorageSystemPtr->unk_11f6)
                BoxSetMosaic();
            gPokemonStorageSystemPtr->unk_0004 = 0;
        }
        break;
    case 2:
        if (!sub_8099D34())
        {
            gPokemonStorage.currentBox = gPokemonStorageSystemPtr->unk_08b2;
            if (!gUnknown_0203847C && !sub_809BF20())
            {
                sub_809B440();
                BoxSetMosaic();
            }
            gPokemonStorageSystemPtr->unk_0004 = 0;
        }
        break;
    case 3:
        if (gMain.newKeys & (A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            sub_8098A5C();
            gPokemonStorageSystemPtr->unk_0004 = 0;
        }
        break;
    case 4:
        PlaySE(SE_HAZURE);
        PrintStorageActionText(PC_TEXT_LAST_POKE);
        gPokemonStorageSystemPtr->unk_0004 = 6;
        break;
    case 5:
        PlaySE(SE_HAZURE);
        PrintStorageActionText(PC_TEXT_PLEASE_REMOVE_MAIL);
        gPokemonStorageSystemPtr->unk_0004 = 6;
        break;
    case 6:
        if (gMain.newKeys & (A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            sub_8098A5C();
            SetPSSCallback(sub_8096C84);
        }
        break;
    }
}

void sub_8096FC8(void)
{
    switch (gPokemonStorageSystemPtr->unk_0004)
    {
        case 0:
            sub_809880C();
            gPokemonStorageSystemPtr->unk_0004++;
            break;
        case 1:
            if (!sub_8098830())
                SetPSSCallback(sub_8096C84);
            break;
    }
}

void sub_8097004(void)
{
    switch (gPokemonStorageSystemPtr->unk_0004)
    {
        case 0:
            PlaySE(SE_SELECT);
            add_to_c3_somehow();
            gPokemonStorageSystemPtr->unk_0004++;
            break;
        case 1:
            if (!sub_80985CC())
            {
                sub_809B0C0(sub_809B0F4());
                gPokemonStorageSystemPtr->unk_0004++;
            }
            break;
        case 2:
            if (!sub_809AC00())
            {
                if (gPokemonStorageSystemPtr->unk_11f6)
                    BoxSetMosaic();
                SetPSSCallback(sub_8096C84);
            }
            break;
    }
}

void sub_8097078(void)
{
    switch (gPokemonStorageSystemPtr->unk_0004)
    {
    case 0:
        PrintStorageActionText(PC_TEXT_IS_SELECTED);
        sub_809CE84();
        gPokemonStorageSystemPtr->unk_0004 = 1;
        break;
    case 1:
        switch (sub_809CF30())
        {
        case -1:
        case  0:
            sub_8098A5C();
            SetPSSCallback(sub_8096C84);
            break;
        case 3:
            if (sub_809BE80())
            {
                gPokemonStorageSystemPtr->unk_0004 = 2;
            }
            else
            {
                PlaySE(SE_SELECT);
                sub_8098A5C();
                SetPSSCallback(sub_80972A8);
            }
            break;
        case 5:
            PlaySE(SE_SELECT);
            sub_8098A5C();
            SetPSSCallback(sub_80972FC);
            break;
        case 4:
            if (!sub_809BEBC())
            {
                gPokemonStorageSystemPtr->unk_0004 = 2;
            }
            else
            {
                PlaySE(SE_SELECT);
                sub_8098A5C();
                SetPSSCallback(c3_0808DC50);
            }
            break;
        case 2:
            PlaySE(SE_SELECT);
            sub_8098A5C();
            SetPSSCallback(sub_8097390);
            break;
        case 1:
            if (sub_809BE80())
            {
                gPokemonStorageSystemPtr->unk_0004 = 2;
            }
            else if (ItemIsMail(gPokemonStorageSystemPtr->unk_11f2))
            {
                gPokemonStorageSystemPtr->unk_0004 = 3;
            }
            else
            {
                PlaySE(SE_SELECT);
                sub_8098A5C();
                SetPSSCallback(sub_809746C);
            }
            break;
        case 7:
            if (sub_809BE80())
            {
                gPokemonStorageSystemPtr->unk_0004 = 2;
            }
            else if (gPokemonStorageSystemPtr->unk_11f9)
            {
                gPokemonStorageSystemPtr->unk_0004 = 4;
            }
            else if (ItemIsMail(gPokemonStorageSystemPtr->unk_11f2))
            {
                gPokemonStorageSystemPtr->unk_0004 = 3;
            }
            else
            {
                PlaySE(SE_SELECT);
                SetPSSCallback(sub_8097594);
            }
            break;
        case 6:
            PlaySE(SE_SELECT);
            SetPSSCallback(sub_8097788);
            break;
        case 8:
            PlaySE(SE_SELECT);
            SetPSSCallback(sub_80977E4);
            break;
#if DEBUG
        case 32:
            PlaySE(SE_SELECT);
            sub_8098A5C();
            SetPSSCallback(debug_sub_80A435C);
            break;
#endif
        }
        break;
    case 2:
        PlaySE(SE_HAZURE);
        PrintStorageActionText(PC_TEXT_LAST_POKE);
        gPokemonStorageSystemPtr->unk_0004 = 5;
        break;
    case 4:
        PlaySE(SE_HAZURE);
        PrintStorageActionText(PC_TEXT_CANT_RELEASE_EGG);
        gPokemonStorageSystemPtr->unk_0004 = 5;
        break;
    case 3:
        PlaySE(SE_HAZURE);
        PrintStorageActionText(PC_TEXT_PLEASE_REMOVE_MAIL);
        gPokemonStorageSystemPtr->unk_0004 = 5;
        break;
    case 5:
        if (gMain.newKeys & (A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            sub_8098A5C();
            SetPSSCallback(sub_8096C84);
        }
        break;
    }
}

void sub_80972A8(void)
{
    switch (gPokemonStorageSystemPtr->unk_0004)
    {
    case 0:
        sub_809B100(0);
        gPokemonStorageSystemPtr->unk_0004++;
        break;
    case 1:
        if (!sub_809B130())
        {
            if (gUnknown_0203847C)
                SetPSSCallback(sub_8097858);
            else
                SetPSSCallback(sub_8096C84);
        }
        break;
    }
}

void sub_80972FC(void)
{
    switch (gPokemonStorageSystemPtr->unk_0004)
    {
    case 0:
        sub_809B100(1);
        gPokemonStorageSystemPtr->unk_0004++;
        break;
    case 1:
        if (!sub_809B130())
        {
            if (gUnknown_0203847C)
                SetPSSCallback(sub_8097858);
            else
                SetPSSCallback(sub_8096C84);
        }
        break;
    }
}

void c3_0808DC50(void)
{
    switch (gPokemonStorageSystemPtr->unk_0004)
    {
    case 0:
        sub_809B100(2);
        gPokemonStorageSystemPtr->unk_0004++;
        break;
    case 1:
        if (!sub_809B130())
        {
            BoxSetMosaic();
            SetPSSCallback(sub_8096C84);
        }
        break;
    }
}

void sub_8097390(void)
{
    switch (gPokemonStorageSystemPtr->unk_0004)
    {
    case 0:
        if (CalculatePlayerPartyCount() == 6)
        {
            PrintStorageActionText(PC_TEXT_PARTY_FULL);
            gPokemonStorageSystemPtr->unk_0004 = 1;
        }
        else
        {
            sub_809B0E0();
            sub_809B100(0);
            gPokemonStorageSystemPtr->unk_0004 = 2;
        }
        break;
    case 1:
        if (gMain.newKeys & (A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            sub_8098A5C();
            SetPSSCallback(sub_8096C84);
        }
        break;
    case 2:
        if (!sub_809B130())
        {
            sub_809880C();
            gPokemonStorageSystemPtr->unk_0004++;
        }
        break;
    case 3:
        if (!sub_8098830())
        {
            sub_809B100(1);
            gPokemonStorageSystemPtr->unk_0004++;
        }
        break;
    case 4:
        if (!sub_809B130())
        {
            sub_80987DC();
            gPokemonStorageSystemPtr->unk_0004++;
        }
        break;
    case 5:
        SetPSSCallback(sub_8097004);
        break;
    }
}

void sub_809746C(void)
{
    u8 r4;

    switch (gPokemonStorageSystemPtr->unk_0004)
    {
    case 0:
        PrintStorageActionText(PC_TEXT_DEPOSIT_IN_WHICH_BOX);
        sub_8096264(&gPokemonStorageSystemPtr->unk_2370, 0x0007, 0xdaca, 3);
        sub_809634C(gUnknown_0203847E);
        gPokemonStorageSystemPtr->unk_0004++;
        break;
    case 1:
        r4 = sub_8096368();
        if (r4 == 200);
        else if (r4 == 201)
        {
            sub_8098A5C();
            sub_809635C();
            sub_8096310();
            SetPSSCallback(sub_8096C84);
        }
        else
        {
            if (sub_809B62C(r4))
            {
                sub_8098A5C();
                sub_809635C();
                sub_8096310();
                gPokemonStorageSystemPtr->unk_0004 = 2;
            }
            else
            {
                PrintStorageActionText(PC_TEXT_BOX_IS_FULL);
                gPokemonStorageSystemPtr->unk_0004 = 4;
            }
            gUnknown_0203847E = r4;
        }
        break;
    case 2:
        party_compaction();
        sub_8099310();
        gPokemonStorageSystemPtr->unk_0004++;
        break;
    case 3:
        if (sub_8099374() == 0)
        {
            sub_809B6BC();
            BoxSetMosaic();
            sub_80987DC();
            SetPSSCallback(sub_8096C84);
        }
        break;
    case 4:
        if (gMain.newKeys & (A_BUTTON | B_BUTTON))
        {
            PrintStorageActionText(PC_TEXT_DEPOSIT_IN_WHICH_BOX);
            gPokemonStorageSystemPtr->unk_0004 = 1;
        }
        break;
    }
}

void sub_8097594(void)
{
    switch (gPokemonStorageSystemPtr->unk_0004)
    {
    case 0:
        PrintStorageActionText(PC_TEXT_RELEASE_POKE);
        sub_8098A38(1);
        gPokemonStorageSystemPtr->unk_0004++;
        // fallthrough
    case 1:
        switch (Menu_ProcessInputNoWrap())
        {
            case -1:
            case  1:
                sub_8098A5C();
                SetPSSCallback(sub_8096C84);
                break;
            case  0:
                sub_8098A5C();
                sub_809B7D4();
                sub_809B6DC();
                gPokemonStorageSystemPtr->unk_0004++;
                break;
        }
        break;
    case 2:
        sub_809B960();
        if (!sub_809B734())
        {
            while (1)
            {
                s8 r0 = sub_809B960();
                if (r0 == 1)
                {
                    gPokemonStorageSystemPtr->unk_0004++;
                    break;
                }
                if (r0 == 0)
                {
                    gPokemonStorageSystemPtr->unk_0004 = 8;
                    break;
                }
            }
        }
        break;
    case 3:
        sub_809B760();
        sub_809801C();
        PrintStorageActionText(PC_TEXT_WAS_RELEASED);
        gPokemonStorageSystemPtr->unk_0004++;
        break;
    case 4:
        if (gMain.newKeys & (A_BUTTON | B_BUTTON))
        {
            PrintStorageActionText(PC_TEXT_BYE_BYE);
            gPokemonStorageSystemPtr->unk_0004++;
        }
        break;
    case 5:
        if (gMain.newKeys & (A_BUTTON | B_BUTTON))
        {
            sub_8098A5C();
            if (gUnknown_0203847C)
            {
                party_compaction();
                sub_8099310();
                gPokemonStorageSystemPtr->unk_0004++;
            }
            else
            {
                gPokemonStorageSystemPtr->unk_0004 = 7;
            }
        }
        break;
    case 6:
        if (sub_8099374() == 0)
        {
            sub_809B440();
            BoxSetMosaic();
            sub_80987DC();
            gPokemonStorageSystemPtr->unk_0004++;
        }
        break;
    case 7:
        SetPSSCallback(sub_8096C84);
        break;
    case 8:
        PrintStorageActionText(PC_TEXT_WAS_RELEASED);
        gPokemonStorageSystemPtr->unk_0004++;
        break;
    case 9:
        if (gMain.newKeys & (A_BUTTON | B_BUTTON))
        {
            PrintStorageActionText(PC_TEXT_SURPRISE);
            gPokemonStorageSystemPtr->unk_0004++;
        }
        break;
    case 10:
        if (gMain.newKeys & (A_BUTTON | B_BUTTON))
        {
            sub_8098A5C();
            sub_8099958();
            gPokemonStorageSystemPtr->unk_0004++;
        }
        break;
    case 11:
        if (!sub_8099990())
        {
            sub_809B7AC();
            PrintStorageActionText(PC_TEXT_CAME_BACK);
            gPokemonStorageSystemPtr->unk_0004++;
        }
        break;
    case 12:
        if (gMain.newKeys & (A_BUTTON | B_BUTTON))
        {
            PrintStorageActionText(PC_TEXT_WORRIED);
            gPokemonStorageSystemPtr->unk_0004++;
        }
        break;
    case 13:
        if (gMain.newKeys & (A_BUTTON | B_BUTTON))
        {
            sub_8098A5C();
            SetPSSCallback(sub_8096C84);
        }
        break;
    }
}

void sub_8097788(void)
{
    switch (gPokemonStorageSystemPtr->unk_0004)
    {
    case 0:
        sub_809BC18();
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        gPokemonStorageSystemPtr->unk_0004++;
        break;
    case 1:
        if (!UpdatePaletteFade())
        {
            gUnknown_0203847F = 0;
            gPokemonStorageSystemPtr->unk_0006 = 0;
            SetMainCallback2(sub_8096B5C);
        }
        break;
    }
}

void sub_80977E4(void)
{
    switch (gPokemonStorageSystemPtr->unk_0004)
    {
    case 0:
        PrintStorageActionText(PC_TEXT_MARK_POKE);
        gPokemonStorageSystemPtr->unk_12bc.markings = gPokemonStorageSystemPtr->unk_11f7;
        sub_80F7418(gPokemonStorageSystemPtr->unk_11f7, 0xb0, 0x10);
        gPokemonStorageSystemPtr->unk_0004++;
        break;
    case 1:
        if (!sub_80F7500())
        {
            sub_80F7470();
            sub_8098A5C();
            sub_809BDD8(gPokemonStorageSystemPtr->unk_12bc.markings);
            sub_809801C();
            SetPSSCallback(sub_8096C84);
        }
        break;
    }
}

void sub_8097858(void)
{
    switch (gPokemonStorageSystemPtr->unk_0004)
    {
    case 0:
        party_compaction();
        sub_8099310();
        gPokemonStorageSystemPtr->unk_0004++;
        break;
    case 1:
        if (sub_8099374() == 0)
        {
            sub_80987DC();
            SetPSSCallback(sub_8096C84);
        }
        break;
    }
}

void sub_809789C(void)
{
    switch (gPokemonStorageSystemPtr->unk_0004)
    {
    case 0:
        PrintStorageActionText(PC_TEXT_WHAT_YOU_DO);
        sub_809CE84();
        gPokemonStorageSystemPtr->unk_0004++;
        break;
    case 1:
        switch (sub_809CF30())
        {
        case -1:
        case  0:
            sub_809A860(TRUE);
            sub_8098A5C();
            SetPSSCallback(sub_8096C84);
            break;
        case 11:
            PlaySE(SE_SELECT);
            SetPSSCallback(sub_8097B44);
            break;
        case 10:
            PlaySE(SE_SELECT);
            sub_8098A5C();
            SetPSSCallback(sub_8097974);
            break;
        case 9:
            PlaySE(SE_SELECT);
            sub_8098A5C();
            SetPSSCallback(sub_8097A64);
            break;
        }
        break;
    }
}

void sub_8097974(void)
{
    switch (gPokemonStorageSystemPtr->unk_0004)
    {
    case 0:
        sub_8098A80();
        PrintStorageActionText(PC_TEXT_PICK_A_THEME);
        gPokemonStorageSystemPtr->unk_0004++;
        break;
    case 1:
        gPokemonStorageSystemPtr->unk_0d5e = sub_809CF30();
        switch (gPokemonStorageSystemPtr->unk_0d5e)
        {
        case -1:
            sub_809A860(TRUE);
            sub_8098A5C();
            SetPSSCallback(sub_8096C84);
            break;
        case 12 ... 15:
            PlaySE(SE_SELECT);
            gPokemonStorageSystemPtr->unk_0d5e -= 12;
            sub_8098AA8(gPokemonStorageSystemPtr->unk_0d5e);
            PrintStorageActionText(PC_TEXT_PICK_A_WALLPAPER);
            gPokemonStorageSystemPtr->unk_0004++;
            break;
        }
        break;
    case 2:
        gPokemonStorageSystemPtr->unk_0d60 = sub_809CF30();
        switch (gPokemonStorageSystemPtr->unk_0d60)
        {
        case -1:
            sub_8098A5C();
            gPokemonStorageSystemPtr->unk_0004 = 0;
            break;
        case -2:
            break;
        default:
            PlaySE(SE_SELECT);
            sub_8098A5C();
            gPokemonStorageSystemPtr->unk_0d60 -= 16;
            sub_8099DCC(gPokemonStorageSystemPtr->unk_0d60);
            gPokemonStorageSystemPtr->unk_0004++;
            break;
        }
        break;
    case 3:
        if (!sub_8099E08())
        {
            sub_809A860(TRUE);
            SetPSSCallback(sub_8096C84);
        }
        break;
    }
}

void sub_8097A64(void)
{
    switch (gPokemonStorageSystemPtr->unk_0004)
    {
    case 0:
        PrintStorageActionText(PC_TEXT_JUMP_TO_WHICH_BOX);
        sub_8096264(&gPokemonStorageSystemPtr->unk_2370, 0x0007, 0xdaca, 3);
        sub_809634C(gPokemonStorage.currentBox);
        gPokemonStorageSystemPtr->unk_0004++;
        break;
    case 1:
        gPokemonStorageSystemPtr->unk_08b2 = sub_8096368();
        switch (gPokemonStorageSystemPtr->unk_08b2)
        {
        case 200:
            break;
        default:
            sub_8098A5C();
            sub_809635C();
            sub_8096310();
            if (gPokemonStorageSystemPtr->unk_08b2 == 201 || gPokemonStorageSystemPtr->unk_08b2 == gPokemonStorage.currentBox)
            {
                sub_809A860(TRUE);
                SetPSSCallback(sub_8096C84);
            }
            else
            {
                gPokemonStorageSystemPtr->unk_0004++;
            }
            break;
        }
        break;
    case 2:
        sub_8099C70(gPokemonStorageSystemPtr->unk_08b2);
        gPokemonStorageSystemPtr->unk_0004++;
        break;
    case 3:
        if (!sub_8099D34())
        {
            gPokemonStorage.currentBox = gPokemonStorageSystemPtr->unk_08b2;
            SetPSSCallback(sub_8096C84);
        }
        break;
    }
}

void sub_8097B44(void)
{
    switch (gPokemonStorageSystemPtr->unk_0004)
    {
    case 0:
        sub_809BB90();
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        gPokemonStorageSystemPtr->unk_0004++;
        break;
    case 1:
        if (!UpdatePaletteFade())
        {
            gUnknown_0203847F = 1;
            gPokemonStorageSystemPtr->unk_0006 = 1;
            SetMainCallback2(sub_8096B5C);
        }
        break;
    }
}

void sub_8097BA0(void)
{
    switch (gPokemonStorageSystemPtr->unk_0004)
    {
    case 0:
        if (sub_809BF20())
        {
            PlaySE(SE_HAZURE);
            PrintStorageActionText(PC_TEXT_HOLDING_POKE);
            gPokemonStorageSystemPtr->unk_0004 = 1;
        }
        else
        {
            PlaySE(SE_SELECT);
            PrintStorageActionText(PC_TEXT_EXIT_BOX);
            sub_8098A38(0);
            gPokemonStorageSystemPtr->unk_0004 = 2;
        }
        break;
    case 1:
        if (gMain.newKeys & (A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            sub_8098A5C();
            SetPSSCallback(sub_8096C84);
        }
        break;
    case 2:
        switch (Menu_ProcessInputNoWrap())
        {
        case 1:
        case -1:
            sub_8098A5C();
            SetPSSCallback(sub_8096C84);
            break;
        case 0:
            PlaySE(SE_PC_OFF);
            sub_8098A5C();
            gPokemonStorageSystemPtr->unk_0004++;
            break;
        }
        break;
    case 3:
        gPokemonStorageSystemPtr->unk_000c.tileTag = 0x000e;
        gPokemonStorageSystemPtr->unk_000c.paletteTag = 0xdad0;
        gPokemonStorageSystemPtr->unk_000c.unk04 = 20;
        gPokemonStorageSystemPtr->unk_000c.unk06 = 0;
        sub_80C5E38(&gPokemonStorageSystemPtr->unk_000c);
        gPokemonStorageSystemPtr->unk_0004++;
        break;
    case 4:
        if (sub_80C5F98())
        {
            gPlayerPartyCount = CalculatePlayerPartyCount();
            SetMainCallback2(sub_80961A8);
        }
        break;
    }
}

void sub_8097CC0(void)
{
    switch (gPokemonStorageSystemPtr->unk_0004)
    {
    case 0:
        if (sub_809BF20())
        {
            PlaySE(SE_HAZURE);
            PrintStorageActionText(PC_TEXT_HOLDING_POKE);
            gPokemonStorageSystemPtr->unk_0004 = 1;
        }
        else
        {
            PlaySE(SE_SELECT);
            PrintStorageActionText(PC_TEXT_CONTINUE_BOX);
            sub_8098A38(0);
            gPokemonStorageSystemPtr->unk_0004 = 2;
        }
        break;
    case 1:
        if (gMain.newKeys & (A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            sub_8098A5C();
            SetPSSCallback(sub_8096C84);
        }
        break;
    case 2:
        switch (Menu_ProcessInputNoWrap())
        {
        case 0:
            sub_8098A5C();
            SetPSSCallback(sub_8096C84);
            break;
        case -1:
        case 1:
            PlaySE(SE_PC_OFF);
            sub_8098A5C();
            gPokemonStorageSystemPtr->unk_0004++;
            break;
        }
        break;
    case 3:
        gPokemonStorageSystemPtr->unk_000c.tileTag = 0x000e;
        gPokemonStorageSystemPtr->unk_000c.paletteTag = 0xdad0;
        gPokemonStorageSystemPtr->unk_000c.unk04 = 20;
        gPokemonStorageSystemPtr->unk_000c.unk06 = 0;
        sub_80C5E38(&gPokemonStorageSystemPtr->unk_000c);
        gPokemonStorageSystemPtr->unk_0004++;
        break;
    case 4:
        if (sub_80C5F98())
        {
            gPlayerPartyCount = CalculatePlayerPartyCount();
            SetMainCallback2(sub_80961A8);
        }
        break;
    }
}

void sub_8097DE0(void)
{
    gPokemonStorageSystemPtr->unk_0007 = 0;
    gPokemonStorageSystemPtr->unk_0008 = 0;
    gPokemonStorageSystemPtr->unk_000a = 0;
    REG_BG3CNT = BGCNT_PRIORITY(3) | BGCNT_CHARBASE(3) | BGCNT_SCREENBASE(30);
    DmaCopy16Defvars(3, gPokemonStorageScrollingBGTile, BG_SCREEN_ADDR(28), sizeof gPokemonStorageScrollingBGTile);
    LZ77UnCompVram(gPokemonStorageScrollingBGTilemap, BG_SCREEN_ADDR(30));
    LoadPalette(gPokemonStorageScrollingBGPalette, 0xd0, 0x10);
}

void sub_8097E44(void)
{
    if (++gPokemonStorageSystemPtr->unk_0007 >= 2)
    {
        gPokemonStorageSystemPtr->unk_0007 = 0;
        gPokemonStorageSystemPtr->unk_0008--;
        gPokemonStorageSystemPtr->unk_000a++;
    }
}

void sub_8097E70(void)
{
    LZ77UnCompVram(gPSSMenuHeader_Gfx, BG_SCREEN_ADDR(10));
    LZ77UnCompWram(gPSSMenuHeader_Tilemap, gUnknown_02039760);
    sub_809D034(BG_SCREEN_ADDR(15), 0, 0, gUnknown_02039760, 0, 0, 10, 20);
    LoadPalette(gPSSMenu1_Pal, 0x10, 0x20);
    LoadPalette(gPSSMenu2_Pal, 0x00, 0x20);
    LoadPalette(gUnknown_083B6D74, 0xB0, 0x20);
    LoadPalette(gUnknown_083B6D94, 0xC0, 0x20);
    LoadPalette(gUnknownPalette_81E6692 +  1, 0xF1, 0x02);
    LoadPalette(gUnknownPalette_81E6692 +  1, 0xF2, 0x02);
    LoadPalette(gUnknownPalette_81E6692 +  5, 0xF3, 0x02);
    LoadPalette(gUnknownPalette_81E6692 + 12, 0xF4, 0x04);
    LoadPalette(gUnknownPalette_81E6692 + 10, 0xF6, 0x04);
    LoadPalette(gUnknownPalette_81E6692 +  2, 0xFF, 0x02);
    LoadSpritePalette(&gWaveformSpritePalette);
    sub_80980D4();
    sub_8097F58();
    sub_8097FB8();
    sub_809801C();
}

void sub_8097F58(void)
{
    gPokemonStorageSystemPtr->unk_12ac = sub_80F7940(0x000d, 0xdace, 0);
    gPokemonStorageSystemPtr->unk_12ac->oam.priority = 0;
    gPokemonStorageSystemPtr->unk_12ac->subpriority = 1;
    gPokemonStorageSystemPtr->unk_12ac->pos1.x = 0x28;
    gPokemonStorageSystemPtr->unk_12ac->pos1.y = 0x95;
    gPokemonStorageSystemPtr->unk_12b8 = BG_CHAR_ADDR(4) + 32 * GetSpriteTileStartByTag(0x000d);
}

const struct SpriteTemplate gSpriteTemplate_83B6EFC;

void sub_8097FB8(void)
{
    u16 i;
    struct SpriteSheet sheet = {WaveformTiles, 0x1c0, 0x0005};

    LoadSpriteSheet(&sheet);
    for (i = 0; i < 2; i++)
    {
        u8 spriteId = CreateSprite(&gSpriteTemplate_83B6EFC, i * 63 + 8, 9, 2);
        gPokemonStorageSystemPtr->unk_12b0[i] = gSprites + spriteId;
    }
}

void sub_809801C(void)
{
    sub_80981F0(gPokemonStorageSystemPtr->unk_11f0, gPokemonStorageSystemPtr->unk_11ec);
    sub_80982B4();
    sub_8098350();
}

void BoxSetMosaic(void)
{
    sub_809801C();
    if (gPokemonStorageSystemPtr->unk_2700)
    {
        gPokemonStorageSystemPtr->unk_2700->oam.mosaic = TRUE;
        gPokemonStorageSystemPtr->unk_2700->data[0] = 10;
        gPokemonStorageSystemPtr->unk_2700->data[1] = 1;
        gPokemonStorageSystemPtr->unk_2700->callback = sub_8098090;
        REG_MOSAIC = (gPokemonStorageSystemPtr->unk_2700->data[0] << 12) | (gPokemonStorageSystemPtr->unk_2700->data[0] << 8);
    }
}

void sub_8098090(struct Sprite *sprite)
{
    sprite->data[0] -= sprite->data[1];
    if (sprite->data[0] < 0)
        sprite->data[0] = 0;
    REG_MOSAIC = (sprite->data[0] << 12) | (sprite->data[0] << 8);
    if (sprite->data[0] == 0)
    {
        sprite->oam.mosaic = FALSE;
        sprite->callback = SpriteCallbackDummy;
    }
}

// sub_80980D4

const struct OamData gOamData_83B6EAC;

#ifdef NONMATCHING
void sub_80980D4(void)
{
    u16 i;
    u16 tileStart;
    u8 palSlot;
    u8 spriteId;
    struct SpriteSheet sheet = {gPokemonStorageSystemPtr->unk_2784, 0x800, 0x0002};
    struct SpritePalette palette = {gPokemonStorageSystemPtr->unk_2704, 0xdac7};
    struct SpriteTemplate template = {
        0x0002, 0xdac7, &gOamData_83B6EAC, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
    };

    for (i = 0; i < 0x800; i++)
        gPokemonStorageSystemPtr->unk_2784[i] = 0;
    for (i = 0; i < 0x10; i++)
        gPokemonStorageSystemPtr->unk_2704[i] = 0;

    gPokemonStorageSystemPtr->unk_2700 = NULL;
    if ((tileStart = LoadSpriteSheet(&sheet)) != 0
        && (palSlot = LoadSpritePalette(&palette)) != 0xff
        && (spriteId = CreateSprite(&template, 0x28, 0x30, 0)) != MAX_SPRITES)
    {
        // FIXME this gets compiled as a separate block between the palSlot check and the spriteId check
        gPokemonStorageSystemPtr->unk_2700 = gSprites + spriteId;
        gPokemonStorageSystemPtr->unk_26fa = palSlot * 16 + 0x100;
        gPokemonStorageSystemPtr->unk_26fc = BG_CHAR_ADDR(4) + tileStart * 32;
    }

    if (gPokemonStorageSystemPtr->unk_2700 == NULL)
    {
        FreeSpriteTilesByTag(0x0002);
        FreeSpritePaletteByTag(0xdac7);
    }
}
#else

const struct SpriteSheet gUnknown_083B6DCC = {ePokemonStorageSystem.unk_2784, 0x800, 0x0002};
const struct SpritePalette gUnknown_083B6DD4 = {ePokemonStorageSystem.unk_2704, 0xdac7};
const struct SpriteTemplate gSpriteTemplate_83B6DDC = {
    0x0002, 0xdac7, &gOamData_83B6EAC, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

NAKED void sub_80980D4(void)
{
    asm_unified("\tpush {r4,r5,lr}\n"
                    "\tsub sp, 0x28\n"
                    "\tldr r0, _08098150 @ =gUnknown_083B6DCC\n"
                    "\tldr r1, [r0, 0x4]\n"
                    "\tldr r0, [r0]\n"
                    "\tstr r0, [sp, 0x18]\n"
                    "\tstr r1, [sp, 0x1C]\n"
                    "\tldr r0, _08098154 @ =gUnknown_083B6DD4\n"
                    "\tldr r1, [r0, 0x4]\n"
                    "\tldr r0, [r0]\n"
                    "\tstr r0, [sp, 0x20]\n"
                    "\tstr r1, [sp, 0x24]\n"
                    "\tmov r1, sp\n"
                    "\tldr r0, _08098158 @ =gSpriteTemplate_83B6DDC\n"
                    "\tldm r0!, {r2-r4}\n"
                    "\tstm r1!, {r2-r4}\n"
                    "\tldm r0!, {r2-r4}\n"
                    "\tstm r1!, {r2-r4}\n"
                    "\tmovs r1, 0\n"
                    "\tadd r5, sp, 0x18\n"
                    "\tldr r4, _0809815C @ =gSharedMem + 0x2784\n"
                    "\tmovs r3, 0\n"
                    "\tldr r2, _08098160 @ =0x000007ff\n"
                    "_08098102:\n"
                    "\tadds r0, r1, r4\n"
                    "\tstrb r3, [r0]\n"
                    "\tadds r0, r1, 0x1\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r1, r0, 16\n"
                    "\tcmp r1, r2\n"
                    "\tbls _08098102\n"
                    "\tmovs r1, 0\n"
                    "\tldr r3, _08098164 @ =gSharedMem + 0x2704\n"
                    "\tmovs r2, 0\n"
                    "_08098116:\n"
                    "\tlsls r0, r1, 1\n"
                    "\tadds r0, r3\n"
                    "\tstrh r2, [r0]\n"
                    "\tadds r0, r1, 0x1\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r1, r0, 16\n"
                    "\tcmp r1, 0xF\n"
                    "\tbls _08098116\n"
                    "\tldr r0, _08098168 @ =gSharedMem\n"
                    "\tmovs r1, 0x9C\n"
                    "\tlsls r1, 6\n"
                    "\tadds r0, r1\n"
                    "\tmovs r1, 0\n"
                    "\tstr r1, [r0]\n"
                    "\tadds r0, r5, 0\n"
                    "\tbl LoadSpriteSheet\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r5, r0, 16\n"
                    "\tcmp r5, 0\n"
                    "\tbeq _080981C4\n"
                    "\tadd r0, sp, 0x20\n"
                    "\tbl LoadSpritePalette\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r4, r0, 24\n"
                    "\tcmp r4, 0xFF\n"
                    "\tbeq _080981C4\n"
                    "\tb _080981B0\n"
                    "\t.align 2, 0\n"
                    "_08098150: .4byte gUnknown_083B6DCC\n"
                    "_08098154: .4byte gUnknown_083B6DD4\n"
                    "_08098158: .4byte gSpriteTemplate_83B6DDC\n"
                    "_0809815C: .4byte gSharedMem + 0x2784\n"
                    "_08098160: .4byte 0x000007ff\n"
                    "_08098164: .4byte gSharedMem + 0x2704\n"
                    "_08098168: .4byte gSharedMem\n"
                    "_0809816C:\n"
                    "\tldr r2, _0809819C @ =gSharedMem\n"
                    "\tmovs r0, 0x9C\n"
                    "\tlsls r0, 6\n"
                    "\tadds r3, r2, r0\n"
                    "\tlsls r0, r1, 4\n"
                    "\tadds r0, r1\n"
                    "\tlsls r0, 2\n"
                    "\tldr r1, _080981A0 @ =gSprites\n"
                    "\tadds r0, r1\n"
                    "\tstr r0, [r3]\n"
                    "\tlsls r0, r4, 4\n"
                    "\tmovs r1, 0x80\n"
                    "\tlsls r1, 1\n"
                    "\tadds r0, r1\n"
                    "\tldr r3, _080981A4 @ =0x000026fa\n"
                    "\tadds r1, r2, r3\n"
                    "\tstrh r0, [r1]\n"
                    "\tldr r4, _080981A8 @ =0x000026fc\n"
                    "\tadds r2, r4\n"
                    "\tlsls r0, r5, 5\n"
                    "\tldr r1, _080981AC @ =0x06010000\n"
                    "\tadds r0, r1\n"
                    "\tstr r0, [r2]\n"
                    "\tb _080981C4\n"
                    "\t.align 2, 0\n"
                    "_0809819C: .4byte gSharedMem\n"
                    "_080981A0: .4byte gSprites\n"
                    "_080981A4: .4byte 0x000026fa\n"
                    "_080981A8: .4byte 0x000026fc\n"
                    "_080981AC: .4byte 0x06010000\n"
                    "_080981B0:\n"
                    "\tmov r0, sp\n"
                    "\tmovs r1, 0x28\n"
                    "\tmovs r2, 0x30\n"
                    "\tmovs r3, 0\n"
                    "\tbl CreateSprite\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r1, r0, 24\n"
                    "\tcmp r1, 0x40\n"
                    "\tbne _0809816C\n"
                    "_080981C4:\n"
                    "\tldr r0, _080981E8 @ =gSharedMem\n"
                    "\tmovs r2, 0x9C\n"
                    "\tlsls r2, 6\n"
                    "\tadds r0, r2\n"
                    "\tldr r0, [r0]\n"
                    "\tcmp r0, 0\n"
                    "\tbne _080981DE\n"
                    "\tmovs r0, 0x2\n"
                    "\tbl FreeSpriteTilesByTag\n"
                    "\tldr r0, _080981EC @ =0x0000dac7\n"
                    "\tbl FreeSpritePaletteByTag\n"
                    "_080981DE:\n"
                    "\tadd sp, 0x28\n"
                    "\tpop {r4,r5}\n"
                    "\tpop {r0}\n"
                    "\tbx r0\n"
                    "\t.align 2, 0\n"
                    "_080981E8: .4byte gSharedMem\n"
                    "_080981EC: .4byte 0x0000dac7");
}
#endif

void sub_80981F0(u16 species, u32 pid)
{
    if (gPokemonStorageSystemPtr->unk_2700)
    {
        if (species != SPECIES_NONE)
        {
            HandleLoadSpecialPokePic(gMonFrontPicTable + species, gMonFrontPicCoords[species].coords, 1, (intptr_t)gPokemonStorageSystemPtr->unk_4784, gPokemonStorageSystemPtr->unk_2784, species, pid);
            LZ77UnCompWram(gPokemonStorageSystemPtr->unk_11e8, gPokemonStorageSystemPtr->unk_2704);
            CpuCopy32(gPokemonStorageSystemPtr->unk_2784, gPokemonStorageSystemPtr->unk_26fc, 0x800);
            LoadPalette(gPokemonStorageSystemPtr->unk_2704, gPokemonStorageSystemPtr->unk_26fa, 0x20);
            gPokemonStorageSystemPtr->unk_2700->invisible = FALSE;
        }
        else
        {
            gPokemonStorageSystemPtr->unk_2700->invisible = TRUE;
        }
    }
}

void sub_80982B4(void)
{
    if (gPokemonStorageSystemPtr->unk_11f0)
    {
        sub_80F7A10(gPokemonStorageSystemPtr->unk_11f7, gPokemonStorageSystemPtr->unk_12b8);
        gPokemonStorageSystemPtr->unk_12ac->invisible = FALSE;
    }
    else
    {
        gPokemonStorageSystemPtr->unk_12ac->invisible = TRUE;
    }
    Menu_EraseWindowRect(0, 11, 9, 17);
    Menu_PrintText(gPokemonStorageSystemPtr->unk_127a, 1, 16);
    Menu_PrintText(gPokemonStorageSystemPtr->unk_120f, 1, 11);
    Menu_PrintText(gPokemonStorageSystemPtr->unk_1234, 0, 13);
    Menu_PrintText(gPokemonStorageSystemPtr->unk_1259, 1, 15);
}

void sub_8098350(void)
{
    u16 i;

    if (gPokemonStorageSystemPtr->unk_11f0)
    {
        sub_809D034(BG_SCREEN_ADDR(15), 1, 0, gUnknown_02039760, 1, 0, 8, 2);
        for (i = 0; i < 2; i++)
            StartSpriteAnimIfDifferent(gPokemonStorageSystemPtr->unk_12b0[i], i * 2 + 1);
    }
    else
    {
        sub_809D034(BG_SCREEN_ADDR(15), 1, 0, gUnknown_02039760, 10, 0, 8, 2);
        for (i = 0; i < 2; i++)
            StartSpriteAnim(gPokemonStorageSystemPtr->unk_12b0[i], i * 2);
    }
}

void sub_8098400(void)
{
    REG_BG1CNT = BGCNT_PRIORITY(1) | BGCNT_SCREENBASE(15);
    LZ77UnCompVram(gPSSMenuMisc_Gfx, BG_SCREEN_ADDR(13));
    LZ77UnCompWram(gPSSMenuMisc_Tilemap, gPokemonStorageSystemPtr->unk_00a8);
    LoadPalette(gPSSMenu3_Pal, 0x20, 0x20);
    LoadPalette(gPSSMenu4_Pal, 0x30, 0x20);
    DmaClear16(3, BG_SCREEN_ADDR(15), 0x800);
    sub_8098780();
    if (gUnknown_0203847C)
    {
        sub_8098690(TRUE);
        sub_8099200(TRUE);
        sub_809D034(BG_SCREEN_ADDR(15), 10, 0, gPokemonStorageSystemPtr->unk_00a8, 0, 0, 12, 22);
    }
    else
    {
        sub_809D034(BG_SCREEN_ADDR(15), 10, 0, gPokemonStorageSystemPtr->unk_00a8, 0, 20, 12, 2);
        sub_8098690(TRUE);
    }
    gPokemonStorageSystemPtr->unk_08af = 0;
}

void sub_80984E8(void)
{
    gPokemonStorageSystemPtr->unk_08a8 = 20;
    gPokemonStorageSystemPtr->unk_08aa = 2;
    gPokemonStorageSystemPtr->unk_08ad = 0;
    sub_8099200(FALSE);
}

bool8 sub_8098520(void)
{
    if (gPokemonStorageSystemPtr->unk_08ad == 20)
        return FALSE;
    gPokemonStorageSystemPtr->unk_08a8--;
    gPokemonStorageSystemPtr->unk_08aa++;
    sub_809D034(BG_SCREEN_ADDR(15), 10, 0, gPokemonStorageSystemPtr->unk_00a8, 0, gPokemonStorageSystemPtr->unk_08a8, 12, gPokemonStorageSystemPtr->unk_08aa);
    sub_80994A8(8);
    if (++gPokemonStorageSystemPtr->unk_08ad == 20)
    {
        gUnknown_0203847C = 1;
        return FALSE;
    }
    return TRUE;
}

void add_to_c3_somehow(void)
{
    gPokemonStorageSystemPtr->unk_08a8 = 0;
    gPokemonStorageSystemPtr->unk_08aa = 22;
    gPokemonStorageSystemPtr->unk_08ad = 0;
}

bool8 sub_80985CC(void)
{
    if (gPokemonStorageSystemPtr->unk_08ad == 20)
        return FALSE;
    gPokemonStorageSystemPtr->unk_08a8++;
    gPokemonStorageSystemPtr->unk_08aa--;
    sub_809D034(BG_SCREEN_ADDR(15), 10, 0, gPokemonStorageSystemPtr->unk_00a8, 0, gPokemonStorageSystemPtr->unk_08a8, 12, gPokemonStorageSystemPtr->unk_08aa);
    sub_809D16C(BG_SCREEN_ADDR(15), 10, gPokemonStorageSystemPtr->unk_08aa, 12, 1);
    sub_80994A8(-8);
    if (++gPokemonStorageSystemPtr->unk_08ad == 20)
    {
        gUnknown_0203847C = 0;
        sub_809954C();
        party_compaction();
        sub_809D034(BG_SCREEN_ADDR(15), 21, 0, gPokemonStorageSystemPtr->unk_00a8, 12, 0, 1, 2);
        return FALSE;
    }
    return TRUE;
}

void sub_8098690(bool8 flag)
{
    if (flag)
        sub_809D034(BG_SCREEN_ADDR(15), 21, 0, gPokemonStorageSystemPtr->unk_00a8, 12, 0, 9, 2);
    else
        sub_809D034(BG_SCREEN_ADDR(15), 21, 0, gPokemonStorageSystemPtr->unk_00a8, 12, 2, 9, 2);
}

void sub_80986E8(void)
{
    gPokemonStorageSystemPtr->unk_08af = 1;
    gPokemonStorageSystemPtr->unk_08b0 = 30;
    gPokemonStorageSystemPtr->unk_08b1 = 1;
}

void sub_8098710(void)
{
    if (gPokemonStorageSystemPtr->unk_08af)
    {
        gPokemonStorageSystemPtr->unk_08af = 0;
        sub_8098690(TRUE);
    }
}

void sub_8098734(void)
{
    if (gPokemonStorageSystemPtr->unk_08af && ++gPokemonStorageSystemPtr->unk_08b0 > 30)
    {
        gPokemonStorageSystemPtr->unk_08b0 = 0;
        gPokemonStorageSystemPtr->unk_08b1 = gPokemonStorageSystemPtr->unk_08b1 ? FALSE : TRUE;
        sub_8098690(gPokemonStorageSystemPtr->unk_08b1);
    }
}

void sub_8098780(void)
{
    int i;

    for (i = 1; i < PARTY_SIZE; i++)
    {
        u16 r1;
        bool32 r0 = GetMonData(gPlayerParty + i, MON_DATA_SPECIES);
        if (r0)
            r0 = TRUE;
        r1 = r0 ? 12 : 16;
        sub_809D104(gPokemonStorageSystemPtr->unk_00a8, 7, (i - 1) * 3 + 1, gPokemonStorageSystemPtr->unk_00a8, r1, 4, 4, 3);
    }
}

void sub_80987DC(void)
{
    sub_8098780();
    sub_809D034(BG_SCREEN_ADDR(15), 10, 0, gPokemonStorageSystemPtr->unk_00a8, 0, 0, 12, 22);
}

void sub_809880C(void)
{
    gPokemonStorageSystemPtr->unk_08ae = 0;
    PlaySE(SE_WIN_OPEN);
    sub_80984E8();
}

bool8 sub_8098830(void)
{
    switch (gPokemonStorageSystemPtr->unk_08ae)
    {
    case 0:
        if (!sub_8098520())
        {
            sub_809B068();
            gPokemonStorageSystemPtr->unk_08ae++;
        }
        break;
    case 1:
        if (!sub_809AC00())
        {
            if (gPokemonStorageSystemPtr->unk_11f6)
                BoxSetMosaic();
            gPokemonStorageSystemPtr->unk_08ae++;
        }
        break;
    case 2:
        return FALSE;
    }
    return TRUE;
}

const struct StorageAction gPCStorageActionTexts[] =
{
    {PCText_ExitBox, 0},
    {PCText_WhatYouDo, 0},
    {PCText_PickATheme, 0},
    {PCText_PickAWallpaper, 0},
    {PCText_IsSelected, 1},
    {PCText_JumpToWhichBox, 0},
    {PCText_DepositInWhichBox, 0},
    {PCText_WasDeposited, 1},
    {PCText_BoxIsFull, 0},
    {PCText_ReleasePoke, 0},
    {PCText_WasReleased, 4},
    {PCText_ByeBye, 6},
    {PCText_MarkPoke, 0},
    {PCText_LastPoke, 0},
    {PCText_PartyFull, 0},
    {PCText_HoldingPoke, 0},
    {PCText_WhichOneWillTake, 0},
    {PCText_CantReleaseEgg, 0},
    {PCText_ContinueBox, 0},
    {PCText_CameBack, 1},
    {PCText_Worried, 0},
    {PCText_Surprise, 0},
    {PCText_PleaseRemoveMail, 0}
};

void PrintStorageActionText(u8 index)
{
    u8 *ptr;

    Menu_DrawStdWindowFrame(10, 16, 29, 19);

    switch (gPCStorageActionTexts[index].format)
    {
    case PC_TEXT_FMT_UNK_02:
        ptr = StringCopy(gPokemonStorageSystemPtr->unk_2694, gPCStorageActionTexts[index].text);
        ptr = StringCopy(ptr, gPokemonStorageSystemPtr->unk_11fa);
        break;
    case PC_TEXT_FMT_UNK_05:
        ptr = StringCopy(gPokemonStorageSystemPtr->unk_2694, gPCStorageActionTexts[index].text);
        ptr = StringCopy(ptr, gPokemonStorageSystemPtr->unk_26e4);
        break;
    case PC_TEXT_FMT_MON_NAME:
        // {var} + " is selected."
        ptr = StringCopy(gPokemonStorageSystemPtr->unk_2694, gPokemonStorageSystemPtr->unk_11fa);
        ptr = StringCopy(ptr, gPCStorageActionTexts[index].text);
        break;
    case PC_TEXT_FMT_MON_NAME_2:
        // {var} + " was released."
        ptr = StringCopy(gPokemonStorageSystemPtr->unk_2694, gPokemonStorageSystemPtr->unk_26e4);
#if ENGLISH
        ptr = StringCopy(ptr, gPCStorageActionTexts[index].text);
#elif GERMAN
        ptr = de_sub_8073174(gPokemonStorageSystemPtr->unk_2694, gPCStorageActionTexts[index].text);
#endif
        break;
    case PC_TEXT_FMT_UNK_03:
        {
            const u8 *stringLength;
            const u8 *text;

            text = gPCStorageActionTexts[index].text;
            stringLength = &text[StringLength(text)] + 1;

            ptr = StringCopy(gPokemonStorageSystemPtr->unk_2694, gPCStorageActionTexts[index].text);
            ptr = StringCopy(ptr, gPokemonStorageSystemPtr->unk_11fa);
            ptr = StringCopy(ptr, stringLength);
        }
        break;
    case PC_TEXT_FMT_MON_NAME_AFTER_EXCL_MARK:
        {
            const u8 *stringLength;
            const u8 *text;

            text = gPCStorageActionTexts[index].text;
            stringLength = &text[StringLength(text)] - 1;

            ptr = StringCopy(gPokemonStorageSystemPtr->unk_2694, gPCStorageActionTexts[index].text);
            ptr = StringCopy(ptr - 1, gPokemonStorageSystemPtr->unk_26e4);
            ptr = StringCopy(ptr, stringLength);
        }
        break;
    case PC_TEXT_FMT_NORMAL:
    default:
        ptr = StringCopy(gPokemonStorageSystemPtr->unk_2694, gPCStorageActionTexts[index].text);
        break;
    }

    while (ptr < gPokemonStorageSystemPtr->unk_26a6)
    {
        ptr[0] = CHAR_SPACE;
        ptr++;
    }

    ptr[0] = EOS;
    Menu_PrintText(gPokemonStorageSystemPtr->unk_2694, 11, 17);
}

const struct OamData gOamData_83B6EAC = {
    .size = 3
};

const struct OamData gOamData_83B6EB4 = {
    .shape = ST_OAM_H_RECTANGLE
};

const union AnimCmd gSpriteAnim_83B6EBC[] = {
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83B6EC4[] = {
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_FRAME(4, 8),
    ANIMCMD_FRAME(6, 8),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gSpriteAnim_83B6ED4[] = {
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83B6EDC[] = {
    ANIMCMD_FRAME(10, 8),
    ANIMCMD_FRAME( 4, 8),
    ANIMCMD_FRAME(12, 8),
    ANIMCMD_JUMP(0)
};

const union AnimCmd *const gSpriteAnimTable_83B6EEC[] = {
    gSpriteAnim_83B6EBC,
    gSpriteAnim_83B6EC4,
    gSpriteAnim_83B6ED4,
    gSpriteAnim_83B6EDC
};

const struct SpriteTemplate gSpriteTemplate_83B6EFC = {
    0x0005,
    0xdacd,
    &gOamData_83B6EB4,
    gSpriteAnimTable_83B6EEC,
    NULL,
    gDummySpriteAffineAnimTable,
    SpriteCallbackDummy
};

void sub_8098A38(s8 a0)
{
    DisplayYesNoMenu(23, 10, 0);
    Menu_MoveCursor(a0);
}

void sub_8098A5C(void)
{
    Menu_DestroyCursor();
    Menu_EraseWindowRect(10, 16, 29, 19);
    Menu_EraseWindowRect(23, 10, 29, 15);
}

void sub_8098A80(void)
{
    sub_809CDCC();
    sub_809CDEC(12);
    sub_809CDEC(13);
    sub_809CDEC(14);
    sub_809CDEC(15);
    sub_809CE84();
}

void sub_8098AA8(u8 a0)
{
    sub_809CDCC();
    switch (a0)
    {
    case 0:
        sub_809CDEC(16);
        sub_809CDEC(17);
        sub_809CDEC(18);
        sub_809CDEC(19);
        break;
    case 1:
        sub_809CDEC(20);
        sub_809CDEC(21);
        sub_809CDEC(22);
        sub_809CDEC(23);
        break;
    case 2:
        sub_809CDEC(24);
        sub_809CDEC(25);
        sub_809CDEC(26);
        sub_809CDEC(27);
        break;
    case 3:
        sub_809CDEC(28);
        sub_809CDEC(29);
        sub_809CDEC(30);
        sub_809CDEC(31);
        break;
    }
    sub_809CE84();
}
