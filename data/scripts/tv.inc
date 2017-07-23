Event_TV:: @ 81A6E72
	lockall
	inccounter GAME_STAT_WATCHED_TV
	special sub_80C2014
	specialval RESULT, CheckForBigMovieOrEmergencyNewsOnTV
	compare RESULT, 2
	jumpeq EventScript_1A6F01
	compare RESULT, 1
	jumpeq EventScript_1A6F0B
	checkflag 2098
	jumpif 0, EventScript_1A6EF1
	checkflag 2097
	jumpeq EventScript_1A6EF1
	specialval RESULT, IsTVShowInSearchOfTrainersAiring
	compare RESULT, 1
	jumpeq EventScript_1A6F66
	jump EventScript_1A6F50
	end

EventScript_1A6EBB:
	specialval 0x8004, special_0x44
	compare 0x8004, 255
	jumpeq EventScript_1A6F3F
	specialval RESULT, special_0x4a
	compare RESULT, 255
	jumpeq EventScript_1A6F3F
	copyvar 0x8004, RESULT
	specialval RESULT, sub_80BDA0C
	compare RESULT, 0
	jumpif 5, EventScript_1A6F21
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
	clearflag 2141
	setflag 255
	special TurnOffTVScreen
	releaseall
	end

EventScript_1A6F21:
	special DoTVShow
	waittext
	waitbutton
	compare RESULT, 1
	jumpif 5, EventScript_1A6F21
	jump EventScript_1A6F37
	end

EventScript_1A6F37:
	special TurnOffTVScreen
	setflag 2097
	releaseall
	end

EventScript_1A6F3F:
	special GetMomOrDadStringForTVMessage
	msgbox UnknownString_81A0E68, 4
	jump EventScript_1A6F37
	end

EventScript_1A6F50:
	special sub_80BECE8
	compare RESULT, 0
	jumpeq EventScript_1A6EBB
	waittext
	waitbutton
	jump EventScript_1A6F37
	end

EventScript_1A6F66:
	special DoTVShowInSearchOfTrainers
	waittext
	waitbutton
	compare RESULT, 0
	jumpeq EventScript_1A6F66
	jump EventScript_1A6F37
	end
