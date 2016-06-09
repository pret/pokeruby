SootopolisCity_House8_MapScripts:: @ 815B400
	.byte 0

SootopolisCity_House8_EventScript_15B401:: @ 815B401
	special 119
	lock
	faceplayer
	loadptr 0, SootopolisCity_House8_Text_1900F7
	callstd 4
	special 159
	waitstate
	copyvar RESULT, 0x8004
	compare RESULT, 255
	jumpeq SootopolisCity_House8_EventScript_15B448
	special 120
	compare RESULT, 1
	jumpeq SootopolisCity_House8_EventScript_15B452
	compare RESULT, 2
	jumpeq SootopolisCity_House8_EventScript_15B45C
	compare RESULT, 3
	jumpeq SootopolisCity_House8_EventScript_15B466
	release
	end

SootopolisCity_House8_EventScript_15B448:: @ 815B448
	loadptr 0, SootopolisCity_House8_Text_190366
	callstd 4
	release
	end

SootopolisCity_House8_EventScript_15B452:: @ 815B452
	loadptr 0, SootopolisCity_House8_Text_190329
	callstd 4
	release
	end

SootopolisCity_House8_EventScript_15B45C:: @ 815B45C
	loadptr 0, SootopolisCity_House8_Text_1902E4
	callstd 4
	release
	end

SootopolisCity_House8_EventScript_15B466:: @ 815B466
	loadptr 0, SootopolisCity_House8_Text_19021D
	callstd 4
	setorcopyvar 0x8000, 0x24
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq SootopolisCity_House8_EventScript_15B488
	closebutton
	release
	end

SootopolisCity_House8_EventScript_15B488:: @ 815B488
	loadptr 0, SootopolisCity_House8_Text_1902C4
	callstd 4
	release
	end

SootopolisCity_House8_EventScript_15B492:: @ 815B492
	special 121
	lock
	faceplayer
	loadptr 0, SootopolisCity_House8_Text_190431
	callstd 4
	special 159
	waitstate
	copyvar RESULT, 0x8004
	compare RESULT, 255
	jumpeq SootopolisCity_House8_EventScript_15B4D9
	special 122
	compare RESULT, 1
	jumpeq SootopolisCity_House8_EventScript_15B4E3
	compare RESULT, 2
	jumpeq SootopolisCity_House8_EventScript_15B4ED
	compare RESULT, 3
	jumpeq SootopolisCity_House8_EventScript_15B4F7
	release
	end

SootopolisCity_House8_EventScript_15B4D9:: @ 815B4D9
	loadptr 0, SootopolisCity_House8_Text_19065A
	callstd 4
	release
	end

SootopolisCity_House8_EventScript_15B4E3:: @ 815B4E3
	loadptr 0, SootopolisCity_House8_Text_190628
	callstd 4
	release
	end

SootopolisCity_House8_EventScript_15B4ED:: @ 815B4ED
	loadptr 0, SootopolisCity_House8_Text_1905E6
	callstd 4
	release
	end

SootopolisCity_House8_EventScript_15B4F7:: @ 815B4F7
	loadptr 0, SootopolisCity_House8_Text_190536
	callstd 4
	setorcopyvar 0x8000, 0x24
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq SootopolisCity_House8_EventScript_15B519
	closebutton
	release
	end

SootopolisCity_House8_EventScript_15B519:: @ 815B519
	loadptr 0, SootopolisCity_House8_Text_1905C1
	callstd 4
	release
	end

SootopolisCity_House8_EventScript_15B523:: @ 815B523
	special 119
	lockall
	loadptr 0, SootopolisCity_House8_Text_1903C9
	callstd 4
	releaseall
	end

SootopolisCity_House8_EventScript_15B531:: @ 815B531
	special 121
	lockall
	loadptr 0, SootopolisCity_House8_Text_1906BE
	callstd 4
	releaseall
	end

