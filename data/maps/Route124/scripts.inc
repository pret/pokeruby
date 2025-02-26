Route124_MapScripts:: @ 8151DDF
	map_script MAP_SCRIPT_ON_TRANSITION, Route124_MapScript1_151DE5
	.byte 0

Route124_MapScript1_151DE5:: @ 8151DE5
	call_if_set FLAG_SYS_WEATHER_CTRL, Common_EventScript_SetAbnormalWeather
	end

Route124_EventScript_151DEF:: @ 8151DEF
	msgbox Route124_Text_171ED1, MSGBOX_SIGN
	end

Route124_EventScript_151DF8:: @ 8151DF8
	trainerbattle_single TRAINER_SPENCER, Route124_Text_1C0624, Route124_Text_1C0675
	msgbox Route124_Text_1C0693, MSGBOX_AUTOCLOSE
	end

Route124_EventScript_151E0F:: @ 8151E0F
	trainerbattle_single TRAINER_ROLAND, Route124_Text_1C06F7, Route124_Text_1C0741
	msgbox Route124_Text_1C0750, MSGBOX_AUTOCLOSE
	end

Route124_EventScript_151E26:: @ 8151E26
	trainerbattle_single TRAINER_JENNY_1, Route124_Text_1C07B4, Route124_Text_1C07F9
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if_eq Route124_EventScript_151E4D
	msgbox Route124_Text_1C080E, MSGBOX_AUTOCLOSE
	end

Route124_EventScript_151E4D:: @ 8151E4D
	trainerbattle_rematch TRAINER_JENNY_1, Route124_Text_1C0888, Route124_Text_1C08C8
	msgbox Route124_Text_1C08EA, MSGBOX_AUTOCLOSE
	end

Route124_EventScript_151E64:: @ 8151E64
	trainerbattle_single TRAINER_GRACE, Route124_Text_1C0936, Route124_Text_1C096B
	msgbox Route124_Text_1C0994, MSGBOX_AUTOCLOSE
	end

Route124_EventScript_151E7B:: @ 8151E7B
	trainerbattle_single TRAINER_CHAD, Route124_Text_1C09CE, Route124_Text_1C0A2F
	msgbox Route124_Text_1C0A52, MSGBOX_AUTOCLOSE
	end

Route124_EventScript_151E92:: @ 8151E92
	trainerbattle_double TRAINER_RITA_AND_SAM_1, Route124_Text_1C0ABD, Route124_Text_1C0B36, Route124_Text_1C0BC8
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if_eq Route124_EventScript_151EBD
	msgbox Route124_Text_1C0B72, MSGBOX_AUTOCLOSE
	end

Route124_EventScript_151EBD:: @ 8151EBD
	trainerbattle_rematch_double TRAINER_RITA_AND_SAM_1, Route124_Text_1C0D1F, Route124_Text_1C0DB5, Route124_Text_1C0E5C
	msgbox Route124_Text_1C0E06, MSGBOX_AUTOCLOSE
	end

Route124_EventScript_151ED8:: @ 8151ED8
	trainerbattle_double TRAINER_RITA_AND_SAM_1, Route124_Text_1C0C0E, Route124_Text_1C0C4F, Route124_Text_1C0CE0
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if_eq Route124_EventScript_151F03
	msgbox Route124_Text_1C0C7F, MSGBOX_AUTOCLOSE
	end

Route124_EventScript_151F03:: @ 8151F03
	trainerbattle_rematch_double TRAINER_RITA_AND_SAM_1, Route124_Text_1C0EA2, Route124_Text_1C0EE5, Route124_Text_1C0F90
	msgbox Route124_Text_1C0F19, MSGBOX_AUTOCLOSE
	end
