RustboroCity_Flat2_1F_MapScripts:: @ 8157D79
	.byte 0

RustboroCity_Flat2_1F_EventScript_157D7A:: @ 8157D7A
	msgbox RustboroCity_Flat2_1F_Text_1853DD, MSGBOX_NPC
	end

RustboroCity_Flat2_1F_EventScript_157D83:: @ 8157D83
	lock
	faceplayer
	waitse
	playmoncry SPECIES_SKITTY, 0
	msgbox RustboroCity_Flat2_1F_Text_185410, MSGBOX_DEFAULT
	waitmoncry
	release
	end
