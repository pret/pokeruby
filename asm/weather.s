	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_807C828
sub_807C828: @ 807C828
	push {r4-r6,lr}
	ldr r0, _0807C8EC
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	bne _0807C8E4
	movs r0, 0x90
	lsls r0, 5
	bl AllocSpritePalette
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _0807C8F0
	lsls r1, r5, 5
	ldr r2, _0807C8F4
	adds r1, r2
	ldr r2, _0807C8F8
	bl CpuSet
	bl sub_807CB10
	ldr r4, _0807C8FC
	ldr r1, _0807C900
	adds r0, r4, r1
	strb r5, [r0]
	ldr r0, _0807C904
	bl AllocSpritePalette
	ldr r2, _0807C908
	adds r1, r4, r2
	strb r0, [r1]
	ldr r1, _0807C90C
	adds r0, r4, r1
	strb r6, [r0]
	adds r2, 0x4
	adds r0, r4, r2
	strb r6, [r0]
	adds r1, 0x4
	adds r0, r4, r1
	strb r6, [r0]
	adds r2, 0xC
	adds r0, r4, r2
	strb r6, [r0]
	adds r1, 0x22
	adds r0, r4, r1
	strb r6, [r0]
	adds r2, 0x17
	adds r0, r4, r2
	strb r6, [r0]
	adds r1, 0x24
	adds r0, r4, r1
	strb r6, [r0]
	adds r2, 0x1B
	adds r0, r4, r2
	strb r6, [r0]
	subs r1, 0xD
	adds r0, r4, r1
	strb r6, [r0]
	adds r2, 0x18
	adds r0, r4, r2
	strb r6, [r0]
	subs r1, 0x1D
	adds r0, r4, r1
	strb r6, [r0]
	movs r0, 0x10
	movs r1, 0
	bl sub_807DB64
	movs r2, 0xDA
	lsls r2, 3
	adds r0, r4, r2
	strb r6, [r0]
	ldr r0, _0807C910
	adds r1, r4, r0
	movs r0, 0x3
	strb r0, [r1]
	movs r1, 0xD9
	lsls r1, 3
	adds r0, r4, r1
	strb r6, [r0]
	adds r2, 0x3
	adds r1, r4, r2
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _0807C914
	movs r1, 0x50
	bl CreateTask
	ldr r1, _0807C918
	adds r4, r1
	strb r0, [r4]
_0807C8E4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C8EC: .4byte sub_807CA34
_0807C8F0: .4byte gUnknown_083970E8
_0807C8F4: .4byte gPlttBufferUnfaded + 0x200
_0807C8F8: .4byte REG_BG0CNT
_0807C8FC: .4byte gUnknown_0202F7E8
_0807C900: .4byte 0x000006d5
_0807C904: .4byte 0x00001201
_0807C908: .4byte 0x000006d4
_0807C90C: .4byte 0x000006da
_0807C910: .4byte 0x000006c6
_0807C914: .4byte sub_807C9E4
_0807C918: .4byte 0x000006c9
	thumb_func_end sub_807C828

	thumb_func_start DoWeatherEffect
DoWeatherEffect: @ 807C91C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	beq _0807C932
	cmp r4, 0x5
	beq _0807C932
	cmp r4, 0xD
	beq _0807C932
	bl PlayRainSoundEffect
_0807C932:
	ldr r1, _0807C974
	ldr r2, _0807C978
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, r4
	beq _0807C956
	movs r3, 0xDA
	lsls r3, 3
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r4
	bne _0807C956
	ldr r0, _0807C97C
	lsls r1, r4, 4
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
_0807C956:
	ldr r1, _0807C974
	ldr r2, _0807C980
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	ldr r3, _0807C978
	adds r0, r1, r3
	strb r4, [r0]
	ldr r0, _0807C984
	adds r1, r0
	strh r2, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C974: .4byte gUnknown_0202F7E8
_0807C978: .4byte 0x000006d1
_0807C97C: .4byte gUnknown_08396FC8
_0807C980: .4byte 0x000006d3
_0807C984: .4byte 0x000006ce
	thumb_func_end DoWeatherEffect

	thumb_func_start sub_807C988
sub_807C988: @ 807C988
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl PlayRainSoundEffect
	ldr r0, _0807C9AC
	movs r2, 0xDA
	lsls r2, 3
	adds r1, r0, r2
	strb r4, [r1]
	ldr r1, _0807C9B0
	adds r0, r1
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C9AC: .4byte gUnknown_0202F7E8
_0807C9B0: .4byte 0x000006d1
	thumb_func_end sub_807C988

	thumb_func_start sub_807C9B4
sub_807C9B4: @ 807C9B4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl PlayRainSoundEffect
	ldr r1, _0807C9E0
	movs r2, 0xDA
	lsls r2, 3
	adds r0, r1, r2
	strb r4, [r0]
	adds r2, 0x1
	adds r0, r1, r2
	strb r4, [r0]
	movs r0, 0xD9
	lsls r0, 3
	adds r1, r0
	movs r0, 0x1
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C9E0: .4byte gUnknown_0202F7E8
	thumb_func_end sub_807C9B4

	thumb_func_start sub_807C9E4
sub_807C9E4: @ 807C9E4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _0807CA24
	movs r1, 0xD9
	lsls r1, 3
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807CA1C
	ldr r1, _0807CA28
	movs r3, 0xDA
	lsls r3, 3
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, 4
	adds r1, 0x8
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldr r1, _0807CA2C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0807CA30
	str r1, [r0]
_0807CA1C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CA24: .4byte gUnknown_0202F7E8
_0807CA28: .4byte gUnknown_08396FC8
_0807CA2C: .4byte gTasks
_0807CA30: .4byte sub_807CA34
	thumb_func_end sub_807C9E4

	thumb_func_start sub_807CA34
sub_807CA34: @ 807CA34
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r5, _0807CA90
	movs r0, 0xDA
	lsls r0, 3
	adds r6, r5, r0
	ldr r1, _0807CA94
	adds r7, r5, r1
	ldrb r0, [r6]
	ldrb r2, [r7]
	cmp r0, r2
	beq _0807CAA8
	ldr r0, _0807CA98
	mov r8, r0
	ldrb r0, [r6]
	lsls r0, 4
	mov r1, r8
	adds r1, 0xC
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0807CAB8
	ldrb r0, [r7]
	lsls r0, 4
	add r0, r8
	ldr r0, [r0]
	bl _call_via_r0
	ldr r1, _0807CA9C
	adds r0, r5, r1
	strb r4, [r0]
	ldr r2, _0807CAA0
	adds r0, r5, r2
	strb r4, [r0]
	ldrb r0, [r7]
	strb r0, [r6]
	ldr r0, _0807CAA4
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
	b _0807CAB8
	.align 2, 0
_0807CA90: .4byte gUnknown_0202F7E8
_0807CA94: .4byte 0x000006d1
_0807CA98: .4byte gUnknown_08396FC8
_0807CA9C: .4byte 0x000006c3
_0807CAA0: .4byte 0x000006c6
_0807CAA4: .4byte 0x000006d3
_0807CAA8:
	ldr r0, _0807CAD8
	ldrb r1, [r6]
	lsls r1, 4
	adds r0, 0x4
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
_0807CAB8:
	ldr r1, _0807CADC
	ldr r0, _0807CAE0
	ldr r2, _0807CAE4
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807CAD8: .4byte gUnknown_08396FC8
_0807CADC: .4byte gUnknown_083970B8
_0807CAE0: .4byte gUnknown_0202F7E8
_0807CAE4: .4byte 0x000006c6
	thumb_func_end sub_807CA34

	thumb_func_start sub_807CAE8
sub_807CAE8: @ 807CAE8
	ldr r0, _0807CAFC
	ldr r2, _0807CB00
	adds r1, r0, r2
	movs r2, 0
	strb r2, [r1]
	ldr r1, _0807CB04
	adds r0, r1
	strb r2, [r0]
	bx lr
	.align 2, 0
_0807CAFC: .4byte gUnknown_0202F7E8
_0807CB00: .4byte 0x000006c1
_0807CB04: .4byte 0x000006c2
	thumb_func_end sub_807CAE8

	thumb_func_start nullsub_38
nullsub_38: @ 807CB08
	bx lr
	thumb_func_end nullsub_38

	thumb_func_start sub_807CB0C
sub_807CB0C: @ 807CB0C
	movs r0, 0
	bx lr
	thumb_func_end sub_807CB0C

	thumb_func_start sub_807CB10
sub_807CB10: @ 807CB10
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r1, _0807CB50
	ldr r0, _0807CB54
	str r0, [r1]
	movs r0, 0
	mov r12, r0
	ldr r1, _0807CB58
	mov r10, r1
_0807CB28:
	mov r7, r10
	mov r0, r12
	cmp r0, 0
	bne _0807CB34
	ldr r1, _0807CB5C
	adds r7, r1
_0807CB34:
	movs r5, 0
	movs r0, 0x1
	add r0, r12
	mov r9, r0
_0807CB3C:
	lsls r1, r5, 8
	lsls r0, r5, 24
	lsrs r2, r0, 16
	mov r0, r12
	cmp r0, 0
	bne _0807CB60
	adds r0, r1, 0
	lsls r0, 12
	lsrs r4, r0, 16
	b _0807CB62
	.align 2, 0
_0807CB50: .4byte gUnknown_030006DC
_0807CB54: .4byte gUnknown_083970C8
_0807CB58: .4byte gUnknown_0202FC48
_0807CB5C: .4byte 0xfffffda0
_0807CB60:
	movs r4, 0
_0807CB62:
	movs r3, 0
	adds r1, r5, 0x1
	mov r8, r1
_0807CB68:
	subs r1, r2, r4
	lsls r1, 16
	lsrs r2, r1, 16
	lsls r0, r3, 5
	adds r0, r7
	adds r0, r5
	lsrs r1, 24
	strb r1, [r0]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x2
	bls _0807CB68
	adds r6, r2, 0
	movs r0, 0xF8
	lsls r0, 5
	subs r0, r2
	cmp r0, 0
	bge _0807CB90
	adds r0, 0xF
_0807CB90:
	lsls r0, 12
	lsrs r4, r0, 16
	cmp r5, 0xB
	bhi _0807CBDA
	cmp r3, 0x12
	bhi _0807CC00
_0807CB9C:
	adds r0, r2, r4
	lsls r0, 16
	lsrs r2, r0, 16
	subs r0, r2, r6
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0
	ble _0807CBB8
	lsrs r0, 31
	adds r0, r1, r0
	asrs r0, 1
	subs r0, r2, r0
	lsls r0, 16
	lsrs r2, r0, 16
_0807CBB8:
	lsls r0, r3, 5
	adds r0, r7
	adds r1, r0, r5
	lsrs r0, r2, 8
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1F
	bls _0807CBCE
	movs r0, 0x1F
	strb r0, [r1]
_0807CBCE:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x12
	bls _0807CB9C
	b _0807CC00
_0807CBDA:
	cmp r3, 0x12
	bhi _0807CC00
	movs r6, 0x1F
_0807CBE0:
	adds r1, r2, r4
	lsls r1, 16
	lsrs r2, r1, 16
	lsls r0, r3, 5
	adds r0, r7
	adds r0, r5
	lsrs r1, 24
	strb r1, [r0]
	cmp r1, 0x1F
	bls _0807CBF6
	strb r6, [r0]
_0807CBF6:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x12
	bls _0807CBE0
_0807CC00:
	mov r1, r8
	lsls r0, r1, 16
	lsrs r5, r0, 16
	cmp r5, 0x1F
	bls _0807CB3C
	mov r1, r9
	lsls r0, r1, 16
	lsrs r0, 16
	mov r12, r0
	cmp r0, 0x1
	bls _0807CB28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_807CB10

	thumb_func_start sub_807CC24
sub_807CC24: @ 807CC24
	push {r4-r7,lr}
	ldr r0, _0807CC50
	movs r1, 0xD8
	lsls r1, 3
	adds r4, r0, r1
	ldr r2, _0807CC54
	adds r1, r0, r2
	ldrb r7, [r4]
	mov r12, r7
	movs r6, 0
	ldrsb r6, [r4, r6]
	movs r5, 0
	ldrsb r5, [r1, r5]
	adds r3, r0, 0
	cmp r6, r5
	bne _0807CC5C
	ldr r0, _0807CC58
	adds r1, r3, r0
	movs r0, 0x3
	strb r0, [r1]
	b _0807CCA4
	.align 2, 0
_0807CC50: .4byte gUnknown_0202F7E8
_0807CC54: .4byte 0x000006c1
_0807CC58: .4byte 0x000006c6
_0807CC5C:
	ldr r1, _0807CC84
	adds r2, r3, r1
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	ldr r7, _0807CC88
	adds r1, r3, r7
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _0807CCA4
	movs r0, 0
	strb r0, [r2]
	mov r0, r12
	cmp r6, r5
	bge _0807CC8C
	adds r0, 0x1
	b _0807CC90
	.align 2, 0
_0807CC84: .4byte 0x000006c3
_0807CC88: .4byte 0x000006c2
_0807CC8C:
	mov r0, r12
	subs r0, 0x1
_0807CC90:
	strb r0, [r4]
	movs r1, 0xD8
	lsls r1, 3
	adds r0, r3, r1
	movs r2, 0
	ldrsb r2, [r0, r2]
	movs r0, 0
	movs r1, 0x20
	bl sub_807CEBC
_0807CCA4:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_807CC24

	thumb_func_start sub_807CCAC
sub_807CCAC: @ 807CCAC
	push {lr}
	ldr r2, _0807CCE4
	ldr r0, _0807CCE8
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0807CCCA
	ldr r3, _0807CCEC
	adds r1, r2, r3
	movs r0, 0
	strb r0, [r1]
_0807CCCA:
	movs r1, 0xDA
	lsls r1, 3
	adds r0, r2, r1
	ldrb r0, [r0]
	subs r0, 0x3
	cmp r0, 0xA
	bhi _0807CD94
	lsls r0, 2
	ldr r1, _0807CCF0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807CCE4: .4byte gUnknown_0202F7E8
_0807CCE8: .4byte 0x000006cb
_0807CCEC: .4byte 0x000006ca
_0807CCF0: .4byte _0807CCF4
	.align 2, 0
_0807CCF4:
	.4byte _0807CD20
	.4byte _0807CD20
	.4byte _0807CD20
	.4byte _0807CD6C
	.4byte _0807CD94
	.4byte _0807CD94
	.4byte _0807CD94
	.4byte _0807CD94
	.4byte _0807CD20
	.4byte _0807CD48
	.4byte _0807CD20
_0807CD20:
	bl sub_807CDC4
	lsls r0, 24
	cmp r0, 0
	bne _0807CDB4
	ldr r0, _0807CD40
	movs r2, 0xD8
	lsls r2, 3
	adds r1, r0, r2
	movs r2, 0x3
	strb r2, [r1]
	ldr r3, _0807CD44
	adds r0, r3
	strb r2, [r0]
	b _0807CDB4
	.align 2, 0
_0807CD40: .4byte gUnknown_0202F7E8
_0807CD44: .4byte 0x000006c6
_0807CD48:
	bl sub_807CE24
	lsls r0, 24
	cmp r0, 0
	bne _0807CDB4
	ldr r1, _0807CD64
	movs r0, 0xD8
	lsls r0, 3
	adds r2, r1, r0
	movs r0, 0xFA
	strb r0, [r2]
	ldr r2, _0807CD68
	adds r1, r2
	b _0807CDB0
	.align 2, 0
_0807CD64: .4byte gUnknown_0202F7E8
_0807CD68: .4byte 0x000006c6
_0807CD6C:
	bl sub_807CE7C
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _0807CDB4
	ldr r0, _0807CD8C
	movs r3, 0xD8
	lsls r3, 3
	adds r1, r0, r3
	strb r2, [r1]
	ldr r1, _0807CD90
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0]
	b _0807CDB4
	.align 2, 0
_0807CD8C: .4byte gUnknown_0202F7E8
_0807CD90: .4byte 0x000006c6
_0807CD94:
	ldr r0, _0807CDB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0807CDB4
	ldr r3, _0807CDBC
	adds r0, r2, r3
	ldrb r1, [r0]
	subs r3, 0x1
	adds r0, r2, r3
	strb r1, [r0]
	ldr r0, _0807CDC0
	adds r1, r2, r0
_0807CDB0:
	movs r0, 0x3
	strb r0, [r1]
_0807CDB4:
	pop {r0}
	bx r0
	.align 2, 0
_0807CDB8: .4byte gPaletteFade
_0807CDBC: .4byte 0x000006c1
_0807CDC0: .4byte 0x000006c6
	thumb_func_end sub_807CCAC

	thumb_func_start sub_807CDC4
sub_807CDC4: @ 807CDC4
	push {r4,lr}
	sub sp, 0x4
	ldr r2, _0807CE00
	ldr r0, _0807CE04
	adds r4, r2, r0
	ldrb r0, [r4]
	cmp r0, 0x10
	beq _0807CE1A
	adds r1, r0, 0x1
	strb r1, [r4]
	lsls r0, r1, 24
	lsrs r0, 24
	cmp r0, 0xF
	bhi _0807CE0C
	movs r3, 0x10
	subs r3, r1
	lsls r3, 24
	lsrs r3, 24
	ldr r1, _0807CE08
	adds r0, r2, r1
	ldrh r0, [r0]
	str r0, [sp]
	movs r0, 0
	movs r1, 0x20
	movs r2, 0x3
	bl sub_807D1BC
	movs r0, 0x1
	b _0807CE1C
	.align 2, 0
_0807CE00: .4byte gUnknown_0202F7E8
_0807CE04: .4byte 0x000006c7
_0807CE08: .4byte 0x000006c4
_0807CE0C:
	movs r0, 0
	movs r1, 0x20
	movs r2, 0x3
	bl sub_807CEBC
	movs r0, 0x10
	strb r0, [r4]
_0807CE1A:
	movs r0, 0
_0807CE1C:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807CDC4

	thumb_func_start sub_807CE24
sub_807CE24: @ 807CE24
	push {r4,lr}
	ldr r2, _0807CE58
	ldr r0, _0807CE5C
	adds r4, r2, r0
	ldrb r0, [r4]
	cmp r0, 0x10
	beq _0807CE74
	adds r3, r0, 0x1
	strb r3, [r4]
	lsls r0, r3, 24
	lsrs r0, 24
	cmp r0, 0xF
	bhi _0807CE64
	movs r0, 0x6
	negs r0, r0
	movs r1, 0x10
	subs r1, r3
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0807CE60
	adds r2, r3
	ldrh r2, [r2]
	bl sub_807D304
	movs r0, 0x1
	b _0807CE76
	.align 2, 0
_0807CE58: .4byte gUnknown_0202F7E8
_0807CE5C: .4byte 0x000006c7
_0807CE60: .4byte 0x000006c4
_0807CE64:
	movs r2, 0x6
	negs r2, r2
	movs r0, 0
	movs r1, 0x20
	bl sub_807CEBC
	movs r0, 0x10
	strb r0, [r4]
_0807CE74:
	movs r0, 0
_0807CE76:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807CE24

	thumb_func_start sub_807CE7C
sub_807CE7C: @ 807CE7C
	push {lr}
	ldr r2, _0807CEA4
	ldr r1, _0807CEA8
	adds r0, r2, r1
	ldrb r1, [r0]
	cmp r1, 0x10
	beq _0807CEB0
	adds r1, 0x1
	strb r1, [r0]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0807CEAC
	adds r1, r2, r3
	ldrh r1, [r1]
	bl sub_807D424
	movs r0, 0x1
	b _0807CEB2
	.align 2, 0
_0807CEA4: .4byte gUnknown_0202F7E8
_0807CEA8: .4byte 0x000006c7
_0807CEAC: .4byte 0x000006c4
_0807CEB0:
	movs r0, 0
_0807CEB2:
	pop {r1}
	bx r1
	thumb_func_end sub_807CE7C

	thumb_func_start nullsub_39
nullsub_39: @ 807CEB8
	bx lr
	thumb_func_end nullsub_39

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
	ldr r0, _0807CF30
	ldr r0, [r0]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807CF3C
	lsls r1, r5, 1
	ldr r0, _0807CF34
	adds r0, r1, r0
	ldr r2, _0807CF38
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
	ldr r2, _0807CF54
	ldr r3, _0807CF58
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r1, r0
	bne _0807CF60
_0807CF50:
	ldr r0, _0807CF5C
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
	ldr r3, _0807CF9C
	mov r10, r3
_0807CF82:
	adds r2, r5, 0
	lsls r0, r5, 1
	ldr r4, _0807CFA0
	adds r1, r0, r4
	ldrh r0, [r1]
	ldr r3, _0807CFA4
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
	ldr r1, _0807D040
	mov r10, r1
_0807CFF2:
	adds r2, r5, 0
	lsls r0, r2, 1
	ldr r3, _0807D044
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
	ldr r0, _0807D098
	ldr r0, [r0]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807D0A4
	lsls r1, r5, 1
	ldr r0, _0807D09C
	adds r0, r1, r0
	ldr r2, _0807D0A0
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
	ldr r2, _0807D10C
	mov r10, r2
	ldr r3, [sp]
	lsls r0, r3, 24
	asrs r6, r0, 11
_0807D0C2:
	lsls r1, r5, 1
	ldr r4, _0807D110
	adds r0, r1, r4
	ldrh r0, [r0]
	lsls r4, r0, 16
	ldr r2, _0807D114
	cmp r0, r2
	beq _0807D0FA
	ldr r3, _0807D118
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
	ldr r3, _0807D184
	mov r10, r3
	asrs r6, r0, 11
_0807D132:
	lsls r0, r5, 1
	ldr r1, _0807D188
	adds r4, r0, r1
	ldr r2, _0807D18C
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
	ldr r0, _0807D1B4
	adds r0, r1, r0
	ldr r2, _0807D1B8
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
	ldr r0, _0807D244
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
	ldr r0, _0807D254
	ldr r1, [sp, 0x10]
	adds r5, r1, r0
	b _0807D25E
	.align 2, 0
_0807D254: .4byte gUnknown_0202F9E8
_0807D258:
	ldr r0, _0807D2F8
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
	ldr r1, _0807D2FC
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
	ldr r0, _0807D300
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
	ldr r0, _0807D364
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
	ldr r5, _0807D418
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
	ldr r1, _0807D41C
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
	ldr r0, _0807D420
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
	ldr r0, _0807D508
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
	ldr r0, _0807D50C
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
	ldr r3, _0807D568
	ldr r0, _0807D56C
	adds r1, r3, r0
	ldrb r0, [r1]
	cmp r0, 0x5
	bhi _0807D562
	ldr r4, _0807D570
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
	ldr r2, _0807D59C
	ldr r4, _0807D5A0
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r1, r0
	bcs _0807D5B2
	ldr r5, _0807D5A4
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
	ldr r5, _0807D5E8
	ldr r1, _0807D5EC
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
	ldr r3, _0807D638
	ldr r0, _0807D63C
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
	ldr r1, _0807D640
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
	ldr r4, _0807D678
	movs r1, 0
	b _0807D684
	.align 2, 0
_0807D678: .4byte 0x0000ffff
_0807D67C:
	movs r4, 0
	b _0807D682
_0807D680:
	ldr r4, _0807D6A4
_0807D682:
	movs r1, 0x1
_0807D684:
	ldr r0, _0807D6A8
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
	ldr r0, _0807D6E0
	ldr r1, _0807D6E4
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
	ldr r0, _0807D6E8
	ldr r3, _0807D6EC
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
	ldr r1, _0807D708
	ldr r3, _0807D70C
	adds r0, r1, r3
	strh r4, [r0]
	cmp r2, 0
	beq _0807D714
	ldr r0, _0807D710
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
	ldr r4, _0807D760
	ldr r1, _0807D764
	adds r0, r4, r1
	movs r1, 0
	movs r5, 0x1
	strb r5, [r0]
	ldr r2, _0807D768
	adds r0, r4, r2
	strb r5, [r0]
	ldr r3, _0807D76C
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
	ldr r0, _0807D784
	ldr r1, _0807D788
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
	ldr r5, _0807D7CC
	ldr r2, _0807D7D0
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
	ldr r2, _0807D814
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
	ldr r6, _0807D818
	ldr r0, _0807D81C
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
	ldr r0, _0807D84C
	adds r0, r1, r0
	ldr r2, _0807D850
	adds r1, r2
	movs r2, 0x8
	bl CpuFastSet
	ldr r0, _0807D854
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
	ldr r3, _0807D870
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
	ldr r1, _0807D890
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
	ldr r1, _0807D8A8
	ldr r2, _0807D8AC
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
	ldr r2, _0807D8BC
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
	ldr r4, _0807D8E8
	ldr r1, _0807D8EC
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
	ldr r1, _0807D94C
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r6, r4, 13
	ldr r5, _0807D950
	adds r1, r6, r5
	bl LZ77UnCompWram
	subs r0, r4, 0x1
	cmp r4, 0
	bne _0807D95C
	ldr r0, _0807D954
	strh r0, [r5]
	movs r2, 0x1
	adds r4, r5, 0
	movs r3, 0
	ldr r5, _0807D958
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
	ldr r0, _0807D9A4
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
	ldr r0, _0807D9BC
	ldr r2, _0807D9C0
	adds r1, r0, r2
	movs r2, 0x1
	strb r2, [r1]
	ldr r1, _0807D9C4
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
	ldr r1, _0807D9F0
	ldr r0, _0807D9F4
	adds r4, r1, r0
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0x1F
	bgt _0807D9FC
	ldr r0, _0807D9F8
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
	ldr r1, _0807DA3C
	ldr r2, _0807DA40
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
	ldr r0, _0807DA44
	adds r1, r0
	strh r2, [r1]
	ldr r1, _0807DA48
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
	ldr r5, _0807DA68
	ldr r0, _0807DA6C
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
	ldr r1, _0807DABC
	ldrh r1, [r1]
	cmp r0, r1
	ble _0807DB54
	strh r2, [r6]
	ldr r0, _0807DAC0
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
	ldr r3, _0807DAC4
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
	ldr r1, _0807DB10
	movs r3, 0
	ldrsh r0, [r2, r3]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	subs r0, 0x1
	asrs r0, 6
	adds r0, 0x2
	ldr r2, _0807DB14
	adds r6, r5, r2
	adds r2, r0, 0
	strh r0, [r6]
	ldr r3, _0807DB18
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
	ldr r1, _0807DB5C
	ldrh r1, [r1]
	cmp r0, r1
	ble _0807DB54
	strh r6, [r2]
	ldr r1, _0807DB60
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
	ldr r3, _0807DB98
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
	ldr r2, _0807DB9C
	adds r3, r2
	strh r1, [r3]
	ldr r2, _0807DBA0
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
	ldr r3, _0807DBD8
	ldr r5, _0807DBDC
	adds r4, r3, r5
	movs r5, 0
	strh r0, [r4]
	ldr r4, _0807DBE0
	adds r0, r3, r4
	strh r1, [r0]
	ldr r1, _0807DBE4
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
	ldr r0, _0807DC40
	movs r1, 0xE6
	lsls r1, 3
	adds r3, r0, r1
	ldr r2, [r3]
	ldr r6, _0807DC44
	adds r5, r0, r6
	ldr r1, [r5]
	adds r4, r0, 0
	cmp r2, r1
	beq _0807DCAC
	ldr r0, _0807DC48
	adds r2, r4, r0
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	ldr r6, _0807DC4C
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
	ldr r1, _0807DC68
	adds r3, r4, r1
	ldr r2, _0807DC6C
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
	ldr r3, _0807DCA0
	ldr r6, _0807DCA4
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
	ldr r2, _0807DCA8
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
	ldr r1, _0807DCCC
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
	bl sub_808070C
	b _0807DD46
_0807DD00:
	movs r0, 0x2
	bl sub_808070C
	b _0807DD46
_0807DD08:
	movs r0, 0x3
	bl sub_808070C
	b _0807DD46
_0807DD10:
	movs r0, 0x4
	bl sub_808070C
	b _0807DD46
_0807DD18:
	movs r0, 0x5
	bl sub_808070C
	b _0807DD46
_0807DD20:
	movs r0, 0x6
	bl sub_808070C
	b _0807DD46
_0807DD28:
	movs r0, 0x9
	bl sub_808070C
	b _0807DD46
_0807DD30:
	movs r0, 0x7
	bl sub_808070C
	b _0807DD46
_0807DD38:
	movs r0, 0x8
	bl sub_808070C
	b _0807DD46
_0807DD40:
	movs r0, 0xB
	bl sub_808070C
_0807DD46:
	pop {r0}
	bx r0
	thumb_func_end unref_sub_807DCB4

	thumb_func_start weather_get_current
weather_get_current: @ 807DD4C
	ldr r0, _0807DD58
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
	ldr r1, _0807DD7C
	ldr r3, _0807DD80
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
	ldr r0, _0807DD90
	adds r1, r0
	movs r0, 0
	b _0807DDA6
	.align 2, 0
_0807DD90: .4byte 0x000006dd
_0807DD94:
	ldr r3, _0807DD9C
	adds r1, r3
	movs r0, 0x1
	b _0807DDA6
	.align 2, 0
_0807DD9C: .4byte 0x000006dd
_0807DDA0:
	ldr r0, _0807DDB4
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
	ldr r0, _0807DDE0
	ldr r1, _0807DDE4
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
	ldr r0, _0807DE08
	ldr r1, _0807DE0C
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0807DE08: .4byte gUnknown_0202F7E8
_0807DE0C: .4byte 0x000006d3
	thumb_func_end sub_807DDFC

	thumb_func_start sub_807DE10
sub_807DE10: @ 807DE10
	ldr r0, _0807DE1C
	ldr r1, _0807DE20
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
	ldr r0, _0807DE30
	ldr r1, _0807DE34
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
	ldr r0, _0807DE5C
	ldr r5, _0807DE60
	adds r1, r5, 0
	movs r2, 0x10
	bl CpuSet
	adds r4, r5
	movs r0, 0
	strb r0, [r4]
	ldr r0, _0807DE64
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
	ldr r1, _0807DE70
	ldr r0, _0807DE74
	str r0, [r1]
	bx lr
	.align 2, 0
_0807DE70: .4byte gUnknown_030006DC
_0807DE74: .4byte gUnknown_083970C8
	thumb_func_end sub_807DE68

	thumb_func_start sub_807DE78
sub_807DE78: @ 807DE78
	push {lr}
	ldr r0, _0807DEB0
	ldr r0, [r0]
	ldr r2, _0807DEB4
	adds r1, r0, r2
	movs r2, 0
	strb r2, [r1]
	ldr r1, _0807DEB8
	adds r3, r0, r1
	movs r1, 0x14
	strb r1, [r3]
	ldr r3, _0807DEBC
	adds r1, r0, r3
	strb r2, [r1]
	subs r3, 0x6
	adds r1, r0, r3
	strh r2, [r1]
	ldr r1, _0807DEC0
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
	ldr r0, _0807DEEC
	ldr r1, [r0]
	ldr r2, _0807DEF0
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
	ldr r0, _0807DF10
	ldr r5, [r0]
	ldr r0, _0807DF14
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
	ldr r0, _0807DF50
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
	ldr r0, _0807DF6C
	ldr r0, [r0]
	ldr r1, _0807DF70
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
	ldr r0, _0807DFB4
	ldr r1, [r0]
	ldr r0, _0807DFB8
	adds r2, r1, r0
	movs r0, 0
	strb r0, [r2]
	ldr r0, _0807DFBC
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
	ldr r0, _0807E04C
	ldr r0, [r0]
	ldr r1, _0807E050
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0807E090
	ldr r0, _0807E054
	bl LoadSpriteSheet
	ldr r0, _0807E058
	bl sub_807D8C0
	movs r5, 0
_0807DFF2:
	ldr r0, _0807E05C
	movs r1, 0
	movs r2, 0
	movs r3, 0xFF
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	beq _0807E068
	ldr r0, _0807E04C
	ldr r1, [r0]
	lsls r2, r5, 2
	movs r0, 0xFA
	lsls r0, 1
	adds r1, r0
	adds r1, r2
	lsls r4, r3, 4
	adds r4, r3
	lsls r4, 2
	ldr r0, _0807E060
	adds r4, r0
	str r4, [r1]
	ldr r0, _0807E064
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
	ldr r0, _0807E098
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
	ldr r0, _0807E098
	ldr r0, [r0]
	ldr r1, _0807E09C
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
	ldr r0, _0807E0EC
	ldr r1, [r0]
	ldr r2, _0807E0F0
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
	ldr r0, _0807E0EC
	ldr r0, [r0]
	ldr r1, _0807E0F0
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
	ldr r0, _0807E134
	ldr r1, [r0]
	ldr r0, _0807E138
	adds r3, r1, r0
	movs r2, 0
	movs r0, 0
	strh r0, [r3]
	ldr r3, _0807E13C
	adds r0, r1, r3
	strb r2, [r0]
	subs r3, 0x11
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _0807E140
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
	ldr r0, _0807E16C
	ldr r1, [r0]
	ldr r2, _0807E170
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
	ldr r1, _0807E190
	ldr r0, [r1]
	ldr r2, _0807E194
	adds r0, r2
	ldrh r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x4
	bhi _0807E250
	lsls r0, 2
	ldr r1, _0807E198
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
	ldr r2, _0807E1C4
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807E254
	ldr r0, _0807E1C8
	adds r1, r0
	b _0807E238
	.align 2, 0
_0807E1C4: .4byte 0x000006c6
_0807E1C8: .4byte 0x000006cc
_0807E1CC:
	bl sub_807D9A8
	ldr r0, _0807E1DC
	ldr r1, [r0]
	ldr r2, _0807E1E0
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
	ldr r0, _0807E1F8
	ldr r1, [r0]
	ldr r0, _0807E1FC
	adds r1, r0
	b _0807E238
	.align 2, 0
_0807E1F8: .4byte gUnknown_08396FC4
_0807E1FC: .4byte 0x000006cc
_0807E200:
	bl sub_807DA14
	ldr r0, _0807E210
	ldr r1, [r0]
	ldr r2, _0807E214
	adds r1, r2
	b _0807E238
	.align 2, 0
_0807E210: .4byte gUnknown_08396FC4
_0807E214: .4byte 0x000006cc
_0807E218:
	bl sub_807DA4C
	ldr r0, _0807E240
	ldr r2, [r0]
	ldr r1, _0807E244
	adds r0, r2, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x6
	bne _0807E254
	ldr r0, _0807E248
	adds r1, r2, r0
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _0807E24C
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
	ldr r0, _0807E26C
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
	ldr r1, _0807E294
	adds r3, r0, r1
	movs r1, 0x8
	ldrsh r0, [r3, r1]
	cmp r0, 0x4
	bhi _0807E35E
	lsls r0, 2
	ldr r1, _0807E298
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
	ldr r1, _0807E2F4
	ldrh r0, [r1]
	strh r0, [r3, 0xE]
	ldr r4, _0807E2F8
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0x8
	movs r0, 0x9E
	strh r0, [r1]
	ldr r0, _0807E2FC
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
	ldr r0, _0807E2FC
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
	ldr r1, _0807E330
	ldrh r0, [r3, 0xA]
	strh r0, [r1]
	b _0807E35E
	.align 2, 0
_0807E330: .4byte REG_BLDY
_0807E334:
	ldr r0, _0807E34C
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	ldr r1, _0807E350
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
	ldr r0, _0807E3B4
	ldr r1, [r0]
	ldr r2, _0807E3B8
	adds r0, r1, r2
	movs r3, 0
	movs r2, 0
	strh r2, [r0]
	ldr r4, _0807E3BC
	adds r0, r1, r4
	strb r3, [r0]
	adds r4, 0x4
	adds r0, r1, r4
	strh r2, [r0]
	ldr r0, _0807E3C0
	adds r2, r1, r0
	movs r0, 0x8
	strb r0, [r2]
	ldr r2, _0807E3C4
	adds r0, r1, r2
	strb r3, [r0]
	adds r4, 0x3
	adds r2, r1, r4
	movs r0, 0xA
	strb r0, [r2]
	ldr r0, _0807E3C8
	adds r2, r1, r0
	movs r0, 0x3
	strb r0, [r2]
	ldr r2, _0807E3CC
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
	ldr r0, _0807E3F8
	ldr r1, [r0]
	ldr r2, _0807E3FC
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
	ldr r0, _0807E41C
	ldr r5, [r0]
	ldr r0, _0807E420
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
	ldr r0, _0807E45C
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
	ldr r0, _0807E47C
	ldr r2, [r0]
	ldr r1, _0807E480
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
	ldr r5, _0807E4A4
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
	ldr r1, _0807E4A8
	adds r0, r1
	movs r1, 0xFF
	strh r1, [r0]
	movs r0, 0
	b _0807E4E6
	.align 2, 0
_0807E4A4: .4byte 0x000006d1
_0807E4A8: .4byte 0x000006ce
_0807E4AC:
	ldr r4, _0807E4D8
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
	ldr r0, _0807E4DC
	ldr r1, [r0]
	ldr r5, _0807E4E0
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
	ldr r0, _0807E5A4
	strh r0, [r7, 0x30]
_0807E500:
	movs r2, 0x30
	ldrsh r1, [r7, r2]
	ldr r0, _0807E5A8
	muls r0, r1
	ldr r3, _0807E5AC
	adds r0, r3
	lsls r0, 1
	lsrs r0, 17
	movs r1, 0x96
	lsls r1, 2
	bl __umodsi3
	movs r1, 0
	mov r8, r1
	strh r0, [r7, 0x30]
	ldr r1, _0807E5B0
	ldr r0, _0807E5B4
	ldr r5, [r0]
	ldr r2, _0807E5B8
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
	ldr r2, _0807E5BC
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
	ldr r3, _0807E634
	ldr r4, _0807E638
	ldr r2, [r4]
	ldr r0, _0807E63C
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
	ldr r1, _0807E690
	adds r0, r1
	ldrb r1, [r0]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	movs r0, 0x1
	strh r0, [r5, 0x36]
	ldr r1, _0807E694
	ldrh r0, [r5, 0x20]
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r5, 0x20]
	ldr r1, _0807E698
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
	ldr r0, _0807E6E0
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
	ldr r2, _0807E774
	ldr r0, _0807E778
	ldr r0, [r0]
	ldr r1, _0807E77C
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
	ldr r0, _0807E780
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
	ldr r0, _0807E780
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
	ldr r0, _0807E7B0
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
	ldr r0, _0807E860
	ldr r4, [r0]
	ldr r0, _0807E864
	adds r2, r4, r0
	ldrb r0, [r2]
	cmp r0, 0x18
	bne _0807E7CE
	b _0807E8D4
_0807E7CE:
	ldrb r7, [r2]
	ldr r0, _0807E868
	ldr r2, _0807E86C
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
	ldr r3, _0807E870
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
	ldr r1, _0807E874
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
	ldr r6, _0807E870
	adds r0, r6
	ldr r3, _0807E878
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
	ldr r0, _0807E860
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
	ldr r0, _0807E8B8
	ldr r2, [r0]
	ldr r6, _0807E8BC
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
	ldr r5, _0807E8C0
	ldr r4, _0807E8C4
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
	ldr r0, _0807E904
	ldr r3, [r0]
	movs r0, 0xDB
	lsls r0, 3
	adds r4, r3, r0
	ldr r1, _0807E908
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
	ldr r0, _0807E944
	adds r2, r3, r0
	ldrh r0, [r2]
	adds r0, 0x1
	movs r6, 0
	strh r0, [r2]
	ldr r7, _0807E948
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
	ldr r0, _0807E9BC
	ldr r2, [r0]
	ldr r3, _0807E9C0
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
	ldr r1, _0807E9C0
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r0, _0807E9C4
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
	ldr r0, _0807EA04
	ldr r1, [r0]
	ldr r2, _0807EA08
	adds r0, r1, r2
	movs r2, 0
	movs r3, 0
	strh r3, [r0]
	ldr r4, _0807EA0C
	adds r0, r1, r4
	strb r2, [r0]
	ldr r0, _0807EA10
	adds r2, r1, r0
	movs r0, 0x3
	strb r0, [r2]
	subs r4, 0x10
	adds r2, r1, r4
	movs r0, 0x14
	strb r0, [r2]
	ldr r0, _0807EA14
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
	ldr r2, _0807EA78
	ldr r1, [r2]
	ldr r3, _0807EA7C
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
	ldr r3, _0807EA80
	adds r0, r3
	ldrb r0, [r0]
	cmp r4, r0
	bcs _0807EA68
	ldr r0, _0807EA78
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
	ldr r0, _0807EAB4
	ldr r5, [r0]
	ldr r0, _0807EAB8
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0
	bne _0807EAAC
	bl snowflakes_progress
	lsls r0, 24
	cmp r0, 0
	bne _0807EAAC
	ldr r0, _0807EABC
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
	ldr r0, _0807EAD8
	ldr r2, [r0]
	ldr r0, _0807EADC
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
	ldr r4, _0807EB10
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
	ldr r0, _0807EB14
	ldr r1, [r0]
	ldr r0, _0807EB18
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
	ldr r0, _0807EB40
	ldr r1, [r0]
	ldr r0, _0807EB44
	adds r3, r1, r0
	ldr r4, _0807EB48
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
	ldr r0, _0807EB94
	ldr r0, [r0]
	ldr r2, _0807EB98
	adds r1, r0, r2
	ldr r4, _0807EB9C
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
	ldr r0, _0807EBF4
	movs r1, 0
	movs r2, 0
	movs r3, 0x4E
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0807EC04
	ldr r0, _0807EBF8
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	adds r4, r0
	ldr r0, _0807EBFC
	ldr r5, [r0]
	ldr r0, _0807EC00
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
	ldr r0, _0807EC20
	ldr r1, [r0]
	ldr r0, _0807EC24
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
	ldr r1, _0807ECE4
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
	ldr r1, _0807ECE8
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
	ldr r0, _0807ED38
	ldr r0, [r0]
	ldr r1, _0807ED3C
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
	ldr r0, _0807ED40
	str r0, [r3, 0x1C]
	ldr r1, _0807ED44
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
	ldr r1, _0807EDC0
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
	ldr r1, _0807EDC4
	ldrh r1, [r1]
	adds r3, r1, r0
	ldr r2, _0807EDC8
	adds r0, r2, 0
	ands r3, r0
	adds r2, r3, 0
	movs r0, 0x80
	lsls r0, 1
	ands r0, r2
	cmp r0, 0
	beq _0807EDAC
	ldr r3, _0807EDCC
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
	ldr r1, _0807EE18
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
	ldr r0, _0807EE7C
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
	ldr r0, _0807EE7C
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
	ldr r0, _0807EED8
	ldr r1, [r0]
	ldr r2, _0807EEDC
	adds r0, r1, r2
	movs r3, 0
	movs r2, 0
	strh r2, [r0]
	ldr r5, _0807EEE0
	adds r4, r1, r5
	strb r3, [r4]
	adds r5, 0x4
	adds r0, r1, r5
	strh r2, [r0]
	ldr r0, _0807EEE4
	adds r2, r1, r0
	movs r0, 0x4
	strb r0, [r2]
	ldr r2, _0807EEE8
	adds r0, r1, r2
	strb r3, [r0]
	adds r5, 0x3
	adds r2, r1, r5
	movs r0, 0x10
	strb r0, [r2]
	ldr r0, _0807EEEC
	adds r2, r1, r0
	movs r0, 0x3
	strb r0, [r2]
	subs r5, 0x17
	adds r2, r1, r5
	movs r0, 0x14
	strb r0, [r2]
	strb r3, [r4]
	ldr r0, _0807EEF0
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
	ldr r0, _0807EF1C
	ldr r1, [r0]
	ldr r2, _0807EF20
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
	ldr r0, _0807EF78
	ldr r1, [r0]
	ldr r2, _0807EF7C
	adds r0, r1, r2
	movs r4, 0
	movs r2, 0
	strh r2, [r0]
	ldr r5, _0807EF80
	adds r3, r1, r5
	strb r4, [r3]
	adds r5, 0x4
	adds r0, r1, r5
	strh r2, [r0]
	ldr r0, _0807EF84
	adds r2, r1, r0
	movs r0, 0x4
	strb r0, [r2]
	adds r5, 0x6
	adds r2, r1, r5
	movs r0, 0x1
	strb r0, [r2]
	ldr r0, _0807EF88
	adds r2, r1, r0
	movs r0, 0x18
	strb r0, [r2]
	subs r5, 0x1B
	adds r2, r1, r5
	movs r0, 0x3
	strb r0, [r2]
	ldr r0, _0807EF8C
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
	ldr r0, _0807EFB8
	ldr r1, [r0]
	ldr r2, _0807EFBC
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
	ldr r0, _0807EFE0
	ldr r0, [r0]
	ldr r1, _0807EFE4
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0xE
	bls _0807EFD6
	b _0807F336
_0807EFD6:
	lsls r0, 2
	ldr r1, _0807EFE8
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
	ldr r0, _0807F03C
	ldr r1, [r0]
	ldr r2, _0807F040
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
	ldr r0, _0807F060
	ldr r1, [r0]
	ldr r3, _0807F064
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
	ldr r0, _0807F08C
	ldr r1, [r0]
	ldr r0, _0807F090
	adds r2, r1, r0
	movs r0, 0x1
	strb r0, [r2]
	ldr r2, _0807F094
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	b _0807F334
	.align 2, 0
_0807F08C: .4byte gUnknown_08396FC4
_0807F090: .4byte 0x000006d2
_0807F094: .4byte 0x000006cc
_0807F098:
	ldr r0, _0807F0B0
	ldr r1, [r0]
	ldr r3, _0807F0B4
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807F0A8
	b _0807F336
_0807F0A8:
	ldr r0, _0807F0B8
	adds r1, r0
	movs r0, 0x6
	b _0807F334
	.align 2, 0
_0807F0B0: .4byte gUnknown_08396FC4
_0807F0B4: .4byte 0x000006c6
_0807F0B8: .4byte 0x000006cc
_0807F0BC:
	ldr r0, _0807F10C
	ldr r4, [r0]
	ldr r2, _0807F110
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
	ldr r3, _0807F114
	adds r1, r4, r3
	strh r0, [r1]
	ldr r0, _0807F118
	adds r4, r0
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807F0EC:
	ldr r0, _0807F10C
	ldr r2, [r0]
	ldr r3, _0807F114
	adds r1, r2, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	beq _0807F102
	b _0807F336
_0807F102:
	ldr r0, _0807F118
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
	ldr r0, _0807F13C
	ldr r4, [r0]
	ldr r1, _0807F140
	adds r0, r4, r1
	movs r5, 0x1
	strb r5, [r0]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ands r0, r5
	ldr r2, _0807F144
	adds r1, r4, r2
	strb r0, [r1]
	b _0807F1A4
	.align 2, 0
_0807F13C: .4byte gUnknown_08396FC4
_0807F140: .4byte 0x000006ea
_0807F144: .4byte 0x000006eb
_0807F148:
	bl Random
	ldr r1, _0807F1B0
	ldr r2, [r1]
	movs r1, 0x1
	ands r1, r0
	adds r1, 0x1
	ldr r3, _0807F1B4
	adds r0, r2, r3
	strb r1, [r0]
	ldr r0, _0807F1B8
	adds r2, r0
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
_0807F166:
	movs r0, 0x13
	bl sub_807D5BC
	ldr r0, _0807F1B0
	ldr r1, [r0]
	ldr r2, _0807F1BC
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807F18A
	ldr r3, _0807F1B4
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0807F18A
	movs r0, 0x14
	bl sub_807F3F8
_0807F18A:
	bl Random
	ldr r1, _0807F1B0
	ldr r4, [r1]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	adds r0, 0x6
	ldr r2, _0807F1C0
	adds r1, r4, r2
	strh r0, [r1]
_0807F1A4:
	ldr r3, _0807F1B8
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
	ldr r0, _0807F210
	ldr r4, [r0]
	ldr r0, _0807F214
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
	ldr r2, _0807F218
	adds r1, r4, r2
	movs r0, 0x1
	strb r0, [r1]
	ldr r3, _0807F21C
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
	ldr r0, _0807F220
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
	ldr r1, _0807F234
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807F23C
	ldr r2, _0807F238
	adds r1, r4, r2
	b _0807F332
	.align 2, 0
_0807F234: .4byte 0x000006eb
_0807F238: .4byte 0x000006cc
_0807F23C:
	ldr r3, _0807F244
	adds r1, r4, r3
	movs r0, 0xB
	b _0807F334
	.align 2, 0
_0807F244: .4byte 0x000006cc
_0807F248:
	ldr r0, _0807F264
	ldr r2, [r0]
	ldr r0, _0807F268
	adds r1, r2, r0
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bne _0807F336
	ldr r3, _0807F26C
	adds r1, r2, r3
	movs r0, 0x8
	b _0807F334
	.align 2, 0
_0807F264: .4byte gUnknown_08396FC4
_0807F268: .4byte 0x000006e6
_0807F26C: .4byte 0x000006cc
_0807F270:
	bl Random
	ldr r1, _0807F294
	ldr r2, [r1]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF
	ands r0, r1
	adds r0, 0x3C
	ldr r3, _0807F298
	adds r1, r2, r3
	strh r0, [r1]
	ldr r0, _0807F29C
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
	ldr r0, _0807F2D8
	ldr r5, [r0]
	ldr r1, _0807F2DC
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
	ldr r2, _0807F2E0
	adds r1, r5, r2
	ldrh r0, [r1]
	adds r0, 0x1
	b _0807F334
	.align 2, 0
_0807F2D8: .4byte gUnknown_08396FC4
_0807F2DC: .4byte 0x000006e6
_0807F2E0: .4byte 0x000006cc
_0807F2E4:
	ldr r0, _0807F30C
	ldr r4, [r0]
	ldr r3, _0807F310
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
	ldr r0, _0807F314
	adds r1, r4, r0
	ldrh r0, [r1]
	adds r0, 0x1
	b _0807F334
	.align 2, 0
_0807F30C: .4byte gUnknown_08396FC4
_0807F310: .4byte 0x000006e6
_0807F314: .4byte 0x000006cc
_0807F318:
	ldr r0, _0807F33C
	ldr r2, [r0]
	ldr r1, _0807F340
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _0807F336
	ldr r3, _0807F344
	adds r1, r2, r3
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _0807F348
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
	ldr r0, _0807F368
	ldr r6, [r0]
	ldr r0, _0807F36C
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
	ldr r2, _0807F3BC
	adds r0, r6, r2
	strb r1, [r0]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_0807F382:
	bl sub_807EFC0
	ldr r0, _0807F3C0
	ldr r2, [r0]
	ldr r1, _0807F3BC
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
	ldr r0, _0807F3C4
	adds r1, r2, r0
	movs r0, 0
	strb r0, [r1]
	ldr r0, _0807F3C8
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
	ldr r1, _0807F3EC
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
	ldr r0, _0807F42C
	ldr r4, [r0]
	ldr r0, _0807F430
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
	ldr r0, _0807F46C
	ldr r1, [r0]
	ldr r2, _0807F470
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
	ldr r0, _0807F488
	ldr r0, [r0]
	ldr r1, _0807F48C
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
	ldr r0, _0807F4E8
	ldr r3, [r0]
	ldr r0, _0807F4EC
	adds r1, r3, r0
	movs r2, 0
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0807F4F0
	adds r0, r3, r1
	strb r2, [r0]
	subs r1, 0x11
	adds r0, r3, r1
	strb r2, [r0]
	ldr r2, _0807F4F4
	adds r1, r3, r2
	movs r0, 0x14
	strb r0, [r1]
	ldr r1, _0807F4F8
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
	ldr r0, _0807F524
	ldr r1, [r0]
	ldr r2, _0807F528
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
	ldr r0, _0807F578
	ldr r6, [r0]
	ldr r0, _0807F57C
	ldr r1, _0807F580
	adds r2, r6, r1
	ldrh r0, [r0]
	ldrh r1, [r2]
	subs r0, r1
	movs r1, 0xFF
	ands r0, r1
	ldr r3, _0807F584
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
	ldr r1, _0807F588
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
	ldr r0, _0807F5C4
	ldr r1, [r0]
	ldr r0, _0807F5C8
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
	ldr r1, _0807F5E8
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
	ldr r0, _0807F63C
	ldr r2, [r0]
	ldr r0, _0807F640
	ldr r1, _0807F644
	adds r3, r2, r1
	ldrh r0, [r0]
	ldrh r1, [r3]
	subs r0, r1
	movs r1, 0xFF
	ands r0, r1
	ldr r4, _0807F648
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
	ldr r1, _0807F64C
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
	ldr r0, _0807F6D4
	ldrb r0, [r0]
	strh r0, [r3, 0x26]
	ldr r0, _0807F6D8
	ldr r0, [r0]
	ldr r1, _0807F6DC
	adds r2, r0, r1
	ldrh r1, [r2]
	adds r1, 0x20
	movs r4, 0x2E
	ldrsh r0, [r3, r4]
	lsls r0, 6
	adds r1, r0
	strh r1, [r3, 0x20]
	lsls r1, 16
	ldr r0, _0807F6E0
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
	ldr r0, _0807F6E4
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
	ldr r0, _0807F75C
	ldr r0, [r0]
	ldr r1, _0807F760
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807F792
	ldr r0, _0807F764
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	movs r5, 0
_0807F70C:
	ldr r0, _0807F768
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
	ldr r0, _0807F76C
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
	ldr r2, _0807F75C
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
	ldr r2, _0807F79C
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
	ldr r1, _0807F7A0
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
	ldr r0, _0807F7EC
	ldr r1, [r0]
	ldr r2, _0807F7F0
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
	ldr r0, _0807F7F4
	bl FreeSpriteTilesByTag
	ldr r0, _0807F7EC
	ldr r0, [r0]
	ldr r1, _0807F7F0
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
	ldr r0, _0807F844
	ldr r1, [r0]
	ldr r0, _0807F848
	adds r2, r1, r0
	movs r3, 0
	movs r0, 0
	strh r0, [r2]
	ldr r2, _0807F84C
	adds r0, r1, r2
	strb r3, [r0]
	subs r2, 0x11
	adds r0, r1, r2
	strb r3, [r0]
	ldr r3, _0807F850
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
	ldr r1, _0807F854
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
	ldr r0, _0807F880
	ldr r1, [r0]
	ldr r2, _0807F884
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
	ldr r2, _0807F8CC
	ldr r1, [r2]
	ldr r0, _0807F8D0
	ldrh r0, [r0]
	ldr r3, _0807F8D4
	ands r3, r0
	ldr r0, _0807F8D8
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
	ldr r1, _0807F8DC
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
	ldr r0, _0807F924
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
	ldr r0, _0807F950
	ldr r0, [r0]
	ldr r1, _0807F954
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
	ldr r1, _0807F990
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
	ldr r0, _0807F9A8
	bl LoadSpriteSheet
	pop {r0}
	bx r0
	.align 2, 0
_0807F9A8: .4byte gUnknown_0839ABB0
	thumb_func_end sub_807F99C

	thumb_func_start sub_807F9AC
sub_807F9AC: @ 807F9AC
	push {r4,r5,lr}
	ldr r0, _0807FA18
	ldr r0, [r0]
	movs r1, 0xE0
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807FA48
	movs r5, 0
_0807F9C0:
	ldr r0, _0807FA1C
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
	ldr r0, _0807FA20
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
	ldr r2, _0807FA18
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
	ldr r2, _0807FA50
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
	ldr r0, _0807FAA0
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
	ldr r0, _0807FAA4
	bl FreeSpriteTilesByTag
	ldr r0, _0807FAA0
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
	ldr r1, _0807FB10
	ldrh r0, [r3, 0x2E]
	ldrh r1, [r1]
	adds r0, r1
	strh r0, [r3, 0x22]
	ldr r0, _0807FB14
	ldr r0, [r0]
	ldr r1, _0807FB18
	adds r2, r0, r1
	ldrh r1, [r2]
	adds r1, 0x20
	movs r4, 0x32
	ldrsh r0, [r3, r4]
	lsls r0, 6
	adds r1, r0
	strh r1, [r3, 0x20]
	lsls r1, 16
	ldr r0, _0807FB1C
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
	ldr r0, _0807FB20
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
	ldr r0, _0807FB94
	ldr r3, [r0]
	ldr r1, _0807FB98
	adds r0, r3, r1
	movs r1, 0
	movs r2, 0
	strh r2, [r0]
	ldr r4, _0807FB9C
	adds r0, r3, r4
	strb r1, [r0]
	subs r4, 0x11
	adds r0, r3, r4
	strb r1, [r0]
	ldr r0, _0807FBA0
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
	ldr r1, _0807FBA4
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
	ldr r0, _0807FBD0
	ldr r1, [r0]
	ldr r2, _0807FBD4
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
	ldr r0, _0807FBF8
	ldr r5, [r0]
	ldr r0, _0807FBFC
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
	ldr r0, _0807FC38
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
	ldr r0, _0807FC5C
	ldr r0, [r0]
	ldr r1, _0807FC60
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
	ldr r0, _0807FD14
	ldr r3, [r0]
	ldr r0, _0807FD18
	adds r2, r3, r0
	ldrh r0, [r2]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r2]
	ldr r1, _0807FD1C
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
	ldr r1, _0807FD20
	adds r2, r3, r1
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	ands r0, r4
	cmp r0, 0x4
	bls _0807FCE4
	ldr r0, _0807FD24
	adds r1, r3, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	strh r5, [r2]
_0807FCE4:
	ldr r0, _0807FD28
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
	ldr r1, _0807FD2C
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
	ldr r0, _0807FD9C
	ldr r0, [r0]
	ldr r1, _0807FDA0
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807FDD6
	ldr r0, _0807FDA4
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
	ldr r0, _0807FDA8
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
	ldr r0, _0807FDAC
	adds r4, r0
	adds r0, r6, 0
	movs r1, 0x5
	bl __umodsi3
	strh r0, [r4, 0x2E]
	strh r5, [r4, 0x30]
	ldr r2, _0807FD9C
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
	ldr r2, _0807FDE0
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
	ldr r1, _0807FDE4
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
	ldr r0, _0807FE30
	ldr r1, [r0]
	ldr r2, _0807FE34
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
	ldr r0, _0807FE38
	bl FreeSpriteTilesByTag
	ldr r0, _0807FE30
	ldr r0, [r0]
	ldr r1, _0807FE34
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
	ldr r0, _0807FE8C
	ldr r1, [r0]
	ldr r2, _0807FE90
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
	ldr r0, _0807FE94
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
	ldr r0, _0807FE98
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
	ldr r0, _0807FF00
	ldr r3, [r0]
	ldr r0, _0807FF04
	adds r1, r3, r0
	movs r2, 0
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0807FF08
	adds r0, r3, r1
	strb r2, [r0]
	ldr r4, _0807FF0C
	adds r0, r3, r4
	strb r2, [r0]
	ldr r0, _0807FF10
	adds r1, r3, r0
	movs r0, 0x14
	strb r0, [r1]
	ldr r1, _0807FF14
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
	ldr r0, _0807FF18
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
	ldr r0, _0807FF44
	ldr r1, [r0]
	ldr r2, _0807FF48
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
	ldr r0, _0807FF7C
	ldr r5, [r0]
	ldr r0, _0807FF80
	adds r1, r5, r0
	ldrh r0, [r1]
	cmp r0, 0x5F
	bls _0807FF68
	movs r0, 0x20
	strh r0, [r1]
_0807FF68:
	ldr r0, _0807FF84
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
	ldr r0, _0807FFC4
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
	ldr r0, _0807FFEC
	ldr r0, [r0]
	ldr r1, _0807FFF0
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
	ldr r0, _08080058
	ldr r2, [r0]
	ldr r0, _0808005C
	adds r3, r2, r0
	ldrh r0, [r3]
	adds r1, r0, 0x1
	strh r1, [r3]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4
	bls _08080052
	ldr r1, _08080060
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
	ldr r0, _080800C8
	ldr r2, [r0]
	ldr r0, _080800CC
	adds r4, r2, r0
	ldr r6, _080800D0
	ldr r1, _080800D4
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
	ldr r1, _080800D8
	ldr r0, [r4]
	lsrs r0, 8
	ldrh r1, [r1]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	ldr r4, _080800DC
	adds r1, r2, r4
	strh r0, [r1]
	ldr r1, _080800E0
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
	ldr r0, _08080168
	ldr r1, [r0]
	ldr r2, _0808016C
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
	ldr r0, _08080168
	ldr r0, [r0]
	ldr r1, _0808016C
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r0, _08080170
	bl FreeSpriteTilesByTag
_08080126:
	ldr r0, _08080168
	ldr r1, [r0]
	ldr r2, _08080174
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
	ldr r0, _08080168
	ldr r0, [r0]
	ldr r1, _08080174
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
	ldr r0, _080801E8
	ldr r0, [r0]
	ldr r1, _080801EC
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08080226
	ldr r0, _080801F0
	bl LoadSpriteSheet
	ldr r0, _080801F4
	bl sub_807D8C0
	movs r7, 0
_08080198:
	adds r0, r7, 0
	movs r1, 0x5
	bl __udivsi3
	adds r6, r0, 0
	lsls r2, r6, 22
	asrs r2, 16
	ldr r0, _080801F8
	movs r1, 0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08080200
	ldr r2, _080801E8
	ldr r5, [r2]
	lsls r0, r7, 2
	movs r3, 0xC8
	lsls r3, 1
	adds r5, r3
	adds r5, r0
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	ldr r0, _080801FC
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
	ldr r2, _08080230
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
	ldr r1, _08080234
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
	ldr r4, _080802E0
	ldr r0, [r4]
	ldr r1, _080802E4
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
	ldr r0, _080802E8
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
	ldr r0, _080802EC
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
	ldr r0, _080802F0
	strh r0, [r1, 0x36]
	ldr r1, [r4]
	ldr r0, _080802F4
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
	ldr r0, _080802F8
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
	ldr r1, _08080334
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
	ldr r0, _08080388
	ldr r1, [r0]
	movs r2, 0xE2
	lsls r2, 3
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r3, 0x26]
	ldr r4, _0808038C
	adds r2, r1, r4
	ldrh r1, [r2]
	adds r1, 0x20
	movs r4, 0x2E
	ldrsh r0, [r3, r4]
	lsls r0, 6
	adds r1, r0
	strh r1, [r3, 0x20]
	lsls r1, 16
	ldr r0, _08080390
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
	ldr r0, _08080394
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
	ldr r0, _080803B8
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
	ldr r3, _0808042C
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
	ldr r0, _08080450
	ldr r1, [r0]
	ldr r0, _08080454
	adds r2, r1, r0
	movs r0, 0
	strh r0, [r2]
	ldr r0, _08080458
	adds r2, r1, r0
	movs r0, 0x3
	strb r0, [r2]
	ldr r0, _0808045C
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
	ldr r0, _080804B4
	ldr r4, [r0]
	ldr r1, _080804B8
	adds r0, r4, r1
	ldrb r5, [r0]
	cmp r5, 0
	bne _080804AC
	ldr r0, _080804BC
	bl LoadSpriteSheet
	movs r2, 0xE5
	lsls r2, 3
	adds r0, r4, r2
	strh r5, [r0]
	ldr r0, _080804C0
	ldrb r1, [r0]
	subs r2, 0x2
	adds r0, r4, r2
	strh r1, [r0]
	ldr r1, _080804C4
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
	ldr r0, _080804F0
	ldr r1, [r0]
	ldr r2, _080804F4
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
	ldr r0, _08080558
	ldr r5, [r0]
	ldr r0, _0808055C
	adds r4, r5, r0
	ldrh r0, [r4]
	adds r0, 0x1
	movs r6, 0
	strh r0, [r4]
	ldr r1, _08080560
	adds r7, r1, 0
	ldr r2, _08080564
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
	ldr r0, _08080568
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
	ldr r1, _080805F8
	lsrs r0, 14
	adds r3, r0, r1
	adds r1, 0x2
	adds r0, r1
	ldr r1, _080805FC
	ldrh r2, [r0]
	ldrh r0, [r1]
	subs r2, r0
	ldr r0, _08080600
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
	ldr r0, _08080604
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
	ldr r0, _08080608
	ldr r1, [r0]
	ldr r0, _0808060C
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
	ldr r5, _08080648
_08080616:
	lsls r0, r4, 4
	adds r0, r4
	lsls r2, r0, 2
	adds r0, r5, 0
	adds r0, 0x14
	adds r0, r2, r0
	ldr r1, [r0]
	ldr r0, _0808064C
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
	ldr r0, _08080650
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
	ldr r4, _080806D4
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
	ldr r0, _080806E0
	adds r0, 0x2E
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080806E0: .4byte gSaveBlock1
	thumb_func_end GetSav1Weather

	thumb_func_start sub_80806E4
sub_80806E4: @ 80806E4
	push {r4,r5,lr}
	ldr r4, _08080704
	adds r4, 0x2E
	ldrb r5, [r4]
	ldr r0, _08080708
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

	thumb_func_start sub_808070C
sub_808070C: @ 808070C
	push {lr}
	bl SetSav1Weather
	bl GetSav1Weather
	lsls r0, 24
	lsrs r0, 24
	bl DoWeatherEffect
	pop {r0}
	bx r0
	thumb_func_end sub_808070C

	thumb_func_start sub_8080724
sub_8080724: @ 8080724
	push {lr}
	bl SetSav1Weather
	bl GetSav1Weather
	lsls r0, 24
	lsrs r0, 24
	bl sub_807C988
	pop {r0}
	bx r0
	thumb_func_end sub_8080724

	thumb_func_start sub_808073C
sub_808073C: @ 808073C
	push {lr}
	bl GetSav1Weather
	lsls r0, 24
	lsrs r0, 24
	bl DoWeatherEffect
	pop {r0}
	bx r0
	thumb_func_end sub_808073C

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
	ldr r1, _08080778
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
	ldr r1, _08080810
	b _08080816
	.align 2, 0
_08080810: .4byte gUnknown_0839ACD4
_08080814:
	ldr r1, _08080824
_08080816:
	ldr r0, _08080828
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
	ldr r2, _08080850
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
