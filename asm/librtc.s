	thumb_func_start RTC_SetReadWrite
; void RTC_SetReadWrite()
RTC_SetReadWrite: ; 81DFF18
	push {r7,lr}
	mov r7, sp
	bl RTC_SetReadWriteInternal
	ldr r0, =0x03000F36
	movs r1, 0
	strb r1, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end RTC_SetReadWrite

	thumb_func_start RTC_SetReadOnly
; void RTC_SetReadOnly()
RTC_SetReadOnly: ; 81DFF30
	push {r7,lr}
	mov r7, sp
	bl RTC_SetReadOnlyInternal
	ldr r0, =0x03000F36
	movs r1, 0x1
	strb r1, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end RTC_SetReadOnly

	thumb_func_start RTC_Init
; u8 RTC_Init()
RTC_Init: ; 81DFF48
	push {r7,lr}
	sub sp, 0x10
	mov r7, sp
	adds r1, r7, 0x4
	adds r0, r1, 0
	bl RTC_GetControlReg
	lsls r1, r0, 24
	lsrs r0, r1, 24
	cmp r0, 0
	bne _081DFF62
	movs r0, 0
	b _081E0016
_081DFF62:
	adds r0, r7, 0
	movs r1, 0
	strb r1, [r0]
	adds r0, r7, 0x4
	ldrb r1, [r0, 0x7]
	movs r2, 0xC0
	adds r0, r1, 0
	ands r0, r2
	adds r2, r0, 0
	lsls r1, r2, 24
	lsrs r0, r1, 24
	cmp r0, 0x80
	beq _081DFF92
	adds r0, r7, 0x4
	ldrb r1, [r0, 0x7]
	movs r2, 0xC0
	adds r0, r1, 0
	ands r0, r2
	adds r2, r0, 0
	lsls r1, r2, 24
	lsrs r0, r1, 24
	cmp r0, 0
	bne _081DFFB0
	b _081DFF92
_081DFF92:
	bl RTC_Reset
	lsls r1, r0, 24
	lsrs r0, r1, 24
	cmp r0, 0
	bne _081DFFA2
	movs r0, 0
	b _081E0016
_081DFFA2:
	adds r1, r7, 0
	adds r0, r7, 0
	adds r1, r7, 0
	ldrb r2, [r1]
	adds r1, r2, 0x1
	adds r2, r1, 0
	strb r2, [r0]
_081DFFB0:
	adds r1, r7, 0x4
	adds r0, r1, 0
	bl RTC_GetTime
	adds r0, r7, 0x4
	ldrb r1, [r0, 0x6]
	movs r2, 0x80
	adds r0, r1, 0
	ands r0, r2
	adds r2, r0, 0
	lsls r1, r2, 24
	lsrs r0, r1, 24
	cmp r0, 0
	beq _081DFFFE
	bl RTC_Reset
	lsls r1, r0, 24
	lsrs r0, r1, 24
	cmp r0, 0
	bne _081DFFF0
	adds r0, r7, 0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r1, r0, 0
	movs r2, 0xF
	adds r0, r1, 0
	bics r0, r2
	adds r1, r0, 0
	lsls r0, r1, 24
	lsrs r1, r0, 24
	adds r0, r1, 0
	b _081E0016
_081DFFF0:
	adds r1, r7, 0
	adds r0, r7, 0
	adds r1, r7, 0
	ldrb r2, [r1]
	adds r1, r2, 0x1
	adds r2, r1, 0
	strb r2, [r0]
_081DFFFE:
	adds r0, r7, 0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r1, r0, 0
	movs r2, 0x1
	adds r0, r1, 0
	orrs r0, r2
	adds r1, r0, 0
	lsls r0, r1, 24
	lsrs r1, r0, 24
	adds r0, r1, 0
	b _081E0016
_081E0016:
	add sp, 0x10
	pop {r7}
	pop {r1}
	bx r1
	thumb_func_end RTC_Init

	thumb_func_start RTC_Reset
; u8 RTC_Reset()
RTC_Reset: ; 81E0020
	push {r7,lr}
	sub sp, 0x10
	mov r7, sp
	ldr r0, =0x03000F36
	ldrb r1, [r0]
	cmp r1, 0x1
	bne _081E0038
	movs r0, 0
	b _081E009C
	.pool
_081E0038:
	ldr r0, =0x03000F36
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x5
	strh r1, [r0]
	ldr r0, =GPIOPortDirection
	movs r1, 0x7
	strh r1, [r0]
	movs r0, 0x60
	bl RTC_WriteByte
	ldr r0, =GPIOPortData
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, =0x03000F36
	movs r1, 0
	strb r1, [r0]
	adds r0, r7, 0x4
	ldrb r1, [r0, 0x7]
	movs r2, 0
	ands r1, r2
	adds r2, r1, 0
	movs r3, 0x40
	adds r1, r2, 0
	orrs r1, r3
	adds r2, r1, 0
	strb r2, [r0, 0x7]
	adds r1, r7, 0x4
	adds r0, r1, 0
	bl RTC_SetControlReg
	adds r1, r7, 0
	strb r0, [r1]
	adds r0, r7, 0
	ldrb r1, [r0]
	adds r0, r1, 0
	b _081E009C
	.pool
_081E009C:
	add sp, 0x10
	pop {r7}
	pop {r1}
	bx r1
	thumb_func_end RTC_Reset

	thumb_func_start RTC_GetControlReg
; u8 RTC_GetControlReg(struct RTCInfo *rtc)
RTC_GetControlReg: ; 81E00A4
	push {r4,r7,lr}
	sub sp, 0x8
	mov r7, sp
	str r0, [r7]
	ldr r0, =0x03000F36
	ldrb r1, [r0]
	cmp r1, 0x1
	bne _081E00BC
	movs r0, 0
	b _081E0168
	.pool
_081E00BC:
	ldr r0, =0x03000F36
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x5
	strh r1, [r0]
	ldr r0, =GPIOPortDirection
	movs r1, 0x7
	strh r1, [r0]
	movs r0, 0x63
	bl RTC_WriteByte
	ldr r0, =GPIOPortDirection
	movs r1, 0x5
	strh r1, [r0]
	bl RTC_ReadByte
	adds r1, r7, 0x4
	strb r0, [r1]
	ldr r0, [r7]
	adds r1, r7, 0x4
	ldrb r2, [r1]
	movs r3, 0xC0
	adds r1, r2, 0
	ands r1, r3
	adds r2, r7, 0x4
	ldrb r3, [r2]
	movs r4, 0x20
	adds r2, r3, 0
	ands r2, r4
	adds r4, r2, 0
	lsls r3, r4, 24
	lsrs r2, r3, 24
	lsrs r3, r2, 3
	adds r2, r3, 0
	orrs r1, r2
	adds r2, r7, 0x4
	ldrb r3, [r2]
	movs r4, 0x8
	adds r2, r3, 0
	ands r2, r4
	adds r4, r2, 0
	lsls r3, r4, 24
	lsrs r2, r3, 24
	lsrs r3, r2, 2
	adds r2, r3, 0
	orrs r1, r2
	adds r2, r7, 0x4
	ldrb r3, [r2]
	movs r4, 0x2
	adds r2, r3, 0
	ands r2, r4
	adds r4, r2, 0
	lsls r3, r4, 24
	lsrs r2, r3, 24
	lsrs r3, r2, 1
	adds r2, r3, 0
	orrs r1, r2
	ldrb r2, [r0, 0x7]
	movs r3, 0
	ands r2, r3
	adds r3, r2, 0
	adds r2, r3, 0
	orrs r2, r1
	adds r1, r2, 0
	strb r1, [r0, 0x7]
	ldr r0, =GPIOPortData
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, =0x03000F36
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	b _081E0168
	.pool
_081E0168:
	add sp, 0x8
	pop {r4,r7}
	pop {r1}
	bx r1
	thumb_func_end RTC_GetControlReg

	thumb_func_start RTC_SetControlReg
; u8 RTC_SetControlReg(struct RTCInfo *rtc)
RTC_SetControlReg: ; 81E0170
	push {r4,r7,lr}
	sub sp, 0x8
	mov r7, sp
	str r0, [r7]
	ldr r0, =0x03000F36
	ldrb r1, [r0]
	cmp r1, 0x1
	bne _081E0188
	movs r0, 0
	b _081E0210
	.pool
_081E0188:
	ldr r0, =0x03000F36
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x5
	strh r1, [r0]
	adds r0, r7, 0x4
	ldr r1, [r7]
	ldrb r2, [r1, 0x7]
	movs r3, 0x4
	adds r1, r2, 0
	ands r1, r3
	adds r2, r1, 0
	lsls r1, r2, 3
	ldr r2, [r7]
	ldrb r3, [r2, 0x7]
	movs r4, 0x2
	adds r2, r3, 0
	ands r2, r4
	adds r3, r2, 0
	lsls r2, r3, 2
	adds r3, r2, 0
	movs r4, 0x40
	adds r2, r3, 0
	orrs r2, r4
	orrs r1, r2
	ldr r2, [r7]
	ldrb r3, [r2, 0x7]
	movs r4, 0x1
	adds r2, r3, 0
	ands r2, r4
	adds r3, r2, 0
	lsls r2, r3, 1
	orrs r1, r2
	adds r2, r1, 0
	strb r2, [r0]
	ldr r0, =GPIOPortDirection
	movs r1, 0x7
	strh r1, [r0]
	movs r0, 0x62
	bl RTC_WriteByte
	adds r0, r7, 0x4
	ldrb r1, [r0]
	adds r0, r1, 0
	bl RTC_WriteByteReversed
	ldr r0, =GPIOPortData
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, =0x03000F36
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	b _081E0210
	.pool
_081E0210:
	add sp, 0x8
	pop {r4,r7}
	pop {r1}
	bx r1
	thumb_func_end RTC_SetControlReg

	thumb_func_start RTC_GetDateTime
; u8 RTC_GetDateTime(u8 *rtcDateTime)
RTC_GetDateTime: ; 81E0218
	push {r7,lr}
	sub sp, 0x8
	mov r7, sp
	str r0, [r7]
	ldr r0, =0x03000F36
	ldrb r1, [r0]
	cmp r1, 0x1
	bne _081E0230
	movs r0, 0
	b _081E02C0
	.pool
_081E0230:
	ldr r0, =0x03000F36
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x5
	strh r1, [r0]
	ldr r0, =GPIOPortDirection
	movs r1, 0x7
	strh r1, [r0]
	movs r0, 0x65
	bl RTC_WriteByte
	ldr r0, =GPIOPortDirection
	movs r1, 0x5
	strh r1, [r0]
	adds r0, r7, 0x4
	movs r1, 0
	strb r1, [r0]
_081E025A:
	adds r0, r7, 0x4
	ldrb r1, [r0]
	cmp r1, 0x6
	bls _081E0270
	b _081E028E
	.pool
_081E0270:
	bl RTC_ReadByte
	adds r1, r7, 0x4
	ldrb r2, [r1]
	ldr r3, [r7]
	adds r1, r2, r3
	strb r0, [r1]
	adds r1, r7, 0x4
	adds r0, r7, 0x4
	adds r1, r7, 0x4
	ldrb r2, [r1]
	adds r1, r2, 0x1
	adds r2, r1, 0
	strb r2, [r0]
	b _081E025A
_081E028E:
	ldr r1, [r7]
	adds r0, r1, 0x4
	ldr r2, [r7]
	adds r1, r2, 0x4
	ldrb r2, [r1]
	movs r3, 0x7F
	adds r1, r2, 0
	ands r1, r3
	adds r2, r1, 0
	strb r2, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, =0x03000F36
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	b _081E02C0
	.pool
_081E02C0:
	add sp, 0x8
	pop {r7}
	pop {r1}
	bx r1
	thumb_func_end RTC_GetDateTime

	thumb_func_start RTC_SetDateTime
; u8 RTC_SetDateTime(u8 *rtcDateTime)
RTC_SetDateTime: ; 81E02C8
	push {r7,lr}
	sub sp, 0x8
	mov r7, sp
	str r0, [r7]
	ldr r0, =0x03000F36
	ldrb r1, [r0]
	cmp r1, 0x1
	bne _081E02E0
	movs r0, 0
	b _081E035C
	.pool
_081E02E0:
	ldr r0, =0x03000F36
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x5
	strh r1, [r0]
	ldr r0, =GPIOPortDirection
	movs r1, 0x7
	strh r1, [r0]
	movs r0, 0x64
	bl RTC_WriteByte
	adds r0, r7, 0x4
	movs r1, 0
	strb r1, [r0]
_081E0304:
	adds r0, r7, 0x4
	ldrb r1, [r0]
	cmp r1, 0x6
	bls _081E031C
	b _081E033C
	.pool
_081E031C:
	adds r0, r7, 0x4
	ldrb r1, [r0]
	ldr r2, [r7]
	adds r0, r1, r2
	ldrb r1, [r0]
	adds r0, r1, 0
	bl RTC_WriteByteReversed
	adds r1, r7, 0x4
	adds r0, r7, 0x4
	adds r1, r7, 0x4
	ldrb r2, [r1]
	adds r1, r2, 0x1
	adds r2, r1, 0
	strb r2, [r0]
	b _081E0304
_081E033C:
	ldr r0, =GPIOPortData
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, =0x03000F36
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	b _081E035C
	.pool
_081E035C:
	add sp, 0x8
	pop {r7}
	pop {r1}
	bx r1
	thumb_func_end RTC_SetDateTime

	thumb_func_start RTC_GetTime
; u8 RTC_GetTime(u8 *rtcTime)
RTC_GetTime: ; 81E0364
	push {r7,lr}
	sub sp, 0x8
	mov r7, sp
	str r0, [r7]
	ldr r0, =0x03000F36
	ldrb r1, [r0]
	cmp r1, 0x1
	bne _081E037C
	movs r0, 0
	b _081E0410
	.pool
_081E037C:
	ldr r0, =0x03000F36
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x5
	strh r1, [r0]
	ldr r0, =GPIOPortDirection
	movs r1, 0x7
	strh r1, [r0]
	movs r0, 0x67
	bl RTC_WriteByte
	ldr r0, =GPIOPortDirection
	movs r1, 0x5
	strh r1, [r0]
	adds r0, r7, 0x4
	movs r1, 0
	strb r1, [r0]
_081E03A6:
	adds r0, r7, 0x4
	ldrb r1, [r0]
	cmp r1, 0x2
	bls _081E03BC
	b _081E03DC
	.pool
_081E03BC:
	bl RTC_ReadByte
	adds r1, r7, 0x4
	ldrb r2, [r1]
	ldr r3, [r7]
	adds r1, r2, r3
	adds r2, r1, 0x4
	strb r0, [r2]
	adds r1, r7, 0x4
	adds r0, r7, 0x4
	adds r1, r7, 0x4
	ldrb r2, [r1]
	adds r1, r2, 0x1
	adds r2, r1, 0
	strb r2, [r0]
	b _081E03A6
_081E03DC:
	ldr r1, [r7]
	adds r0, r1, 0x4
	ldr r2, [r7]
	adds r1, r2, 0x4
	ldrb r2, [r1]
	movs r3, 0x7F
	adds r1, r2, 0
	ands r1, r3
	adds r2, r1, 0
	strb r2, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, =0x03000F36
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	b _081E0410
	.pool
_081E0410:
	add sp, 0x8
	pop {r7}
	pop {r1}
	bx r1
	thumb_func_end RTC_GetTime

	thumb_func_start RTC_SetTime
; u8 RTC_SetTime(u8 *rtcTime)
RTC_SetTime: ; 81E0418
	push {r7,lr}
	sub sp, 0x8
	mov r7, sp
	str r0, [r7]
	ldr r0, =0x03000F36
	ldrb r1, [r0]
	cmp r1, 0x1
	bne _081E0430
	movs r0, 0
	b _081E04AC
	.pool
_081E0430:
	ldr r0, =0x03000F36
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x5
	strh r1, [r0]
	ldr r0, =GPIOPortDirection
	movs r1, 0x7
	strh r1, [r0]
	movs r0, 0x66
	bl RTC_WriteByte
	adds r0, r7, 0x4
	movs r1, 0
	strb r1, [r0]
_081E0454:
	adds r0, r7, 0x4
	ldrb r1, [r0]
	cmp r1, 0x2
	bls _081E046C
	b _081E048E
	.pool
_081E046C:
	adds r0, r7, 0x4
	ldrb r1, [r0]
	ldr r2, [r7]
	adds r0, r1, r2
	adds r1, r0, 0x4
	ldrb r2, [r1]
	adds r0, r2, 0
	bl RTC_WriteByteReversed
	adds r1, r7, 0x4
	adds r0, r7, 0x4
	adds r1, r7, 0x4
	ldrb r2, [r1]
	adds r1, r2, 0x1
	adds r2, r1, 0
	strb r2, [r0]
	b _081E0454
_081E048E:
	ldr r0, =GPIOPortData
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, =0x03000F36
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	b _081E04AC
	.pool
_081E04AC:
	add sp, 0x8
	pop {r7}
	pop {r1}
	bx r1
	thumb_func_end RTC_SetTime

	thumb_func_start RTC_SetUnknownData
; u8 RTC_SetUnknownData(struct RTCInfo *rtc)
RTC_SetUnknownData: ; 81E04B4
	push {r4,r7,lr}
	sub sp, 0xC
	mov r7, sp
	str r0, [r7]
	ldr r0, =0x03000F36
	ldrb r1, [r0]
	cmp r1, 0x1
	bne _081E04CC
	movs r0, 0
	b _081E05E0
	.pool
_081E04CC:
	ldr r0, =0x03000F36
	movs r1, 0x1
	strb r1, [r0]
	adds r0, r7, 0
	adds r0, 0x8
	ldr r1, [r7]
	ldrb r2, [r1, 0x8]
	movs r3, 0xF
	adds r1, r2, 0
	ands r1, r3
	ldr r2, [r7]
	ldrb r3, [r2, 0x8]
	lsrs r2, r3, 4
	adds r3, r2, 0
	movs r4, 0xF
	adds r2, r3, 0
	ands r2, r4
	adds r4, r2, 0
	lsls r3, r4, 24
	lsrs r2, r3, 24
	adds r4, r2, 0
	lsls r3, r4, 2
	adds r3, r2
	lsls r2, r3, 1
	adds r1, r2
	ldrb r2, [r0]
	movs r3, 0
	ands r2, r3
	adds r3, r2, 0
	adds r2, r3, 0
	orrs r2, r1
	adds r1, r2, 0
	strb r1, [r0]
	adds r0, r7, 0
	adds r0, 0x8
	ldrb r1, [r0]
	cmp r1, 0xB
	bhi _081E0538
	adds r0, r7, 0
	adds r0, 0x8
	ldr r1, [r7]
	ldrb r2, [r0]
	movs r3, 0
	ands r2, r3
	adds r3, r2, 0
	ldrb r1, [r1, 0x8]
	adds r2, r3, 0
	orrs r2, r1
	adds r1, r2, 0
	strb r1, [r0]
	b _081E0556
	.pool
_081E0538:
	adds r0, r7, 0
	adds r0, 0x8
	ldr r1, [r7]
	ldrb r2, [r1, 0x8]
	movs r3, 0x80
	adds r1, r2, 0
	orrs r1, r3
	ldrb r2, [r0]
	movs r3, 0
	ands r2, r3
	adds r3, r2, 0
	adds r2, r3, 0
	orrs r2, r1
	adds r1, r2, 0
	strb r1, [r0]
_081E0556:
	adds r0, r7, 0
	adds r0, 0x8
	ldr r1, [r7]
	ldrb r2, [r0, 0x1]
	movs r3, 0
	ands r2, r3
	adds r3, r2, 0
	ldrb r1, [r1, 0x9]
	adds r2, r3, 0
	orrs r2, r1
	adds r1, r2, 0
	strb r1, [r0, 0x1]
	ldr r0, =GPIOPortData
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x5
	strh r1, [r0]
	ldr r0, =GPIOPortDirection
	movs r1, 0x7
	strh r1, [r0]
	movs r0, 0x68
	bl RTC_WriteByte
	adds r0, r7, 0x4
	movs r1, 0
	strb r1, [r0]
_081E058C:
	adds r0, r7, 0x4
	ldrb r1, [r0]
	cmp r1, 0x1
	bls _081E05A0
	b _081E05C2
	.pool
_081E05A0:
	adds r0, r7, 0
	adds r0, 0x8
	adds r1, r7, 0x4
	ldrb r2, [r1]
	adds r0, r2
	ldrb r1, [r0]
	adds r0, r1, 0
	bl RTC_WriteByteReversed
	adds r1, r7, 0x4
	adds r0, r7, 0x4
	adds r1, r7, 0x4
	ldrb r2, [r1]
	adds r1, r2, 0x1
	adds r2, r1, 0
	strb r2, [r0]
	b _081E058C
_081E05C2:
	ldr r0, =GPIOPortData
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, =0x03000F36
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	b _081E05E0
	.pool
_081E05E0:
	add sp, 0xC
	pop {r4,r7}
	pop {r1}
	bx r1
	thumb_func_end RTC_SetUnknownData

	thumb_func_start RTC_WriteByte
; u8 RTC_WriteByte(u8 value)
RTC_WriteByte: ; 81E05E8
	push {r4,r5,r7,lr}
	sub sp, 0x4
	mov r7, sp
	adds r1, r0, 0
	adds r2, r7, 0
	strb r1, [r2]
	adds r1, r7, 0x1
	movs r2, 0
	strb r2, [r1]
_081E05FA:
	adds r1, r7, 0x1
	ldrb r2, [r1]
	cmp r2, 0x7
	bls _081E0604
	b _081E0684
_081E0604:
	adds r1, r7, 0x2
	adds r3, r7, 0
	ldrb r2, [r3]
	adds r3, r7, 0x1
	ldrb r4, [r3]
	movs r5, 0x7
	subs r3, r5, r4
	asrs r2, r3
	adds r3, r2, 0
	movs r4, 0x1
	adds r2, r3, 0
	ands r2, r4
	adds r3, r2, 0
	strb r3, [r1]
	ldr r1, =GPIOPortData
	adds r2, r7, 0x2
	ldrb r3, [r2]
	adds r2, r3, 0
	lsls r3, r2, 1
	adds r2, r3, 0
	movs r3, 0x4
	orrs r2, r3
	adds r3, r2, 0
	strh r3, [r1]
	ldr r1, =GPIOPortData
	adds r2, r7, 0x2
	ldrb r3, [r2]
	adds r2, r3, 0
	lsls r3, r2, 1
	adds r2, r3, 0
	movs r3, 0x4
	orrs r2, r3
	adds r3, r2, 0
	strh r3, [r1]
	ldr r1, =GPIOPortData
	adds r2, r7, 0x2
	ldrb r3, [r2]
	adds r2, r3, 0
	lsls r3, r2, 1
	adds r2, r3, 0
	movs r3, 0x4
	orrs r2, r3
	adds r3, r2, 0
	strh r3, [r1]
	ldr r1, =GPIOPortData
	adds r2, r7, 0x2
	ldrb r3, [r2]
	adds r2, r3, 0
	lsls r3, r2, 1
	adds r2, r3, 0
	movs r3, 0x5
	orrs r2, r3
	adds r3, r2, 0
	strh r3, [r1]
	adds r2, r7, 0x1
	adds r1, r7, 0x1
	adds r2, r7, 0x1
	ldrb r3, [r2]
	adds r2, r3, 0x1
	adds r3, r2, 0
	strb r3, [r1]
	b _081E05FA
	.pool
_081E0684:
	add sp, 0x4
	pop {r4,r5,r7}
	pop {r1}
	bx r1
	thumb_func_end RTC_WriteByte

	thumb_func_start RTC_WriteByteReversed
; u8 RTC_WriteByteReversed(u8 value)
RTC_WriteByteReversed: ; 81E068C
	push {r4,r7,lr}
	sub sp, 0x4
	mov r7, sp
	adds r1, r0, 0
	adds r2, r7, 0
	strb r1, [r2]
	adds r1, r7, 0x1
	movs r2, 0
	strb r2, [r1]
_081E069E:
	adds r1, r7, 0x1
	ldrb r2, [r1]
	cmp r2, 0x7
	bls _081E06A8
	b _081E0724
_081E06A8:
	adds r1, r7, 0x2
	adds r3, r7, 0
	ldrb r2, [r3]
	adds r3, r7, 0x1
	ldrb r4, [r3]
	asrs r2, r4
	adds r3, r2, 0
	movs r4, 0x1
	adds r2, r3, 0
	ands r2, r4
	adds r3, r2, 0
	strb r3, [r1]
	ldr r1, =GPIOPortData
	adds r2, r7, 0x2
	ldrb r3, [r2]
	adds r2, r3, 0
	lsls r3, r2, 1
	adds r2, r3, 0
	movs r3, 0x4
	orrs r2, r3
	adds r3, r2, 0
	strh r3, [r1]
	ldr r1, =GPIOPortData
	adds r2, r7, 0x2
	ldrb r3, [r2]
	adds r2, r3, 0
	lsls r3, r2, 1
	adds r2, r3, 0
	movs r3, 0x4
	orrs r2, r3
	adds r3, r2, 0
	strh r3, [r1]
	ldr r1, =GPIOPortData
	adds r2, r7, 0x2
	ldrb r3, [r2]
	adds r2, r3, 0
	lsls r3, r2, 1
	adds r2, r3, 0
	movs r3, 0x4
	orrs r2, r3
	adds r3, r2, 0
	strh r3, [r1]
	ldr r1, =GPIOPortData
	adds r2, r7, 0x2
	ldrb r3, [r2]
	adds r2, r3, 0
	lsls r3, r2, 1
	adds r2, r3, 0
	movs r3, 0x5
	orrs r2, r3
	adds r3, r2, 0
	strh r3, [r1]
	adds r2, r7, 0x1
	adds r1, r7, 0x1
	adds r2, r7, 0x1
	ldrb r3, [r2]
	adds r2, r3, 0x1
	adds r3, r2, 0
	strb r3, [r1]
	b _081E069E
	.pool
_081E0724:
	add sp, 0x4
	pop {r4,r7}
	pop {r1}
	bx r1
	thumb_func_end RTC_WriteByteReversed

	thumb_func_start RTC_ReadByte
; u8 RTC_ReadByte()
RTC_ReadByte: ; 81E072C
	push {r7,lr}
	sub sp, 0x4
	mov r7, sp
	adds r0, r7, 0
	movs r1, 0
	strb r1, [r0]
_081E0738:
	adds r0, r7, 0
	ldrb r1, [r0]
	cmp r1, 0x7
	bls _081E0742
	b _081E07A8
_081E0742:
	ldr r0, =GPIOPortData
	movs r1, 0x4
	strh r1, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x4
	strh r1, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x4
	strh r1, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x4
	strh r1, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x4
	strh r1, [r0]
	ldr r0, =GPIOPortData
	movs r1, 0x5
	strh r1, [r0]
	adds r0, r7, 0x1
	ldr r1, =GPIOPortData
	ldrh r2, [r1]
	movs r3, 0x2
	adds r1, r2, 0
	ands r1, r3
	adds r3, r1, 0
	lsls r2, r3, 16
	lsrs r1, r2, 16
	lsrs r2, r1, 1
	adds r1, r2, 0
	strb r1, [r0]
	adds r0, r7, 0x2
	adds r1, r7, 0x2
	ldrb r2, [r1]
	lsrs r1, r2, 1
	adds r2, r7, 0x1
	ldrb r3, [r2]
	lsls r2, r3, 7
	orrs r1, r2
	adds r2, r1, 0
	strb r2, [r0]
	adds r1, r7, 0
	adds r0, r7, 0
	adds r1, r7, 0
	ldrb r2, [r1]
	adds r1, r2, 0x1
	adds r2, r1, 0
	strb r2, [r0]
	b _081E0738
	.pool
_081E07A8:
	adds r0, r7, 0x2
	ldrb r1, [r0]
	adds r0, r1, 0
	b _081E07B0
_081E07B0:
	add sp, 0x4
	pop {r7}
	pop {r1}
	bx r1
	thumb_func_end RTC_ReadByte

	thumb_func_start RTC_SetReadWriteInternal
; void RTC_SetReadWriteInternal()
RTC_SetReadWriteInternal: ; 81E07B8
	push {r7,lr}
	mov r7, sp
	ldr r0, =GPIOPortReadWrite
	movs r1, 0x1
	strh r1, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end RTC_SetReadWriteInternal

	thumb_func_start RTC_SetReadOnlyInternal
; void RTC_SetReadOnlyInternal()
RTC_SetReadOnlyInternal: ; 81E07CC
	push {r7,lr}
	mov r7, sp
	ldr r0, =GPIOPortReadWrite
	movs r1, 0
	strh r1, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end RTC_SetReadOnlyInternal
