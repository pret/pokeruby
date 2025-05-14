PacifidlogTown_MapScripts:: @ 814E8EE
	map_script MAP_SCRIPT_ON_TRANSITION, PacifidlogTown_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, PacifidlogTown_OnResume
	.byte 0

PacifidlogTown_OnTransition:: @ 814E8F9
	setflag FLAG_VISITED_PACIFIDLOG_TOWN
	end

PacifidlogTown_OnResume:: @ 814E8FD
	setstepcallback 3
	end

PacifidlogTown_EventScript_NinjaBoy:: @ 814E900
	msgbox PacifidlogTown_Text_NeatHousesOnWater, MSGBOX_NPC
	end

PacifidlogTown_EventScript_Girl:: @ 814E909
	msgbox PacifidlogTown_Text_FastRunningCurrent, MSGBOX_NPC
	end

PacifidlogTown_EventScript_Fisherman:: @ 814E912
	msgbox PacifidlogTown_Text_FishAndDiveLifestyle, MSGBOX_NPC
	end

PacifidlogTown_EventScript_TownSign:: @ 814E91B
	msgbox PacifidlogTown_Text_TownSign, MSGBOX_SIGN
	end
