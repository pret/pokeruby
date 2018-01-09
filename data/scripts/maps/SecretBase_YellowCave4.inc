SecretBase_YellowCave4_MapScripts:: @ 815F337
	map_script 4, SecretBase_RedCave1_MapScript2_15F358
	map_script 3, SecretBase_RedCave1_MapScript1_15F34F
	map_script 2, SecretBase_RedCave1_MapScript2_15F362
	map_script 5, SecretBase_RedCave1_MapScript1_15F34C
	.byte 0

SecretBase_RedCave1_MapScript1_15F34C:: @ 815F34C
	setstepcallback 6
	end

SecretBase_RedCave1_MapScript1_15F34F:: @ 815F34F
	call SecretBase_RedCave1_EventScript_1A2F3D
	special sub_80BBFA4
	end

SecretBase_RedCave1_MapScript2_15F358:: @ 815F358
	map_script_2 0x4089, 0, SecretBase_RedCave1_EventScript_1A2F68
	.2byte 0

SecretBase_RedCave1_MapScript2_15F362:: @ 815F362
	map_script_2 VAR_0x4097, 0, SecretBase_RedCave1_EventScript_1A2DDE
	.2byte 0
