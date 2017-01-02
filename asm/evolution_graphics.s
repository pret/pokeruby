	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start nullsub_84
nullsub_84: @ 814951C
	bx lr
	thumb_func_end nullsub_84

	thumb_func_start sub_8149520
sub_8149520: @ 8149520
	push {r4,r5,lr}
	sub sp, 0x4
	movs r4, 0
	ldr r5, _08149554 @ =gUnknown_08416ED0
_08149528:
	adds r0, r4, 0
	adds r0, 0x14
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
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xB
	bls _08149528
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08149554: .4byte gUnknown_08416ED0
	thumb_func_end sub_8149520

	thumb_func_start sub_8149558
sub_8149558: @ 8149558
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	ble _08149606
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	adds r1, r0, 0
	muls r1, r0
	adds r0, r1, 0
	movs r1, 0x50
	bl __divsi3
	movs r1, 0x58
	subs r1, r0
	strh r1, [r4, 0x22]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _08149592
	adds r0, 0x3
_08149592:
	asrs r0, 2
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x3A]
	adds r0, 0x4
	strh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x3C]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081495BC
	ldrh r0, [r4, 0x38]
	subs r0, 0x1
	strh r0, [r4, 0x38]
_081495BC:
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	cmp r0, 0
	ble _081495D2
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1
	b _081495D8
_081495D2:
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x14
_081495D8:
	strb r0, [r1]
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bge _081495E4
	adds r0, 0x3
_081495E4:
	asrs r0, 2
	adds r0, 0x14
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x1F
	bls _081495F2
	movs r2, 0x1F
_081495F2:
	movs r0, 0x1F
	ands r2, r0
	lsls r2, 1
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x3]
	b _0814960C
_08149606:
	adds r0, r4, 0
	bl DestroySprite
_0814960C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8149558

	thumb_func_start sub_8149614
sub_8149614: @ 8149614
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08149664 @ =gSpriteTemplate_8416EB8
	movs r1, 0x78
	movs r2, 0x58
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0814965E
	ldr r4, _08149668 @ =gSprites
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r2, r3, r4
	movs r1, 0
	movs r0, 0x30
	strh r0, [r2, 0x38]
	strh r5, [r2, 0x3A]
	strh r1, [r2, 0x3C]
	ldrb r1, [r2, 0x1]
	subs r0, 0x34
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r0, [r2, 0x3]
	movs r1, 0x3E
	orrs r0, r1
	strb r0, [r2, 0x3]
	adds r4, 0x1C
	adds r3, r4
	ldr r0, _0814966C @ =sub_8149558
	str r0, [r3]
_0814965E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08149664: .4byte gSpriteTemplate_8416EB8
_08149668: .4byte gSprites
_0814966C: .4byte sub_8149558
	thumb_func_end sub_8149614

	thumb_func_start sub_8149670
sub_8149670: @ 8149670
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	cmp r0, 0x57
	bgt _081496D6
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	adds r1, r0, 0
	muls r1, r0
	adds r0, r1, 0
	movs r1, 0x5
	bl __divsi3
	adds r0, 0x8
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _081496A8
	adds r0, 0x3
_081496A8:
	asrs r0, 2
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	lsls r0, 26
	lsrs r0, 24
	movs r1, 0x28
	bl Sin
	adds r0, 0x8
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	b _081496DC
_081496D6:
	adds r0, r4, 0
	bl DestroySprite
_081496DC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8149670

	thumb_func_start sub_81496E4
sub_81496E4: @ 81496E4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08149740 @ =gSpriteTemplate_8416EB8
	movs r1, 0x78
	movs r2, 0x8
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0814973A
	ldr r4, _08149744 @ =gSprites
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r2, r3, r4
	movs r1, 0
	movs r0, 0x8
	strh r0, [r2, 0x38]
	strh r5, [r2, 0x3A]
	strh r1, [r2, 0x3C]
	ldrb r1, [r2, 0x1]
	subs r0, 0xC
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r1, [r2, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x32
	orrs r0, r1
	strb r0, [r2, 0x3]
	adds r2, 0x43
	movs r0, 0x1
	strb r0, [r2]
	adds r4, 0x1C
	adds r3, r4
	ldr r0, _08149748 @ =sub_8149670
	str r0, [r3]
_0814973A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08149740: .4byte gSpriteTemplate_8416EB8
_08149744: .4byte gSprites
_08149748: .4byte sub_8149670
	thumb_func_end sub_81496E4

	thumb_func_start sub_814974C
sub_814974C: @ 814974C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	ble _08149788
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x38]
	ldrh r1, [r4, 0x34]
	subs r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x3A]
	adds r0, 0x4
	strh r0, [r4, 0x3A]
	b _0814978E
_08149788:
	adds r0, r4, 0
	bl DestroySprite
_0814978E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_814974C

	thumb_func_start sub_8149794
sub_8149794: @ 8149794
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _081497F0 @ =gSpriteTemplate_8416EB8
	movs r1, 0x78
	movs r2, 0x38
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _081497EA
	ldr r4, _081497F4 @ =gSprites
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r2, r3, r4
	movs r1, 0
	strh r5, [r2, 0x34]
	movs r0, 0x78
	strh r0, [r2, 0x38]
	strh r6, [r2, 0x3A]
	strh r1, [r2, 0x3C]
	ldrb r1, [r2, 0x1]
	subs r0, 0x7C
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r0, [r2, 0x3]
	movs r1, 0x3E
	orrs r0, r1
	strb r0, [r2, 0x3]
	adds r2, 0x43
	movs r0, 0x1
	strb r0, [r2]
	adds r4, 0x1C
	adds r3, r4
	ldr r0, _081497F8 @ =sub_814974C
	str r0, [r3]
_081497EA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081497F0: .4byte gSpriteTemplate_8416EB8
_081497F4: .4byte gSprites
_081497F8: .4byte sub_814974C
	thumb_func_end sub_8149794

	thumb_func_start sub_81497FC
sub_81497FC: @ 81497FC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x3C]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08149810
	ldrh r0, [r4, 0x22]
	adds r0, 0x1
	strh r0, [r4, 0x22]
_08149810:
	ldrh r1, [r4, 0x3A]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	cmp r0, 0x7F
	bgt _081498C0
	lsls r0, r1, 24
	lsrs r0, 24
	movs r5, 0x38
	ldrsh r1, [r4, r5]
	bl Sin
	negs r0, r0
	strh r0, [r4, 0x26]
	movs r0, 0x34
	ldrsh r1, [r4, r0]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	muls r0, r1
	movs r1, 0x3
	bl __divsi3
	adds r0, 0x78
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x3A]
	adds r3, r0, 0x1
	strh r3, [r4, 0x3A]
	movs r5, 0x3A
	ldrsh r1, [r4, r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	cmp r0, 0
	bge _08149854
	adds r0, 0x7F
_08149854:
	asrs r0, 7
	movs r1, 0x1F
	subs r1, r0
	lsls r1, 24
	lsrs r2, r1, 24
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, 0x40
	ble _08149870
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1
	strb r0, [r1]
	b _081498A0
_08149870:
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x14
	strb r0, [r1]
	ldrh r1, [r4, 0x3A]
	movs r5, 0x3A
	ldrsh r0, [r4, r5]
	cmp r0, 0x70
	ble _081498A0
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081498A0
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
_081498A0:
	cmp r2, 0x13
	bhi _081498A6
	movs r2, 0x14
_081498A6:
	movs r0, 0x1F
	ands r2, r0
	lsls r2, 1
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x3]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	b _081498C6
_081498C0:
	adds r0, r4, 0
	bl DestroySprite
_081498C6:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81497FC

	thumb_func_start sub_81498CC
sub_81498CC: @ 81498CC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r0, _08149948 @ =gSpriteTemplate_8416EB8
	movs r1, 0x78
	movs r2, 0x38
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x40
	beq _0814993C
	bl Random
	ldr r6, _0814994C @ =gSprites
	lsls r5, r4, 4
	adds r5, r4
	lsls r5, 2
	adds r4, r5, r6
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x7
	bl __umodsi3
	movs r1, 0x3
	subs r1, r0
	movs r0, 0
	mov r8, r0
	strh r1, [r4, 0x34]
	bl Random
	movs r1, 0x3F
	ands r1, r0
	adds r1, 0x30
	strh r1, [r4, 0x38]
	mov r0, r8
	strh r0, [r4, 0x3C]
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	movs r1, 0x3E
	orrs r0, r1
	strb r0, [r4, 0x3]
	adds r4, 0x43
	movs r0, 0x14
	strb r0, [r4]
	adds r6, 0x1C
	adds r5, r6
	ldr r0, _08149950 @ =sub_81497FC
	str r0, [r5]
_0814993C:
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08149948: .4byte gSpriteTemplate_8416EB8
_0814994C: .4byte gSprites
_08149950: .4byte sub_81497FC
	thumb_func_end sub_81498CC

	thumb_func_start sub_8149954
sub_8149954: @ 8149954
	push {lr}
	ldr r0, _08149968 @ =gUnknown_08416E84
	bl LoadCompressedObjectPic
	ldr r0, _0814996C @ =gUnknown_08416E94
	bl LoadSpritePalettes
	pop {r0}
	bx r0
	.align 2, 0
_08149968: .4byte gUnknown_08416E84
_0814996C: .4byte gUnknown_08416E94
	thumb_func_end sub_8149954

	thumb_func_start sub_8149970
sub_8149970: @ 8149970
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _08149998 @ =sub_81499A0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0814999C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xA]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08149998: .4byte sub_81499A0
_0814999C: .4byte gTasks
	thumb_func_end sub_8149970

	thumb_func_start sub_81499A0
sub_81499A0: @ 81499A0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8149520
	ldr r0, _081499E4 @ =gTasks
	lsls r5, r4, 2
	adds r5, r4
	lsls r5, 3
	adds r5, r0
	movs r0, 0
	strh r0, [r5, 0x26]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	movs r0, 0x3
	lsls r0, r1
	ldr r1, _081499E8 @ =0x00007fff
	str r1, [sp]
	movs r1, 0xA
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _081499EC @ =sub_81499F0
	str r0, [r5]
	movs r0, 0x8C
	bl PlaySE
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081499E4: .4byte gTasks
_081499E8: .4byte 0x00007fff
_081499EC: .4byte sub_81499F0
	thumb_func_end sub_81499A0

	thumb_func_start sub_81499F0
sub_81499F0: @ 81499F0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08149A48 @ =gTasks
	lsls r3, r5, 2
	adds r0, r3, r5
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0x26]
	movs r4, 0x26
	ldrsh r0, [r1, r4]
	cmp r0, 0x3F
	bgt _08149A4C
	movs r0, 0x7
	ands r0, r2
	adds r7, r3, 0
	cmp r0, 0
	bne _08149A36
	movs r4, 0
	adds r6, r1, 0
_08149A18:
	ldrh r1, [r6, 0x26]
	movs r0, 0x78
	ands r0, r1
	lsls r0, 1
	lsls r1, r4, 6
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl sub_8149614
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08149A18
_08149A36:
	ldr r0, _08149A48 @ =gTasks
	adds r1, r7, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _08149A54
	.align 2, 0
_08149A48: .4byte gTasks
_08149A4C:
	movs r0, 0x60
	strh r0, [r1, 0x26]
	ldr r0, _08149A5C @ =sub_8149A60
	str r0, [r1]
_08149A54:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08149A5C: .4byte sub_8149A60
	thumb_func_end sub_81499F0

	thumb_func_start sub_8149A60
sub_8149A60: @ 8149A60
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _08149A80 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0, r1
	ldrh r3, [r1, 0x26]
	movs r4, 0x26
	ldrsh r0, [r1, r4]
	cmp r0, 0
	beq _08149A84
	subs r0, r3, 0x1
	strh r0, [r1, 0x26]
	b _08149A8A
	.align 2, 0
_08149A80: .4byte gTasks
_08149A84:
	adds r0, r2, 0
	bl DestroyTask
_08149A8A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8149A60

	thumb_func_start sub_8149A90
sub_8149A90: @ 8149A90
	push {lr}
	ldr r0, _08149AA4 @ =sub_8149AA8
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08149AA4: .4byte sub_8149AA8
	thumb_func_end sub_8149A90

	thumb_func_start sub_8149AA8
sub_8149AA8: @ 8149AA8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8149520
	ldr r1, _08149AD4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x26]
	ldr r1, _08149AD8 @ =sub_8149ADC
	str r1, [r0]
	movs r0, 0xB7
	bl PlaySE
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08149AD4: .4byte gTasks
_08149AD8: .4byte sub_8149ADC
	thumb_func_end sub_8149AA8

	thumb_func_start sub_8149ADC
sub_8149ADC: @ 8149ADC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08149B20 @ =gTasks
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 3
	adds r1, r0, r1
	movs r3, 0x26
	ldrsh r0, [r1, r3]
	cmp r0, 0x5F
	bgt _08149B24
	adds r6, r2, 0
	cmp r0, 0x5
	bgt _08149B0E
	movs r4, 0
_08149AFC:
	lsls r0, r4, 28
	lsrs r0, 24
	bl sub_81496E4
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x8
	bls _08149AFC
_08149B0E:
	ldr r0, _08149B20 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _08149B28
	.align 2, 0
_08149B20: .4byte gTasks
_08149B24:
	ldr r0, _08149B30 @ =sub_8149B34
	str r0, [r1]
_08149B28:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08149B30: .4byte sub_8149B34
	thumb_func_end sub_8149ADC

	thumb_func_start sub_8149B34
sub_8149B34: @ 8149B34
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	pop {r0}
	bx r0
	thumb_func_end sub_8149B34

	thumb_func_start sub_8149B44
sub_8149B44: @ 8149B44
	push {lr}
	ldr r0, _08149B58 @ =sub_8149B5C
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08149B58: .4byte sub_8149B5C
	thumb_func_end sub_8149B44

	thumb_func_start sub_8149B5C
sub_8149B5C: @ 8149B5C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8149520
	ldr r1, _08149B88 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x26]
	ldr r1, _08149B8C @ =sub_8149B90
	str r1, [r0]
	movs r0, 0x66
	bl PlaySE
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08149B88: .4byte gTasks
_08149B8C: .4byte sub_8149B90
	thumb_func_end sub_8149B5C

	thumb_func_start sub_8149B90
sub_8149B90: @ 8149B90
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08149BFC @ =gTasks
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 3
	adds r1, r0, r1
	movs r3, 0x26
	ldrsh r0, [r1, r3]
	cmp r0, 0x2F
	bgt _08149C00
	adds r6, r2, 0
	cmp r0, 0
	bne _08149BC4
	movs r4, 0
_08149BB0:
	lsls r0, r4, 28
	lsrs r0, 24
	movs r1, 0x4
	bl sub_8149794
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _08149BB0
_08149BC4:
	ldr r0, _08149BFC @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	movs r2, 0x26
	ldrsh r0, [r1, r2]
	cmp r0, 0x20
	bne _08149BEA
	movs r4, 0
_08149BD6:
	lsls r0, r4, 28
	lsrs r0, 24
	movs r1, 0x8
	bl sub_8149794
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _08149BD6
_08149BEA:
	ldr r0, _08149BFC @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _08149C04
	.align 2, 0
_08149BFC: .4byte gTasks
_08149C00:
	ldr r0, _08149C0C @ =sub_8149C10
	str r0, [r1]
_08149C04:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08149C0C: .4byte sub_8149C10
	thumb_func_end sub_8149B90

	thumb_func_start sub_8149C10
sub_8149C10: @ 8149C10
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	pop {r0}
	bx r0
	thumb_func_end sub_8149C10

	thumb_func_start sub_8149C20
sub_8149C20: @ 8149C20
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _08149C48 @ =sub_8149C50
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08149C4C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xC]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08149C48: .4byte sub_8149C50
_08149C4C: .4byte gTasks
	thumb_func_end sub_8149C20

	thumb_func_start sub_8149C50
sub_8149C50: @ 8149C50
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8149520
	ldr r0, _08149C98 @ =gTasks
	lsls r5, r4, 2
	adds r5, r4
	lsls r5, 3
	adds r5, r0
	movs r0, 0
	strh r0, [r5, 0x26]
	ldr r0, _08149C9C @ =gPlttBufferFaded + 0x40
	ldr r1, _08149CA0 @ =gPlttBufferUnfaded + 0x40
	movs r2, 0x30
	bl CpuSet
	ldr r0, _08149CA4 @ =0xfff9001c
	ldr r1, _08149CA8 @ =0x00007fff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08149CAC @ =sub_8149CB0
	str r0, [r5]
	movs r0, 0xCA
	bl PlaySE
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08149C98: .4byte gTasks
_08149C9C: .4byte gPlttBufferFaded + 0x40
_08149CA0: .4byte gPlttBufferUnfaded + 0x40
_08149CA4: .4byte 0xfff9001c
_08149CA8: .4byte 0x00007fff
_08149CAC: .4byte sub_8149CB0
	thumb_func_end sub_8149C50

	thumb_func_start sub_8149CB0
sub_8149CB0: @ 8149CB0
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08149CE8 @ =gTasks
	lsls r5, r6, 2
	adds r0, r5, r6
	lsls r0, 3
	adds r1, r0, r1
	movs r0, 0x26
	ldrsh r2, [r1, r0]
	cmp r2, 0x7F
	bgt _08149D2C
	adds r0, r2, 0
	cmp r0, 0
	beq _08149CEC
	cmp r0, 0x20
	beq _08149D00
	cmp r2, 0x31
	bgt _08149D10
	bl Random
	movs r1, 0x7
	ands r0, r1
	bl sub_81498CC
	b _08149D10
	.align 2, 0
_08149CE8: .4byte gTasks
_08149CEC:
	movs r4, 0
_08149CEE:
	adds r0, r4, 0
	bl sub_81498CC
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _08149CEE
	b _08149D10
_08149D00:
	ldr r0, _08149D20 @ =0xffff001c
	ldr r1, _08149D24 @ =0x00007fff
	str r1, [sp]
	movs r1, 0x10
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_08149D10:
	ldr r0, _08149D28 @ =gTasks
	adds r1, r5, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _08149D30
	.align 2, 0
_08149D20: .4byte 0xffff001c
_08149D24: .4byte 0x00007fff
_08149D28: .4byte gTasks
_08149D2C:
	ldr r0, _08149D38 @ =sub_8149D3C
	str r0, [r1]
_08149D30:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08149D38: .4byte sub_8149D3C
	thumb_func_end sub_8149CB0

	thumb_func_start sub_8149D3C
sub_8149D3C: @ 8149D3C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08149D58 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08149D54
	adds r0, r2, 0
	bl DestroyTask
_08149D54:
	pop {r0}
	bx r0
	.align 2, 0
_08149D58: .4byte gPaletteFade
	thumb_func_end sub_8149D3C

	thumb_func_start sub_8149D5C
sub_8149D5C: @ 8149D5C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _08149D84 @ =sub_8149D8C
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08149D88 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xC]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08149D84: .4byte sub_8149D8C
_08149D88: .4byte gTasks
	thumb_func_end sub_8149D5C

	thumb_func_start sub_8149D8C
sub_8149D8C: @ 8149D8C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8149520
	ldr r0, _08149DD4 @ =gTasks
	lsls r5, r4, 2
	adds r5, r4
	lsls r5, 3
	adds r5, r0
	movs r0, 0
	strh r0, [r5, 0x26]
	ldr r0, _08149DD8 @ =gPlttBufferFaded + 0x40
	ldr r1, _08149DDC @ =gPlttBufferUnfaded + 0x40
	movs r2, 0x30
	bl CpuSet
	ldr r0, _08149DE0 @ =0xfff90001
	ldr r1, _08149DE4 @ =0x00007fff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08149DE8 @ =sub_8149DEC
	str r0, [r5]
	movs r0, 0xCA
	bl PlaySE
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08149DD4: .4byte gTasks
_08149DD8: .4byte gPlttBufferFaded + 0x40
_08149DDC: .4byte gPlttBufferUnfaded + 0x40
_08149DE0: .4byte 0xfff90001
_08149DE4: .4byte 0x00007fff
_08149DE8: .4byte sub_8149DEC
	thumb_func_end sub_8149D8C

	thumb_func_start sub_8149DEC
sub_8149DEC: @ 8149DEC
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08149E24 @ =gTasks
	lsls r5, r6, 2
	adds r0, r5, r6
	lsls r0, 3
	adds r1, r0, r1
	movs r0, 0x26
	ldrsh r2, [r1, r0]
	cmp r2, 0x7F
	bgt _08149E68
	adds r0, r2, 0
	cmp r0, 0
	beq _08149E28
	cmp r0, 0x20
	beq _08149E3C
	cmp r2, 0x31
	bgt _08149E4C
	bl Random
	movs r1, 0x7
	ands r0, r1
	bl sub_81498CC
	b _08149E4C
	.align 2, 0
_08149E24: .4byte gTasks
_08149E28:
	movs r4, 0
_08149E2A:
	adds r0, r4, 0
	bl sub_81498CC
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _08149E2A
	b _08149E4C
_08149E3C:
	ldr r0, _08149E5C @ =0xffff0001
	ldr r1, _08149E60 @ =0x00007fff
	str r1, [sp]
	movs r1, 0x10
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_08149E4C:
	ldr r0, _08149E64 @ =gTasks
	adds r1, r5, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _08149E6C
	.align 2, 0
_08149E5C: .4byte 0xffff0001
_08149E60: .4byte 0x00007fff
_08149E64: .4byte gTasks
_08149E68:
	ldr r0, _08149E74 @ =sub_8149D3C
	str r0, [r1]
_08149E6C:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08149E74: .4byte sub_8149D3C
	thumb_func_end sub_8149DEC

	thumb_func_start nullsub_85
nullsub_85: @ 8149E78
	bx lr
	thumb_func_end nullsub_85

	thumb_func_start sub_8149E7C
sub_8149E7C: @ 8149E7C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	movs r1, 0
	ldr r3, _08149FB0 @ =sub_8149FC8
	ldr r2, _08149FB4 @ =0x00007fff
_08149E96:
	lsls r0, r1, 1
	add r0, sp
	adds r0, 0x4
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xF
	bls _08149E96
	adds r0, r3, 0
	movs r1, 0
	bl CreateTask
	mov r8, r0
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _08149FB8 @ =gTasks
	mov r1, r8
	lsls r6, r1, 2
	add r6, r8
	lsls r6, 3
	adds r6, r0
	strh r5, [r6, 0xA]
	strh r7, [r6, 0xC]
	movs r1, 0x80
	lsls r1, 1
	strh r1, [r6, 0xE]
	movs r0, 0x10
	strh r0, [r6, 0x10]
	movs r4, 0x80
	lsls r4, 9
	str r1, [sp]
	movs r0, 0x1E
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	movs r0, 0x10
	ldrsh r1, [r6, r0]
	adds r0, r4, 0
	bl __divsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r0, 0x1F
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	ldr r1, _08149FBC @ =gSprites
	mov r9, r1
	lsls r2, r5, 4
	adds r2, r5
	lsls r2, 2
	mov r3, r9
	adds r3, 0x1C
	adds r0, r2, r3
	ldr r1, _08149FC0 @ =nullsub_85
	str r1, [r0]
	add r2, r9
	ldrb r1, [r2, 0x1]
	movs r4, 0x4
	negs r4, r4
	adds r0, r4, 0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r1, [r2, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x3C
	orrs r0, r1
	strb r0, [r2, 0x3]
	movs r0, 0x3E
	adds r0, r2
	mov r10, r0
	ldrb r1, [r0]
	movs r5, 0x5
	negs r5, r5
	adds r0, r5, 0
	ands r0, r1
	mov r1, r10
	strb r0, [r1]
	ldrb r1, [r2, 0x5]
	lsrs r1, 4
	lsls r1, 5
	ldr r0, _08149FC4 @ =gPlttBufferFaded + 0x200
	mov r10, r0
	add r1, r10
	add r0, sp, 0x4
	movs r2, 0x10
	str r3, [sp, 0x24]
	bl CpuSet
	lsls r1, r7, 4
	adds r1, r7
	lsls r1, 2
	ldr r3, [sp, 0x24]
	adds r3, r1, r3
	ldr r0, _08149FC0 @ =nullsub_85
	str r0, [r3]
	add r1, r9
	ldrb r0, [r1, 0x1]
	ands r4, r0
	movs r0, 0x1
	orrs r4, r0
	strb r4, [r1, 0x1]
	ldrb r0, [r1, 0x3]
	movs r2, 0x3E
	orrs r0, r2
	strb r0, [r1, 0x3]
	adds r2, r1, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	ands r5, r0
	strb r5, [r2]
	ldrb r1, [r1, 0x5]
	lsrs r1, 4
	lsls r1, 5
	add r1, r10
	add r0, sp, 0x4
	movs r2, 0x10
	bl CpuSet
	movs r1, 0
	strh r1, [r6, 0x18]
	mov r0, r8
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08149FB0: .4byte sub_8149FC8
_08149FB4: .4byte 0x00007fff
_08149FB8: .4byte gTasks
_08149FBC: .4byte gSprites
_08149FC0: .4byte nullsub_85
_08149FC4: .4byte gPlttBufferFaded + 0x200
	thumb_func_end sub_8149E7C

	thumb_func_start sub_8149FC8
sub_8149FC8: @ 8149FC8
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08149FE4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x12]
	movs r0, 0x8
	strh r0, [r1, 0x14]
	ldr r0, _08149FE8 @ =sub_8149FEC
	str r0, [r1]
	bx lr
	.align 2, 0
_08149FE4: .4byte gTasks
_08149FE8: .4byte sub_8149FEC
	thumb_func_end sub_8149FC8

	thumb_func_start sub_8149FEC
sub_8149FEC: @ 8149FEC
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _0814A00C @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r2, r0, r1
	movs r1, 0x18
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _0814A010
	adds r0, r3, 0
	bl sub_814A208
	b _0814A032
	.align 2, 0
_0814A00C: .4byte gTasks
_0814A010:
	ldrh r1, [r2, 0x14]
	movs r4, 0x14
	ldrsh r0, [r2, r4]
	cmp r0, 0x80
	bne _0814A022
	adds r0, r3, 0
	bl sub_814A158
	b _0814A032
_0814A022:
	adds r0, r1, 0x2
	strh r0, [r2, 0x14]
	ldrh r0, [r2, 0x12]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r2, 0x12]
	ldr r0, _0814A038 @ =sub_814A03C
	str r0, [r2]
_0814A032:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814A038: .4byte sub_814A03C
	thumb_func_end sub_8149FEC

	thumb_func_start sub_814A03C
sub_814A03C: @ 814A03C
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0814A060 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	movs r3, 0x18
	ldrsh r0, [r2, r3]
	adds r5, r1, 0
	cmp r0, 0
	beq _0814A068
	ldr r0, _0814A064 @ =sub_814A208
	str r0, [r2]
	b _0814A14C
	.align 2, 0
_0814A060: .4byte gTasks
_0814A064: .4byte sub_814A208
_0814A068:
	movs r6, 0
	movs r7, 0x12
	ldrsh r0, [r2, r7]
	cmp r0, 0
	bne _0814A0B8
	movs r0, 0xE
	ldrsh r1, [r2, r0]
	movs r3, 0x14
	ldrsh r0, [r2, r3]
	movs r3, 0x80
	lsls r3, 1
	subs r0, r3, r0
	cmp r1, r0
	bge _0814A08E
	ldrh r0, [r2, 0x14]
	ldrh r7, [r2, 0xE]
	adds r0, r7
	strh r0, [r2, 0xE]
	b _0814A092
_0814A08E:
	strh r3, [r2, 0xE]
	movs r6, 0x1
_0814A092:
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 3
	adds r3, r0, r5
	movs r0, 0x10
	ldrsh r1, [r3, r0]
	movs r7, 0x14
	ldrsh r0, [r3, r7]
	adds r0, 0x10
	cmp r1, r0
	ble _0814A0B2
	ldrh r0, [r3, 0x10]
	ldrh r1, [r3, 0x14]
	subs r0, r1
	strh r0, [r3, 0x10]
	b _0814A102
_0814A0B2:
	movs r0, 0x10
	strh r0, [r3, 0x10]
	b _0814A0FC
_0814A0B8:
	movs r0, 0x10
	ldrsh r1, [r2, r0]
	movs r3, 0x14
	ldrsh r0, [r2, r3]
	movs r3, 0x80
	lsls r3, 1
	subs r0, r3, r0
	cmp r1, r0
	bge _0814A0D4
	ldrh r0, [r2, 0x14]
	ldrh r7, [r2, 0x10]
	adds r0, r7
	strh r0, [r2, 0x10]
	b _0814A0D8
_0814A0D4:
	strh r3, [r2, 0x10]
	movs r6, 0x1
_0814A0D8:
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 3
	adds r3, r0, r5
	movs r0, 0xE
	ldrsh r1, [r3, r0]
	movs r7, 0x14
	ldrsh r0, [r3, r7]
	adds r0, 0x10
	cmp r1, r0
	ble _0814A0F8
	ldrh r0, [r3, 0xE]
	ldrh r1, [r3, 0x14]
	subs r0, r1
	strh r0, [r3, 0xE]
	b _0814A102
_0814A0F8:
	movs r0, 0x10
	strh r0, [r3, 0xE]
_0814A0FC:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0814A102:
	adds r0, r2, r4
	lsls r0, 3
	adds r5, r0, r5
	movs r0, 0xE
	ldrsh r1, [r5, r0]
	movs r4, 0x80
	lsls r4, 9
	adds r0, r4, 0
	bl __divsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r0, 0x1E
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	movs r3, 0x10
	ldrsh r1, [r5, r3]
	adds r0, r4, 0
	bl __divsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r0, 0x1F
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	cmp r6, 0x2
	bne _0814A14C
	ldr r0, _0814A154 @ =sub_8149FEC
	str r0, [r5]
_0814A14C:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814A154: .4byte sub_8149FEC
	thumb_func_end sub_814A03C

	thumb_func_start sub_814A158
sub_814A158: @ 814A158
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0814A200 @ =gSprites
	mov r8, r1
	ldr r1, _0814A204 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	add r2, r8
	ldrb r3, [r2, 0x1]
	movs r6, 0x4
	negs r6, r6
	adds r1, r6, 0
	ands r1, r3
	strb r1, [r2, 0x1]
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	add r2, r8
	ldrb r3, [r2, 0x3]
	movs r5, 0x3F
	negs r5, r5
	adds r1, r5, 0
	ands r1, r3
	strb r1, [r2, 0x3]
	movs r1, 0xA
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r3, 0x4
	orrs r2, r3
	strb r2, [r1]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	ldrb r2, [r1, 0x1]
	ands r6, r2
	strb r6, [r1, 0x1]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	ldrb r2, [r1, 0x3]
	ands r5, r2
	strb r5, [r1, 0x3]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	ands r2, r3
	strb r2, [r1]
	bl DestroyTask
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814A200: .4byte gSprites
_0814A204: .4byte gTasks
	thumb_func_end sub_814A158

	thumb_func_start sub_814A208
sub_814A208: @ 814A208
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0814A2B0 @ =gSprites
	mov r8, r1
	ldr r1, _0814A2B4 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	add r2, r8
	ldrb r3, [r2, 0x1]
	movs r6, 0x4
	negs r6, r6
	adds r1, r6, 0
	ands r1, r3
	strb r1, [r2, 0x1]
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	add r2, r8
	ldrb r3, [r2, 0x3]
	movs r5, 0x3F
	negs r5, r5
	adds r1, r5, 0
	ands r1, r3
	strb r1, [r2, 0x3]
	movs r1, 0xA
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	ands r2, r3
	strb r2, [r1]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	ldrb r2, [r1, 0x1]
	ands r6, r2
	strb r6, [r1, 0x1]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	ldrb r2, [r1, 0x3]
	ands r5, r2
	strb r5, [r1, 0x3]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r3, 0x4
	orrs r2, r3
	strb r2, [r1]
	bl DestroyTask
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814A2B0: .4byte gSprites
_0814A2B4: .4byte gTasks
	thumb_func_end sub_814A208

	.align 2, 0 @ Don't pad with nop.
