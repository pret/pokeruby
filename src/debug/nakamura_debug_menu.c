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

typedef bool8 (*MenuFunc)(void);

EWRAM_DATA u8 _nakamuraData0 = 0;
EWRAM_DATA u8 _nakamuraData1 = 0;
EWRAM_DATA u8 _nakamuraData2 = 0;
EWRAM_DATA u8 _nakamuraData3 = 0;
EWRAM_DATA u8 _nakamuraData4 = 0;
EWRAM_DATA u8 _nakamuraData5 = 0;
EWRAM_DATA u16 _nakamuraData6 = 0;
EWRAM_DATA u16 _nakamuraData8 = 0;
EWRAM_DATA u16 _nakamuraDataA = 0;
EWRAM_DATA u16 _nakamuraDataC = 0;

static struct {
    s16 species;
    s8 level;
    u8 unk3;
} _nakamuraStatic0[PARTY_SIZE];
static struct Pokeblock _nakamuraStatic18;

asm(".global _nakamuraStatic0");
asm(".global _nakamuraStatic18");

bool8 debug_sub_815F214(void);
bool8 debug_sub_815F2B4(void);
bool8 debug_sub_815F2F4(void);
bool8 debug_sub_815F62C(void);
bool8 debug_sub_815FA38(void);
bool8 debug_sub_815FB1C(void);
bool8 debug_sub_815FBE8(void);
bool8 debug_sub_815FC54(void);
bool8 debug_sub_815FC94(void);
bool8 debug_sub_815FE1C(void);
void debug_sub_816009C(u8);
void debug_sub_81600D0(u8);
void debug_sub_816013C(u8);
void debug_sub_81603B8(u8);
bool8 debug_sub_8160498(void);
u8 debug_sub_816062C(u8);
bool8 debug_sub_8160D98(void);

const u8 Str_843E36C[] = _("Berries");
const u8 Str_843E374[] = _("Goods");
const u8 Str_843E37A[] = _("{PKMN} list");
const u8 Str_843E382[] = _("トラップ");
const u8 Str_843E387[] = _("Move your base");
const u8 Str_843E396[] = _("Moving {PKMN}");
const u8 Str_843E3A0[] = _("Fishing points");
const u8 Str_843E3AF[] = _("Set {POKEBLOCK}");
const u8 Str_843E3B9[] = _("Make bases(to max)");
const u8 Str_843E3CC[] = _("Base location");

const struct MenuAction _843E3DC[] = {
	{ Str_843E36C, debug_sub_815FC54 },
	{ Str_843E37A, debug_sub_815F2B4 },
	{ Str_843E374, debug_sub_815FC94 },
	{ Str_843E387, debug_sub_815FB1C },
	{ Str_843E3B9, debug_sub_815F2F4 },
	{ Str_843E3CC, debug_sub_815F62C },
	{ Str_843E396, debug_sub_815FBE8 },
	{ Str_843E3A0, debug_sub_815FE1C },
	{ Str_843E3AF, debug_sub_8160D98 },
};

const u8 _843E424[] = {
        1,   118,    47,    14 ,
        2,   125,    53,    10 ,
        3,   113,    49,     8 ,
      0xB,   118,    67,     6 ,
      0xC,   121,    40,    11 ,
      0xD,   111,    35,     1 ,
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

const u8 Str_843E550[] = _("R");
const u8 Str_843E552[] = _("X");
const u8 Str_843E554[] = _("Y");
const u8 Str_843E556[] = _(
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
const u8 Str_843E574[] = _("ー");
const u8 Str_843E576[][2] = {
    _("あ"),
    _("ア"),
    _("A"),
    _("a"),
    _("0")
};
const u8 Str_843E580[] = _(
    "ADD\n"
    "DEL\n"
    "EXIT");
const u8 Str_843E58D[] = _(
    "Fishing location R119\n"
    " Y1\n"
    " Y2\n"
    " Y3\n"
    "Encounter location\n"
    "\n"
    "\n"
    "front of you");
const u8 _843E5D1[] = {0x0F, 0x16, 0x19};
const u8 Str_843E5D4[] = _(
    "Aボタン　{ESCAPE}\p"
    "　　Bボタン　ー\n"
    "START　けってい");

const u8 Str_843E5F0[] = _("？");
const u8 Str_843E5F2[] = _("HP　どりょくち");
const u8 Str_843E5FB[] = _("こうげき　どりょくち");
const u8 Str_843E606[] = _("ぼうぎょ　どりょくち");
const u8 Str_843E611[] = _("すばやさ　どりょくち");
const u8 Str_843E61C[] = _("とくこう　どりょくち");
const u8 Str_843E627[] = _("とくぼう　どりょくち");
const u8 Str_843E632[] = _("なつきど");
const u8 Str_843E637[] = _("どりょくち　ごうけい");
const u8 Str_843E642[] = _("ここから");
const u8 Str_843E647[] = _("ここまで");
const u8 Str_843E64C[] = _("かいすう");
const u8 Str_843E651[] = _("けっか");
const u8 Str_843E655[] = _("かい");
const u8 Str_843E658[] = _("0");
const u8 Str_843E65A[] = _("はんい");

void debug_sub_815F1B8(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(14, 0, 29, 19);
    Menu_PrintItems(16, 1, ARRAY_COUNT(_843E3DC), _843E3DC);
    InitMenu(0, 15, 1, ARRAY_COUNT(_843E3DC), 0, 14);
}

bool8 InitNakamuraDebugMenu(void)
{
    debug_sub_815F1B8();
    gMenuCallback = debug_sub_815F214;
    return FALSE;
}

bool8 debug_sub_815F214(void)
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
        MenuFunc func = _843E3DC[Menu_GetCursorPos()].func;
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

void debug_sub_815F284(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        debug_sub_81381B4();
        OpenPartyMenu(5, 0);
        DestroyTask(taskId);
    }
}

bool8 debug_sub_815F2B4(void)
{
    CloseMenu();
    Menu_EraseScreen();
    gMain.savedCallback = sub_805469C;
    CreateTask(debug_sub_815F284, 0);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
    return TRUE;
}

bool8 debug_sub_815F2F4(void)
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
                gSaveBlock1.secretBases[i].secretBaseId = _843E424[(Random() % (ARRAY_COUNT(_843E424) / 4)) * 4];

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

void debug_sub_815F470(u8 * a0, u8 * a1, u8 * a2)
{
    u8 i;
    u8 sbId = gSaveBlock1.secretBases[_nakamuraData0].secretBaseId;

    for (i = 0; i < ARRAY_COUNT(_843E424) / 4; i++)
    {
        if (_843E424[i * 4] == sbId)
        {
            *a0 = _843E424[i * 4 + 1];
            *a1 = _843E424[i * 4 + 2];
            *a2 = _843E424[i * 4 + 3];
            break;
        }
    }
}

void debug_sub_815F4D8(void)
{
    Menu_BlankWindowRect(1, 1, 10, 10);
    ConvertIntToDecimalStringN(gStringVar1, _nakamuraData0, STR_CONV_MODE_LEFT_ALIGN, 2);
    Menu_PrintText(gStringVar1, 1, 1);

    if (gSaveBlock1.secretBases[_nakamuraData0].secretBaseId != 0)
    {
        u8 a0;
        u8 a1;
        u8 a2;
        debug_sub_815F470(&a0, &a1, &a2);

        sub_80BC190(gStringVar1, _nakamuraData0);
        Menu_PrintText(gStringVar1, 1, 3);

        Menu_PrintText(Str_843E550, 1, 5);
        ConvertIntToDecimalStringN(gStringVar1, a0, STR_CONV_MODE_LEFT_ALIGN, 3);
        Menu_PrintText(gStringVar1, 2, 5);

        Menu_PrintText(Str_843E552, 1, 7);
        ConvertIntToDecimalStringN(gStringVar1, a1, STR_CONV_MODE_LEFT_ALIGN, 3);
        Menu_PrintText(gStringVar1, 3, 7);

        Menu_PrintText(Str_843E554, 1, 9);
        ConvertIntToDecimalStringN(gStringVar1, a2, STR_CONV_MODE_LEFT_ALIGN, 3);
        Menu_PrintText(gStringVar1, 3, 9);
    }
}

bool8 debug_sub_815F5C4(void)
{
    if (gMain.newKeys & DPAD_LEFT)
    {
        if (_nakamuraData0 == 0)
            _nakamuraData0 = 19;
        else
            _nakamuraData0--;
        debug_sub_815F4D8();
        return FALSE;
    }

    if (gMain.newKeys & DPAD_RIGHT)
    {
        if (_nakamuraData0 == 19)
            _nakamuraData0 = 0;
        else
            _nakamuraData0++;
        debug_sub_815F4D8();
        return FALSE;
    }

    if (gMain.newKeys & B_BUTTON)
    {
        CloseMenu();
        return TRUE;
    }

    return FALSE;
}

bool8 debug_sub_815F62C(void)
{
    _nakamuraData0 = 0;
    gMenuCallback = debug_sub_815F5C4;
    Menu_EraseWindowRect(0, 0, 29, 19);
    Menu_DrawStdWindowFrame(0, 0, 11, 11);
    debug_sub_815F4D8();
    return FALSE;
}

void debug_sub_815F668(void)
{
    u8 * otIdPtr = gSaveBlock1.secretBases[_nakamuraData0].trainerId;
    u32 otId = (otIdPtr[3] << 24) | (otIdPtr[2] << 16) | (otIdPtr[1] << 8) | (otIdPtr[0] << 0);
    ConvertIntToDecimalStringN(gStringVar1, otId / 100000, STR_CONV_MODE_LEADING_ZEROS, 5);
    Menu_PrintText(gStringVar1, 2, 7);
    ConvertIntToDecimalStringN(gStringVar1, otId % 100000, STR_CONV_MODE_LEADING_ZEROS, 5);
    Menu_PrintText(gStringVar1, 7, 7);
}

void debug_sub_815F6E4(void)
{
    Menu_BlankWindowRect(2, 3, 11, 4);
    *StringCopyN(gStringVar1, gSaveBlock1.secretBases[_nakamuraData0].playerName, 7) = EOS;
    Menu_PrintText(gStringVar1, 2, 3);
}

void debug_sub_815F72C(void)
{
    Menu_BlankWindowRect(2, 1, 11, 10);

    ConvertIntToDecimalStringN(gStringVar1, _nakamuraData0, STR_CONV_MODE_LEFT_ALIGN, 2);
    Menu_PrintText(gStringVar1, 2, 1);

    if (gSaveBlock1.secretBases[_nakamuraData0].secretBaseId != 0)
    {
        debug_sub_815F6E4();
        debug_sub_815F668();
    }
}

void debug_sub_815F788(void)
{
    Menu_BlankWindowRect(2, 5, 11, 6);
    Menu_PrintText(Str_843E574, _nakamuraData2 + 2, 5);
}

void debug_sub_815F7B4(void)
{
    if (_nakamuraData1)
        Menu_BlankWindowRect(11, 1, 11, 2);
    else
        Menu_PrintText(Str_843E576[_nakamuraData3], 11, 1);
}

void debug_sub_815F7F0(s8 a0)
{
    u8 * otIdPtr = gSaveBlock1.secretBases[_nakamuraData0].trainerId;
    u32 otId = (otIdPtr[3] << 24) | (otIdPtr[2] << 16) | (otIdPtr[1] << 8) | (otIdPtr[0] << 0);
    s8 r4;
    int r1 = a0;

    for (r4 = 9; r4 > _nakamuraData2; r4--)
        r1 *= 10;

    otId += r1;
    otIdPtr[3] = (otId & 0xFF000000) >> 24;
    otIdPtr[2] = (otId & 0x00FF0000) >> 16;
    otIdPtr[1] = (otId & 0x0000FF00) >> 8;
    otIdPtr[0] = (otId & 0x000000FF) >> 0;
    debug_sub_815F668();
}

void debug_sub_815F86C(s8 a0)
{
    u8 * namePtr = gSaveBlock1.secretBases[_nakamuraData0].playerName;
    u8 r2 = 0;
    u8 r3 = 0;
    u8 i;

    if (a0 == 100)
    {
        for (i = _nakamuraData2; i < 7; i++)
        {
            namePtr[i] = EOS;
        }
    }
    else
    {
        switch (_nakamuraData3)
        {
            case 0:
                r3 = 1;
                r2 = 80;
                break;
            case 1:
                r3 = 81;
                r2 = 160;
                break;
            case 2:
                r3 = CHAR_A;
                r2 = CHAR_Z;
                break;
            case 3:
                r3 = CHAR_a;
                r2 = CHAR_z;
                break;
            case 4:
                r3 = CHAR_0;
                r2 = CHAR_0 + 9;
                break;
        }

        namePtr[_nakamuraData2] += a0;
        if (namePtr[_nakamuraData2] < r3)
            namePtr[_nakamuraData2] = r2;
        if (namePtr[_nakamuraData2] > r2)
            namePtr[_nakamuraData2] = r3;
    }
    debug_sub_815F6E4();
}

bool8 debug_sub_815F930(void)
{
    u32 r4 = _nakamuraData1 == 0 ? 7 : 10;

    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        if (_nakamuraData1)
            debug_sub_815F7F0(1);
        else
            debug_sub_815F86C(1);
        return FALSE;
    }

    if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        if (_nakamuraData1)
            debug_sub_815F7F0(-1);
        else
            debug_sub_815F86C(-1);
        return FALSE;
    }

    if (gMain.newAndRepeatedKeys & DPAD_LEFT)
    {
        if (_nakamuraData2 == 0)
            _nakamuraData2 = r4 - 1;
        else
            _nakamuraData2--;
        debug_sub_815F788();
        return FALSE;
    }

    if (gMain.newAndRepeatedKeys & DPAD_RIGHT)
    {
        if (_nakamuraData2 == r4 - 1)
            _nakamuraData2 = 0;
        else
            _nakamuraData2++;
        debug_sub_815F788();
        return FALSE;
    }

    if (gMain.newKeys & SELECT_BUTTON)
    {
        if (_nakamuraData1 == 0)
            _nakamuraData3 = (_nakamuraData3 + 1) % 5;
        debug_sub_815F7B4();
        return FALSE;
    }

    if (gMain.newKeys & A_BUTTON)
    {
        Menu_BlankWindowRect(2, 5, 11, 6);
        Menu_BlankWindowRect(11, 1, 11, 2);
        gMenuCallback = debug_sub_815FA38;
        return FALSE;
    }

    if (gMain.newKeys & B_BUTTON)
    {
        if (_nakamuraData1 == 0)
            debug_sub_815F86C(100);
        return FALSE;
    }

    return FALSE;
}

bool8 debug_sub_815FA38(void)
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
        if (_nakamuraData0 == 0)
            _nakamuraData0 = 19;
        else
            _nakamuraData0--;
        debug_sub_815F72C();
        return FALSE;
    }

    if (gMain.newKeys & DPAD_RIGHT)
    {
        if (_nakamuraData0 == 19)
            _nakamuraData0 = 0;
        else
            _nakamuraData0++;
        debug_sub_815F72C();
        return FALSE;
    }

    if (gMain.newKeys & A_BUTTON)
    {
        if (_nakamuraData0 != 0 && gSaveBlock1.secretBases[_nakamuraData0].secretBaseId != 0)
        {
            _nakamuraData1 = Menu_GetCursorPos();
            _nakamuraData2 = 0;
            debug_sub_815F788();
            debug_sub_815F7B4();
            gMenuCallback = debug_sub_815F930;
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

bool8 debug_sub_815FB1C(void)
{
    _nakamuraData0 = 0;
    _nakamuraData3 = 0;
    gMenuCallback = debug_sub_815FA38;
    Menu_EraseWindowRect(0, 0, 29, 19);
    Menu_DrawStdWindowFrame(0, 0, 12, 11);
    debug_sub_815F72C();
    InitMenu(0, 1, 3, 3, 0, 11);
    return FALSE;
}

bool8 debug_sub_815FB78(void)
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
                debug_sub_814A714();
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

bool8 debug_sub_815FBE8(void)
{
    gMenuCallback = debug_sub_815FB78;
    Menu_EraseWindowRect(0, 0, 29, 19);
    debug_sub_814A73C(gStringVar1);
    Menu_DrawStdWindowFrame(0, 0, 11, 9);
    Menu_PrintText(gStringVar1, 1, 1);
    Menu_PrintText(Str_843E580, 2, 3);
    InitMenu(0, 1, 3, 3, 0, 10);
    return FALSE;
}

bool8 debug_sub_815FC54(void)
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

bool8 debug_sub_815FC94(void)
{
    ClearDecorationInventories();
    debug_sub_814A3A8();
    Menu_EraseWindowRect(0, 0, 29, 19);
    CloseMenu();
    return TRUE;
}

u16 debug_sub_815FCB4(u8 a0)
{
    u16 retval = 0;
    u16 height = gMapHeader.mapData->height / 3;
    u16 r6;
    u16 r4;
    u16 start = height * a0;

    for (r6 = start; r6 < start + height; r6++)
    {
        for (r4 = 0; r4 < gMapHeader.mapData->width; r4++)
        {
            if (sub_805759C(MapGridGetMetatileBehaviorAt(r4 + 7, r6 + 7)) == TRUE)
            {
                retval++;
            }
        }
    }

    return retval;
}

u16 debug_sub_815FD40(void)
{
    u16 retval = 0;
    s16 x;
    s16 y;
    u16 xx;
    u16 yy;

    GetXYCoordsOneStepInFrontOfPlayer(&x, &y);
    x -= 7;
    y -= 7;

    for (yy = 0; yy < gMapHeader.mapData->height; yy++)
    {
        for (xx = 0; xx < gMapHeader.mapData->width; xx++)
        {
            if (sub_805759C(MapGridGetMetatileBehaviorAt(xx + 7, yy + 7)) == TRUE)
            {
                retval++;
                if (x == xx && y == yy)
                    return retval;
            }
        }
    }
    return retval + 1;
}

bool8 debug_sub_815FDE4(void)
{
    if (gMain.newKeys & A_BUTTON || gMain.newKeys & B_BUTTON)
    {
        Menu_EraseWindowRect(0, 0, 29, 19);
        CloseMenu();
        return TRUE;
    }

    return FALSE;
}

bool8 debug_sub_815FE1C(void)
{
    u16 r7;
    u16 r5;

    Menu_EraseWindowRect(0, 0, 29, 19);
    Menu_DrawStdWindowFrame(0, 0, 16, 19);
    Menu_PrintText(Str_843E58D, 1, 1);

    ConvertIntToDecimalStringN(gStringVar1, debug_sub_815FCB4(0), STR_CONV_MODE_RIGHT_ALIGN, 5);
    Menu_PrintText(gStringVar1, 5, 3);

    ConvertIntToDecimalStringN(gStringVar1, debug_sub_815FCB4(1), STR_CONV_MODE_RIGHT_ALIGN, 5);
    Menu_PrintText(gStringVar1, 5, 5);

    ConvertIntToDecimalStringN(gStringVar1, debug_sub_815FCB4(2), STR_CONV_MODE_RIGHT_ALIGN, 5);
    Menu_PrintText(gStringVar1, 5, 7);

    ConvertIntToDecimalStringN(gStringVar1, debug_sub_8092344(0), STR_CONV_MODE_RIGHT_ALIGN, 5);
    Menu_PrintText(gStringVar1, 11, 3);

    ConvertIntToDecimalStringN(gStringVar1, debug_sub_8092344(1), STR_CONV_MODE_RIGHT_ALIGN, 5);
    Menu_PrintText(gStringVar1, 11, 5);

    ConvertIntToDecimalStringN(gStringVar1, debug_sub_8092344(2), STR_CONV_MODE_RIGHT_ALIGN, 5);
    Menu_PrintText(gStringVar1, 11, 7);

    FeebasSeedRng(gSaveBlock1.easyChatPairs[0].unk2);
    r7 = debug_sub_815FCB4(0) + debug_sub_815FCB4(1) + debug_sub_815FCB4(2);
    r5 = 0;

    while (r5 != 6)
    {
        u16 r1 = FeebasRandom() % r7;
        if (r1 == 0)
            r1 = r7;
        if (r1 == 0 || r1 > 3)
        {
            ConvertIntToDecimalStringN(gStringVar1, r1, STR_CONV_MODE_RIGHT_ALIGN, 4);
            Menu_PrintText(gStringVar1, (r5 % 3) * 5 + 2, (r5 / 3) * 2 + 11);
            r5++;
        }
    }

    ConvertIntToDecimalStringN(gStringVar1, debug_sub_815FD40(), STR_CONV_MODE_RIGHT_ALIGN, 4);
    Menu_PrintText(gStringVar1, 2, 17);

    gMenuCallback = debug_sub_815FDE4;

    return FALSE;
}

void debug_sub_815FFDC(void)
{
    u8 i;

    Menu_DrawStdWindowFrame(14, 0, 29, 13);
    Menu_DrawStdWindowFrame(0, 14, 29, 19);
    Menu_PrintText(Str_843E5D4, 1, 15);

    for (i = 0; i < PARTY_SIZE; i++)
    {
        _nakamuraStatic0[i].species = GetMonData(gPlayerParty + i, MON_DATA_SPECIES);
        if (_nakamuraStatic0[i].species != SPECIES_NONE)
        {
            _nakamuraStatic0[i].level = GetMonData(gPlayerParty + i, MON_DATA_LEVEL);
            debug_sub_816009C(i);
            debug_sub_81600D0(i);
            debug_sub_816013C(i);
        }
        else
            _nakamuraStatic0[i].level = 1;
        _nakamuraStatic0[i].unk3 = 0;
    }

    _nakamuraData4 = 0;
    PrintTriangleCursorWithPalette(15, 1, 0xFF);
    gMenuCallback = debug_sub_8160498;
}

void debug_sub_816009C(u8 i)
{
    Menu_PrintText(gSpeciesNames[_nakamuraStatic0[i].species], 16, 2 * i + 1);
}

void debug_sub_81600D0(u8 i)
{
    // u8 sp0[] = _("？");

    u8 sp0[2];
    u8 gender;

    memcpy(sp0, Str_843E5F0, sizeof Str_843E5F0);
    gender = GetMonGender(gPlayerParty + i);
    if (gender == MON_MALE)
        Menu_PrintText(gOtherText_MaleSymbol2, 23, 2 * i + 1);
    else if (gender == MON_FEMALE)
        Menu_PrintText(gOtherText_FemaleSymbolAndLv, 23, 2 * i + 1);
    else
        Menu_PrintText(sp0, 23, 2 * i + 1);
}

void debug_sub_816013C(u8 i)
{
    ConvertIntToDecimalStringN(gStringVar1, _nakamuraStatic0[i].level, STR_CONV_MODE_RIGHT_ALIGN, 3);
    Menu_PrintText(gStringVar1, 26, 2 * i + 1);
}

void debug_sub_816017C(u8 i)
{
    Menu_BlankWindowRect(16, 2 * i + 1, 28, 2 * i + 2);
    if (_nakamuraStatic0[i].species != SPECIES_NONE)
    {
        debug_sub_816009C(i);
        debug_sub_81600D0(i);
        debug_sub_816013C(i);
    }
    debug_sub_81603B8(5);
}

void debug_sub_81601C8(u8 i, s8 dirn)
{
    if (_nakamuraStatic0[i].species == SPECIES_NONE && _nakamuraStatic0[i].unk3 == 0 && dirn == 1)
        _nakamuraStatic0[i].species = SPECIES_TREECKO - 1;
    _nakamuraStatic0[i].species += dirn;
    if (_nakamuraStatic0[i].species >= SPECIES_CHIMECHO)
        _nakamuraStatic0[i].species -= SPECIES_CHIMECHO;
    if (_nakamuraStatic0[i].species < 0)
        _nakamuraStatic0[i].species += SPECIES_CHIMECHO;
    CreateMon(gPlayerParty + i, _nakamuraStatic0[i].species, _nakamuraStatic0[i].level, 0x20, FALSE, 0, FALSE, 0);
    _nakamuraStatic0[i].unk3 = 1;
}

void debug_sub_8160258(u8 i)
{
    if (_nakamuraStatic0[i].species != SPECIES_NONE)
        debug_sub_816062C(i);
}

void debug_sub_816027C(u8 i, s8 dirn)
{
    if (_nakamuraStatic0[i].species != SPECIES_NONE)
    {
        _nakamuraStatic0[i].level += dirn;
        if (_nakamuraStatic0[i].level > 100)
            _nakamuraStatic0[i].level = 1;
        if (_nakamuraStatic0[i].level < 1)
            _nakamuraStatic0[i].level = 100;
        SetMonData(gPlayerParty + i, MON_DATA_EXP, gExperienceTables[gBaseStats[_nakamuraStatic0[i].species].growthRate] + _nakamuraStatic0[i].level);
        debug_sub_803F55C(gPlayerParty + i);
    }
}

void debug_sub_8160308(void)
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

void debug_sub_81603B8(u8 i)
{
    u8 q;
    u8 r;
    PlaySE(SE_SELECT);
    q = _nakamuraData4 / 6;
    r = _nakamuraData4 % 6;
    Menu_BlankWindowRect(_843E5D1[q], r * 2 + 1, _843E5D1[q], r * 2 + 2);

    if (i == 0)
    {
        if (r != 0)
            _nakamuraData4--;
        else
            _nakamuraData4 = q * 6 + 5;
    }

    if (i == 1)
    {
        if (r != 5)
            _nakamuraData4++;
        else
            _nakamuraData4 = q * 6;
    }

    if (i == 2)
    {
        if (q != 0)
            _nakamuraData4 -= 6;
        else
            _nakamuraData4 = 12 + r;
    }

    if (i == 3)
    {
        if (q != 2)
            _nakamuraData4 += 6;
        else
            _nakamuraData4 = r;
    }

    q = _nakamuraData4 / 6;
    r = _nakamuraData4 % 6;
    PrintTriangleCursorWithPalette(_843E5D1[q], r * 2 + 1, 0xFF);
}

bool8 debug_sub_8160498(void)
{
    if (gMain.newKeys & DPAD_UP)
    {
        debug_sub_81603B8(0);
        return FALSE;
    }

    if (gMain.newKeys & DPAD_DOWN)
    {
        debug_sub_81603B8(1);
        return FALSE;
    }

    if (gMain.newKeys & DPAD_LEFT)
    {
        debug_sub_81603B8(2);
        return FALSE;
    }

    if (gMain.newKeys & DPAD_RIGHT)
    {
        debug_sub_81603B8(3);
        return FALSE;
    }

    if (gMain.newAndRepeatedKeys & A_BUTTON)
    {
        if (_nakamuraData4 < 6)
            debug_sub_81601C8(_nakamuraData4, +1);
        if (_nakamuraData4 >= 6 && _nakamuraData4 < 12)
            debug_sub_8160258(_nakamuraData4 % 6);
        if (_nakamuraData4 >= 12 && _nakamuraData4 < 18)
            debug_sub_816027C(_nakamuraData4 % 6, +1);
        debug_sub_816017C(_nakamuraData4 % 6);
        return FALSE;
    }

    if (gMain.newAndRepeatedKeys & B_BUTTON)
    {
        if (_nakamuraData4 < 6)
            debug_sub_81601C8(_nakamuraData4, -1);
        if (_nakamuraData4 >= 6 && _nakamuraData4 < 12)
            debug_sub_8160258(_nakamuraData4 % 6);
        if (_nakamuraData4 >= 12 && _nakamuraData4 < 18)
            debug_sub_816027C(_nakamuraData4 % 6, -1);
        debug_sub_816017C(_nakamuraData4 % 6);
        return FALSE;
    }

    if (gMain.newAndRepeatedKeys & R_BUTTON)
    {
        if (_nakamuraData4 < 6)
            debug_sub_81601C8(_nakamuraData4, +10);
        if (_nakamuraData4 >= 6 && _nakamuraData4 < 12)
            debug_sub_8160258(_nakamuraData4 % 6);
        if (_nakamuraData4 >= 12 && _nakamuraData4 < 18)
            debug_sub_816027C(_nakamuraData4 % 6, +1);
        debug_sub_816017C(_nakamuraData4 % 6);
        return FALSE;
    }

    if (gMain.newAndRepeatedKeys & L_BUTTON)
    {
        if (_nakamuraData4 < 6)
            debug_sub_81601C8(_nakamuraData4, -10);
        if (_nakamuraData4 >= 6 && _nakamuraData4 < 12)
            debug_sub_8160258(_nakamuraData4 % 6);
        if (_nakamuraData4 >= 12 && _nakamuraData4 < 18)
            debug_sub_816027C(_nakamuraData4 % 6, -1);
        debug_sub_816017C(_nakamuraData4 % 6);
        return FALSE;
    }

    if (gMain.newKeys & START_BUTTON)
    {
        debug_sub_8160308();
        CloseMenu();
        return TRUE;
    }

    return FALSE;
}

u8 debug_sub_816062C(u8 i)
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
    CreateMon(gPlayerParty + i, _nakamuraStatic0[i].species, _nakamuraStatic0[i].level, 0x20, TRUE, personality, FALSE, 0);
    return ratio;
}

#ifdef NONMATCHING
u8 debug_sub_8160714(u8 * dest, struct Pokeblock * pokeblock)
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
__attribute__((naked))
u8 debug_sub_8160714(u8 * dest, struct Pokeblock * pokeblock)
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

void debug_sub_816097C(u8 * buff, s16 a1)
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

void debug_sub_8160A80(u8 a0)
{
    struct Pokeblock *pkblk = &_nakamuraStatic18;
    
    if (a0 == 0)
    {
        debug_sub_816097C(gStringVar1, pkblk->spicy);
        Menu_PrintText(gStringVar1, 8, 3);
    }
    else if (a0 == 1)
    {
        debug_sub_816097C(gStringVar1, pkblk->dry);
        Menu_PrintText(gStringVar1, 8, 5);
    }
    else if (a0 == 2)
    {
        debug_sub_816097C(gStringVar1, pkblk->sweet);
        Menu_PrintText(gStringVar1, 8, 7);
    }
    else if (a0 == 3)
    {
        debug_sub_816097C(gStringVar1, pkblk->bitter);
        Menu_PrintText(gStringVar1, 8, 9);
    }
    else if (a0 == 4)
    {
        debug_sub_816097C(gStringVar1, pkblk->sour);
        Menu_PrintText(gStringVar1, 8, 11);
    }
    else if (a0 == 5)
    {
        debug_sub_816097C(gStringVar1, pkblk->feel);
        Menu_PrintText(gStringVar1, 8, 13);
    }
}

void debug_sub_8160B50(u8 a0, s8 a1)
{
    struct Pokeblock *pkblk = &_nakamuraStatic18;

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

void debug_sub_8160BB0(void)
{
    _nakamuraStatic18.color = debug_sub_8160714(gStringVar1, &_nakamuraStatic18);
    Menu_BlankWindowRect(1, 1, 8, 2);
    Menu_PrintText(gStringVar1, 1, 1);
}

void debug_sub_8160BE4(void)
{
    u8 i;

    Menu_DrawStdWindowFrame(0, 0, 12, 15);
    debug_sub_8160BB0();
    Menu_PrintText(gContestStatsText_Spicy, 2, 3);
    Menu_PrintText(gContestStatsText_Dry, 2, 5);
    Menu_PrintText(gContestStatsText_Sweet, 2, 7);
    Menu_PrintText(gContestStatsText_Bitter, 2, 9);
    Menu_PrintText(gContestStatsText_Sour, 2, 11);
    Menu_PrintText(gContestStatsText_Tasty, 2, 13);

    for (i = 0; i < 6; i++)
        debug_sub_8160A80(i);

    InitMenu(0, 1, 3, 6, 0, 11);
}

void debug_sub_8160C7C(void)
{
    struct Pokeblock * pkblk = &_nakamuraStatic18;
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

    sub_810CA34(pkblk);
    debug_sub_8160BB0();

    for (i = 0; i < 6; i++)
        debug_sub_8160A80(i);
}

bool8 debug_sub_8160CF4(void)
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
        debug_sub_8160B50(Menu_GetCursorPos(), -1);
        debug_sub_8160A80(Menu_GetCursorPos());
        debug_sub_8160BB0();
        return FALSE;
    }

    if (gMain.newAndRepeatedKeys & DPAD_RIGHT)
    {
        debug_sub_8160B50(Menu_GetCursorPos(), +1);
        debug_sub_8160A80(Menu_GetCursorPos());
        debug_sub_8160BB0();
        return FALSE;
    }

    if (gMain.newKeys & A_BUTTON)
    {
        debug_sub_8160C7C();
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

bool8 debug_sub_8160D98(void)
{
    Menu_EraseWindowRect(0, 0, 29, 19);
    debug_sub_8160BE4();
    gMenuCallback = debug_sub_8160CF4;
    return FALSE;
}

void debug_sub_8160DC0(void)
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

void debug_sub_8160E50(struct Pokemon *pokemon)
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

void debug_sub_8161028(s8 a0)
{
    s16 i;
    if (a0 == -1)
    {
        if (_nakamuraData5 == 0)
        {
            for (i = 5; i >= 0; i--)
            {
                if (GetMonData(gPlayerParty + i, MON_DATA_SPECIES) != SPECIES_NONE)
                {
                    _nakamuraData5 = i;
                    return;
                }
            }
        }
        _nakamuraData5 += a0;
        return;
    }

    if (a0 == 1)
    {
        _nakamuraData5 += a0;
        if (_nakamuraData5 == 6)
            _nakamuraData5 = 0;
        else if (GetMonData(gPlayerParty + _nakamuraData5, MON_DATA_SPECIES) == SPECIES_NONE)
            _nakamuraData5 = 0;
    }
}

bool8 debug_sub_81610BC(void)
{
    if (gMain.newKeys & DPAD_LEFT)
    {
        debug_sub_8161028(-1);
        debug_sub_8160E50(gPlayerParty + _nakamuraData5);
        return FALSE;
    }

    if (gMain.newKeys & DPAD_RIGHT)
    {
        debug_sub_8161028(+1);
        debug_sub_8160E50(gPlayerParty + _nakamuraData5);
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
    _nakamuraData5 = 0;
    debug_sub_8160DC0();
    debug_sub_8160E50(gPlayerParty + 0);
    gMenuCallback = debug_sub_81610BC;
    return FALSE;
}

u16 debug_sub_8161160(void)
{
    u16 r7 = 0;
    u16 r6;
    u16 r5;
    u32 i;

    if (_nakamuraData6 <= _nakamuraData8)
    {
        r6 = _nakamuraData6;
        r5 = _nakamuraData8;
    }
    else
    {
        r6 = _nakamuraData8;
        r5 = _nakamuraData6;
    }

    for (i = 0; i < _nakamuraDataA; i++)
    {
        u16 r0 = Random() % _nakamuraDataC;
        if (r0 >= r6 && r0 <= r5)
            r7++;
    }

    return r7;
}

void debug_sub_81611D8(void)
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

void debug_sub_8161290(u16 a0)
{
    ConvertIntToDecimalStringN(gStringVar1, a0, STR_CONV_MODE_RIGHT_ALIGN, 5);
    Menu_PrintText(gStringVar1, 8, 9);
}

void debug_sub_81612B8(u16 * a0, s8 a1, u8 a2)
{
    *a0 += a1;
    ConvertIntToDecimalStringN(gStringVar1, *a0, STR_CONV_MODE_RIGHT_ALIGN, 5);
    Menu_PrintText(gStringVar1, 8, a2);
}

bool8 debug_sub_81612EC(void)
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
            debug_sub_81612B8(&_nakamuraData6, -r5, 1);
        if (r4 == 1)
            debug_sub_81612B8(&_nakamuraData8, -r5, 3);
        if (r4 == 2)
            debug_sub_81612B8(&_nakamuraDataC, -r5, 5);
        if (r4 == 3)
            debug_sub_81612B8(&_nakamuraDataA, -r5, 7);
        return FALSE;
    }

    if (gMain.newAndRepeatedKeys & DPAD_RIGHT)
    {
        r4 = Menu_GetCursorPos();
        if (r4 == 0)
            debug_sub_81612B8(&_nakamuraData6, r5, 1);
        if (r4 == 1)
            debug_sub_81612B8(&_nakamuraData8, r5, 3);
        if (r4 == 2)
            debug_sub_81612B8(&_nakamuraDataC, r5, 5);
        if (r4 == 3)
            debug_sub_81612B8(&_nakamuraDataA, r5, 7);
        return FALSE;
    }

    if (gMain.newKeys & A_BUTTON)
    {
        if (_nakamuraDataC != 0)
        {
            PlaySE(SE_SELECT);
            debug_sub_8161290(debug_sub_8161160());
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
    _nakamuraData6 = 0;
    _nakamuraData8 = 0;
    _nakamuraDataC = 0;
    _nakamuraDataA = 0;
    Menu_EraseWindowRect(0, 0, 29, 19);
    debug_sub_81611D8();
    gMenuCallback = debug_sub_81612EC;
    return FALSE;
}

#endif // DEBUG
