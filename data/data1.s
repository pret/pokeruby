@ the first big chunk of data

	.include "asm/macros.s"
	.include "constants/constants.s"

	.section script_data, "aw", %progbits

@ 814AE30
	.include "data/script_cmd_table.s"

	.global gUnknown_0814B14C
gUnknown_0814B14C: @ 814B14C
	.incbin "baserom.gba", 0x0014b14c, 0x48

	.global gUnknown_0814B194
gUnknown_0814B194: @ 814B194
	.incbin "baserom.gba", 0x0014b194, 0x558

	.global gUnknown_0814B6EC
gUnknown_0814B6EC: @ 814B6EC
	.incbin "baserom.gba", 0x0014b6ec, 0x20

	.global gUnknown_0814B70C
gUnknown_0814B70C: @ 814B70C

	.include "data/maps/scripts/PetalburgCity.s"
	.include "data/maps/scripts/SlateportCity.s"
	.include "data/maps/scripts/MauvilleCity.s"
	.include "data/maps/scripts/RustboroCity.s"
	.include "data/maps/scripts/FortreeCity.s"
	.include "data/maps/scripts/LilycoveCity.s"
	.include "data/maps/scripts/MossdeepCity.s"
	.include "data/maps/scripts/SootopolisCity.s"
	.global gUnknown_0814D2FF
gUnknown_0814D2FF: @ 814D2FF

	.incbin "baserom.gba", 0x14d2ff, 0x9

SootopolisCity_EventScript_14D308:: @ 814D308
	lockall
	move 10, SootopolisCity_Movement_1A083F
	move 255, SootopolisCity_Movement_1A0843
	waitmove 0
	playsfx 21
	move 10, SootopolisCity_Movement_1A0833
	waitmove 0
	move 10, SootopolisCity_Movement_1A0835
	waitmove 0
	move 10, SootopolisCity_Movement_14D413
	waitmove 0
	msgbox SootopolisCity_Text_169E0F, 4
	closebutton
	move 10, SootopolisCity_Movement_14D417
	move 255, SootopolisCity_Movement_14D440
	waitmove 10
	msgbox SootopolisCity_Text_169E82, 4
	playsfx 21
	move 5, SootopolisCity_Movement_1A0833
	waitmove 0
	move 5, SootopolisCity_Movement_1A0835
	waitmove 0
	msgbox SootopolisCity_Text_169F3C, 4
	closebutton
	pause 30
	move 5, SootopolisCity_Movement_14D46A
	move 10, SootopolisCity_Movement_14D41D
	move 255, SootopolisCity_Movement_14D445
	waitmove 0
	move 5, SootopolisCity_Movement_1A0843
	move 255, SootopolisCity_Movement_1A0843
	waitmove 0
	pause 30
	move 10, SootopolisCity_Movement_1A0845
	waitmove 0
	msgbox SootopolisCity_Text_169F6B, 4
	closebutton
	pause 30
	move 5, SootopolisCity_Movement_14D47C
	move 255, SootopolisCity_Movement_14D457
	move 10, SootopolisCity_Movement_14D42D
	waitmove 0
	move 5, SootopolisCity_Movement_1A083F
	waitmove 0
	msgbox SootopolisCity_Text_16A06C, 4
	move 255, SootopolisCity_Movement_1A083F
	waitmove 0
	msgbox SootopolisCity_Text_16A13E, 4
	moveoffscreen 5
	spritebehave 5, 9
	moveoffscreen 10
	spritebehave 10, 10
	setvar 0x405e, 2
	releaseall
	end

SootopolisCity_Movement_14D413:: @ 814D413
	step_left
	step_left
	step_left
	step_end

SootopolisCity_Movement_14D417:: @ 814D417
	step_right
	step_right
	step_right
	step_up
	step_25
	step_end

SootopolisCity_Movement_14D41D:: @ 814D41D
	step_down
	step_right
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_left
	step_left
	step_end

SootopolisCity_Movement_14D42D:: @ 814D42D
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_end

SootopolisCity_Movement_14D440:: @ 814D440
	step_right
	step_right
	step_right
	step_right
	step_end

SootopolisCity_Movement_14D445:: @ 814D445
	step_right
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

SootopolisCity_Movement_14D457:: @ 814D457
	step_14
	step_14
	step_left
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

SootopolisCity_Movement_14D46A:: @ 814D46A
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

SootopolisCity_Movement_14D47C:: @ 814D47C
	step_14
	step_14
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

SootopolisCity_EventScript_14D48F:: @ 814D48F
	msgbox SootopolisCity_Text_16A1DB, 2
	end

SootopolisCity_EventScript_14D498:: @ 814D498
	lock
	faceplayer
	checkflag 113
	jumpeq SootopolisCity_EventScript_14D4AD
	msgbox SootopolisCity_Text_16A249, 4
	release
	end

SootopolisCity_EventScript_14D4AD:: @ 814D4AD
	msgbox SootopolisCity_Text_16A33E, 4
	closebutton
	move LAST_TALKED, SootopolisCity_Movement_1A0845
	waitmove 0
	pause 50
	setanimation 0, 1
	doanimation 30
	pause 15
	disappear LAST_TALKED
	checkanimation 30
	release
	end

	.include "data/maps/scripts/EverGrandeCity.s"
	.include "data/maps/scripts/LittlerootTown.s"
	.include "data/maps/scripts/OldaleTown.s"
	.include "data/maps/scripts/DewfordTown.s"
	.include "data/maps/scripts/LavaridgeTown.s"
	.include "data/maps/scripts/FallarborTown.s"
	.include "data/maps/scripts/VerdanturfTown.s"
	.include "data/maps/scripts/PacifidlogTown.s"
	.include "data/maps/scripts/Route101.s"
	.include "data/maps/scripts/Route102.s"
	.include "data/maps/scripts/Route103.s"
	.include "data/maps/scripts/Route104.s"
	.include "data/maps/scripts/Route105.s"
	.include "data/maps/scripts/Route106.s"
	.include "data/maps/scripts/Route107.s"
	.include "data/maps/scripts/Route108.s"
	.include "data/maps/scripts/Route109.s"
	.include "data/maps/scripts/Route110.s"
	.include "data/maps/scripts/Route111.s"
	.include "data/maps/scripts/Route112.s"
	.include "data/maps/scripts/Route113.s"
	.include "data/maps/scripts/Route114.s"
	.include "data/maps/scripts/Route115.s"
	.include "data/maps/scripts/Route116.s"
	.include "data/maps/scripts/Route117.s"
	.include "data/maps/scripts/Route118.s"
	.include "data/maps/scripts/Route119.s"
	.include "data/maps/scripts/Route120.s"
	.include "data/maps/scripts/Route121.s"
	.include "data/maps/scripts/Route122.s"
	.include "data/maps/scripts/Route123.s"
	.include "data/maps/scripts/Route124.s"
	.include "data/maps/scripts/Route125.s"
	.include "data/maps/scripts/Route126.s"
	.include "data/maps/scripts/Route127.s"
	.include "data/maps/scripts/Route128.s"
	.include "data/maps/scripts/Route129.s"
	.include "data/maps/scripts/Route130.s"
	.include "data/maps/scripts/Route131.s"
	.include "data/maps/scripts/Route132.s"
	.include "data/maps/scripts/Route133.s"
	.include "data/maps/scripts/Route134.s"
	.include "data/maps/scripts/Underwater1.s"
	.include "data/maps/scripts/Underwater2.s"
	.include "data/maps/scripts/Underwater3.s"
	.include "data/maps/scripts/Underwater4.s"
	.include "data/maps/scripts/LittlerootTown_BrendansHouse_1F.s"
	.include "data/maps/scripts/LittlerootTown_BrendansHouse_2F.s"
	.global gUnknown_0815281E
gUnknown_0815281E: @ 815281E

LittlerootTown_BrendansHouse_2F_EventScript_15281E:: @ 815281E
	lockall
	checkgender
	compare RESULT, 0
	jumpeq LittlerootTown_BrendansHouse_2F_EventScript_152837
	compare RESULT, 1
	jumpeq LittlerootTown_BrendansHouse_2F_EventScript_15285D
	end

LittlerootTown_BrendansHouse_2F_EventScript_152837:: @ 8152837
	setvar 0x8004, 1
	special 214
	playsfx 4
	msgbox LittlerootTown_BrendansHouse_2F_Text_1A10D6, 4
	special 249
	waitstate
	releaseall
	end

	.global gUnknown_08152850
gUnknown_08152850: @ 8152850

	.incbin "baserom.gba", 0x152850, 0xd

LittlerootTown_BrendansHouse_2F_EventScript_15285D:: @ 815285D
	msgbox LittlerootTown_BrendansHouse_2F_Text_1A100C, 4
	releaseall
	end

LittlerootTown_BrendansHouse_2F_EventScript_152867:: @ 8152867
LittlerootTown_MaysHouse_2F_EventScript_152867:: @ 8152867
	msgbox LittlerootTown_BrendansHouse_2F_Text_172F9A, 3
	end

LittlerootTown_BrendansHouse_2F_EventScript_152870:: @ 8152870
LittlerootTown_MaysHouse_2F_EventScript_152870:: @ 8152870
	msgbox LittlerootTown_BrendansHouse_2F_Text_17306C, 3
	end

	.include "data/maps/scripts/LittlerootTown_MaysHouse_1F.s"
	.include "data/maps/scripts/LittlerootTown_MaysHouse_2F.s"
LittlerootTown_BrendansHouse_2F_Movement_152C11:: @ 8152C11
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_up
	step_up
	step_13
	step_end

LittlerootTown_BrendansHouse_2F_Movement_152C1C:: @ 8152C1C
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_up
	step_13
	step_end

LittlerootTown_BrendansHouse_2F_Movement_152C25:: @ 8152C25
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_13
	step_end

LittlerootTown_BrendansHouse_2F_Movement_152C30:: @ 8152C30
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_13
	step_end

	.global gUnknown_08152C39
gUnknown_08152C39: @ 8152C39

LittlerootTown_MaysHouse_2F_EventScript_152C39:: @ 8152C39
	lockall
	checkgender
	compare RESULT, 0
	jumpeq LittlerootTown_MaysHouse_2F_EventScript_152C52
	compare RESULT, 1
	jumpeq LittlerootTown_MaysHouse_2F_EventScript_152C5C
	end

LittlerootTown_MaysHouse_2F_EventScript_152C52:: @ 8152C52
	msgbox LittlerootTown_MaysHouse_2F_Text_1A100C, 4
	releaseall
	end

LittlerootTown_MaysHouse_2F_EventScript_152C5C:: @ 8152C5C
	setvar 0x8004, 2
	special 214
	playsfx 4
	msgbox LittlerootTown_MaysHouse_2F_Text_1A10D6, 4
	special 249
	waitstate
	releaseall
	end

	.global gUnknown_08152C75
gUnknown_08152C75: @ 8152C75

	.incbin "baserom.gba", 0x152c75, 0xd

	.include "data/maps/scripts/LittlerootTown_ProfessorBirchsLab.s"
	.include "data/maps/scripts/OldaleTown_House1.s"
	.include "data/maps/scripts/OldaleTown_House2.s"
	.include "data/maps/scripts/OldaleTown_PokemonCenter_1F.s"
	.include "data/maps/scripts/OldaleTown_PokemonCenter_2F.s"
	.include "data/maps/scripts/OldaleTown_Mart.s"
	.include "data/maps/scripts/DewfordTown_House1.s"
	.include "data/maps/scripts/DewfordTown_PokemonCenter_1F.s"
	.include "data/maps/scripts/DewfordTown_PokemonCenter_2F.s"
	.include "data/maps/scripts/DewfordTown_Gym.s"
	.include "data/maps/scripts/DewfordTown_Hall.s"
	.include "data/maps/scripts/DewfordTown_House2.s"
	.include "data/maps/scripts/LavaridgeTown_HerbShop.s"
	.include "data/maps/scripts/LavaridgeTown_Gym_1F.s"
	.include "data/maps/scripts/LavaridgeTown_Gym_B1F.s"
	.include "data/maps/scripts/LavaridgeTown_House.s"
	.include "data/maps/scripts/LavaridgeTown_Mart.s"
	.include "data/maps/scripts/LavaridgeTown_PokemonCenter_1F.s"
	.include "data/maps/scripts/LavaridgeTown_PokemonCenter_2F.s"
	.include "data/maps/scripts/FallarborTown_Mart.s"
	.include "data/maps/scripts/FallarborTown_ContestLobby.s"
	.include "data/maps/scripts/FallarborTown_ContestHall.s"
	.include "data/maps/scripts/FallarborTown_PokemonCenter_1F.s"
	.include "data/maps/scripts/FallarborTown_PokemonCenter_2F.s"
	.include "data/maps/scripts/FallarborTown_House1.s"
	.include "data/maps/scripts/FallarborTown_House2.s"
	.include "data/maps/scripts/VerdanturfTown_ContestLobby.s"
	.include "data/maps/scripts/VerdanturfTown_ContestHall.s"
	.include "data/maps/scripts/VerdanturfTown_Mart.s"
	.include "data/maps/scripts/VerdanturfTown_PokemonCenter_1F.s"
	.include "data/maps/scripts/VerdanturfTown_PokemonCenter_2F.s"
	.include "data/maps/scripts/VerdanturfTown_WandasHouse.s"
	.include "data/maps/scripts/VerdanturfTown_FriendshipRatersHouse.s"
	.include "data/maps/scripts/VerdanturfTown_House.s"
	.include "data/maps/scripts/PacifidlogTown_PokemonCenter_1F.s"
	.include "data/maps/scripts/PacifidlogTown_PokemonCenter_2F.s"
	.include "data/maps/scripts/PacifidlogTown_House1.s"
	.include "data/maps/scripts/PacifidlogTown_House2.s"
	.include "data/maps/scripts/PacifidlogTown_House3.s"
	.include "data/maps/scripts/PacifidlogTown_House4.s"
	.include "data/maps/scripts/PacifidlogTown_House5.s"
	.include "data/maps/scripts/PetalburgCity_WallysHouse.s"
	.include "data/maps/scripts/PetalburgCity_Gym.s"
	.include "data/maps/scripts/PetalburgCity_House1.s"
	.include "data/maps/scripts/PetalburgCity_House2.s"
	.include "data/maps/scripts/PetalburgCity_PokemonCenter_1F.s"
	.include "data/maps/scripts/PetalburgCity_PokemonCenter_2F.s"
	.include "data/maps/scripts/PetalburgCity_Mart.s"
	.include "data/maps/scripts/SlateportCity_SternsShipyard_1F.s"
	.include "data/maps/scripts/SlateportCity_SternsShipyard_2F.s"
	.include "data/maps/scripts/SlateportCity_ContestLobby.s"
	.include "data/maps/scripts/SlateportCity_ContestHall.s"
	.include "data/maps/scripts/SlateportCity_House1.s"
	.include "data/maps/scripts/SlateportCity_PokemonFanClub.s"
	.include "data/maps/scripts/SlateportCity_OceanicMuseum_1F.s"
	.include "data/maps/scripts/SlateportCity_OceanicMuseum_2F.s"
	.include "data/maps/scripts/SlateportCity_Harbor.s"
	.include "data/maps/scripts/SlateportCity_House2.s"
	.include "data/maps/scripts/SlateportCity_PokemonCenter_1F.s"
	.include "data/maps/scripts/SlateportCity_PokemonCenter_2F.s"
	.include "data/maps/scripts/SlateportCity_Mart.s"
	.include "data/maps/scripts/MauvilleCity_Gym.s"
	.include "data/maps/scripts/MauvilleCity_BikeShop.s"
	.include "data/maps/scripts/MauvilleCity_House1.s"
	.include "data/maps/scripts/MauvilleCity_GameCorner.s"
	.include "data/maps/scripts/MauvilleCity_House2.s"
	.include "data/maps/scripts/MauvilleCity_PokemonCenter_1F.s"
	.include "data/maps/scripts/MauvilleCity_PokemonCenter_2F.s"
	.include "data/maps/scripts/MauvilleCity_Mart.s"
	.include "data/maps/scripts/RustboroCity_DevonCorp_1F.s"
	.include "data/maps/scripts/RustboroCity_DevonCorp_2F.s"
	.include "data/maps/scripts/RustboroCity_DevonCorp_3F.s"
	.include "data/maps/scripts/RustboroCity_Gym.s"
	.include "data/maps/scripts/RustboroCity_PokemonSchool.s"
	.include "data/maps/scripts/RustboroCity_PokemonCenter_1F.s"
	.include "data/maps/scripts/RustboroCity_PokemonCenter_2F.s"
	.include "data/maps/scripts/RustboroCity_Mart.s"
	.include "data/maps/scripts/RustboroCity_Flat1_1F.s"
	.include "data/maps/scripts/RustboroCity_Flat1_2F.s"
	.include "data/maps/scripts/RustboroCity_House1.s"
	.include "data/maps/scripts/RustboroCity_CuttersHouse.s"
	.include "data/maps/scripts/RustboroCity_House2.s"
	.include "data/maps/scripts/RustboroCity_Flat2_1F.s"
	.include "data/maps/scripts/RustboroCity_Flat2_2F.s"
	.include "data/maps/scripts/RustboroCity_Flat2_3F.s"
	.include "data/maps/scripts/RustboroCity_House3.s"
	.include "data/maps/scripts/FortreeCity_House1.s"
	.include "data/maps/scripts/FortreeCity_Gym.s"
	.include "data/maps/scripts/FortreeCity_PokemonCenter_1F.s"
	.include "data/maps/scripts/FortreeCity_PokemonCenter_2F.s"
	.include "data/maps/scripts/FortreeCity_Mart.s"
	.include "data/maps/scripts/FortreeCity_House2.s"
	.include "data/maps/scripts/FortreeCity_House3.s"
	.include "data/maps/scripts/FortreeCity_House4.s"
	.include "data/maps/scripts/FortreeCity_House5.s"
	.include "data/maps/scripts/FortreeCity_DecorationShop.s"
	.include "data/maps/scripts/LilycoveCity_CoveLilyMotel_1F.s"
	.include "data/maps/scripts/LilycoveCity_CoveLilyMotel_2F.s"
	.include "data/maps/scripts/LilycoveCity_LilycoveMuseum_1F.s"
	.include "data/maps/scripts/LilycoveCity_LilycoveMuseum_2F.s"
	.include "data/maps/scripts/LilycoveCity_ContestLobby.s"
	.include "data/maps/scripts/LilycoveCity_ContestHall.s"
	.include "data/maps/scripts/LilycoveCity_PokemonCenter_1F.s"
	.include "data/maps/scripts/LilycoveCity_PokemonCenter_2F.s"
	.include "data/maps/scripts/LilycoveCity_UnusedMart.s"
	.include "data/maps/scripts/LilycoveCity_PokemonTrainerFanClub.s"
	.include "data/maps/scripts/LilycoveCity_Harbor.s"
	.include "data/maps/scripts/LilycoveCity_EmptyMap.s"
	.include "data/maps/scripts/LilycoveCity_MoveDeletersHouse.s"
	.include "data/maps/scripts/LilycoveCity_House1.s"
	.include "data/maps/scripts/LilycoveCity_House2.s"
	.include "data/maps/scripts/LilycoveCity_House3.s"
	.include "data/maps/scripts/LilycoveCity_House4.s"
	.include "data/maps/scripts/LilycoveCity_DepartmentStore_1F.s"
	.include "data/maps/scripts/LilycoveCity_DepartmentStore_2F.s"
	.include "data/maps/scripts/LilycoveCity_DepartmentStore_3F.s"
	.include "data/maps/scripts/LilycoveCity_DepartmentStore_4F.s"
	.include "data/maps/scripts/LilycoveCity_DepartmentStore_5F.s"
	.include "data/maps/scripts/LilycoveCity_DepartmentStoreRooftop.s"
	.include "data/maps/scripts/LilycoveCity_DepartmentStoreElevator.s"
	.include "data/maps/scripts/MossdeepCity_Gym.s"
	.include "data/maps/scripts/MossdeepCity_House1.s"
	.include "data/maps/scripts/MossdeepCity_House2.s"
	.include "data/maps/scripts/MossdeepCity_PokemonCenter_1F.s"
	.include "data/maps/scripts/MossdeepCity_PokemonCenter_2F.s"
	.include "data/maps/scripts/MossdeepCity_Mart.s"
	.include "data/maps/scripts/MossdeepCity_House3.s"
	.include "data/maps/scripts/MossdeepCity_StevensHouse.s"
	.include "data/maps/scripts/MossdeepCity_House4.s"
	.include "data/maps/scripts/MossdeepCity_SpaceCenter_1F.s"
	.include "data/maps/scripts/MossdeepCity_SpaceCenter_2F.s"
	.include "data/maps/scripts/MossdeepCity_GameCorner_1F.s"
	.include "data/maps/scripts/MossdeepCity_GameCorner_B1F.s"
	.include "data/maps/scripts/SootopolisCity_Gym_1F.s"
	.include "data/maps/scripts/SootopolisCity_Gym_B1F.s"
	.include "data/maps/scripts/SootopolisCity_PokemonCenter_1F.s"
	.include "data/maps/scripts/SootopolisCity_PokemonCenter_2F.s"
	.include "data/maps/scripts/SootopolisCity_Mart.s"
	.include "data/maps/scripts/SootopolisCity_House1.s"
	.include "data/maps/scripts/SootopolisCity_House2.s"
	.include "data/maps/scripts/SootopolisCity_House3.s"
	.include "data/maps/scripts/SootopolisCity_House4.s"
	.include "data/maps/scripts/SootopolisCity_House5.s"
	.include "data/maps/scripts/SootopolisCity_House6.s"
	.include "data/maps/scripts/SootopolisCity_House7.s"
	.include "data/maps/scripts/SootopolisCity_House8.s"
	.include "data/maps/scripts/EverGrandeCity_SidneysRoom.s"
	.include "data/maps/scripts/EverGrandeCity_PhoebesRoom.s"
	.include "data/maps/scripts/EverGrandeCity_GlaciasRoom.s"
	.include "data/maps/scripts/EverGrandeCity_DrakesRoom.s"
	.include "data/maps/scripts/EverGrandeCity_ChampionsRoom.s"
	.include "data/maps/scripts/EverGrandeCity_Corridor1.s"
	.include "data/maps/scripts/EverGrandeCity_Corridor2.s"
	.include "data/maps/scripts/EverGrandeCity_Corridor3.s"
	.include "data/maps/scripts/EverGrandeCity_Corridor4.s"
	.include "data/maps/scripts/EverGrandeCity_Corridor5.s"
	.include "data/maps/scripts/EverGrandeCity_PokemonLeague.s"
	.include "data/maps/scripts/EverGrandeCity_HallOfFame.s"
	.include "data/maps/scripts/EverGrandeCity_PokemonCenter_1F.s"
	.include "data/maps/scripts/EverGrandeCity_PokemonCenter_2F.s"
	.include "data/maps/scripts/Route104_MrBrineysHouse.s"
	.include "data/maps/scripts/Route104_PrettyPetalFlowerShop.s"
	.include "data/maps/scripts/Route111_WinstrateFamilysHouse.s"
	.include "data/maps/scripts/Route111_OldLadysRestStop.s"
	.include "data/maps/scripts/Route112_CableCarStation.s"
	.include "data/maps/scripts/MtChimney_CableCarStation.s"
	.include "data/maps/scripts/Route114_FossilManiacsHouse.s"
	.include "data/maps/scripts/Route114_FossilManiacsTunnel.s"
	.include "data/maps/scripts/Route114_LanettesHouse.s"
	.include "data/maps/scripts/Route116_TunnelersRestHouse.s"
	.include "data/maps/scripts/Route117_PokemonDayCare.s"
	.include "data/maps/scripts/Route121_SafariZoneEntrance.s"
	.include "data/maps/scripts/MeteorFalls_1F_1R.s"
	.include "data/maps/scripts/MeteorFalls_1F_2R.s"
	.include "data/maps/scripts/MeteorFalls_B1F_1R.s"
	.include "data/maps/scripts/MeteorFalls_B1F_2R.s"
	.include "data/maps/scripts/RusturfTunnel.s"
	.include "data/maps/scripts/Underwater_SootopolisCity.s"
	.include "data/maps/scripts/DesertRuins.s"
	.include "data/maps/scripts/GraniteCave_1F.s"
	.include "data/maps/scripts/GraniteCave_B1F.s"
	.include "data/maps/scripts/GraniteCave_B2F.s"
	.include "data/maps/scripts/GraniteCave_StevensRoom.s"
	.include "data/maps/scripts/PetalburgWoods.s"
	.include "data/maps/scripts/MtChimney.s"
	.include "data/maps/scripts/JaggedPass.s"
	.include "data/maps/scripts/FieryPath.s"
	.include "data/maps/scripts/MtPyre_1F.s"
	.include "data/maps/scripts/MtPyre_2F.s"
	.include "data/maps/scripts/MtPyre_3F.s"
	.include "data/maps/scripts/MtPyre_4F.s"
	.include "data/maps/scripts/MtPyre_5F.s"
	.include "data/maps/scripts/MtPyre_6F.s"
	.include "data/maps/scripts/MtPyre_Exterior.s"
	.include "data/maps/scripts/MtPyre_Summit.s"
	.include "data/maps/scripts/AquaHideout_1F.s"
	.include "data/maps/scripts/AquaHideout_B1F.s"
	.include "data/maps/scripts/AquaHideout_B2F.s"
	.include "data/maps/scripts/Underwater_SeafloorCavern.s"
	.include "data/maps/scripts/SeafloorCavern_Entrance.s"
	.include "data/maps/scripts/SeafloorCavern_Room1.s"
	.include "data/maps/scripts/SeafloorCavern_Room2.s"
	.include "data/maps/scripts/SeafloorCavern_Room3.s"
	.include "data/maps/scripts/SeafloorCavern_Room4.s"
	.include "data/maps/scripts/SeafloorCavern_Room5.s"
	.include "data/maps/scripts/SeafloorCavern_Room6.s"
	.include "data/maps/scripts/SeafloorCavern_Room7.s"
	.include "data/maps/scripts/SeafloorCavern_Room8.s"
	.include "data/maps/scripts/SeafloorCavern_Room9.s"
	.include "data/maps/scripts/CaveOfOrigin_Entrance.s"
	.include "data/maps/scripts/CaveOfOrigin_1F.s"
	.include "data/maps/scripts/CaveOfOrigin_B1F.s"
	.include "data/maps/scripts/CaveOfOrigin_B2F.s"
	.include "data/maps/scripts/CaveOfOrigin_B3F.s"
	.include "data/maps/scripts/CaveOfOrigin_B4F.s"
	.include "data/maps/scripts/VictoryRoad_1F.s"
	.include "data/maps/scripts/VictoryRoad_B1F.s"
	.include "data/maps/scripts/VictoryRoad_B2F.s"
	.include "data/maps/scripts/ShoalCave_LowTideEntranceRoom.s"
	.include "data/maps/scripts/ShoalCave_LowTideInnerRoom.s"
	.include "data/maps/scripts/ShoalCave_LowTideStairsRoom.s"
	.include "data/maps/scripts/ShoalCave_LowTideLowerRoom.s"
	.include "data/maps/scripts/ShoalCave_HighTideEntranceRoom.s"
	.include "data/maps/scripts/ShoalCave_HighTideInnerRoom.s"
	.include "data/maps/scripts/NewMauville_Entrance.s"
	.include "data/maps/scripts/NewMauville_Inside.s"
	.include "data/maps/scripts/AbandonedShip_Deck.s"
	.include "data/maps/scripts/AbandonedShip_Corridors_1F.s"
	.include "data/maps/scripts/AbandonedShip_Rooms_1F.s"
	.include "data/maps/scripts/AbandonedShip_Corridors_B1F.s"
	.include "data/maps/scripts/AbandonedShip_Rooms_B1F.s"
	.include "data/maps/scripts/AbandonedShip_Rooms2_B1F.s"
	.include "data/maps/scripts/AbandonedShip_Underwater1.s"
	.include "data/maps/scripts/AbandonedShip_Room_B1F.s"
	.include "data/maps/scripts/AbandonedShip_Rooms2_1F.s"
	.include "data/maps/scripts/AbandonedShip_CaptainsOffice.s"
	.include "data/maps/scripts/AbandonedShip_Underwater2.s"
	.include "data/maps/scripts/AbandonedShip_HiddenFloorCorridors.s"
	.include "data/maps/scripts/AbandonedShip_HiddenFloorRooms.s"
	.include "data/maps/scripts/IslandCave.s"
	.global gUnknown_0815EF19
gUnknown_0815EF19: @ 815EF19

	.incbin "baserom.gba", 0x15ef19, 0x40

IslandCave_EventScript_15EF59:: @ 815EF59
	lockall
	checkflag 2129
	jumpeq IslandCave_EventScript_15EF72
	braillemsg IslandCave_Braille_1C54FC
	special 280
	waitstate
	jump IslandCave_EventScript_15EF95
	end

IslandCave_EventScript_15EF72:: @ 815EF72
	msgbox IslandCave_Text_1A13BE, 4
	releaseall
	end

IslandCave_EventScript_15EF7C:: @ 815EF7C
	lockall
	braillemsg IslandCave_Braille_1C54FC
	checkflag 2129
	jumpeq IslandCave_EventScript_15EF95
	special 280
	waitstate
	jump IslandCave_EventScript_15EF95
	end

IslandCave_EventScript_15EF95:: @ 815EF95
	waitbutton
	hidebox 0, 0, 29, 19
	releaseall
	end

IslandCave_EventScript_15EF9D:: @ 815EF9D
	lock
	faceplayer
	checksound
	pokecry SPECIES_REGICE, 2
	pause 40
	waitpokecry
	setwildbattle SPECIES_REGICE, 40, ITEM_NONE
	setflag 936
	setflag 2145
	special 313
	waitstate
	clearflag 2145
	release
	end

	.include "data/maps/scripts/AncientTomb.s"
	.include "data/maps/scripts/Underwater_Route134.s"
	.include "data/maps/scripts/Underwater_SealedChamber.s"
	.include "data/maps/scripts/SealedChamber_OuterRoom.s"
	.include "data/maps/scripts/SealedChamber_InnerRoom.s"
	.include "data/maps/scripts/ScorchedSlab.s"
	.include "data/maps/scripts/MagmaHideout_1F.s"
	.include "data/maps/scripts/MagmaHideout_B1F.s"
	.include "data/maps/scripts/MagmaHideout_B2F.s"
	.include "data/maps/scripts/SkyPillar_Entrance.s"
	.include "data/maps/scripts/SkyPillar_Outside.s"
	.include "data/maps/scripts/SkyPillar_1F.s"
	.include "data/maps/scripts/SkyPillar_2F.s"
	.include "data/maps/scripts/SkyPillar_3F.s"
	.include "data/maps/scripts/SkyPillar_4F.s"
	.include "data/maps/scripts/ShoalCave_LowTideIceRoom.s"
	.include "data/maps/scripts/SkyPillar_5F.s"
	.include "data/maps/scripts/SkyPillar_Top.s"
	.include "data/maps/scripts/SecretBase_BlueCave1.s"
	.include "data/maps/scripts/SecretBase_BlueCave2.s"
	.include "data/maps/scripts/SecretBase_BlueCave3.s"
	.include "data/maps/scripts/SecretBase_BlueCave4.s"
	.include "data/maps/scripts/SecretBase_BrownCave1.s"
	.include "data/maps/scripts/SecretBase_BrownCave2.s"
	.include "data/maps/scripts/SecretBase_BrownCave3.s"
	.include "data/maps/scripts/SecretBase_BrownCave4.s"
	.include "data/maps/scripts/SecretBase_RedCave1.s"
	.include "data/maps/scripts/SecretBase_RedCave2.s"
	.include "data/maps/scripts/SecretBase_RedCave3.s"
	.include "data/maps/scripts/SecretBase_RedCave4.s"
	.include "data/maps/scripts/SecretBase_Shrub1.s"
	.include "data/maps/scripts/SecretBase_Shrub2.s"
	.include "data/maps/scripts/SecretBase_Shrub3.s"
	.include "data/maps/scripts/SecretBase_Shrub4.s"
	.include "data/maps/scripts/SecretBase_Tree1.s"
	.include "data/maps/scripts/SecretBase_Tree2.s"
	.include "data/maps/scripts/SecretBase_Tree3.s"
	.include "data/maps/scripts/SecretBase_Tree4.s"
	.include "data/maps/scripts/SecretBase_YellowCave1.s"
	.include "data/maps/scripts/SecretBase_YellowCave2.s"
	.include "data/maps/scripts/SecretBase_YellowCave3.s"
	.include "data/maps/scripts/SecretBase_YellowCave4.s"
	.global gUnknown_0815F36C
gUnknown_0815F36C: @ 815F36C
	.incbin "baserom.gba", 0x0015f36c, 0x2d

	.global gUnknown_0815F399
gUnknown_0815F399: @ 815F399
	.incbin "baserom.gba", 0x0015f399, 0xa1

	.global gUnknown_0815F43A
gUnknown_0815F43A: @ 815F43A
	.incbin "baserom.gba", 0x0015f43a, 0x60

	.global gUnknown_0815F49A
gUnknown_0815F49A: @ 815F49A
	.incbin "baserom.gba", 0x0015f49a, 0x89

	.global gUnknown_0815F523
gUnknown_0815F523: @ 815F523
	.incbin "baserom.gba", 0x0015f523, 0x5

	.global gUnknown_0815F528
gUnknown_0815F528: @ 815F528

	.incbin "baserom.gba", 0x15f528, 0x54

	.include "data/maps/scripts/SingleBattleColosseum.s"
	.include "data/maps/scripts/TradeCenter.s"
	.include "data/maps/scripts/RecordCorner.s"
	.include "data/maps/scripts/DoubleBattleColosseum.s"
	.include "data/maps/scripts/LinkContestRoom1.s"
	.include "data/maps/scripts/LinkContestRoom2.s"
	.include "data/maps/scripts/LinkContestRoom3.s"
	.include "data/maps/scripts/LinkContestRoom4.s"
	.include "data/maps/scripts/LinkContestRoom5.s"
	.include "data/maps/scripts/LinkContestRoom6.s"
	.include "data/maps/scripts/UnknownMap_25_29.s"
	.include "data/maps/scripts/UnknownMap_25_30.s"
	.include "data/maps/scripts/UnknownMap_25_31.s"
	.include "data/maps/scripts/UnknownMap_25_32.s"
	.include "data/maps/scripts/UnknownMap_25_33.s"
	.include "data/maps/scripts/UnknownMap_25_34.s"
	.include "data/maps/scripts/InsideOfTruck.s"
	.include "data/maps/scripts/SSTidalCorridor.s"
	.global gUnknown_0815FD0D
gUnknown_0815FD0D: @ 815FD0D

	.incbin "baserom.gba", 0x15fd0d, 0x17

SSTidalCorridor_EventScript_15FD24:: @ 815FD24
	special 204
	setvar 0x40b4, 3
	lockall
	playsfx 73
	msgbox SSTidalCorridor_Text_199088, 4
	releaseall
	end

SSTidalCorridor_EventScript_15FD3A:: @ 815FD3A
	special 204
	setvar 0x40b4, 8
	lockall
	playsfx 73
	msgbox SSTidalCorridor_Text_1990B4, 4
	releaseall
	end

SSTidalRooms_EventScript_15FD50:: @ 815FD50
	special 204
	setvar 0x40b4, 8
	playsfx 73
	msgbox SSTidalRooms_Text_1990B4, 4
	return

SSTidalRooms_EventScript_15FD64:: @ 815FD64
	switch 0x40b4
	case 2, SSTidalRooms_EventScript_15FCF9
	case 3, SSTidalRooms_EventScript_15FCF9
	case 6, SSTidalRooms_EventScript_15FCE5
	case 7, SSTidalRooms_EventScript_15FD50
	return

SSTidalCorridor_EventScript_15FD96:: @ 815FD96
	msgbox SSTidalCorridor_Text_199291, 2
	end

SSTidalCorridor_EventScript_15FD9F:: @ 815FD9F
	lock
	faceplayer
	checksound
	pokecry SPECIES_WINGULL, 0
	msgbox SSTidalCorridor_Text_199388, 4
	waitpokecry
	release
	end

SSTidalCorridor_EventScript_15FDB2:: @ 815FDB2
	msgbox SSTidalCorridor_Text_1993A1, 3
	end

SSTidalCorridor_EventScript_15FDBB:: @ 815FDBB
	msgbox SSTidalCorridor_Text_1993A9, 3
	end

SSTidalCorridor_EventScript_15FDC4:: @ 815FDC4
	msgbox SSTidalCorridor_Text_1993B1, 3
	end

SSTidalCorridor_EventScript_15FDCD:: @ 815FDCD
	msgbox SSTidalCorridor_Text_1993B9, 3
	end

SSTidalCorridor_EventScript_15FDD6:: @ 815FDD6
	lock
	faceplayer
	compare 0x40b4, 4
	jumpeq SSTidalCorridor_EventScript_15FDF8
	compare 0x40b4, 8
	jumpeq SSTidalCorridor_EventScript_15FE17
	msgbox SSTidalCorridor_Text_19913B, 4
	release
	end

SSTidalCorridor_EventScript_15FDF8:: @ 815FDF8
	sethealplace 8
	msgbox SSTidalCorridor_Text_1991F4, 4
	checkflag 260
	callif 1, SSTidalCorridor_EventScript_15FE36
	warp LilycoveCity_Harbor, 255, 8, 11
	waitstate
	release
	end

SSTidalCorridor_EventScript_15FE17:: @ 815FE17
	sethealplace 4
	msgbox SSTidalCorridor_Text_1991F4, 4
	checkflag 260
	callif 1, SSTidalCorridor_EventScript_15FE36
	warp SlateportCity_Harbor, 255, 8, 11
	waitstate
	release
	end

SSTidalCorridor_EventScript_15FE36:: @ 815FE36
	setflag 951
	return

SSTidalCorridor_EventScript_15FE3A:: @ 815FE3A
	lockall
	compare 0x40b4, 2
	jumpeq SSTidalCorridor_EventScript_15FE5B
	compare 0x40b4, 7
	jumpeq SSTidalCorridor_EventScript_15FE5B
	msgbox SSTidalCorridor_Text_199268, 4
	releaseall
	end

SSTidalCorridor_EventScript_15FE5B:: @ 815FE5B
	special 270
	waitstate
	end

SSTidalCorridor_EventScript_15FE60:: @ 815FE60
	lock
	faceplayer
	checkflag 247
	jumpeq SSTidalCorridor_EventScript_15FE7A
	call SSTidalCorridor_EventScript_15FE84
	msgbox SSTidalCorridor_Text_199203, 4
	release
	end

SSTidalCorridor_EventScript_15FE7A:: @ 815FE7A
	msgbox SSTidalCorridor_Text_199255, 4
	release
	end

SSTidalCorridor_EventScript_15FE84:: @ 815FE84
	checktrainerflag 494
	jumpif 0, SSTidalCorridor_EventScript_15FED5
	checktrainerflag 495
	jumpif 0, SSTidalCorridor_EventScript_15FED5
	checktrainerflag 294
	jumpif 0, SSTidalCorridor_EventScript_15FED5
	checktrainerflag 255
	jumpif 0, SSTidalCorridor_EventScript_15FED5
	checktrainerflag 256
	jumpif 0, SSTidalCorridor_EventScript_15FED5
	checktrainerflag 641
	jumpif 0, SSTidalCorridor_EventScript_15FED5
	checktrainerflag 138
	jumpif 0, SSTidalCorridor_EventScript_15FED5
	checktrainerflag 119
	jumpif 0, SSTidalCorridor_EventScript_15FED5
	setflag 247
	jump SSTidalCorridor_EventScript_15FE7A

	.incbin "baserom.gba", 0x15fed4, 0x1

SSTidalCorridor_EventScript_15FED5:: @ 815FED5
	return

	.include "data/maps/scripts/SSTidalLowerDeck.s"
	.include "data/maps/scripts/SSTidalRooms.s"
	.include "data/maps/scripts/SafariZone_Northwest.s"
	.include "data/maps/scripts/SafariZone_Northeast.s"
	.include "data/maps/scripts/SafariZone_Southwest.s"
	.include "data/maps/scripts/SafariZone_Southeast.s"
	.include "data/maps/scripts/BattleTower_Outside.s"
	.include "data/maps/scripts/BattleTower_Lobby.s"
	.include "data/maps/scripts/BattleTower_Elevator.s"
	.include "data/maps/scripts/BattleTower_Corridor.s"
	.include "data/maps/scripts/BattleTower_BattleRoom.s"
	.include "data/maps/scripts/SouthernIsland_Exterior.s"
BattleTower_Outside_Movement_160B45:: @ 8160B45
	step_down
	step_end

BattleTower_Outside_Movement_160B47:: @ 8160B47
	step_left
	step_25
	step_end

SouthernIsland_Exterior_EventScript_160B4A:: @ 8160B4A
	msgbox SouthernIsland_Exterior_Text_1C52FB, 3
	end

	.include "data/maps/scripts/SouthernIsland_Interior.s"
	.include "data/maps/scripts/SafariZone_RestHouse.s"
	.include "data/maps/scripts/Route104_Prototype.s"
	.include "data/maps/scripts/Route104_PrototypePrettyPetalFlowerShop.s"
	.include "data/maps/scripts/Route109_SeashoreHouse.s"
	.include "data/maps/scripts/Route110_TrickHouseEntrance.s"
Route110_TrickHouseEnd_Movement_161315:: @ 8161315
Route110_TrickHouseEntrance_Movement_161315:: @ 8161315
	step_01
	step_12
	step_02
	step_12
	step_00
	step_12
	step_03
	step_12
	step_end

Route110_TrickHouseEnd_Movement_16131E:: @ 816131E
Route110_TrickHouseEntrance_Movement_16131E:: @ 816131E
	step_01
	step_52
	step_32
	step_32
	step_32
	step_32
	step_32
	step_32
	step_end

Route110_TrickHouseEntrance_EventScript_161327:: @ 8161327
	msgbox Route110_TrickHouseEntrance_Text_19BCFD, 4
	return

Route110_TrickHouseEntrance_EventScript_161330:: @ 8161330
	msgbox Route110_TrickHouseEntrance_Text_19BF19, 4
	closebutton
	move 1, Route110_TrickHouseEntrance_Movement_1A0839
	waitmove 0
	playsfx 21
	move 1, Route110_TrickHouseEntrance_Movement_1A0833
	waitmove 0
	move 1, Route110_TrickHouseEntrance_Movement_1A0835
	waitmove 0
	msgbox Route110_TrickHouseEntrance_Text_19BFAB, 4
	move 1, Route110_TrickHouseEntrance_Movement_1A0841
	waitmove 0
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_16136E:: @ 816136E
	move 1, Route110_TrickHouseEntrance_Movement_1A0839
	waitmove 0
	msgbox Route110_TrickHouseEntrance_Text_19C07E, 4
	compare 0x4044, 1
	jumpeq Route110_TrickHouseEntrance_EventScript_1613CE
	compare 0x4044, 2
	jumpeq Route110_TrickHouseEntrance_EventScript_1613FA
	compare 0x4044, 3
	jumpeq Route110_TrickHouseEntrance_EventScript_161426
	compare 0x4044, 4
	jumpeq Route110_TrickHouseEntrance_EventScript_161452
	compare 0x4044, 5
	jumpeq Route110_TrickHouseEntrance_EventScript_16147E
	compare 0x4044, 6
	jumpeq Route110_TrickHouseEntrance_EventScript_1614AA
	compare 0x4044, 7
	jumpeq Route110_TrickHouseEntrance_EventScript_1614D6
	end

Route110_TrickHouseEntrance_EventScript_1613CE:: @ 81613CE
	giveitem ITEM_RARE_CANDY
	compare RESULT, 1
	jumpeq Route110_TrickHouseEntrance_EventScript_161502
	compare RESULT, 0
	callif 1, Route110_TrickHouseEntrance_EventScript_1A02A5
	msgbox Route110_TrickHouseEntrance_Text_19C0FC, 4
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_1613FA:: @ 81613FA
	giveitem ITEM_TIMER_BALL
	compare RESULT, 1
	jumpeq Route110_TrickHouseEntrance_EventScript_161502
	compare RESULT, 0
	callif 1, Route110_TrickHouseEntrance_EventScript_1A02A5
	msgbox Route110_TrickHouseEntrance_Text_19C0FC, 4
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_161426:: @ 8161426
	giveitem ITEM_HARD_STONE
	compare RESULT, 1
	jumpeq Route110_TrickHouseEntrance_EventScript_161502
	compare RESULT, 0
	callif 1, Route110_TrickHouseEntrance_EventScript_1A02A5
	msgbox Route110_TrickHouseEntrance_Text_19C0FC, 4
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_161452:: @ 8161452
	giveitem ITEM_SMOKE_BALL
	compare RESULT, 1
	jumpeq Route110_TrickHouseEntrance_EventScript_161502
	compare RESULT, 0
	callif 1, Route110_TrickHouseEntrance_EventScript_1A02A5
	msgbox Route110_TrickHouseEntrance_Text_19C0FC, 4
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_16147E:: @ 816147E
	giveitem ITEM_TM12
	compare RESULT, 1
	jumpeq Route110_TrickHouseEntrance_EventScript_161502
	compare RESULT, 0
	callif 1, Route110_TrickHouseEntrance_EventScript_1A02A5
	msgbox Route110_TrickHouseEntrance_Text_19C0FC, 4
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_1614AA:: @ 81614AA
	giveitem ITEM_MAGNET
	compare RESULT, 1
	jumpeq Route110_TrickHouseEntrance_EventScript_161502
	compare RESULT, 0
	callif 1, Route110_TrickHouseEntrance_EventScript_1A02A5
	msgbox Route110_TrickHouseEntrance_Text_19C0FC, 4
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_1614D6:: @ 81614D6
	giveitem ITEM_PP_MAX
	compare RESULT, 1
	jumpeq Route110_TrickHouseEntrance_EventScript_161502
	compare RESULT, 0
	callif 1, Route110_TrickHouseEntrance_EventScript_1A02A5
	msgbox Route110_TrickHouseEntrance_Text_19C0FC, 4
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_161502:: @ 8161502
	setvar 0x40c1, 0
	setvar 0x40a7, 3
	move 1, Route110_TrickHouseEntrance_Movement_1A0841
	waitmove 0
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_161518:: @ 8161518
	move 1, Route110_TrickHouseEntrance_Movement_1A0839
	waitmove 0
	msgbox Route110_TrickHouseEntrance_Text_19C128, 4
	givedecoration 31
	compare RESULT, 1
	jumpeq Route110_TrickHouseEntrance_EventScript_161551
	compare RESULT, 0
	callif 1, Route110_TrickHouseEntrance_EventScript_1A02B8
	msgbox Route110_TrickHouseEntrance_Text_19C18D, 4
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_161551:: @ 8161551
	msgbox Route110_TrickHouseEntrance_Text_19C17E, 4
	closebutton
	move 1, Route110_TrickHouseEntrance_Movement_16309F
	waitmove 0
	move 1, Route110_TrickHouseEntrance_Movement_161315
	waitmove 0
	playsfx 178
	move 1, Route110_TrickHouseEntrance_Movement_16131E
	waitmove 0
	disappear 1
	setvar 0x40c1, 0
	setvar 0x40a7, 5
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_16158A:: @ 816158A
	lockall
	switch 0x40a7
	case 0, Route110_TrickHouseEntrance_EventScript_1615BD
	case 1, Route110_TrickHouseEntrance_EventScript_1615C7
	case 4, Route110_TrickHouseEntrance_EventScript_1616B8
	case 5, Route110_TrickHouseEntrance_EventScript_1616C2
	end

Route110_TrickHouseEntrance_EventScript_1615BD:: @ 81615BD
	msgbox Route110_TrickHouseEntrance_Text_19BE6E, 4
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_1615C7:: @ 81615C7
	msgbox Route110_TrickHouseEntrance_Text_19BE7D, 5
	closebutton
	compare RESULT, 1
	jumpeq Route110_TrickHouseEntrance_EventScript_1615DD
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_1615DD:: @ 81615DD
	setmaptile 5, 1, 537, 0
	special 142
	pause 20
	move 255, Route110_TrickHouseEntrance_Movement_1A0856
	waitmove 0
	move 255, Route110_TrickHouseEntrance_Movement_16165E
	waitmove 0
	switch 0x4044
	case 0, Route110_TrickHouseEntrance_EventScript_161660
	case 1, Route110_TrickHouseEntrance_EventScript_16166B
	case 2, Route110_TrickHouseEntrance_EventScript_161676
	case 3, Route110_TrickHouseEntrance_EventScript_161681
	case 4, Route110_TrickHouseEntrance_EventScript_16168C
	case 5, Route110_TrickHouseEntrance_EventScript_161697
	case 6, Route110_TrickHouseEntrance_EventScript_1616A2
	case 7, Route110_TrickHouseEntrance_EventScript_1616AD
	end

Route110_TrickHouseEntrance_Movement_16165E:: @ 816165E
	step_54
	step_end

Route110_TrickHouseEntrance_EventScript_161660:: @ 8161660
	warp Route110_TrickHousePuzzle1, 255, 0, 21
	waitstate
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_16166B:: @ 816166B
	warp Route110_TrickHousePuzzle2, 255, 0, 21
	waitstate
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_161676:: @ 8161676
	warp Route110_TrickHousePuzzle3, 255, 0, 21
	waitstate
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_161681:: @ 8161681
	warp Route110_TrickHousePuzzle4, 255, 0, 21
	waitstate
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_16168C:: @ 816168C
	warp Route110_TrickHousePuzzle5, 255, 0, 21
	waitstate
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_161697:: @ 8161697
	warp Route110_TrickHousePuzzle6, 255, 0, 21
	waitstate
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_1616A2:: @ 81616A2
	warp Route110_TrickHousePuzzle7, 255, 0, 21
	waitstate
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_1616AD:: @ 81616AD
	warp Route110_TrickHousePuzzle8, 255, 0, 21
	waitstate
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_1616B8:: @ 81616B8
	msgbox Route110_TrickHouseEntrance_Text_19BEB3, 4
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_1616C2:: @ 81616C2
	compare 0x4044, 8
	jumpeq Route110_TrickHouseEntrance_EventScript_1616D7
	msgbox Route110_TrickHouseEntrance_Text_19BE6E, 4
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_1616D7:: @ 81616D7
	msgbox Route110_TrickHouseEntrance_Text_19BEB3, 4
	releaseall
	end

	.global gUnknown_081616E1
gUnknown_081616E1: @ 81616E1

	.incbin "baserom.gba", 0x1616e1, 0x1b1

Route110_TrickHousePuzzle1_EventScript_161892:: @ 8161892
Route110_TrickHousePuzzle2_EventScript_161892:: @ 8161892
Route110_TrickHousePuzzle3_EventScript_161892:: @ 8161892
Route110_TrickHousePuzzle4_EventScript_161892:: @ 8161892
Route110_TrickHousePuzzle5_EventScript_161892:: @ 8161892
Route110_TrickHousePuzzle6_EventScript_161892:: @ 8161892
Route110_TrickHousePuzzle7_EventScript_161892:: @ 8161892
Route110_TrickHousePuzzle8_EventScript_161892:: @ 8161892
	msgbox Route110_TrickHousePuzzle1_Text_19C1FF, 4
	releaseall
	end

Route110_TrickHousePuzzle1_EventScript_16189C:: @ 816189C
Route110_TrickHousePuzzle2_EventScript_16189C:: @ 816189C
Route110_TrickHousePuzzle3_EventScript_16189C:: @ 816189C
Route110_TrickHousePuzzle4_EventScript_16189C:: @ 816189C
Route110_TrickHousePuzzle5_EventScript_16189C:: @ 816189C
Route110_TrickHousePuzzle6_EventScript_16189C:: @ 816189C
Route110_TrickHousePuzzle7_EventScript_16189C:: @ 816189C
Route110_TrickHousePuzzle8_EventScript_16189C:: @ 816189C
	fanfare 370
	message Route110_TrickHousePuzzle1_Text_19C1B8
	waitfanfare
	waittext
	msgbox Route110_TrickHousePuzzle1_Text_19C1CB, 4
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_1618B0:: @ 81618B0
	lockall
	msgbox Route110_TrickHouseEntrance_Text_19BA56, 4
	releaseall
	compare 0x4044, 0
	callif 1, Route110_TrickHouseEntrance_EventScript_1618E1
	compare 0x4044, 1
	callif 1, Route110_TrickHouseEntrance_EventScript_1618F6
	compare 0x4044, 2
	callif 1, Route110_TrickHouseEntrance_EventScript_16190B
	setvar 0x40a5, 1
	end

Route110_TrickHouseEntrance_EventScript_1618E1:: @ 81618E1
	setvar 0x8004, 6
	setvar 0x8005, 3
	setvar 0x8006, 0
	call Route110_TrickHouseEntrance_EventScript_161920
	return

Route110_TrickHouseEntrance_EventScript_1618F6:: @ 81618F6
	setvar 0x8004, 11
	setvar 0x8005, 5
	setvar 0x8006, 0
	call Route110_TrickHouseEntrance_EventScript_161920
	return

Route110_TrickHouseEntrance_EventScript_16190B:: @ 816190B
	setvar 0x8004, 9
	setvar 0x8005, 2
	setvar 0x8006, 0
	call Route110_TrickHouseEntrance_EventScript_161920
	return

Route110_TrickHouseEntrance_EventScript_161920:: @ 8161920
	setanimation 0, 32772
	setanimation 1, 32773
	setanimation 2, 32774
	doanimation 54
	checkanimation 54
	pause 10
	return

	.include "data/maps/scripts/Route110_TrickHouseEnd.s"
	.include "data/maps/scripts/Route110_TrickHouseCorridor.s"
	.include "data/maps/scripts/Route110_TrickHousePuzzle1.s"
	.include "data/maps/scripts/Route110_TrickHousePuzzle2.s"
	.include "data/maps/scripts/Route110_TrickHousePuzzle3.s"
	.include "data/maps/scripts/Route110_TrickHousePuzzle4.s"
	.include "data/maps/scripts/Route110_TrickHousePuzzle5.s"
Route110_TrickHouseEntrance_Movement_16309F:: @ 816309F
Route110_TrickHousePuzzle5_Movement_16309F:: @ 816309F
	step_02
	step_11
	step_03
	step_11
	step_02
	step_11
	step_03
	step_11
	step_02
	step_11
	step_03
	step_11
	step_02
	step_11
	step_03
	step_11
	step_02
	step_11
	step_03
	step_11
	step_02
	step_11
	step_03
	step_11
	step_02
	step_11
	step_03
	step_11
	step_02
	step_11
	step_03
	step_11
	step_02
	step_11
	step_03
	step_11
	step_02
	step_11
	step_03
	step_11
	step_02
	step_11
	step_03
	step_11
	step_00
	step_end

	.include "data/maps/scripts/Route110_TrickHousePuzzle6.s"
	.include "data/maps/scripts/Route110_TrickHousePuzzle7.s"
	.include "data/maps/scripts/Route110_TrickHousePuzzle8.s"
	.include "data/maps/scripts/Route110_SeasideCyclingRoadSouthEntrance.s"
	.include "data/maps/scripts/Route110_SeasideCyclingRoadNorthEntrance.s"
	.include "data/maps/scripts/Route113_GlassWorkshop.s"
	.include "data/maps/scripts/Route123_BerryMastersHouse.s"
	.include "data/maps/scripts/Route119_WeatherInstitute_1F.s"
	.include "data/maps/scripts/Route119_WeatherInstitute_2F.s"
	.include "data/maps/scripts/Route119_House.s"
	.include "data/maps/scripts/Route124_DivingTreasureHuntersHouse.s"
	.include "data/maps/text/PetalburgCity.s"
	.include "data/maps/text/SlateportCity.s"
	.include "data/maps/text/MauvilleCity.s"
	.include "data/maps/text/RustboroCity.s"
	.include "data/maps/text/FortreeCity.s"
	.include "data/maps/text/LilycoveCity.s"
	.include "data/maps/text/MossdeepCity.s"
	.include "data/maps/text/SootopolisCity.s"
	.include "data/maps/text/EverGrandeCity.s"
	.include "data/maps/text/LittlerootTown.s"
	.include "data/maps/text/OldaleTown.s"
	.include "data/maps/text/DewfordTown.s"
	.include "data/maps/text/Route104.s"
DewfordTown_Text_16B3BC:: @ 816B3BC
	.string "MR. BRINEY: Have you delivered your\n"
	.string "LETTER?\p"
	.string "Or were you meaning to sail back to\n"
	.string "PETALBURG?$"

DewfordTown_Text_16B417:: @ 816B417
	.string "MR. BRINEY: PETALBURG it is, then!\p"
	.string "Anchors aweigh!\n"
	.string "PEEKO, we’re setting sail, my darling!$"

DewfordTown_Text_16B471:: @ 816B471
	.string "MR. BRINEY: Then you go on and deliver\n"
	.string "the LETTER. I’ll be waiting.$"

Route104_Text_16B4B5:: @ 816B4B5
	.include "data/maps/text/Route109.s"
DewfordTown_Text_16B522:: @ 816B522
	.string "MR. BRINEY: Ahoy!\n"
	.string "For you, I’ll go out to sea anytime!\p"
	.string "Now, my friend, where are we bound?$"

DewfordTown_Text_16B57D:: @ 816B57D
	.string "MR. BRINEY: PETALBURG, is it?\p"
	.string "Anchors aweigh!\n"
	.string "PEEKO, we’re setting sail, my darling!$"

DewfordTown_Text_16B5D2:: @ 816B5D2
	.string "MR. BRINEY: SLATEPORT, is it?\p"
	.string "Anchors aweigh!\n"
	.string "PEEKO, we’re setting sail, my darling!$"

DewfordTown_Text_16B627:: @ 816B627
	.string "MR. BRINEY: Just tell me whenever you\n"
	.string "want to set sail again.$"

DewfordTown_Text_16B665:: @ 816B665
	.string "This is a renowned fishing spot.\n"
	.string "Are you getting the itch to fish?$"

DewfordTown_Text_16B6A8:: @ 816B6A8
	.string "I hear you, and I like what\n"
	.string "you’re saying!\p"
	.string "I’ll give you one of my fishing RODS.$"

DewfordTown_Text_16B6F9:: @ 816B6F9
	.string "And, as an added bonus, I’ll even throw\n"
	.string "in a little fishing advice!\p"
	.string "First, you want to face the water,\n"
	.string "then use the ROD.\p"
	.string "Focus your mind...\n"
	.string "If you get a bite, pull on the ROD.\p"
	.string "Sometimes you can snag something\n"
	.string "immediately, but with bigger catches,\l"
	.string "you need to time the pulls on your ROD\l"
	.string "to haul them in.$"

DewfordTown_Text_16B828:: @ 816B828
	.string "Oh, is that so?\n"
	.string "That’s too bad, then.$"

DewfordTown_Text_16B84E:: @ 816B84E
	.string "Yo!\n"
	.string "How’s your fishing?$"

DewfordTown_Text_16B866:: @ 816B866
	.string "Is that right! That’s great!\n"
	.string "Haul in some big ones!$"

DewfordTown_Text_16B89A:: @ 816B89A
	.string "Oh, hey, don’t get down on yourself!\n"
	.string "I’ll give you a little fishing advice.\p"
	.string "First, you want to face the water,\n"
	.string "then use the ROD.\p"
	.string "Focus your mind...\n"
	.string "If you get a bite, pull the ROD.\p"
	.string "Sometimes you can snag something\n"
	.string "immediately, but with bigger catches,\l"
	.string "you need to time the pulls on your ROD\l"
	.string "to haul them in.$"

DewfordTown_Text_16B9CE:: @ 816B9CE
	.string "I like what’s hip, happening, and trendy.\n"
	.string "I’m always checking it out.\p"
	.string "Listen, have you heard about this new\n"
	.string "“{STR_VAR_1}”?\p"
	.string "That’s right!\n"
	.string "Of course you know!\p"
	.string "I mean, sheesh,\n"
	.string "“{STR_VAR_1}”...\l"
	.string "It’s the hottest thing in cool!\p"
	.string "Wherever you’re from,\n"
	.string "“{STR_VAR_1}”\l"
	.string "is the biggest happening thing, right?$"

DewfordTown_Text_16BADC:: @ 816BADC
	.string "Hunh?\n"
	.string "It’s not the hip and happening thing?\p"
	.string "Well, hey, you have to tell me,\n"
	.string "what’s new and what’s “in”?$"

DewfordTown_Text_16BB44:: @ 816BB44
	.string "Hunh?\n"
	.string "“{STR_VAR_2}”?\p"
	.string "... ...\p"
	.string "...Uh... Yeah! That’s right!\n"
	.string "Yeah, I knew that! Knew it all along!\p"
	.string "Of course I know about that!\n"
	.string "“{STR_VAR_2},” right?\p"
	.string "Yeah, that’s it, it’s there!\n"
	.string "Isn’t “{STR_VAR_2}”\l"
	.string "the coolest, or what?\p"
	.string "It’s the hippest thing in hip.\n"
	.string "You think I’d not know about it?\p"
	.string "“{STR_VAR_1}”...\n"
	.string "It’s, like, so five minutes ago.\p"
	.string "Now, “{STR_VAR_2}” is\n"
	.string "what’s vital and in tune with the times!$"

DewfordTown_Text_16BCA2:: @ 816BCA2
	.string "Hmm...\n"
	.string "“{STR_VAR_2},” huh?\p"
	.string "But personally, I think\n"
	.string "“{STR_VAR_1}”\l"
	.string "is what’s real in cool.$"

DewfordTown_Text_16BCE9:: @ 816BCE9
	.string "Well, if you hear of any happening new\n"
	.string "trends, come share them with me, okay?$"

DewfordTown_Text_16BD37:: @ 816BD37
	.string "Yeah, absolutely right!\p"
	.string "“{STR_VAR_1}” is the\n"
	.string "definition of “in” right now.$"

	.incbin "baserom.gba", 0x16bd79, 0x2b

	.include "data/maps/text/LavaridgeTown.s"
	.include "data/maps/text/FallarborTown.s"
	.include "data/maps/text/VerdanturfTown.s"
	.include "data/maps/text/PacifidlogTown.s"
	.include "data/maps/text/Route101.s"
PetalburgCity_Text_16D361:: @ 816D361
	.string "WALLY: {PLAYER}...\n"
	.string "POKéMON hide in tall grass like this,\l"
	.string "don’t they?\p"
	.string "Please watch me and see if I can\n"
	.string "catch one properly.\p"
	.string "...Whoa!$"

PetalburgCity_Text_16D3DE:: @ 816D3DE
	.string "WALLY: I did it... It’s my...\n"
	.string "My POKéMON!$"

PetalburgCity_Text_16D408:: @ 816D408
	.string "{PLAYER}, thank you!\n"
	.string "Let’s go back to the GYM!$"

	.include "data/maps/text/Route102.s"
	.include "data/maps/text/Route103.s"
Route104_Text_16DA13:: @ 816DA13
	.string "That seaside cottage is where\n"
	.string "MR. BRINEY lives.\p"
	.string "He was once a mighty sailor who never\n"
	.string "feared the sea, however stormy.$"

Route104_Text_16DA89:: @ 816DA89
	.string "The sea, huh?\p"
	.string "I wonder what it’s like at the bottom\n"
	.string "of the sea?$"

Route104_Text_16DAC9:: @ 816DAC9
	.string "If you’re going to throw a POKé BALL,\n"
	.string "weaken the wild POKéMON first.\p"
	.string "It will be easier to catch if it’s been\n"
	.string "poisoned, burned, or lulled to sleep.$"

Route104_Text_16DB5C:: @ 816DB5C
	.string "You’re a thief if you try to steal\n"
	.string "someone else’s POKéMON.\p"
	.string "You should throw POKé BALLS only at\n"
	.string "wild POKéMON.$"

Route104_Text_16DBC9:: @ 816DBC9
	.string "Oh, no, I’m not a TRAINER.\p"
	.string "But that’s right, if TRAINERS lock eyes,\n"
	.string "it’s a challenge to battle.\p"
	.string "If you don’t want to battle, stay out\n"
	.string "of their sight.$"

Route104_Text_16DC5F:: @ 816DC5F
	.string "I like filling my mouth with seeds,\n"
	.string "then spitting them out fast!\p"
	.string "You can have this, so you try it out!\p"
	.string "Use it on a POKéMON, and it will learn\n"
	.string "a move for firing seeds rapidly.$"

Route104_Text_16DD0E:: @ 816DD0E
	.string "A word of advice!\p"
	.string "A TM, TECHNICAL MACHINE, is good only\n"
	.string "for one-time use.\p"
	.string "Once you use it, it’s gone.\n"
	.string "Think twice before using it!$"

Route104_Text_16DD91:: @ 816DD91
	.string "This FLOWER SHOP started selling\n"
	.string "saplings recently.\p"
	.string "It made me so happy, I went overboard\n"
	.string "shopping. I don’t need this WHITE HERB\l"
	.string "anymore. Would you take it, please?$"

Route104_Text_16DE36:: @ 816DE36
	.string "This FLOWER SHOP started selling\n"
	.string "saplings recently.\p"
	.string "It made me so happy, I went overboard\n"
	.string "shopping. Where should I put them?$"

Route104_Text_16DEB3:: @ 816DEB3
	.string "MR. BRINEY’S COTTAGE$"

Route104_Text_16DEC8:: @ 816DEC8
	.string "ROUTE 1O4\n"
	.string "{0x7C} PETALBURG CITY$"

Route104_Text_16DEE3:: @ 816DEE3
	.string "ROUTE 1O4\n"
	.string "{0x79} RUSTBORO CITY$"

Route104_Text_16DEFD:: @ 816DEFD
	.string "PRETTY PETAL FLOWER SHOP$"

Route104_Text_16DF16:: @ 816DF16
	.string "TRAINER TIPS\p"
	.string "In the HOENN region there are pairs\n"
	.string "of TRAINERS who challenge others\l"
	.string "for 2-on-2 POKéMON battles called\l"
	.string "DOUBLE BATTLES.\p"
	.string "In a DOUBLE BATTLE, the TRAINER must\n"
	.string "send out two POKéMON, the one at the\l"
	.string "left of the list and the top one.\l"
	.string "Watch how POKéMON are lined up.$"

	.include "data/maps/text/Route106.s"
DewfordTown_Text_16E080:: @ 816E080
	.string "MR. BRINEY: Ahoy!\n"
	.string "We’ve made land in SLATEPORT!\p"
	.string "I suppose you’re going to visit CAPT.\n"
	.string "STERN and deliver the DEVON GOODS?$"

Route109_Text_16E0F9:: @ 816E0F9
	.string "MR. BRINEY: Aren’t you delivering the\n"
	.string "DEVON GOODS?\p"
	.string "Or were you meaning to sail back to\n"
	.string "DEWFORD?$"

Route109_Text_16E159:: @ 816E159
	.string "MR. BRINEY: DEWFORD it is, then!\p"
	.string "Anchors aweigh!\n"
	.string "PEEKO, we’re setting sail, my darling!$"

Route109_Text_16E1B1:: @ 816E1B1
	.string "MR. BRINEY: Then you go on and deliver\n"
	.string "the DEVON GOODS. I’ll be waiting.$"

DewfordTown_Text_16E1FA:: @ 816E1FA
	.string "MR. BRINEY: Ahoy! We’ve made land in\n"
	.string "SLATEPORT!\p"
	.string "You just go on and tell me whenever\n"
	.string "you want to set sail again!$"

Route109_Text_16E26A:: @ 816E26A
	.string "MR. BRINEY: Ahoy!\n"
	.string "For you, I’ll go out to sea anytime!\p"
	.string "Now, my friend, where are we bound?$"

Route109_Text_16E2C5:: @ 816E2C5
	.string "MR. BRINEY: You just tell me whenever\n"
	.string "you need to set sail again!$"

Route109_Text_16E307:: @ 816E307
	.string "Yo, TRAINERS!\n"
	.string "Whether you’re hot to trot,\l"
	.string "or cool cat not,\l"
	.string "chill at my papa’s spot!$"

Route109_Text_16E35B:: @ 816E35B
	.string "Little kids can dart around so quickly...\p"
	.string "You don’t dare take your eyes off them\n"
	.string "for an instant. It’s very taxing.\p"
	.string "Mine’s with my POKéMON, so they should\n"
	.string "be okay, but...$"

Route109_Text_16E405:: @ 816E405
	.string "Our sand castle’s taking a long time\n"
	.string "to make.$"

Route109_Text_16E433:: @ 816E433
	.string "You can have this!$"

Route109_Text_16E446:: @ 816E446
	.string "We’re going to get all the sand from\n"
	.string "the beach and make a big castle!\p"
	.string "And then we’re going to be a king and\n"
	.string "queen.\p"
	.string "We’ll let you be a servant.$"

Route109_Text_16E4D5:: @ 816E4D5
	.string "The water around these parts is clean.\p"
	.string "But, I get my ZIGZAGOON to pick up\n"
	.string "litter from the shoreline at times.\p"
	.string "Dirty water becomes rain and joins our\n"
	.string "rivers, which we drink from...\p"
	.string "If we pollute the sea, it all comes\n"
	.string "back to haunt us eventually.$"

Route109_Text_16E5CA:: @ 816E5CA
	.string "ZIGZAGOON: Guguu?$"

Route109_Text_16E5DC:: @ 816E5DC
	.string "SEASHORE HOUSE\p"
	.string "“May hot battles rage on hot sands!\n"
	.string "The place for hot TRAINERS!”$"

Route109_Text_16E62C:: @ 816E62C
	.string "TRAINER TIPS\p"
	.string "POKéMON at the same level may not\n"
	.string "always have identical stats.\p"
	.string "POKéMON raised by TRAINERS are said\n"
	.string "to grow stronger than wild POKéMON.$"

	.include "data/maps/text/Route110.s"
	.include "data/maps/text/Route111.s"
	.include "data/maps/text/Route112.s"
	.include "data/maps/text/Route113.s"
	.include "data/maps/text/Route114.s"
	.include "data/maps/text/Route115.s"
	.include "data/maps/text/Route116.s"
	.include "data/maps/text/Route117.s"
	.include "data/maps/text/Route118.s"
	.include "data/maps/text/Route119.s"
	.include "data/maps/text/Route120.s"
Route119_Text_171B93:: @ 8171B93
Route120_Text_171B93:: @ 8171B93
	.string "Something unseeable is in the way.$"

Route119_Text_171BB6:: @ 8171BB6
	.string "Something unseeable is in the way.\p"
	.string "Want to use the DEVON SCOPE?$"

Route119_Text_171BF6:: @ 8171BF6
	.string "{PLAYER} used the DEVON SCOPE.\p"
	.string "An invisible POKéMON became completely\n"
	.string "visible!\p"
	.string "The startled POKéMON attacked!$"

Route120_Text_171C5E:: @ 8171C5E
	.string "ROUTE 120\n"
	.string "{0x7B} FORTREE CITY$"

Route120_Text_171C77:: @ 8171C77
	.string "{0x7C} ROUTE 121\n"
	.string "{0x7B} ROUTE 120$"

	.include "data/maps/text/Route121.s"
	.include "data/maps/text/Route123.s"
	.include "data/maps/text/Route124.s"
	.include "data/maps/text/Route128.s"
	.include "data/maps/text/LittlerootTown_BrendansHouse_1F.s"
	.include "data/maps/text/LittlerootTown_MaysHouse_1F.s"
LittlerootTown_BrendansHouse_1F_Text_1725A3:: @ 81725A3
	.string "MOM: Oh! {PLAYER}, {PLAYER}!\n"
	.string "Quick! Come quickly!$"

LittlerootTown_BrendansHouse_1F_Text_1725C9:: @ 81725C9
LittlerootTown_MaysHouse_1F_Text_1725C9:: @ 81725C9
	.string "MOM: Look! It’s PETALBURG GYM!\n"
	.string "Maybe DAD will be on!$"

LittlerootTown_BrendansHouse_1F_Text_1725FE:: @ 81725FE
LittlerootTown_MaysHouse_1F_Text_1725FE:: @ 81725FE
	.string "MOM: Oh... It’s over.\p"
	.string "I think DAD was on, but we missed him.\n"
	.string "Too bad.$"

LittlerootTown_BrendansHouse_1F_Text_172644:: @ 8172644
LittlerootTown_MaysHouse_1F_Text_172644:: @ 8172644
	.string "Oh, yes.\n"
	.string "One of DAD’s friends lives in town.\p"
	.string "PROF. BIRCH is his name.\p"
	.string "He lives right next door, so you should\n"
	.string "go over and introduce yourself.$"

LittlerootTown_BrendansHouse_1F_Text_1726D2:: @ 81726D2
	.string "MOM: See you, honey!$"

LittlerootTown_BrendansHouse_1F_Text_1726E7:: @ 81726E7
	.string "MOM: Did you introduce yourself to\n"
	.string "PROF. BIRCH?$"

LittlerootTown_BrendansHouse_1F_Text_172717:: @ 8172717
	.string "MOM: How are you doing, {PLAYER}?\n"
	.string "You look a little tired.\p"
	.string "I think you should rest a bit.$"

LittlerootTown_BrendansHouse_1F_Text_17276B:: @ 817276B
	.string "MOM: Take care, honey!$"

LittlerootTown_BrendansHouse_1F_Text_172782:: @ 8172782
	.string "MOM: Oh? Did DAD give you that BADGE?\p"
	.string "Then here’s something from your MOM!$"

LittlerootTown_BrendansHouse_1F_Text_1727CD:: @ 81727CD
	.string "Don’t push yourself too hard, dear.\n"
	.string "You can always come home.\p"
	.string "Go for it, honey!$"

LittlerootTown_BrendansHouse_1F_Text_17281D:: @ 817281D
	.string "Gyao, gyao gyaoh...$"

LittlerootTown_BrendansHouse_1F_Text_172831:: @ 8172831
	.string "Gwagwah gwah...$"

LittlerootTown_BrendansHouse_1F_Text_172841:: @ 8172841
	.string "INTERVIEWER: ...We brought you this\n"
	.string "report from in front of PETALBURG GYM.$"

	.incbin "baserom.gba", 0x17288c, 0xff

LittlerootTown_BrendansHouse_1F_Text_17298B:: @ 817298B
	.string "DAD: Hm?\p"
	.string "Hey, it’s {PLAYER}!\p"
	.string "It’s been a while since I saw you,\n"
	.string "but you look...stronger, somehow.\p"
	.string "That’s the impression I get.\n"
	.string "But your old man hasn’t given up yet!\p"
	.string "Oh, yes, I have something for you.\n"
	.string "This came to you from someone named\l"
	.string "MR. BRINEY.$"

LittlerootTown_BrendansHouse_1F_Text_172A7D:: @ 8172A7D
	.string "DAD: Hm, a TICKET for a ferry?\p"
	.string "If I recall, there are ferry ports in\n"
	.string "SLATEPORT and LILYCOVE.\p"
	.string "{PLAYER}, if you have ambition as a\n"
	.string "TRAINER, go to the BATTLE TOWER.\p"
	.string "It should teach you that there is\n"
	.string "no end to a TRAINER’s chosen path.$"

LittlerootTown_BrendansHouse_1F_Text_172B5E:: @ 8172B5E
	.string "I’d better get back to PETALBURG GYM.\p"
	.string "MOM, thanks for looking after the house\n"
	.string "while I’m away.$"

LittlerootTown_BrendansHouse_1F_Text_172BBC:: @ 8172BBC
	.string "MOM: That DAD of yours...\p"
	.string "He comes home for the first time in a\n"
	.string "while, but all he talks about is POKéMON.\p"
	.string "He should relax and stay a little longer.$"

	.incbin "baserom.gba", 0x172c50, 0x1c8

	.include "data/maps/text/LittlerootTown_BrendansHouse_2F.s"
LittlerootTown_BrendansHouse_1F_Text_1730C2:: @ 81730C2
LittlerootTown_MaysHouse_1F_Text_1730C2:: @ 81730C2
	.string "Oh, hello. And you are?\p"
	.string "... ... ... ... ... ... ... ... ...\n"
	.string "... ... ... ... ... ... ... ... ...\p"
	.string "Oh, you’re {PLAYER}{KUN}, our new next-door\n"
	.string "neighbor! Hi!\p"
	.string "We have a {STR_VAR_1} about the same\n"
	.string "age as you.\p"
	.string "Our {STR_VAR_1} was excited about making\n"
	.string "a new friend.\p"
	.string "Our {STR_VAR_1} is upstairs, I think.$"

LittlerootTown_BrendansHouse_1F_Text_1731C6:: @ 81731C6
	.string "Our {STR_VAR_1} is upstairs, I think.$"

LittlerootTown_BrendansHouse_1F_Text_1731E3:: @ 81731E3
	.string "Where has my husband gone?\n"
	.string "Just when {PLAYER}{KUN} is visiting, too...\p"
	.string "That man can never sit still for long...\n"
	.string "He might be at his LAB.$"

LittlerootTown_BrendansHouse_1F_Text_173262:: @ 8173262
	.string "Oh, {RIVAL} has gone out somewhere.\p"
	.string "Like father, like child.\n"
	.string "{RIVAL} can’t stay quietly at home.$"

LittlerootTown_BrendansHouse_1F_Text_1732B9:: @ 81732B9
	.string "I think it’s wonderful for people to\n"
	.string "travel with POKéMON.\p"
	.string "But you should go home every so often\n"
	.string "to let your mother know you’re okay.\p"
	.string "She might not say it, but I’m sure she\n"
	.string "worries about you, {PLAYER}{KUN}.$"

LittlerootTown_BrendansHouse_2F_Text_17337E:: @ 817337E
	.string "POKéMON fully restored!\n"
	.string "Items ready, and... Huh?$"

LittlerootTown_BrendansHouse_2F_Text_1733AF:: @ 81733AF
	.string "Huh?\n"
	.string "Who... Who are you?\p"
	.string "... ... ... ... ... ... ... ...\n"
	.string "... ... ... ... ... ... ... ...\p"
	.string "Oh, you’re {PLAYER}{KUN}.\n"
	.string "So your move was today.\p"
	.string "Um... I’m MAY.\n"
	.string "Glad to meet you!\p"
	.string "I...\n"
	.string "I have this dream of becoming friends\l"
	.string "with POKéMON all over the world.\p"
	.string "I... I heard about you, {PLAYER}{KUN}, from\n"
	.string "my dad, PROF. BIRCH.\p"
	.string "I was hoping that you would be nice,\n"
	.string "{PLAYER}{KUN}, and that we could be friends.\p"
	.string "Oh, this is silly, isn’t it?\n"
	.string "I... I’ve just met you, {PLAYER}{KUN}.\p"
	.string "Eheheh...\p"
	.string "Oh, no! I forgot!\p"
	.string "I was supposed to go help Dad catch\n"
	.string "some wild POKéMON!\p"
	.string "{PLAYER}{KUN}, I’ll catch you later!$"

LittlerootTown_BrendansHouse_2F_Text_1735C9:: @ 81735C9
	.string "POKéMON fully restored...\n"
	.string "Items all packed, and...$"

LittlerootTown_BrendansHouse_2F_Text_1735FC:: @ 81735FC
	.string "Hey!\n"
	.string "You...\p"
	.string "Who are you?\p"
	.string "Oh, you’re {PLAYER}, aren’t you?\n"
	.string "Moved in next door, right?\p"
	.string "I didn’t know that you’re a girl.\p"
	.string "Dad, PROF. BIRCH, said that our new\n"
	.string "next-door neighbor is a GYM LEADER’s\l"
	.string "kid, so I assumed you’d be a guy.\p"
	.string "My name’s BRENDAN.\n"
	.string "So, hi, neighbor!\p"
	.string "Huh? Hey, {PLAYER}, don’t you have\n"
	.string "a POKéMON?\p"
	.string "Do you want me to go catch you one?\p"
	.string "Aw, darn, I forgot...\p"
	.string "I’m supposed to go help my dad catch\n"
	.string "some wild POKéMON.\p"
	.string "Some other time, okay?$"

LittlerootTown_BrendansHouse_2F_Text_1737AE:: @ 81737AE
	.string "MAY: {PLAYER}{KUN}!\p"
	.string "I was just checking my POKéDEX.\p"
	.string "There’s still a lot of POKéMON that\n"
	.string "I’ve seen but haven’t caught.\p"
	.string "And there are many others that\n"
	.string "I think will evolve.\p"
	.string "I wonder where I should go catch\n"
	.string "some POKéMON next?$"

LittlerootTown_BrendansHouse_2F_Text_173883:: @ 8173883
	.string "MAY: I wonder where I should go catch\n"
	.string "some POKéMON next?\p"
	.string "Wouldn’t it be funny if we ran into each\n"
	.string "other, {PLAYER}{KUN}?$"

LittlerootTown_BrendansHouse_2F_Text_1738F2:: @ 81738F2
	.string "BRENDAN: Hey, it’s {PLAYER}.\p"
	.string "I was just checking out my POKéDEX.\p"
	.string "There are still many POKéMON that\n"
	.string "I need to catch, I know, but this\l"
	.string "is looking pretty good.\p"
	.string "Checking this POKéDEX out gives me\n"
	.string "the urge to hit the road again.$"

LittlerootTown_BrendansHouse_2F_Text_1739CC:: @ 81739CC
	.string "BRENDAN: I’m having a hard time deciding\n"
	.string "where I should catch POKéMON next.\p"
	.string "Hey, {PLAYER}, if I see you while I’m out\n"
	.string "catching POKéMON, I can pitch you a\l"
	.string "battle if you’d like.$"

	.incbin "baserom.gba", 0x173a76, 0xb3

	.include "data/maps/text/LittlerootTown_ProfessorBirchsLab.s"
	.include "data/maps/text/OldaleTown_House1.s"
	.include "data/maps/text/OldaleTown_House2.s"
	.include "data/maps/text/OldaleTown_PokemonCenter_1F.s"
	.include "data/maps/text/OldaleTown_Mart.s"
	.include "data/maps/text/DewfordTown_House1.s"
	.include "data/maps/text/DewfordTown_PokemonCenter_1F.s"
	.include "data/maps/text/DewfordTown_Gym.s"
	.include "data/maps/text/DewfordTown_Hall.s"
	.include "data/maps/text/DewfordTown_House2.s"
	.include "data/maps/text/LavaridgeTown_HerbShop.s"
	.include "data/maps/text/LavaridgeTown_Gym_1F.s"
	.include "data/maps/text/LavaridgeTown_House.s"
	.include "data/maps/text/LavaridgeTown_Mart.s"
	.include "data/maps/text/LavaridgeTown_PokemonCenter_1F.s"
	.include "data/maps/text/FallarborTown_Mart.s"
	.include "data/maps/text/FallarborTown_ContestLobby.s"
	.include "data/maps/text/FallarborTown_ContestHall.s"
	.include "data/maps/text/FallarborTown_PokemonCenter_1F.s"
	.include "data/maps/text/FallarborTown_House1.s"
	.include "data/maps/text/FallarborTown_House2.s"
	.include "data/maps/text/VerdanturfTown_ContestLobby.s"
	.include "data/maps/text/VerdanturfTown_ContestHall.s"
	.include "data/maps/text/VerdanturfTown_Mart.s"
	.include "data/maps/text/VerdanturfTown_PokemonCenter_1F.s"
	.include "data/maps/text/VerdanturfTown_WandasHouse.s"
	.include "data/maps/text/VerdanturfTown_FriendshipRatersHouse.s"
	.include "data/maps/text/VerdanturfTown_House.s"
	.include "data/maps/text/PacifidlogTown_PokemonCenter_1F.s"
	.include "data/maps/text/PacifidlogTown_House1.s"
	.include "data/maps/text/PacifidlogTown_House2.s"
	.include "data/maps/text/PacifidlogTown_House3.s"
	.include "data/maps/text/PacifidlogTown_House4.s"
	.include "data/maps/text/PacifidlogTown_House5.s"
	.include "data/maps/text/PetalburgCity_WallysHouse.s"
	.include "data/maps/text/PetalburgCity_Gym.s"
	.include "data/maps/text/PetalburgCity_House1.s"
	.include "data/maps/text/PetalburgCity_House2.s"
	.include "data/maps/text/PetalburgCity_PokemonCenter_1F.s"
	.include "data/maps/text/PetalburgCity_Mart.s"
	.include "data/maps/text/SlateportCity_SternsShipyard_1F.s"
	.include "data/maps/text/SlateportCity_SternsShipyard_2F.s"
	.include "data/maps/text/SlateportCity_ContestLobby.s"
	.include "data/maps/text/SlateportCity_ContestHall.s"
	.include "data/maps/text/SlateportCity_House1.s"
	.include "data/maps/text/SlateportCity_PokemonFanClub.s"
	.include "data/maps/text/SlateportCity_OceanicMuseum_1F.s"
	.include "data/maps/text/SlateportCity_OceanicMuseum_2F.s"
	.include "data/maps/text/SlateportCity_Harbor.s"
	.include "data/maps/text/SlateportCity_House2.s"
	.include "data/maps/text/SlateportCity_PokemonCenter_1F.s"
	.include "data/maps/text/SlateportCity_Mart.s"
	.include "data/maps/text/MauvilleCity_Gym.s"
	.include "data/maps/text/MauvilleCity_BikeShop.s"
	.include "data/maps/text/MauvilleCity_House1.s"
	.include "data/maps/text/MauvilleCity_GameCorner.s"
	.include "data/maps/text/MauvilleCity_House2.s"
	.include "data/maps/text/MauvilleCity_PokemonCenter_1F.s"
	.include "data/maps/text/MauvilleCity_PokemonCenter_2F.s"
	.include "data/maps/text/MauvilleCity_Mart.s"
	.include "data/maps/text/RustboroCity_DevonCorp_1F.s"
	.include "data/maps/text/RustboroCity_DevonCorp_2F.s"
	.include "data/maps/text/RustboroCity_DevonCorp_3F.s"
	.include "data/maps/text/RustboroCity_Gym.s"
	.include "data/maps/text/RustboroCity_PokemonSchool.s"
	.include "data/maps/text/RustboroCity_PokemonCenter_1F.s"
	.include "data/maps/text/RustboroCity_Mart.s"
	.include "data/maps/text/RustboroCity_Flat1_1F.s"
	.include "data/maps/text/RustboroCity_Flat1_2F.s"
	.include "data/maps/text/RustboroCity_House1.s"
	.include "data/maps/text/RustboroCity_CuttersHouse.s"
	.include "data/maps/text/RustboroCity_House2.s"
	.include "data/maps/text/RustboroCity_Flat2_1F.s"
	.include "data/maps/text/RustboroCity_Flat2_2F.s"
	.include "data/maps/text/RustboroCity_Flat2_3F.s"
	.include "data/maps/text/RustboroCity_House3.s"
	.include "data/maps/text/FortreeCity_House1.s"
	.include "data/maps/text/FortreeCity_Gym.s"
	.include "data/maps/text/FortreeCity_PokemonCenter_1F.s"
	.include "data/maps/text/FortreeCity_Mart.s"
	.include "data/maps/text/FortreeCity_House2.s"
	.include "data/maps/text/FortreeCity_House3.s"
	.include "data/maps/text/FortreeCity_House4.s"
	.include "data/maps/text/FortreeCity_House5.s"
	.include "data/maps/text/FortreeCity_DecorationShop.s"
	.include "data/maps/text/LilycoveCity_CoveLilyMotel_1F.s"
	.include "data/maps/text/LilycoveCity_CoveLilyMotel_2F.s"
	.include "data/maps/text/LilycoveCity_LilycoveMuseum_1F.s"
	.include "data/maps/text/LilycoveCity_LilycoveMuseum_2F.s"
	.include "data/maps/text/LilycoveCity_ContestLobby.s"
FallarborTown_ContestLobby_Text_188559:: @ 8188559
LilycoveCity_ContestLobby_Text_188559:: @ 8188559
	.string "We hope you will participate another\n"
	.string "time.$"

LilycoveCity_ContestLobby_Text_188584:: @ 8188584
	.string "Would you like to enter a CONTEST?$"

LilycoveCity_ContestLobby_Text_1885A7:: @ 81885A7
	.string "When four players are ready, connect\n"
	.string "over a Game Link cable, and register\l"
	.string "with me, please.\p"
	.string "Please choose the same CONTEST\n"
	.string "as your fellow contestants.\p"
	.string "The CONTEST begins as soon as all\n"
	.string "players register their entry.\p"
	.string "After that, the usual CONTEST rules\n"
	.string "apply.$"

	.incbin "baserom.gba", 0x1886a8, 0x34

LilycoveCity_ContestLobby_Text_1886DC:: @ 81886DC
	.string "Which CONTEST would you like to enter?$"

LilycoveCity_ContestLobby_Text_188703:: @ 8188703
	.string "Which POKéMON would you like to enter?$"

LilycoveCity_ContestLobby_Text_18872A:: @ 818872A
	.string "Transmitting...$"

LilycoveCity_ContestLobby_Text_18873A:: @ 818873A
	.string "Transmission error...$"

LilycoveCity_ContestLobby_Text_188750:: @ 8188750
	.string "You may have chosen a different\n"
	.string "CONTEST than another player.$"

LilycoveCity_ContestLobby_Text_18878D:: @ 818878D
	.string "You may have made a different\n"
	.string "choice than another player.$"

LilycoveCity_ContestLobby_Text_1887C7:: @ 81887C7
	.string "Please wait.\n"
	.string "Press the B Button to cancel...$"

LilycoveCity_ContestLobby_Text_1887F4:: @ 81887F4
	.string "We hope you will participate\n"
	.string "another time.$"

LilycoveCity_ContestLobby_Text_18881F:: @ 818881F
	.string "Transmission error.\n"
	.string "Please try again.$"

LilycoveCity_ContestLobby_Text_188845:: @ 8188845
	.string "Your POKéMON will be entered in\n"
	.string "the CONTEST.\p"
	.string "Your POKéMON is Entry No. {STR_VAR_2}.$"

	.incbin "baserom.gba", 0x188890, 0x36

LilycoveCity_ContestLobby_Text_1888C6:: @ 81888C6
	.string "The CONTEST will begin shortly.$"

	.incbin "baserom.gba", 0x1888e6, 0x29

LilycoveCity_ContestLobby_Text_18890F:: @ 818890F
	.string "Congratulations!\p"
	.string "I did a painting of your POKéMON to\n"
	.string "commemorate its victory...\p"
	.string "Well, your POKéMON’s appeals were\n"
	.string "so fantastic, it spurred me into\l"
	.string "painting better than I usually do.\l"
	.string "Look, see?$"

	.incbin "baserom.gba", 0x1889d0, 0x2d

LilycoveCity_ContestLobby_Text_1889FD:: @ 81889FD
	.string "What do you think? I’m confident in\n"
	.string "what I’ve done, but do you like it?\p"
	.string "A work of this caliber, it wouldn’t look\n"
	.string "out of place in an art museum.\p"
	.string "Huh? An art museum really is looking\n"
	.string "for paintings?\p"
	.string "Do you think I should take this there?$"

LilycoveCity_ContestLobby_Text_188AE8:: @ 8188AE8
	.string "What, really? Then, sure, I will take\n"
	.string "this painting there right now.\p"
	.string "I’ll give it a proper title, too.\p"
	.string "I hope they’ll like it and consider\n"
	.string "exhibiting this.\p"
	.string "Please check if they did accept this.\n"
	.string "Thank you!$"

LilycoveCity_ContestLobby_Text_188BB5:: @ 8188BB5
	.string "Oh, that’s right!\p"
	.string "As a memento of me painting your\n"
	.string "POKéMON, please take this.$"

LilycoveCity_ContestLobby_Text_188C03:: @ 8188C03
	.string "{PLAYER} received a RIBBON.$"

LilycoveCity_ContestLobby_Text_188C19:: @ 8188C19
	.string "{PLAYER} put the RIBBON on\n"
	.string "{STR_VAR_1}.$"

LilycoveCity_ContestLobby_Text_188C32:: @ 8188C32
	.string "Okay, see you!$"

LilycoveCity_ContestLobby_Text_188C41:: @ 8188C41
	.string "Oh... Then, I guess I’ll just take\n"
	.string "this home with me...\p"
	.string "But, you know, I would like to take\n"
	.string "this to the art museum... Okay?$"

LilycoveCity_ContestLobby_Text_188CBD:: @ 8188CBD
	.string "Oh, fine, that’s the way it is.\n"
	.string "I will hang this in my own house.\p"
	.string "I’ll just have to try harder next time.\n"
	.string "Well, be seeing you.$"

LilycoveCity_ContestLobby_Text_188D3C:: @ 8188D3C
	.string "Hoo, boy... Master Rank CONTESTS,\n"
	.string "here I come.\p"
	.string "The world will know that my dearest\n"
	.string "POKéMON is the cutest being in all\l"
	.string "existence. The time has come!\l"
	.string "Uheheheh.$"

LilycoveCity_ContestLobby_Text_188DDA:: @ 8188DDA
	.string "You can see a whole variety of\n"
	.string "POKéMON here.\p"
	.string "That’s why I make this place a regular\n"
	.string "part of my daily stroll.$"

LilycoveCity_ContestLobby_Text_188E47:: @ 8188E47
	.string "Oh, dear! They still haven’t given\n"
	.string "you a CONTEST PASS?\p"
	.string "You should go get one in VERDANTURF\n"
	.string "TOWN right away.\p"
	.string "It’s such a thrill having others see\n"
	.string "POKéMON that you’ve raised with care\l"
	.string "and love.$"

LilycoveCity_ContestLobby_Text_188F07:: @ 8188F07
	.string "When you get up to the Master Rank\n"
	.string "CONTESTS, you get your eyes opened\l"
	.string "to striking POKéMON that just scream\l"
	.string "to be painted.$"

LilycoveCity_ContestLobby_Text_188F81:: @ 8188F81
	.string "The TOUGHNESS CONTEST is like\n"
	.string "extreme, man!\p"
	.string "Those muscular appeals...\n"
	.string "Cascading sweat... I swoon!$"

LilycoveCity_ContestLobby_Text_188FE3:: @ 8188FE3
	.string "Day in and day out, I lavished my care\n"
	.string "on this POKéMON.\p"
	.string "Its condition is peaking.\n"
	.string "Today, victory is mine!$"

LilycoveCity_ContestLobby_Text_18904D:: @ 818904D
	.string "I made {POKEBLOCK}S with Mom, Dad and\n"
	.string "Big Sister. They turned out great!\p"
	.string "I bet you can make smoother, better\n"
	.string "{POKEBLOCK}S if you have more people.$"

	.include "data/maps/text/LilycoveCity_ContestHall.s"
	.include "data/maps/text/LilycoveCity_PokemonCenter_1F.s"
	.include "data/maps/text/LilycoveCity_PokemonTrainerFanClub.s"
	.include "data/maps/text/LilycoveCity_Harbor.s"
	.include "data/maps/text/LilycoveCity_MoveDeletersHouse.s"
	.include "data/maps/text/LilycoveCity_House1.s"
	.include "data/maps/text/LilycoveCity_House2.s"
	.include "data/maps/text/LilycoveCity_House3.s"
	.include "data/maps/text/LilycoveCity_House4.s"
	.include "data/maps/text/LilycoveCity_DepartmentStore_1F.s"
	.include "data/maps/text/LilycoveCity_DepartmentStore_2F.s"
	.include "data/maps/text/LilycoveCity_DepartmentStore_3F.s"
	.include "data/maps/text/LilycoveCity_DepartmentStore_4F.s"
	.include "data/maps/text/LilycoveCity_DepartmentStore_5F.s"
	.include "data/maps/text/LilycoveCity_DepartmentStoreRooftop.s"
	.include "data/maps/text/MossdeepCity_Gym.s"
	.include "data/maps/text/MossdeepCity_House1.s"
	.include "data/maps/text/MossdeepCity_House2.s"
	.include "data/maps/text/MossdeepCity_PokemonCenter_1F.s"
	.include "data/maps/text/MossdeepCity_PokemonCenter_2F.s"
	.include "data/maps/text/MossdeepCity_Mart.s"
	.include "data/maps/text/MossdeepCity_House3.s"
	.include "data/maps/text/MossdeepCity_StevensHouse.s"
	.include "data/maps/text/MossdeepCity_House4.s"
	.include "data/maps/text/MossdeepCity_SpaceCenter_1F.s"
	.include "data/maps/text/MossdeepCity_SpaceCenter_2F.s"
	.include "data/maps/text/MossdeepCity_GameCorner_1F.s"
	.include "data/maps/text/MossdeepCity_GameCorner_B1F.s"
MossdeepCity_GameCorner_1F_Text_18E7B1:: @ 818E7B1
	.string "So, it became a standoff.\p"
	.string "It was a brilliant match in which\n"
	.string "neither side conceded a step!$"

	.incbin "baserom.gba", 0x18e80b, 0x3

MossdeepCity_GameCorner_1F_Text_18E80E:: @ 818E80E
	.string "That was superlative!\p"
	.string "Why, it was like seeing myself in my\n"
	.string "youth again!$"

	.incbin "baserom.gba", 0x18e856, 0x3

MossdeepCity_GameCorner_1F_Text_18E859:: @ 818E859
	.string "Ah, too bad for you!\p"
	.string "But it was a good match.\n"
	.string "I hope you can win next time.$"

	.include "data/maps/text/SootopolisCity_Gym_1F.s"
	.include "data/maps/text/SootopolisCity_Gym_B1F.s"
SootopolisCity_Gym_1F_Text_18F0CA:: @ 818F0CA
	.string "Allow me to formally introduce\n"
	.string "myself.\p"
	.string "I am WALLACE.\n"
	.string "The GYM LEADER of SOOTOPOLIS.\p"
	.string "There’s something about you...\n"
	.string "A difference in your demeanor.\p"
	.string "I think I sense that in you.\p"
	.string "What happened inside the CAVE OF\n"
	.string "ORIGIN, and what you did, I will likely\l"
	.string "learn through our upcoming battle.\p"
	.string "Now, show me. Show me the power you\n"
	.string "wield with your POKéMON.\p"
	.string "And I, in turn, shall present you with\n"
	.string "a performance of illusions in water\l"
	.string "by me and my POKéMON!$"

SootopolisCity_Gym_1F_Text_18F282:: @ 818F282
	.string "Bravo.\p"
	.string "I realize now your authenticity and\n"
	.string "magnificence as a POKéMON TRAINER.\p"
	.string "I find much joy in having met you and\n"
	.string "your POKéMON.\p"
	.string "You have proven yourself worthy of\n"
	.string "the RAIN BADGE. Accept it.$"

SootopolisCity_Gym_1F_Text_18F342:: @ 818F342
	.string "{PLAYER} received the RAIN BADGE\n"
	.string "from WALLACE.$"

SootopolisCity_Gym_1F_Text_18F36B:: @ 818F36B
	.string "Having that BADGE assures you the\n"
	.string "full obedience of all your POKéMON to\l"
	.string "every command you make.\p"
	.string "The BADGE also allows the use of the\n"
	.string "HM move WATERFALL to scale walls\l"
	.string "of cascading water.\p"
	.string "And, so that you never forget the\n"
	.string "battle we shared, take this...$"

SootopolisCity_Gym_1F_Text_18F466:: @ 818F466
	.string "The TM I handed you contains\n"
	.string "WATER PULSE.\p"
	.string "In use, it will occasionally confuse\n"
	.string "the target with ultrasonic waves.$"

SootopolisCity_Gym_1F_Text_18F4D7:: @ 818F4D7
	.string "TRAINERS who have gathered all the\n"
	.string "GYM BADGES of HOENN should make way\l"
	.string "for the ultimate destination.\p"
	.string "The POKéMON LEAGUE.\p"
	.string "Travel to the easternmost reaches\n"
	.string "of HOENN, to the island EVER GRANDE.\l"
	.string "The POKéMON LEAGUE is there.$"

SootopolisCity_Gym_1F_Text_18F5B4:: @ 818F5B4
	.string "There remains but one BADGE to\n"
	.string "obtain in HOENN.\p"
	.string "If you wish to challenge the POKéMON\n"
	.string "LEAGUE, you must obtain the last\l"
	.string "BADGE from the GYM in FORTREE.$"

SootopolisCity_Gym_1F_Text_18F649:: @ 818F649
	.string "SOOTOPOLIS CITY POKéMON GYM$"

SootopolisCity_Gym_1F_Text_18F665:: @ 818F665
	.string "SOOTOPOLIS CITY POKéMON GYM\p"
	.string "WALLACE’S CERTIFIED TRAINERS:\n"
	.string "{PLAYER}$"

	.include "data/maps/text/SootopolisCity_PokemonCenter_1F.s"
	.include "data/maps/text/SootopolisCity_Mart.s"
	.include "data/maps/text/SootopolisCity_House1.s"
	.include "data/maps/text/SootopolisCity_House2.s"
	.include "data/maps/text/SootopolisCity_House3.s"
	.include "data/maps/text/SootopolisCity_House4.s"
	.include "data/maps/text/SootopolisCity_House5.s"
	.include "data/maps/text/SootopolisCity_House6.s"
	.include "data/maps/text/SootopolisCity_House7.s"
	.include "data/maps/text/SootopolisCity_House8.s"
	.include "data/maps/text/EverGrandeCity_SidneysRoom.s"
	.include "data/maps/text/EverGrandeCity_PhoebesRoom.s"
	.include "data/maps/text/EverGrandeCity_GlaciasRoom.s"
	.include "data/maps/text/EverGrandeCity_DrakesRoom.s"
	.include "data/maps/text/EverGrandeCity_ChampionsRoom.s"
	.include "data/maps/text/EverGrandeCity_PokemonLeague.s"
	.include "data/maps/text/EverGrandeCity_HallOfFame.s"
	.include "data/maps/text/EverGrandeCity_PokemonCenter_1F.s"
	.include "data/maps/text/Route104_MrBrineysHouse.s"
	.include "data/maps/text/Route111_WinstrateFamilysHouse.s"
	.include "data/maps/text/Route111_OldLadysRestStop.s"
	.include "data/maps/text/Route112_CableCarStation.s"
	.include "data/maps/text/MtChimney_CableCarStation.s"
Route112_CableCarStation_Text_1925A9:: @ 81925A9
	.string "Please step this way.$"

MtChimney_CableCarStation_Text_1925BF:: @ 81925BF
	.string "Please ride with us another time.$"

	.include "data/maps/text/Route114_FossilManiacsHouse.s"
	.include "data/maps/text/Route114_FossilManiacsTunnel.s"
	.include "data/maps/text/Route114_LanettesHouse.s"
	.include "data/maps/text/Route116_TunnelersRestHouse.s"
	.include "data/maps/text/MeteorFalls_1F_1R.s"
	.include "data/maps/text/MeteorFalls_1F_2R.s"
	.include "data/maps/text/RusturfTunnel.s"
	.include "data/maps/text/GraniteCave_1F.s"
	.include "data/maps/text/GraniteCave_StevensRoom.s"
	.include "data/maps/text/PetalburgWoods.s"
	.include "data/maps/text/MtChimney.s"
	.include "data/maps/text/JaggedPass.s"
	.include "data/maps/text/MtPyre_1F.s"
	.include "data/maps/text/MtPyre_2F.s"
	.include "data/maps/text/MtPyre_3F.s"
	.include "data/maps/text/MtPyre_4F.s"
	.include "data/maps/text/MtPyre_5F.s"
	.include "data/maps/text/MtPyre_6F.s"
	.include "data/maps/text/AquaHideout_1F.s"
	.include "data/maps/text/AquaHideout_B1F.s"
	.include "data/maps/text/AquaHideout_B2F.s"
	.include "data/maps/text/Underwater_SeafloorCavern.s"
	.include "data/maps/text/SeafloorCavern_Room1.s"
	.include "data/maps/text/SeafloorCavern_Room3.s"
	.include "data/maps/text/SeafloorCavern_Room4.s"
	.include "data/maps/text/VictoryRoad_1F.s"
	.include "data/maps/text/VictoryRoad_B1F.s"
	.include "data/maps/text/VictoryRoad_B2F.s"
	.include "data/maps/text/ShoalCave_LowTideLowerRoom.s"
	.include "data/maps/text/NewMauville_Entrance.s"
	.include "data/maps/text/NewMauville_Inside.s"
	.include "data/maps/text/AbandonedShip_Corridors_1F.s"
	.include "data/maps/text/AbandonedShip_Rooms_1F.s"
	.include "data/maps/text/AbandonedShip_Corridors_B1F.s"
	.include "data/maps/text/AbandonedShip_HiddenFloorCorridors.s"
	.include "data/maps/text/AbandonedShip_Rooms_B1F.s"
	.include "data/maps/text/AbandonedShip_Rooms2_B1F.s"
	.include "data/maps/text/AbandonedShip_Rooms2_1F.s"
	.include "data/maps/text/AbandonedShip_CaptainsOffice.s"
AbandonedShip_HiddenFloorCorridors_Text_198DC0:: @ 8198DC0
	.string "The door is locked.\p"
	.string "“RM. 1” is painted on the door.$"

AbandonedShip_HiddenFloorCorridors_Text_198DF4:: @ 8198DF4
	.string "The door is locked.\p"
	.string "“RM. 2” is painted on the door.$"

AbandonedShip_HiddenFloorCorridors_Text_198E28:: @ 8198E28
	.string "The door is locked.\p"
	.string "“RM. 4” is painted on the door.$"

AbandonedShip_HiddenFloorCorridors_Text_198E5C:: @ 8198E5C
	.string "The door is locked.\p"
	.string "“RM. 6” is painted on the door.$"

AbandonedShip_HiddenFloorCorridors_Text_198E90:: @ 8198E90
	.string "{PLAYER} inserted and turned the\n"
	.string "KEY.\p"
	.string "The inserted KEY stuck fast, but the\n"
	.string "door opened.$"

	.include "data/maps/text/AbandonedShip_HiddenFloorRooms.s"
	.include "data/maps/text/SecretBase_RedCave1.s"
	.include "data/maps/text/InsideOfTruck.s"
	.include "data/maps/text/SSTidalCorridor.s"
	.include "data/maps/text/SSTidalRooms.s"
SSTidalCorridor_Text_199088:: @ 8199088
	.string "We hope you enjoy your voyage on\n"
	.string "our ferry.$"

SSTidalCorridor_Text_1990B4:: @ 81990B4
SSTidalRooms_Text_1990B4:: @ 81990B4
	.string "We have made land in SLATEPORT CITY.\n"
	.string "Thank you for sailing with us.$"

SSTidalRooms_Text_1990F8:: @ 81990F8
	.string "We have made land in LILYCOVE CITY.\n"
	.string "Thank you for sailing with us.$"

SSTidalCorridor_Text_19913B:: @ 819913B
	.string "It’ll be some time before we make land,\n"
	.string "I reckon.\p"
	.string "You can rest up in your cabin if you’d\n"
	.string "like. Your cabin’s No. 2.\p"
	.string "The bed in there is soft and plushy.\n"
	.string "I can attest to how comfy it is!$"

SSTidalCorridor_Text_1991F4:: @ 81991F4
	.string "We’ve arrived!$"

SSTidalCorridor_Text_199203:: @ 8199203
	.string "Go visit other cabins.\n"
	.string "TRAINERS bored of the boat trip will\l"
	.string "be itching to battle.$"

SSTidalCorridor_Text_199255:: @ 8199255
	.string "Enjoy your cruise!$"

SSTidalCorridor_Text_199268:: @ 8199268
	.string "The horizon spreads beyond the\n"
	.string "porthole.$"

SSTidalCorridor_Text_199291:: @ 8199291
	.string "MR. BRINEY: Welcome aboard, {PLAYER}{KUN}!\p"
	.string "They made me honorary captain of the\n"
	.string "S.S. TIDAL!\p"
	.string "You can call me CAPTAIN BRINEY now!\p"
	.string "You know, I retired once before, but\n"
	.string "when I saw this majestic ship...\p"
	.string "Let me just say, it stirred my sleeping\n"
	.string "soul as a sailor!$"

SSTidalCorridor_Text_199388:: @ 8199388
	.string "PEEKO: Pihyo pihyohyo...$"

SSTidalCorridor_Text_1993A1:: @ 81993A1
	.string "Cabin 1$"

SSTidalCorridor_Text_1993A9:: @ 81993A9
	.string "Cabin 2$"

SSTidalCorridor_Text_1993B1:: @ 81993B1
	.string "Cabin 3$"

SSTidalCorridor_Text_1993B9:: @ 81993B9
	.string "Cabin 4$"

	.include "data/maps/text/SSTidalLowerDeck.s"
SSTidalRooms_Text_19956B:: @ 819956B
	.string "It’s a bed.\n"
	.string "Let’s take a rest.$"

SSTidalRooms_Text_19958A:: @ 819958A
	.string "Go back and forth between LILYCOVE\n"
	.string "and SLATEPORT, that’s what I do.\p"
	.string "It’s my hobby - going from port to port\n"
	.string "to take in POKéMON CONTESTS.$"

SSTidalRooms_Text_199613:: @ 8199613
	.string "That was an enjoyable match!$"

SSTidalRooms_Text_199630:: @ 8199630
	.string "I get so excited imagining what kinds\n"
	.string "of POKéMON I’ll get to see in the next\l"
	.string "CONTEST. The anticipation of it thrills!$"

SSTidalRooms_Text_1996A6:: @ 81996A6
	.string "Are your friends strong?$"

SSTidalRooms_Text_1996BF:: @ 81996BF
	.string "Your friends are, indeed, strong.$"

SSTidalRooms_Text_1996E1:: @ 81996E1
	.string "Friends need not be human.\n"
	.string "For me, POKéMON are treasured friends!$"

SSTidalRooms_Text_199723:: @ 8199723
	.string "Child...\n"
	.string "Did you knock on the door?$"

SSTidalRooms_Text_199747:: @ 8199747
	.string "A loss is to be accepted without haste\n"
	.string "or panic.$"

SSTidalRooms_Text_199778:: @ 8199778
	.string "To be never ruffled in any situation is\n"
	.string "the GENTLEMAN’s code of conduct.$"

SSTidalRooms_Text_1997C1:: @ 81997C1
	.string "JED: I feel a little shy about this, but...\n"
	.string "We’ll show you our lovey-dovey power!$"

SSTidalRooms_Text_199813:: @ 8199813
	.string "JED: Sigh...$"

SSTidalRooms_Text_199820:: @ 8199820
	.string "JED: It’s the first time that our lovey-\n"
	.string "dovey power couldn’t prevail!\l"
	.string "You must be an awesome TRAINER!$"

SSTidalRooms_Text_199887:: @ 8199887
	.string "JED: You only have one POKéMON?\n"
	.string "Isn’t that just too lonesome?$"

SSTidalRooms_Text_1998C5:: @ 81998C5
	.string "LEA: I feel a little silly, but...\n"
	.string "We’ll show you our lovey-dovey power!$"

SSTidalRooms_Text_19990E:: @ 819990E
	.string "LEA: Oh, boo!$"

SSTidalRooms_Text_19991C:: @ 819991C
	.string "LEA: I can’t believe it!\n"
	.string "Our lovey-dovey power failed...\l"
	.string "You must be an awesome TRAINER!$"

SSTidalRooms_Text_199975:: @ 8199975
	.string "LEA: I wanted to battle...\n"
	.string "But you don’t even have two POKéMON...$"

SSTidalRooms_Text_1999B7:: @ 81999B7
	.string "Ah, you’ve come just in time.\p"
	.string "I’m bored, you see.\n"
	.string "You may entertain me.$"

SSTidalRooms_Text_1999FF:: @ 81999FF
	.string "...That will do.$"

SSTidalRooms_Text_199A10:: @ 8199A10
	.string "Perhaps I shall get Father to acquire\n"
	.string "a yacht for me.\l"
	.string "A yacht for me and POKéMON!$"

SSTidalRooms_Text_199A62:: @ 8199A62
	.string "Oh, you’re such an adorable TRAINER.\n"
	.string "Would you like to have tea?\l"
	.string "Or would you rather battle?$"

SSTidalRooms_Text_199ABF:: @ 8199ABF
	.string "I see.\n"
	.string "You’re the active sort.$"

SSTidalRooms_Text_199ADE:: @ 8199ADE
	.string "A world cruise on a luxury liner has its\n"
	.string "charms, I must say...\p"
	.string "But, I will admit there is an appealing\n"
	.string "side to touring HOENN by ferry.$"

SSTidalRooms_Text_199B65:: @ 8199B65
	.string "Uh... Hi! I... I’m not acting suspicious!\n"
	.string "Uh... You can have this! For free!\p"
	.string "It... Honestly, I didn’t SNATCH it from\n"
	.string "someone! I’d never do such a thing!\l"
	.string "It’s clean! You can use it!$"

SSTidalRooms_Text_199C1A:: @ 8199C1A
	.string "SNATCH steals the foe’s move in\n"
	.string "advance, and then uses the snatched\l"
	.string "move on the foe.$"

	.include "data/maps/text/BattleTower_Outside.s"
	.include "data/maps/text/BattleTower_Lobby.s"
	.include "data/maps/text/BattleTower_BattleRoom.s"
	.include "data/maps/text/Route104_Prototype.s"
	.include "data/maps/text/Route104_PrototypePrettyPetalFlowerShop.s"
	.include "data/maps/text/Route109_SeashoreHouse.s"
	.include "data/maps/text/Route110_TrickHouseEntrance.s"
	.include "data/maps/text/Route110_TrickHousePuzzle1.s"
	.include "data/maps/text/Route110_TrickHouseEnd.s"
Route110_TrickHousePuzzle1_Text_19CB4F:: @ 819CB4F
	.string "I’ll hack and slash my way to victory\n"
	.string "with the CUT we just learned!$"

Route110_TrickHousePuzzle1_Text_19CB93:: @ 819CB93
	.string "Why are you so serious?$"

Route110_TrickHousePuzzle1_Text_19CBAB:: @ 819CBAB
	.string "I never get tired of hacking\n"
	.string "and slashing!$"

Route110_TrickHousePuzzle1_Text_19CBD6:: @ 819CBD6
	.string "I wandered into this weird house\n"
	.string "by accident...$"

Route110_TrickHousePuzzle1_Text_19CC06:: @ 819CC06
	.string "And now I’ve lost...$"

Route110_TrickHousePuzzle1_Text_19CC1B:: @ 819CC1B
	.string "I lost my way, I lost a battle, and I’m\n"
	.string "even more lost... I can’t get out...$"

Route110_TrickHousePuzzle1_Text_19CC68:: @ 819CC68
	.string "Just who is the TRICK MASTER?$"

Route110_TrickHousePuzzle1_Text_19CC86:: @ 819CC86
	.string "I lost while I was lost in thought!$"

Route110_TrickHousePuzzle1_Text_19CCAA:: @ 819CCAA
	.string "You’re strong!\n"
	.string "Just who are you?$"

	.incbin "baserom.gba", 0x19cccb, 0x7b

	.include "data/maps/text/Route110_TrickHousePuzzle2.s"
	.include "data/maps/text/Route110_TrickHousePuzzle3.s"
	.include "data/maps/text/Route110_TrickHousePuzzle4.s"
	.include "data/maps/text/Route110_TrickHousePuzzle5.s"
	.include "data/maps/text/Route110_TrickHousePuzzle6.s"
	.include "data/maps/text/Route110_TrickHousePuzzle7.s"
	.include "data/maps/text/Route110_TrickHousePuzzle8.s"
	.include "data/maps/text/Route110_SeasideCyclingRoadSouthEntrance.s"
	.include "data/maps/text/Route110_SeasideCyclingRoadNorthEntrance.s"
Route110_SeasideCyclingRoadSouthEntrance_Text_19E3AD:: @ 819E3AD
	.string "Sorry, you can’t walk on CYCLING\n"
	.string "ROAD. It’s too dangerous.\p"
	.string "Please come back with a BIKE.$"

Route110_SeasideCyclingRoadNorthEntrance_Text_19E406:: @ 819E406
	.string "On CYCLING ROAD, you can go all out\n"
	.string "and cycle as fast as you’d like.\p"
	.string "It feels great to go that fast, but try\n"
	.string "not to crash into anyone!$"

	.incbin "baserom.gba", 0x19e48d, 0x59

	.include "data/maps/text/Route113_GlassWorkshop.s"
	.include "data/maps/text/Route119_WeatherInstitute_1F.s"
	.include "data/maps/text/Route119_WeatherInstitute_2F.s"
	.include "data/maps/text/Route119_House.s"
	.include "data/maps/text/Route124_DivingTreasureHuntersHouse.s"
	.incbin "baserom.gba", 0x19f7de, 0x28

BattleTower_Lobby_EventScript_19F806:: @ 819F806
FallarborTown_ContestLobby_EventScript_19F806:: @ 819F806
LilycoveCity_ContestLobby_EventScript_19F806:: @ 819F806
MossdeepCity_GameCorner_1F_EventScript_19F806:: @ 819F806
OldaleTown_PokemonCenter_2F_EventScript_19F806:: @ 819F806
SecretBase_RedCave1_EventScript_19F806:: @ 819F806
	special 93
	waitstate
	return

	.global gUnknown_0819F80B
gUnknown_0819F80B: @ 819F80B
	.incbin "baserom.gba", 0x0019f80b, 0xd

	.global gUnknown_0819F818
gUnknown_0819F818: @ 819F818
	.incbin "baserom.gba", 0x0019f818, 0x28

	.global gUnknown_0819F840
gUnknown_0819F840: @ 819F840
	.incbin "baserom.gba", 0x0019f840, 0x38

	.global gUnknown_0819F878
gUnknown_0819F878: @ 819F878
	.incbin "baserom.gba", 0x0019f878, 0xf

	.global gUnknown_0819F887
gUnknown_0819F887: @ 819F887
	.incbin "baserom.gba", 0x0019f887, 0x27

	.global gUnknown_0819F8AE
gUnknown_0819F8AE: @ 819F8AE
	.incbin "baserom.gba", 0x0019f8ae, 0x1d3

	.global gUnknown_0819FA81
gUnknown_0819FA81: @ 819FA81

	.incbin "baserom.gba", 0x19fa81, 0x192

EverGrandeCity_HallOfFame_EventScript_19FC13:: @ 819FC13
	clearflag 925
	call EverGrandeCity_HallOfFame_EventScript_19FD09
	setflag 869
	clearflag 950
	clearflag 727
	setvar 0x40c6, 1
	clearflag 751
	clearflag 860
	clearflag 861
	special 169
	checkflag 291
	callif 0, EverGrandeCity_HallOfFame_EventScript_19FC62
	checkflag 255
	callif 0, EverGrandeCity_HallOfFame_EventScript_19FC70
	checkflag 298
	callif 0, EverGrandeCity_HallOfFame_EventScript_19FC5A
	checkflag 123
	callif 0, EverGrandeCity_HallOfFame_EventScript_19FC5E
	return

EverGrandeCity_HallOfFame_EventScript_19FC5A:: @ 819FC5A
	clearflag 968
	return

EverGrandeCity_HallOfFame_EventScript_19FC5E:: @ 819FC5E
	clearflag 1133
	return

EverGrandeCity_HallOfFame_EventScript_19FC62:: @ 819FC62
	setvar 0x4082, 3
	setvar 0x408c, 3
	clearflag 734
	return

EverGrandeCity_HallOfFame_EventScript_19FC70:: @ 819FC70
	setflag 2141
	return

	.global gUnknown_0819FC74
gUnknown_0819FC74: @ 819FC74
	.incbin "baserom.gba", 0x0019fc74, 0x2b

	.global gUnknown_0819FC9F
gUnknown_0819FC9F: @ 819FC9F

	.incbin "baserom.gba", 0x19fc9f, 0x6a

EverGrandeCity_HallOfFame_EventScript_19FD09:: @ 819FD09
	clearflag 1245
	clearflag 1246
	clearflag 1247
	clearflag 1248
	setvar 0x409c, 0
	return

DewfordTown_PokemonCenter_1F_EventScript_19FD1B:: @ 819FD1B
FallarborTown_PokemonCenter_1F_EventScript_19FD1B:: @ 819FD1B
LavaridgeTown_PokemonCenter_1F_EventScript_19FD1B:: @ 819FD1B
MauvilleCity_PokemonCenter_1F_EventScript_19FD1B:: @ 819FD1B
OldaleTown_PokemonCenter_1F_EventScript_19FD1B:: @ 819FD1B
PetalburgCity_PokemonCenter_1F_EventScript_19FD1B:: @ 819FD1B
RustboroCity_PokemonCenter_1F_EventScript_19FD1B:: @ 819FD1B
SlateportCity_PokemonCenter_1F_EventScript_19FD1B:: @ 819FD1B
VerdanturfTown_PokemonCenter_1F_EventScript_19FD1B:: @ 819FD1B
	checkflag 188
	jumpif 0, OldaleTown_PokemonCenter_1F_EventScript_1A14DC
	checkflag 1217
	jumpeq OldaleTown_PokemonCenter_1F_EventScript_1A14DC
	checkflag 742
	jumpif 0, OldaleTown_PokemonCenter_1F_EventScript_19FD49
	checkflag 740
	jumpif 0, OldaleTown_PokemonCenter_1F_EventScript_19FD4F
	checkflag 741
	jumpif 0, OldaleTown_PokemonCenter_1F_EventScript_19FD55
	return

OldaleTown_PokemonCenter_1F_EventScript_19FD49:: @ 819FD49
	setvar 0x4096, 1
	return

OldaleTown_PokemonCenter_1F_EventScript_19FD4F:: @ 819FD4F
	setvar 0x4096, 2
	return

OldaleTown_PokemonCenter_1F_EventScript_19FD55:: @ 819FD55
	setvar 0x4096, 3
	return

DewfordTown_PokemonCenter_1F_EventScript_19FD5B:: @ 819FD5B
EverGrandeCity_PokemonLeague_EventScript_19FD5B:: @ 819FD5B
FallarborTown_PokemonCenter_1F_EventScript_19FD5B:: @ 819FD5B
FortreeCity_PokemonCenter_1F_EventScript_19FD5B:: @ 819FD5B
LavaridgeTown_PokemonCenter_1F_EventScript_19FD5B:: @ 819FD5B
LilycoveCity_PokemonCenter_1F_EventScript_19FD5B:: @ 819FD5B
MauvilleCity_PokemonCenter_1F_EventScript_19FD5B:: @ 819FD5B
MossdeepCity_PokemonCenter_1F_EventScript_19FD5B:: @ 819FD5B
OldaleTown_PokemonCenter_1F_EventScript_19FD5B:: @ 819FD5B
PetalburgCity_PokemonCenter_1F_EventScript_19FD5B:: @ 819FD5B
RustboroCity_PokemonCenter_1F_EventScript_19FD5B:: @ 819FD5B
SlateportCity_PokemonCenter_1F_EventScript_19FD5B:: @ 819FD5B
SootopolisCity_PokemonCenter_1F_EventScript_19FD5B:: @ 819FD5B
VerdanturfTown_PokemonCenter_1F_EventScript_19FD5B:: @ 819FD5B
	lock
	faceplayer
	msgbox OldaleTown_PokemonCenter_1F_Text_1A0A7D, 5
	compare RESULT, 1
	jumpeq OldaleTown_PokemonCenter_1F_EventScript_19FD7C
	compare RESULT, 0
	jumpeq OldaleTown_PokemonCenter_1F_EventScript_19FDC7
	end

OldaleTown_PokemonCenter_1F_EventScript_19FD7C:: @ 819FD7C
	inccounter 15
	message OldaleTown_PokemonCenter_1F_Text_1A1245
	waittext
	move 0x800b, OldaleTown_PokemonCenter_1F_Movement_1A083F
	waitmove 0
	doanimation 25
	checkanimation 25
	move 0x800b, OldaleTown_PokemonCenter_1F_Movement_1A0845
	waitmove 0
	special 0
	checkflag 273
	jumpif 0, OldaleTown_PokemonCenter_1F_EventScript_19FDCE
	jump OldaleTown_PokemonCenter_1F_EventScript_19FDB0
	end

OldaleTown_PokemonCenter_1F_EventScript_19FDB0:: @ 819FDB0
	message OldaleTown_PokemonCenter_1F_Text_1A0B14
	waittext
	move 0x800b, OldaleTown_PokemonCenter_1F_Movement_19FDF4
	waitmove 0
	message OldaleTown_PokemonCenter_1F_Text_1A0AFA
	waittext
	return

OldaleTown_PokemonCenter_1F_EventScript_19FDC7:: @ 819FDC7
	message OldaleTown_PokemonCenter_1F_Text_1A0AFA
	waittext
	return

OldaleTown_PokemonCenter_1F_EventScript_19FDCE:: @ 819FDCE
	specialval RESULT, 308
	compare RESULT, 1
	jumpeq OldaleTown_PokemonCenter_1F_EventScript_19FDEA
	compare RESULT, 0
	jumpeq OldaleTown_PokemonCenter_1F_EventScript_19FDB0
	end

OldaleTown_PokemonCenter_1F_EventScript_19FDEA:: @ 819FDEA
	message OldaleTown_PokemonCenter_1F_Text_1A1275
	waittext
	setflag 273
	return

OldaleTown_PokemonCenter_1F_Movement_19FDF4:: @ 819FDF4
	step_4f
	step_12
	step_end

Std_ObtainItem: @ 819FDF7
	additem 0x8000, 0x8001
	copyvar 0x8007, RESULT
	call Std_ObtainItem_
	return

Std_ObtainItem_: @ 819FE07
	bufferitem 1, 0x8000
	checkitemtype 0x8000
	call GetItem_HandlePocket
	compare 0x8007, 0x1
	callif 1, Std_ObtainItem_Success
	compare 0x8007, 0x0
	callif 1, Std_ObtainItem_Fail
	return

GetItem_HandlePocket:
	switch RESULT
	case POCKET_ITEMS,      GetItem_HandlePocket_Items
	case POCKET_KEY_ITEMS,  GetItem_HandlePocket_KeyItems
	case POCKET_POKE_BALLS, GetItem_HandlePocket_PokeBalls
	case POCKET_TM_HM,      GetItem_HandlePocket_TMsHMs
	case POCKET_BERRIES,    GetItem_HandlePocket_Berries
	end

GetItem_HandlePocket_Items:
	bufferstd 2, 0xE
	compare 0x8007, 1
	callif 1, PlayGetItemFanfare
	return

GetItem_HandlePocket_KeyItems:
	bufferstd 2, 0xF
	compare 0x8007, 1
	callif 1, PlayGetItemFanfare
	return

GetItem_HandlePocket_PokeBalls:
	bufferstd 2, 0x10
	compare 0x8007, 1
	callif 1, PlayGetItemFanfare
	return

GetItem_HandlePocket_TMsHMs:
	bufferstd 2, 0x11
	compare 0x8007, 1
	callif 1, PlayGetTMHMFanfare
	return

GetItem_HandlePocket_Berries:
	bufferstd 2, 0x12
	compare 0x8007, 1
	callif 1, PlayGetItemFanfare
	return

Std_ObtainItem_Success: @ 819FEB7
	message Message_ObtainedItem
	waitfanfare
	waittext
	msgbox Message_PutAwayItem
	setvar RESULT, 1
	return

Std_ObtainItem_Fail: @ 819FECC
	setvar RESULT, 0
	return

PlayGetItemFanfare:
	fanfare 0x172
	return

PlayGetTMHMFanfare:
	fanfare 0x174
	return

Std_ObtainDecoration: @ 819FEDA
	adddecor 0x8000
	copyvar 0x8007, RESULT
	call Std_ObtainDecoration_
	return

Std_ObtainDecoration_: @ 819FEE8
	bufferdecor 1, 0x8000
	compare 0x8007, 1
	callif 1, Std_ObtainDecoration_Success
	compare 0x8007, 0
	callif 1, Std_ObtainDecoration_Fail
	return

Std_ObtainDecoration_Success: @ 819FF03
	fanfare 0x172
	message Message_ObtainedDecoration
	waitfanfare
	waittext
	msgbox Message_TransferredToPC
	setvar RESULT, 1
	return

Std_ObtainDecoration_Fail: @ 819FF1B
	setvar RESULT, 0
	return

Std_FindItem: @ 819FF21
	lock
	faceplayer
	checksound
	additem 0x8000, 0x8001
	copyvar 0x8007, RESULT
	bufferitem 1, 0x8000
	checkitemtype 0x8000
	call GetItem_HandlePocket
	compare 0x8007, 1
	callif 1, Std_FindItem_Success
	compare 0x8007, 0
	callif 1, Std_FindItem_Fail
	release
	return

Std_FindItem_Success: @ 819FF52
	disappear LAST_TALKED
	message Message_FoundOneItem
	waitfanfare
	waittext
	msgbox Message_PutAwayItem
	return

Std_FindItem_Fail: @ 819FF65
	msgbox Message_ObtainedItem
	msgbox Message_BagFull
	setvar RESULT, 0
	return

HiddenItemScript:: @ 819FF7B
	lockall
	checksound
	additem 0x8005, 1
	copyvar 0x8007, RESULT
	bufferitem 0x1, 0x8005
	checkitemtype 0x8005
	call GetItem_HandlePocket
	compare 0x8007, 1
	jumpeq HiddenItemScript_Success
	compare 0x8007, 0
	jumpeq HiddenItemScript_Fail
	end

HiddenItemScript_Success:
	message Message_FoundOneItem
	waitfanfare
	waittext
	msgbox Message_PutAwayItem
	special 0x96
	releaseall
	end

HiddenItemScript_Fail:
	msgbox Message_FoundOneItem
	msgbox Message_BagFull
	setvar RESULT, 0
	releaseall
	end

UnusedMixRecordsScript: @ 819FFD5
	lock
	faceplayer
	msgbox UnusedMixRecordsPromptText, 5
	compare RESULT, 1
	jumpeq UnusedMixRecordsScript_Yes
	compare RESULT, 0
	jumpeq UnusedMixRecordsScript_Done
	jump UnusedMixRecordsScript_Done
UnusedMixRecordsScript_Yes: @ 819FFFA
	special 0x1B
	waitstate
	lock
	faceplayer
UnusedMixRecordsScript_Done: @ 81A0000
	message UnusedMixRecordsSeeYouAgainText
	waittext
	waitbutton
	release
	end

	.global gUnknown_081A0009
gUnknown_081A0009: @ 81A0009
	.incbin "baserom.gba", 0x1a0009, 0xd8

FallarborTown_EventScript_1A00E1:: @ 81A00E1
FortreeCity_EventScript_1A00E1:: @ 81A00E1
LavaridgeTown_EventScript_1A00E1:: @ 81A00E1
MauvilleCity_EventScript_1A00E1:: @ 81A00E1
MossdeepCity_EventScript_1A00E1:: @ 81A00E1
OldaleTown_EventScript_1A00E1:: @ 81A00E1
PetalburgCity_EventScript_1A00E1:: @ 81A00E1
RustboroCity_EventScript_1A00E1:: @ 81A00E1
SlateportCity_EventScript_1A00E1:: @ 81A00E1
SootopolisCity_EventScript_1A00E1:: @ 81A00E1
VerdanturfTown_EventScript_1A00E1:: @ 81A00E1
	msgbox PetalburgCity_Text_1A0D41, 3
	end

DewfordTown_EventScript_1A00EA:: @ 81A00EA
EverGrandeCity_EventScript_1A00EA:: @ 81A00EA
FallarborTown_EventScript_1A00EA:: @ 81A00EA
FortreeCity_EventScript_1A00EA:: @ 81A00EA
LavaridgeTown_EventScript_1A00EA:: @ 81A00EA
LilycoveCity_EventScript_1A00EA:: @ 81A00EA
MauvilleCity_EventScript_1A00EA:: @ 81A00EA
MossdeepCity_EventScript_1A00EA:: @ 81A00EA
OldaleTown_EventScript_1A00EA:: @ 81A00EA
PacifidlogTown_EventScript_1A00EA:: @ 81A00EA
PetalburgCity_EventScript_1A00EA:: @ 81A00EA
RustboroCity_EventScript_1A00EA:: @ 81A00EA
SlateportCity_EventScript_1A00EA:: @ 81A00EA
SootopolisCity_EventScript_1A00EA:: @ 81A00EA
VerdanturfTown_EventScript_1A00EA:: @ 81A00EA
	msgbox PetalburgCity_Text_1A0D75, 3
	end

BattleTower_Lobby_EventScript_1A00F3:: @ 81A00F3
DewfordTown_EventScript_1A00F3:: @ 81A00F3
FallarborTown_ContestLobby_EventScript_1A00F3:: @ 81A00F3
MauvilleCity_PokemonCenter_1F_EventScript_1A00F3:: @ 81A00F3
PetalburgCity_PokemonCenter_1F_EventScript_1A00F3:: @ 81A00F3
Route111_EventScript_1A00F3:: @ 81A00F3
Route123_BerryMastersHouse_EventScript_1A00F3:: @ 81A00F3
SlateportCity_OceanicMuseum_1F_EventScript_1A00F3:: @ 81A00F3
SlateportCity_PokemonFanClub_EventScript_1A00F3:: @ 81A00F3
	fadescreen 1
	special 95
	fadescreen 0
	return

DewfordTown_Gym_EventScript_1A00FB:: @ 81A00FB
LavaridgeTown_Gym_1F_EventScript_1A00FB:: @ 81A00FB
MauvilleCity_Gym_EventScript_1A00FB:: @ 81A00FB
RustboroCity_Gym_EventScript_1A00FB:: @ 81A00FB
	clearflag 781
	setflag 296
	return

DewfordTown_EventScript_1A0102:: @ 81A0102
DewfordTown_Hall_EventScript_1A0102:: @ 81A0102
	checkdailyflags
	setvar 0x8004, 0
	special 126
	return

DewfordTown_EventScript_1A010C:: @ 81A010C
Route104_MrBrineysHouse_EventScript_1A010C:: @ 81A010C
Route109_EventScript_1A010C:: @ 81A010C
	copyvar 0x8008, 0x4096
	setvar 0x4096, 0
	return

	.global gUnknown_081A0117
gUnknown_081A0117: @ 81A0117

	.incbin "baserom.gba", 0x1a0117, 0x37

EverGrandeCity_ChampionsRoom_EventScript_1A014E:: @ 81A014E
LavaridgeTown_EventScript_1A014E:: @ 81A014E
LilycoveCity_EventScript_1A014E:: @ 81A014E
LittlerootTown_ProfessorBirchsLab_EventScript_1A014E:: @ 81A014E
OldaleTown_EventScript_1A014E:: @ 81A014E
Route103_EventScript_1A014E:: @ 81A014E
Route110_EventScript_1A014E:: @ 81A014E
Route119_EventScript_1A014E:: @ 81A014E
RustboroCity_EventScript_1A014E:: @ 81A014E
	checkgender
	compare RESULT, 0
	jumpeq RustboroCity_EventScript_1A0166
	compare RESULT, 1
	jumpeq RustboroCity_EventScript_1A016C
	end

RustboroCity_EventScript_1A0166:: @ 81A0166
	setvar 0x4010, 105
	return

RustboroCity_EventScript_1A016C:: @ 81A016C
	setvar 0x4010, 100
	return

LavaridgeTown_EventScript_1A0172:: @ 81A0172
Route110_EventScript_1A0172:: @ 81A0172
Route119_EventScript_1A0172:: @ 81A0172
	checkgender
	compare RESULT, 0
	jumpeq LavaridgeTown_EventScript_1A018A
	compare RESULT, 1
	jumpeq LavaridgeTown_EventScript_1A0190
	end

LavaridgeTown_EventScript_1A018A:: @ 81A018A
	setvar 0x4013, 106
	return

LavaridgeTown_EventScript_1A0190:: @ 81A0190
	setvar 0x4013, 101
	return

AquaHideout_1F_EventScript_1A0196:: @ 81A0196
AquaHideout_B1F_EventScript_1A0196:: @ 81A0196
AquaHideout_B2F_EventScript_1A0196:: @ 81A0196
LilycoveCity_EventScript_1A0196:: @ 81A0196
MeteorFalls_1F_1R_EventScript_1A0196:: @ 81A0196
MtChimney_EventScript_1A0196:: @ 81A0196
MtPyre_Summit_EventScript_1A0196:: @ 81A0196
PetalburgWoods_EventScript_1A0196:: @ 81A0196
Route110_EventScript_1A0196:: @ 81A0196
Route112_EventScript_1A0196:: @ 81A0196
Route113_EventScript_1A0196:: @ 81A0196
Route119_EventScript_1A0196:: @ 81A0196
Route119_WeatherInstitute_1F_EventScript_1A0196:: @ 81A0196
Route119_WeatherInstitute_2F_EventScript_1A0196:: @ 81A0196
Route121_EventScript_1A0196:: @ 81A0196
Route128_EventScript_1A0196:: @ 81A0196
RustboroCity_EventScript_1A0196:: @ 81A0196
RusturfTunnel_EventScript_1A0196:: @ 81A0196
SeafloorCavern_Room1_EventScript_1A0196:: @ 81A0196
SeafloorCavern_Room3_EventScript_1A0196:: @ 81A0196
SeafloorCavern_Room4_EventScript_1A0196:: @ 81A0196
SeafloorCavern_Room9_EventScript_1A0196:: @ 81A0196
SlateportCity_OceanicMuseum_2F_EventScript_1A0196:: @ 81A0196
	setvar 0x4011, 119
	setvar 0x4012, 120
	setvar 0x4014, 117
	setvar 0x4015, 118
	setvar 0x4016, 196
	setvar 0x4017, 195
	return

CaveOfOrigin_B4F_EventScript_1A01B5:: @ 81A01B5
SeafloorCavern_Room9_EventScript_1A01B5:: @ 81A01B5
	setvar 0x4018, 198
	setvar 0x4019, 206
	return

DewfordTown_Gym_EventScript_1A01C0:: @ 81A01C0
FortreeCity_Gym_EventScript_1A01C0:: @ 81A01C0
LavaridgeTown_Gym_1F_EventScript_1A01C0:: @ 81A01C0
MauvilleCity_Gym_EventScript_1A01C0:: @ 81A01C0
MossdeepCity_Gym_EventScript_1A01C0:: @ 81A01C0
PetalburgCity_Gym_EventScript_1A01C0:: @ 81A01C0
RustboroCity_Gym_EventScript_1A01C0:: @ 81A01C0
SootopolisCity_Gym_1F_EventScript_1A01C0:: @ 81A01C0
	switch 0x8008
	case 1, DewfordTown_Gym_EventScript_1A021E
	case 2, DewfordTown_Gym_EventScript_1A0225
	case 3, DewfordTown_Gym_EventScript_1A022F
	case 4, DewfordTown_Gym_EventScript_1A023C
	case 5, DewfordTown_Gym_EventScript_1A024C
	case 6, DewfordTown_Gym_EventScript_1A0262
	case 7, DewfordTown_Gym_EventScript_1A026F
	case 8, DewfordTown_Gym_EventScript_1A0282
	end

DewfordTown_Gym_EventScript_1A021E:: @ 81A021E
	cleartrainerflag 320
	cleartrainerflag 321
	return

DewfordTown_Gym_EventScript_1A0225:: @ 81A0225
	cleartrainerflag 179
	cleartrainerflag 425
	cleartrainerflag 426
	return

DewfordTown_Gym_EventScript_1A022F:: @ 81A022F
	cleartrainerflag 191
	cleartrainerflag 194
	cleartrainerflag 323
	cleartrainerflag 649
	return

DewfordTown_Gym_EventScript_1A023C:: @ 81A023C
	cleartrainerflag 201
	cleartrainerflag 203
	cleartrainerflag 205
	cleartrainerflag 648
	cleartrainerflag 650
	return

DewfordTown_Gym_EventScript_1A024C:: @ 81A024C
	cleartrainerflag 71
	cleartrainerflag 72
	cleartrainerflag 73
	cleartrainerflag 74
	cleartrainerflag 89
	cleartrainerflag 90
	cleartrainerflag 91
	return

DewfordTown_Gym_EventScript_1A0262:: @ 81A0262
	cleartrainerflag 401
	cleartrainerflag 654
	cleartrainerflag 655
	cleartrainerflag 404
	return

DewfordTown_Gym_EventScript_1A026F:: @ 81A026F
	cleartrainerflag 233
	cleartrainerflag 234
	cleartrainerflag 235
	cleartrainerflag 244
	cleartrainerflag 245
	cleartrainerflag 246
	return

DewfordTown_Gym_EventScript_1A0282:: @ 81A0282
	cleartrainerflag 613
	cleartrainerflag 614
	cleartrainerflag 118
	cleartrainerflag 128
	cleartrainerflag 129
	cleartrainerflag 130
	cleartrainerflag 131
	cleartrainerflag 301
	return

DewfordTown_Gym_EventScript_1A029B:: @ 81A029B
DewfordTown_Hall_EventScript_1A029B:: @ 81A029B
FallarborTown_House1_EventScript_1A029B:: @ 81A029B
FortreeCity_Gym_EventScript_1A029B:: @ 81A029B
FortreeCity_House2_EventScript_1A029B:: @ 81A029B
FortreeCity_House4_EventScript_1A029B:: @ 81A029B
LavaridgeTown_Gym_1F_EventScript_1A029B:: @ 81A029B
LavaridgeTown_HerbShop_EventScript_1A029B:: @ 81A029B
LilycoveCity_EventScript_1A029B:: @ 81A029B
LilycoveCity_House2_EventScript_1A029B:: @ 81A029B
LittlerootTown_BrendansHouse_1F_EventScript_1A029B:: @ 81A029B
MauvilleCity_EventScript_1A029B:: @ 81A029B
MauvilleCity_Gym_EventScript_1A029B:: @ 81A029B
MossdeepCity_EventScript_1A029B:: @ 81A029B
MossdeepCity_Gym_EventScript_1A029B:: @ 81A029B
MossdeepCity_SpaceCenter_1F_EventScript_1A029B:: @ 81A029B
MtPyre_1F_EventScript_1A029B:: @ 81A029B
PacifidlogTown_House2_EventScript_1A029B:: @ 81A029B
PetalburgCity_Gym_EventScript_1A029B:: @ 81A029B
PetalburgWoods_EventScript_1A029B:: @ 81A029B
Route104_EventScript_1A029B:: @ 81A029B
Route104_PrettyPetalFlowerShop_EventScript_1A029B:: @ 81A029B
Route109_EventScript_1A029B:: @ 81A029B
Route111_EventScript_1A029B:: @ 81A029B
Route111_WinstrateFamilysHouse_EventScript_1A029B:: @ 81A029B
Route114_EventScript_1A029B:: @ 81A029B
Route114_FossilManiacsHouse_EventScript_1A029B:: @ 81A029B
Route120_EventScript_1A029B:: @ 81A029B
Route123_BerryMastersHouse_EventScript_1A029B:: @ 81A029B
Route123_EventScript_1A029B:: @ 81A029B
RustboroCity_DevonCorp_3F_EventScript_1A029B:: @ 81A029B
RustboroCity_Flat2_2F_EventScript_1A029B:: @ 81A029B
RustboroCity_Gym_EventScript_1A029B:: @ 81A029B
RustboroCity_PokemonSchool_EventScript_1A029B:: @ 81A029B
SSTidalRooms_EventScript_1A029B:: @ 81A029B
ShoalCave_LowTideEntranceRoom_EventScript_1A029B:: @ 81A029B
ShoalCave_LowTideInnerRoom_EventScript_1A029B:: @ 81A029B
ShoalCave_LowTideLowerRoom_EventScript_1A029B:: @ 81A029B
ShoalCave_LowTideStairsRoom_EventScript_1A029B:: @ 81A029B
SlateportCity_ContestHall_EventScript_1A029B:: @ 81A029B
SlateportCity_Harbor_EventScript_1A029B:: @ 81A029B
SlateportCity_PokemonFanClub_EventScript_1A029B:: @ 81A029B
SootopolisCity_EventScript_1A029B:: @ 81A029B
SootopolisCity_Gym_1F_EventScript_1A029B:: @ 81A029B
VerdanturfTown_ContestLobby_EventScript_1A029B:: @ 81A029B
	msgbox MauvilleCity_Text_1A0CC2, 4
	release
	end

MauvilleCity_GameCorner_EventScript_1A02A5:: @ 81A02A5
Route110_TrickHouseEnd_EventScript_1A02A5:: @ 81A02A5
Route110_TrickHouseEntrance_EventScript_1A02A5:: @ 81A02A5
Route113_GlassWorkshop_EventScript_1A02A5:: @ 81A02A5
	msgbox MauvilleCity_GameCorner_Text_1A0CC2, 4
	return

Route114_LanettesHouse_EventScript_1A02AE:: @ 81A02AE
	msgbox Route114_LanettesHouse_Text_1A0CEF, 4
	release
	end

LilycoveCity_LilycoveMuseum_2F_EventScript_1A02B8:: @ 81A02B8
MauvilleCity_GameCorner_EventScript_1A02B8:: @ 81A02B8
Route110_TrickHouseEnd_EventScript_1A02B8:: @ 81A02B8
Route110_TrickHouseEntrance_EventScript_1A02B8:: @ 81A02B8
Route113_GlassWorkshop_EventScript_1A02B8:: @ 81A02B8
	msgbox MauvilleCity_GameCorner_Text_1A0CEF, 4
	return

EverGrandeCity_EventScript_1A02C1:: @ 81A02C1
LilycoveCity_EventScript_1A02C1:: @ 81A02C1
MossdeepCity_EventScript_1A02C1:: @ 81A02C1
Route124_EventScript_1A02C1:: @ 81A02C1
Route125_EventScript_1A02C1:: @ 81A02C1
Route126_EventScript_1A02C1:: @ 81A02C1
Route127_EventScript_1A02C1:: @ 81A02C1
Route128_EventScript_1A02C1:: @ 81A02C1
SootopolisCity_EventScript_1A02C1:: @ 81A02C1
	setweather 12
	return

DewfordTown_Gym_EventScript_1A02C5:: @ 81A02C5
FortreeCity_Gym_EventScript_1A02C5:: @ 81A02C5
LavaridgeTown_Gym_1F_EventScript_1A02C5:: @ 81A02C5
LilycoveCity_CoveLilyMotel_2F_EventScript_1A02C5:: @ 81A02C5
MauvilleCity_Gym_EventScript_1A02C5:: @ 81A02C5
MossdeepCity_Gym_EventScript_1A02C5:: @ 81A02C5
PetalburgCity_Gym_EventScript_1A02C5:: @ 81A02C5
RustboroCity_Gym_EventScript_1A02C5:: @ 81A02C5
SootopolisCity_Gym_1F_EventScript_1A02C5:: @ 81A02C5
	fanfare 369
	waitfanfare
	return

LittlerootTown_BrendansHouse_1F_EventScript_1A02CA:: @ 81A02CA
Route111_OldLadysRestStop_EventScript_1A02CA:: @ 81A02CA
Route119_WeatherInstitute_1F_EventScript_1A02CA:: @ 81A02CA
SSTidalRooms_EventScript_1A02CA:: @ 81A02CA
	fadescreen 1
	fanfare 368
	waitfanfare
	special 0
	fadescreen 0
	return

	.global gUnknown_081A02D6
gUnknown_081A02D6: @ 81A02D6

	.incbin "baserom.gba", 0x1a02d6, 0x11

DewfordTown_EventScript_1A02E7:: @ 81A02E7
Route104_EventScript_1A02E7:: @ 81A02E7
Route109_EventScript_1A02E7:: @ 81A02E7
	setflag 0x4001
	playmusic 431, 0
	return

DewfordTown_EventScript_1A02EF:: @ 81A02EF
Route104_EventScript_1A02EF:: @ 81A02EF
Route109_EventScript_1A02EF:: @ 81A02EF
	clearflag 0x4001
	fadedefault
	return

LittlerootTown_ProfessorBirchsLab_EventScript_1A02F4:: @ 81A02F4
Route101_EventScript_1A02F4:: @ 81A02F4
Route103_EventScript_1A02F4:: @ 81A02F4
	compare 0x4085, 0
	jumpeq Route101_EventScript_1A14DC
	compare 0x4049, 0
	callif 1, Route101_EventScript_1A0358
	compare 0x4049, 1
	callif 1, Route101_EventScript_1A0358
	compare 0x4049, 2
	callif 1, Route101_EventScript_1A0365
	compare 0x4049, 3
	callif 1, Route101_EventScript_1A0365
	compare 0x4049, 4
	callif 1, Route101_EventScript_1A0372
	compare 0x4049, 5
	callif 1, Route101_EventScript_1A0372
	compare 0x4049, 6
	callif 1, Route101_EventScript_1A0358
	compare 0x4049, 7
	callif 1, Route101_EventScript_1A0358
	return

Route101_EventScript_1A0358:: @ 81A0358
	clearflag 721
	clearflag 896
	setflag 897
	setflag 898
	return

Route101_EventScript_1A0365:: @ 81A0365
	clearflag 897
	setflag 721
	setflag 896
	setflag 898
	return

Route101_EventScript_1A0372:: @ 81A0372
	clearflag 898
	setflag 897
	setflag 721
	setflag 896
	return

LittlerootTown_ProfessorBirchsLab_EventScript_1A037F:: @ 81A037F
Route101_EventScript_1A037F:: @ 81A037F
Route103_EventScript_1A037F:: @ 81A037F
	lock
	faceplayer
	msgbox Route101_Text_1C4449, 5
	compare RESULT, 0
	jumpeq Route101_EventScript_1A039B
	call Route101_EventScript_1A03B0
	release
	end

Route101_EventScript_1A039B:: @ 81A039B
	msgbox Route101_Text_1C449B, 4
	release
	end

Route101_EventScript_1A03A5:: @ 81A03A5
	copyvar 0x8004, 0x8009
	special 213
	waittext
	waitbutton
	return

EverGrandeCity_ChampionsRoom_EventScript_1A03B0:: @ 81A03B0
Route101_EventScript_1A03B0:: @ 81A03B0
	setvar 0x8004, 0
	specialval RESULT, 212
	copyvar 0x8008, 0x8005
	copyvar 0x8009, 0x8006
	copyvar 0x800a, RESULT
	buffernum 0, 32776
	buffernum 1, 32777
	msgbox Route101_Text_1C44DC, 4
	call Route101_EventScript_1A03A5
	compare 0x800a, 0
	jumpeq Route101_EventScript_1A14DC
	setvar 0x8004, 1
	specialval RESULT, 212
	copyvar 0x8008, 0x8005
	copyvar 0x8009, 0x8006
	buffernum 0, 32776
	buffernum 1, 32777
	msgbox Route101_Text_1C4B05, 4
	return

BattleTower_Outside_EventScript_1A040E:: @ 81A040E
LilycoveCity_Harbor_EventScript_1A040E:: @ 81A040E
SlateportCity_Harbor_EventScript_1A040E:: @ 81A040E
	pause 60
	move 0x8004, SlateportCity_Harbor_Movement_1A041C
	waitmove 0
	return

SlateportCity_Harbor_Movement_1A041C:: @ 81A041C
	slow_step_right
	slow_step_right
	slow_step_right
	step_right
	step_right
	step_right
	step_right
	step_end

PetalburgCity_Gym_EventScript_1A0424:: @ 81A0424
	setflag 740
	setflag 743
	setflag 741
	setflag 744
	setflag 738
	setflag 742
	setflag 739
	setflag 881
	setvar 0x4096, 0
	return

RusturfTunnel_EventScript_1A0442:: @ 81A0442
	disappear 1
	disappear 10
	clearflag 808
	clearflag 984
	setvar 0x409a, 6
	setflag 199
	return

	.incbin "baserom.gba", 0x1a0457, 0x25

BattleTower_Outside_EventScript_1A047C:: @ 81A047C
SouthernIsland_Exterior_EventScript_1A047C:: @ 81A047C
	compare FACING, 1
	callif 1, BattleTower_Outside_EventScript_160B2F
	compare FACING, 3
	callif 1, BattleTower_Outside_EventScript_160B3A
	pause 30
	spriteinvisible 255, 0, 0
	call BattleTower_Outside_EventScript_1A040E
	return

CaveOfOrigin_B4F_EventScript_1A04A0:: @ 81A04A0
	lockall
	checksound
	pokecry SPECIES_GROUDON, 2
	waitpokecry
	setvar 0x4005, 1
	releaseall
	end

CaveOfOrigin_1F_EventScript_1A04AF:: @ 81A04AF
CaveOfOrigin_B1F_EventScript_1A04AF:: @ 81A04AF
CaveOfOrigin_B2F_EventScript_1A04AF:: @ 81A04AF
CaveOfOrigin_B3F_EventScript_1A04AF:: @ 81A04AF
	lockall
	setvar 0x4001, 1
	jump CaveOfOrigin_1F_EventScript_1A04D3
	end

CaveOfOrigin_B2F_EventScript_1A04BB:: @ 81A04BB
CaveOfOrigin_B3F_EventScript_1A04BB:: @ 81A04BB
	lockall
	setvar 0x4002, 1
	jump CaveOfOrigin_B2F_EventScript_1A04D3
	end

	.incbin "baserom.gba", 0x1a04c7, 0xc

CaveOfOrigin_1F_EventScript_1A04D3:: @ 81A04D3
CaveOfOrigin_B2F_EventScript_1A04D3:: @ 81A04D3
	setvar 0x8004, 1
	setvar 0x8005, 1
	special 310
	waitstate
	releaseall
	end

CaveOfOrigin_1F_EventScript_1A04E3:: @ 81A04E3
CaveOfOrigin_B1F_EventScript_1A04E3:: @ 81A04E3
CaveOfOrigin_B2F_EventScript_1A04E3:: @ 81A04E3
CaveOfOrigin_B3F_EventScript_1A04E3:: @ 81A04E3
CaveOfOrigin_B4F_EventScript_1A04E3:: @ 81A04E3
	setvar 0x4001, 1
	setvar 0x4002, 1
	setvar 0x4003, 1
	setvar 0x4004, 1
	setvar 0x4005, 1
	return

AquaHideout_B1F_EventScript_1A04FD:: @ 81A04FD
MagmaHideout_B1F_EventScript_1A04FD:: @ 81A04FD
	lock
	faceplayer
	setwildbattle SPECIES_ELECTRODE, 30, ITEM_NONE
	checksound
	pokecry SPECIES_ELECTRODE, 2
	pause 40
	waitpokecry
	setflag 977
	setflag 2145
	dowildbattle
	clearflag 2145
	release
	end

AquaHideout_B1F_EventScript_1A051B:: @ 81A051B
MagmaHideout_B1F_EventScript_1A051B:: @ 81A051B
	lock
	faceplayer
	setwildbattle SPECIES_ELECTRODE, 30, ITEM_NONE
	checksound
	pokecry SPECIES_ELECTRODE, 2
	pause 40
	waitpokecry
	setflag 978
	setflag 2145
	dowildbattle
	clearflag 2145
	release
	end

Route120_EventScript_1A0539:: @ 81A0539
	lock
	faceplayer
	setvar 0x8004, 1
	jump Route120_EventScript_1A0594
	end

Route120_EventScript_1A0546:: @ 81A0546
	lock
	faceplayer
	setvar 0x8004, 2
	jump Route120_EventScript_1A0594
	end

Route120_EventScript_1A0553:: @ 81A0553
	lock
	faceplayer
	setvar 0x8004, 3
	jump Route120_EventScript_1A0594
	end

Route120_EventScript_1A0560:: @ 81A0560
	lock
	faceplayer
	setvar 0x8004, 4
	jump Route120_EventScript_1A0594
	end

Route120_EventScript_1A056D:: @ 81A056D
	lock
	faceplayer
	setvar 0x8004, 5
	jump Route120_EventScript_1A0594
	end

Route119_EventScript_1A057A:: @ 81A057A
	lock
	faceplayer
	setvar 0x8004, 6
	jump Route119_EventScript_1A0594
	end

Route119_EventScript_1A0587:: @ 81A0587
	lock
	faceplayer
	setvar 0x8004, 7
	jump Route119_EventScript_1A0594
	end

Route119_EventScript_1A0594:: @ 81A0594
Route120_EventScript_1A0594:: @ 81A0594
	checkitem ITEM_DEVON_SCOPE, 1
	compare RESULT, 1
	jumpeq Route119_EventScript_1A05AE
	msgbox Route119_Text_171B93, 4
	release
	end

Route119_EventScript_1A05AE:: @ 81A05AE
	msgbox Route119_Text_171BB6, 5
	compare RESULT, 1
	jumpeq Route119_EventScript_1A05C3
	release
	end

Route119_EventScript_1A05C3:: @ 81A05C3
	msgbox Route119_Text_171BF6, 4
	closebutton
	move LAST_TALKED, Route119_Movement_1A0839
	waitmove 0
	move LAST_TALKED, Route119_Movement_1A0662
	waitmove 0
	checksound
	pokecry SPECIES_KECLEON, 2
	pause 40
	waitpokecry
	setwildbattle SPECIES_KECLEON, 30, ITEM_NONE
	compare 0x8004, 1
	callif 1, Route119_EventScript_1A0646
	compare 0x8004, 2
	callif 1, Route119_EventScript_1A064A
	compare 0x8004, 3
	callif 1, Route119_EventScript_1A064E
	compare 0x8004, 4
	callif 1, Route119_EventScript_1A0652
	compare 0x8004, 5
	callif 1, Route119_EventScript_1A0656
	compare 0x8004, 6
	callif 1, Route119_EventScript_1A065A
	compare 0x8004, 7
	callif 1, Route119_EventScript_1A065E
	setflag 2145
	dowildbattle
	clearflag 2145
	release
	end

Route119_EventScript_1A0646:: @ 81A0646
	setflag 982
	return

Route119_EventScript_1A064A:: @ 81A064A
	setflag 985
	return

Route119_EventScript_1A064E:: @ 81A064E
	setflag 986
	return

Route119_EventScript_1A0652:: @ 81A0652
	setflag 987
	return

Route119_EventScript_1A0656:: @ 81A0656
	setflag 988
	return

Route119_EventScript_1A065A:: @ 81A065A
	setflag 989
	return

Route119_EventScript_1A065E:: @ 81A065E
	setflag 990
	return

FortreeCity_Movement_1A0662:: @ 81A0662
Route119_Movement_1A0662:: @ 81A0662
Route120_Movement_1A0662:: @ 81A0662
	step_55
	step_12
	step_54
	step_12
	step_55
	step_12
	step_54
	step_12
	step_55
	step_13
	step_54
	step_13
	step_55
	step_13
	step_54
	step_13
	step_55
	step_14
	step_54
	step_14
	step_55
	step_end

LittlerootTown_ProfessorBirchsLab_EventScript_1A0678:: @ 81A0678
MossdeepCity_StevensHouse_EventScript_1A0678:: @ 81A0678
RustboroCity_DevonCorp_2F_EventScript_1A0678:: @ 81A0678
SlateportCity_House1_EventScript_1A0678:: @ 81A0678
	fadescreen 1
	special 158
	waitstate
	return

FallarborTown_House1_EventScript_1A067F:: @ 81A067F
GraniteCave_StevensRoom_EventScript_1A067F:: @ 81A067F
MtPyre_Summit_EventScript_1A067F:: @ 81A067F
SlateportCity_OceanicMuseum_2F_EventScript_1A067F:: @ 81A067F
	bufferitem 0, 0x8004
	fanfare 372
	message FallarborTown_House1_Text_1A1498
	waittext
	waitfanfare
	removeitem 0x8004, 1
	return

EverGrandeCity_DrakesRoom_EventScript_1A0693:: @ 81A0693
EverGrandeCity_GlaciasRoom_EventScript_1A0693:: @ 81A0693
EverGrandeCity_PhoebesRoom_EventScript_1A0693:: @ 81A0693
EverGrandeCity_SidneysRoom_EventScript_1A0693:: @ 81A0693
	move 255, EverGrandeCity_SidneysRoom_Movement_1A0853
	waitmove 0
	playsfx 8
	setmaptile 6, 1, 836, 0
	setmaptile 6, 2, 837, 0
	setmaptile 0, 2, 734, 1
	setmaptile 1, 2, 733, 1
	setmaptile 2, 2, 734, 1
	setmaptile 3, 2, 733, 1
	setmaptile 4, 2, 734, 1
	setmaptile 8, 2, 733, 1
	setmaptile 9, 2, 734, 1
	setmaptile 10, 2, 733, 1
	setmaptile 11, 2, 734, 1
	setmaptile 12, 2, 733, 1
	special 142
	return

EverGrandeCity_DrakesRoom_EventScript_1A0710:: @ 81A0710
EverGrandeCity_GlaciasRoom_EventScript_1A0710:: @ 81A0710
EverGrandeCity_PhoebesRoom_EventScript_1A0710:: @ 81A0710
EverGrandeCity_SidneysRoom_EventScript_1A0710:: @ 81A0710
	move 255, EverGrandeCity_SidneysRoom_Movement_1A0847
	waitmove 0
	playsfx 52
	setmaptile 5, 12, 518, 1
	setmaptile 6, 12, 518, 1
	setmaptile 7, 12, 518, 1
	setmaptile 5, 13, 526, 1
	setmaptile 6, 13, 526, 1
	setmaptile 7, 13, 526, 1
	special 142
	return

EverGrandeCity_DrakesRoom_EventScript_1A0757:: @ 81A0757
EverGrandeCity_GlaciasRoom_EventScript_1A0757:: @ 81A0757
EverGrandeCity_PhoebesRoom_EventScript_1A0757:: @ 81A0757
EverGrandeCity_SidneysRoom_EventScript_1A0757:: @ 81A0757
	setmaptile 6, 1, 836, 0
	setmaptile 6, 2, 837, 0
	setmaptile 5, 12, 518, 1
	setmaptile 6, 12, 518, 1
	setmaptile 7, 12, 518, 1
	setmaptile 5, 13, 526, 1
	setmaptile 6, 13, 526, 1
	setmaptile 7, 13, 526, 1
	setmaptile 0, 2, 734, 1
	setmaptile 1, 2, 733, 1
	setmaptile 2, 2, 734, 1
	setmaptile 3, 2, 733, 1
	setmaptile 4, 2, 734, 1
	setmaptile 8, 2, 733, 1
	setmaptile 9, 2, 734, 1
	setmaptile 10, 2, 733, 1
	setmaptile 11, 2, 734, 1
	setmaptile 12, 2, 733, 1
	return

EverGrandeCity_DrakesRoom_EventScript_1A07FA:: @ 81A07FA
EverGrandeCity_GlaciasRoom_EventScript_1A07FA:: @ 81A07FA
EverGrandeCity_PhoebesRoom_EventScript_1A07FA:: @ 81A07FA
EverGrandeCity_SidneysRoom_EventScript_1A07FA:: @ 81A07FA
	setmaptile 5, 12, 518, 1
	setmaptile 6, 12, 518, 1
	setmaptile 7, 12, 518, 1
	setmaptile 5, 13, 526, 1
	setmaptile 6, 13, 526, 1
	setmaptile 7, 13, 526, 1
	return

SlateportCity_Movement_1A0831:: @ 81A0831
	step_57
	step_end

AquaHideout_B2F_Movement_1A0833:: @ 81A0833
EverGrandeCity_ChampionsRoom_Movement_1A0833:: @ 81A0833
LavaridgeTown_Movement_1A0833:: @ 81A0833
LilycoveCity_ContestLobby_Movement_1A0833:: @ 81A0833
LilycoveCity_CoveLilyMotel_1F_Movement_1A0833:: @ 81A0833
LittlerootTown_BrendansHouse_1F_Movement_1A0833:: @ 81A0833
LittlerootTown_BrendansHouse_2F_Movement_1A0833:: @ 81A0833
LittlerootTown_MaysHouse_1F_Movement_1A0833:: @ 81A0833
MauvilleCity_House2_Movement_1A0833:: @ 81A0833
MauvilleCity_Movement_1A0833:: @ 81A0833
MeteorFalls_1F_1R_Movement_1A0833:: @ 81A0833
MossdeepCity_StevensHouse_Movement_1A0833:: @ 81A0833
MtChimney_Movement_1A0833:: @ 81A0833
PetalburgCity_Movement_1A0833:: @ 81A0833
Route103_Movement_1A0833:: @ 81A0833
Route110_Movement_1A0833:: @ 81A0833
Route110_TrickHouseEnd_Movement_1A0833:: @ 81A0833
Route110_TrickHouseEntrance_Movement_1A0833:: @ 81A0833
Route110_TrickHousePuzzle5_Movement_1A0833:: @ 81A0833
RustboroCity_DevonCorp_2F_Movement_1A0833:: @ 81A0833
RustboroCity_Movement_1A0833:: @ 81A0833
RusturfTunnel_Movement_1A0833:: @ 81A0833
SeafloorCavern_Room9_Movement_1A0833:: @ 81A0833
SlateportCity_Movement_1A0833:: @ 81A0833
SlateportCity_OceanicMuseum_1F_Movement_1A0833:: @ 81A0833
SlateportCity_PokemonFanClub_Movement_1A0833:: @ 81A0833
SootopolisCity_Movement_1A0833:: @ 81A0833
	step_56
	step_end

EverGrandeCity_ChampionsRoom_Movement_1A0835:: @ 81A0835
LavaridgeTown_Movement_1A0835:: @ 81A0835
LilycoveCity_CoveLilyMotel_1F_Movement_1A0835:: @ 81A0835
LittlerootTown_BrendansHouse_1F_Movement_1A0835:: @ 81A0835
LittlerootTown_BrendansHouse_2F_Movement_1A0835:: @ 81A0835
LittlerootTown_MaysHouse_1F_Movement_1A0835:: @ 81A0835
MauvilleCity_House2_Movement_1A0835:: @ 81A0835
MauvilleCity_Movement_1A0835:: @ 81A0835
MeteorFalls_1F_1R_Movement_1A0835:: @ 81A0835
MossdeepCity_StevensHouse_Movement_1A0835:: @ 81A0835
MtChimney_Movement_1A0835:: @ 81A0835
PetalburgCity_Movement_1A0835:: @ 81A0835
Route103_Movement_1A0835:: @ 81A0835
Route110_Movement_1A0835:: @ 81A0835
Route110_TrickHouseEntrance_Movement_1A0835:: @ 81A0835
Route110_TrickHousePuzzle5_Movement_1A0835:: @ 81A0835
RustboroCity_DevonCorp_2F_Movement_1A0835:: @ 81A0835
RustboroCity_Movement_1A0835:: @ 81A0835
RusturfTunnel_Movement_1A0835:: @ 81A0835
SeafloorCavern_Room9_Movement_1A0835:: @ 81A0835
SlateportCity_Movement_1A0835:: @ 81A0835
SlateportCity_OceanicMuseum_1F_Movement_1A0835:: @ 81A0835
SlateportCity_PokemonFanClub_Movement_1A0835:: @ 81A0835
SootopolisCity_Movement_1A0835:: @ 81A0835
	step_14
	step_14
	step_14
	step_end

AquaHideout_B2F_Movement_1A0839:: @ 81A0839
EverGrandeCity_PokemonLeague_Movement_1A0839:: @ 81A0839
FallarborTown_House2_Movement_1A0839:: @ 81A0839
FortreeCity_House4_Movement_1A0839:: @ 81A0839
LilycoveCity_ContestHall_Movement_1A0839:: @ 81A0839
LilycoveCity_CoveLilyMotel_1F_Movement_1A0839:: @ 81A0839
LilycoveCity_DepartmentStore_1F_Movement_1A0839:: @ 81A0839
LilycoveCity_Harbor_Movement_1A0839:: @ 81A0839
LilycoveCity_LilycoveMuseum_1F_Movement_1A0839:: @ 81A0839
LilycoveCity_LilycoveMuseum_2F_Movement_1A0839:: @ 81A0839
LilycoveCity_MoveDeletersHouse_Movement_1A0839:: @ 81A0839
LilycoveCity_Movement_1A0839:: @ 81A0839
LittlerootTown_BrendansHouse_1F_Movement_1A0839:: @ 81A0839
LittlerootTown_BrendansHouse_2F_Movement_1A0839:: @ 81A0839
MauvilleCity_Movement_1A0839:: @ 81A0839
MtChimney_Movement_1A0839:: @ 81A0839
MtPyre_Summit_Movement_1A0839:: @ 81A0839
OldaleTown_Movement_1A0839:: @ 81A0839
PetalburgCity_Gym_Movement_1A0839:: @ 81A0839
PetalburgCity_Movement_1A0839:: @ 81A0839
Route103_Movement_1A0839:: @ 81A0839
Route110_TrickHouseEnd_Movement_1A0839:: @ 81A0839
Route110_TrickHouseEntrance_Movement_1A0839:: @ 81A0839
Route110_TrickHousePuzzle5_Movement_1A0839:: @ 81A0839
Route119_Movement_1A0839:: @ 81A0839
RusturfTunnel_Movement_1A0839:: @ 81A0839
SeafloorCavern_Room9_Movement_1A0839:: @ 81A0839
SlateportCity_ContestLobby_Movement_1A0839:: @ 81A0839
SlateportCity_Movement_1A0839:: @ 81A0839
SlateportCity_SternsShipyard_1F_Movement_1A0839:: @ 81A0839
	step_3e
	step_end

	.incbin "baserom.gba", 0x1a083b, 0x2

EverGrandeCity_PokemonLeague_Movement_1A083D:: @ 81A083D
LilycoveCity_ContestHall_Movement_1A083D:: @ 81A083D
LilycoveCity_ContestLobby_Movement_1A083D:: @ 81A083D
LilycoveCity_CoveLilyMotel_1F_Movement_1A083D:: @ 81A083D
LilycoveCity_House3_Movement_1A083D:: @ 81A083D
LilycoveCity_LilycoveMuseum_1F_Movement_1A083D:: @ 81A083D
LilycoveCity_Movement_1A083D:: @ 81A083D
LittlerootTown_Movement_1A083D:: @ 81A083D
MauvilleCity_GameCorner_Movement_1A083D:: @ 81A083D
MauvilleCity_Movement_1A083D:: @ 81A083D
MossdeepCity_Movement_1A083D:: @ 81A083D
MossdeepCity_SpaceCenter_1F_Movement_1A083D:: @ 81A083D
MtChimney_Movement_1A083D:: @ 81A083D
OldaleTown_Movement_1A083D:: @ 81A083D
PetalburgCity_Movement_1A083D:: @ 81A083D
Route109_Movement_1A083D:: @ 81A083D
Route110_Movement_1A083D:: @ 81A083D
Route111_WinstrateFamilysHouse_Movement_1A083D:: @ 81A083D
Route119_Movement_1A083D:: @ 81A083D
RustboroCity_DevonCorp_3F_Movement_1A083D:: @ 81A083D
RustboroCity_Movement_1A083D:: @ 81A083D
RusturfTunnel_Movement_1A083D:: @ 81A083D
SlateportCity_ContestHall_Movement_1A083D:: @ 81A083D
SlateportCity_ContestLobby_Movement_1A083D:: @ 81A083D
SlateportCity_Harbor_Movement_1A083D:: @ 81A083D
SlateportCity_Movement_1A083D:: @ 81A083D
SlateportCity_OceanicMuseum_2F_Movement_1A083D:: @ 81A083D
SlateportCity_SternsShipyard_1F_Movement_1A083D:: @ 81A083D
VerdanturfTown_Movement_1A083D:: @ 81A083D
	step_4e
	step_end

DewfordTown_Hall_Movement_1A083F:: @ 81A083F
EverGrandeCity_ChampionsRoom_Movement_1A083F:: @ 81A083F
EverGrandeCity_HallOfFame_Movement_1A083F:: @ 81A083F
LavaridgeTown_Movement_1A083F:: @ 81A083F
LilycoveCity_PokemonTrainerFanClub_Movement_1A083F:: @ 81A083F
LittlerootTown_BrendansHouse_1F_Movement_1A083F:: @ 81A083F
LittlerootTown_BrendansHouse_2F_Movement_1A083F:: @ 81A083F
LittlerootTown_MaysHouse_1F_Movement_1A083F:: @ 81A083F
LittlerootTown_Movement_1A083F:: @ 81A083F
MeteorFalls_1F_1R_Movement_1A083F:: @ 81A083F
MossdeepCity_StevensHouse_Movement_1A083F:: @ 81A083F
MtChimney_Movement_1A083F:: @ 81A083F
MtPyre_Summit_Movement_1A083F:: @ 81A083F
OldaleTown_PokemonCenter_1F_Movement_1A083F:: @ 81A083F
PetalburgCity_Gym_Movement_1A083F:: @ 81A083F
PetalburgCity_Movement_1A083F:: @ 81A083F
PetalburgWoods_Movement_1A083F:: @ 81A083F
Route101_Movement_1A083F:: @ 81A083F
Route110_TrickHouseEnd_Movement_1A083F:: @ 81A083F
Route111_Movement_1A083F:: @ 81A083F
Route116_Movement_1A083F:: @ 81A083F
Route120_Movement_1A083F:: @ 81A083F
Route128_Movement_1A083F:: @ 81A083F
RustboroCity_Movement_1A083F:: @ 81A083F
SeafloorCavern_Room9_Movement_1A083F:: @ 81A083F
SlateportCity_Movement_1A083F:: @ 81A083F
SlateportCity_OceanicMuseum_1F_Movement_1A083F:: @ 81A083F
SlateportCity_OceanicMuseum_2F_Movement_1A083F:: @ 81A083F
SootopolisCity_Movement_1A083F:: @ 81A083F
VictoryRoad_1F_Movement_1A083F:: @ 81A083F
	step_27
	step_end

AquaHideout_B2F_Movement_1A0841:: @ 81A0841
CaveOfOrigin_B4F_Movement_1A0841:: @ 81A0841
DewfordTown_Hall_Movement_1A0841:: @ 81A0841
EverGrandeCity_ChampionsRoom_Movement_1A0841:: @ 81A0841
EverGrandeCity_HallOfFame_Movement_1A0841:: @ 81A0841
LilycoveCity_Harbor_Movement_1A0841:: @ 81A0841
LittlerootTown_BrendansHouse_1F_Movement_1A0841:: @ 81A0841
LittlerootTown_Movement_1A0841:: @ 81A0841
MeteorFalls_1F_1R_Movement_1A0841:: @ 81A0841
MossdeepCity_GameCorner_1F_Movement_1A0841:: @ 81A0841
MtPyre_Summit_Movement_1A0841:: @ 81A0841
NewMauville_Entrance_Movement_1A0841:: @ 81A0841
PetalburgCity_Gym_Movement_1A0841:: @ 81A0841
PetalburgCity_Movement_1A0841:: @ 81A0841
PetalburgWoods_Movement_1A0841:: @ 81A0841
Route110_TrickHouseEnd_Movement_1A0841:: @ 81A0841
Route110_TrickHouseEntrance_Movement_1A0841:: @ 81A0841
Route111_Movement_1A0841:: @ 81A0841
Route118_Movement_1A0841:: @ 81A0841
Route120_Movement_1A0841:: @ 81A0841
Route121_SafariZoneEntrance_Movement_1A0841:: @ 81A0841
Route128_Movement_1A0841:: @ 81A0841
RustboroCity_Movement_1A0841:: @ 81A0841
RusturfTunnel_Movement_1A0841:: @ 81A0841
SeafloorCavern_Room9_Movement_1A0841:: @ 81A0841
SlateportCity_Harbor_Movement_1A0841:: @ 81A0841
SlateportCity_Movement_1A0841:: @ 81A0841
SlateportCity_OceanicMuseum_2F_Movement_1A0841:: @ 81A0841
	step_26
	step_end

AquaHideout_B2F_Movement_1A0843:: @ 81A0843
DewfordTown_Hall_Movement_1A0843:: @ 81A0843
EverGrandeCity_ChampionsRoom_Movement_1A0843:: @ 81A0843
EverGrandeCity_HallOfFame_Movement_1A0843:: @ 81A0843
LavaridgeTown_Movement_1A0843:: @ 81A0843
LilycoveCity_DepartmentStore_1F_Movement_1A0843:: @ 81A0843
LilycoveCity_PokemonTrainerFanClub_Movement_1A0843:: @ 81A0843
LittlerootTown_BrendansHouse_1F_Movement_1A0843:: @ 81A0843
LittlerootTown_BrendansHouse_2F_Movement_1A0843:: @ 81A0843
LittlerootTown_MaysHouse_1F_Movement_1A0843:: @ 81A0843
LittlerootTown_Movement_1A0843:: @ 81A0843
LittlerootTown_ProfessorBirchsLab_Movement_1A0843:: @ 81A0843
MauvilleCity_Movement_1A0843:: @ 81A0843
MtPyre_Summit_Movement_1A0843:: @ 81A0843
OldaleTown_Movement_1A0843:: @ 81A0843
PetalburgCity_Gym_Movement_1A0843:: @ 81A0843
PetalburgCity_Movement_1A0843:: @ 81A0843
Route101_Movement_1A0843:: @ 81A0843
Route110_Movement_1A0843:: @ 81A0843
Route110_TrickHouseEnd_Movement_1A0843:: @ 81A0843
Route116_Movement_1A0843:: @ 81A0843
Route120_Movement_1A0843:: @ 81A0843
Route128_Movement_1A0843:: @ 81A0843
RustboroCity_Movement_1A0843:: @ 81A0843
SlateportCity_Harbor_Movement_1A0843:: @ 81A0843
SlateportCity_Movement_1A0843:: @ 81A0843
SlateportCity_OceanicMuseum_1F_Movement_1A0843:: @ 81A0843
SlateportCity_OceanicMuseum_2F_Movement_1A0843:: @ 81A0843
SootopolisCity_Movement_1A0843:: @ 81A0843
	step_28
	step_end

BattleTower_Outside_Movement_1A0845:: @ 81A0845
DewfordTown_Hall_Movement_1A0845:: @ 81A0845
EverGrandeCity_ChampionsRoom_Movement_1A0845:: @ 81A0845
LilycoveCity_CoveLilyMotel_1F_Movement_1A0845:: @ 81A0845
LilycoveCity_DepartmentStoreElevator_Movement_1A0845:: @ 81A0845
LilycoveCity_Movement_1A0845:: @ 81A0845
LilycoveCity_PokemonTrainerFanClub_Movement_1A0845:: @ 81A0845
LittlerootTown_Movement_1A0845:: @ 81A0845
MauvilleCity_Movement_1A0845:: @ 81A0845
MeteorFalls_1F_1R_Movement_1A0845:: @ 81A0845
MtPyre_Summit_Movement_1A0845:: @ 81A0845
OldaleTown_PokemonCenter_1F_Movement_1A0845:: @ 81A0845
PetalburgCity_Gym_Movement_1A0845:: @ 81A0845
PetalburgCity_Movement_1A0845:: @ 81A0845
PetalburgWoods_Movement_1A0845:: @ 81A0845
Route110_Movement_1A0845:: @ 81A0845
Route110_TrickHouseEnd_Movement_1A0845:: @ 81A0845
Route119_Movement_1A0845:: @ 81A0845
Route120_Movement_1A0845:: @ 81A0845
Route128_Movement_1A0845:: @ 81A0845
RustboroCity_Movement_1A0845:: @ 81A0845
RustboroCity_PokemonSchool_Movement_1A0845:: @ 81A0845
RusturfTunnel_Movement_1A0845:: @ 81A0845
SeafloorCavern_Room9_Movement_1A0845:: @ 81A0845
SlateportCity_Harbor_Movement_1A0845:: @ 81A0845
SlateportCity_Movement_1A0845:: @ 81A0845
SlateportCity_OceanicMuseum_2F_Movement_1A0845:: @ 81A0845
SootopolisCity_Movement_1A0845:: @ 81A0845
SouthernIsland_Exterior_Movement_1A0845:: @ 81A0845
	step_25
	step_end

EverGrandeCity_SidneysRoom_Movement_1A0847:: @ 81A0847
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

EverGrandeCity_ChampionsRoom_Movement_1A084E:: @ 81A084E
	step_up
	step_up
	step_up
	step_up
	step_end

EverGrandeCity_SidneysRoom_Movement_1A0853:: @ 81A0853
	step_14
	step_14
	step_end

Route110_TrickHouseEntrance_Movement_1A0856:: @ 81A0856
	step_up
	step_end

	.incbin "baserom.gba", 0x1a0858, 0x3

PictureBookShelfScript:: @ 81A085B
	msgbox PictureBookShelfText, 3
	end

BookshelfScript:: @ 81A0864
	msgbox BookshelfText, 3
	end

PokemonCenterBookshelfScript:: @ 81A086D
	msgbox PokemonCenterBookshelfText, 3
	end

VaseScript:: @ 81A0876
	msgbox VaseText, 3
	end

TrashCanScript:: @ 81A087F
	msgbox TrashCanText, 3
	end

ShopShelfScript:: @ 81A0888
	msgbox ShopShelfText, 3
	end

BlueprintScript:: @ 81A0891
	msgbox BlueprintText, 3
	end

SampleMessage1:: @ 81A089A
	.string "This is sample message 1.\p"
	.string "Welcome to the world of\n"
	.string "POKéMON AGB!\l"
	.string "We hope you enjoy this!$"

SampleMessage2:: @ 81A08F1
	.string "This is sample message 2.\p"
	.string "Welcome to the world of\n"
	.string "POKéMON AGB!\l"
	.string "We hope you enjoy this!$"

SampleMessage3:: @ 81A0948
	.string "This is sample message 3.\p"
	.string "Welcome to the world of\n"
	.string "POKéMON AGB!\l"
	.string "We hope you enjoy this!$"

UnusedMixRecordsPromptText: @ 81A099F
	.string "Would you like to mix records with other\n"
	.string "TRAINERS?$"

UnusedMixRecordsSeeYouAgainText: @ 81A09D2
	.string "We hope to see you again!$"

	.incbin "baserom.gba", 0x001a09ec, 0x15

	.global gUnknown_081A0A01
gUnknown_081A0A01: @ 81A0A01

	.incbin "baserom.gba", 0x1a0a01, 0x7c

OldaleTown_PokemonCenter_1F_Text_1A0A7D:: @ 81A0A7D
	.string "Hello, and welcome to the POKéMON\n"
	.string "CENTER.\p"
	.string "We restore your tired POKéMON to\n"
	.string "full health.\p"
	.string "Would you like to rest your POKéMON?$"

OldaleTown_PokemonCenter_1F_Text_1A0AFA:: @ 81A0AFA
	.string "We hope to see you again!$"

OldaleTown_PokemonCenter_1F_Text_1A0B14:: @ 81A0B14
	.string "Thank you for waiting.\p"
	.string "We’ve restored your POKéMON to\n"
	.string "full health.$"

	.incbin "baserom.gba", 0x1a0b57, 0x8d

EverGrandeCity_PokemonLeague_Text_1A0BE4:: @ 81A0BE4
FallarborTown_Mart_Text_1A0BE4:: @ 81A0BE4
FortreeCity_DecorationShop_Text_1A0BE4:: @ 81A0BE4
FortreeCity_Mart_Text_1A0BE4:: @ 81A0BE4
LavaridgeTown_Mart_Text_1A0BE4:: @ 81A0BE4
LilycoveCity_DepartmentStoreRooftop_Text_1A0BE4:: @ 81A0BE4
LilycoveCity_DepartmentStore_2F_Text_1A0BE4:: @ 81A0BE4
LilycoveCity_DepartmentStore_3F_Text_1A0BE4:: @ 81A0BE4
LilycoveCity_DepartmentStore_4F_Text_1A0BE4:: @ 81A0BE4
LilycoveCity_DepartmentStore_5F_Text_1A0BE4:: @ 81A0BE4
MauvilleCity_Mart_Text_1A0BE4:: @ 81A0BE4
MossdeepCity_Mart_Text_1A0BE4:: @ 81A0BE4
OldaleTown_Mart_Text_1A0BE4:: @ 81A0BE4
PetalburgCity_Mart_Text_1A0BE4:: @ 81A0BE4
RustboroCity_Mart_Text_1A0BE4:: @ 81A0BE4
SlateportCity_Mart_Text_1A0BE4:: @ 81A0BE4
SlateportCity_Text_1A0BE4:: @ 81A0BE4
SootopolisCity_Mart_Text_1A0BE4:: @ 81A0BE4
VerdanturfTown_Mart_Text_1A0BE4:: @ 81A0BE4
	.string "Welcome!\p"
	.string "How may I serve you?$"

EverGrandeCity_PokemonLeague_Text_1A0C02:: @ 81A0C02
FallarborTown_Mart_Text_1A0C02:: @ 81A0C02
FortreeCity_DecorationShop_Text_1A0C02:: @ 81A0C02
FortreeCity_Mart_Text_1A0C02:: @ 81A0C02
LavaridgeTown_HerbShop_Text_1A0C02:: @ 81A0C02
LavaridgeTown_Mart_Text_1A0C02:: @ 81A0C02
LilycoveCity_DepartmentStoreRooftop_Text_1A0C02:: @ 81A0C02
LilycoveCity_DepartmentStore_2F_Text_1A0C02:: @ 81A0C02
LilycoveCity_DepartmentStore_3F_Text_1A0C02:: @ 81A0C02
LilycoveCity_DepartmentStore_4F_Text_1A0C02:: @ 81A0C02
LilycoveCity_DepartmentStore_5F_Text_1A0C02:: @ 81A0C02
MauvilleCity_Mart_Text_1A0C02:: @ 81A0C02
MossdeepCity_Mart_Text_1A0C02:: @ 81A0C02
OldaleTown_Mart_Text_1A0C02:: @ 81A0C02
PetalburgCity_Mart_Text_1A0C02:: @ 81A0C02
	.include "data/maps/text/Route104_PrettyPetalFlowerShop.s"
RustboroCity_Mart_Text_1A0C02:: @ 81A0C02
SlateportCity_Mart_Text_1A0C02:: @ 81A0C02
SlateportCity_Text_1A0C02:: @ 81A0C02
SootopolisCity_Mart_Text_1A0C02:: @ 81A0C02
VerdanturfTown_Mart_Text_1A0C02:: @ 81A0C02
	.string "Please come again!$"

	.incbin "baserom.gba", 0x1a0c15, 0x2d

Route104_PrettyPetalFlowerShop_Text_1A0C42:: @ 81A0C42
	.string "{PLAYER}{KUN}, welcome!\p"
	.string "What can I do for you?$"

Message_ObtainedItem: @ 81A0C68
	.string "Obtained the {STR_VAR_2}.$"

LilycoveCity_DepartmentStoreRooftop_Text_1A0C79:: @ 81A0C79
	.string "The BAG is full...$"

LilycoveCity_DepartmentStoreRooftop_Text_1A0C8C:: @ 81A0C8C
Message_PutAwayItem:
	.string "{PLAYER} put away the {STR_VAR_2}\n"
	.string "in the {STR_VAR_3} POCKET.$"

Message_FoundOneItem:
	.string "{PLAYER} found one {STR_VAR_2}!$"

MauvilleCity_GameCorner_Text_1A0CC2:: @ 81A0CC2
MauvilleCity_Text_1A0CC2:: @ 81A0CC2
MtChimney_Text_1A0CC2:: @ 81A0CC2
OldaleTown_Text_1A0CC2:: @ 81A0CC2
Route109_SeashoreHouse_Text_1A0CC2:: @ 81A0CC2
Message_BagFull:
	.string "Too bad!\n"
	.string "The BAG is full...$"

Message_ObtainedDecoration: @ 81A0CDE
	.string "Obtained the {STR_VAR_2}.$"

BattleTower_Lobby_Text_1A0CEF:: @ 81A0CEF
MauvilleCity_GameCorner_Text_1A0CEF:: @ 81A0CEF
Route114_LanettesHouse_Text_1A0CEF:: @ 81A0CEF
SootopolisCity_House6_Text_1A0CEF:: @ 81A0CEF
	.string "Too bad! There’s no room left for\n"
	.string "another {STR_VAR_2}...$"

Message_TransferredToPC: @ 81A0D1F
	.string "The {STR_VAR_2} was transferred\n"
	.string "to the PC.$"

PetalburgCity_Text_1A0D41:: @ 81A0D41
	.string "“Selected items for your convenience!”\n"
	.string "POKéMON MART$"

PetalburgCity_Text_1A0D75:: @ 81A0D75
	.string "“Rejuvenate your tired partners!”\n"
	.string "POKéMON CENTER$"

	.incbin "baserom.gba", 0x1a0da6, 0x150

	.include "data/maps/text/LilycoveCity_DepartmentStoreElevator.s"
Route111_Text_1A0F93:: @ 81A0F93
	.string "The sandstorm is vicious.\n"
	.string "It’s impossible to keep going.$"

	.incbin "baserom.gba", 0x1a0fcc, 0x40

LittlerootTown_BrendansHouse_2F_Text_1A100C:: @ 81A100C
	.include "data/maps/text/LittlerootTown_MaysHouse_2F.s"
LittlerootTown_BrendansHouse_2F_Text_1A10D6:: @ 81A10D6
LittlerootTown_MaysHouse_2F_Text_1A10D6:: @ 81A10D6
	.string "{PLAYER} booted up the PC.$"

FallarborTown_ContestLobby_Text_1A10EB:: @ 81A10EB
	.string "The link was canceled.$"

MossdeepCity_StevensHouse_Text_1A1102:: @ 81A1102
RustboroCity_DevonCorp_2F_Text_1A1102:: @ 81A1102
	.string "Want to give a nickname to the\n"
	.string "{STR_VAR_2} you received?$"

	.global gUnknown_081A1132
gUnknown_081A1132: @ 81A1132

	.incbin "baserom.gba", 0x1a1132, 0x3c

SlateportCity_Text_1A116E:: @ 81A116E
	.string "Do you know the TM SECRET POWER?\p"
	.string "Our group, we love the TM SECRET\n"
	.string "POWER.\p"
	.string "One of our members will give it to you.\n"
	.string "Come back and show me if you get it.\p"
	.string "We’ll accept you as a member and sell\n"
	.string "you good stuff in secrecy.$"

OldaleTown_PokemonCenter_1F_Text_1A1245:: @ 81A1245
	.string "Okay, I’ll take your POKéMON for a\n"
	.string "few seconds.$"

OldaleTown_PokemonCenter_1F_Text_1A1275:: @ 81A1275
	.string "Your POKéMON may be infected with\n"
	.string "POKéRUS.\p"
	.string "Little is known about the POKéRUS\n"
	.string "except that they are microscopic life-\l"
	.string "forms that attach to POKéMON.\p"
	.string "While infected, POKéMON are said to\n"
	.string "grow exceptionally well.$"

	.incbin "baserom.gba", 0x1a1344, 0x47

	.include "data/maps/text/SealedChamber_InnerRoom.s"
	.include "data/maps/text/AncientTomb.s"
	.include "data/maps/text/DesertRuins.s"
	.include "data/maps/text/IslandCave.s"
	.include "data/maps/text/SealedChamber_OuterRoom.s"
	.include "data/maps/text/OldaleTown_PokemonCenter_2F.s"
FallarborTown_House1_Text_1A1498:: @ 81A1498
	.string "{PLAYER} handed over the\n"
	.string "{STR_VAR_1}.$"

	.global gUnknown_081A14AF
gUnknown_081A14AF: @ 81A14AF
	.incbin "baserom.gba", 0x001a14af, 0x9

	.global gUnknown_081A14B8
gUnknown_081A14B8: @ 81A14B8

	.incbin "baserom.gba", 0x1a14b8, 0x24

OldaleTown_PokemonCenter_1F_EventScript_1A14DC:: @ 81A14DC
PacifidlogTown_House2_EventScript_1A14DC:: @ 81A14DC
Route101_EventScript_1A14DC:: @ 81A14DC
	return

	.global gUnknown_081A14DD
gUnknown_081A14DD: @ 81A14DD

Route102_EventScript_1A14DD:: @ 81A14DD
Route103_EventScript_1A14DD:: @ 81A14DD
Route104_EventScript_1A14DD:: @ 81A14DD
Route110_EventScript_1A14DD:: @ 81A14DD
Route111_EventScript_1A14DD:: @ 81A14DD
Route112_EventScript_1A14DD:: @ 81A14DD
Route114_EventScript_1A14DD:: @ 81A14DD
Route115_EventScript_1A14DD:: @ 81A14DD
Route116_EventScript_1A14DD:: @ 81A14DD
Route117_EventScript_1A14DD:: @ 81A14DD
Route118_EventScript_1A14DD:: @ 81A14DD
Route119_EventScript_1A14DD:: @ 81A14DD
Route120_EventScript_1A14DD:: @ 81A14DD
Route121_EventScript_1A14DD:: @ 81A14DD
Route123_EventScript_1A14DD:: @ 81A14DD
Route130_EventScript_1A14DD:: @ 81A14DD
	special 43
	switch 0x8004
	case 255, Route102_EventScript_1A1533
	case 0, Route102_EventScript_1A153D
	case 1, Route102_EventScript_1A1595
	case 2, Route102_EventScript_1A15A2
	case 3, Route102_EventScript_1A15AF
	case 4, Route102_EventScript_1A15BC
	case 5, Route102_EventScript_1A15F9
	end

Route102_EventScript_1A1533:: @ 81A1533
	lockall
	message Route102_Text_1A1946
	waittext
	waitbutton
	releaseall
	end

Route102_EventScript_1A153D:: @ 81A153D
	lock
	faceplayer
	specialval RESULT, 49
	compare RESULT, 1
	jumpeq Route102_EventScript_1A1558
	message Route102_Text_1A16B6
	waittext
	waitbutton
	release
	end

Route102_EventScript_1A1558:: @ 81A1558
	msgbox Route102_Text_1A16CD, 5
	compare RESULT, 1
	jumpeq Route102_EventScript_1A1577
	compare RESULT, 0
	jumpeq Route102_EventScript_1A1593
	end

Route102_EventScript_1A1577:: @ 81A1577
	fadescreen 1
	closebutton
	special 44
	waitstate
	compare 0x800e, 0
	jumpeq Route102_EventScript_1A1593
	removeitem 0x800e, 1
	call Route102_EventScript_1A16A9

Route102_EventScript_1A1593:: @ 81A1593
	release
	end

Route102_EventScript_1A1595:: @ 81A1595
	lockall
	message Route102_Text_1A172C
	waittext
	waitbutton
	jump Route102_EventScript_1A165F

Route102_EventScript_1A15A2:: @ 81A15A2
	lockall
	message Route102_Text_1A174B
	waittext
	waitbutton
	jump Route102_EventScript_1A165F

Route102_EventScript_1A15AF:: @ 81A15AF
	lockall
	message Route102_Text_1A175C
	waittext
	waitbutton
	jump Route102_EventScript_1A165F

Route102_EventScript_1A15BC:: @ 81A15BC
	call Route102_EventScript_1A15CE
	lockall
	message Route102_Text_1A177D
	waittext
	waitbutton
	jump Route102_EventScript_1A165F

Route102_EventScript_1A15CE:: @ 81A15CE
	compare 0x8005, 0
	jumpeq Route102_EventScript_1A15F2
	compare 0x8005, 4
	jumpeq Route102_EventScript_1A15EB
	buffertext 1, Route102_Text_1A17B7
	return

Route102_EventScript_1A15EB:: @ 81A15EB
	buffertext 1, Route102_Text_1A179F
	return

Route102_EventScript_1A15F2:: @ 81A15F2
	buffertext 1, Route102_Text_1A17B0
	return

Route102_EventScript_1A15F9:: @ 81A15F9
	buffernum 1, 32774
	lock
	faceplayer
	msgbox Route102_Text_1A17C0, 5
	compare RESULT, 1
	jumpeq Route102_EventScript_1A161D
	compare RESULT, 0
	jumpeq Route102_EventScript_1A164B

Route102_EventScript_1A161D:: @ 81A161D
	special 46
	compare 0x8004, 0
	jumpeq Route102_EventScript_1A1642
	special 47
	message Route102_Text_1A17FD
	fanfare 387
	waittext
	waitfanfare
	waitbutton
	message Route102_Text_1A181A
	waittext
	waitbutton
	release
	end

Route102_EventScript_1A1642:: @ 81A1642
	message Route102_Text_1A1881
	waittext
	waitbutton
	release
	end

Route102_EventScript_1A164B:: @ 81A164B
	message Route102_Text_1A18C5
	waittext
	waitbutton
	release
	end

	.global gUnknown_081A1654
gUnknown_081A1654: @ 81A1654

	.incbin "baserom.gba", 0x1a1654, 0xb

Route102_EventScript_1A165F:: @ 81A165F
	checkitem ITEM_WAILMER_PAIL, 1
	compare RESULT, 0
	jumpeq Route102_EventScript_1A168D
	msgbox Route102_Text_1A18E6, 5
	compare RESULT, 1
	jumpeq Route102_EventScript_1A1693
	compare RESULT, 0
	jumpeq Route102_EventScript_1A168D

Route102_EventScript_1A168D:: @ 81A168D
	releaseall
	end

	.global gUnknown_081A168F
gUnknown_081A168F: @ 81A168F

	.incbin "baserom.gba", 0x1a168f, 0x4

Route102_EventScript_1A1693:: @ 81A1693
	message Route102_Text_1A1912
	waittext
	special 48
	special 94
	waitstate
	message Route102_Text_1A1925
	waittext
	waitbutton
	releaseall
	end

Route102_EventScript_1A16A9:: @ 81A16A9
	special 45
	inccounter 3
	message Route102_Text_1A16FB
	waittext
	waitbutton
	return

Route102_Text_1A16B6:: @ 81A16B6
	.string "It’s soft, loamy soil.$"

Route102_Text_1A16CD:: @ 81A16CD
	.string "It’s soft, loamy soil.\n"
	.string "Want to plant a BERRY?$"

Route102_Text_1A16FB:: @ 81A16FB
	.string "{PLAYER} planted one {STR_VAR_1} BERRY in\n"
	.string "the soft, loamy soil.$"

Route102_Text_1A172C:: @ 81A172C
	.string "One {STR_VAR_1} BERRY was planted here.$"

Route102_Text_1A174B:: @ 81A174B
	.string "{STR_VAR_1} has sprouted.$"

Route102_Text_1A175C:: @ 81A175C
	.string "This {STR_VAR_1} plant is growing taller.$"

Route102_Text_1A177D:: @ 81A177D
	.string "These {STR_VAR_1} flowers are blooming\n"
	.string "{STR_VAR_2}.$"

Route102_Text_1A179F:: @ 81A179F
	.string "very beautifully$"

Route102_Text_1A17B0:: @ 81A17B0
	.string "cutely$"

Route102_Text_1A17B7:: @ 81A17B7
	.string "prettily$"

Route102_Text_1A17C0:: @ 81A17C0
	.string "There are {STR_VAR_2} {STR_VAR_1} BERRIES!\p"
	.string "Do you want to pick the\n"
	.string "{STR_VAR_1} BERRIES?$"

Route102_Text_1A17FD:: @ 81A17FD
	.string "{PLAYER} picked the {STR_VAR_2} {STR_VAR_1} BERRIES.$"

Route102_Text_1A181A:: @ 81A181A
	.string "{PLAYER} put away the {STR_VAR_1} BERRIES\n"
	.string "in the BAG’s BERRIES POCKET.\p"
	.string "The soil returned to its soft and\n"
	.string "loamy state.$"

Route102_Text_1A1881:: @ 81A1881
	.string "The BAG’s BERRIES POCKET is full.\p"
	.string "The {STR_VAR_1} BERRIES couldn’t be taken.$"

Route102_Text_1A18C5:: @ 81A18C5
	.string "{PLAYER} left the {STR_VAR_1} BERRIES\n"
	.string "unpicked.$"

Route102_Text_1A18E6:: @ 81A18E6
	.string "Want to water the {STR_VAR_1} with the\n"
	.string "WAILMER PAIL?$"

Route102_Text_1A1912:: @ 81A1912
	.string "{PLAYER} watered the {STR_VAR_1}.$"

Route102_Text_1A1925:: @ 81A1925
	.string "The plant seems to be delighted.$"

Route102_Text_1A1946:: @ 81A1946
	.string "!$"

	.incbin "baserom.gba", 0x1a1948, 0x1a2

SecretBase_RedCave1_Text_1A1AEA:: @ 81A1AEA
	.string "Have you made a SECRET BASE already?\p"
	.string "I went here, there, everywhere before\n"
	.string "choosing this place.\p"
	.string "Since you’re already here, how would\n"
	.string "you like to battle?$"

SecretBase_RedCave1_Text_1A1B83:: @ 81A1B83
	.string "Okay!\n"
	.string "Here we come!$"

SecretBase_RedCave1_Text_1A1B97:: @ 81A1B97
	.string "Hunh?\n"
	.string "Oh, you can’t now...$"

	.global gUnknown_081A1BB2
gUnknown_081A1BB2: @ 81A1BB2

	.incbin "baserom.gba", 0x1a1bb2, 0x46

SecretBase_RedCave1_Text_1A1BF8:: @ 81A1BF8
	.string "What do you think of my SECRET BASE?\n"
	.string "Come visit me again tomorrow.$"

SecretBase_RedCave1_Text_1A1C3B:: @ 81A1C3B
	.string "Have you made a SECRET BASE already?\p"
	.string "I went here, there, everywhere before\n"
	.string "choosing this place.\p"
	.string "Feel free to hang out!$"

SecretBase_RedCave1_Text_1A1CB2:: @ 81A1CB2
	.string "There’re a lot of places where you can\n"
	.string "make a SECRET BASE.\p"
	.string "But I like this spot best.\n"
	.string "Don’t you think it’s nice?\p"
	.string "Oh, would you like to have a battle?$"

SecretBase_RedCave1_Text_1A1D48:: @ 81A1D48
	.string "Okay, here goes!$"

SecretBase_RedCave1_Text_1A1D59:: @ 81A1D59
	.string "Oh...\n"
	.string "You can’t now, okay.$"

	.global gUnknown_081A1D74
gUnknown_081A1D74: @ 81A1D74

	.incbin "baserom.gba", 0x1a1d74, 0x4c

SecretBase_RedCave1_Text_1A1DC0:: @ 81A1DC0
	.string "If you’re in this area again, I hope\n"
	.string "you’ll visit me.$"

SecretBase_RedCave1_Text_1A1DF6:: @ 81A1DF6
	.string "There’re a lot of places where you can\n"
	.string "make a SECRET BASE.\p"
	.string "But I like this spot best.\n"
	.string "Don’t you think it’s nice?$"

SecretBase_RedCave1_Text_1A1E67:: @ 81A1E67
	.string "This is a popular spot.\n"
	.string "It’s always taken.\p"
	.string "Oh! Were you thinking about taking this\n"
	.string "spot, too?\p"
	.string "I’ll tell you what, you can have this\n"
	.string "spot if you can beat me.$"

SecretBase_RedCave1_Text_1A1F04:: @ 81A1F04
	.string "Okay!\n"
	.string "I’m going to defend my SECRET BASE!$"

SecretBase_RedCave1_Text_1A1F2E:: @ 81A1F2E
	.string "Hunh? Is that right?\n"
	.string "You’re not interested in this spot?$"

	.global gUnknown_081A1F67
gUnknown_081A1F67: @ 81A1F67

	.incbin "baserom.gba", 0x1a1f67, 0x21

SecretBase_RedCave1_Text_1A1F88:: @ 81A1F88
	.string "Okay, when I move one day, this place\n"
	.string "will be yours!$"

SecretBase_RedCave1_Text_1A1FBD:: @ 81A1FBD
	.string "This is a popular spot.\n"
	.string "It’s always taken.\p"
	.string "I waited a long time for it to open.\n"
	.string "I finally got to use it!$"

SecretBase_RedCave1_Text_1A2026:: @ 81A2026
	.string "Welcome to my POKéMON LAB.\p"
	.string "I carry out research on battling in\n"
	.string "secrecy.\p"
	.string "Would you like to see how strong I am?$"

SecretBase_RedCave1_Text_1A2095:: @ 81A2095
	.string "I’m going to go all out!$"

SecretBase_RedCave1_Text_1A20AE:: @ 81A20AE
	.string "Oh.\n"
	.string "Some other time, then!$"

	.global gUnknown_081A20C9
gUnknown_081A20C9: @ 81A20C9

	.incbin "baserom.gba", 0x1a20c9, 0x40

SecretBase_RedCave1_Text_1A2109:: @ 81A2109
	.string "Thanks for battling with me.\n"
	.string "Please come back again tomorrow.$"

SecretBase_RedCave1_Text_1A2147:: @ 81A2147
	.string "Welcome to my POKéMON LAB.\p"
	.string "I carry out research on battling in\n"
	.string "secrecy.$"

SecretBase_RedCave1_Text_1A218F:: @ 81A218F
	.string "A big mansion is nice, but I like this\n"
	.string "sort of place more.\p"
	.string "I like it because all kinds of people\n"
	.string "come visit me.\p"
	.string "So, how would you like a battle?$"

SecretBase_RedCave1_Text_1A2220:: @ 81A2220
	.string "That’s the way!$"

SecretBase_RedCave1_Text_1A2230:: @ 81A2230
	.string "When you’re ready, give me a shout!$"

	.global gUnknown_081A2254
gUnknown_081A2254: @ 81A2254

	.incbin "baserom.gba", 0x1a2254, 0x2c

SecretBase_RedCave1_Text_1A2280:: @ 81A2280
	.string "Well, anyway, I should go buy some\n"
	.string "decorations and furniture.\p"
	.string "I want my SECRET BASE to be a place\n"
	.string "other people can enjoy.$"

SecretBase_RedCave1_Text_1A22FA:: @ 81A22FA
	.string "A big mansion is nice, but I like this\n"
	.string "sort of place more.\p"
	.string "I like it because all kinds of people\n"
	.string "come visit me.$"

SecretBase_RedCave1_Text_1A236A:: @ 81A236A
	.string "I simply adore shopping for decorations\n"
	.string "and furniture.\p"
	.string "I also love raising POKéMON just\n"
	.string "as much.\p"
	.string "If you would be so kind, will you battle\n"
	.string "with my POKéMON?$"

SecretBase_RedCave1_Text_1A2405:: @ 81A2405
	.string "Thank you.\n"
	.string "Shall we begin?$"

SecretBase_RedCave1_Text_1A2420:: @ 81A2420
	.string "Oh.\n"
	.string "How disappointing...$"

	.global gUnknown_081A2439
gUnknown_081A2439: @ 81A2439

	.incbin "baserom.gba", 0x1a2439, 0xd

SecretBase_RedCave1_Text_1A2446:: @ 81A2446
	.string "That was all in good fun!\n"
	.string "I should go enjoy shopping now.$"

SecretBase_RedCave1_Text_1A2480:: @ 81A2480
	.string "I simply adore shopping for decorations\n"
	.string "and furniture.\p"
	.string "I also love raising POKéMON just\n"
	.string "as much.$"

SecretBase_RedCave1_Text_1A24E1:: @ 81A24E1
	.string "Some people make their SECRET BASES in\n"
	.string "hard-to-find places.\l"
	.string "Do they want to just lie low?\p"
	.string "But since you found me, how about we\n"
	.string "have a battle?$"

SecretBase_RedCave1_Text_1A256F:: @ 81A256F
	.string "I’m not going down easily!$"

SecretBase_RedCave1_Text_1A258A:: @ 81A258A
	.string "Oh... Are you maybe tired from searching\n"
	.string "for this place?$"

	.global gUnknown_081A25C3
gUnknown_081A25C3: @ 81A25C3

	.incbin "baserom.gba", 0x1a25c3, 0xf

SecretBase_RedCave1_Text_1A25D2:: @ 81A25D2
	.string "Where’s your SECRET BASE?\n"
	.string "I should go visit you there.$"

SecretBase_RedCave1_Text_1A2609:: @ 81A2609
	.string "Some people make their SECRET BASES in\n"
	.string "hard-to-find places.\l"
	.string "Do they want to just lie low?$"

SecretBase_RedCave1_Text_1A2663:: @ 81A2663
	.string "People have told me that you can get\n"
	.string "decorations in several ways.\p"
	.string "We should have a race to see who can\n"
	.string "get nicer decorations and furniture!\p"
	.string "In the meantime, want to battle?$"

SecretBase_RedCave1_Text_1A2710:: @ 81A2710
	.string "This is my SECRET BASE.\n"
	.string "I can’t lose!$"

SecretBase_RedCave1_Text_1A2736:: @ 81A2736
	.string "I’ll battle with you anytime.$"

	.global gUnknown_081A2754
gUnknown_081A2754: @ 81A2754

	.incbin "baserom.gba", 0x1a2754, 0x16

SecretBase_RedCave1_Text_1A276A:: @ 81A276A
	.string "I won’t lose at collecting decorations.\n"
	.string "Come visit again!$"

SecretBase_RedCave1_Text_1A27A4:: @ 81A27A4
	.string "People have told me that you can get\n"
	.string "decorations in several ways.\p"
	.string "We should have a race to see who can\n"
	.string "get nicer decorations and furniture!$"

SecretBase_RedCave1_Text_1A2830:: @ 81A2830
	.string "I found a spot I liked, and I did it up\n"
	.string "with my favorite decorations.\p"
	.string "I raise my favorite POKéMON and grow\n"
	.string "stronger with it.\p"
	.string "That’s what I do.\n"
	.string "Want to battle with me?$"

SecretBase_RedCave1_Text_1A28D7:: @ 81A28D7
	.string "Show me what you’re made of!$"

SecretBase_RedCave1_Text_1A28F4:: @ 81A28F4
	.string "I guess there are times when you’re not\n"
	.string "into it.$"

	.global gUnknown_081A2925
gUnknown_081A2925: @ 81A2925

	.incbin "baserom.gba", 0x1a2925, 0x28

SecretBase_RedCave1_Text_1A294D:: @ 81A294D
	.string "We can both become stronger.\n"
	.string "Let’s keep at it!$"

SecretBase_RedCave1_Text_1A297C:: @ 81A297C
	.string "I found a spot I liked, and I did it up\n"
	.string "with my favorite decorations.\p"
	.string "I raise my favorite POKéMON and grow\n"
	.string "stronger with it.\p"
	.string "Every day is a great day.$"

SecretBase_RedCave1_Text_1A2A13:: @ 81A2A13
	.string "You can learn a lot about the taste\n"
	.string "and sense of people by the kinds of\l"
	.string "decorations they have, and how they\l"
	.string "display them.\p"
	.string "What do you think of my taste?\n"
	.string "Are you speechless?\p"
	.string "Want to see my taste in battling?$"

SecretBase_RedCave1_Text_1A2AE2:: @ 81A2AE2
	.string "There’s no holding back!$"

SecretBase_RedCave1_Text_1A2AFB:: @ 81A2AFB
	.string "I’ll be happy to demonstrate my style\n"
	.string "anytime.$"

	.global gUnknown_081A2B2A
gUnknown_081A2B2A: @ 81A2B2A

	.incbin "baserom.gba", 0x1a2b2a, 0x3f

SecretBase_RedCave1_Text_1A2B69:: @ 81A2B69
	.string "What did you think of my style?\n"
	.string "I’ll keep on polishing it!$"

SecretBase_RedCave1_Text_1A2BA4:: @ 81A2BA4
	.string "You can learn a lot about the taste\n"
	.string "and sense of people by the kinds of\l"
	.string "decorations they have, and how they\l"
	.string "display them.\p"
	.string "What do you think of my taste?\n"
	.string "Are you speechless?$"

	.global gUnknown_081A2C51
gUnknown_081A2C51: @ 81A2C51
	.incbin "baserom.gba", 0x001a2c51, 0x95

	.global gUnknown_081A2CE6
gUnknown_081A2CE6: @ 81A2CE6
	.incbin "baserom.gba", 0x001a2ce6, 0x58

	.global gUnknown_081A2D3E
gUnknown_081A2D3E: @ 81A2D3E
	.incbin "baserom.gba", 0x001a2d3e, 0x58

	.global gUnknown_081A2D96
gUnknown_081A2D96: @ 81A2D96

	.incbin "baserom.gba", 0x1a2d96, 0x48

SecretBase_RedCave1_EventScript_1A2DDE:: @ 81A2DDE
	move 255, SecretBase_RedCave1_Movement_1A2E11
	waitmove 0
	setvar 0x4097, 1
	msgbox SecretBase_RedCave1_Text_198F89, 5
	compare RESULT, 1
	jumpeq SecretBase_RedCave1_EventScript_1A2E08
	closebutton
	playsfx 9
	special 9
	end

SecretBase_RedCave1_EventScript_1A2E08:: @ 81A2E08
	closebutton
	setflag 96
	special 24
	waitstate
	end

SecretBase_RedCave1_Movement_1A2E11:: @ 81A2E11
	step_up
	step_up
	step_end

	.global gUnknown_081A2E14
gUnknown_081A2E14: @ 81A2E14

	.incbin "baserom.gba", 0x1a2e14, 0x129

LittlerootTown_BrendansHouse_2F_EventScript_1A2F3D:: @ 81A2F3D
LittlerootTown_MaysHouse_2F_EventScript_1A2F3D:: @ 81A2F3D
SecretBase_RedCave1_EventScript_1A2F3D:: @ 81A2F3D
	setflag 174
	setflag 175
	setflag 176
	setflag 177
	setflag 178
	setflag 179
	setflag 180
	setflag 181
	setflag 182
	setflag 183
	setflag 184
	setflag 185
	setflag 186
	setflag 187
	return

LittlerootTown_BrendansHouse_2F_EventScript_1A2F68:: @ 81A2F68
LittlerootTown_MaysHouse_2F_EventScript_1A2F68:: @ 81A2F68
SecretBase_RedCave1_EventScript_1A2F68:: @ 81A2F68
	setvar 0x8004, 0
	setvar 0x8005, 0
	special 18
	setvar 0x4089, 1
	end

	.global gUnknown_081A2F7B
gUnknown_081A2F7B: @ 81A2F7B
	.incbin "baserom.gba", 0x001a2f7b, 0xf

	.global gUnknown_081A2F8A
gUnknown_081A2F8A: @ 81A2F8A

	.incbin "baserom.gba", 0x1a2f8a, 0x36

SecretBase_BlueCave1_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_BlueCave2_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_BlueCave3_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_BlueCave4_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_BrownCave1_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_BrownCave2_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_BrownCave3_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_BrownCave4_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_RedCave1_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_RedCave2_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_RedCave3_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_RedCave4_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_Shrub1_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_Shrub2_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_Shrub3_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_Shrub4_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_Tree1_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_Tree2_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_Tree3_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_Tree4_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_YellowCave1_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_YellowCave2_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_YellowCave3_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_YellowCave4_EventScript_1A2FC0:: @ 81A2FC0
	special 17
	compare 0x8004, 0
	jumpeq SecretBase_RedCave1_EventScript_1A3032
	compare 0x8004, 1
	jumpeq SecretBase_RedCave1_EventScript_1A30AE
	compare 0x8004, 2
	jumpeq SecretBase_RedCave1_EventScript_1A312A
	compare 0x8004, 3
	jumpeq SecretBase_RedCave1_EventScript_1A31A6
	compare 0x8004, 4
	jumpeq SecretBase_RedCave1_EventScript_1A3222
	compare 0x8004, 5
	jumpeq SecretBase_RedCave1_EventScript_1A329E
	compare 0x8004, 6
	jumpeq SecretBase_RedCave1_EventScript_1A331A
	compare 0x8004, 7
	jumpeq SecretBase_RedCave1_EventScript_1A3396
	compare 0x8004, 8
	jumpeq SecretBase_RedCave1_EventScript_1A3412
	compare 0x8004, 9
	jumpeq SecretBase_RedCave1_EventScript_1A348E
	end

SecretBase_RedCave1_EventScript_1A3032:: @ 81A3032
	checkflag 2052
	jumpif 0, SecretBase_RedCave1_EventScript_1A3086
	compare RESULT, 1
	jumpeq SecretBase_RedCave1_EventScript_1A30A5
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A1AEA, 5
	compare RESULT, 0
	jumpeq SecretBase_RedCave1_EventScript_1A308F
	setvar RESULT, 1
	special 25
	call SecretBase_RedCave1_EventScript_19F806
	compare RESULT, 0
	jumpeq SecretBase_RedCave1_EventScript_1A308F
	hidebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A1B83, 4
	jump SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A3086:: @ 81A3086
	msgbox SecretBase_RedCave1_Text_1A1C3B, 2
	end

SecretBase_RedCave1_EventScript_1A308F:: @ 81A308F
	setvar RESULT, 0
	special 25
	hidebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A1B97, 2
	end

SecretBase_RedCave1_EventScript_1A30A5:: @ 81A30A5
	msgbox SecretBase_RedCave1_Text_1A1BF8, 2
	end

SecretBase_RedCave1_EventScript_1A30AE:: @ 81A30AE
	checkflag 2052
	jumpif 0, SecretBase_RedCave1_EventScript_1A3102
	compare RESULT, 1
	jumpeq SecretBase_RedCave1_EventScript_1A3121
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A1E67, 5
	compare RESULT, 0
	jumpeq SecretBase_RedCave1_EventScript_1A310B
	setvar RESULT, 1
	special 25
	call SecretBase_RedCave1_EventScript_19F806
	compare RESULT, 0
	jumpeq SecretBase_RedCave1_EventScript_1A310B
	hidebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A1F04, 4
	jump SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A3102:: @ 81A3102
	msgbox SecretBase_RedCave1_Text_1A1FBD, 2
	end

SecretBase_RedCave1_EventScript_1A310B:: @ 81A310B
	setvar RESULT, 0
	special 25
	hidebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A1F2E, 2
	end

SecretBase_RedCave1_EventScript_1A3121:: @ 81A3121
	msgbox SecretBase_RedCave1_Text_1A1F88, 2
	end

SecretBase_RedCave1_EventScript_1A312A:: @ 81A312A
	checkflag 2052
	jumpif 0, SecretBase_RedCave1_EventScript_1A317E
	compare RESULT, 1
	jumpeq SecretBase_RedCave1_EventScript_1A319D
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A218F, 5
	compare RESULT, 0
	jumpeq SecretBase_RedCave1_EventScript_1A3187
	setvar RESULT, 1
	special 25
	call SecretBase_RedCave1_EventScript_19F806
	compare RESULT, 0
	jumpeq SecretBase_RedCave1_EventScript_1A3187
	hidebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2220, 4
	jump SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A317E:: @ 81A317E
	msgbox SecretBase_RedCave1_Text_1A22FA, 2
	end

SecretBase_RedCave1_EventScript_1A3187:: @ 81A3187
	setvar RESULT, 0
	special 25
	hidebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2230, 2
	end

SecretBase_RedCave1_EventScript_1A319D:: @ 81A319D
	msgbox SecretBase_RedCave1_Text_1A2280, 2
	end

SecretBase_RedCave1_EventScript_1A31A6:: @ 81A31A6
	checkflag 2052
	jumpif 0, SecretBase_RedCave1_EventScript_1A31FA
	compare RESULT, 1
	jumpeq SecretBase_RedCave1_EventScript_1A3219
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A24E1, 5
	compare RESULT, 0
	jumpeq SecretBase_RedCave1_EventScript_1A3203
	setvar RESULT, 1
	special 25
	call SecretBase_RedCave1_EventScript_19F806
	compare RESULT, 0
	jumpeq SecretBase_RedCave1_EventScript_1A3203
	hidebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A256F, 4
	jump SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A31FA:: @ 81A31FA
	msgbox SecretBase_RedCave1_Text_1A2609, 2
	end

SecretBase_RedCave1_EventScript_1A3203:: @ 81A3203
	setvar RESULT, 0
	special 25
	hidebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A258A, 2
	end

SecretBase_RedCave1_EventScript_1A3219:: @ 81A3219
	msgbox SecretBase_RedCave1_Text_1A25D2, 2
	end

SecretBase_RedCave1_EventScript_1A3222:: @ 81A3222
	checkflag 2052
	jumpif 0, SecretBase_RedCave1_EventScript_1A3276
	compare RESULT, 1
	jumpeq SecretBase_RedCave1_EventScript_1A3295
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A2830, 5
	compare RESULT, 0
	jumpeq SecretBase_RedCave1_EventScript_1A327F
	setvar RESULT, 1
	special 25
	call SecretBase_RedCave1_EventScript_19F806
	compare RESULT, 0
	jumpeq SecretBase_RedCave1_EventScript_1A327F
	hidebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A28D7, 4
	jump SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A3276:: @ 81A3276
	msgbox SecretBase_RedCave1_Text_1A297C, 2
	end

SecretBase_RedCave1_EventScript_1A327F:: @ 81A327F
	setvar RESULT, 0
	special 25
	hidebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A28F4, 2
	end

SecretBase_RedCave1_EventScript_1A3295:: @ 81A3295
	msgbox SecretBase_RedCave1_Text_1A294D, 2
	end

SecretBase_RedCave1_EventScript_1A329E:: @ 81A329E
	checkflag 2052
	jumpif 0, SecretBase_RedCave1_EventScript_1A32F2
	compare RESULT, 1
	jumpeq SecretBase_RedCave1_EventScript_1A3311
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A1CB2, 5
	compare RESULT, 0
	jumpeq SecretBase_RedCave1_EventScript_1A32FB
	setvar RESULT, 1
	special 25
	call SecretBase_RedCave1_EventScript_19F806
	compare RESULT, 0
	jumpeq SecretBase_RedCave1_EventScript_1A32FB
	hidebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A1D48, 4
	jump SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A32F2:: @ 81A32F2
	msgbox SecretBase_RedCave1_Text_1A1DF6, 2
	end

SecretBase_RedCave1_EventScript_1A32FB:: @ 81A32FB
	setvar RESULT, 0
	special 25
	hidebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A1D59, 2
	end

SecretBase_RedCave1_EventScript_1A3311:: @ 81A3311
	msgbox SecretBase_RedCave1_Text_1A1DC0, 2
	end

SecretBase_RedCave1_EventScript_1A331A:: @ 81A331A
	checkflag 2052
	jumpif 0, SecretBase_RedCave1_EventScript_1A336E
	compare RESULT, 1
	jumpeq SecretBase_RedCave1_EventScript_1A338D
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A2026, 5
	compare RESULT, 0
	jumpeq SecretBase_RedCave1_EventScript_1A3377
	setvar RESULT, 1
	special 25
	call SecretBase_RedCave1_EventScript_19F806
	compare RESULT, 0
	jumpeq SecretBase_RedCave1_EventScript_1A3377
	hidebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2095, 4
	jump SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A336E:: @ 81A336E
	msgbox SecretBase_RedCave1_Text_1A2147, 2
	end

SecretBase_RedCave1_EventScript_1A3377:: @ 81A3377
	setvar RESULT, 0
	special 25
	hidebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A20AE, 2
	end

SecretBase_RedCave1_EventScript_1A338D:: @ 81A338D
	msgbox SecretBase_RedCave1_Text_1A2109, 2
	end

SecretBase_RedCave1_EventScript_1A3396:: @ 81A3396
	checkflag 2052
	jumpif 0, SecretBase_RedCave1_EventScript_1A33EA
	compare RESULT, 1
	jumpeq SecretBase_RedCave1_EventScript_1A3409
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A236A, 5
	compare RESULT, 0
	jumpeq SecretBase_RedCave1_EventScript_1A33F3
	setvar RESULT, 1
	special 25
	call SecretBase_RedCave1_EventScript_19F806
	compare RESULT, 0
	jumpeq SecretBase_RedCave1_EventScript_1A33F3
	hidebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2405, 4
	jump SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A33EA:: @ 81A33EA
	msgbox SecretBase_RedCave1_Text_1A2480, 2
	end

SecretBase_RedCave1_EventScript_1A33F3:: @ 81A33F3
	setvar RESULT, 0
	special 25
	hidebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2420, 2
	end

SecretBase_RedCave1_EventScript_1A3409:: @ 81A3409
	msgbox SecretBase_RedCave1_Text_1A2446, 2
	end

SecretBase_RedCave1_EventScript_1A3412:: @ 81A3412
	checkflag 2052
	jumpif 0, SecretBase_RedCave1_EventScript_1A3466
	compare RESULT, 1
	jumpeq SecretBase_RedCave1_EventScript_1A3485
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A2663, 5
	compare RESULT, 0
	jumpeq SecretBase_RedCave1_EventScript_1A346F
	setvar RESULT, 1
	special 25
	call SecretBase_RedCave1_EventScript_19F806
	compare RESULT, 0
	jumpeq SecretBase_RedCave1_EventScript_1A346F
	hidebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2710, 4
	jump SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A3466:: @ 81A3466
	msgbox SecretBase_RedCave1_Text_1A27A4, 2
	end

SecretBase_RedCave1_EventScript_1A346F:: @ 81A346F
	setvar RESULT, 0
	special 25
	hidebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2736, 2
	end

SecretBase_RedCave1_EventScript_1A3485:: @ 81A3485
	msgbox SecretBase_RedCave1_Text_1A276A, 2
	end

SecretBase_RedCave1_EventScript_1A348E:: @ 81A348E
	checkflag 2052
	jumpif 0, SecretBase_RedCave1_EventScript_1A34E2
	compare RESULT, 1
	jumpeq SecretBase_RedCave1_EventScript_1A3501
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A2A13, 5
	compare RESULT, 0
	jumpeq SecretBase_RedCave1_EventScript_1A34EB
	setvar RESULT, 1
	special 25
	call SecretBase_RedCave1_EventScript_19F806
	compare RESULT, 0
	jumpeq SecretBase_RedCave1_EventScript_1A34EB
	hidebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2AE2, 4
	jump SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A34E2:: @ 81A34E2
	msgbox SecretBase_RedCave1_Text_1A2BA4, 2
	end

SecretBase_RedCave1_EventScript_1A34EB:: @ 81A34EB
	setvar RESULT, 0
	special 25
	hidebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2AFB, 2
	end

SecretBase_RedCave1_EventScript_1A3501:: @ 81A3501
	msgbox SecretBase_RedCave1_Text_1A2B69, 2
	end

SecretBase_RedCave1_EventScript_1A350A:: @ 81A350A
	special 16
	setvar 0x8004, 1
	setvar 0x8005, 0
	special 236
	waitstate
	special 0
	release
	end

Route111_Text_1A3520:: @ 81A3520
	.string "What’s that?\n"
	.string "What am I doing?\p"
	.string "I’m thinking about making my own room\n"
	.string "here using a POKéMON move.\p"
	.string "I know! I’ll give you this TM.\n"
	.string "Will you use it to make your own room?$"

Route111_Text_1A35C5:: @ 81A35C5
	.string "Find a big tree that looks like it might\n"
	.string "drop some vines.\p"
	.string "Use SECRET POWER in front of the tree.\n"
	.string "Some vines should get free and drop\l"
	.string "down, so you can climb the tree.\p"
	.string "You’ll find a lot of space for putting\n"
	.string "your favorite things.\p"
	.string "It’ll be your own secret room...\n"
	.string "A SECRET BASE!\p"
	.string "You should make one, too.\p"
	.string "Another thing, you don’t always have\n"
	.string "to make your SECRET BASE in a tree.\p"
	.string "Try using SECRET POWER on rock walls\n"
	.string "that have small indents in them.\p"
	.string "I’m going to look for other places, too.\n"
	.string "Okay, bye!$"

Route111_Text_1A37B5:: @ 81A37B5
	.string "Oh, you don’t want this?\n"
	.string "If you change your mind, tell me, okay?$"

Route111_Text_1A37F6:: @ 81A37F6
	.string "Oh, you don’t have any room for this.\p"
	.string "I’ll hold on to it, so come back for it\n"
	.string "another time, okay?$"

Route111_EventScript_1A3858:: @ 81A3858
	lock
	faceplayer
	msgbox Route111_Text_1A3520, 5
	compare RESULT, 1
	jumpeq Route111_EventScript_1A3877
	msgbox Route111_Text_1A37B5, 4
	release
	end

Route111_EventScript_1A3877:: @ 81A3877
	giveitem ITEM_TM43
	compare RESULT, 0
	jumpeq Route111_EventScript_1A38D9
	msgbox Route111_Text_1A35C5, 4
	closebutton
	setflag 96
	clearflag 948
	compare FACING, 3
	callif 1, Route111_EventScript_1A38C3
	compare FACING, 4
	callif 1, Route111_EventScript_1A38C3
	compare FACING, 2
	callif 1, Route111_EventScript_1A38CE
	disappear LAST_TALKED
	release
	end

Route111_EventScript_1A38C3:: @ 81A38C3
	move LAST_TALKED, Route111_Movement_1A38E3
	waitmove 0
	return

Route111_EventScript_1A38CE:: @ 81A38CE
	move LAST_TALKED, Route111_Movement_1A38EF
	waitmove 0
	return

Route111_EventScript_1A38D9:: @ 81A38D9
	msgbox Route111_Text_1A37F6, 4
	release
	end

Route111_Movement_1A38E3:: @ 81A38E3
	step_down
	step_down
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_down
	step_down
	step_end

Route111_Movement_1A38EF:: @ 81A38EF
	step_left
	step_down
	step_down
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_down
	step_down
	step_end

	.incbin "baserom.gba", 0x1a38fb, 0x408

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
	map_script_2 0x4087, 1, OldaleTown_PokemonCenter_2F_EventScript_1A3D2D
	map_script_2 0x4087, 2, OldaleTown_PokemonCenter_2F_EventScript_1A3D2D
	map_script_2 0x4087, 5, OldaleTown_PokemonCenter_2F_EventScript_1A3D2D
	map_script_2 0x4087, 3, OldaleTown_PokemonCenter_2F_EventScript_1A3D2D
	map_script_2 0x4087, 4, OldaleTown_PokemonCenter_2F_EventScript_1A3D2D
	.2byte 0

OldaleTown_PokemonCenter_2F_EventScript_1A3D2D:: @ 81A3D2D
	spriteface 0x8007, 4
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
	compare 0x4087, 1
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A3D6A
	compare 0x4087, 2
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A3D6A
	compare 0x4087, 5
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A3D6A
	compare 0x4087, 3
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A3D74
	compare 0x4087, 4
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A3D7E
	end

OldaleTown_PokemonCenter_2F_EventScript_1A3D6A:: @ 81A3D6A
	setmaptile 5, 3, 514, 0
	end

OldaleTown_PokemonCenter_2F_EventScript_1A3D74:: @ 81A3D74
	setmaptile 8, 3, 514, 0
	end

OldaleTown_PokemonCenter_2F_EventScript_1A3D7E:: @ 81A3D7E
	setmaptile 11, 3, 514, 0
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
	map_script_2 0x4087, 1, OldaleTown_PokemonCenter_2F_EventScript_1A3E8D
	map_script_2 0x4087, 2, OldaleTown_PokemonCenter_2F_EventScript_1A3E8D
	map_script_2 0x4087, 5, OldaleTown_PokemonCenter_2F_EventScript_1A3E8D
	map_script_2 0x4087, 3, OldaleTown_PokemonCenter_2F_EventScript_1A3E17
	map_script_2 0x4087, 4, OldaleTown_PokemonCenter_2F_EventScript_1A3E7B
	.2byte 0

OldaleTown_PokemonCenter_2F_EventScript_1A3DB2:: @ 81A3DB2
	special 31
	setvar 0x4087, 0
	move 255, OldaleTown_PokemonCenter_2F_Movement_1A4358
	waitmove 0
	compare 0x8007, 0
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A3DD9
	move 0x8007, OldaleTown_PokemonCenter_2F_Movement_1A4354
	waitmove 0

OldaleTown_PokemonCenter_2F_EventScript_1A3DD9:: @ 81A3DD9
	return

OldaleTown_PokemonCenter_2F_EventScript_1A3DDA:: @ 81A3DDA
	special 31
	setvar 0x4087, 0
	compare 0x8007, 0
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A3E0C
	move 0x8007, OldaleTown_PokemonCenter_2F_Movement_1A4356
	waitmove 0
	move 255, OldaleTown_PokemonCenter_2F_Movement_1A4358
	waitmove 0
	move 0x8007, OldaleTown_PokemonCenter_2F_Movement_1A4354
	waitmove 0
	return

OldaleTown_PokemonCenter_2F_EventScript_1A3E0C:: @ 81A3E0C
	move 255, OldaleTown_PokemonCenter_2F_Movement_1A4358
	waitmove 0
	return

OldaleTown_PokemonCenter_2F_EventScript_1A3E17:: @ 81A3E17
	lockall
	call OldaleTown_PokemonCenter_2F_EventScript_1A3E30
	setmaptile 8, 3, 605, 1
	special 142
	hidebox 0, 0, 29, 19
	releaseall
	end

OldaleTown_PokemonCenter_2F_EventScript_1A3E30:: @ 81A3E30
	special 31
	setvar 0x4087, 0
	compare 0x8007, 0
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A3E0C
	move 255, OldaleTown_PokemonCenter_2F_Movement_1A4361
	waitmove 0
	move 0x8007, OldaleTown_PokemonCenter_2F_Movement_1A4356
	waitmove 0
	message OldaleTown_PokemonCenter_2F_Text_1A4E50
	waittext
	playsfx 21
	message OldaleTown_PokemonCenter_2F_Text_1A4E79
	waittext
	move 255, OldaleTown_PokemonCenter_2F_Movement_1A4358
	waitmove 0
	move 0x8007, OldaleTown_PokemonCenter_2F_Movement_1A4354
	waitmove 0
	return

OldaleTown_PokemonCenter_2F_EventScript_1A3E7B:: @ 81A3E7B
	call OldaleTown_PokemonCenter_2F_EventScript_1A3DB2
	setmaptile 11, 3, 605, 1
	special 142
	end

OldaleTown_PokemonCenter_2F_EventScript_1A3E8D:: @ 81A3E8D
	lockall
	call OldaleTown_PokemonCenter_2F_EventScript_1A3DDA
	setmaptile 5, 3, 605, 1
	special 142
	hidebox 0, 0, 29, 19
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
	checkflag 2049
	jumpif 0, OldaleTown_PokemonCenter_2F_EventScript_1A4342
	copyvar 0x8007, LAST_TALKED
	lock
	faceplayer
	message OldaleTown_PokemonCenter_2F_Text_1A4510
	waittext

OldaleTown_PokemonCenter_2F_EventScript_1A3EBC:: @ 81A3EBC
	multichoice 17, 6, 17, 0
	switch RESULT
	case 0, OldaleTown_PokemonCenter_2F_EventScript_1A3EF2
	case 1, OldaleTown_PokemonCenter_2F_EventScript_1A4319
	case 2, OldaleTown_PokemonCenter_2F_EventScript_1A3FDD
	case 127, OldaleTown_PokemonCenter_2F_EventScript_1A4319

OldaleTown_PokemonCenter_2F_EventScript_1A3EF2:: @ 81A3EF2
	call OldaleTown_PokemonCenter_2F_EventScript_19F806
	compare RESULT, 0
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A4319
	call OldaleTown_PokemonCenter_2F_EventScript_1A3FEF
	compare 0x8004, 0
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A4319
	message OldaleTown_PokemonCenter_2F_Text_1A490C
	waittext
	special 28
	waitstate
	compare RESULT, 1
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A3F5E
	compare RESULT, 2
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A4301
	compare RESULT, 3
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A430D
	compare RESULT, 4
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A4068
	compare RESULT, 5
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A4319
	compare RESULT, 6
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A42F5

OldaleTown_PokemonCenter_2F_EventScript_1A3F5E:: @ 81A3F5E
	special 0
	special 39
	special 331
	copyvar 0x4087, 0x8004
	message2 OldaleTown_PokemonCenter_2F_Text_1A4A22
	waittext
	setmaptile 5, 3, 514, 0
	special 142
	pause 60
	move LAST_TALKED, OldaleTown_PokemonCenter_2F_Movement_1A4356
	waitmove 0
	closebutton
	move 255, OldaleTown_PokemonCenter_2F_Movement_1A435B
	waitmove 0
	setdooropened 5, 1
	doorchange
	move 255, OldaleTown_PokemonCenter_2F_Movement_1A435F
	waitmove 0
	spriteinvisible 255, 0, 0
	setdoorclosed 5, 1
	doorchange
	release
	compare 0x8004, 5
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A3FCD
	special 1
	warp SingleBattleColosseum, 255, 6, 8
	special 2
	waitstate
	end

OldaleTown_PokemonCenter_2F_EventScript_1A3FCD:: @ 81A3FCD
	special 1
	warp DoubleBattleColosseum, 255, 5, 8
	special 2
	waitstate
	end

OldaleTown_PokemonCenter_2F_EventScript_1A3FDD:: @ 81A3FDD
	message OldaleTown_PokemonCenter_2F_Text_1A4696
	waittext
	waitbutton
	message OldaleTown_PokemonCenter_2F_Text_1A4826
	waittext
	jump OldaleTown_PokemonCenter_2F_EventScript_1A3EBC

OldaleTown_PokemonCenter_2F_EventScript_1A3FEF:: @ 81A3FEF
	message OldaleTown_PokemonCenter_2F_Text_1A4840
	waittext
	multichoice 0, 0, 18, 0
	switch RESULT
	case 0, OldaleTown_PokemonCenter_2F_EventScript_1A4062
	case 1, OldaleTown_PokemonCenter_2F_EventScript_1A4042
	case 2, OldaleTown_PokemonCenter_2F_EventScript_1A403C
	case 3, OldaleTown_PokemonCenter_2F_EventScript_1A4036
	case 127, OldaleTown_PokemonCenter_2F_EventScript_1A4036

OldaleTown_PokemonCenter_2F_EventScript_1A4036:: @ 81A4036
	setvar 0x8004, 0
	return

OldaleTown_PokemonCenter_2F_EventScript_1A403C:: @ 81A403C
	setvar 0x8004, 5
	return

OldaleTown_PokemonCenter_2F_EventScript_1A4042:: @ 81A4042
	special 61
	compare RESULT, 0
	jumpif 5, OldaleTown_PokemonCenter_2F_EventScript_1A4056
	setvar 0x8004, 2
	return

OldaleTown_PokemonCenter_2F_EventScript_1A4056:: @ 81A4056
	message OldaleTown_PokemonCenter_2F_Text_1A486A
	waittext
	waitbutton
	jump OldaleTown_PokemonCenter_2F_EventScript_1A3FEF

OldaleTown_PokemonCenter_2F_EventScript_1A4062:: @ 81A4062
	setvar 0x8004, 1
	return

OldaleTown_PokemonCenter_2F_EventScript_1A4068:: @ 81A4068
	switch 0x8004
	case 1, OldaleTown_PokemonCenter_2F_EventScript_1A40B1
	case 2, OldaleTown_PokemonCenter_2F_EventScript_1A40A2
	case 5, OldaleTown_PokemonCenter_2F_EventScript_1A4093
	jump OldaleTown_PokemonCenter_2F_EventScript_1A432D

OldaleTown_PokemonCenter_2F_EventScript_1A4093:: @ 81A4093
	special 31
	message OldaleTown_PokemonCenter_2F_Text_1A4C03
	waittext
	waitbutton
	jump OldaleTown_PokemonCenter_2F_EventScript_1A40C0

OldaleTown_PokemonCenter_2F_EventScript_1A40A2:: @ 81A40A2
	special 31
	message OldaleTown_PokemonCenter_2F_Text_1A4BCC
	waittext
	waitbutton
	jump OldaleTown_PokemonCenter_2F_EventScript_1A40C0

OldaleTown_PokemonCenter_2F_EventScript_1A40B1:: @ 81A40B1
	special 31
	message OldaleTown_PokemonCenter_2F_Text_1A4B95
	waittext
	waitbutton
	jump OldaleTown_PokemonCenter_2F_EventScript_1A40C0

OldaleTown_PokemonCenter_2F_EventScript_1A40C0:: @ 81A40C0
	special 31
	message OldaleTown_PokemonCenter_2F_Text_1A4C38
	waittext
	waitbutton
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
	checkflag 2049
	jumpif 0, OldaleTown_PokemonCenter_2F_EventScript_1A4339
	copyvar 0x8007, LAST_TALKED
	lock
	faceplayer
	msgbox OldaleTown_PokemonCenter_2F_Text_1A457E, 5
	compare RESULT, 0
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A4319
	compare RESULT, 1
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A40FA

OldaleTown_PokemonCenter_2F_EventScript_1A40FA:: @ 81A40FA
	call OldaleTown_PokemonCenter_2F_EventScript_1A41BB
	compare RESULT, 0
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A4319
	call OldaleTown_PokemonCenter_2F_EventScript_19F806
	compare RESULT, 0
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A4319
	message OldaleTown_PokemonCenter_2F_Text_1A490C
	waittext
	special 29
	waitstate
	compare RESULT, 1
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A4166
	compare RESULT, 2
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A4301
	compare RESULT, 3
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A430D
	compare RESULT, 4
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A432D
	compare RESULT, 5
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A4319
	compare RESULT, 6
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A42F5

OldaleTown_PokemonCenter_2F_EventScript_1A4166:: @ 81A4166
	setvar 0x8004, 3
	copyvar 0x4087, 0x8004
	message2 OldaleTown_PokemonCenter_2F_Text_1A4A22
	waittext
	setmaptile 8, 3, 514, 0
	special 142
	pause 60
	move LAST_TALKED, OldaleTown_PokemonCenter_2F_Movement_1A4356
	waitmove 0
	closebutton
	move 255, OldaleTown_PokemonCenter_2F_Movement_1A435B
	waitmove 0
	setdooropened 8, 1
	doorchange
	move 255, OldaleTown_PokemonCenter_2F_Movement_1A435F
	waitmove 0
	spriteinvisible 255, 0, 0
	setdoorclosed 8, 1
	doorchange
	release
	jump OldaleTown_PokemonCenter_2F_EventScript_1A4325

OldaleTown_PokemonCenter_2F_EventScript_1A41BB:: @ 81A41BB
	specialval RESULT, 131
	compare RESULT, 2
	jumpif 0, OldaleTown_PokemonCenter_2F_EventScript_1A41E1
	specialval RESULT, 339
	compare RESULT, 1
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A41EE
	setvar RESULT, 1
	return

OldaleTown_PokemonCenter_2F_EventScript_1A41E1:: @ 81A41E1
	message OldaleTown_PokemonCenter_2F_Text_1A48A3
	waittext
	waitbutton
	setvar RESULT, 0
	return

OldaleTown_PokemonCenter_2F_EventScript_1A41EE:: @ 81A41EE
	message OldaleTown_PokemonCenter_2F_Text_1A48DD
	waittext
	waitbutton
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
	checkflag 2072
	jumpif 0, OldaleTown_PokemonCenter_2F_EventScript_1A434B
	copyvar 0x8007, LAST_TALKED
	lock
	faceplayer
	msgbox OldaleTown_PokemonCenter_2F_Text_1A45FE, 5
	compare RESULT, 0
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A4319
	compare RESULT, 1
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A4229

OldaleTown_PokemonCenter_2F_EventScript_1A4229:: @ 81A4229
	call OldaleTown_PokemonCenter_2F_EventScript_19F806
	compare RESULT, 0
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A4319
	message OldaleTown_PokemonCenter_2F_Text_1A490C
	waittext
	special 30
	waitstate
	special 341
	waitstate
	compare RESULT, 1
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A4294
	compare RESULT, 2
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A4301
	compare RESULT, 3
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A430D
	compare RESULT, 4
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A432D
	compare RESULT, 5
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A4319
	compare RESULT, 6
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A42F5
	compare RESULT, 7
	jumpeq OldaleTown_PokemonCenter_2F_EventScript_1A42E9

OldaleTown_PokemonCenter_2F_EventScript_1A4294:: @ 81A4294
	setvar 0x8004, 4
	copyvar 0x4087, 0x8004
	message2 OldaleTown_PokemonCenter_2F_Text_1A4A22
	waittext
	setmaptile 11, 3, 514, 0
	special 142
	pause 60
	move LAST_TALKED, OldaleTown_PokemonCenter_2F_Movement_1A4356
	waitmove 0
	closebutton
	move 255, OldaleTown_PokemonCenter_2F_Movement_1A435B
	waitmove 0
	setdooropened 11, 1
	doorchange
	move 255, OldaleTown_PokemonCenter_2F_Movement_1A435F
	waitmove 0
	spriteinvisible 255, 0, 0
	setdoorclosed 11, 1
	doorchange
	release
	jump OldaleTown_PokemonCenter_2F_EventScript_1A4325

OldaleTown_PokemonCenter_2F_EventScript_1A42E9:: @ 81A42E9
	special 31
	message OldaleTown_PokemonCenter_2F_Text_1A4AC8
	waittext
	waitbutton
	release
	end

OldaleTown_PokemonCenter_2F_EventScript_1A42F5:: @ 81A42F5
	special 31
	message OldaleTown_PokemonCenter_2F_Text_1A4A85
	waittext
	waitbutton
	release
	end

OldaleTown_PokemonCenter_2F_EventScript_1A4301:: @ 81A4301
	special 31
	message OldaleTown_PokemonCenter_2F_Text_1A4A30
	waittext
	waitbutton
	release
	end

OldaleTown_PokemonCenter_2F_EventScript_1A430D:: @ 81A430D
	special 31
	message OldaleTown_PokemonCenter_2F_Text_1A4B1D
	waittext
	waitbutton
	release
	end

OldaleTown_PokemonCenter_2F_EventScript_1A4319:: @ 81A4319
	special 31
	message OldaleTown_PokemonCenter_2F_Text_1A4B59
	waittext
	waitbutton
	release
	end

OldaleTown_PokemonCenter_2F_EventScript_1A4325:: @ 81A4325
	special 1
	special 2
	waitstate
	end

OldaleTown_PokemonCenter_2F_EventScript_1A432D:: @ 81A432D
	special 31
	message OldaleTown_PokemonCenter_2F_Text_1A4B6C
	waittext
	waitbutton
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
	step_00
	step_end

OldaleTown_PokemonCenter_2F_Movement_1A4356:: @ 81A4356
	step_03
	step_end

OldaleTown_PokemonCenter_2F_Movement_1A4358:: @ 81A4358
	step_down
	step_down
	step_end

OldaleTown_PokemonCenter_2F_Movement_1A435B:: @ 81A435B
	step_right
	step_up
	step_up
	step_end

OldaleTown_PokemonCenter_2F_Movement_1A435F:: @ 81A435F
	step_up
	step_end

OldaleTown_PokemonCenter_2F_Movement_1A4361:: @ 81A4361
	step_02
	step_end

	.global gUnknown_081A4363
gUnknown_081A4363: @ 81A4363
	.incbin "baserom.gba", 0x001a4363, 0xc

	.global gUnknown_081A436F
gUnknown_081A436F: @ 81A436F

SingleBattleColosseum_EventScript_1A436F:: @ 81A436F
	setvar 0x8005, 0
	special 32
	waitstate
	end

	.global gUnknown_081A4379
gUnknown_081A4379: @ 81A4379

SingleBattleColosseum_EventScript_1A4379:: @ 81A4379
	setvar 0x8005, 1
	special 32
	waitstate
	end

	.global gUnknown_081A4383
gUnknown_081A4383: @ 81A4383

DoubleBattleColosseum_EventScript_1A4383:: @ 81A4383
	fadescreen 1
	special 41
	waitstate
	compare RESULT, 0
	jumpeq DoubleBattleColosseum_EventScript_1A43EF
	setvar 0x8005, 0
	special 32
	waitstate
	end

	.global gUnknown_081A439E
gUnknown_081A439E: @ 81A439E

DoubleBattleColosseum_EventScript_1A439E:: @ 81A439E
	fadescreen 1
	special 41
	waitstate
	compare RESULT, 0
	jumpeq DoubleBattleColosseum_EventScript_1A43EF
	setvar 0x8005, 1
	special 32
	waitstate
	end

	.global gUnknown_081A43B9
gUnknown_081A43B9: @ 81A43B9

DoubleBattleColosseum_EventScript_1A43B9:: @ 81A43B9
	fadescreen 1
	special 41
	waitstate
	compare RESULT, 0
	jumpeq DoubleBattleColosseum_EventScript_1A43EF
	setvar 0x8005, 2
	special 32
	waitstate
	end

	.global gUnknown_081A43D4
gUnknown_081A43D4: @ 81A43D4

DoubleBattleColosseum_EventScript_1A43D4:: @ 81A43D4
	fadescreen 1
	special 41
	waitstate
	compare RESULT, 0
	jumpeq DoubleBattleColosseum_EventScript_1A43EF
	setvar 0x8005, 3
	special 32
	waitstate
	end

DoubleBattleColosseum_EventScript_1A43EF:: @ 81A43EF
	end

	.global gUnknown_081A43F0
gUnknown_081A43F0: @ 81A43F0

TradeCenter_EventScript_1A43F0:: @ 81A43F0
	setvar 0x8005, 0
	special 33
	waitstate
	end

	.global gUnknown_081A43FA
gUnknown_081A43FA: @ 81A43FA

TradeCenter_EventScript_1A43FA:: @ 81A43FA
	setvar 0x8005, 1
	special 33
	waitstate
	end

	.incbin "baserom.gba", 0x1a4404, 0x14

	.global gUnknown_081A4418
gUnknown_081A4418: @ 81A4418

RecordCorner_EventScript_1A4418:: @ 81A4418
	setvar 0x8005, 0
	special 27
	waitstate
	compare 0x4001, 0
	jumpif 5, RecordCorner_EventScript_1A446C
	end

	.global gUnknown_081A442D
gUnknown_081A442D: @ 81A442D

RecordCorner_EventScript_1A442D:: @ 81A442D
	setvar 0x8005, 1
	special 27
	waitstate
	compare 0x4001, 0
	jumpif 5, RecordCorner_EventScript_1A446C
	end

	.global gUnknown_081A4442
gUnknown_081A4442: @ 81A4442

RecordCorner_EventScript_1A4442:: @ 81A4442
	setvar 0x8005, 2
	special 27
	waitstate
	compare 0x4001, 0
	jumpif 5, RecordCorner_EventScript_1A446C
	end

	.global gUnknown_081A4457
gUnknown_081A4457: @ 81A4457

RecordCorner_EventScript_1A4457:: @ 81A4457
	setvar 0x8005, 3
	special 27
	waitstate
	compare 0x4001, 0
	jumpif 5, RecordCorner_EventScript_1A446C
	end

RecordCorner_EventScript_1A446C:: @ 81A446C
	bufferitem 1, 0x4001
	message RecordCorner_Text_1A4E3B
	waittext
	waitbutton
	releaseall
	end

	.global gUnknown_081A4479
gUnknown_081A4479: @ 81A4479
	.incbin "baserom.gba", 0x001a4479, 0xe

	.global gUnknown_081A4487
gUnknown_081A4487: @ 81A4487
	.incbin "baserom.gba", 0x001a4487, 0xe

	.global gUnknown_081A4495
gUnknown_081A4495: @ 81A4495

	.incbin "baserom.gba", 0x1a4495, 0x9

SingleBattleColosseum_EventScript_1A449E:: @ 81A449E
	special 295
	message SingleBattleColosseum_Text_1A4D7E
	waittext
	waitbutton
	special 296
	closebutton
	end

TradeCenter_EventScript_1A44AD:: @ 81A44AD
	special 295
	message TradeCenter_Text_1A4DAB
	waittext
	waitbutton
	special 296
	closebutton
	end

RecordCorner_EventScript_1A44BC:: @ 81A44BC
	compare 0x4000, 0
	jumpif 5, RecordCorner_EventScript_1A44D6
	special 295
	message RecordCorner_Text_1A4DD7
	waittext
	waitbutton
	special 296
	closebutton
	end

RecordCorner_EventScript_1A44D6:: @ 81A44D6
	special 295
	message RecordCorner_Text_1A4DF7
	waittext
	waitbutton
	special 296
	closebutton
	end

	.global gUnknown_081A44E5
gUnknown_081A44E5: @ 81A44E5
	.incbin "baserom.gba", 0x001a44e5, 0x19

	.global gUnknown_081A44FE
gUnknown_081A44FE: @ 81A44FE
	.incbin "baserom.gba", 0x001a44fe, 0xa

	.global gUnknown_081A4508
gUnknown_081A4508: @ 81A4508

	.incbin "baserom.gba", 0x1a4508, 0x8

OldaleTown_PokemonCenter_2F_Text_1A4510:: @ 81A4510
	.string "Welcome to the POKéMON CABLE CLUB\n"
	.string "COLOSSEUM.\p"
	.string "You may battle with your friends here.\p"
	.string "Would you like to battle?$"

OldaleTown_PokemonCenter_2F_Text_1A457E:: @ 81A457E
	.string "Welcome to the POKéMON CABLE CLUB\n"
	.string "TRADE CENTER.\p"
	.string "You may trade your POKéMON here\n"
	.string "with a friend.\p"
	.string "Would you like to trade POKéMON?$"

OldaleTown_PokemonCenter_2F_Text_1A45FE:: @ 81A45FE
	.string "Welcome to the POKéMON CABLE CLUB\n"
	.string "RECORD CENTER.\p"
	.string "You may mix your records as a TRAINER\n"
	.string "with the records of your friends.\p"
	.string "Would you like to mix records?$"

OldaleTown_PokemonCenter_2F_Text_1A4696:: @ 81A4696
	.string "There are three link battle modes.\p"
	.string "SINGLE BATTLE is for two TRAINERS\n"
	.string "with one or more POKéMON each.\p"
	.string "Each TRAINER can have one POKéMON\n"
	.string "in battle at a time.\p"
	.string "DOUBLE BATTLE is for two TRAINERS\n"
	.string "with two or more POKéMON each.\p"
	.string "Each TRAINER will send out two\n"
	.string "POKéMON in battle at a time.\p"
	.string "MULTI BATTLE is for four TRAINERS\n"
	.string "with one or more POKéMON each.\p"
	.string "Each TRAINER can have one POKéMON\n"
	.string "in battle at a time.$"

OldaleTown_PokemonCenter_2F_Text_1A4826:: @ 81A4826
	.string "Would you like to battle?$"

OldaleTown_PokemonCenter_2F_Text_1A4840:: @ 81A4840
	.string "Which Battle Mode would you like\n"
	.string "to play?$"

OldaleTown_PokemonCenter_2F_Text_1A486A:: @ 81A486A
	.string "For a DOUBLE BATTLE, you must have\n"
	.string "at least two POKéMON.$"

OldaleTown_PokemonCenter_2F_Text_1A48A3:: @ 81A48A3
	.string "For trading, you must have at least\n"
	.string "two POKéMON with you.$"

OldaleTown_PokemonCenter_2F_Text_1A48DD:: @ 81A48DD
	.string "Your {STR_VAR_1} BERRY-holding POKéMON\n"
	.string "can’t be traded.$"

	.global gUnknown_081A490C
gUnknown_081A490C: @ 81A490C

OldaleTown_PokemonCenter_2F_Text_1A490C:: @ 81A490C
	.string "Please wait.\n"
	.string "... ... B Button: Cancel$"

	.global gUnknown_081A4932
gUnknown_081A4932: @ 81A4932
	.incbin "baserom.gba", 0x001a4932, 0x43

	.global gUnknown_081A4975
gUnknown_081A4975: @ 81A4975
	.incbin "baserom.gba", 0x001a4975, 0x41

	.global gUnknown_081A49B6
gUnknown_081A49B6: @ 81A49B6

	.incbin "baserom.gba", 0x1a49b6, 0x6c

OldaleTown_PokemonCenter_2F_Text_1A4A22:: @ 81A4A22
	.string "Please enter.$"

FallarborTown_ContestLobby_Text_1A4A30:: @ 81A4A30
OldaleTown_PokemonCenter_2F_Text_1A4A30:: @ 81A4A30
	.string "Someone is not ready to link.\p"
	.string "Please come back after everyone has\n"
	.string "made preparations.$"

FallarborTown_ContestLobby_Text_1A4A85:: @ 81A4A85
OldaleTown_PokemonCenter_2F_Text_1A4A85:: @ 81A4A85
	.string "Sorry, we have a transmission error...\n"
	.string "Please reset and try again.$"

OldaleTown_PokemonCenter_2F_Text_1A4AC8:: @ 81A4AC8
	.string "Sorry, we have a transmission error.\n"
	.string "You may not mix records in different\l"
	.string "languages.$"

FallarborTown_ContestLobby_Text_1A4B1D:: @ 81A4B1D
OldaleTown_PokemonCenter_2F_Text_1A4B1D:: @ 81A4B1D
	.string "The link partners appear to have made\n"
	.string "different selections.$"

OldaleTown_PokemonCenter_2F_Text_1A4B59:: @ 81A4B59
	.string "Please come again.$"

OldaleTown_PokemonCenter_2F_Text_1A4B6C:: @ 81A4B6C
	.string "The number of participants is\n"
	.string "incorrect.$"

OldaleTown_PokemonCenter_2F_Text_1A4B95:: @ 81A4B95
	.string "The SINGLE Battle Mode cannot be\n"
	.string "played by {STR_VAR_1} players.$"

OldaleTown_PokemonCenter_2F_Text_1A4BCC:: @ 81A4BCC
	.string "The DOUBLE Battle Mode cannot be\n"
	.string "played by {STR_VAR_1} players.$"

OldaleTown_PokemonCenter_2F_Text_1A4C03:: @ 81A4C03
	.string "There must be four players to play\n"
	.string "this Battle Mode.$"

OldaleTown_PokemonCenter_2F_Text_1A4C38:: @ 81A4C38
	.string "Please confirm the number of players\n"
	.string "and start again.$"

	.incbin "baserom.gba", 0x1a4c6e, 0x110

	.include "data/maps/text/SingleBattleColosseum.s"
	.include "data/maps/text/TradeCenter.s"
	.include "data/maps/text/RecordCorner.s"
OldaleTown_PokemonCenter_2F_Text_1A4E50:: @ 81A4E50
	.string "The TRAINER CARD data will\n"
	.string "be rewritten.$"

OldaleTown_PokemonCenter_2F_Text_1A4E79:: @ 81A4E79
	.string "I hope to see you again!$"

FallarborTown_ContestLobby_EventScript_1A4E92:: @ 81A4E92
LilycoveCity_ContestLobby_EventScript_1A4E92:: @ 81A4E92
SlateportCity_ContestLobby_EventScript_1A4E92:: @ 81A4E92
VerdanturfTown_ContestLobby_EventScript_1A4E92:: @ 81A4E92
	lock
	faceplayer
	checkitem ITEM_CONTEST_PASS, 1
	compare RESULT, 0
	callif 1, FallarborTown_ContestLobby_EventScript_1A4EDD
	compare 0x408a, 0
	jumpif 5, FallarborTown_ContestLobby_EventScript_1A4F4E
	checkflag 1
	jumpeq FallarborTown_ContestLobby_EventScript_1A4F8F
	bufferstd 0, 32779
	msgbox FallarborTown_ContestLobby_Text_1A5DFC, 4
	checkitem ITEM_CONTEST_PASS, 1
	compare RESULT, 0
	jumpeq FallarborTown_ContestLobby_EventScript_1A4EE1
	setflag 1
	jump FallarborTown_ContestLobby_EventScript_1A4F8F
	end

FallarborTown_ContestLobby_EventScript_1A4EDD:: @ 81A4EDD
	clearflag 1
	return

FallarborTown_ContestLobby_EventScript_1A4EE1:: @ 81A4EE1
	compare 0x8010, 0
	jumpeq FallarborTown_ContestLobby_EventScript_1A4EF6
	msgbox FallarborTown_ContestLobby_Text_1A6340, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1A4EF6:: @ 81A4EF6
	msgbox FallarborTown_ContestLobby_Text_1A64F4, 5
	compare RESULT, 1
	jumpeq FallarborTown_ContestLobby_EventScript_1A4F13
	msgbox FallarborTown_ContestLobby_Text_1A65EA, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1A4F13:: @ 81A4F13
	checkflag 150
	jumpeq FallarborTown_ContestLobby_EventScript_1A4F44
	msgbox FallarborTown_ContestLobby_Text_1A6583, 4
	giveitem ITEM_CONTEST_PASS
	setflag 150
	setflag 1
	msgbox FallarborTown_ContestLobby_Text_1A5E98, 4
	jump FallarborTown_ContestLobby_EventScript_1A4F8F
	end

FallarborTown_ContestLobby_EventScript_1A4F44:: @ 81A4F44
	msgbox FallarborTown_ContestLobby_Text_1A6590, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1A4F4E:: @ 81A4F4E
	msgbox FallarborTown_ContestLobby_Text_1A685A, 4
	switch 0x408a
	case 4, FallarborTown_ContestLobby_EventScript_1A4F67
	end

FallarborTown_ContestLobby_EventScript_1A4F67:: @ 81A4F67
	giveitem ITEM_LUXURY_BALL
	compare RESULT, 0
	jumpeq FallarborTown_ContestLobby_EventScript_1A4F86
	setvar 0x408a, 0
	closebutton
	release
	end

FallarborTown_ContestLobby_EventScript_1A4F86:: @ 81A4F86
	msgbox FallarborTown_ContestLobby_Text_1A68C6, 2
	end

FallarborTown_ContestLobby_EventScript_1A4F8F:: @ 81A4F8F
	message FallarborTown_ContestLobby_Text_1A5E46
	waittext
	multichoice 0, 0, 2, 0
	switch RESULT
	case 0, FallarborTown_ContestLobby_EventScript_1A5097
	case 1, FallarborTown_ContestLobby_EventScript_1A4FCC
	case 2, FallarborTown_ContestLobby_EventScript_1A503E
	case 127, FallarborTown_ContestLobby_EventScript_1A503E
	end

FallarborTown_ContestLobby_EventScript_1A4FCC:: @ 81A4FCC
	message FallarborTown_ContestLobby_Text_1A5E7C
	waittext
	multichoice 0, 0, 3, 0
	switch RESULT
	case 0, FallarborTown_ContestLobby_EventScript_1A5014
	case 1, FallarborTown_ContestLobby_EventScript_1A5022
	case 2, FallarborTown_ContestLobby_EventScript_1A5030
	case 3, FallarborTown_ContestLobby_EventScript_1A4F8F
	case 127, FallarborTown_ContestLobby_EventScript_1A4F8F
	end

FallarborTown_ContestLobby_EventScript_1A5014:: @ 81A5014
	msgbox FallarborTown_ContestLobby_Text_1A5E98, 4
	jump FallarborTown_ContestLobby_EventScript_1A4FCC
	end

FallarborTown_ContestLobby_EventScript_1A5022:: @ 81A5022
	msgbox FallarborTown_ContestLobby_Text_1A609B, 4
	jump FallarborTown_ContestLobby_EventScript_1A4FCC
	end

FallarborTown_ContestLobby_EventScript_1A5030:: @ 81A5030
	msgbox FallarborTown_ContestLobby_Text_1A613F, 4
	jump FallarborTown_ContestLobby_EventScript_1A4FCC
	end

FallarborTown_ContestLobby_EventScript_1A503E:: @ 81A503E
	msgbox FallarborTown_ContestLobby_Text_188559, 4
	release
	end

FallarborTown_ContestLobby_EventScript_1A5048:: @ 81A5048
	msgbox FallarborTown_ContestLobby_Text_1A6319, 4
	choosecontestpkmn
	compare 0x8004, 255
	jumpeq FallarborTown_ContestLobby_EventScript_1A5097
	special 84
	compare RESULT, 0
	jumpeq FallarborTown_ContestLobby_EventScript_1A50C8
	compare RESULT, 1
	jumpeq FallarborTown_ContestLobby_EventScript_1A50D7
	compare RESULT, 2
	jumpeq FallarborTown_ContestLobby_EventScript_1A50FB
	compare RESULT, 3
	jumpeq FallarborTown_ContestLobby_EventScript_1A511F
	compare RESULT, 4
	jumpeq FallarborTown_ContestLobby_EventScript_1A512E
	end

FallarborTown_ContestLobby_EventScript_1A5097:: @ 81A5097
	message FallarborTown_ContestLobby_Text_1A6623
	waittext
	multichoice 0, 0, 4, 0
	switch RESULT
	case 5, FallarborTown_ContestLobby_EventScript_1A503E
	case 127, FallarborTown_ContestLobby_EventScript_1A503E
	copyvar 0x8011, RESULT
	jump FallarborTown_ContestLobby_EventScript_1A5048
	end

FallarborTown_ContestLobby_EventScript_1A50C8:: @ 81A50C8
	msgbox FallarborTown_ContestLobby_Text_1A664A, 4
	jump FallarborTown_ContestLobby_EventScript_1A5048

	.incbin "baserom.gba", 0x1a50d5, 0x2

FallarborTown_ContestLobby_EventScript_1A50D7:: @ 81A50D7
	msgbox FallarborTown_ContestLobby_Text_1A67A3, 5
	switch RESULT
	case 0, FallarborTown_ContestLobby_EventScript_1A5048
	case 1, FallarborTown_ContestLobby_EventScript_1A513D
	end

FallarborTown_ContestLobby_EventScript_1A50FB:: @ 81A50FB
	msgbox FallarborTown_ContestLobby_Text_1A6724, 5
	switch RESULT
	case 0, FallarborTown_ContestLobby_EventScript_1A5048
	case 1, FallarborTown_ContestLobby_EventScript_1A513D
	end

FallarborTown_ContestLobby_EventScript_1A511F:: @ 81A511F
	msgbox FallarborTown_ContestLobby_Text_1A669F, 4
	jump FallarborTown_ContestLobby_EventScript_1A5048

	.incbin "baserom.gba", 0x1a512c, 0x2

FallarborTown_ContestLobby_EventScript_1A512E:: @ 81A512E
	msgbox FallarborTown_ContestLobby_Text_1A66DC, 4
	jump FallarborTown_ContestLobby_EventScript_1A5048

	.incbin "baserom.gba", 0x1a513b, 0x2

FallarborTown_ContestLobby_EventScript_1A513D:: @ 81A513D
	msgbox FallarborTown_ContestLobby_Text_1A67C1, 4
	closebutton
	releaseall
	setvar 0x4086, 1
	return

LinkContestRoom1_EventScript_1A514D:: @ 81A514D
	setvar 0x8006, 0
	lockall
	move 14, LinkContestRoom1_Movement_1A5DBF
	waitmove 0
	move 1, LinkContestRoom1_Movement_1A5D85
	waitmove 0
	releaseall
	call LinkContestRoom1_EventScript_1A51A0
	call LinkContestRoom1_EventScript_1A51EA
	call LinkContestRoom1_EventScript_1A5245
	call LinkContestRoom1_EventScript_1A527A
	call LinkContestRoom1_EventScript_1A58EE
	call LinkContestRoom1_EventScript_1A594A
	call LinkContestRoom1_EventScript_1A59FC
	call LinkContestRoom1_EventScript_1A5A49
	call LinkContestRoom1_EventScript_1A5A90
	call LinkContestRoom1_EventScript_1A5BAB
	setvar 0x4086, 2
	return

LinkContestRoom1_EventScript_1A51A0:: @ 81A51A0
	switch 0x8010
	case 0, LinkContestRoom1_EventScript_1A51D2
	case 1, LinkContestRoom1_EventScript_1A51D8
	case 2, LinkContestRoom1_EventScript_1A51DE
	case 3, LinkContestRoom1_EventScript_1A51E4
	return

LinkContestRoom1_EventScript_1A51D2:: @ 81A51D2
	setvar 0x8009, 5
	return

LinkContestRoom1_EventScript_1A51D8:: @ 81A51D8
	setvar 0x8009, 6
	return

LinkContestRoom1_EventScript_1A51DE:: @ 81A51DE
	setvar 0x8009, 7
	return

LinkContestRoom1_EventScript_1A51E4:: @ 81A51E4
	setvar 0x8009, 8
	return

LinkContestRoom1_EventScript_1A51EA:: @ 81A51EA
	switch 0x8011
	case 0, LinkContestRoom1_EventScript_1A5227
	case 1, LinkContestRoom1_EventScript_1A522D
	case 2, LinkContestRoom1_EventScript_1A5233
	case 3, LinkContestRoom1_EventScript_1A5239
	case 4, LinkContestRoom1_EventScript_1A523F
	return

LinkContestRoom1_EventScript_1A5227:: @ 81A5227
	setvar 0x8008, 0
	return

LinkContestRoom1_EventScript_1A522D:: @ 81A522D
	setvar 0x8008, 1
	return

LinkContestRoom1_EventScript_1A5233:: @ 81A5233
	setvar 0x8008, 2
	return

LinkContestRoom1_EventScript_1A5239:: @ 81A5239
	setvar 0x8008, 3
	return

LinkContestRoom1_EventScript_1A523F:: @ 81A523F
	setvar 0x8008, 4
	return

LinkContestRoom1_EventScript_1A5245:: @ 81A5245
	bufferstd 1, 32776
	bufferstd 2, 32777
	call LinkContestRoom1_EventScript_1A525F
	lockall
	move 1, LinkContestRoom1_Movement_1A5D87
	waitmove 0
	releaseall
	return

LinkContestRoom1_EventScript_1A525F:: @ 81A525F
	compare 0x4088, 5
	jumpeq LinkContestRoom1_EventScript_1A5273
	msgbox LinkContestRoom1_Text_1A68F0, 3
	return

LinkContestRoom1_EventScript_1A5273:: @ 81A5273
	message2 LinkContestRoom1_Text_1A6976
	waittext
	return

LinkContestRoom1_EventScript_1A527A:: @ 81A527A
	call LinkContestRoom1_EventScript_1A52AE
	call LinkContestRoom1_EventScript_1A5323
	call LinkContestRoom1_EventScript_1A5455
	call LinkContestRoom1_EventScript_1A53E5
	call LinkContestRoom1_EventScript_1A5880
	addvar 0x8006, 1
	compare 0x8006, 4
	jumpif 5, LinkContestRoom1_EventScript_1A527A
	call LinkContestRoom1_EventScript_1A5377
	setvar 0x4001, 6
	return

LinkContestRoom1_EventScript_1A52AE:: @ 81A52AE
	compare 0x8006, 0
	jumpeq LinkContestRoom1_EventScript_1A52DB
	compare 0x8006, 1
	jumpeq LinkContestRoom1_EventScript_1A52ED
	compare 0x8006, 2
	jumpeq LinkContestRoom1_EventScript_1A52FF
	compare 0x8006, 3
	jumpeq LinkContestRoom1_EventScript_1A5311
	return

LinkContestRoom1_EventScript_1A52DB:: @ 81A52DB
	lockall
	move 3, LinkContestRoom1_Movement_1A5DCE
	waitmove 0
	releaseall
	setvar 0x800b, 3
	return

LinkContestRoom1_EventScript_1A52ED:: @ 81A52ED
	lockall
	move 4, LinkContestRoom1_Movement_1A5DDA
	waitmove 0
	releaseall
	setvar 0x800b, 4
	return

LinkContestRoom1_EventScript_1A52FF:: @ 81A52FF
	lockall
	move 5, LinkContestRoom1_Movement_1A5DE2
	waitmove 0
	releaseall
	setvar 0x800b, 5
	return

LinkContestRoom1_EventScript_1A5311:: @ 81A5311
	lockall
	move 14, LinkContestRoom1_Movement_1A5DEA
	waitmove 0
	releaseall
	setvar 0x800b, 14
	return

LinkContestRoom1_EventScript_1A5323:: @ 81A5323
	special 81
	addvar 0x8006, 1
	buffernum 1, 32774
	lockall
	move 0x800b, LinkContestRoom1_Movement_1A5D9C
	waitmove 0
	releaseall
	reappear 13
	playsfx 10
	lockall
	move 0x800b, LinkContestRoom1_Movement_1A5D9C
	waitmove 0
	releaseall
	addvar 0x8006, 65535
	playsfx 15
	special 320
	call LinkContestRoom1_EventScript_1A535E
	return

LinkContestRoom1_EventScript_1A535E:: @ 81A535E
	compare 0x4088, 5
	jumpeq LinkContestRoom1_EventScript_1A5370
	message LinkContestRoom1_Text_1A6A04
	waittext
	return

LinkContestRoom1_EventScript_1A5370:: @ 81A5370
	message2 LinkContestRoom1_Text_1A6A04
	waittext
	return

LinkContestRoom1_EventScript_1A5377:: @ 81A5377
	call LinkContestRoom1_EventScript_1A53B3
	call LinkContestRoom1_EventScript_1A53CE
	playsfx 223
	waittext
	call LinkContestRoom1_EventScript_1A5A90
	move 1, LinkContestRoom1_Movement_1A5D9F
	waitmove 0
	move 2, LinkContestRoom1_Movement_1A5DA1
	waitmove 0
	pause 20
	move 1, LinkContestRoom1_Movement_1A5D8F
	move 2, LinkContestRoom1_Movement_1A5D8F
	waitmove 0
	return

LinkContestRoom1_EventScript_1A53B3:: @ 81A53B3
	compare 0x4088, 5
	jumpeq LinkContestRoom1_EventScript_1A53C7
	msgbox LinkContestRoom1_Text_1A6A1F, 4
	return

LinkContestRoom1_EventScript_1A53C7:: @ 81A53C7
	message2 LinkContestRoom1_Text_1A6A1F
	waittext
	return

LinkContestRoom1_EventScript_1A53CE:: @ 81A53CE
	compare 0x4088, 5
	jumpeq LinkContestRoom1_EventScript_1A53DF
	message LinkContestRoom1_Text_1A6AE1
	return

LinkContestRoom1_EventScript_1A53DF:: @ 81A53DF
	message2 LinkContestRoom1_Text_1A6AE1
	return

LinkContestRoom1_EventScript_1A53E5:: @ 81A53E5
	move 1, LinkContestRoom1_Movement_1A5DAF
	waitmove 0
	playsfx 223
	call LinkContestRoom1_EventScript_1A5AE4
	move 9, LinkContestRoom1_Movement_1A5DB7
	move 12, LinkContestRoom1_Movement_1A5DBB
	move 7, LinkContestRoom1_Movement_1A5DB7
	waitmove 0
	move 1, LinkContestRoom1_Movement_1A5DB7
	waitmove 0
	move 10, LinkContestRoom1_Movement_1A5DAF
	move 11, LinkContestRoom1_Movement_1A5DBB
	move 6, LinkContestRoom1_Movement_1A5DB3
	move 8, LinkContestRoom1_Movement_1A5DAF
	waitmove 0
	move 1, LinkContestRoom1_Movement_1A5DC1
	waitmove 0
	move 1, LinkContestRoom1_Movement_1A5DCA
	move 2, LinkContestRoom1_Movement_1A5DC5
	waitmove 0
	releaseall
	return

LinkContestRoom1_EventScript_1A5455:: @ 81A5455
	special 87
	compare 0x4088, 1
	callif 1, LinkContestRoom1_EventScript_1A555A
	compare 0x4088, 2
	callif 1, LinkContestRoom1_EventScript_1A55B8
	compare 0x4088, 3
	callif 1, LinkContestRoom1_EventScript_1A5616
	compare 0x4088, 4
	callif 1, LinkContestRoom1_EventScript_1A5674
	compare 0x4088, 5
	callif 1, LinkContestRoom1_EventScript_1A56D2
	setvar 0x4001, 9
	setvar 0x4002, 9
	setvar 0x4003, 9
	setvar 0x4004, 9
	setvar 0x4005, 9
	setvar 0x4006, 9
	setvar 0x4007, 9
	setvar 0x4008, 9
	compare 0x4000, 0
	callif 2, LinkContestRoom1_EventScript_1A54EB
	setvar 0x4001, 0
	setvar 0x4002, 0
	setvar 0x4003, 0
	setvar 0x4004, 0
	setvar 0x4005, 0
	setvar 0x4006, 0
	setvar 0x4007, 0
	setvar 0x4008, 0
	return

LinkContestRoom1_EventScript_1A54EB:: @ 81A54EB
	setvar RESULT, 8
	special 340
	compare RESULT, 0
	callif 1, LinkContestRoom1_EventScript_1A5760
	compare RESULT, 1
	callif 1, LinkContestRoom1_EventScript_1A5784
	compare RESULT, 2
	callif 1, LinkContestRoom1_EventScript_1A57A8
	compare RESULT, 3
	callif 1, LinkContestRoom1_EventScript_1A57CC
	compare RESULT, 4
	callif 1, LinkContestRoom1_EventScript_1A57F0
	compare RESULT, 5
	callif 1, LinkContestRoom1_EventScript_1A5814
	compare RESULT, 6
	callif 1, LinkContestRoom1_EventScript_1A5838
	compare RESULT, 7
	callif 1, LinkContestRoom1_EventScript_1A585C
	compare 0x4000, 0
	jumpif 2, LinkContestRoom1_EventScript_1A54EB
	waitmove 0
	return

LinkContestRoom1_EventScript_1A555A:: @ 81A555A
	compare 0x8004, 80
	jumpif 2, LinkContestRoom1_EventScript_1A575A
	compare 0x8004, 70
	jumpif 2, LinkContestRoom1_EventScript_1A5754
	compare 0x8004, 60
	jumpif 2, LinkContestRoom1_EventScript_1A574E
	compare 0x8004, 50
	jumpif 2, LinkContestRoom1_EventScript_1A5748
	compare 0x8004, 40
	jumpif 2, LinkContestRoom1_EventScript_1A5742
	compare 0x8004, 30
	jumpif 2, LinkContestRoom1_EventScript_1A573C
	compare 0x8004, 20
	jumpif 2, LinkContestRoom1_EventScript_1A5736
	compare 0x8004, 10
	jumpif 2, LinkContestRoom1_EventScript_1A5730
	setvar 0x4000, 0
	return

LinkContestRoom1_EventScript_1A55B8:: @ 81A55B8
	compare 0x8004, 230
	jumpif 2, LinkContestRoom1_EventScript_1A575A
	compare 0x8004, 210
	jumpif 2, LinkContestRoom1_EventScript_1A5754
	compare 0x8004, 190
	jumpif 2, LinkContestRoom1_EventScript_1A574E
	compare 0x8004, 170
	jumpif 2, LinkContestRoom1_EventScript_1A5748
	compare 0x8004, 150
	jumpif 2, LinkContestRoom1_EventScript_1A5742
	compare 0x8004, 130
	jumpif 2, LinkContestRoom1_EventScript_1A573C
	compare 0x8004, 110
	jumpif 2, LinkContestRoom1_EventScript_1A5736
	compare 0x8004, 90
	jumpif 2, LinkContestRoom1_EventScript_1A5730
	setvar 0x4000, 0
	return

LinkContestRoom1_EventScript_1A5616:: @ 81A5616
	compare 0x8004, 380
	jumpif 2, LinkContestRoom1_EventScript_1A575A
	compare 0x8004, 350
	jumpif 2, LinkContestRoom1_EventScript_1A5754
	compare 0x8004, 320
	jumpif 2, LinkContestRoom1_EventScript_1A574E
	compare 0x8004, 290
	jumpif 2, LinkContestRoom1_EventScript_1A5748
	compare 0x8004, 260
	jumpif 2, LinkContestRoom1_EventScript_1A5742
	compare 0x8004, 230
	jumpif 2, LinkContestRoom1_EventScript_1A573C
	compare 0x8004, 200
	jumpif 2, LinkContestRoom1_EventScript_1A5736
	compare 0x8004, 170
	jumpif 2, LinkContestRoom1_EventScript_1A5730
	setvar 0x4000, 0
	return

LinkContestRoom1_EventScript_1A5674:: @ 81A5674
	compare 0x8004, 600
	jumpif 2, LinkContestRoom1_EventScript_1A575A
	compare 0x8004, 560
	jumpif 2, LinkContestRoom1_EventScript_1A5754
	compare 0x8004, 520
	jumpif 2, LinkContestRoom1_EventScript_1A574E
	compare 0x8004, 480
	jumpif 2, LinkContestRoom1_EventScript_1A5748
	compare 0x8004, 440
	jumpif 2, LinkContestRoom1_EventScript_1A5742
	compare 0x8004, 400
	jumpif 2, LinkContestRoom1_EventScript_1A573C
	compare 0x8004, 360
	jumpif 2, LinkContestRoom1_EventScript_1A5736
	compare 0x8004, 320
	jumpif 2, LinkContestRoom1_EventScript_1A5730
	setvar 0x4000, 0
	return

LinkContestRoom1_EventScript_1A56D2:: @ 81A56D2
	compare 0x8004, 600
	jumpif 2, LinkContestRoom1_EventScript_1A575A
	compare 0x8004, 550
	jumpif 2, LinkContestRoom1_EventScript_1A5754
	compare 0x8004, 500
	jumpif 2, LinkContestRoom1_EventScript_1A574E
	compare 0x8004, 450
	jumpif 2, LinkContestRoom1_EventScript_1A5748
	compare 0x8004, 400
	jumpif 2, LinkContestRoom1_EventScript_1A5742
	compare 0x8004, 300
	jumpif 2, LinkContestRoom1_EventScript_1A573C
	compare 0x8004, 200
	jumpif 2, LinkContestRoom1_EventScript_1A5736
	compare 0x8004, 100
	jumpif 2, LinkContestRoom1_EventScript_1A5730
	setvar 0x4000, 0
	return

LinkContestRoom1_EventScript_1A5730:: @ 81A5730
	setvar 0x4000, 1
	return

LinkContestRoom1_EventScript_1A5736:: @ 81A5736
	setvar 0x4000, 2
	return

LinkContestRoom1_EventScript_1A573C:: @ 81A573C
	setvar 0x4000, 3
	return

LinkContestRoom1_EventScript_1A5742:: @ 81A5742
	setvar 0x4000, 4
	return

LinkContestRoom1_EventScript_1A5748:: @ 81A5748
	setvar 0x4000, 5
	return

LinkContestRoom1_EventScript_1A574E:: @ 81A574E
	setvar 0x4000, 6
	return

LinkContestRoom1_EventScript_1A5754:: @ 81A5754
	setvar 0x4000, 7
	return

LinkContestRoom1_EventScript_1A575A:: @ 81A575A
	setvar 0x4000, 8
	return

LinkContestRoom1_EventScript_1A5760:: @ 81A5760
	compare 0x4001, 1
	jumpeq LinkContestRoom1_EventScript_1A5783
	move 6, LinkContestRoom1_Movement_1A5D8D
	playsfx 21
	pause 14
	setvar 0x4001, 1
	addvar 0x4000, 65535
	return

LinkContestRoom1_EventScript_1A5783:: @ 81A5783
	return

LinkContestRoom1_EventScript_1A5784:: @ 81A5784
	compare 0x4002, 1
	jumpeq LinkContestRoom1_EventScript_1A57A7
	move 12, LinkContestRoom1_Movement_1A5D8D
	playsfx 21
	pause 14
	setvar 0x4002, 1
	addvar 0x4000, 65535
	return

LinkContestRoom1_EventScript_1A57A7:: @ 81A57A7
	return

LinkContestRoom1_EventScript_1A57A8:: @ 81A57A8
	compare 0x4003, 1
	jumpeq LinkContestRoom1_EventScript_1A57CB
	move 7, LinkContestRoom1_Movement_1A5D8D
	playsfx 21
	pause 14
	setvar 0x4003, 1
	addvar 0x4000, 65535
	return

LinkContestRoom1_EventScript_1A57CB:: @ 81A57CB
	return

LinkContestRoom1_EventScript_1A57CC:: @ 81A57CC
	compare 0x4004, 1
	jumpeq LinkContestRoom1_EventScript_1A57EF
	move 8, LinkContestRoom1_Movement_1A5D8D
	playsfx 21
	pause 14
	setvar 0x4004, 1
	addvar 0x4000, 65535
	return

LinkContestRoom1_EventScript_1A57EF:: @ 81A57EF
	return

LinkContestRoom1_EventScript_1A57F0:: @ 81A57F0
	compare 0x4005, 1
	jumpeq LinkContestRoom1_EventScript_1A5813
	move 9, LinkContestRoom1_Movement_1A5D8D
	playsfx 21
	pause 14
	setvar 0x4005, 1
	addvar 0x4000, 65535
	return

LinkContestRoom1_EventScript_1A5813:: @ 81A5813
	return

LinkContestRoom1_EventScript_1A5814:: @ 81A5814
	compare 0x4006, 1
	jumpeq LinkContestRoom1_EventScript_1A5837
	move 10, LinkContestRoom1_Movement_1A5D8D
	playsfx 21
	pause 14
	setvar 0x4006, 1
	addvar 0x4000, 65535
	return

LinkContestRoom1_EventScript_1A5837:: @ 81A5837
	return

LinkContestRoom1_EventScript_1A5838:: @ 81A5838
	compare 0x4007, 1
	jumpeq LinkContestRoom1_EventScript_1A585B
	move 11, LinkContestRoom1_Movement_1A5D8D
	playsfx 21
	pause 14
	setvar 0x4007, 1
	addvar 0x4000, 65535
	return

LinkContestRoom1_EventScript_1A585B:: @ 81A585B
	return

LinkContestRoom1_EventScript_1A585C:: @ 81A585C
	compare 0x4008, 1
	jumpeq LinkContestRoom1_EventScript_1A587F
	move 15, LinkContestRoom1_Movement_1A5D8D
	playsfx 21
	pause 14
	setvar 0x4008, 1
	addvar 0x4000, 65535
	return

LinkContestRoom1_EventScript_1A587F:: @ 81A587F
	return

LinkContestRoom1_EventScript_1A5880:: @ 81A5880
	closebutton
	release
	disappear 13
	special 321
	switch 0x8006
	case 0, LinkContestRoom1_EventScript_1A58BA
	case 1, LinkContestRoom1_EventScript_1A58C7
	case 2, LinkContestRoom1_EventScript_1A58D4
	case 3, LinkContestRoom1_EventScript_1A58E1
	return

LinkContestRoom1_EventScript_1A58BA:: @ 81A58BA
	lockall
	move 0x800b, LinkContestRoom1_Movement_1A5DD4
	waitmove 0
	releaseall
	return

LinkContestRoom1_EventScript_1A58C7:: @ 81A58C7
	lockall
	move 0x800b, LinkContestRoom1_Movement_1A5DDE
	waitmove 0
	releaseall
	return

LinkContestRoom1_EventScript_1A58D4:: @ 81A58D4
	lockall
	move 0x800b, LinkContestRoom1_Movement_1A5DE6
	waitmove 0
	releaseall
	return

LinkContestRoom1_EventScript_1A58E1:: @ 81A58E1
	lockall
	move 0x800b, LinkContestRoom1_Movement_1A5DF0
	waitmove 0
	releaseall
	return

LinkContestRoom1_EventScript_1A58EE:: @ 81A58EE
	lockall
	move 1, LinkContestRoom1_Movement_1A5DA3
	waitmove 0
	call LinkContestRoom1_EventScript_1A5930
	waittext
	move 1, LinkContestRoom1_Movement_1A5D91
	move 2, LinkContestRoom1_Movement_1A5D95
	waitmove 0
	releaseall
	setvar 0x4009, 1
	startcontest
	setvar 0x4009, 0
	lockall
	move 1, LinkContestRoom1_Movement_1A5D95
	move 2, LinkContestRoom1_Movement_1A5D91
	waitmove 0
	releaseall
	return

LinkContestRoom1_EventScript_1A5930:: @ 81A5930
	compare 0x4088, 5
	jumpeq LinkContestRoom1_EventScript_1A5944
	msgbox LinkContestRoom1_Text_1A6AF5, 3
	return

LinkContestRoom1_EventScript_1A5944:: @ 81A5944
	message2 LinkContestRoom1_Text_1A6AF5
	return

LinkContestRoom1_EventScript_1A594A:: @ 81A594A
	call LinkContestRoom1_EventScript_1A5984
	call LinkContestRoom1_EventScript_1A59A2
	move 1, LinkContestRoom1_Movement_1A5D8B
	waitmove 0
	call LinkContestRoom1_EventScript_1A59C0
	call LinkContestRoom1_EventScript_1A59DE
	move 1, LinkContestRoom1_Movement_1A5D8F
	waitmove 0
	closebutton
	releaseall
	setvar 0x4009, 1
	showcontestresults
	setvar 0x4009, 0
	playmusic 439, 0
	return

LinkContestRoom1_EventScript_1A5984:: @ 81A5984
	compare 0x4088, 5
	jumpeq LinkContestRoom1_EventScript_1A5998
	msgbox LinkContestRoom1_Text_1A6C06, 4
	return

LinkContestRoom1_EventScript_1A5998:: @ 81A5998
	message2 LinkContestRoom1_Text_1A6C06
	waittext
	pause 30
	return

LinkContestRoom1_EventScript_1A59A2:: @ 81A59A2
	compare 0x4088, 5
	jumpeq LinkContestRoom1_EventScript_1A59B6
	msgbox LinkContestRoom1_Text_1A6C21, 4
	return

LinkContestRoom1_EventScript_1A59B6:: @ 81A59B6
	message2 LinkContestRoom1_Text_1A6C21
	waittext
	pause 30
	return

LinkContestRoom1_EventScript_1A59C0:: @ 81A59C0
	compare 0x4088, 5
	jumpeq LinkContestRoom1_EventScript_1A59D4
	msgbox LinkContestRoom1_Text_1A6C9D, 4
	return

LinkContestRoom1_EventScript_1A59D4:: @ 81A59D4
	message2 LinkContestRoom1_Text_1A6C9D
	waittext
	pause 30
	return

LinkContestRoom1_EventScript_1A59DE:: @ 81A59DE
	compare 0x4088, 5
	jumpeq LinkContestRoom1_EventScript_1A59F2
	msgbox LinkContestRoom1_Text_1A6D16, 4
	return

LinkContestRoom1_EventScript_1A59F2:: @ 81A59F2
	message2 LinkContestRoom1_Text_1A6D16
	waittext
	pause 30
	return

LinkContestRoom1_EventScript_1A59FC:: @ 81A59FC
	special 76
	switch 0x8005
	case 0, LinkContestRoom1_EventScript_1A5A31
	case 1, LinkContestRoom1_EventScript_1A5A37
	case 2, LinkContestRoom1_EventScript_1A5A3D
	case 3, LinkContestRoom1_EventScript_1A5A43
	return

LinkContestRoom1_EventScript_1A5A31:: @ 81A5A31
	setvar 0x4003, 3
	return

LinkContestRoom1_EventScript_1A5A37:: @ 81A5A37
	setvar 0x4003, 4
	return

LinkContestRoom1_EventScript_1A5A3D:: @ 81A5A3D
	setvar 0x4003, 5
	return

LinkContestRoom1_EventScript_1A5A43:: @ 81A5A43
	setvar 0x4003, 14
	return

LinkContestRoom1_EventScript_1A5A49:: @ 81A5A49
	special 79
	special 80
	addvar 0x8005, 1
	buffernum 1, 32773
	addvar 0x8005, 65535
	call LinkContestRoom1_EventScript_1A5A75
	move 0x4003, LinkContestRoom1_Movement_1A5D99
	waitmove 0
	playsfx 223
	setvar 0x4001, 0
	return

LinkContestRoom1_EventScript_1A5A75:: @ 81A5A75
	compare 0x4088, 5
	jumpeq LinkContestRoom1_EventScript_1A5A89
	msgbox LinkContestRoom1_Text_1A6D3C, 4
	return

LinkContestRoom1_EventScript_1A5A89:: @ 81A5A89
	message2 LinkContestRoom1_Text_1A6D3C
	waittext
	return

LinkContestRoom1_EventScript_1A5A90:: @ 81A5A90
	addvar 0x4001, 1
	lockall
	compare 0x4088, 1
	callif 2, LinkContestRoom1_EventScript_1A5AE4
	move 9, LinkContestRoom1_Movement_1A5DB7
	move 12, LinkContestRoom1_Movement_1A5DBB
	move 7, LinkContestRoom1_Movement_1A5DB7
	pause 30
	move 10, LinkContestRoom1_Movement_1A5DAF
	move 11, LinkContestRoom1_Movement_1A5DBB
	move 6, LinkContestRoom1_Movement_1A5DB3
	move 8, LinkContestRoom1_Movement_1A5DAF
	compare 0x4001, 4
	jumpif 5, LinkContestRoom1_EventScript_1A5A90
	pause 30
	return

LinkContestRoom1_EventScript_1A5AE4:: @ 81A5AE4
	vspriteface 0, 1
	vspriteface 2, 1
	vspriteface 4, 4
	vspriteface 6, 1
	vspriteface 8, 1
	vspriteface 10, 1
	vspriteface 12, 1
	vspriteface 14, 1
	vspriteface 16, 1
	vspriteface 18, 1
	vspriteface 20, 4
	vspriteface 22, 4
	vspriteface 25, 4
	vspriteface 27, 3
	vspriteface 28, 4
	pause 10
	vspriteface 0, 4
	vspriteface 2, 4
	vspriteface 4, 4
	vspriteface 6, 4
	vspriteface 8, 4
	vspriteface 10, 3
	vspriteface 12, 3
	vspriteface 14, 3
	vspriteface 16, 3
	vspriteface 18, 3
	vspriteface 20, 1
	vspriteface 22, 1
	vspriteface 25, 2
	vspriteface 27, 2
	vspriteface 28, 2
	pause 10
	vspriteface 1, 2
	vspriteface 3, 2
	vspriteface 5, 2
	vspriteface 7, 2
	vspriteface 9, 4
	vspriteface 11, 2
	vspriteface 15, 2
	vspriteface 13, 2
	vspriteface 17, 2
	vspriteface 19, 2
	vspriteface 21, 3
	vspriteface 23, 3
	vspriteface 24, 3
	vspriteface 26, 4
	vspriteface 29, 3
	vspriteface 30, 3
	pause 10
	vspriteface 1, 4
	vspriteface 3, 4
	vspriteface 5, 4
	vspriteface 7, 4
	vspriteface 9, 4
	vspriteface 11, 3
	vspriteface 15, 3
	vspriteface 13, 3
	vspriteface 17, 3
	vspriteface 19, 3
	vspriteface 21, 1
	vspriteface 23, 1
	vspriteface 24, 1
	vspriteface 26, 2
	vspriteface 29, 2
	vspriteface 30, 2
	pause 10
	return

LinkContestRoom1_EventScript_1A5BAB:: @ 81A5BAB
	compare 0x4088, 5
	jumpeq LinkContestRoom1_EventScript_1A5C4C
	call LinkContestRoom1_EventScript_1A5C12
	checkflag 2
	jumpeq LinkContestRoom1_EventScript_1A5BF6
	msgbox LinkContestRoom1_Text_1A6DC5, 3
	waittext
	call LinkContestRoom1_EventScript_1A5C7F
	call LinkContestRoom1_EventScript_1A5CE5
	playsfx 223
	setvar 0x4001, 0
	call LinkContestRoom1_EventScript_1A5A90
	pause 30
	special 134
	compare 0x8004, 1
	jumpeq LinkContestRoom1_EventScript_1A5C46
	return

LinkContestRoom1_EventScript_1A5BF6:: @ 81A5BF6
	inccounter 37
	msgbox LinkContestRoom1_Text_1A6DF1, 3
	pause 90
	special 134
	compare 0x8004, 1
	jumpeq LinkContestRoom1_EventScript_1A5C46
	return

LinkContestRoom1_EventScript_1A5C12:: @ 81A5C12
	specialval RESULT, 88
	compare RESULT, 1
	jumpeq LinkContestRoom1_EventScript_1A5C23
	return

LinkContestRoom1_EventScript_1A5C23:: @ 81A5C23
	special 76
	compare 0x8005, 3
	jumpeq LinkContestRoom1_EventScript_1A5C32
	return

LinkContestRoom1_EventScript_1A5C32:: @ 81A5C32
	compare 0x8010, 3
	jumpeq LinkContestRoom1_EventScript_1A5C41
	setflag 2
	return

LinkContestRoom1_EventScript_1A5C41:: @ 81A5C41
	return

LinkContestRoom1_EventScript_1A5C42:: @ 81A5C42
	setflag 270
	return

LinkContestRoom1_EventScript_1A5C46:: @ 81A5C46
	setvar 0x4099, 1
	return

LinkContestRoom1_EventScript_1A5C4C:: @ 81A5C4C
	pause 60
	call LinkContestRoom1_EventScript_1A5C6A
	special 134
	compare 0x8004, 1
	jumpeq LinkContestRoom1_EventScript_1A5C64
	closebutton
	return

LinkContestRoom1_EventScript_1A5C64:: @ 81A5C64
	setvar 0x4099, 2
	return

LinkContestRoom1_EventScript_1A5C6A:: @ 81A5C6A
	special 77
	special 76
	comparevars 0x8004, 0x8005
	jumpeq LinkContestRoom1_EventScript_1A5C7C
	return

LinkContestRoom1_EventScript_1A5C7C:: @ 81A5C7C
	inccounter 35
	return

LinkContestRoom1_EventScript_1A5C7F:: @ 81A5C7F
	switch 0x8005
	case 0, LinkContestRoom1_EventScript_1A5CB1
	case 1, LinkContestRoom1_EventScript_1A5CBE
	case 2, LinkContestRoom1_EventScript_1A5CCB
	case 3, LinkContestRoom1_EventScript_1A5CD8
	return

LinkContestRoom1_EventScript_1A5CB1:: @ 81A5CB1
	lockall
	move 0x4003, LinkContestRoom1_Movement_1A5DF6
	waitmove 0
	releaseall
	return

LinkContestRoom1_EventScript_1A5CBE:: @ 81A5CBE
	lockall
	move 0x4003, LinkContestRoom1_Movement_1A5DFA
	waitmove 0
	releaseall
	return

LinkContestRoom1_EventScript_1A5CCB:: @ 81A5CCB
	lockall
	move 0x4003, LinkContestRoom1_Movement_1A5DA5
	waitmove 0
	releaseall
	return

LinkContestRoom1_EventScript_1A5CD8:: @ 81A5CD8
	lockall
	move 0x4003, LinkContestRoom1_Movement_1A5DA9
	waitmove 0
	releaseall
	return

LinkContestRoom1_EventScript_1A5CE5:: @ 81A5CE5
	special 76
	compare 0x8005, 3
	jumpeq LinkContestRoom1_EventScript_1A5CFC
	msgbox LinkContestRoom1_Text_1A6DF1, 3
	return

LinkContestRoom1_EventScript_1A5CFC:: @ 81A5CFC
	compare 0x4088, 2
	callif 1, LinkContestRoom1_EventScript_1A5C42
	inccounter 37
	specialval RESULT, 88
	compare RESULT, 0
	jumpeq LinkContestRoom1_EventScript_1A5D5B
	compare 0x8010, 3
	jumpeq LinkContestRoom1_EventScript_1A5D3B
	msgbox LinkContestRoom1_Text_1A6DF1, 3
	return

LinkContestRoom1_EventScript_1A5D2D:: @ 81A5D2D
	msgbox LinkContestRoom1_Text_1A6E1F, 3
	setvar 0x408a, 4
	return

LinkContestRoom1_EventScript_1A5D3B:: @ 81A5D3B
	giveitem ITEM_LUXURY_BALL
	compare RESULT, 0
	jumpeq LinkContestRoom1_EventScript_1A5D2D
	msgbox LinkContestRoom1_Text_1A6DF1, 3
	return

LinkContestRoom1_EventScript_1A5D5B:: @ 81A5D5B
	special 89
	inccounter 42
	setflag 2107
	lockall
	msgbox LinkContestRoom1_Text_1A6D6A, 4
	fanfare 370
	msgbox LinkContestRoom1_Text_1A6D96, 4
	waitfanfare
	special 80
	msgbox LinkContestRoom1_Text_1A6DAC, 4
	releaseall
	return

LinkContestRoom1_Movement_1A5D85:: @ 81A5D85
	step_down
	step_end

LinkContestRoom1_Movement_1A5D87:: @ 81A5D87
	step_40
	step_up
	step_41
	step_end

LinkContestRoom1_Movement_1A5D8B:: @ 81A5D8B
	step_28
	step_end

LinkContestRoom1_Movement_1A5D8D:: @ 81A5D8D
	step_58
	step_end

LinkContestRoom1_Movement_1A5D8F:: @ 81A5D8F
	step_25
	step_end

LinkContestRoom1_Movement_1A5D91:: @ 81A5D91
	step_left
	step_left
	step_25
	step_end

LinkContestRoom1_Movement_1A5D95:: @ 81A5D95
	step_right
	step_right
	step_25
	step_end

LinkContestRoom1_Movement_1A5D99:: @ 81A5D99
	step_up
	step_25
	step_end

LinkContestRoom1_Movement_1A5D9C:: @ 81A5D9C
	step_14
	step_14
	step_end

LinkContestRoom1_Movement_1A5D9F:: @ 81A5D9F
	step_28
	step_end

LinkContestRoom1_Movement_1A5DA1:: @ 81A5DA1
	step_27
	step_end

LinkContestRoom1_Movement_1A5DA3:: @ 81A5DA3
	step_25
	step_end

LinkContestRoom1_Movement_1A5DA5:: @ 81A5DA5
	step_left
	step_left
	step_up
	step_end

LinkContestRoom1_Movement_1A5DA9:: @ 81A5DA9
	step_left
	step_left
	step_left
	step_left
	step_up
	step_end

LinkContestRoom1_Movement_1A5DAF:: @ 81A5DAF
	step_02
	step_14
	step_4e
	step_end

LinkContestRoom1_Movement_1A5DB3:: @ 81A5DB3
	step_01
	step_14
	step_4e
	step_end

LinkContestRoom1_Movement_1A5DB7:: @ 81A5DB7
	step_03
	step_14
	step_4e
	step_end

LinkContestRoom1_Movement_1A5DBB:: @ 81A5DBB
	step_00
	step_14
	step_4e
	step_end

LinkContestRoom1_Movement_1A5DBF:: @ 81A5DBF
	step_01
	step_end

LinkContestRoom1_Movement_1A5DC1:: @ 81A5DC1
	step_01
	step_14
	step_28
	step_end

LinkContestRoom1_Movement_1A5DC5:: @ 81A5DC5
	step_27
	step_14
	step_14
	step_25
	step_end

LinkContestRoom1_Movement_1A5DCA:: @ 81A5DCA
	step_14
	step_14
	step_25
	step_end

LinkContestRoom1_Movement_1A5DCE:: @ 81A5DCE
	step_up
	step_right
	step_right
	step_right
	step_26
	step_end

LinkContestRoom1_Movement_1A5DD4:: @ 81A5DD4
	step_17
	step_17
	step_17
	step_15
	step_26
	step_end

LinkContestRoom1_Movement_1A5DDA:: @ 81A5DDA
	step_up
	step_right
	step_26
	step_end

LinkContestRoom1_Movement_1A5DDE:: @ 81A5DDE
	step_17
	step_15
	step_26
	step_end

LinkContestRoom1_Movement_1A5DE2:: @ 81A5DE2
	step_up
	step_left
	step_26
	step_end

LinkContestRoom1_Movement_1A5DE6:: @ 81A5DE6
	step_18
	step_15
	step_26
	step_end

LinkContestRoom1_Movement_1A5DEA:: @ 81A5DEA
	step_up
	step_left
	step_left
	step_left
	step_26
	step_end

LinkContestRoom1_Movement_1A5DF0:: @ 81A5DF0
	step_18
	step_18
	step_18
	step_15
	step_26
	step_end

LinkContestRoom1_Movement_1A5DF6:: @ 81A5DF6
	step_right
	step_right
	step_up
	step_end

LinkContestRoom1_Movement_1A5DFA:: @ 81A5DFA
	step_up
	step_end

FallarborTown_ContestLobby_Text_1A5DFC:: @ 81A5DFC
	.string "Hello, there!\p"
	.string "We’re accepting registrations for\n"
	.string "{STR_VAR_1} Rank POKéMON CONTESTS.$"

FallarborTown_ContestLobby_Text_1A5E46:: @ 81A5E46
	.string "Would you like to enter your POKéMON\n"
	.string "in our CONTESTS?$"

FallarborTown_ContestLobby_Text_1A5E7C:: @ 81A5E7C
	.string "Which topic would you like?$"

FallarborTown_ContestLobby_Text_1A5E98:: @ 81A5E98
	.string "A POKéMON CONTEST involves four\n"
	.string "TRAINERS entering one POKéMON each\l"
	.string "in competitive judging.\p"
	.string "A CONTEST has two stages of judging,\n"
	.string "primary and secondary.\p"
	.string "Primary judging is a popularity poll\n"
	.string "involving the audience.\p"
	.string "Secondary judging features appeals\n"
	.string "by the POKéMON using their moves.\p"
	.string "Plan appeals carefully to earn the\n"
	.string "most attention of the JUDGE and\l"
	.string "excite the audience.\l"
	.string "Do your best to stand out.\p"
	.string "The primary and secondary scores are\n"
	.string "added at the end.\p"
	.string "The POKéMON garnering the highest\n"
	.string "score is declared the winner.$"

FallarborTown_ContestLobby_Text_1A609B:: @ 81A609B
	.string "There are five kinds of CONTESTS.\p"
	.string "COOL, BEAUTY, CUTE, SMART, and\n"
	.string "TOUGH are the five categories.\p"
	.string "Choose the CONTEST that is right for\n"
	.string "the POKéMON you plan to enter.$"

FallarborTown_ContestLobby_Text_1A613F:: @ 81A613F
	.string "There are four ranks of POKéMON\n"
	.string "CONTESTS.\p"
	.string "NORMAL, SUPER, HYPER and MASTER\n"
	.string "are the four ranks.\p"
	.string "In the NORMAL Rank, any POKéMON may\n"
	.string "enter.\p"
	.string "Any POKéMON that won a NORMAL Rank\n"
	.string "CONTEST may move up the SUPER Rank in\l"
	.string "the same category.\p"
	.string "In the same way, a SUPER Rank winner\n"
	.string "can move up to the HYPER Rank, and a\l"
	.string "HYPER Rank winner can advance to the\l"
	.string "MASTER Rank in the same category.\p"
	.string "A POKéMON that won in the MASTER Rank\n"
	.string "may compete in the MASTER Rank as\l"
	.string "often as its TRAINER wants.$"

FallarborTown_ContestLobby_Text_1A6319:: @ 81A6319
	.string "Which POKéMON would you like to enter?$"

FallarborTown_ContestLobby_Text_1A6340:: @ 81A6340
	.string "Anyone with a CONTEST PASS may enter.\p"
	.string "You may obtain a CONTEST PASS at the\n"
	.string "NORMAL RANK CONTEST HALL in\l"
	.string "VERDANTURF TOWN free of charge.\p"
	.string "Please obtain a CONTEST PASS and\n"
	.string "come again.$"

LilycoveCity_ContestLobby_Text_1A63F4:: @ 81A63F4
	.string "I accept registrations only from four\n"
	.string "linked players for a POKéMON CONTEST.\p"
	.string "Anyone with a CONTEST PASS may enter.\p"
	.string "You may obtain a CONTEST PASS at the\n"
	.string "NORMAL RANK CONTEST HALL in\l"
	.string "VERDANTURF TOWN free of charge.\p"
	.string "Please obtain a CONTEST PASS and\n"
	.string "come again.$"

FallarborTown_ContestLobby_Text_1A64F4:: @ 81A64F4
	.string "Anyone with a CONTEST PASS may enter.\p"
	.string "If you don’t have one, I can issue one\n"
	.string "for you right now.\p"
	.string "Would you like me to issue you a\n"
	.string "CONTEST PASS?$"

FallarborTown_ContestLobby_Text_1A6583:: @ 81A6583
	.string "Here you go!$"

FallarborTown_ContestLobby_Text_1A6590:: @ 81A6590
	.string "Oh?\p"
	.string "We’ve already issued you a CONTEST\n"
	.string "PASS, {PLAYER}.\p"
	.string "Please come back with your CONTEST\n"
	.string "PASS.$"

FallarborTown_ContestLobby_Text_1A65EA:: @ 81A65EA
	.string "Please visit whenever you would like\n"
	.string "to enter a CONTEST.$"

FallarborTown_ContestLobby_Text_1A6623:: @ 81A6623
	.string "Which CONTEST would you like to enter?$"

FallarborTown_ContestLobby_Text_1A664A:: @ 81A664A
LilycoveCity_ContestLobby_Text_1A664A:: @ 81A664A
	.string "I’m terribly sorry, but your POKéMON\n"
	.string "is not qualified to compete at this\l"
	.string "Rank yet...$"

FallarborTown_ContestLobby_Text_1A669F:: @ 81A669F
LilycoveCity_ContestLobby_Text_1A669F:: @ 81A669F
	.string "I’m sorry, but an EGG cannot take part\n"
	.string "in a POKéMON CONTEST.$"

FallarborTown_ContestLobby_Text_1A66DC:: @ 81A66DC
LilycoveCity_ContestLobby_Text_1A66DC:: @ 81A66DC
	.string "Your POKéMON appears to be in no\n"
	.string "condition to take part in a CONTEST...$"

FallarborTown_ContestLobby_Text_1A6724:: @ 81A6724
	.string "Oh, but that RIBBON...\p"
	.string "Your POKéMON has won this CONTEST\n"
	.string "before, hasn’t it?\p"
	.string "Would you like to enter it in this\n"
	.string "CONTEST anyway?$"

FallarborTown_ContestLobby_Text_1A67A3:: @ 81A67A3
LilycoveCity_ContestLobby_Text_1A67A3:: @ 81A67A3
	.string "Is that your CONTEST POKéMON?$"

FallarborTown_ContestLobby_Text_1A67C1:: @ 81A67C1
	.string "Okay, your POKéMON will be entered\n"
	.string "in this CONTEST.\p"
	.string "Your POKéMON is Entry No. 4.\n"
	.string "The CONTEST will begin shortly.$"

FallarborTown_ContestLobby_Text_1A6832:: @ 81A6832
LilycoveCity_ContestLobby_Text_1A6832:: @ 81A6832
SlateportCity_ContestLobby_Text_1A6832:: @ 81A6832
VerdanturfTown_ContestLobby_Text_1A6832:: @ 81A6832
	.string "Please come in through here.\n"
	.string "Good luck!$"

FallarborTown_ContestLobby_Text_1A685A:: @ 81A685A
	.string "Congratulations! Your POKéMON is the\n"
	.string "CONTEST winner!\p"
	.string "We have your prize right here.\n"
	.string "Please, right this way!$"

FallarborTown_ContestLobby_Text_1A68C6:: @ 81A68C6
	.string "Please come back for your prize\n"
	.string "later on.$"

	.include "data/maps/text/LinkContestRoom1.s"
	.global gUnknown_081A6E72
gUnknown_081A6E72: @ 81A6E72

	.incbin "baserom.gba", 0x1a6e72, 0x10a

FallarborTown_ContestLobby_Text_1A6F7C:: @ 81A6F7C
	.string "Oh, hello! You were in a POKéMON CONTEST,\n"
	.string "weren’t you?\l"
	.string "It’s easy to tell from your POKéMON.\p"
	.string "I’m a reporter. I’m working on a story\n"
	.string "on POKéMON CONTESTS.\p"
	.string "If I may, would you be willing to answer\n"
	.string "a few questions?$"

FallarborTown_ContestLobby_Text_1A704E:: @ 81A704E
	.string "Oh, you will?\n"
	.string "Thank you.\p"
	.string "Briefly, how would you describe the\n"
	.string "CONTEST you just entered?$"

FallarborTown_ContestLobby_Text_1A70A5:: @ 81A70A5
	.string "Ah, I see.\n"
	.string "That’s a very edifying comment.\p"
	.string "You get a good feel for what the\n"
	.string "CONTEST was like.\p"
	.string "I’ve got one last question.\p"
	.string "When you hear the word “{STR_VAR_2},”\n"
	.string "what image do you get?$"

FallarborTown_ContestLobby_Text_1A7153:: @ 81A7153
	.string "I see!\p"
	.string "So that’s how you imagine the concept\n"
	.string "of “{STR_VAR_2}” to be.\p"
	.string "Thank you!\n"
	.string "You’ve given me some good ideas.\p"
	.string "I think I can write a good story on\n"
	.string "POKéMON CONTESTS now.\p"
	.string "Maybe, just maybe, this story will even\n"
	.string "make it to television.\l"
	.string "I hope you’ll look forward to it!$"

FallarborTown_ContestLobby_Text_1A7256:: @ 81A7256
	.string "Oh, too bad...\p"
	.string "Well, if you come across a good story,\n"
	.string "please do share it with me.$"

FallarborTown_ContestLobby_Text_1A72A8:: @ 81A72A8
	.string "I’ll be looking forward to your next\n"
	.string "POKéMON CONTEST.$"

	.incbin "baserom.gba", 0x1a72de, 0x48f

BattleTower_Lobby_Text_1A776D:: @ 81A776D
	.string "Hello! You’re the TRAINER who just had\n"
	.string "a battle, right?\p"
	.string "I’m gathering interviews with TRAINERS\n"
	.string "all over the place.\p"
	.string "May I get a few words from you about\n"
	.string "your impressions on battling?$"

BattleTower_Lobby_Text_1A7823:: @ 81A7823
	.string "You will? Really?\n"
	.string "Thank you!\l"
	.string "Then, uh...\p"
	.string "How did things turn out in the BATTLE\n"
	.string "TOWER today?\p"
	.string "Were you satisfied with the battle?\n"
	.string "Or are you unhappy?$"

BattleTower_Lobby_Text_1A78B7:: @ 81A78B7
	.string "Oh...\n"
	.string "Sorry we disturbed you.\p"
	.string "Please give us an interview the next\n"
	.string "time you visit the BATTLE TOWER.$"

BattleTower_Lobby_Text_1A791B:: @ 81A791B
	.string "Well, of course!\p"
	.string "That unmistakable look of satisfaction\n"
	.string "on your face...\p"
	.string "It’s obvious that you’ve had a great\n"
	.string "battle.$"

BattleTower_Lobby_Text_1A7990:: @ 81A7990
	.string "Oh, I see...\p"
	.string "Well, it certainly is difficult to make a\n"
	.string "battle turn out exactly as planned.$"

BattleTower_Lobby_Text_1A79EB:: @ 81A79EB
	.string "Oh, oh, may I ask one more question?\p"
	.string "If you were to describe your\n"
	.string "impressions about this battle with one\l"
	.string "saying, what would it be?$"

BattleTower_Lobby_Text_1A7A6E:: @ 81A7A6E
	.string "Oh, that is stunningly cool!\p"
	.string "That’s a great line!\n"
	.string "I hope you’ll do great next time, too.\p"
	.string "I hope to see you again!$"

BattleTower_Lobby_Text_1A7AE0:: @ 81A7AE0
	.string "Oh, I see...\p"
	.string "Still, being the silent type is also cool,\n"
	.string "isn’t it?\p"
	.string "I hope you’ll give me the opportunity to\n"
	.string "share your thoughts again!$"

BattleTower_Lobby_Text_1A7B66:: @ 81A7B66
	.string "I’ll be looking forward to your next\n"
	.string "battle!$"

	.incbin "baserom.gba", 0x1a7b93, 0x75e

SlateportCity_PokemonFanClub_Text_1A82F1:: @ 81A82F1
	.string "Wow!\p"
	.string "It’s plain to see that you lavish your\n"
	.string "love on your {STR_VAR_1}.\p"
	.string "Okay, it’s named {STR_VAR_2}.\p"
	.string "Can I ask you a favor?\p"
	.string "I’m a TV reporter, and I’m running\n"
	.string "a survey on POKéMON.\p"
	.string "Would you be willing to answer a few\n"
	.string "simple questions for me?$"

SlateportCity_PokemonFanClub_Text_1A83D0:: @ 81A83D0
	.string "Great! Thank you!\p"
	.string "Okay, here goes.\n"
	.string "I just need quick answers, okay?$"

SlateportCity_PokemonFanClub_Text_1A8414:: @ 81A8414
	.string "When you first met {STR_VAR_1}, what\n"
	.string "did you feel?\p"
	.string "How would you describe your feelings\n"
	.string "at the time?$"

SlateportCity_PokemonFanClub_Text_1A8470:: @ 81A8470
	.string "Your {STR_VAR_1} is cared for lovingly.\p"
	.string "If you were to liken it to something\n"
	.string "that you like, what would it be?$"

SlateportCity_PokemonFanClub_Text_1A84D5:: @ 81A84D5
	.string "This question also relates to your\n"
	.string "beloved {STR_VAR_1}.\p"
	.string "What was it about {STR_VAR_1} that\n"
	.string "attracted you?$"

SlateportCity_PokemonFanClub_Text_1A852D:: @ 81A852D
	.string "Okay, that makes sense.\p"
	.string "The next question might be a little\n"
	.string "on the tough side.\p"
	.string "Here goes...\p"
	.string "What do POKéMON mean to you?$"

SlateportCity_PokemonFanClub_Text_1A85A6:: @ 81A85A6
	.string "I see!\p"
	.string "Hmhm...\p"
	.string "Okay!\n"
	.string "Thanks for helping me out.\p"
	.string "It was fun and enlightening chatting\n"
	.string "with you.\p"
	.string "It’s possible that our interview will end\n"
	.string "up on TV. Tune in and check!\p"
	.string "Okay, that’s all.\n"
	.string "Bye-bye!$"

SlateportCity_PokemonFanClub_Text_1A8667:: @ 81A8667
	.string "Oh, okay...\p"
	.string "Well, if you get the urge to tell me\n"
	.string "about POKéMON, I’ll be here!$"

SlateportCity_PokemonFanClub_Text_1A86B5:: @ 81A86B5
	.string "I enjoy this job - you get to learn so\n"
	.string "much about POKéMON by doing\l"
	.string "interviews.$"

SlateportCity_PokemonFanClub_Text_1A8704:: @ 81A8704
	.string "Hi, you seem to be very close to your\n"
	.string "{STR_VAR_1}.\p"
	.string "Do you know what?\n"
	.string "I’m a TV reporter.\p"
	.string "I travel around interviewing people\n"
	.string "about POKéMON.\p"
	.string "I’m wondering if you’d be willing to tell\n"
	.string "me a little abut your {STR_VAR_1}?$"

SlateportCity_PokemonFanClub_Text_1A87CA:: @ 81A87CA
	.string "Wow, thank you!\p"
	.string "Okay, then, please tell me anything you’d\n"
	.string "like about your {STR_VAR_1}.$"

SlateportCity_PokemonFanClub_Text_1A8818:: @ 81A8818
	.string "Wow...\n"
	.string "That’s an interesting account.\p"
	.string "You really are tight with {STR_VAR_1},\n"
	.string "aren’t you?\p"
	.string "I get the feeling that your account\n"
	.string "will make a great TV story.\p"
	.string "I promise that I’ll turn this into\n"
	.string "an entertaining show.\l"
	.string "Keep your eyes out for it.\p"
	.string "Okay, that’s all.\n"
	.string "Bye-bye!$"

	.incbin "baserom.gba", 0x1a8917, 0x968

SlateportCity_OceanicMuseum_1F_Text_1A927F:: @ 81A927F
	.string "Oh?\n"
	.string "Do you perhaps like POKéMON?\p"
	.string "I’m on assignment with the TV network.\p"
	.string "I’m gathering stories on POKéMON and\n"
	.string "TRAINERS that occurred recently.\p"
	.string "If you don’t mind, could you tell me\n"
	.string "something about yourself?$"

SlateportCity_OceanicMuseum_1F_Text_1A934C:: @ 81A934C
	.string "I’m gathering stories on POKéMON and\n"
	.string "TRAINERS that occurred recently.\p"
	.string "If you don’t mind, could you tell me\n"
	.string "something about yourself?$"

SlateportCity_OceanicMuseum_1F_Text_1A93D1:: @ 81A93D1
	.string "Oh, you will?\n"
	.string "Thank you!\p"
	.string "Then, please, tell me anything of\n"
	.string "interest that you experienced recently\l"
	.string "involving POKéMON.$"

SlateportCity_OceanicMuseum_1F_Text_1A9446:: @ 81A9446
	.string "Oh, I see...\p"
	.string "Well, if you do have an interesting\n"
	.string "story to tell, please let me know.$"

SlateportCity_OceanicMuseum_1F_Text_1A949A:: @ 81A949A
	.string "Oh, what an uplifting story!\p"
	.string "I’ll be sure to get your story told\n"
	.string "on television.\p"
	.string "It should be aired sometime, I think,\n"
	.string "so please look forward to it.$"

SlateportCity_OceanicMuseum_1F_Text_1A952E:: @ 81A952E
	.string "Hmmm...\n"
	.string "I’ve got a good story for a TV program.\p"
	.string "I’d better write it up in a hurry!$"

	.incbin "baserom.gba", 0x1a9581, 0x2957

Route111_Text_1ABED8:: @ 81ABED8
	.string "GABBY: Oh! We’ve just spotted a tough-\n"
	.string "looking TRAINER here of all places!\p"
	.string "Okay, roll camera!\n"
	.string "Let’s get this interview.$"

Route111_Text_1ABF50:: @ 81ABF50
Route118_Text_1ABF50:: @ 81ABF50
Route120_Text_1ABF50:: @ 81ABF50
	.string "GABBY: Oh! You’re {PLAYER}! Hi!\n"
	.string "Do you remember us from last time?\p"
	.string "Can you show us how much stronger\n"
	.string "you’ve become? Okay, cue interview!$"

Route111_Text_1ABFD3:: @ 81ABFD3
	.string "GABBY: My eyes didn’t lie!\n"
	.string "I did discover an astonishing TRAINER!$"

Route111_Text_1AC015:: @ 81AC015
	.string "GABBY: Awesome! Awesome!\n"
	.string "Who are you?!\p"
	.string "I knew we were onto something wild\n"
	.string "when we spotted you!\p"
	.string "Oh, please let me explain. We travel\n"
	.string "around everywhere interviewing all\l"
	.string "sorts of TRAINERS.\p"
	.string "So, would you give us a bit of your time\n"
	.string "for an interview?$"

Route111_Text_1AC10A:: @ 81AC10A
	.string "GABBY: “{STR_VAR_1}!”\p"
	.string "Do you remember? That’s the quote you\n"
	.string "gave us as the battle clincher last time.\p"
	.string "I never, ever forget stuff like that!$"

Route111_Text_1AC18D:: @ 81AC18D
	.string "The last time we battled, you stomped\n"
	.string "us before we could brace ourselves...\p"
	.string "Anyway, what do you think?\n"
	.string "Do you want to be interviewed again?$"

Route111_Text_1AC219:: @ 81AC219
	.string "The last time we battled, didn’t you\n"
	.string "throw a POKé BALL at us?\p"
	.string "We were shocked! So we told everyone,\n"
	.string "just everyone, about it!\p"
	.string "Anyway, what do you think?\n"
	.string "Do you want to be interviewed again?$"

Route111_Text_1AC2D6:: @ 81AC2D6
	.string "The last time we battled, your item\n"
	.string "skills cleverly did us in.\p"
	.string "Anyway, what do you think?\n"
	.string "Do you want to be interviewed again?$"

Route111_Text_1AC355:: @ 81AC355
	.string "The last time we battled, we managed\n"
	.string "to look respectable.\p"
	.string "Anyway, what do you think?\n"
	.string "Do you want to be interviewed again?$"

Route111_Text_1AC3CF:: @ 81AC3CF
	.string "Anyway, what do you think?\n"
	.string "Do you want to be interviewed again?$"

Route111_Text_1AC40F:: @ 81AC40F
	.string "You will?\n"
	.string "Thank you!\p"
	.string "Okay, I need you to describe your\n"
	.string "feelings about our battle, but it\l"
	.string "has to be short and sweet. Go!$"

Route111_Text_1AC487:: @ 81AC487
	.string "GABBY: Mmm, yeah!\n"
	.string "That’s the perfect clincher!\p"
	.string "I get the feeling that this will make\n"
	.string "a great TV show.\p"
	.string "There’s a chance that they’ll air this\n"
	.string "on TV, so make sure to look for us!\p"
	.string "Okay!\n"
	.string "We’ll be seeing you!$"

Route111_Text_1AC553:: @ 81AC553
	.string "GABBY: Oh...\p"
	.string "Okay, but don’t give up!\n"
	.string "We’ll be keeping an eye out for you!$"

Route111_Text_1AC59E:: @ 81AC59E
Route118_Text_1AC59E:: @ 81AC59E
Route120_Text_1AC59E:: @ 81AC59E
	.string "GABBY: We’ll be keeping an eye out\n"
	.string "for you!$"

Route111_Text_1AC5CA:: @ 81AC5CA
Route118_Text_1AC5CA:: @ 81AC5CA
Route120_Text_1AC5CA:: @ 81AC5CA
	.string "GABBY: Is there a strong TRAINER\n"
	.string "anywhere with a lot of POKéMON?$"

Route111_Text_1AC60B:: @ 81AC60B
	.string "GABBY: Wow, you are something!\p"
	.string "You’ve gotten a lot stronger - a lot -\n"
	.string "since we last battled.\p"
	.string "We were right about you when we\n"
	.string "spotted you as a hot TRAINER.\p"
	.string "So, anyway, what do you think?\n"
	.string "Are you willing to give us an interview\l"
	.string "this time?$"

Route111_Text_1AC6F8:: @ 81AC6F8
Route118_Text_1AC6F8:: @ 81AC6F8
Route120_Text_1AC6F8:: @ 81AC6F8
	.string "GABBY: That was an intense battle!\n"
	.string "Did you get all that on camera?$"

Route111_Text_1AC73B:: @ 81AC73B
	.string "TY: Hey, lookie here! A tough-looking\n"
	.string "TRAINER here, of all places!\l"
	.string "Camera’s rolling!$"

Route111_Text_1AC790:: @ 81AC790
Route118_Text_1AC790:: @ 81AC790
Route120_Text_1AC790:: @ 81AC790
	.string "TY: Hey, lookie here!\n"
	.string "I remember you!\p"
	.string "I’ll get this battle all on this\n"
	.string "here camera!$"

Route111_Text_1AC7E4:: @ 81AC7E4
Route118_Text_1AC7E4:: @ 81AC7E4
Route120_Text_1AC7E4:: @ 81AC7E4
	.string "TY: You’re a natural!\n"
	.string "Got me some prime footage right here!$"

Route111_Text_1AC820:: @ 81AC820
Route118_Text_1AC820:: @ 81AC820
Route120_Text_1AC820:: @ 81AC820
	.string "TY: Do you only have the one POKéMON\n"
	.string "and that’s it?\p"
	.string "If you had more POKéMON, it’d make for\n"
	.string "better footage, but...$"

Route111_Text_1AC892:: @ 81AC892
	.string "TY: Yep, we sure spotted a hot TRAINER.\n"
	.string "This is a huge scoop for us!$"

Route111_Text_1AC8D7:: @ 81AC8D7
Route118_Text_1AC8D7:: @ 81AC8D7
Route120_Text_1AC8D7:: @ 81AC8D7
	.string "TY: Yep, I got it all.\n"
	.string "That whole battle’s on camera.$"

	.incbin "baserom.gba", 0x1ac90d, 0x1539

BattleTower_Lobby_EventScript_1ADE46:: @ 81ADE46
FallarborTown_ContestLobby_EventScript_1ADE46:: @ 81ADE46
SlateportCity_OceanicMuseum_1F_EventScript_1ADE46:: @ 81ADE46
SlateportCity_PokemonFanClub_EventScript_1ADE46:: @ 81ADE46
	special 68
	inccounter 6
	release
	end

SlateportCity_PokemonFanClub_EventScript_1ADE4D:: @ 81ADE4D
	setvar 0x8005, 1
	special 67
	compare RESULT, 1
	jumpeq SlateportCity_PokemonFanClub_EventScript_1ADED6
	copyvar 0x8009, 0x8006
	msgbox SlateportCity_PokemonFanClub_Text_1A8704, 5
	compare RESULT, 1
	jumpeq SlateportCity_PokemonFanClub_EventScript_1ADE84
	compare RESULT, 0
	jumpeq SlateportCity_PokemonFanClub_EventScript_1ADEB9
	end

SlateportCity_PokemonFanClub_EventScript_1ADE84:: @ 81ADE84
	msgbox SlateportCity_PokemonFanClub_Text_1A87CA, 4
	setvar 0x8004, 5
	copyvar 0x8005, 0x8009
	setvar 0x8006, 1
	call SlateportCity_PokemonFanClub_EventScript_1A00F3
	lock
	faceplayer
	compare RESULT, 1
	jumpeq SlateportCity_PokemonFanClub_EventScript_1ADEC3
	compare RESULT, 0
	jumpeq SlateportCity_PokemonFanClub_EventScript_1ADEB9
	end

SlateportCity_PokemonFanClub_EventScript_1ADEB9:: @ 81ADEB9
	msgbox SlateportCity_PokemonFanClub_Text_1A8667, 4
	release
	end

SlateportCity_PokemonFanClub_EventScript_1ADEC3:: @ 81ADEC3
	msgbox SlateportCity_PokemonFanClub_Text_1A8818, 4
	setvar 0x8005, 1
	jump SlateportCity_PokemonFanClub_EventScript_1ADE46
	end

SlateportCity_PokemonFanClub_EventScript_1ADED6:: @ 81ADED6
	msgbox SlateportCity_PokemonFanClub_Text_1A86B5, 4
	release
	end

SlateportCity_OceanicMuseum_1F_EventScript_1ADEE0:: @ 81ADEE0
	lock
	faceplayer
	setvar 0x8005, 2
	special 67
	compare RESULT, 1
	jumpeq SlateportCity_OceanicMuseum_1F_EventScript_1ADF96
	copyvar 0x8009, 0x8006
	checkflag 105
	jumpeq SlateportCity_OceanicMuseum_1F_EventScript_1ADF25
	setflag 105
	msgbox SlateportCity_OceanicMuseum_1F_Text_1A927F, 5
	compare RESULT, 1
	jumpeq SlateportCity_OceanicMuseum_1F_EventScript_1ADF44
	compare RESULT, 0
	jumpeq SlateportCity_OceanicMuseum_1F_EventScript_1ADF79
	end

SlateportCity_OceanicMuseum_1F_EventScript_1ADF25:: @ 81ADF25
	msgbox SlateportCity_OceanicMuseum_1F_Text_1A934C, 5
	compare RESULT, 1
	jumpeq SlateportCity_OceanicMuseum_1F_EventScript_1ADF44
	compare RESULT, 0
	jumpeq SlateportCity_OceanicMuseum_1F_EventScript_1ADF79
	end

SlateportCity_OceanicMuseum_1F_EventScript_1ADF44:: @ 81ADF44
	msgbox SlateportCity_OceanicMuseum_1F_Text_1A93D1, 4
	setvar 0x8004, 5
	copyvar 0x8005, 0x8009
	setvar 0x8006, 0
	call SlateportCity_OceanicMuseum_1F_EventScript_1A00F3
	lock
	faceplayer
	compare RESULT, 1
	jumpeq SlateportCity_OceanicMuseum_1F_EventScript_1ADF83
	compare RESULT, 0
	jumpeq SlateportCity_OceanicMuseum_1F_EventScript_1ADF79
	end

SlateportCity_OceanicMuseum_1F_EventScript_1ADF79:: @ 81ADF79
	msgbox SlateportCity_OceanicMuseum_1F_Text_1A9446, 4
	release
	end

SlateportCity_OceanicMuseum_1F_EventScript_1ADF83:: @ 81ADF83
	msgbox SlateportCity_OceanicMuseum_1F_Text_1A949A, 4
	setvar 0x8005, 2
	jump SlateportCity_OceanicMuseum_1F_EventScript_1ADE46
	end

SlateportCity_OceanicMuseum_1F_EventScript_1ADF96:: @ 81ADF96
	msgbox SlateportCity_OceanicMuseum_1F_Text_1A952E, 4
	release
	end

SlateportCity_PokemonFanClub_EventScript_1ADFA0:: @ 81ADFA0
	lock
	faceplayer
	specialval RESULT, 69
	compare RESULT, 0
	jumpeq SlateportCity_PokemonFanClub_EventScript_1ADE4D
	setvar 0x8005, 3
	special 67
	compare RESULT, 1
	jumpeq SlateportCity_PokemonFanClub_EventScript_1AE0AC
	copyvar 0x8009, 0x8006
	msgbox SlateportCity_PokemonFanClub_Text_1A82F1, 5
	compare RESULT, 1
	jumpeq SlateportCity_PokemonFanClub_EventScript_1ADFE9
	compare RESULT, 0
	jumpeq SlateportCity_PokemonFanClub_EventScript_1AE0A2
	end

SlateportCity_PokemonFanClub_EventScript_1ADFE9:: @ 81ADFE9
	msgbox SlateportCity_PokemonFanClub_Text_1A83D0, 4
	random 3
	copyvar 0x800a, RESULT
	switch RESULT
	case 0, SlateportCity_PokemonFanClub_EventScript_1AE020
	case 1, SlateportCity_PokemonFanClub_EventScript_1AE02E
	case 2, SlateportCity_PokemonFanClub_EventScript_1AE03C
	end

SlateportCity_PokemonFanClub_EventScript_1AE020:: @ 81AE020
	msgbox SlateportCity_PokemonFanClub_Text_1A8414, 4
	jump SlateportCity_PokemonFanClub_EventScript_1AE04A
	end

SlateportCity_PokemonFanClub_EventScript_1AE02E:: @ 81AE02E
	msgbox SlateportCity_PokemonFanClub_Text_1A8470, 4
	jump SlateportCity_PokemonFanClub_EventScript_1AE04A
	end

SlateportCity_PokemonFanClub_EventScript_1AE03C:: @ 81AE03C
	msgbox SlateportCity_PokemonFanClub_Text_1A84D5, 4
	jump SlateportCity_PokemonFanClub_EventScript_1AE04A
	end

SlateportCity_PokemonFanClub_EventScript_1AE04A:: @ 81AE04A
	setvar 0x8004, 7
	copyvar 0x8005, 0x8009
	setvar 0x8006, 0
	call SlateportCity_PokemonFanClub_EventScript_1A00F3
	lock
	faceplayer
	compare RESULT, 0
	jumpeq SlateportCity_PokemonFanClub_EventScript_1AE0A2
	msgbox SlateportCity_PokemonFanClub_Text_1A852D, 4
	setvar 0x8006, 1
	call SlateportCity_PokemonFanClub_EventScript_1A00F3
	lock
	faceplayer
	compare RESULT, 0
	jumpeq SlateportCity_PokemonFanClub_EventScript_1AE0A2
	msgbox SlateportCity_PokemonFanClub_Text_1A85A6, 4
	copyvar 0x8007, 0x800a
	setvar 0x8005, 3
	jump SlateportCity_PokemonFanClub_EventScript_1ADE46
	end

SlateportCity_PokemonFanClub_EventScript_1AE0A2:: @ 81AE0A2
	msgbox SlateportCity_PokemonFanClub_Text_1A8667, 4
	release
	end

SlateportCity_PokemonFanClub_EventScript_1AE0AC:: @ 81AE0AC
	msgbox SlateportCity_PokemonFanClub_Text_1A86B5, 4
	release
	end

FallarborTown_ContestLobby_EventScript_1AE0B6:: @ 81AE0B6
LilycoveCity_ContestLobby_EventScript_1AE0B6:: @ 81AE0B6
SlateportCity_ContestLobby_EventScript_1AE0B6:: @ 81AE0B6
VerdanturfTown_ContestLobby_EventScript_1AE0B6:: @ 81AE0B6
	lock
	faceplayer
	checkflag 2
	jumpeq FallarborTown_ContestLobby_EventScript_1AE17E
	setvar 0x8005, 6
	special 67
	compare RESULT, 1
	jumpeq FallarborTown_ContestLobby_EventScript_1AE17E
	copyvar 0x8009, 0x8006
	msgbox FallarborTown_ContestLobby_Text_1A6F7C, 5
	compare RESULT, 1
	jumpeq FallarborTown_ContestLobby_EventScript_1AE0F8
	compare RESULT, 0
	jumpeq FallarborTown_ContestLobby_EventScript_1AE12D
	end

FallarborTown_ContestLobby_EventScript_1AE0F8:: @ 81AE0F8
	msgbox FallarborTown_ContestLobby_Text_1A704E, 4
	setvar 0x8004, 11
	copyvar 0x8005, 0x8009
	setvar 0x8006, 0
	call FallarborTown_ContestLobby_EventScript_1A00F3
	lock
	faceplayer
	compare RESULT, 1
	jumpeq FallarborTown_ContestLobby_EventScript_1AE137
	compare RESULT, 0
	jumpeq FallarborTown_ContestLobby_EventScript_1AE12D
	end

FallarborTown_ContestLobby_EventScript_1AE12D:: @ 81AE12D
	msgbox FallarborTown_ContestLobby_Text_1A7256, 4
	release
	end

FallarborTown_ContestLobby_EventScript_1AE137:: @ 81AE137
	setvar 0x8004, 24
	special 70
	msgbox FallarborTown_ContestLobby_Text_1A70A5, 4
	setvar 0x8004, 11
	copyvar 0x8005, 0x8009
	setvar 0x8006, 1
	call FallarborTown_ContestLobby_EventScript_1A00F3
	lock
	faceplayer
	compare RESULT, 0
	jumpeq FallarborTown_ContestLobby_EventScript_1AE12D
	msgbox FallarborTown_ContestLobby_Text_1A7153, 4
	setflag 2
	setvar 0x8005, 6
	jump FallarborTown_ContestLobby_EventScript_1ADE46
	end

FallarborTown_ContestLobby_EventScript_1AE17E:: @ 81AE17E
	msgbox FallarborTown_ContestLobby_Text_1A72A8, 4
	release
	end

FallarborTown_ContestLobby_EventScript_1AE188:: @ 81AE188
LilycoveCity_ContestLobby_EventScript_1AE188:: @ 81AE188
SlateportCity_ContestLobby_EventScript_1AE188:: @ 81AE188
VerdanturfTown_ContestLobby_EventScript_1AE188:: @ 81AE188
	compare 0x4086, 2
	jumpif 5, FallarborTown_ContestLobby_EventScript_1AE1FE
	setvar 0x8005, 6
	special 67
	compare RESULT, 1
	jumpeq FallarborTown_ContestLobby_EventScript_1AE1FE
	switch 0x4088
	case 0, FallarborTown_ContestLobby_EventScript_1AE1FE
	case 2, FallarborTown_ContestLobby_EventScript_1AE1EE
	case 1, FallarborTown_ContestLobby_EventScript_1AE1F2
	case 3, FallarborTown_ContestLobby_EventScript_1AE1F6
	case 4, FallarborTown_ContestLobby_EventScript_1AE1FA
	case 5, FallarborTown_ContestLobby_EventScript_1AE1FE
	end

FallarborTown_ContestLobby_EventScript_1AE1EE:: @ 81AE1EE
	clearflag 800
	return

FallarborTown_ContestLobby_EventScript_1AE1F2:: @ 81AE1F2
	clearflag 801
	return

FallarborTown_ContestLobby_EventScript_1AE1F6:: @ 81AE1F6
	clearflag 803
	return

FallarborTown_ContestLobby_EventScript_1AE1FA:: @ 81AE1FA
	clearflag 802
	return

FallarborTown_ContestLobby_EventScript_1AE1FE:: @ 81AE1FE
	return

BattleTower_Lobby_EventScript_1AE1FF:: @ 81AE1FF
	lock
	faceplayer
	checkflag 2
	jumpeq BattleTower_Lobby_EventScript_1AE2E3
	setvar 0x8005, 7
	special 67
	compare RESULT, 1
	jumpeq BattleTower_Lobby_EventScript_1AE2E3
	copyvar 0x8009, 0x8006
	msgbox BattleTower_Lobby_Text_1A776D, 5
	compare RESULT, 1
	jumpeq BattleTower_Lobby_EventScript_1AE241
	compare RESULT, 0
	jumpeq BattleTower_Lobby_EventScript_1AE297
	end

BattleTower_Lobby_EventScript_1AE241:: @ 81AE241
	message BattleTower_Lobby_Text_1A7823
	waittext
	multichoice 19, 8, 45, 1
	copyvar 0x8008, RESULT
	compare RESULT, 0
	callif 1, BattleTower_Lobby_EventScript_1AE2A1
	compare RESULT, 1
	callif 1, BattleTower_Lobby_EventScript_1AE2AA
	msgbox BattleTower_Lobby_Text_1A79EB, 4
	setvar 0x8004, 12
	copyvar 0x8005, 0x8009
	call BattleTower_Lobby_EventScript_1A00F3
	lock
	faceplayer
	compare RESULT, 1
	jumpeq BattleTower_Lobby_EventScript_1AE2B3
	compare RESULT, 0
	jumpeq BattleTower_Lobby_EventScript_1AE2D9
	end

BattleTower_Lobby_EventScript_1AE297:: @ 81AE297
	msgbox BattleTower_Lobby_Text_1A78B7, 4
	release
	end

BattleTower_Lobby_EventScript_1AE2A1:: @ 81AE2A1
	msgbox BattleTower_Lobby_Text_1A791B, 4
	return

BattleTower_Lobby_EventScript_1AE2AA:: @ 81AE2AA
	msgbox BattleTower_Lobby_Text_1A7990, 4
	return

BattleTower_Lobby_EventScript_1AE2B3:: @ 81AE2B3
	compare RESULT, 0
	jumpeq BattleTower_Lobby_EventScript_1AE2D9
	msgbox BattleTower_Lobby_Text_1A7A6E, 4
	setflag 2
	copyvar 0x8004, 0x8008
	setvar 0x8005, 7
	jump BattleTower_Lobby_EventScript_1ADE46
	end

BattleTower_Lobby_EventScript_1AE2D9:: @ 81AE2D9
	msgbox BattleTower_Lobby_Text_1A7AE0, 4
	release
	end

BattleTower_Lobby_EventScript_1AE2E3:: @ 81AE2E3
	msgbox BattleTower_Lobby_Text_1A7B66, 4
	release
	end

BattleTower_Lobby_EventScript_1AE2ED:: @ 81AE2ED
	compare 0x40bc, 0
	jumpeq BattleTower_Lobby_EventScript_1AE30F
	setvar 0x8005, 7
	special 67
	compare RESULT, 1
	jumpeq BattleTower_Lobby_EventScript_1AE30F
	clearflag 918
	return

BattleTower_Lobby_EventScript_1AE30F:: @ 81AE30F
	setflag 918
	return

Route111_EventScript_1AE313:: @ 81AE313
Route118_EventScript_1AE313:: @ 81AE313
Route120_EventScript_1AE313:: @ 81AE313
	settrainerflag 56
	specialval RESULT, 172
	switch RESULT
	case 0, Route111_EventScript_1AE384
	case 1, Route111_EventScript_1AE38A
	case 2, Route111_EventScript_1AE395
	case 3, Route111_EventScript_1AE3A0
	case 4, Route111_EventScript_1AE3AB
	case 5, Route111_EventScript_1AE3B6
	case 6, Route111_EventScript_1AE3C1
	case 7, Route111_EventScript_1AE3CC
	case 8, Route111_EventScript_1AE3D7
	end

Route111_EventScript_1AE384:: @ 81AE384
	call Route111_EventScript_1AE3E6
	return

Route111_EventScript_1AE38A:: @ 81AE38A
	call Route111_EventScript_1AE3EE
	call Route111_EventScript_1AE3E2
	return

Route111_EventScript_1AE395:: @ 81AE395
	call Route111_EventScript_1AE3F6
	call Route111_EventScript_1AE3EA
	return

Route111_EventScript_1AE3A0:: @ 81AE3A0
	call Route111_EventScript_1AE3FE
	call Route111_EventScript_1AE3F2
	return

Route111_EventScript_1AE3AB:: @ 81AE3AB
	call Route111_EventScript_1AE406
	call Route111_EventScript_1AE3FA
	return

Route111_EventScript_1AE3B6:: @ 81AE3B6
	call Route111_EventScript_1AE40E
	call Route111_EventScript_1AE402
	return

Route111_EventScript_1AE3C1:: @ 81AE3C1
	call Route111_EventScript_1AE416
	call Route111_EventScript_1AE40A
	return

Route111_EventScript_1AE3CC:: @ 81AE3CC
	call Route111_EventScript_1AE41E
	call Route111_EventScript_1AE412
	return

Route111_EventScript_1AE3D7:: @ 81AE3D7
	call Route111_EventScript_1AE40E
	call Route111_EventScript_1AE41A
	return

Route111_EventScript_1AE3E2:: @ 81AE3E2
	setflag 796
	return

Route111_EventScript_1AE3E6:: @ 81AE3E6
	clearflag 796
	return

Route111_EventScript_1AE3EA:: @ 81AE3EA
	setflag 797
	return

Route111_EventScript_1AE3EE:: @ 81AE3EE
	clearflag 797
	return

Route111_EventScript_1AE3F2:: @ 81AE3F2
	setflag 798
	return

Route111_EventScript_1AE3F6:: @ 81AE3F6
	clearflag 798
	return

Route111_EventScript_1AE3FA:: @ 81AE3FA
	setflag 799
	return

Route111_EventScript_1AE3FE:: @ 81AE3FE
	clearflag 799
	return

Route111_EventScript_1AE402:: @ 81AE402
	setflag 901
	return

Route111_EventScript_1AE406:: @ 81AE406
	clearflag 901
	return

Route111_EventScript_1AE40A:: @ 81AE40A
	setflag 902
	return

Route111_EventScript_1AE40E:: @ 81AE40E
	clearflag 902
	return

Route111_EventScript_1AE412:: @ 81AE412
	setflag 903
	return

Route111_EventScript_1AE416:: @ 81AE416
	clearflag 903
	return

Route111_EventScript_1AE41A:: @ 81AE41A
	setflag 904
	return

Route111_EventScript_1AE41E:: @ 81AE41E
	clearflag 904
	return

Route111_EventScript_1AE422:: @ 81AE422
	trainerbattle 6, 51, 0, Route111_Text_1ABED8, Route111_Text_1ABFD3, Route111_Text_1AC5CA, Route111_EventScript_1AE5A2
	msgbox Route111_Text_1AC59E, 4
	release
	end

Route111_EventScript_1AE442:: @ 81AE442
	trainerbattle 6, 51, 0, Route111_Text_1AC73B, Route111_Text_1AC892, Route111_Text_1AC820, Route111_EventScript_1AE5A2
	msgbox Route111_Text_1AC7E4, 4
	release
	end

Route118_EventScript_1AE462:: @ 81AE462
	trainerbattle 6, 52, 0, Route118_Text_1ABF50, Route118_Text_1AC6F8, Route118_Text_1AC5CA, Route118_EventScript_1AE60F
	msgbox Route118_Text_1AC59E, 4
	release
	end

Route118_EventScript_1AE482:: @ 81AE482
	trainerbattle 6, 52, 0, Route118_Text_1AC790, Route118_Text_1AC8D7, Route118_Text_1AC820, Route118_EventScript_1AE60F
	msgbox Route118_Text_1AC7E4, 4
	release
	end

Route120_EventScript_1AE4A2:: @ 81AE4A2
	trainerbattle 6, 53, 0, Route120_Text_1ABF50, Route120_Text_1AC6F8, Route120_Text_1AC5CA, Route120_EventScript_1AE60F
	msgbox Route120_Text_1AC59E, 4
	release
	end

Route120_EventScript_1AE4C2:: @ 81AE4C2
	trainerbattle 6, 53, 0, Route120_Text_1AC790, Route120_Text_1AC8D7, Route120_Text_1AC820, Route120_EventScript_1AE60F
	msgbox Route120_Text_1AC7E4, 4
	release
	end

Route111_EventScript_1AE4E2:: @ 81AE4E2
	trainerbattle 6, 54, 0, Route111_Text_1ABF50, Route111_Text_1AC6F8, Route111_Text_1AC5CA, Route111_EventScript_1AE60F
	msgbox Route111_Text_1AC59E, 4
	release
	end

Route111_EventScript_1AE502:: @ 81AE502
	trainerbattle 6, 54, 0, Route111_Text_1AC790, Route111_Text_1AC8D7, Route111_Text_1AC820, Route111_EventScript_1AE60F
	msgbox Route111_Text_1AC7E4, 4
	release
	end

Route118_EventScript_1AE522:: @ 81AE522
	trainerbattle 6, 55, 0, Route118_Text_1ABF50, Route118_Text_1AC6F8, Route118_Text_1AC5CA, Route118_EventScript_1AE60F
	msgbox Route118_Text_1AC59E, 4
	release
	end

Route118_EventScript_1AE542:: @ 81AE542
	trainerbattle 6, 55, 0, Route118_Text_1AC790, Route118_Text_1AC8D7, Route118_Text_1AC820, Route118_EventScript_1AE60F
	msgbox Route118_Text_1AC7E4, 4
	release
	end

Route111_EventScript_1AE562:: @ 81AE562
Route118_EventScript_1AE562:: @ 81AE562
Route120_EventScript_1AE562:: @ 81AE562
	trainerbattle 6, 56, 0, Route111_Text_1ABF50, Route111_Text_1AC6F8, Route111_Text_1AC5CA, Route111_EventScript_1AE60F
	msgbox Route111_Text_1AC59E, 4
	release
	end

Route111_EventScript_1AE582:: @ 81AE582
Route118_EventScript_1AE582:: @ 81AE582
Route120_EventScript_1AE582:: @ 81AE582
	trainerbattle 6, 56, 0, Route111_Text_1AC790, Route111_Text_1AC8D7, Route111_Text_1AC820, Route111_EventScript_1AE60F
	msgbox Route111_Text_1AC7E4, 4
	release
	end

Route111_EventScript_1AE5A2:: @ 81AE5A2
	special 174
	special 179
	compare FACING, 2
	callif 1, Route111_EventScript_1AE5E0
	compare FACING, 1
	callif 1, Route111_EventScript_1AE5EB
	compare FACING, 4
	callif 1, Route111_EventScript_1AE5FD
	checkflag 1
	jumpeq Route111_EventScript_1AE73A
	msgbox Route111_Text_1AC015, 5
	jump Route111_EventScript_1AE6F3
	end

Route111_EventScript_1AE5E0:: @ 81AE5E0
	move 0x8004, Route111_Movement_1AE699
	waitmove 0
	return

Route111_EventScript_1AE5EB:: @ 81AE5EB
	move 0x8004, Route111_Movement_1AE69B
	move 0x8005, Route111_Movement_1A0841
	waitmove 0
	return

Route111_EventScript_1AE5FD:: @ 81AE5FD
	move 0x8004, Route111_Movement_1AE69D
	move 0x8005, Route111_Movement_1A083F
	waitmove 0
	return

Route111_EventScript_1AE60F:: @ 81AE60F
Route118_EventScript_1AE60F:: @ 81AE60F
Route120_EventScript_1AE60F:: @ 81AE60F
	special 174
	special 179
	compare FACING, 2
	callif 1, Route111_EventScript_1AE5E0
	compare FACING, 1
	callif 1, Route111_EventScript_1AE5EB
	compare FACING, 4
	callif 1, Route111_EventScript_1AE5FD
	checkflag 1
	jumpeq Route111_EventScript_1AE73A
	specialval RESULT, 177
	compare RESULT, 0
	jumpeq Route111_EventScript_1AE69F
	msgbox Route111_Text_1AC10A, 4
	specialval RESULT, 178
	switch RESULT
	case 0, Route111_EventScript_1AE6AD
	case 1, Route111_EventScript_1AE6BB
	case 2, Route111_EventScript_1AE6C9
	case 3, Route111_EventScript_1AE6D7
	case 4, Route111_EventScript_1AE6E5
	end

Route111_Movement_1AE699:: @ 81AE699
	step_1d
	step_end

Route111_Movement_1AE69B:: @ 81AE69B
	step_1e
	step_end

Route111_Movement_1AE69D:: @ 81AE69D
	step_1f
	step_end

Route111_EventScript_1AE69F:: @ 81AE69F
	msgbox Route111_Text_1AC60B, 5
	jump Route111_EventScript_1AE6F3
	end

Route111_EventScript_1AE6AD:: @ 81AE6AD
	msgbox Route111_Text_1AC3CF, 5
	jump Route111_EventScript_1AE6F3
	end

Route111_EventScript_1AE6BB:: @ 81AE6BB
	msgbox Route111_Text_1AC18D, 5
	jump Route111_EventScript_1AE6F3
	end

Route111_EventScript_1AE6C9:: @ 81AE6C9
	msgbox Route111_Text_1AC219, 5
	jump Route111_EventScript_1AE6F3
	end

Route111_EventScript_1AE6D7:: @ 81AE6D7
	msgbox Route111_Text_1AC2D6, 5
	jump Route111_EventScript_1AE6F3
	end

Route111_EventScript_1AE6E5:: @ 81AE6E5
	msgbox Route111_Text_1AC355, 5
	jump Route111_EventScript_1AE6F3
	end

Route111_EventScript_1AE6F3:: @ 81AE6F3
	compare RESULT, 0
	jumpeq Route111_EventScript_1AE72D
	msgbox Route111_Text_1AC40F, 4
	setvar 0x8004, 10
	call Route111_EventScript_1A00F3
	lock
	faceplayer
	compare RESULT, 0
	jumpeq Route111_EventScript_1AE72D
	msgbox Route111_Text_1AC487, 4
	special 173
	setflag 1
	release
	end

Route111_EventScript_1AE72D:: @ 81AE72D
	msgbox Route111_Text_1AC553, 4
	setflag 1
	release
	end

Route111_EventScript_1AE73A:: @ 81AE73A
	msgbox Route111_Text_1AC59E, 4
	release
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AE744:: @ 81AE744
	special 97
	switch RESULT
	case 0, MauvilleCity_PokemonCenter_1F_EventScript_1AE784
	case 1, MauvilleCity_PokemonCenter_1F_EventScript_1AE845
	case 2, MauvilleCity_PokemonCenter_1F_EventScript_1AEBAB
	case 3, MauvilleCity_PokemonCenter_1F_EventScript_1B0816
	case 4, MauvilleCity_PokemonCenter_1F_EventScript_1B09EB
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AE784:: @ 81AE784
	lock
	faceplayer
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0A91, 5
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AE7A5
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AE7C8
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AE7A5:: @ 81AE7A5
	setvar 0x8004, 0
	special 103
	pause 60
	special 98
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AE7D2
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0AED, 4
	release
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AE7C8:: @ 81AE7C8
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0AC3, 4
	release
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AE7D2:: @ 81AE7D2
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0B2C, 5
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AE7F1
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AE83B
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AE7F1:: @ 81AE7F1
	setvar 0x8004, 6
	call MauvilleCity_PokemonCenter_1F_EventScript_1A00F3
	lock
	faceplayer
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AE83B
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0BD0, 4
	setvar 0x8004, 1
	special 103
	pause 60
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0BFA, 5
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AE7F1
	special 99
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0C23, 4
	release
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AE83B:: @ 81AE83B
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0BA6, 4
	release
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AE845:: @ 81AE845
	lock
	faceplayer
	setflag 2054
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0C5B, 4
	special 100
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AE86A
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0CA7, 4
	release
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AE86A:: @ 81AE86A
	special 102
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AE882
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0D11, 4
	release
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AE882:: @ 81AE882
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0D75, 4
	special 101
	release
	end

MauvilleCity_PokemonCenter_1F_Text_1AE88F:: @ 81AE88F
	.string "Hi, I’m the TRADER.\n"
	.string "Want to trade decorations with me?$"

MauvilleCity_PokemonCenter_1F_Text_1AE8C6:: @ 81AE8C6
	.string "Oh...\n"
	.string "I feel unwanted...$"

MauvilleCity_PokemonCenter_1F_Text_1AE8DF:: @ 81AE8DF
	.string "But we’ve traded decorations already,\n"
	.string "you and I.$"

MauvilleCity_PokemonCenter_1F_Text_1AE910:: @ 81AE910
	.string "If you see any decorative item that\n"
	.string "you want of mine, speak up.$"

MauvilleCity_PokemonCenter_1F_Text_1AE950:: @ 81AE950
	.string "You don’t want anything?\n"
	.string "I feel unwanted...$"

MauvilleCity_PokemonCenter_1F_Text_1AE97C:: @ 81AE97C
	.string "That decorative item once belonged\n"
	.string "to {STR_VAR_1}.\p"
	.string "Do you want it?$"

MauvilleCity_PokemonCenter_1F_Text_1AE9B6:: @ 81AE9B6
	.string "Uh... Wait a second. You don’t have a\n"
	.string "single piece of decoration!$"

MauvilleCity_PokemonCenter_1F_Text_1AE9F8:: @ 81AE9F8
	.string "Okay, pick the decoration that you’ll\n"
	.string "trade to me.$"

MauvilleCity_PokemonCenter_1F_Text_1AEA2B:: @ 81AEA2B
	.string "You won’t trade with me?\n"
	.string "I feel unwanted...$"

MauvilleCity_PokemonCenter_1F_Text_1AEA57:: @ 81AEA57
	.string "You’ve got all the {STR_VAR_2}S that can\n"
	.string "be stored. You’ve no room for this.$"

MauvilleCity_PokemonCenter_1F_Text_1AEA9B:: @ 81AEA9B
	.string "Okay, so we’ll trade my {STR_VAR_3}\n"
	.string "for your {STR_VAR_2}?$"

MauvilleCity_PokemonCenter_1F_Text_1AEAC3:: @ 81AEAC3
	.string "That piece of decoration is in use.\n"
	.string "You can’t trade it.$"

MauvilleCity_PokemonCenter_1F_Text_1AEAFB:: @ 81AEAFB
	.string "Then we’ll trade!\n"
	.string "I’ll send my decoration to your PC.$"

MauvilleCity_PokemonCenter_1F_Text_1AEB31:: @ 81AEB31
	.string "Oops! Sorry!\n"
	.string "That’s a really rare piece of decoration.\l"
	.string "I can’t trade that one away!\p"
	.string "Can I interest you in something else?$"

MauvilleCity_PokemonCenter_1F_EventScript_1AEBAB:: @ 81AEBAB
	lock
	faceplayer
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AE88F, 5
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AEBDA
	special 114
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AEBE3
	message MauvilleCity_PokemonCenter_1F_Text_1AE910
	waittext
	jump MauvilleCity_PokemonCenter_1F_EventScript_1AEBEC
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AEBDA:: @ 81AEBDA
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AE8C6, 2
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AEBE3:: @ 81AEBE3
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AE8DF, 2
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AEBEC:: @ 81AEBEC
	special 113
	waitstate
	compare 0x8004, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AEC2D
	compare 0x8004, 65535
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AEC36
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AE97C, 5
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AEC42
	special 115
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AEC4E
	jump MauvilleCity_PokemonCenter_1F_EventScript_1AEC57
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AEC2D:: @ 81AEC2D
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AE950, 2
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AEC36:: @ 81AEC36
	message MauvilleCity_PokemonCenter_1F_Text_1AEB31
	waittext
	jump MauvilleCity_PokemonCenter_1F_EventScript_1AEBEC
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AEC42:: @ 81AEC42
	message MauvilleCity_PokemonCenter_1F_Text_1AE910
	waittext
	jump MauvilleCity_PokemonCenter_1F_EventScript_1AEBEC
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AEC4E:: @ 81AEC4E
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AE9B6, 2
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AEC57:: @ 81AEC57
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AE9F8, 4
	special 117
	waitstate
	compare 0x8006, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AECA6
	compare 0x8006, 65535
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AECAF
	special 116
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AECBD
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEA9B, 5
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AEC57
	special 118
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEAFB, 2
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AECA6:: @ 81AECA6
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEA2B, 2
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AECAF:: @ 81AECAF
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEAC3, 4
	jump MauvilleCity_PokemonCenter_1F_EventScript_1AEC57
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AECBD:: @ 81AECBD
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEA57, 2
	end

MauvilleCity_PokemonCenter_1F_Text_1AECC6:: @ 81AECC6
	.string "I’m the STORYTELLER.\n"
	.string "I’ll tell you tales of legendary\l"
	.string "TRAINERS.\p"
	.string "Will you hear my tale?$"

MauvilleCity_PokemonCenter_1F_Text_1AED1D:: @ 81AED1D
	.string "Oh...\n"
	.string "I feel stifled...$"

MauvilleCity_PokemonCenter_1F_Text_1AED35:: @ 81AED35
	.string "I know of these legends.\n"
	.string "Which tale will you have me tell?$"

MauvilleCity_PokemonCenter_1F_Text_1AED70:: @ 81AED70
	.string "But, I know of no legendary TRAINERS.\n"
	.string "Hence, I know no tales.\p"
	.string "Where does one find a TRAINER worthy\n"
	.string "of a legendary tale?$"

MauvilleCity_PokemonCenter_1F_Text_1AEDE8:: @ 81AEDE8
	.string "What’s that?!\n"
	.string "You... You...\p"
	.string "{STR_VAR_2}\n"
	.string "{STR_VAR_1} time(s)?!\p"
	.string "That is indeed magnificent!\n"
	.string "It’s the birth of a new legend!$"

MauvilleCity_PokemonCenter_1F_Text_1AEE50:: @ 81AEE50
	.string "It gets me thinking, could there be\n"
	.string "other TRAINERS with more impressive\l"
	.string "legends awaiting discovery?$"

MauvilleCity_PokemonCenter_1F_Text_1AEEB4:: @ 81AEEB4
	.string "Are you a TRAINER?\p"
	.string "Then tell me, have you any tales that\n"
	.string "are even remotely legendary?$"

MauvilleCity_PokemonCenter_1F_Text_1AEF0A:: @ 81AEF0A
	.string "Incidentally... Would you care to hear\n"
	.string "another legendary tale?$"

MauvilleCity_PokemonCenter_1F_Text_1AEF49:: @ 81AEF49
	.string "Hmm...\n"
	.string "I’m not satisfied...\p"
	.string "I wish you would bring me news worthy\n"
	.string "of being called a legend.$"

MauvilleCity_PokemonCenter_1F_Text_1AEFA5:: @ 81AEFA5
	.string "I wish more people would be interested\n"
	.string "in hearing my epic tales of legendary\l"
	.string "TRAINERS.$"

	.incbin "baserom.gba", 0x1aeffc, 0x181a

MauvilleCity_PokemonCenter_1F_EventScript_1B0816:: @ 81B0816
	setvar 0x8008, 0
	setvar 0x8009, 0
	setvar 0x800a, 0
	setvar 0x800b, 0
	lock
	faceplayer
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AECC6, 5
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0914
	specialval RESULT, 107
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B08D3

MauvilleCity_PokemonCenter_1F_EventScript_1B084F:: @ 81B084F
	message MauvilleCity_PokemonCenter_1F_Text_1AED35
	waittext
	special 109
	waitstate
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0883
	setvar 0x8008, 1
	special 108
	waittext
	waitbutton
	specialval RESULT, 110
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0893
	jump MauvilleCity_PokemonCenter_1F_EventScript_1B0909

MauvilleCity_PokemonCenter_1F_EventScript_1B0883:: @ 81B0883
	compare 0x8008, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0914
	jump MauvilleCity_PokemonCenter_1F_EventScript_1B08AE

MauvilleCity_PokemonCenter_1F_EventScript_1B0893:: @ 81B0893
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEE50, 4
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEF0A, 5
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B084F

MauvilleCity_PokemonCenter_1F_EventScript_1B08AE:: @ 81B08AE
	specialval RESULT, 112
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B091F
	specialval RESULT, 107
	compare RESULT, 4
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B091F
	jump MauvilleCity_PokemonCenter_1F_EventScript_1B08DB

MauvilleCity_PokemonCenter_1F_EventScript_1B08D3:: @ 81B08D3
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AED70, 4

MauvilleCity_PokemonCenter_1F_EventScript_1B08DB:: @ 81B08DB
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEEB4, 5
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0914
	specialval RESULT, 111
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0909
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEF49, 4
	closebutton
	release
	end

MauvilleCity_PokemonCenter_1F_EventScript_1B0909:: @ 81B0909
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEDE8, 4
	closebutton
	release
	end

MauvilleCity_PokemonCenter_1F_EventScript_1B0914:: @ 81B0914
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AED1D, 4
	closebutton
	release
	end

MauvilleCity_PokemonCenter_1F_EventScript_1B091F:: @ 81B091F
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEFA5, 4
	closebutton
	release
	end

MauvilleCity_PokemonCenter_1F_Text_1B092A:: @ 81B092A
	.string "I’m GIDDY!\n"
	.string "I have a scintillating story for you!\p"
	.string "Would you like to hear my story?$"

MauvilleCity_PokemonCenter_1F_Text_1B097C:: @ 81B097C
	.string "Oh...\n"
	.string "You’ve deflated me...$"

MauvilleCity_PokemonCenter_1F_Text_1B0998:: @ 81B0998
	.string "Also, I was thinking...$"

MauvilleCity_PokemonCenter_1F_Text_1B09B0:: @ 81B09B0
	.string "That’s about it, I think...\p"
	.string "We should chat again!\n"
	.string "Bye-bye!$"

MauvilleCity_PokemonCenter_1F_EventScript_1B09EB:: @ 81B09EB
	lock
	faceplayer
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B092A, 5
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0A0C
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0A6F
	end

MauvilleCity_PokemonCenter_1F_EventScript_1B0A0C:: @ 81B0A0C
	special 106
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0A4E
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0A79
	end

MauvilleCity_PokemonCenter_1F_EventScript_1B0A26:: @ 81B0A26
	special 106
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0A40
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0A79
	end

MauvilleCity_PokemonCenter_1F_EventScript_1B0A40:: @ 81B0A40
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0998, 4
	jump MauvilleCity_PokemonCenter_1F_EventScript_1B0A4E
	end

MauvilleCity_PokemonCenter_1F_EventScript_1B0A4E:: @ 81B0A4E
	special 105
	special 141
	waittext
	yesnobox 20, 8
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0A26
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0A26
	end

MauvilleCity_PokemonCenter_1F_EventScript_1B0A6F:: @ 81B0A6F
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B097C, 4
	release
	end

MauvilleCity_PokemonCenter_1F_EventScript_1B0A79:: @ 81B0A79
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B09B0, 4
	release
	end

	.incbin "baserom.gba", 0x1b0a83, 0xe

MauvilleCity_PokemonCenter_1F_Text_1B0A91:: @ 81B0A91
	.string "Hi, I’m the BARD.\n"
	.string "Would you like to hear my song?$"

MauvilleCity_PokemonCenter_1F_Text_1B0AC3:: @ 81B0AC3
	.string "Oh...\n"
	.string "You’ve left me feeling the blues...$"

MauvilleCity_PokemonCenter_1F_Text_1B0AED:: @ 81B0AED
	.string "Oh, what a moving song...\n"
	.string "I wish I could play it for others...$"

MauvilleCity_PokemonCenter_1F_Text_1B0B2C:: @ 81B0B2C
	.string "So?\n"
	.string "How do you like my song?\p"
	.string "But I’m none too happy about the\n"
	.string "lyrics.\p"
	.string "How would you like to write some new\n"
	.string "lyrics for me?$"

MauvilleCity_PokemonCenter_1F_Text_1B0BA6:: @ 81B0BA6
	.string "Oh...\n"
	.string "You’ve left me feeling the blues...$"

MauvilleCity_PokemonCenter_1F_Text_1B0BD0:: @ 81B0BD0
	.string "Thank you kindly!\n"
	.string "Let me sing it for you.$"

MauvilleCity_PokemonCenter_1F_Text_1B0BFA:: @ 81B0BFA
	.string "Was that how you wanted your song\n"
	.string "to go?$"

MauvilleCity_PokemonCenter_1F_Text_1B0C23:: @ 81B0C23
	.string "Okay! That’s it, then.\n"
	.string "I’ll sing this song for a while.$"

MauvilleCity_PokemonCenter_1F_Text_1B0C5B:: @ 81B0C5B
	.string "Hey, yo! They call me the HIPSTER.\n"
	.string "I’ll teach you what’s hip and happening.$"

MauvilleCity_PokemonCenter_1F_Text_1B0CA7:: @ 81B0CA7
	.string "But, hey, I taught you what’s hip and\n"
	.string "happening already.\p"
	.string "I’d like to spread the good word to\n"
	.string "other folks.$"

MauvilleCity_PokemonCenter_1F_Text_1B0D11:: @ 81B0D11
	.string "But, hey, you already know a lot about\n"
	.string "what’s hip and happening.\p"
	.string "I’ve got nothing new to teach you!$"

MauvilleCity_PokemonCenter_1F_Text_1B0D75:: @ 81B0D75
	.string "Hey, have you heard about\n"
	.string "“{STR_VAR_1}”?\p"
	.string "What’s it mean? Well...\n"
	.string "Ask your daddy or mommy, okay?$"

PetalburgWoods_EventScript_1B0DCC:: @ 81B0DCC
Route103_EventScript_1B0DCC:: @ 81B0DCC
Route104_EventScript_1B0DCC:: @ 81B0DCC
Route110_TrickHousePuzzle1_EventScript_1B0DCC:: @ 81B0DCC
Route111_EventScript_1B0DCC:: @ 81B0DCC
Route116_EventScript_1B0DCC:: @ 81B0DCC
Route117_EventScript_1B0DCC:: @ 81B0DCC
Route118_EventScript_1B0DCC:: @ 81B0DCC
Route120_EventScript_1B0DCC:: @ 81B0DCC
Route121_EventScript_1B0DCC:: @ 81B0DCC
Route123_EventScript_1B0DCC:: @ 81B0DCC
	lockall
	checkflag 2055
	jumpif 0, Route103_EventScript_1B0E32
	checkattack 15
	compare RESULT, 6
	jumpeq Route103_EventScript_1B0E32
	setanimation 0, 32781
	bufferpartypoke 0, 32781
	bufferattack 1, 15
	msgbox Route103_Text_1B0E3F, 5
	compare RESULT, 0
	jumpeq Route103_EventScript_1B0E3C
	msgbox Route103_Text_1B0E82, 4
	closebutton
	doanimation 2
	waitstate
	jump Route103_EventScript_1B0E21
	end

	.global gUnknown_081B0E16
gUnknown_081B0E16: @ 81B0E16

	.incbin "baserom.gba", 0x1b0e16, 0xb

Route103_EventScript_1B0E21:: @ 81B0E21
	move LAST_TALKED, Route103_Movement_1B0E30
	waitmove 0
	disappear LAST_TALKED
	releaseall
	end

Route103_Movement_1B0E30:: @ 81B0E30
	step_5b
	step_end

Route103_EventScript_1B0E32:: @ 81B0E32
	msgbox Route103_Text_1B0E8E, 3
	releaseall
	end

Route103_EventScript_1B0E3C:: @ 81B0E3C
	closebutton
	releaseall
	end

Route103_Text_1B0E3F:: @ 81B0E3F
	.string "This tree looks like it can be CUT down.\p"
	.string "Would you like to CUT it?$"

Route103_Text_1B0E82:: @ 81B0E82
Route111_Text_1B0E82:: @ 81B0E82
	.string "{STR_VAR_1} used {STR_VAR_2}.$"

Route103_Text_1B0E8E:: @ 81B0E8E
	.string "This tree looks like it can be CUT down.$"

GraniteCave_B2F_EventScript_1B0EB7:: @ 81B0EB7
Route110_TrickHousePuzzle3_EventScript_1B0EB7:: @ 81B0EB7
Route111_EventScript_1B0EB7:: @ 81B0EB7
Route114_EventScript_1B0EB7:: @ 81B0EB7
Route115_EventScript_1B0EB7:: @ 81B0EB7
RusturfTunnel_EventScript_1B0EB7:: @ 81B0EB7
SafariZone_Northeast_EventScript_1B0EB7:: @ 81B0EB7
SeafloorCavern_Room1_EventScript_1B0EB7:: @ 81B0EB7
SeafloorCavern_Room2_EventScript_1B0EB7:: @ 81B0EB7
SeafloorCavern_Room5_EventScript_1B0EB7:: @ 81B0EB7
VictoryRoad_B1F_EventScript_1B0EB7:: @ 81B0EB7
	lockall
	checkflag 2057
	jumpif 0, Route111_EventScript_1B0F3E
	checkattack 249
	compare RESULT, 6
	jumpeq Route111_EventScript_1B0F3E
	setanimation 0, 32781
	bufferpartypoke 0, 32781
	bufferattack 1, 249
	msgbox Route111_Text_1B0F4B, 5
	compare RESULT, 0
	jumpeq Route111_EventScript_1B0F48
	msgbox Route111_Text_1B0E82, 4
	closebutton
	doanimation 37
	waitstate
	jump Route111_EventScript_1B0F0C
	end

	.global gUnknown_081B0F01
gUnknown_081B0F01: @ 81B0F01

	.incbin "baserom.gba", 0x1b0f01, 0xb

Route111_EventScript_1B0F0C:: @ 81B0F0C
	move LAST_TALKED, Route111_Movement_1B0F3C
	waitmove 0
	disappear LAST_TALKED
	specialval RESULT, 298
	compare RESULT, 1
	jumpeq Route111_EventScript_1B0F3A
	special 171
	compare RESULT, 0
	jumpeq Route111_EventScript_1B0F3A
	waitstate
	releaseall
	end

Route111_EventScript_1B0F3A:: @ 81B0F3A
	releaseall
	end

Route111_Movement_1B0F3C:: @ 81B0F3C
	step_5a
	step_end

Route111_EventScript_1B0F3E:: @ 81B0F3E
	msgbox Route111_Text_1B0F90, 3
	releaseall
	end

Route111_EventScript_1B0F48:: @ 81B0F48
	closebutton
	releaseall
	end

Route111_Text_1B0F4B:: @ 81B0F4B
	.string "This rock appears to be breakable.\n"
	.string "Would you like to use ROCK SMASH?$"

Route111_Text_1B0F90:: @ 81B0F90
	.string "It’s a rugged rock, but a POKéMON\n"
	.string "may be able to smash it.$"

FieryPath_EventScript_1B0FCB:: @ 81B0FCB
Route110_TrickHousePuzzle4_EventScript_1B0FCB:: @ 81B0FCB
SeafloorCavern_Room1_EventScript_1B0FCB:: @ 81B0FCB
SeafloorCavern_Room2_EventScript_1B0FCB:: @ 81B0FCB
SeafloorCavern_Room3_EventScript_1B0FCB:: @ 81B0FCB
SeafloorCavern_Room5_EventScript_1B0FCB:: @ 81B0FCB
SeafloorCavern_Room8_EventScript_1B0FCB:: @ 81B0FCB
ShoalCave_LowTideLowerRoom_EventScript_1B0FCB:: @ 81B0FCB
VictoryRoad_B1F_EventScript_1B0FCB:: @ 81B0FCB
	lockall
	checkflag 2058
	jumpif 0, FieryPath_EventScript_1B1026
	checkflag 2089
	jumpeq FieryPath_EventScript_1B1030
	checkattack 70
	compare RESULT, 6
	jumpeq FieryPath_EventScript_1B1026
	setanimation 0, 32781
	msgbox FieryPath_Text_1B103D, 5
	compare RESULT, 0
	jumpeq FieryPath_EventScript_1B103A
	closebutton
	doanimation 40
	waitstate
	jump FieryPath_EventScript_1B1019
	end

	.global gUnknown_081B100E
gUnknown_081B100E: @ 81B100E

	.incbin "baserom.gba", 0x1b100e, 0xb

FieryPath_EventScript_1B1019:: @ 81B1019
	setflag 2089
	msgbox FieryPath_Text_1B109D, 3
	releaseall
	end

FieryPath_EventScript_1B1026:: @ 81B1026
	msgbox FieryPath_Text_1B10E7, 3
	releaseall
	end

FieryPath_EventScript_1B1030:: @ 81B1030
	msgbox FieryPath_Text_1B1127, 3
	releaseall
	end

FieryPath_EventScript_1B103A:: @ 81B103A
	closebutton
	releaseall
	end

	.include "data/maps/text/FieryPath.s"
	.global gUnknown_081B115A
gUnknown_081B115A: @ 81B115A
	.incbin "baserom.gba", 0x001b115a, 0x3a

	.global gUnknown_081B1194
gUnknown_081B1194: @ 81B1194
	.incbin "baserom.gba", 0x001b1194, 0x8c

	.global gUnknown_081B1220
gUnknown_081B1220: @ 81B1220
	.incbin "baserom.gba", 0x001b1220, 0x49

	.global gUnknown_081B1269
gUnknown_081B1269: @ 81B1269
	.incbin "baserom.gba", 0x001b1269, 0x1a3

	.global gUnknown_081B140C
gUnknown_081B140C: @ 81B140C

	.incbin "baserom.gba", 0x1b140c, 0x2d

Route102_EventScript_1B1439:: @ 81B1439
	giveitem ITEM_POTION, 1, 1
	end

Route103_EventScript_1B1446:: @ 81B1446
	giveitem ITEM_GUARD_SPEC, 1, 1
	end

Route104_EventScript_1B1453:: @ 81B1453
	giveitem ITEM_PP_UP, 1, 1
	end

Route104_EventScript_1B1460:: @ 81B1460
	giveitem ITEM_POKE_BALL, 1, 1
	end

Route104_EventScript_1B146D:: @ 81B146D
	giveitem ITEM_X_ACCURACY, 1, 1
	end

Route104_EventScript_1B147A:: @ 81B147A
	giveitem ITEM_POTION, 1, 1
	end

Route105_EventScript_1B1487:: @ 81B1487
	giveitem ITEM_IRON, 1, 1
	end

Route106_EventScript_1B1494:: @ 81B1494
	giveitem ITEM_PROTEIN, 1, 1
	end

Route109_EventScript_1B14A1:: @ 81B14A1
	giveitem ITEM_PP_UP, 1, 1
	end

Route110_EventScript_1B14AE:: @ 81B14AE
	giveitem ITEM_RARE_CANDY, 1, 1
	end

Route110_EventScript_1B14BB:: @ 81B14BB
	giveitem ITEM_DIRE_HIT, 1, 1
	end

Route111_EventScript_1B14C8:: @ 81B14C8
	giveitem ITEM_TM37, 1, 1
	end

Route111_EventScript_1B14D5:: @ 81B14D5
	giveitem ITEM_STARDUST, 1, 1
	end

Route111_EventScript_1B14E2:: @ 81B14E2
	giveitem ITEM_HP_UP, 1, 1
	end

Route112_EventScript_1B14EF:: @ 81B14EF
	giveitem ITEM_NUGGET, 1, 1
	end

Route113_EventScript_1B14FC:: @ 81B14FC
	giveitem ITEM_MAX_ETHER, 1, 1
	end

Route113_EventScript_1B1509:: @ 81B1509
	giveitem ITEM_SUPER_REPEL, 1, 1
	end

Route114_EventScript_1B1516:: @ 81B1516
	giveitem ITEM_RARE_CANDY, 1, 1
	end

Route114_EventScript_1B1523:: @ 81B1523
	giveitem ITEM_PROTEIN, 1, 1
	end

Route115_EventScript_1B1530:: @ 81B1530
	giveitem ITEM_SUPER_POTION, 1, 1
	end

Route115_EventScript_1B153D:: @ 81B153D
	giveitem ITEM_TM01, 1, 1
	end

Route115_EventScript_1B154A:: @ 81B154A
	giveitem ITEM_IRON, 1, 1
	end

Route115_EventScript_1B1557:: @ 81B1557
	giveitem ITEM_GREAT_BALL, 1, 1
	end

Route116_EventScript_1B1564:: @ 81B1564
	giveitem ITEM_X_SPECIAL, 1, 1
	end

Route116_EventScript_1B1571:: @ 81B1571
	giveitem ITEM_ETHER, 1, 1
	end

Route116_EventScript_1B157E:: @ 81B157E
	giveitem ITEM_REPEL, 1, 1
	end

Route116_EventScript_1B158B:: @ 81B158B
	giveitem ITEM_HP_UP, 1, 1
	end

Route117_EventScript_1B1598:: @ 81B1598
	giveitem ITEM_GREAT_BALL, 1, 1
	end

Route117_EventScript_1B15A5:: @ 81B15A5
	giveitem ITEM_REVIVE, 1, 1
	end

Route118_EventScript_1B15B2:: @ 81B15B2
	giveitem ITEM_HYPER_POTION, 1, 1
	end

Route119_EventScript_1B15BF:: @ 81B15BF
	giveitem ITEM_SUPER_REPEL, 1, 1
	end

Route119_EventScript_1B15CC:: @ 81B15CC
	giveitem ITEM_ZINC, 1, 1
	end

Route119_EventScript_1B15D9:: @ 81B15D9
	giveitem ITEM_ELIXIR, 1, 1
	end

Route119_EventScript_1B15E6:: @ 81B15E6
	giveitem ITEM_LEAF_STONE, 1, 1
	end

Route119_EventScript_1B15F3:: @ 81B15F3
	giveitem ITEM_RARE_CANDY, 1, 1
	end

Route119_EventScript_1B1600:: @ 81B1600
	giveitem ITEM_HYPER_POTION, 1, 1
	end

Route119_EventScript_1B160D:: @ 81B160D
	giveitem ITEM_HYPER_POTION, 1, 1
	end

Route120_EventScript_1B161A:: @ 81B161A
	giveitem ITEM_NUGGET, 1, 1
	end

Route120_EventScript_1B1627:: @ 81B1627
	giveitem ITEM_FULL_HEAL, 1, 1
	end

Route120_EventScript_1B1634:: @ 81B1634
	giveitem ITEM_HYPER_POTION, 1, 1
	end

Route120_EventScript_1B1641:: @ 81B1641
	giveitem ITEM_NEST_BALL, 1, 1
	end

Route121_EventScript_1B164E:: @ 81B164E
	giveitem ITEM_CARBOS, 1, 1
	end

Route123_EventScript_1B165B:: @ 81B165B
	giveitem ITEM_CALCIUM, 1, 1
	end

Route123_EventScript_1B1668:: @ 81B1668
	giveitem ITEM_RARE_CANDY, 1, 1
	end

Route123_EventScript_1B1675:: @ 81B1675
	giveitem ITEM_ULTRA_BALL, 1, 1
	end

Route123_EventScript_1B1682:: @ 81B1682
	giveitem ITEM_ELIXIR, 1, 1
	end

Route124_EventScript_1B168F:: @ 81B168F
	giveitem ITEM_RED_SHARD, 1, 1
	end

Route124_EventScript_1B169C:: @ 81B169C
	giveitem ITEM_BLUE_SHARD, 1, 1
	end

Route124_EventScript_1B16A9:: @ 81B16A9
	giveitem ITEM_YELLOW_SHARD, 1, 1
	end

Route126_EventScript_1B16B6:: @ 81B16B6
	giveitem ITEM_GREEN_SHARD, 1, 1
	end

Route127_EventScript_1B16C3:: @ 81B16C3
	giveitem ITEM_ZINC, 1, 1
	end

Route127_EventScript_1B16D0:: @ 81B16D0
	giveitem ITEM_CARBOS, 1, 1
	end

Route132_EventScript_1B16DD:: @ 81B16DD
	giveitem ITEM_RARE_CANDY, 1, 1
	end

Route133_EventScript_1B16EA:: @ 81B16EA
	giveitem ITEM_BIG_PEARL, 1, 1
	end

Route133_EventScript_1B16F7:: @ 81B16F7
	giveitem ITEM_STAR_PIECE, 1, 1
	end

PetalburgCity_EventScript_1B1704:: @ 81B1704
	giveitem ITEM_MAX_REVIVE, 1, 1
	end

PetalburgCity_EventScript_1B1711:: @ 81B1711
	giveitem ITEM_ETHER, 1, 1
	end

MauvilleCity_EventScript_1B171E:: @ 81B171E
	giveitem ITEM_X_SPEED, 1, 1
	end

RustboroCity_EventScript_1B172B:: @ 81B172B
	giveitem ITEM_X_DEFEND, 1, 1
	end

LilycoveCity_EventScript_1B1738:: @ 81B1738
	giveitem ITEM_MAX_REPEL, 1, 1
	end

MossdeepCity_EventScript_1B1745:: @ 81B1745
	giveitem ITEM_NET_BALL, 1, 1
	end

PetalburgWoods_EventScript_1B1752:: @ 81B1752
	giveitem ITEM_X_ATTACK, 1, 1
	end

PetalburgWoods_EventScript_1B175F:: @ 81B175F
	giveitem ITEM_GREAT_BALL, 1, 1
	end

PetalburgWoods_EventScript_1B176C:: @ 81B176C
	giveitem ITEM_ETHER, 1, 1
	end

PetalburgWoods_EventScript_1B1779:: @ 81B1779
	giveitem ITEM_PARALYZE_HEAL, 1, 1
	end

RusturfTunnel_EventScript_1B1786:: @ 81B1786
	giveitem ITEM_POKE_BALL, 1, 1
	end

RusturfTunnel_EventScript_1B1793:: @ 81B1793
	giveitem ITEM_MAX_ETHER, 1, 1
	end

GraniteCave_1F_EventScript_1B17A0:: @ 81B17A0
	giveitem ITEM_ESCAPE_ROPE, 1, 1
	end

GraniteCave_B1F_EventScript_1B17AD:: @ 81B17AD
	giveitem ITEM_POKE_BALL, 1, 1
	end

GraniteCave_B2F_EventScript_1B17BA:: @ 81B17BA
	giveitem ITEM_REPEL, 1, 1
	end

GraniteCave_B2F_EventScript_1B17C7:: @ 81B17C7
	giveitem ITEM_RARE_CANDY, 1, 1
	end

JaggedPass_EventScript_1B17D4:: @ 81B17D4
	giveitem ITEM_BURN_HEAL, 1, 1
	end

FieryPath_EventScript_1B17E1:: @ 81B17E1
	giveitem ITEM_FIRE_STONE, 1, 1
	end

FieryPath_EventScript_1B17EE:: @ 81B17EE
	giveitem ITEM_TM06, 1, 1
	end

MeteorFalls_1F_1R_EventScript_1B17FB:: @ 81B17FB
	giveitem ITEM_TM23, 1, 1
	end

MeteorFalls_1F_1R_EventScript_1B1808:: @ 81B1808
	giveitem ITEM_FULL_HEAL, 1, 1
	end

MeteorFalls_1F_1R_EventScript_1B1815:: @ 81B1815
	giveitem ITEM_MOON_STONE, 1, 1
	end

MeteorFalls_1F_1R_EventScript_1B1822:: @ 81B1822
	giveitem ITEM_PP_UP, 1, 1
	end

MeteorFalls_B1F_2R_EventScript_1B182F:: @ 81B182F
	giveitem ITEM_TM02, 1, 1
	end

NewMauville_Inside_EventScript_1B183C:: @ 81B183C
	giveitem ITEM_ULTRA_BALL, 1, 1
	end

NewMauville_Inside_EventScript_1B1849:: @ 81B1849
	giveitem ITEM_ESCAPE_ROPE, 1, 1
	end

NewMauville_Inside_EventScript_1B1856:: @ 81B1856
	giveitem ITEM_THUNDER_STONE, 1, 1
	end

NewMauville_Inside_EventScript_1B1863:: @ 81B1863
	giveitem ITEM_FULL_HEAL, 1, 1
	end

NewMauville_Inside_EventScript_1B1870:: @ 81B1870
	giveitem ITEM_PARALYZE_HEAL, 1, 1
	end

AbandonedShip_Rooms_1F_EventScript_1B187D:: @ 81B187D
	giveitem ITEM_HARBOR_MAIL, 1, 1
	end

AbandonedShip_Rooms_B1F_EventScript_1B188A:: @ 81B188A
	giveitem ITEM_ESCAPE_ROPE, 1, 1
	end

AbandonedShip_Rooms2_B1F_EventScript_1B1897:: @ 81B1897
	giveitem ITEM_DIVE_BALL, 1, 1
	end

AbandonedShip_Room_B1F_EventScript_1B18A4:: @ 81B18A4
	giveitem ITEM_TM13, 1, 1
	end

AbandonedShip_Rooms2_1F_EventScript_1B18B1:: @ 81B18B1
	giveitem ITEM_REVIVE, 1, 1
	end

AbandonedShip_CaptainsOffice_EventScript_1B18BE:: @ 81B18BE
	giveitem ITEM_STORAGE_KEY, 1, 1
	end

AbandonedShip_HiddenFloorRooms_EventScript_1B18CB:: @ 81B18CB
	giveitem ITEM_LUXURY_BALL, 1, 1
	end

AbandonedShip_HiddenFloorRooms_EventScript_1B18D8:: @ 81B18D8
	giveitem ITEM_SCANNER, 1, 1
	end

AbandonedShip_HiddenFloorRooms_EventScript_1B18E5:: @ 81B18E5
	giveitem ITEM_WATER_STONE, 1, 1
	end

AbandonedShip_HiddenFloorRooms_EventScript_1B18F2:: @ 81B18F2
	giveitem ITEM_TM18, 1, 1
	end

ScorchedSlab_EventScript_1B18FF:: @ 81B18FF
	giveitem ITEM_TM11, 1, 1
	end

SafariZone_Northwest_EventScript_1B190C:: @ 81B190C
	giveitem ITEM_TM22, 1, 1
	end

SafariZone_Northeast_EventScript_1B1919:: @ 81B1919
	giveitem ITEM_CALCIUM, 1, 1
	end

SafariZone_Southwest_EventScript_1B1926:: @ 81B1926
	giveitem ITEM_MAX_REVIVE, 1, 1
	end

MtPyre_2F_EventScript_1B1933:: @ 81B1933
	giveitem ITEM_ULTRA_BALL, 1, 1
	end

MtPyre_3F_EventScript_1B1940:: @ 81B1940
	giveitem ITEM_SUPER_REPEL, 1, 1
	end

MtPyre_4F_EventScript_1B194D:: @ 81B194D
	giveitem ITEM_SEA_INCENSE, 1, 1
	end

MtPyre_5F_EventScript_1B195A:: @ 81B195A
	giveitem ITEM_LAX_INCENSE, 1, 1
	end

MtPyre_6F_EventScript_1B1967:: @ 81B1967
	giveitem ITEM_TM30, 1, 1
	end

MtPyre_Exterior_EventScript_1B1974:: @ 81B1974
	giveitem ITEM_MAX_POTION, 1, 1
	end

MtPyre_Exterior_EventScript_1B1981:: @ 81B1981
	giveitem ITEM_TM48, 1, 1
	end

AquaHideout_B1F_EventScript_1B198E:: @ 81B198E
	giveitem ITEM_MASTER_BALL, 1, 1
	end

AquaHideout_B1F_EventScript_1B199B:: @ 81B199B
	giveitem ITEM_NUGGET, 1, 1
	end

AquaHideout_B1F_EventScript_1B19A8:: @ 81B19A8
	giveitem ITEM_MAX_ELIXIR, 1, 1
	end

AquaHideout_B2F_EventScript_1B19B5:: @ 81B19B5
	giveitem ITEM_NEST_BALL, 1, 1
	end

MagmaHideout_B1F_EventScript_1B19C2:: @ 81B19C2
	giveitem ITEM_MASTER_BALL, 1, 1
	end

MagmaHideout_B1F_EventScript_1B19CF:: @ 81B19CF
	giveitem ITEM_NUGGET, 1, 1
	end

MagmaHideout_B1F_EventScript_1B19DC:: @ 81B19DC
	giveitem ITEM_MAX_ELIXIR, 1, 1
	end

MagmaHideout_B2F_EventScript_1B19E9:: @ 81B19E9
	giveitem ITEM_NEST_BALL, 1, 1
	end

ShoalCave_LowTideEntranceRoom_EventScript_1B19F6:: @ 81B19F6
	giveitem ITEM_BIG_PEARL, 1, 1
	end

ShoalCave_LowTideInnerRoom_EventScript_1B1A03:: @ 81B1A03
	giveitem ITEM_RARE_CANDY, 1, 1
	end

ShoalCave_LowTideStairsRoom_EventScript_1B1A10:: @ 81B1A10
	giveitem ITEM_ICE_HEAL, 1, 1
	end

ShoalCave_LowTideIceRoom_EventScript_1B1A1D:: @ 81B1A1D
	giveitem ITEM_TM07, 1, 1
	end

ShoalCave_LowTideIceRoom_EventScript_1B1A2A:: @ 81B1A2A
	giveitem ITEM_NEVER_MELT_ICE, 1, 1
	end

SeafloorCavern_Room9_EventScript_1B1A37:: @ 81B1A37
	giveitem ITEM_TM26, 1, 1
	end

CaveOfOrigin_B3F_EventScript_1B1A44:: @ 81B1A44
	giveitem ITEM_HM07, 1, 1
	end

Route110_TrickHousePuzzle1_EventScript_1B1A51:: @ 81B1A51
	giveitem ITEM_ORANGE_MAIL, 1, 1
	end

Route110_TrickHousePuzzle2_EventScript_1B1A5E:: @ 81B1A5E
	giveitem ITEM_HARBOR_MAIL, 1, 1
	end

Route110_TrickHousePuzzle2_EventScript_1B1A6B:: @ 81B1A6B
	giveitem ITEM_WAVE_MAIL, 1, 1
	end

Route110_TrickHousePuzzle3_EventScript_1B1A78:: @ 81B1A78
	giveitem ITEM_SHADOW_MAIL, 1, 1
	end

Route110_TrickHousePuzzle3_EventScript_1B1A85:: @ 81B1A85
	giveitem ITEM_WOOD_MAIL, 1, 1
	end

Route110_TrickHousePuzzle4_EventScript_1B1A92:: @ 81B1A92
	giveitem ITEM_MECH_MAIL, 1, 1
	end

Route110_TrickHousePuzzle6_EventScript_1B1A9F:: @ 81B1A9F
	giveitem ITEM_GLITTER_MAIL, 1, 1
	end

Route110_TrickHousePuzzle7_EventScript_1B1AAC:: @ 81B1AAC
	giveitem ITEM_TROPIC_MAIL, 1, 1
	end

Route110_TrickHousePuzzle8_EventScript_1B1AB9:: @ 81B1AB9
	giveitem ITEM_BEAD_MAIL, 1, 1
	end

VictoryRoad_1F_EventScript_1B1AC6:: @ 81B1AC6
	giveitem ITEM_MAX_ELIXIR, 1, 1
	end

VictoryRoad_1F_EventScript_1B1AD3:: @ 81B1AD3
	giveitem ITEM_PP_UP, 1, 1
	end

VictoryRoad_B1F_EventScript_1B1AE0:: @ 81B1AE0
	giveitem ITEM_TM29, 1, 1
	end

VictoryRoad_B1F_EventScript_1B1AED:: @ 81B1AED
	giveitem ITEM_FULL_RESTORE, 1, 1
	end

VictoryRoad_B2F_EventScript_1B1AFA:: @ 81B1AFA
	giveitem ITEM_FULL_HEAL, 1, 1
	end

	.incbin "baserom.gba", 0x1b1b07, 0xd

PetalburgCity_PokemonCenter_1F_EventScript_1B1B14:: @ 81B1B14
	lock
	faceplayer
	checkflag 2053
	jumpeq PetalburgCity_PokemonCenter_1F_EventScript_1B1BDB
	msgbox PetalburgCity_PokemonCenter_1F_Text_1B1C97, 4
	jump PetalburgCity_PokemonCenter_1F_EventScript_1B1B2D
	end

PetalburgCity_PokemonCenter_1F_EventScript_1B1B2D:: @ 81B1B2D
	msgbox PetalburgCity_PokemonCenter_1F_Text_1B1D10, 4
	multichoice 17, 6, 20, 0
	switch RESULT
	case 0, PetalburgCity_PokemonCenter_1F_EventScript_1B1B7A
	case 1, PetalburgCity_PokemonCenter_1F_EventScript_1B1BD1
	case 2, PetalburgCity_PokemonCenter_1F_EventScript_1B1B6C
	case 127, PetalburgCity_PokemonCenter_1F_EventScript_1B1BD1
	end

PetalburgCity_PokemonCenter_1F_EventScript_1B1B6C:: @ 81B1B6C
	msgbox PetalburgCity_PokemonCenter_1F_Text_1B1D3A, 4
	jump PetalburgCity_PokemonCenter_1F_EventScript_1B1B2D
	end

PetalburgCity_PokemonCenter_1F_EventScript_1B1B7A:: @ 81B1B7A
	msgbox PetalburgCity_PokemonCenter_1F_Text_1B1F7B, 4
	closebutton
	setvar 0x8004, 0
	call PetalburgCity_PokemonCenter_1F_EventScript_1A00F3
	lock
	faceplayer
	compare 0x8004, 1
	callif 1, PetalburgCity_PokemonCenter_1F_EventScript_1B1C77
	compare RESULT, 0
	jumpeq PetalburgCity_PokemonCenter_1F_EventScript_1B1BB1
	compare RESULT, 1
	jumpeq PetalburgCity_PokemonCenter_1F_EventScript_1B1BBB
	end

PetalburgCity_PokemonCenter_1F_EventScript_1B1BB1:: @ 81B1BB1
	msgbox PetalburgCity_PokemonCenter_1F_Text_1B1FF0, 4
	release
	end

PetalburgCity_PokemonCenter_1F_EventScript_1B1BBB:: @ 81B1BBB
	setvar 0x8004, 0
	special 96
	waittext
	pause 80
	msgbox PetalburgCity_PokemonCenter_1F_Text_1B2137, 4
	release
	end

PetalburgCity_PokemonCenter_1F_EventScript_1B1BD1:: @ 81B1BD1
	msgbox PetalburgCity_PokemonCenter_1F_Text_1B1FA3, 4
	release
	end

PetalburgCity_PokemonCenter_1F_EventScript_1B1BDB:: @ 81B1BDB
	msgbox PetalburgCity_PokemonCenter_1F_Text_1B202F, 4
	jump PetalburgCity_PokemonCenter_1F_EventScript_1B1BE9
	end

PetalburgCity_PokemonCenter_1F_EventScript_1B1BE9:: @ 81B1BE9
	msgbox PetalburgCity_PokemonCenter_1F_Text_1B2063, 4
	multichoice 17, 6, 20, 0
	switch RESULT
	case 0, PetalburgCity_PokemonCenter_1F_EventScript_1B1C36
	case 1, PetalburgCity_PokemonCenter_1F_EventScript_1B1C6D
	case 2, PetalburgCity_PokemonCenter_1F_EventScript_1B1C28
	case 127, PetalburgCity_PokemonCenter_1F_EventScript_1B1C6D
	end

PetalburgCity_PokemonCenter_1F_EventScript_1B1C28:: @ 81B1C28
	msgbox PetalburgCity_PokemonCenter_1F_Text_1B1D3A, 4
	jump PetalburgCity_PokemonCenter_1F_EventScript_1B1BE9
	end

PetalburgCity_PokemonCenter_1F_EventScript_1B1C36:: @ 81B1C36
	msgbox PetalburgCity_PokemonCenter_1F_Text_1B207F, 4
	closebutton
	setvar 0x8004, 0
	call PetalburgCity_PokemonCenter_1F_EventScript_1A00F3
	lock
	faceplayer
	compare 0x8004, 1
	callif 1, PetalburgCity_PokemonCenter_1F_EventScript_1B1C77
	compare RESULT, 0
	jumpeq PetalburgCity_PokemonCenter_1F_EventScript_1B1BB1
	compare RESULT, 1
	jumpeq PetalburgCity_PokemonCenter_1F_EventScript_1B1BBB
	end

PetalburgCity_PokemonCenter_1F_EventScript_1B1C6D:: @ 81B1C6D
	msgbox PetalburgCity_PokemonCenter_1F_Text_1B20CE, 4
	release
	end

PetalburgCity_PokemonCenter_1F_EventScript_1B1C77:: @ 81B1C77
	checkflag 2059
	jumpif 0, PetalburgCity_PokemonCenter_1F_EventScript_1B1C96
	checkflag 2124
	jumpeq PetalburgCity_PokemonCenter_1F_EventScript_1B1C96
	setflag 2124
	msgbox PetalburgCity_PokemonCenter_1F_Text_1B21CC, 3
	release
	end

PetalburgCity_PokemonCenter_1F_EventScript_1B1C96:: @ 81B1C96
	return

PetalburgCity_PokemonCenter_1F_Text_1B1C97:: @ 81B1C97
	.string "Hello there, TRAINER!\n"
	.string "You’ve got a wonderful smile, there.\p"
	.string "I have a hobby - collecting the profiles\n"
	.string "of POKéMON TRAINERS.$"

PetalburgCity_PokemonCenter_1F_Text_1B1D10:: @ 81B1D10
	.string "So, how about it?\n"
	.string "May I see your profile?$"

PetalburgCity_PokemonCenter_1F_Text_1B1D3A:: @ 81B1D3A
	.string "You make your own profile by putting\n"
	.string "together four words or phrases.\p"
	.string "Here, I’ll show you an example of a\n"
	.string "profile using four pieces of text.\p"
	.string "You can switch those four pieces with\n"
	.string "other text pieces any which way you\l"
	.string "like to make your own profile.\p"
	.string "There are a lot of text pieces that you\n"
	.string "can use.\p"
	.string "They are arranged in groups like\n"
	.string "POKéMON, lifestyles, and hobbies so\l"
	.string "it is easier to look them up.\p"
	.string "So, first, choose the group of text\n"
	.string "pieces to display a list of choices.\p"
	.string "Then, pick the choice you want.\p"
	.string "Repeat for the remaining text choices,\n"
	.string "and you’ll have your very own profile.$"

	.incbin "baserom.gba", 0x1b1f7a, 0x1

PetalburgCity_PokemonCenter_1F_Text_1B1F7B:: @ 81B1F7B
	.string "Yes! Thank you!\n"
	.string "May I see your profile?$"

PetalburgCity_PokemonCenter_1F_Text_1B1FA3:: @ 81B1FA3
	.string "Oh, no, really?\p"
	.string "I imagine someone like you would have\n"
	.string "a wonderful profile...$"

PetalburgCity_PokemonCenter_1F_Text_1B1FF0:: @ 81B1FF0
	.string "Oh? You’re not into it right now?\p"
	.string "Well, anytime is good by me!$"

PetalburgCity_PokemonCenter_1F_Text_1B202F:: @ 81B202F
	.string "Hello there, TRAINER!\n"
	.string "You’ve got a wonderful smile.$"

PetalburgCity_PokemonCenter_1F_Text_1B2063:: @ 81B2063
	.string "May I see your new profile?$"

PetalburgCity_PokemonCenter_1F_Text_1B207F:: @ 81B207F
	.string "Yes! Thank you!\p"
	.string "I hope it’s even better than the profile\n"
	.string "you showed me before.$"

PetalburgCity_PokemonCenter_1F_Text_1B20CE:: @ 81B20CE
	.string "Oh, you like your profile the way it is.\p"
	.string "I don’t blame you - it’s a wonderful\n"
	.string "profile the way it is now.$"

PetalburgCity_PokemonCenter_1F_Text_1B2137:: @ 81B2137
	.string "F-fantastic!\p"
	.string "Your profile, it’s wonderful!\n"
	.string "It really says what you’re about.\p"
	.string "Why, anyone hearing this profile would\n"
	.string "be captivated by you!\p"
	.string "Thank you!$"

PetalburgCity_PokemonCenter_1F_Text_1B21CC:: @ 81B21CC
	.string "Oh?\n"
	.string "You know the secret saying!\p"
	.string "That means you’re now a fellow member\n"
	.string "of the MYSTERY EVENT CLUB!$"

Route117_EventScript_1B222D:: @ 81B222D
	lock
	faceplayer
	special 181
	specialval RESULT, 182
	compare RESULT, 1
	jumpeq Route117_EventScript_1B2262
	compare RESULT, 2
	jumpeq Route117_EventScript_1B22E7
	compare RESULT, 3
	jumpeq Route117_EventScript_1B22FE
	msgbox Route117_Text_1B25CB, 4
	release
	end

Route117_EventScript_1B2262:: @ 81B2262
	msgbox Route117_Text_1B2659, 5
	compare RESULT, 1
	jumpeq Route117_EventScript_1B2298
	msgbox Route117_Text_1B28C4, 5
	compare RESULT, 1
	jumpeq Route117_EventScript_1B2298
	msgbox Route117_Text_1B2745, 4
	clearflag 134
	special 183
	release
	end

Route117_EventScript_1B2298:: @ 81B2298
	specialval RESULT, 131
	compare RESULT, 6
	jumpif 5, Route117_EventScript_1B22B2
	msgbox Route117_Text_1B2766, 4
	release
	end

Route117_EventScript_1B22B2:: @ 81B22B2
	message Route117_Text_1B27A2
	fanfare 367
	waitfanfare
	waittext
	waitbutton
	msgbox Route117_Text_1B27CD, 4
	special 184
	clearflag 134
	release
	end

Route117_EventScript_1B22CD:: @ 81B22CD
	specialval RESULT, 195
	compare RESULT, 1
	callif 1, Route117_EventScript_1B22DE
	return

Route117_EventScript_1B22DE:: @ 81B22DE
	msgbox Route117_Text_1B27E3, 4
	return

Route117_EventScript_1B22E7:: @ 81B22E7
	special 181
	msgbox Route117_Text_1B2710, 4
	setvar 0x8004, 0
	call Route117_EventScript_1B22CD
	release
	end

Route117_EventScript_1B22FE:: @ 81B22FE
	special 181
	msgbox Route117_Text_1B2897, 4
	special 185
	special 141
	waittext
	waitbutton
	setvar 0x8004, 0
	call Route117_EventScript_1B22CD
	setvar 0x8004, 1
	call Route117_EventScript_1B22CD
	release
	end

Route117_PokemonDayCare_EventScript_1B2327:: @ 81B2327
	lock
	faceplayer
	specialval RESULT, 182
	compare RESULT, 1
	jumpeq Route117_PokemonDayCare_EventScript_1B2407
	compare RESULT, 2
	jumpeq Route117_PokemonDayCare_EventScript_1B242B
	compare RESULT, 3
	jumpeq Route117_PokemonDayCare_EventScript_1B2558
	msgbox Route117_PokemonDayCare_Text_1B28F2, 5
	compare RESULT, 1
	jumpeq Route117_PokemonDayCare_EventScript_1B236C
	msgbox Route117_PokemonDayCare_Text_1B2A14, 4
	release
	end

Route117_PokemonDayCare_EventScript_1B236C:: @ 81B236C
	specialval RESULT, 132
	compare RESULT, 1
	jumpeq Route117_PokemonDayCare_EventScript_1B23F3
	msgbox Route117_PokemonDayCare_Text_1B2947, 4
	fadescreen 1
	special 188
	waitstate
	compare 0x8004, 255
	jumpeq Route117_PokemonDayCare_EventScript_1B23D0
	specialval RESULT, 133
	compare RESULT, 0
	jumpeq Route117_PokemonDayCare_EventScript_1B23FD
	specialval 0x8005, 186
	checksound
	pokecry 0x8005, 0
	msgbox Route117_PokemonDayCare_Text_1B296E, 4
	waitpokecry
	special 187
	inccounter 47
	specialval RESULT, 182
	compare RESULT, 2
	jumpeq Route117_PokemonDayCare_EventScript_1B23DA
	release
	end

Route117_PokemonDayCare_EventScript_1B23D0:: @ 81B23D0
	msgbox Route117_PokemonDayCare_Text_1B2A76, 4
	release
	end

Route117_PokemonDayCare_EventScript_1B23DA:: @ 81B23DA
	msgbox Route117_PokemonDayCare_Text_1B29AD, 5
	compare RESULT, 1
	jumpeq Route117_PokemonDayCare_EventScript_1B236C
	jump Route117_PokemonDayCare_EventScript_1B23D0
	end

Route117_PokemonDayCare_EventScript_1B23F3:: @ 81B23F3
	msgbox Route117_PokemonDayCare_Text_1B2BBB, 4
	release
	end

Route117_PokemonDayCare_EventScript_1B23FD:: @ 81B23FD
	msgbox Route117_PokemonDayCare_Text_1B2C17, 4
	release
	end

Route117_PokemonDayCare_EventScript_1B2407:: @ 81B2407
	msgbox Route117_PokemonDayCare_Text_1B29F4, 4
	release
	end

Route117_PokemonDayCare_EventScript_1B2411:: @ 81B2411
	msgbox Route117_PokemonDayCare_Text_1B2ACC, 4
	return

Route117_PokemonDayCare_EventScript_1B241A:: @ 81B241A
	specialval RESULT, 190
	compare RESULT, 0
	callif 5, Route117_PokemonDayCare_EventScript_1B2411
	return

Route117_PokemonDayCare_EventScript_1B242B:: @ 81B242B
	msgbox Route117_PokemonDayCare_Text_1B2A88, 4
	setvar 0x8004, 0
	call Route117_PokemonDayCare_EventScript_1B241A
	msgbox Route117_PokemonDayCare_Text_1B29AD, 5
	compare RESULT, 1
	jumpeq Route117_PokemonDayCare_EventScript_1B236C
	msgbox Route117_PokemonDayCare_Text_1B2BF6, 5
	compare RESULT, 1
	jumpeq Route117_PokemonDayCare_EventScript_1B2469
	jump Route117_PokemonDayCare_EventScript_1B23D0
	end

Route117_PokemonDayCare_EventScript_1B2469:: @ 81B2469
	specialval RESULT, 131
	compare RESULT, 6
	jumpeq Route117_PokemonDayCare_EventScript_1B2539
	specialval RESULT, 182
	setvar 0x8004, 0
	compare RESULT, 2
	jumpeq Route117_PokemonDayCare_EventScript_1B24A8
	special 189
	waitstate
	copyvar 0x8004, RESULT
	compare RESULT, 2
	jumpeq Route117_PokemonDayCare_EventScript_1B23D0
	jump Route117_PokemonDayCare_EventScript_1B24A8
	end

Route117_PokemonDayCare_EventScript_1B24A8:: @ 81B24A8
	special 191
	msgbox Route117_PokemonDayCare_Text_1B2B49, 5
	compare RESULT, 1
	jumpeq Route117_PokemonDayCare_EventScript_1B24C4
	jump Route117_PokemonDayCare_EventScript_1B23D0
	end

Route117_PokemonDayCare_EventScript_1B24C4:: @ 81B24C4
	specialval RESULT, 197
	compare RESULT, 1
	jumpeq Route117_PokemonDayCare_EventScript_1B24DE
	msgbox Route117_PokemonDayCare_Text_1B2A30, 4
	release
	end

Route117_PokemonDayCare_EventScript_1B24DE:: @ 81B24DE
	move 1, Route117_PokemonDayCare_Movement_1B2543
	waitmove 0
	specialval RESULT, 192
	special 198
	playsfx 95
	msgbox Route117_PokemonDayCare_Text_1B2B75, 4
	checksound
	pokecry RESULT, 0
	msgbox Route117_PokemonDayCare_Text_1B2B93, 4
	waitpokecry
	specialval RESULT, 182
	compare RESULT, 2
	jumpeq Route117_PokemonDayCare_EventScript_1B2520
	jump Route117_PokemonDayCare_EventScript_1B23D0
	end

Route117_PokemonDayCare_EventScript_1B2520:: @ 81B2520
	msgbox Route117_PokemonDayCare_Text_1B2A4F, 5
	compare RESULT, 1
	jumpeq Route117_PokemonDayCare_EventScript_1B2469
	jump Route117_PokemonDayCare_EventScript_1B23D0
	end

Route117_PokemonDayCare_EventScript_1B2539:: @ 81B2539
	msgbox Route117_PokemonDayCare_Text_1B2AEF, 4
	release
	end

Route117_PokemonDayCare_Movement_1B2543:: @ 81B2543
	step_14
	step_14
	step_02
	step_14
	step_14
	step_03
	step_14
	step_14
	step_01
	slow_step_up
	step_54
	step_14
	step_14
	step_14
	step_14
	step_14
	step_00
	step_55
	slow_step_down
	step_end

	.incbin "baserom.gba", 0x1b2557, 0x1

Route117_PokemonDayCare_EventScript_1B2558:: @ 81B2558
	msgbox Route117_PokemonDayCare_Text_1B2A88, 4
	setvar 0x8004, 0
	call Route117_PokemonDayCare_EventScript_1B241A
	setvar 0x8004, 1
	call Route117_PokemonDayCare_EventScript_1B241A
	msgbox Route117_PokemonDayCare_Text_1B2BF6, 5
	compare RESULT, 1
	jumpeq Route117_PokemonDayCare_EventScript_1B2469
	msgbox Route117_PokemonDayCare_Text_1B2A76, 4
	release
	end

	.incbin "baserom.gba", 0x1b2591, 0x2b

	.global gUnknown_081B25BC
gUnknown_081B25BC: @ 81B25BC

	.incbin "baserom.gba", 0x1b25bc, 0xf

Route117_Text_1B25CB:: @ 81B25CB
	.string "I’m the DAY-CARE MAN.\p"
	.string "I help take care of the precious\n"
	.string "POKéMON of TRAINERS.\p"
	.string "If you’d like me to raise your POKéMON,\n"
	.string "have a word with my wife.$"

Route117_Text_1B2659:: @ 81B2659
	.string "Ah, it’s you!\p"
	.string "We were raising your POKéMON, and my\n"
	.string "goodness, were we surprised!\p"
	.string "Your POKéMON had an EGG!\p"
	.string "We don’t know how it got there,\n"
	.string "but your POKéMON had it.\p"
	.string "You do want it, yes?$"

Route117_Text_1B2710:: @ 81B2710
	.string "Ah, it’s you! Good to see you.\n"
	.string "Your {STR_VAR_1}’s doing fine.$"

Route117_Text_1B2745:: @ 81B2745
	.string "Well then, I’ll keep it.\n"
	.string "Thanks!$"

Route117_Text_1B2766:: @ 81B2766
	.string "You have no room for it...\n"
	.string "Come back when you’ve made room.$"

Route117_Text_1B27A2:: @ 81B27A2
	.string "{PLAYER} received the EGG from\n"
	.string "the DAY-CARE MAN.$"

Route117_Text_1B27CD:: @ 81B27CD
	.string "Take good care of it.$"

Route117_Text_1B27E3:: @ 81B27E3
	.string "By the way, about your {STR_VAR_1},\n"
	.string "it seemed to be friendly with\l"
	.string "{STR_VAR_2}’s {STR_VAR_3}.\p"
	.string "I may even have seen it receiving\n"
	.string "a piece of MAIL.$"

	.incbin "baserom.gba", 0x1b2858, 0x3f

Route117_Text_1B2897:: @ 81B2897
	.string "Ah, it’s you! Your {STR_VAR_1} and\n"
	.string "{STR_VAR_2} are doing fine.$"

Route117_Text_1B28C4:: @ 81B28C4
	.string "I really will keep it.\n"
	.string "You do want this, yes?$"

	.include "data/maps/text/Route117_PokemonDayCare.s"
MtChimney_EventScript_1B2C95:: @ 81B2C95
	lock
	faceplayer
	checkflag 219
	callif 0, MtChimney_EventScript_1B2CB9
	checkflag 219
	callif 1, MtChimney_EventScript_1B2CC2
	closebutton
	move 1, MtChimney_Movement_1A083D
	waitmove 0
	setflag 219
	release
	end

MtChimney_EventScript_1B2CB9:: @ 81B2CB9
	msgbox MtChimney_Text_1B3EC1, 4
	return

MtChimney_EventScript_1B2CC2:: @ 81B2CC2
	msgbox MtChimney_Text_1B3F8C, 4
	return

MtChimney_EventScript_1B2CCB:: @ 81B2CCB
	lockall
	msgbox MtChimney_Text_1B37BB, 4
	move 2, MtChimney_Movement_1A0839
	waitmove 0
	playsfx 21
	move 2, MtChimney_Movement_1A0833
	waitmove 0
	move 2, MtChimney_Movement_1A0835
	waitmove 0
	msgbox MtChimney_Text_1B38B3, 4
	trainerbattle 3, 602, 0, MtChimney_Text_1B3A68
	msgbox MtChimney_Text_1B3A90, 4
	closebutton
	pause 30
	fadescreen 1
	disappear 2
	disappear 3
	disappear 22
	setflag 926
	fadescreen 0
	movespriteperm 1, 10, 12
	reappear 1
	compare FACING, 4
	callif 1, MtChimney_EventScript_1B2D7D
	compare FACING, 2
	callif 1, MtChimney_EventScript_1B2D88
	move 255, MtChimney_Movement_1A083F
	waitmove 0
	msgbox MtChimney_Text_1B3FFE, 4
	closebutton
	compare FACING, 4
	callif 1, MtChimney_EventScript_1B2D93
	compare FACING, 2
	callif 1, MtChimney_EventScript_1B2D9E
	disappear 1
	setflag 927
	setflag 139
	clearflag 928
	setflag 942
	releaseall
	end

MtChimney_EventScript_1B2D7D:: @ 81B2D7D
	move 1, MtChimney_Movement_15D025
	waitmove 0
	return

MtChimney_EventScript_1B2D88:: @ 81B2D88
	move 1, MtChimney_Movement_15D036
	waitmove 0
	return

MtChimney_EventScript_1B2D93:: @ 81B2D93
	move 1, MtChimney_Movement_15D02D
	waitmove 0
	return

MtChimney_EventScript_1B2D9E:: @ 81B2D9E
	move 1, MtChimney_Movement_15D03E
	waitmove 0
	return

MtPyre_Summit_EventScript_1B2DA9:: @ 81B2DA9
	trainerbattle 0, 588, 0, MtPyre_Summit_Text_1B5CFD, MtPyre_Summit_Text_1B5D30
	msgbox MtPyre_Summit_Text_1B5D6D, 6
	end

MtPyre_Summit_EventScript_1B2DC0:: @ 81B2DC0
	trainerbattle 0, 589, 0, MtPyre_Summit_Text_1B5DA2, MtPyre_Summit_Text_1B5DDB
	msgbox MtPyre_Summit_Text_1B5DF1, 6
	end

MtPyre_Summit_EventScript_1B2DD7:: @ 81B2DD7
	trainerbattle 0, 590, 0, MtPyre_Summit_Text_1B5E27, MtPyre_Summit_Text_1B5E60
	msgbox MtPyre_Summit_Text_1B5E84, 6
	end

	.incbin "baserom.gba", 0x1b2dee, 0x9cd

MtChimney_Text_1B37BB:: @ 81B37BB
	.string "The power contained in the METEORITE...\p"
	.string "By amplifying its power with this\n"
	.string "machine, MT. CHIMNEY’s volcanic activity\l"
	.string "will instantly intensify...\p"
	.string "Fufufu... The volcano will erupt, spewing\n"
	.string "lava that will cool and harden.\l"
	.string "It will expand the landmass...$"

MtChimney_Text_1B38B3:: @ 81B38B3
	.string "MAXIE: You again...\p"
	.string "Now listen.\n"
	.string "We humans have grown on dry land.\p"
	.string "The land is everything!\n"
	.string "Its importance is paramount!\p"
	.string "That is why we of TEAM MAGMA are\n"
	.string "committed to expanding the landmass.\p"
	.string "It will create space for new species\n"
	.string "of POKéMON to evolve.\p"
	.string "It will give us humans more space to\n"
	.string "advance.\p"
	.string "That is TEAM MAGMA’s vision!\p"
	.string "I can’t allow an ignorant child like\n"
	.string "you to get in our way.\p"
	.string "I, MAXIE, will show you the\n"
	.string "consequences of meddling!$"

MtChimney_Text_1B3A68:: @ 81B3A68
	.string "What?!\p"
	.string "I, MAXIE, was caught off guard?!$"

MtChimney_Text_1B3A90:: @ 81B3A90
	.string "MAXIE: Ah, whatever.\n"
	.string "I will give up our plans for MT. CHIMNEY\l"
	.string "for the time being...\p"
	.string "But no one can ever stop us!\n"
	.string "TEAM MAGMA will prevail!\p"
	.string "Don’t you ever forget that!$"

MtChimney_Text_1B3B36:: @ 81B3B36
	.string "Hehehe!\p"
	.string "So you’ve come all the way here!\p"
	.string "But you’re too late!\n"
	.string "I’ve already delivered the METEORITE\l"
	.string "from METEOR FALLS to the BOSS!$"

MtChimney_Text_1B3BB8:: @ 81B3BB8
	.string "Hehehe...\n"
	.string "So I lost...\p"
	.string "I’m sure glad I never took you on back\n"
	.string "at METEOR FALLS.$"

MtChimney_Text_1B3C07:: @ 81B3C07
	.string "Hehehe!\p"
	.string "You might have beaten me, but you don’t\n"
	.string "stand a chance against the BOSS!\p"
	.string "If you get lost now, you won’t have to\n"
	.string "face a sound whipping!$"

MtChimney_Text_1B3C96:: @ 81B3C96
	.string "We of TEAM MAGMA are working hard for\n"
	.string "everyone’s sake.\p"
	.string "Like, if there’s more land, there’d be\n"
	.string "more places to live.\l"
	.string "Everyone’d be happy!$"

MtChimney_Text_1B3D1E:: @ 81B3D1E
	.string "Hunh?\n"
	.string "What do you mean I lost?$"

MtChimney_Text_1B3D3D:: @ 81B3D3D
	.string "Our BOSS says, “It will make everyone\n"
	.string "happy.”\p"
	.string "But why does everyone keep getting\n"
	.string "in our way?$"

MtChimney_Text_1B3D9A:: @ 81B3D9A
	.string "That annoying TEAM AQUA...\n"
	.string "They always mess with our plans!$"

	.incbin "baserom.gba", 0x1b3dd6, 0x1f

MtChimney_Text_1B3DF5:: @ 81B3DF5
	.string "Go! Stomp TEAM AQUA!\n"
	.string "And expand the land!$"

MtChimney_Text_1B3E1F:: @ 81B3E1F
	.string "Stay out of our way, okay?\p"
	.string "We’re trying to enlarge the landmass\n"
	.string "for the good of everybody!$"

MtChimney_Text_1B3E7A:: @ 81B3E7A
	.string "Yeah!\n"
	.string "Douse them in fire!$"

	.incbin "baserom.gba", 0x1b3e94, 0x26

MtChimney_Text_1B3EBA:: @ 81B3EBA
	.string "Bufoh!$"

MtChimney_Text_1B3EC1:: @ 81B3EC1
	.string "ARCHIE: Oh, {PLAYER}{KUN}!\p"
	.string "Please, you must stop TEAM MAGMA\n"
	.string "for me!\p"
	.string "They’re trying to make this volcano\n"
	.string "erupt by using the stolen METEORITE’s\l"
	.string "power!\p"
	.string "It’s all a part of their plans to\n"
	.string "expand the world’s landmass!$"

MtChimney_Text_1B3F8C:: @ 81B3F8C
	.string "ARCHIE: {PLAYER}{KUN}!\p"
	.string "Please, you’ve got to stop TEAM MAGMA\n"
	.string "for me!\p"
	.string "Dealing with these three thugs is\n"
	.string "a lot, even for me!$"

MtChimney_Text_1B3FFE:: @ 81B3FFE
	.string "ARCHIE: {PLAYER}{KUN}! Thank you!\p"
	.string "With your help, we thwarted TEAM\n"
	.string "MAGMA’s destructive plan!\p"
	.string "But... This victory doesn’t mean the\n"
	.string "end of their evil plans.\p"
	.string "We will remain vigilant and keep up\n"
	.string "our pursuit of TEAM MAGMA.\p"
	.string "{PLAYER}{KUN}, we shall meet again!$"

MtChimney_Text_1B40EA:: @ 81B40EA
	.string "Darn... TEAM MAGMA outnumbers us!\n"
	.string "We can’t keep up with them!$"

MtChimney_Text_1B4128:: @ 81B4128
	.string "If they expand the land, there’ll be\n"
	.string "less habitats for WATER POKéMON!$"

MtChimney_Text_1B416E:: @ 81B416E
	.string "TEAM MAGMA wants to expand the\n"
	.string "landmass... How’s that for insane?$"

MtChimney_Text_1B41B0:: @ 81B41B0
	.string "Bushaa!$"

	.incbin "baserom.gba", 0x1b41b8, 0x698

	.include "data/maps/text/SeafloorCavern_Room9.s"
	.include "data/maps/text/CaveOfOrigin_B4F.s"
	.include "data/maps/text/MtPyre_Summit.s"
	.global gUnknown_081B694A
gUnknown_081B694A: @ 81B694A

	.incbin "baserom.gba", 0x1b694a, 0x6

LittlerootTown_BrendansHouse_2F_EventScript_1B6950:: @ 81B6950
LittlerootTown_MaysHouse_2F_EventScript_1B6950:: @ 81B6950
	setvar 0x4092, 5
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6956:: @ 81B6956
LittlerootTown_MaysHouse_1F_EventScript_1B6956:: @ 81B6956
	msgbox LittlerootTown_BrendansHouse_1F_Text_172429, 4
	move 0x8004, LittlerootTown_BrendansHouse_1F_Movement_1A0839
	waitmove 0
	compare 0x8005, 0
	callif 1, LittlerootTown_BrendansHouse_1F_EventScript_1B699F
	compare 0x8005, 1
	callif 1, LittlerootTown_BrendansHouse_1F_EventScript_1B69AA
	msgbox LittlerootTown_BrendansHouse_1F_Text_172453, 4
	closebutton
	setvar 0x4092, 4
	move 255, LittlerootTown_BrendansHouse_1F_Movement_1B69B5
	move 0x8004, LittlerootTown_BrendansHouse_1F_Movement_1A0841
	waitmove 0
	releaseall
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B699F:: @ 81B699F
	move 255, LittlerootTown_BrendansHouse_1F_Movement_1A0843
	waitmove 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B69AA:: @ 81B69AA
	move 255, LittlerootTown_BrendansHouse_1F_Movement_1A083F
	waitmove 0
	return

LittlerootTown_BrendansHouse_1F_Movement_1B69B5:: @ 81B69B5
	step_up
	step_end

LittlerootTown_BrendansHouse_1F_EventScript_1B69B7:: @ 81B69B7
LittlerootTown_MaysHouse_1F_EventScript_1B69B7:: @ 81B69B7
	msgbox LittlerootTown_BrendansHouse_1F_Text_172531, 4
	closebutton
	move 0x8004, LittlerootTown_BrendansHouse_1F_Movement_1A0841
	move 255, LittlerootTown_BrendansHouse_1F_Movement_1B6CDC
	waitmove 0
	releaseall
	end

LittlerootTown_BrendansHouse_2F_EventScript_1B69D3:: @ 81B69D3
	lockall
	setvar 0x8004, 0
	jump LittlerootTown_BrendansHouse_2F_EventScript_1B69EB
	end

LittlerootTown_MaysHouse_2F_EventScript_1B69DF:: @ 81B69DF
	lockall
	setvar 0x8004, 1
	jump LittlerootTown_MaysHouse_2F_EventScript_1B69EB
	end

LittlerootTown_BrendansHouse_2F_EventScript_1B69EB:: @ 81B69EB
LittlerootTown_MaysHouse_2F_EventScript_1B69EB:: @ 81B69EB
	checkflag 81
	jumpeq LittlerootTown_BrendansHouse_2F_EventScript_1B6A91
	msgbox LittlerootTown_BrendansHouse_2F_Text_172E18, 4
	call LittlerootTown_BrendansHouse_2F_EventScript_1B6A9B
	pause 30
	setvar 0x4092, 6
	setflag 81
	setflag 754
	setflag 755
	checkgender
	compare RESULT, 0
	callif 1, LittlerootTown_BrendansHouse_2F_EventScript_1B6A31
	compare RESULT, 1
	callif 1, LittlerootTown_BrendansHouse_2F_EventScript_1B6A61
	playsfx 9
	disappear 0x8008
	releaseall
	end

LittlerootTown_BrendansHouse_2F_EventScript_1B6A31:: @ 81B6A31
	setvar 0x8008, 14
	reappear 0x8008
	move 0x8008, LittlerootTown_BrendansHouse_2F_Movement_1B6AA2
	waitmove 0
	move 255, LittlerootTown_BrendansHouse_2F_Movement_1A0843
	waitmove 0
	msgbox LittlerootTown_BrendansHouse_2F_Text_172E4C, 4
	closebutton
	move 0x8008, LittlerootTown_BrendansHouse_2F_Movement_1B6AA9
	waitmove 0
	return

LittlerootTown_BrendansHouse_2F_EventScript_1B6A61:: @ 81B6A61
	setvar 0x8008, 14
	reappear 0x8008
	move 0x8008, LittlerootTown_BrendansHouse_2F_Movement_1B6AAD
	waitmove 0
	move 255, LittlerootTown_BrendansHouse_2F_Movement_1A083F
	waitmove 0
	msgbox LittlerootTown_BrendansHouse_2F_Text_172E4C, 4
	closebutton
	move 0x8008, LittlerootTown_BrendansHouse_2F_Movement_1B6AB4
	waitmove 0
	return

LittlerootTown_BrendansHouse_2F_EventScript_1B6A91:: @ 81B6A91
	inccounter 45
	fadescreen 1
	special 155
	waitstate
	releaseall
	end

LittlerootTown_BrendansHouse_2F_EventScript_1B6A9B:: @ 81B6A9B
	fadescreen 1
	special 154
	waitstate
	return

LittlerootTown_BrendansHouse_2F_Movement_1B6AA2:: @ 81B6AA2
	step_13
	step_down
	step_27
	step_14
	step_13
	step_left
	step_end

LittlerootTown_BrendansHouse_2F_Movement_1B6AA9:: @ 81B6AA9
	step_right
	step_up
	step_13
	step_end

LittlerootTown_BrendansHouse_2F_Movement_1B6AAD:: @ 81B6AAD
	step_13
	step_down
	step_28
	step_14
	step_13
	step_right
	step_end

LittlerootTown_BrendansHouse_2F_Movement_1B6AB4:: @ 81B6AB4
	step_left
	step_up
	step_13
	step_end

LittlerootTown_BrendansHouse_1F_EventScript_1B6AB8:: @ 81B6AB8
LittlerootTown_MaysHouse_1F_EventScript_1B6AB8:: @ 81B6AB8
	setvar 0x4092, 7
	releaseall
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6ABF:: @ 81B6ABF
	move 0x8005, LittlerootTown_BrendansHouse_1F_Movement_1A0843
	waitmove 0
	call LittlerootTown_BrendansHouse_1F_EventScript_1B6B9D
	move 255, LittlerootTown_BrendansHouse_1F_Movement_1B6CCC
	waitmove 0
	playmusic 453, 0
	msgbox LittlerootTown_BrendansHouse_1F_Text_1725C9, 4
	closebutton
	move 0x8005, LittlerootTown_BrendansHouse_1F_Movement_1B6BDB
	waitmove 0
	move 255, LittlerootTown_BrendansHouse_1F_Movement_1B6CD2
	waitmove 0
	call LittlerootTown_BrendansHouse_1F_EventScript_1B6BBE
	move 255, LittlerootTown_BrendansHouse_1F_Movement_1A083F
	waitmove 0
	msgbox LittlerootTown_BrendansHouse_1F_Text_1725FE, 4
	msgbox LittlerootTown_BrendansHouse_1F_Text_172644, 4
	closebutton
	setvar 0x4001, 1
	move 0x8005, LittlerootTown_BrendansHouse_1F_Movement_1B6BE1
	waitmove 0
	jump LittlerootTown_BrendansHouse_1F_EventScript_1B6AB8
	end

LittlerootTown_MaysHouse_1F_EventScript_1B6B2E:: @ 81B6B2E
	move 0x8005, LittlerootTown_MaysHouse_1F_Movement_1A083F
	waitmove 0
	call LittlerootTown_MaysHouse_1F_EventScript_1B6B9D
	move 255, LittlerootTown_MaysHouse_1F_Movement_1B6CD4
	waitmove 0
	playmusic 453, 0
	msgbox LittlerootTown_MaysHouse_1F_Text_1725C9, 4
	closebutton
	move 0x8005, LittlerootTown_MaysHouse_1F_Movement_1B6BDE
	waitmove 0
	move 255, LittlerootTown_MaysHouse_1F_Movement_1B6CDA
	waitmove 0
	call LittlerootTown_MaysHouse_1F_EventScript_1B6BBE
	move 255, LittlerootTown_MaysHouse_1F_Movement_1A0843
	waitmove 0
	msgbox LittlerootTown_MaysHouse_1F_Text_1725FE, 4
	msgbox LittlerootTown_MaysHouse_1F_Text_172644, 4
	closebutton
	setvar 0x4001, 1
	move 0x8005, LittlerootTown_MaysHouse_1F_Movement_1B6BE5
	waitmove 0
	jump LittlerootTown_MaysHouse_1F_EventScript_1B6AB8
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6B9D:: @ 81B6B9D
LittlerootTown_MaysHouse_1F_EventScript_1B6B9D:: @ 81B6B9D
	playsfx 21
	move 0x8005, LittlerootTown_BrendansHouse_1F_Movement_1A0833
	waitmove 0
	move 0x8005, LittlerootTown_BrendansHouse_1F_Movement_1A0835
	waitmove 0
	msgbox LittlerootTown_BrendansHouse_1F_Text_1725A3, 4
	closebutton
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6BBE:: @ 81B6BBE
LittlerootTown_MaysHouse_1F_EventScript_1B6BBE:: @ 81B6BBE
	move 255, LittlerootTown_BrendansHouse_1F_Movement_1A0841
	waitmove 0
	msgbox LittlerootTown_BrendansHouse_1F_Text_172841, 4
	fadedefault
	special 62
	setflag 2096
	pause 35
	return

LittlerootTown_BrendansHouse_1F_Movement_1B6BDB:: @ 81B6BDB
	step_left
	step_28
	step_end

LittlerootTown_MaysHouse_1F_Movement_1B6BDE:: @ 81B6BDE
	step_right
	step_27
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6BE1:: @ 81B6BE1
	step_left
	step_down
	step_28
	step_end

LittlerootTown_MaysHouse_1F_Movement_1B6BE5:: @ 81B6BE5
	step_right
	step_down
	step_27
	step_end

LittlerootTown_BrendansHouse_1F_EventScript_1B6BE9:: @ 81B6BE9
LittlerootTown_MaysHouse_1F_EventScript_1B6BE9:: @ 81B6BE9
	lock
	faceplayer
	compare 0x4082, 4
	jumpeq LittlerootTown_BrendansHouse_1F_EventScript_1B6C33
	compare 0x408c, 4
	jumpeq LittlerootTown_BrendansHouse_1F_EventScript_1B6C33
	checkflag 2059
	jumpeq LittlerootTown_BrendansHouse_1F_EventScript_1B6C3D
	checkflag 82
	jumpeq LittlerootTown_BrendansHouse_1F_EventScript_1B6C72
	compare 0x4001, 1
	jumpeq LittlerootTown_BrendansHouse_1F_EventScript_1B6C80
	compare 0x4092, 7
	jumpif 4, LittlerootTown_BrendansHouse_1F_EventScript_1B6C9C
	msgbox LittlerootTown_BrendansHouse_1F_Text_172429, 4
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6C33:: @ 81B6C33
	msgbox LittlerootTown_BrendansHouse_1F_Text_172BBC, 4
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6C3D:: @ 81B6C3D
	checkflag 133
	jumpeq LittlerootTown_BrendansHouse_1F_EventScript_1B6C72
	msgbox LittlerootTown_BrendansHouse_1F_Text_172782, 4
	giveitem ITEM_AMULET_COIN
	compare RESULT, 0
	jumpeq LittlerootTown_BrendansHouse_1F_EventScript_1A029B
	msgbox LittlerootTown_BrendansHouse_1F_Text_1727CD, 4
	setflag 133
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6C72:: @ 81B6C72
	msgbox LittlerootTown_BrendansHouse_1F_Text_172717, 4
	jump LittlerootTown_BrendansHouse_1F_EventScript_1B6C8A
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6C80:: @ 81B6C80
	msgbox LittlerootTown_BrendansHouse_1F_Text_1726D2, 4
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6C8A:: @ 81B6C8A
	closebutton
	call LittlerootTown_BrendansHouse_1F_EventScript_1A02CA
	inccounter 16
	msgbox LittlerootTown_BrendansHouse_1F_Text_17276B, 4
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6C9C:: @ 81B6C9C
	msgbox LittlerootTown_BrendansHouse_1F_Text_1726E7, 4
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6CA6:: @ 81B6CA6
LittlerootTown_MaysHouse_1F_EventScript_1B6CA6:: @ 81B6CA6
	lock
	faceplayer
	checksound
	pokecry SPECIES_MACHOKE, 0
	msgbox LittlerootTown_BrendansHouse_1F_Text_17281D, 4
	waitpokecry
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6CB9:: @ 81B6CB9
LittlerootTown_MaysHouse_1F_EventScript_1B6CB9:: @ 81B6CB9
	lock
	faceplayer
	checksound
	pokecry SPECIES_MACHOKE, 0
	msgbox LittlerootTown_BrendansHouse_1F_Text_172831, 4
	waitpokecry
	release
	end

LittlerootTown_BrendansHouse_1F_Movement_1B6CCC:: @ 81B6CCC
	step_down
	step_down
	step_left
	step_left
	step_left
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6CD2:: @ 81B6CD2
	step_left
	step_end

LittlerootTown_MaysHouse_1F_Movement_1B6CD4:: @ 81B6CD4
	step_down
	step_down
	step_right
	step_right
	step_right
	step_end

LittlerootTown_MaysHouse_1F_Movement_1B6CDA:: @ 81B6CDA
	step_right
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6CDC:: @ 81B6CDC
	step_up
	step_end

LittlerootTown_BrendansHouse_1F_EventScript_1B6CDE:: @ 81B6CDE
LittlerootTown_MaysHouse_1F_EventScript_1B6CDE:: @ 81B6CDE
	lockall
	checkgender
	compare RESULT, 0
	callif 1, LittlerootTown_BrendansHouse_1F_EventScript_1B6DAD
	compare RESULT, 1
	callif 1, LittlerootTown_BrendansHouse_1F_EventScript_1B6DBD
	compare 0x8008, 0
	callif 1, LittlerootTown_BrendansHouse_1F_EventScript_1B6E1D
	compare 0x8008, 1
	callif 1, LittlerootTown_BrendansHouse_1F_EventScript_1B6E28
	move 0x8009, LittlerootTown_BrendansHouse_1F_Movement_1A0839
	waitmove 0
	playsfx 21
	move 0x8009, LittlerootTown_BrendansHouse_1F_Movement_1A0833
	waitmove 0
	move 0x8009, LittlerootTown_BrendansHouse_1F_Movement_1A0835
	waitmove 0
	pause 20
	compare 0x8008, 0
	callif 1, LittlerootTown_BrendansHouse_1F_EventScript_1B6DCD
	compare 0x8008, 1
	callif 1, LittlerootTown_BrendansHouse_1F_EventScript_1B6DD8
	msgbox LittlerootTown_BrendansHouse_1F_Text_17298B, 4
	giveitem ITEM_SS_TICKET
	msgbox LittlerootTown_BrendansHouse_1F_Text_172A7D, 4
	closebutton
	compare 0x8008, 0
	callif 1, LittlerootTown_BrendansHouse_1F_EventScript_1B6DE3
	compare 0x8008, 1
	callif 1, LittlerootTown_BrendansHouse_1F_EventScript_1B6DEE
	msgbox LittlerootTown_BrendansHouse_1F_Text_172B5E, 4
	closebutton
	compare 0x8008, 0
	callif 1, LittlerootTown_BrendansHouse_1F_EventScript_1B6DF9
	compare 0x8008, 1
	callif 1, LittlerootTown_BrendansHouse_1F_EventScript_1B6E0B
	playsfx 8
	disappear 0x8009
	setflag 291
	setvar 0x4082, 4
	setvar 0x408c, 4
	releaseall
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6DAD:: @ 81B6DAD
	setvar 0x8008, 0
	setvar 0x8009, 5
	setvar 0x800a, 1
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6DBD:: @ 81B6DBD
	setvar 0x8008, 1
	setvar 0x8009, 5
	setvar 0x800a, 1
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6DCD:: @ 81B6DCD
	move 0x8009, LittlerootTown_BrendansHouse_1F_Movement_1B6E33
	waitmove 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6DD8:: @ 81B6DD8
	move 0x8009, LittlerootTown_BrendansHouse_1F_Movement_1B6E36
	waitmove 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6DE3:: @ 81B6DE3
	move 0x8009, LittlerootTown_BrendansHouse_1F_Movement_1B6E39
	waitmove 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6DEE:: @ 81B6DEE
	move 0x8009, LittlerootTown_BrendansHouse_1F_Movement_1B6E3B
	waitmove 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6DF9:: @ 81B6DF9
	move 255, LittlerootTown_BrendansHouse_1F_Movement_1B6E4F
	move 0x8009, LittlerootTown_BrendansHouse_1F_Movement_1B6E3D
	waitmove 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6E0B:: @ 81B6E0B
	move 255, LittlerootTown_BrendansHouse_1F_Movement_1B6E4F
	move 0x8009, LittlerootTown_BrendansHouse_1F_Movement_1B6E43
	waitmove 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6E1D:: @ 81B6E1D
	move 255, LittlerootTown_BrendansHouse_1F_Movement_1B6E49
	waitmove 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6E28:: @ 81B6E28
	move 255, LittlerootTown_BrendansHouse_1F_Movement_1B6E54
	waitmove 0
	return

LittlerootTown_BrendansHouse_1F_Movement_1B6E33:: @ 81B6E33
	step_right
	step_right
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E36:: @ 81B6E36
	step_left
	step_left
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E39:: @ 81B6E39
	step_left
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E3B:: @ 81B6E3B
	step_right
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E3D:: @ 81B6E3D
	step_down
	step_right
	step_right
	step_down
	step_13
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E43:: @ 81B6E43
	step_down
	step_left
	step_left
	step_down
	step_13
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E49:: @ 81B6E49
	step_14
	step_down
	step_down
	step_down
	step_27
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E4F:: @ 81B6E4F
	step_14
	step_14
	step_14
	step_25
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E54:: @ 81B6E54
	step_14
	step_down
	step_down
	step_down
	step_28
	step_end

	.global gUnknown_081B6E5A
gUnknown_081B6E5A: @ 81B6E5A

	.incbin "baserom.gba", 0x1b6e5a, 0x9

FallarborTown_ContestLobby_Text_1B6E63:: @ 81B6E63
	.string "Oh? Did you want to make some {POKEBLOCK}S\n"
	.string "with this old-timer?$"

FallarborTown_ContestLobby_Text_1B6E9D:: @ 81B6E9D
	.string "Excellent!$"

FallarborTown_ContestLobby_Text_1B6EA8:: @ 81B6EA8
	.string "Oh...\n"
	.string "You’ve made this old-timer sad...$"

FallarborTown_ContestLobby_Text_1B6ED0:: @ 81B6ED0
	.string "Do you know how to make a {POKEBLOCK}?$"

FallarborTown_ContestLobby_Text_1B6EF1:: @ 81B6EF1
	.string "Let’s get started, then!\p"
	.string "Let’s BERRY BLENDER!$"

FallarborTown_ContestLobby_Text_1B6F1F:: @ 81B6F1F
	.string "Okay, a little explanation, then.\p"
	.string "Oh, don’t worry, it’s quite simple.\p"
	.string "When the BLENDER’s arrow comes to\n"
	.string "your marker, just press the A Button.\p"
	.string "That’s all you have to do.\n"
	.string "You’ll see how easy it is when you try.$"

FallarborTown_ContestLobby_Text_1B6FF0:: @ 81B6FF0
	.string "Oh?\n"
	.string "You don’t have any BERRIES?\p"
	.string "If you don’t have any BERRIES,\n"
	.string "you can’t make any {POKEBLOCK}S.$"

FallarborTown_ContestLobby_Text_1B704A:: @ 81B704A
	.string "Well, that won’t do at all now, will it?\p"
	.string "If you don’t mind leftovers, you can\n"
	.string "have one of my BERRIES.\p"
	.string "That way, we could make some {POKEBLOCK}S\n"
	.string "together using the BERRY BLENDER.$"

FallarborTown_ContestLobby_Text_1B70F6:: @ 81B70F6
	.string "If I had some BERRIES left over,\n"
	.string "I’d gladly give you one...\p"
	.string "But, I don’t have any to spare today.\n"
	.string "We’ll have to do this another time.$"

FallarborTown_ContestLobby_Text_1B717C:: @ 81B717C
	.string "But your {POKEBLOCK} CASE is full.\p"
	.string "You should use some {POKEBLOCK}S before\n"
	.string "you come see me again.$"

FallarborTown_ContestLobby_Text_1B71D2:: @ 81B71D2
	.string "But you don’t have a {POKEBLOCK} CASE.\p"
	.string "You should get a {POKEBLOCK} CASE and then\n"
	.string "come see me.$"

LilycoveCity_ContestLobby_Text_1B7225:: @ 81B7225
SlateportCity_ContestLobby_Text_1B7225:: @ 81B7225
	.string "Let’s get blending already!$"

LilycoveCity_ContestLobby_Text_1B7241:: @ 81B7241
	.string "I wonder what kind of {POKEBLOCK} I’ll get?\n"
	.string "This is so exciting!$"

FallarborTown_ContestLobby_Text_1B727C:: @ 81B727C
	.string "{POKEBLOCK}S will be made with your friends \n"
	.string "from BERRIES in the BERRY BLENDER.\p"
	.string "Is it okay to save the game before\n"
	.string "linking with your friends?$"

FallarborTown_ContestLobby_Text_1B7304:: @ 81B7304
	.string "Searching for your friends...\n"
	.string "... ... B Button: Cancel$"

FallarborTown_ContestLobby_Text_1B733B:: @ 81B733B
	.string "{STR_VAR_1} arrived.$"

FallarborTown_ContestLobby_Text_1B7347:: @ 81B7347
	.string "{STR_VAR_1} and {STR_VAR_2} arrived.$"

FallarborTown_ContestLobby_Text_1B735A:: @ 81B735A
	.string "{STR_VAR_1}, {STR_VAR_2}, and\n"
	.string "{STR_VAR_3} arrived.$"

	.incbin "baserom.gba", 0x1b7372, 0xf

FallarborTown_ContestLobby_Text_1B7381:: @ 81B7381
	.string "You have no BERRIES.\n"
	.string "The BERRY BLENDER can’t be used.$"

FallarborTown_ContestLobby_Text_1B73B7:: @ 81B73B7
	.string "Your {POKEBLOCK} CASE is full.\n"
	.string "The BERRY BLENDER can’t be used.$"

FallarborTown_ContestLobby_Text_1B73F1:: @ 81B73F1
	.string "You don’t have a {POKEBLOCK} CASE.\n"
	.string "The BERRY BLENDER can’t be used.$"

FallarborTown_ContestLobby_Text_1B742F:: @ 81B742F
	.string "I love making {POKEBLOCK}S.\p"
	.string "I always have some BERRIES with me.$"

FallarborTown_ContestLobby_Text_1B7469:: @ 81B7469
	.string "If you’d like, we could make some\n"
	.string "{POKEBLOCK}S together using the\l"
	.string "BERRY BLENDER.$"

FallarborTown_ContestLobby_Text_1B74B4:: @ 81B74B4
	.string "Oh?\n"
	.string "You don’t have any BERRIES?\p"
	.string "Well, that won’t do at all now, will it?\p"
	.string "If you don’t mind leftovers, you can\n"
	.string "have one of my BERRIES.$"

FallarborTown_ContestLobby_Text_1B753A:: @ 81B753A
	.string "We’ll use it to make {POKEBLOCK}S together\n"
	.string "using the BERRY BLENDER.$"

FallarborTown_ContestLobby_Text_1B7578:: @ 81B7578
	.string "Oh?\n"
	.string "You don’t have any BERRIES?\p"
	.string "If I had some left over, I’d gladly\n"
	.string "give you one...\p"
	.string "But, I don’t have any to spare today.\n"
	.string "Sorry about that.$"

FallarborTown_ContestLobby_EventScript_1B7604:: @ 81B7604
	setvar 0x8008, 4
	setvar 0x8009, 1
	move 0x8008, FallarborTown_ContestLobby_Movement_1B7821
	waitmove 0
	jump FallarborTown_ContestLobby_EventScript_1B7681
	end

SlateportCity_ContestLobby_EventScript_1B761E:: @ 81B761E
	setvar 0x8008, 2
	setvar 0x8009, 2
	move 6, SlateportCity_ContestLobby_Movement_1A083D
	move 0x8008, SlateportCity_ContestLobby_Movement_1B7821
	waitmove 0
	jump SlateportCity_ContestLobby_EventScript_1B7681
	end

VerdanturfTown_ContestLobby_EventScript_1B763F:: @ 81B763F
	setvar 0x8008, 2
	setvar 0x8009, 1
	move 0x8008, VerdanturfTown_ContestLobby_Movement_1B7821
	waitmove 0
	jump VerdanturfTown_ContestLobby_EventScript_1B7681
	end

LilycoveCity_ContestLobby_EventScript_1B7659:: @ 81B7659
	setvar 0x8008, 3
	setvar 0x8009, 3
	move 9, LilycoveCity_ContestLobby_Movement_1A083D
	move 10, LilycoveCity_ContestLobby_Movement_1A083D
	move 0x8008, LilycoveCity_ContestLobby_Movement_1B7821
	waitmove 0
	jump LilycoveCity_ContestLobby_EventScript_1B7681
	end

FallarborTown_ContestLobby_EventScript_1B7681:: @ 81B7681
LilycoveCity_ContestLobby_EventScript_1B7681:: @ 81B7681
SlateportCity_ContestLobby_EventScript_1B7681:: @ 81B7681
VerdanturfTown_ContestLobby_EventScript_1B7681:: @ 81B7681
	lockall
	msgbox FallarborTown_ContestLobby_Text_1B6E63, 5
	compare RESULT, 1
	jumpeq FallarborTown_ContestLobby_EventScript_1B76A1
	compare RESULT, 0
	jumpeq FallarborTown_ContestLobby_EventScript_1B76E5
	end

FallarborTown_ContestLobby_EventScript_1B76A1:: @ 81B76A1
	checkitem ITEM_POKEBLOCK_CASE, 1
	compare RESULT, 0
	jumpeq FallarborTown_ContestLobby_EventScript_1B7780
	specialval RESULT, 49
	compare RESULT, 0
	jumpeq FallarborTown_ContestLobby_EventScript_1B770E
	msgbox FallarborTown_ContestLobby_Text_1B6E9D, 4
	specialval RESULT, 160
	compare RESULT, 65535
	jumpif 5, FallarborTown_ContestLobby_EventScript_1B76EF
	compare RESULT, 65535
	jumpeq FallarborTown_ContestLobby_EventScript_1B7776
	end

FallarborTown_ContestLobby_EventScript_1B76E5:: @ 81B76E5
	msgbox FallarborTown_ContestLobby_Text_1B6EA8, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B76EF:: @ 81B76EF
	msgbox FallarborTown_ContestLobby_Text_1B6ED0, 5
	compare RESULT, 1
	jumpeq FallarborTown_ContestLobby_EventScript_1B7734
	compare RESULT, 0
	jumpeq FallarborTown_ContestLobby_EventScript_1B7726
	end

FallarborTown_ContestLobby_EventScript_1B770E:: @ 81B770E
	msgbox FallarborTown_ContestLobby_Text_1B6FF0, 4
	checkdailyflags
	checkflag 2241
	jumpeq FallarborTown_ContestLobby_EventScript_1B774F
	jump FallarborTown_ContestLobby_EventScript_1B7759
	end

FallarborTown_ContestLobby_EventScript_1B7726:: @ 81B7726
	msgbox FallarborTown_ContestLobby_Text_1B6F1F, 4
	jump FallarborTown_ContestLobby_EventScript_1B7734
	end

FallarborTown_ContestLobby_EventScript_1B7734:: @ 81B7734
	msgbox FallarborTown_ContestLobby_Text_1B6EF1, 4
	jump FallarborTown_ContestLobby_EventScript_1B7742
	end

FallarborTown_ContestLobby_EventScript_1B7742:: @ 81B7742
	copyvar 0x8004, 0x8009
	fadescreen 1
	special 161
	waitstate
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B774F:: @ 81B774F
	msgbox FallarborTown_ContestLobby_Text_1B70F6, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7759:: @ 81B7759
	msgbox FallarborTown_ContestLobby_Text_1B704A, 4
	giveitem ITEM_PECHA_BERRY
	setflag 2241
	jump FallarborTown_ContestLobby_EventScript_1B76EF
	end

FallarborTown_ContestLobby_EventScript_1B7776:: @ 81B7776
	msgbox FallarborTown_ContestLobby_Text_1B717C, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7780:: @ 81B7780
	msgbox FallarborTown_ContestLobby_Text_1B71D2, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B778A:: @ 81B778A
	setvar 0x8008, 4
	jump FallarborTown_ContestLobby_EventScript_1B77B6
	end

SlateportCity_ContestLobby_EventScript_1B7795:: @ 81B7795
	setvar 0x8008, 2
	jump SlateportCity_ContestLobby_EventScript_1B77B6
	end

VerdanturfTown_ContestLobby_EventScript_1B77A0:: @ 81B77A0
	setvar 0x8008, 2
	jump VerdanturfTown_ContestLobby_EventScript_1B77B6
	end

LilycoveCity_ContestLobby_EventScript_1B77AB:: @ 81B77AB
	setvar 0x8008, 3
	jump LilycoveCity_ContestLobby_EventScript_1B77B6
	end

FallarborTown_ContestLobby_EventScript_1B77B6:: @ 81B77B6
LilycoveCity_ContestLobby_EventScript_1B77B6:: @ 81B77B6
SlateportCity_ContestLobby_EventScript_1B77B6:: @ 81B77B6
VerdanturfTown_ContestLobby_EventScript_1B77B6:: @ 81B77B6
	lock
	faceplayer
	msgbox FallarborTown_ContestLobby_Text_1B742F, 4
	specialval RESULT, 49
	compare RESULT, 1
	jumpeq FallarborTown_ContestLobby_EventScript_1B77DC
	compare RESULT, 0
	jumpeq FallarborTown_ContestLobby_EventScript_1B77E6
	end

FallarborTown_ContestLobby_EventScript_1B77DC:: @ 81B77DC
	msgbox FallarborTown_ContestLobby_Text_1B7469, 4
	release
	end

FallarborTown_ContestLobby_EventScript_1B77E6:: @ 81B77E6
	checkdailyflags
	checkflag 2241
	jumpeq FallarborTown_ContestLobby_EventScript_1B77F6
	jump FallarborTown_ContestLobby_EventScript_1B7800
	end

FallarborTown_ContestLobby_EventScript_1B77F6:: @ 81B77F6
	msgbox FallarborTown_ContestLobby_Text_1B7578, 4
	release
	end

FallarborTown_ContestLobby_EventScript_1B7800:: @ 81B7800
	msgbox FallarborTown_ContestLobby_Text_1B74B4, 4
	giveitem ITEM_PECHA_BERRY
	setflag 2241
	msgbox FallarborTown_ContestLobby_Text_1B753A, 4
	release
	end

FallarborTown_ContestLobby_Movement_1B7821:: @ 81B7821
LilycoveCity_ContestLobby_Movement_1B7821:: @ 81B7821
SlateportCity_ContestLobby_Movement_1B7821:: @ 81B7821
VerdanturfTown_ContestLobby_Movement_1B7821:: @ 81B7821
	step_28
	step_end

FallarborTown_ContestLobby_EventScript_1B7823:: @ 81B7823
	jump FallarborTown_ContestLobby_EventScript_1B783B
	end

SlateportCity_ContestLobby_EventScript_1B7829:: @ 81B7829
	jump SlateportCity_ContestLobby_EventScript_1B783B
	end

VerdanturfTown_ContestLobby_EventScript_1B782F:: @ 81B782F
	jump VerdanturfTown_ContestLobby_EventScript_1B783B
	end

LilycoveCity_ContestLobby_EventScript_1B7835:: @ 81B7835
	jump LilycoveCity_ContestLobby_EventScript_1B783B
	end

FallarborTown_ContestLobby_EventScript_1B783B:: @ 81B783B
LilycoveCity_ContestLobby_EventScript_1B783B:: @ 81B783B
SlateportCity_ContestLobby_EventScript_1B783B:: @ 81B783B
VerdanturfTown_ContestLobby_EventScript_1B783B:: @ 81B783B
	lockall
	specialval RESULT, 49
	compare RESULT, 0
	jumpeq FallarborTown_ContestLobby_EventScript_1B7897
	checkitem ITEM_POKEBLOCK_CASE, 1
	compare RESULT, 0
	jumpeq FallarborTown_ContestLobby_EventScript_1B7942
	specialval RESULT, 160
	compare RESULT, 65535
	jumpif 5, FallarborTown_ContestLobby_EventScript_1B7878
	compare RESULT, 65535
	jumpeq FallarborTown_ContestLobby_EventScript_1B7938
	end

FallarborTown_ContestLobby_EventScript_1B7878:: @ 81B7878
	msgbox FallarborTown_ContestLobby_Text_1B727C, 5
	compare RESULT, 1
	jumpeq FallarborTown_ContestLobby_EventScript_1B78A1
	compare RESULT, 0
	jumpeq FallarborTown_ContestLobby_EventScript_1B7936
	end

FallarborTown_ContestLobby_EventScript_1B7897:: @ 81B7897
	msgbox FallarborTown_ContestLobby_Text_1B7381, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B78A1:: @ 81B78A1
	call FallarborTown_ContestLobby_EventScript_19F806
	compare RESULT, 0
	jumpeq FallarborTown_ContestLobby_EventScript_1B7936
	message FallarborTown_ContestLobby_Text_1B7304
	waittext
	special 36
	waitstate
	compare RESULT, 1
	jumpeq FallarborTown_ContestLobby_EventScript_1B7980
	compare RESULT, 2
	jumpeq FallarborTown_ContestLobby_EventScript_1B794C
	compare RESULT, 3
	jumpeq FallarborTown_ContestLobby_EventScript_1B7959
	compare RESULT, 5
	jumpeq FallarborTown_ContestLobby_EventScript_1B7966
	compare RESULT, 6
	jumpeq FallarborTown_ContestLobby_EventScript_1B7973
	end

FallarborTown_ContestLobby_EventScript_1B78F3:: @ 81B78F3
	msgbox FallarborTown_ContestLobby_Text_1B733B, 4
	jump FallarborTown_ContestLobby_EventScript_1B791D
	end

FallarborTown_ContestLobby_EventScript_1B7901:: @ 81B7901
	msgbox FallarborTown_ContestLobby_Text_1B7347, 4
	jump FallarborTown_ContestLobby_EventScript_1B791D
	end

FallarborTown_ContestLobby_EventScript_1B790F:: @ 81B790F
	msgbox FallarborTown_ContestLobby_Text_1B735A, 4
	jump FallarborTown_ContestLobby_EventScript_1B791D
	end

FallarborTown_ContestLobby_EventScript_1B791D:: @ 81B791D
	setvar 0x8004, 0
	fadescreen 1
	disappear 240
	disappear 239
	disappear 238
	disappear 237
	special 161
	waitstate
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7936:: @ 81B7936
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7938:: @ 81B7938
	msgbox FallarborTown_ContestLobby_Text_1B73B7, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7942:: @ 81B7942
	msgbox FallarborTown_ContestLobby_Text_1B73F1, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B794C:: @ 81B794C
	special 31
	msgbox FallarborTown_ContestLobby_Text_1A4A30, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7959:: @ 81B7959
	special 31
	msgbox FallarborTown_ContestLobby_Text_1A4B1D, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7966:: @ 81B7966
	special 31
	msgbox FallarborTown_ContestLobby_Text_1A10EB, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7973:: @ 81B7973
	special 31
	msgbox FallarborTown_ContestLobby_Text_1A4A85, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7980:: @ 81B7980
	fadescreen 1
	specialval RESULT, 37
	copyvar 0x8008, RESULT
	copyvar 0x8004, 0x8008
	special 38
	jump FallarborTown_ContestLobby_EventScript_1B799A
	end

FallarborTown_ContestLobby_EventScript_1B799A:: @ 81B799A
	fadescreen 0
	switch 0x8008
	case 2, FallarborTown_ContestLobby_EventScript_1B78F3
	case 3, FallarborTown_ContestLobby_EventScript_1B7901
	case 4, FallarborTown_ContestLobby_EventScript_1B790F
	end

Route102_Text_1B79C3:: @ 81B79C3
	.string "If you have POKéMON with you, then\n"
	.string "you’re an official POKéMON TRAINER!\l"
	.string "You can’t say no to my challenge!$"

Route102_Text_1B7A2C:: @ 81B7A2C
	.string "Arrgh, I lost...\n"
	.string "I should have trained mine more...$"

Route102_Text_1B7A60:: @ 81B7A60
	.string "Listen, you. If you’re strong, you\n"
	.string "should have told me before!$"

Route102_Text_1B7A9F:: @ 81B7A9F
	.string "Ever since I lost to you, I desperately\n"
	.string "trained my POKéMON.\l"
	.string "You can’t say no to my challenge!$"

Route102_Text_1B7AFD:: @ 81B7AFD
	.string "Arrgh, I lost...\n"
	.string "Is my training method not right?$"

Route102_Text_1B7B2F:: @ 81B7B2F
	.string "If you’re going to get stronger, I’ll\n"
	.string "get stronger, too.$"

Route102_Text_1B7B68:: @ 81B7B68
	.string "Did you just become a TRAINER?\n"
	.string "We’re both beginners!$"

Route102_Text_1B7B9D:: @ 81B7B9D
	.string "I called you because I thought I\n"
	.string "could beat you...$"

Route102_Text_1B7BD0:: @ 81B7BD0
	.string "I haven’t won once yet...\n"
	.string "I wish I would win soon...$"

Route102_Text_1B7C05:: @ 81B7C05
	.string "Hahah! Our eyes met!\n"
	.string "I’ll take you on with my BUG POKéMON!$"

Route102_Text_1B7C40:: @ 81B7C40
	.string "Ow! Down and out!$"

Route102_Text_1B7C52:: @ 81B7C52
	.string "If you lock eyes with a TRAINER,\n"
	.string "you have to challenge! It’s a rule!$"

Route102_Text_1B7C97:: @ 81B7C97
	.string "I’m going to keep winning and aim\n"
	.string "to be the best TRAINER.\p"
	.string "Help me further my career!$"

Route102_Text_1B7CEC:: @ 81B7CEC
	.string "I ended up furthering your career...$"

Route102_Text_1B7D11:: @ 81B7D11
	.string "To keep winning my way up, I see that\n"
	.string "I have to catch more POKéMON.$"

Route103_Text_1B7D55:: @ 81B7D55
	.string "Did you feel the tug of our soul-\n"
	.string "soothing fragrance?$"

Route103_Text_1B7D8B:: @ 81B7D8B
	.string "You weren’t led astray by our aroma...$"

Route103_Text_1B7DB2:: @ 81B7DB2
	.string "Aromatherapy is a form of mental\n"
	.string "healing that works with fragrances.$"

Route103_Text_1B7DF7:: @ 81B7DF7
	.string "AMY: I’m AMY.\n"
	.string "And this is my little sister LIV.\l"
	.string "We battle together!$"

Route103_Text_1B7E3B:: @ 81B7E3B
	.string "AMY: Uh-oh, we lost.$"

Route103_Text_1B7E50:: @ 81B7E50
	.string "AMY: You have to think about all\n"
	.string "kinds of things when you’re battling\l"
	.string "against two TRAINERS.$"

Route103_Text_1B7EAC:: @ 81B7EAC
	.string "AMY: Uh-oh, you have only one\n"
	.string "POKéMON with you.\l"
	.string "You can’t battle us like that.$"

Route103_Text_1B7EFB:: @ 81B7EFB
	.string "LIV: We battle together as one\n"
	.string "team.$"

Route103_Text_1B7F20:: @ 81B7F20
	.string "LIV: Oh, we lost, big sister...$"

Route103_Text_1B7F40:: @ 81B7F40
	.string "LIV: We work perfectly together, me\n"
	.string "and my big sister...\p"
	.string "But we still lost...$"

Route103_Text_1B7F8E:: @ 81B7F8E
	.string "LIV: If you want to battle us, you\n"
	.string "have to have two POKéMON!\l"
	.string "It’s not fair if you don’t!$"

Route103_Text_1B7FE7:: @ 81B7FE7
	.string "AMY: I’m AMY.\n"
	.string "And this is my little sister LIV.\l"
	.string "We battle together!$"

Route103_Text_1B802B:: @ 81B802B
	.string "AMY: Aww, boo!\n"
	.string "We couldn’t win again...$"

Route103_Text_1B8053:: @ 81B8053
	.string "AMY: You have to think about all\n"
	.string "kinds of things when you’re battling\l"
	.string "against two TRAINERS.$"

Route103_Text_1B80AF:: @ 81B80AF
	.string "AMY: Uh-oh, you have only one\n"
	.string "POKéMON with you.\l"
	.string "You can’t battle us like that.$"

Route103_Text_1B80FE:: @ 81B80FE
	.string "LIV: We battle together as one\n"
	.string "team.$"

Route103_Text_1B8123:: @ 81B8123
	.string "LIV: Awww, we lost again...\n"
	.string "Big sister...$"

Route103_Text_1B814D:: @ 81B814D
	.string "LIV: We work perfectly together, me\n"
	.string "and my big sister...\p"
	.string "But why did we lose again?$"

Route103_Text_1B81A1:: @ 81B81A1
	.string "LIV: If you want to battle us, you\n"
	.string "have to have two POKéMON!\l"
	.string "It’s not fair if you don’t!$"

Route103_Text_1B81FA:: @ 81B81FA
	.string "Gah! My fishing line’s all snarled up!\n"
	.string "I’m getting frustrated and mean!\l"
	.string "That’s it! Battle me!$"

Route103_Text_1B8258:: @ 81B8258
	.string "Gah! Lost it!\n"
	.string "I’m even more annoyed now!$"

Route103_Text_1B8281:: @ 81B8281
	.string "Gah, I’m still boiling mad...\n"
	.string "Grrrrr...$"

Route103_Text_1B82A9:: @ 81B82A9
	.string "My POKéMON is delightfully adorable!\n"
	.string "Don’t be shy - I’ll show you!$"

Route103_Text_1B82EC:: @ 81B82EC
	.string "Oh, my gosh!\n"
	.string "My darling POKéMON!$"

Route103_Text_1B830D:: @ 81B830D
	.string "My delightful POKéMON looks darling\n"
	.string "even when it’s fainted!$"

Route103_Text_1B8349:: @ 81B8349
	.string "Hi, you! My delightfully adorable\n"
	.string "POKéMON has become more darling!$"

Route103_Text_1B838C:: @ 81B838C
	.string "Oh!\n"
	.string "My darling POKéMON!$"

Route103_Text_1B83A4:: @ 81B83A4
	.string "The more I spend time with it, the\n"
	.string "more adorable my POKéMON becomes.$"

Route104_Text_1B83E9:: @ 81B83E9
	.string "GINA: Okay, let’s battle with our\n"
	.string "POKéMON!$"

Route104_Text_1B8414:: @ 81B8414
	.string "GINA: Losing upsets me!$"

Route104_Text_1B842C:: @ 81B842C
	.string "GINA: {STR_VAR_1} is strong!\n"
	.string "We have to train lots more!$"

Route104_Text_1B845C:: @ 81B845C
	.string "GINA: Oh? Only one POKéMON?\n"
	.string "Then, we don’t battle with you.\p"
	.string "If there’s only one POKéMON, it will\n"
	.string "be lonesome. That’s not nice.$"

Route104_Text_1B84DB:: @ 81B84DB
	.string "MIA: We are twins, so we battle\n"
	.string "POKéMON together.$"

Route104_Text_1B850D:: @ 81B850D
	.string "MIA: We battled together, but we\n"
	.string "both lost...$"

Route104_Text_1B853B:: @ 81B853B
	.string "MIA: We will train our POKéMON more\n"
	.string "and be strong like you.$"

Route104_Text_1B8577:: @ 81B8577
	.string "MIA: You want to battle with us?\p"
	.string "It’s a big no-no if you don’t have two\n"
	.string "POKéMON with you.\l"
	.string "We’re too strong for you!$"

Route104_Text_1B85EB:: @ 81B85EB
	.string "Why keep it a secret?\n"
	.string "I’m the WATER POKéMON expert!\p"
	.string "Huh?\n"
	.string "You don’t know me?$"

Route104_Text_1B8637:: @ 81B8637
	.string "I thought I wasn’t too bad, if I may\n"
	.string "say so, but I guess not... Bleah...$"

Route104_Text_1B8680:: @ 81B8680
	.string "I got too into fishing.\n"
	.string "I forgot I had to raise my POKéMON...$"

Route104_Text_1B86BE:: @ 81B86BE
	.string "Leaving footprints in the sand is\n"
	.string "so fun!$"

Route104_Text_1B86E8:: @ 81B86E8
	.string "Waah! I got sand in my runners!\n"
	.string "They’re all gritty!$"

Route104_Text_1B871C:: @ 81B871C
	.string "I want to leave my footprints in the\n"
	.string "sand everywhere, but they disappear\l"
	.string "quickly...$"

Route104_Text_1B8770:: @ 81B8770
	.string "Should I...\n"
	.string "Or shouldn’t I?\p"
	.string "Okay, sure, I will battle!$"

Route104_Text_1B87A7:: @ 81B87A7
	.string "I shouldn’t have battled...$"

Route104_Text_1B87C3:: @ 81B87C3
	.string "If you’re faced with a decision and\n"
	.string "you let someone else choose for you,\l"
	.string "you will regret it, however things\l"
	.string "turn out.$"

Route104_Text_1B8839:: @ 81B8839
	.string "Come on, battle with me!$"

Route104_Text_1B8852:: @ 81B8852
	.string "Ohh...\n"
	.string "I thought I could win...$"

Route104_Text_1B8872:: @ 81B8872
	.string "I made the decision to battle, so I\n"
	.string "can accept this loss in grace.\p"
	.string "I am still upset about losing!$"

Route104_Text_1B88D4:: @ 81B88D4
	.string "Oh, sure, I’ll accept your challenge.\n"
	.string "I have a lot of money.$"

Route104_Text_1B8911:: @ 81B8911
	.string "Why couldn’t I win?$"

Route104_Text_1B8925:: @ 81B8925
	.string "There are some things money can’t buy.\n"
	.string "That’s POKéMON...$"

Route104_Text_1B895E:: @ 81B895E
	.string "After I lost to you, I learned a bunch\n"
	.string "of things about POKéMON.$"

Route104_Text_1B899E:: @ 81B899E
	.string "I lost again?\n"
	.string "Why couldn’t I win?$"

Route104_Text_1B89C0:: @ 81B89C0
	.string "I’m fabulously wealthy, but I can’t\n"
	.string "seem to win at POKéMON...\p"
	.string "It’s so deep, the world of POKéMON...$"

Route104_Text_1B8A24:: @ 81B8A24
	.string "We must have been fated to meet.\n"
	.string "May I ask you for a battle?$"

Route104_Text_1B8A61:: @ 81B8A61
	.string "Oh, my!$"

Route104_Text_1B8A69:: @ 81B8A69
	.string "“Hello” is the beginning of “good-bye.”\n"
	.string "I hope we meet again.$"

Route104_Text_1B8AA7:: @ 81B8AA7
	.string "Hello, we meet again.\n"
	.string "May I ask you for a battle?$"

Route104_Text_1B8AD9:: @ 81B8AD9
	.string "Oh, my...\n"
	.string "I did the best that I could...$"

Route104_Text_1B8B02:: @ 81B8B02
	.string "“Hello” is the beginning of “good-bye.”\n"
	.string "I hope we meet again.$"

	.include "data/maps/text/Route105.s"
Route106_Text_1B8EF0:: @ 81B8EF0
	.string "Which do you prefer, fishing in the\n"
	.string "sea or a stream?$"

Route106_Text_1B8F25:: @ 81B8F25
	.string "Like in deep-sea fishing, I lost\n"
	.string "spectacularly!$"

Route106_Text_1B8F55:: @ 81B8F55
	.string "Fishing is the greatest whether it’s\n"
	.string "in the sea or a stream.\l"
	.string "You agree with me, right?$"

Route106_Text_1B8FAC:: @ 81B8FAC
	.string "I caught a bunch of POKéMON fishing.\n"
	.string "I’ll show you an impressive battle!$"

Route106_Text_1B8FF5:: @ 81B8FF5
	.string "I lost again spectacularly!$"

Route106_Text_1B9011:: @ 81B9011
	.string "Win or lose, POKéMON are the greatest!\n"
	.string "You agree with me, right?$"

Route106_Text_1B9052:: @ 81B9052
	.string "What do people do if they need to go\n"
	.string "to a washroom?\p"
	.string "What if my ROD hooks a big one while\n"
	.string "I’m in the washroom? I just can’t go...$"

Route106_Text_1B90D3:: @ 81B90D3
	.string "I lost because I’m trying to not go\n"
	.string "to the washroom...$"

Route106_Text_1B910A:: @ 81B910A
	.string "Oh, no! I’ve got this feeling I’ll hook\n"
	.string "a big one!$"

Route106_Text_1B913D:: @ 81B913D
	.string "Hahahah! I’m a lousy runner, but in\n"
	.string "the water you can’t catch me!$"

Route106_Text_1B917F:: @ 81B917F
	.string "I give up!$"

Route106_Text_1B918A:: @ 81B918A
	.string "I wouldn’t lose in a swim race...$"

Route106_Text_1B91AC:: @ 81B91AC
	.string "The sea is my backyard. I’m not going\n"
	.string "to take it easy because you’re a kid!$"

Route106_Text_1B91F8:: @ 81B91F8
	.string "Did you take it easy on me by any\n"
	.string "chance?$"

Route106_Text_1B9222:: @ 81B9222
	.string "Drifting along with the waves...\n"
	.string "I love it! Why don’t you give it a try?$"

	.include "data/maps/text/Route107.s"
	.include "data/maps/text/Route108.s"
Route109_Text_1B9A1C:: @ 81B9A1C
	.string "Hiyah! Look at my chiseled abs!\n"
	.string "This is what you call “cut”!$"

Route109_Text_1B9A59:: @ 81B9A59
	.string "Aiyah!\n"
	.string "Flubbed out!$"

Route109_Text_1B9A6D:: @ 81B9A6D
	.string "Hiyah!\p"
	.string "My sculpted abs have nothing to do\n"
	.string "with POKéMON battles!$"

Route109_Text_1B9AAD:: @ 81B9AAD
	.string "Are you properly protected against\n"
	.string "the sun?$"

Route109_Text_1B9AD9:: @ 81B9AD9
	.string "Ouch, ouch, ouch!$"

Route109_Text_1B9AEB:: @ 81B9AEB
	.string "Cheeks are the most prone to burning!$"

Route109_Text_1B9B11:: @ 81B9B11
	.string "I’ve laid anchor in ports around the\n"
	.string "world, but SLATEPORT’s the best.$"

Route109_Text_1B9B57:: @ 81B9B57
	.string "You’re the best!$"

Route109_Text_1B9B68:: @ 81B9B68
	.string "In the best port was the best\n"
	.string "TRAINER...$"

Route109_Text_1B9B91:: @ 81B9B91
	.string "Urrrrppp...\n"
	.string "Battle? With me?$"

Route109_Text_1B9BAE:: @ 81B9BAE
	.string "Urp... Ooooooohhhhhh...\n"
	.string "Urrrrpppp...$"

Route109_Text_1B9BD3:: @ 81B9BD3
	.string "I’m usually stronger than this!\n"
	.string "I’m just seasick as a dog!\p"
	.string "I’m a SAILOR, but...$"

Route109_Text_1B9C23:: @ 81B9C23
	.string "I’m thirsty... I could go for a SODA POP\n"
	.string "at the SEASHORE HOUSE...$"

Route109_Text_1B9C65:: @ 81B9C65
	.string "Groan...$"

Route109_Text_1B9C6E:: @ 81B9C6E
	.string "I’m getting famished... My inner tube\n"
	.string "looks like a giant doughnut...$"

Route109_Text_1B9CB3:: @ 81B9CB3
	.string "I’m hungry, but I’ve got enough pep in\n"
	.string "me for a battle!$"

Route109_Text_1B9CEB:: @ 81B9CEB
	.string "I lost...\n"
	.string "It’s because I’m hungry...$"

Route109_Text_1B9D10:: @ 81B9D10
	.string "When you eat on a beach, everything\n"
	.string "seems to taste a little better.$"

Route109_Text_1B9D54:: @ 81B9D54
	.string "Doesn’t a beach umbrella look like\n"
	.string "a giant flower?$"

Route109_Text_1B9D87:: @ 81B9D87
	.string "Mommy!$"

Route109_Text_1B9D8E:: @ 81B9D8E
	.string "If you look at the beach from the sky,\n"
	.string "it looks like a big flower garden!$"

Route109_Text_1B9DD8:: @ 81B9DD8
	.string "I’m not losing to you again!\n"
	.string "That’s why I have my inner tube!$"

Route109_Text_1B9E16:: @ 81B9E16
	.string "Mommy!$"

Route109_Text_1B9E1D:: @ 81B9E1D
	.string "If I have an inner tube, me and my\n"
	.string "POKéMON’s cuteness goes way up!$"

Route109_Text_1B9E60:: @ 81B9E60
	.string "I can’t swim without my inner tube,\n"
	.string "but I won’t lose at POKéMON!$"

Route109_Text_1B9EA1:: @ 81B9EA1
	.string "Did I lose because I have an inner\n"
	.string "tube?$"

Route109_Text_1B9ECA:: @ 81B9ECA
	.string "My inner tube is a fashion item.\n"
	.string "I can’t be seen without it.$"

Route109_Text_1B9F07:: @ 81B9F07
	.string "Hi, big TRAINER.\n"
	.string "Will you battle with me?$"

Route109_Text_1B9F31:: @ 81B9F31
	.string "Oh, you’re strong.$"

Route109_Text_1B9F44:: @ 81B9F44
	.string "How did you get to be so strong?$"

Route109_Text_1B9F65:: @ 81B9F65
	.string "Wahahah! This dude’s going to catch\n"
	.string "himself a big one!$"

Route109_Text_1B9F9C:: @ 81B9F9C
	.string "This dude just lost one...$"

Route109_Text_1B9FB7:: @ 81B9FB7
	.string "This dude thinks you’re a big one.\n"
	.string "No, you’re a big-one-to-be!$"

Route109_Text_1B9FF6:: @ 81B9FF6
	.string "PAUL: Well, this is a mood-breaker.\p"
	.string "I wish you wouldn’t disturb our\n"
	.string "precious time together.$"

Route109_Text_1BA052:: @ 81BA052
	.string "PAUL: Well, I give up.$"

Route109_Text_1BA069:: @ 81BA069
	.string "PAUL: Well, don’t tell anyone that\n"
	.string "we’re here.\l"
	.string "This is just our private world of two!$"

Route109_Text_1BA0BF:: @ 81BA0BF
	.string "PAUL: We’re totally, deeply in love.\n"
	.string "That’s why we make our POKéMON battle\l"
	.string "together.$"

Route109_Text_1BA114:: @ 81BA114
	.string "MEL: We’re, like, totally in love.\n"
	.string "Our romance is heating up all of HOENN!$"

Route109_Text_1BA15F:: @ 81BA15F
	.string "MEL: We lost, and it’s my fault!\n"
	.string "PAUL will hate me!$"

Route109_Text_1BA193:: @ 81BA193
	.string "MEL: Um, PAUL, are you angry with me?\n"
	.string "Please don’t be angry.$"

Route109_Text_1BA1D0:: @ 81BA1D0
	.string "MEL: We’re, like, deeply and truly in love.\n"
	.string "That’s why we make our POKéMON\l"
	.string "battle together.$"

Route110_Text_1BA22C:: @ 81BA22C
	.string "Whoa! Watch it!\n"
	.string "I guess you’re not used to BIKE racing.$"

Route110_Text_1BA264:: @ 81BA264
	.string "Whoa!\n"
	.string "My brakes failed!$"

Route110_Text_1BA27C:: @ 81BA27C
	.string "Flat tires and brake problems can\n"
	.string "cause serious injury!\l"
	.string "Inspect your BIKE for problems!$"

Route110_Text_1BA2D4:: @ 81BA2D4
	.string "Yo, you!\n"
	.string "Can you keep up with my speed?$"

Route110_Text_1BA2FC:: @ 81BA2FC
	.string "Crash and burn!$"

Route110_Text_1BA30C:: @ 81BA30C
	.string "Speed alone won’t let me win at POKéMON.\n"
	.string "I need to reconsider this...$"

Route110_Text_1BA352:: @ 81BA352
	.string "Don’t panic if your BIKE’s going fast!$"

Route110_Text_1BA379:: @ 81BA379
	.string "I shouldn’t panic during POKéMON\n"
	.string "battles...$"

Route110_Text_1BA3A5:: @ 81BA3A5
	.string "There’s no need to panic or stress.\n"
	.string "Take it easy. There’s plenty of time.$"

Route110_Text_1BA3EF:: @ 81BA3EF
	.string "Aren’t you going a little too fast?\n"
	.string "Take it easy and let’s battle.$"

Route110_Text_1BA432:: @ 81BA432
	.string "I didn’t panic, but I still lost...$"

Route110_Text_1BA456:: @ 81BA456
	.string "There’s no need to panic or stress.\n"
	.string "Take it easy. There’s plenty of time.$"

Route110_Text_1BA4A0:: @ 81BA4A0
	.string "The triathlon is hard in the extreme.\p"
	.string "You have to complete the three events\n"
	.string "of swimming, cycling, and running.$"

Route110_Text_1BA50F:: @ 81BA50F
	.string "POKéMON battles are hard, too!$"

Route110_Text_1BA52E:: @ 81BA52E
	.string "I’m exhausted, so I need a break.\n"
	.string "It’s important to get proper rest.$"

Route110_Text_1BA573:: @ 81BA573
	.string "Isn’t it neat to hold a battle while\n"
	.string "cycling?$"

Route110_Text_1BA5A1:: @ 81BA5A1
	.string "Wow...\n"
	.string "How could you be so strong?$"

Route110_Text_1BA5C4:: @ 81BA5C4
	.string "Were you going after a record?\p"
	.string "I’m sorry if I held you up!$"

Route110_Text_1BA5FF:: @ 81BA5FF
	.string "I’ve been riding without stopping.\n"
	.string "My thighs are like rocks!$"

Route110_Text_1BA63C:: @ 81BA63C
	.string "I’m worried about muscle cramps...$"

Route110_Text_1BA65F:: @ 81BA65F
	.string "Oh, you have some GYM BADGES?\n"
	.string "No wonder you’re so strong!$"

Route110_Text_1BA699:: @ 81BA699
	.string "I have foreseen your intentions!\n"
	.string "I cannot possibly lose!$"

Route110_Text_1BA6D2:: @ 81BA6D2
	.string "I failed to prophesize my own demise!$"

Route110_Text_1BA6F8:: @ 81BA6F8
	.string "I see your future...\p"
	.string "Hmm...\n"
	.string "I see a shining light...$"

Route110_Text_1BA72D:: @ 81BA72D
	.string "Ahahahaha!\n"
	.string "I’ll dazzle you with my wonders!$"

Route110_Text_1BA759:: @ 81BA759
	.string "I wondrously lost!$"

Route110_Text_1BA76C:: @ 81BA76C
	.string "You managed to win only because it was\n"
	.string "a wonder! Yes, a wonder!\l"
	.string "Don’t think you can win all the time!$"

Route110_Text_1BA7D2:: @ 81BA7D2
	.string "Could I see your POKéMON?\n"
	.string "Just one look, please?$"

Route110_Text_1BA803:: @ 81BA803
	.string "I wanted to complete my\n"
	.string "collection...$"

Route110_Text_1BA829:: @ 81BA829
	.string "When I see a POKéMON that I don’t know,\n"
	.string "my passion as a collector is ignited!$"

Route110_Text_1BA877:: @ 81BA877
	.string "Hi, have you caught any new POKéMON?\p"
	.string "Could I see your POKéMON?\n"
	.string "Just one look, please?$"

Route110_Text_1BA8CD:: @ 81BA8CD
	.string "Your POKéMON...\n"
	.string "I envy you.$"

Route110_Text_1BA8E9:: @ 81BA8E9
	.string "Oh, I long to make all rare POKéMON\n"
	.string "mine!$"

Route110_Text_1BA913:: @ 81BA913
	.string "Hey!\n"
	.string "Don’t sneak up behind me like that!$"

Route110_Text_1BA93C:: @ 81BA93C
	.string "I lost!\n"
	.string "Drat!$"

Route110_Text_1BA94A:: @ 81BA94A
	.string "Fishing is all about concentration.\n"
	.string "You have to focus on the floater.$"

Route110_Text_1BA990:: @ 81BA990
	.string "Ahahaha! I would go anywhere to show\n"
	.string "off my delightful POKéMON.$"

Route110_Text_1BA9D0:: @ 81BA9D0
	.string "Oh, dear, this won’t do.$"

Route110_Text_1BA9E9:: @ 81BA9E9
	.string "Perhaps I should groom my POKéMON for\n"
	.string "CONTESTS rather than battles.$"

Route110_Text_1BAA2D:: @ 81BAA2D
	.string "Ahahahaha! I would be happy to show\n"
	.string "off my POKéMON as often as you like!$"

Route110_Text_1BAA76:: @ 81BAA76
	.string "Oh, dear, this won’t do.$"

Route110_Text_1BAA8F:: @ 81BAA8F
	.string "CONTESTS are delightful, but I like\n"
	.string "to battle, too.$"

Route110_Text_1BAAC3:: @ 81BAAC3
	.string "I found some cool POKéMON in the grass\n"
	.string "around here!$"

Route110_Text_1BAAF7:: @ 81BAAF7
	.string "Being cool isn’t enough to win...$"

Route110_Text_1BAB19:: @ 81BAB19
	.string "It’s hard to battle with POKéMON you\n"
	.string "just caught.$"

Route111_Text_1BAB4B:: @ 81BAB4B
	.string "Oh, hey! Those GO-GOGGLES suit you.\n"
	.string "But I think they look better on me.\p"
	.string "Let’s decide who they look better on\n"
	.string "with a battle!$"

Route111_Text_1BABC7:: @ 81BABC7
	.string "I couldn’t see what was happening at my\n"
	.string "sides because of the GO-GOGGLES.$"

Route111_Text_1BAC10:: @ 81BAC10
	.string "The GO-GOGGLES make it possible to\n"
	.string "get through sandstorms.\l"
	.string "That makes me happy!$"

Route111_Text_1BAC60:: @ 81BAC60
	.string "I’m having a picnic in the desert.\p"
	.string "You can always find a TRAINER, so\n"
	.string "I can enjoy a battle here, too!$"

Route111_Text_1BACC5:: @ 81BACC5
	.string "Ohhh! You’re mean!$"

Route111_Text_1BACD8:: @ 81BACD8
	.string "When you’re battling in a sandstorm,\n"
	.string "watch out for your POKéMON’s HP.\p"
	.string "It can faint if you don’t keep an eye\n"
	.string "on it!$"

Route111_Text_1BAD4B:: @ 81BAD4B
	.string "Wearing these GO-GOGGLES makes me\n"
	.string "feel like a superhero.\l"
	.string "Right now, nobody can beat me!$"

Route111_Text_1BADA3:: @ 81BADA3
	.string "I can’t win on spirit alone...$"

Route111_Text_1BADC2:: @ 81BADC2
	.string "I’m going to be a real hero one day.\n"
	.string "I’m going to work harder to make me\l"
	.string "and my POKéMON stronger.$"

Route111_Text_1BAE24:: @ 81BAE24
	.string "I heard there are fossils to be found\n"
	.string "in the desert. Where could they be?$"

Route111_Text_1BAE6E:: @ 81BAE6E
	.string "I came up short...$"

Route111_Text_1BAE81:: @ 81BAE81
	.string "If they can find fossils in the desert,\n"
	.string "it must have been a sea before.$"

Route111_Text_1BAEC9:: @ 81BAEC9
	.string "For thirty years I have searched for\n"
	.string "ancient ruins!\l"
	.string "I am to be challenged?$"

Route111_Text_1BAF14:: @ 81BAF14
	.string "While I have searched for ruins, I’ve\n"
	.string "not searched for strong POKéMON.$"

Route111_Text_1BAF5B:: @ 81BAF5B
	.string "For thirty years I have searched for\n"
	.string "ancient ruins!\p"
	.string "No, wait, was that forty years?\n"
	.string "Which was it now?$"

Route111_Text_1BAFC1:: @ 81BAFC1
	.string "For thirty years I have searched for\n"
	.string "ancient ruins!\p"
	.string "No, wait, was that forty years?\n"
	.string "Anyway, am I to be challenged?$"

Route111_Text_1BB034:: @ 81BB034
	.string "I’ve found no ruins, nor have I found\n"
	.string "any strong POKéMON...$"

Route111_Text_1BB070:: @ 81BB070
	.string "For thirty years I have searched for\n"
	.string "ancient ruins!\p"
	.string "No, wait, was that forty years I’ve\n"
	.string "searched?\p"
	.string "Hmm... It could even be fifty...\n"
	.string "How long have I been at this?$"

Route111_Text_1BB111:: @ 81BB111
	.string "I’m full of pep!\n"
	.string "And my POKéMON is peppy, too!$"

Route111_Text_1BB140:: @ 81BB140
	.string "My POKéMON lost its pep...$"

Route111_Text_1BB15B:: @ 81BB15B
	.string "When I see a TRAINER with a lot of pep,\n"
	.string "I can’t help looking.$"

Route111_Text_1BB199:: @ 81BB199
	.string "I don’t know where you’re going, but\n"
	.string "would you like to battle?$"

Route111_Text_1BB1D8:: @ 81BB1D8
	.string "Oh, you’re disgustingly good!$"

Route111_Text_1BB1F6:: @ 81BB1F6
	.string "I’m thinking that I should go to\n"
	.string "MT. CHIMNEY, but the view around\l"
	.string "here is very nice, too.$"

Route111_Text_1BB250:: @ 81BB250
	.string "To train myself, I challenge all\n"
	.string "whom I meet!$"

Route111_Text_1BB27E:: @ 81BB27E
	.string "Uncle! I give up!$"

Route111_Text_1BB290:: @ 81BB290
	.string "All I can do is keep training until\n"
	.string "I can defeat strong TRAINERS such\l"
	.string "as yourself.$"

Route111_Text_1BB2E3:: @ 81BB2E3
	.string "Show me how much you’ve toughened\n"
	.string "your POKéMON.$"

Route111_Text_1BB313:: @ 81BB313
	.string "I see, you’ve toughened them\n"
	.string "considerably.$"

Route111_Text_1BB33E:: @ 81BB33E
	.string "POKéMON and TRAINERS learn much\n"
	.string "through battling.\p"
	.string "What’s important is to never give up\n"
	.string "even if you lose.$"

Route111_Text_1BB3A7:: @ 81BB3A7
	.string "We’re training here to elevate our\n"
	.string "game to the next level.\l"
	.string "Stay and train with us!$"

Route111_Text_1BB3FA:: @ 81BB3FA
	.string "Ooh, you’re decent!$"

Route111_Text_1BB40E:: @ 81BB40E
	.string "Since you’re that strong, you should\n"
	.string "aim for the POKéMON LEAGUE.$"

Route111_Text_1BB44F:: @ 81BB44F
	.string "Oh, your POKéMON look like serious\n"
	.string "actors.\l"
	.string "I have to ask you for an engagement.$"

Route111_Text_1BB49F:: @ 81BB49F
	.string "They didn’t just look strong, they\n"
	.string "are strong!$"

Route111_Text_1BB4CE:: @ 81BB4CE
	.string "I thought I was raising my POKéMON\n"
	.string "diligently, but, oh no, there is still\l"
	.string "much to be done.$"

Route111_Text_1BB529:: @ 81BB529
	.string "You can make POKéMON stronger or\n"
	.string "weaker depending on the moves you\l"
	.string "teach them.\p"
	.string "What kinds of moves do your POKéMON\n"
	.string "know?$"

Route111_Text_1BB5A2:: @ 81BB5A2
	.string "You’ve taught them good moves!$"

Route111_Text_1BB5C1:: @ 81BB5C1
	.string "Maybe I should have stopped my\n"
	.string "POKéMON from evolving until they\l"
	.string "learned better moves...$"

Route112_Text_1BB619:: @ 81BB619
	.string "Hahahaha!\n"
	.string "How about we have a battle?\l"
	.string "You and me!\l"
	.string "Hahahaha!$"

Route112_Text_1BB655:: @ 81BB655
	.string "I lost!\n"
	.string "Hahahaha!$"

Route112_Text_1BB667:: @ 81BB667
	.string "Hahahahaha! Something flew up my nose!\n"
	.string "Hahahaha-hatchoo!$"

Route112_Text_1BB6A0:: @ 81BB6A0
	.string "My legs are solid from pounding up\n"
	.string "and down the mountains.\p"
	.string "They’re not going to buckle easily,\n"
	.string "friend!$"

Route112_Text_1BB707:: @ 81BB707
	.string "Ouch! My legs cramped up!$"

Route112_Text_1BB721:: @ 81BB721
	.string "Try hiking, and I mean really\n"
	.string "pounding, on these mountain trails\l"
	.string "with a heavy pack weighing dozens of\l"
	.string "pounds.\p"
	.string "That, my friend, will get your body\n"
	.string "into serious shape.$"

Route112_Text_1BB7C7:: @ 81BB7C7
	.string "I’ve been keeping fit by hiking.\n"
	.string "Power, I have in spades!$"

Route112_Text_1BB801:: @ 81BB801
	.string "I got trumped in power?$"

Route112_Text_1BB819:: @ 81BB819
	.string "I hear there are some seriously tough\n"
	.string "TRAINERS on top of MT. CHIMNEY.\p"
	.string "I intend to get up there and give them\n"
	.string "a challenge!$"

Route112_Text_1BB893:: @ 81BB893
	.string "I’m strong.\n"
	.string "I won’t cry if I lose.$"

Route112_Text_1BB8B6:: @ 81BB8B6
	.string "Waaaah!$"

Route112_Text_1BB8BE:: @ 81BB8BE
	.string "I’m not crying because I miss my mommy!\n"
	.string "Snivel...$"

Route112_Text_1BB8F0:: @ 81BB8F0
	.string "When you’re out on a picnic, why, you\n"
	.string "simply have to sing!\l"
	.string "Come on, sing with me!$"

Route112_Text_1BB942:: @ 81BB942
	.string "Oh, you’re so strong!$"

Route112_Text_1BB958:: @ 81BB958
	.string "It doesn’t matter if you’re good or bad\n"
	.string "at singing or POKéMON.\p"
	.string "If you have the most fun, you win!$"

Route113_Text_1BB9BA:: @ 81BB9BA
	.string "Can you guess why it’s so cool\n"
	.string "around here?$"

Route113_Text_1BB9E6:: @ 81BB9E6
	.string "Peeuuw!\n"
	.string "That stinks!$"

Route113_Text_1BB9FB:: @ 81BB9FB
	.string "The volcanic ash blocks the sun, so it\n"
	.string "doesn’t get very warm.\p"
	.string "That’s good for me - I can’t stand heat!$"

Route113_Text_1BBA62:: @ 81BBA62
	.string "The volcano’s eruption is proof that\n"
	.string "the earth is alive.$"

Route113_Text_1BBA9B:: @ 81BBA9B
	.string "You’re some kind of strong!$"

Route113_Text_1BBAB7:: @ 81BBAB7
	.string "Ouch! Owww! I can’t see!\n"
	.string "I got ashes in my eyelashes!\p"
	.string "Get it? Ashes and eyelashes?\p"
	.string "Okay, that was bad, sorry...$"

Route113_Text_1BBB27:: @ 81BBB27
	.string "I use this parasol to ward off this\n"
	.string "filthy, yucky volcanic ash from my\l"
	.string "dear NUMEL.$"

Route113_Text_1BBB7A:: @ 81BBB7A
	.string "Huff, huff...\n"
	.string "I am exhausted...$"

Route113_Text_1BBB9A:: @ 81BBB9A
	.string "You’re very good at this.\n"
	.string "I must say I’m impressed!$"

Route113_Text_1BBBCE:: @ 81BBBCE
	.string "Oh, hello, hasn’t it been a while?\n"
	.string "May I invite you to battle?$"

Route113_Text_1BBC0D:: @ 81BBC0D
	.string "Oh, how super!$"

Route113_Text_1BBC1C:: @ 81BBC1C
	.string "You’ve remained very good at this.\n"
	.string "I must say I’m impressed!$"

Route113_Text_1BBC59:: @ 81BBC59
	.string "From out of the ashes I leap! Hiyah!\n"
	.string "I challenge thee!$"

Route113_Text_1BBC90:: @ 81BBC90
	.string "With honor I admit defeat!$"

Route113_Text_1BBCAB:: @ 81BBCAB
	.string "I must refine the art of concealment.\n"
	.string "I bid thee farewell.$"

Route113_Text_1BBCE6:: @ 81BBCE6
	.string "From out of the ashes I leap! Hiyah!\n"
	.string "I challenge thee!$"

Route113_Text_1BBD1D:: @ 81BBD1D
	.string "With honor I admit defeat!$"

Route113_Text_1BBD38:: @ 81BBD38
	.string "My flawless concealment was let down\n"
	.string "by my immature battle skills...\p"
	.string "I bid thee farewell.$"

Route113_Text_1BBD92:: @ 81BBD92
	.string "Thanks for finding me!\n"
	.string "But we still have to battle!$"

Route113_Text_1BBDC6:: @ 81BBDC6
	.string "I’ll use my ninjutsu on you...\n"
	.string "“VOLCANIC ASH SWIRL CLOAK”!\p"
	.string "...What? It’s already over?$"

Route113_Text_1BBE1D:: @ 81BBE1D
	.string "You know what’s crummy about hiding?\n"
	.string "It’s lonely if no one comes along.$"

Route113_Text_1BBE65:: @ 81BBE65
	.string "TORI: Both of us, we collect ashes.\n"
	.string "We battle POKéMON, too.$"

Route113_Text_1BBEA1:: @ 81BBEA1
	.string "TORI: We lost... It’s boring, so I’m going\n"
	.string "to get some more ashes.$"

Route113_Text_1BBEE4:: @ 81BBEE4
	.string "TORI: How much ash do we have?\n"
	.string "Enough for a WHITE FLUTE, I hope.$"

Route113_Text_1BBF25:: @ 81BBF25
	.string "TORI: We want to battle 2-on-2.\n"
	.string "If we didn’t, we would lose!$"

Route113_Text_1BBF62:: @ 81BBF62
	.string "TIA: Both of us, we collect ashes.\n"
	.string "We battle POKéMON, too.$"

Route113_Text_1BBF9D:: @ 81BBF9D
	.string "TIA: We couldn’t win... It’s boring,\n"
	.string "so I’m getting some more ashes.$"

Route113_Text_1BBFE2:: @ 81BBFE2
	.string "TIA: We have a lot of ashes!\n"
	.string "I think enough for a WHITE FLUTE!$"

Route113_Text_1BC021:: @ 81BC021
	.string "TIA: We want to battle 2-on-2.\n"
	.string "If we don’t, we won’t win!$"

Route114_Text_1BC05B:: @ 81BC05B
	.string "Yodelayhihoo!\p"
	.string "... ...\p"
	.string "You’re supposed to shout\n"
	.string "“yodelayhihoo” since it doesn’t\l"
	.string "echo here!$"

Route114_Text_1BC0B5:: @ 81BC0B5
	.string "Yodelayhihoo!$"

Route114_Text_1BC0C3:: @ 81BC0C3
	.string "When I was a wee tyke, I believed there\n"
	.string "was someone copying me and shouting\l"
	.string "back, “Yodelayhihoo.”$"

Route114_Text_1BC125:: @ 81BC125
	.string "If you’re not prepared, you shouldn’t\n"
	.string "be up in the mountains!$"

Route114_Text_1BC163:: @ 81BC163
	.string "The mountains are unforgiving...$"

Route114_Text_1BC184:: @ 81BC184
	.string "In the winter, mountains turn deadly\n"
	.string "with blizzards and avalanches.$"

Route114_Text_1BC1C8:: @ 81BC1C8
	.string "Camping’s fun! You can fish, roast\n"
	.string "marshmallows, and tell spooky stories!\p"
	.string "But the best of all are the POKéMON\n"
	.string "battles!$"

Route114_Text_1BC23F:: @ 81BC23F
	.string "Way too strong!$"

Route114_Text_1BC24F:: @ 81BC24F
	.string "I think it’s great that I can go\n"
	.string "camping with my POKéMON.$"

Route114_Text_1BC289:: @ 81BC289
	.string "I need to exercise after a meal.\n"
	.string "Let’s have a match!$"

Route114_Text_1BC2BE:: @ 81BC2BE
	.string "Oh, no!$"

Route114_Text_1BC2C6:: @ 81BC2C6
	.string "I just had a tasty meal.\n"
	.string "I’m getting drowsy...$"

Route114_Text_1BC2F5:: @ 81BC2F5
	.string "Ufufufufufu...\n"
	.string "Want to battle against my POKéMON?$"

Route114_Text_1BC327:: @ 81BC327
	.string "M-My POKéMON...$"

Route114_Text_1BC337:: @ 81BC337
	.string "A big body that’s all lumpy and hard,\n"
	.string "enormous horns, and vicious fangs...\p"
	.string "Ufufufufu...\n"
	.string "I wish I had a POKéMON like that...$"

Route114_Text_1BC3B3:: @ 81BC3B3
	.string "Ufufufufufu...\n"
	.string "Come on, battle my POKéMON...$"

Route114_Text_1BC3E0:: @ 81BC3E0
	.string "I feel so lucky getting to see your\n"
	.string "POKéMON...$"

Route114_Text_1BC40F:: @ 81BC40F
	.string "Ufufufufufu...\p"
	.string "When I see POKéMON battling, I get all\n"
	.string "shivery and shaky...$"

Route114_Text_1BC45A:: @ 81BC45A
	.string "If you’re lighting a campfire, make\n"
	.string "sure you have water handy.$"

Route114_Text_1BC499:: @ 81BC499
	.string "Thanks for dousing my fire!$"

Route114_Text_1BC4B5:: @ 81BC4B5
	.string "You really do have to be careful with\n"
	.string "any sort of fire in a forest.\p"
	.string "Don’t ever underestimate the power\n"
	.string "of fire.$"

Route114_Text_1BC525:: @ 81BC525
	.string "Have you learned to keep water handy\n"
	.string "for campfires?$"

Route114_Text_1BC559:: @ 81BC559
	.string "I got hosed down before I could flare\n"
	.string "up, I guess.$"

Route114_Text_1BC58C:: @ 81BC58C
	.string "You really do have to be careful with\n"
	.string "any sort of fire in a forest.\p"
	.string "Don’t ever underestimate the power\n"
	.string "of fire.$"

Route114_Text_1BC5FC:: @ 81BC5FC
	.string "If we were fishing, you wouldn’t stand\n"
	.string "a chance against me.\l"
	.string "So, bring on your POKéMON!$"

Route114_Text_1BC653:: @ 81BC653
	.string "If we were fishing, I would’ve won...$"

Route114_Text_1BC679:: @ 81BC679
	.string "I think I’ll try my luck at landing\n"
	.string "a big one at METEOR FALLS.\p"
	.string "There has to be something in there.\n"
	.string "I just know it.$"

Route114_Text_1BC6EC:: @ 81BC6EC
	.string "I like to fish. But I also like to\n"
	.string "battle!\p"
	.string "If anyone challenges me, I’m there,\n"
	.string "even if I’m fishing.$"

Route114_Text_1BC750:: @ 81BC750
	.string "I like to battle, but that doesn’t\n"
	.string "mean I’m good at it...$"

Route114_Text_1BC78A:: @ 81BC78A
	.string "This time I’ll do it!\p"
	.string "I always think that, so I can’t walk\n"
	.string "away from fishing or POKéMON.$"

Route114_Text_1BC7E3:: @ 81BC7E3
	.string "TYRA: Well, sure.\n"
	.string "I’m in the mood for it.\l"
	.string "I’ll teach you a little about POKéMON.$"

Route114_Text_1BC834:: @ 81BC834
	.string "TYRA: What an amazing battle style!$"

Route114_Text_1BC858:: @ 81BC858
	.string "TYRA: I was teaching my junior IVY\n"
	.string "about POKéMON.$"

Route114_Text_1BC88A:: @ 81BC88A
	.string "TYRA: Giggle...\n"
	.string "If you want to battle with us, just one\l"
	.string "POKéMON isn’t enough!$"

Route114_Text_1BC8D8:: @ 81BC8D8
	.string "IVY: Who taught you about POKéMON?$"

Route114_Text_1BC8FB:: @ 81BC8FB
	.string "IVY: What an amazing battle style!$"

Route114_Text_1BC91E:: @ 81BC91E
	.string "IVY: I started training POKéMON\n"
	.string "because TYRA, my student mentor,\l"
	.string "taught me!$"

Route114_Text_1BC96A:: @ 81BC96A
	.string "IVY: Do you only have one POKéMON?\n"
	.string "I think it must feel lonesome.$"

Route115_Text_1BC9AC:: @ 81BC9AC
	.string "Hm...\n"
	.string "You seem rather capable...\l"
	.string "Let me keep you company!$"

Route115_Text_1BC9E6:: @ 81BC9E6
	.string "You’re much stronger than\n"
	.string "I’d imagined!$"

Route115_Text_1BCA0E:: @ 81BCA0E
	.string "There is no such thing as a born genius.\n"
	.string "It all depends on effort!\l"
	.string "That is what I believe...$"

Route115_Text_1BCA6B:: @ 81BCA6B
	.string "Hm... As always, your agility speaks\n"
	.string "for itself.\l"
	.string "Come, keep me company!$"

Route115_Text_1BCAB3:: @ 81BCAB3
	.string "As strong as ever!$"

Route115_Text_1BCAC6:: @ 81BCAC6
	.string "All it takes is effort!\p"
	.string "I lost because I haven’t put in enough\n"
	.string "effort!$"

Route115_Text_1BCB0D:: @ 81BCB0D
	.string "You!\p"
	.string "My MACHOP!\p"
	.string "Demand a battle!$"

Route115_Text_1BCB2E:: @ 81BCB2E
	.string "Ouch, ouch, ouch!$"

Route115_Text_1BCB40:: @ 81BCB40
	.string "My MACHOP crew!\p"
	.string "So long as they seek power, I will\n"
	.string "grow strong with them!$"

Route115_Text_1BCB8A:: @ 81BCB8A
	.string "My strongest skill is busting bricks\n"
	.string "with my forehead!$"

Route115_Text_1BCBC1:: @ 81BCBC1
	.string "Ugwaaaah!\n"
	.string "My head is busted!$"

Route115_Text_1BCBDE:: @ 81BCBDE
	.string "I’ve been teaching my POKéMON karate.\p"
	.string "It looks like they’ll get a lot better\n"
	.string "than me. I’m excited about that.$"

Route115_Text_1BCC4C:: @ 81BCC4C
	.string "After you beat me, we trained hard to\n"
	.string "improve our skills.\l"
	.string "Come on, give us a rematch!$"

Route115_Text_1BCCA2:: @ 81BCCA2
	.string "Ugwaaah!\n"
	.string "We lost again!$"

Route115_Text_1BCCBA:: @ 81BCCBA
	.string "My POKéMON will grow stronger!\n"
	.string "I’ll redouble my training!$"

Route115_Text_1BCCF4:: @ 81BCCF4
	.string "This beach is my secret training spot!\n"
	.string "Don’t come butting in!$"

Route115_Text_1BCD32:: @ 81BCD32
	.string "I haven’t trained enough!$"

Route115_Text_1BCD4C:: @ 81BCD4C
	.string "The sand acts as a cushion to reduce\n"
	.string "impact and prevent injury.\l"
	.string "This is the perfect place to train.$"

Route115_Text_1BCDB0:: @ 81BCDB0
	.string "Okay, let’s get this battle on!$"

Route115_Text_1BCDD0:: @ 81BCDD0
	.string "I can battle but my POKéMON...$"

Route115_Text_1BCDEF:: @ 81BCDEF
	.string "Even when I lose, I still get some\n"
	.string "enjoyment out of it.\l"
	.string "It must be that I love POKéMON.$"

	.incbin "baserom.gba", 0x1bce47, 0x99

Route115_Text_1BCEE0:: @ 81BCEE0
	.string "I have a rare POKéMON!\n"
	.string "Would you like me to show you?$"

Route115_Text_1BCF16:: @ 81BCF16
	.string "You...\n"
	.string "You want my POKéMON, don’t you?$"

Route115_Text_1BCF3D:: @ 81BCF3D
	.string "I have this rare POKéMON.\n"
	.string "It’s enough to keep me satisfied.$"

Route116_Text_1BCF79:: @ 81BCF79
	.string "If the tunnel doesn’t go through, then\n"
	.string "I’ll just go over the top.$"

Route116_Text_1BCFBB:: @ 81BCFBB
	.string "Gasp... Gasp...\n"
	.string "Losing made me tired...$"

Route116_Text_1BCFE3:: @ 81BCFE3
	.string "It’s no big deal if there’s no tunnel.\n"
	.string "To a HIKER, mountains are roads!$"

Route116_Text_1BD02B:: @ 81BD02B
	.string "My POKéMON rule!\n"
	.string "Check them out!$"

Route116_Text_1BD04C:: @ 81BD04C
	.string "Ouch! A scrape!\n"
	.string "I have to put on a bandage!$"

Route116_Text_1BD078:: @ 81BD078
	.string "Bandages are signs of toughness!\n"
	.string "I’ve got another one!$"

Route116_Text_1BD0AF:: @ 81BD0AF
	.string "My BUG POKéMON are tough!\n"
	.string "Let’s battle!$"

Route116_Text_1BD0D7:: @ 81BD0D7
	.string "I lost!\n"
	.string "I thought I had you!$"

Route116_Text_1BD0F4:: @ 81BD0F4
	.string "BUG POKéMON evolve quickly.\n"
	.string "So they get strong quickly, too.$"

Route116_Text_1BD131:: @ 81BD131
	.string "Let me teach you how strong my\n"
	.string "adorable POKéMON is!$"

Route116_Text_1BD165:: @ 81BD165
	.string "You’re a notch above me...$"

Route116_Text_1BD180:: @ 81BD180
	.string "POKéMON that possess cuteness and\n"
	.string "power, that’s ideal, I think.$"

Route116_Text_1BD1C0:: @ 81BD1C0
	.string "We learn all sorts of things at the\n"
	.string "TRAINER’S SCHOOL.\p"
	.string "I want to test things out for real!$"

Route116_Text_1BD21A:: @ 81BD21A
	.string "I slacked off in school...\n"
	.string "That’s why I lost.$"

Route116_Text_1BD248:: @ 81BD248
	.string "I’ll have to redo some courses at the\n"
	.string "TRAINER’S SCHOOL.\l"
	.string "If I don’t, ROXANNE will be steamed.$"

Route116_Text_1BD2A5:: @ 81BD2A5
	.string "I’ve been studying seriously at the\n"
	.string "TRAINER’S SCHOOL.\l"
	.string "I won’t lose like I did last time.$"

Route116_Text_1BD2FE:: @ 81BD2FE
	.string "Hunh?\n"
	.string "I studied diligently.$"

Route116_Text_1BD31A:: @ 81BD31A
	.string "I’ll have to redo some courses at the\n"
	.string "TRAINER’S SCHOOL.\l"
	.string "If I don’t, ROXANNE will be steamed.$"

Route116_Text_1BD377:: @ 81BD377
	.string "I study at school, and I study on the\n"
	.string "way home, too!$"

Route116_Text_1BD3AC:: @ 81BD3AC
	.string "I’m in shock - I lost?$"

Route116_Text_1BD3C3:: @ 81BD3C3
	.string "Awww, I’ll never become an elegant\n"
	.string "TRAINER like ROXANNE this way!$"

Route116_Text_1BD405:: @ 81BD405
	.string "I studied a whole lot since I saw you.\n"
	.string "You must see my achievements!$"

Route116_Text_1BD44A:: @ 81BD44A
	.string "I’m in shock. I lost again?$"

Route116_Text_1BD466:: @ 81BD466
	.string "You’ve beaten ROXANNE?\n"
	.string "I can’t beat you, then. Not yet.$"

Route117_Text_1BD49E:: @ 81BD49E
	.string "Listen, could I get you to battle the\n"
	.string "POKéMON I’m raising?$"

Route117_Text_1BD4D9:: @ 81BD4D9
	.string "You’ve raised yours superbly...$"

Route117_Text_1BD4F9:: @ 81BD4F9
	.string "POKéMON isn’t all about power.\p"
	.string "Polishing a unique aspect of one’s\n"
	.string "character is another way of enjoying\l"
	.string "POKéMON.$"

Route117_Text_1BD569:: @ 81BD569
	.string "The POKéMON I’ve been raising are\n"
	.string "looking good, just like before.$"

Route117_Text_1BD5AB:: @ 81BD5AB
	.string "You know how to raise them properly.\n"
	.string "You might have DAY CARE skills...$"

Route117_Text_1BD5F2:: @ 81BD5F2
	.string "Your POKéMON are growing good!\n"
	.string "You should enter them in CONTESTS.$"

Route117_Text_1BD634:: @ 81BD634
	.string "Please, allow me to evaluate if you\n"
	.string "have raised your POKéMON properly.$"

Route117_Text_1BD67B:: @ 81BD67B
	.string "Yes, they are growing properly.$"

Route117_Text_1BD69B:: @ 81BD69B
	.string "If you feed {POKEBLOCK}S to POKéMON, the\n"
	.string "unique aspects of their character\l"
	.string "will be enhanced.$"

Route117_Text_1BD6F2:: @ 81BD6F2
	.string "Allow me to reevaluate if you have\n"
	.string "raised your POKéMON properly.$"

Route117_Text_1BD733:: @ 81BD733
	.string "They are growing admirably.$"

Route117_Text_1BD74F:: @ 81BD74F
	.string "POKéMON seem to like different kinds\n"
	.string "of {POKEBLOCK}S, depending on their nature.$"

Route117_Text_1BD79A:: @ 81BD79A
	.string "I’m in the middle of a triathlon, but,\n"
	.string "whatever, let’s have a battle!$"

Route117_Text_1BD7E0:: @ 81BD7E0
	.string "I ran out of energy!$"

Route117_Text_1BD7F5:: @ 81BD7F5
	.string "I may have blown it...\p"
	.string "I might have dropped to last during\n"
	.string "that battle...$"

Route117_Text_1BD83F:: @ 81BD83F
	.string "I’m smack in the middle of a triathlon,\n"
	.string "but I’m comfortably ahead.\l"
	.string "Let’s make this a quick battle!$"

Route117_Text_1BD8A2:: @ 81BD8A2
	.string "I ran out of energy again!$"

Route117_Text_1BD8BD:: @ 81BD8BD
	.string "I was tops in swimming and cycling, but\n"
	.string "I’m not quite that confident with\l"
	.string "POKéMON yet.$"

Route117_Text_1BD914:: @ 81BD914
	.string "I do my triathlon training with POKéMON,\n"
	.string "so I’m pretty confident about my speed.$"

Route117_Text_1BD965:: @ 81BD965
	.string "I need to get more practices in,\n"
	.string "I guess.$"

Route117_Text_1BD98F:: @ 81BD98F
	.string "Training is meaningful only if you\n"
	.string "keep it up regularly.\p"
	.string "Okay! I’ll resume my training!\n"
	.string "Tomorrow!$"

Route117_Text_1BD9F1:: @ 81BD9F1
	.string "Are you keeping up with your training?\n"
	.string "I sure am!\l"
	.string "Let me show you the evidence!$"

Route117_Text_1BDA41:: @ 81BDA41
	.string "I need to get more practices in,\n"
	.string "I guess.$"

Route117_Text_1BDA6B:: @ 81BDA6B
	.string "I’ll resume training tomorrow.\n"
	.string "Let’s battle again sometime!$"

Route117_Text_1BDAA7:: @ 81BDAA7
	.string "Once a BUG CATCHER!\n"
	.string "And now a BUG MANIAC!\p"
	.string "But my love for POKéMON remains\n"
	.string "unchanged!$"

Route117_Text_1BDAFC:: @ 81BDAFC
	.string "My ineptitude also remains\n"
	.string "unchanged...$"

Route117_Text_1BDB24:: @ 81BDB24
	.string "All I did was follow my heart, and now\n"
	.string "they call me a BUG MANIAC...\p"
	.string "Still, I am an expert on BUG POKéMON,\n"
	.string "so it’s only natural that they call me\l"
	.string "a BUG MANIAC.$"

Route117_Text_1BDBC3:: @ 81BDBC3
	.string "ANNA: I’m with my pretty junior student\n"
	.string "partner. I have to do good!$"

Route117_Text_1BDC07:: @ 81BDC07
	.string "ANNA: I’m with my pretty junior student\n"
	.string "partner! Let me win!$"

Route117_Text_1BDC44:: @ 81BDC44
	.string "ANNA: Your POKéMON have some good\n"
	.string "combinations.\p"
	.string "I’d say you’re second only to us!$"

Route117_Text_1BDC96:: @ 81BDC96
	.string "ANNA: If you want to battle us, bring\n"
	.string "two POKéMON with you.$"

Route117_Text_1BDCD2:: @ 81BDCD2
	.string "MEG: I’m going to tag up with my super\n"
	.string "senior student partner and beat you!$"

Route117_Text_1BDD1E:: @ 81BDD1E
	.string "MEG: Oh, no!\n"
	.string "I’m sorry, ANNA! I let you down...$"

Route117_Text_1BDD4E:: @ 81BDD4E
	.string "MEG: I dragged ANNA down...\n"
	.string "If I didn’t, she would have won!$"

Route117_Text_1BDD8B:: @ 81BDD8B
	.string "MEG: Do you only have one POKéMON?\n"
	.string "We can’t battle with you, then.\p"
	.string "We want to have a 2-on-2 battle.$"

Route117_Text_1BDDEF:: @ 81BDDEF
	.string "ANNA: I can’t keep losing in front of\n"
	.string "my junior partner, right?$"

Route117_Text_1BDE2F:: @ 81BDE2F
	.string "ANNA: I couldn’t get into the groove.$"

Route117_Text_1BDE55:: @ 81BDE55
	.string "ANNA: Your POKéMON have some good\n"
	.string "combinations.\p"
	.string "I’d say you’re second only to us!$"

Route117_Text_1BDEA7:: @ 81BDEA7
	.string "ANNA: If you want to battle us, bring\n"
	.string "two POKéMON with you.$"

Route117_Text_1BDEE3:: @ 81BDEE3
	.string "MEG: I’m going to tag up with my\n"
	.string "senior partner and win this time!$"

Route117_Text_1BDF26:: @ 81BDF26
	.string "MEG: Too strong!$"

Route117_Text_1BDF37:: @ 81BDF37
	.string "MEG: I battled together with my\n"
	.string "senior partner, but we lost...\p"
	.string "That’s so discouraging...$"

Route117_Text_1BDF90:: @ 81BDF90
	.string "MEG: Do you only have one POKéMON?\n"
	.string "We can’t battle with you, then.\p"
	.string "We want to have a 2-on-2 battle.$"

Route118_Text_1BDFF4:: @ 81BDFF4
	.string "The aroma of flowers has a magical\n"
	.string "power. It cleanses us body and soul.$"

Route118_Text_1BE03C:: @ 81BE03C
	.string "Oh, dear me.\n"
	.string "I seem to have lost.$"

Route118_Text_1BE05E:: @ 81BE05E
	.string "Flowers, POKéMON...\n"
	.string "I love whatever smells nice.\p"
	.string "Stinky things...\n"
	.string "I’ll pass.$"

Route118_Text_1BE0AB:: @ 81BE0AB
	.string "Were you drawn here by the sweet\n"
	.string "aroma?$"

Route118_Text_1BE0D3:: @ 81BE0D3
	.string "The power of aroma...\n"
	.string "It didn’t seem to do much.$"

Route118_Text_1BE104:: @ 81BE104
	.string "If you use a sweet aroma properly,\n"
	.string "POKéMON will be attracted by it.$"

Route118_Text_1BE148:: @ 81BE148
	.string "BIRD POKéMON that FLY elegantly in\n"
	.string "the sky... They’re the best!$"

Route118_Text_1BE188:: @ 81BE188
	.string "Urgh... I crashed...$"

Route118_Text_1BE19D:: @ 81BE19D
	.string "You’ve got great POKéMON.\n"
	.string "I’ll have to train mine better.$"

Route118_Text_1BE1D7:: @ 81BE1D7
	.string "Take flight!\n"
	.string "My BIRD POKéMON!$"

Route118_Text_1BE1F5:: @ 81BE1F5
	.string "They did take flight...$"

Route118_Text_1BE20D:: @ 81BE20D
	.string "If they’d get stronger, they’d be able\n"
	.string "to fly more freely...$"

Route118_Text_1BE24A:: @ 81BE24A
	.string "I’m a FISHERMAN, but also a TRAINER.\n"
	.string "I’m raising the POKéMON I caught.$"

Route118_Text_1BE291:: @ 81BE291
	.string "I thought I was doing okay in my\n"
	.string "training...$"

Route118_Text_1BE2BE:: @ 81BE2BE
	.string "I couldn’t win by training POKéMON\n"
	.string "while I fished...\p"
	.string "Was I doing things in half measures?$"

Route118_Text_1BE318:: @ 81BE318
	.string "For FISHERMEN, equipment is the key.\p"
	.string "But for TRAINERS, the key ingredients\n"
	.string "are POKéMON and heart, of course!$"

Route118_Text_1BE385:: @ 81BE385
	.string "I was beaten in heart?$"

Route118_Text_1BE39C:: @ 81BE39C
	.string "Come to think of it, fishing is a battle\n"
	.string "between a FISHERMAN and a POKéMON.$"

Route118_Text_1BE3E8:: @ 81BE3E8
	.string "Let my melody rock your soul!$"

Route118_Text_1BE406:: @ 81BE406
	.string "La-lalala...$"

Route118_Text_1BE413:: @ 81BE413
	.string "An electric guitar doesn’t always\n"
	.string "have to be noisy...\p"
	.string "It can be strummed to squeeze out\n"
	.string "this heart-stirring melody...$"

Route118_Text_1BE489:: @ 81BE489
	.string "A melody from my POKéMON and me...\n"
	.string "Let us deliver it to your soul.$"

Route118_Text_1BE4CC:: @ 81BE4CC
	.string "La-lalala...$"

Route118_Text_1BE4D9:: @ 81BE4D9
	.string "When I play, my emotions should reach\n"
	.string "you through my electric guitar...$"

Route119_Text_1BE521:: @ 81BE521
	.string "We’re the MIMIC CIRCLE!\n"
	.string "We MIMIC what you do!$"

Route119_Text_1BE54F:: @ 81BE54F
	.string "Whoopsie!\n"
	.string "I lost!$"

Route119_Text_1BE561:: @ 81BE561
	.string "What’s so good about mimicry?\p"
	.string "Fufufu...\n"
	.string "You’ll never understand...$"

Route119_Text_1BE5A4:: @ 81BE5A4
	.string "So, we finally meet!\n"
	.string "My BUG POKéMON will keep you company!$"

Route119_Text_1BE5DF:: @ 81BE5DF
	.string "I wish we’d never met...$"

Route119_Text_1BE5F8:: @ 81BE5F8
	.string "I want to MIMIC you some more.\p"
	.string "Can you hurry up and move?$"

Route119_Text_1BE632:: @ 81BE632
	.string "If you step forward, we step forward.\p"
	.string "If you turn right, we turn, too...$"

Route119_Text_1BE67B:: @ 81BE67B
	.string "But if you win, I lose...$"

Route119_Text_1BE695:: @ 81BE695
	.string "I can’t MIMIC you winning the match.\n"
	.string "That’s just impossible...\l"
	.string "It’s burning me up...$"

Route119_Text_1BE6EA:: @ 81BE6EA
	.string "Yep, you’ve finally caught me!\n"
	.string "Or were you trying to avoid me?$"

Route119_Text_1BE729:: @ 81BE729
	.string "Whoop, that was a great match!$"

Route119_Text_1BE748:: @ 81BE748
	.string "We’re the MIMIC CIRCLE!\n"
	.string "I hope you enjoyed our performance.$"

Route119_Text_1BE784:: @ 81BE784
	.string "You don’t know who I am, do you?\p"
	.string "But, I also don’t know you.\n"
	.string "So, we’ll battle!$"

Route119_Text_1BE7D3:: @ 81BE7D3
	.string "You’re pretty strong!$"

Route119_Text_1BE7E9:: @ 81BE7E9
	.string "Until you go away somewhere, we’ll\n"
	.string "keep on mimicking your every move.$"

Route119_Text_1BE82F:: @ 81BE82F
	.string "The MIMIC CIRCLE was formed by people\n"
	.string "who like to MIMIC.\p"
	.string "A battle starts the instant we meet!$"

Route119_Text_1BE88D:: @ 81BE88D
	.string "I surrender!$"

Route119_Text_1BE89A:: @ 81BE89A
	.string "Won’t you join our MIMIC CIRCLE?$"

Route119_Text_1BE8BB:: @ 81BE8BB
	.string "Who has the knowledge and the\n"
	.string "technique for survival?\p"
	.string "POKéMON RANGERS, that’s who!$"

Route119_Text_1BE90E:: @ 81BE90E
	.string "I didn’t have enough POKéMON\n"
	.string "know-how...$"

Route119_Text_1BE937:: @ 81BE937
	.string "To break away from civilization and\n"
	.string "awaken the wild spirit within!\p"
	.string "That’s our vision.$"

Route119_Text_1BE98D:: @ 81BE98D
	.string "I’m going to regain my wild spirit by\n"
	.string "being together with POKéMON.$"

Route119_Text_1BE9D0:: @ 81BE9D0
	.string "You’ve remained strong!$"

Route119_Text_1BE9E8:: @ 81BE9E8
	.string "Believe in your POKéMON.\n"
	.string "Believe in yourself.\p"
	.string "The road will reveal itself to you.$"

Route119_Text_1BEA3A:: @ 81BEA3A
	.string "Oh? Look at you.\p"
	.string "For someone on an adventure, you’re\n"
	.string "traveling awfully light.$"

Route119_Text_1BEA88:: @ 81BEA88
	.string "Accidents happen when you’re not\n"
	.string "prepared!$"

Route119_Text_1BEAB3:: @ 81BEAB3
	.string "You’re traveling light but you have\n"
	.string "everything you need.\p"
	.string "You’re on top of things mentally and\n"
	.string "physically, too.$"

Route119_Text_1BEB22:: @ 81BEB22
	.string "How’s your journey with POKéMON\n"
	.string "going?$"

Route119_Text_1BEB49:: @ 81BEB49
	.string "I’m still missing something...$"

Route119_Text_1BEB68:: @ 81BEB68
	.string "In the same way that you, as a TRAINER,\n"
	.string "rely on your POKéMON, your POKéMON\l"
	.string "rely on you.$"

Route119_Text_1BEBC0:: @ 81BEBC0
	.string "The vast sky holds untold promise!\p"
	.string "Nothing can compare to the sheer\n"
	.string "exhilaration of flight!$"

Route119_Text_1BEC1C:: @ 81BEC1C
	.string "Down and out!$"

Route119_Text_1BEC2A:: @ 81BEC2A
	.string "My BIRD POKéMON made my dreams of\n"
	.string "flying come true!$"

Route119_Text_1BEC5E:: @ 81BEC5E
	.string "I’ll show you the true potential of me\n"
	.string "and my BIRD POKéMON!$"

Route119_Text_1BEC9A:: @ 81BEC9A
	.string "We lacked potential...$"

Route119_Text_1BECB1:: @ 81BECB1
	.string "Ever since I was a little kid, I always\n"
	.string "admired BIRD POKéMON...$"

Route119_Text_1BECF1:: @ 81BECF1
	.string "To lurk in shadows, and live in\n"
	.string "darkness... That is my destiny.\p"
	.string "I emerge to challenge you!$"

Route119_Text_1BED4C:: @ 81BED4C
	.string "I admit defeat!$"

Route119_Text_1BED5C:: @ 81BED5C
	.string "Those defeated in battle withdraw\n"
	.string "quietly back into the shadows.\l"
	.string "That, too, is destiny...$"

Route119_Text_1BEDB6:: @ 81BEDB6
	.string "If you’re not on your guard, you’re in\n"
	.string "for some pain!$"

Route119_Text_1BEDEC:: @ 81BEDEC
	.string "You’re surprisingly good!$"

Route119_Text_1BEE06:: @ 81BEE06
	.string "My surprise attack ended in\n"
	.string "failure...$"

Route119_Text_1BEE2D:: @ 81BEE2D
	.string "To hide a tree, use a forest!$"

Route119_Text_1BEE4B:: @ 81BEE4B
	.string "I bow to your superiority.$"

Route119_Text_1BEE66:: @ 81BEE66
	.string "To hide a tree, use a forest!\n"
	.string "To hide a POKéMON, use a POKéMON!\p"
	.string "There is no deep, hidden meaning\n"
	.string "to that.$"

Route119_Text_1BEED0:: @ 81BEED0
	.string "You spoke to me...\n"
	.string "So you want to challenge me!\p"
	.string "Sure! I’ll try out the POKéMON I caught\n"
	.string "while SURFING!$"

Route119_Text_1BEF37:: @ 81BEF37
	.string "I don’t have a clue about what it\n"
	.string "takes to win.$"

Route119_Text_1BEF67:: @ 81BEF67
	.string "Go for a SURF on my POKéMON...\p"
	.string "Then fish off its back...\p"
	.string "It’s an indescribably luxuriant moment!$"

Route120_Text_1BEFC8:: @ 81BEFC8
	.string "Do you have any moves that can strike\n"
	.string "a flying POKéMON?$"

Route120_Text_1BF000:: @ 81BF000
	.string "You soared above me!$"

Route120_Text_1BF015:: @ 81BF015
	.string "The move FLY is convenient, don’t\n"
	.string "you think?\p"
	.string "While the POKéMON is flying, almost\n"
	.string "no moves can strike it.$"

Route120_Text_1BF07E:: @ 81BF07E
	.string "My POKéMON is strong!\n"
	.string "How about yours?$"

Route120_Text_1BF0A5:: @ 81BF0A5
	.string "Your POKéMON were stronger...$"

Route120_Text_1BF0C3:: @ 81BF0C3
	.string "A POKéMON that grows steadily is one\n"
	.string "you can count on.$"

Route120_Text_1BF0FA:: @ 81BF0FA
	.string "A POKéMON that grows steadily is one\n"
	.string "you can count on.$"

Route120_Text_1BF131:: @ 81BF131
	.string "Your POKéMON are seriously strong.$"

Route120_Text_1BF154:: @ 81BF154
	.string "My POKéMON are growing stronger.\n"
	.string "I have to grow stronger, too.$"

Route120_Text_1BF193:: @ 81BF193
	.string "I’ll check your POKéMON and see if\n"
	.string "they’re fit for the outdoors.$"

Route120_Text_1BF1D4:: @ 81BF1D4
	.string "With POKéMON that strong, you’re in\n"
	.string "no danger of needing rescue!$"

Route120_Text_1BF215:: @ 81BF215
	.string "To travel wherever your heart desires\n"
	.string "with POKéMON...\l"
	.string "That’s the joy of being a TRAINER.$"

Route120_Text_1BF26E:: @ 81BF26E
	.string "How’s your physical fitness?\n"
	.string "If you’re not fit, you could have a\l"
	.string "rough time in critical situations.$"

Route120_Text_1BF2D2:: @ 81BF2D2
	.string "I’m totally fit, but...$"

Route120_Text_1BF2EA:: @ 81BF2EA
	.string "Fitness training is in my routine.\n"
	.string "I always run with my POKéMON.$"

Route120_Text_1BF32B:: @ 81BF32B
	.string "... ... ... ... ... ...\n"
	.string "... ... ... ... ... ...\l"
	.string "Want to battle?$"

Route120_Text_1BF36B:: @ 81BF36B
	.string "... ... ... ... ... ...\n"
	.string "I lost...$"

Route120_Text_1BF38D:: @ 81BF38D
	.string "... ... ... ... ... ...\n"
	.string "... ... ... ... ... ...\l"
	.string "I’ll try harder...$"

Route120_Text_1BF3D0:: @ 81BF3D0
	.string "... ... ... ... ... ...\n"
	.string "... ... ... ... ... ...\l"
	.string "Want to battle again?$"

Route120_Text_1BF416:: @ 81BF416
	.string "... ... ... ... ... ...\n"
	.string "I lost again...$"

Route120_Text_1BF43E:: @ 81BF43E
	.string "... ... ... ... ... ...\n"
	.string "... ... ... ... ... ...\l"
	.string "I’ll try harder...\l"
	.string "For my precious BUG POKéMON...$"

Route120_Text_1BF4A0:: @ 81BF4A0
	.string "POKéMON have many special abilities.\n"
	.string "If you want to become a first-class\l"
	.string "TRAINER, learn about them.$"

Route120_Text_1BF504:: @ 81BF504
	.string "You’re obviously thinking.$"

Route120_Text_1BF51F:: @ 81BF51F
	.string "The special abilities of POKéMON\n"
	.string "will make battle styles change.$"

Route120_Text_1BF560:: @ 81BF560
	.string "Who might you be?\p"
	.string "Are you perhaps searching for ancient\n"
	.string "ruins that are rumored to possibly\l"
	.string "exist according to legend?$"

Route120_Text_1BF5D6:: @ 81BF5D6
	.string "What a disgraceful setback...$"

Route120_Text_1BF5F4:: @ 81BF5F4
	.string "That giant rock... I would like to\n"
	.string "believe it may indeed contain ancient\l"
	.string "ruins. But I see no entrance.$"

Route120_Text_1BF65B:: @ 81BF65B
	.string "Why am I carrying this parasol?\p"
	.string "I’ll tell you if you can win against me.$"

Route120_Text_1BF6A4:: @ 81BF6A4
	.string "A parasol can’t ward off POKéMON\n"
	.string "attacks...$"

Route120_Text_1BF6D0:: @ 81BF6D0
	.string "I don’t think strong sunlight is good\n"
	.string "for my POKéMON.\l"
	.string "So I shield them with my parasol.$"

Route120_Text_1BF728:: @ 81BF728
	.string "Me, POKéMON, and my parasol...\p"
	.string "If any one of them is missing, the\n"
	.string "picture of beauty will be ruined.$"

Route120_Text_1BF78C:: @ 81BF78C
	.string "You’ve completely ruined my beauty...$"

Route120_Text_1BF7B2:: @ 81BF7B2
	.string "A parasol wouldn’t suit you at all.\p"
	.string "Why, something like this would only\n"
	.string "get in your way.$"

Route120_Text_1BF80B:: @ 81BF80B
	.string "I will adopt the movements of POKéMON\n"
	.string "and create new ninja techniques.$"

Route120_Text_1BF852:: @ 81BF852
	.string "The creation of new ninja techniques\n"
	.string "is but a distant dream...$"

Route120_Text_1BF891:: @ 81BF891
	.string "Perhaps I ought to apprentice under\n"
	.string "a ninja sensei.$"

Route120_Text_1BF8C5:: @ 81BF8C5
	.string "We ninja conceal ourselves under our\n"
	.string "camouflage cloaks.\l"
	.string "I bet you didn’t know where I was!$"

Route120_Text_1BF920:: @ 81BF920
	.string "I lost!\n"
	.string "I should camouflage my shame!$"

Route120_Text_1BF946:: @ 81BF946
	.string "Our camouflage cloaks are all\n"
	.string "handmade.$"

Route121_Text_1BF96E:: @ 81BF96E
	.string "Will you play with my delightfully\n"
	.string "pretty POKéMON?$"

Route121_Text_1BF9A1:: @ 81BF9A1
	.string "This isn’t what I meant!$"

Route121_Text_1BF9BA:: @ 81BF9BA
	.string "I’m going to a CONTEST in LILYCOVE.\p"
	.string "My POKéMON should have no problem\n"
	.string "sweeping the MASTER CLASS.$"

Route121_Text_1BFA1B:: @ 81BFA1B
	.string "With my POKéMON, I have traveled the\n"
	.string "world’s four corners.\p"
	.string "You might say I have some confidence\n"
	.string "in my abilities.$"

Route121_Text_1BFA8C:: @ 81BFA8C
	.string "Ah, well played.$"

Route121_Text_1BFA9D:: @ 81BFA9D
	.string "I would like to circle the globe once\n"
	.string "again with my POKéMON.$"

Route121_Text_1BFADA:: @ 81BFADA
	.string "With my POKéMON, I have traveled the\n"
	.string "world’s four corners.\p"
	.string "You might say I have some confidence\n"
	.string "in my abilities.$"

Route121_Text_1BFB4B:: @ 81BFB4B
	.string "Ah, well played.$"

Route121_Text_1BFB5C:: @ 81BFB5C
	.string "Your POKéMON and you...\p"
	.string "Your prowess together will be\n"
	.string "considered strong, even overseas.$"

Route121_Text_1BFBB4:: @ 81BFBB4
	.string "There are powers beyond our\n"
	.string "understanding in the world...$"

Route121_Text_1BFBEE:: @ 81BFBEE
	.string "I have lost...$"

Route121_Text_1BFBFD:: @ 81BFBFD
	.string "MT. PYRE...\n"
	.string "There is a mysterious power\l"
	.string "at work there...$"

Route121_Text_1BFC36:: @ 81BFC36
	.string "KATE: Together, we’re fearless!\n"
	.string "We’ll demonstrate how tough we are!$"

Route121_Text_1BFC7A:: @ 81BFC7A
	.string "KATE: I blew it in front of my junior\n"
	.string "student partner...$"

Route121_Text_1BFCB3:: @ 81BFCB3
	.string "KATE: When someone’s relying on me,\n"
	.string "I get this urge to look cool in front\l"
	.string "of them...$"

Route121_Text_1BFD08:: @ 81BFD08
	.string "KATE: If you’ve only got one POKéMON,\n"
	.string "we can’t battle with you.\p"
	.string "That would be bullying.$"

Route121_Text_1BFD60:: @ 81BFD60
	.string "JOY: Together, we’re fearless!\n"
	.string "We’ll demonstrate how tough we are!$"

Route121_Text_1BFDA3:: @ 81BFDA3
	.string "JOY: Please forgive me, KATE!$"

Route121_Text_1BFDC1:: @ 81BFDC1
	.string "JOY: Ehehe, I’ll have to train with KATE,\n"
	.string "my senior student partner, again.$"

Route121_Text_1BFE0D:: @ 81BFE0D
	.string "JOY: You need at least two POKéMON\n"
	.string "if you’re going to challenge us!$"

Route121_Text_1BFE51:: @ 81BFE51
	.string "Stop! Have a good look at my precious\n"
	.string "POKéMON!$"

Route121_Text_1BFE80:: @ 81BFE80
	.string "Oh, how dare you!\n"
	.string "Don’t take it so seriously!$"

Route121_Text_1BFEAE:: @ 81BFEAE
	.string "Maybe I’ll go catch more POKéMON at\n"
	.string "the SAFARI.$"

Route121_Text_1BFEDE:: @ 81BFEDE
	.string "My precious POKéMON grew!\n"
	.string "Have a good look!$"

Route121_Text_1BFF0A:: @ 81BFF0A
	.string "Oh, how dare you!\n"
	.string "You still won’t take it easy!$"

Route121_Text_1BFF3A:: @ 81BFF3A
	.string "Maybe I’ll go catch more POKéMON at\n"
	.string "the SAFARI.$"

Route123_Text_1BFF6A:: @ 81BFF6A
	.string "Want to determine how strong you are?\n"
	.string "I’ll be the test!$"

Route123_Text_1BFFA2:: @ 81BFFA2
	.string "You passed with flying colors!$"

Route123_Text_1BFFC1:: @ 81BFFC1
	.string "To best even me...\n"
	.string "Your strength is marvelous!$"

Route123_Text_1BFFF0:: @ 81BFFF0
	.string "You seem to have a big collection\n"
	.string "of GYM BADGES.\p"
	.string "Let me see if you’re actually worthy of\n"
	.string "those BADGES!$"

Route123_Text_1C0057:: @ 81C0057
	.string "Oh, you’re worthy, all right!$"

Route123_Text_1C0075:: @ 81C0075
	.string "You did your BADGES proud in that\n"
	.string "match!$"

Route123_Text_1C009E:: @ 81C009E
	.string "They say that good times are filled\n"
	.string "with good aromas.$"

Route123_Text_1C00D4:: @ 81C00D4
	.string "Oh...\n"
	.string "I smell the bitter scent of misery...$"

Route123_Text_1C0100:: @ 81C0100
	.string "The BERRY MASTER’s garden is filled\n"
	.string "with uplifting fragrances.$"

Route123_Text_1C013F:: @ 81C013F
	.string "Being a psychic is about willpower.\p"
	.string "I’ve willed myself not to lose to\n"
	.string "anyone. That makes me strong!$"

Route123_Text_1C01A3:: @ 81C01A3
	.string "I feel sad...$"

Route123_Text_1C01B1:: @ 81C01B1
	.string "Being a psychic is about willpower.\n"
	.string "I thought I wouldn’t lose to you...$"

Route123_Text_1C01F9:: @ 81C01F9
	.string "I’ve convinced myself that I won’t\n"
	.string "lose anymore. That makes me strong!$"

Route123_Text_1C0240:: @ 81C0240
	.string "I feel sad...$"

Route123_Text_1C024E:: @ 81C024E
	.string "I should train at MT. PYRE...\n"
	.string "I’ll never beat you this way...$"

Route123_Text_1C028C:: @ 81C028C
	.string "Don’t be too happy if your POKéMON\n"
	.string "develop psychic powers.\p"
	.string "You need to refine those powers to\n"
	.string "make them really useful.$"

Route123_Text_1C0303:: @ 81C0303
	.string "Astounding!$"

Route123_Text_1C030F:: @ 81C030F
	.string "We all have psychic powers.\n"
	.string "We’ve just forgotten how to use them.$"

Route123_Text_1C0351:: @ 81C0351
	.string "Have you awoken the psychic powers\n"
	.string "within you?$"

Route123_Text_1C0380:: @ 81C0380
	.string "Astounding!$"

Route123_Text_1C038C:: @ 81C038C
	.string "Your power with POKéMON...\n"
	.string "That could be a psychic power, too.$"

Route123_Text_1C03CB:: @ 81C03CB
	.string "MIU: Hello, TRAINER. I hope your\n"
	.string "POKéMON won’t cry when they lose.$"

Route123_Text_1C040E:: @ 81C040E
	.string "MIU: Uh-oh, we lost.$"

Route123_Text_1C0423:: @ 81C0423
	.string "MIU: TRAINER, your POKéMON are\n"
	.string "strong because you are friends.$"

Route123_Text_1C0462:: @ 81C0462
	.string "MIU: It’s no fun to battle if you\n"
	.string "don’t have two POKéMON.$"

Route123_Text_1C049C:: @ 81C049C
	.string "YUKI: Okay!\n"
	.string "We’re beating the TRAINER’s POKéMON!$"

Route123_Text_1C04CD:: @ 81C04CD
	.string "YUKI: Uh-oh, we lost.$"

Route123_Text_1C04E3:: @ 81C04E3
	.string "YUKI: Why are you so strong?\n"
	.string "We’ve never lost before.$"

Route123_Text_1C0519:: @ 81C0519
	.string "YUKI: It’s no fun to battle if you\n"
	.string "don’t have two POKéMON.$"

Route123_Text_1C0554:: @ 81C0554
	.string "MT. PYRE...\n"
	.string "Where the spirits of POKéMON sleep...\l"
	.string "Will your POKéMON sleep?$"

Route123_Text_1C059F:: @ 81C059F
	.string "Overflowing with vitality...$"

Route123_Text_1C05BC:: @ 81C05BC
	.string "MT. PYRE...\n"
	.string "Where the spirits of POKéMON sleep...\p"
	.string "It must overflow with a power that\n"
	.string "soothes spirits...$"

Route124_Text_1C0624:: @ 81C0624
	.string "Hey, are you lost at sea?\p"
	.string "If you can beat my POKéMON, I can\n"
	.string "serve as your pilot.$"

Route124_Text_1C0675:: @ 81C0675
	.string "I lost my bearings in battle!$"

Route124_Text_1C0693:: @ 81C0693
	.string "Many people lose their bearings at sea.\p"
	.string "If you’re that sort, you should refer\n"
	.string "to the POKéNAV’s MAP.$"

Route124_Text_1C06F7:: @ 81C06F7
	.string "Hm! You’re riding a POKéMON instead\n"
	.string "of swimming yourself...\p"
	.string "I am envious!$"

Route124_Text_1C0741:: @ 81C0741
	.string "Oh!\n"
	.string "I can’t...$"

Route124_Text_1C0750:: @ 81C0750
	.string "I’m getting chilled...\n"
	.string "I’ve been in the water too long...\p"
	.string "I wish I could ride a POKéMON like you...$"

Route124_Text_1C07B4:: @ 81C07B4
	.string "If you just float in the sea like\n"
	.string "this, POKéMON come around to play.$"

Route124_Text_1C07F9:: @ 81C07F9
	.string "Oh...\n"
	.string "Lost at sea...$"

Route124_Text_1C080E:: @ 81C080E
	.string "While swimming, I noticed that some\n"
	.string "POKéMON attack, and some just watch.\p"
	.string "I guess POKéMON have personalities\n"
	.string "of their own.$"

Route124_Text_1C0888:: @ 81C0888
	.string "If you just float in the sea like this,\n"
	.string "TRAINERS challenge you!$"

Route124_Text_1C08C8:: @ 81C08C8
	.string "That’s strange...\n"
	.string "I lost again...$"

Route124_Text_1C08EA:: @ 81C08EA
	.string "This has nothing to do with anything,\n"
	.string "but maybe I’ll visit the TRICK HOUSE.$"

Route124_Text_1C0936:: @ 81C0936
	.string "I’m growing bored of swimming...\n"
	.string "How about a battle?$"

Route124_Text_1C096B:: @ 81C096B
	.string "I had no idea that you were\n"
	.string "this strong!$"

Route124_Text_1C0994:: @ 81C0994
	.string "All the effort you put in must have\n"
	.string "made you this strong.$"

Route124_Text_1C09CE:: @ 81C09CE
	.string "Fufufufu... I dive deep underwater\n"
	.string "to go deep under cover.\l"
	.string "Plumbing the depths is where I excel!$"

Route124_Text_1C0A2F:: @ 81C0A2F
	.string "Glub, glub, glub...\n"
	.string "I’m sinking...$"

Route124_Text_1C0A52:: @ 81C0A52
	.string "I have it on good authority that\n"
	.string "there’s a DIVE spot around here.\p"
	.string "It gives me the urge to go deep\n"
	.string "again...$"

Route124_Text_1C0ABD:: @ 81C0ABD
	.string "RITA: Sigh...\p"
	.string "Here I am in the sea, but who’s with me?\n"
	.string "My little brother!\p"
	.string "Let’s battle so I won’t have to dwell\n"
	.string "on that!$"

Route124_Text_1C0B36:: @ 81C0B36
	.string "RITA: SAM! It’s your fault we lost!\n"
	.string "You’re in for it later!$"

Route124_Text_1C0B72:: @ 81C0B72
	.string "RITA: Sigh...\p"
	.string "If only it wasn’t my little brother\n"
	.string "next to me, but a nice boyfriend...$"

Route124_Text_1C0BC8:: @ 81C0BC8
	.string "RITA: You’re planning to battle us?\n"
	.string "Not unless you have more POKéMON.$"

Route124_Text_1C0C0E:: @ 81C0C0E
	.string "SAM: My big sister is tough at POKéMON!\p"
	.string "Don’t cry when you lose!$"

Route124_Text_1C0C4F:: @ 81C0C4F
	.string "SAM: Uh-oh...\n"
	.string "My big sister will chew me out...$"

Route124_Text_1C0C7F:: @ 81C0C7F
	.string "SAM: My big sister is really scary\n"
	.string "when she gets angry.\p"
	.string "That’s why she doesn’t have a\n"
	.string "boyfriend.$"

Route124_Text_1C0CE0:: @ 81C0CE0
	.string "SAM: Did you want to battle us?\n"
	.string "Bring some more POKéMON, then.$"

Route124_Text_1C0D1F:: @ 81C0D1F
	.string "RITA: Sigh...\p"
	.string "Here I am in the sea, but who’s with me?\n"
	.string "My little brother!\p"
	.string "Oh, hi, it’s been a while. Let’s battle\n"
	.string "so I won’t have to dwell on things!$"

Route124_Text_1C0DB5:: @ 81C0DB5
	.string "RITA: SAM!\n"
	.string "It’s your fault we lost again!\p"
	.string "We’re having a training session later!$"

Route124_Text_1C0E06:: @ 81C0E06
	.string "RITA: Sigh...\p"
	.string "If I had a nice boyfriend, we’d beat\n"
	.string "anyone with lovely combinations...$"

Route124_Text_1C0E5C:: @ 81C0E5C
	.string "RITA: You’re planning to battle us?\n"
	.string "Not unless you have more POKéMON.$"

Route124_Text_1C0EA2:: @ 81C0EA2
	.string "SAM: If we lose, I’ll catch heck.\n"
	.string "I’m going to go totally all out!$"

Route124_Text_1C0EE5:: @ 81C0EE5
	.string "SAM: Uh-oh...\n"
	.string "My big sister will chew me out again.$"

Route124_Text_1C0F19:: @ 81C0F19
	.string "SAM: My big sister is really scary\n"
	.string "when she gets angry.\p"
	.string "She’s going to make me train really\n"
	.string "hard with POKéMON later...$"

Route124_Text_1C0F90:: @ 81C0F90
	.string "SAM: Did you want to battle us?\n"
	.string "Bring some more POKéMON, then.$"

	.include "data/maps/text/Route125.s"
	.include "data/maps/text/Route126.s"
	.include "data/maps/text/Route127.s"
Route128_Text_1C1C67:: @ 81C1C67
	.string "EVER GRANDE CITY is still a long ways\n"
	.string "away...$"

Route128_Text_1C1C95:: @ 81C1C95
	.string "My first victory seems to be far\n"
	.string "away, too...$"

Route128_Text_1C1CC3:: @ 81C1CC3
	.string "My whole life has been about losing,\n"
	.string "but I will never give up!$"

Route128_Text_1C1D02:: @ 81C1D02
	.string "I’m still feeling good. I’ll keep on\n"
	.string "swimming to EVER GRANDE CITY.$"

Route128_Text_1C1D45:: @ 81C1D45
	.string "I’ve yet to taste my first victory...$"

Route128_Text_1C1D6B:: @ 81C1D6B
	.string "I’ll eventually reach EVER GRANDE CITY\n"
	.string "where I can eventually win...$"

Route128_Text_1C1DB0:: @ 81C1DB0
	.string "You have to swim, cycle, and then run\n"
	.string "a marathon in a triathlon.\p"
	.string "It’s a grueling race that consists\n"
	.string "of three events.$"

Route128_Text_1C1E25:: @ 81C1E25
	.string "A POKéMON battle is grueling, too...$"

Route128_Text_1C1E4A:: @ 81C1E4A
	.string "I have to ride a BIKE next, but...\n"
	.string "I’m about to throw in the towel...$"

Route128_Text_1C1E90:: @ 81C1E90
	.string "A triathlon is long. But I guess the\n"
	.string "road to become the POKéMON CHAMPION\l"
	.string "is also a long and grueling one.$"

Route128_Text_1C1EFA:: @ 81C1EFA
	.string "A POKéMON battle really is harsh\n"
	.string "and unforgiving...$"

Route128_Text_1C1F2E:: @ 81C1F2E
	.string "You should give serious thought to\n"
	.string "challenges on VICTORY ROAD.$"

Route128_Text_1C1F6D:: @ 81C1F6D
	.string "We’ve been working so hard to mount\n"
	.string "a POKéMON LEAGUE challenge...\p"
	.string "We can’t afford to lose now!$"

Route128_Text_1C1FCC:: @ 81C1FCC
	.string "Oh!\n"
	.string "How could this happen?!$"

Route128_Text_1C1FE8:: @ 81C1FE8
	.string "After all I’ve done to get here, I won’t\n"
	.string "give up after one setback.$"

Route128_Text_1C202C:: @ 81C202C
	.string "There is no stronger TRAINER than I!$"

Route128_Text_1C2051:: @ 81C2051
	.string "This can’t be!$"

Route128_Text_1C2060:: @ 81C2060
	.string "There probably is no stronger TRAINER\n"
	.string "than you!$"

Route128_Text_1C2090:: @ 81C2090
	.string "I want to visit EVER GRANDE, so I\n"
	.string "caught myself a POKéMON that knows\l"
	.string "the move WATERFALL to crest the falls.$"

Route128_Text_1C20FC:: @ 81C20FC
	.string "I’m crestfallen!$"

Route128_Text_1C210D:: @ 81C210D
	.string "Awww, phooey!\p"
	.string "My POKéMON know WATERFALL, but\n"
	.string "I don’t have the SOOTOPOLIS GYM BADGE!$"

	.include "data/maps/text/Route129.s"
	.include "data/maps/text/Route130.s"
	.include "data/maps/text/Route131.s"
	.include "data/maps/text/Route132.s"
	.include "data/maps/text/Route133.s"
	.include "data/maps/text/Route134.s"
	.global gUnknown_081C33E6
gUnknown_081C33E6: @ 81C33E6
	.incbin "baserom.gba", 0x001c33e6, 0x24

	.global gUnknown_081C340A
gUnknown_081C340A: @ 81C340A
	.incbin "baserom.gba", 0x001c340a, 0x23

	.global gUnknown_081C342D
gUnknown_081C342D: @ 81C342D
	.incbin "baserom.gba", 0x001c342d, 0x1b

	.global gUnknown_081C3448
gUnknown_081C3448: @ 81C3448
	.incbin "baserom.gba", 0x001c3448, 0x11

	.global gUnknown_081C3459
gUnknown_081C3459: @ 81C3459
	.incbin "baserom.gba", 0x001c3459, 0x11

	.global gUnknown_081C346A
gUnknown_081C346A: @ 81C346A

	.incbin "baserom.gba", 0x1c346a, 0x166

	.include "data/maps/text/Route121_SafariZoneEntrance.s"
	.include "data/maps/text/SafariZone_Southeast.s"
	.include "data/maps/text/SafariZone_Southwest.s"
	.include "data/maps/text/SafariZone_Northwest.s"
	.include "data/maps/text/SafariZone_Northeast.s"
SafariZone_Southeast_Text_1C3DCE:: @ 81C3DCE
	.string "I put a {POKEBLOCK} on the {POKEBLOCK} FEEDER.\n"
	.string "But it seems to have disappeared.\p"
	.string "I guess POKéMON must have eaten it\n"
	.string "without me noticing.$"

Route121_SafariZoneEntrance_Text_1C3E4B:: @ 81C3E4B
	.string "SAFARI ZONE TRAINER TIP!\p"
	.string "Throw {POKEBLOCK}S at wild POKéMON to make\n"
	.string "them less likely to flee.$"

SafariZone_Southwest_Text_1C3EA3:: @ 81C3EA3
	.string "“Relieve your tired feet.”\n"
	.string "REST HOUSE$"

	.include "data/maps/text/SafariZone_RestHouse.s"
MauvilleCity_GameCorner_EventScript_1C407E:: @ 81C407E
	checkitem ITEM_COIN_CASE, 1
	compare RESULT, 0
	jumpeq MauvilleCity_GameCorner_EventScript_1572B5
	setvar 0x8004, 0
	event_96 2
	compare RESULT, 0
	jumpeq MauvilleCity_GameCorner_EventScript_1C40DA
	addvar 0x8004, 128
	jump MauvilleCity_GameCorner_EventScript_1C40DA
	end

MauvilleCity_GameCorner_EventScript_1C40AC:: @ 81C40AC
	checkitem ITEM_COIN_CASE, 1
	compare RESULT, 0
	jumpeq MauvilleCity_GameCorner_EventScript_1572B5
	setvar 0x8004, 1
	event_96 2
	compare RESULT, 0
	jumpeq MauvilleCity_GameCorner_EventScript_1C40DA
	addvar 0x8004, 128
	jump MauvilleCity_GameCorner_EventScript_1C40DA
	end

MauvilleCity_GameCorner_EventScript_1C40DA:: @ 81C40DA
	special 162
	waitstate
	end

	.global gUnknown_081C40DF
gUnknown_081C40DF: @ 81C40DF
	.incbin "baserom.gba", 0x001c40df, 0x3d

	.global gUnknown_081C411C
gUnknown_081C411C: @ 81C411C
	.incbin "baserom.gba", 0x001c411c, 0x1d

	.global gUnknown_081C4139
gUnknown_081C4139: @ 81C4139
	.incbin "baserom.gba", 0x001c4139, 0x1e

	.global gUnknown_081C4157
gUnknown_081C4157: @ 81C4157
	.incbin "baserom.gba", 0x001c4157, 0x42

	.global gUnknown_081C4199
gUnknown_081C4199: @ 81C4199
	.incbin "baserom.gba", 0x001c4199, 0xc

	.global gUnknown_081C41A5
gUnknown_081C41A5: @ 81C41A5
	.incbin "baserom.gba", 0x001c41a5, 0x9

	.global gUnknown_081C41AE
gUnknown_081C41AE: @ 81C41AE
	.incbin "baserom.gba", 0x001c41ae, 0xf

	.global gUnknown_081C41BD
gUnknown_081C41BD: @ 81C41BD
	.incbin "baserom.gba", 0x001c41bd, 0x15

	.global gUnknown_081C41D2
gUnknown_081C41D2: @ 81C41D2
	.incbin "baserom.gba", 0x001c41d2, 0x11

	.global gUnknown_081C41E3
gUnknown_081C41E3: @ 81C41E3
	.incbin "baserom.gba", 0x001c41e3, 0xe

	.global gUnknown_081C41F1
gUnknown_081C41F1: @ 81C41F1
	.incbin "baserom.gba", 0x001c41f1, 0x40

	.global gUnknown_081C4231
gUnknown_081C4231: @ 81C4231

	.incbin "baserom.gba", 0x1c4231, 0x218

Route101_Text_1C4449:: @ 81C4449
	.string "PROF. BIRCH: Ah, {PLAYER}{KUN}!\p"
	.string "Have you come to show me how your\n"
	.string "POKéDEX is coming along?$"

Route101_Text_1C449B:: @ 81C449B
	.string "Hm? Oh, you haven’t caught enough\n"
	.string "POKéMON to make it worthwhile.$"

Route101_Text_1C44DC:: @ 81C44DC
	.string "Hmhm...\p"
	.string "So, you’ve seen {STR_VAR_1} POKéMON,\n"
	.string "and you’ve caught {STR_VAR_2} POKéMON...$"

	.global gUnknown_081C4520
gUnknown_081C4520: @ 81C4520
	.incbin "baserom.gba", 0x001c4520, 0x4a

	.global gUnknown_081C456A
gUnknown_081C456A: @ 81C456A
	.incbin "baserom.gba", 0x001c456a, 0x46

	.global gUnknown_081C45B0
gUnknown_081C45B0: @ 81C45B0
	.incbin "baserom.gba", 0x001c45b0, 0x49

	.global gUnknown_081C45F9
gUnknown_081C45F9: @ 81C45F9
	.incbin "baserom.gba", 0x001c45f9, 0x4f

	.global gUnknown_081C4648
gUnknown_081C4648: @ 81C4648
	.incbin "baserom.gba", 0x001c4648, 0x36

	.global gUnknown_081C467E
gUnknown_081C467E: @ 81C467E
	.incbin "baserom.gba", 0x001c467e, 0x3b

	.global gUnknown_081C46B9
gUnknown_081C46B9: @ 81C46B9
	.incbin "baserom.gba", 0x001c46b9, 0x45

	.global gUnknown_081C46FE
gUnknown_081C46FE: @ 81C46FE
	.incbin "baserom.gba", 0x001c46fe, 0x49

	.global gUnknown_081C4747
gUnknown_081C4747: @ 81C4747
	.incbin "baserom.gba", 0x001c4747, 0x39

	.global gUnknown_081C4780
gUnknown_081C4780: @ 81C4780
	.incbin "baserom.gba", 0x001c4780, 0x5f

	.global gUnknown_081C47DF
gUnknown_081C47DF: @ 81C47DF
	.incbin "baserom.gba", 0x001c47df, 0x49

	.global gUnknown_081C4828
gUnknown_081C4828: @ 81C4828
	.incbin "baserom.gba", 0x001c4828, 0x3b

	.global gUnknown_081C4863
gUnknown_081C4863: @ 81C4863
	.incbin "baserom.gba", 0x001c4863, 0x39

	.global gUnknown_081C489C
gUnknown_081C489C: @ 81C489C
	.incbin "baserom.gba", 0x001c489c, 0x4f

	.global gUnknown_081C48EB
gUnknown_081C48EB: @ 81C48EB
	.incbin "baserom.gba", 0x001c48eb, 0x4b

	.global gUnknown_081C4936
gUnknown_081C4936: @ 81C4936
	.incbin "baserom.gba", 0x001c4936, 0x6c

	.global gUnknown_081C49A2
gUnknown_081C49A2: @ 81C49A2
	.incbin "baserom.gba", 0x001c49a2, 0x64

	.global gUnknown_081C4A06
gUnknown_081C4A06: @ 81C4A06
	.incbin "baserom.gba", 0x001c4a06, 0x49

	.global gUnknown_081C4A4F
gUnknown_081C4A4F: @ 81C4A4F
	.incbin "baserom.gba", 0x001c4a4f, 0x42

	.global gUnknown_081C4A91
gUnknown_081C4A91: @ 81C4A91
	.incbin "baserom.gba", 0x001c4a91, 0x49

	.global gUnknown_081C4ADA
gUnknown_081C4ADA: @ 81C4ADA

	.incbin "baserom.gba", 0x1c4ada, 0x2b

Route101_Text_1C4B05:: @ 81C4B05
	.string "Hmhm...\n"
	.string "On a nationwide basis...\p"
	.string "You’ve seen {STR_VAR_1} POKéMON,\n"
	.string "and you’ve caught {STR_VAR_2} POKéMON...$"

LilycoveCity_DepartmentStore_1F_Text_1C4B5E:: @ 81C4B5E
	.string "This is the POKéMON LOTTERY CORNER.\p"
	.string "All shoppers visiting our DEPARTMENT\n"
	.string "STORE get to draw a POKéMON LOTO\l"
	.string "TICKET.\p"
	.string "If the LOTO TICKET’s number matches\n"
	.string "the ID number of any of your POKéMON,\l"
	.string "you will receive a fabulous gift.\p"
	.string "Would you like to draw a POKéMON\n"
	.string "LOTO TICKET?$"

LilycoveCity_DepartmentStore_1F_Text_1C4C6A:: @ 81C4C6A
	.string "Please come back tomorrow.$"

LilycoveCity_DepartmentStore_1F_Text_1C4C85:: @ 81C4C85
	.string "Please do visit us again.$"

	.incbin "baserom.gba", 0x1c4c9f, 0x27

LilycoveCity_DepartmentStore_1F_Text_1C4CC6:: @ 81C4CC6
	.string "Please pick a LOTO TICKET.\n"
	.string "...{PAUSE}{0x39} ...{PAUSE}{0x39} ...{PAUSE}{0x39}$"

LilycoveCity_DepartmentStore_1F_Text_1C4CF6:: @ 81C4CF6
	.string "The LOTO TICKET number is {STR_VAR_1}.\p"
	.string "I need to run a check on this number\n"
	.string "to see if it matches any of your\l"
	.string "POKéMON’s ID numbers. Please wait.$"

LilycoveCity_DepartmentStore_1F_Text_1C4D7D:: @ 81C4D7D
	.string "Congratulations!\p"
	.string "The ID number of your team’s\n"
	.string "{STR_VAR_1} matches your LOTO TICKET’s\l"
	.string "number!$"

LilycoveCity_DepartmentStore_1F_Text_1C4DD1:: @ 81C4DD1
	.string "Congratulations!\p"
	.string "The ID number of your PC-boxed\n"
	.string "{STR_VAR_1} matches your LOTO TICKET’s\l"
	.string "number!$"

LilycoveCity_DepartmentStore_1F_Text_1C4E27:: @ 81C4E27
	.string "I’m sorry.\n"
	.string "None of the numbers matched.$"

LilycoveCity_DepartmentStore_1F_Text_1C4E4F:: @ 81C4E4F
	.string "Two digits matched, so you win the\n"
	.string "third prize!\l"
	.string "You’ve won the {STR_VAR_1}!$"

LilycoveCity_DepartmentStore_1F_Text_1C4E92:: @ 81C4E92
	.string "Three digits matched, so you win the\n"
	.string "second prize!\l"
	.string "You’ve won the {STR_VAR_1}!$"

LilycoveCity_DepartmentStore_1F_Text_1C4ED8:: @ 81C4ED8
	.string "Four digits matched, so you win the\n"
	.string "first prize!\l"
	.string "You’ve won the {STR_VAR_1}!$"

LilycoveCity_DepartmentStore_1F_Text_1C4F1C:: @ 81C4F1C
	.string "Oh, my goodness, all five digits matched!\p"
	.string "You’ve won the jackpot prize!\n"
	.string "You’ve won the {STR_VAR_1}!$"

LilycoveCity_DepartmentStore_1F_Text_1C4F77:: @ 81C4F77
	.string "Oh?\n"
	.string "You seem to have no room for this.\p"
	.string "Please make room in your BAG and\n"
	.string "let me know.$"

LilycoveCity_DepartmentStore_1F_Text_1C4FCC:: @ 81C4FCC
	.string "{PLAYER}?\n"
	.string "Yes, I’ve been expecting you.\p"
	.string "This is the prize we’ve been holding\n"
	.string "for you.$"

LilycoveCity_DepartmentStore_1F_Text_1C501C:: @ 81C501C
	.string "Please do visit again.$"

	.incbin "baserom.gba", 0x1c5033, 0xbf

LilycoveCity_Harbor_Text_1C50F2:: @ 81C50F2
	.string "The ferry to SLATEPORT is...\p"
	.string "Oh?\n"
	.string "That PASS...$"

LilycoveCity_Harbor_Text_1C5120:: @ 81C5120
	.string "Aye, mate, are you the one who brought\n"
	.string "that mighty odd PASS?\p"
	.string "I’ll tell you, you’re trying to reach a\n"
	.string "tiny spit of an island far in the south.\p"
	.string "There’s no telling what we’ll encounter\n"
	.string "once we reach there, aye.\l"
	.string "That shivers my timbers!\p"
	.string "All aboard!$"

	.include "data/maps/text/SouthernIsland_Exterior.s"
	.include "data/maps/text/SouthernIsland_Interior.s"
SouthernIsland_Exterior_Text_1C52FB:: @ 81C52FB
	.string "“Those whose memories fade seek to\n"
	.string "carve them in their hearts...”$"

Underwater_SealedChamber_Braille_1C533D:: @ 81C533D
	.byte 3
	.byte 6
	.byte 27
	.byte 13
	.byte 5
	.byte 9
	.braille "GO UP HERE.$"

SealedChamber_OuterRoom_Braille_1C534F:: @ 81C534F
	.byte 9
	.byte 6
	.byte 19
	.byte 13
	.byte 12
	.byte 9
	.braille "ABC$"

SealedChamber_OuterRoom_Braille_1C5359:: @ 81C5359
	.byte 9
	.byte 6
	.byte 19
	.byte 13
	.byte 12
	.byte 9
	.braille "GHI$"

SealedChamber_OuterRoom_Braille_1C5363:: @ 81C5363
	.byte 9
	.byte 6
	.byte 19
	.byte 13
	.byte 12
	.byte 9
	.braille "MNO$"

SealedChamber_OuterRoom_Braille_1C536D:: @ 81C536D
	.byte 9
	.byte 6
	.byte 19
	.byte 13
	.byte 12
	.byte 9
	.braille "TUV$"

SealedChamber_OuterRoom_Braille_1C5377:: @ 81C5377
	.byte 9
	.byte 6
	.byte 19
	.byte 13
	.byte 12
	.byte 9
	.braille "DEF$"

SealedChamber_OuterRoom_Braille_1C5381:: @ 81C5381
	.byte 9
	.byte 6
	.byte 19
	.byte 13
	.byte 12
	.byte 9
	.braille "JKL$"

SealedChamber_OuterRoom_Braille_1C538B:: @ 81C538B
	.byte 7
	.byte 6
	.byte 21
	.byte 13
	.byte 11
	.byte 9
	.braille "PQRS$"

SealedChamber_OuterRoom_Braille_1C5396:: @ 81C5396
	.byte 10
	.byte 6
	.byte 18
	.byte 13
	.byte 14
	.byte 9
	.braille ".$"

SealedChamber_OuterRoom_Braille_1C539E:: @ 81C539E
	.byte 7
	.byte 6
	.byte 21
	.byte 13
	.byte 11
	.byte 9
	.braille "WXYZ$"

SealedChamber_OuterRoom_Braille_1C53A9:: @ 81C53A9
	.byte 10
	.byte 6
	.byte 18
	.byte 13
	.byte 14
	.byte 9
	.braille ",$"

SealedChamber_OuterRoom_Braille_1C53B1:: @ 81C53B1
	.byte 5
	.byte 6
	.byte 25
	.byte 13
	.byte 7
	.byte 9
	.braille "DIG HERE.$"

SealedChamber_InnerRoom_Braille_1C53C1:: @ 81C53C1
	.byte 3
	.byte 0
	.byte 27
	.byte 19
	.byte 5
	.byte 3
	.braille "FIRST COMES\n"
	.braille "RELICANTH.\n"
	.braille "LAST COMES\n"
	.braille "WAILORD.$"

SealedChamber_InnerRoom_Braille_1C53F2:: @ 81C53F2
	.byte 6
	.byte 0
	.byte 22
	.byte 19
	.byte 8
	.byte 3
	.braille "IN THIS\n"
	.braille "CAVE WE\n"
	.braille "HAVE\n"
	.braille "LIVED.$"

SealedChamber_InnerRoom_Braille_1C5414:: @ 81C5414
	.byte 4
	.byte 2
	.byte 26
	.byte 17
	.byte 6
	.byte 5
	.braille "WE OWE ALL\n"
	.braille "TO THE\n"
	.braille "POKEMON.$"

SealedChamber_InnerRoom_Braille_1C5435:: @ 81C5435
	.byte 3
	.byte 0
	.byte 25
	.byte 19
	.byte 5
	.byte 3
	.braille "BUT, WE\n"
	.braille "SEALED THE\n"
	.braille "POKEMON\n"
	.braille "AWAY.$"

SealedChamber_InnerRoom_Braille_1C545C:: @ 81C545C
	.byte 1
	.byte 6
	.byte 29
	.byte 13
	.byte 3
	.byte 9
	.braille "WE FEARED IT.$"

SealedChamber_InnerRoom_Braille_1C5470:: @ 81C5470
	.byte 4
	.byte 0
	.byte 26
	.byte 19
	.byte 6
	.byte 3
	.braille "THOSE WITH\n"
	.braille "COURAGE,\n"
	.braille "THOSE WITH\n"
	.braille "HOPE.$"

SealedChamber_InnerRoom_Braille_1C549B:: @ 81C549B
	.byte 2
	.byte 0
	.byte 28
	.byte 19
	.byte 4
	.byte 3
	.braille "OPEN A DOOR.\n"
	.braille "AN ETERNAL\n"
	.braille "POKEMON\n"
	.braille "WAITS.$"

DesertRuins_Braille_1C54C8:: @ 81C54C8
	.byte 0
	.byte 0
	.byte 29
	.byte 19
	.byte 2
	.byte 3
	.braille "RIGHT, RIGHT,\n"
	.braille "DOWN, DOWN.\n"
	.braille "THEN, USE\n"
	.braille "STRENGTH.$"

IslandCave_Braille_1C54FC:: @ 81C54FC
	.byte 3
	.byte 0
	.byte 27
	.byte 19
	.byte 5
	.byte 3
	.braille "STOP AND\n"
	.braille "WAIT. WAIT\n"
	.braille "FOR TIME TO\n"
	.braille "PASS TWICE.$"

AncientTomb_Braille_1C552E:: @ 81C552E
	.byte 0
	.byte 0
	.byte 29
	.byte 19
	.byte 1
	.byte 3
	.braille "WITH NEW TIME,\n"
	.braille "HOPE AND LOVE,\n"
	.braille "AIM TO THE SKY\n"
	.braille "IN THE MIDDLE.$"

PetalburgCity_Gym_Text_1C5570:: @ 81C5570
	.string "DAD: Hi, {PLAYER}!\p"
	.string "I just received a very rare BERRY.\n"
	.string "I’d like you to have it.$"

Route104_Text_1C55B9:: @ 81C55B9
	.string "If you see BERRIES growing in loamy\n"
	.string "soil, feel free to take them.\p"
	.string "But make sure you plant a BERRY in the\n"
	.string "same spot. That’s common courtesy.\p"
	.string "Here, I’ll share this with you.$"

Route104_Text_1C5665:: @ 81C5665
	.string "The way you look, you must be a\n"
	.string "TRAINER, no?\p"
	.string "TRAINERS often make POKéMON hold\n"
	.string "BERRIES.\p"
	.string "It’s up to you whether to grow BERRIES\n"
	.string "or use them.$"

Route111_Text_1C56F0:: @ 81C56F0
	.string "I watered my plants lots and lots!\n"
	.string "A whole bunch of flowers bloomed!\p"
	.string "And then a whole bunch of BERRIES\n"
	.string "appeared!\p"
	.string "Here you go!\n"
	.string "You can have this!$"

Route111_Text_1C5781:: @ 81C5781
	.string "I’m going to try really hard and make\n"
	.string "some RED {POKEBLOCK}S!\p"
	.string "I hope you try hard, too!$"

Route111_Text_1C57D2:: @ 81C57D2
	.string "I wonder what color BERRIES I’ll look\n"
	.string "for today?$"

Route114_Text_1C5803:: @ 81C5803
	.string "I’m gathering BERRIES so I can win a\n"
	.string "POKéMON CONTEST.\p"
	.string "If you’d like, I’ll share one with you.$"

Route114_Text_1C5861:: @ 81C5861
	.string "Good luck to you, too!$"

Route114_Text_1C5878:: @ 81C5878
	.string "What BERRIES should I plant today?\n"
	.string "What color {POKEBLOCK}S should I make?\p"
	.string "Fretting over stuff like that is fun\n"
	.string "in its own way.$"

Route120_Text_1C58F1:: @ 81C58F1
	.string "Give the case a shake, and out pops\n"
	.string "a {POKEBLOCK}...\p"
	.string "And that {POKEBLOCK} is caught and eaten\n"
	.string "by a POKéMON...\p"
	.string "It’s an expression of love, isn’t it?$"

Route120_Text_1C5979:: @ 81C5979
	.string "Yes, yes.\n"
	.string "You understand what I mean.\p"
	.string "You should take this.$"

Route120_Text_1C59B5:: @ 81C59B5
	.string "Oh... But it is important to make your\n"
	.string "own impressions, I guess...\p"
	.string "You can have this.$"

Route120_Text_1C5A0B:: @ 81C5A0B
	.string "I think that BERRY is rare.\n"
	.string "I hope you raise it with loving care.$"

Route120_Text_1C5A4D:: @ 81C5A4D
	.string "I’ll get more BERRIES from the\n"
	.string "BERRY MASTER.$"

LilycoveCity_Text_1C5A7A:: @ 81C5A7A
	.string "When it gets right down to it...\p"
	.string "The same way suits suit me perfectly,\n"
	.string "a crisp breeze suits the sea.\p"
	.string "And you, a BERRY suits you to a “T”...\p"
	.string "Why should that be so?$"

LilycoveCity_Text_1C5B1D:: @ 81C5B1D
	.string "When it gets right down to it...\p"
	.string "It’s because you’re a TRAINER!$"

LilycoveCity_Text_1C5B5D:: @ 81C5B5D
	.string "When it gets right down to it...\p"
	.string "The way dignified simplicity suits me,\n"
	.string "{POKEBLOCK}S perfectly suit POKéMON.$"

	.include "data/maps/text/Route123_BerryMastersHouse.s"
Route104_PrettyPetalFlowerShop_Text_1C5EC6:: @ 81C5EC6
	.string "Hello!\p"
	.string "This is the PRETTY PETAL flower shop.\n"
	.string "Spreading flowers throughout the world!$"

Route104_PrettyPetalFlowerShop_Text_1C5F1B:: @ 81C5F1B
	.string "{PLAYER}{KUN}, would you like to learn about\n"
	.string "BERRIES?$"

Route104_PrettyPetalFlowerShop_Text_1C5F48:: @ 81C5F48
	.string "Your name is?\p"
	.string "{PLAYER}{KUN}.\n"
	.string "That’s a nice name.\p"
	.string "{PLAYER}{KUN}, would you like to learn about\n"
	.string "BERRIES?$"

Route104_PrettyPetalFlowerShop_Text_1C5F9D:: @ 81C5F9D
	.string "BERRIES grow on trees that thrive\n"
	.string "only in dark, loamy soil.\p"
	.string "If you take some BERRIES, be sure to\n"
	.string "plant one in the loamy soil again.\p"
	.string "A planted BERRY will soon sprout,\n"
	.string "grow into a plant, flower beautifully,\l"
	.string "then grow BERRIES again.\p"
	.string "I want to see the whole wide world\n"
	.string "filled with beautiful flowers.\l"
	.string "That’s my dream.\p"
	.string "Please help me, {PLAYER}{KUN}. Plant BERRIES\n"
	.string "and bring more flowers into the world.$"

Route104_PrettyPetalFlowerShop_Text_1C6121:: @ 81C6121
	.string "Flowers bring so much happiness to\n"
	.string "people, don’t they?$"

Route104_PrettyPetalFlowerShop_Text_1C6158:: @ 81C6158
	.string "Hello!\p"
	.string "The more attention you give to flowers,\n"
	.string "the more beautifully they bloom.\p"
	.string "You’ll like tending flowers. I’m sure\n"
	.string "of it. You can have this.$"

Route104_PrettyPetalFlowerShop_Text_1C61E8:: @ 81C61E8
	.string "While BERRY plants are growing,\n"
	.string "water them with the WAILMER PAIL.\p"
	.string "Oh, another thing.\p"
	.string "If you don’t pick BERRIES for a while,\n"
	.string "they’ll drop off onto the ground.\l"
	.string "But they’ll sprout again.\p"
	.string "Isn’t that awesome?\n"
	.string "It’s like they have the will to live.$"

Route104_PrettyPetalFlowerShop_Text_1C62DA:: @ 81C62DA
	.string "I’m trying to be like my big sisters.\n"
	.string "I’m growing flowers, too!\p"
	.string "Here you go! It’s for you!$"

Route104_PrettyPetalFlowerShop_Text_1C6335:: @ 81C6335
	.string "You can plant a BERRY and grow it big,\n"
	.string "or you can make a POKéMON hold it.\p"
	.string "But now they have a machine that mixes\n"
	.string "up different BERRIES and makes candies\l"
	.string "for POKéMON.\p"
	.string "I want some candy, too.$"

SootopolisCity_Text_1C63F2:: @ 81C63F2
	.string "Hi, what’s your name?\p"
	.string "... ... ...  ... ... ...  ... ... ...\n"
	.string "Okay. That’s nice!\p"
	.string "My name is KIRI.\p"
	.string "My mommy and daddy named me that so\n"
	.string "I would grow healthy and warmhearted.\l"
	.string "That’s what they wished.\p"
	.string "You can have one of these.$"

SootopolisCity_Text_1C64D0:: @ 81C64D0
	.string "KIRI will give you this BERRY, too!\n"
	.string "I really like it lots!$"

SootopolisCity_Text_1C650B:: @ 81C650B
	.string "I wonder what kind of wish is included\n"
	.string "in your name.$"

SootopolisCity_Text_1C6540:: @ 81C6540
	.string "Spring, summer, autumn, and winter.\p"
	.string "If you’re born in springtime, do you like\n"
	.string "the spring, and if you’re born in the\l"
	.string "summer, do you like the summer?$"

SootopolisCity_Text_1C65D4:: @ 81C65D4
	.string "Then KIRI was born in the autumn,\n"
	.string "so I love the autumn!\p"
	.string "Which season do you like?$"

SootopolisCity_Text_1C6626:: @ 81C6626
	.string "Oh...\n"
	.string "It doesn’t matter...\p"
	.string "There’s so much that I want to know...$"

	.include "data/maps/text/ShoalCave_LowTideEntranceRoom.s"
	.include "data/maps/text/ShoalCave_LowTideInnerRoom.s"
ShoalCave_LowTideLowerRoom_Text_1C6979:: @ 81C6979
	.include "data/maps/text/ShoalCave_LowTideStairsRoom.s"
ShoalCave_LowTideInnerRoom_Text_1C69B8:: @ 81C69B8
	.string "There was a SHOAL SHELL here.\n"
	.string "But, there’s nothing here now.$"

ShoalCave_LowTideEntranceRoom_Text_1C69F5:: @ 81C69F5
	.string "You don’t have space in your BAG\n"
	.string "if I were to make it for you.\p"
	.string "You should make room and come back\n"
	.string "for a SHELL BELL.$"

PictureBookShelfText: @ 81C6A69
	.string "There’s a set of POKéMON picture books.$"

BookshelfText: @ 81C6A91
	.string "It’s filled with all sorts of books.$"

PokemonCenterBookshelfText: @ 81C6AB6
	.string "POKéMON magazines!\n"
	.string "POKéMON PAL...\p"
	.string "POKéMON HANDBOOK...\n"
	.string "ADORABLE POKéMON...$"

VaseText: @ 81C6B00
	.string "This vase looks expensive...\n"
	.string "Peered inside...\p"
	.string "But, it was empty.$"

TrashCanText: @ 81C6B41
	.string "It’s empty.$"

ShopShelfText: @ 81C6B4D
	.string "The shelves brim with all sorts of\n"
	.string "POKéMON merchandise.$"

BlueprintText: @ 81C6B85
	.string "A blueprint of some sort?\n"
	.string "It’s too complicated!$"

GraniteCave_B1F_MapScript2_1C6BB5:: @ 81C6BB5
MtPyre_2F_MapScript2_1C6BB5:: @ 81C6BB5
SkyPillar_2F_MapScript2_1C6BB5:: @ 81C6BB5
SkyPillar_4F_MapScript2_1C6BB5:: @ 81C6BB5
	map_script_2 0x4022, 0, GraniteCave_B1F_EventScript_1C6BC5
	.2byte 0

GraniteCave_B1F_MapScript1_1C6BBF:: @ 81C6BBF
MtPyre_2F_MapScript1_1C6BBF:: @ 81C6BBF
SkyPillar_2F_MapScript1_1C6BBF:: @ 81C6BBF
SkyPillar_4F_MapScript1_1C6BBF:: @ 81C6BBF
	copyvar 0x4022, 0x1
	end

	.global gUnknown_081C6BC5
gUnknown_081C6BC5: @ 81C6BC5

GraniteCave_B1F_EventScript_1C6BC5:: @ 81C6BC5
	lockall
	pause 20
	move 255, GraniteCave_B1F_Movement_1C6BF7
	waitmove 0
	playsfx 43
	pause 60
	warphole UNDEFINED
	waitstate
	end

	.global gUnknown_081C6BDE
gUnknown_081C6BDE: @ 81C6BDE

	.incbin "baserom.gba", 0x1c6bde, 0x19

GraniteCave_B1F_Movement_1C6BF7:: @ 81C6BF7
	step_54
	step_end

	.incbin "baserom.gba", 0x1c6bf9, 0x9

	.global gUnknown_081C6C02
gUnknown_081C6C02: @ 81C6C02
	.incbin "baserom.gba", 0x001c6c02, 0x83

	.global gUnknown_081C6C85
gUnknown_081C6C85: @ 81C6C85
	.incbin "baserom.gba", 0x001c6c85, 0x21

	.global gUnknown_081C6CA6
gUnknown_081C6CA6: @ 81C6CA6
	.incbin "baserom.gba", 0x001c6ca6, 0x3b

	.global gUnknown_081C6CE1
gUnknown_081C6CE1: @ 81C6CE1

BattleTower_BattleRoom_Text_1C6CE1:: @ 81C6CE1
	.string "SAVING...\n"
	.string "DON’T TURN OFF THE POWER.$"

	.global gUnknown_081C6D05
gUnknown_081C6D05: @ 81C6D05

BattleTower_BattleRoom_Text_1C6D05:: @ 81C6D05
	.string "{PLAYER} saved the game.$"

	.incbin "baserom.gba", 0x1c6d18, 0xe

	.global gUnknown_081C6D26
gUnknown_081C6D26: @ 81C6D26
	.incbin "baserom.gba", 0x001c6d26, 0x52

	.global gUnknown_081C6D78
gUnknown_081C6D78: @ 81C6D78
	.incbin "baserom.gba", 0x001c6d78, 0x80

	.global gUnknown_081C6DF8
gUnknown_081C6DF8: @ 81C6DF8
	.incbin "baserom.gba", 0x001c6df8, 0x22

	.global gUnknown_081C6E1A
gUnknown_081C6E1A: @ 81C6E1A
	.incbin "baserom.gba", 0x001c6e1a, 0x1b1

	.global gUnknown_081C6FCB
gUnknown_081C6FCB: @ 81C6FCB
	.incbin "baserom.gba", 0x001c6fcb, 0xd

	.global gUnknown_081C6FD8
gUnknown_081C6FD8: @ 81C6FD8
	.incbin "baserom.gba", 0x001c6fd8, 0x22

	.global gUnknown_081C6FFA
gUnknown_081C6FFA: @ 81C6FFA
	.incbin "baserom.gba", 0x001c6ffa, 0x1d

	.global gUnknown_081C7017
gUnknown_081C7017: @ 81C7017
	.incbin "baserom.gba", 0x001c7017, 0xe

	.global gUnknown_081C7025
gUnknown_081C7025: @ 81C7025
	.incbin "baserom.gba", 0x001c7025, 0x4f

	.global gUnknown_081C7074
gUnknown_081C7074: @ 81C7074
	.incbin "baserom.gba", 0x001c7074, 0xec

	.global gUnknown_081C7160
gUnknown_081C7160: @ 81C7160
	.incbin "baserom.gba", 0x001c7160, 0x8

	.global gUnknown_081C7168
gUnknown_081C7168: @ 81C7168
	.incbin "baserom.gba", 0x001c7168, 0x590

	.global gUnknown_081C76F8
gUnknown_081C76F8: @ 81C76F8
	.incbin "baserom.gba", 0x001c76f8, 0x24

	.global gUnknown_081C771C
gUnknown_081C771C: @ 81C771C
	.incbin "baserom.gba", 0x001c771c, 0x5c

	.global gUnknown_081C7778
gUnknown_081C7778: @ 81C7778
	.incbin "baserom.gba", 0x001c7778, 0xf444

	.global gUnknown_081D6BBC
gUnknown_081D6BBC: @ 81D6BBC
	.incbin "baserom.gba", 0x001d6bbc, 0x388

	.global gUnknown_081D6F44
gUnknown_081D6F44: @ 81D6F44
	.incbin "baserom.gba", 0x001d6f44, 0x1e

	.global gUnknown_081D6F62
gUnknown_081D6F62: @ 81D6F62
	.incbin "baserom.gba", 0x001d6f62, 0x12

	.global gUnknown_081D6F74
gUnknown_081D6F74: @ 81D6F74
	.incbin "baserom.gba", 0x001d6f74, 0x271

	.global gUnknown_081D71E5
gUnknown_081D71E5: @ 81D71E5
	.incbin "baserom.gba", 0x001d71e5, 0x91

	.global gUnknown_081D7276
gUnknown_081D7276: @ 81D7276
	.incbin "baserom.gba", 0x001d7276, 0x6e0

	.global gUnknown_081D7956
gUnknown_081D7956: @ 81D7956
	.incbin "baserom.gba", 0x001d7956, 0xa45

	.global gUnknown_081D839B
gUnknown_081D839B: @ 81D839B
	.incbin "baserom.gba", 0x001d839b, 0x1a

	.global gUnknown_081D83B5
gUnknown_081D83B5: @ 81D83B5
	.incbin "baserom.gba", 0x001d83b5, 0x21

	.global gUnknown_081D83D6
gUnknown_081D83D6: @ 81D83D6
	.incbin "baserom.gba", 0x001d83d6, 0x882

	.global gUnknown_081D8C58
gUnknown_081D8C58: @ 81D8C58
	.incbin "baserom.gba", 0x001d8c58, 0xd

	.global gUnknown_081D8C65
gUnknown_081D8C65: @ 81D8C65
	.incbin "baserom.gba", 0x001d8c65, 0xd

	.global gUnknown_081D8C72
gUnknown_081D8C72: @ 81D8C72
	.incbin "baserom.gba", 0x001d8c72, 0x9

	.global gUnknown_081D8C7B
gUnknown_081D8C7B: @ 81D8C7B
	.incbin "baserom.gba", 0x001d8c7b, 0x143

	.global gUnknown_081D8DBE
gUnknown_081D8DBE: @ 81D8DBE
	.incbin "baserom.gba", 0x001d8dbe, 0x10

	.global gUnknown_081D8DCE
gUnknown_081D8DCE: @ 81D8DCE
	.incbin "baserom.gba", 0x001d8dce, 0x3

	.global gUnknown_081D8DD1
gUnknown_081D8DD1: @ 81D8DD1
	.incbin "baserom.gba", 0x001d8dd1, 0x31

	.global gUnknown_081D8E02
gUnknown_081D8E02: @ 81D8E02
	.incbin "baserom.gba", 0x001d8e02, 0xb

	.global gUnknown_081D8E0D
gUnknown_081D8E0D: @ 81D8E0D
	.incbin "baserom.gba", 0x001d8e0d, 0x7

	.global gUnknown_081D8E14
gUnknown_081D8E14: @ 81D8E14
	.incbin "baserom.gba", 0x001d8e14, 0xe

	.global gUnknown_081D8E22
gUnknown_081D8E22: @ 81D8E22
	.incbin "baserom.gba", 0x001d8e22, 0x7

	.global gUnknown_081D8E29
gUnknown_081D8E29: @ 81D8E29
	.incbin "baserom.gba", 0x001d8e29, 0x7

	.global gUnknown_081D8E30
gUnknown_081D8E30: @ 81D8E30
	.incbin "baserom.gba", 0x001d8e30, 0x7

	.global gUnknown_081D8E37
gUnknown_081D8E37: @ 81D8E37
	.incbin "baserom.gba", 0x001d8e37, 0x4

	.global gUnknown_081D8E3B
gUnknown_081D8E3B: @ 81D8E3B
	.incbin "baserom.gba", 0x001d8e3b, 0x9

	.global gUnknown_081D8E44
gUnknown_081D8E44: @ 81D8E44
	.incbin "baserom.gba", 0x001d8e44, 0x6

	.global gUnknown_081D8E4A
gUnknown_081D8E4A: @ 81D8E4A
	.incbin "baserom.gba", 0x001d8e4a, 0x4

	.global gUnknown_081D8E4E
gUnknown_081D8E4E: @ 81D8E4E
	.incbin "baserom.gba", 0x001d8e4e, 0xa1

	.global gUnknown_081D8EEF
gUnknown_081D8EEF: @ 81D8EEF
	.incbin "baserom.gba", 0x001d8eef, 0x4

	.global gUnknown_081D8EF3
gUnknown_081D8EF3: @ 81D8EF3
	.incbin "baserom.gba", 0x001d8ef3, 0x6f

	.global gUnknown_081D8F62
gUnknown_081D8F62: @ 81D8F62
	.incbin "baserom.gba", 0x001d8f62, 0x1b

	.global gUnknown_081D8F7D
gUnknown_081D8F7D: @ 81D8F7D
	.incbin "baserom.gba", 0x001d8f7d, 0x82

	.global gUnknown_081D8FFF
gUnknown_081D8FFF: @ 81D8FFF
	.incbin "baserom.gba", 0x001d8fff, 0x9

	.global gUnknown_081D9008
gUnknown_081D9008: @ 81D9008
	.incbin "baserom.gba", 0x001d9008, 0xe

	.global gUnknown_081D9016
gUnknown_081D9016: @ 81D9016
	.incbin "baserom.gba", 0x001d9016, 0x7

	.global gUnknown_081D901D
gUnknown_081D901D: @ 81D901D
	.incbin "baserom.gba", 0x001d901d, 0x13

	.global gUnknown_081D9030
gUnknown_081D9030: @ 81D9030
	.incbin "baserom.gba", 0x001d9030, 0x11

	.global gUnknown_081D9041
gUnknown_081D9041: @ 81D9041
	.incbin "baserom.gba", 0x001d9041, 0xa

	.global gUnknown_081D904B
gUnknown_081D904B: @ 81D904B
	.incbin "baserom.gba", 0x001d904b, 0x5c

	.global gUnknown_081D90A7
gUnknown_081D90A7: @ 81D90A7
	.incbin "baserom.gba", 0x001d90a7, 0xb

	.global gUnknown_081D90B2
gUnknown_081D90B2: @ 81D90B2
	.incbin "baserom.gba", 0x001d90b2, 0x3f

	.global gUnknown_081D90F1
gUnknown_081D90F1: @ 81D90F1
	.incbin "baserom.gba", 0x001d90f1, 0xb

	.global gUnknown_081D90FC
gUnknown_081D90FC: @ 81D90FC
	.incbin "baserom.gba", 0x001d90fc, 0x2c

	.global gUnknown_081D9128
gUnknown_081D9128: @ 81D9128
	.incbin "baserom.gba", 0x001d9128, 0xa

	.global gUnknown_081D9132
gUnknown_081D9132: @ 81D9132
	.incbin "baserom.gba", 0x001d9132, 0x7

	.global gUnknown_081D9139
gUnknown_081D9139: @ 81D9139
	.incbin "baserom.gba", 0x001d9139, 0xb

	.global gUnknown_081D9144
gUnknown_081D9144: @ 81D9144
	.incbin "baserom.gba", 0x001d9144, 0x4

	.global gUnknown_081D9148
gUnknown_081D9148: @ 81D9148
	.incbin "baserom.gba", 0x001d9148, 0x7

	.global gUnknown_081D914F
gUnknown_081D914F: @ 81D914F
	.incbin "baserom.gba", 0x001d914f, 0x7

	.global gUnknown_081D9156
gUnknown_081D9156: @ 81D9156
	.incbin "baserom.gba", 0x001d9156, 0x1b

	.global gUnknown_081D9171
gUnknown_081D9171: @ 81D9171
	.incbin "baserom.gba", 0x001d9171, 0x2e

	.global gUnknown_081D919F
gUnknown_081D919F: @ 81D919F
	.incbin "baserom.gba", 0x001d919f, 0x2e

	.global gUnknown_081D91CD
gUnknown_081D91CD: @ 81D91CD
	.incbin "baserom.gba", 0x001d91cd, 0x35

	.global gUnknown_081D9202
gUnknown_081D9202: @ 81D9202
	.incbin "baserom.gba", 0x001d9202, 0x1b

	.global gUnknown_081D921D
gUnknown_081D921D: @ 81D921D
	.incbin "baserom.gba", 0x001d921d, 0x7

	.global gUnknown_081D9224
gUnknown_081D9224: @ 81D9224
	.incbin "baserom.gba", 0x001d9224, 0x9c

	.global gUnknown_081D92C0
gUnknown_081D92C0: @ 81D92C0
	.incbin "baserom.gba", 0x001d92c0, 0x2

	.global gUnknown_081D92C2
gUnknown_081D92C2: @ 81D92C2
	.incbin "baserom.gba", 0x001d92c2, 0x7

	.global gUnknown_081D92C9
gUnknown_081D92C9: @ 81D92C9
	.incbin "baserom.gba", 0x001d92c9, 0x7

	.global gUnknown_081D92D0
gUnknown_081D92D0: @ 81D92D0
	.incbin "baserom.gba", 0x001d92d0, 0x7

	.global gUnknown_081D92D7
gUnknown_081D92D7: @ 81D92D7
	.incbin "baserom.gba", 0x001d92d7, 0x8e

	.global gUnknown_081D9365
gUnknown_081D9365: @ 81D9365
	.incbin "baserom.gba", 0x001d9365, 0x4

	.global gUnknown_081D9369
gUnknown_081D9369: @ 81D9369
	.incbin "baserom.gba", 0x001d9369, 0x4

	.global gUnknown_081D936D
gUnknown_081D936D: @ 81D936D
	.incbin "baserom.gba", 0x001d936d, 0xf

	.global gUnknown_081D937C
gUnknown_081D937C: @ 81D937C
	.incbin "baserom.gba", 0x001d937c, 0xf

	.global gUnknown_081D938B
gUnknown_081D938B: @ 81D938B
	.incbin "baserom.gba", 0x001d938b, 0x4

	.global gUnknown_081D938F
gUnknown_081D938F: @ 81D938F
	.incbin "baserom.gba", 0x001d938f, 0xb

	.global gUnknown_081D939A
gUnknown_081D939A: @ 81D939A
	.incbin "baserom.gba", 0x001d939a, 0x37

	.global gUnknown_081D93D1
gUnknown_081D93D1: @ 81D93D1
	.incbin "baserom.gba", 0x001d93d1, 0x29

	.global gUnknown_081D93FA
gUnknown_081D93FA: @ 81D93FA
	.incbin "baserom.gba", 0x001d93fa, 0x51

	.global gUnknown_081D944B
gUnknown_081D944B: @ 81D944B
	.incbin "baserom.gba", 0x001d944b, 0xe

	.global gUnknown_081D9459
gUnknown_081D9459: @ 81D9459
	.incbin "baserom.gba", 0x001d9459, 0xb

	.global gUnknown_081D9464
gUnknown_081D9464: @ 81D9464
	.incbin "baserom.gba", 0x001d9464, 0x4

	.global gUnknown_081D9468
gUnknown_081D9468: @ 81D9468
	.incbin "baserom.gba", 0x001d9468, 0x7

	.global gUnknown_081D946F
gUnknown_081D946F: @ 81D946F
	.incbin "baserom.gba", 0x001d946f, 0x18

	.global gUnknown_081D9487
gUnknown_081D9487: @ 81D9487
	.incbin "baserom.gba", 0x001d9487, 0x1b

	.global gUnknown_081D94A2
gUnknown_081D94A2: @ 81D94A2
	.incbin "baserom.gba", 0x001d94a2, 0x7

	.global gUnknown_081D94A9
gUnknown_081D94A9: @ 81D94A9
	.incbin "baserom.gba", 0x001d94a9, 0x7

	.global gUnknown_081D94B0
gUnknown_081D94B0: @ 81D94B0
	.incbin "baserom.gba", 0x001d94b0, 0x2a

	.global gUnknown_081D94DA
gUnknown_081D94DA: @ 81D94DA
	.incbin "baserom.gba", 0x001d94da, 0x14

	.global gUnknown_081D94EE
gUnknown_081D94EE: @ 81D94EE
	.incbin "baserom.gba", 0x001d94ee, 0xd

	.global gUnknown_081D94FB
gUnknown_081D94FB: @ 81D94FB
	.incbin "baserom.gba", 0x001d94fb, 0x14

	.global gUnknown_081D950F
gUnknown_081D950F: @ 81D950F
	.incbin "baserom.gba", 0x001d950f, 0x9

	.global gUnknown_081D9518
gUnknown_081D9518: @ 81D9518
	.incbin "baserom.gba", 0x001d9518, 0x22

	.global gUnknown_081D953A
gUnknown_081D953A: @ 81D953A
	.incbin "baserom.gba", 0x001d953a, 0xb

	.global gUnknown_081D9545
gUnknown_081D9545: @ 81D9545
	.incbin "baserom.gba", 0x001d9545, 0xd

	.global gUnknown_081D9552
gUnknown_081D9552: @ 81D9552
	.incbin "baserom.gba", 0x001d9552, 0xb

	.global gUnknown_081D955D
gUnknown_081D955D: @ 81D955D
	.incbin "baserom.gba", 0x001d955d, 0x9

	.global gUnknown_081D9566
gUnknown_081D9566: @ 81D9566
	.incbin "baserom.gba", 0x001d9566, 0xd

	.global gUnknown_081D9573
gUnknown_081D9573: @ 81D9573
	.incbin "baserom.gba", 0x001d9573, 0xb

	.global gUnknown_081D957E
gUnknown_081D957E: @ 81D957E
	.incbin "baserom.gba", 0x001d957e, 0x9

	.global gUnknown_081D9587
gUnknown_081D9587: @ 81D9587
	.incbin "baserom.gba", 0x001d9587, 0xe

	.global gUnknown_081D9595
gUnknown_081D9595: @ 81D9595
	.incbin "baserom.gba", 0x001d9595, 0x3f

	.global gUnknown_081D95D4
gUnknown_081D95D4: @ 81D95D4
	.incbin "baserom.gba", 0x001d95d4, 0x7

	.global gUnknown_081D95DB
gUnknown_081D95DB: @ 81D95DB
	.incbin "baserom.gba", 0x001d95db, 0x7

	.global gUnknown_081D95E2
gUnknown_081D95E2: @ 81D95E2
	.incbin "baserom.gba", 0x001d95e2, 0x12

	.global gUnknown_081D95F4
gUnknown_081D95F4: @ 81D95F4
	.incbin "baserom.gba", 0x001d95f4, 0x7

	.global gUnknown_081D95FB
gUnknown_081D95FB: @ 81D95FB
	.incbin "baserom.gba", 0x001d95fb, 0xd

	.global gUnknown_081D9608
gUnknown_081D9608: @ 81D9608
	.incbin "baserom.gba", 0x001d9608, 0xb

	.global gUnknown_081D9613
gUnknown_081D9613: @ 81D9613
	.incbin "baserom.gba", 0x001d9613, 0x11

	.global gUnknown_081D9624
gUnknown_081D9624: @ 81D9624
	.incbin "baserom.gba", 0x001d9624, 0x11

	.global gUnknown_081D9635
gUnknown_081D9635: @ 81D9635
	.incbin "baserom.gba", 0x001d9635, 0x17

	.global gUnknown_081D964C
gUnknown_081D964C: @ 81D964C
	.incbin "baserom.gba", 0x001d964c, 0xaa

	.global gUnknown_081D96F6
gUnknown_081D96F6: @ 81D96F6
	.incbin "baserom.gba", 0x001d96f6, 0xe

	.global gUnknown_081D9704
gUnknown_081D9704: @ 81D9704
	.incbin "baserom.gba", 0x001d9704, 0x14

	.global gUnknown_081D9718
gUnknown_081D9718: @ 81D9718
	.incbin "baserom.gba", 0x001d9718, 0xe

	.global gUnknown_081D9726
gUnknown_081D9726: @ 81D9726
	.incbin "baserom.gba", 0x001d9726, 0xa

	.global gUnknown_081D9730
gUnknown_081D9730: @ 81D9730
	.incbin "baserom.gba", 0x001d9730, 0x14

	.global gUnknown_081D9744
gUnknown_081D9744: @ 81D9744
	.incbin "baserom.gba", 0x001d9744, 0x14

	.global gUnknown_081D9758
gUnknown_081D9758: @ 81D9758
	.incbin "baserom.gba", 0x001d9758, 0x25

	.global gUnknown_081D977D
gUnknown_081D977D: @ 81D977D
	.incbin "baserom.gba", 0x001d977d, 0xf

	.global gUnknown_081D978C
gUnknown_081D978C: @ 81D978C
	.incbin "baserom.gba", 0x001d978c, 0x9

	.global gUnknown_081D9795
gUnknown_081D9795: @ 81D9795
	.incbin "baserom.gba", 0x001d9795, 0x69

	.global gUnknown_081D97FE
gUnknown_081D97FE: @ 81D97FE
	.incbin "baserom.gba", 0x001d97fe, 0x14

	.global gUnknown_081D9812
gUnknown_081D9812: @ 81D9812
	.incbin "baserom.gba", 0x001d9812, 0x14

	.global gUnknown_081D9826
gUnknown_081D9826: @ 81D9826
	.incbin "baserom.gba", 0x001d9826, 0xe

	.global gUnknown_081D9834
gUnknown_081D9834: @ 81D9834
	.incbin "baserom.gba", 0x001d9834, 0xe

	.global gUnknown_081D9842
gUnknown_081D9842: @ 81D9842
	.incbin "baserom.gba", 0x001d9842, 0x1

	.global gUnknown_081D9843
gUnknown_081D9843: @ 81D9843
	.incbin "baserom.gba", 0x001d9843, 0x22

	.global gUnknown_081D9865
gUnknown_081D9865: @ 81D9865
	.incbin "baserom.gba", 0x001d9865, 0x1

	.global gUnknown_081D9866
gUnknown_081D9866: @ 81D9866
	.incbin "baserom.gba", 0x001d9866, 0x15

	.global gUnknown_081D987B
gUnknown_081D987B: @ 81D987B
	.incbin "baserom.gba", 0x001d987b, 0x1

	.global gUnknown_081D987C
gUnknown_081D987C: @ 81D987C
	.incbin "baserom.gba", 0x001d987c, 0x1f

	.global gUnknown_081D989B
gUnknown_081D989B: @ 81D989B
	.incbin "baserom.gba", 0x001d989b, 0xa

	.global gUnknown_081D98A5
gUnknown_081D98A5: @ 81D98A5
	.incbin "baserom.gba", 0x001d98a5, 0xc

	.global gUnknown_081D98B1
gUnknown_081D98B1: @ 81D98B1
	.incbin "baserom.gba", 0x001d98b1, 0xc

	.global gUnknown_081D98BD
gUnknown_081D98BD: @ 81D98BD
	.incbin "baserom.gba", 0x001d98bd, 0xc

	.global gUnknown_081D98C9
gUnknown_081D98C9: @ 81D98C9
	.incbin "baserom.gba", 0x001d98c9, 0xe

	.global gUnknown_081D98D7
gUnknown_081D98D7: @ 81D98D7
	.incbin "baserom.gba", 0x001d98d7, 0x1c

	.global gUnknown_081D98F3
gUnknown_081D98F3: @ 81D98F3
	.incbin "baserom.gba", 0x001d98f3, 0x10

	.global gUnknown_081D9903
gUnknown_081D9903: @ 81D9903
	.incbin "baserom.gba", 0x001d9903, 0x10

	.global gUnknown_081D9913
gUnknown_081D9913: @ 81D9913
	.incbin "baserom.gba", 0x001d9913, 0xe

	.global gUnknown_081D9921
gUnknown_081D9921: @ 81D9921
	.incbin "baserom.gba", 0x001d9921, 0x7

	.global gUnknown_081D9928
gUnknown_081D9928: @ 81D9928
	.incbin "baserom.gba", 0x001d9928, 0x1b

	.global gUnknown_081D9943
gUnknown_081D9943: @ 81D9943
	.incbin "baserom.gba", 0x001d9943, 0xd

	.global gUnknown_081D9950
gUnknown_081D9950: @ 81D9950
	.incbin "baserom.gba", 0x001d9950, 0x3

	.global gUnknown_081D9953
gUnknown_081D9953: @ 81D9953
	.incbin "baserom.gba", 0x001d9953, 0x3

	.global gUnknown_081D9956
gUnknown_081D9956: @ 81D9956
	.incbin "baserom.gba", 0x001d9956, 0x9

	.global gUnknown_081D995F
gUnknown_081D995F: @ 81D995F
	.incbin "baserom.gba", 0x001d995f, 0x10

	.global gUnknown_081D996F
gUnknown_081D996F: @ 81D996F
	.incbin "baserom.gba", 0x001d996f, 0x8

	.global gUnknown_081D9977
gUnknown_081D9977: @ 81D9977
	.incbin "baserom.gba", 0x001d9977, 0x12

	.global gUnknown_081D9989
gUnknown_081D9989: @ 81D9989
	.incbin "baserom.gba", 0x001d9989, 0x17

	.global gUnknown_081D99A0
gUnknown_081D99A0: @ 81D99A0
	.incbin "baserom.gba", 0x001d99a0, 0xb

	.global gUnknown_081D99AB
gUnknown_081D99AB: @ 81D99AB
	.incbin "baserom.gba", 0x001d99ab, 0xb

	.global gUnknown_081D99B6
gUnknown_081D99B6: @ 81D99B6
	.incbin "baserom.gba", 0x001d99b6, 0x6

	.global gUnknown_081D99BC
gUnknown_081D99BC: @ 81D99BC
	.incbin "baserom.gba", 0x001d99bc, 0x12

	.global gUnknown_081D99CE
gUnknown_081D99CE: @ 81D99CE
	.incbin "baserom.gba", 0x001d99ce, 0x6

	.global gUnknown_081D99D4
gUnknown_081D99D4: @ 81D99D4
	.incbin "baserom.gba", 0x001d99d4, 0x12

	.global gUnknown_081D99E6
gUnknown_081D99E6: @ 81D99E6
	.incbin "baserom.gba", 0x001d99e6, 0x6

	.global gUnknown_081D99EC
gUnknown_081D99EC: @ 81D99EC
	.incbin "baserom.gba", 0x001d99ec, 0x12

	.global gUnknown_081D99FE
gUnknown_081D99FE: @ 81D99FE
	.incbin "baserom.gba", 0x001d99fe, 0x6

	.global gUnknown_081D9A04
gUnknown_081D9A04: @ 81D9A04
	.incbin "baserom.gba", 0x001d9a04, 0x12

	.global gUnknown_081D9A16
gUnknown_081D9A16: @ 81D9A16
	.incbin "baserom.gba", 0x001d9a16, 0x6

	.global gUnknown_081D9A1C
gUnknown_081D9A1C: @ 81D9A1C
	.incbin "baserom.gba", 0x001d9a1c, 0x12

	.global gUnknown_081D9A2E
gUnknown_081D9A2E: @ 81D9A2E
	.incbin "baserom.gba", 0x001d9a2e, 0x6

	.global gUnknown_081D9A34
gUnknown_081D9A34: @ 81D9A34
	.incbin "baserom.gba", 0x001d9a34, 0x10

	.global gUnknown_081D9A44
gUnknown_081D9A44: @ 81D9A44
	.incbin "baserom.gba", 0x001d9a44, 0x6

	.global gUnknown_081D9A4A
gUnknown_081D9A4A: @ 81D9A4A
	.incbin "baserom.gba", 0x001d9a4a, 0x14

	.global gUnknown_081D9A5E
gUnknown_081D9A5E: @ 81D9A5E
	.incbin "baserom.gba", 0x001d9a5e, 0x6

	.global gUnknown_081D9A64
gUnknown_081D9A64: @ 81D9A64
	.incbin "baserom.gba", 0x001d9a64, 0x10

	.global gUnknown_081D9A74
gUnknown_081D9A74: @ 81D9A74
	.incbin "baserom.gba", 0x001d9a74, 0x1d

	.global gUnknown_081D9A91
gUnknown_081D9A91: @ 81D9A91
	.incbin "baserom.gba", 0x001d9a91, 0x10

	.global gUnknown_081D9AA1
gUnknown_081D9AA1: @ 81D9AA1
	.incbin "baserom.gba", 0x001d9aa1, 0x6

	.global gUnknown_081D9AA7
gUnknown_081D9AA7: @ 81D9AA7
	.incbin "baserom.gba", 0x001d9aa7, 0x1b

	.global gUnknown_081D9AC2
gUnknown_081D9AC2: @ 81D9AC2
	.incbin "baserom.gba", 0x001d9ac2, 0x4

	.global gUnknown_081D9AC6
gUnknown_081D9AC6: @ 81D9AC6
	.incbin "baserom.gba", 0x001d9ac6, 0xe

	.global gUnknown_081D9AD4
gUnknown_081D9AD4: @ 81D9AD4
	.incbin "baserom.gba", 0x001d9ad4, 0x2a

	.global gUnknown_081D9AFE
gUnknown_081D9AFE: @ 81D9AFE
	.incbin "baserom.gba", 0x001d9afe, 0x1b

	.global gUnknown_081D9B19
gUnknown_081D9B19: @ 81D9B19
	.incbin "baserom.gba", 0x001d9b19, 0x10

	.global gUnknown_081D9B29
gUnknown_081D9B29: @ 81D9B29
	.incbin "baserom.gba", 0x001d9b29, 0x4

	.global gUnknown_081D9B2D
gUnknown_081D9B2D: @ 81D9B2D
	.incbin "baserom.gba", 0x001d9b2d, 0x7

@ 81D9B34
	.include "data/field_effect_scripts.s"

	.align 2

	.global gUnknown_081D9E48
gUnknown_081D9E48: @ 81D9E48
	.incbin "baserom.gba", 0x001d9e48, 0x34

	.global gUnknown_081D9E7C
gUnknown_081D9E7C: @ 81D9E7C
	.incbin "baserom.gba", 0x001d9e7c, 0x18

	.global gUnknown_081D9E94
gUnknown_081D9E94: @ 81D9E94
	.incbin "baserom.gba", 0x001d9e94, 0x4

	.global gUnknown_081D9E98
gUnknown_081D9E98: @ 81D9E98
	.incbin "baserom.gba", 0x001d9e98, 0x2a

	.global gUnknown_081D9EC2
gUnknown_081D9EC2: @ 81D9EC2
	.incbin "baserom.gba", 0x001d9ec2, 0x3e

	.global gUnknown_081D9F00
gUnknown_081D9F00: @ 81D9F00
	.incbin "baserom.gba", 0x001d9f00, 0xa

	.global gUnknown_081D9F0A
gUnknown_081D9F0A: @ 81D9F0A
	.incbin "baserom.gba", 0x001d9f0a, 0x2b

	.global gUnknown_081D9F35
gUnknown_081D9F35: @ 81D9F35
	.incbin "baserom.gba", 0x001d9f35, 0xe7

	.global gUnknown_081DA01C
gUnknown_081DA01C: @ 81DA01C
	.incbin "baserom.gba", 0x001da01c, 0x20fc

	.global gUnknown_081DC118
gUnknown_081DC118: @ 81DC118
	.incbin "baserom.gba", 0x001dc118, 0x9dc

	.global gUnknown_081DCAF4
gUnknown_081DCAF4: @ 81DCAF4
	.incbin "baserom.gba", 0x001dcaf4, 0x44
