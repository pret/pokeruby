SlateportCity_House1_MapScripts:: @ 815567A
	.byte 0

SlateportCity_House1_EventScript_15567B:: @ 815567B
	lock
	faceplayer
	loadptr 0, SlateportCity_House1_Text_17D46A
	callstd 5
	compare RESULT, 1
	jumpeq SlateportCity_House1_EventScript_15569C
	compare RESULT, 0
	jumpeq SlateportCity_House1_EventScript_1556BF
	end

SlateportCity_House1_EventScript_15569C:: @ 815569C
	loadptr 0, SlateportCity_House1_Text_17D4DB
	callstd 4
	special 159
	waitstate
	compare 0x8004, 255
	jumpif 5, SlateportCity_House1_EventScript_1556C9
	compare 0x8004, 255
	jumpeq SlateportCity_House1_EventScript_1556BF
	end

SlateportCity_House1_EventScript_1556BF:: @ 81556BF
	loadptr 0, SlateportCity_House1_Text_17D61E
	callstd 4
	release
	end

SlateportCity_House1_EventScript_1556C9:: @ 81556C9
	specialval RESULT, 327
	compare RESULT, 412
	jumpeq SlateportCity_House1_EventScript_15571C
	special 124
	special 125
	compare RESULT, 1
	jumpeq SlateportCity_House1_EventScript_155726
	specialval RESULT, 336
	special 124
	compare RESULT, 1
	jumpeq SlateportCity_House1_EventScript_155726
	loadptr 0, SlateportCity_House1_Text_17D505
	callstd 5
	compare RESULT, 1
	jumpeq SlateportCity_House1_EventScript_155730
	compare RESULT, 0
	jumpeq SlateportCity_House1_EventScript_1556BF
	end

SlateportCity_House1_EventScript_15571C:: @ 815571C
	loadptr 0, SlateportCity_House1_Text_17D752
	callstd 4
	release
	end

SlateportCity_House1_EventScript_155726:: @ 8155726
	loadptr 0, SlateportCity_House1_Text_17D6CC
	callstd 4
	release
	end

SlateportCity_House1_EventScript_155730:: @ 8155730
	loadptr 0, SlateportCity_House1_Text_17D580
	callstd 4
	call SlateportCity_House1_EventScript_1A0678
	specialval RESULT, 123
	special 124
	compare RESULT, 1
	jumpeq SlateportCity_House1_EventScript_15575A
	loadptr 0, SlateportCity_House1_Text_17D63A
	callstd 4
	release
	end

SlateportCity_House1_EventScript_15575A:: @ 815575A
	loadptr 0, SlateportCity_House1_Text_17D5B0
	callstd 4
	release
	end

