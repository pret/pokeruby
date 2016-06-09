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
	loadptr 0, SlateportCity_SternsShipyard_1F_Text_17C14B
	callstd 4
	move 1, SlateportCity_SternsShipyard_1F_Movement_1A0839
	waitmove 0
	loadptr 0, SlateportCity_SternsShipyard_1F_Text_17C1EC
	callstd 4
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
	loadptr 0, SlateportCity_SternsShipyard_1F_Text_17C472
	callstd 4
	releaseall
	end

SlateportCity_SternsShipyard_1F_EventScript_15539C:: @ 815539C
	move 1, SlateportCity_SternsShipyard_1F_Movement_1A0839
	waitmove 0
	loadptr 0, SlateportCity_SternsShipyard_1F_Text_17C3F7
	callstd 4
	releaseall
	end

SlateportCity_SternsShipyard_1F_EventScript_1553B0:: @ 81553B0
	move 1, SlateportCity_SternsShipyard_1F_Movement_1A0839
	waitmove 0
	loadptr 0, SlateportCity_SternsShipyard_1F_Text_17C2F2
	callstd 4
	closebutton
	move 1, SlateportCity_SternsShipyard_1F_Movement_1A083D
	waitmove 0
	releaseall
	end

SlateportCity_SternsShipyard_1F_EventScript_1553CF:: @ 81553CF
	move 1, SlateportCity_SternsShipyard_1F_Movement_1A0839
	waitmove 0
	loadptr 0, SlateportCity_SternsShipyard_1F_Text_17C360
	callstd 4
	releaseall
	end

SlateportCity_SternsShipyard_1F_EventScript_1553E3:: @ 81553E3
	loadptr 0, SlateportCity_SternsShipyard_1F_Text_17C6BB
	callstd 2
	end

SlateportCity_SternsShipyard_1F_EventScript_1553EC:: @ 81553EC
	loadptr 0, SlateportCity_SternsShipyard_1F_Text_17C764
	callstd 2
	end

SlateportCity_SternsShipyard_1F_EventScript_1553F5:: @ 81553F5
	loadptr 0, SlateportCity_SternsShipyard_1F_Text_17C53D
	callstd 2
	end

