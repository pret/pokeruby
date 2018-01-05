VerdanturfTown_MapScripts:: @ 814E854
	map_script 3, VerdanturfTown_MapScript1_14E85A
	.byte 0

VerdanturfTown_MapScript1_14E85A:: @ 814E85A
	setflag FLAG_VISITED_VERDANTURF_TOWN
	setvar VAR_LINK_CONTEST_ROOM_STATE, 0
	setflag FLAG_HIDE_CONTEST_REPORTER_VERDANTURF
	end

VerdanturfTown_EventScript_14E866:: @ 814E866
	lock
	faceplayer
	goto_if_set FLAG_RUSTURF_TUNNEL_OPENED, VerdanturfTown_EventScript_14E885
	msgbox VerdanturfTown_Text_16CAEB, 4
	applymovement 2, VerdanturfTown_Movement_1A083D
	waitmovement 0
	release
	end

VerdanturfTown_EventScript_14E885:: @ 814E885
	msgbox VerdanturfTown_Text_16CBCE, 4
	applymovement 2, VerdanturfTown_Movement_1A083D
	waitmovement 0
	release
	end

VerdanturfTown_EventScript_14E899:: @ 814E899
	msgbox VerdanturfTown_Text_16CC24, 2
	end

VerdanturfTown_EventScript_14E8A2:: @ 814E8A2
	msgbox VerdanturfTown_Text_16CCD0, 2
	end

VerdanturfTown_EventScript_14E8AB:: @ 814E8AB
	lock
	faceplayer
	goto_if_set FLAG_RUSTURF_TUNNEL_OPENED, VerdanturfTown_EventScript_14E8C0
	msgbox VerdanturfTown_Text_16CD4D, 4
	release
	end

VerdanturfTown_EventScript_14E8C0:: @ 814E8C0
	msgbox VerdanturfTown_Text_16CE30, 4
	release
	end

VerdanturfTown_EventScript_14E8CA:: @ 814E8CA
	msgbox VerdanturfTown_Text_16CEC0, 3
	end

VerdanturfTown_EventScript_14E8D3:: @ 814E8D3
	msgbox VerdanturfTown_Text_16CF0D, 3
	end

VerdanturfTown_EventScript_14E8DC:: @ 814E8DC
	msgbox VerdanturfTown_Text_16CF1B, 3
	end

VerdanturfTown_EventScript_14E8E5:: @ 814E8E5
	msgbox VerdanturfTown_Text_16CF6D, 3
	end
