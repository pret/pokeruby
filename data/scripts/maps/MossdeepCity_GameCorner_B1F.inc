MossdeepCity_GameCorner_B1F_MapScripts:: @ 815AE55
	map_script 3, MossdeepCity_GameCorner_B1F_MapScript1_15AE60
	map_script 2, MossdeepCity_GameCorner_B1F_MapScript2_15AE64
	.byte 0

MossdeepCity_GameCorner_B1F_MapScript1_15AE60:: @ 815AE60
	special SetEReaderTrainerGfxId
	end

MossdeepCity_GameCorner_B1F_MapScript2_15AE64:: @ 815AE64
	map_script_2 0x4001, 0, MossdeepCity_GameCorner_B1F_EventScript_15AE6E
	.2byte 0

MossdeepCity_GameCorner_B1F_EventScript_15AE6E:: @ 815AE6E
	lockall
	applymovement 255, MossdeepCity_GameCorner_B1F_Movement_15AEF9
	waitmovement 0
	special PrintEReaderTrainerGreeting
	msgbox 0x20234cc, 4
	closemessage
	setvar 0x8004, 2
	setvar 0x8005, 0
	special sub_813556C
	waitstate
	compare RESULT, 3
	call_if 1, MossdeepCity_GameCorner_B1F_EventScript_15AED5
	compare RESULT, 1
	call_if 1, MossdeepCity_GameCorner_B1F_EventScript_15AEE3
	compare RESULT, 2
	call_if 1, MossdeepCity_GameCorner_B1F_EventScript_15AEEE
	closemessage
	special ScrSpecial_HealPlayerParty
	applymovement 255, MossdeepCity_GameCorner_B1F_Movement_15AEFF
	waitmovement 0
	special LoadPlayerParty
	setvar 0x4001, 1
	warp MossdeepCity_GameCorner_1F, 255, 3, 1
	waitstate
	releaseall
	end

MossdeepCity_GameCorner_B1F_EventScript_15AED5:: @ 815AED5
	setvar 0x40c0, 3
	msgbox MossdeepCity_GameCorner_B1F_Text_18E796, 4
	return

MossdeepCity_GameCorner_B1F_EventScript_15AEE3:: @ 815AEE3
	setvar 0x40c0, 1
	special ShowFieldMessageStringVar4
	waitmessage
	waitbutton
	return

MossdeepCity_GameCorner_B1F_EventScript_15AEEE:: @ 815AEEE
	setvar 0x40c0, 2
	special ShowFieldMessageStringVar4
	waitmessage
	waitbutton
	return

MossdeepCity_GameCorner_B1F_Movement_15AEF9:: @ 815AEF9
	step_down
	step_down
	step_down
	step_right
	step_right
	step_end

MossdeepCity_GameCorner_B1F_Movement_15AEFF:: @ 815AEFF
	step_left
	step_left
	step_up
	step_up
	step_up
	step_up
	step_13
	step_end
