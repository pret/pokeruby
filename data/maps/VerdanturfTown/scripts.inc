VerdanturfTown_MapScripts:: @ 814E854
	map_script MAP_SCRIPT_ON_TRANSITION, VerdanturfTown_MapScript1_14E85A
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
	msgbox VerdanturfTown_Text_16CAEB, MSGBOX_DEFAULT
	applymovement 2, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

VerdanturfTown_EventScript_14E885:: @ 814E885
	msgbox VerdanturfTown_Text_16CBCE, MSGBOX_DEFAULT
	applymovement 2, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

VerdanturfTown_EventScript_14E899:: @ 814E899
	msgbox VerdanturfTown_Text_16CC24, MSGBOX_NPC
	end

VerdanturfTown_EventScript_14E8A2:: @ 814E8A2
	msgbox VerdanturfTown_Text_16CCD0, MSGBOX_NPC
	end

VerdanturfTown_EventScript_14E8AB:: @ 814E8AB
	lock
	faceplayer
	goto_if_set FLAG_RUSTURF_TUNNEL_OPENED, VerdanturfTown_EventScript_14E8C0
	msgbox VerdanturfTown_Text_16CD4D, MSGBOX_DEFAULT
	release
	end

VerdanturfTown_EventScript_14E8C0:: @ 814E8C0
	msgbox VerdanturfTown_Text_16CE30, MSGBOX_DEFAULT
	release
	end

VerdanturfTown_EventScript_14E8CA:: @ 814E8CA
	msgbox VerdanturfTown_Text_16CEC0, MSGBOX_SIGN
	end

VerdanturfTown_EventScript_14E8D3:: @ 814E8D3
	msgbox VerdanturfTown_Text_16CF0D, MSGBOX_SIGN
	end

VerdanturfTown_EventScript_14E8DC:: @ 814E8DC
	msgbox VerdanturfTown_Text_16CF1B, MSGBOX_SIGN
	end

VerdanturfTown_EventScript_14E8E5:: @ 814E8E5
	msgbox VerdanturfTown_Text_16CF6D, MSGBOX_SIGN
	end
