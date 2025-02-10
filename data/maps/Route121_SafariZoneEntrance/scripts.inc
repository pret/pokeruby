Route121_SafariZoneEntrance_MapScripts:: @ 815C323
	map_script MAP_SCRIPT_ON_FRAME_TABLE, Route121_SafariZoneEntrance_MapScript2_15C329
	.byte 0

Route121_SafariZoneEntrance_MapScript2_15C329:: @ 815C329
	map_script_2 VAR_SAFARI_ZONE_STATE, 1, Route121_SafariZoneEntrance_EventScript_15C333
	.2byte 0

Route121_SafariZoneEntrance_EventScript_15C333:: @ 815C333
	lockall
	applymovement LOCALID_PLAYER, Route121_SafariZoneEntrance_Movement_15C348
	waitmovement 0
	special ExitSafariMode
	setvar VAR_SAFARI_ZONE_STATE, 0
	releaseall
	end

Route121_SafariZoneEntrance_Movement_15C348:: @ 815C348
	walk_up
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	step_end

Route121_SafariZoneEntrance_EventScript_15C351:: @ 815C351
	msgbox Route121_SafariZoneEntrance_Text_1C35D0, MSGBOX_NPC
	end

Route121_SafariZoneEntrance_EventScript_15C35A:: @ 815C35A
	lock
	faceplayer
	msgbox Route121_SafariZoneEntrance_Text_1C3704, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq Route121_SafariZoneEntrance_EventScript_15C379
	msgbox Route121_SafariZoneEntrance_Text_1C373C, MSGBOX_DEFAULT
	release
	end

Route121_SafariZoneEntrance_EventScript_15C379:: @ 815C379
	msgbox Route121_SafariZoneEntrance_Text_1C375F, MSGBOX_DEFAULT
	release
	end

Route121_SafariZoneEntrance_EventScript_15C383:: @ 815C383
	lockall
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	showmoneybox 0, 0
	nop
	msgbox Route121_SafariZoneEntrance_Text_1C3832, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq Route121_SafariZoneEntrance_EventScript_15C3B3
	msgbox Route121_SafariZoneEntrance_Text_1C3895, MSGBOX_DEFAULT
	goto Route121_SafariZoneEntrance_EventScript_15C46C
	end

Route121_SafariZoneEntrance_EventScript_15C3B3:: @ 815C3B3
	checkitem ITEM_POKEBLOCK_CASE, 1
	compare VAR_RESULT, 0
	goto_if_eq Route121_SafariZoneEntrance_EventScript_15C450
	call Route121_SafariZoneEntrance_EventScript_15C425
	checkmoney 500, 0
	compare VAR_RESULT, 0
	goto_if_eq Route121_SafariZoneEntrance_EventScript_15C45E
	msgbox Route121_SafariZoneEntrance_Text_1C38D9, MSGBOX_DEFAULT
	removemoney 500, 0
	updatemoneybox 0, 0
	nop
	msgbox Route121_SafariZoneEntrance_Text_1C38F4, MSGBOX_DEFAULT
	playfanfare MUS_OBTAIN_ITEM
	message Route121_SafariZoneEntrance_Text_1C3910
	waitfanfare
	waitmessage
	msgbox Route121_SafariZoneEntrance_Text_1C392D, MSGBOX_DEFAULT
	closemessage
	hidemoneybox 0, 0
	applymovement LOCALID_PLAYER, Route121_SafariZoneEntrance_Movement_15C47E
	waitmovement 0
	special EnterSafariMode
	setvar VAR_SAFARI_ZONE_STATE, 2
	warp MAP_SAFARI_ZONE_SOUTHEAST, 255, 32, 33
	waitstate
	end

Route121_SafariZoneEntrance_EventScript_15C425:: @ 815C425
	getpartysize
	compare VAR_RESULT, 6
	goto_if_ne Route121_SafariZoneEntrance_EventScript_15C44F
	specialvar VAR_RESULT, CheckFreePokemonStorageSpace
	compare VAR_RESULT, 1
	goto_if_eq Route121_SafariZoneEntrance_EventScript_15C44F
	msgbox Route121_SafariZoneEntrance_Text_1C39A3, MSGBOX_DEFAULT
	goto Route121_SafariZoneEntrance_EventScript_15C46C
	end

Route121_SafariZoneEntrance_EventScript_15C44F:: @ 815C44F
	return

Route121_SafariZoneEntrance_EventScript_15C450:: @ 815C450
	msgbox Route121_SafariZoneEntrance_Text_1C39C3, MSGBOX_DEFAULT
	goto Route121_SafariZoneEntrance_EventScript_15C46C
	end

Route121_SafariZoneEntrance_EventScript_15C45E:: @ 815C45E
	msgbox Route121_SafariZoneEntrance_Text_1C38B5, MSGBOX_DEFAULT
	goto Route121_SafariZoneEntrance_EventScript_15C46C
	end

Route121_SafariZoneEntrance_EventScript_15C46C:: @ 815C46C
	closemessage
	hidemoneybox 0, 0
	applymovement LOCALID_PLAYER, Route121_SafariZoneEntrance_Movement_15C47C
	waitmovement 0
	releaseall
	end

Route121_SafariZoneEntrance_Movement_15C47C:: @ 815C47C
	walk_right
	step_end

Route121_SafariZoneEntrance_Movement_15C47E:: @ 815C47E
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	delay_16
	step_end

Route121_SafariZoneEntrance_EventScript_15C487:: @ 815C487
	msgbox Route121_SafariZoneEntrance_Text_1C3E4B, MSGBOX_SIGN
	end
