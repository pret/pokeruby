	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start unref_sub_8124F94
unref_sub_8124F94: @ 8124F94
	sub sp, 0x4
	movs r3, 0
	strb r3, [r0, 0x1]
	strb r3, [r0]
	strh r3, [r0, 0x2]
	movs r1, 0xC0
	lsls r1, 19
	str r1, [r0, 0x4]
	mov r1, sp
	strh r3, [r1]
	ldr r2, _08124FCC @ =0x040000d4
	str r1, [r2]
	adds r1, r0, 0
	adds r1, 0x8
	str r1, [r2, 0x4]
	ldr r1, _08124FD0 @ =0x81000040
	str r1, [r2, 0x8]
	ldr r1, [r2, 0x8]
	mov r1, sp
	strh r3, [r1]
	str r1, [r2]
	adds r0, 0x88
	str r0, [r2, 0x4]
	ldr r0, _08124FD4 @ =0x810000c0
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	add sp, 0x4
	bx lr
	.align 2, 0
_08124FCC: .4byte 0x040000d4
_08124FD0: .4byte 0x81000040
_08124FD4: .4byte 0x810000c0
	thumb_func_end unref_sub_8124F94

	thumb_func_start unref_sub_8124FD8
unref_sub_8124FD8: @ 8124FD8
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r7, _08124FE4 @ =0x040000d4
	b _0812508A
	.align 2, 0
_08124FE4: .4byte 0x040000d4
_08124FE8:
	ldrb r0, [r4, 0x1]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r0, r4, 0
	adds r0, 0x88
	adds r0, r1
	str r3, [r0]
	ldrb r1, [r4, 0x1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4, r0
	ldrb r1, [r5, 0x6]
	adds r0, 0x8E
	strb r1, [r0]
	ldrb r1, [r4, 0x1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4, r0
	ldrb r1, [r5, 0x4]
	adds r0, 0x8C
	strb r1, [r0]
	ldrb r1, [r4, 0x1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4, r0
	ldrb r1, [r5, 0x5]
	adds r0, 0x8D
	strb r1, [r0]
	ldrb r1, [r5, 0x4]
	ldrb r0, [r5, 0x5]
	adds r6, r1, 0
	muls r6, r0
	ldrh r2, [r4, 0x2]
	adds r1, r2, r6
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	ble _08125040
	movs r0, 0x2
	b _0812509C
_08125040:
	ldrh r0, [r5, 0x8]
	cmp r0, 0
	bne _08125060
	str r3, [r7]
	ldrh r1, [r4, 0x2]
	lsls r1, 6
	ldr r0, [r4, 0x4]
	adds r0, r1
	str r0, [r7, 0x4]
	lsls r0, r6, 4
	movs r1, 0x80
	lsls r1, 24
	orrs r0, r1
	str r0, [r7, 0x8]
	ldr r0, [r7, 0x8]
	b _0812506C
_08125060:
	lsls r0, r2, 6
	ldr r1, [r4, 0x4]
	adds r1, r0
	adds r0, r3, 0
	bl sub_800D238
_0812506C:
	ldrb r1, [r4, 0x1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4, r0
	ldrh r1, [r4, 0x2]
	adds r0, 0x90
	strh r1, [r0]
	ldrh r0, [r4, 0x2]
	adds r0, r6, r0
	strh r0, [r4, 0x2]
	ldrb r0, [r4, 0x1]
	adds r0, 0x1
	strb r0, [r4, 0x1]
	adds r5, 0xC
_0812508A:
	ldrb r0, [r4, 0x1]
	cmp r0, 0x1F
	bhi _0812509A
	ldr r3, [r5]
	cmp r3, 0
	bne _08124FE8
	movs r0, 0
	b _0812509C
_0812509A:
	movs r0, 0x1
_0812509C:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8124FD8

	thumb_func_start unref_sub_81250A4
unref_sub_81250A4: @ 81250A4
	push {r4,r5,lr}
	sub sp, 0x20
	adds r4, r0, 0
	adds r5, r1, 0
	b _081250FC
_081250AE:
	ldrb r1, [r4]
	lsls r1, 3
	adds r0, r4, 0
	adds r0, 0x8
	adds r0, r1
	str r2, [r0]
	ldrb r0, [r4]
	lsls r0, 3
	adds r0, r4, r0
	ldrb r1, [r5, 0x4]
	strb r1, [r0, 0xC]
	ldrb r0, [r5, 0x5]
	cmp r0, 0
	bne _081250D8
	ldrb r1, [r4]
	lsls r1, 4
	adds r0, r2, 0
	movs r2, 0x20
	bl LoadPalette
	b _081250EC
_081250D8:
	adds r0, r2, 0
	mov r1, sp
	bl sub_800D238
	ldrb r1, [r4]
	lsls r1, 4
	mov r0, sp
	movs r2, 0x20
	bl LoadPalette
_081250EC:
	ldrb r0, [r4]
	lsls r1, r0, 3
	adds r1, r4, r1
	strb r0, [r1, 0xD]
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	adds r5, 0x8
_081250FC:
	ldrb r0, [r4]
	cmp r0, 0xF
	bhi _0812510C
	ldr r2, [r5]
	cmp r2, 0
	bne _081250AE
	movs r0, 0
	b _0812510E
_0812510C:
	movs r0, 0x1
_0812510E:
	add sp, 0x20
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_81250A4

	thumb_func_start unref_sub_8125118
unref_sub_8125118: @ 8125118
	push {r4-r7,lr}
	ldr r4, _0812514C @ =0xfffffe00
	add sp, r4
	adds r5, r0, 0
	adds r6, r1, 0
	movs r2, 0x80
	lsls r2, 2
	mov r0, sp
	movs r1, 0
	bl memset
	ldrb r7, [r6, 0x5]
	ldr r0, [r6]
	mov r1, sp
	bl sub_800D238
	ldrb r4, [r5]
	cmp r4, r7
	bcs _08125186
_0812513E:
	ldrb r0, [r5]
	adds r0, r4
	cmp r0, 0xF
	ble _08125150
	movs r0, 0x1
	b _08125188
	.align 2, 0
_0812514C: .4byte 0xfffffe00
_08125150:
	lsls r2, r4, 3
	adds r0, r5, 0
	adds r0, 0x8
	adds r0, r2
	ldr r1, [r6]
	str r1, [r0]
	adds r2, r5, r2
	ldrb r0, [r6, 0x4]
	adds r0, r4, r0
	strb r0, [r2, 0xC]
	ldrb r0, [r5]
	strb r0, [r2, 0xD]
	lsls r0, r4, 5
	add r0, sp
	ldrb r1, [r5]
	lsls r1, 4
	movs r2, 0x20
	bl LoadPalette
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r7
	bcc _0812513E
_08125186:
	movs r0, 0
_08125188:
	movs r3, 0x80
	lsls r3, 2
	add sp, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8125118

	.align 2, 0 @ Don't pad with nop.
