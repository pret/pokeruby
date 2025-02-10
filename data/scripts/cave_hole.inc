CaveHole_CheckFallDownHole:: @ 81C6BB5
	map_script_2 VAR_ICE_STEP_COUNT, 0, EventScript_FallDownHole
	.2byte 0

CaveHole_FixCrackedGround:: @ 81C6BBF
	copyvar VAR_ICE_STEP_COUNT, 1
	end

EventScript_FallDownHole:: @ 81C6BC5
	lockall
	delay 20
	applymovement LOCALID_PLAYER, Movement_SetInvisible
	waitmovement 0
	playse SE_FALL
	delay 60
	warphole MAP_UNDEFINED
	waitstate
	end

EventScript_FallDownHoleMtPyre:: @ 81C6BDE
	lockall
	delay 20
	applymovement LOCALID_PLAYER, Movement_SetInvisible
	waitmovement 0
	playse SE_FALL
	delay 60
	special DoFallWarp
	waitstate
	end

Movement_SetInvisible:: @ 81C6BF7
	set_invisible
	step_end
