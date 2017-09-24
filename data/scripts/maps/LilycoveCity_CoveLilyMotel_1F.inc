LilycoveCity_CoveLilyMotel_1F_MapScripts:: @ 81582C4
	.byte 0

LilycoveCity_CoveLilyMotel_1F_EventScript_1582C5:: @ 81582C5
	lockall
	checkflag 2052
	goto_if_eq LilycoveCity_CoveLilyMotel_1F_EventScript_158326
	checkflag 2061
	goto_if_eq LilycoveCity_CoveLilyMotel_1F_EventScript_1582FF
	msgbox LilycoveCity_CoveLilyMotel_1F_Text_186B71, 4
	applymovement 1, LilycoveCity_CoveLilyMotel_1F_Movement_1A0839
	waitmovement 0
	msgbox LilycoveCity_CoveLilyMotel_1F_Text_186C2B, 4
	closebutton
	applymovement 1, LilycoveCity_CoveLilyMotel_1F_Movement_1A083D
	waitmovement 0
	releaseall
	end

LilycoveCity_CoveLilyMotel_1F_EventScript_1582FF:: @ 81582FF
	msgbox LilycoveCity_CoveLilyMotel_1F_Text_186CCE, 4
	applymovement 1, LilycoveCity_CoveLilyMotel_1F_Movement_1A0839
	waitmovement 0
	msgbox LilycoveCity_CoveLilyMotel_1F_Text_186D7F, 4
	closebutton
	applymovement 1, LilycoveCity_CoveLilyMotel_1F_Movement_1A083D
	waitmovement 0
	releaseall
	end

LilycoveCity_CoveLilyMotel_1F_EventScript_158326:: @ 8158326
	msgbox LilycoveCity_CoveLilyMotel_1F_Text_186E57, 4
	applymovement 1, LilycoveCity_CoveLilyMotel_1F_Movement_1A0839
	waitmovement 0
	msgbox LilycoveCity_CoveLilyMotel_1F_Text_186F09, 4
	closebutton
	applymovement 1, LilycoveCity_CoveLilyMotel_1F_Movement_1A083D
	waitmovement 0
	releaseall
	end

LilycoveCity_CoveLilyMotel_1F_EventScript_15834D:: @ 815834D
	lockall
	playse 21
	applymovement 1, LilycoveCity_CoveLilyMotel_1F_Movement_1A0833
	waitmovement 0
	applymovement 1, LilycoveCity_CoveLilyMotel_1F_Movement_1A0835
	waitmovement 0
	applymovement 255, LilycoveCity_CoveLilyMotel_1F_Movement_1A0845
	waitmovement 0
	msgbox LilycoveCity_CoveLilyMotel_1F_Text_186CA6, 4
	closebutton
	applymovement 255, LilycoveCity_CoveLilyMotel_1F_Movement_158395
	applymovement 1, LilycoveCity_CoveLilyMotel_1F_Movement_15839A
	waitmovement 0
	applymovement 1, LilycoveCity_CoveLilyMotel_1F_Movement_15839C
	waitmovement 0
	release
	end

LilycoveCity_CoveLilyMotel_1F_Movement_158395:: @ 8158395
	step_03
	step_40
	step_left
	step_41
	step_end

LilycoveCity_CoveLilyMotel_1F_Movement_15839A:: @ 815839A
	step_up
	step_end

LilycoveCity_CoveLilyMotel_1F_Movement_15839C:: @ 815839C
	step_00
	step_down
	step_01
	step_end
