Underwater_SealedChamber_MapScripts:: @ 815F080
	map_script 6, Underwater_SealedChamber_MapScript1_15F086
	.byte 0

Underwater_SealedChamber_MapScript1_15F086:: @ 815F086
	getplayerxy 0x8004, 0x8005
	compare 0x8004, 12
	goto_if 5, Underwater_SealedChamber_EventScript_15F0A6
	compare 0x8005, 44
	goto_if 5, Underwater_SealedChamber_EventScript_15F0A6
	goto Underwater_SealedChamber_EventScript_15F0AF

Underwater_SealedChamber_EventScript_15F0A6:: @ 815F0A6
	warp4 Route134, 255, 60, 31
	end

Underwater_SealedChamber_EventScript_15F0AF:: @ 815F0AF
	warp4 SealedChamber_OuterRoom, 255, 10, 19
	end

Underwater_SealedChamber_EventScript_15F0B8:: @ 815F0B8
	lockall
	braillemsg Underwater_SealedChamber_Braille_1C533D
	waitbutton
	hidebox 0, 0, 29, 19
	releaseall
	end
