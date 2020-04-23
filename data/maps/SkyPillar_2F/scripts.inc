SkyPillar_2F_MapScripts:: @ 815F2C9
	map_script MAP_SCRIPT_ON_FRAME_TABLE, SkyPillar_2F_MapScript2_1C6BB5
	map_script MAP_SCRIPT_ON_TRANSITION, SkyPillar_2F_MapScript1_1C6BBF
	map_script MAP_SCRIPT_ON_RESUME, SkyPillar_2F_MapScript1_15F2D9
	.byte 0

SkyPillar_2F_MapScript1_15F2D9:: @ 815F2D9
	setstepcallback 7
	setholewarp MAP_SKY_PILLAR_1F, 255, 0, 0
	end
