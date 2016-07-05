Route123_BerryMastersHouse_MapScripts:: @ 81639DF
	map_script 3, Route123_BerryMastersHouse_MapScript1_1639E5
	.byte 0

Route123_BerryMastersHouse_MapScript1_1639E5:: @ 81639E5
	setflag 2147
	end

Route123_BerryMastersHouse_EventScript_1639E9:: @ 81639E9
	lock
	faceplayer
	checkdailyflags
	checkflag 2253
	jumpeq Route123_BerryMastersHouse_EventScript_163A5A
	msgbox Route123_BerryMastersHouse_Text_1C5BC4, 4
	random 10
	addvar RESULT, 20
	addvar RESULT, 133
	giveitem RESULT
	compare RESULT, 0
	jumpeq Route123_BerryMastersHouse_EventScript_1A029B
	setflag 2253
	msgbox Route123_BerryMastersHouse_Text_1C5C66, 4
	random 10
	addvar RESULT, 20
	addvar RESULT, 133
	giveitem RESULT
	compare RESULT, 0
	jumpeq Route123_BerryMastersHouse_EventScript_1A029B
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
	checkdailyflags
	checkflag 2257
	jumpeq Route123_BerryMastersHouse_EventScript_163C13
	msgbox Route123_BerryMastersHouse_Text_1C5D24, 4
	setvar 0x8004, 13
	call Route123_BerryMastersHouse_EventScript_1A00F3
	lock
	faceplayer
	compare RESULT, 1
	jumpeq Route123_BerryMastersHouse_EventScript_163AAD
	compare RESULT, 0
	jumpeq Route123_BerryMastersHouse_EventScript_163A9B
	end

Route123_BerryMastersHouse_EventScript_163A9B:: @ 8163A9B
	msgbox Route123_BerryMastersHouse_Text_1C5EC0, 4
	msgbox Route123_BerryMastersHouse_Text_1C5E59, 4
	release
	end

Route123_BerryMastersHouse_EventScript_163AAD:: @ 8163AAD
	compare 0x8004, 0
	jumpeq Route123_BerryMastersHouse_EventScript_163AF0
	compare 0x8004, 1
	jumpeq Route123_BerryMastersHouse_EventScript_163B1E
	compare 0x8004, 2
	jumpeq Route123_BerryMastersHouse_EventScript_163B4F
	compare 0x8004, 3
	jumpeq Route123_BerryMastersHouse_EventScript_163B80
	compare 0x8004, 4
	jumpeq Route123_BerryMastersHouse_EventScript_163BB1
	compare 0x8004, 5
	jumpeq Route123_BerryMastersHouse_EventScript_163BE2
	end

Route123_BerryMastersHouse_EventScript_163AF0:: @ 8163AF0
	msgbox Route123_BerryMastersHouse_Text_1C5E0E, 4
	random 10
	addvar RESULT, 133
	giveitem RESULT
	compare RESULT, 0
	jumpeq Route123_BerryMastersHouse_EventScript_1A029B
	jump Route123_BerryMastersHouse_EventScript_163C1D
	release
	end

Route123_BerryMastersHouse_EventScript_163B1E:: @ 8163B1E
	checkflag 248
	jumpeq Route123_BerryMastersHouse_EventScript_163AF0
	msgbox Route123_BerryMastersHouse_Text_1C5DC1, 4
	giveitem ITEM_SPELON_BERRY
	compare RESULT, 0
	jumpeq Route123_BerryMastersHouse_EventScript_1A029B
	setflag 248
	jump Route123_BerryMastersHouse_EventScript_163C1D
	end

Route123_BerryMastersHouse_EventScript_163B4F:: @ 8163B4F
	checkflag 249
	jumpeq Route123_BerryMastersHouse_EventScript_163AF0
	msgbox Route123_BerryMastersHouse_Text_1C5DC1, 4
	giveitem ITEM_PAMTRE_BERRY
	compare RESULT, 0
	jumpeq Route123_BerryMastersHouse_EventScript_1A029B
	setflag 249
	jump Route123_BerryMastersHouse_EventScript_163C1D
	end

Route123_BerryMastersHouse_EventScript_163B80:: @ 8163B80
	checkflag 250
	jumpeq Route123_BerryMastersHouse_EventScript_163AF0
	msgbox Route123_BerryMastersHouse_Text_1C5DC1, 4
	giveitem ITEM_WATMEL_BERRY
	compare RESULT, 0
	jumpeq Route123_BerryMastersHouse_EventScript_1A029B
	setflag 250
	jump Route123_BerryMastersHouse_EventScript_163C1D
	end

Route123_BerryMastersHouse_EventScript_163BB1:: @ 8163BB1
	checkflag 251
	jumpeq Route123_BerryMastersHouse_EventScript_163AF0
	msgbox Route123_BerryMastersHouse_Text_1C5DC1, 4
	giveitem ITEM_DURIN_BERRY
	compare RESULT, 0
	jumpeq Route123_BerryMastersHouse_EventScript_1A029B
	setflag 251
	jump Route123_BerryMastersHouse_EventScript_163C1D
	end

Route123_BerryMastersHouse_EventScript_163BE2:: @ 8163BE2
	checkflag 252
	jumpeq Route123_BerryMastersHouse_EventScript_163AF0
	msgbox Route123_BerryMastersHouse_Text_1C5DC1, 4
	giveitem ITEM_BELUE_BERRY
	compare RESULT, 0
	jumpeq Route123_BerryMastersHouse_EventScript_1A029B
	setflag 252
	jump Route123_BerryMastersHouse_EventScript_163C1D
	end

Route123_BerryMastersHouse_EventScript_163C13:: @ 8163C13
	msgbox Route123_BerryMastersHouse_Text_1C5E59, 4
	release
	end

Route123_BerryMastersHouse_EventScript_163C1D:: @ 8163C1D
	setflag 2257
	msgbox Route123_BerryMastersHouse_Text_1C5E59, 4
	release
	end
