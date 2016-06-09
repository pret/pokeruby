PetalburgCity_WallysHouse_MapScripts:: @ 81543C3
	.byte 0

PetalburgCity_WallysHouse_EventScript_1543C4:: @ 81543C4
	lock
	faceplayer
	checkflag 126
	jumpeq PetalburgCity_WallysHouse_EventScript_1543F7
	checkflag 122
	jumpeq PetalburgCity_WallysHouse_EventScript_154427
	checkflag 1217
	jumpeq PetalburgCity_WallysHouse_EventScript_154406
	checkflag 135
	jumpeq PetalburgCity_WallysHouse_EventScript_15443B
	loadptr 0, PetalburgCity_WallysHouse_Text_179805
	callstd 4
	setflag 135
	release
	end

PetalburgCity_WallysHouse_EventScript_1543F7:: @ 81543F7
	checkflag 122
	jumpeq PetalburgCity_WallysHouse_EventScript_154431
	jump PetalburgCity_WallysHouse_EventScript_154406
	end

PetalburgCity_WallysHouse_EventScript_154406:: @ 8154406
	loadptr 0, PetalburgCity_WallysHouse_Text_179996
	callstd 4
	setorcopyvar 0x8000, 0x155
	setorcopyvar 0x8001, 0x1
	callstd 0
	setflag 122
	loadptr 0, PetalburgCity_WallysHouse_Text_179B14
	callstd 4
	release
	end

PetalburgCity_WallysHouse_EventScript_154427:: @ 8154427
	loadptr 0, PetalburgCity_WallysHouse_Text_179B5B
	callstd 4
	release
	end

PetalburgCity_WallysHouse_EventScript_154431:: @ 8154431
	loadptr 0, PetalburgCity_WallysHouse_Text_179B92
	callstd 4
	release
	end

PetalburgCity_WallysHouse_EventScript_15443B:: @ 815443B
	loadptr 0, PetalburgCity_WallysHouse_Text_179975
	callstd 4
	release
	end

PetalburgCity_WallysHouse_EventScript_154445:: @ 8154445
	lock
	faceplayer
	checkflag 122
	jumpeq PetalburgCity_WallysHouse_EventScript_15446D
	checkflag 1217
	jumpeq PetalburgCity_WallysHouse_EventScript_154463
	loadptr 0, PetalburgCity_WallysHouse_Text_179C2C
	callstd 4
	release
	end

PetalburgCity_WallysHouse_EventScript_154463:: @ 8154463
	loadptr 0, PetalburgCity_WallysHouse_Text_179CA1
	callstd 4
	release
	end

PetalburgCity_WallysHouse_EventScript_15446D:: @ 815446D
	loadptr 0, PetalburgCity_WallysHouse_Text_179D12
	callstd 4
	release
	end

