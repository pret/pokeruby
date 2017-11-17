	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start Task_WateringBerryTreeAnim_0
Task_WateringBerryTreeAnim_0: @ 80C70A0
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C70B4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080C70B8 @ =Task_WateringBerryTreeAnim_1
	str r0, [r1]
	bx lr
	.align 2, 0
_080C70B4: .4byte gTasks
_080C70B8: .4byte Task_WateringBerryTreeAnim_1
	thumb_func_end Task_WateringBerryTreeAnim_0

	thumb_func_start Task_WateringBerryTreeAnim_1
Task_WateringBerryTreeAnim_1: @ 80C70BC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080C7120 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C7124 @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _080C70E8
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _080C711A
_080C70E8:
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl sub_8059D08
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl GetStepInPlaceDelay16AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldr r1, _080C7128 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C712C @ =Task_WateringBerryTreeAnim_2
	str r1, [r0]
_080C711A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C7120: .4byte gPlayerAvatar
_080C7124: .4byte gMapObjects
_080C7128: .4byte gTasks
_080C712C: .4byte Task_WateringBerryTreeAnim_2
	thumb_func_end Task_WateringBerryTreeAnim_1

	thumb_func_start Task_WateringBerryTreeAnim_2
Task_WateringBerryTreeAnim_2: @ 80C7130
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C7184 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C7188 @ =gMapObjects
	adds r5, r0, r1
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _080C7194
	ldr r1, _080C718C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0xA]
	adds r1, r0, 0x1
	strh r1, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	bgt _080C7190
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl GetStepInPlaceDelay16AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetSpecialAnim
	b _080C7194
	.align 2, 0
_080C7184: .4byte gPlayerAvatar
_080C7188: .4byte gMapObjects
_080C718C: .4byte gTasks
_080C7190:
	ldr r0, _080C719C @ =Task_WateringBerryTreeAnim_3
	str r0, [r2]
_080C7194:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C719C: .4byte Task_WateringBerryTreeAnim_3
	thumb_func_end Task_WateringBerryTreeAnim_2

	thumb_func_start Task_WateringBerryTreeAnim_3
Task_WateringBerryTreeAnim_3: @ 80C71A0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80597D0
	lsls r0, 24
	lsrs r0, 24
	bl SetPlayerAvatarTransitionFlags
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Task_WateringBerryTreeAnim_3

	thumb_func_start DoWateringBerryTreeAnim
DoWateringBerryTreeAnim: @ 80C71C4
	push {lr}
	ldr r0, _080C71D4 @ =Task_WateringBerryTreeAnim_0
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080C71D4: .4byte Task_WateringBerryTreeAnim_0
	thumb_func_end DoWateringBerryTreeAnim

	.align 2, 0 @ Don't pad with nop.
