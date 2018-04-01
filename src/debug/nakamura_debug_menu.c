#if DEBUG
#include "global.h"
#include "random.h"
#include "palette.h"
#include "main.h"
#include "string_util.h"
#include "overworld.h"
#include "start_menu.h"
#include "party_menu.h"
#include "choose_party.h"
#include "secret_base.h"
#include "menu.h"

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

__attribute__((unused)) static u8 _nakamuraStatic0[0x18];
__attribute__((unused)) static u8 _nakamuraStatic18;
__attribute__((unused)) static u8 gDebugFiller3000814[4];

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

#ifdef NONMATCHING
bool8 debug_sub_815F930(void)
{
    u32 r4 = _nakamuraData1 == 0 ? 7 : 10;

    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        if (_nakamuraData1)
            debug_sub_815F7F0(1);
        else
            debug_sub_815F86C(1);
    }

    else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        if (_nakamuraData1)
            debug_sub_815F7F0(-1);
        else
            debug_sub_815F86C(-1);
    }

    else if (gMain.newAndRepeatedKeys & DPAD_LEFT)
    {
        if (_nakamuraData2 == 0)
            _nakamuraData2 = r4 - 1;
        else
            _nakamuraData2--;
        debug_sub_815F788();
    }

    else if (gMain.newAndRepeatedKeys & DPAD_RIGHT)
    {
        if (_nakamuraData2 == r4 - 1)
            _nakamuraData2 = 0;
        else
            _nakamuraData2++;
        debug_sub_815F788();
    }

    else if (gMain.newKeys & SELECT_BUTTON)
    {
        if (_nakamuraData1 == 0)
            _nakamuraData3 = (_nakamuraData3 + 1) % 5;
        debug_sub_815F7B4();
    }

    else if (gMain.newKeys & A_BUTTON)
    {
        Menu_BlankWindowRect(2, 5, 11, 6);
        Menu_BlankWindowRect(11, 1, 11, 2);
        gMenuCallback = debug_sub_815FA38;
    }

    else if (gMain.newKeys & B_BUTTON)
    {
        if (_nakamuraData1 == 0)
            debug_sub_815F86C(100);
    }

    return FALSE;
}
#else
__attribute__((naked)) bool8 debug_sub_815F930(void)
{
    asm("\tpush\t{r4, r5, lr}\n"
        "\tldr\tr0, ._107       @ _nakamuraData1\n"
        "\tldrb\tr2, [r0]\n"
        "\tmov\tr4, #0xa\n"
        "\tcmp\tr2, #0\n"
        "\tbne\t._103\t@cond_branch\n"
        "\tmov\tr4, #0x7\n"
        "._103:\n"
        "\tldr\tr5, ._107 + 4   @ gMain\n"
        "\tldrh\tr1, [r5, #0x30]\n"
        "\tmov\tr0, #0x40\n"
        "\tand\tr0, r0, r1\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._104\t@cond_branch\n"
        "\tcmp\tr2, #0\n"
        "\tbeq\t._105\t@cond_branch\n"
        "\tmov\tr0, #0x1\n"
        "\tbl\tdebug_sub_815F7F0\n"
        "\tb\t._136\n"
        "._108:\n"
        "\t.align\t2, 0\n"
        "._107:\n"
        "\t.word\t_nakamuraData1\n"
        "\t.word\tgMain\n"
        "._105:\n"
        "\tmov\tr0, #0x1\n"
        "\tb\t._113\n"
        "._104:\n"
        "\tmov\tr0, #0x80\n"
        "\tand\tr0, r0, r1\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._110\t@cond_branch\n"
        "\tcmp\tr2, #0\n"
        "\tbeq\t._111\t@cond_branch\n"
        "\tmov\tr0, #0x1\n"
        "\tneg\tr0, r0\n"
        "\tbl\tdebug_sub_815F7F0\n"
        "\tb\t._136\n"
        "._111:\n"
        "\tmov\tr0, #0x1\n"
        "\tneg\tr0, r0\n"
        "\tb\t._113\n"
        "._110:\n"
        "\tmov\tr0, #0x20\n"
        "\tand\tr0, r0, r1\n"
        "\tlsl\tr0, r0, #0x10\n"
        "\tlsr\tr3, r0, #0x10\n"
        "\tcmp\tr3, #0\n"
        "\tbeq\t._114\t@cond_branch\n"
        "\tldr\tr1, ._117       @ _nakamuraData2\n"
        "\tldrb\tr0, [r1]\n"
        "\tcmp\tr0, #0\n"
        "\tbne\t._115\t@cond_branch\n"
        "\tsub\tr0, r4, #1\n"
        "\tb\t._116\n"
        "._118:\n"
        "\t.align\t2, 0\n"
        "._117:\n"
        "\t.word\t_nakamuraData2\n"
        "._115:\n"
        "\tsub\tr0, r0, #0x1\n"
        "._116:\n"
        "\tstrb\tr0, [r1]\n"
        "._125:\n"
        "\tbl\tdebug_sub_815F788\n"
        "\tb\t._136\n"
        "._114:\n"
        "\tmov\tr0, #0x10\n"
        "\tand\tr0, r0, r1\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._120\t@cond_branch\n"
        "\tldr\tr2, ._123       @ _nakamuraData2\n"
        "\tldrb\tr1, [r2]\n"
        "\tsub\tr0, r4, #1\n"
        "\tcmp\tr1, r0\n"
        "\tbne\t._121\t@cond_branch\n"
        "\tstrb\tr3, [r2]\n"
        "\tb\t._125\n"
        "._124:\n"
        "\t.align\t2, 0\n"
        "._123:\n"
        "\t.word\t_nakamuraData2\n"
        "._121:\n"
        "\tadd\tr0, r1, #1\n"
        "\tstrb\tr0, [r2]\n"
        "\tb\t._125\n"
        "._120:\n"
        "\tldrh\tr1, [r5, #0x2e]\n"
        "\tmov\tr0, #0x4\n"
        "\tand\tr0, r0, r1\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._126\t@cond_branch\n"
        "\tcmp\tr2, #0\n"
        "\tbne\t._127\t@cond_branch\n"
        "\tldr\tr4, ._129       @ _nakamuraData3\n"
        "\tldrb\tr0, [r4]\n"
        "\tadd\tr0, r0, #0x1\n"
        "\tmov\tr1, #0x5\n"
        "\tbl\t__modsi3\n"
        "\tstrb\tr0, [r4]\n"
        "._127:\n"
        "\tbl\tdebug_sub_815F7B4\n"
        "\tb\t._136\n"
        "._130:\n"
        "\t.align\t2, 0\n"
        "._129:\n"
        "\t.word\t_nakamuraData3\n"
        "._126:\n"
        "\tmov\tr0, #0x1\n"
        "\tand\tr0, r0, r1\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._131\t@cond_branch\n"
        "\tmov\tr0, #0x2\n"
        "\tmov\tr1, #0x5\n"
        "\tmov\tr2, #0xb\n"
        "\tmov\tr3, #0x6\n"
        "\tbl\tMenu_BlankWindowRect\n"
        "\tmov\tr0, #0xb\n"
        "\tmov\tr1, #0x1\n"
        "\tmov\tr2, #0xb\n"
        "\tmov\tr3, #0x2\n"
        "\tbl\tMenu_BlankWindowRect\n"
        "\tldr\tr1, ._133       @ gMenuCallback\n"
        "\tldr\tr0, ._133 + 4   @ debug_sub_815FA38\n"
        "\tstr\tr0, [r1]\n"
        "\tb\t._136\n"
        "._134:\n"
        "\t.align\t2, 0\n"
        "._133:\n"
        "\t.word\tgMenuCallback\n"
        "\t.word\tdebug_sub_815FA38+1\n"
        "._131:\n"
        "\tmov\tr0, #0x2\n"
        "\tand\tr0, r0, r1\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._136\t@cond_branch\n"
        "\tcmp\tr2, #0\n"
        "\tbne\t._136\t@cond_branch\n"
        "\tmov\tr0, #0x64\n"
        "._113:\n"
        "\tbl\tdebug_sub_815F86C\n"
        "._136:\n"
        "\tmov\tr0, #0x0\n"
        "\tpop\t{r4, r5}\n"
        "\tpop\t{r1}\n"
        "\tbx\tr1");
}
#endif // NONMATCHING

#endif // DEBUG
