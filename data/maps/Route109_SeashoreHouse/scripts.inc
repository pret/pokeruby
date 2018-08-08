Route109_SeashoreHouse_MapScripts:: @ 8160DCA
	map_script 3, Route109_SeashoreHouse_MapScript1_160DD0
	.byte 0

Route109_SeashoreHouse_MapScript1_160DD0:: @ 8160DD0
	setflag FLAG_LANDMARK_SEASHORE_HOUSE
	end

Route109_SeashoreHouse_EventScript_160DD4:: @ 8160DD4
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_6_SODA_POP, Route109_SeashoreHouse_EventScript_160E36
	goto_if_set FLAG_DEFEATED_SEASHORE_HOUSE_TRAINERS, Route109_SeashoreHouse_EventScript_160E08
	goto_if_set FLAG_TEMP_2, Route109_SeashoreHouse_EventScript_160DFE
	msgbox Route109_SeashoreHouse_Text_19B4D9, 4
	setflag FLAG_TEMP_2
	release
	end

Route109_SeashoreHouse_EventScript_160DFE:: @ 8160DFE
	msgbox Route109_SeashoreHouse_Text_19B5B9, 4
	release
	end

Route109_SeashoreHouse_EventScript_160E08:: @ 8160E08
	msgbox Route109_SeashoreHouse_Text_19B609, 4
	giveitem_std ITEM_SODA_POP, 6
	compare RESULT, 0
	goto_if_eq Route109_SeashoreHouse_EventScript_160E2C
	setflag FLAG_RECEIVED_6_SODA_POP
	release
	end

Route109_SeashoreHouse_EventScript_160E2C:: @ 8160E2C
	msgbox Route109_SeashoreHouse_Text_19B6BE, 4
	release
	end

Route109_SeashoreHouse_EventScript_160E36:: @ 8160E36
	showmoneybox 0, 0
	nop
	msgbox Route109_SeashoreHouse_Text_19B702, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq Route109_SeashoreHouse_EventScript_160E5A
	msgbox Route109_SeashoreHouse_Text_19B773, 4
	hidemoneybox 0, 0
	release
	end

Route109_SeashoreHouse_EventScript_160E5A:: @ 8160E5A
	checkmoney 0x12c, 0
	compare RESULT, 0
	goto_if_eq Route109_SeashoreHouse_EventScript_160E9E
	checkitemspace ITEM_SODA_POP, 1
	compare RESULT, 0
	goto_if_eq Route109_SeashoreHouse_EventScript_160EAB
	msgbox Route109_SeashoreHouse_Text_19B74C, 4
	takemoney 0x12c, 0
	updatemoneybox 0, 0
	nop
	giveitem_std ITEM_SODA_POP
	hidemoneybox 0, 0
	release
	end

Route109_SeashoreHouse_EventScript_160E9E:: @ 8160E9E
	msgbox Route109_SeashoreHouse_Text_19B759, 4
	hidemoneybox 0, 0
	release
	end

Route109_SeashoreHouse_EventScript_160EAB:: @ 8160EAB
	msgbox Route109_SeashoreHouse_Text_1A0CC2, 4
	hidemoneybox 0, 0
	release
	end

Route109_SeashoreHouse_EventScript_160EB8:: @ 8160EB8
	trainerbattle 2, TRAINER_DWAYNE, 0, Route109_SeashoreHouse_Text_19B809, Route109_SeashoreHouse_Text_19B869, Route109_SeashoreHouse_EventScript_160F09
	msgbox Route109_SeashoreHouse_Text_19B89F, 6
	end

Route109_SeashoreHouse_EventScript_160ED3:: @ 8160ED3
	trainerbattle 2, TRAINER_JOHANNA, 0, Route109_SeashoreHouse_Text_19B8E5, Route109_SeashoreHouse_Text_19B949, Route109_SeashoreHouse_EventScript_160F09
	msgbox Route109_SeashoreHouse_Text_19B955, 6
	end

Route109_SeashoreHouse_EventScript_160EEE:: @ 8160EEE
	trainerbattle 2, TRAINER_SIMON, 0, Route109_SeashoreHouse_Text_19B988, Route109_SeashoreHouse_Text_19B9C7, Route109_SeashoreHouse_EventScript_160F09
	msgbox Route109_SeashoreHouse_Text_19B9E5, 6
	end

Route109_SeashoreHouse_EventScript_160F09:: @ 8160F09
	goto_if_trainer_not_defeated TRAINER_DWAYNE, Route109_SeashoreHouse_EventScript_160F29
	goto_if_trainer_not_defeated TRAINER_JOHANNA, Route109_SeashoreHouse_EventScript_160F29
	goto_if_trainer_not_defeated TRAINER_SIMON, Route109_SeashoreHouse_EventScript_160F29
	setflag FLAG_DEFEATED_SEASHORE_HOUSE_TRAINERS
	release
	end

Route109_SeashoreHouse_EventScript_160F29:: @ 8160F29
	release
	end
