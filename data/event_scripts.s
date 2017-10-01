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
	playse 2
	message UnknownString_81A3A72
	dofieldeffect 61
	waitstate
	waitmessage
	waitbutton
	playse 5
	goto EventScript_15F384
	end

EventScript_15F384:
	message UnknownString_81A3A87
	waitmessage
	checkflag 268
	goto_if_eq EventScript_15F3A0
	goto EventScript_15F3E2
	end

gUnknown_0815F399:: @ 815F399
	lockall
	goto EventScript_15F384
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
	goto_if_eq EventScript_15F384
	closemessage
	special SecretBasePC_PackUp
	releaseall
	end

EventScript_15F432:
	special SecretBasePC_Decoration
	end

EventScript_15F436:
	special SecretBasePC_Registry
	end

gUnknown_0815F43A:: @ 815F43A
	lockall
	message UnknownString_81A3A72
	playse 2
	dofieldeffect 61
	waitstate
	waitmessage
	waitbutton
	playse 5
	goto EventScript_15F452
	end

EventScript_15F452:
	message UnknownString_81A3A87
	waitmessage
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
	goto EventScript_15F452
	end

EventScript_15F4A1:
	special sub_80BC56C
	compare RESULT, 1
	goto_if_eq EventScript_15F4E0
	compare RESULT, 2
	goto_if_eq EventScript_15F503
	special sub_80BC224
	msgbox UnknownString_81A3958, 5
	compare RESULT, 0
	goto_if_eq EventScript_15F452
	msgbox UnknownString_81A3A22, 3
	special sub_80BC5BC
	special sub_80C683C
	releaseall
	end

EventScript_15F4E0:
	msgbox UnknownString_81A3982, 5
	compare RESULT, 0
	goto_if_eq EventScript_15F452
	msgbox UnknownString_81A3A3A, 3
	special sub_80BC5BC
	special sub_80C683C
	releaseall
	end

EventScript_15F503:
	msgbox UnknownString_81A39C0, 3
	special sub_80C683C
	closemessage
	releaseall
	end

EventScript_15F511:
	message UnknownString_81A3AA2
	waitmessage
	goto EventScript_15F452
	end

EventScript_15F51D:
	special sub_80C683C
	closemessage
	releaseall
	end

gUnknown_0815F523:: @ 815F523
	dofieldeffect 52
	waitstate
	end

gUnknown_0815F528:: @ 815F528
	special GetShieldToyTVDecorationInfo
	compare RESULT, 0
	goto_if_eq EventScript_15F558
	compare RESULT, 1
	goto_if_eq EventScript_15F561
	compare RESULT, 2
	goto_if_eq EventScript_15F56A
	compare RESULT, 3
	goto_if_eq EventScript_15F573
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
	.string "{PLAYER} found a scroll.$"

Route110_TrickHousePuzzle1_Text_19C1CB:: @ 819C1CB
	.string "{PLAYER} memorized the secret code\n"
	.string "written on the scroll.$"

Route110_TrickHousePuzzle1_Text_19C1FF:: @ 819C1FF
	.string "A secret code is written on it.$"

UnknownString_819C21F: @ 819C21F
	.string "The door is locked.\p"
	.string "...On closer inspection, this is written\n"
	.string "on it: “Write the secret code here.”$"

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
	waitmessage
	waitbutton
	release
	return

Std_3:
	lockall
	message 0x0
	waitmessage
	waitbutton
	releaseall
	return

Std_4:
	message 0x0
	waitmessage
	waitbutton
	return

Std_5:
	message 0x0
	waitmessage
	yesnobox 20, 8
	return

@ 819F805
	return

S_DoSaveDialog:: @ 819F806
	special ScrSpecial_DoSaveDialog
	waitstate
	return

gUnknown_0819F80B:: @ 819F80B
	lock
	special PlayTrainerEncounterMusic
	special ScrSpecial_EndTrainerApproach
	waitstate
	goto EventScript_19F8F2

gUnknown_0819F818:: @ 819F818
	lock
	faceplayer
	applymovement LAST_TALKED, Movement_19F8F0
	waitmovement 0
	specialvar RESULT, ScrSpecial_HasTrainerBeenFought
	compare RESULT, 0
	goto_if 5, EventScript_19F83F
	special PlayTrainerEncounterMusic
	special sub_8082524
	goto EventScript_19F8F2

EventScript_19F83F:
	ontrainerbattleend

gUnknown_0819F840:: @ 819F840
	lock
	faceplayer
	call EventScript_19F8E5
	specialvar RESULT, ScrSpecial_HasTrainerBeenFought
	compare RESULT, 0
	goto_if 5, EventScript_19F877
	special CheckForAlivePartyMons
	compare RESULT, 0
	goto_if 5, EventScript_19F870
	special PlayTrainerEncounterMusic
	special sub_8082524
	goto EventScript_19F8F2

EventScript_19F870:
	special ScrSpecial_ShowTrainerNonBattlingSpeech
	waitmessage
	waitbutton
	release
	end

EventScript_19F877:
	ontrainerbattleend

gUnknown_0819F878:: @ 819F878
	applymovement LAST_TALKED, Movement_19F8F0
	waitmovement 0
	special PlayTrainerEncounterMusic
	battlebegin
	ontrainerbattleend

gUnknown_0819F887:: @ 819F887
	call EventScript_19F8E5
	specialvar RESULT, ScrSpecial_GetTrainerEyeRematchFlag
	compare RESULT, 0
	goto_if_eq EventScript_19F8AD
	special PlayTrainerEncounterMusic
	special sub_8082524
	special ScrSpecial_ShowTrainerIntroSpeech
	waitmessage
	waitbutton
	special ScrSpecial_StartTrainerEyeRematch
	waitstate
	releaseall
	end

EventScript_19F8AD:
	ontrainerbattleend

gUnknown_0819F8AE:: @ 819F8AE
	specialvar RESULT, ScrSpecial_GetTrainerEyeRematchFlag
	compare RESULT, 0
	goto_if_eq EventScript_19F8DD
	special CheckForAlivePartyMons
	compare RESULT, 0
	goto_if 5, EventScript_19F8DE
	special PlayTrainerEncounterMusic
	special sub_8082524
	special ScrSpecial_ShowTrainerIntroSpeech
	waitmessage
	waitbutton
	special ScrSpecial_StartTrainerEyeRematch
	waitstate
	releaseall
	end

EventScript_19F8DD:
	ontrainerbattleend

EventScript_19F8DE:
	special ScrSpecial_ShowTrainerNonBattlingSpeech
	waitmessage
	waitbutton
	release
	end

EventScript_19F8E5:
	applymovement LAST_TALKED, Movement_19F8F0
	waitmovement 0
	return

Movement_19F8F0::
	step_59
	step_end

EventScript_19F8F2:
	special ScrSpecial_ShowTrainerIntroSpeech
	waitmessage
	waitbutton
	battlebegin
	specialvar RESULT, ScrSpecial_GetTrainerBattleMode
	compare RESULT, 0
	goto_if_eq EventScript_19F934
	compare RESULT, 2
	goto_if_eq EventScript_19F936
	compare RESULT, 1
	goto_if_eq EventScript_19F936
	compare RESULT, 6
	goto_if_eq EventScript_19F936
	compare RESULT, 8
	goto_if_eq EventScript_19F936

EventScript_19F934:
	releaseall
	end

EventScript_19F936:
	ontrainerbattleendgoto

Std_6::
	message 0x0
	waitmessage
	waitbutton
	release
	return

Event_ResetBerryTrees: @ 19F940
	plantberrytree 2, 7, 5
	plantberrytree 1, 3, 5
	plantberrytree 11, 7, 5
	plantberrytree 13, 3, 5
	plantberrytree 4, 7, 5
	plantberrytree 76, 1, 5
	plantberrytree 8, 1, 5
	plantberrytree 10, 6, 5
	plantberrytree 25, 20, 5
	plantberrytree 26, 2, 5
	plantberrytree 66, 2, 5
	plantberrytree 67, 20, 5
	plantberrytree 69, 22, 5
	plantberrytree 70, 22, 5
	plantberrytree 71, 22, 5
	plantberrytree 55, 17, 5
	plantberrytree 56, 17, 5
	plantberrytree 5, 1, 5
	plantberrytree 6, 6, 5
	plantberrytree 7, 1, 5
	plantberrytree 16, 18, 5
	plantberrytree 17, 18, 5
	plantberrytree 18, 18, 5
	plantberrytree 29, 19, 5
	plantberrytree 28, 19, 5
	plantberrytree 27, 19, 5
	plantberrytree 24, 4, 5
	plantberrytree 23, 3, 5
	plantberrytree 22, 3, 5
	plantberrytree 21, 4, 5
	plantberrytree 19, 16, 5
	plantberrytree 20, 16, 5
	plantberrytree 80, 7, 5
	plantberrytree 81, 7, 5
	plantberrytree 77, 8, 5
	plantberrytree 78, 8, 5
	plantberrytree 68, 8, 5
	plantberrytree 31, 10, 5
	plantberrytree 33, 10, 5
	plantberrytree 34, 21, 5
	plantberrytree 35, 21, 5
	plantberrytree 36, 21, 5
	plantberrytree 83, 24, 5
	plantberrytree 84, 24, 5
	plantberrytree 85, 10, 5
	plantberrytree 86, 6, 5
	plantberrytree 37, 5, 5
	plantberrytree 38, 5, 5
	plantberrytree 39, 5, 5
	plantberrytree 40, 3, 5
	plantberrytree 41, 3, 5
	plantberrytree 42, 3, 5
	plantberrytree 46, 19, 5
	plantberrytree 45, 20, 5
	plantberrytree 44, 18, 5
	plantberrytree 43, 16, 5
	plantberrytree 47, 8, 5
	plantberrytree 48, 5, 5
	plantberrytree 49, 4, 5
	plantberrytree 50, 2, 5
	plantberrytree 52, 18, 5
	plantberrytree 53, 18, 5
	plantberrytree 62, 6, 5
	plantberrytree 64, 6, 5
	plantberrytree 58, 21, 5
	plantberrytree 59, 21, 5
	plantberrytree 60, 25, 5
	plantberrytree 61, 25, 5
	plantberrytree 79, 23, 5
	plantberrytree 14, 23, 5
	plantberrytree 15, 21, 5
	plantberrytree 30, 21, 5
	plantberrytree 65, 25, 5
	plantberrytree 72, 25, 5
	plantberrytree 73, 23, 5
	plantberrytree 74, 23, 5
	plantberrytree 87, 3, 5
	plantberrytree 88, 10, 5
	plantberrytree 89, 4, 5
	plantberrytree 82, 36, 5
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
	special sub_810FAA0
	checkflag 291
	call_if 0, EverGrandeCity_HallOfFame_EventScript_19FC62
	checkflag 255
	call_if 0, EverGrandeCity_HallOfFame_EventScript_19FC70
	checkflag 298
	call_if 0, EverGrandeCity_HallOfFame_EventScript_19FC5A
	checkflag 123
	call_if 0, EverGrandeCity_HallOfFame_EventScript_19FC5E
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

S_WhiteOut:: @ 819FC74
	call EverGrandeCity_HallOfFame_EventScript_19FD09
	call EventScript_19FC84
	goto gUnknown_0819FC9F
	end

EventScript_19FC84:
	checkflag 221
	goto_if_eq Route101_EventScript_1A14DC
	checkflag 1213
	goto_if 0, Route101_EventScript_1A14DC
	clearflag 929
	setvar 0x4053, 2
	return

gUnknown_0819FC9F:: @ 819FC9F
	compare 0x4096, 1
	goto_if_eq EventScript_19FCC1
	compare 0x4096, 2
	goto_if_eq EventScript_19FCD7
	compare 0x4096, 3
	goto_if_eq EventScript_19FCF0
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
	goto_if 0, OldaleTown_PokemonCenter_1F_EventScript_1A14DC
	checkflag 1217
	goto_if_eq OldaleTown_PokemonCenter_1F_EventScript_1A14DC
	checkflag 742
	goto_if 0, OldaleTown_PokemonCenter_1F_EventScript_19FD49
	checkflag 740
	goto_if 0, OldaleTown_PokemonCenter_1F_EventScript_19FD4F
	checkflag 741
	goto_if 0, OldaleTown_PokemonCenter_1F_EventScript_19FD55
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
	msgbox gText_NurseJoy_Welcome, MSGBOX_YESNO
	compare RESULT, 1
	goto_if_eq do_heal_party
	compare RESULT, 0
	goto_if_eq dont_heal_party
	end

do_heal_party:: @ 819FD7C
	inccounter GAME_STAT_USED_POKECENTER
	message gText_NurseJoy_OkayIllTakeYourPokemon
	waitmessage
	applymovement 0x800b, OldaleTown_PokemonCenter_1F_Movement_1A083F
	waitmovement 0
	dofieldeffect 25
	waitfieldeffect 25
	applymovement 0x800b, OldaleTown_PokemonCenter_1F_Movement_1A0845
	waitmovement 0
	special ScrSpecial_HealPlayerParty
	checkflag 273
	goto_if 0, OldaleTown_PokemonCenter_1F_EventScript_19FDCE
	goto OldaleTown_PokemonCenter_1F_EventScript_19FDB0
	end

OldaleTown_PokemonCenter_1F_EventScript_19FDB0:: @ 819FDB0
	message gText_NurseJoy_ThankYouForWaiting
	waitmessage
	applymovement 0x800b, OldaleTown_PokemonCenter_1F_Movement_19FDF4
	waitmovement 0
	message gText_NurseJoy_WeHopeToSeeYouAgain
	waitmessage
	return

dont_heal_party:: @ 819FDC7
	message gText_NurseJoy_WeHopeToSeeYouAgain
	waitmessage
	return

OldaleTown_PokemonCenter_1F_EventScript_19FDCE:: @ 819FDCE
	specialvar RESULT, IsPokerusInParty
	compare RESULT, 1
	goto_if_eq OldaleTown_PokemonCenter_1F_EventScript_19FDEA
	compare RESULT, 0
	goto_if_eq OldaleTown_PokemonCenter_1F_EventScript_19FDB0
	end

OldaleTown_PokemonCenter_1F_EventScript_19FDEA:: @ 819FDEA
	message gText_NurseJoy_Pokerus
	waitmessage
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
	getitemname 1, 0x8000
	checkitemtype 0x8000
	call GetItem_HandlePocket
	compare 0x8007, 0x1
	call_if 1, Std_ObtainItem_Success
	compare 0x8007, 0x0
	call_if 1, Std_ObtainItem_Fail
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
	getstdstring 2, 0xE
	compare 0x8007, 1
	call_if 1, PlayGetItemFanfare
	return

GetItem_HandlePocket_KeyItems:
	getstdstring 2, 0xF
	compare 0x8007, 1
	call_if 1, PlayGetItemFanfare
	return

GetItem_HandlePocket_PokeBalls:
	getstdstring 2, 0x10
	compare 0x8007, 1
	call_if 1, PlayGetItemFanfare
	return

GetItem_HandlePocket_TMsHMs:
	getstdstring 2, 0x11
	compare 0x8007, 1
	call_if 1, PlayGetTMHMFanfare
	return

GetItem_HandlePocket_Berries:
	getstdstring 2, 0x12
	compare 0x8007, 1
	call_if 1, PlayGetItemFanfare
	return

Std_ObtainItem_Success: @ 819FEB7
	message Message_ObtainedItem
	waitfanfare
	waitmessage
	msgbox Message_PutAwayItem
	setvar RESULT, 1
	return

Std_ObtainItem_Fail: @ 819FECC
	setvar RESULT, 0
	return

PlayGetItemFanfare:
	playfanfare 0x172
	return

PlayGetTMHMFanfare:
	playfanfare 0x174
	return

Std_ObtainDecoration: @ 819FEDA
	adddecor 0x8000
	copyvar 0x8007, RESULT
	call Std_ObtainDecoration_
	return

Std_ObtainDecoration_: @ 819FEE8
	getdecorname 1, 0x8000
	compare 0x8007, 1
	call_if 1, Std_ObtainDecoration_Success
	compare 0x8007, 0
	call_if 1, Std_ObtainDecoration_Fail
	return

Std_ObtainDecoration_Success: @ 819FF03
	playfanfare 0x172
	message Message_ObtainedDecoration
	waitfanfare
	waitmessage
	msgbox Message_TransferredToPC
	setvar RESULT, 1
	return

Std_ObtainDecoration_Fail: @ 819FF1B
	setvar RESULT, 0
	return

Std_FindItem: @ 819FF21
	lock
	faceplayer
	waitse
	additem 0x8000, 0x8001
	copyvar 0x8007, RESULT
	getitemname 1, 0x8000
	checkitemtype 0x8000
	call GetItem_HandlePocket
	compare 0x8007, 1
	call_if 1, Std_FindItem_Success
	compare 0x8007, 0
	call_if 1, Std_FindItem_Fail
	release
	return

Std_FindItem_Success: @ 819FF52
	removeobject LAST_TALKED
	message Message_FoundOneItem
	waitfanfare
	waitmessage
	msgbox Message_PutAwayItem
	return

Std_FindItem_Fail: @ 819FF65
	msgbox Message_ObtainedItem
	msgbox Message_BagFull
	setvar RESULT, 0
	return

HiddenItemScript:: @ 819FF7B
	lockall
	waitse
	additem 0x8005, 1
	copyvar 0x8007, RESULT
	getitemname 0x1, 0x8005
	checkitemtype 0x8005
	call GetItem_HandlePocket
	compare 0x8007, 1
	goto_if_eq HiddenItemScript_Success
	compare 0x8007, 0
	goto_if_eq HiddenItemScript_Fail
	end

HiddenItemScript_Success:
	message Message_FoundOneItem
	waitfanfare
	waitmessage
	msgbox Message_PutAwayItem
	special SetFlagInVar
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
	goto_if_eq UnusedMixRecordsScript_Yes
	compare RESULT, 0
	goto_if_eq UnusedMixRecordsScript_Done
	goto UnusedMixRecordsScript_Done
UnusedMixRecordsScript_Yes: @ 819FFFA
	special sub_80B929C
	waitstate
	lock
	faceplayer
UnusedMixRecordsScript_Done: @ 81A0000
	message UnusedMixRecordsSeeYouAgainText
	waitmessage
	waitbutton
	release
	end

gUnknown_081A0009:: @ 81A0009
	lockall
	setvar 0x8004, 0
	special DoPCTurnOnEffect
	playse 4
	msgbox UnknownString_81A09EC, 4
	goto EventScript_1A0023
	end

EventScript_1A0023:
	message gPCText_WhichPCShouldBeAccessed
	waitmessage
	special ScrSpecial_CreatePCMenu
	waitstate
	goto EventScript_1A0033
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
	playse 2
	msgbox UnknownString_81A0A54, 4
	special PlayerPC
	waitstate
	goto EventScript_1A0023
	end

EventScript_1A0085:
	playse 2
	checkflag 2123
	call_if 0, EventScript_1A00AC
	checkflag 2123
	call_if 1, EventScript_1A00B5
	msgbox UnknownString_81A0A35, 4
	special ShowPokemonStorageSystem
	waitstate
	goto EventScript_1A0023
	end

EventScript_1A00AC:
	msgbox UnknownString_81A0A1E, 4
	return

EventScript_1A00B5:
	msgbox UnknownString_81A0A66, 4
	return

EventScript_1A00BE:
	setvar 0x8004, 0
	playse 3
	special DoPCTurnOffEffect
	releaseall
	end

EventScript_1A00CB:
	checkflag 2052
	goto_if 0, EventScript_1A00BE
	playse 2
	special AccessHallOfFamePC
	waitstate
	goto EventScript_1A0033
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
	special sub_80E60D8
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
	dodailyevents
	setvar 0x8004, 0
	special sub_80FA5BC
	return

DewfordTown_EventScript_1A010C:: @ 81A010C
Route104_MrBrineysHouse_EventScript_1A010C:: @ 81A010C
Route109_EventScript_1A010C:: @ 81A010C
	copyvar 0x8008, 0x4096
	setvar 0x4096, 0
	return

UseSurfScript:: @ 81A0117
	checkpokemove MOVE_SURF
	compare RESULT, 6
	goto_if_eq UseSurfScript_NoMon
	getpartypokename 0, RESULT
	setfieldeffect 0, RESULT
	lockall
	msgbox UseSurfPromptText, 5
	compare RESULT, 0
	goto_if_eq UseSurfScript_No
	msgbox UsedSurfText, 4
	dofieldeffect 9
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
	checkplayergender
	compare RESULT, 0
	goto_if_eq RustboroCity_EventScript_1A0166
	compare RESULT, 1
	goto_if_eq RustboroCity_EventScript_1A016C
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
	checkplayergender
	compare RESULT, 0
	goto_if_eq LavaridgeTown_EventScript_1A018A
	compare RESULT, 1
	goto_if_eq LavaridgeTown_EventScript_1A0190
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
	settrainerflag OPPONENT_JOSH
	settrainerflag OPPONENT_TOMMY
	return

DewfordTown_Gym_EventScript_1A0225:: @ 81A0225
	settrainerflag OPPONENT_HIDEKI
	settrainerflag OPPONENT_TESSA
	settrainerflag OPPONENT_LAURA
	return

DewfordTown_Gym_EventScript_1A022F:: @ 81A022F
	settrainerflag OPPONENT_KIRK
	settrainerflag OPPONENT_SHAWN
	settrainerflag OPPONENT_BEN
	settrainerflag OPPONENT_VIVIAN
	return

DewfordTown_Gym_EventScript_1A023C:: @ 81A023C
	settrainerflag OPPONENT_COLE
	settrainerflag OPPONENT_AXLE
	settrainerflag OPPONENT_ANDY
	settrainerflag OPPONENT_ZANE
	settrainerflag OPPONENT_SADIE
	return

DewfordTown_Gym_EventScript_1A024C:: @ 81A024C
	settrainerflag OPPONENT_RANDALL
	settrainerflag OPPONENT_PARKER
	settrainerflag OPPONENT_GEORGE
	settrainerflag OPPONENT_BERKE
	settrainerflag OPPONENT_MARY
	settrainerflag OPPONENT_LORI
	settrainerflag OPPONENT_JODY
	return

DewfordTown_Gym_EventScript_1A0262:: @ 81A0262
	settrainerflag OPPONENT_JARED
	settrainerflag OPPONENT_TERRELL
	settrainerflag OPPONENT_KYLEE
	settrainerflag OPPONENT_WILL
	return

DewfordTown_Gym_EventScript_1A026F:: @ 81A026F
	settrainerflag OPPONENT_PRESTON
	settrainerflag OPPONENT_VIRGIL
	settrainerflag OPPONENT_FRITZ
	settrainerflag OPPONENT_HANNAH
	settrainerflag OPPONENT_SAMANTHA
	settrainerflag OPPONENT_MAURA
	return

DewfordTown_Gym_EventScript_1A0282:: @ 81A0282
	settrainerflag OPPONENT_ANDREA
	settrainerflag OPPONENT_CRISSY
	settrainerflag OPPONENT_BRIANNA_2
	settrainerflag OPPONENT_CONNIE
	settrainerflag OPPONENT_BRIDGET
	settrainerflag OPPONENT_OLIVIA
	settrainerflag OPPONENT_TIFFANY
	settrainerflag OPPONENT_MARISSA
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
	playfanfare 369
	waitfanfare
	return

LittlerootTown_BrendansHouse_1F_EventScript_1A02CA:: @ 81A02CA
Route111_OldLadysRestStop_EventScript_1A02CA:: @ 81A02CA
Route119_WeatherInstitute_1F_EventScript_1A02CA:: @ 81A02CA
SSTidalRooms_EventScript_1A02CA:: @ 81A02CA
	fadescreen 1
	playfanfare 368
	waitfanfare
	special ScrSpecial_HealPlayerParty
	fadescreen 0
	return

Event_WorldMap:: @ 81A02D6
	lockall
	msgbox UnknownString_817303D, 4
	fadescreen 1
	special FieldShowRegionMap
	waitstate
	releaseall
	end

DewfordTown_EventScript_1A02E7:: @ 81A02E7
Route104_EventScript_1A02E7:: @ 81A02E7
Route109_EventScript_1A02E7:: @ 81A02E7
	setflag 0x4001
	playbgm 431, 0
	return

DewfordTown_EventScript_1A02EF:: @ 81A02EF
Route104_EventScript_1A02EF:: @ 81A02EF
Route109_EventScript_1A02EF:: @ 81A02EF
	clearflag 0x4001
	fadedefaultbgm
	return

LittlerootTown_ProfessorBirchsLab_EventScript_1A02F4:: @ 81A02F4
Route101_EventScript_1A02F4:: @ 81A02F4
Route103_EventScript_1A02F4:: @ 81A02F4
	compare 0x4085, 0
	goto_if_eq Route101_EventScript_1A14DC
	compare 0x4049, 0
	call_if 1, Route101_EventScript_1A0358
	compare 0x4049, 1
	call_if 1, Route101_EventScript_1A0358
	compare 0x4049, 2
	call_if 1, Route101_EventScript_1A0365
	compare 0x4049, 3
	call_if 1, Route101_EventScript_1A0365
	compare 0x4049, 4
	call_if 1, Route101_EventScript_1A0372
	compare 0x4049, 5
	call_if 1, Route101_EventScript_1A0372
	compare 0x4049, 6
	call_if 1, Route101_EventScript_1A0358
	compare 0x4049, 7
	call_if 1, Route101_EventScript_1A0358
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
	goto_if_eq Route101_EventScript_1A039B
	call Route101_EventScript_1A03B0
	release
	end

Route101_EventScript_1A039B:: @ 81A039B
	msgbox Route101_Text_1C449B, 4
	release
	end

Route101_EventScript_1A03A5:: @ 81A03A5
	copyvar 0x8004, 0x8009
	special ShowPokedexRatingMessage
	waitmessage
	waitbutton
	return

EverGrandeCity_ChampionsRoom_EventScript_1A03B0:: @ 81A03B0
Route101_EventScript_1A03B0:: @ 81A03B0
	setvar 0x8004, 0
	specialvar RESULT, ScriptGetPokedexInfo
	copyvar 0x8008, 0x8005
	copyvar 0x8009, 0x8006
	copyvar 0x800a, RESULT
	getnumberstring 0, 0x8008
	getnumberstring 1, 0x8009
	msgbox Route101_Text_1C44DC, 4
	call Route101_EventScript_1A03A5
	compare 0x800a, 0
	goto_if_eq Route101_EventScript_1A14DC
	setvar 0x8004, 1
	specialvar RESULT, ScriptGetPokedexInfo
	copyvar 0x8008, 0x8005
	copyvar 0x8009, 0x8006
	getnumberstring 0, 0x8008
	getnumberstring 1, 0x8009
	msgbox Route101_Text_1C4B05, 4
	return

BattleTower_Outside_EventScript_1A040E:: @ 81A040E
LilycoveCity_Harbor_EventScript_1A040E:: @ 81A040E
SlateportCity_Harbor_EventScript_1A040E:: @ 81A040E
	delay 60
	applymovement 0x8004, SlateportCity_Harbor_Movement_1A041C
	waitmovement 0
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
	removeobject 1
	removeobject 10
	clearflag 808
	clearflag 984
	setvar 0x409a, 6
	setflag 199
	return

EventScript_1A0457: @ unreferenced?
	delay 30
	applymovement 255, SlateportCity_OceanicMuseum_2F_Movement_1A0841
	waitmovement 0
	showobject 255, 0, 0
	delay 30
	applymovement 255, Movement_1A047A
	waitmovement 0
	delay 30
	return

Movement_1A047A:
	step_up
	step_end

BattleTower_Outside_EventScript_1A047C:: @ 81A047C
SouthernIsland_Exterior_EventScript_1A047C:: @ 81A047C
	compare FACING, 1
	call_if 1, BattleTower_Outside_EventScript_160B2F
	compare FACING, 3
	call_if 1, BattleTower_Outside_EventScript_160B3A
	delay 30
	hideobject 255, 0, 0
	call BattleTower_Outside_EventScript_1A040E
	return

CaveOfOrigin_B4F_EventScript_1A04A0:: @ 81A04A0
	lockall
	waitse
	playpokecry SPECIES_GROUDON_OR_KYOGRE, 2
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
	goto CaveOfOrigin_1F_EventScript_1A04D3
	end

CaveOfOrigin_B2F_EventScript_1A04BB:: @ 81A04BB
CaveOfOrigin_B3F_EventScript_1A04BB:: @ 81A04BB
	lockall
	setvar 0x4002, 1
	goto CaveOfOrigin_B2F_EventScript_1A04D3
	end

@ 81A04C7
	lockall
	setvar 0x4003, 1
	goto CaveOfOrigin_B2F_EventScript_1A04D3
	end

CaveOfOrigin_1F_EventScript_1A04D3:: @ 81A04D3
CaveOfOrigin_B2F_EventScript_1A04D3:: @ 81A04D3
	setvar 0x8004, 1
	setvar 0x8005, 1
	special sub_810F758
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
	waitse
	playpokecry SPECIES_ELECTRODE, 2
	delay 40
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
	waitse
	playpokecry SPECIES_ELECTRODE, 2
	delay 40
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
	goto Route120_EventScript_1A0594
	end

Route120_EventScript_1A0546:: @ 81A0546
	lock
	faceplayer
	setvar 0x8004, 2
	goto Route120_EventScript_1A0594
	end

Route120_EventScript_1A0553:: @ 81A0553
	lock
	faceplayer
	setvar 0x8004, 3
	goto Route120_EventScript_1A0594
	end

Route120_EventScript_1A0560:: @ 81A0560
	lock
	faceplayer
	setvar 0x8004, 4
	goto Route120_EventScript_1A0594
	end

Route120_EventScript_1A056D:: @ 81A056D
	lock
	faceplayer
	setvar 0x8004, 5
	goto Route120_EventScript_1A0594
	end

Route119_EventScript_1A057A:: @ 81A057A
	lock
	faceplayer
	setvar 0x8004, 6
	goto Route119_EventScript_1A0594
	end

Route119_EventScript_1A0587:: @ 81A0587
	lock
	faceplayer
	setvar 0x8004, 7
	goto Route119_EventScript_1A0594
	end

Route119_EventScript_1A0594:: @ 81A0594
Route120_EventScript_1A0594:: @ 81A0594
	checkitem ITEM_DEVON_SCOPE, 1
	compare RESULT, 1
	goto_if_eq Route119_EventScript_1A05AE
	msgbox Route119_Text_171B93, 4
	release
	end

Route119_EventScript_1A05AE:: @ 81A05AE
	msgbox Route119_Text_171BB6, 5
	compare RESULT, 1
	goto_if_eq Route119_EventScript_1A05C3
	release
	end

Route119_EventScript_1A05C3:: @ 81A05C3
	msgbox Route119_Text_171BF6, 4
	closemessage
	applymovement LAST_TALKED, Route119_Movement_1A0839
	waitmovement 0
	applymovement LAST_TALKED, Route119_Movement_1A0662
	waitmovement 0
	waitse
	playpokecry SPECIES_KECLEON, 2
	delay 40
	waitpokecry
	setwildbattle SPECIES_KECLEON, 30, ITEM_NONE
	compare 0x8004, 1
	call_if 1, Route119_EventScript_1A0646
	compare 0x8004, 2
	call_if 1, Route119_EventScript_1A064A
	compare 0x8004, 3
	call_if 1, Route119_EventScript_1A064E
	compare 0x8004, 4
	call_if 1, Route119_EventScript_1A0652
	compare 0x8004, 5
	call_if 1, Route119_EventScript_1A0656
	compare 0x8004, 6
	call_if 1, Route119_EventScript_1A065A
	compare 0x8004, 7
	call_if 1, Route119_EventScript_1A065E
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
	special sub_80BF9F8
	waitstate
	return

FallarborTown_House1_EventScript_1A067F:: @ 81A067F
GraniteCave_StevensRoom_EventScript_1A067F:: @ 81A067F
MtPyre_Summit_EventScript_1A067F:: @ 81A067F
SlateportCity_OceanicMuseum_2F_EventScript_1A067F:: @ 81A067F
	getitemname 0, 0x8004
	playfanfare 372
	message FallarborTown_House1_Text_1A1498
	waitmessage
	waitfanfare
	removeitem 0x8004, 1
	return

EverGrandeCity_DrakesRoom_EventScript_1A0693:: @ 81A0693
EverGrandeCity_GlaciasRoom_EventScript_1A0693:: @ 81A0693
EverGrandeCity_PhoebesRoom_EventScript_1A0693:: @ 81A0693
EverGrandeCity_SidneysRoom_EventScript_1A0693:: @ 81A0693
	applymovement 255, EverGrandeCity_SidneysRoom_Movement_1A0853
	waitmovement 0
	playse 8
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
	special DrawWholeMapView
	return

EverGrandeCity_DrakesRoom_EventScript_1A0710:: @ 81A0710
EverGrandeCity_GlaciasRoom_EventScript_1A0710:: @ 81A0710
EverGrandeCity_PhoebesRoom_EventScript_1A0710:: @ 81A0710
EverGrandeCity_SidneysRoom_EventScript_1A0710:: @ 81A0710
	applymovement 255, EverGrandeCity_SidneysRoom_Movement_1A0847
	waitmovement 0
	playse 52
	setmaptile 5, 12, 518, 1
	setmaptile 6, 12, 518, 1
	setmaptile 7, 12, 518, 1
	setmaptile 5, 13, 526, 1
	setmaptile 6, 13, 526, 1
	setmaptile 7, 13, 526, 1
	special DrawWholeMapView
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

UnknownString_81A09EC: @ 81A09EC
	.string "{PLAYER} booted up the PC.$"

gPCText_WhichPCShouldBeAccessed:: @ 81A0A01
	.string "Which PC should be accessed?$"

UnknownString_81A0A1E: @ 81A0A1E
	.string "Accessed someone’s PC.$"

UnknownString_81A0A35: @ 81A0A35
	.string "POKéMON Storage System opened.$"

UnknownString_81A0A54: @ 81A0A54
	.string "Accessed {PLAYER}’s PC.$"

UnknownString_81A0A66: @ 81A0A66
	.string "Accessed LANETTE’s PC.$"

gText_NurseJoy_Welcome:: @ 81A0A7D
	.string "Hello, and welcome to the POKéMON\n"
	.string "CENTER.\p"
	.string "We restore your tired POKéMON to\n"
	.string "full health.\p"
	.string "Would you like to rest your POKéMON?$"

gText_NurseJoy_WeHopeToSeeYouAgain:: @ 81A0AFA
	.string "We hope to see you again!$"

gText_NurseJoy_ThankYouForWaiting:: @ 81A0B14
	.string "Thank you for waiting.\p"
	.string "We’ve restored your POKéMON to\n"
	.string "full health.$"

UnknownString_81A0B57: @ 81A0B57
	.string "Welcome to the POKéMON CABLE CLUB\n"
	.string "TRADE CENTER.$"

UnknownString_81A0B87: @ 81A0B87
	.string "Welcome to the POKéMON CABLE CLUB\n"
	.string "COLOSSEUM.$"

UnknownString_81A0BB4: @ 81A0BB4
	.string "Welcome to the POKéMON CABLE CLUB\n"
	.string "TIME CAPSULE.$"

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
Route104_PrettyPetalFlowerShop_Text_1A0C02:: @ 81A0C02
RustboroCity_Mart_Text_1A0C02:: @ 81A0C02
SlateportCity_Mart_Text_1A0C02:: @ 81A0C02
SlateportCity_Text_1A0C02:: @ 81A0C02
SootopolisCity_Mart_Text_1A0C02:: @ 81A0C02
VerdanturfTown_Mart_Text_1A0C02:: @ 81A0C02
	.string "Please come again!$"

UnknownString_81A0C15: @ 81A0C15
	.string "Welcome!\p"
	.string "We’re having a discount sale today!$"

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

UnknownString_81A0DA6: @ 81A0DA6
	.string "Fufufu...$"

UnknownString_81A0DB0: @ 81A0DB0
	.string "Mumble, mumble...$"

UnknownString_81A0DC2: @ 81A0DC2
	.string "Oh!$"

UnknownString_81A0DC6: @ 81A0DC6
	.string "Closed today!$"

UnknownString_81A0DD4: @ 81A0DD4
	.string "You like the {STR_VAR_3}-type POKéMON\n"
	.string "{STR_VAR_1}?$"

UnknownString_81A0DF5: @ 81A0DF5
	.string "It contains a POKéMON!$"

UnknownString_81A0E0C: @ 81A0E0C
	.string "We’re making preparations.$"

UnknownString_81A0E27: @ 81A0E27
	.string "I’m a pseudo-GYM LEADER for\n"
	.string "interviews.$"

UnknownString_81A0E4F: @ 81A0E4F
	.string "Ready for a test battle.$"

UnknownString_81A0E68: @ 81A0E68
	.string "{STR_VAR_1} might like this program.\n"
	.string "... ... ... ... ... ... ... ... ... ... ... ... ... ... ... ...\p"
	.string "Better get going!$"

UnknownString_81A0ED6: @ 81A0ED6
	.string "What should I do for fun today?$"

LilycoveCity_DepartmentStoreElevator_Text_1A0EF6:: @ 81A0EF6
	.string "Welcome to LILYCOVE DEPARTMENT STORE.\p"
	.string "Which floor would you like?$"

UnknownString_81A0F38: @ 81A0F38
	.string "Warp to BATTLE TOWER.$"

UnknownString_81A0F4E: @ 81A0F4E
	.string "Warp to LILYCOVE.$"

UnknownString_81A0F60: @ 81A0F60
	.string "The time is {STR_VAR_1}!$"

UnknownString_81A0F70: @ 81A0F70
	.string "The HALL OF FAME will be accessed.$"

Route111_Text_1A0F93:: @ 81A0F93
	.string "The sandstorm is vicious.\n"
	.string "It’s impossible to keep going.$"

Text_NoRegisteredItem: @ 81A0FCC
	.string "An item in the BAG can be registered\n"
	.string "on SELECT for convenience.$"

LittlerootTown_BrendansHouse_2F_Text_1A100C:: @ 81A100C
LittlerootTown_MaysHouse_2F_Text_1A100C:: @ 81A100C
	.string "There’s an e-mail from POKéMON TRAINER\n"
	.string "SCHOOL.\p"
	.string "... ... ... ... ... ...\p"
	.string "A POKéMON may learn up to four moves.\p"
	.string "A TRAINER’s expertise is tested on the\n"
	.string "move sets chosen for POKéMON.\p"
	.string "... ... ... ... ... ...$"

LittlerootTown_BrendansHouse_2F_Text_1A10D6:: @ 81A10D6
LittlerootTown_MaysHouse_2F_Text_1A10D6:: @ 81A10D6
	.string "{PLAYER} booted up the PC.$"

FallarborTown_ContestLobby_Text_1A10EB:: @ 81A10EB
	.string "The link was canceled.$"

MossdeepCity_StevensHouse_Text_1A1102:: @ 81A1102
RustboroCity_DevonCorp_2F_Text_1A1102:: @ 81A1102
	.string "Want to give a nickname to the\n"
	.string "{STR_VAR_2} you received?$"

fieldPoisonText_PokemonFainted:: @ 81A1132
	.string "{STR_VAR_1} fainted...\p$"

UnknownString_81A1141: @ 81A1141
	.string "{PLAYER} is out of useable POKéMON!\p"
	.string "{PLAYER} whited out!$"

SlateportCity_Text_1A116E:: @ 81A116E
	.string "Do you know the TM SECRET POWER?\p"
	.string "Our group, we love the TM SECRET\n"
	.string "POWER.\p"
	.string "One of our members will give it to you.\n"
	.string "Come back and show me if you get it.\p"
	.string "We’ll accept you as a member and sell\n"
	.string "you good stuff in secrecy.$"

gText_NurseJoy_OkayIllTakeYourPokemon:: @ 81A1245
	.string "Okay, I’ll take your POKéMON for a\n"
	.string "few seconds.$"

gText_NurseJoy_Pokerus:: @ 81A1275
	.string "Your POKéMON may be infected with\n"
	.string "POKéRUS.\p"
	.string "Little is known about the POKéRUS\n"
	.string "except that they are microscopic life-\l"
	.string "forms that attach to POKéMON.\p"
	.string "While infected, POKéMON are said to\n"
	.string "grow exceptionally well.$"

	.include "data/text/surf.inc"

SealedChamber_InnerRoom_Text_1A138B:: @ 81A138B
	.string "It sounded as if a door opened\n"
	.string "somewhere far away.$"

AncientTomb_Text_1A13BE:: @ 81A13BE
DesertRuins_Text_1A13BE:: @ 81A13BE
IslandCave_Text_1A13BE:: @ 81A13BE
SealedChamber_OuterRoom_Text_1A13BE:: @ 81A13BE
	.string "There is a big hole in the wall.$"

OldaleTown_PokemonCenter_2F_Text_1A13DF:: @ 81A13DF
	.string "I’m terribly sorry. The COLOSSEUM\n"
	.string "is undergoing adjustments.$"

OldaleTown_PokemonCenter_2F_Text_1A141C:: @ 81A141C
	.string "I’m terribly sorry. The TRADE CENTER\n"
	.string "is undergoing inspections.$"

OldaleTown_PokemonCenter_2F_Text_1A145C:: @ 81A145C
	.string "I’m terribly sorry. The RECORD CORNER\n"
	.string "is under preparation.$"

FallarborTown_House1_Text_1A1498:: @ 81A1498
	.string "{PLAYER} handed over the\n"
	.string "{STR_VAR_1}.$"

Event_NoRegisteredItem:: @ 81A14AF
	msgbox Text_NoRegisteredItem, 3
	end

gUnknown_081A14B8:: @ 81A14B8
	lockall
	special ExecuteWhiteOut
	waitstate
	compare RESULT, 1
	goto_if_eq EventScript_1A14CA
	releaseall
	end

EventScript_1A14CA::
	message UnknownString_81A1141
	waitmessage
	waitbutton
	special sub_8081924
	waitstate
	fadescreen 1
	special sp0C8_whiteout_maybe
	waitstate
	end

OldaleTown_PokemonCenter_1F_EventScript_1A14DC:: @ 81A14DC
PacifidlogTown_House2_EventScript_1A14DC:: @ 81A14DC
Route101_EventScript_1A14DC:: @ 81A14DC
	return

	.include "data/scripts/berry_tree.inc"
	.include "data/text/berry_tree.inc"

UnknownString_81A1948: @ 81A1948
	.string "If some vines drop down, this tree can\n"
	.string "be climbed.$"

UnknownString_81A197B: @ 81A197B
	.string "If some vines drop down, this tree can\n"
	.string "be climbed.\p"
	.string "Use the SECRET POWER?$"

UnknownString_81A19C4: @ 81A19C4
	.string "A thick vine dropped down!$"

UnknownString_81A19DF: @ 81A19DF
	.string "Want to make your SECRET BASE here?$"

UnknownString_81A1A03: @ 81A1A03
	.string "If this clump of grass can be moved,\n"
	.string "it might be possible to go inside.$"

UnknownString_81A1A4B: @ 81A1A4B
	.string "If this clump of grass can be moved,\n"
	.string "it might be possible to go inside.\p"
	.string "Use the SECRET POWER?$"

UnknownString_81A1AA9: @ 81A1AA9
	.string "Discovered a small entrance!$"

UnknownString_81A1AC6: @ 81A1AC6
	.string "Want to make your SECRET BASE here?$"

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

UnknownString_81A1BB2:: @ 81A1BB2
	.string "Waaargh! You’re too strong!\n"
	.string "About me losing... Please keep it secret!$"

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

UnknownString_81A1D74:: @ 81A1D74
	.string "Hmmm... It’s our loss...\n"
	.string "But don’t tell anyone!\l"
	.string "It’s a confidential secret!$"

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

UnknownString_81A1F67:: @ 81A1F67
	.string "I can’t keep going!\n"
	.string "I surrender!$"

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

UnknownString_81A20C9:: @ 81A20C9
	.string "Hmm... I’ve still got lots to learn.\n"
	.string "I have to study some more.$"

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

UnknownString_81A2254:: @ 81A2254
	.string "Aww! Done in!\n"
	.string "But it’s still fun to battle!$"

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

UnknownString_81A2439:: @ 81A2439
	.string "I concede...$"

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

UnknownString_81A25C3:: @ 81A25C3
	.string "I went down...$"

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

UnknownString_81A2754:: @ 81A2754
	.string "Huh?\n"
	.string "Did I just lose?$"

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

UnknownString_81A2925:: @ 81A2925
	.string "I know exactly what you’re made of now.$"

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

UnknownString_81A2B2A:: @ 81A2B2A
	.string "You’re supremely talented!\n"
	.string "Your power seems to be limitless...$"

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

gUnknown_081A2C51:: @ 81A2C51
	special sub_80BB70C
	special sub_80BB63C
	compare RESULT, 1
	goto_if_eq EventScript_1A2E45
	checkpokemove MOVE_SECRET_POWER
	setfieldeffect 0, RESULT
	getmovename 1, MOVE_SECRET_POWER
	compare 0x8007, 1
	goto_if_eq EventScript_1A2CB0
	compare 0x8007, 2
	goto_if_eq EventScript_1A2CB0
	compare 0x8007, 3
	goto_if_eq EventScript_1A2CB0
	compare 0x8007, 4
	goto_if_eq EventScript_1A2CB0
	compare 0x8007, 5
	goto_if_eq EventScript_1A2D08
	compare 0x8007, 6
	goto_if_eq EventScript_1A2D60
	end

EventScript_1A2CB0:
	lockall
	compare RESULT, 6
	goto_if_eq EventScript_1A2CF1
	getpartypokename 0, RESULT
	msgbox UnknownString_8198F34, 5
	compare RESULT, 0
	goto_if_eq EventScript_1A2F3A
	msgbox UsedCutRockSmashText, 4
	closemessage
	dofieldeffect 11
	waitstate
	goto EventScript_1A2CFA
	end

gUnknown_081A2CE6:: @ 81A2CE6
	lockall
	dofieldeffect 11
	waitstate
	goto EventScript_1A2CFA
	end

EventScript_1A2CF1:
	msgbox UnknownString_8198F10, 3
	end

EventScript_1A2CFA:
	msgbox UnknownString_8198F6E, 4
	goto EventScript_1A2DB8
	end

EventScript_1A2D08:
	lockall
	compare RESULT, 6
	goto_if_eq EventScript_1A2D49
	getpartypokename 0, RESULT
	msgbox UnknownString_81A197B, 5
	compare RESULT, 0
	goto_if_eq EventScript_1A2F3A
	msgbox UsedCutRockSmashText, 4
	closemessage
	dofieldeffect 26
	waitstate
	goto EventScript_1A2D52
	end

gUnknown_081A2D3E:: @ 81A2D3E
	lockall
	dofieldeffect 26
	waitstate
	goto EventScript_1A2D52
	end

EventScript_1A2D49:
	msgbox UnknownString_81A1948, 3
	end

EventScript_1A2D52:
	msgbox UnknownString_81A19C4, 4
	goto EventScript_1A2DB8
	end

EventScript_1A2D60:
	lockall
	compare RESULT, 6
	goto_if_eq EventScript_1A2DA1
	getpartypokename 0, RESULT
	msgbox UnknownString_81A1A4B, 5
	compare RESULT, 0
	goto_if_eq EventScript_1A2F3A
	msgbox UsedCutRockSmashText, 4
	closemessage
	dofieldeffect 27
	waitstate
	goto EventScript_1A2DAA
	end

gUnknown_081A2D96:: @ 81A2D96
	lockall
	dofieldeffect 27
	waitstate
	goto EventScript_1A2DAA
	end

EventScript_1A2DA1:
	msgbox UnknownString_81A1A03, 3
	end

EventScript_1A2DAA:
	msgbox UnknownString_81A1AA9, 4
	goto EventScript_1A2DB8
	end

EventScript_1A2DB8:
	closemessage
	playse 9
	setvar 0x4097, 0
	setflag 173
	special sub_80BB8CC
	special sub_80BBAF0
	setvar 0x8004, 0
	setvar 0x8005, 0
	special sub_80BBDD0
	setvar 0x4089, 1
	waitstate
	end

SecretBase_RedCave1_EventScript_1A2DDE:: @ 81A2DDE
	applymovement 255, SecretBase_RedCave1_Movement_1A2E11
	waitmovement 0
	setvar 0x4097, 1
	msgbox SecretBase_RedCave1_Text_198F89, 5
	compare RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A2E08
	closemessage
	playse 9
	special sub_80BC440
	end

SecretBase_RedCave1_EventScript_1A2E08:: @ 81A2E08
	closemessage
	setflag 96
	special sub_80BBC78
	waitstate
	end

SecretBase_RedCave1_Movement_1A2E11:: @ 81A2E11
	step_up
	step_up
	step_end

gUnknown_081A2E14:: @ 81A2E14
	lockall
	setvar 0x4097, 1
	playse 9
	special sub_80BC114
	compare RESULT, 0
	goto_if_eq EventScript_1A2E38
	clearflag 173
	special sub_80BBAF0
	setvar 0x4089, 0
	waitstate
	end

EventScript_1A2E38:
	setflag 173
	special sub_80BBAF0
	setvar 0x4089, 0
	waitstate
	end

EventScript_1A2E45:
	checkpokemove MOVE_SECRET_POWER
	compare RESULT, 6
	goto_if_eq EventScript_1A2EF7
	setfieldeffect 0, RESULT
	setorcopyvar 0x8004, RESULT
	lockall
	special GetSecretBaseNearbyMapName
	msgbox UnknownString_81A3C71, 5
	compare RESULT, 0
	goto_if_eq EventScript_1A2F3A
	msgbox UnknownString_81A38FB, 5
	compare RESULT, 0
	goto_if_eq EventScript_1A2F3A
	fadescreen 1
	special sub_80BC50C
	closemessage
	fadescreen 0
	msgbox UnknownString_81A3CC9, 5
	compare RESULT, 0
	goto_if_eq EventScript_1A2F3A
	getpartypokename 0, 0x8004
	getmovename 1, MOVE_SECRET_POWER
	msgbox UsedCutRockSmashText, 4
	closemessage
	closemessage
	compare 0x8007, 1
	goto_if_eq gUnknown_081A2CE6
	compare 0x8007, 2
	goto_if_eq gUnknown_081A2CE6
	compare 0x8007, 3
	goto_if_eq gUnknown_081A2CE6
	compare 0x8007, 4
	goto_if_eq gUnknown_081A2CE6
	compare 0x8007, 5
	goto_if_eq gUnknown_081A2D3E
	compare 0x8007, 6
	goto_if_eq gUnknown_081A2D96
	releaseall
	end

EventScript_1A2EF7::
	compare 0x8007, 1
	goto_if_eq EventScript_1A2CF1
	compare 0x8007, 2
	goto_if_eq EventScript_1A2CF1
	compare 0x8007, 3
	goto_if_eq EventScript_1A2CF1
	compare 0x8007, 4
	goto_if_eq EventScript_1A2CF1
	compare 0x8007, 5
	goto_if_eq EventScript_1A2D49
	compare 0x8007, 6
	goto_if_eq EventScript_1A2DA1
	end

EventScript_1A2F3A::
	closemessage
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
	special sub_80BBDD0
	setvar 0x4089, 1
	end

gUnknown_081A2F7B:: @ 81A2F7B
	setvar 0x8005, 0
	goto EventScript_1A2F86
	end

EventScript_1A2F86:
	special sub_80FF474
	end

gUnknown_081A2F8A:: @ 81A2F8A
	setvar 0x8004, 0
	goto EventScript_1A2F95
	end

EventScript_1A2F95:
	special sub_8100A7C
	compare RESULT, 1
	goto_if_eq EventScript_1A2FBF
	addvar 0x8004, 1
	compare 0x8005, 0
	goto_if_eq EventScript_1A2F95
	removeobject 0x8006
	setflag 0x8005
	goto EventScript_1A2F95
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
	special sub_80BCE90
	compare 0x8004, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A3032
	compare 0x8004, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A30AE
	compare 0x8004, 2
	goto_if_eq SecretBase_RedCave1_EventScript_1A312A
	compare 0x8004, 3
	goto_if_eq SecretBase_RedCave1_EventScript_1A31A6
	compare 0x8004, 4
	goto_if_eq SecretBase_RedCave1_EventScript_1A3222
	compare 0x8004, 5
	goto_if_eq SecretBase_RedCave1_EventScript_1A329E
	compare 0x8004, 6
	goto_if_eq SecretBase_RedCave1_EventScript_1A331A
	compare 0x8004, 7
	goto_if_eq SecretBase_RedCave1_EventScript_1A3396
	compare 0x8004, 8
	goto_if_eq SecretBase_RedCave1_EventScript_1A3412
	compare 0x8004, 9
	goto_if_eq SecretBase_RedCave1_EventScript_1A348E
	end

SecretBase_RedCave1_EventScript_1A3032:: @ 81A3032
	checkflag 2052
	goto_if 0, SecretBase_RedCave1_EventScript_1A3086
	compare RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A30A5
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A1AEA, 5
	compare RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A308F
	setvar RESULT, 1
	special sub_80BCE4C
	call S_DoSaveDialog
	compare RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A308F
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A1B83, 4
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A3086:: @ 81A3086
	msgbox SecretBase_RedCave1_Text_1A1C3B, 2
	end

SecretBase_RedCave1_EventScript_1A308F:: @ 81A308F
	setvar RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A1B97, 2
	end

SecretBase_RedCave1_EventScript_1A30A5:: @ 81A30A5
	msgbox SecretBase_RedCave1_Text_1A1BF8, 2
	end

SecretBase_RedCave1_EventScript_1A30AE:: @ 81A30AE
	checkflag 2052
	goto_if 0, SecretBase_RedCave1_EventScript_1A3102
	compare RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A3121
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A1E67, 5
	compare RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A310B
	setvar RESULT, 1
	special sub_80BCE4C
	call S_DoSaveDialog
	compare RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A310B
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A1F04, 4
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A3102:: @ 81A3102
	msgbox SecretBase_RedCave1_Text_1A1FBD, 2
	end

SecretBase_RedCave1_EventScript_1A310B:: @ 81A310B
	setvar RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A1F2E, 2
	end

SecretBase_RedCave1_EventScript_1A3121:: @ 81A3121
	msgbox SecretBase_RedCave1_Text_1A1F88, 2
	end

SecretBase_RedCave1_EventScript_1A312A:: @ 81A312A
	checkflag 2052
	goto_if 0, SecretBase_RedCave1_EventScript_1A317E
	compare RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A319D
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A218F, 5
	compare RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A3187
	setvar RESULT, 1
	special sub_80BCE4C
	call S_DoSaveDialog
	compare RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A3187
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2220, 4
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A317E:: @ 81A317E
	msgbox SecretBase_RedCave1_Text_1A22FA, 2
	end

SecretBase_RedCave1_EventScript_1A3187:: @ 81A3187
	setvar RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2230, 2
	end

SecretBase_RedCave1_EventScript_1A319D:: @ 81A319D
	msgbox SecretBase_RedCave1_Text_1A2280, 2
	end

SecretBase_RedCave1_EventScript_1A31A6:: @ 81A31A6
	checkflag 2052
	goto_if 0, SecretBase_RedCave1_EventScript_1A31FA
	compare RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A3219
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A24E1, 5
	compare RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A3203
	setvar RESULT, 1
	special sub_80BCE4C
	call S_DoSaveDialog
	compare RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A3203
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A256F, 4
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A31FA:: @ 81A31FA
	msgbox SecretBase_RedCave1_Text_1A2609, 2
	end

SecretBase_RedCave1_EventScript_1A3203:: @ 81A3203
	setvar RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A258A, 2
	end

SecretBase_RedCave1_EventScript_1A3219:: @ 81A3219
	msgbox SecretBase_RedCave1_Text_1A25D2, 2
	end

SecretBase_RedCave1_EventScript_1A3222:: @ 81A3222
	checkflag 2052
	goto_if 0, SecretBase_RedCave1_EventScript_1A3276
	compare RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A3295
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A2830, 5
	compare RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A327F
	setvar RESULT, 1
	special sub_80BCE4C
	call S_DoSaveDialog
	compare RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A327F
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A28D7, 4
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A3276:: @ 81A3276
	msgbox SecretBase_RedCave1_Text_1A297C, 2
	end

SecretBase_RedCave1_EventScript_1A327F:: @ 81A327F
	setvar RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A28F4, 2
	end

SecretBase_RedCave1_EventScript_1A3295:: @ 81A3295
	msgbox SecretBase_RedCave1_Text_1A294D, 2
	end

SecretBase_RedCave1_EventScript_1A329E:: @ 81A329E
	checkflag 2052
	goto_if 0, SecretBase_RedCave1_EventScript_1A32F2
	compare RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A3311
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A1CB2, 5
	compare RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A32FB
	setvar RESULT, 1
	special sub_80BCE4C
	call S_DoSaveDialog
	compare RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A32FB
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A1D48, 4
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A32F2:: @ 81A32F2
	msgbox SecretBase_RedCave1_Text_1A1DF6, 2
	end

SecretBase_RedCave1_EventScript_1A32FB:: @ 81A32FB
	setvar RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A1D59, 2
	end

SecretBase_RedCave1_EventScript_1A3311:: @ 81A3311
	msgbox SecretBase_RedCave1_Text_1A1DC0, 2
	end

SecretBase_RedCave1_EventScript_1A331A:: @ 81A331A
	checkflag 2052
	goto_if 0, SecretBase_RedCave1_EventScript_1A336E
	compare RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A338D
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A2026, 5
	compare RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A3377
	setvar RESULT, 1
	special sub_80BCE4C
	call S_DoSaveDialog
	compare RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A3377
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2095, 4
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A336E:: @ 81A336E
	msgbox SecretBase_RedCave1_Text_1A2147, 2
	end

SecretBase_RedCave1_EventScript_1A3377:: @ 81A3377
	setvar RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A20AE, 2
	end

SecretBase_RedCave1_EventScript_1A338D:: @ 81A338D
	msgbox SecretBase_RedCave1_Text_1A2109, 2
	end

SecretBase_RedCave1_EventScript_1A3396:: @ 81A3396
	checkflag 2052
	goto_if 0, SecretBase_RedCave1_EventScript_1A33EA
	compare RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A3409
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A236A, 5
	compare RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A33F3
	setvar RESULT, 1
	special sub_80BCE4C
	call S_DoSaveDialog
	compare RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A33F3
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2405, 4
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A33EA:: @ 81A33EA
	msgbox SecretBase_RedCave1_Text_1A2480, 2
	end

SecretBase_RedCave1_EventScript_1A33F3:: @ 81A33F3
	setvar RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2420, 2
	end

SecretBase_RedCave1_EventScript_1A3409:: @ 81A3409
	msgbox SecretBase_RedCave1_Text_1A2446, 2
	end

SecretBase_RedCave1_EventScript_1A3412:: @ 81A3412
	checkflag 2052
	goto_if 0, SecretBase_RedCave1_EventScript_1A3466
	compare RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A3485
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A2663, 5
	compare RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A346F
	setvar RESULT, 1
	special sub_80BCE4C
	call S_DoSaveDialog
	compare RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A346F
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2710, 4
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A3466:: @ 81A3466
	msgbox SecretBase_RedCave1_Text_1A27A4, 2
	end

SecretBase_RedCave1_EventScript_1A346F:: @ 81A346F
	setvar RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2736, 2
	end

SecretBase_RedCave1_EventScript_1A3485:: @ 81A3485
	msgbox SecretBase_RedCave1_Text_1A276A, 2
	end

SecretBase_RedCave1_EventScript_1A348E:: @ 81A348E
	checkflag 2052
	goto_if 0, SecretBase_RedCave1_EventScript_1A34E2
	compare RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A3501
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A2A13, 5
	compare RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A34EB
	setvar RESULT, 1
	special sub_80BCE4C
	call S_DoSaveDialog
	compare RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A34EB
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2AE2, 4
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A34E2:: @ 81A34E2
	msgbox SecretBase_RedCave1_Text_1A2BA4, 2
	end

SecretBase_RedCave1_EventScript_1A34EB:: @ 81A34EB
	setvar RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2AFB, 2
	end

SecretBase_RedCave1_EventScript_1A3501:: @ 81A3501
	msgbox SecretBase_RedCave1_Text_1A2B69, 2
	end

SecretBase_RedCave1_EventScript_1A350A:: @ 81A350A
	special sub_80BCE1C
	setvar 0x8004, 1
	setvar 0x8005, 0
	special sub_813556C
	waitstate
	special ScrSpecial_HealPlayerParty
	release
	end

	.include "data/text/secret_power_tm.inc"
	.include "data/scripts/secret_power_tm.inc"

UnknownString_81A38FB: @ 81A38FB
	.string "All decorations and furniture in your\n"
	.string "SECRET BASE will be returned to your PC.\p"
	.string "Is that okay?$"

UnknownString_81A3958: @ 81A3958
	.string "Do you want to register\n"
	.string "{STR_VAR_1}’s SECRET BASE?$"

UnknownString_81A3982: @ 81A3982
	.string "This data is already registered.\n"
	.string "Would you like to delete it?$"

UnknownString_81A39C0: @ 81A39C0
	.string "Up to 10 locations can be registered.\p"
	.string "Delete a location if you want to\n"
	.string "register another location.$"

UnknownString_81A3A22: @ 81A3A22
	.string "Registration completed.$"

UnknownString_81A3A3A: @ 81A3A3A
	.string "Data has been unregistered.$"

UnknownString_81A3A56: @ 81A3A56
	.string "There are no decorations...$"

UnknownString_81A3A72: @ 81A3A72
	.string "{PLAYER} booted up the PC.$"

UnknownString_81A3A87: @ 81A3A87
	.string "What would you like to do?$"

UnknownString_81A3AA2: @ 81A3AA2
	.string "The registered SECRET BASE will remain\n"
	.string "unless the owner moves away.\p"
	.string "If it is removed from the registry,\n"
	.string "another SECRET BASE may take its place.\p"
	.string "Up to ten locations can be registered.{PAUSE_UNTIL_PRESS}$"

UnknownString_81A3B5B: @ 81A3B5B
	.string "A shield of {STR_VAR_2} that marks winning\n"
	.string "{STR_VAR_1} times in a row at the BATTLE TOWER.$"

UnknownString_81A3BA4: @ 81A3BA4
	.string "A realistic toy TV. It could be easily\n"
	.string "mistaken for the real thing.$"

UnknownString_81A3BE8: @ 81A3BE8
	.string "A toy TV shaped like a SEEDOT.\n"
	.string "It looks ready to roll away on its own...$"

UnknownString_81A3C31: @ 81A3C31
	.string "A toy TV shaped like a SKITTY.\n"
	.string "It looks ready to stroll away...$"

UnknownString_81A3C71: @ 81A3C71
	.string "You may only make one SECRET BASE.\p"
	.string "Would you like to move from the SECRET\n"
	.string "BASE near {STR_VAR_1}?$"

UnknownString_81A3CC9: @ 81A3CC9
	.string "Moving completed.\p"
	.string "Would you like to use the SECRET POWER?$"

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
	special sub_80BDE48
	inccounter GAME_STAT_GOT_INTERVIEWED
	release
	end

SlateportCity_PokemonFanClub_EventScript_1ADE4D:: @ 81ADE4D
	setvar 0x8005, 1
	special sub_80BF2C4
	compare RESULT, 1
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1ADED6
	copyvar 0x8009, 0x8006
	msgbox SlateportCity_PokemonFanClub_Text_1A8704, 5
	compare RESULT, 1
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1ADE84
	compare RESULT, 0
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1ADEB9
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
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1ADEC3
	compare RESULT, 0
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1ADEB9
	end

SlateportCity_PokemonFanClub_EventScript_1ADEB9:: @ 81ADEB9
	msgbox SlateportCity_PokemonFanClub_Text_1A8667, 4
	release
	end

SlateportCity_PokemonFanClub_EventScript_1ADEC3:: @ 81ADEC3
	msgbox SlateportCity_PokemonFanClub_Text_1A8818, 4
	setvar 0x8005, 1
	goto SlateportCity_PokemonFanClub_EventScript_1ADE46
	end

SlateportCity_PokemonFanClub_EventScript_1ADED6:: @ 81ADED6
	msgbox SlateportCity_PokemonFanClub_Text_1A86B5, 4
	release
	end

SlateportCity_OceanicMuseum_1F_EventScript_1ADEE0:: @ 81ADEE0
	lock
	faceplayer
	setvar 0x8005, 2
	special sub_80BF2C4
	compare RESULT, 1
	goto_if_eq SlateportCity_OceanicMuseum_1F_EventScript_1ADF96
	copyvar 0x8009, 0x8006
	checkflag 105
	goto_if_eq SlateportCity_OceanicMuseum_1F_EventScript_1ADF25
	setflag 105
	msgbox SlateportCity_OceanicMuseum_1F_Text_1A927F, 5
	compare RESULT, 1
	goto_if_eq SlateportCity_OceanicMuseum_1F_EventScript_1ADF44
	compare RESULT, 0
	goto_if_eq SlateportCity_OceanicMuseum_1F_EventScript_1ADF79
	end

SlateportCity_OceanicMuseum_1F_EventScript_1ADF25:: @ 81ADF25
	msgbox SlateportCity_OceanicMuseum_1F_Text_1A934C, 5
	compare RESULT, 1
	goto_if_eq SlateportCity_OceanicMuseum_1F_EventScript_1ADF44
	compare RESULT, 0
	goto_if_eq SlateportCity_OceanicMuseum_1F_EventScript_1ADF79
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
	goto_if_eq SlateportCity_OceanicMuseum_1F_EventScript_1ADF83
	compare RESULT, 0
	goto_if_eq SlateportCity_OceanicMuseum_1F_EventScript_1ADF79
	end

SlateportCity_OceanicMuseum_1F_EventScript_1ADF79:: @ 81ADF79
	msgbox SlateportCity_OceanicMuseum_1F_Text_1A9446, 4
	release
	end

SlateportCity_OceanicMuseum_1F_EventScript_1ADF83:: @ 81ADF83
	msgbox SlateportCity_OceanicMuseum_1F_Text_1A949A, 4
	setvar 0x8005, 2
	goto SlateportCity_OceanicMuseum_1F_EventScript_1ADE46
	end

SlateportCity_OceanicMuseum_1F_EventScript_1ADF96:: @ 81ADF96
	msgbox SlateportCity_OceanicMuseum_1F_Text_1A952E, 4
	release
	end

SlateportCity_PokemonFanClub_EventScript_1ADFA0:: @ 81ADFA0
	lock
	faceplayer
	specialvar RESULT, sub_80BF544
	compare RESULT, 0
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1ADE4D
	setvar 0x8005, 3
	special sub_80BF2C4
	compare RESULT, 1
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1AE0AC
	copyvar 0x8009, 0x8006
	msgbox SlateportCity_PokemonFanClub_Text_1A82F1, 5
	compare RESULT, 1
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1ADFE9
	compare RESULT, 0
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1AE0A2
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
	goto SlateportCity_PokemonFanClub_EventScript_1AE04A
	end

SlateportCity_PokemonFanClub_EventScript_1AE02E:: @ 81AE02E
	msgbox SlateportCity_PokemonFanClub_Text_1A8470, 4
	goto SlateportCity_PokemonFanClub_EventScript_1AE04A
	end

SlateportCity_PokemonFanClub_EventScript_1AE03C:: @ 81AE03C
	msgbox SlateportCity_PokemonFanClub_Text_1A84D5, 4
	goto SlateportCity_PokemonFanClub_EventScript_1AE04A
	end

SlateportCity_PokemonFanClub_EventScript_1AE04A:: @ 81AE04A
	setvar 0x8004, 7
	copyvar 0x8005, 0x8009
	setvar 0x8006, 0
	call SlateportCity_PokemonFanClub_EventScript_1A00F3
	lock
	faceplayer
	compare RESULT, 0
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1AE0A2
	msgbox SlateportCity_PokemonFanClub_Text_1A852D, 4
	setvar 0x8006, 1
	call SlateportCity_PokemonFanClub_EventScript_1A00F3
	lock
	faceplayer
	compare RESULT, 0
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1AE0A2
	msgbox SlateportCity_PokemonFanClub_Text_1A85A6, 4
	copyvar 0x8007, 0x800a
	setvar 0x8005, 3
	goto SlateportCity_PokemonFanClub_EventScript_1ADE46
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
	goto_if_eq FallarborTown_ContestLobby_EventScript_1AE17E
	setvar 0x8005, 6
	special sub_80BF2C4
	compare RESULT, 1
	goto_if_eq FallarborTown_ContestLobby_EventScript_1AE17E
	copyvar 0x8009, 0x8006
	msgbox FallarborTown_ContestLobby_Text_1A6F7C, 5
	compare RESULT, 1
	goto_if_eq FallarborTown_ContestLobby_EventScript_1AE0F8
	compare RESULT, 0
	goto_if_eq FallarborTown_ContestLobby_EventScript_1AE12D
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
	goto_if_eq FallarborTown_ContestLobby_EventScript_1AE137
	compare RESULT, 0
	goto_if_eq FallarborTown_ContestLobby_EventScript_1AE12D
	end

FallarborTown_ContestLobby_EventScript_1AE12D:: @ 81AE12D
	msgbox FallarborTown_ContestLobby_Text_1A7256, 4
	release
	end

FallarborTown_ContestLobby_EventScript_1AE137:: @ 81AE137
	setvar 0x8004, 24
	special SetContestCategoryStringVarForInterview
	msgbox FallarborTown_ContestLobby_Text_1A70A5, 4
	setvar 0x8004, 11
	copyvar 0x8005, 0x8009
	setvar 0x8006, 1
	call FallarborTown_ContestLobby_EventScript_1A00F3
	lock
	faceplayer
	compare RESULT, 0
	goto_if_eq FallarborTown_ContestLobby_EventScript_1AE12D
	msgbox FallarborTown_ContestLobby_Text_1A7153, 4
	setflag 2
	setvar 0x8005, 6
	goto FallarborTown_ContestLobby_EventScript_1ADE46
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
	goto_if 5, FallarborTown_ContestLobby_EventScript_1AE1FE
	setvar 0x8005, 6
	special sub_80BF2C4
	compare RESULT, 1
	goto_if_eq FallarborTown_ContestLobby_EventScript_1AE1FE
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
	goto_if_eq BattleTower_Lobby_EventScript_1AE2E3
	setvar 0x8005, 7
	special sub_80BF2C4
	compare RESULT, 1
	goto_if_eq BattleTower_Lobby_EventScript_1AE2E3
	copyvar 0x8009, 0x8006
	msgbox BattleTower_Lobby_Text_1A776D, 5
	compare RESULT, 1
	goto_if_eq BattleTower_Lobby_EventScript_1AE241
	compare RESULT, 0
	goto_if_eq BattleTower_Lobby_EventScript_1AE297
	end

BattleTower_Lobby_EventScript_1AE241:: @ 81AE241
	message BattleTower_Lobby_Text_1A7823
	waitmessage
	multichoice 19, 8, 45, 1
	copyvar 0x8008, RESULT
	compare RESULT, 0
	call_if 1, BattleTower_Lobby_EventScript_1AE2A1
	compare RESULT, 1
	call_if 1, BattleTower_Lobby_EventScript_1AE2AA
	msgbox BattleTower_Lobby_Text_1A79EB, 4
	setvar 0x8004, 12
	copyvar 0x8005, 0x8009
	call BattleTower_Lobby_EventScript_1A00F3
	lock
	faceplayer
	compare RESULT, 1
	goto_if_eq BattleTower_Lobby_EventScript_1AE2B3
	compare RESULT, 0
	goto_if_eq BattleTower_Lobby_EventScript_1AE2D9
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
	goto_if_eq BattleTower_Lobby_EventScript_1AE2D9
	msgbox BattleTower_Lobby_Text_1A7A6E, 4
	setflag 2
	copyvar 0x8004, 0x8008
	setvar 0x8005, 7
	goto BattleTower_Lobby_EventScript_1ADE46
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
	goto_if_eq BattleTower_Lobby_EventScript_1AE30F
	setvar 0x8005, 7
	special sub_80BF2C4
	compare RESULT, 1
	goto_if_eq BattleTower_Lobby_EventScript_1AE30F
	clearflag 918
	return

BattleTower_Lobby_EventScript_1AE30F:: @ 81AE30F
	setflag 918
	return

	.include "data/scripts/gabby_and_ty.inc"

	.include "data/scripts/mauville_man.inc"

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
	animdarklevel 1
	setdarklevel 1
	end

	.include "data/scripts/players_house.inc"

S_RunningShoesManual:: @ 81B6E5A
	msgbox UnknownString_81728E3, 3
	end

	.include "data/text/pokeblocks.inc"
	.include "data/scripts/pokeblocks.inc"

	.include "data/text/trainers.inc"

S_RepelWoreOff:: @ 81C33E6
	msgbox Text_RepelWoreOff, 3
	end

Text_RepelWoreOff: @ 81C33EF
	.string "REPEL’s effect wore off...$"

	.include "data/scripts/safari_zone.inc"
	.include "data/text/safari_zone.inc"

MauvilleCity_GameCorner_EventScript_1C407E:: @ 81C407E
	checkitem ITEM_COIN_CASE, 1
	compare RESULT, 0
	goto_if_eq MauvilleCity_GameCorner_EventScript_1572B5
	setvar 0x8004, 0
	getpricereduction 2
	compare RESULT, 0
	goto_if_eq MauvilleCity_GameCorner_EventScript_1C40DA
	addvar 0x8004, 128
	goto MauvilleCity_GameCorner_EventScript_1C40DA
	end

MauvilleCity_GameCorner_EventScript_1C40AC:: @ 81C40AC
	checkitem ITEM_COIN_CASE, 1
	compare RESULT, 0
	goto_if_eq MauvilleCity_GameCorner_EventScript_1572B5
	setvar 0x8004, 1
	getpricereduction 2
	compare RESULT, 0
	goto_if_eq MauvilleCity_GameCorner_EventScript_1C40DA
	addvar 0x8004, 128
	goto MauvilleCity_GameCorner_EventScript_1C40DA
	end

MauvilleCity_GameCorner_EventScript_1C40DA:: @ 81C40DA
	special PlayRoulette
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
	map_script_2 0x4022, 0, S_FallDownHole
	.2byte 0

GraniteCave_B1F_MapScript1_1C6BBF:: @ 81C6BBF
MtPyre_2F_MapScript1_1C6BBF:: @ 81C6BBF
SkyPillar_2F_MapScript1_1C6BBF:: @ 81C6BBF
SkyPillar_4F_MapScript1_1C6BBF:: @ 81C6BBF
	copyvar 0x4022, 0x1
	end

S_FallDownHole:: @ 81C6BC5
	lockall
	delay 20
	applymovement 255, GraniteCave_B1F_Movement_1C6BF7
	waitmovement 0
	playse 43
	delay 60
	warphole UNDEFINED
	waitstate
	end

gUnknown_081C6BDE:: @ 81C6BDE
	lockall
	delay 20
	applymovement 255, GraniteCave_B1F_Movement_1C6BF7
	waitmovement 0
	playse 43
	delay 60
	special sp13F_fall_to_last_warp
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
	braillemessage Underwater_SealedChamber_Braille_1C533D
	waitbutton
	erasebox 0, 0, 29, 19
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
