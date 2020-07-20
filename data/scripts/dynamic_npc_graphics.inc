Common_EventScript_SetupRivalGfxId:: @ 81A014E
	checkplayergender
	compare VAR_RESULT, MALE
	goto_if_eq EventScript_SetupRivalGfxIdFemale
	compare VAR_RESULT, FEMALE
	goto_if_eq EventScript_SetupRivalGfxIdMale
	end

EventScript_SetupRivalGfxIdFemale:: @ 81A0166
	setvar VAR_OBJ_GFX_ID_0, OBJ_EVENT_GFX_RIVAL_MAY_NORMAL
	return

EventScript_SetupRivalGfxIdMale:: @ 81A016C
	setvar VAR_OBJ_GFX_ID_0, OBJ_EVENT_GFX_RIVAL_BRENDAN_NORMAL
	return

Common_EventScript_SetupRivalOnBikeGfxId:: @ 81A0172
	checkplayergender
	compare VAR_RESULT, MALE
	goto_if_eq EventScript_SetupRivalOnBikeGfxIdFemale
	compare VAR_RESULT, FEMALE
	goto_if_eq EventScript_SetupRivalOnBikeGfxIdMale
	end

EventScript_SetupRivalOnBikeGfxIdFemale:: @ 81A018A
	setvar VAR_OBJ_GFX_ID_3, OBJ_EVENT_GFX_RIVAL_MAY_MACH_BIKE
	return

EventScript_SetupRivalOnBikeGfxIdMale:: @ 81A0190
	setvar VAR_OBJ_GFX_ID_3, OBJ_EVENT_GFX_RIVAL_BRENDAN_MACH_BIKE
	return

Common_EventScript_SetupEvilTeamGfxIds:: @ 81A0196
	.ifdef SAPPHIRE
	setvar VAR_OBJ_GFX_ID_1, OBJ_EVENT_GFX_AQUA_MEMBER_M
	setvar VAR_OBJ_GFX_ID_2, OBJ_EVENT_GFX_AQUA_MEMBER_F
	setvar VAR_OBJ_GFX_ID_4, OBJ_EVENT_GFX_MAGMA_MEMBER_M
	setvar VAR_OBJ_GFX_ID_5, OBJ_EVENT_GFX_MAGMA_MEMBER_F
	setvar VAR_OBJ_GFX_ID_6, OBJ_EVENT_GFX_ARCHIE
	setvar VAR_OBJ_GFX_ID_7, OBJ_EVENT_GFX_MAXIE
	.else
	setvar VAR_OBJ_GFX_ID_1, OBJ_EVENT_GFX_MAGMA_MEMBER_M
	setvar VAR_OBJ_GFX_ID_2, OBJ_EVENT_GFX_MAGMA_MEMBER_F
	setvar VAR_OBJ_GFX_ID_4, OBJ_EVENT_GFX_AQUA_MEMBER_M
	setvar VAR_OBJ_GFX_ID_5, OBJ_EVENT_GFX_AQUA_MEMBER_F
	setvar VAR_OBJ_GFX_ID_6, OBJ_EVENT_GFX_MAXIE
	setvar VAR_OBJ_GFX_ID_7, OBJ_EVENT_GFX_ARCHIE
	.endif
	return

Common_EventScript_SetupLegendaryGfxIds:: @ 81A01B5
	.ifdef SAPPHIRE
	setvar VAR_OBJ_GFX_ID_8, OBJ_EVENT_GFX_KYOGRE_1
	setvar VAR_OBJ_GFX_ID_9, OBJ_EVENT_GFX_KYOGRE_2
	.else
	setvar VAR_OBJ_GFX_ID_8, OBJ_EVENT_GFX_GROUDON_1
	setvar VAR_OBJ_GFX_ID_9, OBJ_EVENT_GFX_GROUDON_2
	.endif
	return
