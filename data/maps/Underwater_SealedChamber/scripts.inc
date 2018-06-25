Underwater_SealedChamber_MapScripts:: @ 815F080
	map_script 6, Underwater_SealedChamber_MapScript1_15F086
	.byte 0

Underwater_SealedChamber_MapScript1_15F086:: @ 815F086
	getplayerxy VAR_SPECIAL_4, VAR_SPECIAL_5
	compare VAR_SPECIAL_4, 12
	goto_if_ne Underwater_SealedChamber_EventScript_15F0A6
	compare VAR_SPECIAL_5, 44
	goto_if_ne Underwater_SealedChamber_EventScript_15F0A6
	goto Underwater_SealedChamber_EventScript_15F0AF

Underwater_SealedChamber_EventScript_15F0A6:: @ 815F0A6
	setdivewarp MAP_ROUTE134, 255, 60, 31
	end

Underwater_SealedChamber_EventScript_15F0AF:: @ 815F0AF
	setdivewarp MAP_SEALED_CHAMBER_OUTER_ROOM, 255, 10, 19
	end

Underwater_SealedChamber_EventScript_15F0B8:: @ 815F0B8
	lockall
	braillemessage Underwater_SealedChamber_Braille_1C533D
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end
