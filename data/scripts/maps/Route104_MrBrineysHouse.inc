Route104_MrBrineysHouse_MapScripts:: @ 815BCB2
	map_script 3, Route104_MrBrineysHouse_MapScript1_15BCB8
	.byte 0

Route104_MrBrineysHouse_MapScript1_15BCB8:: @ 815BCB8
	setflag 2109
	compare 0x4090, 1
	callif 1, Route104_MrBrineysHouse_EventScript_15BCD4
	checkflag 188
	callif 1, Route104_MrBrineysHouse_EventScript_15BCD0
	end

Route104_MrBrineysHouse_EventScript_15BCD0:: @ 815BCD0
	setflag 814
	return

Route104_MrBrineysHouse_EventScript_15BCD4:: @ 815BCD4
	movespriteperm 1, 9, 3
	spritebehave 1, 50
	movespriteperm 2, 9, 6
	spritebehave 2, 51
	return

Route104_MrBrineysHouse_EventScript_15BCEB:: @ 815BCEB
	lock
	faceplayer
	checkflag 147
	callif 0, Route104_MrBrineysHouse_EventScript_15BD0E
	checkflag 189
	jumpif 0, Route104_MrBrineysHouse_EventScript_15BD65
	checkflag 149
	jumpif 0, Route104_MrBrineysHouse_EventScript_15BD7E
	goto Route104_MrBrineysHouse_EventScript_15BD32
	end

Route104_MrBrineysHouse_EventScript_15BD0E:: @ 815BD0E
	setflag 147
	msgbox Route104_MrBrineysHouse_Text_191A82, 4
	msgbox Route104_MrBrineysHouse_Text_191AAD, 5
	compare RESULT, 0
	jumpeq Route104_MrBrineysHouse_EventScript_15BD97
	goto Route104_MrBrineysHouse_EventScript_15BDAB
	end

Route104_MrBrineysHouse_EventScript_15BD32:: @ 815BD32
	message Route104_MrBrineysHouse_Text_191E80
	waittext
	multichoicedef 21, 8, 14, 1, 0
	switch RESULT
	case 0, Route104_MrBrineysHouse_EventScript_15BDAB
	case 1, Route104_MrBrineysHouse_EventScript_15BDA1
	case 127, Route104_MrBrineysHouse_EventScript_15BDA1
	end

Route104_MrBrineysHouse_EventScript_15BD65:: @ 815BD65
	msgbox Route104_MrBrineysHouse_Text_191CC3, 5
	compare RESULT, 0
	jumpeq Route104_MrBrineysHouse_EventScript_15BD97
	goto Route104_MrBrineysHouse_EventScript_15BDAB
	end

Route104_MrBrineysHouse_EventScript_15BD7E:: @ 815BD7E
	msgbox Route104_MrBrineysHouse_Text_191DA6, 5
	compare RESULT, 0
	jumpeq Route104_MrBrineysHouse_EventScript_15BD97
	goto Route104_MrBrineysHouse_EventScript_15BDAB
	end

Route104_MrBrineysHouse_EventScript_15BD97:: @ 815BD97
	msgbox Route104_MrBrineysHouse_Text_191C57, 4
	release
	end

Route104_MrBrineysHouse_EventScript_15BDA1:: @ 815BDA1
	msgbox Route104_MrBrineysHouse_Text_191EDB, 4
	release
	end

Route104_MrBrineysHouse_EventScript_15BDAB:: @ 815BDAB
	msgbox Route104_MrBrineysHouse_Text_191BFD, 4
	call Route104_MrBrineysHouse_EventScript_1A010C
	setvar 0x408e, 1
	clearflag 738
	setflag 739
	setflag 881
	warp Route104, 255, 13, 51
	waitstate
	releaseall
	end

Route104_MrBrineysHouse_EventScript_15BDD1:: @ 815BDD1
	lock
	faceplayer
	checksound
	pokecry SPECIES_WINGULL, 0
	msgbox Route104_MrBrineysHouse_Text_191FB9, 4
	waitpokecry
	release
	end
