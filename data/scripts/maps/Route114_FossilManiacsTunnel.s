Route114_FossilManiacsTunnel_MapScripts:: @ 815C20E
	.byte 0

Route114_FossilManiacsTunnel_EventScript_15C20F:: @ 815C20F
	lock
	faceplayer
	checkflag 267
	jumpif FLAG_IS_SET, Route114_FossilManiacsTunnel_EventScript_15C24E
	checkitem ITEM_ROOT_FOSSIL, 1
	compare RESULT, 1
	jumpif EQUAL, Route114_FossilManiacsTunnel_EventScript_15C244
	checkitem ITEM_CLAW_FOSSIL, 1
	compare RESULT, 1
	jumpif EQUAL, Route114_FossilManiacsTunnel_EventScript_15C244
	msgbox Route114_FossilManiacsTunnel_Text_192795, 4
	release
	end

Route114_FossilManiacsTunnel_EventScript_15C244:: @ 815C244
	msgbox Route114_FossilManiacsTunnel_Text_1928DE, 4
	release
	end

Route114_FossilManiacsTunnel_EventScript_15C24E:: @ 815C24E
	msgbox Route114_FossilManiacsTunnel_Text_1929DC, 4
	release
	end
