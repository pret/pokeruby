	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text
	
	thumb_func_start dp01t_00_4_getattr
dp01t_00_4_getattr: @ 803807C
	push {r4-r6,lr}
	sub sp, 0x100
	movs r6, 0
	ldr r1, _080380A8 @ =gUnknown_02023A60
	ldr r0, _080380AC @ =gUnknown_02024A60
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _080380B4
	ldr r0, _080380B0 @ =gUnknown_02024A6A
	lsls r1, r2, 1
	adds r1, r0
	ldrb r0, [r1]
	mov r1, sp
	bl dp01_getattr_by_ch1_for_player_pokemon__
	adds r6, r0, 0
	b _080380D6
	.align 2, 0
_080380A8: .4byte gUnknown_02023A60
_080380AC: .4byte gUnknown_02024A60
_080380B0: .4byte gUnknown_02024A6A
_080380B4:
	ldrb r4, [r1]
	movs r5, 0
_080380B8:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080380CE
	lsls r0, r5, 24
	lsrs r0, 24
	mov r2, sp
	adds r1, r2, r6
	bl dp01_getattr_by_ch1_for_player_pokemon__
	adds r6, r0
_080380CE:
	lsrs r4, 1
	adds r5, 0x1
	cmp r5, 0x5
	ble _080380B8
_080380D6:
	lsls r1, r6, 16
	lsrs r1, 16
	movs r0, 0x1
	mov r2, sp
	bl dp01_build_cmdbuf_x1D_1D_numargs_varargs
	bl dp01_tbl4_exec_completed
	add sp, 0x100
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end dp01t_00_4_getattr

	thumb_func_start dp01_getattr_by_ch1_for_player_pokemon__
dp01_getattr_by_ch1_for_player_pokemon__: @ 80380F0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x90
	adds r7, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0
	ldr r2, _08038124 @ =gUnknown_02023A60
	ldr r3, _08038128 @ =gUnknown_02024A60
	ldrb r0, [r3]
	lsls r0, 9
	adds r1, r2, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x3B
	bls _0803811A
	bl _08038886
_0803811A:
	lsls r0, 2
	ldr r1, _0803812C @ =_08038130
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08038124: .4byte gUnknown_02023A60
_08038128: .4byte gUnknown_02024A60
_0803812C: .4byte _08038130
	.align 2, 0
_08038130:
	.4byte _08038220
	.4byte _08038444
	.4byte _08038454
	.4byte _08038464
	.4byte _080384CC
	.4byte _080384CC
	.4byte _080384CC
	.4byte _080384CC
	.4byte _080384E8
	.4byte _08038524
	.4byte _08038524
	.4byte _08038524
	.4byte _08038524
	.4byte _08038886
	.4byte _08038886
	.4byte _08038886
	.4byte _08038886
	.4byte _08038540
	.4byte _08038550
	.4byte _08038580
	.4byte _08038590
	.4byte _080385A0
	.4byte _080385B0
	.4byte _080385C0
	.4byte _080385D0
	.4byte _080385E0
	.4byte _080385F0
	.4byte _08038600
	.4byte _08038610
	.4byte _08038620
	.4byte _08038630
	.4byte _08038640
	.4byte _08038690
	.4byte _080386A0
	.4byte _080386B0
	.4byte _080386C0
	.4byte _080386D0
	.4byte _080386E0
	.4byte _080386F0
	.4byte _08038700
	.4byte _08038710
	.4byte _08038744
	.4byte _08038754
	.4byte _08038764
	.4byte _08038774
	.4byte _08038784
	.4byte _08038794
	.4byte _080387A4
	.4byte _080387B4
	.4byte _080387D4
	.4byte _080387E4
	.4byte _080387F4
	.4byte _08038804
	.4byte _08038814
	.4byte _08038824
	.4byte _08038834
	.4byte _08038844
	.4byte _08038854
	.4byte _08038864
	.4byte _08038874
_08038220:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08038434 @ =gEnemyParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2E]
	movs r6, 0
	add r0, sp, 0x24
	mov r9, r0
	movs r1, 0x3B
	add r1, sp
	mov r10, r1
	mov r2, sp
	adds r2, 0x2B
	str r2, [sp, 0x80]
	mov r0, sp
	adds r0, 0x2A
	str r0, [sp, 0x7C]
	mov r1, sp
	adds r1, 0x68
	str r1, [sp, 0x8C]
	adds r2, 0x5
	str r2, [sp, 0x84]
	adds r0, 0x12
	str r0, [sp, 0x88]
	mov r8, r4
	add r4, sp, 0xC
_0803826C:
	adds r1, r6, 0
	adds r1, 0xD
	mov r0, r8
	bl GetMonData
	strh r0, [r4]
	adds r1, r6, 0
	adds r1, 0x11
	mov r0, r8
	bl GetMonData
	mov r2, r9
	adds r1, r2, r6
	strb r0, [r1]
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _0803826C
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08038434 @ =gEnemyParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x15
	bl GetMonData
	mov r1, r10
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	ldr r2, [sp, 0x80]
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x19
	bl GetMonData
	str r0, [sp, 0x44]
	adds r0, r4, 0
	movs r1, 0x27
	bl GetMonData
	mov r3, sp
	movs r5, 0x1F
	ands r0, r5
	ldrb r2, [r3, 0x14]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x14]
	adds r0, r4, 0
	movs r1, 0x28
	bl GetMonData
	mov r3, sp
	movs r6, 0x1F
	ands r0, r6
	lsls r0, 5
	ldrh r2, [r3, 0x14]
	ldr r1, _08038438 @ =0xfffffc1f
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, 0x14]
	adds r0, r4, 0
	movs r1, 0x29
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, 2
	ldrb r2, [r3, 0x15]
	movs r1, 0x7D
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x15]
	adds r0, r4, 0
	movs r1, 0x2A
	bl GetMonData
	movs r1, 0x1F
	ands r1, r0
	lsls r1, 15
	ldr r0, [sp, 0x14]
	ldr r2, _0803843C @ =0xfff07fff
	ands r0, r2
	orrs r0, r1
	str r0, [sp, 0x14]
	adds r0, r4, 0
	movs r1, 0x2B
	bl GetMonData
	mov r3, sp
	ands r0, r6
	lsls r0, 4
	ldrh r2, [r3, 0x16]
	ldr r1, _08038440 @ =0xfffffe0f
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, 0x16]
	adds r0, r4, 0
	movs r1, 0x2C
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, 1
	ldrb r2, [r3, 0x17]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	str r0, [sp, 0x48]
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	str r0, [sp, 0x4C]
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	ldr r1, [sp, 0x7C]
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x28]
	adds r0, r4, 0
	movs r1, 0x3A
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2C]
	adds r0, r4, 0
	movs r1, 0x3B
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2]
	adds r0, r4, 0
	movs r1, 0x3C
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x4]
	adds r0, r4, 0
	movs r1, 0x3D
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x6]
	adds r0, r4, 0
	movs r1, 0x3E
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x8]
	adds r0, r4, 0
	movs r1, 0x3F
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0xA]
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	mov r3, sp
	movs r1, 0x1
	ands r0, r1
	lsls r0, 6
	ldrb r2, [r3, 0x17]
	movs r1, 0x41
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0x2E
	bl GetMonData
	mov r3, sp
	lsls r0, 7
	ldrb r2, [r3, 0x17]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	str r0, [sp, 0x54]
	adds r0, r4, 0
	movs r1, 0x2
	ldr r2, [sp, 0x8C]
	bl GetMonData
	ldr r0, [sp, 0x84]
	ldr r1, [sp, 0x8C]
	bl StringCopy10
	adds r0, r4, 0
	movs r1, 0x7
	ldr r2, [sp, 0x88]
	bl GetMonData
	mov r2, sp
	movs r6, 0
_08038424:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, 0x1
	cmp r6, 0x57
	bls _08038424
	b _08038886
	.align 2, 0
_08038434: .4byte gEnemyParty
_08038438: .4byte 0xfffffc1f
_0803843C: .4byte 0xfff07fff
_08038440: .4byte 0xfffffe0f
_08038444:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038450 @ =gEnemyParty
	adds r0, r1
	movs r1, 0xB
	b _080387BE
	.align 2, 0
_08038450: .4byte gEnemyParty
_08038454:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038460 @ =gEnemyParty
	adds r0, r1
	movs r1, 0xC
	b _080387BE
	.align 2, 0
_08038460: .4byte gEnemyParty
_08038464:
	movs r6, 0
	add r2, sp, 0x58
	mov r9, r2
	add r0, sp, 0x60
	mov r10, r0
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080384C8 @ =gEnemyParty
	adds r4, r1, r0
	mov r8, r9
_0803847A:
	adds r1, r6, 0
	adds r1, 0xD
	adds r0, r4, 0
	bl GetMonData
	mov r1, r8
	strh r0, [r1]
	adds r1, r6, 0
	adds r1, 0x11
	adds r0, r4, 0
	bl GetMonData
	mov r2, r10
	adds r1, r2, r6
	strb r0, [r1]
	movs r0, 0x2
	add r8, r0
	adds r6, 0x1
	cmp r6, 0x3
	ble _0803847A
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080384C8 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x15
	bl GetMonData
	mov r1, r9
	strb r0, [r1, 0xC]
	mov r2, r9
	movs r6, 0
_080384B8:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, 0x1
	cmp r6, 0xF
	bls _080384B8
	b _08038886
	.align 2, 0
_080384C8: .4byte gEnemyParty
_080384CC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080384E4 @ =gEnemyParty
	adds r0, r1
	ldrb r1, [r3]
	lsls r1, 9
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	adds r1, 0x9
	b _080387BE
	.align 2, 0
_080384E4: .4byte gEnemyParty
_080384E8:
	movs r6, 0
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r2, _08038520 @ =gEnemyParty
	mov r8, r2
_080384F4:
	adds r1, r6, 0
	adds r1, 0x11
	mov r2, r8
	adds r0, r4, r2
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, 0x1
	cmp r6, 0x3
	ble _080384F4
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038520 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x15
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, 0x1
	b _08038886
	.align 2, 0
_08038520: .4byte gEnemyParty
_08038524:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803853C @ =gEnemyParty
	adds r0, r1
	ldrb r1, [r3]
	lsls r1, 9
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	adds r1, 0x8
	b _0803887E
	.align 2, 0
_0803853C: .4byte gEnemyParty
_08038540:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803854C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x1
	b _0803855A
	.align 2, 0
_0803854C: .4byte gEnemyParty
_08038550:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803857C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x19
_0803855A:
	bl GetMonData
	adds r1, r0, 0
	strb r1, [r7]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r0, 16
	strb r0, [r7, 0x2]
	movs r6, 0x3
	b _08038886
	.align 2, 0
_0803857C: .4byte gEnemyParty
_08038580:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803858C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x1A
	b _0803887E
	.align 2, 0
_0803858C: .4byte gEnemyParty
_08038590:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803859C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x1B
	b _0803887E
	.align 2, 0
_0803859C: .4byte gEnemyParty
_080385A0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080385AC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x1C
	b _0803887E
	.align 2, 0
_080385AC: .4byte gEnemyParty
_080385B0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080385BC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x1D
	b _0803887E
	.align 2, 0
_080385BC: .4byte gEnemyParty
_080385C0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080385CC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x1E
	b _0803887E
	.align 2, 0
_080385CC: .4byte gEnemyParty
_080385D0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080385DC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x1F
	b _0803887E
	.align 2, 0
_080385DC: .4byte gEnemyParty
_080385E0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080385EC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x20
	b _0803887E
	.align 2, 0
_080385EC: .4byte gEnemyParty
_080385F0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080385FC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x22
	b _0803887E
	.align 2, 0
_080385FC: .4byte gEnemyParty
_08038600:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803860C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x23
	b _0803887E
	.align 2, 0
_0803860C: .4byte gEnemyParty
_08038610:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803861C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x24
	b _0803887E
	.align 2, 0
_0803861C: .4byte gEnemyParty
_08038620:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803862C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x25
	b _0803887E
	.align 2, 0
_0803862C: .4byte gEnemyParty
_08038630:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803863C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x26
	b _0803887E
	.align 2, 0
_0803863C: .4byte gEnemyParty
_08038640:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0803868C @ =gEnemyParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x27
	bl GetMonData
	strb r0, [r7]
	adds r0, r4, 0
	movs r1, 0x28
	bl GetMonData
	strb r0, [r7, 0x1]
	adds r0, r4, 0
	movs r1, 0x29
	bl GetMonData
	strb r0, [r7, 0x2]
	adds r0, r4, 0
	movs r1, 0x2A
	bl GetMonData
	strb r0, [r7, 0x3]
	adds r0, r4, 0
	movs r1, 0x2B
	bl GetMonData
	strb r0, [r7, 0x4]
	adds r0, r4, 0
	movs r1, 0x2C
	bl GetMonData
	strb r0, [r7, 0x5]
	movs r6, 0x6
	b _08038886
	.align 2, 0
_0803868C: .4byte gEnemyParty
_08038690:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803869C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x27
	b _0803887E
	.align 2, 0
_0803869C: .4byte gEnemyParty
_080386A0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080386AC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x28
	b _0803887E
	.align 2, 0
_080386AC: .4byte gEnemyParty
_080386B0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080386BC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x29
	b _0803887E
	.align 2, 0
_080386BC: .4byte gEnemyParty
_080386C0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080386CC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x2A
	b _0803887E
	.align 2, 0
_080386CC: .4byte gEnemyParty
_080386D0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080386DC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x2B
	b _0803887E
	.align 2, 0
_080386DC: .4byte gEnemyParty
_080386E0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080386EC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x2C
	b _0803887E
	.align 2, 0
_080386EC: .4byte gEnemyParty
_080386F0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080386FC @ =gEnemyParty
	adds r0, r1
	movs r1, 0
	b _0803871A
	.align 2, 0
_080386FC: .4byte gEnemyParty
_08038700:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803870C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x9
	b _080387BE
	.align 2, 0
_0803870C: .4byte gEnemyParty
_08038710:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038740 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x37
_0803871A:
	bl GetMonData
	adds r1, r0, 0
	strb r1, [r7]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r0, 16
	strb r0, [r7, 0x2]
	lsrs r0, r1, 24
	strb r0, [r7, 0x3]
	movs r6, 0x4
	b _08038886
	.align 2, 0
_08038740: .4byte gEnemyParty
_08038744:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038750 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x38
	b _0803887E
	.align 2, 0
_08038750: .4byte gEnemyParty
_08038754:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038760 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x39
	b _080387BE
	.align 2, 0
_08038760: .4byte gEnemyParty
_08038764:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038770 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x3A
	b _080387BE
	.align 2, 0
_08038770: .4byte gEnemyParty
_08038774:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038780 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x3B
	b _080387BE
	.align 2, 0
_08038780: .4byte gEnemyParty
_08038784:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038790 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x3C
	b _080387BE
	.align 2, 0
_08038790: .4byte gEnemyParty
_08038794:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080387A0 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x3D
	b _080387BE
	.align 2, 0
_080387A0: .4byte gEnemyParty
_080387A4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080387B0 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x3E
	b _080387BE
	.align 2, 0
_080387B0: .4byte gEnemyParty
_080387B4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080387D0 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x3F
_080387BE:
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	strb r0, [r7]
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r6, 0x2
	b _08038886
	.align 2, 0
_080387D0: .4byte gEnemyParty
_080387D4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080387E0 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x16
	b _0803887E
	.align 2, 0
_080387E0: .4byte gEnemyParty
_080387E4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080387F0 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x17
	b _0803887E
	.align 2, 0
_080387F0: .4byte gEnemyParty
_080387F4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038800 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x18
	b _0803887E
	.align 2, 0
_08038800: .4byte gEnemyParty
_08038804:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038810 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x21
	b _0803887E
	.align 2, 0
_08038810: .4byte gEnemyParty
_08038814:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038820 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x2F
	b _0803887E
	.align 2, 0
_08038820: .4byte gEnemyParty
_08038824:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038830 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x30
	b _0803887E
	.align 2, 0
_08038830: .4byte gEnemyParty
_08038834:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038840 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x32
	b _0803887E
	.align 2, 0
_08038840: .4byte gEnemyParty
_08038844:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038850 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x33
	b _0803887E
	.align 2, 0
_08038850: .4byte gEnemyParty
_08038854:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038860 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x34
	b _0803887E
	.align 2, 0
_08038860: .4byte gEnemyParty
_08038864:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038870 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x35
	b _0803887E
	.align 2, 0
_08038870: .4byte gEnemyParty
_08038874:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038898 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x36
_0803887E:
	bl GetMonData
	strb r0, [r7]
	movs r6, 0x1
_08038886:
	adds r0, r6, 0
	add sp, 0x90
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08038898: .4byte gEnemyParty
	thumb_func_end dp01_getattr_by_ch1_for_player_pokemon__

	thumb_func_start sub_803889C
sub_803889C: @ 803889C
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_803889C

	thumb_func_start sub_80388A8
sub_80388A8: @ 80388A8
	push {r4,r5,lr}
	ldr r1, _080388CC @ =gUnknown_02023A60
	ldr r0, _080388D0 @ =gUnknown_02024A60
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _080388D8
	ldr r0, _080388D4 @ =gUnknown_02024A6A
	lsls r1, r2, 1
	adds r1, r0
	ldrb r0, [r1]
	bl sub_8038900
	b _080388F6
	.align 2, 0
_080388CC: .4byte gUnknown_02023A60
_080388D0: .4byte gUnknown_02024A60
_080388D4: .4byte gUnknown_02024A6A
_080388D8:
	ldrb r4, [r1]
	movs r5, 0
_080388DC:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080388EA
	adds r0, r5, 0
	bl sub_8038900
_080388EA:
	lsrs r4, 1
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _080388DC
_080388F6:
	bl dp01_tbl4_exec_completed
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80388A8

	thumb_func_start sub_8038900
sub_8038900: @ 8038900
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x38
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r3, _08038938 @ =gUnknown_02024A60
	ldrb r0, [r3]
	lsls r0, 9
	ldr r2, _0803893C @ =gUnknown_02023A63
	adds r4, r0, r2
	adds r7, r4, 0
	subs r1, r2, 0x2
	adds r0, r1
	ldrb r0, [r0]
	adds r6, r3, 0
	adds r3, r2, 0
	cmp r0, 0x3B
	bls _0803892E
	bl _0803920C
_0803892E:
	lsls r0, 2
	ldr r1, _08038940 @ =_08038944
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08038938: .4byte gUnknown_02024A60
_0803893C: .4byte gUnknown_02023A63
_08038940: .4byte _08038944
	.align 2, 0
_08038944:
	.4byte _08038A34
	.4byte _08038BCC
	.4byte _08038BE8
	.4byte _08038C04
	.4byte _08038C58
	.4byte _08038C58
	.4byte _08038C58
	.4byte _08038C58
	.4byte _08038C78
	.4byte _08038CE0
	.4byte _08038CE0
	.4byte _08038CE0
	.4byte _08038CE0
	.4byte _0803920C
	.4byte _0803920C
	.4byte _0803920C
	.4byte _0803920C
	.4byte _08038D08
	.4byte _08038D24
	.4byte _08038D40
	.4byte _08038D5C
	.4byte _08038D78
	.4byte _08038D94
	.4byte _08038DB0
	.4byte _08038DCC
	.4byte _08038DE8
	.4byte _08038E04
	.4byte _08038E20
	.4byte _08038E3C
	.4byte _08038E58
	.4byte _08038E74
	.4byte _08038E90
	.4byte _08038F04
	.4byte _08038F20
	.4byte _08038F3C
	.4byte _08038F58
	.4byte _08038F74
	.4byte _08038F90
	.4byte _08038FAC
	.4byte _08038FC8
	.4byte _08038FE4
	.4byte _08039000
	.4byte _0803901C
	.4byte _08039038
	.4byte _08039054
	.4byte _08039070
	.4byte _0803908C
	.4byte _080390A8
	.4byte _080390C4
	.4byte _080390E0
	.4byte _080390FC
	.4byte _08039118
	.4byte _08039134
	.4byte _08039150
	.4byte _0803916C
	.4byte _08039188
	.4byte _080391A4
	.4byte _080391C0
	.4byte _080391DC
	.4byte _080391F8
_08038A34:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08038BC8 @ =gEnemyParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	adds r2, r7, 0
	bl SetMonData
	adds r2, r7, 0
	adds r2, 0x2E
	adds r0, r4, 0
	movs r1, 0xC
	bl SetMonData
	movs r0, 0
	mov r8, r0
	movs r0, 0x3B
	adds r0, r7
	mov r10, r0
	adds r0, r7, 0
	adds r0, 0x2B
	str r0, [sp, 0x20]
	adds r0, 0x19
	str r0, [sp, 0x28]
	adds r0, 0x4
	str r0, [sp, 0x2C]
	adds r0, 0x4
	str r0, [sp, 0x30]
	subs r0, 0x22
	str r0, [sp, 0x1C]
	subs r0, 0x2
	str r0, [sp, 0x18]
	adds r0, 0x4
	str r0, [sp, 0x24]
	adds r0, r7, 0x2
	str r0, [sp, 0x4]
	adds r0, r7, 0x4
	str r0, [sp, 0x8]
	adds r0, r7, 0x6
	str r0, [sp, 0xC]
	adds r0, 0x2
	str r0, [sp, 0x10]
	adds r0, 0x2
	str r0, [sp, 0x14]
	mov r9, r4
	adds r6, r7, 0
	adds r6, 0x24
	adds r4, r7, 0
	adds r4, 0xC
_08038A9A:
	mov r1, r8
	adds r1, 0xD
	mov r0, r9
	adds r2, r4, 0
	bl SetMonData
	mov r1, r8
	adds r1, 0x11
	mov r0, r9
	adds r2, r6, 0
	bl SetMonData
	adds r6, 0x1
	adds r4, 0x2
	movs r0, 0x1
	add r8, r0
	mov r0, r8
	cmp r0, 0x3
	ble _08038A9A
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08038BC8 @ =gEnemyParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x15
	mov r2, r10
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x20
	ldr r2, [sp, 0x20]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x19
	ldr r2, [sp, 0x28]
	bl SetMonData
	ldrb r0, [r7, 0x14]
	lsls r0, 27
	lsrs r0, 27
	mov r1, sp
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x27
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r7, 0x14]
	lsls r0, 22
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x28
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r7, 0x15]
	lsls r0, 25
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x29
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldr r0, [r7, 0x14]
	lsls r0, 12
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2A
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r7, 0x16]
	lsls r0, 23
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2B
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r7, 0x17]
	lsls r0, 26
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2C
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0
	ldr r2, [sp, 0x2C]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x37
	ldr r2, [sp, 0x30]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x38
	ldr r2, [sp, 0x1C]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x39
	ldr r2, [sp, 0x18]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3A
	ldr r2, [sp, 0x24]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3B
	ldr r2, [sp, 0x4]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3C
	ldr r2, [sp, 0x8]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3D
	ldr r2, [sp, 0xC]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3E
	ldr r2, [sp, 0x10]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3F
	ldr r2, [sp, 0x14]
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038BC8: .4byte gEnemyParty
_08038BCC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038BE4 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0xB
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038BE4: .4byte gEnemyParty
_08038BE8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038C00 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0xC
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038C00: .4byte gEnemyParty
_08038C04:
	movs r0, 0
	mov r8, r0
	movs r0, 0xC
	adds r0, r4
	mov r9, r0
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08038C54 @ =gEnemyParty
	adds r7, r1, r0
	adds r6, r4, 0
	adds r6, 0x8
_08038C1C:
	mov r1, r8
	adds r1, 0xD
	adds r0, r7, 0
	adds r2, r4, 0
	bl SetMonData
	mov r1, r8
	adds r1, 0x11
	adds r0, r7, 0
	adds r2, r6, 0
	bl SetMonData
	adds r6, 0x1
	adds r4, 0x2
	movs r0, 0x1
	add r8, r0
	mov r0, r8
	cmp r0, 0x3
	ble _08038C1C
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038C54 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x15
	mov r2, r9
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038C54: .4byte gEnemyParty
_08038C58:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038C70 @ =gEnemyParty
	adds r0, r1
	ldr r3, _08038C74 @ =gUnknown_02023A60
	ldrb r2, [r6]
	lsls r2, 9
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, 0x9
	b _08038CF6
	.align 2, 0
_08038C70: .4byte gEnemyParty
_08038C74: .4byte gUnknown_02023A60
_08038C78:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08038CDC @ =gEnemyParty
	adds r4, r0
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	adds r0, r4, 0
	movs r1, 0x11
	str r3, [sp, 0x34]
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, 9
	ldr r3, [sp, 0x34]
	adds r0, r3, 0x1
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x12
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, 9
	ldr r3, [sp, 0x34]
	adds r0, r3, 0x2
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x13
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, 9
	ldr r3, [sp, 0x34]
	adds r0, r3, 0x3
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x14
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, 9
	ldr r3, [sp, 0x34]
	adds r0, r3, 0x4
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x15
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038CDC: .4byte gEnemyParty
_08038CE0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038D00 @ =gEnemyParty
	adds r0, r1
	ldr r3, _08038D04 @ =gUnknown_02023A60
	ldrb r2, [r6]
	lsls r2, 9
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, 0x8
_08038CF6:
	adds r3, 0x3
	adds r2, r3
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038D00: .4byte gEnemyParty
_08038D04: .4byte gUnknown_02023A60
_08038D08:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038D20 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x1
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038D20: .4byte gEnemyParty
_08038D24:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038D3C @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x19
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038D3C: .4byte gEnemyParty
_08038D40:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038D58 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x1A
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038D58: .4byte gEnemyParty
_08038D5C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038D74 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x1B
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038D74: .4byte gEnemyParty
_08038D78:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038D90 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x1C
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038D90: .4byte gEnemyParty
_08038D94:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038DAC @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x1D
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038DAC: .4byte gEnemyParty
_08038DB0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038DC8 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x1E
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038DC8: .4byte gEnemyParty
_08038DCC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038DE4 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x1F
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038DE4: .4byte gEnemyParty
_08038DE8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038E00 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x20
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038E00: .4byte gEnemyParty
_08038E04:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038E1C @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x22
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038E1C: .4byte gEnemyParty
_08038E20:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038E38 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x23
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038E38: .4byte gEnemyParty
_08038E3C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038E54 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x24
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038E54: .4byte gEnemyParty
_08038E58:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038E70 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x25
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038E70: .4byte gEnemyParty
_08038E74:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038E8C @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x26
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038E8C: .4byte gEnemyParty
_08038E90:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08038F00 @ =gEnemyParty
	adds r4, r0
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	adds r0, r4, 0
	movs r1, 0x27
	str r3, [sp, 0x34]
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, 9
	ldr r3, [sp, 0x34]
	adds r0, r3, 0x1
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x28
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, 9
	ldr r3, [sp, 0x34]
	adds r0, r3, 0x2
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x29
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, 9
	ldr r3, [sp, 0x34]
	adds r0, r3, 0x3
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x2A
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, 9
	ldr r3, [sp, 0x34]
	adds r0, r3, 0x4
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x2B
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, 9
	ldr r3, [sp, 0x34]
	adds r0, r3, 0x5
	adds r2, r0
	adds r0, r4, 0
	b _08038F9E
	.align 2, 0
_08038F00: .4byte gEnemyParty
_08038F04:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038F1C @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x27
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038F1C: .4byte gEnemyParty
_08038F20:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038F38 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x28
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038F38: .4byte gEnemyParty
_08038F3C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038F54 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x29
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038F54: .4byte gEnemyParty
_08038F58:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038F70 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x2A
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038F70: .4byte gEnemyParty
_08038F74:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038F8C @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x2B
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038F8C: .4byte gEnemyParty
_08038F90:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038FA8 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
_08038F9E:
	movs r1, 0x2C
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038FA8: .4byte gEnemyParty
_08038FAC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038FC4 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038FC4: .4byte gEnemyParty
_08038FC8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038FE0 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x9
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038FE0: .4byte gEnemyParty
_08038FE4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08038FFC @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x37
	bl SetMonData
	b _0803920C
	.align 2, 0
_08038FFC: .4byte gEnemyParty
_08039000:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08039018 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x38
	bl SetMonData
	b _0803920C
	.align 2, 0
_08039018: .4byte gEnemyParty
_0803901C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08039034 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x39
	bl SetMonData
	b _0803920C
	.align 2, 0
_08039034: .4byte gEnemyParty
_08039038:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08039050 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x3A
	bl SetMonData
	b _0803920C
	.align 2, 0
_08039050: .4byte gEnemyParty
_08039054:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803906C @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x3B
	bl SetMonData
	b _0803920C
	.align 2, 0
_0803906C: .4byte gEnemyParty
_08039070:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08039088 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x3C
	bl SetMonData
	b _0803920C
	.align 2, 0
_08039088: .4byte gEnemyParty
_0803908C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080390A4 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x3D
	bl SetMonData
	b _0803920C
	.align 2, 0
_080390A4: .4byte gEnemyParty
_080390A8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080390C0 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x3E
	bl SetMonData
	b _0803920C
	.align 2, 0
_080390C0: .4byte gEnemyParty
_080390C4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080390DC @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x3F
	bl SetMonData
	b _0803920C
	.align 2, 0
_080390DC: .4byte gEnemyParty
_080390E0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080390F8 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x16
	bl SetMonData
	b _0803920C
	.align 2, 0
_080390F8: .4byte gEnemyParty
_080390FC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08039114 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x17
	bl SetMonData
	b _0803920C
	.align 2, 0
_08039114: .4byte gEnemyParty
_08039118:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08039130 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x18
	bl SetMonData
	b _0803920C
	.align 2, 0
_08039130: .4byte gEnemyParty
_08039134:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803914C @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x21
	bl SetMonData
	b _0803920C
	.align 2, 0
_0803914C: .4byte gEnemyParty
_08039150:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08039168 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x2F
	bl SetMonData
	b _0803920C
	.align 2, 0
_08039168: .4byte gEnemyParty
_0803916C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08039184 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x30
	bl SetMonData
	b _0803920C
	.align 2, 0
_08039184: .4byte gEnemyParty
_08039188:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080391A0 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x32
	bl SetMonData
	b _0803920C
	.align 2, 0
_080391A0: .4byte gEnemyParty
_080391A4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080391BC @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x33
	bl SetMonData
	b _0803920C
	.align 2, 0
_080391BC: .4byte gEnemyParty
_080391C0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080391D8 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x34
	bl SetMonData
	b _0803920C
	.align 2, 0
_080391D8: .4byte gEnemyParty
_080391DC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080391F4 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x35
	bl SetMonData
	b _0803920C
	.align 2, 0
_080391F4: .4byte gEnemyParty
_080391F8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803921C @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x36
	bl SetMonData
_0803920C:
	add sp, 0x38
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803921C: .4byte gEnemyParty
	thumb_func_end sub_8038900

	thumb_func_start sub_8039220
sub_8039220: @ 8039220
	push {r4-r7,lr}
	ldr r1, _08039284 @ =gUnknown_02024A6A
	ldr r7, _08039288 @ =gUnknown_02024A60
	ldrb r2, [r7]
	lsls r0, r2, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	adds r3, r1, 0
	muls r3, r0
	ldr r4, _0803928C @ =gUnknown_02023A60
	lsls r2, 9
	adds r0, r4, 0x1
	adds r0, r2, r0
	ldrb r0, [r0]
	ldr r1, _08039290 @ =gEnemyParty
	adds r0, r1
	adds r5, r3, r0
	movs r3, 0
	adds r0, r4, 0x2
	adds r2, r0
	ldrb r2, [r2]
	cmp r3, r2
	bcs _08039278
	adds r6, r4, 0
	adds r2, r7, 0
	adds r4, r0, 0
_08039256:
	adds r1, r5, r3
	ldrb r0, [r2]
	lsls r0, 9
	adds r0, 0x3
	adds r0, r3, r0
	adds r0, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	ldrb r0, [r2]
	lsls r0, 9
	adds r0, r4
	ldrb r0, [r0]
	cmp r3, r0
	bcc _08039256
_08039278:
	bl dp01_tbl4_exec_completed
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039284: .4byte gUnknown_02024A6A
_08039288: .4byte gUnknown_02024A60
_0803928C: .4byte gUnknown_02023A60
_08039290: .4byte gEnemyParty
	thumb_func_end sub_8039220

	thumb_func_start sub_8039294
sub_8039294: @ 8039294
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r7, _080393BC @ =gUnknown_02024A6A
	ldr r6, _080393C0 @ =gUnknown_02024A60
	ldrb r0, [r6]
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	movs r1, 0x64
	mov r10, r1
	mov r2, r10
	muls r2, r0
	adds r0, r2, 0
	ldr r1, _080393C4 @ =gEnemyParty
	mov r9, r1
	add r0, r9
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrb r1, [r6]
	lsls r0, r1, 1
	adds r0, r7
	ldrh r0, [r0]
	mov r2, r10
	muls r2, r0
	adds r0, r2, 0
	add r0, r9
	bl sub_8031794
	ldrb r0, [r6]
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _080393C8 @ =gUnknown_02024E8C
	mov r8, r0
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8077ABC
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldrb r0, [r6]
	bl sub_8077F68
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r6]
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r8
	adds r1, r5, 0
	adds r2, r4, 0
	bl CreateSprite
	ldr r4, _080393CC @ =gUnknown_02024BE0
	ldrb r1, [r6]
	adds r1, r4
	strb r0, [r1]
	ldr r5, _080393D0 @ =gSprites
	ldrb r0, [r6]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _080393D4 @ =0x0000ff10
	strh r1, [r0, 0x24]
	ldrb r2, [r6]
	adds r0, r2, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x2E]
	ldrb r3, [r6]
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r2, [r6]
	adds r4, r2, r4
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _080393D8 @ =gUnknown_02024E84
	adds r2, r1
	ldrb r1, [r2]
	bl StartSpriteAnim
	ldrb r4, [r6]
	lsls r0, r4, 1
	adds r0, r7
	ldrh r0, [r0]
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	add r0, r9
	movs r1, 0xB
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_8032984
	ldr r1, _080393DC @ =gUnknown_03004330
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080393E0 @ =sub_8037A74
	str r1, [r0]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080393BC: .4byte gUnknown_02024A6A
_080393C0: .4byte gUnknown_02024A60
_080393C4: .4byte gEnemyParty
_080393C8: .4byte gUnknown_02024E8C
_080393CC: .4byte gUnknown_02024BE0
_080393D0: .4byte gSprites
_080393D4: .4byte 0x0000ff10
_080393D8: .4byte gUnknown_02024E84
_080393DC: .4byte gUnknown_03004330
_080393E0: .4byte sub_8037A74
	thumb_func_end sub_8039294

	thumb_func_start sub_80393E4
sub_80393E4: @ 80393E4
	push {r4,lr}
	ldr r1, _0803941C @ =gUnknown_02024A6A
	ldr r4, _08039420 @ =gUnknown_02024A60
	ldrb r0, [r4]
	lsls r2, r0, 1
	adds r2, r1
	ldr r3, _08039424 @ =gUnknown_02023A60
	lsls r0, 9
	adds r1, r3, 0x1
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r2]
	ldrb r0, [r4]
	lsls r1, r0, 9
	adds r3, 0x2
	adds r1, r3
	ldrb r1, [r1]
	bl sub_8039430
	ldr r1, _08039428 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803942C @ =sub_8037E30
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803941C: .4byte gUnknown_02024A6A
_08039420: .4byte gUnknown_02024A60
_08039424: .4byte gUnknown_02023A60
_08039428: .4byte gUnknown_03004330
_0803942C: .4byte sub_8037E30
	thumb_func_end sub_80393E4

	thumb_func_start sub_8039430
sub_8039430: @ 8039430
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl sub_8032AA8
	ldr r0, _0803958C @ =gUnknown_02024A6A
	lsls r4, r6, 1
	adds r4, r0
	ldr r0, _08039590 @ =gUnknown_02023A60
	lsls r1, r6, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	strh r0, [r4]
	ldrh r0, [r4]
	movs r1, 0x64
	mov r9, r1
	mov r1, r9
	muls r1, r0
	adds r0, r1, 0
	ldr r5, _08039594 @ =gEnemyParty
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	mov r8, r0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _08039598 @ =sub_80312F0
	bl CreateInvisibleSpriteWithCallback
	ldr r1, _0803959C @ =gUnknown_0300434C
	mov r10, r1
	add r10, r6
	mov r1, r10
	strb r0, [r1]
	ldrh r0, [r4]
	mov r1, r9
	muls r1, r0
	adds r0, r1, 0
	adds r0, r5
	adds r1, r6, 0
	bl sub_8031794
	adds r0, r6, 0
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _080395A0 @ =gUnknown_02024E8C
	mov r9, r0
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_8077ABC
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	bl sub_8077F68
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r9
	adds r1, r5, 0
	adds r2, r4, 0
	bl CreateSprite
	ldr r4, _080395A4 @ =gUnknown_02024BE0
	adds r4, r6, r4
	strb r0, [r4]
	ldr r5, _080395A8 @ =gSprites
	mov r0, r10
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r4]
	strh r1, [r0, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r6, [r0, 0x2E]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x32]
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, r6, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _080395AC @ =gUnknown_02024E84
	adds r6, r1
	ldrb r1, [r6]
	bl StartSpriteAnim
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _080395B0 @ =SpriteCallbackDummy
	str r1, [r0]
	movs r0, 0
	movs r1, 0xFE
	bl sub_8046400
	mov r1, r10
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x2E]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803958C: .4byte gUnknown_02024A6A
_08039590: .4byte gUnknown_02023A60
_08039594: .4byte gEnemyParty
_08039598: .4byte sub_80312F0
_0803959C: .4byte gUnknown_0300434C
_080395A0: .4byte gUnknown_02024E8C
_080395A4: .4byte gUnknown_02024BE0
_080395A8: .4byte gSprites
_080395AC: .4byte gUnknown_02024E84
_080395B0: .4byte SpriteCallbackDummy
	thumb_func_end sub_8039430

	thumb_func_start sub_80395B4
sub_80395B4: @ 80395B4
	push {r4-r6,lr}
	ldr r1, _080395E4 @ =gUnknown_02023A60
	ldr r6, _080395E8 @ =gUnknown_02024A60
	ldrb r2, [r6]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r3, [r0]
	cmp r3, 0
	bne _080395F8
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r1, _080395EC @ =0x02017810
	adds r0, r1
	strb r3, [r0, 0x4]
	ldr r1, _080395F0 @ =gUnknown_03004330
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080395F4 @ =sub_8039648
	str r1, [r0]
	b _08039634
	.align 2, 0
_080395E4: .4byte gUnknown_02023A60
_080395E8: .4byte gUnknown_02024A60
_080395EC: .4byte 0x02017810
_080395F0: .4byte gUnknown_03004330
_080395F4: .4byte sub_8039648
_080395F8:
	ldr r5, _0803963C @ =gUnknown_02024BE0
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08039640 @ =gSprites
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldrb r0, [r6]
	bl sub_8032A08
	ldr r1, _08039644 @ =gUnknown_03004340
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8043DB0
	bl dp01_tbl4_exec_completed
_08039634:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803963C: .4byte gUnknown_02024BE0
_08039640: .4byte gSprites
_08039644: .4byte gUnknown_03004340
	thumb_func_end sub_80395B4

	thumb_func_start sub_8039648
sub_8039648: @ 8039648
	push {r4,r5,lr}
	ldr r5, _08039664 @ =gUnknown_02024A60
	ldrb r2, [r5]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r4, _08039668 @ =0x02017810
	adds r3, r0, r4
	ldrb r0, [r3, 0x4]
	cmp r0, 0
	beq _0803966C
	cmp r0, 0x1
	beq _08039698
	b _080396C0
	.align 2, 0
_08039664: .4byte gUnknown_02024A60
_08039668: .4byte 0x02017810
_0803966C:
	lsls r0, r2, 2
	adds r1, r4, 0
	subs r1, 0x10
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08039688
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl move_anim_start_t4
_08039688:
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	movs r0, 0x1
	strb r0, [r1, 0x4]
	b _080396C0
_08039698:
	ldrb r1, [r3]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080396C0
	strb r0, [r3, 0x4]
	ldrb r2, [r5]
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x2
	bl move_anim_start_t4
	ldr r1, _080396C8 @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080396CC @ =sub_8037BBC
	str r1, [r0]
_080396C0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080396C8: .4byte gUnknown_03004330
_080396CC: .4byte sub_8037BBC
	thumb_func_end sub_8039648

	thumb_func_start sub_80396D0
sub_80396D0: @ 80396D0
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	ldr r0, _08039704 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08039714
	ldr r6, _08039708 @ =gUnknown_02024A60
	ldrb r0, [r6]
	bl battle_get_per_side_status
	movs r1, 0x2
	ands r1, r0
	movs r5, 0x10
	cmp r1, 0
	beq _080396F8
	ldr r5, _0803970C @ =0x0000fff0
_080396F8:
	ldr r4, _08039710 @ =gLinkPlayers
	ldrb r0, [r6]
	bl sub_803FC34
	b _08039724
	.align 2, 0
_08039704: .4byte gBattleTypeFlags
_08039708: .4byte gUnknown_02024A60
_0803970C: .4byte 0x0000fff0
_08039710: .4byte gLinkPlayers
_08039714:
	movs r5, 0
	ldr r4, _0803986C @ =gLinkPlayers
	bl GetMultiplayerId
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
_08039724:
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r0, [r1, 0x13]
	mov r9, r0
	ldr r0, _08039870 @ =gUnknown_02024A60
	mov r8, r0
	ldrb r1, [r0]
	mov r0, r9
	bl sub_8031A6C
	mov r1, r8
	ldrb r0, [r1]
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r9
	bl GetMonSpriteTemplate_803C5A0
	ldr r6, _08039874 @ =gUnknown_02024E8C
	lsls r5, 16
	movs r2, 0xB0
	lsls r2, 16
	adds r5, r2
	asrs r5, 16
	ldr r1, _08039878 @ =gTrainerFrontPicCoords
	mov r2, r9
	lsls r0, r2, 2
	adds r0, r1
	ldrb r0, [r0]
	movs r4, 0x8
	subs r4, r0
	lsls r4, 18
	movs r0, 0xA0
	lsls r0, 14
	adds r4, r0
	asrs r4, 16
	mov r1, r8
	ldrb r0, [r1]
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl CreateSprite
	ldr r5, _0803987C @ =gUnknown_02024BE0
	mov r2, r8
	ldrb r1, [r2]
	adds r1, r5
	strb r0, [r1]
	ldr r4, _08039880 @ =gSprites
	ldrb r0, [r2]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _08039884 @ =0x0000ff10
	strh r1, [r0, 0x24]
	ldrb r0, [r2]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x2
	strh r1, [r0, 0x2E]
	ldr r0, _08039888 @ =gTrainerFrontPicPaletteTable
	mov r1, r9
	lsls r6, r1, 3
	adds r0, r6, r0
	ldrh r0, [r0, 0x4]
	bl IndexOfSpritePaletteTag
	mov r2, r8
	ldrb r1, [r2]
	adds r1, r5
	ldrb r1, [r1]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r4
	lsls r0, 4
	ldrb r3, [r2, 0x5]
	movs r1, 0xF
	ands r1, r3
	orrs r1, r0
	strb r1, [r2, 0x5]
	mov r1, r8
	ldrb r0, [r1]
	adds r0, r5
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r1, 0x4]
	lsls r0, 22
	lsrs r0, 22
	strh r0, [r1, 0x38]
	ldr r0, _0803988C @ =gTrainerFrontPicTable
	adds r6, r0
	ldrh r0, [r6, 0x6]
	bl GetSpriteTileStartByTag
	mov r2, r8
	ldrb r1, [r2]
	adds r1, r5
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldr r2, _08039890 @ =0x000003ff
	ands r2, r0
	ldrh r3, [r1, 0x4]
	ldr r0, _08039894 @ =0xfffffc00
	ands r0, r3
	orrs r0, r2
	strh r0, [r1, 0x4]
	mov r1, r8
	ldrb r0, [r1]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	mov r2, r9
	strh r2, [r0, 0x6]
	mov r1, r8
	ldrb r0, [r1]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _08039898 @ =sub_80313A0
	str r1, [r0]
	ldr r1, _0803989C @ =gUnknown_03004330
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080398A0 @ =sub_803757C
	str r1, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803986C: .4byte gLinkPlayers
_08039870: .4byte gUnknown_02024A60
_08039874: .4byte gUnknown_02024E8C
_08039878: .4byte gTrainerFrontPicCoords
_0803987C: .4byte gUnknown_02024BE0
_08039880: .4byte gSprites
_08039884: .4byte 0x0000ff10
_08039888: .4byte gTrainerFrontPicPaletteTable
_0803988C: .4byte gTrainerFrontPicTable
_08039890: .4byte 0x000003ff
_08039894: .4byte 0xfffffc00
_08039898: .4byte sub_80313A0
_0803989C: .4byte gUnknown_03004330
_080398A0: .4byte sub_803757C
	thumb_func_end sub_80396D0

	thumb_func_start sub_80398A4
sub_80398A4: @ 80398A4
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_80398A4

	thumb_func_start sub_80398B0
sub_80398B0: @ 80398B0
	push {r4-r6,lr}
	ldr r6, _08039940 @ =gUnknown_02024BE0
	ldr r4, _08039944 @ =gUnknown_02024A60
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _08039948 @ =gSprites
	adds r0, r5
	bl oamt_add_pos2_onto_pos1
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x23
	strh r1, [r0, 0x2E]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x8C
	lsls r1, 1
	strh r1, [r0, 0x32]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0x36]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0803994C @ =sub_8078B34
	str r1, [r0]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08039950 @ =SpriteCallbackDummy
	bl oamt_set_x3A_32
	ldr r1, _08039954 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08039958 @ =sub_80375B4
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08039940: .4byte gUnknown_02024BE0
_08039944: .4byte gUnknown_02024A60
_08039948: .4byte gSprites
_0803994C: .4byte sub_8078B34
_08039950: .4byte SpriteCallbackDummy
_08039954: .4byte gUnknown_03004330
_08039958: .4byte sub_80375B4
	thumb_func_end sub_80398B0

	thumb_func_start sub_803995C
sub_803995C: @ 803995C
	push {r4,r5,lr}
	ldr r5, _080399A0 @ =gUnknown_02024A60
	ldrb r2, [r5]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r4, _080399A4 @ =0x02017810
	adds r3, r0, r4
	ldrb r0, [r3, 0x4]
	cmp r0, 0
	bne _080399A8
	lsls r0, r2, 2
	adds r1, r4, 0
	subs r1, 0x10
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0803998E
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl move_anim_start_t4
_0803998E:
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r0, [r1, 0x4]
	adds r0, 0x1
	strb r0, [r1, 0x4]
	b _080399E4
	.align 2, 0
_080399A0: .4byte gUnknown_02024A60
_080399A4: .4byte 0x02017810
_080399A8:
	ldrb r1, [r3]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080399E4
	strb r0, [r3, 0x4]
	movs r0, 0x10
	movs r1, 0x3F
	bl PlaySE12WithPanning
	ldr r2, _080399EC @ =gSprites
	ldr r1, _080399F0 @ =gUnknown_02024BE0
	ldrb r0, [r5]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _080399F4 @ =sub_8010384
	str r1, [r0]
	ldr r1, _080399F8 @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080399FC @ =sub_8037B78
	str r1, [r0]
_080399E4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080399EC: .4byte gSprites
_080399F0: .4byte gUnknown_02024BE0
_080399F4: .4byte sub_8010384
_080399F8: .4byte gUnknown_03004330
_080399FC: .4byte sub_8037B78
	thumb_func_end sub_803995C

	thumb_func_start sub_8039A00
sub_8039A00: @ 8039A00
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8039A00

	thumb_func_start sub_8039A0C
sub_8039A0C: @ 8039A0C
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8039A0C

	thumb_func_start sub_8039A18
sub_8039A18: @ 8039A18
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8039A18

	thumb_func_start sub_8039A24
sub_8039A24: @ 8039A24
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8039A24

	thumb_func_start sub_8039A30
sub_8039A30: @ 8039A30
	push {r4-r6,lr}
	ldr r6, _08039B14 @ =gUnknown_02024A60
	ldrb r0, [r6]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	beq _08039A42
	b _08039B52
_08039A42:
	ldr r0, _08039B18 @ =gUnknown_02023A60
	mov r12, r0
	ldrb r2, [r6]
	lsls r2, 9
	adds r0, 0x1
	adds r0, r2, r0
	ldrb r0, [r0]
	mov r1, r12
	adds r1, 0x2
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	ldr r5, _08039B1C @ =gUnknown_0202F7C4
	mov r1, r12
	adds r1, 0x3
	adds r2, r1
	ldrb r1, [r2]
	strb r1, [r5]
	ldr r4, _08039B20 @ =gUnknown_0202F7BC
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x4
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0x5
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r3, r1
	strh r3, [r4]
	ldr r4, _08039B24 @ =gUnknown_0202F7B8
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x6
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0x7
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 8
	orrs r3, r1
	mov r1, r12
	adds r1, 0x8
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 16
	orrs r3, r1
	mov r1, r12
	adds r1, 0x9
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 24
	orrs r3, r1
	str r3, [r4]
	ldr r3, _08039B28 @ =gUnknown_0202F7BE
	ldrb r1, [r6]
	lsls r1, 9
	mov r2, r12
	adds r2, 0xA
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r3]
	ldr r4, _08039B2C @ =gUnknown_0202F7C0
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0xC
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0xD
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r3, r1
	strh r3, [r4]
	ldr r3, _08039B30 @ =gUnknown_0202F7B4
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x10
	adds r2, r1
	str r2, [r3]
	ldr r3, _08039B34 @ =gUnknown_02024E70
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r3
	ldr r2, [r2]
	str r2, [r1]
	ldrb r1, [r5]
	bl sub_8031720
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _08039B38
	bl dp01_tbl4_exec_completed
	b _08039B52
	.align 2, 0
_08039B14: .4byte gUnknown_02024A60
_08039B18: .4byte gUnknown_02023A60
_08039B1C: .4byte gUnknown_0202F7C4
_08039B20: .4byte gUnknown_0202F7BC
_08039B24: .4byte gUnknown_0202F7B8
_08039B28: .4byte gUnknown_0202F7BE
_08039B2C: .4byte gUnknown_0202F7C0
_08039B30: .4byte gUnknown_0202F7B4
_08039B34: .4byte gUnknown_02024E70
_08039B38:
	ldrb r1, [r6]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08039B58 @ =0x02017810
	adds r0, r1
	strb r2, [r0, 0x4]
	ldr r1, _08039B5C @ =gUnknown_03004330
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08039B60 @ =sub_8039B64
	str r1, [r0]
_08039B52:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08039B58: .4byte 0x02017810
_08039B5C: .4byte gUnknown_03004330
_08039B60: .4byte sub_8039B64
	thumb_func_end sub_8039A30

	thumb_func_start sub_8039B64
sub_8039B64: @ 8039B64
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r2, _08039BA8 @ =gUnknown_02023A60
	ldr r5, _08039BAC @ =gUnknown_02024A60
	ldrb r3, [r5]
	lsls r1, r3, 9
	adds r0, r2, 0x1
	mov r9, r0
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r6, r2, 0x2
	mov r8, r6
	adds r0, r1, r6
	ldrb r0, [r0]
	lsls r0, 8
	orrs r4, r0
	adds r2, 0xB
	adds r1, r2
	ldrb r7, [r1]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r6, _08039BB0 @ =0x02017810
	adds r0, r6
	ldrb r2, [r0, 0x4]
	cmp r2, 0x1
	beq _08039BF2
	cmp r2, 0x1
	bgt _08039BB4
	cmp r2, 0
	beq _08039BBE
	b _08039CBC
	.align 2, 0
_08039BA8: .4byte gUnknown_02023A60
_08039BAC: .4byte gUnknown_02024A60
_08039BB0: .4byte 0x02017810
_08039BB4:
	cmp r2, 0x2
	beq _08039C18
	cmp r2, 0x3
	beq _08039C84
	b _08039CBC
_08039BBE:
	lsls r1, r3, 2
	adds r0, r6, 0
	subs r0, 0x10
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0xC
	ands r0, r2
	cmp r0, 0x4
	bne _08039BE2
	movs r0, 0x8
	orrs r0, r2
	strb r0, [r1]
	ldrb r2, [r5]
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl move_anim_start_t4
_08039BE2:
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	movs r0, 0x1
	strb r0, [r1, 0x4]
	b _08039CBC
_08039BF2:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08039CBC
	movs r0, 0
	bl sub_80326EC
	adds r0, r4, 0
	bl ExecuteMoveAnim
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	movs r0, 0x2
	strb r0, [r1, 0x4]
	b _08039CBC
_08039C18:
	ldr r0, _08039C74 @ =gAnimScriptCallback
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _08039C78 @ =gAnimScriptActive
	ldrb r0, [r0]
	cmp r0, 0
	bne _08039CBC
	movs r0, 0x1
	bl sub_80326EC
	ldrb r2, [r5]
	lsls r0, r2, 2
	adds r4, r6, 0
	subs r4, 0x10
	adds r0, r4
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08039C60
	cmp r7, 0x1
	bhi _08039C60
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x6
	bl move_anim_start_t4
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r4
	ldrb r2, [r0]
	movs r1, 0x9
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_08039C60:
	ldr r0, _08039C7C @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08039C80 @ =0x02017810
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0, 0x4]
	b _08039CBC
	.align 2, 0
_08039C74: .4byte gAnimScriptCallback
_08039C78: .4byte gAnimScriptActive
_08039C7C: .4byte gUnknown_02024A60
_08039C80: .4byte 0x02017810
_08039C84:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08039CBC
	bl sub_8031F24
	ldrb r0, [r5]
	lsls r2, r0, 9
	mov r3, r9
	adds r1, r2, r3
	ldrb r1, [r1]
	add r2, r8
	ldrb r2, [r2]
	lsls r2, 8
	orrs r1, r2
	bl sub_80324BC
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strb r4, [r0, 0x4]
	bl dp01_tbl4_exec_completed
_08039CBC:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8039B64

	thumb_func_start sub_8039CC8
sub_8039CC8: @ 8039CC8
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08039D0C @ =gUnknown_030042A4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08039D10 @ =gUnknown_030042A0
	strh r1, [r0]
	ldr r4, _08039D14 @ =gUnknown_02024A60
	ldrb r0, [r4]
	lsls r0, 9
	ldr r1, _08039D18 @ =gUnknown_02023A62
	adds r0, r1
	ldrh r0, [r0]
	bl sub_8120AA8
	ldr r0, _08039D1C @ =gUnknown_03004210
	ldr r1, _08039D20 @ =gUnknown_020238CC
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _08039D24 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08039D28 @ =sub_8037C2C
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039D0C: .4byte gUnknown_030042A4
_08039D10: .4byte gUnknown_030042A0
_08039D14: .4byte gUnknown_02024A60
_08039D18: .4byte gUnknown_02023A62
_08039D1C: .4byte gUnknown_03004210
_08039D20: .4byte gUnknown_020238CC
_08039D24: .4byte gUnknown_03004330
_08039D28: .4byte sub_8037C2C
	thumb_func_end sub_8039CC8

	thumb_func_start sub_8039D2C
sub_8039D2C: @ 8039D2C
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8039D2C

	thumb_func_start sub_8039D38
sub_8039D38: @ 8039D38
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8039D38

	thumb_func_start sub_8039D44
sub_8039D44: @ 8039D44
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8039D44

	thumb_func_start sub_8039D50
sub_8039D50: @ 8039D50
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8039D50

	thumb_func_start sub_8039D5C
sub_8039D5C: @ 8039D5C
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8039D5C

	thumb_func_start sub_8039D68
sub_8039D68: @ 8039D68
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8039D68

	thumb_func_start sub_8039D74
sub_8039D74: @ 8039D74
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8039D74

	thumb_func_start sub_8039D80
sub_8039D80: @ 8039D80
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	movs r0, 0
	bl load_gfxc_health_bar
	ldr r3, _08039DF8 @ =gUnknown_02023A60
	ldr r0, _08039DFC @ =gUnknown_02024A60
	mov r9, r0
	ldrb r4, [r0]
	lsls r2, r4, 9
	adds r0, r3, 0x2
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r3, 0x3
	adds r2, r3
	ldrb r0, [r2]
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	asrs r7, r1, 16
	ldr r0, _08039E00 @ =0x00007fff
	cmp r7, r0
	beq _08039E10
	ldr r6, _08039E04 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r6
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _08039E08 @ =gEnemyParty
	adds r0, r4
	movs r1, 0x3A
	bl GetMonData
	mov r8, r0
	mov r1, r9
	ldrb r0, [r1]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r4
	movs r1, 0x39
	bl GetMonData
	adds r3, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r1, _08039E0C @ =gUnknown_03004340
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	mov r2, r8
	bl sub_8043D84
	b _08039E3A
	.align 2, 0
_08039DF8: .4byte gUnknown_02023A60
_08039DFC: .4byte gUnknown_02024A60
_08039E00: .4byte 0x00007fff
_08039E04: .4byte gUnknown_02024A6A
_08039E08: .4byte gEnemyParty
_08039E0C: .4byte gUnknown_03004340
_08039E10:
	ldr r1, _08039E58 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08039E5C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x3A
	bl GetMonData
	adds r2, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r1, _08039E60 @ =gUnknown_03004340
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	movs r3, 0
	bl sub_8043D84
_08039E3A:
	ldr r1, _08039E64 @ =gUnknown_03004330
	ldr r0, _08039E68 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08039E6C @ =sub_8037B24
	str r1, [r0]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039E58: .4byte gUnknown_02024A6A
_08039E5C: .4byte gEnemyParty
_08039E60: .4byte gUnknown_03004340
_08039E64: .4byte gUnknown_03004330
_08039E68: .4byte gUnknown_02024A60
_08039E6C: .4byte sub_8037B24
	thumb_func_end sub_8039D80

	thumb_func_start sub_8039E70
sub_8039E70: @ 8039E70
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8039E70

	thumb_func_start sub_8039E7C
sub_8039E7C: @ 8039E7C
	push {r4,lr}
	ldr r4, _08039ED4 @ =gUnknown_02024A60
	ldrb r0, [r4]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _08039ECC
	ldr r0, _08039ED8 @ =gUnknown_03004340
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _08039EDC @ =gUnknown_02024A6A
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _08039EE0 @ =gEnemyParty
	adds r1, r2
	movs r2, 0x9
	bl sub_8045A5C
	ldrb r0, [r4]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r0, _08039EE4 @ =0x02017810
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r1, _08039EE8 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08039EEC @ =sub_8037FAC
	str r1, [r0]
_08039ECC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039ED4: .4byte gUnknown_02024A60
_08039ED8: .4byte gUnknown_03004340
_08039EDC: .4byte gUnknown_02024A6A
_08039EE0: .4byte gEnemyParty
_08039EE4: .4byte 0x02017810
_08039EE8: .4byte gUnknown_03004330
_08039EEC: .4byte sub_8037FAC
	thumb_func_end sub_8039E7C

	thumb_func_start sub_8039EF0
sub_8039EF0: @ 8039EF0
	push {r4,r5,lr}
	ldr r5, _08039F48 @ =gUnknown_02024A60
	ldrb r0, [r5]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _08039F40
	ldr r4, _08039F4C @ =gUnknown_02023A60
	ldrb r3, [r5]
	lsls r3, 9
	adds r0, r4, 0x1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, r4, 0x2
	adds r1, r3, r1
	ldrb r1, [r1]
	adds r2, r4, 0x3
	adds r2, r3, r2
	ldrb r2, [r2]
	lsls r2, 8
	orrs r1, r2
	adds r2, r4, 0x4
	adds r2, r3, r2
	ldrb r2, [r2]
	lsls r2, 16
	orrs r1, r2
	adds r4, 0x5
	adds r3, r4
	ldrb r2, [r3]
	lsls r2, 24
	orrs r1, r2
	bl move_anim_start_t2_for_situation
	ldr r1, _08039F50 @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08039F54 @ =sub_8037FAC
	str r1, [r0]
_08039F40:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08039F48: .4byte gUnknown_02024A60
_08039F4C: .4byte gUnknown_02023A60
_08039F50: .4byte gUnknown_03004330
_08039F54: .4byte sub_8037FAC
	thumb_func_end sub_8039EF0

	thumb_func_start sub_8039F58
sub_8039F58: @ 8039F58
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8039F58

	thumb_func_start sub_8039F64
sub_8039F64: @ 8039F64
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8039F64

	thumb_func_start sub_8039F70
sub_8039F70: @ 8039F70
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8039F70

	thumb_func_start sub_8039F7C
sub_8039F7C: @ 8039F7C
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8039F7C

	thumb_func_start sub_8039F88
sub_8039F88: @ 8039F88
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8039F88

	thumb_func_start sub_8039F94
sub_8039F94: @ 8039F94
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8039F94

	thumb_func_start sub_8039FA0
sub_8039FA0: @ 8039FA0
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8039FA0

	thumb_func_start sub_8039FAC
sub_8039FAC: @ 8039FAC
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8039FAC

	thumb_func_start sub_8039FB8
sub_8039FB8: @ 8039FB8
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8039FB8

	thumb_func_start sub_8039FC4
sub_8039FC4: @ 8039FC4
	push {lr}
	ldr r2, _08039FDC @ =gUnknown_020238C8
	ldrb r1, [r2]
	movs r0, 0x80
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08039FDC: .4byte gUnknown_020238C8
	thumb_func_end sub_8039FC4

	thumb_func_start sub_8039FE0
sub_8039FE0: @ 8039FE0
	push {lr}
	ldr r3, _0803A00C @ =gUnknown_020238C8
	ldr r1, _0803A010 @ =gUnknown_02023A60
	ldr r0, _0803A014 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x7F
	ands r1, r0
	ldrb r2, [r3]
	movs r0, 0x80
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_0803A00C: .4byte gUnknown_020238C8
_0803A010: .4byte gUnknown_02023A60
_0803A014: .4byte gUnknown_02024A60
	thumb_func_end sub_8039FE0

	thumb_func_start sub_803A018
sub_803A018: @ 803A018
	push {lr}
	ldr r2, _0803A02C @ =gUnknown_020238C8
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_0803A02C: .4byte gUnknown_020238C8
	thumb_func_end sub_803A018

	thumb_func_start sub_803A030
sub_803A030: @ 803A030
	push {lr}
	ldr r3, _0803A054 @ =gUnknown_020238C8
	ldr r1, [r3]
	lsls r1, 24
	lsrs r1, 31
	movs r0, 0x1
	eors r1, r0
	lsls r1, 7
	ldrb r2, [r3]
	movs r0, 0x7F
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_0803A054: .4byte gUnknown_020238C8
	thumb_func_end sub_803A030

	thumb_func_start dp01t_29_4_blink
dp01t_29_4_blink: @ 803A058
	push {r4,lr}
	ldr r3, _0803A080 @ =gSprites
	ldr r2, _0803A084 @ =gUnknown_02024BE0
	ldr r4, _0803A088 @ =gUnknown_02024A60
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _0803A08C
	bl dp01_tbl4_exec_completed
	b _0803A0B6
	.align 2, 0
_0803A080: .4byte gSprites
_0803A084: .4byte gUnknown_02024BE0
_0803A088: .4byte gUnknown_02024A60
_0803A08C:
	ldr r1, _0803A0BC @ =gUnknown_02024E6D
	movs r0, 0x1
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0
	strh r1, [r0, 0x30]
	ldrb r0, [r4]
	bl sub_8047858
	ldr r1, _0803A0C0 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803A0C4 @ =dp01t_0F_4_move_anim
	str r1, [r0]
_0803A0B6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803A0BC: .4byte gUnknown_02024E6D
_0803A0C0: .4byte gUnknown_03004330
_0803A0C4: .4byte dp01t_0F_4_move_anim
	thumb_func_end dp01t_29_4_blink

	thumb_func_start sub_803A0C8
sub_803A0C8: @ 803A0C8
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_803A0C8

	thumb_func_start sub_803A0D4
sub_803A0D4: @ 803A0D4
	push {r4,lr}
	ldr r4, _0803A110 @ =gUnknown_02024A60
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	movs r3, 0x3F
	cmp r0, 0
	bne _0803A0E8
	movs r3, 0xC0
_0803A0E8:
	ldr r2, _0803A114 @ =gUnknown_02023A60
	ldrb r1, [r4]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	lsls r1, r3, 24
	asrs r1, 24
	bl PlaySE12WithPanning
	bl dp01_tbl4_exec_completed
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803A110: .4byte gUnknown_02024A60
_0803A114: .4byte gUnknown_02023A60
	thumb_func_end sub_803A0D4

	thumb_func_start sub_803A118
sub_803A118: @ 803A118
	push {lr}
	ldr r2, _0803A140 @ =gUnknown_02023A60
	ldr r0, _0803A144 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	bl PlayFanfare
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_0803A140: .4byte gUnknown_02023A60
_0803A144: .4byte gUnknown_02024A60
	thumb_func_end sub_803A118

	thumb_func_start sub_803A148
sub_803A148: @ 803A148
	push {lr}
	ldr r1, _0803A178 @ =gUnknown_02024A6A
	ldr r0, _0803A17C @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0803A180 @ =gEnemyParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x19
	movs r2, 0x5
	bl PlayCry3
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_0803A178: .4byte gUnknown_02024A6A
_0803A17C: .4byte gUnknown_02024A60
_0803A180: .4byte gEnemyParty
	thumb_func_end sub_803A148

	thumb_func_start dp01t_2E_4_battle_intro
dp01t_2E_4_battle_intro: @ 803A184
	push {lr}
	ldr r1, _0803A1AC @ =gUnknown_02023A60
	ldr r0, _0803A1B0 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80E43C0
	ldr r2, _0803A1B4 @ =gUnknown_02024DE8
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_0803A1AC: .4byte gUnknown_02023A60
_0803A1B0: .4byte gUnknown_02024A60
_0803A1B4: .4byte gUnknown_02024DE8
	thumb_func_end dp01t_2E_4_battle_intro

	thumb_func_start sub_803A1B8
sub_803A1B8: @ 803A1B8
	push {r4-r6,lr}
	ldr r5, _0803A294 @ =gUnknown_02024BE0
	ldr r6, _0803A298 @ =gUnknown_02024A60
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0803A29C @ =gSprites
	adds r0, r4
	bl oamt_add_pos2_onto_pos1
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x23
	strh r1, [r0, 0x2E]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x8C
	lsls r1, 1
	strh r1, [r0, 0x32]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0x36]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0803A2A0 @ =sub_8078B34
	str r1, [r0]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _0803A2A4 @ =sub_803A3A8
	bl oamt_set_x3A_32
	ldr r0, _0803A2A8 @ =sub_803A2C4
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _0803A2AC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	ldrb r0, [r6]
	strh r0, [r1, 0x8]
	ldrb r3, [r6]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r2, _0803A2B0 @ =0x02017810
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0803A276
	ldr r0, _0803A2B4 @ =gUnknown_02024E68
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	ldr r1, _0803A2B8 @ =sub_8044CA0
	str r1, [r0]
_0803A276:
	adds r2, 0x30
	ldrb r0, [r2, 0x9]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _0803A2BC @ =gUnknown_03004330
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803A2C0 @ =nullsub_47
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803A294: .4byte gUnknown_02024BE0
_0803A298: .4byte gUnknown_02024A60
_0803A29C: .4byte gSprites
_0803A2A0: .4byte sub_8078B34
_0803A2A4: .4byte sub_803A3A8
_0803A2A8: .4byte sub_803A2C4
_0803A2AC: .4byte gTasks
_0803A2B0: .4byte 0x02017810
_0803A2B4: .4byte gUnknown_02024E68
_0803A2B8: .4byte sub_8044CA0
_0803A2BC: .4byte gUnknown_03004330
_0803A2C0: .4byte nullsub_47
	thumb_func_end sub_803A1B8

	thumb_func_start sub_803A2C4
sub_803A2C4: @ 803A2C4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r7, _0803A31C @ =gUnknown_02024A60
	ldrb r0, [r7]
	mov r9, r0
	ldr r1, _0803A320 @ =gTasks
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x8]
	strb r0, [r7]
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _0803A2FE
	ldr r0, _0803A324 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0803A330
_0803A2FE:
	ldr r0, _0803A328 @ =gUnknown_02023A60
	ldrb r1, [r7]
	lsls r2, r1, 9
	adds r0, 0x1
	adds r2, r0
	ldr r0, _0803A32C @ =gUnknown_02024A6A
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	strb r0, [r2]
	ldrb r0, [r7]
	movs r1, 0
	bl sub_8039430
	b _0803A370
	.align 2, 0
_0803A31C: .4byte gUnknown_02024A60
_0803A320: .4byte gTasks
_0803A324: .4byte gBattleTypeFlags
_0803A328: .4byte gUnknown_02023A60
_0803A32C: .4byte gUnknown_02024A6A
_0803A330:
	ldr r4, _0803A394 @ =gUnknown_02023A60
	ldrb r0, [r7]
	lsls r1, r0, 9
	adds r4, 0x1
	adds r1, r4
	ldr r6, _0803A398 @ =gUnknown_02024A6A
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, 0
	bl sub_8039430
	ldrb r0, [r7]
	movs r5, 0x2
	eors r0, r5
	strb r0, [r7]
	ldrb r0, [r7]
	lsls r1, r0, 9
	adds r1, r4
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, 0
	bl sub_8039430
	ldrb r0, [r7]
	eors r0, r5
	strb r0, [r7]
_0803A370:
	ldr r1, _0803A39C @ =gUnknown_03004330
	ldr r2, _0803A3A0 @ =gUnknown_02024A60
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803A3A4 @ =sub_8037840
	str r1, [r0]
	mov r0, r9
	strb r0, [r2]
	mov r0, r8
	bl DestroyTask
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803A394: .4byte gUnknown_02023A60
_0803A398: .4byte gUnknown_02024A6A
_0803A39C: .4byte gUnknown_03004330
_0803A3A0: .4byte gUnknown_02024A60
_0803A3A4: .4byte sub_8037840
	thumb_func_end sub_803A2C4

	thumb_func_start sub_803A3A8
sub_803A3A8: @ 803A3A8
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x6]
	bl sub_8031B74
	ldrh r0, [r4, 0x38]
	ldr r1, _0803A3D4 @ =0x000003ff
	ands r1, r0
	ldrh r2, [r4, 0x4]
	ldr r0, _0803A3D8 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803A3D4: .4byte 0x000003ff
_0803A3D8: .4byte 0xfffffc00
	thumb_func_end sub_803A3A8

	thumb_func_start sub_803A3DC
sub_803A3DC: @ 803A3DC
	push {r4-r6,lr}
	ldr r1, _0803A404 @ =gUnknown_02023A60
	ldr r0, _0803A408 @ =gUnknown_02024A60
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0803A40C
	adds r0, r2, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0803A40C
	bl dp01_tbl4_exec_completed
	b _0803A4C6
	.align 2, 0
_0803A404: .4byte gUnknown_02023A60
_0803A408: .4byte gUnknown_02024A60
_0803A40C:
	ldr r3, _0803A45C @ =gUnknown_02024A60
	ldrb r1, [r3]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r4, _0803A460 @ =0x02017810
	adds r0, r4
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	ldr r1, _0803A464 @ =gUnknown_02023A60
	ldrb r2, [r3]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r0, r1
	ldrb r0, [r0]
	adds r6, r3, 0
	cmp r0, 0
	beq _0803A470
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r3, r0, r4
	ldrb r2, [r3, 0x1]
	lsls r1, r2, 26
	lsrs r0, r1, 27
	cmp r0, 0x1
	bhi _0803A468
	adds r0, 0x1
	movs r1, 0x1F
	ands r0, r1
	lsls r0, 1
	movs r1, 0x3F
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x1]
	b _0803A4C6
	.align 2, 0
_0803A45C: .4byte gUnknown_02024A60
_0803A460: .4byte 0x02017810
_0803A464: .4byte gUnknown_02023A60
_0803A468:
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	strb r0, [r3, 0x1]
_0803A470:
	adds r5, r6, 0
	ldrb r0, [r5]
	lsls r3, r0, 9
	ldr r4, _0803A4CC @ =gUnknown_02023A64
	adds r1, r3, r4
	subs r2, r4, 0x3
	adds r2, r3, r2
	ldrb r2, [r2]
	subs r4, 0x2
	adds r3, r4
	ldrb r3, [r3]
	bl sub_8044804
	ldr r2, _0803A4D0 @ =gUnknown_02024E68
	ldrb r1, [r5]
	adds r1, r2
	movs r2, 0
	strb r0, [r1]
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r3, _0803A4D4 @ =0x02017810
	adds r0, r3
	strb r2, [r0, 0x5]
	ldrb r1, [r5]
	lsls r0, r1, 9
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _0803A4BA
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0x5D
	strb r1, [r0, 0x5]
_0803A4BA:
	ldr r0, _0803A4D8 @ =gUnknown_03004330
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _0803A4DC @ =sub_803A4E0
	str r0, [r1]
_0803A4C6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803A4CC: .4byte gUnknown_02023A64
_0803A4D0: .4byte gUnknown_02024E68
_0803A4D4: .4byte 0x02017810
_0803A4D8: .4byte gUnknown_03004330
_0803A4DC: .4byte sub_803A4E0
	thumb_func_end sub_803A3DC

	thumb_func_start sub_803A4E0
sub_803A4E0: @ 803A4E0
	push {r4,lr}
	ldr r4, _0803A518 @ =gUnknown_02024A60
	ldrb r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r3, _0803A51C @ =0x02017810
	adds r0, r3
	ldrb r1, [r0, 0x5]
	adds r2, r1, 0x1
	strb r2, [r0, 0x5]
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x5C
	bls _0803A510
	ldrb r0, [r4]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	movs r0, 0
	strb r0, [r1, 0x5]
	bl dp01_tbl4_exec_completed
_0803A510:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803A518: .4byte gUnknown_02024A60
_0803A51C: .4byte 0x02017810
	thumb_func_end sub_803A4E0

	thumb_func_start sub_803A520
sub_803A520: @ 803A520
	push {lr}
	ldr r0, _0803A558 @ =gUnknown_02024A60
	ldrb r3, [r0]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r1, _0803A55C @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0803A54E
	ldr r2, _0803A560 @ =gTasks
	ldr r0, _0803A564 @ =gUnknown_02024E68
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _0803A568 @ =sub_8044CA0
	str r1, [r0]
_0803A54E:
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_0803A558: .4byte gUnknown_02024A60
_0803A55C: .4byte 0x02017810
_0803A560: .4byte gTasks
_0803A564: .4byte gUnknown_02024E68
_0803A568: .4byte sub_8044CA0
	thumb_func_end sub_803A520

	thumb_func_start sub_803A56C
sub_803A56C: @ 803A56C
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_803A56C

	thumb_func_start sub_803A578
sub_803A578: @ 803A578
	push {r4,lr}
	ldr r4, _0803A5C8 @ =gUnknown_02024A60
	ldrb r0, [r4]
	bl sub_8078874
	lsls r0, 24
	cmp r0, 0
	beq _0803A5BE
	ldr r3, _0803A5CC @ =gSprites
	ldr r0, _0803A5D0 @ =gUnknown_02024BE0
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldr r0, _0803A5D4 @ =gUnknown_02023A60
	lsls r1, 9
	adds r0, 0x1
	adds r1, r0
	adds r2, 0x3E
	movs r0, 0x1
	ldrb r1, [r1]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r4]
	bl sub_8031F88
_0803A5BE:
	bl dp01_tbl4_exec_completed
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803A5C8: .4byte gUnknown_02024A60
_0803A5CC: .4byte gSprites
_0803A5D0: .4byte gUnknown_02024BE0
_0803A5D4: .4byte gUnknown_02023A60
	thumb_func_end sub_803A578

	thumb_func_start bx_exec_buffer_A_ch0_tbl4
bx_exec_buffer_A_ch0_tbl4: @ 803A5D8
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r6, _0803A61C @ =gUnknown_02024A60
	ldrb r0, [r6]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _0803A630
	ldr r5, _0803A620 @ =gUnknown_02023A60
	ldrb r2, [r6]
	lsls r1, r2, 9
	adds r0, r5, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r0, r5, 0x2
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r5, 0x3
	adds r1, r5
	ldrb r0, [r1]
	lsls r0, 8
	orrs r4, r0
	str r4, [sp]
	adds r0, r2, 0
	adds r1, r2, 0
	bl move_anim_start_t3
	lsls r0, 24
	cmp r0, 0
	beq _0803A624
	bl dp01_tbl4_exec_completed
	b _0803A630
	.align 2, 0
_0803A61C: .4byte gUnknown_02024A60
_0803A620: .4byte gUnknown_02023A60
_0803A624:
	ldr r0, _0803A638 @ =gUnknown_03004330
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _0803A63C @ =sub_8037FD8
	str r0, [r1]
_0803A630:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803A638: .4byte gUnknown_03004330
_0803A63C: .4byte sub_8037FD8
	thumb_func_end bx_exec_buffer_A_ch0_tbl4

	thumb_func_start sub_803A640
sub_803A640: @ 803A640
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_803A640

	thumb_func_start sub_803A64C
sub_803A64C: @ 803A64C
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_803A64C

	thumb_func_start sub_803A658
sub_803A658: @ 803A658
	push {lr}
	ldr r1, _0803A674 @ =gUnknown_02023A60
	ldr r0, _0803A678 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r2, [r0]
	cmp r2, 0x3
	bne _0803A680
	ldr r0, _0803A67C @ =gUnknown_02024D26
	strb r2, [r0]
	b _0803A688
	.align 2, 0
_0803A674: .4byte gUnknown_02023A60
_0803A678: .4byte gUnknown_02024A60
_0803A67C: .4byte gUnknown_02024D26
_0803A680:
	ldr r0, _0803A6AC @ =gUnknown_02024D26
	movs r1, 0x3
	eors r1, r2
	strb r1, [r0]
_0803A688:
	movs r0, 0x5
	bl FadeOutMapMusic
	movs r0, 0x3
	bl BeginFastPaletteFade
	bl dp01_tbl4_exec_completed
	ldr r1, _0803A6B0 @ =gUnknown_03004330
	ldr r0, _0803A6B4 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803A6B8 @ =sub_8037F34
	str r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0803A6AC: .4byte gUnknown_02024D26
_0803A6B0: .4byte gUnknown_03004330
_0803A6B4: .4byte gUnknown_02024A60
_0803A6B8: .4byte sub_8037F34
	thumb_func_end sub_803A658

	thumb_func_start nullsub_48
nullsub_48: @ 803A6BC
	bx lr
	thumb_func_end nullsub_48

	.align 2, 0 @ Don't pad with nop.
