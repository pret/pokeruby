MossdeepCity_House1_MapScripts:: @ 815A82E
	.byte 0

MossdeepCity_House1_EventScript_BlackBelt:: @ 815A82F
	lock
	faceplayer
	bufferleadmonspeciesname 0
	msgbox MossdeepCity_House1_Text_HmmYourPokemon, MSGBOX_DEFAULT
	specialvar VAR_RESULT, GetPokeblockNameByMonNature
	compare VAR_RESULT, 0
	goto_if_eq MossdeepCity_House1_EventScript_NeutralNature
	msgbox MossdeepCity_House1_Text_ItLikesXPokeblocks, MSGBOX_DEFAULT
	release
	end

MossdeepCity_House1_EventScript_NeutralNature:: @ 815A855
	msgbox MossdeepCity_House1_Text_DoesntLikeOrDislikePokeblocks, MSGBOX_DEFAULT
	release
	end

MossdeepCity_House1_EventScript_Woman:: @ 815A85F
	msgbox MossdeepCity_House1_Text_HusbandCanTellPokeblockMonLikes, MSGBOX_NPC
	end
