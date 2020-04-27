LilycoveCity_House3_MapScripts:: @ 8159BE4
	map_script MAP_SCRIPT_ON_TRANSITION, LilycoveCity_House3_MapScript1_159BEA
	.byte 0

LilycoveCity_House3_MapScript1_159BEA:: @ 8159BEA
	random 4
	copyvar VAR_TEMP_1, VAR_RESULT
	end

LilycoveCity_House3_EventScript_159BF3:: @ 8159BF3
	lock
	faceplayer
	msgbox LilycoveCity_House3_Text_18B8CC, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq LilycoveCity_House3_EventScript_159C1D
	msgbox LilycoveCity_House3_Text_18BA2B, MSGBOX_DEFAULT
	closemessage
	applymovement VAR_LAST_TALKED, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

LilycoveCity_House3_EventScript_159C1D:: @ 8159C1D
	msgbox LilycoveCity_House3_Text_18B9DC, MSGBOX_DEFAULT
	closemessage
	applymovement VAR_LAST_TALKED, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

LilycoveCity_House3_EventScript_159C32:: @ 8159C32
	lock
	faceplayer
	msgbox LilycoveCity_House3_Text_18BD64, MSGBOX_DEFAULT
	closemessage
	applymovement VAR_LAST_TALKED, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

LilycoveCity_House3_EventScript_159C49:: @ 8159C49
	lock
	faceplayer
	switch VAR_TEMP_1
	case 0, LilycoveCity_House3_EventScript_159D19
	case 1, LilycoveCity_House3_EventScript_159D23
	case 2, LilycoveCity_House3_EventScript_159D2D
	case 3, LilycoveCity_House3_EventScript_159D37
	end

LilycoveCity_House3_EventScript_159C7D:: @ 8159C7D
	lock
	faceplayer
	switch VAR_TEMP_1
	case 0, LilycoveCity_House3_EventScript_159D19
	case 1, LilycoveCity_House3_EventScript_159D23
	case 2, LilycoveCity_House3_EventScript_159D2D
	case 3, LilycoveCity_House3_EventScript_159D37
	end

LilycoveCity_House3_EventScript_159CB1:: @ 8159CB1
	lock
	faceplayer
	switch VAR_TEMP_1
	case 0, LilycoveCity_House3_EventScript_159D19
	case 1, LilycoveCity_House3_EventScript_159D23
	case 2, LilycoveCity_House3_EventScript_159D2D
	case 3, LilycoveCity_House3_EventScript_159D37
	end

LilycoveCity_House3_EventScript_159CE5:: @ 8159CE5
	lock
	faceplayer
	switch VAR_TEMP_1
	case 0, LilycoveCity_House3_EventScript_159D19
	case 1, LilycoveCity_House3_EventScript_159D23
	case 2, LilycoveCity_House3_EventScript_159D2D
	case 3, LilycoveCity_House3_EventScript_159D37
	end

LilycoveCity_House3_EventScript_159D19:: @ 8159D19
	msgbox LilycoveCity_House3_Text_18BDDB, MSGBOX_DEFAULT
	release
	end

LilycoveCity_House3_EventScript_159D23:: @ 8159D23
	msgbox LilycoveCity_House3_Text_18BE14, MSGBOX_DEFAULT
	release
	end

LilycoveCity_House3_EventScript_159D2D:: @ 8159D2D
	msgbox LilycoveCity_House3_Text_18BE57, MSGBOX_DEFAULT
	release
	end

LilycoveCity_House3_EventScript_159D37:: @ 8159D37
	msgbox LilycoveCity_House3_Text_18BE8E, MSGBOX_DEFAULT
	release
	end
