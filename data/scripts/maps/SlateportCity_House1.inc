SlateportCity_House1_MapScripts:: @ 815567A
	.byte 0

SlateportCity_House1_EventScript_15567B:: @ 815567B
	lock
	faceplayer
	msgbox SlateportCity_House1_Text_17D46A, 5
	compare_var_to_imm RESULT, 1
	goto_if_eq SlateportCity_House1_EventScript_15569C
	compare_var_to_imm RESULT, 0
	goto_if_eq SlateportCity_House1_EventScript_1556BF
	end

SlateportCity_House1_EventScript_15569C:: @ 815569C
	msgbox SlateportCity_House1_Text_17D4DB, 4
	special sub_80F9A0C
	waitstate
	compare_var_to_imm 0x8004, 255
	goto_if 5, SlateportCity_House1_EventScript_1556C9
	compare_var_to_imm 0x8004, 255
	goto_if_eq SlateportCity_House1_EventScript_1556BF
	end

SlateportCity_House1_EventScript_1556BF:: @ 81556BF
	msgbox SlateportCity_House1_Text_17D61E, 4
	release
	end

SlateportCity_House1_EventScript_1556C9:: @ 81556C9
	specialval RESULT, ScriptGetPartyMonSpecies
	compare_var_to_imm RESULT, SPECIES_EGG
	goto_if_eq SlateportCity_House1_EventScript_15571C
	special sub_80BFAE0
	special sub_80BFB10
	compare_var_to_imm RESULT, 1
	goto_if_eq SlateportCity_House1_EventScript_155726
	specialval RESULT, sub_810F96C
	special sub_80BFAE0
	compare_var_to_imm RESULT, 1
	goto_if_eq SlateportCity_House1_EventScript_155726
	msgbox SlateportCity_House1_Text_17D505, 5
	compare_var_to_imm RESULT, 1
	goto_if_eq SlateportCity_House1_EventScript_155730
	compare_var_to_imm RESULT, 0
	goto_if_eq SlateportCity_House1_EventScript_1556BF
	end

SlateportCity_House1_EventScript_15571C:: @ 815571C
	msgbox SlateportCity_House1_Text_17D752, 4
	release
	end

SlateportCity_House1_EventScript_155726:: @ 8155726
	msgbox SlateportCity_House1_Text_17D6CC, 4
	release
	end

SlateportCity_House1_EventScript_155730:: @ 8155730
	msgbox SlateportCity_House1_Text_17D580, 4
	call SlateportCity_House1_EventScript_1A0678
	specialval RESULT, sub_80BF9B4
	special sub_80BFAE0
	compare_var_to_imm RESULT, 1
	goto_if_eq SlateportCity_House1_EventScript_15575A
	msgbox SlateportCity_House1_Text_17D63A, 4
	release
	end

SlateportCity_House1_EventScript_15575A:: @ 815575A
	msgbox SlateportCity_House1_Text_17D5B0, 4
	release
	end
