AquaHideout_1F_MapScripts:: @ 815D7C2
	map_script 3, AquaHideout_1F_MapScript1_15D7C8
	.byte 0

AquaHideout_1F_MapScript1_15D7C8:: @ 815D7C8
	call AquaHideout_1F_EventScript_1A0196
	end

AquaHideout_1F_EventScript_15D7CE:: @ 815D7CE
MagmaHideout_1F_EventScript_15D7CE:: @ 815D7CE
	lock
	faceplayer
	checkflag 111
	jumpeq AquaHideout_1F_EventScript_15D7E3
	loadptr 0, AquaHideout_1F_Text_196AFD
	callstd 4
	release
	end

AquaHideout_1F_EventScript_15D7E3:: @ 815D7E3
	loadptr 0, AquaHideout_1F_Text_196BC5
	callstd 4
	release
	end

AquaHideout_1F_EventScript_15D7ED:: @ 815D7ED
MagmaHideout_1F_EventScript_15D7ED:: @ 815D7ED
	lock
	faceplayer
	checkflag 111
	jumpeq AquaHideout_1F_EventScript_15D802
	loadptr 0, AquaHideout_1F_Text_196C83
	callstd 4
	release
	end

AquaHideout_1F_EventScript_15D802:: @ 815D802
	loadptr 0, AquaHideout_1F_Text_196D46
	callstd 4
	release
	end

AquaHideout_1F_EventScript_15D80C:: @ 815D80C
MagmaHideout_1F_EventScript_15D80C:: @ 815D80C
	trainerbattle 2, 567, 0, AquaHideout_1F_Text_196E01, AquaHideout_1F_Text_196E28, AquaHideout_1F_EventScript_15D827
	loadptr 0, AquaHideout_1F_Text_196E3D
	callstd 6
	end

AquaHideout_1F_EventScript_15D827:: @ 815D827
	loadptr 0, AquaHideout_1F_Text_196E3D
	callstd 4
	release
	end

