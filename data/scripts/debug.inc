.if DEBUG

DebugScript_081C1CFE:: @ 81C1CFE
	setflag FLAG_SYS_GAME_CLEAR
	call EverGrandeCity_HallOfFame_EventScript_19FC13
	end

DebugScript_081C1D07:: @ 81C1D07
	checkitem ITEM_COIN_CASE, 1
	compare VAR_RESULT, 1
	goto_if_eq DebugScript_081C1D1D
	additem ITEM_COIN_CASE, 1
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
	additem ITEM_SS_TICKET, 1
	goto DebugScript_081C1CFE

DebugScript_081C1D34:: @ 81C1D34
	end

DebugScript_081C1D35:: @ 81C1D35
	getpartysize
	compare VAR_RESULT, 6
	goto_if_eq DebugScript_081C1D45
	giveegg SPECIES_KYOGRE
	end

DebugScript_081C1D45:: @ 81C1D45
	end

DebugScript_081C1D46:: @ 81C1D46
	additem ITEM_POTION, 99
	additem ITEM_ANTIDOTE, 99
	additem ITEM_BURN_HEAL, 99
	additem ITEM_ICE_HEAL, 99
	additem ITEM_AWAKENING, 99
	additem ITEM_PARALYZE_HEAL, 99
	additem ITEM_FULL_RESTORE, 99
	additem ITEM_MAX_POTION, 99
	additem ITEM_HYPER_POTION, 99
	additem ITEM_SUPER_POTION, 99
	additem ITEM_FULL_HEAL, 99
	additem ITEM_REVIVE, 99
	additem ITEM_MAX_REVIVE, 99
	additem ITEM_FRESH_WATER, 99
	additem ITEM_SODA_POP, 99
	additem ITEM_LEMONADE, 99
	additem ITEM_MOOMOO_MILK, 99
	additem ITEM_ENERGY_POWDER, 99
	additem ITEM_ENERGY_ROOT, 99
	additem ITEM_HEAL_POWDER, 99
	additem ITEM_ORANGE_MAIL, 92
	additem ITEM_RETRO_MAIL, 94
	additem ITEM_POTION, 89
	additem ITEM_MASTER_BALL, 99
	additem ITEM_ULTRA_BALL, 99
	additem ITEM_GREAT_BALL, 99
	additem ITEM_POKE_BALL, 99
	additem ITEM_NET_BALL, 99
	additem ITEM_DIVE_BALL, 99
	additem ITEM_NEST_BALL, 99
	additem ITEM_REPEAT_BALL, 99
	additem ITEM_TIMER_BALL, 99
	additem ITEM_LUXURY_BALL, 99
	additem ITEM_PREMIER_BALL, 99
	additem ITEM_MASTER_BALL, 99
	additem ITEM_MASTER_BALL, 99
	additem ITEM_MASTER_BALL, 99
	additem ITEM_MASTER_BALL, 99
	additem ITEM_MASTER_BALL, 99
	additem ITEM_MASTER_BALL, 99
	additem ITEM_MASTER_BALL, 99
	additem ITEM_MASTER_BALL, 99
	additem ITEM_MASTER_BALL, 99
	additem ITEM_GREAT_BALL, 79
	additem ITEM_ULTRA_BALL, 84
	additem ITEM_POKE_BALL, 89
	additem ITEM_MASTER_BALL, 74
	additem ITEM_TM01_FOCUS_PUNCH, 99
	additem ITEM_TM02_DRAGON_CLAW, 99
	additem ITEM_TM03_WATER_PULSE, 99
	additem ITEM_TM04_CALM_MIND, 99
	additem ITEM_TM05_ROAR, 99
	additem ITEM_TM06_TOXIC, 99
	additem ITEM_TM07_HAIL, 99
	additem ITEM_TM08_BULK_UP, 99
	additem ITEM_TM09_BULLET_SEED, 99
	additem ITEM_TM10_HIDDEN_POWER, 99
	additem ITEM_TM11_SUNNY_DAY, 99
	additem ITEM_TM12_TAUNT, 99
	additem ITEM_TM13_ICE_BEAM, 99
	additem ITEM_TM14_BLIZZARD, 99
	additem ITEM_TM15_HYPER_BEAM, 99
	additem ITEM_TM16_LIGHT_SCREEN, 99
	additem ITEM_TM17_PROTECT, 99
	additem ITEM_TM18_RAIN_DANCE, 99
	additem ITEM_TM19_GIGA_DRAIN, 99
	additem ITEM_TM20_SAFEGUARD, 99
	additem ITEM_TM21_FRUSTRATION, 99
	additem ITEM_TM22_SOLARBEAM, 99
	additem ITEM_TM23_IRON_TAIL, 99
	additem ITEM_TM24_THUNDERBOLT, 99
	additem ITEM_TM25_THUNDER, 99
	additem ITEM_TM26_EARTHQUAKE, 99
	additem ITEM_TM27_RETURN, 99
	additem ITEM_TM28_DIG, 99
	additem ITEM_TM29_PSYCHIC, 99
	additem ITEM_TM30_SHADOW_BALL, 99
	additem ITEM_TM31_BRICK_BREAK, 99
	additem ITEM_TM32_DOUBLE_TEAM, 99
	additem ITEM_TM33_REFLECT, 99
	additem ITEM_TM34_SHOCK_WAVE, 99
	additem ITEM_TM35_FLAMETHROWER, 99
	additem ITEM_TM36_SLUDGE_BOMB, 99
	additem ITEM_TM37_SANDSTORM, 99
	additem ITEM_TM38_FIRE_BLAST, 99
	additem ITEM_TM39_ROCK_TOMB, 99
	additem ITEM_TM40_AERIAL_ACE, 99
	additem ITEM_TM41_TORMENT, 99
	additem ITEM_TM42_FACADE, 99
	additem ITEM_TM43_SECRET_POWER, 99
	additem ITEM_TM44_REST, 99
	additem ITEM_TM45_ATTRACT, 99
	additem ITEM_TM46_THIEF, 99
	additem ITEM_TM47_STEEL_WING, 99
	additem ITEM_TM48_SKILL_SWAP, 99
	additem ITEM_TM49_SNATCH, 99
	additem ITEM_TM50_OVERHEAT, 99
	additem ITEM_CHERI_BERRY, 200
	additem ITEM_CHERI_BERRY, 200
	additem ITEM_CHERI_BERRY, 200
	additem ITEM_CHERI_BERRY, 200
	additem ITEM_CHERI_BERRY, 199
	additem ITEM_CHESTO_BERRY, 200
	additem ITEM_CHESTO_BERRY, 200
	additem ITEM_CHESTO_BERRY, 200
	additem ITEM_CHESTO_BERRY, 200
	additem ITEM_CHESTO_BERRY, 199
	additem ITEM_PECHA_BERRY, 200
	additem ITEM_PECHA_BERRY, 200
	additem ITEM_PECHA_BERRY, 200
	additem ITEM_PECHA_BERRY, 200
	additem ITEM_PECHA_BERRY, 199
	additem ITEM_RAWST_BERRY, 200
	additem ITEM_RAWST_BERRY, 200
	additem ITEM_RAWST_BERRY, 200
	additem ITEM_RAWST_BERRY, 200
	additem ITEM_RAWST_BERRY, 199
	additem ITEM_ASPEAR_BERRY, 200
	additem ITEM_ASPEAR_BERRY, 200
	additem ITEM_ASPEAR_BERRY, 200
	additem ITEM_ASPEAR_BERRY, 200
	additem ITEM_ASPEAR_BERRY, 199
	additem ITEM_LEPPA_BERRY, 200
	additem ITEM_LEPPA_BERRY, 200
	additem ITEM_LEPPA_BERRY, 200
	additem ITEM_LEPPA_BERRY, 200
	additem ITEM_LEPPA_BERRY, 199
	additem ITEM_ORAN_BERRY, 200
	additem ITEM_ORAN_BERRY, 200
	additem ITEM_ORAN_BERRY, 200
	additem ITEM_ORAN_BERRY, 200
	additem ITEM_ORAN_BERRY, 199
	additem ITEM_PERSIM_BERRY, 200
	additem ITEM_PERSIM_BERRY, 200
	additem ITEM_PERSIM_BERRY, 200
	additem ITEM_PERSIM_BERRY, 200
	additem ITEM_PERSIM_BERRY, 199
	additem ITEM_LUM_BERRY, 200
	additem ITEM_LUM_BERRY, 200
	additem ITEM_LUM_BERRY, 200
	additem ITEM_LUM_BERRY, 200
	additem ITEM_LUM_BERRY, 199
	additem ITEM_SITRUS_BERRY, 200
	additem ITEM_SITRUS_BERRY, 200
	additem ITEM_SITRUS_BERRY, 200
	additem ITEM_SITRUS_BERRY, 200
	additem ITEM_SITRUS_BERRY, 199
	additem ITEM_FIGY_BERRY, 200
	additem ITEM_FIGY_BERRY, 200
	additem ITEM_FIGY_BERRY, 200
	additem ITEM_FIGY_BERRY, 200
	additem ITEM_FIGY_BERRY, 199
	additem ITEM_WIKI_BERRY, 200
	additem ITEM_WIKI_BERRY, 200
	additem ITEM_WIKI_BERRY, 200
	additem ITEM_WIKI_BERRY, 200
	additem ITEM_WIKI_BERRY, 199
	additem ITEM_MAGO_BERRY, 200
	additem ITEM_MAGO_BERRY, 200
	additem ITEM_MAGO_BERRY, 200
	additem ITEM_MAGO_BERRY, 200
	additem ITEM_MAGO_BERRY, 199
	additem ITEM_AGUAV_BERRY, 200
	additem ITEM_AGUAV_BERRY, 200
	additem ITEM_AGUAV_BERRY, 200
	additem ITEM_AGUAV_BERRY, 200
	additem ITEM_AGUAV_BERRY, 199
	additem ITEM_IAPAPA_BERRY, 200
	additem ITEM_IAPAPA_BERRY, 200
	additem ITEM_IAPAPA_BERRY, 200
	additem ITEM_IAPAPA_BERRY, 200
	additem ITEM_IAPAPA_BERRY, 199
	additem ITEM_RAZZ_BERRY, 200
	additem ITEM_RAZZ_BERRY, 200
	additem ITEM_RAZZ_BERRY, 200
	additem ITEM_RAZZ_BERRY, 200
	additem ITEM_RAZZ_BERRY, 199
	additem ITEM_BLUK_BERRY, 200
	additem ITEM_BLUK_BERRY, 200
	additem ITEM_BLUK_BERRY, 200
	additem ITEM_BLUK_BERRY, 200
	additem ITEM_BLUK_BERRY, 199
	additem ITEM_NANAB_BERRY, 200
	additem ITEM_NANAB_BERRY, 200
	additem ITEM_NANAB_BERRY, 200
	additem ITEM_NANAB_BERRY, 200
	additem ITEM_NANAB_BERRY, 199
	additem ITEM_WEPEAR_BERRY, 200
	additem ITEM_WEPEAR_BERRY, 200
	additem ITEM_WEPEAR_BERRY, 200
	additem ITEM_WEPEAR_BERRY, 200
	additem ITEM_WEPEAR_BERRY, 199
	additem ITEM_PINAP_BERRY, 200
	additem ITEM_PINAP_BERRY, 200
	additem ITEM_PINAP_BERRY, 200
	additem ITEM_PINAP_BERRY, 200
	additem ITEM_PINAP_BERRY, 199
	additem ITEM_POMEG_BERRY, 200
	additem ITEM_POMEG_BERRY, 200
	additem ITEM_POMEG_BERRY, 200
	additem ITEM_POMEG_BERRY, 200
	additem ITEM_POMEG_BERRY, 199
	additem ITEM_KELPSY_BERRY, 200
	additem ITEM_KELPSY_BERRY, 200
	additem ITEM_KELPSY_BERRY, 200
	additem ITEM_KELPSY_BERRY, 200
	additem ITEM_KELPSY_BERRY, 199
	additem ITEM_QUALOT_BERRY, 200
	additem ITEM_QUALOT_BERRY, 200
	additem ITEM_QUALOT_BERRY, 200
	additem ITEM_QUALOT_BERRY, 200
	additem ITEM_QUALOT_BERRY, 199
	additem ITEM_HONDEW_BERRY, 200
	additem ITEM_HONDEW_BERRY, 200
	additem ITEM_HONDEW_BERRY, 200
	additem ITEM_HONDEW_BERRY, 200
	additem ITEM_HONDEW_BERRY, 199
	additem ITEM_GREPA_BERRY, 200
	additem ITEM_GREPA_BERRY, 200
	additem ITEM_GREPA_BERRY, 200
	additem ITEM_GREPA_BERRY, 200
	additem ITEM_GREPA_BERRY, 199
	additem ITEM_TAMATO_BERRY, 200
	additem ITEM_TAMATO_BERRY, 200
	additem ITEM_TAMATO_BERRY, 200
	additem ITEM_TAMATO_BERRY, 200
	additem ITEM_TAMATO_BERRY, 199
	additem ITEM_CORNN_BERRY, 200
	additem ITEM_CORNN_BERRY, 200
	additem ITEM_CORNN_BERRY, 200
	additem ITEM_CORNN_BERRY, 200
	additem ITEM_CORNN_BERRY, 199
	additem ITEM_MAGOST_BERRY, 999
	additem ITEM_RABUTA_BERRY, 999
	additem ITEM_NOMEL_BERRY, 999
	additem ITEM_SPELON_BERRY, 999
	additem ITEM_PAMTRE_BERRY, 999
	additem ITEM_WATMEL_BERRY, 999
	additem ITEM_DURIN_BERRY, 999
	additem ITEM_BELUE_BERRY, 999
	additem ITEM_LIECHI_BERRY, 999
	additem ITEM_GANLON_BERRY, 999
	additem ITEM_SALAC_BERRY, 999
	additem ITEM_PETAYA_BERRY, 999
	additem ITEM_APICOT_BERRY, 999
	additem ITEM_LANSAT_BERRY, 999
	additem ITEM_STARF_BERRY, 999
	additem ITEM_ENIGMA_BERRY, 999
	end

DebugScript_081C221F:: @ 81C221F
	adddecoration DECOR_SMALL_DESK
	adddecoration DECOR_SMALL_DESK
	adddecoration DECOR_SMALL_DESK
	adddecoration DECOR_SMALL_DESK
	adddecoration DECOR_SMALL_DESK
	adddecoration DECOR_SMALL_DESK
	adddecoration DECOR_SMALL_DESK
	adddecoration DECOR_SMALL_DESK
	adddecoration DECOR_SMALL_DESK
	adddecoration DECOR_SMALL_DESK
	adddecoration DECOR_SMALL_CHAIR
	adddecoration DECOR_SMALL_CHAIR
	adddecoration DECOR_SMALL_CHAIR
	adddecoration DECOR_SMALL_CHAIR
	adddecoration DECOR_SMALL_CHAIR
	adddecoration DECOR_SMALL_CHAIR
	adddecoration DECOR_SMALL_CHAIR
	adddecoration DECOR_SMALL_CHAIR
	adddecoration DECOR_SMALL_CHAIR
	adddecoration DECOR_SMALL_CHAIR
	adddecoration DECOR_RED_PLANT
	adddecoration DECOR_RED_PLANT
	adddecoration DECOR_RED_PLANT
	adddecoration DECOR_RED_PLANT
	adddecoration DECOR_RED_PLANT
	adddecoration DECOR_RED_PLANT
	adddecoration DECOR_RED_PLANT
	adddecoration DECOR_RED_PLANT
	adddecoration DECOR_RED_PLANT
	adddecoration DECOR_RED_PLANT
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_RED_BRICK
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_JUMP_MAT
	adddecoration DECOR_BALL_POSTER
	adddecoration DECOR_BALL_POSTER
	adddecoration DECOR_BALL_POSTER
	adddecoration DECOR_BALL_POSTER
	adddecoration DECOR_BALL_POSTER
	adddecoration DECOR_BALL_POSTER
	adddecoration DECOR_BALL_POSTER
	adddecoration DECOR_BALL_POSTER
	adddecoration DECOR_BALL_POSTER
	adddecoration DECOR_BALL_POSTER
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_DUSKULL_DOLL
	adddecoration DECOR_KISS_CUSHION
	adddecoration DECOR_KISS_CUSHION
	adddecoration DECOR_KISS_CUSHION
	adddecoration DECOR_KISS_CUSHION
	adddecoration DECOR_KISS_CUSHION
	adddecoration DECOR_KISS_CUSHION
	adddecoration DECOR_KISS_CUSHION
	adddecoration DECOR_KISS_CUSHION
	adddecoration DECOR_KISS_CUSHION
	adddecoration DECOR_KISS_CUSHION
	end

DebugScript_081C23E2:: @ 81C23E2
	addcoins 9999
	end

DebugScript_081C23E6:: @ 81C23E6
	setflag FLAG_LEGEND_ESCAPED_SEAFLOOR_CAVERN
	setflag FLAG_LEGENDARY_BATTLE_COMPLETED
	warp MAP_SOOTOPOLIS_CITY, 0xFF, 31, 33
	waitstate
	end

DebugScript_081C23F6:: @ 81C23F6
	removemoney 999999, 0
	end

DebugScript_081C23FD:: @ 81C23FD
	getpartysize
	compare VAR_RESULT, 1
	goto_if_eq DebugScript_081C2436
	compare VAR_RESULT, 2
	goto_if_eq DebugScript_081C2445
	compare VAR_RESULT, 3
	goto_if_eq DebugScript_081C2454
	compare VAR_RESULT, 4
	goto_if_eq DebugScript_081C2463
	compare VAR_RESULT, 5
	goto_if_eq DebugScript_081C2472
	end

DebugScript_081C2436:: @ 81C2436
	givemon SPECIES_BARBOACH, 99, ITEM_NONE
DebugScript_081C2445:
	givemon SPECIES_BARBOACH, 99, ITEM_NONE
DebugScript_081C2454:
	givemon SPECIES_BARBOACH, 99, ITEM_NONE
DebugScript_081C2463:
	givemon SPECIES_BARBOACH, 99, ITEM_NONE
DebugScript_081C2472:
	givemon SPECIES_BARBOACH, 99, ITEM_NONE
	end

DebugScript_081C2482:: @ 81C2482
	getpartysize
	compare VAR_RESULT, 1
	goto_if_eq DebugScript_081C24BB
	compare VAR_RESULT, 2
	goto_if_eq DebugScript_081C24CA
	compare VAR_RESULT, 3
	goto_if_eq DebugScript_081C24D9
	compare VAR_RESULT, 4
	goto_if_eq DebugScript_081C24E8
	compare VAR_RESULT, 5
	goto_if_eq DebugScript_081C24F7
	end

DebugScript_081C24BB:: @ 81C24BB
	givemon SPECIES_SHROOMISH, 99, ITEM_NONE
DebugScript_081C24CA:
	givemon SPECIES_SHROOMISH, 99, ITEM_NONE
DebugScript_081C24D9:
	givemon SPECIES_SHROOMISH, 99, ITEM_NONE
DebugScript_081C24E8:
	givemon SPECIES_SHROOMISH, 99, ITEM_NONE
DebugScript_081C24F7:
	givemon SPECIES_SHROOMISH, 99, ITEM_NONE
	end

DebugScript_081C2507:: @ 81C2507
	getpartysize
	compare VAR_RESULT, 6
	goto_if_eq DebugScript_081C2517
	giveegg SPECIES_BARBOACH
	end

DebugScript_081C2517:: @ 81C2517
	end

DebugScript_081C2518:: @ 81C2518
	getpartysize
	compare VAR_RESULT, 6
	goto_if_eq DebugScript_081C2528
	giveegg SPECIES_SHROOMISH
	end

DebugScript_081C2528:: @ 81C2528
	end

.endif
