	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start GetAllGroundEffectFlags_OnSpawn
GetAllGroundEffectFlags_OnSpawn: @ 80635F0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl FieldObjectUpdateMetatileBehaviors
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_Reflection
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_TallGrassOnSpawn
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_LongGrassOnSpawn
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_SandHeap
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_ShallowFlowingWater
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_ShortGrass
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_HotSprings
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetAllGroundEffectFlags_OnSpawn

	thumb_func_start GetAllGroundEffectFlags_OnBeginStep
GetAllGroundEffectFlags_OnBeginStep: @ 8063638
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl FieldObjectUpdateMetatileBehaviors
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_Reflection
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_TallGrassOnBeginStep
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_LongGrassOnBeginStep
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_Tracks
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_SandHeap
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_ShallowFlowingWater
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_Puddle
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_ShortGrass
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_HotSprings
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetAllGroundEffectFlags_OnBeginStep

	thumb_func_start GetAllGroundEffectFlags_OnFinishStep
GetAllGroundEffectFlags_OnFinishStep: @ 8063690
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl FieldObjectUpdateMetatileBehaviors
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_ShallowFlowingWater
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_SandHeap
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_Puddle
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_Ripple
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_ShortGrass
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_HotSprings
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_Seaweed
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_JumpLanding
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetAllGroundEffectFlags_OnFinishStep

	thumb_func_start FieldObjectUpdateMetatileBehaviors
FieldObjectUpdateMetatileBehaviors: @ 80636E0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	movs r2, 0x16
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	strb r0, [r4, 0x1F]
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	strb r0, [r4, 0x1E]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FieldObjectUpdateMetatileBehaviors

	thumb_func_start GetGroundEffectFlags_Reflection
GetGroundEffectFlags_Reflection: @ 8063708
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, _0806374C @ =gUnknown_08376008
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	adds r0, r4, 0
	bl FieldObjectCheckForReflectiveSurface
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _08063750
	ldrb r1, [r4, 0x2]
	lsls r0, r1, 30
	cmp r0, 0
	blt _0806375A
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4, 0x2]
	subs r0, r2, 0x1
	lsls r0, 2
	add r0, sp
	ldr r1, [r5]
	ldr r0, [r0]
	orrs r1, r0
	str r1, [r5]
	b _0806375A
	.align 2, 0
_0806374C: .4byte gUnknown_08376008
_08063750:
	ldrb r1, [r4, 0x2]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x2]
_0806375A:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_Reflection

	thumb_func_start GetGroundEffectFlags_TallGrassOnSpawn
GetGroundEffectFlags_TallGrassOnSpawn: @ 8063764
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r0, 0x1E]
	bl MetatileBehavior_IsTallGrass
	lsls r0, 24
	cmp r0, 0
	beq _0806377C
	ldr r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	str r0, [r4]
_0806377C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_TallGrassOnSpawn

	thumb_func_start GetGroundEffectFlags_TallGrassOnBeginStep
GetGroundEffectFlags_TallGrassOnBeginStep: @ 8063784
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r0, 0x1E]
	bl MetatileBehavior_IsTallGrass
	lsls r0, 24
	cmp r0, 0
	beq _0806379C
	ldr r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	str r0, [r4]
_0806379C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_TallGrassOnBeginStep

	thumb_func_start GetGroundEffectFlags_LongGrassOnSpawn
GetGroundEffectFlags_LongGrassOnSpawn: @ 80637A4
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r0, 0x1E]
	bl MetatileBehavior_IsLongGrass
	lsls r0, 24
	cmp r0, 0
	beq _080637BC
	ldr r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	str r0, [r4]
_080637BC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_LongGrassOnSpawn

	thumb_func_start GetGroundEffectFlags_LongGrassOnBeginStep
GetGroundEffectFlags_LongGrassOnBeginStep: @ 80637C4
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r0, 0x1E]
	bl MetatileBehavior_IsLongGrass
	lsls r0, 24
	cmp r0, 0
	beq _080637DC
	ldr r0, [r4]
	movs r1, 0x8
	orrs r0, r1
	str r0, [r4]
_080637DC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_LongGrassOnBeginStep

	thumb_func_start GetGroundEffectFlags_Tracks
GetGroundEffectFlags_Tracks: @ 80637E4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x1F]
	bl MetatileBehavior_IsDeepSand
	lsls r0, 24
	cmp r0, 0
	beq _080637FE
	ldr r0, [r5]
	movs r1, 0x80
	lsls r1, 1
	b _0806381A
_080637FE:
	ldrb r0, [r4, 0x1F]
	bl MetatileBehavior_IsSandOrDeepSand
	lsls r0, 24
	cmp r0, 0
	bne _08063816
	ldrb r0, [r4, 0x1F]
	bl MetatileBehavior_IsUnusedFootprintMetatile
	lsls r0, 24
	cmp r0, 0
	beq _0806381E
_08063816:
	ldr r0, [r5]
	movs r1, 0x80
_0806381A:
	orrs r0, r1
	str r0, [r5]
_0806381E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_Tracks

	thumb_func_start GetGroundEffectFlags_SandHeap
GetGroundEffectFlags_SandHeap: @ 8063824
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x1E]
	bl MetatileBehavior_IsDeepSand
	lsls r0, 24
	cmp r0, 0
	beq _08063862
	ldrb r0, [r4, 0x1F]
	bl MetatileBehavior_IsDeepSand
	lsls r0, 24
	cmp r0, 0
	beq _08063862
	ldrb r1, [r4, 0x2]
	lsls r0, r1, 27
	cmp r0, 0
	blt _0806386C
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r4, 0x2]
	ldr r0, [r5]
	movs r1, 0x80
	lsls r1, 4
	orrs r0, r1
	str r0, [r5]
	b _0806386C
_08063862:
	ldrb r1, [r4, 0x2]
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x2]
_0806386C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_SandHeap

	thumb_func_start GetGroundEffectFlags_ShallowFlowingWater
GetGroundEffectFlags_ShallowFlowingWater: @ 8063874
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x1E]
	bl MetatileBehavior_IsShallowFlowingWater
	lsls r0, 24
	cmp r0, 0
	beq _08063892
	ldrb r0, [r4, 0x1F]
	bl MetatileBehavior_IsShallowFlowingWater
	lsls r0, 24
	cmp r0, 0
	bne _080638AA
_08063892:
	ldrb r0, [r4, 0x1E]
	bl MetatileBehavior_IsPacifidlogLog
	lsls r0, 24
	cmp r0, 0
	beq _080638C8
	ldrb r0, [r4, 0x1F]
	bl MetatileBehavior_IsPacifidlogLog
	lsls r0, 24
	cmp r0, 0
	beq _080638C8
_080638AA:
	ldrb r1, [r4, 0x2]
	lsls r0, r1, 28
	cmp r0, 0
	blt _080638D2
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4, 0x2]
	ldr r0, [r5]
	movs r1, 0x40
	orrs r0, r1
	str r0, [r5]
	b _080638D2
_080638C8:
	ldrb r1, [r4, 0x2]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x2]
_080638D2:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_ShallowFlowingWater

	thumb_func_start GetGroundEffectFlags_Puddle
GetGroundEffectFlags_Puddle: @ 80638D8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x1E]
	bl MetatileBehavior_IsPuddle
	lsls r0, 24
	cmp r0, 0
	beq _08063900
	ldrb r0, [r4, 0x1F]
	bl MetatileBehavior_IsPuddle
	lsls r0, 24
	cmp r0, 0
	beq _08063900
	ldr r0, [r5]
	movs r1, 0x80
	lsls r1, 3
	orrs r0, r1
	str r0, [r5]
_08063900:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_Puddle

	thumb_func_start GetGroundEffectFlags_Ripple
GetGroundEffectFlags_Ripple: @ 8063908
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r0, 0x1E]
	bl MetatileBehavior_HasRipples
	lsls r0, 24
	cmp r0, 0
	beq _08063922
	ldr r0, [r4]
	movs r1, 0x80
	lsls r1, 2
	orrs r0, r1
	str r0, [r4]
_08063922:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_Ripple

	thumb_func_start GetGroundEffectFlags_ShortGrass
GetGroundEffectFlags_ShortGrass: @ 8063928
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x1E]
	bl MetatileBehavior_IsShortGrass
	lsls r0, 24
	cmp r0, 0
	beq _08063966
	ldrb r0, [r4, 0x1F]
	bl MetatileBehavior_IsShortGrass
	lsls r0, 24
	cmp r0, 0
	beq _08063966
	ldrb r1, [r4, 0x2]
	lsls r0, r1, 29
	cmp r0, 0
	blt _08063970
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4, 0x2]
	ldr r0, [r5]
	movs r1, 0x80
	lsls r1, 10
	orrs r0, r1
	str r0, [r5]
	b _08063970
_08063966:
	ldrb r1, [r4, 0x2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x2]
_08063970:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_ShortGrass

	thumb_func_start GetGroundEffectFlags_HotSprings
GetGroundEffectFlags_HotSprings: @ 8063978
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x1E]
	bl MetatileBehavior_IsHotSprings
	lsls r0, 24
	cmp r0, 0
	beq _080639B6
	ldrb r0, [r4, 0x1F]
	bl MetatileBehavior_IsHotSprings
	lsls r0, 24
	cmp r0, 0
	beq _080639B6
	ldrb r1, [r4, 0x2]
	lsls r0, r1, 26
	cmp r0, 0
	blt _080639C0
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x2]
	ldr r0, [r5]
	movs r1, 0x80
	lsls r1, 11
	orrs r0, r1
	str r0, [r5]
	b _080639C0
_080639B6:
	ldrb r1, [r4, 0x2]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x2]
_080639C0:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_HotSprings

	thumb_func_start GetGroundEffectFlags_Seaweed
GetGroundEffectFlags_Seaweed: @ 80639C8
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r0, 0x1E]
	bl MetatileBehavior_IsSeaweed
	lsls r0, 24
	cmp r0, 0
	beq _080639E2
	ldr r0, [r4]
	movs r1, 0x80
	lsls r1, 12
	orrs r0, r1
	str r0, [r4]
_080639E2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_Seaweed

	thumb_func_start GetGroundEffectFlags_JumpLanding
GetGroundEffectFlags_JumpLanding: @ 80639E8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	adds r6, r1, 0
	ldr r0, [r7]
	ldr r1, _08063A24 @ =0x02000020
	ands r0, r1
	cmp r0, 0x20
	bne _08063A3A  @ Is player landing after jumping?
	movs r5, 0
	ldr r0, _08063A28 @ =gJumpLanding_MetatileFunctionPointers
	mov r8, r0
_08063A02:
	lsls r4, r5, 2
	mov r0, r8
	adds r1, r4, r0
	ldrb r0, [r7, 0x1E]  @ Load metatile behavior
	ldr r1, [r1]
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	beq _08063A30
	ldr r0, _08063A2C @ =gJumpLanding_Bitmasks
	adds r0, r4, r0
	ldr r1, [r6]
	ldr r0, [r0]
	orrs r1, r0
	str r1, [r6]
	b _08063A3A
	.align 2, 0
_08063A24: .4byte 0x02000020
_08063A28: .4byte gJumpLanding_MetatileFunctionPointers
_08063A2C: .4byte gJumpLanding_Bitmasks
_08063A30:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08063A02
_08063A3A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_JumpLanding

	thumb_func_start FieldObjectCheckForReflectiveSurface
FieldObjectCheckForReflectiveSurface: @ 8063A44
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r5, r0, 0
	ldrb r0, [r5, 0x5]
	bl GetFieldObjectGraphicsInfo
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	adds r1, 0x8
	lsls r1, 12
	lsrs r1, 16
	str r1, [sp]
	movs r1, 0xA
	ldrsh r0, [r0, r1]
	adds r0, 0x8
	lsls r0, 12
	movs r4, 0
	lsrs r2, r0, 16
	str r2, [sp, 0x4]
	asrs r0, 16
	cmp r4, r0
	blt _08063A7A
	b _08063B80
_08063A7A:
	movs r0, 0x1
	mov r10, r0
_08063A7E:
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	movs r2, 0x12
	ldrsh r1, [r5, r2]
	add r1, r10
	lsls r4, 16
	asrs r6, r4, 16
	adds r1, r6
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl GetReflectionTypeByMetatileBehavior
	lsls r0, 24
	lsrs r0, 24
	mov r9, r4
	cmp r0, 0
	bne _08063B82
	movs r1, 0x14
	ldrsh r0, [r5, r1]
	movs r2, 0x16
	ldrsh r1, [r5, r2]
	add r1, r10
	adds r1, r6
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl GetReflectionTypeByMetatileBehavior
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _08063B82
	movs r2, 0x1
	ldr r1, [sp]
	lsls r0, r1, 16
	asrs r1, r0, 16
	mov r8, r0
	cmp r2, r1
	bge _08063B6E
	movs r0, 0x80
	lsls r0, 9
	asrs r7, r0, 16
_08063AD8:
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	lsls r1, r2, 16
	asrs r4, r1, 16
	adds r0, r4
	movs r2, 0x12
	ldrsh r1, [r5, r2]
	adds r1, r7
	adds r1, r6
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl GetReflectionTypeByMetatileBehavior
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _08063B82
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	subs r0, r4
	movs r2, 0x12
	ldrsh r1, [r5, r2]
	adds r1, r7
	adds r1, r6
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl GetReflectionTypeByMetatileBehavior
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _08063B82
	movs r1, 0x14
	ldrsh r0, [r5, r1]
	adds r0, r4
	movs r2, 0x16
	ldrsh r1, [r5, r2]
	adds r1, r7
	adds r1, r6
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl GetReflectionTypeByMetatileBehavior
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _08063B82
	movs r1, 0x14
	ldrsh r0, [r5, r1]
	subs r0, r4
	movs r2, 0x16
	ldrsh r1, [r5, r2]
	adds r1, r7
	adds r1, r6
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl GetReflectionTypeByMetatileBehavior
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _08063B82
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r0, r8
	blt _08063AD8
_08063B6E:
	movs r1, 0x80
	lsls r1, 9
	add r1, r9
	lsrs r4, r1, 16
	ldr r2, [sp, 0x4]
	lsls r0, r2, 16
	cmp r1, r0
	bge _08063B80
	b _08063A7E
_08063B80:
	movs r0, 0
_08063B82:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end FieldObjectCheckForReflectiveSurface

	thumb_func_start GetReflectionTypeByMetatileBehavior
GetReflectionTypeByMetatileBehavior: @ 8063B94
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsIce
	lsls r0, 24
	cmp r0, 0
	beq _08063BAA
	movs r0, 0x1
	b _08063BBC
_08063BAA:
	adds r0, r4, 0
	bl MetatileBehavior_IsReflective
	lsls r0, 24
	cmp r0, 0
	bne _08063BBA
	movs r0, 0
	b _08063BBC
_08063BBA:
	movs r0, 0x2
_08063BBC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetReflectionTypeByMetatileBehavior

	thumb_func_start GetLedgeJumpDirection
GetLedgeJumpDirection: @ 8063BC4
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r4, r2, 24
	cmp r4, 0
	beq _08063C0A
	cmp r4, 0x4
	bls _08063BE0
	subs r0, r4, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
_08063BE0:
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r3, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08063C10 @ =gUnknown_08376040
	lsls r1, r4, 2
	adds r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08063C14
_08063C0A:
	movs r0, 0
	b _08063C1A
	.align 2, 0
_08063C10: .4byte gUnknown_08376040
_08063C14:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r0, 24
_08063C1A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetLedgeJumpDirection

	thumb_func_start FieldObjectSetSpriteOamTableForLongGrass
FieldObjectSetSpriteOamTableForLongGrass: @ 8063C20
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldrb r0, [r5]
	lsls r0, 27
	cmp r0, 0
	blt _08063C74
	ldrb r0, [r5, 0x1E]
	bl MetatileBehavior_IsLongGrass
	lsls r0, 24
	cmp r0, 0
	beq _08063C74
	ldrb r0, [r5, 0x1F]
	bl MetatileBehavior_IsLongGrass
	lsls r0, 24
	cmp r0, 0
	beq _08063C74
	adds r4, 0x42
	ldrb r1, [r4]
	movs r6, 0x40
	negs r6, r6
	adds r0, r6, 0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
	ldrb r0, [r5, 0xB]
	lsrs r0, 4
	bl ZCoordToPriority
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08063C74
	ldrb r0, [r4]
	adds r1, r6, 0
	ands r1, r0
	movs r0, 0x5
	orrs r1, r0
	strb r1, [r4]
_08063C74:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end FieldObjectSetSpriteOamTableForLongGrass

	thumb_func_start IsZCoordMismatchAt
IsZCoordMismatchAt: @ 8063C7C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 16
	lsrs r0, r1, 16
	lsls r2, 16
	lsrs r1, r2, 16
	cmp r4, 0
	beq _08063CAA
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08063CAA
	cmp r0, 0xF
	beq _08063CAA
	cmp r0, r4
	bne _08063CAE
_08063CAA:
	movs r0, 0
	b _08063CB0
_08063CAE:
	movs r0, 0x1
_08063CB0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsZCoordMismatchAt

	thumb_func_start FieldObjectUpdateZCoordAndPriority
FieldObjectUpdateZCoordAndPriority: @ 8063CB8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x3]
	lsls r0, 29
	cmp r0, 0
	blt _08063D06
	adds r0, r4, 0
	bl FieldObjectUpdateZCoord
	ldr r1, _08063D0C @ =gFieldObjectPriorities_08376070
	ldrb r2, [r4, 0xB]
	lsls r2, 24
	lsrs r0, r2, 28
	adds r0, r1
	ldrb r0, [r0]
	adds r4, r5, 0
	adds r4, 0x42
	movs r1, 0x3F
	ands r1, r0
	ldrb r3, [r4]
	movs r0, 0x40
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r4]
	ldr r0, _08063D10 @ =gFieldObjectPriorities_08376060
	lsrs r2, 28
	adds r2, r0
	movs r0, 0x3
	ldrb r1, [r2]
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
_08063D06:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063D0C: .4byte gFieldObjectPriorities_08376070
_08063D10: .4byte gFieldObjectPriorities_08376060
	thumb_func_end FieldObjectUpdateZCoordAndPriority

	thumb_func_start InitObjectPriorityByZCoord
InitObjectPriorityByZCoord: @ 8063D14
	push {r4,lr}
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08063D58 @ =gFieldObjectPriorities_08376070
	adds r2, r1, r2
	ldrb r2, [r2]
	movs r3, 0x42
	adds r3, r0
	mov r12, r3
	movs r3, 0x3F
	ands r3, r2
	mov r2, r12
	ldrb r4, [r2]
	movs r2, 0x40
	negs r2, r2
	ands r2, r4
	orrs r2, r3
	mov r3, r12
	strb r2, [r3]
	ldr r2, _08063D5C @ =gFieldObjectPriorities_08376060
	adds r1, r2
	movs r3, 0x3
	ldrb r2, [r1]
	ands r2, r3
	lsls r2, 2
	ldrb r3, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, 0x5]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063D58: .4byte gFieldObjectPriorities_08376070
_08063D5C: .4byte gFieldObjectPriorities_08376060
	thumb_func_end InitObjectPriorityByZCoord

	thumb_func_start ZCoordToPriority
ZCoordToPriority: @ 8063D60
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08063D6C @ =gFieldObjectPriorities_08376060
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08063D6C: .4byte gFieldObjectPriorities_08376060
	thumb_func_end ZCoordToPriority

	thumb_func_start FieldObjectUpdateZCoord
FieldObjectUpdateZCoord: @ 8063D70
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	movs r2, 0x16
	ldrsh r1, [r4, r2]
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r0, 24
	cmp r5, 0xF
	beq _08063DBE
	cmp r0, 0xF
	beq _08063DBE
	movs r3, 0xF
	adds r0, r5, 0
	ands r0, r3
	ldrb r1, [r4, 0xB]
	movs r2, 0x10
	negs r2, r2
	ands r2, r1
	orrs r2, r0
	strb r2, [r4, 0xB]
	cmp r5, 0
	beq _08063DBE
	cmp r5, 0xF
	beq _08063DBE
	lsls r0, r5, 4
	ands r2, r3
	orrs r2, r0
	strb r2, [r4, 0xB]
_08063DBE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end FieldObjectUpdateZCoord

	thumb_func_start SetObjectSubpriorityByZCoord
SetObjectSubpriorityByZCoord: @ 8063DC4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 24
	lsrs r2, 24
	adds r3, r1, 0
	adds r3, 0x29
	movs r5, 0
	ldrsb r5, [r3, r5]
	ldrh r4, [r1, 0x22]
	ldr r3, _08063E04 @ =gSpriteCoordOffsetY
	subs r4, r5
	ldrh r3, [r3]
	adds r4, r3
	adds r4, 0x8
	movs r3, 0xFF
	ands r4, r3
	lsrs r4, 4
	movs r3, 0x10
	subs r3, r4
	lsls r3, 17
	ldr r4, _08063E08 @ =gUnknown_08376050
	adds r0, r4
	lsrs r3, 16
	ldrb r0, [r0]
	adds r3, r0
	adds r2, r3
	adds r1, 0x43
	strb r2, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063E04: .4byte gSpriteCoordOffsetY
_08063E08: .4byte gUnknown_08376050
	thumb_func_end SetObjectSubpriorityByZCoord

	thumb_func_start FieldObjectUpdateSubpriority
FieldObjectUpdateSubpriority: @ 8063E0C
	push {lr}
	adds r2, r0, 0
	ldrb r0, [r2, 0x3]
	lsls r0, 29
	cmp r0, 0
	blt _08063E22
	ldrb r0, [r2, 0xB]
	lsrs r0, 4
	movs r2, 0x1
	bl SetObjectSubpriorityByZCoord
_08063E22:
	pop {r0}
	bx r0
	thumb_func_end FieldObjectUpdateSubpriority

	thumb_func_start AreZCoordsCompatible
AreZCoordsCompatible: @ 8063E28
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r0, 0
	beq _08063E3E
	cmp r1, 0
	beq _08063E3E
	cmp r0, r1
	bne _08063E42
_08063E3E:
	movs r0, 0x1
	b _08063E44
_08063E42:
	movs r0, 0
_08063E44:
	pop {r1}
	bx r1
	thumb_func_end AreZCoordsCompatible

	thumb_func_start GroundEffect_SpawnOnTallGrass
GroundEffect_SpawnOnTallGrass: @ 8063E48
	push {lr}
	ldr r3, _08063E8C @ =gUnknown_0202FF84
	movs r2, 0x10
	ldrsh r1, [r0, r2]
	str r1, [r3]
	movs r2, 0x12
	ldrsh r1, [r0, r2]
	str r1, [r3, 0x4]
	ldrb r1, [r0, 0xB]
	lsrs r1, 4
	str r1, [r3, 0x8]
	movs r1, 0x2
	str r1, [r3, 0xC]
	ldrb r1, [r0, 0x8]
	lsls r1, 8
	ldrb r2, [r0, 0x9]
	orrs r1, r2
	str r1, [r3, 0x10]
	ldrb r0, [r0, 0xA]
	str r0, [r3, 0x14]
	ldr r1, _08063E90 @ =gSaveBlock1
	ldrb r0, [r1, 0x5]
	lsls r0, 8
	ldrb r1, [r1, 0x4]
	orrs r0, r1
	str r0, [r3, 0x18]
	movs r0, 0x1
	str r0, [r3, 0x1C]
	movs r0, 0x4
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_08063E8C: .4byte gUnknown_0202FF84
_08063E90: .4byte gSaveBlock1
	thumb_func_end GroundEffect_SpawnOnTallGrass

	thumb_func_start sub_8063E94
sub_8063E94: @ 8063E94
	push {lr}
	ldr r3, _08063ED8 @ =gUnknown_0202FF84
	movs r2, 0x10
	ldrsh r1, [r0, r2]
	str r1, [r3]
	movs r2, 0x12
	ldrsh r1, [r0, r2]
	str r1, [r3, 0x4]
	ldrb r1, [r0, 0xB]
	lsrs r1, 4
	str r1, [r3, 0x8]
	movs r1, 0x2
	str r1, [r3, 0xC]
	ldrb r1, [r0, 0x8]
	lsls r1, 8
	ldrb r2, [r0, 0x9]
	orrs r1, r2
	str r1, [r3, 0x10]
	ldrb r0, [r0, 0xA]
	str r0, [r3, 0x14]
	ldr r1, _08063EDC @ =gSaveBlock1
	ldrb r0, [r1, 0x5]
	lsls r0, 8
	ldrb r1, [r1, 0x4]
	orrs r0, r1
	str r0, [r3, 0x18]
	movs r0, 0
	str r0, [r3, 0x1C]
	movs r0, 0x4
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_08063ED8: .4byte gUnknown_0202FF84
_08063EDC: .4byte gSaveBlock1
	thumb_func_end sub_8063E94

	thumb_func_start sub_8063EE0
sub_8063EE0: @ 8063EE0
	push {lr}
	ldr r3, _08063F24 @ =gUnknown_0202FF84
	movs r2, 0x10
	ldrsh r1, [r0, r2]
	str r1, [r3]
	movs r2, 0x12
	ldrsh r1, [r0, r2]
	str r1, [r3, 0x4]
	ldrb r1, [r0, 0xB]
	lsrs r1, 4
	str r1, [r3, 0x8]
	movs r1, 0x2
	str r1, [r3, 0xC]
	ldrb r1, [r0, 0x8]
	lsls r1, 8
	ldrb r2, [r0, 0x9]
	orrs r1, r2
	str r1, [r3, 0x10]
	ldrb r0, [r0, 0xA]
	str r0, [r3, 0x14]
	ldr r1, _08063F28 @ =gSaveBlock1
	ldrb r0, [r1, 0x5]
	lsls r0, 8
	ldrb r1, [r1, 0x4]
	orrs r0, r1
	str r0, [r3, 0x18]
	movs r0, 0x1
	str r0, [r3, 0x1C]
	movs r0, 0x11
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_08063F24: .4byte gUnknown_0202FF84
_08063F28: .4byte gSaveBlock1
	thumb_func_end sub_8063EE0

	thumb_func_start sub_8063F2C
sub_8063F2C: @ 8063F2C
	push {lr}
	ldr r3, _08063F70 @ =gUnknown_0202FF84
	movs r2, 0x10
	ldrsh r1, [r0, r2]
	str r1, [r3]
	movs r2, 0x12
	ldrsh r1, [r0, r2]
	str r1, [r3, 0x4]
	ldrb r1, [r0, 0xB]
	lsrs r1, 4
	str r1, [r3, 0x8]
	movs r1, 0x2
	str r1, [r3, 0xC]
	ldrb r1, [r0, 0x8]
	lsls r1, 8
	ldrb r2, [r0, 0x9]
	orrs r1, r2
	str r1, [r3, 0x10]
	ldrb r0, [r0, 0xA]
	str r0, [r3, 0x14]
	ldr r1, _08063F74 @ =gSaveBlock1
	ldrb r0, [r1, 0x5]
	lsls r0, 8
	ldrb r1, [r1, 0x4]
	orrs r0, r1
	str r0, [r3, 0x18]
	movs r0, 0
	str r0, [r3, 0x1C]
	movs r0, 0x11
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_08063F70: .4byte gUnknown_0202FF84
_08063F74: .4byte gSaveBlock1
	thumb_func_end sub_8063F2C

	thumb_func_start GroundEffect_WaterReflection
GroundEffect_WaterReflection: @ 8063F78
	push {lr}
	movs r2, 0
	bl SetUpReflection
	pop {r0}
	bx r0
	thumb_func_end GroundEffect_WaterReflection

	thumb_func_start GroundEffect_IceReflection
GroundEffect_IceReflection: @ 8063F84
	push {lr}
	movs r2, 0x1
	bl SetUpReflection
	pop {r0}
	bx r0
	thumb_func_end GroundEffect_IceReflection

	thumb_func_start GroundEffect_FlowingWater
GroundEffect_FlowingWater: @ 8063F90
	push {lr}
	adds r1, r0, 0
	movs r0, 0x22
	bl oe_exec_and_other_stuff
	pop {r0}
	bx r0
	thumb_func_end GroundEffect_FlowingWater

	thumb_func_start sub_8063FA0
sub_8063FA0: @ 8063FA0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x5]
	bl GetFieldObjectGraphicsInfo
	ldr r1, _08063FC8 @ =gUnknown_08376080
	ldrb r0, [r0, 0xD]
	lsls r0, 2
	adds r0, r1
	ldr r3, [r0]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	bl _call_via_r3
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063FC8: .4byte gUnknown_08376080
	thumb_func_end sub_8063FA0

	thumb_func_start sub_8063FCC
sub_8063FCC: @ 8063FCC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x5]
	bl GetFieldObjectGraphicsInfo
	ldr r1, _08063FF4 @ =gUnknown_08376080
	ldrb r0, [r0, 0xD]
	lsls r0, 2
	adds r0, r1
	ldr r3, [r0]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl _call_via_r3
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063FF4: .4byte gUnknown_08376080
	thumb_func_end sub_8063FCC

	thumb_func_start nullsub_50
nullsub_50: @ 8063FF8
	bx lr
	thumb_func_end nullsub_50

	thumb_func_start DoTracksGroundEffect_Footprints
DoTracksGroundEffect_Footprints: @ 8063FFC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r4, r2, 24
	lsrs r4, 24
	ldr r1, _08064044 @ =gSandFootprints_FieldEffectData
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	ldr r1, _08064048 @ =gUnknown_0202FF84
	movs r2, 0x14
	ldrsh r0, [r5, r2]
	str r0, [r1]
	movs r2, 0x16
	ldrsh r0, [r5, r2]
	str r0, [r1, 0x4]
	movs r0, 0x95
	str r0, [r1, 0x8]
	movs r0, 0x2
	str r0, [r1, 0xC]
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	str r0, [r1, 0x10]
	lsls r4, 1
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	bl FieldEffectStart
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064044: .4byte gSandFootprints_FieldEffectData
_08064048: .4byte gUnknown_0202FF84
	thumb_func_end DoTracksGroundEffect_Footprints

	thumb_func_start DoTracksGroundEffect_BikeTireTracks
DoTracksGroundEffect_BikeTireTracks: @ 806404C
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, [r4, 0x10]
	ldr r0, [r4, 0x14]
	cmp r1, r0
	beq _0806408E
	ldr r2, _08064094 @ =gUnknown_0202FF84
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	str r0, [r2]
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	str r0, [r2, 0x4]
	movs r0, 0x95
	str r0, [r2, 0x8]
	movs r0, 0x2
	str r0, [r2, 0xC]
	ldr r3, _08064098 @ =gBikeTireTracks_Transitions
	ldrb r1, [r4, 0x18]
	lsls r1, 28
	lsrs r1, 28
	adds r0, r4, 0
	adds r0, 0x20
	ldrb r0, [r0]
	lsls r0, 2
	subs r0, 0x5
	adds r1, r0
	adds r1, r3
	ldrb r0, [r1]
	str r0, [r2, 0x10]
	movs r0, 0x23
	bl FieldEffectStart
_0806408E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064094: .4byte gUnknown_0202FF84
_08064098: .4byte gBikeTireTracks_Transitions
	thumb_func_end DoTracksGroundEffect_BikeTireTracks

	thumb_func_start GroundEffect_Ripple
GroundEffect_Ripple: @ 806409C
	push {lr}
	bl DoRippleFieldEffect
	pop {r0}
	bx r0
	thumb_func_end GroundEffect_Ripple

	thumb_func_start GroundEffect_StepOnPuddle
GroundEffect_StepOnPuddle: @ 80640A8
	push {lr}
	adds r1, r0, 0
	movs r0, 0xF
	bl oe_exec_and_other_stuff
	pop {r0}
	bx r0
	thumb_func_end GroundEffect_StepOnPuddle

	thumb_func_start GroundEffect_SandPile
GroundEffect_SandPile: @ 80640B8
	push {lr}
	adds r1, r0, 0
	movs r0, 0x27
	bl oe_exec_and_other_stuff
	pop {r0}
	bx r0
	thumb_func_end GroundEffect_SandPile

	thumb_func_start GroundEffect_JumpOnTallGrass
GroundEffect_JumpOnTallGrass: @ 80640C8
	push {r4-r7,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r1, _0806411C @ =gUnknown_0202FF84
	movs r2, 0x10
	ldrsh r0, [r5, r2]
	str r0, [r1]
	movs r4, 0x12
	ldrsh r0, [r5, r4]
	str r0, [r1, 0x4]
	ldrb r0, [r5, 0xB]
	lsrs r0, 4
	str r0, [r1, 0x8]
	movs r0, 0x2
	str r0, [r1, 0xC]
	movs r0, 0xC
	bl FieldEffectStart
	ldrb r0, [r5, 0x8]
	ldrb r1, [r5, 0x9]
	ldrb r2, [r5, 0xA]
	movs r7, 0x10
	ldrsh r3, [r5, r7]
	movs r7, 0x12
	ldrsh r4, [r5, r7]
	str r4, [sp]
	bl sub_8126FF0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	bne _08064112
	adds r0, r5, 0
	adds r1, r6, 0
	bl GroundEffect_SpawnOnTallGrass
_08064112:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806411C: .4byte gUnknown_0202FF84
	thumb_func_end GroundEffect_JumpOnTallGrass

	thumb_func_start GroundEffect_JumpOnLongGrass
GroundEffect_JumpOnLongGrass: @ 8064120
	push {lr}
	ldr r2, _08064144 @ =gUnknown_0202FF84
	movs r3, 0x10
	ldrsh r1, [r0, r3]
	str r1, [r2]
	movs r3, 0x12
	ldrsh r1, [r0, r3]
	str r1, [r2, 0x4]
	ldrb r0, [r0, 0xB]
	lsrs r0, 4
	str r0, [r2, 0x8]
	movs r0, 0x2
	str r0, [r2, 0xC]
	movs r0, 0x12
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_08064144: .4byte gUnknown_0202FF84
	thumb_func_end GroundEffect_JumpOnLongGrass

	thumb_func_start GroundEffect_JumpOnShallowWater
GroundEffect_JumpOnShallowWater: @ 8064148
	push {r4,lr}
	ldr r3, _08064174 @ =gUnknown_0202FF84
	movs r4, 0x10
	ldrsh r2, [r0, r4]
	str r2, [r3]
	movs r4, 0x12
	ldrsh r2, [r0, r4]
	str r2, [r3, 0x4]
	ldrb r0, [r0, 0xB]
	lsrs r0, 4
	str r0, [r3, 0x8]
	ldrb r0, [r1, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r3, 0xC]
	movs r0, 0x10
	bl FieldEffectStart
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064174: .4byte gUnknown_0202FF84
	thumb_func_end GroundEffect_JumpOnShallowWater

	thumb_func_start GroundEffect_JumpOnWater
GroundEffect_JumpOnWater: @ 8064178
	push {r4,lr}
	ldr r3, _080641A4 @ =gUnknown_0202FF84
	movs r4, 0x10
	ldrsh r2, [r0, r4]
	str r2, [r3]
	movs r4, 0x12
	ldrsh r2, [r0, r4]
	str r2, [r3, 0x4]
	ldrb r0, [r0, 0xB]
	lsrs r0, 4
	str r0, [r3, 0x8]
	ldrb r0, [r1, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r3, 0xC]
	movs r0, 0xE
	bl FieldEffectStart
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080641A4: .4byte gUnknown_0202FF84
	thumb_func_end GroundEffect_JumpOnWater

	thumb_func_start GroundEffect_JumpLandingDust
GroundEffect_JumpLandingDust: @ 80641A8
	push {r4,lr}
	ldr r3, _080641D4 @ =gUnknown_0202FF84
	movs r4, 0x10
	ldrsh r2, [r0, r4]
	str r2, [r3]
	movs r4, 0x12
	ldrsh r2, [r0, r4]
	str r2, [r3, 0x4]
	ldrb r0, [r0, 0xB]
	lsrs r0, 4
	str r0, [r3, 0x8]
	ldrb r0, [r1, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r3, 0xC]
	movs r0, 0xA
	bl FieldEffectStart
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080641D4: .4byte gUnknown_0202FF84
	thumb_func_end GroundEffect_JumpLandingDust

	thumb_func_start GroundEffect_ShortGrass
GroundEffect_ShortGrass: @ 80641D8
	push {lr}
	adds r1, r0, 0
	movs r0, 0x29
	bl oe_exec_and_other_stuff
	pop {r0}
	bx r0
	thumb_func_end GroundEffect_ShortGrass

	thumb_func_start GroundEffect_HotSprings
GroundEffect_HotSprings: @ 80641E8
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2A
	bl oe_exec_and_other_stuff
	pop {r0}
	bx r0
	thumb_func_end GroundEffect_HotSprings

	thumb_func_start GroundEffect_Seaweed
GroundEffect_Seaweed: @ 80641F8
	push {lr}
	ldr r2, _08064214 @ =gUnknown_0202FF84
	movs r3, 0x10
	ldrsh r1, [r0, r3]
	str r1, [r2]
	movs r1, 0x12
	ldrsh r0, [r0, r1]
	str r0, [r2, 0x4]
	movs r0, 0x35
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_08064214: .4byte gUnknown_0202FF84
	thumb_func_end GroundEffect_Seaweed

	thumb_func_start sub_8064218
sub_8064218: @ 8064218
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	adds r6, r1, 0
	adds r5, r2, 0
	movs r4, 0
	ldr r0, _08064258 @ =gUnknown_083760A0
	mov r8, r0
_0806422A:
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	beq _08064240
	lsls r0, r4, 2
	add r0, r8
	ldr r2, [r0]
	adds r0, r7, 0
	adds r1, r6, 0
	bl _call_via_r2
_08064240:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	lsrs r5, 1
	cmp r4, 0x13
	bls _0806422A
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08064258: .4byte gUnknown_083760A0
	thumb_func_end sub_8064218

	thumb_func_start filters_out_some_ground_effects
filters_out_some_ground_effects: @ 806425C
	push {lr}
	adds r2, r0, 0
	adds r3, r1, 0
	ldrb r0, [r2]
	lsls r0, 27
	cmp r0, 0
	bge _0806428A
	ldrb r1, [r2, 0x2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	adds r1, 0x8
	ands r0, r1
	subs r1, 0x18
	ands r0, r1
	strb r0, [r2, 0x2]
	ldr r0, [r3]
	ldr r1, _08064290 @ =0xfff9f7bd
	ands r0, r1
	str r0, [r3]
_0806428A:
	pop {r0}
	bx r0
	.align 2, 0
_08064290: .4byte 0xfff9f7bd
	thumb_func_end filters_out_some_ground_effects

	thumb_func_start FilterOutStepOnPuddleGroundEffectIfJumping
FilterOutStepOnPuddleGroundEffectIfJumping: @ 8064294
	push {lr}
	adds r2, r1, 0
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bge _080642A8
	ldr r0, [r2]
	ldr r1, _080642AC @ =0xfffffbff
	ands r0, r1
	str r0, [r2]
_080642A8:
	pop {r0}
	bx r0
	.align 2, 0
_080642AC: .4byte 0xfffffbff
	thumb_func_end FilterOutStepOnPuddleGroundEffectIfJumping

	thumb_func_start DoGroundEffects_OnSpawn
DoGroundEffects_OnSpawn: @ 80642B0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4]
	lsls r0, 29
	cmp r0, 0
	bge _080642F4
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	bl FieldObjectUpdateZCoordAndPriority
	adds r0, r4, 0
	mov r1, sp
	bl GetAllGroundEffectFlags_OnSpawn
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetSpriteOamTableForLongGrass
	ldr r2, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8064218
	ldrb r1, [r4]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r4]
_080642F4:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end DoGroundEffects_OnSpawn

	thumb_func_start DoGroundEffects_OnBeginStep
DoGroundEffects_OnBeginStep: @ 80642FC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4]
	lsls r0, 29
	cmp r0, 0
	bge _08064348
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	bl FieldObjectUpdateZCoordAndPriority
	adds r0, r4, 0
	mov r1, sp
	bl GetAllGroundEffectFlags_OnBeginStep
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetSpriteOamTableForLongGrass
	adds r0, r4, 0
	mov r1, sp
	bl filters_out_some_ground_effects
	ldr r2, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8064218
	ldrb r1, [r4]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r4]
_08064348:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end DoGroundEffects_OnBeginStep

	thumb_func_start DoGroundEffects_OnFinishStep
DoGroundEffects_OnFinishStep: @ 8064350
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4]
	lsls r0, 28
	cmp r0, 0
	bge _0806439C
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	bl FieldObjectUpdateZCoordAndPriority
	adds r0, r4, 0
	mov r1, sp
	bl GetAllGroundEffectFlags_OnFinishStep
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetSpriteOamTableForLongGrass
	adds r0, r4, 0
	mov r1, sp
	bl FilterOutStepOnPuddleGroundEffectIfJumping
	ldr r2, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8064218
	ldrb r1, [r4]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	movs r1, 0x21
	negs r1, r1
	ands r0, r1
	strb r0, [r4]
_0806439C:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end DoGroundEffects_OnFinishStep

	.align 2, 0 @ Don't pad with nop.
