PacifidlogTown_House4_MapScripts:: @ 815434B
	.byte 0

PacifidlogTown_House4_EventScript_LittleGirl:: @ 815434C
	msgbox PacifidlogTown_House4_Text_SkyPokemon, MSGBOX_NPC
	end

PacifidlogTown_House4_EventScript_Woman:: @ 8154355
	msgbox PacifidlogTown_House4_Text_PeopleSawHighFlyingPokemon, MSGBOX_NPC
	end

PacifidlogTown_House4_EventScript_Boy:: @ 815435E
	lock
	faceplayer
	msgbox PacifidlogTown_House4_Text_WhereDidYouComeFrom, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq PacifidlogTown_House4_EventScript_Yes
	compare VAR_RESULT, NO
	goto_if_eq PacifidlogTown_House4_EventScript_No
	end

PacifidlogTown_House4_EventScript_Yes:: @ 815437F
	msgbox PacifidlogTown_House4_Text_YesTown, MSGBOX_DEFAULT
	release
	end

PacifidlogTown_House4_EventScript_No:: @ 8154389
	msgbox PacifidlogTown_House4_Text_YouHaveToComeFromSomewhere, MSGBOX_DEFAULT
	release
	end
