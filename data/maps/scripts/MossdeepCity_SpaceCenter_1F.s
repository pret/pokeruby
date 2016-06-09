MossdeepCity_SpaceCenter_1F_MapScripts:: @ 815AB8A
	.byte 0

MossdeepCity_SpaceCenter_1F_EventScript_15AB8B:: @ 815AB8B
	lock
	faceplayer
	checkdailyflags
	specialval RESULT, 256
	buffernum 0, 32781
	compare RESULT, 0
	callif 1, MossdeepCity_SpaceCenter_1F_EventScript_15ABBA
	compare RESULT, 1
	callif 4, MossdeepCity_SpaceCenter_1F_EventScript_15ABC3
	closebutton
	move LAST_TALKED, MossdeepCity_SpaceCenter_1F_Movement_1A083D
	waitmove 0
	release
	end

MossdeepCity_SpaceCenter_1F_EventScript_15ABBA:: @ 815ABBA
	loadptr 0, MossdeepCity_SpaceCenter_1F_Text_18E1F3
	callstd 4
	return

MossdeepCity_SpaceCenter_1F_EventScript_15ABC3:: @ 815ABC3
	loadptr 0, MossdeepCity_SpaceCenter_1F_Text_18E214
	callstd 4
	return

MossdeepCity_SpaceCenter_1F_EventScript_15ABCC:: @ 815ABCC
	loadptr 0, MossdeepCity_SpaceCenter_1F_Text_18E251
	callstd 2
	end

MossdeepCity_SpaceCenter_1F_EventScript_15ABD5:: @ 815ABD5
	lock
	faceplayer
	checkflag 192
	jumpeq MossdeepCity_SpaceCenter_1F_EventScript_15AC0C
	loadptr 0, MossdeepCity_SpaceCenter_1F_Text_18E335
	callstd 4
	setorcopyvar 0x8000, 0x5d
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq MossdeepCity_SpaceCenter_1F_EventScript_1A029B
	setflag 192
	loadptr 0, MossdeepCity_SpaceCenter_1F_Text_18E39B
	callstd 4
	release
	end

MossdeepCity_SpaceCenter_1F_EventScript_15AC0C:: @ 815AC0C
	loadptr 0, MossdeepCity_SpaceCenter_1F_Text_18E39B
	callstd 4
	release
	end

MossdeepCity_SpaceCenter_1F_EventScript_15AC16:: @ 815AC16
	loadptr 0, MossdeepCity_SpaceCenter_1F_Text_18E3E5
	callstd 2
	end

MossdeepCity_SpaceCenter_1F_EventScript_15AC1F:: @ 815AC1F
	lock
	faceplayer
	loadptr 0, MossdeepCity_SpaceCenter_1F_Text_18E427
	callstd 4
	closebutton
	move LAST_TALKED, MossdeepCity_SpaceCenter_1F_Movement_1A083D
	waitmove 0
	release
	end

