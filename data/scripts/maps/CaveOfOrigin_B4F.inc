CaveOfOrigin_B4F_MapScripts:: @ 815DDAC
	map_script 5, CaveOfOrigin_B4F_MapScript1_15DDB7
	map_script 3, CaveOfOrigin_B4F_MapScript1_15DDC5
	.byte 0

CaveOfOrigin_B4F_MapScript1_15DDB7:: @ 815DDB7
	checkflag SYS_CTRL_OBJ_DELETE
	call_if 1, CaveOfOrigin_B4F_EventScript_15DDC1
	end

CaveOfOrigin_B4F_EventScript_15DDC1:: @ 815DDC1
	removeobject 1
	return

CaveOfOrigin_B4F_MapScript1_15DDC5:: @ 815DDC5
	.ifdef SAPPHIRE
	setmaplayoutindex 163
	.else
	setmaplayoutindex 313
	.endif
	call CaveOfOrigin_B4F_EventScript_1A01B5
	checkflag FLAG_LEGENDARY_BATTLE_COMPLETED
	call_if 1, CaveOfOrigin_B4F_EventScript_1A04E3
	end

CaveOfOrigin_B4F_EventScript_15DDD7:: @ 815DDD7
	lockall
	applymovement 255, CaveOfOrigin_B4F_Movement_1A0841
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox UnknownString_81B4F03, 4
	.else
	msgbox CaveOfOrigin_B4F_Text_1B4FE4, 4
	.endif
	closemessage
	setweather 0
	doweather
	special WaitWeather
	waitstate
	playse 209
	setfieldeffect 0, 9
	setfieldeffect 1, 13
	setfieldeffect 2, 0
	dofieldeffect 54
	waitfieldeffect 54
	.ifdef SAPPHIRE
	setvar RESULT, 3
	.else
	setvar RESULT, 2
	.endif
	playse 107
	special sub_80818A4
	waitstate
	special sub_80818FC
	waitstate
	applymovement 1, CaveOfOrigin_B4F_Movement_15DE7D
	waitmovement 0
	delay 60
	setwildbattle SPECIES_GROUDON_OR_KYOGRE, 45, ITEM_NONE
	waitse
	playpokecry SPECIES_GROUDON_OR_KYOGRE, 2
	delay 40
	waitpokecry
	setflag SYS_CTRL_OBJ_DELETE
	special ScrSpecial_StartGroudonKyogreBattle
	waitstate
	clearflag SYS_CTRL_OBJ_DELETE
	specialvar RESULT, sub_810E300
	compare RESULT, 1
	call_if 1, CaveOfOrigin_B4F_EventScript_15DE73
	setflag 816
	setflag 855
	setflag 856
	clearflag 815
	setvar 0x409b, 1
	setflag FLAG_LEGENDARY_BATTLE_COMPLETED
	clearflag 854
	clearflag SYS_WEATHER_CTRL
	setvar 0x40b9, 2
	clearflag 916
	releaseall
	end

CaveOfOrigin_B4F_EventScript_15DE73:: @ 815DE73
	.ifdef SAPPHIRE
	msgbox UnknownString_81B4F29, 4
	.else
	msgbox CaveOfOrigin_B4F_Text_1B5009, 4
	.endif
	closemessage
	return

CaveOfOrigin_B4F_Movement_15DE7D:: @ 815DE7D
	step_5e
	step_60
	step_14
	step_14
	step_61
	step_end
