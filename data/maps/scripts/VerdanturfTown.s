VerdanturfTown_MapScripts:: @ 814E854
	map_script 3, VerdanturfTown_MapScript1_14E85A
	.byte 0

VerdanturfTown_MapScript1_14E85A:: @ 814E85A
	setflag 2068
	setvar 0x4086, 0
	setflag 801
	end

VerdanturfTown_EventScript_14E866:: @ 814E866
	lock
	faceplayer
	checkflag 199
	jumpeq VerdanturfTown_EventScript_14E885
	loadptr 0, VerdanturfTown_Text_16CAEB
	callstd 4
	move 2, VerdanturfTown_Movement_1A083D
	waitmove 0
	release
	end

VerdanturfTown_EventScript_14E885:: @ 814E885
	loadptr 0, VerdanturfTown_Text_16CBCE
	callstd 4
	move 2, VerdanturfTown_Movement_1A083D
	waitmove 0
	release
	end

VerdanturfTown_EventScript_14E899:: @ 814E899
	loadptr 0, VerdanturfTown_Text_16CC24
	callstd 2
	end

VerdanturfTown_EventScript_14E8A2:: @ 814E8A2
	loadptr 0, VerdanturfTown_Text_16CCD0
	callstd 2
	end

VerdanturfTown_EventScript_14E8AB:: @ 814E8AB
	lock
	faceplayer
	checkflag 199
	jumpeq VerdanturfTown_EventScript_14E8C0
	loadptr 0, VerdanturfTown_Text_16CD4D
	callstd 4
	release
	end

VerdanturfTown_EventScript_14E8C0:: @ 814E8C0
	loadptr 0, VerdanturfTown_Text_16CE30
	callstd 4
	release
	end

VerdanturfTown_EventScript_14E8CA:: @ 814E8CA
	loadptr 0, VerdanturfTown_Text_16CEC0
	callstd 3
	end

VerdanturfTown_EventScript_14E8D3:: @ 814E8D3
	loadptr 0, VerdanturfTown_Text_16CF0D
	callstd 3
	end

VerdanturfTown_EventScript_14E8DC:: @ 814E8DC
	loadptr 0, VerdanturfTown_Text_16CF1B
	callstd 3
	end

VerdanturfTown_EventScript_14E8E5:: @ 814E8E5
	loadptr 0, VerdanturfTown_Text_16CF6D
	callstd 3
	end

