	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

.ifdef ENGLISH
	thumb_func_start sub_80C8E1C
sub_80C8E1C: @ 80C8E1C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080C8E4C @ =gTasks
	mov r8, r0
	lsls r6, r5, 2
	adds r0, r6, r5
	lsls r7, r0, 3
	mov r1, r8
	adds r4, r7, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080C8E50
	cmp r0, 0x1
	beq _080C8E7C
	movs r0, 0
	strh r0, [r4, 0x8]
	adds r0, r5, 0
	bl SwitchTaskToFollowupFunc
	b _080C8EAE
	.align 2, 0
_080C8E4C: .4byte gTasks
_080C8E50:
	ldr r1, _080C8E78 @ =gBlockSendBuffer
	movs r0, 0x64
	strb r0, [r1]
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	bne _080C8E70
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8EAE
	movs r0, 0x2
	bl sub_8007E9C
_080C8E70:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080C8EAE
	.align 2, 0
_080C8E78: .4byte gBlockSendBuffer
_080C8E7C:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8EAE
	ldr r1, _080C8EB8 @ =gBlockRecvBuffer
	mov r0, r8
	adds r0, 0x12
	adds r2, r7, r0
	movs r4, 0x80
	lsls r4, 1
	movs r3, 0x3
_080C8E94:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, r4
	adds r2, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080C8E94
	adds r1, r6, r5
	lsls r1, 3
	add r1, r8
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_080C8EAE:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C8EB8: .4byte gBlockRecvBuffer
	thumb_func_end sub_80C8E1C
.else
	thumb_func_start sub_80C8E1C
sub_80C8E1C: @ 80C8E1C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080C8E40 @ =gTasks
	lsls r4, r5, 2
	adds r0, r4, r5
	lsls r6, r0, 3
	adds r2, r6, r1
	movs r3, 0x8
	ldrsh r0, [r2, r3]
	adds r7, r1, 0
	cmp r0, 0x1
	beq _080C8EB0
	cmp r0, 0x1
	bgt _080C8E44
	cmp r0, 0
	beq _080C8E4C
	b _080C8EF8
	.align 2, 0
_080C8E40: .4byte gTasks
_080C8E44:
	cmp r0, 0x2
	beq _080C8EEC
	cmp r0, 0x8
	bne _080C8EF8
_080C8E4C:
	ldr r1, _080C8E80 @ =gBlockSendBuffer
	movs r0, 0x64
	strb r0, [r1]
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	bne _080C8E9A
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8F06
	ldr r0, _080C8E84 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r4, r1, r0
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080C8E88
	movs r0, 0x3
	strh r0, [r4, 0x8]
	b _080C8F06
	.align 2, 0
_080C8E80: .4byte gBlockSendBuffer
_080C8E84: .4byte gTasks
_080C8E88:
	movs r0, 0
	bl de_sub_80C9274
	movs r0, 0x2
	bl sub_8007E9C
	movs r0, 0x1
	strh r0, [r4, 0x8]
	b _080C8F06
_080C8E9A:
	movs r0, 0
	bl de_sub_80C9294
	ldr r0, _080C8EAC @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	b _080C8EDE
	.align 2, 0
_080C8EAC: .4byte gTasks
_080C8EB0:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8F06
	adds r1, r4, 0
	ldr r4, _080C8EE8 @ =gBlockRecvBuffer
	adds r0, r7, 0
	adds r0, 0x12
	adds r2, r6, r0
	movs r6, 0x80
	lsls r6, 1
	movs r3, 0x3
_080C8ECA:
	ldrh r0, [r4]
	strh r0, [r2]
	adds r4, r6
	adds r2, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080C8ECA
	adds r1, r5
	lsls r1, 3
	adds r1, r7
_080C8EDE:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _080C8F06
	.align 2, 0
_080C8EE8: .4byte gBlockRecvBuffer
_080C8EEC:
	movs r0, 0
	strh r0, [r2, 0x8]
	adds r0, r5, 0
	bl SwitchTaskToFollowupFunc
	b _080C8F06
_080C8EF8:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r7
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
_080C8F06:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80C8E1C
.endif

	thumb_func_start sub_80C8EBC
sub_80C8EBC: @ 80C8EBC
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080C8EE4 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080C8EE8_B
	cmp r0, 0x1
	beq _080C8F00
	movs r0, 0
	strh r0, [r4, 0x8]
	adds r0, r2, 0
	bl SwitchTaskToFollowupFunc
	b _080C8F22
	.align 2, 0
_080C8EE4: .4byte gTasks
_080C8EE8_B:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8F22
	ldr r0, _080C8EFC @ =gUnknown_02038670
	movs r1, 0x8
	bl sub_80C857C
	b _080C8F1C
	.align 2, 0
_080C8EFC: .4byte gUnknown_02038670
_080C8F00:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8F22
	ldr r0, _080C8F28 @ =gUnknown_02038670
	ldr r1, _080C8F2C @ =gUnknown_0203869B
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C8F30 @ =gBlockRecvBuffer
	adds r1, r2
	movs r2, 0x8
	bl memcpy
_080C8F1C:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080C8F22:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C8F28: .4byte gUnknown_02038670
_080C8F2C: .4byte gUnknown_0203869B
_080C8F30: .4byte gBlockRecvBuffer
	thumb_func_end sub_80C8EBC

	thumb_func_start sub_80C8F34
sub_80C8F34: @ 80C8F34
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080C8F5C @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080C8F60
	cmp r0, 0x1
	beq _080C8F78
	movs r0, 0
	strh r0, [r4, 0x8]
	adds r0, r2, 0
	bl SwitchTaskToFollowupFunc
	b _080C8F9A
	.align 2, 0
_080C8F5C: .4byte gTasks
_080C8F60:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8F9A
	ldr r0, _080C8F74 @ =gUnknown_02038696
	movs r1, 0x4
	bl sub_80C857C
	b _080C8F94
	.align 2, 0
_080C8F74: .4byte gUnknown_02038696
_080C8F78:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8F9A
	ldr r0, _080C8FA0 @ =gUnknown_02038696
	ldr r1, _080C8FA4 @ =gUnknown_0203869B
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C8FA8 @ =gBlockRecvBuffer
	adds r1, r2
	movs r2, 0x4
	bl memcpy
_080C8F94:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080C8F9A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C8FA0: .4byte gUnknown_02038696
_080C8FA4: .4byte gUnknown_0203869B
_080C8FA8: .4byte gBlockRecvBuffer
	thumb_func_end sub_80C8F34

	.align 2, 0 @ Don't pad with nop.
