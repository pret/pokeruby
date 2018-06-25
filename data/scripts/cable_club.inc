DewfordTown_PokemonCenter_2F_MapScript2_1A3D03:: @ 81A3D03
EverGrandeCity_PokemonCenter_2F_MapScript2_1A3D03:: @ 81A3D03
FallarborTown_PokemonCenter_2F_MapScript2_1A3D03:: @ 81A3D03
FortreeCity_PokemonCenter_2F_MapScript2_1A3D03:: @ 81A3D03
LavaridgeTown_PokemonCenter_2F_MapScript2_1A3D03:: @ 81A3D03
LilycoveCity_PokemonCenter_2F_MapScript2_1A3D03:: @ 81A3D03
MauvilleCity_PokemonCenter_2F_MapScript2_1A3D03:: @ 81A3D03
MossdeepCity_PokemonCenter_2F_MapScript2_1A3D03:: @ 81A3D03
OldaleTown_PokemonCenter_2F_MapScript2_1A3D03:: @ 81A3D03
PacifidlogTown_PokemonCenter_2F_MapScript2_1A3D03:: @ 81A3D03
PetalburgCity_PokemonCenter_2F_MapScript2_1A3D03:: @ 81A3D03
RustboroCity_PokemonCenter_2F_MapScript2_1A3D03:: @ 81A3D03
SlateportCity_PokemonCenter_2F_MapScript2_1A3D03:: @ 81A3D03
SootopolisCity_PokemonCenter_2F_MapScript2_1A3D03:: @ 81A3D03
VerdanturfTown_PokemonCenter_2F_MapScript2_1A3D03:: @ 81A3D03
	map_script_2 VAR_CABLE_CLUB_STATE, 1, OldaleTown_PokemonCenter_2F_EventScript_1A3D2D
	map_script_2 VAR_CABLE_CLUB_STATE, 2, OldaleTown_PokemonCenter_2F_EventScript_1A3D2D
	map_script_2 VAR_CABLE_CLUB_STATE, 5, OldaleTown_PokemonCenter_2F_EventScript_1A3D2D
	map_script_2 VAR_CABLE_CLUB_STATE, 3, OldaleTown_PokemonCenter_2F_EventScript_1A3D2D
	map_script_2 VAR_CABLE_CLUB_STATE, 4, OldaleTown_PokemonCenter_2F_EventScript_1A3D2D
	.2byte 0

OldaleTown_PokemonCenter_2F_EventScript_1A3D2D:: @ 81A3D2D
	turnobject VAR_SPECIAL_7, 4
	end

DewfordTown_PokemonCenter_2F_MapScript1_1A3D32:: @ 81A3D32
EverGrandeCity_PokemonCenter_2F_MapScript1_1A3D32:: @ 81A3D32
FallarborTown_PokemonCenter_2F_MapScript1_1A3D32:: @ 81A3D32
FortreeCity_PokemonCenter_2F_MapScript1_1A3D32:: @ 81A3D32
LavaridgeTown_PokemonCenter_2F_MapScript1_1A3D32:: @ 81A3D32
LilycoveCity_PokemonCenter_2F_MapScript1_1A3D32:: @ 81A3D32
MauvilleCity_PokemonCenter_2F_MapScript1_1A3D32:: @ 81A3D32
MossdeepCity_PokemonCenter_2F_MapScript1_1A3D32:: @ 81A3D32
OldaleTown_PokemonCenter_2F_MapScript1_1A3D32:: @ 81A3D32
PacifidlogTown_PokemonCenter_2F_MapScript1_1A3D32:: @ 81A3D32
PetalburgCity_PokemonCenter_2F_MapScript1_1A3D32:: @ 81A3D32
RustboroCity_PokemonCenter_2F_MapScript1_1A3D32:: @ 81A3D32
SlateportCity_PokemonCenter_2F_MapScript1_1A3D32:: @ 81A3D32
SootopolisCity_PokemonCenter_2F_MapScript1_1A3D32:: @ 81A3D32
VerdanturfTown_PokemonCenter_2F_MapScript1_1A3D32:: @ 81A3D32
	compare VAR_CABLE_CLUB_STATE, 1
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A3D6A
	compare VAR_CABLE_CLUB_STATE, 2
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A3D6A
	compare VAR_CABLE_CLUB_STATE, 5
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A3D6A
	compare VAR_CABLE_CLUB_STATE, 3
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A3D74
	compare VAR_CABLE_CLUB_STATE, 4
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A3D7E
	end

OldaleTown_PokemonCenter_2F_EventScript_1A3D6A:: @ 81A3D6A
	setmetatile 5, 3, 514, 0
	end

OldaleTown_PokemonCenter_2F_EventScript_1A3D74:: @ 81A3D74
	setmetatile 8, 3, 514, 0
	end

OldaleTown_PokemonCenter_2F_EventScript_1A3D7E:: @ 81A3D7E
	setmetatile 11, 3, 514, 0
	end

DewfordTown_PokemonCenter_2F_MapScript2_1A3D88:: @ 81A3D88
EverGrandeCity_PokemonCenter_2F_MapScript2_1A3D88:: @ 81A3D88
FallarborTown_PokemonCenter_2F_MapScript2_1A3D88:: @ 81A3D88
FortreeCity_PokemonCenter_2F_MapScript2_1A3D88:: @ 81A3D88
LavaridgeTown_PokemonCenter_2F_MapScript2_1A3D88:: @ 81A3D88
LilycoveCity_PokemonCenter_2F_MapScript2_1A3D88:: @ 81A3D88
MauvilleCity_PokemonCenter_2F_MapScript2_1A3D88:: @ 81A3D88
MossdeepCity_PokemonCenter_2F_MapScript2_1A3D88:: @ 81A3D88
OldaleTown_PokemonCenter_2F_MapScript2_1A3D88:: @ 81A3D88
PacifidlogTown_PokemonCenter_2F_MapScript2_1A3D88:: @ 81A3D88
PetalburgCity_PokemonCenter_2F_MapScript2_1A3D88:: @ 81A3D88
RustboroCity_PokemonCenter_2F_MapScript2_1A3D88:: @ 81A3D88
SlateportCity_PokemonCenter_2F_MapScript2_1A3D88:: @ 81A3D88
SootopolisCity_PokemonCenter_2F_MapScript2_1A3D88:: @ 81A3D88
VerdanturfTown_PokemonCenter_2F_MapScript2_1A3D88:: @ 81A3D88
	map_script_2 VAR_CABLE_CLUB_STATE, 1, OldaleTown_PokemonCenter_2F_EventScript_1A3E8D
	map_script_2 VAR_CABLE_CLUB_STATE, 2, OldaleTown_PokemonCenter_2F_EventScript_1A3E8D
	map_script_2 VAR_CABLE_CLUB_STATE, 5, OldaleTown_PokemonCenter_2F_EventScript_1A3E8D
	map_script_2 VAR_CABLE_CLUB_STATE, 3, OldaleTown_PokemonCenter_2F_EventScript_1A3E17
	map_script_2 VAR_CABLE_CLUB_STATE, 4, OldaleTown_PokemonCenter_2F_EventScript_1A3E7B
	.2byte 0

OldaleTown_PokemonCenter_2F_EventScript_1A3DB2:: @ 81A3DB2
	special CloseLink
	setvar VAR_CABLE_CLUB_STATE, 0
	applymovement 255, OldaleTown_PokemonCenter_2F_Movement_1A4358
	waitmovement 0
	compare VAR_SPECIAL_7, 0
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A3DD9
	applymovement VAR_SPECIAL_7, OldaleTown_PokemonCenter_2F_Movement_1A4354
	waitmovement 0

OldaleTown_PokemonCenter_2F_EventScript_1A3DD9:: @ 81A3DD9
	return

OldaleTown_PokemonCenter_2F_EventScript_1A3DDA:: @ 81A3DDA
	special CloseLink
	setvar VAR_CABLE_CLUB_STATE, 0
	compare VAR_SPECIAL_7, 0
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A3E0C
	applymovement VAR_SPECIAL_7, OldaleTown_PokemonCenter_2F_Movement_1A4356
	waitmovement 0
	applymovement 255, OldaleTown_PokemonCenter_2F_Movement_1A4358
	waitmovement 0
	applymovement VAR_SPECIAL_7, OldaleTown_PokemonCenter_2F_Movement_1A4354
	waitmovement 0
	return

OldaleTown_PokemonCenter_2F_EventScript_1A3E0C:: @ 81A3E0C
	applymovement 255, OldaleTown_PokemonCenter_2F_Movement_1A4358
	waitmovement 0
	return

OldaleTown_PokemonCenter_2F_EventScript_1A3E17:: @ 81A3E17
	lockall
	call OldaleTown_PokemonCenter_2F_EventScript_1A3E30
	setmetatile 8, 3, 605, 1
	special DrawWholeMapView
	erasebox 0, 0, 29, 19
	releaseall
	end

OldaleTown_PokemonCenter_2F_EventScript_1A3E30:: @ 81A3E30
	special CloseLink
	setvar VAR_CABLE_CLUB_STATE, 0
	compare VAR_SPECIAL_7, 0
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A3E0C
	applymovement 255, OldaleTown_PokemonCenter_2F_Movement_1A4361
	waitmovement 0
	applymovement VAR_SPECIAL_7, OldaleTown_PokemonCenter_2F_Movement_1A4356
	waitmovement 0
	message OldaleTown_PokemonCenter_2F_Text_1A4E50
	waitmessage
	playse SE_PIN
	message OldaleTown_PokemonCenter_2F_Text_1A4E79
	waitmessage
	applymovement 255, OldaleTown_PokemonCenter_2F_Movement_1A4358
	waitmovement 0
	applymovement VAR_SPECIAL_7, OldaleTown_PokemonCenter_2F_Movement_1A4354
	waitmovement 0
	return

OldaleTown_PokemonCenter_2F_EventScript_1A3E7B:: @ 81A3E7B
	call OldaleTown_PokemonCenter_2F_EventScript_1A3DB2
	setmetatile 11, 3, 605, 1
	special DrawWholeMapView
	end

OldaleTown_PokemonCenter_2F_EventScript_1A3E8D:: @ 81A3E8D
	lockall
	call OldaleTown_PokemonCenter_2F_EventScript_1A3DDA
	setmetatile 5, 3, 605, 1
	special DrawWholeMapView
	erasebox 0, 0, 29, 19
	releaseall
	end

DewfordTown_PokemonCenter_2F_EventScript_1A3EA6:: @ 81A3EA6
EverGrandeCity_PokemonCenter_2F_EventScript_1A3EA6:: @ 81A3EA6
FallarborTown_PokemonCenter_2F_EventScript_1A3EA6:: @ 81A3EA6
FortreeCity_PokemonCenter_2F_EventScript_1A3EA6:: @ 81A3EA6
LavaridgeTown_PokemonCenter_2F_EventScript_1A3EA6:: @ 81A3EA6
LilycoveCity_PokemonCenter_2F_EventScript_1A3EA6:: @ 81A3EA6
MauvilleCity_PokemonCenter_2F_EventScript_1A3EA6:: @ 81A3EA6
MossdeepCity_PokemonCenter_2F_EventScript_1A3EA6:: @ 81A3EA6
OldaleTown_PokemonCenter_2F_EventScript_1A3EA6:: @ 81A3EA6
PetalburgCity_PokemonCenter_2F_EventScript_1A3EA6:: @ 81A3EA6
RustboroCity_PokemonCenter_2F_EventScript_1A3EA6:: @ 81A3EA6
SlateportCity_PokemonCenter_2F_EventScript_1A3EA6:: @ 81A3EA6
SootopolisCity_PokemonCenter_2F_EventScript_1A3EA6:: @ 81A3EA6
VerdanturfTown_PokemonCenter_2F_EventScript_1A3EA6:: @ 81A3EA6
	goto_if_unset FLAG_SYS_POKEDEX_GET, OldaleTown_PokemonCenter_2F_EventScript_1A4342
	copyvar VAR_SPECIAL_7, LAST_TALKED
	lock
	faceplayer
	message OldaleTown_PokemonCenter_2F_Text_1A4510
	waitmessage

OldaleTown_PokemonCenter_2F_EventScript_1A3EBC:: @ 81A3EBC
	multichoice 17, 6, 17, 0
	switch RESULT
	case 0, OldaleTown_PokemonCenter_2F_EventScript_1A3EF2
	case 1, OldaleTown_PokemonCenter_2F_EventScript_1A4319
	case 2, OldaleTown_PokemonCenter_2F_EventScript_1A3FDD
	case 127, OldaleTown_PokemonCenter_2F_EventScript_1A4319

OldaleTown_PokemonCenter_2F_EventScript_1A3EF2:: @ 81A3EF2
	call S_DoSaveDialog
	compare RESULT, 0
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A4319
	call OldaleTown_PokemonCenter_2F_EventScript_1A3FEF
	compare VAR_SPECIAL_4, 0
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A4319
	message OldaleTown_PokemonCenter_2F_Text_1A490C
	waitmessage
	special sub_808347C
	waitstate
	compare RESULT, 1
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A3F5E
	compare RESULT, 2
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A4301
	compare RESULT, 3
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A430D
	compare RESULT, 4
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A4068
	compare RESULT, 5
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A4319
	compare RESULT, 6
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A42F5

OldaleTown_PokemonCenter_2F_EventScript_1A3F5E:: @ 81A3F5E
	special ScrSpecial_HealPlayerParty
	special SavePlayerParty
	special LoadPlayerBag
	copyvar VAR_CABLE_CLUB_STATE, VAR_SPECIAL_4
	messageautoscroll OldaleTown_PokemonCenter_2F_Text_1A4A22
	waitmessage
	setmetatile 5, 3, 514, 0
	special DrawWholeMapView
	delay 60
	applymovement LAST_TALKED, OldaleTown_PokemonCenter_2F_Movement_1A4356
	waitmovement 0
	closemessage
	applymovement 255, OldaleTown_PokemonCenter_2F_Movement_1A435B
	waitmovement 0
	opendoor 5, 1
	waitdooranim
	applymovement 255, OldaleTown_PokemonCenter_2F_Movement_1A435F
	waitmovement 0
	hideobjectat 255, MAP_PETALBURG_CITY
	closedoor 5, 1
	waitdooranim
	release
	compare VAR_SPECIAL_4, 5
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A3FCD
	special SetCableClubWarp
	warp MAP_SINGLE_BATTLE_COLOSSEUM, 255, 6, 8
	special DoCableClubWarp
	waitstate
	end

OldaleTown_PokemonCenter_2F_EventScript_1A3FCD:: @ 81A3FCD
	special SetCableClubWarp
	warp MAP_DOUBLE_BATTLE_COLOSSEUM, 255, 5, 8
	special DoCableClubWarp
	waitstate
	end

OldaleTown_PokemonCenter_2F_EventScript_1A3FDD:: @ 81A3FDD
	message OldaleTown_PokemonCenter_2F_Text_1A4696
	waitmessage
	waitbuttonpress
	message OldaleTown_PokemonCenter_2F_Text_1A4826
	waitmessage
	goto OldaleTown_PokemonCenter_2F_EventScript_1A3EBC

OldaleTown_PokemonCenter_2F_EventScript_1A3FEF:: @ 81A3FEF
	message OldaleTown_PokemonCenter_2F_Text_1A4840
	waitmessage
	multichoice 0, 0, 18, 0
	switch RESULT
	case 0, OldaleTown_PokemonCenter_2F_EventScript_1A4062
	case 1, OldaleTown_PokemonCenter_2F_EventScript_1A4042
	case 2, OldaleTown_PokemonCenter_2F_EventScript_1A403C
	case 3, OldaleTown_PokemonCenter_2F_EventScript_1A4036
	case 127, OldaleTown_PokemonCenter_2F_EventScript_1A4036

OldaleTown_PokemonCenter_2F_EventScript_1A4036:: @ 81A4036
	setvar VAR_SPECIAL_4, 0
	return

OldaleTown_PokemonCenter_2F_EventScript_1A403C:: @ 81A403C
	setvar VAR_SPECIAL_4, 5
	return

OldaleTown_PokemonCenter_2F_EventScript_1A4042:: @ 81A4042
	special CheckForAlivePartyMons
	compare RESULT, 0
	goto_if_ne OldaleTown_PokemonCenter_2F_EventScript_1A4056
	setvar VAR_SPECIAL_4, 2
	return

OldaleTown_PokemonCenter_2F_EventScript_1A4056:: @ 81A4056
	message OldaleTown_PokemonCenter_2F_Text_1A486A
	waitmessage
	waitbuttonpress
	goto OldaleTown_PokemonCenter_2F_EventScript_1A3FEF

OldaleTown_PokemonCenter_2F_EventScript_1A4062:: @ 81A4062
	setvar VAR_SPECIAL_4, 1
	return

OldaleTown_PokemonCenter_2F_EventScript_1A4068:: @ 81A4068
	switch VAR_SPECIAL_4
	case 1, OldaleTown_PokemonCenter_2F_EventScript_1A40B1
	case 2, OldaleTown_PokemonCenter_2F_EventScript_1A40A2
	case 5, OldaleTown_PokemonCenter_2F_EventScript_1A4093
	goto OldaleTown_PokemonCenter_2F_EventScript_1A432D

OldaleTown_PokemonCenter_2F_EventScript_1A4093:: @ 81A4093
	special CloseLink
	message OldaleTown_PokemonCenter_2F_Text_1A4C03
	waitmessage
	waitbuttonpress
	goto OldaleTown_PokemonCenter_2F_EventScript_1A40C0

OldaleTown_PokemonCenter_2F_EventScript_1A40A2:: @ 81A40A2
	special CloseLink
	message OldaleTown_PokemonCenter_2F_Text_1A4BCC
	waitmessage
	waitbuttonpress
	goto OldaleTown_PokemonCenter_2F_EventScript_1A40C0

OldaleTown_PokemonCenter_2F_EventScript_1A40B1:: @ 81A40B1
	special CloseLink
	message OldaleTown_PokemonCenter_2F_Text_1A4B95
	waitmessage
	waitbuttonpress
	goto OldaleTown_PokemonCenter_2F_EventScript_1A40C0

OldaleTown_PokemonCenter_2F_EventScript_1A40C0:: @ 81A40C0
	special CloseLink
	message OldaleTown_PokemonCenter_2F_Text_1A4C38
	waitmessage
	waitbuttonpress
	release
	end

DewfordTown_PokemonCenter_2F_EventScript_1A40CC:: @ 81A40CC
EverGrandeCity_PokemonCenter_2F_EventScript_1A40CC:: @ 81A40CC
FallarborTown_PokemonCenter_2F_EventScript_1A40CC:: @ 81A40CC
FortreeCity_PokemonCenter_2F_EventScript_1A40CC:: @ 81A40CC
LavaridgeTown_PokemonCenter_2F_EventScript_1A40CC:: @ 81A40CC
LilycoveCity_PokemonCenter_2F_EventScript_1A40CC:: @ 81A40CC
MauvilleCity_PokemonCenter_2F_EventScript_1A40CC:: @ 81A40CC
MossdeepCity_PokemonCenter_2F_EventScript_1A40CC:: @ 81A40CC
OldaleTown_PokemonCenter_2F_EventScript_1A40CC:: @ 81A40CC
PetalburgCity_PokemonCenter_2F_EventScript_1A40CC:: @ 81A40CC
RustboroCity_PokemonCenter_2F_EventScript_1A40CC:: @ 81A40CC
SlateportCity_PokemonCenter_2F_EventScript_1A40CC:: @ 81A40CC
SootopolisCity_PokemonCenter_2F_EventScript_1A40CC:: @ 81A40CC
VerdanturfTown_PokemonCenter_2F_EventScript_1A40CC:: @ 81A40CC
	goto_if_unset FLAG_SYS_POKEDEX_GET, OldaleTown_PokemonCenter_2F_EventScript_1A4339
	copyvar VAR_SPECIAL_7, LAST_TALKED
	lock
	faceplayer
	msgbox OldaleTown_PokemonCenter_2F_Text_1A457E, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A4319
	compare RESULT, YES
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A40FA

OldaleTown_PokemonCenter_2F_EventScript_1A40FA:: @ 81A40FA
	call OldaleTown_PokemonCenter_2F_EventScript_1A41BB
	compare RESULT, 0
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A4319
	call S_DoSaveDialog
	compare RESULT, 0
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A4319
	message OldaleTown_PokemonCenter_2F_Text_1A490C
	waitmessage
	special sub_80834E4
	waitstate
	compare RESULT, 1
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A4166
	compare RESULT, 2
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A4301
	compare RESULT, 3
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A430D
	compare RESULT, 4
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A432D
	compare RESULT, 5
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A4319
	compare RESULT, 6
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A42F5

OldaleTown_PokemonCenter_2F_EventScript_1A4166:: @ 81A4166
	setvar VAR_SPECIAL_4, 3
	copyvar VAR_CABLE_CLUB_STATE, VAR_SPECIAL_4
	messageautoscroll OldaleTown_PokemonCenter_2F_Text_1A4A22
	waitmessage
	setmetatile 8, 3, 514, 0
	special DrawWholeMapView
	delay 60
	applymovement LAST_TALKED, OldaleTown_PokemonCenter_2F_Movement_1A4356
	waitmovement 0
	closemessage
	applymovement 255, OldaleTown_PokemonCenter_2F_Movement_1A435B
	waitmovement 0
	opendoor 8, 1
	waitdooranim
	applymovement 255, OldaleTown_PokemonCenter_2F_Movement_1A435F
	waitmovement 0
	hideobjectat 255, MAP_PETALBURG_CITY
	closedoor 8, 1
	waitdooranim
	release
	goto OldaleTown_PokemonCenter_2F_EventScript_1A4325

OldaleTown_PokemonCenter_2F_EventScript_1A41BB:: @ 81A41BB
	specialvar RESULT, CalculatePlayerPartyCount
	compare RESULT, 2
	goto_if_lt OldaleTown_PokemonCenter_2F_EventScript_1A41E1
	specialvar RESULT, GetNameOfEnigmaBerryInPlayerParty
	compare RESULT, 1
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A41EE
	setvar RESULT, 1
	return

OldaleTown_PokemonCenter_2F_EventScript_1A41E1:: @ 81A41E1
	message OldaleTown_PokemonCenter_2F_Text_1A48A3
	waitmessage
	waitbuttonpress
	setvar RESULT, 0
	return

OldaleTown_PokemonCenter_2F_EventScript_1A41EE:: @ 81A41EE
	message OldaleTown_PokemonCenter_2F_Text_1A48DD
	waitmessage
	waitbuttonpress
	setvar RESULT, 0
	return

DewfordTown_PokemonCenter_2F_EventScript_1A41FB:: @ 81A41FB
EverGrandeCity_PokemonCenter_2F_EventScript_1A41FB:: @ 81A41FB
FallarborTown_PokemonCenter_2F_EventScript_1A41FB:: @ 81A41FB
FortreeCity_PokemonCenter_2F_EventScript_1A41FB:: @ 81A41FB
LavaridgeTown_PokemonCenter_2F_EventScript_1A41FB:: @ 81A41FB
LilycoveCity_PokemonCenter_2F_EventScript_1A41FB:: @ 81A41FB
MauvilleCity_PokemonCenter_2F_EventScript_1A41FB:: @ 81A41FB
MossdeepCity_PokemonCenter_2F_EventScript_1A41FB:: @ 81A41FB
OldaleTown_PokemonCenter_2F_EventScript_1A41FB:: @ 81A41FB
PacifidlogTown_PokemonCenter_2F_EventScript_1A41FB:: @ 81A41FB
PetalburgCity_PokemonCenter_2F_EventScript_1A41FB:: @ 81A41FB
RustboroCity_PokemonCenter_2F_EventScript_1A41FB:: @ 81A41FB
SlateportCity_PokemonCenter_2F_EventScript_1A41FB:: @ 81A41FB
SootopolisCity_PokemonCenter_2F_EventScript_1A41FB:: @ 81A41FB
VerdanturfTown_PokemonCenter_2F_EventScript_1A41FB:: @ 81A41FB
	goto_if_unset FLAG_VISITED_MAUVILLE_CITY, OldaleTown_PokemonCenter_2F_EventScript_1A434B
	copyvar VAR_SPECIAL_7, LAST_TALKED
	lock
	faceplayer
	msgbox OldaleTown_PokemonCenter_2F_Text_1A45FE, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A4319
	compare RESULT, YES
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A4229

OldaleTown_PokemonCenter_2F_EventScript_1A4229:: @ 81A4229
	call S_DoSaveDialog
	compare RESULT, 0
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A4319
	message OldaleTown_PokemonCenter_2F_Text_1A490C
	waitmessage
	special sub_808350C
	waitstate
	special sub_80835D8
	waitstate
	compare RESULT, 1
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A4294
	compare RESULT, 2
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A4301
	compare RESULT, 3
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A430D
	compare RESULT, 4
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A432D
	compare RESULT, 5
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A4319
	compare RESULT, 6
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A42F5
	compare RESULT, 7
	goto_if_eq OldaleTown_PokemonCenter_2F_EventScript_1A42E9

OldaleTown_PokemonCenter_2F_EventScript_1A4294:: @ 81A4294
	setvar VAR_SPECIAL_4, 4
	copyvar VAR_CABLE_CLUB_STATE, VAR_SPECIAL_4
	messageautoscroll OldaleTown_PokemonCenter_2F_Text_1A4A22
	waitmessage
	setmetatile 11, 3, 514, 0
	special DrawWholeMapView
	delay 60
	applymovement LAST_TALKED, OldaleTown_PokemonCenter_2F_Movement_1A4356
	waitmovement 0
	closemessage
	applymovement 255, OldaleTown_PokemonCenter_2F_Movement_1A435B
	waitmovement 0
	opendoor 11, 1
	waitdooranim
	applymovement 255, OldaleTown_PokemonCenter_2F_Movement_1A435F
	waitmovement 0
	hideobjectat 255, MAP_PETALBURG_CITY
	closedoor 11, 1
	waitdooranim
	release
	goto OldaleTown_PokemonCenter_2F_EventScript_1A4325

OldaleTown_PokemonCenter_2F_EventScript_1A42E9:: @ 81A42E9
	special CloseLink
	message OldaleTown_PokemonCenter_2F_Text_1A4AC8
	waitmessage
	waitbuttonpress
	release
	end

OldaleTown_PokemonCenter_2F_EventScript_1A42F5:: @ 81A42F5
	special CloseLink
	message OldaleTown_PokemonCenter_2F_Text_1A4A85
	waitmessage
	waitbuttonpress
	release
	end

OldaleTown_PokemonCenter_2F_EventScript_1A4301:: @ 81A4301
	special CloseLink
	message OldaleTown_PokemonCenter_2F_Text_1A4A30
	waitmessage
	waitbuttonpress
	release
	end

OldaleTown_PokemonCenter_2F_EventScript_1A430D:: @ 81A430D
	special CloseLink
	message OldaleTown_PokemonCenter_2F_Text_1A4B1D
	waitmessage
	waitbuttonpress
	release
	end

OldaleTown_PokemonCenter_2F_EventScript_1A4319:: @ 81A4319
	special CloseLink
	message OldaleTown_PokemonCenter_2F_Text_1A4B59
	waitmessage
	waitbuttonpress
	release
	end

OldaleTown_PokemonCenter_2F_EventScript_1A4325:: @ 81A4325
	special SetCableClubWarp
	special DoCableClubWarp
	waitstate
	end

OldaleTown_PokemonCenter_2F_EventScript_1A432D:: @ 81A432D
	special CloseLink
	message OldaleTown_PokemonCenter_2F_Text_1A4B6C
	waitmessage
	waitbuttonpress
	release
	end

OldaleTown_PokemonCenter_2F_EventScript_1A4339:: @ 81A4339
	msgbox OldaleTown_PokemonCenter_2F_Text_1A141C, 2
	end

OldaleTown_PokemonCenter_2F_EventScript_1A4342:: @ 81A4342
	msgbox OldaleTown_PokemonCenter_2F_Text_1A13DF, 2
	end

OldaleTown_PokemonCenter_2F_EventScript_1A434B:: @ 81A434B
	msgbox OldaleTown_PokemonCenter_2F_Text_1A145C, 2
	end

OldaleTown_PokemonCenter_2F_Movement_1A4354:: @ 81A4354
	face_down
	end_movement

OldaleTown_PokemonCenter_2F_Movement_1A4356:: @ 81A4356
	face_right
	end_movement

OldaleTown_PokemonCenter_2F_Movement_1A4358:: @ 81A4358
	walk_down
	walk_down
	end_movement

OldaleTown_PokemonCenter_2F_Movement_1A435B:: @ 81A435B
	walk_right
	walk_up
	walk_up
	end_movement

OldaleTown_PokemonCenter_2F_Movement_1A435F:: @ 81A435F
	walk_up
	end_movement

OldaleTown_PokemonCenter_2F_Movement_1A4361:: @ 81A4361
	face_left
	end_movement

gUnknown_081A4363:: @ 81A4363
	lockall
	special ShowLinkBattleRecords
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end

SingleBattleColosseum_EventScript_1A436F:: @ 81A436F
	setvar VAR_SPECIAL_5, 0
	special sub_8083B90
	waitstate
	end

SingleBattleColosseum_EventScript_1A4379:: @ 81A4379
	setvar VAR_SPECIAL_5, 1
	special sub_8083B90
	waitstate
	end

DoubleBattleColosseum_EventScript_1A4383:: @ 81A4383
	fadescreen 1
	special sub_80C5568
	waitstate
	compare RESULT, 0
	goto_if_eq DoubleBattleColosseum_EventScript_1A43EF
	setvar VAR_SPECIAL_5, 0
	special sub_8083B90
	waitstate
	end

DoubleBattleColosseum_EventScript_1A439E:: @ 81A439E
	fadescreen 1
	special sub_80C5568
	waitstate
	compare RESULT, 0
	goto_if_eq DoubleBattleColosseum_EventScript_1A43EF
	setvar VAR_SPECIAL_5, 1
	special sub_8083B90
	waitstate
	end

DoubleBattleColosseum_EventScript_1A43B9:: @ 81A43B9
	fadescreen 1
	special sub_80C5568
	waitstate
	compare RESULT, 0
	goto_if_eq DoubleBattleColosseum_EventScript_1A43EF
	setvar VAR_SPECIAL_5, 2
	special sub_8083B90
	waitstate
	end

DoubleBattleColosseum_EventScript_1A43D4:: @ 81A43D4
	fadescreen 1
	special sub_80C5568
	waitstate
	compare RESULT, 0
	goto_if_eq DoubleBattleColosseum_EventScript_1A43EF
	setvar VAR_SPECIAL_5, 3
	special sub_8083B90
	waitstate
	end

DoubleBattleColosseum_EventScript_1A43EF:: @ 81A43EF
	end

TradeCenter_EventScript_1A43F0:: @ 81A43F0
	setvar VAR_SPECIAL_5, 0
	special sub_8083B5C
	waitstate
	end

TradeCenter_EventScript_1A43FA:: @ 81A43FA
	setvar VAR_SPECIAL_5, 1
	special sub_8083B5C
	waitstate
	end

@ 81A4404
	setvar VAR_SPECIAL_5, 2
	special sub_8083B5C
	waitstate
	end

@ 81A440E
	setvar VAR_SPECIAL_5, 3
	special sub_8083B5C
	waitstate
	end

RecordCorner_EventScript_1A4418:: @ 81A4418
	setvar VAR_SPECIAL_5, 0
	special sub_80B929C
	waitstate
	compare VAR_TEMP_1, 0
	goto_if_ne RecordCorner_EventScript_1A446C
	end

RecordCorner_EventScript_1A442D:: @ 81A442D
	setvar VAR_SPECIAL_5, 1
	special sub_80B929C
	waitstate
	compare VAR_TEMP_1, 0
	goto_if_ne RecordCorner_EventScript_1A446C
	end

RecordCorner_EventScript_1A4442:: @ 81A4442
	setvar VAR_SPECIAL_5, 2
	special sub_80B929C
	waitstate
	compare VAR_TEMP_1, 0
	goto_if_ne RecordCorner_EventScript_1A446C
	end

RecordCorner_EventScript_1A4457:: @ 81A4457
	setvar VAR_SPECIAL_5, 3
	special sub_80B929C
	waitstate
	compare VAR_TEMP_1, 0
	goto_if_ne RecordCorner_EventScript_1A446C
	end

RecordCorner_EventScript_1A446C:: @ 81A446C
	bufferitemname 1, VAR_TEMP_1
	message RecordCorner_Text_1A4E3B
	waitmessage
	waitbuttonpress
	releaseall
	end

TradeRoom_ReadTrainerCard1:: @ 81A4479
	message CableClub_LookAtTrainerCard1
	waitmessage
	waitbuttonpress
	fadescreen 1
	special sub_8083BDC
	waitstate
	end

TradeRoom_ReadTrainerCard2:: @ 81A4487
	message CableClub_LookAtTrainerCard2
	waitmessage
	waitbuttonpress
	fadescreen 1
	special sub_8083BDC
	waitstate
	end

TradeRoom_TooBusyToNotice:: @ 81A4495
	message CableClub_TooBusyToNotice
	waitmessage
	waitbuttonpress
	closemessage
	end

SingleBattleColosseum_EventScript_1A449E:: @ 81A449E
	special sub_8064EAC
	message SingleBattleColosseum_Text_1A4D7E
	waitmessage
	waitbuttonpress
	special sub_8064ED4
	closemessage
	end

TradeCenter_EventScript_1A44AD:: @ 81A44AD
	special sub_8064EAC
	message TradeCenter_Text_1A4DAB
	waitmessage
	waitbuttonpress
	special sub_8064ED4
	closemessage
	end

RecordCorner_EventScript_1A44BC:: @ 81A44BC
	compare VAR_TEMP_0, 0
	goto_if_ne RecordCorner_EventScript_1A44D6
	special sub_8064EAC
	message RecordCorner_Text_1A4DD7
	waitmessage
	waitbuttonpress
	special sub_8064ED4
	closemessage
	end

RecordCorner_EventScript_1A44D6:: @ 81A44D6
	special sub_8064EAC
	message RecordCorner_Text_1A4DF7
	waitmessage
	waitbuttonpress
	special sub_8064ED4
	closemessage
	end

TradeRoom_PromptToCancelLink:: @ 81A44E5
	msgbox TradeRoom_WillLinkBeTerminated, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq TradeRoom_TerminateLink
	erasebox 0, 0, 29, 19
	end

TradeRoom_TerminateLink:: @ 81A44FE
	messageautoscroll TradeRoom_TerminatingLink
	waitmessage
	special sub_80839D0
	end

gUnknown_081A4508:: @ 81A4508
	special sub_80839A4
	special sub_80810DC
	waitstate
	end
