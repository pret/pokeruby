#include "global.h"
#include "battle_anim.h"
#include "battle.h"
#include "battle_anim_80CA710.h"
#include "battle_interface.h"
#include "contest.h"
#include "decompress.h"
#include "m4a.h"
#include "main.h"
#include "palette.h"
#include "rom_8077ABC.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "ewram.h"
#include "graphics.h"
#include "constants/battle_anim.h"

// sprites start at 10000 and thus must be subtracted of 10000 to account for the true index.
#define GET_TRUE_SPRITE_INDEX(i) (i - 10000)

#define ANIM_SPRITE_INDEX_COUNT 8
#define ANIM_ARGS_COUNT 8

const struct OamData gOamData_837DF24 =
{
    .affineMode = 0,
    .objMode = 0,
    .shape = 0,
    .size = 0,
    .priority = 2,
};

const struct OamData gOamData_837DF2C =
{
    .affineMode = 0,
    .objMode = 0,
    .shape = 0,
    .size = 1,
    .priority = 2,
};

const struct OamData gOamData_837DF34 =
{
    .affineMode = 0,
    .objMode = 0,
    .shape = 0,
    .size = 2,
    .priority = 2,
};

const struct OamData gOamData_837DF3C =
{
    .affineMode = 0,
    .objMode = 0,
    .shape = 0,
    .size = 3,
    .priority = 2,
};

const struct OamData gOamData_837DF44 =
{
    .affineMode = 0,
    .objMode = 0,
    .shape = 1,
    .size = 0,
    .priority = 2,
};

const struct OamData gOamData_837DF4C =
{
    .affineMode = 0,
    .objMode = 0,
    .shape = 1,
    .size = 1,
    .priority = 2,
};

const struct OamData gOamData_837DF54 =
{
    .affineMode = 0,
    .objMode = 0,
    .shape = 1,
    .size = 2,
    .priority = 2,
};

const struct OamData gOamData_837DF5C =
{
    .affineMode = 0,
    .objMode = 0,
    .shape = 1,
    .size = 3,
    .priority = 2,
};

const struct OamData gOamData_837DF64 =
{
    .affineMode = 0,
    .objMode = 0,
    .shape = 2,
    .size = 0,
    .priority = 2,
};

const struct OamData gOamData_837DF6C =
{
    .affineMode = 0,
    .objMode = 0,
    .shape = 2,
    .size = 1,
    .priority = 2,
};

const struct OamData gOamData_837DF74 =
{
    .affineMode = 0,
    .objMode = 0,
    .shape = 2,
    .size = 2,
    .priority = 2,
};

const struct OamData gOamData_837DF7C =
{
    .affineMode = 0,
    .objMode = 0,
    .shape = 2,
    .size = 3,
    .priority = 2,
};

const struct OamData gOamData_837DF84 =
{
    .affineMode = 1,
    .objMode = 0,
    .shape = 0,
    .size = 0,
    .priority = 2,
};

const struct OamData gOamData_837DF8C =
{
    .affineMode = 1,
    .objMode = 0,
    .shape = 0,
    .size = 1,
    .priority = 2,
};

const struct OamData gOamData_837DF94 =
{
    .affineMode = 1,
    .objMode = 0,
    .shape = 0,
    .size = 2,
    .priority = 2,
};

const struct OamData gOamData_837DF9C =
{
    .affineMode = 1,
    .objMode = 0,
    .shape = 0,
    .size = 3,
    .priority = 2,
};

const struct OamData gOamData_837DFA4 =
{
    .affineMode = 1,
    .objMode = 0,
    .shape = 1,
    .size = 0,
    .priority = 2,
};

const struct OamData gOamData_837DFAC =
{
    .affineMode = 1,
    .objMode = 0,
    .shape = 1,
    .size = 1,
    .priority = 2,
};

const struct OamData gOamData_837DFB4 =
{
    .affineMode = 1,
    .objMode = 0,
    .shape = 1,
    .size = 2,
    .priority = 2,
};

const struct OamData gOamData_837DFBC =
{
    .affineMode = 1,
    .objMode = 0,
    .shape = 1,
    .size = 3,
    .priority = 2,
};

const struct OamData gOamData_837DFC4 =
{
    .affineMode = 1,
    .objMode = 0,
    .shape = 2,
    .size = 0,
    .priority = 2,
};

const struct OamData gOamData_837DFCC =
{
    .affineMode = 1,
    .objMode = 0,
    .shape = 2,
    .size = 1,
    .priority = 2,
};

const struct OamData gOamData_837DFD4 =
{
    .affineMode = 1,
    .objMode = 0,
    .shape = 2,
    .size = 2,
    .priority = 2,
};

const struct OamData gOamData_837DFDC =
{
    .affineMode = 1,
    .objMode = 0,
    .shape = 2,
    .size = 3,
    .priority = 2,
};

const struct OamData gOamData_837DFE4 =
{
    .affineMode = 3,
    .objMode = 0,
    .shape = 0,
    .size = 0,
    .priority = 2,
};

const struct OamData gOamData_837DFEC =
{
    .affineMode = 3,
    .objMode = 0,
    .shape = 0,
    .size = 1,
    .priority = 2,
};

const struct OamData gOamData_837DFF4 =
{
    .affineMode = 3,
    .objMode = 0,
    .shape = 0,
    .size = 2,
    .priority = 2,
};

const struct OamData gOamData_837DFFC =
{
    .affineMode = 3,
    .objMode = 0,
    .shape = 0,
    .size = 3,
    .priority = 2,
};

const struct OamData gOamData_837D004 =
{
    .affineMode = 3,
    .objMode = 0,
    .shape = 1,
    .size = 0,
    .priority = 2,
};

const struct OamData gOamData_837D00C =
{
    .affineMode = 3,
    .objMode = 0,
    .shape = 1,
    .size = 1,
    .priority = 2,
};

const struct OamData gOamData_837E014 =
{
    .affineMode = 3,
    .objMode = 0,
    .shape = 1,
    .size = 2,
    .priority = 2,
};

const struct OamData gOamData_837E01C =
{
    .affineMode = 3,
    .objMode = 0,
    .shape = 1,
    .size = 3,
    .priority = 2,
};

const struct OamData gOamData_837E024 =
{
    .affineMode = 3,
    .objMode = 0,
    .shape = 2,
    .size = 0,
    .priority = 2,
};

const struct OamData gOamData_837E02C =
{
    .affineMode = 3,
    .objMode = 0,
    .shape = 2,
    .size = 1,
    .priority = 2,
};

const struct OamData gOamData_837E034 =
{
    .affineMode = 3,
    .objMode = 0,
    .shape = 2,
    .size = 2,
    .priority = 2,
};

const struct OamData gOamData_837E03C =
{
    .affineMode = 3,
    .objMode = 0,
    .shape = 2,
    .size = 3,
    .priority = 2,
};

const struct OamData gOamData_837E044 =
{
    .affineMode = 0,
    .objMode = 1,
    .shape = 0,
    .size = 0,
    .priority = 2,
};

const struct OamData gOamData_837E04C =
{
    .affineMode = 0,
    .objMode = 1,
    .shape = 0,
    .size = 1,
    .priority = 2,
};

const struct OamData gOamData_837E054 =
{
    .affineMode = 0,
    .objMode = 1,
    .shape = 0,
    .size = 2,
    .priority = 2,
};

const struct OamData gOamData_837E05C =
{
    .affineMode = 0,
    .objMode = 1,
    .shape = 0,
    .size = 3,
    .priority = 2,
};

const struct OamData gOamData_837E064 =
{
    .affineMode = 0,
    .objMode = 1,
    .shape = 1,
    .size = 0,
    .priority = 2,
};

const struct OamData gOamData_837E06C =
{
    .affineMode = 0,
    .objMode = 1,
    .shape = 1,
    .size = 1,
    .priority = 2,
};

const struct OamData gOamData_837E074 =
{
    .affineMode = 0,
    .objMode = 1,
    .shape = 1,
    .size = 2,
    .priority = 2,
};

const struct OamData gOamData_837E07C =
{
    .affineMode = 0,
    .objMode = 1,
    .shape = 1,
    .size = 3,
    .priority = 2,
};

const struct OamData gOamData_837E084 =
{
    .affineMode = 0,
    .objMode = 1,
    .shape = 2,
    .size = 0,
    .priority = 2,
};

const struct OamData gOamData_837E08C =
{
    .affineMode = 0,
    .objMode = 1,
    .shape = 2,
    .size = 1,
    .priority = 2,
};

const struct OamData gOamData_837E094 =
{
    .affineMode = 0,
    .objMode = 1,
    .shape = 2,
    .size = 2,
    .priority = 2,
};

const struct OamData gOamData_837E09C =
{
    .affineMode = 0,
    .objMode = 1,
    .shape = 2,
    .size = 3,
    .priority = 2,
};

const struct OamData gOamData_837E0A4 =
{
    .affineMode = 1,
    .objMode = 1,
    .shape = 0,
    .size = 0,
    .priority = 2,
};

const struct OamData gOamData_837E0AC =
{
    .affineMode = 1,
    .objMode = 1,
    .shape = 0,
    .size = 1,
    .priority = 2,
};

const struct OamData gOamData_837E0B4 =
{
    .affineMode = 1,
    .objMode = 1,
    .shape = 0,
    .size = 2,
    .priority = 2,
};

const struct OamData gOamData_837E0BC =
{
    .affineMode = 1,
    .objMode = 1,
    .shape = 0,
    .size = 3,
    .priority = 2,
};

const struct OamData gOamData_837E0C4 =
{
    .affineMode = 1,
    .objMode = 1,
    .shape = 1,
    .size = 0,
    .priority = 2,
};

const struct OamData gOamData_837E0CC =
{
    .affineMode = 1,
    .objMode = 1,
    .shape = 1,
    .size = 1,
    .priority = 2,
};

const struct OamData gOamData_837E0D4 =
{
    .affineMode = 1,
    .objMode = 1,
    .shape = 1,
    .size = 2,
    .priority = 2,
};

const struct OamData gOamData_837E0DC =
{
    .affineMode = 1,
    .objMode = 1,
    .shape = 1,
    .size = 3,
    .priority = 2,
};

const struct OamData gOamData_837E0E4 =
{
    .affineMode = 1,
    .objMode = 1,
    .shape = 2,
    .size = 0,
    .priority = 2,
};

const struct OamData gOamData_837E0EC =
{
    .affineMode = 1,
    .objMode = 1,
    .shape = 2,
    .size = 1,
    .priority = 2,
};

const struct OamData gOamData_837E0F4 =
{
    .affineMode = 1,
    .objMode = 1,
    .shape = 2,
    .size = 2,
    .priority = 2,
};

const struct OamData gOamData_837E0FC =
{
    .affineMode = 1,
    .objMode = 1,
    .shape = 2,
    .size = 3,
    .priority = 2,
};

const struct OamData gOamData_837E104 =
{
    .affineMode = 3,
    .objMode = 1,
    .shape = 0,
    .size = 0,
    .priority = 2,
};

const struct OamData gOamData_837E10C =
{
    .affineMode = 3,
    .objMode = 1,
    .shape = 0,
    .size = 1,
    .priority = 2,
};

const struct OamData gOamData_837E114 =
{
    .affineMode = 3,
    .objMode = 1,
    .shape = 0,
    .size = 2,
    .priority = 2,
};

const struct OamData gOamData_837E11C =
{
    .affineMode = 3,
    .objMode = 1,
    .shape = 0,
    .size = 3,
    .priority = 2,
};

const struct OamData gOamData_837E124 =
{
    .affineMode = 3,
    .objMode = 1,
    .shape = 1,
    .size = 0,
    .priority = 2,
};

const struct OamData gOamData_837E12C =
{
    .affineMode = 3,
    .objMode = 1,
    .shape = 1,
    .size = 1,
    .priority = 2,
};

const struct OamData gOamData_837E134 =
{
    .affineMode = 3,
    .objMode = 1,
    .shape = 1,
    .size = 2,
    .priority = 2,
};

const struct OamData gOamData_837E13C =
{
    .affineMode = 3,
    .objMode = 1,
    .shape = 1,
    .size = 3,
    .priority = 2,
};

const struct OamData gOamData_837E144 =
{
    .affineMode = 3,
    .objMode = 1,
    .shape = 2,
    .size = 0,
    .priority = 2,
};

const struct OamData gOamData_837E14C =
{
    .affineMode = 3,
    .objMode = 1,
    .shape = 2,
    .size = 1,
    .priority = 2,
};

const struct OamData gOamData_837E154 =
{
    .affineMode = 3,
    .objMode = 1,
    .shape = 2,
    .size = 2,
    .priority = 2,
};

const struct OamData gOamData_837E15C =
{
    .affineMode = 3,
    .objMode = 1,
    .shape = 2,
    .size = 3,
    .priority = 2,
};

const struct CompressedSpriteSheet gBattleAnimPicTable[] =
{
    { gBattleAnimSpriteSheet_000,  0x200, 10000 },
    { gBattleAnimSpriteSheet_001,  0x300, 10001 },
    { gBattleAnimSpriteSheet_002,  0x200, 10002 },
    { gBattleAnimSpriteSheet_003,  0x100, 10003 },
    { gBattleAnimSpriteSheet_004,  0x200, 10004 },
    { gBattleAnimSpriteSheet_005,  0x400, 10005 },
    { gBattleAnimSpriteSheet_006,  0x180, 10006 },
    { gBattleAnimSpriteSheet_007,  0x800, 10007 },
    { gBattleAnimSpriteSheet_008,   0x20, 10008 },
    { gBattleAnimSpriteSheet_009,  0x400, 10009 },
    { gBattleAnimSpriteSheet_010, 0x1200, 10010 },
    { gBattleAnimSpriteSheet_011,  0x180, 10011 },
    { gBattleAnimSpriteSheet_012,   0x80, 10012 },
    { gBattleAnimSpriteSheet_013,   0x80, 10013 },
    { gBattleAnimSpriteSheet_014,  0x280, 10014 },
    { gBattleAnimSpriteSheet_015,   0x80, 10015 },
    { gBattleAnimSpriteSheet_016,  0x100, 10016 },
    { gBattleAnimSpriteSheet_017,   0x20, 10017 },
    { gBattleAnimSpriteSheet_018,   0x80, 10018 },
    { gBattleAnimSpriteSheet_019,  0x400, 10019 },
    { gBattleAnimSpriteSheet_020,  0x200, 10020 },
    { gBattleAnimSpriteSheet_021,  0xA00, 10021 },
    { gBattleAnimSpriteSheet_021,  0xA00, 10022 },
    { gBattleAnimSpriteSheet_023,  0x380, 10023 },
    { gBattleAnimSpriteSheet_024,  0x300, 10024 },
    { gBattleAnimSpriteSheet_025,  0xA00, 10025 },
    { gBattleAnimSpriteSheet_026,  0xA00, 10026 },
    { gBattleAnimSpriteSheet_027,  0xA00, 10027 },
    { gBattleAnimSpriteSheet_028,  0xA00, 10028 },
    { gBattleAnimSpriteSheet_029,  0xA00, 10029 },
    { gBattleAnimSpriteSheet_030,  0xA00, 10030 },
    { gBattleAnimSpriteSheet_031,  0xE00, 10031 },
    { gBattleAnimSpriteSheet_032,  0x380, 10032 },
    { gBattleAnimSpriteSheet_033, 0x1000, 10033 },
    { gBattleAnimSpriteSheet_034,  0x800, 10034 },
    { gBattleAnimSpriteSheet_035,  0xA00, 10035 },
    { gBattleAnimSpriteSheet_036,  0x800, 10036 },
    { gBattleAnimSpriteSheet_037,  0xA00, 10037 },
    { gBattleAnimSpriteSheet_038,  0xA00, 10038 },
    { gBattleAnimSpriteSheet_039,  0xA00, 10039 },
    { gBattleAnimSpriteSheet_040,  0xA00, 10040 },
    { gBattleAnimSpriteSheet_041,  0xA00, 10041 },
    { gBattleAnimSpriteSheet_042,  0xA00, 10042 },
    { gBattleAnimSpriteSheet_043,  0xA00, 10043 },
    { gBattleAnimSpriteSheet_044,  0xA00, 10044 },
    { gBattleAnimSpriteSheet_045,  0xA00, 10045 },
    { gBattleAnimSpriteSheet_046, 0x1000, 10046 },
    { gBattleAnimSpriteSheet_046, 0x1000, 10047 },
    { gBattleAnimSpriteSheet_048, 0x1000, 10048 },
    { gBattleAnimSpriteSheet_048, 0x1000, 10049 },
    { gBattleAnimSpriteSheet_050,  0x200, 10050 },
    { gBattleAnimSpriteSheet_051,  0x200, 10051 },
    { gBattleAnimSpriteSheet_052,  0x200, 10052 },
    { gBattleAnimSpriteSheet_053,  0x800, 10053 },
    { gBattleAnimSpriteSheet_054,   0x80, 10054 },
    { gBattleAnimSpriteSheet_055,  0x200, 10055 },
    { gBattleAnimSpriteSheet_056, 0x1000, 10056 },
    { gBattleAnimSpriteSheet_057,  0x180, 10057 },
    { gBattleAnimSpriteSheet_058,  0xC00, 10058 },
    { gBattleAnimSpriteSheet_059,  0x100, 10059 },
    { gBattleAnimSpriteSheet_060,   0x40, 10060 },
    { gBattleAnimSpriteSheet_061,  0x180, 10061 },
    { gBattleAnimSpriteSheet_062,  0x800, 10062 },
    { gBattleAnimSpriteSheet_063,  0x480, 10063 },
    { gBattleAnimSpriteSheet_064,  0x200, 10064 },
    { gBattleAnimSpriteSheet_065,  0x200, 10065 },
    { gBattleAnimSpriteSheet_066,  0x100, 10066 },
    { gBattleAnimSpriteSheet_065,  0x200, 10067 },
    { gBattleAnimSpriteSheet_065,  0x200, 10068 },
    { gBattleAnimSpriteSheet_065,  0x200, 10069 },
    { gBattleAnimSpriteSheet_070,  0x200, 10070 },
    { gBattleAnimSpriteSheet_071,  0xA00, 10071 },
    { gBattleAnimSpriteSheet_072,  0x300, 10072 },
    { gBattleAnimSpriteSheet_073,  0x180, 10073 },
    { gBattleAnimSpriteSheet_074,   0xA0, 10074 },
    { gBattleAnimSpriteSheet_075,  0x700, 10075 },
    { gBattleAnimSpriteSheet_076,  0x400, 10076 },
    { gBattleAnimSpriteSheet_077,  0x200, 10077 },
    { gBattleAnimSpriteSheet_078,  0x300, 10078 },
    { gBattleAnimSpriteSheet_079,  0xC00, 10079 },
    { gBattleAnimSpriteSheet_080,  0xA00, 10080 },
    { gBattleAnimSpriteSheet_081,   0x80, 10081 },
    { gBattleAnimSpriteSheet_082,   0x40, 10082 },
    { gBattleAnimSpriteSheet_083,  0xE00, 10083 },
    { gBattleAnimSpriteSheet_084,  0xE00, 10084 },
    { gBattleAnimSpriteSheet_085,  0x280, 10085 },
    { gBattleAnimSpriteSheet_086,  0x200, 10086 },
    { gBattleAnimSpriteSheet_087,   0x80, 10087 },
    { gBattleAnimSpriteSheet_088,   0xC0, 10088 },
    { gBattleAnimSpriteSheet_089,  0xA00, 10089 },
    { gBattleAnimSpriteSheet_090,  0x200, 10090 },
    { gBattleAnimSpriteSheet_091,  0x180, 10091 },
    { gBattleAnimSpriteSheet_092,   0x80, 10092 },
    { gBattleAnimSpriteSheet_093, 0x1000, 10093 },
    { gBattleAnimSpriteSheet_094,  0xA00, 10094 },
    { gBattleAnimSpriteSheet_095,  0x180, 10095 },
    { gBattleAnimSpriteSheet_096,  0x380, 10096 },
    { gBattleAnimSpriteSheet_097,  0xC00, 10097 },
    { gBattleAnimSpriteSheet_098,  0x200, 10098 },
    { gBattleAnimSpriteSheet_099,  0x200, 10099 },
    { gBattleAnimSpriteSheet_100,  0x200, 10100 },
    { gBattleAnimSpriteSheet_101,  0x200, 10101 },
    { gBattleAnimSpriteSheet_102,  0x400, 10102 },
    { gBattleAnimSpriteSheet_103,   0x80, 10103 },
    { gBattleAnimSpriteSheet_104,  0x400, 10104 },
    { gBattleAnimSpriteSheet_105,  0xC00, 10105 },
    { gBattleAnimSpriteSheet_106,  0x200, 10106 },
    { gBattleAnimSpriteSheet_107, 0x1000, 10107 },
    { gBattleAnimSpriteSheet_108,  0xA00, 10108 },
    { gBattleAnimSpriteSheet_109,   0x20, 10109 },
    { gBattleAnimSpriteSheet_110,  0xE00, 10110 },
    { gBattleAnimSpriteSheet_111,   0x80, 10111 },
    { gBattleAnimSpriteSheet_112,  0xA00, 10112 },
    { gBattleAnimSpriteSheet_113,  0x400, 10113 },
    { gBattleAnimSpriteSheet_114,  0x200, 10114 },
    { gBattleAnimSpriteSheet_115,  0x700, 10115 },
    { gBattleAnimSpriteSheet_116,  0x800, 10116 },
    { gBattleAnimSpriteSheet_117,  0xA00, 10117 },
    { gBattleAnimSpriteSheet_118,  0x600, 10118 },
    { gBattleAnimSpriteSheet_119,  0x800, 10119 },
    { gBattleAnimSpriteSheet_120,  0x200, 10120 },
    { gBattleAnimSpriteSheet_121,   0x40, 10121 },
    { gBattleAnimSpriteSheet_122,  0x180, 10122 },
    { gBattleAnimSpriteSheet_123,  0x600, 10123 },
    { gBattleAnimSpriteSheet_124,  0x600, 10124 },
    { gBattleAnimSpriteSheet_125,  0x200, 10125 },
    { gBattleAnimSpriteSheet_126,   0x80, 10126 },
    { gBattleAnimSpriteSheet_127,  0x200, 10127 },
    { gBattleAnimSpriteSheet_128,  0x800, 10128 },
    { gBattleAnimSpriteSheet_129,   0x80, 10129 },
    { gBattleAnimSpriteSheet_130,  0xA00, 10130 },
    { gBattleAnimSpriteSheet_131,  0x280, 10131 },
    { gBattleAnimSpriteSheet_132,  0x280, 10132 },
    { gBattleAnimSpriteSheet_133,  0x100, 10133 },
    { gBattleAnimSpriteSheet_134,  0x200, 10134 },
    { gBattleAnimSpriteSheet_135,  0x200, 10135 },
    { gBattleAnimSpriteSheet_136,   0x20, 10136 },
    { gBattleAnimSpriteSheet_137,  0xA00, 10137 },
    { gBattleAnimSpriteSheet_138,  0x800, 10138 },
    { gBattleAnimSpriteSheet_139,  0x800, 10139 },
    { gBattleAnimSpriteSheet_140,   0xC0, 10140 },
    { gBattleAnimSpriteSheet_141,  0x1C0, 10141 },
    { gBattleAnimSpriteSheet_142,  0x100, 10142 },
    { gBattleAnimSpriteSheet_143,  0x800, 10143 },
    { gBattleAnimSpriteSheet_144,  0x200, 10144 },
    { gBattleAnimSpriteSheet_145,  0x800, 10145 },
    { gBattleAnimSpriteSheet_146,  0x180, 10146 },
    { gBattleAnimSpriteSheet_147,  0x180, 10147 },
    { gBattleAnimSpriteSheet_148,  0x200, 10148 },
    { gBattleAnimSpriteSheet_149,  0x200, 10149 },
    { gBattleAnimSpriteSheet_150,  0x180, 10150 },
    { gBattleAnimSpriteSheet_151,  0x400, 10151 },
    { gBattleAnimSpriteSheet_152,   0x80, 10152 },
    { gBattleAnimSpriteSheet_153,  0x100, 10153 },
    { gBattleAnimSpriteSheet_154,  0x100, 10154 },
    { gBattleAnimSpriteSheet_155,  0x140, 10155 },
    { gBattleAnimSpriteSheet_156,  0x800, 10156 },
    { gBattleAnimSpriteSheet_157,  0x200, 10157 },
    { gBattleAnimSpriteSheet_158,  0x100, 10158 },
    { gBattleAnimSpriteSheet_159,   0xA0, 10159 },
    { gBattleAnimSpriteSheet_160,  0x100, 10160 },
    { gBattleAnimSpriteSheet_161,   0x80, 10161 },
    { gBattleAnimSpriteSheet_162,  0x300, 10162 },
    { gBattleAnimSpriteSheet_163,  0x100, 10163 },
    { gBattleAnimSpriteSheet_163,  0x100, 10164 },
    { gBattleAnimSpriteSheet_163,  0x100, 10165 },
    { gBattleAnimSpriteSheet_166,  0x800, 10166 },
    { gBattleAnimSpriteSheet_166,  0x800, 10167 },
    { gBattleAnimSpriteSheet_166,  0x800, 10168 },
    { gBattleAnimSpriteSheet_166,  0x800, 10169 },
    { gBattleAnimSpriteSheet_166,  0x800, 10170 },
    { gBattleAnimSpriteSheet_171,   0x80, 10171 },
    { gBattleAnimSpriteSheet_144,  0x200, 10172 },
    { gBattleAnimSpriteSheet_173,  0x200, 10173 },
    { gBattleAnimSpriteSheet_174,  0x200, 10174 },
    { gBattleAnimSpriteSheet_175,   0x80, 10175 },
    { gBattleAnimSpriteSheet_176,  0x200, 10176 },
    { gBattleAnimSpriteSheet_177,  0x500, 10177 },
    { gBattleAnimSpriteSheet_178,  0x800, 10178 },
    { gBattleAnimSpriteSheet_179,  0x400, 10179 },
    { gBattleAnimSpriteSheet_180,   0x20, 10180 },
    { gBattleAnimSpriteSheet_181,  0x800, 10181 },
    { gBattleAnimSpriteSheet_182,  0x100, 10182 },
    { gBattleAnimSpriteSheet_183,  0x800, 10183 },
    { gBattleAnimSpriteSheet_184,  0x400, 10184 },
    { gBattleAnimSpriteSheet_185,  0xA00, 10185 },
    { gBattleAnimSpriteSheet_186, 0x1000, 10186 },
    { gBattleAnimSpriteSheet_187,  0x800, 10187 },
    { gBattleAnimSpriteSheet_188,  0x400, 10188 },
    { gBattleAnimSpriteSheet_189,  0x200, 10189 },
    { gBattleAnimSpriteSheet_190,  0x800, 10190 },
    { gBattleAnimSpriteSheet_191,  0x800, 10191 },
    { gBattleAnimSpriteSheet_192,  0x800, 10192 },
    { gBattleAnimSpriteSheet_193,  0x200, 10193 },
    { gBattleAnimSpriteSheet_194,  0x800, 10194 },
    { gBattleAnimSpriteSheet_195,  0x200, 10195 },
    { gBattleAnimSpriteSheet_196,  0x800, 10196 },
    { gBattleAnimSpriteSheet_197,  0x200, 10197 },
    { gBattleAnimSpriteSheet_198,  0x800, 10198 },
    { gBattleAnimSpriteSheet_199,  0x400, 10199 },
    { gBattleAnimSpriteSheet_200,  0x200, 10200 },
    { gBattleAnimSpriteSheet_201,  0xA80, 10201 },
    { gBattleAnimSpriteSheet_202,  0x600, 10202 },
    { gBattleAnimSpriteSheet_203,  0x800, 10203 },
    { gBattleAnimSpriteSheet_204,  0x200, 10204 },
    { gBattleAnimSpriteSheet_205,  0x600, 10205 },
    { gBattleAnimSpriteSheet_206,  0x800, 10206 },
    { gBattleAnimSpriteSheet_207,  0x180, 10207 },
    { gBattleAnimSpriteSheet_208,  0x800, 10208 },
    { gBattleAnimSpriteSheet_209,  0x800, 10209 },
    { gBattleAnimSpriteSheet_210,   0x80, 10210 },
    { gBattleAnimSpriteSheet_211,   0x80, 10211 },
    { gBattleAnimSpriteSheet_212,  0x800, 10212 },
    { gBattleAnimSpriteSheet_213,  0x800, 10213 },
    { gBattleAnimSpriteSheet_214,  0x600, 10214 },
    { gBattleAnimSpriteSheet_215,  0x600, 10215 },
    { gBattleAnimSpriteSheet_210,   0x80, 10216 },
    { gBattleAnimSpriteSheet_217,   0x80, 10217 },
    { gBattleAnimSpriteSheet_218,  0x180, 10218 },
    { gBattleAnimSpriteSheet_210,   0x80, 10219 },
    { gBattleAnimSpriteSheet_220,  0x200, 10220 },
    { gBattleAnimSpriteSheet_221,  0x400, 10221 },
    { gBattleAnimSpriteSheet_222,  0xA00, 10222 },
    { gBattleAnimSpriteSheet_223,  0x800, 10223 },
    { gBattleAnimSpriteSheet_224,  0x200, 10224 },
    { gBattleAnimSpriteSheet_225,  0x400, 10225 },
    { gBattleAnimSpriteSheet_226,   0x80, 10226 },
    { gBattleAnimSpriteSheet_227,  0x800, 10227 },
    { gBattleAnimSpriteSheet_228,  0x200, 10228 },
    { gBattleAnimSpriteSheet_229,  0x300, 10229 },
    { gBattleAnimSpriteSheet_230,  0x800, 10230 },
    { gBattleAnimSpriteSheet_231,  0x380, 10231 },
    { gBattleAnimSpriteSheet_232,  0x800, 10232 },
    { gBattleAnimSpriteSheet_233,   0xC0, 10233 },
    { gBattleAnimSpriteSheet_234,  0x800, 10234 },
    { gBattleAnimSpriteSheet_235,   0x60, 10235 },
    { gBattleAnimSpriteSheet_235,   0x60, 10236 },
    { gBattleAnimSpriteSheet_235,   0x60, 10237 },
    { gBattleAnimSpriteSheet_238,   0x80, 10238 },
    { gBattleAnimSpriteSheet_239,  0x180, 10239 },
    { gBattleAnimSpriteSheet_240,  0x180, 10240 },
    { gBattleAnimSpriteSheet_241,  0x200, 10241 },
    { gBattleAnimSpriteSheet_242,  0x200, 10242 },
    { gBattleAnimSpriteSheet_243,   0x20, 10243 },
    { gBattleAnimSpriteSheet_244,  0x400, 10244 },
    { gBattleAnimSpriteSheet_245,  0x600, 10245 },
    { gBattleAnimSpriteSheet_246, 0x1000, 10246 },
    { gBattleAnimSpriteSheet_247,  0x400, 10247 },
    { gBattleAnimSpriteSheet_248,   0x20, 10248 },
    { gBattleAnimSpriteSheet_249,   0x80, 10249 },
    { gBattleAnimSpriteSheet_250,  0x800, 10250 },
    { gBattleAnimSpriteSheet_251,   0x80, 10251 },
    { gBattleAnimSpriteSheet_252,  0x200, 10252 },
    { gBattleAnimSpriteSheet_253,  0x400, 10253 },
    { gBattleAnimSpriteSheet_254,  0x200, 10254 },
    { gBattleAnimSpriteSheet_255,  0x200, 10255 },
    { gBattleAnimSpriteSheet_256,  0x800, 10256 },
    { gBattleAnimSpriteSheet_257,  0x280, 10257 },
    { gBattleAnimSpriteSheet_258,  0x200, 10258 },
    { gBattleAnimSpriteSheet_149,  0x200, 10259 },
    { gBattleAnimSpriteSheet_260,  0x400, 10260 },
    { gBattleAnimSpriteSheet_261,  0x200, 10261 },
    { gBattleAnimSpriteSheet_262,  0x200, 10262 },
    { gBattleAnimSpriteSheet_263,   0x80, 10263 },
    { gBattleAnimSpriteSheet_264,   0x20, 10264 },
    { gBattleAnimSpriteSheet_264,   0x20, 10265 },
    { gBattleAnimSpriteSheet_266,   0x80, 10266 },
    { gBattleAnimSpriteSheet_212,  0x800, 10267 },
    { gBattleAnimSpriteSheet_264,   0x20, 10268 },
    { gBattleAnimSpriteSheet_269,   0x80, 10269 },
    { gBattleAnimSpriteSheet_270,  0x400, 10270 },
    { gBattleAnimSpriteSheet_271,   0x80, 10271 },
    { gBattleAnimSpriteSheet_272,  0x800, 10272 },
    { gBattleAnimSpriteSheet_273,   0x20, 10273 },
    { gBattleAnimSpriteSheet_274,  0x800, 10274 },
    { gBattleAnimSpriteSheet_275,  0x800, 10275 },
    { gBattleAnimSpriteSheet_276,  0x800, 10276 },
    { gBattleAnimSpriteSheet_277, 0x1000, 10277 },
    { gBattleAnimSpriteSheet_278,  0x800, 10278 },
    { gBattleAnimSpriteSheet_279,   0xA0, 10279 },
    { gBattleAnimSpriteSheet_280,  0x800, 10280 },
    { gBattleAnimSpriteSheet_281,  0x200, 10281 },
    { gBattleAnimSpriteSheet_282,  0x600, 10282 },
    { gBattleAnimSpriteSheet_283,  0x200, 10283 },
    { gBattleAnimSpriteSheet_284,  0x800, 10284 },
    { gBattleAnimSpriteSheet_285,  0x200, 10285 },
    { gBattleAnimSpriteSheet_183,  0x800, 10286 },
    { gBattleAnimSpriteSheet_056, 0x1000, 10287 },
    { gBattleAnimSpriteSheet_163,  0x100, 10288 },
};

const struct CompressedSpritePalette gBattleAnimPaletteTable[] =
{
    { gBattleAnimSpritePalette_000, 10000 },
    { gBattleAnimSpritePalette_001, 10001 },
    { gBattleAnimSpritePalette_002, 10002 },
    { gBattleAnimSpritePalette_003, 10003 },
    { gBattleAnimSpritePalette_004, 10004 },
    { gBattleAnimSpritePalette_005, 10005 },
    { gBattleAnimSpritePalette_006, 10006 },
    { gBattleAnimSpritePalette_007, 10007 },
    { gBattleAnimSpritePalette_008, 10008 },
    { gBattleAnimSpritePalette_009, 10009 },
    { gBattleAnimSpritePalette_010, 10010 },
    { gBattleAnimSpritePalette_011, 10011 },
    { gBattleAnimSpritePalette_012, 10012 },
    { gBattleAnimSpritePalette_013, 10013 },
    { gBattleAnimSpritePalette_014, 10014 },
    { gBattleAnimSpritePalette_015, 10015 },
    { gBattleAnimSpritePalette_016, 10016 },
    { gBattleAnimSpritePalette_016, 10017 },
    { gBattleAnimSpritePalette_018, 10018 },
    { gBattleAnimSpritePalette_019, 10019 },
    { gBattleAnimSpritePalette_020, 10020 },
    { gBattleAnimSpritePalette_021, 10021 },
    { gBattleAnimSpritePalette_022, 10022 },
    { gBattleAnimSpritePalette_023, 10023 },
    { gBattleAnimSpritePalette_024, 10024 },
    { gBattleAnimSpritePalette_025, 10025 },
    { gBattleAnimSpritePalette_026, 10026 },
    { gBattleAnimSpritePalette_027, 10027 },
    { gBattleAnimSpritePalette_028, 10028 },
    { gBattleAnimSpritePalette_029, 10029 },
    { gBattleAnimSpritePalette_030, 10030 },
    { gBattleAnimSpritePalette_031, 10031 },
    { gBattleAnimSpritePalette_032, 10032 },
    { gBattleAnimSpritePalette_033, 10033 },
    { gBattleAnimSpritePalette_033, 10034 },
    { gBattleAnimSpritePalette_033, 10035 },
    { gBattleAnimSpritePalette_036, 10036 },
    { gBattleAnimSpritePalette_036, 10037 },
    { gBattleAnimSpritePalette_038, 10038 },
    { gBattleAnimSpritePalette_039, 10039 },
    { gBattleAnimSpritePalette_038, 10040 },
    { gBattleAnimSpritePalette_038, 10041 },
    { gBattleAnimSpritePalette_042, 10042 },
    { gBattleAnimSpritePalette_043, 10043 },
    { gBattleAnimSpritePalette_044, 10044 },
    { gBattleAnimSpritePalette_045, 10045 },
    { gBattleAnimSpritePalette_046, 10046 },
    { gBattleAnimSpritePalette_047, 10046 },
    { gBattleAnimSpritePalette_048, 10048 },
    { gBattleAnimSpritePalette_049, 10049 },
    { gBattleAnimSpritePalette_050, 10050 },
    { gBattleAnimSpritePalette_050, 10051 },
    { gBattleAnimSpritePalette_050, 10052 },
    { gBattleAnimSpritePalette_026, 10053 },
    { gBattleAnimSpritePalette_054, 10054 },
    { gBattleAnimSpritePalette_050, 10055 },
    { gBattleAnimSpritePalette_056, 10056 },
    { gBattleAnimSpritePalette_057, 10057 },
    { gBattleAnimSpritePalette_058, 10058 },
    { gBattleAnimSpritePalette_059, 10059 },
    { gBattleAnimSpritePalette_060, 10060 },
    { gBattleAnimSpritePalette_061, 10061 },
    { gBattleAnimSpritePalette_062, 10062 },
    { gBattleAnimSpritePalette_063, 10063 },
    { gBattleAnimSpritePalette_064, 10064 },
    { gBattleAnimSpritePalette_065, 10065 },
    { gBattleAnimSpritePalette_066, 10066 },
    { gBattleAnimSpritePalette_067, 10067 },
    { gBattleAnimSpritePalette_068, 10068 },
    { gBattleAnimSpritePalette_065, 10069 },
    { gBattleAnimSpritePalette_070, 10070 },
    { gBattleAnimSpritePalette_070, 10071 },
    { gBattleAnimSpritePalette_072, 10072 },
    { gBattleAnimSpritePalette_073, 10073 },
    { gBattleAnimSpritePalette_074, 10074 },
    { gBattleAnimSpritePalette_075, 10075 },
    { gBattleAnimSpritePalette_076, 10076 },
    { gBattleAnimSpritePalette_076, 10077 },
    { gBattleAnimSpritePalette_078, 10078 },
    { gBattleAnimSpritePalette_078, 10079 },
    { gBattleAnimSpritePalette_080, 10080 },
    { gBattleAnimSpritePalette_081, 10081 },
    { gBattleAnimSpritePalette_082, 10082 },
    { gBattleAnimSpritePalette_083, 10083 },
    { gBattleAnimSpritePalette_084, 10084 },
    { gBattleAnimSpritePalette_085, 10085 },
    { gBattleAnimSpritePalette_086, 10086 },
    { gBattleAnimSpritePalette_087, 10087 },
    { gBattleAnimSpritePalette_088, 10088 },
    { gBattleAnimSpritePalette_089, 10089 },
    { gBattleAnimSpritePalette_090, 10090 },
    { gBattleAnimSpritePalette_091, 10091 },
    { gBattleAnimSpritePalette_092, 10092 },
    { gBattleAnimSpritePalette_093, 10093 },
    { gBattleAnimSpritePalette_094, 10094 },
    { gBattleAnimSpritePalette_095, 10095 },
    { gBattleAnimSpritePalette_096, 10096 },
    { gBattleAnimSpritePalette_097, 10097 },
    { gBattleAnimSpritePalette_094, 10098 },
    { gBattleAnimSpritePalette_099, 10099 },
    { gBattleAnimSpritePalette_100, 10100 },
    { gBattleAnimSpritePalette_101, 10101 },
    { gBattleAnimSpritePalette_101, 10102 },
    { gBattleAnimSpritePalette_103, 10103 },
    { gBattleAnimSpritePalette_104, 10104 },
    { gBattleAnimSpritePalette_105, 10105 },
    { gBattleAnimSpritePalette_105, 10106 },
    { gBattleAnimSpritePalette_107, 10107 },
    { gBattleAnimSpritePalette_107, 10108 },
    { gBattleAnimSpritePalette_109, 10109 },
    { gBattleAnimSpritePalette_109, 10110 },
    { gBattleAnimSpritePalette_111, 10111 },
    { gBattleAnimSpritePalette_112, 10112 },
    { gBattleAnimSpritePalette_113, 10113 },
    { gBattleAnimSpritePalette_114, 10114 },
    { gBattleAnimSpritePalette_115, 10115 },
    { gBattleAnimSpritePalette_116, 10116 },
    { gBattleAnimSpritePalette_117, 10117 },
    { gBattleAnimSpritePalette_118, 10118 },
    { gBattleAnimSpritePalette_119, 10119 },
    { gBattleAnimSpritePalette_120, 10120 },
    { gBattleAnimSpritePalette_121, 10121 },
    { gBattleAnimSpritePalette_122, 10122 },
    { gBattleAnimSpritePalette_122, 10123 },
    { gBattleAnimSpritePalette_124, 10124 },
    { gBattleAnimSpritePalette_125, 10125 },
    { gBattleAnimSpritePalette_126, 10126 },
    { gBattleAnimSpritePalette_127, 10127 },
    { gBattleAnimSpritePalette_128, 10128 },
    { gBattleAnimSpritePalette_128, 10129 },
    { gBattleAnimSpritePalette_130, 10130 },
    { gBattleAnimSpritePalette_130, 10131 },
    { gBattleAnimSpritePalette_132, 10132 },
    { gBattleAnimSpritePalette_133, 10133 },
    { gBattleAnimSpritePalette_133, 10134 },
    { gBattleAnimSpritePalette_135, 10135 },
    { gBattleAnimSpritePalette_136, 10136 },
    { gBattleAnimSpritePalette_135, 10137 },
    { gBattleAnimSpritePalette_135, 10138 },
    { gBattleAnimSpritePalette_139, 10139 },
    { gBattleAnimSpritePalette_140, 10140 },
    { gBattleAnimSpritePalette_141, 10141 },
    { gBattleAnimSpritePalette_141, 10142 },
    { gBattleAnimSpritePalette_143, 10143 },
    { gBattleAnimSpritePalette_144, 10144 },
    { gBattleAnimSpritePalette_139, 10145 },
    { gBattleAnimSpritePalette_115, 10146 },
    { gBattleAnimSpritePalette_147, 10147 },
    { gBattleAnimSpritePalette_148, 10148 },
    { gBattleAnimSpritePalette_148, 10149 },
    { gBattleAnimSpritePalette_150, 10150 },
    { gBattleAnimSpritePalette_150, 10151 },
    { gBattleAnimSpritePalette_152, 10152 },
    { gBattleAnimSpritePalette_153, 10153 },
    { gBattleAnimSpritePalette_154, 10154 },
    { gBattleAnimSpritePalette_155, 10155 },
    { gBattleAnimSpritePalette_156, 10156 },
    { gBattleAnimSpritePalette_157, 10157 },
    { gBattleAnimSpritePalette_158, 10158 },
    { gBattleAnimSpritePalette_159, 10159 },
    { gBattleAnimSpritePalette_160, 10160 },
    { gBattleAnimSpritePalette_161, 10161 },
    { gBattleAnimSpritePalette_162, 10162 },
    { gBattleAnimSpritePalette_163, 10163 },
    { gBattleAnimSpritePalette_164, 10164 },
    { gBattleAnimSpritePalette_165, 10165 },
    { gBattleAnimSpritePalette_166, 10166 },
    { gBattleAnimSpritePalette_167, 10167 },
    { gBattleAnimSpritePalette_168, 10168 },
    { gBattleAnimSpritePalette_169, 10169 },
    { gBattleAnimSpritePalette_170, 10170 },
    { gBattleAnimSpritePalette_171, 10171 },
    { gBattleAnimSpritePalette_172, 10172 },
    { gBattleAnimSpritePalette_001, 10173 },
    { gBattleAnimSpritePalette_174, 10174 },
    { gBattleAnimSpritePalette_175, 10175 },
    { gBattleAnimSpritePalette_176, 10176 },
    { gBattleAnimSpritePalette_177, 10177 },
    { gBattleAnimSpritePalette_178, 10178 },
    { gBattleAnimSpritePalette_179, 10179 },
    { gBattleAnimSpritePalette_179, 10180 },
    { gBattleAnimSpritePalette_179, 10181 },
    { gBattleAnimSpritePalette_182, 10182 },
    { gBattleAnimSpritePalette_183, 10183 },
    { gBattleAnimSpritePalette_184, 10184 },
    { gBattleAnimSpritePalette_185, 10185 },
    { gBattleAnimSpritePalette_186, 10186 },
    { gBattleAnimSpritePalette_187, 10187 },
    { gBattleAnimSpritePalette_188, 10188 },
    { gBattleAnimSpritePalette_189, 10189 },
    { gBattleAnimSpritePalette_190, 10190 },
    { gBattleAnimSpritePalette_191, 10191 },
    { gBattleAnimSpritePalette_192, 10192 },
    { gBattleAnimSpritePalette_193, 10193 },
    { gBattleAnimSpritePalette_194, 10194 },
    { gBattleAnimSpritePalette_195, 10195 },
    { gBattleAnimSpritePalette_196, 10196 },
    { gBattleAnimSpritePalette_197, 10197 },
    { gBattleAnimSpritePalette_198, 10198 },
    { gBattleAnimSpritePalette_199, 10199 },
    { gBattleAnimSpritePalette_200, 10200 },
    { gBattleAnimSpritePalette_201, 10201 },
    { gBattleAnimSpritePalette_202, 10202 },
    { gBattleAnimSpritePalette_203, 10203 },
    { gBattleAnimSpritePalette_204, 10204 },
    { gBattleAnimSpritePalette_205, 10205 },
    { gBattleAnimSpritePalette_206, 10206 },
    { gBattleAnimSpritePalette_207, 10207 },
    { gBattleAnimSpritePalette_167, 10208 },
    { gBattleAnimSpritePalette_209, 10209 },
    { gBattleAnimSpritePalette_210, 10210 },
    { gBattleAnimSpritePalette_211, 10211 },
    { gBattleAnimSpritePalette_211, 10212 },
    { gBattleAnimSpritePalette_211, 10213 },
    { gBattleAnimSpritePalette_064, 10214 },
    { gBattleAnimSpritePalette_215, 10215 },
    { gBattleAnimSpritePalette_216, 10216 },
    { gBattleAnimSpritePalette_217, 10217 },
    { gBattleAnimSpritePalette_218, 10218 },
    { gBattleAnimSpritePalette_219, 10219 },
    { gBattleAnimSpritePalette_220, 10220 },
    { gBattleAnimSpritePalette_221, 10221 },
    { gBattleAnimSpritePalette_222, 10222 },
    { gBattleAnimSpritePalette_223, 10223 },
    { gBattleAnimSpritePalette_224, 10224 },
    { gBattleAnimSpritePalette_225, 10225 },
    { gBattleAnimSpritePalette_226, 10226 },
    { gBattleAnimSpritePalette_226, 10227 },
    { gBattleAnimSpritePalette_228, 10228 },
    { gBattleAnimSpritePalette_229, 10229 },
    { gBattleAnimSpritePalette_230, 10230 },
    { gBattleAnimSpritePalette_231, 10231 },
    { gBattleAnimSpritePalette_231, 10232 },
    { gBattleAnimSpritePalette_233, 10233 },
    { gBattleAnimSpritePalette_234, 10234 },
    { gBattleAnimSpritePalette_235, 10235 },
    { gBattleAnimSpritePalette_236, 10236 },
    { gBattleAnimSpritePalette_237, 10237 },
    { gBattleAnimSpritePalette_238, 10238 },
    { gBattleAnimSpritePalette_239, 10239 },
    { gBattleAnimSpritePalette_240, 10240 },
    { gBattleAnimSpritePalette_241, 10241 },
    { gBattleAnimSpritePalette_242, 10242 },
    { gBattleAnimSpritePalette_243, 10243 },
    { gBattleAnimSpritePalette_244, 10244 },
    { gBattleAnimSpritePalette_245, 10245 },
    { gBattleAnimSpritePalette_245, 10246 },
    { gBattleAnimSpritePalette_064, 10247 },
    { gBattleAnimSpritePalette_248, 10248 },
    { gBattleAnimSpritePalette_249, 10249 },
    { gBattleAnimSpritePalette_249, 10250 },
    { gBattleAnimSpritePalette_251, 10251 },
    { gBattleAnimSpritePalette_252, 10252 },
    { gBattleAnimSpritePalette_253, 10253 },
    { gBattleAnimSpritePalette_254, 10254 },
    { gBattleAnimSpritePalette_255, 10255 },
    { gBattleAnimSpritePalette_256, 10256 },
    { gBattleAnimSpritePalette_257, 10257 },
    { gBattleAnimSpritePalette_258, 10258 },
    { gBattleAnimSpritePalette_259, 10259 },
    { gBattleAnimSpritePalette_260, 10260 },
    { gBattleAnimSpritePalette_261, 10261 },
    { gBattleAnimSpritePalette_262, 10262 },
    { gBattleAnimSpritePalette_263, 10263 },
    { gBattleAnimSpritePalette_264, 10264 },
    { gBattleAnimSpritePalette_265, 10265 },
    { gBattleAnimSpritePalette_266, 10266 },
    { gBattleAnimSpritePalette_267, 10267 },
    { gBattleAnimSpritePalette_268, 10268 },
    { gBattleAnimSpritePalette_269, 10269 },
    { gBattleAnimSpritePalette_270, 10270 },
    { gBattleAnimSpritePalette_271, 10271 },
    { gBattleAnimSpritePalette_272, 10272 },
    { gBattleAnimSpritePalette_272, 10273 },
    { gBattleAnimSpritePalette_274, 10274 },
    { gBattleAnimSpritePalette_274, 10275 },
    { gBattleAnimSpritePalette_274, 10276 },
    { gBattleAnimSpritePalette_277, 10277 },
    { gBattleAnimSpritePalette_278, 10278 },
    { gBattleAnimSpritePalette_279, 10279 },
    { gBattleAnimSpritePalette_280, 10280 },
    { gBattleAnimSpritePalette_281, 10281 },
    { gBattleAnimSpritePalette_282, 10282 },
    { gBattleAnimSpritePalette_283, 10283 },
    { gBattleAnimSpritePalette_284, 10284 },
    { gBattleAnimSpritePalette_285, 10285 },
    { gBattleAnimSpritePalette_286, 10286 },
    { gBattleAnimSpritePalette_287, 10287 },
    { gBattleAnimSpritePalette_288, 10288 },
};

const struct BattleAnimBackground gBattleAnimBackgroundTable[] =
{
    &gBattleAnimBackgroundImage_00, &gBattleAnimBackgroundPalette_00, &gBattleAnimBackgroundTilemap_00,
    &gBattleAnimBackgroundImage_00, &gBattleAnimBackgroundPalette_00, &gBattleAnimBackgroundTilemap_00,
    &gBattleAnimBackgroundImage_02, &gBattleAnimBackgroundPalette_02, &gBattleAnimBackgroundTilemap_02,
    &gBattleAnimBackgroundImage_03, &gBattleAnimBackgroundPalette_03, &gBattleAnimBackgroundTilemap_03,
    &gBattleAnimBackgroundImage_04, &gBattleAnimBackgroundPalette_04, &gBattleAnimBackgroundTilemap_04,
    &gBattleAnimBackgroundImage_04, &gBattleAnimBackgroundPalette_04, &gBattleAnimBackgroundTilemap_05,
    &gBattleAnimBackgroundImage_04, &gBattleAnimBackgroundPalette_04, &gBattleAnimBackgroundTilemap_06,
    &gBattleAnimBackgroundImage_07, &gBattleAnimBackgroundPalette_07, &gBattleAnimBackgroundTilemap_07,
    &gBattleAnimBackgroundImage_07, &gBattleAnimBackgroundPalette_07, &gBattleAnimBackgroundTilemap_08,
    &gBattleAnimBackgroundImage_09, &gBattleAnimBackgroundPalette_09, &gBattleAnimBackgroundTilemap_09,
    &gBattleAnimBackgroundImage_09, &gBattleAnimBackgroundPalette_09, &gBattleAnimBackgroundTilemap_10,
    &gBattleAnimBackgroundImage_11, &gBattleAnimBackgroundPalette_11, &gBattleAnimBackgroundTilemap_11,
    &gBattleAnimBackgroundImage_12, &gBattleAnimBackgroundPalette_12, &gBattleAnimBackgroundTilemap_12,
    &gBattleAnimBackgroundImage_12, &gBattleAnimBackgroundPalette_12, &gBattleAnimBackgroundTilemap_13,
    &gBattleAnimBackgroundImage_12, &gBattleAnimBackgroundPalette_12, &gBattleAnimBackgroundTilemap_14,
    &gBattleAnimBackgroundImage_15, &gBattleAnimBackgroundPalette_15, &gBattleAnimBackgroundTilemap_15,
    &gBattleAnimBackgroundImage_16, &gBattleAnimBackgroundPalette_16, &gBattleAnimBackgroundTilemap_16,
    &gBattleAnimBackgroundImage_17, &gBattleAnimBackgroundPalette_17, &gBattleAnimBackgroundTilemap_17,
    &gBattleAnimBackgroundImage_07, &gBattleAnimBackgroundPalette_18, &gBattleAnimBackgroundTilemap_07,
    &gBattleAnimBackgroundImage_07, &gBattleAnimBackgroundPalette_18, &gBattleAnimBackgroundTilemap_08,
    &gBattleAnimBackgroundImage_20, &gBattleAnimBackgroundPalette_20, &gBattleAnimBackgroundTilemap_20,
    &gBattleAnimBackgroundImage_21, &gBattleAnimBackgroundPalette_21, &gBattleAnimBackgroundTilemap_21,
    &gBattleAnimBackgroundImage_09, &gBattleAnimBackgroundPalette_22, &gBattleAnimBackgroundTilemap_09,
    &gBattleAnimBackgroundImage_09, &gBattleAnimBackgroundPalette_22, &gBattleAnimBackgroundTilemap_10,
    &gBattleAnimBackgroundImage_04, &gBattleAnimBackgroundPalette_24, &gBattleAnimBackgroundTilemap_04,
    &gBattleAnimBackgroundImage_04, &gBattleAnimBackgroundPalette_24, &gBattleAnimBackgroundTilemap_05,
    &gBattleAnimBackgroundImage_04, &gBattleAnimBackgroundPalette_24, &gBattleAnimBackgroundTilemap_06,
};

extern u16 gBattlerPartyIndexes[4];
extern u8 gBankSpriteIds[];
extern u8 gBankAttacker;
extern u8 gBankTarget;
EWRAM_DATA const u8 *sBattleAnimScriptPtr = NULL;
EWRAM_DATA const u8 *gBattleAnimScriptRetAddr = NULL;
EWRAM_DATA void (*gAnimScriptCallback)(void) = NULL;
EWRAM_DATA s8 gAnimFramesToWait = 0;
EWRAM_DATA u8 gAnimScriptActive = FALSE;
EWRAM_DATA u8 gAnimVisualTaskCount = 0;
EWRAM_DATA u8 gAnimSoundTaskCount = 0;
EWRAM_DATA struct DisableStruct *gAnimDisableStructPtr = NULL;
EWRAM_DATA s32 gAnimMoveDmg = 0;
EWRAM_DATA u16 gAnimMovePower = 0;
EWRAM_DATA u8 gAnimFriendship = 0;
EWRAM_DATA u16 gWeatherMoveAnim = 0;
EWRAM_DATA u8 gMonAnimTaskIdArray[2] = {0};
EWRAM_DATA u8 gAnimMoveTurn = 0;
EWRAM_DATA u8 sAnimBackgroundFadeState = 0;
EWRAM_DATA u16 sAnimMoveIndex = 0; // set but unused.
EWRAM_DATA u8 gAnimBankAttacker = 0;
EWRAM_DATA u8 gAnimBankTarget = 0;
EWRAM_DATA u16 gAnimSpeciesByBanks[4] = {0};
EWRAM_DATA u8 gUnknown_0202F7D2 = 0; // some global pan variable

u16 gSoundAnimFramesToWait;
s16 gBattleAnimArgs[ANIM_ARGS_COUNT];
u16 gAnimSpriteIndexArray[ANIM_SPRITE_INDEX_COUNT];

extern struct MusicPlayerInfo gMPlay_BGM;
extern struct MusicPlayerInfo gMPlay_SE1;
extern struct MusicPlayerInfo gMPlay_SE2;

extern const u16 gSingingMoves[];
extern const u8 *const gBattleAnims_Moves[];

static void RunAnimScriptCommand(void);
static void ScriptCmd_loadspritegfx(void);
static void ScriptCmd_unloadspritegfx(void);
static void ScriptCmd_createsprite(void);
static void ScriptCmd_createvisualtask(void);
static void ScriptCmd_delay(void);
static void ScriptCmd_waitforvisualfinish(void);
static void ScriptCmd_hang1(void);
static void ScriptCmd_hang2(void);
static void ScriptCmd_end(void);
static void ScriptCmd_playse(void);
static void ScriptCmd_monbg(void);
static void sub_8076380(void);
static void task_pA_ma0A_obj_to_bg_pal(u8);
static void ScriptCmd_clearmonbg(void);
static void sub_807672C(u8);
static void ScriptCmd_monbg_22(void);
static void ScriptCmd_clearmonbg_23(void);
static void sub_80769A4(u8);
static void ScriptCmd_setalpha(void);
static void ScriptCmd_setbldcnt(void);
static void ScriptCmd_blendoff(void);
static void ScriptCmd_call(void);
static void ScriptCmd_return(void);
static void ScriptCmd_setarg(void);
static void ScriptCmd_choosetwoturnanim(void);
static void ScriptCmd_jumpifmoveturn(void);
static void ScriptCmd_jump(void);
static void ScriptCmd_fadetobg(void);
static void ScriptCmd_fadetobgfromset(void);
static void Task_FadeToBg(u8);
static void LoadMoveBg(u16);
static void LoadDefaultBg(void);
static void ScriptCmd_restorebg(void);
static void ScriptCmd_waitbgfadeout(void);
static void ScriptCmd_waitbgfadein(void);
static void ScriptCmd_changebg(void);
static void ScriptCmd_playsewithpan(void);
static void ScriptCmd_setpan(void);
static void ScriptCmd_panse_1B(void);
static void Task_PanFromInitialToTarget(u8);
static void ScriptCmd_panse_26(void);
static void ScriptCmd_panse_27(void);
static void ScriptCmd_loopsewithpan(void);
static void Task_LoopAndPlaySE(u8);
static void ScriptCmd_waitplaysewithpan(void);
static void Task_WaitAndPlaySE(u8);
static void ScriptCmd_createsoundtask(void);
static void ScriptCmd_waitsound(void);
static void ScriptCmd_jumpargeq(void);
static void ScriptCmd_jumpifcontest(void);
static void ScriptCmd_monbgprio_28(void);
static void ScriptCmd_monbgprio_29(void);
static void ScriptCmd_monbgprio_2A(void);
static void ScriptCmd_invisible(void);
static void ScriptCmd_visible(void);
static void ScriptCmd_doublebattle_2D(void);
static void ScriptCmd_doublebattle_2E(void);
static void ScriptCmd_stopsound(void);

static void (*const sScriptCmdTable[])(void) = {
    ScriptCmd_loadspritegfx,
    ScriptCmd_unloadspritegfx,
    ScriptCmd_createsprite,
    ScriptCmd_createvisualtask,
    ScriptCmd_delay,
    ScriptCmd_waitforvisualfinish,
    ScriptCmd_hang1,
    ScriptCmd_hang2,
    ScriptCmd_end,
    ScriptCmd_playse,
    ScriptCmd_monbg,
    ScriptCmd_clearmonbg,
    ScriptCmd_setalpha,
    ScriptCmd_blendoff,
    ScriptCmd_call,
    ScriptCmd_return,
    ScriptCmd_setarg,
    ScriptCmd_choosetwoturnanim,
    ScriptCmd_jumpifmoveturn,
    ScriptCmd_jump,
    ScriptCmd_fadetobg,
    ScriptCmd_restorebg,
    ScriptCmd_waitbgfadeout,
    ScriptCmd_waitbgfadein,
    ScriptCmd_changebg,
    ScriptCmd_playsewithpan,
    ScriptCmd_setpan,
    ScriptCmd_panse_1B,
    ScriptCmd_loopsewithpan,
    ScriptCmd_waitplaysewithpan,
    ScriptCmd_setbldcnt,
    ScriptCmd_createsoundtask,
    ScriptCmd_waitsound,
    ScriptCmd_jumpargeq,
    ScriptCmd_monbg_22,
    ScriptCmd_clearmonbg_23,
    ScriptCmd_jumpifcontest,
    ScriptCmd_fadetobgfromset,
    ScriptCmd_panse_26,
    ScriptCmd_panse_27,
    ScriptCmd_monbgprio_28,
    ScriptCmd_monbgprio_29,
    ScriptCmd_monbgprio_2A,
    ScriptCmd_invisible,
    ScriptCmd_visible,
    ScriptCmd_doublebattle_2D,
    ScriptCmd_doublebattle_2E,
    ScriptCmd_stopsound,
};

void ClearBattleAnimationVars(void)
{
    s32 i;

    gAnimFramesToWait = 0;
    gAnimScriptActive = FALSE;
    gAnimVisualTaskCount = 0;
    gAnimSoundTaskCount = 0;
    gAnimDisableStructPtr = NULL;
    gAnimMoveDmg = 0;
    gAnimMovePower = 0;
    gAnimFriendship = 0;

    // clear index array.
    for (i = 0; i < ANIM_SPRITE_INDEX_COUNT; i++)
        gAnimSpriteIndexArray[i] |= 0xFFFF;

    // clear anim args.
    for (i = 0; i < ANIM_ARGS_COUNT; i++)
        gBattleAnimArgs[i] = 0;

    gMonAnimTaskIdArray[0] = 0xFF;
    gMonAnimTaskIdArray[1] = 0xFF;
    gAnimMoveTurn = 0;
    sAnimBackgroundFadeState = 0;
    sAnimMoveIndex = 0;
    gAnimBankAttacker = 0;
    gAnimBankTarget = 0;
    gUnknown_0202F7D2 = 0;
}

void DoMoveAnim(u16 move)
{
    gAnimBankAttacker = gBankAttacker;
    gAnimBankTarget = gBankTarget;
    LaunchBattleAnimation(gBattleAnims_Moves, move, TRUE);
}

void LaunchBattleAnimation(const u8 *const moveAnims[], u16 move, u8 isMoveAnim)
{
    s32 i;

    if (!IsContest())
    {
        sub_8079E24();
        UpdateOamPriorityInAllHealthboxes(0);
        for (i = 0; i < 4; i++)
        {
            if (GetBattlerSide(i) != 0)
                gAnimSpeciesByBanks[i] = GetMonData(&gEnemyParty[gBattlerPartyIndexes[i]], MON_DATA_SPECIES);
            else
                gAnimSpeciesByBanks[i] = GetMonData(&gPlayerParty[gBattlerPartyIndexes[i]], MON_DATA_SPECIES);
        }
    }
    else
    {
        for (i = 0; i < 4; i++)
            gAnimSpeciesByBanks[i] = EWRAM_19348[0];
    }

    if (isMoveAnim == 0)
        sAnimMoveIndex = 0;
    else
        sAnimMoveIndex = move;

    for (i = 0; i < ANIM_ARGS_COUNT; i++)
        gBattleAnimArgs[i] = 0;

    gMonAnimTaskIdArray[0] = 0xFF;
    gMonAnimTaskIdArray[1] = 0xFF;
    sBattleAnimScriptPtr = moveAnims[move];
    gAnimScriptActive = TRUE;
    gAnimFramesToWait = 0;
    gAnimScriptCallback = RunAnimScriptCommand;

    for (i = 0; i < ANIM_SPRITE_INDEX_COUNT; i++)
        gAnimSpriteIndexArray[i] |= 0xFFFF;

    if (isMoveAnim)
    {
        for (i = 0; gSingingMoves[i] != 0xFFFF; i++)
        {
            if (move == gSingingMoves[i])
            {
                // Lower the volume for the short song that gets played.
                m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 128);
                break;
            }
        }
    }

    gBattle_WIN0H = 0;
    gBattle_WIN0V = 0;
    gBattle_WIN1H = 0;
    gBattle_WIN1V = 0;
}

void DestroyAnimSprite(struct Sprite *sprite)
{
    FreeSpriteOamMatrix(sprite);
    DestroySprite(sprite);
    gAnimVisualTaskCount--;
}

void DestroyAnimVisualTask(u8 taskId)
{
    DestroyTask(taskId);
    gAnimVisualTaskCount--;
}

void DestroyAnimSoundTask(u8 taskId)
{
    DestroyTask(taskId);
    gAnimSoundTaskCount--;
}

static void AddSpriteIndex(u16 index)
{
    s32 i;

    for (i = 0; i < ANIM_SPRITE_INDEX_COUNT; i++)
    {
        if (gAnimSpriteIndexArray[i] == 0xFFFF)
        {
            gAnimSpriteIndexArray[i] = index;
            return;
        }
    }
}

static void ClearSpriteIndex(u16 index)
{
    s32 i;

    for (i = 0; i < ANIM_SPRITE_INDEX_COUNT; i++)
    {
        if (gAnimSpriteIndexArray[i] == index)
        {
            gAnimSpriteIndexArray[i] |= 0xFFFF;
            return;
        }
    }
}

static void WaitAnimFrameCount(void)
{
    if (gAnimFramesToWait <= 0)
    {
        gAnimScriptCallback = RunAnimScriptCommand;
        gAnimFramesToWait = 0;
    }
    else
    {
        gAnimFramesToWait--;
    }
}

static void RunAnimScriptCommand(void)
{
    do
    {
        sScriptCmdTable[T1_READ_8(sBattleAnimScriptPtr)]();
    } while (gAnimFramesToWait == 0 && gAnimScriptActive);
}

static void ScriptCmd_loadspritegfx(void)
{
    u16 tag;

    sBattleAnimScriptPtr++;
    tag = T1_READ_16(sBattleAnimScriptPtr);
    LoadCompressedObjectPic(&gBattleAnimPicTable[GET_TRUE_SPRITE_INDEX(tag)]);
    LoadCompressedObjectPalette(&gBattleAnimPaletteTable[GET_TRUE_SPRITE_INDEX(tag)]);
    sBattleAnimScriptPtr += 2;
    AddSpriteIndex(GET_TRUE_SPRITE_INDEX(tag));
    gAnimFramesToWait = 1;
    gAnimScriptCallback = WaitAnimFrameCount;
}

static void ScriptCmd_unloadspritegfx(void)
{
    u16 tag;

    sBattleAnimScriptPtr++;
    tag = T1_READ_16(sBattleAnimScriptPtr);
    FreeSpriteTilesByTag(gBattleAnimPicTable[GET_TRUE_SPRITE_INDEX(tag)].tag);
    FreeSpritePaletteByTag(gBattleAnimPicTable[GET_TRUE_SPRITE_INDEX(tag)].tag);
    sBattleAnimScriptPtr += 2;
    ClearSpriteIndex(GET_TRUE_SPRITE_INDEX(tag));
}

static void ScriptCmd_createsprite(void)
{
    s32 i;
    const struct SpriteTemplate *template;
    u8 argVar;
    u8 argsCount;
    s16 subpriority;

    sBattleAnimScriptPtr++;
    template = (const struct SpriteTemplate *)(T2_READ_32(sBattleAnimScriptPtr));
    sBattleAnimScriptPtr += 4;

    argVar = T1_READ_8(sBattleAnimScriptPtr);
    sBattleAnimScriptPtr++;

    argsCount = T1_READ_8(sBattleAnimScriptPtr);
    sBattleAnimScriptPtr++;
    for (i = 0; i < argsCount; i++)
    {
        gBattleAnimArgs[i] = T1_READ_16(sBattleAnimScriptPtr);
        sBattleAnimScriptPtr += 2;
    }

    if (argVar & 0x80)
    {
        argVar ^= 0x80;
        if (argVar >= 0x40)
            argVar -= 0x40;
        else
            argVar *= -1;

        subpriority = sub_8079E90(gAnimBankTarget) + (s8)(argVar);
    }
    else
    {
        if (argVar >= 0x40)
            argVar -= 0x40;
        else
            argVar *= -1;

        subpriority = sub_8079E90(gAnimBankAttacker) + (s8)(argVar);
    }

    if (subpriority < 3)
        subpriority = 3;

    CreateSpriteAndAnimate(template, GetBattlerSpriteCoord(gAnimBankTarget, 2), GetBattlerSpriteCoord(gAnimBankTarget, 3), subpriority);
    gAnimVisualTaskCount++;
}

static void ScriptCmd_createvisualtask(void)
{
    TaskFunc taskFunc;
    u8 taskPriority;
    u8 taskId;
    u8 numArgs;
    s32 i;

    sBattleAnimScriptPtr++;

    taskFunc = (TaskFunc)T2_READ_32(sBattleAnimScriptPtr);
    sBattleAnimScriptPtr += 4;

    taskPriority = T1_READ_8(sBattleAnimScriptPtr);
    sBattleAnimScriptPtr++;

    numArgs = T1_READ_8(sBattleAnimScriptPtr);
    sBattleAnimScriptPtr++;

    for (i = 0; i < numArgs; i++)
    {
        gBattleAnimArgs[i] = T1_READ_16(sBattleAnimScriptPtr);
        sBattleAnimScriptPtr += 2;
    }

    taskId = CreateTask(taskFunc, taskPriority);
    taskFunc(taskId);
    gAnimVisualTaskCount++;
}

static void ScriptCmd_delay(void)
{
    sBattleAnimScriptPtr++;
    gAnimFramesToWait = T1_READ_8(sBattleAnimScriptPtr);
    if (gAnimFramesToWait == 0)
        gAnimFramesToWait = -1;
    sBattleAnimScriptPtr++;
    gAnimScriptCallback = WaitAnimFrameCount;
}

// wait for visual tasks to finish.
static void ScriptCmd_waitforvisualfinish(void)
{
    if (gAnimVisualTaskCount == 0)
    {
        sBattleAnimScriptPtr++;
        gAnimFramesToWait = 0;
    }
    else
    {
        gAnimFramesToWait = 1;
    }
}

static void ScriptCmd_hang1(void)
{
}

static void ScriptCmd_hang2(void)
{
}

static void ScriptCmd_end(void)
{
    s32 i;
    bool32 continuousAnim = FALSE;

    // keep waiting as long as there is animations to be done.
    if (gAnimVisualTaskCount != 0 || gAnimSoundTaskCount != 0
     || gMonAnimTaskIdArray[0] != 0xFF || gMonAnimTaskIdArray[1] != 0xFF)
    {
        gSoundAnimFramesToWait = 0;
        gAnimFramesToWait = 1;
        return;
    }

    // finish the sound effects.
    if (IsSEPlaying())
    {
        if (++gSoundAnimFramesToWait <= 90) // wait 90 frames, then halt the sound effect.
        {
            gAnimFramesToWait = 1;
            return;
        }
        else
        {
            m4aMPlayStop(&gMPlay_SE1);
            m4aMPlayStop(&gMPlay_SE2);
        }
    }

    // the SE has halted, so set the SE Frame Counter to 0 and continue.
    gSoundAnimFramesToWait = 0;

    for (i = 0; i < ANIM_SPRITE_INDEX_COUNT; i++)
    {
        if (gAnimSpriteIndexArray[i] != 0xFFFF)
        {
            FreeSpriteTilesByTag(gBattleAnimPicTable[gAnimSpriteIndexArray[i]].tag);
            FreeSpritePaletteByTag(gBattleAnimPicTable[gAnimSpriteIndexArray[i]].tag);
            gAnimSpriteIndexArray[i] |= 0xFFFF; // set terminator.
        }
    }

    if (!continuousAnim) // may have been used for debug?
    {
        m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 256);
        if (IsContest() == 0)
        {
            sub_8079E24();
            UpdateOamPriorityInAllHealthboxes(1);
        }
        gAnimScriptActive = FALSE;
    }
}

static void ScriptCmd_playse(void)
{
    sBattleAnimScriptPtr++;
    PlaySE(T1_READ_16(sBattleAnimScriptPtr));
    sBattleAnimScriptPtr += 2;
}

static void ScriptCmd_monbg(void)
{
    u8 animBank;
    u8 bank;
    u8 identity;
    bool8 toBG_2;
    u16 spriteId;
    u8 taskId;

    sBattleAnimScriptPtr++;
    animBank = T1_READ_8(sBattleAnimScriptPtr);
    if (animBank == ANIM_BANK_ATTACKER)
        animBank = ANIM_BANK_ATK_PARTNER;
    else if (animBank == ANIM_BANK_TARGET)
        animBank = ANIM_BANK_DEF_PARTNER;

    if (animBank == ANIM_BANK_ATTACKER || animBank == ANIM_BANK_ATK_PARTNER)
        bank = gAnimBankAttacker;
    else
        bank = gAnimBankTarget;

    if (IsAnimBankSpriteVisible(bank))
    {
        identity = GetBattlerPosition(bank);
        identity += 0xFF;
        if (identity <= 1 || IsContest() != 0)
            toBG_2 = 0;
        else
            toBG_2 = 1;

        MoveBattlerSpriteToBG(bank, toBG_2);
        spriteId = gBankSpriteIds[bank];
        taskId = CreateTask(task_pA_ma0A_obj_to_bg_pal, 10);
        gTasks[taskId].data[0] = spriteId;
        gTasks[taskId].data[1] = gSprites[spriteId].pos1.x + gSprites[spriteId].pos2.x;
        gTasks[taskId].data[2] = gSprites[spriteId].pos1.y + gSprites[spriteId].pos2.y;
        if (toBG_2 == 0)
        {
            gTasks[taskId].data[3] = gBattle_BG1_X;
            gTasks[taskId].data[4] = gBattle_BG1_Y;
        }
        else
        {
            gTasks[taskId].data[3] = gBattle_BG2_X;
            gTasks[taskId].data[4] = gBattle_BG2_Y;
        }
        gTasks[taskId].data[5] = toBG_2;
        gTasks[taskId].data[6] = bank;
        gMonAnimTaskIdArray[0] = taskId;

    }

    bank ^= 2;
    if (animBank >= ANIM_BANK_ATK_PARTNER && IsAnimBankSpriteVisible(bank))
    {
        identity = GetBattlerPosition(bank);
        identity += 0xFF;
        if (identity <= 1 || IsContest() != 0)
            toBG_2 = 0;
        else
            toBG_2 = 1;
        MoveBattlerSpriteToBG(bank, toBG_2);
        spriteId = gBankSpriteIds[bank];
        taskId = CreateTask(task_pA_ma0A_obj_to_bg_pal, 10);
        gTasks[taskId].data[0] = spriteId;
        gTasks[taskId].data[1] = gSprites[spriteId].pos1.x + gSprites[spriteId].pos2.x;
        gTasks[taskId].data[2] = gSprites[spriteId].pos1.y + gSprites[spriteId].pos2.y;
        if (toBG_2 == 0)
        {
            gTasks[taskId].data[3] = gBattle_BG1_X;
            gTasks[taskId].data[4] = gBattle_BG1_Y;
        }
        else
        {
            gTasks[taskId].data[3] = gBattle_BG2_X;
            gTasks[taskId].data[4] = gBattle_BG2_Y;
        }

        gTasks[taskId].data[5] = toBG_2;
        gTasks[taskId].data[6] = bank;
        gMonAnimTaskIdArray[1] = taskId;
    }

    sBattleAnimScriptPtr++;
}

bool8 IsAnimBankSpriteVisible(u8 bank)
{
    if (IsContest())
    {
        if (bank == gAnimBankAttacker)
            return TRUE;
        else
            return FALSE;
    }
    if (!IsBankSpritePresent(bank))
        return FALSE;
    if (IsContest())
        return TRUE; // this line wont ever be reached.
    if (!(EWRAM_17800[bank].unk0 & 1) || !gSprites[gBankSpriteIds[bank]].invisible)
        return TRUE;

    return FALSE;
}

void MoveBattlerSpriteToBG(u8 bank, u8 toBG_2)
{
    u8 spriteId;

    if (toBG_2 == 0)
    {
        volatile u8 pointlessZero;
        struct UnknownStruct2 s;
        u8 r2;

        sub_8078914(&s);
        DmaFill32Large(3, 0, s.unk0, 0x2000, 0x1000);
        pointlessZero = 0; // is there a stubbed out Dma macro here that left the 0 load in?
        pointlessZero = 0; // is there a stubbed out Dma macro here that left the 0 load in?
        DmaFill16Defvars(3, 0xFF, (void *)s.unk4, 0x1000);

        REG_BG1CNT_BITFIELD.priority = 2;
        REG_BG1CNT_BITFIELD.screenSize = 1;
        REG_BG1CNT_BITFIELD.areaOverflowMode = 0;

        spriteId = gBankSpriteIds[bank];
        gBattle_BG1_X = -(gSprites[spriteId].pos1.x + gSprites[spriteId].pos2.x) + 32;
        if (IsContest() != 0 && IsSpeciesNotUnown(EWRAM_19348[0]) != 0)
            gBattle_BG1_X--;
        gBattle_BG1_Y = -(gSprites[spriteId].pos1.y + gSprites[spriteId].pos2.y) + 32;
        gSprites[gBankSpriteIds[bank]].invisible = TRUE;

        REG_BG1HOFS = gBattle_BG1_X;
        REG_BG1VOFS = gBattle_BG1_Y;

        LoadPalette(gPlttBufferUnfaded + 0x100 + bank * 16, s.unk8 * 16, 32);
        DmaCopy32Defvars(3, gPlttBufferUnfaded + 0x100 + bank * 16, (u16 *)PLTT + s.unk8 * 16, 32);

        if (IsContest() != 0)
            r2 = 0;
        else
            r2 = GetBattlerPosition(bank);
        sub_80E4EF8(0, 0, r2, s.unk8, (u32)s.unk0, (((s32)s.unk4 - VRAM) / 2048), REG_BG1CNT_BITFIELD.charBaseBlock);
        if (IsContest() != 0)
            sub_8076380();
    }
    else
    {
        volatile u8 pointlessZero;

        DmaFill32Large(3, 0, (void *)(VRAM + 0x6000), 0x2000, 0x1000);
        pointlessZero = 0; // is there a stubbed out Dma macro here that left the 0 load in?
        pointlessZero = 0; // is there a stubbed out Dma macro here that left the 0 load in?
        DmaFill32Defvars(3, 0, (void *)(VRAM + 0xF000), 0x800);

        REG_BG2CNT_BITFIELD.priority = 2;
        REG_BG2CNT_BITFIELD.screenSize = 1;
        REG_BG2CNT_BITFIELD.areaOverflowMode = 0;

        spriteId = gBankSpriteIds[bank];
        gBattle_BG2_X = -(gSprites[spriteId].pos1.x + gSprites[spriteId].pos2.x) + 32;
        gBattle_BG2_Y = -(gSprites[spriteId].pos1.y + gSprites[spriteId].pos2.y) + 32;
        gSprites[gBankSpriteIds[bank]].invisible = TRUE;

        REG_BG2HOFS = gBattle_BG2_X;
        REG_BG2VOFS = gBattle_BG2_Y;

        LoadPalette(gPlttBufferUnfaded + 0x100 + bank * 16, 0x90, 32);
        DmaCopy32Defvars(3, gPlttBufferUnfaded + 0x100 + bank * 16, (void *)(PLTT + 0x120), 32);

        sub_80E4EF8(0, 0, GetBattlerPosition(bank), 9, 0x6000, 0x1E, REG_BG2CNT_BITFIELD.charBaseBlock);
    }
}

static void sub_8076380(void)
{
    int i;
    int j;
    struct UnknownStruct2 s;
    u16 *ptr;

    if (IsSpeciesNotUnown(EWRAM_19348[0]))
    {
        sub_8078914(&s);
        ptr = s.unk4;
        for (i = 0; i < 8; i++)
        {
            for (j = 0; j < 4; j++)
            {
                u16 temp = ptr[j + i * 32];

                ptr[j + i * 32] = ptr[7 - j + i * 32];
                ptr[7 - j + i * 32] = temp;
            }
        }
        for (i = 0; i < 8; i++)
        {
            for (j = 0; j < 8; j++)
                ptr[j + i * 32] ^= 0x400;
        }
    }
}

void sub_80763FC(u16 a, u16 *b, u32 c, u8 d)
{
    u8 i;
    u8 j;
    u32 r9;

    if (d == 0)
        r9 = 32;
    else
        r9 = 64;
    a <<= 12;
    for (i = 0; i < r9; i++)
    {
        for (j = 0; j < 32; j++)
            b[j + i * 32] = ((b[j + i * 32] & 0xFFF) | a) + c;
    }
}

void sub_8076464(u8 a)
{
    volatile u8 pointlessZero;
    struct UnknownStruct2 s;

    sub_8078914(&s);
    if (a == 0 || IsContest() != 0)
    {
        DmaFill32Large(3, 0, s.unk0, 0x2000, 0x1000);
        pointlessZero = 0; // is there a stubbed out Dma macro here that left the 0 load in?
        pointlessZero = 0; // is there a stubbed out Dma macro here that left the 0 load in?
        DmaFill32Defvars(3, 0, s.unk4, 0x800);
        gBattle_BG1_X = 0;
        gBattle_BG1_Y = 0;
    }
    else
    {
        DmaFill32Large(3, 0, (void *)(VRAM + 0x6000), 0x2000, 0x1000);
        pointlessZero = 0; // is there a stubbed out Dma macro here that left the 0 load in?
        pointlessZero = 0; // is there a stubbed out Dma macro here that left the 0 load in?
        DmaFill32Defvars(3, 0, (void *)(VRAM + 0xF000), 0x800);
        gBattle_BG2_X = 0;
        gBattle_BG2_Y = 0;
    }
}

static void task_pA_ma0A_obj_to_bg_pal(u8 taskId)
{
    u8 spriteId, palIndex;
    s16 x, y;
    struct UnknownStruct2 s;

    spriteId = gTasks[taskId].data[0];
    palIndex = gTasks[taskId].data[6];
    sub_8078914(&s);
    x = gTasks[taskId].data[1] - (gSprites[spriteId].pos1.x + gSprites[spriteId].pos2.x);
    y = gTasks[taskId].data[2] - (gSprites[spriteId].pos1.y + gSprites[spriteId].pos2.y);

    if (gTasks[taskId].data[5] == 0)
    {
        gBattle_BG1_X = x + gTasks[taskId].data[3];
        gBattle_BG1_Y = y + gTasks[taskId].data[4];
        DmaCopy32Defvars(3, gPlttBufferFaded + 0x100 + palIndex * 16, gPlttBufferFaded + 0x100 + s.unk8 * 16 - 256, 32);
    }
    else
    {
        gBattle_BG2_X = x + gTasks[taskId].data[3];
        gBattle_BG2_Y = y + gTasks[taskId].data[4];
        DmaCopy32Defvars(3, gPlttBufferFaded + 0x100 + palIndex * 16, gPlttBufferFaded + 0x100 - 112, 32);
    }
}

static void ScriptCmd_clearmonbg(void)
{
    u8 animBankId;
    u8 bank;
    u8 taskId;

    sBattleAnimScriptPtr++;
    animBankId = T1_READ_8(sBattleAnimScriptPtr);

    if (animBankId == ANIM_BANK_ATTACKER)
        animBankId = ANIM_BANK_ATK_PARTNER;
    else if (animBankId == ANIM_BANK_TARGET)
        animBankId = ANIM_BANK_DEF_PARTNER;

    if (animBankId == ANIM_BANK_ATTACKER || animBankId == ANIM_BANK_ATK_PARTNER)
        bank = gAnimBankAttacker;
    else
        bank = gAnimBankTarget;

    if (gMonAnimTaskIdArray[0] != 0xFF)
        gSprites[gBankSpriteIds[bank]].invisible = FALSE;
    if (animBankId > 1 && gMonAnimTaskIdArray[1] != 0xFF)
        gSprites[gBankSpriteIds[bank ^ 2]].invisible = FALSE;
    else
        animBankId = 0;

    taskId = CreateTask(sub_807672C, 5);
    gTasks[taskId].data[0] = animBankId;
    gTasks[taskId].data[2] = bank;
    sBattleAnimScriptPtr++;
}

static void sub_807672C(u8 taskId)
{
    u8 identity;
    u8 to_BG2;

    gTasks[taskId].data[1]++;
    if (gTasks[taskId].data[1] != 1)
    {
        identity = GetBattlerPosition(gTasks[taskId].data[2]);
        identity += 0xFF;
        if (identity <= 1 || IsContest() != 0)
            to_BG2 = 0;
        else
            to_BG2 = 1;
        if (gMonAnimTaskIdArray[0] != 0xFF)
        {
            sub_8076464(to_BG2);
            DestroyTask(gMonAnimTaskIdArray[0]);
            gMonAnimTaskIdArray[0] = 0xFF;
        }
        if (gTasks[taskId].data[0] > 1)
        {
            sub_8076464(to_BG2 ^ 1);
            DestroyTask(gMonAnimTaskIdArray[1]);
            gMonAnimTaskIdArray[1] = 0xFF;
        }
        DestroyTask(taskId);
    }
}

static void ScriptCmd_monbg_22(void)
{
    u8 animBankId;
    u8 bank;
    u8 identity;
    u8 r1;

    sBattleAnimScriptPtr++;
    animBankId = T1_READ_8(sBattleAnimScriptPtr);

    if (animBankId == ANIM_BANK_ATTACKER)
        animBankId = ANIM_BANK_ATK_PARTNER;
    else if (animBankId == ANIM_BANK_TARGET)
        animBankId = ANIM_BANK_DEF_PARTNER;

    if (animBankId == ANIM_BANK_ATTACKER || animBankId == ANIM_BANK_ATK_PARTNER)
        bank = gAnimBankAttacker;
    else
        bank = gAnimBankTarget;

    if (IsAnimBankSpriteVisible(bank))
    {
        identity = GetBattlerPosition(bank);
        identity += 0xFF;
        if (identity <= 1 || IsContest() != 0)
            r1 = 0;
        else
            r1 = 1;
        MoveBattlerSpriteToBG(bank, r1);
        gSprites[gBankSpriteIds[bank]].invisible = FALSE;
    }

    bank ^= 2;
    if (animBankId > ANIM_BANK_TARGET && IsAnimBankSpriteVisible(bank))
    {
        identity = GetBattlerPosition(bank);
        identity += 0xFF;
        if (identity <= 1 || IsContest() != 0)
            r1 = 0;
        else
            r1 = 1;
        MoveBattlerSpriteToBG(bank, r1);
        gSprites[gBankSpriteIds[bank]].invisible = FALSE;
    }
    sBattleAnimScriptPtr++;
}

static void ScriptCmd_clearmonbg_23(void)
{
    u8 animBankId;
    u8 bank;
    u8 taskId;

    sBattleAnimScriptPtr++;
    animBankId = T1_READ_8(sBattleAnimScriptPtr);

    if (animBankId == ANIM_BANK_ATTACKER)
        animBankId = ANIM_BANK_ATK_PARTNER;
    else if (animBankId == ANIM_BANK_TARGET)
        animBankId = ANIM_BANK_DEF_PARTNER;

    if (animBankId == ANIM_BANK_ATTACKER || animBankId == ANIM_BANK_ATK_PARTNER)
        bank = gAnimBankAttacker;
    else
        bank = gAnimBankTarget;

    if (IsAnimBankSpriteVisible(bank))
        gSprites[gBankSpriteIds[bank]].invisible = FALSE;
    if (animBankId > 1 && IsAnimBankSpriteVisible(bank ^ 2))
        gSprites[gBankSpriteIds[bank ^ 2]].invisible = FALSE;
    else
        animBankId = 0;

    taskId = CreateTask(sub_80769A4, 5);
    gTasks[taskId].data[0] = animBankId;
    gTasks[taskId].data[2] = bank;

    sBattleAnimScriptPtr++;
}

static void sub_80769A4(u8 taskId)
{
    u8 identity;
    u8 bank;
    u8 toBG_2;

    gTasks[taskId].data[1]++;
    if (gTasks[taskId].data[1] != 1)
    {
        bank = gTasks[taskId].data[2];
        identity = GetBattlerPosition(bank);
        identity += 0xFF;
        if (identity <= 1 || IsContest() != 0)
            toBG_2 = 0;
        else
            toBG_2 = 1;
        if (IsAnimBankSpriteVisible(bank))
            sub_8076464(toBG_2);
        if (gTasks[taskId].data[0] > 1 && IsAnimBankSpriteVisible(bank ^ 2))
            sub_8076464(toBG_2 ^ 1);
        DestroyTask(taskId);
    }
}

static void ScriptCmd_setalpha(void)
{
    u16 spriteAlpha, bgAlpha;

    sBattleAnimScriptPtr++;
    spriteAlpha = *(sBattleAnimScriptPtr++);
    bgAlpha = *(sBattleAnimScriptPtr++) << 8;
    REG_BLDCNT = BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BD | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_EFFECT_BLEND;
    REG_BLDALPHA = spriteAlpha | bgAlpha;
}

static void ScriptCmd_setbldcnt(void)
{
    u16 half1, half2;

    sBattleAnimScriptPtr++;
    half1 = *(sBattleAnimScriptPtr++);
    half2 = *(sBattleAnimScriptPtr++) << 8;
    REG_BLDCNT = half1 | half2;
}

static void ScriptCmd_blendoff(void)
{
    sBattleAnimScriptPtr++;
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
}

static void ScriptCmd_call(void)
{
    sBattleAnimScriptPtr++;
    gBattleAnimScriptRetAddr = sBattleAnimScriptPtr + 4;
    sBattleAnimScriptPtr = T2_READ_PTR(sBattleAnimScriptPtr);
}

static void ScriptCmd_return(void)
{
    sBattleAnimScriptPtr = gBattleAnimScriptRetAddr;
}

static void ScriptCmd_setarg(void)
{
    const u8 *addr = sBattleAnimScriptPtr;
    u16 value;
    u8 argId;

    sBattleAnimScriptPtr++;
    argId = T1_READ_8(sBattleAnimScriptPtr);
    sBattleAnimScriptPtr++;
    value = T1_READ_16(sBattleAnimScriptPtr);
    sBattleAnimScriptPtr = addr + 4;
    gBattleAnimArgs[argId] = value;
}

static void ScriptCmd_choosetwoturnanim(void)
{
    sBattleAnimScriptPtr++;
    if (gAnimMoveTurn & 1)
        sBattleAnimScriptPtr += 4;
    sBattleAnimScriptPtr = T2_READ_PTR(sBattleAnimScriptPtr);
}

static void ScriptCmd_jumpifmoveturn(void)
{
    u8 toCheck;

    sBattleAnimScriptPtr++;
    toCheck = T1_READ_8(sBattleAnimScriptPtr);
    sBattleAnimScriptPtr++;

    if (toCheck == gAnimMoveTurn)
    {
        sBattleAnimScriptPtr = T2_READ_PTR(sBattleAnimScriptPtr);
    }
    else
    {
        sBattleAnimScriptPtr += 4;
    }
}

static void ScriptCmd_jump(void)
{
    sBattleAnimScriptPtr++;
    sBattleAnimScriptPtr = T2_READ_PTR(sBattleAnimScriptPtr);
}

bool8 IsContest(void)
{
    if (!gMain.inBattle)
        return TRUE;
    else
        return FALSE;
}

#define tBackgroundId   data[0]
#define tState          data[10]

static void ScriptCmd_fadetobg(void)
{
    u8 backgroundId;
    u8 taskId;

    sBattleAnimScriptPtr++;
    backgroundId = T1_READ_8(sBattleAnimScriptPtr);
    sBattleAnimScriptPtr++;
    taskId = CreateTask(Task_FadeToBg, 5);
    gTasks[taskId].tBackgroundId = backgroundId;
    sAnimBackgroundFadeState = 1;
}

static void ScriptCmd_fadetobgfromset(void)
{
    u8 bg1, bg2, bg3;
    u8 taskId;

    sBattleAnimScriptPtr++;
    bg1 = sBattleAnimScriptPtr[0];
    bg2 = sBattleAnimScriptPtr[1];
    bg3 = sBattleAnimScriptPtr[2];
    sBattleAnimScriptPtr += 3;
    taskId = CreateTask(Task_FadeToBg, 5);

    if (IsContest())
        gTasks[taskId].tBackgroundId = bg3;
    else if (GetBattlerSide(gAnimBankTarget) == 0)
        gTasks[taskId].tBackgroundId = bg2;
    else
        gTasks[taskId].tBackgroundId = bg1;

    sAnimBackgroundFadeState = 1;
}

static void Task_FadeToBg(u8 taskId)
{
    if (gTasks[taskId].tState == 0)
    {
        BeginHardwarePaletteFade(0xE8, 0, 0, 16, 0);
        gTasks[taskId].tState++;
        return;
    }
    if (gPaletteFade.active)
        return;
    if (gTasks[taskId].tState == 1)
    {
        gTasks[taskId].tState++;
        sAnimBackgroundFadeState = 2;
    }
    else if (gTasks[taskId].tState == 2)
    {
        s16 bgId = (u16)gTasks[taskId].tBackgroundId;

        if (bgId == -1)
            LoadDefaultBg();
        else
            LoadMoveBg(bgId);

        BeginHardwarePaletteFade(0xE8, 0, 16, 0, 1);
        gTasks[taskId].tState++;
        return;
    }
    if (gPaletteFade.active)
        return;
    if (gTasks[taskId].tState == 3)
    {
        DestroyTask(taskId);
        sAnimBackgroundFadeState = 0;
    }
}

static void LoadMoveBg(u16 bgId)
{
    if (IsContest())
    {
        void *tilemap = gBattleAnimBackgroundTable[bgId].tilemap;

        LZDecompressWram(tilemap, IsContest() ? EWRAM_14800 : EWRAM_18000);
        sub_80763FC(sub_80789BC(), IsContest() ? EWRAM_14800 : EWRAM_18000, 0x100, 0);
        DmaCopy32Defvars(3, IsContest() ? EWRAM_14800 : EWRAM_18000, (void *)(VRAM + 0xD000), 0x800);
        LZDecompressVram(gBattleAnimBackgroundTable[bgId].image, (void *)(VRAM + 0x2000));
        LoadCompressedPalette(gBattleAnimBackgroundTable[bgId].palette, sub_80789BC() * 16, 32);
    }
    else
    {
        LZDecompressVram(gBattleAnimBackgroundTable[bgId].tilemap, (void *)(VRAM + 0xD000));
        LZDecompressVram(gBattleAnimBackgroundTable[bgId].image, (void *)(VRAM + 0x8000));
        LoadCompressedPalette(gBattleAnimBackgroundTable[bgId].palette, 32, 32);
    }
}

static void LoadDefaultBg(void)
{
    if (IsContest())
        LoadContestBgAfterMoveAnim();
    else
        DrawMainBattleBackground();
}

static void ScriptCmd_restorebg(void)
{
    u8 taskId;

    sBattleAnimScriptPtr++;
    taskId = CreateTask(Task_FadeToBg, 5);
    gTasks[taskId].tBackgroundId = 0xFFFF;
    sAnimBackgroundFadeState = 1;
}

#undef tBackgroundId
#undef tState

static void ScriptCmd_waitbgfadeout(void)
{
    if (sAnimBackgroundFadeState == 2)
    {
        sBattleAnimScriptPtr++;
        gAnimFramesToWait = 0;
    }
    else
    {
        gAnimFramesToWait = 1;
    }
}

static void ScriptCmd_waitbgfadein(void)
{
    if (sAnimBackgroundFadeState == 0)
    {
        sBattleAnimScriptPtr++;
        gAnimFramesToWait = 0;
    }
    else
    {
        gAnimFramesToWait = 1;
    }
}

static void ScriptCmd_changebg(void)
{
    sBattleAnimScriptPtr++;
    LoadMoveBg(T1_READ_8(sBattleAnimScriptPtr));
    sBattleAnimScriptPtr++;
}

//Weird control flow
/*
s8 BattleAnimAdjustPanning(s8 a)
{
    if (!IsContest() && (EWRAM_17810[gAnimBankAttacker].unk0 & 0x10))
    {
        a = GetBattlerSide(gAnimBankAttacker) ? 0xC0 : 0x3F;
    }
    //_08076FDC
    else
    {
        if (IsContest())
        {
            if (gAnimBankAttacker == gAnimBankTarget && gAnimBankAttacker == 2
             && a == 0x3F)
            {
                //jump to _0807707A
                if (a < -0x40)
                    a = 0xC0;
                return a;
            }
        }
        //_08077004
        else
        {
            if (GetBattlerSide(gAnimBankAttacker) == 0)
            {
                if (GetBattlerSide(gAnimBankTarget) == 0)
            }
            //_08077042
            else
            {

            }
            //_0807706C
        }
    }
    //_0807706E
}
*/
NAKED
s8 BattleAnimAdjustPanning(s8 a)
{
    asm(".syntax unified\n\
    push {r4,lr}\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    bl IsContest\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _08076FDC\n\
    ldr r0, _08076FD4 @ =gAnimBankAttacker\n\
    ldrb r2, [r0]\n\
    lsls r0, r2, 1\n\
    adds r0, r2\n\
    lsls r0, 2\n\
    ldr r1, _08076FD8 @ =gSharedMem + 0x17810\n\
    adds r0, r1\n\
    ldrb r1, [r0]\n\
    movs r0, 0x10\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _08076FDC\n\
    adds r0, r2, 0\n\
    bl GetBattlerSide\n\
    lsls r0, 24\n\
    movs r4, 0xC0\n\
    cmp r0, 0\n\
    beq _0807706E\n\
    movs r4, 0x3F\n\
    b _0807706E\n\
    .align 2, 0\n\
_08076FD4: .4byte gAnimBankAttacker\n\
_08076FD8: .4byte gSharedMem + 0x17810\n\
_08076FDC:\n\
    bl IsContest\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _08077004\n\
    ldr r0, _08076FFC @ =gAnimBankAttacker\n\
    ldr r1, _08077000 @ =gAnimBankTarget\n\
    ldrb r0, [r0]\n\
    ldrb r1, [r1]\n\
    cmp r0, r1\n\
    bne _08077068\n\
    cmp r0, 0x2\n\
    bne _08077068\n\
    cmp r4, 0x3F\n\
    beq _0807707A\n\
    b _08077068\n\
    .align 2, 0\n\
_08076FFC: .4byte gAnimBankAttacker\n\
_08077000: .4byte gAnimBankTarget\n\
_08077004:\n\
    ldr r0, _0807702C @ =gAnimBankAttacker\n\
    ldrb r0, [r0]\n\
    bl GetBattlerSide\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _08077042\n\
    ldr r0, _08077030 @ =gAnimBankTarget\n\
    ldrb r0, [r0]\n\
    bl GetBattlerSide\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _0807706E\n\
    lsls r0, r4, 24\n\
    asrs r1, r0, 24\n\
    cmp r1, 0x3F\n\
    bne _08077034\n\
    movs r4, 0xC0\n\
    b _0807706E\n\
    .align 2, 0\n\
_0807702C: .4byte gAnimBankAttacker\n\
_08077030: .4byte gAnimBankTarget\n\
_08077034:\n\
    movs r0, 0x40\n\
    negs r0, r0\n\
    cmp r1, r0\n\
    beq _0807706E\n\
    negs r0, r1\n\
    lsls r0, 24\n\
    b _0807706C\n\
_08077042:\n\
    ldr r0, _08077064 @ =gAnimBankTarget\n\
    ldrb r0, [r0]\n\
    bl GetBattlerSide\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0x1\n\
    bne _08077068\n\
    lsls r0, r4, 24\n\
    asrs r0, 24\n\
    movs r1, 0x40\n\
    negs r1, r1\n\
    cmp r0, r1\n\
    bne _0807706E\n\
    movs r4, 0x3F\n\
    b _0807706E\n\
    .align 2, 0\n\
_08077064: .4byte gAnimBankTarget\n\
_08077068:\n\
    lsls r0, r4, 24\n\
    negs r0, r0\n\
_0807706C:\n\
    lsrs r4, r0, 24\n\
_0807706E:\n\
    lsls r0, r4, 24\n\
    asrs r0, 24\n\
    cmp r0, 0x3F\n\
    ble _0807707A\n\
    movs r4, 0x3F\n\
    b _08077088\n\
_0807707A:\n\
    lsls r0, r4, 24\n\
    asrs r0, 24\n\
    movs r1, 0x40\n\
    negs r1, r1\n\
    cmp r0, r1\n\
    bge _08077088\n\
    movs r4, 0xC0\n\
_08077088:\n\
    lsls r0, r4, 24\n\
    asrs r0, 24\n\
    pop {r4}\n\
    pop {r1}\n\
    bx r1\n\
    .syntax divided\n");
}

s8 BattleAnimAdjustPanning2(s8 pan)
{
    if (!IsContest() && (EWRAM_17810[gAnimBankAttacker].unk0 & 0x10))
    {
        if (GetBattlerSide(gAnimBankAttacker) != 0)
            pan = 0x3F;
        else
            pan = 0xC0;
    }
    else
    {
        if (GetBattlerSide(gAnimBankAttacker) != 0 || IsContest() != 0)
            pan = -pan;
    }
    return pan;
}

s16 sub_8077104(s16 newPan, int oldPan)
{
    s16 var = newPan;

    if (var > 63)
        var = 63;
    else if (var < -64)
        var = -64;
    return var;
}

s16 CalculatePanIncrement(s16 sourcePan, s16 targetPan, s16 incrementPan)
{
    u16 ret;

    if (sourcePan < targetPan)
        ret = ((incrementPan < 0) ? -incrementPan : incrementPan);
    else if (sourcePan > targetPan)
        ret = -((incrementPan < 0) ? -incrementPan : incrementPan);
    else
        ret = 0;

    return ret;
}

static void ScriptCmd_playsewithpan(void)
{
    u16 soundId;
    s8 pan;

    sBattleAnimScriptPtr++;
    soundId = T1_READ_16(sBattleAnimScriptPtr);
    pan = T1_READ_8(sBattleAnimScriptPtr + 2);
    PlaySE12WithPanning(soundId, BattleAnimAdjustPanning(pan));
    sBattleAnimScriptPtr += 3;
}

static void ScriptCmd_setpan(void)
{
    s8 pan;

    sBattleAnimScriptPtr++;
    pan = T1_READ_8(sBattleAnimScriptPtr);
    SE12PanpotControl(BattleAnimAdjustPanning(pan));
    sBattleAnimScriptPtr++;
}

#define tInitialPan     data[0]
#define tTargetPan      data[1]
#define tIncrementPan   data[2]
#define tFramesToWait   data[3]
#define tCurrentPan     data[4]
#define tFrameCounter   data[8]

static void ScriptCmd_panse_1B(void)
{
    u16 songNum;
    s8 currentPanArg, incrementPan, incrementPanArg, currentPan, targetPan;
    u8 framesToWait;
    u8 taskId;

    sBattleAnimScriptPtr++;
    songNum = T1_READ_16(sBattleAnimScriptPtr);
    currentPanArg = T1_READ_8(sBattleAnimScriptPtr + 2);
    incrementPan = T1_READ_8(sBattleAnimScriptPtr + 3);
    incrementPanArg = T1_READ_8(sBattleAnimScriptPtr + 4);
    framesToWait = T1_READ_8(sBattleAnimScriptPtr + 5);

    currentPan = BattleAnimAdjustPanning(currentPanArg);
    targetPan = BattleAnimAdjustPanning(incrementPan);
    incrementPan = CalculatePanIncrement(currentPan, targetPan, incrementPanArg);
    taskId = CreateTask(Task_PanFromInitialToTarget, 1);
    gTasks[taskId].tInitialPan = currentPan;
    gTasks[taskId].tTargetPan = targetPan;
    gTasks[taskId].tIncrementPan = incrementPan;
    gTasks[taskId].tFramesToWait = framesToWait;
    gTasks[taskId].tCurrentPan = currentPan;

    PlaySE12WithPanning(songNum, currentPan);

    gAnimSoundTaskCount++;
    sBattleAnimScriptPtr += 6;
}

void Task_PanFromInitialToTarget(u8 taskId)
{
    bool32 destroyTask = FALSE;
    if (gTasks[taskId].tFrameCounter++ >= gTasks[taskId].tFramesToWait)
    {
        s16 pan;
        s16 initialPanning, targetPanning, currentPan, incrementPan;

        gTasks[taskId].tFrameCounter = 0;
        initialPanning = gTasks[taskId].tInitialPan;
        targetPanning = gTasks[taskId].tTargetPan;
        currentPan = gTasks[taskId].tCurrentPan;
        incrementPan = gTasks[taskId].tIncrementPan;
        pan = currentPan + incrementPan;
        gTasks[taskId].tCurrentPan = pan;

        if (incrementPan == 0) // If we're not incrementing, just cancel the task immediately
        {
            destroyTask = TRUE;
        }
        else if (initialPanning < targetPanning) // Panning increasing
        {
            if (pan >= targetPanning) // Target reached
                destroyTask = TRUE;
        }
        else // Panning decreasing
        {
            if (pan <= targetPanning) // Target reached
                destroyTask = TRUE;
        }

        if (destroyTask)
        {
            pan = targetPanning;
            DestroyTask(taskId);
            gAnimSoundTaskCount--;
        }

        SE12PanpotControl(pan);
    }
}

static void ScriptCmd_panse_26(void)
{
    u16 songId;
    s8 currentPan, targetPan, incrementPan;
    u8 framesToWait;
    u8 taskId;

    sBattleAnimScriptPtr++;
    songId = T1_READ_16(sBattleAnimScriptPtr);
    currentPan = T1_READ_8(sBattleAnimScriptPtr + 2);
    targetPan = T1_READ_8(sBattleAnimScriptPtr + 3);
    incrementPan = T1_READ_8(sBattleAnimScriptPtr + 4);
    framesToWait = T1_READ_8(sBattleAnimScriptPtr + 5);

    taskId = CreateTask(Task_PanFromInitialToTarget, 1);
    gTasks[taskId].tInitialPan = currentPan;
    gTasks[taskId].tTargetPan = targetPan;
    gTasks[taskId].tIncrementPan = incrementPan;
    gTasks[taskId].tFramesToWait = framesToWait;
    gTasks[taskId].tCurrentPan = currentPan;

    PlaySE12WithPanning(songId, currentPan);

    gAnimSoundTaskCount++;
    sBattleAnimScriptPtr += 6;
}

static void ScriptCmd_panse_27(void)
{
    u16 songId;
    u8 targetPanArg, incrementPanArg, currentPan, currentPanArg;
    s8 targetPan, incrementPan, framesToWait;
    u8 taskId;

    sBattleAnimScriptPtr++;
    songId = T1_READ_16(sBattleAnimScriptPtr);
    currentPanArg = T1_READ_8(sBattleAnimScriptPtr + 2);
    targetPanArg = T1_READ_8(sBattleAnimScriptPtr + 3);
    incrementPanArg = T1_READ_8(sBattleAnimScriptPtr + 4);
    currentPan = T1_READ_8(sBattleAnimScriptPtr + 5);

    targetPan = BattleAnimAdjustPanning2(currentPanArg);
    incrementPan = BattleAnimAdjustPanning2(targetPanArg);
    framesToWait = BattleAnimAdjustPanning2(incrementPanArg);

    taskId = CreateTask(Task_PanFromInitialToTarget, 1);
    gTasks[taskId].data[0] = targetPan;
    gTasks[taskId].data[1] = incrementPan;
    gTasks[taskId].data[2] = framesToWait;
    gTasks[taskId].data[3] = currentPan;
    gTasks[taskId].data[4] = targetPan;

    PlaySE12WithPanning(songId, targetPan);

    gAnimSoundTaskCount++;
    sBattleAnimScriptPtr += 6;
}

#undef tInitialPan
#undef tTargetPan
#undef tIncrementPan
#undef tFramesToWait
#undef tCurrentPan
#undef tFrameCounter

#define tSongId         data[0]
#define tPanning        data[1]
#define tFramesToWait   data[2]
#define tNumberOfPlays  data[3]
#define tFrameCounter   data[8]

static void ScriptCmd_loopsewithpan(void)
{
    u16 songId;
    s8 panningArg, panning;
    u8 framesToWait, numberOfPlays;
    u8 taskId;

    sBattleAnimScriptPtr++;
    songId = T1_READ_16(sBattleAnimScriptPtr);
    panningArg = T1_READ_8(sBattleAnimScriptPtr + 2);
    framesToWait = T1_READ_8(sBattleAnimScriptPtr + 3);
    numberOfPlays = T1_READ_8(sBattleAnimScriptPtr + 4);
    panning = BattleAnimAdjustPanning(panningArg);

    taskId = CreateTask(Task_LoopAndPlaySE, 1);
    gTasks[taskId].tSongId = songId;
    gTasks[taskId].tPanning = panning;
    gTasks[taskId].tFramesToWait = framesToWait;
    gTasks[taskId].tNumberOfPlays = numberOfPlays;
    gTasks[taskId].tFrameCounter = framesToWait;
    gTasks[taskId].func(taskId);

    gAnimSoundTaskCount++;
    sBattleAnimScriptPtr += 5;
}

static void Task_LoopAndPlaySE(u8 taskId)
{
    if (gTasks[taskId].tFrameCounter++ >= gTasks[taskId].tFramesToWait)
    {
        u16 songId;
        s8 panning;
        u8 numberOfPlays;

        gTasks[taskId].tFrameCounter = 0;
        songId = gTasks[taskId].tSongId;
        panning = gTasks[taskId].tPanning;
        numberOfPlays = --gTasks[taskId].tNumberOfPlays;
        PlaySE12WithPanning(songId, panning);
        if (numberOfPlays == 0)
        {
            DestroyTask(taskId);
            gAnimSoundTaskCount--;
        }
    }
}

#undef tSongId
#undef tPanning
#undef tFramesToWait
#undef tNumberOfPlays
#undef tFrameCounter

#define tSongId         data[0]
#define tPanning        data[1]
#define tFramesToWait   data[2]

static void ScriptCmd_waitplaysewithpan(void)
{
    u16 songId;
    s8 panningArg, panning;
    u8 framesToWait;
    u8 taskId;

    sBattleAnimScriptPtr++;
    songId = T1_READ_16(sBattleAnimScriptPtr);
    panningArg = T1_READ_8(sBattleAnimScriptPtr + 2);
    framesToWait = T1_READ_8(sBattleAnimScriptPtr + 3);
    panning = BattleAnimAdjustPanning(panningArg);

    taskId = CreateTask(Task_WaitAndPlaySE, 1);
    gTasks[taskId].tSongId = songId;
    gTasks[taskId].tPanning = panning;
    gTasks[taskId].tFramesToWait = framesToWait;

    gAnimSoundTaskCount++;
    sBattleAnimScriptPtr += 4;
}

static void Task_WaitAndPlaySE(u8 taskId)
{
    if (gTasks[taskId].tFramesToWait-- <= 0)
    {
        PlaySE12WithPanning(gTasks[taskId].tSongId, gTasks[taskId].tPanning);
        DestroyTask(taskId);
        gAnimSoundTaskCount--;
    }
}

#undef tSongId
#undef tPanning
#undef tFramesToWait

static void ScriptCmd_createsoundtask(void)
{
    TaskFunc func;
    u8 numArgs, taskId;
    s32 i;

    sBattleAnimScriptPtr++;
    func = (TaskFunc)T2_READ_32(sBattleAnimScriptPtr);
    sBattleAnimScriptPtr += 4;
    numArgs = T1_READ_8(sBattleAnimScriptPtr);
    sBattleAnimScriptPtr++;
    for (i = 0; i < numArgs; i++)
    {
        gBattleAnimArgs[i] = T1_READ_16(sBattleAnimScriptPtr);
        sBattleAnimScriptPtr += 2;
    }
    taskId = CreateTask(func, 1);
    func(taskId);
    gAnimSoundTaskCount++;
}

static void ScriptCmd_waitsound(void)
{
    if (gAnimSoundTaskCount != 0)
    {
        gSoundAnimFramesToWait = 0;
        gAnimFramesToWait = 1;
    }
    else if (IsSEPlaying())
    {
        if (++gSoundAnimFramesToWait > 90)
        {
            m4aMPlayStop(&gMPlay_SE1);
            m4aMPlayStop(&gMPlay_SE2);
            gSoundAnimFramesToWait = 0;
        }
        else
        {
            gAnimFramesToWait = 1;
        }
    }
    else
    {
        gSoundAnimFramesToWait = 0;
        sBattleAnimScriptPtr++;
        gAnimFramesToWait = 0;
    }
}

static void ScriptCmd_jumpargeq(void)
{
    u8 argId;
    s16 valueToCheck;

    sBattleAnimScriptPtr++;
    argId = T1_READ_8(sBattleAnimScriptPtr);
    valueToCheck = T1_READ_16(sBattleAnimScriptPtr + 1);

    if (valueToCheck == gBattleAnimArgs[argId])
        sBattleAnimScriptPtr = T2_READ_PTR(sBattleAnimScriptPtr + 3);
    else
        sBattleAnimScriptPtr += 7;
}

static void ScriptCmd_jumpifcontest(void)
{
    sBattleAnimScriptPtr++;
    if (IsContest())
        sBattleAnimScriptPtr = T2_READ_PTR(sBattleAnimScriptPtr);
    else
        sBattleAnimScriptPtr += 4;
}

static void ScriptCmd_monbgprio_28(void)
{
    u8 wantedBank;
    u8 bank;
    u8 bankIdentity;

    wantedBank = T1_READ_8(sBattleAnimScriptPtr + 1);
    sBattleAnimScriptPtr += 2;

    if (wantedBank != 0)
        bank = gAnimBankTarget;
    else
        bank = gAnimBankAttacker;

    bankIdentity = GetBattlerPosition(bank);
    if (!IsContest() && (bankIdentity == 0 || bankIdentity == 3))
    {
        REG_BG1CNT_BITFIELD.priority = 1;
        REG_BG2CNT_BITFIELD.priority = 2;
    }
}

static void ScriptCmd_monbgprio_29(void)
{
    sBattleAnimScriptPtr++;
    if (!IsContest())
    {
        REG_BG1CNT_BITFIELD.priority = 1;
        REG_BG2CNT_BITFIELD.priority = 2;
    }
}

static void ScriptCmd_monbgprio_2A(void)
{
    u8 wantedBank;
    u8 bankIdentity;
    u8 bank;

    wantedBank = T1_READ_8(sBattleAnimScriptPtr + 1);
    sBattleAnimScriptPtr += 2;
    if (GetBattlerSide(gAnimBankAttacker) != GetBattlerSide(gAnimBankTarget))
    {
        if (wantedBank != 0)
            bank = gAnimBankTarget;
        else
            bank = gAnimBankAttacker;
        bankIdentity = GetBattlerPosition(bank);
        if (!IsContest() && (bankIdentity == 0 || bankIdentity == 3))
        {
            REG_BG1CNT_BITFIELD.priority = 1;
            REG_BG2CNT_BITFIELD.priority = 2;
        }
    }
}

static void ScriptCmd_invisible(void)
{
    u8 spriteId;

    spriteId = GetAnimBattlerSpriteId(T1_READ_8(sBattleAnimScriptPtr + 1));
    if (spriteId != 0xFF)
        gSprites[spriteId].invisible = TRUE;

    sBattleAnimScriptPtr += 2;
}

static void ScriptCmd_visible(void)
{
    u8 spriteId;

    spriteId = GetAnimBattlerSpriteId(T1_READ_8(sBattleAnimScriptPtr + 1));
    if (spriteId != 0xFF)
        gSprites[spriteId].invisible = FALSE;

    sBattleAnimScriptPtr += 2;
}

static void ScriptCmd_doublebattle_2D(void)
{
    u8 wantedBank;
    u8 r4;
    u8 spriteId;

    wantedBank = T1_READ_8(sBattleAnimScriptPtr + 1);
    sBattleAnimScriptPtr += 2;
    if (!IsContest() && IsDoubleBattle()
     && GetBattlerSide(gAnimBankAttacker) == GetBattlerSide(gAnimBankTarget))
    {
        if (wantedBank == 0)
        {
            r4 = GetBattlerPosition_permutated(gAnimBankAttacker);
            spriteId = GetAnimBattlerSpriteId(0);
        }
        else
        {
            r4 = GetBattlerPosition_permutated(gAnimBankTarget);
            spriteId = GetAnimBattlerSpriteId(1);
        }
        if (spriteId != 0xFF)
        {
            gSprites[spriteId].invisible = FALSE;
            if (r4 == 2)
                gSprites[spriteId].oam.priority = 3;
            if (r4 == 1)
                sub_8076464(0);
            else
                sub_8076464(1);
        }
    }
}

static void ScriptCmd_doublebattle_2E(void)
{
    u8 wantedBank;
    u8 r4;
    u8 spriteId;

    wantedBank = T1_READ_8(sBattleAnimScriptPtr  + 1);
    sBattleAnimScriptPtr += 2;
    if (!IsContest() && IsDoubleBattle()
     && GetBattlerSide(gAnimBankAttacker) == GetBattlerSide(gAnimBankTarget))
    {
        if (wantedBank == 0)
        {
            r4 = GetBattlerPosition_permutated(gAnimBankAttacker);
            spriteId = GetAnimBattlerSpriteId(0);
        }
        else
        {
            r4 = GetBattlerPosition_permutated(gAnimBankTarget);
            spriteId = GetAnimBattlerSpriteId(1);
        }
        if (spriteId != 0xFF && r4 == 2)
        {
            gSprites[spriteId].oam.priority = 2;
        }
    }
}

static void ScriptCmd_stopsound(void)
{
    m4aMPlayStop(&gMPlay_SE1);
    m4aMPlayStop(&gMPlay_SE2);
    sBattleAnimScriptPtr++;
}
