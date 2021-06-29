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
#include "constants/songs.h"

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
    { gBattleAnimSpriteSheet_000,  0x200, ANIM_TAG_BONE },
    { gBattleAnimSpriteSheet_001,  0x300, ANIM_TAG_SPARK },
    { gBattleAnimSpriteSheet_002,  0x200, ANIM_TAG_PENCIL },
    { gBattleAnimSpriteSheet_003,  0x100, ANIM_TAG_AIR_WAVE },
    { gBattleAnimSpriteSheet_004,  0x200, ANIM_TAG_UNUSED_ORB },
    { gBattleAnimSpriteSheet_005,  0x400, ANIM_TAG_SWORD },
    { gBattleAnimSpriteSheet_006,  0x180, ANIM_TAG_SEED },
    { gBattleAnimSpriteSheet_007,  0x800, ANIM_TAG_UNUSED_EXPLOSION },
    { gBattleAnimSpriteSheet_008,   0x20, ANIM_TAG_UNUSED_PINK_ORB },
    { gBattleAnimSpriteSheet_009,  0x400, ANIM_TAG_GUST },
    { gBattleAnimSpriteSheet_010, 0x1200, ANIM_TAG_ICE_CUBE },
    { gBattleAnimSpriteSheet_011,  0x180, ANIM_TAG_SPARK_2 },
    { gBattleAnimSpriteSheet_012,   0x80, ANIM_TAG_UNUSED_ORANGE },
    { gBattleAnimSpriteSheet_013,   0x80, ANIM_TAG_YELLOW_BALL },
    { gBattleAnimSpriteSheet_014,  0x280, ANIM_TAG_LOCK_ON },
    { gBattleAnimSpriteSheet_015,   0x80, ANIM_TAG_TIED_BAG },
    { gBattleAnimSpriteSheet_016,  0x100, ANIM_TAG_BLACK_SMOKE },
    { gBattleAnimSpriteSheet_017,   0x20, ANIM_TAG_BLACK_BALL },
    { gBattleAnimSpriteSheet_018,   0x80, ANIM_TAG_CONVERSION },
    { gBattleAnimSpriteSheet_019,  0x400, ANIM_TAG_UNUSED_GLASS },
    { gBattleAnimSpriteSheet_020,  0x200, ANIM_TAG_HORN_HIT },
    { gBattleAnimSpriteSheet_021,  0xA00, ANIM_TAG_UNUSED_HIT },
    { gBattleAnimSpriteSheet_021,  0xA00, ANIM_TAG_UNUSED_HIT_2 },
    { gBattleAnimSpriteSheet_023,  0x380, ANIM_TAG_UNUSED_BLUE_SHARDS },
    { gBattleAnimSpriteSheet_024,  0x300, ANIM_TAG_UNUSED_CLOSING_EYE },
    { gBattleAnimSpriteSheet_025,  0xA00, ANIM_TAG_UNUSED_WAVING_HAND },
    { gBattleAnimSpriteSheet_026,  0xA00, ANIM_TAG_UNUSED_HIT_DUPLICATE },
    { gBattleAnimSpriteSheet_027,  0xA00, ANIM_TAG_LEER },
    { gBattleAnimSpriteSheet_028,  0xA00, ANIM_TAG_UNUSED_BLUE_BURST },
    { gBattleAnimSpriteSheet_029,  0xA00, ANIM_TAG_SMALL_EMBER },
    { gBattleAnimSpriteSheet_030,  0xA00, ANIM_TAG_GRAY_SMOKE },
    { gBattleAnimSpriteSheet_031,  0xE00, ANIM_TAG_BLUE_STAR },
    { gBattleAnimSpriteSheet_032,  0x380, ANIM_TAG_UNUSED_BUBBLE_BURST },
    { gBattleAnimSpriteSheet_033, 0x1000, ANIM_TAG_FIRE },
    { gBattleAnimSpriteSheet_034,  0x800, ANIM_TAG_UNUSED_SPINNING_FIRE },
    { gBattleAnimSpriteSheet_035,  0xA00, ANIM_TAG_FIRE_PLUME },
    { gBattleAnimSpriteSheet_036,  0x800, ANIM_TAG_UNUSED_LIGHTNING },
    { gBattleAnimSpriteSheet_037,  0xA00, ANIM_TAG_LIGHTNING },
    { gBattleAnimSpriteSheet_038,  0xA00, ANIM_TAG_UNUSED_CLAW_SLASH },
    { gBattleAnimSpriteSheet_039,  0xA00, ANIM_TAG_CLAW_SLASH },
    { gBattleAnimSpriteSheet_040,  0xA00, ANIM_TAG_UNUSED_SCRATCH },
    { gBattleAnimSpriteSheet_041,  0xA00, ANIM_TAG_UNUSED_SCRATCH_2 },
    { gBattleAnimSpriteSheet_042,  0xA00, ANIM_TAG_UNUSED_BUBBLE_BURST_2 },
    { gBattleAnimSpriteSheet_043,  0xA00, ANIM_TAG_ICE_CHUNK },
    { gBattleAnimSpriteSheet_044,  0xA00, ANIM_TAG_UNUSED_GLASS_2 },
    { gBattleAnimSpriteSheet_045,  0xA00, ANIM_TAG_UNUSED_PINK_HEART },
    { gBattleAnimSpriteSheet_046, 0x1000, ANIM_TAG_UNUSED_SAP_DRIP },
    { gBattleAnimSpriteSheet_046, 0x1000, ANIM_TAG_UNUSED_SAP_DRIP_2 },
    { gBattleAnimSpriteSheet_048, 0x1000, ANIM_TAG_SPARKLE_1 },
    { gBattleAnimSpriteSheet_048, 0x1000, ANIM_TAG_SPARKLE_2 },
    { gBattleAnimSpriteSheet_050,  0x200, ANIM_TAG_HUMANOID_FOOT },
    { gBattleAnimSpriteSheet_051,  0x200, ANIM_TAG_UNUSED_MONSTER_FOOT },
    { gBattleAnimSpriteSheet_052,  0x200, ANIM_TAG_UNUSED_HUMANOID_HAND },
    { gBattleAnimSpriteSheet_053,  0x800, ANIM_TAG_NOISE_LINE },
    { gBattleAnimSpriteSheet_054,   0x80, ANIM_TAG_UNUSED_YELLOW_UNK },
    { gBattleAnimSpriteSheet_055,  0x200, ANIM_TAG_UNUSED_RED_FIST },
    { gBattleAnimSpriteSheet_056, 0x1000, ANIM_TAG_SLAM_HIT },
    { gBattleAnimSpriteSheet_057,  0x180, ANIM_TAG_UNUSED_RING },
    { gBattleAnimSpriteSheet_058,  0xC00, ANIM_TAG_ROCKS },
    { gBattleAnimSpriteSheet_059,  0x100, ANIM_TAG_UNUSED_Z },
    { gBattleAnimSpriteSheet_060,   0x40, ANIM_TAG_UNUSED_YELLOW_UNK_2 },
    { gBattleAnimSpriteSheet_061,  0x180, ANIM_TAG_UNUSED_AIR_SLASH },
    { gBattleAnimSpriteSheet_062,  0x800, ANIM_TAG_UNUSED_SPINNING_GREEN_ORBS },
    { gBattleAnimSpriteSheet_063,  0x480, ANIM_TAG_LEAF },
    { gBattleAnimSpriteSheet_064,  0x200, ANIM_TAG_FINGER },
    { gBattleAnimSpriteSheet_065,  0x200, ANIM_TAG_POISON_POWDER },
    { gBattleAnimSpriteSheet_066,  0x100, ANIM_TAG_UNUSED_BROWN_TRIANGLE },
    { gBattleAnimSpriteSheet_065,  0x200, ANIM_TAG_SLEEP_POWDER },
    { gBattleAnimSpriteSheet_065,  0x200, ANIM_TAG_STUN_SPORE },
    { gBattleAnimSpriteSheet_065,  0x200, ANIM_TAG_UNUSED_POWDER },
    { gBattleAnimSpriteSheet_070,  0x200, ANIM_TAG_SPARKLE_3 },
    { gBattleAnimSpriteSheet_071,  0xA00, ANIM_TAG_SPARKLE_4 },
    { gBattleAnimSpriteSheet_072,  0x300, ANIM_TAG_MUSIC_NOTES },
    { gBattleAnimSpriteSheet_073,  0x180, ANIM_TAG_DUCK },
    { gBattleAnimSpriteSheet_074,   0xA0, ANIM_TAG_MUD_SAND },
    { gBattleAnimSpriteSheet_075,  0x700, ANIM_TAG_ALERT },
    { gBattleAnimSpriteSheet_076,  0x400, ANIM_TAG_UNUSED_BLUE_FLAMES },
    { gBattleAnimSpriteSheet_077,  0x200, ANIM_TAG_UNUSED_BLUE_FLAMES_2 },
    { gBattleAnimSpriteSheet_078,  0x300, ANIM_TAG_UNUSED_SHOCK },
    { gBattleAnimSpriteSheet_079,  0xC00, ANIM_TAG_SHOCK },
    { gBattleAnimSpriteSheet_080,  0xA00, ANIM_TAG_UNUSED_BELL },
    { gBattleAnimSpriteSheet_081,   0x80, ANIM_TAG_UNUSED_PINK_GLOVE },
    { gBattleAnimSpriteSheet_082,   0x40, ANIM_TAG_UNUSED_BLUE_LINES },
    { gBattleAnimSpriteSheet_083,  0xE00, ANIM_TAG_UNUSED_IMPACT },
    { gBattleAnimSpriteSheet_084,  0xE00, ANIM_TAG_UNUSED_IMPACT_2 },
    { gBattleAnimSpriteSheet_085,  0x280, ANIM_TAG_UNUSED_RETICLE },
    { gBattleAnimSpriteSheet_086,  0x200, ANIM_TAG_BREATH },
    { gBattleAnimSpriteSheet_087,   0x80, ANIM_TAG_ANGER },
    { gBattleAnimSpriteSheet_088,   0xC0, ANIM_TAG_UNUSED_SNOWBALL },
    { gBattleAnimSpriteSheet_089,  0xA00, ANIM_TAG_UNUSED_VINE },
    { gBattleAnimSpriteSheet_090,  0x200, ANIM_TAG_UNUSED_SWORD },
    { gBattleAnimSpriteSheet_091,  0x180, ANIM_TAG_UNUSED_CLAPPING },
    { gBattleAnimSpriteSheet_092,   0x80, ANIM_TAG_UNUSED_RED_TUBE },
    { gBattleAnimSpriteSheet_093, 0x1000, ANIM_TAG_AMNESIA },
    { gBattleAnimSpriteSheet_094,  0xA00, ANIM_TAG_UNUSED_STRING },
    { gBattleAnimSpriteSheet_095,  0x180, ANIM_TAG_UNUSED_PENCIL },
    { gBattleAnimSpriteSheet_096,  0x380, ANIM_TAG_UNUSED_PETAL },
    { gBattleAnimSpriteSheet_097,  0xC00, ANIM_TAG_BENT_SPOON },
    { gBattleAnimSpriteSheet_098,  0x200, ANIM_TAG_UNUSED_WEB },
    { gBattleAnimSpriteSheet_099,  0x200, ANIM_TAG_MILK_BOTTLE },
    { gBattleAnimSpriteSheet_100,  0x200, ANIM_TAG_COIN },
    { gBattleAnimSpriteSheet_101,  0x200, ANIM_TAG_UNUSED_CRACKED_EGG },
    { gBattleAnimSpriteSheet_102,  0x400, ANIM_TAG_UNUSED_HATCHED_EGG },
    { gBattleAnimSpriteSheet_103,   0x80, ANIM_TAG_UNUSED_FRESH_EGG },
    { gBattleAnimSpriteSheet_104,  0x400, ANIM_TAG_UNUSED_FANGS },
    { gBattleAnimSpriteSheet_105,  0xC00, ANIM_TAG_UNUSED_EXPLOSION_2 },
    { gBattleAnimSpriteSheet_106,  0x200, ANIM_TAG_UNUSED_EXPLOSION_3 },
    { gBattleAnimSpriteSheet_107, 0x1000, ANIM_TAG_UNUSED_WATER_DROPLET },
    { gBattleAnimSpriteSheet_108,  0xA00, ANIM_TAG_UNUSED_WATER_DROPLET_2 },
    { gBattleAnimSpriteSheet_109,   0x20, ANIM_TAG_UNUSED_SEED },
    { gBattleAnimSpriteSheet_110,  0xE00, ANIM_TAG_UNUSED_SPROUT },
    { gBattleAnimSpriteSheet_111,   0x80, ANIM_TAG_UNUSED_RED_WAND },
    { gBattleAnimSpriteSheet_112,  0xA00, ANIM_TAG_UNUSED_PURPLE_GREEN_UNK },
    { gBattleAnimSpriteSheet_113,  0x400, ANIM_TAG_UNUSED_WATER_COLUMN },
    { gBattleAnimSpriteSheet_114,  0x200, ANIM_TAG_UNUSED_MUD_UNK },
    { gBattleAnimSpriteSheet_115,  0x700, ANIM_TAG_RAIN_DROPS },
    { gBattleAnimSpriteSheet_116,  0x800, ANIM_TAG_UNUSED_FURY_SWIPES },
    { gBattleAnimSpriteSheet_117,  0xA00, ANIM_TAG_UNUSED_VINE_2 },
    { gBattleAnimSpriteSheet_118,  0x600, ANIM_TAG_UNUSED_TEETH },
    { gBattleAnimSpriteSheet_119,  0x800, ANIM_TAG_UNUSED_BONE },
    { gBattleAnimSpriteSheet_120,  0x200, ANIM_TAG_UNUSED_WHITE_BAG },
    { gBattleAnimSpriteSheet_121,   0x40, ANIM_TAG_UNUSED_UNKNOWN },
    { gBattleAnimSpriteSheet_122,  0x180, ANIM_TAG_UNUSED_PURPLE_CORAL },
    { gBattleAnimSpriteSheet_123,  0x600, ANIM_TAG_UNUSED_PURPLE_DROPLET },
    { gBattleAnimSpriteSheet_124,  0x600, ANIM_TAG_UNUSED_SHOCK_2 },
    { gBattleAnimSpriteSheet_125,  0x200, ANIM_TAG_UNUSED_CLOSING_EYE_2 },
    { gBattleAnimSpriteSheet_126,   0x80, ANIM_TAG_UNUSED_METAL_BALL },
    { gBattleAnimSpriteSheet_127,  0x200, ANIM_TAG_UNUSED_MONSTER_DOLL },
    { gBattleAnimSpriteSheet_128,  0x800, ANIM_TAG_UNUSED_WHIRLWIND },
    { gBattleAnimSpriteSheet_129,   0x80, ANIM_TAG_UNUSED_WHIRLWIND_2 },
    { gBattleAnimSpriteSheet_130,  0xA00, ANIM_TAG_UNUSED_EXPLOSION_4 },
    { gBattleAnimSpriteSheet_131,  0x280, ANIM_TAG_UNUSED_EXPLOSION_5 },
    { gBattleAnimSpriteSheet_132,  0x280, ANIM_TAG_UNUSED_TONGUE },
    { gBattleAnimSpriteSheet_133,  0x100, ANIM_TAG_UNUSED_SMOKE },
    { gBattleAnimSpriteSheet_134,  0x200, ANIM_TAG_UNUSED_SMOKE_2 },
    { gBattleAnimSpriteSheet_135,  0x200, ANIM_TAG_IMPACT },
    { gBattleAnimSpriteSheet_136,   0x20, ANIM_TAG_CIRCLE_IMPACT },
    { gBattleAnimSpriteSheet_137,  0xA00, ANIM_TAG_SCRATCH },
    { gBattleAnimSpriteSheet_138,  0x800, ANIM_TAG_CUT },
    { gBattleAnimSpriteSheet_139,  0x800, ANIM_TAG_SHARP_TEETH },
    { gBattleAnimSpriteSheet_140,   0xC0, ANIM_TAG_RAINBOW_RINGS },
    { gBattleAnimSpriteSheet_141,  0x1C0, ANIM_TAG_ICE_CRYSTALS },
    { gBattleAnimSpriteSheet_142,  0x100, ANIM_TAG_ICE_SPIKES },
    { gBattleAnimSpriteSheet_143,  0x800, ANIM_TAG_HANDS_AND_FEET },
    { gBattleAnimSpriteSheet_144,  0x200, ANIM_TAG_MIST_CLOUD },
    { gBattleAnimSpriteSheet_145,  0x800, ANIM_TAG_CLAMP },
    { gBattleAnimSpriteSheet_146,  0x180, ANIM_TAG_BUBBLE },
    { gBattleAnimSpriteSheet_147,  0x180, ANIM_TAG_ORBS },
    { gBattleAnimSpriteSheet_148,  0x200, ANIM_TAG_WATER_IMPACT },
    { gBattleAnimSpriteSheet_149,  0x200, ANIM_TAG_WATER_ORB },
    { gBattleAnimSpriteSheet_150,  0x180, ANIM_TAG_POISON_BUBBLE },
    { gBattleAnimSpriteSheet_151,  0x400, ANIM_TAG_TOXIC_BUBBLE },
    { gBattleAnimSpriteSheet_152,   0x80, ANIM_TAG_SPIKES },
    { gBattleAnimSpriteSheet_153,  0x100, ANIM_TAG_HORN_HIT_2 },
    { gBattleAnimSpriteSheet_154,  0x100, ANIM_TAG_AIR_WAVE_2 },
    { gBattleAnimSpriteSheet_155,  0x140, ANIM_TAG_SMALL_BUBBLES },
    { gBattleAnimSpriteSheet_156,  0x800, ANIM_TAG_ROUND_SHADOW },
    { gBattleAnimSpriteSheet_157,  0x200, ANIM_TAG_SUNLIGHT },
    { gBattleAnimSpriteSheet_158,  0x100, ANIM_TAG_SPORE },
    { gBattleAnimSpriteSheet_159,   0xA0, ANIM_TAG_FLOWER },
    { gBattleAnimSpriteSheet_160,  0x100, ANIM_TAG_RAZOR_LEAF },
    { gBattleAnimSpriteSheet_161,   0x80, ANIM_TAG_NEEDLE },
    { gBattleAnimSpriteSheet_162,  0x300, ANIM_TAG_WHIRLWIND_LINES },
    { gBattleAnimSpriteSheet_163,  0x100, ANIM_TAG_GOLD_RING },
    { gBattleAnimSpriteSheet_163,  0x100, ANIM_TAG_PURPLE_RING },
    { gBattleAnimSpriteSheet_163,  0x100, ANIM_TAG_BLUE_RING },
    { gBattleAnimSpriteSheet_166,  0x800, ANIM_TAG_GREEN_LIGHT_WALL },
    { gBattleAnimSpriteSheet_166,  0x800, ANIM_TAG_BLUE_LIGHT_WALL },
    { gBattleAnimSpriteSheet_166,  0x800, ANIM_TAG_RED_LIGHT_WALL },
    { gBattleAnimSpriteSheet_166,  0x800, ANIM_TAG_GRAY_LIGHT_WALL },
    { gBattleAnimSpriteSheet_166,  0x800, ANIM_TAG_ORANGE_LIGHT_WALL },
    { gBattleAnimSpriteSheet_171,   0x80, ANIM_TAG_BLACK_BALL_2 },
    { gBattleAnimSpriteSheet_144,  0x200, ANIM_TAG_PURPLE_GAS_CLOUD },
    { gBattleAnimSpriteSheet_173,  0x200, ANIM_TAG_SPARK_H },
    { gBattleAnimSpriteSheet_174,  0x200, ANIM_TAG_YELLOW_STAR },
    { gBattleAnimSpriteSheet_175,   0x80, ANIM_TAG_LARGE_FRESH_EGG },
    { gBattleAnimSpriteSheet_176,  0x200, ANIM_TAG_SHADOW_BALL },
    { gBattleAnimSpriteSheet_177,  0x500, ANIM_TAG_LICK },
    { gBattleAnimSpriteSheet_178,  0x800, ANIM_TAG_UNUSED_VOID_LINES },
    { gBattleAnimSpriteSheet_179,  0x400, ANIM_TAG_STRING },
    { gBattleAnimSpriteSheet_180,   0x20, ANIM_TAG_STRING_DOT },
    { gBattleAnimSpriteSheet_181,  0x800, ANIM_TAG_WEB },
    { gBattleAnimSpriteSheet_182,  0x100, ANIM_TAG_UNUSED_LIGHTBULB },
    { gBattleAnimSpriteSheet_183,  0x800, ANIM_TAG_SLASH },
    { gBattleAnimSpriteSheet_184,  0x400, ANIM_TAG_FOCUS_ENERGY },
    { gBattleAnimSpriteSheet_185,  0xA00, ANIM_TAG_SPHERE_TO_CUBE },
    { gBattleAnimSpriteSheet_186, 0x1000, ANIM_TAG_TENDRILS },
    { gBattleAnimSpriteSheet_187,  0x800, ANIM_TAG_EYE },
    { gBattleAnimSpriteSheet_188,  0x400, ANIM_TAG_WHITE_SHADOW },
    { gBattleAnimSpriteSheet_189,  0x200, ANIM_TAG_TEAL_ALERT },
    { gBattleAnimSpriteSheet_190,  0x800, ANIM_TAG_OPENING_EYE },
    { gBattleAnimSpriteSheet_191,  0x800, ANIM_TAG_ROUND_WHITE_HALO },
    { gBattleAnimSpriteSheet_192,  0x800, ANIM_TAG_FANG_ATTACK },
    { gBattleAnimSpriteSheet_193,  0x200, ANIM_TAG_PURPLE_HAND_OUTLINE },
    { gBattleAnimSpriteSheet_194,  0x800, ANIM_TAG_MOON },
    { gBattleAnimSpriteSheet_195,  0x200, ANIM_TAG_SPARKLE_5 },
    { gBattleAnimSpriteSheet_196,  0x800, ANIM_TAG_SPIRAL },
    { gBattleAnimSpriteSheet_197,  0x200, ANIM_TAG_SNORE_Z },
    { gBattleAnimSpriteSheet_198,  0x800, ANIM_TAG_EXPLOSION },
    { gBattleAnimSpriteSheet_199,  0x400, ANIM_TAG_NAIL },
    { gBattleAnimSpriteSheet_200,  0x200, ANIM_TAG_GHOSTLY_SPIRIT },
    { gBattleAnimSpriteSheet_201,  0xA80, ANIM_TAG_WARM_ROCK },
    { gBattleAnimSpriteSheet_202,  0x600, ANIM_TAG_BREAKING_EGG },
    { gBattleAnimSpriteSheet_203,  0x800, ANIM_TAG_THIN_RING },
    { gBattleAnimSpriteSheet_204,  0x200, ANIM_TAG_UNUSED_PUNCH_IMPACT },
    { gBattleAnimSpriteSheet_205,  0x600, ANIM_TAG_BELL },
    { gBattleAnimSpriteSheet_206,  0x800, ANIM_TAG_MUSIC_NOTES_2 },
    { gBattleAnimSpriteSheet_207,  0x180, ANIM_TAG_SPEED_DUST },
    { gBattleAnimSpriteSheet_208,  0x800, ANIM_TAG_TORN_METAL },
    { gBattleAnimSpriteSheet_209,  0x800, ANIM_TAG_THOUGHT_BUBBLE },
    { gBattleAnimSpriteSheet_210,   0x80, ANIM_TAG_MAGENTA_HEART },
    { gBattleAnimSpriteSheet_211,   0x80, ANIM_TAG_ELECTRIC_ORBS },
    { gBattleAnimSpriteSheet_212,  0x800, ANIM_TAG_CIRCLE_OF_LIGHT },
    { gBattleAnimSpriteSheet_213,  0x800, ANIM_TAG_ELECTRICITY },
    { gBattleAnimSpriteSheet_214,  0x600, ANIM_TAG_FINGER_2 },
    { gBattleAnimSpriteSheet_215,  0x600, ANIM_TAG_MOVEMENT_WAVES },
    { gBattleAnimSpriteSheet_210,   0x80, ANIM_TAG_RED_HEART },
    { gBattleAnimSpriteSheet_217,   0x80, ANIM_TAG_RED_ORB },
    { gBattleAnimSpriteSheet_218,  0x180, ANIM_TAG_EYE_SPARKLE },
    { gBattleAnimSpriteSheet_210,   0x80, ANIM_TAG_PINK_HEART },
    { gBattleAnimSpriteSheet_220,  0x200, ANIM_TAG_ANGEL },
    { gBattleAnimSpriteSheet_221,  0x400, ANIM_TAG_DEVIL },
    { gBattleAnimSpriteSheet_222,  0xA00, ANIM_TAG_SWIPE },
    { gBattleAnimSpriteSheet_223,  0x800, ANIM_TAG_ROOTS },
    { gBattleAnimSpriteSheet_224,  0x200, ANIM_TAG_ITEM_BAG },
    { gBattleAnimSpriteSheet_225,  0x400, ANIM_TAG_JAGGED_MUSIC_NOTE },
    { gBattleAnimSpriteSheet_226,   0x80, ANIM_TAG_POKEBALL },
    { gBattleAnimSpriteSheet_227,  0x800, ANIM_TAG_SPOTLIGHT },
    { gBattleAnimSpriteSheet_228,  0x200, ANIM_TAG_LETTER_Z },
    { gBattleAnimSpriteSheet_229,  0x300, ANIM_TAG_RAPID_SPIN },
    { gBattleAnimSpriteSheet_230,  0x800, ANIM_TAG_TRI_FORCE_TRIANGLE },
    { gBattleAnimSpriteSheet_231,  0x380, ANIM_TAG_WISP_ORB },
    { gBattleAnimSpriteSheet_232,  0x800, ANIM_TAG_WISP_FIRE },
    { gBattleAnimSpriteSheet_233,   0xC0, ANIM_TAG_GOLD_STARS },
    { gBattleAnimSpriteSheet_234,  0x800, ANIM_TAG_ECLIPSING_ORB },
    { gBattleAnimSpriteSheet_235,   0x60, ANIM_TAG_GRAY_ORB },
    { gBattleAnimSpriteSheet_235,   0x60, ANIM_TAG_BLUE_ORB },
    { gBattleAnimSpriteSheet_235,   0x60, ANIM_TAG_RED_ORB_2 },
    { gBattleAnimSpriteSheet_238,   0x80, ANIM_TAG_PINK_PETAL },
    { gBattleAnimSpriteSheet_239,  0x180, ANIM_TAG_PAIN_SPLIT },
    { gBattleAnimSpriteSheet_240,  0x180, ANIM_TAG_CONFETTI },
    { gBattleAnimSpriteSheet_241,  0x200, ANIM_TAG_GREEN_STAR },
    { gBattleAnimSpriteSheet_242,  0x200, ANIM_TAG_PINK_CLOUD },
    { gBattleAnimSpriteSheet_243,   0x20, ANIM_TAG_SWEAT_DROP },
    { gBattleAnimSpriteSheet_244,  0x400, ANIM_TAG_GUARD_RING },
    { gBattleAnimSpriteSheet_245,  0x600, ANIM_TAG_PURPLE_SCRATCH },
    { gBattleAnimSpriteSheet_246, 0x1000, ANIM_TAG_PURPLE_SWIPE },
    { gBattleAnimSpriteSheet_247,  0x400, ANIM_TAG_TAG_HAND },
    { gBattleAnimSpriteSheet_248,   0x20, ANIM_TAG_SMALL_RED_EYE },
    { gBattleAnimSpriteSheet_249,   0x80, ANIM_TAG_HOLLOW_ORB },
    { gBattleAnimSpriteSheet_250,  0x800, ANIM_TAG_X_SIGN },
    { gBattleAnimSpriteSheet_251,   0x80, ANIM_TAG_BLUEGREEN_ORB },
    { gBattleAnimSpriteSheet_252,  0x200, ANIM_TAG_PAW_PRINT },
    { gBattleAnimSpriteSheet_253,  0x400, ANIM_TAG_PURPLE_FLAME },
    { gBattleAnimSpriteSheet_254,  0x200, ANIM_TAG_RED_BALL },
    { gBattleAnimSpriteSheet_255,  0x200, ANIM_TAG_SMELLINGSALT_EFFECT },
    { gBattleAnimSpriteSheet_256,  0x800, ANIM_TAG_METEOR },
    { gBattleAnimSpriteSheet_257,  0x280, ANIM_TAG_FLAT_ROCK },
    { gBattleAnimSpriteSheet_258,  0x200, ANIM_TAG_MAGNIFYING_GLASS },
    { gBattleAnimSpriteSheet_149,  0x200, ANIM_TAG_BROWN_ORB },
    { gBattleAnimSpriteSheet_260,  0x400, ANIM_TAG_METAL_SOUND_WAVES },
    { gBattleAnimSpriteSheet_261,  0x200, ANIM_TAG_FLYING_DIRT },
    { gBattleAnimSpriteSheet_262,  0x200, ANIM_TAG_ICICLE_SPEAR },
    { gBattleAnimSpriteSheet_263,   0x80, ANIM_TAG_HAIL },
    { gBattleAnimSpriteSheet_264,   0x20, ANIM_TAG_GLOWY_RED_ORB },
    { gBattleAnimSpriteSheet_264,   0x20, ANIM_TAG_GLOWY_GREEN_ORB },
    { gBattleAnimSpriteSheet_266,   0x80, ANIM_TAG_GREEN_SPIKE },
    { gBattleAnimSpriteSheet_212,  0x800, ANIM_TAG_WHITE_CIRCLE_OF_LIGHT },
    { gBattleAnimSpriteSheet_264,   0x20, ANIM_TAG_GLOWY_BLUE_ORB },
    { gBattleAnimSpriteSheet_269,   0x80, ANIM_TAG_UNUSED_RED_BRICK },
    { gBattleAnimSpriteSheet_270,  0x400, ANIM_TAG_WHITE_FEATHER },
    { gBattleAnimSpriteSheet_271,   0x80, ANIM_TAG_SPARKLE_6 },
    { gBattleAnimSpriteSheet_272,  0x800, ANIM_TAG_SPLASH },
    { gBattleAnimSpriteSheet_273,   0x20, ANIM_TAG_SWEAT_BEAD },
    { gBattleAnimSpriteSheet_274,  0x800, ANIM_TAG_UNUSED_GEM_1 },
    { gBattleAnimSpriteSheet_275,  0x800, ANIM_TAG_UNUSED_GEM_2 },
    { gBattleAnimSpriteSheet_276,  0x800, ANIM_TAG_UNUSED_GEM_3 },
    { gBattleAnimSpriteSheet_277, 0x1000, ANIM_TAG_SLAM_HIT_2 },
    { gBattleAnimSpriteSheet_278,  0x800, ANIM_TAG_RECYCLE },
    { gBattleAnimSpriteSheet_279,   0xA0, ANIM_TAG_UNUSED_RED_PARTICLES },
    { gBattleAnimSpriteSheet_280,  0x800, ANIM_TAG_PROTECT },
    { gBattleAnimSpriteSheet_281,  0x200, ANIM_TAG_DIRT_MOUND },
    { gBattleAnimSpriteSheet_282,  0x600, ANIM_TAG_SHOCK_3 },
    { gBattleAnimSpriteSheet_283,  0x200, ANIM_TAG_WEATHER_BALL },
    { gBattleAnimSpriteSheet_284,  0x800, ANIM_TAG_BIRD },
    { gBattleAnimSpriteSheet_285,  0x200, ANIM_TAG_CROSS_IMPACT },
    { gBattleAnimSpriteSheet_183,  0x800, ANIM_TAG_SLASH_2 },
    { gBattleAnimSpriteSheet_056, 0x1000, ANIM_TAG_WHIP_HIT },
    { gBattleAnimSpriteSheet_163,  0x100, ANIM_TAG_BLUE_RING_2 },
};

const struct CompressedSpritePalette gBattleAnimPaletteTable[] =
{
    { gBattleAnimSpritePalette_000, ANIM_TAG_BONE },
    { gBattleAnimSpritePalette_001, ANIM_TAG_SPARK },
    { gBattleAnimSpritePalette_002, ANIM_TAG_PENCIL },
    { gBattleAnimSpritePalette_003, ANIM_TAG_AIR_WAVE },
    { gBattleAnimSpritePalette_004, ANIM_TAG_UNUSED_ORB },
    { gBattleAnimSpritePalette_005, ANIM_TAG_SWORD },
    { gBattleAnimSpritePalette_006, ANIM_TAG_SEED },
    { gBattleAnimSpritePalette_007, ANIM_TAG_UNUSED_EXPLOSION },
    { gBattleAnimSpritePalette_008, ANIM_TAG_UNUSED_PINK_ORB },
    { gBattleAnimSpritePalette_009, ANIM_TAG_GUST },
    { gBattleAnimSpritePalette_010, ANIM_TAG_ICE_CUBE },
    { gBattleAnimSpritePalette_011, ANIM_TAG_SPARK_2 },
    { gBattleAnimSpritePalette_012, ANIM_TAG_UNUSED_ORANGE },
    { gBattleAnimSpritePalette_013, ANIM_TAG_YELLOW_BALL },
    { gBattleAnimSpritePalette_014, ANIM_TAG_LOCK_ON },
    { gBattleAnimSpritePalette_015, ANIM_TAG_TIED_BAG },
    { gBattleAnimSpritePalette_016, ANIM_TAG_BLACK_SMOKE },
    { gBattleAnimSpritePalette_016, ANIM_TAG_BLACK_BALL },
    { gBattleAnimSpritePalette_018, ANIM_TAG_CONVERSION },
    { gBattleAnimSpritePalette_019, ANIM_TAG_UNUSED_GLASS },
    { gBattleAnimSpritePalette_020, ANIM_TAG_HORN_HIT },
    { gBattleAnimSpritePalette_021, ANIM_TAG_UNUSED_HIT },
    { gBattleAnimSpritePalette_022, ANIM_TAG_UNUSED_HIT_2 },
    { gBattleAnimSpritePalette_023, ANIM_TAG_UNUSED_BLUE_SHARDS },
    { gBattleAnimSpritePalette_024, ANIM_TAG_UNUSED_CLOSING_EYE },
    { gBattleAnimSpritePalette_025, ANIM_TAG_UNUSED_WAVING_HAND },
    { gBattleAnimSpritePalette_026, ANIM_TAG_UNUSED_HIT_DUPLICATE },
    { gBattleAnimSpritePalette_027, ANIM_TAG_LEER },
    { gBattleAnimSpritePalette_028, ANIM_TAG_UNUSED_BLUE_BURST },
    { gBattleAnimSpritePalette_029, ANIM_TAG_SMALL_EMBER },
    { gBattleAnimSpritePalette_030, ANIM_TAG_GRAY_SMOKE },
    { gBattleAnimSpritePalette_031, ANIM_TAG_BLUE_STAR },
    { gBattleAnimSpritePalette_032, ANIM_TAG_UNUSED_BUBBLE_BURST },
    { gBattleAnimSpritePalette_033, ANIM_TAG_FIRE },
    { gBattleAnimSpritePalette_033, ANIM_TAG_UNUSED_SPINNING_FIRE },
    { gBattleAnimSpritePalette_033, ANIM_TAG_FIRE_PLUME },
    { gBattleAnimSpritePalette_036, ANIM_TAG_UNUSED_LIGHTNING },
    { gBattleAnimSpritePalette_036, ANIM_TAG_LIGHTNING },
    { gBattleAnimSpritePalette_038, ANIM_TAG_UNUSED_CLAW_SLASH },
    { gBattleAnimSpritePalette_039, ANIM_TAG_CLAW_SLASH },
    { gBattleAnimSpritePalette_038, ANIM_TAG_UNUSED_SCRATCH },
    { gBattleAnimSpritePalette_038, ANIM_TAG_UNUSED_SCRATCH_2 },
    { gBattleAnimSpritePalette_042, ANIM_TAG_UNUSED_BUBBLE_BURST_2 },
    { gBattleAnimSpritePalette_043, ANIM_TAG_ICE_CHUNK },
    { gBattleAnimSpritePalette_044, ANIM_TAG_UNUSED_GLASS_2 },
    { gBattleAnimSpritePalette_045, ANIM_TAG_UNUSED_PINK_HEART },
    { gBattleAnimSpritePalette_046, ANIM_TAG_UNUSED_SAP_DRIP },
    { gBattleAnimSpritePalette_047, ANIM_TAG_UNUSED_SAP_DRIP },
    { gBattleAnimSpritePalette_048, ANIM_TAG_SPARKLE_1 },
    { gBattleAnimSpritePalette_049, ANIM_TAG_SPARKLE_2 },
    { gBattleAnimSpritePalette_050, ANIM_TAG_HUMANOID_FOOT },
    { gBattleAnimSpritePalette_050, ANIM_TAG_UNUSED_MONSTER_FOOT },
    { gBattleAnimSpritePalette_050, ANIM_TAG_UNUSED_HUMANOID_HAND },
    { gBattleAnimSpritePalette_026, ANIM_TAG_NOISE_LINE },
    { gBattleAnimSpritePalette_054, ANIM_TAG_UNUSED_YELLOW_UNK },
    { gBattleAnimSpritePalette_050, ANIM_TAG_UNUSED_RED_FIST },
    { gBattleAnimSpritePalette_056, ANIM_TAG_SLAM_HIT },
    { gBattleAnimSpritePalette_057, ANIM_TAG_UNUSED_RING },
    { gBattleAnimSpritePalette_058, ANIM_TAG_ROCKS },
    { gBattleAnimSpritePalette_059, ANIM_TAG_UNUSED_Z },
    { gBattleAnimSpritePalette_060, ANIM_TAG_UNUSED_YELLOW_UNK_2 },
    { gBattleAnimSpritePalette_061, ANIM_TAG_UNUSED_AIR_SLASH },
    { gBattleAnimSpritePalette_062, ANIM_TAG_UNUSED_SPINNING_GREEN_ORBS },
    { gBattleAnimSpritePalette_063, ANIM_TAG_LEAF },
    { gBattleAnimSpritePalette_064, ANIM_TAG_FINGER },
    { gBattleAnimSpritePalette_065, ANIM_TAG_POISON_POWDER },
    { gBattleAnimSpritePalette_066, ANIM_TAG_UNUSED_BROWN_TRIANGLE },
    { gBattleAnimSpritePalette_067, ANIM_TAG_SLEEP_POWDER },
    { gBattleAnimSpritePalette_068, ANIM_TAG_STUN_SPORE },
    { gBattleAnimSpritePalette_065, ANIM_TAG_UNUSED_POWDER },
    { gBattleAnimSpritePalette_070, ANIM_TAG_SPARKLE_3 },
    { gBattleAnimSpritePalette_070, ANIM_TAG_SPARKLE_4 },
    { gBattleAnimSpritePalette_072, ANIM_TAG_MUSIC_NOTES },
    { gBattleAnimSpritePalette_073, ANIM_TAG_DUCK },
    { gBattleAnimSpritePalette_074, ANIM_TAG_MUD_SAND },
    { gBattleAnimSpritePalette_075, ANIM_TAG_ALERT },
    { gBattleAnimSpritePalette_076, ANIM_TAG_UNUSED_BLUE_FLAMES },
    { gBattleAnimSpritePalette_076, ANIM_TAG_UNUSED_BLUE_FLAMES_2 },
    { gBattleAnimSpritePalette_078, ANIM_TAG_UNUSED_SHOCK },
    { gBattleAnimSpritePalette_078, ANIM_TAG_SHOCK },
    { gBattleAnimSpritePalette_080, ANIM_TAG_UNUSED_BELL },
    { gBattleAnimSpritePalette_081, ANIM_TAG_UNUSED_PINK_GLOVE },
    { gBattleAnimSpritePalette_082, ANIM_TAG_UNUSED_BLUE_LINES },
    { gBattleAnimSpritePalette_083, ANIM_TAG_UNUSED_IMPACT },
    { gBattleAnimSpritePalette_084, ANIM_TAG_UNUSED_IMPACT_2 },
    { gBattleAnimSpritePalette_085, ANIM_TAG_UNUSED_RETICLE },
    { gBattleAnimSpritePalette_086, ANIM_TAG_BREATH },
    { gBattleAnimSpritePalette_087, ANIM_TAG_ANGER },
    { gBattleAnimSpritePalette_088, ANIM_TAG_UNUSED_SNOWBALL },
    { gBattleAnimSpritePalette_089, ANIM_TAG_UNUSED_VINE },
    { gBattleAnimSpritePalette_090, ANIM_TAG_UNUSED_SWORD },
    { gBattleAnimSpritePalette_091, ANIM_TAG_UNUSED_CLAPPING },
    { gBattleAnimSpritePalette_092, ANIM_TAG_UNUSED_RED_TUBE },
    { gBattleAnimSpritePalette_093, ANIM_TAG_AMNESIA },
    { gBattleAnimSpritePalette_094, ANIM_TAG_UNUSED_STRING },
    { gBattleAnimSpritePalette_095, ANIM_TAG_UNUSED_PENCIL },
    { gBattleAnimSpritePalette_096, ANIM_TAG_UNUSED_PETAL },
    { gBattleAnimSpritePalette_097, ANIM_TAG_BENT_SPOON },
    { gBattleAnimSpritePalette_094, ANIM_TAG_UNUSED_WEB },
    { gBattleAnimSpritePalette_099, ANIM_TAG_MILK_BOTTLE },
    { gBattleAnimSpritePalette_100, ANIM_TAG_COIN },
    { gBattleAnimSpritePalette_101, ANIM_TAG_UNUSED_CRACKED_EGG },
    { gBattleAnimSpritePalette_101, ANIM_TAG_UNUSED_HATCHED_EGG },
    { gBattleAnimSpritePalette_103, ANIM_TAG_UNUSED_FRESH_EGG },
    { gBattleAnimSpritePalette_104, ANIM_TAG_UNUSED_FANGS },
    { gBattleAnimSpritePalette_105, ANIM_TAG_UNUSED_EXPLOSION_2 },
    { gBattleAnimSpritePalette_105, ANIM_TAG_UNUSED_EXPLOSION_3 },
    { gBattleAnimSpritePalette_107, ANIM_TAG_UNUSED_WATER_DROPLET },
    { gBattleAnimSpritePalette_107, ANIM_TAG_UNUSED_WATER_DROPLET_2 },
    { gBattleAnimSpritePalette_109, ANIM_TAG_UNUSED_SEED },
    { gBattleAnimSpritePalette_109, ANIM_TAG_UNUSED_SPROUT },
    { gBattleAnimSpritePalette_111, ANIM_TAG_UNUSED_RED_WAND },
    { gBattleAnimSpritePalette_112, ANIM_TAG_UNUSED_PURPLE_GREEN_UNK },
    { gBattleAnimSpritePalette_113, ANIM_TAG_UNUSED_WATER_COLUMN },
    { gBattleAnimSpritePalette_114, ANIM_TAG_UNUSED_MUD_UNK },
    { gBattleAnimSpritePalette_115, ANIM_TAG_RAIN_DROPS },
    { gBattleAnimSpritePalette_116, ANIM_TAG_UNUSED_FURY_SWIPES },
    { gBattleAnimSpritePalette_117, ANIM_TAG_UNUSED_VINE_2 },
    { gBattleAnimSpritePalette_118, ANIM_TAG_UNUSED_TEETH },
    { gBattleAnimSpritePalette_119, ANIM_TAG_UNUSED_BONE },
    { gBattleAnimSpritePalette_120, ANIM_TAG_UNUSED_WHITE_BAG },
    { gBattleAnimSpritePalette_121, ANIM_TAG_UNUSED_UNKNOWN },
    { gBattleAnimSpritePalette_122, ANIM_TAG_UNUSED_PURPLE_CORAL },
    { gBattleAnimSpritePalette_122, ANIM_TAG_UNUSED_PURPLE_DROPLET },
    { gBattleAnimSpritePalette_124, ANIM_TAG_UNUSED_SHOCK_2 },
    { gBattleAnimSpritePalette_125, ANIM_TAG_UNUSED_CLOSING_EYE_2 },
    { gBattleAnimSpritePalette_126, ANIM_TAG_UNUSED_METAL_BALL },
    { gBattleAnimSpritePalette_127, ANIM_TAG_UNUSED_MONSTER_DOLL },
    { gBattleAnimSpritePalette_128, ANIM_TAG_UNUSED_WHIRLWIND },
    { gBattleAnimSpritePalette_128, ANIM_TAG_UNUSED_WHIRLWIND_2 },
    { gBattleAnimSpritePalette_130, ANIM_TAG_UNUSED_EXPLOSION_4 },
    { gBattleAnimSpritePalette_130, ANIM_TAG_UNUSED_EXPLOSION_5 },
    { gBattleAnimSpritePalette_132, ANIM_TAG_UNUSED_TONGUE },
    { gBattleAnimSpritePalette_133, ANIM_TAG_UNUSED_SMOKE },
    { gBattleAnimSpritePalette_133, ANIM_TAG_UNUSED_SMOKE_2 },
    { gBattleAnimSpritePalette_135, ANIM_TAG_IMPACT },
    { gBattleAnimSpritePalette_136, ANIM_TAG_CIRCLE_IMPACT },
    { gBattleAnimSpritePalette_135, ANIM_TAG_SCRATCH },
    { gBattleAnimSpritePalette_135, ANIM_TAG_CUT },
    { gBattleAnimSpritePalette_139, ANIM_TAG_SHARP_TEETH },
    { gBattleAnimSpritePalette_140, ANIM_TAG_RAINBOW_RINGS },
    { gBattleAnimSpritePalette_141, ANIM_TAG_ICE_CRYSTALS },
    { gBattleAnimSpritePalette_141, ANIM_TAG_ICE_SPIKES },
    { gBattleAnimSpritePalette_143, ANIM_TAG_HANDS_AND_FEET },
    { gBattleAnimSpritePalette_144, ANIM_TAG_MIST_CLOUD },
    { gBattleAnimSpritePalette_139, ANIM_TAG_CLAMP },
    { gBattleAnimSpritePalette_115, ANIM_TAG_BUBBLE },
    { gBattleAnimSpritePalette_147, ANIM_TAG_ORBS },
    { gBattleAnimSpritePalette_148, ANIM_TAG_WATER_IMPACT },
    { gBattleAnimSpritePalette_148, ANIM_TAG_WATER_ORB },
    { gBattleAnimSpritePalette_150, ANIM_TAG_POISON_BUBBLE },
    { gBattleAnimSpritePalette_150, ANIM_TAG_TOXIC_BUBBLE },
    { gBattleAnimSpritePalette_152, ANIM_TAG_SPIKES },
    { gBattleAnimSpritePalette_153, ANIM_TAG_HORN_HIT_2 },
    { gBattleAnimSpritePalette_154, ANIM_TAG_AIR_WAVE_2 },
    { gBattleAnimSpritePalette_155, ANIM_TAG_SMALL_BUBBLES },
    { gBattleAnimSpritePalette_156, ANIM_TAG_ROUND_SHADOW },
    { gBattleAnimSpritePalette_157, ANIM_TAG_SUNLIGHT },
    { gBattleAnimSpritePalette_158, ANIM_TAG_SPORE },
    { gBattleAnimSpritePalette_159, ANIM_TAG_FLOWER },
    { gBattleAnimSpritePalette_160, ANIM_TAG_RAZOR_LEAF },
    { gBattleAnimSpritePalette_161, ANIM_TAG_NEEDLE },
    { gBattleAnimSpritePalette_162, ANIM_TAG_WHIRLWIND_LINES },
    { gBattleAnimSpritePalette_163, ANIM_TAG_GOLD_RING },
    { gBattleAnimSpritePalette_164, ANIM_TAG_PURPLE_RING },
    { gBattleAnimSpritePalette_165, ANIM_TAG_BLUE_RING },
    { gBattleAnimSpritePalette_166, ANIM_TAG_GREEN_LIGHT_WALL },
    { gBattleAnimSpritePalette_167, ANIM_TAG_BLUE_LIGHT_WALL },
    { gBattleAnimSpritePalette_168, ANIM_TAG_RED_LIGHT_WALL },
    { gBattleAnimSpritePalette_169, ANIM_TAG_GRAY_LIGHT_WALL },
    { gBattleAnimSpritePalette_170, ANIM_TAG_ORANGE_LIGHT_WALL },
    { gBattleAnimSpritePalette_171, ANIM_TAG_BLACK_BALL_2 },
    { gBattleAnimSpritePalette_172, ANIM_TAG_PURPLE_GAS_CLOUD },
    { gBattleAnimSpritePalette_001, ANIM_TAG_SPARK_H },
    { gBattleAnimSpritePalette_174, ANIM_TAG_YELLOW_STAR },
    { gBattleAnimSpritePalette_175, ANIM_TAG_LARGE_FRESH_EGG },
    { gBattleAnimSpritePalette_176, ANIM_TAG_SHADOW_BALL },
    { gBattleAnimSpritePalette_177, ANIM_TAG_LICK },
    { gBattleAnimSpritePalette_178, ANIM_TAG_UNUSED_VOID_LINES },
    { gBattleAnimSpritePalette_179, ANIM_TAG_STRING },
    { gBattleAnimSpritePalette_179, ANIM_TAG_STRING_DOT },
    { gBattleAnimSpritePalette_179, ANIM_TAG_WEB },
    { gBattleAnimSpritePalette_182, ANIM_TAG_UNUSED_LIGHTBULB },
    { gBattleAnimSpritePalette_183, ANIM_TAG_SLASH },
    { gBattleAnimSpritePalette_184, ANIM_TAG_FOCUS_ENERGY },
    { gBattleAnimSpritePalette_185, ANIM_TAG_SPHERE_TO_CUBE },
    { gBattleAnimSpritePalette_186, ANIM_TAG_TENDRILS },
    { gBattleAnimSpritePalette_187, ANIM_TAG_EYE },
    { gBattleAnimSpritePalette_188, ANIM_TAG_WHITE_SHADOW },
    { gBattleAnimSpritePalette_189, ANIM_TAG_TEAL_ALERT },
    { gBattleAnimSpritePalette_190, ANIM_TAG_OPENING_EYE },
    { gBattleAnimSpritePalette_191, ANIM_TAG_ROUND_WHITE_HALO },
    { gBattleAnimSpritePalette_192, ANIM_TAG_FANG_ATTACK },
    { gBattleAnimSpritePalette_193, ANIM_TAG_PURPLE_HAND_OUTLINE },
    { gBattleAnimSpritePalette_194, ANIM_TAG_MOON },
    { gBattleAnimSpritePalette_195, ANIM_TAG_SPARKLE_5 },
    { gBattleAnimSpritePalette_196, ANIM_TAG_SPIRAL },
    { gBattleAnimSpritePalette_197, ANIM_TAG_SNORE_Z },
    { gBattleAnimSpritePalette_198, ANIM_TAG_EXPLOSION },
    { gBattleAnimSpritePalette_199, ANIM_TAG_NAIL },
    { gBattleAnimSpritePalette_200, ANIM_TAG_GHOSTLY_SPIRIT },
    { gBattleAnimSpritePalette_201, ANIM_TAG_WARM_ROCK },
    { gBattleAnimSpritePalette_202, ANIM_TAG_BREAKING_EGG },
    { gBattleAnimSpritePalette_203, ANIM_TAG_THIN_RING },
    { gBattleAnimSpritePalette_204, ANIM_TAG_UNUSED_PUNCH_IMPACT },
    { gBattleAnimSpritePalette_205, ANIM_TAG_BELL },
    { gBattleAnimSpritePalette_206, ANIM_TAG_MUSIC_NOTES_2 },
    { gBattleAnimSpritePalette_207, ANIM_TAG_SPEED_DUST },
    { gBattleAnimSpritePalette_167, ANIM_TAG_TORN_METAL },
    { gBattleAnimSpritePalette_209, ANIM_TAG_THOUGHT_BUBBLE },
    { gBattleAnimSpritePalette_210, ANIM_TAG_MAGENTA_HEART },
    { gBattleAnimSpritePalette_211, ANIM_TAG_ELECTRIC_ORBS },
    { gBattleAnimSpritePalette_211, ANIM_TAG_CIRCLE_OF_LIGHT },
    { gBattleAnimSpritePalette_211, ANIM_TAG_ELECTRICITY },
    { gBattleAnimSpritePalette_064, ANIM_TAG_FINGER_2 },
    { gBattleAnimSpritePalette_215, ANIM_TAG_MOVEMENT_WAVES },
    { gBattleAnimSpritePalette_216, ANIM_TAG_RED_HEART },
    { gBattleAnimSpritePalette_217, ANIM_TAG_RED_ORB },
    { gBattleAnimSpritePalette_218, ANIM_TAG_EYE_SPARKLE },
    { gBattleAnimSpritePalette_219, ANIM_TAG_PINK_HEART },
    { gBattleAnimSpritePalette_220, ANIM_TAG_ANGEL },
    { gBattleAnimSpritePalette_221, ANIM_TAG_DEVIL },
    { gBattleAnimSpritePalette_222, ANIM_TAG_SWIPE },
    { gBattleAnimSpritePalette_223, ANIM_TAG_ROOTS },
    { gBattleAnimSpritePalette_224, ANIM_TAG_ITEM_BAG },
    { gBattleAnimSpritePalette_225, ANIM_TAG_JAGGED_MUSIC_NOTE },
    { gBattleAnimSpritePalette_226, ANIM_TAG_POKEBALL },
    { gBattleAnimSpritePalette_226, ANIM_TAG_SPOTLIGHT },
    { gBattleAnimSpritePalette_228, ANIM_TAG_LETTER_Z },
    { gBattleAnimSpritePalette_229, ANIM_TAG_RAPID_SPIN },
    { gBattleAnimSpritePalette_230, ANIM_TAG_TRI_FORCE_TRIANGLE },
    { gBattleAnimSpritePalette_231, ANIM_TAG_WISP_ORB },
    { gBattleAnimSpritePalette_231, ANIM_TAG_WISP_FIRE },
    { gBattleAnimSpritePalette_233, ANIM_TAG_GOLD_STARS },
    { gBattleAnimSpritePalette_234, ANIM_TAG_ECLIPSING_ORB },
    { gBattleAnimSpritePalette_235, ANIM_TAG_GRAY_ORB },
    { gBattleAnimSpritePalette_236, ANIM_TAG_BLUE_ORB },
    { gBattleAnimSpritePalette_237, ANIM_TAG_RED_ORB_2 },
    { gBattleAnimSpritePalette_238, ANIM_TAG_PINK_PETAL },
    { gBattleAnimSpritePalette_239, ANIM_TAG_PAIN_SPLIT },
    { gBattleAnimSpritePalette_240, ANIM_TAG_CONFETTI },
    { gBattleAnimSpritePalette_241, ANIM_TAG_GREEN_STAR },
    { gBattleAnimSpritePalette_242, ANIM_TAG_PINK_CLOUD },
    { gBattleAnimSpritePalette_243, ANIM_TAG_SWEAT_DROP },
    { gBattleAnimSpritePalette_244, ANIM_TAG_GUARD_RING },
    { gBattleAnimSpritePalette_245, ANIM_TAG_PURPLE_SCRATCH },
    { gBattleAnimSpritePalette_245, ANIM_TAG_PURPLE_SWIPE },
    { gBattleAnimSpritePalette_064, ANIM_TAG_TAG_HAND },
    { gBattleAnimSpritePalette_248, ANIM_TAG_SMALL_RED_EYE },
    { gBattleAnimSpritePalette_249, ANIM_TAG_HOLLOW_ORB },
    { gBattleAnimSpritePalette_249, ANIM_TAG_X_SIGN },
    { gBattleAnimSpritePalette_251, ANIM_TAG_BLUEGREEN_ORB },
    { gBattleAnimSpritePalette_252, ANIM_TAG_PAW_PRINT },
    { gBattleAnimSpritePalette_253, ANIM_TAG_PURPLE_FLAME },
    { gBattleAnimSpritePalette_254, ANIM_TAG_RED_BALL },
    { gBattleAnimSpritePalette_255, ANIM_TAG_SMELLINGSALT_EFFECT },
    { gBattleAnimSpritePalette_256, ANIM_TAG_METEOR },
    { gBattleAnimSpritePalette_257, ANIM_TAG_FLAT_ROCK },
    { gBattleAnimSpritePalette_258, ANIM_TAG_MAGNIFYING_GLASS },
    { gBattleAnimSpritePalette_259, ANIM_TAG_BROWN_ORB },
    { gBattleAnimSpritePalette_260, ANIM_TAG_METAL_SOUND_WAVES },
    { gBattleAnimSpritePalette_261, ANIM_TAG_FLYING_DIRT },
    { gBattleAnimSpritePalette_262, ANIM_TAG_ICICLE_SPEAR },
    { gBattleAnimSpritePalette_263, ANIM_TAG_HAIL },
    { gBattleAnimSpritePalette_264, ANIM_TAG_GLOWY_RED_ORB },
    { gBattleAnimSpritePalette_265, ANIM_TAG_GLOWY_GREEN_ORB },
    { gBattleAnimSpritePalette_266, ANIM_TAG_GREEN_SPIKE },
    { gBattleAnimSpritePalette_267, ANIM_TAG_WHITE_CIRCLE_OF_LIGHT },
    { gBattleAnimSpritePalette_268, ANIM_TAG_GLOWY_BLUE_ORB },
    { gBattleAnimSpritePalette_269, ANIM_TAG_UNUSED_RED_BRICK },
    { gBattleAnimSpritePalette_270, ANIM_TAG_WHITE_FEATHER },
    { gBattleAnimSpritePalette_271, ANIM_TAG_SPARKLE_6 },
    { gBattleAnimSpritePalette_272, ANIM_TAG_SPLASH },
    { gBattleAnimSpritePalette_272, ANIM_TAG_SWEAT_BEAD },
    { gBattleAnimSpritePalette_274, ANIM_TAG_UNUSED_GEM_1 },
    { gBattleAnimSpritePalette_274, ANIM_TAG_UNUSED_GEM_2 },
    { gBattleAnimSpritePalette_274, ANIM_TAG_UNUSED_GEM_3 },
    { gBattleAnimSpritePalette_277, ANIM_TAG_SLAM_HIT_2 },
    { gBattleAnimSpritePalette_278, ANIM_TAG_RECYCLE },
    { gBattleAnimSpritePalette_279, ANIM_TAG_UNUSED_RED_PARTICLES },
    { gBattleAnimSpritePalette_280, ANIM_TAG_PROTECT },
    { gBattleAnimSpritePalette_281, ANIM_TAG_DIRT_MOUND },
    { gBattleAnimSpritePalette_282, ANIM_TAG_SHOCK_3 },
    { gBattleAnimSpritePalette_283, ANIM_TAG_WEATHER_BALL },
    { gBattleAnimSpritePalette_284, ANIM_TAG_BIRD },
    { gBattleAnimSpritePalette_285, ANIM_TAG_CROSS_IMPACT },
    { gBattleAnimSpritePalette_286, ANIM_TAG_SLASH_2 },
    { gBattleAnimSpritePalette_287, ANIM_TAG_WHIP_HIT },
    { gBattleAnimSpritePalette_288, ANIM_TAG_BLUE_RING_2 },
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
extern u8 gBattlerSpriteIds[];
extern u8 gBattlerAttacker;
extern u8 gBattlerTarget;

// sBattleAnimScriptPtr is a pointer to the next set of battle script commands.
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
EWRAM_DATA u8 gBattleAnimAttacker = 0;
EWRAM_DATA u8 gBattleAnimTarget = 0;
EWRAM_DATA u16 gAnimSpeciesByBanks[4] = {0};
EWRAM_DATA u8 gUnknown_0202F7D2 = 0; // some global pan variable

u16 gSoundAnimFramesToWait;
s16 gBattleAnimArgs[ANIM_ARGS_COUNT];
u16 gAnimSpriteIndexArray[ANIM_SPRITE_INDEX_COUNT];

extern struct MusicPlayerInfo gMPlayInfo_BGM;
extern struct MusicPlayerInfo gMPlayInfo_SE1;
extern struct MusicPlayerInfo gMPlayInfo_SE2;

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
    gBattleAnimAttacker = 0;
    gBattleAnimTarget = 0;
    gUnknown_0202F7D2 = 0;
}

void DoMoveAnim(u16 move)
{
    gBattleAnimAttacker = gBattlerAttacker;
    gBattleAnimTarget = gBattlerTarget;
    LaunchBattleAnimation(gBattleAnims_Moves, move, TRUE);
}

void LaunchBattleAnimation(const u8 *const moveAnims[], u16 move, u8 isMoveAnim)
{
    s32 i;

    if (!IsContest())
    {
        UpdateBattlerSpritePriorities();
        UpdateOamPriorityInAllHealthboxes(0);
        for (i = 0; i < 4; i++)
        {
            if (GetBattlerSide(i) != B_SIDE_PLAYER)
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
                m4aMPlayVolumeControl(&gMPlayInfo_BGM, 0xFFFF, 128);
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

// Loads sprite graphics used in a move into memory.
// arg 0: gfx ANIM_TAG
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

// Frees sprite graphics from memory when move animation no longer needs them.
// arg0: gfx ANIM_TAG
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

// Creates a sprite from the given sprite template.
// arg0: SpriteTemplate
// arg1: s16[] gBattleAnimArgs
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

        subpriority = GetBattlerSubpriority(gBattleAnimTarget) + (s8)(argVar);
    }
    else
    {
        if (argVar >= 0x40)
            argVar -= 0x40;
        else
            argVar *= -1;

        subpriority = GetBattlerSubpriority(gBattleAnimAttacker) + (s8)(argVar);
    }

    if (subpriority < 3)
        subpriority = 3;

    CreateSpriteAndAnimate(template, GetBattlerSpriteCoord(gBattleAnimTarget, 2), GetBattlerSpriteCoord(gBattleAnimTarget, 3), subpriority);
    gAnimVisualTaskCount++;
}

// Initializes an animation task.
// arg0: AnimTask function
// arg1: s16[] arguments
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

// Creates a visual delay.
// arg0: number of frames to wait.
static void ScriptCmd_delay(void)
{
    sBattleAnimScriptPtr++;
    gAnimFramesToWait = T1_READ_8(sBattleAnimScriptPtr);
    if (gAnimFramesToWait == 0)
        gAnimFramesToWait = -1;
    sBattleAnimScriptPtr++;
    gAnimScriptCallback = WaitAnimFrameCount;
}

// Wait for visual tasks to finish.
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

// Marks the end of an animation. Finishes the anims, tasks, and sound effects.
// started during an animaiton.
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
            m4aMPlayStop(&gMPlayInfo_SE1);
            m4aMPlayStop(&gMPlayInfo_SE2);
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
        m4aMPlayVolumeControl(&gMPlayInfo_BGM, 0xFFFF, 256);
        if (!IsContest())
        {
            UpdateBattlerSpritePriorities();
            UpdateOamPriorityInAllHealthboxes(1);
        }
        gAnimScriptActive = FALSE;
    }
}

// Plays a sound effect.
// arg0: sound effect ID
static void ScriptCmd_playse(void)
{
    sBattleAnimScriptPtr++;
    PlaySE(T1_READ_16(sBattleAnimScriptPtr));
    sBattleAnimScriptPtr += 2;
}

// 
// arg0: battler
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
    if (animBank == ANIM_BATTLER_ATTACKER)
        animBank = ANIM_BATTLER_ATK_PARTNER;
    else if (animBank == ANIM_BATTLER_TARGET)
        animBank = ANIM_BATTLER_DEF_PARTNER;

    if (animBank == ANIM_BATTLER_ATTACKER || animBank == ANIM_BATTLER_ATK_PARTNER)
        bank = gBattleAnimAttacker;
    else
        bank = gBattleAnimTarget;

    if (IsAnimBankSpriteVisible(bank))
    {
        identity = GetBattlerPosition(bank);
        identity += 0xFF;
        if (identity <= 1 || IsContest())
            toBG_2 = 0;
        else
            toBG_2 = 1;

        MoveBattlerSpriteToBG(bank, toBG_2);
        spriteId = gBattlerSpriteIds[bank];
        taskId = CreateTask(task_pA_ma0A_obj_to_bg_pal, 10);
        gTasks[taskId].data[0] = spriteId;
        gTasks[taskId].data[1] = gSprites[spriteId].x + gSprites[spriteId].x2;
        gTasks[taskId].data[2] = gSprites[spriteId].y + gSprites[spriteId].y2;
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
    if (animBank >= ANIM_BATTLER_ATK_PARTNER && IsAnimBankSpriteVisible(bank))
    {
        identity = GetBattlerPosition(bank);
        identity += 0xFF;
        if (identity <= 1 || IsContest())
            toBG_2 = 0;
        else
            toBG_2 = 1;
        MoveBattlerSpriteToBG(bank, toBG_2);
        spriteId = gBattlerSpriteIds[bank];
        taskId = CreateTask(task_pA_ma0A_obj_to_bg_pal, 10);
        gTasks[taskId].data[0] = spriteId;
        gTasks[taskId].data[1] = gSprites[spriteId].x + gSprites[spriteId].x2;
        gTasks[taskId].data[2] = gSprites[spriteId].y + gSprites[spriteId].y2;
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
        if (bank == gBattleAnimAttacker)
            return TRUE;
        else
            return FALSE;
    }
    if (!IsBankSpritePresent(bank))
        return FALSE;
    if (IsContest())
        return TRUE; // this line wont ever be reached.
    if (!gBattleSpriteInfo[bank].invisible || !gSprites[gBattlerSpriteIds[bank]].invisible)
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

        spriteId = gBattlerSpriteIds[bank];
        gBattle_BG1_X = -(gSprites[spriteId].x + gSprites[spriteId].x2) + 32;
        if (IsContest() && IsSpeciesNotUnown(EWRAM_19348[0]) != 0)
            gBattle_BG1_X--;
        gBattle_BG1_Y = -(gSprites[spriteId].y + gSprites[spriteId].y2) + 32;
        gSprites[gBattlerSpriteIds[bank]].invisible = TRUE;

        REG_BG1HOFS = gBattle_BG1_X;
        REG_BG1VOFS = gBattle_BG1_Y;

        LoadPalette(gPlttBufferUnfaded + 0x100 + bank * 16, s.unk8 * 16, 32);
        DmaCopy32Defvars(3, gPlttBufferUnfaded + 0x100 + bank * 16, (u16 *)PLTT + s.unk8 * 16, 32);

        if (IsContest())
            r2 = 0;
        else
            r2 = GetBattlerPosition(bank);
        sub_80E4EF8(0, 0, r2, s.unk8, (u32)s.unk0, (((s32)s.unk4 - VRAM) / 2048), REG_BG1CNT_BITFIELD.charBaseBlock);
        if (IsContest())
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

        spriteId = gBattlerSpriteIds[bank];
        gBattle_BG2_X = -(gSprites[spriteId].x + gSprites[spriteId].x2) + 32;
        gBattle_BG2_Y = -(gSprites[spriteId].y + gSprites[spriteId].y2) + 32;
        gSprites[gBattlerSpriteIds[bank]].invisible = TRUE;

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
    if (a == 0 || IsContest())
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
    x = gTasks[taskId].data[1] - (gSprites[spriteId].x + gSprites[spriteId].x2);
    y = gTasks[taskId].data[2] - (gSprites[spriteId].y + gSprites[spriteId].y2);

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

    if (animBankId == ANIM_BATTLER_ATTACKER)
        animBankId = ANIM_BATTLER_ATK_PARTNER;
    else if (animBankId == ANIM_BATTLER_TARGET)
        animBankId = ANIM_BATTLER_DEF_PARTNER;

    if (animBankId == ANIM_BATTLER_ATTACKER || animBankId == ANIM_BATTLER_ATK_PARTNER)
        bank = gBattleAnimAttacker;
    else
        bank = gBattleAnimTarget;

    if (gMonAnimTaskIdArray[0] != 0xFF)
        gSprites[gBattlerSpriteIds[bank]].invisible = FALSE;
    if (animBankId > 1 && gMonAnimTaskIdArray[1] != 0xFF)
        gSprites[gBattlerSpriteIds[bank ^ 2]].invisible = FALSE;
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
        if (identity <= 1 || IsContest())
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

    if (animBankId == ANIM_BATTLER_ATTACKER)
        animBankId = ANIM_BATTLER_ATK_PARTNER;
    else if (animBankId == ANIM_BATTLER_TARGET)
        animBankId = ANIM_BATTLER_DEF_PARTNER;

    if (animBankId == ANIM_BATTLER_ATTACKER || animBankId == ANIM_BATTLER_ATK_PARTNER)
        bank = gBattleAnimAttacker;
    else
        bank = gBattleAnimTarget;

    if (IsAnimBankSpriteVisible(bank))
    {
        identity = GetBattlerPosition(bank);
        identity += 0xFF;
        if (identity <= 1 || IsContest())
            r1 = 0;
        else
            r1 = 1;
        MoveBattlerSpriteToBG(bank, r1);
        gSprites[gBattlerSpriteIds[bank]].invisible = FALSE;
    }

    bank ^= 2;
    if (animBankId > ANIM_BATTLER_TARGET && IsAnimBankSpriteVisible(bank))
    {
        identity = GetBattlerPosition(bank);
        identity += 0xFF;
        if (identity <= 1 || IsContest())
            r1 = 0;
        else
            r1 = 1;
        MoveBattlerSpriteToBG(bank, r1);
        gSprites[gBattlerSpriteIds[bank]].invisible = FALSE;
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

    if (animBankId == ANIM_BATTLER_ATTACKER)
        animBankId = ANIM_BATTLER_ATK_PARTNER;
    else if (animBankId == ANIM_BATTLER_TARGET)
        animBankId = ANIM_BATTLER_DEF_PARTNER;

    if (animBankId == ANIM_BATTLER_ATTACKER || animBankId == ANIM_BATTLER_ATK_PARTNER)
        bank = gBattleAnimAttacker;
    else
        bank = gBattleAnimTarget;

    if (IsAnimBankSpriteVisible(bank))
        gSprites[gBattlerSpriteIds[bank]].invisible = FALSE;
    if (animBankId > 1 && IsAnimBankSpriteVisible(bank ^ 2))
        gSprites[gBattlerSpriteIds[bank ^ 2]].invisible = FALSE;
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
        if (identity <= 1 || IsContest())
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

// Sets transparency of sprite.
// arg0: sprite alpha value
// arg1: background alpha value
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

// Turns off alpha blending / semi transparency.
static void ScriptCmd_blendoff(void)
{
    sBattleAnimScriptPtr++;
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
}

// Calls another animation by resetting sBattleAnimScriptPtr.
// arg0: Function
static void ScriptCmd_call(void)
{
    sBattleAnimScriptPtr++;
    gBattleAnimScriptRetAddr = sBattleAnimScriptPtr + 4;
    sBattleAnimScriptPtr = T2_READ_PTR(sBattleAnimScriptPtr);
}

// Returns to the function that called this.
static void ScriptCmd_return(void)
{
    sBattleAnimScriptPtr = gBattleAnimScriptRetAddr;
}

// Sets a value into gBattleAnimArgs[8]
// arg0: index / arg number
// arg1: value to set
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

// Flips between the first and second step of a move with two turns.
// arg0: first turn animation
// arg1: second turn animation
static void ScriptCmd_choosetwoturnanim(void)
{
    sBattleAnimScriptPtr++;
    if (gAnimMoveTurn & 1)
        sBattleAnimScriptPtr += 4;
    sBattleAnimScriptPtr = T2_READ_PTR(sBattleAnimScriptPtr);
}

// Jump to specified step of multi turn moves.
// arg0: move turn
// arg1: turn animation
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

// Jump to another animation.
// arg0: new animation
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

// Fades the screen and sets new background image.
// arg0: background ID
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

// Fades to background image based on context of move (contest, battle)
// arg0: opponent background image ID
// arg1: player background image ID
// arg2: contest background image ID
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
    else if (GetBattlerSide(gBattleAnimTarget) == B_SIDE_PLAYER)
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

// Restores default background image.
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

// Wait for background image fade out to compete.
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

// Wait for background image fade in to compete.
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

// Change background.
// arg0: background image ID
static void ScriptCmd_changebg(void)
{
    sBattleAnimScriptPtr++;
    LoadMoveBg(T1_READ_8(sBattleAnimScriptPtr));
    sBattleAnimScriptPtr++;
}

s8 BattleAnimAdjustPanning(s8 pan)
{
    if (!IsContest() && ewram17810[gBattleAnimAttacker].unk0_4)
    {
        if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
            pan = SOUND_PAN_TARGET;
        else
            pan = SOUND_PAN_ATTACKER_NEG;
    }
    else if (IsContest())
    {
        if (gBattleAnimAttacker != gBattleAnimTarget || gBattleAnimAttacker != 2 || pan != SOUND_PAN_TARGET)
            pan *= -1;
    }
    else if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER)
    {
        if (GetBattlerSide(gBattleAnimTarget) == B_SIDE_PLAYER)
        {
            if (pan == SOUND_PAN_TARGET)
                pan = SOUND_PAN_ATTACKER_NEG;
            else if (pan != SOUND_PAN_ATTACKER_NEG)
                pan *= -1;
        }
    }
    else if (GetBattlerSide(gBattleAnimTarget) == B_SIDE_OPPONENT)
    {
        if (pan == SOUND_PAN_ATTACKER_NEG)
            pan = SOUND_PAN_TARGET;
    }
    else
    {
        pan *= -1;
    }

    if (pan > SOUND_PAN_TARGET)
        pan = SOUND_PAN_TARGET;
    else if (pan < SOUND_PAN_ATTACKER_NEG)
        pan = SOUND_PAN_ATTACKER_NEG;

    return pan;
}

s8 BattleAnimAdjustPanning2(s8 pan)
{
    if (!IsContest() && ewram17810[gBattleAnimAttacker].unk0_4)
    {
        if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
            pan = SOUND_PAN_TARGET;
        else
            pan = SOUND_PAN_ATTACKER;
    }
    else
    {
        if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER || IsContest())
            pan = -pan;
    }
    return pan;
}

s16 sub_8077104(s16 newPan, int oldPan)
{
    s16 var = newPan;

    if (var > SOUND_PAN_TARGET)
        var = SOUND_PAN_TARGET;
    else if (var < SOUND_PAN_ATTACKER_NEG)
        var = SOUND_PAN_ATTACKER_NEG;
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

// Creates a sound task.
// arg0: sound task function
// arg1: s16[] gBattleAnimArgs
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

// Wait for sound effect to end.
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
            m4aMPlayStop(&gMPlayInfo_SE1);
            m4aMPlayStop(&gMPlayInfo_SE2);
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

// Jump to animation based on gBattleAnimArgs[index] value.
// arg0: gBattleAnimArgs[] argument index
// arg1: value
// arg2: animation script
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

// If using move in contest, go to specific animation script.
// arg0: animation script
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
        bank = gBattleAnimTarget;
    else
        bank = gBattleAnimAttacker;

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
    if (GetBattlerSide(gBattleAnimAttacker) != GetBattlerSide(gBattleAnimTarget))
    {
        if (wantedBank != 0)
            bank = gBattleAnimTarget;
        else
            bank = gBattleAnimAttacker;
        bankIdentity = GetBattlerPosition(bank);
        if (!IsContest() && (bankIdentity == 0 || bankIdentity == 3))
        {
            REG_BG1CNT_BITFIELD.priority = 1;
            REG_BG2CNT_BITFIELD.priority = 2;
        }
    }
}

// Sets sprite to be invisible.
// arg0: battler sprite ID
static void ScriptCmd_invisible(void)
{
    u8 spriteId;

    spriteId = GetAnimBattlerSpriteId(T1_READ_8(sBattleAnimScriptPtr + 1));
    if (spriteId != 0xFF)
        gSprites[spriteId].invisible = TRUE;

    sBattleAnimScriptPtr += 2;
}

// Sets aprite to be visible.
// arg0: battler sprite ID
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
     && GetBattlerSide(gBattleAnimAttacker) == GetBattlerSide(gBattleAnimTarget))
    {
        if (wantedBank == 0)
        {
            r4 = GetBattlerPosition_permutated(gBattleAnimAttacker);
            spriteId = GetAnimBattlerSpriteId(0);
        }
        else
        {
            r4 = GetBattlerPosition_permutated(gBattleAnimTarget);
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
     && GetBattlerSide(gBattleAnimAttacker) == GetBattlerSide(gBattleAnimTarget))
    {
        if (wantedBank == 0)
        {
            r4 = GetBattlerPosition_permutated(gBattleAnimAttacker);
            spriteId = GetAnimBattlerSpriteId(0);
        }
        else
        {
            r4 = GetBattlerPosition_permutated(gBattleAnimTarget);
            spriteId = GetAnimBattlerSpriteId(1);
        }
        if (spriteId != 0xFF && r4 == 2)
        {
            gSprites[spriteId].oam.priority = 2;
        }
    }
}

// Cease playing sounds.
static void ScriptCmd_stopsound(void)
{
    m4aMPlayStop(&gMPlayInfo_SE1);
    m4aMPlayStop(&gMPlayInfo_SE2);
    sBattleAnimScriptPtr++;
}
