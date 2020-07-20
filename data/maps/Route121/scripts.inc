Route121_MapScripts:: @ 8151AFE
	map_script MAP_SCRIPT_ON_TRANSITION, Route121_MapScript1_151B04
	.byte 0

Route121_MapScript1_151B04:: @ 8151B04
	call Common_EventScript_SetupEvilTeamGfxIds
	end

Route121_EventScript_151B0A:: @ 8151B0A
	msgbox Route121_Text_171CB4, MSGBOX_NPC
	end

Route121_EventScript_151B13:: @ 8151B13
	msgbox Route121_Text_171D0C, MSGBOX_SIGN
	end

Route121_EventScript_151B1C:: @ 8151B1C
	msgbox Route121_Text_171D5B, MSGBOX_SIGN
	end

Route121_EventScript_151B25:: @ 8151B25
	lockall
	msgbox Route121_Text_171C8F, MSGBOX_DEFAULT
	closemessage
	applymovement 12, Route121_Movement_151B57
	applymovement 13, Route121_Movement_151B60
	applymovement 14, Route121_Movement_151B69
	waitmovement 0
	removeobject 12
	removeobject 13
	removeobject 14
	setvar VAR_ROUTE121_STATE, 1
	releaseall
	end

Route121_Movement_151B57:: @ 8151B57
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	step_end

Route121_Movement_151B60:: @ 8151B60
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	step_end

Route121_Movement_151B69:: @ 8151B69
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	step_end

Route121_EventScript_151B72:: @ 8151B72
	trainerbattle_single TRAINER_VANESSA, Route121_Text_1BF96E, Route121_Text_1BF9A1
	msgbox Route121_Text_1BF9BA, MSGBOX_AUTOCLOSE
	end

Route121_EventScript_151B89:: @ 8151B89
	trainerbattle_single TRAINER_WALTER_1, Route121_Text_1BFA1B, Route121_Text_1BFA8C
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if_eq Route121_EventScript_151BB0
	msgbox Route121_Text_1BFA9D, MSGBOX_AUTOCLOSE
	end

Route121_EventScript_151BB0:: @ 8151BB0
	trainerbattle_rematch TRAINER_WALTER_1, Route121_Text_1BFADA, Route121_Text_1BFB4B
	msgbox Route121_Text_1BFB5C, MSGBOX_AUTOCLOSE
	end

Route121_EventScript_151BC7:: @ 8151BC7
	trainerbattle_single TRAINER_TAMMY, Route121_Text_1BFBB4, Route121_Text_1BFBEE
	msgbox Route121_Text_1BFBFD, MSGBOX_AUTOCLOSE
	end

Route121_EventScript_151BDE:: @ 8151BDE
	trainerbattle_double TRAINER_KATE_AND_JOY, Route121_Text_1BFC36, Route121_Text_1BFC7A, Route121_Text_1BFD08
	msgbox Route121_Text_1BFCB3, MSGBOX_AUTOCLOSE
	end

Route121_EventScript_151BF9:: @ 8151BF9
	trainerbattle_double TRAINER_KATE_AND_JOY, Route121_Text_1BFD60, Route121_Text_1BFDA3, Route121_Text_1BFE0D
	msgbox Route121_Text_1BFDC1, MSGBOX_AUTOCLOSE
	end

Route121_EventScript_151C14:: @ 8151C14
	trainerbattle_single TRAINER_JESSICA_1, Route121_Text_1BFE51, Route121_Text_1BFE80
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if_eq Route121_EventScript_151C3B
	msgbox Route121_Text_1BFEAE, MSGBOX_AUTOCLOSE
	end

Route121_EventScript_151C3B:: @ 8151C3B
	trainerbattle_rematch TRAINER_JESSICA_1, Route121_Text_1BFEDE, Route121_Text_1BFF0A
	msgbox Route121_Text_1BFF3A, MSGBOX_AUTOCLOSE
	end
