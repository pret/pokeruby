#include "constants/decorations.h"
#include "constants/field_effects.h"
#include "constants/flags.h"
#include "constants/game_stat.h"
#include "constants/items.h"
#include "constants/event_objects.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/opponents.h"
#include "constants/songs.h"
#include "constants/species.h"
#include "constants/weather.h"
#include "constants/heal_locations.h"
#include "constants/vars.h"
	.include "include/macros.inc"
	.include "include/macros/event.inc"
	.include "constants/constants.inc"

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
	.4byte gSpecialVar_Facing
	.4byte gSpecialVar_Result
	.4byte gSpecialVar_ItemId
	.4byte gSpecialVar_LastTalked
	.4byte gSpecialVar_ContestRank
	.4byte gSpecialVar_ContestCategory

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

	.include "data/maps/PetalburgCity/scripts.inc"
	.include "data/maps/SlateportCity/scripts.inc"
	.include "data/maps/MauvilleCity/scripts.inc"
	.include "data/maps/RustboroCity/scripts.inc"
	.include "data/maps/FortreeCity/scripts.inc"
	.include "data/maps/LilycoveCity/scripts.inc"
	.include "data/maps/MossdeepCity/scripts.inc"
	.include "data/maps/SootopolisCity/scripts.inc"
	.include "data/maps/EverGrandeCity/scripts.inc"
	.include "data/maps/LittlerootTown/scripts.inc"
	.include "data/maps/OldaleTown/scripts.inc"
	.include "data/maps/DewfordTown/scripts.inc"
	.include "data/maps/LavaridgeTown/scripts.inc"
	.include "data/maps/FallarborTown/scripts.inc"
	.include "data/maps/VerdanturfTown/scripts.inc"
	.include "data/maps/PacifidlogTown/scripts.inc"
	.include "data/maps/Route101/scripts.inc"
	.include "data/maps/Route102/scripts.inc"
	.include "data/maps/Route103/scripts.inc"
	.include "data/maps/Route104/scripts.inc"
	.include "data/maps/Route105/scripts.inc"
	.include "data/maps/Route106/scripts.inc"
	.include "data/maps/Route107/scripts.inc"
	.include "data/maps/Route108/scripts.inc"
	.include "data/maps/Route109/scripts.inc"
	.include "data/maps/Route110/scripts.inc"
	.include "data/maps/Route111/scripts.inc"
	.include "data/maps/Route112/scripts.inc"
	.include "data/maps/Route113/scripts.inc"
	.include "data/maps/Route114/scripts.inc"
	.include "data/maps/Route115/scripts.inc"
	.include "data/maps/Route116/scripts.inc"
	.include "data/maps/Route117/scripts.inc"
	.include "data/maps/Route118/scripts.inc"
	.include "data/maps/Route119/scripts.inc"
	.include "data/maps/Route120/scripts.inc"
	.include "data/maps/Route121/scripts.inc"
	.include "data/maps/Route122/scripts.inc"
	.include "data/maps/Route123/scripts.inc"
	.include "data/maps/Route124/scripts.inc"
	.include "data/maps/Route125/scripts.inc"
	.include "data/maps/Route126/scripts.inc"
	.include "data/maps/Route127/scripts.inc"
	.include "data/maps/Route128/scripts.inc"
	.include "data/maps/Route129/scripts.inc"
	.include "data/maps/Route130/scripts.inc"
	.include "data/maps/Route131/scripts.inc"
	.include "data/maps/Route132/scripts.inc"
	.include "data/maps/Route133/scripts.inc"
	.include "data/maps/Route134/scripts.inc"
	.include "data/maps/Underwater1/scripts.inc"
	.include "data/maps/Underwater2/scripts.inc"
	.include "data/maps/Underwater3/scripts.inc"
	.include "data/maps/Underwater4/scripts.inc"
	.include "data/maps/LittlerootTown_BrendansHouse_1F/scripts.inc"
	.include "data/maps/LittlerootTown_BrendansHouse_2F/scripts.inc"
	.include "data/maps/LittlerootTown_MaysHouse_1F/scripts.inc"
	.include "data/maps/LittlerootTown_MaysHouse_2F/scripts.inc"
	.include "data/maps/LittlerootTown_ProfessorBirchsLab/scripts.inc"
	.include "data/maps/OldaleTown_House1/scripts.inc"
	.include "data/maps/OldaleTown_House2/scripts.inc"
	.include "data/maps/OldaleTown_PokemonCenter_1F/scripts.inc"
	.include "data/maps/OldaleTown_PokemonCenter_2F/scripts.inc"
	.include "data/maps/OldaleTown_Mart/scripts.inc"
	.include "data/maps/DewfordTown_House1/scripts.inc"
	.include "data/maps/DewfordTown_PokemonCenter_1F/scripts.inc"
	.include "data/maps/DewfordTown_PokemonCenter_2F/scripts.inc"
	.include "data/maps/DewfordTown_Gym/scripts.inc"
	.include "data/maps/DewfordTown_Hall/scripts.inc"
	.include "data/maps/DewfordTown_House2/scripts.inc"
	.include "data/maps/LavaridgeTown_HerbShop/scripts.inc"
	.include "data/maps/LavaridgeTown_Gym_1F/scripts.inc"
	.include "data/maps/LavaridgeTown_Gym_B1F/scripts.inc"
	.include "data/maps/LavaridgeTown_House/scripts.inc"
	.include "data/maps/LavaridgeTown_Mart/scripts.inc"
	.include "data/maps/LavaridgeTown_PokemonCenter_1F/scripts.inc"
	.include "data/maps/LavaridgeTown_PokemonCenter_2F/scripts.inc"
	.include "data/maps/FallarborTown_Mart/scripts.inc"
	.include "data/maps/FallarborTown_ContestLobby/scripts.inc"
	.include "data/maps/FallarborTown_ContestHall/scripts.inc"
	.include "data/maps/FallarborTown_PokemonCenter_1F/scripts.inc"
	.include "data/maps/FallarborTown_PokemonCenter_2F/scripts.inc"
	.include "data/maps/FallarborTown_House1/scripts.inc"
	.include "data/maps/FallarborTown_House2/scripts.inc"
	.include "data/maps/VerdanturfTown_ContestLobby/scripts.inc"
	.include "data/maps/VerdanturfTown_ContestHall/scripts.inc"
	.include "data/maps/VerdanturfTown_Mart/scripts.inc"
	.include "data/maps/VerdanturfTown_PokemonCenter_1F/scripts.inc"
	.include "data/maps/VerdanturfTown_PokemonCenter_2F/scripts.inc"
	.include "data/maps/VerdanturfTown_WandasHouse/scripts.inc"
	.include "data/maps/VerdanturfTown_FriendshipRatersHouse/scripts.inc"
	.include "data/maps/VerdanturfTown_House/scripts.inc"
	.include "data/maps/PacifidlogTown_PokemonCenter_1F/scripts.inc"
	.include "data/maps/PacifidlogTown_PokemonCenter_2F/scripts.inc"
	.include "data/maps/PacifidlogTown_House1/scripts.inc"
	.include "data/maps/PacifidlogTown_House2/scripts.inc"
	.include "data/maps/PacifidlogTown_House3/scripts.inc"
	.include "data/maps/PacifidlogTown_House4/scripts.inc"
	.include "data/maps/PacifidlogTown_House5/scripts.inc"
	.include "data/maps/PetalburgCity_WallysHouse/scripts.inc"
	.include "data/maps/PetalburgCity_Gym/scripts.inc"
	.include "data/maps/PetalburgCity_House1/scripts.inc"
	.include "data/maps/PetalburgCity_House2/scripts.inc"
	.include "data/maps/PetalburgCity_PokemonCenter_1F/scripts.inc"
	.include "data/maps/PetalburgCity_PokemonCenter_2F/scripts.inc"
	.include "data/maps/PetalburgCity_Mart/scripts.inc"
	.include "data/maps/SlateportCity_SternsShipyard_1F/scripts.inc"
	.include "data/maps/SlateportCity_SternsShipyard_2F/scripts.inc"
	.include "data/maps/SlateportCity_ContestLobby/scripts.inc"
	.include "data/maps/SlateportCity_ContestHall/scripts.inc"
	.include "data/maps/SlateportCity_House1/scripts.inc"
	.include "data/maps/SlateportCity_PokemonFanClub/scripts.inc"
	.include "data/maps/SlateportCity_OceanicMuseum_1F/scripts.inc"
	.include "data/maps/SlateportCity_OceanicMuseum_2F/scripts.inc"
	.include "data/maps/SlateportCity_Harbor/scripts.inc"
	.include "data/maps/SlateportCity_House2/scripts.inc"
	.include "data/maps/SlateportCity_PokemonCenter_1F/scripts.inc"
	.include "data/maps/SlateportCity_PokemonCenter_2F/scripts.inc"
	.include "data/maps/SlateportCity_Mart/scripts.inc"
	.include "data/maps/MauvilleCity_Gym/scripts.inc"
	.include "data/maps/MauvilleCity_BikeShop/scripts.inc"
	.include "data/maps/MauvilleCity_House1/scripts.inc"
	.include "data/maps/MauvilleCity_GameCorner/scripts.inc"
	.include "data/maps/MauvilleCity_House2/scripts.inc"
	.include "data/maps/MauvilleCity_PokemonCenter_1F/scripts.inc"
	.include "data/maps/MauvilleCity_PokemonCenter_2F/scripts.inc"
	.include "data/maps/MauvilleCity_Mart/scripts.inc"
	.include "data/maps/RustboroCity_DevonCorp_1F/scripts.inc"
	.include "data/maps/RustboroCity_DevonCorp_2F/scripts.inc"
	.include "data/maps/RustboroCity_DevonCorp_3F/scripts.inc"
	.include "data/maps/RustboroCity_Gym/scripts.inc"
	.include "data/maps/RustboroCity_PokemonSchool/scripts.inc"
	.include "data/maps/RustboroCity_PokemonCenter_1F/scripts.inc"
	.include "data/maps/RustboroCity_PokemonCenter_2F/scripts.inc"
	.include "data/maps/RustboroCity_Mart/scripts.inc"
	.include "data/maps/RustboroCity_Flat1_1F/scripts.inc"
	.include "data/maps/RustboroCity_Flat1_2F/scripts.inc"
	.include "data/maps/RustboroCity_House1/scripts.inc"
	.include "data/maps/RustboroCity_CuttersHouse/scripts.inc"
	.include "data/maps/RustboroCity_House2/scripts.inc"
	.include "data/maps/RustboroCity_Flat2_1F/scripts.inc"
	.include "data/maps/RustboroCity_Flat2_2F/scripts.inc"
	.include "data/maps/RustboroCity_Flat2_3F/scripts.inc"
	.include "data/maps/RustboroCity_House3/scripts.inc"
	.include "data/maps/FortreeCity_House1/scripts.inc"
	.include "data/maps/FortreeCity_Gym/scripts.inc"
	.include "data/maps/FortreeCity_PokemonCenter_1F/scripts.inc"
	.include "data/maps/FortreeCity_PokemonCenter_2F/scripts.inc"
	.include "data/maps/FortreeCity_Mart/scripts.inc"
	.include "data/maps/FortreeCity_House2/scripts.inc"
	.include "data/maps/FortreeCity_House3/scripts.inc"
	.include "data/maps/FortreeCity_House4/scripts.inc"
	.include "data/maps/FortreeCity_House5/scripts.inc"
	.include "data/maps/FortreeCity_DecorationShop/scripts.inc"
	.include "data/maps/LilycoveCity_CoveLilyMotel_1F/scripts.inc"
	.include "data/maps/LilycoveCity_CoveLilyMotel_2F/scripts.inc"
	.include "data/maps/LilycoveCity_LilycoveMuseum_1F/scripts.inc"
	.include "data/maps/LilycoveCity_LilycoveMuseum_2F/scripts.inc"
	.include "data/maps/LilycoveCity_ContestLobby/scripts.inc"
	.include "data/maps/LilycoveCity_ContestHall/scripts.inc"
	.include "data/maps/LilycoveCity_PokemonCenter_1F/scripts.inc"
	.include "data/maps/LilycoveCity_PokemonCenter_2F/scripts.inc"
	.include "data/maps/LilycoveCity_UnusedMart/scripts.inc"
	.include "data/maps/LilycoveCity_PokemonTrainerFanClub/scripts.inc"
	.include "data/maps/LilycoveCity_Harbor/scripts.inc"
	.include "data/maps/LilycoveCity_EmptyMap/scripts.inc"
	.include "data/maps/LilycoveCity_MoveDeletersHouse/scripts.inc"
	.include "data/maps/LilycoveCity_House1/scripts.inc"
	.include "data/maps/LilycoveCity_House2/scripts.inc"
	.include "data/maps/LilycoveCity_House3/scripts.inc"
	.include "data/maps/LilycoveCity_House4/scripts.inc"
	.include "data/maps/LilycoveCity_DepartmentStore_1F/scripts.inc"
	.include "data/maps/LilycoveCity_DepartmentStore_2F/scripts.inc"
	.include "data/maps/LilycoveCity_DepartmentStore_3F/scripts.inc"
	.include "data/maps/LilycoveCity_DepartmentStore_4F/scripts.inc"
	.include "data/maps/LilycoveCity_DepartmentStore_5F/scripts.inc"
	.include "data/maps/LilycoveCity_DepartmentStoreRooftop/scripts.inc"
	.include "data/maps/LilycoveCity_DepartmentStoreElevator/scripts.inc"
	.include "data/maps/MossdeepCity_Gym/scripts.inc"
	.include "data/maps/MossdeepCity_House1/scripts.inc"
	.include "data/maps/MossdeepCity_House2/scripts.inc"
	.include "data/maps/MossdeepCity_PokemonCenter_1F/scripts.inc"
	.include "data/maps/MossdeepCity_PokemonCenter_2F/scripts.inc"
	.include "data/maps/MossdeepCity_Mart/scripts.inc"
	.include "data/maps/MossdeepCity_House3/scripts.inc"
	.include "data/maps/MossdeepCity_StevensHouse/scripts.inc"
	.include "data/maps/MossdeepCity_House4/scripts.inc"
	.include "data/maps/MossdeepCity_SpaceCenter_1F/scripts.inc"
	.include "data/maps/MossdeepCity_SpaceCenter_2F/scripts.inc"
	.include "data/maps/MossdeepCity_GameCorner_1F/scripts.inc"
	.include "data/maps/MossdeepCity_GameCorner_B1F/scripts.inc"
	.include "data/maps/SootopolisCity_Gym_1F/scripts.inc"
	.include "data/maps/SootopolisCity_Gym_B1F/scripts.inc"
	.include "data/maps/SootopolisCity_PokemonCenter_1F/scripts.inc"
	.include "data/maps/SootopolisCity_PokemonCenter_2F/scripts.inc"
	.include "data/maps/SootopolisCity_Mart/scripts.inc"
	.include "data/maps/SootopolisCity_House1/scripts.inc"
	.include "data/maps/SootopolisCity_House2/scripts.inc"
	.include "data/maps/SootopolisCity_House3/scripts.inc"
	.include "data/maps/SootopolisCity_House4/scripts.inc"
	.include "data/maps/SootopolisCity_House5/scripts.inc"
	.include "data/maps/SootopolisCity_House6/scripts.inc"
	.include "data/maps/SootopolisCity_House7/scripts.inc"
	.include "data/maps/SootopolisCity_House8/scripts.inc"
	.include "data/maps/EverGrandeCity_SidneysRoom/scripts.inc"
	.include "data/maps/EverGrandeCity_PhoebesRoom/scripts.inc"
	.include "data/maps/EverGrandeCity_GlaciasRoom/scripts.inc"
	.include "data/maps/EverGrandeCity_DrakesRoom/scripts.inc"
	.include "data/maps/EverGrandeCity_ChampionsRoom/scripts.inc"
	.include "data/maps/EverGrandeCity_Corridor1/scripts.inc"
	.include "data/maps/EverGrandeCity_Corridor2/scripts.inc"
	.include "data/maps/EverGrandeCity_Corridor3/scripts.inc"
	.include "data/maps/EverGrandeCity_Corridor4/scripts.inc"
	.include "data/maps/EverGrandeCity_Corridor5/scripts.inc"
	.include "data/maps/EverGrandeCity_PokemonLeague/scripts.inc"
	.include "data/maps/EverGrandeCity_HallOfFame/scripts.inc"
	.include "data/maps/EverGrandeCity_PokemonCenter_1F/scripts.inc"
	.include "data/maps/EverGrandeCity_PokemonCenter_2F/scripts.inc"
	.include "data/maps/Route104_MrBrineysHouse/scripts.inc"
	.include "data/maps/Route104_PrettyPetalFlowerShop/scripts.inc"
	.include "data/maps/Route111_WinstrateFamilysHouse/scripts.inc"
	.include "data/maps/Route111_OldLadysRestStop/scripts.inc"
	.include "data/maps/Route112_CableCarStation/scripts.inc"
	.include "data/maps/MtChimney_CableCarStation/scripts.inc"
	.include "data/maps/Route114_FossilManiacsHouse/scripts.inc"
	.include "data/maps/Route114_FossilManiacsTunnel/scripts.inc"
	.include "data/maps/Route114_LanettesHouse/scripts.inc"
	.include "data/maps/Route116_TunnelersRestHouse/scripts.inc"
	.include "data/maps/Route117_PokemonDayCare/scripts.inc"
	.include "data/maps/Route121_SafariZoneEntrance/scripts.inc"
	.include "data/maps/MeteorFalls_1F_1R/scripts.inc"
	.include "data/maps/MeteorFalls_1F_2R/scripts.inc"
	.include "data/maps/MeteorFalls_B1F_1R/scripts.inc"
	.include "data/maps/MeteorFalls_B1F_2R/scripts.inc"
	.include "data/maps/RusturfTunnel/scripts.inc"
	.include "data/maps/Underwater_SootopolisCity/scripts.inc"
	.include "data/maps/DesertRuins/scripts.inc"
	.include "data/maps/GraniteCave_1F/scripts.inc"
	.include "data/maps/GraniteCave_B1F/scripts.inc"
	.include "data/maps/GraniteCave_B2F/scripts.inc"
	.include "data/maps/GraniteCave_StevensRoom/scripts.inc"
	.include "data/maps/PetalburgWoods/scripts.inc"
	.include "data/maps/MtChimney/scripts.inc"
	.include "data/maps/JaggedPass/scripts.inc"
	.include "data/maps/FieryPath/scripts.inc"
	.include "data/maps/MtPyre_1F/scripts.inc"
	.include "data/maps/MtPyre_2F/scripts.inc"
	.include "data/maps/MtPyre_3F/scripts.inc"
	.include "data/maps/MtPyre_4F/scripts.inc"
	.include "data/maps/MtPyre_5F/scripts.inc"
	.include "data/maps/MtPyre_6F/scripts.inc"
	.include "data/maps/MtPyre_Exterior/scripts.inc"
	.include "data/maps/MtPyre_Summit/scripts.inc"
	.include "data/maps/AquaHideout_1F/scripts.inc"
	.include "data/maps/AquaHideout_B1F/scripts.inc"
	.include "data/maps/AquaHideout_B2F/scripts.inc"
	.include "data/maps/Underwater_SeafloorCavern/scripts.inc"
	.include "data/maps/SeafloorCavern_Entrance/scripts.inc"
	.include "data/maps/SeafloorCavern_Room1/scripts.inc"
	.include "data/maps/SeafloorCavern_Room2/scripts.inc"
	.include "data/maps/SeafloorCavern_Room3/scripts.inc"
	.include "data/maps/SeafloorCavern_Room4/scripts.inc"
	.include "data/maps/SeafloorCavern_Room5/scripts.inc"
	.include "data/maps/SeafloorCavern_Room6/scripts.inc"
	.include "data/maps/SeafloorCavern_Room7/scripts.inc"
	.include "data/maps/SeafloorCavern_Room8/scripts.inc"
	.include "data/maps/SeafloorCavern_Room9/scripts.inc"
	.include "data/maps/CaveOfOrigin_Entrance/scripts.inc"
	.include "data/maps/CaveOfOrigin_1F/scripts.inc"
	.include "data/maps/CaveOfOrigin_B1F/scripts.inc"
	.include "data/maps/CaveOfOrigin_B2F/scripts.inc"
	.include "data/maps/CaveOfOrigin_B3F/scripts.inc"
	.include "data/maps/CaveOfOrigin_B4F/scripts.inc"
	.include "data/maps/VictoryRoad_1F/scripts.inc"
	.include "data/maps/VictoryRoad_B1F/scripts.inc"
	.include "data/maps/VictoryRoad_B2F/scripts.inc"
	.include "data/maps/ShoalCave_LowTideEntranceRoom/scripts.inc"
	.include "data/maps/ShoalCave_LowTideInnerRoom/scripts.inc"
	.include "data/maps/ShoalCave_LowTideStairsRoom/scripts.inc"
	.include "data/maps/ShoalCave_LowTideLowerRoom/scripts.inc"
	.include "data/maps/ShoalCave_HighTideEntranceRoom/scripts.inc"
	.include "data/maps/ShoalCave_HighTideInnerRoom/scripts.inc"
	.include "data/maps/NewMauville_Entrance/scripts.inc"
	.include "data/maps/NewMauville_Inside/scripts.inc"
	.include "data/maps/AbandonedShip_Deck/scripts.inc"
	.include "data/maps/AbandonedShip_Corridors_1F/scripts.inc"
	.include "data/maps/AbandonedShip_Rooms_1F/scripts.inc"
	.include "data/maps/AbandonedShip_Corridors_B1F/scripts.inc"
	.include "data/maps/AbandonedShip_Rooms_B1F/scripts.inc"
	.include "data/maps/AbandonedShip_Rooms2_B1F/scripts.inc"
	.include "data/maps/AbandonedShip_Underwater1/scripts.inc"
	.include "data/maps/AbandonedShip_Room_B1F/scripts.inc"
	.include "data/maps/AbandonedShip_Rooms2_1F/scripts.inc"
	.include "data/maps/AbandonedShip_CaptainsOffice/scripts.inc"
	.include "data/maps/AbandonedShip_Underwater2/scripts.inc"
	.include "data/maps/AbandonedShip_HiddenFloorCorridors/scripts.inc"
	.include "data/maps/AbandonedShip_HiddenFloorRooms/scripts.inc"
	.include "data/maps/IslandCave/scripts.inc"
	.include "data/maps/AncientTomb/scripts.inc"
	.include "data/maps/Underwater_Route134/scripts.inc"
	.include "data/maps/Underwater_SealedChamber/scripts.inc"
	.include "data/maps/SealedChamber_OuterRoom/scripts.inc"
	.include "data/maps/SealedChamber_InnerRoom/scripts.inc"
	.include "data/maps/ScorchedSlab/scripts.inc"
	.include "data/maps/MagmaHideout_1F/scripts.inc"
	.include "data/maps/MagmaHideout_B1F/scripts.inc"
	.include "data/maps/MagmaHideout_B2F/scripts.inc"
	.include "data/maps/SkyPillar_Entrance/scripts.inc"
	.include "data/maps/SkyPillar_Outside/scripts.inc"
	.include "data/maps/SkyPillar_1F/scripts.inc"
	.include "data/maps/SkyPillar_2F/scripts.inc"
	.include "data/maps/SkyPillar_3F/scripts.inc"
	.include "data/maps/SkyPillar_4F/scripts.inc"
	.include "data/maps/ShoalCave_LowTideIceRoom/scripts.inc"
	.include "data/maps/SkyPillar_5F/scripts.inc"
	.include "data/maps/SkyPillar_Top/scripts.inc"
	.include "data/maps/SecretBase_BlueCave1/scripts.inc"
	.include "data/maps/SecretBase_BlueCave2/scripts.inc"
	.include "data/maps/SecretBase_BlueCave3/scripts.inc"
	.include "data/maps/SecretBase_BlueCave4/scripts.inc"
	.include "data/maps/SecretBase_BrownCave1/scripts.inc"
	.include "data/maps/SecretBase_BrownCave2/scripts.inc"
	.include "data/maps/SecretBase_BrownCave3/scripts.inc"
	.include "data/maps/SecretBase_BrownCave4/scripts.inc"
	.include "data/maps/SecretBase_RedCave1/scripts.inc"
	.include "data/maps/SecretBase_RedCave2/scripts.inc"
	.include "data/maps/SecretBase_RedCave3/scripts.inc"
	.include "data/maps/SecretBase_RedCave4/scripts.inc"
	.include "data/maps/SecretBase_Shrub1/scripts.inc"
	.include "data/maps/SecretBase_Shrub2/scripts.inc"
	.include "data/maps/SecretBase_Shrub3/scripts.inc"
	.include "data/maps/SecretBase_Shrub4/scripts.inc"
	.include "data/maps/SecretBase_Tree1/scripts.inc"
	.include "data/maps/SecretBase_Tree2/scripts.inc"
	.include "data/maps/SecretBase_Tree3/scripts.inc"
	.include "data/maps/SecretBase_Tree4/scripts.inc"
	.include "data/maps/SecretBase_YellowCave1/scripts.inc"
	.include "data/maps/SecretBase_YellowCave2/scripts.inc"
	.include "data/maps/SecretBase_YellowCave3/scripts.inc"
	.include "data/maps/SecretBase_YellowCave4/scripts.inc"

gUnknown_0815F36C:: @ 815F36C
	lockall
	playse SE_PC_LOGON
	message UnknownString_81A3A72
	dofieldeffect FLDEFF_SECRET_BASE_PC_TURN_ON
	waitstate
	waitmessage
	waitbuttonpress
	playse SE_SELECT
	goto EventScript_15F384
	end

EventScript_15F384:
	message UnknownString_81A3A87
	waitmessage
	goto_if_set FLAG_DECORATION_16, EventScript_15F3A0
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
	msgbox UnknownString_81A38FB, MSGBOX_YESNO
	compare RESULT, NO
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
	playse SE_PC_LOGON
	dofieldeffect FLDEFF_SECRET_BASE_PC_TURN_ON
	waitstate
	waitmessage
	waitbuttonpress
	playse SE_SELECT
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
	special BufferSecretBaseOwnerName
	msgbox UnknownString_81A3958, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq EventScript_15F452
	msgbox UnknownString_81A3A22, 3
	special sub_80BC5BC
	special DoSecretBasePCTurnOffEffect
	releaseall
	end

EventScript_15F4E0:
	msgbox UnknownString_81A3982, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq EventScript_15F452
	msgbox UnknownString_81A3A3A, 3
	special sub_80BC5BC
	special DoSecretBasePCTurnOffEffect
	releaseall
	end

EventScript_15F503:
	msgbox UnknownString_81A39C0, 3
	special DoSecretBasePCTurnOffEffect
	closemessage
	releaseall
	end

EventScript_15F511:
	message UnknownString_81A3AA2
	waitmessage
	goto EventScript_15F452
	end

EventScript_15F51D:
	special DoSecretBasePCTurnOffEffect
	closemessage
	releaseall
	end

gUnknown_0815F523:: @ 815F523
	dofieldeffect FLDEFF_SAND_PILLAR
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

	.include "data/maps/SingleBattleColosseum/scripts.inc"
	.include "data/maps/TradeCenter/scripts.inc"
	.include "data/maps/RecordCorner/scripts.inc"
	.include "data/maps/DoubleBattleColosseum/scripts.inc"
	.include "data/maps/LinkContestRoom1/scripts.inc"
	.include "data/maps/LinkContestRoom2/scripts.inc"
	.include "data/maps/LinkContestRoom3/scripts.inc"
	.include "data/maps/LinkContestRoom4/scripts.inc"
	.include "data/maps/LinkContestRoom5/scripts.inc"
	.include "data/maps/LinkContestRoom6/scripts.inc"
	.include "data/maps/UnknownMap_25_29/scripts.inc"
	.include "data/maps/UnknownMap_25_30/scripts.inc"
	.include "data/maps/UnknownMap_25_31/scripts.inc"
	.include "data/maps/UnknownMap_25_32/scripts.inc"
	.include "data/maps/UnknownMap_25_33/scripts.inc"
	.include "data/maps/UnknownMap_25_34/scripts.inc"
	.include "data/maps/InsideOfTruck/scripts.inc"
	.include "data/maps/SSTidalCorridor/scripts.inc"
	.include "data/maps/SSTidalLowerDeck/scripts.inc"
	.include "data/maps/SSTidalRooms/scripts.inc"
	.include "data/maps/SafariZone_Northwest/scripts.inc"
	.include "data/maps/SafariZone_Northeast/scripts.inc"
	.include "data/maps/SafariZone_Southwest/scripts.inc"
	.include "data/maps/SafariZone_Southeast/scripts.inc"
	.include "data/maps/BattleTower_Outside/scripts.inc"
	.include "data/maps/BattleTower_Lobby/scripts.inc"
	.include "data/maps/BattleTower_Elevator/scripts.inc"
	.include "data/maps/BattleTower_Corridor/scripts.inc"
	.include "data/maps/BattleTower_BattleRoom/scripts.inc"
	.include "data/maps/SouthernIsland_Exterior/scripts.inc"
	.include "data/maps/SouthernIsland_Interior/scripts.inc"
	.include "data/maps/SafariZone_RestHouse/scripts.inc"
	.include "data/maps/Route104_Prototype/scripts.inc"
	.include "data/maps/Route104_PrototypePrettyPetalFlowerShop/scripts.inc"
	.include "data/maps/Route109_SeashoreHouse/scripts.inc"
	.include "data/maps/Route110_TrickHouseEntrance/scripts.inc"
	.include "data/maps/Route110_TrickHouseEnd/scripts.inc"
	.include "data/maps/Route110_TrickHouseCorridor/scripts.inc"
	.include "data/maps/Route110_TrickHousePuzzle1/scripts.inc"
	.include "data/maps/Route110_TrickHousePuzzle2/scripts.inc"
	.include "data/maps/Route110_TrickHousePuzzle3/scripts.inc"
	.include "data/maps/Route110_TrickHousePuzzle4/scripts.inc"
	.include "data/maps/Route110_TrickHousePuzzle5/scripts.inc"
	.include "data/maps/Route110_TrickHousePuzzle6/scripts.inc"
	.include "data/maps/Route110_TrickHousePuzzle7/scripts.inc"
	.include "data/maps/Route110_TrickHousePuzzle8/scripts.inc"
	.include "data/maps/Route110_SeasideCyclingRoadSouthEntrance/scripts.inc"
	.include "data/maps/Route110_SeasideCyclingRoadNorthEntrance/scripts.inc"
	.include "data/maps/Route113_GlassWorkshop/scripts.inc"
	.include "data/maps/Route123_BerryMastersHouse/scripts.inc"
	.include "data/maps/Route119_WeatherInstitute_1F/scripts.inc"
	.include "data/maps/Route119_WeatherInstitute_2F/scripts.inc"
	.include "data/maps/Route119_House/scripts.inc"
	.include "data/maps/Route124_DivingTreasureHuntersHouse/scripts.inc"

	.include "data/maps/PetalburgCity/text.inc"
	.include "data/maps/SlateportCity/text.inc"
	.include "data/maps/MauvilleCity/text.inc"
	.include "data/maps/RustboroCity/text.inc"
	.include "data/maps/FortreeCity/text.inc"
	.include "data/maps/LilycoveCity/text.inc"
	.include "data/maps/MossdeepCity/text.inc"
	.include "data/maps/SootopolisCity/text.inc"
	.include "data/maps/EverGrandeCity/text.inc"
	.include "data/maps/LittlerootTown/text.inc"
	.include "data/maps/OldaleTown/text.inc"
	.include "data/maps/DewfordTown/text.inc"
	.include "data/maps/LavaridgeTown/text.inc"
	.include "data/maps/FallarborTown/text.inc"
	.include "data/maps/VerdanturfTown/text.inc"
	.include "data/maps/PacifidlogTown/text.inc"
	.include "data/maps/Route101/text.inc"
	.include "data/maps/Route102/text.inc"
	.include "data/maps/Route103/text.inc"
	.include "data/maps/Route104/text.inc"
	.include "data/maps/Route105/text.inc"
	.include "data/maps/Route106/text.inc"
	.include "data/maps/Route107/text.inc"
	.include "data/maps/Route108/text.inc"
	.include "data/maps/Route109/text.inc"
	.include "data/maps/Route110/text.inc"
	.include "data/maps/Route111/text.inc"
	.include "data/maps/Route112/text.inc"
	.include "data/maps/Route113/text.inc"
	.include "data/maps/Route114/text.inc"
	.include "data/maps/Route115/text.inc"
	.include "data/maps/Route116/text.inc"
	.include "data/maps/Route117/text.inc"
	.include "data/maps/Route118/text.inc"
	.include "data/maps/Route119/text.inc"
	.include "data/maps/Route120/text.inc"
	.include "data/maps/Route121/text.inc"
	.include "data/maps/Route123/text.inc"
	.include "data/maps/Route124/text.inc"
	.include "data/maps/Route128/text.inc"
	.include "data/maps/LittlerootTown_BrendansHouse_1F/text.inc"
	.include "data/maps/LittlerootTown_BrendansHouse_2F/text.inc"
	.include "data/maps/LittlerootTown_MaysHouse_1F/text.inc"
	.include "data/maps/LittlerootTown_MaysHouse_2F/text.inc"
	.include "data/maps/LittlerootTown_ProfessorBirchsLab/text.inc"
	.include "data/maps/OldaleTown_House1/text.inc"
	.include "data/maps/OldaleTown_House2/text.inc"
	.include "data/maps/OldaleTown_PokemonCenter_1F/text.inc"
	.include "data/maps/OldaleTown_Mart/text.inc"
	.include "data/maps/DewfordTown_House1/text.inc"
	.include "data/maps/DewfordTown_PokemonCenter_1F/text.inc"
	.include "data/maps/DewfordTown_Gym/text.inc"
	.include "data/maps/DewfordTown_Hall/text.inc"
	.include "data/maps/DewfordTown_House2/text.inc"
	.include "data/maps/LavaridgeTown_HerbShop/text.inc"
	.include "data/maps/LavaridgeTown_Gym_1F/text.inc"
	.include "data/maps/LavaridgeTown_House/text.inc"
	.include "data/maps/LavaridgeTown_Mart/text.inc"
	.include "data/maps/LavaridgeTown_PokemonCenter_1F/text.inc"
	.include "data/maps/FallarborTown_Mart/text.inc"
	.include "data/maps/FallarborTown_ContestLobby/text.inc"
	.include "data/maps/FallarborTown_ContestHall/text.inc"
	.include "data/maps/FallarborTown_PokemonCenter_1F/text.inc"
	.include "data/maps/FallarborTown_House1/text.inc"
	.include "data/maps/FallarborTown_House2/text.inc"
	.include "data/maps/VerdanturfTown_ContestLobby/text.inc"
	.include "data/maps/VerdanturfTown_ContestHall/text.inc"
	.include "data/maps/VerdanturfTown_Mart/text.inc"
	.include "data/maps/VerdanturfTown_PokemonCenter_1F/text.inc"
	.include "data/maps/VerdanturfTown_WandasHouse/text.inc"
	.include "data/maps/VerdanturfTown_FriendshipRatersHouse/text.inc"
	.include "data/maps/VerdanturfTown_House/text.inc"
	.include "data/maps/PacifidlogTown_PokemonCenter_1F/text.inc"
	.include "data/maps/PacifidlogTown_House1/text.inc"
	.include "data/maps/PacifidlogTown_House2/text.inc"
	.include "data/maps/PacifidlogTown_House3/text.inc"
	.include "data/maps/PacifidlogTown_House4/text.inc"
	.include "data/maps/PacifidlogTown_House5/text.inc"
	.include "data/maps/PetalburgCity_WallysHouse/text.inc"
	.include "data/maps/PetalburgCity_Gym/text.inc"
	.include "data/maps/PetalburgCity_House1/text.inc"
	.include "data/maps/PetalburgCity_House2/text.inc"
	.include "data/maps/PetalburgCity_PokemonCenter_1F/text.inc"
	.include "data/maps/PetalburgCity_Mart/text.inc"
	.include "data/maps/SlateportCity_SternsShipyard_1F/text.inc"
	.include "data/maps/SlateportCity_SternsShipyard_2F/text.inc"
	.include "data/maps/SlateportCity_ContestLobby/text.inc"
	.include "data/maps/SlateportCity_ContestHall/text.inc"
	.include "data/maps/SlateportCity_House1/text.inc"
	.include "data/maps/SlateportCity_PokemonFanClub/text.inc"
	.include "data/maps/SlateportCity_OceanicMuseum_1F/text.inc"
	.include "data/maps/SlateportCity_OceanicMuseum_2F/text.inc"
	.include "data/maps/SlateportCity_Harbor/text.inc"
	.include "data/maps/SlateportCity_House2/text.inc"
	.include "data/maps/SlateportCity_PokemonCenter_1F/text.inc"
	.include "data/maps/SlateportCity_Mart/text.inc"
	.include "data/maps/MauvilleCity_Gym/text.inc"
	.include "data/maps/MauvilleCity_BikeShop/text.inc"
	.include "data/maps/MauvilleCity_House1/text.inc"
	.include "data/maps/MauvilleCity_GameCorner/text.inc"
	.include "data/maps/MauvilleCity_House2/text.inc"
	.include "data/maps/MauvilleCity_PokemonCenter_1F/text.inc"
	.include "data/maps/MauvilleCity_PokemonCenter_2F/text.inc"
	.include "data/maps/MauvilleCity_Mart/text.inc"
	.include "data/maps/RustboroCity_DevonCorp_1F/text.inc"
	.include "data/maps/RustboroCity_DevonCorp_2F/text.inc"
	.include "data/maps/RustboroCity_DevonCorp_3F/text.inc"
	.include "data/maps/RustboroCity_Gym/text.inc"
	.include "data/maps/RustboroCity_PokemonSchool/text.inc"
	.include "data/maps/RustboroCity_PokemonCenter_1F/text.inc"
	.include "data/maps/RustboroCity_Mart/text.inc"
	.include "data/maps/RustboroCity_Flat1_1F/text.inc"
	.include "data/maps/RustboroCity_Flat1_2F/text.inc"
	.include "data/maps/RustboroCity_House1/text.inc"
	.include "data/maps/RustboroCity_CuttersHouse/text.inc"
	.include "data/maps/RustboroCity_House2/text.inc"
	.include "data/maps/RustboroCity_Flat2_1F/text.inc"
	.include "data/maps/RustboroCity_Flat2_2F/text.inc"
	.include "data/maps/RustboroCity_Flat2_3F/text.inc"
	.include "data/maps/RustboroCity_House3/text.inc"
	.include "data/maps/FortreeCity_House1/text.inc"
	.include "data/maps/FortreeCity_Gym/text.inc"
	.include "data/maps/FortreeCity_PokemonCenter_1F/text.inc"
	.include "data/maps/FortreeCity_Mart/text.inc"
	.include "data/maps/FortreeCity_House2/text.inc"
	.include "data/maps/FortreeCity_House3/text.inc"
	.include "data/maps/FortreeCity_House4/text.inc"
	.include "data/maps/FortreeCity_House5/text.inc"
	.include "data/maps/FortreeCity_DecorationShop/text.inc"
	.include "data/maps/LilycoveCity_CoveLilyMotel_1F/text.inc"
	.include "data/maps/LilycoveCity_CoveLilyMotel_2F/text.inc"
	.include "data/maps/LilycoveCity_LilycoveMuseum_1F/text.inc"
	.include "data/maps/LilycoveCity_LilycoveMuseum_2F/text.inc"
	.include "data/maps/LilycoveCity_ContestLobby/text.inc"
	.include "data/maps/LilycoveCity_ContestHall/text.inc"
	.include "data/maps/LilycoveCity_PokemonCenter_1F/text.inc"
	.include "data/maps/LilycoveCity_PokemonTrainerFanClub/text.inc"
	.include "data/maps/LilycoveCity_Harbor/text.inc"
	.include "data/maps/LilycoveCity_MoveDeletersHouse/text.inc"
	.include "data/maps/LilycoveCity_House1/text.inc"
	.include "data/maps/LilycoveCity_House2/text.inc"
	.include "data/maps/LilycoveCity_House3/text.inc"
	.include "data/maps/LilycoveCity_House4/text.inc"
	.include "data/maps/LilycoveCity_DepartmentStore_1F/text.inc"
	.include "data/maps/LilycoveCity_DepartmentStore_2F/text.inc"
	.include "data/maps/LilycoveCity_DepartmentStore_3F/text.inc"
	.include "data/maps/LilycoveCity_DepartmentStore_4F/text.inc"
	.include "data/maps/LilycoveCity_DepartmentStore_5F/text.inc"
	.include "data/maps/LilycoveCity_DepartmentStoreRooftop/text.inc"
	.include "data/maps/MossdeepCity_Gym/text.inc"
	.include "data/maps/MossdeepCity_House1/text.inc"
	.include "data/maps/MossdeepCity_House2/text.inc"
	.include "data/maps/MossdeepCity_PokemonCenter_1F/text.inc"
	.include "data/maps/MossdeepCity_PokemonCenter_2F/text.inc"
	.include "data/maps/MossdeepCity_Mart/text.inc"
	.include "data/maps/MossdeepCity_House3/text.inc"
	.include "data/maps/MossdeepCity_StevensHouse/text.inc"
	.include "data/maps/MossdeepCity_House4/text.inc"
	.include "data/maps/MossdeepCity_SpaceCenter_1F/text.inc"
	.include "data/maps/MossdeepCity_SpaceCenter_2F/text.inc"
	.include "data/maps/MossdeepCity_GameCorner_1F/text.inc"
	.include "data/maps/MossdeepCity_GameCorner_B1F/text.inc"
	.include "data/maps/SootopolisCity_Gym_1F/text.inc"
	.include "data/maps/SootopolisCity_Gym_B1F/text.inc"
	.include "data/maps/SootopolisCity_PokemonCenter_1F/text.inc"
	.include "data/maps/SootopolisCity_Mart/text.inc"
	.include "data/maps/SootopolisCity_House1/text.inc"
	.include "data/maps/SootopolisCity_House2/text.inc"
	.include "data/maps/SootopolisCity_House3/text.inc"
	.include "data/maps/SootopolisCity_House4/text.inc"
	.include "data/maps/SootopolisCity_House5/text.inc"
	.include "data/maps/SootopolisCity_House6/text.inc"
	.include "data/maps/SootopolisCity_House7/text.inc"
	.include "data/maps/SootopolisCity_House8/text.inc"
	.include "data/maps/EverGrandeCity_SidneysRoom/text.inc"
	.include "data/maps/EverGrandeCity_PhoebesRoom/text.inc"
	.include "data/maps/EverGrandeCity_GlaciasRoom/text.inc"
	.include "data/maps/EverGrandeCity_DrakesRoom/text.inc"
	.include "data/maps/EverGrandeCity_ChampionsRoom/text.inc"
	.include "data/maps/EverGrandeCity_PokemonLeague/text.inc"
	.include "data/maps/EverGrandeCity_HallOfFame/text.inc"
	.include "data/maps/EverGrandeCity_PokemonCenter_1F/text.inc"
	.include "data/maps/Route104_MrBrineysHouse/text.inc"
	.include "data/maps/Route111_WinstrateFamilysHouse/text.inc"
	.include "data/maps/Route111_OldLadysRestStop/text.inc"
	.include "data/maps/Route112_CableCarStation/text.inc"
	.include "data/maps/MtChimney_CableCarStation/text.inc"
	.include "data/maps/Route114_FossilManiacsHouse/text.inc"
	.include "data/maps/Route114_FossilManiacsTunnel/text.inc"
	.include "data/maps/Route114_LanettesHouse/text.inc"
	.include "data/maps/Route116_TunnelersRestHouse/text.inc"
	.include "data/maps/MeteorFalls_1F_1R/text.inc"
	.include "data/maps/MeteorFalls_1F_2R/text.inc"
	.include "data/maps/RusturfTunnel/text.inc"
	.include "data/maps/GraniteCave_1F/text.inc"
	.include "data/maps/GraniteCave_StevensRoom/text.inc"
	.include "data/maps/PetalburgWoods/text.inc"
	.include "data/maps/MtChimney/text.inc"
	.include "data/maps/JaggedPass/text.inc"
	.include "data/maps/MtPyre_1F/text.inc"
	.include "data/maps/MtPyre_2F/text.inc"
	.include "data/maps/MtPyre_3F/text.inc"
	.include "data/maps/MtPyre_4F/text.inc"
	.include "data/maps/MtPyre_5F/text.inc"
	.include "data/maps/MtPyre_6F/text.inc"
	.include "data/maps/AquaHideout_1F/text.inc"
	.include "data/maps/AquaHideout_B1F/text.inc"
	.include "data/maps/AquaHideout_B2F/text.inc"
	.include "data/maps/Underwater_SeafloorCavern/text.inc"
	.include "data/maps/SeafloorCavern_Room1/text.inc"
	.include "data/maps/SeafloorCavern_Room3/text.inc"
	.include "data/maps/SeafloorCavern_Room4/text.inc"
	.include "data/maps/VictoryRoad_1F/text.inc"
	.include "data/maps/VictoryRoad_B1F/text.inc"
	.include "data/maps/VictoryRoad_B2F/text.inc"
	.include "data/maps/ShoalCave_LowTideEntranceRoom/text.inc"
	.include "data/maps/ShoalCave_LowTideInnerRoom/text.inc"
	.include "data/maps/ShoalCave_LowTideStairsRoom/text.inc"
	.include "data/maps/ShoalCave_LowTideLowerRoom/text.inc"
	.include "data/maps/NewMauville_Entrance/text.inc"
	.include "data/maps/NewMauville_Inside/text.inc"
	.include "data/maps/AbandonedShip_Corridors_1F/text.inc"
	.include "data/maps/AbandonedShip_Rooms_1F/text.inc"
	.include "data/maps/AbandonedShip_Corridors_B1F/text.inc"
	.include "data/maps/AbandonedShip_HiddenFloorCorridors/text.inc"
	.include "data/maps/AbandonedShip_Rooms_B1F/text.inc"
	.include "data/maps/AbandonedShip_Rooms2_B1F/text.inc"
	.include "data/maps/AbandonedShip_Rooms2_1F/text.inc"
	.include "data/maps/AbandonedShip_CaptainsOffice/text.inc"
	.include "data/maps/AbandonedShip_HiddenFloorRooms/text.inc"
	.include "data/maps/SecretBase_RedCave1/text.inc"
	.include "data/maps/InsideOfTruck/text.inc"
	.include "data/maps/SSTidalCorridor/text.inc"
	.include "data/maps/SSTidalLowerDeck/text.inc"
	.include "data/maps/SSTidalRooms/text.inc"
	.include "data/maps/BattleTower_Outside/text.inc"
	.include "data/maps/BattleTower_Lobby/text.inc"
	.include "data/maps/BattleTower_BattleRoom/text.inc"
	.include "data/maps/SouthernIsland_Exterior/text.inc"
	.include "data/maps/SouthernIsland_Interior/text.inc"
	.include "data/maps/Route104_Prototype/text.inc"
	.include "data/maps/Route104_PrototypePrettyPetalFlowerShop/text.inc"
	.include "data/maps/Route109_SeashoreHouse/text.inc"
	.include "data/maps/Route110_TrickHouseEntrance/text.inc"

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

	.include "data/maps/Route110_TrickHouseEnd/text.inc"
	.include "data/maps/Route110_TrickHousePuzzle1/text.inc"
	.include "data/maps/Route110_TrickHousePuzzle2/text.inc"
	.include "data/maps/Route110_TrickHousePuzzle3/text.inc"
	.include "data/maps/Route110_TrickHousePuzzle4/text.inc"
	.include "data/maps/Route110_TrickHousePuzzle5/text.inc"
	.include "data/maps/Route110_TrickHousePuzzle6/text.inc"
	.include "data/maps/Route110_TrickHousePuzzle7/text.inc"
	.include "data/maps/Route110_TrickHousePuzzle8/text.inc"
	.include "data/maps/Route110_SeasideCyclingRoadSouthEntrance/text.inc"
	.include "data/maps/Route110_SeasideCyclingRoadNorthEntrance/text.inc"
	.include "data/maps/Route113_GlassWorkshop/text.inc"
	.include "data/maps/Route123_BerryMastersHouse/text.inc"
	.include "data/maps/Route119_WeatherInstitute_1F/text.inc"
	.include "data/maps/Route119_WeatherInstitute_2F/text.inc"
	.include "data/maps/Route119_House/text.inc"
	.include "data/maps/Route124_DivingTreasureHuntersHouse/text.inc"


Std_2:
	lock
	faceplayer
	message 0x0
	waitmessage
	waitbuttonpress
	release
	return

Std_3:
	lockall
	message 0x0
	waitmessage
	waitbuttonpress
	releaseall
	return

Std_4:
	message 0x0
	waitmessage
	waitbuttonpress
	return

Std_5:
	message 0x0
	waitmessage
	yesnobox 20, 8
	return

@ 819F805
	return

S_DoSaveDialog:: @ 819F806
S_DoSaveDialog:: @ 819F806
S_DoSaveDialog:: @ 819F806
S_DoSaveDialog:: @ 819F806
S_DoSaveDialog:: @ 819F806
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
	goto_if_ne EventScript_19F83F
	special PlayTrainerEncounterMusic
	special sub_8082524
	goto EventScript_19F8F2

EventScript_19F83F:
	gotopostbattlescript

gUnknown_0819F840:: @ 819F840
	lock
	faceplayer
	call EventScript_19F8E5
	specialvar RESULT, ScrSpecial_HasTrainerBeenFought
	compare RESULT, 0
	goto_if_ne EventScript_19F877
	special CheckForAlivePartyMons
	compare RESULT, 0
	goto_if_ne EventScript_19F870
	special PlayTrainerEncounterMusic
	special sub_8082524
	goto EventScript_19F8F2

EventScript_19F870:
	special ScrSpecial_ShowTrainerNonBattlingSpeech
	waitmessage
	waitbuttonpress
	release
	end

EventScript_19F877:
	gotopostbattlescript

gUnknown_0819F878:: @ 819F878
	applymovement LAST_TALKED, Movement_19F8F0
	waitmovement 0
	special PlayTrainerEncounterMusic
	trainerbattlebegin
	gotopostbattlescript

gUnknown_0819F887:: @ 819F887
	call EventScript_19F8E5
	specialvar RESULT, ScrSpecial_GetTrainerEyeRematchFlag
	compare RESULT, 0
	goto_if_eq EventScript_19F8AD
	special PlayTrainerEncounterMusic
	special sub_8082524
	special ScrSpecial_ShowTrainerIntroSpeech
	waitmessage
	waitbuttonpress
	special ScrSpecial_StartTrainerEyeRematch
	waitstate
	releaseall
	end

EventScript_19F8AD:
	gotopostbattlescript

gUnknown_0819F8AE:: @ 819F8AE
	specialvar RESULT, ScrSpecial_GetTrainerEyeRematchFlag
	compare RESULT, 0
	goto_if_eq EventScript_19F8DD
	special CheckForAlivePartyMons
	compare RESULT, 0
	goto_if_ne EventScript_19F8DE
	special PlayTrainerEncounterMusic
	special sub_8082524
	special ScrSpecial_ShowTrainerIntroSpeech
	waitmessage
	waitbuttonpress
	special ScrSpecial_StartTrainerEyeRematch
	waitstate
	releaseall
	end

EventScript_19F8DD:
	gotopostbattlescript

EventScript_19F8DE:
	special ScrSpecial_ShowTrainerNonBattlingSpeech
	waitmessage
	waitbuttonpress
	release
	end

EventScript_19F8E5:
	applymovement LAST_TALKED, Movement_19F8F0
	waitmovement 0
	return

Movement_19F8F0::
	reveal_trainer
	end_movement

EventScript_19F8F2:
	special ScrSpecial_ShowTrainerIntroSpeech
	waitmessage
	waitbuttonpress
	trainerbattlebegin
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
	gotobeatenscript

Std_6::
	message 0x0
	waitmessage
	waitbuttonpress
	release
	return

Event_ResetBerryTrees: @ 19F940
	setberrytree 2, 7, 5
	setberrytree 1, 3, 5
	setberrytree 11, 7, 5
	setberrytree 13, 3, 5
	setberrytree 4, 7, 5
	setberrytree 76, 1, 5
	setberrytree 8, 1, 5
	setberrytree 10, 6, 5
	setberrytree 25, 20, 5
	setberrytree 26, 2, 5
	setberrytree 66, 2, 5
	setberrytree 67, 20, 5
	setberrytree 69, 22, 5
	setberrytree 70, 22, 5
	setberrytree 71, 22, 5
	setberrytree 55, 17, 5
	setberrytree 56, 17, 5
	setberrytree 5, 1, 5
	setberrytree 6, 6, 5
	setberrytree 7, 1, 5
	setberrytree 16, 18, 5
	setberrytree 17, 18, 5
	setberrytree 18, 18, 5
	setberrytree 29, 19, 5
	setberrytree 28, 19, 5
	setberrytree 27, 19, 5
	setberrytree 24, 4, 5
	setberrytree 23, 3, 5
	setberrytree 22, 3, 5
	setberrytree 21, 4, 5
	setberrytree 19, 16, 5
	setberrytree 20, 16, 5
	setberrytree 80, 7, 5
	setberrytree 81, 7, 5
	setberrytree 77, 8, 5
	setberrytree 78, 8, 5
	setberrytree 68, 8, 5
	setberrytree 31, 10, 5
	setberrytree 33, 10, 5
	setberrytree 34, 21, 5
	setberrytree 35, 21, 5
	setberrytree 36, 21, 5
	setberrytree 83, 24, 5
	setberrytree 84, 24, 5
	setberrytree 85, 10, 5
	setberrytree 86, 6, 5
	setberrytree 37, 5, 5
	setberrytree 38, 5, 5
	setberrytree 39, 5, 5
	setberrytree 40, 3, 5
	setberrytree 41, 3, 5
	setberrytree 42, 3, 5
	setberrytree 46, 19, 5
	setberrytree 45, 20, 5
	setberrytree 44, 18, 5
	setberrytree 43, 16, 5
	setberrytree 47, 8, 5
	setberrytree 48, 5, 5
	setberrytree 49, 4, 5
	setberrytree 50, 2, 5
	setberrytree 52, 18, 5
	setberrytree 53, 18, 5
	setberrytree 62, 6, 5
	setberrytree 64, 6, 5
	setberrytree 58, 21, 5
	setberrytree 59, 21, 5
	setberrytree 60, 25, 5
	setberrytree 61, 25, 5
	setberrytree 79, 23, 5
	setberrytree 14, 23, 5
	setberrytree 15, 21, 5
	setberrytree 30, 21, 5
	setberrytree 65, 25, 5
	setberrytree 72, 25, 5
	setberrytree 73, 23, 5
	setberrytree 74, 23, 5
	setberrytree 87, 3, 5
	setberrytree 88, 10, 5
	setberrytree 89, 4, 5
	setberrytree 82, 36, 5
	return

gUnknown_0819FA81:: @ 819FA81
	setflag FLAG_LINK_CONTEST_ROOM_POKEBALL
	setflag FLAG_HIDE_VICTORIA_WINSTRATE
	setflag FLAG_HIDE_VIVI_WINSTRATE
	setflag FLAG_HIDE_VICKI_WINSTRATE
	setflag FLAG_HIDE_BIRCH_IN_LAB
	setflag FLAG_HIDE_RIVAL_BIRCH_LAB
	setflag FLAG_HIDE_WALLY_PETALBURG
	setflag FLAG_UNKNOWN_363
	setflag FLAG_HIDE_GRUNT_RUSTBORO
	setflag FLAG_HIDE_DEVON_RUSTBORO
	setflag FLAG_HIDE_RIVAL_RUSTBORO
	setflag FLAG_HIDE_FAT_MAN_LITTLEROOT
	setflag FLAG_HIDE_MR_BRINEY_ROUTE104_HOUSE
	setflag FLAG_HIDE_PEEKO_BRINEY_HOUSE
	setflag FLAG_HIDE_MR_BRINEY_ROUTE104
	setflag FLAG_HIDE_MR_BRINEY_DEWFORD_TOWN
	setflag FLAG_HIDE_MR_BRINEY_ROUTE109
	setflag FLAG_HIDE_MR_BRINEY_BOAT_DEWFORD
	setflag FLAG_HIDE_MR_BRINEY_BOAT_ROUTE109
	setflag FLAG_HIDE_FLOWER_SHOP_WORKER_OUTSIDE
	setflag FLAG_UNKNOWN_2E1
	setflag FLAG_UNKNOWN_2EB
	setflag FLAG_UNKNOWN_2EC
	setflag FLAG_UNKNOWN_2ED
	setflag FLAG_UNKNOWN_2F4
	setflag FLAG_HIDE_LILYCOVE_CONTEST_ATTENDENT_1
	setflag FLAG_HIDE_ARTIST_LILCOVE_CONTEST
	setflag FLAG_HIDE_LILYCOVE_MUSEUM_PAINTING_LADY
	setflag FLAG_HIDE_LILYCOVE_MUSEUM_PAINTING_GIRL
	setflag FLAG_HIDE_LILYCOVE_MUSEUM_PAINTING_MAN
	setflag FLAG_HIDE_LILYCOVE_MUSEUM_PAINTER
	setflag FLAG_HIDE_LILYCOVE_MUSEUM_VISITORS
	setflag FLAG_HIDE_PETALBURG_GYM_GUIDE
	setflag FLAG_UNKNOWN_30E
	setflag FLAG_UNKNOWN_30F
	setflag FLAG_HIDE_NORMAN_LITTLEROOT
	setflag FLAG_HIDE_MAY_PICHU_DOLL
	setflag FLAG_HIDE_FANCLUB_OLD_LADY
	setflag FLAG_HIDE_FANCLUB_BOY
	setflag FLAG_HIDE_FANCLUB_LITTLE_BOY
	setflag FLAG_HIDE_FANCLUB_LADY
	setflag FLAG_HIDE_GABBY_AND_TY_ROUTE118_1
	setflag FLAG_HIDE_GABBY_AND_TY_ROUTE120_1
	setflag FLAG_HIDE_GABBY_AND_TY_ROUTE111_2
	setflag FLAG_HIDE_GABBY_AND_TY_ROUTE118_2
	setflag FLAG_HIDE_GABBY_AND_TY_ROUTE120_2
	setflag FLAG_HIDE_GABBY_AND_TY_ROUTE111_3
	setflag FLAG_HIDE_GABBY_AND_TY_ROUTE118_3
	setflag FLAG_HIDE_CONTEST_REPORTER_FALLARBOR
	setflag FLAG_HIDE_CONTEST_REPORTER_VERDANTURF
	setflag FLAG_HIDE_CONTEST_REPORTER_SLATEPORT
	setflag FLAG_HIDE_CONTEST_REPORTER_LILYCOVE
	setflag FLAG_HIDE_WALLY_WANDAS_HOUSE
	setflag FLAG_HIDE_BOYFRIEND_WANDAS_HOUSE
	setflag FLAG_HIDE_WALLY_FATHER_WANDAS_HOUSE
	setflag FLAG_HIDE_GIRLFRIEND_WANDAS_HOUSE
	setflag FLAG_HIDE_WALLY_FATHER_PETALBURG
	setflag FLAG_HIDE_WALLY_MOTHER_PETALBURG
	setflag FLAG_HIDE_WALLY_PETALBURG_GYM
	setflag FLAG_HIDE_WALLACE_SOOTOPOLIS_GYM
	setflag FLAG_HIDE_WALLACE_SOOTOPOLIS
	setflag FLAG_HIDE_BRINEY_SLATEPORT_SHIPYARD
	setflag FLAG_UNKNOWN_337
	setflag FLAG_HIDE_EVIL_LEADER_SEAFLOOR_CAVERN
	setflag FLAG_HIDE_OTHER_LEADER_SEAFLOOR_CAVERN
	setflag FLAG_HIDE_OTHER_TEAM_GRUNTS_SEAFLOOR_CAVERN
	setflag FLAG_HIDE_AWAKENED_MON_SEAFLOOR_CAVERN
	setflag FLAG_HIDE_STERN_SLATEPORT_HARBOR
	setflag FLAG_UNKNOWN_34B
	setflag FLAG_UNKNOWN_34C
	setflag FLAG_UNKNOWN_34F
	setflag FLAG_HIDE_GRUNT_1_SLATEPORT_HARBOR
	setflag FLAG_HIDE_GRUNT_2_SLATEPORT_HARBOR
	setflag FLAG_HIDE_SS_TIDAL_SLATEPORT_HARBOR
	setflag FLAG_HIDE_SS_TIDAL_LILYCOVE_HARBOR
	setflag FLAG_HIDE_GABBY_AND_TY_SLATEPORT
	setflag FLAG_HIDE_STERN_SLATEPORT
	setflag FLAG_HIDE_SUBMARINE_SHADOW_SLATEPORT_HARBOR
	setflag FLAG_HIDE_RIVAL_ROUTE119
	setflag FLAG_HIDE_CAVE_OF_ORIGIN_ENTRANCE_WOMAN_1
	setflag FLAG_HIDE_CAVE_OF_ORIGIN_ENTRANCE_WOMAN_2
	setflag FLAG_HIDE_STEVEN_SOOTOPOLIS
	setflag FLAG_HIDE_LANETTE
	setflag FLAG_HIDE_TRICKMASTER_ENTRANCE
	setflag FLAG_HIDE_MT_CHIMNEY_PEOPLE
	setflag FLAG_HIDE_BRINEY_RUSTURF_TUNNEL
	setflag FLAG_HIDE_BRINEY_ROUTE116
	setflag FLAG_HIDE_PEEKO_RUSTURF_TUNNEL
	setflag FLAG_HIDE_GRUNT_RUSTURF_TUNNEL
	setflag FLAG_HIDE_BOYFRIEND_RUSTURF_TUNNEL
	setflag FLAG_HIDE_GIRLFRIEND_RUSTURF_TUNNEL
	setflag FLAG_HIDE_EVIL_TEAM_LEADER_OCEANIC_MUSEUM_2F
	setflag FLAG_HIDE_GRUNT_1_OCEANIC_MUSEUM_2F
	setflag FLAG_HIDE_GRUNT_2_OCEANIC_MUSEUM_2F
	setflag FLAG_HIDE_OCEANIC_MUSEUM_VISITORS
	setflag FLAG_HIDE_BATTLE_TOWER_OPPONENT
	setflag FLAG_HIDE_AWARD_MAN_BATTLE_TOWER
	setflag FLAG_HIDE_MOM_LITTLEROOT
	setflag FLAG_HIDE_MOM_UPSTAIRS
	setflag FLAG_HIDE_WEATHER_INSTITUTE_WORKERS_1F
	setflag FLAG_UNKNOWN_BIRCH_380
	setflag FLAG_HIDE_BIRCH_ROUTE101
	setflag FLAG_HIDE_BIRCH_ROUTE103
	setflag FLAG_HIDE_FERRY_SAILOR_LILYCOVE
	setflag FLAG_HIDE_LATIOS_OR_LATIAS_FLYING
	setflag FLAG_HIDE_LATIOS_OR_LATIAS_STATIONARY
	setflag FLAG_UNKNOWN_393
	setflag FLAG_HIDE_WATTSON_MAUVILLE
	setflag FLAG_HIDE_RIVAL_CHAMPIONS_ROOM
	setflag FLAG_HIDE_BIRCH_CHAMPIONS_ROOM
	setflag FLAG_HIDE_RIVAL_ON_BIKE_ROUTE110
	setflag FLAG_HIDE_RIVAL_ROUTE119_ON_BIKE
	setflag FLAG_HIDE_LILYCOVE_MOTEL_PEOPLE
	setflag FLAG_HIDE_RIVAL_LAVARIDGE_1
	setflag FLAG_HIDE_RIVAL_LAVARIDGE_2
	setflag FLAG_HIDE_WINGULL_MOSSDEEP_HOUSE
	setflag FLAG_HIDE_OTHER_TEAM_METEOR_FALLS_1F
	setflag FLAG_HIDE_SLUDGE_BOMB_MAN_DEWFORD_HALL
	setflag FLAG_HIDE_PROF_COSMO_FALLARBOR
	setflag FLAG_HIDE_STEVEN_ROUTE128
	setflag FLAG_HIDE_EVIL_LEADER_ROUTE128
	setflag FLAG_HIDE_OTHER_LEADER_ROUTE128
	setflag FLAG_HIDE_DEVON_EMPLOYEE_ROUTE116
	setflag FLAG_HIDE_TM_SALESMAN_SLATEPORT
	setflag FLAG_HIDE_WALLY_BATTLE_VICTORY_ROAD
	setflag FLAG_HIDE_BRINEY_AND_PEEKO_SS_TIDAL
	setflag FLAG_HIDE_BELDUM_BALL_STEVENS_HOUSE
	setflag FLAG_ITEM_MOSSDEEP_STEVENS_HOUSE_1
	setflag FLAG_HIDE_STEVENS_LETTER
	setflag FLAG_HIDE_RIVAL_OLDALE_TOWN
	setflag FLAG_HIDE_WALLY_DEFEATED_VICTORY_ROAD
	setflag FLAG_HIDE_BOY_ROUTE101
	call Event_ResetBerryTrees
	end

EverGrandeCity_HallOfFame_EventScript_19FC13:: @ 819FC13
	clearflag FLAG_HIDE_LILYCOVE_MOTEL_PEOPLE
	call EverGrandeCity_HallOfFame_EventScript_19FD09
	setflag FLAG_HIDE_BRINEY_SLATEPORT_SHIPYARD
	clearflag FLAG_HIDE_BRINEY_AND_PEEKO_SS_TIDAL
	clearflag FLAG_HIDE_STEVENS_LETTER
	setvar VAR_STEVENS_HOUSE_STATE, 1
	clearflag FLAG_HIDE_WALLY_DEFEATED_VICTORY_ROAD
	clearflag FLAG_HIDE_SS_TIDAL_SLATEPORT_HARBOR
	clearflag FLAG_HIDE_SS_TIDAL_LILYCOVE_HARBOR
	special sub_810FAA0
	call_if_unset FLAG_RECEIVED_SS_TICKET, EverGrandeCity_HallOfFame_EventScript_19FC62
	call_if_unset FLAG_LATIOS_OR_LATIAS_ROAMING, EverGrandeCity_HallOfFame_EventScript_19FC70
	call_if_unset FLAG_RECEIVED_BELDUM, EverGrandeCity_HallOfFame_EventScript_19FC5A
	call_if_unset FLAG_RECEIVED_HM08, EverGrandeCity_HallOfFame_EventScript_19FC5E
	return

EverGrandeCity_HallOfFame_EventScript_19FC5A:: @ 819FC5A
	clearflag FLAG_HIDE_BELDUM_BALL_STEVENS_HOUSE
	return

EverGrandeCity_HallOfFame_EventScript_19FC5E:: @ 819FC5E
	clearflag FLAG_ITEM_MOSSDEEP_STEVENS_HOUSE_1
	return

EverGrandeCity_HallOfFame_EventScript_19FC62:: @ 819FC62
	setvar VAR_LITTLEROOT_HOUSES_STATE, 3
	setvar VAR_LITTLEROOT_HOUSES_STATE_2, 3
	clearflag FLAG_HIDE_NORMAN_LITTLEROOT
	return

EverGrandeCity_HallOfFame_EventScript_19FC70:: @ 819FC70
	setflag FLAG_SYS_TV_LATI
	return

S_WhiteOut:: @ 819FC74
	call EverGrandeCity_HallOfFame_EventScript_19FD09
	call EventScript_19FC84
	goto gUnknown_0819FC9F
	end

EventScript_19FC84:
	goto_if_set FLAG_RECEIVED_GO_GOGGLES, Route101_EventScript_1A14DC
	goto_if_unset FLAG_DEFEATED_LAVARIDGE_GYM, Route101_EventScript_1A14DC
	clearflag FLAG_HIDE_RIVAL_LAVARIDGE_1
	setvar VAR_LAVARIDGE_RIVAL_STATE, 2
	return

gUnknown_0819FC9F:: @ 819FC9F
	compare VAR_BRINEY_LOCATION, 1
	goto_if_eq EventScript_19FCC1
	compare VAR_BRINEY_LOCATION, 2
	goto_if_eq EventScript_19FCD7
	compare VAR_BRINEY_LOCATION, 3
	goto_if_eq EventScript_19FCF0
	end

EventScript_19FCC1:
	setflag FLAG_HIDE_MR_BRINEY_DEWFORD_TOWN
	setflag FLAG_HIDE_MR_BRINEY_BOAT_DEWFORD
	setflag FLAG_HIDE_MR_BRINEY_ROUTE109
	setflag FLAG_HIDE_MR_BRINEY_BOAT_ROUTE109
	clearflag FLAG_HIDE_MR_BRINEY_BOAT_ROUTE104
	clearflag FLAG_HIDE_MR_BRINEY_ROUTE104_HOUSE
	clearflag FLAG_HIDE_PEEKO_BRINEY_HOUSE
	end

EventScript_19FCD7:
	setflag FLAG_HIDE_MR_BRINEY_ROUTE109
	setflag FLAG_HIDE_MR_BRINEY_BOAT_ROUTE109
	setflag FLAG_HIDE_MR_BRINEY_ROUTE104
	setflag FLAG_HIDE_MR_BRINEY_BOAT_ROUTE104
	setflag FLAG_HIDE_MR_BRINEY_ROUTE104_HOUSE
	setflag FLAG_HIDE_PEEKO_BRINEY_HOUSE
	clearflag FLAG_HIDE_MR_BRINEY_DEWFORD_TOWN
	clearflag FLAG_HIDE_MR_BRINEY_BOAT_DEWFORD
	end

EventScript_19FCF0:
	setflag FLAG_HIDE_MR_BRINEY_ROUTE104
	setflag FLAG_HIDE_MR_BRINEY_BOAT_ROUTE104
	setflag FLAG_HIDE_MR_BRINEY_ROUTE104_HOUSE
	setflag FLAG_HIDE_PEEKO_BRINEY_HOUSE
	setflag FLAG_HIDE_MR_BRINEY_DEWFORD_TOWN
	setflag FLAG_HIDE_MR_BRINEY_BOAT_DEWFORD
	clearflag FLAG_HIDE_MR_BRINEY_ROUTE109
	clearflag FLAG_HIDE_MR_BRINEY_BOAT_ROUTE109
	end

EverGrandeCity_HallOfFame_EventScript_19FD09:: @ 819FD09
	clearflag FLAG_DEFEATED_ELITE_4_SYDNEY
	clearflag FLAG_DEFEATED_ELITE_4_PHOEBE
	clearflag FLAG_DEFEATED_ELITE_4_GLACIA
	clearflag FLAG_DEFEATED_ELITE_4_DRAKE
	setvar VAR_ELITE_4_STATE, 0
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
	goto_if_unset FLAG_RECEIVED_POKENAV, OldaleTown_PokemonCenter_1F_EventScript_1A14DC
	goto_if_set FLAG_DEFEATED_PETALBURG_GYM, OldaleTown_PokemonCenter_1F_EventScript_1A14DC
	goto_if_unset FLAG_HIDE_MR_BRINEY_BOAT_ROUTE104, OldaleTown_PokemonCenter_1F_EventScript_19FD49
	goto_if_unset FLAG_HIDE_MR_BRINEY_DEWFORD_TOWN, OldaleTown_PokemonCenter_1F_EventScript_19FD4F
	goto_if_unset FLAG_HIDE_MR_BRINEY_ROUTE109, OldaleTown_PokemonCenter_1F_EventScript_19FD55
	return

OldaleTown_PokemonCenter_1F_EventScript_19FD49:: @ 819FD49
	setvar VAR_BRINEY_LOCATION, 1
	return

OldaleTown_PokemonCenter_1F_EventScript_19FD4F:: @ 819FD4F
	setvar VAR_BRINEY_LOCATION, 2
	return

OldaleTown_PokemonCenter_1F_EventScript_19FD55:: @ 819FD55
	setvar VAR_BRINEY_LOCATION, 3
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
	compare RESULT, YES
	goto_if_eq OldaleTown_PokemonCenter_1F_EventScript_19FD7C
	compare RESULT, NO
	goto_if_eq OldaleTown_PokemonCenter_1F_EventScript_19FDC7
	end

OldaleTown_PokemonCenter_1F_EventScript_19FD7C:: @ 819FD7C
	incrementgamestat GAME_STAT_USED_POKECENTER
	message gText_NurseJoy_OkayIllTakeYourPokemon
	waitmessage
	applymovement VAR_SPECIAL_B, OldaleTown_PokemonCenter_1F_Movement_1A083F
	waitmovement 0
	dofieldeffect FLDEFF_POKECENTER_HEAL
	waitfieldeffect FLDEFF_POKECENTER_HEAL
	applymovement VAR_SPECIAL_B, OldaleTown_PokemonCenter_1F_Movement_1A0845
	waitmovement 0
	special ScrSpecial_HealPlayerParty
	goto_if_unset FLAG_POKERUS_EXPLAINED, OldaleTown_PokemonCenter_1F_EventScript_19FDCE
	goto OldaleTown_PokemonCenter_1F_EventScript_19FDB0
	end

OldaleTown_PokemonCenter_1F_EventScript_19FDB0:: @ 819FDB0
	message gText_NurseJoy_ThankYouForWaiting
	waitmessage
	applymovement VAR_SPECIAL_B, OldaleTown_PokemonCenter_1F_Movement_19FDF4
	waitmovement 0
	message gText_NurseJoy_WeHopeToSeeYouAgain
	waitmessage
	return

OldaleTown_PokemonCenter_1F_EventScript_19FDC7:: @ 819FDC7
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
	setflag FLAG_POKERUS_EXPLAINED
	return

OldaleTown_PokemonCenter_1F_Movement_19FDF4:: @ 819FDF4
	nurse_joy_bow
	delay_4
	end_movement

Std_ObtainItem: @ 819FDF7
	giveitem VAR_SPECIAL_0, VAR_SPECIAL_1
	copyvar VAR_SPECIAL_7, RESULT
	call Std_ObtainItem_
	return

Std_ObtainItem_: @ 819FE07
	bufferitemname 1, VAR_SPECIAL_0
	checkitemtype VAR_SPECIAL_0
	call GetItem_HandlePocket
	compare VAR_SPECIAL_7, 0x1
	call_if_eq Std_ObtainItem_Success
	compare VAR_SPECIAL_7, 0x0
	call_if_eq Std_ObtainItem_Fail
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
	bufferstdstring 2, 0xE
	compare VAR_SPECIAL_7, 1
	call_if_eq PlayGetItemFanfare
	return

GetItem_HandlePocket_KeyItems:
	bufferstdstring 2, 0xF
	compare VAR_SPECIAL_7, 1
	call_if_eq PlayGetItemFanfare
	return

GetItem_HandlePocket_PokeBalls:
	bufferstdstring 2, 0x10
	compare VAR_SPECIAL_7, 1
	call_if_eq PlayGetItemFanfare
	return

GetItem_HandlePocket_TMsHMs:
	bufferstdstring 2, 0x11
	compare VAR_SPECIAL_7, 1
	call_if_eq PlayGetTMHMFanfare
	return

GetItem_HandlePocket_Berries:
	bufferstdstring 2, 0x12
	compare VAR_SPECIAL_7, 1
	call_if_eq PlayGetItemFanfare
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
	playfanfare MUS_FANFA4
	return

PlayGetTMHMFanfare:
	playfanfare MUS_ME_WAZA
	return

Std_ObtainDecoration: @ 819FEDA
	givedecoration VAR_SPECIAL_0
	copyvar VAR_SPECIAL_7, RESULT
	call Std_ObtainDecoration_
	return

Std_ObtainDecoration_: @ 819FEE8
	bufferdecorationname 1, VAR_SPECIAL_0
	compare VAR_SPECIAL_7, 1
	call_if_eq Std_ObtainDecoration_Success
	compare VAR_SPECIAL_7, 0
	call_if_eq Std_ObtainDecoration_Fail
	return

Std_ObtainDecoration_Success: @ 819FF03
	playfanfare MUS_FANFA4
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
	giveitem VAR_SPECIAL_0, VAR_SPECIAL_1
	copyvar VAR_SPECIAL_7, RESULT
	bufferitemname 1, VAR_SPECIAL_0
	checkitemtype VAR_SPECIAL_0
	call GetItem_HandlePocket
	compare VAR_SPECIAL_7, 1
	call_if_eq Std_FindItem_Success
	compare VAR_SPECIAL_7, 0
	call_if_eq Std_FindItem_Fail
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
	giveitem VAR_SPECIAL_5, 1
	copyvar VAR_SPECIAL_7, RESULT
	bufferitemname 0x1, VAR_SPECIAL_5
	checkitemtype VAR_SPECIAL_5
	call GetItem_HandlePocket
	compare VAR_SPECIAL_7, 1
	goto_if_eq HiddenItemScript_Success
	compare VAR_SPECIAL_7, 0
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
	msgbox UnusedMixRecordsPromptText, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq UnusedMixRecordsScript_Yes
	compare RESULT, NO
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
	waitbuttonpress
	release
	end

gUnknown_081A0009:: @ 81A0009
	lockall
	setvar VAR_SPECIAL_4, 0
	special DoPCTurnOnEffect
	playse SE_PC_ON
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
	playse SE_PC_LOGON
	msgbox UnknownString_81A0A54, 4
	special PlayerPC
	waitstate
	goto EventScript_1A0023
	end

EventScript_1A0085:
	playse SE_PC_LOGON
	call_if_unset FLAG_SYS_PC_LANETTE, EventScript_1A00AC
	call_if_set FLAG_SYS_PC_LANETTE, EventScript_1A00B5
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
	setvar VAR_SPECIAL_4, 0
	playse SE_PC_OFF
	special DoPCTurnOffEffect
	releaseall
	end

EventScript_1A00CB:
	goto_if_unset FLAG_SYS_GAME_CLEAR, EventScript_1A00BE
	playse SE_PC_LOGON
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
	clearflag FLAG_HIDE_PETALBURG_GYM_GUIDE
	setflag FLAG_PETALBURG_MART_EXPANDED_ITEMS
	return

DewfordTown_EventScript_1A0102:: @ 81A0102
DewfordTown_Hall_EventScript_1A0102:: @ 81A0102
	dodailyevents
	setvar VAR_SPECIAL_4, 0
	special BufferTrendyPhraseString
	return

DewfordTown_EventScript_1A010C:: @ 81A010C
Route104_MrBrineysHouse_EventScript_1A010C:: @ 81A010C
Route109_EventScript_1A010C:: @ 81A010C
	copyvar VAR_SPECIAL_8, VAR_BRINEY_LOCATION
	setvar VAR_BRINEY_LOCATION, 0
	return

UseSurfScript:: @ 81A0117
	checkpartymove MOVE_SURF
	compare RESULT, 6
	goto_if_eq UseSurfScript_NoMon
	bufferpartymonnick 0, RESULT
	setfieldeffectargument 0, RESULT
	lockall
	msgbox UseSurfPromptText, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq UseSurfScript_No
	msgbox UsedSurfText, 4
	dofieldeffect FLDEFF_USE_SURF
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
	setvar VAR_OBJ_GFX_ID_0, EVENT_OBJ_GFX_RIVAL_MAY_NORMAL
	return

RustboroCity_EventScript_1A016C:: @ 81A016C
	setvar VAR_OBJ_GFX_ID_0, EVENT_OBJ_GFX_RIVAL_BRENDAN_NORMAL
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
	setvar VAR_OBJ_GFX_ID_3, EVENT_OBJ_GFX_RIVAL_MAY_MACH_BIKE
	return

LavaridgeTown_EventScript_1A0190:: @ 81A0190
	setvar VAR_OBJ_GFX_ID_3, EVENT_OBJ_GFX_RIVAL_BRENDAN_MACH_BIKE
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
	setvar VAR_OBJ_GFX_ID_1, EVENT_OBJ_GFX_AQUA_MEMBER_M
	setvar VAR_OBJ_GFX_ID_2, EVENT_OBJ_GFX_AQUA_MEMBER_F
	setvar VAR_OBJ_GFX_ID_4, EVENT_OBJ_GFX_MAGMA_MEMBER_M
	setvar VAR_OBJ_GFX_ID_5, EVENT_OBJ_GFX_MAGMA_MEMBER_F
	setvar VAR_OBJ_GFX_ID_6, EVENT_OBJ_GFX_ARCHIE
	setvar VAR_OBJ_GFX_ID_7, EVENT_OBJ_GFX_MAXIE
	.else
	setvar VAR_OBJ_GFX_ID_1, EVENT_OBJ_GFX_MAGMA_MEMBER_M
	setvar VAR_OBJ_GFX_ID_2, EVENT_OBJ_GFX_MAGMA_MEMBER_F
	setvar VAR_OBJ_GFX_ID_4, EVENT_OBJ_GFX_AQUA_MEMBER_M
	setvar VAR_OBJ_GFX_ID_5, EVENT_OBJ_GFX_AQUA_MEMBER_F
	setvar VAR_OBJ_GFX_ID_6, EVENT_OBJ_GFX_MAXIE
	setvar VAR_OBJ_GFX_ID_7, EVENT_OBJ_GFX_ARCHIE
	.endif
	return

CaveOfOrigin_B4F_EventScript_1A01B5:: @ 81A01B5
SeafloorCavern_Room9_EventScript_1A01B5:: @ 81A01B5
	.ifdef SAPPHIRE
	setvar VAR_OBJ_GFX_ID_8, EVENT_OBJ_GFX_KYOGRE_1
	setvar VAR_OBJ_GFX_ID_9, EVENT_OBJ_GFX_KYOGRE_2
	.else
	setvar VAR_OBJ_GFX_ID_8, EVENT_OBJ_GFX_GROUDON_1
	setvar VAR_OBJ_GFX_ID_9, EVENT_OBJ_GFX_GROUDON_2
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
	switch VAR_SPECIAL_8
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
	settrainerflag TRAINER_JOSH
	settrainerflag TRAINER_TOMMY
	return

DewfordTown_Gym_EventScript_1A0225:: @ 81A0225
	settrainerflag TRAINER_HIDEKI
	settrainerflag TRAINER_TESSA
	settrainerflag TRAINER_LAURA
	return

DewfordTown_Gym_EventScript_1A022F:: @ 81A022F
	settrainerflag TRAINER_KIRK
	settrainerflag TRAINER_SHAWN
	settrainerflag TRAINER_BEN
	settrainerflag TRAINER_VIVIAN
	return

DewfordTown_Gym_EventScript_1A023C:: @ 81A023C
	settrainerflag TRAINER_COLE
	settrainerflag TRAINER_AXLE
	settrainerflag TRAINER_ANDY
	settrainerflag TRAINER_ZANE
	settrainerflag TRAINER_SADIE
	return

DewfordTown_Gym_EventScript_1A024C:: @ 81A024C
	settrainerflag TRAINER_RANDALL
	settrainerflag TRAINER_PARKER
	settrainerflag TRAINER_GEORGE
	settrainerflag TRAINER_BERKE
	settrainerflag TRAINER_MARY
	settrainerflag TRAINER_LORI
	settrainerflag TRAINER_JODY
	return

DewfordTown_Gym_EventScript_1A0262:: @ 81A0262
	settrainerflag TRAINER_JARED
	settrainerflag TRAINER_TERRELL
	settrainerflag TRAINER_KYLEE
	settrainerflag TRAINER_WILL
	return

DewfordTown_Gym_EventScript_1A026F:: @ 81A026F
	settrainerflag TRAINER_PRESTON
	settrainerflag TRAINER_VIRGIL
	settrainerflag TRAINER_FRITZ
	settrainerflag TRAINER_HANNAH
	settrainerflag TRAINER_SAMANTHA
	settrainerflag TRAINER_MAURA
	return

DewfordTown_Gym_EventScript_1A0282:: @ 81A0282
	settrainerflag TRAINER_ANDREA
	settrainerflag TRAINER_CRISSY
	settrainerflag TRAINER_BRIANNA_2
	settrainerflag TRAINER_CONNIE
	settrainerflag TRAINER_BRIDGET
	settrainerflag TRAINER_OLIVIA
	settrainerflag TRAINER_TIFFANY
	settrainerflag TRAINER_MARISSA
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
	setweather WEATHER_RAIN_HEAVY
	.else
	setweather WEATHER_DROUGHT
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
	playfanfare MUS_ME_BACHI
	waitfanfare
	return

LittlerootTown_BrendansHouse_1F_EventScript_1A02CA:: @ 81A02CA
Route111_OldLadysRestStop_EventScript_1A02CA:: @ 81A02CA
Route119_WeatherInstitute_1F_EventScript_1A02CA:: @ 81A02CA
SSTidalRooms_EventScript_1A02CA:: @ 81A02CA
	fadescreen 1
	playfanfare MUS_ME_ASA
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
	setflag FLAG_SPECIAL_FLAG_1
	playbgm MUS_M_BOAT, FALSE
	return

DewfordTown_EventScript_1A02EF:: @ 81A02EF
Route104_EventScript_1A02EF:: @ 81A02EF
Route109_EventScript_1A02EF:: @ 81A02EF
	clearflag FLAG_SPECIAL_FLAG_1
	fadedefaultbgm
	return

LittlerootTown_ProfessorBirchsLab_EventScript_1A02F4:: @ 81A02F4
Route101_EventScript_1A02F4:: @ 81A02F4
Route103_EventScript_1A02F4:: @ 81A02F4
	compare VAR_PETALBURG_GYM_STATE, 0
	goto_if_eq Route101_EventScript_1A14DC
	compare VAR_BIRCH_STATE, 0
	call_if_eq Route101_EventScript_1A0358
	compare VAR_BIRCH_STATE, 1
	call_if_eq Route101_EventScript_1A0358
	compare VAR_BIRCH_STATE, 2
	call_if_eq Route101_EventScript_1A0365
	compare VAR_BIRCH_STATE, 3
	call_if_eq Route101_EventScript_1A0365
	compare VAR_BIRCH_STATE, 4
	call_if_eq Route101_EventScript_1A0372
	compare VAR_BIRCH_STATE, 5
	call_if_eq Route101_EventScript_1A0372
	compare VAR_BIRCH_STATE, 6
	call_if_eq Route101_EventScript_1A0358
	compare VAR_BIRCH_STATE, 7
	call_if_eq Route101_EventScript_1A0358
	return

Route101_EventScript_1A0358:: @ 81A0358
	clearflag FLAG_HIDE_BIRCH_IN_LAB
	clearflag FLAG_UNKNOWN_BIRCH_380
	setflag FLAG_HIDE_BIRCH_ROUTE101
	setflag FLAG_HIDE_BIRCH_ROUTE103
	return

Route101_EventScript_1A0365:: @ 81A0365
	clearflag FLAG_HIDE_BIRCH_ROUTE101
	setflag FLAG_HIDE_BIRCH_IN_LAB
	setflag FLAG_UNKNOWN_BIRCH_380
	setflag FLAG_HIDE_BIRCH_ROUTE103
	return

Route101_EventScript_1A0372:: @ 81A0372
	clearflag FLAG_HIDE_BIRCH_ROUTE103
	setflag FLAG_HIDE_BIRCH_ROUTE101
	setflag FLAG_HIDE_BIRCH_IN_LAB
	setflag FLAG_UNKNOWN_BIRCH_380
	return

LittlerootTown_ProfessorBirchsLab_EventScript_1A037F:: @ 81A037F
Route101_EventScript_1A037F:: @ 81A037F
Route103_EventScript_1A037F:: @ 81A037F
	lock
	faceplayer
	msgbox Route101_Text_1C4449, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq Route101_EventScript_1A039B
	call Route101_EventScript_1A03B0
	release
	end

Route101_EventScript_1A039B:: @ 81A039B
	msgbox Route101_Text_1C449B, 4
	release
	end

Route101_EventScript_1A03A5:: @ 81A03A5
	copyvar VAR_SPECIAL_4, VAR_SPECIAL_9
	special ShowPokedexRatingMessage
	waitmessage
	waitbuttonpress
	return

EverGrandeCity_ChampionsRoom_EventScript_1A03B0:: @ 81A03B0
Route101_EventScript_1A03B0:: @ 81A03B0
	setvar VAR_SPECIAL_4, 0
	specialvar RESULT, ScriptGetPokedexInfo
	copyvar VAR_SPECIAL_8, VAR_SPECIAL_5
	copyvar VAR_SPECIAL_9, VAR_SPECIAL_6
	copyvar VAR_SPECIAL_A, RESULT
	buffernumberstring 0, VAR_SPECIAL_8
	buffernumberstring 1, VAR_SPECIAL_9
	msgbox Route101_Text_1C44DC, 4
	call Route101_EventScript_1A03A5
	compare VAR_SPECIAL_A, 0
	goto_if_eq Route101_EventScript_1A14DC
	setvar VAR_SPECIAL_4, 1
	specialvar RESULT, ScriptGetPokedexInfo
	copyvar VAR_SPECIAL_8, VAR_SPECIAL_5
	copyvar VAR_SPECIAL_9, VAR_SPECIAL_6
	buffernumberstring 0, VAR_SPECIAL_8
	buffernumberstring 1, VAR_SPECIAL_9
	msgbox Route101_Text_1C4B05, 4
	return

BattleTower_Outside_EventScript_1A040E:: @ 81A040E
LilycoveCity_Harbor_EventScript_1A040E:: @ 81A040E
SlateportCity_Harbor_EventScript_1A040E:: @ 81A040E
	delay 60
	applymovement VAR_SPECIAL_4, SlateportCity_Harbor_Movement_1A041C
	waitmovement 0
	return

SlateportCity_Harbor_Movement_1A041C:: @ 81A041C
	walk_slow_right
	walk_slow_right
	walk_slow_right
	walk_right
	walk_right
	walk_right
	walk_right
	end_movement

PetalburgCity_Gym_EventScript_1A0424:: @ 81A0424
	setflag FLAG_HIDE_MR_BRINEY_DEWFORD_TOWN
	setflag FLAG_HIDE_MR_BRINEY_BOAT_DEWFORD
	setflag FLAG_HIDE_MR_BRINEY_ROUTE109
	setflag FLAG_HIDE_MR_BRINEY_BOAT_ROUTE109
	setflag FLAG_HIDE_MR_BRINEY_ROUTE104
	setflag FLAG_HIDE_MR_BRINEY_BOAT_ROUTE104
	setflag FLAG_HIDE_MR_BRINEY_ROUTE104_HOUSE
	setflag FLAG_HIDE_PEEKO_BRINEY_HOUSE
	setvar VAR_BRINEY_LOCATION, 0
	return

RusturfTunnel_EventScript_1A0442:: @ 81A0442
	removeobject 1
	removeobject 10
	clearflag FLAG_HIDE_BOYFRIEND_WANDAS_HOUSE
	clearflag FLAG_HIDE_GIRLFRIEND_WANDAS_HOUSE
	setvar VAR_RUSTURF_TUNNEL_STATE, 6
	setflag FLAG_RUSTURF_TUNNEL_OPENED
	return

EventScript_1A0457: @ unreferenced?
	delay 30
	applymovement 255, SlateportCity_OceanicMuseum_2F_Movement_1A0841
	waitmovement 0
	showobjectat 255, MAP_PETALBURG_CITY
	delay 30
	applymovement 255, Movement_1A047A
	waitmovement 0
	delay 30
	return

Movement_1A047A:
	walk_up
	end_movement

BattleTower_Outside_EventScript_1A047C:: @ 81A047C
SouthernIsland_Exterior_EventScript_1A047C:: @ 81A047C
	compare FACING, 1
	call_if_eq BattleTower_Outside_EventScript_160B2F
	compare FACING, 3
	call_if_eq BattleTower_Outside_EventScript_160B3A
	delay 30
	hideobjectat 255, MAP_PETALBURG_CITY
	call BattleTower_Outside_EventScript_1A040E
	return

CaveOfOrigin_B4F_EventScript_1A04A0:: @ 81A04A0
	lockall
	waitse
	playmoncry SPECIES_GROUDON_OR_KYOGRE, 2
	waitmoncry
	setvar VAR_TEMP_5, 1
	releaseall
	end

CaveOfOrigin_1F_EventScript_1A04AF:: @ 81A04AF
CaveOfOrigin_B1F_EventScript_1A04AF:: @ 81A04AF
CaveOfOrigin_B2F_EventScript_1A04AF:: @ 81A04AF
CaveOfOrigin_B3F_EventScript_1A04AF:: @ 81A04AF
	lockall
	setvar VAR_TEMP_1, 1
	goto CaveOfOrigin_1F_EventScript_1A04D3
	end

CaveOfOrigin_B2F_EventScript_1A04BB:: @ 81A04BB
CaveOfOrigin_B3F_EventScript_1A04BB:: @ 81A04BB
	lockall
	setvar VAR_TEMP_2, 1
	goto CaveOfOrigin_B2F_EventScript_1A04D3
	end

@ 81A04C7
	lockall
	setvar VAR_TEMP_3, 1
	goto CaveOfOrigin_B2F_EventScript_1A04D3
	end

CaveOfOrigin_1F_EventScript_1A04D3:: @ 81A04D3
CaveOfOrigin_B2F_EventScript_1A04D3:: @ 81A04D3
	setvar VAR_SPECIAL_4, 1
	setvar VAR_SPECIAL_5, 1
	special sub_810F758
	waitstate
	releaseall
	end

CaveOfOrigin_1F_EventScript_1A04E3:: @ 81A04E3
CaveOfOrigin_B1F_EventScript_1A04E3:: @ 81A04E3
CaveOfOrigin_B2F_EventScript_1A04E3:: @ 81A04E3
CaveOfOrigin_B3F_EventScript_1A04E3:: @ 81A04E3
CaveOfOrigin_B4F_EventScript_1A04E3:: @ 81A04E3
	setvar VAR_TEMP_1, 1
	setvar VAR_TEMP_2, 1
	setvar VAR_TEMP_3, 1
	setvar VAR_TEMP_4, 1
	setvar VAR_TEMP_5, 1
	return

AquaHideout_B1F_EventScript_1A04FD:: @ 81A04FD
MagmaHideout_B1F_EventScript_1A04FD:: @ 81A04FD
	lock
	faceplayer
	setwildbattle SPECIES_ELECTRODE, 30, ITEM_NONE
	waitse
	playmoncry SPECIES_ELECTRODE, 2
	delay 40
	waitmoncry
	setflag FLAG_HIDE_ELECTRODE_1_HIDEOUT
	setflag FLAG_SYS_CTRL_OBJ_DELETE
	dowildbattle
	clearflag FLAG_SYS_CTRL_OBJ_DELETE
	release
	end

AquaHideout_B1F_EventScript_1A051B:: @ 81A051B
MagmaHideout_B1F_EventScript_1A051B:: @ 81A051B
	lock
	faceplayer
	setwildbattle SPECIES_ELECTRODE, 30, ITEM_NONE
	waitse
	playmoncry SPECIES_ELECTRODE, 2
	delay 40
	waitmoncry
	setflag FLAG_HIDE_ELECTRODE_2_HIDEOUT
	setflag FLAG_SYS_CTRL_OBJ_DELETE
	dowildbattle
	clearflag FLAG_SYS_CTRL_OBJ_DELETE
	release
	end

Route120_EventScript_1A0539:: @ 81A0539
	lock
	faceplayer
	setvar VAR_SPECIAL_4, 1
	goto Route120_EventScript_1A0594
	end

Route120_EventScript_1A0546:: @ 81A0546
	lock
	faceplayer
	setvar VAR_SPECIAL_4, 2
	goto Route120_EventScript_1A0594
	end

Route120_EventScript_1A0553:: @ 81A0553
	lock
	faceplayer
	setvar VAR_SPECIAL_4, 3
	goto Route120_EventScript_1A0594
	end

Route120_EventScript_1A0560:: @ 81A0560
	lock
	faceplayer
	setvar VAR_SPECIAL_4, 4
	goto Route120_EventScript_1A0594
	end

Route120_EventScript_1A056D:: @ 81A056D
	lock
	faceplayer
	setvar VAR_SPECIAL_4, 5
	goto Route120_EventScript_1A0594
	end

Route119_EventScript_1A057A:: @ 81A057A
	lock
	faceplayer
	setvar VAR_SPECIAL_4, 6
	goto Route119_EventScript_1A0594
	end

Route119_EventScript_1A0587:: @ 81A0587
	lock
	faceplayer
	setvar VAR_SPECIAL_4, 7
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
	msgbox Route119_Text_171BB6, MSGBOX_YESNO
	compare RESULT, YES
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
	playmoncry SPECIES_KECLEON, 2
	delay 40
	waitmoncry
	setwildbattle SPECIES_KECLEON, 30, ITEM_NONE
	compare VAR_SPECIAL_4, 1
	call_if_eq Route119_EventScript_1A0646
	compare VAR_SPECIAL_4, 2
	call_if_eq Route119_EventScript_1A064A
	compare VAR_SPECIAL_4, 3
	call_if_eq Route119_EventScript_1A064E
	compare VAR_SPECIAL_4, 4
	call_if_eq Route119_EventScript_1A0652
	compare VAR_SPECIAL_4, 5
	call_if_eq Route119_EventScript_1A0656
	compare VAR_SPECIAL_4, 6
	call_if_eq Route119_EventScript_1A065A
	compare VAR_SPECIAL_4, 7
	call_if_eq Route119_EventScript_1A065E
	setflag FLAG_SYS_CTRL_OBJ_DELETE
	dowildbattle
	clearflag FLAG_SYS_CTRL_OBJ_DELETE
	release
	end

Route119_EventScript_1A0646:: @ 81A0646
	setflag FLAG_HIDE_KECLEON_ROUTE120_3
	return

Route119_EventScript_1A064A:: @ 81A064A
	setflag FLAG_HIDE_KECLEON_ROUTE120_4
	return

Route119_EventScript_1A064E:: @ 81A064E
	setflag FLAG_HIDE_KECLEON_ROUTE120_5
	return

Route119_EventScript_1A0652:: @ 81A0652
	setflag FLAG_HIDE_KECLEON_ROUTE120_6
	return

Route119_EventScript_1A0656:: @ 81A0656
	setflag FLAG_HIDE_KECLEON_ROUTE120_7
	return

Route119_EventScript_1A065A:: @ 81A065A
	setflag FLAG_HIDE_KECLEON_ROUTE119_1
	return

Route119_EventScript_1A065E:: @ 81A065E
	setflag FLAG_HIDE_KECLEON_ROUTE119_2
	return

FortreeCity_Movement_1A0662:: @ 81A0662
Route119_Movement_1A0662:: @ 81A0662
Route120_Movement_1A0662:: @ 81A0662
	set_visible
	delay_4
	set_invisible
	delay_4
	set_visible
	delay_4
	set_invisible
	delay_4
	set_visible
	delay_8
	set_invisible
	delay_8
	set_visible
	delay_8
	set_invisible
	delay_8
	set_visible
	delay_16
	set_invisible
	delay_16
	set_visible
	end_movement

LittlerootTown_ProfessorBirchsLab_EventScript_1A0678:: @ 81A0678
MossdeepCity_StevensHouse_EventScript_1A0678:: @ 81A0678
RustboroCity_DevonCorp_2F_EventScript_1A0678:: @ 81A0678
SlateportCity_House1_EventScript_1A0678:: @ 81A0678
	fadescreen 1
	special ChangePokemonNickname
	waitstate
	return

FallarborTown_House1_EventScript_1A067F:: @ 81A067F
GraniteCave_StevensRoom_EventScript_1A067F:: @ 81A067F
MtPyre_Summit_EventScript_1A067F:: @ 81A067F
SlateportCity_OceanicMuseum_2F_EventScript_1A067F:: @ 81A067F
	bufferitemname 0, VAR_SPECIAL_4
	playfanfare MUS_ME_WAZA
	message FallarborTown_House1_Text_1A1498
	waitmessage
	waitfanfare
	takeitem VAR_SPECIAL_4, 1
	return

EverGrandeCity_DrakesRoom_EventScript_1A0693:: @ 81A0693
EverGrandeCity_GlaciasRoom_EventScript_1A0693:: @ 81A0693
EverGrandeCity_PhoebesRoom_EventScript_1A0693:: @ 81A0693
EverGrandeCity_SidneysRoom_EventScript_1A0693:: @ 81A0693
	applymovement 255, EverGrandeCity_SidneysRoom_Movement_1A0853
	waitmovement 0
	playse SE_DOOR
	setmetatile 6, 1, 836, 0
	setmetatile 6, 2, 837, 0
	setmetatile 0, 2, 734, 1
	setmetatile 1, 2, 733, 1
	setmetatile 2, 2, 734, 1
	setmetatile 3, 2, 733, 1
	setmetatile 4, 2, 734, 1
	setmetatile 8, 2, 733, 1
	setmetatile 9, 2, 734, 1
	setmetatile 10, 2, 733, 1
	setmetatile 11, 2, 734, 1
	setmetatile 12, 2, 733, 1
	special DrawWholeMapView
	return

EverGrandeCity_DrakesRoom_EventScript_1A0710:: @ 81A0710
EverGrandeCity_GlaciasRoom_EventScript_1A0710:: @ 81A0710
EverGrandeCity_PhoebesRoom_EventScript_1A0710:: @ 81A0710
EverGrandeCity_SidneysRoom_EventScript_1A0710:: @ 81A0710
	applymovement 255, EverGrandeCity_SidneysRoom_Movement_1A0847
	waitmovement 0
	playse SE_TRACK_DOOR
	setmetatile 5, 12, 518, 1
	setmetatile 6, 12, 518, 1
	setmetatile 7, 12, 518, 1
	setmetatile 5, 13, 526, 1
	setmetatile 6, 13, 526, 1
	setmetatile 7, 13, 526, 1
	special DrawWholeMapView
	return

EverGrandeCity_DrakesRoom_EventScript_1A0757:: @ 81A0757
EverGrandeCity_GlaciasRoom_EventScript_1A0757:: @ 81A0757
EverGrandeCity_PhoebesRoom_EventScript_1A0757:: @ 81A0757
EverGrandeCity_SidneysRoom_EventScript_1A0757:: @ 81A0757
	setmetatile 6, 1, 836, 0
	setmetatile 6, 2, 837, 0
	setmetatile 5, 12, 518, 1
	setmetatile 6, 12, 518, 1
	setmetatile 7, 12, 518, 1
	setmetatile 5, 13, 526, 1
	setmetatile 6, 13, 526, 1
	setmetatile 7, 13, 526, 1
	setmetatile 0, 2, 734, 1
	setmetatile 1, 2, 733, 1
	setmetatile 2, 2, 734, 1
	setmetatile 3, 2, 733, 1
	setmetatile 4, 2, 734, 1
	setmetatile 8, 2, 733, 1
	setmetatile 9, 2, 734, 1
	setmetatile 10, 2, 733, 1
	setmetatile 11, 2, 734, 1
	setmetatile 12, 2, 733, 1
	return

EverGrandeCity_DrakesRoom_EventScript_1A07FA:: @ 81A07FA
EverGrandeCity_GlaciasRoom_EventScript_1A07FA:: @ 81A07FA
EverGrandeCity_PhoebesRoom_EventScript_1A07FA:: @ 81A07FA
EverGrandeCity_SidneysRoom_EventScript_1A07FA:: @ 81A07FA
	setmetatile 5, 12, 518, 1
	setmetatile 6, 12, 518, 1
	setmetatile 7, 12, 518, 1
	setmetatile 5, 13, 526, 1
	setmetatile 6, 13, 526, 1
	setmetatile 7, 13, 526, 1
	return

SlateportCity_Movement_1A0831:: @ 81A0831
	emote_question_mark
	end_movement

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
	emote_exclamation_mark
	end_movement

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
	delay_16
	delay_16
	delay_16
	end_movement

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
	face_player
	end_movement

@ 81A083B
	face_away_player
	end_movement

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
	face_original_direction
	end_movement

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
	walk_in_place_fastest_left
	end_movement

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
	walk_in_place_fastest_up
	end_movement

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
	walk_in_place_fastest_right
	end_movement

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
	walk_in_place_fastest_down
	end_movement

EverGrandeCity_SidneysRoom_Movement_1A0847:: @ 81A0847
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	end_movement

EverGrandeCity_ChampionsRoom_Movement_1A084E:: @ 81A084E
	walk_up
	walk_up
	walk_up
	walk_up
	end_movement

EverGrandeCity_SidneysRoom_Movement_1A0853:: @ 81A0853
	delay_16
	delay_16
	end_movement

Route110_TrickHouseEntrance_Movement_1A0856:: @ 81A0856
	walk_up
	end_movement

@ 81A0858
	walk_up
	walk_up
	end_movement

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

gText_NurseJoy_Welcome:: @ 81A0A7D
	.string "Willkommen im POKéMON-CENTER!\p"
	.string "Wir heilen deine POKéMON und\n"
	.string "machen sie wieder fit.\p"
	.string "O.K. Wir benötigen deine POKéMON.$"

gText_NurseJoy_WeHopeToSeeYouAgain:: @ 81A0AFA
	.string "Komm jederzeit wieder vorbei!$"

gText_NurseJoy_ThankYouForWaiting:: @ 81A0B14
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

gText_NurseJoy_OkayIllTakeYourPokemon:: @ 81A1245
	.string "Okay, ich nehme deine POKéMON für einen\n"
	.string "Moment in meine Obhut.$"

gText_NurseJoy_Pokerus:: @ 81A1275
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
	special ExecuteWhiteOut
	waitstate
	compare RESULT, 1
	goto_if_eq EventScript_1A14CA
	releaseall
	end

EventScript_1A14CA::
	message UnknownString_81A1141
	waitmessage
	waitbuttonpress
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

	.include "data/scripts/debug.inc"
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
	special sub_80BB70C
	special CheckPlayerHasSecretBase
	compare RESULT, 1
	goto_if_eq AskToMoveSecretBase
	checkpartymove MOVE_SECRET_POWER
	setfieldeffectargument 0, RESULT
	buffermovename 1, MOVE_SECRET_POWER
	compare VAR_SPECIAL_7, 1
	goto_if_eq EventScript_1A2CB0
	compare VAR_SPECIAL_7, 2
	goto_if_eq EventScript_1A2CB0
	compare VAR_SPECIAL_7, 3
	goto_if_eq EventScript_1A2CB0
	compare VAR_SPECIAL_7, 4
	goto_if_eq EventScript_1A2CB0
	compare VAR_SPECIAL_7, 5
	goto_if_eq EventScript_1A2D08
	compare VAR_SPECIAL_7, 6
	goto_if_eq EventScript_1A2D60
	end

EventScript_1A2CB0:
	lockall
	compare RESULT, 6
	goto_if_eq EventScript_1A2CF1
	bufferpartymonnick 0, RESULT
	msgbox UnknownString_8198F34, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq EventScript_1A2F3A
	msgbox UsedCutRockSmashText, 4
	closemessage
	dofieldeffect FLDEFF_USE_SECRET_POWER_CAVE
	waitstate
	goto EventScript_1A2CFA
	end

DoSecretBaseCaveFieldEffectScript:: @ 81A2CE6
	lockall
	dofieldeffect FLDEFF_USE_SECRET_POWER_CAVE
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
	bufferpartymonnick 0, RESULT
	msgbox UnknownString_81A197B, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq EventScript_1A2F3A
	msgbox UsedCutRockSmashText, 4
	closemessage
	dofieldeffect FLDEFF_USE_SECRET_POWER_TREE
	waitstate
	goto EventScript_1A2D52
	end

DoSecretBaseTreeFieldEffectScript:: @ 81A2D3E
	lockall
	dofieldeffect FLDEFF_USE_SECRET_POWER_TREE
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
	bufferpartymonnick 0, RESULT
	msgbox UnknownString_81A1A4B, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq EventScript_1A2F3A
	msgbox UsedCutRockSmashText, 4
	closemessage
	dofieldeffect FLDEFF_USE_SECRET_POWER_SHRUB
	waitstate
	goto EventScript_1A2DAA
	end

DoSecretBaseShrubFieldEffectScript:: @ 81A2D96
	lockall
	dofieldeffect FLDEFF_USE_SECRET_POWER_SHRUB
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
	playse SE_KAIDAN
	setvar VAR_0x4097, 0
	setflag FLAG_DECORATION_1
	special sub_80BB8CC
	special sub_80BBAF0
	setvar VAR_SPECIAL_4, 0
	setvar VAR_SPECIAL_5, 0
	special sub_80BBDD0
	setvar VAR_0x4089, 1
	waitstate
	end

SecretBase_RedCave1_EventScript_1A2DDE:: @ 81A2DDE
	applymovement 255, SecretBase_RedCave1_Movement_1A2E11
	waitmovement 0
	setvar VAR_0x4097, 1
	msgbox SecretBase_RedCave1_Text_198F89, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq SecretBase_RedCave1_EventScript_1A2E08
	closemessage
	playse SE_KAIDAN
	special sub_80BC440
	end

SecretBase_RedCave1_EventScript_1A2E08:: @ 81A2E08
	closemessage
	setflag FLAG_RECEIVED_SECRET_POWER
	special sub_80BBC78
	waitstate
	end

SecretBase_RedCave1_Movement_1A2E11:: @ 81A2E11
	walk_up
	walk_up
	end_movement

gUnknown_081A2E14:: @ 81A2E14
	lockall
	setvar VAR_0x4097, 1
	playse SE_KAIDAN
	special sub_80BC114
	compare RESULT, 0
	goto_if_eq EventScript_1A2E38
	clearflag FLAG_DECORATION_1
	special sub_80BBAF0
	setvar VAR_0x4089, 0
	waitstate
	end

EventScript_1A2E38:
	setflag FLAG_DECORATION_1
	special sub_80BBAF0
	setvar VAR_0x4089, 0
	waitstate
	end

AskToMoveSecretBase:
	checkpartymove MOVE_SECRET_POWER
	compare RESULT, 6
	goto_if_eq EventScript_1A2EF7
	setfieldeffectargument 0, RESULT
	setorcopyvar VAR_SPECIAL_4, RESULT
	lockall
	special GetSecretBaseNearbyMapName
	msgbox UnknownString_81A3C71, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq EventScript_1A2F3A
	msgbox UnknownString_81A38FB, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq EventScript_1A2F3A
	fadescreen 1
	special MoveSecretBase
	closemessage
	fadescreen 0
	msgbox UnknownString_81A3CC9, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq EventScript_1A2F3A
	bufferpartymonnick 0, VAR_SPECIAL_4
	buffermovename 1, MOVE_SECRET_POWER
	msgbox UsedCutRockSmashText, 4
	closemessage
	closemessage
	compare VAR_SPECIAL_7, 1
	goto_if_eq DoSecretBaseCaveFieldEffectScript
	compare VAR_SPECIAL_7, 2
	goto_if_eq DoSecretBaseCaveFieldEffectScript
	compare VAR_SPECIAL_7, 3
	goto_if_eq DoSecretBaseCaveFieldEffectScript
	compare VAR_SPECIAL_7, 4
	goto_if_eq DoSecretBaseCaveFieldEffectScript
	compare VAR_SPECIAL_7, 5
	goto_if_eq DoSecretBaseTreeFieldEffectScript
	compare VAR_SPECIAL_7, 6
	goto_if_eq DoSecretBaseShrubFieldEffectScript
	releaseall
	end

EventScript_1A2EF7::
	compare VAR_SPECIAL_7, 1
	goto_if_eq EventScript_1A2CF1
	compare VAR_SPECIAL_7, 2
	goto_if_eq EventScript_1A2CF1
	compare VAR_SPECIAL_7, 3
	goto_if_eq EventScript_1A2CF1
	compare VAR_SPECIAL_7, 4
	goto_if_eq EventScript_1A2CF1
	compare VAR_SPECIAL_7, 5
	goto_if_eq EventScript_1A2D49
	compare VAR_SPECIAL_7, 6
	goto_if_eq EventScript_1A2DA1
	end

EventScript_1A2F3A::
	closemessage
	releaseall
	end

LittlerootTown_BrendansHouse_2F_EventScript_1A2F3D:: @ 81A2F3D
LittlerootTown_MaysHouse_2F_EventScript_1A2F3D:: @ 81A2F3D
SecretBase_RedCave1_EventScript_1A2F3D:: @ 81A2F3D
	setflag FLAG_DECORATION_2
	setflag FLAG_DECORATION_3
	setflag FLAG_DECORATION_4
	setflag FLAG_DECORATION_5
	setflag FLAG_DECORATION_6
	setflag FLAG_DECORATION_7
	setflag FLAG_DECORATION_8
	setflag FLAG_DECORATION_9
	setflag FLAG_DECORATION_10
	setflag FLAG_DECORATION_11
	setflag FLAG_DECORATION_12
	setflag FLAG_DECORATION_13
	setflag FLAG_DECORATION_14
	setflag FLAG_DECORATION_15
	return

LittlerootTown_BrendansHouse_2F_EventScript_1A2F68:: @ 81A2F68
LittlerootTown_MaysHouse_2F_EventScript_1A2F68:: @ 81A2F68
SecretBase_RedCave1_EventScript_1A2F68:: @ 81A2F68
	setvar VAR_SPECIAL_4, 0
	setvar VAR_SPECIAL_5, 0
	special sub_80BBDD0
	setvar VAR_0x4089, 1
	end

gUnknown_081A2F7B:: @ 81A2F7B
	setvar VAR_SPECIAL_5, 0
	goto EventScript_1A2F86
	end

EventScript_1A2F86:
	special sub_80FF474
	end

gUnknown_081A2F8A:: @ 81A2F8A
	setvar VAR_SPECIAL_4, 0
	goto EventScript_1A2F95
	end

EventScript_1A2F95:
	special sub_8100A7C
	compare RESULT, 1
	goto_if_eq EventScript_1A2FBF
	addvar VAR_SPECIAL_4, 1
	compare VAR_SPECIAL_5, 0
	goto_if_eq EventScript_1A2F95
	removeobject VAR_SPECIAL_6
	setflag VAR_SPECIAL_5
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
	compare VAR_SPECIAL_4, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A3032
	compare VAR_SPECIAL_4, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A30AE
	compare VAR_SPECIAL_4, 2
	goto_if_eq SecretBase_RedCave1_EventScript_1A312A
	compare VAR_SPECIAL_4, 3
	goto_if_eq SecretBase_RedCave1_EventScript_1A31A6
	compare VAR_SPECIAL_4, 4
	goto_if_eq SecretBase_RedCave1_EventScript_1A3222
	compare VAR_SPECIAL_4, 5
	goto_if_eq SecretBase_RedCave1_EventScript_1A329E
	compare VAR_SPECIAL_4, 6
	goto_if_eq SecretBase_RedCave1_EventScript_1A331A
	compare VAR_SPECIAL_4, 7
	goto_if_eq SecretBase_RedCave1_EventScript_1A3396
	compare VAR_SPECIAL_4, 8
	goto_if_eq SecretBase_RedCave1_EventScript_1A3412
	compare VAR_SPECIAL_4, 9
	goto_if_eq SecretBase_RedCave1_EventScript_1A348E
	end

SecretBase_RedCave1_EventScript_1A3032:: @ 81A3032
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A3086
	compare RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A30A5
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A1AEA, MSGBOX_YESNO
	compare RESULT, NO
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
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A3102
	compare RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A3121
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A1E67, MSGBOX_YESNO
	compare RESULT, NO
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
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A317E
	compare RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A319D
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A218F, MSGBOX_YESNO
	compare RESULT, NO
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
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A31FA
	compare RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A3219
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A24E1, MSGBOX_YESNO
	compare RESULT, NO
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
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A3276
	compare RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A3295
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A2830, MSGBOX_YESNO
	compare RESULT, NO
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
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A32F2
	compare RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A3311
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A1CB2, MSGBOX_YESNO
	compare RESULT, NO
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
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A336E
	compare RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A338D
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A2026, MSGBOX_YESNO
	compare RESULT, NO
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
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A33EA
	compare RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A3409
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A236A, MSGBOX_YESNO
	compare RESULT, NO
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
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A3466
	compare RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A3485
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A2663, MSGBOX_YESNO
	compare RESULT, NO
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
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A34E2
	compare RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A3501
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A2A13, MSGBOX_YESNO
	compare RESULT, NO
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
	setvar VAR_SPECIAL_4, 1
	setvar VAR_SPECIAL_5, 0
	special StartSpecialBattle
	waitstate
	special ScrSpecial_HealPlayerParty
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
	special InterviewAfter
	incrementgamestat GAME_STAT_GOT_INTERVIEWED
	release
	end

SlateportCity_PokemonFanClub_EventScript_1ADE4D:: @ 81ADE4D
	setvar VAR_SPECIAL_5, 1
	special InterviewBefore
	compare RESULT, 1
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1ADED6
	copyvar VAR_SPECIAL_9, VAR_SPECIAL_6
	msgbox SlateportCity_PokemonFanClub_Text_1A8704, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1ADE84
	compare RESULT, NO
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1ADEB9
	end

SlateportCity_PokemonFanClub_EventScript_1ADE84:: @ 81ADE84
	msgbox SlateportCity_PokemonFanClub_Text_1A87CA, 4
	setvar VAR_SPECIAL_4, 5
	copyvar VAR_SPECIAL_5, VAR_SPECIAL_9
	setvar VAR_SPECIAL_6, 1
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
	setvar VAR_SPECIAL_5, 1
	goto SlateportCity_PokemonFanClub_EventScript_1ADE46
	end

SlateportCity_PokemonFanClub_EventScript_1ADED6:: @ 81ADED6
	msgbox SlateportCity_PokemonFanClub_Text_1A86B5, 4
	release
	end

SlateportCity_OceanicMuseum_1F_EventScript_1ADEE0:: @ 81ADEE0
	lock
	faceplayer
	setvar VAR_SPECIAL_5, 2
	special InterviewBefore
	compare RESULT, 1
	goto_if_eq SlateportCity_OceanicMuseum_1F_EventScript_1ADF96
	copyvar VAR_SPECIAL_9, VAR_SPECIAL_6
	goto_if_set FLAG_OCEANIC_MUSEUM_MET_REPORTER, SlateportCity_OceanicMuseum_1F_EventScript_1ADF25
	setflag FLAG_OCEANIC_MUSEUM_MET_REPORTER
	msgbox SlateportCity_OceanicMuseum_1F_Text_1A927F, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq SlateportCity_OceanicMuseum_1F_EventScript_1ADF44
	compare RESULT, NO
	goto_if_eq SlateportCity_OceanicMuseum_1F_EventScript_1ADF79
	end

SlateportCity_OceanicMuseum_1F_EventScript_1ADF25:: @ 81ADF25
	msgbox SlateportCity_OceanicMuseum_1F_Text_1A934C, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq SlateportCity_OceanicMuseum_1F_EventScript_1ADF44
	compare RESULT, NO
	goto_if_eq SlateportCity_OceanicMuseum_1F_EventScript_1ADF79
	end

SlateportCity_OceanicMuseum_1F_EventScript_1ADF44:: @ 81ADF44
	msgbox SlateportCity_OceanicMuseum_1F_Text_1A93D1, 4
	setvar VAR_SPECIAL_4, 5
	copyvar VAR_SPECIAL_5, VAR_SPECIAL_9
	setvar VAR_SPECIAL_6, 0
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
	setvar VAR_SPECIAL_5, 2
	goto SlateportCity_OceanicMuseum_1F_EventScript_1ADE46
	end

SlateportCity_OceanicMuseum_1F_EventScript_1ADF96:: @ 81ADF96
	msgbox SlateportCity_OceanicMuseum_1F_Text_1A952E, 4
	release
	end

SlateportCity_PokemonFanClub_EventScript_1ADFA0:: @ 81ADFA0
	lock
	faceplayer
	specialvar RESULT, LeadMonNicknamed
	compare RESULT, 0
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1ADE4D
	setvar VAR_SPECIAL_5, 3
	special InterviewBefore
	compare RESULT, 1
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1AE0AC
	copyvar VAR_SPECIAL_9, VAR_SPECIAL_6
	msgbox SlateportCity_PokemonFanClub_Text_1A82F1, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1ADFE9
	compare RESULT, NO
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1AE0A2
	end

SlateportCity_PokemonFanClub_EventScript_1ADFE9:: @ 81ADFE9
	msgbox SlateportCity_PokemonFanClub_Text_1A83D0, 4
	random 3
	copyvar VAR_SPECIAL_A, RESULT
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
	setvar VAR_SPECIAL_4, 7
	copyvar VAR_SPECIAL_5, VAR_SPECIAL_9
	setvar VAR_SPECIAL_6, 0
	call SlateportCity_PokemonFanClub_EventScript_1A00F3
	lock
	faceplayer
	compare RESULT, 0
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1AE0A2
	msgbox SlateportCity_PokemonFanClub_Text_1A852D, 4
	setvar VAR_SPECIAL_6, 1
	call SlateportCity_PokemonFanClub_EventScript_1A00F3
	lock
	faceplayer
	compare RESULT, 0
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1AE0A2
	msgbox SlateportCity_PokemonFanClub_Text_1A85A6, 4
	copyvar VAR_SPECIAL_7, VAR_SPECIAL_A
	setvar VAR_SPECIAL_5, 3
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
	goto_if_set FLAG_TEMP_2, FallarborTown_ContestLobby_EventScript_1AE17E
	setvar VAR_SPECIAL_5, 6
	special InterviewBefore
	compare RESULT, 1
	goto_if_eq FallarborTown_ContestLobby_EventScript_1AE17E
	copyvar VAR_SPECIAL_9, VAR_SPECIAL_6
	msgbox FallarborTown_ContestLobby_Text_1A6F7C, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq FallarborTown_ContestLobby_EventScript_1AE0F8
	compare RESULT, NO
	goto_if_eq FallarborTown_ContestLobby_EventScript_1AE12D
	end

FallarborTown_ContestLobby_EventScript_1AE0F8:: @ 81AE0F8
	msgbox FallarborTown_ContestLobby_Text_1A704E, 4
	setvar VAR_SPECIAL_4, 11
	copyvar VAR_SPECIAL_5, VAR_SPECIAL_9
	setvar VAR_SPECIAL_6, 0
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
	setvar VAR_SPECIAL_4, 24
	special SetContestCategoryStringVarForInterview
	msgbox FallarborTown_ContestLobby_Text_1A70A5, 4
	setvar VAR_SPECIAL_4, 11
	copyvar VAR_SPECIAL_5, VAR_SPECIAL_9
	setvar VAR_SPECIAL_6, 1
	call FallarborTown_ContestLobby_EventScript_1A00F3
	lock
	faceplayer
	compare RESULT, 0
	goto_if_eq FallarborTown_ContestLobby_EventScript_1AE12D
	msgbox FallarborTown_ContestLobby_Text_1A7153, 4
	setflag FLAG_TEMP_2
	setvar VAR_SPECIAL_5, 6
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
	compare VAR_LINK_CONTEST_ROOM_STATE, 2
	goto_if_ne FallarborTown_ContestLobby_EventScript_1AE1FE
	setvar VAR_SPECIAL_5, 6
	special InterviewBefore
	compare RESULT, 1
	goto_if_eq FallarborTown_ContestLobby_EventScript_1AE1FE
	switch VAR_CONTEST_LOCATION
	case 0, FallarborTown_ContestLobby_EventScript_1AE1FE
	case 2, FallarborTown_ContestLobby_EventScript_1AE1EE
	case 1, FallarborTown_ContestLobby_EventScript_1AE1F2
	case 3, FallarborTown_ContestLobby_EventScript_1AE1F6
	case 4, FallarborTown_ContestLobby_EventScript_1AE1FA
	case 5, FallarborTown_ContestLobby_EventScript_1AE1FE
	end

FallarborTown_ContestLobby_EventScript_1AE1EE:: @ 81AE1EE
	clearflag FLAG_HIDE_CONTEST_REPORTER_FALLARBOR
	return

FallarborTown_ContestLobby_EventScript_1AE1F2:: @ 81AE1F2
	clearflag FLAG_HIDE_CONTEST_REPORTER_VERDANTURF
	return

FallarborTown_ContestLobby_EventScript_1AE1F6:: @ 81AE1F6
	clearflag FLAG_HIDE_CONTEST_REPORTER_SLATEPORT
	return

FallarborTown_ContestLobby_EventScript_1AE1FA:: @ 81AE1FA
	clearflag FLAG_HIDE_CONTEST_REPORTER_LILYCOVE
	return

FallarborTown_ContestLobby_EventScript_1AE1FE:: @ 81AE1FE
	return

BattleTower_Lobby_EventScript_1AE1FF:: @ 81AE1FF
	lock
	faceplayer
	goto_if_set FLAG_TEMP_2, BattleTower_Lobby_EventScript_1AE2E3
	setvar VAR_SPECIAL_5, 7
	special InterviewBefore
	compare RESULT, 1
	goto_if_eq BattleTower_Lobby_EventScript_1AE2E3
	copyvar VAR_SPECIAL_9, VAR_SPECIAL_6
	msgbox BattleTower_Lobby_Text_1A776D, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq BattleTower_Lobby_EventScript_1AE241
	compare RESULT, NO
	goto_if_eq BattleTower_Lobby_EventScript_1AE297
	end

BattleTower_Lobby_EventScript_1AE241:: @ 81AE241
	message BattleTower_Lobby_Text_1A7823
	waitmessage
	multichoice 19, 8, 45, 1
	copyvar VAR_SPECIAL_8, RESULT
	compare RESULT, 0
	call_if_eq BattleTower_Lobby_EventScript_1AE2A1
	compare RESULT, 1
	call_if_eq BattleTower_Lobby_EventScript_1AE2AA
	msgbox BattleTower_Lobby_Text_1A79EB, 4
	setvar VAR_SPECIAL_4, 12
	copyvar VAR_SPECIAL_5, VAR_SPECIAL_9
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
	setflag FLAG_TEMP_2
	copyvar VAR_SPECIAL_4, VAR_SPECIAL_8
	setvar VAR_SPECIAL_5, 7
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
	compare VAR_BRAVO_TRAINER_BATTLE_TOWER_ON, 0
	goto_if_eq BattleTower_Lobby_EventScript_1AE30F
	setvar VAR_SPECIAL_5, 7
	special InterviewBefore
	compare RESULT, 1
	goto_if_eq BattleTower_Lobby_EventScript_1AE30F
	clearflag FLAG_HIDE_REPORTER_BATTLE_TOWER
	return

BattleTower_Lobby_EventScript_1AE30F:: @ 81AE30F
	setflag FLAG_HIDE_REPORTER_BATTLE_TOWER
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
	animateflash 1
	setflashradius 1
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
	.string "SCHUTZ wirkt nicht mehr...$"

	.include "data/scripts/safari_zone.inc"
	.include "data/text/safari_zone.inc"

MauvilleCity_GameCorner_EventScript_1C407E:: @ 81C407E
	checkitem ITEM_COIN_CASE, 1
	compare RESULT, 0
	goto_if_eq MauvilleCity_GameCorner_EventScript_1572B5
	setvar VAR_SPECIAL_4, 0
	getpricereduction 2
	compare RESULT, 0
	goto_if_eq MauvilleCity_GameCorner_EventScript_1C40DA
	addvar VAR_SPECIAL_4, 128
	goto MauvilleCity_GameCorner_EventScript_1C40DA
	end

MauvilleCity_GameCorner_EventScript_1C40AC:: @ 81C40AC
	checkitem ITEM_COIN_CASE, 1
	compare RESULT, 0
	goto_if_eq MauvilleCity_GameCorner_EventScript_1572B5
	setvar VAR_SPECIAL_4, 1
	getpricereduction 2
	compare RESULT, 0
	goto_if_eq MauvilleCity_GameCorner_EventScript_1C40DA
	addvar VAR_SPECIAL_4, 128
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
	map_script_2 VAR_ICE_STEP_COUNT, 0, S_FallDownHole
	.2byte 0

GraniteCave_B1F_MapScript1_1C6BBF:: @ 81C6BBF
MtPyre_2F_MapScript1_1C6BBF:: @ 81C6BBF
SkyPillar_2F_MapScript1_1C6BBF:: @ 81C6BBF
SkyPillar_4F_MapScript1_1C6BBF:: @ 81C6BBF
	copyvar VAR_ICE_STEP_COUNT, 0x1
	end

S_FallDownHole:: @ 81C6BC5
	lockall
	delay 20
	applymovement 255, GraniteCave_B1F_Movement_1C6BF7
	waitmovement 0
	playse SE_RU_HYUU
	delay 60
	warphole MAP_UNDEFINED
	waitstate
	end

gUnknown_081C6BDE:: @ 81C6BDE
	lockall
	delay 20
	applymovement 255, GraniteCave_B1F_Movement_1C6BF7
	waitmovement 0
	playse SE_RU_HYUU
	delay 60
	special sp13F_fall_to_last_warp
	waitstate
	end

GraniteCave_B1F_Movement_1C6BF7:: @ 81C6BF7
	set_invisible
	end_movement

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
	waitbuttonpress
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
