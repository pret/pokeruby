RustboroCity_DevonCorp_2F_MapScripts:: @ 81574CA
	map_script 3, RustboroCity_DevonCorp_2F_MapScript1_1574D0
	.byte 0

RustboroCity_DevonCorp_2F_MapScript1_1574D0:: @ 81574D0
	compare_var_to_imm 0x40c4, 1
	call_if 1, RustboroCity_DevonCorp_2F_EventScript_1574DC
	end

RustboroCity_DevonCorp_2F_EventScript_1574DC:: @ 81574DC
	setvar 0x40c4, 2
	return

RustboroCity_DevonCorp_2F_EventScript_1574E2:: @ 81574E2
	lock
	faceplayer
	compare_var_to_imm 0x40c4, 1
	call_if 1, RustboroCity_DevonCorp_2F_EventScript_1574DC
	msgbox RustboroCity_DevonCorp_2F_Text_182B81, 4
	release
	end

RustboroCity_DevonCorp_2F_EventScript_1574F9:: @ 81574F9
	lock
	faceplayer
	compare_var_to_imm 0x40c4, 1
	call_if 1, RustboroCity_DevonCorp_2F_EventScript_1574DC
	checkflag 287
	goto_if_eq RustboroCity_DevonCorp_2F_EventScript_157519
	msgbox RustboroCity_DevonCorp_2F_Text_182BD8, 4
	release
	end

RustboroCity_DevonCorp_2F_EventScript_157519:: @ 8157519
	msgbox RustboroCity_DevonCorp_2F_Text_182C25, 4
	release
	end

RustboroCity_DevonCorp_2F_EventScript_157523:: @ 8157523
	lock
	faceplayer
	compare_var_to_imm 0x40c4, 1
	call_if 1, RustboroCity_DevonCorp_2F_EventScript_1574DC
	checkflag 188
	goto_if_eq RustboroCity_DevonCorp_2F_EventScript_157543
	msgbox RustboroCity_DevonCorp_2F_Text_182D2A, 4
	release
	end

RustboroCity_DevonCorp_2F_EventScript_157543:: @ 8157543
	msgbox RustboroCity_DevonCorp_2F_Text_182D7E, 4
	release
	end

RustboroCity_DevonCorp_2F_EventScript_15754D:: @ 815754D
	lock
	faceplayer
	compare_var_to_imm 0x40c4, 1
	call_if 1, RustboroCity_DevonCorp_2F_EventScript_1574DC
	msgbox RustboroCity_DevonCorp_2F_Text_182E6B, 4
	release
	end

RustboroCity_DevonCorp_2F_EventScript_157564:: @ 8157564
	lock
	faceplayer
	compare_var_to_imm 0x40c4, 2
	goto_if_eq RustboroCity_DevonCorp_2F_EventScript_15764A
	compare_var_to_imm 0x40c4, 1
	goto_if_eq RustboroCity_DevonCorp_2F_EventScript_157640
	msgbox RustboroCity_DevonCorp_2F_Text_182ED5, 4
	checkitem ITEM_ROOT_FOSSIL, 1
	compare_var_to_imm RESULT, 1
	goto_if_eq RustboroCity_DevonCorp_2F_EventScript_1575A6
	checkitem ITEM_CLAW_FOSSIL, 1
	compare_var_to_imm RESULT, 1
	goto_if_eq RustboroCity_DevonCorp_2F_EventScript_1575EE
	release
	end

RustboroCity_DevonCorp_2F_EventScript_1575A6:: @ 81575A6
	closebutton
	playsfx 21
	move 5, RustboroCity_DevonCorp_2F_Movement_1A0833
	waitmove 0
	move 5, RustboroCity_DevonCorp_2F_Movement_1A0835
	waitmove 0
	msgbox RustboroCity_DevonCorp_2F_Text_182F35, 5
	compare_var_to_imm RESULT, 0
	goto_if_eq RustboroCity_DevonCorp_2F_EventScript_157636
	bufferitem 0, ITEM_ROOT_FOSSIL
	msgbox RustboroCity_DevonCorp_2F_Text_183023, 4
	removeitem ITEM_ROOT_FOSSIL, 1
	setvar 0x40c4, 1
	setvar 0x40c5, 1
	release
	end

RustboroCity_DevonCorp_2F_EventScript_1575EE:: @ 81575EE
	closebutton
	playsfx 21
	move 5, RustboroCity_DevonCorp_2F_Movement_1A0833
	waitmove 0
	move 5, RustboroCity_DevonCorp_2F_Movement_1A0835
	waitmove 0
	msgbox RustboroCity_DevonCorp_2F_Text_182F35, 5
	compare_var_to_imm RESULT, 0
	goto_if_eq RustboroCity_DevonCorp_2F_EventScript_157636
	bufferitem 0, ITEM_CLAW_FOSSIL
	msgbox RustboroCity_DevonCorp_2F_Text_183023, 4
	removeitem ITEM_CLAW_FOSSIL, 1
	setvar 0x40c4, 1
	setvar 0x40c5, 2
	release
	end

RustboroCity_DevonCorp_2F_EventScript_157636:: @ 8157636
	msgbox RustboroCity_DevonCorp_2F_Text_182FD7, 4
	release
	end

RustboroCity_DevonCorp_2F_EventScript_157640:: @ 8157640
	msgbox RustboroCity_DevonCorp_2F_Text_183072, 4
	release
	end

RustboroCity_DevonCorp_2F_EventScript_15764A:: @ 815764A
	compare_var_to_imm 0x40c5, 1
	goto_if_eq RustboroCity_DevonCorp_2F_EventScript_157661
	compare_var_to_imm 0x40c5, 2
	goto_if_eq RustboroCity_DevonCorp_2F_EventScript_1576B4
	end

RustboroCity_DevonCorp_2F_EventScript_157661:: @ 8157661
	bufferpoke 1, SPECIES_LILEEP
	msgbox RustboroCity_DevonCorp_2F_Text_183124, 4
	countpokemon
	compare_var_to_imm RESULT, 6
	goto_if_eq RustboroCity_DevonCorp_2F_EventScript_157707
	copyvar 0x8004, RESULT
	setvar 0x40c4, 0
	setflag 267
	fanfare 370
	message RustboroCity_DevonCorp_2F_Text_18319E
	waitfanfare
	waittext
	givepokemon SPECIES_LILEEP, 20, ITEM_NONE, 0x0, 0x0, 0
	msgbox RustboroCity_DevonCorp_2F_Text_1A1102, 5
	compare_var_to_imm RESULT, 1
	call_if 1, RustboroCity_DevonCorp_2F_EventScript_1A0678
	release
	end

RustboroCity_DevonCorp_2F_EventScript_1576B4:: @ 81576B4
	bufferpoke 1, SPECIES_ANORITH
	msgbox RustboroCity_DevonCorp_2F_Text_183124, 4
	countpokemon
	compare_var_to_imm RESULT, 6
	goto_if_eq RustboroCity_DevonCorp_2F_EventScript_157707
	copyvar 0x8004, RESULT
	setvar 0x40c4, 0
	setflag 267
	fanfare 370
	message RustboroCity_DevonCorp_2F_Text_18319E
	waitfanfare
	waittext
	givepokemon SPECIES_ANORITH, 20, ITEM_NONE, 0x0, 0x0, 0
	msgbox RustboroCity_DevonCorp_2F_Text_1A1102, 5
	compare_var_to_imm RESULT, 1
	call_if 1, RustboroCity_DevonCorp_2F_EventScript_1A0678
	release
	end

RustboroCity_DevonCorp_2F_EventScript_157707:: @ 8157707
	msgbox RustboroCity_DevonCorp_2F_Text_1831C8, 4
	release
	end
