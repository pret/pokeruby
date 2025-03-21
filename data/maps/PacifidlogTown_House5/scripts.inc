PacifidlogTown_House5_MapScripts:: @ 8154393
	.byte 0

PacifidlogTown_House5_EventScript_MirageIslandWatcher:: @ 8154394
	lock
	faceplayer
	specialvar VAR_RESULT, IsMirageIslandPresent
	compare VAR_RESULT, 1
	goto_if_eq PacifidlogTown_House5_EventScript_MirageIslandPresent
	msgbox PacifidlogTown_House5_Text_CantSeeMirageIslandToday, MSGBOX_DEFAULT
	release
	end

PacifidlogTown_House5_EventScript_MirageIslandPresent:: @ 81543B0
	msgbox PacifidlogTown_House5_Text_CanSeeMirageIslandToday, MSGBOX_DEFAULT
	release
	end

PacifidlogTown_House5_EventScript_Gentleman:: @ 81543BA
	msgbox PacifidlogTown_House5_Text_MirageIslandAppearDependingOnWeather, MSGBOX_NPC
	end
