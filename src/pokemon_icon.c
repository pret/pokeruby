#include "global.h"
#include "graphics.h"
#include "mail_data.h"
#include "constants/species.h"
#include "sprite.h"

#define POKE_ICON_BASE_PAL_TAG 56000

struct MonIconSpriteTemplate
{
    const struct OamData *oam;
    const u8 *image;
    const union AnimCmd *const *anims;
    const union AffineAnimCmd *const *affineAnims;
    void (*callback)(struct Sprite *);
    u16 paletteTag;
};

const u8 * const gMonIconTable[] =
{
    [SPECIES_NONE] = gMonIcon_Bulbasaur,
    [SPECIES_BULBASAUR] = gMonIcon_Bulbasaur,
    [SPECIES_IVYSAUR] = gMonIcon_Ivysaur,
    [SPECIES_VENUSAUR] = gMonIcon_Venusaur,
    [SPECIES_CHARMANDER] = gMonIcon_Charmander,
    [SPECIES_CHARMELEON] = gMonIcon_Charmeleon,
    [SPECIES_CHARIZARD] = gMonIcon_Charizard,
    [SPECIES_SQUIRTLE] = gMonIcon_Squirtle,
    [SPECIES_WARTORTLE] = gMonIcon_Wartortle,
    [SPECIES_BLASTOISE] = gMonIcon_Blastoise,
    [SPECIES_CATERPIE] = gMonIcon_Caterpie,
    [SPECIES_METAPOD] = gMonIcon_Metapod,
    [SPECIES_BUTTERFREE] = gMonIcon_Butterfree,
    [SPECIES_WEEDLE] = gMonIcon_Weedle,
    [SPECIES_KAKUNA] = gMonIcon_Kakuna,
    [SPECIES_BEEDRILL] = gMonIcon_Beedrill,
    [SPECIES_PIDGEY] = gMonIcon_Pidgey,
    [SPECIES_PIDGEOTTO] = gMonIcon_Pidgeotto,
    [SPECIES_PIDGEOT] = gMonIcon_Pidgeot,
    [SPECIES_RATTATA] = gMonIcon_Rattata,
    [SPECIES_RATICATE] = gMonIcon_Raticate,
    [SPECIES_SPEAROW] = gMonIcon_Spearow,
    [SPECIES_FEAROW] = gMonIcon_Fearow,
    [SPECIES_EKANS] = gMonIcon_Ekans,
    [SPECIES_ARBOK] = gMonIcon_Arbok,
    [SPECIES_PIKACHU] = gMonIcon_Pikachu,
    [SPECIES_RAICHU] = gMonIcon_Raichu,
    [SPECIES_SANDSHREW] = gMonIcon_Sandshrew,
    [SPECIES_SANDSLASH] = gMonIcon_Sandslash,
    [SPECIES_NIDORAN_F] = gMonIcon_NidoranF,
    [SPECIES_NIDORINA] = gMonIcon_Nidorina,
    [SPECIES_NIDOQUEEN] = gMonIcon_Nidoqueen,
    [SPECIES_NIDORAN_M] = gMonIcon_NidoranM,
    [SPECIES_NIDORINO] = gMonIcon_Nidorino,
    [SPECIES_NIDOKING] = gMonIcon_Nidoking,
    [SPECIES_CLEFAIRY] = gMonIcon_Clefairy,
    [SPECIES_CLEFABLE] = gMonIcon_Clefable,
    [SPECIES_VULPIX] = gMonIcon_Vulpix,
    [SPECIES_NINETALES] = gMonIcon_Ninetales,
    [SPECIES_JIGGLYPUFF] = gMonIcon_Jigglypuff,
    [SPECIES_WIGGLYTUFF] = gMonIcon_Wigglytuff,
    [SPECIES_ZUBAT] = gMonIcon_Zubat,
    [SPECIES_GOLBAT] = gMonIcon_Golbat,
    [SPECIES_ODDISH] = gMonIcon_Oddish,
    [SPECIES_GLOOM] = gMonIcon_Gloom,
    [SPECIES_VILEPLUME] = gMonIcon_Vileplume,
    [SPECIES_PARAS] = gMonIcon_Paras,
    [SPECIES_PARASECT] = gMonIcon_Parasect,
    [SPECIES_VENONAT] = gMonIcon_Venonat,
    [SPECIES_VENOMOTH] = gMonIcon_Venomoth,
    [SPECIES_DIGLETT] = gMonIcon_Diglett,
    [SPECIES_DUGTRIO] = gMonIcon_Dugtrio,
    [SPECIES_MEOWTH] = gMonIcon_Meowth,
    [SPECIES_PERSIAN] = gMonIcon_Persian,
    [SPECIES_PSYDUCK] = gMonIcon_Psyduck,
    [SPECIES_GOLDUCK] = gMonIcon_Golduck,
    [SPECIES_MANKEY] = gMonIcon_Mankey,
    [SPECIES_PRIMEAPE] = gMonIcon_Primeape,
    [SPECIES_GROWLITHE] = gMonIcon_Growlithe,
    [SPECIES_ARCANINE] = gMonIcon_Arcanine,
    [SPECIES_POLIWAG] = gMonIcon_Poliwag,
    [SPECIES_POLIWHIRL] = gMonIcon_Poliwhirl,
    [SPECIES_POLIWRATH] = gMonIcon_Poliwrath,
    [SPECIES_ABRA] = gMonIcon_Abra,
    [SPECIES_KADABRA] = gMonIcon_Kadabra,
    [SPECIES_ALAKAZAM] = gMonIcon_Alakazam,
    [SPECIES_MACHOP] = gMonIcon_Machop,
    [SPECIES_MACHOKE] = gMonIcon_Machoke,
    [SPECIES_MACHAMP] = gMonIcon_Machamp,
    [SPECIES_BELLSPROUT] = gMonIcon_Bellsprout,
    [SPECIES_WEEPINBELL] = gMonIcon_Weepinbell,
    [SPECIES_VICTREEBEL] = gMonIcon_Victreebel,
    [SPECIES_TENTACOOL] = gMonIcon_Tentacool,
    [SPECIES_TENTACRUEL] = gMonIcon_Tentacruel,
    [SPECIES_GEODUDE] = gMonIcon_Geodude,
    [SPECIES_GRAVELER] = gMonIcon_Graveler,
    [SPECIES_GOLEM] = gMonIcon_Golem,
    [SPECIES_PONYTA] = gMonIcon_Ponyta,
    [SPECIES_RAPIDASH] = gMonIcon_Rapidash,
    [SPECIES_SLOWPOKE] = gMonIcon_Slowpoke,
    [SPECIES_SLOWBRO] = gMonIcon_Slowbro,
    [SPECIES_MAGNEMITE] = gMonIcon_Magnemite,
    [SPECIES_MAGNETON] = gMonIcon_Magneton,
    [SPECIES_FARFETCHD] = gMonIcon_Farfetchd,
    [SPECIES_DODUO] = gMonIcon_Doduo,
    [SPECIES_DODRIO] = gMonIcon_Dodrio,
    [SPECIES_SEEL] = gMonIcon_Seel,
    [SPECIES_DEWGONG] = gMonIcon_Dewgong,
    [SPECIES_GRIMER] = gMonIcon_Grimer,
    [SPECIES_MUK] = gMonIcon_Muk,
    [SPECIES_SHELLDER] = gMonIcon_Shellder,
    [SPECIES_CLOYSTER] = gMonIcon_Cloyster,
    [SPECIES_GASTLY] = gMonIcon_Gastly,
    [SPECIES_HAUNTER] = gMonIcon_Haunter,
    [SPECIES_GENGAR] = gMonIcon_Gengar,
    [SPECIES_ONIX] = gMonIcon_Onix,
    [SPECIES_DROWZEE] = gMonIcon_Drowzee,
    [SPECIES_HYPNO] = gMonIcon_Hypno,
    [SPECIES_KRABBY] = gMonIcon_Krabby,
    [SPECIES_KINGLER] = gMonIcon_Kingler,
    [SPECIES_VOLTORB] = gMonIcon_Voltorb,
    [SPECIES_ELECTRODE] = gMonIcon_Electrode,
    [SPECIES_EXEGGCUTE] = gMonIcon_Exeggcute,
    [SPECIES_EXEGGUTOR] = gMonIcon_Exeggutor,
    [SPECIES_CUBONE] = gMonIcon_Cubone,
    [SPECIES_MAROWAK] = gMonIcon_Marowak,
    [SPECIES_HITMONLEE] = gMonIcon_Hitmonlee,
    [SPECIES_HITMONCHAN] = gMonIcon_Hitmonchan,
    [SPECIES_LICKITUNG] = gMonIcon_Lickitung,
    [SPECIES_KOFFING] = gMonIcon_Koffing,
    [SPECIES_WEEZING] = gMonIcon_Weezing,
    [SPECIES_RHYHORN] = gMonIcon_Rhyhorn,
    [SPECIES_RHYDON] = gMonIcon_Rhydon,
    [SPECIES_CHANSEY] = gMonIcon_Chansey,
    [SPECIES_TANGELA] = gMonIcon_Tangela,
    [SPECIES_KANGASKHAN] = gMonIcon_Kangaskhan,
    [SPECIES_HORSEA] = gMonIcon_Horsea,
    [SPECIES_SEADRA] = gMonIcon_Seadra,
    [SPECIES_GOLDEEN] = gMonIcon_Goldeen,
    [SPECIES_SEAKING] = gMonIcon_Seaking,
    [SPECIES_STARYU] = gMonIcon_Staryu,
    [SPECIES_STARMIE] = gMonIcon_Starmie,
    [SPECIES_MR_MIME] = gMonIcon_Mrmime,
    [SPECIES_SCYTHER] = gMonIcon_Scyther,
    [SPECIES_JYNX] = gMonIcon_Jynx,
    [SPECIES_ELECTABUZZ] = gMonIcon_Electabuzz,
    [SPECIES_MAGMAR] = gMonIcon_Magmar,
    [SPECIES_PINSIR] = gMonIcon_Pinsir,
    [SPECIES_TAUROS] = gMonIcon_Tauros,
    [SPECIES_MAGIKARP] = gMonIcon_Magikarp,
    [SPECIES_GYARADOS] = gMonIcon_Gyarados,
    [SPECIES_LAPRAS] = gMonIcon_Lapras,
    [SPECIES_DITTO] = gMonIcon_Ditto,
    [SPECIES_EEVEE] = gMonIcon_Eevee,
    [SPECIES_VAPOREON] = gMonIcon_Vaporeon,
    [SPECIES_JOLTEON] = gMonIcon_Jolteon,
    [SPECIES_FLAREON] = gMonIcon_Flareon,
    [SPECIES_PORYGON] = gMonIcon_Porygon,
    [SPECIES_OMANYTE] = gMonIcon_Omanyte,
    [SPECIES_OMASTAR] = gMonIcon_Omastar,
    [SPECIES_KABUTO] = gMonIcon_Kabuto,
    [SPECIES_KABUTOPS] = gMonIcon_Kabutops,
    [SPECIES_AERODACTYL] = gMonIcon_Aerodactyl,
    [SPECIES_SNORLAX] = gMonIcon_Snorlax,
    [SPECIES_ARTICUNO] = gMonIcon_Articuno,
    [SPECIES_ZAPDOS] = gMonIcon_Zapdos,
    [SPECIES_MOLTRES] = gMonIcon_Moltres,
    [SPECIES_DRATINI] = gMonIcon_Dratini,
    [SPECIES_DRAGONAIR] = gMonIcon_Dragonair,
    [SPECIES_DRAGONITE] = gMonIcon_Dragonite,
    [SPECIES_MEWTWO] = gMonIcon_Mewtwo,
    [SPECIES_MEW] = gMonIcon_Mew,
    [SPECIES_CHIKORITA] = gMonIcon_Chikorita,
    [SPECIES_BAYLEEF] = gMonIcon_Bayleef,
    [SPECIES_MEGANIUM] = gMonIcon_Meganium,
    [SPECIES_CYNDAQUIL] = gMonIcon_Cyndaquil,
    [SPECIES_QUILAVA] = gMonIcon_Quilava,
    [SPECIES_TYPHLOSION] = gMonIcon_Typhlosion,
    [SPECIES_TOTODILE] = gMonIcon_Totodile,
    [SPECIES_CROCONAW] = gMonIcon_Croconaw,
    [SPECIES_FERALIGATR] = gMonIcon_Feraligatr,
    [SPECIES_SENTRET] = gMonIcon_Sentret,
    [SPECIES_FURRET] = gMonIcon_Furret,
    [SPECIES_HOOTHOOT] = gMonIcon_Hoothoot,
    [SPECIES_NOCTOWL] = gMonIcon_Noctowl,
    [SPECIES_LEDYBA] = gMonIcon_Ledyba,
    [SPECIES_LEDIAN] = gMonIcon_Ledian,
    [SPECIES_SPINARAK] = gMonIcon_Spinarak,
    [SPECIES_ARIADOS] = gMonIcon_Ariados,
    [SPECIES_CROBAT] = gMonIcon_Crobat,
    [SPECIES_CHINCHOU] = gMonIcon_Chinchou,
    [SPECIES_LANTURN] = gMonIcon_Lanturn,
    [SPECIES_PICHU] = gMonIcon_Pichu,
    [SPECIES_CLEFFA] = gMonIcon_Cleffa,
    [SPECIES_IGGLYBUFF] = gMonIcon_Igglybuff,
    [SPECIES_TOGEPI] = gMonIcon_Togepi,
    [SPECIES_TOGETIC] = gMonIcon_Togetic,
    [SPECIES_NATU] = gMonIcon_Natu,
    [SPECIES_XATU] = gMonIcon_Xatu,
    [SPECIES_MAREEP] = gMonIcon_Mareep,
    [SPECIES_FLAAFFY] = gMonIcon_Flaaffy,
    [SPECIES_AMPHAROS] = gMonIcon_Ampharos,
    [SPECIES_BELLOSSOM] = gMonIcon_Bellossom,
    [SPECIES_MARILL] = gMonIcon_Marill,
    [SPECIES_AZUMARILL] = gMonIcon_Azumarill,
    [SPECIES_SUDOWOODO] = gMonIcon_Sudowoodo,
    [SPECIES_POLITOED] = gMonIcon_Politoed,
    [SPECIES_HOPPIP] = gMonIcon_Hoppip,
    [SPECIES_SKIPLOOM] = gMonIcon_Skiploom,
    [SPECIES_JUMPLUFF] = gMonIcon_Jumpluff,
    [SPECIES_AIPOM] = gMonIcon_Aipom,
    [SPECIES_SUNKERN] = gMonIcon_Sunkern,
    [SPECIES_SUNFLORA] = gMonIcon_Sunflora,
    [SPECIES_YANMA] = gMonIcon_Yanma,
    [SPECIES_WOOPER] = gMonIcon_Wooper,
    [SPECIES_QUAGSIRE] = gMonIcon_Quagsire,
    [SPECIES_ESPEON] = gMonIcon_Espeon,
    [SPECIES_UMBREON] = gMonIcon_Umbreon,
    [SPECIES_MURKROW] = gMonIcon_Murkrow,
    [SPECIES_SLOWKING] = gMonIcon_Slowking,
    [SPECIES_MISDREAVUS] = gMonIcon_Misdreavus,
    [SPECIES_UNOWN] = gMonIcon_UnownA,
    [SPECIES_WOBBUFFET] = gMonIcon_Wobbuffet,
    [SPECIES_GIRAFARIG] = gMonIcon_Girafarig,
    [SPECIES_PINECO] = gMonIcon_Pineco,
    [SPECIES_FORRETRESS] = gMonIcon_Forretress,
    [SPECIES_DUNSPARCE] = gMonIcon_Dunsparce,
    [SPECIES_GLIGAR] = gMonIcon_Gligar,
    [SPECIES_STEELIX] = gMonIcon_Steelix,
    [SPECIES_SNUBBULL] = gMonIcon_Snubbull,
    [SPECIES_GRANBULL] = gMonIcon_Granbull,
    [SPECIES_QWILFISH] = gMonIcon_Qwilfish,
    [SPECIES_SCIZOR] = gMonIcon_Scizor,
    [SPECIES_SHUCKLE] = gMonIcon_Shuckle,
    [SPECIES_HERACROSS] = gMonIcon_Heracross,
    [SPECIES_SNEASEL] = gMonIcon_Sneasel,
    [SPECIES_TEDDIURSA] = gMonIcon_Teddiursa,
    [SPECIES_URSARING] = gMonIcon_Ursaring,
    [SPECIES_SLUGMA] = gMonIcon_Slugma,
    [SPECIES_MAGCARGO] = gMonIcon_Magcargo,
    [SPECIES_SWINUB] = gMonIcon_Swinub,
    [SPECIES_PILOSWINE] = gMonIcon_Piloswine,
    [SPECIES_CORSOLA] = gMonIcon_Corsola,
    [SPECIES_REMORAID] = gMonIcon_Remoraid,
    [SPECIES_OCTILLERY] = gMonIcon_Octillery,
    [SPECIES_DELIBIRD] = gMonIcon_Delibird,
    [SPECIES_MANTINE] = gMonIcon_Mantine,
    [SPECIES_SKARMORY] = gMonIcon_Skarmory,
    [SPECIES_HOUNDOUR] = gMonIcon_Houndour,
    [SPECIES_HOUNDOOM] = gMonIcon_Houndoom,
    [SPECIES_KINGDRA] = gMonIcon_Kingdra,
    [SPECIES_PHANPY] = gMonIcon_Phanpy,
    [SPECIES_DONPHAN] = gMonIcon_Donphan,
    [SPECIES_PORYGON2] = gMonIcon_Porygon2,
    [SPECIES_STANTLER] = gMonIcon_Stantler,
    [SPECIES_SMEARGLE] = gMonIcon_Smeargle,
    [SPECIES_TYROGUE] = gMonIcon_Tyrogue,
    [SPECIES_HITMONTOP] = gMonIcon_Hitmontop,
    [SPECIES_SMOOCHUM] = gMonIcon_Smoochum,
    [SPECIES_ELEKID] = gMonIcon_Elekid,
    [SPECIES_MAGBY] = gMonIcon_Magby,
    [SPECIES_MILTANK] = gMonIcon_Miltank,
    [SPECIES_BLISSEY] = gMonIcon_Blissey,
    [SPECIES_RAIKOU] = gMonIcon_Raikou,
    [SPECIES_ENTEI] = gMonIcon_Entei,
    [SPECIES_SUICUNE] = gMonIcon_Suicune,
    [SPECIES_LARVITAR] = gMonIcon_Larvitar,
    [SPECIES_PUPITAR] = gMonIcon_Pupitar,
    [SPECIES_TYRANITAR] = gMonIcon_Tyranitar,
    [SPECIES_LUGIA] = gMonIcon_Lugia,
    [SPECIES_HO_OH] = gMonIcon_HoOh,
    [SPECIES_CELEBI] = gMonIcon_Celebi,
    [SPECIES_OLD_UNOWN_B] = gMonIcon_QuestionMark,
    [SPECIES_OLD_UNOWN_C] = gMonIcon_QuestionMark,
    [SPECIES_OLD_UNOWN_D] = gMonIcon_QuestionMark,
    [SPECIES_OLD_UNOWN_E] = gMonIcon_QuestionMark,
    [SPECIES_OLD_UNOWN_F] = gMonIcon_QuestionMark,
    [SPECIES_OLD_UNOWN_G] = gMonIcon_QuestionMark,
    [SPECIES_OLD_UNOWN_H] = gMonIcon_QuestionMark,
    [SPECIES_OLD_UNOWN_I] = gMonIcon_QuestionMark,
    [SPECIES_OLD_UNOWN_J] = gMonIcon_QuestionMark,
    [SPECIES_OLD_UNOWN_K] = gMonIcon_QuestionMark,
    [SPECIES_OLD_UNOWN_L] = gMonIcon_QuestionMark,
    [SPECIES_OLD_UNOWN_M] = gMonIcon_QuestionMark,
    [SPECIES_OLD_UNOWN_N] = gMonIcon_QuestionMark,
    [SPECIES_OLD_UNOWN_O] = gMonIcon_QuestionMark,
    [SPECIES_OLD_UNOWN_P] = gMonIcon_QuestionMark,
    [SPECIES_OLD_UNOWN_Q] = gMonIcon_QuestionMark,
    [SPECIES_OLD_UNOWN_R] = gMonIcon_QuestionMark,
    [SPECIES_OLD_UNOWN_S] = gMonIcon_QuestionMark,
    [SPECIES_OLD_UNOWN_T] = gMonIcon_QuestionMark,
    [SPECIES_OLD_UNOWN_U] = gMonIcon_QuestionMark,
    [SPECIES_OLD_UNOWN_V] = gMonIcon_QuestionMark,
    [SPECIES_OLD_UNOWN_W] = gMonIcon_QuestionMark,
    [SPECIES_OLD_UNOWN_X] = gMonIcon_QuestionMark,
    [SPECIES_OLD_UNOWN_Y] = gMonIcon_QuestionMark,
    [SPECIES_OLD_UNOWN_Z] = gMonIcon_QuestionMark,
    [SPECIES_TREECKO] = gMonIcon_Treecko,
    [SPECIES_GROVYLE] = gMonIcon_Grovyle,
    [SPECIES_SCEPTILE] = gMonIcon_Sceptile,
    [SPECIES_TORCHIC] = gMonIcon_Torchic,
    [SPECIES_COMBUSKEN] = gMonIcon_Combusken,
    [SPECIES_BLAZIKEN] = gMonIcon_Blaziken,
    [SPECIES_MUDKIP] = gMonIcon_Mudkip,
    [SPECIES_MARSHTOMP] = gMonIcon_Marshtomp,
    [SPECIES_SWAMPERT] = gMonIcon_Swampert,
    [SPECIES_POOCHYENA] = gMonIcon_Poochyena,
    [SPECIES_MIGHTYENA] = gMonIcon_Mightyena,
    [SPECIES_ZIGZAGOON] = gMonIcon_Zigzagoon,
    [SPECIES_LINOONE] = gMonIcon_Linoone,
    [SPECIES_WURMPLE] = gMonIcon_Wurmple,
    [SPECIES_SILCOON] = gMonIcon_Silcoon,
    [SPECIES_BEAUTIFLY] = gMonIcon_Beautifly,
    [SPECIES_CASCOON] = gMonIcon_Cascoon,
    [SPECIES_DUSTOX] = gMonIcon_Dustox,
    [SPECIES_LOTAD] = gMonIcon_Lotad,
    [SPECIES_LOMBRE] = gMonIcon_Lombre,
    [SPECIES_LUDICOLO] = gMonIcon_Ludicolo,
    [SPECIES_SEEDOT] = gMonIcon_Seedot,
    [SPECIES_NUZLEAF] = gMonIcon_Nuzleaf,
    [SPECIES_SHIFTRY] = gMonIcon_Shiftry,
    [SPECIES_NINCADA] = gMonIcon_Nincada,
    [SPECIES_NINJASK] = gMonIcon_Ninjask,
    [SPECIES_SHEDINJA] = gMonIcon_Shedinja,
    [SPECIES_TAILLOW] = gMonIcon_Taillow,
    [SPECIES_SWELLOW] = gMonIcon_Swellow,
    [SPECIES_SHROOMISH] = gMonIcon_Shroomish,
    [SPECIES_BRELOOM] = gMonIcon_Breloom,
    [SPECIES_SPINDA] = gMonIcon_Spinda,
    [SPECIES_WINGULL] = gMonIcon_Wingull,
    [SPECIES_PELIPPER] = gMonIcon_Pelipper,
    [SPECIES_SURSKIT] = gMonIcon_Surskit,
    [SPECIES_MASQUERAIN] = gMonIcon_Masquerain,
    [SPECIES_WAILMER] = gMonIcon_Wailmer,
    [SPECIES_WAILORD] = gMonIcon_Wailord,
    [SPECIES_SKITTY] = gMonIcon_Skitty,
    [SPECIES_DELCATTY] = gMonIcon_Delcatty,
    [SPECIES_KECLEON] = gMonIcon_Kecleon,
    [SPECIES_BALTOY] = gMonIcon_Baltoy,
    [SPECIES_CLAYDOL] = gMonIcon_Claydol,
    [SPECIES_NOSEPASS] = gMonIcon_Nosepass,
    [SPECIES_TORKOAL] = gMonIcon_Torkoal,
    [SPECIES_SABLEYE] = gMonIcon_Sableye,
    [SPECIES_BARBOACH] = gMonIcon_Barboach,
    [SPECIES_WHISCASH] = gMonIcon_Whiscash,
    [SPECIES_LUVDISC] = gMonIcon_Luvdisc,
    [SPECIES_CORPHISH] = gMonIcon_Corphish,
    [SPECIES_CRAWDAUNT] = gMonIcon_Crawdaunt,
    [SPECIES_FEEBAS] = gMonIcon_Feebas,
    [SPECIES_MILOTIC] = gMonIcon_Milotic,
    [SPECIES_CARVANHA] = gMonIcon_Carvanha,
    [SPECIES_SHARPEDO] = gMonIcon_Sharpedo,
    [SPECIES_TRAPINCH] = gMonIcon_Trapinch,
    [SPECIES_VIBRAVA] = gMonIcon_Vibrava,
    [SPECIES_FLYGON] = gMonIcon_Flygon,
    [SPECIES_MAKUHITA] = gMonIcon_Makuhita,
    [SPECIES_HARIYAMA] = gMonIcon_Hariyama,
    [SPECIES_ELECTRIKE] = gMonIcon_Electrike,
    [SPECIES_MANECTRIC] = gMonIcon_Manectric,
    [SPECIES_NUMEL] = gMonIcon_Numel,
    [SPECIES_CAMERUPT] = gMonIcon_Camerupt,
    [SPECIES_SPHEAL] = gMonIcon_Spheal,
    [SPECIES_SEALEO] = gMonIcon_Sealeo,
    [SPECIES_WALREIN] = gMonIcon_Walrein,
    [SPECIES_CACNEA] = gMonIcon_Cacnea,
    [SPECIES_CACTURNE] = gMonIcon_Cacturne,
    [SPECIES_SNORUNT] = gMonIcon_Snorunt,
    [SPECIES_GLALIE] = gMonIcon_Glalie,
    [SPECIES_LUNATONE] = gMonIcon_Lunatone,
    [SPECIES_SOLROCK] = gMonIcon_Solrock,
    [SPECIES_AZURILL] = gMonIcon_Azurill,
    [SPECIES_SPOINK] = gMonIcon_Spoink,
    [SPECIES_GRUMPIG] = gMonIcon_Grumpig,
    [SPECIES_PLUSLE] = gMonIcon_Plusle,
    [SPECIES_MINUN] = gMonIcon_Minun,
    [SPECIES_MAWILE] = gMonIcon_Mawile,
    [SPECIES_MEDITITE] = gMonIcon_Meditite,
    [SPECIES_MEDICHAM] = gMonIcon_Medicham,
    [SPECIES_SWABLU] = gMonIcon_Swablu,
    [SPECIES_ALTARIA] = gMonIcon_Altaria,
    [SPECIES_WYNAUT] = gMonIcon_Wynaut,
    [SPECIES_DUSKULL] = gMonIcon_Duskull,
    [SPECIES_DUSCLOPS] = gMonIcon_Dusclops,
    [SPECIES_ROSELIA] = gMonIcon_Roselia,
    [SPECIES_SLAKOTH] = gMonIcon_Slakoth,
    [SPECIES_VIGOROTH] = gMonIcon_Vigoroth,
    [SPECIES_SLAKING] = gMonIcon_Slaking,
    [SPECIES_GULPIN] = gMonIcon_Gulpin,
    [SPECIES_SWALOT] = gMonIcon_Swalot,
    [SPECIES_TROPIUS] = gMonIcon_Tropius,
    [SPECIES_WHISMUR] = gMonIcon_Whismur,
    [SPECIES_LOUDRED] = gMonIcon_Loudred,
    [SPECIES_EXPLOUD] = gMonIcon_Exploud,
    [SPECIES_CLAMPERL] = gMonIcon_Clamperl,
    [SPECIES_HUNTAIL] = gMonIcon_Huntail,
    [SPECIES_GOREBYSS] = gMonIcon_Gorebyss,
    [SPECIES_ABSOL] = gMonIcon_Absol,
    [SPECIES_SHUPPET] = gMonIcon_Shuppet,
    [SPECIES_BANETTE] = gMonIcon_Banette,
    [SPECIES_SEVIPER] = gMonIcon_Seviper,
    [SPECIES_ZANGOOSE] = gMonIcon_Zangoose,
    [SPECIES_RELICANTH] = gMonIcon_Relicanth,
    [SPECIES_ARON] = gMonIcon_Aron,
    [SPECIES_LAIRON] = gMonIcon_Lairon,
    [SPECIES_AGGRON] = gMonIcon_Aggron,
    [SPECIES_CASTFORM] = gMonIcon_Castform,
    [SPECIES_VOLBEAT] = gMonIcon_Volbeat,
    [SPECIES_ILLUMISE] = gMonIcon_Illumise,
    [SPECIES_LILEEP] = gMonIcon_Lileep,
    [SPECIES_CRADILY] = gMonIcon_Cradily,
    [SPECIES_ANORITH] = gMonIcon_Anorith,
    [SPECIES_ARMALDO] = gMonIcon_Armaldo,
    [SPECIES_RALTS] = gMonIcon_Ralts,
    [SPECIES_KIRLIA] = gMonIcon_Kirlia,
    [SPECIES_GARDEVOIR] = gMonIcon_Gardevoir,
    [SPECIES_BAGON] = gMonIcon_Bagon,
    [SPECIES_SHELGON] = gMonIcon_Shelgon,
    [SPECIES_SALAMENCE] = gMonIcon_Salamence,
    [SPECIES_BELDUM] = gMonIcon_Beldum,
    [SPECIES_METANG] = gMonIcon_Metang,
    [SPECIES_METAGROSS] = gMonIcon_Metagross,
    [SPECIES_REGIROCK] = gMonIcon_Regirock,
    [SPECIES_REGICE] = gMonIcon_Regice,
    [SPECIES_REGISTEEL] = gMonIcon_Registeel,
    [SPECIES_KYOGRE] = gMonIcon_Kyogre,
    [SPECIES_GROUDON] = gMonIcon_Groudon,
    [SPECIES_RAYQUAZA] = gMonIcon_Rayquaza,
    [SPECIES_LATIAS] = gMonIcon_Latias,
    [SPECIES_LATIOS] = gMonIcon_Latios,
    [SPECIES_JIRACHI] = gMonIcon_Jirachi,
    [SPECIES_DEOXYS] = gMonIcon_Deoxys,
    [SPECIES_CHIMECHO] = gMonIcon_Chimecho,
    [SPECIES_EGG] = gMonIcon_Egg,
    [SPECIES_UNOWN_B] = gMonIcon_UnownB,
    [SPECIES_UNOWN_C] = gMonIcon_UnownC,
    [SPECIES_UNOWN_D] = gMonIcon_UnownD,
    [SPECIES_UNOWN_E] = gMonIcon_UnownE,
    [SPECIES_UNOWN_F] = gMonIcon_UnownF,
    [SPECIES_UNOWN_G] = gMonIcon_UnownG,
    [SPECIES_UNOWN_H] = gMonIcon_UnownH,
    [SPECIES_UNOWN_I] = gMonIcon_UnownI,
    [SPECIES_UNOWN_J] = gMonIcon_UnownJ,
    [SPECIES_UNOWN_K] = gMonIcon_UnownK,
    [SPECIES_UNOWN_L] = gMonIcon_UnownL,
    [SPECIES_UNOWN_M] = gMonIcon_UnownM,
    [SPECIES_UNOWN_N] = gMonIcon_UnownN,
    [SPECIES_UNOWN_O] = gMonIcon_UnownO,
    [SPECIES_UNOWN_P] = gMonIcon_UnownP,
    [SPECIES_UNOWN_Q] = gMonIcon_UnownQ,
    [SPECIES_UNOWN_R] = gMonIcon_UnownR,
    [SPECIES_UNOWN_S] = gMonIcon_UnownS,
    [SPECIES_UNOWN_T] = gMonIcon_UnownT,
    [SPECIES_UNOWN_U] = gMonIcon_UnownU,
    [SPECIES_UNOWN_V] = gMonIcon_UnownV,
    [SPECIES_UNOWN_W] = gMonIcon_UnownW,
    [SPECIES_UNOWN_X] = gMonIcon_UnownX,
    [SPECIES_UNOWN_Y] = gMonIcon_UnownY,
    [SPECIES_UNOWN_Z] = gMonIcon_UnownZ,
    [SPECIES_UNOWN_EMARK] = gMonIcon_UnownExclamationMark,
    [SPECIES_UNOWN_QMARK] = gMonIcon_UnownQuestionMark,
};

const u8 gMonIconPaletteIndices[] =
{
    0, // ??????????
    1, // Bulbasaur
    1, // Ivysaur
    1, // Venusaur
    0, // Charmander
    0, // Charmeleon
    0, // Charizard
    0, // Squirtle
    2, // Wartortle
    2, // Blastoise
    1, // Caterpie
    1, // Metapod
    0, // Butterfree
    1, // Weedle
    2, // Kakuna
    2, // Beedrill
    0, // Pidgey
    0, // Pidgeotto
    0, // Pidgeot
    2, // Rattata
    1, // Raticate
    0, // Spearow
    0, // Fearow
    2, // Ekans
    2, // Arbok
    2, // Pikachu
    0, // Raichu
    2, // Sandshrew
    2, // Sandslash
    2, // Nidoran♀
    2, // Nidorina
    2, // Nidoqueen
    2, // Nidoran♂
    2, // Nidorino
    2, // Nidoking
    0, // Clefairy
    0, // Clefable
    2, // Vulpix
    1, // Ninetales
    0, // Jigglypuff
    0, // Wigglytuff
    2, // Zubat
    2, // Golbat
    1, // Oddish
    0, // Gloom
    0, // Vileplume
    0, // Paras
    0, // Parasect
    0, // Venonat
    2, // Venomoth
    2, // Diglett
    2, // Dugtrio
    1, // Meowth
    1, // Persian
    1, // Psyduck
    2, // Golduck
    1, // Mankey
    2, // Primeape
    0, // Growlithe
    0, // Arcanine
    0, // Poliwag
    0, // Poliwhirl
    0, // Poliwrath
    2, // Abra
    2, // Kadabra
    2, // Alakazam
    0, // Machop
    2, // Machoke
    0, // Machamp
    1, // Bellsprout
    1, // Weepinbell
    1, // Victreebel
    2, // Tentacool
    2, // Tentacruel
    1, // Geodude
    1, // Graveler
    1, // Golem
    0, // Ponyta
    0, // Rapidash
    0, // Slowpoke
    0, // Slowbro
    0, // Magnemite
    0, // Magneton
    1, // Farfetch'd
    2, // Doduo
    2, // Dodrio
    2, // Seel
    2, // Dewgong
    2, // Grimer
    2, // Muk
    2, // Shellder
    2, // Cloyster
    2, // Gastly
    2, // Haunter
    2, // Gengar
    2, // Onix
    2, // Drowzee
    1, // Hypno
    2, // Krabby
    2, // Kingler
    0, // Voltorb
    0, // Electrode
    0, // Exeggcute
    1, // Exeggutor
    1, // Cubone
    1, // Marowak
    2, // Hitmonlee
    2, // Hitmonchan
    1, // Lickitung
    2, // Koffing
    2, // Weezing
    1, // Rhyhorn
    1, // Rhydon
    0, // Chansey
    0, // Tangela
    1, // Kangaskhan
    0, // Horsea
    0, // Seadra
    0, // Goldeen
    0, // Seaking
    2, // Staryu
    2, // Starmie
    0, // Mr. mime
    1, // Scyther
    2, // Jynx
    1, // Electabuzz
    0, // Magmar
    2, // Pinsir
    2, // Tauros
    0, // Magikarp
    0, // Gyarados
    2, // Lapras
    2, // Ditto
    2, // Eevee
    0, // Vaporeon
    0, // Jolteon
    0, // Flareon
    0, // Porygon
    0, // Omanyte
    0, // Omastar
    2, // Kabuto
    2, // Kabutops
    0, // Aerodactyl
    1, // Snorlax
    0, // Articuno
    0, // Zapdos
    0, // Moltres
    0, // Dratini
    0, // Dragonair
    2, // Dragonite
    2, // Mewtwo
    0, // Mew
    1, // Chikorita
    1, // Bayleef
    1, // Meganium
    1, // Cyndaquil
    1, // Quilava
    1, // Typhlosion
    2, // Totodile
    2, // Croconaw
    2, // Feraligatr
    2, // Sentret
    2, // Furret
    2, // Hoothoot
    2, // Noctowl
    0, // Ledyba
    0, // Ledian
    1, // Spinarak
    0, // Ariados
    2, // Crobat
    2, // Chinchou
    0, // Lanturn
    0, // Pichu
    0, // Cleffa
    1, // Igglybuff
    2, // Togepi
    2, // Togetic
    0, // Natu
    0, // Xatu
    2, // Mareep
    0, // Flaaffy
    0, // Ampharos
    1, // Bellossom
    2, // Marill
    2, // Azumarill
    1, // Sudowoodo
    1, // Politoed
    1, // Hoppip
    1, // Skiploom
    2, // Jumpluff
    2, // Aipom
    1, // Sunkern
    1, // Sunflora
    1, // Yanma
    0, // Wooper
    0, // Quagsire
    2, // Espeon
    2, // Umbreon
    2, // Murkrow
    0, // Slowking
    0, // Misdreavus
    0, // Unown A
    0, // Wobbuffet
    1, // Girafarig
    0, // Pineco
    2, // Forretress
    2, // Dunsparce
    2, // Gligar
    0, // Steelix
    0, // Snubbull
    2, // Granbull
    0, // Qwilfish
    0, // Scizor
    1, // Shuckle
    2, // Heracross
    0, // Sneasel
    0, // Teddiursa
    2, // Ursaring
    0, // Slugma
    0, // Magcargo
    2, // Swinub
    2, // Piloswine
    0, // Corsola
    0, // Remoraid
    0, // Octillery
    0, // Delibird
    2, // Mantine
    0, // Skarmory
    0, // Houndour
    0, // Houndoom
    0, // Kingdra
    0, // Phanpy
    0, // Donphan
    0, // Porygon2
    2, // Stantler
    1, // Smeargle
    2, // Tyrogue
    2, // Hitmontop
    1, // Smoochum
    1, // Elekid
    1, // Magby
    1, // Miltank
    1, // Blissey
    0, // Raikou
    2, // Entei
    0, // Suicune
    1, // Larvitar
    0, // Pupitar
    1, // Tyranitar
    0, // Lugia
    1, // Ho-Oh
    1, // Celebi
    0, // ?
    0, // ?
    0, // ?
    0, // ?
    0, // ?
    0, // ?
    0, // ?
    0, // ?
    0, // ?
    0, // ?
    0, // ?
    0, // ?
    0, // ?
    0, // ?
    0, // ?
    0, // ?
    0, // ?
    0, // ?
    0, // ?
    0, // ?
    0, // ?
    0, // ?
    0, // ?
    0, // ?
    0, // ?
    1, // Treecko
    0, // Grovyle
    1, // Sceptile
    0, // Torchic
    0, // Combusken
    0, // Blaziken
    0, // Mudkip
    0, // Marshtomp
    0, // Swampert
    2, // Poochyena
    2, // Mightyena
    2, // Zigzagoon
    2, // Linoone
    0, // Wurmple
    2, // Silcoon
    0, // Beautifly
    2, // Cascoon
    1, // Dustox
    1, // Lotad
    1, // Lombre
    1, // Ludicolo
    1, // Seedot
    1, // Nuzleaf
    0, // Shiftry
    1, // Nincada
    1, // Ninjask
    1, // Shedinja
    2, // Taillow
    2, // Swellow
    1, // Shroomish
    1, // Breloom
    1, // Spinda
    0, // Wingull
    0, // Pelipper
    2, // Surskit
    0, // Masquerain
    2, // Wailmer
    0, // Wailord
    0, // Skitty
    2, // Delcatty
    1, // Kecleon
    1, // Baltoy
    0, // Claydol
    0, // Nosepass
    1, // Torkoal
    2, // Sableye
    0, // Barboach
    0, // Whiscash
    0, // Luvdisc
    0, // Corphish
    0, // Crawdaunt
    2, // Feebas
    0, // Milotic
    0, // Carvanha
    0, // Sharpedo
    1, // Trapinch
    1, // Vibrava
    1, // Flygon
    2, // Makuhita
    1, // Hariyama
    1, // Electrike
    0, // Manectric
    1, // Numel
    0, // Camerupt
    2, // Spheal
    2, // Sealeo
    0, // Walrein
    1, // Cacnea
    1, // Cacturne
    2, // Snorunt
    0, // Glalie
    1, // Lunatone
    0, // Solrock
    2, // Azurill
    0, // Spoink
    2, // Grumpig
    0, // Plusle
    0, // Minun
    2, // Mawile
    0, // Meditite
    0, // Medicham
    0, // Swablu
    0, // Altaria
    0, // Wynaut
    0, // Duskull
    0, // Dusclops
    0, // Roselia
    2, // Slakoth
    2, // Vigoroth
    1, // Slaking
    1, // Gulpin
    2, // Swalot
    1, // Tropius
    0, // Whismur
    2, // Loudred
    2, // Exploud
    0, // Clamperl
    0, // Huntail
    0, // Gorebyss
    0, // Absol
    0, // Shuppet
    0, // Banette
    2, // Seviper
    0, // Zangoose
    1, // Relicanth
    2, // Aron
    2, // Lairon
    2, // Aggron
    0, // Castform
    0, // Volbeat
    2, // Illumise
    2, // Lileep
    0, // Cradily
    0, // Anorith
    0, // Armaldo
    1, // Ralts
    1, // Kirlia
    1, // Gardevoir
    2, // Bagon
    2, // Shelgon
    0, // Salamence
    0, // Beldum
    0, // Metang
    0, // Metagross
    2, // Regirock
    2, // Regice
    2, // Registeel
    2, // Kyogre
    0, // Groudon
    1, // Rayquaza
    0, // Latias
    2, // Latios
    0, // Jirachi
    0, // Deoxys
    0, // Chimecho
    1, // Egg
    0, // Unown B
    0, // Unown C
    0, // Unown D
    0, // Unown E
    0, // Unown F
    0, // Unown G
    0, // Unown H
    0, // Unown I
    0, // Unown J
    0, // Unown K
    0, // Unown L
    0, // Unown M
    0, // Unown N
    0, // Unown O
    0, // Unown P
    0, // Unown Q
    0, // Unown R
    0, // Unown S
    0, // Unown T
    0, // Unown U
    0, // Unown V
    0, // Unown W
    0, // Unown X
    0, // Unown Y
    0, // Unown Z
    0, // Unown Exclamation Mark
    0, // Unown Question Mark
};

const struct SpritePalette gMonIconPaletteTable[] =
{
    { gMonIconPalettes[0], POKE_ICON_BASE_PAL_TAG + 0 },
    { gMonIconPalettes[1], POKE_ICON_BASE_PAL_TAG + 1 },
    { gMonIconPalettes[2], POKE_ICON_BASE_PAL_TAG + 2 },

// There are only 3 actual palettes. The following are unused
// and don't point to valid data.
    { gMonIconPalettes[3], POKE_ICON_BASE_PAL_TAG + 3 },
    { gMonIconPalettes[4], POKE_ICON_BASE_PAL_TAG + 4 },
    { gMonIconPalettes[5], POKE_ICON_BASE_PAL_TAG + 5 },
};

static const struct OamData sMonIconOamData =
{
    .size = 2,
    .priority = 1,
};

// fastest to slowest

static const union AnimCmd sAnim_0[] =
{
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(1, 6),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnim_1[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(1, 8),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnim_2[] =
{
    ANIMCMD_FRAME(0, 14),
    ANIMCMD_FRAME(1, 14),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnim_3[] =
{
    ANIMCMD_FRAME(0, 22),
    ANIMCMD_FRAME(1, 22),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnim_4[] =
{
    ANIMCMD_FRAME(0, 29),
    ANIMCMD_FRAME(0, 29), // frame 0 is repeated
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sMonIconAnims[] =
{
    sAnim_0,
    sAnim_1,
    sAnim_2,
    sAnim_3,
    sAnim_4,
};

static const union AffineAnimCmd sAffineAnim_0[] =
{
    AFFINEANIMCMD_FRAME(0, 0, 0, 10),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd sAffineAnim_1[] =
{
    AFFINEANIMCMD_FRAME(-2, -2, 0, 122),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const sMonIconAffineAnims[] =
{
    sAffineAnim_0,
    sAffineAnim_1,
};

const u16 sSpriteImageSizes[3][4] =
{
    // square
    {
         0x20, // 1×1
         0x80, // 2×2
        0x200, // 4×4
        0x800, // 8×8
    },

    // horizontal rectangle
    {
         0x40, // 2×1
         0x80, // 4×1
        0x100, // 4×2
        0x400, // 8×4
    },

    // vertical rectangle
    {
         0x40, // 1×2
         0x80, // 1×4
        0x100, // 2×4
        0x400, // 4×8
    },
};

u16 GetUnownLetterByPersonality(u32);
const u8 *GetMonIconPtr(u16, u32 personality);
u8 UpdateMonIconFrame(struct Sprite *);
u8 CreateMonIconSprite(struct MonIconSpriteTemplate *, s16, s16, u8);
void DestroyPokemonIconSprite(struct Sprite *);

// duplicate of CreateMonIcon
u8 unref_sub_809D26C(u16 species, void (*callback)(struct Sprite *), s16 x, s16 y, u8 subpriority)
{
    u8 spriteId;
    struct MonIconSpriteTemplate iconTemplate =
    {
        .oam = &sMonIconOamData,
        .image = gMonIconTable[species],
        .anims = sMonIconAnims,
        .affineAnims = sMonIconAffineAnims,
        .callback = callback,
        .paletteTag = POKE_ICON_BASE_PAL_TAG + gMonIconPaletteIndices[species],
    };

    spriteId = CreateMonIconSprite(&iconTemplate, x, y, subpriority);

    UpdateMonIconFrame(&gSprites[spriteId]);

    return spriteId;
}

u8 CreateMonIcon(u16 species, void (*callback)(struct Sprite *), s16 x, s16 y, u8 subpriority, u32 personality)
{
    u8 spriteId;
    struct MonIconSpriteTemplate iconTemplate =
    {
        .oam = &sMonIconOamData,
        .image = GetMonIconPtr(species, personality),
        .anims = sMonIconAnims,
        .affineAnims = sMonIconAffineAnims,
        .callback = callback,
        .paletteTag = POKE_ICON_BASE_PAL_TAG + gMonIconPaletteIndices[species],
    };

    if (species > SPECIES_EGG)
        iconTemplate.paletteTag = POKE_ICON_BASE_PAL_TAG;

    spriteId = CreateMonIconSprite(&iconTemplate, x, y, subpriority);

    UpdateMonIconFrame(&gSprites[spriteId]);

    return spriteId;
}

u8 sub_809D3A4(u16 species, void (*callback)(struct Sprite *), s16 x, s16 y, u8 subpriority)
{
    u8 spriteId;
    struct MonIconSpriteTemplate iconTemplate =
    {
        .oam = &sMonIconOamData,
        .image = gMonIconTable[species],
        .anims = sMonIconAnims,
        .affineAnims = sMonIconAffineAnims,
        .callback = callback,
        .paletteTag = POKE_ICON_BASE_PAL_TAG + gMonIconPaletteIndices[species],
    };

    spriteId = CreateMonIconSprite(&iconTemplate, x, y, subpriority);

    UpdateMonIconFrame(&gSprites[spriteId]);

    return spriteId;
}

u16 mon_icon_convert_unown_species_id(u16 species, u32 personality)
{
    u16 result;

    if (species == SPECIES_UNOWN)
    {
        u16 letter = GetUnownLetterByPersonality(personality);
        if (letter == 0)
            letter = SPECIES_UNOWN;
        else
            letter += (SPECIES_UNOWN_B - 1);
        result = letter;
    }
    else
    {
        if (species > SPECIES_EGG)
            result = 260;
        else
            result = species;
    }

    return result;
}

u16 GetUnownLetterByPersonality(u32 personality)
{
    return (((personality & 0x3000000) >> 18) | ((personality & 0x30000) >> 12) | ((personality & 0x300) >> 6) | (personality & 0x3)) % 0x1C;
}

u16 sub_809D4A8(u16 species)
{
    u16 value;

    if (MailSpeciesToSpecies(species, &value) == SPECIES_UNOWN)
    {
        if (value == 0)
            value += SPECIES_UNOWN;
        else
            value += (SPECIES_UNOWN_B - 1);
        return value;
    }
    else
    {
        return mon_icon_convert_unown_species_id(species, 0);
    }
}

const u8 *GetMonIconPtr(u16 species, u32 personality)
{
    u16 convertedSpecies = mon_icon_convert_unown_species_id(species, personality);
    return gMonIconTable[convertedSpecies];
}

void sub_809D510(struct Sprite *sprite)
{
    DestroyPokemonIconSprite(sprite);
}

void sub_809D51C(void)
{
    u8 i;
    for (i = 0; i < 6; i++)
        LoadSpritePalette(&gMonIconPaletteTable[i]);
}

// unused
void SafeLoadMonIconPalette(u16 species)
{
    u8 palIndex;
    if (species > SPECIES_EGG)
        species = 260;
    palIndex = gMonIconPaletteIndices[species];
    if (IndexOfSpritePaletteTag(gMonIconPaletteTable[palIndex].tag) == 0xFF)
        LoadSpritePalette(&gMonIconPaletteTable[palIndex]);
}

void sub_809D580(u16 species)
{
    u8 palIndex = gMonIconPaletteIndices[species];
    if (IndexOfSpritePaletteTag(gMonIconPaletteTable[palIndex].tag) == 0xFF)
        LoadSpritePalette(&gMonIconPaletteTable[palIndex]);
}

// unused
void FreeMonIconPalettes(void)
{
    u8 i;
    for (i = 0; i < 6; i++)
        FreeSpritePaletteByTag(gMonIconPaletteTable[i].tag);
}

// unused
void SafeFreeMonIconPalette(u16 species)
{
    u8 palIndex;
    if (species > SPECIES_EGG)
        species = 260;
    palIndex = gMonIconPaletteIndices[species];
    FreeSpritePaletteByTag(gMonIconPaletteTable[palIndex].tag);
}

void sub_809D608(u16 species)
{
    u8 palIndex;
    palIndex = gMonIconPaletteIndices[species];
    FreeSpritePaletteByTag(gMonIconPaletteTable[palIndex].tag);
}

void SpriteCB_PokemonIcon(struct Sprite *sprite)
{
    UpdateMonIconFrame(sprite);
}

u8 UpdateMonIconFrame(struct Sprite *sprite)
{
    u8 result = 0;

    if (sprite->animDelayCounter == 0)
    {
        s16 frame = sprite->anims[sprite->animNum][sprite->animCmdIndex].frame.imageValue;

        switch (frame)
        {
        case -1:
            break;
        case -2:
            sprite->animCmdIndex = 0;
            break;
        default:
            RequestSpriteCopy(
                // pointer arithmetic is needed to get the correct pointer to perform the sprite copy on.
                // because sprite->images is a struct def, it has to be casted to (u8 *) before any
                // arithmetic can be performed.
                (u8 *)sprite->images + (sSpriteImageSizes[sprite->oam.shape][sprite->oam.size] * frame),
                OBJ_VRAM0 + sprite->oam.tileNum * TILE_SIZE_4BPP,
                sSpriteImageSizes[sprite->oam.shape][sprite->oam.size]);
            sprite->animDelayCounter = sprite->anims[sprite->animNum][sprite->animCmdIndex].frame.duration & 0xFF;
            sprite->animCmdIndex++;
            result = sprite->animCmdIndex;
            break;
        }
    }
    else
    {
        sprite->animDelayCounter--;
    }
    return result;
}

u8 CreateMonIconSprite(struct MonIconSpriteTemplate *iconTemplate, s16 x, s16 y, u8 subpriority)
{
    u8 spriteId;

    struct SpriteFrameImage image = { NULL, sSpriteImageSizes[iconTemplate->oam->shape][iconTemplate->oam->size] };

    struct SpriteTemplate spriteTemplate =
    {
        .tileTag = 0xFFFF,
        .paletteTag = iconTemplate->paletteTag,
        .oam = iconTemplate->oam,
        .anims = iconTemplate->anims,
        .images = &image,
        .affineAnims = iconTemplate->affineAnims,
        .callback = iconTemplate->callback,
    };

    spriteId = CreateSprite(&spriteTemplate, x, y, subpriority);
    gSprites[spriteId].animPaused = TRUE;
    gSprites[spriteId].animBeginning = FALSE;
    gSprites[spriteId].images = (const struct SpriteFrameImage *)iconTemplate->image;
    return spriteId;
}

void DestroyPokemonIconSprite(struct Sprite *sprite)
{
    struct SpriteFrameImage image = { NULL, sSpriteImageSizes[sprite->oam.shape][sprite->oam.size] };
    sprite->images = &image;
    DestroySprite(sprite);
}

void SetPartyHPBarSprite(struct Sprite *sprite, u8 animNum)
{
    sprite->animNum = animNum;
    sprite->animDelayCounter = 0;
    sprite->animCmdIndex = 0;
}
