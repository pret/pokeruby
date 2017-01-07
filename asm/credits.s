	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8144514
sub_8144514: @ 8144514
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r6, _08144548 @ =0x0201c000
	ldr r3, _0814454C @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r2, r0, r3
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	beq _08144550
	cmp r0, 0x1
	bgt _0814453C
	b _08144658
_0814453C:
	cmp r0, 0x2
	beq _08144584
	cmp r0, 0x3
	bne _08144546
	b _08144644
_08144546:
	b _08144658
	.align 2, 0
_08144548: .4byte 0x0201c000
_0814454C: .4byte gTasks
_08144550:
	adds r0, r6, 0
	adds r0, 0x8A
	ldrh r0, [r0]
	cmp r0, 0
	bne _0814456E
	movs r4, 0xA
	ldrsh r0, [r2, r4]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	movs r4, 0x24
	ldrsh r0, [r1, r4]
	cmp r0, 0
	beq _08144658
_0814456E:
	movs r0, 0xA
	ldrsh r1, [r2, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	movs r1, 0
	strh r1, [r0, 0x24]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	b _08144656
_08144584:
	adds r0, r6, 0
	adds r0, 0x88
	ldrh r1, [r0]
	mov r9, r0
	cmp r1, 0x44
	beq _08144658
	movs r4, 0xA
	ldrsh r1, [r2, r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	ldr r1, [r0]
	ldr r0, _081445EC @ =sub_8143B68
	cmp r1, r0
	bne _08144658
	adds r7, r6, 0
	adds r7, 0x8C
	ldrh r0, [r7]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	ldr r4, _081445F0 @ =gUnknown_0840CA00
	adds r5, r6, 0
	adds r5, 0x8A
	ldrh r3, [r5]
	lsls r2, r3, 1
	adds r1, r2, r4
	ldrb r1, [r1]
	adds r4, 0x1
	adds r2, r4
	ldrb r2, [r2]
	bl sub_81456B4
	lsls r0, 24
	lsrs r2, r0, 24
	ldrh r1, [r7]
	adds r0, r6, 0
	adds r0, 0x8E
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	bge _081445F8
	adds r0, r1, 0x1
	strh r0, [r7]
	ldr r1, _081445F4 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r1, 0x32
	b _0814460A
	.align 2, 0
_081445EC: .4byte sub_8143B68
_081445F0: .4byte gUnknown_0840CA00
_081445F4: .4byte gSprites
_081445F8:
	movs r0, 0
	strh r0, [r7]
	ldr r1, _08144620 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r1, 0x80
	lsls r1, 2
_0814460A:
	strh r1, [r0, 0x34]
	mov r1, r9
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	ldrh r0, [r5]
	cmp r0, 0x2
	bne _08144624
	movs r0, 0
	b _08144626
	.align 2, 0
_08144620: .4byte gSprites
_08144624:
	adds r0, 0x1
_08144626:
	strh r0, [r5]
	ldr r0, _08144640 @ =gTasks
	mov r2, r8
	lsls r1, r2, 2
	add r1, r8
	lsls r1, 3
	adds r1, r0
	movs r0, 0x32
	strh r0, [r1, 0xE]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _08144658
	.align 2, 0
_08144640: .4byte gTasks
_08144644:
	ldrh r1, [r2, 0xE]
	movs r3, 0xE
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _08144654
	subs r0, r1, 0x1
	strh r0, [r2, 0xE]
	b _08144658
_08144654:
	movs r0, 0x1
_08144656:
	strh r0, [r2, 0x8]
_08144658:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8144514

	thumb_func_start sub_8144664
sub_8144664: @ 8144664
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0814468C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r6, r1, 0
	cmp r0, 0x32
	bls _08144680
	b _0814492C
_08144680:
	lsls r0, 2
	ldr r1, _08144690 @ =_08144694
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814468C: .4byte gTasks
_08144690: .4byte _08144694
	.align 2, 0
_08144694:
	.4byte _08144760
	.4byte _08144784
	.4byte _081447D8
	.4byte _081447F0
	.4byte _0814482C
	.4byte _08144850
	.4byte _0814489C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _081448A8
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _081448C8
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _081448EC
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _08144920
_08144760:
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r6
	ldrh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 17
	movs r1, 0x7F
	ands r0, r1
	movs r1, 0xC
	bl Sin
	ldr r1, _08144780 @ =gUnknown_0203935A
	strh r0, [r1]
	b _081447A8
	.align 2, 0
_08144780: .4byte gUnknown_0203935A
_08144784:
	ldr r7, _081447B0 @ =gUnknown_0203935A
	movs r3, 0
	ldrsh r4, [r7, r3]
	cmp r4, 0
	beq _081447B4
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r6
	ldrh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 17
	movs r1, 0x7F
	ands r0, r1
	movs r1, 0xC
	bl Sin
	strh r0, [r7]
_081447A8:
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	b _0814492C
	.align 2, 0
_081447B0: .4byte gUnknown_0203935A
_081447B4:
	ldr r3, _081447D4 @ =gSprites
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r6
	movs r0, 0xC
	ldrsh r2, [r1, r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	movs r2, 0x2
	strh r2, [r0, 0x2E]
	strh r4, [r1, 0x12]
	b _08144848
	.align 2, 0
_081447D4: .4byte gSprites
_081447D8:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r1, r0, r6
	ldrh r2, [r1, 0x12]
	movs r3, 0x12
	ldrsh r0, [r1, r3]
	cmp r0, 0x3F
	bgt _08144848
	adds r0, r2, 0x1
	strh r0, [r1, 0x12]
	b _08144866
_081447F0:
	ldr r3, _08144828 @ =gSprites
	lsls r2, r5, 2
	adds r2, r5
	lsls r2, 3
	adds r2, r6
	movs r0, 0xC
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0x3
	strh r1, [r0, 0x2E]
	movs r0, 0xE
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0x1
	strh r1, [r0, 0x2E]
	movs r0, 0x78
	strh r0, [r2, 0x10]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _0814492C
	.align 2, 0
_08144828: .4byte gSprites
_0814482C:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r1, r0, r6
	ldrh r2, [r1, 0x10]
	movs r3, 0x10
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _08144844
	subs r0, r2, 0x1
	strh r0, [r1, 0x10]
	b _0814492C
_08144844:
	movs r0, 0x40
	strh r0, [r1, 0x12]
_08144848:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _0814492C
_08144850:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r6
	ldrh r1, [r4, 0x12]
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _0814487C
	subs r0, r1, 0x1
	strh r0, [r4, 0x12]
_08144866:
	movs r1, 0x7F
	ands r0, r1
	movs r1, 0x14
	bl Sin
	ldr r1, _08144878 @ =gUnknown_0203935A
	strh r0, [r1]
	b _0814492C
	.align 2, 0
_08144878: .4byte gUnknown_0203935A
_0814487C:
	ldr r2, _08144898 @ =gSprites
	movs r3, 0xC
	ldrsh r1, [r4, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x1
	strh r1, [r0, 0x2E]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0814492C
	.align 2, 0
_08144898: .4byte gSprites
_0814489C:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r6
	movs r1, 0x32
	b _0814492A
_081448A8:
	ldr r3, _081448C4 @ =gSprites
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r6
	movs r0, 0xE
	ldrsh r2, [r1, r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	movs r2, 0x2
	b _081448E0
	.align 2, 0
_081448C4: .4byte gSprites
_081448C8:
	ldr r3, _081448E8 @ =gSprites
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r6
	movs r0, 0xC
	ldrsh r2, [r1, r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	movs r2, 0x4
_081448E0:
	strh r2, [r0, 0x2E]
	movs r0, 0x32
	strh r0, [r1, 0x8]
	b _0814492C
	.align 2, 0
_081448E8: .4byte gSprites
_081448EC:
	ldr r3, _0814491C @ =gSprites
	lsls r2, r5, 2
	adds r2, r5
	lsls r2, 3
	adds r2, r6
	movs r0, 0xC
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0x5
	strh r1, [r0, 0x2E]
	movs r0, 0xE
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0x3
	strh r1, [r0, 0x2E]
	movs r0, 0x32
	strh r0, [r2, 0x8]
	b _0814492C
	.align 2, 0
_0814491C: .4byte gSprites
_08144920:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r6
	movs r1, 0
_0814492A:
	strh r1, [r0, 0x8]
_0814492C:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8144664

	thumb_func_start sub_8144934
sub_8144934: @ 8144934
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _08144958 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	movs r3, 0x8
	ldrsh r0, [r0, r3]
	adds r4, r1, 0
	cmp r0, 0x4
	bhi _08144974
	lsls r0, 2
	ldr r1, _0814495C @ =_08144960
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08144958: .4byte gTasks
_0814495C: .4byte _08144960
	.align 2, 0
_08144960:
	.4byte _08144974
	.4byte _081449B8
	.4byte _081449C4
	.4byte _08144A0C
	.4byte _08144A5C
_08144974:
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r2, r0, r4
	movs r1, 0xA
	ldrsh r0, [r2, r1]
	ldr r5, _081449C0 @ =0x00007fff
	cmp r0, r5
	beq _081449B8
	movs r3, 0xC
	ldrsh r1, [r2, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r3, r0, r4
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	movs r1, 0xC
	ldrsh r0, [r0, r1]
	cmp r0, 0x2
	bne _081449B8
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	movs r0, 0x14
	strh r0, [r1, 0x8]
	strh r5, [r2, 0xA]
_081449B8:
	movs r0, 0
	bl sub_8149020
	b _08144A62
	.align 2, 0
_081449C0: .4byte 0x00007fff
_081449C4:
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r2, r0, r4
	movs r3, 0xA
	ldrsh r0, [r2, r3]
	ldr r5, _08144A08 @ =0x00007fff
	cmp r0, r5
	beq _08144A54
	movs r0, 0xC
	ldrsh r1, [r2, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	movs r3, 0xA
	ldrsh r1, [r0, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r3, r0, r4
	ldrh r1, [r3, 0x12]
	movs r0, 0x80
	negs r0, r0
	ands r0, r1
	movs r1, 0xA0
	lsls r1, 2
	cmp r0, r1
	bne _08144A54
	movs r0, 0x1
	strh r0, [r3, 0x8]
	strh r5, [r2, 0xA]
	b _08144A54
	.align 2, 0
_08144A08: .4byte 0x00007fff
_08144A0C:
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r2, r0, r4
	ldrh r3, [r2, 0xA]
	movs r0, 0xA
	ldrsh r1, [r2, r0]
	ldr r5, _08144A48 @ =0x00007fff
	cmp r1, r5
	beq _08144A54
	ldr r0, _08144A4C @ =0x000001f3
	cmp r1, r0
	bne _08144A50
	movs r3, 0xC
	ldrsh r1, [r2, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	movs r3, 0xA
	ldrsh r1, [r0, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	movs r1, 0xA
	strh r1, [r0, 0x8]
	strh r5, [r2, 0xA]
	b _08144A54
	.align 2, 0
_08144A48: .4byte 0x00007fff
_08144A4C: .4byte 0x000001f3
_08144A50:
	adds r0, r3, 0x1
	strh r0, [r2, 0xA]
_08144A54:
	movs r0, 0x1
	bl sub_8149020
	b _08144A62
_08144A5C:
	movs r0, 0x2
	bl sub_8149020
_08144A62:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8144934

	thumb_func_start sub_8144A68
sub_8144A68: @ 8144A68
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r7, r1, 24
	cmp r0, 0x4
	bls _08144A7E
	b _08144DFC
_08144A7E:
	lsls r0, 2
	ldr r1, _08144A88 @ =_08144A8C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08144A88: .4byte _08144A8C
	.align 2, 0
_08144A8C:
	.4byte _08144AA0
	.4byte _08144B48
	.4byte _08144BF4
	.4byte _08144CA0
	.4byte _08144D50
_08144AA0:
	ldr r5, _08144B40 @ =gSprites
	ldr r0, _08144B44 @ =gTasks
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r0
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r3, 0
	movs r2, 0x88
	lsls r2, 1
	strh r2, [r0, 0x20]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x20]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r2, 0x2E
	strh r2, [r0, 0x22]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x22]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	movs r2, 0x20
	b _08144DF0
	.align 2, 0
_08144B40: .4byte gSprites
_08144B44: .4byte gTasks
_08144B48:
	ldr r5, _08144BEC @ =gSprites
	ldr r0, _08144BF0 @ =gTasks
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r0
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r3, 0
	movs r1, 0x78
	strh r1, [r0, 0x20]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x88
	lsls r1, 1
	strh r1, [r0, 0x20]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r2, 0x2E
	strh r2, [r0, 0x22]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x22]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	movs r2, 0x20
	b _08144DF0
	.align 2, 0
_08144BEC: .4byte gSprites
_08144BF0: .4byte gTasks
_08144BF4:
	ldr r5, _08144C98 @ =gSprites
	ldr r0, _08144C9C @ =gTasks
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r0
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r3, 0
	movs r1, 0x78
	strh r1, [r0, 0x20]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x88
	lsls r1, 1
	strh r1, [r0, 0x20]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r2, 0x2E
	strh r2, [r0, 0x22]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x22]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r1, 0x80
	lsls r1, 6
	movs r2, 0x80
	lsls r2, 2
	movs r0, 0x1
	b _08144DF0
	.align 2, 0
_08144C98: .4byte gSprites
_08144C9C: .4byte gTasks
_08144CA0:
	ldr r5, _08144D44 @ =gSprites
	ldr r0, _08144D48 @ =gTasks
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r0
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r3, 0
	movs r1, 0x78
	strh r1, [r0, 0x20]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08144D4C @ =0x0000ffe0
	strh r1, [r0, 0x20]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r2, 0x2E
	strh r2, [r0, 0x22]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x22]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r1, 0x80
	lsls r1, 6
	movs r2, 0x80
	lsls r2, 2
	movs r0, 0x1
	b _08144DF0
	.align 2, 0
_08144D44: .4byte gSprites
_08144D48: .4byte gTasks
_08144D4C: .4byte 0x0000ffe0
_08144D50:
	ldr r5, _08144EBC @ =gSprites
	ldr r0, _08144EC0 @ =gTasks
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r0
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r3, 0
	movs r1, 0x58
	strh r1, [r0, 0x20]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x98
	strh r1, [r0, 0x20]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r2, 0x2E
	strh r2, [r0, 0x22]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x22]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r1, 0x80
	lsls r1, 6
	movs r2, 0x80
	lsls r2, 2
	movs r0, 0x2
_08144DF0:
	movs r3, 0x8
	bl sub_8148EC0
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x8]
_08144DFC:
	ldr r0, _08144EC4 @ =sub_8144934
	movs r1, 0
	bl CreateTask
	ldr r6, _08144EC0 @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r5, r1, r6
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0
	strh r0, [r5, 0xC]
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	mov r1, r8
	strh r1, [r0, 0x8]
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	strh r4, [r0, 0xA]
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	strh r7, [r0, 0xC]
	ldr r0, _08144EC8 @ =sub_8144664
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xA]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	strh r4, [r0, 0x8]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	strh r7, [r0, 0xA]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	ldrh r1, [r5, 0x12]
	strh r1, [r0, 0xC]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	ldrh r1, [r5, 0x14]
	strh r1, [r0, 0xE]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	strh r4, [r0, 0x10]
	mov r1, r8
	cmp r1, 0x2
	bne _08144EB0
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r6
	movs r0, 0x45
	strh r0, [r1, 0x12]
_08144EB0:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08144EBC: .4byte gSprites
_08144EC0: .4byte gTasks
_08144EC4: .4byte sub_8144934
_08144EC8: .4byte sub_8144664
	thumb_func_end sub_8144A68

	thumb_func_start sub_8144ECC
sub_8144ECC: @ 8144ECC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _08144F28 @ =gMain
	ldr r1, _08144F2C @ =0x0000043c
	adds r6, r0, r1
	ldrb r0, [r6]
	cmp r0, 0x1
	beq _08144F38
	cmp r0, 0x1
	ble _08144EF0
	cmp r0, 0x2
	beq _08144F5C
	cmp r0, 0x3
	bne _08144EF0
	b _0814508C
_08144EF0:
	movs r0, 0x80
	lsls r0, 19
	movs r1, 0
	strh r1, [r0]
	ldr r2, _08144F30 @ =REG_BG3HOFS
	movs r0, 0x8
	strh r0, [r2]
	ldr r0, _08144F34 @ =REG_BG3VOFS
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x3A
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	movs r0, 0x1
	strb r0, [r6]
	b _081450A2
	.align 2, 0
_08144F28: .4byte gMain
_08144F2C: .4byte 0x0000043c
_08144F30: .4byte REG_BG3HOFS
_08144F34: .4byte REG_BG3VOFS
_08144F38:
	ldr r1, _08144F54 @ =gUnknown_02039358
	movs r0, 0x22
	strh r0, [r1]
	ldr r1, _08144F58 @ =gUnknown_0203935A
	movs r0, 0
	strh r0, [r1]
	adds r0, r4, 0
	bl sub_8148CB0
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	b _081450A2
	.align 2, 0
_08144F54: .4byte gUnknown_02039358
_08144F58: .4byte gUnknown_0203935A
_08144F5C:
	ldr r0, _08144FBC @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _08144FE0
	ldr r0, _08144FC0 @ =gIntro2BrendanSpriteSheet
	bl LoadCompressedObjectPic
	ldr r0, _08144FC4 @ =gUnknown_08416E34
	bl LoadCompressedObjectPic
	ldr r0, _08144FC8 @ =gIntro2BicycleSpriteSheet
	bl LoadCompressedObjectPic
	ldr r0, _08144FCC @ =gIntro2SpritePalettes
	bl LoadSpritePalettes
	movs r0, 0x78
	movs r1, 0x2E
	bl intro_create_brendan_sprite
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08144FD0 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	strh r2, [r4, 0x12]
	ldr r6, _08144FD4 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r5, r6, 0
	adds r5, 0x1C
	adds r2, r0, r5
	ldr r1, _08144FD8 @ =sub_8145378
	str r1, [r2]
	adds r6, 0x8
	adds r0, r6
	ldr r1, _08144FDC @ =gUnknown_0840CA54
	str r1, [r0]
	movs r0, 0x88
	lsls r0, 1
	movs r1, 0x2E
	bl intro_create_may_sprite
	b _08145034
	.align 2, 0
_08144FBC: .4byte gSaveBlock2
_08144FC0: .4byte gIntro2BrendanSpriteSheet
_08144FC4: .4byte gUnknown_08416E34
_08144FC8: .4byte gIntro2BicycleSpriteSheet
_08144FCC: .4byte gIntro2SpritePalettes
_08144FD0: .4byte gTasks
_08144FD4: .4byte gSprites
_08144FD8: .4byte sub_8145378
_08144FDC: .4byte gUnknown_0840CA54
_08144FE0:
	ldr r0, _0814505C @ =gIntro2MaySpriteSheet
	bl LoadCompressedObjectPic
	ldr r0, _08145060 @ =gUnknown_08416E24
	bl LoadCompressedObjectPic
	ldr r0, _08145064 @ =gIntro2BicycleSpriteSheet
	bl LoadCompressedObjectPic
	ldr r0, _08145068 @ =gIntro2SpritePalettes
	bl LoadSpritePalettes
	movs r0, 0x78
	movs r1, 0x2E
	bl intro_create_may_sprite
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0814506C @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	strh r2, [r4, 0x12]
	ldr r6, _08145070 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r5, r6, 0
	adds r5, 0x1C
	adds r2, r0, r5
	ldr r1, _08145074 @ =sub_8145378
	str r1, [r2]
	adds r6, 0x8
	adds r0, r6
	ldr r1, _08145078 @ =gUnknown_0840CA54
	str r1, [r0]
	movs r0, 0x88
	lsls r0, 1
	movs r1, 0x2E
	bl intro_create_brendan_sprite
_08145034:
	lsls r0, 24
	lsrs r2, r0, 24
	strh r2, [r4, 0x14]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r5, r0, r5
	ldr r1, _0814507C @ =sub_8145420
	str r1, [r5]
	adds r0, r6
	ldr r1, _08145080 @ =gUnknown_0840CA94
	str r1, [r0]
	ldr r1, _08145084 @ =gMain
	ldr r0, _08145088 @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _081450A2
	.align 2, 0
_0814505C: .4byte gIntro2MaySpriteSheet
_08145060: .4byte gUnknown_08416E24
_08145064: .4byte gIntro2BicycleSpriteSheet
_08145068: .4byte gIntro2SpritePalettes
_0814506C: .4byte gTasks
_08145070: .4byte gSprites
_08145074: .4byte sub_8145378
_08145078: .4byte gUnknown_0840CA54
_0814507C: .4byte sub_8145420
_08145080: .4byte gUnknown_0840CA94
_08145084: .4byte gMain
_08145088: .4byte 0x0000043c
_0814508C:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8144A68
	adds r0, r4, 0
	bl sub_8148E90
	movs r0, 0
	strb r0, [r6]
	movs r0, 0x1
	b _081450A4
_081450A2:
	movs r0, 0
_081450A4:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8144ECC

	thumb_func_start sub_81450AC
sub_81450AC: @ 81450AC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08145120 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r1, [r4, 0x8]
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _081450D2
	lsls r0, r1, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	strh r0, [r4, 0x8]
_081450D2:
	ldrh r1, [r4, 0xA]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _081450E8
	lsls r0, r1, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	strh r0, [r4, 0xA]
_081450E8:
	ldrh r1, [r4, 0xC]
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _081450FE
	lsls r0, r1, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	strh r0, [r4, 0xC]
_081450FE:
	ldrh r1, [r4, 0xE]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08145114
	lsls r0, r1, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	strh r0, [r4, 0xE]
_08145114:
	ldr r1, _08145124 @ =gUnknown_0203935C
	movs r0, 0x1
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08145120: .4byte gTasks
_08145124: .4byte gUnknown_0203935C
	thumb_func_end sub_81450AC

	thumb_func_start sub_8145128
sub_8145128: @ 8145128
	push {r4-r7,lr}
	adds r3, r0, 0
	adds r4, r2, 0
	lsls r3, 16
	lsrs r3, 16
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r4, 16
	lsrs r5, r4, 16
	ldr r0, _081451EC @ =gCreditsCopyrightEnd_Gfx
	movs r6, 0xC0
	lsls r6, 19
	adds r3, r6
	adds r1, r3, 0
	bl LZ77UnCompVram
	ldr r0, _081451F0 @ =gIntroCopyright_Pal
	adds r1, r5, 0
	movs r2, 0x20
	bl LoadPalette
	lsrs r4, 20
	lsls r4, 28
	lsrs r4, 16
	movs r2, 0
	adds r1, r4, 0x1
	ldr r3, _081451F4 @ =0x000003ff
_0814515E:
	lsls r0, r2, 1
	adds r0, r7
	adds r0, r6
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r3
	bls _0814515E
	movs r2, 0
	adds r0, r4, 0x2
	adds r6, r4, 0
	adds r6, 0x17
	movs r1, 0x2B
	adds r1, r4
	mov r12, r1
	adds r4, 0x42
	ldr r5, _081451F8 @ =0x060001c8
	adds r3, r0, 0
_08145184:
	lsls r0, r2, 1
	adds r0, r7
	adds r0, r5
	adds r1, r2, r3
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x14
	bls _08145184
	movs r2, 0
	ldr r5, _081451FC @ =0x06000248
	adds r3, r6, 0
_0814519E:
	lsls r0, r2, 1
	adds r0, r7
	adds r0, r5
	adds r1, r2, r3
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x13
	bls _0814519E
	movs r2, 0
	ldr r5, _08145200 @ =0x060002c8
	mov r3, r12
_081451B8:
	lsls r0, r2, 1
	adds r0, r7
	adds r0, r5
	adds r1, r2, r3
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x16
	bls _081451B8
	movs r2, 0
	ldr r3, _08145204 @ =0x06000348
_081451D0:
	lsls r0, r2, 1
	adds r0, r7
	adds r0, r3
	adds r1, r2, r4
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0xB
	bls _081451D0
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081451EC: .4byte gCreditsCopyrightEnd_Gfx
_081451F0: .4byte gIntroCopyright_Pal
_081451F4: .4byte 0x000003ff
_081451F8: .4byte 0x060001c8
_081451FC: .4byte 0x06000248
_08145200: .4byte 0x060002c8
_08145204: .4byte 0x06000348
	thumb_func_end sub_8145128

	thumb_func_start sub_8145208
sub_8145208: @ 8145208
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r2, 0
	movs r0, 0x3F
	ands r0, r2
	adds r1, r0, 0
	adds r1, 0x50
	cmp r2, 0xFF
	bne _08145220
	movs r0, 0x1
	b _08145246
_08145220:
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _08145230
	movs r2, 0x80
	lsls r2, 4
	adds r0, r2, 0
	orrs r1, r0
_08145230:
	movs r0, 0x40
	ands r3, r0
	cmp r3, 0
	beq _08145244
	movs r2, 0x80
	lsls r2, 3
	adds r0, r2, 0
	orrs r1, r0
	lsls r0, r1, 16
	lsrs r1, r0, 16
_08145244:
	adds r0, r1, 0
_08145246:
	pop {r1}
	bx r1
	thumb_func_end sub_8145208

	thumb_func_start sub_814524C
sub_814524C: @ 814524C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	str r0, [sp]
	ldr r0, [sp, 0x2C]
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x4]
	lsls r3, 16
	lsrs r3, 16
	str r3, [sp, 0x8]
	lsls r0, 16
	lsrs r0, 20
	lsls r0, 28
	lsrs r0, 16
	mov r9, r0
	movs r5, 0
_0814527A:
	movs r4, 0
	lsls r7, r5, 1
	ldr r1, [sp, 0x4]
	adds r0, r1, r5
	adds r2, r5, 0x1
	mov r8, r2
	lsls r0, 6
	ldr r1, [sp, 0x8]
	adds r6, r0, r1
_0814528C:
	adds r0, r7, r5
	adds r0, r4
	ldr r2, [sp]
	adds r0, r2, r0
	ldrb r0, [r0]
	bl sub_8145208
	mov r2, r10
	adds r1, r2, r4
	lsls r1, 1
	adds r1, r6
	movs r2, 0xC0
	lsls r2, 19
	adds r1, r2
	add r0, r9
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _0814528C
	mov r1, r8
	lsls r0, r1, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bls _0814527A
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_814524C

	thumb_func_start sub_81452D0
sub_81452D0: @ 81452D0
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	lsrs r1, 20
	lsls r1, 28
	lsrs r1, 16
	movs r2, 0
	ldr r7, _08145360 @ =gUnknown_0840B83C
	movs r4, 0xC0
	lsls r4, 19
	adds r1, 0x1
	ldr r3, _08145364 @ =0x000003ff
_081452EE:
	lsls r0, r2, 1
	adds r0, r5
	adds r0, r4
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r3
	bls _081452EE
	str r6, [sp]
	adds r0, r7, 0
	movs r1, 0x3
	movs r2, 0x7
	adds r3, r5, 0
	bl sub_814524C
	ldr r0, _08145368 @ =gUnknown_0840B84B
	str r6, [sp]
	movs r1, 0x7
	movs r2, 0x7
	adds r3, r5, 0
	bl sub_814524C
	ldr r4, _0814536C @ =gUnknown_0840B85A
	str r6, [sp]
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0x7
	adds r3, r5, 0
	bl sub_814524C
	str r6, [sp]
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0x7
	adds r3, r5, 0
	bl sub_814524C
	ldr r0, _08145370 @ =gUnknown_0840B869
	str r6, [sp]
	movs r1, 0x14
	movs r2, 0x7
	adds r3, r5, 0
	bl sub_814524C
	ldr r0, _08145374 @ =gUnknown_0840B878
	str r6, [sp]
	movs r1, 0x18
	movs r2, 0x7
	adds r3, r5, 0
	bl sub_814524C
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08145360: .4byte gUnknown_0840B83C
_08145364: .4byte 0x000003ff
_08145368: .4byte gUnknown_0840B84B
_0814536C: .4byte gUnknown_0840B85A
_08145370: .4byte gUnknown_0840B869
_08145374: .4byte gUnknown_0840B878
	thumb_func_end sub_81452D0

	thumb_func_start sub_8145378
sub_8145378: @ 8145378
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08145390 @ =gUnknown_0203935C
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _08145394
	adds r0, r4, 0
	bl DestroySprite
	b _08145418
	.align 2, 0
_08145390: .4byte gUnknown_0203935C
_08145394:
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0x5
	bhi _08145418
	lsls r0, 2
	ldr r1, _081453A8 @ =_081453AC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081453A8: .4byte _081453AC
	.align 2, 0
_081453AC:
	.4byte _081453C4
	.4byte _081453CE
	.4byte _081453D4
	.4byte _081453DE
	.4byte _081453E8
	.4byte _081453FE
_081453C4:
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnimIfDifferent
	b _08145418
_081453CE:
	adds r0, r4, 0
	movs r1, 0x1
	b _08145402
_081453D4:
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnimIfDifferent
	b _08145418
_081453DE:
	adds r0, r4, 0
	movs r1, 0x3
	bl StartSpriteAnimIfDifferent
	b _08145418
_081453E8:
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnimIfDifferent
	ldrh r1, [r4, 0x20]
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0x78
	ble _08145418
	subs r0, r1, 0x1
	b _08145416
_081453FE:
	adds r0, r4, 0
	movs r1, 0
_08145402:
	bl StartSpriteAnimIfDifferent
	ldrh r2, [r4, 0x20]
	movs r0, 0x20
	ldrsh r1, [r4, r0]
	movs r0, 0x20
	negs r0, r0
	cmp r1, r0
	ble _08145418
	subs r0, r2, 0x1
_08145416:
	strh r0, [r4, 0x20]
_08145418:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8145378

	thumb_func_start sub_8145420
sub_8145420: @ 8145420
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08145438 @ =gUnknown_0203935C
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0814543C
	adds r0, r4, 0
	bl DestroySprite
	b _081454D8
	.align 2, 0
_08145438: .4byte gUnknown_0203935C
_0814543C:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08145464
	cmp r0, 0x1
	bgt _0814544E
	cmp r0, 0
	beq _08145458
	b _081454D8
_0814544E:
	cmp r0, 0x2
	beq _081454A0
	cmp r0, 0x3
	beq _081454BE
	b _081454D8
_08145458:
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnimIfDifferent
	b _081454D8
_08145464:
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	cmp r0, 0xC8
	ble _08145476
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnimIfDifferent
	b _0814547E
_08145476:
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnimIfDifferent
_0814547E:
	ldrh r2, [r4, 0x20]
	movs r0, 0x20
	ldrsh r1, [r4, r0]
	movs r0, 0x20
	negs r0, r0
	cmp r1, r0
	ble _08145490
	subs r0, r2, 0x2
	strh r0, [r4, 0x20]
_08145490:
	ldr r0, _0814549C @ =gUnknown_0203935A
	ldrh r0, [r0]
	negs r0, r0
	strh r0, [r4, 0x26]
	b _081454D8
	.align 2, 0
_0814549C: .4byte gUnknown_0203935A
_081454A0:
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnimIfDifferent
	ldrh r1, [r4, 0x3C]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _081454D8
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	b _081454D6
_081454BE:
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnimIfDifferent
	ldrh r2, [r4, 0x20]
	movs r0, 0x20
	ldrsh r1, [r4, r0]
	movs r0, 0x20
	negs r0, r0
	cmp r1, r0
	ble _081454D8
	subs r0, r2, 0x1
_081454D6:
	strh r0, [r4, 0x20]
_081454D8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8145420

	thumb_func_start sub_81454E0
sub_81454E0: @ 81454E0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, _081454F8 @ =gUnknown_0203935C
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _081454FC
	adds r0, r5, 0
	bl DestroySprite
	b _081456A6
	.align 2, 0
_081454F8: .4byte gUnknown_0203935C
_081454FC:
	ldrh r0, [r5, 0x3C]
	adds r0, 0x1
	strh r0, [r5, 0x3C]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0xA
	bhi _08145544
	lsls r0, 2
	ldr r1, _08145514 @ =_08145518
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08145514: .4byte _08145518
	.align 2, 0
_08145518:
	.4byte _08145544
	.4byte _0814559E
	.4byte _08145620
	.4byte _08145660
	.4byte _08145544
	.4byte _08145544
	.4byte _08145544
	.4byte _08145544
	.4byte _08145544
	.4byte _08145544
	.4byte _08145696
_08145544:
	ldrb r1, [r5, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r5, 0x1]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r5, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x3]
	movs r0, 0x10
	strh r0, [r5, 0x32]
	ldrh r4, [r5, 0x30]
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x80
	lsls r0, 9
	movs r1, 0x10
	bl __divsi3
	adds r1, r0, 0
	str r1, [sp]
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x1
	strh r0, [r5, 0x2E]
	b _081456A6
_0814559E:
	ldrh r1, [r5, 0x32]
	movs r2, 0x32
	ldrsh r0, [r5, r2]
	cmp r0, 0xFF
	bgt _081455D4
	adds r0, r1, 0
	adds r0, 0x8
	strh r0, [r5, 0x32]
	ldrh r4, [r5, 0x30]
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x32
	ldrsh r1, [r5, r0]
	movs r0, 0x80
	lsls r0, 9
	bl __divsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	b _081455DA
_081455D4:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
_081455DA:
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	cmp r1, 0x2
	beq _081456A6
	cmp r1, 0x2
	bgt _081455EC
	cmp r1, 0x1
	beq _081455F2
	b _081456A6
_081455EC:
	cmp r1, 0x3
	beq _0814560A
	b _081456A6
_081455F2:
	ldrh r1, [r5, 0x3C]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08145602
	ldrh r0, [r5, 0x22]
	adds r0, 0x1
	strh r0, [r5, 0x22]
_08145602:
	ldrh r0, [r5, 0x20]
	subs r0, 0x2
	strh r0, [r5, 0x20]
	b _081456A6
_0814560A:
	ldrh r0, [r5, 0x3C]
	ands r1, r0
	cmp r1, 0
	bne _08145618
	ldrh r0, [r5, 0x22]
	adds r0, 0x1
	strh r0, [r5, 0x22]
_08145618:
	ldrh r0, [r5, 0x20]
	adds r0, 0x2
	strh r0, [r5, 0x20]
	b _081456A6
_08145620:
	ldrh r1, [r5, 0x34]
	movs r2, 0x34
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _08145630
	subs r0, r1, 0x1
	strh r0, [r5, 0x34]
	b _081456A6
_08145630:
	ldr r1, _0814565C @ =REG_BLDCNT
	movs r2, 0xF4
	lsls r2, 4
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x10
	strh r0, [r1]
	ldrb r1, [r5, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r5, 0x1]
	movs r0, 0x10
	strh r0, [r5, 0x34]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _081456A6
	.align 2, 0
_0814565C: .4byte REG_BLDCNT
_08145660:
	ldrh r1, [r5, 0x34]
	movs r2, 0x34
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _08145684
	subs r1, 0x1
	strh r1, [r5, 0x34]
	ldr r3, _08145680 @ =REG_BLDALPHA
	movs r0, 0x34
	ldrsh r2, [r5, r0]
	movs r0, 0x10
	subs r0, r2
	lsls r0, 8
	adds r1, r0
	strh r1, [r3]
	b _081456A6
	.align 2, 0
_08145680: .4byte REG_BLDALPHA
_08145684:
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0xA
	strh r0, [r5, 0x2E]
	b _081456A6
_08145696:
	ldr r0, _081456B0 @ =REG_BLDCNT
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, r5, 0
	bl DestroySprite
_081456A6:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081456B0: .4byte REG_BLDCNT
	thumb_func_end sub_81454E0

	thumb_func_start sub_81456B4
sub_81456B4: @ 81456B4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	lsls r2, 16
	lsrs r2, 16
	str r2, [sp, 0x10]
	lsls r3, 16
	lsrs r3, 16
	mov r9, r3
	adds r0, r6, 0
	bl NationalPokedexNumToSpecies
	adds r6, r0, 0
	cmp r6, 0xC9
	beq _081456F8
	movs r0, 0x9A
	lsls r0, 1
	cmp r6, r0
	beq _081456EE
	movs r7, 0
	b _081456FC
_081456EE:
	ldr r0, _081456F4 @ =gSaveBlock2
	ldr r7, [r0, 0x20]
	b _081456FC
	.align 2, 0
_081456F4: .4byte gSaveBlock2
_081456F8:
	ldr r0, _081457E8 @ =gSaveBlock2
	ldr r7, [r0, 0x1C]
_081456FC:
	lsls r0, r6, 3
	ldr r1, _081457EC @ =gMonFrontPicTable
	adds r0, r1
	ldr r1, _081457F0 @ =gMonFrontPicCoords
	lsls r2, r6, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _081457F4 @ =gUnknown_0840B5A0
	mov r8, r4
	mov r5, r9
	lsls r4, r5, 2
	add r4, r8
	ldr r4, [r4]
	str r4, [sp]
	str r6, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r4, 0x1
	str r4, [sp, 0xC]
	bl LoadSpecialPokePic
	ldr r2, _081457F8 @ =0x0000ffff
	adds r0, r6, 0
	movs r1, 0
	bl species_and_otid_get_pal
	lsls r5, 4
	mov r8, r5
	movs r1, 0x80
	lsls r1, 1
	add r1, r8
	lsls r1, 16
	lsrs r1, 16
	movs r2, 0x20
	bl LoadCompressedPalette
	mov r7, r9
	lsls r6, r7, 24
	lsrs r6, 24
	mov r0, r9
	adds r1, r6, 0
	bl sub_8143648
	ldr r0, _081457FC @ =gUnknown_02024E8C
	mov r2, r10
	lsls r1, r2, 16
	asrs r1, 16
	ldr r3, [sp, 0x10]
	lsls r2, r3, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _08145800 @ =gSprites
	lsls r2, r4, 4
	adds r2, r4
	lsls r2, 2
	adds r3, r2, r5
	ldrb r1, [r3, 0x5]
	movs r0, 0xF
	ands r0, r1
	mov r7, r8
	orrs r0, r7
	movs r1, 0xD
	negs r1, r1
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3, 0x5]
	mov r0, r9
	adds r0, 0x1
	strh r0, [r3, 0x30]
	movs r0, 0x3E
	adds r0, r3
	mov r8, r0
	ldrb r0, [r0]
	orrs r0, r1
	mov r1, r8
	strb r0, [r1]
	adds r0, r5, 0
	adds r0, 0x1C
	adds r2, r0
	ldr r0, _08145804 @ =sub_81454E0
	str r0, [r2]
	ldr r0, _08145808 @ =gSpriteTemplate_840CAEC
	movs r2, 0x20
	ldrsh r1, [r3, r2]
	movs r7, 0x22
	ldrsh r2, [r3, r7]
	movs r3, 0x1
	bl CreateSprite
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r4, [r0, 0x2E]
	adds r1, r6, 0
	bl StartSpriteAnimIfDifferent
	adds r0, r4, 0
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081457E8: .4byte gSaveBlock2
_081457EC: .4byte gMonFrontPicTable
_081457F0: .4byte gMonFrontPicCoords
_081457F4: .4byte gUnknown_0840B5A0
_081457F8: .4byte 0x0000ffff
_081457FC: .4byte gUnknown_02024E8C
_08145800: .4byte gSprites
_08145804: .4byte sub_81454E0
_08145808: .4byte gSpriteTemplate_840CAEC
	thumb_func_end sub_81456B4

	thumb_func_start sub_814580C
sub_814580C: @ 814580C
	push {r4,lr}
	adds r3, r0, 0
	ldr r4, _08145838 @ =gSprites
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0xA
	beq _08145830
	ldr r0, _0814583C @ =gUnknown_0203935C
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	beq _08145840
_08145830:
	adds r0, r3, 0
	bl DestroySprite
	b _081458D4
	.align 2, 0
_08145838: .4byte gSprites
_0814583C: .4byte gUnknown_0203935C
_08145840:
	adds r0, r1, 0
	adds r0, 0x3E
	ldrb r0, [r0]
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	movs r1, 0x4
	ands r1, r0
	mov r0, r12
	ldrb r2, [r0]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	movs r2, 0x2E
	ldrsh r1, [r3, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x1]
	movs r0, 0xC
	ands r0, r1
	ldrb r2, [r3, 0x1]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x1]
	movs r0, 0x2E
	ldrsh r2, [r3, r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r2, 0x4
	negs r2, r2
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x1]
	movs r2, 0x2E
	ldrsh r1, [r3, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x3]
	movs r1, 0x3E
	ands r1, r0
	ldrb r2, [r3, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x3]
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r0, [r0, 0x20]
	strh r0, [r3, 0x20]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r0, [r0, 0x22]
	strh r0, [r3, 0x22]
_081458D4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_814580C

	thumb_func_start sub_81458DC
sub_81458DC: @ 81458DC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r7, _0814597C @ =0x0201c000
	ldr r0, _08145980 @ =0x00004023
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl GetStarterPokemon
	lsls r0, 16
	lsrs r0, 16
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	movs r4, 0x1
	movs r5, 0
	ldr r0, _08145984 @ =0x00000181
	mov r8, r0
_0814590E:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	adds r6, r7, 0
	adds r6, 0x90
	cmp r0, 0
	beq _0814592C
	lsls r0, r5, 1
	adds r0, r6, r0
	strh r4, [r0]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_0814592C:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r8
	bls _0814590E
	adds r4, r5, 0
	ldr r0, _08145984 @ =0x00000181
	lsls r1, r4, 16
	mov r9, r1
	movs r2, 0x8E
	adds r2, r7
	mov r8, r2
	adds r1, r7, 0
	adds r1, 0x86
	str r1, [sp]
	cmp r4, r0
	bhi _08145964
	adds r1, r6, 0
	movs r3, 0
	adds r2, r0, 0
_08145954:
	lsls r0, r4, 1
	adds r0, r1, r0
	strh r3, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r2
	bls _08145954
_08145964:
	movs r2, 0xE5
	lsls r2, 2
	adds r0, r7, r2
	strh r5, [r0]
	mov r1, r9
	lsrs r0, r1, 16
	cmp r0, 0x43
	bhi _08145988
	mov r2, r8
	strh r5, [r2]
	b _0814598E
	.align 2, 0
_0814597C: .4byte 0x0201c000
_08145980: .4byte 0x00004023
_08145984: .4byte 0x00000181
_08145988:
	movs r0, 0x44
	mov r1, r8
	strh r0, [r1]
_0814598E:
	movs r5, 0
	movs r2, 0xE5
	lsls r2, 2
	adds r4, r7, r2
	mov r9, r5
	b _0814599E
_0814599A:
	cmp r5, 0x43
	bhi _081459EE
_0814599E:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4]
	bl __umodsi3
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r1, r5, 1
	adds r1, r7, r1
	lsls r0, r2, 1
	adds r3, r6, r0
	ldrh r0, [r3]
	strh r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	mov r0, r9
	strh r0, [r3]
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r2, r0
	beq _081459E8
	ldrh r0, [r4]
	lsls r0, 1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r3]
	ldrh r0, [r4]
	lsls r0, 1
	adds r0, r6, r0
	mov r1, r9
	strh r1, [r0]
_081459E8:
	ldrh r0, [r4]
	cmp r0, 0
	bne _0814599A
_081459EE:
	mov r2, r8
	ldrh r0, [r2]
	cmp r0, 0x43
	bhi _08145A26
	adds r5, r0, 0
	movs r2, 0
	cmp r5, 0x43
	bhi _08145A5C
	mov r3, r8
_08145A00:
	lsls r1, r5, 1
	adds r1, r7, r1
	lsls r0, r2, 1
	adds r0, r7, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r3]
	cmp r2, r0
	bne _08145A1A
	movs r2, 0
_08145A1A:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x43
	bls _08145A00
	b _08145A5C
_08145A26:
	movs r4, 0
	ldrh r0, [r7]
	cmp r0, r10
	beq _08145A42
_08145A2E:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r0, r4, 1
	adds r0, r7, r0
	ldrh r0, [r0]
	cmp r0, r10
	beq _08145A42
	cmp r4, 0x43
	bls _08145A2E
_08145A42:
	mov r1, r8
	ldrh r0, [r1]
	subs r0, 0x1
	cmp r4, r0
	bge _08145A5C
	lsls r0, r4, 1
	adds r0, r7, r0
	ldr r2, [sp]
	ldrh r1, [r2]
	strh r1, [r0]
	mov r0, r10
	strh r0, [r2]
	b _08145A62
_08145A5C:
	mov r2, r10
	ldr r1, [sp]
	strh r2, [r1]
_08145A62:
	movs r0, 0x44
	mov r1, r8
	strh r0, [r1]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81458DC

	.align 2, 0 @ Don't pad with nop.
