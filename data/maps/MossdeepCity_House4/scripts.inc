MossdeepCity_House4_MapScripts:: @ 815AB30
	.byte 0

MossdeepCity_House4_EventScript_15AB31:: @ 815AB31
	lock
	faceplayer
	goto_if_set FLAG_SYS_GAME_CLEAR, MossdeepCity_House4_EventScript_15AB46
	msgbox MossdeepCity_House4_Text_18E0E3, 4
	release
	end

MossdeepCity_House4_EventScript_15AB46:: @ 815AB46
	msgbox MossdeepCity_House4_Text_18E125, 4
	release
	end

MossdeepCity_House4_EventScript_15AB50:: @ 815AB50
	lock
	faceplayer
	special CheckPlayerHasSecretBase
	compare RESULT, 0
	goto_if_eq MossdeepCity_House4_EventScript_15AB6D
	special GetSecretBaseNearbyMapName
	msgbox MossdeepCity_House4_Text_18E17E, 4
	release
	end

MossdeepCity_House4_EventScript_15AB6D:: @ 815AB6D
	msgbox MossdeepCity_House4_Text_18E1A7, 4
	release
	end

MossdeepCity_House4_EventScript_15AB77:: @ 815AB77
	lock
	faceplayer
	waitse
	playmoncry SPECIES_SKITTY, 0
	msgbox MossdeepCity_House4_Text_18E1E1, 4
	waitmoncry
	release
	end
