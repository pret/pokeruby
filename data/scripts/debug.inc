.if DEBUG

DebugScript_081C1CFE:: @ 81C1CFE
	setflag FLAG_SYS_GAME_CLEAR
	call EverGrandeCity_HallOfFame_EventScript_19FC13
	end

DebugScript_081C1D07:: @ 81C1D07
	checkitem ITEM_COIN_CASE, 1
	compare RESULT, 1
	goto_if_eq DebugScript_081C1D1D
	giveitem ITEM_COIN_CASE, 1
	end

DebugScript_081C1D1D:: @ 81C1D1D
	end

DebugScript_081C1D1E:: @ 81C1D1E
	goto Route103_EventScript_14ED46

DebugScript_081C1D23:: @ 81C1D23
	end

DebugScript_081C1D24:: @ 81C1D24
	setvar VAR_NEW_MAUVILLE_STATE, 1
	end

DebugScript_081C1D2A:: @ 81C1D2A
	giveitem ITEM_SS_TICKET, 1
	goto DebugScript_081C1CFE

DebugScript_081C1D34:: @ 81C1D34
	end

DebugScript_081C1D35:: @ 81C1D35
	getpartysize
	compare RESULT, 6
	goto_if_eq DebugScript_081C1D45
	giveegg SPECIES_KYOGRE
	end

DebugScript_081C1D45:: @ 81C1D45
	end

DebugScript_081C1D46:: @ 81C1D46
	giveitem ITEM_POTION, 99
	giveitem ITEM_ANTIDOTE, 99
	giveitem ITEM_BURN_HEAL, 99
	giveitem ITEM_ICE_HEAL, 99
	giveitem ITEM_AWAKENING, 99
	giveitem ITEM_PARALYZE_HEAL, 99
	giveitem ITEM_FULL_RESTORE, 99
	giveitem ITEM_MAX_POTION, 99
	giveitem ITEM_HYPER_POTION, 99
	giveitem ITEM_SUPER_POTION, 99
	giveitem ITEM_FULL_HEAL, 99
	giveitem ITEM_REVIVE, 99
	giveitem ITEM_MAX_REVIVE, 99
	giveitem ITEM_FRESH_WATER, 99
	giveitem ITEM_SODA_POP, 99
	giveitem ITEM_LEMONADE, 99
	giveitem ITEM_MOOMOO_MILK, 99
	giveitem ITEM_ENERGY_POWDER, 99
	giveitem ITEM_ENERGY_ROOT, 99
	giveitem ITEM_HEAL_POWDER, 99
	giveitem ITEM_ORANGE_MAIL, 92
	giveitem ITEM_RETRO_MAIL, 94
	giveitem ITEM_POTION, 89
	giveitem ITEM_MASTER_BALL, 99
	giveitem ITEM_ULTRA_BALL, 99
	giveitem ITEM_GREAT_BALL, 99
	giveitem ITEM_POKE_BALL, 99
	giveitem ITEM_NET_BALL, 99
	giveitem ITEM_DIVE_BALL, 99
	giveitem ITEM_NEST_BALL, 99
	giveitem ITEM_REPEAT_BALL, 99
	giveitem ITEM_TIMER_BALL, 99
	giveitem ITEM_LUXURY_BALL, 99
	giveitem ITEM_PREMIER_BALL, 99
	giveitem ITEM_MASTER_BALL, 99
	giveitem ITEM_MASTER_BALL, 99
	giveitem ITEM_MASTER_BALL, 99
	giveitem ITEM_MASTER_BALL, 99
	giveitem ITEM_MASTER_BALL, 99
	giveitem ITEM_MASTER_BALL, 99
	giveitem ITEM_MASTER_BALL, 99
	giveitem ITEM_MASTER_BALL, 99
	giveitem ITEM_MASTER_BALL, 99
	giveitem ITEM_GREAT_BALL, 79
	giveitem ITEM_ULTRA_BALL, 84
	giveitem ITEM_POKE_BALL, 89
	giveitem ITEM_MASTER_BALL, 74
	giveitem ITEM_TM01_FOCUS_PUNCH, 99
	giveitem ITEM_TM02_DRAGON_CLAW, 99
	giveitem ITEM_TM03_WATER_PULSE, 99
	giveitem ITEM_TM04_CALM_MIND, 99
	giveitem ITEM_TM05_ROAR, 99
	giveitem ITEM_TM06_TOXIC, 99
	giveitem ITEM_TM07_HAIL, 99
	giveitem ITEM_TM08_BULK_UP, 99
	giveitem ITEM_TM09_BULLET_SEED, 99
	giveitem ITEM_TM10_HIDDEN_POWER, 99
	giveitem ITEM_TM11_SUNNY_DAY, 99
	giveitem ITEM_TM12_TAUNT, 99
	giveitem ITEM_TM13_ICE_BEAM, 99
	giveitem ITEM_TM14_BLIZZARD, 99
	giveitem ITEM_TM15_HYPER_BEAM, 99
	giveitem ITEM_TM16_LIGHT_SCREEN, 99
	giveitem ITEM_TM17_PROTECT, 99
	giveitem ITEM_TM18_RAIN_DANCE, 99
	giveitem ITEM_TM19_GIGA_DRAIN, 99
	giveitem ITEM_TM20_SAFEGUARD, 99
	giveitem ITEM_TM21_FRUSTRATION, 99
	giveitem ITEM_TM22_SOLARBEAM, 99
	giveitem ITEM_TM23_IRON_TAIL, 99
	giveitem ITEM_TM24_THUNDERBOLT, 99
	giveitem ITEM_TM25_THUNDER, 99
	giveitem ITEM_TM26_EARTHQUAKE, 99
	giveitem ITEM_TM27_RETURN, 99
	giveitem ITEM_TM28_DIG, 99
	giveitem ITEM_TM29_PSYCHIC, 99
	giveitem ITEM_TM30_SHADOW_BALL, 99
	giveitem ITEM_TM31_BRICK_BREAK, 99
	giveitem ITEM_TM32_DOUBLE_TEAM, 99
	giveitem ITEM_TM33_REFLECT, 99
	giveitem ITEM_TM34_SHOCK_WAVE, 99
	giveitem ITEM_TM35_FLAMETHROWER, 99
	giveitem ITEM_TM36_SLUDGE_BOMB, 99
	giveitem ITEM_TM37_SANDSTORM, 99
	giveitem ITEM_TM38_FIRE_BLAST, 99
	giveitem ITEM_TM39_ROCK_TOMB, 99
	giveitem ITEM_TM40_AERIAL_ACE, 99
	giveitem ITEM_TM41_TORMENT, 99
	giveitem ITEM_TM42_FACADE, 99
	giveitem ITEM_TM43_SECRET_POWER, 99
	giveitem ITEM_TM44_REST, 99
	giveitem ITEM_TM45_ATTRACT, 99
	giveitem ITEM_TM46_THIEF, 99
	giveitem ITEM_TM47_STEEL_WING, 99
	giveitem ITEM_TM48_SKILL_SWAP, 99
	giveitem ITEM_TM49_SNATCH, 99
	giveitem ITEM_TM50_OVERHEAT, 99
	giveitem ITEM_CHERI_BERRY, 200
	giveitem ITEM_CHERI_BERRY, 200
	giveitem ITEM_CHERI_BERRY, 200
	giveitem ITEM_CHERI_BERRY, 200
	giveitem ITEM_CHERI_BERRY, 199
	giveitem ITEM_CHESTO_BERRY, 200
	giveitem ITEM_CHESTO_BERRY, 200
	giveitem ITEM_CHESTO_BERRY, 200
	giveitem ITEM_CHESTO_BERRY, 200
	giveitem ITEM_CHESTO_BERRY, 199
	giveitem ITEM_PECHA_BERRY, 200
	giveitem ITEM_PECHA_BERRY, 200
	giveitem ITEM_PECHA_BERRY, 200
	giveitem ITEM_PECHA_BERRY, 200
	giveitem ITEM_PECHA_BERRY, 199
	giveitem ITEM_RAWST_BERRY, 200
	giveitem ITEM_RAWST_BERRY, 200
	giveitem ITEM_RAWST_BERRY, 200
	giveitem ITEM_RAWST_BERRY, 200
	giveitem ITEM_RAWST_BERRY, 199
	giveitem ITEM_ASPEAR_BERRY, 200
	giveitem ITEM_ASPEAR_BERRY, 200
	giveitem ITEM_ASPEAR_BERRY, 200
	giveitem ITEM_ASPEAR_BERRY, 200
	giveitem ITEM_ASPEAR_BERRY, 199
	giveitem ITEM_LEPPA_BERRY, 200
	giveitem ITEM_LEPPA_BERRY, 200
	giveitem ITEM_LEPPA_BERRY, 200
	giveitem ITEM_LEPPA_BERRY, 200
	giveitem ITEM_LEPPA_BERRY, 199
	giveitem ITEM_ORAN_BERRY, 200
	giveitem ITEM_ORAN_BERRY, 200
	giveitem ITEM_ORAN_BERRY, 200
	giveitem ITEM_ORAN_BERRY, 200
	giveitem ITEM_ORAN_BERRY, 199
	giveitem ITEM_PERSIM_BERRY, 200
	giveitem ITEM_PERSIM_BERRY, 200
	giveitem ITEM_PERSIM_BERRY, 200
	giveitem ITEM_PERSIM_BERRY, 200
	giveitem ITEM_PERSIM_BERRY, 199
	giveitem ITEM_LUM_BERRY, 200
	giveitem ITEM_LUM_BERRY, 200
	giveitem ITEM_LUM_BERRY, 200
	giveitem ITEM_LUM_BERRY, 200
	giveitem ITEM_LUM_BERRY, 199
	giveitem ITEM_SITRUS_BERRY, 200
	giveitem ITEM_SITRUS_BERRY, 200
	giveitem ITEM_SITRUS_BERRY, 200
	giveitem ITEM_SITRUS_BERRY, 200
	giveitem ITEM_SITRUS_BERRY, 199
	giveitem ITEM_FIGY_BERRY, 200
	giveitem ITEM_FIGY_BERRY, 200
	giveitem ITEM_FIGY_BERRY, 200
	giveitem ITEM_FIGY_BERRY, 200
	giveitem ITEM_FIGY_BERRY, 199
	giveitem ITEM_WIKI_BERRY, 200
	giveitem ITEM_WIKI_BERRY, 200
	giveitem ITEM_WIKI_BERRY, 200
	giveitem ITEM_WIKI_BERRY, 200
	giveitem ITEM_WIKI_BERRY, 199
	giveitem ITEM_MAGO_BERRY, 200
	giveitem ITEM_MAGO_BERRY, 200
	giveitem ITEM_MAGO_BERRY, 200
	giveitem ITEM_MAGO_BERRY, 200
	giveitem ITEM_MAGO_BERRY, 199
	giveitem ITEM_AGUAV_BERRY, 200
	giveitem ITEM_AGUAV_BERRY, 200
	giveitem ITEM_AGUAV_BERRY, 200
	giveitem ITEM_AGUAV_BERRY, 200
	giveitem ITEM_AGUAV_BERRY, 199
	giveitem ITEM_IAPAPA_BERRY, 200
	giveitem ITEM_IAPAPA_BERRY, 200
	giveitem ITEM_IAPAPA_BERRY, 200
	giveitem ITEM_IAPAPA_BERRY, 200
	giveitem ITEM_IAPAPA_BERRY, 199
	giveitem ITEM_RAZZ_BERRY, 200
	giveitem ITEM_RAZZ_BERRY, 200
	giveitem ITEM_RAZZ_BERRY, 200
	giveitem ITEM_RAZZ_BERRY, 200
	giveitem ITEM_RAZZ_BERRY, 199
	giveitem ITEM_BLUK_BERRY, 200
	giveitem ITEM_BLUK_BERRY, 200
	giveitem ITEM_BLUK_BERRY, 200
	giveitem ITEM_BLUK_BERRY, 200
	giveitem ITEM_BLUK_BERRY, 199
	giveitem ITEM_NANAB_BERRY, 200
	giveitem ITEM_NANAB_BERRY, 200
	giveitem ITEM_NANAB_BERRY, 200
	giveitem ITEM_NANAB_BERRY, 200
	giveitem ITEM_NANAB_BERRY, 199
	giveitem ITEM_WEPEAR_BERRY, 200
	giveitem ITEM_WEPEAR_BERRY, 200
	giveitem ITEM_WEPEAR_BERRY, 200
	giveitem ITEM_WEPEAR_BERRY, 200
	giveitem ITEM_WEPEAR_BERRY, 199
	giveitem ITEM_PINAP_BERRY, 200
	giveitem ITEM_PINAP_BERRY, 200
	giveitem ITEM_PINAP_BERRY, 200
	giveitem ITEM_PINAP_BERRY, 200
	giveitem ITEM_PINAP_BERRY, 199
	giveitem ITEM_POMEG_BERRY, 200
	giveitem ITEM_POMEG_BERRY, 200
	giveitem ITEM_POMEG_BERRY, 200
	giveitem ITEM_POMEG_BERRY, 200
	giveitem ITEM_POMEG_BERRY, 199
	giveitem ITEM_KELPSY_BERRY, 200
	giveitem ITEM_KELPSY_BERRY, 200
	giveitem ITEM_KELPSY_BERRY, 200
	giveitem ITEM_KELPSY_BERRY, 200
	giveitem ITEM_KELPSY_BERRY, 199
	giveitem ITEM_QUALOT_BERRY, 200
	giveitem ITEM_QUALOT_BERRY, 200
	giveitem ITEM_QUALOT_BERRY, 200
	giveitem ITEM_QUALOT_BERRY, 200
	giveitem ITEM_QUALOT_BERRY, 199
	giveitem ITEM_HONDEW_BERRY, 200
	giveitem ITEM_HONDEW_BERRY, 200
	giveitem ITEM_HONDEW_BERRY, 200
	giveitem ITEM_HONDEW_BERRY, 200
	giveitem ITEM_HONDEW_BERRY, 199
	giveitem ITEM_GREPA_BERRY, 200
	giveitem ITEM_GREPA_BERRY, 200
	giveitem ITEM_GREPA_BERRY, 200
	giveitem ITEM_GREPA_BERRY, 200
	giveitem ITEM_GREPA_BERRY, 199
	giveitem ITEM_TAMATO_BERRY, 200
	giveitem ITEM_TAMATO_BERRY, 200
	giveitem ITEM_TAMATO_BERRY, 200
	giveitem ITEM_TAMATO_BERRY, 200
	giveitem ITEM_TAMATO_BERRY, 199
	giveitem ITEM_CORNN_BERRY, 200
	giveitem ITEM_CORNN_BERRY, 200
	giveitem ITEM_CORNN_BERRY, 200
	giveitem ITEM_CORNN_BERRY, 200
	giveitem ITEM_CORNN_BERRY, 199
	giveitem ITEM_MAGOST_BERRY, 999
	giveitem ITEM_RABUTA_BERRY, 999
	giveitem ITEM_NOMEL_BERRY, 999
	giveitem ITEM_SPELON_BERRY, 999
	giveitem ITEM_PAMTRE_BERRY, 999
	giveitem ITEM_WATMEL_BERRY, 999
	giveitem ITEM_DURIN_BERRY, 999
	giveitem ITEM_BELUE_BERRY, 999
	giveitem ITEM_LIECHI_BERRY, 999
	giveitem ITEM_GANLON_BERRY, 999
	giveitem ITEM_SALAC_BERRY, 999
	giveitem ITEM_PETAYA_BERRY, 999
	giveitem ITEM_APICOT_BERRY, 999
	giveitem ITEM_LANSAT_BERRY, 999
	giveitem ITEM_STARF_BERRY, 999
	giveitem ITEM_ENIGMA_BERRY, 999
	end

DebugScript_081C221F:: @ 81C221F
	givedecoration DECOR_SMALL_DESK
	givedecoration DECOR_SMALL_DESK
	givedecoration DECOR_SMALL_DESK
	givedecoration DECOR_SMALL_DESK
	givedecoration DECOR_SMALL_DESK
	givedecoration DECOR_SMALL_DESK
	givedecoration DECOR_SMALL_DESK
	givedecoration DECOR_SMALL_DESK
	givedecoration DECOR_SMALL_DESK
	givedecoration DECOR_SMALL_DESK
	givedecoration DECOR_SMALL_CHAIR
	givedecoration DECOR_SMALL_CHAIR
	givedecoration DECOR_SMALL_CHAIR
	givedecoration DECOR_SMALL_CHAIR
	givedecoration DECOR_SMALL_CHAIR
	givedecoration DECOR_SMALL_CHAIR
	givedecoration DECOR_SMALL_CHAIR
	givedecoration DECOR_SMALL_CHAIR
	givedecoration DECOR_SMALL_CHAIR
	givedecoration DECOR_SMALL_CHAIR
	givedecoration DECOR_RED_PLANT
	givedecoration DECOR_RED_PLANT
	givedecoration DECOR_RED_PLANT
	givedecoration DECOR_RED_PLANT
	givedecoration DECOR_RED_PLANT
	givedecoration DECOR_RED_PLANT
	givedecoration DECOR_RED_PLANT
	givedecoration DECOR_RED_PLANT
	givedecoration DECOR_RED_PLANT
	givedecoration DECOR_RED_PLANT
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_RED_BRICK
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_JUMP_MAT
	givedecoration DECOR_BALL_POSTER
	givedecoration DECOR_BALL_POSTER
	givedecoration DECOR_BALL_POSTER
	givedecoration DECOR_BALL_POSTER
	givedecoration DECOR_BALL_POSTER
	givedecoration DECOR_BALL_POSTER
	givedecoration DECOR_BALL_POSTER
	givedecoration DECOR_BALL_POSTER
	givedecoration DECOR_BALL_POSTER
	givedecoration DECOR_BALL_POSTER
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_DUSKULL_DOLL
	givedecoration DECOR_KISS_CUSHION
	givedecoration DECOR_KISS_CUSHION
	givedecoration DECOR_KISS_CUSHION
	givedecoration DECOR_KISS_CUSHION
	givedecoration DECOR_KISS_CUSHION
	givedecoration DECOR_KISS_CUSHION
	givedecoration DECOR_KISS_CUSHION
	givedecoration DECOR_KISS_CUSHION
	givedecoration DECOR_KISS_CUSHION
	givedecoration DECOR_KISS_CUSHION
	end

DebugScript_081C23E2:: @ 81C23E2
	givecoins 9999
	end

DebugScript_081C23E6:: @ 81C23E6
	setflag FLAG_LEGEND_ESCAPED_SEAFLOOR_CAVERN
	setflag FLAG_LEGENDARY_BATTLE_COMPLETED
	warp MAP_SOOTOPOLIS_CITY, 0xFF, 31, 33
	waitstate
	end

DebugScript_081C23F6:: @ 81C23F6
	takemoney 999999, 0x00
	end

DebugScript_081C23FD:: @ 81C23FD
	getpartysize
	compare RESULT, 1
	goto_if_eq DebugScript_081C2436
	compare RESULT, 2
	goto_if_eq DebugScript_081C2445
	compare RESULT, 3
	goto_if_eq DebugScript_081C2454
	compare RESULT, 4
	goto_if_eq DebugScript_081C2463
	compare RESULT, 5
	goto_if_eq DebugScript_081C2472
	end

DebugScript_081C2436:: @ 81C2436
	givemon SPECIES_BARBOACH, 99, 0, 0, 0, 0
DebugScript_081C2445:
	givemon SPECIES_BARBOACH, 99, 0, 0, 0, 0
DebugScript_081C2454:
	givemon SPECIES_BARBOACH, 99, 0, 0, 0, 0
DebugScript_081C2463:
	givemon SPECIES_BARBOACH, 99, 0, 0, 0, 0
DebugScript_081C2472:
	givemon SPECIES_BARBOACH, 99, 0, 0, 0, 0
	end

DebugScript_081C2482:: @ 81C2482
	getpartysize
	compare RESULT, 1
	goto_if_eq DebugScript_081C24BB
	compare RESULT, 2
	goto_if_eq DebugScript_081C24CA
	compare RESULT, 3
	goto_if_eq DebugScript_081C24D9
	compare RESULT, 4
	goto_if_eq DebugScript_081C24E8
	compare RESULT, 5
	goto_if_eq DebugScript_081C24F7
	end

DebugScript_081C24BB:: @ 81C24BB
	givemon SPECIES_SHROOMISH, 99, 0, 0, 0, 0
DebugScript_081C24CA:
	givemon SPECIES_SHROOMISH, 99, 0, 0, 0, 0
DebugScript_081C24D9:
	givemon SPECIES_SHROOMISH, 99, 0, 0, 0, 0
DebugScript_081C24E8:
	givemon SPECIES_SHROOMISH, 99, 0, 0, 0, 0
DebugScript_081C24F7:
	givemon SPECIES_SHROOMISH, 99, 0, 0, 0, 0
	end

DebugScript_081C2507:: @ 81C2507
	getpartysize
	compare RESULT, 6
	goto_if_eq DebugScript_081C2517
	giveegg SPECIES_BARBOACH
	end

DebugScript_081C2517:: @ 81C2517
	end

DebugScript_081C2518:: @ 81C2518
	getpartysize
	compare RESULT, 6
	goto_if_eq DebugScript_081C2528
	giveegg SPECIES_SHROOMISH
	end

DebugScript_081C2528:: @ 81C2528
	end

.endif
