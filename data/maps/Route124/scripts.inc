Route124_MapScripts:: @ 8151DDF
	map_script 3, Route124_MapScript1_151DE5
	.byte 0

Route124_MapScript1_151DE5:: @ 8151DE5
	call_if_set FLAG_SYS_WEATHER_CTRL, Route124_EventScript_1A02C1
	end

Route124_EventScript_151DEF:: @ 8151DEF
	msgbox Route124_Text_171ED1, 3
	end

Route124_EventScript_151DF8:: @ 8151DF8
	trainerbattle 0, TRAINER_SPENCER, 0, Route124_Text_1C0624, Route124_Text_1C0675
	msgbox Route124_Text_1C0693, 6
	end

Route124_EventScript_151E0F:: @ 8151E0F
	trainerbattle 0, TRAINER_ROLAND, 0, Route124_Text_1C06F7, Route124_Text_1C0741
	msgbox Route124_Text_1C0750, 6
	end

Route124_EventScript_151E26:: @ 8151E26
	trainerbattle 0, TRAINER_JENNY_1, 0, Route124_Text_1C07B4, Route124_Text_1C07F9
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route124_EventScript_151E4D
	msgbox Route124_Text_1C080E, 6
	end

Route124_EventScript_151E4D:: @ 8151E4D
	trainerbattle 5, TRAINER_JENNY_1, 0, Route124_Text_1C0888, Route124_Text_1C08C8
	msgbox Route124_Text_1C08EA, 6
	end

Route124_EventScript_151E64:: @ 8151E64
	trainerbattle 0, TRAINER_GRACE, 0, Route124_Text_1C0936, Route124_Text_1C096B
	msgbox Route124_Text_1C0994, 6
	end

Route124_EventScript_151E7B:: @ 8151E7B
	trainerbattle 0, TRAINER_CHAD, 0, Route124_Text_1C09CE, Route124_Text_1C0A2F
	msgbox Route124_Text_1C0A52, 6
	end

Route124_EventScript_151E92:: @ 8151E92
	trainerbattle 4, TRAINER_RITA_AND_SAM_1, 0, Route124_Text_1C0ABD, Route124_Text_1C0B36, Route124_Text_1C0BC8
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route124_EventScript_151EBD
	msgbox Route124_Text_1C0B72, 6
	end

Route124_EventScript_151EBD:: @ 8151EBD
	trainerbattle 7, TRAINER_RITA_AND_SAM_1, 0, Route124_Text_1C0D1F, Route124_Text_1C0DB5, Route124_Text_1C0E5C
	msgbox Route124_Text_1C0E06, 6
	end

Route124_EventScript_151ED8:: @ 8151ED8
	trainerbattle 4, TRAINER_RITA_AND_SAM_1, 0, Route124_Text_1C0C0E, Route124_Text_1C0C4F, Route124_Text_1C0CE0
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route124_EventScript_151F03
	msgbox Route124_Text_1C0C7F, 6
	end

Route124_EventScript_151F03:: @ 8151F03
	trainerbattle 7, TRAINER_RITA_AND_SAM_1, 0, Route124_Text_1C0EA2, Route124_Text_1C0EE5, Route124_Text_1C0F90
	msgbox Route124_Text_1C0F19, 6
	end
