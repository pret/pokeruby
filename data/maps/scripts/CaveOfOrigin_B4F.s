CaveOfOrigin_B4F_MapScripts:: @ 815DDAC
	map_script 5, CaveOfOrigin_B4F_MapScript1_15DDB7
	map_script 3, CaveOfOrigin_B4F_MapScript1_15DDC5
	.byte 0

CaveOfOrigin_B4F_MapScript1_15DDB7:: @ 815DDB7
	checkflag 2145
	callif 1, CaveOfOrigin_B4F_EventScript_15DDC1
	end

CaveOfOrigin_B4F_EventScript_15DDC1:: @ 815DDC1
	disappear 1
	return

CaveOfOrigin_B4F_MapScript1_15DDC5:: @ 815DDC5
	.ifdef SAPPHIRE
	setmapfooter 163
	.else
	setmapfooter 313
	.endif
	call CaveOfOrigin_B4F_EventScript_1A01B5
	checkflag 113
	callif 1, CaveOfOrigin_B4F_EventScript_1A04E3
	end

CaveOfOrigin_B4F_EventScript_15DDD7:: @ 815DDD7
	lockall
	move 255, CaveOfOrigin_B4F_Movement_1A0841
	waitmove 0
	msgbox CaveOfOrigin_B4F_Text_1B4FE4, 4
	closebutton
	setweather 0
	doweather
	special 284
	waitstate
	playsfx 209
	setanimation 0, 9
	setanimation 1, 13
	setanimation 2, 0
	doanimation 54
	checkanimation 54
	.ifdef SAPPHIRE
	setvar RESULT, 3
	.else
	setvar RESULT, 2
	.endif
	playsfx 107
	special 281
	waitstate
	special 282
	waitstate
	move 1, CaveOfOrigin_B4F_Movement_15DE7D
	waitmove 0
	pause 60
	setwildbattle SPECIES_GROUDON_OR_KYOGRE, 45, ITEM_NONE
	checksound
	pokecry SPECIES_GROUDON_OR_KYOGRE, 2
	pause 40
	waitpokecry
	setflag 2145
	special 311
	waitstate
	clearflag 2145
	specialval RESULT, 180
	compare RESULT, 1
	callif 1, CaveOfOrigin_B4F_EventScript_15DE73
	setflag 816
	setflag 855
	setflag 856
	clearflag 815
	setvar 0x409b, 1
	setflag 113
	clearflag 854
	clearflag 2090
	setvar 0x40b9, 2
	clearflag 916
	releaseall
	end

CaveOfOrigin_B4F_EventScript_15DE73:: @ 815DE73
	msgbox CaveOfOrigin_B4F_Text_1B5009, 4
	closebutton
	return

CaveOfOrigin_B4F_Movement_15DE7D:: @ 815DE7D
	step_5e
	step_60
	step_14
	step_14
	step_61
	step_end

