CaveOfOrigin_EventScript_LegendaryCry:: @ 81A04A0
	lockall
	waitse
	playmoncry SPECIES_GROUDON_OR_KYOGRE, 2
	waitmoncry
	setvar VAR_TEMP_5, 1
	releaseall
	end

CaveOfOrigin_EventScript_Shake1:: @ 81A04AF
	lockall
	setvar VAR_TEMP_1, 1
	goto CaveOfOrigin_EventScript_Shake
	end

CaveOfOrigin_EventScript_Shake2:: @ 81A04BB
	lockall
	setvar VAR_TEMP_2, 1
	goto CaveOfOrigin_EventScript_Shake
	end

@ Unused
CaveOfOrigin_EventScript_Shake3:: @ 81A04C7
	lockall
	setvar VAR_TEMP_3, 1
	goto CaveOfOrigin_EventScript_Shake
	end

CaveOfOrigin_EventScript_Shake:: @ 81A04D3
	setvar VAR_0x8004, 1
	setvar VAR_0x8005, 1
	special ShakeCamera
	waitstate
	releaseall
	end

CaveOfOrigin_EventScript_DisableTriggers:: @ 81A04E3
	setvar VAR_TEMP_1, 1
	setvar VAR_TEMP_2, 1
	setvar VAR_TEMP_3, 1
	setvar VAR_TEMP_4, 1
	setvar VAR_TEMP_5, 1
	return
