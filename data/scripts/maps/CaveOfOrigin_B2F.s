CaveOfOrigin_B2F_MapScripts:: @ 815DD8C
	map_script 3, CaveOfOrigin_B2F_MapScript1_15DD92
	.byte 0

CaveOfOrigin_B2F_MapScript1_15DD92:: @ 815DD92
	checkflag 113
	callif FLAG_IS_SET, CaveOfOrigin_B2F_EventScript_1A04E3
	end
