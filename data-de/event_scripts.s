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
	playfanfare MUS_ME_BACHI
	waitfanfare
	return

Common_EventScript_OutOfCenterPartyHeal:: @ 81A02CA
	fadescreen FADE_TO_BLACK
	playfanfare MUS_ME_ASA
	waitfanfare
	special ScrSpecial_HealPlayerParty
	fadescreen FADE_FROM_BLACK
	return

EventScript_RegionMap:: @ 81A02D6
	lockall
	msgbox Text_LookCloserAtMap, MSGBOX_DEFAULT
	fadescreen FADE_TO_BLACK
	special FieldShowRegionMap
	waitstate
	releaseall
	end

Common_EventScript_PlayBrineysBoatMusic:: @ 81A02E7
	setflag FLAG_DONT_TRANSITION_MUSIC
	playbgm MUS_M_BOAT, FALSE
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

LittlerootTown_ProfessorBirchsLab_EventScript_1A0678:: @ 81A0678
MossdeepCity_StevensHouse_EventScript_1A0678:: @ 81A0678
RustboroCity_DevonCorp_2F_EventScript_1A0678:: @ 81A0678
SlateportCity_House1_EventScript_1A0678:: @ 81A0678
	fadescreen FADE_TO_BLACK
	special ChangePokemonNickname
	waitstate
	return

FallarborTown_House1_EventScript_1A067F:: @ 81A067F
GraniteCave_StevensRoom_EventScript_1A067F:: @ 81A067F
MtPyre_Summit_EventScript_1A067F:: @ 81A067F
SlateportCity_OceanicMuseum_2F_EventScript_1A067F:: @ 81A067F
	bufferitemname 0, VAR_0x8004
	playfanfare MUS_ME_WAZA
	message FallarborTown_House1_Text_1A1498
	waitmessage
	waitfanfare
	removeitem VAR_0x8004, 1
	return

EverGrandeCity_DrakesRoom_EventScript_1A0693:: @ 81A0693
EverGrandeCity_GlaciasRoom_EventScript_1A0693:: @ 81A0693
EverGrandeCity_PhoebesRoom_EventScript_1A0693:: @ 81A0693
EverGrandeCity_SidneysRoom_EventScript_1A0693:: @ 81A0693
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_Delay32
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
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkUp6
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

	.include "data/scripts/movement.inc"

PictureBookShelfScript:: @ 81A085B
	msgbox PictureBookShelfText, MSGBOX_SIGN
	end

BookshelfScript:: @ 81A0864
	msgbox BookshelfText, MSGBOX_SIGN
	end

PokemonCenterBookshelfScript:: @ 81A086D
	msgbox PokemonCenterBookshelfText, MSGBOX_SIGN
	end

VaseScript:: @ 81A0876
	msgbox VaseText, MSGBOX_SIGN
	end

TrashCanScript:: @ 81A087F
	msgbox TrashCanText, MSGBOX_SIGN
	end

ShopShelfScript:: @ 81A0888
	msgbox ShopShelfText, MSGBOX_SIGN
	end

BlueprintScript:: @ 81A0891
	msgbox BlueprintText, MSGBOX_SIGN
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

Text_BootUpPC: @ 81A09EC
	.string "{PLAYER} schaltet den PC ein.$"

Text_WhichPCShouldBeAccessed:: @ 81A0A01
	.string "Zugriff auf wessen PC?$"

Text_AccessedSomeonesPC: @ 81A0A1E
	.string "Verbindung zu jemandes PC hergestellt.$"

UnknownString_81A0A35: @ 81A0A35
	.string "POKéMON-Lagerungs-System geöffnet.$"

Text_AccessedPlayersPC: @ 81A0A54
	.string "Verbindung mit PC von {PLAYER}.$"

Text_AccessedLanettesPC: @ 81A0A66
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

Text_TooBadBagIsFull:
	.string "Zu schade!\n"
	.string "Der BEUTEL ist voll...$"

Message_ObtainedDecoration: @ 81A0CDE
	.string "{STR_VAR_2} erhalten.$"

Text_NoRoomLeftForAnother:: @ 81A0CEF
	.string "Zu schade! Es ist kein Platz für\n"
	.string "{STR_VAR_2}...$"

Message_TransferredToPC: @ 81A0D1F
	.string "{STR_VAR_2} wurde auf den PC\n"
	.string "übertragen.$"

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
	.string "Okay, los geht's!$"

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
	.string "Ooch! Ich hab's vergeigt!\n"
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
	compare VAR_RESULT, 1
	goto_if_eq AskToMoveSecretBase
	checkpartymove MOVE_SECRET_POWER
	setfieldeffectargument 0, VAR_RESULT
	buffermovename 1, MOVE_SECRET_POWER
	compare VAR_0x8007, 1
	goto_if_eq EventScript_1A2CB0
	compare VAR_0x8007, 2
	goto_if_eq EventScript_1A2CB0
	compare VAR_0x8007, 3
	goto_if_eq EventScript_1A2CB0
	compare VAR_0x8007, 4
	goto_if_eq EventScript_1A2CB0
	compare VAR_0x8007, 5
	goto_if_eq EventScript_1A2D08
	compare VAR_0x8007, 6
	goto_if_eq EventScript_1A2D60
	end

EventScript_1A2CB0:
	lockall
	compare VAR_RESULT, 6
	goto_if_eq EventScript_1A2CF1
	bufferpartymonnick 0, VAR_RESULT
	msgbox UnknownString_8198F34, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_1A2F3A
	msgbox UsedCutRockSmashText, MSGBOX_DEFAULT
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
	msgbox UnknownString_8198F10, MSGBOX_SIGN
	end

EventScript_1A2CFA:
	msgbox UnknownString_8198F6E, MSGBOX_DEFAULT
	goto EventScript_1A2DB8
	end

EventScript_1A2D08:
	lockall
	compare VAR_RESULT, 6
	goto_if_eq EventScript_1A2D49
	bufferpartymonnick 0, VAR_RESULT
	msgbox UnknownString_81A197B, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_1A2F3A
	msgbox UsedCutRockSmashText, MSGBOX_DEFAULT
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
	msgbox UnknownString_81A1948, MSGBOX_SIGN
	end

EventScript_1A2D52:
	msgbox UnknownString_81A19C4, MSGBOX_DEFAULT
	goto EventScript_1A2DB8
	end

EventScript_1A2D60:
	lockall
	compare VAR_RESULT, 6
	goto_if_eq EventScript_1A2DA1
	bufferpartymonnick 0, VAR_RESULT
	msgbox UnknownString_81A1A4B, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_1A2F3A
	msgbox UsedCutRockSmashText, MSGBOX_DEFAULT
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
	msgbox UnknownString_81A1A03, MSGBOX_SIGN
	end

EventScript_1A2DAA:
	msgbox UnknownString_81A1AA9, MSGBOX_DEFAULT
	goto EventScript_1A2DB8
	end

EventScript_1A2DB8:
	closemessage
	playse SE_KAIDAN
	setvar VAR_INIT_SECRET_BASE, 0
	setflag FLAG_DECORATION_1
	special sub_80BB8CC
	special sub_80BBAF0
	setvar VAR_0x8004, 0
	setvar VAR_0x8005, 0
	special sub_80BBDD0
	setvar VAR_SECRET_BASE_INITIALIZED, 1
	waitstate
	end

SecretBase_EventScript_FirstEntrance:: @ 81A2DDE
	applymovement OBJ_EVENT_ID_PLAYER, SecretBase_RedCave1_Movement_1A2E11
	waitmovement 0
	setvar VAR_INIT_SECRET_BASE, 1
	msgbox SecretBase_RedCave1_Text_198F89, MSGBOX_YESNO
	compare VAR_RESULT, YES
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
	step_end

gUnknown_081A2E14:: @ 81A2E14
	lockall
	setvar VAR_INIT_SECRET_BASE, 1
	playse SE_KAIDAN
	special sub_80BC114
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1A2E38
	clearflag FLAG_DECORATION_1
	special sub_80BBAF0
	setvar VAR_SECRET_BASE_INITIALIZED, 0
	waitstate
	end

EventScript_1A2E38:
	setflag FLAG_DECORATION_1
	special sub_80BBAF0
	setvar VAR_SECRET_BASE_INITIALIZED, 0
	waitstate
	end

AskToMoveSecretBase:
	checkpartymove MOVE_SECRET_POWER
	compare VAR_RESULT, 6
	goto_if_eq EventScript_1A2EF7
	setfieldeffectargument 0, VAR_RESULT
	setorcopyvar VAR_0x8004, VAR_RESULT
	lockall
	special GetSecretBaseNearbyMapName
	msgbox UnknownString_81A3C71, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_1A2F3A
	msgbox SecretBase_Text_AllDecorationsWillBeReturned, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_1A2F3A
	fadescreen FADE_TO_BLACK
	special MoveSecretBase
	closemessage
	fadescreen FADE_FROM_BLACK
	msgbox UnknownString_81A3CC9, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_1A2F3A
	bufferpartymonnick 0, VAR_0x8004
	buffermovename 1, MOVE_SECRET_POWER
	msgbox UsedCutRockSmashText, MSGBOX_DEFAULT
	closemessage
	closemessage
	compare VAR_0x8007, 1
	goto_if_eq DoSecretBaseCaveFieldEffectScript
	compare VAR_0x8007, 2
	goto_if_eq DoSecretBaseCaveFieldEffectScript
	compare VAR_0x8007, 3
	goto_if_eq DoSecretBaseCaveFieldEffectScript
	compare VAR_0x8007, 4
	goto_if_eq DoSecretBaseCaveFieldEffectScript
	compare VAR_0x8007, 5
	goto_if_eq DoSecretBaseTreeFieldEffectScript
	compare VAR_0x8007, 6
	goto_if_eq DoSecretBaseShrubFieldEffectScript
	releaseall
	end

EventScript_1A2EF7::
	compare VAR_0x8007, 1
	goto_if_eq EventScript_1A2CF1
	compare VAR_0x8007, 2
	goto_if_eq EventScript_1A2CF1
	compare VAR_0x8007, 3
	goto_if_eq EventScript_1A2CF1
	compare VAR_0x8007, 4
	goto_if_eq EventScript_1A2CF1
	compare VAR_0x8007, 5
	goto_if_eq EventScript_1A2D49
	compare VAR_0x8007, 6
	goto_if_eq EventScript_1A2DA1
	end

EventScript_1A2F3A::
	closemessage
	releaseall
	end

SecretBase_EventScript_SetDecorationFlags:: @ 81A2F3D
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

SecretBase_EventScript_InitDecorations:: @ 81A2F68
	setvar VAR_0x8004, 0
	setvar VAR_0x8005, 0
	special sub_80BBDD0
	setvar VAR_SECRET_BASE_INITIALIZED, 1
	end

gUnknown_081A2F7B:: @ 81A2F7B
	setvar VAR_0x8005, 0
	goto EventScript_1A2F86
	end

EventScript_1A2F86:
	special sub_80FF474
	end

gUnknown_081A2F8A:: @ 81A2F8A
	setvar VAR_0x8004, 0
	goto EventScript_1A2F95
	end

EventScript_1A2F95:
	special sub_8100A7C
	compare VAR_RESULT, 1
	goto_if_eq EventScript_1A2FBF
	addvar VAR_0x8004, 1
	compare VAR_0x8005, 0
	goto_if_eq EventScript_1A2F95
	removeobject VAR_0x8006
	setflag VAR_0x8005
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
	compare VAR_0x8004, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A3032
	compare VAR_0x8004, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A30AE
	compare VAR_0x8004, 2
	goto_if_eq SecretBase_RedCave1_EventScript_1A312A
	compare VAR_0x8004, 3
	goto_if_eq SecretBase_RedCave1_EventScript_1A31A6
	compare VAR_0x8004, 4
	goto_if_eq SecretBase_RedCave1_EventScript_1A3222
	compare VAR_0x8004, 5
	goto_if_eq SecretBase_RedCave1_EventScript_1A329E
	compare VAR_0x8004, 6
	goto_if_eq SecretBase_RedCave1_EventScript_1A331A
	compare VAR_0x8004, 7
	goto_if_eq SecretBase_RedCave1_EventScript_1A3396
	compare VAR_0x8004, 8
	goto_if_eq SecretBase_RedCave1_EventScript_1A3412
	compare VAR_0x8004, 9
	goto_if_eq SecretBase_RedCave1_EventScript_1A348E
	end

SecretBase_RedCave1_EventScript_1A3032:: @ 81A3032
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A3086
	compare VAR_RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A30A5
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A1AEA, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SecretBase_RedCave1_EventScript_1A308F
	setvar VAR_RESULT, 1
	special sub_80BCE4C
	call Common_EventScript_SaveGame
	compare VAR_RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A308F
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A1B83, MSGBOX_DEFAULT
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A3086:: @ 81A3086
	msgbox SecretBase_RedCave1_Text_1A1C3B, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A308F:: @ 81A308F
	setvar VAR_RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A1B97, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A30A5:: @ 81A30A5
	msgbox SecretBase_RedCave1_Text_1A1BF8, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A30AE:: @ 81A30AE
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A3102
	compare VAR_RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A3121
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A1E67, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SecretBase_RedCave1_EventScript_1A310B
	setvar VAR_RESULT, 1
	special sub_80BCE4C
	call Common_EventScript_SaveGame
	compare VAR_RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A310B
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A1F04, MSGBOX_DEFAULT
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A3102:: @ 81A3102
	msgbox SecretBase_RedCave1_Text_1A1FBD, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A310B:: @ 81A310B
	setvar VAR_RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A1F2E, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A3121:: @ 81A3121
	msgbox SecretBase_RedCave1_Text_1A1F88, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A312A:: @ 81A312A
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A317E
	compare VAR_RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A319D
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A218F, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SecretBase_RedCave1_EventScript_1A3187
	setvar VAR_RESULT, 1
	special sub_80BCE4C
	call Common_EventScript_SaveGame
	compare VAR_RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A3187
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2220, MSGBOX_DEFAULT
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A317E:: @ 81A317E
	msgbox SecretBase_RedCave1_Text_1A22FA, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A3187:: @ 81A3187
	setvar VAR_RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2230, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A319D:: @ 81A319D
	msgbox SecretBase_RedCave1_Text_1A2280, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A31A6:: @ 81A31A6
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A31FA
	compare VAR_RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A3219
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A24E1, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SecretBase_RedCave1_EventScript_1A3203
	setvar VAR_RESULT, 1
	special sub_80BCE4C
	call Common_EventScript_SaveGame
	compare VAR_RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A3203
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A256F, MSGBOX_DEFAULT
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A31FA:: @ 81A31FA
	msgbox SecretBase_RedCave1_Text_1A2609, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A3203:: @ 81A3203
	setvar VAR_RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A258A, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A3219:: @ 81A3219
	msgbox SecretBase_RedCave1_Text_1A25D2, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A3222:: @ 81A3222
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A3276
	compare VAR_RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A3295
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A2830, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SecretBase_RedCave1_EventScript_1A327F
	setvar VAR_RESULT, 1
	special sub_80BCE4C
	call Common_EventScript_SaveGame
	compare VAR_RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A327F
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A28D7, MSGBOX_DEFAULT
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A3276:: @ 81A3276
	msgbox SecretBase_RedCave1_Text_1A297C, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A327F:: @ 81A327F
	setvar VAR_RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A28F4, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A3295:: @ 81A3295
	msgbox SecretBase_RedCave1_Text_1A294D, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A329E:: @ 81A329E
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A32F2
	compare VAR_RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A3311
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A1CB2, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SecretBase_RedCave1_EventScript_1A32FB
	setvar VAR_RESULT, 1
	special sub_80BCE4C
	call Common_EventScript_SaveGame
	compare VAR_RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A32FB
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A1D48, MSGBOX_DEFAULT
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A32F2:: @ 81A32F2
	msgbox SecretBase_RedCave1_Text_1A1DF6, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A32FB:: @ 81A32FB
	setvar VAR_RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A1D59, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A3311:: @ 81A3311
	msgbox SecretBase_RedCave1_Text_1A1DC0, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A331A:: @ 81A331A
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A336E
	compare VAR_RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A338D
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A2026, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SecretBase_RedCave1_EventScript_1A3377
	setvar VAR_RESULT, 1
	special sub_80BCE4C
	call Common_EventScript_SaveGame
	compare VAR_RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A3377
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2095, MSGBOX_DEFAULT
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A336E:: @ 81A336E
	msgbox SecretBase_RedCave1_Text_1A2147, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A3377:: @ 81A3377
	setvar VAR_RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A20AE, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A338D:: @ 81A338D
	msgbox SecretBase_RedCave1_Text_1A2109, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A3396:: @ 81A3396
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A33EA
	compare VAR_RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A3409
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A236A, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SecretBase_RedCave1_EventScript_1A33F3
	setvar VAR_RESULT, 1
	special sub_80BCE4C
	call Common_EventScript_SaveGame
	compare VAR_RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A33F3
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2405, MSGBOX_DEFAULT
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A33EA:: @ 81A33EA
	msgbox SecretBase_RedCave1_Text_1A2480, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A33F3:: @ 81A33F3
	setvar VAR_RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2420, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A3409:: @ 81A3409
	msgbox SecretBase_RedCave1_Text_1A2446, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A3412:: @ 81A3412
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A3466
	compare VAR_RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A3485
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A2663, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SecretBase_RedCave1_EventScript_1A346F
	setvar VAR_RESULT, 1
	special sub_80BCE4C
	call Common_EventScript_SaveGame
	compare VAR_RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A346F
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2710, MSGBOX_DEFAULT
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A3466:: @ 81A3466
	msgbox SecretBase_RedCave1_Text_1A27A4, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A346F:: @ 81A346F
	setvar VAR_RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2736, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A3485:: @ 81A3485
	msgbox SecretBase_RedCave1_Text_1A276A, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A348E:: @ 81A348E
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A34E2
	compare VAR_RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A3501
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A2A13, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SecretBase_RedCave1_EventScript_1A34EB
	setvar VAR_RESULT, 1
	special sub_80BCE4C
	call Common_EventScript_SaveGame
	compare VAR_RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A34EB
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2AE2, MSGBOX_DEFAULT
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A34E2:: @ 81A34E2
	msgbox SecretBase_RedCave1_Text_1A2BA4, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A34EB:: @ 81A34EB
	setvar VAR_RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2AFB, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A3501:: @ 81A3501
	msgbox SecretBase_RedCave1_Text_1A2B69, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A350A:: @ 81A350A
	special sub_80BCE1C
	setvar VAR_0x8004, 1
	setvar VAR_0x8005, 0
	special StartSpecialBattle
	waitstate
	special ScrSpecial_HealPlayerParty
	release
	end

	.include "data/text/secret_power_tm.inc"
	.include "data/scripts/secret_power_tm.inc"

SecretBase_Text_AllDecorationsWillBeReturned: @ 81A38FB
	.string "Alle Dekorationsgegenstände und das\n"
	.string "Mobiliar aus deiner GEHEIMBASIS werden\l"
	.string "auf deinen PC gesendet.\p"
	.string "Einverstanden?$"

SecretBase_Text_WantToRegisterSecretBase: @ 81A3958
	.string "Möchtest du GEHEIMBASIS von\n"
	.string "{STR_VAR_1} eintragen?$"

SecretBase_Text_AlreadyRegisteredDelete: @ 81A3982
	.string "Diese Daten wurden bereits\n"
	.string "eingetragen. Möchtest du sie löschen?$"

SecretBase_Text_TooManyBasesDeleteSome: @ 81A39C0
	.string "Bis zu 10 Orte können eingetragen\n"
	.string "werden.\p"
	.string "Lösche einen Ort, um einen neuen\n"
	.string "eintragen zu können.$"

SecretBase_Text_RegistrationCompleted: @ 81A3A22
	.string "Registrierung abgeschlossen.$"

SecretBase_Text_DataUnregistered: @ 81A3A3A
	.string "Daten wurden aus der Registrierung\n"
	.string "genommen.$"

UnknownString_81A3A56: @ 81A3A56
	.string "Es sind keine Dekorationen vorhanden.$"

SecretBase_Text_BootUpPC: @ 81A3A72
	.string "{PLAYER} schaltet den PC ein.$"

SecretBase_Text_WhatWouldYouLikeToDo: @ 81A3A87
	.string "Was möchtest du tun?$"

SecretBase_Text_RegistryInfo: @ 81A3AA2
	.string "Die eingetragene GEHEIMBASIS bleibt\n"
	.string "erhalten, bis der Eigentümer umzieht.\p"
	.string "Wird sie aus dem Grundbuch ent-\n"
	.string "fernt, kann eine andere GEHEIMBASIS\l"
	.string "diesen Platz einnehmen.\p"
	.string "Bis zu 10 Orte können eingetragen\n"
	.string "werden.{0xFC}Ì$"

SecretBase_Text_BattleTowerShield: @ 81A3B5B
	.string "Ein Schild aus {STR_VAR_2}, welches zeigt,\n"
	.string "dass {STR_VAR_1}-mal hintereinander im\l"
	.string "DUELLTURM ein Kampf gewonnen wurde.$"

SecretBase_Text_ToyTV: @ 81A3BA4
	.string "Ein sehr realistischer Spielzeug-\n"
	.string "Fernseher. Man könnte ihn glatt mit\l"
	.string "einem echten Gerät verwechseln.$"

SecretBase_Text_SeedotTV: @ 81A3BE8
	.string "Ein Spielzeug-Fernseher, der aussieht\n"
	.string "wie ein SAMURZEL. Er scheint von\l"
	.string "alleine davonrollen zu wollen...$"

SecretBase_Text_SkittyTV: @ 81A3C31
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

FallarborTown_ContestLobby_EventScript_1AE0B6:: @ 81AE0B6
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
	applymovement OBJ_EVENT_ID_PLAYER, GraniteCave_B1F_Movement_1C6BF7
	waitmovement 0
	playse SE_RU_HYUU
	delay 60
	warphole MAP_UNDEFINED
	waitstate
	end

gUnknown_081C6BDE:: @ 81C6BDE
	lockall
	delay 20
	applymovement OBJ_EVENT_ID_PLAYER, GraniteCave_B1F_Movement_1C6BF7
	waitmovement 0
	playse SE_RU_HYUU
	delay 60
	special sp13F_fall_to_last_warp
	waitstate
	end

GraniteCave_B1F_Movement_1C6BF7:: @ 81C6BF7
	set_invisible
	step_end

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
