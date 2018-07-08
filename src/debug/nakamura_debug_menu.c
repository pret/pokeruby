#if DEBUG
#include "global.h"
#include "constants/items.h"
#include "constants/species.h"
#include "constants/songs.h"
#include "sound.h"
#include "data2.h"
#include "strings.h"
#include "random.h"
#include "palette.h"
#include "main.h"
#include "string_util.h"
#include "overworld.h"
#include "fieldmap.h"
#include "field_player_avatar.h"
#include "metatile_behavior.h"
#include "start_menu.h"
#include "party_menu.h"
#include "choose_party.h"
#include "secret_base.h"
#include "roamer.h"
#include "decoration_inventory.h"
#include "wild_encounter.h"
#include "menu.h"
#include "menu_helpers.h"
#include "pokeblock.h"

static bool8 TopMenu_HandleJoypad(void);
static bool8 SwitchToPkmnListMenu(void);
static bool8 MakeBasesToMax(void);
static bool8 BaseLocation(void);
static bool8 MoveYourBase_JoypadAction(void);
static bool8 SwitchToMoveYourBaseSubmenu(void);
static bool8 MovingPKMN(void);
static bool8 Give999OfAllBerries(void);
static bool8 GiveAllDecorations(void);
static bool8 FishingPoints(void);
static void NakaGenderTest_PrintSpeciesName(u8);
static void NakaGenderTest_PrintSpeciesGender(u8);
static void NakaGenderTest_PrintSpeciesLevel(u8);
static void NakaGenderTest_JoypadAction(u8);
static bool8 NakaGenderTest_HandleJoypad(void);
static u8 NakaGenderTest_ForceRerollPokemon(u8);
static bool8 SetPokeblock(void);

// =======================================================
// TOP MENU
// =======================================================

static const u8 Str_843E36C[] = _("Berries");
static const u8 Str_843E374[] = _("Goods");
static const u8 Str_843E37A[] = _("{PKMN} list");
static const u8 Str_843E382[] = _("トラップ");
static const u8 Str_843E387[] = _("Move your base");
static const u8 Str_843E396[] = _("Moving {PKMN}");
static const u8 Str_843E3A0[] = _("Fishing points");
static const u8 Str_843E3AF[] = _("Set {POKEBLOCK}");
static const u8 Str_843E3B9[] = _("Make bases(to max)");
static const u8 Str_843E3CC[] = _("Base location");

static const struct MenuAction sNakamuraTopMenuActions[] = {
	{ Str_843E36C, Give999OfAllBerries },
	{ Str_843E37A, SwitchToPkmnListMenu },
	{ Str_843E374, GiveAllDecorations },
	{ Str_843E387, SwitchToMoveYourBaseSubmenu },
	{ Str_843E3B9, MakeBasesToMax },
	{ Str_843E3CC, BaseLocation },
	{ Str_843E396, MovingPKMN },
	{ Str_843E3A0, FishingPoints },
	{ Str_843E3AF, SetPokeblock },
};

static void DrawNakamuraDebugMenu(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(14, 0, 29, 19);
    Menu_PrintItems(16, 1, ARRAY_COUNT(sNakamuraTopMenuActions), sNakamuraTopMenuActions);
    InitMenu(0, 15, 1, ARRAY_COUNT(sNakamuraTopMenuActions), 0, 14);
}

bool8 InitNakamuraDebugMenu(void)
{
    DrawNakamuraDebugMenu();
    gMenuCallback = TopMenu_HandleJoypad;
    return FALSE;
}

static bool8 TopMenu_HandleJoypad(void)
{
    if (gMain.newKeys & DPAD_UP)
    {
        Menu_MoveCursor(-1);
    }

    if (gMain.newKeys & DPAD_DOWN)
    {
        Menu_MoveCursor(+1);
    }

    if (gMain.newKeys & A_BUTTON)
    {
        MenuFunc func = sNakamuraTopMenuActions[Menu_GetCursorPos()].func;
        Menu_DestroyCursor();
        return func();
    }

    if (gMain.newKeys & B_BUTTON)
    {
        CloseMenu();
        return TRUE;
    }

    return FALSE;
}

// =======================================================
// PKMN LIST
// =======================================================

static void Task_SwitchToPkmnListMenu(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        Debug_CopyLastThreePartyMonsToMultiPartnerParty();
        OpenPartyMenu(PARTY_MENU_TYPE_LINK_MULTI_BATTLE, 0);
        DestroyTask(taskId);
    }
}

static bool8 SwitchToPkmnListMenu(void)
{
    CloseMenu();
    Menu_EraseScreen();
    gMain.savedCallback = c2_exit_to_overworld_1_sub_8080DEC;
    CreateTask(Task_SwitchToPkmnListMenu, 0);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
    return TRUE;
}

// =======================================================
// MAKE BASES TO MAX and BASE LOCATION
// =======================================================

EWRAM_DATA u8 sSecretBaseIdx = 0;

static const u8 sSecretBaseTemplates[] = {
    // ID, Route,     X,     Y
    0x01,   118,    47,    14 ,
    0x02,   125,    53,    10 ,
    0x03,   113,    49,     8 ,
    0x0B,   118,    67,     6 ,
    0x0C,   121,    40,    11 ,
    0x0D,   111,    35,     1 ,
    0x15,   115,    20,    53 ,
    0x16,   121,    18,    13 ,
    0x17,   119,    26,    81 ,
    0x1F,   127,    59,    67 ,
    0x20,   125,    55,    11 ,
    0x21,   111,    27,    27 ,
    0x29,   114,     9,    47 ,
    0x2A,   115,    32,    39 ,
    0x2B,   115,    23,     8 ,
    0x33,   114,    30,    51 ,
    0x34,   115,    26,    15 ,
    0x35,   115,    32,    46 ,
    0x3D,   114,    11,    62 ,
    0x3E,   115,    21,    18 ,
    0x3F,   115,    25,    24 ,
    0x47,   114,    19,    70 ,
    0x48,   115,    32,     6 ,
    0x49,   114,    32,    57 ,
    0x51,   116,    71,     4 ,
    0x52,   123,    47,     3 ,
    0x53,   123,    57,     5 ,
    0x5B,   116,    79,    11 ,
    0x5C,   123,    49,     3 ,
    0x5D,   120,    18,    12 ,
    0x65,   120,    28,    62 ,
    0x66,   116,    56,     6 ,
    0x67,   119,    16,    81 ,
    0x6F,   120,    30,    62 ,
    0x70,   116,    55,    15 ,
    0x71,   119,    16,    28 ,
    0x79,   111,    33,    34 ,
    0x7A,   118,    29,     5 ,
    0x7B,   127,    45,    24 ,
    0x83,   111,    24,    36 ,
    0x84,   125,     7,    25 ,
    0x85,   115,     8,    30 ,
    0x8D,   111,    34,    50 ,
    0x8E,   127,    59,    72 ,
    0x8F,   127,    61,    21 ,
    0x97,   127,    67,    63 ,
    0x98,   125,    24,    32 ,
    0x99,   111,    35,    31 ,
    0xA1,   111,    13,    19 ,
    0xA2,   121,    43,     7 ,
    0xA3,   118,    47,     5 ,
    0xA4,   111,    14,    19 ,
    0xAB,   118,    46,     5 ,
    0xAC,   121,    42,     7 ,
    0xAD,   119,    19,    76 ,
    0xAE,   115,     7,    20 ,
    0xB5,   110,    16,    25 ,
    0xB6,   114,    11,    27 ,
    0xB7,   115,     8,    20 ,
    0xBF,   110,    17,    25 ,
    0xC0,   114,    12,    27 ,
    0xC1,   119,    18,    76 ,
    0xC9,   119,     5,     2 ,
    0xCA,   119,     4,    89 ,
    0xCB,   120,    38,    54 ,
    0xCC,   120,     5,    76 ,
    0xD3,   119,     5,    15 ,
    0xD4,   119,     7,   101 ,
    0xD5,   120,    31,    23 ,
    0xDD,   119,    34,    24 ,
    0xDE,   120,    26,    10 ,
    0xDF,   119,     4,    15 ,
    0xE7,   119,    31,    73 ,
    0xE8,   120,    29,    85 ,
    0xE9,   119,     6,     2 ,
};

static const u8 Str_843E550[] = _("R");
static const u8 Str_843E552[] = _("X");
static const u8 Str_843E554[] = _("Y");
static const u8 Str_843E556[] = _(
                                    "♂1\n"
                                    "♂2\n"
                                    "♂3\n"
                                    "♂4\n"
                                    "♂5\n"
                                    "♀1\n"
                                    "♀2\n"
                                    "♀3\n"
                                    "♀4\n"
                                    "♀5");

static bool8 MakeBasesToMax(void)
{
    u8 i;
    CloseMenu();

    for (i = 1; i < 20; i++)
    {
        if (gSaveBlock1.secretBases[i].secretBaseId == 0)
        {
            u8 j;

            for (j = 0; j < 7; j++)
            {
                gSaveBlock1.secretBases[i].playerName[j] = gSaveBlock2.playerName[j];
                if (gSaveBlock1.secretBases[i].playerName[j] == EOS)
                    break;
            }

            if (j == 7)
                gSaveBlock1.secretBases[i].playerName[j - 1] = CHAR_A + i - 1;
            else
                gSaveBlock1.secretBases[i].playerName[j] = CHAR_A + i - 1;

            do
            {
                gSaveBlock1.secretBases[i].secretBaseId = sSecretBaseTemplates[(Random() % (ARRAY_COUNT(sSecretBaseTemplates) / 4)) * 4];

                for (j = 0; j < i; j++)
                {
                    if (gSaveBlock1.secretBases[i].secretBaseId == gSaveBlock1.secretBases[j].secretBaseId)
                        break;
                }
            } while (j != i);

            gSaveBlock1.secretBases[i].gender = Random() % 2;

            for (j = 0; j < 4; j++)
            {
                gSaveBlock1.secretBases[i].trainerId[j] = Random();
            }

            for (j = 0; j < 16; j++)
            {
                gSaveBlock1.secretBases[i].decorations[j] = 0;
                gSaveBlock1.secretBases[i].decorationPos[j] = 0;
            }

            unref_sub_80BCD7C(i);
        }
    }

    return TRUE;
}

static void BaseLocation_GetCurSecretBaseData(u8 * R, u8 * X, u8 * Y)
{
    u8 i;
    u8 sbId = gSaveBlock1.secretBases[sSecretBaseIdx].secretBaseId;

    for (i = 0; i < ARRAY_COUNT(sSecretBaseTemplates) / 4; i++)
    {
        if (sSecretBaseTemplates[i * 4] == sbId)
        {
            *R = sSecretBaseTemplates[i * 4 + 1];
            *X = sSecretBaseTemplates[i * 4 + 2];
            *Y = sSecretBaseTemplates[i * 4 + 3];
            break;
        }
    }
}

static void BaseLocation_Redraw(void)
{
    Menu_BlankWindowRect(1, 1, 10, 10);
    ConvertIntToDecimalStringN(gStringVar1, sSecretBaseIdx, STR_CONV_MODE_LEFT_ALIGN, 2);
    Menu_PrintText(gStringVar1, 1, 1);

    if (gSaveBlock1.secretBases[sSecretBaseIdx].secretBaseId != 0)
    {
        u8 R;
        u8 X;
        u8 Y;
        BaseLocation_GetCurSecretBaseData(&R, &X, &Y);

        sub_80BC190(gStringVar1, sSecretBaseIdx);
        Menu_PrintText(gStringVar1, 1, 3);

        Menu_PrintText(Str_843E550, 1, 5);
        ConvertIntToDecimalStringN(gStringVar1, R, STR_CONV_MODE_LEFT_ALIGN, 3);
        Menu_PrintText(gStringVar1, 2, 5);

        Menu_PrintText(Str_843E552, 1, 7);
        ConvertIntToDecimalStringN(gStringVar1, X, STR_CONV_MODE_LEFT_ALIGN, 3);
        Menu_PrintText(gStringVar1, 3, 7);

        Menu_PrintText(Str_843E554, 1, 9);
        ConvertIntToDecimalStringN(gStringVar1, Y, STR_CONV_MODE_LEFT_ALIGN, 3);
        Menu_PrintText(gStringVar1, 3, 9);
    }
}

static bool8 BaseLocation_HandleJoypad(void)
{
    if (gMain.newKeys & DPAD_LEFT)
    {
        if (sSecretBaseIdx == 0)
            sSecretBaseIdx = 19;
        else
            sSecretBaseIdx--;
        BaseLocation_Redraw();
        return FALSE;
    }

    if (gMain.newKeys & DPAD_RIGHT)
    {
        if (sSecretBaseIdx == 19)
            sSecretBaseIdx = 0;
        else
            sSecretBaseIdx++;
        BaseLocation_Redraw();
        return FALSE;
    }

    if (gMain.newKeys & B_BUTTON)
    {
        CloseMenu();
        return TRUE;
    }

    return FALSE;
}

static bool8 BaseLocation(void)
{
    sSecretBaseIdx = 0;
    gMenuCallback = BaseLocation_HandleJoypad;
    Menu_EraseWindowRect(0, 0, 29, 19);
    Menu_DrawStdWindowFrame(0, 0, 11, 11);
    BaseLocation_Redraw();
    return FALSE;
}

// =======================================================
// MOVE YOUR BASE
// =======================================================

EWRAM_DATA u8 sMoveYourBase_CursorPos = 0;
EWRAM_DATA u8 sMoveYourBase_XCursorPos = 0;
EWRAM_DATA u8 sSecretBaseNameCharGroup = 0;

static const u8 Str_843E574[] = _("ー");
static const u8 Str_843E576[][2] = {
    _("あ"),
    _("ア"),
    _("A"),
    _("a"),
    _("0")
};

static void MoveYourBase_PrintSBOwnerID(void)
{
    u8 * otIdPtr = gSaveBlock1.secretBases[sSecretBaseIdx].trainerId;
    u32 otId = (otIdPtr[3] << 24) | (otIdPtr[2] << 16) | (otIdPtr[1] << 8) | (otIdPtr[0] << 0);
    ConvertIntToDecimalStringN(gStringVar1, otId / 100000, STR_CONV_MODE_LEADING_ZEROS, 5);
    Menu_PrintText(gStringVar1, 2, 7);
    ConvertIntToDecimalStringN(gStringVar1, otId % 100000, STR_CONV_MODE_LEADING_ZEROS, 5);
    Menu_PrintText(gStringVar1, 7, 7);
}

static void MoveYourBase_PrintSBOwnerName(void)
{
    Menu_BlankWindowRect(2, 3, 11, 4);
    *StringCopyN(gStringVar1, gSaveBlock1.secretBases[sSecretBaseIdx].playerName, 7) = EOS;
    Menu_PrintText(gStringVar1, 2, 3);
}

static void MoveYourBase_Redraw(void)
{
    Menu_BlankWindowRect(2, 1, 11, 10);

    ConvertIntToDecimalStringN(gStringVar1, sSecretBaseIdx, STR_CONV_MODE_LEFT_ALIGN, 2);
    Menu_PrintText(gStringVar1, 2, 1);

    if (gSaveBlock1.secretBases[sSecretBaseIdx].secretBaseId != 0)
    {
        MoveYourBase_PrintSBOwnerName();
        MoveYourBase_PrintSBOwnerID();
    }
}

static void MoveYourBase_UpdateXCursorPosition(void)
{
    Menu_BlankWindowRect(2, 5, 11, 6);
    Menu_PrintText(Str_843E574, sMoveYourBase_XCursorPos + 2, 5);
}

static void MoveYourBase_PrintCharacterSetName(void)
{
    if (sMoveYourBase_CursorPos)
        Menu_BlankWindowRect(11, 1, 11, 2);
    else
        Menu_PrintText(Str_843E576[sSecretBaseNameCharGroup], 11, 1);
}

static void MoveYourBase_EditOwnerID(s8 direction)
{
    u8 * otIdPtr = gSaveBlock1.secretBases[sSecretBaseIdx].trainerId;
    u32 otId = (otIdPtr[3] << 24) | (otIdPtr[2] << 16) | (otIdPtr[1] << 8) | (otIdPtr[0] << 0);
    s8 digit;
    int r1 = direction;

    for (digit = 9; digit > sMoveYourBase_XCursorPos; digit--)
        r1 *= 10;

    otId += r1;
    otIdPtr[3] = (otId & 0xFF000000) >> 24;
    otIdPtr[2] = (otId & 0x00FF0000) >> 16;
    otIdPtr[1] = (otId & 0x0000FF00) >> 8;
    otIdPtr[0] = (otId & 0x000000FF) >> 0;
    MoveYourBase_PrintSBOwnerID();
}

static void MoveYourBase_EditOwnerNameChar(s8 a0)
{
    u8 * namePtr = gSaveBlock1.secretBases[sSecretBaseIdx].playerName;
    u8 r2 = 0;
    u8 r3 = 0;
    u8 i;

    if (a0 == 100)
    {
        for (i = sMoveYourBase_XCursorPos; i < 7; i++)
        {
            namePtr[i] = EOS;
        }
    }
    else
    {
        switch (sSecretBaseNameCharGroup)
        {
            case 0: // HIRA
                r3 = 1;
                r2 = 80;
                break;
            case 1: // KATA
                r3 = 81;
                r2 = 160;
                break;
            case 2: // A-Z
                r3 = CHAR_A;
                r2 = CHAR_Z;
                break;
            case 3: // a-z
                r3 = CHAR_a;
                r2 = CHAR_z;
                break;
            case 4: // 0-9
                r3 = CHAR_0;
                r2 = CHAR_0 + 9;
                break;
        }

        namePtr[sMoveYourBase_XCursorPos] += a0;
        if (namePtr[sMoveYourBase_XCursorPos] < r3)
            namePtr[sMoveYourBase_XCursorPos] = r2;
        if (namePtr[sMoveYourBase_XCursorPos] > r2)
            namePtr[sMoveYourBase_XCursorPos] = r3;
    }
    MoveYourBase_PrintSBOwnerName();
}

static bool8 MoveYourBase_HandleJoypad_2(void)
{
    u32 r4 = sMoveYourBase_CursorPos == 0 ? 7 : 10;

    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        if (sMoveYourBase_CursorPos)
            MoveYourBase_EditOwnerID(1);
        else
            MoveYourBase_EditOwnerNameChar(1);
        return FALSE;
    }

    if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        if (sMoveYourBase_CursorPos)
            MoveYourBase_EditOwnerID(-1);
        else
            MoveYourBase_EditOwnerNameChar(-1);
        return FALSE;
    }

    if (gMain.newAndRepeatedKeys & DPAD_LEFT)
    {
        if (sMoveYourBase_XCursorPos == 0)
            sMoveYourBase_XCursorPos = r4 - 1;
        else
            sMoveYourBase_XCursorPos--;
        MoveYourBase_UpdateXCursorPosition();
        return FALSE;
    }

    if (gMain.newAndRepeatedKeys & DPAD_RIGHT)
    {
        if (sMoveYourBase_XCursorPos == r4 - 1)
            sMoveYourBase_XCursorPos = 0;
        else
            sMoveYourBase_XCursorPos++;
        MoveYourBase_UpdateXCursorPosition();
        return FALSE;
    }

    if (gMain.newKeys & SELECT_BUTTON)
    {
        if (sMoveYourBase_CursorPos == 0)
            sSecretBaseNameCharGroup = (sSecretBaseNameCharGroup + 1) % 5;
        MoveYourBase_PrintCharacterSetName();
        return FALSE;
    }

    if (gMain.newKeys & A_BUTTON)
    {
        Menu_BlankWindowRect(2, 5, 11, 6);
        Menu_BlankWindowRect(11, 1, 11, 2);
        gMenuCallback = MoveYourBase_JoypadAction;
        return FALSE;
    }

    if (gMain.newKeys & B_BUTTON)
    {
        if (sMoveYourBase_CursorPos == 0)
            MoveYourBase_EditOwnerNameChar(100);
        return FALSE;
    }

    return FALSE;
}

static bool8 MoveYourBase_JoypadAction(void)
{
    if (gMain.newKeys & DPAD_UP)
    {
        Menu_MoveCursor(-2);
        return FALSE;
    }

    if (gMain.newKeys & DPAD_DOWN)
    {
        Menu_MoveCursor(+2);
        return FALSE;
    }

    if (gMain.newKeys & DPAD_LEFT)
    {
        if (sSecretBaseIdx == 0)
            sSecretBaseIdx = 19;
        else
            sSecretBaseIdx--;
        MoveYourBase_Redraw();
        return FALSE;
    }

    if (gMain.newKeys & DPAD_RIGHT)
    {
        if (sSecretBaseIdx == 19)
            sSecretBaseIdx = 0;
        else
            sSecretBaseIdx++;
        MoveYourBase_Redraw();
        return FALSE;
    }

    if (gMain.newKeys & A_BUTTON)
    {
        if (sSecretBaseIdx != 0 && gSaveBlock1.secretBases[sSecretBaseIdx].secretBaseId != 0)
        {
            sMoveYourBase_CursorPos = Menu_GetCursorPos();
            sMoveYourBase_XCursorPos = 0;
            MoveYourBase_UpdateXCursorPosition();
            MoveYourBase_PrintCharacterSetName();
            gMenuCallback = MoveYourBase_HandleJoypad_2;
        }
        return FALSE;
    }

    if (gMain.newKeys & B_BUTTON)
    {
        CloseMenu();
        return TRUE;
    }

    return FALSE;
}

static bool8 SwitchToMoveYourBaseSubmenu(void)
{
    sSecretBaseIdx = 0;
    sSecretBaseNameCharGroup = 0;
    gMenuCallback = MoveYourBase_JoypadAction;
    Menu_EraseWindowRect(0, 0, 29, 19);
    Menu_DrawStdWindowFrame(0, 0, 12, 11);
    MoveYourBase_Redraw();
    InitMenu(0, 1, 3, 3, 0, 11);
    return FALSE;
}

// =======================================================
// MOVING PKMN (aka Roamers)
// =======================================================

static const u8 Str_843E580[] = _(
                                    "ADD\n"
                                    "DEL\n"
                                    "EXIT");

static bool8 MovingPKMN_HandleJoypad(void)
{
    if (gMain.newKeys & DPAD_UP)
    {
        Menu_MoveCursor(-1);
        return FALSE;
    }

    if (gMain.newKeys & DPAD_DOWN)
    {
        Menu_MoveCursor(+1);
        return FALSE;
    }

    if (gMain.newKeys & A_BUTTON)
    {
        CloseMenu();
        switch (Menu_GetCursorPos())
        {
            case 0:
                Debug_CreateRoamer();
                break;
            case 1:
                ClearRoamerData();
                ClearRoamerLocationData();
                break;
        }
        return TRUE;
    }

    if (gMain.newKeys & B_BUTTON)
    {
        CloseMenu();
        return TRUE;
    }

    return FALSE;
}

static bool8 MovingPKMN(void)
{
    gMenuCallback = MovingPKMN_HandleJoypad;
    Menu_EraseWindowRect(0, 0, 29, 19);
    Debug_GetRoamerLocation(gStringVar1);
    Menu_DrawStdWindowFrame(0, 0, 11, 9);
    Menu_PrintText(gStringVar1, 1, 1);
    Menu_PrintText(Str_843E580, 2, 3);
    InitMenu(0, 1, 3, 3, 0, 10);
    return FALSE;
}

// =======================================================
// GIVE ALL BERRIES
// =======================================================

static bool8 Give999OfAllBerries(void)
{
    u16 i;

    for (i = 0; i < 43; i++)
    {
        gSaveBlock1.bagPocket_Berries[i].itemId = ITEM_CHERI_BERRY + i;
        gSaveBlock1.bagPocket_Berries[i].quantity = 999;
    }

    CloseMenu();
    return TRUE;
}

// =======================================================
// GIVE ALL DECORATIONS
// =======================================================

static bool8 GiveAllDecorations(void)
{
    ClearDecorationInventories();
    Debug_GiveAllDecorations();
    Menu_EraseWindowRect(0, 0, 29, 19);
    CloseMenu();
    return TRUE;
}

// =======================================================
// FISHING POINTS (Feebas)
// =======================================================

static const u8 Str_843E58D[] = _(
                                    "Fishing location R119\n"
                                    " Y1\n"
                                    " Y2\n"
                                    " Y3\n"
                                    "Encounter location\n"
                                    "\n"
                                    "\n"
                                    "front of you");

static u16 FishingPoints_CountFishingTilesInMapThird(u8 a0)
{
    u16 retval = 0;
    u16 height = gMapHeader.mapLayout->height / 3;
    u16 y;
    u16 x;
    u16 start = height * a0;

    for (y = start; y < start + height; y++)
    {
        for (x = 0; x < gMapHeader.mapLayout->width; x++)
        {
            if (MetatileBehavior_IsFeebasEncounterable(MapGridGetMetatileBehaviorAt(x + 7, y + 7)) == TRUE)
            {
                retval++;
            }
        }
    }

    return retval;
}

static u16 FishingPoints_GetIndexOfCurrentFishingSpot(void)
{
    u16 retval = 0;
    s16 x;
    s16 y;
    u16 xx;
    u16 yy;

    GetXYCoordsOneStepInFrontOfPlayer(&x, &y);
    x -= 7;
    y -= 7;

    for (yy = 0; yy < gMapHeader.mapLayout->height; yy++)
    {
        for (xx = 0; xx < gMapHeader.mapLayout->width; xx++)
        {
            if (MetatileBehavior_IsFeebasEncounterable(MapGridGetMetatileBehaviorAt(xx + 7, yy + 7)) == TRUE)
            {
                retval++;
                if (x == xx && y == yy)
                    return retval;
            }
        }
    }
    return retval + 1;
}

static bool8 FishingPoints_HandleJoypad(void)
{
    if (gMain.newKeys & A_BUTTON || gMain.newKeys & B_BUTTON)
    {
        Menu_EraseWindowRect(0, 0, 29, 19);
        CloseMenu();
        return TRUE;
    }

    return FALSE;
}

static bool8 FishingPoints(void)
{
    u16 nWaterTiles;
    u16 nFeebas;

    Menu_EraseWindowRect(0, 0, 29, 19);
    Menu_DrawStdWindowFrame(0, 0, 16, 19);
    Menu_PrintText(Str_843E58D, 1, 1);

    ConvertIntToDecimalStringN(gStringVar1, FishingPoints_CountFishingTilesInMapThird(0), STR_CONV_MODE_RIGHT_ALIGN, 5);
    Menu_PrintText(gStringVar1, 5, 3);

    ConvertIntToDecimalStringN(gStringVar1, FishingPoints_CountFishingTilesInMapThird(1), STR_CONV_MODE_RIGHT_ALIGN, 5);
    Menu_PrintText(gStringVar1, 5, 5);

    ConvertIntToDecimalStringN(gStringVar1, FishingPoints_CountFishingTilesInMapThird(2), STR_CONV_MODE_RIGHT_ALIGN, 5);
    Menu_PrintText(gStringVar1, 5, 7);

    ConvertIntToDecimalStringN(gStringVar1, FeebasDebug_GetTrueNumberOfWaterTilesInMapThird(0), STR_CONV_MODE_RIGHT_ALIGN, 5);
    Menu_PrintText(gStringVar1, 11, 3);

    ConvertIntToDecimalStringN(gStringVar1, FeebasDebug_GetTrueNumberOfWaterTilesInMapThird(1), STR_CONV_MODE_RIGHT_ALIGN, 5);
    Menu_PrintText(gStringVar1, 11, 5);

    ConvertIntToDecimalStringN(gStringVar1, FeebasDebug_GetTrueNumberOfWaterTilesInMapThird(2), STR_CONV_MODE_RIGHT_ALIGN, 5);
    Menu_PrintText(gStringVar1, 11, 7);

    FeebasSeedRng(gSaveBlock1.easyChatPairs[0].unk2);
    nWaterTiles = FishingPoints_CountFishingTilesInMapThird(0) + FishingPoints_CountFishingTilesInMapThird(1) + FishingPoints_CountFishingTilesInMapThird(2);
    nFeebas = 0;

    while (nFeebas != 6)
    {
        u16 randTile = FeebasRandom() % nWaterTiles;
        if (randTile == 0)
            randTile = nWaterTiles;
        if (randTile == 0 || randTile > 3)
        {
            ConvertIntToDecimalStringN(gStringVar1, randTile, STR_CONV_MODE_RIGHT_ALIGN, 4);
            Menu_PrintText(gStringVar1, (nFeebas % 3) * 5 + 2, (nFeebas / 3) * 2 + 11);
            nFeebas++;
        }
    }

    ConvertIntToDecimalStringN(gStringVar1, FishingPoints_GetIndexOfCurrentFishingSpot(), STR_CONV_MODE_RIGHT_ALIGN, 4);
    Menu_PrintText(gStringVar1, 2, 17);

    gMenuCallback = FishingPoints_HandleJoypad;

    return FALSE;
}

// =======================================================
// GENDER TEST?
// =======================================================

static struct {
    s16 species;
    s8 level;
    u8 unk3;
} sNakaGenderTestData[PARTY_SIZE];

EWRAM_DATA u8 sNakaGenderTest_CursorPosition = 0;
static const u8 _843E5D1[] = {0x0F, 0x16, 0x19};
static const u8 Str_843E5D4[] = _(
                                    "Aボタン　{ESCAPE}\p"
                                    "　　Bボタン　ー\n"
                                    "START　けってい");

void NakaGenderTest(void)
{
    u8 i;

    Menu_DrawStdWindowFrame(14, 0, 29, 13);
    Menu_DrawStdWindowFrame(0, 14, 29, 19);
    Menu_PrintText(Str_843E5D4, 1, 15);

    for (i = 0; i < PARTY_SIZE; i++)
    {
        sNakaGenderTestData[i].species = GetMonData(gPlayerParty + i, MON_DATA_SPECIES);
        if (sNakaGenderTestData[i].species != SPECIES_NONE)
        {
            sNakaGenderTestData[i].level = GetMonData(gPlayerParty + i, MON_DATA_LEVEL);
            NakaGenderTest_PrintSpeciesName(i);
            NakaGenderTest_PrintSpeciesGender(i);
            NakaGenderTest_PrintSpeciesLevel(i);
        }
        else
            sNakaGenderTestData[i].level = 1;
        sNakaGenderTestData[i].unk3 = 0;
    }

    sNakaGenderTest_CursorPosition = 0;
    PrintTriangleCursorWithPalette(15, 1, 0xFF);
    gMenuCallback = NakaGenderTest_HandleJoypad;
}

static void NakaGenderTest_PrintSpeciesName(u8 i)
{
    Menu_PrintText(gSpeciesNames[sNakaGenderTestData[i].species], 16, 2 * i + 1);
}

static void NakaGenderTest_PrintSpeciesGender(u8 i)
{
    u8 sp0[] = _("？");
    u8 gender;

    gender = GetMonGender(gPlayerParty + i);
    if (gender == MON_MALE)
        Menu_PrintText(gOtherText_MaleSymbol2, 23, 2 * i + 1);
    else if (gender == MON_FEMALE)
        Menu_PrintText(gOtherText_FemaleSymbol2, 23, 2 * i + 1);
    else
        Menu_PrintText(sp0, 23, 2 * i + 1);
}

static void NakaGenderTest_PrintSpeciesLevel(u8 i)
{
    ConvertIntToDecimalStringN(gStringVar1, sNakaGenderTestData[i].level, STR_CONV_MODE_RIGHT_ALIGN, 3);
    Menu_PrintText(gStringVar1, 26, 2 * i + 1);
}

static void NakaGenderTest_RedrawCurrent(u8 i)
{
    Menu_BlankWindowRect(16, 2 * i + 1, 28, 2 * i + 2);
    if (sNakaGenderTestData[i].species != SPECIES_NONE)
    {
        NakaGenderTest_PrintSpeciesName(i);
        NakaGenderTest_PrintSpeciesGender(i);
        NakaGenderTest_PrintSpeciesLevel(i);
    }
    NakaGenderTest_JoypadAction(5);
}

static void NakaGenderTest_AdjustSpecies(u8 i, s8 dirn)
{
    if (sNakaGenderTestData[i].species == SPECIES_NONE && sNakaGenderTestData[i].unk3 == 0 && dirn == 1)
        sNakaGenderTestData[i].species = SPECIES_TREECKO - 1;
    sNakaGenderTestData[i].species += dirn;
    if (sNakaGenderTestData[i].species >= SPECIES_CHIMECHO)
        sNakaGenderTestData[i].species -= SPECIES_CHIMECHO;
    if (sNakaGenderTestData[i].species < 0)
        sNakaGenderTestData[i].species += SPECIES_CHIMECHO;
    CreateMon(gPlayerParty + i, sNakaGenderTestData[i].species, sNakaGenderTestData[i].level, 0x20, FALSE, 0, FALSE, 0);
    sNakaGenderTestData[i].unk3 = 1;
}

static void NakaGenderTest_RerollPokemon(u8 i)
{
    if (sNakaGenderTestData[i].species != SPECIES_NONE)
        NakaGenderTest_ForceRerollPokemon(i);
}

static void NakaGenderTest_AdjustLevel(u8 i, s8 dirn)
{
    if (sNakaGenderTestData[i].species != SPECIES_NONE)
    {
        sNakaGenderTestData[i].level += dirn;
        if (sNakaGenderTestData[i].level > 100)
            sNakaGenderTestData[i].level = 1;
        if (sNakaGenderTestData[i].level < 1)
            sNakaGenderTestData[i].level = 100;
        SetMonData(gPlayerParty + i, MON_DATA_EXP, gExperienceTables[gBaseStats[sNakaGenderTestData[i].species].growthRate] + sNakaGenderTestData[i].level);
        Nakamura_NakaGenderTest_RecalcStats(gPlayerParty + i);
    }
}

static void NakaGenderTest_PartyCompactionEnsureAtLeastOne(void)
{
    u8 i;
    u8 j;

    Menu_EraseWindowRect(0, 0, 29, 19);
    for (i = 0; i < 5; i++)
    {
        for (j = i + 1; j < 6; j++)
        {
            if (GetMonData(gPlayerParty + i, MON_DATA_SPECIES, NULL) == SPECIES_NONE)
            {
                struct Pokemon tmp = gPlayerParty[i];
                gPlayerParty[i] = gPlayerParty[j];
                gPlayerParty[j] = tmp;
            }
        }
    }
    CalculatePlayerPartyCount();
    if (gPlayerPartyCount == 0)
    {
        CreateMon(gPlayerParty + 0, SPECIES_BULBASAUR, 10, 0x20, FALSE, 0, FALSE, 0);
        gPlayerPartyCount = 1;
    }
}

static void NakaGenderTest_JoypadAction(u8 i)
{
    u8 q;
    u8 r;
    PlaySE(SE_SELECT);
    q = sNakaGenderTest_CursorPosition / 6;
    r = sNakaGenderTest_CursorPosition % 6;
    Menu_BlankWindowRect(_843E5D1[q], r * 2 + 1, _843E5D1[q], r * 2 + 2);

    if (i == 0)
    {
        if (r != 0)
            sNakaGenderTest_CursorPosition--;
        else
            sNakaGenderTest_CursorPosition = q * 6 + 5;
    }

    if (i == 1)
    {
        if (r != 5)
            sNakaGenderTest_CursorPosition++;
        else
            sNakaGenderTest_CursorPosition = q * 6;
    }

    if (i == 2)
    {
        if (q != 0)
            sNakaGenderTest_CursorPosition -= 6;
        else
            sNakaGenderTest_CursorPosition = 12 + r;
    }

    if (i == 3)
    {
        if (q != 2)
            sNakaGenderTest_CursorPosition += 6;
        else
            sNakaGenderTest_CursorPosition = r;
    }

    q = sNakaGenderTest_CursorPosition / 6;
    r = sNakaGenderTest_CursorPosition % 6;
    PrintTriangleCursorWithPalette(_843E5D1[q], r * 2 + 1, 0xFF);
}

static bool8 NakaGenderTest_HandleJoypad(void)
{
    if (gMain.newKeys & DPAD_UP)
    {
        NakaGenderTest_JoypadAction(0);
        return FALSE;
    }

    if (gMain.newKeys & DPAD_DOWN)
    {
        NakaGenderTest_JoypadAction(1);
        return FALSE;
    }

    if (gMain.newKeys & DPAD_LEFT)
    {
        NakaGenderTest_JoypadAction(2);
        return FALSE;
    }

    if (gMain.newKeys & DPAD_RIGHT)
    {
        NakaGenderTest_JoypadAction(3);
        return FALSE;
    }

    if (gMain.newAndRepeatedKeys & A_BUTTON)
    {
        if (sNakaGenderTest_CursorPosition < 6)
            NakaGenderTest_AdjustSpecies(sNakaGenderTest_CursorPosition, +1);
        if (sNakaGenderTest_CursorPosition >= 6 && sNakaGenderTest_CursorPosition < 12)
            NakaGenderTest_RerollPokemon(sNakaGenderTest_CursorPosition % 6);
        if (sNakaGenderTest_CursorPosition >= 12 && sNakaGenderTest_CursorPosition < 18)
            NakaGenderTest_AdjustLevel(sNakaGenderTest_CursorPosition % 6, +1);
        NakaGenderTest_RedrawCurrent(sNakaGenderTest_CursorPosition % 6);
        return FALSE;
    }

    if (gMain.newAndRepeatedKeys & B_BUTTON)
    {
        if (sNakaGenderTest_CursorPosition < 6)
            NakaGenderTest_AdjustSpecies(sNakaGenderTest_CursorPosition, -1);
        if (sNakaGenderTest_CursorPosition >= 6 && sNakaGenderTest_CursorPosition < 12)
            NakaGenderTest_RerollPokemon(sNakaGenderTest_CursorPosition % 6);
        if (sNakaGenderTest_CursorPosition >= 12 && sNakaGenderTest_CursorPosition < 18)
            NakaGenderTest_AdjustLevel(sNakaGenderTest_CursorPosition % 6, -1);
        NakaGenderTest_RedrawCurrent(sNakaGenderTest_CursorPosition % 6);
        return FALSE;
    }

    if (gMain.newAndRepeatedKeys & R_BUTTON)
    {
        if (sNakaGenderTest_CursorPosition < 6)
            NakaGenderTest_AdjustSpecies(sNakaGenderTest_CursorPosition, +10);
        if (sNakaGenderTest_CursorPosition >= 6 && sNakaGenderTest_CursorPosition < 12)
            NakaGenderTest_RerollPokemon(sNakaGenderTest_CursorPosition % 6);
        if (sNakaGenderTest_CursorPosition >= 12 && sNakaGenderTest_CursorPosition < 18)
            NakaGenderTest_AdjustLevel(sNakaGenderTest_CursorPosition % 6, +1);
        NakaGenderTest_RedrawCurrent(sNakaGenderTest_CursorPosition % 6);
        return FALSE;
    }

    if (gMain.newAndRepeatedKeys & L_BUTTON)
    {
        if (sNakaGenderTest_CursorPosition < 6)
            NakaGenderTest_AdjustSpecies(sNakaGenderTest_CursorPosition, -10);
        if (sNakaGenderTest_CursorPosition >= 6 && sNakaGenderTest_CursorPosition < 12)
            NakaGenderTest_RerollPokemon(sNakaGenderTest_CursorPosition % 6);
        if (sNakaGenderTest_CursorPosition >= 12 && sNakaGenderTest_CursorPosition < 18)
            NakaGenderTest_AdjustLevel(sNakaGenderTest_CursorPosition % 6, -1);
        NakaGenderTest_RedrawCurrent(sNakaGenderTest_CursorPosition % 6);
        return FALSE;
    }

    if (gMain.newKeys & START_BUTTON)
    {
        NakaGenderTest_PartyCompactionEnsureAtLeastOne();
        CloseMenu();
        return TRUE;
    }

    return FALSE;
}

static u8 NakaGenderTest_ForceRerollPokemon(u8 i)
{
    u16 species = GetMonData(gPlayerParty + i, MON_DATA_SPECIES);
    u8 gender = GetMonGender(gPlayerParty + i);
    u8 ratio = gBaseStats[species].genderRatio;
    u32 personality;

    if (ratio == MON_MALE || ratio == MON_FEMALE || ratio ==  MON_GENDERLESS)
        return GetMonGender(gPlayerParty + i);

    switch (gender)
    {
        default:
            return MON_MALE;
        case MON_MALE:
            ratio = MON_FEMALE;
            break;
        case MON_FEMALE:
            ratio = MON_MALE;
            break;
    }

    do
    {
        personality = Random();
        personality |= (Random() << 16);
    } while (GetGenderFromSpeciesAndPersonality(species, personality) != ratio);

    GetMonData(gPlayerParty + i, MON_DATA_IVS);
    CreateMon(gPlayerParty + i, sNakaGenderTestData[i].species, sNakaGenderTestData[i].level, 0x20, TRUE, personality, FALSE, 0);
    return ratio;
}

// =======================================================
// SET POKEBLOCK
// =======================================================

static struct Pokeblock sPokeblock;

#ifdef NONMATCHING
static u8 SetPokeblock_CalcColor(u8 * dest, struct Pokeblock * pokeblock)
{
    u8 numGoodFlavors = 0;
    u8 numBadFlavors = 0;
    u8 numNeutralFlavors = 0;
    u8 i;
    u8 numLowFlavors;
    s16 pkblk[6];

    for (i = 0; i < 6; i++)
    {
        pkblk[i] = GetPokeblockData(pokeblock, i + PBLOCK_SPICY);
        if (i != PBLOCK_FEEL - 1)
        {
            if (pkblk[i] > 0)
                numGoodFlavors++;
            if (pkblk[i] < 0)
                numBadFlavors++;
            if (pkblk[i] == 0)
                numNeutralFlavors++;
        }
    }

    if (pkblk[0] >= 50)
    {
        StringCopy(dest, ContestStatsText_GoldPokeBlock);
        return PBLOCK_CLR_GOLD;
    }

    if (pkblk[1] >= 50)
    {
        StringCopy(dest, ContestStatsText_GoldPokeBlock);
        return PBLOCK_CLR_GOLD;
    }

    if (pkblk[2] >= 50)
    {
        StringCopy(dest, ContestStatsText_GoldPokeBlock);
        return PBLOCK_CLR_GOLD;
    }

    if (pkblk[3] >= 50)
    {
        StringCopy(dest, ContestStatsText_GoldPokeBlock);
        return PBLOCK_CLR_GOLD;
    }

    if (pkblk[4] >= 50)
    {
        StringCopy(dest, ContestStatsText_GoldPokeBlock);
        return PBLOCK_CLR_GOLD;
    }

    if (numGoodFlavors == 4)
    {
        StringCopy(dest, ContestStatsText_WhitePokeBlock);
        return PBLOCK_CLR_WHITE;
    }

    numLowFlavors = 0;
    for (i = 0; i < 5; i++)
    {
        if (pkblk[i] == 2)
            numLowFlavors++;
    }
    if (numLowFlavors == 3 || numNeutralFlavors == 5 || numBadFlavors == 4)
    {
        StringCopy(dest, ContestStatsText_BlackPokeBlock);
        return PBLOCK_CLR_BLACK;
    }

    if (numGoodFlavors == 3)
    {
        StringCopy(dest, ContestStatsText_GrayPokeBlock);
        return PBLOCK_CLR_GRAY;
    }

    if (numGoodFlavors == 2 || numBadFlavors == 2)
    {
        u8 firstNonzeroFlavor = 6;
        u8 lastNonzeroFlavor = 0;
        for (i = 0; i < 5; i++)
        {
            if (pkblk[i] != 0)
            {
                if (firstNonzeroFlavor == 6)
                    firstNonzeroFlavor = i;
                else
                    lastNonzeroFlavor = i;
            }
        }
        if (pkblk[firstNonzeroFlavor] >= pkblk[lastNonzeroFlavor])
            lastNonzeroFlavor = firstNonzeroFlavor;

        if (lastNonzeroFlavor == 0)
        {
            StringCopy(dest, ContestStatsText_PurplePokeBlock);
            return PBLOCK_CLR_PURPLE;
        }

        if (lastNonzeroFlavor == 1)
        {
            StringCopy(dest, ContestStatsText_IndigoPokeBlock);
            return PBLOCK_CLR_INDIGO;
        }

        if (lastNonzeroFlavor == 2)
        {
            StringCopy(dest, ContestStatsText_BrownPokeBlock);
            return PBLOCK_CLR_BROWN;
        }

        if (lastNonzeroFlavor == 3)
        {
            StringCopy(dest, ContestStatsText_LiteBluePokeBlock);
            return PBLOCK_CLR_LITEBLUE;
        }

        if (lastNonzeroFlavor == 4)
        {
            StringCopy(dest, ContestStatsText_OlivePokeBlock);
            return PBLOCK_CLR_OLIVE;
        }
    }

    if (numGoodFlavors == 1 || numBadFlavors == 1)
    {
        if (pkblk[0] != 0)
        {
            StringCopy(dest, ContestStatsText_RedPokeBlock);
            return PBLOCK_CLR_RED;
        }

        if (pkblk[1] != 0)
        {
            StringCopy(dest, ContestStatsText_BluePokeBlock);
            return PBLOCK_CLR_BLUE;
        }

        if (pkblk[2] != 0)
        {
            StringCopy(dest, ContestStatsText_PinkPokeBlock);
            return PBLOCK_CLR_PINK;
        }

        if (pkblk[3] != 0)
        {
            StringCopy(dest, ContestStatsText_GreenPokeBlock);
            return PBLOCK_CLR_GREEN;
        }

        if (pkblk[4] != 0)
        {
            StringCopy(dest, ContestStatsText_YellowPokeBlock);
            return PBLOCK_CLR_YELLOW;
        }
    }

    StringCopy(dest, gOtherText_FiveQuestions);
    return 0; // PBLOCK_CLR_UNKNOWN
}
#else
NAKED
static u8 SetPokeblock_CalcColor(u8 * dest, struct Pokeblock * pokeblock)
{
    asm("\tpush\t{r4, r5, r6, r7, lr}\n"
        "\tmov\tr7, r9\n"
        "\tmov\tr6, r8\n"
        "\tpush\t{r6, r7}\n"
        "\tadd\tsp, sp, #0xfffffff0\n"
        "\tadd\tr6, r0, #0\n"
        "\tmov\tr9, r1\n"
        "\tmov\tr7, #0x0\n"
        "\tmov\tr0, #0x0\n"
        "\tmov\tr8, r0\n"
        "\tmov\tr2, #0x0\n"
        "\tmov\tr5, #0x0\n"
        "._329:\n"
        "\tadd\tr4, r5, #1\n"
        "\tlsl\tr1, r4, #0x18\n"
        "\tlsr\tr1, r1, #0x18\n"
        "\tmov\tr0, r9\n"
        "\tstr\tr2, [sp, #0xc]\n"
        "\tbl\tGetPokeblockData\n"
        "\tadd\tr1, r0, #0\n"
        "\tlsl\tr0, r5, #0x1\n"
        "\tadd r0, r0, sp\n"
        "\tstrh\tr1, [r0]\n"
        "\tldr\tr2, [sp, #0xc]\n"
        "\tcmp\tr5, #0x5\n"
        "\tbeq\t._328\t@cond_branch\n"
        "\tlsl\tr0, r1, #0x10\n"
        "\tasr\tr1, r0, #0x10\n"
        "\tcmp\tr1, #0\n"
        "\tble\t._326\t@cond_branch\n"
        "\tadd\tr0, r7, #1\n"
        "\tlsl\tr0, r0, #0x18\n"
        "\tlsr\tr7, r0, #0x18\n"
        "._326:\n"
        "\tcmp\tr1, #0\n"
        "\tbge\t._327\t@cond_branch\n"
        "\tmov\tr0, r8\n"
        "\tadd\tr0, r0, #0x1\n"
        "\tlsl\tr0, r0, #0x18\n"
        "\tlsr\tr0, r0, #0x18\n"
        "\tmov\tr8, r0\n"
        "._327:\n"
        "\tcmp\tr1, #0\n"
        "\tbne\t._328\t@cond_branch\n"
        "\tadd\tr0, r2, #1\n"
        "\tlsl\tr0, r0, #0x18\n"
        "\tlsr\tr2, r0, #0x18\n"
        "._328:\n"
        "\tlsl\tr0, r4, #0x18\n"
        "\tlsr\tr5, r0, #0x18\n"
        "\tcmp\tr5, #0x5\n"
        "\tbls\t._329\t@cond_branch\n"
        "\tmov\tr0, sp\n"
        "\tmov\tr1, #0x0\n"
        "\tldsh\tr0, [r0, r1]\n"
        "\tcmp\tr0, #0x31\n"
        "\tbgt\t._333\t@cond_branch\n"
        "\tmov\tr0, sp\n"
        "\tldrh\tr0, [r0, #0x2]\n"
        "\tlsl\tr0, r0, #0x10\n"
        "\tasr\tr0, r0, #0x10\n"
        "\tcmp\tr0, #0x31\n"
        "\tbgt\t._333\t@cond_branch\n"
        "\tmov\tr0, sp\n"
        "\tmov\tr4, #0x4\n"
        "\tldsh\tr0, [r0, r4]\n"
        "\tcmp\tr0, #0x31\n"
        "\tbgt\t._333\t@cond_branch\n"
        "\tmov\tr0, sp\n"
        "\tmov\tr1, #0x6\n"
        "\tldsh\tr0, [r0, r1]\n"
        "\tcmp\tr0, #0x31\n"
        "\tbgt\t._333\t@cond_branch\n"
        "\tmov\tr0, sp\n"
        "\tmov\tr4, #0x8\n"
        "\tldsh\tr0, [r0, r4]\n"
        "\tcmp\tr0, #0x31\n"
        "\tble\t._334\t@cond_branch\n"
        "._333:\n"
        "\tldr\tr1, ._336       @ ContestStatsText_GoldPokeBlock\n"
        "\tadd\tr0, r6, #0\n"
        "\tbl\tStringCopy\n"
        "\tmov\tr0, #0xe\n"
        "\tb\t._400\n"
        "._337:\n"
        "\t.align\t2, 0\n"
        "._336:\n"
        "\t.word\tContestStatsText_GoldPokeBlock\n"
        "._334:\n"
        "\tcmp\tr7, #0x4\n"
        "\tbne\t._338\t@cond_branch\n"
        "\tldr\tr1, ._340       @ ContestStatsText_WhitePokeBlock\n"
        "\tadd\tr0, r6, #0\n"
        "\tbl\tStringCopy\n"
        "\tmov\tr0, #0xd\n"
        "\tb\t._400\n"
        "._341:\n"
        "\t.align\t2, 0\n"
        "._340:\n"
        "\t.word\tContestStatsText_WhitePokeBlock\n"
        "._338:\n"
        "\tmov\tr3, #0x0\n"
        "\tmov\tr5, #0x0\n"
        "._343:\n"
        "\tlsl\tr0, r5, #0x1\n"
        "\tadd r0, r0, sp\n"
        "\tmov\tr1, #0x0\n"
        "\tldsh\tr0, [r0, r1]\n"
        "\tcmp\tr0, #0x2\n"
        "\tbne\t._342\t@cond_branch\n"
        "\tadd\tr0, r3, #1\n"
        "\tlsl\tr0, r0, #0x18\n"
        "\tlsr\tr3, r0, #0x18\n"
        "._342:\n"
        "\tadd\tr0, r5, #1\n"
        "\tlsl\tr0, r0, #0x18\n"
        "\tlsr\tr5, r0, #0x18\n"
        "\tcmp\tr5, #0x4\n"
        "\tbls\t._343\t@cond_branch\n"
        "\tcmp\tr3, #0x3\n"
        "\tbeq\t._345\t@cond_branch\n"
        "\tcmp\tr2, #0x5\n"
        "\tbeq\t._345\t@cond_branch\n"
        "\tmov\tr4, r8\n"
        "\tcmp\tr4, #0x4\n"
        "\tbne\t._346\t@cond_branch\n"
        "._345:\n"
        "\tldr\tr1, ._348       @ ContestStatsText_BlackPokeBlock\n"
        "\tadd\tr0, r6, #0\n"
        "\tbl\tStringCopy\n"
        "\tmov\tr0, #0xc\n"
        "\tb\t._400\n"
        "._349:\n"
        "\t.align\t2, 0\n"
        "._348:\n"
        "\t.word\tContestStatsText_BlackPokeBlock\n"
        "._346:\n"
        "\tcmp\tr7, #0x3\n"
        "\tbne\t._350\t@cond_branch\n"
        "\tldr\tr1, ._352       @ ContestStatsText_GrayPokeBlock\n"
        "\tadd\tr0, r6, #0\n"
        "\tbl\tStringCopy\n"
        "\tmov\tr0, #0xb\n"
        "\tb\t._400\n"
        "._353:\n"
        "\t.align\t2, 0\n"
        "._352:\n"
        "\t.word\tContestStatsText_GrayPokeBlock\n"
        "._350:\n"
        "\tcmp\tr7, #0x2\n"
        "\tbeq\t._354\t@cond_branch\n"
        "\tmov\tr0, r8\n"
        "\tcmp\tr0, #0x2\n"
        "\tbne\t._377\t@cond_branch\n"
        "._354:\n"
        "\tmov\tr3, #0x6\n"
        "\tmov\tr2, #0x0\n"
        "\tmov\tr5, #0x0\n"
        "._359:\n"
        "\tlsl\tr0, r5, #0x1\n"
        "\tadd r0, r0, sp\n"
        "\tmov\tr1, #0x0\n"
        "\tldsh\tr0, [r0, r1]\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._358\t@cond_branch\n"
        "\tcmp\tr3, #0x6\n"
        "\tbne\t._357\t@cond_branch\n"
        "\tadd\tr3, r5, #0\n"
        "\tb\t._358\n"
        "._357:\n"
        "\tadd\tr2, r5, #0\n"
        "._358:\n"
        "\tadd\tr0, r5, #1\n"
        "\tlsl\tr0, r0, #0x18\n"
        "\tlsr\tr5, r0, #0x18\n"
        "\tcmp\tr5, #0x4\n"
        "\tbls\t._359\t@cond_branch\n"
        "\tlsl\tr0, r3, #0x1\n"
        "\tmov\tr4, sp\n"
        "\tadd\tr1, r4, r0\n"
        "\tlsl\tr0, r2, #0x1\n"
        "\tadd r0, r0, sp\n"
        "\tmov\tr4, #0x0\n"
        "\tldsh\tr1, [r1, r4]\n"
        "\tmov\tr4, #0x0\n"
        "\tldsh\tr0, [r0, r4]\n"
        "\tcmp\tr1, r0\n"
        "\tblt\t._360\t@cond_branch\n"
        "\tadd\tr2, r3, #0\n"
        "._360:\n"
        "\tcmp\tr2, #0\n"
        "\tbne\t._361\t@cond_branch\n"
        "\tldr\tr1, ._363       @ ContestStatsText_PurplePokeBlock\n"
        "\tadd\tr0, r6, #0\n"
        "\tbl\tStringCopy\n"
        "\tmov\tr0, #0x6\n"
        "\tb\t._400\n"
        "._364:\n"
        "\t.align\t2, 0\n"
        "._363:\n"
        "\t.word\tContestStatsText_PurplePokeBlock\n"
        "._361:\n"
        "\tcmp\tr2, #0x1\n"
        "\tbne\t._365\t@cond_branch\n"
        "\tldr\tr1, ._367       @ ContestStatsText_IndigoPokeBlock\n"
        "\tadd\tr0, r6, #0\n"
        "\tbl\tStringCopy\n"
        "\tmov\tr0, #0x7\n"
        "\tb\t._400\n"
        "._368:\n"
        "\t.align\t2, 0\n"
        "._367:\n"
        "\t.word\tContestStatsText_IndigoPokeBlock\n"
        "._365:\n"
        "\tcmp\tr2, #0x2\n"
        "\tbne\t._369\t@cond_branch\n"
        "\tldr\tr1, ._371       @ ContestStatsText_BrownPokeBlock\n"
        "\tadd\tr0, r6, #0\n"
        "\tbl\tStringCopy\n"
        "\tmov\tr0, #0x8\n"
        "\tb\t._400\n"
        "._372:\n"
        "\t.align\t2, 0\n"
        "._371:\n"
        "\t.word\tContestStatsText_BrownPokeBlock\n"
        "._369:\n"
        "\tcmp\tr2, #0x3\n"
        "\tbne\t._373\t@cond_branch\n"
        "\tldr\tr1, ._375       @ ContestStatsText_LiteBluePokeBlock\n"
        "\tadd\tr0, r6, #0\n"
        "\tbl\tStringCopy\n"
        "\tmov\tr0, #0x9\n"
        "\tb\t._400\n"
        "._376:\n"
        "\t.align\t2, 0\n"
        "._375:\n"
        "\t.word\tContestStatsText_LiteBluePokeBlock\n"
        "._373:\n"
        "\tcmp\tr2, #0x4\n"
        "\tbne\t._377\t@cond_branch\n"
        "\tldr\tr1, ._379       @ ContestStatsText_OlivePokeBlock\n"
        "\tadd\tr0, r6, #0\n"
        "\tbl\tStringCopy\n"
        "\tmov\tr0, #0xa\n"
        "\tb\t._400\n"
        "._380:\n"
        "\t.align\t2, 0\n"
        "._379:\n"
        "\t.word\tContestStatsText_OlivePokeBlock\n"
        "._377:\n"
        "\tcmp\tr7, #0x1\n"
        "\tbeq\t._381\t@cond_branch\n"
        "\tmov\tr0, r8\n"
        "\tcmp\tr0, #0x1\n"
        "\tbne\t._399\t@cond_branch\n"
        "._381:\n"
        "\tmov\tr0, sp\n"
        "\tmov\tr1, #0x0\n"
        "\tldsh\tr0, [r0, r1]\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._383\t@cond_branch\n"
        "\tldr\tr1, ._385       @ ContestStatsText_RedPokeBlock\n"
        "\tadd\tr0, r6, #0\n"
        "\tbl\tStringCopy\n"
        "\tmov\tr0, #0x1\n"
        "\tb\t._400\n"
        "._386:\n"
        "\t.align\t2, 0\n"
        "._385:\n"
        "\t.word\tContestStatsText_RedPokeBlock\n"
        "._383:\n"
        "\tmov\tr0, sp\n"
        "\tldrh\tr0, [r0, #0x2]\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._387\t@cond_branch\n"
        "\tldr\tr1, ._389       @ ContestStatsText_BluePokeBlock\n"
        "\tadd\tr0, r6, #0\n"
        "\tbl\tStringCopy\n"
        "\tmov\tr0, #0x2\n"
        "\tb\t._400\n"
        "._390:\n"
        "\t.align\t2, 0\n"
        "._389:\n"
        "\t.word\tContestStatsText_BluePokeBlock\n"
        "._387:\n"
        "\tmov\tr0, sp\n"
        "\tmov\tr4, #0x4\n"
        "\tldsh\tr0, [r0, r4]\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._391\t@cond_branch\n"
        "\tldr\tr1, ._393       @ ContestStatsText_PinkPokeBlock\n"
        "\tadd\tr0, r6, #0\n"
        "\tbl\tStringCopy\n"
        "\tmov\tr0, #0x3\n"
        "\tb\t._400\n"
        "._394:\n"
        "\t.align\t2, 0\n"
        "._393:\n"
        "\t.word\tContestStatsText_PinkPokeBlock\n"
        "._391:\n"
        "\tmov\tr0, sp\n"
        "\tmov\tr1, #0x6\n"
        "\tldsh\tr0, [r0, r1]\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._395\t@cond_branch\n"
        "\tldr\tr1, ._397       @ ContestStatsText_GreenPokeBlock\n"
        "\tadd\tr0, r6, #0\n"
        "\tbl\tStringCopy\n"
        "\tmov\tr0, #0x4\n"
        "\tb\t._400\n"
        "._398:\n"
        "\t.align\t2, 0\n"
        "._397:\n"
        "\t.word\tContestStatsText_GreenPokeBlock\n"
        "._395:\n"
        "\tmov\tr0, sp\n"
        "\tmov\tr4, #0x8\n"
        "\tldsh\tr0, [r0, r4]\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._399\t@cond_branch\n"
        "\tldr\tr1, ._401       @ ContestStatsText_YellowPokeBlock\n"
        "\tadd\tr0, r6, #0\n"
        "\tbl\tStringCopy\n"
        "\tmov\tr0, #0x5\n"
        "\tb\t._400\n"
        "._402:\n"
        "\t.align\t2, 0\n"
        "._401:\n"
        "\t.word\tContestStatsText_YellowPokeBlock\n"
        "._399:\n"
        "\tldr\tr1, ._403       @ gOtherText_FiveQuestions\n"
        "\tadd\tr0, r6, #0\n"
        "\tbl\tStringCopy\n"
        "\tmov\tr0, #0x0\n"
        "._400:\n"
        "\tadd\tsp, sp, #0x10\n"
        "\tpop\t{r3, r4}\n"
        "\tmov\tr8, r3\n"
        "\tmov\tr9, r4\n"
        "\tpop\t{r4, r5, r6, r7}\n"
        "\tpop\t{r1}\n"
        "\tbx\tr1\n"
        "._404:\n"
        "\t.align\t2, 0\n"
        "._403:\n"
        "\t.word\tgOtherText_FiveQuestions");
}
#endif // NONMATCHING

static void NakaDebug_PrintNum3Chars(u8 * buff, s16 a1)
{
    u8 i;
    s16 divisor;
    s16 quot;
    s16 printZero;

    for (i = 0; i < 4; i++)
        buff[i] = CHAR_SPACE;
    buff[4] = EOS;

    if (a1 == 0)
        buff[3] = CHAR_0;
    else if (a1 > 0)
    {
        divisor = 100;
        printZero = FALSE;
        for (i = 0; i < 3; i++)
        {
            quot = a1 / divisor;
            if (printZero || i == 2 || quot != 0)
            {
                buff[i + 1] = CHAR_0 + quot;
                printZero = TRUE;
            }
            a1 %= divisor;
            divisor /= 10;
        }
    }
    else if (a1 < 0)
    {
        a1 = -a1;
        divisor = 100;
        printZero = FALSE;
        for (i = 0; i < 3; i++)
        {
            quot = a1 / divisor;
            if (printZero || i == 2 || quot != 0)
            {
                buff[i + 1] = CHAR_0 + quot;
                if (!printZero)
                    buff[i] = CHAR_HYPHEN;
                printZero = TRUE;
            }
            a1 %= divisor;
            divisor /= 10;
        }
    }
}

static void SetPokeblock_PrintFlavorValue(u8 a0)
{
    struct Pokeblock *pkblk = &sPokeblock;

    if (a0 == 0)
    {
        NakaDebug_PrintNum3Chars(gStringVar1, pkblk->spicy);
        Menu_PrintText(gStringVar1, 8, 3);
    }
    else if (a0 == 1)
    {
        NakaDebug_PrintNum3Chars(gStringVar1, pkblk->dry);
        Menu_PrintText(gStringVar1, 8, 5);
    }
    else if (a0 == 2)
    {
        NakaDebug_PrintNum3Chars(gStringVar1, pkblk->sweet);
        Menu_PrintText(gStringVar1, 8, 7);
    }
    else if (a0 == 3)
    {
        NakaDebug_PrintNum3Chars(gStringVar1, pkblk->bitter);
        Menu_PrintText(gStringVar1, 8, 9);
    }
    else if (a0 == 4)
    {
        NakaDebug_PrintNum3Chars(gStringVar1, pkblk->sour);
        Menu_PrintText(gStringVar1, 8, 11);
    }
    else if (a0 == 5)
    {
        NakaDebug_PrintNum3Chars(gStringVar1, pkblk->feel);
        Menu_PrintText(gStringVar1, 8, 13);
    }
}

static void SetPokeblock_AdjustFlavor(u8 a0, s8 a1)
{
    struct Pokeblock *pkblk = &sPokeblock;

    if (a0 == 0)
        pkblk->spicy += a1;
    else if (a0 == 1)
        pkblk->dry += a1;
    else if (a0 == 2)
        pkblk->sweet += a1;
    else if (a0 == 3)
        pkblk->bitter += a1;
    else if (a0 == 4)
        pkblk->sour += a1;
    else if (a0 == 5)
        pkblk->feel += a1;
}

static void SetPokeblock_RecomputeAndPrintColor(void)
{
    sPokeblock.color = SetPokeblock_CalcColor(gStringVar1, &sPokeblock);
    Menu_BlankWindowRect(1, 1, 8, 2);
    Menu_PrintText(gStringVar1, 1, 1);
}

static void SetPokeblock_Init(void)
{
    u8 i;

    Menu_DrawStdWindowFrame(0, 0, 12, 15);
    SetPokeblock_RecomputeAndPrintColor();
    Menu_PrintText(gContestStatsText_Spicy, 2, 3);
    Menu_PrintText(gContestStatsText_Dry, 2, 5);
    Menu_PrintText(gContestStatsText_Sweet, 2, 7);
    Menu_PrintText(gContestStatsText_Bitter, 2, 9);
    Menu_PrintText(gContestStatsText_Sour, 2, 11);
    Menu_PrintText(gContestStatsText_Tasty, 2, 13);

    for (i = 0; i < 6; i++)
        SetPokeblock_PrintFlavorValue(i);

    InitMenu(0, 1, 3, 6, 0, 11);
}

static void SetPokeblock_GivePokeblock(void)
{
    struct Pokeblock * pkblk = &sPokeblock;
    u8 rval = 0;
    u8 i;

    if (pkblk->color == PBLOCK_CLR_BLACK)
    {
        if (pkblk->spicy == 2)
            rval++;

        if (pkblk->sweet == 2)
            rval++;

        if (pkblk->bitter == 2)
            rval++;

        if (pkblk->dry == 2)
            rval++;

        if (pkblk->sour == 2)
            rval++;

        if (rval != 3)
        {
            pkblk->spicy = 2;
            pkblk->sweet = 2;
            pkblk->bitter = 2;
        }
    }

    GivePokeblock(pkblk);
    SetPokeblock_RecomputeAndPrintColor();

    for (i = 0; i < 6; i++)
        SetPokeblock_PrintFlavorValue(i);
}

static bool8 SetPokeblock_HandleJoypad(void)
{
    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        Menu_MoveCursor(-1);
        return FALSE;
    }

    if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        Menu_MoveCursor(+1);
        return FALSE;
    }

    if (gMain.newAndRepeatedKeys & DPAD_LEFT)
    {
        SetPokeblock_AdjustFlavor(Menu_GetCursorPos(), -1);
        SetPokeblock_PrintFlavorValue(Menu_GetCursorPos());
        SetPokeblock_RecomputeAndPrintColor();
        return FALSE;
    }

    if (gMain.newAndRepeatedKeys & DPAD_RIGHT)
    {
        SetPokeblock_AdjustFlavor(Menu_GetCursorPos(), +1);
        SetPokeblock_PrintFlavorValue(Menu_GetCursorPos());
        SetPokeblock_RecomputeAndPrintColor();
        return FALSE;
    }

    if (gMain.newKeys & A_BUTTON)
    {
        SetPokeblock_GivePokeblock();
        PlaySE(SE_SELECT);
        return FALSE;
    }

    if (gMain.newKeys & B_BUTTON)
    {
        Menu_EraseWindowRect(0, 0, 29, 19);
        CloseMenu();
        return TRUE;
    }

    return FALSE;
}

static bool8 SetPokeblock(void)
{
    Menu_EraseWindowRect(0, 0, 29, 19);
    SetPokeblock_Init();
    gMenuCallback = SetPokeblock_HandleJoypad;
    return FALSE;
}

// =======================================================
// EFFORT VALUES
// =======================================================

EWRAM_DATA u8 sEVTest_CursorPosition = 0;

static const u8 Str_843E5F2[] = _("HP　どりょくち");
static const u8 Str_843E5FB[] = _("こうげき　どりょくち");
static const u8 Str_843E606[] = _("ぼうぎょ　どりょくち");
static const u8 Str_843E611[] = _("すばやさ　どりょくち");
static const u8 Str_843E61C[] = _("とくこう　どりょくち");
static const u8 Str_843E627[] = _("とくぼう　どりょくち");
static const u8 Str_843E632[] = _("なつきど");
static const u8 Str_843E637[] = _("どりょくち　ごうけい");

static void EVTest_Init(void)
{
    Menu_DrawStdWindowFrame(0, 0, 22, 19);
    Menu_PrintText(gOtherText_Slash, 11, 1);
    Menu_PrintText(Str_843E5F2, 2, 3);
    Menu_PrintText(Str_843E5FB, 2, 5);
    Menu_PrintText(Str_843E606, 2, 7);
    Menu_PrintText(Str_843E611, 2, 9);
    Menu_PrintText(Str_843E61C, 2, 11);
    Menu_PrintText(Str_843E627, 2, 13);
    Menu_PrintText(Str_843E637, 2, 15);
    Menu_PrintText(Str_843E632, 2, 17);
}

static void EVTest_PrintMonData(struct Pokemon *pokemon)
{
    u16 evTotal;
    u16 curEv;

    Menu_BlankWindowRect(1, 1, 10, 2);
    GetMonData(pokemon, MON_DATA_NICKNAME, gStringVar1);
    Menu_PrintText(gStringVar1, 1, 1);

    Menu_BlankWindowRect(12, 1, 21, 2);
    Menu_PrintText(gSpeciesNames[GetMonData(pokemon, MON_DATA_SPECIES)], 12, 1);

    curEv = GetMonData(pokemon, MON_DATA_HP_EV);
    evTotal = curEv;
    ConvertIntToDecimalStringN(gStringVar1, curEv, STR_CONV_MODE_LEFT_ALIGN, 5);
    Menu_BlankWindowRect(13, 3, 17, 4);
    Menu_PrintText(gStringVar1, 13, 3);

    curEv = GetMonData(pokemon, MON_DATA_ATK_EV);
    evTotal += curEv;
    ConvertIntToDecimalStringN(gStringVar1, curEv, STR_CONV_MODE_LEFT_ALIGN, 5);
    Menu_BlankWindowRect(13, 5, 17, 6);
    Menu_PrintText(gStringVar1, 13, 5);

    curEv = GetMonData(pokemon, MON_DATA_DEF_EV);
    evTotal += curEv;
    ConvertIntToDecimalStringN(gStringVar1, curEv, STR_CONV_MODE_LEFT_ALIGN, 5);
    Menu_BlankWindowRect(13, 7, 17, 8);
    Menu_PrintText(gStringVar1, 13, 7);

    curEv = GetMonData(pokemon, MON_DATA_SPEED_EV);
    evTotal += curEv;
    ConvertIntToDecimalStringN(gStringVar1, curEv, STR_CONV_MODE_LEFT_ALIGN, 5);
    Menu_BlankWindowRect(13, 9, 17, 10);
    Menu_PrintText(gStringVar1, 13, 9);

    curEv = GetMonData(pokemon, MON_DATA_SPATK_EV);
    evTotal += curEv;
    ConvertIntToDecimalStringN(gStringVar1, curEv, STR_CONV_MODE_LEFT_ALIGN, 5);
    Menu_BlankWindowRect(13, 11, 17, 12);
    Menu_PrintText(gStringVar1, 13, 11);

    curEv = GetMonData(pokemon, MON_DATA_SPDEF_EV);
    evTotal += curEv;
    ConvertIntToDecimalStringN(gStringVar1, curEv, STR_CONV_MODE_LEFT_ALIGN, 5);
    Menu_BlankWindowRect(13, 13, 17, 14);
    Menu_PrintText(gStringVar1, 13, 13);

    ConvertIntToDecimalStringN(gStringVar1, evTotal, STR_CONV_MODE_LEFT_ALIGN, 5);
    Menu_BlankWindowRect(13, 15, 17, 16);
    Menu_PrintText(gStringVar1, 13, 15);

    ConvertIntToDecimalStringN(gStringVar1, GetMonData(pokemon, MON_DATA_FRIENDSHIP), STR_CONV_MODE_LEFT_ALIGN, 5);
    Menu_BlankWindowRect(13, 17, 17, 18);
    Menu_PrintText(gStringVar1, 13, 17);
}

static void EVTest_MovePartyCursor(s8 a0)
{
    s16 i;
    if (a0 == -1)
    {
        if (sEVTest_CursorPosition == 0)
        {
            for (i = 5; i >= 0; i--)
            {
                if (GetMonData(gPlayerParty + i, MON_DATA_SPECIES) != SPECIES_NONE)
                {
                    sEVTest_CursorPosition = i;
                    return;
                }
            }
        }
        sEVTest_CursorPosition += a0;
        return;
    }

    if (a0 == 1)
    {
        sEVTest_CursorPosition += a0;
        if (sEVTest_CursorPosition == 6)
            sEVTest_CursorPosition = 0;
        else if (GetMonData(gPlayerParty + sEVTest_CursorPosition, MON_DATA_SPECIES) == SPECIES_NONE)
            sEVTest_CursorPosition = 0;
    }
}

static bool8 EVTest_HandleJoypad(void)
{
    if (gMain.newKeys & DPAD_LEFT)
    {
        EVTest_MovePartyCursor(-1);
        EVTest_PrintMonData(gPlayerParty + sEVTest_CursorPosition);
        return FALSE;
    }

    if (gMain.newKeys & DPAD_RIGHT)
    {
        EVTest_MovePartyCursor(+1);
        EVTest_PrintMonData(gPlayerParty + sEVTest_CursorPosition);
        return FALSE;
    }

    if (gMain.newKeys & B_BUTTON)
    {
        Menu_EraseWindowRect(0, 0, 29, 19);
        CloseMenu();
        return TRUE;
    }

    return FALSE;
}

bool8 DebugMenu_EffortValues(void)
{
    Menu_EraseWindowRect(0, 0, 29, 19);
    sEVTest_CursorPosition = 0;
    EVTest_Init();
    EVTest_PrintMonData(gPlayerParty + 0);
    gMenuCallback = EVTest_HandleJoypad;
    return FALSE;
}

// =======================================================
// RNG Test
// =======================================================

EWRAM_DATA u16 sRngLeft = 0;
EWRAM_DATA u16 sRngRight = 0;
EWRAM_DATA u16 sNumSamples = 0;
EWRAM_DATA u16 sRngMax = 0;

static const u8 Str_843E642[] = _("ここから");
static const u8 Str_843E647[] = _("ここまで");
static const u8 Str_843E64C[] = _("かいすう");
static const u8 Str_843E651[] = _("けっか");
static const u8 Str_843E655[] = _("かい");
static const u8 Str_843E658[] = _("0");
static const u8 Str_843E65A[] = _("はんい");

static u16 EVTest_GetDiscreteUniformRandomSamples(void)
{
    u16 sampCount = 0;
    u16 left;
    u16 right;
    u32 i;

    if (sRngLeft <= sRngRight)
    {
        left = sRngLeft;
        right = sRngRight;
    }
    else
    {
        left = sRngRight;
        right = sRngLeft;
    }

    for (i = 0; i < sNumSamples; i++)
    {
        u16 r0 = Random() % sRngMax;
        if (r0 >= left && r0 <= right)
            sampCount++;
    }

    return sampCount;
}

static void RNGTest_Init(void)
{
    Menu_DrawStdWindowFrame(0, 0, 15, 11);
    Menu_PrintText(Str_843E642, 2, 1);
    Menu_PrintText(Str_843E647, 2, 3);
    Menu_PrintText(Str_843E65A, 2, 5);
    Menu_PrintText(Str_843E64C, 2, 7);
    Menu_PrintText(Str_843E651, 2, 9);
    Menu_PrintText(Str_843E655, 13, 9);
    Menu_PrintText(Str_843E658, 12, 1);
    Menu_PrintText(Str_843E658, 12, 3);
    Menu_PrintText(Str_843E658, 12, 5);
    Menu_PrintText(Str_843E658, 12, 7);
    Menu_PrintText(Str_843E658, 12, 9);
    InitMenu(0, 1, 1, 4, 0, 14);
}

static void RNGTest_PrintNum(u16 a0)
{
    ConvertIntToDecimalStringN(gStringVar1, a0, STR_CONV_MODE_RIGHT_ALIGN, 5);
    Menu_PrintText(gStringVar1, 8, 9);
}

static void RNGTest_AdjustAndPrintNumAtLine(u16 * a0, s8 a1, u8 a2)
{
    *a0 += a1;
    ConvertIntToDecimalStringN(gStringVar1, *a0, STR_CONV_MODE_RIGHT_ALIGN, 5);
    Menu_PrintText(gStringVar1, 8, a2);
}

static bool8 RNGTest_HandleJoypad(void)
{
    s8 r5 = gMain.heldKeys & R_BUTTON ? 100 : 1;
    s8 r4;

    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        Menu_MoveCursor(-1);
        return FALSE;
    }

    if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        Menu_MoveCursor(+1);
        return FALSE;
    }

    if (gMain.newAndRepeatedKeys & DPAD_LEFT)
    {
        r4 = Menu_GetCursorPos();
        if (r4 == 0)
            RNGTest_AdjustAndPrintNumAtLine(&sRngLeft, -r5, 1);
        if (r4 == 1)
            RNGTest_AdjustAndPrintNumAtLine(&sRngRight, -r5, 3);
        if (r4 == 2)
            RNGTest_AdjustAndPrintNumAtLine(&sRngMax, -r5, 5);
        if (r4 == 3)
            RNGTest_AdjustAndPrintNumAtLine(&sNumSamples, -r5, 7);
        return FALSE;
    }

    if (gMain.newAndRepeatedKeys & DPAD_RIGHT)
    {
        r4 = Menu_GetCursorPos();
        if (r4 == 0)
            RNGTest_AdjustAndPrintNumAtLine(&sRngLeft, r5, 1);
        if (r4 == 1)
            RNGTest_AdjustAndPrintNumAtLine(&sRngRight, r5, 3);
        if (r4 == 2)
            RNGTest_AdjustAndPrintNumAtLine(&sRngMax, r5, 5);
        if (r4 == 3)
            RNGTest_AdjustAndPrintNumAtLine(&sNumSamples, r5, 7);
        return FALSE;
    }

    if (gMain.newKeys & A_BUTTON)
    {
        if (sRngMax != 0)
        {
            PlaySE(SE_SELECT);
            RNGTest_PrintNum(EVTest_GetDiscreteUniformRandomSamples());
        }
        return FALSE;
    }

    if (gMain.newKeys & B_BUTTON)
    {
        Menu_EraseWindowRect(0, 0, 29, 19);
        CloseMenu();
        return TRUE;
    }

    return FALSE;
}

bool8 DebugMenu_RandomNumberTest(void)
{
    sRngLeft = 0;
    sRngRight = 0;
    sRngMax = 0;
    sNumSamples = 0;
    Menu_EraseWindowRect(0, 0, 29, 19);
    RNGTest_Init();
    gMenuCallback = RNGTest_HandleJoypad;
    return FALSE;
}

#endif // DEBUG
