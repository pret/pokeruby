LilycoveCity_House3_MapScripts:: @ 8159BE4
	map_script 3, LilycoveCity_House3_MapScript1_159BEA
	.byte 0

LilycoveCity_House3_MapScript1_159BEA:: @ 8159BEA
	random 4
	copyvar 0x4001, RESULT
	end

LilycoveCity_House3_EventScript_159BF3:: @ 8159BF3
	lock
	faceplayer
	loadptr 0, LilycoveCity_House3_Text_18B8CC
	callstd 5
	compare RESULT, 0
	jumpeq LilycoveCity_House3_EventScript_159C1D
	loadptr 0, LilycoveCity_House3_Text_18BA2B
	callstd 4
	closebutton
	move LAST_TALKED, LilycoveCity_House3_Movement_1A083D
	waitmove 0
	release
	end

LilycoveCity_House3_EventScript_159C1D:: @ 8159C1D
	loadptr 0, LilycoveCity_House3_Text_18B9DC
	callstd 4
	closebutton
	move LAST_TALKED, LilycoveCity_House3_Movement_1A083D
	waitmove 0
	release
	end

LilycoveCity_House3_EventScript_159C32:: @ 8159C32
	lock
	faceplayer
	loadptr 0, LilycoveCity_House3_Text_18BD64
	callstd 4
	closebutton
	move LAST_TALKED, LilycoveCity_House3_Movement_1A083D
	waitmove 0
	release
	end

LilycoveCity_House3_EventScript_159C49:: @ 8159C49
	lock
	faceplayer
	switch 0x4001
	case 0, LilycoveCity_House3_EventScript_159D19
	case 1, LilycoveCity_House3_EventScript_159D23
	case 2, LilycoveCity_House3_EventScript_159D2D
	case 3, LilycoveCity_House3_EventScript_159D37
	end

LilycoveCity_House3_EventScript_159C7D:: @ 8159C7D
	lock
	faceplayer
	switch 0x4001
	case 0, LilycoveCity_House3_EventScript_159D19
	case 1, LilycoveCity_House3_EventScript_159D23
	case 2, LilycoveCity_House3_EventScript_159D2D
	case 3, LilycoveCity_House3_EventScript_159D37
	end

LilycoveCity_House3_EventScript_159CB1:: @ 8159CB1
	lock
	faceplayer
	switch 0x4001
	case 0, LilycoveCity_House3_EventScript_159D19
	case 1, LilycoveCity_House3_EventScript_159D23
	case 2, LilycoveCity_House3_EventScript_159D2D
	case 3, LilycoveCity_House3_EventScript_159D37
	end

LilycoveCity_House3_EventScript_159CE5:: @ 8159CE5
	lock
	faceplayer
	switch 0x4001
	case 0, LilycoveCity_House3_EventScript_159D19
	case 1, LilycoveCity_House3_EventScript_159D23
	case 2, LilycoveCity_House3_EventScript_159D2D
	case 3, LilycoveCity_House3_EventScript_159D37
	end

LilycoveCity_House3_EventScript_159D19:: @ 8159D19
	loadptr 0, LilycoveCity_House3_Text_18BDDB
	callstd 4
	release
	end

LilycoveCity_House3_EventScript_159D23:: @ 8159D23
	loadptr 0, LilycoveCity_House3_Text_18BE14
	callstd 4
	release
	end

LilycoveCity_House3_EventScript_159D2D:: @ 8159D2D
	loadptr 0, LilycoveCity_House3_Text_18BE57
	callstd 4
	release
	end

LilycoveCity_House3_EventScript_159D37:: @ 8159D37
	loadptr 0, LilycoveCity_House3_Text_18BE8E
	callstd 4
	release
	end

