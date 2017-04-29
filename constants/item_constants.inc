	.include "asm/macros/asm.inc"

	enum_start

	enum ITEM_NONE           @ 0x000
	enum ITEM_MASTER_BALL    @ 0x001
	enum ITEM_ULTRA_BALL     @ 0x002
	enum ITEM_GREAT_BALL     @ 0x003
	enum ITEM_POKE_BALL      @ 0x004
	enum ITEM_SAFARI_BALL    @ 0x005
	enum ITEM_NET_BALL       @ 0x006
	enum ITEM_DIVE_BALL      @ 0x007
	enum ITEM_NEST_BALL      @ 0x008
	enum ITEM_REPEAT_BALL    @ 0x009
	enum ITEM_TIMER_BALL     @ 0x00a
	enum ITEM_LUXURY_BALL    @ 0x00b
	enum ITEM_PREMIER_BALL   @ 0x00c
	enum ITEM_POTION         @ 0x00d
	enum ITEM_ANTIDOTE       @ 0x00e
	enum ITEM_BURN_HEAL      @ 0x00f
	enum ITEM_ICE_HEAL       @ 0x010
	enum ITEM_AWAKENING      @ 0x011
	enum ITEM_PARALYZE_HEAL  @ 0x012
	enum ITEM_FULL_RESTORE   @ 0x013
	enum ITEM_MAX_POTION     @ 0x014
	enum ITEM_HYPER_POTION   @ 0x015
	enum ITEM_SUPER_POTION   @ 0x016
	enum ITEM_FULL_HEAL      @ 0x017
	enum ITEM_REVIVE         @ 0x018
	enum ITEM_MAX_REVIVE     @ 0x019
	enum ITEM_FRESH_WATER    @ 0x01a
	enum ITEM_SODA_POP       @ 0x01b
	enum ITEM_LEMONADE       @ 0x01c
	enum ITEM_MOOMOO_MILK    @ 0x01d
	enum ITEM_ENERGY_POWDER  @ 0x01e
	enum ITEM_ENERGY_ROOT    @ 0x01f
	enum ITEM_HEAL_POWDER    @ 0x020
	enum ITEM_REVIVAL_HERB   @ 0x021
	enum ITEM_ETHER          @ 0x022
	enum ITEM_MAX_ETHER      @ 0x023
	enum ITEM_ELIXIR         @ 0x024
	enum ITEM_MAX_ELIXIR     @ 0x025
	enum ITEM_LAVA_COOKIE    @ 0x026
	enum ITEM_BLUE_FLUTE     @ 0x027
	enum ITEM_YELLOW_FLUTE   @ 0x028
	enum ITEM_RED_FLUTE      @ 0x029
	enum ITEM_BLACK_FLUTE    @ 0x02a
	enum ITEM_WHITE_FLUTE    @ 0x02b
	enum ITEM_BERRY_JUICE    @ 0x02c
	enum ITEM_SACRED_ASH     @ 0x02d
	enum ITEM_SHOAL_SALT     @ 0x02e
	enum ITEM_SHOAL_SHELL    @ 0x02f
	enum ITEM_RED_SHARD      @ 0x030
	enum ITEM_BLUE_SHARD     @ 0x031
	enum ITEM_YELLOW_SHARD   @ 0x032
	enum ITEM_GREEN_SHARD    @ 0x033
	enum ITEM_034
	enum ITEM_035
	enum ITEM_036
	enum ITEM_037
	enum ITEM_038
	enum ITEM_039
	enum ITEM_03A
	enum ITEM_03B
	enum ITEM_03C
	enum ITEM_03D
	enum ITEM_03E
	enum ITEM_HP_UP          @ 0x03f
	enum ITEM_PROTEIN        @ 0x040
	enum ITEM_IRON           @ 0x041
	enum ITEM_CARBOS         @ 0x042
	enum ITEM_CALCIUM        @ 0x043
	enum ITEM_RARE_CANDY     @ 0x044
	enum ITEM_PP_UP          @ 0x045
	enum ITEM_ZINC           @ 0x046
	enum ITEM_PP_MAX         @ 0x047
	enum ITEM_048
	enum ITEM_GUARD_SPEC     @ 0x049
	enum ITEM_DIRE_HIT       @ 0x04a
	enum ITEM_X_ATTACK       @ 0x04b
	enum ITEM_X_DEFEND       @ 0x04c
	enum ITEM_X_SPEED        @ 0x04d
	enum ITEM_X_ACCURACY     @ 0x04e
	enum ITEM_X_SPECIAL      @ 0x04f
	enum ITEM_POKE_DOLL      @ 0x050
	enum ITEM_FLUFFY_TAIL    @ 0x051
	enum ITEM_052
	enum ITEM_SUPER_REPEL    @ 0x053
	enum ITEM_MAX_REPEL      @ 0x054
	enum ITEM_ESCAPE_ROPE    @ 0x055
	enum ITEM_REPEL          @ 0x056
	enum ITEM_057
	enum ITEM_058
	enum ITEM_059
	enum ITEM_05A
	enum ITEM_05B
	enum ITEM_05C
	enum ITEM_SUN_STONE      @ 0x05d
	enum ITEM_MOON_STONE     @ 0x05e
	enum ITEM_FIRE_STONE     @ 0x05f
	enum ITEM_THUNDER_STONE  @ 0x060
	enum ITEM_WATER_STONE    @ 0x061
	enum ITEM_LEAF_STONE     @ 0x062
	enum ITEM_063
	enum ITEM_064
	enum ITEM_065
	enum ITEM_066
	enum ITEM_TINY_MUSHROOM  @ 0x067
	enum ITEM_BIG_MUSHROOM   @ 0x068
	enum ITEM_069
	enum ITEM_PEARL          @ 0x06a
	enum ITEM_BIG_PEARL      @ 0x06b
	enum ITEM_STARDUST       @ 0x06c
	enum ITEM_STAR_PIECE     @ 0x06d
	enum ITEM_NUGGET         @ 0x06e
	enum ITEM_HEART_SCALE    @ 0x06f
	enum ITEM_070
	enum ITEM_071
	enum ITEM_072
	enum ITEM_073
	enum ITEM_074
	enum ITEM_075
	enum ITEM_076
	enum ITEM_077
	enum ITEM_078
	enum ITEM_ORANGE_MAIL    @ 0x079
	enum ITEM_HARBOR_MAIL    @ 0x07a
	enum ITEM_GLITTER_MAIL   @ 0x07b
	enum ITEM_MECH_MAIL      @ 0x07c
	enum ITEM_WOOD_MAIL      @ 0x07d
	enum ITEM_WAVE_MAIL      @ 0x07e
	enum ITEM_BEAD_MAIL      @ 0x07f
	enum ITEM_SHADOW_MAIL    @ 0x080
	enum ITEM_TROPIC_MAIL    @ 0x081
	enum ITEM_DREAM_MAIL     @ 0x082
	enum ITEM_FAB_MAIL       @ 0x083
	enum ITEM_RETRO_MAIL     @ 0x084
	enum ITEM_CHERI_BERRY    @ 0x085
	enum ITEM_CHESTO_BERRY   @ 0x086
	enum ITEM_PECHA_BERRY    @ 0x087
	enum ITEM_RAWST_BERRY    @ 0x088
	enum ITEM_ASPEAR_BERRY   @ 0x089
	enum ITEM_LEPPA_BERRY    @ 0x08a
	enum ITEM_ORAN_BERRY     @ 0x08b
	enum ITEM_PERSIM_BERRY   @ 0x08c
	enum ITEM_LUM_BERRY      @ 0x08d
	enum ITEM_SITRUS_BERRY   @ 0x08e
	enum ITEM_FIGY_BERRY     @ 0x08f
	enum ITEM_WIKI_BERRY     @ 0x090
	enum ITEM_MAGO_BERRY     @ 0x091
	enum ITEM_AGUAV_BERRY    @ 0x092
	enum ITEM_IAPAPA_BERRY   @ 0x093
	enum ITEM_RAZZ_BERRY     @ 0x094
	enum ITEM_BLUK_BERRY     @ 0x095
	enum ITEM_NANAB_BERRY    @ 0x096
	enum ITEM_WEPEAR_BERRY   @ 0x097
	enum ITEM_PINAP_BERRY    @ 0x098
	enum ITEM_POMEG_BERRY    @ 0x099
	enum ITEM_KELPSY_BERRY   @ 0x09a
	enum ITEM_QUALOT_BERRY   @ 0x09b
	enum ITEM_HONDEW_BERRY   @ 0x09c
	enum ITEM_GREPA_BERRY    @ 0x09d
	enum ITEM_TAMATO_BERRY   @ 0x09e
	enum ITEM_CORNN_BERRY    @ 0x09f
	enum ITEM_MAGOST_BERRY   @ 0x0a0
	enum ITEM_RABUTA_BERRY   @ 0x0a1
	enum ITEM_NOMEL_BERRY    @ 0x0a2
	enum ITEM_SPELON_BERRY   @ 0x0a3
	enum ITEM_PAMTRE_BERRY   @ 0x0a4
	enum ITEM_WATMEL_BERRY   @ 0x0a5
	enum ITEM_DURIN_BERRY    @ 0x0a6
	enum ITEM_BELUE_BERRY    @ 0x0a7
	enum ITEM_LIECHI_BERRY   @ 0x0a8
	enum ITEM_GANLON_BERRY   @ 0x0a9
	enum ITEM_SALAC_BERRY    @ 0x0aa
	enum ITEM_PETAYA_BERRY   @ 0x0ab
	enum ITEM_APICOT_BERRY   @ 0x0ac
	enum ITEM_LANSAT_BERRY   @ 0x0ad
	enum ITEM_STARF_BERRY    @ 0x0ae
	enum ITEM_ENIGMA_BERRY   @ 0x0af
	enum ITEM_0B0
	enum ITEM_0B1
	enum ITEM_0B2
	enum ITEM_BRIGHT_POWDER  @ 0x0b3
	enum ITEM_WHITE_HERB     @ 0x0b4
	enum ITEM_MACHO_BRACE    @ 0x0b5
	enum ITEM_EXP_SHARE      @ 0x0b6
	enum ITEM_QUICK_CLAW     @ 0x0b7
	enum ITEM_SOOTHE_BELL    @ 0x0b8
	enum ITEM_MENTAL_HERB    @ 0x0b9
	enum ITEM_CHOICE_BAND    @ 0x0ba
	enum ITEM_KINGS_ROCK     @ 0x0bb
	enum ITEM_SILVER_POWDER  @ 0x0bc
	enum ITEM_AMULET_COIN    @ 0x0bd
	enum ITEM_CLEANSE_TAG    @ 0x0be
	enum ITEM_SOUL_DEW       @ 0x0bf
	enum ITEM_DEEP_SEA_TOOTH @ 0x0c0
	enum ITEM_DEEP_SEA_SCALE @ 0x0c1
	enum ITEM_SMOKE_BALL     @ 0x0c2
	enum ITEM_EVERSTONE      @ 0x0c3
	enum ITEM_FOCUS_BAND     @ 0x0c4
	enum ITEM_LUCKY_EGG      @ 0x0c5
	enum ITEM_SCOPE_LENS     @ 0x0c6
	enum ITEM_METAL_COAT     @ 0x0c7
	enum ITEM_LEFTOVERS      @ 0x0c8
	enum ITEM_DRAGON_SCALE   @ 0x0c9
	enum ITEM_LIGHT_BALL     @ 0x0ca
	enum ITEM_SOFT_SAND      @ 0x0cb
	enum ITEM_HARD_STONE     @ 0x0cc
	enum ITEM_MIRACLE_SEED   @ 0x0cd
	enum ITEM_BLACK_GLASSES  @ 0x0ce
	enum ITEM_BLACK_BELT     @ 0x0cf
	enum ITEM_MAGNET         @ 0x0d0
	enum ITEM_MYSTIC_WATER   @ 0x0d1
	enum ITEM_SHARP_BEAK     @ 0x0d2
	enum ITEM_POISON_BARB    @ 0x0d3
	enum ITEM_NEVER_MELT_ICE @ 0x0d4
	enum ITEM_SPELL_TAG      @ 0x0d5
	enum ITEM_TWISTED_SPOON  @ 0x0d6
	enum ITEM_CHARCOAL       @ 0x0d7
	enum ITEM_DRAGON_FANG    @ 0x0d8
	enum ITEM_SILK_SCARF     @ 0x0d9
	enum ITEM_UP_GRADE       @ 0x0da
	enum ITEM_SHELL_BELL     @ 0x0db
	enum ITEM_SEA_INCENSE    @ 0x0dc
	enum ITEM_LAX_INCENSE    @ 0x0dd
	enum ITEM_LUCKY_PUNCH    @ 0x0de
	enum ITEM_METAL_POWDER   @ 0x0df
	enum ITEM_THICK_CLUB     @ 0x0e0
	enum ITEM_STICK          @ 0x0e1
	enum ITEM_0E2
	enum ITEM_0E3
	enum ITEM_0E4
	enum ITEM_0E5
	enum ITEM_0E6
	enum ITEM_0E7
	enum ITEM_0E8
	enum ITEM_0E9
	enum ITEM_0EA
	enum ITEM_0EB
	enum ITEM_0EC
	enum ITEM_0ED
	enum ITEM_0EE
	enum ITEM_0EF
	enum ITEM_0F0
	enum ITEM_0F1
	enum ITEM_0F2
	enum ITEM_0F3
	enum ITEM_0F4
	enum ITEM_0F5
	enum ITEM_0F6
	enum ITEM_0F7
	enum ITEM_0F8
	enum ITEM_0F9
	enum ITEM_0FA
	enum ITEM_0FB
	enum ITEM_0FC
	enum ITEM_0FD
	enum ITEM_RED_SCARF      @ 0x0fe
	enum ITEM_BLUE_SCARF     @ 0x0ff
	enum ITEM_PINK_SCARF     @ 0x100
	enum ITEM_GREEN_SCARF    @ 0x101
	enum ITEM_YELLOW_SCARF   @ 0x102
	enum ITEM_MACH_BIKE      @ 0x103
	enum ITEM_COIN_CASE      @ 0x104
	enum ITEM_ITEMFINDER     @ 0x105
	enum ITEM_OLD_ROD        @ 0x106
	enum ITEM_GOOD_ROD       @ 0x107
	enum ITEM_SUPER_ROD      @ 0x108
	enum ITEM_SS_TICKET      @ 0x109
	enum ITEM_CONTEST_PASS   @ 0x10a
	enum ITEM_10B
	enum ITEM_WAILMER_PAIL   @ 0x10c
	enum ITEM_DEVON_GOODS    @ 0x10d
	enum ITEM_SOOT_SACK      @ 0x10e
	enum ITEM_BASEMENT_KEY   @ 0x10f
	enum ITEM_ACRO_BIKE      @ 0x110
	enum ITEM_POKEBLOCK_CASE @ 0x111
	enum ITEM_LETTER         @ 0x112
	enum ITEM_EON_TICKET     @ 0x113
	enum ITEM_RED_ORB        @ 0x114
	enum ITEM_BLUE_ORB       @ 0x115
	enum ITEM_SCANNER        @ 0x116
	enum ITEM_GO_GOGGLES     @ 0x117
	enum ITEM_METEORITE      @ 0x118
	enum ITEM_ROOM_1_KEY     @ 0x119
	enum ITEM_ROOM_2_KEY     @ 0x11a
	enum ITEM_ROOM_4_KEY     @ 0x11b
	enum ITEM_ROOM_6_KEY     @ 0x11c
	enum ITEM_STORAGE_KEY    @ 0x11d
	enum ITEM_ROOT_FOSSIL    @ 0x11e
	enum ITEM_CLAW_FOSSIL    @ 0x11f
	enum ITEM_DEVON_SCOPE    @ 0x120
	enum ITEM_TM01           @ 0x121
	enum ITEM_TM02           @ 0x122
	enum ITEM_TM03           @ 0x123
	enum ITEM_TM04           @ 0x124
	enum ITEM_TM05           @ 0x125
	enum ITEM_TM06           @ 0x126
	enum ITEM_TM07           @ 0x127
	enum ITEM_TM08           @ 0x128
	enum ITEM_TM09           @ 0x129
	enum ITEM_TM10           @ 0x12a
	enum ITEM_TM11           @ 0x12b
	enum ITEM_TM12           @ 0x12c
	enum ITEM_TM13           @ 0x12d
	enum ITEM_TM14           @ 0x12e
	enum ITEM_TM15           @ 0x12f
	enum ITEM_TM16           @ 0x130
	enum ITEM_TM17           @ 0x131
	enum ITEM_TM18           @ 0x132
	enum ITEM_TM19           @ 0x133
	enum ITEM_TM20           @ 0x134
	enum ITEM_TM21           @ 0x135
	enum ITEM_TM22           @ 0x136
	enum ITEM_TM23           @ 0x137
	enum ITEM_TM24           @ 0x138
	enum ITEM_TM25           @ 0x139
	enum ITEM_TM26           @ 0x13a
	enum ITEM_TM27           @ 0x13b
	enum ITEM_TM28           @ 0x13c
	enum ITEM_TM29           @ 0x13d
	enum ITEM_TM30           @ 0x13e
	enum ITEM_TM31           @ 0x13f
	enum ITEM_TM32           @ 0x140
	enum ITEM_TM33           @ 0x141
	enum ITEM_TM34           @ 0x142
	enum ITEM_TM35           @ 0x143
	enum ITEM_TM36           @ 0x144
	enum ITEM_TM37           @ 0x145
	enum ITEM_TM38           @ 0x146
	enum ITEM_TM39           @ 0x147
	enum ITEM_TM40           @ 0x148
	enum ITEM_TM41           @ 0x149
	enum ITEM_TM42           @ 0x14a
	enum ITEM_TM43           @ 0x14b
	enum ITEM_TM44           @ 0x14c
	enum ITEM_TM45           @ 0x14d
	enum ITEM_TM46           @ 0x14e
	enum ITEM_TM47           @ 0x14f
	enum ITEM_TM48           @ 0x150
	enum ITEM_TM49           @ 0x151
	enum ITEM_TM50           @ 0x152
	enum ITEM_HM01           @ 0x153
	enum ITEM_HM02           @ 0x154
	enum ITEM_HM03           @ 0x155
	enum ITEM_HM04           @ 0x156
	enum ITEM_HM05           @ 0x157
	enum ITEM_HM06           @ 0x158
	enum ITEM_HM07           @ 0x159
	enum ITEM_HM08           @ 0x15a
	enum ITEM_15B
	enum ITEM_15C

	@ FireRed/LeafGreen
	enum ITEM_OAKS_PARCEL    @ 0x15d
	enum ITEM_POKE_FLUTE     @ 0x15e
	enum ITEM_SECRET_KEY     @ 0x15f
	enum ITEM_BIKE_VOUCHER   @ 0x160
	enum ITEM_GOLD_TEETH     @ 0x161
	enum ITEM_OLD_AMBER      @ 0x162
	enum ITEM_CARD_KEY       @ 0x163
	enum ITEM_LIFT_KEY       @ 0x164
	enum ITEM_HELIX_FOSSIL   @ 0x165
	enum ITEM_DOME_FOSSIL    @ 0x166
	enum ITEM_SILPH_SCOPE    @ 0x167
	enum ITEM_BICYCLE        @ 0x168
	enum ITEM_TOWN_MAP       @ 0x169
	enum ITEM_VS_SEEKER      @ 0x16a
	enum ITEM_FAME_CHECKER   @ 0x16b
	enum ITEM_TM_CASE        @ 0x16c
	enum ITEM_BERRY_POUCH    @ 0x16d
	enum ITEM_TEACHY_TV      @ 0x16e
	enum ITEM_TRI_PASS       @ 0x16f
	enum ITEM_RAINBOW_PASS   @ 0x170
	enum ITEM_TEA            @ 0x171
	enum ITEM_MYSTIC_TICKET  @ 0x172
	enum ITEM_AURORA_TICKET  @ 0x173
	enum ITEM_POWDER_JAR     @ 0x174
	enum ITEM_RUBY           @ 0x175
	enum ITEM_SAPPHIRE       @ 0x176

	@ Emerald
	enum ITEM_MAGMA_EMBLEM   @ 0x177
	enum ITEM_OLD_SEA_MAP    @ 0x178
