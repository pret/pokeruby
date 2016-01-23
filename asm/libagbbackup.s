	thumb_func_start SwitchFlashBank
SwitchFlashBank: ; 81DF624
	lsls r0, 24
	lsrs r0, 24
	ldr r3, =0x0e005555
	movs r1, 0xAA
	strb r1, [r3]
	ldr r2, =0x0e002aaa
	movs r1, 0x55
	strb r1, [r2]
	movs r1, 0xB0
	strb r1, [r3]
	movs r1, 0xE0
	lsls r1, 20
	strb r0, [r1]
	bx lr
	.pool
	thumb_func_end SwitchFlashBank

	thumb_func_start ReadFlashID
; u16 ReadFlashID()
ReadFlashID: ; 81DF648
	push {r4,r5,lr}
	sub sp, 0x44
	mov r0, sp
	bl SetReadFlash1
	mov r5, sp
	adds r5, 0x1
	ldr r2, =0x0e005555
	movs r0, 0xAA
	strb r0, [r2]
	ldr r1, =0x0e002aaa
	movs r0, 0x55
	strb r0, [r1]
	movs r0, 0x90
	strb r0, [r2]
	add r1, sp, 0x40
	ldr r2, =0x00004e20
	adds r0, r2, 0
	b _081DF680
	.pool
_081DF67C:
	ldrh r0, [r1]
	subs r0, 0x1
_081DF680:
	strh r0, [r1]
	ldrh r0, [r1]
	cmp r0, 0
	bne _081DF67C
	ldr r0, =0x0e000001
	bl _call_via_r5
	lsls r0, 24
	lsrs r4, r0, 16
	movs r0, 0xE0
	lsls r0, 20
	bl _call_via_r5
	lsls r0, 24
	lsrs r0, 24
	orrs r4, r0
	ldr r1, =0x0e005555
	movs r0, 0xAA
	strb r0, [r1]
	ldr r2, =0x0e002aaa
	movs r0, 0x55
	strb r0, [r2]
	movs r0, 0xF0
	strb r0, [r1]
	strb r0, [r1]
	add r1, sp, 0x40
	ldr r2, =0x00004e20
	adds r0, r2, 0
	b _081DF6D0
	.pool
_081DF6CC:
	ldrh r0, [r1]
	subs r0, 0x1
_081DF6D0:
	strh r0, [r1]
	ldrh r0, [r1]
	cmp r0, 0
	bne _081DF6CC
	adds r0, r4, 0
	add sp, 0x44
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ReadFlashID

	thumb_func_start FlashTimerIntr
; void FlashTimerIntr()
FlashTimerIntr: ; 81DF6E4
	push {lr}
	ldr r1, =0x03000F2A
	ldrh r0, [r1]
	cmp r0, 0
	beq _081DF700
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bne _081DF700
	ldr r1, =0x03007490
	movs r0, 0x1
	strb r0, [r1]
_081DF700:
	pop {r0}
	bx r0
	.pool
	thumb_func_end FlashTimerIntr

	thumb_func_start SetFlashTimerIntr
; void SetFlashTimerIntr(u8 timer_id, void ( **irq_timer_func)())
SetFlashTimerIntr: ; 81DF70C
	push {lr}
	adds r2, r1, 0
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bhi _081DF740
	ldr r0, =0x03000F28
	strb r1, [r0]
	ldr r1, =0x03000F2C
	ldrb r0, [r0]
	lsls r0, 2
	ldr r3, =0x04000100
	adds r0, r3
	str r0, [r1]
	ldr r0, =FlashTimerIntr
	str r0, [r2]
	movs r0, 0
	b _081DF742
	.pool
_081DF740:
	movs r0, 0x1
_081DF742:
	pop {r1}
	bx r1
	thumb_func_end SetFlashTimerIntr

	thumb_func_start StartFlashTimer
StartFlashTimer: ; 81DF748
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, =0x030074B4
	lsls r2, r0, 1
	adds r2, r0
	lsls r2, 1
	ldr r0, [r1]
	adds r2, r0
	ldr r1, =0x03000F30
	ldr r0, =0x04000208
	mov r9, r0
	ldrh r0, [r0]
	strh r0, [r1]
	movs r3, 0
	mov r1, r9
	strh r3, [r1]
	ldr r0, =0x03000F2C
	mov r8, r0
	ldr r4, [r0]
	strh r3, [r4, 0x2]
	ldr r6, =0x04000200
	ldr r1, =0x03000F28
	mov r10, r1
	ldrb r1, [r1]
	movs r5, 0x8
	adds r0, r5, 0
	lsls r0, r1
	adds r1, r0, 0
	ldrh r0, [r6]
	orrs r0, r1
	strh r0, [r6]
	ldr r0, =0x03007490
	strb r3, [r0]
	ldr r1, =0x03000F2A
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, 0x2
	ldrh r0, [r2]
	strh r0, [r4]
	adds r0, r4, 0x2
	mov r1, r8
	str r0, [r1]
	ldrh r0, [r2, 0x2]
	strh r0, [r4, 0x2]
	str r4, [r1]
	ldr r1, =0x04000202
	mov r2, r10
	ldrb r0, [r2]
	lsls r5, r0
	strh r5, [r1]
	movs r0, 0x1
	mov r3, r9
	strh r0, [r3]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end StartFlashTimer

	thumb_func_start StopFlashTimer
StopFlashTimer: ; 81DF7F0
	ldr r3, =0x04000208
	movs r1, 0
	strh r1, [r3]
	ldr r2, =0x03000F2C
	ldr r0, [r2]
	strh r1, [r0]
	adds r0, 0x2
	str r0, [r2]
	strh r1, [r0]
	subs r0, 0x2
	str r0, [r2]
	ldr r2, =0x04000200
	ldr r0, =0x03000F28
	ldrb r0, [r0]
	movs r1, 0x8
	lsls r1, r0
	ldrh r0, [r2]
	bics r0, r1
	strh r0, [r2]
	ldr r0, =0x03000F30
	ldrh r0, [r0]
	strh r0, [r3]
	bx lr
	.pool
	thumb_func_end StopFlashTimer

	thumb_func_start ReadFlash1
; u8 ReadFlash1(int address)
ReadFlash1: ; 81DF834
	ldrb r0, [r0]
	bx lr
	thumb_func_end ReadFlash1

	thumb_func_start SetReadFlash1
; void SetReadFlash1(u8 ( *target_func)(int address))
SetReadFlash1: ; 81DF838
	push {lr}
	adds r2, r0, 0
	ldr r1, =0x03007494
	adds r0, r2, 0x1
	str r0, [r1]
	ldr r3, =ReadFlash1
	movs r0, 0x1
	eors r3, r0
	ldr r0, =SetReadFlash1
	ldr r1, =ReadFlash1
	subs r0, r1
	lsls r0, 15
	b _081DF86C
	.pool
_081DF860:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, 0x2
	adds r2, 0x2
	subs r0, r1, 0x1
	lsls r0, 16
_081DF86C:
	lsrs r1, r0, 16
	cmp r1, 0
	bne _081DF860
	pop {r0}
	bx r0
	thumb_func_end SetReadFlash1

	thumb_func_start ReadFlash_Core
ReadFlash_Core: ; 81DF878
	push {r4,lr}
	adds r4, r0, 0
	subs r3, r2, 0x1
	cmp r2, 0
	beq _081DF894
	movs r2, 0x1
	negs r2, r2
_081DF886:
	ldrb r0, [r4]
	strb r0, [r1]
	adds r4, 0x1
	adds r1, 0x1
	subs r3, 0x1
	cmp r3, r2
	bne _081DF886
_081DF894:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ReadFlash_Core

	thumb_func_start ReadFlash
ReadFlash: ; 81DF89C
	push {r4-r7,lr}
	sub sp, 0x80
	adds r5, r1, 0
	adds r6, r2, 0
	adds r7, r3, 0
	lsls r3, r0, 16
	lsrs r4, r3, 16
	ldr r2, =0x04000204
	ldrh r0, [r2]
	ldr r1, =0x0000fffc
	ands r0, r1
	movs r1, 0x3
	orrs r0, r1
	strh r0, [r2]
	ldr r0, =0x030074A0
	ldr r0, [r0]
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 10
	cmp r1, r0
	bne _081DF8D4
	lsrs r0, r3, 20
	lsls r0, 24
	lsrs r0, 24
	bl SwitchFlashBank
	movs r0, 0xF
	ands r4, r0
_081DF8D4:
	ldr r3, =ReadFlash_Core
	movs r0, 0x1
	eors r3, r0
	mov r2, sp
	ldr r0, =ReadFlash
	ldr r1, =ReadFlash_Core
	subs r0, r1
	lsls r0, 15
	b _081DF908
	.pool
_081DF8FC:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, 0x2
	adds r2, 0x2
	subs r0, r1, 0x1
	lsls r0, 16
_081DF908:
	lsrs r1, r0, 16
	cmp r1, 0
	bne _081DF8FC
	mov r3, sp
	adds r3, 0x1
	ldr r0, =0x030074A0
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	lsls r4, r0
	adds r0, r4, 0
	movs r2, 0xE0
	lsls r2, 20
	adds r1, r5, r2
	adds r0, r1
	adds r1, r6, 0
	adds r2, r7, 0
	bl _call_via_r3
	add sp, 0x80
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end ReadFlash

	thumb_func_start VerifyFlashSector_Core
VerifyFlashSector_Core: ; 81DF938
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r3, r1, 0
	subs r4, r2, 0x1
	cmp r2, 0
	beq _081DF95E
	movs r2, 0x1
	negs r2, r2
_081DF948:
	ldrb r1, [r3]
	ldrb r0, [r5]
	adds r5, 0x1
	adds r3, 0x1
	cmp r1, r0
	beq _081DF958
	subs r0, r3, 0x1
	b _081DF960
_081DF958:
	subs r4, 0x1
	cmp r4, r2
	bne _081DF948
_081DF95E:
	movs r0, 0
_081DF960:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end VerifyFlashSector_Core

	thumb_func_start VerifyFlashSector
VerifyFlashSector: ; 81DF968
	push {r4,r5,lr}
	sub sp, 0x100
	adds r5, r1, 0
	lsls r3, r0, 16
	lsrs r4, r3, 16
	ldr r2, =0x04000204
	ldrh r0, [r2]
	ldr r1, =0x0000fffc
	ands r0, r1
	movs r1, 0x3
	orrs r0, r1
	strh r0, [r2]
	ldr r0, =0x030074A0
	ldr r0, [r0]
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 10
	cmp r1, r0
	bne _081DF99C
	lsrs r0, r3, 20
	lsls r0, 24
	lsrs r0, 24
	bl SwitchFlashBank
	movs r0, 0xF
	ands r4, r0
_081DF99C:
	ldr r3, =VerifyFlashSector_Core
	movs r0, 0x1
	eors r3, r0
	mov r2, sp
	ldr r0, =VerifyFlashSector
	ldr r1, =VerifyFlashSector_Core
	subs r0, r1
	lsls r0, 15
	b _081DF9D0
	.pool
_081DF9C4:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, 0x2
	adds r2, 0x2
	subs r0, r1, 0x1
	lsls r0, 16
_081DF9D0:
	lsrs r1, r0, 16
	cmp r1, 0
	bne _081DF9C4
	mov r3, sp
	adds r3, 0x1
	ldr r0, =0x030074A0
	ldr r0, [r0]
	ldrb r1, [r0, 0x8]
	lsls r4, r1
	adds r1, r4, 0
	movs r2, 0xE0
	lsls r2, 20
	adds r1, r2
	ldrh r2, [r0, 0x4]
	adds r0, r5, 0
	bl _call_via_r3
	add sp, 0x100
	pop {r4,r5}
	pop {r1}
	bx r1
	.pool
	thumb_func_end VerifyFlashSector

	thumb_func_start VerifyFlashSectorFirstNBytes
VerifyFlashSectorFirstNBytes: ; 81DFA00
	push {r4-r6,lr}
	sub sp, 0x100
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r2, r0, 16
	lsrs r4, r2, 16
	ldr r0, =0x030074A0
	ldr r0, [r0]
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 10
	cmp r1, r0
	bne _081DFA28
	lsrs r0, r2, 20
	lsls r0, 24
	lsrs r0, 24
	bl SwitchFlashBank
	movs r0, 0xF
	ands r4, r0
_081DFA28:
	ldr r2, =0x04000204
	ldrh r0, [r2]
	ldr r1, =0x0000fffc
	ands r0, r1
	movs r1, 0x3
	orrs r0, r1
	strh r0, [r2]
	ldr r3, =VerifyFlashSector_Core
	movs r0, 0x1
	eors r3, r0
	mov r2, sp
	ldr r0, =VerifyFlashSector
	ldr r1, =VerifyFlashSector_Core
	subs r0, r1
	lsls r0, 15
	b _081DFA68
	.pool
_081DFA5C:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, 0x2
	adds r2, 0x2
	subs r0, r1, 0x1
	lsls r0, 16
_081DFA68:
	lsrs r1, r0, 16
	cmp r1, 0
	bne _081DFA5C
	mov r3, sp
	adds r3, 0x1
	ldr r0, =0x030074A0
	ldr r0, [r0]
	ldrb r1, [r0, 0x8]
	lsls r4, r1
	adds r1, r4, 0
	movs r0, 0xE0
	lsls r0, 20
	adds r1, r0
	adds r0, r5, 0
	adds r2, r6, 0
	bl _call_via_r3
	add sp, 0x100
	pop {r4-r6}
	pop {r1}
	bx r1
	.pool
	thumb_func_end VerifyFlashSectorFirstNBytes

	thumb_func_start ProgramFlashSectorsAndVerify
ProgramFlashSectorsAndVerify: ; 81DFA98
	push {r4-r6,lr}
	adds r5, r1, 0
	lsls r0, 16
	lsrs r4, r0, 16
	movs r6, 0
	b _081DFAAA
_081DFAA4:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_081DFAAA:
	cmp r6, 0x2
	bhi _081DFAD0
	ldr r0, =0x0300749C
	ldr r2, [r0]
	adds r0, r4, 0
	adds r1, r5, 0
	bl _call_via_r2
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	bne _081DFAA4
	adds r0, r4, 0
	adds r1, r5, 0
	bl VerifyFlashSector
	adds r2, r0, 0
	cmp r2, 0
	bne _081DFAA4
_081DFAD0:
	adds r0, r2, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.pool
	thumb_func_end ProgramFlashSectorsAndVerify

	thumb_func_start ProgramFlashSectorsVerifyFirstNBytes
ProgramFlashSectorsVerifyFirstNBytes: ; 81DFADC
	push {r4-r7,lr}
	adds r5, r1, 0
	adds r7, r2, 0
	lsls r0, 16
	lsrs r4, r0, 16
	movs r6, 0
	b _081DFAF0
_081DFAEA:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_081DFAF0:
	cmp r6, 0x2
	bhi _081DFB18
	ldr r0, =0x0300749C
	ldr r2, [r0]
	adds r0, r4, 0
	adds r1, r5, 0
	bl _call_via_r2
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	bne _081DFAEA
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r7, 0
	bl VerifyFlashSectorFirstNBytes
	adds r3, r0, 0
	cmp r3, 0
	bne _081DFAEA
_081DFB18:
	adds r0, r3, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.pool
	thumb_func_end ProgramFlashSectorsVerifyFirstNBytes

	thumb_func_start IdentifyFlash
; _BOOL2 IdentifyFlash()
IdentifyFlash: ; 81DFB24
	push {r4,lr}
	ldr r2, =0x04000204
	ldrh r0, [r2]
	ldr r1, =0x0000fffc
	ands r0, r1
	movs r1, 0x3
	orrs r0, r1
	strh r0, [r2]
	bl ReadFlashID
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r2, =gUnknown_086B07A8
	movs r4, 0x1
	b _081DFB52
	.pool
_081DFB50:
	adds r2, 0x4
_081DFB52:
	ldr r1, [r2]
	adds r0, r1, 0
	adds r0, 0x2C
	ldrb r0, [r0]
	cmp r0, 0
	beq _081DFB66
	ldrh r0, [r1, 0x2C]
	cmp r3, r0
	bne _081DFB50
	movs r4, 0
_081DFB66:
	ldr r1, =0x030074A4
	ldr r0, [r2]
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, =0x0300749C
	ldr r0, [r2]
	ldr r0, [r0, 0x4]
	str r0, [r1]
	ldr r1, =0x030074AC
	ldr r0, [r2]
	ldr r0, [r0, 0x8]
	str r0, [r1]
	ldr r1, =0x030074B0
	ldr r0, [r2]
	ldr r0, [r0, 0xC]
	str r0, [r1]
	ldr r1, =0x03007498
	ldr r0, [r2]
	ldr r0, [r0, 0x10]
	str r0, [r1]
	ldr r1, =0x030074B4
	ldr r0, [r2]
	ldr r0, [r0, 0x14]
	str r0, [r1]
	ldr r1, =0x030074A0
	ldr r0, [r2]
	adds r0, 0x18
	str r0, [r1]
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.pool
	thumb_func_end IdentifyFlash

	thumb_func_start PollingSR_COMMON
PollingSR_COMMON: ; 81DFBC4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r2, 24
	lsrs r5, r2, 24
	movs r0, 0
	mov r8, r0
	adds r0, r7, 0
	bl StartFlashTimer
	ldr r6, =0x03007494
	ldr r1, =0x0e005555
	mov r9, r1
	b _081DFC28
	.pool
_081DFBF0:
	movs r0, 0xF0
	mov r1, r9
	strb r0, [r1]
	movs r0, 0xA0
	lsls r0, 8
	b _081DFC1E
_081DFBFC:
	ldr r0, =0x03007490
	ldrb r0, [r0]
	cmp r0, 0
	beq _081DFC28
	ldr r1, [r6]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r5
	beq _081DFC50
	movs r0, 0xF0
	mov r1, r9
	strb r0, [r1]
	movs r0, 0xC0
	lsls r0, 8
_081DFC1E:
	orrs r7, r0
	mov r8, r7
	b _081DFC50
	.pool
_081DFC28:
	ldr r1, [r6]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r5
	beq _081DFC50
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _081DFBFC
	ldr r1, [r6]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r5
	bne _081DFBF0
_081DFC50:
	bl StopFlashTimer
	mov r0, r8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end PollingSR_COMMON

	thumb_func_start EraseFlashChip
EraseFlashChip: ; 81DFC64
	push {r4-r6,lr}
	sub sp, 0x40
	ldr r5, =0x04000204
	ldrh r1, [r5]
	ldr r6, =0x0000fffc
	ands r1, r6
	ldr r0, =0x030074A0
	ldr r0, [r0]
	ldrh r0, [r0, 0x10]
	orrs r1, r0
	strh r1, [r5]
	ldr r1, =0x0e005555
	movs r4, 0xAA
	strb r4, [r1]
	ldr r3, =0x0e002aaa
	movs r2, 0x55
	strb r2, [r3]
	movs r0, 0x80
	strb r0, [r1]
	strb r4, [r1]
	strb r2, [r3]
	movs r0, 0x10
	strb r0, [r1]
	mov r0, sp
	bl SetReadFlash1
	ldr r0, =0x03007498
	movs r1, 0xE0
	lsls r1, 20
	ldr r3, [r0]
	movs r0, 0x3
	movs r2, 0xFF
	bl _call_via_r3
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r5]
	ands r1, r6
	movs r2, 0x3
	orrs r1, r2
	strh r1, [r5]
	add sp, 0x40
	pop {r4-r6}
	pop {r1}
	bx r1
	.pool
	thumb_func_end EraseFlashChip

	thumb_func_start EraseFlashSector
EraseFlashSector: ; 81DFCD8
	push {r4-r7,lr}
	sub sp, 0x40
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, =0x030074A0
	ldr r0, [r0]
	ldrh r0, [r0, 0xA]
	cmp r6, r0
	bcc _081DFCF8
	ldr r0, =0x000080ff
	b _081DFD98
	.pool
_081DFCF8:
	lsrs r0, r6, 4
	lsls r0, 24
	lsrs r0, 24
	bl SwitchFlashBank
	movs r0, 0xF
	ands r6, r0
	movs r7, 0
_081DFD08:
	ldr r3, =0x04000204
	ldrh r1, [r3]
	ldr r0, =0x0000fffc
	ands r1, r0
	ldr r0, =0x030074A0
	ldr r2, [r0]
	ldrh r0, [r2, 0x10]
	orrs r1, r0
	strh r1, [r3]
	ldrb r4, [r2, 0x8]
	adds r0, r6, 0
	lsls r0, r4
	adds r4, r0, 0
	movs r0, 0xE0
	lsls r0, 20
	adds r4, r0
	ldr r1, =0x0e005555
	movs r5, 0xAA
	strb r5, [r1]
	ldr r3, =0x0e002aaa
	movs r2, 0x55
	strb r2, [r3]
	movs r0, 0x80
	strb r0, [r1]
	strb r5, [r1]
	strb r2, [r3]
	movs r0, 0x30
	strb r0, [r4]
	mov r0, sp
	bl SetReadFlash1
	ldr r0, =0x03007498
	ldr r3, [r0]
	movs r0, 0x2
	adds r1, r4, 0
	movs r2, 0xFF
	bl _call_via_r3
	lsls r0, 16
	lsrs r3, r0, 16
	movs r0, 0xA0
	lsls r0, 8
	ands r0, r3
	cmp r0, 0
	beq _081DFD88
	cmp r7, 0x3
	bhi _081DFD88
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	b _081DFD08
	.pool
_081DFD88:
	ldr r2, =0x04000204
	ldrh r0, [r2]
	ldr r1, =0x0000fffc
	ands r0, r1
	movs r1, 0x3
	orrs r0, r1
	strh r0, [r2]
	adds r0, r3, 0
_081DFD98:
	add sp, 0x40
	pop {r4-r7}
	pop {r1}
	bx r1
	.pool
	thumb_func_end EraseFlashSector

	thumb_func_start ProgramFlashByte
ProgramFlashByte: ; 81DFDA8
	push {r4-r7,lr}
	sub sp, 0x40
	adds r6, r1, 0
	lsls r1, r0, 16
	lsrs r4, r1, 16
	lsls r2, 24
	lsrs r7, r2, 24
	ldr r5, =0x030074A0
	ldr r0, [r5]
	ldr r0, [r0, 0x4]
	cmp r6, r0
	bcs _081DFE30
	lsrs r0, r1, 20
	lsls r0, 24
	lsrs r0, 24
	bl SwitchFlashBank
	movs r0, 0xF
	ldr r1, [r5]
	ands r4, r0
	ldrb r1, [r1, 0x8]
	lsls r4, r1
	movs r1, 0xE0
	lsls r1, 20
	adds r0, r6, r1
	adds r4, r0
	mov r0, sp
	bl SetReadFlash1
	ldr r2, =0x04000204
	ldrh r0, [r2]
	ldr r1, =0x0000fffc
	ands r0, r1
	ldr r1, [r5]
	ldrh r1, [r1, 0x10]
	orrs r0, r1
	strh r0, [r2]
	ldr r2, =0x0e005555
	movs r0, 0xAA
	strb r0, [r2]
	ldr r1, =0x0e002aaa
	movs r0, 0x55
	strb r0, [r1]
	movs r0, 0xA0
	strb r0, [r2]
	strb r7, [r4]
	ldr r0, =0x03007498
	ldr r3, [r0]
	movs r0, 0x1
	adds r1, r4, 0
	adds r2, r7, 0
	bl _call_via_r3
	lsls r0, 16
	lsrs r0, 16
	b _081DFE34
	.pool
_081DFE30:
	movs r0, 0x80
	lsls r0, 8
_081DFE34:
	add sp, 0x40
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end ProgramFlashByte

	thumb_func_start ProgramFlashByteInternal
ProgramFlashByteInternal: ; 81DFE3C
	push {r4,lr}
	ldr r4, =0x0e005555
	movs r2, 0xAA
	strb r2, [r4]
	ldr r3, =0x0e002aaa
	movs r2, 0x55
	strb r2, [r3]
	movs r2, 0xA0
	strb r2, [r4]
	ldrb r2, [r0]
	strb r2, [r1]
	ldr r3, =0x03007498
	ldrb r2, [r0]
	ldr r3, [r3]
	movs r0, 0x1
	bl _call_via_r3
	lsls r0, 16
	lsrs r0, 16
	pop {r4}
	pop {r1}
	bx r1
	.pool
	thumb_func_end ProgramFlashByteInternal

	thumb_func_start ProgramFlashSector
ProgramFlashSector: ; 81DFE74
	push {r4-r7,lr}
	sub sp, 0x40
	adds r7, r1, 0
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, =0x030074A0
	ldr r0, [r0]
	ldrh r0, [r0, 0xA]
	cmp r4, r0
	bcc _081DFE94
	ldr r0, =0x000080ff
	b _081DFF0E
	.pool
_081DFE94:
	adds r0, r4, 0
	bl EraseFlashSector
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	bne _081DFF0C
	lsrs r0, r4, 4
	lsls r0, 24
	lsrs r0, 24
	bl SwitchFlashBank
	movs r0, 0xF
	ands r4, r0
	mov r0, sp
	bl SetReadFlash1
	ldr r3, =0x04000204
	ldrh r1, [r3]
	ldr r0, =0x0000fffc
	ands r1, r0
	ldr r0, =0x030074A0
	ldr r2, [r0]
	ldrh r0, [r2, 0x10]
	orrs r1, r0
	strh r1, [r3]
	ldr r1, =0x030074A8
	ldr r0, [r2, 0x4]
	strh r0, [r1]
	ldrb r0, [r2, 0x8]
	lsls r4, r0
	movs r0, 0xE0
	lsls r0, 20
	adds r4, r0
	adds r6, r1, 0
	b _081DFEF6
	.pool
_081DFEEC:
	ldrh r0, [r6]
	subs r0, 0x1
	strh r0, [r6]
	adds r7, 0x1
	adds r4, 0x1
_081DFEF6:
	ldrh r0, [r6]
	cmp r0, 0
	beq _081DFF0C
	adds r0, r7, 0
	adds r1, r4, 0
	bl ProgramFlashByteInternal
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	beq _081DFEEC
_081DFF0C:
	adds r0, r5, 0
_081DFF0E:
	add sp, 0x40
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end ProgramFlashSector
