#include "global.h"
#include "constants/items.h"
#include "constants/item_effects.h"
#include "constants/moves.h"
#include "constants/songs.h"
#include "constants/species.h"
#include "party_menu.h"
#include "player_pc.h"
#include "battle.h"
#include "battle_interface.h"
#include "battle_party_menu.h"
#include "choose_party.h"
#include "data2.h"
#include "decompress.h"
#include "event_data.h"
#include "evolution_scene.h"
#include "item.h"
#include "item_use.h"
#include "item_menu.h"
#include "link.h"
#include "mail_data.h"
#include "main.h"
#include "menu.h"
#include "menu_helpers.h"
#include "palette.h"
#include "pokemon.h"
#include "pokemon_icon.h"
#include "pokemon_item_effect.h"
#include "pokemon_menu.h"
#include "pokemon_summary_screen.h"
#include "rom_8077ABC.h"
#include "rom_8094928.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "strings.h"
#include "task.h"
#include "scanline_effect.h"
#include "util.h"
#include "script_pokemon_80F9.h"
#include "ewram.h"

struct Coords8
{
    u8 x;
    u8 y;
};

struct PartyMenuWindowCoords
{
    u8 left;
    u8 top;
    u8 right;
    u8 bottom;
};

struct PartyMonTextSettingsStruct
{
    u8 xOffset;
    u8 yOffset;
    const u16 *oamSettings;
};

struct PartyMenuHandlersStruct
{
    /*0x0*/TaskFunc menuHandler;
    /*0x4*/bool8 (*menuSetup)(void);
    /*0x8*/u8 initialPromptTextId; // element in PartyMenuPromptTexts
};

static void nullsub_12(u8 monIndex, struct Pokemon *pokemon);
static void TryPrintPartyMenuMonNickname(u8 monIndex, struct Pokemon *pokemon);
static void PartyMenuTryPrintHP(u8 monIndex, struct Pokemon *pokemon);
static void sub_806D05C(u8 taskId);
static void sub_806D15C(u8 taskId);
static void sub_806D198(u8 taskId);
static void Task_PartyMenuPrintRun(u8 taskId);
static void sub_8070D90(u8 taskId);
static void sub_806D5B8(u8 taskId);
static void sub_806D014(u8 taskId);
static void sub_806D118(u8 taskId);
static void CB2_InitPartyMenu(void);
static void ReDrawPartyMonBackgrounds(void);
static void sub_806BA94(s16 a, u16 b, u8 c, u8 d);
static void sub_806B9A4(s16 a, u16 b, u8 c);
static void sub_806CA18(u8 taskId, u8 b);
static void ChangeDoubleBattlePartyMenuSelection(u8 spriteId, u8 menuIndex, s8 directionPressed);
static void ChangeDefaultPartyMenuSelection(u8 spriteId, u8 menuIndex, s8 directionPressed);
void ChangeLinkDoubleBattlePartyMenuSelection(u8 spriteId, u8 menuIndex, s8 directionPressed);
static void UpdateMonIconFrame_806DA0C(struct Sprite *sprite);
static void UpdateMonIconFrame_806DA38(struct Sprite *sprite);
static void UpdateMonIconFrame_806DA44(u8 taskId, u8 monIndex, u8 c);
static u8 sub_806CA00(u8 taskId);
static void SpriteCB_sub_806D37C(struct Sprite *sprite);
static u8 GetMonIconSpriteId(u8 taskId, u8 monIndex);
void SpriteCB_UpdateHeldItemIconPosition(struct Sprite *sprite);
static void ItemUseMoveMenu_HandleMoveSelection(u8 taskId);
static void ItemUseMoveMenu_HandleCancel(u8 taskId);
static bool8 SetupDefaultPartyMenu(void);
/*static*/ void sub_806B4A8(void);
/*static*/ void VBlankCB_PartyMenu(void);
/*static*/ bool8 LoadPartyMenuGraphics(u8 a);
static void sub_806BF24(const u8 *a, u8 monIndex, u8 c, u8 d);
static void sub_806BB9C(u8 a);
static void sub_806BBEC(u8 a);

void (*gPokemonItemUseCallback)(u8 taskId, u16 itemId, TaskFunc taskFunc);

extern u16 Random();

EWRAM_DATA u8 gUnknown_0202E8F4 = 0;
EWRAM_DATA u8 gUnknown_0202E8F5 = 0;
EWRAM_DATA u8 gPartyMenuMessage_IsPrinting = 0;
EWRAM_DATA u16 gUnknown_0202E8F8 = 0;
EWRAM_DATA u8 gPartyMenuType = 0;

const u16 TMHMMoves[] =
{
    MOVE_FOCUS_PUNCH,
    MOVE_DRAGON_CLAW,
    MOVE_WATER_PULSE,
    MOVE_CALM_MIND,
    MOVE_ROAR,
    MOVE_TOXIC,
    MOVE_HAIL,
    MOVE_BULK_UP,
    MOVE_BULLET_SEED,
    MOVE_HIDDEN_POWER,
    MOVE_SUNNY_DAY,
    MOVE_TAUNT,
    MOVE_ICE_BEAM,
    MOVE_BLIZZARD,
    MOVE_HYPER_BEAM,
    MOVE_LIGHT_SCREEN,
    MOVE_PROTECT,
    MOVE_RAIN_DANCE,
    MOVE_GIGA_DRAIN,
    MOVE_SAFEGUARD,
    MOVE_FRUSTRATION,
    MOVE_SOLAR_BEAM,
    MOVE_IRON_TAIL,
    MOVE_THUNDERBOLT,
    MOVE_THUNDER,
    MOVE_EARTHQUAKE,
    MOVE_RETURN,
    MOVE_DIG,
    MOVE_PSYCHIC,
    MOVE_SHADOW_BALL,
    MOVE_BRICK_BREAK,
    MOVE_DOUBLE_TEAM,
    MOVE_REFLECT,
    MOVE_SHOCK_WAVE,
    MOVE_FLAMETHROWER,
    MOVE_SLUDGE_BOMB,
    MOVE_SANDSTORM,
    MOVE_FIRE_BLAST,
    MOVE_ROCK_TOMB,
    MOVE_AERIAL_ACE,
    MOVE_TORMENT,
    MOVE_FACADE,
    MOVE_SECRET_POWER,
    MOVE_REST,
    MOVE_ATTRACT,
    MOVE_THIEF,
    MOVE_STEEL_WING,
    MOVE_SKILL_SWAP,
    MOVE_SNATCH,
    MOVE_OVERHEAT,
    MOVE_CUT,
    MOVE_FLY,
    MOVE_SURF,
    MOVE_STRENGTH,
    MOVE_FLASH,
    MOVE_ROCK_SMASH,
    MOVE_WATERFALL,
    MOVE_DIVE,
};

//FIXME

u8 *const gTileBufferPtr = gTileBuffer;

static const u8 MenuGfx_HoldIcons[] = INCBIN_U8("graphics/interface/hold_icons.4bpp");
static const u16 MenuPal_HoldIcons[] = INCBIN_U16("graphics/interface/hold_icons.gbapal");

static const struct SpriteSheet HeldItemsSpriteSheet = {
    MenuGfx_HoldIcons,
    sizeof MenuGfx_HoldIcons,
    0xd750
};

static const struct SpritePalette HeldItemsPalette = {
    MenuPal_HoldIcons,
    0xd750
};

static const struct OamData gOamData_83765EC =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 0,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd gSpriteAnim_83765F4[] = {
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END
};

static const union AnimCmd gSpriteAnim_83765FC[] = {
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_END
};

static const union AnimCmd *const gSpriteAnimTable_8376604[] = {
    gSpriteAnim_83765F4,
    gSpriteAnim_83765FC,
};

static const struct SpriteTemplate gSpriteTemplate_837660C = {
    55120,
    55120,
    &gOamData_83765EC,
    gSpriteAnimTable_8376604,
    NULL,
    gDummySpriteAffineAnimTable,
    SpriteCB_UpdateHeldItemIconPosition
};

// Texts that can be displayed in the bottom of the party menu.
static const u8 *const PartyMenuPromptTexts[] = {
    OtherText_ChoosePoke,
    OtherText_MovePokeTo,
    OtherText_TeachWhat,
    OtherText_UseWhat,
    OtherText_GiveWhat,
    OtherText_DoWhat,
    OtherText_NothingToCut,
    OtherText_CantSurf,
    OtherText_AlreadySurfing,
    OtherText_CantUseThatHere,
    OtherText_RestoreWhatMove,
    OtherText_BoostPP,
    gOtherText_CancelWithTerminator,
    OtherText_DoWhatWithItem,
    OtherText_NoPokeForBattle,
    OtherText_ChoosePoke2,
    OtherText_NotEnoughHP,
    OtherText_ThreePokeNeeded,
    OtherText_PokeCantBeSame,
    OtherText_NoIdenticalHoldItems,
    OtherText_TeachWhichPoke,
};

static const struct Coords8 gUnknown_08376678[8][6] = {
    {{16, 40}, {104, 18}, {104, 42}, {104, 66}, {104, 90}, {104, 114}}, // PARTY_MENU_TYPE_STANDARD
    {{16, 24}, { 16, 80}, {104, 18}, {104, 50}, {104, 82}, {104, 114}}, // PARTY_MENU_TYPE_BATTLE
    {{16, 24}, { 16, 80}, {104, 26}, {104, 50}, {104, 82}, {104, 106}}, // PARTY_MENU_TYPE_CONTEST
    {{16, 24}, {104, 26}, {104, 50}, { 16, 80}, {104, 82}, {104, 106}}, // PARTY_MENU_TYPE_IN_GAME_TRADE
    {{ 5,  4}, { 16,  1}, { 16,  4}, { 16,  7}, { 16, 10}, { 16,  13}}, // PARTY_MENU_TYPE_BATTLE_TOWER
    {{ 5,  2}, {  5,  9}, { 16,  1}, { 16,  5}, { 16,  9}, { 16,  13}}, // PARTY_MENU_TYPE_LINK_MULTI_BATTLE
    {{ 5,  2}, {  5,  9}, { 16,  2}, { 16,  5}, { 16,  9}, { 16,  12}}, // PARTY_MENU_TYPE_DAYCARE
    {{ 5,  2}, { 16,  2}, { 16,  5}, {  5,  9}, { 16,  9}, { 16,  12}}, // PARTY_MENU_TYPE_MOVE_TUTOR
};

static const struct Coords8 gUnknown_08376738[12][6] = {
    {{6,  5}, {17,  2}, {17,  5}, {17,  8}, {17, 11}, {17, 14}},
    {{6,  3}, { 6, 10}, {17,  2}, {17,  6}, {17, 10}, {17, 14}},
    {{6,  3}, { 6, 10}, {17,  3}, {17,  6}, {17, 10}, {17, 13}},
    {{6,  3}, {17,  3}, {17,  6}, { 6, 10}, {17, 10}, {17, 13}},
    {{3,  7}, {22,  2}, {22,  5}, {22,  8}, {22, 11}, {22, 14}},
    {{3,  5}, { 3, 12}, {22,  2}, {22,  6}, {22, 10}, {22, 14}},
    {{3,  5}, { 3, 12}, {22,  3}, {22,  6}, {22, 10}, {22, 13}},
    {{3,  5}, {22,  3}, {22,  6}, { 3, 12}, {22, 10}, {22, 13}},
    {{7,  7}, {26,  2}, {26,  5}, {26,  8}, {26, 11}, {26, 14}},
    {{7,  5}, { 7, 12}, {26,  2}, {26,  6}, {26, 10}, {26, 14}},
    {{7,  5}, { 7, 12}, {26,  3}, {26,  6}, {26, 10}, {26, 13}},
    {{7,  5}, {26,  3}, {26,  6}, { 7, 12}, {26, 10}, {26, 13}},
};

static u16 *const gUnknown_08376858[4][6] = {
    {(u16*)(BG_VRAM + 0xF1C8), (u16*)(BG_VRAM + 0xF0AE), (u16*)(BG_VRAM + 0xF16E), (u16*)(BG_VRAM + 0xF22E), (u16*)(BG_VRAM + 0xF2EE), (u16*)(BG_VRAM + 0xF3AE)}, // PARTY_MENU_STANDARD
    {(u16*)(BG_VRAM + 0xF148), (u16*)(BG_VRAM + 0xF308), (u16*)(BG_VRAM + 0xF0AE), (u16*)(BG_VRAM + 0xF1AE), (u16*)(BG_VRAM + 0xF2AE), (u16*)(BG_VRAM + 0xF3AE)}, // PARTY_MENU_LAYOUT_DOUBLE_BATTLE
    {(u16*)(BG_VRAM + 0xF148), (u16*)(BG_VRAM + 0xF308), (u16*)(BG_VRAM + 0xF0EE), (u16*)(BG_VRAM + 0xF1AE), (u16*)(BG_VRAM + 0xF2AE), (u16*)(BG_VRAM + 0xF36E)}, // PARTY_MENU_LAYOUT_LINK_DOUBLE_BATTLE
    {(u16*)(BG_VRAM + 0xF148), (u16*)(BG_VRAM + 0xF0EE), (u16*)(BG_VRAM + 0xF1AE), (u16*)(BG_VRAM + 0xF308), (u16*)(BG_VRAM + 0xF2AE), (u16*)(BG_VRAM + 0xF36E)}, // PARTY_MENU_LAYOUT_MULTI_BATTLE
};

static const struct Coords8 gUnknown_083768B8[3][8] = {
    {{8,  44}, {92,  22}, {92,  46}, {92,  70}, {92,  94}, {92, 118}, {196, 136}, {196, 152}}, // PARTY_MENU_LAYOUT_STANDARD
    {{8,  28}, { 8,  84}, {92,  22}, {92,  54}, {92,  86}, {92, 118}, {196, 136}, {196, 152}}, // PARTY_MENU_LAYOUT_DOUBLE_BATTLE
    {{8,  28}, { 8,  84}, {92,  30}, {92,  54}, {92,  86}, {92, 110}, {196, 136}, {196, 152}}, // PARTY_MENU_LAYOUT_LINK_DOUBLE_BATTLE
};

static u16 *const gUnknown_08376918[2][PARTY_SIZE] = {
    {(u16*)(BG_VRAM + 0xF1C6), (u16*)(BG_VRAM + 0xF06C), (u16*)(BG_VRAM + 0xF12C), (u16*)(BG_VRAM + 0xF1EC), (u16*)(BG_VRAM + 0xF2AC), (u16*)(BG_VRAM + 0xF36C)},
    {(u16*)(BG_VRAM + 0xF148), (u16*)(BG_VRAM + 0xF308), (u16*)(BG_VRAM + 0xF0AE), (u16*)(BG_VRAM + 0xF1AE), (u16*)(BG_VRAM + 0xF2AE), (u16*)(BG_VRAM + 0xF3AE)},
};

static const struct PartyMenuWindowCoords gUnknown_08376948[2][6] = {
    {{2, 4, 10, 9}, {16, 1, 29,  3}, {16, 4, 29, 6}, {16, 7, 29, 9}, {16, 10, 29, 12}, {16, 13, 29, 15}},
    {{2, 2, 10, 7}, { 2, 9, 10, 14}, {16, 1, 29, 3}, {16, 5, 29, 7}, {16,  9, 29, 11}, {16, 13, 29, 15}},
};

static const struct PartyMenuWindowCoords gUnknown_08376978[2][6] = {
    {{2, 7, 10,  9}, {21, 1, 29,  3}, {21, 4, 29,  6}, {21, 7, 29, 9}, {21, 10, 29, 12}, {21, 13, 29, 15}},
    {{2, 2, 10,  7}, { 2, 9, 10, 14}, {16, 1, 29,  3}, {16, 5, 29, 7}, {16,  9, 29, 11}, {16, 13, 29, 15}},
};

// This is actually a 2x6x2 array, but the code reads it as a flat array.
static const u8 gUnknown_083769A8[] = {
    0, 3,   11, 1,   11, 4,    11, 7,    11, 10,    11, 13,
    0, 1,    0, 8,   11, 1,    11, 5,    11,  9,    11, 13, // Double battle
};

// This is actually a 2x6x2 array, but the code reads it as a flat array.
//FIXME: sub_806B908() accesses this data via gUnknown_083769A8 (directly above this). This means these
// two arrays might be a struct, rather than separate arrays.
static const u8 gUnknown_083769C0[] = {
    0, 1,    0, 8,   11, 2,    11, 5,    11, 9,    11, 12,
    0, 1,    0, 8,   11, 2,    11, 5,    11, 9,    11, 12, // Double battle
};

static const u8 gUnknown_083769D8[] = {
    0x24,0x25,0x25,0x25,0x25,0x25,0x25,0x25,0x25,0x25,0x27,
    0x34,0x35,0x35,0x35,0x35,0x35,0x35,0x35,0x35,0x35,0x37,
    0x34,0x35,0x35,0x35,0x35,0x35,0x35,0x35,0x35,0x35,0x37,
    0x34,0x35,0x35,0x35,0x35,0x35,0x35,0x35,0x35,0x35,0x37,
    0x44,0x45,0x45,0x45,0x45,0x45,0x45,0x45,0x45,0x45,0x47,
    0x44,0x45,0x45,0x45,0x45,0x45,0x45,0x45,0x45,0x45,0x47,
    0x54,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x57,
};

static const u8 gUnknown_08376A25[] = {
    0x50,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x53,
    0x60,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x63,
    0x70,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x73,
};

static const u8 gUnknown_08376A5E[] = {
    0x20,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x23,
    0x30,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x33,
    0x40,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x43,
};

static const u8 gUnusedData_08376A97[] = {
    0x0C,0x0D,0x0E,0x0F,0x00,0x01,0x02,0x03,0x04,0x05,0x0F,
    0x10,0x11,0x12,0x13,0x14,0x15,0x0F,0x06,0x05,0x01,0x07,
    0x08,0x09,0x0F,0x16,0x15,0x11,0x17,0x18,0x19,0x0F,0x09,
    0x0A,0x0B,0x05,0x0C,0x0F,0x0F,0x19,0x1A,0x1B,0x15,0x1C,
    0x0F,0x0F,0x0D,0x0B,0x05,0x0C,0x0F,0x0F,0x0F,0x1D,0x1B,
    0x15,0x1C,0x0F,0x0F,0x0F,0x06,0x05,0x0B,0x05,0x0C,0x0F,
    0x0F,0x16,0x15,0x1B,0x15,0x1C,0x0F,0x0F,0x0F,0x0F,0x20,
    0x0C,0x09,0x0F,0x0F,0x0F,0x1F,0x30,0x1C,0x19,0x0F,0x0F,
    0x0F,0x25,0x0F,0x22,0x24,0x0F,0x0F,0x0F,0x35,0x41,0x32,
    0x34,0x0F,0x0F,0x0F,0x26,0x0F,0x23,0x0E,0x0F,0x0F,0x0F,
    0x36,0x43,0x33,0x1E,0x0F,0x0F,0x27,0x28,0x29,0x03,0x2A,
    0x0F,0x0F,0x37,0x38,0x39,0x13,0x3A,0x0F,0x0F,0x27,0x28,
    0x29,0x03,0x04,0x05,0x0F,0x37,0x38,0x39,0x13,0x14,0x15,
    0x0F,0x2B,0x2C,0x02,0x28,0x29,0x2D,0x21,0x3B,0x3C,0x12,
    0x38,0x39,0x3D,0x31,0x2B,0x2C,0x02,0x28,0x29,0x08,0x09,
    0x3B,0x3C,0x12,0x38,0x39,0x18,0x19,0x2E,0x2F,0x2B,0x2C,
    0x02,0x27,0x2D,0x3E,0x3F,0x3B,0x3C,0x12,0x45,0x3D,
};

static const TaskFunc gUnknown_08376B54[] = {
    ItemUseMoveMenu_HandleMoveSelection,
    ItemUseMoveMenu_HandleCancel,
};

#define PartyMonOAMSettings(x, y, palette, shape, size, priority, tileOffset) \
    ((shape)   << 14) | (y),                                                  \
    ((size)    << 14) | (x),                                                  \
    ((palette) << 12) | ((priority) << 10) | (tileOffset)

static const u16 PartyMonOAMSettings_LeftColumn[] = {
    PartyMonOAMSettings(24,  0, 15, ST_OAM_H_RECTANGLE, 1, 1,  0),
    PartyMonOAMSettings(56,  0, 15, ST_OAM_H_RECTANGLE, 1, 1,  4),
    PartyMonOAMSettings(24,  8, 15, ST_OAM_H_RECTANGLE, 1, 1,  8),
    PartyMonOAMSettings(56,  8, 15, ST_OAM_H_RECTANGLE, 1, 1, 12),
    PartyMonOAMSettings(32, 16, 15, ST_OAM_H_RECTANGLE, 1, 1, 16),
    PartyMonOAMSettings(37, 32, 15, ST_OAM_H_RECTANGLE, 1, 1, 24),
    PartyMonOAMSettings(69, 32, 15, ST_OAM_H_RECTANGLE, 1, 1, 28),
    0xFFFF,
};

static const u16 PartyMonOAMSettings_RightColumn[] = {
    PartyMonOAMSettings( 24,  0, 15, ST_OAM_H_RECTANGLE, 1, 1,  0),
    PartyMonOAMSettings( 56,  0, 15, ST_OAM_H_RECTANGLE, 1, 1,  4),
    PartyMonOAMSettings( 24,  8, 15, ST_OAM_H_RECTANGLE, 1, 1,  8),
    PartyMonOAMSettings( 56,  8, 15, ST_OAM_H_RECTANGLE, 1, 1, 12),
    PartyMonOAMSettings( 32, 16, 15, ST_OAM_H_RECTANGLE, 1, 1, 16),
    PartyMonOAMSettings(101, 16, 15, ST_OAM_H_RECTANGLE, 1, 1, 24),
    PartyMonOAMSettings(133, 16, 15, ST_OAM_H_RECTANGLE, 1, 1, 28),
    0xFFFF,
};

// Controls where and how the mons' text appears in the party menu screen (nickname, HP, and level).
static struct PartyMonTextSettingsStruct const PartyMonTextSettings[4][6] =
{
    { // PARTY_MENU_LAYOUT_STANDARD
        { 1,  4, PartyMonOAMSettings_LeftColumn},
        {12,  1, PartyMonOAMSettings_RightColumn},
        {12,  4, PartyMonOAMSettings_RightColumn},
        {12,  7, PartyMonOAMSettings_RightColumn},
        {12, 10, PartyMonOAMSettings_RightColumn},
        {12, 13, PartyMonOAMSettings_RightColumn},
    },
    { // PARTY_MENU_LAYOUT_DOUBLE_BATTLE
        { 1,  2, PartyMonOAMSettings_LeftColumn},
        { 1,  9, PartyMonOAMSettings_LeftColumn},
        {12,  1, PartyMonOAMSettings_RightColumn},
        {12,  5, PartyMonOAMSettings_RightColumn},
        {12,  9, PartyMonOAMSettings_RightColumn},
        {12, 13, PartyMonOAMSettings_RightColumn},
    },
    { // PARTY_MENU_LAYOUT_LINK_DOUBLE_BATTLE
        { 1,  2, PartyMonOAMSettings_LeftColumn},
        { 1,  9, PartyMonOAMSettings_LeftColumn},
        {12,  2, PartyMonOAMSettings_RightColumn},
        {12,  5, PartyMonOAMSettings_RightColumn},
        {12,  9, PartyMonOAMSettings_RightColumn},
        {12, 12, PartyMonOAMSettings_RightColumn},
    },
    { // PARTY_MENU_LAYOUT_MULTI_BATTLE
        { 1,  2, PartyMonOAMSettings_LeftColumn},
        {12,  2, PartyMonOAMSettings_RightColumn},
        {12,  5, PartyMonOAMSettings_RightColumn},
        { 1,  9, PartyMonOAMSettings_LeftColumn},
        {12,  9, PartyMonOAMSettings_RightColumn},
        {12, 12, PartyMonOAMSettings_RightColumn},
    },
};

static const struct PartyMenuHandlersStruct PartyMenuHandlers[] =
{
    {HandleDefaultPartyMenu,         SetupDefaultPartyMenu,            0}, // PARTY_MENU_TYPE_STANDARD
    {HandleBattlePartyMenu,          SetUpBattlePartyMenu,             0}, // PARTY_MENU_TYPE_BATTLE
    {HandleSelectPartyMenu,          SetupContestPartyMenu,            0}, // PARTY_MENU_TYPE_CONTEST
    {HandleSelectPartyMenu,          SetupDefaultPartyMenu,            0}, // PARTY_MENU_TYPE_IN_GAME_TRADE
    {HandleBattleTowerPartyMenu,     SetupBattleTowerPartyMenu,        0}, // PARTY_MENU_TYPE_BATTLE_TOWER
    {HandleLinkMultiBattlePartyMenu, SetupLinkMultiBattlePartyMenu, 0xFF}, // PARTY_MENU_TYPE_LINK_MULTI_BATTLE
    {HandleDaycarePartyMenu,         SetupDefaultPartyMenu,         0x0F}, // PARTY_MENU_TYPE_DAYCARE
    {HandleMoveTutorPartyMenu,       SetupMoveTutorPartyMenu,          0}, // PARTY_MENU_TYPE_MOVE_TUTOR
};

extern u16 gBattleTypeFlags;
extern u8 gLastFieldPokeMenuOpened;
extern u8 gPlayerPartyCount;
extern s32 gBattleMoveDamage;
extern u16 gMoveToLearn;

extern u16 gUnknown_08E9A300[];
extern struct Coords8 const gUnknown_08376738[12][6];
extern struct Window gWindowTemplate_Contest_MoveDescription;

extern const u8 gPartyMenuMisc_Gfx[];
extern const u8 gPartyMenuMisc_Tilemap[];
extern const u8 gPartyMenuMisc_Pal[];
extern const u8 gFontDefaultPalette[];
extern const u8 gPartyMenuHpBar_Gfx[];
extern const u8 gPartyMenuOrderText_Gfx[];
extern const u8 gStatusGfx_Icons[];
extern const u8 gStatusPal_Icons[];

#if ENGLISH
#define WINDOW_LEFT (3)
#define WINDOW_RIGHT (26)
#elif GERMAN
#define WINDOW_LEFT (0)
#define WINDOW_RIGHT (29)
#endif

void CB2_PartyMenuMain(void)
{
    const struct PartyMonTextSettingsStruct *textSettings;
    s32 i;

    AnimateSprites();
    BuildOamBuffer();

    textSettings = PartyMonTextSettings[gPartyMenuType];
    for (i = 0; i < PARTY_SIZE; i++)
    {
        // Draw mon name, level, and hp sprites
        DrawPartyMenuMonText(
            textSettings->xOffset * 8,
            textSettings->yOffset * 8,
            textSettings->oamSettings,
            0,
            (i << 5) | 0x200);
        textSettings++;
    }

    RunTasks();
    UpdatePaletteFade();

#if DEBUG
    if (gLinkOpen == TRUE)
        debug_sub_8008264(gLink.recvQueue.count, 1, 1, 2, 2);
#endif
}

void VBlankCB_PartyMenu(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    ReDrawPartyMonBackgrounds();
}

void SetPartyMenuSettings(u8 menuType, u8 battleTypeFlags, TaskFunc menuHandlerFunc, u8 textId)
{
    if (battleTypeFlags != 0xFF)
    {
        gBattleTypeFlags = battleTypeFlags;
    }

    ePartyMenu2.menuType = menuType;
    ePartyMenu2.menuHandler = menuHandlerFunc;
    ePartyMenu2.promptTextId = textId;
}

void DoOpenPartyMenu(u8 menuType, u8 battleFlags, TaskFunc menuHandlerFunc, u8 textId)
{
    SetPartyMenuSettings(menuType, battleFlags, menuHandlerFunc, textId);
    SetMainCallback2(CB2_InitPartyMenu);
}

void OpenPartyMenu(u8 menuType, u8 battleFlags)
{
    DoOpenPartyMenu(menuType, battleFlags, PartyMenuHandlers[menuType].menuHandler, PartyMenuHandlers[menuType].initialPromptTextId);
}

// This is a Task which is repeatedly called until it eventually returns TRUE when finished.
bool8 SetupDefaultPartyMenu(void)
{
    switch (ePartyMenu2.pmSetupState)
    {
    case 0:
        if (ePartyMenu2.pmMonIndex < gPlayerPartyCount)
        {
            TryCreatePartyMenuMonIcon(ePartyMenu2.menuHandlerTaskId,
                ePartyMenu2.pmMonIndex, &gPlayerParty[ePartyMenu2.pmMonIndex]);
            ePartyMenu2.pmMonIndex++;
        }
        else
        {
            ePartyMenu2.pmMonIndex = 0;
            ePartyMenu2.pmSetupState++;
        }
        break;
    case 1:
        LoadHeldItemIconGraphics();
        ePartyMenu2.pmSetupState++;
        break;
    case 2:
        CreateHeldItemIcons_806DC34(ePartyMenu2.menuHandlerTaskId);
        ePartyMenu2.pmSetupState++;
        break;
    case 3:
        if (sub_806BD58(ePartyMenu2.menuHandlerTaskId, ePartyMenu2.pmMonIndex) != 1)
        {
            ePartyMenu2.pmMonIndex++;
        }
        else
        {
            ePartyMenu2.pmMonIndex = 0;
            ePartyMenu2.pmSetupState++;
        }
        break;
    case 4:
        PartyMenuPrintMonsLevelOrStatus();
        ePartyMenu2.pmSetupState++;
        break;
    case 5:
        PrintPartyMenuMonNicknames();
        ePartyMenu2.pmSetupState++;
        break;
    case 6:
        PartyMenuTryPrintMonsHP();
        ePartyMenu2.pmSetupState++;
        break;
    case 7:
        nullsub_13();
        ePartyMenu2.pmSetupState++;
        break;
    case 8:
        PartyMenuDrawHPBars();
        ePartyMenu2.pmSetupState++;
        break;
    case 9:
        if (DrawPartyMonBackground(ePartyMenu2.pmMonIndex) == 1)
        {
            ePartyMenu2.pmMonIndex = 0;
            ePartyMenu2.pmSetupState = 0;
            return TRUE;
        }
        else
        {
            ePartyMenu2.pmMonIndex++;
            break;
        }
    }

    return FALSE;
}

bool8 InitPartyMenu(void)
{
    switch (gMain.state)
    {
    case 0:
        SetVBlankCallback(NULL);
        DmaFill16Large(3, 0, (void *)(VRAM + 0x0), VRAM_SIZE, 0x1000);
        DmaClear32(3, OAM, OAM_SIZE);
        DmaClear16(3, PLTT, PLTT_SIZE);
        gPaletteFade.bufferTransferDisabled = 1;
        gMain.state++;
        break;
    case 1:
        ScanlineEffect_Stop();
        gMain.state++;
        break;
    case 2:
        sub_806B4A8();
        ePartyMenu2.pmSetupState = 0;
        ePartyMenu2.pmMonIndex = 0;
        ePartyMenu2.pmUnk268 = 0;
        gMain.state++;
        break;
    case 3:
        ResetSpriteData();
        gMain.state++;
        break;
    case 4:
        if (ePartyMenu2.menuType != PARTY_MENU_TYPE_BATTLE &&
            ePartyMenu2.menuType != PARTY_MENU_TYPE_LINK_MULTI_BATTLE)
            ResetTasks();
        gMain.state++;
        break;
    case 5:
        FreeAllSpritePalettes();
        gMain.state++;
        break;
    case 6:
        ePartyMenu2.menuHandlerTaskId = CreateTask(ePartyMenu2.menuHandler, 0);
        gMain.state++;
        break;
    case 7:
        Text_LoadWindowTemplate(&gWindowTemplate_81E6C90);
        gMain.state++;
        break;
    case 8:
        Text_InitWindowWithTemplate(&gWindowTemplate_Contest_MoveDescription, &gWindowTemplate_81E6C90);
        MultistepInitWindowTileData(&gWindowTemplate_Contest_MoveDescription, 1);
        gMain.state++;
        break;
    case 9:
        if (MultistepLoadFont())
        {
            ePartyMenu2.pmSetupState = 1;
            gMain.state++;
        }
        break;
    case 10:
        if (LoadPartyMenuGraphics(ePartyMenu2.pmSetupState) == TRUE)
        {
            ePartyMenu2.pmSetupState = 0;
            gMain.state++;
        }
        else
        {
            ePartyMenu2.pmSetupState++;
        }
        break;
    case 11:
        sub_809D51C();
        gMain.state++;
        break;
    case 12:
        if (PartyMenuHandlers[ePartyMenu2.menuType].menuSetup() == TRUE)
            gMain.state++;
        break;
    case 13:
        MultistepInitMenuWindowBegin(&gWindowTemplate_81E6CC8);
        gMain.state++;
        break;
    case 14:
        if (MultistepInitMenuWindowContinue())
            gMain.state++;
        break;
    case 15:
        PrintPartyMenuPromptText(ePartyMenu2.promptTextId, 0);
        gMain.state++;
        break;
    case 16:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
        gPaletteFade.bufferTransferDisabled = 0;
        gMain.state++;
        break;
    case 17:
        SetVBlankCallback(VBlankCB_PartyMenu);
#if DEBUG
        if (gLinkOpen == TRUE)
            debug_sub_8008218((void *)(VRAM + 0xE5E0), 0x8000, (void *)(VRAM + 0x7800), 2);
#endif
        return TRUE;
    }

    return FALSE;
}

void CB2_InitPartyMenu(void)
{
    while (InitPartyMenu() != TRUE)
    {
        if (sub_80F9344() == TRUE)
            return;
    }

    if (ePartyMenu2.menuType != PARTY_MENU_TYPE_LINK_MULTI_BATTLE)
        ChangePartyMenuSelection(ePartyMenu2.menuHandlerTaskId, 0);

    SetMainCallback2(CB2_PartyMenuMain);
}

void sub_806B4A8(void)
{
    SetHBlankCallback(NULL);
    REG_DISPCNT = 8000;
    REG_BG0CNT = 0x1E05;
    REG_BG1CNT = 0x703;
    REG_BG2CNT = 0xF08;
    REG_BG3CNT = 0x602;
    REG_BLDCNT = 0;
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG3HOFS = 0;
    REG_BG3VOFS = 0;
    REG_BG3VOFS = -1;
}

bool8 IsLinkDoubleBattle()
{
    if ((gBattleTypeFlags & BATTLE_TYPE_LINK_DOUBLE) == BATTLE_TYPE_LINK_DOUBLE)
        return TRUE;
    else
        return FALSE;
}

// Draws the blue rectangular regions surrounding each of the party mons.
void ReDrawPartyMonBackgrounds(void)
{
    if (ePartyMenu2.unk261)
    {
        DmaCopy16Defvars(3, gBGTilemapBuffers[2], (void *)(BG_VRAM + 0x3000), 0x800);

        if (ePartyMenu2.unk261 == 2)
            ePartyMenu2.unk261 = 0;
    }
}

bool8 DrawPartyMonBackground(u8 monIndex)
{
    const u8 *arr;

    if (!IsDoubleBattle())
        gPartyMenuType = PARTY_MENU_LAYOUT_STANDARD;
    else if (IsLinkDoubleBattle() == TRUE)
        gPartyMenuType = PARTY_MENU_LAYOUT_LINK_DOUBLE_BATTLE;
    else
        gPartyMenuType = PARTY_MENU_LAYOUT_DOUBLE_BATTLE;

    arr = &gUnknown_083769A8[gPartyMenuType * 12];

    switch (monIndex)
    {
    case 0:
        memset(&gBGTilemapBuffers[2], 0, 0x800);
        break;
    case 1:
        sub_806B9A4(arr[0], arr[1], 3);
        sub_806BF24(&arr[0], 0, 3, 0);
        break;
    case 2:
        if (!IsDoubleBattle())
        {
            if (gPlayerPartyCount > 1)
            {
                sub_806BA94(arr[2], arr[3], 0, 3);
                sub_806BF24(&arr[2], 1, 3, 0);
            }
            else
            {
                sub_806BA94(arr[2], arr[3], 1, 3);
            }
        }
        else if (IsLinkDoubleBattle() == TRUE)
        {
            sub_806B9A4(arr[2], arr[3], 4);
            sub_806BF24(&arr[2], 1, 4, 0);
        }
        else
        {
            sub_806B9A4(arr[2], arr[3], 3);
            sub_806BF24(&arr[2], 1, 3, 0);
        }
        break;
    case 3:
        if (!IsDoubleBattle())
        {
            if (gPlayerPartyCount > 2)
            {
                sub_806BA94(arr[4], arr[5], 0, 3);
                sub_806BF24(&arr[4], 2, 3, 0);
            }
            else
            {
                sub_806BA94(arr[4], arr[5], 1, 3);
            }
        }
        else if (IsLinkDoubleBattle() == TRUE)
        {
            if (GetMonData(&gPlayerParty[2], MON_DATA_SPECIES))
            {
                sub_806BA94(arr[4], arr[5], 0, 3);
                sub_806BF24(&arr[4], 2, 3, 0);
            }
            else
            {
                sub_806BA94(arr[4], arr[5], 1, 3);
            }
        }
        else if (gPlayerPartyCount > 2)
        {
            sub_806BA94(arr[4], arr[5], 0, 3);
            sub_806BF24(&arr[4], 2, 3, 0);
        }
        else
        {
            sub_806BA94(arr[4], arr[5], 1, 3);
        }
        break;
    case 4:
        if (!IsDoubleBattle())
        {
            if (gPlayerPartyCount > 3)
            {
                sub_806BA94(arr[6], arr[7], 0, 3);
                sub_806BF24(&arr[6], 3, 3, 0);
            }
            else
            {
                sub_806BA94(arr[6], arr[7], 1, 3);
            }
        }
        else if (IsLinkDoubleBattle() == TRUE)
        {
            if (GetMonData(&gPlayerParty[3], MON_DATA_SPECIES))
            {
                sub_806BA94(arr[6], arr[7], 0, 3);
                sub_806BF24(&arr[6], 3, 3, 0);
            }
            else
            {
                sub_806BA94(arr[6], arr[7], 1, 3);
            }
        }
        else if (gPlayerPartyCount > 3)
        {
            sub_806BA94(arr[6], arr[7], 0, 3);
            sub_806BF24(&arr[6], 3, 3, 0);
        }
        else
        {
            sub_806BA94(arr[6], arr[7], 1, 3);
        }
        break;
    case 5:
        if (!IsDoubleBattle())
        {
            if (gPlayerPartyCount > 4)
            {
                sub_806BA94(arr[8], arr[9], 0, 3);
                sub_806BF24(&arr[8], 4, 3, 0);
            }
            else
            {
                sub_806BA94(arr[8], arr[9], 1, 3);
            }
        }
        else if (IsLinkDoubleBattle() == TRUE)
        {
            if (GetMonData(&gPlayerParty[4], MON_DATA_SPECIES))
            {
                sub_806BA94(arr[8], arr[9], 0, 4);
                sub_806BF24(&arr[8], 4, 4, 0);
            }
            else
            {
                sub_806BA94(arr[8], arr[9], 1, 4);
            }
        }
        else if (gPlayerPartyCount > 4)
        {
            sub_806BA94(arr[8], arr[9], 0, 3);
            sub_806BF24(&arr[8], 4, 3, 0);
        }
        else
        {
            sub_806BA94(arr[8], arr[9], 1, 3);
        }
        break;
    case 6:
        if (!IsDoubleBattle())
        {
            if (gPlayerPartyCount > 5)
            {
                sub_806BA94(arr[10], arr[11], 0, 3);
                sub_806BF24(&arr[10], 5, 3, 0);
            }
            else
            {
                sub_806BA94(arr[10], arr[11], 1, 3);
            }
        }
        else if (IsLinkDoubleBattle() == TRUE)
        {
            if (GetMonData(&gPlayerParty[5], MON_DATA_SPECIES))
            {
                sub_806BA94(arr[10], arr[11], 0, 4);
                sub_806BF24(&arr[10], 5, 4, 0);
            }
            else
            {
                sub_806BA94(arr[10], arr[11], 1, 4);
            }
        }
        else if (gPlayerPartyCount > 5)
        {
            sub_806BA94(arr[10], arr[11], 0, 3);
            sub_806BF24(&arr[10], 5, 3, 0);
        }
        else
        {
            sub_806BA94(arr[10], arr[11], 1, 3);
        }
        break;
    case 7:
        if (ePartyMenu2.menuType == PARTY_MENU_TYPE_BATTLE_TOWER)
            sub_806BB9C(1);
        sub_806BBEC(1);
        break;
    case 8:
        ePartyMenu2.unk261 = 2;
        return TRUE;
    }

    return FALSE;
}

void sub_806B908(void)
{
    const u8 * r4;
    struct Pokemon * pokemon;
    memset(&gBGTilemapBuffers[2], 0, 0x800);
    gPartyMenuType = 3;

    r4 = ({const u8 * r0 = gUnknown_083769A8; r0 + 36;});
    pokemon = &gPlayerParty[1];
    sub_806B9A4(r4[0], r4[1], 3);

    if (GetMonData(pokemon, MON_DATA_SPECIES))
        sub_806BA94(r4[4], r4[5], 0, 3);
    else
        sub_806BA94(r4[4], r4[5], 1, 3);

    if (GetMonData(pokemon + 1, MON_DATA_SPECIES))
        sub_806BA94(r4[6], r4[7], 0, 3);
    else
        sub_806BA94(r4[6], r4[7], 1, 3);

    ePartyMenu2.unk261 = 2;
}

void sub_806B9A4(s16 a, u16 b, u8 c)
{
    u8 i;
    u16 var1 = b * 32;

    for (i = 0; i <= 6; i++)
    {
        u8 j = 0;

        if (a <= 0x1F)
        {
            for (; j <= 10 && a + j <= 0x1F; j++)
            {
                if (a + j >= 0)
                    gBGTilemapBuffers[2][var1 + (i * 32) + (a + j)] = (c << 12) | gUnknown_083769D8[i * 11 + j];
            }
        }
    }
}

void sub_806BA34(s16 a, u16 b)
{
    u8 i;
    u16 var1 = b * 32;

    for (i = 0; i <= 6; i++)
    {
        u8 j = 0;

        if (a <= 0x1F)
        {
            for (; j <= 10 && a + j <= 0x1F; j++)
            {
                if (a + j >= 0)
                    gBGTilemapBuffers[2][var1 + (i * 32) + (a + j)] = 0;
            }
        }
    }
}

void sub_806BA94(s16 a, u16 b, u8 c, u8 d)
{
    u8 i;
    const u8 *arr;
    u16 var1;

    if (c == 0)
        arr = gUnknown_08376A25;
    else
        arr = gUnknown_08376A5E;

    var1 = b * 32;

    for (i = 0; i < 3; i++)
    {
        u8 j = 0;

        if (a <= 0x1F)
        {
            while (j <= 0x12 && a + j <= 0x1F)
            {
                if (a + j >= 0)
                {
                    gBGTilemapBuffers[2][var1 + (i * 32) + (a + j)] = (d << 12) | arr[i * 19 + j];
                }

                j++;
            }
        }
    }
}

void sub_806BB3C(s16 a, u16 b)
{
    u8 i;
    u16 var1 = (b * 32);

    for (i = 0; i < 3; i++)
    {
        u8 j = 0;

        if (a <= 0x1F)
        {
            for (; j <= 0x12 && a + j <= 0x1F; j++)
            {
                if (a + j >= 0)
                {
                    gBGTilemapBuffers[2][var1 + (i * 32) + (a + j)] = 0;
                }
            }
        }
    }
}

void sub_806BB9C(u8 a)
{
    u8 i;
    u16 arr[12] =
    {
        0x2A, 0x2B, 0x2C, 0x2D, 0x2E, 0x2F,
        0x3A, 0x3B, 0x3C, 0x3D, 0x3E, 0x3F,
    };
    u16 *vramPtr = (u16 *)(BG_VRAM + 0x3C30);

    for (i = 0; i < PARTY_SIZE; i++)
    {
        vramPtr[i] = arr[i] + (a << 12);
        vramPtr[i + 0x20] = arr[i + PARTY_SIZE] + (a << 12);
    }
}

void sub_806BBEC(u8 a)
{
    u8 i;
    u16 arr[12] =
    {
        0x2A, 0x0B, 0x0C, 0x0D, 0x0E, 0x2F,
        0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F,
    };
    u16 *vramPtr = (u16 *)(BG_VRAM + 0x3CB0);

    for (i = 0; i < PARTY_SIZE; i++)
    {
        vramPtr[i] = arr[i] + (a << 12);
        vramPtr[i + 0x20] = arr[i + PARTY_SIZE] + (a << 12);
    }
}

// Draws the descriptor text in the mon's party bubble.
// Descriptor texts are things like "ABLE", "NOT ABLE", "LEARNED", etc.
void DrawMonDescriptorStatus(u8 monIndex, u8 descriptorOffset)
{
    u8 i;
    u32 offset;
    u16 *vramPtr = gUnknown_08376918[IsDoubleBattle()][monIndex];
    int paletteNum = 0;

    for (i = 0; i < 7; i++)
    {
        offset = i + (descriptorOffset / 7) * 32;
        vramPtr[i] = paletteNum | (gUnknown_08E9A300[offset] + 0x10C);
        vramPtr[i + 0x20] = paletteNum | (gUnknown_08E9A300[offset + 0x20] + 0x10C);
    }
}

void unref_sub_806BCB8(u8 descriptorOffset)
{
    u8 i;

    for (i = 0; i < gPlayerPartyCount; i++)
        DrawMonDescriptorStatus(i, descriptorOffset);
}

// This is ultimately unreferenced, since it's caller is unreferenced.
void sub_806BCE8()
{
    u8 i;

    for (i = 0; i < gPlayerPartyCount; i++)
    {
        if (!GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG))
        {
            switch (GetMonGender(&gPlayerParty[i]))
            {
            case MON_MALE:
                DrawMonDescriptorStatus(i, 0x54);
                break;
            case MON_FEMALE:
                DrawMonDescriptorStatus(i, 0x62);
                break;
            default:
                DrawMonDescriptorStatus(i, 0x46);
                break;
            }
        }
        else
        {
            DrawMonDescriptorStatus(i, 0x46);
        }
    }
}

u8 sub_806BD58(u8 taskId, u8 b)
{
    u8 spriteId = CreateInvisibleSpriteWithCallback(SpriteCallbackDummy);
    sub_806CA18(taskId, spriteId);
    return 1;
}

u16 HandleDefaultPartyMenuInput(u8 taskId)
{
    s8 menuDirectionPressed = 0x0;

    switch (gMain.newAndRepeatedKeys)
    {
    case DPAD_UP:
        menuDirectionPressed = -1;
        break;
    case DPAD_DOWN:
        menuDirectionPressed = 1;
        break;
    case DPAD_LEFT:
        menuDirectionPressed = -2;
        break;
    case DPAD_RIGHT:
        menuDirectionPressed = 2;
        break;
    }

    if (menuDirectionPressed == 0)
    {
        // Check L/R input
        u8 var1 = sub_80F92BC();
        switch (var1)
        {
        case 1:
            menuDirectionPressed = -1;
            break;
        case 2:
            menuDirectionPressed = 1;
            break;
        }
    }

    if (menuDirectionPressed != 0)
    {
        ChangePartyMenuSelection(taskId, menuDirectionPressed);
        return gMain.newAndRepeatedKeys;
    }
    else if ((gMain.newKeys & A_BUTTON) && gSprites[sub_806CA00(taskId)].data[0] == 7)
    {
        // Selected "CANCEL"
        return B_BUTTON;
    }
    else
    {
        return gMain.newKeys & (A_BUTTON | B_BUTTON);
    }
}

u16 HandleBattleTowerPartyMenuInput(u8 taskId)
{
    u8 menuDirectionPressed = 0x0;

    switch (gMain.newAndRepeatedKeys)
    {
    case DPAD_UP:
        menuDirectionPressed = 0xFF;
        break;
    case DPAD_DOWN:
        menuDirectionPressed = 0x1;
        break;
    case DPAD_LEFT:
        menuDirectionPressed = 0xFE;
        break;
    case DPAD_RIGHT:
        menuDirectionPressed = 0x2;
        break;
    }

    if (menuDirectionPressed == 0)
    {
        switch (sub_80F92BC())
        {
        case 1:
            menuDirectionPressed = 0xFF;
            break;
        case 2:
            menuDirectionPressed = 0x1;
            break;
        }
    }

    if (gMain.newKeys & START_BUTTON)
    {
        SelectBattleTowerOKButton(taskId);
        return START_BUTTON;
    }
    else
    {
        s8 signedMenuDirection = menuDirectionPressed;
        if (signedMenuDirection)
        {
            ChangeBattleTowerPartyMenuSelection(taskId, signedMenuDirection);
            return gMain.newAndRepeatedKeys;
        }
        else
        {
            if (gMain.newKeys & A_BUTTON)
            {
                if (gSprites[sub_806CA00(taskId)].data[0] == 7)
                    return B_BUTTON;
            }
        }
    }

    return gMain.newKeys & (A_BUTTON | B_BUTTON);
}

void task_pc_turn_off(const u8 *a, u8 b)
{
    if (a[0])
        sub_806BA94(a[0], a[1], 0, b);
    else
        sub_806B9A4(a[0], a[1], b);
}

void sub_806BF24(const u8 *a, u8 monIndex, u8 c, u8 d)
{
    if (GetMonData(&gPlayerParty[monIndex], MON_DATA_SPECIES) && GetMonData(&gPlayerParty[monIndex], MON_DATA_HP) == 0)
        c = PARTY_SIZE - 1;

    if (d == 1)
        c += 4;

    task_pc_turn_off(a, c);
}

void ChangePartyMenuSelection(u8 taskId, s8 directionPressed)
{
    bool8 isLinkDoubleBattle;
    u8 spriteId = sub_806CA00(taskId);
    u8 menuIndex = gSprites[spriteId].data[0];

    UpdateMonIconFrame_806DA44(taskId, menuIndex, 0);

    isLinkDoubleBattle = IsLinkDoubleBattle();
    if (isLinkDoubleBattle == 1)
    {
        if (menuIndex == 0 || menuIndex == 2 || menuIndex == 3)
            sub_806BF24(&gUnknown_083769C0[menuIndex * 2], menuIndex, 3, 0);
        if (menuIndex == 1 || menuIndex == 4 || menuIndex == 5)
            sub_806BF24(&gUnknown_083769C0[menuIndex * 2], menuIndex, 4, 0);
        if (menuIndex == 7)
            sub_806BBEC(1);

        ChangeLinkDoubleBattlePartyMenuSelection(spriteId, menuIndex, directionPressed);

        if (gSprites[spriteId].data[0] == 0 || gSprites[spriteId].data[0] == 2 || gSprites[spriteId].data[0] == 3)
            sub_806BF24(&gUnknown_083769C0[gSprites[spriteId].data[0] * 2], gSprites[spriteId].data[0], 3, 1);
        if (gSprites[spriteId].data[0] == 1 || gSprites[spriteId].data[0] == 4 || gSprites[spriteId].data[0] == 5)
                sub_806BF24(&gUnknown_083769C0[gSprites[spriteId].data[0] * 2], gSprites[spriteId].data[0], 4, 1);
        if (gSprites[spriteId].data[0] == 7)
            sub_806BBEC(2);

        ePartyMenu2.unk261 = 2;

        gSprites[spriteId].x = gUnknown_083768B8[PARTY_MENU_LAYOUT_LINK_DOUBLE_BATTLE][gSprites[spriteId].data[0]].x;
        gSprites[spriteId].y = gUnknown_083768B8[PARTY_MENU_LAYOUT_LINK_DOUBLE_BATTLE][gSprites[spriteId].data[0]].y;
    }
    else
    {
        u8 isDoubleBattle = IsDoubleBattle();

        if (menuIndex < PARTY_SIZE)
            sub_806BF24(&gUnknown_083769A8[isDoubleBattle * 12 + menuIndex * 2], menuIndex, 3, 0);
        else
            sub_806BBEC(1);

        if (!isDoubleBattle)
            ChangeDefaultPartyMenuSelection(spriteId, menuIndex, directionPressed);
        else
            ChangeDoubleBattlePartyMenuSelection(spriteId, menuIndex, directionPressed);

        if (gSprites[spriteId].data[0] < PARTY_SIZE)
            sub_806BF24(&gUnknown_083769A8[isDoubleBattle * 12 + gSprites[spriteId].data[0] * 2], gSprites[spriteId].data[0], 3, 1);
        else
            sub_806BBEC(2);

        ePartyMenu2.unk261 = 2;

        gSprites[spriteId].x = gUnknown_083768B8[isDoubleBattle][gSprites[spriteId].data[0]].x;
        gSprites[spriteId].y = gUnknown_083768B8[isDoubleBattle][gSprites[spriteId].data[0]].y;
    }

    UpdateMonIconFrame_806DA44(taskId, gSprites[spriteId].data[0], 1);

    if (menuIndex != gSprites[spriteId].data[0])
        PlaySE(SE_SELECT);
}

void ChangeDefaultPartyMenuSelection(u8 spriteId, u8 menuIndex, s8 directionPressed)
{
    u8 nextIndex;
    s8 menuMovement = directionPressed + 2;

    switch (menuMovement)
    {
    case 2: // no movement
        gSprites[spriteId].data[1] = 0;
        break;
    case 1: // moving up
        if (menuIndex == 0)
        {
            gSprites[spriteId].data[0] = 7;
        }
        else if (menuIndex == 7)
        {
            gSprites[spriteId].data[0] = gPlayerPartyCount - 1;
        }
        else
        {
            s8 diff = directionPressed;
            gSprites[spriteId].data[0] += diff;
        }
        gSprites[spriteId].data[1] = 0;
        break;
    case 3: // moving down
        if (menuIndex == gPlayerPartyCount - 1)
        {
            gSprites[spriteId].data[0] = 7;
        }
        else if (menuIndex == 7)
        {
            gSprites[spriteId].data[0] = 0;
        }
        else
        {
            s8 diff = directionPressed;
            gSprites[spriteId].data[0] += diff;
        }
        gSprites[spriteId].data[1] = 0;
        break;
    case 4: // moving right
        if (gPlayerPartyCount > 1 && menuIndex == 0)
        {
            if (gSprites[spriteId].data[1] == 0)
                gSprites[spriteId].data[1] = 1;
            gSprites[spriteId].data[0] = gSprites[spriteId].data[1];
        }
        break;
    case 0: // moving left
        // Only move the selection to the left side if one of the mons in the right-hand column are currently selected
        nextIndex = menuIndex - 1;
        if (nextIndex <= 4)
        {
            gSprites[spriteId].data[0] = 0;
            gSprites[spriteId].data[1] = menuIndex;
        }
        break;
    }
}

void ChangeDoubleBattlePartyMenuSelection(u8 spriteId, u8 menuIndex, s8 directionPressed)
{
    u8 var1;
    s8 menuMovement = directionPressed + 2;

    switch(menuMovement)
    {
    case 2: // no movement
        gSprites[spriteId].data[1] = 0;
        break;
    case 3: // moving down
        if (menuIndex == 7)
        {
            gSprites[spriteId].data[0] = 0;
        }
        else if (menuIndex == gPlayerPartyCount - 1)
        {
            gSprites[spriteId].data[0] = 7;
        }
        else
        {
            s8 diff = directionPressed;
            gSprites[spriteId].data[0] += diff;
        }
        gSprites[spriteId].data[1] = 0;
        break;
    case 1: // moving up
        if (menuIndex == 0)
        {
            gSprites[spriteId].data[0] = 7;
        }
        else if (menuIndex == 7)
        {
            gSprites[spriteId].data[0] = gPlayerPartyCount - 1;
        }
        else
        {
            s8 diff = directionPressed;
            gSprites[spriteId].data[0] += diff;
        }
        gSprites[spriteId].data[1] = 0;
        break;
    case 4: // moving right
        if (menuIndex == 0)
        {
            if (gPlayerPartyCount > 2)
            {
                u16 var1 = gSprites[spriteId].data[1] - 2;
                if (var1 > 1)
                    gSprites[spriteId].data[0] = 2;
                else
                    gSprites[spriteId].data[0] = gSprites[spriteId].data[1];
            }
        }
        else if (menuIndex == 1)
        {
            if (gPlayerPartyCount > 4)
            {
                u16 var1 = gSprites[spriteId].data[1] - 4;
                if (var1 <= 1)
                    gSprites[spriteId].data[0] = gSprites[spriteId].data[1];
                else
                    gSprites[spriteId].data[0] = 4;
            }
        }
        break;
    case 0: // moving left
        var1 = menuIndex - 2;
        if (var1 <= 1)
        {
            gSprites[spriteId].data[0] = 0;
            gSprites[spriteId].data[1] = menuIndex;
        }
        else
        {
            u8 var2 = menuIndex - 4;
            if (var2 <= 1)
            {
                gSprites[spriteId].data[0] = 1;
                gSprites[spriteId].data[1] = menuIndex;
            }
        }
        break;
    }
}

void ChangeLinkDoubleBattlePartyMenuSelection(u8 spriteId, u8 menuIndex, s8 directionPressed)
{
    switch (directionPressed)
    {
    case 0: // no movement
        gSprites[spriteId].data[1] = 0;
        break;
    case 1: // moving down
        if (menuIndex == 7) {
            gSprites[spriteId].data[0] = 0;
        }
        else
        {
            while (1)
            {
                if (menuIndex == PARTY_SIZE - 1)
                {
                    gSprites[spriteId].data[0] = 7;
                    break;
                }
                menuIndex++;
                if (GetMonData(&gPlayerParty[menuIndex], MON_DATA_SPECIES) != SPECIES_NONE)
                {
                    gSprites[spriteId].data[0] = menuIndex;
                    break;
                }
            }
        }
        gSprites[spriteId].data[1] = 0;
        break;
    case -1: // moving up
        while (1)
        {
            if (menuIndex == 0)
            {
                gSprites[spriteId].data[0] = 7;
                break;
            }
            menuIndex--;
            if (menuIndex != PARTY_SIZE && GetMonData(&gPlayerParty[menuIndex], MON_DATA_SPECIES) != SPECIES_NONE)
            {
                gSprites[spriteId].data[0] = menuIndex;
                break;
            }
        }

        gSprites[spriteId].data[1] = 0;
        break;
    case 2: // moving right
        if (menuIndex == 0) {
            if (gSprites[spriteId].data[1] < 2 || gSprites[spriteId].data[1] > 3) {
                if (GetMonData(&gPlayerParty[2], MON_DATA_SPECIES) != SPECIES_NONE) {
                    gSprites[spriteId].data[0] = 2;
                } else if (GetMonData(&gPlayerParty[3], MON_DATA_SPECIES) != SPECIES_NONE) {
                    gSprites[spriteId].data[0] = 3;
                }
            } else {
                gSprites[spriteId].data[0] = gSprites[spriteId].data[1];
            }
        } else if (menuIndex == 1) {
            if (gSprites[spriteId].data[1] >= 4 && gSprites[spriteId].data[1] <= 5) {
                gSprites[spriteId].data[0] = gSprites[spriteId].data[1];
            } else {
                if (GetMonData(&gPlayerParty[4], MON_DATA_SPECIES) != SPECIES_NONE) {
                    gSprites[spriteId].data[0] = 4;
                } else if (GetMonData(&gPlayerParty[5], MON_DATA_SPECIES) != SPECIES_NONE) {
                    gSprites[spriteId].data[0] = 5;
                }
            }
        }
        break;
    case -2: // moving left
        if (menuIndex > 1 && menuIndex < 4) {
            gSprites[spriteId].data[0] = 0;
            gSprites[spriteId].data[1] = menuIndex;
        } else {
            if (menuIndex > 3 && menuIndex < 6) {
                gSprites[spriteId].data[0] = 1;
                gSprites[spriteId].data[1] = menuIndex;
            }
        }
        break;
    }
}

void ChangeBattleTowerPartyMenuSelection(u8 taskId, s8 directionPressed)
{
    u16 newMenuIndex;
    u8 newMenuIndex2;
    u8 newMenuIndex3;
    s8 menuMovement;
    u8 spriteId = sub_806CA00(taskId);
    u8 menuIndex = gSprites[spriteId].data[0];

    UpdateMonIconFrame_806DA44(taskId, menuIndex, 0);

    if (menuIndex < PARTY_SIZE)
        sub_806BF24(&gUnknown_083769A8[menuIndex * 2], menuIndex, 3, 0);
    else if (menuIndex == PARTY_SIZE)
        sub_806BB9C(1);
    else
        sub_806BBEC(1);

    menuMovement = directionPressed + 2;
    switch (menuMovement)
    {
    case 2: // no movement
        gSprites[spriteId].data[1] = 0;
        break;
    case 1: // moving up
        if (menuIndex == 0)
            gSprites[spriteId].data[0] = 7;
        else if (menuIndex == PARTY_SIZE)
            gSprites[spriteId].data[0] = gPlayerPartyCount - 1;
        else
            gSprites[spriteId].data[0] += directionPressed;
        gSprites[spriteId].data[1] = 0;
        break;
    case 3: // moving down
        if (menuIndex == gPlayerPartyCount - 1)
            gSprites[spriteId].data[0] = 6;
        else if (menuIndex == 7)
            gSprites[spriteId].data[0] = 0;
        else
            gSprites[spriteId].data[0] += directionPressed;
        gSprites[spriteId].data[1] = 0;
        break;
    case 4: // moving right
        if (gPlayerPartyCount > 1 && menuIndex == 0)
        {
            if (gSprites[spriteId].data[1] == 0)
                gSprites[spriteId].data[1] = 1;
            gSprites[spriteId].data[0] = gSprites[spriteId].data[1];
        }
        break;
    case 0: // moving left
        newMenuIndex3 = menuIndex - 1;
        if (newMenuIndex3 <= 4)
        {
            gSprites[spriteId].data[0] = 0;
            gSprites[spriteId].data[1] = menuIndex;
        }
        break;
    }

    gSprites[spriteId].x = gUnknown_083768B8[PARTY_MENU_LAYOUT_STANDARD][gSprites[spriteId].data[0]].x;
    gSprites[spriteId].y = gUnknown_083768B8[PARTY_MENU_LAYOUT_STANDARD][gSprites[spriteId].data[0]].y;


    newMenuIndex = gSprites[spriteId].data[0];
    if (gSprites[spriteId].data[0] < PARTY_SIZE)
        sub_806BF24(&gUnknown_083769A8[gSprites[spriteId].data[0] * 2], newMenuIndex, 3, 1);
    else if (gSprites[spriteId].data[0] == PARTY_SIZE)
        sub_806BB9C(2);
    else
        sub_806BBEC(2);

    ePartyMenu2.unk261 = 2;

    newMenuIndex2 = gSprites[spriteId].data[0];
    UpdateMonIconFrame_806DA44(taskId, newMenuIndex2, 1);

    if (menuIndex != gSprites[spriteId].data[0])
        PlaySE(SE_SELECT);
}

// Selects the "OK" button in the Battle Tower party menu.
void SelectBattleTowerOKButton(u8 taskId)
{
    u8 spriteId = sub_806CA00(taskId);

    u8 menuIndex = gSprites[spriteId].data[0];
    if (menuIndex != 6)
    {
        UpdateMonIconFrame_806DA44(taskId, menuIndex, 0);

        if (menuIndex < PARTY_SIZE)
            sub_806BF24(&gUnknown_083769A8[menuIndex * 2], menuIndex, 3, 0);
        else
            sub_806BBEC(1);

        gSprites[spriteId].data[1] = 0;
        gSprites[spriteId].data[0] = 6;
        gSprites[spriteId].x = gUnknown_083768B8[PARTY_MENU_LAYOUT_STANDARD][6].x;
        gSprites[spriteId].y = gUnknown_083768B8[PARTY_MENU_LAYOUT_STANDARD][6].y;

        sub_806BB9C(2);

        ePartyMenu2.unk261 = 2;
        PlaySE(SE_SELECT);
    }
}

void sub_806C92C(u8 spriteId)
{
    u8 menuIndex1 = gSprites[spriteId].data[0];
    u8 menuIndex2 = gSprites[spriteId].data[1];

    if (!IsDoubleBattle())
    {
        if (menuIndex1 < 1)
        {
            if (menuIndex2 < 1)
                menuIndex2 = 1;
        }
        else
        {
            if (menuIndex2 >= 1)
                menuIndex2 = 0;
        }
    }
    else
    {
        if (menuIndex1 < 2)
        {
            if (menuIndex2 < 2)
                menuIndex2 = 2;
        }
        else
        {
            if (menuIndex2 >= 2)
                menuIndex2 = 0;
        }
    }

    gSprites[spriteId].data[1] = menuIndex2;
}

void sub_806C994(u8 taskId, u8 b)
{
    u8 spriteId = sub_806CA00(taskId);

    gSprites[spriteId].data[0] = b;
    sub_806C92C(spriteId);
}

void sub_806C9C4(u8 taskId, u8 spriteId)
{
    u8 spriteId2 = sub_806CA00(taskId);

    gSprites[spriteId].x = gSprites[spriteId2].x;
    gSprites[spriteId].y = gSprites[spriteId2].y;
    gSprites[spriteId].data[0] = gSprites[spriteId2].data[0];
}

u8 sub_806CA00(u8 taskId)
{
    return gTasks[taskId].data[3] >> 8;
}

void sub_806CA18(u8 taskId, u8 b)
{
    u8 var1 = gTasks[taskId].data[3];
    gTasks[taskId].data[3] = var1 | (b << 8);
}

u8 sub_806CA38(u8 taskId)
{
    u8 spriteId = sub_806CA00(taskId);
    return gSprites[spriteId].data[0];
}

void SetupDefaultPartyMenuSwitchPokemon(u8 taskId)
{
    gTasks[taskId].func = TaskDummy;
    ePartyMenu.unk0 = taskId;

    CreateTask(HandlePartyMenuSwitchPokemonInput, 0);
    ePartyMenu.slotId = CreateInvisibleSpriteWithCallback(SpriteCallbackDummy);

    sub_806C9C4(taskId, ePartyMenu.slotId);
    ePartyMenu.slotId2 = sub_806CA00(taskId);

    PrintPartyMenuPromptText(ePartyMenu2.pmUnk272, 0);

    sub_806BF24(&gUnknown_083769A8[gSprites[ePartyMenu.slotId].data[0] * 2], gSprites[ePartyMenu.slotId].data[0], 6, 0);
    ePartyMenu2.unk261 = 2;
}

// Handles changing the the current mon selection when choosing mons to swap places.
void ChangePartyMenuSwitchPokemonSelection(u8 taskId, s16 menuDirectionPressed)
{
    struct Sprite *sprite1 = &gSprites[ePartyMenu.slotId];
    struct Sprite *sprite2 = &gSprites[ePartyMenu.slotId2];

    ChangePartyMenuSelection(taskId, menuDirectionPressed);

    if (sprite1->data[0] != sprite2->data[0])
        sub_806BF24(&gUnknown_083769A8[sprite1->data[0] * 2], sprite1->data[0], 6, 1);
    else
        sub_806BF24(&gUnknown_083769A8[sprite1->data[0] * 2], sprite1->data[0], 6, 0);
}

void HandlePartyMenuSwitchPokemonInput(u8 taskId)
{
    switch (gMain.newAndRepeatedKeys)
    {
    case DPAD_UP:
        ChangePartyMenuSwitchPokemonSelection(ePartyMenu.unk0, -1);
        break;
    case DPAD_DOWN:
        ChangePartyMenuSwitchPokemonSelection(ePartyMenu.unk0, 1);
        break;
    case DPAD_LEFT:
        ChangePartyMenuSwitchPokemonSelection(ePartyMenu.unk0, -2);
        break;
    case DPAD_RIGHT:
        ChangePartyMenuSwitchPokemonSelection(ePartyMenu.unk0, 2);
        break;
    }

    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(5);
        gTasks[taskId].func = ePartyMenu.unkC;
        gTasks[taskId].func(taskId);
    }
    else if (gMain.newKeys == B_BUTTON)
    {
        PlaySE(5);
        sub_806CD44(taskId);
    }
}

void sub_806CC2C(u8 taskId)
{
    DestroySprite(&gSprites[ePartyMenu.slotId]);
    PrintPartyMenuPromptText(0, 0);

    ePartyMenu2.unk261 = 2;
    SwitchTaskToFollowupFunc(ePartyMenu.unk0);
    DestroyTask(taskId);
}

void sub_806CC74(u8 taskId)
{
    sub_806BF24(&gUnknown_083769A8[gSprites[ePartyMenu.slotId2].data[0] * 2], gSprites[ePartyMenu.slotId2].data[0], 3, 1);
    sub_806BF24(&gUnknown_083769A8[gSprites[ePartyMenu.slotId].data[0] * 2], gSprites[ePartyMenu.slotId].data[0], 3, 0);
    sub_806CC2C(taskId);
}

void sub_806CCE4()
{
    u8 monIndex1 = gSprites[ePartyMenu.slotId].data[0];
    u8 monIndex2 = gSprites[ePartyMenu.slotId2].data[0];

    if (monIndex1 <= 5)
        sub_806BF24(&gUnknown_083769A8[monIndex1 * 2], monIndex1, 3, 0);
    if (monIndex2 <= 5)
        sub_806BF24(&gUnknown_083769A8[monIndex2 * 2], monIndex2, 3, 1);
}

void sub_806CD44(u8 taskId)
{
    sub_806CCE4();
    sub_806CC2C(taskId);
}

void sub_806CD5C(u8 taskId)
{
    u8 monIndex1 = gSprites[ePartyMenu.slotId].data[0];
    u8 monIndex2 = gSprites[ePartyMenu.slotId2].data[0];

    if (monIndex1 == monIndex2 || monIndex1 == 7 || monIndex2 == 7)
    {
        sub_806CD44(taskId);
    }
    else
    {
        u8 var1;

        sub_806D5B8(monIndex1);
        sub_806D5B8(monIndex2);

        if (monIndex1 > monIndex2)
        {
            ePartyMenu.unk5 = monIndex2;
            ePartyMenu.unk6 = monIndex1;
        }
        else
        {
            ePartyMenu.unk5 = monIndex1;
            ePartyMenu.unk6 = monIndex2;
        }

        ePartyMenu.unk3 = GetMonIconSpriteId(ePartyMenu.unk0, ePartyMenu.unk5);
        ePartyMenu.unk4 = GetMonIconSpriteId(ePartyMenu.unk0, ePartyMenu.unk6);

        var1 = ePartyMenu.unk5;
        if (!var1)
        {
            gSprites[ePartyMenu.unk3].data[0] = -8;
            gSprites[ePartyMenu.unk3].data[2] = -0xA8;
            ePartyMenu.unk8 = var1;
            ePartyMenu.unkA = 11;

            gTasks[taskId].func = sub_806D014;
            ePartyMenu2.unk261 = 1;
        }
        else
        {
            gSprites[ePartyMenu.unk3].data[0] = 8;
            gSprites[ePartyMenu.unk3].data[2] = 0xA8;
            ePartyMenu.unk8 = 11;
            ePartyMenu.unkA = 11;

            gTasks[taskId].func = sub_806D118;
            ePartyMenu2.unk261 = 1;
        }

        gSprites[ePartyMenu.unk3].callback = SpriteCB_sub_806D37C;

        gSprites[ePartyMenu.unk4].data[0] = 8;
        gSprites[ePartyMenu.unk4].data[2] = 0xA8;
        gSprites[ePartyMenu.unk4].callback = SpriteCB_sub_806D37C;

        gSprites[ePartyMenu.unk3].callback(&gSprites[ePartyMenu.unk3]);
        gSprites[ePartyMenu.unk4].callback(&gSprites[ePartyMenu.unk4]);
    }
}

void SwapValues_s16(s16 *a, s16 *b)
{
    s16 temp = *a;
    *a = *b;
    *b = temp;
}

void sub_806CF04(void)
{
    SwapValues_s16(&gSprites[ePartyMenu.unk3].x, &gSprites[ePartyMenu.unk4].x);
    SwapValues_s16(&gSprites[ePartyMenu.unk3].y, &gSprites[ePartyMenu.unk4].y);
    SwapValues_s16(&gSprites[ePartyMenu.unk3].x2, &gSprites[ePartyMenu.unk4].x2);
    SwapValues_s16(&gSprites[ePartyMenu.unk3].data[0], &gSprites[ePartyMenu.unk4].data[0]);

    gSprites[ePartyMenu.unk3].callback = SpriteCB_sub_806D37C;
    gSprites[ePartyMenu.unk4].callback = SpriteCB_sub_806D37C;
}

void sub_806CFA0(u8 taskId, u8 b)
{
    u8 var1 = ((ePartyMenu.unk6 - 1) * 3) + 1;

    sub_806BA34(ePartyMenu.unk8, 3);
    sub_806BB3C(ePartyMenu.unkA, var1);

    if (!b)
    {
        ePartyMenu.unk8--;
        ePartyMenu.unkA++;
    }
    else
    {
        ePartyMenu.unk8++;
        ePartyMenu.unkA--;
    }

    sub_806B9A4(ePartyMenu.unk8, 3, 10);
    sub_806BA94(ePartyMenu.unkA, var1, 0, 10);
}

void sub_806D014(u8 taskId)
{
    sub_806CFA0(taskId, 0);

    if (ePartyMenu.unk8 < -13 && ePartyMenu.unkA > 32)
    {
        sub_806CF04();
        gTasks[taskId].func = sub_806D05C;
    }
}

void sub_806D05C(u8 taskId)
{
    sub_806CFA0(taskId, 1);

    if (ePartyMenu.unk8 == 0 && ePartyMenu.unkA == 11)
        gTasks[taskId].func = sub_806D198;
}

void sub_806D098(u8 a, u8 b)
{
    u8 var1 = ((ePartyMenu.unk5 - 1) * 3) + 1;
    u8 var2 = ((ePartyMenu.unk6 - 1) * 3) + 1;

    sub_806BB3C(ePartyMenu.unk8, var1);
    sub_806BB3C(ePartyMenu.unkA, var2);

    if (!b)
    {
        ePartyMenu.unk8++;
        ePartyMenu.unkA++;
    }
    else
    {
        ePartyMenu.unk8--;
        ePartyMenu.unkA--;
    }

    sub_806BA94(ePartyMenu.unk8, var1, 0, 10);
    sub_806BA94(ePartyMenu.unkA, var2, 0, 10);
}

void sub_806D118(u8 taskId)
{
    sub_806D098(taskId, 0);

    if (ePartyMenu.unk8 > 32 && ePartyMenu.unkA > 32)
    {
        sub_806CF04();
        gTasks[taskId].func = sub_806D15C;
    }
}

void sub_806D15C(u8 taskId)
{
    sub_806D098(taskId, 1);

    if (ePartyMenu.unk8 == 11 && ePartyMenu.unkA == 11)
        gTasks[taskId].func = sub_806D198;
}

void sub_806D198(u8 taskId)
{
    u8 spriteId;

    SetMonIconSpriteId(ePartyMenu.unk0, ePartyMenu.unk5, ePartyMenu.unk4);
    SetMonIconSpriteId(ePartyMenu.unk0, ePartyMenu.unk6, ePartyMenu.unk3);

    gSprites[ePartyMenu.unk3].x = gUnknown_08376678[IsDoubleBattle()][ePartyMenu.unk6].x;
    gSprites[ePartyMenu.unk3].y = gUnknown_08376678[IsDoubleBattle()][ePartyMenu.unk6].y;
    gSprites[ePartyMenu.unk3].x2 = 0;
    gSprites[ePartyMenu.unk3].y2 = 0;
    gSprites[ePartyMenu.unk3].callback = UpdateMonIconFrame_806DA38;

    gSprites[ePartyMenu.unk4].x = gUnknown_08376678[IsDoubleBattle()][ePartyMenu.unk5].x;
    gSprites[ePartyMenu.unk4].y = gUnknown_08376678[IsDoubleBattle()][ePartyMenu.unk5].y;
    gSprites[ePartyMenu.unk4].x2 = 0;
    gSprites[ePartyMenu.unk4].y2 = 0;
    gSprites[ePartyMenu.unk4].callback = UpdateMonIconFrame_806DA38;

    spriteId = GetMonIconSpriteId(ePartyMenu.unk0, gSprites[ePartyMenu.slotId2].data[0]);
    gSprites[spriteId].callback = UpdateMonIconFrame_806DA0C;

    SwapPokemon(&gPlayerParty[ePartyMenu.unk5], &gPlayerParty[ePartyMenu.unk6]);

    PartyMenuPrintMonLevelOrStatus(ePartyMenu.unk5, &gPlayerParty[ePartyMenu.unk5]);
    TryPrintPartyMenuMonNickname(ePartyMenu.unk5, &gPlayerParty[ePartyMenu.unk5]);
    PartyMenuTryPrintHP(ePartyMenu.unk5, &gPlayerParty[ePartyMenu.unk5]);
    nullsub_12(ePartyMenu.unk5, &gPlayerParty[ePartyMenu.unk5]);

    PartyMenuPrintMonLevelOrStatus(ePartyMenu.unk6, &gPlayerParty[ePartyMenu.unk6]);
    TryPrintPartyMenuMonNickname(ePartyMenu.unk6, &gPlayerParty[ePartyMenu.unk6]);
    PartyMenuTryPrintHP(ePartyMenu.unk6, &gPlayerParty[ePartyMenu.unk6]);
    nullsub_12(ePartyMenu.unk6, &gPlayerParty[ePartyMenu.unk6]);

    PartyMenuDrawHPBars();
    sub_806CC74(taskId);
}

void SpriteCB_sub_806D37C(struct Sprite *sprite)
{
    UpdateMonIconFrame(sprite);

    if (sprite->x2 == sprite->data[2])
    {
        sprite->data[0] *= -1;
        sprite->data[2] = 0;
        sprite->callback = UpdateMonIconFrame_806DA38;
    }
    else
    {
        sprite->x2 += sprite->data[0];
    }
}

void sub_806D3B4(u8 taskId, u16 species1, u16 species2)
{
    const u8 *var1 = gUnknown_083769C0;

    sub_806BA34(var1[2] + gTasks[taskId].data[0], var1[3]);
    sub_806BB3C(var1[8] + gTasks[taskId].data[0], var1[9]);
    sub_806BB3C(var1[10] + gTasks[taskId].data[0], var1[11]);

    gTasks[taskId].data[0]--;

    sub_806B9A4(var1[2] + gTasks[taskId].data[0], var1[3], 4);

    if (species1)
        sub_806BA94(var1[8] + gTasks[taskId].data[0], var1[9], 0, 4);
    else
        sub_806BA94(var1[8] + gTasks[taskId].data[0], var1[9], 1, 4);

    if (species2)
        sub_806BA94(var1[10] + gTasks[taskId].data[0], var1[11], 0, 4);
    else
        sub_806BA94(var1[10] + gTasks[taskId].data[0], var1[11], 1, 4);
}

void sub_806D4AC(u8 taskId, u16 species, u8 c)
{
    if (species)
    {
        u8 monIndex = c + 3;
        u8 spriteId = GetMonIconSpriteId(taskId, monIndex);

        gSprites[spriteId].data[0] = -8;
        gSprites[spriteId].data[2] = gTasks[taskId].data[0] * -8;
        gSprites[spriteId].callback = SpriteCB_sub_806D37C;
    }
}

void sub_806D50C(u8 taskId, u8 monIndex)
{
    gSprites[GetMonIconSpriteId(taskId, monIndex)].x += 0xF0;
}

void PrintPartyMenuPromptText(u8 textId, u8 b)
{
    if (textId != 0xFF)
    {
        switch (b)
        {
        case 0:
            Menu_DrawStdWindowFrame(0, 16, 23, 19);
            break;
        case 1:
            Menu_DrawStdWindowFrame(0, 16, 19, 19);
            break;
        case 2:
            Menu_DrawStdWindowFrame(0, 16, 22, 19);
            break;
        case 3:
            Menu_DrawStdWindowFrame(0, 16, 18, 19);
            break;
        }

        Menu_PrintText(PartyMenuPromptTexts[textId], 1, 17);
    }
}

void PartyMenuEraseMsgBoxAndFrame(void)
{
    Menu_EraseWindowRect(0, 16, 29, 19);
}

void sub_806D5B8(u8 monIndex)
{
    u8 left = gUnknown_08376948[IsDoubleBattle()][monIndex].left;
    u8 top = gUnknown_08376948[IsDoubleBattle()][monIndex].top;
    u8 right = gUnknown_08376948[IsDoubleBattle()][monIndex].right;
    u8 bottom = gUnknown_08376948[IsDoubleBattle()][monIndex].bottom;

    Text_EraseWindowRect(&gWindowTemplate_Contest_MoveDescription, left, top, right, bottom);

    CpuFastFill(0, OBJ_VRAM1 + monIndex * 0x400, 0x400);
}

void sub_806D668(u8 monIndex)
{
    u8 left = gUnknown_08376978[IsDoubleBattle()][monIndex].left;
    u8 top = gUnknown_08376978[IsDoubleBattle()][monIndex].top;
    u8 right = gUnknown_08376978[IsDoubleBattle()][monIndex].right;
    u8 bottom = gUnknown_08376978[IsDoubleBattle()][monIndex].bottom;

    Text_EraseWindowRect(&gWindowTemplate_Contest_MoveDescription, left, top, right, bottom);

    CpuFastFill(0, OBJ_VRAM1 + 0x300 + monIndex * 0x400, 0x100);
}

bool8 LoadPartyMenuGraphics(u8 a)
{
    u16 palette = 0x7FFF;
    bool8 retVal = FALSE;

    if (a < 2)
        LZDecompressVram(gPartyMenuMisc_Gfx, (void *)BG_VRAM);

    if (a == 2 || a == 0)
        LZDecompressVram(gPartyMenuMisc_Tilemap, (void *)(BG_VRAM + 0x3800));

    if (a == 3 || a == 0)
        LoadCompressedPalette(gPartyMenuMisc_Pal, 0, 0x160);

    if (a == 4 || a == 0)
    {
        LoadPalette(&palette, 0, 2);
        LoadPalette(gFontDefaultPalette, 0xF0, 0x20);
    }

    if (a == 5 || a == 0)
        LZDecompressVram(gPartyMenuHpBar_Gfx, (void *)(BG_VRAM + 0x6000));

    if (a == 6 || a == 0)
        LZDecompressVram(gPartyMenuOrderText_Gfx, (void *)(BG_VRAM + 0x6180));

    if (a == 7 || a == 0)
        LZDecompressVram(gStatusGfx_Icons, (void *)(BG_VRAM + 0x7180));

    if (a == 8 || a == 0)
    {
        LoadCompressedPalette(gStatusPal_Icons, 0xB0, 0x20);
        retVal = TRUE;
    }

    return retVal;
}

void SetMonIconAnimByHP(u8 spriteId, u16 currentHP, u16 maxHP)
{
    u8 hpBarLevel = GetHPBarLevel(currentHP, maxHP);
    u8 animNum = 0;

    if (currentHP != maxHP)
    {
        if (hpBarLevel == 3)
            animNum = 1;
        else if (hpBarLevel == 2)
            animNum = 2;
        else if (hpBarLevel == 1)
            animNum = 3;
        else
            animNum = 4;
    }

    SetPartyHPBarSprite(&gSprites[spriteId], animNum);
}

void SetMonIconAnim(u8 spriteId, struct Pokemon *pokemon)
{
    u16 currentHP = GetMonData(pokemon, MON_DATA_HP);
    u16 maxHP = GetMonData(pokemon, MON_DATA_MAX_HP);

    SetMonIconAnimByHP(spriteId, currentHP, maxHP);
}

void CreatePartyMenuMonIcon(u8 taskId, u8 monIndex, u8 menuType, struct Pokemon *pokemon)
{
    u8 x = gUnknown_08376678[menuType][monIndex].x;
    u8 y = gUnknown_08376678[menuType][monIndex].y;

    u16 species2 = GetMonData(pokemon, MON_DATA_SPECIES2);
    u32 personality = GetMonData(pokemon, MON_DATA_PERSONALITY);

    u8 spriteId = CreateMonIcon(species2, SpriteCB_PokemonIcon, x, y, 5, personality);
    SetMonIconSpriteId(taskId, monIndex, spriteId);
    SetMonIconAnim(spriteId, pokemon);
}

void TryCreatePartyMenuMonIcon(u8 taskId, u8 monIndex, struct Pokemon *pokemon)
{
    if (GetMonData(pokemon, MON_DATA_SPECIES))
    {
        if (IsLinkDoubleBattle() == TRUE)
            CreatePartyMenuMonIcon(taskId, monIndex, PARTY_MENU_LAYOUT_LINK_DOUBLE_BATTLE, pokemon);
        else
            CreatePartyMenuMonIcon(taskId, monIndex, IsDoubleBattle(), pokemon);
    }
}

void unref_sub_806D964(u8 taskId)
{
    u8 i;

    for (i = 0; i < gPlayerPartyCount; i++)
        TryCreatePartyMenuMonIcon(taskId, i, &gPlayerParty[i]);
}

void CreateMonIcon_LinkMultiBattle(u8 taskId, u8 monIndex, u8 menuType, struct MultiBattlePokemonTx *pokemon)
{
    u8 x = gUnknown_08376678[menuType][monIndex].x;
    u8 y = gUnknown_08376678[menuType][monIndex].y;

    u8 spriteId = CreateMonIcon(pokemon->species, SpriteCB_PokemonIcon, x, y, 5, pokemon->personality);
    SetMonIconSpriteId(taskId, monIndex, spriteId);
    SetMonIconAnimByHP(spriteId, pokemon->hp, pokemon->maxhp);
}

void UpdateMonIconFrame_806DA0C(struct Sprite *sprite)
{
    u8 var1 = UpdateMonIconFrame(sprite);

    if (var1)
    {
        if (var1 & 1)
            sprite->y2 = -3;
        else
            sprite->y2 = 1;
    }
}

void UpdateMonIconFrame_806DA38(struct Sprite *sprite)
{
    UpdateMonIconFrame(sprite);
}

void UpdateMonIconFrame_806DA44(u8 taskId, u8 monIndex, u8 c)
{
    u8 spriteId;

    if (monIndex < PARTY_SIZE)
    {
        spriteId = GetMonIconSpriteId(taskId, monIndex);
        gSprites[spriteId].y2 = 0;
        gSprites[spriteId].data[0] = 0;

        if (!c)
            gSprites[spriteId].callback = UpdateMonIconFrame_806DA38;
        else
            gSprites[spriteId].callback = UpdateMonIconFrame_806DA0C;
    }
}

void LoadHeldItemIconGraphics(void)
{
    LoadSpriteSheet(&HeldItemsSpriteSheet);
    LoadSpritePalette(&HeldItemsPalette);
}

void SpriteCB_HeldItemIcon(struct Sprite *sprite)
{
    u8 data7 = sprite->data[7];

    if (gSprites[data7].invisible)
    {
        sprite->invisible = TRUE;
    }
    else
    {
        sprite->invisible = FALSE;
        sprite->x = gSprites[data7].x + gSprites[data7].x2;
        sprite->y = gSprites[data7].y + gSprites[data7].y2;
    }
}

void CreateHeldItemIcon(u8 a, u8 b)
{
    u8 subPriority;
    u8 spriteId;

    subPriority = gSprites[a].subpriority;
    spriteId = CreateSprite(&gSpriteTemplate_837660C, 0xFA, 0xAA, subPriority - 1);

    gSprites[spriteId].x2 = 4;
    gSprites[spriteId].y2 = 10;
    gSprites[spriteId].callback = SpriteCB_HeldItemIcon;
    gSprites[spriteId].data[7] = a;

    StartSpriteAnim(&gSprites[spriteId], b);
    gSprites[spriteId].callback(&gSprites[spriteId]);
}

void CreateHeldItemIcons(u8 *a, u8 *b, u8 c)
{
    u16 i;
    u16 heldItem;

    switch (c)
    {
    case 0:
        for (i = 0; i < a[0]; i++)
        {
            heldItem = GetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM);
            if (heldItem)
                CreateHeldItemIcon(b[i], ItemIsMail(heldItem));
        }
        break;
    case 1:
        for (i = 0; i < a[1]; i++)
        {
            heldItem = GetMonData(&gEnemyParty[i], MON_DATA_HELD_ITEM);
            if (heldItem)
                CreateHeldItemIcon(b[i + 6], ItemIsMail(heldItem));
        }
        break;
    }
}

void CreateHeldItemIcons_806DC34(u8 taskId)
{
    u8 i;
    u8 monIconSpriteId;
    u8 heldItemSpriteId;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES))
        {
            monIconSpriteId = GetMonIconSpriteId(taskId, i);
            heldItemSpriteId = CreateSprite(&gSpriteTemplate_837660C, 0xFA, 0xAA, 4);

            gSprites[heldItemSpriteId].x2 = 4;
            gSprites[heldItemSpriteId].y2 = 10;
            gSprites[heldItemSpriteId].data[7] = monIconSpriteId;
            gSprites[monIconSpriteId].data[7] = heldItemSpriteId;

            SetHeldItemIconVisibility(taskId, i);
            gSprites[heldItemSpriteId].callback(&gSprites[heldItemSpriteId]);
        }
    }
}

void CreateHeldItemIcon_806DCD4(u8 taskId, u8 monIndex, u16 item)
{
    u8 monIconSpriteId;
    u8 heldItemSpriteId;

    monIconSpriteId = GetMonIconSpriteId(taskId, monIndex);
    heldItemSpriteId = CreateSprite(&gSpriteTemplate_837660C, 0xFA, 0xAA, 4);

    gSprites[heldItemSpriteId].x2 = 4;
    gSprites[heldItemSpriteId].y2 = 10;
    gSprites[heldItemSpriteId].data[7] = monIconSpriteId;
    gSprites[monIconSpriteId].data[7] = heldItemSpriteId;

    if (item == ITEM_NONE)
    {
        gSprites[heldItemSpriteId].invisible = TRUE;
    }
    else if (ItemIsMail(item))
    {
        StartSpriteAnim(&gSprites[heldItemSpriteId], 1);
        gSprites[heldItemSpriteId].invisible = FALSE;
    }
    else
    {
        StartSpriteAnim(&gSprites[heldItemSpriteId], 0);
        gSprites[heldItemSpriteId].invisible = FALSE;
    }

    gSprites[heldItemSpriteId].callback(&gSprites[heldItemSpriteId]);
}

void SpriteCB_UpdateHeldItemIconPosition(struct Sprite *sprite)
{
    u8 spriteId = sprite->data[7];

    sprite->x = gSprites[spriteId].x + gSprites[spriteId].x2;
    sprite->y = gSprites[spriteId].y;
}

// Soft casting of gTasks[taskId].data to u8* but big-endian.
u8 GetMonIconSpriteId(u8 taskId, u8 monIndex)
{
    switch (monIndex)
    {
    case 1:
        return gTasks[taskId].data[0];
        break;
    case 2:
        return gTasks[taskId].data[1] >> 8;
        break;
    case 3:
        return gTasks[taskId].data[1];
        break;
    case 4:
        return gTasks[taskId].data[2] >> 8;
        break;
    case 5:
        return gTasks[taskId].data[2];
        break;
    case 0:
    default:
        return gTasks[taskId].data[0] >> 8;
        break;
    }
}

void SetMonIconSpriteId(u8 taskId, u8 monIndex, u8 spriteId)
{
    switch (monIndex)
    {
    case 0:
        gTasks[taskId].data[0] = (gTasks[taskId].data[0] & 0xFF) | (spriteId << 8);
        break;
    case 1:
        gTasks[taskId].data[0] = (gTasks[taskId].data[0] & ~0xFF) | spriteId;
        break;
    case 2:
        gTasks[taskId].data[1] = (gTasks[taskId].data[1] & 0xFF) | (spriteId << 8);
        break;
    case 3:
        gTasks[taskId].data[1] = (gTasks[taskId].data[1] & ~0xFF) | spriteId;
        break;
    case 4:
        gTasks[taskId].data[2] = (gTasks[taskId].data[2] & 0xFF) | (spriteId << 8);
        break;
    case 5:
        gTasks[taskId].data[2] = (gTasks[taskId].data[2] & ~0xFF) | spriteId;
        break;
    }
}

static u8 GetMonHeldItemIconSpriteId(u8 taskId, u8 monIndex)
{
    u8 spriteId = GetMonIconSpriteId(taskId, monIndex);
    return gSprites[spriteId].data[7];
}

void SetHeldItemIconVisibility(u8 taskId, u8 monIndex)
{
    u8 spriteId;

    spriteId = GetMonHeldItemIconSpriteId(taskId, monIndex);
    if (!GetMonData(&gPlayerParty[monIndex], MON_DATA_HELD_ITEM))
    {
        gSprites[spriteId].invisible = TRUE;
    }
    else if (ItemIsMail(GetMonData(&gPlayerParty[monIndex], MON_DATA_HELD_ITEM)))
    {
        StartSpriteAnim(&gSprites[spriteId], 1);
        gSprites[spriteId].invisible = FALSE;
    }
    else
    {
        StartSpriteAnim(&gSprites[spriteId], 0);
        gSprites[spriteId].invisible = FALSE;
    }
}

void PartyMenuDoPrintMonNickname(u8 monIndex, int b, const u8 *nameBuffer)
{
    CpuFastFill(0, gTileBufferPtr, 0x400);
    Text_InitWindow8004E3C((struct WindowTemplate *)&gWindowTemplate_81E6CAC, gTileBufferPtr, nameBuffer);
    CpuFastCopy(gTileBufferPtr, OBJ_VRAM1 + (monIndex * 0x400), 0x200);
}

void PrintPartyMenuMonNickname(u8 monIndex, u8 b, struct Pokemon *pokemon)
{
    u8 nameBuffer[12];
    GetMonNickname(pokemon, nameBuffer);
    PartyMenuDoPrintMonNickname(monIndex, b, nameBuffer);
}

void TryPrintPartyMenuMonNickname(u8 monIndex, struct Pokemon *pokemon)
{
    if (GetMonData(pokemon, MON_DATA_SPECIES))
    {
        if (IsLinkDoubleBattle() == TRUE)
            PrintPartyMenuMonNickname(monIndex, PARTY_MENU_LAYOUT_LINK_DOUBLE_BATTLE, pokemon);
        else
            PrintPartyMenuMonNickname(monIndex, IsDoubleBattle(), pokemon);
    }
}

void PrintPartyMenuMonNicknames(void)
{
    u8 i;

    for (i = 0; i < PARTY_SIZE; i++)
        TryPrintPartyMenuMonNickname(i, &gPlayerParty[i]);
}

u8 *GetMonNickname(struct Pokemon *pokemon, u8 *stringBuffer)
{
    GetMonData(pokemon, MON_DATA_NICKNAME, stringBuffer);
    return StringGetEnd10(stringBuffer);
}

void PartyMenuPutStatusTilemap(u8 monIndex, u8 menuLayout, u8 status)
{
    u8 i;
    u8 x = gUnknown_08376738[menuLayout][monIndex].x - 1;
    u8 y = gUnknown_08376738[menuLayout][monIndex].y + 1;
    u16 *vramPtr = (u16*)(VRAM + 0xF000) + (x + y * 32);
    u8 var1 = status * 4;

    for (i = 0; i < 4; i++)
        vramPtr[i] = (0x18C + var1 + i) | -0x5000;
}

static void PartyMenuClearLevelStatusTilemap(u8 monIndex)
{
    u8 menuLayout;
    u8 x;
    u8 y;
    u16 *vramPtr;
    u8 i;

    if (IsLinkDoubleBattle() == TRUE)
        menuLayout = PARTY_MENU_LAYOUT_LINK_DOUBLE_BATTLE;
    else
        menuLayout = IsDoubleBattle();

    x = gUnknown_08376738[menuLayout][monIndex].x - 1;
    y = gUnknown_08376738[menuLayout][monIndex].y + 1;

    vramPtr = (u16*)(VRAM + 0xF000) + (x + y * 32);
    for (i = 0; i < 4; i++)
        vramPtr[i] = 0;
}

static void PartyMenuWriteTilemap(u8 a, u8 x, u8 y)
{
    u16 *vramPtr = (u16*)(VRAM + 0xF000) + (x + y * 32);
    *vramPtr = a + 0x10C;
}

void PartyMenuDoPrintLevel(u8 monIndex, u8 menuLayout, u8 level)
{
    u8 *stringVar;
    u8 x = gUnknown_08376738[menuLayout][monIndex].x;
    u8 y = gUnknown_08376738[menuLayout][monIndex].y;

    PartyMenuWriteTilemap(0x40, x - 1, y + 1);

    stringVar = gStringVar1;
    stringVar[0] = 0xFC;
    stringVar[1] = 0x12;
    stringVar[2] = 0x8;

    ConvertIntToDecimalString(&stringVar[3], level);

    CpuFastFill(0, gTileBufferPtr + 0x100, 0x80);
    Text_InitWindow8004E3C((struct WindowTemplate *)&gWindowTemplate_81E6CAC, gTileBufferPtr, gStringVar1);
    CpuFastCopy(gTileBufferPtr + 0x100, OBJ_VRAM1 + 0x200 + (monIndex * 0x400), 0x80);
}

void PartyMenuPrintLevel(u8 monIndex, u8 menuLayout, struct Pokemon *pokemon)
{
    u16 level = GetMonData(pokemon, MON_DATA_LEVEL);
    PartyMenuDoPrintLevel(monIndex, menuLayout, level);
}

void PartyMenuPrintMonLevelOrStatus(u8 monIndex, struct Pokemon *pokemon)
{
    if (GetMonData(pokemon, MON_DATA_SPECIES) && !GetMonData(pokemon, MON_DATA_IS_EGG))
    {
        u8 statusAndPkrs = GetMonStatusAndPokerus(pokemon);
        u8 menuLayout;

        if (IsLinkDoubleBattle() == TRUE)
            menuLayout = PARTY_MENU_LAYOUT_LINK_DOUBLE_BATTLE;
        else
            menuLayout = IsDoubleBattle();

        if (statusAndPkrs && statusAndPkrs != STATUS_PRIMARY_POKERUS)
            PartyMenuPutStatusTilemap(monIndex, menuLayout, statusAndPkrs - 1);
        else
            PartyMenuPrintLevel(monIndex, menuLayout, pokemon);

        PartyMenuPrintGenderIcon(monIndex, menuLayout, pokemon);
    }
}

void PartyMenuPrintMonsLevelOrStatus(void)
{
    u8 i;

    for (i = 0; i < PARTY_SIZE; i++)
        PartyMenuPrintMonLevelOrStatus(i, &gPlayerParty[i]);
}

void PartyMenuDoPrintGenderIcon(u16 species, u8 gender, u8 menuLayout, u8 monIndex, u8 *nickname)
{
    if (!ShouldHideGenderIcon(species, nickname))
    {
        u8 x = gUnknown_08376738[menuLayout][monIndex].x + 3;
        u8 y = gUnknown_08376738[menuLayout][monIndex].y + 1;

        switch (gender)
        {
        case MON_MALE:
            PartyMenuWriteTilemap(0x42, x, y);
            break;
        case MON_FEMALE:
            PartyMenuWriteTilemap(0x44, x, y);
            break;
        }
    }
}

void PartyMenuPrintGenderIcon(u8 monIndex, u8 menuLayout, struct Pokemon *pokemon)
{
    u16 species2;
    u8 gender;

    GetMonNickname(pokemon, gStringVar1);
    species2 = GetMonData(pokemon, MON_DATA_SPECIES2);
    gender = GetMonGender(pokemon);
    PartyMenuDoPrintGenderIcon(species2, gender, menuLayout, monIndex, gStringVar1);
}

void PartyMenuDoPrintHP(u8 monIndex, u8 b, u16 currentHP, u16 maxHP)
{
    register u8 *stringVar1 asm("r2") = gStringVar1;
    register u8 *textPtr asm("r2") = AlignInt1InMenuWindow(stringVar1, currentHP, 15, 1);
    textPtr[0] = CHAR_SLASH;

    AlignInt1InMenuWindow(++textPtr, maxHP, 35, 1);
    CpuFastFill(0, gTileBufferPtr + 0x100, 0x100);
    Text_InitWindow8004E3C((struct WindowTemplate *)&gWindowTemplate_81E6CAC, gTileBufferPtr, gStringVar1);
    CpuFastCopy(gTileBufferPtr + 0x100, OBJ_VRAM1 + 0x300 + (monIndex * 0x400), 0x100);
}

void PartyMenuPrintHP(u8 monIndex, u8 b, struct Pokemon *pokemon)
{
    u16 currentHP = GetMonData(pokemon, MON_DATA_HP);
    u16 maxHP = GetMonData(pokemon, MON_DATA_MAX_HP);

    PartyMenuDoPrintHP(monIndex, b, currentHP, maxHP);
}

void PartyMenuTryPrintHP(u8 monIndex, struct Pokemon *pokemon)
{
    if (GetMonData(pokemon, MON_DATA_SPECIES) && !GetMonData(pokemon, MON_DATA_IS_EGG))
    {
        if (IsLinkDoubleBattle() == TRUE)
            PartyMenuPrintHP(monIndex, PARTY_MENU_LAYOUT_LINK_DOUBLE_BATTLE, pokemon);
        else
            PartyMenuPrintHP(monIndex, IsDoubleBattle(), pokemon);
    }
}

void PartyMenuTryPrintMonsHP(void)
{
    u8 i;

    for (i = 0; i < PARTY_SIZE; i++)
        PartyMenuTryPrintHP(i, &gPlayerParty[i]);
}

void unref_sub_806E564(void) { }
void unref_sub_806E568(void) { }
void nullsub_12(u8 monIndex, struct Pokemon *pokemon) { }
void nullsub_13(void) { }

void PartyMenuDoDrawHPBar(u8 monIndex, u8 menuLayout, u16 currentHP, u16 maxHP)
{
    u8 hpBarLevel;
    u16 *vramPtr;
    int var = -32768;
    struct BattleInterfaceStruct1 battleInterface;
    battleInterface.unk0 = maxHP;
    battleInterface.unk4 = currentHP;
    battleInterface.unk8 = 0;

    hpBarLevel = GetHPBarLevel(currentHP, maxHP);
    if (hpBarLevel > 2)
        battleInterface.unkC_0 = 4;
    if (hpBarLevel == 2)
        battleInterface.unkC_0 = 5;
    if (hpBarLevel < 2)
        battleInterface.unkC_0 = 6;

    battleInterface.unk10 = 0x100;

    vramPtr = gUnknown_08376858[menuLayout][monIndex];
    sub_80460C8(&battleInterface, &var, vramPtr, 0);

    vramPtr -= 2;

    vramPtr[0] = 0x3109;
    vramPtr[1] = 0x310A;
    vramPtr[8] = 0x310B;
}

void PartyMenuDrawHPBar(u8 monIndex, u8 menuLayout, struct Pokemon *pokemon)
{
    u16 currentHP = GetMonData(pokemon, MON_DATA_HP);
    u16 maxHP = GetMonData(pokemon, MON_DATA_MAX_HP);

    PartyMenuDoDrawHPBar(monIndex, menuLayout, currentHP, maxHP);
}

void PartyMenuTryDrawHPBar(u8 monIndex, struct Pokemon *pokemon)
{
    if (GetMonData(pokemon, MON_DATA_SPECIES) && !GetMonData(pokemon, MON_DATA_IS_EGG))
    {
        if (IsLinkDoubleBattle() == TRUE)
            PartyMenuDrawHPBar(monIndex, PARTY_MENU_LAYOUT_LINK_DOUBLE_BATTLE, pokemon);
        else
            PartyMenuDrawHPBar(monIndex, IsDoubleBattle(), pokemon);
    }
}

void PartyMenuDrawHPBars(void)
{
    u8 i;

    for (i = 0; i < PARTY_SIZE; i++)
        PartyMenuTryDrawHPBar(i, &gPlayerParty[i]);
}

void SwapPokemon(struct Pokemon *a, struct Pokemon *b)
{
    struct Pokemon temp = *a;
    *a = *b;
    *b = temp;
}

void SetPartyPopupMenuOffsets(u8 menuIndex, u8 *left, u8 *top, const struct PartyPopupMenu *menu)
{
    u8 bottomOffset = (2 * menu[menuIndex].numChoices) + 2;
    u8 rightOffset = menu[menuIndex].width + 1;

    *left = 30 - rightOffset;
    *top = 20 - bottomOffset;
}

void ShowPartyPopupMenu(u8 menuIndex, const struct PartyPopupMenu *menu, const struct MenuAction2 *menuActions, u8 cursorPos)
{
    u8 left;
    u8 top;

    SetPartyPopupMenuOffsets(menuIndex, &left, &top, menu);
    sub_8089C50(left, top, menu[menuIndex].width, menu[menuIndex].numChoices, menuActions, menu[menuIndex].items);

    InitMenu(0, left + 1, top + 1, menu[menuIndex].numChoices, cursorPos, menu[menuIndex].width - 1);
}

void ClosePartyPopupMenu(u8 index, const struct PartyPopupMenu *menu)
{
    u8 left;
    u8 top;

    SetPartyPopupMenuOffsets(index, &left, &top, menu);

    Menu_EraseWindowRect(left, top, left + menu[index].width, menu[index].numChoices * 2 + top + 1);
    Menu_DestroyCursor();
}

TaskFunc PartyMenuGetPopupMenuFunc(u8 menuIndex, const struct PartyPopupMenu *menus, const struct MenuAction2 *menuActions, u8 itemIndex)
{
    u8 action = menus[menuIndex].items[itemIndex];
    return menuActions[action].func;
}

u8 DisplayPartyMenuMessage(const u8 *message, u8 noClearAfter)
{
    u8 taskId;

    gPartyMenuMessage_IsPrinting = 1;

    Menu_DrawStdWindowFrame(WINDOW_LEFT, 14, WINDOW_RIGHT, 19);
    MenuPrintMessage(message, WINDOW_LEFT + 1, 15);

    taskId = CreateTask(Task_PartyMenuPrintRun, 1);
    gTasks[taskId].data[0] = noClearAfter;

    return taskId;
}

static void Task_PartyMenuPrintRun(u8 taskId)
{
    if (Menu_UpdateWindowText())
    {
        gPartyMenuMessage_IsPrinting = 0;
        if (gTasks[taskId].data[0] == 0)
            Menu_EraseWindowRect(WINDOW_LEFT, 14, WINDOW_RIGHT, 19);
        DestroyTask(taskId);
    }
}

void sub_806E8D0(u8 taskId, u16 b, TaskFunc c)
{
    gPartyMenu.unk10 = c;
    gPartyMenu.unk4 = taskId;
    gPartyMenu.primarySelectedMonIndex = sub_806CA38(taskId);
    gPartyMenu.secondarySelectedIndex = b;
    gPartyMenu.pokemon = &gPlayerParty[gPartyMenu.primarySelectedMonIndex];
}

bool8 PartyMenuUpdateMonHeldItem(struct Pokemon *pkmn, u16 item)
{
    u8 itemData[2];

    if (ItemIsMail(item) == TRUE)
    {
        if (GiveMailToMon(pkmn, item) == 0xFF)
            return TRUE;
        gUnknown_0202E8F4 = 2;
    }
    else
    {
        gUnknown_0202E8F4 = 1;
    }

    itemData[0] = item;
    itemData[1] = item >> 8;
    SetMonData(pkmn, MON_DATA_HELD_ITEM, itemData);
    return FALSE;
}

void PartyMenuTryGiveMonHeldItem(u8 taskId, u16 newItem, TaskFunc c)
{
    u16 currentItem;

    gTasks[taskId].func = TaskDummy;
    sub_806E8D0(taskId, newItem, c);
    currentItem = GetMonData(gPartyMenu.pokemon, MON_DATA_HELD_ITEM);
    gUnknown_0202E8F4 = 0;
    gUnknown_0202E8F8 = 0;
    if (currentItem != 0)
    {
        if (ItemIsMail(currentItem) == TRUE)
        {
            DisplayPartyMenuMessage(gOtherText_MailMustBeRemoved, 1);
            CreateTask(party_menu_link_mon_held_item_object, 5);
        }
        else
        {
            GetMonNickname(gPartyMenu.pokemon, gStringVar1);
            CopyItemName(currentItem, gStringVar2);
            StringExpandPlaceholders(gStringVar4, gOtherText_AlreadyHolding);
            DisplayPartyMenuMessage(gStringVar4, 1);
            CreateTask(Task_ConfirmGiveHeldItem, 5);
            if (ItemIsMail(newItem) == TRUE)
                gUnknown_0202E8F8 = currentItem;
        }
    }
    else
    {
        PartyMenuUpdateMonHeldItem(gPartyMenu.pokemon, newItem);
        RemoveBagItem(newItem, 1);
        if (ItemIsMail(newItem))
        {
            gTasks[taskId].func = c;
        }
        else
        {
            DisplayGiveHeldItemMessage(gPartyMenu.primarySelectedMonIndex, newItem, 1);
            CreateTask(party_menu_link_mon_held_item_object, 5);
        }
    }
}

void party_menu_link_mon_held_item_object(u8 taskId)
{
    if (gPartyMenuMessage_IsPrinting == 0)
    {
        SetHeldItemIconVisibility(gPartyMenu.unk4, gPartyMenu.primarySelectedMonIndex);
        gTasks[gPartyMenu.unk4].func = gPartyMenu.unk10;
        DestroyTask(taskId);
    }
}

void PartyMenuTryGiveMonHeldItem_806EACC(u8 taskId)
{
    s8 selection = Menu_ProcessInputNoWrap_();

    if (selection == 0)
    {
        u16 currentItem;

        Menu_EraseWindowRect(23, 8, 29, 13);
        currentItem = GetMonData(gPartyMenu.pokemon, MON_DATA_HELD_ITEM);
        RemoveBagItem(gPartyMenu.secondarySelectedIndex, 1);
        if (AddBagItem(currentItem, 1) == TRUE)
        {
            PartyMenuUpdateMonHeldItem(gPartyMenu.pokemon, gPartyMenu.secondarySelectedIndex);
            if (ItemIsMail(gPartyMenu.secondarySelectedIndex))
            {
                DisplayTakeHeldItemMessage(gPartyMenu.primarySelectedMonIndex, currentItem, 1);
            }
            else
            {
                CopyItemName(gPartyMenu.secondarySelectedIndex, gStringVar1);
                StringExpandPlaceholders(gStringVar4, gOtherText_TakenAndReplaced);
                DisplayPartyMenuMessage(gStringVar4, 1);
            }
        }
        else
        {
            DisplayPartyMenuMessage(gOtherText_BagFullCannotRemoveItem, 0);
            AddBagItem(gPartyMenu.secondarySelectedIndex, 1);
        }
    }
    else
    {
        if (selection != 1 && selection != -1)
            return;
        if (selection == -1)
            PlaySE(SE_SELECT);
        Menu_EraseWindowRect(23, 8, 29, 13);
    }
    gTasks[taskId].func = party_menu_link_mon_held_item_object;
}

void Task_ConfirmGiveHeldItem(u8 taskId)
{
    if (gPartyMenuMessage_IsPrinting == 0)
    {
        DisplayYesNoMenu(23, 8, 1);
        gTasks[taskId].func = PartyMenuTryGiveMonHeldItem_806EACC;
    }
}

void DisplayGiveHeldItemMessage(u8 a, u16 b, u8 c)
{
    GetMonNickname(&gPlayerParty[a], gStringVar1);
    CopyItemName(b, gStringVar2);
    StringExpandPlaceholders(gStringVar4, gOtherText_WasGivenToHold);
    DisplayPartyMenuMessage(gStringVar4, c);
}

void PartyMenuTryGiveMonMail(u8 taskId, TaskFunc func)
{
    u32 var1;
    u16 currentItem;
    struct MailStruct *mail;

    gTasks[taskId].func = TaskDummy;
    sub_806E8D0(taskId, 0, func);
    currentItem = GetMonData(gPartyMenu.pokemon, MON_DATA_HELD_ITEM);
    gUnknown_0202E8F4 = 0;
    var1 = eMailboxInfo.cursorPos + 6;
    mail = &gSaveBlock1.mail[var1 + eMailboxInfo.itemsAbove];

    if (currentItem != 0)
    {
        DisplayPartyMenuMessage(gOtherText_PokeHoldingItemCantMail, 1);
        CreateTask(party_menu_link_mon_held_item_object, 5);
    }
    else
    {
        GiveMailToMon2(gPartyMenu.pokemon, mail);
        ClearMailStruct(mail);
        DisplayPartyMenuMessage(gOtherText_MailTransferredMailbox, 1);
        CreateTask(party_menu_link_mon_held_item_object, 5);
    }
}

void PartyMenuTryGiveMonHeldItem_806ECE8(u8 taskId, TaskFunc func)
{
    u16 currentItem;

    gTasks[taskId].func = TaskDummy;
    sub_806E8D0(taskId, 0, func);
    currentItem = GetMonData(gPartyMenu.pokemon, MON_DATA_HELD_ITEM);
    if (currentItem == 0)
    {
        StringExpandPlaceholders(gStringVar4, gOtherText_NotHoldingAnything);
        DisplayPartyMenuMessage(gStringVar4, 0);
        CreateTask(party_menu_link_mon_held_item_object, 5);
    }
    else
    {
        u8 itemData[2];

        itemData[0] = 0;
        itemData[1] = 0;
        if (AddBagItem(currentItem, 1) == TRUE)
        {
            if (ItemIsMail(currentItem) == TRUE)
                TakeMailFromMon(gPartyMenu.pokemon);
            DisplayTakeHeldItemMessage(gPartyMenu.primarySelectedMonIndex, currentItem, 0);
            SetMonData(gPartyMenu.pokemon, MON_DATA_HELD_ITEM, itemData);
        }
        else
        {
            DisplayPartyMenuMessage(gOtherText_BagFullCannotRemoveItem, 0);
        }
        CreateTask(party_menu_link_mon_held_item_object, 5);
    }
}

void DisplayTakeHeldItemMessage(u8 a, u16 b, u8 c)
{
    GetMonNickname(&gPlayerParty[a], gStringVar1);
    CopyItemName(b, gStringVar2);
    StringExpandPlaceholders(gStringVar4, gOtherText_ReceivedTheThingFrom);
    DisplayPartyMenuMessage(gStringVar4, c);
}

void DoTakeMail(u8 taskId, TaskFunc func)
{
    gTasks[taskId].func = TaskDummy;
    sub_806E8D0(taskId, 0, func);
    gPartyMenu.secondarySelectedIndex = GetMonData(gPartyMenu.pokemon, MON_DATA_HELD_ITEM);
    DisplayPartyMenuMessage(gOtherText_SendRemovedMailPrompt, 1);
    CreateTask(Task_ConfirmTakeHeldMail, 5);
}

void Task_LoseMailMessage(u8 taskId)
{
    s8 selection = Menu_ProcessInputNoWrap_();

    if (selection == 0)
    {
        if (AddBagItem(gPartyMenu.secondarySelectedIndex, 1) == TRUE)
        {
            TakeMailFromMon(gPartyMenu.pokemon);
            DisplayPartyMenuMessage(gOtherText_MailTaken, 0);
        }
        else
        {
            DisplayPartyMenuMessage(gOtherText_BagFullCannotRemoveItem, 0);
        }
        Menu_EraseWindowRect(23, 8, 29, 13);
        gTasks[taskId].func = party_menu_link_mon_held_item_object;
    }
    else
    {
        if (selection != 1 && selection != -1)
            return;
        if (selection == -1)
            PlaySE(SE_SELECT);
        Menu_EraseWindowRect(23, 8, 29, 13);
        Menu_EraseWindowRect(0, 14, 29, 19);
        gTasks[taskId].func = party_menu_link_mon_held_item_object;
    }
}

void Task_ConfirmLoseMailMessage(u8 taskId)
{
    if (gPartyMenuMessage_IsPrinting == 0)
    {
        DisplayYesNoMenu(23, 8, 1);
        gTasks[taskId].func = Task_LoseMailMessage;
    }
}

void Task_TakeHeldMail(u8 taskId)
{
    s8 selection = Menu_ProcessInputNoWrap_();

    if (selection == 0)
    {
        Menu_EraseWindowRect(23, 8, 29, 13);
        if (TakeMailFromMon2(gPartyMenu.pokemon) != 0xFF)
            DisplayPartyMenuMessage(gOtherText_MailWasSent, 0);
        else
            DisplayPartyMenuMessage(gOtherText_MailboxIsFull, 0);
        gTasks[taskId].func = party_menu_link_mon_held_item_object;
    }
    else
    {
        if (selection != 1 && selection != -1)
            return;
        if (selection == -1)
            PlaySE(SE_SELECT);
        Menu_EraseWindowRect(23, 8, 29, 13);
        DisplayPartyMenuMessage(gOtherText_MailRemovedMessageLost, 1);
        gTasks[taskId].func = Task_ConfirmLoseMailMessage;
    }
}

void Task_ConfirmTakeHeldMail(u8 taskId)
{
    if (gPartyMenuMessage_IsPrinting == 0)
    {
        DisplayYesNoMenu(23, 8, 1);
        gTasks[taskId].func = Task_TakeHeldMail;
    }
}

u16 ItemIdToBattleMoveId(u16 item)
{
    u16 machineNumber = item - ITEM_TM01_FOCUS_PUNCH;
    return TMHMMoves[machineNumber];
}

bool8 pokemon_has_move(struct Pokemon *pkmn, u16 move)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        if (GetMonData(pkmn, MON_DATA_MOVE1 + i) == move)
            return TRUE;
    }
    return FALSE;
}

void TeachMonTMMove(u8 taskId, u16 move, TaskFunc func)
{
    PlaySE(SE_SELECT);
    gTasks[taskId].func = TaskDummy;
    sub_806E8D0(taskId, move, func);
    CreateTask(Task_TeamMonTMMove, 5);
}

#if DEBUG
extern u8 gUnknown_020297ED;
#endif

void Task_TeamMonTMMove(u8 taskId)
{
    GetMonNickname(gPartyMenu.pokemon, gStringVar1);
    gPartyMenu.unk8 = ItemIdToBattleMoveId(gPartyMenu.secondarySelectedIndex);
    StringCopy(gStringVar2, gMoveNames[gPartyMenu.unk8]);
    ePartyMenu2.pmUnk282 = 0;
    if (pokemon_has_move(gPartyMenu.pokemon, gPartyMenu.unk8))
    {
        StringExpandPlaceholders(gStringVar4, gOtherText_AlreadyKnows);
        DisplayPartyMenuMessage(gStringVar4, 1);
        gTasks[taskId].func = party_menu_link_mon_held_item_object;
    }
    else
    {
        if (
#if DEBUG
         !gUnknown_020297ED &&
#endif
         !CanMonLearnTMHM(gPartyMenu.pokemon, gPartyMenu.secondarySelectedIndex - 33))
        {
            StringExpandPlaceholders(gStringVar4, gOtherText_NotCompatible);
            DisplayPartyMenuMessage(gStringVar4, 1);
            gTasks[taskId].func = party_menu_link_mon_held_item_object;
        }
        else
        {
            if (GiveMoveToMon(gPartyMenu.pokemon, gPartyMenu.unk8) != 0xFFFF)
            {
                Task_TeamMonTMMove2(taskId);
            }
            else
            {
                StringExpandPlaceholders(gStringVar4, gOtherText_WantsToLearn);
                DisplayPartyMenuMessage(gStringVar4, 1);
                gTasks[taskId].func = sub_806F358;
            }
        }
    }
}

void Task_TeamMonTMMove2(u8 taskId)
{
    StringCopy(gStringVar2, gMoveNames[gPartyMenu.unk8]);
    StringExpandPlaceholders(gStringVar4, gOtherText_LearnedMove);
    DisplayPartyMenuMessage(gStringVar4, 1);
    AdjustFriendship(gPartyMenu.pokemon, FRIENDSHIP_EVENT_LEARN_TMHM);
    if (ePartyMenu2.pmUnk282 == 0 && gPartyMenu.secondarySelectedIndex < ITEM_HM01_CUT)
        RemoveBagItem(gPartyMenu.secondarySelectedIndex, 1);
    gTasks[taskId].func = Task_TeamMonTMMove3;
}

void Task_TeamMonTMMove3(u8 taskId)
{
    if (gPartyMenuMessage_IsPrinting == 0)
    {
        PlayFanfare(MUS_LEVEL_UP);
        gTasks[taskId].func = Task_TeamMonTMMove4;
    }
}

void Task_TeamMonTMMove4(u8 taskId)
{
    if (IsFanfareTaskInactive())
    {
        if ((gMain.newKeys & A_BUTTON) || (gMain.newKeys & B_BUTTON))
        {
            SetHeldItemIconVisibility(gPartyMenu.unk4, gPartyMenu.primarySelectedMonIndex);
            if (ePartyMenu2.pmUnk282 == 1)
            {
                TeachMonMoveInPartyMenu(taskId);
            }
            else
            {
                gTasks[gPartyMenu.unk4].func = gPartyMenu.unk10;
                DestroyTask(taskId);
            }
        }
    }
}

void sub_806F2FC(u8 taskId)
{
    if (gPartyMenuMessage_IsPrinting == 0)
    {
        SetHeldItemIconVisibility(gPartyMenu.unk4, gPartyMenu.primarySelectedMonIndex);
        if (ePartyMenu2.pmUnk282 == 1)
        {
            TeachMonMoveInPartyMenu(taskId);
        }
        else
        {
            gTasks[gPartyMenu.unk4].func = gPartyMenu.unk10;
            DestroyTask(taskId);
        }
    }
}

void sub_806F358(u8 taskId)
{
    if (gPartyMenuMessage_IsPrinting == 0)
    {
        DisplayYesNoMenu(23, 8, 1);
        gTasks[taskId].func = sub_806F390;
    }
}

void sub_806F390(u8 taskId)
{
    s8 selection = Menu_ProcessInputNoWrap_();

    if (selection == 0)
    {
        Menu_EraseWindowRect(23, 8, 29, 13);
        DisplayPartyMenuMessage(gOtherText_WhichMoveToForget2, 1);
        gTasks[taskId].func = sub_806F44C;
    }
    else
    {
        if (selection != 1 && selection != -1)
            return;
        if (selection == -1)
            PlaySE(SE_SELECT);
        StopTryingToTeachMove_806F614(taskId);
    }
}

void sub_806F3FC(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        ShowSelectMovePokemonSummaryScreen(gPlayerParty, gPartyMenu.primarySelectedMonIndex, gPlayerPartyCount - 1, sub_808B564, gPartyMenu.unk8);
        DestroyTask(taskId);
    }
}

void sub_806F44C(u8 taskId)
{
    if (gPartyMenuMessage_IsPrinting == 0)
    {
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        gTasks[taskId].func = sub_806F3FC;
    }
}

void TaughtMove(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        u8 moveIndex;
        u16 r4;

        gTasks[taskId].func = TaskDummy;
        sub_806E8D0(taskId, gSpecialVar_ItemId, sub_808B508);
        moveIndex = sub_809FA30();
        r4 = GetMonData(gPartyMenu.pokemon, MON_DATA_MOVE1 + moveIndex);
        GetMonNickname(gPartyMenu.pokemon, gStringVar1);
        StringCopy(gStringVar2, gMoveNames[r4]);
        StringExpandPlaceholders(gStringVar4, gOtherText_ForgetMove123_2);
        DisplayPartyMenuMessage(gStringVar4, 1);
        CreateTask(TMMoveUpdateMoveSlot, 5);
    }
}

void TMMoveUpdateMoveSlot(u8 taskId)
{
    if (gPartyMenuMessage_IsPrinting == 0)
    {
        RemoveMonPPBonus(gPartyMenu.pokemon, sub_809FA30());
        SetMonMoveSlot(gPartyMenu.pokemon, gPartyMenu.unk8, sub_809FA30());
        Task_TeamMonTMMove2(taskId);
    }
}

void StopTryingToTeachMove_806F588(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        gTasks[taskId].func = TaskDummy;
        sub_806E8D0(taskId, gSpecialVar_ItemId, sub_808B508);
        StringCopy(gStringVar2, gMoveNames[gPartyMenu.unk8]);
        StringExpandPlaceholders(gStringVar4, gOtherText_StopTryingTo);
        DisplayPartyMenuMessage(gStringVar4, 1);
        CreateTask(StopTryingToTeachMove_806F67C, 5);
    }
}

void StopTryingToTeachMove_806F614(u8 taskId)
{
    Menu_EraseWindowRect(23, 8, 29, 13);
    StringCopy(gStringVar2, gMoveNames[gPartyMenu.unk8]);
    StringExpandPlaceholders(gStringVar4, gOtherText_StopTryingTo);
    DisplayPartyMenuMessage(gStringVar4, 1);
    gTasks[taskId].func = StopTryingToTeachMove_806F67C;
}

void StopTryingToTeachMove_806F67C(u8 taskId)
{
    if (gPartyMenuMessage_IsPrinting == 0)
    {
        DisplayYesNoMenu(23, 8, 1);
        gTasks[taskId].func = StopTryingToTeachMove_806F6B4;
    }
}

void StopTryingToTeachMove_806F6B4(u8 taskId)
{
    s8 selection = Menu_ProcessInputNoWrap_();

    if (selection == 0)
    {
        Menu_EraseWindowRect(23, 8, 29, 13);
        GetMonNickname(gPartyMenu.pokemon, gStringVar1);
        StringCopy(gStringVar2, gMoveNames[gPartyMenu.unk8]);
        StringExpandPlaceholders(gStringVar4, gOtherText_DidNotLearnMove2);
        DisplayPartyMenuMessage(gStringVar4, 1);
        gTasks[taskId].func = sub_806F2FC;
    }
    else
    {
        if (selection != 1 && selection != -1)
            return;
        if (selection == -1)
            PlaySE(SE_SELECT);
        Menu_EraseWindowRect(23, 8, 29, 13);
        GetMonNickname(gPartyMenu.pokemon, gStringVar1);
        StringCopy(gStringVar2, gMoveNames[gPartyMenu.unk8]);
        StringExpandPlaceholders(gStringVar4, gOtherText_WantsToLearn);
        DisplayPartyMenuMessage(gStringVar4, 1);
        gTasks[taskId].func = sub_806F358;
    }
}

bool8 IsHMMove(u16 move)
{
    u8 i;

    for (i = 0; i < NUM_HIDDEN_MACHINES; i++)
    {
        if (TMHMMoves[NUM_TECHNICAL_MACHINES + i] == move)
            return TRUE;
    }

    return FALSE;
}

s16 sub_806F7E8(u8 taskId, struct BattleInterfaceStruct1 *b, s8 c)
{
    s16 *taskData;
    u8 hpBarLevel;
    void *vramPtr;

    taskData = gTasks[taskId].data;

    b->unk0 = taskData[10];
    b->unk4 = taskData[11];
    b->unk8 = taskData[12] * c;
    b->unk10 = 0x100;
    hpBarLevel = GetHPBarLevel(ePartyMenu2.pmUnk282, b->unk0);
    if (hpBarLevel > 2)
        b->unkC_0 = 4;
    if (hpBarLevel == 2)
        b->unkC_0 = 5;
    if (hpBarLevel < 2)
        b->unkC_0 = 6;
    vramPtr = gUnknown_08376858[IsDoubleBattle()][gPartyMenu.primarySelectedMonIndex];
    return sub_80460C8(b, (int *)&gPartyMenu.unkC, vramPtr, 0);
}

void sub_806F8AC(u8 taskId)
{
    struct BattleInterfaceStruct1 sp0;
    u16 sp14;

    ePartyMenu2.pmUnk282 = sub_806F7E8(taskId, &sp0, -1);
    if (ePartyMenu2.pmUnk282 == -1)
    {
        gPartyMenu.unkC = 0;
        if (-sp0.unk8 + sp0.unk4 > sp0.unk0)
            sp14 = sp0.unk0 - sp0.unk4;
        else
            sp14 = -sp0.unk8;
        gBattleMoveDamage = -sp14;
        GetMonNickname(gPartyMenu.pokemon, gStringVar1);
        ConvertIntToDecimalStringN(gStringVar2, sp14, 0, 3);
        if (gTasks[taskId].data[14] == 0)
            StringExpandPlaceholders(gStringVar4, gOtherText_HPRestoredBy);
        else
            StringExpandPlaceholders(gStringVar4, gOtherText_RegainedHealth);
        SetMonIconAnim(GetMonIconSpriteId(gPartyMenu.unk4, gPartyMenu.primarySelectedMonIndex), gPartyMenu.pokemon);
        task_pc_turn_off(&gUnknown_083769A8[IsDoubleBattle() * 12 + gPartyMenu.primarySelectedMonIndex * 2], 7);
        ePartyMenu2.unk261 = 2;
        DisplayPartyMenuMessage(gStringVar4, 1);
        sp14 += sp0.unk4;
        SetMonData(gPartyMenu.pokemon, MON_DATA_HP, &sp14);
        RemoveBagItem(gPartyMenu.secondarySelectedIndex, 1);
        sub_8032638();
        gTasks[taskId].func = sub_806FB44;
    }
    else
    {
        PartyMenuDoPrintHP(gPartyMenu.primarySelectedMonIndex, IsDoubleBattle(), ePartyMenu2.pmUnk282, sp0.unk0);
    }
}

void sub_806FA18(u8 taskId)
{
    struct BattleInterfaceStruct1 sp0;

    ePartyMenu2.pmUnk282 = sub_806F7E8(taskId, &sp0, 1);
    if (ePartyMenu2.pmUnk282 == -1)
    {
        PlaySE(SE_USE_ITEM);
        gPartyMenu.unkC = 0;
        gTasks[taskId].data[11] -= gTasks[taskId].data[12];
        SetMonData(gPartyMenu.pokemon, MON_DATA_HP, &gTasks[taskId].data[11]);
        SetMonIconAnim(GetMonIconSpriteId(gPartyMenu.unk4, ePartyMenu.slotId), gPartyMenu.pokemon);
        gPartyMenu.primarySelectedMonIndex = gSprites[ePartyMenu.slotId2].data[0];
        gPartyMenu.pokemon = &gPlayerParty[gPartyMenu.primarySelectedMonIndex];
        gTasks[taskId].data[10] = GetMonData(gPartyMenu.pokemon, MON_DATA_MAX_HP);
        gTasks[taskId].data[11] = GetMonData(gPartyMenu.pokemon, MON_DATA_HP);
        gPartyMenu.unkC = -32768;
        gPartyMenu.unk14 = gPartyMenu.unk10;
        gTasks[taskId].func = sub_806F8AC;
        ePartyMenu2.pmUnk282 = gTasks[taskId].data[11];
    }
    else
    {
        PartyMenuDoPrintHP(gPartyMenu.primarySelectedMonIndex, IsDoubleBattle(), ePartyMenu2.pmUnk282, sp0.unk0);
    }
}

void sub_806FB0C(u8 taskId)
{
    if (gPartyMenuMessage_IsPrinting == 0)
    {
        gTasks[gPartyMenu.unk4].func = gPartyMenu.unk10;
        DestroyTask(taskId);
    }
}

void sub_806FB44(u8 taskId)
{
    if (gPartyMenuMessage_IsPrinting == 0)
    {
        gTasks[gPartyMenu.unk4].func = gPartyMenu.unk14;
        DestroyTask(taskId);
    }
}

bool8 IsHPRecoveryItem(u16 item)
{
    const u8 *itemEffect;

    if (item == ITEM_ENIGMA_BERRY)
        itemEffect = gSaveBlock1.enigmaBerry.itemEffect;
    else
        itemEffect = gItemEffectTable[item - ITEM_POTION];

    if (itemEffect[4] & 4)
        return TRUE;
    else
        return FALSE;
}

void PartyMenuUpdateLevelOrStatus(struct Pokemon *pkmn, u8 monIndex)
{
    PartyMenuClearLevelStatusTilemap(monIndex);
    PartyMenuPrintMonLevelOrStatus(monIndex, pkmn);
}

void GetMedicineItemEffectMessage(u16 item)
{
    switch (GetItemEffectType(item))
    {
    case 3:
        StringExpandPlaceholders(gStringVar4, gOtherText_CuredPoisoning);
        break;
    case 4:
        StringExpandPlaceholders(gStringVar4, gOtherText_WokeUp);
        break;
    case 5:
        StringExpandPlaceholders(gStringVar4, gOtherText_BurnHealed);
        break;
    case 6:
        StringExpandPlaceholders(gStringVar4, gOtherText_ThawedOut);
        break;
    case 7:
        StringExpandPlaceholders(gStringVar4, gOtherText_CuredParalysis);
        break;
    case 8:
        StringExpandPlaceholders(gStringVar4, gOtherText_SnapConfusion);
        break;
    case 9:
        StringExpandPlaceholders(gStringVar4, gOtherText_GotOverLove);
        break;
    case 11:
        StringExpandPlaceholders(gStringVar4, gOtherText_BecameHealthy);
        break;
    case 13:
        StringCopy(gStringVar2, gOtherText_Hp2);
        StringExpandPlaceholders(gStringVar4, gOtherText_WasRaised);
        break;
    case 12:
        StringCopy(gStringVar2, gOtherText_Attack);
        StringExpandPlaceholders(gStringVar4, gOtherText_WasRaised);
        break;
    case 17:
        StringCopy(gStringVar2, gOtherText_Defense);
        StringExpandPlaceholders(gStringVar4, gOtherText_WasRaised);
        break;
    case 16:
        StringCopy(gStringVar2, gOtherText_Speed);
        StringExpandPlaceholders(gStringVar4, gOtherText_WasRaised);
        break;
    case 14:
        StringCopy(gStringVar2, gOtherText_SpAtk2);
        StringExpandPlaceholders(gStringVar4, gOtherText_WasRaised);
        break;
    case 15:
        StringCopy(gStringVar2, gOtherText_SpDef2);
        StringExpandPlaceholders(gStringVar4, gOtherText_WasRaised);
        break;
    case 19:
    case 20:
        StringExpandPlaceholders(gStringVar4, gOtherText_PPIncreased);
        break;
    case 21:
        StringExpandPlaceholders(gStringVar4, gOtherText_PPRestored);
        break;
    default:
        StringExpandPlaceholders(gStringVar4, gOtherText_WontHaveAnyEffect);
        break;
    }
}

bool8 IsMedicineIneffective(struct Pokemon *pkmn, u16 item)
{
    if (GetItemEffectType(item) == 13
     && GetMonData(pkmn, MON_DATA_SPECIES) == SPECIES_SHEDINJA)
        return TRUE;
    else
        return FALSE;
}

bool8 ExecuteTableBasedItemEffect__(u8 monIndex, u16 item, u8 moveIndex)
{
    if (gMain.inBattle)
        return ExecuteTableBasedItemEffect_(&gPlayerParty[monIndex], item, sub_8094C20(monIndex), moveIndex);
    else
        return ExecuteTableBasedItemEffect_(&gPlayerParty[monIndex], item, monIndex, moveIndex);
}

void UseMedicine(u8 taskId, u16 item, TaskFunc func)
{
    u8 r7;
    bool8 r9 = FALSE;
    bool8 r0;

    gTasks[taskId].func = TaskDummy;
    r7 = CreateTask(TaskDummy, 5);
    sub_806E8D0(taskId, item, func);
    if (!IsMedicineIneffective(gPartyMenu.pokemon, item))
    {
        r9 = IsHPRecoveryItem(item);
        if (r9 == TRUE)
        {
            gTasks[r7].data[10] = GetMonData(gPartyMenu.pokemon, MON_DATA_MAX_HP);
            gTasks[r7].data[11] = GetMonData(gPartyMenu.pokemon, MON_DATA_HP);
            if (gTasks[r7].data[10] == gTasks[r7].data[11])
            {
                r9 = FALSE;
                gTasks[r7].data[10] = 0;
                gTasks[r7].data[11] = 0;
            }
        }
        r0 = ExecuteTableBasedItemEffect__(gPartyMenu.primarySelectedMonIndex, item, 0);
    }
    else
    {
        r0 = TRUE;
    }

    if (r0)
    {
        gUnknown_0202E8F4 = 0;
        PlaySE(SE_SELECT);
        DisplayPartyMenuMessage(gOtherText_WontHaveAnyEffect, 1);
        gTasks[r7].func = sub_806FB0C;
    }
    else
    {
        u8 statusAndPkrs;

        gUnknown_0202E8F4 = 1;
        if (!IsBlueYellowRedFlute(item))
            PlaySE(SE_USE_ITEM);
        else
            PlaySE(SE_GLASS_FLUTE);
        statusAndPkrs = GetMonStatusAndPokerus(gPartyMenu.pokemon);
        if (statusAndPkrs == STATUS_PRIMARY_POKERUS || statusAndPkrs == STATUS_PRIMARY_NONE)
            PartyMenuUpdateLevelOrStatus(gPartyMenu.pokemon, gPartyMenu.primarySelectedMonIndex);
        if (r9 == TRUE)
        {
            gTasks[r7].data[12] = GetMonData(gPartyMenu.pokemon, MON_DATA_HP) - gTasks[r7].data[11];
            gPartyMenu.unkC = -32768;
            if (gTasks[r7].data[11] == 0)
                gTasks[r7].data[14] = 1;
            else
                gTasks[r7].data[14] = 0;
            gPartyMenu.unk14 = gPartyMenu.unk10;
            gTasks[r7].func = sub_806F8AC;
            ePartyMenu2.pmUnk282 = gTasks[r7].data[11];
        }
        else
        {
            GetMonNickname(gPartyMenu.pokemon, gStringVar1);
            if (!IsBlueYellowRedFlute(item))
                RemoveBagItem(item, 1);
            GetMedicineItemEffectMessage(item);
            TryPrintPartyMenuMonNickname(gPartyMenu.primarySelectedMonIndex, gPartyMenu.pokemon);
            DisplayPartyMenuMessage(gStringVar4, 1);
            gTasks[r7].func = sub_806FB0C;
        }
    }
}

bool8 IsBlueYellowRedFlute(u16 item)
{
    if (item == ITEM_BLUE_FLUTE
     || item == ITEM_RED_FLUTE
     || item == ITEM_YELLOW_FLUTE)
        return TRUE;
    else
        return FALSE;
}

void DoSacredAshItemEffect(u8 taskId, u16 item, TaskFunc func)
{
    gPartyMenu.unk10 = func;
    gPartyMenu.unk4 = taskId;
    gPartyMenu.secondarySelectedIndex = item;
    gPartyMenu.primarySelectedMonIndex = 0;
    gPartyMenu.unk14 = sub_80701DC;
    ePartyMenu2.pmUnk27E = 0;
    ePartyMenu2.pmUnk280 = 0;
    sub_8070088(taskId);
}

void sub_8070088(u8 taskId)
{
    u8 taskId2;

    gTasks[taskId].func = TaskDummy;
    if (GetMonData(&gPlayerParty[gPartyMenu.primarySelectedMonIndex], MON_DATA_SPECIES) == SPECIES_NONE)
    {
        gTasks[taskId].func = sub_80701DC;
    }
    else
    {
        s16 *taskData;

        taskId2 = CreateTask(TaskDummy, 5);
        taskData = gTasks[taskId2].data;
        gPartyMenu.pokemon = &gPlayerParty[gPartyMenu.primarySelectedMonIndex];
        taskData[10] = GetMonData(gPartyMenu.pokemon, MON_DATA_MAX_HP);
        taskData[11] = GetMonData(gPartyMenu.pokemon, MON_DATA_HP);
        if (ExecuteTableBasedItemEffect__(gPartyMenu.primarySelectedMonIndex, gPartyMenu.secondarySelectedIndex, 0))
        {
            DestroyTask(taskId2);
            gTasks[taskId].func = sub_80701DC;
        }
        else
        {
            gUnknown_0202E8F4 = 1;
            Menu_EraseWindowRect(WINDOW_LEFT, 14, WINDOW_RIGHT, 19);
            PlaySE(SE_USE_ITEM);
            PartyMenuUpdateLevelOrStatus(gPartyMenu.pokemon, gPartyMenu.primarySelectedMonIndex);
            task_pc_turn_off(&gUnknown_083769A8[IsDoubleBattle() * 12 + gPartyMenu.primarySelectedMonIndex * 2], 9);
            ePartyMenu2.unk261 = 2;
            taskData[12] = GetMonData(gPartyMenu.pokemon, MON_DATA_HP) - taskData[11];
            taskData[14] = 1;
            ePartyMenu2.pmUnk27E = 1;
            ePartyMenu2.pmUnk280 = 1;
            ePartyMenu2.pmUnk282 = taskData[11];
            gPartyMenu.unkC = -32768;
            gTasks[taskId2].func = sub_806F8AC;
        }
    }
}

void sub_80701DC(u8 taskId)
{
    if (ePartyMenu2.pmUnk27E == 1)
    {
        AddBagItem(gPartyMenu.secondarySelectedIndex, 1);
        if (GetMonData(&gPlayerParty[gPartyMenu.primarySelectedMonIndex], MON_DATA_SPECIES) != 0)
        {
            task_pc_turn_off(&gUnknown_083769A8[IsDoubleBattle() * 12 + gPartyMenu.primarySelectedMonIndex * 2], 3);
            ePartyMenu2.unk261 = 2;
        }
        ePartyMenu2.pmUnk27E = 0;
    }
    gPartyMenu.primarySelectedMonIndex++;
    if (gPartyMenu.primarySelectedMonIndex == 6)
    {
        gUnknown_0202E8F4 = 0;
        if (ePartyMenu2.pmUnk280 == 0)
        {
            gTasks[taskId].func = TaskDummy;
            DisplayPartyMenuMessage(gOtherText_WontHaveAnyEffect, 1);
            CreateTask(sub_806FB0C, 8);
        }
        else
        {
            RemoveBagItem(gPartyMenu.secondarySelectedIndex, 1);
            gTasks[taskId].func = gPartyMenu.unk10;
        }
        gLastFieldPokeMenuOpened = 0;
    }
    else
    {
        sub_8070088(taskId);
    }
}

void CreateItemUseMoveMenu(u8 partyMonIndex)
{
    u8 r6;
    u8 i;

    r6 = 0;
    Menu_DrawStdWindowFrame(19, 10, 29, 19);
    for (i = 0; i < 4; i++)
    {
        u16 move = GetMonData(&gPlayerParty[partyMonIndex], MON_DATA_MOVE1 + i);

        Menu_PrintText(gMoveNames[move], 20, i * 2 + 11);
        if (move != 0)
            r6++;
    }
    InitMenu(0, 20, 11, r6, 0, 9);
}

void Task_HandleItemUseMoveMenuInput(u8 taskId)
{
    if (gMain.newKeys & DPAD_UP)
    {
        PlaySE(SE_SELECT);
        Menu_MoveCursor(-1);
    }
    else if (gMain.newKeys & DPAD_DOWN)
    {
        PlaySE(SE_SELECT);
        Menu_MoveCursor(1);
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        gUnknown_08376B54[0](taskId);
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_SELECT);
        gUnknown_08376B54[1](taskId);
    }
}

void DoPPRecoveryItemEffect(u8 taskId, u16 item, TaskFunc c)
{
    const u8 *itemEffect;
    u8 taskId2;

    if (item == ITEM_ENIGMA_BERRY)
        itemEffect = gSaveBlock1.enigmaBerry.itemEffect;
    else
        itemEffect = gItemEffectTable[item - ITEM_POTION];
    gTasks[taskId].func = TaskDummy;
    taskId2 = CreateTask(TaskDummy, 5);
    sub_806E8D0(taskId, item, c);
    if (!(itemEffect[4] & 0x10))
    {
        gTasks[taskId2].data[11] = 0;
        DoRecoverPP(taskId2);
    }
    else
    {
        PlaySE(SE_SELECT);
        PrintPartyMenuPromptText(10, 3);
        CreateItemUseMoveMenu(gPartyMenu.primarySelectedMonIndex);
        gTasks[taskId2].func = Task_HandleItemUseMoveMenuInput;
        gMain.newKeys = 0;
    }
}

void ItemUseMoveMenu_HandleMoveSelection(u8 taskId)
{
    Menu_DestroyCursor();
    Menu_EraseWindowRect(19, 10, 29, 19);
    PartyMenuEraseMsgBoxAndFrame();
    gTasks[taskId].data[11] = Menu_GetCursorPos();
    DoRecoverPP(taskId);
}

void ItemUseMoveMenu_HandleCancel(u8 taskId)
{
    Menu_DestroyCursor();
    Menu_EraseWindowRect(19, 10, 29, 19);
    if (gMain.inBattle)
        gTasks[gPartyMenu.unk4].func = HandleBattlePartyMenu;
    else
        gTasks[gPartyMenu.unk4].func = sub_808B0C0;
    PrintPartyMenuPromptText(3, 0);
    DestroyTask(taskId);
}

void DoRecoverPP(u8 taskId)
{
    u16 r5 = 0;

    if (ExecuteTableBasedItemEffect__(gPartyMenu.primarySelectedMonIndex, gPartyMenu.secondarySelectedIndex, gTasks[taskId].data[11]))
    {
        gUnknown_0202E8F4 = 0;
        PlaySE(SE_SELECT);
        DisplayPartyMenuMessage(gOtherText_WontHaveAnyEffect, 1);
    }
    else
    {
        gUnknown_0202E8F4 = 1;
        PlaySE(SE_USE_ITEM);
        RemoveBagItem(gPartyMenu.secondarySelectedIndex, 1);
        r5 = GetMonData(gPartyMenu.pokemon, MON_DATA_MOVE1 + gTasks[taskId].data[11]);
        StringCopy(gStringVar1, gMoveNames[r5]);
        GetMedicineItemEffectMessage(gPartyMenu.secondarySelectedIndex);
        DisplayPartyMenuMessage(gStringVar4, 1);
    }
    gTasks[taskId].func = sub_806FB0C;
}

void DoPPUpItemEffect(u8 taskId, u16 b, TaskFunc c)
{
    gTasks[taskId].func = TaskDummy;
    sub_806E8D0(taskId, b, c);
    PlaySE(SE_SELECT);
    PrintPartyMenuPromptText(11, 3);
    CreateItemUseMoveMenu(gPartyMenu.primarySelectedMonIndex);
    CreateTask(Task_HandleItemUseMoveMenuInput, 5);
    gMain.newKeys = 0;
}

static const u8 *const StatNames[] =
{
    gOtherText_HP,
    gOtherText_Attack,
    gOtherText_Defense,
    gOtherText_SpAtk,
    gOtherText_SpDef,
    gOtherText_Speed,
};

static const u8 StatDataTypes[] =
{
    MON_DATA_MAX_HP,
    MON_DATA_ATK,
    MON_DATA_DEF,
    MON_DATA_SPATK,
    MON_DATA_SPDEF,
    MON_DATA_SPEED,
};

#if DEBUG

const u8 gUnknown_Debug_839B6CE[] = {0x40, 0, 0, 0, 0x44, 0, 0xFF, 0, 0, 0};

const u8 gUnknown_Debug_839B6D8[] = _(
    "{STR_VAR_1}かい　じっこう\n"
    "{STR_VAR_2}たんいじかん　しょうひ");

#endif

void DoRareCandyItemEffect(u8 taskId, u16 item, TaskFunc c)
{
    u8 i;
    bool8 noEffect;

    gTasks[taskId].func = TaskDummy;
    sub_806E8D0(taskId, item, c);

    if (GetMonData(gPartyMenu.pokemon, MON_DATA_LEVEL) != 100)
    {
        for (i = 0; i < NUM_STATS; i++)
            ePartyMenu2.pmStatGrowths[i] = GetMonData(gPartyMenu.pokemon, StatDataTypes[i]);
        noEffect = ExecuteTableBasedItemEffect__(gPartyMenu.primarySelectedMonIndex, item, 0);
    }
    else
        noEffect = TRUE;

    if (noEffect)
    {
        gUnknown_0202E8F4 = 0;
        PlaySE(SE_SELECT);
        DisplayPartyMenuMessage(gOtherText_WontHaveAnyEffect, 1);
        CreateTask(sub_806FB0C, 5);
    }
    else
    {
        u8 level;

        gUnknown_0202E8F4 = 1;
        PlayFanfareByFanfareNum(0);
        RedrawPokemonInfoInMenu(gPartyMenu.primarySelectedMonIndex, gPartyMenu.pokemon);
        RemoveBagItem(item, 1);
        GetMonNickname(gPartyMenu.pokemon, gStringVar1);
        level = GetMonData(gPartyMenu.pokemon, MON_DATA_LEVEL);
        ConvertIntToDecimalStringN(gStringVar2, level, 0, 3);
        StringExpandPlaceholders(gStringVar4, gOtherText_ElevatedTo);
        DisplayPartyMenuMessage(gStringVar4, 1);
        CreateTask(Task_RareCandy1, 5);
    }
}

void Task_RareCandy1(u8 taskId)
{
    if (WaitFanfare(0) && gPartyMenuMessage_IsPrinting == 0)
    {
        if ((gMain.newKeys & A_BUTTON) || (gMain.newKeys & B_BUTTON))
        {
            PlaySE(SE_SELECT);
            PrintStatGrowthsInLevelUpWindow(taskId);
            gTasks[taskId].func = Task_RareCandy2;
        }
    }
}

void Task_RareCandy2(u8 taskId)
{
    if ((gMain.newKeys & A_BUTTON) || (gMain.newKeys & B_BUTTON))
    {
        PlaySE(SE_SELECT);
        PrintNewStatsInLevelUpWindow(taskId);
        gTasks[taskId].func = Task_RareCandy3;
    }
}

void PrintStatGrowthsInLevelUpWindow(u8 taskId)
{
    u8 i;

    Menu_DrawStdWindowFrame(11, 0, 29, 7);

    for (i = 0; i < NUM_STATS; i++)
    {
        u8 x;
        u8 y;
        u32 stat;
#if GERMAN
        u8 *ptr;
#endif

        stat = GetMonData(gPartyMenu.pokemon, StatDataTypes[i]);

        ePartyMenu2.pmStatGrowths[i + NUM_STATS] = stat;
        ePartyMenu2.pmStatGrowths[i] = stat - ePartyMenu2.pmStatGrowths[i];

        x = (i / 3) * 9 + 11;
        y = ((i % 3) << 1) + 1;

#if GERMAN
        ptr = StringCopy(gStringVar1, StatNames[i]);
        *ptr++ = EXT_CTRL_CODE_BEGIN;
        *ptr++ = 0x13;
        *ptr++ = 0x2E;
        ptr = StringCopy(ptr, gOtherText_TallPlusAndRightArrow);
        *ptr++ = EXT_CTRL_CODE_BEGIN;
        *ptr++ = 0x13;
        *ptr++ = 0x34;
        ConvertIntToDecimalStringN(ptr, ePartyMenu2.pmStatGrowths[i], 1, 2);
        Menu_PrintText(gStringVar1, x + 1, y);
#else
        Menu_PrintTextPixelCoords(StatNames[i], (x + 1) * 8, y * 8, 1);
        if (i == 2)
            Menu_PrintTextPixelCoords(gOtherText_TallPlusAndRightArrow, (x + 6) * 8 + 6, y * 8, 0);
        else
            Menu_PrintTextPixelCoords(gOtherText_TallPlusAndRightArrow, (x + 6) * 8 + 6, y * 8, 1);
        gStringVar1[0] = EXT_CTRL_CODE_BEGIN;
        gStringVar1[1] = 0x14;
        gStringVar1[2] = 0x06;
        ConvertIntToDecimalStringN(gStringVar1 + 3, ePartyMenu2.pmStatGrowths[i], 1, 2);
        Menu_PrintTextPixelCoords(gStringVar1, (x + 6) * 8 + 12, y * 8, 0);
#endif
    }
}

void PrintNewStatsInLevelUpWindow(u8 taskId)
{
    u8 i;

    for (i = 0; i < NUM_STATS; i++)
    {
        u8 x;
        u8 y;
        u32 stat;
        u32 newStatIndex;

        stat = GetMonData(gPartyMenu.pokemon, StatDataTypes[i]);
        newStatIndex = i + 6;
        ePartyMenu2.pmStatGrowths[newStatIndex] = stat;

        x = ((i / 3) * 9) + 11;
        y = ((i % 3) << 1) + 1;

        gStringVar1[0] = EXT_CTRL_CODE_BEGIN;
        gStringVar1[1] = 0x14;
        gStringVar1[2] = 0x06;

        ConvertIntToDecimalStringN(gStringVar1 + 3, ePartyMenu2.pmStatGrowths[newStatIndex], 1, 3);
        Menu_PrintTextPixelCoords(gStringVar1, (x + 6) * 8 + 6, y * 8, 0);
    }
}

void RedrawPokemonInfoInMenu(u8 monIndex, struct Pokemon *pokemon)
{
    u8 statusAndPkrs = GetMonStatusAndPokerus(pokemon);
    u8 icon;

    if (statusAndPkrs == STATUS_PRIMARY_NONE || statusAndPkrs == STATUS_PRIMARY_POKERUS)
        PartyMenuUpdateLevelOrStatus(pokemon, monIndex);

    PartyMenuDoPrintHP(monIndex, IsDoubleBattle(), GetMonData(pokemon, MON_DATA_HP), GetMonData(pokemon, MON_DATA_MAX_HP));
    PartyMenuTryDrawHPBar(monIndex, pokemon);

    icon = GetMonIconSpriteId(gPartyMenu.unk4, monIndex);
    SetMonIconAnim(icon, pokemon);

    task_pc_turn_off(&gUnknown_083769A8[IsDoubleBattle() * 12 + monIndex * 2], 7);
    ePartyMenu2.unk261 = 2;
}

void Task_RareCandy3(u8 taskId)
{
    if (WaitFanfare(0))
    {
        if ((gMain.newKeys & A_BUTTON) || (gMain.newKeys & B_BUTTON))
        {
            u16 learnedMove;
            u16 evolutionSpecies;

            Menu_EraseWindowRect(11, 0, 29, 7);

            learnedMove = MonTryLearningNewMove(gPartyMenu.pokemon, TRUE);
            ePartyMenu2.pmUnk282 = 1;

            switch (learnedMove)
            {
            case 0:
                // No move is learned.
                evolutionSpecies = GetEvolutionTargetSpecies(gPartyMenu.pokemon, 0, 0);
                if (evolutionSpecies != 0)
                {
                    gCB2_AfterEvolution = sub_80A53F8;
                    BeginEvolutionScene(gPartyMenu.pokemon, evolutionSpecies, TRUE, gPartyMenu.primarySelectedMonIndex);
                    DestroyTask(taskId);
                }
                else
                {
                    sub_8070D90(taskId);
                }
                break;
            case 0xFFFF:
                // Mon already knows 4 moves.
                GetMonNickname(gPartyMenu.pokemon, gStringVar1);
                StringCopy(gStringVar2, gMoveNames[gMoveToLearn]);

                StringExpandPlaceholders(gStringVar4, gOtherText_WantsToLearn);
                DisplayPartyMenuMessage(gStringVar4, 1);

                gPartyMenu.unk8 = gMoveToLearn;
                gTasks[taskId].func = sub_806F358;
                break;
            case 0xFFFE:
                // Move was already known by the mon.
                gTasks[taskId].func = TeachMonMoveInPartyMenu;
                break;
            default:
                // Mon automatically learned a move because it knew less than four moves.
                GetMonNickname(gPartyMenu.pokemon, gStringVar1);
                StringCopy(gStringVar2, gMoveNames[learnedMove]);

                StringExpandPlaceholders(gStringVar4, gOtherText_LearnedMove);
                DisplayPartyMenuMessage(gStringVar4, 1);

                gTasks[taskId].func = Task_TeamMonTMMove3;
                break;
            }
        }
    }
}

void TeachMonMoveInPartyMenu(u8 taskId)
{
    u16 learnedMove;
    u16 evolutionSpecies;

    learnedMove = MonTryLearningNewMove(gPartyMenu.pokemon, FALSE);
    switch (learnedMove)
    {
    case 0:
        // No move is learned.
        evolutionSpecies = GetEvolutionTargetSpecies(gPartyMenu.pokemon, 0, 0);
        if (evolutionSpecies != 0)
        {
            gCB2_AfterEvolution = sub_80A53F8;
            BeginEvolutionScene(gPartyMenu.pokemon, evolutionSpecies, TRUE, gPartyMenu.primarySelectedMonIndex);
            DestroyTask(taskId);
        }
        else
        {
            sub_8070D90(taskId);
        }
        break;
    case 0xFFFF:
        // Mon already knows 4 moves.
        GetMonNickname(gPartyMenu.pokemon, gStringVar1);
        StringCopy(gStringVar2, gMoveNames[gMoveToLearn]);

        StringExpandPlaceholders(gStringVar4, gOtherText_WantsToLearn);
        DisplayPartyMenuMessage(gStringVar4, 1);

        gPartyMenu.unk8 = gMoveToLearn;
        gTasks[taskId].func = sub_806F358;
        break;
    case 0xFFFE:
        // Move was already known by the mon. Go on the the next move to be learned.
        TeachMonMoveInPartyMenu(taskId);
        break;
    default:
        // Mon automatically learned a move because it knew less than four moves.
        GetMonNickname(gPartyMenu.pokemon, gStringVar1);
        StringCopy(gStringVar2, gMoveNames[learnedMove]);

        StringExpandPlaceholders(gStringVar4, gOtherText_LearnedMove);
        DisplayPartyMenuMessage(gStringVar4, 1);

        gTasks[taskId].func = Task_TeamMonTMMove3;
        break;
    }
}

static void sub_8070D90(u8 taskId)
{
    gTasks[gPartyMenu.unk4].func = gPartyMenu.unk10;
    DestroyTask(taskId);
}

void DoEvolutionStoneItemEffect(u8 taskId, u16 evolutionStoneItem, TaskFunc c)
{
    PlaySE(SE_SELECT);

    gTasks[taskId].func = TaskDummy;
    sub_806E8D0(taskId, evolutionStoneItem, c);

    gCB2_AfterEvolution = sub_80A53F8;

    if (ExecuteTableBasedItemEffect__(gPartyMenu.primarySelectedMonIndex, evolutionStoneItem, 0))
    {
        gUnknown_0202E8F4 = 0;
        DisplayPartyMenuMessage(gOtherText_WontHaveAnyEffect, 1);

        CreateTask(sub_806FB0C, 5);
    }
    else
    {
        RemoveBagItem(evolutionStoneItem, 1);
    }
}

u8 GetItemEffectType(u16 item)
{
    const u8 *itemEffect;
    u32 statusCure;

#ifdef UBFIX
    // Enforces that the item ID is within the bounds of gItemEffectTable.
    // In the retail ROM, the otherwise situation will never arise.
    // Nevertheless, GameFreak added this sanity check in FireRed.
    if (!ITEM_HAS_EFFECT(item))
        return ITEM_EFFECT_NONE;
#endif

    // Read the item's effect properties.
    if (item == ITEM_ENIGMA_BERRY)
        itemEffect = gSaveBlock1.enigmaBerry.itemEffect;
    else
        itemEffect = gItemEffectTable[item - ITEM_POTION];

    if ((itemEffect[0] & (ITEM0_DIRE_HIT | ITEM0_X_ATTACK)) || itemEffect[1] || itemEffect[2] || (itemEffect[3] & ITEM3_GUARD_SPEC))
        return ITEM_EFFECT_X_ITEM;
    else if (itemEffect[0] & ITEM0_SACRED_ASH)
        return ITEM_EFFECT_SACRED_ASH;
    else if (itemEffect[3] & ITEM3_LEVEL_UP)
        return ITEM_EFFECT_RAISE_LEVEL;

    statusCure = itemEffect[3] & ITEM3_STATUS_ALL;
    if (statusCure || (itemEffect[0] >> 7))
    {
        if (statusCure == ITEM3_SLEEP)
            return ITEM_EFFECT_CURE_SLEEP;
        else if (statusCure == ITEM3_POISON)
            return ITEM_EFFECT_CURE_POISON;
        else if (statusCure == ITEM3_BURN)
            return ITEM_EFFECT_CURE_BURN;
        else if (statusCure == ITEM3_FREEZE)
            return ITEM_EFFECT_CURE_FREEZE;
        else if (statusCure == ITEM3_PARALYSIS)
            return ITEM_EFFECT_CURE_PARALYSIS;
        else if (statusCure == ITEM3_CONFUSION)
            return ITEM_EFFECT_CURE_CONFUSION;
        else if (itemEffect[0] >> 7 && !statusCure)
            return ITEM_EFFECT_CURE_INFATUATION;
        else
            return ITEM_EFFECT_CURE_ALL_STATUS;
    }

    if (itemEffect[4] & (ITEM4_REVIVE | ITEM4_HEAL_HP))
        return ITEM_EFFECT_HEAL_HP;
    else if (itemEffect[4] & ITEM4_EV_ATK)
        return ITEM_EFFECT_ATK_EV;
    else if (itemEffect[4] & ITEM4_EV_HP)
        return ITEM_EFFECT_HP_EV;
    else if (itemEffect[5] & ITEM5_EV_SPATK)
        return ITEM_EFFECT_SPATK_EV;
    else if (itemEffect[5] & ITEM5_EV_SPDEF)
        return ITEM_EFFECT_SPDEF_EV;
    else if (itemEffect[5] & ITEM5_EV_SPEED)
        return ITEM_EFFECT_SPEED_EV;
    else if (itemEffect[5] & ITEM5_EV_DEF)
        return ITEM_EFFECT_DEF_EV;
    else if (itemEffect[4] & ITEM4_EVO_STONE)
        return ITEM_EFFECT_EVO_STONE;
    else if (itemEffect[4] & ITEM4_PP_UP)
        return ITEM_EFFECT_PP_UP;
    else if (itemEffect[5] & ITEM5_PP_MAX)
        return ITEM_EFFECT_PP_MAX;
    else if (itemEffect[4] & (ITEM4_HEAL_PP | ITEM4_HEAL_PP_ONE))
        return ITEM_EFFECT_HEAL_PP;
    else
        return ITEM_EFFECT_NONE;
}

// Maybe this goes in start_menu.c
#if !DEBUG
void unref_sub_8070F90(void)
{
    FlagSet(FLAG_SYS_POKEDEX_GET);
    FlagSet(FLAG_SYS_POKEMON_GET);
    FlagSet(FLAG_SYS_POKENAV_GET);
}
#endif
