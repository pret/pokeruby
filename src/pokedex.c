#include "global.h"
#include "gba/m4a_internal.h"
#include "pokedex.h"
#include "battle.h"
#include "data2.h"
#include "decompress.h"
#include "event_data.h"
#include "graphics.h"
#include "m4a.h"
#include "main.h"
#include "menu.h"
#include "menu_cursor.h"
#include "palette.h"
#include "pokedex_area_screen.h"
#include "pokedex_cry_screen.h"
#include "pokemon.h"
#include "random.h"
#include "overworld.h"
#include "constants/songs.h"
#include "sound.h"
#include "constants/species.h"
#include "string_util.h"
#include "strings.h"
#include "task.h"
#include "trig.h"
#include "scanline_effect.h"
#include "ewram.h"

struct PokedexListItem
{
    u16 dexNum;
    u16 seen:1;
    u16 owned:1;
};

struct PokedexView
{
    struct PokedexListItem pokedexList[NATIONAL_DEX_COUNT + 1];
    u16 pokemonListCount;
    u16 selectedPokemon;
    u16 selectedPokemonBackup;
    u16 dexMode;
    u16 dexModeBackup;
    u16 dexOrder;
    u16 dexOrderBackup;
    u16 seenCount;
    u16 ownCount;
    u16 monSpriteIds[4];
    u16 selectedMonSpriteId;
    s16 pokeBallRotationStep;
    s16 pokeBallRotationBackup;
    u8 pokeBallRotation;
    u8 initialVOffset;
    u8 scrollTimer;
    u8 scrollDirection;
    s16 listVOffset;
    s16 listMovingVOffset;
    s16 scrollMonIncrement;
    s16 maxScrollTimer;
    u16 scrollSpeed;
    u16 unk63A[4]; // Cleared, never read
    u8 unk642[8];
    u8 currentPage;
    u8 currentPageBackup;
    u8 isSearchResults:1;
    u8 selectedScreen;
    u8 descriptionPageNum;
    u8 screenSwitchState;
    u8 menuIsOpen;
    u16 menuCursorPos;
    s16 menuY;     //Menu Y position (inverted because we use REG_BG0VOFS for this)
    u8 unk656[8]; // Cleared, never read
    u8 unk65E[8]; // Cleared, never read
};

enum
{
    DEX_MODE_HOENN,
    DEX_MODE_NATIONAL
};

enum
{
    PAGE_SCREEN,
    AREA_SCREEN,
    CRY_SCREEN,
    SIZE_SCREEN
};

struct SearchOptionText
{
    const u8 *description;
    const u8 *title;
};

struct SearchOption
{
    const struct SearchOptionText *texts;
    u8 taskDataCursorPos;
    u8 taskDataScrollOffset;
    u16 numOptions;
};

struct SearchMenuTopBarItem
{
    const u8 *text;
    u8 highlightX;
    u8 highlightY;
    u8 highlightWidth;
};

struct SearchMenuItem
{
    const u8 *text;
    u8 titleBgX;
    u8 titleBgY;
    u8 titleBgWidth;
    u8 selectionBgX;
    u8 selectionBgY;
    u8 selectionBgWidth;
};

extern struct MusicPlayerInfo gMPlayInfo_BGM;
extern u8 gReservedSpritePaletteCount;
extern struct SpriteTemplate gCreatingSpriteTemplate;
extern u8 gDexCryScreenState;
extern const u8 gPokedexMenu_Gfx[];
extern const u8 gUnknown_08E96738[];
extern const u8 gPokedexStartMenuMain_Tilemap[];
extern const u8 gPokedexStartMenuSearchResults_Tilemap[];
extern const u8 gUnknown_08E9C6DC[];
extern const u8 gUnknown_08E96BD4[];
extern const u8 gPokedexScreenSelectBarMain_Tilemap[];
extern const u8 gPokedexScreenSelectBarSubmenu_Tilemap[];
extern const u16 gPokedexMenu_Pal[];
extern const u16 gPokedexMenu2_Pal[];
extern const struct CompressedSpriteSheet gTrainerFrontPicTable[];
extern const struct MonCoords gTrainerFrontPicCoords[];
extern const struct PokedexEntry gPokedexEntries[];
extern const u8 gPokedexMenuSearch_Gfx[];
extern const u8 gPokedexMenuSearch_Tilemap[];
extern const u16 gPokedexMenuSearch_Pal[];
extern const u8 gTypeNames[][7];
extern const u8 gPokedexMenu2_Gfx[];

static EWRAM_DATA struct PokedexView *gPokedexView = NULL;
static EWRAM_DATA u16 sLastSelectedPokemon = 0;
static EWRAM_DATA u8 sPokeBallRotation = 0;
static EWRAM_DATA struct PokedexListItem *sPokedexListItem = NULL;

u8 gUnusedPokedexU8;
IntrCallback gPokedexVBlankCB;

static u8 LoadSearchMenu(void);

static const u16 sPokedexSearchPalette[] = INCBIN_U16("graphics/pokedex/search.gbapal");
static const u16 sNationalPokedexPalette[] = INCBIN_U16("graphics/pokedex/national.gbapal");
const u8 gEmptySpacce_839F7FC[0xA4] = {0};
static const u8 gUnknown_0839F8A0[] = INCBIN_U8("graphics/pokedex/pokedex_cry_layout.bin.lz");
static const u8 gUnknown_0839F988[] = INCBIN_U8("graphics/pokedex/pokedex_size_layout.bin.lz");
#if ENGLISH
static const u8 gUnknown_0839FA7C[] = INCBIN_U8("graphics/pokedex/noball.4bpp.lz");
#elif GERMAN
extern const u8 gUnknown_0839FA7C[];
#endif

#include "data/pokedex_orders.h"
static const struct OamData gOamData_83A0404 =
{
    .y = 160,
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
static const struct OamData gOamData_83A040C =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 1,
    .x = 0,
    .matrixNum = 0,
    .size = 0,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};
static const struct OamData gOamData_83A0414 =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 1,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};
static const struct OamData gOamData_83A041C =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 2,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 2,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};
static const struct OamData gOamData_83A0424 =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 1,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};
static const struct OamData gOamData_83A042C =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 2,
    .x = 0,
    .matrixNum = 0,
    .size = 0,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};
static const union AnimCmd gSpriteAnim_83A0434[] =
{
    ANIMCMD_FRAME(3, 30),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_83A043C[] =
{
    ANIMCMD_FRAME(1, 30),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_83A0444[] =
{
    ANIMCMD_FRAME(16, 30),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_83A044C[] =
{
    ANIMCMD_FRAME(32, 30),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_83A0454[] =
{
    ANIMCMD_FRAME(64, 30),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_83A045C[] =
{
    ANIMCMD_FRAME(96, 30),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_83A0464[] =
{
    ANIMCMD_FRAME(128, 30),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_83A046C[] =
{
    ANIMCMD_FRAME(160, 30),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_83A0474[] =
{
    ANIMCMD_FRAME(192, 30),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_83A047C[] =
{
    ANIMCMD_FRAME(224, 30),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_83A0484[] =
{
    ANIMCMD_FRAME(226, 30),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_83A048C[] =
{
    ANIMCMD_FRAME(228, 30),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_83A0494[] =
{
    ANIMCMD_FRAME(230, 30),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_83A049C[] =
{
    ANIMCMD_FRAME(232, 30),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_83A04A4[] =
{
    ANIMCMD_FRAME(234, 30),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_83A04AC[] =
{
    ANIMCMD_FRAME(236, 30),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_83A04B4[] =
{
    ANIMCMD_FRAME(238, 30),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_83A04BC[] =
{
    ANIMCMD_FRAME(240, 30),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_83A04C4[] =
{
    ANIMCMD_FRAME(242, 30),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_83A04CC[] =
{
    ANIMCMD_FRAME(4, 30),
    ANIMCMD_END,
};
static const union AnimCmd *const gSpriteAnimTable_83A04D4[] =
{
    gSpriteAnim_83A0434,
};
static const union AnimCmd *const gSpriteAnimTable_83A04D8[] =
{
    gSpriteAnim_83A043C,
};
static const union AnimCmd *const gSpriteAnimTable_83A04DC[] =
{
    gSpriteAnim_83A0444,
};
static const union AnimCmd *const gSpriteAnimTable_83A04E0[] =
{
    gSpriteAnim_83A044C,
    gSpriteAnim_83A0454,
    gSpriteAnim_83A045C,
    gSpriteAnim_83A0464,
};
static const union AnimCmd *const gSpriteAnimTable_83A04F0[] =
{
    gSpriteAnim_83A046C,
    gSpriteAnim_83A0474,
};
static const union AnimCmd *const gSpriteAnimTable_83A04F8[] =
{
    gSpriteAnim_83A047C,
    gSpriteAnim_83A0484,
    gSpriteAnim_83A048C,
    gSpriteAnim_83A0494,
    gSpriteAnim_83A049C,
    gSpriteAnim_83A04A4,
    gSpriteAnim_83A04AC,
    gSpriteAnim_83A04B4,
    gSpriteAnim_83A04BC,
    gSpriteAnim_83A04C4,
};
static const union AnimCmd *const gSpriteAnimTable_83A0520[] =
{
    gSpriteAnim_83A04CC,
};
static void SpriteCB_Scrollbar(struct Sprite *);
static const struct SpriteTemplate gSpriteTemplate_83A0524 =
{
    .tileTag = 4096,
    .paletteTag = 4096,
    .oam = &gOamData_83A0404,
    .anims = gSpriteAnimTable_83A04D4,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_Scrollbar,
};
static void SpriteCB_ScrollArrow(struct Sprite *);
static const struct SpriteTemplate sScrollArrowSpriteTemplate =
{
    .tileTag = 4096,
    .paletteTag = 4096,
    .oam = &gOamData_83A040C,
    .anims = gSpriteAnimTable_83A04D8,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_ScrollArrow,
};
static void SpriteCB_DexListInterfaceText(struct Sprite *);
static const struct SpriteTemplate gSpriteTemplate_83A0554 =
{
    .tileTag = 4096,
    .paletteTag = 4096,
    .oam = &gOamData_83A0414,
    .anims = gSpriteAnimTable_83A04E0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_DexListInterfaceText,
};
static void SpriteCB_RotatingPokeBall(struct Sprite *);
static const struct SpriteTemplate gSpriteTemplate_83A056C =
{
    .tileTag = 4096,
    .paletteTag = 4096,
    .oam = &gOamData_83A041C,
    .anims = gSpriteAnimTable_83A04DC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_RotatingPokeBall,
};
static void SpriteCB_SeenOwnInfo(struct Sprite *);
static const struct SpriteTemplate gSpriteTemplate_83A0584 =
{
    .tileTag = 4096,
    .paletteTag = 4096,
    .oam = &gOamData_83A0424,
    .anims = gSpriteAnimTable_83A04F0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_SeenOwnInfo,
};
static const struct SpriteTemplate gSpriteTemplate_83A059C =
{
    .tileTag = 4096,
    .paletteTag = 4096,
    .oam = &gOamData_83A042C,
    .anims = gSpriteAnimTable_83A04F8,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_SeenOwnInfo,
};
static void SpriteCB_DexListStartMenuCursor(struct Sprite *);
static const struct SpriteTemplate gSpriteTemplate_83A05B4 =
{
    .tileTag = 4096,
    .paletteTag = 4096,
    .oam = &gOamData_83A042C,
    .anims = gSpriteAnimTable_83A0520,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_DexListStartMenuCursor,
};
static const struct CompressedSpriteSheet sInterfaceSpriteSheet[] =
{
    {gPokedexMenu2_Gfx, 0x1F00, 0x1000},
    {NULL, 0, 0},
};
static const struct SpritePalette sInterfaceSpritePalette[] =
{
    {gPokedexMenu_Pal, 0x1000},
    {NULL, 0},
};
static const u8 gUnknown_083A05EC[] = {2, 4, 8, 16, 32};
static const u8 gUnknown_083A05F1[] = {16, 8, 4, 2, 1};
const u8 gEmptySpacce_83A05F6[] = {0, 0};  // Padding, maybe?
static const u8 gUnknown_083A05F8[] = _("");
#if ENGLISH
#include "data/pokedex_entries_en.h"
#elif GERMAN
#include "data/pokedex_entries_de.h"
#endif
static const u16 sSizeScreenSilhouette_Pal[16] = {0};
static const u8 *const sMonFootprintTable[] =
{
    gMonFootprint_Bulbasaur,
    gMonFootprint_Bulbasaur,
    gMonFootprint_Ivysaur,
    gMonFootprint_Venusaur,
    gMonFootprint_Charmander,
    gMonFootprint_Charmeleon,
    gMonFootprint_Charizard,
    gMonFootprint_Squirtle,
    gMonFootprint_Wartortle,
    gMonFootprint_Blastoise,
    gMonFootprint_Caterpie,
    gMonFootprint_Metapod,
    gMonFootprint_Butterfree,
    gMonFootprint_Weedle,
    gMonFootprint_Kakuna,
    gMonFootprint_Beedrill,
    gMonFootprint_Pidgey,
    gMonFootprint_Pidgeotto,
    gMonFootprint_Pidgeot,
    gMonFootprint_Rattata,
    gMonFootprint_Raticate,
    gMonFootprint_Spearow,
    gMonFootprint_Fearow,
    gMonFootprint_Ekans,
    gMonFootprint_Arbok,
    gMonFootprint_Pikachu,
    gMonFootprint_Raichu,
    gMonFootprint_Sandshrew,
    gMonFootprint_Sandslash,
    gMonFootprint_NidoranF,
    gMonFootprint_Nidorina,
    gMonFootprint_Nidoqueen,
    gMonFootprint_NidoranM,
    gMonFootprint_Nidorino,
    gMonFootprint_Nidoking,
    gMonFootprint_Clefairy,
    gMonFootprint_Clefable,
    gMonFootprint_Vulpix,
    gMonFootprint_Ninetales,
    gMonFootprint_Jigglypuff,
    gMonFootprint_Wigglytuff,
    gMonFootprint_Zubat,
    gMonFootprint_Golbat,
    gMonFootprint_Oddish,
    gMonFootprint_Gloom,
    gMonFootprint_Vileplume,
    gMonFootprint_Paras,
    gMonFootprint_Parasect,
    gMonFootprint_Venonat,
    gMonFootprint_Venomoth,
    gMonFootprint_Diglett,
    gMonFootprint_Dugtrio,
    gMonFootprint_Meowth,
    gMonFootprint_Persian,
    gMonFootprint_Psyduck,
    gMonFootprint_Golduck,
    gMonFootprint_Mankey,
    gMonFootprint_Primeape,
    gMonFootprint_Growlithe,
    gMonFootprint_Arcanine,
    gMonFootprint_Poliwag,
    gMonFootprint_Poliwhirl,
    gMonFootprint_Poliwrath,
    gMonFootprint_Abra,
    gMonFootprint_Kadabra,
    gMonFootprint_Alakazam,
    gMonFootprint_Machop,
    gMonFootprint_Machoke,
    gMonFootprint_Machamp,
    gMonFootprint_Bellsprout,
    gMonFootprint_Weepinbell,
    gMonFootprint_Victreebel,
    gMonFootprint_Tentacool,
    gMonFootprint_Tentacruel,
    gMonFootprint_Geodude,
    gMonFootprint_Graveler,
    gMonFootprint_Golem,
    gMonFootprint_Ponyta,
    gMonFootprint_Rapidash,
    gMonFootprint_Slowpoke,
    gMonFootprint_Slowbro,
    gMonFootprint_Magnemite,
    gMonFootprint_Magneton,
    gMonFootprint_Farfetchd,
    gMonFootprint_Doduo,
    gMonFootprint_Dodrio,
    gMonFootprint_Seel,
    gMonFootprint_Dewgong,
    gMonFootprint_Grimer,
    gMonFootprint_Muk,
    gMonFootprint_Shellder,
    gMonFootprint_Cloyster,
    gMonFootprint_Gastly,
    gMonFootprint_Haunter,
    gMonFootprint_Gengar,
    gMonFootprint_Onix,
    gMonFootprint_Drowzee,
    gMonFootprint_Hypno,
    gMonFootprint_Krabby,
    gMonFootprint_Kingler,
    gMonFootprint_Voltorb,
    gMonFootprint_Electrode,
    gMonFootprint_Exeggcute,
    gMonFootprint_Exeggutor,
    gMonFootprint_Cubone,
    gMonFootprint_Marowak,
    gMonFootprint_Hitmonlee,
    gMonFootprint_Hitmonchan,
    gMonFootprint_Lickitung,
    gMonFootprint_Koffing,
    gMonFootprint_Weezing,
    gMonFootprint_Rhyhorn,
    gMonFootprint_Rhydon,
    gMonFootprint_Chansey,
    gMonFootprint_Tangela,
    gMonFootprint_Kangaskhan,
    gMonFootprint_Horsea,
    gMonFootprint_Seadra,
    gMonFootprint_Goldeen,
    gMonFootprint_Seaking,
    gMonFootprint_Staryu,
    gMonFootprint_Starmie,
    gMonFootprint_Mrmime,
    gMonFootprint_Scyther,
    gMonFootprint_Jynx,
    gMonFootprint_Electabuzz,
    gMonFootprint_Magmar,
    gMonFootprint_Pinsir,
    gMonFootprint_Tauros,
    gMonFootprint_Magikarp,
    gMonFootprint_Gyarados,
    gMonFootprint_Lapras,
    gMonFootprint_Ditto,
    gMonFootprint_Eevee,
    gMonFootprint_Vaporeon,
    gMonFootprint_Jolteon,
    gMonFootprint_Flareon,
    gMonFootprint_Porygon,
    gMonFootprint_Omanyte,
    gMonFootprint_Omastar,
    gMonFootprint_Kabuto,
    gMonFootprint_Kabutops,
    gMonFootprint_Aerodactyl,
    gMonFootprint_Snorlax,
    gMonFootprint_Articuno,
    gMonFootprint_Zapdos,
    gMonFootprint_Moltres,
    gMonFootprint_Dratini,
    gMonFootprint_Dragonair,
    gMonFootprint_Dragonite,
    gMonFootprint_Mewtwo,
    gMonFootprint_Mew,
    gMonFootprint_Chikorita,
    gMonFootprint_Bayleef,
    gMonFootprint_Meganium,
    gMonFootprint_Cyndaquil,
    gMonFootprint_Quilava,
    gMonFootprint_Typhlosion,
    gMonFootprint_Totodile,
    gMonFootprint_Croconaw,
    gMonFootprint_Feraligatr,
    gMonFootprint_Sentret,
    gMonFootprint_Furret,
    gMonFootprint_Hoothoot,
    gMonFootprint_Noctowl,
    gMonFootprint_Ledyba,
    gMonFootprint_Ledian,
    gMonFootprint_Spinarak,
    gMonFootprint_Ariados,
    gMonFootprint_Crobat,
    gMonFootprint_Chinchou,
    gMonFootprint_Lanturn,
    gMonFootprint_Pichu,
    gMonFootprint_Cleffa,
    gMonFootprint_Igglybuff,
    gMonFootprint_Togepi,
    gMonFootprint_Togetic,
    gMonFootprint_Natu,
    gMonFootprint_Xatu,
    gMonFootprint_Mareep,
    gMonFootprint_Flaaffy,
    gMonFootprint_Ampharos,
    gMonFootprint_Bellossom,
    gMonFootprint_Marill,
    gMonFootprint_Azumarill,
    gMonFootprint_Sudowoodo,
    gMonFootprint_Politoed,
    gMonFootprint_Hoppip,
    gMonFootprint_Skiploom,
    gMonFootprint_Jumpluff,
    gMonFootprint_Aipom,
    gMonFootprint_Sunkern,
    gMonFootprint_Sunflora,
    gMonFootprint_Yanma,
    gMonFootprint_Wooper,
    gMonFootprint_Quagsire,
    gMonFootprint_Espeon,
    gMonFootprint_Umbreon,
    gMonFootprint_Murkrow,
    gMonFootprint_Slowking,
    gMonFootprint_Misdreavus,
    gMonFootprint_Unown,
    gMonFootprint_Wobbuffet,
    gMonFootprint_Girafarig,
    gMonFootprint_Pineco,
    gMonFootprint_Forretress,
    gMonFootprint_Dunsparce,
    gMonFootprint_Gligar,
    gMonFootprint_Steelix,
    gMonFootprint_Snubbull,
    gMonFootprint_Granbull,
    gMonFootprint_Qwilfish,
    gMonFootprint_Scizor,
    gMonFootprint_Shuckle,
    gMonFootprint_Heracross,
    gMonFootprint_Sneasel,
    gMonFootprint_Teddiursa,
    gMonFootprint_Ursaring,
    gMonFootprint_Slugma,
    gMonFootprint_Magcargo,
    gMonFootprint_Swinub,
    gMonFootprint_Piloswine,
    gMonFootprint_Corsola,
    gMonFootprint_Remoraid,
    gMonFootprint_Octillery,
    gMonFootprint_Delibird,
    gMonFootprint_Mantine,
    gMonFootprint_Skarmory,
    gMonFootprint_Houndour,
    gMonFootprint_Houndoom,
    gMonFootprint_Kingdra,
    gMonFootprint_Phanpy,
    gMonFootprint_Donphan,
    gMonFootprint_Porygon2,
    gMonFootprint_Stantler,
    gMonFootprint_Smeargle,
    gMonFootprint_Tyrogue,
    gMonFootprint_Hitmontop,
    gMonFootprint_Smoochum,
    gMonFootprint_Elekid,
    gMonFootprint_Magby,
    gMonFootprint_Miltank,
    gMonFootprint_Blissey,
    gMonFootprint_Raikou,
    gMonFootprint_Entei,
    gMonFootprint_Suicune,
    gMonFootprint_Larvitar,
    gMonFootprint_Pupitar,
    gMonFootprint_Tyranitar,
    gMonFootprint_Lugia,
    gMonFootprint_HoOh,
    gMonFootprint_Celebi,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_Treecko,
    gMonFootprint_Grovyle,
    gMonFootprint_Sceptile,
    gMonFootprint_Torchic,
    gMonFootprint_Combusken,
    gMonFootprint_Blaziken,
    gMonFootprint_Mudkip,
    gMonFootprint_Marshtomp,
    gMonFootprint_Swampert,
    gMonFootprint_Poochyena,
    gMonFootprint_Mightyena,
    gMonFootprint_Zigzagoon,
    gMonFootprint_Linoone,
    gMonFootprint_Wurmple,
    gMonFootprint_Silcoon,
    gMonFootprint_Beautifly,
    gMonFootprint_Cascoon,
    gMonFootprint_Dustox,
    gMonFootprint_Lotad,
    gMonFootprint_Lombre,
    gMonFootprint_Ludicolo,
    gMonFootprint_Seedot,
    gMonFootprint_Nuzleaf,
    gMonFootprint_Shiftry,
    gMonFootprint_Nincada,
    gMonFootprint_Ninjask,
    gMonFootprint_Shedinja,
    gMonFootprint_Taillow,
    gMonFootprint_Swellow,
    gMonFootprint_Shroomish,
    gMonFootprint_Breloom,
    gMonFootprint_Spinda,
    gMonFootprint_Wingull,
    gMonFootprint_Pelipper,
    gMonFootprint_Surskit,
    gMonFootprint_Masquerain,
    gMonFootprint_Wailmer,
    gMonFootprint_Wailord,
    gMonFootprint_Skitty,
    gMonFootprint_Delcatty,
    gMonFootprint_Kecleon,
    gMonFootprint_Baltoy,
    gMonFootprint_Claydol,
    gMonFootprint_Nosepass,
    gMonFootprint_Torkoal,
    gMonFootprint_Sableye,
    gMonFootprint_Barboach,
    gMonFootprint_Whiscash,
    gMonFootprint_Luvdisc,
    gMonFootprint_Corphish,
    gMonFootprint_Crawdaunt,
    gMonFootprint_Feebas,
    gMonFootprint_Milotic,
    gMonFootprint_Carvanha,
    gMonFootprint_Sharpedo,
    gMonFootprint_Trapinch,
    gMonFootprint_Vibrava,
    gMonFootprint_Flygon,
    gMonFootprint_Makuhita,
    gMonFootprint_Hariyama,
    gMonFootprint_Electrike,
    gMonFootprint_Manectric,
    gMonFootprint_Numel,
    gMonFootprint_Camerupt,
    gMonFootprint_Spheal,
    gMonFootprint_Sealeo,
    gMonFootprint_Walrein,
    gMonFootprint_Cacnea,
    gMonFootprint_Cacturne,
    gMonFootprint_Snorunt,
    gMonFootprint_Glalie,
    gMonFootprint_Lunatone,
    gMonFootprint_Solrock,
    gMonFootprint_Azurill,
    gMonFootprint_Spoink,
    gMonFootprint_Grumpig,
    gMonFootprint_Plusle,
    gMonFootprint_Minun,
    gMonFootprint_Mawile,
    gMonFootprint_Meditite,
    gMonFootprint_Medicham,
    gMonFootprint_Swablu,
    gMonFootprint_Altaria,
    gMonFootprint_Wynaut,
    gMonFootprint_Duskull,
    gMonFootprint_Dusclops,
    gMonFootprint_Roselia,
    gMonFootprint_Slakoth,
    gMonFootprint_Vigoroth,
    gMonFootprint_Slaking,
    gMonFootprint_Gulpin,
    gMonFootprint_Swalot,
    gMonFootprint_Tropius,
    gMonFootprint_Whismur,
    gMonFootprint_Loudred,
    gMonFootprint_Exploud,
    gMonFootprint_Clamperl,
    gMonFootprint_Huntail,
    gMonFootprint_Gorebyss,
    gMonFootprint_Absol,
    gMonFootprint_Shuppet,
    gMonFootprint_Banette,
    gMonFootprint_Seviper,
    gMonFootprint_Zangoose,
    gMonFootprint_Relicanth,
    gMonFootprint_Aron,
    gMonFootprint_Lairon,
    gMonFootprint_Aggron,
    gMonFootprint_Castform,
    gMonFootprint_Volbeat,
    gMonFootprint_Illumise,
    gMonFootprint_Lileep,
    gMonFootprint_Cradily,
    gMonFootprint_Anorith,
    gMonFootprint_Armaldo,
    gMonFootprint_Ralts,
    gMonFootprint_Kirlia,
    gMonFootprint_Gardevoir,
    gMonFootprint_Bagon,
    gMonFootprint_Shelgon,
    gMonFootprint_Salamence,
    gMonFootprint_Beldum,
    gMonFootprint_Metang,
    gMonFootprint_Metagross,
    gMonFootprint_Regirock,
    gMonFootprint_Regice,
    gMonFootprint_Registeel,
    gMonFootprint_Kyogre,
    gMonFootprint_Groudon,
    gMonFootprint_Rayquaza,
    gMonFootprint_Latias,
    gMonFootprint_Latios,
    gMonFootprint_Jirachi,
    gMonFootprint_Deoxys,
    gMonFootprint_Chimecho,
    gMonFootprint_Bulbasaur,
};
static const u8 sText_ClearTo0[] = _("{CLEAR_TO 0}");
const u8 gUnknown_083B555C[] = INCBIN_U8("graphics/unknown/unknown_3B555C.bin");
static const struct OamData sOamData_MonOrTrainerPic =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};

static void *const sMonOrTrainerPicDecompressDestPtrs[] =
{
    ePokedexGraphicsBuffer + 0x0000,
    ePokedexGraphicsBuffer + 0x4000,
    ePokedexGraphicsBuffer + 0x8000,
    ePokedexGraphicsBuffer + 0xC000,
};

static const struct SpriteFrameImage sSpriteFrameImages_MonOrTrainerPic_0[] =
{
    {ePokedexGraphicsBuffer + 0x0000, 0x800},
    {ePokedexGraphicsBuffer + 0x0800, 0x800},
    {ePokedexGraphicsBuffer + 0x1000, 0x800},
    {ePokedexGraphicsBuffer + 0x1800, 0x800},
    {ePokedexGraphicsBuffer + 0x2000, 0x800},
    {ePokedexGraphicsBuffer + 0x2800, 0x800},
    {ePokedexGraphicsBuffer + 0x3000, 0x800},
    {ePokedexGraphicsBuffer + 0x3800, 0x800},
    {ePokedexGraphicsBuffer + 0x4000, 0x800},
    {ePokedexGraphicsBuffer + 0x4800, 0x800},
    {ePokedexGraphicsBuffer + 0x5000, 0x800},
    {ePokedexGraphicsBuffer + 0x5800, 0x800},
    {ePokedexGraphicsBuffer + 0x6000, 0x800},
    {ePokedexGraphicsBuffer + 0x6800, 0x800},
    {ePokedexGraphicsBuffer + 0x7000, 0x800},
    {ePokedexGraphicsBuffer + 0x7800, 0x800},
};

static const struct SpriteFrameImage sSpriteFrameImages_MonOrTrainerPic_1[] =
{
    {ePokedexGraphicsBuffer + 0x4000, 0x800},
    {ePokedexGraphicsBuffer + 0x4800, 0x800},
    {ePokedexGraphicsBuffer + 0x5000, 0x800},
    {ePokedexGraphicsBuffer + 0x5800, 0x800},
    {ePokedexGraphicsBuffer + 0x6000, 0x800},
    {ePokedexGraphicsBuffer + 0x6800, 0x800},
    {ePokedexGraphicsBuffer + 0x7000, 0x800},
    {ePokedexGraphicsBuffer + 0x7800, 0x800},
    {ePokedexGraphicsBuffer + 0x8000, 0x800},
    {ePokedexGraphicsBuffer + 0x8800, 0x800},
    {ePokedexGraphicsBuffer + 0x9000, 0x800},
    {ePokedexGraphicsBuffer + 0x9800, 0x800},
    {ePokedexGraphicsBuffer + 0xA000, 0x800},
    {ePokedexGraphicsBuffer + 0xA800, 0x800},
    {ePokedexGraphicsBuffer + 0xB000, 0x800},
    {ePokedexGraphicsBuffer + 0xB800, 0x800},
};

static const struct SpriteFrameImage sSpriteFrameImages_MonOrTrainerPic_2[] =
{
    {ePokedexGraphicsBuffer + 0x8000, 0x800},
    {ePokedexGraphicsBuffer + 0x8800, 0x800},
    {ePokedexGraphicsBuffer + 0x9000, 0x800},
    {ePokedexGraphicsBuffer + 0x9800, 0x800},
    {ePokedexGraphicsBuffer + 0xA000, 0x800},
    {ePokedexGraphicsBuffer + 0xA800, 0x800},
    {ePokedexGraphicsBuffer + 0xB000, 0x800},
    {ePokedexGraphicsBuffer + 0xB800, 0x800},
    {ePokedexGraphicsBuffer + 0xC000, 0x800},
    {ePokedexGraphicsBuffer + 0xC800, 0x800},
    {ePokedexGraphicsBuffer + 0xD000, 0x800},
    {ePokedexGraphicsBuffer + 0xD800, 0x800},
    {ePokedexGraphicsBuffer + 0xE000, 0x800},
    {ePokedexGraphicsBuffer + 0xE800, 0x800},
    {ePokedexGraphicsBuffer + 0xF000, 0x800},
    {ePokedexGraphicsBuffer + 0xF800, 0x800},
};

static const struct SpriteFrameImage sSpriteFrameImages_MonOrTrainerPic_3[] =
{
    {ePokedexGraphicsBuffer + 0xC000, 0x800},
    {ePokedexGraphicsBuffer + 0xC800, 0x800},
    {ePokedexGraphicsBuffer + 0xD000, 0x800},
    {ePokedexGraphicsBuffer + 0xD800, 0x800},
    {ePokedexGraphicsBuffer + 0xE000, 0x800},
    {ePokedexGraphicsBuffer + 0xE800, 0x800},
    {ePokedexGraphicsBuffer + 0xF000, 0x800},
    {ePokedexGraphicsBuffer + 0xF800, 0x800},
    // UB: may overlap ePokedexView1-4
    {ePokedexGraphicsBuffer + 0x10000, 0x800},
    {ePokedexGraphicsBuffer + 0x10800, 0x800},
    {ePokedexGraphicsBuffer + 0x11000, 0x800},
    {ePokedexGraphicsBuffer + 0x11800, 0x800},
    {ePokedexGraphicsBuffer + 0x12000, 0x800},
    {ePokedexGraphicsBuffer + 0x12800, 0x800},
    {ePokedexGraphicsBuffer + 0x13000, 0x800},
    {ePokedexGraphicsBuffer + 0x13800, 0x800},
};

static const struct SpriteFrameImage *const sSpriteFrameImages_MonOrTrainerPic[] =
{
    sSpriteFrameImages_MonOrTrainerPic_0,
    sSpriteFrameImages_MonOrTrainerPic_1,
    sSpriteFrameImages_MonOrTrainerPic_2,
    sSpriteFrameImages_MonOrTrainerPic_3,
};

static void _SpriteCB_Dummy(struct Sprite *);

static const struct SpriteTemplate sMonOrTrainerPicSpriteTemplate =
{
    .tileTag = 0xFFFF,
    .paletteTag = 0,
    .oam = &sOamData_MonOrTrainerPic,
    .anims = NULL,
    .images = sSpriteFrameImages_MonOrTrainerPic_0,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = _SpriteCB_Dummy,
};

// First character in range followed by number of characters in range for upper and lowercase
static const u8 sLetterSearchRanges[][4] =
{
    {0,      0, 0,      0},
    {CHAR_A, 3, CHAR_a, 3},
    {CHAR_D, 3, CHAR_d, 3},
    {CHAR_G, 3, CHAR_g, 3},
    {CHAR_J, 3, CHAR_j, 3},
    {CHAR_M, 3, CHAR_m, 3},
    {CHAR_P, 3, CHAR_p, 3},
    {CHAR_S, 3, CHAR_s, 3},
    {CHAR_V, 3, CHAR_v, 3},
    {CHAR_Y, 2, CHAR_y, 2},
};
static const struct SearchMenuTopBarItem sSearchMenuTopBarItems[] =
{
    {DexText_SearchForPoke, 0,  0, 5},
    {DexText_SwitchDex,     6,  0, 5},
    {DexText_ReturnToDex,  12,  0, 5},
};
static const struct SearchMenuItem sSearchMenuItems[] =
{
    {DexText_ListByABC,           0,  2,  5,  5,  2, 12},
    {DexText_ListByColor,         0,  4,  5,  5,  4, 12},
    {DexText_ListByType,          0,  6,  5,  5,  6,  6},
    {DexText_ListByType,          0,  6,  5, 11,  6,  6},
    {DexText_SelectDexList,       0,  8,  5,  5,  8, 12},
    {DexText_SelectDexMode,       0, 10,  5,  5, 10, 12},
    {DexText_ExecuteSearchSwitch, 0, 12,  5,  0,  0,  0},
};
static const u8 sSearchMovementMap_SearchNatDex[][4] =
{
    {0xFF, 0xFF, 0xFF,    1},
    {0xFF, 0xFF,    0,    2},
    {0xFF,    3,    1,    4},
    {   2, 0xFF,    1,    4},
    {0xFF, 0xFF,    2,    5},
    {0xFF, 0xFF,    4,    6},
    {0xFF, 0xFF,    5, 0xFF},
};
static const u8 sSearchMovementMap_ShiftNatDex[][4] =
{
    {0xFF, 0xFF, 0xFF, 0xFF},
    {0xFF, 0xFF, 0xFF, 0xFF},
    {0xFF, 0xFF, 0xFF, 0xFF},
    {0xFF, 0xFF, 0xFF, 0xFF},
    {0xFF, 0xFF, 0xFF,    5},
    {0xFF, 0xFF,    4,    6},
    {0xFF, 0xFF,    5, 0xFF},
};
static const u8 sSearchMovementMap_SearchHoennDex[][4] =
{
    {0xFF, 0xFF, 0xFF,    1},
    {0xFF, 0xFF,    0,    2},
    {0xFF,    3,    1,    4},
    {   2, 0xFF,    1,    4},
    {0xFF, 0xFF,    2,    6},
    {0xFF, 0xFF, 0xFF, 0xFF},
    {0xFF, 0xFF,    4, 0xFF},
};
static const u8 sSearchMovementMap_ShiftHoennDex[][4] =
{
    {0xFF, 0xFF, 0xFF, 0xFF},
    {0xFF, 0xFF, 0xFF, 0xFF},
    {0xFF, 0xFF, 0xFF, 0xFF},
    {0xFF, 0xFF, 0xFF, 0xFF},
    {0xFF, 0xFF, 0xFF,    6},
    {0xFF, 0xFF, 0xFF, 0xFF},
    {0xFF, 0xFF,    4, 0xFF},
};
static const struct SearchOptionText sDexModeOptions[] =
{
    {DexText_HoennDex2,    DexText_HoennDex},
    {DexText_NationalDex2, DexText_NationalDex},
    {NULL, NULL},
};
static const struct SearchOptionText sDexOrderOptions[] =
{
    {DexText_ListByNumber,          DexText_NumericalMode},
    {DexText_ListByABC2,            DexText_ABCMode},
    {DexText_ListByHeavyToLightest, DexText_HeaviestMode},
    {DexText_ListByLightToHeaviest, DexText_LightestMode},
    {DexText_ListByTallToSmallest,  DexText_TallestMode},
    {DexText_ListBySmallToTallest,  DexText_SmallestMode},
    {NULL, NULL},
};
static const struct SearchOptionText sDexSearchNameOptions[] =
{
    {DexText_Terminator5, DexText_DontSpecify},
    {DexText_Terminator5, DexText_ABC},
    {DexText_Terminator5, DexText_DEF},
    {DexText_Terminator5, DexText_GHI},
    {DexText_Terminator5, DexText_JKL},
    {DexText_Terminator5, DexText_MNO},
    {DexText_Terminator5, DexText_PQR},
    {DexText_Terminator5, DexText_STU},
    {DexText_Terminator5, DexText_VWX},
    {DexText_Terminator5, DexText_YZ},
    {NULL, NULL},
};
static const struct SearchOptionText sDexSearchColorOptions[] =
{
    {DexText_Terminator5, DexText_DontSpecify},
    {DexText_Terminator5, DexText_Red},
    {DexText_Terminator5, DexText_Blue},
    {DexText_Terminator5, DexText_Yellow},
    {DexText_Terminator5, DexText_Green},
    {DexText_Terminator5, DexText_Black},
    {DexText_Terminator5, DexText_Brown},
    {DexText_Terminator5, DexText_Purple},
    {DexText_Terminator5, DexText_Gray},
    {DexText_Terminator5, DexText_White},
    {DexText_Terminator5, DexText_Pink},
    {NULL, NULL},
};
static const struct SearchOptionText sDexSearchTypeOptions[] =
{
    {DexText_Terminator5, DexText_None},
    {DexText_Terminator5, gTypeNames[TYPE_NORMAL]},
    {DexText_Terminator5, gTypeNames[TYPE_FIGHTING]},
    {DexText_Terminator5, gTypeNames[TYPE_FLYING]},
    {DexText_Terminator5, gTypeNames[TYPE_POISON]},
    {DexText_Terminator5, gTypeNames[TYPE_GROUND]},
    {DexText_Terminator5, gTypeNames[TYPE_ROCK]},
    {DexText_Terminator5, gTypeNames[TYPE_BUG]},
    {DexText_Terminator5, gTypeNames[TYPE_GHOST]},
    {DexText_Terminator5, gTypeNames[TYPE_STEEL]},
    {DexText_Terminator5, gTypeNames[TYPE_FIRE]},
    {DexText_Terminator5, gTypeNames[TYPE_WATER]},
    {DexText_Terminator5, gTypeNames[TYPE_GRASS]},
    {DexText_Terminator5, gTypeNames[TYPE_ELECTRIC]},
    {DexText_Terminator5, gTypeNames[TYPE_PSYCHIC]},
    {DexText_Terminator5, gTypeNames[TYPE_ICE]},
    {DexText_Terminator5, gTypeNames[TYPE_DRAGON]},
    {DexText_Terminator5, gTypeNames[TYPE_DARK]},
    {NULL, NULL},
};
static const u8 sPokedexModes[] = {0, 1};
static const u8 sOrderOptions[] = {0, 1, 2, 3, 4, 5};
static const u8 sDexSearchTypeIds[] = {0xFF, 0, 1, 2, 3, 4, 5, 6, 7, 8, 10, 11, 12, 13, 14, 15, 16, 17};
static const struct SearchOption sSearchOptions[] =
{
    { sDexSearchNameOptions,  6,  7, 10},
    { sDexSearchColorOptions,  8,  9, 11},
    { sDexSearchTypeOptions, 10, 11, 18},
    { sDexSearchTypeOptions, 12, 13, 18},
    { sDexOrderOptions,  4,  5,  6},
    { sDexModeOptions,  2,  3,  2},
};
static const u8 gUnknown_083B5AAC[] = _("{STR_VAR_1}{CLEAR_TO 43}");
static const u8 gUnknown_083B5AB2[] = _("{STR_VAR_1}{CLEAR_TO 96}");

static void MainCB(void);
static void Task_PokedexShowMainScreen(u8 taskId);
static void Task_PokedexMainScreen(u8 taskId);
static void Task_WaitForScroll(u8 taskId);
static void Task_PokedexMainScreenMenu(u8 taskId);
static void Task_OpenInfoScreenAfterMonMovement(u8 taskId);
static void Task_WaitForExitInfoScreen(u8 taskId);
static void Task_WaitForExitSearch(u8 taskId);
static void Task_ClosePokedex(u8 taskId);
static void Task_OpenSearchResults(u8 taskId);
static void Task_PokedexResultsScreen(u8 taskId);
static void Task_WaitForSearchResultsScroll(u8 taskId);
static void Task_PokedexResultsScreenMenu(u8 taskId);
static void Task_OpenSearchResultsInfoScreenAfterMonMovement(u8 taskId);
static void Task_WaitForExitSearchResultsInfoScreen(u8 taskId);
static void Task_PokedexResultsScreenReturnToMainScreen(u8 taskId);
static void Task_PokedexResultsScreenExitPokedex(u8 taskId);
static bool8 LoadPokedexListPage(u8 a);
static void LoadPokedexBgPalette(void);
static void SortPokedex(u8 dexMode, u8 sortMode);
static void CreateMonDexNum(u16 entryNum, u8 x, u8 y, u16 screenBase);
static void CreateCaughtBall(u16 owned, u8 x, u8 y, u16 screenBase);
static u8 CreateMonName(u16 num, u8 b, u8 c);
static void ClearMonListEntry(u8 x, u8 y, u16 screenBase);
static void CreateMonSpritesAtPos(u16 selectedMon, u16 b);
static bool8 UpdateDexListScroll(u8 direction, u8 monMoveIncrement, u8 scrollTimerMax);
static u16 TryDoPokedexScroll(u16 a, u16 b);
static void UpdateSelectedMonSpriteId(void);
static u8 TryDoInfoScreenScroll(void);
static u8 ClearMonSprites(void);
static u16 GetPokemonSpriteToDisplay(u16 species);
static u32 CreatePokedexMonSprite(u16 num, s16 x, s16 y);
static void CreateInterfaceSprites(u8 a);
static void SpriteCB_MoveMonForInfoScreen(struct Sprite *sprite);
static void SpriteCB_PokedexListMonSprite(struct Sprite *sprite);
static u8 LoadInfoScreen(struct PokedexListItem *, u8);
static bool8 IsInfoScreenScrolling(u8 taskId);
static u8 sub_808F284(struct PokedexListItem *, u8);
static void Task_InitPageScreenMultistep(u8 taskId);
static void Task_PageScreenProcessInput(u8 taskId);
static void Task_LoadInfoScreenWaitForFade(u8 taskId);
static void Task_ClosePageScreen(u8 taskId);
static void Task_InitAreaScreenMultistep(u8 taskId);
static void Task_AreaScreenProcessInput(u8 taskId);
static void sub_808FA00(u8 taskId);
static void Task_InitCryScreenMultistep(u8 taskId);
static void Task_CryScreenProcessInput(u8 taskId);
static void Task_SwitchScreensFromCryScreen(u8 taskId);
static void LoadPlayArrowPalette(u8 cryPlaying);
static void Task_InitSizeScreenMultistep(u8 taskId);
static void Task_SizeScreenProcessInput(u8 taskId);
static void Task_SwitchScreensFromSizeScreen(u8 taskId);
static void LoadScreenSelectBarMain(u16 screenBase);
static void LoadScreenSelectBarSubmenu(u16 screenBase);
static void HighlightScreenSelectBarItem(u8 a, u16 b);
static void sub_8090644(u8 a, u16 b);
static void sub_8090750(u8);
static void sub_8090A3C(u8);
static void sub_8090B8C(u8);
static void sub_8090C28(struct Sprite *);
static void sub_8090C68(void);
static void ResetOtherVideoRegisters(u16);
static void PrintEntryScreenDexNum(u16 order, u8, u8);
static u8 PrintEntryScreenSpeciesName(u16 num, u8, u8);
static u8 PrintCryScreenSpeciesName(u16 num, u8, u8, u8);
static void UnusedPrintMonName(const u8 *name, u8, u8);
static void sub_8091458(u16 height, u8 i, u8 i1);
static void sub_8091564(u16 weight, u8 i, u8 i1);
void PrintFootprint(u16 num, u16 b, u16 c);
static void sub_80C0DC0(u16 a, u16 b);
static u16 GetNextPosition(u8 direction, u16 position, u16 min, u16 max);
u16 CreateMonSpriteFromNationalDexNumber(u16 num, s16 x, s16 y, u16 paletteNum);
static void Task_LoadSearchMenu(u8 taskId);
static void Task_SwitchToSearchMenuTopBar(u8 taskId);
static void Task_HandleSearchTopBarInput(u8 taskId);
static void Task_SwitchToSearchMenu(u8 taskId);
static void Task_HandleSearchMenuInput(u8 taskId);
static void Task_StartPokedexSearch(u8 taskId);
static void Task_WaitAndCompleteSearch(u8 taskId);
static void Task_SearchCompleteWaitForInput(u8 taskId);
static void Task_SelectSearchMenuItem(u8 taskId);
static void Task_HandleSearchParameterInput(u8 taskId);
static void Task_ExitSearch(u8 taskId);
static void Task_ExitSearchWaitForFade(u8 taskId);
static void HighlightSelectedSearchTopBarItem(u8 topBarItem);
static void HighlightSelectedSearchMenuItem(u8 topBarItem, u8 menuItem);
static void PrintSelectedSearchParameters(u8 taskId);
static void DrawOrEraseSearchParameterBox(bool8 erase);
static void PrintSearchParameterText(u8 taskId);
static u8 GetSearchModeSelection(u8 taskId, u8 b);
static void SetDefaultSearchModeAndOrder(u8 taskId);
static void CreateSearchParameterScrollArrows(u8 taskId);


void ResetPokedex(void)
{
    u16 i;

    sLastSelectedPokemon = 0;
    sPokeBallRotation = 0x40;
    gUnusedPokedexU8 = 0;
    gSaveBlock2.pokedex.mode = 0;
    gSaveBlock2.pokedex.order = 0;
    gSaveBlock2.pokedex.nationalMagic = 0;
    gSaveBlock2.pokedex.unknown2 = 0;
    gSaveBlock2.pokedex.unownPersonality = 0;
    gSaveBlock2.pokedex.spindaPersonality = 0;
    gSaveBlock2.pokedex.unknown3 = 0;
    DisableNationalPokedex();
    for (i = 0; i < DEX_FLAGS_NO; i++)
    {
        gSaveBlock2.pokedex.owned[i] = 0;
        gSaveBlock2.pokedex.seen[i] = 0;
        gSaveBlock1.dexSeen2[i] = 0;
        gSaveBlock1.dexSeen3[i] = 0;
    }
}

void ResetPokedexScrollPositions(void)
{
    sLastSelectedPokemon = 0;
    sPokeBallRotation = 0x40;
}

static void VBlankCB_Pokedex(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void ClearPokedexView(struct PokedexView *pokedexView)
{
    u16 i;

    for (i = 0; i < NATIONAL_DEX_COUNT; i++)
    {
        pokedexView->pokedexList[i].dexNum |= 0xFFFF;
        pokedexView->pokedexList[i].seen = 0;
        pokedexView->pokedexList[i].owned = 0;
    }
    pokedexView->pokedexList[NATIONAL_DEX_COUNT].dexNum = 0;
    pokedexView->pokedexList[NATIONAL_DEX_COUNT].seen = 0;
    pokedexView->pokedexList[NATIONAL_DEX_COUNT].owned = 0;
    pokedexView->pokemonListCount = 0;
    pokedexView->selectedPokemon = 0;
    pokedexView->selectedPokemonBackup = 0;
    pokedexView->dexMode = 0;
    pokedexView->dexModeBackup = 0;
    pokedexView->dexOrder = 0;
    pokedexView->dexOrderBackup = 0;
    pokedexView->seenCount = 0;
    pokedexView->ownCount = 0;
    for (i = 0; i < 4; i++)
        pokedexView->monSpriteIds[i] |= 0xFFFF;
    pokedexView->pokeBallRotationStep = 0;
    pokedexView->pokeBallRotationBackup = 0;
    pokedexView->pokeBallRotation = 0;
    pokedexView->initialVOffset = 0;
    pokedexView->scrollTimer = 0;
    pokedexView->scrollDirection = 0;
    pokedexView->listVOffset = 0;
    pokedexView->listMovingVOffset = 0;
    pokedexView->scrollMonIncrement = 0;
    pokedexView->maxScrollTimer = 0;
    pokedexView->scrollSpeed = 0;
    for (i = 0; i < 4; i++)
        pokedexView->unk63A[i] = 0;
    pokedexView->currentPage = 0;
    pokedexView->currentPageBackup = 0;
    pokedexView->isSearchResults = FALSE;
    pokedexView->selectedScreen = 0;
    pokedexView->screenSwitchState = 0;
    pokedexView->menuIsOpen = 0;
    pokedexView->menuCursorPos = 0;
    pokedexView->menuY = 0;
    for (i = 0; i < 8; i++)
        pokedexView->unk656[i] = 0;
    for (i = 0; i < 8; i++)
        pokedexView->unk65E[i] = 0;
}

void CB2_InitPokedex(void)
{
    switch (gMain.state)
    {
    case 0:
    default:
        SetVBlankCallback(NULL);
        ResetOtherVideoRegisters(0);
        DmaFill16Large(3, 0, (void *)(VRAM + 0x0), VRAM_SIZE, 0x1000);
        DmaClear32(3, OAM, OAM_SIZE);
        DmaClear16(3, PLTT, PLTT_SIZE);
        gMain.state = 1;
        break;
    case 1:
        ScanlineEffect_Stop();
        ResetTasks();
        ResetSpriteData();
        ResetPaletteFade();
        FreeAllSpritePalettes();
        gReservedSpritePaletteCount = 8;
        Text_LoadWindowTemplate(&gWindowTemplate_81E7048);
        InitMenuWindow(&gWindowTemplate_81E7048);
        gMain.state++;
        break;
    case 2:
        switch (Random() & 3)
        {
        case 0:
        default:
            gPokedexView = ePokedexView1;
            break;
        case 1:
            gPokedexView = ePokedexView2;
            break;
        case 2:
            gPokedexView = ePokedexView3;
            break;
        case 3:
            gPokedexView = ePokedexView4;
            break;
        }
        ClearPokedexView(gPokedexView);
        CreateTask(Task_PokedexShowMainScreen, 0);
        gPokedexView->dexMode = gSaveBlock2.pokedex.mode;
        if (!IsNationalPokedexEnabled())
            gPokedexView->dexMode = DEX_MODE_HOENN;
        gPokedexView->dexOrder = gSaveBlock2.pokedex.order;
        gPokedexView->selectedPokemon = sLastSelectedPokemon;
        gPokedexView->pokeBallRotation = sPokeBallRotation;
        gPokedexView->selectedScreen = PAGE_SCREEN;
        gPokedexView->descriptionPageNum = 0;
        if (!IsNationalPokedexEnabled())
        {
            gPokedexView->seenCount = GetHoennPokedexCount(0);
            gPokedexView->ownCount = GetHoennPokedexCount(1);
        }
        else
        {
            gPokedexView->seenCount = GetNationalPokedexCount(0);
            gPokedexView->ownCount = GetNationalPokedexCount(1);
        }
        gPokedexView->initialVOffset = 8;
        gMain.state++;
        break;
    case 3:
        {
            u16 savedIme;

            savedIme = REG_IME;
            REG_IME = 0;
            REG_IE |= INTR_FLAG_VBLANK;
            REG_IME = savedIme;
            REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;
            SetVBlankCallback(VBlankCB_Pokedex);
            SetMainCallback2(MainCB);
            SortPokedex(gPokedexView->dexMode, gPokedexView->dexOrder);
            m4aMPlayVolumeControl(&gMPlayInfo_BGM, 0xFFFF, 0x80);
        }
        break;
    }
}

UNUSED
u8 unref_sub_808C540(void (*func)(u8))
{
    u16 savedIme;
    u8 taskId;

    SetVBlankCallback(NULL);
    ResetOtherVideoRegisters(0x200);
    ScanlineEffect_Stop();
    ResetTasks();
    ResetPaletteFade();
    savedIme = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_IME = savedIme;
    REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;
    SetVBlankCallback(VBlankCB_Pokedex);
    SetMainCallback2(MainCB);
    if (!gPokedexView->currentPageBackup)
        taskId = CreateTask(Task_WaitForExitInfoScreen, 0);
    else
        taskId = CreateTask(Task_WaitForExitSearchResultsInfoScreen, 0);
    gTasks[taskId].data[0] = CreateTask(func, 0);
    return gTasks[taskId].data[0];
}

static void MainCB(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void Task_PokedexShowMainScreen(u8 taskId)
{
    gPokedexView->isSearchResults = FALSE;
    if (LoadPokedexListPage(0))
        gTasks[taskId].func = Task_PokedexMainScreen;
}

//Hide menu and process input on main screen
void Task_PokedexMainScreen(u8 taskId)
{
    REG_BG0VOFS = gPokedexView->menuY;

    //If menu is open, slide it down, off screen
    if (gPokedexView->menuY)
        gPokedexView->menuY -= 8;
    else
    {
        if ((gMain.newKeys & A_BUTTON) && gPokedexView->pokedexList[gPokedexView->selectedPokemon].seen)
        {
            UpdateSelectedMonSpriteId();
            BeginNormalPaletteFade(
              ~(1 << (gSprites[gPokedexView->selectedMonSpriteId].oam.paletteNum + 16)),
              0, 0, 16, RGB(0, 0, 0));
            gSprites[gPokedexView->selectedMonSpriteId].callback = SpriteCB_MoveMonForInfoScreen;
            gTasks[taskId].func = Task_OpenInfoScreenAfterMonMovement;
            PlaySE(SE_PIN);
        }
        else if (gMain.newKeys & START_BUTTON)
        {
            //Open menu
            gPokedexView->menuY = 0;
            gPokedexView->menuIsOpen = 1;
            gPokedexView->menuCursorPos = 0;
            gTasks[taskId].func = Task_PokedexMainScreenMenu;
            PlaySE(SE_SELECT);
        }
        else if (gMain.newKeys & SELECT_BUTTON)
        {
            PlaySE(SE_SELECT);
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
            gTasks[taskId].data[0] = LoadSearchMenu();
            gPokedexView->screenSwitchState = 0;
            gPokedexView->pokeBallRotationBackup = gPokedexView->pokeBallRotation;
            gPokedexView->selectedPokemonBackup = gPokedexView->selectedPokemon;
            gPokedexView->dexModeBackup = gPokedexView->dexMode;
            gPokedexView->dexOrderBackup = gPokedexView->dexOrder;
            gTasks[taskId].func = Task_WaitForExitSearch;
            PlaySE(SE_PC_LOGIN);
        }
        else if (gMain.newKeys & B_BUTTON)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
            gTasks[taskId].func = Task_ClosePokedex;
            PlaySE(SE_PC_OFF);
        }
        else
        {
            //Handle D-pad
            gPokedexView->selectedPokemon = TryDoPokedexScroll(gPokedexView->selectedPokemon, 0xE);
            if (gPokedexView->scrollTimer)
                gTasks[taskId].func = Task_WaitForScroll;
        }
    }
}

static void Task_WaitForScroll(u8 taskId)
{
    if (UpdateDexListScroll(gPokedexView->scrollDirection,
            gPokedexView->scrollMonIncrement,
            gPokedexView->maxScrollTimer))
        gTasks[taskId].func = Task_PokedexMainScreen;
}

//Bring up menu and process menu input
static void Task_PokedexMainScreenMenu(u8 taskId)
{
    REG_BG0VOFS = gPokedexView->menuY;

    //If menu is not open, slide it up, on screen
    if (gPokedexView->menuY != 80)
        gPokedexView->menuY += 8;
    else
    {
        if (gMain.newKeys & A_BUTTON)
        {
            switch (gPokedexView->menuCursorPos)
            {
            case 0: //BACK TO LIST
            default:
                gMain.newKeys |= START_BUTTON;  //Exit menu
                break;
            case 1: //LIST TOP
                gPokedexView->selectedPokemon = 0;
                gPokedexView->pokeBallRotation = 0x40;
                ClearMonSprites();
                CreateMonSpritesAtPos(gPokedexView->selectedPokemon, 0xE);
                gMain.newKeys |= START_BUTTON;  //Exit menu
                break;
            case 2: //LIST BOTTOM
                gPokedexView->selectedPokemon = gPokedexView->pokemonListCount - 1;
                gPokedexView->pokeBallRotation = gPokedexView->pokemonListCount * 16 + 0x30;
                ClearMonSprites();
                CreateMonSpritesAtPos(gPokedexView->selectedPokemon, 0xE);
                gMain.newKeys |= START_BUTTON;  //Exit menu
                break;
            case 3: //CLOSE POKEDEX
                BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
                gTasks[taskId].func = Task_ClosePokedex;
                PlaySE(SE_PC_OFF);
                break;
            }
        }

        //Exit menu when Start or B is pressed
        if (gMain.newKeys & (START_BUTTON | B_BUTTON))
        {
            gPokedexView->menuIsOpen = 0;
            gTasks[taskId].func = Task_PokedexMainScreen;
            PlaySE(SE_SELECT);
        }
        else if ((gMain.newAndRepeatedKeys & DPAD_UP) && gPokedexView->menuCursorPos != 0)
        {
            gPokedexView->menuCursorPos--;
            PlaySE(SE_SELECT);
        }
        else if ((gMain.newAndRepeatedKeys & DPAD_DOWN) && gPokedexView->menuCursorPos <= 2)
        {
            gPokedexView->menuCursorPos++;
            PlaySE(SE_SELECT);
        }
    }
}

static void Task_OpenInfoScreenAfterMonMovement(u8 taskId)
{
    if (gSprites[gPokedexView->selectedMonSpriteId].x == 48
     && gSprites[gPokedexView->selectedMonSpriteId].y == 56)
    {
        gPokedexView->currentPageBackup = gPokedexView->currentPage;
        gTasks[taskId].data[0] = LoadInfoScreen(&gPokedexView->pokedexList[gPokedexView->selectedPokemon], gPokedexView->selectedMonSpriteId);
        gTasks[taskId].func = Task_WaitForExitInfoScreen;
    }
}

static void Task_WaitForExitInfoScreen(u8 taskId)
{
    if (gTasks[gTasks[taskId].data[0]].isActive)
    {
        if (gPokedexView->currentPage == 1 && !IsInfoScreenScrolling(gTasks[taskId].data[0]) && TryDoInfoScreenScroll())
            sub_808F284(&gPokedexView->pokedexList[gPokedexView->selectedPokemon], gTasks[taskId].data[0]);
    }
    else
    {
        sLastSelectedPokemon = gPokedexView->selectedPokemon;
        sPokeBallRotation = gPokedexView->pokeBallRotation;
        gTasks[taskId].func = Task_PokedexShowMainScreen;
    }
}

static void Task_WaitForExitSearch(u8 taskId)
{
    bool8 isActive = gTasks[gTasks[taskId].data[0]].isActive;

    if (!isActive)
    {
        if (gPokedexView->screenSwitchState != 0)
        {
            gPokedexView->selectedPokemon = isActive;
            gPokedexView->pokeBallRotation = 0x40;
            gTasks[taskId].func = Task_OpenSearchResults;
        }
        else
        {
            gPokedexView->pokeBallRotation = gPokedexView->pokeBallRotationBackup;
            gPokedexView->selectedPokemon = gPokedexView->selectedPokemonBackup;
            gPokedexView->dexMode = gPokedexView->dexModeBackup;
            if (!IsNationalPokedexEnabled())
                gPokedexView->dexMode = DEX_MODE_HOENN;
            gPokedexView->dexOrder = gPokedexView->dexOrderBackup;
            gTasks[taskId].func = Task_PokedexShowMainScreen;
        }
    }
}

static void Task_ClosePokedex(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        gSaveBlock2.pokedex.mode = gPokedexView->dexMode;
        if (!IsNationalPokedexEnabled())
            gSaveBlock2.pokedex.mode = 0;
        gSaveBlock2.pokedex.order = gPokedexView->dexOrder;
        DestroyTask(taskId);
        SetMainCallback2(c2_exit_to_overworld_1_sub_8080DEC);
        m4aMPlayVolumeControl(&gMPlayInfo_BGM, 0xFFFF, 0x100);
    }
}

static void Task_OpenSearchResults(u8 taskId)
{
    gPokedexView->isSearchResults = TRUE;
    if (LoadPokedexListPage(3))
        gTasks[taskId].func = Task_PokedexResultsScreen;
}

static void Task_PokedexResultsScreen(u8 taskId)
{
    REG_BG0VOFS = gPokedexView->menuY;

    if (gPokedexView->menuY)
    {
        gPokedexView->menuY -= 8;
    }
    else
    {
        if ((gMain.newKeys & A_BUTTON) && gPokedexView->pokedexList[gPokedexView->selectedPokemon].seen)
        {
            u32 excludedPalettes;

            UpdateSelectedMonSpriteId();
            excludedPalettes = (1 << (gSprites[gPokedexView->selectedMonSpriteId].oam.paletteNum + 16));
            gSprites[gPokedexView->selectedMonSpriteId].callback = SpriteCB_MoveMonForInfoScreen;
            BeginNormalPaletteFade(~excludedPalettes, 0, 0, 16, RGB(0, 0, 0));
            gTasks[taskId].func = Task_OpenSearchResultsInfoScreenAfterMonMovement;
            PlaySE(SE_PIN);
        }
        else if (gMain.newKeys & START_BUTTON)
        {
            gPokedexView->menuY = 0;
            gPokedexView->menuIsOpen = 1;
            gPokedexView->menuCursorPos = 0;
            gTasks[taskId].func = Task_PokedexResultsScreenMenu;
            PlaySE(SE_SELECT);
        }
        else if (gMain.newKeys & SELECT_BUTTON)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
            gTasks[taskId].data[0] = LoadSearchMenu();
            gPokedexView->screenSwitchState = 0;
            gTasks[taskId].func = Task_WaitForExitSearch;
            PlaySE(SE_PC_LOGIN);
        }
        else if (gMain.newKeys & B_BUTTON)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
            gTasks[taskId].func = Task_PokedexResultsScreenReturnToMainScreen;
            PlaySE(SE_PC_OFF);
        }
        else
        {
            //Handle D-pad
            gPokedexView->selectedPokemon = TryDoPokedexScroll(gPokedexView->selectedPokemon, 0xE);
            if (gPokedexView->scrollTimer)
                gTasks[taskId].func = Task_WaitForSearchResultsScroll;
        }
    }
}

static void Task_WaitForSearchResultsScroll(u8 taskId)
{
    if (UpdateDexListScroll(gPokedexView->scrollDirection,
            gPokedexView->scrollMonIncrement,
            gPokedexView->maxScrollTimer))
        gTasks[taskId].func = Task_PokedexResultsScreen;
}

static void Task_PokedexResultsScreenMenu(u8 taskId)
{
    REG_BG0VOFS = gPokedexView->menuY;

    if (gPokedexView->menuY != 96)
    {
        gPokedexView->menuY += 8;
    }
    else
    {
        if (gMain.newKeys & A_BUTTON)
        {
            switch (gPokedexView->menuCursorPos)
            {
            case 0: //BACK TO LIST
            default:
                gMain.newKeys |= START_BUTTON;
                break;
            case 1: //LIST TOP
                gPokedexView->selectedPokemon = 0;
                gPokedexView->pokeBallRotation = 0x40;
                ClearMonSprites();
                CreateMonSpritesAtPos(gPokedexView->selectedPokemon, 0xE);
                gMain.newKeys |= START_BUTTON;
                break;
            case 2: //LIST BOTTOM
                gPokedexView->selectedPokemon = gPokedexView->pokemonListCount - 1;
                gPokedexView->pokeBallRotation = gPokedexView->pokemonListCount * 16 + 0x30;
                ClearMonSprites();
                CreateMonSpritesAtPos(gPokedexView->selectedPokemon, 0xE);
                gMain.newKeys |= START_BUTTON;
                break;
            case 3: //BACK TO POKEDEX
                BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
                gTasks[taskId].func = Task_PokedexResultsScreenReturnToMainScreen;
                PlaySE(SE_TRUCK_DOOR);
                break;
            case 4: //CLOSE POKEDEX
                BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
                gTasks[taskId].func = Task_PokedexResultsScreenExitPokedex;
                PlaySE(SE_PC_OFF);
                break;
            }
        }

        //Exit menu when Start or B is pressed
        if (gMain.newKeys & (START_BUTTON | B_BUTTON))
        {
            gPokedexView->menuIsOpen = 0;
            gTasks[taskId].func = Task_PokedexResultsScreen;
            PlaySE(SE_SELECT);
        }
        else if ((gMain.newAndRepeatedKeys & DPAD_UP) && gPokedexView->menuCursorPos)
        {
            gPokedexView->menuCursorPos--;
            PlaySE(SE_SELECT);
        }
        else if ((gMain.newAndRepeatedKeys & DPAD_DOWN) && gPokedexView->menuCursorPos <= 3)
        {
            gPokedexView->menuCursorPos++;
            PlaySE(SE_SELECT);
        }
    }
}

static void Task_OpenSearchResultsInfoScreenAfterMonMovement(u8 taskId)
{
    if (gSprites[gPokedexView->selectedMonSpriteId].x == 48
     && gSprites[gPokedexView->selectedMonSpriteId].y == 56)
    {
        gPokedexView->currentPageBackup = gPokedexView->currentPage;
        gTasks[taskId].data[0] = LoadInfoScreen(&gPokedexView->pokedexList[gPokedexView->selectedPokemon], gPokedexView->selectedMonSpriteId);
        gTasks[taskId].func = Task_WaitForExitSearchResultsInfoScreen;
    }
}

static void Task_WaitForExitSearchResultsInfoScreen(u8 taskId)
{
    if (gTasks[gTasks[taskId].data[0]].isActive)
    {
        if (gPokedexView->currentPage == 1 && !IsInfoScreenScrolling(gTasks[taskId].data[0]) && TryDoInfoScreenScroll())
            sub_808F284(&gPokedexView->pokedexList[gPokedexView->selectedPokemon], gTasks[taskId].data[0]);
    }
    else
    {
        gTasks[taskId].func = Task_OpenSearchResults;
    }
}

static void Task_PokedexResultsScreenReturnToMainScreen(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        gPokedexView->pokeBallRotation = gPokedexView->pokeBallRotationBackup;
        gPokedexView->selectedPokemon = gPokedexView->selectedPokemonBackup;
        gPokedexView->dexMode = gPokedexView->dexModeBackup;
        if (!IsNationalPokedexEnabled())
            gPokedexView->dexMode = DEX_MODE_HOENN;
        gPokedexView->dexOrder = gPokedexView->dexOrderBackup;
        gTasks[taskId].func = Task_PokedexShowMainScreen;
    }
}

static void Task_PokedexResultsScreenExitPokedex(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        gPokedexView->pokeBallRotation = gPokedexView->pokeBallRotationBackup;
        gPokedexView->selectedPokemon = gPokedexView->selectedPokemonBackup;
        gPokedexView->dexMode = gPokedexView->dexModeBackup;
        if (!IsNationalPokedexEnabled())
            gPokedexView->dexMode = DEX_MODE_HOENN;
        gPokedexView->dexOrder = gPokedexView->dexOrderBackup;
        gTasks[taskId].func = Task_ClosePokedex;
    }
}

static bool8 LoadPokedexListPage(u8 a)
{
    switch (gMain.state)
    {
    case 0:
    default:
        if (gPaletteFade.active)
            return 0;
        SetVBlankCallback(NULL);
        gPokedexView->currentPage = a;
        ResetOtherVideoRegisters(0);
        REG_BG2VOFS = gPokedexView->initialVOffset;
        LZ77UnCompVram(gPokedexMenu_Gfx, (void *)(VRAM));
        LZ77UnCompVram(gUnknown_08E96738, (void *)(VRAM + 0x6800));
        LZ77UnCompVram(gUnknown_08E9C6DC, (void *)(VRAM + 0x7800));
        DmaClear16(3, VRAM + 0x6000, 0x500);
        if (a == 0)
            LZ77UnCompVram(gPokedexStartMenuMain_Tilemap, (void *)(VRAM + 0x6500));
        else
            LZ77UnCompVram(gPokedexStartMenuSearchResults_Tilemap, (void *)(VRAM + 0x6500));
        ResetPaletteFade();
        if (a == 0)
            gPokedexView->isSearchResults = FALSE;
        else
            gPokedexView->isSearchResults = TRUE;
        LoadPokedexBgPalette();
        gMain.state = 1;
        break;
    case 1:
        ResetSpriteData();
        FreeAllSpritePalettes();
        gReservedSpritePaletteCount = 8;
        LoadCompressedObjectPic(&sInterfaceSpriteSheet[0]);
        LoadSpritePalettes(sInterfaceSpritePalette);
        CreateInterfaceSprites(a);
        gMain.state++;
        break;
    case 2:
        Text_LoadWindowTemplate(&gWindowTemplate_81E7048);
        InitMenuWindow(&gWindowTemplate_81E7048);
        LZ77UnCompVram(gUnknown_0839FA7C, (void *)(VRAM + 0xFF80));
        gMain.state++;
        break;
    case 3:
        if (a == 0)
            SortPokedex(gPokedexView->dexMode, gPokedexView->dexOrder);
        CreateMonSpritesAtPos(gPokedexView->selectedPokemon, 0xE);
        gPokedexView->menuIsOpen = 0;
        gPokedexView->menuY = 0;
        gMain.state++;
        break;
    case 4:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
        SetVBlankCallback(VBlankCB_Pokedex);
        gMain.state++;
        break;
    case 5:
        REG_WININ = 0x3F3F;
        REG_WINOUT = 0x1D3F;
        REG_WIN0H = 0;
        REG_WIN0V = 0;
        REG_WIN1H = 0;
        REG_WIN1V = 0;
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        REG_BLDY = 0;
        REG_BG3CNT = BGCNT_PRIORITY(3) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(15) | BGCNT_16COLOR | BGCNT_TXT256x256;
        REG_BG1CNT = BGCNT_PRIORITY(1) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(13) | BGCNT_16COLOR | BGCNT_TXT256x256;
        REG_BG0CNT = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(12) | BGCNT_16COLOR | BGCNT_TXT256x256;
        REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_ON | DISPCNT_OBJWIN_ON;
        gMain.state++;
        break;
    case 6:
        if (!gPaletteFade.active)
        {
            gMain.state = 0;
            return TRUE;
        }
        break;
    }
    return FALSE;
}

static void LoadPokedexBgPalette(void)
{
    if (gPokedexView->isSearchResults)
        LoadPalette(sPokedexSearchPalette + 1, 1, sizeof(sPokedexSearchPalette) - sizeof(u16));
    else if (!IsNationalPokedexEnabled())
        LoadPalette(gPokedexMenu_Pal + 1, 1, 0xBE);
    else
        LoadPalette(sNationalPokedexPalette + 1, 1, sizeof(sNationalPokedexPalette) - sizeof(u16));
}

static void SortPokedex(u8 dexMode, u8 sortMode)
{
    s16 i, r5, r10;
    u16 vars[3]; //I have no idea why three regular variables are stored in an array, but whatever.

    gPokedexView->pokemonListCount = 0;

    switch (dexMode)
    {
    default:
    case DEX_MODE_HOENN:
        vars[0] = HOENN_DEX_COUNT;
        vars[1] = 1;
        break;
    case DEX_MODE_NATIONAL:
        if (IsNationalPokedexEnabled())
        {
            vars[0] = NATIONAL_DEX_COUNT;
            vars[1] = 0;
        }
        else
        {
            vars[0] = HOENN_DEX_COUNT;
            vars[1] = 1;
        }
        break;
    }

    switch (sortMode)
    {
    case 0:
        if (vars[1])
        {
            for (i = 0; i < vars[0]; i++)
            {
                vars[2] = HoennToNationalOrder(i + 1);
                gPokedexView->pokedexList[i].dexNum = vars[2];
                gPokedexView->pokedexList[i].seen = GetSetPokedexFlag(vars[2], 0);
                gPokedexView->pokedexList[i].owned = GetSetPokedexFlag(vars[2], 1);
                if (gPokedexView->pokedexList[i].seen)
                    gPokedexView->pokemonListCount = i + 1;
            }
        }
        else
        {
            for (i = 0, r5= 0, r10 = 0; i < vars[0]; i++)
            {
                vars[2] = i + 1;
                if (GetSetPokedexFlag(vars[2], 0))
                    r10 = 1;
                if (r10)
                {
                    gPokedexView->pokedexList[r5].dexNum = vars[2];
                    gPokedexView->pokedexList[r5].seen = GetSetPokedexFlag(vars[2], 0);
                    gPokedexView->pokedexList[r5].owned = GetSetPokedexFlag(vars[2], 1);
                    if (gPokedexView->pokedexList[r5].seen)
                        gPokedexView->pokemonListCount = r5 + 1;
                    r5++;
                }
            }
        }
        break;
    case 1:
        for (i = 0; i < POKEMON_SLOTS_NUMBER - 1; i++)
        {
            vars[2] = gPokedexOrder_Alphabetical[i];

            if (NationalToHoennOrder(vars[2]) <= vars[0] && GetSetPokedexFlag(vars[2], 0))
            {
                gPokedexView->pokedexList[gPokedexView->pokemonListCount].dexNum = vars[2];
                gPokedexView->pokedexList[gPokedexView->pokemonListCount].seen = 1;
                gPokedexView->pokedexList[gPokedexView->pokemonListCount].owned = GetSetPokedexFlag(vars[2], 1);
                gPokedexView->pokemonListCount++;
            }
        }
        break;
    case 2:
        for (i = NATIONAL_DEX_COUNT - 1; i >= 0; i--)
        {
            vars[2] = gPokedexOrder_Weight[i];

            if (NationalToHoennOrder(vars[2]) <= vars[0] && GetSetPokedexFlag(vars[2], 1))
            {
                gPokedexView->pokedexList[gPokedexView->pokemonListCount].dexNum = vars[2];
                gPokedexView->pokedexList[gPokedexView->pokemonListCount].seen = 1;
                gPokedexView->pokedexList[gPokedexView->pokemonListCount].owned = 1;
                gPokedexView->pokemonListCount++;
            }
        }
        break;
    case 3:
        for (i = 0; i < NATIONAL_DEX_COUNT; i++)
        {
            vars[2] = gPokedexOrder_Weight[i];

            if (NationalToHoennOrder(vars[2]) <= vars[0] && GetSetPokedexFlag(vars[2], 1))
            {
                gPokedexView->pokedexList[gPokedexView->pokemonListCount].dexNum = vars[2];
                gPokedexView->pokedexList[gPokedexView->pokemonListCount].seen = 1;
                gPokedexView->pokedexList[gPokedexView->pokemonListCount].owned = 1;
                gPokedexView->pokemonListCount++;
            }
        }
        break;
    case 4:
        for (i = NATIONAL_DEX_COUNT - 1; i >=0; i--)
        {
            vars[2] = gPokedexOrder_Height[i];

            if (NationalToHoennOrder(vars[2]) <= vars[0] && GetSetPokedexFlag(vars[2], 1))
            {
                gPokedexView->pokedexList[gPokedexView->pokemonListCount].dexNum = vars[2];
                gPokedexView->pokedexList[gPokedexView->pokemonListCount].seen = 1;
                gPokedexView->pokedexList[gPokedexView->pokemonListCount].owned = 1;
                gPokedexView->pokemonListCount++;
            }
        }
        break;
    case 5:
        for (i = 0; i < NATIONAL_DEX_COUNT; i++)
        {
            vars[2] = gPokedexOrder_Height[i];

            if (NationalToHoennOrder(vars[2]) <= vars[0] && GetSetPokedexFlag(vars[2], 1))
            {
                gPokedexView->pokedexList[gPokedexView->pokemonListCount].dexNum = vars[2];
                gPokedexView->pokedexList[gPokedexView->pokemonListCount].seen = 1;
                gPokedexView->pokedexList[gPokedexView->pokemonListCount].owned = 1;
                gPokedexView->pokemonListCount++;
            }
        }
        break;
    }

    for (i = gPokedexView->pokemonListCount; i < NATIONAL_DEX_COUNT; i++)
    {
        gPokedexView->pokedexList[i].dexNum |= 0xFFFF;
        gPokedexView->pokedexList[i].seen = 0;
        gPokedexView->pokedexList[i].owned = 0;
    }
}

static void CreateMonListEntry(u8 position, u16 b, u16 screenBase)
{
    s16 entryNum;
    u16 i;
    u16 r2;

    switch (position)
    {
    case 0:
    default:
        entryNum = b - 5;
        for (i = 0; i <= 10; i++)
        {
            if (entryNum < 0 || entryNum >= NATIONAL_DEX_COUNT || gPokedexView->pokedexList[entryNum].dexNum == 0xFFFF)
            {
                ClearMonListEntry(0x11, i * 2, screenBase);
            }
            else
            {
                ClearMonListEntry(0x11, i * 2, screenBase);
                if (gPokedexView->pokedexList[entryNum].seen)
                {
                    CreateMonDexNum(entryNum, 0x12, i * 2, screenBase);
                    CreateCaughtBall(gPokedexView->pokedexList[entryNum].owned, 0x11, i * 2, screenBase);
                    CreateMonName(gPokedexView->pokedexList[entryNum].dexNum, 0x17, i * 2);
                }
                else
                {
                    CreateMonDexNum(entryNum, 0x12, i * 2, screenBase);
                    CreateCaughtBall(0, 0x11, i * 2, screenBase);
                    CreateMonName(0, 0x17, i * 2);
                }
            }
            entryNum++;
        }
        break;
    case 1:
        entryNum = b - 5;
        if (entryNum < 0 || entryNum >= NATIONAL_DEX_COUNT || gPokedexView->pokedexList[entryNum].dexNum == 0xFFFF)
        {
            ClearMonListEntry(0x11, gPokedexView->listVOffset * 2, screenBase);
        }
        else
        {
            ClearMonListEntry(0x11, gPokedexView->listVOffset * 2, screenBase);
            if (gPokedexView->pokedexList[entryNum].seen)
            {
                CreateMonDexNum(entryNum, 0x12, gPokedexView->listVOffset * 2, screenBase);
                CreateCaughtBall(gPokedexView->pokedexList[entryNum].owned, 0x11, gPokedexView->listVOffset * 2,
                    screenBase);
                CreateMonName(gPokedexView->pokedexList[entryNum].dexNum, 0x17, gPokedexView->listVOffset * 2);
            }
            else
            {
                CreateMonDexNum(entryNum, 0x12, gPokedexView->listVOffset * 2, screenBase);
                CreateCaughtBall(0, 0x11, gPokedexView->listVOffset * 2, screenBase);
                CreateMonName(0, 0x17, gPokedexView->listVOffset * 2);
            }
        }
        break;
    case 2:
        entryNum = b + 5;
        r2 = gPokedexView->listVOffset + 10;
        if (r2 > 15)
            r2 -= 16;
        if (entryNum < 0 || entryNum >= NATIONAL_DEX_COUNT || gPokedexView->pokedexList[entryNum].dexNum == 0xFFFF)
            ClearMonListEntry(0x11, r2 * 2, screenBase);
        else
        {
            ClearMonListEntry(0x11, r2 * 2, screenBase);
            if (gPokedexView->pokedexList[entryNum].seen)
            {
                CreateMonDexNum(entryNum, 0x12, r2 * 2, screenBase);
                CreateCaughtBall(gPokedexView->pokedexList[entryNum].owned, 0x11, r2 * 2, screenBase);
                CreateMonName(gPokedexView->pokedexList[entryNum].dexNum, 0x17, r2 * 2);
            }
            else
            {
                CreateMonDexNum(entryNum, 0x12, r2 * 2, screenBase);
                CreateCaughtBall(0, 0x11, r2 * 2, screenBase);
                CreateMonName(0, 0x17, r2 * 2);
            }
        }
        break;
    }
}

static void CreateMonDexNum(u16 entryNum, u8 x, u8 y, u16 screenBase)
{
    u8 text[4];
    u16 unk[2];
    u16 r7 = gPokedexView->pokedexList[entryNum].dexNum;

    if (gPokedexView->dexMode == DEX_MODE_HOENN)
        r7 = NationalToHoennOrder(r7);
    unk[0] = 0x3FC;
    unk[1] = 0x3FD;
    text[0] = CHAR_0 + r7 / 100;
    text[1] = CHAR_0 + (r7 % 100) / 10;
    text[2] = CHAR_0 + (r7 % 100) % 10;
    text[3] = EOS;
    *(u16 *)(BG_VRAM + screenBase * 0x800 + y * 0x40 + x * 2) = unk[0];
    *(u16 *)(BG_VRAM + screenBase * 0x800 + (y + 1) * 0x40 + x * 2) = unk[1];
    Menu_PrintText(text, x - 15, y);
}

static void CreateCaughtBall(u16 owned, u8 x, u8 y, u16 screenBase)
{
    u16 unk[2];

    if (owned)
    {
        unk[0] = 0x3FE;
        unk[1] = 0x3FF;
    }
    else
    {
        unk[0] = 0;
        unk[1] = 0;
    }
    *(u16 *)(BG_VRAM + screenBase * 0x800 + y * 0x40 + x * 2) = unk[0];
    *(u16 *)(BG_VRAM + screenBase * 0x800 + (y + 1) * 0x40 + x * 2) = unk[1];
}

static u8 CreateMonName(u16 num, u8 b, u8 c)
{
    u8 text[POKEMON_NAME_LENGTH + (MODERN ? 1 : 0)];
    u8 i;

    for (i = 0; i < 10; i++)
        text[i] = CHAR_SPACE;
    text[i] = EOS;

    num = NationalPokedexNumToSpecies(num);
    switch (num)
    {
    default:
        for (i = 0; gSpeciesNames[num][i] != EOS && i < POKEMON_NAME_LENGTH; i++)
            text[i] = gSpeciesNames[num][i];
        break;
    case 0:
        for (i = 0; i < POKEMON_NAME_LENGTH; i++)
            text[i] = CHAR_HYPHEN;
        break;
    }
    Menu_PrintTextPixelCoords(text, (b - 0x11) * 8 + 0xFC, c * 8, 0);
    return i;
}

static void ClearMonListEntry(u8 x, u8 y, u16 screenBase)
{
    u8 i;

    for (i = 0; i < 12; i++)
    {
        *(u16 *)(BG_VRAM + screenBase * 0x800 + y * 64 + (x + i) * 2) = 0;
        *(u16 *)(BG_VRAM + screenBase * 0x800 + (y + 1) * 64 + (x + i) * 2) = 0;
    }
}

static void CreateMonSpritesAtPos(u16 selectedMon, u16 b)
{
    u8 i;
    u16 unk;
    u8 spriteId;

    for (i = 0; i < 4; i++)
        gPokedexView->monSpriteIds[i] = 0xFFFF;
    gPokedexView->selectedMonSpriteId = 0xFFFF;
    CreateMonListEntry(0, selectedMon, b);
    REG_BG2VOFS = gPokedexView->initialVOffset;

    unk = GetPokemonSpriteToDisplay(selectedMon - 1);
    if (unk != 0xFFFF)
    {
        spriteId = CreatePokedexMonSprite(unk, 0x60, 0x50);
        gSprites[spriteId].callback = SpriteCB_PokedexListMonSprite;
        gSprites[spriteId].data[5] = -32;
    }

    unk = GetPokemonSpriteToDisplay(selectedMon);
    if (unk != 0xFFFF)
    {
        spriteId = CreatePokedexMonSprite(unk, 0x60, 0x50);
        gSprites[spriteId].callback = SpriteCB_PokedexListMonSprite;
        gSprites[spriteId].data[5] = 0;
    }

    unk = GetPokemonSpriteToDisplay(selectedMon + 1);
    if (unk != 0xFFFF)
    {
        spriteId = CreatePokedexMonSprite(unk, 0x60, 0x50);
        gSprites[spriteId].callback = SpriteCB_PokedexListMonSprite;
        gSprites[spriteId].data[5] = 32;
    }

    gPokedexView->listVOffset = 0;
    gPokedexView->listMovingVOffset = 0;
}

static bool8 UpdateDexListScroll(u8 direction, u8 monMoveIncrement, u8 scrollTimerMax)
{
    u16 i;
    u8 foo;

    if (gPokedexView->scrollTimer)
    {
        gPokedexView->scrollTimer--;
        switch (direction)
        {
        case 1:
            for (i = 0; i < 4; i++)
            {
                if (gPokedexView->monSpriteIds[i] != 0xFFFF)
                    gSprites[gPokedexView->monSpriteIds[i]].data[5] += monMoveIncrement;
            }
            foo = 16 * (scrollTimerMax - gPokedexView->scrollTimer) / scrollTimerMax;
            REG_BG2VOFS = gPokedexView->initialVOffset + gPokedexView->listMovingVOffset * 16 - foo;
            gPokedexView->pokeBallRotation -= gPokedexView->pokeBallRotationStep;
            break;
        case 2:
            for (i = 0; i < 4; i++)
            {
                if (gPokedexView->monSpriteIds[i] != 0xFFFF)
                    gSprites[gPokedexView->monSpriteIds[i]].data[5] -= monMoveIncrement;
            }
            foo = 16 * (scrollTimerMax - gPokedexView->scrollTimer) / scrollTimerMax;
            REG_BG2VOFS = gPokedexView->initialVOffset + gPokedexView->listMovingVOffset * 16 + foo;
            gPokedexView->pokeBallRotation += gPokedexView->pokeBallRotationStep;
            break;
        }
        return FALSE;
    }
    else
    {
        REG_BG2VOFS = gPokedexView->initialVOffset + gPokedexView->listVOffset * 16;
        return TRUE;
    }
}

static void CreateScrollingPokemonSprite(u8 direction, u16 selectedMon)
{
    u16 unk;
    u8 spriteId;

    gPokedexView->listMovingVOffset = gPokedexView->listVOffset;
    switch (direction)
    {
    case 1:
        unk = GetPokemonSpriteToDisplay(selectedMon - 1);
        if (unk != 0xFFFF)
        {
            spriteId = CreatePokedexMonSprite(unk, 0x60, 0x50);
            gSprites[spriteId].callback = SpriteCB_PokedexListMonSprite;
            gSprites[spriteId].data[5] = -64;
        }
        if (gPokedexView->listVOffset > 0)
            gPokedexView->listVOffset--;
        else
            gPokedexView->listVOffset = 15;
        break;
    case 2:
        unk = GetPokemonSpriteToDisplay(selectedMon + 1);
        if (unk != 0xFFFF)
        {
            spriteId = CreatePokedexMonSprite(unk, 0x60, 0x50);
            gSprites[spriteId].callback = SpriteCB_PokedexListMonSprite;
            gSprites[spriteId].data[5] = 0x40;
        }
        if (gPokedexView->listVOffset <= 0xE)
            gPokedexView->listVOffset++;
        else
            gPokedexView->listVOffset = 0;
        break;
    }
}

// Ugly, ugly, ugly. I couldn't get it to match otherwise.
static u16 TryDoPokedexScroll(u16 a, u16 b)
{
    u8 r3;
    u8 r5;
    u8 i;
    u16 r6;
    u8 r10 = 0;

    if (!((gMain.heldKeys & 0x40) && (a > 0)))
    {
        //_0808E4B6
        if (!((gMain.heldKeys & 0x80) && (a < gPokedexView->pokemonListCount - 1)))
        //_0808E4CE
        {
            if ((gMain.newKeys & 0x20) && (a > 0))
            {
                r6 = a;
                //_0808E4E0
                for (i = 0; i < 7; i++)
                    a = GetNextPosition(1, a, 0, gPokedexView->pokemonListCount - 1);
                gPokedexView->pokeBallRotation += 16 * (a - r6);
                ClearMonSprites();
                CreateMonSpritesAtPos(a, 0xE);
                PlaySE(0x6D);
            }
            //_0808E53C
            else if ((gMain.newKeys & 0x10) && (a < gPokedexView->pokemonListCount - 1))
            {
                r6 = a;
                for (i = 0; i < 7; i++)
                    a = GetNextPosition(0, a, 0, gPokedexView->pokemonListCount - 1);
                gPokedexView->pokeBallRotation += (a - r6) * 16;
                ClearMonSprites();
                CreateMonSpritesAtPos(a, 0xE);
                PlaySE(0x6D);
            }
          _0808E5A2:
            if (r10 == 0)
            {
                gPokedexView->scrollSpeed = 0;
                return a;
            }
        }
        else
        {
            // to _0808E5C4
            r10 = 2;
            a = GetNextPosition(0, a, 0, gPokedexView->pokemonListCount - 1);
            CreateScrollingPokemonSprite(2, a);
            //goto _0808E60E
            CreateMonListEntry(2, a, b);
            PlaySE(0x6C);
            goto _0808E5A2;
        }
    }
    else
    {
        //to _0808E5E4
        r10 = 1;
        a = GetNextPosition(1, a, 0, gPokedexView->pokemonListCount - 1);
        CreateScrollingPokemonSprite(1, a);
        //_0808E60E
        CreateMonListEntry(1, a, b);
        PlaySE(0x6C);
        goto _0808E5A2;
    }
    //_0808E628
    r5 = gUnknown_083A05EC[gPokedexView->scrollSpeed / 4];
    r3 = gUnknown_083A05F1[gPokedexView->scrollSpeed / 4];
    gPokedexView->scrollTimer = r3;
    gPokedexView->maxScrollTimer = r3;
    gPokedexView->scrollMonIncrement = r5;
    gPokedexView->scrollDirection = r10;
    gPokedexView->pokeBallRotationStep = r5 / 2;
    UpdateDexListScroll(gPokedexView->scrollDirection,
        gPokedexView->scrollMonIncrement,
        gPokedexView->maxScrollTimer);
    if (gPokedexView->scrollSpeed <= 0xB)
        gPokedexView->scrollSpeed++;
    return a;
}

static void UpdateSelectedMonSpriteId(void)
{
    u16 i;

    for (i = 0; i < 4; i++)
    {
        u16 spriteId = gPokedexView->monSpriteIds[i];

        if (gSprites[spriteId].x2 == 0 && gSprites[spriteId].y2 == 0 && spriteId != 0xFFFF)
            gPokedexView->selectedMonSpriteId = spriteId;
    }
}

static u8 TryDoInfoScreenScroll(void)
{
    u16 r2;
    u16 r4 = gPokedexView->selectedPokemon;

    if ((gMain.newKeys & DPAD_UP) && r4)
    {
        r2 = r4;
        while (r2 != 0)
        {
            r2 = GetNextPosition(1, r2, 0, gPokedexView->pokemonListCount - 1);

            if (gPokedexView->pokedexList[r2].seen)
            {
                r4 = r2;
                break;
            }
        }

        if (gPokedexView->selectedPokemon == r4)
            return 0;
        else
        {
            gPokedexView->selectedPokemon = r4;
            gPokedexView->pokeBallRotation -= 16;
            return 1;
        }
    }
    else if ((gMain.newKeys & DPAD_DOWN) && r4 < gPokedexView->pokemonListCount - 1)
    {
        r2 = r4;
        while (r2 < gPokedexView->pokemonListCount - 1)
        {
            r2 = GetNextPosition(0, r2, 0, gPokedexView->pokemonListCount - 1);

            if (gPokedexView->pokedexList[r2].seen)
            {
                r4 = r2;
                break;
            }
        }

        if (gPokedexView->selectedPokemon == r4)
            return 0;
        else
        {
            gPokedexView->selectedPokemon = r4;
            gPokedexView->pokeBallRotation += 16;
            return 1;
        }
    }
    return 0;
}

static u8 ClearMonSprites(void)
{
    u16 i;

    for (i = 0; i < 4; i++)
    {
        if (gPokedexView->monSpriteIds[i] != 0xFFFF)
        {
            DestroySprite(&gSprites[gPokedexView->monSpriteIds[i]]);
            gPokedexView->monSpriteIds[i] |= 0xFFFF;
        }
    }
    return 0;
}

static u16 GetPokemonSpriteToDisplay(u16 species)
{
    if (species >= NATIONAL_DEX_COUNT || gPokedexView->pokedexList[species].dexNum == 0xFFFF)
        return 0xFFFF;
    else if (gPokedexView->pokedexList[species].seen)
        return gPokedexView->pokedexList[species].dexNum;
    else
        return 0;
}

static u32 CreatePokedexMonSprite(u16 num, s16 x, s16 y)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        if (gPokedexView->monSpriteIds[i] == 0xFFFF)
        {
            u8 spriteId = CreateMonSpriteFromNationalDexNumber(num, x, y, i);

            gSprites[spriteId].oam.affineMode = ST_OAM_AFFINE_NORMAL;
            gSprites[spriteId].oam.priority = 3;
            gSprites[spriteId].data[0] = 0;
            gSprites[spriteId].data[1] = i;
            gSprites[spriteId].data[2] = NationalPokedexNumToSpecies(num);
            gPokedexView->monSpriteIds[i] = spriteId;
            return spriteId;
        }
    }
    return 0xFFFF;
}

static void CreateInterfaceSprites(u8 a)
{
    u8 spriteId;
    u16 r5;

    spriteId = CreateSprite(&sScrollArrowSpriteTemplate, 184, 4, 0);
    gSprites[spriteId].data[1] = 0;

    spriteId = CreateSprite(&sScrollArrowSpriteTemplate, 184, 156, 0);
    gSprites[spriteId].data[1] = 1;
    gSprites[spriteId].vFlip = TRUE;

    CreateSprite(&gSpriteTemplate_83A0524, 234, 20, 0);
    CreateSprite(&gSpriteTemplate_83A0554, 16, 138, 0);

    spriteId = CreateSprite(&gSpriteTemplate_83A0554, 48, 138, 0);
    StartSpriteAnim(&gSprites[spriteId], 3);

    spriteId = CreateSprite(&gSpriteTemplate_83A0554, 16, 158, 0);
    StartSpriteAnim(&gSprites[spriteId], 2);
    gSprites[spriteId].data[2] = 0x80;

    spriteId = CreateSprite(&gSpriteTemplate_83A0554, 48, 158, 0);
    StartSpriteAnim(&gSprites[spriteId], 1);

    spriteId = CreateSprite(&gSpriteTemplate_83A056C, 0, 80, 2);
    gSprites[spriteId].oam.affineMode = 1;
    gSprites[spriteId].oam.matrixNum = 30;
    gSprites[spriteId].data[0] = 0x1E;
    gSprites[spriteId].data[1] = 0;

    spriteId = CreateSprite(&gSpriteTemplate_83A056C, 0, 80, 2);
    gSprites[spriteId].oam.affineMode = 1;
    gSprites[spriteId].oam.matrixNum = 31;
    gSprites[spriteId].data[0] = 0x1F;
    gSprites[spriteId].data[1] = 0x80;

    if (a == 0)
    {
        u32 _a;

        CreateSprite(&gSpriteTemplate_83A0584, 32, 40, 1);

        spriteId = CreateSprite(&gSpriteTemplate_83A0584, 32, 72, 1);
        StartSpriteAnim(&gSprites[spriteId], 1);
        _a = 0;

        spriteId = CreateSprite(&gSpriteTemplate_83A059C, 28, 48, 1);
        r5 = gPokedexView->seenCount / 100;
        StartSpriteAnim(&gSprites[spriteId], r5);
        if (r5 != 0)
            _a = 1;
        else
            gSprites[spriteId].invisible = TRUE;

        spriteId = CreateSprite(&gSpriteTemplate_83A059C, 34, 48, 1);
        r5 = (gPokedexView->seenCount % 100) / 10;
        if (r5 != 0 || _a != 0)
            StartSpriteAnim(&gSprites[spriteId], r5);
        else
            gSprites[spriteId].invisible = TRUE;

        spriteId = CreateSprite(&gSpriteTemplate_83A059C, 40, 48, 1);
        r5 = (gPokedexView->seenCount % 100) % 10;
        StartSpriteAnim(&gSprites[spriteId], r5);
        _a = 0;

        spriteId = CreateSprite(&gSpriteTemplate_83A059C, 28, 80, 1);
        r5 = gPokedexView->ownCount / 100;
        StartSpriteAnim(&gSprites[spriteId], r5);
        if (r5 != 0)
            _a = 1;
        else
            gSprites[spriteId].invisible = TRUE;

        spriteId = CreateSprite(&gSpriteTemplate_83A059C, 34, 80, 1);
        r5 = (gPokedexView->ownCount % 100) / 10;
        if (r5 != 0 || _a != 0)
            StartSpriteAnim(&gSprites[spriteId], r5);
        else
            gSprites[spriteId].invisible = TRUE;

        spriteId = CreateSprite(&gSpriteTemplate_83A059C, 40, 80, 1);
        r5 = (gPokedexView->ownCount % 100) % 10;
        StartSpriteAnim(&gSprites[spriteId], r5);

        spriteId = CreateSprite(&gSpriteTemplate_83A05B4, 140, 96, 1);
        gSprites[spriteId].invisible = TRUE;
    }
    else
    {
        spriteId = CreateSprite(&gSpriteTemplate_83A05B4, 140, 80, 1);
        gSprites[spriteId].invisible = TRUE;
    }
}

static void SpriteCB_EndMoveMonForInfoScreen(struct Sprite *sprite)
{
}

static void SpriteCB_SeenOwnInfo(struct Sprite *sprite)
{
    if (gPokedexView->currentPage != 0)
        DestroySprite(sprite);
}

//Move Pokemon into position for description page
static void SpriteCB_MoveMonForInfoScreen(struct Sprite *sprite)
{
    sprite->oam.priority = 0;
    sprite->oam.affineMode = 0;
    sprite->x2 = 0;
    sprite->y2 = 0;
    if (sprite->x != 48 || sprite->y != 56)
    {
        if (sprite->x > 48)
            sprite->x--;
        if (sprite->x < 48)
            sprite->x++;

        if (sprite->y > 56)
            sprite->y--;
        if (sprite->y < 56)
            sprite->y++;
    }
    else
    {
        sprite->callback = SpriteCB_EndMoveMonForInfoScreen;
    }
}

static void SpriteCB_PokedexListMonSprite(struct Sprite *sprite)
{
    u8 data1 = sprite->data[1];

    if (gPokedexView->currentPage != 0 && gPokedexView->currentPage != 3)
    {
        DestroySprite(sprite);
        gPokedexView->monSpriteIds[data1] = 0xFFFF;
    }
    else
    {
        u32 var;

        sprite->y2 = gSineTable[(u8)sprite->data[5]] * 76 / 256;
        var = 0x10000 / gSineTable[sprite->data[5] + 0x40];
        if (var > 0xFFFF)
            var = 0xFFFF;
        SetOamMatrix(sprite->data[1] + 1, 0x100, 0, 0, var);
        sprite->oam.matrixNum = data1 + 1;

        if (sprite->data[5] > -64 && sprite->data[5] < 64)
        {
            sprite->invisible = FALSE;
            sprite->data[0] = 1;
        }
        else
        {
            sprite->invisible = TRUE;
        }

        if ((sprite->data[5] <= -64 || sprite->data[5] >= 64) && sprite->data[0] != 0)
        {
            DestroySprite(sprite);
            gPokedexView->monSpriteIds[data1] = 0xFFFF;
        }
    }
}

static void SpriteCB_Scrollbar(struct Sprite *sprite)
{
    if (gPokedexView->currentPage != 0 && gPokedexView->currentPage != 3)
        DestroySprite(sprite);
    else
        sprite->y2 = gPokedexView->selectedPokemon * 120 / (gPokedexView->pokemonListCount - 1);
}

static void SpriteCB_ScrollArrow(struct Sprite *sprite)
{
    if (gPokedexView->currentPage != 0 && gPokedexView->currentPage != 3)
    {
        DestroySprite(sprite);
    }
    else
    {
        u8 r0;

        if (sprite->data[1] != 0)
        {
            if (gPokedexView->selectedPokemon == gPokedexView->pokemonListCount - 1)
                sprite->invisible = TRUE;
            else
                sprite->invisible = FALSE;
            r0 = sprite->data[2];
        }
        else
        {
            if (gPokedexView->selectedPokemon == 0)
                sprite->invisible = TRUE;
            else
                sprite->invisible = FALSE;
            r0 = sprite->data[2] - 128;
        }
        sprite->y2 = gSineTable[r0] / 64;
        sprite->data[2] = sprite->data[2] + 8;
        if (gPokedexView->menuIsOpen == 0 && gPokedexView->menuY == 0 && sprite->invisible == 0)
            sprite->invisible = FALSE;
        else
            sprite->invisible = TRUE;
    }
}

static void SpriteCB_DexListInterfaceText(struct Sprite *sprite)
{
    if (gPokedexView->currentPage != 0 && gPokedexView->currentPage != 3)
        DestroySprite(sprite);
}

static void SpriteCB_RotatingPokeBall(struct Sprite *sprite)
{
    if (gPokedexView->currentPage != 0 && gPokedexView->currentPage != 3)
    {
        DestroySprite(sprite);
    }
    else
    {
        u8 val;
        s16 r3;
        s16 r0;

        val = gPokedexView->pokeBallRotation + sprite->data[1];
        r3 = gSineTable[val];
        r0 = gSineTable[val + 0x40];
        SetOamMatrix(sprite->data[0], r0, r3, -r3, r0);

        val = gPokedexView->pokeBallRotation + (sprite->data[1] + 0x40);
        r3 = gSineTable[val];
        r0 = gSineTable[val + 0x40];
        sprite->x2 = r0 * 40 / 256;
        sprite->y2 = r3 * 40 / 256;
    }
}

static void SpriteCB_DexListStartMenuCursor(struct Sprite *sprite)
{
    if (gPokedexView->currentPage != 0 && gPokedexView->currentPage != 3)
    {
        DestroySprite(sprite);
    }
    else
    {
        u16 r1 = gPokedexView->currentPage == 0 ? 80 : 96;

        if (gPokedexView->menuIsOpen != 0 && gPokedexView->menuY == r1)
        {
            sprite->invisible = FALSE;
            sprite->y2 = gPokedexView->menuCursorPos * 16;
            sprite->x2 = gSineTable[(u8)sprite->data[2]] / 64;
            sprite->data[2] += 8;
        }
        else
        {
            sprite->invisible = TRUE;
        }
    }
}

static u8 LoadInfoScreen(struct PokedexListItem *item, u8 b)
{
    u8 taskId;

    sPokedexListItem = item;
    taskId = CreateTask(Task_InitPageScreenMultistep, 0);
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = 1;
    gTasks[taskId].data[2] = 0;
    gTasks[taskId].data[3] = 0;
    gTasks[taskId].data[4] = b;
    return taskId;
}

static bool8 IsInfoScreenScrolling(u8 taskId)
{
    if (gTasks[taskId].data[0] == 0 && gTasks[taskId].func == Task_PageScreenProcessInput)
        return FALSE;
    else
        return TRUE;
}

static u8 sub_808F284(struct PokedexListItem *item, u8 b)
{
    sPokedexListItem = item;
    gTasks[b].data[0] = 1;
    gTasks[b].data[1] = 0;
    gTasks[b].data[2] = 0;
    gTasks[b].data[3] = 0;
    return b;
}

#if ENGLISH
#define CATEGORY_LEFT (11)
#elif GERMAN
#define CATEGORY_LEFT (16)
#endif

static void Task_InitPageScreenMultistep(u8 taskId)
{
    switch (gMain.state)
    {
    case 0:
    default:
        if (!gPaletteFade.active)
        {
            u16 r2;

            gPokedexView->currentPage = 1;
            gPokedexView->descriptionPageNum = 0;
            gPokedexVBlankCB = gMain.vblankCallback;
            SetVBlankCallback(NULL);
            r2 = 0;
            if (gTasks[taskId].data[1] != 0)
                r2 += 0x1000;
            if (gTasks[taskId].data[2] != 0)
                r2 |= 0x200;
            ResetOtherVideoRegisters(r2);
            gMain.state = 1;
        }
        break;
    case 1:
        LZ77UnCompVram(gPokedexMenu_Gfx, (void *)VRAM);
        LZ77UnCompVram(gUnknown_08E96BD4, (void *)(VRAM + 0x7800));
        PrintFootprint(sPokedexListItem->dexNum, 2, 0x3FC);
        gMain.state++;
        break;
    case 2:
        LoadScreenSelectBarMain(0xD);
        HighlightScreenSelectBarItem(gPokedexView->selectedScreen, 0xD);
        LoadPokedexBgPalette();
        gMain.state++;
        break;
    case 3:
        Text_LoadWindowTemplate(&gWindowTemplate_81E7064);
        InitMenuWindow(&gWindowTemplate_81E7064);
        gMain.state++;
        break;
    case 4:
        if (gPokedexView->dexMode == DEX_MODE_HOENN)
            PrintEntryScreenDexNum(NationalToHoennOrder(sPokedexListItem->dexNum), 0xD, 3);
        else
            PrintEntryScreenDexNum(sPokedexListItem->dexNum, 0xD, 3);
        PrintEntryScreenSpeciesName(sPokedexListItem->dexNum, 0x10, 3);
        Menu_PrintText(gDexText_UnknownPoke, CATEGORY_LEFT, 5);
        Menu_PrintText(gDexText_UnknownHeight, 16, 7);
        Menu_PrintText(gDexText_UnknownWeight, 16, 9);
        if (sPokedexListItem->owned)
        {
            UnusedPrintMonName(gPokedexEntries[sPokedexListItem->dexNum].categoryName, CATEGORY_LEFT, 5);
            sub_8091458(gPokedexEntries[sPokedexListItem->dexNum].height, 16, 7);
            sub_8091564(gPokedexEntries[sPokedexListItem->dexNum].weight, 16, 9);
            Menu_PrintText(gPokedexEntries[sPokedexListItem->dexNum].descriptionPage1, 2, 13);
            sub_80C0DC0(14, 0x3FC);
        }
        else
        {
            Menu_PrintText(gUnknown_083A05F8, 2, 13);
            LoadPalette(gPlttBufferUnfaded + 1, 0x31, 0x1E);
        }
        gMain.state++;
        break;
    case 5:
        if (gTasks[taskId].data[1] == 0)
        {
            gTasks[taskId].data[4] = (u16)CreateMonSpriteFromNationalDexNumber(sPokedexListItem->dexNum, 0x30, 0x38, 0);
            gSprites[gTasks[taskId].data[4]].oam.priority = 0;
        }
        gMain.state++;
        break;
    case 6:
        {
            u32 excludedPalettes = 0;

            if (gTasks[taskId].data[2] != 0)
                excludedPalettes = 0x14;
            if (gTasks[taskId].data[1] != 0)
                excludedPalettes |= (1 << (gSprites[gTasks[taskId].data[4]].oam.paletteNum + 16));
            BeginNormalPaletteFade(~excludedPalettes, 0, 16, 0, RGB(0, 0, 0));
            SetVBlankCallback(gPokedexVBlankCB);
            gMain.state++;
        }
        break;
    case 7:
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        REG_BLDY = 0;
        REG_BG3CNT = BGCNT_PRIORITY(3) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(15) | BGCNT_16COLOR | BGCNT_TXT256x256;
        REG_BG1CNT = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(13) | BGCNT_16COLOR | BGCNT_TXT256x256;
        REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG1_ON | DISPCNT_BG2_ON | DISPCNT_BG3_ON | DISPCNT_OBJ_ON;
        gMain.state++;
        break;
    case 8:
        if (!gPaletteFade.active)
        {
            gMain.state++;
            if (gTasks[taskId].data[3] == 0)
            {
                StopCryAndClearCrySongs();
                PlayCry_NormalNoDucking(NationalPokedexNumToSpecies(sPokedexListItem->dexNum), 0, 0x7D, 0xA);
            }
            else
            {
                gMain.state++;
            }
        }
        break;
    case 9:
        if (!IsCryPlayingOrClearCrySongs())
            gMain.state++;
        break;
    case 10:
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].data[2] = 1;
        gTasks[taskId].data[3] = 1;
        gTasks[taskId].func = Task_PageScreenProcessInput;
        gMain.state = 0;
        break;
    }
}

static void Task_PageScreenProcessInput(u8 taskId)
{
    if (gTasks[taskId].data[0] != 0)
    {
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        gTasks[taskId].func = Task_LoadInfoScreenWaitForFade;
        PlaySE(SE_DEX_SCROLL);
        return;
    }
    if (gMain.newKeys & B_BUTTON)
    {
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        gTasks[taskId].func = Task_ClosePageScreen;
        PlaySE(SE_PC_OFF);
        return;
    }
    if (gMain.newKeys & A_BUTTON)
    {
        switch (gPokedexView->selectedScreen)
        {
        case PAGE_SCREEN:
            sub_8090C68();
            break;
        case AREA_SCREEN:
            BeginNormalPaletteFade(0xFFFFFFEB, 0, 0, 16, RGB(0, 0, 0));
            gTasks[taskId].func = Task_InitAreaScreenMultistep;
            PlaySE(SE_PIN);
            break;
        case CRY_SCREEN:
            BeginNormalPaletteFade(0xFFFFFFEB, 0, 0, 16, RGB(0, 0, 0));
            gTasks[taskId].func = Task_InitCryScreenMultistep;
            PlaySE(SE_PIN);
            break;
        case SIZE_SCREEN:
            if (!sPokedexListItem->owned)
            {
                PlaySE(SE_FAILURE);
            }
            else
            {
                BeginNormalPaletteFade(0xFFFFFFEB, 0, 0, 16, RGB(0, 0, 0));
                gTasks[taskId].func = Task_InitSizeScreenMultistep;
                PlaySE(SE_PIN);
            }
            break;
        }
        return;
    }
    if (((gMain.newKeys & DPAD_LEFT)
     || ((gMain.newKeys & L_BUTTON) && gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR))
     && gPokedexView->selectedScreen > 0)
    {
        gPokedexView->selectedScreen--;
        HighlightScreenSelectBarItem(gPokedexView->selectedScreen, 0xD);
        PlaySE(SE_DEX_PAGE);
        return;
    }
    if (((gMain.newKeys & DPAD_RIGHT)
     || ((gMain.newKeys & R_BUTTON) && gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR))
     && gPokedexView->selectedScreen < 3)
    {
        gPokedexView->selectedScreen++;
        HighlightScreenSelectBarItem(gPokedexView->selectedScreen, 0xD);
        PlaySE(SE_DEX_PAGE);
        return;
    }
}

static void Task_LoadInfoScreenWaitForFade(u8 taskId)
{
    if (!gPaletteFade.active)
        gTasks[taskId].func = Task_InitPageScreenMultistep;
}

static void Task_ClosePageScreen(u8 taskId)
{
    if (!gPaletteFade.active)
        DestroyTask(taskId);
}

static void Task_InitAreaScreenMultistep(u8 taskId)
{
    switch (gMain.state)
    {
    case 0:
    default:
        if (!gPaletteFade.active)
        {
            gPokedexView->currentPage = 5;
            gPokedexVBlankCB = gMain.vblankCallback;
            SetVBlankCallback(NULL);
            ResetOtherVideoRegisters(0x200);
            gPokedexView->selectedScreen = AREA_SCREEN;
            gMain.state = 1;
        }
        break;
    case 1:
        LoadScreenSelectBarSubmenu(0xD);
        sub_8090644(1, 0xD);
        LoadPokedexBgPalette();
        REG_BG1CNT = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(13) | BGCNT_16COLOR | BGCNT_TXT256x256;
        gMain.state++;
        break;
    case 2:
        ShowPokedexAreaScreen(NationalPokedexNumToSpecies(sPokedexListItem->dexNum), &gPokedexView->screenSwitchState);
        SetVBlankCallback(gPokedexVBlankCB);
        gPokedexView->screenSwitchState = 0;
        gMain.state = 0;
        gTasks[taskId].func = Task_AreaScreenProcessInput;
        break;
    }
}

static void Task_AreaScreenProcessInput(u8 taskId)
{
    if (gPokedexView->screenSwitchState != 0)
        gTasks[taskId].func = sub_808FA00;
}

static void sub_808FA00(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        switch (gPokedexView->screenSwitchState)
        {
        case 1:
        default:
            gTasks[taskId].func = Task_InitPageScreenMultistep;
            break;
        case 2:
            gTasks[taskId].func = Task_InitCryScreenMultistep;
            break;
        }
    }
}

static void Task_InitCryScreenMultistep(u8 taskId)
{
    switch (gMain.state)
    {
    case 0:
    default:
        if (!gPaletteFade.active)
        {
            MPlayStop(&gMPlayInfo_BGM);
            gPokedexView->currentPage = 6;
            gPokedexVBlankCB = gMain.vblankCallback;
            SetVBlankCallback(NULL);
            ResetOtherVideoRegisters(0x200);
            gPokedexView->selectedScreen = CRY_SCREEN;
            gMain.state = 1;
        }
        break;
    case 1:
        LZ77UnCompVram(gPokedexMenu_Gfx, (void *)VRAM);
        LZ77UnCompVram(gUnknown_0839F8A0, (void *)(VRAM + 0x7000));
        gMain.state++;
        break;
    case 2:
        LoadScreenSelectBarSubmenu(0xD);
        sub_8090644(2, 0xD);
        LoadPokedexBgPalette();
        DmaClear16(3, (void *)(VRAM + 0xF800), 0x500);
        gMain.state++;
        break;
    case 3:
        Text_LoadWindowTemplate(&gWindowTemplate_81E702C);
        InitMenuWindow(&gWindowTemplate_81E702C);
        ResetPaletteFade();
        gMain.state++;
        break;
    case 4:
        Menu_PrintText(gDexText_CryOf, 10, 4);
        PrintCryScreenSpeciesName(sPokedexListItem->dexNum, 10, 6, 2);
        gMain.state++;
        break;
    case 5:
        gTasks[taskId].data[4] =
            CreateMonSpriteFromNationalDexNumber(sPokedexListItem->dexNum, 0x30, 0x38, 0);
        gSprites[gTasks[taskId].data[4]].oam.priority = 0;
        gDexCryScreenState = 0;
        gMain.state++;
        break;
    case 6:
        {
            struct CryScreenWindow waveformWindow;

            waveformWindow.charBase = 0x4020;
            waveformWindow.screenBase = 0x1F;
            waveformWindow.paletteNo = 8;
            waveformWindow.yPos = 0x1E;
            waveformWindow.xPos = 0xC;
            if (LoadCryWaveformWindow(&waveformWindow, 0) != 0)
            {
                gMain.state++;
                gDexCryScreenState = 0;
            }
        }
        break;
    case 7:
        {
            struct CryScreenWindow sp10;

            sp10.charBase = 0x3000;
            sp10.screenBase = 0xE;
            sp10.paletteNo = 9;
            sp10.xPos = 0x12;
            sp10.yPos = 3;
            if (ShowPokedexCryScreen(&sp10, 1) != 0)
                gMain.state++;
        }
        break;
    case 8:
        BeginNormalPaletteFade(0xFFFFFFEB, 0, 16, 0, RGB(0, 0, 0));
        SetVBlankCallback(gPokedexVBlankCB);
        gMain.state++;
        break;
    case 9:
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        REG_BLDY = 0;
        REG_BG2CNT = BGCNT_PRIORITY(2) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(14) | BGCNT_16COLOR | BGCNT_TXT256x256;
        REG_BG0CNT = BGCNT_PRIORITY(3) | BGCNT_CHARBASE(1) | BGCNT_SCREENBASE(31) | BGCNT_16COLOR | BGCNT_TXT256x256;
        REG_BG1CNT = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(13) | BGCNT_16COLOR | BGCNT_TXT256x256;
        REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_ON;
        gMain.state++;
        break;
    case 10:
        gPokedexView->screenSwitchState = 0;
        gMain.state = 0;
        gTasks[taskId].func = Task_CryScreenProcessInput;
        break;
    }
}

static void Task_CryScreenProcessInput(u8 taskId)
{
    UpdateCryWaveformWindow(0);

    if (IsCryPlaying())
        LoadPlayArrowPalette(1);
    else
        LoadPlayArrowPalette(0);

    if (gMain.newKeys & A_BUTTON)
    {
        LoadPlayArrowPalette(1);
        CryScreenPlayButton(NationalPokedexNumToSpecies(sPokedexListItem->dexNum));
        return;
    }
    else if (!gPaletteFade.active)
    {
        if (gMain.newKeys & B_BUTTON)
        {
            BeginNormalPaletteFade(0xFFFFFFEB, 0, 0, 16, RGB(0, 0, 0));
            m4aMPlayContinue(&gMPlayInfo_BGM);
            gPokedexView->screenSwitchState = 1;
            gTasks[taskId].func = Task_SwitchScreensFromCryScreen;
            PlaySE(SE_PC_OFF);
            return;
        }
        if ((gMain.newKeys & DPAD_LEFT)
         || ((gMain.newKeys & L_BUTTON) && gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR))
        {
            BeginNormalPaletteFade(0xFFFFFFEB, 0, 0, 16, RGB(0, 0, 0));
            m4aMPlayContinue(&gMPlayInfo_BGM);
            gPokedexView->screenSwitchState = 2;
            gTasks[taskId].func = Task_SwitchScreensFromCryScreen;
            PlaySE(SE_DEX_PAGE);
            return;
        }
        if ((gMain.newKeys & DPAD_RIGHT)
         || ((gMain.newKeys & R_BUTTON) && gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR))
        {
            if (!sPokedexListItem->owned)
            {
                PlaySE(SE_FAILURE);
            }
            else
            {
                BeginNormalPaletteFade(0xFFFFFFEB, 0, 0, 16, RGB(0, 0, 0));
                m4aMPlayContinue(&gMPlayInfo_BGM);
                gPokedexView->screenSwitchState = 3;
                gTasks[taskId].func = Task_SwitchScreensFromCryScreen;
                PlaySE(SE_DEX_PAGE);
            }
            return;
        }
    }
}

static void Task_SwitchScreensFromCryScreen(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        DestroyCryMeterNeedleSprite();
        switch (gPokedexView->screenSwitchState)
        {
        default:
        case 1:
            gTasks[taskId].func = Task_InitPageScreenMultistep;
            break;
        case 2:
            gTasks[taskId].func = Task_InitAreaScreenMultistep;
            break;
        case 3:
            gTasks[taskId].func = Task_InitSizeScreenMultistep;
            break;
        }
    }
}

static void LoadPlayArrowPalette(u8 cryPlaying)
{
    u16 color;

    if (cryPlaying)
        color = RGB(18, 28, 0);
    else
        color = RGB(15, 21, 0);
    LoadPalette(&color, 0x5D, 2);
}

static void Task_InitSizeScreenMultistep(u8 taskId)
{
    u8 spriteId;

    switch (gMain.state)
    {
    default:
    case 0:
        if (!gPaletteFade.active)
        {
            gPokedexView->currentPage = 7;
            gPokedexVBlankCB = gMain.vblankCallback;
            SetVBlankCallback(NULL);
            ResetOtherVideoRegisters(0x200);
            gPokedexView->selectedScreen = SIZE_SCREEN;
            gMain.state = 1;
        }
        break;
    case 1:
        LZ77UnCompVram(gPokedexMenu_Gfx, (void *)VRAM);
        LZ77UnCompVram(gUnknown_0839F988, (void *)(VRAM + 0x7000));
        gMain.state++;
        break;
    case 2:
        LoadScreenSelectBarSubmenu(0xD);
        sub_8090644(3, 0xD);
        LoadPokedexBgPalette();
        gMain.state++;
        break;
    case 3:
        {
            // This only needs to be 25 chars long (31 in German).
            u8 string[40];  //I hope this is the correct size

            Text_LoadWindowTemplate(&gWindowTemplate_81E702C);
            InitMenuWindow(&gWindowTemplate_81E702C);
            string[0] = EOS;
            StringAppend(string, gDexText_SizeComparedTo);
            StringAppend(string, gSaveBlock2.playerName);
            MenuPrint_Centered(string, 3, 15, 0xC0);
            gMain.state++;
        }
        break;
    case 4:
        ResetPaletteFade();
        gMain.state++;
        break;
    case 5:
        spriteId = CreateSizeScreenTrainerPic(gSaveBlock2.playerGender, 152, 56, 0);
        gSprites[spriteId].oam.affineMode = 1;
        gSprites[spriteId].oam.matrixNum = 1;
        gSprites[spriteId].oam.priority = 0;
        gSprites[spriteId].y2 = gPokedexEntries[sPokedexListItem->dexNum].trainerOffset;
        SetOamMatrix(1, gPokedexEntries[sPokedexListItem->dexNum].trainerScale, 0, 0, gPokedexEntries[sPokedexListItem->dexNum].trainerScale);
        LoadPalette(sSizeScreenSilhouette_Pal, (gSprites[spriteId].oam.paletteNum + 16) * 16, sizeof(sSizeScreenSilhouette_Pal));
        gMain.state++;
        break;
    case 6:
        spriteId = CreateMonSpriteFromNationalDexNumber(sPokedexListItem->dexNum, 88, 56, 1);
        gSprites[spriteId].oam.affineMode = 1;
        gSprites[spriteId].oam.matrixNum = 2;
        gSprites[spriteId].oam.priority = 0;
        gSprites[spriteId].y2 = gPokedexEntries[sPokedexListItem->dexNum].pokemonOffset;
        SetOamMatrix(2, gPokedexEntries[sPokedexListItem->dexNum].pokemonScale, 0, 0, gPokedexEntries[sPokedexListItem->dexNum].pokemonScale);
        LoadPalette(sSizeScreenSilhouette_Pal, (gSprites[spriteId].oam.paletteNum + 16) * 16, sizeof(sSizeScreenSilhouette_Pal));
        gMain.state++;
        break;
    case 7:
        BeginNormalPaletteFade(0xFFFFFFEB, 0, 16, 0, RGB(0, 0, 0));
        SetVBlankCallback(gPokedexVBlankCB);
        gMain.state++;
        break;
    case 8:
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        REG_BLDY = 0;
        REG_BG2CNT = BGCNT_PRIORITY(3) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(14) | BGCNT_16COLOR | BGCNT_TXT256x256;
        REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG1_ON | DISPCNT_BG2_ON | DISPCNT_BG3_ON | DISPCNT_OBJ_ON;
        gMain.state++;
        break;
    case 9:
        if (!gPaletteFade.active)
        {
            gPokedexView->screenSwitchState = 0;
            gMain.state = 0;
            gTasks[taskId].func = Task_SizeScreenProcessInput;
        }
        break;
    }
}

static void Task_SizeScreenProcessInput(u8 taskId)
{
    if (gMain.newKeys & B_BUTTON)
    {
        BeginNormalPaletteFade(0xFFFFFFEB, 0, 0, 16, RGB(0, 0, 0));
        gPokedexView->screenSwitchState = 1;
        gTasks[taskId].func = Task_SwitchScreensFromSizeScreen;
        PlaySE(SE_PC_OFF);
    }
    else if ((gMain.newKeys & DPAD_LEFT)
     || ((gMain.newKeys & L_BUTTON) && gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR))
    {
        BeginNormalPaletteFade(0xFFFFFFEB, 0, 0, 16, RGB(0, 0, 0));
        gPokedexView->screenSwitchState = 2;
        gTasks[taskId].func = Task_SwitchScreensFromSizeScreen;
        PlaySE(SE_DEX_PAGE);
    }
}

static void Task_SwitchScreensFromSizeScreen(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        switch (gPokedexView->screenSwitchState)
        {
        default:
        case 1:
            gTasks[taskId].func = Task_InitPageScreenMultistep;
            break;
        case 2:
            gTasks[taskId].func = Task_InitCryScreenMultistep;
            break;
        }
    }
}

static void LoadScreenSelectBarMain(u16 screenBase)
{
    LZ77UnCompVram(gPokedexScreenSelectBarMain_Tilemap, (void *)(VRAM + screenBase * 0x800));
    DmaClear16(3, (void *)(VRAM + screenBase * 0x800 + 0xC0), 0x440);
}

static void LoadScreenSelectBarSubmenu(u16 screenBase)
{
    LZ77UnCompVram(gPokedexScreenSelectBarSubmenu_Tilemap, (void *)(VRAM + screenBase * 0x800));
    DmaClear16(3, (void *)(VRAM + screenBase * 0x800 + 0xC0), 0x440);
}

static void HighlightScreenSelectBarItem(u8 a, u16 b)
{
    u8 i;   //r1
    u8 j;   //r3
    u16 r0;
    u16 r6;
    u8 r7;

    for (i = 0; i < 4; i++)
    {
        r7 = i * 5 + 1;

        if (i == a)
            r6 = 0x2000;
        else
            r6 = 0x4000;

        for (j = 0; j < 5; j++)
        {
            r0 = *(u16 *)(VRAM + b * 0x800 + (r7 + j) * 2);
            r0 &= 0xFFF;
            r0 |= r6;
            *(u16 *)(VRAM + b * 0x800 + (r7 + j) * 2) = r0;

            r0 = *(u16 *)(VRAM + 0x40 + b * 0x800 + (r7 + j) * 2);
            r0 &= 0xFFF;
            r0 |= r6;
            *(u16 *)(VRAM + 0x40 + b * 0x800 + (r7 + j) * 2) = r0;
        }
    }
    r6 = 0x4000;
    for (j = 0; j < 5; j++)
    {
        r0 = *(u16 *)(VRAM + 0x32 + b * 0x800 + j * 2);
        r0 &= 0xFFF;
        r0 |= r6;
        *(u16 *)(VRAM + 0x32 + b * 0x800 + j * 2) = r0;

        r0 = *(u16 *)(VRAM + 0x72 + b * 0x800 + j * 2);
        r0 &= 0xFFF;
        r0 |= r6;
        *(u16 *)(VRAM + 0x72 + b * 0x800 + j * 2) = r0;
    }
}

//Nope, can't get this one to match, either.
static void sub_8090644(u8 a, u16 b)
{
    u8 i;   //r1
    u8 j;   //r3
    u16 r0;
    u16 r6;
    u8 r7;

    for (i = 0; i < 4; i++)
    {
        r7 = i * 5 + 1;

        if (i == a || (i == 0))
            r6 = 0x2000;
        else
            r6 = 0x4000;

        for (j = 0; j < 5; j++)
        {
            r0 = *(u16 *)(VRAM + b * 0x800 + (r7 + j) * 2);
            r0 &= 0xFFF;
            r0 |= r6;
            *(u16 *)(VRAM + b * 0x800 + (r7 + j) * 2) = r0;

            r0 = *(u16 *)(VRAM + 0x40 + b * 0x800 + (r7 + j) * 2);
            r0 &= 0xFFF;
            r0 |= r6;
            *(u16 *)(VRAM + 0x40 + b * 0x800 + (r7 + j) * 2) = r0;
        }
    }
    r6 = 0x4000;
    for (j = 0; j < 5; j++)
    {
        r0 = *(u16 *)(VRAM + 0x32 + b * 0x800 + j * 2);
        r0 &= 0xFFF;
        r0 |= r6;
        *(u16 *)(VRAM + 0x32 + b * 0x800 + j * 2) = r0;

        r0 = *(u16 *)(VRAM + 0x72 + b * 0x800 + j * 2);
        r0 &= 0xFFF;
        r0 |= r6;
        *(u16 *)(VRAM + 0x72 + b * 0x800 + j * 2) = r0;
    }
}

u8 sub_809070C(u16 dexNum, u32 b, u32 c)
{
    u8 taskId = CreateTask(sub_8090750, 0);

    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = dexNum;
    gTasks[taskId].data[12] = b;
    gTasks[taskId].data[13] = b >> 16;
    gTasks[taskId].data[14] = c;
    gTasks[taskId].data[15] = c >> 16;
    return taskId;
}

static void sub_8090750(u8 taskId)
{
    u8 spriteId;
    u16 dexNum = gTasks[taskId].data[1];
    u16 i;

    switch (gTasks[taskId].data[0])
    {
    default:
    case 0:
        if (!gPaletteFade.active)
        {
            gPokedexVBlankCB = gMain.vblankCallback;
            SetVBlankCallback(NULL);
            ResetOtherVideoRegisters(0x100);
            gTasks[taskId].data[0] = 1;
        }
        break;
    case 1:
        LZ77UnCompVram(gPokedexMenu_Gfx, (void *)(VRAM + 0x4000));
        LZ77UnCompVram(gUnknown_08E96BD4, (void *)(VRAM + 0x7800));
        for (i = 0; i < 0x280; i++)
        {
            u16 temp = *(u16 *)(BG_VRAM + 0x7800 + 2 * i);
            temp += 0x2000;
            *(u16 *)(BG_VRAM + 0x7800 + 2 * i) = temp;
        }
        PrintFootprint(gTasks[taskId].data[1], 2, 0x3FC);
        ResetPaletteFade();
        LoadPalette(gPokedexMenu_Pal + 1, 0x21, 0x9E);
        gTasks[taskId].data[0]++;
        break;
    case 2:
        Text_LoadWindowTemplate(&gWindowTemplate_81E7064);
        InitMenuWindow(&gWindowTemplate_81E7064);
        DmaClear16(3, (void *)(VRAM + 0xC000), 0x200);
        gTasks[taskId].data[0]++;
        break;
    case 3:
        MenuPrint_Centered(gDexText_RegisterComplete, 2, 0, 0xD0);
        if (!IsNationalPokedexEnabled())
            PrintEntryScreenDexNum(NationalToHoennOrder(dexNum), 13, 3);
        else
            PrintEntryScreenDexNum(dexNum, 13, 3);
        PrintEntryScreenSpeciesName(dexNum, 16, 3);
        Menu_PrintText(gDexText_UnknownPoke, CATEGORY_LEFT, 5);
        Menu_PrintText(gDexText_UnknownHeight, 16, 7);
        Menu_PrintText(gDexText_UnknownWeight, 16, 9);
        UnusedPrintMonName(gPokedexEntries[dexNum].categoryName, CATEGORY_LEFT, 5);
        sub_8091458(gPokedexEntries[dexNum].height, 16, 7);
        sub_8091564(gPokedexEntries[dexNum].weight, 16, 9);
        Menu_PrintText(gPokedexEntries[dexNum].descriptionPage1, 2, 13);
        sub_80C0DC0(14, 0x3FC);
        gTasks[taskId].data[0]++;
        break;
    case 4:
        spriteId = CreateMonSpriteFromNationalDexNumber(dexNum, 0x30, 0x38, 0);
        gSprites[spriteId].oam.priority = 0;
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
        SetVBlankCallback(gPokedexVBlankCB);
        gTasks[taskId].data[3] = spriteId;
        gTasks[taskId].data[0]++;
        break;
    case 5:
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        REG_BLDY = 0;
        REG_BG3CNT = BGCNT_PRIORITY(3) | BGCNT_CHARBASE(1) | BGCNT_SCREENBASE(15) | BGCNT_16COLOR | BGCNT_TXT256x256;
        REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG2_ON | DISPCNT_BG3_ON | DISPCNT_OBJ_ON;
        gTasks[taskId].data[0]++;
        break;
    case 6:
        if (!gPaletteFade.active)
        {
            PlayCry_Normal(NationalPokedexNumToSpecies(dexNum), 0);
            gTasks[taskId].data[2] = 0;
            gTasks[taskId].data[4] = 0;
            gTasks[taskId].func = sub_8090A3C;
        }
        break;
    }
}

static void sub_8090A3C(u8 taskId)
{
    if (gMain.newKeys & B_BUTTON)
    {
        BeginNormalPaletteFade(0xFFFC, 0, 0, 16, RGB(0, 0, 0));
        gSprites[gTasks[taskId].data[3]].callback = sub_8090C28;
        gTasks[taskId].func = sub_8090B8C;
        return;
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        if (gTasks[taskId].data[4] == 0)
        {
            u16 r4 = gTasks[taskId].data[1];

            Menu_EraseWindowRect(2, 13, 27, 19);
            Menu_PrintText(gPokedexEntries[r4].descriptionPage2, 2, 13);
            (*(u16 *)(BG_VRAM + 0x7ACA))++;
            (*(u16 *)(BG_VRAM + 0x7B0A))++;
            gTasks[taskId].data[4] = 1;
            PlaySE(SE_PIN);
        }
        else
        {
            BeginNormalPaletteFade(0xFFFC, 0, 0, 16, RGB(0, 0, 0));
            gSprites[gTasks[taskId].data[3]].callback = sub_8090C28;
            gTasks[taskId].func = sub_8090B8C;
            return;
        }
    }
    gTasks[taskId].data[2]++;
    if (gTasks[taskId].data[2] & 0x10)
        LoadPalette(gPokedexMenu_Pal + 1, 0x51, 14);
    else
        LoadPalette(gPokedexMenu2_Pal + 1, 0x51, 14);
}

static void sub_8090B8C(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        u16 species;
        u32 otId;
        u32 personality;
        u8 paletteNum;
        const u8 *lzPaletteData;

        REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG3_ON | DISPCNT_OBJ_ON;
        CpuCopy16(gBattleTextboxTilemap, (void *)(VRAM + 0xC000), 0x1000);
        ApplyPlayerChosenFrameToBattleMenu();
        species = NationalPokedexNumToSpecies(gTasks[taskId].data[1]);
        otId = ((u16)gTasks[taskId].data[13] << 16) | (u16)gTasks[taskId].data[12];
        personality = ((u16)gTasks[taskId].data[15] << 16) | (u16)gTasks[taskId].data[14];
        paletteNum = gSprites[gTasks[taskId].data[3]].oam.paletteNum;
        lzPaletteData = GetMonSpritePalFromOtIdPersonality(species, otId, personality);
        LoadCompressedPalette(lzPaletteData, 0x100 | paletteNum * 16, 32);
        DestroyTask(taskId);
    }
}

static void sub_8090C28(struct Sprite *sprite)
{
    if (sprite->x < 0x78)
        sprite->x += 2;
    if (sprite->x > 0x78)
        sprite->x -= 2;

    if (sprite->y < 0x50)
        sprite->y += 1;
    if (sprite->y > 0x50)
        sprite->y -= 1;
}

static void sub_8090C68(void)
{
    if (sPokedexListItem->owned)
    {
        if (gPokedexView->descriptionPageNum == 0)
        {
            Menu_EraseWindowRect(2, 13, 27, 19);
            Menu_PrintText(gPokedexEntries[sPokedexListItem->dexNum].descriptionPage2, 2, 13);
            gPokedexView->descriptionPageNum = 1;
            (*(u16 *)(BG_VRAM + 0x7ACA))++;
            (*(u16 *)(BG_VRAM + 0x7B0A))++;
            PlaySE(SE_PIN);
        }
        else
        {
            Menu_EraseWindowRect(2, 13, 27, 19);
            Menu_PrintText(gPokedexEntries[sPokedexListItem->dexNum].descriptionPage1, 2, 13);
            gPokedexView->descriptionPageNum = 0;
            (*(u16 *)(BG_VRAM + 0x7ACA))--;
            (*(u16 *)(BG_VRAM + 0x7B0A))--;
            PlaySE(SE_PIN);
        }
    }
}

const u8 *GetPokemonCategory(u16 dexNum)
{
    return gPokedexEntries[dexNum].categoryName;
}

u16 GetPokedexHeightWeight(u16 dexNum, u8 data)
{
    switch (data)
    {
    case 0:  // height
        return gPokedexEntries[dexNum].height;
    case 1:  // weight
        return gPokedexEntries[dexNum].weight;
    default:
        return 1;
    }
}

s8 GetSetPokedexFlag(u16 nationalDexNo, u8 caseID)
{
    u8 index;
    u8 bit;
    u8 mask;
    s8 retVal;

    nationalDexNo--;
    index = nationalDexNo / 8;
    bit = nationalDexNo % 8;
    mask = 1 << bit;
    retVal = 0;
    switch (caseID)
    {
    case FLAG_GET_SEEN:
        if (gSaveBlock2.pokedex.seen[index] & mask)
        {
            if ((gSaveBlock2.pokedex.seen[index] & mask) == (gSaveBlock1.dexSeen2[index] & mask)
             && (gSaveBlock2.pokedex.seen[index] & mask) == (gSaveBlock1.dexSeen3[index] & mask))
                retVal = 1;
            else
            {
                gSaveBlock2.pokedex.seen[index] &= ~mask;
                gSaveBlock1.dexSeen2[index] &= ~mask;
                gSaveBlock1.dexSeen3[index] &= ~mask;
                retVal = 0;
            }
        }
        break;
    case FLAG_GET_CAUGHT:
        if (gSaveBlock2.pokedex.owned[index] & mask)
        {
            if ((gSaveBlock2.pokedex.owned[index] & mask) == (gSaveBlock2.pokedex.seen[index] & mask)
             && (gSaveBlock2.pokedex.owned[index] & mask) == (gSaveBlock1.dexSeen2[index] & mask)
             && (gSaveBlock2.pokedex.owned[index] & mask) == (gSaveBlock1.dexSeen3[index] & mask))
                retVal = 1;
            else
            {
                gSaveBlock2.pokedex.owned[index] &= ~mask;
                gSaveBlock2.pokedex.seen[index] &= ~mask;
                gSaveBlock1.dexSeen2[index] &= ~mask;
                gSaveBlock1.dexSeen3[index] &= ~mask;
                retVal = 0;
            }
        }
        break;
    case FLAG_SET_SEEN:
        gSaveBlock2.pokedex.seen[index] |= mask;
        gSaveBlock1.dexSeen2[index] |= mask;
        gSaveBlock1.dexSeen3[index] |= mask;
        break;
    case FLAG_SET_CAUGHT:
        gSaveBlock2.pokedex.owned[index] |= mask;
        break;
    }
    return retVal;
}

u16 GetNationalPokedexCount(u8 caseID)
{
    u16 count = 0;
    u16 i;

    for (i = 0; i < NATIONAL_DEX_COUNT; i++)
    {
        switch (caseID)
        {
        case FLAG_GET_SEEN:
            if (GetSetPokedexFlag(i + 1, FLAG_GET_SEEN))
                count++;
            break;
        case FLAG_GET_CAUGHT:
            if (GetSetPokedexFlag(i + 1, FLAG_GET_CAUGHT))
                count++;
            break;
        }
    }
    return count;
}

u16 GetHoennPokedexCount(u8 caseID)
{
    u16 count = 0;
    u16 i;

    for (i = 0; i < HOENN_DEX_COUNT; i++)
    {
        switch (caseID)
        {
        case FLAG_GET_SEEN:
            if (GetSetPokedexFlag(HoennToNationalOrder(i + 1), FLAG_GET_SEEN))
                count++;
            break;
        case FLAG_GET_CAUGHT:
            if (GetSetPokedexFlag(HoennToNationalOrder(i + 1), FLAG_GET_CAUGHT))
                count++;
            break;
        }
    }
    return count;
}

bool8 CompletedHoennPokedex(void)
{
    u16 i;

    for (i = 0; i < 200; i++)
    {
        if (!GetSetPokedexFlag(HoennToNationalOrder(i + 1), FLAG_GET_CAUGHT))
            return FALSE;
    }
    return TRUE;
}

bool16 CompletedNationalPokedex(void)
{
    u16 i;

    // BUG: This function indexes pokemon checks by 0, but adds
    // 1 before passing to GetSetPokedexFlag. Normally, this is
    // fine, because GetSetPokedexFlag subtracts by 1 to get the
    // array index value, but since the array is 0 indexed
    // starting with Bulbasaur, values passed actually means that
    // dex entries 152 (Chikorita) and 252 (Treecko) are skipped.
    // Because an earlier Hoenn Dex check prevented Treecko from
    // being skippable, it means that Chikorita is not required
    // to obtain the National Diploma. This was fixed in Emerald.
    for (i = 0; i < 150; i++)
    {
        if (GetSetPokedexFlag(i + 1, 1) == 0)
            return FALSE;
    }
    for (i = 152; i < 250; i++)
    {
        if (GetSetPokedexFlag(i + 1, 1) == 0)
            return FALSE;
    }
    for (i = 252; i < 384; i++)
    {
        if (GetSetPokedexFlag(i + 1, 1) == 0)
            return FALSE;
    }
    return TRUE;
}

static void ResetOtherVideoRegisters(u16 a)
{
    if (!(a & 0x100))
    {
        REG_DISPCNT &= 0xFEFF;
        REG_BG0CNT = 0;
        REG_BG0HOFS = 0;
        REG_BG0VOFS = 0;
    }
    if (!(a & 0x200))
    {
        REG_DISPCNT &= 0xFDFF;
        REG_BG1CNT = 0;
        REG_BG1HOFS = 0;
        REG_BG1VOFS = 0;
    }
    if (!(a & 0x400))
    {
        REG_DISPCNT &= 0xFBFF;
        REG_BG2CNT = 0;
        REG_BG2HOFS = 0;
        REG_BG2VOFS = 0;
    }
    if (!(a & 0x800))
    {
        REG_DISPCNT &= 0xF7FF;
        REG_BG3CNT = 0;
        REG_BG3HOFS = 0;
        REG_BG3VOFS = 0;
    }
    if (!(a & 0x1000))
    {
        REG_DISPCNT &= 0xEFFF;
        ResetSpriteData();
        FreeAllSpritePalettes();
        gReservedSpritePaletteCount = 8;
    }
}

static void PrintEntryScreenDexNum(u16 order, u8 b, u8 c)
{
    u8 str[4];

    str[0] = CHAR_0 + order / 100;
    str[1] = CHAR_0 + (order % 100) / 10;
    str[2] = CHAR_0 + (order % 100) % 10;
    str[3] = EOS;
    Menu_PrintText(str, b, c);
}

static u8 PrintEntryScreenSpeciesName(u16 num, u8 b, u8 c)
{
    u8 str[11];
    u8 i;

    for (i = 0; i < 11; i++)
        str[i] = EOS;
    num = NationalPokedexNumToSpecies(num);
    if (num)
    {
        for (i = 0; gSpeciesNames[num][i] != EOS && i < 10; i++)
            str[i] = gSpeciesNames[num][i];
    }
    else
    {
        for (i = 0; i < 10; i++)
            str[i] = 0xAE;
    }
    Menu_PrintText(str, b, c);
    return i;
}

static u8 PrintCryScreenSpeciesName(u16 num, u8 b, u8 c, u8 d)
{
    u8 str[40];
    u8 *end;
    u8 i;

    end = StringCopy(str, sText_ClearTo0);
    str[2] = d;
    num = NationalPokedexNumToSpecies(num);
    switch (num)
    {
    default:
        for (i = 0; gSpeciesNames[num][i] != EOS && i < 10; i++)
            end[i] = gSpeciesNames[num][i];
        break;
    case 0:
        for (i = 0; i < 10; i++)
            end[i] = 0xAE;
        break;
    }
    end[i] = EOS;
    Menu_PrintText(str, b, c);
    return i;
}

static void UnusedPrintMonName(const u8 *name, u8 left, u8 top)
{
    u8 str[32];
    u8 i;
#if ENGLISH
    u8 j;
#endif

    for (i = 0; name[i] != EOS && i < 11; i++)
        str[i] = name[i];
#if ENGLISH
    for (j = 0; gDexText_UnknownPoke[j] == CHAR_QUESTION_MARK || gDexText_UnknownPoke[j] == CHAR_SPACE; j++)
        ;
    j--;
    while (gDexText_UnknownPoke[j] != EOS)
        str[i++] = gDexText_UnknownPoke[j++];
#endif
    str[i] = EOS;
    MenuPrint_AlignedToRightOfReferenceString(str, left, top, gDexText_UnknownPoke);
}

#if ENGLISH
void UnusedPrintDecimalNum(u16 a, u8 left, u8 top)
{
    u8 str[6];
    bool8 outputted = FALSE;
    u8 result;

    result = a / 1000;
    if (result == 0)
    {
        str[0] = CHAR_SPACE;
        outputted = FALSE;
    }
    else
    {
        str[0] = CHAR_0 + result;
        outputted = TRUE;
    }

    result = (a % 1000) / 100;
    if (result == 0 && !outputted)
    {
        str[1] = CHAR_SPACE;
        outputted = FALSE;
    }
    else
    {
        str[1] = CHAR_0 + result;
        outputted = TRUE;
    }

    str[2] = CHAR_0 + ((a % 1000) % 100) / 10;
    str[3] = CHAR_PERIOD;
    str[4] = CHAR_0 + ((a % 1000) % 100) % 10;
    str[5] = EOS;
    Menu_PrintText(str, left, top);
}
#elif GERMAN
void UnusedPrintDecimalNum(u16 arg0, u8 left, u8 top) {
    u8 buffer[8];
    int offset;
    u8 result;

    u8 r6 = 0;
    offset = 0;


    buffer[r6++] = 0xFC;
    buffer[r6++] = 0x13;
    r6++;

    result = (arg0 / 1000);
    if (result == 0)
    {
        offset = 6;
    }
    else
    {
        buffer[r6++] = result + CHAR_0;
    }


    result = (arg0 % 1000) / 100;

    if (result == 0 && offset != 0)
    {
        offset += 6;
    }
    else
    {
        buffer[r6++] = result + CHAR_0;
    }

    buffer[r6++] = (((arg0 % 1000) % 100) / 10) + CHAR_0;
    buffer[r6++] = CHAR_COMMA;
    buffer[r6++] = (((arg0 % 1000) % 100) % 10) + CHAR_0;

    buffer[r6++] = EOS;
    buffer[2] = offset;
    Menu_PrintText(buffer, left, top);
}
#endif

#ifdef UNITS_IMPERIAL
#define CHAR_PRIME (0xB4)
#define CHAR_DOUBLE_PRIME (0xB2)
static void sub_8091458(u16 height, u8 left, u8 top)
{
    u8 buffer[16];
    u32 inches, feet;
    u8 i = 0;

    inches = (height * 10000) / 254;
    if (inches % 10 >= 5)
        inches += 10;
    feet = inches / 120;
    inches = (inches - (feet * 120)) / 10;

    buffer[i++] = EXT_CTRL_CODE_BEGIN;
    buffer[i++] = 0x13;
    if (feet / 10 == 0)
    {
        buffer[i++] = 18;
        buffer[i++] = feet + CHAR_0;
    }
    else
    {
        buffer[i++] = 12;
        buffer[i++] = feet / 10 + CHAR_0;
        buffer[i++] = (feet % 10) + CHAR_0;
    }
    buffer[i++] = CHAR_PRIME;
    buffer[i++] = (inches / 10) + CHAR_0;
    buffer[i++] = (inches % 10) + CHAR_0;
    buffer[i++] = CHAR_DOUBLE_PRIME;
    buffer[i++] = EOS;
    Menu_PrintText(buffer, left, top);
}
#else
static void sub_8091458(u16 height, u8 left, u8 top)
{
    UnusedPrintDecimalNum(height, left, top);
}
#endif

#ifdef UNITS_IMPERIAL
static void sub_8091564(u16 weight, u8 left, u8 top)
{
    u8 buffer[16];
    u32 lbs;
    u8 i = 0;
    bool8 output;

    lbs = (weight * 100000) / 4536;
    if (lbs % 10 >= 5)
        lbs += 10;
    output = FALSE;

    buffer[i] = (lbs / 100000) + CHAR_0;
    if (buffer[i] == CHAR_0 && output == FALSE)
    {
        buffer[i++] = CHAR_SPACE;
        buffer[i++] = CHAR_SPACE;
    }
    else
    {
        output = TRUE;
        i++;
    }

    lbs = (lbs % 100000);
    buffer[i] = (lbs / 10000) + CHAR_0;
    if (buffer[i] == CHAR_0 && output == FALSE)
    {
        buffer[i++] = CHAR_SPACE;
        buffer[i++] = CHAR_SPACE;
    }
    else
    {
        output = TRUE;
        i++;
    }

    lbs = (lbs % 10000);
    buffer[i] = (lbs / 1000) + CHAR_0;
    if (buffer[i] == CHAR_0 && output == FALSE)
    {
        buffer[i++] = CHAR_SPACE;
        buffer[i++] = CHAR_SPACE;
    }
    else
    {
        output = TRUE;
        i++;
    }
    lbs = (lbs % 1000);
    buffer[i++] = (lbs / 100) + CHAR_0;
    lbs = (lbs % 100);
    buffer[i++] = CHAR_PERIOD;
    buffer[i++] = (lbs / 10) + CHAR_0;
    buffer[i++] = CHAR_SPACE;
    buffer[i++] = CHAR_l;
    buffer[i++] = CHAR_b;
    buffer[i++] = CHAR_s;
    buffer[i++] = CHAR_PERIOD;
    buffer[i++] = EOS;
    Menu_PrintText(buffer, left, top);
}
#else
static void sub_8091564(u16 arg0, u8 left, u8 top)
{
    UnusedPrintDecimalNum(arg0, left, top);
}
#endif

void PrintFootprint(u16 num, u16 b, u16 c)
{
    u8 arr[0x80];
    u16 i, j, r7;
    const u8 *r12;
    u8 r3, r1;

    r12 = (const u8*)sMonFootprintTable[NationalPokedexNumToSpecies(num)];
    r7 = 0;
    for (i = 0; i < 32; i++)
    {
        r3 = r12[i];
        for (j = 0; j < 4; j++)
        {
            r1 = 0;
            if (r3 & (1 << (j * 2)))
                r1 |= 0x01;
            if (r3 & (2 << (j * 2)))
                r1 |= 0x10;

            arr[r7] = r1;
            r7++;
        }
    }
    CpuCopy16((void*)arr, (void *)(BG_VRAM + b * 0x4000 + c * 0x20), 0x80);
}

static void sub_80C0DC0(u16 a, u16 b)
{
    *(u16 *)(BG_VRAM + a * 0x800 + 0x232) = 0xF000 + b + 0;
    *(u16 *)(BG_VRAM + a * 0x800 + 0x234) = 0xF000 + b + 1;
    *(u16 *)(BG_VRAM + a * 0x800+ 0x272) = 0xF000 + b + 2;
    *(u16 *)(BG_VRAM + a * 0x800 + 0x274) = 0xF000 + b + 3;
}

static u16 GetNextPosition(u8 direction, u16 position, u16 min, u16 max)
{
    switch (direction)
    {
    case 1:
        if (position > min)
            position--;
        break;
    case 0:
        if (position < max)
            position++;
        break;
    case 3:
        if (position > min)
            position--;
        else
            position = max;
        break;
    case 2:
        if (position < max)
            position++;
        else
            position = min;
        break;
    }
    return position;
}

static void _SpriteCB_Dummy(struct Sprite *sprite)
{
}

static void SetSpriteTemplateForPokemonPic(u16 paletteTag, u8 imagesSet)
{
    gCreatingSpriteTemplate = sMonOrTrainerPicSpriteTemplate;
    gCreatingSpriteTemplate.paletteTag = paletteTag;
    gCreatingSpriteTemplate.images = sSpriteFrameImages_MonOrTrainerPic[imagesSet];
    gCreatingSpriteTemplate.anims = gSpriteAnimTable_81E7C64;
}

static void SetSpriteTemplateForSizeComparisonTrainerPic(u16 paletteTag, u8 imagesSet)
{
    gCreatingSpriteTemplate = sMonOrTrainerPicSpriteTemplate;
    gCreatingSpriteTemplate.paletteTag = paletteTag;
    gCreatingSpriteTemplate.images = sSpriteFrameImages_MonOrTrainerPic[imagesSet];
    gCreatingSpriteTemplate.anims = gUnknown_081EC2A4[0];
}

u16 CreateMonSpriteFromNationalDexNumber(u16 num, s16 x, s16 y, u16 paletteNum)
{
    u8 spriteId;

    num = NationalPokedexNumToSpecies(num);
    switch (num)
    {
    default:
        DecompressPicFromTable_2(
          &gMonFrontPicTable[num],
          gMonFrontPicCoords[num].coords,
          gMonFrontPicCoords[num].y_offset,
          (void *)EWRAM,
          sMonOrTrainerPicDecompressDestPtrs[paletteNum],
          num);
        break;
    case SPECIES_SPINDA:
        LoadSpecialPokePic(
          &gMonFrontPicTable[num],
          gMonFrontPicCoords[num].coords,
          gMonFrontPicCoords[num].y_offset,
          (void *)EWRAM,
          sMonOrTrainerPicDecompressDestPtrs[paletteNum],
          num,
          gSaveBlock2.pokedex.spindaPersonality,
          1);
        break;
    case SPECIES_UNOWN:
        LoadSpecialPokePic(
          &gMonFrontPicTable[num],
          gMonFrontPicCoords[num].coords,
          gMonFrontPicCoords[num].y_offset,
          (void *)EWRAM,
          sMonOrTrainerPicDecompressDestPtrs[paletteNum],
          num,
          gSaveBlock2.pokedex.unownPersonality,
          1);
        break;
    }
    LoadCompressedPalette(gMonPaletteTable[num].data, 0x100 + paletteNum * 16, 32);
    SetSpriteTemplateForPokemonPic(paletteNum, paletteNum);
    spriteId = CreateSprite(&gCreatingSpriteTemplate, x, y, 0);
    gSprites[spriteId].oam.paletteNum = paletteNum;
    return spriteId;
}

u16 CreateSizeScreenTrainerPic(u16 gender, s16 x, s16 y, u16 paletteNum)
{
    u8 spriteId;

    DecompressPicFromTable_2(
      &gTrainerFrontPicTable[gender],
      gTrainerFrontPicCoords[gender].coords,
      gTrainerFrontPicCoords[gender].y_offset,
      (void *)EWRAM,
      sMonOrTrainerPicDecompressDestPtrs[0],
      gender);
    SetSpriteTemplateForSizeComparisonTrainerPic(gender, 0);
    spriteId = CreateSprite(&gCreatingSpriteTemplate, x, y, 0);
    gSprites[spriteId].oam.paletteNum = paletteNum;
    return spriteId;
}

int DoPokedexSearch(u8 dexMode, u8 order, u8 abcGroup, u8 bodyColor, u8 type1, u8 type2)
{
    u16 species;
    u16 i;
    u16 resultsCount;
    u8 types[2];

    SortPokedex(dexMode, order);

    for (i = 0, resultsCount = 0; i < NATIONAL_DEX_COUNT; i++)
    {
        if (gPokedexView->pokedexList[i].seen)
        {
            gPokedexView->pokedexList[resultsCount] = gPokedexView->pokedexList[i];
            resultsCount++;
        }
    }
    gPokedexView->pokemonListCount = resultsCount;

    // Search by name
    if (abcGroup != 0xFF)
    {
        for (i = 0, resultsCount = 0; i < gPokedexView->pokemonListCount; i++)
        {
            u8 r3;

            species = NationalPokedexNumToSpecies(gPokedexView->pokedexList[i].dexNum);
            r3 = gSpeciesNames[species][0];
            if ((r3 >= sLetterSearchRanges[abcGroup][0] && r3 < sLetterSearchRanges[abcGroup][0] + sLetterSearchRanges[abcGroup][1])
             || (r3 >= sLetterSearchRanges[abcGroup][2] && r3 < sLetterSearchRanges[abcGroup][2] + sLetterSearchRanges[abcGroup][3]))
            {
                gPokedexView->pokedexList[resultsCount] = gPokedexView->pokedexList[i];
                resultsCount++;
            }
        }
        gPokedexView->pokemonListCount = resultsCount;
    }

    // Search by body color
    if (bodyColor != 0xFF)
    {
        for (i = 0, resultsCount = 0; i < gPokedexView->pokemonListCount; i++)
        {
            species = NationalPokedexNumToSpecies(gPokedexView->pokedexList[i].dexNum);

            if (bodyColor == gBaseStats[species].bodyColor)
            {
                gPokedexView->pokedexList[resultsCount] = gPokedexView->pokedexList[i];
                resultsCount++;
            }
        }
        gPokedexView->pokemonListCount = resultsCount;
    }

    // Search by type
    if (type1 != 0xFF || type2 != 0xFF)
    {
        if (type1 == 0xFF)
        {
            type1 = type2;
            type2 = 0xFF;
        }

        if (type2 == 0xFF)
        {
            for (i = 0, resultsCount = 0; i < gPokedexView->pokemonListCount; i++)
            {
                if (gPokedexView->pokedexList[i].owned)
                {
                    species = NationalPokedexNumToSpecies(gPokedexView->pokedexList[i].dexNum);

                    types[0] = gBaseStats[species].type1;
                    types[1] = gBaseStats[species].type2;
                    if (types[0] == type1 || types[1] == type1)
                    {
                        gPokedexView->pokedexList[resultsCount] = gPokedexView->pokedexList[i];
                        resultsCount++;
                    }
                }
            }
        }
        else
        {
            for (i = 0, resultsCount = 0; i < gPokedexView->pokemonListCount; i++)
            {
                if (gPokedexView->pokedexList[i].owned)
                {
                    species = NationalPokedexNumToSpecies(gPokedexView->pokedexList[i].dexNum);

                    types[0] = gBaseStats[species].type1;
                    types[1] = gBaseStats[species].type2;
                    if ((types[0] == type1 && types[1] == type2) || (types[0] == type2 && types[1] == type1))
                    {
                        gPokedexView->pokedexList[resultsCount] = gPokedexView->pokedexList[i];
                        resultsCount++;
                    }
                }
            }
        }
        gPokedexView->pokemonListCount = resultsCount;
    }

    if (gPokedexView->pokemonListCount != 0)
    {
        for (i = gPokedexView->pokemonListCount; i < NATIONAL_DEX_COUNT; i++)
        {
            gPokedexView->pokedexList[i].dexNum = 0xFFFF;
            gPokedexView->pokedexList[i].seen = FALSE;
            gPokedexView->pokedexList[i].owned = FALSE;

        }
    }

    return resultsCount;
}

#if ENGLISH
#define SUB_8091E20_WIDTH (208)
#elif GERMAN
#define SUB_8091E20_WIDTH (216)
#endif

void EraseAndPrintSearchTextBox(const u8 *str)
{
    sub_8072AB0(str, 9, 120, SUB_8091E20_WIDTH, 32, 1);
}

u8 LoadSearchMenu(void)
{
    return CreateTask(Task_LoadSearchMenu, 0);
}

static void Task_LoadSearchMenu(u8 taskId)
{
    u16 i;

    switch (gMain.state)
    {
    default:
    case 0:
        if (!gPaletteFade.active)
        {
            gPokedexView->currentPage = 2;
            ResetOtherVideoRegisters(0);
            LZ77UnCompVram(gPokedexMenuSearch_Gfx, (void *)VRAM);
            LZ77UnCompVram(gPokedexMenuSearch_Tilemap, (void *)(VRAM + 0x7800));
            LoadPalette(gPokedexMenuSearch_Pal + 1, 1, 0x7E);
            if (!IsNationalPokedexEnabled())
            {
                for (i = 0; i < 17; i++)
                {
                    ((u16 *)(VRAM + 0x7A80))[i] = ((u16 *)(VRAM + 0x7B00))[i];
                    ((u16 *)(VRAM + 0x7AC0))[i] = ((u16 *)(VRAM + 0x7B40))[i];
                    ((u16 *)(VRAM + 0x7B00))[i] = 1;
                    ((u16 *)(VRAM + 0x7B40))[i] = 1;
                }
            }
            gMain.state = 1;
        }
        break;
    case 1:
        Text_LoadWindowTemplate(&gWindowTemplate_81E7064);
        InitMenuWindow(&gWindowTemplate_81E7064);
        LoadCompressedObjectPic(&sInterfaceSpriteSheet[0]);
        LoadSpritePalettes(sInterfaceSpritePalette);
        CreateSearchParameterScrollArrows(taskId);
        for (i = 0; i < 16; i++)
            gTasks[taskId].data[i] = 0;
        SetDefaultSearchModeAndOrder(taskId);
        HighlightSelectedSearchTopBarItem(0);
        PrintSelectedSearchParameters(taskId);
        gMain.state++;
        break;
    case 2:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
        gMain.state++;
        break;
    case 3:
        REG_BG3CNT = 0x0F03;
        REG_DISPCNT = 0x1C40;
        gMain.state++;
        break;
    case 4:
        if (!gPaletteFade.active)
        {
            gTasks[taskId].func = Task_SwitchToSearchMenuTopBar;
            gMain.state = 0;
        }
        break;
    }
}

static void Task_SwitchToSearchMenuTopBar(u8 taskId)
{
    HighlightSelectedSearchTopBarItem(gTasks[taskId].data[0]);
    PrintSelectedSearchParameters(taskId);
    gTasks[taskId].func = Task_HandleSearchTopBarInput;
}

static void Task_HandleSearchTopBarInput(u8 taskId)
{
    if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_PC_OFF);
        gTasks[taskId].func = Task_ExitSearch;
        return;
    }
    if (gMain.newKeys & A_BUTTON)
    {
        switch (gTasks[taskId].data[0])
        {
        case 0:
            PlaySE(SE_PIN);
            gTasks[taskId].data[1] = 0;
            gTasks[taskId].func = Task_SwitchToSearchMenu;
            break;
        case 1:
            PlaySE(SE_PIN);
            gTasks[taskId].data[1] = 4;
            gTasks[taskId].func = Task_SwitchToSearchMenu;
            break;
        case 2:
            PlaySE(SE_PC_OFF);
            gTasks[taskId].func = Task_ExitSearch;
            break;
        }
        return;
    }
    if ((gMain.newKeys & DPAD_LEFT) && gTasks[taskId].data[0] > 0)
    {
        PlaySE(SE_DEX_PAGE);
        gTasks[taskId].data[0]--;
        HighlightSelectedSearchTopBarItem(gTasks[taskId].data[0]);
    }
    if ((gMain.newKeys & DPAD_RIGHT) && gTasks[taskId].data[0] < 2)
    {
        PlaySE(SE_DEX_PAGE);
        gTasks[taskId].data[0]++;
        HighlightSelectedSearchTopBarItem(gTasks[taskId].data[0]);
    }
}

static void Task_SwitchToSearchMenu(u8 taskId)
{
    HighlightSelectedSearchMenuItem(gTasks[taskId].data[0], gTasks[taskId].data[1]);
    PrintSelectedSearchParameters(taskId);
    gTasks[taskId].func = Task_HandleSearchMenuInput;
}

static void Task_HandleSearchMenuInput(u8 taskId)
{
    const u8 (*r6)[4];

    if (gTasks[taskId].data[0] != 0)
    {
        if (!IsNationalPokedexEnabled())
            r6 = sSearchMovementMap_ShiftHoennDex;
        else
            r6 = sSearchMovementMap_ShiftNatDex;
    }
    else
    {
        if (!IsNationalPokedexEnabled())
            r6 = sSearchMovementMap_SearchHoennDex;
        else
            r6 = sSearchMovementMap_SearchNatDex;
    }

    if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_BALL);
        SetDefaultSearchModeAndOrder(taskId);
        gTasks[taskId].func = Task_SwitchToSearchMenuTopBar;
        return;
    }
    if (gMain.newKeys & A_BUTTON)
    {
        if (gTasks[taskId].data[1] == 6)
        {
            if (gTasks[taskId].data[0] != 0)
            {
                sPokeBallRotation = 0x40;
                gPokedexView->pokeBallRotationBackup = 0x40;
                sLastSelectedPokemon = 0;
                gPokedexView->selectedPokemonBackup = 0;
                gSaveBlock2.pokedex.mode = GetSearchModeSelection(taskId, 5);
                if (!IsNationalPokedexEnabled())
                    gSaveBlock2.pokedex.mode = 0;
                gPokedexView->dexModeBackup = gSaveBlock2.pokedex.mode;
                gSaveBlock2.pokedex.order = GetSearchModeSelection(taskId, 4);
                gPokedexView->dexOrderBackup = gSaveBlock2.pokedex.order;
                PlaySE(SE_PC_OFF);
                gTasks[taskId].func = Task_ExitSearch;
            }
            else
            {
                EraseAndPrintSearchTextBox(gDexText_Searching);
                gTasks[taskId].func = Task_StartPokedexSearch;
                PlaySE(SE_DEX_SEARCH);
            }
        }
        else
        {
            PlaySE(SE_PIN);
            gTasks[taskId].func = Task_SelectSearchMenuItem;
        }
        return;
    }

    if ((gMain.newKeys & DPAD_LEFT) && r6[gTasks[taskId].data[1]][0] != 0xFF)
    {
        PlaySE(SE_SELECT);
        gTasks[taskId].data[1] = r6[gTasks[taskId].data[1]][0];
        HighlightSelectedSearchMenuItem(gTasks[taskId].data[0], gTasks[taskId].data[1]);
    }
    if ((gMain.newKeys & DPAD_RIGHT) && r6[gTasks[taskId].data[1]][1] != 0xFF)
    {
        PlaySE(SE_SELECT);
        gTasks[taskId].data[1] = r6[gTasks[taskId].data[1]][1];
        HighlightSelectedSearchMenuItem(gTasks[taskId].data[0], gTasks[taskId].data[1]);
    }
    if ((gMain.newKeys & DPAD_UP) && r6[gTasks[taskId].data[1]][2] != 0xFF)
    {
        PlaySE(SE_SELECT);
        gTasks[taskId].data[1] = r6[gTasks[taskId].data[1]][2];
        HighlightSelectedSearchMenuItem(gTasks[taskId].data[0], gTasks[taskId].data[1]);
    }
    if ((gMain.newKeys & DPAD_DOWN) && r6[gTasks[taskId].data[1]][3] != 0xFF)
    {
        PlaySE(SE_SELECT);
        gTasks[taskId].data[1] = r6[gTasks[taskId].data[1]][3];
        HighlightSelectedSearchMenuItem(gTasks[taskId].data[0], gTasks[taskId].data[1]);
    }
}

static void Task_StartPokedexSearch(u8 taskId)
{
    u8 r10 = GetSearchModeSelection(taskId, 5);
    u8 r9 = GetSearchModeSelection(taskId, 4);
    u8 r8 = GetSearchModeSelection(taskId, 0);
    u8 r6 = GetSearchModeSelection(taskId, 1);
    u8 r4 = GetSearchModeSelection(taskId, 2);
    u8 r0 = GetSearchModeSelection(taskId, 3);

    DoPokedexSearch(r10, r9, r8, r6, r4, r0);
    gTasks[taskId].func = Task_WaitAndCompleteSearch;
}

static void Task_WaitAndCompleteSearch(u8 taskId)
{
    if (!IsSEPlaying())
    {
        if (gPokedexView->pokemonListCount != 0)
        {
            PlaySE(SE_SUCCESS);
            EraseAndPrintSearchTextBox(gDexText_SearchComplete);
        }
        else
        {
            PlaySE(SE_FAILURE);
            EraseAndPrintSearchTextBox(gDexText_NoMatching);
        }
        gTasks[taskId].func = Task_SearchCompleteWaitForInput;
    }
}

static void Task_SearchCompleteWaitForInput(u8 taskId)
{
    if (gMain.newKeys & A_BUTTON)
    {
        if (gPokedexView->pokemonListCount != 0)
        {
            gPokedexView->screenSwitchState = 1;
            gPokedexView->dexMode = GetSearchModeSelection(taskId, 5);
            gPokedexView->dexOrder = GetSearchModeSelection(taskId, 4);
            gTasks[taskId].func = Task_ExitSearch;
            PlaySE(SE_PC_OFF);
        }
        else
        {
            gTasks[taskId].func = Task_SwitchToSearchMenu;
            PlaySE(SE_BALL);
        }
    }
}

static void PrintSelectorArrow(u16 a, int unused)
{
    MenuCursor_SetPos814AD7C(0x90, (a * 2 + 1) * 8);
}

static void Task_SelectSearchMenuItem(u8 taskId)
{
    u8 r0;
    u16 *p1;
    u16 *p2;

    DrawOrEraseSearchParameterBox(0);
    r0 = gTasks[taskId].data[1];
    p1 = (u16 *)&gTasks[taskId].data[sSearchOptions[r0].taskDataCursorPos];
    p2 = (u16 *)&gTasks[taskId].data[sSearchOptions[r0].taskDataScrollOffset];
    gTasks[taskId].data[14] = *p1;
    gTasks[taskId].data[15] = *p2;
    PrintSearchParameterText(taskId);
    CreateBlendedOutlineCursor(16, 0xFFFF, 12, 0x2D9F, 11);
    PrintSelectorArrow(*p1, 1);
    gTasks[taskId].func = Task_HandleSearchParameterInput;
}

static void Task_HandleSearchParameterInput(u8 taskId)
{
    u8 r1;
    const struct SearchOptionText *r8;
    u16 *p1;
    u16 *p2;
    u16 r2;
    bool8 r3;

    r1 = gTasks[taskId].data[1];
    r8 = sSearchOptions[r1].texts;
    p1 = (u16 *)&gTasks[taskId].data[sSearchOptions[r1].taskDataCursorPos];
    p2 = (u16 *)&gTasks[taskId].data[sSearchOptions[r1].taskDataScrollOffset];
    r2 = sSearchOptions[r1].numOptions - 1;
    if (gMain.newKeys & A_BUTTON)
    {
        sub_814ADC8();
        PlaySE(SE_PIN);
        Menu_EraseWindowRect(18, 1, 28, 12);
        DrawOrEraseSearchParameterBox(1);
        gTasks[taskId].func = Task_SwitchToSearchMenu;
        return;
    }
    if (gMain.newKeys & B_BUTTON)
    {
        sub_814ADC8();
        PlaySE(SE_BALL);
        Menu_EraseWindowRect(18, 1, 28, 12);
        DrawOrEraseSearchParameterBox(1);
        *p1 = gTasks[taskId].data[14];
        *p2 = gTasks[taskId].data[15];
        gTasks[taskId].func = Task_SwitchToSearchMenu;
        return;
    }
    r3 = FALSE;
    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        if (*p1 != 0)
        {
            PrintSelectorArrow(*p1, 0);
            (*p1)--;
            PrintSelectorArrow(*p1, 1);
            r3 = TRUE;
        }
        else if (*p2 != 0)
        {
            (*p2)--;
            PrintSearchParameterText(taskId);
            PrintSelectorArrow(*p1, 1);
            r3 = TRUE;
        }
        if (r3)
        {
            PlaySE(SE_SELECT);
            EraseAndPrintSearchTextBox(r8[*p1 + *p2].description);
        }
        return;
    }
    if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        if (*p1 < 5 && *p1 < r2)
        {
            PrintSelectorArrow(*p1, 0);
            (*p1)++;
            PrintSelectorArrow(*p1, 1);
            r3 = TRUE;
        }
        else if (r2 > 5 && *p2 < r2 - 5)
        {
            (*p2)++;
            PrintSearchParameterText(taskId);
            PrintSelectorArrow(5, 1);
            r3 = TRUE;
        }
        if (r3)
        {
            PlaySE(SE_SELECT);
            EraseAndPrintSearchTextBox(r8[*p1 + *p2].description);
        }
        return;
    }
}

static void Task_ExitSearch(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
    gTasks[taskId].func = Task_ExitSearchWaitForFade;
}

static void Task_ExitSearchWaitForFade(u8 taskId)
{
    if (!gPaletteFade.active)
        DestroyTask(taskId);
}

#define VRAM_ADDR(a, b, c) *(u16 *)(BG_VRAM + (15 * 0x800) + (c) * 64 + ((b) + (a))*2)
void SetSearchRectHighlight(u8 a, u8 b, u8 c, u8 d)
{
    u16 i, j;

    for (i = 0; i < d; i++)
    {
        j = VRAM_ADDR(i, b, c);
        j &= 0xFFF;
        j |= a << 12;

        VRAM_ADDR(i, b, c) = j;

        j = VRAM_ADDR(i, b, c + 1);
        j &= 0xFFF;
        j |= a << 12;
        VRAM_ADDR(i, b, c + 1) = j;
    }
}

static void DrawSearchMenuItemBgHighlight(u8 searchBg, u8 unselected, u8 disabled)
{
    u8 r5 = (unselected & 1) | ((disabled & 1) << 1);

    switch (searchBg)
    {
    case 0:
    case 1:
    case 2:
        SetSearchRectHighlight(r5,
            sSearchMenuTopBarItems[searchBg].highlightX,
            sSearchMenuTopBarItems[searchBg].highlightY,
            sSearchMenuTopBarItems[searchBg].highlightWidth);
        break;
    case 3:
    case 4:
    case 7:
    case 8:
        SetSearchRectHighlight(r5,
            sSearchMenuItems[searchBg - 3].titleBgX,
            sSearchMenuItems[searchBg - 3].titleBgY,
            sSearchMenuItems[searchBg - 3].titleBgWidth);
        // fall through
    case 5:
    case 6:
        SetSearchRectHighlight(r5,
            sSearchMenuItems[searchBg - 3].selectionBgX,
            sSearchMenuItems[searchBg - 3].selectionBgY,
            sSearchMenuItems[searchBg - 3].selectionBgWidth);
        break;
    case 10:
        SetSearchRectHighlight(
            r5, sSearchMenuItems[2].titleBgX, sSearchMenuItems[2].titleBgY, sSearchMenuItems[2].titleBgWidth);
        break;
    case 9:
        if (!IsNationalPokedexEnabled())
            SetSearchRectHighlight(r5,
                sSearchMenuItems[searchBg - 3].titleBgX,
                sSearchMenuItems[searchBg - 3].titleBgY - 2,
                sSearchMenuItems[searchBg - 3].titleBgWidth);
        else
            SetSearchRectHighlight(r5,
                sSearchMenuItems[searchBg - 3].titleBgX,
                sSearchMenuItems[searchBg - 3].titleBgY,
                sSearchMenuItems[searchBg - 3].titleBgWidth);
        break;
    }
}

static void SetInitialSearchMenuBgHighlights(u8 topBarItem)
{
    switch (topBarItem)
    {
    case 0:
        DrawSearchMenuItemBgHighlight(0, 0, 0);
        DrawSearchMenuItemBgHighlight(1, 1, 0);
        DrawSearchMenuItemBgHighlight(2, 1, 0);
        DrawSearchMenuItemBgHighlight(3, 1, 0);
        DrawSearchMenuItemBgHighlight(4, 1, 0);
        DrawSearchMenuItemBgHighlight(10, 1, 0);
        DrawSearchMenuItemBgHighlight(5, 1, 0);
        DrawSearchMenuItemBgHighlight(6, 1, 0);
        DrawSearchMenuItemBgHighlight(7, 1, 0);
        DrawSearchMenuItemBgHighlight(8, 1, 0);
        DrawSearchMenuItemBgHighlight(9, 1, 0);
        break;
    case 1:
        DrawSearchMenuItemBgHighlight(0, 1, 0);
        DrawSearchMenuItemBgHighlight(1, 0, 0);
        DrawSearchMenuItemBgHighlight(2, 1, 0);
        DrawSearchMenuItemBgHighlight(3, 1, 1);
        DrawSearchMenuItemBgHighlight(4, 1, 1);
        DrawSearchMenuItemBgHighlight(10, 1, 1);
        DrawSearchMenuItemBgHighlight(5, 1, 1);
        DrawSearchMenuItemBgHighlight(6, 1, 1);
        DrawSearchMenuItemBgHighlight(7, 1, 0);
        DrawSearchMenuItemBgHighlight(8, 1, 0);
        DrawSearchMenuItemBgHighlight(9, 1, 0);
        break;
    case 2:
        DrawSearchMenuItemBgHighlight(0, 1, 0);
        DrawSearchMenuItemBgHighlight(1, 1, 0);
        DrawSearchMenuItemBgHighlight(2, 0, 0);
        DrawSearchMenuItemBgHighlight(3, 1, 1);
        DrawSearchMenuItemBgHighlight(4, 1, 1);
        DrawSearchMenuItemBgHighlight(10, 1, 1);
        DrawSearchMenuItemBgHighlight(5, 1, 1);
        DrawSearchMenuItemBgHighlight(6, 1, 1);
        DrawSearchMenuItemBgHighlight(7, 1, 1);
        DrawSearchMenuItemBgHighlight(8, 1, 1);
        DrawSearchMenuItemBgHighlight(9, 1, 1);
        break;
    }
}

static void HighlightSelectedSearchTopBarItem(u8 topBarItem)
{
    SetInitialSearchMenuBgHighlights(topBarItem);
    EraseAndPrintSearchTextBox(sSearchMenuTopBarItems[topBarItem].text);
}

static void HighlightSelectedSearchMenuItem(u8 topBarItem, u8 menuItem)
{
    SetInitialSearchMenuBgHighlights(topBarItem);
    switch (menuItem)
    {
    case 0:
        DrawSearchMenuItemBgHighlight(3, 0, 0);
        break;
    case 1:
        DrawSearchMenuItemBgHighlight(4, 0, 0);
        break;
    case 2:
        DrawSearchMenuItemBgHighlight(10, 0, 0);
        DrawSearchMenuItemBgHighlight(5, 0, 0);
        break;
    case 3:
        DrawSearchMenuItemBgHighlight(10, 0, 0);
        DrawSearchMenuItemBgHighlight(6, 0, 0);
        break;
    case 4:
        DrawSearchMenuItemBgHighlight(7, 0, 0);
        break;
    case 5:
        DrawSearchMenuItemBgHighlight(8, 0, 0);
        break;
    case 6:
        DrawSearchMenuItemBgHighlight(9, 0, 0);
        break;
    }
    EraseAndPrintSearchTextBox(sSearchMenuItems[menuItem].text);
}

static void PrintSelectedSearchParameters(u8 taskId)
{
    u16 var;

    var = gTasks[taskId].data[6] + gTasks[taskId].data[7];
    StringCopy(gStringVar1, sDexSearchNameOptions[var].title);
    Menu_PrintTextPixelCoords(gUnknown_083B5AB2, 45, 16, 1);

    var = gTasks[taskId].data[8] + gTasks[taskId].data[9];
    StringCopy(gStringVar1, sDexSearchColorOptions[var].title);
    Menu_PrintTextPixelCoords(gUnknown_083B5AB2, 45, 32, 1);

    var = gTasks[taskId].data[10] + gTasks[taskId].data[11];
    StringCopy(gStringVar1, sDexSearchTypeOptions[var].title);
    Menu_PrintTextPixelCoords(gUnknown_083B5AAC, 45, 48, 1);

    var = gTasks[taskId].data[12] + gTasks[taskId].data[13];
    StringCopy(gStringVar1, sDexSearchTypeOptions[var].title);
    Menu_PrintTextPixelCoords(gUnknown_083B5AAC, 93, 48, 1);

    var = gTasks[taskId].data[4] + gTasks[taskId].data[5];
    StringCopy(gStringVar1, sDexOrderOptions[var].title);
    Menu_PrintTextPixelCoords(gUnknown_083B5AB2, 45, 64, 1);

    if (IsNationalPokedexEnabled())
    {
        var = gTasks[taskId].data[2] + gTasks[taskId].data[3];
        StringCopy(gStringVar1, sDexModeOptions[var].title);
        Menu_PrintTextPixelCoords(gUnknown_083B5AB2, 45, 80, 1);
    }
}

static void DrawOrEraseSearchParameterBox(u8 a)
{
    u16 i;
    u16 j;

    if (a == 0)
    {
        *((u16 *)(VRAM + 0x7800 + 0x22)) = 0xC0B;
        for (i = 0x12; i < 0x1D; i++)
            *((u16 *)(VRAM + 0x7800 + i * 2)) = 0x80D;
        *((u16 *)(VRAM + 0x7800 + 0x3A)) = 0x80B;
        for (j = 1; j < 13; j++)
        {
            *((u16 *)(VRAM + 0x7800 + 0x22 + j * 64)) = 0x40A;
            for (i = 0x12; i < 0x1D; i++)
                *((u16 *)(VRAM + 0x7800 + j * 64 + i * 2)) = 2;
            *((u16 *)(VRAM + 0x7800 + 0x3A + j * 64)) = 0xA;
        }
        *((u16 *)(VRAM + 0x7800 + 0x362)) = 0x40B;
        for (i = 0x12; i < 0x1D; i++)
            *((u16 *)(VRAM + 0x7800 + 0x340 + i * 2)) = 0xD;
        *((u16 *)(VRAM + 0x7800 + 0x37A)) = 0xB;
    }
    else
    {
        for (j = 0; j < 14; j++)
        {
            for (i = 0x11; i < 0x1E; i++)
            {
                *((u16 *)(VRAM + 0x7800 + j * 64 + i * 2)) = 0x4F;
            }
        }
    }
}

// Prints the currently viewable search parameter titles in the right-hand text box
// and the currently selected search parameter description in the bottom text box
static void PrintSearchParameterText(u8 taskId)
{
    const struct SearchOptionText *r6 = sSearchOptions[gTasks[taskId].data[1]].texts;
    const u16 *r8 = &gTasks[taskId].data[sSearchOptions[gTasks[taskId].data[1]].taskDataCursorPos];
    const u16 *r7 = &gTasks[taskId].data[sSearchOptions[gTasks[taskId].data[1]].taskDataScrollOffset];
    u16 i;
    u16 j;

    Menu_EraseWindowRect(18, 1, 28, 12);
    for (i = 0, j = *r7; i < 6; i++, j++)
    {
        if (r6[j].title == NULL)
            break;
        Menu_PrintText(r6[j].title, 18, i * 2 + 1);
    }
    EraseAndPrintSearchTextBox(r6[*r8 + *r7].description);
}

static u8 GetSearchModeSelection(u8 taskId, u8 b)
{
    const u16 *ptr1 = &gTasks[taskId].data[sSearchOptions[b].taskDataCursorPos];
    const u16 *ptr2 = &gTasks[taskId].data[sSearchOptions[b].taskDataScrollOffset];
    u16 r2 = *ptr1 + *ptr2;

    switch (b)
    {
    default:
        return 0;
    case 5:
        return sPokedexModes[r2];
    case 4:
        return sOrderOptions[r2];
    case 0:
        if (r2 == 0)
            return 0xFF;
        else
            return r2;
    case 1:
        if (r2 == 0)
            return 0xFF;
        else
            return r2 - 1;
    case 2:
    case 3:
        return sDexSearchTypeIds[r2];
    }
}

static void SetDefaultSearchModeAndOrder(u8 taskId)
{
    u16 r3;

    switch (gPokedexView->dexModeBackup)
    {
    default:
    case 0:
        r3 = 0;
        break;
    case 1:
        r3 = 1;
        break;
    }
    gTasks[taskId].data[2] = r3;

    switch (gPokedexView->dexOrderBackup)
    {
    default:
    case 0:
        r3 = 0;
        break;
    case 1:
        r3 = 1;
        break;
    case 2:
        r3 = 2;
        break;
    case 3:
        r3 = 3;
        break;
    case 4:
        r3 = 4;
        break;
    case 5:
        r3 = 5;
        break;
    }
    gTasks[taskId].data[4] = r3;
}

static bool8 SearchParamCantScrollUp(u8 taskId)
{
    u8 val1 = gTasks[taskId].data[1];
    const u16 *ptr = (const u16 *)&gTasks[taskId].data[sSearchOptions[val1].taskDataScrollOffset];
    u16 val2 = sSearchOptions[val1].numOptions - 1;

    if (val2 > 5 && *ptr != 0)
        return FALSE;
    else
        return TRUE;
}

static bool8 SearchParamCantScrollDown(u8 taskId)
{
    u8 val1 = gTasks[taskId].data[1];
    const u16 *ptr = (const u16 *)&gTasks[taskId].data[sSearchOptions[val1].taskDataScrollOffset];
    u16 val2 = sSearchOptions[val1].numOptions - 1;

    if (val2 > 5 && *ptr < val2 - 5)
        return FALSE;
    else
        return TRUE;
}

static void SpriteCB_SearchParameterScrollArrow(struct Sprite *sprite)
{
    if (gTasks[sprite->data[0]].func == Task_HandleSearchParameterInput)
    {
        u8 val;

        if (sprite->data[1] != 0)
        {
            if (SearchParamCantScrollDown(sprite->data[0]))
                sprite->invisible = TRUE;
            else
                sprite->invisible = FALSE;
        }
        else
        {
            if (SearchParamCantScrollUp(sprite->data[0]))
                sprite->invisible = TRUE;
            else
                sprite->invisible = FALSE;
        }
        val = sprite->data[2] + sprite->data[1] * 128;
        sprite->y2 = gSineTable[val] / 128;
        sprite->data[2] += 8;
    }
    else
    {
        sprite->invisible = TRUE;
    }
}

static void CreateSearchParameterScrollArrows(u8 taskId)
{
    u8 spriteId;

    spriteId = CreateSprite(&sScrollArrowSpriteTemplate, 184, 4, 0);
    gSprites[spriteId].data[0] = taskId;
    gSprites[spriteId].data[1] = 0;
    gSprites[spriteId].callback = SpriteCB_SearchParameterScrollArrow;

    spriteId = CreateSprite(&sScrollArrowSpriteTemplate, 184, 108, 0);
    gSprites[spriteId].data[0] = taskId;
    gSprites[spriteId].data[1] = 1;
    gSprites[spriteId].vFlip = TRUE;
    gSprites[spriteId].callback = SpriteCB_SearchParameterScrollArrow;
}
