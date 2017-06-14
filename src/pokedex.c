#include "global.h"
#include "gba/m4a_internal.h"
#include "pokedex.h"
#include "asm.h"
#include "data2.h"
#include "decompress.h"
#include "event_data.h"
#include "m4a.h"
#include "main.h"
#include "menu.h"
#include "menu_cursor.h"
#include "palette.h"
#include "rng.h"
#include "songs.h"
#include "sound.h"
#include "species.h"
#include "string_util.h"
#include "strings.h"
#include "task.h"
#include "trig.h"

// I'm #define-ing these just for now so I can keep using the old unkXXX member names
#define unk60E selectedPokemon
#define unk612 dexMode
#define unk616 dexOrder
#define unk64D selectedScreen
#define unk650 menuIsOpen
#define unk652 menuCursorPos
#define unk654 menuY

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

struct PokedexEntry
{
    /*0x00*/ u8 categoryName[12];
    /*0x0C*/ u16 height; //in decimeters
    /*0x0E*/ u16 weight; //in hectograms
    /*0x10*/ u8 *descriptionPage1;
    /*0x14*/ u8 *descriptionPage2;
    /*0x18*/ u16 unused;
    /*0x1A*/ u16 pokemonScale;
    /*0x1C*/ u16 pokemonOffset;
    /*0x1E*/ u16 trainerScale;
    /*0x20*/ u16 trainerOffset;
};  /*size = 0x24*/

struct UnknownStruct2
{
    const u8 *text1;
    const u8 *text2;
};

struct UnknownStruct1
{
    const struct UnknownStruct2 *unk0;
    u8 unk4;
    u8 unk5;
    u16 unk6;
};

struct UnknownStruct3
{
    const u8 *text;
    u8 unk4;
    u8 unk5;
    u8 unk6;
};

struct UnknownStruct4
{
    const u8 *text;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    u8 unk8;
    u8 unk9;
};

extern struct MusicPlayerInfo gMPlay_BGM;
extern u8 gReservedSpritePaletteCount;
extern struct PokedexView *gPokedexView;
extern struct SpriteTemplate gUnknown_02024E8C;
extern u16 gUnknown_0202FFB8;
extern u8 gUnknown_0202FFBA;
extern struct PokedexListItem *gUnknown_0202FFBC;
extern u8 gUnknown_03005CE8;
extern IntrCallback gUnknown_03005CEC;
extern u8 gUnknown_03005E98;
extern u8 gPokedexMenu_Gfx[];
extern u8 gUnknown_08E96738[];
extern u8 gUnknown_08E96888[];
extern u8 gUnknown_08E96994[];
extern u8 gUnknown_08E9C6DC[];
extern struct SpriteTemplate gSpriteTemplate_83A0524;
extern struct SpriteTemplate gSpriteTemplate_83A053C;
extern struct SpriteTemplate gSpriteTemplate_83A0554;
extern struct SpriteTemplate gSpriteTemplate_83A056C;
extern struct SpriteTemplate gSpriteTemplate_83A0584;
extern struct SpriteTemplate gSpriteTemplate_83A059C;
extern struct SpriteTemplate gSpriteTemplate_83A05B4;
extern struct SpriteSheet gUnknown_083A05CC;
extern struct SpritePalette gUnknown_083A05DC[];
extern u8 gUnknown_083A05EC[];
extern u8 gUnknown_083A05F1[];
extern u8 gUnknown_083A05F8[];
extern u8 gUnknown_083B4EC4[];
extern u8 gUnknown_083B5558[];
extern void *const gUnknown_083B5584[];
extern struct SpriteFrameImage *const gUnknown_083B5794[];
extern const struct SpriteTemplate gUnknown_083B57A4;
extern const u8 gUnknown_083B57BC[][4];
extern const struct UnknownStruct3 gUnknown_083B57E4[];
extern const struct UnknownStruct4 gUnknown_083B57FC[];
extern const u8 gUnknown_083B5850[][4];
extern const u8 gUnknown_083B586C[][4];
extern const u8 gUnknown_083B5888[][4];
extern const u8 gUnknown_083B58A4[][4];
extern const struct UnknownStruct2 gUnknown_083B58C0[];
extern const struct UnknownStruct2 gUnknown_083B58D8[];
extern const struct UnknownStruct2 gUnknown_083B5910[];
extern const struct UnknownStruct2 gUnknown_083B5968[];
extern const struct UnknownStruct2 gUnknown_083B59C8[];
extern const u8 gUnknown_083B5A60[];
extern const u8 gUnknown_083B5A62[];
extern const u8 gUnknown_083B5A68[];
extern const struct UnknownStruct1 gUnknown_083B5A7C[];
extern const u8 gUnknown_083B5AAC[];
extern const u8 gUnknown_083B5AB2[];
extern u8 gUnknown_08D00524[];
extern u8 gUnknown_08E96BD4[];
extern u8 gUnknown_08E96ACC[];
extern u8 gUnknown_08E96B58[];
extern u16 gPokedexMenu_Pal[];
extern u16 gPokedexMenu2_Pal[];
extern const u8 *const gMonFootprintTable[];
extern const struct SpriteSheet gTrainerFrontPicTable[];
extern const struct MonCoords gTrainerFrontPicCoords[];
extern const struct PokedexEntry gPokedexEntries[];
extern const struct BaseStats gBaseStats[];
extern const u8 gPokedexMenuSearch_Gfx[];
extern const u8 gUnknown_08E96D2C[];
extern const u16 gPokedexMenuSearch_Pal[];

extern void sub_814AD7C(u8, u8);
extern void sub_800D74C();
extern const u16 *species_and_otid_get_pal(u16, u32, u32);
extern void m4aMPlayVolumeControl(struct MusicPlayerInfo *mplayInfo, u16 trackBits, u16 volume);
extern bool8 BeginNormalPaletteFade(u32, s8, u8, u8, u16);
extern void remove_some_task(void);
extern u8 sub_8091E3C(void);
extern void DisableNationalPokedex(void);
extern void sub_805469C(void);
extern u16 HoennToNationalOrder(u16);
extern u16 NationalToHoennOrder(u16);

const u16 gUnknown_0839F67C[] = INCBIN_U16("graphics/pokedex/search.gbapal");
const u16 gUnknown_0839F73C[] = INCBIN_U16("graphics/pokedex/national.gbapal");
const u8 gEmptySpacce_839F7FC[0xA4] = {0};
const u8 gUnknown_0839F8A0[] = INCBIN_U8("graphics/pokedex/pokedex_cry_layout.bin.lz");
const u8 gUnknown_0839F988[] = INCBIN_U8("graphics/pokedex/pokedex_size_layout.bin.lz");
const u8 gUnknown_0839FA7C[] = INCBIN_U8("graphics/pokedex/noball.4bpp.lz");
const u16 gPokedexOrder_Alphabetical[] =
{
    387,
    388,
    389,
    390,
    391,
    392,
    393,
    394,
    395,
    396,
    397,
    398,
    399,
    400,
    401,
    402,
    403,
    404,
    405,
    406,
    407,
    408,
    409,
    410,
    411,
     63,  // Abra
    359,  // Absol
    142,  // Aerodactyl
    306,  // Aggron
    190,  // Aipom
     65,  // Alakazam
    334,  // Altaria
    181,  // Ampharos
    347,  // Anorith
     24,  // Arbok
     59,  // Arcanine
    168,  // Ariados
    348,  // Armaldo
    304,  // Aron
    144,  // Articuno
    184,  // Azumarill
    298,  // Azurill
    371,  // Bagon
    343,  // Baltoy
    354,  // Banette
    339,  // Barboach
    153,  // Bayleef
    267,  // Beautifly
     15,  // Beedrill
    374,  // Beldum
    182,  // Bellossom
     69,  // Bellsprout
      9,  // Blastoise
    257,  // Blaziken
    242,  // Blissey
    286,  // Breloom
      1,  // Bulbasaur
     12,  // Butterfree
    331,  // Cacnea
    332,  // Cacturne
    323,  // Camerupt
    318,  // Carvanha
    268,  // Cascoon
    351,  // Castform
     10,  // Caterpie
    251,  // Celebi
    113,  // Chansey
      6,  // Charizard
      4,  // Charmander
      5,  // Charmeleon
    152,  // Chikorita
    358,  // Chimecho
    170,  // Chinchou
    366,  // Clamperl
    344,  // Claydol
     36,  // Clefable
     35,  // Clefairy
    173,  // Cleffa
     91,  // Cloyster
    256,  // Combusken
    341,  // Corphish
    222,  // Corsola
    346,  // Cradily
    342,  // Crawdaunt
    169,  // Crobat
    159,  // Croconaw
    104,  // Cubone
    155,  // Cyndaquil
    301,  // Delcatty
    225,  // Delibird
    386,  // Deoxys
     87,  // Dewgong
     50,  // Diglett
    132,  // Ditto
     85,  // Dodrio
     84,  // Doduo
    232,  // Donphan
    148,  // Dragonair
    149,  // Dragonite
    147,  // Dratini
     96,  // Drowzee
     51,  // Dugtrio
    206,  // Dunsparce
    356,  // Dusclops
    355,  // Duskull
    269,  // Dustox
    133,  // Eevee
     23,  // Ekans
    125,  // Electabuzz
    309,  // Electrike
    101,  // Electrode
    239,  // Elekid
    244,  // Entei
    196,  // Espeon
    102,  // Exeggcute
    103,  // Exeggutor
    295,  // Exploud
     83,  // Farfetch’d
     22,  // Fearow
    349,  // Feebas
    160,  // Feraligatr
    180,  // Flaaffy
    136,  // Flareon
    330,  // Flygon
    205,  // Forretress
    162,  // Furret
    282,  // Gardevoir
     92,  // Gastly
     94,  // Gengar
     74,  // Geodude
    203,  // Girafarig
    362,  // Glalie
    207,  // Gligar
     44,  // Gloom
     42,  // Golbat
    118,  // Goldeen
     55,  // Golduck
     76,  // Golem
    368,  // Gorebyss
    210,  // Granbull
     75,  // Graveler
     88,  // Grimer
    383,  // Groudon
    253,  // Grovyle
     58,  // Growlithe
    326,  // Grumpig
    316,  // Gulpin
    130,  // Gyarados
    297,  // Hariyama
     93,  // Haunter
    214,  // Heracross
    107,  // Hitmonchan
    106,  // Hitmonlee
    237,  // Hitmontop
    250,  // Ho-Oh
    163,  // Hoothoot
    187,  // Hoppip
    116,  // Horsea
    229,  // Houndoom
    228,  // Houndour
    367,  // Huntail
     97,  // Hypno
    174,  // Igglybuff
    314,  // Illumise
      2,  // Ivysaur
     39,  // Jigglypuff
    385,  // Jirachi
    135,  // Jolteon
    189,  // Jumpluff
    124,  // Jynx
    140,  // Kabuto
    141,  // Kabutops
     64,  // Kadabra
     14,  // Kakuna
    115,  // Kangaskhan
    352,  // Kecleon
    230,  // Kingdra
     99,  // Kingler
    281,  // Kirlia
    109,  // Koffing
     98,  // Krabby
    382,  // Kyogre
    305,  // Lairon
    171,  // Lanturn
    131,  // Lapras
    246,  // Larvitar
    380,  // Latias
    381,  // Latios
    166,  // Ledian
    165,  // Ledyba
    108,  // Lickitung
    345,  // Lileep
    264,  // Linoone
    271,  // Lombre
    270,  // Lotad
    294,  // Loudred
    272,  // Ludicolo
    249,  // Lugia
    337,  // Lunatone
    370,  // Luvdisc
     68,  // Machamp
     67,  // Machoke
     66,  // Machop
    240,  // Magby
    219,  // Magcargo
    129,  // Magikarp
    126,  // Magmar
     81,  // Magnemite
     82,  // Magneton
    296,  // Makuhita
    310,  // Manectric
     56,  // Mankey
    226,  // Mantine
    179,  // Mareep
    183,  // Marill
    105,  // Marowak
    259,  // Marshtomp
    284,  // Masquerain
    303,  // Mawile
    308,  // Medicham
    307,  // Meditite
    154,  // Meganium
     52,  // Meowth
    376,  // Metagross
    375,  // Metang
     11,  // Metapod
    151,  // Mew
    150,  // Mewtwo
    262,  // Mightyena
    350,  // Milotic
    241,  // Miltank
    312,  // Minun
    200,  // Misdreavus
    146,  // Moltres
    122,  // Mr. mime
    258,  // Mudkip
     89,  // Muk
    198,  // Murkrow
    177,  // Natu
     34,  // Nidoking
     31,  // Nidoqueen
     29,  // Nidoran♀
     32,  // Nidoran♂
     30,  // Nidorina
     33,  // Nidorino
    290,  // Nincada
     38,  // Ninetales
    291,  // Ninjask
    164,  // Noctowl
    299,  // Nosepass
    322,  // Numel
    274,  // Nuzleaf
    224,  // Octillery
     43,  // Oddish
    138,  // Omanyte
    139,  // Omastar
     95,  // Onix
     46,  // Paras
     47,  // Parasect
    279,  // Pelipper
     53,  // Persian
    231,  // Phanpy
    172,  // Pichu
     18,  // Pidgeot
     17,  // Pidgeotto
     16,  // Pidgey
     25,  // Pikachu
    221,  // Piloswine
    204,  // Pineco
    127,  // Pinsir
    311,  // Plusle
    186,  // Politoed
     60,  // Poliwag
     61,  // Poliwhirl
     62,  // Poliwrath
     77,  // Ponyta
    261,  // Poochyena
    137,  // Porygon
    233,  // Porygon2
     57,  // Primeape
     54,  // Psyduck
    247,  // Pupitar
    195,  // Quagsire
    156,  // Quilava
    211,  // Qwilfish
     26,  // Raichu
    243,  // Raikou
    280,  // Ralts
     78,  // Rapidash
     20,  // Raticate
     19,  // Rattata
    384,  // Rayquaza
    378,  // Regice
    377,  // Regirock
    379,  // Registeel
    369,  // Relicanth
    223,  // Remoraid
    112,  // Rhydon
    111,  // Rhyhorn
    315,  // Roselia
    302,  // Sableye
    373,  // Salamence
     27,  // Sandshrew
     28,  // Sandslash
    254,  // Sceptile
    212,  // Scizor
    123,  // Scyther
    117,  // Seadra
    119,  // Seaking
    364,  // Sealeo
    273,  // Seedot
     86,  // Seel
    161,  // Sentret
    336,  // Seviper
    319,  // Sharpedo
    292,  // Shedinja
    372,  // Shelgon
     90,  // Shellder
    275,  // Shiftry
    285,  // Shroomish
    213,  // Shuckle
    353,  // Shuppet
    266,  // Silcoon
    227,  // Skarmory
    188,  // Skiploom
    300,  // Skitty
    289,  // Slaking
    287,  // Slakoth
     80,  // Slowbro
    199,  // Slowking
     79,  // Slowpoke
    218,  // Slugma
    235,  // Smeargle
    238,  // Smoochum
    215,  // Sneasel
    143,  // Snorlax
    361,  // Snorunt
    209,  // Snubbull
    338,  // Solrock
     21,  // Spearow
    363,  // Spheal
    167,  // Spinarak
    327,  // Spinda
    325,  // Spoink
      7,  // Squirtle
    234,  // Stantler
    121,  // Starmie
    120,  // Staryu
    208,  // Steelix
    185,  // Sudowoodo
    245,  // Suicune
    192,  // Sunflora
    191,  // Sunkern
    283,  // Surskit
    333,  // Swablu
    317,  // Swalot
    260,  // Swampert
    277,  // Swellow
    220,  // Swinub
    276,  // Taillow
    114,  // Tangela
    128,  // Tauros
    216,  // Teddiursa
     72,  // Tentacool
     73,  // Tentacruel
    175,  // Togepi
    176,  // Togetic
    255,  // Torchic
    324,  // Torkoal
    158,  // Totodile
    328,  // Trapinch
    252,  // Treecko
    357,  // Tropius
    157,  // Typhlosion
    248,  // Tyranitar
    236,  // Tyrogue
    197,  // Umbreon
    201,  // Unown
    217,  // Ursaring
    134,  // Vaporeon
     49,  // Venomoth
     48,  // Venonat
      3,  // Venusaur
    329,  // Vibrava
     71,  // Victreebel
    288,  // Vigoroth
     45,  // Vileplume
    313,  // Volbeat
    100,  // Voltorb
     37,  // Vulpix
    320,  // Wailmer
    321,  // Wailord
    365,  // Walrein
      8,  // Wartortle
     13,  // Weedle
     70,  // Weepinbell
    110,  // Weezing
    340,  // Whiscash
    293,  // Whismur
     40,  // Wigglytuff
    278,  // Wingull
    202,  // Wobbuffet
    194,  // Wooper
    265,  // Wurmple
    360,  // Wynaut
    178,  // Xatu
    193,  // Yanma
    335,  // Zangoose
    145,  // Zapdos
    263,  // Zigzagoon
     41,  // Zubat
};
const u16 gPokedexOrder_Weight[] =
{
     92,  // Gastly
     93,  // Haunter
    187,  // Hoppip
     50,  // Diglett
    351,  // Castform
    109,  // Koffing
    174,  // Igglybuff
    200,  // Misdreavus
    358,  // Chimecho
    188,  // Skiploom
    385,  // Jirachi
    333,  // Swablu
    292,  // Shedinja
    175,  // Togepi
    283,  // Surskit
     16,  // Pidgey
    191,  // Sunkern
    339,  // Barboach
    172,  // Pichu
    298,  // Azurill
    315,  // Roselia
    177,  // Natu
     21,  // Spearow
    198,  // Murkrow
    353,  // Shuppet
    276,  // Taillow
    102,  // Exeggcute
    255,  // Torchic
    270,  // Lotad
     10,  // Caterpie
    189,  // Jumpluff
    173,  // Cleffa
     13,  // Weedle
    176,  // Togetic
    147,  // Dratini
     19,  // Rattata
    284,  // Masquerain
    265,  // Wurmple
    211,  // Qwilfish
    151,  // Mew
     90,  // Shellder
    273,  // Seedot
    132,  // Ditto
     69,  // Bellsprout
    311,  // Plusle
     52,  // Meowth
    312,  // Minun
    285,  // Shroomish
    251,  // Celebi
    222,  // Corsola
    252,  // Treecko
    327,  // Spinda
    201,  // Unown
     46,  // Paras
     43,  // Oddish
     39,  // Jigglypuff
    290,  // Nincada
    182,  // Bellossom
     81,  // Magnemite
     25,  // Pikachu
    238,  // Smoochum
    161,  // Sentret
     70,  // Weepinbell
    152,  // Chikorita
    220,  // Swinub
    133,  // Eevee
     98,  // Krabby
    104,  // Cubone
    280,  // Ralts
      1,  // Bulbasaur
     23,  // Ekans
     29,  // Nidoran♀
    204,  // Pineco
    349,  // Feebas
    138,  // Omanyte
     41,  // Zubat
     35,  // Clefairy
    258,  // Mudkip
    209,  // Snubbull
    179,  // Mareep
    155,  // Cyndaquil
    116,  // Horsea
      4,  // Charmander
    192,  // Sunflora
    183,  // Marill
    194,  // Wooper
    167,  // Spinarak
     44,  // Gloom
    370,  // Luvdisc
    216,  // Teddiursa
     32,  // Nidoran♂
      7,  // Squirtle
    278,  // Wingull
    158,  // Totodile
    110,  // Weezing
     37,  // Vulpix
     11,  // Metapod
    266,  // Silcoon
    129,  // Magikarp
     14,  // Kakuna
    316,  // Gulpin
    100,  // Voltorb
    165,  // Ledyba
    228,  // Houndour
    300,  // Skitty
    302,  // Sableye
    307,  // Meditite
    341,  // Corphish
    190,  // Aipom
    268,  // Cascoon
    303,  // Mawile
    140,  // Kabuto
     40,  // Wigglytuff
     27,  // Sandshrew
    223,  // Remoraid
    291,  // Ninjask
    170,  // Chinchou
     60,  // Poliwag
    347,  // Anorith
     49,  // Venomoth
    354,  // Banette
      2,  // Ivysaur
    180,  // Flaaffy
    261,  // Poochyena
    360,  // Wynaut
    206,  // Dunsparce
    178,  // Xatu
    355,  // Duskull
     83,  // Farfetch’d
    328,  // Trapinch
    118,  // Goldeen
    309,  // Electrike
    329,  // Vibrava
     71,  // Victreebel
    153,  // Bayleef
    225,  // Delibird
    293,  // Whismur
    148,  // Dragonair
    361,  // Snorunt
    263,  // Zigzagoon
    314,  // Illumise
    313,  // Volbeat
     20,  // Raticate
     45,  // Vileplume
    156,  // Quilava
      5,  // Charmeleon
     58,  // Growlithe
    256,  // Combusken
     66,  // Machop
     63,  // Abra
     33,  // Nidorino
     54,  // Psyduck
    277,  // Swellow
     38,  // Ninetales
     30,  // Nidorina
     61,  // Poliwhirl
     74,  // Geodude
    281,  // Kirlia
    213,  // Shuckle
    334,  // Altaria
    318,  // Carvanha
    236,  // Tyrogue
    163,  // Hoothoot
    240,  // Magby
    343,  // Baltoy
    253,  // Grovyle
    352,  // Kecleon
    171,  // Lanturn
      8,  // Wartortle
    368,  // Gorebyss
    369,  // Relicanth
    239,  // Elekid
    340,  // Whiscash
    345,  // Lileep
    322,  // Numel
    287,  // Slakoth
    135,  // Jolteon
    159,  // Croconaw
    136,  // Flareon
    117,  // Seadra
    196,  // Espeon
    367,  // Huntail
    197,  // Umbreon
    259,  // Marshtomp
    274,  // Nuzleaf
    215,  // Sneasel
     56,  // Mankey
    279,  // Pelipper
    267,  // Beautifly
    224,  // Octillery
    184,  // Azumarill
    202,  // Wobbuffet
    134,  // Vaporeon
     28,  // Sandslash
     47,  // Parasect
     15,  // Beedrill
     89,  // Muk
     17,  // Pidgeotto
     88,  // Grimer
     26,  // Raichu
     77,  // Ponyta
    125,  // Electabuzz
     48,  // Venonat
    325,  // Spoink
    356,  // Dusclops
    308,  // Medicham
    269,  // Dustox
     53,  // Persian
     12,  // Butterfree
     57,  // Primeape
     96,  // Drowzee
    162,  // Furret
    233,  // Porygon2
    271,  // Lombre
    264,  // Linoone
    301,  // Delcatty
    342,  // Crawdaunt
     51,  // Dugtrio
    168,  // Ariados
    231,  // Phanpy
    186,  // Politoed
    120,  // Staryu
    113,  // Chansey
    139,  // Omastar
    114,  // Tangela
    218,  // Slugma
    229,  // Houndoom
    166,  // Ledian
     79,  // Slowpoke
    137,  // Porygon
    262,  // Mightyena
    193,  // Yanma
     22,  // Fearow
    185,  // Sudowoodo
    119,  // Seaking
    286,  // Breloom
     84,  // Doduo
     18,  // Pidgeot
    363,  // Spheal
     36,  // Clefable
    380,  // Latias
    310,  // Manectric
    335,  // Zangoose
    141,  // Kabutops
     94,  // Gengar
    294,  // Loudred
    124,  // Jynx
    164,  // Noctowl
    203,  // Girafarig
    371,  // Bagon
    126,  // Magmar
    105,  // Marowak
     72,  // Tentacool
    288,  // Vigoroth
    242,  // Blissey
    359,  // Absol
     65,  // Alakazam
    237,  // Hitmontop
    282,  // Gardevoir
    210,  // Granbull
    106,  // Hitmonlee
    107,  // Hitmonchan
    227,  // Skarmory
    331,  // Cacnea
    257,  // Blaziken
    254,  // Sceptile
    336,  // Seviper
    366,  // Clamperl
    145,  // Zapdos
    214,  // Heracross
     62,  // Poliwrath
    122,  // Mr. mime
    127,  // Pinsir
    272,  // Ludicolo
     73,  // Tentacruel
     42,  // Golbat
    219,  // Magcargo
    144,  // Articuno
    221,  // Piloswine
    123,  // Scyther
     64,  // Kadabra
    235,  // Smeargle
    142,  // Aerodactyl
    275,  // Shiftry
     99,  // Kingler
     31,  // Nidoqueen
     82,  // Magneton
    304,  // Aron
    381,  // Latios
    146,  // Moltres
    346,  // Cradily
    386,  // Deoxys
    181,  // Ampharos
     34,  // Nidoking
    207,  // Gligar
     24,  // Arbok
    108,  // Lickitung
    101,  // Electrode
    348,  // Armaldo
     67,  // Machoke
    234,  // Stantler
    326,  // Grumpig
    246,  // Larvitar
    169,  // Crobat
    195,  // Quagsire
    241,  // Miltank
     97,  // Hypno
     55,  // Golduck
    332,  // Cacturne
     80,  // Slowbro
    157,  // Typhlosion
    199,  // Slowking
    115,  // Kangaskhan
    121,  // Starmie
    317,  // Swalot
    324,  // Torkoal
    260,  // Swampert
    330,  // Flygon
    295,  // Exploud
     85,  // Dodrio
      9,  // Blastoise
    296,  // Makuhita
    364,  // Sealeo
    128,  // Tauros
    319,  // Sharpedo
    160,  // Feraligatr
     86,  // Seel
      6,  // Charizard
     78,  // Rapidash
    374,  // Beldum
    299,  // Nosepass
      3,  // Venusaur
    357,  // Tropius
    154,  // Meganium
    373,  // Salamence
     75,  // Graveler
    344,  // Claydol
    372,  // Shelgon
    111,  // Rhyhorn
    212,  // Scizor
     87,  // Dewgong
    112,  // Rhydon
    232,  // Donphan
    103,  // Exeggutor
    305,  // Lairon
    150,  // Mewtwo
    217,  // Ursaring
    205,  // Forretress
     68,  // Machamp
    320,  // Wailmer
    289,  // Slaking
     91,  // Cloyster
    365,  // Walrein
    247,  // Pupitar
    230,  // Kingdra
    338,  // Solrock
     59,  // Arcanine
    350,  // Milotic
    337,  // Lunatone
    378,  // Regice
    243,  // Raikou
    245,  // Suicune
    244,  // Entei
    250,  // Ho-Oh
    248,  // Tyranitar
    375,  // Metang
    379,  // Registeel
    384,  // Rayquaza
     95,  // Onix
    149,  // Dragonite
    249,  // Lugia
    131,  // Lapras
    323,  // Camerupt
    226,  // Mantine
    377,  // Regirock
    130,  // Gyarados
    297,  // Hariyama
    362,  // Glalie
     76,  // Golem
    382,  // Kyogre
    306,  // Aggron
    321,  // Wailord
    208,  // Steelix
    143,  // Snorlax
    376,  // Metagross
    383,  // Groudon
};
const u16 gPokedexOrder_Height[] =
{
     50,  // Diglett
    298,  // Azurill
    177,  // Natu
     13,  // Weedle
    172,  // Pichu
    173,  // Cleffa
    175,  // Togepi
    351,  // Castform
    174,  // Igglybuff
     10,  // Caterpie
    276,  // Taillow
    132,  // Ditto
    133,  // Eevee
    315,  // Roselia
     21,  // Spearow
     16,  // Pidgey
    191,  // Sunkern
     90,  // Shellder
     19,  // Rattata
     81,  // Magnemite
     46,  // Paras
    265,  // Wurmple
    385,  // Jirachi
    104,  // Cubone
    258,  // Mudkip
    194,  // Wooper
    116,  // Horsea
     52,  // Meowth
     29,  // Nidoran♀
    220,  // Swinub
    151,  // Mew
    333,  // Swablu
    304,  // Aron
    311,  // Plusle
    312,  // Minun
    102,  // Exeggcute
     25,  // Pikachu
    182,  // Bellossom
    316,  // Gulpin
    263,  // Zigzagoon
    285,  // Shroomish
    138,  // Omanyte
    331,  // Cacnea
     98,  // Krabby
    280,  // Ralts
    187,  // Hoppip
    255,  // Torchic
    366,  // Clamperl
     74,  // Geodude
    183,  // Marill
    339,  // Barboach
    238,  // Smoochum
    100,  // Voltorb
    290,  // Nincada
    302,  // Sableye
    198,  // Murkrow
    211,  // Qwilfish
      7,  // Squirtle
    252,  // Treecko
    343,  // Baltoy
     43,  // Oddish
    270,  // Lotad
     39,  // Jigglypuff
    283,  // Surskit
    155,  // Cyndaquil
    140,  // Kabuto
    264,  // Linoone
    324,  // Torkoal
     32,  // Nidoran♂
    167,  // Spinarak
     56,  // Mankey
    273,  // Seedot
    261,  // Poochyena
    231,  // Phanpy
    201,  // Unown
    170,  // Chinchou
    233,  // Porygon2
     60,  // Poliwag
    371,  // Bagon
    349,  // Feebas
    353,  // Shuppet
    158,  // Totodile
    251,  // Celebi
    360,  // Wynaut
     27,  // Sandshrew
    358,  // Chimecho
    370,  // Luvdisc
    228,  // Houndour
    266,  // Silcoon
    309,  // Electrike
      4,  // Charmander
    307,  // Meditite
    278,  // Wingull
    223,  // Remoraid
    341,  // Corphish
    222,  // Corsola
    314,  // Illumise
    209,  // Snubbull
     37,  // Vulpix
    246,  // Larvitar
    374,  // Beldum
    293,  // Whismur
    204,  // Pineco
    239,  // Elekid
     35,  // Clefairy
    213,  // Shuckle
    216,  // Teddiursa
     14,  // Kakuna
    300,  // Skitty
    176,  // Togetic
    118,  // Goldeen
    303,  // Mawile
    179,  // Mareep
    188,  // Skiploom
    109,  // Koffing
     51,  // Dugtrio
    268,  // Cascoon
    322,  // Numel
    347,  // Anorith
    313,  // Volbeat
    163,  // Hoothoot
    328,  // Trapinch
    325,  // Spoink
     11,  // Metapod
     69,  // Bellsprout
    361,  // Snorunt
     20,  // Raticate
    259,  // Marshtomp
    277,  // Swellow
    240,  // Magby
     58,  // Growlithe
    200,  // Misdreavus
      1,  // Bulbasaur
    236,  // Tyrogue
    218,  // Slugma
    287,  // Slakoth
    281,  // Kirlia
    190,  // Aipom
    135,  // Jolteon
     30,  // Nidorina
    184,  // Azumarill
    292,  // Shedinja
     66,  // Machop
    291,  // Ninjask
    284,  // Masquerain
    355,  // Duskull
    192,  // Sunflora
    189,  // Jumpluff
    120,  // Staryu
    180,  // Flaaffy
    363,  // Spheal
     54,  // Psyduck
    219,  // Magcargo
     83,  // Farfetch’d
     41,  // Zubat
    137,  // Porygon
    161,  // Sentret
    318,  // Carvanha
     44,  // Gloom
     26,  // Raichu
    129,  // Magikarp
    215,  // Sneasel
    305,  // Lairon
    256,  // Combusken
    224,  // Octillery
     33,  // Nidorino
    136,  // Flareon
    225,  // Delibird
     72,  // Tentacool
     63,  // Abra
    253,  // Grovyle
    340,  // Whiscash
    156,  // Quilava
    196,  // Espeon
     88,  // Grimer
    152,  // Chikorita
    326,  // Grumpig
    299,  // Nosepass
     53,  // Persian
    262,  // Mightyena
     48,  // Venonat
     82,  // Magneton
     77,  // Ponyta
    296,  // Makuhita
    337,  // Lunatone
     28,  // Sandslash
     96,  // Drowzee
    114,  // Tangela
     57,  // Primeape
    165,  // Ledyba
     40,  // Wigglytuff
     47,  // Parasect
    139,  // Omastar
    294,  // Loudred
      8,  // Wartortle
     75,  // Graveler
    197,  // Umbreon
    345,  // Lileep
     61,  // Poliwhirl
    134,  // Vaporeon
     15,  // Beedrill
    105,  // Marowak
     70,  // Weepinbell
    369,  // Relicanth
    111,  // Rhyhorn
      2,  // Ivysaur
    352,  // Kecleon
    274,  // Nuzleaf
    267,  // Beautifly
     17,  // Pidgeotto
    168,  // Ariados
     86,  // Seel
    186,  // Politoed
    159,  // Croconaw
    113,  // Chansey
    354,  // Banette
    232,  // Donphan
    121,  // Starmie
      5,  // Charmeleon
    221,  // Piloswine
     12,  // Butterfree
    329,  // Vibrava
    125,  // Electabuzz
    342,  // Crawdaunt
    301,  // Delcatty
    334,  // Altaria
    372,  // Shelgon
     38,  // Ninetales
    207,  // Gligar
    364,  // Sealeo
    327,  // Spinda
    247,  // Pupitar
     79,  // Slowpoke
    338,  // Solrock
    241,  // Miltank
     22,  // Fearow
     45,  // Vileplume
     89,  // Muk
    205,  // Forretress
    185,  // Sudowoodo
    359,  // Absol
    193,  // Yanma
    269,  // Dustox
    108,  // Lickitung
    235,  // Smeargle
    171,  // Lanturn
    101,  // Electrode
    271,  // Lombre
    286,  // Breloom
    153,  // Bayleef
    117,  // Seadra
    110,  // Weezing
    279,  // Pelipper
    375,  // Metang
     31,  // Nidoqueen
    332,  // Cacturne
    275,  // Shiftry
    308,  // Medicham
    335,  // Zangoose
    141,  // Kabutops
     99,  // Kingler
     64,  // Kadabra
    119,  // Seaking
     36,  // Clefable
    126,  // Magmar
    202,  // Wobbuffet
     92,  // Gastly
    122,  // Mr. mime
     62,  // Poliwrath
    128,  // Tauros
    380,  // Latias
    181,  // Ampharos
    288,  // Vigoroth
    166,  // Ledian
     76,  // Golem
    365,  // Walrein
     84,  // Doduo
    229,  // Houndoom
     34,  // Nidoking
    124,  // Jynx
    107,  // Hitmonchan
    234,  // Stantler
    210,  // Granbull
    237,  // Hitmontop
    195,  // Quagsire
    344,  // Claydol
    260,  // Swampert
    242,  // Blissey
    272,  // Ludicolo
    295,  // Exploud
    206,  // Dunsparce
    127,  // Pinsir
     91,  // Cloyster
     67,  // Machoke
    203,  // Girafarig
     18,  // Pidgeot
    178,  // Xatu
    346,  // Cradily
    106,  // Hitmonlee
     49,  // Venomoth
     94,  // Gengar
    214,  // Heracross
    362,  // Glalie
    123,  // Scyther
    373,  // Salamence
    310,  // Manectric
    348,  // Armaldo
     65,  // Alakazam
     97,  // Hypno
    164,  // Noctowl
     73,  // Tentacruel
    356,  // Dusclops
    145,  // Zapdos
     42,  // Golbat
    376,  // Metagross
    282,  // Gardevoir
      9,  // Blastoise
     80,  // Slowbro
     93,  // Haunter
     68,  // Machamp
    377,  // Regirock
    317,  // Swalot
    254,  // Sceptile
    227,  // Skarmory
     55,  // Golduck
    386,  // Deoxys
     71,  // Victreebel
     78,  // Rapidash
      6,  // Charizard
    367,  // Huntail
     87,  // Dewgong
    144,  // Articuno
    157,  // Typhlosion
    142,  // Aerodactyl
    368,  // Gorebyss
    217,  // Ursaring
    154,  // Meganium
    378,  // Regice
    212,  // Scizor
    230,  // Kingdra
    147,  // Dratini
     85,  // Dodrio
    319,  // Sharpedo
    169,  // Crobat
    162,  // Furret
     59,  // Arcanine
    243,  // Raikou
    257,  // Blaziken
    323,  // Camerupt
    112,  // Rhydon
    379,  // Registeel
     23,  // Ekans
    330,  // Flygon
    357,  // Tropius
    381,  // Latios
    245,  // Suicune
    146,  // Moltres
      3,  // Venusaur
    103,  // Exeggutor
    199,  // Slowking
    248,  // Tyranitar
    289,  // Slaking
    320,  // Wailmer
    150,  // Mewtwo
    306,  // Aggron
    143,  // Snorlax
    226,  // Mantine
    244,  // Entei
    149,  // Dragonite
    115,  // Kangaskhan
    297,  // Hariyama
    160,  // Feraligatr
    131,  // Lapras
    336,  // Seviper
     24,  // Arbok
    383,  // Groudon
    250,  // Ho-Oh
    148,  // Dragonair
    382,  // Kyogre
    249,  // Lugia
    350,  // Milotic
    130,  // Gyarados
    384,  // Rayquaza
     95,  // Onix
    208,  // Steelix
    321,  // Wailord
};
const struct OamData gOamData_83A0404 =
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
const struct OamData gOamData_83A040C =
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
const struct OamData gOamData_83A0414 =
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
const struct OamData gOamData_83A041C =
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
const struct OamData gOamData_83A0424 =
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
const struct OamData gOamData_83A042C =
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
const union AnimCmd gSpriteAnim_83A0434[] =
{
    ANIMCMD_FRAME(3, 30),
    ANIMCMD_END,
};
const union AnimCmd gSpriteAnim_83A043C[] =
{
    ANIMCMD_FRAME(1, 30),
    ANIMCMD_END,
};
const union AnimCmd gSpriteAnim_83A0444[] =
{
    ANIMCMD_FRAME(16, 30),
    ANIMCMD_END,
};
const union AnimCmd gSpriteAnim_83A044C[] =
{
    ANIMCMD_FRAME(32, 30),
    ANIMCMD_END,
};
const union AnimCmd gSpriteAnim_83A0454[] =
{
    ANIMCMD_FRAME(64, 30),
    ANIMCMD_END,
};
const union AnimCmd gSpriteAnim_83A045C[] =
{
    ANIMCMD_FRAME(96, 30),
    ANIMCMD_END,
};
const union AnimCmd gSpriteAnim_83A0464[] =
{
    ANIMCMD_FRAME(128, 30),
    ANIMCMD_END,
};
const union AnimCmd gSpriteAnim_83A046C[] =
{
    ANIMCMD_FRAME(160, 30),
    ANIMCMD_END,
};
const union AnimCmd gSpriteAnim_83A0474[] =
{
    ANIMCMD_FRAME(192, 30),
    ANIMCMD_END,
};
const union AnimCmd gSpriteAnim_83A047C[] =
{
    ANIMCMD_FRAME(224, 30),
    ANIMCMD_END,
};
const union AnimCmd gSpriteAnim_83A0484[] =
{
    ANIMCMD_FRAME(226, 30),
    ANIMCMD_END,
};
const union AnimCmd gSpriteAnim_83A048C[] =
{
    ANIMCMD_FRAME(228, 30),
    ANIMCMD_END,
};
const union AnimCmd gSpriteAnim_83A0494[] =
{
    ANIMCMD_FRAME(230, 30),
    ANIMCMD_END,
};
const union AnimCmd gSpriteAnim_83A049C[] =
{
    ANIMCMD_FRAME(232, 30),
    ANIMCMD_END,
};
const union AnimCmd gSpriteAnim_83A04A4[] =
{
    ANIMCMD_FRAME(234, 30),
    ANIMCMD_END,
};
const union AnimCmd gSpriteAnim_83A04AC[] =
{
    ANIMCMD_FRAME(236, 30),
    ANIMCMD_END,
};
const union AnimCmd gSpriteAnim_83A04B4[] =
{
    ANIMCMD_FRAME(238, 30),
    ANIMCMD_END,
};
const union AnimCmd gSpriteAnim_83A04BC[] =
{
    ANIMCMD_FRAME(240, 30),
    ANIMCMD_END,
};
const union AnimCmd gSpriteAnim_83A04C4[] =
{
    ANIMCMD_FRAME(242, 30),
    ANIMCMD_END,
};
const union AnimCmd gSpriteAnim_83A04CC[] =
{
    ANIMCMD_FRAME(4, 30),
    ANIMCMD_END,
};
const union AnimCmd *const gSpriteAnimTable_83A04D4[] =
{
    gSpriteAnim_83A0434,
};
const union AnimCmd *const gSpriteAnimTable_83A04D8[] =
{
    gSpriteAnim_83A043C,
};
const union AnimCmd *const gSpriteAnimTable_83A04DC[] =
{
    gSpriteAnim_83A0444,
};
const union AnimCmd *const gSpriteAnimTable_83A04E0[] =
{
    gSpriteAnim_83A044C,
    gSpriteAnim_83A0454,
    gSpriteAnim_83A045C,
    gSpriteAnim_83A0464,
};
const union AnimCmd *const gSpriteAnimTable_83A04F0[] =
{
    gSpriteAnim_83A046C,
    gSpriteAnim_83A0474,
};
const union AnimCmd *const gSpriteAnimTable_83A04F8[] =
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
const union AnimCmd *const gSpriteAnimTable_83A0520[] =
{
    gSpriteAnim_83A04CC,
};

void sub_8090B8C(u8);
void sub_8090C28(struct Sprite *);
u16 NationalPokedexNumToSpecies(u16);
void sub_8091E54(u8);
void sub_809204C(u8);
void sub_809207C(u8);
void sub_809217C(u8);
void sub_80921B0(u8);
void sub_80923FC(u8);
void sub_80924A4(u8);
void sub_8092508(u8);
void sub_80925CC(u8);
void sub_8092644(u8);
void sub_80927B8(u8);
void sub_80927F0(u8);
void sub_8092AB0(u8);
void sub_8092AD4(u8, u8);
void sub_8092B68(u8);
void sub_8092C8C(u8);
void sub_8092D78(u8);
u8 sub_8092E10(u8, u8);
void sub_8092EB0(u8);
void sub_809308C(u8);

//  asm/pokedex_area_screen
void ShowPokedexAreaScreen(u16 species, u8 *string);

void ResetPokedex(void)
{
    u16 i;

    gUnknown_0202FFB8 = 0;
    gUnknown_0202FFBA = 0x40;
    gUnknown_03005CE8 = 0;
    gSaveBlock2.pokedex.unknown1 = 0;
    gSaveBlock2.pokedex.order = 0;
    gSaveBlock2.pokedex.nationalMagic = 0;
    gSaveBlock2.pokedex.unknown2 = 0;
    gSaveBlock2.pokedex.unownPersonality = 0;
    gSaveBlock2.pokedex.spindaPersonality = 0;
    gSaveBlock2.pokedex.unknown3 = 0;
    DisableNationalPokedex();
    for (i = 0; i <= 51; i++)
    {
        gSaveBlock2.pokedex.owned[i] = 0;
        gSaveBlock2.pokedex.seen[i] = 0;
        gSaveBlock1.unk938[i] = 0;
        gSaveBlock1.unk3A8C[i] = 0;
    }
}

void sub_808C0A0(void)
{
    gUnknown_0202FFB8 = 0;
    gUnknown_0202FFBA = 0x40;
}

void sub_808C0B8(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void ClearPokedexView(struct PokedexView *pokedexView)
{
    u16 i;

    for (i = 0; i <= 385; i++)
    {
        pokedexView->unk0[i].dexNum |= 0xFFFF;
        pokedexView->unk0[i].seen = 0;
        pokedexView->unk0[i].owned = 0;
    }
    pokedexView->unk608 = 0;
    pokedexView->unk60A_1 = 0;
    pokedexView->unk60A_2 = 0;
    pokedexView->unk60C = 0;
    pokedexView->selectedPokemon = 0;
    pokedexView->unk610 = 0;
    pokedexView->dexMode = 0;
    pokedexView->unk614 = 0;
    pokedexView->dexOrder = 0;
    pokedexView->unk618 = 0;
    pokedexView->unk61A = 0;
    pokedexView->unk61C = 0;
    for (i = 0; i <= 3; i++)
        pokedexView->unk61E[i] |= 0xFFFF;
    pokedexView->unk628 = 0;
    pokedexView->unk62A = 0;
    pokedexView->unk62C = 0;
    pokedexView->unk62D = 0;
    pokedexView->unk62E = 0;
    pokedexView->unk62F = 0;
    pokedexView->unk630 = 0;
    pokedexView->unk632 = 0;
    pokedexView->unk634 = 0;
    pokedexView->unk636 = 0;
    pokedexView->unk638 = 0;
    for (i = 0; i <= 3; i++)
        pokedexView->unk63A[i] = 0;
    pokedexView->unk64A = 0;
    pokedexView->unk64B = 0;
    pokedexView->unk64C_1 = 0;
    pokedexView->selectedScreen = 0;
    pokedexView->unk64F = 0;
    pokedexView->menuIsOpen = 0;
    pokedexView->menuCursorPos = 0;
    pokedexView->menuY = 0;
    for (i = 0; i <= 7; i++)
        pokedexView->unk656[i] = 0;
    for (i = 0; i <= 7; i++)
        pokedexView->unk65E[i] = 0;
}

void CB2_InitPokedex(void)
{
    switch (gMain.state)
    {
    case 0:
    default:
    {
        u8 *addr;
        u32 size;

        SetVBlankCallback(NULL);
        sub_8091060(0);
        addr = (u8 *)VRAM;
        size = VRAM_SIZE;
        while (1)
        {
            DmaFill16(3, 0, addr, 0x1000);
            addr += 0x1000;
            size -= 0x1000;
            if (size <= 0x1000)
            {
                DmaFill16(3, 0, addr, size);
                break;
            }
        }
        DmaClear32(3, OAM, OAM_SIZE);
        DmaClear16(3, PLTT, PLTT_SIZE);
        gMain.state = 1;
        break;
    }
    case 1:
        remove_some_task();
        ResetTasks();
        ResetSpriteData();
        ResetPaletteFade();
        FreeAllSpritePalettes();
        gReservedSpritePaletteCount = 8;
        SetUpWindowConfig(&gWindowConfig_81E7048);
        InitMenuWindow(&gWindowConfig_81E7048);
        gMain.state++;
        break;
    case 2:
        switch (Random() & 3)
        {
        case 0:
        default:
            gPokedexView = (struct PokedexView *)0x02018000;
            break;
        case 1:
            gPokedexView = (struct PokedexView *)0x02018800;
            break;
        case 2:
            gPokedexView = (struct PokedexView *)0x02019000;
            break;
        case 3:
            gPokedexView = (struct PokedexView *)0x02019800;
            break;
        }
        ClearPokedexView(gPokedexView);
        CreateTask(Task_PokedexShowMainScreen, 0);
        gPokedexView->dexMode = gSaveBlock2.pokedex.unknown1;
        if (!IsNationalPokedexEnabled())
            gPokedexView->dexMode = DEX_MODE_HOENN;
        gPokedexView->dexOrder = gSaveBlock2.pokedex.order;
        gPokedexView->selectedPokemon = gUnknown_0202FFB8;
        gPokedexView->unk62C = gUnknown_0202FFBA;
        gPokedexView->selectedScreen = PAGE_SCREEN;
        gPokedexView->unk64E = 0;
        if (!IsNationalPokedexEnabled())
        {
            gPokedexView->unk61A = GetHoennPokedexCount(0);
            gPokedexView->unk61C = GetHoennPokedexCount(1);
        }
        else
        {
            gPokedexView->unk61A = GetNationalPokedexCount(0);
            gPokedexView->unk61C = GetNationalPokedexCount(1);
        }
        gPokedexView->unk62D = 8;
        gMain.state++;
        break;
    case 3:
    {
        u16 savedIme;

        savedIme = REG_IME;
        REG_IME = 0;
        REG_IE |= 1;
        REG_IME = savedIme;
        REG_DISPSTAT |= 8;
        SetVBlankCallback(sub_808C0B8);
        SetMainCallback2(MainCB);
        SortPokedex(gPokedexView->dexMode, gPokedexView->dexOrder);
        m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 0x80);
    }
    }
}

u8 unref_sub_808C540(void (*func)(u8))
{
    u16 savedIme;
    u8 taskId;

    SetVBlankCallback(NULL);
    sub_8091060(0x200);
    remove_some_task();
    ResetTasks();
    ResetPaletteFade();
    savedIme = REG_IME;
    REG_IME = 0;
    REG_IE |= 1;
    REG_IME = savedIme;
    REG_DISPSTAT |= 0x8;
    SetVBlankCallback(sub_808C0B8);
    SetMainCallback2(MainCB);
    if (!gPokedexView->unk64B)
        taskId = CreateTask(sub_808CAE4, 0);
    else
        taskId = CreateTask(sub_808D198, 0);
    gTasks[taskId].data[0] = CreateTask(func, 0);
    return gTasks[taskId].data[0];
}

void MainCB(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void Task_PokedexShowMainScreen(u8 taskId)
{
    gPokedexView->unk64C_1 = 0;
    if (sub_808D344(0))
    {
        gTasks[taskId].func = Task_PokedexMainScreen;
    }
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
        if ((gMain.newKeys & A_BUTTON) && gPokedexView->unk0[gPokedexView->selectedPokemon].seen)
        {
            sub_808E6BC();
            BeginNormalPaletteFade(
              ~(1 << (gSprites[gPokedexView->unk626].oam.paletteNum + 16)),
              0, 0, 0x10, 0);
            gSprites[gPokedexView->unk626].callback = sub_808EDB8;
            gTasks[taskId].func = sub_808CA64;
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
            BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
            gTasks[taskId].data[0] = sub_8091E3C();
            gPokedexView->unk64F = 0;
            gPokedexView->unk62A = gPokedexView->unk62C;
            gPokedexView->unk610 = gPokedexView->selectedPokemon;
            gPokedexView->unk614 = gPokedexView->dexMode;
            gPokedexView->unk618 = gPokedexView->dexOrder;
            gTasks[taskId].func = sub_808CB8C;
            PlaySE(SE_PC_LOGON);
        }
        else if (gMain.newKeys & B_BUTTON)
        {
            BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
            gTasks[taskId].func = Task_ClosePokedex;
            PlaySE(SE_PC_OFF);
        }
        else
        {
            //Handle D-pad
            gPokedexView->selectedPokemon = sub_808E48C(gPokedexView->selectedPokemon, 0xE);
            if (gPokedexView->unk62E)
                gTasks[taskId].func = sub_808C898;
        }
    }
}

void sub_808C898(u8 taskId)
{
    if (sub_808E208(gPokedexView->unk62F, gPokedexView->unk634, gPokedexView->unk636))
    {
        gTasks[taskId].func = Task_PokedexMainScreen;
    }
}

//Bring up menu and process menu input
void Task_PokedexMainScreenMenu(u8 taskId)
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
                gPokedexView->unk62C = 0x40;
                sub_808E82C();
                sub_808E0CC(gPokedexView->selectedPokemon, 0xE);
                gMain.newKeys |= START_BUTTON;  //Exit menu
                break;
            case 2: //LIST BOTTOM
                gPokedexView->selectedPokemon = gPokedexView->unk60C - 1;
                gPokedexView->unk62C = gPokedexView->unk60C * 16 + 0x30;
                sub_808E82C();
                sub_808E0CC(gPokedexView->selectedPokemon, 0xE);
                gMain.newKeys |= START_BUTTON;  //Exit menu
                break;
            case 3: //CLOSE POKEDEX
                BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
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

void sub_808CA64(u8 taskId)
{
    if (gSprites[gPokedexView->unk626].pos1.x == 0x30 &&
    gSprites[gPokedexView->unk626].pos1.y == 0x38)
    {
        gPokedexView->unk64B = gPokedexView->unk64A;
        gTasks[taskId].data[0] = sub_808F210(&gPokedexView->unk0[gPokedexView->selectedPokemon], gPokedexView->unk626);
        gTasks[taskId].func = sub_808CAE4;
    }
}

void sub_808CAE4(u8 taskId)
{
    if (gTasks[gTasks[taskId].data[0]].isActive)
    {
        if (gPokedexView->unk64A == 1 &&
        !sub_808F250(gTasks[taskId].data[0]) &&
        sub_808E71C())
        {
            sub_808F284(&gPokedexView->unk0[gPokedexView->selectedPokemon], gTasks[taskId].data[0]);
        }
    }
    else
    {
        gUnknown_0202FFB8 = gPokedexView->selectedPokemon;
        gUnknown_0202FFBA = gPokedexView->unk62C;
        gTasks[taskId].func = Task_PokedexShowMainScreen;
    }
}

void sub_808CB8C(u8 taskId)
{
    bool8 isActive = gTasks[gTasks[taskId].data[0]].isActive;

    if (!isActive)
    {
        if (gPokedexView->unk64F)
        {
            gPokedexView->selectedPokemon = isActive;
            gPokedexView->unk62C = 0x40;
            gTasks[taskId].func = sub_808CCC4;
        }
        else
        {
            gPokedexView->unk62C = gPokedexView->unk62A;
            gPokedexView->selectedPokemon = gPokedexView->unk610;
            gPokedexView->dexMode = gPokedexView->unk614;
            if (!IsNationalPokedexEnabled())
                gPokedexView->dexMode = DEX_MODE_HOENN;
            gPokedexView->dexOrder = gPokedexView->unk618;
            gTasks[taskId].func = Task_PokedexShowMainScreen;
        }
    }
}

void Task_ClosePokedex(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        gSaveBlock2.pokedex.unknown1 = gPokedexView->dexMode;
        if (!IsNationalPokedexEnabled())
            gSaveBlock2.pokedex.unknown1 = 0;
        gSaveBlock2.pokedex.order = gPokedexView->dexOrder;
        DestroyTask(taskId);
        SetMainCallback2(sub_805469C);
        m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 0x100);
    }
}

void sub_808CCC4(u8 taskId)
{
    gPokedexView->unk64C_1 = 1;
    if (sub_808D344(3))
        gTasks[taskId].func = Task_PokedexResultsScreen;
}

void Task_PokedexResultsScreen(u8 taskId)
{
    REG_BG0VOFS = gPokedexView->menuY;

    if (gPokedexView->menuY)
        gPokedexView->menuY -= 8;
    else
    {
        if ((gMain.newKeys & A_BUTTON) && gPokedexView->unk0[gPokedexView->selectedPokemon].seen)
        {
            u32 a;

            sub_808E6BC();
            a = (1 << (gSprites[gPokedexView->unk626].oam.paletteNum + 16));
            gSprites[gPokedexView->unk626].callback = sub_808EDB8;
            BeginNormalPaletteFade(~a, 0, 0, 0x10, 0);
            gTasks[taskId].func = sub_808D118;
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
            BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
            gTasks[taskId].data[0] = sub_8091E3C();
            gPokedexView->unk64F = 0;
            gTasks[taskId].func = sub_808CB8C;
            PlaySE(SE_PC_LOGON);
        }
        else if (gMain.newKeys & B_BUTTON)
        {
            BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
            gTasks[taskId].func = Task_PokedexResultsScreenReturnToMainScreen;
            PlaySE(SE_PC_OFF);
        }
        else
        {
            //Handle D-pad
            gPokedexView->selectedPokemon = sub_808E48C(gPokedexView->selectedPokemon, 0xE);
            if (gPokedexView->unk62E)
                gTasks[taskId].func = sub_808CEF8;
        }
    }
}

void sub_808CEF8(u8 taskId)
{
    if (sub_808E208(gPokedexView->unk62F, gPokedexView->unk634, gPokedexView->unk636))
        gTasks[taskId].func = Task_PokedexResultsScreen;
}

void Task_PokedexResultsScreenMenu(u8 taskId)
{
    REG_BG0VOFS = gPokedexView->menuY;

    if (gPokedexView->menuY != 0x60)
        gPokedexView->menuY += 8;
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
                gPokedexView->unk62C = 0x40;
                sub_808E82C();
                sub_808E0CC(gPokedexView->selectedPokemon, 0xE);
                gMain.newKeys |= START_BUTTON;
                break;
            case 2: //LIST BOTTOM
                gPokedexView->selectedPokemon = gPokedexView->unk60C - 1;
                gPokedexView->unk62C = gPokedexView->unk60C * 16 + 0x30;
                sub_808E82C();
                sub_808E0CC(gPokedexView->selectedPokemon, 0xE);
                gMain.newKeys |= START_BUTTON;
                break;
            case 3: //BACK TO POKEDEX
                BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
                gTasks[taskId].func = Task_PokedexResultsScreenReturnToMainScreen;
                PlaySE(SE_TRACK_DOOR);
                break;
            case 4: //CLOSE POKEDEX
                BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
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

void sub_808D118(u8 taskId)
{
    if (gSprites[gPokedexView->unk626].pos1.x == 0x30 &&
    gSprites[gPokedexView->unk626].pos1.y == 0x38)
    {
        gPokedexView->unk64B = gPokedexView->unk64A;
        gTasks[taskId].data[0] = sub_808F210(&gPokedexView->unk0[gPokedexView->selectedPokemon], gPokedexView->unk626);
        gTasks[taskId].func = sub_808D198;
    }
}

void sub_808D198(u8 taskId)
{
    if (gTasks[gTasks[taskId].data[0]].isActive)
    {
        if (gPokedexView->unk64A == 1 &&
        !sub_808F250(gTasks[taskId].data[0]) &&
        sub_808E71C())
        {
            sub_808F284(&gPokedexView->unk0[gPokedexView->selectedPokemon], gTasks[taskId].data[0]);
        }
    }
    else
    {
        gTasks[taskId].func = sub_808CCC4;
    }
}

void Task_PokedexResultsScreenReturnToMainScreen(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        gPokedexView->unk62C = gPokedexView->unk62A;
        gPokedexView->selectedPokemon = gPokedexView->unk610;
        gPokedexView->dexMode = gPokedexView->unk614;
        if (!IsNationalPokedexEnabled())
            gPokedexView->dexMode = DEX_MODE_HOENN;
        gPokedexView->dexOrder = gPokedexView->unk618;
        gTasks[taskId].func = Task_PokedexShowMainScreen;
    }
}

void Task_PokedexResultsScreenExitPokedex(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        gPokedexView->unk62C = gPokedexView->unk62A;
        gPokedexView->selectedPokemon = gPokedexView->unk610;
        gPokedexView->dexMode = gPokedexView->unk614;
        if (!IsNationalPokedexEnabled())
            gPokedexView->dexMode = DEX_MODE_HOENN;
        gPokedexView->dexOrder = gPokedexView->unk618;
        gTasks[taskId].func = Task_ClosePokedex;
    }
}


bool8 sub_808D344(u8 a)
{
    switch (gMain.state)
    {
    case 0:
    default:
        if (gPaletteFade.active)
            return 0;
        //_0808D39E
        SetVBlankCallback(NULL);
        gPokedexView->unk64A = a;
        sub_8091060(0);
        REG_BG2VOFS = gPokedexView->unk62D;
        LZ77UnCompVram(gPokedexMenu_Gfx, (void *)(VRAM));
        LZ77UnCompVram(gUnknown_08E96738, (void *)(VRAM + 0x6800));
        LZ77UnCompVram(gUnknown_08E9C6DC, (void *)(VRAM + 0x7800));
        DmaClear16(3, VRAM + 0x6000, 0x500);
        if (a == 0)
            LZ77UnCompVram(gUnknown_08E96888, (void *)(VRAM + 0x6500));
        else
            LZ77UnCompVram(gUnknown_08E96994, (void *)(VRAM + 0x6500));
        ResetPaletteFade();
        if (a == 0)
            gPokedexView->unk64C_1 = 0;
        else
            gPokedexView->unk64C_1 = 1;
        sub_808D640();
        gMain.state = 1;
        break;
    case 1:
        ResetSpriteData();
        FreeAllSpritePalettes();
        gReservedSpritePaletteCount = 8;
        LoadCompressedObjectPic(&gUnknown_083A05CC);
        LoadSpritePalettes(gUnknown_083A05DC);
        sub_808E978(a);
        gMain.state++;
        break;
    case 2:
        SetUpWindowConfig(&gWindowConfig_81E7048);
        InitMenuWindow(&gWindowConfig_81E7048);
        LZ77UnCompVram(gUnknown_0839FA7C, (void *)(VRAM + 0xFF80));
        gMain.state++;
        break;
    case 3:
        if (a == 0)
            SortPokedex(gPokedexView->dexMode, gPokedexView->dexOrder);
        sub_808E0CC(gPokedexView->selectedPokemon, 0xE);
        gPokedexView->menuIsOpen = 0;
        gPokedexView->menuY = 0;
        gMain.state++;
        break;
    case 4:
        BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
        SetVBlankCallback(sub_808C0B8);
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
            return 1;
        }
        else
            return 0;
    }
    return 0;
}

void sub_808D640(void)
{
    if (gPokedexView->unk64C_1)
        LoadPalette(gUnknown_0839F67C + 1, 1, sizeof(gUnknown_0839F67C) - sizeof(u16));
    else if (!IsNationalPokedexEnabled())
        LoadPalette(gPokedexMenu_Pal + 1, 1, 0xBE);
    else
        LoadPalette(gUnknown_0839F73C + 1, 1, sizeof(gUnknown_0839F73C) - sizeof(u16));
}

void SortPokedex(u8 dexMode, u8 sortMode)
{
    u16 vars[3]; //I have no idea why three regular variables are stored in an array, but whatever.
    s16 i;

    gPokedexView->unk60C = 0;

    switch (dexMode)
    {
    default:
    case DEX_MODE_HOENN:
        vars[0] = 202;
        vars[1] = 1;
        break;
    case DEX_MODE_NATIONAL:
        if (IsNationalPokedexEnabled())
        {
            vars[0] = 386;
            vars[1] = 0;
        }
        else
        {
            vars[0] = 202;
            vars[1] = 1;
        }
        break;
    }

    switch (sortMode)
    {
    case 0:
    {
        if (vars[1])
        {
            for (i = 0; i < vars[0]; i++)
            {
                vars[2] = HoennToNationalOrder(i + 1);
                gPokedexView->unk0[i].dexNum = vars[2];
                gPokedexView->unk0[i].seen = sub_8090D90(vars[2], 0);
                gPokedexView->unk0[i].owned = sub_8090D90(vars[2], 1);
                if (gPokedexView->unk0[i].seen)
                    gPokedexView->unk60C = i + 1;
            }
        }
        else
        {
            bool32 r10;
            s16 r5;

            r10 = r5 = i = 0;
            for (i = 0; i < vars[0]; i++)
            {
                vars[2] = i + 1;
                if (sub_8090D90(vars[2], 0))
                    r10 = 1;
                if (r10)
                {
                    asm("");    //Needed to match for some reason
                    gPokedexView->unk0[r5].dexNum = vars[2];
                    gPokedexView->unk0[r5].seen = sub_8090D90(vars[2], 0);
                    gPokedexView->unk0[r5].owned = sub_8090D90(vars[2], 1);
                    if (gPokedexView->unk0[r5].seen)
                        gPokedexView->unk60C = r5 + 1;
                    r5++;
                }
            }
        }
        break;
    }
    case 1:
        for (i = 0; i < 411; i++)
        {
            vars[2] = gPokedexOrder_Alphabetical[i];

            if (NationalToHoennOrder(vars[2]) <= vars[0] && sub_8090D90(vars[2], 0))
            {
                gPokedexView->unk0[gPokedexView->unk60C].dexNum = vars[2];
                gPokedexView->unk0[gPokedexView->unk60C].seen = 1;
                gPokedexView->unk0[gPokedexView->unk60C].owned = sub_8090D90(vars[2], 1);
                gPokedexView->unk60C++;
            }
        }
        break;
    case 2:
        for (i = 385; i >= 0; i--)
        {
            vars[2] = gPokedexOrder_Weight[i];

            if (NationalToHoennOrder(vars[2]) <= vars[0] && sub_8090D90(vars[2], 1))
            {
                gPokedexView->unk0[gPokedexView->unk60C].dexNum = vars[2];
                gPokedexView->unk0[gPokedexView->unk60C].seen = 1;
                gPokedexView->unk0[gPokedexView->unk60C].owned = 1;
                gPokedexView->unk60C++;
            }
        }
        break;
    case 3:
        for (i = 0; i < 386; i++)
        {
            vars[2] = gPokedexOrder_Weight[i];

            if (NationalToHoennOrder(vars[2]) <= vars[0] && sub_8090D90(vars[2], 1))
            {
                gPokedexView->unk0[gPokedexView->unk60C].dexNum = vars[2];
                gPokedexView->unk0[gPokedexView->unk60C].seen = 1;
                gPokedexView->unk0[gPokedexView->unk60C].owned = 1;
                gPokedexView->unk60C++;
            }
        }
        break;
    case 4:
        for (i = 385; i >=0; i--)
        {
            vars[2] = gPokedexOrder_Height[i];

            if (NationalToHoennOrder(vars[2]) <= vars[0] && sub_8090D90(vars[2], 1))
            {
                gPokedexView->unk0[gPokedexView->unk60C].dexNum = vars[2];
                gPokedexView->unk0[gPokedexView->unk60C].seen = 1;
                gPokedexView->unk0[gPokedexView->unk60C].owned = 1;
                gPokedexView->unk60C++;
            }
        }
        break;
    case 5:
        for (i = 0; i < 386; i++)
        {
            vars[2] = gPokedexOrder_Height[i];

            if (NationalToHoennOrder(vars[2]) <= vars[0] && sub_8090D90(vars[2], 1))
            {
                gPokedexView->unk0[gPokedexView->unk60C].dexNum = vars[2];
                gPokedexView->unk0[gPokedexView->unk60C].seen = 1;
                gPokedexView->unk0[gPokedexView->unk60C].owned = 1;
                gPokedexView->unk60C++;
            }
        }
        break;
    }
    for (i = gPokedexView->unk60C; i < 386; i++)
    {
        gPokedexView->unk0[i].dexNum |= 0xFFFF;
        gPokedexView->unk0[i].seen = 0;
        gPokedexView->unk0[i].owned = 0;
    }
}

void sub_808DBE8(u8 a, u16 b, u16 c)
{
    switch (a)
    {
    case 0:
    default:
    {
        u16 i;
        s16 _b = b - 5;

        for (i = 0; i <= 10; i++)
        {
            if ((u16)_b > 385 || gPokedexView->unk0[_b].dexNum == 0xFFFF)
                sub_808E090(0x11, i * 2, c);
            else
            {
                sub_808E090(0x11, i * 2, c);
                if (gPokedexView->unk0[_b].seen)
                {
                    sub_808DEB0(_b, 0x12, i * 2, c);
                    sub_808DF88(gPokedexView->unk0[_b].owned, 0x11, i * 2, c);
                    sub_808DFE4(gPokedexView->unk0[_b].dexNum, 0x17, i * 2);
                }
                else
                {
                    sub_808DEB0(_b, 0x12, i * 2, c);
                    sub_808DF88(0, 0x11, i * 2, c);
                    sub_808DFE4(0, 0x17, i * 2);
                }
            }
            _b++;
        }
        break;
    }
    case 1:
    {
        s16 _b = b - 5;

        if ((u16)_b > 385 || gPokedexView->unk0[_b].dexNum == 0xFFFF)
            sub_808E090(0x11, gPokedexView->unk630 * 2, c);
        else
        {
            sub_808E090(0x11, gPokedexView->unk630 * 2, c);
            if (gPokedexView->unk0[_b].seen)
            {
                sub_808DEB0(_b, 0x12, gPokedexView->unk630 * 2, c);
                sub_808DF88(gPokedexView->unk0[_b].owned, 0x11, gPokedexView->unk630 * 2, c);
                sub_808DFE4(gPokedexView->unk0[_b].dexNum, 0x17, gPokedexView->unk630 * 2);
            }
            else
            {
                sub_808DEB0(_b, 0x12, gPokedexView->unk630 * 2, c);
                sub_808DF88(0, 0x11, gPokedexView->unk630 * 2, c);
                sub_808DFE4(0, 0x17, gPokedexView->unk630 * 2);
            }
        }
        break;
    }
    case 2:
    {
        s16 _b = b + 5;
        u16 r2 = gPokedexView->unk630 + 10;

        if (r2 > 15)
            r2 -= 16;
        if ((u16)_b > 385 || gPokedexView->unk0[_b].dexNum == 0xFFFF)
            sub_808E090(0x11, r2 * 2, c);
        else
        {
            sub_808E090(0x11, r2 * 2, c);
            if (gPokedexView->unk0[_b].seen)
            {
                sub_808DEB0(_b, 0x12, r2 * 2, c);
                sub_808DF88(gPokedexView->unk0[_b].owned, 0x11, r2 * 2, c);
                sub_808DFE4(gPokedexView->unk0[_b].dexNum, 0x17, r2 * 2);
            }
            else
            {
                sub_808DEB0(_b, 0x12, r2 * 2, c);
                sub_808DF88(0, 0x11, r2 * 2, c);
                sub_808DFE4(0, 0x17, r2 * 2);
            }
        }
        break;
    }
    }
}

void sub_808DEB0(u16 a, u8 b, u8 c, u16 d)
{
    u8 text[4];
    u16 unk[2];
    u16 r7 = gPokedexView->unk0[a].dexNum;

    if (gPokedexView->dexMode == DEX_MODE_HOENN)
        r7 = NationalToHoennOrder(r7);
    unk[0] = 0x3FC;
    unk[1] = 0x3FD;
    text[0] = r7 / 100 + 0xA1;
    text[1] = (r7 % 100) / 10 + 0xA1;
    text[2] = (r7 % 100) % 10 + 0xA1;
    text[3] = 0xFF;
    *(u16 *)(VRAM + d * 0x800 + c * 0x40 + b * 2) = unk[0];
    *(u16 *)(VRAM + 0x40 + d * 0x800 + c * 0x40 + b * 2) = unk[1];
    MenuPrint(text, b - 15, c);
}

void sub_808DF88(u16 a, u8 b, u8 c, u16 d)
{
    u16 unk[2];

    if (a)
    {
        unk[0] = 0x3FE;
        unk[1] = 0x3FF;
    }
    else
    {
        unk[0] = 0;
        unk[1] = 0;
    }
    *(u16 *)(VRAM + d * 0x800 + c * 0x40 + b * 2) = unk[0];
    *(u16 *)(VRAM + 0x40 + d * 0x800 + c * 0x40 + b * 2) = unk[1];
}

u8 sub_808DFE4(u16 num, u8 b, u8 c)
{
    u8 text[10];
    u8 i;

    for (i = 0; i < 10; i++)
        text[i] = 0;
    text[i] = EOS;
    num = NationalPokedexNumToSpecies(num);
    switch (num)
    {
    default:
        for (i = 0; gSpeciesNames[num][i] != EOS && i < 10; i++)
            text[i] = gSpeciesNames[num][i];
        break;
    case 0:
        for (i = 0; i < 10; i++)
            text[i] = 0xAE;
        break;
    }
    MenuPrint_PixelCoords(text, (b - 0x11) * 8 + 0xFC, c * 8, 0);
    return i;
}

void sub_808E090(u8 a, u8 b, u16 c)
{
    u8 i;

    for (i = 0; i < 12; i++)
    {
        *(u16 *)(VRAM + c * 0x800 + b * 64 + (a + i) * 2) = 0;
        *(u16 *)(VRAM + 0x40 + c * 0x800 + b * 64 + (a + i) * 2) = 0;
    }
}

void sub_808E0CC(u16 a, u16 b)
{
    u8 i;
    u16 unk;
    u8 spriteId;

    for (i = 0; i < 4; i++)
        gPokedexView->unk61E[i] |= 0xFFFF;
    gPokedexView->unk626 = 0xFFFF;
    sub_808DBE8(0, a, b);
    REG_BG2VOFS = gPokedexView->unk62D;
    unk = sub_808E888(a - 1);
    if (unk != 0xFFFF)
    {
        spriteId = sub_808E8C8(unk, 0x60, 0x50);
        gSprites[spriteId].callback = sub_808EE28;
        gSprites[spriteId].data5 = -32;
    }
    unk = sub_808E888(a);
    if (unk != 0xFFFF)
    {
        spriteId = sub_808E8C8(unk, 0x60, 0x50);
        gSprites[spriteId].callback = sub_808EE28;
        gSprites[spriteId].data5 = 0;
    }
    unk = sub_808E888(a + 1);
    if (unk != 0xFFFF)
    {
        spriteId = sub_808E8C8(unk, 0x60, 0x50);
        gSprites[spriteId].callback = sub_808EE28;
        gSprites[spriteId].data5 = 32;
    }
    gPokedexView->unk630 = 0;
    gPokedexView->unk632 = 0;
}

bool8 sub_808E208(u8 a, u8 b, u8 c)
{
    u16 i;
    u8 foo;

    if (gPokedexView->unk62E)
    {
        gPokedexView->unk62E--;
        switch (a)
        {
        case 1:
            for (i = 0; i < 4; i++)
            {
                if (gPokedexView->unk61E[i] != 0xFFFF)
                    gSprites[gPokedexView->unk61E[i]].data5 += b;
            }
            foo = 16 * (c - gPokedexView->unk62E) / c;
            REG_BG2VOFS = gPokedexView->unk62D + gPokedexView->unk632 * 16 - foo;
            gPokedexView->unk62C -= gPokedexView->unk628;
            break;
        case 2:
            for (i = 0; i < 4; i++)
            {
                if (gPokedexView->unk61E[i] != 0xFFFF)
                    gSprites[gPokedexView->unk61E[i]].data5 -= b;
            }
            foo = 16 * (c - gPokedexView->unk62E) / c;
            REG_BG2VOFS = gPokedexView->unk62D + gPokedexView->unk632 * 16 + foo;
            gPokedexView->unk62C += gPokedexView->unk628;
            break;
        }
        return 0;
    }
    //_0808E36C
    else
    {
        REG_BG2VOFS = gPokedexView->unk62D + gPokedexView->unk630 * 16;
        return 1;
    }
}

void sub_808E398(u8 a, u16 b)
{
    u16 unk;
    u8 spriteId;

    gPokedexView->unk632 = gPokedexView->unk630;
    switch (a)
    {
    case 1:
    {
        unk = sub_808E888(b - 1);
        if (unk != 0xFFFF)
        {
            spriteId = sub_808E8C8(unk, 0x60, 0x50);
            gSprites[spriteId].callback = sub_808EE28;
            gSprites[spriteId].data5 = 0xFFC0;
        }
        if (gPokedexView->unk630 > 0)
            gPokedexView->unk630--;
        else
            gPokedexView->unk630 = 0xF;
        break;
    }
    case 2:
    {
        unk = sub_808E888(b + 1);
        if (unk != 0xFFFF)
        {
            spriteId = sub_808E8C8(unk, 0x60, 0x50);
            gSprites[spriteId].callback = sub_808EE28;
            gSprites[spriteId].data5 = 0x40;
        }
        if (gPokedexView->unk630 <= 0xE)
            gPokedexView->unk630++;
        else
            gPokedexView->unk630 = 0;
        break;
    }
    }
}
#ifdef NONMATCHING
//This one's ridiculous. Fix later
u16 sub_808E48C(u16 a, u16 b)
{
    u8 r3;
    u8 r5;
    u32 r10 = 0;
    if (!(gMain.heldKeys & 0x40) || a == 0)
    {
        u8 i;
        u16 r6;

        //_0808E4B6
        if (gMain.heldKeys & 0x80)
        {
            if (a < gPokedexView->unk60C - 1)
                goto _0808E5C4;
        }
        //_0808E4CE

        if ((gMain.newKeys & 0x20) && a != 0)
        {
            r6 = a;
            //_0808E4E0
            for (i = 0; i < 7; i++)
            {
                a = sub_8091818(1, a, 0, gPokedexView->unk60C - 1);
            }

            gPokedexView->unk62C += (a - r6) * 16;
            sub_808E82C();
            sub_808E0CC(a, 0xE);
            PlaySE(SE_Z_PAGE);
            goto _0808E5A2;
        }
        //_0808E53C
        if (!(gMain.newKeys & 0x10) || a >= gPokedexView->unk60C - 1)
            goto _0808E5A2;

        r6 = a;
        for (i = 0; i < 7; i++)
        {
            a = sub_8091818(0, a, 0, gPokedexView->unk60C - 1);
        }

        gPokedexView->unk62C += (a - r6) * 16;
        sub_808E82C();
        sub_808E0CC(a, 0xE);
        PlaySE(SE_Z_PAGE);
        goto _0808E5A2;

       _0808E5A2:
        if (r10 != 0)
            goto _0808E628;
        gPokedexView->unk638 = r10;
        return a;

       _0808E5C4:
        r10 = 2;
        a = sub_8091818(0, a, 0, gPokedexView->unk60C - 1);
        sub_808E398(2, a);
        //goto _0808E60E
        sub_808DBE8(2, a, b);
        PlaySE(SE_Z_SCROLL);
    }
    //_0808E5E4
    else
    {
        r10 = 1;
        a = sub_8091818(1, a, 0, gPokedexView->unk60C - 1);
        sub_808E398(1, a);
        //_0808E60E
        sub_808DBE8(1, a, b);
        PlaySE(SE_Z_SCROLL);
    }
    //_0808E60E
    goto _0808E5A2;

  _0808E628:
    r5 = gUnknown_083A05EC[gPokedexView->unk638 / 4];
    r3 = gUnknown_083A05F1[gPokedexView->unk638 / 4];
    gPokedexView->unk62E = r3;
    gPokedexView->unk636 = r3;
    gPokedexView->unk634 = r5;
    gPokedexView->unk62F = r10;
    gPokedexView->unk628 = r5;
    sub_808E208(gPokedexView->unk62F, gPokedexView->unk634, gPokedexView->unk636);
    if (gPokedexView->unk638 <= 0xB)
        gPokedexView->unk638++;
    return a;
}
#else
__attribute__((naked))
u16 sub_808E48C(u16 a, u16 b)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    lsls r0, 16\n\
    lsrs r7, r0, 16\n\
    lsls r1, 16\n\
    lsrs r4, r1, 16\n\
    movs r0, 0\n\
    mov r10, r0\n\
    ldr r1, _0808E52C\n\
    ldrh r2, [r1, 0x2C]\n\
    movs r0, 0x40\n\
    ands r0, r2\n\
    adds r3, r1, 0\n\
    cmp r0, 0\n\
    beq _0808E4B6\n\
    cmp r7, 0\n\
    beq _0808E4B6\n\
    b _0808E5E4\n\
_0808E4B6:\n\
    movs r0, 0x80\n\
    ands r0, r2\n\
    cmp r0, 0\n\
    beq _0808E4CE\n\
    ldr r0, _0808E530\n\
    ldr r0, [r0]\n\
    ldr r1, _0808E534\n\
    adds r0, r1\n\
    ldrh r0, [r0]\n\
    subs r0, 0x1\n\
    cmp r7, r0\n\
    blt _0808E5C4\n\
_0808E4CE:\n\
    ldrh r1, [r3, 0x2E]\n\
    movs r0, 0x20\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0808E53C\n\
    cmp r7, 0\n\
    beq _0808E53C\n\
    adds r6, r7, 0\n\
    movs r4, 0\n\
_0808E4E0:\n\
    ldr r5, _0808E530\n\
    ldr r0, [r5]\n\
    ldr r2, _0808E534\n\
    adds r0, r2\n\
    ldrh r3, [r0]\n\
    subs r3, 0x1\n\
    lsls r3, 16\n\
    lsrs r3, 16\n\
    movs r0, 0x1\n\
    adds r1, r7, 0\n\
    movs r2, 0\n\
    bl sub_8091818\n\
    adds r7, r0, 0\n\
    adds r0, r4, 0x1\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    cmp r4, 0x6\n\
    bls _0808E4E0\n\
    ldr r1, [r5]\n\
    ldr r3, _0808E538\n\
    adds r1, r3\n\
    subs r0, r7, r6\n\
    lsls r0, 4\n\
    ldrb r2, [r1]\n\
    adds r0, r2\n\
    strb r0, [r1]\n\
    bl sub_808E82C\n\
    adds r0, r7, 0\n\
    movs r1, 0xE\n\
    bl sub_808E0CC\n\
    movs r0, 0x6D\n\
    bl PlaySE\n\
    b _0808E5A2\n\
    .align 2, 0\n\
_0808E52C: .4byte gMain\n\
_0808E530: .4byte gPokedexView\n\
_0808E534: .4byte 0x0000060c\n\
_0808E538: .4byte 0x0000062c\n\
_0808E53C:\n\
    ldrh r1, [r3, 0x2E]\n\
    movs r0, 0x10\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0808E5A2\n\
    ldr r0, _0808E5B8\n\
    ldr r0, [r0]\n\
    ldr r3, _0808E5BC\n\
    adds r0, r3\n\
    ldrh r0, [r0]\n\
    subs r0, 0x1\n\
    cmp r7, r0\n\
    bge _0808E5A2\n\
    adds r6, r7, 0\n\
    movs r4, 0\n\
_0808E55A:\n\
    ldr r5, _0808E5B8\n\
    ldr r0, [r5]\n\
    ldr r1, _0808E5BC\n\
    adds r0, r1\n\
    ldrh r3, [r0]\n\
    subs r3, 0x1\n\
    lsls r3, 16\n\
    lsrs r3, 16\n\
    movs r0, 0\n\
    adds r1, r7, 0\n\
    movs r2, 0\n\
    bl sub_8091818\n\
    adds r7, r0, 0\n\
    adds r0, r4, 0x1\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    cmp r4, 0x6\n\
    bls _0808E55A\n\
    ldr r1, [r5]\n\
    ldr r2, _0808E5C0\n\
    adds r1, r2\n\
    subs r0, r7, r6\n\
    lsls r0, 4\n\
    ldrb r3, [r1]\n\
    adds r0, r3\n\
    strb r0, [r1]\n\
    bl sub_808E82C\n\
    adds r0, r7, 0\n\
    movs r1, 0xE\n\
    bl sub_808E0CC\n\
    movs r0, 0x6D\n\
    bl PlaySE\n\
_0808E5A2:\n\
    mov r0, r10\n\
    cmp r0, 0\n\
    bne _0808E628\n\
    ldr r0, _0808E5B8\n\
    ldr r0, [r0]\n\
    movs r1, 0xC7\n\
    lsls r1, 3\n\
    adds r0, r1\n\
    mov r2, r10\n\
    strh r2, [r0]\n\
    b _0808E68E\n\
    .align 2, 0\n\
_0808E5B8: .4byte gPokedexView\n\
_0808E5BC: .4byte 0x0000060c\n\
_0808E5C0: .4byte 0x0000062c\n\
_0808E5C4:\n\
    movs r3, 0x2\n\
    mov r10, r3\n\
    lsls r3, r0, 16\n\
    lsrs r3, 16\n\
    movs r0, 0\n\
    adds r1, r7, 0\n\
    movs r2, 0\n\
    bl sub_8091818\n\
    adds r7, r0, 0\n\
    movs r0, 0x2\n\
    adds r1, r7, 0\n\
    bl sub_808E398\n\
    movs r0, 0x2\n\
    b _0808E60E\n\
_0808E5E4:\n\
    movs r0, 0x1\n\
    mov r10, r0\n\
    ldr r0, _0808E620\n\
    ldr r0, [r0]\n\
    ldr r1, _0808E624\n\
    adds r0, r1\n\
    ldrh r3, [r0]\n\
    subs r3, 0x1\n\
    lsls r3, 16\n\
    lsrs r3, 16\n\
    movs r0, 0x1\n\
    adds r1, r7, 0\n\
    movs r2, 0\n\
    bl sub_8091818\n\
    adds r7, r0, 0\n\
    movs r0, 0x1\n\
    adds r1, r7, 0\n\
    bl sub_808E398\n\
    movs r0, 0x1\n\
_0808E60E:\n\
    adds r1, r7, 0\n\
    adds r2, r4, 0\n\
    bl sub_808DBE8\n\
    movs r0, 0x6C\n\
    bl PlaySE\n\
    b _0808E5A2\n\
    .align 2, 0\n\
_0808E620: .4byte gPokedexView\n\
_0808E624: .4byte 0x0000060c\n\
_0808E628:\n\
    ldr r1, _0808E6A0\n\
    ldr r6, _0808E6A4\n\
    ldr r2, [r6]\n\
    movs r3, 0xC7\n\
    lsls r3, 3\n\
    mov r9, r3\n\
    adds r0, r2, r3\n\
    ldrh r0, [r0]\n\
    lsrs r0, 2\n\
    adds r1, r0, r1\n\
    ldrb r5, [r1]\n\
    ldr r1, _0808E6A8\n\
    adds r0, r1\n\
    ldrb r3, [r0]\n\
    ldr r0, _0808E6AC\n\
    adds r2, r0\n\
    strb r3, [r2]\n\
    ldr r1, [r6]\n\
    ldr r2, _0808E6B0\n\
    mov r8, r2\n\
    adds r0, r1, r2\n\
    strh r3, [r0]\n\
    ldr r4, _0808E6B4\n\
    adds r0, r1, r4\n\
    strh r5, [r0]\n\
    ldr r3, _0808E6B8\n\
    adds r1, r3\n\
    mov r0, r10\n\
    strb r0, [r1]\n\
    ldr r2, [r6]\n\
    lsrs r5, 1\n\
    movs r1, 0xC5\n\
    lsls r1, 3\n\
    adds r0, r2, r1\n\
    strh r5, [r0]\n\
    adds r3, r2, r3\n\
    ldrb r0, [r3]\n\
    adds r4, r2, r4\n\
    ldrb r1, [r4]\n\
    add r2, r8\n\
    ldrb r2, [r2]\n\
    bl sub_808E208\n\
    ldr r0, [r6]\n\
    mov r2, r9\n\
    adds r1, r0, r2\n\
    ldrh r0, [r1]\n\
    cmp r0, 0xB\n\
    bhi _0808E68E\n\
    adds r0, 0x1\n\
    strh r0, [r1]\n\
_0808E68E:\n\
    adds r0, r7, 0\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_0808E6A0: .4byte gUnknown_083A05EC\n\
_0808E6A4: .4byte gPokedexView\n\
_0808E6A8: .4byte gUnknown_083A05F1\n\
_0808E6AC: .4byte 0x0000062e\n\
_0808E6B0: .4byte 0x00000636\n\
_0808E6B4: .4byte 0x00000634\n\
_0808E6B8: .4byte 0x0000062f\n\
    .syntax divided\n");
}
#endif

void sub_808E6BC(void)
{
    u16 i;

    for (i = 0; i < 4; i++)
    {
        u16 spriteId = gPokedexView->unk61E[i];

        if (gSprites[spriteId].pos2.x == 0 && gSprites[spriteId].pos2.y == 0 && spriteId != 0xFFFF)
            gPokedexView->unk626 = spriteId;
    }
}

u8 sub_808E71C(void)
{
    u16 r2;
    u16 r4 = gPokedexView->selectedPokemon;

    if ((gMain.newKeys & DPAD_UP) && r4)
    {
        r2 = r4;
        while (r2 != 0)
        {
            r2 = sub_8091818(1, r2, 0, gPokedexView->unk60C - 1);

            if (gPokedexView->unk0[r2].seen)
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
            gPokedexView->unk62C -= 16;
            return 1;
        }
    }
    else if ((gMain.newKeys & DPAD_DOWN) && r4 < gPokedexView->unk60C - 1)
    {
        r2 = r4;
        while (r2 < gPokedexView->unk60C - 1)
        {
            r2 = sub_8091818(0, r2, 0, gPokedexView->unk60C - 1);

            if (gPokedexView->unk0[r2].seen)
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
            gPokedexView->unk62C += 16;
            return 1;
        }
    }
    return 0;
}

u8 sub_808E82C(void)
{
    u16 i;

    for (i = 0; i < 4; i++)
    {
        if (gPokedexView->unk61E[i] != 0xFFFF)
        {
            DestroySprite(&gSprites[gPokedexView->unk61E[i]]);
            gPokedexView->unk61E[i] |= 0xFFFF;
        }
    }
    return 0;
}

u16 sub_808E888(u16 a1)
{
    if (a1 > 385 || gPokedexView->unk0[a1].dexNum == 0xFFFF)
        return 0xFFFF;
    else if (gPokedexView->unk0[a1].seen)
        return gPokedexView->unk0[a1].dexNum;
    else
        return 0;
}

u32 sub_808E8C8(u16 a, u16 b, u16 c)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        if (gPokedexView->unk61E[i] == 0xFFFF)
        {
            u8 spriteId = sub_80918EC(a, (s16)b, (s16)c, i);

            gSprites[spriteId].oam.affineMode = 1;
            gSprites[spriteId].oam.priority = 3;
            gSprites[spriteId].data0 = 0;
            gSprites[spriteId].data1 = i;
            gSprites[spriteId].data2 = NationalPokedexNumToSpecies(a);
            gPokedexView->unk61E[i] = spriteId;
            return spriteId;
        }
    }
    return 0xFFFF;
}

void sub_808E978(u8 a)
{
    u8 spriteId;
    u16 r5;

    spriteId = CreateSprite(&gSpriteTemplate_83A053C, 0xB8, 4, 0);
    gSprites[spriteId].data1 = 0;

    spriteId = CreateSprite(&gSpriteTemplate_83A053C, 0xB8, 0x9C, 0);
    gSprites[spriteId].data1 = 1;
    gSprites[spriteId].vFlip = 1;

    CreateSprite(&gSpriteTemplate_83A0524, 0xEA, 0x14, 0);
    CreateSprite(&gSpriteTemplate_83A0554, 0x10, 0x8A, 0);

    spriteId = CreateSprite(&gSpriteTemplate_83A0554, 0x30, 0x8A, 0);
    StartSpriteAnim(&gSprites[spriteId], 3);

    spriteId = CreateSprite(&gSpriteTemplate_83A0554, 0x10, 0x9E, 0);
    StartSpriteAnim(&gSprites[spriteId], 2);
    gSprites[spriteId].data2 = 0x80;

    spriteId = CreateSprite(&gSpriteTemplate_83A0554, 0x30, 0x9E, 0);
    StartSpriteAnim(&gSprites[spriteId], 1);

    spriteId = CreateSprite(&gSpriteTemplate_83A056C, 0, 0x50, 2);
    gSprites[spriteId].oam.affineMode = 1;
    gSprites[spriteId].oam.matrixNum = 30;
    gSprites[spriteId].data0 = 0x1E;
    gSprites[spriteId].data1 = 0;

    spriteId = CreateSprite(&gSpriteTemplate_83A056C, 0, 0x50, 2);
    gSprites[spriteId].oam.affineMode = 1;
    gSprites[spriteId].oam.matrixNum = 31;
    gSprites[spriteId].data0 = 0x1F;
    gSprites[spriteId].data1 = 0x80;

    if (a == 0)
    {
        u32 _a;

        CreateSprite(&gSpriteTemplate_83A0584, 0x20, 0x28, 1);

        spriteId = CreateSprite(&gSpriteTemplate_83A0584, 0x20, 0x48, 1);
        StartSpriteAnim(&gSprites[spriteId], 1);
        _a = 0;

        spriteId = CreateSprite(&gSpriteTemplate_83A059C, 0x1C, 0x30, 1);
        r5 = gPokedexView->unk61A / 100;
        StartSpriteAnim(&gSprites[spriteId], r5);
        if (r5 != 0)
            _a = 1;
        else
            gSprites[spriteId].invisible = 1;

        spriteId = CreateSprite(&gSpriteTemplate_83A059C, 0x22, 0x30, 1);
        r5 = (gPokedexView->unk61A % 100) / 10;
        if (r5 != 0 || _a != 0)
            StartSpriteAnim(&gSprites[spriteId], r5);
        else
            gSprites[spriteId].invisible = 1;

        spriteId = CreateSprite(&gSpriteTemplate_83A059C, 0x28, 0x30, 1);
        r5 = (gPokedexView->unk61A % 100) % 10;
        StartSpriteAnim(&gSprites[spriteId], r5);
        _a = 0;

        spriteId = CreateSprite(&gSpriteTemplate_83A059C, 0x1C, 0x50, 1);
        r5 = gPokedexView->unk61C / 100;
        StartSpriteAnim(&gSprites[spriteId], r5);
        if (r5 != 0)
            _a = 1;
        else
            gSprites[spriteId].invisible = 1;

        spriteId = CreateSprite(&gSpriteTemplate_83A059C, 0x22, 0x50, 1);
        r5 = (gPokedexView->unk61C % 100) / 10;
        if (r5 != 0 || _a != 0)
            StartSpriteAnim(&gSprites[spriteId], r5);
        else
            gSprites[spriteId].invisible = 1;

        spriteId = CreateSprite(&gSpriteTemplate_83A059C, 0x28, 0x50, 1);
        r5 = (gPokedexView->unk61C % 100) % 10;
        StartSpriteAnim(&gSprites[spriteId], r5);

        spriteId = CreateSprite(&gSpriteTemplate_83A05B4, 0x8C, 0x60, 1);
        gSprites[spriteId].invisible = 1;
    }
    else
    {
        spriteId = CreateSprite(&gSpriteTemplate_83A05B4, 0x8C, 0x50, 1);
        gSprites[spriteId].invisible = 1;
    }
}

void nullsub_58(struct Sprite *sprite)
{
}

void sub_808ED94(struct Sprite *sprite)
{
    if (gPokedexView->unk64A != 0)
        DestroySprite(sprite);
}

//Move Pokemon into position for description page
void sub_808EDB8(struct Sprite *sprite)
{
    sprite->oam.priority = 0;
    sprite->oam.affineMode = 0;
    sprite->pos2.x = 0;
    sprite->pos2.y = 0;
    if (sprite->pos1.x != 0x30 || sprite->pos1.y != 0x38)
    {
        if (sprite->pos1.x > 0x30)
            sprite->pos1.x--;
        if (sprite->pos1.x < 0x30)
            sprite->pos1.x++;
        if (sprite->pos1.y > 0x38)
            sprite->pos1.y--;
        if (sprite->pos1.y <0x38)
            sprite->pos1.y++;
    }
    //_0808EE1C
    else
        sprite->callback = nullsub_58;
}

void sub_808EE28(struct Sprite *sprite)
{
    u8 data1 = sprite->data1;

    if (gPokedexView->unk64A != 0 && gPokedexView->unk64A != 3)
    {
        DestroySprite(sprite);
        gPokedexView->unk61E[data1] = 0xFFFF;
    }
    else
    {
        //_0808EE58
        s32 var;

        sprite->pos2.y = gSineTable[(u8)sprite->data5] * 76 / 256;
        var = 0x10000 / gSineTable[sprite->data5 + 0x40];
        if ((u32)var > 0xFFFF)
            var = 0xFFFF;
        SetOamMatrix(sprite->data1 + 1, 0x100, 0, 0, var);
        sprite->oam.matrixNum = data1 + 1;

        //ToDo: clean up these inequalities
        if ((u16)(sprite->data5 + 0x3F) <= 0x7E)
        {
            sprite->invisible = 0;
            sprite->data0 = 1;
        }
        else
        {
            sprite->invisible = 1;
        }
        //_0808EEF8
        if ((u16)(sprite->data5 + 0x3F) > 0x7E && sprite->data0 != 0)
        {
            DestroySprite(sprite);
            gPokedexView->unk61E[data1] = 0xFFFF;
        }
    }
    //_0808EF16
}

void sub_808EF38(struct Sprite *sprite)
{
    if (gPokedexView->unk64A != 0 && gPokedexView->unk64A != 3)
        DestroySprite(sprite);
    else
        sprite->pos2.y = gPokedexView->selectedPokemon * 120 / (gPokedexView->unk60C - 1);
}

void sub_808EF8C(struct Sprite *sprite)
{
    if (gPokedexView->unk64A != 0 && gPokedexView->unk64A != 3)
        DestroySprite(sprite);
    else
    {
        u8 r0;

        if (sprite->data1 != 0)
        {
            if (gPokedexView->selectedPokemon == gPokedexView->unk60C - 1)
                sprite->invisible = 1;
            else
                sprite->invisible = 0;
            r0 = sprite->data2;
        }
        else
        {
            if (gPokedexView->selectedPokemon == 0)
                sprite->invisible = 1;
            else
                sprite->invisible = 0;
            r0 = sprite->data2 - 0x80;
        }
        sprite->pos2.y = gSineTable[r0] / 64;
        sprite->data2 = sprite->data2 + 8;
        if (gPokedexView->menuIsOpen == 0 && gPokedexView->menuY == 0 && sprite->invisible == 0)
            sprite->invisible = 0;
        else
            sprite->invisible = 1;
    }
}

void sub_808F08C(struct Sprite *sprite)
{
    if (gPokedexView->unk64A != 0 && gPokedexView->unk64A != 3)
        DestroySprite(sprite);
}

#ifdef NONMATCHING
void sub_808F0B4(struct Sprite *sprite)
{
    if (gPokedexView->unk64A != 0 && gPokedexView->unk64A != 3)
        DestroySprite(sprite);
    else
    {
        s16 r3;

        u8 unk = gPokedexView->unk62C + sprite->data1;
        u16 foo = gSineTable[unk];
        //u8 unk2 = sprite->data0;
        //u16 bar = gSineTable[unk + 0x40];

        SetOamMatrix(sprite->data0, foo, gSineTable[unk + 0x40], (-(u16)foo) >> 16, gSineTable[unk + 0x40]);

        r3 = gSineTable[sprite->data1 + gPokedexView->unk62C];
        sprite->pos2.x = gSineTable[sprite->data1 + gPokedexView->unk62C + 0x40] * 5 / 256;
        sprite->pos2.y = r3 * 40 / 256;
    }
}
#else
__attribute__((naked))
void sub_808F0B4(struct Sprite *sprite)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    sub sp, 0x4\n\
    adds r6, r0, 0\n\
    ldr r1, _0808F0D8 @ =gPokedexView\n\
    ldr r0, [r1]\n\
    ldr r2, _0808F0DC @ =0x0000064a\n\
    adds r0, r2\n\
    ldrb r0, [r0]\n\
    adds r7, r1, 0\n\
    cmp r0, 0\n\
    beq _0808F0E0\n\
    cmp r0, 0x3\n\
    beq _0808F0E0\n\
    adds r0, r6, 0\n\
    bl DestroySprite\n\
    b _0808F158\n\
    .align 2, 0\n\
_0808F0D8: .4byte gPokedexView\n\
_0808F0DC: .4byte 0x0000064a\n\
_0808F0E0:\n\
    ldr r0, [r7]\n\
    ldr r5, _0808F160 @ =0x0000062c\n\
    adds r0, r5\n\
    ldrb r1, [r0]\n\
    ldrh r0, [r6, 0x30]\n\
    adds r1, r0\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
    ldr r4, _0808F164 @ =gSineTable\n\
    lsls r0, r1, 1\n\
    adds r0, r4\n\
    ldrh r3, [r0]\n\
    adds r1, 0x40\n\
    lsls r1, 1\n\
    adds r1, r4\n\
    ldrh r0, [r6, 0x2E]\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    ldrh r1, [r1]\n\
    lsls r3, 16\n\
    lsrs r2, r3, 16\n\
    negs r3, r3\n\
    lsrs r3, 16\n\
    str r1, [sp]\n\
    bl SetOamMatrix\n\
    ldr r1, [r7]\n\
    adds r1, r5\n\
    ldrh r0, [r6, 0x30]\n\
    adds r0, 0x40\n\
    ldrb r1, [r1]\n\
    adds r0, r1\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    lsls r1, r0, 1\n\
    adds r1, r4\n\
    ldrh r3, [r1]\n\
    adds r0, 0x40\n\
    lsls r0, 1\n\
    adds r0, r4\n\
    movs r2, 0\n\
    ldrsh r1, [r0, r2]\n\
    lsls r0, r1, 2\n\
    adds r0, r1\n\
    lsls r0, 3\n\
    cmp r0, 0\n\
    bge _0808F140\n\
    adds r0, 0xFF\n\
_0808F140:\n\
    asrs r0, 8\n\
    strh r0, [r6, 0x24]\n\
    lsls r1, r3, 16\n\
    asrs r1, 16\n\
    lsls r0, r1, 2\n\
    adds r0, r1\n\
    lsls r0, 3\n\
    cmp r0, 0\n\
    bge _0808F154\n\
    adds r0, 0xFF\n\
_0808F154:\n\
    asrs r0, 8\n\
    strh r0, [r6, 0x26]\n\
_0808F158:\n\
    add sp, 0x4\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0808F160: .4byte 0x0000062c\n\
_0808F164: .4byte gSineTable\n\
    .syntax divided\n");
}
#endif

void sub_808F168(struct Sprite *sprite)
{
    if (gPokedexView->unk64A != 0 && gPokedexView->unk64A != 3)
        DestroySprite(sprite);
    else
    {
        u16 r1 = gPokedexView->unk64A == 0 ? 0x50 : 0x60;

        if (gPokedexView->menuIsOpen != 0 && gPokedexView->menuY == r1)
        {
            sprite->invisible = 0;
            sprite->pos2.y = gPokedexView->menuCursorPos * 16;
            sprite->pos2.x = gSineTable[(u8)sprite->data2] / 64;
            sprite->data2 += 8;
        }
        else
            sprite->invisible = 1;
    }
}

u8 sub_808F210(struct PokedexListItem *item, u8 b)
{
    u8 taskId;

    gUnknown_0202FFBC = item;
    taskId = CreateTask(Task_InitPageScreenMultistep, 0);
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = 1;
    gTasks[taskId].data[2] = 0;
    gTasks[taskId].data[3] = 0;
    gTasks[taskId].data[4] = b;
    return taskId;
}

bool8 sub_808F250(u8 taskId)
{
    if (gTasks[taskId].data[0] == 0 && gTasks[taskId].func == Task_PageScreenProcessInput)
        return 0;
    else
        return 1;
}

u8 sub_808F284(struct PokedexListItem *item, u8 b)
{
    gUnknown_0202FFBC = item;
    gTasks[b].data[0] = 1;
    gTasks[b].data[1] = 0;
    gTasks[b].data[2] = 0;
    gTasks[b].data[3] = 0;
    return b;
}

void Task_InitPageScreenMultistep(u8 taskId)
{
    switch (gMain.state)
    {
    case 0:
    default:
        if (!gPaletteFade.active)
        {
            u16 r2;

            gPokedexView->unk64A = 1;
            gPokedexView->unk64E = 0;
            gUnknown_03005CEC = gMain.vblankCallback;
            SetVBlankCallback(NULL);
            r2 = 0;
            if (gTasks[taskId].data[1] != 0)
                r2 += 0x1000;
            if (gTasks[taskId].data[2] != 0)
                r2 |= 0x200;
            sub_8091060(r2);
            gMain.state = 1;
        }
        break;
    case 1:
        LZ77UnCompVram(gPokedexMenu_Gfx, (void *)VRAM);
        LZ77UnCompVram(gUnknown_08E96BD4, (void *)(VRAM + 0x7800));
        sub_8091738(gUnknown_0202FFBC->dexNum, 2, 0x3FC);
        gMain.state++;
        break;
    case 2:
        sub_80904FC(0xD);
        sub_8090584(gPokedexView->selectedScreen, 0xD);
        sub_808D640();
        gMain.state++;
        break;
    case 3:
        SetUpWindowConfig(&gWindowConfig_81E7064);
        InitMenuWindow(&gWindowConfig_81E7064);
        gMain.state++;
        break;
    case 4:
        if (gPokedexView->dexMode == DEX_MODE_HOENN)
            sub_8091154(NationalToHoennOrder(gUnknown_0202FFBC->dexNum), 0xD, 3);
        else
            sub_8091154(gUnknown_0202FFBC->dexNum, 0xD, 3);
        sub_80911C8(gUnknown_0202FFBC->dexNum, 0x10, 3);
        MenuPrint(gDexText_UnknownPoke, 11, 5);
        MenuPrint(gDexText_UnknownHeight, 16, 7);
        MenuPrint(gDexText_UnknownWeight, 16, 9);
        if (gUnknown_0202FFBC->owned)
        {
            sub_8091304(gPokedexEntries[gUnknown_0202FFBC->dexNum].categoryName, 11, 5);
            sub_8091458(gPokedexEntries[gUnknown_0202FFBC->dexNum].height, 16, 7);
            sub_8091564(gPokedexEntries[gUnknown_0202FFBC->dexNum].weight, 16, 9);
            MenuPrint(gPokedexEntries[gUnknown_0202FFBC->dexNum].descriptionPage1, 2, 13);
            sub_80917CC(14, 0x3FC);
        }
        else
        {
            MenuPrint(gUnknown_083A05F8, 2, 13);
            LoadPalette(gPlttBufferUnfaded + 1, 0x31, 0x1E);
        }
        gMain.state++;
        break;
    case 5:
        if (gTasks[taskId].data[1] == 0)
        {
            gTasks[taskId].data[4] = (u16)sub_80918EC(gUnknown_0202FFBC->dexNum, 0x30, 0x38, 0);
            gSprites[gTasks[taskId].data[4]].oam.priority = 0;
        }
        gMain.state++;
        break;
    case 6:
    {
        u32 r3 = 0;

        if (gTasks[taskId].data[2] != 0)
            r3 = 0x14;
        if (gTasks[taskId].data[1] != 0)
            r3 |= (1 << (gSprites[gTasks[taskId].data[4]].oam.paletteNum + 0x10));
        BeginNormalPaletteFade(~r3, 0, 0x10, 0, 0);
        SetVBlankCallback(gUnknown_03005CEC);
        gMain.state++;
        break;
    }
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
                PlayCry2(NationalPokedexNumToSpecies(gUnknown_0202FFBC->dexNum), 0, 0x7D, 0xA);
            }
            else
                gMain.state++;
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

void Task_PageScreenProcessInput(u8 taskId)
{
    if (gTasks[taskId].data[0] != 0)
    {
        BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
        gTasks[taskId].func = sub_808F888;
        PlaySE(SE_Z_SCROLL);
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
        gTasks[taskId].func = Task_ClosePageScreen;
        PlaySE(SE_PC_OFF);
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        switch (gPokedexView->selectedScreen)
        {
        case PAGE_SCREEN:
            sub_8090C68();
            break;
        case AREA_SCREEN:
            BeginNormalPaletteFade(-0x15, 0, 0, 0x10, 0);
            gTasks[taskId].func = Task_InitAreaScreenMultistep;
            PlaySE(SE_PIN);
            break;
        case CRY_SCREEN:
            BeginNormalPaletteFade(-0x15, 0, 0, 0x10, 0);
            gTasks[taskId].func = Task_InitCryScreenMultistep;
            PlaySE(SE_PIN);
            break;
        case SIZE_SCREEN:
            if (!gUnknown_0202FFBC->owned)
                PlaySE(SE_HAZURE);
            else
            {
                BeginNormalPaletteFade(-0x15, 0, 0, 0x10, 0);
                gTasks[taskId].func = Task_InitSizeScreenMultistep;
                PlaySE(SE_PIN);
            }
            break;
        }
    }
    else if (((gMain.newKeys & DPAD_LEFT)
     || ((gMain.newKeys & L_BUTTON) && gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR))
     && gPokedexView->selectedScreen > 0)
    {
        gPokedexView->selectedScreen--;
        sub_8090584(gPokedexView->selectedScreen, 0xD);
        PlaySE(SE_Z_PAGE);
    }
    else if (((gMain.newKeys & DPAD_RIGHT)
     || ((gMain.newKeys & R_BUTTON) && gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR))
     && gPokedexView->selectedScreen < 3)
    {
        gPokedexView->selectedScreen++;
        sub_8090584(gPokedexView->selectedScreen, 0xD);
        PlaySE(SE_Z_PAGE);
    }
}

void sub_808F888(u8 taskId)
{
    if (!gPaletteFade.active)
        gTasks[taskId].func = Task_InitPageScreenMultistep;
}

void Task_ClosePageScreen(u8 taskId)
{
    if (!gPaletteFade.active)
        DestroyTask(taskId);
}

void Task_InitAreaScreenMultistep(u8 taskId)
{
    switch (gMain.state)
    {
    case 0:
    default:
        if (!gPaletteFade.active)
        {
            gPokedexView->unk64A = 5;
            gUnknown_03005CEC = gMain.vblankCallback;
            SetVBlankCallback(NULL);
            sub_8091060(0x200);
            gPokedexView->selectedScreen = AREA_SCREEN;
            gMain.state = 1;
        }
        break;
    case 1:
        sub_8090540(0xD);
        sub_8090644(1, 0xD);
        sub_808D640();
        REG_BG1CNT = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(13) | BGCNT_16COLOR | BGCNT_TXT256x256;
        gMain.state++;
        break;
    case 2:
        ShowPokedexAreaScreen(NationalPokedexNumToSpecies(gUnknown_0202FFBC->dexNum), &gPokedexView->unk64F);
        SetVBlankCallback(gUnknown_03005CEC);
        gPokedexView->unk64F = 0;
        gMain.state = 0;
        gTasks[taskId].func = Task_AreaScreenProcessInput;
        break;
    }
}

void Task_AreaScreenProcessInput(u8 taskId)
{
    if (gPokedexView->unk64F != 0)
        gTasks[taskId].func = sub_808FA00;
}

void sub_808FA00(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        switch (gPokedexView->unk64F)
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

void Task_InitCryScreenMultistep(u8 taskId)
{
    switch (gMain.state)
    {
    case 0:
    default:
        if (!gPaletteFade.active)
        {
            m4aMPlayStop(&gMPlay_BGM);
            gPokedexView->unk64A = 6;
            gUnknown_03005CEC = gMain.vblankCallback;
            SetVBlankCallback(NULL);
            sub_8091060(0x200);
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
        sub_8090540(0xD);
        sub_8090644(2, 0xD);
        sub_808D640();
        DmaClear16(3, (void *)(VRAM + 0xF800), 0x500);
        gMain.state++;
        break;
    case 3:
        SetUpWindowConfig(&gWindowConfig_81E702C);
        InitMenuWindow(&gWindowConfig_81E702C);
        ResetPaletteFade();
        gMain.state++;
        break;
    case 4:
        MenuPrint(gDexText_CryOf, 10, 4);
        sub_8091260(gUnknown_0202FFBC->dexNum, 10, 6, 2);
        gMain.state++;
        break;
    case 5:
        gTasks[taskId].data[4] = sub_80918EC(gUnknown_0202FFBC->dexNum, 0x30, 0x38, 0);
        gSprites[gTasks[taskId].data[4]].oam.priority = 0;
        gUnknown_03005E98 = 0;
        gMain.state++;
        break;
    case 6:
    {
        struct CryRelatedStruct sp8;

        sp8.unk0 = 0x4020;
        sp8.unk2 = 0x1F;
        sp8.paletteNo = 8;
        sp8.yPos = 0x1E;
        sp8.xPos = 0xC;
        if (sub_8119E3C(&sp8, 0) != 0)
        {
            gMain.state++;
            gUnknown_03005E98 = 0;
        }
        break;
    }
    case 7:
    {
        struct CryRelatedStruct sp10;

        sp10.unk0 = 0x3000;
        sp10.unk2 = 0xE;
        sp10.paletteNo = 9;
        sp10.xPos = 0x12;
        sp10.yPos = 3;
        if (ShowPokedexCryScreen(&sp10, 1) != 0)
        {
            gMain.state++;
        }
        break;
    }
    case 8:
        BeginNormalPaletteFade(-0x15, 0, 0x10, 0, 0);
        SetVBlankCallback(gUnknown_03005CEC);
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
        gPokedexView->unk64F = 0;
        gMain.state = 0;
        gTasks[taskId].func = Task_CryScreenProcessInput;
        break;
    }
}

void Task_CryScreenProcessInput(u8 taskId)
{
    sub_8119F88(0);

    if (IsCryPlaying())
        sub_8090040(1);
    else
        sub_8090040(0);

    if (gMain.newKeys & A_BUTTON)
    {
        sub_8090040(1);
        sub_811A050(NationalPokedexNumToSpecies(gUnknown_0202FFBC->dexNum));
        return;
    }
    else if (!gPaletteFade.active)
    {
        if (gMain.newKeys & B_BUTTON)
        {
            BeginNormalPaletteFade(-0x15, 0, 0, 0x10, 0);
            m4aMPlayContinue(&gMPlay_BGM);
            gPokedexView->unk64F = 1;
            gTasks[taskId].func = sub_808FFBC;
            PlaySE(SE_PC_OFF);
        }
        else if ((gMain.newKeys & DPAD_LEFT)
         || ((gMain.newKeys & L_BUTTON) && gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR))
        {
            BeginNormalPaletteFade(-0x15, 0, 0, 0x10, 0);
            m4aMPlayContinue(&gMPlay_BGM);
            gPokedexView->unk64F = 2;
            gTasks[taskId].func = sub_808FFBC;
            PlaySE(SE_Z_PAGE);
        }
        else if ((gMain.newKeys & DPAD_RIGHT)
         || ((gMain.newKeys & R_BUTTON) && gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR))
        {
            if (!gUnknown_0202FFBC->owned)
                PlaySE(SE_HAZURE);
            else
            {
                BeginNormalPaletteFade(-0x15, 0, 0, 0x10, 0);
                m4aMPlayContinue(&gMPlay_BGM);
                gPokedexView->unk64F = 3;
                gTasks[taskId].func = sub_808FFBC;
                PlaySE(SE_Z_PAGE);
            }
        }
    }
}

void sub_808FFBC(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        DestroyCryMeterNeedleSprite();
        switch (gPokedexView->unk64F)
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
        }
    }
}

void sub_8090040(u8 a)
{
    u16 unk;

    if (a != 0)
        unk = 0x392;
    else
        unk = 0x2AF;
    LoadPalette(&unk, 0x5D, 2);
}

void Task_InitSizeScreenMultistep(u8 taskId)
{
    u8 spriteId;

    switch (gMain.state)
    {
    default:
    case 0:
        if (!gPaletteFade.active)
        {
            gPokedexView->unk64A = 7;
            gUnknown_03005CEC = gMain.vblankCallback;
            SetVBlankCallback(NULL);
            sub_8091060(0x200);
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
        sub_8090540(0xD);
        sub_8090644(3, 0xD);
        sub_808D640();
        gMain.state++;
        break;
    case 3:
    {
        u8 string[40];  //I hope this is the correct size

        SetUpWindowConfig(&gWindowConfig_81E702C);
        InitMenuWindow(&gWindowConfig_81E702C);
        string[0] = EOS;
        StringAppend(string, gDexText_SizeComparedTo);
        StringAppend(string, gSaveBlock2.playerName);
        sub_8072BD8(string, 3, 15, 0xC0);
        gMain.state++;
        break;
    }
    case 4:
        ResetPaletteFade();
        gMain.state++;
        break;
    case 5:
        spriteId = sub_8091A4C(gSaveBlock2.playerGender, 0x98, 0x38, 0);
        gSprites[spriteId].oam.affineMode = 1;
        gSprites[spriteId].oam.matrixNum = 1;
        gSprites[spriteId].oam.priority = 0;
        gSprites[spriteId].pos2.y = gPokedexEntries[gUnknown_0202FFBC->dexNum].trainerOffset;
        SetOamMatrix(1, gPokedexEntries[gUnknown_0202FFBC->dexNum].trainerScale, 0, 0, gPokedexEntries[gUnknown_0202FFBC->dexNum].trainerScale);
        LoadPalette(gUnknown_083B4EC4, (gSprites[spriteId].oam.paletteNum + 16) * 16, 0x20);
        gMain.state++;
        break;
    case 6:
        spriteId = sub_80918EC(gUnknown_0202FFBC->dexNum, 0x58, 0x38, 1);
        gSprites[spriteId].oam.affineMode = 1;
        gSprites[spriteId].oam.matrixNum = 2;
        gSprites[spriteId].oam.priority = 0;
        gSprites[spriteId].pos2.y = gPokedexEntries[gUnknown_0202FFBC->dexNum].pokemonOffset;
        SetOamMatrix(2, gPokedexEntries[gUnknown_0202FFBC->dexNum].pokemonScale, 0, 0, gPokedexEntries[gUnknown_0202FFBC->dexNum].pokemonScale);
        LoadPalette(gUnknown_083B4EC4, (gSprites[spriteId].oam.paletteNum + 16) * 16, 0x20);
        gMain.state++;
        break;
    case 7:
        BeginNormalPaletteFade(-0x15, 0, 0x10, 0, 0);
        SetVBlankCallback(gUnknown_03005CEC);
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
            gPokedexView->unk64F = 0;
            gMain.state = 0;
            gTasks[taskId].func = Task_SizeScreenProcessInput;
        }
        break;
    }
}

void Task_SizeScreenProcessInput(u8 taskId)
{
    if (gMain.newKeys & B_BUTTON)
    {
        BeginNormalPaletteFade(-0x15, 0, 0, 0x10, 0);
        gPokedexView->unk64F = 1;
        gTasks[taskId].func = sub_8090498;
        PlaySE(SE_PC_OFF);
    }
    else if ((gMain.newKeys & DPAD_LEFT)
     || ((gMain.newKeys & L_BUTTON) && gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR))
    {
        BeginNormalPaletteFade(-0x15, 0, 0, 0x10, 0);
        gPokedexView->unk64F = 2;
        gTasks[taskId].func = sub_8090498;
        PlaySE(SE_Z_PAGE);
    }
}

void sub_8090498(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        switch (gPokedexView->unk64F)
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

void sub_80904FC(u16 a)
{
    LZ77UnCompVram(gUnknown_08E96ACC, (void *)(VRAM + a * 0x800));
    DmaClear16(3, (void *)(VRAM + a * 0x800 + 0xC0), 0x440);
}

void sub_8090540(u16 a)
{
    LZ77UnCompVram(gUnknown_08E96B58, (void *)(VRAM + a * 0x800));
    DmaClear16(3, (void *)(VRAM + a * 0x800 + 0xC0), 0x440);
}

#ifdef NONMATCHING
void sub_8090584(u8 a, u16 b)
{
    u8 i;   //r1
    u8 j;   //r3
    u32 r6;
    register u8 r7;

    for (i = 0; i < 4; i++)
    {
        r7 = i * 5 + 1;
        r6 = 0x4000;

        if (i == a)
            r6 = 0x2000;

        for (j = 0; j < 5; j++)
        {
            u32 r0 = b * 0x800 + (r7 + j) * 2;
            u8 *ptr;

            ptr = VRAM;
            *(u16 *)(ptr + r0) = *(u16 *)(ptr + r0) & 0xFFF | r6;
            ptr = VRAM + 0x40;
            *(u16 *)(ptr + r0) = *(u16 *)(ptr + r0) & 0xFFF | r6;
        }
    }
    r6 = 0x4000;
    for (j = 0; j < 5; j++)
    {
        u32 r0 = b * 0x800 + j * 2;
        u8 *ptr;

        ptr = VRAM + 0x32;
        *(u16 *)(ptr + r0) = *(u16 *)(ptr + r0) & 0xFFF | r6;
        ptr = VRAM + 0x72;
        *(u16 *)(ptr + r0) = *(u16 *)(ptr + r0) & 0xFFF | r6;
    }
}
#else
__attribute__((naked))
void sub_8090584(u8 a, u16 b)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r10, r0\n\
    lsls r1, 16\n\
    lsrs r1, 16\n\
    mov r9, r1\n\
    movs r1, 0\n\
_0809059C:\n\
    lsls r0, r1, 2\n\
    adds r0, r1\n\
    adds r0, 0x1\n\
    lsls r0, 24\n\
    lsrs r7, r0, 24\n\
    movs r6, 0x80\n\
    lsls r6, 7\n\
    cmp r1, r10\n\
    bne _080905B2\n\
    movs r6, 0x80\n\
    lsls r6, 6\n\
_080905B2:\n\
    movs r3, 0\n\
    mov r0, r9\n\
    lsls r0, 11\n\
    mov r12, r0\n\
    adds r1, 0x1\n\
    mov r8, r1\n\
    mov r5, r12\n\
    ldr r4, _08090634 @ =0x00000fff\n\
_080905C2:\n\
    adds r0, r7, r3\n\
    lsls r0, 1\n\
    adds r0, r5, r0\n\
    movs r2, 0xC0\n\
    lsls r2, 19\n\
    adds r1, r0, r2\n\
    ldrh r2, [r1]\n\
    ands r2, r4\n\
    orrs r2, r6\n\
    strh r2, [r1]\n\
    ldr r1, _08090638 @ =0x06000040\n\
    adds r0, r1\n\
    ldrh r2, [r0]\n\
    ands r2, r4\n\
    orrs r2, r6\n\
    strh r2, [r0]\n\
    adds r0, r3, 0x1\n\
    lsls r0, 24\n\
    lsrs r3, r0, 24\n\
    cmp r3, 0x4\n\
    bls _080905C2\n\
    mov r2, r8\n\
    lsls r0, r2, 24\n\
    lsrs r1, r0, 24\n\
    cmp r1, 0x3\n\
    bls _0809059C\n\
    movs r6, 0x80\n\
    lsls r6, 7\n\
    movs r3, 0\n\
    mov r5, r12\n\
    ldr r4, _08090634 @ =0x00000fff\n\
_08090600:\n\
    lsls r0, r3, 1\n\
    adds r0, r5, r0\n\
    ldr r2, _0809063C @ =0x06000032\n\
    adds r1, r0, r2\n\
    ldrh r2, [r1]\n\
    ands r2, r4\n\
    orrs r2, r6\n\
    strh r2, [r1]\n\
    ldr r1, _08090640 @ =0x06000072\n\
    adds r0, r1\n\
    ldrh r2, [r0]\n\
    ands r2, r4\n\
    orrs r2, r6\n\
    strh r2, [r0]\n\
    adds r0, r3, 0x1\n\
    lsls r0, 24\n\
    lsrs r3, r0, 24\n\
    cmp r3, 0x4\n\
    bls _08090600\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08090634: .4byte 0x00000fff\n\
_08090638: .4byte 0x06000040\n\
_0809063C: .4byte 0x06000032\n\
_08090640: .4byte 0x06000072\n\
    .syntax divided\n");
}
#endif

//Nope, can't get this one to match, either.
#ifdef NONMATCHING
void sub_8090644(u8 a, u16 b)
{
    u8 i;
    u8 j;

    for (i = 0; i < 4; i++)
    {
        u8 r8 = i * 5 + 1;
        u32 r5;

        if (i == a || i == 0)
            r5 = 0x2000;
        else if (a != 0)
            r5 = 0x4000;

        for (j = 0; j < 5; j++)
        {
            u16 (*vramData)[0x400];

            vramData = (u16 (*)[])VRAM;
            vramData[b][r8 + j] = vramData[b][r8 + j] & 0xFFF | r5;
            vramData = (u16 (*)[])(VRAM + 0x40);
            vramData[b][r8 + j] = vramData[b][r8 + j] & 0xFFF | r5;
        }
    }

    for (j = 0; j < 5; j++)
    {
        u16 (*vramData)[0x400];

        vramData = (u16 (*)[])(VRAM + 0x32);
        vramData[b][j] = vramData[b][j] & 0xFFF | 0x4000;
        vramData = (u16 (*)[])(VRAM + 0x72);
        vramData[b][j] = vramData[b][j] & 0xFFF | 0x4000;
    }
}
#else
__attribute__((naked))
void sub_8090644(u8 a, u16 b)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r10, r0\n\
    lsls r1, 16\n\
    lsrs r1, 16\n\
    mov r9, r1\n\
    movs r1, 0\n\
_0809065C:\n\
    lsls r0, r1, 2\n\
    adds r0, r1\n\
    adds r0, 0x1\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r8, r0\n\
    cmp r1, r10\n\
    beq _08090670\n\
    cmp r1, 0\n\
    bne _08090676\n\
_08090670:\n\
    movs r5, 0x80\n\
    lsls r5, 6\n\
    b _0809067A\n\
_08090676:\n\
    movs r5, 0x80\n\
    lsls r5, 7\n\
_0809067A:\n\
    movs r3, 0\n\
    mov r0, r9\n\
    lsls r7, r0, 11\n\
    adds r1, 0x1\n\
    mov r12, r1\n\
    adds r6, r7, 0\n\
    ldr r4, _080906FC @ =0x00000fff\n\
_08090688:\n\
    mov r1, r8\n\
    adds r0, r1, r3\n\
    lsls r0, 1\n\
    adds r0, r6, r0\n\
    movs r2, 0xC0\n\
    lsls r2, 19\n\
    adds r1, r0, r2\n\
    ldrh r2, [r1]\n\
    ands r2, r4\n\
    orrs r2, r5\n\
    strh r2, [r1]\n\
    ldr r1, _08090700 @ =0x06000040\n\
    adds r0, r1\n\
    ldrh r2, [r0]\n\
    ands r2, r4\n\
    orrs r2, r5\n\
    strh r2, [r0]\n\
    adds r0, r3, 0x1\n\
    lsls r0, 24\n\
    lsrs r3, r0, 24\n\
    cmp r3, 0x4\n\
    bls _08090688\n\
    mov r2, r12\n\
    lsls r0, r2, 24\n\
    lsrs r1, r0, 24\n\
    cmp r1, 0x3\n\
    bls _0809065C\n\
    movs r5, 0x80\n\
    lsls r5, 7\n\
    movs r3, 0\n\
    adds r6, r7, 0\n\
    ldr r4, _080906FC @ =0x00000fff\n\
_080906C8:\n\
    lsls r0, r3, 1\n\
    adds r0, r6, r0\n\
    ldr r2, _08090704 @ =0x06000032\n\
    adds r1, r0, r2\n\
    ldrh r2, [r1]\n\
    ands r2, r4\n\
    orrs r2, r5\n\
    strh r2, [r1]\n\
    ldr r1, _08090708 @ =0x06000072\n\
    adds r0, r1\n\
    ldrh r2, [r0]\n\
    ands r2, r4\n\
    orrs r2, r5\n\
    strh r2, [r0]\n\
    adds r0, r3, 0x1\n\
    lsls r0, 24\n\
    lsrs r3, r0, 24\n\
    cmp r3, 0x4\n\
    bls _080906C8\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080906FC: .4byte 0x00000fff\n\
_08090700: .4byte 0x06000040\n\
_08090704: .4byte 0x06000032\n\
_08090708: .4byte 0x06000072\n\
    .syntax divided\n");
}
#endif

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

#ifdef NONMATCHING  // yet again...
void sub_8090750(u8 taskId)
{
    u8 spriteId;
    u16 dexNum = gTasks[taskId].data[1];
    u16 i;

    switch (gTasks[taskId].data[0])
    {
    case 0:
    default:
        if (!gPaletteFade.active)
        {
            gUnknown_03005CEC = gMain.vblankCallback;
            SetVBlankCallback(NULL);
            sub_8091060(0x100);
            gTasks[taskId].data[0] = 1;
        }
        break;
    case 1:
        LZ77UnCompVram(gPokedexMenu_Gfx, (void *)(VRAM + 0x4000));
        LZ77UnCompVram(gUnknown_08E96BD4, (void *)(VRAM + 0x7800));
        for (i = 0; i < 0x280; i++)
            ((u16 *)(VRAM + 0x7800))[i] += 0x2000;
        sub_8091738(gTasks[taskId].data[1], 2, 0x3FC);
        ResetPaletteFade();
        LoadPalette(gPokedexMenu_Pal + 1, 0x21, 0x9E);
        gTasks[taskId].data[0]++;
        break;
    case 2:
        SetUpWindowConfig(&gWindowConfig_81E7064);
        InitMenuWindow(&gWindowConfig_81E7064);
        DmaClear16(3, (void *)(VRAM + 0xC000), 0x200);
        gTasks[taskId].data[0]++;
        break;
    case 3:
        sub_8072BD8(gDexText_RegisterComplete, 2, 0, 0xD0);
        if (!IsNationalPokedexEnabled())
            sub_8091154(NationalToHoennOrder(dexNum), 13, 3);
        else
            sub_8091154(dexNum, 13, 3);
        sub_80911C8(dexNum, 16, 3);
        MenuPrint(gDexText_UnknownPoke, 11, 5);
        MenuPrint(gDexText_UnknownHeight, 16, 7);
        MenuPrint(gDexText_UnknownWeight, 16, 9);
        sub_8091304(gPokedexEntries[dexNum].categoryName, 11, 5);
        sub_8091458(gPokedexEntries[dexNum].height, 16, 7);
        sub_8091564(gPokedexEntries[dexNum].weight, 16, 9);
        MenuPrint(gPokedexEntries[dexNum].descriptionPage1, 2, 13);
        sub_80917CC(14, 0x3FC);
        gTasks[taskId].data[0]++;
        break;
    case 4:
        spriteId = sub_80918EC(dexNum, 0x30, 0x38, 0);
        gSprites[spriteId].oam.priority = 0;
        BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
        SetVBlankCallback(gUnknown_03005CEC);
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
            PlayCry1(NationalPokedexNumToSpecies(dexNum), 0);
            gTasks[taskId].data[2] = 0;
            gTasks[taskId].data[4] = 0;
            gTasks[taskId].func = sub_8090A3C;
        }
        break;
    }
}
#else
__attribute__((naked))
void sub_8090750(u8 taskId)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    sub sp, 0x8\n\
    lsls r0, 24\n\
    lsrs r7, r0, 24\n\
    ldr r1, _08090778 @ =gTasks\n\
    lsls r0, r7, 2\n\
    adds r0, r7\n\
    lsls r0, 3\n\
    adds r0, r1\n\
    ldrh r6, [r0, 0xA]\n\
    movs r2, 0x8\n\
    ldrsh r0, [r0, r2]\n\
    adds r4, r1, 0\n\
    cmp r0, 0x6\n\
    bhi _0809079C\n\
    lsls r0, 2\n\
    ldr r1, _0809077C @ =_08090780\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_08090778: .4byte gTasks\n\
_0809077C: .4byte _08090780\n\
    .align 2, 0\n\
_08090780:\n\
    .4byte _0809079C\n\
    .4byte _080907E0\n\
    .4byte _0809085C\n\
    .4byte _080908A0\n\
    .4byte _08090960\n\
    .4byte _080909B8\n\
    .4byte _080909F4\n\
_0809079C:\n\
    ldr r0, _080907D0 @ =gPaletteFade\n\
    ldrb r1, [r0, 0x7]\n\
    movs r0, 0x80\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080907AA\n\
    b _08090A26\n\
_080907AA:\n\
    ldr r1, _080907D4 @ =gUnknown_03005CEC\n\
    ldr r0, _080907D8 @ =gMain\n\
    ldr r0, [r0, 0xC]\n\
    str r0, [r1]\n\
    movs r0, 0\n\
    bl SetVBlankCallback\n\
    movs r0, 0x80\n\
    lsls r0, 1\n\
    bl sub_8091060\n\
    ldr r1, _080907DC @ =gTasks\n\
    lsls r0, r7, 2\n\
    adds r0, r7\n\
    lsls r0, 3\n\
    adds r0, r1\n\
    movs r1, 0x1\n\
    strh r1, [r0, 0x8]\n\
    b _08090A26\n\
    .align 2, 0\n\
_080907D0: .4byte gPaletteFade\n\
_080907D4: .4byte gUnknown_03005CEC\n\
_080907D8: .4byte gMain\n\
_080907DC: .4byte gTasks\n\
_080907E0:\n\
    ldr r0, _08090840 @ =gPokedexMenu_Gfx\n\
    ldr r1, _08090844 @ =0x06004000\n\
    bl LZ77UnCompVram\n\
    ldr r0, _08090848 @ =gUnknown_08E96BD4\n\
    ldr r4, _0809084C @ =0x06007800\n\
    adds r1, r4, 0\n\
    bl LZ77UnCompVram\n\
    movs r2, 0\n\
    lsls r5, r7, 2\n\
    mov r12, r5\n\
    movs r0, 0x80\n\
    lsls r0, 6\n\
    adds r6, r0, 0\n\
    ldr r3, _08090850 @ =0x0000027f\n\
_08090800:\n\
    lsls r0, r2, 1\n\
    adds r0, r4\n\
    ldrh r5, [r0]\n\
    adds r1, r6, r5\n\
    strh r1, [r0]\n\
    adds r0, r2, 0x1\n\
    lsls r0, 16\n\
    lsrs r2, r0, 16\n\
    cmp r2, r3\n\
    bls _08090800\n\
    ldr r0, _08090854 @ =gTasks\n\
    mov r1, r12\n\
    adds r4, r1, r7\n\
    lsls r4, 3\n\
    adds r4, r0\n\
    ldrh r0, [r4, 0xA]\n\
    movs r2, 0xFF\n\
    lsls r2, 2\n\
    movs r1, 0x2\n\
    bl sub_8091738\n\
    bl ResetPaletteFade\n\
    ldr r0, _08090858 @ =gPokedexMenu_Pal + 0x2\n\
    movs r1, 0x21\n\
    movs r2, 0x9E\n\
    bl LoadPalette\n\
    ldrh r0, [r4, 0x8]\n\
    adds r0, 0x1\n\
    strh r0, [r4, 0x8]\n\
    b _08090A26\n\
    .align 2, 0\n\
_08090840: .4byte gPokedexMenu_Gfx\n\
_08090844: .4byte 0x06004000\n\
_08090848: .4byte gUnknown_08E96BD4\n\
_0809084C: .4byte 0x06007800\n\
_08090850: .4byte 0x0000027f\n\
_08090854: .4byte gTasks\n\
_08090858: .4byte gPokedexMenu_Pal + 0x2\n\
_0809085C:\n\
    ldr r4, _0809088C @ =gWindowConfig_81E7064\n\
    adds r0, r4, 0\n\
    bl SetUpWindowConfig\n\
    adds r0, r4, 0\n\
    bl InitMenuWindow\n\
    ldr r2, _08090890 @ =0x0600c000\n\
    add r1, sp, 0x4\n\
    movs r0, 0\n\
    strh r0, [r1]\n\
    ldr r0, _08090894 @ =0x040000d4\n\
    str r1, [r0]\n\
    str r2, [r0, 0x4]\n\
    ldr r1, _08090898 @ =0x81000100\n\
    str r1, [r0, 0x8]\n\
    ldr r0, [r0, 0x8]\n\
    ldr r1, _0809089C @ =gTasks\n\
    lsls r0, r7, 2\n\
    adds r0, r7\n\
    lsls r0, 3\n\
    adds r0, r1\n\
    b _080909E0\n\
    .align 2, 0\n\
_0809088C: .4byte gWindowConfig_81E7064\n\
_08090890: .4byte 0x0600c000\n\
_08090894: .4byte 0x040000d4\n\
_08090898: .4byte 0x81000100\n\
_0809089C: .4byte gTasks\n\
_080908A0:\n\
    ldr r0, _080908C8 @ =gDexText_RegisterComplete\n\
    movs r1, 0x2\n\
    movs r2, 0\n\
    movs r3, 0xD0\n\
    bl sub_8072BD8\n\
    bl IsNationalPokedexEnabled\n\
    cmp r0, 0\n\
    bne _080908CC\n\
    adds r0, r6, 0\n\
    bl NationalToHoennOrder\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    movs r1, 0xD\n\
    movs r2, 0x3\n\
    bl sub_8091154\n\
    b _080908D6\n\
    .align 2, 0\n\
_080908C8: .4byte gDexText_RegisterComplete\n\
_080908CC:\n\
    adds r0, r6, 0\n\
    movs r1, 0xD\n\
    movs r2, 0x3\n\
    bl sub_8091154\n\
_080908D6:\n\
    adds r0, r6, 0\n\
    movs r1, 0x10\n\
    movs r2, 0x3\n\
    bl sub_80911C8\n\
    ldr r0, _0809094C @ =gDexText_UnknownPoke\n\
    movs r1, 0xB\n\
    movs r2, 0x5\n\
    bl MenuPrint\n\
    ldr r0, _08090950 @ =gDexText_UnknownHeight\n\
    movs r1, 0x10\n\
    movs r2, 0x7\n\
    bl MenuPrint\n\
    ldr r0, _08090954 @ =gDexText_UnknownWeight\n\
    movs r1, 0x10\n\
    movs r2, 0x9\n\
    bl MenuPrint\n\
    lsls r4, r6, 3\n\
    adds r4, r6\n\
    lsls r4, 2\n\
    ldr r6, _08090958 @ =gPokedexEntries\n\
    adds r5, r4, r6\n\
    adds r0, r5, 0\n\
    movs r1, 0xB\n\
    movs r2, 0x5\n\
    bl sub_8091304\n\
    ldrh r0, [r5, 0xC]\n\
    movs r1, 0x10\n\
    movs r2, 0x7\n\
    bl sub_8091458\n\
    ldrh r0, [r5, 0xE]\n\
    movs r1, 0x10\n\
    movs r2, 0x9\n\
    bl sub_8091564\n\
    adds r6, 0x10\n\
    adds r4, r6\n\
    ldr r0, [r4]\n\
    movs r1, 0x2\n\
    movs r2, 0xD\n\
    bl MenuPrint\n\
    movs r1, 0xFF\n\
    lsls r1, 2\n\
    movs r0, 0xE\n\
    bl sub_80917CC\n\
    ldr r1, _0809095C @ =gTasks\n\
    lsls r0, r7, 2\n\
    adds r0, r7\n\
    lsls r0, 3\n\
    adds r0, r1\n\
    b _080909E0\n\
    .align 2, 0\n\
_0809094C: .4byte gDexText_UnknownPoke\n\
_08090950: .4byte gDexText_UnknownHeight\n\
_08090954: .4byte gDexText_UnknownWeight\n\
_08090958: .4byte gPokedexEntries\n\
_0809095C: .4byte gTasks\n\
_08090960:\n\
    adds r0, r6, 0\n\
    movs r1, 0x30\n\
    movs r2, 0x38\n\
    movs r3, 0\n\
    bl sub_80918EC\n\
    adds r4, r0, 0\n\
    lsls r4, 24\n\
    lsrs r4, 24\n\
    ldr r0, _080909AC @ =gSprites\n\
    lsls r1, r4, 4\n\
    adds r1, r4\n\
    lsls r1, 2\n\
    adds r1, r0\n\
    ldrb r2, [r1, 0x5]\n\
    movs r0, 0xD\n\
    negs r0, r0\n\
    ands r0, r2\n\
    strb r0, [r1, 0x5]\n\
    movs r0, 0x1\n\
    negs r0, r0\n\
    movs r1, 0\n\
    str r1, [sp]\n\
    movs r2, 0x10\n\
    movs r3, 0\n\
    bl BeginNormalPaletteFade\n\
    ldr r0, _080909B0 @ =gUnknown_03005CEC\n\
    ldr r0, [r0]\n\
    bl SetVBlankCallback\n\
    ldr r1, _080909B4 @ =gTasks\n\
    lsls r0, r7, 2\n\
    adds r0, r7\n\
    lsls r0, 3\n\
    adds r0, r1\n\
    strh r4, [r0, 0xE]\n\
    b _080909E0\n\
    .align 2, 0\n\
_080909AC: .4byte gSprites\n\
_080909B0: .4byte gUnknown_03005CEC\n\
_080909B4: .4byte gTasks\n\
_080909B8:\n\
    ldr r0, _080909E8 @ =REG_BLDCNT\n\
    movs r1, 0\n\
    strh r1, [r0]\n\
    adds r0, 0x2\n\
    strh r1, [r0]\n\
    adds r0, 0x2\n\
    strh r1, [r0]\n\
    ldr r1, _080909EC @ =REG_BG3CNT\n\
    ldr r2, _080909F0 @ =0x00000f07\n\
    adds r0, r2, 0\n\
    strh r0, [r1]\n\
    subs r1, 0xE\n\
    movs r5, 0xE2\n\
    lsls r5, 5\n\
    adds r0, r5, 0\n\
    strh r0, [r1]\n\
    lsls r0, r7, 2\n\
    adds r0, r7\n\
    lsls r0, 3\n\
    adds r0, r4\n\
_080909E0:\n\
    ldrh r1, [r0, 0x8]\n\
    adds r1, 0x1\n\
    strh r1, [r0, 0x8]\n\
    b _08090A26\n\
    .align 2, 0\n\
_080909E8: .4byte 0x04000050\n\
_080909EC: .4byte 0x0400000E\n\
_080909F0: .4byte 0x00000f07\n\
_080909F4:\n\
    ldr r0, _08090A30 @ =gPaletteFade\n\
    ldrb r1, [r0, 0x7]\n\
    movs r0, 0x80\n\
    ands r0, r1\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    cmp r5, 0\n\
    bne _08090A26\n\
    adds r0, r6, 0\n\
    bl NationalPokedexNumToSpecies\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    movs r1, 0\n\
    bl PlayCry1\n\
    ldr r1, _08090A34 @ =gTasks\n\
    lsls r0, r7, 2\n\
    adds r0, r7\n\
    lsls r0, 3\n\
    adds r0, r1\n\
    strh r5, [r0, 0xC]\n\
    strh r5, [r0, 0x10]\n\
    ldr r1, _08090A38 @ =sub_8090A3C\n\
    str r1, [r0]\n\
_08090A26:\n\
    add sp, 0x8\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08090A30: .4byte gPaletteFade\n\
_08090A34: .4byte gTasks\n\
_08090A38: .4byte sub_8090A3C\n\
    .syntax divided\n");
}
#endif

void sub_8090A3C(u8 taskId)
{
    if (gMain.newKeys & B_BUTTON)
    {
        BeginNormalPaletteFade(0x0000FFFC, 0, 0, 16, 0);
        gSprites[gTasks[taskId].data[3]].callback = sub_8090C28;
        gTasks[taskId].func = sub_8090B8C;
        return;
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        if (gTasks[taskId].data[4] == 0)
        {
            u16 r4 = gTasks[taskId].data[1];

            MenuZeroFillWindowRect(2, 13, 27, 19);
            MenuPrint(gPokedexEntries[r4].descriptionPage2, 2, 13);
            (*(u16 *)(VRAM + 0x7ACA))++;
            (*(u16 *)(VRAM + 0x7B0A))++;
            gTasks[taskId].data[4] = 1;
            PlaySE(SE_PIN);
        }
        else
        {
            BeginNormalPaletteFade(0x0000FFFC, 0, 0, 16, 0);
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

void sub_8090B8C(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        u16 species;
        u32 otId;
        u32 personality;
        u8 paletteNum;
        const u16 *palette;

        REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG3_ON | DISPCNT_OBJ_ON;
        CpuCopy16(gUnknown_08D00524, (void *)(VRAM + 0xC000), 0x1000);
        sub_800D74C();
        species = NationalPokedexNumToSpecies(gTasks[taskId].data[1]);
        otId = ((u16)gTasks[taskId].data[13] << 16) | (u16)gTasks[taskId].data[12];
        personality = ((u16)gTasks[taskId].data[15] << 16) | (u16)gTasks[taskId].data[14];
        paletteNum = gSprites[gTasks[taskId].data[3]].oam.paletteNum;
        palette = species_and_otid_get_pal(species, otId, personality);
        LoadCompressedPalette(palette, 0x100 | paletteNum * 16, 32);
        DestroyTask(taskId);
    }
}

void sub_8090C28(struct Sprite *sprite)
{
    if (sprite->pos1.x < 0x78)
        sprite->pos1.x += 2;
    if (sprite->pos1.x > 0x78)
        sprite->pos1.x -= 2;

    if (sprite->pos1.y < 0x50)
        sprite->pos1.y += 1;
    if (sprite->pos1.y > 0x50)
        sprite->pos1.y -= 1;
}

void sub_8090C68(void)
{
    if (gUnknown_0202FFBC->owned)
    {
        if (gPokedexView->unk64E == 0)
        {
            MenuZeroFillWindowRect(2, 13, 27, 19);
            MenuPrint(gPokedexEntries[gUnknown_0202FFBC->dexNum].descriptionPage2, 2, 13);
            gPokedexView->unk64E = 1;
            (*(u16 *)(VRAM + 0x7ACA))++;
            (*(u16 *)(VRAM + 0x7B0A))++;
            PlaySE(SE_PIN);
        }
        else
        {
            MenuZeroFillWindowRect(2, 13, 27, 19);
            MenuPrint(gPokedexEntries[gUnknown_0202FFBC->dexNum].descriptionPage1, 2, 13);
            gPokedexView->unk64E = 0;
            (*(u16 *)(VRAM + 0x7ACA))--;
            (*(u16 *)(VRAM + 0x7B0A))--;
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

s8 sub_8090D90(u16 a, u8 b)
{
    u8 index;
    u8 bit;
    u8 mask;
    s8 retVal;

    a--;
    index = a / 8;
    bit = a % 8;
    mask = 1 << bit;
    retVal = 0;
    switch (b)
    {
    case 0:
        if (gSaveBlock2.pokedex.seen[index] & mask)
        {
            if ((gSaveBlock2.pokedex.seen[index] & mask) == (gSaveBlock1.unk938[index] & mask)
             && (gSaveBlock2.pokedex.seen[index] & mask) == (gSaveBlock1.unk3A8C[index] & mask))
                retVal = 1;
            else
            {
                gSaveBlock2.pokedex.seen[index] &= ~mask;
                gSaveBlock1.unk938[index] &= ~mask;
                gSaveBlock1.unk3A8C[index] &= ~mask;
                retVal = 0;
            }
        }
        break;
    case 1:
        if (gSaveBlock2.pokedex.owned[index] & mask)
        {
            if ((gSaveBlock2.pokedex.owned[index] & mask) == (gSaveBlock2.pokedex.seen[index] & mask)
             && (gSaveBlock2.pokedex.owned[index] & mask) == (gSaveBlock1.unk938[index] & mask)
             && (gSaveBlock2.pokedex.owned[index] & mask) == (gSaveBlock1.unk3A8C[index] & mask))
                retVal = 1;
            else
            {
                gSaveBlock2.pokedex.owned[index] &= ~mask;
                gSaveBlock2.pokedex.seen[index] &= ~mask;
                gSaveBlock1.unk938[index] &= ~mask;
                gSaveBlock1.unk3A8C[index] &= ~mask;
                retVal = 0;
            }
        }
        break;
    case 2:
        gSaveBlock2.pokedex.seen[index] |= mask;
        gSaveBlock1.unk938[index] |= mask;
        gSaveBlock1.unk3A8C[index] |= mask;
        break;
    case 3:
        gSaveBlock2.pokedex.owned[index] |= mask;
        break;
    }
    return retVal;
}

u16 GetNationalPokedexCount(u8 a)
{
    u16 count = 0;
    u16 i;

    for (i = 0; i < 386; i++)
    {
        switch (a)
        {
        case 0:
            if (sub_8090D90(i + 1, 0) != 0)
                count++;
            break;
        case 1:
            if (sub_8090D90(i + 1, 1) != 0)
                count++;
            break;
        }
    }
    return count;
}

u16 GetHoennPokedexCount(u8 a)
{
    u16 count = 0;
    u16 i;

    for (i = 0; i < 202; i++)
    {
        switch (a)
        {
        case 0:
            if (sub_8090D90(HoennToNationalOrder(i + 1), 0) != 0)
                count++;
            break;
        case 1:
            if (sub_8090D90(HoennToNationalOrder(i + 1), 1) != 0)
                count++;
            break;
        }
    }
    return count;
}

bool8 sub_8090FC0(void)
{
    u16 i;

    for (i = 0; i < 200; i++)
    {
        if (sub_8090D90(HoennToNationalOrder(i + 1), 1) == 0)
            return FALSE;
    }
    return TRUE;
}

u16 sub_8090FF4(void)
{
    u16 i;

    for (i = 0; i < 150; i++)
    {
        if (sub_8090D90(i + 1, 1) == 0)
            return 0;
    }
    for (i = 152; i < 250; i++)
    {
        if (sub_8090D90(i + 1, 1) == 0)
            return 0;
    }
    for (i = 252; i < 384; i++)
    {
        if (sub_8090D90(i + 1, 1) == 0)
            return 0;
    }
    return 1;
}

void sub_8091060(u16 a)
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

void sub_8091154(u16 order, u8 b, u8 c)
{
    u8 str[4];

    str[0] = 0xA1 + order / 100;
    str[1] = 0xA1 + (order % 100) / 10;
    str[2] = 0xA1 + (order % 100) % 10;
    str[3] = EOS;
    MenuPrint(str, b, c);
}

u8 sub_80911C8(u16 num, u8 b, u8 c)
{
    u8 str[11];
    u8 i;

    for (i = 0; i < 11; i++)
        str[i] = EOS;
    num = NationalPokedexNumToSpecies(num);
    switch (num)
    {
    default:
        for (i = 0; gSpeciesNames[num][i] != EOS && i < 10; i++)
            str[i] = gSpeciesNames[num][i];
        break;
    case 0:
        for (i = 0; i < 10; i++)
            str[i] = 0xAE;
        break;
    }
    MenuPrint(str, b, c);
    return i;
}

u8 sub_8091260(u16 num, u8 b, u8 c, u8 d)
{
    u8 str[40];  // Not exactly sure how long this needs to be
    u8 *end;
    u8 i;

    end = StringCopy(str, gUnknown_083B5558);
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
    MenuPrint(str, b, c);
    return i;
}

void sub_8091304(const u8 *name, u8 left, u8 top)
{
    u8 str[32];  // Not exactly sure how long this needs to be
    u8 i;
#if ENGLISH
    u8 j;
#endif

    for (i = 0; name[i] != EOS && i < 11; i++)
        str[i] = name[i];
#if ENGLISH
    for (j = 0; gDexText_UnknownPoke[j] == 0xAC || gDexText_UnknownPoke[j] == 0; j++)
        ;
    j--;
    while (gDexText_UnknownPoke[j] != EOS)
        str[i++] = gDexText_UnknownPoke[j++];
#endif
    str[i] = EOS;
    sub_8072B80(str, left, top, gDexText_UnknownPoke);
}

void unref_sub_80913A4(u16 a, u8 left, u8 top)
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
    MenuPrint(str, left, top);
}

#ifdef UNITS_IMPERIAL
#define CHAR_PRIME (0xB4)
#define CHAR_DOUBLE_PRIME (0xB2)
void sub_8091458(u16 height, u8 left, u8 top)
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
    MenuPrint(buffer, left, top);
}
#else
void sub_8091458(u16 height, u8 left, u8 top)
{
    unref_sub_80913A4(height, left, top);
}
#endif

#ifdef UNITS_IMPERIAL
#define CHAR_b (0xD6)
#define CHAR_l (0xE0)
#define CHAR_s (0xE7)
void sub_8091564(u16 weight, u8 left, u8 top)
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
    MenuPrint(buffer, left, top);
}
#else
void sub_8091564(u16 arg0, u8 left, u8 top)
{
    unref_sub_80913A4(arg0, left, top);
}
#endif

void sub_8091738(u16 a, u16 b, u16 c)
{
    u8 arr[0x80];
    u16 i;
    u16 j;
    const u8 *r12;
    u16 r7;
    u8 r3;

    r12 = gMonFootprintTable[NationalPokedexNumToSpecies(a)];
    for (r7 = 0, i = 0; i < 32; i++)
    {
        r3 = r12[i];
        for (j = 0; j < 4; j++)
        {
            u32 r1 = j * 2;
            s32 r2 = (r3 >> r1) & 1;

            if (r3 & (2 << r1))
                r2 |= 0x10;

// Needed to match
#ifndef NONMATCHING
            asm("");asm("");asm("");asm("");asm("");
#endif

            arr[r7] = r2;
            r7++;
        }
    }
    CpuCopy16(arr, (u16 *)(VRAM + b * 0x4000 + c * 0x20), 0x80);
}

void sub_80917CC(u16 a, u16 b)
{
    *(u16 *)(VRAM + a * 0x800 + 0x232) = 0xF000 + b + 0;
    *(u16 *)(VRAM + a * 0x800 + 0x234) = 0xF000 + b + 1;
    *(u16 *)(VRAM + a * 0x800 + 0x272) = 0xF000 + b + 2;
    *(u16 *)(VRAM + a * 0x800 + 0x274) = 0xF000 + b + 3;
}

u16 sub_8091818(u8 a, u16 b, u16 c, u16 d)
{
    switch (a)
    {
    case 1:
        if (b > c)
            b--;
        break;
    case 0:
        if (b < d)
            b++;
        break;
    case 3:
        if (b > c)
            b--;
        else
            b = d;
        break;
    case 2:
        if (b < d)
            b++;
        else
            b = c;
        break;
    }
    return b;
}

void nullsub_59(void)
{
}

void sub_8091878(u16 a, u8 b)
{
    gUnknown_02024E8C = gUnknown_083B57A4;
    gUnknown_02024E8C.paletteTag = a;
    gUnknown_02024E8C.images = gUnknown_083B5794[b];
    gUnknown_02024E8C.anims = gSpriteAnimTable_81E7C64;
}

void sub_80918B0(u16 a, u8 b)
{
    gUnknown_02024E8C = gUnknown_083B57A4;
    gUnknown_02024E8C.paletteTag = a;
    gUnknown_02024E8C.images = gUnknown_083B5794[b];
    gUnknown_02024E8C.anims = gUnknown_081EC2A4[0];
}

u16 sub_80918EC(u16 num, s16 b, s16 c, u16 d)
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
          (void *)0x02000000,
          gUnknown_083B5584[d],
          num);
        break;
    case 0x134:
        LoadSpecialPokePic(
          &gMonFrontPicTable[num],
          gMonFrontPicCoords[num].coords,
          gMonFrontPicCoords[num].y_offset,
          0x02000000,
          gUnknown_083B5584[d],
          num,
          gSaveBlock2.pokedex.spindaPersonality,
          1);
        break;
    case SPECIES_UNOWN:
        LoadSpecialPokePic(
          &gMonFrontPicTable[num],
          gMonFrontPicCoords[num].coords,
          gMonFrontPicCoords[num].y_offset,
          0x02000000,
          gUnknown_083B5584[d],
          num,
          gSaveBlock2.pokedex.unownPersonality,
          1);
        break;
    }
    LoadCompressedPalette(gMonPaletteTable[num].data, 0x100 + d * 16, 32);
    sub_8091878(d, d);
    spriteId = CreateSprite(&gUnknown_02024E8C, b, c, 0);
    gSprites[spriteId].oam.paletteNum = d;
    return spriteId;
}

u8 sub_8091A4C(u16 gender, u16 b, u16 c, u16 d)
{
    u8 spriteId;

    DecompressPicFromTable_2(
      &gTrainerFrontPicTable[gender],
      gTrainerFrontPicCoords[gender].coords,
      gTrainerFrontPicCoords[gender].y_offset,
      (void *)0x02000000,
      gUnknown_083B5584[0],
      gender);
    sub_80918B0(gender, 0);
    spriteId = CreateSprite(&gUnknown_02024E8C, b, c, 0);
    gSprites[spriteId].oam.paletteNum = d;
    return spriteId;
}

int sub_8091AF8(u8 a, u8 b, u8 abcGroup, u8 bodyColor, u8 type1, u8 type2)
{
    u16 species;
    u16 i;
    u16 resultsCount;
    u8 types[2];

    SortPokedex(a, b);

    for (i = 0, resultsCount = 0; i < 386; i++)
    {
        if (gPokedexView->unk0[i].seen)
        {
            gPokedexView->unk0[resultsCount] = gPokedexView->unk0[i];
            resultsCount++;
        }
    }
    gPokedexView->unk60C = resultsCount;

    // Search by name
    if (abcGroup != 0xFF)
    {
        for (i = 0, resultsCount = 0; i < gPokedexView->unk60C; i++)
        {
            u8 r3;

            species = NationalPokedexNumToSpecies(gPokedexView->unk0[i].dexNum);
            r3 = gSpeciesNames[species][0];
            if ((r3 >= gUnknown_083B57BC[abcGroup][0] && r3 < gUnknown_083B57BC[abcGroup][0] + gUnknown_083B57BC[abcGroup][1])
             || (r3 >= gUnknown_083B57BC[abcGroup][2] && r3 < gUnknown_083B57BC[abcGroup][2] + gUnknown_083B57BC[abcGroup][3]))
            {
                gPokedexView->unk0[resultsCount] = gPokedexView->unk0[i];
                resultsCount++;
            }
        }
        gPokedexView->unk60C = resultsCount;
    }

    // Search by body color
    if (bodyColor != 0xFF)
    {
        for (i = 0, resultsCount = 0; i < gPokedexView->unk60C; i++)
        {
            species = NationalPokedexNumToSpecies(gPokedexView->unk0[i].dexNum);

            if (bodyColor == gBaseStats[species].bodyColor)
            {
                gPokedexView->unk0[resultsCount] = gPokedexView->unk0[i];
                resultsCount++;
            }
        }
        gPokedexView->unk60C = resultsCount;
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
            for (i = 0, resultsCount = 0; i < gPokedexView->unk60C; i++)
            {
                if (gPokedexView->unk0[i].owned)
                {
                    species = NationalPokedexNumToSpecies(gPokedexView->unk0[i].dexNum);

                    types[0] = gBaseStats[species].type1;
                    types[1] = gBaseStats[species].type2;
                    if (types[0] == type1 || types[1] == type1)
                    {
                        gPokedexView->unk0[resultsCount] = gPokedexView->unk0[i];
                        resultsCount++;
                    }
                }
            }
        }
        else
        {
            for (i = 0, resultsCount = 0; i < gPokedexView->unk60C; i++)
            {
                if (gPokedexView->unk0[i].owned)
                {
                    species = NationalPokedexNumToSpecies(gPokedexView->unk0[i].dexNum);

                    types[0] = gBaseStats[species].type1;
                    types[1] = gBaseStats[species].type2;
                    if ((types[0] == type1 && types[1] == type2) || (types[0] == type2 && types[1] == type1))
                    {
                        gPokedexView->unk0[resultsCount] = gPokedexView->unk0[i];
                        resultsCount++;
                    }
                }
            }
        }
        gPokedexView->unk60C = resultsCount;
    }

    if (gPokedexView->unk60C != 0)
    {
        for (i = gPokedexView->unk60C; i < 386; i++)
        {
            gPokedexView->unk0[i].dexNum = 0xFFFF;
            gPokedexView->unk0[i].seen = FALSE;
            gPokedexView->unk0[i].owned = FALSE;

        }
    }

    return resultsCount;
}

void sub_8091E20(const u8 *str)
{
    sub_8072AB0(str, 9, 120, 208, 32, 1);
}

u8 sub_8091E3C(void)
{
    return CreateTask(sub_8091E54, 0);
}

void sub_8091E54(u8 taskId)
{
    u16 i;

    switch (gMain.state)
    {
    default:
    case 0:
        if (!gPaletteFade.active)
        {
            gPokedexView->unk64A = 2;
            sub_8091060(0);
            LZ77UnCompVram(gPokedexMenuSearch_Gfx, (void *)VRAM);
            LZ77UnCompVram(gUnknown_08E96D2C, (void *)(VRAM + 0x7800));
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
        SetUpWindowConfig(&gWindowConfig_81E7064);
        InitMenuWindow(&gWindowConfig_81E7064);
        LoadCompressedObjectPic(&gUnknown_083A05CC);
        LoadSpritePalettes(gUnknown_083A05DC);
        sub_809308C(taskId);
        for (i = 0; i < 16; i++)
            gTasks[taskId].data[i] = 0;
        sub_8092EB0(taskId);
        sub_8092AB0(0);
        sub_8092B68(taskId);
        gMain.state++;
        break;
    case 2:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
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
            gTasks[taskId].func = sub_809204C;
            gMain.state = 0;
        }
        break;
    }
}

void sub_809204C(u8 taskId)
{
    sub_8092AB0(gTasks[taskId].data[0]);
    sub_8092B68(taskId);
    gTasks[taskId].func = sub_809207C;
}

void sub_809207C(u8 taskId)
{
    if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_PC_OFF);
        gTasks[taskId].func = sub_80927B8;
        return;
    }
    if (gMain.newKeys & A_BUTTON)
    {
        switch (gTasks[taskId].data[0])
        {
        case 0:
            PlaySE(SE_PIN);
            gTasks[taskId].data[1] = 0;
            gTasks[taskId].func = sub_809217C;
            break;
        case 1:
            PlaySE(SE_PIN);
            gTasks[taskId].data[1] = 4;
            gTasks[taskId].func = sub_809217C;
            break;
        case 2:
            PlaySE(SE_PC_OFF);
            gTasks[taskId].func = sub_80927B8;
            break;
        }
        return;
    }
    if ((gMain.newKeys & DPAD_LEFT) && gTasks[taskId].data[0] > 0)
    {
        PlaySE(SE_Z_PAGE);
        gTasks[taskId].data[0]--;
        sub_8092AB0(gTasks[taskId].data[0]);
    }
    if ((gMain.newKeys & DPAD_RIGHT) && gTasks[taskId].data[0] < 2)
    {
        PlaySE(SE_Z_PAGE);
        gTasks[taskId].data[0]++;
        sub_8092AB0(gTasks[taskId].data[0]);
    }
}

void sub_809217C(u8 taskId)
{
    sub_8092AD4(gTasks[taskId].data[0], gTasks[taskId].data[1]);
    sub_8092B68(taskId);
    gTasks[taskId].func = sub_80921B0;
}

void sub_80921B0(u8 taskId)
{
    const u8 (*r6)[4];

    if (gTasks[taskId].data[0] != 0)
    {
        if (!IsNationalPokedexEnabled())
            r6 = gUnknown_083B58A4;
        else
            r6 = gUnknown_083B586C;
    }
    else
    {
        if (!IsNationalPokedexEnabled())
            r6 = gUnknown_083B5888;
        else
            r6 = gUnknown_083B5850;
    }

    if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_BOWA);
        sub_8092EB0(taskId);
        gTasks[taskId].func = sub_809204C;
        return;
    }
    if (gMain.newKeys & A_BUTTON)
    {
        if (gTasks[taskId].data[1] == 6)
        {
            if (gTasks[taskId].data[0] != 0)
            {
                gUnknown_0202FFBA = 0x40;
                gPokedexView->unk62A = 0x40;
                gUnknown_0202FFB8 = 0;
                gPokedexView->unk610 = 0;
                gSaveBlock2.pokedex.unknown1 = sub_8092E10(taskId, 5);
                if (!IsNationalPokedexEnabled())
                    gSaveBlock2.pokedex.unknown1 = 0;
                gPokedexView->unk614 = gSaveBlock2.pokedex.unknown1;
                gSaveBlock2.pokedex.order = sub_8092E10(taskId, 4);
                gPokedexView->unk618 = gSaveBlock2.pokedex.order;
                PlaySE(SE_PC_OFF);
                gTasks[taskId].func = sub_80927B8;
            }
            else
            {
                sub_8091E20(gDexText_Searching);
                gTasks[taskId].func = sub_80923FC;
                PlaySE(SE_Z_SEARCH);
            }
        }
        else
        {
            PlaySE(SE_PIN);
            gTasks[taskId].func = sub_80925CC;
        }
        return;
    }

    if ((gMain.newKeys & DPAD_LEFT) && r6[gTasks[taskId].data[1]][0] != 0xFF)
    {
        PlaySE(SE_SELECT);
        gTasks[taskId].data[1] = r6[gTasks[taskId].data[1]][0];
        sub_8092AD4(gTasks[taskId].data[0], gTasks[taskId].data[1]);
    }
    if ((gMain.newKeys & DPAD_RIGHT) && r6[gTasks[taskId].data[1]][1] != 0xFF)
    {
        PlaySE(SE_SELECT);
        gTasks[taskId].data[1] = r6[gTasks[taskId].data[1]][1];
        sub_8092AD4(gTasks[taskId].data[0], gTasks[taskId].data[1]);
    }
    if ((gMain.newKeys & DPAD_UP) && r6[gTasks[taskId].data[1]][2] != 0xFF)
    {
        PlaySE(SE_SELECT);
        gTasks[taskId].data[1] = r6[gTasks[taskId].data[1]][2];
        sub_8092AD4(gTasks[taskId].data[0], gTasks[taskId].data[1]);
    }
    if ((gMain.newKeys & DPAD_DOWN) && r6[gTasks[taskId].data[1]][3] != 0xFF)
    {
        PlaySE(SE_SELECT);
        gTasks[taskId].data[1] = r6[gTasks[taskId].data[1]][3];
        sub_8092AD4(gTasks[taskId].data[0], gTasks[taskId].data[1]);
    }
}

void sub_80923FC(u8 taskId)
{
    u8 r10 = sub_8092E10(taskId, 5);
    u8 r9 = sub_8092E10(taskId, 4);
    u8 r8 = sub_8092E10(taskId, 0);
    u8 r6 = sub_8092E10(taskId, 1);
    u8 r4 = sub_8092E10(taskId, 2);
    u8 r0 = sub_8092E10(taskId, 3);

    sub_8091AF8(r10, r9, r8, r6, r4, r0);
    gTasks[taskId].func = sub_80924A4;
}

void sub_80924A4(u8 taskId)
{
    if (!IsSEPlaying())
    {
        if (gPokedexView->unk60C != 0)
        {
            PlaySE(SE_SEIKAI);
            sub_8091E20(gDexText_SearchComplete);
        }
        else
        {
            PlaySE(SE_HAZURE);
            sub_8091E20(gDexText_NoMatching);
        }
        gTasks[taskId].func = sub_8092508;
    }
}

void sub_8092508(u8 taskId)
{
    if (gMain.newKeys & A_BUTTON)
    {
        if (gPokedexView->unk60C != 0)
        {
            gPokedexView->unk64F = 1;
            gPokedexView->unk612 = sub_8092E10(taskId, 5);
            gPokedexView->unk616 = sub_8092E10(taskId, 4);
            gTasks[taskId].func = sub_80927B8;
            PlaySE(SE_PC_OFF);
        }
        else
        {
            gTasks[taskId].func = sub_809217C;
            PlaySE(SE_BOWA);
        }
    }
}

void sub_80925B4(u16 a, int unused)
{
    sub_814AD7C(0x90, (a * 2 + 1) * 8);
}

void sub_80925CC(u8 taskId)
{
    u8 r0;
    u16 *p1;
    u16 *p2;

    sub_8092C8C(0);
    r0 = gTasks[taskId].data[1];
    p1 = &gTasks[taskId].data[gUnknown_083B5A7C[r0].unk4];
    p2 = &gTasks[taskId].data[gUnknown_083B5A7C[r0].unk5];
    gTasks[taskId].data[14] = *p1;
    gTasks[taskId].data[15] = *p2;
    sub_8092D78(taskId);
    CreateBlendedOutlineCursor(16, 0xFFFF, 12, 0x2D9F, 11);
    sub_80925B4(*p1, 1);
    gTasks[taskId].func = sub_8092644;
}

void sub_8092644(u8 taskId)
{
    u8 r1;
    const struct UnknownStruct2 *r8;
    u16 *p1;
    u16 *p2;
    u16 r2;
    bool8 r3;

    r1 = gTasks[taskId].data[1];
    r8 = gUnknown_083B5A7C[r1].unk0;
    p1 = &gTasks[taskId].data[gUnknown_083B5A7C[r1].unk4];
    p2 = &gTasks[taskId].data[gUnknown_083B5A7C[r1].unk5];
    r2 = gUnknown_083B5A7C[r1].unk6 - 1;
    if (gMain.newKeys & A_BUTTON)
    {
        sub_814ADC8();
        PlaySE(SE_PIN);
        MenuZeroFillWindowRect(18, 1, 28, 12);
        sub_8092C8C(1);
        gTasks[taskId].func = sub_809217C;
        return;
    }
    if (gMain.newKeys & B_BUTTON)
    {
        sub_814ADC8();
        PlaySE(SE_BOWA);
        MenuZeroFillWindowRect(18, 1, 28, 12);
        sub_8092C8C(1);
        *p1 = gTasks[taskId].data[14];
        *p2 = gTasks[taskId].data[15];
        gTasks[taskId].func = sub_809217C;
        return;
    }
    r3 = FALSE;
    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        if (*p1 != 0)
        {
            sub_80925B4(*p1, 0);
            (*p1)--;
            sub_80925B4(*p1, 1);
            r3 = TRUE;
        }
        else if (*p2 != 0)
        {
            (*p2)--;
            sub_8092D78(taskId);
            sub_80925B4(*p1, 1);
            r3 = TRUE;
        }
        if (r3)
        {
            PlaySE(SE_SELECT);
            sub_8091E20(r8[*p1 + *p2].text1);
        }
        return;
    }
    if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        if (*p1 < 5 && *p1 < r2)
        {
            sub_80925B4(*p1, 0);
            (*p1)++;
            sub_80925B4(*p1, 1);
            r3 = TRUE;
        }
        else if (r2 > 5 && *p2 < r2 - 5)
        {
            (*p2)++;
            sub_8092D78(taskId);
            sub_80925B4(5, 1);
            r3 = TRUE;
        }
        if (r3)
        {
            PlaySE(SE_SELECT);
            sub_8091E20(r8[*p1 + *p2].text1);
        }
        return;
    }
}

void sub_80927B8(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
    gTasks[taskId].func = sub_80927F0;
}

void sub_80927F0(u8 taskId)
{
    if (!gPaletteFade.active)
        DestroyTask(taskId);
}

#ifdef NONMATCHING
void sub_8092810(u8 a, u8 b, u8 c, u8 d)
{
    u16 i;

    for (i = 0; i < d; i++)
    {
        ((u16 *)VRAM)[15 * 0x400 + c * 32 + i + b] &= 0xFFF;
        ((u16 *)VRAM)[15 * 0x400 + c * 32 + i + b] |= a << 12;

        ((u16 *)VRAM)[15 * 0x400 + (c + 1) * 32 + i + b] &= 0xFFF;
        ((u16 *)VRAM)[15 * 0x400 + (c + 1) * 32 + i + b] |= a << 12;
    }
}
#else
__attribute__((naked))
void sub_8092810(u8 a, u8 b, u8 c, u8 d)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
    mov r12, r1\n\
    lsls r2, 24\n\
    lsrs r1, r2, 24\n\
    lsls r3, 24\n\
    lsrs r5, r3, 8\n\
    movs r3, 0\n\
    cmp r5, 0\n\
    beq _0809285A\n\
    lsls r7, r1, 6\n\
    ldr r6, _08092860 @ =0x00000fff\n\
    lsls r4, r0, 12\n\
_08092830:\n\
    mov r0, r12\n\
    adds r1, r0, r3\n\
    lsls r1, 1\n\
    adds r1, r7, r1\n\
    ldr r0, _08092864 @ =0x06007800\n\
    adds r2, r1, r0\n\
    ldrh r0, [r2]\n\
    ands r0, r6\n\
    orrs r0, r4\n\
    strh r0, [r2]\n\
    ldr r0, _08092868 @ =0x06007840\n\
    adds r1, r0\n\
    ldrh r0, [r1]\n\
    ands r0, r6\n\
    orrs r0, r4\n\
    strh r0, [r1]\n\
    adds r0, r3, 0x1\n\
    lsls r0, 16\n\
    lsrs r3, r0, 16\n\
    cmp r0, r5\n\
    bcc _08092830\n\
_0809285A:\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08092860: .4byte 0x00000fff\n\
_08092864: .4byte 0x06007800\n\
_08092868: .4byte 0x06007840\n\
    .syntax divided\n");
}
#endif

void sub_809286C(u8 a, u8 b, u8 c)
{
    u8 r5 = (b & 1) | ((c & 1) << 1);

    switch (a)
    {
    case 0:
    case 1:
    case 2:
        sub_8092810(r5, gUnknown_083B57E4[a].unk4, gUnknown_083B57E4[a].unk5, gUnknown_083B57E4[a].unk6);
        break;
    case 3:
    case 4:
    case 7:
    case 8:
        sub_8092810(r5, gUnknown_083B57FC[a - 3].unk4, gUnknown_083B57FC[a - 3].unk5, gUnknown_083B57FC[a - 3].unk6);
        // fall through
    case 5:
    case 6:
        sub_8092810(r5, gUnknown_083B57FC[a - 3].unk7, gUnknown_083B57FC[a - 3].unk8, gUnknown_083B57FC[a - 3].unk9);
        break;
    case 10:
        sub_8092810(r5, gUnknown_083B57FC[2].unk4, gUnknown_083B57FC[2].unk5, gUnknown_083B57FC[2].unk6);
        break;
    case 9:
        if (!IsNationalPokedexEnabled())
            sub_8092810(r5, gUnknown_083B57FC[a - 3].unk4, gUnknown_083B57FC[a - 3].unk5 - 2, gUnknown_083B57FC[a - 3].unk6);
        else
            sub_8092810(r5, gUnknown_083B57FC[a - 3].unk4, gUnknown_083B57FC[a - 3].unk5, gUnknown_083B57FC[a - 3].unk6);
        break;
    }
}

void sub_8092964(u8 a)
{
    switch (a)
    {
    case 0:
        sub_809286C(0, 0, 0);
        sub_809286C(1, 1, 0);
        sub_809286C(2, 1, 0);
        sub_809286C(3, 1, 0);
        sub_809286C(4, 1, 0);
        sub_809286C(10, 1, 0);
        sub_809286C(5, 1, 0);
        sub_809286C(6, 1, 0);
        sub_809286C(7, 1, 0);
        sub_809286C(8, 1, 0);
        sub_809286C(9, 1, 0);
        break;
    case 1:
        sub_809286C(0, 1, 0);
        sub_809286C(1, 0, 0);
        sub_809286C(2, 1, 0);
        sub_809286C(3, 1, 1);
        sub_809286C(4, 1, 1);
        sub_809286C(10, 1, 1);
        sub_809286C(5, 1, 1);
        sub_809286C(6, 1, 1);
        sub_809286C(7, 1, 0);
        sub_809286C(8, 1, 0);
        sub_809286C(9, 1, 0);
        break;
    case 2:
        sub_809286C(0, 1, 0);
        sub_809286C(1, 1, 0);
        sub_809286C(2, 0, 0);
        sub_809286C(3, 1, 1);
        sub_809286C(4, 1, 1);
        sub_809286C(10, 1, 1);
        sub_809286C(5, 1, 1);
        sub_809286C(6, 1, 1);
        sub_809286C(7, 1, 1);
        sub_809286C(8, 1, 1);
        sub_809286C(9, 1, 1);
        break;
    }
}

void sub_8092AB0(u8 a)
{
    sub_8092964(a);
    sub_8091E20(gUnknown_083B57E4[a].text);
}

void sub_8092AD4(u8 a, u8 b)
{
    sub_8092964(a);
    switch (b)
    {
    case 0:
        sub_809286C(3, 0, 0);
        break;
    case 1:
        sub_809286C(4, 0, 0);
        break;
    case 2:
        sub_809286C(10, 0, 0);
        sub_809286C(5, 0, 0);
        break;
    case 3:
        sub_809286C(10, 0, 0);
        sub_809286C(6, 0, 0);
        break;
    case 4:
        sub_809286C(7, 0, 0);
        break;
    case 5:
        sub_809286C(8, 0, 0);
        break;
    case 6:
        sub_809286C(9, 0, 0);
        break;
    }
    sub_8091E20(gUnknown_083B57FC[b].text);
}

void sub_8092B68(u8 taskId)
{
    u16 var;

    var = gTasks[taskId].data[6] + gTasks[taskId].data[7];
    StringCopy(gStringVar1, gUnknown_083B5910[var].text2);
    MenuPrint_PixelCoords(gUnknown_083B5AB2, 45, 16, 1);

    var = gTasks[taskId].data[8] + gTasks[taskId].data[9];
    StringCopy(gStringVar1, gUnknown_083B5968[var].text2);
    MenuPrint_PixelCoords(gUnknown_083B5AB2, 45, 32, 1);

    var = gTasks[taskId].data[10] + gTasks[taskId].data[11];
    StringCopy(gStringVar1, gUnknown_083B59C8[var].text2);
    MenuPrint_PixelCoords(gUnknown_083B5AAC, 45, 48, 1);

    var = gTasks[taskId].data[12] + gTasks[taskId].data[13];
    StringCopy(gStringVar1, gUnknown_083B59C8[var].text2);
    MenuPrint_PixelCoords(gUnknown_083B5AAC, 93, 48, 1);

    var = gTasks[taskId].data[4] + gTasks[taskId].data[5];
    StringCopy(gStringVar1, gUnknown_083B58D8[var].text2);
    MenuPrint_PixelCoords(gUnknown_083B5AB2, 45, 64, 1);

    if (IsNationalPokedexEnabled())
    {
        var = gTasks[taskId].data[2] + gTasks[taskId].data[3];
        StringCopy(gStringVar1, gUnknown_083B58C0[var].text2);
        MenuPrint_PixelCoords(gUnknown_083B5AB2, 45, 80, 1);
    }
}

void sub_8092C8C(u8 a)
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

void sub_8092D78(u8 taskId)
{
    const struct UnknownStruct2 *r6 = gUnknown_083B5A7C[gTasks[taskId].data[1]].unk0;
    const u16 *r8 = &gTasks[taskId].data[gUnknown_083B5A7C[gTasks[taskId].data[1]].unk4];
    const u16 *r7 = &gTasks[taskId].data[gUnknown_083B5A7C[gTasks[taskId].data[1]].unk5];
    u16 i;
    u16 j;

    MenuZeroFillWindowRect(18, 1, 28, 12);
    for (i = 0, j = *r7; i < 6 && r6[j].text2 != NULL; i++, j++)
    {
#ifndef NONMATCHING
        j += 0;  // Useless statement needed to match
#endif
        MenuPrint(r6[j].text2, 18, i * 2 + 1);
    }
    sub_8091E20(r6[*r8 + *r7].text1);
}

u8 sub_8092E10(u8 taskId, u8 b)
{
    const u16 *ptr1 = &gTasks[taskId].data[gUnknown_083B5A7C[b].unk4];
    const u16 *ptr2 = &gTasks[taskId].data[gUnknown_083B5A7C[b].unk5];
    u16 r2 = *ptr1 + *ptr2;

    switch (b)
    {
    default:
        return 0;
    case 5:
        return gUnknown_083B5A60[r2];
    case 4:
        return gUnknown_083B5A62[r2];
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
        return gUnknown_083B5A68[r2];
    }
}

void sub_8092EB0(u8 taskId)
{
    u16 r3;

    switch (gPokedexView->unk614)
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

    switch (gPokedexView->unk618)
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

bool8 sub_8092F44(u8 taskId)
{
    u8 val1 = gTasks[taskId].data[1];
    const u16 *ptr = &gTasks[taskId].data[gUnknown_083B5A7C[val1].unk5];
    u16 val2 = gUnknown_083B5A7C[val1].unk6 - 1;

    if (val2 > 5 && *ptr != 0)
        return FALSE;
    else
        return TRUE;
}

bool8 sub_8092F8C(u8 taskId)
{
    u8 val1 = gTasks[taskId].data[1];
    const u16 *ptr = &gTasks[taskId].data[gUnknown_083B5A7C[val1].unk5];
    u16 val2 = gUnknown_083B5A7C[val1].unk6 - 1;

    if (val2 > 5 && *ptr < val2 - 5)
        return FALSE;
    else
        return TRUE;
}

void sub_8092FD8(struct Sprite *sprite)
{
    if (gTasks[sprite->data0].func == sub_8092644)
    {
        u8 val;

        if (sprite->data1 != 0)
        {
            if (sub_8092F8C(sprite->data0))
                sprite->invisible = TRUE;
            else
                sprite->invisible = FALSE;
        }
        else
        {
            if (sub_8092F44(sprite->data0))
                sprite->invisible = TRUE;
            else
                sprite->invisible = FALSE;
        }
        val = sprite->data2 + sprite->data1 * 128;
        sprite->pos2.y = gSineTable[val] / 128;
        sprite->data2 += 8;
    }
    else
    {
        sprite->invisible = TRUE;
    }
}

void sub_809308C(u8 taskId)
{
    u8 spriteId;

    spriteId = CreateSprite(&gSpriteTemplate_83A053C, 184, 4, 0);
    gSprites[spriteId].data0 = taskId;
    gSprites[spriteId].data1 = 0;
    gSprites[spriteId].callback = sub_8092FD8;

    spriteId = CreateSprite(&gSpriteTemplate_83A053C, 184, 108, 0);
    gSprites[spriteId].data0 = taskId;
    gSprites[spriteId].data1 = 1;
    gSprites[spriteId].vFlip = TRUE;
    gSprites[spriteId].callback = sub_8092FD8;
}
