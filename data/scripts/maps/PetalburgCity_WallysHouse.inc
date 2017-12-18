PetalburgCity_WallysHouse_MapScripts:: @ 81543C3
	.byte 0

PetalburgCity_WallysHouse_EventScript_1543C4:: @ 81543C4
	lock
	faceplayer
	checkflag FLAG_DEFEATED_WALLY_VICTORY_ROAD
	goto_if_eq PetalburgCity_WallysHouse_EventScript_1543F7
	checkflag FLAG_RECEIVED_HM03
	goto_if_eq PetalburgCity_WallysHouse_EventScript_154427
	checkflag FLAG_DEFEATED_PETALBURG_GYM
	goto_if_eq PetalburgCity_WallysHouse_EventScript_154406
	checkflag FLAG_THANKED_FOR_PLAYING_WITH_WALLY
	goto_if_eq PetalburgCity_WallysHouse_EventScript_15443B
	msgbox PetalburgCity_WallysHouse_Text_179805, 4
	setflag FLAG_THANKED_FOR_PLAYING_WITH_WALLY
	release
	end

PetalburgCity_WallysHouse_EventScript_1543F7:: @ 81543F7
	checkflag FLAG_RECEIVED_HM03
	goto_if_eq PetalburgCity_WallysHouse_EventScript_154431
	goto PetalburgCity_WallysHouse_EventScript_154406
	end

PetalburgCity_WallysHouse_EventScript_154406:: @ 8154406
	msgbox PetalburgCity_WallysHouse_Text_179996, 4
	giveitem ITEM_HM03
	setflag FLAG_RECEIVED_HM03
	msgbox PetalburgCity_WallysHouse_Text_179B14, 4
	release
	end

PetalburgCity_WallysHouse_EventScript_154427:: @ 8154427
	msgbox PetalburgCity_WallysHouse_Text_179B5B, 4
	release
	end

PetalburgCity_WallysHouse_EventScript_154431:: @ 8154431
	msgbox PetalburgCity_WallysHouse_Text_179B92, 4
	release
	end

PetalburgCity_WallysHouse_EventScript_15443B:: @ 815443B
	msgbox PetalburgCity_WallysHouse_Text_179975, 4
	release
	end

PetalburgCity_WallysHouse_EventScript_154445:: @ 8154445
	lock
	faceplayer
	checkflag FLAG_RECEIVED_HM03
	goto_if_eq PetalburgCity_WallysHouse_EventScript_15446D
	checkflag FLAG_DEFEATED_PETALBURG_GYM
	goto_if_eq PetalburgCity_WallysHouse_EventScript_154463
	msgbox PetalburgCity_WallysHouse_Text_179C2C, 4
	release
	end

PetalburgCity_WallysHouse_EventScript_154463:: @ 8154463
	msgbox PetalburgCity_WallysHouse_Text_179CA1, 4
	release
	end

PetalburgCity_WallysHouse_EventScript_15446D:: @ 815446D
	msgbox PetalburgCity_WallysHouse_Text_179D12, 4
	release
	end
