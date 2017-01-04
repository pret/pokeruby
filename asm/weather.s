	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_807CEBC
sub_807CEBC: @ 807CEBC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r3, r0, 24
	adds r4, r3, 0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	asrs r0, r2, 24
	cmp r0, 0
	bgt _0807CEDE
	b _0807D048
_0807CEDE:
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	lsls r5, r3, 4
	adds r0, r1, r3
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	cmp r4, r9
	bcc _0807CEF6
	b _0807D1A2
_0807CEF6:
	ldr r1, [sp]
	lsls r0, r1, 24
	asrs r0, 19
	str r0, [sp, 0x4]
_0807CEFE:
	ldr r0, _0807CF30 @ =gUnknown_030006DC
	ldr r0, [r0]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807CF3C
	lsls r1, r5, 1
	ldr r0, _0807CF34 @ =gPlttBufferUnfaded
	adds r0, r1, r0
	ldr r2, _0807CF38 @ =gPlttBufferFaded
	adds r1, r2
	movs r2, 0x8
	bl CpuFastSet
	adds r0, r5, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r5, r0, 16
	mov r2, r9
	lsls r2, 16
	mov r8, r2
	adds r4, 0x1
	mov r12, r4
	b _0807D032
	.align 2, 0
_0807CF30: .4byte gUnknown_030006DC
_0807CF34: .4byte gPlttBufferUnfaded
_0807CF38: .4byte gPlttBufferFaded
_0807CF3C:
	cmp r0, 0x2
	beq _0807CF50
	adds r1, r4, 0
	subs r1, 0x10
	ldr r2, _0807CF54 @ =gUnknown_0202F7E8
	ldr r3, _0807CF58 @ =0x000006d5
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r1, r0
	bne _0807CF60
_0807CF50:
	ldr r0, _0807CF5C @ =gUnknown_0202FC48
	b _0807CF66
	.align 2, 0
_0807CF54: .4byte gUnknown_0202F7E8
_0807CF58: .4byte 0x000006d5
_0807CF5C: .4byte gUnknown_0202FC48
_0807CF60:
	movs r3, 0x80
	lsls r3, 2
	adds r0, r2, r3
_0807CF66:
	ldr r1, [sp, 0x4]
	adds r6, r1, r0
	cmp r4, 0x10
	beq _0807CF72
	cmp r4, 0x1B
	bls _0807CFE2
_0807CF72:
	movs r7, 0
	mov r2, r9
	lsls r2, 16
	mov r8, r2
	adds r4, 0x1
	mov r12, r4
	ldr r3, _0807CF9C @ =gPlttBufferFaded
	mov r10, r3
_0807CF82:
	adds r2, r5, 0
	lsls r0, r5, 1
	ldr r4, _0807CFA0 @ =gPlttBufferUnfaded
	adds r1, r0, r4
	ldrh r0, [r1]
	ldr r3, _0807CFA4 @ =0x00002d9f
	cmp r0, r3
	bne _0807CFA8
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	b _0807CFD6
	.align 2, 0
_0807CF9C: .4byte gPlttBufferFaded
_0807CFA0: .4byte gPlttBufferUnfaded
_0807CFA4: .4byte 0x00002d9f
_0807CFA8:
	ldr r1, [r1]
	lsls r0, r1, 27
	lsrs r0, 27
	adds r0, r6, r0
	ldrb r4, [r0]
	lsls r0, r1, 22
	lsrs r0, 27
	adds r0, r6, r0
	ldrb r3, [r0]
	lsls r1, 17
	lsrs r1, 27
	adds r1, r6, r1
	ldrb r1, [r1]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r2, 1
	add r2, r10
	lsls r0, r1, 10
	lsls r1, r3, 5
	orrs r0, r1
	orrs r0, r4
	strh r0, [r2]
_0807CFD6:
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0xF
	bls _0807CF82
	b _0807D032
_0807CFE2:
	movs r7, 0
	mov r0, r9
	lsls r0, 16
	mov r8, r0
	adds r4, 0x1
	mov r12, r4
	ldr r1, _0807D040 @ =gPlttBufferFaded
	mov r10, r1
_0807CFF2:
	adds r2, r5, 0
	lsls r0, r2, 1
	ldr r3, _0807D044 @ =gPlttBufferUnfaded
	adds r0, r3
	ldr r1, [r0]
	lsls r0, r1, 27
	lsrs r0, 27
	adds r0, r6, r0
	ldrb r4, [r0]
	lsls r0, r1, 22
	lsrs r0, 27
	adds r0, r6, r0
	ldrb r3, [r0]
	lsls r1, 17
	lsrs r1, 27
	adds r1, r6, r1
	ldrb r1, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r2, 1
	add r2, r10
	lsls r0, r1, 10
	lsls r1, r3, 5
	orrs r0, r1
	orrs r0, r4
	strh r0, [r2]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0xF
	bls _0807CFF2
_0807D032:
	mov r4, r12
	lsls r0, r4, 16
	lsrs r4, r0, 16
	cmp r0, r8
	bcs _0807D03E
	b _0807CEFE
_0807D03E:
	b _0807D1A2
	.align 2, 0
_0807D040: .4byte gPlttBufferFaded
_0807D044: .4byte gPlttBufferUnfaded
_0807D048:
	cmp r0, 0
	blt _0807D04E
	b _0807D190
_0807D04E:
	mvns r0, r0
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	lsls r5, r3, 4
	adds r0, r1, r3
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	adds r4, r3, 0
	cmp r4, r9
	bcc _0807D068
	b _0807D1A2
_0807D068:
	ldr r0, _0807D098 @ =gUnknown_030006DC
	ldr r0, [r0]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807D0A4
	lsls r1, r5, 1
	ldr r0, _0807D09C @ =gPlttBufferUnfaded
	adds r0, r1, r0
	ldr r2, _0807D0A0 @ =gPlttBufferFaded
	adds r1, r2
	movs r2, 0x8
	bl CpuFastSet
	adds r0, r5, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r5, r0, 16
	mov r0, r9
	lsls r0, 16
	mov r8, r0
	adds r4, 0x1
	mov r12, r4
	b _0807D174
	.align 2, 0
_0807D098: .4byte gUnknown_030006DC
_0807D09C: .4byte gPlttBufferUnfaded
_0807D0A0: .4byte gPlttBufferFaded
_0807D0A4:
	cmp r4, 0x10
	beq _0807D0AC
	cmp r4, 0x1B
	bls _0807D11C
_0807D0AC:
	movs r7, 0
	mov r1, r9
	lsls r1, 16
	mov r8, r1
	adds r4, 0x1
	mov r12, r4
	ldr r2, _0807D10C @ =0x02000000
	mov r10, r2
	ldr r3, [sp]
	lsls r0, r3, 24
	asrs r6, r0, 11
_0807D0C2:
	lsls r1, r5, 1
	ldr r4, _0807D110 @ =gPlttBufferUnfaded
	adds r0, r1, r4
	ldrh r0, [r0]
	lsls r4, r0, 16
	ldr r2, _0807D114 @ =0x00002d9f
	cmp r0, r2
	beq _0807D0FA
	ldr r3, _0807D118 @ =gPlttBufferFaded
	adds r3, r1, r3
	lsrs r0, r4, 17
	movs r1, 0xF
	ands r0, r1
	lsrs r1, r4, 18
	movs r2, 0xF0
	ands r1, r2
	orrs r0, r1
	lsrs r1, r4, 19
	movs r4, 0xF0
	lsls r4, 4
	adds r2, r4, 0
	ands r1, r2
	orrs r0, r1
	lsls r0, 1
	adds r0, r6
	add r0, r10
	ldrh r0, [r0]
	strh r0, [r3]
_0807D0FA:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0xF
	bls _0807D0C2
	b _0807D174
	.align 2, 0
_0807D10C: .4byte 0x02000000
_0807D110: .4byte gPlttBufferUnfaded
_0807D114: .4byte 0x00002d9f
_0807D118: .4byte gPlttBufferFaded
_0807D11C:
	movs r7, 0
	ldr r1, [sp]
	lsls r0, r1, 24
	mov r2, r9
	lsls r2, 16
	mov r8, r2
	adds r4, 0x1
	mov r12, r4
	ldr r3, _0807D184 @ =0x02000000
	mov r10, r3
	asrs r6, r0, 11
_0807D132:
	lsls r0, r5, 1
	ldr r1, _0807D188 @ =gPlttBufferFaded
	adds r4, r0, r1
	ldr r2, _0807D18C @ =gPlttBufferUnfaded
	adds r0, r2
	ldrh r3, [r0]
	lsls r3, 16
	lsrs r0, r3, 17
	movs r1, 0xF
	ands r0, r1
	lsrs r1, r3, 18
	movs r2, 0xF0
	ands r1, r2
	orrs r0, r1
	lsrs r3, 19
	movs r2, 0xF0
	lsls r2, 4
	adds r1, r2, 0
	ands r3, r1
	orrs r0, r3
	lsls r0, 1
	adds r0, r6
	add r0, r10
	ldrh r0, [r0]
	strh r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0xF
	bls _0807D132
_0807D174:
	mov r3, r12
	lsls r0, r3, 16
	lsrs r4, r0, 16
	cmp r0, r8
	bcs _0807D180
	b _0807D068
_0807D180:
	b _0807D1A2
	.align 2, 0
_0807D184: .4byte 0x02000000
_0807D188: .4byte gPlttBufferFaded
_0807D18C: .4byte gPlttBufferUnfaded
_0807D190:
	lsls r1, r4, 5
	ldr r0, _0807D1B4 @ =gPlttBufferUnfaded
	adds r0, r1, r0
	ldr r2, _0807D1B8 @ =gPlttBufferFaded
	adds r1, r2
	mov r4, r9
	lsls r2, r4, 3
	bl CpuFastSet
_0807D1A2:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D1B4: .4byte gPlttBufferUnfaded
_0807D1B8: .4byte gPlttBufferFaded
	thumb_func_end sub_807CEBC

	thumb_func_start sub_807D1BC
sub_807D1BC: @ 807D1BC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	ldr r4, [sp, 0x34]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	mov r1, sp
	strh r4, [r1]
	ldr r1, [sp]
	lsls r3, r1, 27
	lsrs r3, 27
	str r3, [sp, 0x4]
	lsls r3, r1, 22
	lsrs r3, 27
	str r3, [sp, 0x8]
	lsls r1, 17
	lsrs r1, 27
	str r1, [sp, 0xC]
	lsls r6, r0, 4
	mov r3, r10
	adds r1, r3, r0
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r2, r1
	lsrs r2, 24
	adds r4, r0, 0
	cmp r4, r10
	bcs _0807D2E8
	lsls r0, r2, 24
	asrs r0, 19
	str r0, [sp, 0x10]
_0807D214:
	ldr r0, _0807D244 @ =gUnknown_030006DC
	ldr r0, [r0]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807D248
	mov r0, sp
	ldrh r3, [r0]
	adds r0, r6, 0
	movs r1, 0x10
	mov r2, r8
	bl BlendPalette
	adds r0, r6, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r6, r0, 16
	mov r3, r10
	lsls r3, 16
	mov r9, r3
	adds r4, 0x1
	mov r12, r4
	b _0807D2DE
	.align 2, 0
_0807D244: .4byte gUnknown_030006DC
_0807D248:
	cmp r0, 0x1
	bne _0807D258
	ldr r0, _0807D254 @ =gUnknown_0202F9E8
	ldr r1, [sp, 0x10]
	adds r5, r1, r0
	b _0807D25E
	.align 2, 0
_0807D254: .4byte gUnknown_0202F9E8
_0807D258:
	ldr r0, _0807D2F8 @ =gUnknown_0202FC48
	ldr r3, [sp, 0x10]
	adds r5, r3, r0
_0807D25E:
	movs r7, 0
	mov r0, r10
	lsls r0, 16
	mov r9, r0
	adds r4, 0x1
	mov r12, r4
_0807D26A:
	adds r4, r6, 0
	lsls r0, r4, 1
	ldr r1, _0807D2FC @ =gPlttBufferUnfaded
	adds r0, r1
	ldr r1, [r0]
	lsls r0, r1, 27
	lsrs r0, 27
	adds r0, r5, r0
	ldrb r3, [r0]
	lsls r0, r1, 22
	lsrs r0, 27
	adds r0, r5, r0
	ldrb r2, [r0]
	lsls r1, 17
	lsrs r1, 27
	adds r1, r5, r1
	ldrb r1, [r1]
	ldr r6, [sp, 0x4]
	subs r0, r6, r3
	mov r6, r8
	muls r6, r0
	adds r0, r6, 0
	asrs r0, 4
	adds r3, r0
	lsls r3, 24
	lsrs r3, 24
	ldr r6, [sp, 0x8]
	subs r0, r6, r2
	mov r6, r8
	muls r6, r0
	adds r0, r6, 0
	asrs r0, 4
	adds r2, r0
	lsls r2, 24
	ldr r6, [sp, 0xC]
	subs r0, r6, r1
	mov r6, r8
	muls r6, r0
	adds r0, r6, 0
	asrs r0, 4
	adds r1, r0
	lsls r1, 24
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r4, 1
	ldr r0, _0807D300 @ =gPlttBufferFaded
	adds r4, r0
	lsrs r1, 14
	lsrs r2, 19
	orrs r1, r2
	orrs r1, r3
	strh r1, [r4]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0xF
	bls _0807D26A
_0807D2DE:
	mov r1, r12
	lsls r0, r1, 16
	lsrs r4, r0, 16
	cmp r0, r9
	bcc _0807D214
_0807D2E8:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D2F8: .4byte gUnknown_0202FC48
_0807D2FC: .4byte gPlttBufferUnfaded
_0807D300: .4byte gPlttBufferFaded
	thumb_func_end sub_807D1BC

	thumb_func_start sub_807D304
sub_807D304: @ 807D304
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r1, 24
	lsrs r6, r1, 24
	mov r1, sp
	strh r2, [r1]
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	eors r0, r1
	lsrs r0, 24
	str r0, [sp, 0x4]
	ldr r0, [sp]
	lsls r1, r0, 27
	lsrs r1, 27
	str r1, [sp, 0x8]
	lsls r1, r0, 22
	lsrs r1, 27
	str r1, [sp, 0xC]
	lsls r0, 17
	lsrs r0, 27
	mov r10, r0
	movs r5, 0
	movs r4, 0
_0807D33C:
	ldr r0, _0807D364 @ =gUnknown_030006DC
	ldr r0, [r0]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807D368
	mov r0, sp
	ldrh r3, [r0]
	adds r0, r5, 0
	movs r1, 0x10
	adds r2, r6, 0
	bl BlendPalette
	adds r0, r5, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r5, r0, 16
	adds r4, 0x1
	mov r8, r4
	b _0807D3FE
	.align 2, 0
_0807D364: .4byte gUnknown_030006DC
_0807D368:
	movs r0, 0
	mov r12, r0
	ldr r1, [sp, 0x4]
	lsls r0, r1, 24
	adds r4, 0x1
	mov r8, r4
	movs r7, 0x1E
	asrs r0, 11
	mov r9, r0
_0807D37A:
	adds r4, r5, 0
	lsls r0, r4, 1
	ldr r5, _0807D418 @ =gPlttBufferUnfaded
	adds r0, r5
	ldr r0, [r0]
	lsls r2, r0, 27
	lsrs r2, 27
	lsls r1, r0, 22
	lsrs r1, 27
	lsls r0, 17
	lsrs r0, 27
	ands r0, r7
	lsls r0, 7
	ands r1, r7
	lsls r1, 3
	orrs r0, r1
	ands r2, r7
	lsls r0, 1
	orrs r0, r2
	add r0, r9
	ldr r1, _0807D41C @ =0x02000000
	adds r0, r1
	ldr r1, [r0]
	lsls r3, r1, 27
	lsrs r3, 27
	lsls r2, r1, 22
	lsrs r2, 27
	lsls r1, 17
	lsrs r1, 27
	ldr r5, [sp, 0x8]
	subs r0, r5, r3
	muls r0, r6
	asrs r0, 4
	adds r3, r0
	lsls r3, 24
	lsrs r3, 24
	ldr r5, [sp, 0xC]
	subs r0, r5, r2
	muls r0, r6
	asrs r0, 4
	adds r2, r0
	lsls r2, 24
	mov r5, r10
	subs r0, r5, r1
	muls r0, r6
	asrs r0, 4
	adds r1, r0
	lsls r1, 24
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r4, 1
	ldr r0, _0807D420 @ =gPlttBufferFaded
	adds r4, r0
	lsrs r1, 14
	lsrs r2, 19
	orrs r1, r2
	orrs r1, r3
	strh r1, [r4]
	mov r0, r12
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r12, r0
	cmp r0, 0xF
	bls _0807D37A
_0807D3FE:
	mov r1, r8
	lsls r0, r1, 16
	lsrs r4, r0, 16
	cmp r4, 0x1F
	bls _0807D33C
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D418: .4byte gPlttBufferUnfaded
_0807D41C: .4byte 0x02000000
_0807D420: .4byte gPlttBufferFaded
	thumb_func_end sub_807D304

	thumb_func_start sub_807D424
sub_807D424: @ 807D424
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	adds r3, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r3, 16
	lsrs r3, 16
	mov r0, sp
	strh r3, [r0]
	movs r1, 0x80
	lsls r1, 1
	movs r0, 0
	adds r2, r7, 0
	bl BlendPalette
	ldr r0, [sp]
	lsls r1, r0, 27
	lsrs r1, 27
	str r1, [sp, 0x4]
	lsls r1, r0, 22
	lsrs r1, 27
	str r1, [sp, 0x8]
	lsls r0, 17
	lsrs r0, 27
	mov r10, r0
	movs r4, 0x10
_0807D460:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_807D574
	lsls r0, 24
	cmp r0, 0
	beq _0807D510
	adds r0, r4, 0x1
	lsls r1, r0, 20
	lsrs r1, 16
	mov r12, r1
	lsls r1, r4, 20
	lsrs r6, r1, 16
	mov r9, r0
	cmp r6, r12
	bcs _0807D524
	movs r0, 0x1C
	mov r8, r0
_0807D484:
	lsls r5, r6, 1
	ldr r0, _0807D508 @ =gPlttBufferUnfaded
	adds r0, r5, r0
	ldr r2, [r0]
	lsls r4, r2, 27
	lsrs r4, 27
	lsls r3, r2, 22
	lsrs r3, 27
	lsls r2, 17
	lsrs r2, 27
	mov r0, r8
	subs r1, r0, r4
	lsls r0, r1, 1
	adds r0, r1
	asrs r0, 2
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	movs r1, 0x1F
	subs r1, r3
	lsls r0, r1, 1
	adds r0, r1
	asrs r0, 2
	adds r3, r0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r8
	subs r1, r0, r2
	lsls r0, r1, 1
	adds r0, r1
	asrs r0, 2
	adds r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldr r1, [sp, 0x4]
	subs r0, r1, r4
	muls r0, r7
	asrs r0, 4
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, [sp, 0x8]
	subs r0, r1, r3
	muls r0, r7
	asrs r0, 4
	adds r3, r0
	lsls r3, 24
	mov r1, r10
	subs r0, r1, r2
	muls r0, r7
	asrs r0, 4
	adds r2, r0
	lsls r2, 24
	ldr r0, _0807D50C @ =gPlttBufferFaded
	adds r5, r0
	lsrs r2, 14
	lsrs r3, 19
	orrs r2, r3
	orrs r2, r4
	strh r2, [r5]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, r12
	bcc _0807D484
	b _0807D524
	.align 2, 0
_0807D508: .4byte gPlttBufferUnfaded
_0807D50C: .4byte gPlttBufferFaded
_0807D510:
	lsls r0, r4, 20
	lsrs r0, 16
	mov r1, sp
	ldrh r3, [r1]
	movs r1, 0x10
	adds r2, r7, 0
	bl BlendPalette
	adds r4, 0x1
	mov r9, r4
_0807D524:
	mov r1, r9
	lsls r0, r1, 16
	lsrs r4, r0, 16
	cmp r4, 0x1F
	bls _0807D460
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_807D424

	thumb_func_start sub_807D540
sub_807D540: @ 807D540
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r3, _0807D568 @ =gUnknown_0202F7E8
	ldr r0, _0807D56C @ =0x000006fa
	adds r1, r3, r0
	ldrb r0, [r1]
	cmp r0, 0x5
	bhi _0807D562
	ldr r4, _0807D570 @ =0x000006f4
	adds r0, r3, r4
	ldrb r3, [r1]
	adds r0, r3
	strb r2, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0807D562:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D568: .4byte gUnknown_0202F7E8
_0807D56C: .4byte 0x000006fa
_0807D570: .4byte 0x000006f4
	thumb_func_end sub_807D540

	thumb_func_start sub_807D574
sub_807D574: @ 807D574
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r1, 0
	ldr r2, _0807D59C @ =gUnknown_0202F7E8
	ldr r4, _0807D5A0 @ =0x000006fa
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r1, r0
	bcs _0807D5B2
	ldr r5, _0807D5A4 @ =0x000006f4
	adds r4, r2, r5
	adds r2, r0, 0
_0807D58E:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _0807D5A8
	movs r0, 0x1
	b _0807D5B4
	.align 2, 0
_0807D59C: .4byte gUnknown_0202F7E8
_0807D5A0: .4byte 0x000006fa
_0807D5A4: .4byte 0x000006f4
_0807D5A8:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r2
	bcc _0807D58E
_0807D5B2:
	movs r0, 0
_0807D5B4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_807D574

	thumb_func_start sub_807D5BC
sub_807D5BC: @ 807D5BC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r5, _0807D5E8 @ =gUnknown_0202F7E8
	ldr r1, _0807D5EC @ =0x000006c6
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _0807D5E2
	lsls r2, r4, 24
	asrs r2, 24
	movs r0, 0
	movs r1, 0x20
	bl sub_807CEBC
	movs r1, 0xD8
	lsls r1, 3
	adds r0, r5, r1
	strb r4, [r0]
_0807D5E2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D5E8: .4byte gUnknown_0202F7E8
_0807D5EC: .4byte 0x000006c6
	thumb_func_end sub_807D5BC

	thumb_func_start sub_807D5F0
sub_807D5F0: @ 807D5F0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r3, _0807D638 @ =gUnknown_0202F7E8
	ldr r0, _0807D63C @ =0x000006c6
	adds r2, r3, r0
	ldrb r0, [r2]
	cmp r0, 0x3
	bne _0807D630
	movs r1, 0
	strb r1, [r2]
	movs r2, 0xD8
	lsls r2, 3
	adds r0, r3, r2
	strb r4, [r0]
	adds r2, 0x1
	adds r0, r3, r2
	strb r5, [r0]
	adds r2, 0x2
	adds r0, r3, r2
	strb r1, [r0]
	ldr r1, _0807D640 @ =0x000006c2
	adds r0, r3, r1
	strb r6, [r0]
	lsls r0, r4, 24
	asrs r0, 24
	bl sub_807D5BC
_0807D630:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807D638: .4byte gUnknown_0202F7E8
_0807D63C: .4byte 0x000006c6
_0807D640: .4byte 0x000006c2
	thumb_func_end sub_807D5F0

	thumb_func_start fade_screen
fade_screen: @ 807D644
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	cmp r0, 0x1
	beq _0807D67C
	cmp r0, 0x1
	bgt _0807D660
	cmp r0, 0
	beq _0807D66A
	b _0807D758
_0807D660:
	cmp r2, 0x2
	beq _0807D670
	cmp r2, 0x3
	beq _0807D680
	b _0807D758
_0807D66A:
	movs r4, 0
	movs r1, 0
	b _0807D684
_0807D670:
	ldr r4, _0807D678 @ =0x0000ffff
	movs r1, 0
	b _0807D684
	.align 2, 0
_0807D678: .4byte 0x0000ffff
_0807D67C:
	movs r4, 0
	b _0807D682
_0807D680:
	ldr r4, _0807D6A4 @ =0x0000ffff
_0807D682:
	movs r1, 0x1
_0807D684:
	ldr r0, _0807D6A8 @ =gUnknown_0202F7E8
	movs r2, 0xDA
	lsls r2, 3
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x3
	blt _0807D6AC
	cmp r0, 0x6
	ble _0807D69E
	cmp r0, 0xD
	bgt _0807D6AC
	cmp r0, 0xB
	blt _0807D6AC
_0807D69E:
	movs r2, 0x1
	b _0807D6AE
	.align 2, 0
_0807D6A4: .4byte 0x0000ffff
_0807D6A8: .4byte gUnknown_0202F7E8
_0807D6AC:
	movs r2, 0
_0807D6AE:
	cmp r1, 0
	beq _0807D6F0
	cmp r2, 0
	beq _0807D6C2
	ldr r0, _0807D6E0 @ =gPlttBufferFaded
	ldr r1, _0807D6E4 @ =gPlttBufferUnfaded
	movs r2, 0x80
	lsls r2, 1
	bl CpuFastSet
_0807D6C2:
	movs r0, 0x1
	negs r0, r0
	lsls r1, r5, 24
	asrs r1, 24
	str r4, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0807D6E8 @ =gUnknown_0202F7E8
	ldr r3, _0807D6EC @ =0x000006c6
	adds r0, r3
	movs r1, 0x2
	strb r1, [r0]
	b _0807D758
	.align 2, 0
_0807D6E0: .4byte gPlttBufferFaded
_0807D6E4: .4byte gPlttBufferUnfaded
_0807D6E8: .4byte gUnknown_0202F7E8
_0807D6EC: .4byte 0x000006c6
_0807D6F0:
	ldr r1, _0807D708 @ =gUnknown_0202F7E8
	ldr r3, _0807D70C @ =0x000006c4
	adds r0, r1, r3
	strh r4, [r0]
	cmp r2, 0
	beq _0807D714
	ldr r0, _0807D710 @ =0x000006c7
	adds r1, r0
	movs r0, 0
	strb r0, [r1]
	b _0807D726
	.align 2, 0
_0807D708: .4byte gUnknown_0202F7E8
_0807D70C: .4byte 0x000006c4
_0807D710: .4byte 0x000006c7
_0807D714:
	movs r0, 0x1
	negs r0, r0
	lsls r1, r5, 24
	asrs r1, 24
	str r4, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_0807D726:
	ldr r4, _0807D760 @ =gUnknown_0202F7E8
	ldr r1, _0807D764 @ =0x000006c6
	adds r0, r4, r1
	movs r1, 0
	movs r5, 0x1
	strb r5, [r0]
	ldr r2, _0807D768 @ =0x000006ca
	adds r0, r4, r2
	strb r5, [r0]
	ldr r3, _0807D76C @ =0x000006cb
	adds r0, r4, r3
	strb r1, [r0]
	movs r1, 0xE6
	lsls r1, 3
	adds r0, r4, r1
	ldrb r0, [r0]
	adds r2, 0x68
	adds r1, r4, r2
	ldrb r1, [r1]
	bl sub_807DB64
	movs r3, 0xD9
	lsls r3, 3
	adds r4, r3
	strb r5, [r4]
_0807D758:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D760: .4byte gUnknown_0202F7E8
_0807D764: .4byte 0x000006c6
_0807D768: .4byte 0x000006ca
_0807D76C: .4byte 0x000006cb
	thumb_func_end fade_screen

	thumb_func_start sub_807D770
sub_807D770: @ 807D770
	ldr r0, _0807D784 @ =gUnknown_0202F7E8
	ldr r1, _0807D788 @ =0x000006c6
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	bx lr
	.align 2, 0
_0807D784: .4byte gUnknown_0202F7E8
_0807D788: .4byte 0x000006c6
	thumb_func_end sub_807D770

	thumb_func_start sub_807D78C
sub_807D78C: @ 807D78C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 8
	movs r1, 0x80
	lsls r1, 13
	adds r0, r1
	lsrs r4, r0, 16
	ldr r5, _0807D7CC @ =gUnknown_0202F7E8
	ldr r2, _0807D7D0 @ =0x000006c6
	adds r0, r5, r2
	ldrb r0, [r0]
	adds r1, r5, 0
	cmp r0, 0x1
	beq _0807D7D4
	cmp r0, 0x2
	beq _0807D820
	adds r2, 0xA
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x6
	beq _0807D858
	lsls r0, r4, 24
	lsrs r0, 24
	subs r2, 0x10
	adds r1, r2
	movs r2, 0
	ldrsb r2, [r1, r2]
	movs r1, 0x1
	bl sub_807CEBC
	b _0807D868
	.align 2, 0
_0807D7CC: .4byte gUnknown_0202F7E8
_0807D7D0: .4byte 0x000006c6
_0807D7D4:
	ldr r2, _0807D814 @ =0x000006ca
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807D868
	adds r2, 0x6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x6
	bne _0807D7F0
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_807D540
_0807D7F0:
	lsls r0, r4, 20
	lsrs r4, r0, 16
	movs r2, 0
	ldr r6, _0807D818 @ =gPlttBufferFaded
	ldr r0, _0807D81C @ =0x000006c4
	adds r3, r5, r0
_0807D7FC:
	adds r0, r4, r2
	lsls r0, 1
	adds r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0xF
	bls _0807D7FC
	b _0807D868
	.align 2, 0
_0807D814: .4byte 0x000006ca
_0807D818: .4byte gPlttBufferFaded
_0807D81C: .4byte 0x000006c4
_0807D820:
	lsls r0, r4, 20
	lsrs r4, r0, 16
	lsls r1, r4, 1
	ldr r0, _0807D84C @ =gPlttBufferFaded
	adds r0, r1, r0
	ldr r2, _0807D850 @ =gPlttBufferUnfaded
	adds r1, r2
	movs r2, 0x8
	bl CpuFastSet
	ldr r0, _0807D854 @ =gPaletteFade
	ldrh r2, [r0, 0x4]
	lsls r2, 21
	lsrs r2, 27
	ldrh r3, [r0, 0x6]
	lsls r3, 17
	lsrs r3, 17
	adds r0, r4, 0
	movs r1, 0x10
	bl BlendPalette
	b _0807D868
	.align 2, 0
_0807D84C: .4byte gPlttBufferFaded
_0807D850: .4byte gPlttBufferUnfaded
_0807D854: .4byte gPaletteFade
_0807D858:
	lsls r0, r4, 20
	lsrs r4, r0, 16
	ldr r3, _0807D870 @ =0x000073fc
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0xC
	bl BlendPalette
_0807D868:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807D870: .4byte 0x000073fc
	thumb_func_end sub_807D78C

	thumb_func_start sub_807D874
sub_807D874: @ 807D874
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0807D890 @ =gUnknown_0202F7E8
	movs r2, 0xD8
	lsls r2, 3
	adds r1, r2
	movs r2, 0
	ldrsb r2, [r1, r2]
	movs r1, 0x1
	bl sub_807CEBC
	pop {r0}
	bx r0
	.align 2, 0
_0807D890: .4byte gUnknown_0202F7E8
	thumb_func_end sub_807D874

	thumb_func_start unref_sub_807D894
unref_sub_807D894: @ 807D894
	push {lr}
	ldr r1, _0807D8A8 @ =gUnknown_0202F7E8
	ldr r2, _0807D8AC @ =0x000006c6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0807D8B0
	movs r0, 0
	b _0807D8B6
	.align 2, 0
_0807D8A8: .4byte gUnknown_0202F7E8
_0807D8AC: .4byte 0x000006c6
_0807D8B0:
	ldr r2, _0807D8BC @ =0x000006ca
	adds r0, r1, r2
	ldrb r0, [r0]
_0807D8B6:
	pop {r1}
	bx r1
	.align 2, 0
_0807D8BC: .4byte 0x000006ca
	thumb_func_end unref_sub_807D894

	thumb_func_start sub_807D8C0
sub_807D8C0: @ 807D8C0
	push {r4,lr}
	ldr r4, _0807D8E8 @ =gUnknown_0202F7E8
	ldr r1, _0807D8EC @ =0x000006d4
	adds r4, r1
	ldrb r1, [r4]
	lsls r1, 20
	movs r2, 0x80
	lsls r2, 17
	adds r1, r2
	lsrs r1, 16
	movs r2, 0x20
	bl LoadPalette
	ldrb r0, [r4]
	bl sub_807D78C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D8E8: .4byte gUnknown_0202F7E8
_0807D8EC: .4byte 0x000006d4
	thumb_func_end sub_807D8C0

	thumb_func_start sub_807D8F0
sub_807D8F0: @ 807D8F0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	mov r8, r1
	ldrb r4, [r7]
	cmp r4, 0x6
	bhi _0807D99A
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0807D94C @ =gUnknown_08396FA8
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r6, r4, 13
	ldr r5, _0807D950 @ =0x02000000
	adds r1, r6, r5
	bl LZ77UnCompWram
	subs r0, r4, 0x1
	cmp r4, 0
	bne _0807D95C
	ldr r0, _0807D954 @ =0x00000421
	strh r0, [r5]
	movs r2, 0x1
	adds r4, r5, 0
	movs r3, 0
	ldr r5, _0807D958 @ =0x00000fff
_0807D92A:
	lsls r1, r2, 1
	adds r1, r3
	adds r1, r4
	subs r0, r2, 0x1
	lsls r0, 1
	adds r0, r3
	adds r0, r4
	ldrh r0, [r0]
	ldrh r6, [r1]
	adds r0, r6
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r5
	bls _0807D92A
	b _0807D984
	.align 2, 0
_0807D94C: .4byte gUnknown_08396FA8
_0807D950: .4byte 0x02000000
_0807D954: .4byte 0x00000421
_0807D958: .4byte 0x00000fff
_0807D95C:
	movs r2, 0
	adds r3, r5, 0
	adds r5, r6, 0
	lsls r4, r0, 13
	ldr r0, _0807D9A4 @ =0x00000fff
	mov r12, r0
_0807D968:
	lsls r0, r2, 1
	adds r1, r0, r5
	adds r1, r3
	adds r0, r4
	adds r0, r3
	ldrh r0, [r0]
	ldrh r6, [r1]
	adds r0, r6
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r12
	bls _0807D968
_0807D984:
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x7
	bne _0807D99A
	movs r0, 0x20
	strb r0, [r7]
	mov r1, r8
	strb r0, [r1]
_0807D99A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D9A4: .4byte 0x00000fff
	thumb_func_end sub_807D8F0

	thumb_func_start sub_807D9A8
sub_807D9A8: @ 807D9A8
	ldr r0, _0807D9BC @ =gUnknown_0202F7E8
	ldr r2, _0807D9C0 @ =0x0000074d
	adds r1, r0, r2
	movs r2, 0x1
	strb r2, [r1]
	ldr r1, _0807D9C4 @ =0x0000074e
	adds r0, r1
	strb r2, [r0]
	bx lr
	.align 2, 0
_0807D9BC: .4byte gUnknown_0202F7E8
_0807D9C0: .4byte 0x0000074d
_0807D9C4: .4byte 0x0000074e
	thumb_func_end sub_807D9A8

	thumb_func_start sub_807D9C8
sub_807D9C8: @ 807D9C8
	push {r4,lr}
	ldr r1, _0807D9F0 @ =gUnknown_0202F7E8
	ldr r0, _0807D9F4 @ =0x0000074d
	adds r4, r1, r0
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0x1F
	bgt _0807D9FC
	ldr r0, _0807D9F8 @ =0x0000074e
	adds r1, r0
	adds r0, r4, 0
	bl sub_807D8F0
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0x1F
	bgt _0807D9FC
	movs r0, 0x1
	b _0807D9FE
	.align 2, 0
_0807D9F0: .4byte gUnknown_0202F7E8
_0807D9F4: .4byte 0x0000074d
_0807D9F8: .4byte 0x0000074e
_0807D9FC:
	movs r0, 0
_0807D9FE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807D9C8

	thumb_func_start sub_807DA04
sub_807DA04: @ 807DA04
	push {lr}
	lsls r0, 24
	asrs r0, 24
	mvns r0, r0
	bl sub_807D5BC
	pop {r0}
	bx r0
	thumb_func_end sub_807DA04

	thumb_func_start sub_807DA14
sub_807DA14: @ 807DA14
	ldr r1, _0807DA3C @ =gUnknown_0202F7E8
	ldr r2, _0807DA40 @ =0x0000073c
	adds r0, r1, r2
	movs r2, 0
	strh r2, [r0]
	movs r3, 0xE8
	lsls r3, 3
	adds r0, r1, r3
	strh r2, [r0]
	adds r3, 0x2
	adds r0, r1, r3
	strh r2, [r0]
	ldr r0, _0807DA44 @ =0x0000073e
	adds r1, r0
	strh r2, [r1]
	ldr r1, _0807DA48 @ =gUnknown_0202FF58
	movs r0, 0x5
	strh r0, [r1]
	bx lr
	.align 2, 0
_0807DA3C: .4byte gUnknown_0202F7E8
_0807DA40: .4byte 0x0000073c
_0807DA44: .4byte 0x0000073e
_0807DA48: .4byte gUnknown_0202FF58
	thumb_func_end sub_807DA14

	thumb_func_start sub_807DA4C
sub_807DA4C: @ 807DA4C
	push {r4-r7,lr}
	ldr r5, _0807DA68 @ =gUnknown_0202F7E8
	ldr r0, _0807DA6C @ =0x00000742
	adds r7, r5, r0
	movs r1, 0
	ldrsh r2, [r7, r1]
	cmp r2, 0x1
	beq _0807DAC8
	cmp r2, 0x1
	bgt _0807DA70
	cmp r2, 0
	beq _0807DA76
	b _0807DB54
	.align 2, 0
_0807DA68: .4byte gUnknown_0202F7E8
_0807DA6C: .4byte 0x00000742
_0807DA70:
	cmp r2, 0x2
	beq _0807DB1C
	b _0807DB54
_0807DA76:
	movs r3, 0xE8
	lsls r3, 3
	adds r6, r5, r3
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	lsls r0, 16
	asrs r0, 16
	ldr r1, _0807DABC @ =gUnknown_0202FF58
	ldrh r1, [r1]
	cmp r0, r1
	ble _0807DB54
	strh r2, [r6]
	ldr r0, _0807DAC0 @ =0x0000073c
	adds r4, r5, r0
	ldrh r0, [r4]
	adds r1, r0, 0x1
	strh r1, [r4]
	lsls r0, 24
	asrs r0, 24
	bl sub_807DA04
	ldrh r1, [r4]
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0x5
	ble _0807DB54
	ldr r3, _0807DAC4 @ =0x0000073e
	adds r0, r5, r3
	strh r1, [r0]
	movs r0, 0x1
	strh r0, [r7]
	movs r0, 0x3C
	strh r0, [r6]
	b _0807DB54
	.align 2, 0
_0807DABC: .4byte gUnknown_0202FF58
_0807DAC0: .4byte 0x0000073c
_0807DAC4: .4byte 0x0000073e
_0807DAC8:
	movs r0, 0xE8
	lsls r0, 3
	adds r2, r5, r0
	ldrh r0, [r2]
	adds r0, 0x3
	movs r1, 0x7F
	ands r0, r1
	strh r0, [r2]
	ldr r1, _0807DB10 @ =gSineTable
	movs r3, 0
	ldrsh r0, [r2, r3]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	subs r0, 0x1
	asrs r0, 6
	adds r0, 0x2
	ldr r2, _0807DB14 @ =0x0000073c
	adds r6, r5, r2
	adds r2, r0, 0
	strh r0, [r6]
	ldr r3, _0807DB18 @ =0x0000073e
	adds r4, r5, r3
	movs r3, 0
	ldrsh r1, [r4, r3]
	cmp r0, r1
	beq _0807DB08
	lsls r0, r2, 24
	asrs r0, 24
	bl sub_807DA04
_0807DB08:
	ldrh r0, [r6]
	strh r0, [r4]
	b _0807DB54
	.align 2, 0
_0807DB10: .4byte gSineTable
_0807DB14: .4byte 0x0000073c
_0807DB18: .4byte 0x0000073e
_0807DB1C:
	movs r0, 0xE8
	lsls r0, 3
	adds r2, r5, r0
	ldrh r0, [r2]
	adds r0, 0x1
	movs r6, 0
	strh r0, [r2]
	lsls r0, 16
	asrs r0, 16
	ldr r1, _0807DB5C @ =gUnknown_0202FF58
	ldrh r1, [r1]
	cmp r0, r1
	ble _0807DB54
	strh r6, [r2]
	ldr r1, _0807DB60 @ =0x0000073c
	adds r4, r5, r1
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r4]
	lsls r0, 24
	asrs r0, 24
	bl sub_807DA04
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0x3
	bne _0807DB54
	strh r6, [r7]
_0807DB54:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807DB5C: .4byte gUnknown_0202FF58
_0807DB60: .4byte 0x0000073c
	thumb_func_end sub_807DA4C

	thumb_func_start sub_807DB64
sub_807DB64: @ 807DB64
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0807DB98 @ =gUnknown_0202F7E8
	movs r4, 0xE6
	lsls r4, 3
	adds r2, r3, r4
	strh r0, [r2]
	adds r4, 0x2
	adds r2, r3, r4
	strh r1, [r2]
	adds r4, 0x2
	adds r2, r3, r4
	strh r0, [r2]
	ldr r2, _0807DB9C @ =0x00000736
	adds r3, r2
	strh r1, [r3]
	ldr r2, _0807DBA0 @ =REG_BLDALPHA
	lsls r1, 8
	orrs r1, r0
	strh r1, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807DB98: .4byte gUnknown_0202F7E8
_0807DB9C: .4byte 0x00000736
_0807DBA0: .4byte REG_BLDALPHA
	thumb_func_end sub_807DB64

	thumb_func_start sub_807DBA4
sub_807DBA4: @ 807DBA4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0807DBD8 @ =gUnknown_0202F7E8
	ldr r5, _0807DBDC @ =0x00000734
	adds r4, r3, r5
	movs r5, 0
	strh r0, [r4]
	ldr r4, _0807DBE0 @ =0x00000736
	adds r0, r3, r4
	strh r1, [r0]
	ldr r1, _0807DBE4 @ =0x0000073a
	adds r0, r3, r1
	strb r2, [r0]
	adds r4, 0x3
	adds r0, r3, r4
	strb r5, [r0]
	movs r0, 0xE7
	lsls r0, 3
	adds r3, r0
	strb r5, [r3]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DBD8: .4byte gUnknown_0202F7E8
_0807DBDC: .4byte 0x00000734
_0807DBE0: .4byte 0x00000736
_0807DBE4: .4byte 0x0000073a
	thumb_func_end sub_807DBA4

	thumb_func_start sub_807DBE8
sub_807DBE8: @ 807DBE8
	push {r4-r6,lr}
	ldr r0, _0807DC40 @ =gUnknown_0202F7E8
	movs r1, 0xE6
	lsls r1, 3
	adds r3, r0, r1
	ldr r2, [r3]
	ldr r6, _0807DC44 @ =0x00000734
	adds r5, r0, r6
	ldr r1, [r5]
	adds r4, r0, 0
	cmp r2, r1
	beq _0807DCAC
	ldr r0, _0807DC48 @ =0x00000739
	adds r2, r4, r0
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	ldr r6, _0807DC4C @ =0x0000073a
	adds r1, r4, r6
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bls _0807DC78
	movs r0, 0
	strb r0, [r2]
	movs r0, 0xE7
	lsls r0, 3
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0807DC50
	ldrh r1, [r3]
	adds r2, r1, 0
	ldrh r0, [r5]
	cmp r2, r0
	bcs _0807DC70
	adds r0, r1, 0x1
	b _0807DC76
	.align 2, 0
_0807DC40: .4byte gUnknown_0202F7E8
_0807DC44: .4byte 0x00000734
_0807DC48: .4byte 0x00000739
_0807DC4C: .4byte 0x0000073a
_0807DC50:
	ldr r1, _0807DC68 @ =0x00000732
	adds r3, r4, r1
	ldr r2, _0807DC6C @ =0x00000736
	adds r0, r4, r2
	ldrh r1, [r3]
	adds r2, r1, 0
	ldrh r0, [r0]
	cmp r2, r0
	bcs _0807DC70
	adds r0, r1, 0x1
	b _0807DC76
	.align 2, 0
_0807DC68: .4byte 0x00000732
_0807DC6C: .4byte 0x00000736
_0807DC70:
	cmp r2, r0
	bls _0807DC78
	subs r0, r1, 0x1
_0807DC76:
	strh r0, [r3]
_0807DC78:
	ldr r3, _0807DCA0 @ =REG_BLDALPHA
	ldr r6, _0807DCA4 @ =0x00000732
	adds r0, r4, r6
	ldrh r0, [r0]
	lsls r0, 8
	movs r1, 0xE6
	lsls r1, 3
	adds r2, r4, r1
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r3]
	ldr r1, [r2]
	ldr r2, _0807DCA8 @ =0x00000734
	adds r0, r4, r2
	ldr r0, [r0]
	cmp r1, r0
	beq _0807DCAC
	movs r0, 0
	b _0807DCAE
	.align 2, 0
_0807DCA0: .4byte REG_BLDALPHA
_0807DCA4: .4byte 0x00000732
_0807DCA8: .4byte 0x00000734
_0807DCAC:
	movs r0, 0x1
_0807DCAE:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_807DBE8

	thumb_func_start unref_sub_807DCB4
unref_sub_807DCB4: @ 807DCB4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x9
	bhi _0807DD46
	lsls r0, 2
	ldr r1, _0807DCCC @ =_0807DCD0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807DCCC: .4byte _0807DCD0
	.align 2, 0
_0807DCD0:
	.4byte _0807DCF8
	.4byte _0807DD00
	.4byte _0807DD08
	.4byte _0807DD10
	.4byte _0807DD18
	.4byte _0807DD20
	.4byte _0807DD28
	.4byte _0807DD30
	.4byte _0807DD38
	.4byte _0807DD40
_0807DCF8:
	movs r0, 0x1
	bl SetWeather
	b _0807DD46
_0807DD00:
	movs r0, 0x2
	bl SetWeather
	b _0807DD46
_0807DD08:
	movs r0, 0x3
	bl SetWeather
	b _0807DD46
_0807DD10:
	movs r0, 0x4
	bl SetWeather
	b _0807DD46
_0807DD18:
	movs r0, 0x5
	bl SetWeather
	b _0807DD46
_0807DD20:
	movs r0, 0x6
	bl SetWeather
	b _0807DD46
_0807DD28:
	movs r0, 0x9
	bl SetWeather
	b _0807DD46
_0807DD30:
	movs r0, 0x7
	bl SetWeather
	b _0807DD46
_0807DD38:
	movs r0, 0x8
	bl SetWeather
	b _0807DD46
_0807DD40:
	movs r0, 0xB
	bl SetWeather
_0807DD46:
	pop {r0}
	bx r0
	thumb_func_end unref_sub_807DCB4

	thumb_func_start weather_get_current
weather_get_current: @ 807DD4C
	ldr r0, _0807DD58 @ =gUnknown_0202F7E8
	movs r1, 0xDA
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0807DD58: .4byte gUnknown_0202F7E8
	thumb_func_end weather_get_current

	thumb_func_start sub_807DD5C
sub_807DD5C: @ 807DD5C
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r1, _0807DD7C @ =gUnknown_0202F7E8
	ldr r3, _0807DD80 @ =0x000006c6
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _0807DDAE
	cmp r2, 0x53
	beq _0807DD94
	cmp r2, 0x53
	bgt _0807DD84
	cmp r2, 0x51
	beq _0807DDA0
	b _0807DDAE
	.align 2, 0
_0807DD7C: .4byte gUnknown_0202F7E8
_0807DD80: .4byte 0x000006c6
_0807DD84:
	cmp r2, 0x55
	bne _0807DDAE
	ldr r0, _0807DD90 @ =0x000006dd
	adds r1, r0
	movs r0, 0
	b _0807DDA6
	.align 2, 0
_0807DD90: .4byte 0x000006dd
_0807DD94:
	ldr r3, _0807DD9C @ =0x000006dd
	adds r1, r3
	movs r0, 0x1
	b _0807DDA6
	.align 2, 0
_0807DD9C: .4byte 0x000006dd
_0807DDA0:
	ldr r0, _0807DDB4 @ =0x000006dd
	adds r1, r0
	movs r0, 0x2
_0807DDA6:
	strb r0, [r1]
	adds r0, r2, 0
	bl PlaySE
_0807DDAE:
	pop {r0}
	bx r0
	.align 2, 0
_0807DDB4: .4byte 0x000006dd
	thumb_func_end sub_807DD5C

	thumb_func_start PlayRainSoundEffect
PlayRainSoundEffect: @ 807DDB8
	push {lr}
	bl IsSpecialSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _0807DDF6
	ldr r0, _0807DDE0 @ =gUnknown_0202F7E8
	ldr r1, _0807DDE4 @ =0x000006dd
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0807DDE8
	cmp r0, 0x1
	bgt _0807DDF0
	cmp r0, 0
	bne _0807DDF0
	movs r0, 0x56
	bl PlaySE
	b _0807DDF6
	.align 2, 0
_0807DDE0: .4byte gUnknown_0202F7E8
_0807DDE4: .4byte 0x000006dd
_0807DDE8:
	movs r0, 0x54
	bl PlaySE
	b _0807DDF6
_0807DDF0:
	movs r0, 0x52
	bl PlaySE
_0807DDF6:
	pop {r0}
	bx r0
	thumb_func_end PlayRainSoundEffect

	thumb_func_start sub_807DDFC
sub_807DDFC: @ 807DDFC
	ldr r0, _0807DE08 @ =gUnknown_0202F7E8
	ldr r1, _0807DE0C @ =0x000006d3
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0807DE08: .4byte gUnknown_0202F7E8
_0807DE0C: .4byte 0x000006d3
	thumb_func_end sub_807DDFC

	thumb_func_start sub_807DE10
sub_807DE10: @ 807DE10
	ldr r0, _0807DE1C @ =gUnknown_0202F7E8
	ldr r1, _0807DE20 @ =0x000006c6
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	bx lr
	.align 2, 0
_0807DE1C: .4byte gUnknown_0202F7E8
_0807DE20: .4byte 0x000006c6
	thumb_func_end sub_807DE10

	thumb_func_start unref_sub_807DE24
unref_sub_807DE24: @ 807DE24
	ldr r0, _0807DE30 @ =gUnknown_0202F7E8
	ldr r1, _0807DE34 @ =0x000006c6
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0]
	bx lr
	.align 2, 0
_0807DE30: .4byte gUnknown_0202F7E8
_0807DE34: .4byte 0x000006c6
	thumb_func_end unref_sub_807DE24

	thumb_func_start sub_807DE38
sub_807DE38: @ 807DE38
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0807DE5C @ =gUnknown_083970C8
	ldr r5, _0807DE60 @ =gUnknown_0202FF38
	adds r1, r5, 0
	movs r2, 0x10
	bl CpuSet
	adds r4, r5
	movs r0, 0
	strb r0, [r4]
	ldr r0, _0807DE64 @ =gUnknown_030006DC
	str r5, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DE5C: .4byte gUnknown_083970C8
_0807DE60: .4byte gUnknown_0202FF38
_0807DE64: .4byte gUnknown_030006DC
	thumb_func_end sub_807DE38

	thumb_func_start sub_807DE68
sub_807DE68: @ 807DE68
	ldr r1, _0807DE70 @ =gUnknown_030006DC
	ldr r0, _0807DE74 @ =gUnknown_083970C8
	str r0, [r1]
	bx lr
	.align 2, 0
_0807DE70: .4byte gUnknown_030006DC
_0807DE74: .4byte gUnknown_083970C8
	thumb_func_end sub_807DE68

	thumb_func_start sub_807DE78
sub_807DE78: @ 807DE78
	push {lr}
	ldr r0, _0807DEB0 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r2, _0807DEB4 @ =0x000006c1
	adds r1, r0, r2
	movs r2, 0
	strb r2, [r1]
	ldr r1, _0807DEB8 @ =0x000006c2
	adds r3, r0, r1
	movs r1, 0x14
	strb r1, [r3]
	ldr r3, _0807DEBC @ =0x000006d2
	adds r1, r0, r3
	strb r2, [r1]
	subs r3, 0x6
	adds r1, r0, r3
	strh r2, [r1]
	ldr r1, _0807DEC0 @ =0x000006de
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807DEAC
	movs r0, 0
	movs r1, 0x10
	bl sub_807DB64
_0807DEAC:
	pop {r0}
	bx r0
	.align 2, 0
_0807DEB0: .4byte gUnknown_08396FC4
_0807DEB4: .4byte 0x000006c1
_0807DEB8: .4byte 0x000006c2
_0807DEBC: .4byte 0x000006d2
_0807DEC0: .4byte 0x000006de
	thumb_func_end sub_807DE78

	thumb_func_start sub_807DEC4
sub_807DEC4: @ 807DEC4
	push {r4,lr}
	bl sub_807DE78
	ldr r0, _0807DEEC @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807DEF0 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807DEE4
	adds r4, r1, r2
_0807DEDA:
	bl sub_807DEF4
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807DEDA
_0807DEE4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807DEEC: .4byte gUnknown_08396FC4
_0807DEF0: .4byte 0x000006d2
	thumb_func_end sub_807DEC4

	thumb_func_start sub_807DEF4
sub_807DEF4: @ 807DEF4
	push {r4,r5,lr}
	ldr r0, _0807DF10 @ =gUnknown_08396FC4
	ldr r5, [r0]
	ldr r0, _0807DF14 @ =0x000006cc
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807DF24
	cmp r0, 0x1
	bgt _0807DF18
	cmp r0, 0
	beq _0807DF1E
	b _0807DF48
	.align 2, 0
_0807DF10: .4byte gUnknown_08396FC4
_0807DF14: .4byte 0x000006cc
_0807DF18:
	cmp r0, 0x2
	beq _0807DF30
	b _0807DF48
_0807DF1E:
	bl sub_807DFD4
	b _0807DF42
_0807DF24:
	movs r0, 0xC
	movs r1, 0x8
	movs r2, 0x1
	bl sub_807DBA4
	b _0807DF42
_0807DF30:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807DF48
	ldr r0, _0807DF50 @ =0x000006d2
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
_0807DF42:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807DF48:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DF50: .4byte 0x000006d2
	thumb_func_end sub_807DEF4

	thumb_func_start sub_807DF54
sub_807DF54: @ 807DF54
	push {r4,lr}
	ldr r0, _0807DF6C @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807DF70 @ =0x000006ce
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0
	beq _0807DF74
	cmp r0, 0x1
	beq _0807DF80
	movs r0, 0
	b _0807DF96
	.align 2, 0
_0807DF6C: .4byte gUnknown_08396FC4
_0807DF70: .4byte 0x000006ce
_0807DF74:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1
	bl sub_807DBA4
	b _0807DF8E
_0807DF80:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807DF94
	bl sub_807E0A0
_0807DF8E:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807DF94:
	movs r0, 0x1
_0807DF96:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807DF54

	thumb_func_start sub_807DF9C
sub_807DF9C: @ 807DF9C
	ldr r0, _0807DFB4 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r0, _0807DFB8 @ =0x000006c1
	adds r2, r1, r0
	movs r0, 0
	strb r0, [r2]
	ldr r0, _0807DFBC @ =0x000006c2
	adds r1, r0
	movs r0, 0x14
	strb r0, [r1]
	bx lr
	.align 2, 0
_0807DFB4: .4byte gUnknown_08396FC4
_0807DFB8: .4byte 0x000006c1
_0807DFBC: .4byte 0x000006c2
	thumb_func_end sub_807DF9C

	thumb_func_start sub_807DFC0
sub_807DFC0: @ 807DFC0
	push {lr}
	bl sub_807DF9C
	pop {r0}
	bx r0
	thumb_func_end sub_807DFC0

	thumb_func_start nullsub_55
nullsub_55: @ 807DFCC
	bx lr
	thumb_func_end nullsub_55

	thumb_func_start sub_807DFD0
sub_807DFD0: @ 807DFD0
	movs r0, 0
	bx lr
	thumb_func_end sub_807DFD0

	thumb_func_start sub_807DFD4
sub_807DFD4: @ 807DFD4
	push {r4,r5,lr}
	ldr r0, _0807E04C @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807E050 @ =0x000006de
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0807E090
	ldr r0, _0807E054 @ =gUnknown_0839A9D4
	bl LoadSpriteSheet
	ldr r0, _0807E058 @ =gUnknown_08397108
	bl sub_807D8C0
	movs r5, 0
_0807DFF2:
	ldr r0, _0807E05C @ =gSpriteTemplate_839A9F0
	movs r1, 0
	movs r2, 0
	movs r3, 0xFF
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	beq _0807E068
	ldr r0, _0807E04C @ =gUnknown_08396FC4
	ldr r1, [r0]
	lsls r2, r5, 2
	movs r0, 0xFA
	lsls r0, 1
	adds r1, r0
	adds r1, r2
	lsls r4, r3, 4
	adds r4, r3
	lsls r4, 2
	ldr r0, _0807E060 @ =gSprites
	adds r4, r0
	str r4, [r1]
	ldr r0, _0807E064 @ =gUnknown_0839A9C8
	adds r2, r0
	ldrh r0, [r2]
	adds r0, 0x7
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r2, 0x2]
	adds r1, 0x7
	lsls r1, 16
	asrs r1, 16
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	bl sub_80603CC
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	b _0807E07A
	.align 2, 0
_0807E04C: .4byte gUnknown_08396FC4
_0807E050: .4byte 0x000006de
_0807E054: .4byte gUnknown_0839A9D4
_0807E058: .4byte gUnknown_08397108
_0807E05C: .4byte gSpriteTemplate_839A9F0
_0807E060: .4byte gSprites
_0807E064: .4byte gUnknown_0839A9C8
_0807E068:
	ldr r0, _0807E098 @ =gUnknown_08396FC4
	ldr r1, [r0]
	lsls r0, r5, 2
	movs r2, 0xFA
	lsls r2, 1
	adds r1, r2
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_0807E07A:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x2
	bls _0807DFF2
	ldr r0, _0807E098 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807E09C @ =0x000006de
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_0807E090:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E098: .4byte gUnknown_08396FC4
_0807E09C: .4byte 0x000006de
	thumb_func_end sub_807DFD4

	thumb_func_start sub_807E0A0
sub_807E0A0: @ 807E0A0
	push {r4,r5,lr}
	ldr r0, _0807E0EC @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807E0F0 @ =0x000006de
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807E0E4
	movs r4, 0
	movs r0, 0xFA
	lsls r0, 1
	adds r5, r1, r0
_0807E0B8:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0807E0C6
	bl DestroySprite
_0807E0C6:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x2
	bls _0807E0B8
	movs r0, 0x90
	lsls r0, 5
	bl FreeSpriteTilesByTag
	ldr r0, _0807E0EC @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807E0F0 @ =0x000006de
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_0807E0E4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E0EC: .4byte gUnknown_08396FC4
_0807E0F0: .4byte 0x000006de
	thumb_func_end sub_807E0A0

	thumb_func_start sub_807E0F4
sub_807E0F4: @ 807E0F4
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	movs r1, 0x1
	ands r0, r1
	strh r0, [r2, 0x2E]
	cmp r0, 0
	beq _0807E10C
	ldrh r0, [r2, 0x20]
	subs r0, 0x1
	strh r0, [r2, 0x20]
_0807E10C:
	pop {r0}
	bx r0
	thumb_func_end sub_807E0F4

	thumb_func_start sub_807E110
sub_807E110: @ 807E110
	ldr r0, _0807E134 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r0, _0807E138 @ =0x000006cc
	adds r3, r1, r0
	movs r2, 0
	movs r0, 0
	strh r0, [r3]
	ldr r3, _0807E13C @ =0x000006d2
	adds r0, r1, r3
	strb r2, [r0]
	subs r3, 0x11
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _0807E140 @ =0x000006c2
	adds r1, r0
	strb r2, [r1]
	bx lr
	.align 2, 0
_0807E134: .4byte gUnknown_08396FC4
_0807E138: .4byte 0x000006cc
_0807E13C: .4byte 0x000006d2
_0807E140: .4byte 0x000006c2
	thumb_func_end sub_807E110

	thumb_func_start sub_807E144
sub_807E144: @ 807E144
	push {r4,lr}
	bl sub_807E110
	ldr r0, _0807E16C @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807E170 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807E164
	adds r4, r1, r2
_0807E15A:
	bl sub_807E174
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807E15A
_0807E164:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E16C: .4byte gUnknown_08396FC4
_0807E170: .4byte 0x000006d2
	thumb_func_end sub_807E144

	thumb_func_start sub_807E174
sub_807E174: @ 807E174
	push {lr}
	ldr r1, _0807E190 @ =gUnknown_08396FC4
	ldr r0, [r1]
	ldr r2, _0807E194 @ =0x000006cc
	adds r0, r2
	ldrh r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x4
	bhi _0807E250
	lsls r0, 2
	ldr r1, _0807E198 @ =_0807E19C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807E190: .4byte gUnknown_08396FC4
_0807E194: .4byte 0x000006cc
_0807E198: .4byte _0807E19C
	.align 2, 0
_0807E19C:
	.4byte _0807E1B0
	.4byte _0807E1CC
	.4byte _0807E1E4
	.4byte _0807E200
	.4byte _0807E218
_0807E1B0:
	ldr r1, [r2]
	ldr r2, _0807E1C4 @ =0x000006c6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807E254
	ldr r0, _0807E1C8 @ =0x000006cc
	adds r1, r0
	b _0807E238
	.align 2, 0
_0807E1C4: .4byte 0x000006c6
_0807E1C8: .4byte 0x000006cc
_0807E1CC:
	bl sub_807D9A8
	ldr r0, _0807E1DC @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807E1E0 @ =0x000006cc
	adds r1, r2
	b _0807E238
	.align 2, 0
_0807E1DC: .4byte gUnknown_08396FC4
_0807E1E0: .4byte 0x000006cc
_0807E1E4:
	bl sub_807D9C8
	lsls r0, 24
	cmp r0, 0
	bne _0807E254
	ldr r0, _0807E1F8 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r0, _0807E1FC @ =0x000006cc
	adds r1, r0
	b _0807E238
	.align 2, 0
_0807E1F8: .4byte gUnknown_08396FC4
_0807E1FC: .4byte 0x000006cc
_0807E200:
	bl sub_807DA14
	ldr r0, _0807E210 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807E214 @ =0x000006cc
	adds r1, r2
	b _0807E238
	.align 2, 0
_0807E210: .4byte gUnknown_08396FC4
_0807E214: .4byte 0x000006cc
_0807E218:
	bl sub_807DA4C
	ldr r0, _0807E240 @ =gUnknown_08396FC4
	ldr r2, [r0]
	ldr r1, _0807E244 @ =0x0000073c
	adds r0, r2, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x6
	bne _0807E254
	ldr r0, _0807E248 @ =0x000006d2
	adds r1, r2, r0
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _0807E24C @ =0x000006cc
	adds r1, r2, r0
_0807E238:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0807E254
	.align 2, 0
_0807E240: .4byte gUnknown_08396FC4
_0807E244: .4byte 0x0000073c
_0807E248: .4byte 0x000006d2
_0807E24C: .4byte 0x000006cc
_0807E250:
	bl sub_807DA4C
_0807E254:
	pop {r0}
	bx r0
	thumb_func_end sub_807E174

	thumb_func_start sub_807E258
sub_807E258: @ 807E258
	movs r0, 0
	bx lr
	thumb_func_end sub_807E258

	thumb_func_start sub_807E25C
sub_807E25C: @ 807E25C
	push {lr}
	ldr r0, _0807E26C @ =task50_0807B6D4
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0807E26C: .4byte task50_0807B6D4
	thumb_func_end sub_807E25C

	thumb_func_start task50_0807B6D4
task50_0807B6D4: @ 807E270
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0807E294 @ =gTasks
	adds r3, r0, r1
	movs r1, 0x8
	ldrsh r0, [r3, r1]
	cmp r0, 0x4
	bhi _0807E35E
	lsls r0, 2
	ldr r1, _0807E298 @ =_0807E29C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807E294: .4byte gTasks
_0807E298: .4byte _0807E29C
	.align 2, 0
_0807E29C:
	.4byte _0807E2B0
	.4byte _0807E2D2
	.4byte _0807E300
	.4byte _0807E334
	.4byte _0807E354
_0807E2B0:
	movs r2, 0
	strh r2, [r3, 0xA]
	strh r2, [r3, 0xC]
	ldr r1, _0807E2F4 @ =REG_WININ
	ldrh r0, [r1]
	strh r0, [r3, 0xE]
	ldr r4, _0807E2F8 @ =0x00003f3f
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0x8
	movs r0, 0x9E
	strh r0, [r1]
	ldr r0, _0807E2FC @ =REG_BLDY
	strh r2, [r0]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_0807E2D2:
	ldrh r0, [r3, 0xA]
	adds r0, 0x3
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _0807E2E4
	movs r0, 0x10
	strh r0, [r3, 0xA]
_0807E2E4:
	ldr r0, _0807E2FC @ =REG_BLDY
	ldrh r1, [r3, 0xA]
	strh r1, [r0]
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	cmp r0, 0xF
	ble _0807E35E
	b _0807E344
	.align 2, 0
_0807E2F4: .4byte REG_WININ
_0807E2F8: .4byte 0x00003f3f
_0807E2FC: .4byte REG_BLDY
_0807E300:
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r3, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	ble _0807E35E
	strh r1, [r3, 0xC]
	ldrh r0, [r3, 0xA]
	subs r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	cmp r0, 0
	bgt _0807E326
	strh r1, [r3, 0xA]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_0807E326:
	ldr r1, _0807E330 @ =REG_BLDY
	ldrh r0, [r3, 0xA]
	strh r0, [r1]
	b _0807E35E
	.align 2, 0
_0807E330: .4byte REG_BLDY
_0807E334:
	ldr r0, _0807E34C @ =REG_BLDCNT
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	ldr r1, _0807E350 @ =REG_WININ
	ldrh r0, [r3, 0xE]
	strh r0, [r1]
_0807E344:
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	b _0807E35E
	.align 2, 0
_0807E34C: .4byte REG_BLDCNT
_0807E350: .4byte REG_WININ
_0807E354:
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_0807E35E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end task50_0807B6D4

	thumb_func_start sub_807E364
sub_807E364: @ 807E364
	push {r4,lr}
	ldr r0, _0807E3B4 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807E3B8 @ =0x000006cc
	adds r0, r1, r2
	movs r3, 0
	movs r2, 0
	strh r2, [r0]
	ldr r4, _0807E3BC @ =0x000006d2
	adds r0, r1, r4
	strb r3, [r0]
	adds r4, 0x4
	adds r0, r1, r4
	strh r2, [r0]
	ldr r0, _0807E3C0 @ =0x000006db
	adds r2, r1, r0
	movs r0, 0x8
	strb r0, [r2]
	ldr r2, _0807E3C4 @ =0x000006dc
	adds r0, r1, r2
	strb r3, [r0]
	adds r4, 0x3
	adds r2, r1, r4
	movs r0, 0xA
	strb r0, [r2]
	ldr r0, _0807E3C8 @ =0x000006c1
	adds r2, r1, r0
	movs r0, 0x3
	strb r0, [r2]
	ldr r2, _0807E3CC @ =0x000006c2
	adds r1, r2
	movs r0, 0x14
	strb r0, [r1]
	movs r0, 0x55
	bl sub_807DD5C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E3B4: .4byte gUnknown_08396FC4
_0807E3B8: .4byte 0x000006cc
_0807E3BC: .4byte 0x000006d2
_0807E3C0: .4byte 0x000006db
_0807E3C4: .4byte 0x000006dc
_0807E3C8: .4byte 0x000006c1
_0807E3CC: .4byte 0x000006c2
	thumb_func_end sub_807E364

	thumb_func_start sub_807E3D0
sub_807E3D0: @ 807E3D0
	push {r4,lr}
	bl sub_807E364
	ldr r0, _0807E3F8 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807E3FC @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807E3F0
	adds r4, r1, r2
_0807E3E6:
	bl sub_807E400
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807E3E6
_0807E3F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E3F8: .4byte gUnknown_08396FC4
_0807E3FC: .4byte 0x000006d2
	thumb_func_end sub_807E3D0

	thumb_func_start sub_807E400
sub_807E400: @ 807E400
	push {r4,r5,lr}
	ldr r0, _0807E41C @ =gUnknown_08396FC4
	ldr r5, [r0]
	ldr r0, _0807E420 @ =0x000006cc
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807E430
	cmp r0, 0x1
	bgt _0807E424
	cmp r0, 0
	beq _0807E42A
	b _0807E454
	.align 2, 0
_0807E41C: .4byte gUnknown_08396FC4
_0807E420: .4byte 0x000006cc
_0807E424:
	cmp r0, 0x2
	beq _0807E43C
	b _0807E454
_0807E42A:
	bl sub_807E7A4
	b _0807E44E
_0807E430:
	bl sub_807E7B4
	lsls r0, 24
	cmp r0, 0
	bne _0807E454
	b _0807E44E
_0807E43C:
	bl sub_807E8E8
	lsls r0, 24
	cmp r0, 0
	bne _0807E454
	ldr r0, _0807E45C @ =0x000006d2
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
_0807E44E:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807E454:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E45C: .4byte 0x000006d2
	thumb_func_end sub_807E400

	thumb_func_start sub_807E460
sub_807E460: @ 807E460
	push {r4,r5,lr}
	ldr r0, _0807E47C @ =gUnknown_08396FC4
	ldr r2, [r0]
	ldr r1, _0807E480 @ =0x000006ce
	adds r3, r2, r1
	ldrh r1, [r3]
	adds r4, r0, 0
	cmp r1, 0
	beq _0807E484
	cmp r1, 0x1
	beq _0807E4B8
	movs r0, 0
	b _0807E4E6
	.align 2, 0
_0807E47C: .4byte gUnknown_08396FC4
_0807E480: .4byte 0x000006ce
_0807E484:
	ldr r5, _0807E4A4 @ =0x000006d1
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _0807E496
	cmp r0, 0x5
	beq _0807E496
	cmp r0, 0xD
	bne _0807E4AC
_0807E496:
	ldr r0, [r4]
	ldr r1, _0807E4A8 @ =0x000006ce
	adds r0, r1
	movs r1, 0xFF
	strh r1, [r0]
	movs r0, 0
	b _0807E4E6
	.align 2, 0
_0807E4A4: .4byte 0x000006d1
_0807E4A8: .4byte 0x000006ce
_0807E4AC:
	ldr r4, _0807E4D8 @ =0x000006d9
	adds r0, r2, r4
	strb r1, [r0]
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
_0807E4B8:
	bl sub_807E8E8
	lsls r0, 24
	cmp r0, 0
	bne _0807E4E4
	bl sub_807E974
	ldr r0, _0807E4DC @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r5, _0807E4E0 @ =0x000006ce
	adds r1, r5
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0
	b _0807E4E6
	.align 2, 0
_0807E4D8: .4byte 0x000006d9
_0807E4DC: .4byte gUnknown_08396FC4
_0807E4E0: .4byte 0x000006ce
_0807E4E4:
	movs r0, 0x1
_0807E4E6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_807E460

	thumb_func_start sub_807E4EC
sub_807E4EC: @ 807E4EC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	movs r1, 0x30
	ldrsh r0, [r7, r1]
	cmp r0, 0
	bne _0807E500
	ldr r0, _0807E5A4 @ =0x00000169
	strh r0, [r7, 0x30]
_0807E500:
	movs r2, 0x30
	ldrsh r1, [r7, r2]
	ldr r0, _0807E5A8 @ =0x41c64e6d
	muls r0, r1
	ldr r3, _0807E5AC @ =0x00003039
	adds r0, r3
	lsls r0, 1
	lsrs r0, 17
	movs r1, 0x96
	lsls r1, 2
	bl __umodsi3
	movs r1, 0
	mov r8, r1
	strh r0, [r7, 0x30]
	ldr r1, _0807E5B0 @ =gUnknown_0839AAC4
	ldr r0, _0807E5B4 @ =gUnknown_08396FC4
	ldr r5, [r0]
	ldr r2, _0807E5B8 @ =0x000006dc
	adds r5, r2
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldrh r6, [r0]
	movs r3, 0x30
	ldrsh r0, [r7, r3]
	movs r1, 0x1E
	bl __modsi3
	adds r4, r0, 0
	lsls r4, 16
	asrs r4, 16
	lsls r0, r4, 3
	strh r0, [r7, 0x32]
	movs r1, 0x30
	ldrsh r0, [r7, r1]
	movs r1, 0x1E
	bl __divsi3
	lsls r0, 16
	lsls r4, 7
	strh r4, [r7, 0x32]
	asrs r0, 9
	strh r0, [r7, 0x34]
	ldr r2, _0807E5BC @ =gUnknown_0839AABC
	ldrb r1, [r5]
	lsls r1, 2
	adds r1, r2
	movs r3, 0
	ldrsh r1, [r1, r3]
	muls r1, r6
	subs r4, r1
	strh r4, [r7, 0x32]
	ldrb r1, [r5]
	lsls r1, 2
	adds r2, 0x2
	adds r1, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	muls r1, r6
	subs r0, r1
	strh r0, [r7, 0x34]
	adds r0, r7, 0
	movs r1, 0
	bl StartSpriteAnim
	mov r3, r8
	strh r3, [r7, 0x36]
	adds r2, r7, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	strh r6, [r7, 0x2E]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807E5A4: .4byte 0x00000169
_0807E5A8: .4byte 0x41c64e6d
_0807E5AC: .4byte 0x00003039
_0807E5B0: .4byte gUnknown_0839AAC4
_0807E5B4: .4byte gUnknown_08396FC4
_0807E5B8: .4byte 0x000006dc
_0807E5BC: .4byte gUnknown_0839AABC
	thumb_func_end sub_807E4EC

	thumb_func_start sub_807E5C0
sub_807E5C0: @ 807E5C0
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x36
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0807E69C
	ldr r3, _0807E634 @ =gUnknown_0839AABC
	ldr r4, _0807E638 @ =gUnknown_08396FC4
	ldr r2, [r4]
	ldr r0, _0807E63C @ =0x000006dc
	adds r2, r0
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0]
	ldrh r0, [r5, 0x32]
	adds r1, r0
	strh r1, [r5, 0x32]
	ldrb r0, [r2]
	lsls r0, 2
	adds r3, 0x2
	adds r0, r3
	ldrh r0, [r0]
	ldrh r2, [r5, 0x34]
	adds r0, r2
	strh r0, [r5, 0x34]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r5, 0x20]
	lsls r0, 16
	asrs r2, r0, 20
	strh r2, [r5, 0x22]
	movs r3, 0x38
	ldrsh r0, [r5, r3]
	adds r3, r4, 0
	cmp r0, 0
	beq _0807E640
	adds r0, r1, 0
	adds r0, 0x8
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 17
	cmp r0, r1
	bhi _0807E640
	adds r1, r2, 0
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	blt _0807E640
	cmp r1, 0xB0
	bgt _0807E640
	adds r0, r5, 0
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	b _0807E64A
	.align 2, 0
_0807E634: .4byte gUnknown_0839AABC
_0807E638: .4byte gUnknown_08396FC4
_0807E63C: .4byte 0x000006dc
_0807E640:
	adds r0, r5, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
_0807E64A:
	strb r1, [r0]
	adds r4, r0, 0
	ldrh r0, [r5, 0x2E]
	subs r0, 0x1
	strh r0, [r5, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _0807E6BC
	ldr r0, [r3]
	ldr r1, _0807E690 @ =0x000006dc
	adds r0, r1
	ldrb r1, [r0]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	movs r0, 0x1
	strh r0, [r5, 0x36]
	ldr r1, _0807E694 @ =gSpriteCoordOffsetX
	ldrh r0, [r5, 0x20]
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r5, 0x20]
	ldr r1, _0807E698 @ =gSpriteCoordOffsetY
	ldrh r0, [r5, 0x22]
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	b _0807E6BC
	.align 2, 0
_0807E690: .4byte 0x000006dc
_0807E694: .4byte gSpriteCoordOffsetX
_0807E698: .4byte gSpriteCoordOffsetY
_0807E69C:
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0807E6BC
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, 0
	bl sub_807E4EC
_0807E6BC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_807E5C0

	thumb_func_start sub_807E6C4
sub_807E6C4: @ 807E6C4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0807E6E4
	adds r0, r4, 0
	bl sub_807E4EC
	ldr r0, _0807E6E0 @ =sub_807E5C0
	str r0, [r4, 0x1C]
	b _0807E6E8
	.align 2, 0
_0807E6E0: .4byte sub_807E5C0
_0807E6E4:
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
_0807E6E8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_807E6C4

	thumb_func_start sub_807E6F0
sub_807E6F0: @ 807E6F0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	lsls r5, r1, 16
	lsrs r5, 16
	ldr r2, _0807E774 @ =gUnknown_0839AAC4
	ldr r0, _0807E778 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807E77C @ =0x000006dc
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r1, r0, r2
	ldrh r1, [r1]
	mov r8, r1
	adds r2, 0x2
	adds r0, r2
	ldrh r4, [r0]
	add r4, r8
	adds r0, r5, 0
	adds r1, r4, 0
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl __modsi3
	lsls r0, 16
	lsrs r4, r0, 16
	subs r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _0807E780 @ =0x0000ffff
	cmp r6, r0
	beq _0807E74E
	adds r5, r0, 0
_0807E73E:
	adds r0, r7, 0
	bl sub_807E4EC
	subs r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, r5
	bne _0807E73E
_0807E74E:
	cmp r4, r8
	bcs _0807E784
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _0807E780 @ =0x0000ffff
	cmp r4, r0
	beq _0807E770
	adds r5, r0, 0
_0807E760:
	adds r0, r7, 0
	bl sub_807E5C0
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r5
	bne _0807E760
_0807E770:
	movs r0, 0
	b _0807E798
	.align 2, 0
_0807E774: .4byte gUnknown_0839AAC4
_0807E778: .4byte gUnknown_08396FC4
_0807E77C: .4byte 0x000006dc
_0807E780: .4byte 0x0000ffff
_0807E784:
	mov r1, r8
	subs r0, r4, r1
	strh r0, [r7, 0x2E]
	adds r2, r7, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
_0807E798:
	strh r0, [r7, 0x3A]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_807E6F0

	thumb_func_start sub_807E7A4
sub_807E7A4: @ 807E7A4
	push {lr}
	ldr r0, _0807E7B0 @ =gUnknown_0839AACC
	bl LoadSpriteSheet
	pop {r0}
	bx r0
	.align 2, 0
_0807E7B0: .4byte gUnknown_0839AACC
	thumb_func_end sub_807E7A4

	thumb_func_start sub_807E7B4
sub_807E7B4: @ 807E7B4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _0807E860 @ =gUnknown_08396FC4
	ldr r4, [r0]
	ldr r0, _0807E864 @ =0x000006da
	adds r2, r4, r0
	ldrb r0, [r2]
	cmp r0, 0x18
	bne _0807E7CE
	b _0807E8D4
_0807E7CE:
	ldrb r7, [r2]
	ldr r0, _0807E868 @ =gSpriteTemplate_839AAA4
	ldr r2, _0807E86C @ =gUnknown_0839AA08
	lsls r6, r7, 2
	adds r2, r6, r2
	movs r3, 0
	ldrsh r1, [r2, r3]
	movs r3, 0x2
	ldrsh r2, [r2, r3]
	movs r3, 0x4E
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x40
	beq _0807E87C
	ldr r3, _0807E870 @ =gSprites
	lsls r4, r5, 4
	adds r1, r4, r5
	lsls r1, 2
	adds r1, r3
	movs r0, 0
	strh r0, [r1, 0x38]
	lsls r2, r7, 3
	adds r0, r2, r7
	lsls r0, 4
	adds r0, r7
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	ldr r1, _0807E874 @ =0x00000257
	mov r10, r6
	mov r9, r3
	mov r12, r4
	mov r8, r2
	cmp r0, r1
	ble _0807E832
	adds r2, r1, 0
_0807E81A:
	adds r0, r4, r5
	lsls r0, 2
	ldr r6, _0807E870 @ =gSprites
	adds r0, r6
	ldr r3, _0807E878 @ =0xfffffda8
	ldrh r6, [r0, 0x30]
	adds r1, r3, r6
	strh r1, [r0, 0x30]
	lsls r1, 16
	asrs r1, 16
	cmp r1, r2
	bgt _0807E81A
_0807E832:
	mov r0, r12
	adds r4, r0, r5
	lsls r4, 2
	add r4, r9
	adds r0, r4, 0
	bl sub_807E4EC
	mov r3, r8
	adds r1, r3, r7
	adds r0, r4, 0
	bl sub_807E6F0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0807E860 @ =gUnknown_08396FC4
	ldr r0, [r0]
	add r0, r10
	str r4, [r0]
	b _0807E882
	.align 2, 0
_0807E860: .4byte gUnknown_08396FC4
_0807E864: .4byte 0x000006da
_0807E868: .4byte gSpriteTemplate_839AAA4
_0807E86C: .4byte gUnknown_0839AA08
_0807E870: .4byte gSprites
_0807E874: .4byte 0x00000257
_0807E878: .4byte 0xfffffda8
_0807E87C:
	adds r1, r4, r6
	movs r0, 0
	str r0, [r1]
_0807E882:
	ldr r0, _0807E8B8 @ =gUnknown_08396FC4
	ldr r2, [r0]
	ldr r6, _0807E8BC @ =0x000006da
	adds r1, r2, r6
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x18
	bne _0807E8D8
	movs r3, 0
	adds r1, r2, 0
	ldr r5, _0807E8C0 @ =sub_807E5C0
	ldr r4, _0807E8C4 @ =sub_807E6C4
_0807E8A0:
	lsls r0, r3, 2
	adds r0, r1, r0
	ldr r2, [r0]
	cmp r2, 0
	beq _0807E8CA
	movs r6, 0x3A
	ldrsh r0, [r2, r6]
	cmp r0, 0
	bne _0807E8C8
	str r5, [r2, 0x1C]
	b _0807E8CA
	.align 2, 0
_0807E8B8: .4byte gUnknown_08396FC4
_0807E8BC: .4byte 0x000006da
_0807E8C0: .4byte sub_807E5C0
_0807E8C4: .4byte sub_807E6C4
_0807E8C8:
	str r4, [r2, 0x1C]
_0807E8CA:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x17
	bls _0807E8A0
_0807E8D4:
	movs r0, 0
	b _0807E8DA
_0807E8D8:
	movs r0, 0x1
_0807E8DA:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_807E7B4

	thumb_func_start sub_807E8E8
sub_807E8E8: @ 807E8E8
	push {r4-r7,lr}
	ldr r0, _0807E904 @ =gUnknown_08396FC4
	ldr r3, [r0]
	movs r0, 0xDB
	lsls r0, 3
	adds r4, r3, r0
	ldr r1, _0807E908 @ =0x000006d9
	adds r5, r3, r1
	ldrb r0, [r4]
	ldrb r7, [r5]
	cmp r0, r7
	bne _0807E90C
	movs r0, 0
	b _0807E96E
	.align 2, 0
_0807E904: .4byte gUnknown_08396FC4
_0807E908: .4byte 0x000006d9
_0807E90C:
	ldr r0, _0807E944 @ =0x000006d6
	adds r2, r3, r0
	ldrh r0, [r2]
	adds r0, 0x1
	movs r6, 0
	strh r0, [r2]
	ldr r7, _0807E948 @ =0x000006db
	adds r1, r3, r7
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1]
	cmp r0, r1
	bls _0807E96C
	strh r6, [r2]
	ldrb r0, [r4]
	adds r1, r0, 0
	ldrb r5, [r5]
	cmp r1, r5
	bcs _0807E94C
	adds r0, 0x1
	strb r0, [r4]
	lsls r0, r1, 2
	adds r0, r3, r0
	ldr r1, [r0]
	movs r0, 0x1
	strh r0, [r1, 0x38]
	b _0807E96C
	.align 2, 0
_0807E944: .4byte 0x000006d6
_0807E948: .4byte 0x000006db
_0807E94C:
	subs r0, 0x1
	strb r0, [r4]
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r3, r0
	ldr r0, [r0]
	strh r6, [r0, 0x38]
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r3, r0
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
_0807E96C:
	movs r0, 0x1
_0807E96E:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_807E8E8

	thumb_func_start sub_807E974
sub_807E974: @ 807E974
	push {r4-r7,lr}
	movs r4, 0
	ldr r0, _0807E9BC @ =gUnknown_08396FC4
	ldr r2, [r0]
	ldr r3, _0807E9C0 @ =0x000006da
	adds r1, r2, r3
	adds r7, r0, 0
	ldrb r1, [r1]
	cmp r4, r1
	bcs _0807E9A6
	adds r5, r2, 0
	adds r6, r5, r3
_0807E98C:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0807E99A
	bl DestroySprite
_0807E99A:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrb r0, [r6]
	cmp r4, r0
	bcc _0807E98C
_0807E9A6:
	ldr r0, [r7]
	ldr r1, _0807E9C0 @ =0x000006da
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r0, _0807E9C4 @ =0x00001206
	bl FreeSpriteTilesByTag
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807E9BC: .4byte gUnknown_08396FC4
_0807E9C0: .4byte 0x000006da
_0807E9C4: .4byte 0x00001206
	thumb_func_end sub_807E974

	thumb_func_start sub_807E9C8
sub_807E9C8: @ 807E9C8
	push {r4,lr}
	ldr r0, _0807EA04 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807EA08 @ =0x000006cc
	adds r0, r1, r2
	movs r2, 0
	movs r3, 0
	strh r3, [r0]
	ldr r4, _0807EA0C @ =0x000006d2
	adds r0, r1, r4
	strb r2, [r0]
	ldr r0, _0807EA10 @ =0x000006c1
	adds r2, r1, r0
	movs r0, 0x3
	strb r0, [r2]
	subs r4, 0x10
	adds r2, r1, r4
	movs r0, 0x14
	strb r0, [r2]
	ldr r0, _0807EA14 @ =0x000006e5
	adds r2, r1, r0
	movs r0, 0x10
	strb r0, [r2]
	movs r2, 0xDC
	lsls r2, 3
	adds r1, r2
	strh r3, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807EA04: .4byte gUnknown_08396FC4
_0807EA08: .4byte 0x000006cc
_0807EA0C: .4byte 0x000006d2
_0807EA10: .4byte 0x000006c1
_0807EA14: .4byte 0x000006e5
	thumb_func_end sub_807E9C8

	thumb_func_start sub_807EA18
sub_807EA18: @ 807EA18
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	bl sub_807E9C8
	ldr r2, _0807EA78 @ =gUnknown_08396FC4
	ldr r1, [r2]
	ldr r3, _0807EA7C @ =0x000006d2
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807EA6E
	mov r8, r2
	adds r7, r1, r3
_0807EA34:
	bl snowflakes_progress2
	movs r4, 0
	mov r1, r8
	ldr r0, [r1]
	ldr r3, _0807EA80 @ =0x000006e4
	adds r0, r3
	ldrb r0, [r0]
	cmp r4, r0
	bcs _0807EA68
	ldr r0, _0807EA78 @ =gUnknown_08396FC4
	ldr r5, [r0]
	adds r6, r5, r3
_0807EA4E:
	lsls r1, r4, 2
	adds r0, r5, 0
	adds r0, 0x60
	adds r0, r1
	ldr r0, [r0]
	bl sub_807ED48
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrb r0, [r6]
	cmp r4, r0
	bcc _0807EA4E
_0807EA68:
	ldrb r0, [r7]
	cmp r0, 0
	beq _0807EA34
_0807EA6E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807EA78: .4byte gUnknown_08396FC4
_0807EA7C: .4byte 0x000006d2
_0807EA80: .4byte 0x000006e4
	thumb_func_end sub_807EA18

	thumb_func_start snowflakes_progress2
snowflakes_progress2: @ 807EA84
	push {r4,r5,lr}
	ldr r0, _0807EAB4 @ =gUnknown_08396FC4
	ldr r5, [r0]
	ldr r0, _0807EAB8 @ =0x000006cc
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0
	bne _0807EAAC
	bl snowflakes_progress
	lsls r0, 24
	cmp r0, 0
	bne _0807EAAC
	ldr r0, _0807EABC @ =0x000006d2
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807EAAC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807EAB4: .4byte gUnknown_08396FC4
_0807EAB8: .4byte 0x000006cc
_0807EABC: .4byte 0x000006d2
	thumb_func_end snowflakes_progress2

	thumb_func_start sub_807EAC0
sub_807EAC0: @ 807EAC0
	push {r4,lr}
	ldr r0, _0807EAD8 @ =gUnknown_08396FC4
	ldr r2, [r0]
	ldr r0, _0807EADC @ =0x000006ce
	adds r3, r2, r0
	ldrh r1, [r3]
	cmp r1, 0
	beq _0807EAE0
	cmp r1, 0x1
	beq _0807EAF2
	movs r0, 0
	b _0807EB1E
	.align 2, 0
_0807EAD8: .4byte gUnknown_08396FC4
_0807EADC: .4byte 0x000006ce
_0807EAE0:
	ldr r4, _0807EB10 @ =0x000006e5
	adds r0, r2, r4
	strb r1, [r0]
	subs r4, 0x5
	adds r0, r2, r4
	strh r1, [r0]
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
_0807EAF2:
	bl snowflakes_progress
	lsls r0, 24
	cmp r0, 0
	bne _0807EB1C
	ldr r0, _0807EB14 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r0, _0807EB18 @ =0x000006ce
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0
	b _0807EB1E
	.align 2, 0
_0807EB10: .4byte 0x000006e5
_0807EB14: .4byte gUnknown_08396FC4
_0807EB18: .4byte 0x000006ce
_0807EB1C:
	movs r0, 0x1
_0807EB1E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807EAC0

	thumb_func_start snowflakes_progress
snowflakes_progress: @ 807EB24
	push {r4,lr}
	ldr r0, _0807EB40 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r0, _0807EB44 @ =0x000006e4
	adds r3, r1, r0
	ldr r4, _0807EB48 @ =0x000006e5
	adds r2, r1, r4
	ldrb r0, [r3]
	ldrb r4, [r2]
	cmp r0, r4
	bne _0807EB4C
	movs r0, 0
	b _0807EB8E
	.align 2, 0
_0807EB40: .4byte gUnknown_08396FC4
_0807EB44: .4byte 0x000006e4
_0807EB48: .4byte 0x000006e5
_0807EB4C:
	movs r0, 0xDC
	lsls r0, 3
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x24
	bls _0807EB76
	movs r0, 0
	strh r0, [r1]
	ldrb r0, [r3]
	ldrb r2, [r2]
	cmp r0, r2
	bcs _0807EB72
	bl snowflake_add
	b _0807EB76
_0807EB72:
	bl snowflake_remove
_0807EB76:
	ldr r0, _0807EB94 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r2, _0807EB98 @ =0x000006e4
	adds r1, r0, r2
	ldr r4, _0807EB9C @ =0x000006e5
	adds r0, r4
	ldrb r1, [r1]
	ldrb r0, [r0]
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
_0807EB8E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807EB94: .4byte gUnknown_08396FC4
_0807EB98: .4byte 0x000006e4
_0807EB9C: .4byte 0x000006e5
	thumb_func_end snowflakes_progress

	thumb_func_start snowflake_add
snowflake_add: @ 807EBA0
	push {r4-r6,lr}
	ldr r0, _0807EBF4 @ =gSpriteTemplate_839AB04
	movs r1, 0
	movs r2, 0
	movs r3, 0x4E
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0807EC04
	ldr r0, _0807EBF8 @ =gSprites
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	adds r4, r0
	ldr r0, _0807EBFC @ =gUnknown_08396FC4
	ldr r5, [r0]
	ldr r0, _0807EC00 @ =0x000006e4
	adds r6, r5, r0
	ldrb r0, [r6]
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_807EC40
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r6]
	adds r1, r0, 0x1
	strb r1, [r6]
	lsls r0, 24
	lsrs r0, 22
	adds r5, 0x60
	adds r5, r0
	str r4, [r5]
	movs r0, 0x1
	b _0807EC06
	.align 2, 0
_0807EBF4: .4byte gSpriteTemplate_839AB04
_0807EBF8: .4byte gSprites
_0807EBFC: .4byte gUnknown_08396FC4
_0807EC00: .4byte 0x000006e4
_0807EC04:
	movs r0, 0
_0807EC06:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end snowflake_add

	thumb_func_start snowflake_remove
snowflake_remove: @ 807EC0C
	push {lr}
	ldr r0, _0807EC20 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r0, _0807EC24 @ =0x000006e4
	adds r2, r1, r0
	ldrb r0, [r2]
	cmp r0, 0
	bne _0807EC28
	movs r0, 0
	b _0807EC3C
	.align 2, 0
_0807EC20: .4byte gUnknown_08396FC4
_0807EC24: .4byte 0x000006e4
_0807EC28:
	subs r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 22
	adds r1, 0x60
	adds r1, r0
	ldr r0, [r1]
	bl DestroySprite
	movs r0, 0x1
_0807EC3C:
	pop {r1}
	bx r1
	thumb_func_end snowflake_remove

	thumb_func_start sub_807EC40
sub_807EC40: @ 807EC40
	push {r4-r7,lr}
	adds r5, r0, 0
	bl Random
	movs r1, 0x36
	ldrsh r2, [r5, r1]
	lsls r1, r2, 2
	adds r1, r2
	movs r2, 0x7
	ands r1, r2
	lsls r4, r1, 4
	subs r4, r1
	lsls r4, 1
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1E
	bl __umodsi3
	adds r4, r0
	lsls r4, 16
	lsrs r4, 16
	ldr r1, _0807ECE4 @ =gSpriteCoordOffsetY
	adds r0, r5, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r1]
	adds r0, r1
	movs r2, 0x3
	negs r2, r2
	adds r1, r2, 0
	subs r1, r0
	movs r7, 0
	strh r1, [r5, 0x22]
	ldr r1, _0807ECE8 @ =gSpriteCoordOffsetX
	adds r0, r5, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r1]
	adds r0, r1
	subs r4, r0
	strh r4, [r5, 0x20]
	movs r1, 0x22
	ldrsh r0, [r5, r1]
	lsls r0, 7
	strh r0, [r5, 0x2E]
	strh r7, [r5, 0x24]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r6, r0, 0
	movs r4, 0x3
	ands r4, r6
	lsls r0, r4, 2
	adds r0, r4
	adds r0, 0x40
	strh r0, [r5, 0x30]
	strh r0, [r5, 0x3C]
	movs r1, 0x1
	bics r1, r6
	adds r0, r5, 0
	bl StartSpriteAnim
	strh r7, [r5, 0x34]
	movs r0, 0x1
	cmp r4, 0
	bne _0807ECD0
	movs r0, 0x2
_0807ECD0:
	strh r0, [r5, 0x32]
	movs r0, 0x1F
	ands r0, r6
	adds r0, 0xD2
	strh r0, [r5, 0x3A]
	strh r7, [r5, 0x38]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807ECE4: .4byte gSpriteCoordOffsetY
_0807ECE8: .4byte gSpriteCoordOffsetX
	thumb_func_end sub_807EC40

	thumb_func_start sub_807ECEC
sub_807ECEC: @ 807ECEC
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _0807ED38 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807ED3C @ =0x000006e2
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0x12
	bls _0807ED32
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0807ED40 @ =sub_807ED48
	str r0, [r3, 0x1C]
	ldr r1, _0807ED44 @ =gSpriteCoordOffsetY
	adds r0, r3, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r1]
	adds r0, r1
	movs r1, 0xFA
	subs r1, r0
	movs r2, 0
	strh r1, [r3, 0x22]
	movs r1, 0x22
	ldrsh r0, [r3, r1]
	lsls r0, 7
	strh r0, [r3, 0x2E]
	strh r2, [r4]
_0807ED32:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807ED38: .4byte gUnknown_08396FC4
_0807ED3C: .4byte 0x000006e2
_0807ED40: .4byte sub_807ED48
_0807ED44: .4byte gSpriteCoordOffsetY
	thumb_func_end sub_807ECEC

	thumb_func_start sub_807ED48
sub_807ED48: @ 807ED48
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x2E]
	adds r0, r1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 23
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x34]
	adds r0, r2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x34]
	ldr r1, _0807EDC0 @ =gSineTable
	movs r3, 0x34
	ldrsh r0, [r4, r3]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _0807ED7A
	adds r0, 0x3F
_0807ED7A:
	asrs r0, 6
	strh r0, [r4, 0x24]
	adds r0, r4, 0
	adds r0, 0x28
	movs r5, 0
	ldrsb r5, [r0, r5]
	ldrh r0, [r4, 0x20]
	adds r0, r5
	ldr r1, _0807EDC4 @ =gSpriteCoordOffsetX
	ldrh r1, [r1]
	adds r3, r1, r0
	ldr r2, _0807EDC8 @ =0x000001ff
	adds r0, r2, 0
	ands r3, r0
	adds r2, r3, 0
	movs r0, 0x80
	lsls r0, 1
	ands r0, r2
	cmp r0, 0
	beq _0807EDAC
	ldr r3, _0807EDCC @ =0xffffff00
	adds r0, r3, 0
	orrs r2, r0
	lsls r0, r2, 16
	lsrs r3, r0, 16
_0807EDAC:
	lsls r0, r3, 16
	asrs r0, 16
	movs r2, 0x3
	negs r2, r2
	cmp r0, r2
	bge _0807EDD0
	adds r1, r5
	movs r0, 0xF2
	subs r0, r1
	b _0807EDD8
	.align 2, 0
_0807EDC0: .4byte gSineTable
_0807EDC4: .4byte gSpriteCoordOffsetX
_0807EDC8: .4byte 0x000001ff
_0807EDCC: .4byte 0xffffff00
_0807EDD0:
	cmp r0, 0xF2
	ble _0807EDDA
	adds r0, r1, r5
	subs r0, r2, r0
_0807EDD8:
	strh r0, [r4, 0x20]
_0807EDDA:
	adds r0, r4, 0
	adds r0, 0x29
	movs r3, 0
	ldrsb r3, [r0, r3]
	ldrh r0, [r4, 0x22]
	adds r0, r3
	ldr r1, _0807EE18 @ =gSpriteCoordOffsetY
	ldrh r1, [r1]
	adds r2, r1, r0
	movs r0, 0xFF
	ands r2, r0
	adds r0, r2, 0
	subs r0, 0xA4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x6
	bhi _0807EE1C
	adds r1, r3
	movs r0, 0xFA
	subs r0, r1
	movs r1, 0
	strh r0, [r4, 0x22]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	lsls r0, 7
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x38]
	movs r0, 0xDC
	strh r0, [r4, 0x3A]
	b _0807EE48
	.align 2, 0
_0807EE18: .4byte gSpriteCoordOffsetY
_0807EE1C:
	adds r0, r2, 0
	subs r0, 0xF3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x6
	bhi _0807EE48
	movs r1, 0
	movs r0, 0xA3
	strh r0, [r4, 0x22]
	lsls r0, 7
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x38]
	movs r0, 0xDC
	strh r0, [r4, 0x3A]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0807EE7C @ =sub_807ECEC
	str r0, [r4, 0x1C]
_0807EE48:
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x3A
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bne _0807EE74
	adds r0, r4, 0
	bl sub_807EC40
	movs r0, 0xFA
	strh r0, [r4, 0x22]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0807EE7C @ =sub_807ECEC
	str r0, [r4, 0x1C]
_0807EE74:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807EE7C: .4byte sub_807ECEC
	thumb_func_end sub_807ED48

	thumb_func_start sub_807EE80
sub_807EE80: @ 807EE80
	push {r4,r5,lr}
	ldr r0, _0807EED8 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807EEDC @ =0x000006cc
	adds r0, r1, r2
	movs r3, 0
	movs r2, 0
	strh r2, [r0]
	ldr r5, _0807EEE0 @ =0x000006d2
	adds r4, r1, r5
	strb r3, [r4]
	adds r5, 0x4
	adds r0, r1, r5
	strh r2, [r0]
	ldr r0, _0807EEE4 @ =0x000006db
	adds r2, r1, r0
	movs r0, 0x4
	strb r0, [r2]
	ldr r2, _0807EEE8 @ =0x000006dc
	adds r0, r1, r2
	strb r3, [r0]
	adds r5, 0x3
	adds r2, r1, r5
	movs r0, 0x10
	strb r0, [r2]
	ldr r0, _0807EEEC @ =0x000006c1
	adds r2, r1, r0
	movs r0, 0x3
	strb r0, [r2]
	subs r5, 0x17
	adds r2, r1, r5
	movs r0, 0x14
	strb r0, [r2]
	strb r3, [r4]
	ldr r0, _0807EEF0 @ =0x000006ed
	adds r1, r0
	strb r3, [r1]
	movs r0, 0x51
	bl sub_807DD5C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807EED8: .4byte gUnknown_08396FC4
_0807EEDC: .4byte 0x000006cc
_0807EEE0: .4byte 0x000006d2
_0807EEE4: .4byte 0x000006db
_0807EEE8: .4byte 0x000006dc
_0807EEEC: .4byte 0x000006c1
_0807EEF0: .4byte 0x000006ed
	thumb_func_end sub_807EE80

	thumb_func_start sub_807EEF4
sub_807EEF4: @ 807EEF4
	push {r4,lr}
	bl sub_807EE80
	ldr r0, _0807EF1C @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807EF20 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807EF14
	adds r4, r1, r2
_0807EF0A:
	bl sub_807EFC0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807EF0A
_0807EF14:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807EF1C: .4byte gUnknown_08396FC4
_0807EF20: .4byte 0x000006d2
	thumb_func_end sub_807EEF4

	thumb_func_start sub_807EF24
sub_807EF24: @ 807EF24
	push {r4,r5,lr}
	ldr r0, _0807EF78 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807EF7C @ =0x000006cc
	adds r0, r1, r2
	movs r4, 0
	movs r2, 0
	strh r2, [r0]
	ldr r5, _0807EF80 @ =0x000006d2
	adds r3, r1, r5
	strb r4, [r3]
	adds r5, 0x4
	adds r0, r1, r5
	strh r2, [r0]
	ldr r0, _0807EF84 @ =0x000006db
	adds r2, r1, r0
	movs r0, 0x4
	strb r0, [r2]
	adds r5, 0x6
	adds r2, r1, r5
	movs r0, 0x1
	strb r0, [r2]
	ldr r0, _0807EF88 @ =0x000006d9
	adds r2, r1, r0
	movs r0, 0x18
	strb r0, [r2]
	subs r5, 0x1B
	adds r2, r1, r5
	movs r0, 0x3
	strb r0, [r2]
	ldr r0, _0807EF8C @ =0x000006c2
	adds r1, r0
	movs r0, 0x14
	strb r0, [r1]
	strb r4, [r3]
	movs r0, 0x53
	bl sub_807DD5C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807EF78: .4byte gUnknown_08396FC4
_0807EF7C: .4byte 0x000006cc
_0807EF80: .4byte 0x000006d2
_0807EF84: .4byte 0x000006db
_0807EF88: .4byte 0x000006d9
_0807EF8C: .4byte 0x000006c2
	thumb_func_end sub_807EF24

	thumb_func_start sub_807EF90
sub_807EF90: @ 807EF90
	push {r4,lr}
	bl sub_807EF24
	ldr r0, _0807EFB8 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807EFBC @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807EFB0
	adds r4, r1, r2
_0807EFA6:
	bl sub_807EFC0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807EFA6
_0807EFB0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807EFB8: .4byte gUnknown_08396FC4
_0807EFBC: .4byte 0x000006d2
	thumb_func_end sub_807EF90

	thumb_func_start sub_807EFC0
sub_807EFC0: @ 807EFC0
	push {r4,r5,lr}
	bl sub_807F434
	ldr r0, _0807EFE0 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807EFE4 @ =0x000006cc
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0xE
	bls _0807EFD6
	b _0807F336
_0807EFD6:
	lsls r0, 2
	ldr r1, _0807EFE8 @ =_0807EFEC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807EFE0: .4byte gUnknown_08396FC4
_0807EFE4: .4byte 0x000006cc
_0807EFE8: .4byte _0807EFEC
	.align 2, 0
_0807EFEC:
	.4byte _0807F028
	.4byte _0807F044
	.4byte _0807F068
	.4byte _0807F098
	.4byte _0807F0BC
	.4byte _0807F0EC
	.4byte _0807F11C
	.4byte _0807F148
	.4byte _0807F166
	.4byte _0807F1C4
	.4byte _0807F248
	.4byte _0807F270
	.4byte _0807F2A0
	.4byte _0807F2E4
	.4byte _0807F318
_0807F028:
	bl sub_807E7A4
	ldr r0, _0807F03C @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807F040 @ =0x000006cc
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	b _0807F334
	.align 2, 0
_0807F03C: .4byte gUnknown_08396FC4
_0807F040: .4byte 0x000006cc
_0807F044:
	bl sub_807E7B4
	lsls r0, 24
	cmp r0, 0
	beq _0807F050
	b _0807F336
_0807F050:
	ldr r0, _0807F060 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r3, _0807F064 @ =0x000006cc
	adds r1, r3
	ldrh r0, [r1]
	adds r0, 0x1
	b _0807F334
	.align 2, 0
_0807F060: .4byte gUnknown_08396FC4
_0807F064: .4byte 0x000006cc
_0807F068:
	bl sub_807E8E8
	lsls r0, 24
	cmp r0, 0
	beq _0807F074
	b _0807F336
_0807F074:
	ldr r0, _0807F08C @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r0, _0807F090 @ =0x000006d2
	adds r2, r1, r0
	movs r0, 0x1
	strb r0, [r2]
	ldr r2, _0807F094 @ =0x000006cc
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	b _0807F334
	.align 2, 0
_0807F08C: .4byte gUnknown_08396FC4
_0807F090: .4byte 0x000006d2
_0807F094: .4byte 0x000006cc
_0807F098:
	ldr r0, _0807F0B0 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r3, _0807F0B4 @ =0x000006c6
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807F0A8
	b _0807F336
_0807F0A8:
	ldr r0, _0807F0B8 @ =0x000006cc
	adds r1, r0
	movs r0, 0x6
	b _0807F334
	.align 2, 0
_0807F0B0: .4byte gUnknown_08396FC4
_0807F0B4: .4byte 0x000006c6
_0807F0B8: .4byte 0x000006cc
_0807F0BC:
	ldr r0, _0807F10C @ =gUnknown_08396FC4
	ldr r4, [r0]
	ldr r2, _0807F110 @ =0x000006ea
	adds r1, r4, r2
	movs r0, 0x1
	strb r0, [r1]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r5, 0xB4
	lsls r5, 1
	adds r1, r5, 0
	bl __umodsi3
	adds r0, r5
	ldr r3, _0807F114 @ =0x000006e6
	adds r1, r4, r3
	strh r0, [r1]
	ldr r0, _0807F118 @ =0x000006cc
	adds r4, r0
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807F0EC:
	ldr r0, _0807F10C @ =gUnknown_08396FC4
	ldr r2, [r0]
	ldr r3, _0807F114 @ =0x000006e6
	adds r1, r2, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	beq _0807F102
	b _0807F336
_0807F102:
	ldr r0, _0807F118 @ =0x000006cc
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x1
	b _0807F334
	.align 2, 0
_0807F10C: .4byte gUnknown_08396FC4
_0807F110: .4byte 0x000006ea
_0807F114: .4byte 0x000006e6
_0807F118: .4byte 0x000006cc
_0807F11C:
	ldr r0, _0807F13C @ =gUnknown_08396FC4
	ldr r4, [r0]
	ldr r1, _0807F140 @ =0x000006ea
	adds r0, r4, r1
	movs r5, 0x1
	strb r5, [r0]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ands r0, r5
	ldr r2, _0807F144 @ =0x000006eb
	adds r1, r4, r2
	strb r0, [r1]
	b _0807F1A4
	.align 2, 0
_0807F13C: .4byte gUnknown_08396FC4
_0807F140: .4byte 0x000006ea
_0807F144: .4byte 0x000006eb
_0807F148:
	bl Random
	ldr r1, _0807F1B0 @ =gUnknown_08396FC4
	ldr r2, [r1]
	movs r1, 0x1
	ands r1, r0
	adds r1, 0x1
	ldr r3, _0807F1B4 @ =0x000006ec
	adds r0, r2, r3
	strb r1, [r0]
	ldr r0, _0807F1B8 @ =0x000006cc
	adds r2, r0
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
_0807F166:
	movs r0, 0x13
	bl sub_807D5BC
	ldr r0, _0807F1B0 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807F1BC @ =0x000006eb
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807F18A
	ldr r3, _0807F1B4 @ =0x000006ec
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0807F18A
	movs r0, 0x14
	bl sub_807F3F8
_0807F18A:
	bl Random
	ldr r1, _0807F1B0 @ =gUnknown_08396FC4
	ldr r4, [r1]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	adds r0, 0x6
	ldr r2, _0807F1C0 @ =0x000006e6
	adds r1, r4, r2
	strh r0, [r1]
_0807F1A4:
	ldr r3, _0807F1B8 @ =0x000006cc
	adds r4, r3
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0807F336
	.align 2, 0
_0807F1B0: .4byte gUnknown_08396FC4
_0807F1B4: .4byte 0x000006ec
_0807F1B8: .4byte 0x000006cc
_0807F1BC: .4byte 0x000006eb
_0807F1C0: .4byte 0x000006e6
_0807F1C4:
	ldr r0, _0807F210 @ =gUnknown_08396FC4
	ldr r4, [r0]
	ldr r0, _0807F214 @ =0x000006e6
	adds r5, r4, r0
	ldrh r0, [r5]
	subs r0, 0x1
	strh r0, [r5]
	lsls r0, 16
	cmp r0, 0
	beq _0807F1DA
	b _0807F336
_0807F1DA:
	movs r0, 0x3
	bl sub_807D5BC
	ldr r2, _0807F218 @ =0x000006ea
	adds r1, r4, r2
	movs r0, 0x1
	strb r0, [r1]
	ldr r3, _0807F21C @ =0x000006ec
	adds r1, r4, r3
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	beq _0807F224
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF
	ands r0, r1
	adds r0, 0x3C
	strh r0, [r5]
	ldr r0, _0807F220 @ =0x000006cc
	adds r1, r4, r0
	movs r0, 0xA
	b _0807F334
	.align 2, 0
_0807F210: .4byte gUnknown_08396FC4
_0807F214: .4byte 0x000006e6
_0807F218: .4byte 0x000006ea
_0807F21C: .4byte 0x000006ec
_0807F220: .4byte 0x000006cc
_0807F224:
	ldr r1, _0807F234 @ =0x000006eb
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807F23C
	ldr r2, _0807F238 @ =0x000006cc
	adds r1, r4, r2
	b _0807F332
	.align 2, 0
_0807F234: .4byte 0x000006eb
_0807F238: .4byte 0x000006cc
_0807F23C:
	ldr r3, _0807F244 @ =0x000006cc
	adds r1, r4, r3
	movs r0, 0xB
	b _0807F334
	.align 2, 0
_0807F244: .4byte 0x000006cc
_0807F248:
	ldr r0, _0807F264 @ =gUnknown_08396FC4
	ldr r2, [r0]
	ldr r0, _0807F268 @ =0x000006e6
	adds r1, r2, r0
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bne _0807F336
	ldr r3, _0807F26C @ =0x000006cc
	adds r1, r2, r3
	movs r0, 0x8
	b _0807F334
	.align 2, 0
_0807F264: .4byte gUnknown_08396FC4
_0807F268: .4byte 0x000006e6
_0807F26C: .4byte 0x000006cc
_0807F270:
	bl Random
	ldr r1, _0807F294 @ =gUnknown_08396FC4
	ldr r2, [r1]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF
	ands r0, r1
	adds r0, 0x3C
	ldr r3, _0807F298 @ =0x000006e6
	adds r1, r2, r3
	strh r0, [r1]
	ldr r0, _0807F29C @ =0x000006cc
	adds r2, r0
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	b _0807F336
	.align 2, 0
_0807F294: .4byte gUnknown_08396FC4
_0807F298: .4byte 0x000006e6
_0807F29C: .4byte 0x000006cc
_0807F2A0:
	ldr r0, _0807F2D8 @ =gUnknown_08396FC4
	ldr r5, [r0]
	ldr r1, _0807F2DC @ =0x000006e6
	adds r4, r5, r1
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r4]
	lsls r0, 16
	cmp r0, 0
	bne _0807F336
	movs r0, 0x64
	bl sub_807F3F8
	movs r0, 0x13
	bl sub_807D5BC
	bl Random
	movs r1, 0xF
	ands r1, r0
	adds r1, 0x1E
	strh r1, [r4]
	ldr r2, _0807F2E0 @ =0x000006cc
	adds r1, r5, r2
	ldrh r0, [r1]
	adds r0, 0x1
	b _0807F334
	.align 2, 0
_0807F2D8: .4byte gUnknown_08396FC4
_0807F2DC: .4byte 0x000006e6
_0807F2E0: .4byte 0x000006cc
_0807F2E4:
	ldr r0, _0807F30C @ =gUnknown_08396FC4
	ldr r4, [r0]
	ldr r3, _0807F310 @ =0x000006e6
	adds r1, r4, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bne _0807F336
	movs r0, 0x13
	movs r1, 0x3
	movs r2, 0x5
	bl sub_807D5F0
	ldr r0, _0807F314 @ =0x000006cc
	adds r1, r4, r0
	ldrh r0, [r1]
	adds r0, 0x1
	b _0807F334
	.align 2, 0
_0807F30C: .4byte gUnknown_08396FC4
_0807F310: .4byte 0x000006e6
_0807F314: .4byte 0x000006cc
_0807F318:
	ldr r0, _0807F33C @ =gUnknown_08396FC4
	ldr r2, [r0]
	ldr r1, _0807F340 @ =0x000006c6
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _0807F336
	ldr r3, _0807F344 @ =0x000006ea
	adds r1, r2, r3
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _0807F348 @ =0x000006cc
	adds r1, r2, r0
_0807F332:
	movs r0, 0x4
_0807F334:
	strh r0, [r1]
_0807F336:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F33C: .4byte gUnknown_08396FC4
_0807F340: .4byte 0x000006c6
_0807F344: .4byte 0x000006ea
_0807F348: .4byte 0x000006cc
	thumb_func_end sub_807EFC0

	thumb_func_start sub_807F34C
sub_807F34C: @ 807F34C
	push {r4-r6,lr}
	ldr r0, _0807F368 @ =gUnknown_08396FC4
	ldr r6, [r0]
	ldr r0, _0807F36C @ =0x000006ce
	adds r5, r6, r0
	ldrh r1, [r5]
	cmp r1, 0x1
	beq _0807F382
	cmp r1, 0x1
	bgt _0807F370
	cmp r1, 0
	beq _0807F376
	b _0807F3E8
	.align 2, 0
_0807F368: .4byte gUnknown_08396FC4
_0807F36C: .4byte 0x000006ce
_0807F370:
	cmp r1, 0x2
	beq _0807F3CC
	b _0807F3E8
_0807F376:
	ldr r2, _0807F3BC @ =0x000006ea
	adds r0, r6, r2
	strb r1, [r0]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_0807F382:
	bl sub_807EFC0
	ldr r0, _0807F3C0 @ =gUnknown_08396FC4
	ldr r2, [r0]
	ldr r1, _0807F3BC @ =0x000006ea
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807F3F0
	subs r1, 0x19
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _0807F3E8
	cmp r0, 0x5
	beq _0807F3E8
	cmp r0, 0xD
	beq _0807F3E8
	ldr r0, _0807F3C4 @ =0x000006d9
	adds r1, r2, r0
	movs r0, 0
	strb r0, [r1]
	ldr r0, _0807F3C8 @ =0x000006ce
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0807F3F0
	.align 2, 0
_0807F3BC: .4byte 0x000006ea
_0807F3C0: .4byte gUnknown_08396FC4
_0807F3C4: .4byte 0x000006d9
_0807F3C8: .4byte 0x000006ce
_0807F3CC:
	bl sub_807E8E8
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0807F3F0
	bl sub_807E974
	ldr r1, _0807F3EC @ =0x000006ed
	adds r0, r6, r1
	strb r4, [r0]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_0807F3E8:
	movs r0, 0
	b _0807F3F2
	.align 2, 0
_0807F3EC: .4byte 0x000006ed
_0807F3F0:
	movs r0, 0x1
_0807F3F2:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_807F34C

	thumb_func_start sub_807F3F8
sub_807F3F8: @ 807F3F8
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _0807F42C @ =gUnknown_08396FC4
	ldr r4, [r0]
	ldr r0, _0807F430 @ =0x000006ed
	adds r5, r4, r0
	ldrb r0, [r5]
	cmp r0, 0
	bne _0807F426
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r6, 0
	bl __umodsi3
	movs r2, 0xDD
	lsls r2, 3
	adds r1, r4, r2
	strh r0, [r1]
	movs r0, 0x1
	strb r0, [r5]
_0807F426:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807F42C: .4byte gUnknown_08396FC4
_0807F430: .4byte 0x000006ed
	thumb_func_end sub_807F3F8

	thumb_func_start sub_807F434
sub_807F434: @ 807F434
	push {r4,lr}
	ldr r0, _0807F46C @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807F470 @ =0x000006ed
	adds r0, r1, r2
	ldrb r4, [r0]
	cmp r4, 0x1
	bne _0807F494
	movs r0, 0xDD
	lsls r0, 3
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	bne _0807F490
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _0807F494
	bl Random
	ands r4, r0
	cmp r4, 0
	beq _0807F474
	movs r0, 0x57
	bl PlaySE
	b _0807F47A
	.align 2, 0
_0807F46C: .4byte gUnknown_08396FC4
_0807F470: .4byte 0x000006ed
_0807F474:
	movs r0, 0x58
	bl PlaySE
_0807F47A:
	ldr r0, _0807F488 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807F48C @ =0x000006ed
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	b _0807F494
	.align 2, 0
_0807F488: .4byte gUnknown_08396FC4
_0807F48C: .4byte 0x000006ed
_0807F490:
	subs r0, 0x1
	strh r0, [r1]
_0807F494:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_807F434

	thumb_func_start sub_807F49C
sub_807F49C: @ 807F49C
	push {lr}
	ldr r0, _0807F4E8 @ =gUnknown_08396FC4
	ldr r3, [r0]
	ldr r0, _0807F4EC @ =0x000006cc
	adds r1, r3, r0
	movs r2, 0
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0807F4F0 @ =0x000006d2
	adds r0, r3, r1
	strb r2, [r0]
	subs r1, 0x11
	adds r0, r3, r1
	strb r2, [r0]
	ldr r2, _0807F4F4 @ =0x000006c2
	adds r1, r3, r2
	movs r0, 0x14
	strb r0, [r1]
	ldr r1, _0807F4F8 @ =0x000006fb
	adds r0, r3, r1
	ldrb r1, [r0]
	cmp r1, 0
	bne _0807F4E4
	adds r2, 0x2E
	adds r0, r3, r2
	strh r1, [r0]
	adds r2, 0x2
	adds r0, r3, r2
	strh r1, [r0]
	subs r2, 0x4
	adds r0, r3, r2
	strh r1, [r0]
	movs r0, 0
	movs r1, 0x10
	bl sub_807DB64
_0807F4E4:
	pop {r0}
	bx r0
	.align 2, 0
_0807F4E8: .4byte gUnknown_08396FC4
_0807F4EC: .4byte 0x000006cc
_0807F4F0: .4byte 0x000006d2
_0807F4F4: .4byte 0x000006c2
_0807F4F8: .4byte 0x000006fb
	thumb_func_end sub_807F49C

	thumb_func_start sub_807F4FC
sub_807F4FC: @ 807F4FC
	push {r4,lr}
	bl sub_807F49C
	ldr r0, _0807F524 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807F528 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807F51C
	adds r4, r1, r2
_0807F512:
	bl sub_807F52C
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807F512
_0807F51C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F524: .4byte gUnknown_08396FC4
_0807F528: .4byte 0x000006d2
	thumb_func_end sub_807F4FC

	thumb_func_start sub_807F52C
sub_807F52C: @ 807F52C
	push {r4-r6,lr}
	ldr r0, _0807F578 @ =gUnknown_08396FC4
	ldr r6, [r0]
	ldr r0, _0807F57C @ =gSpriteCoordOffsetX
	ldr r1, _0807F580 @ =0x000006f2
	adds r2, r6, r1
	ldrh r0, [r0]
	ldrh r1, [r2]
	subs r0, r1
	movs r1, 0xFF
	ands r0, r1
	ldr r3, _0807F584 @ =0x000006ee
	adds r1, r6, r3
	strh r0, [r1]
	movs r0, 0xDE
	lsls r0, 3
	adds r1, r6, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3
	bls _0807F566
	movs r0, 0
	strh r0, [r1]
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
_0807F566:
	ldr r1, _0807F588 @ =0x000006cc
	adds r5, r6, r1
	ldrh r4, [r5]
	cmp r4, 0
	beq _0807F58C
	cmp r4, 0x1
	beq _0807F5CC
	b _0807F5E2
	.align 2, 0
_0807F578: .4byte gUnknown_08396FC4
_0807F57C: .4byte gSpriteCoordOffsetX
_0807F580: .4byte 0x000006f2
_0807F584: .4byte 0x000006ee
_0807F588: .4byte 0x000006cc
_0807F58C:
	bl sub_807F6E8
	movs r3, 0xDA
	lsls r3, 3
	adds r0, r6, r3
	ldrb r0, [r0]
	cmp r0, 0x6
	bne _0807F5A8
	movs r0, 0xC
	movs r1, 0x8
	movs r2, 0x3
	bl sub_807DBA4
	b _0807F5B2
_0807F5A8:
	movs r0, 0x4
	movs r1, 0x10
	movs r2, 0
	bl sub_807DBA4
_0807F5B2:
	ldr r0, _0807F5C4 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r0, _0807F5C8 @ =0x000006cc
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0807F5E2
	.align 2, 0
_0807F5C4: .4byte gUnknown_08396FC4
_0807F5C8: .4byte 0x000006cc
_0807F5CC:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807F5E2
	ldr r1, _0807F5E8 @ =0x000006d2
	adds r0, r6, r1
	strb r4, [r0]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_0807F5E2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807F5E8: .4byte 0x000006d2
	thumb_func_end sub_807F52C

	thumb_func_start sub_807F5EC
sub_807F5EC: @ 807F5EC
	push {r4,lr}
	ldr r0, _0807F63C @ =gUnknown_08396FC4
	ldr r2, [r0]
	ldr r0, _0807F640 @ =gSpriteCoordOffsetX
	ldr r1, _0807F644 @ =0x000006f2
	adds r3, r2, r1
	ldrh r0, [r0]
	ldrh r1, [r3]
	subs r0, r1
	movs r1, 0xFF
	ands r0, r1
	ldr r4, _0807F648 @ =0x000006ee
	adds r1, r2, r4
	strh r0, [r1]
	movs r0, 0xDE
	lsls r0, 3
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3
	bls _0807F626
	movs r0, 0
	strh r0, [r1]
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
_0807F626:
	ldr r1, _0807F64C @ =0x000006ce
	adds r4, r2, r1
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807F662
	cmp r0, 0x1
	bgt _0807F650
	cmp r0, 0
	beq _0807F656
	b _0807F67A
	.align 2, 0
_0807F63C: .4byte gUnknown_08396FC4
_0807F640: .4byte gSpriteCoordOffsetX
_0807F644: .4byte 0x000006f2
_0807F648: .4byte 0x000006ee
_0807F64C: .4byte 0x000006ce
_0807F650:
	cmp r0, 0x2
	beq _0807F66E
	b _0807F67A
_0807F656:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x3
	bl sub_807DBA4
	b _0807F672
_0807F662:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807F67E
	b _0807F672
_0807F66E:
	bl sub_807F7A4
_0807F672:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0807F67E
_0807F67A:
	movs r0, 0
	b _0807F680
_0807F67E:
	movs r0, 0x1
_0807F680:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807F5EC

	thumb_func_start sub_807F688
sub_807F688: @ 807F688
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _0807F6D4 @ =gSpriteCoordOffsetY
	ldrb r0, [r0]
	strh r0, [r3, 0x26]
	ldr r0, _0807F6D8 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807F6DC @ =0x000006ee
	adds r2, r0, r1
	ldrh r1, [r2]
	adds r1, 0x20
	movs r4, 0x2E
	ldrsh r0, [r3, r4]
	lsls r0, 6
	adds r1, r0
	strh r1, [r3, 0x20]
	lsls r1, 16
	ldr r0, _0807F6E0 @ =0x010f0000
	cmp r1, r0
	ble _0807F6CC
	movs r0, 0xF0
	lsls r0, 1
	adds r1, r0, 0
	ldrh r2, [r2]
	adds r1, r2
	movs r4, 0x2E
	ldrsh r2, [r3, r4]
	movs r0, 0x4
	subs r0, r2
	lsls r0, 6
	subs r1, r0
	ldr r0, _0807F6E4 @ =0x000001ff
	ands r1, r0
	strh r1, [r3, 0x20]
_0807F6CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F6D4: .4byte gSpriteCoordOffsetY
_0807F6D8: .4byte gUnknown_08396FC4
_0807F6DC: .4byte 0x000006ee
_0807F6E0: .4byte 0x010f0000
_0807F6E4: .4byte 0x000001ff
	thumb_func_end sub_807F688

	thumb_func_start sub_807F6E8
sub_807F6E8: @ 807F6E8
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r0, _0807F75C @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807F760 @ =0x000006fb
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807F792
	ldr r0, _0807F764 @ =gUnknown_0839ABA8
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	movs r5, 0
_0807F70C:
	ldr r0, _0807F768 @ =gSpriteTemplate_839AB90
	movs r1, 0
	movs r2, 0
	movs r3, 0xFF
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0807F770
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0807F76C @ =gSprites
	adds r4, r0
	adds r0, r5, 0
	movs r1, 0x5
	bl __umodsi3
	strh r0, [r4, 0x2E]
	lsls r0, 16
	lsrs r0, 10
	adds r0, 0x20
	strh r0, [r4, 0x20]
	adds r0, r5, 0
	movs r1, 0x5
	bl __udivsi3
	lsls r0, 16
	lsrs r0, 10
	adds r0, 0x20
	strh r0, [r4, 0x22]
	ldr r2, _0807F75C @ =gUnknown_08396FC4
	ldr r0, [r2]
	lsls r1, r5, 2
	adds r0, 0xA0
	adds r0, r1
	str r4, [r0]
	b _0807F77E
	.align 2, 0
_0807F75C: .4byte gUnknown_08396FC4
_0807F760: .4byte 0x000006fb
_0807F764: .4byte gUnknown_0839ABA8
_0807F768: .4byte gSpriteTemplate_839AB90
_0807F76C: .4byte gSprites
_0807F770:
	ldr r2, _0807F79C @ =gUnknown_08396FC4
	ldr r1, [r2]
	lsls r0, r5, 2
	adds r1, 0xA0
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_0807F77E:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x13
	bls _0807F70C
	ldr r0, [r2]
	ldr r1, _0807F7A0 @ =0x000006fb
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_0807F792:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F79C: .4byte gUnknown_08396FC4
_0807F7A0: .4byte 0x000006fb
	thumb_func_end sub_807F6E8

	thumb_func_start sub_807F7A4
sub_807F7A4: @ 807F7A4
	push {r4,r5,lr}
	ldr r0, _0807F7EC @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807F7F0 @ =0x000006fb
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807F7E4
	movs r4, 0
	adds r5, r1, 0
	adds r5, 0xA0
_0807F7BA:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0807F7C8
	bl DestroySprite
_0807F7C8:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _0807F7BA
	ldr r0, _0807F7F4 @ =0x00001201
	bl FreeSpriteTilesByTag
	ldr r0, _0807F7EC @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807F7F0 @ =0x000006fb
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_0807F7E4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F7EC: .4byte gUnknown_08396FC4
_0807F7F0: .4byte 0x000006fb
_0807F7F4: .4byte 0x00001201
	thumb_func_end sub_807F7A4

	thumb_func_start sub_807F7F8
sub_807F7F8: @ 807F7F8
	push {lr}
	ldr r0, _0807F844 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r0, _0807F848 @ =0x000006cc
	adds r2, r1, r0
	movs r3, 0
	movs r0, 0
	strh r0, [r2]
	ldr r2, _0807F84C @ =0x000006d2
	adds r0, r1, r2
	strb r3, [r0]
	subs r2, 0x11
	adds r0, r1, r2
	strb r3, [r0]
	ldr r3, _0807F850 @ =0x000006c2
	adds r0, r1, r3
	movs r2, 0x14
	strb r2, [r0]
	adds r3, 0x3C
	adds r0, r1, r3
	strh r2, [r0]
	movs r0, 0xE0
	lsls r0, 3
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _0807F840
	movs r0, 0
	movs r1, 0x10
	bl sub_807DB64
	ldr r1, _0807F854 @ =REG_BLDALPHA
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
_0807F840:
	pop {r0}
	bx r0
	.align 2, 0
_0807F844: .4byte gUnknown_08396FC4
_0807F848: .4byte 0x000006cc
_0807F84C: .4byte 0x000006d2
_0807F850: .4byte 0x000006c2
_0807F854: .4byte REG_BLDALPHA
	thumb_func_end sub_807F7F8

	thumb_func_start sub_807F858
sub_807F858: @ 807F858
	push {r4,lr}
	bl sub_807F7F8
	ldr r0, _0807F880 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807F884 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807F878
	adds r4, r1, r2
_0807F86E:
	bl sub_807F888
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807F86E
_0807F878:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F880: .4byte gUnknown_08396FC4
_0807F884: .4byte 0x000006d2
	thumb_func_end sub_807F858

	thumb_func_start sub_807F888
sub_807F888: @ 807F888
	push {r4,r5,lr}
	ldr r2, _0807F8CC @ =gUnknown_08396FC4
	ldr r1, [r2]
	ldr r0, _0807F8D0 @ =gSpriteCoordOffsetX
	ldrh r0, [r0]
	ldr r3, _0807F8D4 @ =0x000001ff
	ands r3, r0
	ldr r0, _0807F8D8 @ =0x000006fc
	adds r1, r0
	strh r3, [r1]
	cmp r3, 0xEF
	bls _0807F8B4
	adds r4, r1, 0
	adds r1, r3, 0
_0807F8A4:
	adds r3, r1, 0
	subs r3, 0xF0
	adds r1, r3, 0
	lsls r0, r3, 16
	lsrs r0, 16
	cmp r0, 0xEF
	bhi _0807F8A4
	strh r3, [r4]
_0807F8B4:
	ldr r5, [r2]
	ldr r1, _0807F8DC @ =0x000006cc
	adds r4, r5, r1
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807F8EC
	cmp r0, 0x1
	bgt _0807F8E0
	cmp r0, 0
	beq _0807F8E6
	b _0807F928
	.align 2, 0
_0807F8CC: .4byte gUnknown_08396FC4
_0807F8D0: .4byte gSpriteCoordOffsetX
_0807F8D4: .4byte 0x000001ff
_0807F8D8: .4byte 0x000006fc
_0807F8DC: .4byte 0x000006cc
_0807F8E0:
	cmp r0, 0x2
	beq _0807F908
	b _0807F928
_0807F8E6:
	bl sub_807F99C
	b _0807F91A
_0807F8EC:
	movs r1, 0xE0
	lsls r1, 3
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807F8FC
	bl sub_807F9AC
_0807F8FC:
	movs r0, 0x10
	movs r1, 0
	movs r2, 0x1
	bl sub_807DBA4
	b _0807F91A
_0807F908:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807F92C
	ldr r0, _0807F924 @ =0x000006d2
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
_0807F91A:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0807F92C
	.align 2, 0
_0807F924: .4byte 0x000006d2
_0807F928:
	bl sub_807DBE8
_0807F92C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_807F888

	thumb_func_start sub_807F934
sub_807F934: @ 807F934
	push {r4,lr}
	ldr r0, _0807F950 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807F954 @ =0x000006ce
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807F96A
	cmp r0, 0x1
	bgt _0807F958
	cmp r0, 0
	beq _0807F95E
	b _0807F98C
	.align 2, 0
_0807F950: .4byte gUnknown_08396FC4
_0807F954: .4byte 0x000006ce
_0807F958:
	cmp r0, 0x2
	beq _0807F980
	b _0807F98C
_0807F95E:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1
	bl sub_807DBA4
	b _0807F978
_0807F96A:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807F994
	bl sub_807FA54
_0807F978:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0807F994
_0807F980:
	ldr r1, _0807F990 @ =REG_BLDALPHA
	movs r0, 0
	strh r0, [r1]
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807F98C:
	movs r0, 0
	b _0807F996
	.align 2, 0
_0807F990: .4byte REG_BLDALPHA
_0807F994:
	movs r0, 0x1
_0807F996:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807F934

	thumb_func_start sub_807F99C
sub_807F99C: @ 807F99C
	push {lr}
	ldr r0, _0807F9A8 @ =gUnknown_0839ABB0
	bl LoadSpriteSheet
	pop {r0}
	bx r0
	.align 2, 0
_0807F9A8: .4byte gUnknown_0839ABB0
	thumb_func_end sub_807F99C

	thumb_func_start sub_807F9AC
sub_807F9AC: @ 807F9AC
	push {r4,r5,lr}
	ldr r0, _0807FA18 @ =gUnknown_08396FC4
	ldr r0, [r0]
	movs r1, 0xE0
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807FA48
	movs r5, 0
_0807F9C0:
	ldr r0, _0807FA1C @ =gSpriteTemplate_839ABD0
	movs r1, 0
	movs r2, 0
	movs r3, 0x4E
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0807FA24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0807FA20 @ =gSprites
	adds r4, r0
	movs r0, 0
	strh r0, [r4, 0x30]
	adds r0, r5, 0
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	adds r0, r5, 0
	movs r1, 0x5
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x34]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	lsls r0, 6
	adds r0, 0x20
	strh r0, [r4, 0x2E]
	ldr r2, _0807FA18 @ =gUnknown_08396FC4
	ldr r0, [r2]
	lsls r1, r5, 2
	adds r0, 0xF0
	adds r0, r1
	str r4, [r0]
	b _0807FA32
	.align 2, 0
_0807FA18: .4byte gUnknown_08396FC4
_0807FA1C: .4byte gSpriteTemplate_839ABD0
_0807FA20: .4byte gSprites
_0807FA24:
	ldr r2, _0807FA50 @ =gUnknown_08396FC4
	ldr r1, [r2]
	lsls r0, r5, 2
	adds r1, 0xF0
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_0807FA32:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _0807F9C0
	ldr r0, [r2]
	movs r1, 0xE0
	lsls r1, 3
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_0807FA48:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FA50: .4byte gUnknown_08396FC4
	thumb_func_end sub_807F9AC

	thumb_func_start sub_807FA54
sub_807FA54: @ 807FA54
	push {r4,r5,lr}
	ldr r0, _0807FAA0 @ =gUnknown_08396FC4
	ldr r1, [r0]
	movs r2, 0xE0
	lsls r2, 3
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807FA98
	movs r4, 0
	adds r5, r1, 0
	adds r5, 0xF0
_0807FA6C:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0807FA7A
	bl DestroySprite
_0807FA7A:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _0807FA6C
	ldr r0, _0807FAA4 @ =0x00001202
	bl FreeSpriteTilesByTag
	ldr r0, _0807FAA0 @ =gUnknown_08396FC4
	ldr r0, [r0]
	movs r1, 0xE0
	lsls r1, 3
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_0807FA98:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FAA0: .4byte gUnknown_08396FC4
_0807FAA4: .4byte 0x00001202
	thumb_func_end sub_807FA54

	thumb_func_start sub_807FAA8
sub_807FAA8: @ 807FAA8
	push {r4,lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _0807FAC4
	movs r0, 0
	strh r0, [r3, 0x30]
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
_0807FAC4:
	ldr r1, _0807FB10 @ =gSpriteCoordOffsetY
	ldrh r0, [r3, 0x2E]
	ldrh r1, [r1]
	adds r0, r1
	strh r0, [r3, 0x22]
	ldr r0, _0807FB14 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807FB18 @ =0x000006fc
	adds r2, r0, r1
	ldrh r1, [r2]
	adds r1, 0x20
	movs r4, 0x32
	ldrsh r0, [r3, r4]
	lsls r0, 6
	adds r1, r0
	strh r1, [r3, 0x20]
	lsls r1, 16
	ldr r0, _0807FB1C @ =0x010f0000
	cmp r1, r0
	ble _0807FB08
	movs r0, 0xF0
	lsls r0, 1
	adds r1, r0, 0
	ldrh r2, [r2]
	adds r1, r2
	movs r4, 0x32
	ldrsh r2, [r3, r4]
	movs r0, 0x4
	subs r0, r2
	lsls r0, 6
	subs r1, r0
	ldr r0, _0807FB20 @ =0x000001ff
	ands r1, r0
	strh r1, [r3, 0x20]
_0807FB08:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FB10: .4byte gSpriteCoordOffsetY
_0807FB14: .4byte gUnknown_08396FC4
_0807FB18: .4byte 0x000006fc
_0807FB1C: .4byte 0x010f0000
_0807FB20: .4byte 0x000001ff
	thumb_func_end sub_807FAA8

	thumb_func_start sub_807FB24
sub_807FB24: @ 807FB24
	push {r4,lr}
	ldr r0, _0807FB94 @ =gUnknown_08396FC4
	ldr r3, [r0]
	ldr r1, _0807FB98 @ =0x000006cc
	adds r0, r3, r1
	movs r1, 0
	movs r2, 0
	strh r2, [r0]
	ldr r4, _0807FB9C @ =0x000006d2
	adds r0, r3, r4
	strb r1, [r0]
	subs r4, 0x11
	adds r0, r3, r4
	strb r1, [r0]
	ldr r0, _0807FBA0 @ =0x000006c2
	adds r1, r3, r0
	movs r0, 0x14
	strb r0, [r1]
	movs r1, 0xDE
	lsls r1, 3
	adds r0, r3, r1
	strh r2, [r0]
	adds r4, 0x31
	adds r1, r3, r4
	movs r0, 0x1
	strh r0, [r1]
	ldr r1, _0807FBA4 @ =0x00000724
	adds r0, r3, r1
	ldrb r2, [r0]
	cmp r2, 0
	bne _0807FB8E
	adds r4, 0x2A
	adds r0, r3, r4
	strh r2, [r0]
	subs r1, 0x6
	adds r0, r3, r1
	strh r2, [r0]
	adds r4, 0x4
	adds r0, r3, r4
	strh r2, [r0]
	adds r1, 0x4
	adds r0, r3, r1
	strh r2, [r0]
	subs r4, 0x8
	adds r0, r3, r4
	strh r2, [r0]
	subs r1, 0x8
	adds r0, r3, r1
	strh r2, [r0]
	movs r0, 0
	movs r1, 0x10
	bl sub_807DB64
_0807FB8E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FB94: .4byte gUnknown_08396FC4
_0807FB98: .4byte 0x000006cc
_0807FB9C: .4byte 0x000006d2
_0807FBA0: .4byte 0x000006c2
_0807FBA4: .4byte 0x00000724
	thumb_func_end sub_807FB24

	thumb_func_start sub_807FBA8
sub_807FBA8: @ 807FBA8
	push {r4,lr}
	bl sub_807FB24
	ldr r0, _0807FBD0 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807FBD4 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807FBC8
	adds r4, r1, r2
_0807FBBE:
	bl sub_807FBD8
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807FBBE
_0807FBC8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FBD0: .4byte gUnknown_08396FC4
_0807FBD4: .4byte 0x000006d2
	thumb_func_end sub_807FBA8

	thumb_func_start sub_807FBD8
sub_807FBD8: @ 807FBD8
	push {r4,r5,lr}
	bl sub_807FC9C
	ldr r0, _0807FBF8 @ =gUnknown_08396FC4
	ldr r5, [r0]
	ldr r0, _0807FBFC @ =0x000006cc
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807FC0C
	cmp r0, 0x1
	bgt _0807FC00
	cmp r0, 0
	beq _0807FC06
	b _0807FC30
	.align 2, 0
_0807FBF8: .4byte gUnknown_08396FC4
_0807FBFC: .4byte 0x000006cc
_0807FC00:
	cmp r0, 0x2
	beq _0807FC18
	b _0807FC30
_0807FC06:
	bl sub_807FD30
	b _0807FC2A
_0807FC0C:
	movs r0, 0xC
	movs r1, 0x8
	movs r2, 0x8
	bl sub_807DBA4
	b _0807FC2A
_0807FC18:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807FC30
	ldr r0, _0807FC38 @ =0x000006d2
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
_0807FC2A:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807FC30:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FC38: .4byte 0x000006d2
	thumb_func_end sub_807FBD8

	thumb_func_start sub_807FC3C
sub_807FC3C: @ 807FC3C
	push {r4,lr}
	bl sub_807FC9C
	ldr r0, _0807FC5C @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807FC60 @ =0x000006ce
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807FC76
	cmp r0, 0x1
	bgt _0807FC64
	cmp r0, 0
	beq _0807FC6A
	b _0807FC8E
	.align 2, 0
_0807FC5C: .4byte gUnknown_08396FC4
_0807FC60: .4byte 0x000006ce
_0807FC64:
	cmp r0, 0x2
	beq _0807FC82
	b _0807FC8E
_0807FC6A:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1
	bl sub_807DBA4
	b _0807FC86
_0807FC76:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807FC92
	b _0807FC86
_0807FC82:
	bl sub_807FDE8
_0807FC86:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0807FC92
_0807FC8E:
	movs r0, 0
	b _0807FC94
_0807FC92:
	movs r0, 0x1
_0807FC94:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807FC3C

	thumb_func_start sub_807FC9C
sub_807FC9C: @ 807FC9C
	push {r4,r5,lr}
	ldr r0, _0807FD14 @ =gUnknown_08396FC4
	ldr r3, [r0]
	ldr r0, _0807FD18 @ =0x0000071c
	adds r2, r3, r0
	ldrh r0, [r2]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r2]
	ldr r1, _0807FD1C @ =0x0000ffff
	adds r4, r1, 0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bls _0807FCC8
	movs r0, 0xE4
	lsls r0, 3
	adds r1, r3, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	strh r5, [r2]
_0807FCC8:
	ldr r1, _0807FD20 @ =0x0000071e
	adds r2, r3, r1
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	ands r0, r4
	cmp r0, 0x4
	bls _0807FCE4
	ldr r0, _0807FD24 @ =0x00000722
	adds r1, r3, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	strh r5, [r2]
_0807FCE4:
	ldr r0, _0807FD28 @ =gSpriteCoordOffsetX
	movs r2, 0xE4
	lsls r2, 3
	adds r1, r3, r2
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r1
	movs r1, 0xFF
	ands r0, r1
	subs r2, 0x8
	adds r1, r3, r2
	strh r0, [r1]
	ldr r1, _0807FD2C @ =gSpriteCoordOffsetY
	adds r2, 0xA
	adds r0, r3, r2
	ldrh r0, [r0]
	ldrh r1, [r1]
	adds r0, r1
	subs r2, 0x8
	adds r1, r3, r2
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FD14: .4byte gUnknown_08396FC4
_0807FD18: .4byte 0x0000071c
_0807FD1C: .4byte 0x0000ffff
_0807FD20: .4byte 0x0000071e
_0807FD24: .4byte 0x00000722
_0807FD28: .4byte gSpriteCoordOffsetX
_0807FD2C: .4byte gSpriteCoordOffsetY
	thumb_func_end sub_807FC9C

	thumb_func_start sub_807FD30
sub_807FD30: @ 807FD30
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r0, _0807FD9C @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807FDA0 @ =0x00000724
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807FDD6
	ldr r0, _0807FDA4 @ =gUnknown_0839ABE8
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	movs r6, 0
_0807FD54:
	adds r0, r6, 0
	movs r1, 0x5
	bl __udivsi3
	adds r5, r0, 0
	lsls r2, r5, 22
	asrs r2, 16
	ldr r0, _0807FDA8 @ =gSpriteTemplate_839AC04
	movs r1, 0
	movs r3, 0xFF
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0807FDB0
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0807FDAC @ =gSprites
	adds r4, r0
	adds r0, r6, 0
	movs r1, 0x5
	bl __umodsi3
	strh r0, [r4, 0x2E]
	strh r5, [r4, 0x30]
	ldr r2, _0807FD9C @ =gUnknown_08396FC4
	ldr r0, [r2]
	lsls r1, r6, 2
	movs r3, 0xA0
	lsls r3, 1
	adds r0, r3
	adds r0, r1
	str r4, [r0]
	b _0807FDC2
	.align 2, 0
_0807FD9C: .4byte gUnknown_08396FC4
_0807FDA0: .4byte 0x00000724
_0807FDA4: .4byte gUnknown_0839ABE8
_0807FDA8: .4byte gSpriteTemplate_839AC04
_0807FDAC: .4byte gSprites
_0807FDB0:
	ldr r2, _0807FDE0 @ =gUnknown_08396FC4
	ldr r1, [r2]
	lsls r0, r6, 2
	movs r3, 0xA0
	lsls r3, 1
	adds r1, r3
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_0807FDC2:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x13
	bls _0807FD54
	ldr r0, [r2]
	ldr r1, _0807FDE4 @ =0x00000724
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_0807FDD6:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807FDE0: .4byte gUnknown_08396FC4
_0807FDE4: .4byte 0x00000724
	thumb_func_end sub_807FD30

	thumb_func_start sub_807FDE8
sub_807FDE8: @ 807FDE8
	push {r4,r5,lr}
	ldr r0, _0807FE30 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807FE34 @ =0x00000724
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807FE2A
	movs r4, 0
	movs r0, 0xA0
	lsls r0, 1
	adds r5, r1, r0
_0807FE00:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0807FE0E
	bl DestroySprite
_0807FE0E:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _0807FE00
	ldr r0, _0807FE38 @ =0x00001203
	bl FreeSpriteTilesByTag
	ldr r0, _0807FE30 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807FE34 @ =0x00000724
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_0807FE2A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FE30: .4byte gUnknown_08396FC4
_0807FE34: .4byte 0x00000724
_0807FE38: .4byte 0x00001203
	thumb_func_end sub_807FDE8

	thumb_func_start sub_807FE3C
sub_807FE3C: @ 807FE3C
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _0807FE8C @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807FE90 @ =0x0000071a
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r3, 0x26]
	movs r4, 0xE3
	lsls r4, 3
	adds r2, r1, r4
	ldrh r1, [r2]
	adds r1, 0x20
	movs r4, 0x2E
	ldrsh r0, [r3, r4]
	lsls r0, 6
	adds r1, r0
	strh r1, [r3, 0x20]
	lsls r1, 16
	ldr r0, _0807FE94 @ =0x010f0000
	cmp r1, r0
	ble _0807FE84
	movs r0, 0xF0
	lsls r0, 1
	adds r1, r0, 0
	ldrh r2, [r2]
	adds r1, r2
	movs r4, 0x2E
	ldrsh r2, [r3, r4]
	movs r0, 0x4
	subs r0, r2
	lsls r0, 6
	subs r1, r0
	ldr r0, _0807FE98 @ =0x000001ff
	ands r1, r0
	strh r1, [r3, 0x20]
_0807FE84:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FE8C: .4byte gUnknown_08396FC4
_0807FE90: .4byte 0x0000071a
_0807FE94: .4byte 0x010f0000
_0807FE98: .4byte 0x000001ff
	thumb_func_end sub_807FE3C

	thumb_func_start sub_807FE9C
sub_807FE9C: @ 807FE9C
	push {r4,lr}
	ldr r0, _0807FF00 @ =gUnknown_08396FC4
	ldr r3, [r0]
	ldr r0, _0807FF04 @ =0x000006cc
	adds r1, r3, r0
	movs r2, 0
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0807FF08 @ =0x000006d2
	adds r0, r3, r1
	strb r2, [r0]
	ldr r4, _0807FF0C @ =0x000006c1
	adds r0, r3, r4
	strb r2, [r0]
	ldr r0, _0807FF10 @ =0x000006c2
	adds r1, r3, r0
	movs r0, 0x14
	strb r0, [r1]
	ldr r1, _0807FF14 @ =0x00000716
	adds r0, r3, r1
	ldrb r2, [r0]
	cmp r2, 0
	bne _0807FEF8
	adds r4, 0x43
	adds r1, r3, r4
	adds r4, 0x4
	adds r0, r3, r4
	str r2, [r0]
	str r2, [r1]
	ldr r0, _0807FF18 @ =0x00000712
	adds r1, r3, r0
	movs r0, 0x8
	strh r0, [r1]
	adds r4, 0xC
	adds r0, r3, r4
	strh r2, [r0]
	ldrh r2, [r1]
	cmp r2, 0x5F
	bls _0807FEF0
	movs r0, 0x80
	subs r0, r2
	strh r0, [r1]
_0807FEF0:
	movs r0, 0
	movs r1, 0x10
	bl sub_807DB64
_0807FEF8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FF00: .4byte gUnknown_08396FC4
_0807FF04: .4byte 0x000006cc
_0807FF08: .4byte 0x000006d2
_0807FF0C: .4byte 0x000006c1
_0807FF10: .4byte 0x000006c2
_0807FF14: .4byte 0x00000716
_0807FF18: .4byte 0x00000712
	thumb_func_end sub_807FE9C

	thumb_func_start sub_807FF1C
sub_807FF1C: @ 807FF1C
	push {r4,lr}
	bl sub_807FE9C
	ldr r0, _0807FF44 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807FF48 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807FF3C
	adds r4, r1, r2
_0807FF32:
	bl sub_807FF4C
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807FF32
_0807FF3C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FF44: .4byte gUnknown_08396FC4
_0807FF48: .4byte 0x000006d2
	thumb_func_end sub_807FF1C

	thumb_func_start sub_807FF4C
sub_807FF4C: @ 807FF4C
	push {r4,r5,lr}
	bl sub_8080064
	bl sub_808002C
	ldr r0, _0807FF7C @ =gUnknown_08396FC4
	ldr r5, [r0]
	ldr r0, _0807FF80 @ =0x00000712
	adds r1, r5, r0
	ldrh r0, [r1]
	cmp r0, 0x5F
	bls _0807FF68
	movs r0, 0x20
	strh r0, [r1]
_0807FF68:
	ldr r0, _0807FF84 @ =0x000006cc
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807FF98
	cmp r0, 0x1
	bgt _0807FF88
	cmp r0, 0
	beq _0807FF8E
	b _0807FFBC
	.align 2, 0
_0807FF7C: .4byte gUnknown_08396FC4
_0807FF80: .4byte 0x00000712
_0807FF84: .4byte 0x000006cc
_0807FF88:
	cmp r0, 0x2
	beq _0807FFA4
	b _0807FFBC
_0807FF8E:
	bl sub_8080178
	bl sub_8080238
	b _0807FFB6
_0807FF98:
	movs r0, 0x10
	movs r1, 0
	movs r2, 0
	bl sub_807DBA4
	b _0807FFB6
_0807FFA4:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807FFBC
	ldr r0, _0807FFC4 @ =0x000006d2
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
_0807FFB6:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807FFBC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FFC4: .4byte 0x000006d2
	thumb_func_end sub_807FF4C

	thumb_func_start sub_807FFC8
sub_807FFC8: @ 807FFC8
	push {r4,lr}
	bl sub_8080064
	bl sub_808002C
	ldr r0, _0807FFEC @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807FFF0 @ =0x000006ce
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _08080006
	cmp r0, 0x1
	bgt _0807FFF4
	cmp r0, 0
	beq _0807FFFA
	b _0808001E
	.align 2, 0
_0807FFEC: .4byte gUnknown_08396FC4
_0807FFF0: .4byte 0x000006ce
_0807FFF4:
	cmp r0, 0x2
	beq _08080012
	b _0808001E
_0807FFFA:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0
	bl sub_807DBA4
	b _08080016
_08080006:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _08080022
	b _08080016
_08080012:
	bl sub_80800E4
_08080016:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _08080022
_0808001E:
	movs r0, 0
	b _08080024
_08080022:
	movs r0, 0x1
_08080024:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807FFC8

	thumb_func_start sub_808002C
sub_808002C: @ 808002C
	push {lr}
	ldr r0, _08080058 @ =gUnknown_08396FC4
	ldr r2, [r0]
	ldr r0, _0808005C @ =0x00000714
	adds r3, r2, r0
	ldrh r0, [r3]
	adds r1, r0, 0x1
	strh r1, [r3]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4
	bls _08080052
	ldr r1, _08080060 @ =0x00000712
	adds r0, r2, r1
	ldrh r1, [r0]
	adds r1, 0x1
	movs r2, 0
	strh r1, [r0]
	strh r2, [r3]
_08080052:
	pop {r0}
	bx r0
	.align 2, 0
_08080058: .4byte gUnknown_08396FC4
_0808005C: .4byte 0x00000714
_08080060: .4byte 0x00000712
	thumb_func_end sub_808002C

	thumb_func_start sub_8080064
sub_8080064: @ 8080064
	push {r4-r6,lr}
	ldr r0, _080800C8 @ =gUnknown_08396FC4
	ldr r2, [r0]
	ldr r0, _080800CC @ =0x00000704
	adds r4, r2, r0
	ldr r6, _080800D0 @ =gSineTable
	ldr r1, _080800D4 @ =0x00000712
	adds r5, r2, r1
	ldrh r0, [r5]
	lsls r0, 1
	adds r0, r6
	movs r3, 0
	ldrsh r1, [r0, r3]
	lsls r1, 2
	ldr r0, [r4]
	subs r0, r1
	str r0, [r4]
	movs r0, 0xE1
	lsls r0, 3
	adds r3, r2, r0
	ldrh r0, [r5]
	lsls r0, 1
	adds r0, r6
	movs r5, 0
	ldrsh r1, [r0, r5]
	ldr r0, [r3]
	subs r0, r1
	str r0, [r3]
	ldr r1, _080800D8 @ =gSpriteCoordOffsetX
	ldr r0, [r4]
	lsrs r0, 8
	ldrh r1, [r1]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	ldr r4, _080800DC @ =0x0000070e
	adds r1, r2, r4
	strh r0, [r1]
	ldr r1, _080800E0 @ =gSpriteCoordOffsetY
	ldr r0, [r3]
	lsrs r0, 8
	ldrh r1, [r1]
	adds r0, r1
	movs r5, 0xE2
	lsls r5, 3
	adds r2, r5
	strh r0, [r2]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080800C8: .4byte gUnknown_08396FC4
_080800CC: .4byte 0x00000704
_080800D0: .4byte gSineTable
_080800D4: .4byte 0x00000712
_080800D8: .4byte gSpriteCoordOffsetX
_080800DC: .4byte 0x0000070e
_080800E0: .4byte gSpriteCoordOffsetY
	thumb_func_end sub_8080064

	thumb_func_start sub_80800E4
sub_80800E4: @ 80800E4
	push {r4,r5,lr}
	ldr r0, _08080168 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0808016C @ =0x00000716
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _08080126
	movs r4, 0
	movs r0, 0xC8
	lsls r0, 1
	adds r5, r1, r0
_080800FC:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0808010A
	bl DestroySprite
_0808010A:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _080800FC
	ldr r0, _08080168 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0808016C @ =0x00000716
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r0, _08080170 @ =0x00001204
	bl FreeSpriteTilesByTag
_08080126:
	ldr r0, _08080168 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _08080174 @ =0x00000717
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _08080160
	movs r4, 0
	movs r0, 0xF0
	lsls r0, 1
	adds r5, r1, r0
_0808013C:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0808014A
	bl DestroySprite
_0808014A:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _0808013C
	ldr r0, _08080168 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _08080174 @ =0x00000717
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_08080160:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080168: .4byte gUnknown_08396FC4
_0808016C: .4byte 0x00000716
_08080170: .4byte 0x00001204
_08080174: .4byte 0x00000717
	thumb_func_end sub_80800E4

	thumb_func_start sub_8080178
sub_8080178: @ 8080178
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r0, _080801E8 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _080801EC @ =0x00000716
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08080226
	ldr r0, _080801F0 @ =gUnknown_0839AC54
	bl LoadSpriteSheet
	ldr r0, _080801F4 @ =gUnknown_08397128
	bl sub_807D8C0
	movs r7, 0
_08080198:
	adds r0, r7, 0
	movs r1, 0x5
	bl __udivsi3
	adds r6, r0, 0
	lsls r2, r6, 22
	asrs r2, 16
	ldr r0, _080801F8 @ =gSpriteTemplate_839AC3C
	movs r1, 0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08080200
	ldr r2, _080801E8 @ =gUnknown_08396FC4
	ldr r5, [r2]
	lsls r0, r7, 2
	movs r3, 0xC8
	lsls r3, 1
	adds r5, r3
	adds r5, r0
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	ldr r0, _080801FC @ =gSprites
	adds r4, r0
	str r4, [r5]
	adds r0, r7, 0
	movs r1, 0x5
	str r2, [sp]
	bl __umodsi3
	strh r0, [r4, 0x2E]
	ldr r0, [r5]
	strh r6, [r0, 0x30]
	ldr r2, [sp]
	b _08080212
	.align 2, 0
_080801E8: .4byte gUnknown_08396FC4
_080801EC: .4byte 0x00000716
_080801F0: .4byte gUnknown_0839AC54
_080801F4: .4byte gUnknown_08397128
_080801F8: .4byte gSpriteTemplate_839AC3C
_080801FC: .4byte gSprites
_08080200:
	ldr r2, _08080230 @ =gUnknown_08396FC4
	ldr r1, [r2]
	lsls r0, r7, 2
	movs r3, 0xC8
	lsls r3, 1
	adds r1, r3
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_08080212:
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x13
	bls _08080198
	ldr r0, [r2]
	ldr r1, _08080234 @ =0x00000716
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_08080226:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080230: .4byte gUnknown_08396FC4
_08080234: .4byte 0x00000716
	thumb_func_end sub_8080178

	thumb_func_start sub_8080238
sub_8080238: @ 8080238
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r4, _080802E0 @ =gUnknown_08396FC4
	ldr r0, [r4]
	ldr r1, _080802E4 @ =0x00000717
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08080324
	movs r7, 0
	mov r9, r4
	movs r2, 0
	mov r10, r2
_08080258:
	lsls r0, r7, 1
	mov r8, r0
	adds r6, r0, r7
	lsls r5, r6, 4
	adds r1, r5, 0
	adds r1, 0x18
	lsls r1, 16
	asrs r1, 16
	ldr r0, _080802E8 @ =gSpriteTemplate_839AC3C
	movs r2, 0xD0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080802FC
	mov r2, r9
	ldr r4, [r2]
	lsls r0, r7, 2
	movs r2, 0xF0
	lsls r2, 1
	adds r4, r2
	adds r4, r0
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	ldr r0, _080802EC @ =gSprites
	adds r2, r0
	str r2, [r4]
	ldrb r1, [r2, 0x3]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x3]
	ldr r1, [r4]
	adds r0, r6, r5
	strh r0, [r1, 0x30]
	ldr r1, [r4]
	movs r0, 0x8
	strh r0, [r1, 0x2E]
	ldr r0, [r4]
	mov r1, r10
	strh r1, [r0, 0x32]
	ldr r1, [r4]
	ldr r0, _080802F0 @ =0x00006730
	strh r0, [r1, 0x36]
	ldr r1, [r4]
	ldr r0, _080802F4 @ =gUnknown_0839AC5C
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r1, 0x34]
	ldr r0, [r4]
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, [r4]
	movs r1, 0
	movs r2, 0x2
	movs r3, 0
	bl CalcCenterToCornerVec
	ldr r1, [r4]
	ldr r0, _080802F8 @ =sub_8080398
	str r0, [r1, 0x1C]
	b _0808030E
	.align 2, 0
_080802E0: .4byte gUnknown_08396FC4
_080802E4: .4byte 0x00000717
_080802E8: .4byte gSpriteTemplate_839AC3C
_080802EC: .4byte gSprites
_080802F0: .4byte 0x00006730
_080802F4: .4byte gUnknown_0839AC5C
_080802F8: .4byte sub_8080398
_080802FC:
	mov r2, r9
	ldr r0, [r2]
	lsls r1, r7, 2
	movs r2, 0xF0
	lsls r2, 1
	adds r0, r2
	adds r0, r1
	mov r1, r10
	str r1, [r0]
_0808030E:
	mov r2, r9
	ldr r0, [r2]
	ldr r1, _08080334 @ =0x00000717
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x4
	bls _08080258
_08080324:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080334: .4byte 0x00000717
	thumb_func_end sub_8080238

	thumb_func_start sub_8080338
sub_8080338: @ 8080338
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _08080388 @ =gUnknown_08396FC4
	ldr r1, [r0]
	movs r2, 0xE2
	lsls r2, 3
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r3, 0x26]
	ldr r4, _0808038C @ =0x0000070e
	adds r2, r1, r4
	ldrh r1, [r2]
	adds r1, 0x20
	movs r4, 0x2E
	ldrsh r0, [r3, r4]
	lsls r0, 6
	adds r1, r0
	strh r1, [r3, 0x20]
	lsls r1, 16
	ldr r0, _08080390 @ =0x010f0000
	cmp r1, r0
	ble _08080380
	movs r0, 0xF0
	lsls r0, 1
	adds r1, r0, 0
	ldrh r2, [r2]
	adds r1, r2
	movs r4, 0x2E
	ldrsh r2, [r3, r4]
	movs r0, 0x4
	subs r0, r2
	lsls r0, 6
	subs r1, r0
	ldr r0, _08080394 @ =0x000001ff
	ands r1, r0
	strh r1, [r3, 0x20]
_08080380:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080388: .4byte gUnknown_08396FC4
_0808038C: .4byte 0x0000070e
_08080390: .4byte 0x010f0000
_08080394: .4byte 0x000001ff
	thumb_func_end sub_8080338

	thumb_func_start sub_8080398
sub_8080398: @ 8080398
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x34]
	subs r0, 0x1
	strh r0, [r2, 0x34]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080803B2
	ldr r0, _080803B8 @ =sub_80803BC
	str r0, [r2, 0x1C]
_080803B2:
	pop {r0}
	bx r0
	.align 2, 0
_080803B8: .4byte sub_80803BC
	thumb_func_end sub_8080398

	thumb_func_start sub_80803BC
sub_80803BC: @ 80803BC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x22]
	subs r0, 0x1
	strh r0, [r5, 0x22]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x30
	negs r1, r1
	cmp r0, r1
	bge _080803DA
	movs r0, 0xD0
	strh r0, [r5, 0x22]
	movs r0, 0x4
	strh r0, [r5, 0x2E]
_080803DA:
	movs r0, 0x2E
	ldrsh r4, [r5, r0]
	ldr r3, _0808042C @ =gSineTable
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	lsls r0, r1, 1
	adds r0, r3
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r2, r4, 0
	muls r2, r0
	adds r1, 0x40
	lsls r1, 1
	adds r1, r3
	movs r3, 0
	ldrsh r0, [r1, r3]
	muls r0, r4
	lsrs r2, 8
	strh r2, [r5, 0x24]
	lsrs r0, 8
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x30]
	adds r0, 0xA
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _08080426
	movs r0, 0
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
_08080426:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808042C: .4byte gSineTable
	thumb_func_end sub_80803BC

	thumb_func_start sub_8080430
sub_8080430: @ 8080430
	ldr r0, _08080450 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r0, _08080454 @ =0x000006cc
	adds r2, r1, r0
	movs r0, 0
	strh r0, [r2]
	ldr r0, _08080458 @ =0x000006c1
	adds r2, r1, r0
	movs r0, 0x3
	strb r0, [r2]
	ldr r0, _0808045C @ =0x000006c2
	adds r1, r0
	movs r0, 0x14
	strb r0, [r1]
	bx lr
	.align 2, 0
_08080450: .4byte gUnknown_08396FC4
_08080454: .4byte 0x000006cc
_08080458: .4byte 0x000006c1
_0808045C: .4byte 0x000006c2
	thumb_func_end sub_8080430

	thumb_func_start sub_8080460
sub_8080460: @ 8080460
	push {lr}
	bl sub_8080430
	pop {r0}
	bx r0
	thumb_func_end sub_8080460

	thumb_func_start nullsub_56
nullsub_56: @ 808046C
	bx lr
	thumb_func_end nullsub_56

	thumb_func_start sub_8080470
sub_8080470: @ 8080470
	movs r0, 0
	bx lr
	thumb_func_end sub_8080470

	thumb_func_start sub_8080474
sub_8080474: @ 8080474
	push {r4,r5,lr}
	bl sub_807F49C
	ldr r0, _080804B4 @ =gUnknown_08396FC4
	ldr r4, [r0]
	ldr r1, _080804B8 @ =0x0000072e
	adds r0, r4, r1
	ldrb r5, [r0]
	cmp r5, 0
	bne _080804AC
	ldr r0, _080804BC @ =gUnknown_0839AC70
	bl LoadSpriteSheet
	movs r2, 0xE5
	lsls r2, 3
	adds r0, r4, r2
	strh r5, [r0]
	ldr r0, _080804C0 @ =gUnknown_0839AC68
	ldrb r1, [r0]
	subs r2, 0x2
	adds r0, r4, r2
	strh r1, [r0]
	ldr r1, _080804C4 @ =0x0000072a
	adds r0, r4, r1
	strh r5, [r0]
	adds r2, 0x6
	adds r0, r4, r2
	strh r5, [r0]
_080804AC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080804B4: .4byte gUnknown_08396FC4
_080804B8: .4byte 0x0000072e
_080804BC: .4byte gUnknown_0839AC70
_080804C0: .4byte gUnknown_0839AC68
_080804C4: .4byte 0x0000072a
	thumb_func_end sub_8080474

	thumb_func_start sub_80804C8
sub_80804C8: @ 80804C8
	push {r4,lr}
	bl sub_8080474
	ldr r0, _080804F0 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _080804F4 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080804E8
	adds r4, r1, r2
_080804DE:
	bl sub_80804F8
	ldrb r0, [r4]
	cmp r0, 0
	beq _080804DE
_080804E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080804F0: .4byte gUnknown_08396FC4
_080804F4: .4byte 0x000006d2
	thumb_func_end sub_80804C8

	thumb_func_start sub_80804F8
sub_80804F8: @ 80804F8
	push {r4-r7,lr}
	bl sub_807F52C
	ldr r0, _08080558 @ =gUnknown_08396FC4
	ldr r5, [r0]
	ldr r0, _0808055C @ =0x00000726
	adds r4, r5, r0
	ldrh r0, [r4]
	adds r0, 0x1
	movs r6, 0
	strh r0, [r4]
	ldr r1, _08080560 @ =0x0000ffff
	adds r7, r1, 0
	ldr r2, _08080564 @ =gUnknown_0839AC68
	movs r1, 0xE5
	lsls r1, 3
	adds r3, r5, r1
	ldrh r1, [r3]
	adds r1, r2
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1]
	cmp r0, r1
	bls _08080550
	strh r6, [r4]
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
	ands r0, r7
	cmp r0, 0x7
	bls _08080538
	strh r6, [r3]
_08080538:
	ldr r0, _08080568 @ =0x0000072a
	adds r4, r5, r0
	ldrh r0, [r4]
	bl sub_8080588
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	ands r0, r7
	cmp r0, 0xC
	bls _08080550
	strh r6, [r4]
_08080550:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080558: .4byte gUnknown_08396FC4
_0808055C: .4byte 0x00000726
_08080560: .4byte 0x0000ffff
_08080564: .4byte gUnknown_0839AC68
_08080568: .4byte 0x0000072a
	thumb_func_end sub_80804F8

	thumb_func_start sub_808056C
sub_808056C: @ 808056C
	push {lr}
	bl sub_807F5EC
	lsls r0, 24
	cmp r0, 0
	beq _0808057C
	movs r0, 0x1
	b _08080582
_0808057C:
	bl sub_8080610
	movs r0, 0
_08080582:
	pop {r1}
	bx r1
	thumb_func_end sub_808056C

	thumb_func_start sub_8080588
sub_8080588: @ 8080588
	push {r4,lr}
	lsls r0, 16
	ldr r1, _080805F8 @ =gUnknown_0839AC78
	lsrs r0, 14
	adds r3, r0, r1
	adds r1, 0x2
	adds r0, r1
	ldr r1, _080805FC @ =gSpriteCoordOffsetY
	ldrh r2, [r0]
	ldrh r0, [r1]
	subs r2, r0
	ldr r0, _08080600 @ =gSpriteTemplate_839ACBC
	movs r4, 0
	ldrsh r1, [r3, r4]
	lsls r2, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080805F0
	ldr r0, _08080604 @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1, 0x5]
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r3]
	movs r0, 0
	strh r0, [r1, 0x2E]
	strh r0, [r1, 0x30]
	strh r0, [r1, 0x32]
	ldr r0, _08080608 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r0, _0808060C @ =0x0000072c
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080805F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080805F8: .4byte gUnknown_0839AC78
_080805FC: .4byte gSpriteCoordOffsetY
_08080600: .4byte gSpriteTemplate_839ACBC
_08080604: .4byte gSprites
_08080608: .4byte gUnknown_08396FC4
_0808060C: .4byte 0x0000072c
	thumb_func_end sub_8080588

	thumb_func_start sub_8080610
sub_8080610: @ 8080610
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _08080648 @ =gSprites
_08080616:
	lsls r0, r4, 4
	adds r0, r4
	lsls r2, r0, 2
	adds r0, r5, 0
	adds r0, 0x14
	adds r0, r2, r0
	ldr r1, [r0]
	ldr r0, _0808064C @ =gSpriteTemplate_839ACBC
	cmp r1, r0
	bne _08080630
	adds r0, r2, r5
	bl DestroySprite
_08080630:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3F
	bls _08080616
	ldr r0, _08080650 @ =0x00001205
	bl FreeSpriteTilesByTag
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080648: .4byte gSprites
_0808064C: .4byte gSpriteTemplate_839ACBC
_08080650: .4byte 0x00001205
	thumb_func_end sub_8080610

	thumb_func_start unc_0807DAB4
unc_0807DAB4: @ 8080654
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x2E]
	movs r2, 0
	adds r0, 0x2
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _08080694
	strh r2, [r1, 0x2E]
	movs r3, 0x30
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _08080686
	ldrh r0, [r1, 0x24]
	adds r0, 0x1
	strh r0, [r1, 0x24]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _08080694
	movs r0, 0x1
	strh r0, [r1, 0x30]
	b _08080694
_08080686:
	ldrh r0, [r1, 0x24]
	subs r0, 0x1
	strh r0, [r1, 0x24]
	lsls r0, 16
	cmp r0, 0
	bgt _08080694
	strh r2, [r1, 0x30]
_08080694:
	ldrh r0, [r1, 0x22]
	subs r0, 0x3
	strh r0, [r1, 0x22]
	ldrh r0, [r1, 0x32]
	adds r0, 0x1
	strh r0, [r1, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x77
	ble _080806AE
	adds r0, r1, 0
	bl DestroySprite
_080806AE:
	pop {r0}
	bx r0
	thumb_func_end unc_0807DAB4

	thumb_func_start SetSav1Weather
SetSav1Weather: @ 80806B4
	push {r4,r5,lr}
	ldr r4, _080806D4 @ =gSaveBlock1
	adds r4, 0x2E
	ldrb r5, [r4]
	lsls r0, 24
	lsrs r0, 24
	bl TranslateWeatherNum
	strb r0, [r4]
	ldrb r0, [r4]
	adds r1, r5, 0
	bl UpdateRainCounter
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080806D4: .4byte gSaveBlock1
	thumb_func_end SetSav1Weather

	thumb_func_start GetSav1Weather
GetSav1Weather: @ 80806D8
	ldr r0, _080806E0 @ =gSaveBlock1
	adds r0, 0x2E
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080806E0: .4byte gSaveBlock1
	thumb_func_end GetSav1Weather

	thumb_func_start sub_80806E4
sub_80806E4: @ 80806E4
	push {r4,r5,lr}
	ldr r4, _08080704 @ =gSaveBlock1
	adds r4, 0x2E
	ldrb r5, [r4]
	ldr r0, _08080708 @ =gMapHeader
	ldrb r0, [r0, 0x16]
	bl TranslateWeatherNum
	strb r0, [r4]
	ldrb r0, [r4]
	adds r1, r5, 0
	bl UpdateRainCounter
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080704: .4byte gSaveBlock1
_08080708: .4byte gMapHeader
	thumb_func_end sub_80806E4

	thumb_func_start SetWeather
SetWeather: @ 808070C
	push {lr}
	bl SetSav1Weather
	bl GetSav1Weather
	lsls r0, 24
	lsrs r0, 24
	bl DoWeatherEffect
	pop {r0}
	bx r0
	thumb_func_end SetWeather

	thumb_func_start SetWeather_Unused
SetWeather_Unused: @ 8080724
	push {lr}
	bl SetSav1Weather
	bl GetSav1Weather
	lsls r0, 24
	lsrs r0, 24
	bl sub_807C988
	pop {r0}
	bx r0
	thumb_func_end SetWeather_Unused

	thumb_func_start DoCurrentWeather
DoCurrentWeather: @ 808073C
	push {lr}
	bl GetSav1Weather
	lsls r0, 24
	lsrs r0, 24
	bl DoWeatherEffect
	pop {r0}
	bx r0
	thumb_func_end DoCurrentWeather

	thumb_func_start sub_8080750
sub_8080750: @ 8080750
	push {lr}
	bl GetSav1Weather
	lsls r0, 24
	lsrs r0, 24
	bl sub_807C988
	pop {r0}
	bx r0
	thumb_func_end sub_8080750

	thumb_func_start TranslateWeatherNum
TranslateWeatherNum: @ 8080764
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x15
	bhi _0808082C
	lsls r0, 2
	ldr r1, _08080778 @ =_0808077C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08080778: .4byte _0808077C
	.align 2, 0
_0808077C:
	.4byte _0808082C
	.4byte _080807D4
	.4byte _080807D8
	.4byte _080807DC
	.4byte _080807E0
	.4byte _080807E4
	.4byte _080807E8
	.4byte _080807EC
	.4byte _080807F0
	.4byte _080807F4
	.4byte _080807F8
	.4byte _080807FC
	.4byte _08080800
	.4byte _08080804
	.4byte _08080808
	.4byte _0808082C
	.4byte _0808082C
	.4byte _0808082C
	.4byte _0808082C
	.4byte _0808082C
	.4byte _0808080C
	.4byte _08080814
_080807D4:
	movs r0, 0x1
	b _0808082E
_080807D8:
	movs r0, 0x2
	b _0808082E
_080807DC:
	movs r0, 0x3
	b _0808082E
_080807E0:
	movs r0, 0x4
	b _0808082E
_080807E4:
	movs r0, 0x5
	b _0808082E
_080807E8:
	movs r0, 0x6
	b _0808082E
_080807EC:
	movs r0, 0x7
	b _0808082E
_080807F0:
	movs r0, 0x8
	b _0808082E
_080807F4:
	movs r0, 0x9
	b _0808082E
_080807F8:
	movs r0, 0xA
	b _0808082E
_080807FC:
	movs r0, 0xB
	b _0808082E
_08080800:
	movs r0, 0xC
	b _0808082E
_08080804:
	movs r0, 0xD
	b _0808082E
_08080808:
	movs r0, 0xE
	b _0808082E
_0808080C:
	ldr r1, _08080810 @ =gUnknown_0839ACD4
	b _08080816
	.align 2, 0
_08080810: .4byte gUnknown_0839ACD4
_08080814:
	ldr r1, _08080824 @ =gUnknown_0839ACD8
_08080816:
	ldr r0, _08080828 @ =gSaveBlock1
	adds r0, 0x2F
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	b _0808082E
	.align 2, 0
_08080824: .4byte gUnknown_0839ACD8
_08080828: .4byte gSaveBlock1
_0808082C:
	movs r0, 0
_0808082E:
	pop {r1}
	bx r1
	thumb_func_end TranslateWeatherNum

	thumb_func_start sub_8080834
sub_8080834: @ 8080834
	lsls r0, 16
	ldr r2, _08080850 @ =gSaveBlock1
	adds r2, 0x2F
	lsrs r0, 16
	ldrb r1, [r2]
	adds r0, r1
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	lsrs r1, 16
	strb r1, [r2]
	bx lr
	.align 2, 0
_08080850: .4byte gSaveBlock1
	thumb_func_end sub_8080834

	thumb_func_start UpdateRainCounter
UpdateRainCounter: @ 8080854
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r2, r0, 24
	cmp r0, r1
	beq _0808086E
	cmp r2, 0x3
	beq _08080868
	cmp r2, 0x5
	bne _0808086E
_08080868:
	movs r0, 0x28
	bl sav12_xor_increment
_0808086E:
	pop {r0}
	bx r0
	thumb_func_end UpdateRainCounter

	.align 2, 0 @ Don't pad with nop.
