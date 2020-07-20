CaveOfOrigin_1F_MapScripts:: @ 815DD6C
	map_script MAP_SCRIPT_ON_TRANSITION, CaveOfOrigin_1F_MapScript1_15DD72
	.byte 0

CaveOfOrigin_1F_MapScript1_15DD72:: @ 815DD72
	call_if_set FLAG_LEGENDARY_BATTLE_COMPLETED, CaveOfOrigin_EventScript_DisableTriggers
	end
