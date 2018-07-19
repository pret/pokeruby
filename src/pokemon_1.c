#include "global.h"
#include "data2.h"
#include "constants/abilities.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/species.h"
#include "main.h"
#include "pokemon.h"
#include "random.h"
#include "overworld.h"
#include "sprite.h"
#include "string_util.h"
#include "trainer.h"
#include "text.h"
#include "ewram.h"
#include "util.h"

extern u16 gMoveToLearn;

static EWRAM_DATA u8 sLearningMoveTableID = 0;

u8 gPlayerPartyCount;
struct Pokemon gPlayerParty[6];
u8 gEnemyPartyCount;
struct Pokemon gEnemyParty[6];

const u16 gSpeciesToHoennPokedexNum[] = // Assigns all species to the Hoenn Dex Index
{
	HOENN_DEX_BULBASAUR,        // Bulbasaur
	HOENN_DEX_IVYSAUR,          // Ivysaur
	HOENN_DEX_VENUSAUR,         // Venusaur
	HOENN_DEX_CHARMANDER,       // Charmander
	HOENN_DEX_CHARMELEON,       // Charmeleon
	HOENN_DEX_CHARIZARD,        // Charizard
	HOENN_DEX_SQUIRTLE,         // Squirtle
	HOENN_DEX_WARTORTLE,        // Wartortle
	HOENN_DEX_BLASTOISE,        // Blastoise
	HOENN_DEX_CATERPIE,         // Caterpie
	HOENN_DEX_METAPOD,          // Metapod
	HOENN_DEX_BUTTERFREE,       // Butterfree
	HOENN_DEX_WEEDLE,           // Weedle
	HOENN_DEX_KAKUNA,           // Kakuna
	HOENN_DEX_BEEDRILL,         // Beedrill
	HOENN_DEX_PIDGEY,           // Pidgey
	HOENN_DEX_PIDGEOTTO,        // Pidgeotto
	HOENN_DEX_PIDGEOT,          // Pidgeot
	HOENN_DEX_RATTATA,          // Rattata
	HOENN_DEX_RATICATE,         // Raticate
	HOENN_DEX_SPEAROW,          // Spearow
	HOENN_DEX_FEAROW,           // Fearow
	HOENN_DEX_EKANS,            // Ekans
	HOENN_DEX_ARBOK,            // Arbok
	HOENN_DEX_PIKACHU,          // Pikachu
	HOENN_DEX_RAICHU,           // Raichu
	HOENN_DEX_SANDSHREW,        // Sandshrew
	HOENN_DEX_SANDSLASH,        // Sandslash
	HOENN_DEX_NIDORAN_F,        // Nidoran♀
	HOENN_DEX_NIDORINA,         // Nidorina
	HOENN_DEX_NIDOQUEEN,        // Nidoqueen
	HOENN_DEX_NIDORAN_M,        // Nidoran♂
	HOENN_DEX_NIDORINO,         // Nidorino
	HOENN_DEX_NIDOKING,         // Nidoking
	HOENN_DEX_CLEFAIRY,         // Clefairy
	HOENN_DEX_CLEFABLE,         // Clefable
	HOENN_DEX_VULPIX,           // Vulpix
	HOENN_DEX_NINETALES,        // Ninetales
	HOENN_DEX_JIGGLYPUFF,       // Jigglypuff
	HOENN_DEX_WIGGLYTUFF,       // Wigglytuff
	HOENN_DEX_ZUBAT,            // Zubat
	HOENN_DEX_GOLBAT,           // Golbat
	HOENN_DEX_ODDISH,           // Oddish
	HOENN_DEX_GLOOM,            // Gloom
	HOENN_DEX_VILEPLUME,        // Vileplume
	HOENN_DEX_PARAS,            // Paras
	HOENN_DEX_PARASECT,         // Parasect
	HOENN_DEX_VENONAT,          // Venonat
	HOENN_DEX_VENOMOTH,         // Venomoth
	HOENN_DEX_DIGLETT,          // Diglett
	HOENN_DEX_DUGTRIO,          // Dugtrio
	HOENN_DEX_MEOWTH,           // Meowth
	HOENN_DEX_PERSIAN,          // Persian
	HOENN_DEX_PSYDUCK,          // Psyduck
	HOENN_DEX_GOLDUCK,          // Golduck
	HOENN_DEX_MANKEY,           // Mankey
	HOENN_DEX_PRIMEAPE,         // Primeape
	HOENN_DEX_GROWLITHE,        // Growlithe
	HOENN_DEX_ARCANINE,         // Arcanine
	HOENN_DEX_POLIWAG,          // Poliwag
	HOENN_DEX_POLIWHIRL,        // Poliwhirl
	HOENN_DEX_POLIWRATH,        // Poliwrath
	HOENN_DEX_ABRA,             // Abra
	HOENN_DEX_KADABRA,          // Kadabra
	HOENN_DEX_ALAKAZAM,         // Alakazam
	HOENN_DEX_MACHOP,           // Machop
	HOENN_DEX_MACHOKE,          // Machoke
	HOENN_DEX_MACHAMP,          // Machamp
	HOENN_DEX_BELLSPROUT,       // Bellsprout
	HOENN_DEX_WEEPINBELL,       // Weepinbell
	HOENN_DEX_VICTREEBEL,       // Victreebel
	HOENN_DEX_TENTACOOL,        // Tentacool
	HOENN_DEX_TENTACRUEL,       // Tentacruel
	HOENN_DEX_GEODUDE,          // Geodude
	HOENN_DEX_GRAVELER,         // Graveler
	HOENN_DEX_GOLEM,            // Golem
	HOENN_DEX_PONYTA,           // Ponyta
	HOENN_DEX_RAPIDASH,         // Rapidash
	HOENN_DEX_SLOWPOKE,         // Slowpoke
	HOENN_DEX_SLOWBRO,          // Slowbro
	HOENN_DEX_MAGNEMITE,        // Magnemite
	HOENN_DEX_MAGNETON,         // Magneton
	HOENN_DEX_FARFETCHD,        // Farfetch'd
	HOENN_DEX_DODUO,            // Doduo
	HOENN_DEX_DODRIO,           // Dodrio
	HOENN_DEX_SEEL,             // Seel
	HOENN_DEX_DEWGONG,          // Dewgong
	HOENN_DEX_GRIMER,           // Grimer
	HOENN_DEX_MUK,              // Muk
	HOENN_DEX_SHELLDER,         // Shellder
	HOENN_DEX_CLOYSTER,         // Cloyster
	HOENN_DEX_GASTLY,           // Gastly
	HOENN_DEX_HAUNTER,          // Haunter
	HOENN_DEX_GENGAR,           // Gengar
	HOENN_DEX_ONIX,             // Onix
	HOENN_DEX_DROWZEE,          // Drowzee
	HOENN_DEX_HYPNO,            // Hypno
	HOENN_DEX_KRABBY,           // Krabby
	HOENN_DEX_KINGLER,          // Kingler
	HOENN_DEX_VOLTORB,          // Voltorb
	HOENN_DEX_ELECTRODE,        // Electrode
	HOENN_DEX_EXEGGCUTE,        // Exeggcute
	HOENN_DEX_EXEGGUTOR,        // Exeggutor
	HOENN_DEX_CUBONE,           // Cubone
	HOENN_DEX_MAROWAK,          // Marowak
	HOENN_DEX_HITMONLEE,        // Hitmonlee
	HOENN_DEX_HITMONCHAN,       // Hitmonchan
	HOENN_DEX_LICKITUNG,        // Lickitung
	HOENN_DEX_KOFFING,          // Koffing
	HOENN_DEX_WEEZING,          // Weezing
	HOENN_DEX_RHYHORN,          // Rhyhorn
	HOENN_DEX_RHYDON,           // Rhydon
	HOENN_DEX_CHANSEY,          // Chansey
	HOENN_DEX_TANGELA,          // Tangela
	HOENN_DEX_KANGASKHAN,       // Kangaskhan
	HOENN_DEX_HORSEA,           // Horsea
	HOENN_DEX_SEADRA,           // Seadra
	HOENN_DEX_GOLDEEN,          // Goldeen
	HOENN_DEX_SEAKING,          // Seaking
	HOENN_DEX_STARYU,           // Staryu
	HOENN_DEX_STARMIE,          // Starmie
	HOENN_DEX_MR_MIME,          // Mr. Mime
	HOENN_DEX_SCYTHER,          // Scyther
	HOENN_DEX_JYNX,             // Jynx
	HOENN_DEX_ELECTABUZZ,       // Electabuzz
	HOENN_DEX_MAGMAR,           // Magmar
	HOENN_DEX_PINSIR,           // Pinsir
	HOENN_DEX_TAUROS,           // Tauros
	HOENN_DEX_MAGIKARP,         // Magikarp
	HOENN_DEX_GYARADOS,         // Gyarados
	HOENN_DEX_LAPRAS,           // Lapras
	HOENN_DEX_DITTO,            // Ditto
	HOENN_DEX_EEVEE,            // Eevee
	HOENN_DEX_VAPOREON,         // Vaporeon
	HOENN_DEX_JOLTEON,          // Jolteon
	HOENN_DEX_FLAREON,          // Flareon
	HOENN_DEX_PORYGON,          // Porygon
	HOENN_DEX_OMANYTE,          // Omanyte
	HOENN_DEX_OMASTAR,          // Omastar
	HOENN_DEX_KABUTO,           // Kabuto
	HOENN_DEX_KABUTOPS,         // Kabutops
	HOENN_DEX_AERODACTYL,       // Aerodactyl
	HOENN_DEX_SNORLAX,          // Snorlax
	HOENN_DEX_ARTICUNO,         // Articuno
	HOENN_DEX_ZAPDOS,           // Zapdos
	HOENN_DEX_MOLTRES,          // Moltres
	HOENN_DEX_DRATINI,          // Dratini
	HOENN_DEX_DRAGONAIR,        // Dragonair
	HOENN_DEX_DRAGONITE,        // Dragonite
	HOENN_DEX_MEWTWO,           // Mewtwo
	HOENN_DEX_MEW,              // Mew
	HOENN_DEX_CHIKORITA,        // Chikorita
	HOENN_DEX_BAYLEEF,          // Bayleef
	HOENN_DEX_MEGANIUM,         // Meganium
	HOENN_DEX_CYNDAQUIL,        // Cyndaquil
	HOENN_DEX_QUILAVA,          // Quilava
	HOENN_DEX_TYPHLOSION,       // Typhlosion
	HOENN_DEX_TOTODILE,         // Totodile
	HOENN_DEX_CROCONAW,         // Croconaw
	HOENN_DEX_FERALIGATR,       // Feraligatr
	HOENN_DEX_SENTRET,          // Sentret
	HOENN_DEX_FURRET,           // Furret
	HOENN_DEX_HOOTHOOT,         // Hoothoot
	HOENN_DEX_NOCTOWL,          // Noctowl
	HOENN_DEX_LEDYBA,           // Ledyba
	HOENN_DEX_LEDIAN,           // Ledian
	HOENN_DEX_SPINARAK,         // Spinarak
	HOENN_DEX_ARIADOS,          // Ariados
	HOENN_DEX_CROBAT,           // Crobat
	HOENN_DEX_CHINCHOU,         // Chinchou
	HOENN_DEX_LANTURN,          // Lanturn
	HOENN_DEX_PICHU,            // Pichu
	HOENN_DEX_CLEFFA,           // Cleffa
	HOENN_DEX_IGGLYBUFF,        // Igglybuff
	HOENN_DEX_TOGEPI,           // Togepi
	HOENN_DEX_TOGETIC,          // Togetic
	HOENN_DEX_NATU,             // Natu
	HOENN_DEX_XATU,             // Xatu
	HOENN_DEX_MAREEP,           // Mareep
	HOENN_DEX_FLAAFFY,          // Flaaffy
	HOENN_DEX_AMPHAROS,         // Ampharos
	HOENN_DEX_BELLOSSOM,        // Bellossom
	HOENN_DEX_MARILL,           // Marill
	HOENN_DEX_AZUMARILL,        // Azumarill
	HOENN_DEX_SUDOWOODO,        // Sudowoodo
	HOENN_DEX_POLITOED,         // Politoed
	HOENN_DEX_HOPPIP,           // Hoppip
	HOENN_DEX_SKIPLOOM,         // Skiploom
	HOENN_DEX_JUMPLUFF,         // Jumpluff
	HOENN_DEX_AIPOM,            // Aipom
	HOENN_DEX_SUNKERN,          // Sunkern
	HOENN_DEX_SUNFLORA,         // Sunflora
	HOENN_DEX_YANMA,            // Yanma
	HOENN_DEX_WOOPER,           // Wooper
	HOENN_DEX_QUAGSIRE,         // Quagsire
	HOENN_DEX_ESPEON,           // Espeon
	HOENN_DEX_UMBREON,          // Umbreon
	HOENN_DEX_MURKROW,          // Murkrow
	HOENN_DEX_SLOWKING,         // Slowking
	HOENN_DEX_MISDREAVUS,       // Misdreavus
	HOENN_DEX_UNOWN,            // Unown A
	HOENN_DEX_WOBBUFFET,        // Wobbuffet
	HOENN_DEX_GIRAFARIG,        // Girafarig
	HOENN_DEX_PINECO,           // Pineco
	HOENN_DEX_FORRETRESS,       // Forretress
	HOENN_DEX_DUNSPARCE,        // Dunsparce
	HOENN_DEX_GLIGAR,           // Gligar
	HOENN_DEX_STEELIX,          // Steelix
	HOENN_DEX_SNUBBULL,         // Snubbull
	HOENN_DEX_GRANBULL,         // Granbull
	HOENN_DEX_QWILFISH,         // Qwilfish
	HOENN_DEX_SCIZOR,           // Scizor
	HOENN_DEX_SHUCKLE,          // Shuckle
	HOENN_DEX_HERACROSS,        // Heracross
	HOENN_DEX_SNEASEL,          // Sneasel
	HOENN_DEX_TEDDIURSA,        // Teddiursa
	HOENN_DEX_URSARING,         // Ursaring
	HOENN_DEX_SLUGMA,           // Slugma
	HOENN_DEX_MAGCARGO,         // Magcargo
	HOENN_DEX_SWINUB,           // Swinub
	HOENN_DEX_PILOSWINE,        // Piloswine
	HOENN_DEX_CORSOLA,          // Corsola
	HOENN_DEX_REMORAID,         // Remoraid
	HOENN_DEX_OCTILLERY,        // Octillery
	HOENN_DEX_DELIBIRD,         // Delibird
	HOENN_DEX_MANTINE,          // Mantine
	HOENN_DEX_SKARMORY,         // Skarmory
	HOENN_DEX_HOUNDOUR,         // Houndour
	HOENN_DEX_HOUNDOOM,         // Houndoom
	HOENN_DEX_KINGDRA,          // Kingdra
	HOENN_DEX_PHANPY,           // Phanpy
	HOENN_DEX_DONPHAN,          // Donphan
	HOENN_DEX_PORYGON2,         // Porygon2
	HOENN_DEX_STANTLER,         // Stantler
	HOENN_DEX_SMEARGLE,         // Smeargle
	HOENN_DEX_TYROGUE,          // Tyrogue
	HOENN_DEX_HITMONTOP,        // Hitmontop
	HOENN_DEX_SMOOCHUM,         // Smoochum
	HOENN_DEX_ELEKID,           // Elekid
	HOENN_DEX_MAGBY,            // Magby
	HOENN_DEX_MILTANK,          // Miltank
	HOENN_DEX_BLISSEY,          // Blissey
	HOENN_DEX_RAIKOU,           // Raikou
	HOENN_DEX_ENTEI,            // Entei
	HOENN_DEX_SUICUNE,          // Suicune
	HOENN_DEX_LARVITAR,         // Larvitar
	HOENN_DEX_PUPITAR,          // Pupitar
	HOENN_DEX_TYRANITAR,        // Tyranitar
	HOENN_DEX_LUGIA,            // Lugia
	HOENN_DEX_HO_OH,            // Ho-Oh
	HOENN_DEX_CELEBI,           // Celebi
	HOENN_DEX_OLD_UNOWN_B,      // Unown B (Old)
	HOENN_DEX_OLD_UNOWN_C,      // Unown C (Old)
	HOENN_DEX_OLD_UNOWN_D,      // Unown D (Old)
	HOENN_DEX_OLD_UNOWN_E,      // Unown E (Old)
	HOENN_DEX_OLD_UNOWN_F,      // Unown F (Old)
	HOENN_DEX_OLD_UNOWN_G,      // Unown G (Old)
	HOENN_DEX_OLD_UNOWN_H,      // Unown H (Old)
	HOENN_DEX_OLD_UNOWN_I,      // Unown I (Old)
	HOENN_DEX_OLD_UNOWN_J,      // Unown J (Old)
	HOENN_DEX_OLD_UNOWN_K,      // Unown K (Old)
	HOENN_DEX_OLD_UNOWN_L,      // Unown L (Old)
	HOENN_DEX_OLD_UNOWN_M,      // Unown M (Old)
	HOENN_DEX_OLD_UNOWN_N,      // Unown N (Old)
	HOENN_DEX_OLD_UNOWN_O,      // Unown O (Old)
	HOENN_DEX_OLD_UNOWN_P,      // Unown P (Old)
	HOENN_DEX_OLD_UNOWN_Q,      // Unown Q (Old)
	HOENN_DEX_OLD_UNOWN_R,      // Unown R (Old)
	HOENN_DEX_OLD_UNOWN_S,      // Unown S (Old)
	HOENN_DEX_OLD_UNOWN_T,      // Unown T (Old)
	HOENN_DEX_OLD_UNOWN_U,      // Unown U (Old)
	HOENN_DEX_OLD_UNOWN_V,      // Unown V (Old)
	HOENN_DEX_OLD_UNOWN_W,      // Unown W (Old)
	HOENN_DEX_OLD_UNOWN_X,      // Unown X (Old)
	HOENN_DEX_OLD_UNOWN_Y,      // Unown Y (Old)
	HOENN_DEX_OLD_UNOWN_Z,      // Unown Z (Old)
	HOENN_DEX_TREECKO,          // Treecko
	HOENN_DEX_GROVYLE,          // Grovyle
	HOENN_DEX_SCEPTILE,         // Sceptile
	HOENN_DEX_TORCHIC,          // Torchic
	HOENN_DEX_COMBUSKEN,        // Combusken
	HOENN_DEX_BLAZIKEN,         // Blaziken
	HOENN_DEX_MUDKIP,           // Mudkip
	HOENN_DEX_MARSHTOMP,        // Marshtomp
	HOENN_DEX_SWAMPERT,         // Swampert
	HOENN_DEX_POOCHYENA,        // Poochyena
	HOENN_DEX_MIGHTYENA,        // Mightyena
	HOENN_DEX_ZIGZAGOON,        // Zigzagoon
	HOENN_DEX_LINOONE,          // Linoone
	HOENN_DEX_WURMPLE,          // Wurmple
	HOENN_DEX_SILCOON,          // Silcoon
	HOENN_DEX_BEAUTIFLY,        // Beautifly
	HOENN_DEX_CASCOON,          // Cascoon
	HOENN_DEX_DUSTOX,           // Dustox
	HOENN_DEX_LOTAD,            // Lotad
	HOENN_DEX_LOMBRE,           // Lombre
	HOENN_DEX_LUDICOLO,         // Ludicolo
	HOENN_DEX_SEEDOT,           // Seedot
	HOENN_DEX_NUZLEAF,          // Nuzleaf
	HOENN_DEX_SHIFTRY,          // Shiftry
	HOENN_DEX_NINCADA,          // Nincada
	HOENN_DEX_NINJASK,          // Ninjask
	HOENN_DEX_SHEDINJA,         // Shedinja
	HOENN_DEX_TAILLOW,          // Taillow
	HOENN_DEX_SWELLOW,          // Swellow
	HOENN_DEX_SHROOMISH,        // Shroomish
	HOENN_DEX_BRELOOM,          // Breloom
	HOENN_DEX_SPINDA,           // Spinda
	HOENN_DEX_WINGULL,          // Wingull
	HOENN_DEX_PELIPPER,         // Pelipper
	HOENN_DEX_SURSKIT,          // Surskit
	HOENN_DEX_MASQUERAIN,       // Masquerain
	HOENN_DEX_WAILMER,          // Wailmer
	HOENN_DEX_WAILORD,          // Wailord
	HOENN_DEX_SKITTY,           // Skitty
	HOENN_DEX_DELCATTY,         // Delcatty
	HOENN_DEX_KECLEON,          // Kecleon
	HOENN_DEX_BALTOY,           // Baltoy
	HOENN_DEX_CLAYDOL,          // Claydol
	HOENN_DEX_NOSEPASS,         // Nosepass
	HOENN_DEX_TORKOAL,          // Torkoal
	HOENN_DEX_SABLEYE,          // Sableye
	HOENN_DEX_BARBOACH,         // Barboach
	HOENN_DEX_WHISCASH,         // Whiscash
	HOENN_DEX_LUVDISC,          // Luvdisc
	HOENN_DEX_CORPHISH,         // Corphish
	HOENN_DEX_CRAWDAUNT,        // Crawdaunt
	HOENN_DEX_FEEBAS,           // Feebas
	HOENN_DEX_MILOTIC,          // Milotic
	HOENN_DEX_CARVANHA,         // Carvanha
	HOENN_DEX_SHARPEDO,         // Sharpedo
	HOENN_DEX_TRAPINCH,         // Trapinch
	HOENN_DEX_VIBRAVA,          // Vibrava
	HOENN_DEX_FLYGON,           // Flygon
	HOENN_DEX_MAKUHITA,         // Makuhita
	HOENN_DEX_HARIYAMA,         // Hariyama
	HOENN_DEX_ELECTRIKE,        // Electrike
	HOENN_DEX_MANECTRIC,        // Manectric
	HOENN_DEX_NUMEL,            // Numel
	HOENN_DEX_CAMERUPT,         // Camerupt
	HOENN_DEX_SPHEAL,           // Spheal
	HOENN_DEX_SEALEO,           // Sealeo
	HOENN_DEX_WALREIN,          // Walrein
	HOENN_DEX_CACNEA,           // Cacnea
	HOENN_DEX_CACTURNE,         // Cacturne
	HOENN_DEX_SNORUNT,          // Snorunt
	HOENN_DEX_GLALIE,           // Glalie
	HOENN_DEX_LUNATONE,         // Lunatone
	HOENN_DEX_SOLROCK,          // Solrock
	HOENN_DEX_AZURILL,          // Azurill
	HOENN_DEX_SPOINK,           // Spoink
	HOENN_DEX_GRUMPIG,          // Grumpig
	HOENN_DEX_PLUSLE,           // Plusle
	HOENN_DEX_MINUN,            // Minun
	HOENN_DEX_MAWILE,           // Mawile
	HOENN_DEX_MEDITITE,         // Meditite
	HOENN_DEX_MEDICHAM,         // Medicham
	HOENN_DEX_SWABLU,           // Swablu
	HOENN_DEX_ALTARIA,          // Altaria
	HOENN_DEX_WYNAUT,           // Wynaut
	HOENN_DEX_DUSKULL,          // Duskull
	HOENN_DEX_DUSCLOPS,         // Dusclops
	HOENN_DEX_ROSELIA,          // Roselia
	HOENN_DEX_SLAKOTH,          // Slakoth
	HOENN_DEX_VIGOROTH,         // Vigoroth
	HOENN_DEX_SLAKING,          // Slaking
	HOENN_DEX_GULPIN,           // Gulpin
	HOENN_DEX_SWALOT,           // Swalot
	HOENN_DEX_TROPIUS,          // Tropius
	HOENN_DEX_WHISMUR,          // Whismur
	HOENN_DEX_LOUDRED,          // Loudred
	HOENN_DEX_EXPLOUD,          // Exploud
	HOENN_DEX_CLAMPERL,         // Clamperl
	HOENN_DEX_HUNTAIL,          // Huntail
	HOENN_DEX_GOREBYSS,         // Gorebyss
	HOENN_DEX_ABSOL,            // Absol
	HOENN_DEX_SHUPPET,          // Shuppet
	HOENN_DEX_BANETTE,          // Banette
	HOENN_DEX_SEVIPER,          // Seviper
	HOENN_DEX_ZANGOOSE,         // Zangoose
	HOENN_DEX_RELICANTH,        // Relicanth
	HOENN_DEX_ARON,             // Aron
	HOENN_DEX_LAIRON,           // Lairon
	HOENN_DEX_AGGRON,           // Aggron
	HOENN_DEX_CASTFORM,         // Castform
	HOENN_DEX_VOLBEAT,          // Volbeat
	HOENN_DEX_ILLUMISE,         // Illumise
	HOENN_DEX_LILEEP,           // Lileep
	HOENN_DEX_CRADILY,          // Cradily
	HOENN_DEX_ANORITH,          // Anorith
	HOENN_DEX_ARMALDO,          // Armaldo
	HOENN_DEX_RALTS,            // Ralts
	HOENN_DEX_KIRLIA,           // Kirlia
	HOENN_DEX_GARDEVOIR,        // Gardevoir
	HOENN_DEX_BAGON,            // Bagon
	HOENN_DEX_SHELGON,          // Shelgon
	HOENN_DEX_SALAMENCE,        // Salamence
	HOENN_DEX_BELDUM,           // Beldum
	HOENN_DEX_METANG,           // Metang
	HOENN_DEX_METAGROSS,        // Metagross
	HOENN_DEX_REGIROCK,         // Regirock
	HOENN_DEX_REGICE,           // Regice
	HOENN_DEX_REGISTEEL,        // Registeel
	HOENN_DEX_KYOGRE,           // Kyogre
	HOENN_DEX_GROUDON,          // Groudon
	HOENN_DEX_RAYQUAZA,         // Rayquaza
	HOENN_DEX_LATIAS,           // Latias
	HOENN_DEX_LATIOS,           // Latios
	HOENN_DEX_JIRACHI,          // Jirachi
	HOENN_DEX_DEOXYS,           // Deoxys
	HOENN_DEX_CHIMECHO          // Chimecho
};

const u16 gSpeciesToNationalPokedexNum[] = // Assigns all species to the National Dex Index
{
	NATIONAL_DEX_BULBASAUR,  	// Bulbasaur
	NATIONAL_DEX_IVYSAUR,    	// Ivysaur
	NATIONAL_DEX_VENUSAUR,   	// Venusaur
	NATIONAL_DEX_CHARMANDER, 	// Charmander
	NATIONAL_DEX_CHARMELEON, 	// Charmeleon
	NATIONAL_DEX_CHARIZARD,  	// Charizard
	NATIONAL_DEX_SQUIRTLE,   	// Squirtle
	NATIONAL_DEX_WARTORTLE,  	// Wartortle
	NATIONAL_DEX_BLASTOISE,  	// Blastoise
	NATIONAL_DEX_CATERPIE,   	// Caterpie
	NATIONAL_DEX_METAPOD,    	// Metapod
	NATIONAL_DEX_BUTTERFREE, 	// Butterfree
	NATIONAL_DEX_WEEDLE,     	// Weedle
	NATIONAL_DEX_KAKUNA,     	// Kakuna
	NATIONAL_DEX_BEEDRILL,   	// Beedrill
	NATIONAL_DEX_PIDGEY,     	// Pidgey
	NATIONAL_DEX_PIDGEOTTO,  	// Pidgeotto
	NATIONAL_DEX_PIDGEOT,    	// Pidgeot
	NATIONAL_DEX_RATTATA,    	// Rattata
	NATIONAL_DEX_RATICATE,   	// Raticate
	NATIONAL_DEX_SPEAROW,    	// Spearow
	NATIONAL_DEX_FEAROW,     	// Fearow
	NATIONAL_DEX_EKANS,      	// Ekans
	NATIONAL_DEX_ARBOK,      	// Arbok
	NATIONAL_DEX_PIKACHU,    	// Pikachu
	NATIONAL_DEX_RAICHU,     	// Raichu
	NATIONAL_DEX_SANDSHREW,  	// Sandshrew
	NATIONAL_DEX_SANDSLASH,  	// Sandslash
	NATIONAL_DEX_NIDORAN_F,  	// Nidoran♀
	NATIONAL_DEX_NIDORINA,   	// Nidorina
	NATIONAL_DEX_NIDOQUEEN,  	// Nidoqueen
	NATIONAL_DEX_NIDORAN_M,  	// Nidoran♂
	NATIONAL_DEX_NIDORINO,   	// Nidorino
	NATIONAL_DEX_NIDOKING,   	// Nidoking
	NATIONAL_DEX_CLEFAIRY,   	// Clefairy
	NATIONAL_DEX_CLEFABLE,   	// Clefable
	NATIONAL_DEX_VULPIX,     	// Vulpix
	NATIONAL_DEX_NINETALES,  	// Ninetales
	NATIONAL_DEX_JIGGLYPUFF, 	// Jigglypuff
	NATIONAL_DEX_WIGGLYTUFF, 	// Wigglytuff
	NATIONAL_DEX_ZUBAT,      	// Zubat
	NATIONAL_DEX_GOLBAT,     	// Golbat
	NATIONAL_DEX_ODDISH,     	// Oddish
	NATIONAL_DEX_GLOOM,      	// Gloom
	NATIONAL_DEX_VILEPLUME,  	// Vileplume
	NATIONAL_DEX_PARAS,      	// Paras
	NATIONAL_DEX_PARASECT,   	// Parasect
	NATIONAL_DEX_VENONAT,    	// Venonat
	NATIONAL_DEX_VENOMOTH,   	// Venomoth
	NATIONAL_DEX_DIGLETT,    	// Diglett
	NATIONAL_DEX_DUGTRIO,    	// Dugtrio
	NATIONAL_DEX_MEOWTH,     	// Meowth
	NATIONAL_DEX_PERSIAN,    	// Persian
	NATIONAL_DEX_PSYDUCK,    	// Psyduck
	NATIONAL_DEX_GOLDUCK,    	// Golduck
	NATIONAL_DEX_MANKEY,     	// Mankey
	NATIONAL_DEX_PRIMEAPE,   	// Primeape
	NATIONAL_DEX_GROWLITHE,  	// Growlithe
	NATIONAL_DEX_ARCANINE,   	// Arcanine
	NATIONAL_DEX_POLIWAG,    	// Poliwag
	NATIONAL_DEX_POLIWHIRL,  	// Poliwhirl
	NATIONAL_DEX_POLIWRATH,  	// Poliwrath
	NATIONAL_DEX_ABRA,       	// Abra
	NATIONAL_DEX_KADABRA,    	// Kadabra
	NATIONAL_DEX_ALAKAZAM,   	// Alakazam
	NATIONAL_DEX_MACHOP,     	// Machop
	NATIONAL_DEX_MACHOKE,    	// Machoke
	NATIONAL_DEX_MACHAMP,    	// Machamp
	NATIONAL_DEX_BELLSPROUT, 	// Bellsprout
	NATIONAL_DEX_WEEPINBELL, 	// Weepinbell
	NATIONAL_DEX_VICTREEBEL, 	// Victreebel
	NATIONAL_DEX_TENTACOOL,  	// Tentacool
	NATIONAL_DEX_TENTACRUEL, 	// Tentacruel
	NATIONAL_DEX_GEODUDE,    	// Geodude
	NATIONAL_DEX_GRAVELER,   	// Graveler
	NATIONAL_DEX_GOLEM,      	// Golem
	NATIONAL_DEX_PONYTA,     	// Ponyta
	NATIONAL_DEX_RAPIDASH,   	// Rapidash
	NATIONAL_DEX_SLOWPOKE,   	// Slowpoke
	NATIONAL_DEX_SLOWBRO,    	// Slowbro
	NATIONAL_DEX_MAGNEMITE,  	// Magnemite
	NATIONAL_DEX_MAGNETON,   	// Magneton
	NATIONAL_DEX_FARFETCHD,  	// Farfetch'd
	NATIONAL_DEX_DODUO,      	// Doduo
	NATIONAL_DEX_DODRIO,     	// Dodrio
	NATIONAL_DEX_SEEL,       	// Seel
	NATIONAL_DEX_DEWGONG,    	// Dewgong
	NATIONAL_DEX_GRIMER,     	// Grimer
	NATIONAL_DEX_MUK,        	// Muk
	NATIONAL_DEX_SHELLDER,   	// Shellder
	NATIONAL_DEX_CLOYSTER,   	// Cloyster
	NATIONAL_DEX_GASTLY,     	// Gastly
	NATIONAL_DEX_HAUNTER,    	// Haunter
	NATIONAL_DEX_GENGAR,     	// Gengar
	NATIONAL_DEX_ONIX,       	// Onix
	NATIONAL_DEX_DROWZEE,    	// Drowzee
	NATIONAL_DEX_HYPNO,      	// Hypno
	NATIONAL_DEX_KRABBY,     	// Krabby
	NATIONAL_DEX_KINGLER,    	// Kingler
	NATIONAL_DEX_VOLTORB,    	// Voltorb
	NATIONAL_DEX_ELECTRODE,  	// Electrode
	NATIONAL_DEX_EXEGGCUTE,  	// Exeggcute
	NATIONAL_DEX_EXEGGUTOR,  	// Exeggutor
	NATIONAL_DEX_CUBONE,     	// Cubone
	NATIONAL_DEX_MAROWAK,    	// Marowak
	NATIONAL_DEX_HITMONLEE,  	// Hitmonlee
	NATIONAL_DEX_HITMONCHAN, 	// Hitmonchan
	NATIONAL_DEX_LICKITUNG,  	// Lickitung
	NATIONAL_DEX_KOFFING,    	// Koffing
	NATIONAL_DEX_WEEZING,    	// Weezing
	NATIONAL_DEX_RHYHORN,    	// Rhyhorn
	NATIONAL_DEX_RHYDON,     	// Rhydon
	NATIONAL_DEX_CHANSEY,    	// Chansey
	NATIONAL_DEX_TANGELA,    	// Tangela
	NATIONAL_DEX_KANGASKHAN, 	// Kangaskhan
	NATIONAL_DEX_HORSEA,     	// Horsea
	NATIONAL_DEX_SEADRA,     	// Seadra
	NATIONAL_DEX_GOLDEEN,    	// Goldeen
	NATIONAL_DEX_SEAKING,    	// Seaking
	NATIONAL_DEX_STARYU,     	// Staryu
	NATIONAL_DEX_STARMIE,    	// Starmie
	NATIONAL_DEX_MR_MIME,    	// Mr. Mime
	NATIONAL_DEX_SCYTHER,    	// Scyther
	NATIONAL_DEX_JYNX,       	// Jynx
	NATIONAL_DEX_ELECTABUZZ, 	// Electabuzz
	NATIONAL_DEX_MAGMAR,     	// Magmar
	NATIONAL_DEX_PINSIR,     	// Pinsir
	NATIONAL_DEX_TAUROS,     	// Tauros
	NATIONAL_DEX_MAGIKARP,   	// Magikarp
	NATIONAL_DEX_GYARADOS,   	// Gyarados
	NATIONAL_DEX_LAPRAS,     	// Lapras
	NATIONAL_DEX_DITTO,      	// Ditto
	NATIONAL_DEX_EEVEE,      	// Eevee
	NATIONAL_DEX_VAPOREON,   	// Vaporeon
	NATIONAL_DEX_JOLTEON,    	// Jolteon
	NATIONAL_DEX_FLAREON,    	// Flareon
	NATIONAL_DEX_PORYGON,    	// Porygon
	NATIONAL_DEX_OMANYTE,    	// Omanyte
	NATIONAL_DEX_OMASTAR,    	// Omastar
	NATIONAL_DEX_KABUTO,     	// Kabuto
	NATIONAL_DEX_KABUTOPS,   	// Kabutops
	NATIONAL_DEX_AERODACTYL, 	// Aerodactyl
	NATIONAL_DEX_SNORLAX,    	// Snorlax
	NATIONAL_DEX_ARTICUNO,   	// Articuno
	NATIONAL_DEX_ZAPDOS,     	// Zapdos
	NATIONAL_DEX_MOLTRES,    	// Moltres
	NATIONAL_DEX_DRATINI,    	// Dratini
	NATIONAL_DEX_DRAGONAIR,  	// Dragonair
	NATIONAL_DEX_DRAGONITE,  	// Dragonite
	NATIONAL_DEX_MEWTWO,     	// Mewtwo
	NATIONAL_DEX_MEW,        	// Mew
	NATIONAL_DEX_CHIKORITA,  	// Chikorita
	NATIONAL_DEX_BAYLEEF,    	// Bayleef
	NATIONAL_DEX_MEGANIUM,   	// Meganium
	NATIONAL_DEX_CYNDAQUIL,  	// Cyndaquil
	NATIONAL_DEX_QUILAVA,    	// Quilava
	NATIONAL_DEX_TYPHLOSION, 	// Typhlosion
	NATIONAL_DEX_TOTODILE,   	// Totodile
	NATIONAL_DEX_CROCONAW,   	// Croconaw
	NATIONAL_DEX_FERALIGATR, 	// Feraligatr
	NATIONAL_DEX_SENTRET,    	// Sentret
	NATIONAL_DEX_FURRET,     	// Furret
	NATIONAL_DEX_HOOTHOOT,   	// Hoothoot
	NATIONAL_DEX_NOCTOWL,    	// Noctowl
	NATIONAL_DEX_LEDYBA,     	// Ledyba
	NATIONAL_DEX_LEDIAN,     	// Ledian
	NATIONAL_DEX_SPINARAK,   	// Spinarak
	NATIONAL_DEX_ARIADOS,    	// Ariados
	NATIONAL_DEX_CROBAT,     	// Crobat
	NATIONAL_DEX_CHINCHOU,   	// Chinchou
	NATIONAL_DEX_LANTURN,    	// Lanturn
	NATIONAL_DEX_PICHU,      	// Pichu
	NATIONAL_DEX_CLEFFA,     	// Cleffa
	NATIONAL_DEX_IGGLYBUFF,  	// Igglybuff
	NATIONAL_DEX_TOGEPI,     	// Togepi
	NATIONAL_DEX_TOGETIC,    	// Togetic
	NATIONAL_DEX_NATU,       	// Natu
	NATIONAL_DEX_XATU,       	// Xatu
	NATIONAL_DEX_MAREEP,     	// Mareep
	NATIONAL_DEX_FLAAFFY,    	// Flaaffy
	NATIONAL_DEX_AMPHAROS,   	// Ampharos
	NATIONAL_DEX_BELLOSSOM,  	// Bellossom
	NATIONAL_DEX_MARILL,     	// Marill
	NATIONAL_DEX_AZUMARILL,  	// Azumarill
	NATIONAL_DEX_SUDOWOODO,  	// Sudowoodo
	NATIONAL_DEX_POLITOED,   	// Politoed
	NATIONAL_DEX_HOPPIP,     	// Hoppip
	NATIONAL_DEX_SKIPLOOM,   	// Skiploom
	NATIONAL_DEX_JUMPLUFF,   	// Jumpluff
	NATIONAL_DEX_AIPOM,      	// Aipom
	NATIONAL_DEX_SUNKERN,    	// Sunkern
	NATIONAL_DEX_SUNFLORA,   	// Sunflora
	NATIONAL_DEX_YANMA,      	// Yanma
	NATIONAL_DEX_WOOPER,     	// Wooper
	NATIONAL_DEX_QUAGSIRE,   	// Quagsire
	NATIONAL_DEX_ESPEON,     	// Espeon
	NATIONAL_DEX_UMBREON,    	// Umbreon
	NATIONAL_DEX_MURKROW,    	// Murkrow
	NATIONAL_DEX_SLOWKING,   	// Slowking
	NATIONAL_DEX_MISDREAVUS, 	// Misdreavus
	NATIONAL_DEX_UNOWN,      	// Unown A
	NATIONAL_DEX_WOBBUFFET,  	// Wobbuffet
	NATIONAL_DEX_GIRAFARIG,  	// Girafarig
	NATIONAL_DEX_PINECO,     	// Pineco
	NATIONAL_DEX_FORRETRESS, 	// Forretress
	NATIONAL_DEX_DUNSPARCE,  	// Dunsparce
	NATIONAL_DEX_GLIGAR,     	// Gligar
	NATIONAL_DEX_STEELIX,    	// Steelix
	NATIONAL_DEX_SNUBBULL,   	// Snubbull
	NATIONAL_DEX_GRANBULL,   	// Granbull
	NATIONAL_DEX_QWILFISH,   	// Qwilfish
	NATIONAL_DEX_SCIZOR,     	// Scizor
	NATIONAL_DEX_SHUCKLE,    	// Shuckle
	NATIONAL_DEX_HERACROSS,  	// Heracross
	NATIONAL_DEX_SNEASEL,    	// Sneasel
	NATIONAL_DEX_TEDDIURSA,  	// Teddiursa
	NATIONAL_DEX_URSARING,   	// Ursaring
	NATIONAL_DEX_SLUGMA,     	// Slugma
	NATIONAL_DEX_MAGCARGO,   	// Magcargo
	NATIONAL_DEX_SWINUB,     	// Swinub
	NATIONAL_DEX_PILOSWINE,  	// Piloswine
	NATIONAL_DEX_CORSOLA,    	// Corsola
	NATIONAL_DEX_REMORAID,   	// Remoraid
	NATIONAL_DEX_OCTILLERY,  	// Octillery
	NATIONAL_DEX_DELIBIRD,   	// Delibird
	NATIONAL_DEX_MANTINE,    	// Mantine
	NATIONAL_DEX_SKARMORY,   	// Skarmory
	NATIONAL_DEX_HOUNDOUR,   	// Houndour
	NATIONAL_DEX_HOUNDOOM,   	// Houndoom
	NATIONAL_DEX_KINGDRA,    	// Kingdra
	NATIONAL_DEX_PHANPY,     	// Phanpy
	NATIONAL_DEX_DONPHAN,    	// Donphan
	NATIONAL_DEX_PORYGON2,    	// Porygon2
	NATIONAL_DEX_STANTLER,   	// Stantler
	NATIONAL_DEX_SMEARGLE,   	// Smeargle
	NATIONAL_DEX_TYROGUE,    	// Tyrogue
	NATIONAL_DEX_HITMONTOP,  	// Hitmontop
	NATIONAL_DEX_SMOOCHUM,   	// Smoochum
	NATIONAL_DEX_ELEKID,     	// Elekid
	NATIONAL_DEX_MAGBY,      	// Magby
	NATIONAL_DEX_MILTANK,    	// Miltank
	NATIONAL_DEX_BLISSEY,    	// Blissey
	NATIONAL_DEX_RAIKOU,     	// Raikou
	NATIONAL_DEX_ENTEI,      	// Entei
	NATIONAL_DEX_SUICUNE,    	// Suicune
	NATIONAL_DEX_LARVITAR,   	// Larvitar
	NATIONAL_DEX_PUPITAR,    	// Pupitar
	NATIONAL_DEX_TYRANITAR,  	// Tyranitar
	NATIONAL_DEX_LUGIA,      	// Lugia
	NATIONAL_DEX_HO_OH,      	// Ho-Oh
	NATIONAL_DEX_CELEBI,     	// Celebi
	NATIONAL_DEX_OLD_UNOWN_B,	// Unown B (Old)
	NATIONAL_DEX_OLD_UNOWN_C,	// Unown C (Old)
	NATIONAL_DEX_OLD_UNOWN_D,	// Unown D (Old)
	NATIONAL_DEX_OLD_UNOWN_E,	// Unown E (Old)
	NATIONAL_DEX_OLD_UNOWN_F,	// Unown F (Old)
	NATIONAL_DEX_OLD_UNOWN_G,	// Unown G (Old)
	NATIONAL_DEX_OLD_UNOWN_H,	// Unown H (Old)
	NATIONAL_DEX_OLD_UNOWN_I,	// Unown I (Old)
	NATIONAL_DEX_OLD_UNOWN_J,	// Unown J (Old)
	NATIONAL_DEX_OLD_UNOWN_K,	// Unown K (Old)
	NATIONAL_DEX_OLD_UNOWN_L,	// Unown L (Old)
	NATIONAL_DEX_OLD_UNOWN_M,	// Unown M (Old)
	NATIONAL_DEX_OLD_UNOWN_N,	// Unown N (Old)
	NATIONAL_DEX_OLD_UNOWN_O, 	// Unown O (Old)
	NATIONAL_DEX_OLD_UNOWN_P, 	// Unown P (Old)
	NATIONAL_DEX_OLD_UNOWN_Q, 	// Unown Q (Old)
	NATIONAL_DEX_OLD_UNOWN_R, 	// Unown R (Old)
	NATIONAL_DEX_OLD_UNOWN_S, 	// Unown S (Old)
	NATIONAL_DEX_OLD_UNOWN_T,	// Unown T (Old)
	NATIONAL_DEX_OLD_UNOWN_U, 	// Unown U (Old)
	NATIONAL_DEX_OLD_UNOWN_V, 	// Unown V (Old)
	NATIONAL_DEX_OLD_UNOWN_W, 	// Unown W (Old)
	NATIONAL_DEX_OLD_UNOWN_X, 	// Unown X (Old)
	NATIONAL_DEX_OLD_UNOWN_Y, 	// Unown Y (Old)
	NATIONAL_DEX_OLD_UNOWN_Z, 	// Unown Z (Old)
	NATIONAL_DEX_TREECKO,   	// Treecko
	NATIONAL_DEX_GROVYLE,   	// Grovyle
	NATIONAL_DEX_SCEPTILE,  	// Sceptile
	NATIONAL_DEX_TORCHIC,   	// Torchic
	NATIONAL_DEX_COMBUSKEN, 	// Combusken
	NATIONAL_DEX_BLAZIKEN,  	// Blaziken
	NATIONAL_DEX_MUDKIP,    	// Mudkip
	NATIONAL_DEX_MARSHTOMP, 	// Marshtomp
	NATIONAL_DEX_SWAMPERT,  	// Swampert
	NATIONAL_DEX_POOCHYENA, 	// Poochyena
	NATIONAL_DEX_MIGHTYENA, 	// Mightyena
	NATIONAL_DEX_ZIGZAGOON, 	// Zigzagoon
	NATIONAL_DEX_LINOONE,   	// Linoone
	NATIONAL_DEX_WURMPLE,   	// Wurmple
	NATIONAL_DEX_SILCOON,   	// Silcoon
	NATIONAL_DEX_BEAUTIFLY, 	// Beautifly
	NATIONAL_DEX_CASCOON,   	// Cascoon
	NATIONAL_DEX_DUSTOX,    	// Dustox
	NATIONAL_DEX_LOTAD,     	// Lotad
	NATIONAL_DEX_LOMBRE,    	// Lombre
	NATIONAL_DEX_LUDICOLO,  	// Ludicolo
	NATIONAL_DEX_SEEDOT,    	// Seedot
	NATIONAL_DEX_NUZLEAF,   	// Nuzleaf
	NATIONAL_DEX_SHIFTRY,   	// Shiftry
	NATIONAL_DEX_NINCADA,   	// Nincada
	NATIONAL_DEX_NINJASK,   	// Ninjask
	NATIONAL_DEX_SHEDINJA,  	// Shedinja
	NATIONAL_DEX_TAILLOW,   	// Taillow
	NATIONAL_DEX_SWELLOW,   	// Swellow
	NATIONAL_DEX_SHROOMISH, 	// Shroomish
	NATIONAL_DEX_BRELOOM,   	// Breloom
	NATIONAL_DEX_SPINDA,    	// Spinda
	NATIONAL_DEX_WINGULL,   	// Wingull
	NATIONAL_DEX_PELIPPER,  	// Pelipper
	NATIONAL_DEX_SURSKIT,   	// Surskit
	NATIONAL_DEX_MASQUERAIN,	// Masquerain
	NATIONAL_DEX_WAILMER,   	// Wailmer
	NATIONAL_DEX_WAILORD,   	// Wailord
	NATIONAL_DEX_SKITTY,    	// Skitty
	NATIONAL_DEX_DELCATTY,  	// Delcatty
	NATIONAL_DEX_KECLEON,   	// Kecleon
	NATIONAL_DEX_BALTOY,    	// Baltoy
	NATIONAL_DEX_CLAYDOL,   	// Claydol
	NATIONAL_DEX_NOSEPASS,  	// Nosepass
	NATIONAL_DEX_TORKOAL,   	// Torkoal
	NATIONAL_DEX_SABLEYE,   	// Sableye
	NATIONAL_DEX_BARBOACH,  	// Barboach
	NATIONAL_DEX_WHISCASH,  	// Whiscash
	NATIONAL_DEX_LUVDISC,   	// Luvdisc
	NATIONAL_DEX_CORPHISH,  	// Corphish
	NATIONAL_DEX_CRAWDAUNT, 	// Crawdaunt
	NATIONAL_DEX_FEEBAS,    	// Feebas
	NATIONAL_DEX_MILOTIC,   	// Milotic
	NATIONAL_DEX_CARVANHA,  	// Carvanha
	NATIONAL_DEX_SHARPEDO,  	// Sharpedo
	NATIONAL_DEX_TRAPINCH,  	// Trapinch
	NATIONAL_DEX_VIBRAVA,   	// Vibrava
	NATIONAL_DEX_FLYGON,    	// Flygon
	NATIONAL_DEX_MAKUHITA,  	// Makuhita
	NATIONAL_DEX_HARIYAMA,  	// Hariyama
	NATIONAL_DEX_ELECTRIKE, 	// Electrike
	NATIONAL_DEX_MANECTRIC, 	// Manectric
	NATIONAL_DEX_NUMEL,     	// Numel
	NATIONAL_DEX_CAMERUPT,  	// Camerupt
	NATIONAL_DEX_SPHEAL,    	// Spheal
	NATIONAL_DEX_SEALEO,    	// Sealeo
	NATIONAL_DEX_WALREIN,   	// Walrein
	NATIONAL_DEX_CACNEA,    	// Cacnea
	NATIONAL_DEX_CACTURNE,  	// Cacturne
	NATIONAL_DEX_SNORUNT,   	// Snorunt
	NATIONAL_DEX_GLALIE,    	// Glalie
	NATIONAL_DEX_LUNATONE,  	// Lunatone
	NATIONAL_DEX_SOLROCK,   	// Solrock
	NATIONAL_DEX_AZURILL,   	// Azurill
	NATIONAL_DEX_SPOINK,    	// Spoink
	NATIONAL_DEX_GRUMPIG,   	// Grumpig
	NATIONAL_DEX_PLUSLE,    	// Plusle
	NATIONAL_DEX_MINUN,     	// Minun
	NATIONAL_DEX_MAWILE,    	// Mawile
	NATIONAL_DEX_MEDITITE,  	// Meditite
	NATIONAL_DEX_MEDICHAM,  	// Medicham
	NATIONAL_DEX_SWABLU,    	// Swablu
	NATIONAL_DEX_ALTARIA,   	// Altaria
	NATIONAL_DEX_WYNAUT,    	// Wynaut
	NATIONAL_DEX_DUSKULL,   	// Duskull
	NATIONAL_DEX_DUSCLOPS,  	// Dusclops
	NATIONAL_DEX_ROSELIA,   	// Roselia
	NATIONAL_DEX_SLAKOTH,   	// Slakoth
	NATIONAL_DEX_VIGOROTH,  	// Vigoroth
	NATIONAL_DEX_SLAKING,   	// Slaking
	NATIONAL_DEX_GULPIN,    	// Gulpin
	NATIONAL_DEX_SWALOT,    	// Swalot
	NATIONAL_DEX_TROPIUS,   	// Tropius
	NATIONAL_DEX_WHISMUR,   	// Whismur
	NATIONAL_DEX_LOUDRED,   	// Loudred
	NATIONAL_DEX_EXPLOUD,   	// Exploud
	NATIONAL_DEX_CLAMPERL,  	// Clamperl
	NATIONAL_DEX_HUNTAIL,   	// Huntail
	NATIONAL_DEX_GOREBYSS,  	// Gorebyss
	NATIONAL_DEX_ABSOL,     	// Absol
	NATIONAL_DEX_SHUPPET,   	// Shuppet
	NATIONAL_DEX_BANETTE,   	// Banette
	NATIONAL_DEX_SEVIPER,   	// Seviper
	NATIONAL_DEX_ZANGOOSE,  	// Zangoose
	NATIONAL_DEX_RELICANTH, 	// Relicanth
	NATIONAL_DEX_ARON,      	// Aron
	NATIONAL_DEX_LAIRON,    	// Lairon
	NATIONAL_DEX_AGGRON,    	// Aggron
	NATIONAL_DEX_CASTFORM,  	// Castform
	NATIONAL_DEX_VOLBEAT,   	// Volbeat
	NATIONAL_DEX_ILLUMISE,  	// Illumise
	NATIONAL_DEX_LILEEP,    	// Lileep
	NATIONAL_DEX_CRADILY,   	// Cradily
	NATIONAL_DEX_ANORITH,   	// Anorith
	NATIONAL_DEX_ARMALDO,   	// Armaldo
	NATIONAL_DEX_RALTS,     	// Ralts
	NATIONAL_DEX_KIRLIA,    	// Kirlia
	NATIONAL_DEX_GARDEVOIR, 	// Gardevoir
	NATIONAL_DEX_BAGON,     	// Bagon
	NATIONAL_DEX_SHELGON,   	// Shelgon
	NATIONAL_DEX_SALAMENCE, 	// Salamence
	NATIONAL_DEX_BELDUM,    	// Beldum
	NATIONAL_DEX_METANG,    	// Metang
	NATIONAL_DEX_METAGROSS, 	// Metagross
	NATIONAL_DEX_REGIROCK,  	// Regirock
	NATIONAL_DEX_REGICE,    	// Regice
	NATIONAL_DEX_REGISTEEL, 	// Registeel
	NATIONAL_DEX_KYOGRE,    	// Kyogre
	NATIONAL_DEX_GROUDON,   	// Groudon
	NATIONAL_DEX_RAYQUAZA,  	// Rayquaza
	NATIONAL_DEX_LATIAS,    	// Latias
	NATIONAL_DEX_LATIOS,    	// Latios
	NATIONAL_DEX_JIRACHI,   	// Jirachi
	NATIONAL_DEX_DEOXYS,    	// Deoxys
	NATIONAL_DEX_CHIMECHO   	// Chimecho
};

const u16 gHoennToNationalOrder[] = // Assigns Hoenn Dex Pokémon (Using National Dex Index)
{
	NATIONAL_DEX_TREECKO,   	// Treecko
	NATIONAL_DEX_GROVYLE,   	// Grovyle
	NATIONAL_DEX_SCEPTILE,  	// Sceptile
	NATIONAL_DEX_TORCHIC,   	// Torchic
	NATIONAL_DEX_COMBUSKEN, 	// Combusken
	NATIONAL_DEX_BLAZIKEN,  	// Blaziken
	NATIONAL_DEX_MUDKIP,    	// Mudkip
	NATIONAL_DEX_MARSHTOMP, 	// Marshtomp
	NATIONAL_DEX_SWAMPERT,  	// Swampert	
	NATIONAL_DEX_POOCHYENA, 	// Poochyena
	NATIONAL_DEX_MIGHTYENA, 	// Mightyena
	NATIONAL_DEX_ZIGZAGOON, 	// Zigzagoon
	NATIONAL_DEX_LINOONE,   	// Linoone
	NATIONAL_DEX_WURMPLE,   	// Wurmple
	NATIONAL_DEX_SILCOON,   	// Silcoon
	NATIONAL_DEX_BEAUTIFLY, 	// Beautifly
	NATIONAL_DEX_CASCOON,   	// Cascoon
	NATIONAL_DEX_DUSTOX,    	// Dustox
	NATIONAL_DEX_LOTAD,     	// Lotad
	NATIONAL_DEX_LOMBRE,    	// Lombre
	NATIONAL_DEX_LUDICOLO,  	// Ludicolo
	NATIONAL_DEX_SEEDOT,    	// Seedot
	NATIONAL_DEX_NUZLEAF,   	// Nuzleaf
	NATIONAL_DEX_SHIFTRY,   	// Shiftry
	NATIONAL_DEX_TAILLOW,   	// Taillow
	NATIONAL_DEX_SWELLOW,   	// Swellow
	NATIONAL_DEX_WINGULL,   	// Wingull
	NATIONAL_DEX_PELIPPER,  	// Pelipper
	NATIONAL_DEX_RALTS,     	// Ralts
	NATIONAL_DEX_KIRLIA,    	// Kirlia
	NATIONAL_DEX_GARDEVOIR, 	// Gardevoir
	NATIONAL_DEX_SURSKIT,   	// Surskit
	NATIONAL_DEX_MASQUERAIN,	// Masquerain
	NATIONAL_DEX_SHROOMISH, 	// Shroomish
	NATIONAL_DEX_BRELOOM,   	// Breloom
	NATIONAL_DEX_SLAKOTH,   	// Slakoth
	NATIONAL_DEX_VIGOROTH,  	// Vigoroth
	NATIONAL_DEX_SLAKING,   	// Slaking
	NATIONAL_DEX_ABRA,       	// Abra
	NATIONAL_DEX_KADABRA,    	// Kadabra
	NATIONAL_DEX_ALAKAZAM,   	// Alakazam
	NATIONAL_DEX_NINCADA,   	// Nincada
	NATIONAL_DEX_NINJASK,   	// Ninjask
	NATIONAL_DEX_SHEDINJA,  	// Shedinja
	NATIONAL_DEX_WHISMUR,   	// Whismur
	NATIONAL_DEX_LOUDRED,   	// Loudred
	NATIONAL_DEX_EXPLOUD,   	// Exploud
	NATIONAL_DEX_MAKUHITA,  	// Makuhita
	NATIONAL_DEX_HARIYAMA,  	// Hariyama
	NATIONAL_DEX_GOLDEEN,    	// Goldeen
	NATIONAL_DEX_SEAKING,    	// Seaking
	NATIONAL_DEX_MAGIKARP,   	// Magikarp
	NATIONAL_DEX_GYARADOS,   	// Gyarados
	NATIONAL_DEX_AZURILL,   	// Azurill
	NATIONAL_DEX_MARILL,     	// Marill
	NATIONAL_DEX_AZUMARILL,  	// Azumarill
	NATIONAL_DEX_GEODUDE,    	// Geodude
	NATIONAL_DEX_GRAVELER,   	// Graveler
	NATIONAL_DEX_GOLEM,      	// Golem
	NATIONAL_DEX_NOSEPASS,  	// Nosepass
	NATIONAL_DEX_SKITTY,    	// Skitty
	NATIONAL_DEX_DELCATTY,  	// Delcatty
	NATIONAL_DEX_ZUBAT,      	// Zubat
	NATIONAL_DEX_GOLBAT,     	// Golbat
	NATIONAL_DEX_CROBAT,     	// Crobat
	NATIONAL_DEX_TENTACOOL,  	// Tentacool
	NATIONAL_DEX_TENTACRUEL, 	// Tentacruel
	NATIONAL_DEX_SABLEYE,   	// Sableye
	NATIONAL_DEX_MAWILE,    	// Mawile
	NATIONAL_DEX_ARON,      	// Aron
	NATIONAL_DEX_LAIRON,    	// Lairon
	NATIONAL_DEX_AGGRON,    	// Aggron
	NATIONAL_DEX_MACHOP,     	// Machop
	NATIONAL_DEX_MACHOKE,    	// Machoke
	NATIONAL_DEX_MACHAMP,    	// Machamp
	NATIONAL_DEX_MEDITITE,  	// Meditite
	NATIONAL_DEX_MEDICHAM,  	// Medicham
	NATIONAL_DEX_ELECTRIKE, 	// Electrike
	NATIONAL_DEX_MANECTRIC, 	// Manectric
	NATIONAL_DEX_PLUSLE,    	// Plusle
	NATIONAL_DEX_MINUN,     	// Minun
	NATIONAL_DEX_MAGNEMITE,  	// Magnemite
	NATIONAL_DEX_MAGNETON,   	// Magneton
	NATIONAL_DEX_VOLTORB,    	// Voltorb
	NATIONAL_DEX_ELECTRODE,  	// Electrode
	NATIONAL_DEX_VOLBEAT,   	// Volbeat
	NATIONAL_DEX_ILLUMISE,  	// Illumise
	NATIONAL_DEX_ODDISH,     	// Oddish
	NATIONAL_DEX_GLOOM,      	// Gloom
	NATIONAL_DEX_VILEPLUME,  	// Vileplume
	NATIONAL_DEX_BELLOSSOM,  	// Bellossom
	NATIONAL_DEX_DODUO,      	// Doduo
	NATIONAL_DEX_DODRIO,     	// Dodrio
	NATIONAL_DEX_ROSELIA,   	// Roselia
	NATIONAL_DEX_GULPIN,    	// Gulpin
	NATIONAL_DEX_SWALOT,    	// Swalot
	NATIONAL_DEX_CARVANHA,  	// Carvanha
	NATIONAL_DEX_SHARPEDO,  	// Sharpedo
	NATIONAL_DEX_WAILMER,   	// Wailmer
	NATIONAL_DEX_WAILORD,   	// Wailord
	NATIONAL_DEX_NUMEL,     	// Numel
	NATIONAL_DEX_CAMERUPT,  	// Camerupt
	NATIONAL_DEX_SLUGMA,     	// Slugma
	NATIONAL_DEX_MAGCARGO,   	// Magcargo
	NATIONAL_DEX_TORKOAL,   	// Torkoal
	NATIONAL_DEX_GRIMER,     	// Grimer
	NATIONAL_DEX_MUK,        	// Muk
	NATIONAL_DEX_KOFFING,    	// Koffing
	NATIONAL_DEX_WEEZING,    	// Weezing
	NATIONAL_DEX_SPOINK,    	// Spoink
	NATIONAL_DEX_GRUMPIG,   	// Grumpig
	NATIONAL_DEX_SANDSHREW,  	// Sandshrew
	NATIONAL_DEX_SANDSLASH,  	// Sandslash
	NATIONAL_DEX_SPINDA,    	// Spinda
	NATIONAL_DEX_SKARMORY,   	// Skarmory
	NATIONAL_DEX_TRAPINCH,  	// Trapinch
	NATIONAL_DEX_VIBRAVA,   	// Vibrava
	NATIONAL_DEX_FLYGON,    	// Flygon
	NATIONAL_DEX_CACNEA,    	// Cacnea
	NATIONAL_DEX_CACTURNE,  	// Cacturne
	NATIONAL_DEX_SWABLU,    	// Swablu
	NATIONAL_DEX_ALTARIA,   	// Altaria
	NATIONAL_DEX_ZANGOOSE,  	// Zangoose
	NATIONAL_DEX_SEVIPER,   	// Seviper
	NATIONAL_DEX_LUNATONE,  	// Lunatone
	NATIONAL_DEX_SOLROCK,   	// Solrock
	NATIONAL_DEX_BARBOACH,  	// Barboach
	NATIONAL_DEX_WHISCASH,  	// Whiscash
	NATIONAL_DEX_CORPHISH,  	// Corphish
	NATIONAL_DEX_CRAWDAUNT, 	// Crawdaunt
	NATIONAL_DEX_BALTOY,    	// Baltoy
	NATIONAL_DEX_CLAYDOL,   	// Claydol
	NATIONAL_DEX_LILEEP,    	// Lileep
	NATIONAL_DEX_CRADILY,   	// Cradily
	NATIONAL_DEX_ANORITH,   	// Anorith
	NATIONAL_DEX_ARMALDO,   	// Armaldo
	NATIONAL_DEX_IGGLYBUFF, 	// Igglybuff
	NATIONAL_DEX_JIGGLYPUFF, 	// Jigglypuff
	NATIONAL_DEX_WIGGLYTUFF, 	// Wigglytuff
	NATIONAL_DEX_FEEBAS,    	// Feebas
	NATIONAL_DEX_MILOTIC,   	// Milotic
	NATIONAL_DEX_CASTFORM,  	// Castform
	NATIONAL_DEX_STARYU,     	// Staryu
	NATIONAL_DEX_STARMIE,    	// Starmie
	NATIONAL_DEX_KECLEON,   	// Kecleon
	NATIONAL_DEX_SHUPPET,   	// Shuppet
	NATIONAL_DEX_BANETTE,   	// Banette
	NATIONAL_DEX_DUSKULL,   	// Duskull
	NATIONAL_DEX_DUSCLOPS,  	// Dusclops
	NATIONAL_DEX_TROPIUS,   	// Tropius
	NATIONAL_DEX_CHIMECHO,   	// Chimecho
	NATIONAL_DEX_ABSOL,     	// Absol
	NATIONAL_DEX_VULPIX,     	// Vulpix
	NATIONAL_DEX_NINETALES,  	// Ninetales
	NATIONAL_DEX_PICHU,       	// Pichu
	NATIONAL_DEX_PIKACHU,    	// Pikachu
	NATIONAL_DEX_RAICHU,     	// Raichu
	NATIONAL_DEX_PSYDUCK,    	// Psyduck
	NATIONAL_DEX_GOLDUCK,    	// Golduck
	NATIONAL_DEX_WYNAUT,    	// Wynaut
	NATIONAL_DEX_WOBBUFFET,  	// Wobbuffet
	NATIONAL_DEX_NATU,       	// Natu
	NATIONAL_DEX_XATU,       	// Xatu
	NATIONAL_DEX_GIRAFARIG,  	// Girafarig
	NATIONAL_DEX_PHANPY,     	// Phanpy
	NATIONAL_DEX_DONPHAN,    	// Donphan
	NATIONAL_DEX_PINSIR,     	// Pinsir
	NATIONAL_DEX_HERACROSS,  	// Heracross
	NATIONAL_DEX_RHYHORN,    	// Rhyhorn
	NATIONAL_DEX_RHYDON,     	// Rhydon
	NATIONAL_DEX_SNORUNT,   	// Snorunt
	NATIONAL_DEX_GLALIE,    	// Glalie
	NATIONAL_DEX_SPHEAL,    	// Spheal
	NATIONAL_DEX_SEALEO,    	// Sealeo
	NATIONAL_DEX_WALREIN,   	// Walrein
	NATIONAL_DEX_CLAMPERL,  	// Clamperl
	NATIONAL_DEX_HUNTAIL,   	// Huntail
	NATIONAL_DEX_GOREBYSS,  	// Gorebyss
	NATIONAL_DEX_RELICANTH, 	// Relicanth
	NATIONAL_DEX_CORSOLA, 	    // Relicanth
	NATIONAL_DEX_CHINCHOU,   	// Chinchou
	NATIONAL_DEX_LANTURN,    	// Lanturn
	NATIONAL_DEX_LUVDISC,   	// Luvdisc
	NATIONAL_DEX_HORSEA,   	    // Horsea
	NATIONAL_DEX_SEADRA,   	    // Seadra
	NATIONAL_DEX_KINGDRA,   	// Kingdra
	NATIONAL_DEX_BAGON,     	// Bagon
	NATIONAL_DEX_SHELGON,   	// Shelgon
	NATIONAL_DEX_SALAMENCE, 	// Salamence
	NATIONAL_DEX_BELDUM,    	// Beldum
	NATIONAL_DEX_METANG,    	// Metang
	NATIONAL_DEX_METAGROSS, 	// Metagross
	NATIONAL_DEX_REGIROCK,  	// Regirock
	NATIONAL_DEX_REGICE,    	// Regice
	NATIONAL_DEX_REGISTEEL, 	// Registeel
	NATIONAL_DEX_LATIAS,    	// Latias
	NATIONAL_DEX_LATIOS,    	// Latios
	NATIONAL_DEX_KYOGRE,    	// Kyogre
	NATIONAL_DEX_GROUDON,   	// Groudon
	NATIONAL_DEX_RAYQUAZA,  	// Rayquaza
	NATIONAL_DEX_JIRACHI,   	// Jirachi
	NATIONAL_DEX_DEOXYS,    	// Deoxys
	NATIONAL_DEX_BULBASAUR,  	// Bulbasaur - Pokémon from here onwards are UNSEEN in the Hoenn Dex.
	NATIONAL_DEX_IVYSAUR,    	// Ivysaur
	NATIONAL_DEX_VENUSAUR,   	// Venusaur
	NATIONAL_DEX_CHARMANDER, 	// Charmander
	NATIONAL_DEX_CHARMELEON, 	// Charmeleon
	NATIONAL_DEX_CHARIZARD,  	// Charizard
	NATIONAL_DEX_SQUIRTLE,   	// Squirtle
	NATIONAL_DEX_WARTORTLE,  	// Wartortle
	NATIONAL_DEX_BLASTOISE,  	// Blastoise
	NATIONAL_DEX_CATERPIE,   	// Caterpie
	NATIONAL_DEX_METAPOD,    	// Metapod
	NATIONAL_DEX_BUTTERFREE, 	// Butterfree
	NATIONAL_DEX_WEEDLE,     	// Weedle
	NATIONAL_DEX_KAKUNA,     	// Kakuna
	NATIONAL_DEX_BEEDRILL,   	// Beedrill
	NATIONAL_DEX_PIDGEY,     	// Pidgey
	NATIONAL_DEX_PIDGEOTTO,  	// Pidgeotto
	NATIONAL_DEX_PIDGEOT,    	// Pidgeot
	NATIONAL_DEX_RATTATA,    	// Rattata
	NATIONAL_DEX_RATICATE,   	// Raticate
	NATIONAL_DEX_SPEAROW,    	// Spearow
	NATIONAL_DEX_FEAROW,     	// Fearow
	NATIONAL_DEX_EKANS,      	// Ekans
	NATIONAL_DEX_ARBOK,      	// Arbok
	NATIONAL_DEX_NIDORAN_F,  	// Nidoran♀
	NATIONAL_DEX_NIDORINA,   	// Nidorina
	NATIONAL_DEX_NIDOQUEEN,  	// Nidoqueen
	NATIONAL_DEX_NIDORAN_M,  	// Nidoran♂
	NATIONAL_DEX_NIDORINO,   	// Nidorino
	NATIONAL_DEX_NIDOKING,   	// Nidoking
	NATIONAL_DEX_CLEFAIRY,   	// Clefairy
	NATIONAL_DEX_CLEFABLE,   	// Clefable
	NATIONAL_DEX_PARAS,      	// Paras
	NATIONAL_DEX_PARASECT,   	// Parasect
	NATIONAL_DEX_VENONAT,    	// Venonat
	NATIONAL_DEX_VENOMOTH,   	// Venomoth
	NATIONAL_DEX_DIGLETT,    	// Diglett
	NATIONAL_DEX_DUGTRIO,    	// Dugtrio
	NATIONAL_DEX_MEOWTH,     	// Meowth
	NATIONAL_DEX_PERSIAN,    	// Persian
	NATIONAL_DEX_MANKEY,     	// Mankey
	NATIONAL_DEX_PRIMEAPE,   	// Primeape
	NATIONAL_DEX_GROWLITHE,  	// Growlithe
	NATIONAL_DEX_ARCANINE,   	// Arcanine
	NATIONAL_DEX_POLIWAG,    	// Poliwag
	NATIONAL_DEX_POLIWHIRL,  	// Poliwhirl
	NATIONAL_DEX_POLIWRATH,  	// Poliwrath
	NATIONAL_DEX_BELLSPROUT, 	// Bellsprout
	NATIONAL_DEX_WEEPINBELL, 	// Weepinbell
	NATIONAL_DEX_VICTREEBEL, 	// Victreebel
	NATIONAL_DEX_PONYTA,     	// Ponyta
	NATIONAL_DEX_RAPIDASH,   	// Rapidash
	NATIONAL_DEX_SLOWPOKE,   	// Slowpoke
	NATIONAL_DEX_SLOWBRO,    	// Slowbro
	NATIONAL_DEX_FARFETCHD,  	// Farfetch'd
	NATIONAL_DEX_SEEL,       	// Seel
	NATIONAL_DEX_DEWGONG,    	// Dewgong
	NATIONAL_DEX_SHELLDER,   	// Shellder
	NATIONAL_DEX_CLOYSTER,   	// Cloyster
	NATIONAL_DEX_GASTLY,     	// Gastly
	NATIONAL_DEX_HAUNTER,    	// Haunter
	NATIONAL_DEX_GENGAR,     	// Gengar
	NATIONAL_DEX_ONIX,       	// Onix
	NATIONAL_DEX_DROWZEE,    	// Drowzee
	NATIONAL_DEX_HYPNO,      	// Hypno
	NATIONAL_DEX_KRABBY,     	// Krabby
	NATIONAL_DEX_KINGLER,    	// Kingler
	NATIONAL_DEX_EXEGGCUTE,  	// Exeggcute
	NATIONAL_DEX_EXEGGUTOR,  	// Exeggutor
	NATIONAL_DEX_CUBONE,     	// Cubone
	NATIONAL_DEX_MAROWAK,    	// Marowak
	NATIONAL_DEX_HITMONLEE,  	// Hitmonlee
	NATIONAL_DEX_HITMONCHAN, 	// Hitmonchan
	NATIONAL_DEX_LICKITUNG,  	// Lickitung
	NATIONAL_DEX_CHANSEY,    	// Chansey
	NATIONAL_DEX_TANGELA,    	// Tangela
	NATIONAL_DEX_KANGASKHAN, 	// Kangaskhan
	NATIONAL_DEX_MR_MIME,    	// Mr. Mime
	NATIONAL_DEX_SCYTHER,    	// Scyther
	NATIONAL_DEX_JYNX,       	// Jynx
	NATIONAL_DEX_ELECTABUZZ, 	// Electabuzz
	NATIONAL_DEX_MAGMAR,     	// Magmar
	NATIONAL_DEX_TAUROS,     	// Tauros
	NATIONAL_DEX_LAPRAS,     	// Lapras
	NATIONAL_DEX_DITTO,      	// Ditto
	NATIONAL_DEX_EEVEE,      	// Eevee
	NATIONAL_DEX_VAPOREON,   	// Vaporeon
	NATIONAL_DEX_JOLTEON,    	// Jolteon
	NATIONAL_DEX_FLAREON,    	// Flareon
	NATIONAL_DEX_PORYGON,    	// Porygon
	NATIONAL_DEX_OMANYTE,    	// Omanyte
	NATIONAL_DEX_OMASTAR,    	// Omastar
	NATIONAL_DEX_KABUTO,     	// Kabuto
	NATIONAL_DEX_KABUTOPS,   	// Kabutops
	NATIONAL_DEX_AERODACTYL, 	// Aerodactyl
	NATIONAL_DEX_SNORLAX,    	// Snorlax
	NATIONAL_DEX_ARTICUNO,   	// Articuno
	NATIONAL_DEX_ZAPDOS,     	// Zapdos
	NATIONAL_DEX_MOLTRES,    	// Moltres
	NATIONAL_DEX_DRATINI,    	// Dratini
	NATIONAL_DEX_DRAGONAIR,  	// Dragonair
	NATIONAL_DEX_DRAGONITE,  	// Dragonite
	NATIONAL_DEX_MEWTWO,     	// Mewtwo
	NATIONAL_DEX_MEW,        	// Mew
	NATIONAL_DEX_CHIKORITA,  	// Chikorita
	NATIONAL_DEX_BAYLEEF,    	// Bayleef
	NATIONAL_DEX_MEGANIUM,   	// Meganium
	NATIONAL_DEX_CYNDAQUIL,  	// Cyndaquil
	NATIONAL_DEX_QUILAVA,    	// Quilava
	NATIONAL_DEX_TYPHLOSION, 	// Typhlosion
	NATIONAL_DEX_TOTODILE,   	// Totodile
	NATIONAL_DEX_CROCONAW,   	// Croconaw
	NATIONAL_DEX_FERALIGATR, 	// Feraligatr
	NATIONAL_DEX_SENTRET,    	// Sentret
	NATIONAL_DEX_FURRET,     	// Furret
	NATIONAL_DEX_HOOTHOOT,   	// Hoothoot
	NATIONAL_DEX_NOCTOWL,    	// Noctowl
	NATIONAL_DEX_LEDYBA,     	// Ledyba
	NATIONAL_DEX_LEDIAN,     	// Ledian
	NATIONAL_DEX_SPINARAK,   	// Spinarak
	NATIONAL_DEX_ARIADOS,    	// Ariados
	NATIONAL_DEX_CLEFFA,     	// Cleffa
	NATIONAL_DEX_TOGEPI,     	// Togepi
	NATIONAL_DEX_TOGETIC,    	// Togetic
	NATIONAL_DEX_MAREEP,     	// Mareep
	NATIONAL_DEX_FLAAFFY,    	// Flaaffy
	NATIONAL_DEX_AMPHAROS,   	// Ampharos
	NATIONAL_DEX_SUDOWOODO,  	// Sudowoodo
	NATIONAL_DEX_POLITOED,   	// Politoed
	NATIONAL_DEX_HOPPIP,     	// Hoppip
	NATIONAL_DEX_SKIPLOOM,   	// Skiploom
	NATIONAL_DEX_JUMPLUFF,   	// Jumpluff
	NATIONAL_DEX_AIPOM,      	// Aipom
	NATIONAL_DEX_SUNKERN,    	// Sunkern
	NATIONAL_DEX_SUNFLORA,   	// Sunflora
	NATIONAL_DEX_YANMA,      	// Yanma
	NATIONAL_DEX_WOOPER,     	// Wooper
	NATIONAL_DEX_QUAGSIRE,   	// Quagsire
	NATIONAL_DEX_ESPEON,     	// Espeon
	NATIONAL_DEX_UMBREON,    	// Umbreon
	NATIONAL_DEX_MURKROW,    	// Murkrow
	NATIONAL_DEX_SLOWKING,   	// Slowking
	NATIONAL_DEX_MISDREAVUS, 	// Misdreavus
	NATIONAL_DEX_UNOWN,      	// Unown A
	NATIONAL_DEX_PINECO,     	// Pineco
	NATIONAL_DEX_FORRETRESS, 	// Forretress
	NATIONAL_DEX_DUNSPARCE,  	// Dunsparce
	NATIONAL_DEX_GLIGAR,     	// Gligar
	NATIONAL_DEX_STEELIX,    	// Steelix
	NATIONAL_DEX_SNUBBULL,   	// Snubbull
	NATIONAL_DEX_GRANBULL,   	// Granbull
	NATIONAL_DEX_QWILFISH,   	// Qwilfish
	NATIONAL_DEX_SCIZOR,     	// Scizor
	NATIONAL_DEX_SHUCKLE,    	// Shuckle
	NATIONAL_DEX_SNEASEL,    	// Sneasel
	NATIONAL_DEX_TEDDIURSA,  	// Teddiursa
	NATIONAL_DEX_URSARING,   	// Ursaring
	NATIONAL_DEX_SWINUB,     	// Swinub
	NATIONAL_DEX_PILOSWINE,  	// Piloswine
	NATIONAL_DEX_REMORAID,   	// Remoraid
	NATIONAL_DEX_OCTILLERY,  	// Octillery
	NATIONAL_DEX_DELIBIRD,   	// Delibird
	NATIONAL_DEX_MANTINE,    	// Mantine
	NATIONAL_DEX_HOUNDOUR,   	// Houndour
	NATIONAL_DEX_HOUNDOOM,   	// Houndoom
	NATIONAL_DEX_PORYGON2,    	// Porygon2
	NATIONAL_DEX_STANTLER,   	// Stantler
	NATIONAL_DEX_SMEARGLE,   	// Smeargle
	NATIONAL_DEX_TYROGUE,    	// Tyrogue
	NATIONAL_DEX_HITMONTOP,  	// Hitmontop
	NATIONAL_DEX_SMOOCHUM,   	// Smoochum
	NATIONAL_DEX_ELEKID,     	// Elekid
	NATIONAL_DEX_MAGBY,      	// Magby
	NATIONAL_DEX_MILTANK,    	// Miltank
	NATIONAL_DEX_BLISSEY,    	// Blissey
	NATIONAL_DEX_RAIKOU,     	// Raikou
	NATIONAL_DEX_ENTEI,      	// Entei
	NATIONAL_DEX_SUICUNE,    	// Suicune
	NATIONAL_DEX_LARVITAR,   	// Larvitar
	NATIONAL_DEX_PUPITAR,    	// Pupitar
	NATIONAL_DEX_TYRANITAR,  	// Tyranitar
	NATIONAL_DEX_LUGIA,      	// Lugia
	NATIONAL_DEX_HO_OH,      	// Ho-Oh
	NATIONAL_DEX_CELEBI,     	// Celebi
	NATIONAL_DEX_OLD_UNOWN_B,	// Unown B (Old)
	NATIONAL_DEX_OLD_UNOWN_C,	// Unown C (Old)
	NATIONAL_DEX_OLD_UNOWN_D,	// Unown D (Old)
	NATIONAL_DEX_OLD_UNOWN_E,	// Unown E (Old)
	NATIONAL_DEX_OLD_UNOWN_F,	// Unown F (Old)
	NATIONAL_DEX_OLD_UNOWN_G,	// Unown G (Old)
	NATIONAL_DEX_OLD_UNOWN_H,	// Unown H (Old)
	NATIONAL_DEX_OLD_UNOWN_I,	// Unown I (Old)
	NATIONAL_DEX_OLD_UNOWN_J,	// Unown J (Old)
	NATIONAL_DEX_OLD_UNOWN_K,	// Unown K (Old)
	NATIONAL_DEX_OLD_UNOWN_L,	// Unown L (Old)
	NATIONAL_DEX_OLD_UNOWN_M,	// Unown M (Old)
	NATIONAL_DEX_OLD_UNOWN_N,	// Unown N (Old)
	NATIONAL_DEX_OLD_UNOWN_O, 	// Unown O (Old)
	NATIONAL_DEX_OLD_UNOWN_P, 	// Unown P (Old)
	NATIONAL_DEX_OLD_UNOWN_Q, 	// Unown Q (Old)
	NATIONAL_DEX_OLD_UNOWN_R, 	// Unown R (Old)
	NATIONAL_DEX_OLD_UNOWN_S, 	// Unown S (Old)
	NATIONAL_DEX_OLD_UNOWN_T,	// Unown T (Old)
	NATIONAL_DEX_OLD_UNOWN_U, 	// Unown U (Old)
	NATIONAL_DEX_OLD_UNOWN_V, 	// Unown V (Old)
	NATIONAL_DEX_OLD_UNOWN_W, 	// Unown W (Old)
	NATIONAL_DEX_OLD_UNOWN_X, 	// Unown X (Old)
	NATIONAL_DEX_OLD_UNOWN_Y, 	// Unown Y (Old)
	NATIONAL_DEX_OLD_UNOWN_Z, 	// Unown Z (Old)
};

const struct SpindaSpot gSpindaSpotGraphics[] =
{
    {16, 14, INCBIN_U16("graphics/spinda_spots/spot_0.bin")},
    {40, 15, INCBIN_U16("graphics/spinda_spots/spot_1.bin")},
    {22, 32, INCBIN_U16("graphics/spinda_spots/spot_2.bin")},
    {34, 33, INCBIN_U16("graphics/spinda_spots/spot_3.bin")}
};

#include "data/pokemon/item_effects.h"

const s8 gNatureStatTable[][5] =
{
    // Atk Def Spd Sp.Atk Sp.Def
    {    0,  0,  0,     0,     0}, // Hardy
    {   +1, -1,  0,     0,     0}, // Lonely
    {   +1,  0, -1,     0,     0}, // Brave
    {   +1,  0,  0,    -1,     0}, // Adamant
    {   +1,  0,  0,     0,    -1}, // Naughty
    {   -1, +1,  0,     0,     0}, // Bold
    {    0,  0,  0,     0,     0}, // Docile
    {    0, +1, -1,     0,     0}, // Relaxed
    {    0, +1,  0,    -1,     0}, // Impish
    {    0, +1,  0,     0,    -1}, // Lax
    {   -1,  0, +1,     0,     0}, // Timid
    {    0, -1, +1,     0,     0}, // Hasty
    {    0,  0,  0,     0,     0}, // Serious
    {    0,  0, +1,    -1,     0}, // Jolly
    {    0,  0, +1,     0,    -1}, // Naive
    {   -1,  0,  0,    +1,     0}, // Modest
    {    0, -1,  0,    +1,     0}, // Mild
    {    0,  0, -1,    +1,     0}, // Quiet
    {    0,  0,  0,     0,     0}, // Bashful
    {    0,  0,  0,    +1,    -1}, // Rash
    {   -1,  0,  0,     0,    +1}, // Calm
    {    0, -1,  0,     0,    +1}, // Gentle
    {    0,  0, -1,     0,    +1}, // Sassy
    {    0,  0,  0,    -1,    +1}, // Careful
    {    0,  0,  0,     0,     0} // Quirky
};

#include "data/pokemon/tmhm_learnsets.h"
#include "data/pokemon/trainer_class_lookups.h"
#include "data/pokemon/cry_ids.h"
#include "data/pokemon/experience_tables.h"
#include "data/pokemon/base_stats.h"
#include "data/pokemon/level_up_learnsets.h"
#include "data/pokemon/evolution.h"
#include "data/pokemon/level_up_learnset_pointers.h"

void ZeroBoxMonData(struct BoxPokemon *boxMon)
{
    u8 *raw = (u8 *)boxMon;
    u32 i;
    for (i = 0; i < sizeof(struct BoxPokemon); i++)
        raw[i] = 0;
}

void ZeroMonData(struct Pokemon *mon)
{
    u32 arg;
    ZeroBoxMonData(&mon->box);
    arg = 0;
    SetMonData(mon, MON_DATA_STATUS, &arg);
    SetMonData(mon, MON_DATA_LEVEL, &arg);
    SetMonData(mon, MON_DATA_HP, &arg);
    SetMonData(mon, MON_DATA_MAX_HP, &arg);
    SetMonData(mon, MON_DATA_ATK, &arg);
    SetMonData(mon, MON_DATA_DEF, &arg);
    SetMonData(mon, MON_DATA_SPEED, &arg);
    SetMonData(mon, MON_DATA_SPATK, &arg);
    SetMonData(mon, MON_DATA_SPDEF, &arg);
    arg = 255;
    SetMonData(mon, MON_DATA_MAIL, &arg);
}

void ZeroPlayerPartyMons(void)
{
    s32 i;
    for (i = 0; i < 6; i++)
        ZeroMonData(&gPlayerParty[i]);
}

void ZeroEnemyPartyMons(void)
{
    s32 i;
    for (i = 0; i < 6; i++)
        ZeroMonData(&gEnemyParty[i]);
}

void CreateMon(struct Pokemon *mon, u16 species, u8 level, u8 fixedIV, u8 hasFixedPersonality, u32 fixedPersonality, u8 otIdType, u32 fixedOtId)
{
    u32 arg;

    ZeroMonData(mon);
    CreateBoxMon(&mon->box, species, level, fixedIV, hasFixedPersonality, fixedPersonality, otIdType, fixedOtId);
    SetMonData(mon, MON_DATA_LEVEL, &level);
    arg = 255;
    SetMonData(mon, MON_DATA_MAIL, &arg);
    CalculateMonStats(mon);
}

void CreateBoxMon(struct BoxPokemon *boxMon, u16 species, u8 level, u8 fixedIV, u8 hasFixedPersonality, u32 fixedPersonality, u8 otIdType, u32 fixedOtId)
{
    u8 speciesName[POKEMON_NAME_LENGTH + 1];
    u32 personality;
    u32 value;
    u16 checksum;

    ZeroBoxMonData(boxMon);

    if (hasFixedPersonality)
        personality = fixedPersonality;
    else
        personality = Random32();

    SetBoxMonData(boxMon, MON_DATA_PERSONALITY, &personality);

    //Determine original trainer ID
    if (otIdType == 2) //Pokemon cannot be shiny
    {
        u32 shinyValue;
        do
        {
            value = Random32();
            shinyValue = HIHALF(value) ^ LOHALF(value) ^ HIHALF(personality) ^ LOHALF(personality);
        } while (shinyValue < 8);
    }
    else if (otIdType == 1) //Pokemon has a preset OT ID
    {
        value = fixedOtId;
    }
    else //Player is the OT
    {
        value = gSaveBlock2.playerTrainerId[0]
              | (gSaveBlock2.playerTrainerId[1] << 8)
              | (gSaveBlock2.playerTrainerId[2] << 16)
              | (gSaveBlock2.playerTrainerId[3] << 24);
    }

    SetBoxMonData(boxMon, MON_DATA_OT_ID, &value);

    checksum = CalculateBoxMonChecksum(boxMon);
    SetBoxMonData(boxMon, MON_DATA_CHECKSUM, &checksum);
    EncryptBoxMon(boxMon);
    GetSpeciesName(speciesName, species);
    SetBoxMonData(boxMon, MON_DATA_NICKNAME, speciesName);
    SetBoxMonData(boxMon, MON_DATA_LANGUAGE, &gGameLanguage);
    SetBoxMonData(boxMon, MON_DATA_OT_NAME, gSaveBlock2.playerName);
    SetBoxMonData(boxMon, MON_DATA_SPECIES, &species);
    SetBoxMonData(boxMon, MON_DATA_EXP, &gExperienceTables[gBaseStats[species].growthRate][level]);
    SetBoxMonData(boxMon, MON_DATA_FRIENDSHIP, &gBaseStats[species].friendship);
    value = sav1_map_get_name();
    SetBoxMonData(boxMon, MON_DATA_MET_LOCATION, &value);
    SetBoxMonData(boxMon, MON_DATA_MET_LEVEL, &level);
    SetBoxMonData(boxMon, MON_DATA_MET_GAME, &gGameVersion);
    value = 4;
    SetBoxMonData(boxMon, MON_DATA_POKEBALL, &value);
    SetBoxMonData(boxMon, MON_DATA_OT_GENDER, &gSaveBlock2.playerGender);

    if (fixedIV < 32)
    {
        SetBoxMonData(boxMon, MON_DATA_HP_IV, &fixedIV);
        SetBoxMonData(boxMon, MON_DATA_ATK_IV, &fixedIV);
        SetBoxMonData(boxMon, MON_DATA_DEF_IV, &fixedIV);
        SetBoxMonData(boxMon, MON_DATA_SPEED_IV, &fixedIV);
        SetBoxMonData(boxMon, MON_DATA_SPATK_IV, &fixedIV);
        SetBoxMonData(boxMon, MON_DATA_SPDEF_IV, &fixedIV);
    }
    else
    {
        u32 iv;
        value = Random();

        iv = value & 0x1F;
        SetBoxMonData(boxMon, MON_DATA_HP_IV, &iv);
        iv = (value & 0x3E0) >> 5;
        SetBoxMonData(boxMon, MON_DATA_ATK_IV, &iv);
        iv = (value & 0x7C00) >> 10;
        SetBoxMonData(boxMon, MON_DATA_DEF_IV, &iv);

        value = Random();

        iv = value & 0x1F;
        SetBoxMonData(boxMon, MON_DATA_SPEED_IV, &iv);
        iv = (value & 0x3E0) >> 5;
        SetBoxMonData(boxMon, MON_DATA_SPATK_IV, &iv);
        iv = (value & 0x7C00) >> 10;
        SetBoxMonData(boxMon, MON_DATA_SPDEF_IV, &iv);
    }

    if (gBaseStats[species].ability2)
    {
        value = personality & 1;
        SetBoxMonData(boxMon, MON_DATA_ALT_ABILITY, &value);
    }

    GiveBoxMonInitialMoveset(boxMon);
}

void CreateMonWithNature(struct Pokemon *mon, u16 species, u8 level, u8 fixedIV, u8 nature)
{
    u32 personality;

    do
    {
        personality = Random32();
    }
    while (nature != GetNatureFromPersonality(personality));

    CreateMon(mon, species, level, fixedIV, 1, personality, 0, 0);
}

void CreateMonWithGenderNatureLetter(struct Pokemon *mon, u16 species, u8 level, u8 fixedIV, u8 gender, u8 nature, u8 unownLetter)
{
    u32 personality;

    if ((u8)(unownLetter - 1) < 28)
    {
        u16 actualLetter;

        do
        {
            personality = Random32();
            actualLetter = ((((personality & 0x3000000) >> 18) | ((personality & 0x30000) >> 12) | ((personality & 0x300) >> 6) | (personality & 0x3)) % 28);
        }
        while (nature != GetNatureFromPersonality(personality)
            || gender != GetGenderFromSpeciesAndPersonality(species, personality)
            || actualLetter != unownLetter - 1);
    }
    else
    {
        do
        {
            personality = Random32();
        }
        while (nature != GetNatureFromPersonality(personality)
            || gender != GetGenderFromSpeciesAndPersonality(species, personality));
    }

    CreateMon(mon, species, level, fixedIV, 1, personality, 0, 0);
}

// This is only used to create Wally's Ralts.
void CreateMaleMon(struct Pokemon *mon, u16 species, u8 level)
{
    u32 personality;
    u32 otId;

    do
    {
        otId = Random32();
        personality = Random32();
    }
    while (GetGenderFromSpeciesAndPersonality(species, personality) != MON_MALE);
    CreateMon(mon, species, level, 32, 1, personality, 1, otId);
}

void CreateMonWithIVsPersonality(struct Pokemon *mon, u16 species, u8 level, u32 ivs, u32 personality)
{
    CreateMon(mon, species, level, 0, 1, personality, 0, 0);
    SetMonData(mon, MON_DATA_IVS, &ivs);
    CalculateMonStats(mon);
}

void CreateMonWithIVsOTID(struct Pokemon *mon, u16 species, u8 level, u8 *ivs, u32 otId)
{
    CreateMon(mon, species, level, 0, 0, 0, 1, otId);
    SetMonData(mon, MON_DATA_HP_IV, &ivs[0]);
    SetMonData(mon, MON_DATA_ATK_IV, &ivs[1]);
    SetMonData(mon, MON_DATA_DEF_IV, &ivs[2]);
    SetMonData(mon, MON_DATA_SPEED_IV, &ivs[3]);
    SetMonData(mon, MON_DATA_SPATK_IV, &ivs[4]);
    SetMonData(mon, MON_DATA_SPDEF_IV, &ivs[5]);
    CalculateMonStats(mon);
}

void CreateMonWithEVSpread(struct Pokemon *mon, u16 species, u8 level, u8 fixedIV, u8 evSpread)
{
    s32 i;
    s32 statCount = 0;
    u16 evAmount;
    u8 temp;

    CreateMon(mon, species, level, fixedIV, 0, 0, 0, 0);

    temp = evSpread;

    for (i = 0; i < 6; i++)
    {
        if (temp & 1)
            statCount++;
        temp >>= 1;
    }

    evAmount = 510 / statCount;

    temp = 1;

    for (i = 0; i < 6; i++)
    {
        if (evSpread & temp)
            SetMonData(mon, MON_DATA_HP_EV + i, &evAmount);
        temp <<= 1;
    }

    CalculateMonStats(mon);
}

void sub_803ADE8(struct Pokemon *mon, struct UnknownPokemonStruct *src)
{
    s32 i;
    u8 nickname[POKEMON_NAME_LENGTH + 1];
    u8 language;
    u8 value;

    CreateMon(mon, src->species, src->level, 0, 1, src->personality, 1, src->otId);

    for (i = 0; i < 4; i++)
        SetMonMoveSlot(mon, src->moves[i], i);

    SetMonData(mon, MON_DATA_PP_BONUSES, &src->ppBonuses);
    SetMonData(mon, MON_DATA_HELD_ITEM, &src->heldItem);

    StringCopy(nickname, src->nickname);

    if (nickname[0] == 0xFC && nickname[1] == 0x15)
        language = LANGUAGE_JAPANESE;
    else
        language = GAME_LANGUAGE;

    SetMonData(mon, MON_DATA_LANGUAGE, &language);
    Text_StripExtCtrlCodes(nickname);
    SetMonData(mon, MON_DATA_NICKNAME, nickname);
    SetMonData(mon, MON_DATA_FRIENDSHIP, &src->friendship);
    SetMonData(mon, MON_DATA_HP_EV, &src->hpEV);
    SetMonData(mon, MON_DATA_ATK_EV, &src->attackEV);
    SetMonData(mon, MON_DATA_DEF_EV, &src->defenseEV);
    SetMonData(mon, MON_DATA_SPEED_EV, &src->speedEV);
    SetMonData(mon, MON_DATA_SPATK_EV, &src->spAttackEV);
    SetMonData(mon, MON_DATA_SPDEF_EV, &src->spDefenseEV);
    value = src->altAbility;
    SetMonData(mon, MON_DATA_ALT_ABILITY, &value);
    value = src->hpIV;
    SetMonData(mon, MON_DATA_HP_IV, &value);
    value = src->attackIV;
    SetMonData(mon, MON_DATA_ATK_IV, &value);
    value = src->defenseIV;
    SetMonData(mon, MON_DATA_DEF_IV, &value);
    value = src->speedIV;
    SetMonData(mon, MON_DATA_SPEED_IV, &value);
    value = src->spAttackIV;
    SetMonData(mon, MON_DATA_SPATK_IV, &value);
    value = src->spDefenseIV;
    SetMonData(mon, MON_DATA_SPDEF_IV, &value);
    CalculateMonStats(mon);
}

void sub_803AF78(struct Pokemon *mon, struct UnknownPokemonStruct *dest)
{
    s32 i;
    u16 heldItem;

    dest->species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    heldItem = GetMonData(mon, MON_DATA_HELD_ITEM, NULL);

    if (heldItem == ITEM_ENIGMA_BERRY)
        heldItem = 0;

    dest->heldItem = heldItem;

    for (i = 0; i < 4; i++)
        dest->moves[i] = GetMonData(mon, MON_DATA_MOVE1 + i, NULL);

    dest->level = GetMonData(mon, MON_DATA_LEVEL, NULL);
    dest->ppBonuses = GetMonData(mon, MON_DATA_PP_BONUSES, NULL);
    dest->otId = GetMonData(mon, MON_DATA_OT_ID, NULL);
    dest->hpEV = GetMonData(mon, MON_DATA_HP_EV, NULL);
    dest->attackEV = GetMonData(mon, MON_DATA_ATK_EV, NULL);
    dest->defenseEV = GetMonData(mon, MON_DATA_DEF_EV, NULL);
    dest->speedEV = GetMonData(mon, MON_DATA_SPEED_EV, NULL);
    dest->spAttackEV = GetMonData(mon, MON_DATA_SPATK_EV, NULL);
    dest->spDefenseEV = GetMonData(mon, MON_DATA_SPDEF_EV, NULL);
    dest->friendship = GetMonData(mon, MON_DATA_FRIENDSHIP, NULL);
    dest->hpIV = GetMonData(mon, MON_DATA_HP_IV, NULL);
    dest->attackIV = GetMonData(mon, MON_DATA_ATK_IV, NULL);
    dest->defenseIV = GetMonData(mon, MON_DATA_DEF_IV, NULL);
    dest->speedIV  = GetMonData(mon, MON_DATA_SPEED_IV, NULL);
    dest->spAttackIV  = GetMonData(mon, MON_DATA_SPATK_IV, NULL);
    dest->spDefenseIV  = GetMonData(mon, MON_DATA_SPDEF_IV, NULL);
    dest->altAbility = GetMonData(mon, MON_DATA_ALT_ABILITY, NULL);
    dest->personality = GetMonData(mon, MON_DATA_PERSONALITY, NULL);
    GetMonData(mon, MON_DATA_NICKNAME, dest->nickname);
}

u16 CalculateBoxMonChecksum(struct BoxPokemon *boxMon)
{
    u16 checksum = 0;
    union PokemonSubstruct *substruct0 = GetSubstruct(boxMon, boxMon->personality, 0);
    union PokemonSubstruct *substruct1 = GetSubstruct(boxMon, boxMon->personality, 1);
    union PokemonSubstruct *substruct2 = GetSubstruct(boxMon, boxMon->personality, 2);
    union PokemonSubstruct *substruct3 = GetSubstruct(boxMon, boxMon->personality, 3);
    s32 i;

    for (i = 0; i < 6; i++)
        checksum += substruct0->raw[i];

    for (i = 0; i < 6; i++)
        checksum += substruct1->raw[i];

    for (i = 0; i < 6; i++)
        checksum += substruct2->raw[i];

    for (i = 0; i < 6; i++)
        checksum += substruct3->raw[i];

    return checksum;
}

#define CALC_STAT(base, iv, ev, statIndex, field)               \
{                                                               \
    u8 baseStat = gBaseStats[species].base;                     \
    s32 n = (((2 * baseStat + iv + ev / 4) * level) / 100) + 5; \
    u8 nature = GetNature(mon);                                 \
    n = nature_stat_mod(nature, n, statIndex);                  \
    SetMonData(mon, field, &n);                                 \
}

void CalculateMonStats(struct Pokemon *mon)
{
    s32 oldMaxHP = GetMonData(mon, MON_DATA_MAX_HP, NULL);
    s32 currentHP = GetMonData(mon, MON_DATA_HP, NULL);
    s32 hpIV = GetMonData(mon, MON_DATA_HP_IV, NULL);
    s32 hpEV = GetMonData(mon, MON_DATA_HP_EV, NULL);
    s32 attackIV = GetMonData(mon, MON_DATA_ATK_IV, NULL);
    s32 attackEV = GetMonData(mon, MON_DATA_ATK_EV, NULL);
    s32 defenseIV = GetMonData(mon, MON_DATA_DEF_IV, NULL);
    s32 defenseEV = GetMonData(mon, MON_DATA_DEF_EV, NULL);
    s32 speedIV = GetMonData(mon, MON_DATA_SPEED_IV, NULL);
    s32 speedEV = GetMonData(mon, MON_DATA_SPEED_EV, NULL);
    s32 spAttackIV = GetMonData(mon, MON_DATA_SPATK_IV, NULL);
    s32 spAttackEV = GetMonData(mon, MON_DATA_SPATK_EV, NULL);
    s32 spDefenseIV = GetMonData(mon, MON_DATA_SPDEF_IV, NULL);
    s32 spDefenseEV = GetMonData(mon, MON_DATA_SPDEF_EV, NULL);
    u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    s32 level = GetLevelFromMonExp(mon);
    s32 newMaxHP;

    SetMonData(mon, MON_DATA_LEVEL, &level);

    if (species == SPECIES_SHEDINJA)
    {
        newMaxHP = 1;
    }
    else
    {
        s32 n = 2 * gBaseStats[species].baseHP + hpIV;
        newMaxHP = (((n + hpEV / 4) * level) / 100) + level + 10;
    }

    eStatHp = newMaxHP - oldMaxHP;
    if (eStatHp == 0)
        eStatHp = 1;

    SetMonData(mon, MON_DATA_MAX_HP, &newMaxHP);

    CALC_STAT(baseAttack, attackIV, attackEV, 1, MON_DATA_ATK)
    CALC_STAT(baseDefense, defenseIV, defenseEV, 2, MON_DATA_DEF)
    CALC_STAT(baseSpeed, speedIV, speedEV, 3, MON_DATA_SPEED)
    CALC_STAT(baseSpAttack, spAttackIV, spAttackEV, 4, MON_DATA_SPATK)
    CALC_STAT(baseSpDefense, spDefenseIV, spDefenseEV, 5, MON_DATA_SPDEF)

    if (species == SPECIES_SHEDINJA)
    {
        if (currentHP != 0 || oldMaxHP == 0)
            currentHP = 1;
        else
            return;
    }
    else
    {
        if (currentHP == 0 && oldMaxHP == 0)
            currentHP = newMaxHP;
        else if (currentHP != 0)
            currentHP += newMaxHP - oldMaxHP;
        else
            return;
    }

    SetMonData(mon, MON_DATA_HP, &currentHP);
}

#if DEBUG
void Nakamura_NakaGenderTest_RecalcStats(struct Pokemon *mon)
{
    s32 currentHP = GetMonData(mon, MON_DATA_HP, NULL);
    s32 hpIV = GetMonData(mon, MON_DATA_HP_IV, NULL);
    s32 hpEV = GetMonData(mon, MON_DATA_HP_EV, NULL);
    s32 attackIV = GetMonData(mon, MON_DATA_ATK_IV, NULL);
    s32 attackEV = GetMonData(mon, MON_DATA_ATK_EV, NULL);
    s32 defenseIV = GetMonData(mon, MON_DATA_DEF_IV, NULL);
    s32 defenseEV = GetMonData(mon, MON_DATA_DEF_EV, NULL);
    s32 speedIV = GetMonData(mon, MON_DATA_SPEED_IV, NULL);
    s32 speedEV = GetMonData(mon, MON_DATA_SPEED_EV, NULL);
    s32 spAttackIV = GetMonData(mon, MON_DATA_SPATK_IV, NULL);
    s32 spAttackEV = GetMonData(mon, MON_DATA_SPATK_EV, NULL);
    s32 spDefenseIV = GetMonData(mon, MON_DATA_SPDEF_IV, NULL);
    s32 spDefenseEV = GetMonData(mon, MON_DATA_SPDEF_EV, NULL);
    u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    s32 level = GetLevelFromMonExp(mon);
    s32 newMaxHP;

    SetMonData(mon, MON_DATA_LEVEL, &level);

    if (species == SPECIES_SHEDINJA)
    {
        newMaxHP = 1;
    }
    else
    {
        s32 n = 2 * gBaseStats[species].baseHP + hpIV;
        newMaxHP = (((n + hpEV / 4) * level) / 100) + level + 10;
    }

    SetMonData(mon, MON_DATA_MAX_HP, &newMaxHP);

    CALC_STAT(baseAttack, attackIV, attackEV, 1, MON_DATA_ATK)
    CALC_STAT(baseDefense, defenseIV, defenseEV, 2, MON_DATA_DEF)
    CALC_STAT(baseSpeed, speedIV, speedEV, 3, MON_DATA_SPEED)
    CALC_STAT(baseSpAttack, spAttackIV, spAttackEV, 4, MON_DATA_SPATK)
    CALC_STAT(baseSpDefense, spDefenseIV, spDefenseEV, 5, MON_DATA_SPDEF)

    if (newMaxHP < currentHP)
        currentHP = newMaxHP;

    SetMonData(mon, MON_DATA_HP, &currentHP);
}
#endif

void ExpandBoxMon(const struct BoxPokemon *src, struct Pokemon *dest)
{
    u32 value = 0;
    dest->box = *src;
    SetMonData(dest, MON_DATA_STATUS, &value);
    SetMonData(dest, MON_DATA_HP, &value);
    SetMonData(dest, MON_DATA_MAX_HP, &value);
    value = 255;
    SetMonData(dest, MON_DATA_MAIL, &value);
    CalculateMonStats(dest);
}

u8 GetLevelFromMonExp(struct Pokemon *mon)
{
    u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    u32 exp = GetMonData(mon, MON_DATA_EXP, NULL);
    s32 level = 1;

    while (level <= 100 && gExperienceTables[gBaseStats[species].growthRate][level] <= exp)
        level++;

    return level - 1;
}

u8 GetLevelFromBoxMonExp(struct BoxPokemon *boxMon)
{
    u16 species = GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL);
    u32 exp = GetBoxMonData(boxMon, MON_DATA_EXP, NULL);
    s32 level = 1;

    while (level <= 100 && gExperienceTables[gBaseStats[species].growthRate][level] <= exp)
        level++;

    return level - 1;
}

u16 GiveMoveToMon(struct Pokemon *mon, u16 move)
{
    return GiveMoveToBoxMon(&mon->box, move);
}

u16 GiveMoveToBoxMon(struct BoxPokemon *boxMon, u16 move)
{
    s32 i;
    for (i = 0; i < 4; i++)
    {
        u16 existingMove = GetBoxMonData(boxMon, MON_DATA_MOVE1 + i, NULL);
        if (!existingMove)
        {
            SetBoxMonData(boxMon, MON_DATA_MOVE1 + i, &move);
            SetBoxMonData(boxMon, MON_DATA_PP1 + i, &gBattleMoves[move].pp);
            return move;
        }
        if (existingMove == move)
            return -2;
    }
    return -1;
}

u16 GiveMoveToBattleMon(struct BattlePokemon *mon, u16 move)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        if (!mon->moves[i])
        {
            mon->moves[i] = move;
            mon->pp[i] = gBattleMoves[move].pp;
            return move;
        }
    }

    return -1;
}

void SetMonMoveSlot(struct Pokemon *mon, u16 move, u8 slot)
{
    SetMonData(mon, MON_DATA_MOVE1 + slot, &move);
    SetMonData(mon, MON_DATA_PP1 + slot, &gBattleMoves[move].pp);
}

void SetBattleMonMoveSlot(struct BattlePokemon *mon, u16 move, u8 slot)
{
    mon->moves[slot] = move;
    mon->pp[slot] = gBattleMoves[move].pp;
}

void GiveMonInitialMoveset(struct Pokemon *mon)
{
    GiveBoxMonInitialMoveset(&mon->box);
}

void GiveBoxMonInitialMoveset(struct BoxPokemon *boxMon)
{
    u16 species = GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL);
    s32 level = GetLevelFromBoxMonExp(boxMon);
    s32 i;

    for (i = 0; gLevelUpLearnsets[species][i] != (u16)-1; i++)
    {
        u16 moveLevel;
        u16 move;

        moveLevel = (gLevelUpLearnsets[species][i] & 0xFE00);

        if (moveLevel > (level << 9))
            break;

        move = (gLevelUpLearnsets[species][i] & 0x1FF);

        if (GiveMoveToBoxMon(boxMon, move) == (u16)-1)
            DeleteFirstMoveAndGiveMoveToBoxMon(boxMon, move);
    }
}

u16 MonTryLearningNewMove(struct Pokemon *mon, bool8 firstMove)
{
    u32 retVal = 0;
    u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    u8 level = GetMonData(mon, MON_DATA_LEVEL, NULL);

    // since you can learn more than one move per level
    // the game needs to know whether you decided to
    // learn it or keep the old set to avoid asking
    // you to learn the same move over and over again
    if (firstMove)
    {
        sLearningMoveTableID = 0;

        while ((gLevelUpLearnsets[species][sLearningMoveTableID] & 0xFE00) != (level << 9))
        {
            sLearningMoveTableID++;
            if (gLevelUpLearnsets[species][sLearningMoveTableID] == 0xFFFF)
                return 0;
        }
    }

    if ((gLevelUpLearnsets[species][sLearningMoveTableID] & 0xFE00) == (level << 9))
    {
        gMoveToLearn = (gLevelUpLearnsets[species][sLearningMoveTableID] & 0x1FF);
        sLearningMoveTableID++;
        retVal = GiveMoveToMon(mon, gMoveToLearn);
    }

    return retVal;
}

void DeleteFirstMoveAndGiveMoveToMon(struct Pokemon *mon, u16 move)
{
    s32 i;
    u16 moves[4];
    u8 pp[4];
    u8 ppBonuses;

    for (i = 0; i < 3; i++)
    {
        moves[i] = GetMonData(mon, MON_DATA_MOVE2 + i, NULL);
        pp[i] = GetMonData(mon, MON_DATA_PP2 + i, NULL);
    }

    ppBonuses = GetMonData(mon, MON_DATA_PP_BONUSES, NULL);
    ppBonuses >>= 2;
    moves[3] = move;
    pp[3] = gBattleMoves[move].pp;

    for (i = 0; i < 4; i++)
    {
        SetMonData(mon, MON_DATA_MOVE1 + i, &moves[i]);
        SetMonData(mon, MON_DATA_PP1 + i, &pp[i]);
    }

    SetMonData(mon, MON_DATA_PP_BONUSES, &ppBonuses);
}

void DeleteFirstMoveAndGiveMoveToBoxMon(struct BoxPokemon *boxMon, u16 move)
{
    s32 i;
    u16 moves[4];
    u8 pp[4];
    u8 ppBonuses;

    for (i = 0; i < 3; i++)
    {
        moves[i] = GetBoxMonData(boxMon, MON_DATA_MOVE2 + i, NULL);
        pp[i] = GetBoxMonData(boxMon, MON_DATA_PP2 + i, NULL);
    }

    ppBonuses = GetBoxMonData(boxMon, MON_DATA_PP_BONUSES, NULL);
    ppBonuses >>= 2;
    moves[3] = move;
    pp[3] = gBattleMoves[move].pp;

    for (i = 0; i < 4; i++)
    {
        SetBoxMonData(boxMon, MON_DATA_MOVE1 + i, &moves[i]);
        SetBoxMonData(boxMon, MON_DATA_PP1 + i, &pp[i]);
    }

    SetBoxMonData(boxMon, MON_DATA_PP_BONUSES, &ppBonuses);
}
