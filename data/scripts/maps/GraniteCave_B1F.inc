GraniteCave_B1F_MapScripts:: @ 815CBDD
	map_script 2, GraniteCave_B1F_MapScript2_1C6BB5
	map_script 3, GraniteCave_B1F_MapScript1_1C6BBF
	map_script 5, GraniteCave_B1F_MapScript1_15CBED
	.byte 0

GraniteCave_B1F_MapScript1_15CBED:: @ 815CBED
	setstepcallback 7
	setholewarp MAP_GRANITE_CAVE_B2F, 255, 0, 0
	end
