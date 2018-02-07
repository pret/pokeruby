#if DEBUG
#include "global.h"
#include "menu.h"

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

u8 debug_sub_815FC54();
u8 debug_sub_815F2B4();
u8 debug_sub_815FC94();
u8 debug_sub_815FB1C();
u8 debug_sub_815F2F4();
u8 debug_sub_815F62C();
u8 debug_sub_815FBE8();
u8 debug_sub_815FE1C();
u8 debug_sub_8160D98();

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

const u8 _843E424[][4] = {
    {    1,   118,    47,    14 },
    {    2,   125,    53,    10 },
    {    3,   113,    49,     8 },
    {  0xB,   118,    67,     6 },
    {  0xC,   121,    40,    11 },
    {  0xD,   111,    35,     1 },
    { 0x15,   115,    20,    53 },
    { 0x16,   121,    18,    13 },
    { 0x17,   119,    26,    81 },
    { 0x1F,   127,    59,    67 },
    { 0x20,   125,    55,    11 },
    { 0x21,   111,    27,    27 },
    { 0x29,   114,     9,    47 },
    { 0x2A,   115,    32,    39 },
    { 0x2B,   115,    23,     8 },
    { 0x33,   114,    30,    51 },
    { 0x34,   115,    26,    15 },
    { 0x35,   115,    32,    46 },
    { 0x3D,   114,    11,    62 },
    { 0x3E,   115,    21,    18 },
    { 0x3F,   115,    25,    24 },
    { 0x47,   114,    19,    70 },
    { 0x48,   115,    32,     6 },
    { 0x49,   114,    32,    57 },
    { 0x51,   116,    71,     4 },
    { 0x52,   123,    47,     3 },
    { 0x53,   123,    57,     5 },
    { 0x5B,   116,    79,    11 },
    { 0x5C,   123,    49,     3 },
    { 0x5D,   120,    18,    12 },
    { 0x65,   120,    28,    62 },
    { 0x66,   116,    56,     6 },
    { 0x67,   119,    16,    81 },
    { 0x6F,   120,    30,    62 },
    { 0x70,   116,    55,    15 },
    { 0x71,   119,    16,    28 },
    { 0x79,   111,    33,    34 },
    { 0x7A,   118,    29,     5 },
    { 0x7B,   127,    45,    24 },
    { 0x83,   111,    24,    36 },
    { 0x84,   125,     7,    25 },
    { 0x85,   115,     8,    30 },
    { 0x8D,   111,    34,    50 },
    { 0x8E,   127,    59,    72 },
    { 0x8F,   127,    61,    21 },
    { 0x97,   127,    67,    63 },
    { 0x98,   125,    24,    32 },
    { 0x99,   111,    35,    31 },
    { 0xA1,   111,    13,    19 },
    { 0xA2,   121,    43,     7 },
    { 0xA3,   118,    47,     5 },
    { 0xA4,   111,    14,    19 },
    { 0xAB,   118,    46,     5 },
    { 0xAC,   121,    42,     7 },
    { 0xAD,   119,    19,    76 },
    { 0xAE,   115,     7,    20 },
    { 0xB5,   110,    16,    25 },
    { 0xB6,   114,    11,    27 },
    { 0xB7,   115,     8,    20 },
    { 0xBF,   110,    17,    25 },
    { 0xC0,   114,    12,    27 },
    { 0xC1,   119,    18,    76 },
    { 0xC9,   119,     5,     2 },
    { 0xCA,   119,     4,    89 },
    { 0xCB,   120,    38,    54 },
    { 0xCC,   120,     5,    76 },
    { 0xD3,   119,     5,    15 },
    { 0xD4,   119,     7,   101 },
    { 0xD5,   120,    31,    23 },
    { 0xDD,   119,    34,    24 },
    { 0xDE,   120,    26,    10 },
    { 0xDF,   119,     4,    15 },
    { 0xE7,   119,    31,    73 },
    { 0xE8,   120,    29,    85 },
    { 0xE9,   119,     6,     2 },
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
const u8 Str_843E576[] = _("あ");
const u8 Str_843E578[] = _("ア");
const u8 Str_843E57A[] = _("A");
const u8 Str_843E57C[] = _("a");
const u8 Str_843E57E[] = _("0");
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

#endif // DEBUG
