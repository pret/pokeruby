SlateportCity_SternsShipyard_1F_MapScripts:: @ 8155335
	.byte 0

SlateportCity_SternsShipyard_1F_EventScript_155336:: @ 8155336
	lockall
	checkflag 2052
	jumpeq SlateportCity_SternsShipyard_1F_EventScript_155388
	checkflag 2061
	jumpeq SlateportCity_SternsShipyard_1F_EventScript_15539C
	checkflag 149
	jumpeq SlateportCity_SternsShipyard_1F_EventScript_1553CF
	checkflag 148
	jumpeq SlateportCity_SternsShipyard_1F_EventScript_1553B0
	msgbox SlateportCity_SternsShipyard_1F_Text_17C14B, 4
	move 1, SlateportCity_SternsShipyard_1F_Movement_1A0839
	waitmove 0
	msgbox SlateportCity_SternsShipyard_1F_Text_17C1EC, 4
	closebutton
	move 1, SlateportCity_SternsShipyard_1F_Movement_1A083D
	waitmove 0
	setflag 148
	setflag 882
	releaseall
	end

SlateportCity_SternsShipyard_1F_EventScript_155388:: @ 8155388
	move 1, SlateportCity_SternsShipyard_1F_Movement_1A0839
	waitmove 0
	msgbox SlateportCity_SternsShipyard_1F_Text_17C472, 4
	releaseall
	end

SlateportCity_SternsShipyard_1F_EventScript_15539C:: @ 815539C
	move 1, SlateportCity_SternsShipyard_1F_Movement_1A0839
	waitmove 0
	msgbox SlateportCity_SternsShipyard_1F_Text_17C3F7, 4
	releaseall
	end

SlateportCity_SternsShipyard_1F_EventScript_1553B0:: @ 81553B0
	move 1, SlateportCity_SternsShipyard_1F_Movement_1A0839
	waitmove 0
	msgbox SlateportCity_SternsShipyard_1F_Text_17C2F2, 4
	closebutton
	move 1, SlateportCity_SternsShipyard_1F_Movement_1A083D
	waitmove 0
	releaseall
	end

SlateportCity_SternsShipyard_1F_EventScript_1553CF:: @ 81553CF
	move 1, SlateportCity_SternsShipyard_1F_Movement_1A0839
	waitmove 0
	msgbox SlateportCity_SternsShipyard_1F_Text_17C360, 4
	releaseall
	end

SlateportCity_SternsShipyard_1F_EventScript_1553E3:: @ 81553E3
	msgbox SlateportCity_SternsShipyard_1F_Text_17C6BB, 2
	end

SlateportCity_SternsShipyard_1F_EventScript_1553EC:: @ 81553EC
	msgbox SlateportCity_SternsShipyard_1F_Text_17C764, 2
	end

SlateportCity_SternsShipyard_1F_EventScript_1553F5:: @ 81553F5
	msgbox SlateportCity_SternsShipyard_1F_Text_17C53D, 2
	end
