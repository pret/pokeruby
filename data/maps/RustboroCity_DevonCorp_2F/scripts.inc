RustboroCity_DevonCorp_2F_MapScripts:: @ 81574CA
	map_script MAP_SCRIPT_ON_TRANSITION, RustboroCity_DevonCorp_2F_MapScript1_1574D0
	.byte 0

RustboroCity_DevonCorp_2F_MapScript1_1574D0:: @ 81574D0
	compare VAR_FOSSIL_RESURRECTION_STATE, 1
	call_if_eq RustboroCity_DevonCorp_2F_EventScript_1574DC
	end

RustboroCity_DevonCorp_2F_EventScript_1574DC:: @ 81574DC
	setvar VAR_FOSSIL_RESURRECTION_STATE, 2
	return

RustboroCity_DevonCorp_2F_EventScript_1574E2:: @ 81574E2
	lock
	faceplayer
	compare VAR_FOSSIL_RESURRECTION_STATE, 1
	call_if_eq RustboroCity_DevonCorp_2F_EventScript_1574DC
	msgbox RustboroCity_DevonCorp_2F_Text_182B81, MSGBOX_DEFAULT
	release
	end

RustboroCity_DevonCorp_2F_EventScript_1574F9:: @ 81574F9
	lock
	faceplayer
	compare VAR_FOSSIL_RESURRECTION_STATE, 1
	call_if_eq RustboroCity_DevonCorp_2F_EventScript_1574DC
	goto_if_set FLAG_MET_DEVON_EMPLOYEE, RustboroCity_DevonCorp_2F_EventScript_157519
	msgbox RustboroCity_DevonCorp_2F_Text_182BD8, MSGBOX_DEFAULT
	release
	end

RustboroCity_DevonCorp_2F_EventScript_157519:: @ 8157519
	msgbox RustboroCity_DevonCorp_2F_Text_182C25, MSGBOX_DEFAULT
	release
	end

RustboroCity_DevonCorp_2F_EventScript_157523:: @ 8157523
	lock
	faceplayer
	compare VAR_FOSSIL_RESURRECTION_STATE, 1
	call_if_eq RustboroCity_DevonCorp_2F_EventScript_1574DC
	goto_if_set FLAG_RECEIVED_POKENAV, RustboroCity_DevonCorp_2F_EventScript_157543
	msgbox RustboroCity_DevonCorp_2F_Text_182D2A, MSGBOX_DEFAULT
	release
	end

RustboroCity_DevonCorp_2F_EventScript_157543:: @ 8157543
	msgbox RustboroCity_DevonCorp_2F_Text_182D7E, MSGBOX_DEFAULT
	release
	end

RustboroCity_DevonCorp_2F_EventScript_15754D:: @ 815754D
	lock
	faceplayer
	compare VAR_FOSSIL_RESURRECTION_STATE, 1
	call_if_eq RustboroCity_DevonCorp_2F_EventScript_1574DC
	msgbox RustboroCity_DevonCorp_2F_Text_182E6B, MSGBOX_DEFAULT
	release
	end

RustboroCity_DevonCorp_2F_EventScript_157564:: @ 8157564
	lock
	faceplayer
	compare VAR_FOSSIL_RESURRECTION_STATE, 2
	goto_if_eq RustboroCity_DevonCorp_2F_EventScript_15764A
	compare VAR_FOSSIL_RESURRECTION_STATE, 1
	goto_if_eq RustboroCity_DevonCorp_2F_EventScript_157640
	msgbox RustboroCity_DevonCorp_2F_Text_182ED5, MSGBOX_DEFAULT
	checkitem ITEM_ROOT_FOSSIL, 1
	compare VAR_RESULT, 1
	goto_if_eq RustboroCity_DevonCorp_2F_EventScript_1575A6
	checkitem ITEM_CLAW_FOSSIL, 1
	compare VAR_RESULT, 1
	goto_if_eq RustboroCity_DevonCorp_2F_EventScript_1575EE
	release
	end

RustboroCity_DevonCorp_2F_EventScript_1575A6:: @ 81575A6
	closemessage
	playse SE_PIN
	applymovement 5, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 5, Common_Movement_Delay48
	waitmovement 0
	msgbox RustboroCity_DevonCorp_2F_Text_182F35, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq RustboroCity_DevonCorp_2F_EventScript_157636
	bufferitemname 0, ITEM_ROOT_FOSSIL
	msgbox RustboroCity_DevonCorp_2F_Text_183023, MSGBOX_DEFAULT
	removeitem ITEM_ROOT_FOSSIL
	setvar VAR_FOSSIL_RESURRECTION_STATE, 1
	setvar VAR_WHICH_FOSSIL_REVIVED, 1
	release
	end

RustboroCity_DevonCorp_2F_EventScript_1575EE:: @ 81575EE
	closemessage
	playse SE_PIN
	applymovement 5, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 5, Common_Movement_Delay48
	waitmovement 0
	msgbox RustboroCity_DevonCorp_2F_Text_182F35, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq RustboroCity_DevonCorp_2F_EventScript_157636
	bufferitemname 0, ITEM_CLAW_FOSSIL
	msgbox RustboroCity_DevonCorp_2F_Text_183023, MSGBOX_DEFAULT
	removeitem ITEM_CLAW_FOSSIL
	setvar VAR_FOSSIL_RESURRECTION_STATE, 1
	setvar VAR_WHICH_FOSSIL_REVIVED, 2
	release
	end

RustboroCity_DevonCorp_2F_EventScript_157636:: @ 8157636
	msgbox RustboroCity_DevonCorp_2F_Text_182FD7, MSGBOX_DEFAULT
	release
	end

RustboroCity_DevonCorp_2F_EventScript_157640:: @ 8157640
	msgbox RustboroCity_DevonCorp_2F_Text_183072, MSGBOX_DEFAULT
	release
	end

RustboroCity_DevonCorp_2F_EventScript_15764A:: @ 815764A
	compare VAR_WHICH_FOSSIL_REVIVED, 1
	goto_if_eq RustboroCity_DevonCorp_2F_EventScript_157661
	compare VAR_WHICH_FOSSIL_REVIVED, 2
	goto_if_eq RustboroCity_DevonCorp_2F_EventScript_1576B4
	end

RustboroCity_DevonCorp_2F_EventScript_157661:: @ 8157661
	bufferspeciesname 1, SPECIES_LILEEP
	msgbox RustboroCity_DevonCorp_2F_Text_183124, MSGBOX_DEFAULT
	getpartysize
	compare VAR_RESULT, 6
	goto_if_eq RustboroCity_DevonCorp_2F_EventScript_157707
	copyvar VAR_0x8004, VAR_RESULT
	setvar VAR_FOSSIL_RESURRECTION_STATE, 0
	setflag FLAG_RECEIVED_FOSSIL_MON
	playfanfare MUS_OBTAIN_ITEM
	message RustboroCity_DevonCorp_2F_Text_18319E
	waitfanfare
	waitmessage
	givemon SPECIES_LILEEP, 20, ITEM_NONE
	msgbox RustboroCity_DevonCorp_2F_Text_1A1102, MSGBOX_YESNO
	compare VAR_RESULT, YES
	call_if_eq Common_EventScript_NameReceivedPartyMon
	release
	end

RustboroCity_DevonCorp_2F_EventScript_1576B4:: @ 81576B4
	bufferspeciesname 1, SPECIES_ANORITH
	msgbox RustboroCity_DevonCorp_2F_Text_183124, MSGBOX_DEFAULT
	getpartysize
	compare VAR_RESULT, 6
	goto_if_eq RustboroCity_DevonCorp_2F_EventScript_157707
	copyvar VAR_0x8004, VAR_RESULT
	setvar VAR_FOSSIL_RESURRECTION_STATE, 0
	setflag FLAG_RECEIVED_FOSSIL_MON
	playfanfare MUS_OBTAIN_ITEM
	message RustboroCity_DevonCorp_2F_Text_18319E
	waitfanfare
	waitmessage
	givemon SPECIES_ANORITH, 20, ITEM_NONE
	msgbox RustboroCity_DevonCorp_2F_Text_1A1102, MSGBOX_YESNO
	compare VAR_RESULT, YES
	call_if_eq Common_EventScript_NameReceivedPartyMon
	release
	end

RustboroCity_DevonCorp_2F_EventScript_157707:: @ 8157707
	msgbox RustboroCity_DevonCorp_2F_Text_1831C8, MSGBOX_DEFAULT
	release
	end
