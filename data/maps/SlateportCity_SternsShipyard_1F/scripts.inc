SlateportCity_SternsShipyard_1F_MapScripts:: @ 8155335
	.byte 0

SlateportCity_SternsShipyard_1F_EventScript_155336:: @ 8155336
	lockall
	goto_if_set FLAG_SYS_GAME_CLEAR, SlateportCity_SternsShipyard_1F_EventScript_155388
	goto_if_set FLAG_BADGE07_GET, SlateportCity_SternsShipyard_1F_EventScript_15539C
	goto_if_set FLAG_DELIVERED_DEVON_GOODS, SlateportCity_SternsShipyard_1F_EventScript_1553CF
	goto_if_set FLAG_DOCK_REJECTED_DEVON_GOODS, SlateportCity_SternsShipyard_1F_EventScript_1553B0
	msgbox SlateportCity_SternsShipyard_1F_Text_17C14B, MSGBOX_DEFAULT
	applymovement 1, Common_Movement_FacePlayer
	waitmovement 0
	msgbox SlateportCity_SternsShipyard_1F_Text_17C1EC, MSGBOX_DEFAULT
	closemessage
	applymovement 1, Common_Movement_FaceOriginalDirection
	waitmovement 0
	setflag FLAG_DOCK_REJECTED_DEVON_GOODS
	setflag FLAG_HIDE_EVIL_TEAM_SLATEPORT
	releaseall
	end

SlateportCity_SternsShipyard_1F_EventScript_155388:: @ 8155388
	applymovement 1, Common_Movement_FacePlayer
	waitmovement 0
	msgbox SlateportCity_SternsShipyard_1F_Text_17C472, MSGBOX_DEFAULT
	releaseall
	end

SlateportCity_SternsShipyard_1F_EventScript_15539C:: @ 815539C
	applymovement 1, Common_Movement_FacePlayer
	waitmovement 0
	msgbox SlateportCity_SternsShipyard_1F_Text_17C3F7, MSGBOX_DEFAULT
	releaseall
	end

SlateportCity_SternsShipyard_1F_EventScript_1553B0:: @ 81553B0
	applymovement 1, Common_Movement_FacePlayer
	waitmovement 0
	msgbox SlateportCity_SternsShipyard_1F_Text_17C2F2, MSGBOX_DEFAULT
	closemessage
	applymovement 1, Common_Movement_FaceOriginalDirection
	waitmovement 0
	releaseall
	end

SlateportCity_SternsShipyard_1F_EventScript_1553CF:: @ 81553CF
	applymovement 1, Common_Movement_FacePlayer
	waitmovement 0
	msgbox SlateportCity_SternsShipyard_1F_Text_17C360, MSGBOX_DEFAULT
	releaseall
	end

SlateportCity_SternsShipyard_1F_EventScript_1553E3:: @ 81553E3
	msgbox SlateportCity_SternsShipyard_1F_Text_17C6BB, MSGBOX_NPC
	end

SlateportCity_SternsShipyard_1F_EventScript_1553EC:: @ 81553EC
	msgbox SlateportCity_SternsShipyard_1F_Text_17C764, MSGBOX_NPC
	end

SlateportCity_SternsShipyard_1F_EventScript_1553F5:: @ 81553F5
	msgbox SlateportCity_SternsShipyard_1F_Text_17C53D, MSGBOX_NPC
	end
