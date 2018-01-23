	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

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
