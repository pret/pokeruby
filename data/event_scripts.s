	.include "asm/macros.inc"
	.include "asm/macros/event.inc"
	.include "constants/constants.inc"
	.include "constants/variables.inc"

	.section script_data, "aw", %progbits

@ 814AE30
	.include "data/script_cmd_table.inc"

	.align 2
gSpecialVars::
	.4byte gSpecialVar_0x8000
	.4byte gSpecialVar_0x8001
	.4byte gSpecialVar_0x8002
	.4byte gSpecialVar_0x8003
	.4byte gSpecialVar_0x8004
	.4byte gSpecialVar_0x8005
	.4byte gSpecialVar_0x8006
	.4byte gSpecialVar_0x8007
	.4byte gSpecialVar_0x8008
	.4byte gSpecialVar_0x8009
	.4byte gSpecialVar_0x800A
	.4byte gSpecialVar_0x800B
	.4byte gScriptFacing
	.4byte gScriptResult
	.4byte gScriptItemId
	.4byte gScriptLastTalked
	.4byte gScriptContestRank
	.4byte gScriptContestCategory

	.include "data/specials.inc"

	.align 2
gStdScripts::
	.4byte Std_ObtainItem
	.4byte Std_FindItem
	.4byte Std_2
	.4byte Std_3
	.4byte Std_4
	.4byte Std_5
	.4byte Std_6
	.4byte Std_ObtainDecoration
gStdScripts_End::

	.include "data/scripts/maps/PetalburgCity.inc"
	.include "data/scripts/maps/SlateportCity.inc"
	.include "data/scripts/maps/MauvilleCity.inc"
	.include "data/scripts/maps/RustboroCity.inc"
	.include "data/scripts/maps/FortreeCity.inc"
	.include "data/scripts/maps/LilycoveCity.inc"
	.include "data/scripts/maps/MossdeepCity.inc"
	.include "data/scripts/maps/SootopolisCity.inc"
	.include "data/scripts/maps/EverGrandeCity.inc"
	.include "data/scripts/maps/LittlerootTown.inc"
	.include "data/scripts/maps/OldaleTown.inc"
	.include "data/scripts/maps/DewfordTown.inc"
	.include "data/scripts/maps/LavaridgeTown.inc"
	.include "data/scripts/maps/FallarborTown.inc"
	.include "data/scripts/maps/VerdanturfTown.inc"
	.include "data/scripts/maps/PacifidlogTown.inc"
	.include "data/scripts/maps/Route101.inc"
	.include "data/scripts/maps/Route102.inc"
	.include "data/scripts/maps/Route103.inc"
	.include "data/scripts/maps/Route104.inc"
	.include "data/scripts/maps/Route105.inc"
	.include "data/scripts/maps/Route106.inc"
	.include "data/scripts/maps/Route107.inc"
	.include "data/scripts/maps/Route108.inc"
	.include "data/scripts/maps/Route109.inc"
	.include "data/scripts/maps/Route110.inc"
	.include "data/scripts/maps/Route111.inc"
	.include "data/scripts/maps/Route112.inc"
	.include "data/scripts/maps/Route113.inc"
	.include "data/scripts/maps/Route114.inc"
	.include "data/scripts/maps/Route115.inc"
	.include "data/scripts/maps/Route116.inc"
	.include "data/scripts/maps/Route117.inc"
	.include "data/scripts/maps/Route118.inc"
	.include "data/scripts/maps/Route119.inc"
	.include "data/scripts/maps/Route120.inc"
	.include "data/scripts/maps/Route121.inc"
	.include "data/scripts/maps/Route122.inc"
	.include "data/scripts/maps/Route123.inc"
	.include "data/scripts/maps/Route124.inc"
	.include "data/scripts/maps/Route125.inc"
	.include "data/scripts/maps/Route126.inc"
	.include "data/scripts/maps/Route127.inc"
	.include "data/scripts/maps/Route128.inc"
	.include "data/scripts/maps/Route129.inc"
	.include "data/scripts/maps/Route130.inc"
	.include "data/scripts/maps/Route131.inc"
	.include "data/scripts/maps/Route132.inc"
	.include "data/scripts/maps/Route133.inc"
	.include "data/scripts/maps/Route134.inc"
	.include "data/scripts/maps/Underwater1.inc"
	.include "data/scripts/maps/Underwater2.inc"
	.include "data/scripts/maps/Underwater3.inc"
	.include "data/scripts/maps/Underwater4.inc"
	.include "data/scripts/maps/LittlerootTown_BrendansHouse_1F.inc"
	.include "data/scripts/maps/LittlerootTown_BrendansHouse_2F.inc"
	.include "data/scripts/maps/LittlerootTown_MaysHouse_1F.inc"
	.include "data/scripts/maps/LittlerootTown_MaysHouse_2F.inc"
	.include "data/scripts/maps/LittlerootTown_ProfessorBirchsLab.inc"
	.include "data/scripts/maps/OldaleTown_House1.inc"
	.include "data/scripts/maps/OldaleTown_House2.inc"
	.include "data/scripts/maps/OldaleTown_PokemonCenter_1F.inc"
	.include "data/scripts/maps/OldaleTown_PokemonCenter_2F.inc"
	.include "data/scripts/maps/OldaleTown_Mart.inc"
	.include "data/scripts/maps/DewfordTown_House1.inc"
	.include "data/scripts/maps/DewfordTown_PokemonCenter_1F.inc"
	.include "data/scripts/maps/DewfordTown_PokemonCenter_2F.inc"
	.include "data/scripts/maps/DewfordTown_Gym.inc"
	.include "data/scripts/maps/DewfordTown_Hall.inc"
	.include "data/scripts/maps/DewfordTown_House2.inc"
	.include "data/scripts/maps/LavaridgeTown_HerbShop.inc"
	.include "data/scripts/maps/LavaridgeTown_Gym_1F.inc"
	.include "data/scripts/maps/LavaridgeTown_Gym_B1F.inc"
	.include "data/scripts/maps/LavaridgeTown_House.inc"
	.include "data/scripts/maps/LavaridgeTown_Mart.inc"
	.include "data/scripts/maps/LavaridgeTown_PokemonCenter_1F.inc"
	.include "data/scripts/maps/LavaridgeTown_PokemonCenter_2F.inc"
	.include "data/scripts/maps/FallarborTown_Mart.inc"
	.include "data/scripts/maps/FallarborTown_ContestLobby.inc"
	.include "data/scripts/maps/FallarborTown_ContestHall.inc"
	.include "data/scripts/maps/FallarborTown_PokemonCenter_1F.inc"
	.include "data/scripts/maps/FallarborTown_PokemonCenter_2F.inc"
	.include "data/scripts/maps/FallarborTown_House1.inc"
	.include "data/scripts/maps/FallarborTown_House2.inc"
	.include "data/scripts/maps/VerdanturfTown_ContestLobby.inc"
	.include "data/scripts/maps/VerdanturfTown_ContestHall.inc"
	.include "data/scripts/maps/VerdanturfTown_Mart.inc"
	.include "data/scripts/maps/VerdanturfTown_PokemonCenter_1F.inc"
	.include "data/scripts/maps/VerdanturfTown_PokemonCenter_2F.inc"
	.include "data/scripts/maps/VerdanturfTown_WandasHouse.inc"
	.include "data/scripts/maps/VerdanturfTown_FriendshipRatersHouse.inc"
	.include "data/scripts/maps/VerdanturfTown_House.inc"
	.include "data/scripts/maps/PacifidlogTown_PokemonCenter_1F.inc"
	.include "data/scripts/maps/PacifidlogTown_PokemonCenter_2F.inc"
	.include "data/scripts/maps/PacifidlogTown_House1.inc"
	.include "data/scripts/maps/PacifidlogTown_House2.inc"
	.include "data/scripts/maps/PacifidlogTown_House3.inc"
	.include "data/scripts/maps/PacifidlogTown_House4.inc"
	.include "data/scripts/maps/PacifidlogTown_House5.inc"
	.include "data/scripts/maps/PetalburgCity_WallysHouse.inc"
	.include "data/scripts/maps/PetalburgCity_Gym.inc"
	.include "data/scripts/maps/PetalburgCity_House1.inc"
	.include "data/scripts/maps/PetalburgCity_House2.inc"
	.include "data/scripts/maps/PetalburgCity_PokemonCenter_1F.inc"
	.include "data/scripts/maps/PetalburgCity_PokemonCenter_2F.inc"
	.include "data/scripts/maps/PetalburgCity_Mart.inc"
	.include "data/scripts/maps/SlateportCity_SternsShipyard_1F.inc"
	.include "data/scripts/maps/SlateportCity_SternsShipyard_2F.inc"
	.include "data/scripts/maps/SlateportCity_ContestLobby.inc"
	.include "data/scripts/maps/SlateportCity_ContestHall.inc"
	.include "data/scripts/maps/SlateportCity_House1.inc"
	.include "data/scripts/maps/SlateportCity_PokemonFanClub.inc"
	.include "data/scripts/maps/SlateportCity_OceanicMuseum_1F.inc"
	.include "data/scripts/maps/SlateportCity_OceanicMuseum_2F.inc"
	.include "data/scripts/maps/SlateportCity_Harbor.inc"
	.include "data/scripts/maps/SlateportCity_House2.inc"
	.include "data/scripts/maps/SlateportCity_PokemonCenter_1F.inc"
	.include "data/scripts/maps/SlateportCity_PokemonCenter_2F.inc"
	.include "data/scripts/maps/SlateportCity_Mart.inc"
	.include "data/scripts/maps/MauvilleCity_Gym.inc"
	.include "data/scripts/maps/MauvilleCity_BikeShop.inc"
	.include "data/scripts/maps/MauvilleCity_House1.inc"
	.include "data/scripts/maps/MauvilleCity_GameCorner.inc"
	.include "data/scripts/maps/MauvilleCity_House2.inc"
	.include "data/scripts/maps/MauvilleCity_PokemonCenter_1F.inc"
	.include "data/scripts/maps/MauvilleCity_PokemonCenter_2F.inc"
	.include "data/scripts/maps/MauvilleCity_Mart.inc"
	.include "data/scripts/maps/RustboroCity_DevonCorp_1F.inc"
	.include "data/scripts/maps/RustboroCity_DevonCorp_2F.inc"
	.include "data/scripts/maps/RustboroCity_DevonCorp_3F.inc"
	.include "data/scripts/maps/RustboroCity_Gym.inc"
	.include "data/scripts/maps/RustboroCity_PokemonSchool.inc"
	.include "data/scripts/maps/RustboroCity_PokemonCenter_1F.inc"
	.include "data/scripts/maps/RustboroCity_PokemonCenter_2F.inc"
	.include "data/scripts/maps/RustboroCity_Mart.inc"
	.include "data/scripts/maps/RustboroCity_Flat1_1F.inc"
	.include "data/scripts/maps/RustboroCity_Flat1_2F.inc"
	.include "data/scripts/maps/RustboroCity_House1.inc"
	.include "data/scripts/maps/RustboroCity_CuttersHouse.inc"
	.include "data/scripts/maps/RustboroCity_House2.inc"
	.include "data/scripts/maps/RustboroCity_Flat2_1F.inc"
	.include "data/scripts/maps/RustboroCity_Flat2_2F.inc"
	.include "data/scripts/maps/RustboroCity_Flat2_3F.inc"
	.include "data/scripts/maps/RustboroCity_House3.inc"
	.include "data/scripts/maps/FortreeCity_House1.inc"
	.include "data/scripts/maps/FortreeCity_Gym.inc"
	.include "data/scripts/maps/FortreeCity_PokemonCenter_1F.inc"
	.include "data/scripts/maps/FortreeCity_PokemonCenter_2F.inc"
	.include "data/scripts/maps/FortreeCity_Mart.inc"
	.include "data/scripts/maps/FortreeCity_House2.inc"
	.include "data/scripts/maps/FortreeCity_House3.inc"
	.include "data/scripts/maps/FortreeCity_House4.inc"
	.include "data/scripts/maps/FortreeCity_House5.inc"
	.include "data/scripts/maps/FortreeCity_DecorationShop.inc"
	.include "data/scripts/maps/LilycoveCity_CoveLilyMotel_1F.inc"
	.include "data/scripts/maps/LilycoveCity_CoveLilyMotel_2F.inc"
	.include "data/scripts/maps/LilycoveCity_LilycoveMuseum_1F.inc"
	.include "data/scripts/maps/LilycoveCity_LilycoveMuseum_2F.inc"
	.include "data/scripts/maps/LilycoveCity_ContestLobby.inc"
	.include "data/scripts/maps/LilycoveCity_ContestHall.inc"
	.include "data/scripts/maps/LilycoveCity_PokemonCenter_1F.inc"
	.include "data/scripts/maps/LilycoveCity_PokemonCenter_2F.inc"
	.include "data/scripts/maps/LilycoveCity_UnusedMart.inc"
	.include "data/scripts/maps/LilycoveCity_PokemonTrainerFanClub.inc"
	.include "data/scripts/maps/LilycoveCity_Harbor.inc"
	.include "data/scripts/maps/LilycoveCity_EmptyMap.inc"
	.include "data/scripts/maps/LilycoveCity_MoveDeletersHouse.inc"
	.include "data/scripts/maps/LilycoveCity_House1.inc"
	.include "data/scripts/maps/LilycoveCity_House2.inc"
	.include "data/scripts/maps/LilycoveCity_House3.inc"
	.include "data/scripts/maps/LilycoveCity_House4.inc"
	.include "data/scripts/maps/LilycoveCity_DepartmentStore_1F.inc"
	.include "data/scripts/maps/LilycoveCity_DepartmentStore_2F.inc"
	.include "data/scripts/maps/LilycoveCity_DepartmentStore_3F.inc"
	.include "data/scripts/maps/LilycoveCity_DepartmentStore_4F.inc"
	.include "data/scripts/maps/LilycoveCity_DepartmentStore_5F.inc"
	.include "data/scripts/maps/LilycoveCity_DepartmentStoreRooftop.inc"
	.include "data/scripts/maps/LilycoveCity_DepartmentStoreElevator.inc"
	.include "data/scripts/maps/MossdeepCity_Gym.inc"
	.include "data/scripts/maps/MossdeepCity_House1.inc"
	.include "data/scripts/maps/MossdeepCity_House2.inc"
	.include "data/scripts/maps/MossdeepCity_PokemonCenter_1F.inc"
	.include "data/scripts/maps/MossdeepCity_PokemonCenter_2F.inc"
	.include "data/scripts/maps/MossdeepCity_Mart.inc"
	.include "data/scripts/maps/MossdeepCity_House3.inc"
	.include "data/scripts/maps/MossdeepCity_StevensHouse.inc"
	.include "data/scripts/maps/MossdeepCity_House4.inc"
	.include "data/scripts/maps/MossdeepCity_SpaceCenter_1F.inc"
	.include "data/scripts/maps/MossdeepCity_SpaceCenter_2F.inc"
	.include "data/scripts/maps/MossdeepCity_GameCorner_1F.inc"
	.include "data/scripts/maps/MossdeepCity_GameCorner_B1F.inc"
	.include "data/scripts/maps/SootopolisCity_Gym_1F.inc"
	.include "data/scripts/maps/SootopolisCity_Gym_B1F.inc"
	.include "data/scripts/maps/SootopolisCity_PokemonCenter_1F.inc"
	.include "data/scripts/maps/SootopolisCity_PokemonCenter_2F.inc"
	.include "data/scripts/maps/SootopolisCity_Mart.inc"
	.include "data/scripts/maps/SootopolisCity_House1.inc"
	.include "data/scripts/maps/SootopolisCity_House2.inc"
	.include "data/scripts/maps/SootopolisCity_House3.inc"
	.include "data/scripts/maps/SootopolisCity_House4.inc"
	.include "data/scripts/maps/SootopolisCity_House5.inc"
	.include "data/scripts/maps/SootopolisCity_House6.inc"
	.include "data/scripts/maps/SootopolisCity_House7.inc"
	.include "data/scripts/maps/SootopolisCity_House8.inc"
	.include "data/scripts/maps/EverGrandeCity_SidneysRoom.inc"
	.include "data/scripts/maps/EverGrandeCity_PhoebesRoom.inc"
	.include "data/scripts/maps/EverGrandeCity_GlaciasRoom.inc"
	.include "data/scripts/maps/EverGrandeCity_DrakesRoom.inc"
	.include "data/scripts/maps/EverGrandeCity_ChampionsRoom.inc"
	.include "data/scripts/maps/EverGrandeCity_Corridor1.inc"
	.include "data/scripts/maps/EverGrandeCity_Corridor2.inc"
	.include "data/scripts/maps/EverGrandeCity_Corridor3.inc"
	.include "data/scripts/maps/EverGrandeCity_Corridor4.inc"
	.include "data/scripts/maps/EverGrandeCity_Corridor5.inc"
	.include "data/scripts/maps/EverGrandeCity_PokemonLeague.inc"
	.include "data/scripts/maps/EverGrandeCity_HallOfFame.inc"
	.include "data/scripts/maps/EverGrandeCity_PokemonCenter_1F.inc"
	.include "data/scripts/maps/EverGrandeCity_PokemonCenter_2F.inc"
	.include "data/scripts/maps/Route104_MrBrineysHouse.inc"
	.include "data/scripts/maps/Route104_PrettyPetalFlowerShop.inc"
	.include "data/scripts/maps/Route111_WinstrateFamilysHouse.inc"
	.include "data/scripts/maps/Route111_OldLadysRestStop.inc"
	.include "data/scripts/maps/Route112_CableCarStation.inc"
	.include "data/scripts/maps/MtChimney_CableCarStation.inc"
	.include "data/scripts/maps/Route114_FossilManiacsHouse.inc"
	.include "data/scripts/maps/Route114_FossilManiacsTunnel.inc"
	.include "data/scripts/maps/Route114_LanettesHouse.inc"
	.include "data/scripts/maps/Route116_TunnelersRestHouse.inc"
	.include "data/scripts/maps/Route117_PokemonDayCare.inc"
	.include "data/scripts/maps/Route121_SafariZoneEntrance.inc"
	.include "data/scripts/maps/MeteorFalls_1F_1R.inc"
	.include "data/scripts/maps/MeteorFalls_1F_2R.inc"
	.include "data/scripts/maps/MeteorFalls_B1F_1R.inc"
	.include "data/scripts/maps/MeteorFalls_B1F_2R.inc"
	.include "data/scripts/maps/RusturfTunnel.inc"
	.include "data/scripts/maps/Underwater_SootopolisCity.inc"
	.include "data/scripts/maps/DesertRuins.inc"
	.include "data/scripts/maps/GraniteCave_1F.inc"
	.include "data/scripts/maps/GraniteCave_B1F.inc"
	.include "data/scripts/maps/GraniteCave_B2F.inc"
	.include "data/scripts/maps/GraniteCave_StevensRoom.inc"
	.include "data/scripts/maps/PetalburgWoods.inc"
	.include "data/scripts/maps/MtChimney.inc"
	.include "data/scripts/maps/JaggedPass.inc"
	.include "data/scripts/maps/FieryPath.inc"
	.include "data/scripts/maps/MtPyre_1F.inc"
	.include "data/scripts/maps/MtPyre_2F.inc"
	.include "data/scripts/maps/MtPyre_3F.inc"
	.include "data/scripts/maps/MtPyre_4F.inc"
	.include "data/scripts/maps/MtPyre_5F.inc"
	.include "data/scripts/maps/MtPyre_6F.inc"
	.include "data/scripts/maps/MtPyre_Exterior.inc"
	.include "data/scripts/maps/MtPyre_Summit.inc"
	.include "data/scripts/maps/AquaHideout_1F.inc"
	.include "data/scripts/maps/AquaHideout_B1F.inc"
	.include "data/scripts/maps/AquaHideout_B2F.inc"
	.include "data/scripts/maps/Underwater_SeafloorCavern.inc"
	.include "data/scripts/maps/SeafloorCavern_Entrance.inc"
	.include "data/scripts/maps/SeafloorCavern_Room1.inc"
	.include "data/scripts/maps/SeafloorCavern_Room2.inc"
	.include "data/scripts/maps/SeafloorCavern_Room3.inc"
	.include "data/scripts/maps/SeafloorCavern_Room4.inc"
	.include "data/scripts/maps/SeafloorCavern_Room5.inc"
	.include "data/scripts/maps/SeafloorCavern_Room6.inc"
	.include "data/scripts/maps/SeafloorCavern_Room7.inc"
	.include "data/scripts/maps/SeafloorCavern_Room8.inc"
	.include "data/scripts/maps/SeafloorCavern_Room9.inc"
	.include "data/scripts/maps/CaveOfOrigin_Entrance.inc"
	.include "data/scripts/maps/CaveOfOrigin_1F.inc"
	.include "data/scripts/maps/CaveOfOrigin_B1F.inc"
	.include "data/scripts/maps/CaveOfOrigin_B2F.inc"
	.include "data/scripts/maps/CaveOfOrigin_B3F.inc"
	.include "data/scripts/maps/CaveOfOrigin_B4F.inc"
	.include "data/scripts/maps/VictoryRoad_1F.inc"
	.include "data/scripts/maps/VictoryRoad_B1F.inc"
	.include "data/scripts/maps/VictoryRoad_B2F.inc"
	.include "data/scripts/maps/ShoalCave_LowTideEntranceRoom.inc"
	.include "data/scripts/maps/ShoalCave_LowTideInnerRoom.inc"
	.include "data/scripts/maps/ShoalCave_LowTideStairsRoom.inc"
	.include "data/scripts/maps/ShoalCave_LowTideLowerRoom.inc"
	.include "data/scripts/maps/ShoalCave_HighTideEntranceRoom.inc"
	.include "data/scripts/maps/ShoalCave_HighTideInnerRoom.inc"
	.include "data/scripts/maps/NewMauville_Entrance.inc"
	.include "data/scripts/maps/NewMauville_Inside.inc"
	.include "data/scripts/maps/AbandonedShip_Deck.inc"
	.include "data/scripts/maps/AbandonedShip_Corridors_1F.inc"
	.include "data/scripts/maps/AbandonedShip_Rooms_1F.inc"
	.include "data/scripts/maps/AbandonedShip_Corridors_B1F.inc"
	.include "data/scripts/maps/AbandonedShip_Rooms_B1F.inc"
	.include "data/scripts/maps/AbandonedShip_Rooms2_B1F.inc"
	.include "data/scripts/maps/AbandonedShip_Underwater1.inc"
	.include "data/scripts/maps/AbandonedShip_Room_B1F.inc"
	.include "data/scripts/maps/AbandonedShip_Rooms2_1F.inc"
	.include "data/scripts/maps/AbandonedShip_CaptainsOffice.inc"
	.include "data/scripts/maps/AbandonedShip_Underwater2.inc"
	.include "data/scripts/maps/AbandonedShip_HiddenFloorCorridors.inc"
	.include "data/scripts/maps/AbandonedShip_HiddenFloorRooms.inc"
	.include "data/scripts/maps/IslandCave.inc"
	.include "data/scripts/maps/AncientTomb.inc"
	.include "data/scripts/maps/Underwater_Route134.inc"
	.include "data/scripts/maps/Underwater_SealedChamber.inc"
	.include "data/scripts/maps/SealedChamber_OuterRoom.inc"
	.include "data/scripts/maps/SealedChamber_InnerRoom.inc"
	.include "data/scripts/maps/ScorchedSlab.inc"
	.include "data/scripts/maps/MagmaHideout_1F.inc"
	.include "data/scripts/maps/MagmaHideout_B1F.inc"
	.include "data/scripts/maps/MagmaHideout_B2F.inc"
	.include "data/scripts/maps/SkyPillar_Entrance.inc"
	.include "data/scripts/maps/SkyPillar_Outside.inc"
	.include "data/scripts/maps/SkyPillar_1F.inc"
	.include "data/scripts/maps/SkyPillar_2F.inc"
	.include "data/scripts/maps/SkyPillar_3F.inc"
	.include "data/scripts/maps/SkyPillar_4F.inc"
	.include "data/scripts/maps/ShoalCave_LowTideIceRoom.inc"
	.include "data/scripts/maps/SkyPillar_5F.inc"
	.include "data/scripts/maps/SkyPillar_Top.inc"
	.include "data/scripts/maps/SecretBase_BlueCave1.inc"
	.include "data/scripts/maps/SecretBase_BlueCave2.inc"
	.include "data/scripts/maps/SecretBase_BlueCave3.inc"
	.include "data/scripts/maps/SecretBase_BlueCave4.inc"
	.include "data/scripts/maps/SecretBase_BrownCave1.inc"
	.include "data/scripts/maps/SecretBase_BrownCave2.inc"
	.include "data/scripts/maps/SecretBase_BrownCave3.inc"
	.include "data/scripts/maps/SecretBase_BrownCave4.inc"
	.include "data/scripts/maps/SecretBase_RedCave1.inc"
	.include "data/scripts/maps/SecretBase_RedCave2.inc"
	.include "data/scripts/maps/SecretBase_RedCave3.inc"
	.include "data/scripts/maps/SecretBase_RedCave4.inc"
	.include "data/scripts/maps/SecretBase_Shrub1.inc"
	.include "data/scripts/maps/SecretBase_Shrub2.inc"
	.include "data/scripts/maps/SecretBase_Shrub3.inc"
	.include "data/scripts/maps/SecretBase_Shrub4.inc"
	.include "data/scripts/maps/SecretBase_Tree1.inc"
	.include "data/scripts/maps/SecretBase_Tree2.inc"
	.include "data/scripts/maps/SecretBase_Tree3.inc"
	.include "data/scripts/maps/SecretBase_Tree4.inc"
	.include "data/scripts/maps/SecretBase_YellowCave1.inc"
	.include "data/scripts/maps/SecretBase_YellowCave2.inc"
	.include "data/scripts/maps/SecretBase_YellowCave3.inc"
	.include "data/scripts/maps/SecretBase_YellowCave4.inc"

gUnknown_0815F36C:: @ 815F36C
	lockall
	playsfx 2
	message UnknownString_81A3A72
	doanimation 61
	waitstate
	waittext
	waitbutton
	playsfx 5
	jump EventScript_15F384
	end

EventScript_15F384:
	message UnknownString_81A3A87
	waittext
	checkflag 268
	jumpeq EventScript_15F3A0
	jump EventScript_15F3E2
	end

gUnknown_0815F399:: @ 815F399
	lockall
	jump EventScript_15F384
	end

EventScript_15F3A0:
	multichoice 0, 0, 6, 0
	switch RESULT
	case 0, EventScript_15F432
	case 1, EventScript_15F419
	case 2, EventScript_15F436
	case 3, EventScript_15F51D
	case 127, EventScript_15F51D
	end

EventScript_15F3E2:
	multichoice 0, 0, 5, 0
	switch RESULT
	case 0, EventScript_15F432
	case 1, EventScript_15F419
	case 2, EventScript_15F51D
	case 127, EventScript_15F51D
	end

EventScript_15F419:
	msgbox UnknownString_81A38FB, 5
	compare RESULT, 0
	jumpeq EventScript_15F384
	closebutton
	special 10
	releaseall
	end

EventScript_15F432:
	special 14
	end

EventScript_15F436:
	special 15
	end

gUnknown_0815F43A:: @ 815F43A
	lockall
	message UnknownString_81A3A72
	playsfx 2
	doanimation 61
	waitstate
	waittext
	waitbutton
	playsfx 5
	jump EventScript_15F452
	end

EventScript_15F452:
	message UnknownString_81A3A87
	waittext
	multichoice 0, 0, 7, 0
	switch RESULT
	case 0, EventScript_15F4A1
	case 1, EventScript_15F436
	case 2, EventScript_15F511
	case 3, EventScript_15F51D
	case 127, EventScript_15F51D
	end

gUnknown_0815F49A:: @ 815F49A
	lockall
	jump EventScript_15F452
	end

EventScript_15F4A1:
	special 12
	compare RESULT, 1
	jumpeq EventScript_15F4E0
	compare RESULT, 2
	jumpeq EventScript_15F503
	special 303
	msgbox UnknownString_81A3958, 5
	compare RESULT, 0
	jumpeq EventScript_15F452
	msgbox UnknownString_81A3A22, 3
	special 13
	special 26
	releaseall
	end

EventScript_15F4E0:
	msgbox UnknownString_81A3982, 5
	compare RESULT, 0
	jumpeq EventScript_15F452
	msgbox UnknownString_81A3A3A, 3
	special 13
	special 26
	releaseall
	end

EventScript_15F503:
	msgbox UnknownString_81A39C0, 3
	special 26
	closebutton
	releaseall
	end

EventScript_15F511:
	message UnknownString_81A3AA2
	waittext
	jump EventScript_15F452
	end

EventScript_15F51D:
	special 26
	closebutton
	releaseall
	end

gUnknown_0815F523:: @ 815F523
	doanimation 52
	waitstate
	end

gUnknown_0815F528:: @ 815F528
	special 307
	compare RESULT, 0
	jumpeq EventScript_15F558
	compare RESULT, 1
	jumpeq EventScript_15F561
	compare RESULT, 2
	jumpeq EventScript_15F56A
	compare RESULT, 3
	jumpeq EventScript_15F573
	end

EventScript_15F558:
	msgbox UnknownString_81A3B5B, 3
	end

EventScript_15F561:
	msgbox UnknownString_81A3BA4, 3
	end

EventScript_15F56A:
	msgbox UnknownString_81A3BE8, 3
	end

EventScript_15F573:
	msgbox UnknownString_81A3C31, 3
	end

	.include "data/scripts/maps/SingleBattleColosseum.inc"
	.include "data/scripts/maps/TradeCenter.inc"
	.include "data/scripts/maps/RecordCorner.inc"
	.include "data/scripts/maps/DoubleBattleColosseum.inc"
	.include "data/scripts/maps/LinkContestRoom1.inc"
	.include "data/scripts/maps/LinkContestRoom2.inc"
	.include "data/scripts/maps/LinkContestRoom3.inc"
	.include "data/scripts/maps/LinkContestRoom4.inc"
	.include "data/scripts/maps/LinkContestRoom5.inc"
	.include "data/scripts/maps/LinkContestRoom6.inc"
	.include "data/scripts/maps/UnknownMap_25_29.inc"
	.include "data/scripts/maps/UnknownMap_25_30.inc"
	.include "data/scripts/maps/UnknownMap_25_31.inc"
	.include "data/scripts/maps/UnknownMap_25_32.inc"
	.include "data/scripts/maps/UnknownMap_25_33.inc"
	.include "data/scripts/maps/UnknownMap_25_34.inc"
	.include "data/scripts/maps/InsideOfTruck.inc"
	.include "data/scripts/maps/SSTidalCorridor.inc"
	.include "data/scripts/maps/SSTidalLowerDeck.inc"
	.include "data/scripts/maps/SSTidalRooms.inc"
	.include "data/scripts/maps/SafariZone_Northwest.inc"
	.include "data/scripts/maps/SafariZone_Northeast.inc"
	.include "data/scripts/maps/SafariZone_Southwest.inc"
	.include "data/scripts/maps/SafariZone_Southeast.inc"
	.include "data/scripts/maps/BattleTower_Outside.inc"
	.include "data/scripts/maps/BattleTower_Lobby.inc"
	.include "data/scripts/maps/BattleTower_Elevator.inc"
	.include "data/scripts/maps/BattleTower_Corridor.inc"
	.include "data/scripts/maps/BattleTower_BattleRoom.inc"
	.include "data/scripts/maps/SouthernIsland_Exterior.inc"
	.include "data/scripts/maps/SouthernIsland_Interior.inc"
	.include "data/scripts/maps/SafariZone_RestHouse.inc"
	.include "data/scripts/maps/Route104_Prototype.inc"
	.include "data/scripts/maps/Route104_PrototypePrettyPetalFlowerShop.inc"
	.include "data/scripts/maps/Route109_SeashoreHouse.inc"
	.include "data/scripts/maps/Route110_TrickHouseEntrance.inc"
	.include "data/scripts/maps/Route110_TrickHouseEnd.inc"
	.include "data/scripts/maps/Route110_TrickHouseCorridor.inc"
	.include "data/scripts/maps/Route110_TrickHousePuzzle1.inc"
	.include "data/scripts/maps/Route110_TrickHousePuzzle2.inc"
	.include "data/scripts/maps/Route110_TrickHousePuzzle3.inc"
	.include "data/scripts/maps/Route110_TrickHousePuzzle4.inc"
	.include "data/scripts/maps/Route110_TrickHousePuzzle5.inc"
	.include "data/scripts/maps/Route110_TrickHousePuzzle6.inc"
	.include "data/scripts/maps/Route110_TrickHousePuzzle7.inc"
	.include "data/scripts/maps/Route110_TrickHousePuzzle8.inc"
	.include "data/scripts/maps/Route110_SeasideCyclingRoadSouthEntrance.inc"
	.include "data/scripts/maps/Route110_SeasideCyclingRoadNorthEntrance.inc"
	.include "data/scripts/maps/Route113_GlassWorkshop.inc"
	.include "data/scripts/maps/Route123_BerryMastersHouse.inc"
	.include "data/scripts/maps/Route119_WeatherInstitute_1F.inc"
	.include "data/scripts/maps/Route119_WeatherInstitute_2F.inc"
	.include "data/scripts/maps/Route119_House.inc"
	.include "data/scripts/maps/Route124_DivingTreasureHuntersHouse.inc"

	.include "data/text/maps/PetalburgCity.inc"
	.include "data/text/maps/SlateportCity.inc"
	.include "data/text/maps/MauvilleCity.inc"
	.include "data/text/maps/RustboroCity.inc"
	.include "data/text/maps/FortreeCity.inc"
	.include "data/text/maps/LilycoveCity.inc"
	.include "data/text/maps/MossdeepCity.inc"
	.include "data/text/maps/SootopolisCity.inc"
	.include "data/text/maps/EverGrandeCity.inc"
	.include "data/text/maps/LittlerootTown.inc"
	.include "data/text/maps/OldaleTown.inc"
	.include "data/text/maps/DewfordTown.inc"
	.include "data/text/maps/LavaridgeTown.inc"
	.include "data/text/maps/FallarborTown.inc"
	.include "data/text/maps/VerdanturfTown.inc"
	.include "data/text/maps/PacifidlogTown.inc"
	.include "data/text/maps/Route101.inc"
	.include "data/text/maps/Route102.inc"
	.include "data/text/maps/Route103.inc"
	.include "data/text/maps/Route104.inc"
	.include "data/text/maps/Route105.inc"
	.include "data/text/maps/Route106.inc"
	.include "data/text/maps/Route107.inc"
	.include "data/text/maps/Route108.inc"
	.include "data/text/maps/Route109.inc"
	.include "data/text/maps/Route110.inc"
	.include "data/text/maps/Route111.inc"
	.include "data/text/maps/Route112.inc"
	.include "data/text/maps/Route113.inc"
	.include "data/text/maps/Route114.inc"
	.include "data/text/maps/Route115.inc"
	.include "data/text/maps/Route116.inc"
	.include "data/text/maps/Route117.inc"
	.include "data/text/maps/Route118.inc"
	.include "data/text/maps/Route119.inc"
	.include "data/text/maps/Route120.inc"
	.include "data/text/maps/Route121.inc"
	.include "data/text/maps/Route123.inc"
	.include "data/text/maps/Route124.inc"
	.include "data/text/maps/Route128.inc"
	.include "data/text/maps/LittlerootTown_BrendansHouse_1F.inc"
	.include "data/text/maps/LittlerootTown_BrendansHouse_2F.inc"
	.include "data/text/maps/LittlerootTown_MaysHouse_1F.inc"
	.include "data/text/maps/LittlerootTown_MaysHouse_2F.inc"
	.include "data/text/maps/LittlerootTown_ProfessorBirchsLab.inc"
	.include "data/text/maps/OldaleTown_House1.inc"
	.include "data/text/maps/OldaleTown_House2.inc"
	.include "data/text/maps/OldaleTown_PokemonCenter_1F.inc"
	.include "data/text/maps/OldaleTown_Mart.inc"
	.include "data/text/maps/DewfordTown_House1.inc"
	.include "data/text/maps/DewfordTown_PokemonCenter_1F.inc"
	.include "data/text/maps/DewfordTown_Gym.inc"
	.include "data/text/maps/DewfordTown_Hall.inc"
	.include "data/text/maps/DewfordTown_House2.inc"
	.include "data/text/maps/LavaridgeTown_HerbShop.inc"
	.include "data/text/maps/LavaridgeTown_Gym_1F.inc"
	.include "data/text/maps/LavaridgeTown_House.inc"
	.include "data/text/maps/LavaridgeTown_Mart.inc"
	.include "data/text/maps/LavaridgeTown_PokemonCenter_1F.inc"
	.include "data/text/maps/FallarborTown_Mart.inc"
	.include "data/text/maps/FallarborTown_ContestLobby.inc"
	.include "data/text/maps/FallarborTown_ContestHall.inc"
	.include "data/text/maps/FallarborTown_PokemonCenter_1F.inc"
	.include "data/text/maps/FallarborTown_House1.inc"
	.include "data/text/maps/FallarborTown_House2.inc"
	.include "data/text/maps/VerdanturfTown_ContestLobby.inc"
	.include "data/text/maps/VerdanturfTown_ContestHall.inc"
	.include "data/text/maps/VerdanturfTown_Mart.inc"
	.include "data/text/maps/VerdanturfTown_PokemonCenter_1F.inc"
	.include "data/text/maps/VerdanturfTown_WandasHouse.inc"
	.include "data/text/maps/VerdanturfTown_FriendshipRatersHouse.inc"
	.include "data/text/maps/VerdanturfTown_House.inc"
	.include "data/text/maps/PacifidlogTown_PokemonCenter_1F.inc"
	.include "data/text/maps/PacifidlogTown_House1.inc"
	.include "data/text/maps/PacifidlogTown_House2.inc"
	.include "data/text/maps/PacifidlogTown_House3.inc"
	.include "data/text/maps/PacifidlogTown_House4.inc"
	.include "data/text/maps/PacifidlogTown_House5.inc"
	.include "data/text/maps/PetalburgCity_WallysHouse.inc"
	.include "data/text/maps/PetalburgCity_Gym.inc"
	.include "data/text/maps/PetalburgCity_House1.inc"
	.include "data/text/maps/PetalburgCity_House2.inc"
	.include "data/text/maps/PetalburgCity_PokemonCenter_1F.inc"
	.include "data/text/maps/PetalburgCity_Mart.inc"
	.include "data/text/maps/SlateportCity_SternsShipyard_1F.inc"
	.include "data/text/maps/SlateportCity_SternsShipyard_2F.inc"
	.include "data/text/maps/SlateportCity_ContestLobby.inc"
	.include "data/text/maps/SlateportCity_ContestHall.inc"
	.include "data/text/maps/SlateportCity_House1.inc"
	.include "data/text/maps/SlateportCity_PokemonFanClub.inc"
	.include "data/text/maps/SlateportCity_OceanicMuseum_1F.inc"
	.include "data/text/maps/SlateportCity_OceanicMuseum_2F.inc"
	.include "data/text/maps/SlateportCity_Harbor.inc"
	.include "data/text/maps/SlateportCity_House2.inc"
	.include "data/text/maps/SlateportCity_PokemonCenter_1F.inc"
	.include "data/text/maps/SlateportCity_Mart.inc"
	.include "data/text/maps/MauvilleCity_Gym.inc"
	.include "data/text/maps/MauvilleCity_BikeShop.inc"
	.include "data/text/maps/MauvilleCity_House1.inc"
	.include "data/text/maps/MauvilleCity_GameCorner.inc"
	.include "data/text/maps/MauvilleCity_House2.inc"
	.include "data/text/maps/MauvilleCity_PokemonCenter_1F.inc"
	.include "data/text/maps/MauvilleCity_PokemonCenter_2F.inc"
	.include "data/text/maps/MauvilleCity_Mart.inc"
	.include "data/text/maps/RustboroCity_DevonCorp_1F.inc"
	.include "data/text/maps/RustboroCity_DevonCorp_2F.inc"
	.include "data/text/maps/RustboroCity_DevonCorp_3F.inc"
	.include "data/text/maps/RustboroCity_Gym.inc"
	.include "data/text/maps/RustboroCity_PokemonSchool.inc"
	.include "data/text/maps/RustboroCity_PokemonCenter_1F.inc"
	.include "data/text/maps/RustboroCity_Mart.inc"
	.include "data/text/maps/RustboroCity_Flat1_1F.inc"
	.include "data/text/maps/RustboroCity_Flat1_2F.inc"
	.include "data/text/maps/RustboroCity_House1.inc"
	.include "data/text/maps/RustboroCity_CuttersHouse.inc"
	.include "data/text/maps/RustboroCity_House2.inc"
	.include "data/text/maps/RustboroCity_Flat2_1F.inc"
	.include "data/text/maps/RustboroCity_Flat2_2F.inc"
	.include "data/text/maps/RustboroCity_Flat2_3F.inc"
	.include "data/text/maps/RustboroCity_House3.inc"
	.include "data/text/maps/FortreeCity_House1.inc"
	.include "data/text/maps/FortreeCity_Gym.inc"
	.include "data/text/maps/FortreeCity_PokemonCenter_1F.inc"
	.include "data/text/maps/FortreeCity_Mart.inc"
	.include "data/text/maps/FortreeCity_House2.inc"
	.include "data/text/maps/FortreeCity_House3.inc"
	.include "data/text/maps/FortreeCity_House4.inc"
	.include "data/text/maps/FortreeCity_House5.inc"
	.include "data/text/maps/FortreeCity_DecorationShop.inc"
	.include "data/text/maps/LilycoveCity_CoveLilyMotel_1F.inc"
	.include "data/text/maps/LilycoveCity_CoveLilyMotel_2F.inc"
	.include "data/text/maps/LilycoveCity_LilycoveMuseum_1F.inc"
	.include "data/text/maps/LilycoveCity_LilycoveMuseum_2F.inc"
	.include "data/text/maps/LilycoveCity_ContestLobby.inc"
	.include "data/text/maps/LilycoveCity_ContestHall.inc"
	.include "data/text/maps/LilycoveCity_PokemonCenter_1F.inc"
	.include "data/text/maps/LilycoveCity_PokemonTrainerFanClub.inc"
	.include "data/text/maps/LilycoveCity_Harbor.inc"
	.include "data/text/maps/LilycoveCity_MoveDeletersHouse.inc"
	.include "data/text/maps/LilycoveCity_House1.inc"
	.include "data/text/maps/LilycoveCity_House2.inc"
	.include "data/text/maps/LilycoveCity_House3.inc"
	.include "data/text/maps/LilycoveCity_House4.inc"
	.include "data/text/maps/LilycoveCity_DepartmentStore_1F.inc"
	.include "data/text/maps/LilycoveCity_DepartmentStore_2F.inc"
	.include "data/text/maps/LilycoveCity_DepartmentStore_3F.inc"
	.include "data/text/maps/LilycoveCity_DepartmentStore_4F.inc"
	.include "data/text/maps/LilycoveCity_DepartmentStore_5F.inc"
	.include "data/text/maps/LilycoveCity_DepartmentStoreRooftop.inc"
	.include "data/text/maps/MossdeepCity_Gym.inc"
	.include "data/text/maps/MossdeepCity_House1.inc"
	.include "data/text/maps/MossdeepCity_House2.inc"
	.include "data/text/maps/MossdeepCity_PokemonCenter_1F.inc"
	.include "data/text/maps/MossdeepCity_PokemonCenter_2F.inc"
	.include "data/text/maps/MossdeepCity_Mart.inc"
	.include "data/text/maps/MossdeepCity_House3.inc"
	.include "data/text/maps/MossdeepCity_StevensHouse.inc"
	.include "data/text/maps/MossdeepCity_House4.inc"
	.include "data/text/maps/MossdeepCity_SpaceCenter_1F.inc"
	.include "data/text/maps/MossdeepCity_SpaceCenter_2F.inc"
	.include "data/text/maps/MossdeepCity_GameCorner_1F.inc"
	.include "data/text/maps/MossdeepCity_GameCorner_B1F.inc"
	.include "data/text/maps/SootopolisCity_Gym_1F.inc"
	.include "data/text/maps/SootopolisCity_Gym_B1F.inc"
	.include "data/text/maps/SootopolisCity_PokemonCenter_1F.inc"
	.include "data/text/maps/SootopolisCity_Mart.inc"
	.include "data/text/maps/SootopolisCity_House1.inc"
	.include "data/text/maps/SootopolisCity_House2.inc"
	.include "data/text/maps/SootopolisCity_House3.inc"
	.include "data/text/maps/SootopolisCity_House4.inc"
	.include "data/text/maps/SootopolisCity_House5.inc"
	.include "data/text/maps/SootopolisCity_House6.inc"
	.include "data/text/maps/SootopolisCity_House7.inc"
	.include "data/text/maps/SootopolisCity_House8.inc"
	.include "data/text/maps/EverGrandeCity_SidneysRoom.inc"
	.include "data/text/maps/EverGrandeCity_PhoebesRoom.inc"
	.include "data/text/maps/EverGrandeCity_GlaciasRoom.inc"
	.include "data/text/maps/EverGrandeCity_DrakesRoom.inc"
	.include "data/text/maps/EverGrandeCity_ChampionsRoom.inc"
	.include "data/text/maps/EverGrandeCity_PokemonLeague.inc"
	.include "data/text/maps/EverGrandeCity_HallOfFame.inc"
	.include "data/text/maps/EverGrandeCity_PokemonCenter_1F.inc"
	.include "data/text/maps/Route104_MrBrineysHouse.inc"
	.include "data/text/maps/Route111_WinstrateFamilysHouse.inc"
	.include "data/text/maps/Route111_OldLadysRestStop.inc"
	.include "data/text/maps/Route112_CableCarStation.inc"
	.include "data/text/maps/MtChimney_CableCarStation.inc"
	.include "data/text/maps/Route114_FossilManiacsHouse.inc"
	.include "data/text/maps/Route114_FossilManiacsTunnel.inc"
	.include "data/text/maps/Route114_LanettesHouse.inc"
	.include "data/text/maps/Route116_TunnelersRestHouse.inc"
	.include "data/text/maps/MeteorFalls_1F_1R.inc"
	.include "data/text/maps/MeteorFalls_1F_2R.inc"
	.include "data/text/maps/RusturfTunnel.inc"
	.include "data/text/maps/GraniteCave_1F.inc"
	.include "data/text/maps/GraniteCave_StevensRoom.inc"
	.include "data/text/maps/PetalburgWoods.inc"
	.include "data/text/maps/MtChimney.inc"
	.include "data/text/maps/JaggedPass.inc"
	.include "data/text/maps/MtPyre_1F.inc"
	.include "data/text/maps/MtPyre_2F.inc"
	.include "data/text/maps/MtPyre_3F.inc"
	.include "data/text/maps/MtPyre_4F.inc"
	.include "data/text/maps/MtPyre_5F.inc"
	.include "data/text/maps/MtPyre_6F.inc"
	.include "data/text/maps/AquaHideout_1F.inc"
	.include "data/text/maps/AquaHideout_B1F.inc"
	.include "data/text/maps/AquaHideout_B2F.inc"
	.include "data/text/maps/Underwater_SeafloorCavern.inc"
	.include "data/text/maps/SeafloorCavern_Room1.inc"
	.include "data/text/maps/SeafloorCavern_Room3.inc"
	.include "data/text/maps/SeafloorCavern_Room4.inc"
	.include "data/text/maps/VictoryRoad_1F.inc"
	.include "data/text/maps/VictoryRoad_B1F.inc"
	.include "data/text/maps/VictoryRoad_B2F.inc"
	.include "data/text/maps/ShoalCave_LowTideEntranceRoom.inc"
	.include "data/text/maps/ShoalCave_LowTideInnerRoom.inc"
	.include "data/text/maps/ShoalCave_LowTideStairsRoom.inc"
	.include "data/text/maps/ShoalCave_LowTideLowerRoom.inc"
	.include "data/text/maps/NewMauville_Entrance.inc"
	.include "data/text/maps/NewMauville_Inside.inc"
	.include "data/text/maps/AbandonedShip_Corridors_1F.inc"
	.include "data/text/maps/AbandonedShip_Rooms_1F.inc"
	.include "data/text/maps/AbandonedShip_Corridors_B1F.inc"
	.include "data/text/maps/AbandonedShip_HiddenFloorCorridors.inc"
	.include "data/text/maps/AbandonedShip_Rooms_B1F.inc"
	.include "data/text/maps/AbandonedShip_Rooms2_B1F.inc"
	.include "data/text/maps/AbandonedShip_Rooms2_1F.inc"
	.include "data/text/maps/AbandonedShip_CaptainsOffice.inc"
	.include "data/text/maps/AbandonedShip_HiddenFloorRooms.inc"
	.include "data/text/maps/SecretBase_RedCave1.inc"
	.include "data/text/maps/InsideOfTruck.inc"
	.include "data/text/maps/SSTidalCorridor.inc"
	.include "data/text/maps/SSTidalLowerDeck.inc"
	.include "data/text/maps/SSTidalRooms.inc"
	.include "data/text/maps/BattleTower_Outside.inc"
	.include "data/text/maps/BattleTower_Lobby.inc"
	.include "data/text/maps/BattleTower_BattleRoom.inc"
	.include "data/text/maps/SouthernIsland_Exterior.inc"
	.include "data/text/maps/SouthernIsland_Interior.inc"
	.include "data/text/maps/Route104_Prototype.inc"
	.include "data/text/maps/Route104_PrototypePrettyPetalFlowerShop.inc"
	.include "data/text/maps/Route109_SeashoreHouse.inc"
	.include "data/text/maps/Route110_TrickHouseEntrance.inc"

Route110_TrickHousePuzzle1_Text_19C1B8:: @ 819C1B8
	.string "{PLAYER} findet eine Schriftrolle.$"

Route110_TrickHousePuzzle1_Text_19C1CB:: @ 819C1CB
	.string "{PLAYER} lernt den geheimen Code, der\n"
	.string "auf der Schriftrolle steht, auswendig.$"

Route110_TrickHousePuzzle1_Text_19C1FF:: @ 819C1FF
	.string "Dort steht ein geheimer Code.$"

UnknownString_819C21F: @ 819C21F
	.string "Die Tür ist verschlossen.\p"
	.string "Bei näherer Betrachtung findet sich\n"
	.string "ein Hinweis. “Schreibe hier den\l"
	.string "geheimen Code auf.”$"

	.include "data/text/maps/Route110_TrickHouseEnd.inc"
	.include "data/text/maps/Route110_TrickHousePuzzle1.inc"
	.include "data/text/maps/Route110_TrickHousePuzzle2.inc"
	.include "data/text/maps/Route110_TrickHousePuzzle3.inc"
	.include "data/text/maps/Route110_TrickHousePuzzle4.inc"
	.include "data/text/maps/Route110_TrickHousePuzzle5.inc"
	.include "data/text/maps/Route110_TrickHousePuzzle6.inc"
	.include "data/text/maps/Route110_TrickHousePuzzle7.inc"
	.include "data/text/maps/Route110_TrickHousePuzzle8.inc"
	.include "data/text/maps/Route110_SeasideCyclingRoadSouthEntrance.inc"
	.include "data/text/maps/Route110_SeasideCyclingRoadNorthEntrance.inc"
	.include "data/text/maps/Route113_GlassWorkshop.inc"
	.include "data/text/maps/Route123_BerryMastersHouse.inc"
	.include "data/text/maps/Route119_WeatherInstitute_1F.inc"
	.include "data/text/maps/Route119_WeatherInstitute_2F.inc"
	.include "data/text/maps/Route119_House.inc"
	.include "data/text/maps/Route124_DivingTreasureHuntersHouse.inc"


Std_2:
	lock
	faceplayer
	message 0x0
	waittext
	waitbutton
	release
	return

Std_3:
	lockall
	message 0x0
	waittext
	waitbutton
	releaseall
	return

Std_4:
	message 0x0
	waittext
	waitbutton
	return

Std_5:
	message 0x0
	waittext
	yesnobox 20, 8
	return

@ 819F805
	return

BattleTower_Lobby_EventScript_19F806:: @ 819F806
FallarborTown_ContestLobby_EventScript_19F806:: @ 819F806
LilycoveCity_ContestLobby_EventScript_19F806:: @ 819F806
MossdeepCity_GameCorner_1F_EventScript_19F806:: @ 819F806
OldaleTown_PokemonCenter_2F_EventScript_19F806:: @ 819F806
SecretBase_RedCave1_EventScript_19F806:: @ 819F806
	special 93
	waitstate
	return

gUnknown_0819F80B:: @ 819F80B
	lock
	special 56
	special 55
	waitstate
	jump EventScript_19F8F2

gUnknown_0819F818:: @ 819F818
	lock
	faceplayer
	move LAST_TALKED, Movement_19F8F0
	waitmove 0
	specialval RESULT, 54
	compare RESULT, 0
	jumpif 5, EventScript_19F83F
	special 56
	special 314
	jump EventScript_19F8F2

EventScript_19F83F:
	endtrainerbattle

gUnknown_0819F840:: @ 819F840
	lock
	faceplayer
	call EventScript_19F8E5
	specialval RESULT, 54
	compare RESULT, 0
	jumpif 5, EventScript_19F877
	special 61
	compare RESULT, 0
	jumpif 5, EventScript_19F870
	special 56
	special 314
	jump EventScript_19F8F2

EventScript_19F870:
	special 53
	waittext
	waitbutton
	release
	end

EventScript_19F877:
	endtrainerbattle

gUnknown_0819F878:: @ 819F878
	move LAST_TALKED, Movement_19F8F0
	waitmove 0
	special 56
	reptrainerbattle
	endtrainerbattle

gUnknown_0819F887:: @ 819F887
	call EventScript_19F8E5
	specialval RESULT, 58
	compare RESULT, 0
	jumpeq EventScript_19F8AD
	special 56
	special 314
	special 52
	waittext
	waitbutton
	special 59
	waitstate
	releaseall
	end

EventScript_19F8AD:
	endtrainerbattle

gUnknown_0819F8AE:: @ 819F8AE
	specialval RESULT, 58
	compare RESULT, 0
	jumpeq EventScript_19F8DD
	special 61
	compare RESULT, 0
	jumpif 5, EventScript_19F8DE
	special 56
	special 314
	special 52
	waittext
	waitbutton
	special 59
	waitstate
	releaseall
	end

EventScript_19F8DD:
	endtrainerbattle

EventScript_19F8DE:
	special 53
	waittext
	waitbutton
	release
	end

EventScript_19F8E5:
	move LAST_TALKED, Movement_19F8F0
	waitmove 0
	return

Movement_19F8F0::
	step_59
	step_end

EventScript_19F8F2:
	special 52
	waittext
	waitbutton
	reptrainerbattle
	specialval RESULT, 51
	compare RESULT, 0
	jumpeq EventScript_19F934
	compare RESULT, 2
	jumpeq EventScript_19F936
	compare RESULT, 1
	jumpeq EventScript_19F936
	compare RESULT, 6
	jumpeq EventScript_19F936
	compare RESULT, 8
	jumpeq EventScript_19F936

EventScript_19F934:
	releaseall
	end

EventScript_19F936:
	endtrainerbattle2

Std_6::
	message 0x0
	waittext
	waitbutton
	release
	return

Event_ResetBerryTrees: @ 19F940
	event_8a 2, 7, 5
	event_8a 1, 3, 5
	event_8a 11, 7, 5
	event_8a 13, 3, 5
	event_8a 4, 7, 5
	event_8a 76, 1, 5
	event_8a 8, 1, 5
	event_8a 10, 6, 5
	event_8a 25, 20, 5
	event_8a 26, 2, 5
	event_8a 66, 2, 5
	event_8a 67, 20, 5
	event_8a 69, 22, 5
	event_8a 70, 22, 5
	event_8a 71, 22, 5
	event_8a 55, 17, 5
	event_8a 56, 17, 5
	event_8a 5, 1, 5
	event_8a 6, 6, 5
	event_8a 7, 1, 5
	event_8a 16, 18, 5
	event_8a 17, 18, 5
	event_8a 18, 18, 5
	event_8a 29, 19, 5
	event_8a 28, 19, 5
	event_8a 27, 19, 5
	event_8a 24, 4, 5
	event_8a 23, 3, 5
	event_8a 22, 3, 5
	event_8a 21, 4, 5
	event_8a 19, 16, 5
	event_8a 20, 16, 5
	event_8a 80, 7, 5
	event_8a 81, 7, 5
	event_8a 77, 8, 5
	event_8a 78, 8, 5
	event_8a 68, 8, 5
	event_8a 31, 10, 5
	event_8a 33, 10, 5
	event_8a 34, 21, 5
	event_8a 35, 21, 5
	event_8a 36, 21, 5
	event_8a 83, 24, 5
	event_8a 84, 24, 5
	event_8a 85, 10, 5
	event_8a 86, 6, 5
	event_8a 37, 5, 5
	event_8a 38, 5, 5
	event_8a 39, 5, 5
	event_8a 40, 3, 5
	event_8a 41, 3, 5
	event_8a 42, 3, 5
	event_8a 46, 19, 5
	event_8a 45, 20, 5
	event_8a 44, 18, 5
	event_8a 43, 16, 5
	event_8a 47, 8, 5
	event_8a 48, 5, 5
	event_8a 49, 4, 5
	event_8a 50, 2, 5
	event_8a 52, 18, 5
	event_8a 53, 18, 5
	event_8a 62, 6, 5
	event_8a 64, 6, 5
	event_8a 58, 21, 5
	event_8a 59, 21, 5
	event_8a 60, 25, 5
	event_8a 61, 25, 5
	event_8a 79, 23, 5
	event_8a 14, 23, 5
	event_8a 15, 21, 5
	event_8a 30, 21, 5
	event_8a 65, 25, 5
	event_8a 72, 25, 5
	event_8a 73, 23, 5
	event_8a 74, 23, 5
	event_8a 87, 3, 5
	event_8a 88, 10, 5
	event_8a 89, 4, 5
	event_8a 82, 36, 5
	return

gUnknown_0819FA81:: @ 819FA81
	setflag 86
	setflag 769
	setflag 770
	setflag 771
	setflag 721
	setflag 889
	setflag 726
	setflag 867
	setflag 731
	setflag 732
	setflag 814
	setflag 868
	setflag 739
	setflag 881
	setflag 738
	setflag 740
	setflag 741
	setflag 743
	setflag 744
	setflag 906
	setflag 737
	setflag 747
	setflag 748
	setflag 749
	setflag 756
	setflag 774
	setflag 895
	setflag 776
	setflag 777
	setflag 778
	setflag 779
	setflag 780
	setflag 781
	setflag 782
	setflag 783
	setflag 734
	setflag 849
	setflag 789
	setflag 790
	setflag 791
	setflag 792
	setflag 797
	setflag 798
	setflag 799
	setflag 901
	setflag 902
	setflag 903
	setflag 904
	setflag 800
	setflag 801
	setflag 803
	setflag 802
	setflag 806
	setflag 808
	setflag 809
	setflag 984
	setflag 811
	setflag 812
	setflag 866
	setflag 815
	setflag 816
	setflag 869
	setflag 823
	setflag 828
	setflag 829
	setflag 831
	setflag 859
	setflag 841
	setflag 843
	setflag 844
	setflag 847
	setflag 845
	setflag 846
	setflag 860
	setflag 861
	setflag 835
	setflag 840
	setflag 848
	setflag 851
	setflag 855
	setflag 856
	setflag 973
	setflag 870
	setflag 872
	setflag 877
	setflag 879
	setflag 891
	setflag 880
	setflag 878
	setflag 807
	setflag 983
	setflag 886
	setflag 884
	setflag 885
	setflag 961
	setflag 888
	setflag 941
	setflag 752
	setflag 757
	setflag 892
	setflag 896
	setflag 897
	setflag 898
	setflag 909
	setflag 910
	setflag 911
	setflag 915
	setflag 912
	setflag 920
	setflag 921
	setflag 922
	setflag 923
	setflag 925
	setflag 929
	setflag 930
	setflag 934
	setflag 939
	setflag 940
	setflag 928
	setflag 834
	setflag 944
	setflag 945
	setflag 947
	setflag 948
	setflag 858
	setflag 950
	setflag 968
	setflag 1133
	setflag 727
	setflag 979
	setflag 751
	setflag 991
	call Event_ResetBerryTrees
	end

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

EventScript_LeagueWhiteOut:: @ 819FC74
	call EverGrandeCity_HallOfFame_EventScript_19FD09
	call EventScript_19FC84
	jump gUnknown_0819FC9F
	end

EventScript_19FC84:
	checkflag 221
	jumpeq Route101_EventScript_1A14DC
	checkflag 1213
	jumpif 0, Route101_EventScript_1A14DC
	clearflag 929
	setvar 0x4053, 2
	return

gUnknown_0819FC9F:: @ 819FC9F
	compare 0x4096, 1
	jumpeq EventScript_19FCC1
	compare 0x4096, 2
	jumpeq EventScript_19FCD7
	compare 0x4096, 3
	jumpeq EventScript_19FCF0
	end

EventScript_19FCC1:
	setflag 740
	setflag 743
	setflag 741
	setflag 744
	clearflag 742
	clearflag 739
	clearflag 881
	end

EventScript_19FCD7:
	setflag 741
	setflag 744
	setflag 738
	setflag 742
	setflag 739
	setflag 881
	clearflag 740
	clearflag 743
	end

EventScript_19FCF0:
	setflag 738
	setflag 742
	setflag 739
	setflag 881
	setflag 740
	setflag 743
	clearflag 741
	clearflag 744
	end

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
	inccounter GAME_STAT_USED_POKECENTER
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

gUnknown_081A0009:: @ 81A0009
	lockall
	setvar 0x8004, 0
	special 214
	playsfx 4
	msgbox UnknownString_81A09EC, 4
	jump EventScript_1A0023
	end

EventScript_1A0023:
	message gPCText_WhichPCShouldBeAccessed
	waittext
	special 262
	waitstate
	jump EventScript_1A0033
	end

EventScript_1A0033:
	switch RESULT
	case 0, EventScript_1A0085
	case 1, EventScript_1A0070
	case 2, EventScript_1A00CB
	case 3, EventScript_1A00BE
	case 127, EventScript_1A00BE
	end

EventScript_1A0070:
	playsfx 2
	msgbox UnknownString_81A0A54, 4
	special 250
	waitstate
	jump EventScript_1A0023
	end

EventScript_1A0085:
	playsfx 2
	checkflag 2123
	callif 0, EventScript_1A00AC
	checkflag 2123
	callif 1, EventScript_1A00B5
	msgbox UnknownString_81A0A35, 4
	special 60
	waitstate
	jump EventScript_1A0023
	end

EventScript_1A00AC:
	msgbox UnknownString_81A0A1E, 4
	return

EventScript_1A00B5:
	msgbox UnknownString_81A0A66, 4
	return

EventScript_1A00BE:
	setvar 0x8004, 0
	playsfx 3
	special 215
	releaseall
	end

EventScript_1A00CB:
	checkflag 2052
	jumpif 0, EventScript_1A00BE
	playsfx 2
	special 263
	waitstate
	jump EventScript_1A0033
	end

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

UseSurfScript:: @ 81A0117
	checkattack MOVE_SURF
	compare RESULT, 6
	jumpeq UseSurfScript_NoMon
	bufferpartypoke 0, RESULT
	setanimation 0, RESULT
	lockall
	msgbox UseSurfPromptText, 5
	compare RESULT, 0
	jumpeq UseSurfScript_No
	msgbox UsedSurfText, 4
	doanimation 9
UseSurfScript_No: @ 81A014C
	releaseall
UseSurfScript_NoMon: @ 81A014D
	end

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
	.ifdef SAPPHIRE
	setvar 0x4011, 117
	setvar 0x4012, 118
	setvar 0x4014, 119
	setvar 0x4015, 120
	setvar 0x4016, 195
	setvar 0x4017, 196
	.else
	setvar 0x4011, 119
	setvar 0x4012, 120
	setvar 0x4014, 117
	setvar 0x4015, 118
	setvar 0x4016, 196
	setvar 0x4017, 195
	.endif
	return

CaveOfOrigin_B4F_EventScript_1A01B5:: @ 81A01B5
SeafloorCavern_Room9_EventScript_1A01B5:: @ 81A01B5
	.ifdef SAPPHIRE
	setvar 0x4018, 197
	setvar 0x4019, 205
	.else
	setvar 0x4018, 198
	setvar 0x4019, 206
	.endif
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
	cleartrainerflag OPPONENT_JOSH
	cleartrainerflag OPPONENT_TOMMY
	return

DewfordTown_Gym_EventScript_1A0225:: @ 81A0225
	cleartrainerflag OPPONENT_HIDEKI
	cleartrainerflag OPPONENT_TESSA
	cleartrainerflag OPPONENT_LAURA
	return

DewfordTown_Gym_EventScript_1A022F:: @ 81A022F
	cleartrainerflag OPPONENT_KIRK
	cleartrainerflag OPPONENT_SHAWN
	cleartrainerflag OPPONENT_BEN
	cleartrainerflag OPPONENT_VIVIAN
	return

DewfordTown_Gym_EventScript_1A023C:: @ 81A023C
	cleartrainerflag OPPONENT_COLE
	cleartrainerflag OPPONENT_AXLE
	cleartrainerflag OPPONENT_ANDY
	cleartrainerflag OPPONENT_ZANE
	cleartrainerflag OPPONENT_SADIE
	return

DewfordTown_Gym_EventScript_1A024C:: @ 81A024C
	cleartrainerflag OPPONENT_RANDALL
	cleartrainerflag OPPONENT_PARKER
	cleartrainerflag OPPONENT_GEORGE
	cleartrainerflag OPPONENT_BERKE
	cleartrainerflag OPPONENT_MARY
	cleartrainerflag OPPONENT_LORI
	cleartrainerflag OPPONENT_JODY
	return

DewfordTown_Gym_EventScript_1A0262:: @ 81A0262
	cleartrainerflag OPPONENT_JARED
	cleartrainerflag OPPONENT_TERRELL
	cleartrainerflag OPPONENT_KYLEE
	cleartrainerflag OPPONENT_WILL
	return

DewfordTown_Gym_EventScript_1A026F:: @ 81A026F
	cleartrainerflag OPPONENT_PRESTON
	cleartrainerflag OPPONENT_VIRGIL
	cleartrainerflag OPPONENT_FRITZ
	cleartrainerflag OPPONENT_HANNAH
	cleartrainerflag OPPONENT_SAMANTHA
	cleartrainerflag OPPONENT_MAURA
	return

DewfordTown_Gym_EventScript_1A0282:: @ 81A0282
	cleartrainerflag OPPONENT_ANDREA
	cleartrainerflag OPPONENT_CRISSY
	cleartrainerflag OPPONENT_BRIANNA_2
	cleartrainerflag OPPONENT_CONNIE
	cleartrainerflag OPPONENT_BRIDGET
	cleartrainerflag OPPONENT_OLIVIA
	cleartrainerflag OPPONENT_TIFFANY
	cleartrainerflag OPPONENT_MARISSA
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
	.ifdef SAPPHIRE
	setweather 13
	.else
	setweather 12
	.endif
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

Event_WorldMap:: @ 81A02D6
	lockall
	msgbox UnknownString_817303D, 4
	fadescreen 1
	special 251
	waitstate
	releaseall
	end

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
	buffernum 0, 0x8008
	buffernum 1, 0x8009
	msgbox Route101_Text_1C44DC, 4
	call Route101_EventScript_1A03A5
	compare 0x800a, 0
	jumpeq Route101_EventScript_1A14DC
	setvar 0x8004, 1
	specialval RESULT, 212
	copyvar 0x8008, 0x8005
	copyvar 0x8009, 0x8006
	buffernum 0, 0x8008
	buffernum 1, 0x8009
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

EventScript_1A0457: @ unreferenced?
	pause 30
	move 255, SlateportCity_OceanicMuseum_2F_Movement_1A0841
	waitmove 0
	spritevisible 255, 0, 0
	pause 30
	move 255, Movement_1A047A
	waitmove 0
	pause 30
	return

Movement_1A047A:
	step_up
	step_end

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
	pokecry SPECIES_GROUDON_OR_KYOGRE, 2
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

@ 81A04C7
	lockall
	setvar 0x4003, 1
	jump CaveOfOrigin_B2F_EventScript_1A04D3
	end

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

@ 81A083B
	step_3f
	step_end

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

Movement_1A083F:: @ 81A083F
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

@ 81A0858
	step_up
	step_up
	step_end

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
	.string "Dies ist Beispiel 1.\p"
	.string "Willkommen in der Welt von\n"
	.string "POKéMON AGB!\l"
	.string "Wir hoffen, dir gefällt es hier!$"

SampleMessage2:: @ 81A08F1
	.string "Dies ist Beispiel 2.\p"
	.string "Willkommen in der Welt von\n"
	.string "POKéMON AGB!\l"
	.string "Wir hoffen, dir gefällt es hier!$"

SampleMessage3:: @ 81A0948
	.string "Dies ist Beispiel 3.\p"
	.string "Willkommen in der Welt von\n"
	.string "POKéMON AGB!\l"
	.string "Wir hoffen, dir gefällt es hier!$"

UnusedMixRecordsPromptText: @ 81A099F
	.string "Möchtest du deine Rekorde mit\n"
	.string "anderen TRAINERN austauschen?$"

UnusedMixRecordsSeeYouAgainText: @ 81A09D2
	.string "Komm bald wieder!$"

UnknownString_81A09EC: @ 81A09EC
	.string "{PLAYER} schaltet den PC ein.$"

gPCText_WhichPCShouldBeAccessed:: @ 81A0A01
	.string "Zugriff auf wessen PC?$"

UnknownString_81A0A1E: @ 81A0A1E
	.string "Verbindung zu jemandes PC hergestellt.$"

UnknownString_81A0A35: @ 81A0A35
	.string "POKéMON-Lagerungs-System geöffnet.$"

UnknownString_81A0A54: @ 81A0A54
	.string "Verbindung mit PC von {PLAYER}.$"

UnknownString_81A0A66: @ 81A0A66
	.string "Verbindung zu LANETTES PC hergestellt.$"

OldaleTown_PokemonCenter_1F_Text_1A0A7D:: @ 81A0A7D
	.string "Willkommen im POKéMON-CENTER!\p"
	.string "Wir heilen deine POKéMON und\n"
	.string "machen sie wieder fit.\p"
	.string "O.K. Wir benötigen deine POKéMON.$"

OldaleTown_PokemonCenter_1F_Text_1A0AFA:: @ 81A0AFA
	.string "Komm jederzeit wieder vorbei!$"

OldaleTown_PokemonCenter_1F_Text_1A0B14:: @ 81A0B14
	.string "Danke!\p"
	.string "Deine POKéMON sind wieder topfit!$"

UnknownString_81A0B57: @ 81A0B57
	.string "Willkommen im POKéMON KABEL-CLUB-\n"
	.string "HANDELSCENTER.$"

UnknownString_81A0B87: @ 81A0B87
	.string "Willkommen im POKéMON KABEL-CLUB-\n"
	.string "KOLOSSEUM.$"

UnknownString_81A0BB4: @ 81A0BB4
	.string "Willkommen in der POKéMON KABEL-CLUB-\n"
	.string "ZEITKAPSEL.$"

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
	.string "Willkommen!\p"
	.string "Kann ich dir helfen?$"

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
Route104_PrettyPetalFlowerShop_Text_1A0C02:: @ 81A0C02
RustboroCity_Mart_Text_1A0C02:: @ 81A0C02
SlateportCity_Mart_Text_1A0C02:: @ 81A0C02
SlateportCity_Text_1A0C02:: @ 81A0C02
SootopolisCity_Mart_Text_1A0C02:: @ 81A0C02
VerdanturfTown_Mart_Text_1A0C02:: @ 81A0C02
	.string "Bitte komm bald wieder!$"

UnknownString_81A0C15: @ 81A0C15
	.string "Willkommen!\p"
	.string "Wir bieten heute Sonderangebote an!$"

Route104_PrettyPetalFlowerShop_Text_1A0C42:: @ 81A0C42
	.string "{PLAYER}{KUN}, willkommen!\p"
	.string "Wie kann ich dir behilflich sein?$"

Message_ObtainedItem: @ 81A0C68
	.string "{STR_VAR_2} erhalten!$"

LilycoveCity_DepartmentStoreRooftop_Text_1A0C79:: @ 81A0C79
	.string "Der BEUTEL ist voll...$"

LilycoveCity_DepartmentStoreRooftop_Text_1A0C8C:: @ 81A0C8C
Message_PutAwayItem: @ 81A0C8C
	.string "{PLAYER} packt {STR_VAR_2} in die\n"
	.string "{STR_VAR_3}-TASCHE.$"

Message_FoundOneItem: @ 81A0CB1
	.string "{PLAYER} hat {STR_VAR_2} gefunden!$"

MauvilleCity_GameCorner_Text_1A0CC2:: @ 81A0CC2
MauvilleCity_Text_1A0CC2:: @ 81A0CC2
MtChimney_Text_1A0CC2:: @ 81A0CC2
OldaleTown_Text_1A0CC2:: @ 81A0CC2
Route109_SeashoreHouse_Text_1A0CC2:: @ 81A0CC2
Message_BagFull:
	.string "Zu schade!\n"
	.string "Der BEUTEL ist voll...$"

Message_ObtainedDecoration: @ 81A0CDE
	.string "{STR_VAR_2} erhalten.$"

BattleTower_Lobby_Text_1A0CEF:: @ 81A0CEF
MauvilleCity_GameCorner_Text_1A0CEF:: @ 81A0CEF
Route114_LanettesHouse_Text_1A0CEF:: @ 81A0CEF
SootopolisCity_House6_Text_1A0CEF:: @ 81A0CEF
	.string "Zu schade! Es ist kein Platz für\n"
	.string "{STR_VAR_2}...$"

Message_TransferredToPC: @ 81A0D1F
	.string "{STR_VAR_2} wurde auf den PC\n"
	.string "übertragen.$"

PetalburgCity_Text_1A0D41:: @ 81A0D41
	.string "“Ausgewählte Items für Ihren\n"
	.string "Gebrauch!”\l"
	.string "POKéMON-SUPERMARKT$"

PetalburgCity_Text_1A0D75:: @ 81A0D75
	.string "“Erfrische deine müden Partner!”\n"
	.string "POKéMON-CENTER$"

UnknownString_81A0DA6: @ 81A0DA6
	.string "Hahaha...$"

UnknownString_81A0DB0: @ 81A0DB0
	.string "Murmel... Murmel...$"

UnknownString_81A0DC2: @ 81A0DC2
	.string "Oh!$"

UnknownString_81A0DC6: @ 81A0DC6
	.string "Heute geschlossen!$"

UnknownString_81A0DD4: @ 81A0DD4
	.string "Magst du {STR_VAR_3}-POKéMON, {STR_VAR_1}?$"

UnknownString_81A0DF5: @ 81A0DF5
	.string "Er enthält ein POKéMON.$"

UnknownString_81A0E0C: @ 81A0E0C
	.string "Wir treffen Vorbereitungen.$"

UnknownString_81A0E27: @ 81A0E27
	.string "Ich bin ein Pseudo-ARENALEITER für\n"
	.string "Interviews.$"

UnknownString_81A0E4F: @ 81A0E4F
	.string "Bereit für einen Testkampf.$"

UnknownString_81A0E68: @ 81A0E68
	.string "{STR_VAR_1} würde dieses Programm gefallen.\p"
	.string "... ... ... ... ... ... ... ... ... ... ... ... ... ... ... ...\p"
	.string "Ich beeile mich besser!$"

UnknownString_81A0ED6: @ 81A0ED6
	.string "Womit soll ich mir die Zeit vertreiben?$"

LilycoveCity_DepartmentStoreElevator_Text_1A0EF6:: @ 81A0EF6
	.string "Willkommen im SEEGRASULB CITY\n"
	.string "EINKAUFSZENTRUM.\p"
	.string "In welches Stockwerk möchtest du?$"

UnknownString_81A0F38: @ 81A0F38
	.string "Zum DUELLTURM warpen.$"

UnknownString_81A0F4E: @ 81A0F4E
	.string "Nach SEEGRASULB CITY warpen.$"

UnknownString_81A0F60: @ 81A0F60
	.string "Es ist {STR_VAR_1} Uhr.$"

UnknownString_81A0F70: @ 81A0F70
	.string "Zugang zur RUHMESHALLE genehmigt.$"

Route111_Text_1A0F93:: @ 81A0F93
	.string "Der Sandsturm ist zu stark.\n"
	.string "Dagegen kann man nicht angehen!$"

Text_NoRegisteredItem: @ 81A0FCC
	.string "Ein Basis-Item aus dem BEUTEL kann auf\n"
	.string "SELECT gelegt werden. Sehr praktisch!$"

LittlerootTown_BrendansHouse_2F_Text_1A100C:: @ 81A100C
LittlerootTown_MaysHouse_2F_Text_1A100C:: @ 81A100C
	.string "Da ist eine E-Mail von der POKéMON\n"
	.string "TRAINERSCHULE.\p"
	.string "... ... ... ... ... ...\p"
	.string "Ein POKéMON kann bis zu vier Attacken\n"
	.string "lernen.\p"
	.string "Die Fähigkeiten eines TRAINERS werden\n"
	.string "durch die Attacken, die er seinen\l"
	.string "POKéMON beibringt, erprobt.\p"
	.string "... ... ... ... ... ...$"

LittlerootTown_BrendansHouse_2F_Text_1A10D6:: @ 81A10D6
LittlerootTown_MaysHouse_2F_Text_1A10D6:: @ 81A10D6
	.string "{PLAYER} schaltet den PC ein.$"

FallarborTown_ContestLobby_Text_1A10EB:: @ 81A10EB
	.string "Die Verbindung wurde abgebrochen.$"

MossdeepCity_StevensHouse_Text_1A1102:: @ 81A1102
RustboroCity_DevonCorp_2F_Text_1A1102:: @ 81A1102
	.string "Möchtest du {STR_VAR_2} einen\n"
	.string "Kosenamen geben?$"

fieldPoisonText_PokemonFainted:: @ 81A1132
	.string "{STR_VAR_1} wurde besiegt...\p"
	.string "$"

UnknownString_81A1141: @ 81A1141
	.string "{PLAYER} hat kein kampffähiges POKéMON\n"
	.string "mehr!\p"
	.string "{PLAYER} wird ohnmächtig!$"

SlateportCity_Text_1A116E:: @ 81A116E
	.string "Kennst du die TM GEHEIMPOWER?\p"
	.string "In unserer Gruppe mögen alle die TM\n"
	.string "GEHEIMPOWER.\p"
	.string "Eines unserer Mitglieder wird sie dir\n"
	.string "geben. Sag mir, wenn du sie hast.\p"
	.string "Wir werden dich dann als Mitglied auf-\n"
	.string "nehmen und dir unter der Hand tolle\l"
	.string "Sachen verkaufen.$"

OldaleTown_PokemonCenter_1F_Text_1A1245:: @ 81A1245
	.string "Okay, ich nehme deine POKéMON für einen\n"
	.string "Moment in meine Obhut.$"

OldaleTown_PokemonCenter_1F_Text_1A1275:: @ 81A1275
	.string "Dein POKéMON scheint von dem\n"
	.string "POKéRUS befallen zu sein.\p"
	.string "Über den POKéRUS ist bisher wenig be-\n"
	.string "kannt, außer dass es Mikroorganismen\l"
	.string "sind, die POKéMON befallen.\p"
	.string "Sind deine POKéMON infiziert, wachsen\n"
	.string "sie besonders gut.$"

	.include "data/text/surf.inc"

SealedChamber_InnerRoom_Text_1A138B:: @ 81A138B
	.string "Das hörte sich an, als würde irgendwo\n"
	.string "eine Tür geöffnet.$"

AncientTomb_Text_1A13BE:: @ 81A13BE
DesertRuins_Text_1A13BE:: @ 81A13BE
IslandCave_Text_1A13BE:: @ 81A13BE
SealedChamber_OuterRoom_Text_1A13BE:: @ 81A13BE
	.string "In der Wand ist ein großes Loch.$"

OldaleTown_PokemonCenter_2F_Text_1A13DF:: @ 81A13DF
	.string "Tut mir schrecklich Leid. Das KOLOSSEUM\n"
	.string "wird gerade renoviert.$"

OldaleTown_PokemonCenter_2F_Text_1A141C:: @ 81A141C
	.string "Tut mir schrecklich Leid. Das\n"
	.string "HANDELSCENTER wird gerade renoviert.$"

OldaleTown_PokemonCenter_2F_Text_1A145C:: @ 81A145C
	.string "Tut mir schrecklich Leid. Hier wird\n"
	.string "für den STATISTIKTAUSCH renoviert.$"

FallarborTown_House1_Text_1A1498:: @ 81A1498
	.string "{PLAYER} übergibt\n"
	.string "{STR_VAR_1}.$"

Event_NoRegisteredItem:: @ 81A14AF
	msgbox Text_NoRegisteredItem, 3
	end

gUnknown_081A14B8:: @ 81A14B8
	lockall
	special 199
	waitstate
	compare RESULT, 1
	jumpeq EventScript_1A14CA
	releaseall
	end

EventScript_1A14CA::
	message UnknownString_81A1141
	waittext
	waitbutton
	special 332
	waitstate
	fadescreen 1
	special 200
	waitstate
	end

OldaleTown_PokemonCenter_1F_EventScript_1A14DC:: @ 81A14DC
PacifidlogTown_House2_EventScript_1A14DC:: @ 81A14DC
Route101_EventScript_1A14DC:: @ 81A14DC
	return

	.include "data/scripts/berry_tree.inc"
	.include "data/text/berry_tree.inc"

UnknownString_81A1948: @ 81A1948
	.string "Wenn einige Äste herunterhängen, kann\n"
	.string "man auf den Baum klettern.$"

UnknownString_81A197B: @ 81A197B
	.string "Wenn einige Äste herunterhängen, kann\n"
	.string "man auf den Baum klettern.\p"
	.string "Möchtest du GEHEIMPOWER einsetzen?$"

UnknownString_81A19C4: @ 81A19C4
	.string "Ein dicker Ast fällt herunter!$"

UnknownString_81A19DF: @ 81A19DF
	.string "Möchtest du hier deine GEHEIMBASIS\n"
	.string "einrichten?$"

UnknownString_81A1A03: @ 81A1A03
	.string "Dieser Busch kann bewegt werden,\n"
	.string "so dass man hineinklettern kann.$"

UnknownString_81A1A4B: @ 81A1A4B
	.string "Dieser Busch kann bewegt werden,\n"
	.string "so dass man hineinklettern kann.\p"
	.string "Möchtest du GEHEIMPOWER einsetzen?$"

UnknownString_81A1AA9: @ 81A1AA9
	.string "Ein kleiner Eingang wird sichtbar.$"

UnknownString_81A1AC6: @ 81A1AC6
	.string "Möchtest du hier deine GEHEIMBASIS\n"
	.string "einrichten?$"

SecretBase_RedCave1_Text_1A1AEA:: @ 81A1AEA
	.string "Hast du dir schon eine GEHEIMBASIS\n"
	.string "eingerichtet?\p"
	.string "Ich bin hier und dort, überall hin-\n"
	.string "gelaufen, bevor ich mich für diesen\l"
	.string "Ort entschieden habe.\p"
	.string "Da du schon mal hier bist... Hast du\n"
	.string "Lust zu kämpfen?$"

SecretBase_RedCave1_Text_1A1B83:: @ 81A1B83
	.string "Okay!\n"
	.string "Jetzt kommen wir!$"

SecretBase_RedCave1_Text_1A1B97:: @ 81A1B97
	.string "Wie? Was? Wo?\n"
	.string "Du kannst doch nicht...$"

UnknownString_81A1BB2:: @ 81A1BB2
	.string "Ahaaargh! Du bist zu stark für mich! Ich\n"
	.string "habe verloren, aber verrate das nicht!$"

SecretBase_RedCave1_Text_1A1BF8:: @ 81A1BF8
	.string "Was hältst du von meiner GEHEIMBASIS?\n"
	.string "Komm mich doch morgen wieder besuchen!$"

SecretBase_RedCave1_Text_1A1C3B:: @ 81A1C3B
	.string "Hast du dir schon eine GEHEIMBASIS\n"
	.string "eingerichtet?\p"
	.string "Ich bin hier und dort, überall hin-\n"
	.string "gelaufen, bevor ich mich für diesen\l"
	.string "Ort entschieden habe.\p"
	.string "Schau dich ruhig in aller Ruhe um.$"

SecretBase_RedCave1_Text_1A1CB2:: @ 81A1CB2
	.string "Es gibt eine Menge Orte, an denen man\n"
	.string "eine GEHEIMBASIS einrichten kann.\p"
	.string "Aber dieser hier gefällt mir am besten.\n"
	.string "Findest du es nicht auch nett hier?\p"
	.string "Oh, hast du Lust auf einen Kampf?$"

SecretBase_RedCave1_Text_1A1D48:: @ 81A1D48
	.string "Okay, los geht’s!$"

SecretBase_RedCave1_Text_1A1D59:: @ 81A1D59
	.string "Oh...\n"
	.string "Du hast gerade keine Zeit.$"

UnknownString_81A1D74:: @ 81A1D74
	.string "Hmm... Das ist unsere Niederlage...\n"
	.string "Aber erzähl das bloß nicht weiter!\l"
	.string "Das ist ein streng geheimes Geheimnis!$"

SecretBase_RedCave1_Text_1A1DC0:: @ 81A1DC0
	.string "Wenn du wieder mal in der Nähe bist,\n"
	.string "komm mich doch besuchen!$"

SecretBase_RedCave1_Text_1A1DF6:: @ 81A1DF6
	.string "Es gibt eine Menge Orte, an denen man\n"
	.string "eine GEHEIMBASIS einrichten kann.\p"
	.string "Aber dieser hier gefällt mir am besten.\n"
	.string "Findest du es nicht auch nett hier?$"

SecretBase_RedCave1_Text_1A1E67:: @ 81A1E67
	.string "Dies ist ein beliebter Platz.\n"
	.string "Er ist eigentlich immer besetzt.\p"
	.string "Ach, du wolltest dich hier auch\n"
	.string "häuslich niederlassen?\p"
	.string "Ich sag dir was: Du kannst den Platz\n"
	.string "haben, wenn du mich besiegen kannst.$"

SecretBase_RedCave1_Text_1A1F04:: @ 81A1F04
	.string "Okay! Ich werde meine\n"
	.string "GEHEIMBASIS verteidigen!$"

SecretBase_RedCave1_Text_1A1F2E:: @ 81A1F2E
	.string "Was? Stimmt das? Du hast gar\n"
	.string "kein Interesse an diesem Platz?!?$"

UnknownString_81A1F67:: @ 81A1F67
	.string "Ich kann nicht mehr!\n"
	.string "Ich gebe mich geschlagen!$"

SecretBase_RedCave1_Text_1A1F88:: @ 81A1F88
	.string "Okay, wenn ich eines Tages von hier\n"
	.string "fortziehe, kannst du den Platz haben.$"

SecretBase_RedCave1_Text_1A1FBD:: @ 81A1FBD
	.string "Dies ist ein beliebter Platz.\n"
	.string "Er ist eigentlich immer besetzt.\p"
	.string "Ich habe ewig gewartet, bis er wieder\n"
	.string "frei wurde. Endlich ist es soweit!$"

SecretBase_RedCave1_Text_1A2026:: @ 81A2026
	.string "Willkommen in meinem POKéMON-LABOR.\p"
	.string "Ich forsche, indem ich im Geheimen\n"
	.string "kämpfe.\p"
	.string "Möchtest du sehen, wie stark ich bin?$"

SecretBase_RedCave1_Text_1A2095:: @ 81A2095
	.string "Das war ja wohl nichts!$"

SecretBase_RedCave1_Text_1A20AE:: @ 81A20AE
	.string "Oh.\n"
	.string "Ein anderes Mal vielleicht...$"

UnknownString_81A20C9:: @ 81A20C9
	.string "Hm... Ich muss noch viel lernen.\n"
	.string "Ich muss fleißiger studieren.$"

SecretBase_RedCave1_Text_1A2109:: @ 81A2109
	.string "Danke, dass du mit mir gekämpft hast.\n"
	.string "Komm doch bitte morgen wieder.$"

SecretBase_RedCave1_Text_1A2147:: @ 81A2147
	.string "Willkommen in meinem POKéMON-LABOR.\p"
	.string "Ich forsche, indem ich im Geheimen\n"
	.string "kämpfe.$"

SecretBase_RedCave1_Text_1A218F:: @ 81A218F
	.string "Ein großes Anwesen ist natürlich auch\n"
	.string "ganz nett, aber hier ist es schöner.\p"
	.string "Viele Leute kommen mich besuchen.\p"
	.string "So. Wie wäre es mit einem Kampf?$"

SecretBase_RedCave1_Text_1A2220:: @ 81A2220
	.string "Genauso muss es laufen!$"

SecretBase_RedCave1_Text_1A2230:: @ 81A2230
	.string "Wenn du bereit bist, sag Bescheid.$"

UnknownString_81A2254:: @ 81A2254
	.string "Ooch! Ich hab’s vergeigt!\n"
	.string "Aber es hat sehr viel Spaß gemacht!$"

SecretBase_RedCave1_Text_1A2280:: @ 81A2280
	.string "Egal. Ich sollte mir auf jeden Fall einige\n"
	.string "Dekorationen und Möbel zulegen.\p"
	.string "Ich möchte, dass sich auch andere in\n"
	.string "meiner GEHEIMBASIS wohl fühlen.$"

SecretBase_RedCave1_Text_1A22FA:: @ 81A22FA
	.string "Ein großes Anwesen ist natürlich auch\n"
	.string "ganz nett, aber hier ist es schöner.\p"
	.string "Viele Leute kommen mich besuchen.$"

SecretBase_RedCave1_Text_1A236A:: @ 81A236A
	.string "Ich liebe es, Dekorationen und Möbel\n"
	.string "zu kaufen!!!\p"
	.string "Ich liebe es genauso, POKéMON aufzu-\n"
	.string "ziehen!\p"
	.string "Wärest du so nett, mit meinen\n"
	.string "POKéMON zu kämpfen?$"

SecretBase_RedCave1_Text_1A2405:: @ 81A2405
	.string "Danke schön.\n"
	.string "Bist du bereit?$"

SecretBase_RedCave1_Text_1A2420:: @ 81A2420
	.string "Oh.\n"
	.string "Was für eine Enttäuschung.$"

UnknownString_81A2439:: @ 81A2439
	.string "Ich kapituliere...$"

SecretBase_RedCave1_Text_1A2446:: @ 81A2446
	.string "Das war vielleicht ein Spaß! Und nun\n"
	.string "sollte ich mich dem Einkaufen widmen.$"

SecretBase_RedCave1_Text_1A2480:: @ 81A2480
	.string "Ich liebe es, Dekorationen und Möbel\n"
	.string "zu kaufen!!!\p"
	.string "Ich liebe es genauso, POKéMON aufzu-\n"
	.string "ziehen!$"

SecretBase_RedCave1_Text_1A24E1:: @ 81A24E1
	.string "Einige Leute richten ihre GEHEIMBASIS\n"
	.string "an gut versteckten Orten ein.\l"
	.string "Wollen sie sich nicht mehr sehen lassen?\p"
	.string "Da du mich gefunden hast, lass uns\n"
	.string "doch gleich mal kämpfen.$"

SecretBase_RedCave1_Text_1A256F:: @ 81A256F
	.string "Ich bin nicht einfach zu besiegen!$"

SecretBase_RedCave1_Text_1A258A:: @ 81A258A
	.string "Oh. Sag bloß, du bist müde von der Suche\n"
	.string "nach diesem Platz?$"

UnknownString_81A25C3:: @ 81A25C3
	.string "Ich bin untergegangen...$"

SecretBase_RedCave1_Text_1A25D2:: @ 81A25D2
	.string "Wo ist deine GEHEIMBASIS?\n"
	.string "Ich sollte dich dort mal besuchen.$"

SecretBase_RedCave1_Text_1A2609:: @ 81A2609
	.string "Einige Leute richten ihre GEHEIMBASIS\n"
	.string "an gut versteckten Orten ein.\l"
	.string "Wollen sie sich nicht mehr sehen lassen?$"

SecretBase_RedCave1_Text_1A2663:: @ 81A2663
	.string "Einige Leute haben mir erzählt, dass man\n"
	.string "auf verschiedene Arten an Deko-\l"
	.string "rationen kommen kann.\p"
	.string "Wir sollten einen Wettbewerb veran-\n"
	.string "stalten, wer die schönsten Dinge hat.\p"
	.string "Aber zuerst lass uns kämpfen.$"

SecretBase_RedCave1_Text_1A2710:: @ 81A2710
	.string "Das ist meine GEHEIMBASIS.\n"
	.string "Ich kann hier gar nicht verlieren!$"

SecretBase_RedCave1_Text_1A2736:: @ 81A2736
	.string "Ich kämpfe jederzeit mit dir.$"

UnknownString_81A2754:: @ 81A2754
	.string "Wie?\n"
	.string "Ich habe doch verloren?$"

SecretBase_RedCave1_Text_1A276A:: @ 81A276A
	.string "Ich werde den Wettbewerb um die\n"
	.string "schönsten Dekorationen nicht ver-\l"
	.string "lieren. Überzeuge dich selbst!$"

SecretBase_RedCave1_Text_1A27A4:: @ 81A27A4
	.string "Einige Leute haben mir erzählt, dass man\n"
	.string "auf verschiedene Arten an Deko-\l"
	.string "rationen kommen kann.\p"
	.string "Wir sollten einen Wettbewerb veran-\n"
	.string "stalten, wer die schönsten Dinge hat.$"

SecretBase_RedCave1_Text_1A2830:: @ 81A2830
	.string "Ich habe einen Ort gefunden, der mir\n"
	.string "gefällt und den ich mit meinen Lieblings-\l"
	.string "dekorationen ausgestattet habe.\p"
	.string "Dort ziehe ich meine Lieblings-POKéMON\n"
	.string "auf und werde mit ihnen stärker.\p"
	.string "Genau das mache ich.\n"
	.string "Möchtest du mit mir kämpfen?$"

SecretBase_RedCave1_Text_1A28D7:: @ 81A28D7
	.string "Zeig mir, aus welchem Holz du\n"
	.string "geschnitzt bist.$"

SecretBase_RedCave1_Text_1A28F4:: @ 81A28F4
	.string "Ich glaube, es gibt immer wieder Zeiten,\n"
	.string "in denen man nicht so gut drauf ist.$"

UnknownString_81A2925:: @ 81A2925
	.string "Ich weiß jetzt genau, aus welchem Holz\n"
	.string "du geschnitzt bist.$"

SecretBase_RedCave1_Text_1A294D:: @ 81A294D
	.string "Wir können beide noch stärker werden!\n"
	.string "Das macht doch Mut!$"

SecretBase_RedCave1_Text_1A297C:: @ 81A297C
	.string "Ich habe einen Ort gefunden, der mir\n"
	.string "gefällt und den ich mit meinen Lieblings-\l"
	.string "dekorationen ausgestattet habe.\p"
	.string "Dort ziehe ich meine Lieblings-POKéMON\n"
	.string "auf und werde mit ihnen stärker.\p"
	.string "Jeder Tag ist mein Lieblingstag.$"

SecretBase_RedCave1_Text_1A2A13:: @ 81A2A13
	.string "Man lernt viel über den Geschmack und\n"
	.string "den Stil von Menschen, wenn man sich\l"
	.string "ihre Dekorationen und den Platz, auf\l"
	.string "dem sie stehen, anschaut.\p"
	.string "Wie findest du meinen Geschmack?\n"
	.string "Bist du sprachlos? Hihihi...\p"
	.string "Willst du mal meinen Kampfstil sehen?$"

SecretBase_RedCave1_Text_1A2AE2:: @ 81A2AE2
	.string "Es gibt kein Zurück mehr.$"

SecretBase_RedCave1_Text_1A2AFB:: @ 81A2AFB
	.string "Ich zeige dir gerne jederzeit wieder \n"
	.string "meinen erlesenen Kampfstil!$"

UnknownString_81A2B2A:: @ 81A2B2A
	.string "Du bist hoch talentiert! Deine Stärke\n"
	.string "scheint grenzenlos zu sein.$"

SecretBase_RedCave1_Text_1A2B69:: @ 81A2B69
	.string "Was hältst du von meinem Stil?\n"
	.string "Ich muss ihn noch mehr aufpolieren.$"

SecretBase_RedCave1_Text_1A2BA4:: @ 81A2BA4
	.string "Man lernt viel über den Geschmack und\n"
	.string "den Stil von Menschen, wenn man sich\l"
	.string "ihre Dekorationen und den Platz, auf\l"
	.string "dem sie stehen, anschaut.\p"
	.string "Wie findest du meinen Geschmack?\n"
	.string "Bist du sprachlos? Hihihi...$"

gUnknown_081A2C51:: @ 81A2C51
	special 21
	special 7
	compare RESULT, 1
	jumpeq EventScript_1A2E45
	checkattack MOVE_SECRET_POWER
	setanimation 0, RESULT
	bufferattack 1, MOVE_SECRET_POWER
	compare 0x8007, 1
	jumpeq EventScript_1A2CB0
	compare 0x8007, 2
	jumpeq EventScript_1A2CB0
	compare 0x8007, 3
	jumpeq EventScript_1A2CB0
	compare 0x8007, 4
	jumpeq EventScript_1A2CB0
	compare 0x8007, 5
	jumpeq EventScript_1A2D08
	compare 0x8007, 6
	jumpeq EventScript_1A2D60
	end

EventScript_1A2CB0:
	lockall
	compare RESULT, 6
	jumpeq EventScript_1A2CF1
	bufferpartypoke 0, RESULT
	msgbox UnknownString_8198F34, 5
	compare RESULT, 0
	jumpeq EventScript_1A2F3A
	msgbox UsedCutRockSmashText, 4
	closebutton
	doanimation 11
	waitstate
	jump EventScript_1A2CFA
	end

gUnknown_081A2CE6:: @ 81A2CE6
	lockall
	doanimation 11
	waitstate
	jump EventScript_1A2CFA
	end

EventScript_1A2CF1:
	msgbox UnknownString_8198F10, 3
	end

EventScript_1A2CFA:
	msgbox UnknownString_8198F6E, 4
	jump EventScript_1A2DB8
	end

EventScript_1A2D08:
	lockall
	compare RESULT, 6
	jumpeq EventScript_1A2D49
	bufferpartypoke 0, RESULT
	msgbox UnknownString_81A197B, 5
	compare RESULT, 0
	jumpeq EventScript_1A2F3A
	msgbox UsedCutRockSmashText, 4
	closebutton
	doanimation 26
	waitstate
	jump EventScript_1A2D52
	end

gUnknown_081A2D3E:: @ 81A2D3E
	lockall
	doanimation 26
	waitstate
	jump EventScript_1A2D52
	end

EventScript_1A2D49:
	msgbox UnknownString_81A1948, 3
	end

EventScript_1A2D52:
	msgbox UnknownString_81A19C4, 4
	jump EventScript_1A2DB8
	end

EventScript_1A2D60:
	lockall
	compare RESULT, 6
	jumpeq EventScript_1A2DA1
	bufferpartypoke 0, RESULT
	msgbox UnknownString_81A1A4B, 5
	compare RESULT, 0
	jumpeq EventScript_1A2F3A
	msgbox UsedCutRockSmashText, 4
	closebutton
	doanimation 27
	waitstate
	jump EventScript_1A2DAA
	end

gUnknown_081A2D96:: @ 81A2D96
	lockall
	doanimation 27
	waitstate
	jump EventScript_1A2DAA
	end

EventScript_1A2DA1:
	msgbox UnknownString_81A1A03, 3
	end

EventScript_1A2DAA:
	msgbox UnknownString_81A1AA9, 4
	jump EventScript_1A2DB8
	end

EventScript_1A2DB8:
	closebutton
	playsfx 9
	setvar 0x4097, 0
	setflag 173
	special 6
	special 8
	setvar 0x8004, 0
	setvar 0x8005, 0
	special 18
	setvar 0x4089, 1
	waitstate
	end

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

gUnknown_081A2E14:: @ 81A2E14
	lockall
	setvar 0x4097, 1
	playsfx 9
	special 11
	compare RESULT, 0
	jumpeq EventScript_1A2E38
	clearflag 173
	special 8
	setvar 0x4089, 0
	waitstate
	end

EventScript_1A2E38:
	setflag 173
	special 8
	setvar 0x4089, 0
	waitstate
	end

EventScript_1A2E45:
	checkattack MOVE_SECRET_POWER
	compare RESULT, 6
	jumpeq EventScript_1A2EF7
	setanimation 0, RESULT
	setorcopyvar 0x8004, RESULT
	lockall
	special 278
	msgbox UnknownString_81A3C71, 5
	compare RESULT, 0
	jumpeq EventScript_1A2F3A
	msgbox UnknownString_81A38FB, 5
	compare RESULT, 0
	jumpeq EventScript_1A2F3A
	fadescreen 1
	special 330
	closebutton
	fadescreen 0
	msgbox UnknownString_81A3CC9, 5
	compare RESULT, 0
	jumpeq EventScript_1A2F3A
	bufferpartypoke 0, 0x8004
	bufferattack 1, MOVE_SECRET_POWER
	msgbox UsedCutRockSmashText, 4
	closebutton
	closebutton
	compare 0x8007, 1
	jumpeq gUnknown_081A2CE6
	compare 0x8007, 2
	jumpeq gUnknown_081A2CE6
	compare 0x8007, 3
	jumpeq gUnknown_081A2CE6
	compare 0x8007, 4
	jumpeq gUnknown_081A2CE6
	compare 0x8007, 5
	jumpeq gUnknown_081A2D3E
	compare 0x8007, 6
	jumpeq gUnknown_081A2D96
	releaseall
	end

EventScript_1A2EF7::
	compare 0x8007, 1
	jumpeq EventScript_1A2CF1
	compare 0x8007, 2
	jumpeq EventScript_1A2CF1
	compare 0x8007, 3
	jumpeq EventScript_1A2CF1
	compare 0x8007, 4
	jumpeq EventScript_1A2CF1
	compare 0x8007, 5
	jumpeq EventScript_1A2D49
	compare 0x8007, 6
	jumpeq EventScript_1A2DA1
	end

EventScript_1A2F3A::
	closebutton
	releaseall
	end

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

gUnknown_081A2F7B:: @ 81A2F7B
	setvar 0x8005, 0
	jump EventScript_1A2F86
	end

EventScript_1A2F86:
	special 19
	end

gUnknown_081A2F8A:: @ 81A2F8A
	setvar 0x8004, 0
	jump EventScript_1A2F95
	end

EventScript_1A2F95:
	special 23
	compare RESULT, 1
	jumpeq EventScript_1A2FBF
	addvar 0x8004, 1
	compare 0x8005, 0
	jumpeq EventScript_1A2F95
	disappear 0x8006
	setflag 0x8005
	jump EventScript_1A2F95
	end

EventScript_1A2FBF:
	end

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

	.include "data/text/secret_power_tm.inc"
	.include "data/scripts/secret_power_tm.inc"

UnknownString_81A38FB: @ 81A38FB
	.string "Alle Dekorationsgegenstände und das\n"
	.string "Mobiliar aus deiner GEHEIMBASIS werden\l"
	.string "auf deinen PC gesendet.\p"
	.string "Einverstanden?$"

UnknownString_81A3958: @ 81A3958
	.string "Möchtest du GEHEIMBASIS von\n"
	.string "{STR_VAR_1} eintragen?$"

UnknownString_81A3982: @ 81A3982
	.string "Diese Daten wurden bereits\n"
	.string "eingetragen. Möchtest du sie löschen?$"

UnknownString_81A39C0: @ 81A39C0
	.string "Bis zu 10 Orte können eingetragen\n"
	.string "werden.\p"
	.string "Lösche einen Ort, um einen neuen\n"
	.string "eintragen zu können.$"

UnknownString_81A3A22: @ 81A3A22
	.string "Registrierung abgeschlossen.$"

UnknownString_81A3A3A: @ 81A3A3A
	.string "Daten wurden aus der Registrierung\n"
	.string "genommen.$"

UnknownString_81A3A56: @ 81A3A56
	.string "Es sind keine Dekorationen vorhanden.$"

UnknownString_81A3A72: @ 81A3A72
	.string "{PLAYER} schaltet den PC ein.$"

UnknownString_81A3A87: @ 81A3A87
	.string "Was möchtest du tun?$"

UnknownString_81A3AA2: @ 81A3AA2
	.string "Die eingetragene GEHEIMBASIS bleibt\n"
	.string "erhalten, bis der Eigentümer umzieht.\p"
	.string "Wird sie aus dem Grundbuch ent-\n"
	.string "fernt, kann eine andere GEHEIMBASIS\l"
	.string "diesen Platz einnehmen.\p"
	.string "Bis zu 10 Orte können eingetragen\n"
	.string "werden.{0xFC}Ì$"

UnknownString_81A3B5B: @ 81A3B5B
	.string "Ein Schild aus {STR_VAR_2}, welches zeigt,\n"
	.string "dass {STR_VAR_1}-mal hintereinander im\l"
	.string "DUELLTURM ein Kampf gewonnen wurde.$"

UnknownString_81A3BA4: @ 81A3BA4
	.string "Ein sehr realistischer Spielzeug-\n"
	.string "Fernseher. Man könnte ihn glatt mit\l"
	.string "einem echten Gerät verwechseln.$"

UnknownString_81A3BE8: @ 81A3BE8
	.string "Ein Spielzeug-Fernseher, der aussieht\n"
	.string "wie ein SAMURZEL. Er scheint von\l"
	.string "alleine davonrollen zu wollen...$"

UnknownString_81A3C31: @ 81A3C31
	.string "Ein Spielzeug-Fernseher, der aussieht\n"
	.string "wie ein ENECO. Es scheint, als wolle\l"
	.string "er sich langsam davonschleichen ...$"

UnknownString_81A3C71: @ 81A3C71
	.string "Du kannst dir nur eine GEHEIMBASIS\n"
	.string "einrichten.\p"
	.string "Möchtest du deine GEHEIMBASIS in der\n"
	.string "Nähe von {STR_VAR_1} hierher\l"
	.string "verlegen?$"

UnknownString_81A3CC9: @ 81A3CC9
	.string "Umzug wurde abgeschlossen.\p"
	.string "Möchtest du GEHEIMPOWER einsetzen?$"

	.include "data/scripts/cable_club.inc"
	.include "data/text/cable_club.inc"

	.include "data/scripts/contest_hall.inc"
	.include "data/text/contest_hall.inc"

	.include "data/scripts/tv.inc"
	.include "data/text/tv.inc"

BattleTower_Lobby_EventScript_1ADE46:: @ 81ADE46
FallarborTown_ContestLobby_EventScript_1ADE46:: @ 81ADE46
SlateportCity_OceanicMuseum_1F_EventScript_1ADE46:: @ 81ADE46
SlateportCity_PokemonFanClub_EventScript_1ADE46:: @ 81ADE46
	special 68
	inccounter GAME_STAT_GOT_INTERVIEWED
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

	.include "data/scripts/gabby_and_ty.inc"

	.include "data/scripts/bard.inc"
	.include "data/scripts/hipster.inc"
	.include "data/text/trader.inc"
	.include "data/scripts/trader.inc"
	.include "data/text/storyteller.inc"
	.include "data/scripts/storyteller.inc"
	.include "data/text/giddy.inc"
	.include "data/scripts/giddy.inc"
	.include "data/text/bard.inc"
	.include "data/text/hipster.inc"

	.include "data/field_move_scripts.inc"
	.include "data/item_ball_scripts.inc"

	.include "data/scripts/mystery_event_club.inc"
	.include "data/text/mystery_event_club.inc"

	.include "data/scripts/day_care.inc"
	.include "data/text/day_care.inc"

	.include "data/scripts/magma_chimney.inc"
	.include "data/scripts/magma_summit.inc"

	.include "data/text/aqua_chimney.inc"
	.include "data/text/magma_chimney.inc"
	.include "data/text/aqua_awakening.inc"
	.include "data/text/magma_awakening.inc"
	.include "data/text/aqua_settled.inc"
	.include "data/text/magma_settled.inc"
	.include "data/text/aqua_summit.inc"
	.include "data/text/magma_summit.inc"

gUnknown_081B694A:: @ 81B694A
	lighten 1
	darken 1
	end

	.include "data/scripts/players_house.inc"

Event_RunningShoesManual:: @ 81B6E5A
	msgbox UnknownString_81728E3, 3
	end

	.include "data/text/pokeblocks.inc"
	.include "data/scripts/pokeblocks.inc"

	.include "data/text/trainers.inc"

Event_RepelWoreOff:: @ 81C33E6
	msgbox Text_RepelWoreOff, 3
	end

Text_RepelWoreOff: @ 81C33EF
	.string "SCHUTZ wirkt nicht mehr...$"

	.include "data/scripts/safari_zone.inc"
	.include "data/text/safari_zone.inc"

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

	.include "data/text/roulette.inc"
	.include "data/text/barboach.inc"
	.include "data/text/pokedex_rating.inc"
	.include "data/text/lottery_corner.inc"
	.include "data/text/eon_ticket.inc"
	.include "data/text/braille.inc"
	.include "data/text/berries.inc"
	.include "data/text/shoal_cave.inc"

PictureBookShelfText: @ 81C6A69
	.string "Eine Sammlung von POKéMON-Büchern.$"

BookshelfText: @ 81C6A91
	.string "Hier stehen jede Menge Bücher.$"

PokemonCenterBookshelfText: @ 81C6AB6
	.string "POKéMON-Magazine!\n"
	.string "DER POKéMON FREUND...\p"
	.string "POKéMON HANDBUCH...\n"
	.string "GELIEBTE POKéMON...$"

VaseText: @ 81C6B00
	.string "Diese Vase sieht sehr teuer aus...\n"
	.string "Schauen wir mal hinein...\p"
	.string "Och, sie ist leer.$"

TrashCanText: @ 81C6B41
	.string "Leer...$"

ShopShelfText: @ 81C6B4D
	.string "Die Regale biegen sich unter dem\n"
	.string "Gewicht von POKéMON-Artikeln.$"

BlueprintText: @ 81C6B85
	.string "Sind das Blaupausen?\n"
	.string "Die sind zu kompliziert zu lesen.$"

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

gUnknown_081C6BDE:: @ 81C6BDE
	lockall
	pause 20
	move 255, GraniteCave_B1F_Movement_1C6BF7
	waitmove 0
	playsfx 43
	pause 60
	special 319
	waitstate
	end

GraniteCave_B1F_Movement_1C6BF7:: @ 81C6BF7
	step_54
	step_end

@ 81C6BF9
	msgbox Text_1C6C2B, 2
	end

gUnknown_081C6C02:: @ 81C6C02
	msgbox Text_1C6C4B, 3
	end

@ 81C6C0B
	end

@ 81C6C0C
	msgbox Text_1C6C62, 3
	end

@ 81C6C15
	lockall
	call LittlerootTown_BrendansHouse_2F_EventScript_1B6A9B
	releaseall
	end

@ 81C6C1D
	lockall
	braillemsg Underwater_SealedChamber_Braille_1C533D
	waitbutton
	hidebox 0, 0, 29, 19
	releaseall
	end

Text_1C6C2B: @ 81C6C2B
	@ This is a test message!
	@ Welcome to the world of Pokémon!
	.string "テストよう　メッセージです！\n"
	.string "ポケモンの　せかいへ　ようこそ！$"

Text_1C6C4B: @ 81C6C4B
	@ This is a test message!
	@ This is a sign.
	.string "テストよう　メッセージです！\n"
	.string "かんばん　です$"

Text_1C6C62: @ 81C6C62
	@ This is a test message!
	@ This is a coordinate-check event.
	.string "テストよう　メッセージです！\n"
	.string "ざひょう　チェックの　イベントです$"

@ 81C6C84
@ object file boundary?
	.align 2
	.string "$"

	.include "data/text/save.inc"
	.include "data/text/birch_speech.inc"
