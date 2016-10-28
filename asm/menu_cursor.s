	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_814A590
sub_814A590: @ 814A590
	ldr r0, _0814A5AC @ =gUnknown_0203A3D0
	movs r1, 0x40
	strb r1, [r0]
	ldr r0, _0814A5B0 @ =gUnknown_0203A3D1
	strb r1, [r0]
	ldr r0, _0814A5B4 @ =gUnknown_0203A3D2
	strb r1, [r0]
	ldr r0, _0814A5B8 @ =gUnknown_0203A3D3
	movs r1, 0
	strb r1, [r0]
	ldr r0, _0814A5BC @ =gUnknown_0203A3D4
	strb r1, [r0]
	bx lr
	.align 2, 0
_0814A5AC: .4byte gUnknown_0203A3D0
_0814A5B0: .4byte gUnknown_0203A3D1
_0814A5B4: .4byte gUnknown_0203A3D2
_0814A5B8: .4byte gUnknown_0203A3D3
_0814A5BC: .4byte gUnknown_0203A3D4
	thumb_func_end sub_814A590

	thumb_func_start sub_814A5C0
sub_814A5C0: @ 814A5C0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r4, [sp, 0x1C]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 24
	lsrs r5, r2, 24
	lsls r3, 16
	lsrs r7, r3, 16
	lsls r4, 24
	lsrs r4, 24
	mov r9, r4
	ldr r0, _0814A678 @ =gUnknown_0203A3D0
	ldrb r0, [r0]
	cmp r0, 0x40
	bne _0814A5F2
	ldr r0, _0814A67C @ =gUnknown_0203A3D1
	ldrb r0, [r0]
	cmp r0, 0x40
	beq _0814A5F6
_0814A5F2:
	bl sub_814A7FC
_0814A5F6:
	movs r4, 0x1
	ldr r0, _0814A680 @ =0x0000ffff
	cmp r6, r0
	bne _0814A61C
	ldr r1, _0814A684 @ =gUnknown_0203A360
	movs r0, 0xF
	ands r0, r5
	lsls r0, 1
	adds r0, r1
	strh r7, [r0]
	ldr r0, _0814A688 @ =gUnknown_0842F240
	bl LoadSpritePalette
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0814A61C
	ldr r6, _0814A68C @ =0x0000fff0
	movs r4, 0
_0814A61C:
	movs r7, 0xF
	adds r0, r5, 0
	ands r0, r7
	lsls r0, 3
	ldr r1, _0814A690 @ =gUnknown_0842F140
	adds r0, r1
	bl LoadSpriteSheetDeferred
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 3
	ldr r4, _0814A694 @ =gSpriteTemplate_842F250
	adds r0, r4
	movs r1, 0
	movs r2, 0xA0
	mov r3, r8
	bl CreateSprite
	ldr r5, _0814A678 @ =gUnknown_0203A3D0
	strb r0, [r5]
	adds r4, 0x30
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0xA0
	mov r3, r8
	bl CreateSprite
	ldr r1, _0814A67C @ =gUnknown_0203A3D1
	strb r0, [r1]
	ldrb r0, [r5]
	cmp r0, 0x40
	beq _0814A6AE
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814A698 @ =gSprites
	adds r4, r0, r1
	ldr r0, _0814A680 @ =0x0000ffff
	cmp r6, r0
	bne _0814A69C
	ldrb r1, [r4, 0x5]
	adds r0, r7, 0
	ands r0, r1
	strb r0, [r4, 0x5]
	b _0814A6AE
	.align 2, 0
_0814A678: .4byte gUnknown_0203A3D0
_0814A67C: .4byte gUnknown_0203A3D1
_0814A680: .4byte 0x0000ffff
_0814A684: .4byte gUnknown_0203A360
_0814A688: .4byte gUnknown_0842F240
_0814A68C: .4byte 0x0000fff0
_0814A690: .4byte gUnknown_0842F140
_0814A694: .4byte gSpriteTemplate_842F250
_0814A698: .4byte gSprites
_0814A69C:
	adds r0, r6, 0
	bl IndexOfSpritePaletteTag
	lsls r0, 4
	ldrb r2, [r4, 0x5]
	adds r1, r7, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x5]
_0814A6AE:
	ldr r1, _0814A6D4 @ =gUnknown_0203A3D1
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814A72C
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814A6D8 @ =gSprites
	adds r4, r0, r1
	ldr r0, _0814A6DC @ =0x0000ffff
	cmp r6, r0
	bne _0814A6E0
	ldrb r1, [r4, 0x5]
	movs r0, 0xF
	ands r0, r1
	strb r0, [r4, 0x5]
	b _0814A6F2
	.align 2, 0
_0814A6D4: .4byte gUnknown_0203A3D1
_0814A6D8: .4byte gSprites
_0814A6DC: .4byte 0x0000ffff
_0814A6E0:
	adds r0, r6, 0
	bl IndexOfSpritePaletteTag
	lsls r0, 4
	ldrb r2, [r4, 0x5]
	movs r1, 0xF
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x5]
_0814A6F2:
	movs r3, 0x80
	lsls r3, 19
	ldrh r1, [r3]
	movs r0, 0xC0
	lsls r0, 7
	ands r0, r1
	cmp r0, 0
	bne _0814A70C
	ldr r0, _0814A744 @ =REG_WINOUT
	ldrb r1, [r0]
	movs r2, 0x1F
	orrs r1, r2
	strb r1, [r0]
_0814A70C:
	ldr r1, _0814A748 @ =gUnknown_0203A3D3
	ldrh r0, [r3]
	lsrs r0, 15
	strb r0, [r1]
	ldr r1, _0814A74C @ =gUnknown_0203A3D4
	ldr r2, _0814A750 @ =0x0400004b
	ldrb r0, [r2]
	strb r0, [r1]
	ldrh r0, [r3]
	movs r4, 0x80
	lsls r4, 8
	adds r1, r4, 0
	orrs r0, r1
	strh r0, [r3]
	movs r0, 0x10
	strb r0, [r2]
_0814A72C:
	mov r0, r9
	bl sub_814A958
	ldr r0, _0814A754 @ =gUnknown_0203A3D0
	ldrb r0, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0814A744: .4byte REG_WINOUT
_0814A748: .4byte gUnknown_0203A3D3
_0814A74C: .4byte gUnknown_0203A3D4
_0814A750: .4byte 0x0400004b
_0814A754: .4byte gUnknown_0203A3D0
	thumb_func_end sub_814A5C0

	thumb_func_start sub_814A758
sub_814A758: @ 814A758
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp]
	movs r1, 0
	movs r3, 0
	bl sub_814A5C0
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	cmp r4, 0x40
	beq _0814A79A
	ldr r0, _0814A7A4 @ =gUnknown_0203A3D0
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0814A7A8 @ =gSprites
	adds r1, r0
	lsls r3, r5, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
_0814A79A:
	adds r0, r4, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0814A7A4: .4byte gUnknown_0203A3D0
_0814A7A8: .4byte gSprites
	thumb_func_end sub_814A758

	thumb_func_start unref_sub_814A7AC
unref_sub_814A7AC: @ 814A7AC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 24
	lsrs r7, r2, 24
	movs r3, 0
	movs r2, 0xF
	movs r1, 0
	ldr r6, _0814A7F8 @ =gPlttBufferUnfaded
	movs r5, 0xF
_0814A7C6:
	lsls r0, r1, 1
	adds r0, r6
	ldrh r0, [r0]
	cmp r0, r4
	bne _0814A7DA
	lsrs r0, r1, 4
	lsls r0, 24
	lsrs r3, r0, 24
	adds r2, r1, 0
	ands r2, r5
_0814A7DA:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xFF
	bls _0814A7C6
	mov r0, r12
	adds r1, r3, 0
	adds r3, r7, 0
	bl sub_814A758
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0814A7F8: .4byte gPlttBufferUnfaded
	thumb_func_end unref_sub_814A7AC

	thumb_func_start sub_814A7FC
sub_814A7FC: @ 814A7FC
	push {r4,lr}
	ldr r4, _0814A860 @ =gUnknown_0203A3D0
	ldrb r0, [r4]
	cmp r0, 0x40
	beq _0814A820
	ldr r0, _0814A864 @ =gUnknown_0842F140
	bl LoadTilesForSpriteSheet
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814A868 @ =gSprites
	adds r0, r1
	bl DestroySpriteAndFreeResources
	movs r0, 0x40
	strb r0, [r4]
_0814A820:
	ldr r4, _0814A86C @ =gUnknown_0203A3D1
	ldrb r0, [r4]
	cmp r0, 0x40
	beq _0814A858
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814A868 @ =gSprites
	adds r0, r1
	bl DestroySpriteAndFreeResources
	movs r0, 0x40
	strb r0, [r4]
	ldr r0, _0814A870 @ =gUnknown_0203A3D3
	ldrb r0, [r0]
	cmp r0, 0
	bne _0814A850
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _0814A874 @ =0x00007fff
	ands r0, r1
	strh r0, [r2]
_0814A850:
	ldr r0, _0814A878 @ =0x0400004b
	ldr r1, _0814A87C @ =gUnknown_0203A3D4
	ldrb r1, [r1]
	strb r1, [r0]
_0814A858:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814A860: .4byte gUnknown_0203A3D0
_0814A864: .4byte gUnknown_0842F140
_0814A868: .4byte gSprites
_0814A86C: .4byte gUnknown_0203A3D1
_0814A870: .4byte gUnknown_0203A3D3
_0814A874: .4byte 0x00007fff
_0814A878: .4byte 0x0400004b
_0814A87C: .4byte gUnknown_0203A3D4
	thumb_func_end sub_814A7FC

	thumb_func_start sub_814A880
sub_814A880: @ 814A880
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, r5, 0
	lsls r1, 24
	lsrs r4, r1, 24
	adds r6, r4, 0
	ldr r1, _0814A8F8 @ =gUnknown_0203A3D0
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814A8C0
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814A8FC @ =gSprites
	adds r2, r0, r1
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	adds r0, r2, 0
	adds r0, 0x28
	movs r1, 0
	strb r1, [r0]
	adds r0, 0x1
	strb r1, [r0]
	strh r5, [r2, 0x20]
	strh r4, [r2, 0x22]
_0814A8C0:
	ldr r1, _0814A900 @ =gUnknown_0203A3D1
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814A8F2
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814A8FC @ =gSprites
	adds r2, r0, r1
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	adds r0, r2, 0
	adds r0, 0x28
	movs r1, 0
	strb r1, [r0]
	adds r0, 0x1
	strb r1, [r0]
	strh r7, [r2, 0x20]
	strh r6, [r2, 0x22]
_0814A8F2:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814A8F8: .4byte gUnknown_0203A3D0
_0814A8FC: .4byte gSprites
_0814A900: .4byte gUnknown_0203A3D1
	thumb_func_end sub_814A880

	thumb_func_start sub_814A904
sub_814A904: @ 814A904
	push {lr}
	ldr r1, _0814A94C @ =gUnknown_0203A3D0
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814A926
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814A950 @ =gSprites
	adds r0, r1
	adds r2, r0, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_0814A926:
	ldr r1, _0814A954 @ =gUnknown_0203A3D1
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814A946
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814A950 @ =gSprites
	adds r0, r1
	adds r2, r0, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_0814A946:
	pop {r0}
	bx r0
	.align 2, 0
_0814A94C: .4byte gUnknown_0203A3D0
_0814A950: .4byte gSprites
_0814A954: .4byte gUnknown_0203A3D1
	thumb_func_end sub_814A904

	thumb_func_start sub_814A958
sub_814A958: @ 814A958
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	ldr r4, _0814A9C4 @ =gSubspriteTable_203A380
	ldr r2, _0814A9C8 @ =0x0000ffff
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0
	movs r1, 0
	movs r1, 0x2
	str r0, [r4]
	str r1, [r4, 0x4]
	strh r2, [r4]
	adds r4, 0x8
	movs r7, 0x1
	movs r2, 0x1
	ldr r1, [sp]
	subs r0, r1, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _0814AA3A
	ldr r0, _0814A9CC @ =gUnknown_0842F780
	mov r12, r0
	mov r8, r1
	movs r1, 0x8
	negs r1, r1
	mov r10, r1
	ldr r5, _0814A9D0 @ =gUnknown_0842F788
	mov r9, r5
_0814A99E:
	lsls r0, r3, 16
	asrs r3, r0, 16
	cmp r3, 0x1F
	ble _0814A9D4
	mov r6, r12
	ldr r0, [r6]
	ldr r1, [r6, 0x4]
	str r0, [r4]
	str r1, [r4, 0x4]
	strh r2, [r4]
	lsls r0, r2, 16
	movs r1, 0x80
	lsls r1, 14
	adds r0, r1
	lsrs r2, r0, 16
	ldr r3, [sp]
	lsls r5, r3, 16
	b _0814AA20
	.align 2, 0
_0814A9C4: .4byte gSubspriteTable_203A380
_0814A9C8: .4byte 0x0000ffff
_0814A9CC: .4byte gUnknown_0842F780
_0814A9D0: .4byte gUnknown_0842F788
_0814A9D4:
	ldr r6, [sp]
	lsls r5, r6, 16
	mov r0, r8
	cmp r0, 0x27
	ble _0814AA0A
	cmp r3, 0x8
	ble _0814AA0A
	mov r6, r12
	ldr r0, [r6]
	ldr r1, [r6, 0x4]
	str r0, [r4]
	str r1, [r4, 0x4]
	lsls r1, r2, 16
	asrs r1, 16
	adds r2, r1, 0
	subs r2, 0x20
	adds r0, r3, 0
	mov r6, r10
	ands r0, r6
	adds r2, r0
	strh r2, [r4]
	movs r0, 0x18
	ands r0, r3
	adds r1, r0
	lsls r1, 16
	lsrs r2, r1, 16
	b _0814AA20
_0814AA0A:
	mov r3, r9
	ldr r0, [r3]
	ldr r1, [r3, 0x4]
	str r0, [r4]
	str r1, [r4, 0x4]
	strh r2, [r4]
	lsls r0, r2, 16
	movs r6, 0x80
	lsls r6, 12
	adds r0, r6
	lsrs r2, r0, 16
_0814AA20:
	adds r4, 0x8
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	asrs r1, r5, 16
	lsls r0, r2, 16
	asrs r0, 16
	subs r1, r0
	lsls r1, 16
	lsrs r3, r1, 16
	asrs r1, 16
	cmp r1, 0x7
	bgt _0814A99E
_0814AA3A:
	ldr r5, _0814AAA8 @ =gUnknown_0842F790
	ldr r0, [r5]
	ldr r1, [r5, 0x4]
	str r0, [r4]
	str r1, [r4, 0x4]
	lsls r1, r2, 16
	asrs r1, 16
	subs r1, 0x7
	lsls r0, r3, 16
	asrs r0, 16
	adds r0, r1
	strh r0, [r4]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r6, _0814AAAC @ =gUnknown_0203A3D0
	ldrb r0, [r6]
	cmp r0, 0x40
	beq _0814AA78
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AAB0 @ =gSprites
	adds r2, r0, r1
	lsls r1, r7, 3
	ldr r0, _0814AAB4 @ =gSubspriteTables_842F5C0
	adds r1, r0
	adds r0, r2, 0
	bl SetSubspriteTables
_0814AA78:
	ldr r1, _0814AAB8 @ =gUnknown_0203A3D1
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AA98
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AAB0 @ =gSprites
	adds r2, r0, r1
	lsls r1, r7, 3
	ldr r0, _0814AAB4 @ =gSubspriteTables_842F5C0
	adds r1, r0
	adds r0, r2, 0
	bl SetSubspriteTables
_0814AA98:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814AAA8: .4byte gUnknown_0842F790
_0814AAAC: .4byte gUnknown_0203A3D0
_0814AAB0: .4byte gSprites
_0814AAB4: .4byte gSubspriteTables_842F5C0
_0814AAB8: .4byte gUnknown_0203A3D1
	thumb_func_end sub_814A958

	thumb_func_start sub_814AABC
sub_814AABC: @ 814AABC
	push {lr}
	adds r2, r0, 0
	ldr r1, _0814AAEC @ =gUnknown_0203A3D0
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AAD4
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0814AAF0 @ =gSprites
	adds r1, r0
	str r2, [r1, 0x1C]
_0814AAD4:
	ldr r1, _0814AAF4 @ =gUnknown_0203A3D1
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AAE8
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0814AAF0 @ =gSprites
	adds r1, r0
	str r2, [r1, 0x1C]
_0814AAE8:
	pop {r0}
	bx r0
	.align 2, 0
_0814AAEC: .4byte gUnknown_0203A3D0
_0814AAF0: .4byte gSprites
_0814AAF4: .4byte gUnknown_0203A3D1
	thumb_func_end sub_814AABC

	thumb_func_start sub_814AAF8
sub_814AAF8: @ 814AAF8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r0, 16
	mov r12, r0
	ldr r1, _0814AB70 @ =gUnknown_0203A3D0
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AB66
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AB74 @ =gSprites
	adds r4, r0, r1
	ldr r0, [r4, 0x14]
	ldrh r1, [r0, 0x2]
	ldr r0, _0814AB78 @ =0x0000ffff
	cmp r1, r0
	bne _0814AB66
	movs r2, 0
	movs r3, 0xF
	movs r1, 0
	ldrb r5, [r4, 0x5]
	ldr r0, _0814AB7C @ =gUnknown_0842F140
	mov r8, r0
	ldr r7, _0814AB80 @ =gPlttBufferUnfaded
	movs r6, 0xF
_0814AB32:
	lsls r0, r1, 1
	adds r0, r7
	ldrh r0, [r0]
	cmp r0, r12
	bne _0814AB46
	lsrs r0, r1, 4
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r1, 0
	ands r3, r6
_0814AB46:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xFF
	bls _0814AB32
	lsls r2, 4
	movs r1, 0xF
	adds r0, r1, 0
	ands r0, r5
	orrs r0, r2
	strb r0, [r4, 0x5]
	ands r3, r1
	lsls r0, r3, 3
	add r0, r8
	bl RequestSpriteSheetCopy
_0814AB66:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814AB70: .4byte gUnknown_0203A3D0
_0814AB74: .4byte gSprites
_0814AB78: .4byte 0x0000ffff
_0814AB7C: .4byte gUnknown_0842F140
_0814AB80: .4byte gPlttBufferUnfaded
	thumb_func_end sub_814AAF8

	thumb_func_start sub_814AB84
sub_814AB84: @ 814AB84
	push {r4,r5,lr}
	ldr r5, _0814ABCC @ =gUnknown_0203A3D1
	ldrb r0, [r5]
	cmp r0, 0x40
	beq _0814ABC4
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0814ABD0 @ =gSprites
	adds r4, r0
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	movs r0, 0x40
	strb r0, [r5]
	ldr r0, _0814ABD4 @ =gUnknown_0203A3D3
	ldrb r0, [r0]
	cmp r0, 0
	bne _0814ABBC
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _0814ABD8 @ =0x00007fff
	ands r0, r1
	strh r0, [r2]
_0814ABBC:
	ldr r0, _0814ABDC @ =0x0400004b
	ldr r1, _0814ABE0 @ =gUnknown_0203A3D4
	ldrb r1, [r1]
	strb r1, [r0]
_0814ABC4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814ABCC: .4byte gUnknown_0203A3D1
_0814ABD0: .4byte gSprites
_0814ABD4: .4byte gUnknown_0203A3D3
_0814ABD8: .4byte 0x00007fff
_0814ABDC: .4byte 0x0400004b
_0814ABE0: .4byte gUnknown_0203A3D4
	thumb_func_end sub_814AB84

	thumb_func_start unref_sub_814ABE4
unref_sub_814ABE4: @ 814ABE4
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _0814AC40 @ =gUnknown_0842F5BC
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _0814AC44 @ =gSubspriteTable_203A380
	movs r2, 0x28
	bl CpuSet
	ldr r1, _0814AC48 @ =gUnknown_0203A3D0
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AC18
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AC4C @ =gSprites
	adds r2, r0, r1
	lsls r1, r4, 3
	ldr r0, _0814AC50 @ =gUnknown_0842F758
	adds r1, r0
	adds r0, r2, 0
	bl SetSubspriteTables
_0814AC18:
	ldr r1, _0814AC54 @ =gUnknown_0203A3D1
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AC38
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AC4C @ =gSprites
	adds r2, r0, r1
	lsls r1, r4, 3
	ldr r0, _0814AC50 @ =gUnknown_0842F758
	adds r1, r0
	adds r0, r2, 0
	bl SetSubspriteTables
_0814AC38:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814AC40: .4byte gUnknown_0842F5BC
_0814AC44: .4byte gSubspriteTable_203A380
_0814AC48: .4byte gUnknown_0203A3D0
_0814AC4C: .4byte gSprites
_0814AC50: .4byte gUnknown_0842F758
_0814AC54: .4byte gUnknown_0203A3D1
	thumb_func_end unref_sub_814ABE4

	thumb_func_start CreateBlendedOutlineCursor
CreateBlendedOutlineCursor: @ 814AC58
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r4, [sp, 0x1C]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 16
	lsrs r6, r3, 16
	lsls r4, 24
	lsrs r4, 24
	mov r9, r4
	ldr r0, _0814ACF8 @ =gUnknown_0203A3D2
	ldrb r0, [r0]
	cmp r0, 0x40
	beq _0814AC86
	bl sub_814AD44
_0814AC86:
	movs r4, 0x1
	ldr r0, _0814ACFC @ =0x0000ffff
	cmp r5, r0
	bne _0814ACAC
	ldr r1, _0814AD00 @ =gUnknown_0203A360
	movs r0, 0xF
	ands r0, r7
	lsls r0, 1
	adds r0, r1
	strh r6, [r0]
	ldr r0, _0814AD04 @ =gUnknown_0842F248
	bl LoadSpritePalette
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0814ACAC
	ldr r5, _0814AD08 @ =0x0000fff1
	movs r4, 0
_0814ACAC:
	movs r6, 0xF
	adds r0, r7, 0
	ands r0, r6
	lsls r0, 3
	ldr r1, _0814AD0C @ =gUnknown_0842F1C0
	adds r0, r1
	bl LoadSpriteSheetDeferred
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 3
	ldr r1, _0814AD10 @ =gSpriteTemplate_842F298
	adds r0, r1
	movs r1, 0
	movs r2, 0xA0
	mov r3, r8
	bl CreateSprite
	ldr r1, _0814ACF8 @ =gUnknown_0203A3D2
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0814AD2A
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AD14 @ =gSprites
	adds r4, r0, r1
	ldr r0, _0814ACFC @ =0x0000ffff
	cmp r5, r0
	bne _0814AD18
	ldrb r1, [r4, 0x5]
	adds r0, r6, 0
	ands r0, r1
	strb r0, [r4, 0x5]
	b _0814AD2A
	.align 2, 0
_0814ACF8: .4byte gUnknown_0203A3D2
_0814ACFC: .4byte 0x0000ffff
_0814AD00: .4byte gUnknown_0203A360
_0814AD04: .4byte gUnknown_0842F248
_0814AD08: .4byte 0x0000fff1
_0814AD0C: .4byte gUnknown_0842F1C0
_0814AD10: .4byte gSpriteTemplate_842F298
_0814AD14: .4byte gSprites
_0814AD18:
	adds r0, r5, 0
	bl IndexOfSpritePaletteTag
	lsls r0, 4
	ldrb r2, [r4, 0x5]
	adds r1, r6, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x5]
_0814AD2A:
	mov r0, r9
	bl sub_814ADF4
	ldr r0, _0814AD40 @ =gUnknown_0203A3D2
	ldrb r0, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0814AD40: .4byte gUnknown_0203A3D2
	thumb_func_end CreateBlendedOutlineCursor

	thumb_func_start sub_814AD44
sub_814AD44: @ 814AD44
	push {r4,lr}
	ldr r4, _0814AD70 @ =gUnknown_0203A3D2
	ldrb r0, [r4]
	cmp r0, 0x40
	beq _0814AD68
	ldr r0, _0814AD74 @ =gUnknown_0842F1C0
	bl LoadTilesForSpriteSheet
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AD78 @ =gSprites
	adds r0, r1
	bl DestroySpriteAndFreeResources
	movs r0, 0x40
	strb r0, [r4]
_0814AD68:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814AD70: .4byte gUnknown_0203A3D2
_0814AD74: .4byte gUnknown_0842F1C0
_0814AD78: .4byte gSprites
	thumb_func_end sub_814AD44

	thumb_func_start sub_814AD7C
sub_814AD7C: @ 814AD7C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r1, _0814ADC0 @ =gUnknown_0203A3D2
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814ADB8
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814ADC4 @ =gSprites
	adds r2, r0, r1
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	adds r0, r2, 0
	adds r0, 0x28
	movs r1, 0
	strb r1, [r0]
	adds r0, 0x1
	strb r1, [r0]
	strh r5, [r2, 0x20]
	strh r4, [r2, 0x22]
_0814ADB8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814ADC0: .4byte gUnknown_0203A3D2
_0814ADC4: .4byte gSprites
	thumb_func_end sub_814AD7C

	thumb_func_start sub_814ADC8
sub_814ADC8: @ 814ADC8
	push {lr}
	ldr r1, _0814ADEC @ =gUnknown_0203A3D2
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814ADE8
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814ADF0 @ =gSprites
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_0814ADE8:
	pop {r0}
	bx r0
	.align 2, 0
_0814ADEC: .4byte gUnknown_0203A3D2
_0814ADF0: .4byte gSprites
	thumb_func_end sub_814ADC8

	thumb_func_start sub_814ADF4
sub_814ADF4: @ 814ADF4
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x12
	bls _0814AE00
	movs r2, 0
_0814AE00:
	ldr r1, _0814AE24 @ =gUnknown_0203A3D2
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AE1E
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AE28 @ =gSprites
	adds r0, r1
	lsls r1, r2, 3
	ldr r2, _0814AE2C @ =gUnknown_0842F6C0
	adds r1, r2
	bl SetSubspriteTables
_0814AE1E:
	pop {r0}
	bx r0
	.align 2, 0
_0814AE24: .4byte gUnknown_0203A3D2
_0814AE28: .4byte gSprites
_0814AE2C: .4byte gUnknown_0842F6C0
	thumb_func_end sub_814ADF4

	.align 2, 0 @ Don't pad with nop.
