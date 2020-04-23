MtPyre_6F_MapScripts:: @ 815D447
	.byte 0

MtPyre_6F_EventScript_15D448:: @ 815D448
	trainerbattle_single TRAINER_VALERIE_1, MtPyre_6F_Text_1969FE, MtPyre_6F_Text_196A30
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if_eq MtPyre_6F_EventScript_15D46F
	msgbox MtPyre_6F_Text_196A4C, MSGBOX_AUTOCLOSE
	end

MtPyre_6F_EventScript_15D46F:: @ 815D46F
	trainerbattle_rematch TRAINER_VALERIE_1, MtPyre_6F_Text_196A95, MtPyre_6F_Text_196AB1
	msgbox MtPyre_6F_Text_196AC9, MSGBOX_AUTOCLOSE
	end
