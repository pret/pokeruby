SSTidalRooms_MapScripts:: @ 815FF05
	.byte 0

SSTidalRooms_EventScript_15FF06:: @ 815FF06
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_TM49, SSTidalRooms_EventScript_15FF3D
	msgbox SSTidalRooms_Text_199B65, MSGBOX_DEFAULT
	giveitem ITEM_TM49_SNATCH
	compare VAR_RESULT, 0
	goto_if_eq SSTidalRooms_EventScript_1A029B
	setflag FLAG_RECEIVED_TM49
	msgbox SSTidalRooms_Text_199C1A, MSGBOX_DEFAULT
	release
	end

SSTidalRooms_EventScript_15FF3D:: @ 815FF3D
	msgbox SSTidalRooms_Text_199C1A, MSGBOX_DEFAULT
	release
	end

SSTidalRooms_EventScript_15FF47:: @ 815FF47
	lockall
	msgbox SSTidalRooms_Text_19956B, MSGBOX_DEFAULT
	closemessage
	call SSTidalRooms_EventScript_1A02CA
	call SSTidalRooms_EventScript_15FD64
	releaseall
	end

SSTidalRooms_EventScript_15FF5D:: @ 815FF5D
	trainerbattle_single TRAINER_COLTON, SSTidalRooms_Text_19958A, SSTidalRooms_Text_199613
	msgbox SSTidalRooms_Text_199630, MSGBOX_AUTOCLOSE
	end

SSTidalRooms_EventScript_15FF74:: @ 815FF74
	trainerbattle_single TRAINER_TUCKER, SSTidalRooms_Text_1996A6, SSTidalRooms_Text_1996BF
	msgbox SSTidalRooms_Text_1996E1, MSGBOX_AUTOCLOSE
	end

SSTidalRooms_EventScript_15FF8B:: @ 815FF8B
	trainerbattle_single TRAINER_THOMAS, SSTidalRooms_Text_199723, SSTidalRooms_Text_199747
	msgbox SSTidalRooms_Text_199778, MSGBOX_AUTOCLOSE
	end

SSTidalRooms_EventScript_15FFA2:: @ 815FFA2
	trainerbattle_double TRAINER_LEA_AND_JED, SSTidalRooms_Text_1997C1, SSTidalRooms_Text_199813, SSTidalRooms_Text_199887
	msgbox SSTidalRooms_Text_199820, MSGBOX_AUTOCLOSE
	end

SSTidalRooms_EventScript_15FFBD:: @ 815FFBD
	trainerbattle_double TRAINER_LEA_AND_JED, SSTidalRooms_Text_1998C5, SSTidalRooms_Text_19990E, SSTidalRooms_Text_199975
	msgbox SSTidalRooms_Text_19991C, MSGBOX_AUTOCLOSE
	end

SSTidalRooms_EventScript_15FFD8:: @ 815FFD8
	trainerbattle_single TRAINER_GARRET, SSTidalRooms_Text_1999B7, SSTidalRooms_Text_1999FF
	msgbox SSTidalRooms_Text_199A10, MSGBOX_AUTOCLOSE
	end

SSTidalRooms_EventScript_15FFEF:: @ 815FFEF
	trainerbattle_single TRAINER_ANETTE, SSTidalRooms_Text_199A62, SSTidalRooms_Text_199ABF
	msgbox SSTidalRooms_Text_199ADE, MSGBOX_AUTOCLOSE
	end
