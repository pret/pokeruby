SeafloorCavern_Room9_MapScripts:: @ 815DAE6
	map_script 3, SeafloorCavern_Room9_MapScript1_15DAEC
	.byte 0

SeafloorCavern_Room9_MapScript1_15DAEC:: @ 815DAEC
	call SeafloorCavern_Room9_EventScript_1A0196
	call SeafloorCavern_Room9_EventScript_1A01B5
	.ifdef SAPPHIRE
	setmaplayoutindex 157
	.else
	setmaplayoutindex 327
	.endif
	end

SeafloorCavern_Room9_EventScript_15DAFA:: @ 815DAFA
	lockall
	setvar 0x8004, 2
	setvar 0x8005, 3
	setvar 0x8006, 4
	setvar 0x8007, 5
	applymovement 255, SeafloorCavern_Room9_Movement_1A0841
	waitmovement 0
	applymovement 255, SeafloorCavern_Room9_Movement_15DD68
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox UnknownString_81B41B8, 4
	.else
	msgbox SeafloorCavern_Room9_Text_1B4850, 4
	.endif
	closemessage
	addobject 0x8004
	applymovement 255, SeafloorCavern_Room9_Movement_1A083F
	waitmovement 0
	applymovement 0x8004, SeafloorCavern_Room9_Movement_15DD36
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox UnknownString_81B41D5, 4
	.else
	msgbox SeafloorCavern_Room9_Text_1B486C, 4
	.endif
	applymovement 0x8004, SeafloorCavern_Room9_Movement_1A0841
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox UnknownString_81B4201, 4
	.else
	msgbox SeafloorCavern_Room9_Text_1B4897, 4
	.endif
	applymovement 0x8004, SeafloorCavern_Room9_Movement_1A0839
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox UnknownString_81B4289, 4
	.else
	msgbox SeafloorCavern_Room9_Text_1B491F, 4
	.endif
	.ifdef SAPPHIRE
	trainerbattle 3, OPPONENT_SEAFLOOR_CAVERN_GRUNT_5, 0, UnknownString_81B4319
	.else
	trainerbattle 3, OPPONENT_SEAFLOOR_CAVERN_GRUNT_5, 0, SeafloorCavern_Room9_Text_1B49AE
	.endif
	.ifdef SAPPHIRE
	msgbox UnknownString_81B432C, 4
	.else
	msgbox SeafloorCavern_Room9_Text_1B49C1, 4
	.endif
	setweather 0
	doweather
	special sub_8081924
	waitstate
	.ifdef SAPPHIRE
	msgbox UnknownString_81B43C4, 4
	.else
	msgbox SeafloorCavern_Room9_Text_1B4A5A, 4
	.endif
	special WaitWeather
	waitstate
	.ifdef SAPPHIRE
	setvar RESULT, 1
	.else
	setvar RESULT, 0
	.endif
	playse 209
	setfieldeffect 0, 16
	setfieldeffect 1, 42
	setfieldeffect 2, 0
	dofieldeffect 54
	waitfieldeffect 54
	.ifdef SAPPHIRE
	setvar RESULT, 0
	.else
	setvar RESULT, 1
	.endif
	playfanfare 388
	playse 107
	special sub_80818A4
	applymovement 0x8004, SeafloorCavern_Room9_Movement_1A0841
	applymovement 255, SeafloorCavern_Room9_Movement_1A0841
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
	setvar 0x8004, 1
	setvar 0x8005, 1
	special sub_810F758
	waitstate
	applymovement 1, SeafloorCavern_Room9_Movement_15DD57
	waitmovement 0
	removeobject 1
	delay 4
	setvar 0x8004, 2
	setvar 0x8005, 2
	special sub_810F758
	waitstate
	delay 30
	setvar 0x8004, 2
	setvar 0x8005, 3
	setvar 0x8006, 4
	setvar 0x8007, 5
	.ifdef SAPPHIRE
	msgbox UnknownString_81B43F2, 4
	.else
	msgbox SeafloorCavern_Room9_Text_1B4A89, 4
	.endif
	playse 2
	applymovement 255, SeafloorCavern_Room9_Movement_1A083F
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox UnknownString_81B4443, 4
	.else
	msgbox SeafloorCavern_Room9_Text_1B4ADB, 4
	.endif
	closemessage
	applymovement 0x8004, SeafloorCavern_Room9_Movement_15DD41
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox UnknownString_81B447A, 4
	.else
	msgbox SeafloorCavern_Room9_Text_1B4B11, 4
	.endif
	closemessage
	playse 3
	delay 20
	applymovement 0x8004, SeafloorCavern_Room9_Movement_1A0845
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox UnknownString_81B45C6, 4
	.else
	msgbox SeafloorCavern_Room9_Text_1B4C79, 4
	.endif
	closemessage
	addobject 0x8005
	addobject 0x8006
	addobject 0x8007
	applymovement 0x8007, SeafloorCavern_Room9_Movement_15DD63
	applymovement 0x8006, SeafloorCavern_Room9_Movement_15DD63
	applymovement 0x8005, SeafloorCavern_Room9_Movement_15DD5A
	waitmovement 0
	applymovement 0x8004, SeafloorCavern_Room9_Movement_1A083F
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox UnknownString_81B464D, 4
	.else
	msgbox SeafloorCavern_Room9_Text_1B4D02, 4
	.endif
	playse 21
	applymovement 0x8004, SeafloorCavern_Room9_Movement_1A0833
	waitmovement 0
	applymovement 0x8004, SeafloorCavern_Room9_Movement_1A0835
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox UnknownString_81B4723, 4
	.else
	msgbox SeafloorCavern_Room9_Text_1B4DD3, 4
	.endif
	.ifdef SAPPHIRE
	msgbox UnknownString_81B4786, 4
	.else
	msgbox SeafloorCavern_Room9_Text_1B4E37, 4
	.endif
	closemessage
	applymovement 0x8005, SeafloorCavern_Room9_Movement_15DD60
	applymovement 0x8004, SeafloorCavern_Room9_Movement_15DD46
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox UnknownString_81B4818, 4
	.else
	msgbox SeafloorCavern_Room9_Text_1B4ECA, 4
	.endif
	setvar 0x407b, 1
	clearflag FLAG_HIDE_CAVE_OF_ORIGIN_ENTRANCE_WOMAN_1
	clearflag FLAG_HIDE_CAVE_OF_ORIGIN_ENTRANCE_WOMAN_2
	clearflag FLAG_HIDE_WALLACE_SOOTOPOLIS
	clearflag 973
	setvar 0x405e, 1
	clearflag 944
	clearflag 945
	setflag SYS_WEATHER_CTRL
	setflag FLAG_HIDE_SOOTOPOLIS_RESIDENTS
	setflag FLAG_LEGEND_ESCAPED_SEAFLOOR_CAVERN
	setflag 967
	setvar 0x40c6, 1
	setvar 0x40a2, 1
	setflag FLAG_HIDE_EVIL_LEADER_SEAFLOOR_CAVERN
	setflag FLAG_HIDE_OTHER_LEADER_SEAFLOOR_CAVERN
	setflag FLAG_HIDE_OTHER_TEAM_GRUNTS_SEAFLOOR_CAVERN
	setflag FLAG_HIDE_AWAKENED_MON_SEAFLOOR_CAVERN
	setflag 946
	warp MAP_ROUTE128, 255, 38, 22
	waitstate
	releaseall
	end

SeafloorCavern_Room9_Movement_15DD36:: @ 815DD36
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

@ 815DD3E
	step_left
	step_left
	step_end

SeafloorCavern_Room9_Movement_15DD41:: @ 815DD41
	step_left
	step_14
	step_end

@ 815DD44
	step_right
	step_end

SeafloorCavern_Room9_Movement_15DD46:: @ 815DD46
	step_01
	step_40
	step_down
	step_41
	step_28
	step_end

SeafloorCavern_Room9_Movement_15DD4C:: @ 815DD4C
	step_14
	step_14
	slow_step_down
	step_14
	step_14
	step_14
	slow_step_down
	step_14
	step_14
	step_14
	step_end

SeafloorCavern_Room9_Movement_15DD57:: @ 815DD57
	step_32
	step_32
	step_end

SeafloorCavern_Room9_Movement_15DD5A:: @ 815DD5A
	step_18
	step_18
	step_18
	step_18
	step_18
	step_end

SeafloorCavern_Room9_Movement_15DD60:: @ 815DD60
	step_right
	step_right
	step_end

SeafloorCavern_Room9_Movement_15DD63:: @ 815DD63
	step_18
	step_18
	step_18
	step_18
	step_end

SeafloorCavern_Room9_Movement_15DD68:: @ 815DD68
	step_14
	step_14
	step_end
