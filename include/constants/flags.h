#ifndef GUARD_CONSTANTS_FLAGS_H
#define GUARD_CONSTANTS_FLAGS_H

// temporary flags
// These temporary are are cleared every time a map is loaded. They are used for
// things like shortening an NPCs introduction text if the player already spoke
// to them once.
#define FLAG_TEMP_1   0x1
#define FLAG_TEMP_2   0x2
#define FLAG_TEMP_3   0x3
#define FLAG_TEMP_4   0x4
#define FLAG_TEMP_5   0x5
#define FLAG_TEMP_6   0x6
#define FLAG_TEMP_7   0x7
#define FLAG_TEMP_8   0x8
#define FLAG_TEMP_9   0x9
#define FLAG_TEMP_A   0xA
#define FLAG_TEMP_B   0xB
#define FLAG_TEMP_C   0xC
#define FLAG_TEMP_D   0xD
#define FLAG_TEMP_E   0xE
#define FLAG_TEMP_F   0xF
#define FLAG_TEMP_10  0x10
#define FLAG_TEMP_11  0x11
#define FLAG_TEMP_12  0x12
#define FLAG_TEMP_13  0x13
#define FLAG_TEMP_14  0x14
#define FLAG_TEMP_15  0x15
#define FLAG_TEMP_16  0x16
#define FLAG_TEMP_17  0x17
#define FLAG_TEMP_18  0x18
#define FLAG_TEMP_19  0x19
#define FLAG_TEMP_1A  0x1A
#define FLAG_TEMP_1B  0x1B
#define FLAG_TEMP_1C  0x1C
#define FLAG_TEMP_1D  0x1D
#define FLAG_TEMP_1E  0x1E
#define FLAG_TEMP_1F  0x1F
// FLAG_TEMP_20 was supposed to be used as a temporary flag (see above), but there
// was either an oversight or off-by-one error.
#define FLAG_TEMP_20  0x20
#define FLAG_VICTORY_ROAD_ROCK FLAG_TEMP_20

// scripts
#define FLAG_SET_WALL_CLOCK                 0x51
#define FLAG_RESCUED_BIRCH                  0x52

#define FLAG_LINK_CONTEST_ROOM_POKEBALL     0x56
#define FLAG_MET_RIVAL_MOM                  0x57
#define FLAG_BIRCH_AIDE_MET                 0x58
#define FLAG_DECLINED_BIKE                  0x59
#define FLAG_RECEIVED_BIKE                  0x5A

#define FLAG_RECEIVED_WAILMER_PAIL          0x5E
#define FLAG_RECEIVED_POKEBLOCK_CASE        0x5F
#define FLAG_RECEIVED_SECRET_POWER          0x60

#define FLAG_TV_EXPLAINED                   0x62
#define FLAG_MAUVILLE_GYM_BARRIERS_STATE    0x63
#define FLAG_MOSSDEEP_GYM_SWITCH_1          0x64
#define FLAG_MOSSDEEP_GYM_SWITCH_2          0x65
#define FLAG_MOSSDEEP_GYM_SWITCH_3          0x66
#define FLAG_MOSSDEEP_GYM_SWITCH_4          0x67

#define FLAG_OCEANIC_MUSEUM_MET_REPORTER    0x69
#define FLAG_RECEIVED_HM04                  0x6A
#define FLAG_RECEIVED_HM06                  0x6B

#define FLAG_RECEIVED_HM05                  0x6D
#define FLAG_RECEIVED_HM02                  0x6E
#define FLAG_MT_PYRE_ORB_STOLEN             0x6F
#define FLAG_EVIL_TEAM_ESCAPED_IN_SUBMARINE 0x70
#define FLAG_LEGENDARY_BATTLE_COMPLETED     0x71 // defeated or caught Groudon/Kyogre in Cave of Origin

#define FLAG_RECEIVED_METEORITE             0x73
#define FLAG_ADVENTURE_STARTED              0x74 // received pokedex and set loose

#define FLAG_MET_HIDDEN_POWER_GIVER         0x76

#define FLAG_RECEIVED_TM31                  0x79
#define FLAG_RECEIVED_HM03                  0x7A
#define FLAG_RECEIVED_HM08                  0x7B

#define FLAG_DEFEATED_WALLY_VICTORY_ROAD    0x7E
#define FLAG_MET_PRETTY_PETAL_SHOP_OWNER    0x7F

#define FLAG_LEGEND_ESCAPED_SEAFLOOR_CAVERN 0x81
#define FLAG_DEFEATED_RIVAL_ROUTE103        0x82
#define FLAG_RECEIVED_DOLL_LANETTE          0x83
#define FLAG_RECEIVED_POTION_OLDALE         0x84
#define FLAG_RECEIVED_AMULET_COIN           0x85
#define FLAG_PENDING_DAYCARE_EGG            0x86
#define FLAG_THANKED_FOR_PLAYING_WITH_WALLY 0x87

#define FLAG_RECEIVED_HM01                  0x89

#define FLAG_DEFEATED_EVIL_TEAM_MT_CHIMNEY  0x8B
#define FLAG_RECEIVED_6_SODA_POP            0x8C
#define FLAG_DEFEATED_SEASHORE_HOUSE_TRAINERS 0x8D
#define FLAG_DEVON_GOODS_STOLEN             0x8E
#define FLAG_RECOVERED_DEVON_GOODS          0x8F
#define FLAG_RETURNED_DEVON_GOODS           0x90

#define FLAG_MR_BRINEY_SAILING_INTRO        0x93
#define FLAG_DOCK_REJECTED_DEVON_GOODS      0x94
#define FLAG_DELIVERED_DEVON_GOODS          0x95
#define FLAG_RECEIVED_CONTEST_PASS          0x96
#define FLAG_RECEIVED_CASTFORM              0x97
#define FLAG_RECEIVED_SUPER_ROD             0x98
#define FLAG_RUSTBORO_NPC_TRADE_COMPLETED   0x99
#define FLAG_PACIFIDLOG_NPC_TRADE_COMPLETED 0x9A
#define FLAG_FORTREE_NPC_TRADE_COMPLETED    0x9B

#define FLAG_UNKNOWN_9F                     0x9F
#define FLAG_COOL_PAINTING_MADE             0xA0
#define FLAG_BEAUTY_PAINTING_MADE           0xA1
#define FLAG_CUTE_PAINTING_MADE             0xA2
#define FLAG_SMART_PAINTING_MADE            0xA3
#define FLAG_TOUGH_PAINTING_MADE            0xA4
#define FLAG_RECEIVED_TM39                  0xA5
#define FLAG_RECEIVED_TM08                  0xA6
#define FLAG_RECEIVED_TM34                  0xA7
#define FLAG_RECEIVED_TM50                  0xA8
#define FLAG_RECEIVED_TM42                  0xA9
#define FLAG_RECEIVED_TM40                  0xAA
#define FLAG_RECEIVED_TM04                  0xAB
#define FLAG_RECEIVED_TM03                  0xAC
#define FLAG_SECRET_BASE_UNKNOWN_1          0xAD
#define FLAG_SECRET_BASE_UNKNOWN_2          0xAE
#define FLAG_SECRET_BASE_UNKNOWN_3          0xAF
#define FLAG_SECRET_BASE_UNKNOWN_4          0xB0
#define FLAG_SECRET_BASE_UNKNOWN_5          0xB1
#define FLAG_SECRET_BASE_UNKNOWN_6          0xB2
#define FLAG_SECRET_BASE_UNKNOWN_7          0xB3
#define FLAG_SECRET_BASE_UNKNOWN_8          0xB4
#define FLAG_SECRET_BASE_UNKNOWN_9          0xB5
#define FLAG_SECRET_BASE_UNKNOWN_10         0xB6
#define FLAG_SECRET_BASE_UNKNOWN_11         0xB7
#define FLAG_SECRET_BASE_UNKNOWN_12         0xB8
#define FLAG_SECRET_BASE_UNKNOWN_13         0xB9
#define FLAG_SECRET_BASE_UNKNOWN_14         0xBA
#define FLAG_SECRET_BASE_UNKNOWN_15         0xBB
#define FLAG_RECEIVED_POKENAV               0xBC
#define FLAG_DELIVERED_STEVEN_LETTER        0xBD
#define FLAG_DEFEATED_WALLY_MAUVILLE        0xBE

#define FLAG_RECEIVED_SUN_STONE_MOSSDEEP    0xC0
#define FLAG_WALLY_SPEECH                   0xC1
#define FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_1  0xC2
#define FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_2  0xC3
#define FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_3  0xC4
#define FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_4  0xC5
#define FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_5  0xC6
#define FLAG_RUSTURF_TUNNEL_OPENED          0xC7

#define FLAG_RECEIVED_TM10       0x108

#define TRAINER_FLAG_START 0x500

// SYSTEM FLAGS

#define SYS_POKEMON_GET  0x800
#define SYS_POKEDEX_GET  0x801
#define SYS_POKENAV_GET  0x802
#define SYS_GAME_CLEAR   0x804
#define SYS_CHAT_USED    0x805
#define SYS_HIPSTER_MEET 0x806

// badges
#define BADGE01_GET 0x807
#define BADGE02_GET 0x808
#define BADGE03_GET 0x809
#define BADGE04_GET 0x80A
#define BADGE05_GET 0x80B
#define BADGE06_GET 0x80C
#define BADGE07_GET 0x80D
#define BADGE08_GET 0x80E

// cities and towns 
#define FLAG_VISITED_LITTLEROOT_TOWN  0x80F
#define FLAG_VISITED_OLDALE_TOWN      0x810
#define FLAG_VISITED_DEWFORD_TOWN     0x811
#define FLAG_VISITED_LAVARIDGE_TOWN   0x812
#define FLAG_VISITED_FALLARBOR_TOWN   0x813
#define FLAG_VISITED_VERDANTURF_TOWN  0x814
#define FLAG_VISITED_PACIFIDLOG_TOWN  0x815
#define FLAG_VISITED_PETALBURG_CITY   0x816
#define FLAG_VISITED_SLATEPORT_CITY   0x817
#define FLAG_VISITED_MAUVILLE_CITY    0x818
#define FLAG_VISITED_RUSTBORO_CITY    0x819
#define FLAG_VISITED_FORTREE_CITY     0x81A
#define FLAG_VISITED_LILYCOVE_CITY    0x81B
#define FLAG_VISITED_MOSSDEEP_CITY    0x81C
#define FLAG_VISITED_SOOTOPOLIS_CITY  0x81D
#define FLAG_VISITED_EVER_GRANDE_CITY 0x81E

#define SYS_USE_FLASH        0x828
#define SYS_USE_STRENGTH     0x829
#define SYS_WEATHER_CTRL     0x82A
#define SYS_CYCLING_ROAD     0x82B
#define SYS_SAFARI_MODE      0x82C
#define SYS_CRUISE_MODE      0x82D

#define SYS_TV_HOME          0x830
#define SYS_TV_WATCH         0x831
#define SYS_TV_START         0x832
#define SYS_POPWORD_INPUT    0x833
#define SYS_MIX_RECORD       0x834
#define SYS_CLOCK_SET        0x835
#define SYS_NATIONAL_DEX     0x836
#define SYS_CAVE_SHIP        0x837
#define SYS_CAVE_WONDER      0x838
#define SYS_CAVE_BATTLE      0x839
#define SYS_SHOAL_TIDE       0x83A
#define SYS_RIBBON_GET       0x83B

#define FLAG_UNLOCK_BATTLE_TOWER    0x848
#define FLAG_UNLOCK_SOUTHERN_ISLAND 0x849

#define SYS_PC_LANETTE       0x84B
#define SYS_EXDATA_ENABLE    0x84C
#define SYS_ENC_UP_ITEM      0x84D
#define SYS_ENC_DOWN_ITEM    0x84E
#define SYS_BRAILLE_DIG      0x84F
#define SYS_BRAILLE_STRENGTH 0x850
#define SYS_BRAILLE_WAIT     0x851
#define SYS_BRAILLE_FLY      0x852
#define SYS_HAS_EON_TICKET   0x853

#define SYS_POKEMON_LEAGUE_FLY 0x854

#define SYS_TV_LATI          0x85D

#define SYS_SHOAL_ITEM       0x85F
#define SYS_B_DASH           0x860 // got Running Shoes
#define SYS_CTRL_OBJ_DELETE  0x861
#define SYS_RESET_RTC_ENABLE 0x862

// SPECIAL FLAGS (unknown purpose)

#define SPECIAL_FLAG_1 0x4001

#endif // GUARD_CONSTANTS_FLAGS_H
