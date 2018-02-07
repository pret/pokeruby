Route123_BerryMastersHouse_MapScripts:: @ 81639DF
	map_script 3, Route123_BerryMastersHouse_MapScript1_1639E5
	.byte 0

Route123_BerryMastersHouse_MapScript1_1639E5:: @ 81639E5
	setflag FLAG_LANDMARK_BERRY_MASTERS_HOUSE
	end

Route123_BerryMastersHouse_EventScript_1639E9:: @ 81639E9
	lock
	faceplayer
	dodailyevents
	goto_if_set FLAG_DAILY_RECEIVED_BERRY_FROM_BERRYMASTER, Route123_BerryMastersHouse_EventScript_163A5A
	msgbox Route123_BerryMastersHouse_Text_1C5BC4, 4
	random 10
	addvar RESULT, 20
	addvar RESULT, 133
	giveitem_std RESULT
	compare RESULT, 0
	goto_if_eq Route123_BerryMastersHouse_EventScript_1A029B
	setflag FLAG_DAILY_RECEIVED_BERRY_FROM_BERRYMASTER
	msgbox Route123_BerryMastersHouse_Text_1C5C66, 4
	random 10
	addvar RESULT, 20
	addvar RESULT, 133
	giveitem_std RESULT
	compare RESULT, 0
	goto_if_eq Route123_BerryMastersHouse_EventScript_1A029B
	msgbox Route123_BerryMastersHouse_Text_1C5C83, 4
	release
	end

Route123_BerryMastersHouse_EventScript_163A5A:: @ 8163A5A
	msgbox Route123_BerryMastersHouse_Text_1C5CDC, 4
	release
	end

Route123_BerryMastersHouse_EventScript_163A64:: @ 8163A64
	lock
	faceplayer
	dodailyevents
	goto_if_set FLAG_DAILY_RECEIVED_BERRY_FROM_BERRYMASTER_WIFE, Route123_BerryMastersHouse_EventScript_163C13
	msgbox Route123_BerryMastersHouse_Text_1C5D24, 4
	setvar VAR_SPECIAL_4, 13
	call Route123_BerryMastersHouse_EventScript_1A00F3
	lock
	faceplayer
	compare RESULT, 1
	goto_if_eq Route123_BerryMastersHouse_EventScript_163AAD
	compare RESULT, 0
	goto_if_eq Route123_BerryMastersHouse_EventScript_163A9B
	end

Route123_BerryMastersHouse_EventScript_163A9B:: @ 8163A9B
	msgbox Route123_BerryMastersHouse_Text_1C5EC0, 4
	msgbox Route123_BerryMastersHouse_Text_1C5E59, 4
	release
	end

Route123_BerryMastersHouse_EventScript_163AAD:: @ 8163AAD
	compare VAR_SPECIAL_4, 0
	goto_if_eq Route123_BerryMastersHouse_EventScript_163AF0
	compare VAR_SPECIAL_4, 1
	goto_if_eq Route123_BerryMastersHouse_EventScript_163B1E
	compare VAR_SPECIAL_4, 2
	goto_if_eq Route123_BerryMastersHouse_EventScript_163B4F
	compare VAR_SPECIAL_4, 3
	goto_if_eq Route123_BerryMastersHouse_EventScript_163B80
	compare VAR_SPECIAL_4, 4
	goto_if_eq Route123_BerryMastersHouse_EventScript_163BB1
	compare VAR_SPECIAL_4, 5
	goto_if_eq Route123_BerryMastersHouse_EventScript_163BE2
	end

Route123_BerryMastersHouse_EventScript_163AF0:: @ 8163AF0
	msgbox Route123_BerryMastersHouse_Text_1C5E0E, 4
	random 10
	addvar RESULT, ITEM_CHERI_BERRY
	giveitem_std RESULT
	compare RESULT, 0
	goto_if_eq Route123_BerryMastersHouse_EventScript_1A029B
	goto Route123_BerryMastersHouse_EventScript_163C1D
	release
	end

Route123_BerryMastersHouse_EventScript_163B1E:: @ 8163B1E
	goto_if_set FLAG_RECEIVED_SPELON_BERRY, Route123_BerryMastersHouse_EventScript_163AF0
	msgbox Route123_BerryMastersHouse_Text_1C5DC1, 4
	giveitem_std ITEM_SPELON_BERRY
	compare RESULT, 0
	goto_if_eq Route123_BerryMastersHouse_EventScript_1A029B
	setflag FLAG_RECEIVED_SPELON_BERRY
	goto Route123_BerryMastersHouse_EventScript_163C1D
	end

Route123_BerryMastersHouse_EventScript_163B4F:: @ 8163B4F
	goto_if_set FLAG_RECEIVED_PAMTRE_BERRY, Route123_BerryMastersHouse_EventScript_163AF0
	msgbox Route123_BerryMastersHouse_Text_1C5DC1, 4
	giveitem_std ITEM_PAMTRE_BERRY
	compare RESULT, 0
	goto_if_eq Route123_BerryMastersHouse_EventScript_1A029B
	setflag FLAG_RECEIVED_PAMTRE_BERRY
	goto Route123_BerryMastersHouse_EventScript_163C1D
	end

Route123_BerryMastersHouse_EventScript_163B80:: @ 8163B80
	goto_if_set FLAG_RECEIVED_WATMEL_BERRY, Route123_BerryMastersHouse_EventScript_163AF0
	msgbox Route123_BerryMastersHouse_Text_1C5DC1, 4
	giveitem_std ITEM_WATMEL_BERRY
	compare RESULT, 0
	goto_if_eq Route123_BerryMastersHouse_EventScript_1A029B
	setflag FLAG_RECEIVED_WATMEL_BERRY
	goto Route123_BerryMastersHouse_EventScript_163C1D
	end

Route123_BerryMastersHouse_EventScript_163BB1:: @ 8163BB1
	goto_if_set FLAG_RECEIVED_DURIN_BERRY, Route123_BerryMastersHouse_EventScript_163AF0
	msgbox Route123_BerryMastersHouse_Text_1C5DC1, 4
	giveitem_std ITEM_DURIN_BERRY
	compare RESULT, 0
	goto_if_eq Route123_BerryMastersHouse_EventScript_1A029B
	setflag FLAG_RECEIVED_DURIN_BERRY
	goto Route123_BerryMastersHouse_EventScript_163C1D
	end

Route123_BerryMastersHouse_EventScript_163BE2:: @ 8163BE2
	goto_if_set FLAG_RECEIVED_BELUE_BERRY, Route123_BerryMastersHouse_EventScript_163AF0
	msgbox Route123_BerryMastersHouse_Text_1C5DC1, 4
	giveitem_std ITEM_BELUE_BERRY
	compare RESULT, 0
	goto_if_eq Route123_BerryMastersHouse_EventScript_1A029B
	setflag FLAG_RECEIVED_BELUE_BERRY
	goto Route123_BerryMastersHouse_EventScript_163C1D
	end

Route123_BerryMastersHouse_EventScript_163C13:: @ 8163C13
	msgbox Route123_BerryMastersHouse_Text_1C5E59, 4
	release
	end

Route123_BerryMastersHouse_EventScript_163C1D:: @ 8163C1D
	setflag FLAG_DAILY_RECEIVED_BERRY_FROM_BERRYMASTER_WIFE
	msgbox Route123_BerryMastersHouse_Text_1C5E59, 4
	release
	end
