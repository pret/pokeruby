LilycoveCity_CoveLilyMotel_1F_MapScripts:: @ 81582C4
	.byte 0

LilycoveCity_CoveLilyMotel_1F_EventScript_1582C5:: @ 81582C5
	lockall
	goto_if_set FLAG_SYS_GAME_CLEAR, LilycoveCity_CoveLilyMotel_1F_EventScript_158326
	goto_if_set FLAG_BADGE07_GET, LilycoveCity_CoveLilyMotel_1F_EventScript_1582FF
	msgbox LilycoveCity_CoveLilyMotel_1F_Text_186B71, 4
	applymovement 1, LilycoveCity_CoveLilyMotel_1F_Movement_1A0839
	waitmovement 0
	msgbox LilycoveCity_CoveLilyMotel_1F_Text_186C2B, 4
	closemessage
	applymovement 1, LilycoveCity_CoveLilyMotel_1F_Movement_1A083D
	waitmovement 0
	releaseall
	end

LilycoveCity_CoveLilyMotel_1F_EventScript_1582FF:: @ 81582FF
	msgbox LilycoveCity_CoveLilyMotel_1F_Text_186CCE, 4
	applymovement 1, LilycoveCity_CoveLilyMotel_1F_Movement_1A0839
	waitmovement 0
	msgbox LilycoveCity_CoveLilyMotel_1F_Text_186D7F, 4
	closemessage
	applymovement 1, LilycoveCity_CoveLilyMotel_1F_Movement_1A083D
	waitmovement 0
	releaseall
	end

LilycoveCity_CoveLilyMotel_1F_EventScript_158326:: @ 8158326
	msgbox LilycoveCity_CoveLilyMotel_1F_Text_186E57, 4
	applymovement 1, LilycoveCity_CoveLilyMotel_1F_Movement_1A0839
	waitmovement 0
	msgbox LilycoveCity_CoveLilyMotel_1F_Text_186F09, 4
	closemessage
	applymovement 1, LilycoveCity_CoveLilyMotel_1F_Movement_1A083D
	waitmovement 0
	releaseall
	end

LilycoveCity_CoveLilyMotel_1F_EventScript_15834D:: @ 815834D
	lockall
	playse SE_PIN
	applymovement 1, LilycoveCity_CoveLilyMotel_1F_Movement_1A0833
	waitmovement 0
	applymovement 1, LilycoveCity_CoveLilyMotel_1F_Movement_1A0835
	waitmovement 0
	applymovement 255, LilycoveCity_CoveLilyMotel_1F_Movement_1A0845
	waitmovement 0
	msgbox LilycoveCity_CoveLilyMotel_1F_Text_186CA6, 4
	closemessage
	applymovement 255, LilycoveCity_CoveLilyMotel_1F_Movement_158395
	applymovement 1, LilycoveCity_CoveLilyMotel_1F_Movement_15839A
	waitmovement 0
	applymovement 1, LilycoveCity_CoveLilyMotel_1F_Movement_15839C
	waitmovement 0
	release
	end

LilycoveCity_CoveLilyMotel_1F_Movement_158395:: @ 8158395
	face_right
	lock_facing_direction
	walk_left
	unlock_facing_direction
	end_movement

LilycoveCity_CoveLilyMotel_1F_Movement_15839A:: @ 815839A
	walk_up
	end_movement

LilycoveCity_CoveLilyMotel_1F_Movement_15839C:: @ 815839C
	face_down
	walk_down
	face_up
	end_movement
