PacifidlogTown_MapScripts:: @ 814E8EE
	map_script MAP_SCRIPT_ON_TRANSITION, PacifidlogTown_MapScript1_14E8F9
	map_script MAP_SCRIPT_ON_RESUME, PacifidlogTown_MapScript1_14E8FD
	.byte 0

PacifidlogTown_MapScript1_14E8F9:: @ 814E8F9
	setflag FLAG_VISITED_PACIFIDLOG_TOWN
	end

PacifidlogTown_MapScript1_14E8FD:: @ 814E8FD
	setstepcallback 3
	end

PacifidlogTown_EventScript_14E900:: @ 814E900
	msgbox PacifidlogTown_Text_16D04A, MSGBOX_NPC
	end

PacifidlogTown_EventScript_14E909:: @ 814E909
	msgbox PacifidlogTown_Text_16CFC5, MSGBOX_NPC
	end

PacifidlogTown_EventScript_14E912:: @ 814E912
	msgbox PacifidlogTown_Text_16D08A, MSGBOX_NPC
	end

PacifidlogTown_EventScript_14E91B:: @ 814E91B
	msgbox PacifidlogTown_Text_16D0CE, MSGBOX_SIGN
	end
