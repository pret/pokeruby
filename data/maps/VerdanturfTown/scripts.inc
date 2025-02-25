VerdanturfTown_MapScripts:: @ 814E854
	map_script MAP_SCRIPT_ON_TRANSITION, VerdanturfTown_OnTransition
	.byte 0

VerdanturfTown_OnTransition:: @ 814E85A
	setflag FLAG_VISITED_VERDANTURF_TOWN
	setvar VAR_LINK_CONTEST_ROOM_STATE, 0
	setflag FLAG_HIDE_CONTEST_REPORTER_VERDANTURF
	end

VerdanturfTown_EventScript_Twin:: @ 814E866
	lock
	faceplayer
	goto_if_set FLAG_RUSTURF_TUNNEL_OPENED, VerdanturfTown_EventScript_TwinTunnelOpen
	msgbox VerdanturfTown_Text_ManTryingToDigTunnel, MSGBOX_DEFAULT
	applymovement 2, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

VerdanturfTown_EventScript_TwinTunnelOpen:: @ 814E885
	msgbox VerdanturfTown_Text_ManDugTunnelForLove, MSGBOX_DEFAULT
	applymovement 2, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

VerdanturfTown_EventScript_Man:: @ 814E899
	msgbox VerdanturfTown_Text_AirCleanHere, MSGBOX_NPC
	end

VerdanturfTown_EventScript_Camper:: @ 814E8A2
	msgbox VerdanturfTown_Text_MakeContestDebut, MSGBOX_NPC
	end

VerdanturfTown_EventScript_Boy:: @ 814E8AB
	lock
	faceplayer
	goto_if_set FLAG_RUSTURF_TUNNEL_OPENED, VerdanturfTown_EventScript_BoyTunnelOpen
	msgbox VerdanturfTown_Text_GuyTryingToBustThroughCave, MSGBOX_DEFAULT
	release
	end

VerdanturfTown_EventScript_BoyTunnelOpen:: @ 814E8C0
	msgbox VerdanturfTown_Text_EasyToGetToRustboroNow, MSGBOX_DEFAULT
	release
	end

VerdanturfTown_EventScript_TownSign:: @ 814E8CA
	msgbox VerdanturfTown_Text_TownSign, MSGBOX_SIGN
	end

VerdanturfTown_EventScript_WandasHouseSign:: @ 814E8D3
	msgbox VerdanturfTown_Text_WandasHouse, MSGBOX_SIGN
	end

VerdanturfTown_EventScript_PokemonContestNormalRankSign:: @ 814E8DC
	msgbox VerdanturfTown_Text_PokemonContestNormalRankSign, MSGBOX_SIGN
	end

VerdanturfTown_EventScript_RusturfTunnelSign:: @ 814E8E5
	msgbox VerdanturfTown_Text_RusturfTunnelSign, MSGBOX_SIGN
	end
