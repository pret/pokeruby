SkyPillar_4F_MapScripts:: @ 815F2E5
	map_script 2, SkyPillar_4F_MapScript2_1C6BB5
	map_script 3, SkyPillar_4F_MapScript1_1C6BBF
	map_script 5, SkyPillar_4F_MapScript1_15F2F5
	.byte 0

SkyPillar_4F_MapScript1_15F2F5:: @ 815F2F5
	setstepcallback 7
	setholewarp MAP_SKY_PILLAR_3F, 255, 0, 0
	end
