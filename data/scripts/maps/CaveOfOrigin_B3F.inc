CaveOfOrigin_B3F_MapScripts:: @ 815DD9C
	map_script 3, CaveOfOrigin_B3F_MapScript1_15DDA2
	.byte 0

CaveOfOrigin_B3F_MapScript1_15DDA2:: @ 815DDA2
	call_if_set FLAG_LEGENDARY_BATTLE_COMPLETED, CaveOfOrigin_B3F_EventScript_1A04E3
	end
