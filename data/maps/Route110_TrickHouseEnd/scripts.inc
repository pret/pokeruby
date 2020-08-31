Route110_TrickHouseEnd_MapScripts:: @ 8161936
	map_script MAP_SCRIPT_ON_RESUME, Route110_TrickHouseEnd_MapScript1_16194B
	map_script MAP_SCRIPT_ON_TRANSITION, Route110_TrickHouseEnd_MapScript1_161957
	map_script MAP_SCRIPT_ON_FRAME_TABLE, Route110_TrickHouseEnd_MapScript2_16197C
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, Route110_TrickHouseEnd_MapScript2_161965
	.byte 0

Route110_TrickHouseEnd_MapScript1_16194B:: @ 816194B
	compare VAR_TEMP_1, 1
	call_if_eq Route110_TrickHouseEnd_EventScript_161994
	end

Route110_TrickHouseEnd_MapScript1_161957:: @ 8161957
	setvar VAR_TEMP_1, 0
	setvar VAR_TEMP_2, 0
	special SetTrickHouseEndRoomFlag
	end

Route110_TrickHouseEnd_MapScript2_161965:: @ 8161965
	map_script_2 VAR_TEMP_2, 0, Route110_TrickHouseEnd_EventScript_16196F
	.2byte 0

Route110_TrickHouseEnd_EventScript_16196F:: @ 816196F
	addobject 1
	showobjectat 1, MAP_ROUTE110_TRICK_HOUSE_END
	turnobject 1, 4
	end

Route110_TrickHouseEnd_MapScript2_16197C:: @ 816197C
	map_script_2 VAR_TEMP_1, 0, Route110_TrickHouseEnd_EventScript_161986
	.2byte 0

Route110_TrickHouseEnd_EventScript_161986:: @ 8161986
	setvar VAR_TEMP_1, 1
	call Route110_TrickHouseEnd_EventScript_161994
	special DrawWholeMapView
	end

Route110_TrickHouseEnd_EventScript_161994:: @ 8161994
	setmetatile 10, 1, METATILE_GenericBuilding_TrickHouse_Door_Closed, 1
	return

Route110_TrickHouseEnd_EventScript_16199E:: @ 816199E
	lock
	faceplayer
	msgbox Route110_TrickHouseEnd_Text_19C281, MSGBOX_DEFAULT
	setvar VAR_TEMP_2, 1
	switch VAR_TRICK_HOUSE_ROOMS_COMPLETED
	case 0, Route110_TrickHouseEnd_EventScript_161A0B
	case 1, Route110_TrickHouseEnd_EventScript_161A47
	case 2, Route110_TrickHouseEnd_EventScript_161A83
	case 3, Route110_TrickHouseEnd_EventScript_161ABF
	case 4, Route110_TrickHouseEnd_EventScript_161AFB
	case 5, Route110_TrickHouseEnd_EventScript_161B37
	case 6, Route110_TrickHouseEnd_EventScript_161B73
	case 7, Route110_TrickHouseEnd_EventScript_161BAF
	end

Route110_TrickHouseEnd_EventScript_161A0B:: @ 8161A0B
	msgbox Route110_TrickHouseEnd_Text_19C2B2, MSGBOX_DEFAULT
	msgbox Route110_TrickHouseEnd_Text_19C90B, MSGBOX_DEFAULT
	setvar VAR_TRICK_HOUSE_PRIZE_PICKUP, 0
	giveitem ITEM_RARE_CANDY
	compare VAR_RESULT, 0
	call_if_eq Route110_TrickHouseEnd_EventScript_161C4E
	msgbox Route110_TrickHouseEnd_Text_19C9BD, MSGBOX_DEFAULT
	closemessage
	call Route110_TrickHouseEnd_EventScript_161C2E
	release
	end

Route110_TrickHouseEnd_EventScript_161A47:: @ 8161A47
	msgbox Route110_TrickHouseEnd_Text_19C333, MSGBOX_DEFAULT
	msgbox Route110_TrickHouseEnd_Text_19C90B, MSGBOX_DEFAULT
	setvar VAR_TRICK_HOUSE_PRIZE_PICKUP, 0
	giveitem ITEM_TIMER_BALL
	compare VAR_RESULT, 0
	call_if_eq Route110_TrickHouseEnd_EventScript_161C4E
	msgbox Route110_TrickHouseEnd_Text_19C9BD, MSGBOX_DEFAULT
	closemessage
	call Route110_TrickHouseEnd_EventScript_161C2E
	release
	end

Route110_TrickHouseEnd_EventScript_161A83:: @ 8161A83
	msgbox Route110_TrickHouseEnd_Text_19C3A7, MSGBOX_DEFAULT
	msgbox Route110_TrickHouseEnd_Text_19C90B, MSGBOX_DEFAULT
	setvar VAR_TRICK_HOUSE_PRIZE_PICKUP, 0
	giveitem ITEM_HARD_STONE
	compare VAR_RESULT, 0
	call_if_eq Route110_TrickHouseEnd_EventScript_161C4E
	msgbox Route110_TrickHouseEnd_Text_19C9BD, MSGBOX_DEFAULT
	closemessage
	call Route110_TrickHouseEnd_EventScript_161C2E
	release
	end

Route110_TrickHouseEnd_EventScript_161ABF:: @ 8161ABF
	msgbox Route110_TrickHouseEnd_Text_19C41F, MSGBOX_DEFAULT
	msgbox Route110_TrickHouseEnd_Text_19C90B, MSGBOX_DEFAULT
	setvar VAR_TRICK_HOUSE_PRIZE_PICKUP, 0
	giveitem ITEM_SMOKE_BALL
	compare VAR_RESULT, 0
	call_if_eq Route110_TrickHouseEnd_EventScript_161C4E
	msgbox Route110_TrickHouseEnd_Text_19C9BD, MSGBOX_DEFAULT
	closemessage
	call Route110_TrickHouseEnd_EventScript_161C2E
	release
	end

Route110_TrickHouseEnd_EventScript_161AFB:: @ 8161AFB
	msgbox Route110_TrickHouseEnd_Text_19C491, MSGBOX_DEFAULT
	msgbox Route110_TrickHouseEnd_Text_19C90B, MSGBOX_DEFAULT
	setvar VAR_TRICK_HOUSE_PRIZE_PICKUP, 0
	giveitem ITEM_TM12_TAUNT
	compare VAR_RESULT, 0
	call_if_eq Route110_TrickHouseEnd_EventScript_161C4E
	msgbox Route110_TrickHouseEnd_Text_19C9BD, MSGBOX_DEFAULT
	closemessage
	call Route110_TrickHouseEnd_EventScript_161C2E
	release
	end

Route110_TrickHouseEnd_EventScript_161B37:: @ 8161B37
	msgbox Route110_TrickHouseEnd_Text_19C515, MSGBOX_DEFAULT
	msgbox Route110_TrickHouseEnd_Text_19C90B, MSGBOX_DEFAULT
	setvar VAR_TRICK_HOUSE_PRIZE_PICKUP, 0
	giveitem ITEM_MAGNET
	compare VAR_RESULT, 0
	call_if_eq Route110_TrickHouseEnd_EventScript_161C4E
	msgbox Route110_TrickHouseEnd_Text_19C9BD, MSGBOX_DEFAULT
	closemessage
	call Route110_TrickHouseEnd_EventScript_161C2E
	release
	end

Route110_TrickHouseEnd_EventScript_161B73:: @ 8161B73
	msgbox Route110_TrickHouseEnd_Text_19C567, MSGBOX_DEFAULT
	msgbox Route110_TrickHouseEnd_Text_19C90B, MSGBOX_DEFAULT
	setvar VAR_TRICK_HOUSE_PRIZE_PICKUP, 0
	giveitem ITEM_PP_MAX
	compare VAR_RESULT, 0
	call_if_eq Route110_TrickHouseEnd_EventScript_161C4E
	msgbox Route110_TrickHouseEnd_Text_19C9BD, MSGBOX_DEFAULT
	closemessage
	call Route110_TrickHouseEnd_EventScript_161C2E
	release
	end

Route110_TrickHouseEnd_EventScript_161BAF:: @ 8161BAF
	msgbox Route110_TrickHouseEnd_Text_19C5AF, MSGBOX_DEFAULT
	closemessage
	compare VAR_FACING, 1
	call_if_eq Route110_TrickHouseEnd_EventScript_161C74
	compare VAR_FACING, 2
	call_if_eq Route110_TrickHouseEnd_EventScript_161C7F
	compare VAR_FACING, 3
	call_if_eq Route110_TrickHouseEnd_EventScript_161C8A
	compare VAR_FACING, 4
	call_if_eq Route110_TrickHouseEnd_EventScript_161C95
	delay 30
	msgbox Route110_TrickHouseEnd_Text_19C602, MSGBOX_DEFAULT
	closemessage
	applymovement 1, Common_Movement_FacePlayer
	waitmovement 0
	delay 30
	msgbox Route110_TrickHouseEnd_Text_19C691, MSGBOX_DEFAULT
	setvar VAR_TRICK_HOUSE_PRIZE_PICKUP, 0
	.ifdef SAPPHIRE
	givedecoration DECOR_BLUE_TENT
	.else
	givedecoration DECOR_RED_TENT
	.endc
	compare VAR_RESULT, 0
	call_if_eq Route110_TrickHouseEnd_EventScript_161C61
	msgbox Route110_TrickHouseEnd_Text_19C85C, MSGBOX_DEFAULT
	call Route110_TrickHouseEnd_EventScript_161C2E
	special ResetTrickHouseEndRoomFlag
	release
	end

Route110_TrickHouseEnd_EventScript_161C2E:: @ 8161C2E
	applymovement 1, Route110_TrickHouseEnd_Movement_161315
	waitmovement 0
	playse SE_M_EXPLOSION
	applymovement 1, Route110_TrickHouseEnd_Movement_16131E
	waitmovement 0
	removeobject 1
	addvar VAR_TRICK_HOUSE_ROOMS_COMPLETED, 1
	return

Route110_TrickHouseEnd_EventScript_161C4E:: @ 8161C4E
	call Common_EventScript_BagIsFull
	msgbox Route110_TrickHouseEnd_Text_19C92E, MSGBOX_DEFAULT
	setvar VAR_TRICK_HOUSE_PRIZE_PICKUP, 1
	return

Route110_TrickHouseEnd_EventScript_161C61:: @ 8161C61
	call Common_EventScript_NoRoomForDecor
	msgbox Route110_TrickHouseEnd_Text_19C7D7, MSGBOX_DEFAULT
	setvar VAR_TRICK_HOUSE_PRIZE_PICKUP, 1
	return

Route110_TrickHouseEnd_EventScript_161C74:: @ 8161C74
	applymovement 1, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	return

Route110_TrickHouseEnd_EventScript_161C7F:: @ 8161C7F
	applymovement 1, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

Route110_TrickHouseEnd_EventScript_161C8A:: @ 8161C8A
	applymovement 1, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	return

Route110_TrickHouseEnd_EventScript_161C95:: @ 8161C95
	applymovement 1, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	return

Route110_TrickHouseEnd_EventScript_161CA0:: @ 8161CA0
	lockall
	turnobject 1, 3
	playse SE_PIN
	applymovement 1, Common_Movement_ExclamationMark
	waitmovement 0
	delay 20
	applymovement 1, Route110_TrickHouseEnd_Movement_161CEA
	waitmovement 0
	playse SE_M_EXPLOSION
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	msgbox Route110_TrickHouseEnd_Text_19CA8B, MSGBOX_DEFAULT
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Route110_TrickHouseEnd_Movement_161CE8
	waitmovement 0
	delay 4
	turnobject 1, 4
	releaseall
	end

Route110_TrickHouseEnd_Movement_161CE8:: @ 8161CE8
	walk_down
	step_end

Route110_TrickHouseEnd_Movement_161CEA:: @ 8161CEA
	jump_in_place_left
	step_end
