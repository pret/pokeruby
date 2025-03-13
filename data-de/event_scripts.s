#include "constants/global.h"
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
#include "constants/metatile_labels.h"
#include "constants/battle_setup.h"
#include "constants/map_scripts.h"
#include "constants/pokemon.h"
#include "constants/berry.h"
#include "constants/script_menu.h"
#include "constants/field_weather.h"
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
	.4byte Std_ObtainItem              @ STD_OBTAIN_ITEM
	.4byte Std_FindItem                @ STD_FIND_ITEM
	.4byte Std_MsgboxNPC               @ MSGBOX_NPC
	.4byte Std_MsgboxSign              @ MSGBOX_SIGN
	.4byte Std_MsgboxDefault           @ MSGBOX_DEFAULT
	.4byte Std_MsgboxYesNo             @ MSGBOX_YESNO
	.4byte Std_MsgboxAutoclose         @ MSGBOX_AUTOCLOSE
	.4byte Std_ObtainDecoration        @ STD_OBTAIN_DECORATION
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
	.include "data/scripts/shared_secret_base.inc"
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
	.include "data/maps/AbandonedShip_Rooms_B1F/text.inc"
	.include "data/maps/AbandonedShip_Rooms2_B1F/text.inc"
	.include "data/maps/AbandonedShip_Rooms2_1F/text.inc"
	.include "data/maps/AbandonedShip_CaptainsOffice/text.inc"
	.include "data/maps/AbandonedShip_HiddenFloorCorridors/text.inc"
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

Route110_TrickHousePuzzle1_Text_FoundAScroll:: @ 819C1B8
	.string "{PLAYER} findet eine Schriftrolle.$"

Route110_TrickHousePuzzle1_Text_MemorizedTheCode:: @ 819C1CB
	.string "{PLAYER} lernt den geheimen Code, der\n"
	.string "auf der Schriftrolle steht, auswendig.$"

Route110_TrickHousePuzzle1_Text_SecretCodeOnIt:: @ 819C1FF
	.string "Dort steht ein geheimer Code.$"

Route110_TrickHousePuzzle_Text_DoorLockedWriteSecretCodeHere: @ 819C21F
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

	.include "data/scripts/std_msgbox.inc"
	.include "data/scripts/trainer_battle.inc"
	.include "data/scripts/new_game.inc"
	.include "data/scripts/hall_of_fame.inc"

EventScript_WhiteOut:: @ 819FC74
	call EverGrandeCity_HallOfFame_EventScript_ResetEliteFour
	call EventScript_TryReadyRivalForGoGoggles
	goto EventScript_ResetMrBriney
	end

EventScript_TryReadyRivalForGoGoggles:
	goto_if_set FLAG_RECEIVED_GO_GOGGLES, Common_EventScript_Return
	goto_if_unset FLAG_DEFEATED_LAVARIDGE_GYM, Common_EventScript_Return
	clearflag FLAG_HIDE_RIVAL_LAVARIDGE_1
	setvar VAR_LAVARIDGE_RIVAL_STATE, 2
	return

EventScript_ResetMrBriney:: @ 819FC9F
	compare VAR_BRINEY_LOCATION, 1
	goto_if_eq EventScript_MoveMrBrineyToHouse
	compare VAR_BRINEY_LOCATION, 2
	goto_if_eq EventScript_MoveMrBrineyToDewford
	compare VAR_BRINEY_LOCATION, 3
	goto_if_eq EventScript_MoveMrBrineyToRoute109
	end

EventScript_MoveMrBrineyToHouse:
	setflag FLAG_HIDE_MR_BRINEY_DEWFORD_TOWN
	setflag FLAG_HIDE_MR_BRINEY_BOAT_DEWFORD
	setflag FLAG_HIDE_MR_BRINEY_ROUTE109
	setflag FLAG_HIDE_MR_BRINEY_BOAT_ROUTE109
	clearflag FLAG_HIDE_MR_BRINEY_BOAT_ROUTE104
	clearflag FLAG_HIDE_MR_BRINEY_ROUTE104_HOUSE
	clearflag FLAG_HIDE_PEEKO_BRINEY_HOUSE
	end

EventScript_MoveMrBrineyToDewford:
	setflag FLAG_HIDE_MR_BRINEY_ROUTE109
	setflag FLAG_HIDE_MR_BRINEY_BOAT_ROUTE109
	setflag FLAG_HIDE_MR_BRINEY_ROUTE104
	setflag FLAG_HIDE_MR_BRINEY_BOAT_ROUTE104
	setflag FLAG_HIDE_MR_BRINEY_ROUTE104_HOUSE
	setflag FLAG_HIDE_PEEKO_BRINEY_HOUSE
	clearflag FLAG_HIDE_MR_BRINEY_DEWFORD_TOWN
	clearflag FLAG_HIDE_MR_BRINEY_BOAT_DEWFORD
	end

EventScript_MoveMrBrineyToRoute109:
	setflag FLAG_HIDE_MR_BRINEY_ROUTE104
	setflag FLAG_HIDE_MR_BRINEY_BOAT_ROUTE104
	setflag FLAG_HIDE_MR_BRINEY_ROUTE104_HOUSE
	setflag FLAG_HIDE_PEEKO_BRINEY_HOUSE
	setflag FLAG_HIDE_MR_BRINEY_DEWFORD_TOWN
	setflag FLAG_HIDE_MR_BRINEY_BOAT_DEWFORD
	clearflag FLAG_HIDE_MR_BRINEY_ROUTE109
	clearflag FLAG_HIDE_MR_BRINEY_BOAT_ROUTE109
	end

EverGrandeCity_HallOfFame_EventScript_ResetEliteFour:: @ 819FD09
	clearflag FLAG_DEFEATED_ELITE_4_SYDNEY
	clearflag FLAG_DEFEATED_ELITE_4_PHOEBE
	clearflag FLAG_DEFEATED_ELITE_4_GLACIA
	clearflag FLAG_DEFEATED_ELITE_4_DRAKE
	setvar VAR_ELITE_4_STATE, 0
	return

Common_EventScript_UpdateBrineyLocation:: @ 819FD1B
	goto_if_unset FLAG_RECEIVED_POKENAV, Common_EventScript_Return
	goto_if_set FLAG_DEFEATED_PETALBURG_GYM, Common_EventScript_Return
	goto_if_unset FLAG_HIDE_MR_BRINEY_BOAT_ROUTE104, EventScript_SetBrineyLocation_House
	goto_if_unset FLAG_HIDE_MR_BRINEY_DEWFORD_TOWN, EventScript_SetBrineyLocation_Dewford
	goto_if_unset FLAG_HIDE_MR_BRINEY_ROUTE109, EventScript_SetBrineyLocation_Route109
	return

EventScript_SetBrineyLocation_House:: @ 819FD49
	setvar VAR_BRINEY_LOCATION, 1
	return

EventScript_SetBrineyLocation_Dewford:: @ 819FD4F
	setvar VAR_BRINEY_LOCATION, 2
	return

EventScript_SetBrineyLocation_Route109:: @ 819FD55
	setvar VAR_BRINEY_LOCATION, 3
	return

	.include "data/scripts/pkmn_center_nurse.inc"
	.include "data/scripts/obtain_item.inc"
	.include "data/scripts/record_mix.inc"
	.include "data/scripts/pc.inc"

Common_EventScript_PokemartSign:: @ 81A00E1
	msgbox Text_PokemartSign, MSGBOX_SIGN
	end

Common_EventScript_PokemonCenterSign:: @ 81A00EA
	msgbox Text_PokemonCenterSign, MSGBOX_SIGN
	end

Common_EventScript_ShowEasyChatScreen:: @ 81A00F3
	fadescreen FADE_TO_BLACK
	special ShowEasyChatScreen
	fadescreen FADE_FROM_BLACK
	return

Common_EventScript_ReadyPetalburgGymForBattle:: @ 81A00FB
	clearflag FLAG_HIDE_PETALBURG_GYM_GUIDE
	setflag FLAG_PETALBURG_MART_EXPANDED_ITEMS
	return

Common_EventScript_BufferTrendyPhrase:: @ 81A0102
	dotimebasedevents
	setvar VAR_0x8004, 0
	special BufferTrendyPhraseString
	return

EventScript_BackupMrBrineyLocation:: @ 81A010C
	copyvar VAR_0x8008, VAR_BRINEY_LOCATION
	setvar VAR_BRINEY_LOCATION, 0
	return

	.include "data/scripts/surf.inc"
	.include "data/scripts/dynamic_npc_graphics.inc"
	.include "data/scripts/set_gym_trainers.inc"

Common_EventScript_ShowBagIsFull:: @ 81A029B
	msgbox Text_TooBadBagIsFull, MSGBOX_DEFAULT
	release
	end

Common_EventScript_BagIsFull:: @ 81A02A5
	msgbox Text_TooBadBagIsFull, MSGBOX_DEFAULT
	return

Common_EventScript_ShowNoRoomForDecor:: @ 81A02AE
	msgbox Text_NoRoomLeftForAnother, MSGBOX_DEFAULT
	release
	end

Common_EventScript_NoRoomForDecor:: @ 81A02B8
	msgbox Text_NoRoomLeftForAnother, MSGBOX_DEFAULT
	return

Common_EventScript_SetLegendaryWeather:: @ 81A02C1
	.ifdef SAPPHIRE
	setweather WEATHER_RAIN_HEAVY
	.else
	setweather WEATHER_DROUGHT
	.endif
	return

Common_EventScript_PlayGymBadgeFanfare:: @ 81A02C5
	playfanfare MUS_OBTAIN_BADGE
	waitfanfare
	return

Common_EventScript_OutOfCenterPartyHeal:: @ 81A02CA
	fadescreen FADE_TO_BLACK
	playfanfare MUS_HEAL
	waitfanfare
	special ScrSpecial_HealPlayerParty
	fadescreen FADE_FROM_BLACK
	return

EventScript_RegionMap:: @ 81A02D6
	lockall
	msgbox Common_Text_LookCloserAtMap, MSGBOX_DEFAULT
	fadescreen FADE_TO_BLACK
	special FieldShowRegionMap
	waitstate
	releaseall
	end

Common_EventScript_PlayBrineysBoatMusic:: @ 81A02E7
	setflag FLAG_DONT_TRANSITION_MUSIC
	playbgm MUS_SAILING, FALSE
	return

Common_EventScript_StopBrineysBoatMusic:: @ 81A02EF
	clearflag FLAG_DONT_TRANSITION_MUSIC
	fadedefaultbgm
	return

	.include "data/scripts/prof_birch.inc"

Common_EventScript_FerryDepart:: @ 81A040E
	delay 60
	applymovement VAR_0x8004, Movement_FerryDepart
	waitmovement 0
	return

Movement_FerryDepart:: @ 81A041C
	walk_slow_right
	walk_slow_right
	walk_slow_right
	walk_right
	walk_right
	walk_right
	walk_right
	step_end

EventScript_HideMrBriney:: @ 81A0424
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

RusturfTunnel_EventScript_SetRusturfTunnelOpen:: @ 81A0442
	removeobject 1
	removeobject 10
	clearflag FLAG_HIDE_BOYFRIEND_WANDAS_HOUSE
	clearflag FLAG_HIDE_GIRLFRIEND_WANDAS_HOUSE
	setvar VAR_RUSTURF_TUNNEL_STATE, 6
	setflag FLAG_RUSTURF_TUNNEL_OPENED
	return

EventScript_UnusedBoardFerry:
	delay 30
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	showobjectat OBJ_EVENT_ID_PLAYER, 0
	delay 30
	applymovement OBJ_EVENT_ID_PLAYER, Movement_UnusedBoardFerry
	waitmovement 0
	delay 30
	return

Movement_UnusedBoardFerry:
	walk_up
	step_end

Common_EventScript_FerryDepartIsland:: @ 81A047C
	compare VAR_FACING, DIR_SOUTH
	call_if_eq Ferry_EventScript_DepartIslandSouth
	compare VAR_FACING, DIR_WEST
	call_if_eq Ferry_EventScript_DepartIslandWest
	delay 30
	hideobjectat OBJ_EVENT_ID_PLAYER, 0
	call Common_EventScript_FerryDepart
	return

	.include "data/scripts/cave_of_origin.inc"
	.include "data/scripts/static_pokemon.inc"

Common_EventScript_NameReceivedPartyMon:: @ 81A0678
	fadescreen FADE_TO_BLACK
	special ChangePokemonNickname
	waitstate
	return

Common_EventScript_PlayerHandedOverTheItem:: @ 81A067F
	bufferitemname 0, VAR_0x8004
	playfanfare MUS_OBTAIN_TMHM
	message FallarborTown_House1_Text_1A1498
	waitmessage
	waitfanfare
	removeitem VAR_0x8004, 1
	return

	.include "data/scripts/elite_four.inc"
	.include "data/scripts/movement.inc"
	.include "data/scripts/check_furniture.inc"
	.include "data/text/sample_message.inc"
	.include "data/text/record_mix.inc"
	.include "data/text/pc.inc"
	.include "data/text/pkmn_center_nurse.inc"
	.include "data/text/mart_clerk.inc"
	.include "data/text/obtain_item.inc"

Text_PokemartSign:: @ 81A0D41
	.string "“Ausgewählte Items für Ihren\n"
	.string "Gebrauch!”\l"
	.string "POKéMON-SUPERMARKT$"

Text_PokemonCenterSign:: @ 81A0D75
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

gText_PokemonTrainerSchoolEmail:: @ 81A100C
gText_PokemonTrainerSchoolEmail:: @ 81A100C
	.string "Da ist eine E-Mail von der POKéMON\n"
	.string "TRAINERSCHULE.\p"
	.string "... ... ... ... ... ...\p"
	.string "Ein POKéMON kann bis zu vier Attacken\n"
	.string "lernen.\p"
	.string "Die Fähigkeiten eines TRAINERS werden\n"
	.string "durch die Attacken, die er seinen\l"
	.string "POKéMON beibringt, erprobt.\p"
	.string "... ... ... ... ... ...$"

gText_PlayerHouseBootPC:: @ 81A10D6
gText_PlayerHouseBootPC:: @ 81A10D6
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

gText_ComeBackWithSecretPower:: @ 81A116E
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
	msgbox Text_NoRegisteredItem, MSGBOX_SIGN
	end

gUnknown_081A14B8:: @ 81A14B8
	lockall
	special ExecuteWhiteOut
	waitstate
	compare VAR_RESULT, 1
	goto_if_eq EventScript_1A14CA
	releaseall
	end

EventScript_1A14CA::
	message UnknownString_81A1141
	waitmessage
	waitbuttonpress
	special sub_8081924
	waitstate
	fadescreen FADE_TO_BLACK
	special sp0C8_whiteout_maybe
	waitstate
	end

Common_EventScript_Return:: @ 81A14DC
	return

	.include "data/scripts/debug.inc"
	.include "data/scripts/berry_tree.inc"
	.include "data/text/berry_tree.inc"
	.include "data/text/secret_base_trainers.inc"
	.include "data/scripts/secret_base.inc"
	.include "data/text/secret_power_tm.inc"
	.include "data/scripts/secret_power_tm.inc"
	.include "data/text/secret_base.inc"
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
	setvar VAR_0x8005, 1
	special InterviewBefore
	compare VAR_RESULT, 1
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1ADED6
	copyvar VAR_0x8009, VAR_0x8006
	msgbox SlateportCity_PokemonFanClub_Text_1A8704, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1ADE84
	compare VAR_RESULT, NO
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1ADEB9
	end

SlateportCity_PokemonFanClub_EventScript_1ADE84:: @ 81ADE84
	msgbox SlateportCity_PokemonFanClub_Text_1A87CA, MSGBOX_DEFAULT
	setvar VAR_0x8004, 5
	copyvar VAR_0x8005, VAR_0x8009
	setvar VAR_0x8006, 1
	call Common_EventScript_ShowEasyChatScreen
	lock
	faceplayer
	compare VAR_RESULT, 1
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1ADEC3
	compare VAR_RESULT, 0
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1ADEB9
	end

SlateportCity_PokemonFanClub_EventScript_1ADEB9:: @ 81ADEB9
	msgbox SlateportCity_PokemonFanClub_Text_1A8667, MSGBOX_DEFAULT
	release
	end

SlateportCity_PokemonFanClub_EventScript_1ADEC3:: @ 81ADEC3
	msgbox SlateportCity_PokemonFanClub_Text_1A8818, MSGBOX_DEFAULT
	setvar VAR_0x8005, 1
	goto SlateportCity_PokemonFanClub_EventScript_1ADE46
	end

SlateportCity_PokemonFanClub_EventScript_1ADED6:: @ 81ADED6
	msgbox SlateportCity_PokemonFanClub_Text_1A86B5, MSGBOX_DEFAULT
	release
	end

SlateportCity_OceanicMuseum_1F_EventScript_1ADEE0:: @ 81ADEE0
	lock
	faceplayer
	setvar VAR_0x8005, 2
	special InterviewBefore
	compare VAR_RESULT, 1
	goto_if_eq SlateportCity_OceanicMuseum_1F_EventScript_1ADF96
	copyvar VAR_0x8009, VAR_0x8006
	goto_if_set FLAG_OCEANIC_MUSEUM_MET_REPORTER, SlateportCity_OceanicMuseum_1F_EventScript_1ADF25
	setflag FLAG_OCEANIC_MUSEUM_MET_REPORTER
	msgbox SlateportCity_OceanicMuseum_1F_Text_1A927F, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq SlateportCity_OceanicMuseum_1F_EventScript_1ADF44
	compare VAR_RESULT, NO
	goto_if_eq SlateportCity_OceanicMuseum_1F_EventScript_1ADF79
	end

SlateportCity_OceanicMuseum_1F_EventScript_1ADF25:: @ 81ADF25
	msgbox SlateportCity_OceanicMuseum_1F_Text_1A934C, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq SlateportCity_OceanicMuseum_1F_EventScript_1ADF44
	compare VAR_RESULT, NO
	goto_if_eq SlateportCity_OceanicMuseum_1F_EventScript_1ADF79
	end

SlateportCity_OceanicMuseum_1F_EventScript_1ADF44:: @ 81ADF44
	msgbox SlateportCity_OceanicMuseum_1F_Text_1A93D1, MSGBOX_DEFAULT
	setvar VAR_0x8004, 5
	copyvar VAR_0x8005, VAR_0x8009
	setvar VAR_0x8006, 0
	call Common_EventScript_ShowEasyChatScreen
	lock
	faceplayer
	compare VAR_RESULT, 1
	goto_if_eq SlateportCity_OceanicMuseum_1F_EventScript_1ADF83
	compare VAR_RESULT, 0
	goto_if_eq SlateportCity_OceanicMuseum_1F_EventScript_1ADF79
	end

SlateportCity_OceanicMuseum_1F_EventScript_1ADF79:: @ 81ADF79
	msgbox SlateportCity_OceanicMuseum_1F_Text_1A9446, MSGBOX_DEFAULT
	release
	end

SlateportCity_OceanicMuseum_1F_EventScript_1ADF83:: @ 81ADF83
	msgbox SlateportCity_OceanicMuseum_1F_Text_1A949A, MSGBOX_DEFAULT
	setvar VAR_0x8005, 2
	goto SlateportCity_OceanicMuseum_1F_EventScript_1ADE46
	end

SlateportCity_OceanicMuseum_1F_EventScript_1ADF96:: @ 81ADF96
	msgbox SlateportCity_OceanicMuseum_1F_Text_1A952E, MSGBOX_DEFAULT
	release
	end

SlateportCity_PokemonFanClub_EventScript_1ADFA0:: @ 81ADFA0
	lock
	faceplayer
	specialvar VAR_RESULT, LeadMonNicknamed
	compare VAR_RESULT, 0
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1ADE4D
	setvar VAR_0x8005, 3
	special InterviewBefore
	compare VAR_RESULT, 1
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1AE0AC
	copyvar VAR_0x8009, VAR_0x8006
	msgbox SlateportCity_PokemonFanClub_Text_1A82F1, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1ADFE9
	compare VAR_RESULT, NO
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1AE0A2
	end

SlateportCity_PokemonFanClub_EventScript_1ADFE9:: @ 81ADFE9
	msgbox SlateportCity_PokemonFanClub_Text_1A83D0, MSGBOX_DEFAULT
	random 3
	copyvar VAR_0x800A, VAR_RESULT
	switch VAR_RESULT
	case 0, SlateportCity_PokemonFanClub_EventScript_1AE020
	case 1, SlateportCity_PokemonFanClub_EventScript_1AE02E
	case 2, SlateportCity_PokemonFanClub_EventScript_1AE03C
	end

SlateportCity_PokemonFanClub_EventScript_1AE020:: @ 81AE020
	msgbox SlateportCity_PokemonFanClub_Text_1A8414, MSGBOX_DEFAULT
	goto SlateportCity_PokemonFanClub_EventScript_1AE04A
	end

SlateportCity_PokemonFanClub_EventScript_1AE02E:: @ 81AE02E
	msgbox SlateportCity_PokemonFanClub_Text_1A8470, MSGBOX_DEFAULT
	goto SlateportCity_PokemonFanClub_EventScript_1AE04A
	end

SlateportCity_PokemonFanClub_EventScript_1AE03C:: @ 81AE03C
	msgbox SlateportCity_PokemonFanClub_Text_1A84D5, MSGBOX_DEFAULT
	goto SlateportCity_PokemonFanClub_EventScript_1AE04A
	end

SlateportCity_PokemonFanClub_EventScript_1AE04A:: @ 81AE04A
	setvar VAR_0x8004, 7
	copyvar VAR_0x8005, VAR_0x8009
	setvar VAR_0x8006, 0
	call Common_EventScript_ShowEasyChatScreen
	lock
	faceplayer
	compare VAR_RESULT, 0
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1AE0A2
	msgbox SlateportCity_PokemonFanClub_Text_1A852D, MSGBOX_DEFAULT
	setvar VAR_0x8006, 1
	call Common_EventScript_ShowEasyChatScreen
	lock
	faceplayer
	compare VAR_RESULT, 0
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1AE0A2
	msgbox SlateportCity_PokemonFanClub_Text_1A85A6, MSGBOX_DEFAULT
	copyvar VAR_0x8007, VAR_0x800A
	setvar VAR_0x8005, 3
	goto SlateportCity_PokemonFanClub_EventScript_1ADE46
	end

SlateportCity_PokemonFanClub_EventScript_1AE0A2:: @ 81AE0A2
	msgbox SlateportCity_PokemonFanClub_Text_1A8667, MSGBOX_DEFAULT
	release
	end

SlateportCity_PokemonFanClub_EventScript_1AE0AC:: @ 81AE0AC
	msgbox SlateportCity_PokemonFanClub_Text_1A86B5, MSGBOX_DEFAULT
	release
	end

FallarborTown_ContestLobby_EventScript_Reporter:: @ 81AE0B6
LilycoveCity_ContestLobby_EventScript_1AE0B6:: @ 81AE0B6
SlateportCity_ContestLobby_EventScript_1AE0B6:: @ 81AE0B6
VerdanturfTown_ContestLobby_EventScript_1AE0B6:: @ 81AE0B6
	lock
	faceplayer
	goto_if_set FLAG_TEMP_2, FallarborTown_ContestLobby_EventScript_1AE17E
	setvar VAR_0x8005, 6
	special InterviewBefore
	compare VAR_RESULT, 1
	goto_if_eq FallarborTown_ContestLobby_EventScript_1AE17E
	copyvar VAR_0x8009, VAR_0x8006
	msgbox FallarborTown_ContestLobby_Text_1A6F7C, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq FallarborTown_ContestLobby_EventScript_1AE0F8
	compare VAR_RESULT, NO
	goto_if_eq FallarborTown_ContestLobby_EventScript_1AE12D
	end

FallarborTown_ContestLobby_EventScript_1AE0F8:: @ 81AE0F8
	msgbox FallarborTown_ContestLobby_Text_1A704E, MSGBOX_DEFAULT
	setvar VAR_0x8004, 11
	copyvar VAR_0x8005, VAR_0x8009
	setvar VAR_0x8006, 0
	call Common_EventScript_ShowEasyChatScreen
	lock
	faceplayer
	compare VAR_RESULT, 1
	goto_if_eq FallarborTown_ContestLobby_EventScript_1AE137
	compare VAR_RESULT, 0
	goto_if_eq FallarborTown_ContestLobby_EventScript_1AE12D
	end

FallarborTown_ContestLobby_EventScript_1AE12D:: @ 81AE12D
	msgbox FallarborTown_ContestLobby_Text_1A7256, MSGBOX_DEFAULT
	release
	end

FallarborTown_ContestLobby_EventScript_1AE137:: @ 81AE137
	setvar VAR_0x8004, 24
	special SetContestCategoryStringVarForInterview
	msgbox FallarborTown_ContestLobby_Text_1A70A5, MSGBOX_DEFAULT
	setvar VAR_0x8004, 11
	copyvar VAR_0x8005, VAR_0x8009
	setvar VAR_0x8006, 1
	call Common_EventScript_ShowEasyChatScreen
	lock
	faceplayer
	compare VAR_RESULT, 0
	goto_if_eq FallarborTown_ContestLobby_EventScript_1AE12D
	msgbox FallarborTown_ContestLobby_Text_1A7153, MSGBOX_DEFAULT
	setflag FLAG_TEMP_2
	setvar VAR_0x8005, 6
	goto FallarborTown_ContestLobby_EventScript_1ADE46
	end

FallarborTown_ContestLobby_EventScript_1AE17E:: @ 81AE17E
	msgbox FallarborTown_ContestLobby_Text_1A72A8, MSGBOX_DEFAULT
	release
	end

FallarborTown_ContestLobby_EventScript_1AE188:: @ 81AE188
LilycoveCity_ContestLobby_EventScript_1AE188:: @ 81AE188
SlateportCity_ContestLobby_EventScript_1AE188:: @ 81AE188
VerdanturfTown_ContestLobby_EventScript_1AE188:: @ 81AE188
	compare VAR_LINK_CONTEST_ROOM_STATE, 2
	goto_if_ne FallarborTown_ContestLobby_EventScript_1AE1FE
	setvar VAR_0x8005, 6
	special InterviewBefore
	compare VAR_RESULT, 1
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
	setvar VAR_0x8005, 7
	special InterviewBefore
	compare VAR_RESULT, 1
	goto_if_eq BattleTower_Lobby_EventScript_1AE2E3
	copyvar VAR_0x8009, VAR_0x8006
	msgbox BattleTower_Lobby_Text_1A776D, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq BattleTower_Lobby_EventScript_1AE241
	compare VAR_RESULT, NO
	goto_if_eq BattleTower_Lobby_EventScript_1AE297
	end

BattleTower_Lobby_EventScript_1AE241:: @ 81AE241
	message BattleTower_Lobby_Text_1A7823
	waitmessage
	multichoice 19, 8, 45, 1
	copyvar VAR_0x8008, VAR_RESULT
	compare VAR_RESULT, 0
	call_if_eq BattleTower_Lobby_EventScript_1AE2A1
	compare VAR_RESULT, 1
	call_if_eq BattleTower_Lobby_EventScript_1AE2AA
	msgbox BattleTower_Lobby_Text_1A79EB, MSGBOX_DEFAULT
	setvar VAR_0x8004, 12
	copyvar VAR_0x8005, VAR_0x8009
	call Common_EventScript_ShowEasyChatScreen
	lock
	faceplayer
	compare VAR_RESULT, 1
	goto_if_eq BattleTower_Lobby_EventScript_1AE2B3
	compare VAR_RESULT, 0
	goto_if_eq BattleTower_Lobby_EventScript_1AE2D9
	end

BattleTower_Lobby_EventScript_1AE297:: @ 81AE297
	msgbox BattleTower_Lobby_Text_1A78B7, MSGBOX_DEFAULT
	release
	end

BattleTower_Lobby_EventScript_1AE2A1:: @ 81AE2A1
	msgbox BattleTower_Lobby_Text_1A791B, MSGBOX_DEFAULT
	return

BattleTower_Lobby_EventScript_1AE2AA:: @ 81AE2AA
	msgbox BattleTower_Lobby_Text_1A7990, MSGBOX_DEFAULT
	return

BattleTower_Lobby_EventScript_1AE2B3:: @ 81AE2B3
	compare VAR_RESULT, 0
	goto_if_eq BattleTower_Lobby_EventScript_1AE2D9
	msgbox BattleTower_Lobby_Text_1A7A6E, MSGBOX_DEFAULT
	setflag FLAG_TEMP_2
	copyvar VAR_0x8004, VAR_0x8008
	setvar VAR_0x8005, 7
	goto BattleTower_Lobby_EventScript_1ADE46
	end

BattleTower_Lobby_EventScript_1AE2D9:: @ 81AE2D9
	msgbox BattleTower_Lobby_Text_1A7AE0, MSGBOX_DEFAULT
	release
	end

BattleTower_Lobby_EventScript_1AE2E3:: @ 81AE2E3
	msgbox BattleTower_Lobby_Text_1A7B66, MSGBOX_DEFAULT
	release
	end

BattleTower_Lobby_EventScript_1AE2ED:: @ 81AE2ED
	compare VAR_BRAVO_TRAINER_BATTLE_TOWER_ON, 0
	goto_if_eq BattleTower_Lobby_EventScript_1AE30F
	setvar VAR_0x8005, 7
	special InterviewBefore
	compare VAR_RESULT, 1
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
	msgbox UnknownString_81728E3, MSGBOX_SIGN
	end

	.include "data/text/pokeblocks.inc"
	.include "data/scripts/pokeblocks.inc"

	.include "data/text/trainers.inc"

S_RepelWoreOff:: @ 81C33E6
	msgbox Text_RepelWoreOff, MSGBOX_SIGN
	end

Text_RepelWoreOff: @ 81C33EF
	.string "SCHUTZ wirkt nicht mehr...$"

	.include "data/scripts/safari_zone.inc"
	.include "data/text/safari_zone.inc"

MauvilleCity_GameCorner_EventScript_1C407E:: @ 81C407E
	checkitem ITEM_COIN_CASE, 1
	compare VAR_RESULT, 0
	goto_if_eq MauvilleCity_GameCorner_EventScript_1572B5
	setvar VAR_0x8004, 0
	getpricereduction 2
	compare VAR_RESULT, 0
	goto_if_eq MauvilleCity_GameCorner_EventScript_1C40DA
	addvar VAR_0x8004, 128
	goto MauvilleCity_GameCorner_EventScript_1C40DA
	end

MauvilleCity_GameCorner_EventScript_1C40AC:: @ 81C40AC
	checkitem ITEM_COIN_CASE, 1
	compare VAR_RESULT, 0
	goto_if_eq MauvilleCity_GameCorner_EventScript_1572B5
	setvar VAR_0x8004, 1
	getpricereduction 2
	compare VAR_RESULT, 0
	goto_if_eq MauvilleCity_GameCorner_EventScript_1C40DA
	addvar VAR_0x8004, 128
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
	.include "data/text/check_furniture.inc"
	.include "data/scripts/cave_hole.inc"

@ 81C6BF9
	msgbox Text_1C6C2B, MSGBOX_NPC
	end

gUnknown_081C6C02:: @ 81C6C02
	msgbox Text_1C6C4B, MSGBOX_SIGN
	end

@ 81C6C0B
	end

@ 81C6C0C
	msgbox Text_1C6C62, MSGBOX_SIGN
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
