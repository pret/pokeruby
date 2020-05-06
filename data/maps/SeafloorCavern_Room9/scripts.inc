SeafloorCavern_Room9_MapScripts:: @ 815DAE6
	map_script MAP_SCRIPT_ON_TRANSITION, SeafloorCavern_Room9_MapScript1_15DAEC
	.byte 0

SeafloorCavern_Room9_MapScript1_15DAEC:: @ 815DAEC
	call Common_EventScript_SetupEvilTeamGfxIds
	call Common_EventScript_SetupLegendaryGfxIds
	.ifdef SAPPHIRE
	setmaplayoutindex 157
	.else
	setmaplayoutindex 327
	.endif
	end

SeafloorCavern_Room9_EventScript_15DAFA:: @ 815DAFA
	lockall
	setvar VAR_0x8004, 2
	setvar VAR_0x8005, 3
	setvar VAR_0x8006, 4
	setvar VAR_0x8007, 5
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, SeafloorCavern_Room9_Movement_15DD68
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox UnknownString_81B41B8, MSGBOX_DEFAULT
	.else
	msgbox SeafloorCavern_Room9_Text_1B4850, MSGBOX_DEFAULT
	.endif
	closemessage
	addobject VAR_0x8004
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	applymovement VAR_0x8004, SeafloorCavern_Room9_Movement_15DD36
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox UnknownString_81B41D5, MSGBOX_DEFAULT
	.else
	msgbox SeafloorCavern_Room9_Text_1B486C, MSGBOX_DEFAULT
	.endif
	applymovement VAR_0x8004, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox UnknownString_81B4201, MSGBOX_DEFAULT
	.else
	msgbox SeafloorCavern_Room9_Text_1B4897, MSGBOX_DEFAULT
	.endif
	applymovement VAR_0x8004, Common_Movement_FacePlayer
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox UnknownString_81B4289, MSGBOX_DEFAULT
	.else
	msgbox SeafloorCavern_Room9_Text_1B491F, MSGBOX_DEFAULT
	.endif
	.ifdef SAPPHIRE
	trainerbattle_no_intro TRAINER_SEAFLOOR_CAVERN_GRUNT_5, UnknownString_81B4319
	.else
	trainerbattle_no_intro TRAINER_SEAFLOOR_CAVERN_GRUNT_5, SeafloorCavern_Room9_Text_1B49AE
	.endif
	.ifdef SAPPHIRE
	msgbox UnknownString_81B432C, MSGBOX_DEFAULT
	.else
	msgbox SeafloorCavern_Room9_Text_1B49C1, MSGBOX_DEFAULT
	.endif
	setweather WEATHER_NONE
	doweather
	special sub_8081924
	waitstate
	.ifdef SAPPHIRE
	msgbox UnknownString_81B43C4, MSGBOX_DEFAULT
	.else
	msgbox SeafloorCavern_Room9_Text_1B4A5A, MSGBOX_DEFAULT
	.endif
	special WaitWeather
	waitstate
	.ifdef SAPPHIRE
	setvar VAR_RESULT, 1
	.else
	setvar VAR_RESULT, 0
	.endif
	playse SE_W197
	setfieldeffectargument 0, 16
	setfieldeffectargument 1, 42
	setfieldeffectargument 2, 0
	dofieldeffect FLDEFF_SPARKLE
	waitfieldeffect FLDEFF_SPARKLE
	.ifdef SAPPHIRE
	setvar VAR_RESULT, 0
	.else
	setvar VAR_RESULT, 1
	.endif
	playfanfare MUS_ME_TAMA
	playse SE_TAMA
	special sub_80818A4
	applymovement VAR_0x8004, Common_Movement_WalkInPlaceFastestUp
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	delay 150
	removeobject 7
	addobject 1
	waitstate
	delay 60
	applymovement 1, SeafloorCavern_Room9_Movement_15DD4C
	waitmovement 0
	special sub_80818FC
	waitstate
	setvar VAR_0x8004, 1
	setvar VAR_0x8005, 1
	special ShakeCamera
	waitstate
	applymovement 1, SeafloorCavern_Room9_Movement_15DD57
	waitmovement 0
	removeobject 1
	delay 4
	setvar VAR_0x8004, 2
	setvar VAR_0x8005, 2
	special ShakeCamera
	waitstate
	delay 30
	setvar VAR_0x8004, 2
	setvar VAR_0x8005, 3
	setvar VAR_0x8006, 4
	setvar VAR_0x8007, 5
	.ifdef SAPPHIRE
	msgbox UnknownString_81B43F2, MSGBOX_DEFAULT
	.else
	msgbox SeafloorCavern_Room9_Text_1B4A89, MSGBOX_DEFAULT
	.endif
	playse SE_PC_LOGON
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox UnknownString_81B4443, MSGBOX_DEFAULT
	.else
	msgbox SeafloorCavern_Room9_Text_1B4ADB, MSGBOX_DEFAULT
	.endif
	closemessage
	applymovement VAR_0x8004, SeafloorCavern_Room9_Movement_15DD41
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox UnknownString_81B447A, MSGBOX_DEFAULT
	.else
	msgbox SeafloorCavern_Room9_Text_1B4B11, MSGBOX_DEFAULT
	.endif
	closemessage
	playse SE_PC_OFF
	delay 20
	applymovement VAR_0x8004, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox UnknownString_81B45C6, MSGBOX_DEFAULT
	.else
	msgbox SeafloorCavern_Room9_Text_1B4C79, MSGBOX_DEFAULT
	.endif
	closemessage
	addobject VAR_0x8005
	addobject VAR_0x8006
	addobject VAR_0x8007
	applymovement VAR_0x8007, SeafloorCavern_Room9_Movement_15DD63
	applymovement VAR_0x8006, SeafloorCavern_Room9_Movement_15DD63
	applymovement VAR_0x8005, SeafloorCavern_Room9_Movement_15DD5A
	waitmovement 0
	applymovement VAR_0x8004, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox UnknownString_81B464D, MSGBOX_DEFAULT
	.else
	msgbox SeafloorCavern_Room9_Text_1B4D02, MSGBOX_DEFAULT
	.endif
	playse SE_PIN
	applymovement VAR_0x8004, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement VAR_0x8004, Common_Movement_Delay48
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox UnknownString_81B4723, MSGBOX_DEFAULT
	.else
	msgbox SeafloorCavern_Room9_Text_1B4DD3, MSGBOX_DEFAULT
	.endif
	.ifdef SAPPHIRE
	msgbox UnknownString_81B4786, MSGBOX_DEFAULT
	.else
	msgbox SeafloorCavern_Room9_Text_1B4E37, MSGBOX_DEFAULT
	.endif
	closemessage
	applymovement VAR_0x8005, SeafloorCavern_Room9_Movement_15DD60
	applymovement VAR_0x8004, SeafloorCavern_Room9_Movement_15DD46
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox UnknownString_81B4818, MSGBOX_DEFAULT
	.else
	msgbox SeafloorCavern_Room9_Text_1B4ECA, MSGBOX_DEFAULT
	.endif
	setvar VAR_ROUTE128_STATE, 1
	clearflag FLAG_HIDE_CAVE_OF_ORIGIN_ENTRANCE_WOMAN_1
	clearflag FLAG_HIDE_CAVE_OF_ORIGIN_ENTRANCE_WOMAN_2
	clearflag FLAG_HIDE_WALLACE_SOOTOPOLIS
	clearflag FLAG_HIDE_STEVEN_SOOTOPOLIS
	setvar VAR_SOOTOPOLIS_STATE, 1
	clearflag FLAG_HIDE_EVIL_LEADER_ROUTE128
	clearflag FLAG_HIDE_OTHER_LEADER_ROUTE128
	setflag FLAG_SYS_WEATHER_CTRL
	setflag FLAG_HIDE_SOOTOPOLIS_RESIDENTS
	setflag FLAG_LEGEND_ESCAPED_SEAFLOOR_CAVERN
	setflag FLAG_HIDE_STEVEN_STEVENS_HOUSE
	setvar VAR_STEVENS_HOUSE_STATE, 1
	setvar VAR_SEAFLOOR_CAVERN_STATE, 1
	setflag FLAG_HIDE_EVIL_LEADER_SEAFLOOR_CAVERN
	setflag FLAG_HIDE_OTHER_LEADER_SEAFLOOR_CAVERN
	setflag FLAG_HIDE_OTHER_TEAM_GRUNTS_SEAFLOOR_CAVERN
	setflag FLAG_HIDE_AWAKENED_MON_SEAFLOOR_CAVERN
	setflag FLAG_HIDE_EVIL_TEAM_GRUNTS_SEAFLOOR_CAVERN
	warp MAP_ROUTE128, 255, 38, 22
	waitstate
	releaseall
	end

SeafloorCavern_Room9_Movement_15DD36:: @ 815DD36
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	step_end

@ 815DD3E
	walk_left
	walk_left
	step_end

SeafloorCavern_Room9_Movement_15DD41:: @ 815DD41
	walk_left
	delay_16
	step_end

@ 815DD44
	walk_right
	step_end

SeafloorCavern_Room9_Movement_15DD46:: @ 815DD46
	face_up
	lock_facing_direction
	walk_down
	unlock_facing_direction
	walk_in_place_fastest_right
	step_end

SeafloorCavern_Room9_Movement_15DD4C:: @ 815DD4C
	delay_16
	delay_16
	walk_slow_down
	delay_16
	delay_16
	delay_16
	walk_slow_down
	delay_16
	delay_16
	delay_16
	step_end

SeafloorCavern_Room9_Movement_15DD57:: @ 815DD57
	slide_up
	slide_up
	step_end

SeafloorCavern_Room9_Movement_15DD5A:: @ 815DD5A
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	step_end

SeafloorCavern_Room9_Movement_15DD60:: @ 815DD60
	walk_right
	walk_right
	step_end

SeafloorCavern_Room9_Movement_15DD63:: @ 815DD63
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	step_end

SeafloorCavern_Room9_Movement_15DD68:: @ 815DD68
	delay_16
	delay_16
	step_end
