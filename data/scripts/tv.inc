Event_TV:: @ 81A6E72
	lockall
	incrementgamestat GAME_STAT_WATCHED_TV
	special sub_80C2014
	specialvar RESULT, CheckForBigMovieOrEmergencyNewsOnTV
	compare RESULT, 2
	goto_if_eq EventScript_1A6F01
	compare RESULT, 1
	goto_if_eq EventScript_1A6F0B
	checkflag FLAG_SYS_TV_START
	goto_if 0, EventScript_1A6EF1
	checkflag FLAG_SYS_TV_WATCH
	goto_if_eq EventScript_1A6EF1
	specialvar RESULT, IsTVShowInSearchOfTrainersAiring
	compare RESULT, 1
	goto_if_eq EventScript_1A6F66
	goto EventScript_1A6F50
	end

EventScript_1A6EBB:
	specialvar 0x8004, special_0x44
	compare 0x8004, 255
	goto_if_eq EventScript_1A6F3F
	specialvar RESULT, special_0x4a
	compare RESULT, 255
	goto_if_eq EventScript_1A6F3F
	copyvar 0x8004, RESULT
	specialvar RESULT, sub_80BDA0C
	compare RESULT, 0
	goto_if 5, EventScript_1A6F21
	end

EventScript_1A6EF1:
	special GetMomOrDadStringForTVMessage
	msgbox UnknownString_81A0E68, 4
	special TurnOffTVScreen
	releaseall
	end

EventScript_1A6F01:
	msgbox UnknownString_817288C, 4
	releaseall
	end

EventScript_1A6F0B:
	.ifdef SAPPHIRE
	msgbox UnknownString_8172D30, 4
	.else
	msgbox UnknownString_8172C50, 4
	.endif
	special InitRoamer
	clearflag FLAG_SYS_TV_LATI
	setflag FLAG_LATIOS_OR_LATIAS_ROAMING
	special TurnOffTVScreen
	releaseall
	end

EventScript_1A6F21:
	special DoTVShow
	waitmessage
	waitbuttonpress
	compare RESULT, 1
	goto_if 5, EventScript_1A6F21
	goto EventScript_1A6F37
	end

EventScript_1A6F37:
	special TurnOffTVScreen
	setflag FLAG_SYS_TV_WATCH
	releaseall
	end

EventScript_1A6F3F:
	special GetMomOrDadStringForTVMessage
	msgbox UnknownString_81A0E68, 4
	goto EventScript_1A6F37
	end

EventScript_1A6F50:
	special sub_80BECE8
	compare RESULT, 0
	goto_if_eq EventScript_1A6EBB
	waitmessage
	waitbuttonpress
	goto EventScript_1A6F37
	end

EventScript_1A6F66:
	special DoTVShowInSearchOfTrainers
	waitmessage
	waitbuttonpress
	compare RESULT, 0
	goto_if_eq EventScript_1A6F66
	goto EventScript_1A6F37
	end
