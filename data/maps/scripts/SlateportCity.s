SlateportCity_MapScripts:: @ 814BA36
	map_script 3, SlateportCity_MapScript1_14BA3C
	.byte 0

SlateportCity_MapScript1_14BA3C:: @ 814BA3C
	setvar 0x4010, 120
	setvar 0x4011, 119
	setvar 0x40aa, 0
	call SlateportCity_EventScript_14BA5C
	compare 0x4058, 1
	callif 1, SlateportCity_EventScript_14BA68
	end

SlateportCity_EventScript_14BA5C:: @ 814BA5C
	setflag 2071
	setvar 0x4086, 0
	setflag 803
	return

SlateportCity_EventScript_14BA68:: @ 814BA68
	movespriteperm 11, 28, 13
	movespriteperm 7, 25, 13
	movespriteperm 3, 25, 14
	movespriteperm 6, 27, 16
	movespriteperm 8, 28, 16
	movespriteperm 1, 29, 16
	movespriteperm 2, 31, 14
	spritebehave 11, 8
	spritebehave 7, 18
	spritebehave 3, 16
	spritebehave 6, 7
	spritebehave 8, 7
	spritebehave 1, 7
	spritebehave 2, 9
	return

SlateportCity_EventScript_14BAB6:: @ 814BAB6
	lock
	faceplayer
	message SlateportCity_Text_164642
	waittext
	pokemart SlateportCity_Pokemart_14BAD0
	loadptr 0, SlateportCity_Text_1A0C02
	callstd 4
	release
	end

	.incbin "baserom.gba", 0x14bacd, 0x3

SlateportCity_Pokemart_14BAD0:: @ 814BAD0
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
	bufferfirstpoke 0
	loadptr 0, SlateportCity_Text_164682
	callstd 4
	specialval RESULT, 292
	compare RESULT, 1
	callif 1, SlateportCity_EventScript_14BB35
	specialval RESULT, 294
	compare RESULT, 0
	callif 1, SlateportCity_EventScript_14BB2B
	loadptr 0, SlateportCity_Text_164691
	callstd 4
	fanfare 370
	message SlateportCity_Text_1646DD
	waitfanfare
	waittext
	loadptr 0, SlateportCity_Text_1646FC
	callstd 4
	special 293
	release
	end

SlateportCity_EventScript_14BB2B:: @ 814BB2B
	loadptr 0, SlateportCity_Text_16471C
	callstd 4
	release
	end

SlateportCity_EventScript_14BB35:: @ 814BB35
	loadptr 0, SlateportCity_Text_164775
	callstd 4
	release
	end

SlateportCity_EventScript_14BB3F:: @ 814BB3F
	lock
	faceplayer
	compare 0x4058, 1
	callif 1, SlateportCity_EventScript_14BB56
	loadptr 0, SlateportCity_Text_164814
	callstd 4
	release
	end

SlateportCity_EventScript_14BB56:: @ 814BB56
	loadptr 0, SlateportCity_Text_165376
	callstd 4
	release
	end

SlateportCity_EventScript_14BB60:: @ 814BB60
	lock
	faceplayer
	compare 0x4058, 1
	callif 1, SlateportCity_EventScript_14BB77
	loadptr 0, SlateportCity_Text_1648A0
	callstd 4
	release
	end

SlateportCity_EventScript_14BB77:: @ 814BB77
	loadptr 0, SlateportCity_Text_165222
	callstd 4
	release
	end

SlateportCity_EventScript_14BB81:: @ 814BB81
	lock
	faceplayer
	compare 0x4058, 1
	callif 1, SlateportCity_EventScript_14BBA1
	checkflag 96
	jumpeq SlateportCity_EventScript_14BBAB
	loadptr 0, SlateportCity_Text_164937
	callstd 4
	release
	end

SlateportCity_EventScript_14BBA1:: @ 814BBA1
	loadptr 0, SlateportCity_Text_1652A0
	callstd 4
	release
	end

SlateportCity_EventScript_14BBAB:: @ 814BBAB
	loadptr 0, SlateportCity_Text_164995
	callstd 4
	release
	end

SlateportCity_EventScript_14BBB5:: @ 814BBB5
	lock
	faceplayer
	compare 0x4058, 1
	callif 1, SlateportCity_EventScript_14BBCC
	loadptr 0, SlateportCity_Text_164A30
	callstd 4
	release
	end

SlateportCity_EventScript_14BBCC:: @ 814BBCC
	loadptr 0, SlateportCity_Text_16530A
	callstd 4
	release
	end

SlateportCity_EventScript_14BBD6:: @ 814BBD6
	compare 0x4058, 1
	jumpeq SlateportCity_EventScript_14BBEA
	loadptr 0, SlateportCity_Text_164AA9
	callstd 2
	end

SlateportCity_EventScript_14BBEA:: @ 814BBEA
	loadptr 0, SlateportCity_Text_1653D1
	callstd 3
	end

SlateportCity_EventScript_14BBF3:: @ 814BBF3
	lock
	faceplayer
	compare 0x4058, 1
	callif 1, SlateportCity_EventScript_14BC0A
	loadptr 0, SlateportCity_Text_164B34
	callstd 4
	release
	end

SlateportCity_EventScript_14BC0A:: @ 814BC0A
	loadptr 0, SlateportCity_Text_1653F4
	callstd 4
	release
	end

SlateportCity_EventScript_14BC14:: @ 814BC14
	lock
	faceplayer
	checkflag 148
	jumpeq SlateportCity_EventScript_14BC29
	loadptr 0, SlateportCity_Text_164BBF
	callstd 4
	release
	end

SlateportCity_EventScript_14BC29:: @ 814BC29
	loadptr 0, SlateportCity_Text_164BEA
	callstd 4
	release
	end

SlateportCity_EventScript_14BC33:: @ 814BC33
	loadptr 0, SlateportCity_Text_165856
	callstd 3
	end

SlateportCity_EventScript_14BC3C:: @ 814BC3C
	lockall
	checkflag 2052
	jumpeq SlateportCity_EventScript_14BC63
	checkflag 2061
	jumpeq SlateportCity_EventScript_14BC59
	loadptr 0, SlateportCity_Text_1658A0
	callstd 4
	releaseall
	end

SlateportCity_EventScript_14BC59:: @ 814BC59
	loadptr 0, SlateportCity_Text_1658E8
	callstd 4
	releaseall
	end

SlateportCity_EventScript_14BC63:: @ 814BC63
	loadptr 0, SlateportCity_Text_165952
	callstd 4
	releaseall
	end

SlateportCity_EventScript_14BC6D:: @ 814BC6D
	loadptr 0, SlateportCity_Text_1659B3
	callstd 3
	end

SlateportCity_EventScript_14BC76:: @ 814BC76
	loadptr 0, SlateportCity_Text_1659E3
	callstd 3
	end

SlateportCity_EventScript_14BC7F:: @ 814BC7F
	loadptr 0, SlateportCity_Text_165A17
	callstd 3
	end

SlateportCity_EventScript_14BC88:: @ 814BC88
	loadptr 0, SlateportCity_Text_165A57
	callstd 3
	end

SlateportCity_EventScript_14BC91:: @ 814BC91
	lockall
	checkflag 2052
	jumpeq SlateportCity_EventScript_14BCA5
	loadptr 0, SlateportCity_Text_165A8B
	callstd 4
	releaseall
	end

SlateportCity_EventScript_14BCA5:: @ 814BCA5
	loadptr 0, SlateportCity_Text_165B02
	callstd 4
	releaseall
	end

SlateportCity_EventScript_14BCAF:: @ 814BCAF
	loadptr 0, SlateportCity_Text_165B48
	callstd 3
	end

SlateportCity_EventScript_14BCB8:: @ 814BCB8
	lock
	faceplayer
	compare 0x4058, 1
	callif 1, SlateportCity_EventScript_14BCCF
	loadptr 0, SlateportCity_Text_164F9E
	callstd 4
	release
	end

SlateportCity_EventScript_14BCCF:: @ 814BCCF
	loadptr 0, SlateportCity_Text_164F9E
	callstd 4
	release
	end

SlateportCity_EventScript_14BCD9:: @ 814BCD9
	loadptr 0, SlateportCity_Text_164FFC
	callstd 2
	end

SlateportCity_EventScript_14BCE2:: @ 814BCE2
	loadptr 0, SlateportCity_Text_164E85
	callstd 2
	end

SlateportCity_EventScript_14BCEB:: @ 814BCEB
	loadptr 0, SlateportCity_Text_164EDB
	callstd 2
	end

SlateportCity_EventScript_14BCF4:: @ 814BCF4
	loadptr 0, SlateportCity_Text_164F62
	callstd 2
	end

SlateportCity_EventScript_14BCFD:: @ 814BCFD
	loadptr 0, SlateportCity_Text_16507C
	callstd 2
	end

SlateportCity_EventScript_14BD06:: @ 814BD06
	lock
	faceplayer
	loadptr 0, SlateportCity_Text_1650F1
	callstd 5
	compare RESULT, 1
	callif 1, SlateportCity_EventScript_14BD28
	compare RESULT, 0
	callif 1, SlateportCity_EventScript_14BD31
	release
	end

SlateportCity_EventScript_14BD28:: @ 814BD28
	loadptr 0, SlateportCity_Text_16511E
	callstd 4
	return

SlateportCity_EventScript_14BD31:: @ 814BD31
	loadptr 0, SlateportCity_Text_1651A1
	callstd 4
	return

SlateportCity_EventScript_14BD3A:: @ 814BD3A
	lock
	faceplayer
	loadptr 0, SlateportCity_Text_164C64
	callstd 4
	closebutton
	move 5, SlateportCity_Movement_1A083D
	waitmove 0
	release
	end

SlateportCity_EventScript_14BD51:: @ 814BD51
	lock
	faceplayer
	loadptr 0, SlateportCity_Text_164C9F
	callstd 4
	closebutton
	move 19, SlateportCity_Movement_1A083D
	waitmove 0
	release
	end

SlateportCity_EventScript_14BD68:: @ 814BD68
	lock
	faceplayer
	loadptr 0, SlateportCity_Text_164CE8
	callstd 4
	closebutton
	move 20, SlateportCity_Movement_1A083D
	waitmove 0
	release
	end

SlateportCity_EventScript_14BD7F:: @ 814BD7F
	lock
	faceplayer
	loadptr 0, SlateportCity_Text_164D2B
	callstd 4
	closebutton
	move 27, SlateportCity_Movement_1A083D
	waitmove 0
	release
	end

SlateportCity_EventScript_14BD96:: @ 814BD96
	lock
	faceplayer
	loadptr 0, SlateportCity_Text_164D92
	callstd 4
	closebutton
	move 28, SlateportCity_Movement_1A083D
	waitmove 0
	release
	end

SlateportCity_EventScript_14BDAD:: @ 814BDAD
	lock
	faceplayer
	loadptr 0, SlateportCity_Text_164DD5
	callstd 4
	closebutton
	move 29, SlateportCity_Movement_1A083D
	waitmove 0
	release
	end

SlateportCity_EventScript_14BDC4:: @ 814BDC4
	lock
	faceplayer
	loadptr 0, SlateportCity_Text_164DF4
	callstd 4
	closebutton
	move 30, SlateportCity_Movement_1A083D
	waitmove 0
	release
	end

SlateportCity_EventScript_14BDDB:: @ 814BDDB
	lock
	faceplayer
	loadptr 0, SlateportCity_Text_164E46
	callstd 4
	closebutton
	move 31, SlateportCity_Movement_1A083D
	waitmove 0
	release
	end

SlateportCity_EventScript_14BDF2:: @ 814BDF2
	lock
	faceplayer
	message SlateportCity_Text_1A0BE4
	waittext
	pokemartdecor SlateportCity_Pokemart_14BE0C
	loadptr 0, SlateportCity_Text_1A0C02
	callstd 4
	release
	end

	.incbin "baserom.gba", 0x14be09, 0x3

SlateportCity_Pokemart_14BE0C:: @ 814BE0C
	.2byte ITEM_FIRE_STONE
	.2byte ITEM_X_ACCURACY
	.2byte ITEM_THUNDER_STONE
	.2byte ITEM_NONE
	release
	end

SlateportCity_EventScript_14BE16:: @ 814BE16
	loadptr 0, SlateportCity_Text_1A116E
	callstd 4
	release
	end

SlateportCity_EventScript_14BE20:: @ 814BE20
	lock
	faceplayer
	checkflag 96
	jumpif 0, SlateportCity_EventScript_14BE16
	message SlateportCity_Text_1A0BE4
	waittext
	pokemartdecor SlateportCity_Pokemart_14BE40
	loadptr 0, SlateportCity_Text_1A0C02
	callstd 4
	release
	end

SlateportCity_Pokemart_14BE40:: @ 814BE40
	.2byte ITEM_MAX_REVIVE
	.2byte ITEM_SODA_POP
	.2byte ITEM_FRESH_WATER
	.2byte ITEM_LEMONADE
	.2byte ITEM_MOOMOO_MILK
	.2byte ITEM_ENERGY_POWDER
	.2byte ITEM_GREEN_SHARD
	.2byte 52
	.2byte 53
	.2byte 54
	.2byte 55
	.2byte 56
	.2byte 57
	.2byte 58
	.2byte ITEM_NONE
	release
	end

	.incbin "baserom.gba", 0x14be60, 0x3a

SlateportCity_EventScript_14BE9A:: @ 814BE9A
	lock
	faceplayer
	message SlateportCity_Text_1A0BE4
	waittext
	pokemart SlateportCity_Pokemart_14BEB4
	loadptr 0, SlateportCity_Text_1A0C02
	callstd 4
	release
	end

	.incbin "baserom.gba", 0x14beb1, 0x3

SlateportCity_Pokemart_14BEB4:: @ 814BEB4
	.2byte ITEM_TM10
	.2byte ITEM_TM43
	.2byte ITEM_NONE
	release
	end

SlateportCity_EventScript_14BEBC:: @ 814BEBC
	lockall
	loadptr 0, SlateportCity_Text_165498
	callstd 4
	loadptr 0, SlateportCity_Text_1654E0
	callstd 4
	closebutton
	move 10, SlateportCity_Movement_1A0843
	waitmove 0
	pause 10
	move 9, SlateportCity_Movement_1A0845
	waitmove 0
	pause 25
	move 11, SlateportCity_Movement_14C000
	move 255, SlateportCity_Movement_14C00E
	move 10, SlateportCity_Movement_14BFDD
	move 9, SlateportCity_Movement_14BFEA
	waitmove 0
	disappear 10
	disappear 9
	loadptr 0, SlateportCity_Text_16558D
	callstd 4
	move 11, SlateportCity_Movement_1A0841
	waitmove 0
	loadptr 0, SlateportCity_Text_1655E7
	callstd 4
	playmusic 441, 0
	loadptr 0, SlateportCity_Text_1656BC
	callstd 4
	move 6, SlateportCity_Movement_1A083F
	move 1, SlateportCity_Movement_1A083F
	move 7, SlateportCity_Movement_14BFCD
	move 3, SlateportCity_Movement_1A0831
	move 2, SlateportCity_Movement_14BFD5
	waitmove 0
	move 11, SlateportCity_Movement_1A0845
	waitmove 0
	loadptr 0, SlateportCity_Text_16578F
	callstd 4
	playsfx 21
	move 11, SlateportCity_Movement_1A0833
	waitmove 0
	move 11, SlateportCity_Movement_1A0835
	waitmove 0
	loadptr 0, SlateportCity_Text_1657FA
	callstd 4
	move 11, SlateportCity_Movement_1A0839
	waitmove 0
	loadptr 0, SlateportCity_Text_16583A
	callstd 4
	closebutton
	move 11, SlateportCity_Movement_14BFFB
	move 255, SlateportCity_Movement_14C008
	waitmove 0
	disappear 11
	clearflag 841
	clearflag 848
	clearflag 845
	clearflag 846
	setvar 0x4058, 2
	warp SlateportCity_Harbor, 255, 11, 14
	waitstate
	releaseall
	end

SlateportCity_Movement_14BFCD:: @ 814BFCD
	step_14
	step_14
	step_57
	step_28
	step_14
	step_14
	step_27
	step_end

SlateportCity_Movement_14BFD5:: @ 814BFD5
	step_57
	step_26
	step_14
	step_25
	step_14
	step_14
	step_27
	step_end

SlateportCity_Movement_14BFDD:: @ 814BFDD
	step_14
	step_left
	step_left
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

SlateportCity_Movement_14BFEA:: @ 814BFEA
	step_down
	step_left
	step_left
	step_left
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

	.incbin "baserom.gba", 0x14bff8, 0x3

SlateportCity_Movement_14BFFB:: @ 814BFFB
	step_right
	step_up
	step_up
	step_54
	step_end

SlateportCity_Movement_14C000:: @ 814C000
	step_14
	step_14
	step_14
	step_14
	step_14
	step_down
	step_left
	step_end

SlateportCity_Movement_14C008:: @ 814C008
	step_28
	step_14
	step_14
	step_right
	step_up
	step_end

SlateportCity_Movement_14C00E:: @ 814C00E
	step_14
	step_14
	step_14
	step_14
	step_14
	step_14
	step_14
	step_25
	step_end

SlateportCity_EventScript_14C017:: @ 814C017
	loadptr 0, SlateportCity_Text_165425
	callstd 3
	end

SlateportCity_EventScript_14C020:: @ 814C020
	loadptr 0, SlateportCity_Text_165458
	callstd 3
	end

SlateportCity_EventScript_14C029:: @ 814C029
	loadptr 0, SlateportCity_Text_1647A7
	callstd 2
	end

