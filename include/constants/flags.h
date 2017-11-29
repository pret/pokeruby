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

// scripts
#define FLAG_PENDING_DAYCARE_EGG 0x86

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
