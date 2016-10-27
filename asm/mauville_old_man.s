	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_80F7A34
sub_80F7A34: @ 80F7A34
	push {r4,lr}
	ldr r0, _080F7A64 @ =gSaveBlock1 + 0x2D94
	movs r1, 0
	strb r1, [r0]
	adds r2, r0, 0
	adds r2, 0x29
	strb r1, [r2]
	movs r2, 0
	adds r4, r0, 0x2
	ldr r3, _080F7A68 @ =gUnknown_083E537C
_080F7A48:
	lsls r0, r2, 1
	adds r1, r4, r0
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x5
	bls _080F7A48
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F7A64: .4byte gSaveBlock1 + 0x2D94
_080F7A68: .4byte gUnknown_083E537C
	thumb_func_end sub_80F7A34

	thumb_func_start sub_80F7A6C
sub_80F7A6C: @ 80F7A6C
	ldr r0, _080F7A78 @ =gSaveBlock1 + 0x2D94
	movs r2, 0
	movs r1, 0x1
	strb r1, [r0]
	strb r2, [r0, 0x1]
	bx lr
	.align 2, 0
_080F7A78: .4byte gSaveBlock1 + 0x2D94
	thumb_func_end sub_80F7A6C

	thumb_func_start sub_80F7A7C
sub_80F7A7C: @ 80F7A7C
	push {lr}
	bl sub_80F83F8
	pop {r0}
	bx r0
	thumb_func_end sub_80F7A7C

	thumb_func_start sub_80F7A88
sub_80F7A88: @ 80F7A88
	ldr r0, _080F7A94 @ =gSaveBlock1 + 0x2D94
	movs r2, 0
	movs r1, 0x4
	strb r1, [r0]
	strb r2, [r0, 0x1]
	bx lr
	.align 2, 0
_080F7A94: .4byte gSaveBlock1 + 0x2D94
	thumb_func_end sub_80F7A88

	thumb_func_start sub_80F7A98
sub_80F7A98: @ 80F7A98
	push {lr}
	bl sub_81099CC
	pop {r0}
	bx r0
	thumb_func_end sub_80F7A98

	thumb_func_start sub_80F7AA4
sub_80F7AA4: @ 80F7AA4
	push {lr}
	ldr r0, _080F7AC8 @ =gSaveBlock2
	ldrb r1, [r0, 0xB]
	lsls r1, 8
	ldrb r0, [r0, 0xA]
	orrs r0, r1
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 17
	cmp r0, 0x4
	bhi _080F7B00
	lsls r0, 2
	ldr r1, _080F7ACC @ =_080F7AD0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F7AC8: .4byte gSaveBlock2
_080F7ACC: .4byte _080F7AD0
	.align 2, 0
_080F7AD0:
	.4byte _080F7AE4
	.4byte _080F7AEA
	.4byte _080F7AF0
	.4byte _080F7AF6
	.4byte _080F7AFC
_080F7AE4:
	bl sub_80F7A34
	b _080F7B00
_080F7AEA:
	bl sub_80F7A6C
	b _080F7B00
_080F7AF0:
	bl sub_80F7A98
	b _080F7B00
_080F7AF6:
	bl sub_80F7A7C
	b _080F7B00
_080F7AFC:
	bl sub_80F7A88
_080F7B00:
	bl sub_80F83D0
	pop {r0}
	bx r0
	thumb_func_end sub_80F7AA4

	thumb_func_start GetCurrentMauvilleOldMan
GetCurrentMauvilleOldMan: @ 80F7B08
	ldr r0, _080F7B10 @ =gSaveBlock1 + 0x2D94
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080F7B10: .4byte gSaveBlock1 + 0x2D94
	thumb_func_end GetCurrentMauvilleOldMan

	thumb_func_start sub_80F7B14
sub_80F7B14: @ 80F7B14
	push {r4,lr}
	ldr r4, _080F7B28 @ =gScriptResult
	bl GetCurrentMauvilleOldMan
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F7B28: .4byte gScriptResult
	thumb_func_end sub_80F7B14

	thumb_func_start sub_80F7B2C
sub_80F7B2C: @ 80F7B2C
	ldr r0, _080F7B38 @ =gScriptResult
	ldr r1, _080F7B3C @ =gSaveBlock1 + 0x2D94
	adds r1, 0x29
	ldrb r1, [r1]
	strh r1, [r0]
	bx lr
	.align 2, 0
_080F7B38: .4byte gScriptResult
_080F7B3C: .4byte gSaveBlock1 + 0x2D94
	thumb_func_end sub_80F7B2C

	thumb_func_start sub_80F7B40
sub_80F7B40: @ 80F7B40
	push {r4,r5,lr}
	ldr r5, _080F7B98 @ =gSaveBlock1 + 0x2D94
	adds r0, r5, 0
	adds r0, 0x1A
	ldr r4, _080F7B9C @ =gSaveBlock2
	adds r1, r4, 0
	bl StringCopy
	movs r2, 0
	adds r3, r5, 0
	adds r3, 0x25
	adds r4, 0xA
_080F7B58:
	adds r1, r3, r2
	adds r0, r2, r4
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x3
	bls _080F7B58
	movs r2, 0
	movs r0, 0x29
	adds r0, r5
	mov r12, r0
	adds r4, r5, 0x2
	adds r3, r5, 0
	adds r3, 0xE
_080F7B78:
	lsls r0, r2, 1
	adds r1, r4, r0
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x5
	bls _080F7B78
	movs r0, 0x1
	mov r1, r12
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F7B98: .4byte gSaveBlock1 + 0x2D94
_080F7B9C: .4byte gSaveBlock2
	thumb_func_end sub_80F7B40

	thumb_func_start sub_80F7BA0
sub_80F7BA0: @ 80F7BA0
	push {r4-r7,lr}
	ldr r1, _080F7C48 @ =gSaveBlock1 + 0x2D94
	ldr r0, _080F7C4C @ =gUnknown_0202E8CC
	ldrh r0, [r0]
	adds r5, r1, 0
	adds r5, 0xE
	cmp r0, 0
	bne _080F7BB2
	adds r5, r1, 0x2
_080F7BB2:
	ldr r2, _080F7C50 @ =gStringVar4
	adds r4, r2, 0
	movs r6, 0
_080F7BB8:
	ldrh r1, [r5]
	adds r5, 0x2
	adds r0, r2, 0
	bl sub_80EB3FC
	adds r2, r0, 0
	adds r7, r6, 0x1
	cmp r2, r4
	beq _080F7BDA
	movs r1, 0x37
_080F7BCC:
	ldrb r0, [r4]
	cmp r0, 0
	bne _080F7BD4
	strb r1, [r4]
_080F7BD4:
	adds r4, 0x1
	cmp r2, r4
	bne _080F7BCC
_080F7BDA:
	adds r4, 0x1
	movs r0, 0
	strb r0, [r2]
	adds r2, 0x1
	ldrh r1, [r5]
	adds r5, 0x2
	adds r0, r2, 0
	bl sub_80EB3FC
	adds r2, r0, 0
	cmp r2, r4
	beq _080F7C02
	movs r1, 0x37
_080F7BF4:
	ldrb r0, [r4]
	cmp r0, 0
	bne _080F7BFC
	strb r1, [r4]
_080F7BFC:
	adds r4, 0x1
	cmp r2, r4
	bne _080F7BF4
_080F7C02:
	adds r4, 0x1
	movs r0, 0xFE
	strb r0, [r2]
	adds r2, 0x1
	ldrh r1, [r5]
	adds r5, 0x2
	adds r0, r2, 0
	bl sub_80EB3FC
	adds r2, r0, 0
	cmp r2, r4
	beq _080F7C2A
	movs r1, 0x37
_080F7C1C:
	ldrb r0, [r4]
	cmp r0, 0
	bne _080F7C24
	strb r1, [r4]
_080F7C24:
	adds r4, 0x1
	cmp r2, r4
	bne _080F7C1C
_080F7C2A:
	cmp r6, 0
	bne _080F7C3A
	movs r0, 0xFC
	strb r0, [r2]
	adds r2, 0x1
	movs r0, 0xF
	strb r0, [r2]
	adds r2, 0x1
_080F7C3A:
	lsls r0, r7, 16
	lsrs r6, r0, 16
	cmp r6, 0x1
	bls _080F7BB8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F7C48: .4byte gSaveBlock1 + 0x2D94
_080F7C4C: .4byte gUnknown_0202E8CC
_080F7C50: .4byte gStringVar4
	thumb_func_end sub_80F7BA0

	thumb_func_start sub_80F7C54
sub_80F7C54: @ 80F7C54
	push {lr}
	ldr r0, _080F7C6C @ =gUnknown_0202E8CC
	ldrb r0, [r0]
	bl sub_80F7F80
	bl MenuDisplayMessageBox
	bl ScriptContext1_Stop
	pop {r0}
	bx r0
	.align 2, 0
_080F7C6C: .4byte gUnknown_0202E8CC
	thumb_func_end sub_80F7C54

	thumb_func_start sub_80F7C70
sub_80F7C70: @ 80F7C70
	ldr r0, _080F7C7C @ =gScriptResult
	ldr r1, _080F7C80 @ =gSaveBlock1 + 0x2D94
	ldrb r1, [r1, 0x1]
	strh r1, [r0]
	bx lr
	.align 2, 0
_080F7C7C: .4byte gScriptResult
_080F7C80: .4byte gSaveBlock1 + 0x2D94
	thumb_func_end sub_80F7C70

	thumb_func_start sub_80F7C84
sub_80F7C84: @ 80F7C84
	ldr r1, _080F7C8C @ =gSaveBlock1 + 0x2D94
	movs r0, 0x1
	strb r0, [r1, 0x1]
	bx lr
	.align 2, 0
_080F7C8C: .4byte gSaveBlock1 + 0x2D94
	thumb_func_end sub_80F7C84

	thumb_func_start sub_80F7C90
sub_80F7C90: @ 80F7C90
	push {lr}
	bl sub_80EB8EC
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _080F7CA8 @ =0x0000ffff
	cmp r1, r0
	bne _080F7CB0
	ldr r1, _080F7CAC @ =gScriptResult
	movs r0, 0
	b _080F7CBA
	.align 2, 0
_080F7CA8: .4byte 0x0000ffff
_080F7CAC: .4byte gScriptResult
_080F7CB0:
	ldr r0, _080F7CC0 @ =gStringVar1
	bl sub_80EB3FC
	ldr r1, _080F7CC4 @ =gScriptResult
	movs r0, 0x1
_080F7CBA:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080F7CC0: .4byte gStringVar1
_080F7CC4: .4byte gScriptResult
	thumb_func_end sub_80F7C90

	thumb_func_start sub_80F7CC8
sub_80F7CC8: @ 80F7CC8
	push {lr}
	ldr r2, _080F7CDC @ =gSaveBlock1 + 0x2D94
	ldrb r0, [r2, 0x1]
	cmp r0, 0xA
	bne _080F7CE4
	ldr r1, _080F7CE0 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	strb r0, [r2, 0x1]
	b _080F7CEA
	.align 2, 0
_080F7CDC: .4byte gSaveBlock1 + 0x2D94
_080F7CE0: .4byte gScriptResult
_080F7CE4:
	ldr r1, _080F7CF0 @ =gScriptResult
	movs r0, 0x1
	strh r0, [r1]
_080F7CEA:
	pop {r0}
	bx r0
	.align 2, 0
_080F7CF0: .4byte gScriptResult
	thumb_func_end sub_80F7CC8

	thumb_func_start sub_80F7CF4
sub_80F7CF4: @ 80F7CF4
	push {r4-r6,lr}
	ldr r5, _080F7D50 @ =gSaveBlock1 + 0x2D94
	ldrb r0, [r5, 0x1]
	cmp r0, 0
	bne _080F7D02
	bl sub_80F7DC0
_080F7D02:
	ldrb r0, [r5, 0x1]
	lsls r0, 1
	adds r6, r5, 0x4
	adds r0, r6
	ldrh r1, [r0]
	ldr r0, _080F7D54 @ =0x0000ffff
	cmp r1, r0
	beq _080F7D68
	bl Random
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0x7
	ands r4, r0
	ldr r0, _080F7D58 @ =gStringVar4
	ldrb r1, [r5, 0x1]
	lsls r1, 1
	adds r1, r6
	ldrh r1, [r1]
	bl sub_80EB3FC
	adds r2, r0, 0
	ldr r1, _080F7D5C @ =gOtherText_Is
	bl StringCopy
	adds r2, r0, 0
	ldr r0, _080F7D60 @ =gUnknown_083E5388
	lsls r4, 2
	adds r4, r0
	ldr r1, [r4]
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	ldr r1, _080F7D64 @ =gOtherText_DontYouAgree
	bl StringCopy
	b _080F7D88
	.align 2, 0
_080F7D50: .4byte gSaveBlock1 + 0x2D94
_080F7D54: .4byte 0x0000ffff
_080F7D58: .4byte gStringVar4
_080F7D5C: .4byte gOtherText_Is
_080F7D60: .4byte gUnknown_083E5388
_080F7D64: .4byte gOtherText_DontYouAgree
_080F7D68:
	ldr r0, _080F7DA0 @ =gStringVar4
	ldr r3, _080F7DA4 @ =gUnknown_083E53A8
	ldrb r1, [r5, 0x2]
	adds r2, r1, 0x1
	strb r2, [r5, 0x2]
	lsls r1, 24
	lsrs r1, 24
	adds r2, r5, 0
	adds r2, 0x18
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl StringCopy
_080F7D88:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	bne _080F7DA8
	movs r0, 0xA
	b _080F7DAC
	.align 2, 0
_080F7DA0: .4byte gStringVar4
_080F7DA4: .4byte gUnknown_083E53A8
_080F7DA8:
	ldrb r0, [r5, 0x1]
	adds r0, 0x1
_080F7DAC:
	strb r0, [r5, 0x1]
	ldr r1, _080F7DBC @ =gScriptResult
	movs r0, 0x1
	strh r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F7DBC: .4byte gScriptResult
	thumb_func_end sub_80F7CF4

	thumb_func_start sub_80F7DC0
sub_80F7DC0: @ 80F7DC0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	ldr r1, _080F7E84 @ =gUnknown_083E53C8
	mov r0, sp
	movs r2, 0x18
	bl memcpy
	movs r5, 0
	movs r0, 0x2
	add r0, sp
	mov r8, r0
	ldr r1, _080F7E88 @ =gSaveBlock1 + 0x2D94
	adds r1, 0x18
	adds r3, r1, 0
_080F7DE4:
	adds r0, r3, r5
	strb r5, [r0]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x7
	bls _080F7DE4
	movs r5, 0
	ldr r2, _080F7E88 @ =gSaveBlock1 + 0x2D94
	adds r2, 0x4
	mov r9, r2
	adds r6, r1, 0
_080F7DFC:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r4, r5, 0x1
	adds r1, r4, 0
	bl __modsi3
	lsls r0, 16
	lsrs r1, r0, 16
	adds r2, r6, r5
	ldrb r7, [r2]
	adds r1, r6, r1
	ldrb r0, [r1]
	strb r0, [r2]
	strb r7, [r1]
	lsls r4, 16
	lsrs r5, r4, 16
	cmp r5, 0x7
	bls _080F7DFC
	movs r3, 0
	mov r10, r3
	movs r5, 0
_080F7E2A:
	lsls r4, r5, 2
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	bl sub_80EAE88
	add r4, r8
	strh r0, [r4]
	add r0, r10
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x5
	bls _080F7E2A
	movs r0, 0
	ldr r2, _080F7E88 @ =gSaveBlock1 + 0x2D94
	strb r0, [r2, 0x2]
	movs r7, 0
	movs r5, 0
_080F7E56:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x2
	bhi _080F7E90
	cmp r7, 0x7
	bhi _080F7E90
	lsls r0, r5, 1
	add r0, r9
	ldr r1, _080F7E8C @ =0x0000ffff
	strh r1, [r0]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	adds r4, r5, 0x1
	b _080F7EE2
	.align 2, 0
_080F7E84: .4byte gUnknown_083E53C8
_080F7E88: .4byte gSaveBlock1 + 0x2D94
_080F7E8C: .4byte 0x0000ffff
_080F7E90:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	mov r1, r10
	bl __umodsi3
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0
	adds r4, r5, 0x1
	lsls r6, r5, 1
	cmp r5, 0x5
	bhi _080F7ECC
	mov r3, r8
	ldrh r0, [r3]
	b _080F7EC2
_080F7EB2:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r5, 0x5
	bhi _080F7ECC
	lsls r0, r1, 2
	adds r0, r3, r0
	ldrh r0, [r0]
_080F7EC2:
	subs r0, r2, r0
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r0, 0
	bgt _080F7EB2
_080F7ECC:
	cmp r1, 0x6
	bne _080F7ED2
	movs r1, 0
_080F7ED2:
	lsls r0, r1, 2
	add r0, sp
	ldrh r0, [r0]
	bl sub_80EB784
	mov r2, r9
	adds r1, r2, r6
	strh r0, [r1]
_080F7EE2:
	lsls r0, r4, 16
	lsrs r5, r0, 16
	cmp r5, 0x9
	bls _080F7E56
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80F7DC0

	thumb_func_start sub_80F7EFC
sub_80F7EFC: @ 80F7EFC
	ldr r0, _080F7F08 @ =gSaveBlock1 + 0x2D94
	adds r0, 0x29
	movs r1, 0
	strb r1, [r0]
	bx lr
	.align 2, 0
_080F7F08: .4byte gSaveBlock1 + 0x2D94
	thumb_func_end sub_80F7EFC

	thumb_func_start sub_80F7F0C
sub_80F7F0C: @ 80F7F0C
	ldr r1, _080F7F14 @ =gSaveBlock1 + 0x2D94
	movs r0, 0
	strb r0, [r1, 0x1]
	bx lr
	.align 2, 0
_080F7F14: .4byte gSaveBlock1 + 0x2D94
	thumb_func_end sub_80F7F0C

	thumb_func_start sub_80F7F18
sub_80F7F18: @ 80F7F18
	push {lr}
	bl sub_8109A20
	pop {r0}
	bx r0
	thumb_func_end sub_80F7F18

	thumb_func_start sub_80F7F24
sub_80F7F24: @ 80F7F24
	push {lr}
	bl sub_80F8428
	pop {r0}
	bx r0
	thumb_func_end sub_80F7F24

	thumb_func_start sub_80F7F30
sub_80F7F30: @ 80F7F30
	push {lr}
	bl GetCurrentMauvilleOldMan
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080F7F76
	lsls r0, 2
	ldr r1, _080F7F48 @ =_080F7F4C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F7F48: .4byte _080F7F4C
	.align 2, 0
_080F7F4C:
	.4byte _080F7F60
	.4byte _080F7F66
	.4byte _080F7F72
	.4byte _080F7F6C
	.4byte _080F7F76
_080F7F60:
	bl sub_80F7EFC
	b _080F7F76
_080F7F66:
	bl sub_80F7F0C
	b _080F7F76
_080F7F6C:
	bl sub_80F7F24
	b _080F7F76
_080F7F72:
	bl sub_80F7F18
_080F7F76:
	bl sub_80F83D0
	pop {r0}
	bx r0
	thumb_func_end sub_80F7F30

	thumb_func_start sub_80F7F80
sub_80F7F80: @ 80F7F80
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080F7FA8 @ =sub_80F8184
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080F7FAC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x12]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F7FA8: .4byte sub_80F8184
_080F7FAC: .4byte gTasks
	thumb_func_end sub_80F7F80

	thumb_func_start sub_80F7FB0
sub_80F7FB0: @ 80F7FB0
	push {r4-r7,lr}
	adds r6, r1, 0
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0x5
	bls _080F7FBE
	b _080F817A
_080F7FBE:
	lsls r0, 2
	ldr r1, _080F7FC8 @ =_080F7FCC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F7FC8: .4byte _080F7FCC
	.align 2, 0
_080F7FCC:
	.4byte _080F7FE4
	.4byte _080F817A
	.4byte _080F8040
	.4byte _080F8074
	.4byte _080F8074
	.4byte _080F817A
_080F7FE4:
	ldr r2, _080F8034 @ =gSaveBlock1 + 0x2D94
	ldr r0, _080F8038 @ =gUnknown_0202E8CC
	ldrh r0, [r0]
	adds r1, r2, 0
	adds r1, 0xE
	cmp r0, 0
	bne _080F7FF4
	adds r1, r2, 0x2
_080F7FF4:
	adds r2, r1, 0
	adds r1, r6, 0
	adds r1, 0xC
	movs r3, 0x5
_080F7FFC:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080F7FFC
	ldr r2, _080F803C @ =0x0000ffff
	adds r4, r2, 0
	movs r2, 0
	adds r1, r6, 0
	adds r1, 0x18
	movs r3, 0x5
_080F8016:
	ldrh r0, [r1]
	orrs r0, r4
	strh r0, [r1]
	strh r2, [r1, 0x2]
	strh r2, [r1, 0x4]
	strh r2, [r1, 0x6]
	adds r1, 0x8
	subs r3, 0x1
	cmp r3, 0
	bge _080F8016
	movs r0, 0
	strb r0, [r6]
	strb r0, [r6, 0x1]
	strh r0, [r6, 0x4]
	b _080F817A
	.align 2, 0
_080F8034: .4byte gSaveBlock1 + 0x2D94
_080F8038: .4byte gUnknown_0202E8CC
_080F803C: .4byte 0x0000ffff
_080F8040:
	ldrb r1, [r6]
	lsls r1, 1
	adds r0, r6, 0
	adds r0, 0xC
	adds r0, r1
	ldrh r4, [r0]
	lsrs r0, r4, 9
	ldr r1, _080F8070 @ =0x000001ff
	ands r1, r4
	bl sub_814A2D0
	adds r1, r0, 0
	movs r0, 0
	strh r0, [r6, 0x4]
	movs r2, 0x3
	ands r2, r4
	lsrs r4, 3
	movs r0, 0x1
	ands r4, r0
	adds r2, r4
	adds r0, r6, 0
	bl sub_814A2EC
	b _080F817A
	.align 2, 0
_080F8070: .4byte 0x000001ff
_080F8074:
	ldrb r1, [r6, 0x1]
	lsls r0, r1, 3
	adds r0, 0x18
	adds r7, r6, r0
	ldrb r0, [r6, 0x3]
	cmp r0, 0x1
	beq _080F8124
	cmp r0, 0x1
	bgt _080F808C
	cmp r0, 0
	beq _080F8092
	b _080F817A
_080F808C:
	cmp r0, 0xFE
	beq _080F8170
	b _080F817A
_080F8092:
	ldrb r0, [r6, 0x2]
	cmp r0, 0
	bne _080F80D0
	cmp r1, 0x6
	beq _080F80A2
	ldrh r0, [r7]
	cmp r0, 0xFF
	bne _080F80A6
_080F80A2:
	movs r0, 0xFE
	b _080F8178
_080F80A6:
	ldrh r0, [r7, 0x2]
	strb r0, [r6, 0x2]
	ldrh r0, [r7]
	cmp r0, 0x32
	bhi _080F80CA
	movs r1, 0x3
	bl __udivsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	lsls r0, r1, 1
	adds r0, r1
	adds r0, 0xF9
	lsls r0, 16
	lsrs r0, 16
	bl m4aSongNumStart
_080F80CA:
	movs r0, 0x1
	strb r0, [r6, 0x3]
	b _080F8114
_080F80D0:
	ldrh r1, [r6, 0xA]
	movs r2, 0xA
	ldrsh r0, [r6, r2]
	cmp r0, 0xA
	ble _080F80E0
	ldrh r0, [r6, 0x6]
	subs r0, 0x2
	strh r0, [r6, 0x6]
_080F80E0:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080F80EE
	ldrh r0, [r6, 0x8]
	adds r0, 0x40
	b _080F80F2
_080F80EE:
	ldrh r0, [r6, 0x8]
	subs r0, 0x40
_080F80F2:
	strh r0, [r6, 0x8]
	ldr r4, _080F811C @ =gMPlay_SE2
	ldr r5, _080F8120 @ =0x0000ffff
	ldrh r2, [r6, 0x6]
	adds r0, r4, 0
	adds r1, r5, 0
	bl m4aMPlayVolumeControl
	movs r0, 0x8
	ldrsh r2, [r6, r0]
	adds r0, r4, 0
	adds r1, r5, 0
	bl m4aMPlayPitchControl
	ldrh r0, [r6, 0xA]
	adds r0, 0x1
	strh r0, [r6, 0xA]
_080F8114:
	ldrb r0, [r6, 0x2]
	subs r0, 0x1
	strb r0, [r6, 0x2]
	b _080F817A
	.align 2, 0
_080F811C: .4byte gMPlay_SE2
_080F8120: .4byte 0x0000ffff
_080F8124:
	adds r0, r1, 0x1
	movs r1, 0
	strb r0, [r6, 0x1]
	strb r1, [r6, 0x3]
	ldrh r0, [r7]
	cmp r0, 0x32
	bhi _080F817A
	ldrh r0, [r7, 0x6]
	lsls r0, 4
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1
	strh r0, [r6, 0x6]
	ldr r4, _080F8168 @ =gMPlay_SE2
	ldr r5, _080F816C @ =0x0000ffff
	ldrh r2, [r6, 0x6]
	adds r0, r4, 0
	adds r1, r5, 0
	bl m4aMPlayVolumeControl
	movs r2, 0x80
	lsls r2, 2
	adds r0, r2, 0
	ldrh r7, [r7, 0x4]
	adds r0, r7
	strh r0, [r6, 0x8]
	movs r0, 0x8
	ldrsh r2, [r6, r0]
	adds r0, r4, 0
	adds r1, r5, 0
	bl m4aMPlayPitchControl
	b _080F817A
	.align 2, 0
_080F8168: .4byte gMPlay_SE2
_080F816C: .4byte 0x0000ffff
_080F8170:
	ldr r0, _080F8180 @ =gMPlay_SE2
	bl m4aMPlayStop
	movs r0, 0xFF
_080F8178:
	strb r0, [r6, 0x3]
_080F817A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F8180: .4byte gMPlay_SE2
	thumb_func_end sub_80F7FB0

	thumb_func_start sub_80F8184
sub_80F8184: @ 80F8184
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080F81B4 @ =gTasks
	adds r5, r0, r1
	ldr r1, _080F81B8 @ =gUnknown_03005DA0
	adds r0, r5, 0
	bl sub_80F7FB0
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x5
	bls _080F81A8
	b _080F83C8
_080F81A8:
	lsls r0, 2
	ldr r1, _080F81BC @ =_080F81C0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F81B4: .4byte gTasks
_080F81B8: .4byte gUnknown_03005DA0
_080F81BC: .4byte _080F81C0
	.align 2, 0
_080F81C0:
	.4byte _080F81D8
	.4byte _080F8218
	.4byte _080F8228
	.4byte _080F82D8
	.4byte _080F83B8
	.4byte _080F82C6
_080F81D8:
	bl sub_80F7BA0
	ldr r4, _080F820C @ =gMenuWindowPtr
	ldr r0, [r4]
	ldr r1, _080F8210 @ =gWindowConfig_81E6CE4
	bl InitWindowFromConfig
	ldr r0, [r4]
	ldr r1, _080F8214 @ =gStringVar4
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x2
	movs r3, 0x4
	bl sub_8002EB0
	movs r0, 0
	strh r0, [r5, 0xA]
	strh r0, [r5, 0xC]
	strh r0, [r5, 0xE]
	strh r0, [r5, 0x10]
	movs r0, 0x4
	bl FadeOutBGMTemporarily
	movs r0, 0x1
	b _080F83C6
	.align 2, 0
_080F820C: .4byte gMenuWindowPtr
_080F8210: .4byte gWindowConfig_81E6CE4
_080F8214: .4byte gStringVar4
_080F8218:
	bl IsBGMPausedOrStopped
	lsls r0, 24
	cmp r0, 0
	bne _080F8224
	b _080F83C8
_080F8224:
	movs r0, 0x2
	b _080F83C6
_080F8228:
	ldr r4, _080F8240 @ =gSaveBlock1 + 0x2D94
	movs r2, 0xE
	ldrsh r1, [r5, r2]
	ldr r0, _080F8244 @ =gStringVar4
	adds r1, r0
	movs r3, 0
	ldrb r0, [r1]
	ldr r7, _080F8248 @ =gUnknown_03005DA0
	ldrh r2, [r5, 0x12]
	ldr r6, _080F824C @ =gUnknown_020388BC
	b _080F825A
	.align 2, 0
_080F8240: .4byte gSaveBlock1 + 0x2D94
_080F8244: .4byte gStringVar4
_080F8248: .4byte gUnknown_03005DA0
_080F824C: .4byte gUnknown_020388BC
_080F8250:
	adds r1, 0x1
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	ldrb r0, [r1]
_080F825A:
	cmp r0, 0
	beq _080F826A
	cmp r0, 0xFE
	beq _080F826A
	cmp r0, 0xFC
	beq _080F826A
	cmp r0, 0xFF
	bne _080F8250
_080F826A:
	cmp r2, 0
	bne _080F8278
	movs r0, 0x10
	ldrsh r1, [r5, r0]
	lsls r1, 1
	adds r0, r4, 0x2
	b _080F8282
_080F8278:
	movs r2, 0x10
	ldrsh r1, [r5, r2]
	lsls r1, 1
	adds r0, r4, 0
	adds r0, 0xE
_080F8282:
	adds r0, r1
	ldrh r0, [r0]
	movs r1, 0x3
	ands r1, r0
	lsrs r0, 3
	movs r2, 0x1
	ands r0, r2
	adds r1, r0
	strh r1, [r6]
	movs r1, 0x4
	ldrsh r0, [r7, r1]
	adds r1, r3, 0
	bl __divsi3
	movs r1, 0
	strh r0, [r7, 0x4]
	lsls r0, 16
	cmp r0, 0
	bgt _080F82AC
	movs r0, 0x1
	strh r0, [r7, 0x4]
_080F82AC:
	ldrh r0, [r5, 0x10]
	adds r0, 0x1
	strh r0, [r5, 0x10]
	movs r2, 0xC
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bne _080F82BE
	movs r0, 0x3
	b _080F82C0
_080F82BE:
	movs r0, 0x5
_080F82C0:
	strh r0, [r5, 0x8]
	strh r1, [r5, 0xA]
	b _080F83C8
_080F82C6:
	ldrh r1, [r5, 0xC]
	movs r2, 0xC
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bne _080F82D2
	b _080F83C4
_080F82D2:
	subs r0, r1, 0x1
	strh r0, [r5, 0xC]
	b _080F83C8
_080F82D8:
	ldr r1, _080F8304 @ =gStringVar4
	movs r2, 0xE
	ldrsh r0, [r5, r2]
	adds r0, r1
	ldrb r4, [r0]
	cmp r4, 0xFF
	bne _080F830C
	movs r0, 0xC8
	lsls r0, 1
	movs r1, 0x6
	bl FadeInNewBGM
	ldr r0, _080F8308 @ =gMPlay_SE2
	movs r1, 0x2
	bl m4aMPlayFadeOutTemporarily
	bl EnableBothScriptContexts
	adds r0, r6, 0
	bl DestroyTask
	b _080F83C8
	.align 2, 0
_080F8304: .4byte gStringVar4
_080F8308: .4byte gMPlay_SE2
_080F830C:
	cmp r4, 0
	bne _080F832C
	ldr r0, _080F8328 @ =gMenuWindowPtr
	ldr r0, [r0]
	bl sub_8003418
	ldrh r0, [r5, 0xE]
	adds r0, 0x1
	strh r0, [r5, 0xE]
	movs r0, 0x2
	strh r0, [r5, 0x8]
	strh r4, [r5, 0xC]
	b _080F83C8
	.align 2, 0
_080F8328: .4byte gMenuWindowPtr
_080F832C:
	cmp r4, 0xFE
	bne _080F8340
	ldrh r0, [r5, 0xE]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r5, 0xE]
	movs r0, 0x2
	strh r0, [r5, 0x8]
	strh r1, [r5, 0xC]
	b _080F83C8
_080F8340:
	cmp r4, 0xFC
	bne _080F8354
	ldrh r0, [r5, 0xE]
	adds r0, 0x2
	strh r0, [r5, 0xE]
	movs r0, 0x2
	strh r0, [r5, 0x8]
	movs r0, 0x8
	strh r0, [r5, 0xC]
	b _080F83C8
_080F8354:
	cmp r4, 0x37
	bne _080F8374
	movs r4, 0
	strb r4, [r0]
	ldr r0, _080F8370 @ =gMenuWindowPtr
	ldr r0, [r0]
	bl sub_8003418
	ldrh r0, [r5, 0xE]
	adds r0, 0x1
	strh r0, [r5, 0xE]
	strh r4, [r5, 0xC]
	b _080F83C8
	.align 2, 0
_080F8370: .4byte gMenuWindowPtr
_080F8374:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080F8394
	cmp r0, 0x1
	bgt _080F8386
	cmp r0, 0
	beq _080F838C
	b _080F83C8
_080F8386:
	cmp r0, 0x2
	beq _080F83A0
	b _080F83C8
_080F838C:
	ldr r0, _080F839C @ =gMenuWindowPtr
	ldr r0, [r0]
	bl sub_8003418
_080F8394:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	b _080F83C8
	.align 2, 0
_080F839C: .4byte gMenuWindowPtr
_080F83A0:
	ldrh r0, [r5, 0xE]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r5, 0xE]
	strh r1, [r5, 0xA]
	ldr r0, _080F83B4 @ =gUnknown_03005DA0
	ldrh r0, [r0, 0x4]
	strh r0, [r5, 0xC]
	movs r0, 0x4
	b _080F83C6
	.align 2, 0
_080F83B4: .4byte gUnknown_03005DA0
_080F83B8:
	ldrh r0, [r5, 0xC]
	subs r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	cmp r0, 0
	bne _080F83C8
_080F83C4:
	movs r0, 0x3
_080F83C6:
	strh r0, [r5, 0x8]
_080F83C8:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80F8184

	thumb_func_start sub_80F83D0
sub_80F83D0: @ 80F83D0
	push {r4,lr}
	ldr r4, _080F83F4 @ =0x00004010
	bl GetCurrentMauvilleOldMan
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 8
	movs r0, 0x8A
	lsls r0, 15
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	bl VarSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F83F4: .4byte 0x00004010
	thumb_func_end sub_80F83D0

	thumb_func_start sub_80F83F8
sub_80F83F8: @ 80F83F8
	push {r4,lr}
	ldr r0, _080F8424 @ =gSaveBlock1 + 0x2D94
	movs r2, 0
	movs r1, 0x3
	strb r1, [r0]
	strb r2, [r0, 0x1]
	movs r4, 0
	movs r3, 0xFF
	adds r1, r0, 0x4
	movs r2, 0x3
_080F840C:
	strb r4, [r1]
	ldrb r0, [r1, 0x4]
	orrs r0, r3
	strb r0, [r1, 0x4]
	adds r1, 0x1
	subs r2, 0x1
	cmp r2, 0
	bge _080F840C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F8424: .4byte gSaveBlock1 + 0x2D94
	thumb_func_end sub_80F83F8

	thumb_func_start sub_80F8428
sub_80F8428: @ 80F8428
	ldr r0, _080F8434 @ =gSaveBlock1 + 0x2D94
	movs r2, 0
	movs r1, 0x3
	strb r1, [r0]
	strb r2, [r0, 0x1]
	bx lr
	.align 2, 0
_080F8434: .4byte gSaveBlock1 + 0x2D94
	thumb_func_end sub_80F8428

	thumb_func_start sub_80F8438
sub_80F8438: @ 80F8438
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x32
	bne _080F8444
	movs r0, 0
_080F8444:
	bl sub_8053108
	pop {r1}
	bx r1
	thumb_func_end sub_80F8438

	thumb_func_start sub_80F844C
sub_80F844C: @ 80F844C
	push {lr}
	adds r3, r0, 0
	movs r2, 0
	ldr r1, _080F8460 @ =gUnknown_083E53E0
_080F8454:
	ldrb r0, [r1]
	cmp r0, r3
	bne _080F8464
	adds r0, r1, 0
	b _080F846E
	.align 2, 0
_080F8460: .4byte gUnknown_083E53E0
_080F8464:
	adds r1, 0x10
	adds r2, 0x1
	cmp r2, 0x23
	ble _080F8454
	ldr r0, _080F8474 @ =gUnknown_083E5610
_080F846E:
	pop {r1}
	bx r1
	.align 2, 0
_080F8474: .4byte gUnknown_083E5610
	thumb_func_end sub_80F844C

	thumb_func_start sub_80F8478
sub_80F8478: @ 80F8478
	push {lr}
	bl sub_80F844C
	ldr r0, [r0, 0x4]
	pop {r1}
	bx r1
	thumb_func_end sub_80F8478

	thumb_func_start sub_80F8484
sub_80F8484: @ 80F8484
	push {lr}
	bl sub_80F844C
	ldr r0, [r0, 0xC]
	pop {r1}
	bx r1
	thumb_func_end sub_80F8484

	thumb_func_start sub_80F8490
sub_80F8490: @ 80F8490
	push {lr}
	bl sub_80F844C
	ldr r0, [r0, 0x8]
	pop {r1}
	bx r1
	thumb_func_end sub_80F8490

	thumb_func_start sub_80F849C
sub_80F849C: @ 80F849C
	push {lr}
	movs r1, 0
	ldr r2, _080F84C4 @ =gSaveBlock1 + 0x2D94
	ldrb r0, [r2, 0x4]
	cmp r0, 0
	beq _080F84BC
	adds r2, 0x4
_080F84AA:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bhi _080F84BC
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F84AA
_080F84BC:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_080F84C4: .4byte gSaveBlock1 + 0x2D94
	thumb_func_end sub_80F849C

	thumb_func_start sub_80F84C8
sub_80F84C8: @ 80F84C8
	lsls r0, 2
	ldr r1, _080F84E8 @ =gSaveBlock1 + 0x2DB8
	adds r0, r1
	ldrb r2, [r0]
	ldrb r1, [r0, 0x1]
	lsls r1, 8
	orrs r2, r1
	ldrb r1, [r0, 0x2]
	lsls r1, 16
	orrs r2, r1
	ldrb r0, [r0, 0x3]
	lsls r0, 24
	orrs r2, r0
	adds r0, r2, 0
	bx lr
	.align 2, 0
_080F84E8: .4byte gSaveBlock1 + 0x2DB8
	thumb_func_end sub_80F84C8

	thumb_func_start sub_80F84EC
sub_80F84EC: @ 80F84EC
	lsls r0, 2
	ldr r2, _080F8504 @ =gSaveBlock1 + 0x2DB8
	adds r0, r2
	strb r1, [r0]
	lsrs r2, r1, 8
	strb r2, [r0, 0x1]
	lsrs r2, r1, 16
	strb r2, [r0, 0x2]
	lsrs r1, 24
	strb r1, [r0, 0x3]
	bx lr
	.align 2, 0
_080F8504: .4byte gSaveBlock1 + 0x2DB8
	thumb_func_end sub_80F84EC

	thumb_func_start sub_80F8508
sub_80F8508: @ 80F8508
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080F8528 @ =gSaveBlock1 + 0x2D94
	adds r0, 0x4
	adds r0, r5, r0
	ldrb r0, [r0]
	bl sub_80F8438
	adds r4, r0, 0
	adds r0, r5, 0
	bl sub_80F84C8
	cmp r4, r0
	bhi _080F852C
	movs r0, 0
	b _080F852E
	.align 2, 0
_080F8528: .4byte gSaveBlock1 + 0x2D94
_080F852C:
	movs r0, 0x1
_080F852E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80F8508

	thumb_func_start sub_80F8534
sub_80F8534: @ 80F8534
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r4, r0, 3
	subs r4, r0
	ldr r0, _080F855C @ =gSaveBlock1 + 0x2D9C
	adds r4, r0
	adds r0, r5, 0
	movs r1, 0xFF
	movs r2, 0x8
	bl memset
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x7
	bl memcpy
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F855C: .4byte gSaveBlock1 + 0x2D9C
	thumb_func_end sub_80F8534

	thumb_func_start sub_80F8560
sub_80F8560: @ 80F8560
	push {r4-r6,lr}
	adds r6, r1, 0
	lsls r5, r0, 3
	subs r5, r0
	ldr r0, _080F8594 @ =gSaveBlock1 + 0x2D9C
	adds r5, r0
	adds r0, r6, 0
	bl StringLength
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0xFF
	movs r2, 0x7
	bl memset
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl StringCopyN
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F8594: .4byte gSaveBlock1 + 0x2D9C
	thumb_func_end sub_80F8560

	thumb_func_start sub_80F8598
sub_80F8598: @ 80F8598
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r0, _080F85EC @ =gSaveBlock1 + 0x2D94
	adds r0, 0x4
	adds r0, r5, r0
	strb r6, [r0]
	ldr r1, _080F85F0 @ =gSaveBlock2
	adds r0, r5, 0
	bl sub_80F8560
	lsls r4, r6, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_80F8438
	adds r1, r0, 0
	adds r0, r5, 0
	bl sub_80F84EC
	ldr r5, _080F85F4 @ =gStringVar1
	adds r0, r4, 0
	bl sub_80F8438
	adds r1, r0, 0
	adds r0, r5, 0
	movs r2, 0
	movs r3, 0xA
	bl ConvertIntToDecimalStringN
	ldr r4, _080F85F8 @ =gStringVar2
	adds r0, r6, 0
	bl sub_80F8490
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F85EC: .4byte gSaveBlock1 + 0x2D94
_080F85F0: .4byte gSaveBlock2
_080F85F4: .4byte gStringVar1
_080F85F8: .4byte gStringVar2
	thumb_func_end sub_80F8598

	thumb_func_start sub_80F85FC
sub_80F85FC: @ 80F85FC
	push {r4-r7,lr}
	adds r7, r0, 0
	adds r6, r1, 0
	movs r5, 0
	cmp r5, r6
	bge _080F8612
_080F8608:
	adds r0, r7, r5
	strb r5, [r0]
	adds r5, 0x1
	cmp r5, r6
	blt _080F8608
_080F8612:
	cmp r6, 0
	ble _080F8648
	adds r5, r6, 0
_080F8618:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r6, 0
	bl __modsi3
	adds r4, r0, 0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r6, 0
	bl __modsi3
	adds r4, r7, r4
	ldrb r2, [r4]
	adds r0, r7, r0
	ldrb r1, [r0]
	strb r1, [r4]
	strb r2, [r0]
	subs r5, 0x1
	cmp r5, 0
	bne _080F8618
_080F8648:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80F85FC

	thumb_func_start sub_80F8650
sub_80F8650: @ 80F8650
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r7, sp
	mov r10, sp
	ldr r0, _080F86D4 @ =gUnknown_083E5620
	ldr r0, [r0]
	lsls r0, 3
	lsrs r0, 3
	adds r0, 0x3
	lsrs r0, 2
	lsls r0, 2
	mov r1, sp
	subs r1, r0
	mov sp, r1
	mov r8, sp
	mov r0, sp
	movs r1, 0x24
	bl sub_80F85FC
	movs r5, 0
	ldr r0, _080F86D8 @ =gUnknown_083E53E0
	mov r9, r0
	ldr r3, _080F86DC @ =gSaveBlock1 + 0x2D94
_080F8686:
	mov r1, r8
	adds r0, r1, r5
	ldrb r0, [r0]
	lsls r0, 4
	add r0, r9
	ldrb r4, [r0]
	ldrb r6, [r0, 0x1]
	movs r1, 0
	ldrb r0, [r3, 0x4]
	cmp r0, r4
	beq _080F86AC
	ldr r2, _080F86E0 @ =gSaveBlock1 + 0x2D98
_080F869E:
	adds r1, 0x1
	cmp r1, 0x3
	bgt _080F86AC
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, r4
	bne _080F869E
_080F86AC:
	cmp r1, 0x4
	bne _080F86E4
	adds r0, r4, 0
	str r3, [r7]
	bl sub_80F8438
	ldr r3, [r7]
	cmp r0, r6
	bcc _080F86E4
	movs r0, 0x1
	strb r0, [r3, 0x1]
	bl sub_80F849C
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	bl sub_80F8598
	movs r0, 0x1
	b _080F86EC
	.align 2, 0
_080F86D4: .4byte gUnknown_083E5620
_080F86D8: .4byte gUnknown_083E53E0
_080F86DC: .4byte gSaveBlock1 + 0x2D94
_080F86E0: .4byte gSaveBlock1 + 0x2D98
_080F86E4:
	adds r5, 0x1
	cmp r5, 0x23
	ble _080F8686
	movs r0, 0
_080F86EC:
	mov sp, r10
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80F8650

	thumb_func_start sub_80F8700
sub_80F8700: @ 80F8700
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _080F8748 @ =gSaveBlock1 + 0x2D94
	adds r0, 0x4
	adds r0, r5, r0
	ldrb r6, [r0]
	ldr r4, _080F874C @ =gStringVar1
	adds r0, r5, 0
	bl sub_80F84C8
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0xA
	bl ConvertIntToDecimalStringN
	ldr r4, _080F8750 @ =gStringVar2
	adds r0, r6, 0
	bl sub_80F8490
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldr r1, _080F8754 @ =gStringVar3
	adds r0, r5, 0
	bl sub_80F8534
	adds r0, r6, 0
	bl sub_80F8484
	bl ShowFieldMessage
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F8748: .4byte gSaveBlock1 + 0x2D94
_080F874C: .4byte gStringVar1
_080F8750: .4byte gStringVar2
_080F8754: .4byte gStringVar3
	thumb_func_end sub_80F8700

	thumb_func_start sub_80F8758
sub_80F8758: @ 80F8758
	push {r4-r6,lr}
	bl sub_80F849C
	adds r3, r0, 0
	lsls r3, 25
	movs r0, 0x80
	lsls r0, 19
	adds r3, r0
	lsrs r3, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0x19
	bl MenuDrawTextWindow
	movs r4, 0
	ldr r1, _080F87BC @ =gSaveBlock1 + 0x2D94
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _080F87A4
	adds r6, r1, 0x4
	movs r5, 0x80
	lsls r5, 18
_080F8784:
	bl sub_80F8478
	lsrs r2, r5, 24
	movs r1, 0x1
	bl MenuPrint
	movs r1, 0x80
	lsls r1, 18
	adds r5, r1
	adds r4, 0x1
	cmp r4, 0x3
	bgt _080F87A4
	adds r0, r4, r6
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F8784
_080F87A4:
	ldr r0, _080F87C0 @ =gPCText_Cancel
	lsls r2, r4, 25
	movs r1, 0x80
	lsls r1, 18
	adds r2, r1
	lsrs r2, 24
	movs r1, 0x1
	bl MenuPrint
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F87BC: .4byte gSaveBlock1 + 0x2D94
_080F87C0: .4byte gPCText_Cancel
	thumb_func_end sub_80F8758

	thumb_func_start sub_80F87C4
sub_80F87C4: @ 80F87C4
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080F87E4 @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r5, [r4, r0]
	cmp r5, 0
	beq _080F87E8
	cmp r5, 0x1
	beq _080F8810
	b _080F8862
	.align 2, 0
_080F87E4: .4byte gTasks
_080F87E8:
	bl sub_80F8758
	bl sub_80F849C
	adds r3, r0, 0
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	str r5, [sp]
	movs r0, 0x18
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x2
	bl InitMenu
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080F8862
_080F8810:
	bl ProcessMenuInput
	lsls r0, 24
	asrs r4, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r4, r0
	beq _080F8862
	adds r0, 0x1
	cmp r4, r0
	beq _080F8832
	bl sub_80F849C
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _080F8840
_080F8832:
	ldr r1, _080F883C @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	b _080F8848
	.align 2, 0
_080F883C: .4byte gScriptResult
_080F8840:
	ldr r0, _080F886C @ =gScriptResult
	strh r5, [r0]
	ldr r0, _080F8870 @ =gUnknown_03000748
	strb r4, [r0]
_080F8848:
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0x19
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	adds r0, r6, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_080F8862:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F886C: .4byte gScriptResult
_080F8870: .4byte gUnknown_03000748
	thumb_func_end sub_80F87C4

	thumb_func_start sub_80F8874
sub_80F8874: @ 80F8874
	push {lr}
	ldr r0, _080F8884 @ =sub_80F87C4
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080F8884: .4byte sub_80F87C4
	thumb_func_end sub_80F8874

	thumb_func_start sub_80F8888
sub_80F8888: @ 80F8888
	push {lr}
	ldr r0, _080F8898 @ =gUnknown_03000748
	ldrb r0, [r0]
	bl sub_80F8700
	pop {r0}
	bx r0
	.align 2, 0
_080F8898: .4byte gUnknown_03000748
	thumb_func_end sub_80F8888

	thumb_func_start sub_80F889C
sub_80F889C: @ 80F889C
	push {lr}
	bl sub_80F849C
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80F889C

	thumb_func_start sub_80F88AC
sub_80F88AC: @ 80F88AC
	push {r4,r5,lr}
	ldr r1, _080F88C8 @ =gSaveBlock1 + 0x2D94
	ldr r5, _080F88CC @ =gUnknown_03000748
	ldrb r0, [r5]
	adds r1, 0x4
	adds r1, r0, r1
	ldrb r4, [r1]
	bl sub_80F8508
	cmp r0, 0x1
	beq _080F88D0
	movs r0, 0
	b _080F88DA
	.align 2, 0
_080F88C8: .4byte gSaveBlock1 + 0x2D94
_080F88CC: .4byte gUnknown_03000748
_080F88D0:
	ldrb r0, [r5]
	adds r1, r4, 0
	bl sub_80F8598
	movs r0, 0x1
_080F88DA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80F88AC

	thumb_func_start sub_80F88E0
sub_80F88E0: @ 80F88E0
	push {lr}
	ldr r0, _080F88F0 @ =gSaveBlock1 + 0x2D94
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _080F88F4
	movs r0, 0x1
	b _080F88F6
	.align 2, 0
_080F88F0: .4byte gSaveBlock1 + 0x2D94
_080F88F4:
	movs r0, 0
_080F88F6:
	pop {r1}
	bx r1
	thumb_func_end sub_80F88E0

	thumb_func_start sub_80F88FC
sub_80F88FC: @ 80F88FC
	push {lr}
	bl sub_80F8650
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80F88FC

	.align 2, 0 @ Don't pad with nop.
