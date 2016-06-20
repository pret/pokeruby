	.include "asm/macros.s"
	.include "constants/constants.s"

	.section event_script_data, "aw", %progbits

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

Route105_Text_1B8B40:: @ 81B8B40
	.string "There’s supposed to be a mystical\n"
	.string "rock around here.\l"
	.string "Do you know anything about it?$"

Route105_Text_1B8B93:: @ 81B8B93
	.string "I was thinking too much about that\n"
	.string "rock, while my POKéMON remained weak...$"

Route105_Text_1B8BDE:: @ 81B8BDE
	.string "I can spend hours and hours staring\n"
	.string "at a nice rock without growing bored.$"

Route105_Text_1B8C28:: @ 81B8C28
	.string "Whew! I was worried that a kid was\n"
	.string "drowning when I saw you.\p"
	.string "You seem to be okay, so what do you\n"
	.string "say to a battle?$"

Route105_Text_1B8C99:: @ 81B8C99
	.string "Glub... Glub...$"

Route105_Text_1B8CA9:: @ 81B8CA9
	.string "If you are drowning, the signal is to\n"
	.string "wave one arm toward the beach.$"

Route105_Text_1B8CEE:: @ 81B8CEE
	.string "Swimming the deep blue sea...\n"
	.string "It feels the greatest!$"

Route105_Text_1B8D23:: @ 81B8D23
	.string "I lost...\n"
	.string "Now I’m feeling blue...$"

Route105_Text_1B8D45:: @ 81B8D45
	.string "Why is the sea blue?\p"
	.string "I learned about that at the MUSEUM in\n"
	.string "SLATEPORT, but I forgot.$"

Route105_Text_1B8D99:: @ 81B8D99
	.string "My body feels lighter in the water.\n"
	.string "It’s as if I’ve gotten slimmer!$"

Route105_Text_1B8DDD:: @ 81B8DDD
	.string "I’m floating...$"

Route105_Text_1B8DED:: @ 81B8DED
	.string "Your body weight is reduced to just\n"
	.string "one tenth in the water.\p"
	.string "That would make me...\n"
	.string "Whoops! I’m not telling you my weight!$"

Route105_Text_1B8E66:: @ 81B8E66
	.string "The blue, blue sky...\n"
	.string "The vast sea...\l"
	.string "It’s so peaceful...$"

Route105_Text_1B8EA0:: @ 81B8EA0
	.string "I lost while I was lounging!$"

Route105_Text_1B8EBD:: @ 81B8EBD
	.string "I want to be told I’m relaxing to be\n"
	.string "with. Giggle.$"


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

Route107_Text_1B926B:: @ 81B926B
	.string "Yawn...\p"
	.string "I must have drifted off to sleep while\n"
	.string "I was drifting in the waves.$"

Route107_Text_1B92B7:: @ 81B92B7
	.string "Ahaha, I lost...\n"
	.string "I’ll take a snooze, I think...$"

Route107_Text_1B92E7:: @ 81B92E7
	.string "Floating and being rocked by the\n"
	.string "waves - it’s like sleeping in a plush,\l"
	.string "comfy bed.$"

Route107_Text_1B933A:: @ 81B933A
	.string "The sea is like my backyard.\n"
	.string "Let’s battle!$"

Route107_Text_1B9365:: @ 81B9365
	.string "I lost on my home field...\n"
	.string "I’m in shock!$"

Route107_Text_1B938E:: @ 81B938E
	.string "I swim the seas with a heart full of\n"
	.string "dreams...\p"
	.string "It’s a song!\n"
	.string "Anyways, I’m swimming some more.$"

Route107_Text_1B93EB:: @ 81B93EB
	.string "Swimming in the big, wide sea, my\n"
	.string "POKéMON has grown stronger!$"

Route107_Text_1B9429:: @ 81B9429
	.string "What a shock!\p"
	.string "My POKéMON has gotten stronger, but\n"
	.string "I stayed weak as a TRAINER!$"

Route107_Text_1B9477:: @ 81B9477
	.string "What you learn in battle makes you a\n"
	.string "stronger TRAINER.\l"
	.string "The waves taught me that.$"

Route107_Text_1B94C8:: @ 81B94C8
	.string "Do you know a little town called\n"
	.string "DEWFORD?$"

Route107_Text_1B94F2:: @ 81B94F2
	.string "I hate this!$"

Route107_Text_1B94FF:: @ 81B94FF
	.string "A weird saying is getting really\n"
	.string "trendy at DEWFORD HALL.$"

Route107_Text_1B9538:: @ 81B9538
	.string "Did you want to battle me?\n"
	.string "Sure, I’ll go with you!$"

Route107_Text_1B956B:: @ 81B956B
	.string "I wasn’t good enough for you.$"

Route107_Text_1B9589:: @ 81B9589
	.string "I think you’re going to keep getting\n"
	.string "better. I’ll go for it, too!$"

Route107_Text_1B95CB:: @ 81B95CB
	.string "LISA: We challenge you as a sister\n"
	.string "and brother!$"

Route107_Text_1B95FB:: @ 81B95FB
	.string "LISA: Awesome.\n"
	.string "You’re in a different class of tough.$"

Route107_Text_1B9630:: @ 81B9630
	.string "LISA: Do you have any friends who\n"
	.string "would go to the beach with you?$"

Route107_Text_1B9672:: @ 81B9672
	.string "LISA: If you want to battle with us,\n"
	.string "bring more POKéMON.$"

Route107_Text_1B96AB:: @ 81B96AB
	.string "RAY: We always battle POKéMON, me\n"
	.string "and my sister.\p"
	.string "I always lose, but we can beat you\n"
	.string "2-on-2!$"

Route107_Text_1B9707:: @ 81B9707
	.string "RAY: Wowee, you’re at a higher level\n"
	.string "than us!$"

Route107_Text_1B9735:: @ 81B9735
	.string "RAY: My sister gave me my POKéMON.\n"
	.string "I raised it, and now it’s my important\l"
	.string "partner!$"

Route107_Text_1B9788:: @ 81B9788
	.string "RAY: If you want to battle us, go\n"
	.string "bring some more POKéMON!$"

Route108_Text_1B97C3:: @ 81B97C3
	.string "My dream is to swim the world’s seven\n"
	.string "seas!$"

Route108_Text_1B97EF:: @ 81B97EF
	.string "I won’t be able to swim the seven seas\n"
	.string "like this...$"

Route108_Text_1B9823:: @ 81B9823
	.string "Playing with marine POKéMON is one of\n"
	.string "the pleasures of swimming!$"

Route108_Text_1B9864:: @ 81B9864
	.string "Ahoy, there! Are you going out to the\n"
	.string "ABANDONED SHIP, too?$"

Route108_Text_1B989F:: @ 81B989F
	.string "I’m sinking!\n"
	.string "Glub... Glub...$"

Route108_Text_1B98BC:: @ 81B98BC
	.string "Some people even go inside that\n"
	.string "ABANDONED SHIP.$"

Route108_Text_1B98EC:: @ 81B98EC
	.string "My liar of a boyfriend told me that\n"
	.string "I look great in a bikini...$"

Route108_Text_1B992C:: @ 81B992C
	.string "Oh, boo!$"

Route108_Text_1B9935:: @ 81B9935
	.string "Even if it’s a lie, I love being told\n"
	.string "I look great...\l"
	.string "We girls are so complex...$"

Route108_Text_1B9986:: @ 81B9986
	.string "I love the sea!\n"
	.string "I forget all my worries when I swim!$"

Route108_Text_1B99BB:: @ 81B99BB
	.string "When I lose a battle, I get all\n"
	.string "stressed out!$"

Route108_Text_1B99E9:: @ 81B99E9
	.string "Work off your stress by swimming!\n"
	.string "It’s so healthy!$"

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

UnknownString_81BCE47: @ 81BCE47
	.string "I have a rare POKéMON!\n"
	.string "Would you like me to show you?$"

UnknownString_81BCE7D: @ 81BCE7D
	.string "You...\n"
	.string "You want my POKéMON, don’t you?$"

UnknownString_81BCEA4: @ 81BCEA4
	.string "I have this rare POKéMON.\n"
	.string "It’s enough to keep me satisfied.$"

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

Route125_Text_1C0FCF:: @ 81C0FCF
	.string "I heard you approaching, so I hung\n"
	.string "around for you!$"

Route125_Text_1C1002:: @ 81C1002
	.string "I beg for peace!$"

Route125_Text_1C1013:: @ 81C1013
	.string "Sound travels faster in water than\n"
	.string "it does through air.$"

Route125_Text_1C104B:: @ 81C104B
	.string "Hey, there!\n"
	.string "Check out my sweet POKéMON!$"

Route125_Text_1C1073:: @ 81C1073
	.string "I floundered...$"

Route125_Text_1C1083:: @ 81C1083
	.string "I was blown away by HORSEA’s charm,\n"
	.string "so I started swimming, too.$"

Route125_Text_1C10C3:: @ 81C10C3
	.string "I’m tired of swimming.\n"
	.string "Are you up for a battle with me?$"

Route125_Text_1C10FB:: @ 81C10FB
	.string "You’re too much!$"

Route125_Text_1C110C:: @ 81C110C
	.string "Whew...\n"
	.string "Which way is it to MOSSDEEP CITY?$"

Route125_Text_1C1136:: @ 81C1136
	.string "How would you like to take on the\n"
	.string "WATER-type POKéMON I raised?$"

Route125_Text_1C1175:: @ 81C1175
	.string "I lost...$"

Route125_Text_1C117F:: @ 81C117F
	.string "Your power... You’re the real deal.\n"
	.string "I’m amazed!$"

Route125_Text_1C11AF:: @ 81C11AF
	.string "Ahoy! I’m a buff, tough SAILOR!\n"
	.string "I’ve braved the world’s seas!$"

Route125_Text_1C11ED:: @ 81C11ED
	.string "Gwrroooar!\n"
	.string "I couldn’t win!$"

Route125_Text_1C1208:: @ 81C1208
	.string "The tide ebbs and flows inside the\n"
	.string "SHOAL CAVE.\p"
	.string "By the way, it’s about six hours from\n"
	.string "high tide to low tide. Did you know?$"

Route125_Text_1C1282:: @ 81C1282
	.string "It’s high time I get my payback\n"
	.string "from you! Come on, we’re battling!$"

Route125_Text_1C12C5:: @ 81C12C5
	.string "I couldn’t win!\n"
	.string "I flat out couldn’t win!$"

Route125_Text_1C12EE:: @ 81C12EE
	.string "The SHOAL CAVE...\p"
	.string "There are places you can and can’t\n"
	.string "get to depending on the rise and fall\l"
	.string "of the tide.\p"
	.string "By the way, it’s about six hours from\n"
	.string "high tide to low tide. Don’t forget!$"

Route125_Text_1C13A1:: @ 81C13A1
	.string "KIM: A funny old man lives in the\n"
	.string "SHOAL CAVE. Someone told me.\l"
	.string "Are you going to see him, too?$"

Route125_Text_1C13FF:: @ 81C13FF
	.string "KIM: I thought we would win.$"

Route125_Text_1C141C:: @ 81C141C
	.string "KIM: A funny old man lives in the\n"
	.string "SHOAL CAVE, doesn’t he?\p"
	.string "Let’s go see him, IRIS!$"

Route125_Text_1C146E:: @ 81C146E
	.string "KIM: No, no, no! You need two POKéMON,\n"
	.string "or it’s just no good!$"

Route125_Text_1C14AB:: @ 81C14AB
	.string "IRIS: KIM, can you tell me what we’re\n"
	.string "looking for out here?$"

Route125_Text_1C14E7:: @ 81C14E7
	.string "IRIS: Oh, we came sort of close.$"

Route125_Text_1C1508:: @ 81C1508
	.string "IRIS: KIM, are we really going into\n"
	.string "the SHOAL CAVE?\l"
	.string "We’ll get all wet.$"

Route125_Text_1C154F:: @ 81C154F
	.string "IRIS: Oh, we could never, ever do\n"
	.string "anything like a 2-on-1 battle.$"

Route126_Text_1C1590:: @ 81C1590
	.string "Swimming is a full-body workout!\n"
	.string "You will get fit!$"

Route126_Text_1C15C3:: @ 81C15C3
	.string "I admit it! You win!$"

Route126_Text_1C15D8:: @ 81C15D8
	.string "Thanks to my daily swimming routine...\n"
	.string "Look! Feast your eyes on this physique!$"

Route126_Text_1C1627:: @ 81C1627
	.string "This towering white mountain of rock\n"
	.string "is SOOTOPOLIS CITY.$"

Route126_Text_1C1660:: @ 81C1660
	.string "I was done in?$"

Route126_Text_1C166F:: @ 81C166F
	.string "I can’t find the entrance to\n"
	.string "SOOTOPOLIS. Where could it be?$"

Route126_Text_1C16AB:: @ 81C16AB
	.string "Ufufufufu!\n"
	.string "I’m a mermaid!$"

Route126_Text_1C16C5:: @ 81C16C5
	.string "My fantasy burst as if it were a bubble!\n"
	.string "Blub, blub, blub...$"

Route126_Text_1C1702:: @ 81C1702
	.string "You thrashed me... I want to\n"
	.string "disappear in a wave of despair...$"

Route126_Text_1C1741:: @ 81C1741
	.string "Hello, kiddo!\n"
	.string "Want a battle with me?$"

Route126_Text_1C1766:: @ 81C1766
	.string "Oh, noooooh!$"

Route126_Text_1C1773:: @ 81C1773
	.string "I love frolicking with POKéMON in\n"
	.string "the sea like this!$"

Route127_Text_1C17A8:: @ 81C17A8
	.string "I can see it in your face. You want\n"
	.string "to challenge me.$"

Route127_Text_1C17DD:: @ 81C17DD
	.string "Awawawawawa...$"

Route127_Text_1C17EC:: @ 81C17EC
	.string "A well-played match leaves me feeling\n"
	.string "refreshed and serene.$"

Route127_Text_1C1828:: @ 81C1828
	.string "Do you have a rival whom you just\n"
	.string "hate to lose against?$"

Route127_Text_1C1860:: @ 81C1860
	.string "Arrrgh! I hate losing!$"

Route127_Text_1C1877:: @ 81C1877
	.string "If you have a rival, don’t you get the\n"
	.string "feeling that you have to keep getting\l"
	.string "better?$"

Route127_Text_1C18CC:: @ 81C18CC
	.string "Through fishing, I have attained a\n"
	.string "state of becalmed serenity...\l"
	.string "Please, allow me to demonstrate...$"

Route127_Text_1C1930:: @ 81C1930
	.string "Though I have lost, my heart remains\n"
	.string "calm...$"

Route127_Text_1C195D:: @ 81C195D
	.string "It matters not that I catch nothing.\n"
	.string "The line remains in the water...$"

Route127_Text_1C19A3:: @ 81C19A3
	.string "Whoops! Don’t tell me I snagged\n"
	.string "a SURFING POKéMON?$"

Route127_Text_1C19D6:: @ 81C19D6
	.string "I can’t keep up!$"

Route127_Text_1C19E7:: @ 81C19E7
	.string "Your POKéMON look pretty strong.\n"
	.string "They’d be a handful if I hooked them!$"

Route127_Text_1C1A2E:: @ 81C1A2E
	.string "Well, hey! This is a match between a\n"
	.string "POKéMON fan and a fishing buff!$"

Route127_Text_1C1A73:: @ 81C1A73
	.string "No! My line’s all tangled!\n"
	.string "The party’s over!$"

Route127_Text_1C1AA0:: @ 81C1AA0
	.string "My fishing line’s doing a dance!\n"
	.string "The tangle tango! Hahaha, snarl!$"

Route127_Text_1C1AE2:: @ 81C1AE2
	.string "What I learned at DEWFORD’s POKéMON\n"
	.string "GYM, I will put into practice here.$"

Route127_Text_1C1B2A:: @ 81C1B2A
	.string "I was swamped!$"

Route127_Text_1C1B39:: @ 81C1B39
	.string "BRAWLY, DEWFORD’s GYM LEADER, used\n"
	.string "to train with a guy named BRUNO in\l"
	.string "KANTO, I’ve heard.$"

Route127_Text_1C1B92:: @ 81C1B92
	.string "BIRD POKéMON have excellent vision.\n"
	.string "They spot prey from great heights.$"

Route127_Text_1C1BD9:: @ 81C1BD9
	.string "Whew... I give up.$"

Route127_Text_1C1BEC:: @ 81C1BEC
	.string "There’re lots of diving spots in the\n"
	.string "sea around here.\p"
	.string "You can spot them easily from the sky\n"
	.string "because of their darker color.$"

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

Route129_Text_1C2161:: @ 81C2161
	.string "This is my first triathlon.\n"
	.string "I’m all tense and nervous!$"

Route129_Text_1C2198:: @ 81C2198
	.string "Wroooaaar!\n"
	.string "I failed to win!$"

Route129_Text_1C21B4:: @ 81C21B4
	.string "If I’m all tensed up, I won’t be able to\n"
	.string "give it my all.$"

Route129_Text_1C21ED:: @ 81C21ED
	.string "I’m in the middle of a triathlon, but,\n"
	.string "sure, why don’t we battle?$"

Route129_Text_1C222F:: @ 81C222F
	.string "I was sure I’d win!$"

Route129_Text_1C2243:: @ 81C2243
	.string "Do you know what’s the greatest thing\n"
	.string "about triathlons?\p"
	.string "Testing the limits of your own\n"
	.string "strength and endurance against\l"
	.string "Mother Nature!$"

Route129_Text_1C22C8:: @ 81C22C8
	.string "Say hey, hey!\n"
	.string "Let’s get on with it!$"

Route129_Text_1C22EC:: @ 81C22EC
	.string "Beat, I’m beaten.\n"
	.string "That’s it, done!$"

Route129_Text_1C230F:: @ 81C230F
	.string "There’s nothing for a loser.\n"
	.string "Time for me to beat it home.$"

Route129_Text_1C2349:: @ 81C2349
	.string "What’s the hurry?\n"
	.string "Let’s take it slow and easy.$"

Route129_Text_1C2378:: @ 81C2378
	.string "Oh, my.\n"
	.string "I wanted to relax a little more...$"

Route129_Text_1C23A3:: @ 81C23A3
	.string "Don’t you hate making mistakes when\n"
	.string "you’re in a rush?\p"
	.string "That’s why I try to take things\n"
	.string "slowly.$"

Route130_Text_1C2401:: @ 81C2401
	.string "What a surprise! I didn’t expect to\n"
	.string "see a TRAINER out in the sea.\p"
	.string "I think we should battle!$"

Route130_Text_1C245D:: @ 81C245D
	.string "This kid’s awfully tough...$"

Route130_Text_1C2479:: @ 81C2479
	.string "Your eyes have that look of someone\n"
	.string "who’s experienced harsh challenges\l"
	.string "and won. It suits you well!$"

Route130_Text_1C24DC:: @ 81C24DC
	.string "In the deep blue sea,\n"
	.string "my shattered blue heart finds\l"
	.string "comfort among waves.$"

Route130_Text_1C2525:: @ 81C2525
	.string "Like the vast blue sea,\n"
	.string "the world of POKéMON spans\l"
	.string "depths beyond belief.$"

Route130_Text_1C256E:: @ 81C256E
	.string "The world’s children dream\n"
	.string "of one day becoming the\l"
	.string "POKéMON CHAMPION.$"

Route131_Text_1C25B3:: @ 81C25B3
	.string "The sea is teeming with POKéMON.\n"
	.string "It’s not easy swimming, I tell you.$"

Route131_Text_1C25F8:: @ 81C25F8
	.string "POKéMON raised by TRAINERS are\n"
	.string "seriously tough...$"

Route131_Text_1C262A:: @ 81C262A
	.string "Gasp... Gasp... I’m wiped out...\p"
	.string "The going’s easy. It’s the leaving\n"
	.string "that’s the hard part.\p"
	.string "Will I have any energy left to make\n"
	.string "the return trip?$"

Route131_Text_1C26B9:: @ 81C26B9
	.string "The sea... The sea... The sea...\n"
	.string "The sea as far as these eyes can see!\l"
	.string "I’m sick and tired of the sea!$"

Route131_Text_1C271F:: @ 81C271F
	.string "Bleah!$"

Route131_Text_1C2726:: @ 81C2726
	.string "Bored I am by the sea, but swim I must.\p"
	.string "I’m a born swimmer!\n"
	.string "That’s what I am.$"

Route131_Text_1C2774:: @ 81C2774
	.string "Hi, sweetie, wait!\n"
	.string "We should battle, you and I!$"

Route131_Text_1C27A4:: @ 81C27A4
	.string "You’re tough in spite of the way\n"
	.string "you look!$"

Route131_Text_1C27CF:: @ 81C27CF
	.string "Did you see a guy over there who whines\n"
	.string "that he’s bored of the sea?\p"
	.string "That’s all talk.\n"
	.string "He’s hopelessly in love with the sea!$"

Route131_Text_1C284A:: @ 81C284A
	.string "Why do men love bathing suits so much?\p"
	.string "They all ogle me!$"

Route131_Text_1C2883:: @ 81C2883
	.string "I’m out of my depth!$"

Route131_Text_1C2898:: @ 81C2898
	.string "Maybe it’s not my bathing suit that\n"
	.string "makes men look. It must be my beauty!$"

Route131_Text_1C28E2:: @ 81C28E2
	.string "RELI: We’ll work together as siblings\n"
	.string "to take you on!$"

Route131_Text_1C2918:: @ 81C2918
	.string "RELI: We couldn’t win even though we\n"
	.string "worked together...$"

Route131_Text_1C2950:: @ 81C2950
	.string "RELI: The people of PACIFIDLOG are\n"
	.string "together with the sea and POKéMON from\l"
	.string "the time they are born.$"

Route131_Text_1C29B2:: @ 81C29B2
	.string "RELI: You don’t have two POKéMON?\n"
	.string "We can’t enjoy a battle, then.$"

Route131_Text_1C29F3:: @ 81C29F3
	.string "IAN: I’m doing my best together with\n"
	.string "my sis!$"

Route131_Text_1C2A20:: @ 81C2A20
	.string "IAN: I did my best with my sis, but\n"
	.string "we still couldn’t win...$"

Route131_Text_1C2A5D:: @ 81C2A5D
	.string "IAN: You know how PACIFIDLOG is\n"
	.string "a floating town?\p"
	.string "So, wherever there is the sea, that’s\n"
	.string "a part of PACIFIDLOG!$"

Route131_Text_1C2ACA:: @ 81C2ACA
	.string "IAN: If you have two POKéMON, we’ll\n"
	.string "take you on!$"

Route132_Text_1C2AFB:: @ 81C2AFB
	.string "I used to catch colds all the time as\n"
	.string "a kid, but I became totally fit after\l"
	.string "I started swimming.$"

Route132_Text_1C2B5B:: @ 81C2B5B
	.string "I crave more power...$"

Route132_Text_1C2B71:: @ 81C2B71
	.string "TRAINERS travel the fields and\n"
	.string "mountains, so they must be fit, too.$"

Route132_Text_1C2BB5:: @ 81C2BB5
	.string "I try not to swim where the currents\n"
	.string "are too strong.$"

Route132_Text_1C2BEA:: @ 81C2BEA
	.string "Oh, please, no!$"

Route132_Text_1C2BFA:: @ 81C2BFA
	.string "If I get swept away, I’ll lose all my\n"
	.string "sense of place...$"

Route132_Text_1C2C32:: @ 81C2C32
	.string "Win or lose, you’ll never know until\n"
	.string "you try!$"

Route132_Text_1C2C60:: @ 81C2C60
	.string "Waah!\n"
	.string "I sank in defeat!$"

Route132_Text_1C2C78:: @ 81C2C78
	.string "I never battle when I know I’ll win.\n"
	.string "I like to battle at the razor’s edge of\l"
	.string "victory and defeat!$"

Route132_Text_1C2CD9:: @ 81C2CD9
	.string "I contemplate POKéMON 24 hours a day.\n"
	.string "How could you possibly beat me?$"

Route132_Text_1C2D1F:: @ 81C2D1F
	.string "I lose.\n"
	.string "I will concede defeat.$"

Route132_Text_1C2D3E:: @ 81C2D3E
	.string "Urggh...\n"
	.string "You’re a POKéMON fanatic, aren’t you?\p"
	.string "You must contemplate POKéMON 24 hours\n"
	.string "a day, don’t you?$"

Route133_Text_1C2DA5:: @ 81C2DA5
	.string "Did the currents carry you here, too?\n"
	.string "This must have been fated. Let’s battle!$"

Route133_Text_1C2DF4:: @ 81C2DF4
	.string "Strong!\n"
	.string "Too much so!$"

Route133_Text_1C2E09:: @ 81C2E09
	.string "It’s just my luck that a tough TRAINER\n"
	.string "like you would drift here...\l"
	.string "I must be cursed...$"

Route133_Text_1C2E61:: @ 81C2E61
	.string "I’ve led a life of woe and misery...\n"
	.string "I’ve been cast away, and this is where\l"
	.string "I’ve drifted...$"

Route133_Text_1C2EBD:: @ 81C2EBD
	.string "Another loss...$"

Route133_Text_1C2ECD:: @ 81C2ECD
	.string "A life adrift...\n"
	.string "I don’t want it anymore!$"

Route133_Text_1C2EF7:: @ 81C2EF7
	.string "Welcome!\n"
	.string "I’ve been expecting you!$"

Route133_Text_1C2F19:: @ 81C2F19
	.string "No! Please!$"

Route133_Text_1C2F25:: @ 81C2F25
	.string "A strong child TRAINER...\n"
	.string "That’s so annoying!$"

Route133_Text_1C2F53:: @ 81C2F53
	.string "I want to win like everyone else, but I\n"
	.string "won’t raise POKéMON like everyone else.$"

Route133_Text_1C2FA3:: @ 81C2FA3
	.string "Darn it!\n"
	.string "My way is still too slack!$"

Route133_Text_1C2FC7:: @ 81C2FC7
	.string "It’s way more fun to do things the way\n"
	.string "I want than to be like everybody else.\l"
	.string "I mean, that’s obvious!$"

Route133_Text_1C302D:: @ 81C302D
	.string "I came all the way out here with my\n"
	.string "BIRD POKéMON.$"

Route133_Text_1C305F:: @ 81C305F
	.string "You...\n"
	.string "You’re stunningly cool!$"

Route133_Text_1C307E:: @ 81C307E
	.string "I’d like to go back to FORTREE, but I’ve\n"
	.string "grown to like this place, too.$"

Route134_Text_1C30C6:: @ 81C30C6
	.string "Even those POKéMON that can swim are\n"
	.string "carried along by the rapid currents.$"

Route134_Text_1C3110:: @ 81C3110
	.string "Aiyeeeeh!$"

Route134_Text_1C311A:: @ 81C311A
	.string "I think POKéMON enjoy the fast-running\n"
	.string "currents around these parts.$"

Route134_Text_1C315E:: @ 81C315E
	.string "My LUVDISC are looking for a fun\n"
	.string "match. Will you join us?$"

Route134_Text_1C3198:: @ 81C3198
	.string "Oopsie!$"

Route134_Text_1C31A0:: @ 81C31A0
	.string "There’s a collector who’s after the\n"
	.string "SCALES of LUVDISC.$"

Route134_Text_1C31D7:: @ 81C31D7
	.string "Okeydokey! That’s enough rest, gang!\n"
	.string "It’s time for a match!$"

Route134_Text_1C3213:: @ 81C3213
	.string "Tuckered out again...$"

Route134_Text_1C3229:: @ 81C3229
	.string "My BIRD POKéMON get tired quickly after\n"
	.string "a long flight...$"

Route134_Text_1C3262:: @ 81C3262
	.string "You’re a POKéMON TRAINER.\n"
	.string "No need for words. We battle now.$"

Route134_Text_1C329E:: @ 81C329E
	.string "... ... ... ... ... ... ...\n"
	.string "... ... ... ... ... ... ...$"

Route134_Text_1C32D6:: @ 81C32D6
	.string "It was I who challenged you, and yet\n"
	.string "I lost. I am deeply shamed...$"

Route134_Text_1C3319:: @ 81C3319
	.string "The savage tide in this area serves to\n"
	.string "make us stronger than ever.$"

Route134_Text_1C335C:: @ 81C335C
	.string "I concede defeat.$"

Route134_Text_1C336E:: @ 81C336E
	.string "We will return for more training at\n"
	.string "METEOR FALLS.\p"
	.string "If you’d like, you should go, too.\n"
	.string "It will definitely toughen you up!$"


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
