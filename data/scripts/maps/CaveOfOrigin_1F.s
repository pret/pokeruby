CaveOfOrigin_1F_MapScripts:: @ 815DD6C
	map_script 3, CaveOfOrigin_1F_MapScript1_15DD72
	.byte 0

CaveOfOrigin_1F_MapScript1_15DD72:: @ 815DD72
	checkflag 113
	callif FLAG_IS_SET, CaveOfOrigin_1F_EventScript_1A04E3
	end
