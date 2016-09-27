#ifndef GUARD_GLOBAL_H
#define GUARD_GLOBAL_H

#include "gba/gba.h"

#ifndef REVISION
#define REVISION 0
#endif

// Prevent cross-jump optimization.
#define BLOCK_CROSS_JUMP asm("");

#define ARRAY_COUNT(array) (sizeof(array) / sizeof((array)[0]))

#define POKEMON_NAME_LENGTH 10
#define OT_NAME_LENGTH 7

extern u8 gStringVar1[];
extern u8 gStringVar2[];
extern u8 gStringVar3[];
extern u8 gStringVar4[];

enum
{
    VERSION_SAPPHIRE = 1,
    VERSION_RUBY = 2,
};

enum
{
    MALE,
    FEMALE
};

enum
{
    OPTIONS_BUTTON_MODE_NORMAL,
    OPTIONS_BUTTON_MODE_LR,
    OPTIONS_BUTTON_MODE_L_EQUALS_A
};

enum
{
    OPTIONS_TEXT_SPEED_SLOW,
    OPTIONS_TEXT_SPEED_MID,
    OPTIONS_TEXT_SPEED_FAST
};

enum
{
    OPTIONS_SOUND_MONO,
    OPTIONS_SOUND_STEREO
};

enum
{
    OPTIONS_BATTLE_STYLE_SHIFT,
    OPTIONS_BATTLE_STYLE_SET
};

struct Coords16
{
    s16 x;
    s16 y;
};

struct UCoords16
{
    u16 x;
    u16 y;
};

struct SecretBaseRecord
{
    u8 sbr_field_0; // ID?
    u8 sbr_field_1_0:4;
    u8 gender:1;
    u8 sbr_field_1_5:1;
    u8 sbr_field_2[7]; // 0xFF bytes?
    u8 trainerId[4]; // byte 0 is used for determining trainer class
    u16 sbr_field_e;
    u8 sbr_field_10;
    u8 sbr_field_11;
    u8 decorations[16];
    u8 sbr_field_22[16];
    u32 partyPersonality[6];
    u16 partyMoves[6 * 4];
    u16 partySpecies[6];
    u16 partyHeldItems[6];
    u8 partyLevels[6];
    u8 partyEVs[6];
};

#include "game_stat.h"
#include "fieldmap.h"

struct WarpData
{
    s8 mapGroup;
    s8 mapNum;
    u8 warpId;
    s16 x, y;
};

struct RamScriptData
{
    u8 magic;
    u8 mapGroup;
    u8 mapNum;
    u8 objectId;
    u8 script[995];
};

struct RamScript
{
    u32 checksum;
    struct RamScriptData data;
};

struct SB1_2EFC_Struct
{
    u8 unknown[0x20];
};

struct SaveBlock1
{
    struct Coords16 pos;
    struct WarpData location;
    u8 filler_C[0x484];
    u32 money;
    u16 coins;
    u16 registeredItem; // registered for use with SELECT button
    u8 filler_498[0x788];
    struct MapObjectTemplate mapObjectTemplates[64];
    u8 filler_1220[0x320];
    u32 gameStats[NUM_GAME_STATS];
    u8 filler_1608[0x18F4];
    struct SB1_2EFC_Struct sb1_2EFC_struct[5];
    u8 filler_2F9C[0x6F4];
    struct RamScript ramScript;
    u8 filler_3A7C[0x44];
};

extern struct SaveBlock1 gSaveBlock1;

struct Time
{
    s16 days;
    s8 hours;
    s8 minutes;
    s8 seconds;
};

struct Pokedex
{
    u8 order;
    u8 unknown1;
    u8 nationalMagic; // must equal 0xDA in order to have National mode
    u8 unknown2;
    u32 unownPersonality; // set when you first see Unown
    u32 spindaPersonality; // set when you first see Spinda
    u32 unknown3;
    u8 owned[52];
    u8 seen[52];
};

struct SaveBlock2
{
    u8 playerName[8];
    u8 playerGender; // MALE, FEMALE
    u8 sb2_field_9;
    u8 playerTrainerId[4];
    u16 playTimeHours;
    u8 playTimeMinutes;
    u8 playTimeSeconds;
    u8 playTimeVBlanks;
    u8 optionsButtonMode;  // OPTIONS_BUTTON_MODE_[NORMAL/LR/L_EQUALS_A]
    u8 optionsTextSpeed:3; // OPTIONS_TEXT_SPEED_[SLOW/MID/FAST]
    u8 optionsWindowFrameType:5; // Specifies one of the 20 decorative borders for text boxes
    u8 optionsSound:1; // OPTIONS_SOUND_[MONO/STEREO]
    u8 optionsBattleStyle:1; // OPTIONS_BATTLE_STYLE_[SHIFT/SET]
    u8 optionsBattleSceneOff:1; // whether battle animations are disabled
    u8 regionMapZoom:1; // whether the map is zoomed in
    struct Pokedex pokedex;
    u8 filler_90[0x8];
    struct Time localTimeOffset;
    struct Time lastBerryTreeUpdate;
    u8 filler_A8[0x7E8];
};

extern struct SaveBlock2 gSaveBlock2;

#endif // GUARD_GLOBAL_H
