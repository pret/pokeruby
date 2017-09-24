FortreeCity_House1_MapScripts:: @ 8157E12
	.byte 0

FortreeCity_House1_EventScript_157E13:: @ 8157E13
	lock
	faceplayer
	checkflag 155
	goto_if_eq FortreeCity_House1_EventScript_157EAD
	setvar 0x8008, 1
	copyvar 0x8004, 0x8008
	specialval RESULT, sub_804D89C
	copyvar 0x8009, RESULT
	msgbox FortreeCity_House1_Text_18568C, 5
	compare_var_to_imm RESULT, 0
	goto_if_eq FortreeCity_House1_EventScript_157E95
	special sub_80F9A0C
	waitstate
	copyvar 0x800a, 0x8004
	compare_var_to_imm 0x8004, 255
	goto_if_eq FortreeCity_House1_EventScript_157E95
	copyvar 0x8005, 0x800a
	specialval RESULT, sub_804DB2C
	copyvar 0x800b, RESULT
	compare_var_to_var RESULT, 0x8009
	goto_if 5, FortreeCity_House1_EventScript_157E9F
	copyvar 0x8004, 0x8008
	copyvar 0x8005, 0x800a
	special sub_804DB68
	special sub_804E174
	waitstate
	bufferpoke 0, 0x8009
	msgbox FortreeCity_House1_Text_1856F7, 4
	setflag 155
	release
	end

FortreeCity_House1_EventScript_157E95:: @ 8157E95
	msgbox FortreeCity_House1_Text_18577F, 4
	release
	end

FortreeCity_House1_EventScript_157E9F:: @ 8157E9F
	bufferpoke 0, 0x8009
	msgbox FortreeCity_House1_Text_185737, 4
	release
	end

FortreeCity_House1_EventScript_157EAD:: @ 8157EAD
	msgbox FortreeCity_House1_Text_1857C7, 4
	release
	end

FortreeCity_House1_EventScript_157EB7:: @ 8157EB7
	msgbox FortreeCity_House1_Text_18582A, 2
	end

FortreeCity_House1_EventScript_157EC0:: @ 8157EC0
	lock
	faceplayer
	checksound
	pokecry SPECIES_ZIGZAGOON, 0
	msgbox FortreeCity_House1_Text_185888, 4
	waitpokecry
	release
	end
