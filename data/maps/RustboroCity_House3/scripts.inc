RustboroCity_House3_MapScripts:: @ 8157DEC
	.byte 0

RustboroCity_House3_EventScript_OldMan:: @ 8157DED
	msgbox RustboroCity_House3_Text_IGivePerfectlySuitedNicknames, MSGBOX_NPC
	end

RustboroCity_House3_EventScript_OldWoman:: @ 8157DF6
	msgbox RustboroCity_House3_Text_NamingPikachuPekachu, MSGBOX_NPC
	end

RustboroCity_House3_EventScript_Pekachu:: @ 8157DFF
	lock
	faceplayer
	waitse
	playmoncry SPECIES_PIKACHU, 0
	msgbox RustboroCity_House3_Text_Pekachu, MSGBOX_DEFAULT
	waitmoncry
	release
	end
