SootopolisCity_House8_MapScripts:: @ 815B400
	.byte 0

SootopolisCity_House8_EventScript_15B401:: @ 815B401
	special 119
	lock
	faceplayer
	msgbox SootopolisCity_House8_Text_1900F7, 4
	special 159
	waitstate
	copyvar RESULT, 0x8004
	compare RESULT, 255
	jumpif EQUAL, SootopolisCity_House8_EventScript_15B448
	special 120
	compare RESULT, 1
	jumpif EQUAL, SootopolisCity_House8_EventScript_15B452
	compare RESULT, 2
	jumpif EQUAL, SootopolisCity_House8_EventScript_15B45C
	compare RESULT, 3
	jumpif EQUAL, SootopolisCity_House8_EventScript_15B466
	release
	end

SootopolisCity_House8_EventScript_15B448:: @ 815B448
	msgbox SootopolisCity_House8_Text_190366, 4
	release
	end

SootopolisCity_House8_EventScript_15B452:: @ 815B452
	msgbox SootopolisCity_House8_Text_190329, 4
	release
	end

SootopolisCity_House8_EventScript_15B45C:: @ 815B45C
	msgbox SootopolisCity_House8_Text_1902E4, 4
	release
	end

SootopolisCity_House8_EventScript_15B466:: @ 815B466
	msgbox SootopolisCity_House8_Text_19021D, 4
	giveitem ITEM_ELIXIR
	compare RESULT, 0
	jumpif EQUAL, SootopolisCity_House8_EventScript_15B488
	closebutton
	release
	end

SootopolisCity_House8_EventScript_15B488:: @ 815B488
	msgbox SootopolisCity_House8_Text_1902C4, 4
	release
	end

SootopolisCity_House8_EventScript_15B492:: @ 815B492
	special 121
	lock
	faceplayer
	msgbox SootopolisCity_House8_Text_190431, 4
	special 159
	waitstate
	copyvar RESULT, 0x8004
	compare RESULT, 255
	jumpif EQUAL, SootopolisCity_House8_EventScript_15B4D9
	special 122
	compare RESULT, 1
	jumpif EQUAL, SootopolisCity_House8_EventScript_15B4E3
	compare RESULT, 2
	jumpif EQUAL, SootopolisCity_House8_EventScript_15B4ED
	compare RESULT, 3
	jumpif EQUAL, SootopolisCity_House8_EventScript_15B4F7
	release
	end

SootopolisCity_House8_EventScript_15B4D9:: @ 815B4D9
	msgbox SootopolisCity_House8_Text_19065A, 4
	release
	end

SootopolisCity_House8_EventScript_15B4E3:: @ 815B4E3
	msgbox SootopolisCity_House8_Text_190628, 4
	release
	end

SootopolisCity_House8_EventScript_15B4ED:: @ 815B4ED
	msgbox SootopolisCity_House8_Text_1905E6, 4
	release
	end

SootopolisCity_House8_EventScript_15B4F7:: @ 815B4F7
	msgbox SootopolisCity_House8_Text_190536, 4
	giveitem ITEM_ELIXIR
	compare RESULT, 0
	jumpif EQUAL, SootopolisCity_House8_EventScript_15B519
	closebutton
	release
	end

SootopolisCity_House8_EventScript_15B519:: @ 815B519
	msgbox SootopolisCity_House8_Text_1905C1, 4
	release
	end

SootopolisCity_House8_EventScript_15B523:: @ 815B523
	special 119
	lockall
	msgbox SootopolisCity_House8_Text_1903C9, 4
	releaseall
	end

SootopolisCity_House8_EventScript_15B531:: @ 815B531
	special 121
	lockall
	msgbox SootopolisCity_House8_Text_1906BE, 4
	releaseall
	end
