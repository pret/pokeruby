LilycoveCity_DepartmentStoreElevator_MapScripts:: @ 815A39B
	.byte 0

LilycoveCity_DepartmentStoreElevator_EventScript_15A39C:: @ 815A39C
	lock
	faceplayer
	checkflag 2
	callif FLAG_NOT_SET, LilycoveCity_DepartmentStoreElevator_EventScript_15A4CF
	copyvar 0x8005, 0x4043
	special 306
	message LilycoveCity_DepartmentStoreElevator_Text_1A0EF6
	waittext
	multichoice 0, 0, 57, 0
	switch RESULT
	case 0, LilycoveCity_DepartmentStoreElevator_EventScript_15A402
	case 1, LilycoveCity_DepartmentStoreElevator_EventScript_15A425
	case 2, LilycoveCity_DepartmentStoreElevator_EventScript_15A448
	case 3, LilycoveCity_DepartmentStoreElevator_EventScript_15A46B
	case 4, LilycoveCity_DepartmentStoreElevator_EventScript_15A48E
	case 127, LilycoveCity_DepartmentStoreElevator_EventScript_15A4B1
	end

LilycoveCity_DepartmentStoreElevator_EventScript_15A402:: @ 815A402
	warpplace LilycoveCity_DepartmentStore_1F, 255, 2, 1
	compare 0x4043, 0
	jumpif EQUAL, LilycoveCity_DepartmentStoreElevator_EventScript_15A4B1
	call LilycoveCity_DepartmentStoreElevator_EventScript_15A4B8
	setvar 0x4043, 0
	jump LilycoveCity_DepartmentStoreElevator_EventScript_15A4B1
	end

LilycoveCity_DepartmentStoreElevator_EventScript_15A425:: @ 815A425
	warpplace LilycoveCity_DepartmentStore_2F, 255, 2, 1
	compare 0x4043, 1
	jumpif EQUAL, LilycoveCity_DepartmentStoreElevator_EventScript_15A4B1
	call LilycoveCity_DepartmentStoreElevator_EventScript_15A4B8
	setvar 0x4043, 1
	jump LilycoveCity_DepartmentStoreElevator_EventScript_15A4B1
	end

LilycoveCity_DepartmentStoreElevator_EventScript_15A448:: @ 815A448
	warpplace LilycoveCity_DepartmentStore_3F, 255, 2, 1
	compare 0x4043, 2
	jumpif EQUAL, LilycoveCity_DepartmentStoreElevator_EventScript_15A4B1
	call LilycoveCity_DepartmentStoreElevator_EventScript_15A4B8
	setvar 0x4043, 2
	jump LilycoveCity_DepartmentStoreElevator_EventScript_15A4B1
	end

LilycoveCity_DepartmentStoreElevator_EventScript_15A46B:: @ 815A46B
	warpplace LilycoveCity_DepartmentStore_4F, 255, 2, 1
	compare 0x4043, 3
	jumpif EQUAL, LilycoveCity_DepartmentStoreElevator_EventScript_15A4B1
	call LilycoveCity_DepartmentStoreElevator_EventScript_15A4B8
	setvar 0x4043, 3
	jump LilycoveCity_DepartmentStoreElevator_EventScript_15A4B1
	end

LilycoveCity_DepartmentStoreElevator_EventScript_15A48E:: @ 815A48E
	warpplace LilycoveCity_DepartmentStore_5F, 255, 2, 1
	compare 0x4043, 4
	jumpif EQUAL, LilycoveCity_DepartmentStoreElevator_EventScript_15A4B1
	call LilycoveCity_DepartmentStoreElevator_EventScript_15A4B8
	setvar 0x4043, 4
	jump LilycoveCity_DepartmentStoreElevator_EventScript_15A4B1
	end

LilycoveCity_DepartmentStoreElevator_EventScript_15A4B1:: @ 815A4B1
	hidebox 0, 0, 29, 19
	release
	end

LilycoveCity_DepartmentStoreElevator_EventScript_15A4B8:: @ 815A4B8
	hidebox 0, 0, 29, 19
	move LAST_TALKED, LilycoveCity_DepartmentStoreElevator_Movement_1A0845
	waitmove 0
	special 273
	waitstate
	setflag 2
	return

LilycoveCity_DepartmentStoreElevator_EventScript_15A4CF:: @ 815A4CF
	special 216
	return
