Route114_FossilManiacsTunnel_MapScripts:: @ 815C20E
	.byte 0

Route114_FossilManiacsTunnel_EventScript_15C20F:: @ 815C20F
	lock
	faceplayer
	checkflag 267
	jumpeq Route114_FossilManiacsTunnel_EventScript_15C24E
	checkitem ITEM_ROOT_FOSSIL, 1
	compare RESULT, 1
	jumpeq Route114_FossilManiacsTunnel_EventScript_15C244
	checkitem ITEM_CLAW_FOSSIL, 1
	compare RESULT, 1
	jumpeq Route114_FossilManiacsTunnel_EventScript_15C244
	loadptr 0, Route114_FossilManiacsTunnel_Text_192795
	callstd 4
	release
	end

Route114_FossilManiacsTunnel_EventScript_15C244:: @ 815C244
	loadptr 0, Route114_FossilManiacsTunnel_Text_1928DE
	callstd 4
	release
	end

Route114_FossilManiacsTunnel_EventScript_15C24E:: @ 815C24E
	loadptr 0, Route114_FossilManiacsTunnel_Text_1929DC
	callstd 4
	release
	end

