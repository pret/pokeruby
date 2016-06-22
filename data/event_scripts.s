	.include "asm/macros.s"
	.include "constants/constants.s"

	.section event_script_data, "aw", %progbits

@ 814AE30
	.include "data/script_cmd_table.s"

gUnknown_0814B14C::
	.incbin "baserom.gba", 0x0014b14c, 0x48

	.include "data/specials.s"

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

	.include "data/maps/scripts/PetalburgCity.s"
	.include "data/maps/scripts/SlateportCity.s"
	.include "data/maps/scripts/MauvilleCity.s"
	.include "data/maps/scripts/RustboroCity.s"
	.include "data/maps/scripts/FortreeCity.s"
	.include "data/maps/scripts/LilycoveCity.s"
	.include "data/maps/scripts/MossdeepCity.s"
	.include "data/maps/scripts/SootopolisCity.s"
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
	.include "data/maps/scripts/SouthernIsland_Interior.s"
	.include "data/maps/scripts/SafariZone_RestHouse.s"
	.include "data/maps/scripts/Route104_Prototype.s"
	.include "data/maps/scripts/Route104_PrototypePrettyPetalFlowerShop.s"
	.include "data/maps/scripts/Route109_SeashoreHouse.s"
	.include "data/maps/scripts/Route110_TrickHouseEntrance.s"
	.include "data/maps/scripts/Route110_TrickHouseEnd.s"
	.include "data/maps/scripts/Route110_TrickHouseCorridor.s"
	.include "data/maps/scripts/Route110_TrickHousePuzzle1.s"
	.include "data/maps/scripts/Route110_TrickHousePuzzle2.s"
	.include "data/maps/scripts/Route110_TrickHousePuzzle3.s"
	.include "data/maps/scripts/Route110_TrickHousePuzzle4.s"
	.include "data/maps/scripts/Route110_TrickHousePuzzle5.s"
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
	.include "data/maps/text/LavaridgeTown.s"
	.include "data/maps/text/FallarborTown.s"
	.include "data/maps/text/VerdanturfTown.s"
	.include "data/maps/text/PacifidlogTown.s"
	.include "data/maps/text/Route101.s"
	.include "data/maps/text/Route102.s"
	.include "data/maps/text/Route103.s"
	.include "data/maps/text/Route104.s"
	.include "data/maps/text/Route105.s"
	.include "data/maps/text/Route106.s"
	.include "data/maps/text/Route107.s"
	.include "data/maps/text/Route108.s"
	.include "data/maps/text/Route109.s"
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
	.include "data/maps/text/Route121.s"
	.include "data/maps/text/Route123.s"
	.include "data/maps/text/Route124.s"
	.include "data/maps/text/Route128.s"
	.include "data/maps/text/LittlerootTown_BrendansHouse_1F.s"
	.include "data/maps/text/LittlerootTown_BrendansHouse_2F.s"
	.include "data/maps/text/LittlerootTown_MaysHouse_1F.s"
	.include "data/maps/text/LittlerootTown_MaysHouse_2F.s"
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
	.include "data/maps/text/SootopolisCity_Gym_1F.s"
	.include "data/maps/text/SootopolisCity_Gym_B1F.s"
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
	.include "data/maps/text/AbandonedShip_HiddenFloorRooms.s"
	.include "data/maps/text/SecretBase_RedCave1.s"
	.include "data/maps/text/InsideOfTruck.s"
	.include "data/maps/text/SSTidalCorridor.s"
	.include "data/maps/text/SSTidalLowerDeck.s"
	.include "data/maps/text/SSTidalRooms.s"
	.include "data/maps/text/BattleTower_Outside.s"
	.include "data/maps/text/BattleTower_Lobby.s"
	.include "data/maps/text/BattleTower_BattleRoom.s"
	.include "data/maps/text/Route104_Prototype.s"
	.include "data/maps/text/Route104_PrototypePrettyPetalFlowerShop.s"
	.include "data/maps/text/Route109_SeashoreHouse.s"
	.include "data/maps/text/Route110_TrickHouseEntrance.s"

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

	.include "data/maps/text/Route110_TrickHouseEnd.s"
	.include "data/maps/text/Route110_TrickHousePuzzle1.s"
	.include "data/maps/text/Route110_TrickHousePuzzle2.s"
	.include "data/maps/text/Route110_TrickHousePuzzle3.s"
	.include "data/maps/text/Route110_TrickHousePuzzle4.s"
	.include "data/maps/text/Route110_TrickHousePuzzle5.s"
	.include "data/maps/text/Route110_TrickHousePuzzle6.s"
	.include "data/maps/text/Route110_TrickHousePuzzle7.s"
	.include "data/maps/text/Route110_TrickHousePuzzle8.s"
	.include "data/maps/text/Route110_SeasideCyclingRoadSouthEntrance.s"
	.include "data/maps/text/Route110_SeasideCyclingRoadNorthEntrance.s"
	.include "data/maps/text/Route113_GlassWorkshop.s"
	.include "data/maps/text/Route119_WeatherInstitute_1F.s"
	.include "data/maps/text/Route119_WeatherInstitute_2F.s"
	.include "data/maps/text/Route119_House.s"
	.include "data/maps/text/Route124_DivingTreasureHuntersHouse.s"


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

	.incbin "baserom.gba", 0x19f805, 0x1

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

	.incbin "baserom.gba", 0x19f8ae, 0x89

Std_6::
	message 0x0
	waittext
	waitbutton
	release
	return

	.incbin "baserom.gba", 0x19f940, 0x141

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
	doanimation 0x9
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

UnknownString_81A09EC: @ 81A09EC
	.string "{PLAYER} booted up the PC.$"

	.global gUnknown_081A0A01
gUnknown_081A0A01: @ 81A0A01

UnknownString_81A0A01: @ 81A0A01
	.string "Which PC should be accessed?$"

UnknownString_81A0A1E: @ 81A0A1E
	.string "Accessed someone’s PC.$"

UnknownString_81A0A35: @ 81A0A35
	.string "POKéMON Storage System opened.$"

UnknownString_81A0A54: @ 81A0A54
	.string "Accessed {PLAYER}’s PC.$"

UnknownString_81A0A66: @ 81A0A66
	.string "Accessed LANETTE’s PC.$"

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
	.include "data/maps/text/Route104_PrettyPetalFlowerShop.s"
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

	.include "data/maps/text/LilycoveCity_DepartmentStoreElevator.s"
Route111_Text_1A0F93:: @ 81A0F93
	.string "The sandstorm is vicious.\n"
	.string "It’s impossible to keep going.$"

UnknownString_81A0FCC: @ 81A0FCC
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

	.global gUnknown_081A1132
gUnknown_081A1132: @ 81A1132

UnknownString_81A1132: @ 81A1132
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

UseSurfPromptText: @ 81A1344
	.string "The water is dyed a deep blue...\n"
	.string "Would you like to SURF?$"

UsedSurfText: @ 81A137D
	.string "{STR_VAR_1} used SURF!$"

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

BerryTreeScript:: @ 81A14DD
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

	.global gUnknown_081A1BB2
gUnknown_081A1BB2: @ 81A1BB2

UnknownString_81A1BB2: @ 81A1BB2
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

	.global gUnknown_081A1D74
gUnknown_081A1D74: @ 81A1D74

UnknownString_81A1D74: @ 81A1D74
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

	.global gUnknown_081A1F67
gUnknown_081A1F67: @ 81A1F67

UnknownString_81A1F67: @ 81A1F67
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

	.global gUnknown_081A20C9
gUnknown_081A20C9: @ 81A20C9

UnknownString_81A20C9: @ 81A20C9
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

	.global gUnknown_081A2254
gUnknown_081A2254: @ 81A2254

UnknownString_81A2254: @ 81A2254
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

	.global gUnknown_081A2439
gUnknown_081A2439: @ 81A2439

UnknownString_81A2439: @ 81A2439
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

	.global gUnknown_081A25C3
gUnknown_081A25C3: @ 81A25C3

UnknownString_81A25C3: @ 81A25C3
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

	.global gUnknown_081A2754
gUnknown_081A2754: @ 81A2754

UnknownString_81A2754: @ 81A2754
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

	.global gUnknown_081A2925
gUnknown_081A2925: @ 81A2925

UnknownString_81A2925: @ 81A2925
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

	.global gUnknown_081A2B2A
gUnknown_081A2B2A: @ 81A2B2A

UnknownString_81A2B2A: @ 81A2B2A
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
UnknownString_81A4932: @ 81A4932
	.string "When all players are ready...\n"
	.string "A Button: Confirm   B Button: Cancel$"

	.global gUnknown_081A4975
gUnknown_081A4975: @ 81A4975
UnknownString_81A4975: @ 81A4975
	.string "Start link with {STR_VAR_1} players.\n"
	.string "A Button: Confirm   B Button: Cancel$"

	.global gUnknown_081A49B6
gUnknown_081A49B6: @ 81A49B6

UnknownString_81A49B6: @ 81A49B6
	.string "Awaiting linkup...\n"
	.string "... ... B Button: Cancel$"

UnknownString_81A49E2: @ 81A49E2
	.string "Your progress must be saved before\n"
	.string "linking. Is it okay to save?$"

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

UnknownString_81A4C6E: @ 81A4C6E
	.string "The link will be terminated if you\n"
	.string "leave the room. Is that okay?$"

UnknownString_81A4CAF: @ 81A4CAF
	.string "Terminating link... You will be\n"
	.string "escorted out of the room. Please wait.$"

UnknownString_81A4CF6: @ 81A4CF6
	.string "This TRAINER is too busy to notice...$"

UnknownString_81A4D1C: @ 81A4D1C
	.string "Score! Got to look at {STR_VAR_1}’s\n"
	.string "TRAINER CARD!$"

UnknownString_81A4D45: @ 81A4D45
	.string "Score! Got to look at {STR_VAR_1}’s\n"
	.string "TRAINER CARD! It’s a {STR_VAR_2} card!$"

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

UnknownString_81A72DE: @ 81A72DE
	.string "Yeah!\n"
	.string "It’s BRAVO TRAINER time!\p"
	.string "Today, we’re going to profile a POKéMON\n"
	.string "belonging to {STR_VAR_1}.\p"
	.string "Now, this POKéMON boasts a {STR_VAR_2}\n"
	.string "rating in the {STR_VAR_3} Rank.$"

UnknownString_81A736B: @ 81A736B
	.string "Introducing {STR_VAR_2} the\n"
	.string "{STR_VAR_1}!\p"
	.string "The nickname {STR_VAR_2}...\p"
	.string "Even the nickname exudes an air that\n"
	.string "proclaims “{STR_VAR_3}”!$"

UnknownString_81A73CA: @ 81A73CA
	.string "Anyway, when the TRAINER {STR_VAR_1}\n"
	.string "entered the POKéMON in a CONTEST,\l"
	.string "we managed to get a few impassioned\l"
	.string "quotes about the trusty partner.$"

UnknownString_81A744D: @ 81A744D
	.string "Asked about the CONTEST afterwards,\n"
	.string "{STR_VAR_1} happily replied with a huge\l"
	.string "grin, “{STR_VAR_2}!”\p"
	.string "Well, sure, {STR_VAR_1}’s POKéMON came in\n"
	.string "number {STR_VAR_3} in the CONTEST.\p"
	.string "That line perfectly suits {STR_VAR_1}\n"
	.string "right now, I’d say!$"

UnknownString_81A7508: @ 81A7508
	.string "Asked about the CONTEST afterwards,\n"
	.string "{STR_VAR_1} replied with a tinge of\l"
	.string "bitterness, “{STR_VAR_2}.”\p"
	.string "Well, sure, {STR_VAR_1}’s POKéMON came in\n"
	.string "number {STR_VAR_3} in the CONTEST.\p"
	.string "{STR_VAR_1}’s disappointment comes across\n"
	.string "loud and clear, I’d say!$"

UnknownString_81A75CE: @ 81A75CE
	.string "Wouldn’t you also like to know what\n"
	.string "{STR_VAR_1} imagines {STR_VAR_2} to be?\p"
	.string "You bet we did!\n"
	.string "So we asked, of course!\p"
	.string "The answer is all perfectly condensed:\n"
	.string "“{STR_VAR_3}!”\p"
	.string "That’s what the concept of {STR_VAR_2}\n"
	.string "represents to {STR_VAR_1}!$"

UnknownString_81A768D: @ 81A768D
	.string "The last move {STR_VAR_2} used by\n"
	.string "the {STR_VAR_1} is entirely about\l"
	.string "“{STR_VAR_3}”!$"

UnknownString_81A76C5: @ 81A76C5
	.string "Bravo, {STR_VAR_1}!\n"
	.string "Bravo, {STR_VAR_2}!\p"
	.string "I hope we can count on seeing\n"
	.string "{STR_VAR_1} scale even greater heights!\p"
	.string "That’s all the time we have!\n"
	.string "Until next time, see you!$"

UnknownString_81A774F: @ 81A774F
	.string "Introducing the TRAINER’s {STR_VAR_1}!$"

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

UnknownString_81A7B93: @ 81A7B93
	.string "Yeah!\n"
	.string "It’s BRAVO TRAINER time!\p"
	.string "Today, we’re going to profile {STR_VAR_1},\n"
	.string "who took the BATTLE TOWER challenge!\p"
	.string "For the challenge, {STR_VAR_1} entered one\n"
	.string "wicked {STR_VAR_2}.$"

UnknownString_81A7C26: @ 81A7C26
	.string "The pair set a new record of {STR_VAR_2} wins\n"
	.string "in a row in Level {STR_VAR_1} competition!\l"
	.string "Bravo, TRAINER!$"

UnknownString_81A7C7D: @ 81A7C7D
	.string "The twosome finally succumbed to\n"
	.string "{STR_VAR_1} in match number {STR_VAR_2}.\l"
	.string "Nice try, TRAINER!\p"
	.string "But, hey, it’s just bad luck to run into\n"
	.string "{STR_VAR_1} so early in the challenge.\p"
	.string "We asked the TRAINER for impressions\n"
	.string "on the match with {STR_VAR_1}.$"

UnknownString_81A7D4A: @ 81A7D4A
	.string "The twosome won it all by defeating\n"
	.string "{STR_VAR_1}’s {STR_VAR_2} thoroughly.\l"
	.string "Bravo, TRAINER!\p"
	.string "Knocking off even {STR_VAR_1}...\n"
	.string "It defies belief! Simply astounding!\p"
	.string "We asked the TRAINER for impressions\n"
	.string "on the moment of glory.$"

UnknownString_81A7E0C: @ 81A7E0C
	.string "After a string of wins, the pair finally\n"
	.string "succumbed to {STR_VAR_1}’s {STR_VAR_2},\l"
	.string "their final hurdle.\p"
	.string "Nice try, TRAINER!\p"
	.string "Still, you have to give credit.\n"
	.string "You don’t see many famous combinations\l"
	.string "like {STR_VAR_1} and {STR_VAR_2}.\p"
	.string "We asked the TRAINER for impressions\n"
	.string "on battling the celebrity pair.$"

UnknownString_81A7F0E: @ 81A7F0E
	.string "This is what the TRAINER had to say:\n"
	.string "“I’m satisfied!”\p"
	.string "Now isn’t that a refreshing reply?\n"
	.string "Bravo, TRAINER!\p"
	.string "Isn’t it out-and-out awesome to be able\n"
	.string "to battle to full satisfaction?\p"
	.string "I found out exactly how satisfied\n"
	.string "when I heard the TRAINER say this:$"

UnknownString_81A8004: @ 81A8004
	.string "This is what the TRAINER had to say:\n"
	.string "“I’m not satisfied...”\p"
	.string "Our TRAINER was obviously a little down\n"
	.string "when that was uttered.\p"
	.string "Still, it’s not easy to be able to battle\n"
	.string "with complete satisfaction, am I right?\p"
	.string "Anyway, I found out how dissatisfied\n"
	.string "our TRAINER was when I heard this:$"

UnknownString_81A8119: @ 81A8119
	.string "None$"

UnknownString_81A811E: @ 81A811E
	.string "None$"

UnknownString_81A8123: @ 81A8123
	.string "None$"

UnknownString_81A8128: @ 81A8128
	.string "None$"

UnknownString_81A812D: @ 81A812D
	.string "“{STR_VAR_1}.”$"

UnknownString_81A8133: @ 81A8133
	.string "“{STR_VAR_1}.”\n"
	.string "Now isn’t that great?\p"
	.string "It really expresses {STR_VAR_2}’s joy,\n"
	.string "I’d say.\p"
	.string "That battle with {STR_VAR_3} at the\n"
	.string "end... It really was what you’d call\l"
	.string "“{STR_VAR_1}”!$"

UnknownString_81A81BC: @ 81A81BC
	.string "“{STR_VAR_1}.”\n"
	.string "Now isn’t that fitting?\p"
	.string "That battle with {STR_VAR_3} at the\n"
	.string "end... You can’t describe it as anything\l"
	.string "else but “{STR_VAR_1}”!\p"
	.string "{STR_VAR_2}’s disappointment comes across\n"
	.string "loud and clear, I’d say!$"

UnknownString_81A8267: @ 81A8267
	.string "Bravo, {STR_VAR_1}!\n"
	.string "Bravo, {STR_VAR_2}!\p"
	.string "I hope we can count on seeing\n"
	.string "{STR_VAR_1} scale even greater heights!\p"
	.string "That’s all the time we have!\n"
	.string "Until next time, see you!$"

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

UnknownString_81A8917: @ 81A8917
	.string "WE ARE THE POKéMON FAN CLUB!\p"
	.string "We’re on the air!\p"
	.string "On this program, we get your opinions,\n"
	.string "and I shout them out on your behalf!\l"
	.string "Isn’t it a fantastic program concept?\p"
	.string "Today, we bring you this report from\n"
	.string "our reporter, who we sent out to the\l"
	.string "POKéMON FAN CLUB.\p"
	.string "So, just who is today’s featured\n"
	.string "POKéMON fan?\p"
	.string "... ... ... ... ... ... ... ...\p"
	.string "{STR_VAR_1}!\p"
	.string "So, let’s hear what {STR_VAR_1} has to\n"
	.string "say about {STR_VAR_3} the {STR_VAR_2}.\p"
	.string "And, I will shout those words of love\n"
	.string "out loud on TV!\p"
	.string "Hoo-hah!\p"
	.string "Let’s shout!$"

UnknownString_81A8AE5: @ 81A8AE5
	.string "We asked {STR_VAR_1}, “When you first\n"
	.string "laid eyes on your {STR_VAR_2}, what was\l"
	.string "your initial thought?“\p"
	.string "“{STR_VAR_3}!“\p"
	.string "Yeahah! That’s a mighty fine shout!\p"
	.string "Doesn’t it bring back memories of those\n"
	.string "days long gone by?$"

UnknownString_81A8B9D: @ 81A8B9D
	.string "We asked {STR_VAR_1}, “If you were to\n"
	.string "liken your {STR_VAR_2} to something,\l"
	.string "it would be...”\p"
	.string "... ... ... ... ... ... ... ...\p"
	.string "“{STR_VAR_3}!”\p"
	.string "Whoah-oh, now that’s an original idea!\p"
	.string "You sure can sense the intensity of\n"
	.string "feeling the TRAINER has for\l"
	.string "{STR_VAR_2}.$"

UnknownString_81A8C77: @ 81A8C77
	.string "And let’s see...\n"
	.string "What was it about that {STR_VAR_2}\l"
	.string "that so attracted {STR_VAR_1}?\p"
	.string "... ... ... ... ... ... ... ...\p"
	.string "“{STR_VAR_3}!”\p"
	.string "Whoa! Such a spectacular declaration!\p"
	.string "The love of this TRAINER for the\n"
	.string "{STR_VAR_2} comes across loud and clear!$"

UnknownString_81A8D45: @ 81A8D45
	.string "Hm? Oh, there’s still more.\n"
	.string "Let’s check it out!\p"
	.string "Let me see, now...\p"
	.string "We asked {STR_VAR_1}, “What do POKéMON\n"
	.string "mean to you?”\p"
	.string "... ... ... ... ... ...\p"
	.string "“{STR_VAR_3}!”\p"
	.string "Bravo!\p"
	.string "That’s the best shout I’ve had all day!\p"
	.string "“{STR_VAR_3}!”\p"
	.string "It makes you want to shout it out loud\n"
	.string "again and again!\p"
	.string "Now that we’ve had a great shout, it’s\n"
	.string "time to say good-bye until next time!\p"
	.string "So, let’s all have one last shout!\n"
	.string "All together now...\p"
	.string "“{STR_VAR_3}!”$"

UnknownString_81A8EC9: @ 81A8EC9
	.string "WE ARE THE POKéMON FAN CLUB!\p"
	.string "We’re on the air!\p"
	.string "Today, we’ll get rolling with the POKéMON\n"
	.string "SURVEY CORNER.\p"
	.string "Out of all the tales woven by POKéMON\n"
	.string "and TRAINERS, what startling new drama\l"
	.string "will grab our attention today?\p"
	.string "Let me see...\p"
	.string "This one!\p"
	.string "We’ll start with this letter!\p"
	.string "It’s a letter from {STR_VAR_1} about a\n"
	.string "beloved {STR_VAR_2}.\p"
	.string "Let’s see how passionately our writer\n"
	.string "can express love for the {STR_VAR_2}!\l"
	.string "Hmhm...$"

UnknownString_81A9048: @ 81A9048
	.string "Whoah!\n"
	.string "What an amazing letter!$"

UnknownString_81A9067: @ 81A9067
	.string "I loved it, so here it is again!$"

UnknownString_81A9088: @ 81A9088
	.string "A great letter bears reading over\n"
	.string "and over!$"

UnknownString_81A90B4: @ 81A90B4
	.string "The bit “{STR_VAR_3},” that really\n"
	.string "accentuates emotional impact!\p"
	.string "It’s a great letter that has real\n"
	.string "heartfelt depth!$"

UnknownString_81A911F: @ 81A911F
	.string "Especially that “{STR_VAR_3}” bit!\p"
	.string "I love how “{STR_VAR_3}” is used!$"

UnknownString_81A9152: @ 81A9152
	.string "By the way, and it’s not important,\n"
	.string "but “{STR_VAR_3}” is a great saying.\p"
	.string "I’ve been using “{STR_VAR_3}” a lot\n"
	.string "in conversations lately.$"

UnknownString_81A91C6: @ 81A91C6
	.string "If I had to score this letter,\n"
	.string "I’d give it {STR_VAR_3} points.\p"
	.string "Next time, I’ll be expecting an even\n"
	.string "better letter, {STR_VAR_1}!\p"
	.string "A-whoops, will you look at the time?\n"
	.string "Time to say good-bye until next time!$"

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

UnknownString_81A9581: @ 81A9581
	.string "Hello, it’s time for RECENT HAPPENINGS.\p"
	.string "For POKéMON TRAINERS, every day is\n"
	.string "a storybook tale.\p"
	.string "What we want to do is to introduce you\n"
	.string "to some of these POKéMON tales.\p"
	.string "Today, we bring you the story of the\n"
	.string "TRAINER {STR_VAR_1}.\p"
	.string "What did {STR_VAR_1} experience recently?\n"
	.string "Let’s find out.\p"
	.string "Let’s see...$"

UnknownString_81A9694: @ 81A9694
	.string "Wasn’t that enlightening?\p"
	.string "The story gives you a clear idea of what\n"
	.string "{STR_VAR_1} has experienced recently.\l"
	.string "It’s as if we were there as witnesses!$"

UnknownString_81A971B: @ 81A971B
	.string "“{STR_VAR_3}.” That\n"
	.string "accents the tale and gives it depth.$"

UnknownString_81A974B: @ 81A974B
	.string "“{STR_VAR_3}.”\n"
	.string "That gives the tale a sense of place.\l"
	.string "It lets us envision the tale’s setting.$"

UnknownString_81A979F: @ 81A979F
	.string "The “{STR_VAR_3}”\n"
	.string "section of the tale is very expressive.$"

UnknownString_81A97D0: @ 81A97D0
	.string "{STR_VAR_1} has recounted a wonderful\n"
	.string "tale involving POKéMON.\p"
	.string "And now {STR_VAR_1}’s tale is indelibly\n"
	.string "etched into your soul, too.\p"
	.string "That’s it for today.\n"
	.string "Please tune in next time.$"

UnknownString_81A986F: @ 81A986F
	.string "Greetings!\n"
	.string "It’s time for POKéMON NEWS.\p"
	.string "We’ve just received word of a very\n"
	.string "rare occurrence.\p"
	.string "There have been reports of a mass\n"
	.string "outbreak of {STR_VAR_2} in the vicinity\l"
	.string "of {STR_VAR_1}.\p"
	.string "{STR_VAR_2}, as you’re probably aware,\n"
	.string "is known as a POKéMON that’s rare\l"
	.string "and hard to find.\p"
	.string "It sounds like a rare opportunity to\n"
	.string "see the mystifying outbreak of\l"
	.string "{STR_VAR_2} in the wild.\p"
	.string "That’s the news on POKéMON NEWS.$"

UnknownString_81A99D9: @ 81A99D9
	.string "And now, it’s time for...\n"
	.string "THE NAME RATER SHOW.\p"
	.string "I tell your POKéMON’s fortune from\n"
	.string "the nickname you’ve bestowed.\p"
	.string "Advice is what I have to give, and it is\n"
	.string "helpful advice that I offer.\p"
	.string "Today, I shall prophesize the nickname\n"
	.string "{STR_VAR_3} of {STR_VAR_1}’s POKéMON\l"
	.string "{STR_VAR_2}.\p"
	.string "Hmhm...\p"
	.string "Hmm...\n"
	.string "This nickname is...$"

UnknownString_81A9AF0: @ 81A9AF0
	.string "A nickname that hints at talent in many\n"
	.string "different ways.\p"
	.string "I urge this TRAINER to take courage\n"
	.string "and take on many challenges.$"

UnknownString_81A9B69: @ 81A9B69
	.string "A nickname that perfectly complements\n"
	.string "{STR_VAR_1}, the TRAINER’s name.\p"
	.string "It suggests that you will forge a fine\n"
	.string "partnership with precise timing.$"

UnknownString_81A9BEF: @ 81A9BEF
	.string "A nickname fit for a unique individual\n"
	.string "of a POKéMON!\p"
	.string "If raised properly, this POKéMON’s\n"
	.string "uniqueness will bloom excessively!$"

UnknownString_81A9C6A: @ 81A9C6A
	.string "A nickname that will nurture the caring\n"
	.string "and compassionate side of POKéMON.\p"
	.string "If raised properly, this POKéMON will\n"
	.string "come to exhibit real warmth!$"

UnknownString_81A9CF8: @ 81A9CF8
	.string "A very fine nickname that hints at\n"
	.string "greatness to come.\p"
	.string "I am intrigued about what the future\n"
	.string "holds in store for this POKéMON.$"

UnknownString_81A9D74: @ 81A9D74
	.string "A good nickname that should make the\n"
	.string "POKéMON hale and hearty!\p"
	.string "That POKéMON should remain fit and\n"
	.string "robust for a long, long time.$"

UnknownString_81A9DF3: @ 81A9DF3
	.string "A good nickname that should make the\n"
	.string "POKéMON very active!\p"
	.string "I should think that this POKéMON will be\n"
	.string "a strong performer in battles.$"

UnknownString_81A9E75: @ 81A9E75
	.string "An appealing nickname that should make\n"
	.string "the POKéMON very charming!\p"
	.string "I don’t doubt that this POKéMON will be\n"
	.string "quite the charmer in POKéMON CONTESTS.$"

UnknownString_81A9F06: @ 81A9F06
	.string "The nickname {STR_VAR_1} is rooted by\n"
	.string "the letter “{STR_VAR_3}.”\p"
	.string "That letter is supported by the first\n"
	.string "letter “{STR_VAR_2},” which gives it a solid sense\l"
	.string "of presence as a nickname.$"

UnknownString_81A9F9F: @ 81A9F9F
	.string "The nickname {STR_VAR_1} is very\n"
	.string "shapely in a pleasing manner.\p"
	.string "The presence of the letters “{STR_VAR_2}” and\n"
	.string "“{STR_VAR_3}” - now that is remarkably good!$"

UnknownString_81AA01E: @ 81AA01E
	.string "The nickname {STR_VAR_1} - it has a\n"
	.string "sublime, flowing feel to it.\p"
	.string "The flow from the initial letter “{STR_VAR_2}” to\n"
	.string "“{STR_VAR_3}” is especially wonderful.$"

UnknownString_81AA09D: @ 81AA09D
	.string "Let’s examine other examples of fine\n"
	.string "nicknames, shall we?$"

UnknownString_81AA0D7: @ 81AA0D7
	.string "Try this example. Take a part of the\n"
	.string "TRAINER name of {STR_VAR_1}, and end\l"
	.string "up with the fine nickname {STR_VAR_2}{STR_VAR_3}.$"

UnknownString_81AA138: @ 81AA138
	.string "The nickname {STR_VAR_2}{STR_VAR_3} would also work\n"
	.string "quite well.$"

UnknownString_81AA166: @ 81AA166
	.string "The POKéMON’s species name of\n"
	.string "{STR_VAR_2} could be used as the basis\l"
	.string "for making the nickname {STR_VAR_1}{STR_VAR_3}.$"

UnknownString_81AA1C0: @ 81AA1C0
	.string "{STR_VAR_1}{STR_VAR_3} would also be an effective\n"
	.string "nickname.$"

UnknownString_81AA1EA: @ 81AA1EA
	.string "What should always be avoided is using\n"
	.string "another POKéMON species name.\p"
	.string "For instance, avoid taking the name of\n"
	.string "{STR_VAR_2} to make the nickname {STR_VAR_1}{STR_VAR_3}.\l"
	.string "That is unacceptable.$"

UnknownString_81AA28A: @ 81AA28A
	.string "But I must say, {STR_VAR_2} has a most\n"
	.string "remarkable flair for devising nicknames.\p"
	.string "It is my hope that the TRAINER will\n"
	.string "continue to treat {STR_VAR_1} with love.\p"
	.string "That’s it for today’s show.\n"
	.string "May we meet again.$"

UnknownString_81AA344: @ 81AA344
	.string "{STR_VAR_2} ANGLER\p"
	.string "ANNOUNCER: Hello! Today, we’ll get tips\n"
	.string "on fishing for {STR_VAR_2}.\p"
	.string "GURU, what advice can you give for\n"
	.string "catching {STR_VAR_2}?\p"
	.string "GURU: Hm? Catching {STR_VAR_2}?\n"
	.string "Well, let me tell you, be patient and wait.\l"
	.string "That’s the bottom line.\p"
	.string "Do you see {STR_VAR_1} over there?\n"
	.string "That TRAINER makes a good example.\p"
	.string "That TRAINER’s already had {STR_VAR_3}\n"
	.string "POKéMON get away.\p"
	.string "But there {STR_VAR_1} waits. No giving up.\n"
	.string "That’s the law for catching {STR_VAR_2}.\p"
	.string "ANNOUNCER: I see...\p"
	.string "Oh! {STR_VAR_1} has finally landed an\n"
	.string "elusive {STR_VAR_2}!\p"
	.string "The TRAINER appears close to tears\n"
	.string "out of sheer joy!\p"
	.string "Seeing that elated look, I’m getting\n"
	.string "the itch to go fishing, too!\p"
	.string "Viewers, why not take this as a cue to\n"
	.string "try some {STR_VAR_2} fishing?\p"
	.string "Until our next broadcast, farewell and\n"
	.string "good fishing to you all!$"

UnknownString_81AA5F3: @ 81AA5F3
	.string "{STR_VAR_2} ANGLER\p"
	.string "ANNOUNCER: Hello! Today, we’ll get tips\n"
	.string "on fishing for {STR_VAR_2}.\p"
	.string "GURU, what advice can you give for\n"
	.string "catching {STR_VAR_2}?\p"
	.string "GURU: Hm? Catching {STR_VAR_2}?\n"
	.string "Well, let me tell you, use your fishing\l"
	.string "ROD with vigor!\p"
	.string "Do you see {STR_VAR_1} over there?\n"
	.string "See how the ROD is handled?\p"
	.string "That TRAINER’s already caught\n"
	.string "{STR_VAR_3} in a row.\p"
	.string "ANNOUNCER: It’s incredible!\n"
	.string "It looks like a storm...\p"
	.string "Seeing technique of that caliber, I’m\n"
	.string "getting the itch to go fishing, too.\p"
	.string "Viewers, why not take this as a cue to\n"
	.string "try some {STR_VAR_2} fishing?\p"
	.string "Until our next broadcast, farewell and\n"
	.string "good fishing to you all!$"

UnknownString_81AA814: @ 81AA814
	.string "Hello!\p"
	.string "It’s time for POKéMON TODAY!\p"
	.string "BIG SIS: Hi! Is everyone peachy and\n"
	.string "perky today?\p"
	.string "Today, we’re going to look at {STR_VAR_1}’s\n"
	.string "POKéMON {STR_VAR_2}!\p"
	.string "BIG BRO: Yeah! That’s what we’re going\n"
	.string "to do!$"

UnknownString_81AA8C6: @ 81AA8C6
	.string "Oh!\n"
	.string "Speaking of {STR_VAR_1}...\p"
	.string "BIG SIS, I saw the TRAINER with my very\n"
	.string "own eyes!\p"
	.string "BIG SIS: Oh, what did you see?\p"
	.string "BIG BRO: Well, I had to go on a trip to\n"
	.string "{STR_VAR_2}.\p"
	.string "That’s when I happened to come across\n"
	.string "{STR_VAR_1}, who was trying to catch the\l"
	.string "POKéMON {STR_VAR_3}, but...$"

UnknownString_81AA9B2: @ 81AA9B2
	.string "The POKéMON managed to get away!\p"
	.string "It ended up wasting this many\n"
	.string "POKé BALLS: {STR_VAR_2}!\p"
	.string "You should have seen the expression\n"
	.string "of frustration on {STR_VAR_1}’s face when\l"
	.string "the POKéMON took off!$"

UnknownString_81AAA5C: @ 81AAA5C
	.string "But {STR_VAR_1} goofed and made the\n"
	.string "POKéMON faint!\p"
	.string "It ended up wasting this many\n"
	.string "POKé BALLS: {STR_VAR_2}!\p"
	.string "You should have seen the expression\n"
	.string "of stunned dismay on {STR_VAR_1}’s face\l"
	.string "when the POKéMON fainted!$"

UnknownString_81AAB11: @ 81AAB11
	.string "BIG SIS: Hey, there!\n"
	.string "That’s not nice!\p"
	.string "You shouldn’t be laughing at other\n"
	.string "people’s misfortune!\p"
	.string "Oh, poor {STR_VAR_1}.\n"
	.string "What a shame!\p"
	.string "BIG BRO: That’s true!\n"
	.string "Sorry for laughing.$"

UnknownString_81AABB4: @ 81AABB4
	.string "BIG SIS: Bufufu...\p"
	.string "BIG BRO: Hey!\n"
	.string "You just laughed, too!\p"
	.string "BIG SIS: Huh?!\p"
	.string "I didn’t laugh!\n"
	.string "Honestly, I didn’t!\p"
	.string "Oh, poor {STR_VAR_1}.\n"
	.string "What a shame!\p"
	.string "BIG BRO: ...$"

UnknownString_81AAC47: @ 81AAC47
	.string "BIG SIS: That’s enough silliness!\n"
	.string "Let’s look at today’s POKéMON...\p"
	.string "Huh?\n"
	.string "We’re out of time already?\p"
	.string "Aww!\n"
	.string "We couldn’t profile a POKéMON today!\p"
	.string "BIG BRO: See you again next time!\p"
	.string "BIG SIS: Hey, don’t end the show\n"
	.string "without me!$"

UnknownString_81AAD23: @ 81AAD23
	.string "Hello!\p"
	.string "It’s time for POKéMON TODAY!\p"
	.string "BIG SIS: Hi! Is everyone peachy and\n"
	.string "perky today?\p"
	.string "Today, we’re going to look at {STR_VAR_1}’s\n"
	.string "POKéMON {STR_VAR_2}!\p"
	.string "BIG BRO: Yeah! That’s what we’re going\n"
	.string "to do!$"

UnknownString_81AADD5: @ 81AADD5
	.string "BIG SIS: {STR_VAR_1} gave the nickname\n"
	.string "{STR_VAR_3} to the {STR_VAR_2}!\p"
	.string "It sounds like {STR_VAR_3} is getting\n"
	.string "good, loving care!$"

UnknownString_81AAE31: @ 81AAE31
	.string "BIG BRO: The TRAINER had to throw this\n"
	.string "many BALLS to catch it: {STR_VAR_3}!\p"
	.string "It finally took a single {STR_VAR_2}\n"
	.string "to catch it!$"

UnknownString_81AAE9D: @ 81AAE9D
	.string "BIG SIS: If it was that easy to catch,\n"
	.string "it must have been destiny that brought\l"
	.string "{STR_VAR_1} and the {STR_VAR_2} together!$"

UnknownString_81AAF03: @ 81AAF03
	.string "BIG SIS: Wow! That’s so neat!\p"
	.string "But you know what they say, a POKéMON\n"
	.string "that takes a lot of effort to catch\l"
	.string "earns the love of its TRAINER!$"

UnknownString_81AAF8A: @ 81AAF8A
	.string "BIG SIS: {STR_VAR_1}’s {STR_VAR_2} is a\n"
	.string "memorable POKéMON because it took an\l"
	.string "invaluable MASTER BALL to catch!\p"
	.string "BIG BRO: Wow! That’s mega-awesome!\p"
	.string "BIG SIS: {STR_VAR_1} must have really\n"
	.string "wanted that {STR_VAR_2}, for sure!$"

UnknownString_81AB040: @ 81AB040
	.string "BIG BRO: Then to give the nickname\n"
	.string "{STR_VAR_3} to that {STR_VAR_2}...\p"
	.string "You really get a good idea about\n"
	.string "{STR_VAR_1}’s TRAINER sense.\p"
	.string "BIG SIS: I second that notion!$"

UnknownString_81AB0C8: @ 81AB0C8
	.string "If it were me, I’d give that\n"
	.string "nickname to something like {STR_VAR_3}!\p"
	.string "BIG BRO: Whoa! That could be the start\n"
	.string "of something new!$"

UnknownString_81AB13D: @ 81AB13D
	.string "{STR_VAR_2} the {STR_VAR_1}?\n"
	.string "Doesn’t that sound perfect?\p"
	.string "The letters and everything - they sound\n"
	.string "just right for the POKéMON {STR_VAR_1}!\p"
	.string "BIG BRO: Yeah, true, that!$"

UnknownString_81AB1C6: @ 81AB1C6
	.string "As far as I know, no TRAINER has ever\n"
	.string "given the nickname {STR_VAR_2} to their\l"
	.string "{STR_VAR_1}!\p"
	.string "BIG BRO: That just goes to show what\n"
	.string "great taste the TRAINER has in picking\l"
	.string "nicknames!$"

UnknownString_81AB266: @ 81AB266
	.string "The next time I catch a POKéMON,\n"
	.string "I should give it the name {STR_VAR_2}.\p"
	.string "BIG BRO: Huh? Me, too!\n"
	.string "I’ll use the nickname {STR_VAR_2}, too!$"

UnknownString_81AB2DB: @ 81AB2DB
	.string "BIG SIS: Oh, no!\n"
	.string "Look at the time!\p"
	.string "Well, gang, this is it for today.\n"
	.string "See you again next time!\p"
	.string "BIG BRO: Remember, it could be your\n"
	.string "POKéMON in the spotlight next time!$"

UnknownString_81AB381: @ 81AB381
	.string "Hello!\p"
	.string "It’s time for TODAY’S SMART SHOPPER.\p"
	.string "INTERVIEWER: How are you, viewers?\p"
	.string "Today we’re visiting the POKéMON MART\n"
	.string "in {STR_VAR_2}.\p"
	.string "Let’s check on what the hot sellers\n"
	.string "have been recently.$"

UnknownString_81AB435: @ 81AB435
	.string "Let’s interview the clerk to get the\n"
	.string "lowdown.\p"
	.string "Hi, how’s your business?\p"
	.string "CLERK: Oh, we’re doing excellent.\p"
	.string "Recently, {STR_VAR_2} has been selling\n"
	.string "especially strongly.\p"
	.string "Why, just the other day a TRAINER\n"
	.string "named {STR_VAR_1} bought {STR_VAR_3}.$"

UnknownString_81AB507: @ 81AB507
	.string "INTERVIEWER: The TRAINER bought\n"
	.string "{STR_VAR_3} {STR_VAR_2}S? That’s a haul!\p"
	.string "If I may say so, {STR_VAR_1} must have\n"
	.string "been stocking up for a long journey\l"
	.string "to far-off places.\p"
	.string "For traveling, {STR_VAR_2}S are so\n"
	.string "important!$"

UnknownString_81AB5B8: @ 81AB5B8
	.string "INTERVIEWER: Speaking of the item\n"
	.string "{STR_VAR_2}, I just bought {STR_VAR_3} of\l"
	.string "them recently.\p"
	.string "After all, {STR_VAR_2}’s a great item!$"

UnknownString_81AB61F: @ 81AB61F
	.string "INTERVIEWER: {STR_VAR_2}?!\n"
	.string "But {STR_VAR_3} of them?!\p"
	.string "I didn’t think there would be anyone\n"
	.string "buying that many.\p"
	.string "My goodness, I can only afford one or\n"
	.string "two at a time...$"

UnknownString_81AB6B0: @ 81AB6B0
	.string "INTERVIEWER: One time, I bought\n"
	.string "a whole lot of the item {STR_VAR_2}.\p"
	.string "But it turned out to be too many.\n"
	.string "I ended up regretting it...\p"
	.string "Since then, I only buy strictly what\n"
	.string "I absolutely need...\p"
	.string "Oops!\p"
	.string "There’s no point talking about me!$"

UnknownString_81AB78D: @ 81AB78D
	.string "CLERK: {STR_VAR_1} also bought the item\n"
	.string "{STR_VAR_2} in bulk, taking {STR_VAR_3}.\p"
	.string "INTERVIEWER: Oh, that’s smart.\n"
	.string "{STR_VAR_2}’s a very good item, too.$"

UnknownString_81AB7FE: @ 81AB7FE
	.string "CLERK: And, the TRAINER also bought\n"
	.string "{STR_VAR_3} of the item {STR_VAR_2}.$"

UnknownString_81AB835: @ 81AB835
	.string "CLERK: Plus, it was during a big sale.\n"
	.string "That’s smart shopping.$"

UnknownString_81AB873: @ 81AB873
	.string "INTERVIEWER: Hmm... {STR_VAR_1} sounds like\n"
	.string "quite the shrewd bargain hunter!\p"
	.string "In total, {STR_VAR_1}’s purchases came to...\p"
	.string "¥{STR_VAR_2}?!\n"
	.string "What an amazing sum!\p"
	.string "Oops! We’re out of time!\n"
	.string "See you on our next broadcast!$"

UnknownString_81AB92E: @ 81AB92E
	.string "CLERK: {STR_VAR_1} is a VIP customer,\n"
	.string "no doubt about it.$"

UnknownString_81AB95E: @ 81AB95E
	.string "Let’s interview the clerk to get the\n"
	.string "lowdown.\p"
	.string "Hi, how’s your business?\p"
	.string "CLERK: Oh, we’re doing unbelievable\n"
	.string "business. It’s almost overwhelming.\p"
	.string "Recently, a TRAINER named {STR_VAR_1}\n"
	.string "bought the item {STR_VAR_2}in bulk.\p"
	.string "The TRAINER almost cleared out our\n"
	.string "entire stock of {STR_VAR_2}S.\p"
	.string "I never dreamt that any customer\n"
	.string "would ever need so many {STR_VAR_2}S.\l"
	.string "It’s just unheard of!\p"
	.string "INTERVIEWER: So that would be like 100\n"
	.string "or 200 sold?\p"
	.string "CLERK: Oh, no, much more than that!\p"
	.string "INTERVIEWER: Oh, my goodness!\n"
	.string "{STR_VAR_1} must be a special shopper!\p"
	.string "CLERK: {STR_VAR_1} is a VIP customer,\n"
	.string "no doubt about it.$"

UnknownString_81ABB75: @ 81ABB75
	.string "INTERVIEWER: Hmm...\n"
	.string "That is amazing.\p"
	.string "But why would the TRAINER need to buy\n"
	.string "so many?\p"
	.string "... ...\p"
	.string "The mystery deepens, but this is all\n"
	.string "the time we have today.\l"
	.string "See you on our next broadcast!\p"
	.string "Still, {STR_VAR_1} is certainly an enigma...$"

UnknownString_81ABC51: @ 81ABC51
	.string "THE WORLD OF MASTERS\p"
	.string "Hello, viewers.\p"
	.string "Perhaps you are aware of a TRAINER\n"
	.string "named {STR_VAR_1}.\p"
	.string "{STR_VAR_1} is famous as a master at\n"
	.string "catching POKéMON.\p"
	.string "{STR_VAR_1}’s quest for POKéMON depends\n"
	.string "entirely on a careful search on foot.\p"
	.string "On one memorable day, the TRAINER\n"
	.string "walked some {STR_VAR_2} steps.\p"
	.string "The total number of POKéMON caught\n"
	.string "that day reached an impressive {STR_VAR_3}!$"

UnknownString_81ABD94: @ 81ABD94
	.string "That remarkable feat must have been\n"
	.string "possible because of the trust between\l"
	.string "the TRAINER and {STR_VAR_1}.$"

UnknownString_81ABDF2: @ 81ABDF2
	.string "The master caught the day’s last\n"
	.string "{STR_VAR_3} near {STR_VAR_2}.\p"
	.string "That POKéMON apparently enjoys\n"
	.string "a special status as a record holder.\p"
	.string "Skilled TRAINERS should be encouraged\n"
	.string "to challenge this fine record.\p"
	.string "That’s all for today.\n"
	.string "Please tune in next time.$"

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

UnknownString_81AC90D: @ 81AC90D
	.string "IN SEARCH OF TRAINERS...\p"
	.string "GABBY: Hi! Today I’m visiting an area\n"
	.string "near {STR_VAR_1}.\p"
	.string "We’re trying to spot some up-and-coming\n"
	.string "new talent in the field.\p"
	.string "Today, we turned our lens on the\n"
	.string "TRAINER {PLAYER}.\p"
	.string "There’s something about this TRAINER\n"
	.string "that piqued our interest.$"

UnknownString_81ACA02: @ 81ACA02
	.string "We’ve battled {PLAYER} before, but we\n"
	.string "can attest that the TRAINER has most\l"
	.string "definitely improved from before.\p"
	.string "I knew we were onto someone special\n"
	.string "when we spotted this TRAINER!$"

UnknownString_81ACAAA: @ 81ACAAA
	.string "The best way to determine how strong\n"
	.string "a TRAINER is...\p"
	.string "Well, the fastest way is to battle.\n"
	.string "And so we began our investigation!\p"
	.string "... ...\p"
	.string "That’s how we ended up in battle\n"
	.string "with {PLAYER}.\p"
	.string "In a dominating performance, we were\n"
	.string "flattened, rolled up, and tossed aside!\p"
	.string "{PLAYER} is ruthlessly strong...\p"
	.string "We asked the TRAINER for a succinct\n"
	.string "summation of the battle we shared.$"

UnknownString_81ACC07: @ 81ACC07
	.string "The combination of {STR_VAR_1} and\n"
	.string "{STR_VAR_3} was divine!\p"
	.string "The sight of them - {STR_VAR_1} and\n"
	.string "{STR_VAR_3} - selflessly supporting\l"
	.string "each other in the thick of battle...\p"
	.string "It was a marvelous sight to behold!\p"
	.string "{STR_VAR_2} was the move the TRAINER\n"
	.string "used last in our battle.\p"
	.string "The move {STR_VAR_2} is {STR_VAR_1}\n"
	.string "and {STR_VAR_3}’s sign of friendship!$"

UnknownString_81ACD13: @ 81ACD13
	.string "...I lost confidence in myself as\n"
	.string "a result of our encounter.\p"
	.string "We were beaten before we could launch\n"
	.string "a single attack.\l"
	.string "Ohhh... Snivel...\p"
	.string "In spite of that, {PLAYER}’s battles\n"
	.string "are worth seeing.\p"
	.string "I recommend confident TRAINERS to\n"
	.string "challenge {PLAYER}.$"

UnknownString_81ACDFA: @ 81ACDFA
	.string "There’s only one thing to be said.\n"
	.string "Don’t you dare throw a POKé BALL during\l"
	.string "a TRAINER battle!\p"
	.string "{PLAYER} is certainly strong, but has\n"
	.string "no clue about the basic rules.\p"
	.string "To our TV audience, I have a request.\p"
	.string "If you see {PLAYER}, please caution\n"
	.string "the TRAINER!$"

UnknownString_81ACEE7: @ 81ACEE7
	.string "{PLAYER} is adept at reading the\n"
	.string "opponent’s actions.\p"
	.string "The timing of item usage was remarkably\n"
	.string "effective!$"

UnknownString_81ACF49: @ 81ACF49
	.string "Honestly speaking, I thought that\n"
	.string "I might even be pretty good.\p"
	.string "While we did end up losing, we did have\n"
	.string "a hotly contested battle.\p"
	.string "But if you’re struggling against me,\n"
	.string "you have a ways to go, {PLAYER}!$"

UnknownString_81AD00A: @ 81AD00A
	.string "After our battle, we asked {PLAYER} for\n"
	.string "a succinct summary.\p"
	.string "The TRAINER replied, “{STR_VAR_1}.”\p"
	.string "{PLAYER}’s POKéMON {STR_VAR_2} and\n"
	.string "{STR_VAR_3}...\l"
	.string "And “{STR_VAR_1}”...\p"
	.string "Mmm! That’s deep! There’s deep\n"
	.string "significance behind that quote!\p"
	.string "It’s no surprise - a good TRAINER has\n"
	.string "good things to say.\p"
	.string "That’s all for today!\n"
	.string "See you again on our next broadcast!$"

UnknownString_81AD135: @ 81AD135
	.string "Greetings!\n"
	.string "It’s time for POKéMON NEWS.\p"
	.string "SLATEPORT’s most popular kind of guy,\n"
	.string "the ENERGY GURU, is in the news again!\p"
	.string "He promises to, “Stupendously go for\n"
	.string "it in just this many days: {STR_VAR_1}!”\p"
	.string "While he refused to elaborate on what\n"
	.string "he will stupendously go for, the\l"
	.string "ENERGY GURU advised, “Save up your\l"
	.string "money. That’ll be good...”\p"
	.string "It sounds like a trip to SLATEPORT\n"
	.string "would be well worth your while that day.\p"
	.string "That’s the news on POKéMON NEWS.$"

UnknownString_81AD2E0: @ 81AD2E0
	.string "Greetings!\n"
	.string "It’s time for POKéMON NEWS.\p"
	.string "This is the news you’ve all been\n"
	.string "waiting for!\p"
	.string "SLATEPORT’S ENERGY GURU is going\n"
	.string "for it stupendously in the MARKET!\p"
	.string "He promises unbeatable bargain\n"
	.string "prices on CALCIUM and PROTEIN!\p"
	.string "A trip to SLATEPORT CITY sounds\n"
	.string "worthwhile. Why not visit and shop\l"
	.string "to your heart’s content?\p"
	.string "That’s the news on POKéMON NEWS.$"

UnknownString_81AD434: @ 81AD434
	.string "Greetings!\n"
	.string "It’s time for POKéMON NEWS.\p"
	.string "This is the news you’ve all been\n"
	.string "waiting for!\p"
	.string "SLATEPORT’S ENERGY GURU is going\n"
	.string "for it stupendously in the MARKET!\p"
	.string "He promises unbeatable bargain\n"
	.string "prices on CALCIUM and PROTEIN!\p"
	.string "According to the ENERGY GURU, he\n"
	.string "still has ample merchandise left.\p"
	.string "Why not visit SLATEPORT CITY for\n"
	.string "a most enjoyable shopping trip?\p"
	.string "That’s the news on POKéMON NEWS.$"

UnknownString_81AD5B0: @ 81AD5B0
	.string "Greetings!\n"
	.string "It’s time for POKéMON NEWS.\p"
	.string "It’s approaching!\n"
	.string "It’s finally coming!\p"
	.string "The GAME CORNER’s service day will be\n"
	.string "here in just this many days: {STR_VAR_1}!\p"
	.string "Even those who are usually unlucky\n"
	.string "may be lucky on this particular day!\p"
	.string "That’s the news on POKéMON NEWS.$"

UnknownString_81AD6AE: @ 81AD6AE
	.string "Greetings!\n"
	.string "It’s time for POKéMON NEWS.\p"
	.string "It’s here!\n"
	.string "It’s finally arrived!\p"
	.string "GAME CORNER’s service day has finally\n"
	.string "arrived!\p"
	.string "Could you be lucky at the SLOTS \n"
	.string "and ROULETTE?\p"
	.string "The location is MAUVILLE CITY.\n"
	.string "This is the place!\p"
	.string "That’s the news on POKéMON NEWS.$"

UnknownString_81AD7A7: @ 81AD7A7
	.string "Greetings!\n"
	.string "It’s time for POKéMON NEWS.\p"
	.string "It’s here!\n"
	.string "It’s finally arrived!\p"
	.string "GAME CORNER’s service day has finally\n"
	.string "arrived!\p"
	.string "Could you be lucky at the SLOTS\n"
	.string "and ROULETTE?\p"
	.string "Time is limited and has almost run out.\n"
	.string "The location is MAUVILLE CITY.\p"
	.string "That’s the news on POKéMON NEWS.$"

UnknownString_81AD8B4: @ 81AD8B4
	.string "Greetings!\n"
	.string "It’s time for POKéMON NEWS.\p"
	.string "We’ve just received wonderful news\n"
	.string "from LILYCOVE DEPARTMENT STORE.\p"
	.string "The DEPARTMENT STORE’s clear-out sale\n"
	.string "will be in just this many days: {STR_VAR_1}!\p"
	.string "That thingamajig or that doodad that\n"
	.string "you’ve always wanted could be yours!\p"
	.string "That’s the news on POKéMON NEWS.$"

UnknownString_81AD9D3: @ 81AD9D3
	.string "Greetings!\n"
	.string "It’s time for POKéMON NEWS.\p"
	.string "This is the news you’ve all been\n"
	.string "waiting for!\p"
	.string "LILYCOVE DEPARTMENT STORE’s clear-out\n"
	.string "sale has finally arrived!\p"
	.string "All the thingamajigs and doodads that\n"
	.string "you’ve always dreamt about...\p"
	.string "You may be in for fateful encounters\n"
	.string "with them all!\p"
	.string "That’s the news on POKéMON NEWS.$"

UnknownString_81ADB01: @ 81ADB01
	.string "Greetings!\n"
	.string "It’s time for POKéMON NEWS.\p"
	.string "This is the news you’ve all been\n"
	.string "waiting for!\p"
	.string "LILYCOVE DEPARTMENT STORE’s clear-out\n"
	.string "sale has finally arrived!\p"
	.string "All the thingamajigs and doodads that\n"
	.string "you’ve always dreamt about...\p"
	.string "You may be in for fateful encounters\n"
	.string "with them all!\p"
	.string "That’s the news on POKéMON NEWS.$"

UnknownString_81ADC2F: @ 81ADC2F
	.string "This program has been brought to you\n"
	.string "by the DEVON CORPORATION.$"

UnknownString_81ADC6E: @ 81ADC6E
	.string "What’s important is love for POKéMON.\p"
	.string "What you need is a little courage.\p"
	.string "Let your cherished POKéMON take\n"
	.string "center stage! POKéMON CONTESTS!$"

UnknownString_81ADCF7: @ 81ADCF7
	.string "We raise your beloved POKéMON with\n"
	.string "all of our love!\p"
	.string "For all your POKéMON-training needs,\n"
	.string "visit our DAY CARE on ROUTE 117.$"

UnknownString_81ADD71: @ 81ADD71
	.string "The cauldron of good times and laughs!\n"
	.string "LAVARIDGE SPA.$"

UnknownString_81ADDA7: @ 81ADDA7
	.string "Overflowing with great merchandise\n"
	.string "and excitement!\p"
	.string "A great place to find that something\n"
	.string "you need!\p"
	.string "Visit LILYCOVE DEPARTMENT STORE for\n"
	.string "all your shopping needs!$"

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

UnknownString_81AEFFC: @ 81AEFFC
	.string "The Save-Happy TRAINER$"

UnknownString_81AF013: @ 81AF013
	.string "Saved the game$"

UnknownString_81AF022: @ 81AF022
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER saved the game\n"
	.string "{STR_VAR_1} times!\p"
	.string "A more cautious TRAINER than\n"
	.string "{STR_VAR_3} one will never find!$"

UnknownString_81AF0A3: @ 81AF0A3
	.string "The Trendsetter TRAINER$"

UnknownString_81AF0BB: @ 81AF0BB
	.string "Started trends$"

UnknownString_81AF0CA: @ 81AF0CA
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER started new trends\n"
	.string "{STR_VAR_1} times!\p"
	.string "{STR_VAR_3} is setting trends for all\n"
	.string "the HOENN region!$"

UnknownString_81AF149: @ 81AF149
	.string "The BERRY-Planting TRAINER$"

UnknownString_81AF164: @ 81AF164
	.string "Planted BERRIES$"

UnknownString_81AF174: @ 81AF174
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER planted BERRIES\n"
	.string "{STR_VAR_1} times!\p"
	.string "{STR_VAR_3} is a legendary lover of\n"
	.string "BERRIES!$"

UnknownString_81AF1E5: @ 81AF1E5
	.string "The BIKE-Loving TRAINER$"

UnknownString_81AF1FD: @ 81AF1FD
	.string "Traded BIKES$"

UnknownString_81AF20A: @ 81AF20A
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER swapped BIKES\n"
	.string "{STR_VAR_1} times!\p"
	.string "{STR_VAR_3} must love BIKES deeply\n"
	.string "and passionately!$"

UnknownString_81AF281: @ 81AF281
	.string "The Interviewed TRAINER$"

UnknownString_81AF299: @ 81AF299
	.string "Got interviewed$"

UnknownString_81AF2A9: @ 81AF2A9
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER got interviewed\n"
	.string "{STR_VAR_1} times!\p"
	.string "{STR_VAR_3} must be a TRAINER who’s\n"
	.string "attracting much attention!$"

UnknownString_81AF32C: @ 81AF32C
	.string "The Battle-Happy TRAINER$"

UnknownString_81AF345: @ 81AF345
	.string "Battled$"

UnknownString_81AF34D: @ 81AF34D
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER battled {STR_VAR_1} times!\p"
	.string "{STR_VAR_3} must be a TRAINER who can\n"
	.string "never refuse a chance to battle!$"

UnknownString_81AF3D0: @ 81AF3D0
	.string "The POKéMON-Catching TRAINER$"

UnknownString_81AF3ED: @ 81AF3ED
	.string "Caught POKéMON$"

UnknownString_81AF3FC: @ 81AF3FC
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER caught\n"
	.string "{STR_VAR_1} POKéMON!\p"
	.string "{STR_VAR_3} is a legendary catcher of\n"
	.string "wild POKéMON!$"

UnknownString_81AF46D: @ 81AF46D
	.string "The Fishing TRAINER$"

UnknownString_81AF481: @ 81AF481
	.string "Caught POKéMON with a ROD$"

UnknownString_81AF49B: @ 81AF49B
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER caught\n"
	.string "{STR_VAR_1} POKéMON while fishing!\p"
	.string "{STR_VAR_3} is a legendary fishing\n"
	.string "expert!$"

UnknownString_81AF511: @ 81AF511
	.string "The EGG-Warming TRAINER$"

UnknownString_81AF529: @ 81AF529
	.string "Hatched EGGS$"

UnknownString_81AF536: @ 81AF536
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER hatched {STR_VAR_1} POKéMON\n"
	.string "from EGGS!\p"
	.string "{STR_VAR_3} is a legendary warmer\n"
	.string "of EGGS!$"

UnknownString_81AF5A9: @ 81AF5A9
	.string "The Evolver TRAINER$"

UnknownString_81AF5BD: @ 81AF5BD
	.string "Evolved POKéMON$"

UnknownString_81AF5CD: @ 81AF5CD
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER made {STR_VAR_1} POKéMON\n"
	.string "evolve!\p"
	.string "{STR_VAR_3} is the ultimate evolver\n"
	.string "of POKéMON!$"

UnknownString_81AF63F: @ 81AF63F
	.string "The POKéMON CENTER-Loving TRAINER$"

UnknownString_81AF661: @ 81AF661
	.string "Used POKéMON CENTERS$"

UnknownString_81AF676: @ 81AF676
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER healed POKéMON\n"
	.string "{STR_VAR_1} times at POKéMON CENTERS!\p"
	.string "There could be no greater lover of\n"
	.string "POKéMON CENTERS than {STR_VAR_3}!$"

UnknownString_81AF711: @ 81AF711
	.string "The Homebody TRAINER$"

UnknownString_81AF726: @ 81AF726
	.string "Rested POKéMON at home$"

UnknownString_81AF73D: @ 81AF73D
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER healed POKéMON\n"
	.string "{STR_VAR_1} times at home!\p"
	.string "There could be no more of a homebody\n"
	.string "than {STR_VAR_3}!$"

UnknownString_81AF7BF: @ 81AF7BF
	.string "The SAFARI-Loving TRAINER$"

UnknownString_81AF7D9: @ 81AF7D9
	.string "Entered the SAFARI ZONE$"

UnknownString_81AF7F1: @ 81AF7F1
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER went into the SAFARI ZONE\n"
	.string "{STR_VAR_1} times!\p"
	.string "{STR_VAR_3} is a TRAINER whose wild side\n"
	.string "must come out in the SAFARI ZONE!$"

UnknownString_81AF88A: @ 81AF88A
	.string "The CUT-Frenzy TRAINER$"

UnknownString_81AF8A1: @ 81AF8A1
	.string "Used CUT$"

UnknownString_81AF8AA: @ 81AF8AA
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER used CUT\n"
	.string "{STR_VAR_1} times!\p"
	.string "{STR_VAR_3} is a TRAINER who just must\n"
	.string "love to CUT!$"

UnknownString_81AF91B: @ 81AF91B
	.string "The ROCK-SMASHING TRAINER$"

UnknownString_81AF935: @ 81AF935
	.string "Smashed rocks$"

UnknownString_81AF943: @ 81AF943
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER used ROCK SMASH\n"
	.string "{STR_VAR_1} times!\p"
	.string "{STR_VAR_3} must be a TRAINER who\n"
	.string "can’t leave a stone unsmashed!$"

UnknownString_81AF9C8: @ 81AF9C8
	.string "The Move-Loving TRAINER$"

UnknownString_81AF9E0: @ 81AF9E0
	.string "Moved the SECRET BASE$"

UnknownString_81AF9F6: @ 81AF9F6
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER moved the SECRET BASE\n"
	.string "{STR_VAR_1} times!\p"
	.string "{STR_VAR_3} is a TRAINER who loves\n"
	.string "to move houses often!$"

UnknownString_81AFA79: @ 81AFA79
	.string "The SPLASH-Happy TRAINER$"

UnknownString_81AFA92: @ 81AFA92
	.string "Used SPLASH$"

UnknownString_81AFA9E: @ 81AFA9E
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER used SPLASH\n"
	.string "{STR_VAR_1} times!\p"
	.string "{STR_VAR_3} is a TRAINER who must love\n"
	.string "SPLASHING around!$"

UnknownString_81AFB17: @ 81AFB17
	.string "The Tenacious TRAINER$"

UnknownString_81AFB2D: @ 81AFB2D
	.string "Resorted to using STRUGGLE$"

UnknownString_81AFB48: @ 81AFB48
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER had to rely on STRUGGLE\n"
	.string "{STR_VAR_1} times!\p"
	.string "{STR_VAR_3} is a tenacious TRAINER\n"
	.string "who never gives in to adversity!$"

UnknownString_81AFBD8: @ 81AFBD8
	.string "The SLOT Champ$"

UnknownString_81AFBE7: @ 81AFBE7
	.string "Won the jackpot on the SLOTS$"

UnknownString_81AFC04: @ 81AFC04
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER won the jackpot on\n"
	.string "the SLOTS {STR_VAR_1} times.\p"
	.string "{STR_VAR_3} is a TRAINER who was lucky\n"
	.string "on the SLOTS!$"

UnknownString_81AFC8A: @ 81AFC8A
	.string "The ROULETTE Champ$"

UnknownString_81AFC9D: @ 81AFC9D
	.string "Had consecutive ROULETTE wins of$"

UnknownString_81AFCBE: @ 81AFCBE
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER won in ROULETTE\n"
	.string "{STR_VAR_1} times in a row.\p"
	.string "{STR_VAR_3} was lucky when the ball\n"
	.string "bounced in ROULETTE!$"

UnknownString_81AFD44: @ 81AFD44
	.string "The BATTLE TOWER Challenger$"

UnknownString_81AFD60: @ 81AFD60
	.string "Took the BATTLE TOWER challenge$"

UnknownString_81AFD80: @ 81AFD80
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER took the BATTLE TOWER\n"
	.string "challenge {STR_VAR_1} times!\p"
	.string "{STR_VAR_3} is a TRAINER who aspires\n"
	.string "for excellence in the BATTLE TOWER!$"

UnknownString_81AFE1D: @ 81AFE1D
	.string "The Blend-Loving TRAINER$"

UnknownString_81AFE36: @ 81AFE36
	.string "Made {POKEBLOCK}S$"

UnknownString_81AFE42: @ 81AFE42
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER made {POKEBLOCK}S\n"
	.string "{STR_VAR_1} times!\p"
	.string "There is none better at using a BERRY\n"
	.string "BLENDER than {STR_VAR_3}!$"

UnknownString_81AFEC2: @ 81AFEC2
	.string "The CONTEST-Loving TRAINER$"

UnknownString_81AFEDD: @ 81AFEDD
	.string "Entered CONTESTS$"

UnknownString_81AFEEE: @ 81AFEEE
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER entered CONTESTS\n"
	.string "{STR_VAR_1} times!\p"
	.string "{STR_VAR_3} must love showing off\n"
	.string "POKéMON to others!$"

UnknownString_81AFF68: @ 81AFF68
	.string "The CONTEST Master$"

UnknownString_81AFF7B: @ 81AFF7B
	.string "Won CONTESTS$"

UnknownString_81AFF88: @ 81AFF88
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER won CONTESTS\n"
	.string "{STR_VAR_1} times!\p"
	.string "{STR_VAR_3} must be an incredible\n"
	.string "CONTEST master!$"

UnknownString_81AFFFB: @ 81AFFFB
	.string "The Happy Shopper$"

UnknownString_81B000D: @ 81B000D
	.string "Shopped$"

UnknownString_81B0015: @ 81B0015
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER bought items in shops\n"
	.string "{STR_VAR_1} times!\p"
	.string "{STR_VAR_3} must be one of those\n"
	.string "people who are born to shop.$"

UnknownString_81B009D: @ 81B009D
	.string "The Item-Finding TRAINER$"

UnknownString_81B00B6: @ 81B00B6
	.string "Used an ITEMFINDER$"

UnknownString_81B00C9: @ 81B00C9
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER used an ITEMFINDER\n"
	.string "{STR_VAR_1} times!\p"
	.string "{STR_VAR_3} must enjoy scouring the\n"
	.string "ground for hidden items!$"

UnknownString_81B014D: @ 81B014D
	.string "The Rain-Soaked TRAINER$"

UnknownString_81B0165: @ 81B0165
	.string "Got rained on$"

UnknownString_81B0173: @ 81B0173
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER got soaked by rain\n"
	.string "{STR_VAR_1} times!\p"
	.string "{STR_VAR_3}’s charisma must even\n"
	.string "attract rain!$"

UnknownString_81B01E9: @ 81B01E9
	.string "The Avid POKéDEX Reader$"

UnknownString_81B0201: @ 81B0201
	.string "Checked a POKéDEX$"

UnknownString_81B0213: @ 81B0213
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER checked a POKéDEX\n"
	.string "{STR_VAR_1} times!\p"
	.string "{STR_VAR_3} must love inspecting\n"
	.string "POKéMON in a POKéDEX!$"

UnknownString_81B0290: @ 81B0290
	.string "The RIBBON Collector$"

UnknownString_81B02A5: @ 81B02A5
	.string "Received RIBBONS$"

UnknownString_81B02B6: @ 81B02B6
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER received RIBBONS\n"
	.string "{STR_VAR_1} times!\p"
	.string "{STR_VAR_3} must be a TRAINER who\n"
	.string "loves to collect RIBBONS!$"

UnknownString_81B0337: @ 81B0337
	.string "The Ledge-Jumping TRAINER$"

UnknownString_81B0351: @ 81B0351
	.string "Jumped down ledges$"

UnknownString_81B0364: @ 81B0364
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER jumped down ledges\n"
	.string "{STR_VAR_1} times!\p"
	.string "If there’s a ledge to be jumped,\n"
	.string "{STR_VAR_3} can’t ignore it!$"

UnknownString_81B03E9: @ 81B03E9
	.string "The Legendary TV Viewer$"

UnknownString_81B0401: @ 81B0401
	.string "Watched TV$"

UnknownString_81B040C: @ 81B040C
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER watched TV\n"
	.string "{STR_VAR_1} times!\p"
	.string "{STR_VAR_3} must love watching TV!$"

UnknownString_81B046E: @ 81B046E
	.string "The Time-Conscious TRAINER$"

UnknownString_81B0489: @ 81B0489
	.string "Checked the time$"

UnknownString_81B049A: @ 81B049A
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER checked the time\n"
	.string "{STR_VAR_1} times!\p"
	.string "{STR_VAR_3} must be a punctual TRAINER\n"
	.string "who’s conscious of the time.$"

UnknownString_81B0523: @ 81B0523
	.string "The POKéMON LOTTERY Wizard$"

UnknownString_81B053E: @ 81B053E
	.string "Won POKéMON LOTTERIES$"

UnknownString_81B0554: @ 81B0554
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER won POKéMON LOTTERIES\n"
	.string "{STR_VAR_1} times!\p"
	.string "{STR_VAR_3} must have many friends\n"
	.string "to trade POKéMON with!$"

UnknownString_81B05D8: @ 81B05D8
	.string "The DAY CARE-Using Trainer$"

UnknownString_81B05F3: @ 81B05F3
	.string "Left POKéMON at the DAY CARE$"

UnknownString_81B0610: @ 81B0610
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER left POKéMON with the\n"
	.string "DAY CARE {STR_VAR_1} times!\p"
	.string "{STR_VAR_3} must be a real go-getter\n"
	.string "who raises POKéMON aggressively!$"

UnknownString_81B06A9: @ 81B06A9
	.string "The CABLE CAR-Loving TRAINER$"

UnknownString_81B06C6: @ 81B06C6
	.string "Rode the CABLE CAR$"

UnknownString_81B06D9: @ 81B06D9
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER rode the CABLE CAR\n"
	.string "{STR_VAR_1} times!\p"
	.string "{STR_VAR_3} must be a busy TRAINER\n"
	.string "who’s up and down all the time!$"

UnknownString_81B0763: @ 81B0763
	.string "The Hot Spring-Loving TRAINER$"

UnknownString_81B0781: @ 81B0781
	.string "Bathed in hot springs$"

UnknownString_81B0797: @ 81B0797
	.string "This is a tale of a TRAINER\n"
	.string "named {STR_VAR_3}.\p"
	.string "This TRAINER bathed in hot springs\n"
	.string "{STR_VAR_1} times!\p"
	.string "{STR_VAR_3} must be a TRAINER with\n"
	.string "baby-smooth skin!$"

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

UnknownString_81B0A83: @ 81B0A83
	.string "BARD testing!$"

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

	.include "data/field_move_scripts.s"
	.include "data/item_ball_scripts.s"

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

UnknownString_81B1F7A: @ 81B1F7A
	.string "$"

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

UnknownString_81B2858: @ 81B2858
	.string "If you want to pick up your POKéMON,\n"
	.string "have a word with my wife.$"

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

UnknownString_81B2DEE: @ 81B2DEE
	.string "The power contained in the\n"
	.string "METEORITE...\p"
	.string "By amplifying its power with this\n"
	.string "machine, MT. CHIMNEY’s volcanic activity\l"
	.string "will stop.\p"
	.string "Fufufu... Eventually, the cooled-down\n"
	.string "crater will fill with rainwater, giving\l"
	.string "WATER POKéMON a place to live.$"

UnknownString_81B2ED9: @ 81B2ED9
	.string "ARCHIE: You again...\p"
	.string "Now listen.\n"
	.string "All life depends on the sea.\p"
	.string "The sea is everything!\n"
	.string "Its importance is paramount!\p"
	.string "That is why we of TEAM AQUA are\n"
	.string "committed to expanding the sea.\p"
	.string "Doing so will result in the emergence\n"
	.string "of new POKéMON species.\p"
	.string "We will return the world back to\n"
	.string "nature for the good of POKéMON.\p"
	.string "That is TEAM AQUA’s vision!\p"
	.string "I can’t allow an ignorant child like\n"
	.string "you to get in our way.\p"
	.string "I, ARCHIE, will show you the\n"
	.string "consequences of meddling!$"

UnknownString_81B3099: @ 81B3099
	.string "What?!\p"
	.string "I, ARCHIE, was caught off guard?!$"

UnknownString_81B30C2: @ 81B30C2
	.string "ARCHIE: Ah, whatever.\n"
	.string "I will give up our plans for MT.\l"
	.string "CHIMNEY for the time being...\p"
	.string "But no one can ever stop us!\n"
	.string "TEAM AQUA will prevail!\p"
	.string "Don’t you ever forget that!$"

UnknownString_81B3168: @ 81B3168
	.string "Hehehe!\p"
	.string "So you’ve come all the way here!\p"
	.string "But you’re too late!\n"
	.string "I’ve already delivered the METEORITE\l"
	.string "from METEOR FALLS to the BOSS!$"

UnknownString_81B31EA: @ 81B31EA
	.string "Hehehe...\n"
	.string "So I lost...\p"
	.string "I’m sure glad I never took you on back\n"
	.string "at METEOR FALLS.$"

UnknownString_81B3239: @ 81B3239
	.string "Hehehe!\p"
	.string "You might have beaten me, but you don’t\n"
	.string "stand a chance against the BOSS!\p"
	.string "If you get lost now, you won’t have to\n"
	.string "face a sound whipping!$"

UnknownString_81B32C8: @ 81B32C8
	.string "We of TEAM AQUA are working hard for\n"
	.string "everyone’s sake.\p"
	.string "Like, if there’s more water around,\n"
	.string "WATER POKéMON will be happy, and it’ll\l"
	.string "give people more fun places to swim!$"

UnknownString_81B336E: @ 81B336E
	.string "Hunh?\n"
	.string "What do you mean I lost?$"

UnknownString_81B338D: @ 81B338D
	.string "Our BOSS says, “It will make everyone\n"
	.string "happy.”\p"
	.string "But why does everyone keep getting\n"
	.string "in our way?$"

UnknownString_81B33EA: @ 81B33EA
	.string "That annoying TEAM MAGMA...\n"
	.string "They always mess with our plans!$"

UnknownString_81B3427: @ 81B3427
	.string "METEORITES pack amazing power!$"

UnknownString_81B3446: @ 81B3446
	.string "Go! Stomp TEAM MAGMA!\n"
	.string "And expand the sea!$"

UnknownString_81B3470: @ 81B3470
	.string "Stay out of our way, okay?\p"
	.string "We’re trying to enlarge the sea for\n"
	.string "the good of everybody!$"

UnknownString_81B34C6: @ 81B34C6
	.string "Yeah!\n"
	.string "Hose them down!$"

UnknownString_81B34DC: @ 81B34DC
	.string "We’re going to keep expanding the sea!$"

UnknownString_81B3503: @ 81B3503
	.string "Bushaa!$"

UnknownString_81B350B: @ 81B350B
	.string "MAXIE: Oh, {PLAYER}{KUN}!\p"
	.string "Please, you must stop TEAM AQUA\n"
	.string "for me!\p"
	.string "They’re trying to make this volcano\n"
	.string "inactive by using the stolen\l"
	.string "METEORITE’s power!$"

UnknownString_81B3598: @ 81B3598
	.string "MAXIE: {PLAYER}{KUN}!\p"
	.string "Please, you’ve got to stop TEAM AQUA\n"
	.string "for me!\p"
	.string "Dealing with these three thugs is\n"
	.string "a lot, even for me!$"

UnknownString_81B3608: @ 81B3608
	.string "MAXIE: {PLAYER}{KUN}! Thank you!\p"
	.string "With your help, we thwarted TEAM\n"
	.string "AQUA’s destructive plan!\p"
	.string "But... This victory doesn’t mean the\n"
	.string "end of their evil plans.\p"
	.string "We will remain vigilant and keep up\n"
	.string "our pursuit of TEAM AQUA.\p"
	.string "{PLAYER}{KUN}, we shall meet again!$"

UnknownString_81B36F1: @ 81B36F1
	.string "Darn... TEAM AQUA outnumbers us!\n"
	.string "We can’t keep up with them!$"

UnknownString_81B372E: @ 81B372E
	.string "If they expand the sea, there’ll be less\n"
	.string "habitats for POKéMON and people!$"

UnknownString_81B3778: @ 81B3778
	.string "TEAM AQUA wants to expand the sea...\n"
	.string "How’s that for insane?$"

UnknownString_81B37B4: @ 81B37B4
	.string "Bufoh!$"

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

UnknownString_81B3DD6: @ 81B3DD6
	.string "METEORITES pack amazing power!$"

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

UnknownString_81B3E94: @ 81B3E94
	.string "We’re going to keep making more land!$"

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

UnknownString_81B41B8: @ 81B41B8
	.string "ARCHIE: Hold it right there.$"

UnknownString_81B41D5: @ 81B41D5
	.string "ARCHIE: Fufufu...\n"
	.string "So it was you, after all.$"

UnknownString_81B4201: @ 81B4201
	.string "ARCHIE: Behold!\p"
	.string "See how beautiful it is, the sleeping\n"
	.string "form of the ancient POKéMON KYOGRE!\p"
	.string "I have waited so long for this day to\n"
	.string "come...$"

UnknownString_81B4289: @ 81B4289
	.string "ARCHIE: It surprises me, how you’ve\n"
	.string "managed to chase me here.\p"
	.string "But that’s all over now.\p"
	.string "For the realization of my dream,\n"
	.string "you must disappear now!$"

UnknownString_81B4319: @ 81B4319
	.string "I...\n"
	.string "I lost again?$"

UnknownString_81B432C: @ 81B432C
	.string "ARCHIE: Fufufu...\p"
	.string "I commend you. I must recognize that\n"
	.string "you are truly gifted.\p"
	.string "But!\n"
	.string "I have this in my possession!\p"
	.string "With this RED ORB, I can make KYOGRE...$"

UnknownString_81B43C4: @ 81B43C4
	.string "The RED ORB suddenly began shining\n"
	.string "by itself!$"

UnknownString_81B43F2: @ 81B43F2
	.string "ARCHIE: What?!\p"
	.string "I didn’t do anything.\n"
	.string "Why did the RED ORB...\p"
	.string "Where did KYOGRE go?$"

UnknownString_81B4443: @ 81B4443
	.string "ARCHIE: Hm? It’s a message from our\n"
	.string "members outside...$"

UnknownString_81B447A: @ 81B447A
	.string "ARCHIE: Yes, what is it?\p"
	.string "Hm...\n"
	.string "It’s raining heavily?\p"
	.string "Good... That should have happened.\n"
	.string "That is why we awakened KYOGRE,\l"
	.string "to realize TEAM AQUA’s vision of\l"
	.string "expanding the sea.\p"
	.string "What?!\p"
	.string "It’s raining far harder than we\n"
	.string "envisioned? You’re in danger?\p"
	.string "That can’t be...\n"
	.string "That’s just not possible...\p"
	.string "Hold your position and monitor the\n"
	.string "situation!$"

UnknownString_81B45C6: @ 81B45C6
	.string "ARCHIE: There’s something wrong...\p"
	.string "The RED ORB is supposed to awaken\n"
	.string "and control KYOGRE...\p"
	.string "But... Why?\n"
	.string "Why did KYOGRE disappear?\p"
	.string "Why?!$"

UnknownString_81B464D: @ 81B464D
	.string "MAXIE: What have you wrought?\p"
	.string "ARCHIE... You’ve finally awoken KYOGRE,\n"
	.string "haven’t you?\p"
	.string "What will happen to the world if this\n"
	.string "downpour continues for all eternity?\p"
	.string "The world’s landmass will drown in\n"
	.string "the deepening sea...$"

UnknownString_81B4723: @ 81B4723
	.string "ARCHIE: What are you saying?\p"
	.string "The RED ORB should let me control\n"
	.string "KYOGRE...\l"
	.string "That can’t be possible...$"

UnknownString_81B4786: @ 81B4786
	.string "MAXIE: We don’t have the time to\n"
	.string "argue about it here!\p"
	.string "Get outside and see for yourself!\p"
	.string "See if what you’ve wrought is the\n"
	.string "world that you desired!$"

UnknownString_81B4818: @ 81B4818
	.string "MAXIE: {PLAYER}{KUN}, come on, you have\n"
	.string "to get out of here, too!$"

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

UnknownString_81B7372: @ 81B7372
	.string "Nobody came...$"

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

	.include "data/text/trainers.s"

	.global gUnknown_081C33E6
gUnknown_081C33E6: @ 81C33E6
	.incbin "baserom.gba", 0x1C33E6, 0x9

UnknownString_81C33EF: @ 81C33EF
	.string "REPEL’s effect wore off...$"

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

	.incbin "baserom.gba", 0x1C346A, 0x48

UnknownString_81C34B2: @ 81C34B2
	.string "Would you like to exit the SAFARI ZONE\n"
	.string "right now?$"

UnknownString_81C34E4: @ 81C34E4
	.string "Ding-dong! Time’s up!\n"
	.string "Your SAFARI Game is over.$"

UnknownString_81C3514: @ 81C3514
	.string "You’ve run out of SAFARI BALLS.\n"
	.string "Your SAFARI Game is over.$"

UnknownString_81C354E: @ 81C354E
	.string "Would you like to place a {POKEBLOCK}\n"
	.string "on the {POKEBLOCK} FEEDER?$"

UnknownString_81C3583: @ 81C3583
	.string "The {STR_VAR_1} you left\n"
	.string "before is still here.$"

UnknownString_81C35A9: @ 81C35A9
	.string "The {STR_VAR_1} was placed\n"
	.string "on the {POKEBLOCK} FEEDER.$"

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
UnknownString_81C40DF: @ 81C40DF
	.string "The minimum wager at this table is {STR_VAR_1}. \n"
	.string "Do you want to play?$"

	.global gUnknown_081C411C
gUnknown_081C411C: @ 81C411C
UnknownString_81C411C: @ 81C411C
	.string "You don’t have enough COINS.$"

	.global gUnknown_081C4139
gUnknown_081C4139: @ 81C4139
UnknownString_81C4139: @ 81C4139
	.string "Special rate table right now!$"

	.global gUnknown_081C4157
gUnknown_081C4157: @ 81C4157
	.incbin "baserom.gba", 0x001c4157, 0x42

	.global gUnknown_081C4199
gUnknown_081C4199: @ 81C4199
UnknownString_81C4199: @ 81C4199
	.string "It’s a hit!$"

	.global gUnknown_081C41A5
gUnknown_081C41A5: @ 81C41A5
UnknownString_81C41A5: @ 81C41A5
	.string "Jackpot!$"

	.global gUnknown_081C41AE
gUnknown_081C41AE: @ 81C41AE
UnknownString_81C41AE: @ 81C41AE
	.string "Nothing doing!$"

	.global gUnknown_081C41BD
gUnknown_081C41BD: @ 81C41BD
UnknownString_81C41BD: @ 81C41BD
	.string "You’ve won {STR_VAR_1} COINS!$"

	.global gUnknown_081C41D2
gUnknown_081C41D2: @ 81C41D2
UnknownString_81C41D2: @ 81C41D2
	.string "No COINS left...$"

	.global gUnknown_081C41E3
gUnknown_081C41E3: @ 81C41E3
UnknownString_81C41E3: @ 81C41E3
	.string "Keep playing?$"

	.global gUnknown_081C41F1
gUnknown_081C41F1: @ 81C41F1
UnknownString_81C41F1: @ 81C41F1
	.string "The ROULETTE board will be cleared.$"

UnknownString_81C4215: @ 81C4215
	.string "You don’t have a COIN CASE.$"

	.global gUnknown_081C4231
gUnknown_081C4231: @ 81C4231

UnknownString_81C4231: @ 81C4231
	.string "Your COIN CASE is full!\n"
	.string "Coins can be exchanged for prizes.$"

UnknownString_81C426C: @ 81C426C
	.string "I’m very interested in big {STR_VAR_1}.\n"
	.string "The bigger the better.\p"
	.string "Huh? Do you have a {STR_VAR_1}?\n"
	.string "P-p-please, show me!$"

UnknownString_81C42CE: @ 81C42CE
	.string "Oh, my gosh, this is a big one!\n"
	.string "This is a grand {STR_VAR_1}!\p"
	.string "Thanks for showing me.\n"
	.string "This is my thanks!$"

UnknownString_81C432C: @ 81C432C
	.string "{PLAYER} received one {STR_VAR_2}.$"

UnknownString_81C4340: @ 81C4340
	.string "Hunh?\n"
	.string "Your BAG is crammed full.$"

UnknownString_81C4360: @ 81C4360
	.string "Hmm... I’ve seen a bigger {STR_VAR_1}\n"
	.string "than this one.$"

UnknownString_81C438C: @ 81C438C
	.string "Oh, now this is quite something...\n"
	.string "But it’s not a {STR_VAR_1}!$"

UnknownString_81C43C2: @ 81C43C2
	.string "You don’t have a big {STR_VAR_1}?\n"
	.string "That’s too bad...\p"
	.string "If you get a big {STR_VAR_1},\n"
	.string "please come show me.$"

UnknownString_81C4417: @ 81C4417
	.string "The biggest {STR_VAR_1} in history!\n"
	.string "{STR_VAR_2}’s {STR_VAR_3}-inch colossus!$"

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
UnknownString_81C4520: @ 81C4520
	.string "You should go into grassy areas more\n"
	.string "and look for POKéMON more carefully.$"

	.global gUnknown_081C456A
gUnknown_081C456A: @ 81C456A
UnknownString_81C456A: @ 81C456A
	.string "I guess you’re getting the hang of it.\n"
	.string "But, it gets harder from here.$"

	.global gUnknown_081C45B0
gUnknown_081C45B0: @ 81C45B0
UnknownString_81C45B0: @ 81C45B0
	.string "Some POKéMON only appear in certain\n"
	.string "areas. You’ll need to be persistent.$"

	.global gUnknown_081C45F9
gUnknown_081C45F9: @ 81C45F9
UnknownString_81C45F9: @ 81C45F9
	.string "Well, it could use more quantity, but\n"
	.string "this is looking more like a POKéDEX now.$"

	.global gUnknown_081C4648
gUnknown_081C4648: @ 81C4648
UnknownString_81C4648: @ 81C4648
	.string "This is coming along pretty good.\n"
	.string "Keep up the effort.$"

	.global gUnknown_081C467E
gUnknown_081C467E: @ 81C467E
UnknownString_81C467E: @ 81C467E
	.string "Are you using any RODS?\n"
	.string "There are many POKéMON in the sea.$"

	.global gUnknown_081C46B9
gUnknown_081C46B9: @ 81C46B9
UnknownString_81C46B9: @ 81C46B9
	.string "Instead of just catching POKéMON,\n"
	.string "how about making them evolve, too?$"

	.global gUnknown_081C46FE
gUnknown_081C46FE: @ 81C46FE
UnknownString_81C46FE: @ 81C46FE
	.string "This is going to be a fantastic POKéDEX.\n"
	.string "That’s the feeling I’m getting.$"

	.global gUnknown_081C4747
gUnknown_081C4747: @ 81C4747
UnknownString_81C4747: @ 81C4747
	.string "You’ve collected this many...\n"
	.string "Your talent is remarkable!$"

	.global gUnknown_081C4780
gUnknown_081C4780: @ 81C4780
UnknownString_81C4780: @ 81C4780
	.string "Have you visited the SAFARI ZONE?\p"
	.string "I hear there are some POKéMON that\n"
	.string "can only be caught there.$"

	.global gUnknown_081C47DF
gUnknown_081C47DF: @ 81C47DF
UnknownString_81C47DF: @ 81C47DF
	.string "You’ve finally reached the 100-kind\n"
	.string "mark. This is an impressive POKéDEX!$"

	.global gUnknown_081C4828
gUnknown_081C4828: @ 81C4828
UnknownString_81C4828: @ 81C4828
	.string "There might be POKéMON that can be\n"
	.string "found using ROCK SMASH.$"

	.global gUnknown_081C4863
gUnknown_081C4863: @ 81C4863
UnknownString_81C4863: @ 81C4863
	.string "You should get some more POKéMON by\n"
	.string "trading with others.$"

	.global gUnknown_081C489C
gUnknown_081C489C: @ 81C489C
UnknownString_81C489C: @ 81C489C
	.string "I’ve heard of POKéMON that evolve when\n"
	.string "they come to fully love their TRAINERS.$"

	.global gUnknown_081C48EB
gUnknown_081C48EB: @ 81C48EB
UnknownString_81C48EB: @ 81C48EB
	.string "I had no idea that there were so many\n"
	.string "POKéMON species in the HOENN region.$"

	.global gUnknown_081C4936
gUnknown_081C4936: @ 81C4936
UnknownString_81C4936: @ 81C4936
	.string "On occasion, some POKéMON appear in\n"
	.string "large numbers like wild outbreaks.\l"
	.string "Don’t miss opportunities like those.$"

	.global gUnknown_081C49A2
gUnknown_081C49A2: @ 81C49A2
UnknownString_81C49A2: @ 81C49A2
	.string "One can get a very good idea about the\n"
	.string "POKéMON of the HOENN region by looking\l"
	.string "through your POKéDEX.$"

	.global gUnknown_081C4A06
gUnknown_081C4A06: @ 81C4A06
UnknownString_81C4A06: @ 81C4A06
	.string "I’d say you already qualify as a POKéMON\n"
	.string "PROFESSOR, and a good one, too!$"

	.global gUnknown_081C4A4F
gUnknown_081C4A4F: @ 81C4A4F
UnknownString_81C4A4F: @ 81C4A4F
	.string "With a POKéDEX this complete, you’re\n"
	.string "a real professional at this!$"

	.global gUnknown_081C4A91
gUnknown_081C4A91: @ 81C4A91
UnknownString_81C4A91: @ 81C4A91
	.string "You’re very close to completing this\n"
	.string "POKéDEX. I can feel it in my bones!$"

	.global gUnknown_081C4ADA
gUnknown_081C4ADA: @ 81C4ADA

UnknownString_81C4ADA: @ 81C4ADA
	.string "Congratulations!\n"
	.string "Your POKéDEX is complete!$"

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

UnknownString_81C4C9F: @ 81C4C9F
	.string "Please pick a LOTO TICKET.\n"
	.string "... ... ...$"

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

UnknownString_81C5033: @ 81C5033
	.string "DAD: {PLAYER}! Good to see you!\n"
	.string "There’s a letter here for you, {PLAYER}.$"

UnknownString_81C5070: @ 81C5070
	.string "DAD: I guess this is a PASS for a ship.\n"
	.string "But I’ve never seen this ship before.\p"
	.string "You should find out what this is about\n"
	.string "in LILYCOVE.$"

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

	.include "data/text/braille.s"

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
	.incbin "baserom.gba", 0x001c6c02, 0x29

@ 81C6C2B
	@ This is a test message!
	@ Welcome to the world of Pokémon!
	.string "テストよう　メッセージです！\n"
	.string "ポケモンの　せかいへ　ようこそ！$"

@ 81C6C4B
	@ This is a test message!
	@ This is a sign.
	.string "テストよう　メッセージです！\n"
	.string "かんばん　です$"

@ 81C6C62
	@ This is a test message!
	@ This is a coordinate-check event.
	.string "テストよう　メッセージです！\n"
	.string "ざひょう　チェックの　イベントです$"

@ 81C6C83
	.string " $"

	.global gUnknown_081C6C85
gUnknown_081C6C85: @ 81C6C85
UnknownString_81C6C85: @ 81C6C85
	.string "Would you like to save the game?$"

	.global gUnknown_081C6CA6
gUnknown_081C6CA6: @ 81C6CA6
UnknownString_81C6CA6: @ 81C6CA6
	.string "There is already a saved file.\n"
	.string "Is it okay to overwrite it?$"

	.global gUnknown_081C6CE1
gUnknown_081C6CE1: @ 81C6CE1

BattleTower_BattleRoom_Text_1C6CE1:: @ 81C6CE1
	.string "SAVING...\n"
	.string "DON’T TURN OFF THE POWER.$"

	.global gUnknown_081C6D05
gUnknown_081C6D05: @ 81C6D05

BattleTower_BattleRoom_Text_1C6D05:: @ 81C6D05
	.string "{PLAYER} saved the game.$"

UnknownString_81C6D18: @ 81C6D18
	.string "Save error...$"

	.global gUnknown_081C6D26
gUnknown_081C6D26: @ 81C6D26
UnknownString_81C6D26: @ 81C6D26
	.string "There is a different game file that is\n"
	.string "already saved.\p"
	.string "Is it okay to overwrite it?$"

	.global gUnknown_081C6D78
gUnknown_081C6D78: @ 81C6D78
UnknownString_81C6D78: @ 81C6D78
	.string "Hi! Sorry to keep you waiting!\p"
	.string "Welcome to the world of POKéMON!\p"
	.string "My name is BIRCH.\p"
	.string "But everyone calls me the POKéMON\n"
	.string "PROFESSOR.\p$"

	.global gUnknown_081C6DF8
gUnknown_081C6DF8: @ 81C6DF8
UnknownString_81C6DF8: @ 81C6DF8
	.string "This is what we call a “POKéMON.”$"

	.global gUnknown_081C6E1A
gUnknown_081C6E1A: @ 81C6E1A
UnknownString_81C6E1A: @ 81C6E1A
	.string "This world is widely inhabited by\n"
	.string "creatures known as POKéMON.\p"
	.string "We humans live alongside POKéMON,\n"
	.string "at times as friendly playmates, and\l"
	.string "at times as cooperative workmates.\p"
	.string "And sometimes, we band together\n"
	.string "and battle others like us.\p"
	.string "But despite our closeness, we don’t\n"
	.string "know everything about POKéMON.\p"
	.string "In fact, there are many, many\n"
	.string "secrets surrounding POKéMON.\p"
	.string "To unravel POKéMON mysteries,\n"
	.string "I’ve been undertaking research.\l"
	.string "That’s what I do.\p$"

	.global gUnknown_081C6FCB
gUnknown_081C6FCB: @ 81C6FCB
UnknownString_81C6FCB: @ 81C6FCB
	.string "And you are?$"

	.global gUnknown_081C6FD8
gUnknown_081C6FD8: @ 81C6FD8
UnknownString_81C6FD8: @ 81C6FD8
	.string "Are you a boy?\n"
	.string "Or are you a girl?$"

	.global gUnknown_081C6FFA
gUnknown_081C6FFA: @ 81C6FFA
UnknownString_81C6FFA: @ 81C6FFA
	.string "All right.\n"
	.string "What’s your name?$"

	.global gUnknown_081C7017
gUnknown_081C7017: @ 81C7017
UnknownString_81C7017: @ 81C7017
	.string "So it’s {PLAYER}{KUN}?$"

	.global gUnknown_081C7025
gUnknown_081C7025: @ 81C7025
UnknownString_81C7025: @ 81C7025
	.string "Ah, okay!\p"
	.string "You’re {PLAYER}{KUN} who’s moving to my\n"
	.string "hometown of LITTLEROOT.\l"
	.string "I get it now!$"

	.global gUnknown_081C7074
gUnknown_081C7074: @ 81C7074
UnknownString_81C7074: @ 81C7074
	.string "All right, are you ready?\p"
	.string "Your very own adventure is about\n"
	.string "to unfold.\p"
	.string "Take courage, and leap into the\n"
	.string "world of POKéMON where dreams,\l"
	.string "adventure, and friendships await!\p"
	.string "Well, I’ll be expecting you later.\n"
	.string "Come see me in my POKéMON LAB.\p$"
