	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_813E804
sub_813E804: @ 813E804
	push {r4-r7,lr}
	adds r3, r0, 0
	ldr r0, _0813E818 @ =gUnknown_0203931A
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813E81C
	adds r0, r3, 0
	bl DestroySprite
	b _0813E928
	.align 2, 0
_0813E818: .4byte gUnknown_0203931A
_0813E81C:
	ldr r6, _0813E904 @ =gSprites
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r0, [r0]
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	movs r1, 0x4
	ands r1, r0
	mov r7, r12
	ldrb r2, [r7]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7]
	ldrh r0, [r3, 0x3C]
	adds r0, 0x1
	strh r0, [r3, 0x3C]
	ldrh r1, [r3, 0x34]
	movs r2, 0x34
	ldrsh r0, [r3, r2]
	cmp r0, 0x27
	bgt _0813E85A
	adds r0, r1, 0x2
	strh r0, [r3, 0x34]
_0813E85A:
	movs r7, 0x2E
	ldrsh r1, [r3, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrh r1, [r0, 0x24]
	ldrh r0, [r0, 0x20]
	adds r2, r1, r0
	ldr r4, _0813E908 @ =gSineTable
	ldrh r5, [r3, 0x30]
	adds r0, r5, 0
	adds r0, 0x40
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	movs r7, 0
	ldrsh r1, [r0, r7]
	movs r7, 0x34
	ldrsh r0, [r3, r7]
	muls r0, r1
	cmp r0, 0
	bge _0813E88A
	adds r0, 0xFF
_0813E88A:
	asrs r0, 8
	adds r0, r2, r0
	strh r0, [r3, 0x20]
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r2, r1, r0
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	movs r7, 0
	ldrsh r1, [r0, r7]
	movs r7, 0x34
	ldrsh r0, [r3, r7]
	muls r0, r1
	cmp r0, 0
	bge _0813E8BE
	ldr r1, _0813E90C @ =0x000001ff
	adds r0, r1
_0813E8BE:
	asrs r0, 9
	adds r0, r2, r0
	strh r0, [r3, 0x22]
	adds r1, r5, 0x2
	strh r1, [r3, 0x30]
	movs r2, 0x32
	ldrsh r0, [r3, r2]
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	movs r7, 0
	ldrsh r0, [r0, r7]
	cmp r0, 0
	bge _0813E8DC
	adds r0, 0x1F
_0813E8DC:
	asrs r0, 5
	strh r0, [r3, 0x26]
	ldrh r0, [r3, 0x32]
	adds r0, 0x8
	strh r0, [r3, 0x32]
	movs r0, 0xFF
	ands r1, r0
	cmp r1, 0x7F
	bgt _0813E910
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	b _0813E922
	.align 2, 0
_0813E904: .4byte gSprites
_0813E908: .4byte gSineTable
_0813E90C: .4byte 0x000001ff
_0813E910:
	movs r2, 0x2E
	ldrsh r1, [r3, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x43
	ldrb r0, [r0]
	adds r0, 0x1
_0813E922:
	adds r1, r3, 0
	adds r1, 0x43
	strb r0, [r1]
_0813E928:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_813E804

	thumb_func_start sub_813E930
sub_813E930: @ 813E930
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	ldr r7, _0813E978 @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r5, r0, r7
_0813E942:
	movs r0, 0x20
	ldrsh r1, [r5, r0]
	movs r0, 0x22
	ldrsh r2, [r5, r0]
	ldr r0, _0813E97C @ =gSpriteTemplate_840B124
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0813E968
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	strh r6, [r0, 0x2E]
	lsls r1, r4, 5
	strh r1, [r0, 0x30]
_0813E968:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _0813E942
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813E978: .4byte gSprites
_0813E97C: .4byte gSpriteTemplate_840B124
	thumb_func_end sub_813E930

	thumb_func_start sub_813E980
sub_813E980: @ 813E980
	push {r4,r5,lr}
	adds r3, r0, 0
	ldr r0, _0813E994 @ =gUnknown_0203931A
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813E998
	adds r0, r3, 0
	bl DestroySprite
	b _0813EA50
	.align 2, 0
_0813E994: .4byte gUnknown_0203931A
_0813E998:
	ldr r2, _0813EA58 @ =gSprites
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r0, [r0]
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	movs r1, 0x4
	ands r1, r0
	mov r5, r12
	ldrb r2, [r5]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
	ldrh r0, [r3, 0x3C]
	adds r0, 0x1
	strh r0, [r3, 0x3C]
	ldrh r0, [r3, 0x3A]
	adds r4, r0, 0
	adds r4, 0x8
	strh r4, [r3, 0x3A]
	ldr r2, _0813EA5C @ =gSineTable
	ldrh r0, [r3, 0x34]
	adds r0, 0x40
	lsls r0, 24
	lsrs r0, 23
	adds r0, r2
	movs r5, 0
	ldrsh r1, [r0, r5]
	movs r5, 0x3A
	ldrsh r0, [r3, r5]
	muls r0, r1
	cmp r0, 0
	bge _0813E9EC
	adds r0, 0xFF
_0813E9EC:
	asrs r0, 8
	ldrh r1, [r3, 0x36]
	adds r0, r1
	strh r0, [r3, 0x20]
	movs r5, 0x34
	ldrsh r0, [r3, r5]
	lsls r0, 24
	lsrs r0, 23
	adds r0, r2
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r5, 0x3A
	ldrsh r0, [r3, r5]
	muls r0, r1
	cmp r0, 0
	bge _0813EA0E
	adds r0, 0xFF
_0813EA0E:
	asrs r0, 8
	ldrh r1, [r3, 0x38]
	adds r0, r1
	strh r0, [r3, 0x22]
	movs r2, 0x3A
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bge _0813EA20
	adds r0, 0xF
_0813EA20:
	asrs r0, 4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bls _0813EA2C
	movs r0, 0x9
_0813EA2C:
	adds r1, r0, 0
	adds r1, 0x12
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r3, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x3]
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, 0xA0
	ble _0813EA50
	adds r0, r3, 0
	bl DestroySprite
_0813EA50:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813EA58: .4byte gSprites
_0813EA5C: .4byte gSineTable
	thumb_func_end sub_813E980

	thumb_func_start sub_813EA60
sub_813EA60: @ 813EA60
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r5, r0, 0
	ldr r0, _0813EA7C @ =gUnknown_0203931A
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813EA80
	adds r0, r5, 0
	bl DestroySprite
	b _0813EB32
	.align 2, 0
_0813EA7C: .4byte gUnknown_0203931A
_0813EA80:
	ldrh r0, [r5, 0x3C]
	adds r0, 0x1
	strh r0, [r5, 0x3C]
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0813EB40 @ =gSprites
	mov r9, r0
	movs r4, 0x2E
	ldrsh r1, [r5, r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	mov r1, r9
	adds r3, r0, r1
	movs r4, 0x2E
	ldrsh r1, [r3, r4]
	cmp r1, 0x1
	bne _0813EB32
	ldrh r0, [r5, 0x3C]
	ands r1, r0
	lsls r0, r1, 16
	asrs r6, r0, 16
	cmp r6, 0
	bne _0813EB32
	ldrh r1, [r3, 0x20]
	ldrh r0, [r5, 0x30]
	adds r1, r0
	lsls r1, 16
	ldrh r2, [r3, 0x22]
	ldrh r4, [r5, 0x32]
	adds r2, r4
	lsls r2, 16
	ldr r0, _0813EB44 @ =gSpriteTemplate_840B150
	lsrs r4, r1, 16
	mov r8, r4
	asrs r1, 16
	lsrs r7, r2, 16
	asrs r2, 16
	adds r3, 0x43
	ldrb r3, [r3]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0813EB32
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	add r4, r9
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x24
	orrs r0, r1
	strb r0, [r4, 0x3]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x1
	movs r3, 0x3
	bl CalcCenterToCornerVec
	ldrh r0, [r5, 0x2E]
	strh r0, [r4, 0x2E]
	ldr r2, _0813EB48 @ =gUnknown_0840B168
	ldrh r0, [r5, 0x3C]
	lsls r0, 16
	asrs r0, 17
	movs r1, 0x7
	ands r0, r1
	adds r0, r2
	ldrb r0, [r0]
	strh r0, [r4, 0x34]
	mov r0, r8
	strh r0, [r4, 0x36]
	strh r7, [r4, 0x38]
	strh r6, [r4, 0x3A]
_0813EB32:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813EB40: .4byte gSprites
_0813EB44: .4byte gSpriteTemplate_840B150
_0813EB48: .4byte gUnknown_0840B168
	thumb_func_end sub_813EA60

	thumb_func_start InitIntroTorchicAttackAnim
InitIntroTorchicAttackAnim: @ 813EB4C
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0813EBB0 @ =gSpriteTemplate_840B170
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _0813EB80
	ldr r1, _0813EBB4 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	strh r4, [r0, 0x2E]
	strh r1, [r0, 0x30]
	movs r1, 0x8
	strh r1, [r0, 0x32]
	movs r1, 0x18
	strh r1, [r0, 0x34]
_0813EB80:
	movs r4, 0
	ldr r5, _0813EBB8 @ =gUnknown_0840B188
_0813EB84:
	adds r0, r4, 0
	adds r0, 0x12
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r4, 1
	adds r1, r5
	ldrh r1, [r1]
	str r1, [sp]
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _0813EB84
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813EBB0: .4byte gSpriteTemplate_840B170
_0813EBB4: .4byte gSprites
_0813EBB8: .4byte gUnknown_0840B188
	thumb_func_end InitIntroTorchicAttackAnim

	thumb_func_start sub_813EBBC
sub_813EBBC: @ 813EBBC
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _0813EBD0 @ =gUnknown_0203931A
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813EBD4
	adds r0, r3, 0
	bl DestroySprite
	b _0813EC80
	.align 2, 0
_0813EBD0: .4byte gUnknown_0203931A
_0813EBD4:
	ldr r2, _0813EC88 @ =gSprites
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r0, [r0]
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	movs r1, 0x4
	ands r1, r0
	mov r4, r12
	ldrb r2, [r4]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	ldrh r0, [r3, 0x3C]
	adds r0, 0x1
	strh r0, [r3, 0x3C]
	ldrh r0, [r3, 0x3A]
	adds r0, 0x8
	strh r0, [r3, 0x3A]
	ldr r2, _0813EC8C @ =gSineTable
	ldrh r0, [r3, 0x34]
	adds r0, 0x40
	lsls r0, 24
	lsrs r0, 23
	adds r0, r2
	movs r4, 0
	ldrsh r1, [r0, r4]
	movs r4, 0x3A
	ldrsh r0, [r3, r4]
	muls r0, r1
	cmp r0, 0
	bge _0813EC26
	adds r0, 0xFF
_0813EC26:
	asrs r0, 8
	ldrh r1, [r3, 0x36]
	adds r0, r1
	strh r0, [r3, 0x20]
	movs r4, 0x34
	ldrsh r0, [r3, r4]
	lsls r0, 24
	lsrs r0, 23
	adds r0, r2
	movs r4, 0
	ldrsh r1, [r0, r4]
	movs r4, 0x3A
	ldrsh r0, [r3, r4]
	muls r0, r1
	cmp r0, 0
	bge _0813EC48
	adds r0, 0xFF
_0813EC48:
	asrs r0, 8
	ldrh r4, [r3, 0x38]
	adds r1, r0, r4
	strh r1, [r3, 0x22]
	movs r4, 0x30
	ldrsh r0, [r3, r4]
	lsls r0, 24
	lsrs r0, 23
	adds r0, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bge _0813EC64
	adds r0, 0x3F
_0813EC64:
	asrs r0, 6
	strh r0, [r3, 0x26]
	ldrh r0, [r3, 0x30]
	adds r0, 0x10
	strh r0, [r3, 0x30]
	lsls r0, r1, 16
	asrs r0, 16
	movs r4, 0x32
	ldrsh r1, [r3, r4]
	cmp r0, r1
	bge _0813EC80
	adds r0, r3, 0
	bl DestroySprite
_0813EC80:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813EC88: .4byte gSprites
_0813EC8C: .4byte gSineTable
	thumb_func_end sub_813EBBC

	thumb_func_start sub_813EC90
sub_813EC90: @ 813EC90
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, _0813ECAC @ =gUnknown_0203931A
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813ECB0
	adds r0, r5, 0
	bl DestroySprite
	b _0813EDA0
	.align 2, 0
_0813ECAC: .4byte gUnknown_0203931A
_0813ECB0:
	ldrh r0, [r5, 0x3C]
	adds r0, 0x1
	strh r0, [r5, 0x3C]
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0813EDB0 @ =gSprites
	mov r9, r0
	movs r2, 0x2E
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	mov r4, r9
	adds r3, r0, r4
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	cmp r1, 0x1
	bne _0813ED74
	ldrh r0, [r5, 0x3C]
	ands r1, r0
	lsls r0, r1, 16
	asrs r6, r0, 16
	cmp r6, 0
	bne _0813ED66
	ldrh r1, [r3, 0x20]
	ldrh r2, [r5, 0x30]
	adds r1, r2
	lsls r1, 16
	ldrh r2, [r3, 0x22]
	ldrh r4, [r5, 0x32]
	adds r2, r4
	lsls r2, 16
	ldr r0, _0813EDB4 @ =gSpriteTemplate_840B1B0
	lsrs r4, r1, 16
	mov r8, r4
	asrs r1, 16
	lsrs r7, r2, 16
	asrs r2, 16
	adds r3, 0x43
	ldrb r3, [r3]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0813ED66
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	add r4, r9
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x22
	orrs r0, r1
	strb r0, [r4, 0x3]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x1
	movs r3, 0x3
	bl CalcCenterToCornerVec
	ldrh r0, [r5, 0x2E]
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x3C]
	lsls r0, 16
	asrs r0, 18
	movs r1, 0x7
	ands r0, r1
	lsls r0, 5
	strh r0, [r4, 0x30]
	ldrh r0, [r5, 0x34]
	strh r0, [r4, 0x32]
	movs r0, 0xE8
	strh r0, [r4, 0x34]
	mov r0, r8
	strh r0, [r4, 0x36]
	strh r7, [r4, 0x38]
	strh r6, [r4, 0x3A]
_0813ED66:
	ldrh r1, [r5, 0x3A]
	movs r2, 0x3A
	ldrsh r0, [r5, r2]
	cmp r0, 0x6F
	bgt _0813ED74
	adds r0, r1, 0x4
	strh r0, [r5, 0x3A]
_0813ED74:
	ldr r1, _0813EDB8 @ =gSineTable
	ldrh r0, [r5, 0x3A]
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	movs r4, 0
	ldrsh r0, [r0, r4]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	subs r1, r0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r0, 0x11
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
_0813EDA0:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813EDB0: .4byte gSprites
_0813EDB4: .4byte gSpriteTemplate_840B1B0
_0813EDB8: .4byte gSineTable
	thumb_func_end sub_813EC90

	thumb_func_start InitIntroMudkipAttackAnim
InitIntroMudkipAttackAnim: @ 813EDBC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0813EDF4 @ =gSpriteTemplate_840B1C8
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _0813EDEE
	ldr r1, _0813EDF8 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	strh r4, [r0, 0x2E]
	strh r1, [r0, 0x30]
	movs r1, 0xC
	strh r1, [r0, 0x32]
	movs r1, 0x18
	strh r1, [r0, 0x34]
_0813EDEE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813EDF4: .4byte gSpriteTemplate_840B1C8
_0813EDF8: .4byte gSprites
	thumb_func_end InitIntroMudkipAttackAnim

	thumb_func_start sub_813EDFC
sub_813EDFC: @ 813EDFC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _0813EE12
	adds r4, r5, 0
	adds r4, 0x3E
	cmp r0, 0x1
	beq _0813EE4A
_0813EE12:
	adds r4, r5, 0
	adds r4, 0x3E
	ldrb r1, [r4]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldrb r0, [r5, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r5, 0x1]
	ldrb r1, [r5, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x24
	orrs r0, r1
	strb r0, [r5, 0x3]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x3
	movs r3, 0x3
	bl CalcCenterToCornerVec
	movs r0, 0
	strh r0, [r5, 0x30]
	movs r0, 0x1
	strh r0, [r5, 0x2E]
_0813EE4A:
	ldrh r0, [r5, 0x3C]
	adds r0, 0x1
	strh r0, [r5, 0x3C]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813EE62
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
	b _0813EE7A
_0813EE62:
	ldrb r0, [r4]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r4]
	ldrh r1, [r5, 0x30]
	movs r2, 0x30
	ldrsh r0, [r5, r2]
	cmp r0, 0x3F
	bgt _0813EE7A
	adds r0, r1, 0x1
	strh r0, [r5, 0x30]
_0813EE7A:
	ldr r1, _0813EEB0 @ =gSineTable
	ldrh r0, [r5, 0x30]
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	subs r1, r0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r0, 0x12
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813EEB0: .4byte gSineTable
	thumb_func_end sub_813EDFC

	.align 2, 0 @ Don't pad with nop.
