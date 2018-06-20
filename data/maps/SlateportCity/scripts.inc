SlateportCity_MapScripts:: @ 814BA36
	map_script 3, SlateportCity_MapScript1_14BA3C
	.byte 0

SlateportCity_MapScript1_14BA3C:: @ 814BA3C
	.ifdef SAPPHIRE
	setvar VAR_OBJ_GFX_ID_0, EVENT_OBJ_GFX_AQUA_MEMBER_F
	setvar VAR_OBJ_GFX_ID_1, EVENT_OBJ_GFX_AQUA_MEMBER_M
	.else
	setvar VAR_OBJ_GFX_ID_0, EVENT_OBJ_GFX_MAGMA_MEMBER_F
	setvar VAR_OBJ_GFX_ID_1, EVENT_OBJ_GFX_MAGMA_MEMBER_M
	.endif
	setvar VAR_SLATEPORT_MUSEUM_1F_STATE, 0
	call SlateportCity_EventScript_14BA5C
	compare VAR_SLATEPORT_STATE, 1
	call_if_eq SlateportCity_EventScript_14BA68
	end

SlateportCity_EventScript_14BA5C:: @ 814BA5C
	setflag FLAG_VISITED_SLATEPORT_CITY
	setvar VAR_LINK_CONTEST_ROOM_STATE, 0
	setflag FLAG_HIDE_CONTEST_REPORTER_SLATEPORT
	return

SlateportCity_EventScript_14BA68:: @ 814BA68
	setobjectxyperm 11, 28, 13
	setobjectxyperm 7, 25, 13
	setobjectxyperm 3, 25, 14
	setobjectxyperm 6, 27, 16
	setobjectxyperm 8, 28, 16
	setobjectxyperm 1, 29, 16
	setobjectxyperm 2, 31, 14
	setobjectmovementtype 11, 8
	setobjectmovementtype 7, 18
	setobjectmovementtype 3, 16
	setobjectmovementtype 6, 7
	setobjectmovementtype 8, 7
	setobjectmovementtype 1, 7
	setobjectmovementtype 2, 9
	return

SlateportCity_EventScript_14BAB6:: @ 814BAB6
	lock
	faceplayer
	message SlateportCity_Text_164642
	waitmessage
	pokemart SlateportCity_Items1
	msgbox SlateportCity_Text_1A0C02, 4
	release
	end

	.align 2
SlateportCity_Items1:: @ 814BAD0
	.2byte ITEM_PROTEIN
	.2byte ITEM_IRON
	.2byte ITEM_CARBOS
	.2byte ITEM_ZINC
	.2byte ITEM_CALCIUM
	.2byte ITEM_HP_UP
	.2byte ITEM_NONE
	release
	end

SlateportCity_EventScript_14BAE0:: @ 814BAE0
	lock
	faceplayer
	bufferleadmonspeciesname 0
	msgbox SlateportCity_Text_164682, 4
	specialvar RESULT, LeadMonHasEffortRibbon
	compare RESULT, 1
	call_if_eq SlateportCity_EventScript_14BB35
	specialvar RESULT, ScrSpecial_AreLeadMonEVsMaxedOut
	compare RESULT, 0
	call_if_eq SlateportCity_EventScript_14BB2B
	msgbox SlateportCity_Text_164691, 4
	playfanfare MUS_FANFA4
	message SlateportCity_Text_1646DD
	waitfanfare
	waitmessage
	msgbox SlateportCity_Text_1646FC, 4
	special GivLeadMonEffortRibbon
	release
	end

SlateportCity_EventScript_14BB2B:: @ 814BB2B
	msgbox SlateportCity_Text_16471C, 4
	release
	end

SlateportCity_EventScript_14BB35:: @ 814BB35
	msgbox SlateportCity_Text_164775, 4
	release
	end

SlateportCity_EventScript_14BB3F:: @ 814BB3F
	lock
	faceplayer
	compare VAR_SLATEPORT_STATE, 1
	call_if_eq SlateportCity_EventScript_14BB56
	msgbox SlateportCity_Text_164814, 4
	release
	end

SlateportCity_EventScript_14BB56:: @ 814BB56
	msgbox SlateportCity_Text_165376, 4
	release
	end

SlateportCity_EventScript_14BB60:: @ 814BB60
	lock
	faceplayer
	compare VAR_SLATEPORT_STATE, 1
	call_if_eq SlateportCity_EventScript_14BB77
	msgbox SlateportCity_Text_1648A0, 4
	release
	end

SlateportCity_EventScript_14BB77:: @ 814BB77
	msgbox SlateportCity_Text_165222, 4
	release
	end

SlateportCity_EventScript_14BB81:: @ 814BB81
	lock
	faceplayer
	compare VAR_SLATEPORT_STATE, 1
	call_if_eq SlateportCity_EventScript_14BBA1
	goto_if_set FLAG_RECEIVED_SECRET_POWER, SlateportCity_EventScript_14BBAB
	msgbox SlateportCity_Text_164937, 4
	release
	end

SlateportCity_EventScript_14BBA1:: @ 814BBA1
	msgbox SlateportCity_Text_1652A0, 4
	release
	end

SlateportCity_EventScript_14BBAB:: @ 814BBAB
	msgbox SlateportCity_Text_164995, 4
	release
	end

SlateportCity_EventScript_14BBB5:: @ 814BBB5
	lock
	faceplayer
	compare VAR_SLATEPORT_STATE, 1
	call_if_eq SlateportCity_EventScript_14BBCC
	msgbox SlateportCity_Text_164A30, 4
	release
	end

SlateportCity_EventScript_14BBCC:: @ 814BBCC
	msgbox SlateportCity_Text_16530A, 4
	release
	end

SlateportCity_EventScript_14BBD6:: @ 814BBD6
	compare VAR_SLATEPORT_STATE, 1
	goto_if_eq SlateportCity_EventScript_14BBEA
	msgbox SlateportCity_Text_164AA9, 2
	end

SlateportCity_EventScript_14BBEA:: @ 814BBEA
	msgbox SlateportCity_Text_1653D1, 3
	end

SlateportCity_EventScript_14BBF3:: @ 814BBF3
	lock
	faceplayer
	compare VAR_SLATEPORT_STATE, 1
	call_if_eq SlateportCity_EventScript_14BC0A
	msgbox SlateportCity_Text_164B34, 4
	release
	end

SlateportCity_EventScript_14BC0A:: @ 814BC0A
	msgbox SlateportCity_Text_1653F4, 4
	release
	end

SlateportCity_EventScript_14BC14:: @ 814BC14
	lock
	faceplayer
	goto_if_set FLAG_DOCK_REJECTED_DEVON_GOODS, SlateportCity_EventScript_14BC29
	msgbox SlateportCity_Text_164BBF, 4
	release
	end

SlateportCity_EventScript_14BC29:: @ 814BC29
	msgbox SlateportCity_Text_164BEA, 4
	release
	end

SlateportCity_EventScript_14BC33:: @ 814BC33
	msgbox SlateportCity_Text_165856, 3
	end

SlateportCity_EventScript_14BC3C:: @ 814BC3C
	lockall
	goto_if_set FLAG_SYS_GAME_CLEAR, SlateportCity_EventScript_14BC63
	goto_if_set FLAG_BADGE07_GET, SlateportCity_EventScript_14BC59
	msgbox SlateportCity_Text_1658A0, 4
	releaseall
	end

SlateportCity_EventScript_14BC59:: @ 814BC59
	msgbox SlateportCity_Text_1658E8, 4
	releaseall
	end

SlateportCity_EventScript_14BC63:: @ 814BC63
	msgbox SlateportCity_Text_165952, 4
	releaseall
	end

SlateportCity_EventScript_14BC6D:: @ 814BC6D
	msgbox SlateportCity_Text_1659B3, 3
	end

SlateportCity_EventScript_14BC76:: @ 814BC76
	msgbox SlateportCity_Text_1659E3, 3
	end

SlateportCity_EventScript_14BC7F:: @ 814BC7F
	msgbox SlateportCity_Text_165A17, 3
	end

SlateportCity_EventScript_14BC88:: @ 814BC88
	msgbox SlateportCity_Text_165A57, 3
	end

SlateportCity_EventScript_14BC91:: @ 814BC91
	lockall
	goto_if_set FLAG_SYS_GAME_CLEAR, SlateportCity_EventScript_14BCA5
	msgbox SlateportCity_Text_165A8B, 4
	releaseall
	end

SlateportCity_EventScript_14BCA5:: @ 814BCA5
	msgbox SlateportCity_Text_165B02, 4
	releaseall
	end

SlateportCity_EventScript_14BCAF:: @ 814BCAF
	msgbox SlateportCity_Text_165B48, 3
	end

SlateportCity_EventScript_14BCB8:: @ 814BCB8
	lock
	faceplayer
	compare VAR_SLATEPORT_STATE, 1
	call_if_eq SlateportCity_EventScript_14BCCF
	msgbox SlateportCity_Text_164F9E, 4
	release
	end

SlateportCity_EventScript_14BCCF:: @ 814BCCF
	msgbox SlateportCity_Text_164F9E, 4
	release
	end

SlateportCity_EventScript_14BCD9:: @ 814BCD9
	msgbox SlateportCity_Text_164FFC, 2
	end

SlateportCity_EventScript_14BCE2:: @ 814BCE2
	msgbox SlateportCity_Text_164E85, 2
	end

SlateportCity_EventScript_14BCEB:: @ 814BCEB
	msgbox SlateportCity_Text_164EDB, 2
	end

SlateportCity_EventScript_14BCF4:: @ 814BCF4
	msgbox SlateportCity_Text_164F62, 2
	end

SlateportCity_EventScript_14BCFD:: @ 814BCFD
	msgbox SlateportCity_Text_16507C, 2
	end

SlateportCity_EventScript_14BD06:: @ 814BD06
	lock
	faceplayer
	msgbox SlateportCity_Text_1650F1, MSGBOX_YESNO
	compare RESULT, YES
	call_if_eq SlateportCity_EventScript_14BD28
	compare RESULT, NO
	call_if_eq SlateportCity_EventScript_14BD31
	release
	end

SlateportCity_EventScript_14BD28:: @ 814BD28
	msgbox SlateportCity_Text_16511E, 4
	return

SlateportCity_EventScript_14BD31:: @ 814BD31
	msgbox SlateportCity_Text_1651A1, 4
	return

SlateportCity_EventScript_14BD3A:: @ 814BD3A
	lock
	faceplayer
	msgbox SlateportCity_Text_164C64, 4
	closemessage
	applymovement 5, SlateportCity_Movement_1A083D
	waitmovement 0
	release
	end

SlateportCity_EventScript_14BD51:: @ 814BD51
	lock
	faceplayer
	msgbox SlateportCity_Text_164C9F, 4
	closemessage
	applymovement 19, SlateportCity_Movement_1A083D
	waitmovement 0
	release
	end

SlateportCity_EventScript_14BD68:: @ 814BD68
	lock
	faceplayer
	msgbox SlateportCity_Text_164CE8, 4
	closemessage
	applymovement 20, SlateportCity_Movement_1A083D
	waitmovement 0
	release
	end

SlateportCity_EventScript_14BD7F:: @ 814BD7F
	lock
	faceplayer
	msgbox SlateportCity_Text_164D2B, 4
	closemessage
	applymovement 27, SlateportCity_Movement_1A083D
	waitmovement 0
	release
	end

SlateportCity_EventScript_14BD96:: @ 814BD96
	lock
	faceplayer
	msgbox SlateportCity_Text_164D92, 4
	closemessage
	applymovement 28, SlateportCity_Movement_1A083D
	waitmovement 0
	release
	end

SlateportCity_EventScript_14BDAD:: @ 814BDAD
	lock
	faceplayer
	msgbox SlateportCity_Text_164DD5, 4
	closemessage
	applymovement 29, SlateportCity_Movement_1A083D
	waitmovement 0
	release
	end

SlateportCity_EventScript_14BDC4:: @ 814BDC4
	lock
	faceplayer
	msgbox SlateportCity_Text_164DF4, 4
	closemessage
	applymovement 30, SlateportCity_Movement_1A083D
	waitmovement 0
	release
	end

SlateportCity_EventScript_14BDDB:: @ 814BDDB
	lock
	faceplayer
	msgbox SlateportCity_Text_164E46, 4
	closemessage
	applymovement 31, SlateportCity_Movement_1A083D
	waitmovement 0
	release
	end

SlateportCity_EventScript_14BDF2:: @ 814BDF2
	lock
	faceplayer
	message SlateportCity_Text_1A0BE4
	waitmessage
	pokemartdecoration SlateportCity_Decorations1
	msgbox SlateportCity_Text_1A0C02, 4
	release
	end

	.align 2
SlateportCity_Decorations1:: @ 814BE0C
	.2byte DECOR_AZURILL_DOLL
	.2byte DECOR_MARILL_DOLL
	.2byte DECOR_SKITTY_DOLL
	.2byte DECOR_NONE
	release
	end

SlateportCity_EventScript_14BE16:: @ 814BE16
	msgbox SlateportCity_Text_1A116E, 4
	release
	end

SlateportCity_EventScript_14BE20:: @ 814BE20
	lock
	faceplayer
	goto_if_unset FLAG_RECEIVED_SECRET_POWER, SlateportCity_EventScript_14BE16
	message SlateportCity_Text_1A0BE4
	waitmessage
	pokemartdecoration SlateportCity_Decorations2
	msgbox SlateportCity_Text_1A0C02, 4
	release
	end

	.align 2
SlateportCity_Decorations2:: @ 814BE40
	.2byte DECOR_RED_BRICK
	.2byte DECOR_BLUE_BRICK
	.2byte DECOR_YELLOW_BRICK
	.2byte DECOR_RED_BALLOON
	.2byte DECOR_BLUE_BALLOON
	.2byte DECOR_YELLOW_BALLOON
	.2byte DECOR_C_LOW_NOTE_MAT
	.2byte DECOR_D_NOTE_MAT
	.2byte DECOR_E_NOTE_MAT
	.2byte DECOR_F_NOTE_MAT
	.2byte DECOR_G_NOTE_MAT
	.2byte DECOR_A_NOTE_MAT
	.2byte DECOR_B_NOTE_MAT
	.2byte DECOR_C_HIGH_NOTE_MAT
	.2byte DECOR_NONE
	release
	end

@ 814BE60
	lock
	faceplayer
	goto_if_unset FLAG_RECEIVED_SECRET_POWER, SlateportCity_EventScript_14BE16
	message SlateportCity_Text_1A0BE4
	waitmessage
	pokemartdecoration SlateportCity_Decorations3
	msgbox SlateportCity_Text_1A0C02, 4
	release
	end

	.align 2
SlateportCity_Decorations3:: @ 814BE80
	.2byte DECOR_MUD_BALL
	.2byte DECOR_SLIDE
	.2byte DECOR_FENCE_LENGTH
	.2byte DECOR_FENCE_WIDTH
	.2byte DECOR_TIRE
	.2byte DECOR_BREAKABLE_DOOR
	.2byte DECOR_SOLID_BOARD
	.2byte DECOR_STAND
	.2byte DECOR_TV
	.2byte DECOR_ROUND_TV
	.2byte DECOR_CUTE_TV
	.2byte DECOR_NONE
	release
	end

SlateportCity_EventScript_14BE9A:: @ 814BE9A
	lock
	faceplayer
	message SlateportCity_Text_1A0BE4
	waitmessage
	pokemart SlateportCity_Items2
	msgbox SlateportCity_Text_1A0C02, 4
	release
	end

	.align 2
SlateportCity_Items2:: @ 814BEB4
	.2byte ITEM_TM10_HIDDEN_POWER
	.2byte ITEM_TM43_SECRET_POWER
	.2byte ITEM_NONE
	release
	end

SlateportCity_EventScript_14BEBC:: @ 814BEBC
	lockall
	msgbox SlateportCity_Text_165498, 4
	msgbox SlateportCity_Text_1654E0, 4
	closemessage
	applymovement 10, SlateportCity_Movement_1A0843
	waitmovement 0
	delay 10
	applymovement 9, SlateportCity_Movement_1A0845
	waitmovement 0
	delay 25
	applymovement 11, SlateportCity_Movement_14C000
	applymovement 255, SlateportCity_Movement_14C00E
	applymovement 10, SlateportCity_Movement_14BFDD
	applymovement 9, SlateportCity_Movement_14BFEA
	waitmovement 0
	removeobject 10
	removeobject 9
	msgbox SlateportCity_Text_16558D, 4
	applymovement 11, SlateportCity_Movement_1A0841
	waitmovement 0
	msgbox SlateportCity_Text_1655E7, 4
	playbgm MUS_EVIL_TEAM, FALSE
	msgbox SlateportCity_Text_1656BC, 4
	applymovement 6, SlateportCity_Movement_1A083F
	applymovement 1, SlateportCity_Movement_1A083F
	applymovement 7, SlateportCity_Movement_14BFCD
	applymovement 3, SlateportCity_Movement_1A0831
	applymovement 2, SlateportCity_Movement_14BFD5
	waitmovement 0
	applymovement 11, SlateportCity_Movement_1A0845
	waitmovement 0
	msgbox SlateportCity_Text_16578F, 4
	playse SE_PIN
	applymovement 11, SlateportCity_Movement_1A0833
	waitmovement 0
	applymovement 11, SlateportCity_Movement_1A0835
	waitmovement 0
	msgbox SlateportCity_Text_1657FA, 4
	applymovement 11, SlateportCity_Movement_1A0839
	waitmovement 0
	msgbox SlateportCity_Text_16583A, 4
	closemessage
	applymovement 11, SlateportCity_Movement_14BFFB
	applymovement 255, SlateportCity_Movement_14C008
	waitmovement 0
	removeobject 11
	clearflag FLAG_HIDE_STERN_SLATEPORT_HARBOR
	clearflag FLAG_HIDE_SUBMARINE_SHADOW_SLATEPORT_HARBOR
	clearflag FLAG_HIDE_GRUNT_1_SLATEPORT_HARBOR
	clearflag FLAG_HIDE_GRUNT_2_SLATEPORT_HARBOR
	setvar VAR_SLATEPORT_STATE, 2
	warp MAP_SLATEPORT_CITY_HARBOR, 255, 11, 14
	waitstate
	releaseall
	end

SlateportCity_Movement_14BFCD:: @ 814BFCD
	delay_16
	delay_16
	emote_question_mark
	walk_in_place_fastest_right
	delay_16
	delay_16
	walk_in_place_fastest_left
	end_movement

SlateportCity_Movement_14BFD5:: @ 814BFD5
	emote_question_mark
	walk_in_place_fastest_up
	delay_16
	walk_in_place_fastest_down
	delay_16
	delay_16
	walk_in_place_fastest_left
	end_movement

SlateportCity_Movement_14BFDD:: @ 814BFDD
	delay_16
	walk_left
	walk_left
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	end_movement

SlateportCity_Movement_14BFEA:: @ 814BFEA
	walk_down
	walk_left
	walk_left
	walk_left
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	end_movement

@ 814BFF8
	walk_down
	walk_in_place_fastest_up
	end_movement

SlateportCity_Movement_14BFFB:: @ 814BFFB
	walk_right
	walk_up
	walk_up
	set_invisible
	end_movement

SlateportCity_Movement_14C000:: @ 814C000
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	walk_down
	walk_left
	end_movement

SlateportCity_Movement_14C008:: @ 814C008
	walk_in_place_fastest_right
	delay_16
	delay_16
	walk_right
	walk_up
	end_movement

SlateportCity_Movement_14C00E:: @ 814C00E
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	walk_in_place_fastest_down
	end_movement

SlateportCity_EventScript_14C017:: @ 814C017
	msgbox SlateportCity_Text_165425, 3
	end

SlateportCity_EventScript_14C020:: @ 814C020
	msgbox SlateportCity_Text_165458, 3
	end

SlateportCity_EventScript_14C029:: @ 814C029
	msgbox SlateportCity_Text_1647A7, 2
	end
