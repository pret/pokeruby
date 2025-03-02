LilycoveCity_CoveLilyMotel_1F_MapScripts:: @ 81582C4
	.byte 0

LilycoveCity_CoveLilyMotel_1F_EventScript_1582C5:: @ 81582C5
	lockall
	goto_if_set FLAG_SYS_GAME_CLEAR, LilycoveCity_CoveLilyMotel_1F_EventScript_158326
	goto_if_set FLAG_BADGE07_GET, LilycoveCity_CoveLilyMotel_1F_EventScript_1582FF
	msgbox LilycoveCity_CoveLilyMotel_1F_Text_186B71, MSGBOX_DEFAULT
	applymovement 1, Common_Movement_FacePlayer
	waitmovement 0
	msgbox LilycoveCity_CoveLilyMotel_1F_Text_186C2B, MSGBOX_DEFAULT
	closemessage
	applymovement 1, Common_Movement_FaceOriginalDirection
	waitmovement 0
	releaseall
	end

LilycoveCity_CoveLilyMotel_1F_EventScript_1582FF:: @ 81582FF
	msgbox LilycoveCity_CoveLilyMotel_1F_Text_186CCE, MSGBOX_DEFAULT
	applymovement 1, Common_Movement_FacePlayer
	waitmovement 0
	msgbox LilycoveCity_CoveLilyMotel_1F_Text_186D7F, MSGBOX_DEFAULT
	closemessage
	applymovement 1, Common_Movement_FaceOriginalDirection
	waitmovement 0
	releaseall
	end

LilycoveCity_CoveLilyMotel_1F_EventScript_158326:: @ 8158326
	msgbox LilycoveCity_CoveLilyMotel_1F_Text_186E57, MSGBOX_DEFAULT
	applymovement 1, Common_Movement_FacePlayer
	waitmovement 0
	msgbox LilycoveCity_CoveLilyMotel_1F_Text_186F09, MSGBOX_DEFAULT
	closemessage
	applymovement 1, Common_Movement_FaceOriginalDirection
	waitmovement 0
	releaseall
	end

LilycoveCity_CoveLilyMotel_1F_EventScript_15834D:: @ 815834D
	lockall
	playse SE_PIN
	applymovement 1, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 1, Common_Movement_Delay48
	waitmovement 0
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	msgbox LilycoveCity_CoveLilyMotel_1F_Text_186CA6, MSGBOX_DEFAULT
	closemessage
	applymovement LOCALID_PLAYER, LilycoveCity_CoveLilyMotel_1F_Movement_158395
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
	step_end

LilycoveCity_CoveLilyMotel_1F_Movement_15839A:: @ 815839A
	walk_up
	step_end

LilycoveCity_CoveLilyMotel_1F_Movement_15839C:: @ 815839C
	face_down
	walk_down
	face_up
	step_end
