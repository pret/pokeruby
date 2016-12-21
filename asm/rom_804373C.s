	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_804373C
sub_804373C: @ 804373C
	movs r0, 0x9
	bx lr
	thumb_func_end sub_804373C

	thumb_func_start sub_8043740
sub_8043740: @ 8043740
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r7, r1, 0
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	movs r3, 0
	movs r2, 0
_0804375C:
	lsls r0, r3, 24
	asrs r0, 24
	mov r3, sp
	adds r1, r3, r0
	strb r2, [r1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _0804375C
	movs r3, 0x3
	movs r0, 0x1
	negs r0, r0
	mov r9, r0
	mov r8, sp
_0804377C:
	lsls r0, r5, 16
	asrs r6, r0, 16
	cmp r6, 0
	ble _080437AA
	lsls r4, r3, 24
	asrs r4, 24
	mov r1, sp
	adds r5, r1, r4
	adds r0, r6, 0
	movs r1, 0xA
	bl __modsi3
	strb r0, [r5]
	adds r0, r6, 0
	movs r1, 0xA
	bl __divsi3
	lsls r0, 16
	lsrs r5, r0, 16
	subs r4, 0x1
	lsls r4, 24
	lsrs r3, r4, 24
	b _0804377C
_080437AA:
	lsls r1, r3, 24
	asrs r0, r1, 24
	cmp r0, r9
	ble _080437CE
	movs r4, 0xFF
	movs r3, 0x1
	negs r3, r3
_080437B8:
	asrs r2, r1, 24
	mov r5, sp
	adds r1, r5, r2
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	subs r2, 0x1
	lsls r1, r2, 24
	asrs r0, r1, 24
	cmp r0, r3
	bgt _080437B8
_080437CE:
	mov r1, r8
	ldrb r0, [r1, 0x3]
	cmp r0, 0xFF
	bne _080437DA
	movs r0, 0
	strb r0, [r1, 0x3]
_080437DA:
	mov r2, r10
	cmp r2, 0
	bne _0804386A
	movs r3, 0
	movs r1, 0
	movs r6, 0xFC
	lsls r6, 8
	movs r5, 0x1E
	mov r12, r5
_080437EC:
	lsls r1, 24
	asrs r2, r1, 24
	mov r0, sp
	adds r5, r0, r2
	ldrb r0, [r5]
	mov r8, r1
	cmp r0, 0xFF
	bne _08043822
	lsls r1, r2, 1
	adds r1, r7
	ldrh r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	mov r2, r12
	orrs r0, r2
	strh r0, [r1]
	lsls r3, 24
	asrs r1, r3, 23
	adds r1, r7
	adds r1, 0x40
	ldrh r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	mov r5, r12
	orrs r0, r5
	strh r0, [r1]
	b _08043852
_08043822:
	lsls r2, 1
	adds r2, r7
	ldrh r0, [r2]
	adds r1, r6, 0
	ands r1, r0
	ldrb r0, [r5]
	adds r0, 0x14
	orrs r1, r0
	strh r1, [r2]
	lsls r4, r3, 24
	asrs r3, r4, 24
	lsls r2, r3, 1
	adds r2, r7
	adds r2, 0x40
	ldrh r0, [r2]
	adds r1, r6, 0
	ands r1, r0
	mov r5, sp
	adds r0, r5, r3
	ldrb r0, [r0]
	adds r0, 0x34
	orrs r1, r0
	strh r1, [r2]
	adds r3, r4, 0
_08043852:
	movs r0, 0x80
	lsls r0, 17
	add r0, r8
	lsrs r1, r0, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r3, r2
	lsrs r3, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _080437EC
	b _080438CE
_0804386A:
	movs r3, 0
	movs r4, 0xFC
	lsls r4, 8
	movs r6, 0x1E
_08043872:
	lsls r1, r3, 24
	asrs r2, r1, 24
	mov r3, sp
	adds r5, r3, r2
	ldrb r0, [r5]
	adds r3, r1, 0
	cmp r0, 0xFF
	bne _0804389E
	lsls r1, r2, 1
	adds r1, r7
	ldrh r2, [r1]
	adds r0, r4, 0
	ands r0, r2
	orrs r0, r6
	strh r0, [r1]
	adds r1, 0x40
	ldrh r2, [r1]
	adds r0, r4, 0
	ands r0, r2
	orrs r0, r6
	strh r0, [r1]
	b _080438C0
_0804389E:
	lsls r2, 1
	adds r2, r7
	ldrh r0, [r2]
	adds r1, r4, 0
	ands r1, r0
	ldrb r0, [r5]
	adds r0, 0x14
	orrs r1, r0
	strh r1, [r2]
	adds r2, 0x40
	ldrh r0, [r2]
	adds r1, r4, 0
	ands r1, r0
	ldrb r0, [r5]
	adds r0, 0x34
	orrs r1, r0
	strh r1, [r2]
_080438C0:
	movs r5, 0x80
	lsls r5, 17
	adds r0, r3, r5
	lsrs r3, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _08043872
_080438CE:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8043740

	thumb_func_start unref_sub_80438E0
unref_sub_80438E0: @ 80438E0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	adds r5, r2, 0
	lsls r4, 16
	lsrs r4, 16
	movs r1, 0x1E
	strh r1, [r5, 0x8]
	lsls r0, 16
	asrs r0, 16
	adds r1, r5, 0
	movs r2, 0
	bl sub_8043740
	lsls r4, 16
	asrs r4, 16
	adds r5, 0xA
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_8043740
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_80438E0

	thumb_func_start battle_make_oam_normal_battle
battle_make_oam_normal_battle: @ 8043914
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	movs r0, 0
	str r0, [sp]
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _08043A28
	mov r0, r10
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080439AC
	ldr r4, _0804399C @ =gSpriteTemplate_820A4EC
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r4, _080439A0 @ =gSprites
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0x1]
	movs r3, 0x3F
	adds r0, r3, 0
	ands r0, r2
	strb r0, [r1, 0x1]
	lsls r2, r7, 4
	adds r2, r7
	lsls r2, 2
	adds r2, r4
	ldrb r0, [r2, 0x1]
	ands r3, r0
	strb r3, [r2, 0x1]
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x40
	ldr r4, _080439A4 @ =0x000003ff
	adds r0, r4, 0
	ands r1, r0
	ldr r0, _080439A8 @ =0xfffffc00
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
	b _080439F2
	.align 2, 0
_0804399C: .4byte gSpriteTemplate_820A4EC
_080439A0: .4byte gSprites
_080439A4: .4byte 0x000003ff
_080439A8: .4byte 0xfffffc00
_080439AC:
	ldr r4, _08043A14 @ =gSpriteTemplate_820A51C
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08043A18 @ =gSprites
	lsls r2, r7, 4
	adds r2, r7
	lsls r2, 2
	adds r2, r0
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x20
	ldr r5, _08043A1C @ =0x000003ff
	adds r0, r5, 0
	ands r1, r0
	ldr r0, _08043A20 @ =0xfffffc00
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
	movs r0, 0x2
	str r0, [sp]
_080439F2:
	ldr r2, _08043A18 @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r2
	strh r7, [r0, 0x6]
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	adds r1, r0, r2
	strh r6, [r1, 0x38]
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _08043A24 @ =sub_8043D5C
	str r1, [r0]
	b _08043B50
	.align 2, 0
_08043A14: .4byte gSpriteTemplate_820A51C
_08043A18: .4byte gSprites
_08043A1C: .4byte 0x000003ff
_08043A20: .4byte 0xfffffc00
_08043A24: .4byte sub_8043D5C
_08043A28:
	mov r0, r10
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08043ACC
	mov r0, r10
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 25
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldr r4, _08043AB8 @ =gSpriteTemplate_820A4EC
	adds r0, r4
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	mov r0, r10
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 25
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r4, _08043ABC @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r4
	strh r7, [r0, 0x6]
	lsls r2, r7, 4
	adds r2, r7
	lsls r2, 2
	adds r3, r2, r4
	strh r6, [r3, 0x38]
	ldrh r1, [r3, 0x4]
	mov r8, r1
	mov r5, r8
	lsls r1, r5, 22
	lsrs r1, 22
	adds r1, 0x20
	ldr r5, _08043AC0 @ =0x000003ff
	adds r0, r5, 0
	ands r1, r0
	ldr r0, _08043AC4 @ =0xfffffc00
	mov r5, r8
	ands r0, r5
	orrs r0, r1
	strh r0, [r3, 0x4]
	adds r4, 0x1C
	adds r2, r4
	ldr r0, _08043AC8 @ =sub_8043D5C
	str r0, [r2]
	movs r0, 0x1
	b _08043B4E
	.align 2, 0
_08043AB8: .4byte gSpriteTemplate_820A4EC
_08043ABC: .4byte gSprites
_08043AC0: .4byte 0x000003ff
_08043AC4: .4byte 0xfffffc00
_08043AC8: .4byte sub_8043D5C
_08043ACC:
	mov r0, r10
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 25
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldr r4, _08043C14 @ =gSpriteTemplate_820A51C
	adds r0, r4
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	mov r0, r10
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 25
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r4, _08043C18 @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r4
	strh r7, [r0, 0x6]
	lsls r2, r7, 4
	adds r2, r7
	lsls r2, 2
	adds r3, r2, r4
	strh r6, [r3, 0x38]
	ldrh r1, [r3, 0x4]
	mov r8, r1
	mov r5, r8
	lsls r1, r5, 22
	lsrs r1, 22
	adds r1, 0x20
	ldr r5, _08043C1C @ =0x000003ff
	adds r0, r5, 0
	ands r1, r0
	ldr r0, _08043C20 @ =0xfffffc00
	mov r5, r8
	ands r0, r5
	orrs r0, r1
	strh r0, [r3, 0x4]
	adds r4, 0x1C
	adds r2, r4
	ldr r0, _08043C24 @ =sub_8043D5C
	str r0, [r2]
	movs r0, 0x2
_08043B4E:
	str r0, [sp]
_08043B50:
	ldr r0, _08043C28 @ =gUnknown_02024A72
	add r0, r10
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldr r1, _08043C2C @ =gSpriteTemplate_820A56C
	adds r0, r1
	movs r1, 0x8C
	movs r2, 0x3C
	movs r3, 0
	bl CreateSpriteAtEnd
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	ldr r1, _08043C18 @ =gSprites
	mov r8, r1
	add r4, r8
	mov r0, r10
	bl battle_side_get_owner
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 21
	ldr r0, _08043C30 @ =gSubspriteTables_820A684
	adds r1, r0
	adds r0, r4, 0
	bl SetSubspriteTables
	adds r2, r4, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r2, 0x4
	mov r9, r2
	mov r1, r9
	orrs r0, r1
	strb r0, [r4, 0x5]
	movs r0, 0x1
	bl sub_8043CDC
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 17
	ldr r2, _08043C34 @ =0x06010000
	adds r1, r2
	ldr r2, _08043C38 @ =REG_BG0HOFS
	bl CpuSet
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	add r0, r8
	strh r5, [r0, 0x38]
	mov r2, r10
	strh r2, [r0, 0x3A]
	adds r0, 0x3E
	ldrb r1, [r0]
	mov r5, r9
	orrs r1, r5
	strb r1, [r0]
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	add r0, r8
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r5
	strb r1, [r0]
	strh r6, [r4, 0x38]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x3A]
	adds r4, 0x3E
	ldrb r0, [r4]
	orrs r0, r5
	strb r0, [r4]
	adds r0, r6, 0
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08043C14: .4byte gSpriteTemplate_820A51C
_08043C18: .4byte gSprites
_08043C1C: .4byte 0x000003ff
_08043C20: .4byte 0xfffffc00
_08043C24: .4byte sub_8043D5C
_08043C28: .4byte gUnknown_02024A72
_08043C2C: .4byte gSpriteTemplate_820A56C
_08043C30: .4byte gSubspriteTables_820A684
_08043C34: .4byte 0x06010000
_08043C38: .4byte REG_BG0HOFS
	thumb_func_end battle_make_oam_normal_battle

	thumb_func_start battle_make_oam_safari_battle
battle_make_oam_safari_battle: @ 8043C3C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r4, _08043CC8 @ =gSpriteTemplate_820A54C
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSprite
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08043CCC @ =gSprites
	mov r9, r1
	lsls r4, r6, 4
	adds r4, r6
	lsls r4, 2
	add r4, r9
	ldrb r3, [r4, 0x1]
	movs r2, 0x3F
	adds r1, r2, 0
	ands r1, r3
	strb r1, [r4, 0x1]
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	mov r7, r9
	adds r5, r3, r7
	ldrb r1, [r5, 0x1]
	ands r2, r1
	strb r2, [r5, 0x1]
	ldrh r1, [r5, 0x4]
	mov r8, r1
	mov r7, r8
	lsls r2, r7, 22
	lsrs r2, 22
	adds r2, 0x40
	ldr r7, _08043CD0 @ =0x000003ff
	adds r1, r7, 0
	ands r2, r1
	ldr r1, _08043CD4 @ =0xfffffc00
	mov r7, r8
	ands r1, r7
	orrs r1, r2
	strh r1, [r5, 0x4]
	strh r0, [r4, 0x6]
	strh r6, [r5, 0x38]
	movs r0, 0x1C
	add r9, r0
	add r3, r9
	ldr r0, _08043CD8 @ =sub_8043D5C
	str r0, [r3]
	adds r0, r6, 0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08043CC8: .4byte gSpriteTemplate_820A54C
_08043CCC: .4byte gSprites
_08043CD0: .4byte 0x000003ff
_08043CD4: .4byte 0xfffffc00
_08043CD8: .4byte sub_8043D5C
	thumb_func_end battle_make_oam_safari_battle

	thumb_func_start sub_8043CDC
sub_8043CDC: @ 8043CDC
	lsls r0, 24
	lsrs r0, 19
	ldr r1, _08043CE8 @ =gUnknown_08D1216C
	adds r0, r1
	bx lr
	.align 2, 0
_08043CE8: .4byte gUnknown_08D1216C
	thumb_func_end sub_8043CDC

	thumb_func_start sub_8043CEC
sub_8043CEC: @ 8043CEC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x38]
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08043D1C
	cmp r0, 0x1
	bgt _08043D30
	cmp r0, 0
	bne _08043D30
	ldr r2, _08043D18 @ =gSprites
	lsls r3, r5, 4
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x20]
	adds r0, 0x10
	b _08043D3E
	.align 2, 0
_08043D18: .4byte gSprites
_08043D1C:
	ldr r2, _08043D2C @ =gSprites
	lsls r3, r5, 4
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x20]
	adds r0, 0x10
	b _08043D3E
	.align 2, 0
_08043D2C: .4byte gSprites
_08043D30:
	ldr r2, _08043D58 @ =gSprites
	lsls r3, r5, 4
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x20]
	adds r0, 0x8
_08043D3E:
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x22]
	strh r0, [r4, 0x22]
	adds r0, r3, r5
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x24]
	strh r1, [r4, 0x24]
	ldrh r0, [r0, 0x26]
	strh r0, [r4, 0x26]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08043D58: .4byte gSprites
	thumb_func_end sub_8043CEC

	thumb_func_start sub_8043D5C
sub_8043D5C: @ 8043D5C
	ldrh r1, [r0, 0x38]
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08043D80 @ =gSprites
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x20]
	adds r1, 0x40
	strh r1, [r0, 0x20]
	ldrh r1, [r2, 0x22]
	strh r1, [r0, 0x22]
	ldrh r1, [r2, 0x24]
	strh r1, [r0, 0x24]
	ldrh r1, [r2, 0x26]
	strh r1, [r0, 0x26]
	bx lr
	.align 2, 0
_08043D80: .4byte gSprites
	thumb_func_end sub_8043D5C

	thumb_func_start sub_8043D84
sub_8043D84: @ 8043D84
	push {r4,r5,lr}
	ldr r5, [sp, 0xC]
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 2
	ldr r0, _08043DA8 @ =0x02017850
	adds r4, r0
	strb r1, [r4]
	str r2, [r4, 0x4]
	str r3, [r4, 0x8]
	str r5, [r4, 0xC]
	ldr r0, _08043DAC @ =0xffff8000
	str r0, [r4, 0x10]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08043DA8: .4byte 0x02017850
_08043DAC: .4byte 0xffff8000
	thumb_func_end sub_8043D84

	thumb_func_start sub_8043DB0
sub_8043DB0: @ 8043DB0
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08043DF8 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	adds r1, r2, 0
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r1]
	movs r0, 0x38
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	ldrh r1, [r2, 0x6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08043DF8: .4byte gSprites
	thumb_func_end sub_8043DB0

	thumb_func_start sub_8043DFC
sub_8043DFC: @ 8043DFC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08043E4C @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r5
	adds r4, r2, 0
	adds r4, 0x3E
	ldrb r1, [r4]
	movs r3, 0x5
	negs r3, r3
	adds r0, r3, 0
	ands r0, r1
	strb r0, [r4]
	movs r0, 0x38
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r4, [r0]
	adds r1, r3, 0
	ands r1, r4
	strb r1, [r0]
	ldrh r1, [r2, 0x6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r3, r1
	strb r3, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08043E4C: .4byte gSprites
	thumb_func_end sub_8043DFC

	thumb_func_start sub_8043E50
sub_8043E50: @ 8043E50
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08043E6C @ =gSprites
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r3, r4
	strh r1, [r3, 0x20]
	strh r2, [r3, 0x22]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08043E6C: .4byte gSprites
	thumb_func_end sub_8043E50

	thumb_func_start unref_sub_8043E70
unref_sub_8043E70: @ 8043E70
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08043EAC @ =gSprites
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r4, r5
	ldrh r1, [r4, 0x6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	movs r0, 0x38
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	adds r0, r4, 0
	bl DestroySprite
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08043EAC: .4byte gSprites
	thumb_func_end unref_sub_8043E70

	thumb_func_start nullsub_11
nullsub_11: @ 8043EB0
	bx lr
	thumb_func_end nullsub_11

	thumb_func_start sub_8043EB4
sub_8043EB4: @ 8043EB4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0
	ldr r1, _08043F38 @ =gUnknown_02024A68
	mov r8, r1
	ldrb r2, [r1]
	cmp r6, r2
	bge _08043F2C
	ldr r1, _08043F3C @ =gSprites
	mov r12, r1
	movs r1, 0x3
	ands r0, r1
	lsls r5, r0, 2
	movs r7, 0xD
	negs r7, r7
	ldr r2, _08043F40 @ =gUnknown_03004340
	mov r9, r2
_08043EDE:
	mov r1, r9
	adds r0, r6, r1
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r12
	ldrb r4, [r1, 0x6]
	ldrh r3, [r1, 0x38]
	lsls r3, 24
	lsrs r3, 24
	ldrb r2, [r1, 0x5]
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r5
	strb r0, [r1, 0x5]
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	add r1, r12
	ldrb r2, [r1, 0x5]
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r5
	strb r0, [r1, 0x5]
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	add r1, r12
	ldrb r2, [r1, 0x5]
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r5
	strb r0, [r1, 0x5]
	adds r6, 0x1
	mov r2, r8
	ldrb r2, [r2]
	cmp r6, r2
	blt _08043EDE
_08043F2C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043F38: .4byte gUnknown_02024A68
_08043F3C: .4byte gSprites
_08043F40: .4byte gUnknown_03004340
	thumb_func_end sub_8043EB4

	thumb_func_start sub_8043F44
sub_8043F44: @ 8043F44
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	movs r4, 0
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _08043F70
	adds r0, r6, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08043F6A
	movs r5, 0x2C
	movs r4, 0x1E
	b _08043FA8
_08043F6A:
	movs r5, 0x9E
	movs r4, 0x58
	b _08043FA8
_08043F70:
	adds r0, r6, 0
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08043F9E
	cmp r0, 0x1
	bgt _08043F88
	cmp r0, 0
	beq _08043F92
	b _08043FA8
_08043F88:
	cmp r0, 0x2
	beq _08043F98
	cmp r0, 0x3
	beq _08043FA4
	b _08043FA8
_08043F92:
	movs r5, 0x9F
	movs r4, 0x4D
	b _08043FA8
_08043F98:
	movs r5, 0xAB
	movs r4, 0x66
	b _08043FA8
_08043F9E:
	movs r5, 0x2C
	movs r4, 0x13
	b _08043FA8
_08043FA4:
	movs r5, 0x20
	movs r4, 0x2C
_08043FA8:
	ldr r0, _08043FBC @ =gUnknown_03004340
	adds r0, r6, r0
	ldrb r0, [r0]
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_8043E50
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08043FBC: .4byte gUnknown_03004340
	thumb_func_end sub_8043F44

	thumb_func_start sub_8043FC0
sub_8043FC0: @ 8043FC0
	push {r4-r7,lr}
	sub sp, 0x20
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r1, _08044000 @ =gUnknown_0820A81C
	mov r0, sp
	movs r2, 0x1E
	bl memcpy
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _08044010
	ldr r1, _08044004 @ =gSprites
	lsls r4, r5, 4
	adds r0, r4, r5
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	ldr r7, _08044008 @ =gUnknown_0820A80C
	cmp r0, 0
	bne _0804402E
	ldr r7, _0804400C @ =gUnknown_0820A804
	b _0804402E
	.align 2, 0
_08044000: .4byte gUnknown_0820A81C
_08044004: .4byte gSprites
_08044008: .4byte gUnknown_0820A80C
_0804400C: .4byte gUnknown_0820A804
_08044010:
	ldr r1, _08044040 @ =gSprites
	lsls r4, r5, 4
	adds r0, r4, r5
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	ldr r7, _08044044 @ =gUnknown_0820A80C
	cmp r0, 0
	bne _0804402E
	ldr r7, _08044048 @ =gUnknown_0820A814
_0804402E:
	mov r3, sp
	adds r3, 0x6
	cmp r6, 0x64
	bne _0804404C
	adds r0, r3, 0
	movs r1, 0x64
	movs r2, 0
	movs r3, 0x3
	b _0804408C
	.align 2, 0
_08044040: .4byte gSprites
_08044044: .4byte gUnknown_0820A80C
_08044048: .4byte gUnknown_0820A814
_0804404C:
	movs r1, 0xFC
	strb r1, [r3]
	mov r3, sp
	adds r3, 0x7
	movs r0, 0x11
	strb r0, [r3]
	adds r3, 0x1
	movs r0, 0x1
	strb r0, [r3]
	adds r3, 0x1
	strb r1, [r3]
	adds r3, 0x1
	movs r2, 0x14
	strb r2, [r3]
	adds r3, 0x1
	movs r0, 0x4
	strb r0, [r3]
	adds r3, 0x1
	movs r0, 0xF0
	strb r0, [r3]
	adds r3, 0x1
	strb r1, [r3]
	adds r3, 0x1
	strb r2, [r3]
	adds r3, 0x1
	movs r0, 0
	strb r0, [r3]
	adds r3, 0x1
	adds r0, r3, 0
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0x2
_0804408C:
	bl ConvertIntToDecimalStringN
	adds r3, r0, 0
	movs r0, 0xFC
	strb r0, [r3]
	adds r3, 0x1
	movs r0, 0x13
	strb r0, [r3]
	adds r3, 0x1
	movs r0, 0xF
	strb r0, [r3]
	movs r0, 0xFF
	strb r0, [r3, 0x1]
	movs r0, 0x80
	lsls r0, 18
	mov r1, sp
	bl sub_80034D4
	ldr r1, _080440E0 @ =gSprites
	adds r0, r4, r5
	lsls r0, 2
	adds r6, r0, r1
	ldr r5, _080440E4 @ =0x02000020
	movs r4, 0x2
_080440BC:
	ldrh r0, [r6, 0x4]
	lsls r0, 22
	lsrs r0, 17
	ldm r7!, {r1}
	adds r1, r0
	adds r0, r5, 0
	ldr r2, _080440E8 @ =REG_BG0CNT
	bl CpuSet
	adds r5, 0x40
	subs r4, 0x1
	cmp r4, 0
	bne _080440BC
	add sp, 0x20
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080440E0: .4byte gSprites
_080440E4: .4byte 0x02000020
_080440E8: .4byte REG_BG0CNT
	thumb_func_end sub_8043FC0

	thumb_func_start sub_80440EC
sub_80440EC: @ 80440EC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	ldr r1, _08044144 @ =gUnknown_0820A864
	mov r0, sp
	movs r2, 0x14
	bl memcpy
	ldr r1, _08044148 @ =gSprites
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	adds r4, r0, r1
	movs r0, 0x3A
	ldrsh r5, [r4, r0]
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08044136
	lsls r0, r5, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0804414C
_08044136:
	lsls r1, r6, 16
	asrs r1, 16
	adds r0, r7, 0
	mov r2, r8
	bl sub_8044210
	b _080441F0
	.align 2, 0
_08044144: .4byte gUnknown_0820A864
_08044148: .4byte gSprites
_0804414C:
	mov r5, sp
	adds r5, 0x6
	mov r0, r8
	cmp r0, 0
	bne _08044190
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	ldr r4, _08044188 @ =gUnknown_0820A848
	cmp r0, 0
	bne _0804416A
	ldr r4, _0804418C @ =gUnknown_0820A83C
_0804416A:
	movs r0, 0x3
	mov r8, r0
	lsls r1, r6, 16
	asrs r1, 16
	adds r0, r5, 0
	movs r2, 0x13
	movs r3, 0x1
	bl sub_8003504
	adds r5, r0, 0
	movs r0, 0xBA
	strb r0, [r5]
	movs r0, 0xFF
	strb r0, [r5, 0x1]
	b _080441B6
	.align 2, 0
_08044188: .4byte gUnknown_0820A848
_0804418C: .4byte gUnknown_0820A83C
_08044190:
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	ldr r4, _080441FC @ =gUnknown_0820A85C
	cmp r0, 0
	bne _080441A4
	ldr r4, _08044200 @ =gUnknown_0820A854
_080441A4:
	movs r0, 0x2
	mov r8, r0
	lsls r1, r6, 16
	asrs r1, 16
	adds r0, r5, 0
	movs r2, 0xF
	movs r3, 0x1
	bl sub_8003504
_080441B6:
	movs r0, 0x80
	lsls r0, 18
	mov r1, sp
	bl sub_80034D4
	mov r0, r8
	cmp r0, 0
	beq _080441F0
	ldr r1, _08044204 @ =gSprites
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	adds r6, r0, r1
	adds r7, r4, 0
	ldr r5, _08044208 @ =0x02000020
	mov r4, r8
_080441D6:
	ldrh r0, [r6, 0x4]
	lsls r0, 22
	lsrs r0, 17
	ldm r7!, {r1}
	adds r1, r0
	adds r0, r5, 0
	ldr r2, _0804420C @ =REG_BG0CNT
	bl CpuSet
	adds r5, 0x40
	subs r4, 0x1
	cmp r4, 0
	bne _080441D6
_080441F0:
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080441FC: .4byte gUnknown_0820A85C
_08044200: .4byte gUnknown_0820A854
_08044204: .4byte gSprites
_08044208: .4byte 0x02000020
_0804420C: .4byte REG_BG0CNT
	thumb_func_end sub_80440EC

	thumb_func_start sub_8044210
sub_8044210: @ 8044210
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 16
	lsrs r6, r1, 16
	mov r9, r6
	lsls r2, 24
	lsrs r7, r2, 24
	ldr r1, _0804427C @ =gUnknown_0820A89C
	mov r0, sp
	movs r2, 0x14
	bl memcpy
	ldr r1, _08044280 @ =gSprites
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	mov r8, r0
	movs r1, 0x3A
	ldrsh r4, [r0, r1]
	lsls r0, r4, 2
	ldr r1, _08044284 @ =0x02017800
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08044312
	mov r2, sp
	adds r2, 0x6
	cmp r7, 0
	bne _0804428C
	ldr r7, _08044288 @ =gUnknown_0820A87C
	movs r0, 0x6
	mov r10, r0
	lsls r1, r6, 16
	asrs r1, 16
	adds r0, r2, 0
	movs r2, 0x2B
	movs r3, 0x1
	bl sub_8003504
	adds r2, r0, 0
	movs r0, 0xBA
	strb r0, [r2]
	movs r0, 0xFF
	strb r0, [r2, 0x1]
	b _080442CE
	.align 2, 0
_0804427C: .4byte gUnknown_0820A89C
_08044280: .4byte gSprites
_08044284: .4byte 0x02017800
_08044288: .4byte gUnknown_0820A87C
_0804428C:
	ldr r7, _08044324 @ =gUnknown_0820A894
	movs r1, 0x2
	mov r10, r1
	mov r0, r9
	lsls r1, r0, 16
	asrs r1, 16
	adds r0, r2, 0
	movs r2, 0xF
	movs r3, 0x1
	bl sub_8003504
	lsls r0, r4, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080442CE
	movs r0, 0x74
	bl sub_8043CDC
	mov r2, r8
	ldrh r1, [r2, 0x4]
	lsls r1, 22
	lsrs r1, 17
	movs r2, 0xD0
	lsls r2, 3
	adds r1, r2
	ldr r2, _08044328 @ =0x06010000
	adds r1, r2
	ldr r2, _0804432C @ =REG_BG0CNT
	bl CpuSet
_080442CE:
	ldr r6, _08044330 @ =gSprites
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r6
	movs r1, 0x38
	ldrsh r4, [r0, r1]
	movs r0, 0x80
	lsls r0, 18
	mov r1, sp
	bl sub_80034D4
	mov r2, r10
	cmp r2, 0
	beq _08044312
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r6, r0, r6
	ldr r5, _08044334 @ =0x02000020
	mov r4, r10
_080442F8:
	ldrh r0, [r6, 0x4]
	lsls r0, 22
	lsrs r0, 17
	ldm r7!, {r1}
	adds r1, r0
	adds r0, r5, 0
	ldr r2, _0804432C @ =REG_BG0CNT
	bl CpuSet
	adds r5, 0x40
	subs r4, 0x1
	cmp r4, 0
	bne _080442F8
_08044312:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044324: .4byte gUnknown_0820A894
_08044328: .4byte 0x06010000
_0804432C: .4byte REG_BG0CNT
_08044330: .4byte gSprites
_08044334: .4byte 0x02000020
	thumb_func_end sub_8044210

	thumb_func_start sub_8044338
sub_8044338: @ 8044338
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x14]
	ldr r1, _080443CC @ =gUnknown_0820A864
	mov r0, sp
	movs r2, 0x14
	bl memcpy
	ldr r1, _080443D0 @ =gSprites
	ldr r2, [sp, 0x14]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 7
	ldr r3, _080443D4 @ =0x02000520
	adds r6, r1, r3
	movs r0, 0x5
	mov r8, r0
	adds r0, r4, 0
	bl GetNature
	lsls r0, 24
	mov r4, sp
	adds r4, 0x6
	ldr r1, _080443D8 @ =gNatureNames
	lsrs r0, 22
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl StringCopy
	adds r0, r6, 0
	mov r1, sp
	bl sub_80034D4
	movs r7, 0x6
	movs r5, 0
	mov r1, sp
	adds r1, 0x9
	str r1, [sp, 0x1C]
_080443AA:
	mov r2, sp
	adds r0, r2, r7
	ldrb r1, [r0]
	adds r0, r1, 0
	subs r0, 0x37
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bls _080443C8
	adds r0, r1, 0
	adds r0, 0x79
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _080443DC
_080443C8:
	movs r0, 0x2C
	b _080443FA
	.align 2, 0
_080443CC: .4byte gUnknown_0820A864
_080443D0: .4byte gSprites
_080443D4: .4byte 0x02000520
_080443D8: .4byte gNatureNames
_080443DC:
	adds r0, r1, 0
	subs r0, 0x4B
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080443F4
	adds r0, r1, 0
	adds r0, 0x65
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080443F8
_080443F4:
	movs r0, 0x2D
	b _080443FA
_080443F8:
	movs r0, 0x2B
_080443FA:
	bl sub_8043CDC
	lsls r1, r5, 6
	adds r1, r6, r1
	ldr r2, _080444F8 @ =REG_BG0CNT
	bl CpuSet
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, 0x1
	cmp r5, r8
	bcc _080443AA
	movs r7, 0x1
	ldr r3, [sp, 0x14]
	lsls r3, 4
	str r3, [sp, 0x18]
	movs r0, 0x1
	add r0, r8
	mov r9, r0
	cmp r7, r9
	bge _08044486
	ldr r1, _080444FC @ =gSprites
	ldr r2, _080444F8 @ =REG_BG0CNT
	mov r10, r2
	ldr r2, [sp, 0x14]
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r1
	mov r8, r0
_08044436:
	mov r3, r8
	ldrh r0, [r3, 0x4]
	lsls r0, 22
	lsrs r0, 22
	adds r5, r7, 0
	cmp r7, 0
	bge _08044446
	adds r5, r7, 0x7
_08044446:
	asrs r5, 3
	lsls r4, r5, 3
	subs r4, r7, r4
	adds r0, r4
	lsls r5, 6
	adds r0, r5
	lsls r0, 5
	ldr r2, _08044500 @ =0x06010000
	adds r1, r0, r2
	adds r0, r6, 0
	mov r2, r10
	bl CpuSet
	adds r6, 0x20
	mov r3, r8
	ldrh r0, [r3, 0x4]
	lsls r0, 22
	lsrs r0, 22
	adds r4, 0x8
	adds r0, r4
	adds r0, r5
	lsls r0, 5
	ldr r2, _08044500 @ =0x06010000
	adds r1, r0, r2
	adds r0, r6, 0
	mov r2, r10
	bl CpuSet
	adds r6, 0x20
	adds r7, 0x1
	cmp r7, r9
	blt _08044436
_08044486:
	ldr r6, _080444FC @ =gSprites
	ldr r3, [sp, 0x18]
	ldr r1, [sp, 0x14]
	adds r0, r3, r1
	lsls r0, 2
	adds r0, r6
	ldrh r5, [r0, 0x38]
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _08044504 @ =0x02000000
	ldr r2, _08044508 @ =0x00016089
	adds r0, r4, r2
	ldrb r1, [r0]
	mov r0, sp
	adds r0, 0x6
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r3, _0804450C @ =0x00016088
	adds r4, r3
	ldrb r1, [r4]
	ldr r0, [sp, 0x1C]
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	mov r1, sp
	movs r0, 0
	strb r0, [r1, 0x5]
	movs r0, 0xBA
	strb r0, [r1, 0x8]
	movs r0, 0x80
	lsls r0, 18
	bl sub_80034D4
	movs r7, 0
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r5, r0, r6
	ldr r4, _08044510 @ =0x02000020
_080444DA:
	cmp r7, 0x1
	bgt _08044514
	ldrh r1, [r5, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r0, r7, 0x2
	adds r1, r0
	lsls r1, 5
	ldr r0, _08044500 @ =0x06010000
	adds r1, r0
	adds r0, r4, 0
	ldr r2, _080444F8 @ =REG_BG0CNT
	bl CpuSet
	b _0804452A
	.align 2, 0
_080444F8: .4byte REG_BG0CNT
_080444FC: .4byte gSprites
_08044500: .4byte 0x06010000
_08044504: .4byte 0x02000000
_08044508: .4byte 0x00016089
_0804450C: .4byte 0x00016088
_08044510: .4byte 0x02000020
_08044514:
	ldrh r1, [r5, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r1, r7, r1
	lsls r1, 5
	ldr r2, _08044544 @ =0x060100c0
	adds r1, r2
	adds r0, r4, 0
	ldr r2, _08044548 @ =REG_BG0CNT
	bl CpuSet
_0804452A:
	adds r4, 0x40
	adds r7, 0x1
	cmp r7, 0x4
	ble _080444DA
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044544: .4byte 0x060100c0
_08044548: .4byte REG_BG0CNT
	thumb_func_end sub_8044338

	thumb_func_start sub_804454C
sub_804454C: @ 804454C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r0, 0
	mov r8, r0
	ldr r0, _0804466C @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r8, r0
	blt _08044566
	b _080447E4
_08044566:
	ldr r1, _08044670 @ =gSprites
	mov r9, r1
	movs r2, 0x64
	mov r10, r2
	ldr r7, _08044674 @ =gUnknown_02024A6A
_08044570:
	ldr r0, _08044678 @ =gUnknown_03004340
	mov r6, r8
	adds r5, r6, r0
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	mov r1, r9
	adds r1, 0x1C
	adds r0, r1
	ldr r1, [r0]
	ldr r0, _0804467C @ =SpriteCallbackDummy
	cmp r1, r0
	beq _0804458E
	b _080447D4
_0804458E:
	lsls r0, r6, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080445A2
	b _080447D4
_080445A2:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _080445BA
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080445BA
	b _080447D4
_080445BA:
	mov r0, r8
	lsls r3, r0, 2
	ldr r0, _08044680 @ =0x02017800
	adds r3, r0
	ldr r0, [r3]
	lsls r0, 27
	lsrs r0, 31
	movs r2, 0x1
	eors r2, r0
	lsls r2, 4
	ldrb r0, [r3]
	movs r6, 0x11
	negs r6, r6
	adds r1, r6, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
	ldr r0, [r3]
	lsls r0, 27
	lsrs r6, r0, 31
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080446DC
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _080445FA
	b _080447D4
_080445FA:
	ldr r0, _08044684 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _0804460C
	b _080447D4
_0804460C:
	cmp r6, 0x1
	bne _08044694
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldrh r0, [r0, 0x38]
	lsls r0, 24
	lsrs r1, r0, 24
	str r2, [sp]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldrh r1, [r0, 0x4]
	lsls r1, 22
	lsrs r1, 17
	ldr r0, _08044688 @ =0x06010000
	adds r1, r0
	mov r0, sp
	ldr r2, _0804468C @ =0x05000040
	bl CpuSet
	ldrb r4, [r5]
	ldrh r0, [r7]
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	ldr r2, _08044690 @ =gPlayerParty
	adds r0, r2
	movs r1, 0x39
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	movs r2, 0
	bl sub_8044210
	ldrb r4, [r5]
	ldrh r0, [r7]
	mov r6, r10
	muls r6, r0
	adds r0, r6, 0
	ldr r1, _08044690 @ =gPlayerParty
	b _08044766
	.align 2, 0
_0804466C: .4byte gUnknown_02024A68
_08044670: .4byte gSprites
_08044674: .4byte gUnknown_02024A6A
_08044678: .4byte gUnknown_03004340
_0804467C: .4byte SpriteCallbackDummy
_08044680: .4byte 0x02017800
_08044684: .4byte gUnknown_020239F8
_08044688: .4byte 0x06010000
_0804468C: .4byte 0x05000040
_08044690: .4byte gPlayerParty
_08044694:
	ldrb r0, [r5]
	bl draw_status_ailment_maybe
	ldrb r0, [r5]
	ldrh r1, [r7]
	mov r2, r10
	muls r2, r1
	adds r1, r2, 0
	ldr r6, _080446D0 @ =gPlayerParty
	adds r1, r6
	movs r2, 0x5
	bl sub_8045A5C
	movs r0, 0x75
	bl sub_8043CDC
	ldrb r2, [r5]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r9
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 17
	ldr r2, _080446D4 @ =0x06010680
	adds r1, r2
	ldr r2, _080446D8 @ =REG_BG0CNT
	bl CpuSet
	b _080447BE
	.align 2, 0
_080446D0: .4byte gPlayerParty
_080446D4: .4byte 0x06010680
_080446D8: .4byte REG_BG0CNT
_080446DC:
	cmp r6, 0x1
	bne _0804478C
	ldr r0, _08044704 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _0804470C
	ldrb r0, [r5]
	ldrh r1, [r7]
	mov r6, r10
	muls r6, r1
	adds r1, r6, 0
	ldr r2, _08044708 @ =gEnemyParty
	adds r1, r2
	bl sub_8044338
	b _080447BE
	.align 2, 0
_08044704: .4byte gUnknown_020239F8
_08044708: .4byte gEnemyParty
_0804470C:
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldrh r0, [r0, 0x38]
	lsls r0, 24
	lsrs r1, r0, 24
	str r2, [sp]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldrh r1, [r0, 0x4]
	lsls r1, 22
	lsrs r1, 17
	ldr r6, _08044780 @ =0x06010000
	adds r1, r6
	mov r0, sp
	ldr r2, _08044784 @ =0x05000040
	bl CpuSet
	ldrb r4, [r5]
	ldrh r0, [r7]
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	ldr r2, _08044788 @ =gEnemyParty
	adds r0, r2
	movs r1, 0x39
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	movs r2, 0
	bl sub_8044210
	ldrb r4, [r5]
	ldrh r0, [r7]
	mov r6, r10
	muls r6, r0
	adds r0, r6, 0
	ldr r1, _08044788 @ =gEnemyParty
_08044766:
	adds r0, r1
	movs r1, 0x3A
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	movs r2, 0x1
	bl sub_8044210
	b _080447BE
	.align 2, 0
_08044780: .4byte 0x06010000
_08044784: .4byte 0x05000040
_08044788: .4byte gEnemyParty
_0804478C:
	ldrb r0, [r5]
	bl draw_status_ailment_maybe
	ldrb r0, [r5]
	ldrh r1, [r7]
	movs r6, 0x64
	muls r1, r6
	ldr r4, _080447F4 @ =gEnemyParty
	adds r1, r4
	movs r2, 0x5
	bl sub_8045A5C
	ldr r0, _080447F8 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080447BE
	ldrb r0, [r5]
	ldrh r1, [r7]
	muls r1, r6
	adds r1, r4
	movs r2, 0x4
	bl sub_8045A5C
_080447BE:
	ldr r0, _080447FC @ =gUnknown_03004340
	add r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldrh r1, [r0, 0x3C]
	movs r2, 0x1
	eors r1, r2
	strh r1, [r0, 0x3C]
_080447D4:
	adds r7, 0x2
	movs r2, 0x1
	add r8, r2
	ldr r0, _08044800 @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r8, r0
	bge _080447E4
	b _08044570
_080447E4:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080447F4: .4byte gEnemyParty
_080447F8: .4byte gUnknown_020239F8
_080447FC: .4byte gUnknown_03004340
_08044800: .4byte gUnknown_02024A68
	thumb_func_end sub_804454C

	thumb_func_start sub_8044804
sub_8044804: @ 8044804
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	str r1, [sp, 0xC]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
	lsls r2, 24
	lsrs r2, 24
	adds r4, r2, 0
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x10]
	cmp r4, 0
	beq _08044834
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _08044878
_08044834:
	ldr r0, [sp, 0x8]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08044854
	movs r7, 0
	movs r1, 0x88
	movs r2, 0x60
	movs r0, 0x64
	mov r8, r0
	ldr r5, _08044850 @ =0x0000fffb
	b _08044884
	.align 2, 0
_08044850: .4byte 0x0000fffb
_08044854:
	movs r7, 0x1
	cmp r4, 0
	beq _08044864
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _0804486A
_08044864:
	movs r1, 0x68
	movs r2, 0x28
	b _0804486E
_0804486A:
	movs r1, 0x68
	movs r2, 0x10
_0804486E:
	ldr r3, _08044874 @ =0x0000ff9c
	mov r8, r3
	b _08044882
	.align 2, 0
_08044874: .4byte 0x0000ff9c
_08044878:
	movs r7, 0x1
	movs r1, 0x68
	movs r2, 0x28
	ldr r5, _08044930 @ =0x0000ff9c
	mov r8, r5
_08044882:
	movs r5, 0x5
_08044884:
	movs r6, 0
	str r6, [sp, 0x14]
	lsls r4, r7, 3
	ldr r0, _08044934 @ =gUnknown_0820A754
	mov r10, r0
	lsls r3, r7, 1
	mov r9, r3
	lsls r1, 16
	str r1, [sp, 0x20]
	lsls r2, 16
	str r2, [sp, 0x24]
	ldr r2, _08044938 @ =0x0000ffff
	ldr r1, [sp, 0xC]
	movs r6, 0x5
_080448A0:
	ldrh r0, [r1]
	cmp r0, r2
	beq _080448B4
	ldr r3, [sp, 0x14]
	lsls r0, r3, 24
	movs r3, 0x80
	lsls r3, 17
	adds r0, r3
	lsrs r0, 24
	str r0, [sp, 0x14]
_080448B4:
	adds r1, 0x8
	subs r6, 0x1
	cmp r6, 0
	bge _080448A0
	mov r6, r10
	adds r0, r4, r6
	bl LoadCompressedObjectPic
	ldr r0, _0804493C @ =gUnknown_0820A784
	adds r0, r4, r0
	bl LoadSpriteSheet
	ldr r0, _08044940 @ =gUnknown_0820A764
	adds r0, r4, r0
	bl LoadSpritePalette
	ldr r0, _08044944 @ =gUnknown_0820A774
	adds r0, r4, r0
	bl LoadSpritePalette
	mov r1, r9
	adds r0, r1, r7
	lsls r0, 3
	ldr r1, _08044948 @ =gSpriteTemplate_820A7A4
	adds r0, r1
	ldr r2, [sp, 0x20]
	asrs r1, r2, 16
	ldr r3, [sp, 0x24]
	asrs r2, r3, 16
	movs r3, 0xA
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x18]
	lsls r0, 4
	ldr r6, [sp, 0x18]
	adds r0, r6
	lsls r0, 2
	ldr r1, _0804494C @ =gSprites
	adds r4, r0, r1
	ldr r1, _08044950 @ =gSubspriteTables_820A6E4
	adds r0, r4, 0
	bl SetSubspriteTables
	mov r0, r8
	strh r0, [r4, 0x24]
	strh r5, [r4, 0x2E]
	cmp r7, 0
	beq _08044954
	ldrh r0, [r4, 0x20]
	subs r0, 0x60
	strh r0, [r4, 0x20]
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r4, 0x3]
	b _0804495A
	.align 2, 0
_08044930: .4byte 0x0000ff9c
_08044934: .4byte gUnknown_0820A754
_08044938: .4byte 0x0000ffff
_0804493C: .4byte gUnknown_0820A784
_08044940: .4byte gUnknown_0820A764
_08044944: .4byte gUnknown_0820A774
_08044948: .4byte gSpriteTemplate_820A7A4
_0804494C: .4byte gSprites
_08044950: .4byte gSubspriteTables_820A6E4
_08044954:
	ldrh r0, [r4, 0x20]
	adds r0, 0x60
	strh r0, [r4, 0x20]
_0804495A:
	movs r6, 0
	ldr r1, _08044A04 @ =gSprites
	mov r10, r1
	mov r4, sp
	mov r2, r9
	adds r0, r2, r7
	lsls r0, 3
	str r0, [sp, 0x1C]
	movs r3, 0xA
	mov r9, r3
	mov r8, r6
_08044970:
	ldr r0, _08044A08 @ =gSpriteTemplate_820A7D4
	ldr r5, [sp, 0x24]
	ldr r1, _08044A0C @ =0xfffc0000
	adds r2, r5, r1
	ldr r3, [sp, 0x1C]
	adds r0, r3, r0
	ldr r5, [sp, 0x20]
	asrs r1, r5, 16
	asrs r2, 16
	movs r3, 0x9
	bl CreateSpriteAtEnd
	strb r0, [r4]
	ldr r0, [sp, 0x10]
	cmp r0, 0
	bne _080449A0
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r2, _08044A10 @ =gSprites + 0x1C
	adds r1, r2
	ldr r0, _08044A14 @ =sub_8045180
	str r0, [r1]
_080449A0:
	ldr r5, _08044A04 @ =gSprites
	cmp r7, 0
	bne _080449BE
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	strh r7, [r0, 0x24]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	strh r7, [r0, 0x26]
_080449BE:
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0
	mov r3, sp
	ldrh r3, [r3, 0x18]
	strh r3, [r0, 0x2E]
	cmp r7, 0
	bne _08044A18
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrh r0, [r1, 0x20]
	adds r0, 0x18
	add r0, r8
	strh r0, [r1, 0x20]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r9
	strh r1, [r0, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x78
	b _08044A56
	.align 2, 0
_08044A04: .4byte gSprites
_08044A08: .4byte gSpriteTemplate_820A7D4
_08044A0C: .4byte 0xfffc0000
_08044A10: .4byte gSprites + 0x1C
_08044A14: .4byte sub_8045180
_08044A18:
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r5
	ldrh r3, [r2, 0x20]
	subs r3, 0x18
	movs r1, 0x5
	subs r1, r6
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 1
	subs r3, r0
	strh r3, [r2, 0x20]
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r5
	movs r1, 0x6
	subs r1, r6
	lsls r0, r1, 3
	subs r0, r1
	adds r0, 0xA
	strh r0, [r2, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08044AC4 @ =0x0000ff88
_08044A56:
	strh r1, [r0, 0x24]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r7, [r0, 0x32]
	adds r4, 0x1
	movs r2, 0x7
	add r9, r2
	movs r3, 0xA
	add r8, r3
	adds r6, 0x1
	cmp r6, 0x5
	bgt _08044A76
	b _08044970
_08044A76:
	ldr r0, [sp, 0x8]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08044B5E
	movs r6, 0
	ldr r5, _08044AC8 @ =gUnknown_020239F8
	mov r10, r5
	ldr r0, _08044ACC @ =0x0000ffff
	mov r9, r0
	ldr r7, _08044AD0 @ =gSprites
	ldr r1, _08044AD4 @ =0x000003ff
	mov r12, r1
	ldr r2, _08044AD8 @ =0xfffffc00
	mov r8, r2
	mov r4, sp
	ldr r5, [sp, 0xC]
_08044A9A:
	mov r3, r10
	ldrh r1, [r3]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08044ADC
	ldrh r0, [r5]
	cmp r0, r9
	beq _08044AE6
	cmp r0, 0
	bne _08044B2E
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x3
	b _08044B46
	.align 2, 0
_08044AC4: .4byte 0x0000ff88
_08044AC8: .4byte gUnknown_020239F8
_08044ACC: .4byte 0x0000ffff
_08044AD0: .4byte gSprites
_08044AD4: .4byte 0x000003ff
_08044AD8: .4byte 0xfffffc00
_08044ADC:
	ldr r1, [sp, 0x14]
	lsls r0, r1, 24
	asrs r0, 24
	cmp r6, r0
	blt _08044B14
_08044AE6:
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x1
	mov r0, r12
	ands r1, r0
	mov r0, r8
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	movs r1, 0x1
	strh r1, [r0, 0x3C]
	b _08044B52
_08044B14:
	ldrh r0, [r5]
	cmp r0, 0
	bne _08044B2E
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x3
	b _08044B46
_08044B2E:
	ldr r0, [r5, 0x4]
	cmp r0, 0
	beq _08044B52
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x2
_08044B46:
	mov r0, r12
	ands r1, r0
	mov r0, r8
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
_08044B52:
	adds r4, 0x1
	adds r5, 0x8
	adds r6, 0x1
	cmp r6, 0x5
	ble _08044A9A
	b _08044C38
_08044B5E:
	movs r6, 0
	ldr r1, _08044BA4 @ =gUnknown_020239F8
	mov r10, r1
	ldr r2, _08044BA8 @ =0x0000ffff
	mov r9, r2
	ldr r7, _08044BAC @ =gSprites
	ldr r3, _08044BB0 @ =0x000003ff
	mov r12, r3
	ldr r5, _08044BB4 @ =0xfffffc00
	mov r8, r5
	ldr r5, [sp, 0xC]
	mov r4, sp
	adds r4, 0x5
_08044B78:
	mov r0, r10
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08044BB8
	ldrh r0, [r5]
	cmp r0, r9
	beq _08044BC2
	cmp r0, 0
	bne _08044C0A
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x3
	b _08044C22
	.align 2, 0
_08044BA4: .4byte gUnknown_020239F8
_08044BA8: .4byte 0x0000ffff
_08044BAC: .4byte gSprites
_08044BB0: .4byte 0x000003ff
_08044BB4: .4byte 0xfffffc00
_08044BB8:
	ldr r1, [sp, 0x14]
	lsls r0, r1, 24
	asrs r0, 24
	cmp r6, r0
	blt _08044BF0
_08044BC2:
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x1
	mov r0, r12
	ands r1, r0
	mov r0, r8
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	movs r1, 0x1
	strh r1, [r0, 0x3C]
	b _08044C2E
_08044BF0:
	ldrh r0, [r5]
	cmp r0, 0
	bne _08044C0A
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x3
	b _08044C22
_08044C0A:
	ldr r0, [r5, 0x4]
	cmp r0, 0
	beq _08044C2E
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x2
_08044C22:
	mov r0, r12
	ands r1, r0
	mov r0, r8
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
_08044C2E:
	subs r4, 0x1
	adds r5, 0x8
	adds r6, 0x1
	cmp r6, 0x5
	ble _08044B78
_08044C38:
	ldr r0, _08044C98 @ =TaskDummy
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _08044C9C @ =gTasks
	lsls r3, r4, 2
	adds r1, r3, r4
	lsls r1, 3
	adds r0, r1, r2
	mov r5, sp
	ldrh r5, [r5, 0x8]
	strh r5, [r0, 0x8]
	mov r6, sp
	ldrh r6, [r6, 0x18]
	strh r6, [r0, 0xA]
	movs r6, 0
	adds r0, r2, 0
	adds r0, 0xE
	adds r1, r0
_08044C62:
	mov r5, sp
	adds r0, r5, r6
	ldrb r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	adds r6, 0x1
	cmp r6, 0x5
	ble _08044C62
	adds r0, r3, r4
	lsls r0, 3
	adds r0, r2
	ldrh r6, [r5, 0x10]
	strh r6, [r0, 0x1C]
	movs r0, 0x72
	movs r1, 0
	bl PlaySE12WithPanning
	adds r0, r4, 0
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08044C98: .4byte TaskDummy
_08044C9C: .4byte gTasks
	thumb_func_end sub_8044804

	thumb_func_start sub_8044CA0
sub_8044CA0: @ 8044CA0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r2, _08044DB4 @ =gTasks
	lsls r3, r0, 2
	adds r1, r3, r0
	lsls r1, 3
	adds r0, r1, r2
	ldrb r4, [r0, 0x1C]
	mov r9, r4
	ldrb r4, [r0, 0xA]
	mov r10, r4
	ldrb r0, [r0, 0x8]
	str r0, [sp, 0x8]
	movs r5, 0
	adds r7, r2, 0
	ldr r0, _08044DB8 @ =gSprites
	mov r12, r0
	str r3, [sp, 0xC]
	adds r0, r7, 0
	adds r0, 0xE
	adds r2, r1, r0
_08044CD8:
	mov r4, sp
	adds r1, r4, r5
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, 0x2
	adds r5, 0x1
	cmp r5, 0x5
	ble _08044CD8
	ldr r1, _08044DBC @ =REG_BLDCNT
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x10
	strh r0, [r1]
	ldr r0, [sp, 0xC]
	add r0, r8
	lsls r0, 3
	adds r0, r7
	movs r1, 0x10
	strh r1, [r0, 0x26]
	movs r5, 0
	mov r4, r10
	lsls r4, 4
	str r4, [sp, 0x10]
	ldr r4, _08044DB8 @ =gSprites
	movs r6, 0xD
	negs r6, r6
	movs r3, 0x4
_08044D14:
	mov r1, sp
	adds r0, r1, r5
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0x1]
	adds r0, r6, 0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x1]
	adds r5, 0x1
	cmp r5, 0x5
	ble _08044D14
	ldr r2, [sp, 0x10]
	add r2, r10
	lsls r2, 2
	add r2, r12
	ldrb r1, [r2, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x1]
	mov r2, r9
	cmp r2, 0
	bne _08044D50
	b _08044E54
_08044D50:
	movs r5, 0
	mov r6, r12
	mov r9, r5
	adds r3, r6, 0
	adds r3, 0x1C
	mov r4, sp
	movs r7, 0
_08044D5E:
	ldr r0, [sp, 0x8]
	str r3, [sp, 0x14]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r3, [sp, 0x14]
	cmp r2, 0
	beq _08044DC4
	movs r0, 0x5
	subs r0, r5
	mov r1, sp
	adds r2, r1, r0
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r7, [r0, 0x30]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	mov r1, r9
	strh r1, [r0, 0x34]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	mov r1, r9
	strh r1, [r0, 0x36]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, _08044DC0 @ =sub_8045110
	str r1, [r0]
	ldr r2, _08044DB8 @ =gSprites
	mov r12, r2
	b _08044DFA
	.align 2, 0
_08044DB4: .4byte gTasks
_08044DB8: .4byte gSprites
_08044DBC: .4byte REG_BLDCNT
_08044DC0: .4byte sub_8045110
_08044DC4:
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r7, [r0, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r2, [r0, 0x34]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r2, [r0, 0x36]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, _08044E3C @ =sub_8045110
	str r1, [r0]
	ldr r0, _08044E40 @ =gSprites
	mov r12, r0
_08044DFA:
	adds r4, 0x1
	adds r7, 0x7
	adds r5, 0x1
	cmp r5, 0x5
	ble _08044D5E
	ldr r3, [sp, 0x10]
	add r3, r10
	lsls r3, 2
	mov r1, r12
	adds r0, r3, r1
	movs r2, 0x2E
	ldrsh r1, [r0, r2]
	lsrs r2, r1, 31
	adds r1, r2
	asrs r1, 1
	movs r2, 0
	strh r1, [r0, 0x2E]
	strh r2, [r0, 0x30]
	mov r1, r12
	adds r1, 0x1C
	adds r3, r1
	ldr r1, _08044E44 @ =sub_8045048
	str r1, [r3]
	ldr r1, _08044E48 @ =gSubspriteTables_820A6EC
	bl SetSubspriteTables
	ldr r1, _08044E4C @ =gTasks
	ldr r0, [sp, 0xC]
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _08044E50 @ =sub_8044E74
	b _08044E5E
	.align 2, 0
_08044E3C: .4byte sub_8045110
_08044E40: .4byte gSprites
_08044E44: .4byte sub_8045048
_08044E48: .4byte gSubspriteTables_820A6EC
_08044E4C: .4byte gTasks
_08044E50: .4byte sub_8044E74
_08044E54:
	ldr r0, [sp, 0xC]
	add r0, r8
	lsls r0, 3
	adds r0, r7
	ldr r1, _08044E70 @ =sub_8044F70
_08044E5E:
	str r1, [r0]
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044E70: .4byte sub_8044F70
	thumb_func_end sub_8044CA0

	thumb_func_start sub_8044E74
sub_8044E74: @ 8044E74
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08044EC0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r3, r1, r2
	ldrh r0, [r3, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r3, 0x1E]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08044EAE
	ldrh r0, [r3, 0x26]
	subs r2, r0, 0x1
	strh r2, [r3, 0x26]
	lsls r0, r2, 16
	cmp r0, 0
	blt _08044EBA
	ldr r1, _08044EC4 @ =REG_BLDALPHA
	movs r0, 0x10
	subs r0, r2
	lsls r0, 8
	orrs r2, r0
	strh r2, [r1]
_08044EAE:
	movs r1, 0x26
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _08044EBA
	ldr r0, _08044EC8 @ =sub_8044ECC
	str r0, [r3]
_08044EBA:
	pop {r0}
	bx r0
	.align 2, 0
_08044EC0: .4byte gTasks
_08044EC4: .4byte REG_BLDALPHA
_08044EC8: .4byte sub_8044ECC
	thumb_func_end sub_8044E74

	thumb_func_start sub_8044ECC
sub_8044ECC: @ 8044ECC
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r6, _08044F44 @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r4, r0, 3
	adds r1, r4, r6
	ldrh r0, [r1, 0x26]
	subs r0, 0x1
	movs r5, 0
	strh r0, [r1, 0x26]
	lsls r0, 16
	asrs r2, r0, 16
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	bne _08044F4C
	ldrb r3, [r1, 0xA]
	adds r0, r6, 0
	adds r0, 0xE
	adds r2, r4, r0
_08044EFA:
	mov r0, sp
	adds r1, r0, r5
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, 0x2
	adds r5, 0x1
	cmp r5, 0x5
	ble _08044EFA
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	ldr r4, _08044F48 @ =gSprites
	adds r0, r4
	bl DestroySpriteAndFreeResources
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySpriteAndFreeResources
	movs r5, 0x1
_08044F2A:
	mov r1, sp
	adds r0, r1, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	adds r5, 0x1
	cmp r5, 0x5
	ble _08044F2A
	b _08044F62
	.align 2, 0
_08044F44: .4byte gTasks
_08044F48: .4byte gSprites
_08044F4C:
	movs r0, 0x3
	negs r0, r0
	cmp r2, r0
	bne _08044F62
	ldr r0, _08044F6C @ =REG_BLDCNT
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, r3, 0
	bl DestroyTask
_08044F62:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08044F6C: .4byte REG_BLDCNT
	thumb_func_end sub_8044ECC

	thumb_func_start sub_8044F70
sub_8044F70: @ 8044F70
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r7, _08044FA4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r6, r0, 3
	adds r3, r6, r7
	ldrh r0, [r3, 0x26]
	subs r2, r0, 0x1
	movs r5, 0
	strh r2, [r3, 0x26]
	lsls r0, r2, 16
	asrs r1, r0, 16
	cmp r1, 0
	blt _08044FAC
	ldr r1, _08044FA8 @ =REG_BLDALPHA
	movs r0, 0x10
	subs r0, r2
	lsls r0, 8
	orrs r2, r0
	strh r2, [r1]
	b _08045022
	.align 2, 0
_08044FA4: .4byte gTasks
_08044FA8: .4byte REG_BLDALPHA
_08044FAC:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0804500C
	ldrb r3, [r3, 0xA]
	movs r5, 0
	adds r0, r7, 0
	adds r0, 0xE
	adds r2, r6, r0
_08044FBE:
	mov r0, sp
	adds r1, r0, r5
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, 0x2
	adds r5, 0x1
	cmp r5, 0x5
	ble _08044FBE
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	ldr r4, _08045008 @ =gSprites
	adds r0, r4
	bl DestroySpriteAndFreeResources
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySpriteAndFreeResources
	movs r5, 0x1
_08044FEE:
	mov r1, sp
	adds r0, r1, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	adds r5, 0x1
	cmp r5, 0x5
	ble _08044FEE
	b _08045022
	.align 2, 0
_08045008: .4byte gSprites
_0804500C:
	movs r0, 0x3
	negs r0, r0
	cmp r1, r0
	bne _08045022
	ldr r0, _0804502C @ =REG_BLDCNT
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, r4, 0
	bl DestroyTask
_08045022:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804502C: .4byte REG_BLDCNT
	thumb_func_end sub_8044F70

	thumb_func_start sub_8045030
sub_8045030: @ 8045030
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x24]
	movs r3, 0x24
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _08045044
	ldrh r0, [r1, 0x2E]
	adds r0, r2, r0
	strh r0, [r1, 0x24]
_08045044:
	pop {r0}
	bx r0
	thumb_func_end sub_8045030

	thumb_func_start sub_8045048
sub_8045048: @ 8045048
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	adds r1, r0, 0
	adds r1, 0x20
	strh r1, [r2, 0x30]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	cmp r0, 0
	ble _08045066
	lsls r0, r1, 16
	asrs r0, 20
	ldrh r1, [r2, 0x24]
	adds r0, r1
	b _0804506E
_08045066:
	lsls r1, 16
	asrs r1, 20
	ldrh r0, [r2, 0x24]
	subs r0, r1
_0804506E:
	strh r0, [r2, 0x24]
	ldrh r1, [r2, 0x30]
	movs r0, 0xF
	ands r0, r1
	strh r0, [r2, 0x30]
	pop {r0}
	bx r0
	thumb_func_end sub_8045048

	thumb_func_start sub_804507C
sub_804507C: @ 804507C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _08045090
	subs r0, r1, 0x1
	strh r0, [r4, 0x30]
	b _08045106
_08045090:
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r3, r0, 24
	ldrh r2, [r4, 0x34]
	adds r0, r2, 0
	adds r0, 0x38
	lsls r1, r0, 16
	lsrs r2, r1, 16
	ldr r0, _080450C0 @ =0x0000fff0
	ands r2, r0
	strh r2, [r4, 0x34]
	cmp r3, 0
	beq _080450C4
	lsrs r0, r1, 20
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	lsls r0, 16
	cmp r0, 0
	ble _080450D4
	movs r0, 0
	strh r0, [r4, 0x24]
	b _080450D4
	.align 2, 0
_080450C0: .4byte 0x0000fff0
_080450C4:
	lsrs r1, 20
	ldrh r0, [r4, 0x24]
	subs r0, r1
	strh r0, [r4, 0x24]
	lsls r0, 16
	cmp r0, 0
	bge _080450D4
	strh r3, [r4, 0x24]
_080450D4:
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _08045106
	movs r1, 0x3F
	cmp r3, 0
	beq _080450E4
	movs r1, 0xC0
_080450E4:
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080450F8
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x74
	bl PlaySE2WithPanning
	b _08045102
_080450F8:
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x73
	bl PlaySE1WithPanning
_08045102:
	ldr r0, _0804510C @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_08045106:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804510C: .4byte SpriteCallbackDummy
	thumb_func_end sub_804507C

	thumb_func_start sub_8045110
sub_8045110: @ 8045110
	push {r4,lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x30]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r0, 0
	ble _08045124
	subs r0, r1, 0x1
	strh r0, [r3, 0x30]
	b _08045174
_08045124:
	ldrh r0, [r3, 0x32]
	lsls r0, 24
	ldrh r2, [r3, 0x34]
	adds r1, r2, 0
	adds r1, 0x38
	lsls r4, r1, 16
	lsrs r2, r4, 16
	ldr r1, _08045144 @ =0x0000fff0
	ands r2, r1
	strh r2, [r3, 0x34]
	cmp r0, 0
	beq _08045148
	lsrs r0, r4, 20
	ldrh r1, [r3, 0x24]
	adds r0, r1
	b _0804514E
	.align 2, 0
_08045144: .4byte 0x0000fff0
_08045148:
	lsrs r1, r4, 20
	ldrh r0, [r3, 0x24]
	subs r0, r1
_0804514E:
	strh r0, [r3, 0x24]
	movs r2, 0x24
	ldrsh r0, [r3, r2]
	movs r2, 0x20
	ldrsh r1, [r3, r2]
	adds r0, r1
	adds r0, 0x8
	movs r1, 0x80
	lsls r1, 1
	cmp r0, r1
	bls _08045174
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0804517C @ =SpriteCallbackDummy
	str r0, [r3, 0x1C]
_08045174:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804517C: .4byte SpriteCallbackDummy
	thumb_func_end sub_8045110

	thumb_func_start sub_8045180
sub_8045180: @ 8045180
	ldrh r2, [r0, 0x2E]
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _0804519C @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	ldrh r2, [r1, 0x24]
	strh r2, [r0, 0x24]
	ldrh r1, [r1, 0x26]
	strh r1, [r0, 0x26]
	bx lr
	.align 2, 0
_0804519C: .4byte gSprites
	thumb_func_end sub_8045180

	thumb_func_start sub_80451A0
sub_80451A0: @ 80451A0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	adds r7, r1, 0
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r4, _08045238 @ =gUnknown_020238CC
	ldr r1, _0804523C @ =gUnknown_0820A8B0
	adds r0, r4, 0
	bl StringCopy
	adds r0, r7, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	adds r4, 0x3
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy
	adds r5, r0, 0
	movs r1, 0xFC
	strb r1, [r5]
	movs r0, 0x3
	strb r0, [r5, 0x1]
	movs r0, 0x2
	strb r0, [r5, 0x2]
	strb r1, [r5, 0x3]
	movs r0, 0x1
	strb r0, [r5, 0x4]
	adds r5, 0x5
	adds r0, r7, 0
	bl GetMonGender
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r7, 0
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r7, 0
	movs r1, 0x3
	bl GetMonData
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	mov r1, sp
	bl sub_8040D3C
	cmp r0, 0
	beq _08045222
	movs r6, 0x64
_08045222:
	cmp r6, 0
	beq _08045240
	cmp r6, 0xFE
	beq _08045248
	movs r0, 0xB
	strb r0, [r5]
	movs r0, 0xFF
	strb r0, [r5, 0x1]
	adds r5, 0x1
	b _08045256
	.align 2, 0
_08045238: .4byte gUnknown_020238CC
_0804523C: .4byte gUnknown_0820A8B0
_08045240:
	movs r0, 0xB
	strb r0, [r5]
	movs r0, 0xB5
	b _0804524E
_08045248:
	movs r0, 0xA
	strb r0, [r5]
	movs r0, 0xB6
_0804524E:
	strb r0, [r5, 0x1]
	movs r0, 0xFF
	strb r0, [r5, 0x2]
	adds r5, 0x2
_08045256:
	movs r0, 0xFC
	strb r0, [r5]
	movs r0, 0x13
	strb r0, [r5, 0x1]
	movs r0, 0x37
	strb r0, [r5, 0x2]
	movs r0, 0xFF
	strb r0, [r5, 0x3]
	ldr r1, _080452D8 @ =gSprites
	mov r0, r9
	lsls r4, r0, 4
	adds r0, r4, r0
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 7
	ldr r2, _080452DC @ =0x02000520
	adds r5, r1, r2
	ldr r0, _080452E0 @ =gUnknown_020238CC
	mov r8, r0
	adds r0, r5, 0
	mov r1, r8
	bl sub_80034D4
	movs r6, 0
	movs r1, 0x7
	mov r10, r1
	adds r0, r7, 0
	movs r1, 0x3
	bl GetMonData
	str r4, [sp, 0xC]
	cmp r0, 0x1
	bne _08045338
	adds r0, r7, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _08045338
	mov r4, r8
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	beq _08045338
	adds r7, r5, 0
_080452C2:
	cmp r1, 0xFC
	bne _080452E4
	ldrb r0, [r4, 0x1]
	bl GetExtCtrlCodeLength
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	adds r4, r0
	b _08045330
	.align 2, 0
_080452D8: .4byte gSprites
_080452DC: .4byte 0x02000520
_080452E0: .4byte gUnknown_020238CC
_080452E4:
	adds r0, r1, 0
	subs r0, 0x37
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bls _080452FC
	adds r0, r1, 0
	adds r0, 0x79
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _08045300
_080452FC:
	movs r0, 0x2C
	b _0804531E
_08045300:
	adds r0, r1, 0
	subs r0, 0x4B
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _08045318
	adds r0, r1, 0
	adds r0, 0x65
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _0804531C
_08045318:
	movs r0, 0x2D
	b _0804531E
_0804531C:
	movs r0, 0x2B
_0804531E:
	bl sub_8043CDC
	adds r1, r7, 0
	ldr r2, _080453C8 @ =REG_BG0CNT
	bl CpuSet
	adds r7, 0x40
	adds r6, 0x1
	adds r4, 0x1
_08045330:
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _080452C2
_08045338:
	cmp r6, r10
	bge _0804535A
	lsls r0, r6, 6
	adds r4, r0, r5
	mov r2, r10
	subs r6, r2, r6
_08045344:
	movs r0, 0x2B
	bl sub_8043CDC
	adds r1, r4, 0
	ldr r2, _080453C8 @ =REG_BG0CNT
	bl CpuSet
	adds r4, 0x40
	subs r6, 0x1
	cmp r6, 0
	bne _08045344
_0804535A:
	ldr r1, _080453CC @ =gSprites
	ldr r0, [sp, 0xC]
	add r0, r9
	lsls r0, 2
	adds r6, r0, r1
	ldrh r0, [r6, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080453D4
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _080453D4
	ldr r1, _080453D0 @ =gUnknown_0820A8B4
	mov r0, r10
	cmp r0, 0
	beq _08045438
	mov r8, r6
	mov r9, r1
	ldr r7, _080453C8 @ =REG_BG0CNT
	mov r6, r10
_0804538E:
	mov r1, r9
	adds r1, 0x4
	mov r9, r1
	subs r1, 0x4
	ldm r1!, {r4}
	mov r2, r8
	ldrh r0, [r2, 0x4]
	lsls r0, 22
	lsrs r0, 17
	adds r4, r0
	adds r0, r5, 0
	adds r1, r4, 0
	adds r2, r7, 0
	bl CpuSet
	adds r5, 0x20
	movs r0, 0x80
	lsls r0, 1
	adds r4, r0
	adds r0, r5, 0
	adds r1, r4, 0
	adds r2, r7, 0
	bl CpuSet
	adds r5, 0x20
	subs r6, 0x1
	cmp r6, 0
	bne _0804538E
	b _08045438
	.align 2, 0
_080453C8: .4byte REG_BG0CNT
_080453CC: .4byte gSprites
_080453D0: .4byte gUnknown_0820A8B4
_080453D4:
	ldr r1, _08045448 @ =gSprites
	ldr r0, [sp, 0xC]
	add r0, r9
	lsls r0, 2
	adds r4, r0, r1
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	ldr r1, _0804544C @ =gUnknown_0820A8DC
	cmp r0, 0
	bne _080453F2
	ldr r1, _08045450 @ =gUnknown_0820A904
_080453F2:
	mov r2, r10
	cmp r2, 0
	beq _08045438
	mov r8, r4
	mov r9, r1
	ldr r7, _08045454 @ =REG_BG0CNT
	mov r6, r10
_08045400:
	mov r0, r9
	adds r0, 0x4
	mov r9, r0
	subs r0, 0x4
	ldm r0!, {r4}
	mov r1, r8
	ldrh r0, [r1, 0x4]
	lsls r0, 22
	lsrs r0, 17
	adds r4, r0
	adds r0, r5, 0
	adds r1, r4, 0
	adds r2, r7, 0
	bl CpuSet
	adds r5, 0x20
	movs r2, 0x80
	lsls r2, 1
	adds r4, r2
	adds r0, r5, 0
	adds r1, r4, 0
	adds r2, r7, 0
	bl CpuSet
	adds r5, 0x20
	subs r6, 0x1
	cmp r6, 0
	bne _08045400
_08045438:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045448: .4byte gSprites
_0804544C: .4byte gUnknown_0820A8DC
_08045450: .4byte gUnknown_0820A904
_08045454: .4byte REG_BG0CNT
	thumb_func_end sub_80451A0

	thumb_func_start sub_8045458
sub_8045458: @ 8045458
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	ldr r0, _080454F4 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	bne _0804552E
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _0804552E
	ldr r6, _080454F8 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r5, r0, r6
	ldrh r0, [r5, 0x3A]
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0804552E
	ldr r1, _080454FC @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08045500 @ =gEnemyParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	beq _0804552E
	ldrh r0, [r5, 0x38]
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r7, 0
	beq _0804550C
	movs r0, 0x46
	bl sub_8043CDC
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r6
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 17
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2
	ldr r2, _08045504 @ =0x06010000
	adds r1, r2
	ldr r2, _08045508 @ =REG_BG0CNT
	bl CpuSet
	b _0804552E
	.align 2, 0
_080454F4: .4byte gUnknown_020239F8
_080454F8: .4byte gSprites
_080454FC: .4byte gUnknown_02024A6A
_08045500: .4byte gEnemyParty
_08045504: .4byte 0x06010000
_08045508: .4byte REG_BG0CNT
_0804550C:
	str r7, [sp]
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r6
	ldrh r1, [r0, 0x4]
	lsls r1, 22
	lsrs r1, 17
	movs r0, 0x80
	lsls r0, 1
	adds r1, r0
	ldr r0, _08045538 @ =0x06010000
	adds r1, r0
	ldr r2, _0804553C @ =0x05000008
	mov r0, sp
	bl CpuSet
_0804552E:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045538: .4byte 0x06010000
_0804553C: .4byte 0x05000008
	thumb_func_end sub_8045458

	thumb_func_start draw_status_ailment_maybe
draw_status_ailment_maybe: @ 8045540
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _080455A4 @ =gSprites
	mov r2, r9
	lsls r1, r2, 4
	add r1, r9
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x3A]
	lsls r0, 24
	lsrs r7, r0, 24
	ldrh r0, [r1, 0x38]
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	adds r0, r7, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080455B0
	ldr r1, _080455A8 @ =gUnknown_02024A6A
	lsls r0, r7, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080455AC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x37
	bl GetMonData
	adds r4, r0, 0
	bl battle_type_is_double
	lsls r0, 24
	movs r3, 0x12
	mov r8, r3
	cmp r0, 0
	bne _080455CC
	movs r0, 0x1A
	mov r8, r0
	b _080455CC
	.align 2, 0
_080455A4: .4byte gSprites
_080455A8: .4byte gUnknown_02024A6A
_080455AC: .4byte gPlayerParty
_080455B0:
	ldr r1, _080455EC @ =gUnknown_02024A6A
	lsls r0, r7, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080455F0 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x37
	bl GetMonData
	adds r4, r0, 0
	movs r1, 0x11
	mov r8, r1
_080455CC:
	movs r0, 0x7
	ands r0, r4
	cmp r0, 0
	beq _080455F4
	movs r0, 0x1B
	adds r1, r7, 0
	bl sub_80457E8
	lsls r0, 24
	lsrs r0, 24
	bl sub_8043CDC
	adds r6, r0, 0
	movs r0, 0x2
	b _080456FC
	.align 2, 0
_080455EC: .4byte gUnknown_02024A6A
_080455F0: .4byte gEnemyParty
_080455F4:
	movs r0, 0x88
	ands r0, r4
	cmp r0, 0
	beq _08045612
	movs r0, 0x15
	adds r1, r7, 0
	bl sub_80457E8
	lsls r0, 24
	lsrs r0, 24
	bl sub_8043CDC
	adds r6, r0, 0
	movs r0, 0
	b _080456FC
_08045612:
	movs r0, 0x10
	ands r0, r4
	cmp r0, 0
	beq _08045630
	movs r0, 0x21
	adds r1, r7, 0
	bl sub_80457E8
	lsls r0, 24
	lsrs r0, 24
	bl sub_8043CDC
	adds r6, r0, 0
	movs r0, 0x4
	b _080456FC
_08045630:
	movs r0, 0x20
	ands r0, r4
	cmp r0, 0
	beq _0804564E
	movs r0, 0x1E
	adds r1, r7, 0
	bl sub_80457E8
	lsls r0, 24
	lsrs r0, 24
	bl sub_8043CDC
	adds r6, r0, 0
	movs r0, 0x3
	b _080456FC
_0804564E:
	movs r0, 0x40
	ands r0, r4
	cmp r0, 0
	beq _0804566C
	movs r0, 0x18
	adds r1, r7, 0
	bl sub_80457E8
	lsls r0, 24
	lsrs r0, 24
	bl sub_8043CDC
	adds r6, r0, 0
	movs r0, 0x1
	b _080456FC
_0804566C:
	movs r0, 0x27
	bl sub_8043CDC
	adds r6, r0, 0
	movs r4, 0
	mov r2, r9
	lsls r0, r2, 4
	mov r3, r8
	lsls r3, 16
	mov r8, r3
	lsls r7, 2
	ldr r1, _080456E8 @ =gSprites
	add r0, r9
	lsls r0, 2
	adds r5, r0, r1
_0804568A:
	ldrh r1, [r5, 0x4]
	lsls r1, 22
	lsrs r1, 22
	mov r2, r8
	asrs r0, r2, 16
	adds r1, r0
	adds r1, r4
	lsls r1, 5
	ldr r3, _080456EC @ =0x06010000
	adds r1, r3
	adds r0, r6, 0
	ldr r2, _080456F0 @ =REG_BG0CNT
	bl CpuSet
	adds r4, 0x1
	cmp r4, 0x2
	ble _0804568A
	ldr r0, _080456F4 @ =0x02017800
	adds r0, r7, r0
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _080456DC
	movs r0, 0x1
	bl sub_8043CDC
	ldr r2, _080456E8 @ =gSprites
	mov r3, r10
	lsls r1, r3, 4
	add r1, r10
	lsls r1, 2
	adds r1, r2
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 17
	ldr r2, _080456EC @ =0x06010000
	adds r1, r2
	ldr r2, _080456F8 @ =REG_BG0HOFS
	bl CpuSet
_080456DC:
	mov r0, r9
	movs r1, 0x1
	bl sub_8045458
	b _080457BA
	.align 2, 0
_080456E8: .4byte gSprites
_080456EC: .4byte 0x06010000
_080456F0: .4byte REG_BG0CNT
_080456F4: .4byte 0x02017800
_080456F8: .4byte REG_BG0HOFS
_080456FC:
	mov r1, r9
	lsls r5, r1, 4
	add r5, r9
	lsls r5, 2
	ldr r2, _080457C8 @ =gSprites
	adds r5, r2
	ldrb r4, [r5, 0x5]
	lsrs r4, 4
	lsls r4, 4
	adds r4, 0xC
	adds r4, r7
	lsls r0, 1
	ldr r1, _080457CC @ =gBattleInterfaceStatusIcons_DynPal
	adds r0, r1
	ldrh r0, [r0]
	movs r3, 0x80
	lsls r3, 1
	adds r1, r4, r3
	movs r2, 0x2
	bl FillPalette
	lsls r4, 1
	ldr r0, _080457D0 @ =gPlttBufferUnfaded + 0x200
	adds r0, r4, r0
	ldr r1, _080457D4 @ =0x05000200
	adds r4, r1
	adds r1, r4, 0
	movs r2, 0x1
	bl CpuSet
	ldrh r1, [r5, 0x4]
	lsls r1, 22
	lsrs r1, 22
	add r1, r8
	lsls r1, 5
	ldr r2, _080457D8 @ =0x06010000
	mov r8, r2
	add r1, r8
	ldr r2, _080457DC @ =REG_BG2HOFS
	adds r0, r6, 0
	bl CpuSet
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0804576A
	adds r0, r7, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080457B2
_0804576A:
	lsls r0, r7, 2
	ldr r1, _080457E0 @ =0x02017800
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _080457B2
	movs r0, 0
	bl sub_8043CDC
	mov r3, r10
	lsls r4, r3, 4
	add r4, r10
	lsls r4, 2
	ldr r1, _080457C8 @ =gSprites
	adds r4, r1
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 17
	add r1, r8
	ldr r5, _080457E4 @ =REG_BG0CNT
	adds r2, r5, 0
	bl CpuSet
	movs r0, 0x41
	bl sub_8043CDC
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 17
	adds r1, 0x20
	add r1, r8
	adds r2, r5, 0
	bl CpuSet
_080457B2:
	mov r0, r9
	movs r1, 0
	bl sub_8045458
_080457BA:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080457C8: .4byte gSprites
_080457CC: .4byte gBattleInterfaceStatusIcons_DynPal
_080457D0: .4byte gPlttBufferUnfaded + 0x200
_080457D4: .4byte 0x05000200
_080457D8: .4byte 0x06010000
_080457DC: .4byte REG_BG2HOFS
_080457E0: .4byte 0x02017800
_080457E4: .4byte REG_BG0CNT
	thumb_func_end draw_status_ailment_maybe

	thumb_func_start sub_80457E8
sub_80457E8: @ 80457E8
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsrs r2, r0, 24
	adds r0, r2, 0
	subs r0, 0x15
	cmp r0, 0xC
	bhi _080458A8
	lsls r0, 2
	ldr r1, _08045804 @ =_08045808
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08045804: .4byte _08045808
	.align 2, 0
_08045808:
	.4byte _0804583C
	.4byte _080458A8
	.4byte _080458A8
	.4byte _08045852
	.4byte _080458A8
	.4byte _080458A8
	.4byte _08045868
	.4byte _080458A8
	.4byte _080458A8
	.4byte _0804587E
	.4byte _080458A8
	.4byte _080458A8
	.4byte _08045894
_0804583C:
	movs r2, 0x15
	cmp r3, 0
	beq _080458A8
	movs r2, 0x47
	cmp r3, 0x1
	beq _080458A8
	movs r2, 0x65
	cmp r3, 0x2
	bne _080458A8
	movs r2, 0x56
	b _080458A8
_08045852:
	movs r2, 0x18
	cmp r3, 0
	beq _080458A8
	movs r2, 0x4A
	cmp r3, 0x1
	beq _080458A8
	movs r2, 0x68
	cmp r3, 0x2
	bne _080458A8
	movs r2, 0x59
	b _080458A8
_08045868:
	movs r2, 0x1B
	cmp r3, 0
	beq _080458A8
	movs r2, 0x4D
	cmp r3, 0x1
	beq _080458A8
	movs r2, 0x6B
	cmp r3, 0x2
	bne _080458A8
	movs r2, 0x5C
	b _080458A8
_0804587E:
	movs r2, 0x1E
	cmp r3, 0
	beq _080458A8
	movs r2, 0x50
	cmp r3, 0x1
	beq _080458A8
	movs r2, 0x6E
	cmp r3, 0x2
	bne _080458A8
	movs r2, 0x5F
	b _080458A8
_08045894:
	movs r2, 0x21
	cmp r3, 0
	beq _080458A8
	movs r2, 0x53
	cmp r3, 0x1
	beq _080458A8
	movs r2, 0x71
	cmp r3, 0x2
	bne _080458A8
	movs r2, 0x62
_080458A8:
	adds r0, r2, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80457E8

	thumb_func_start sub_80458B0
sub_80458B0: @ 80458B0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08045984 @ =gSprites
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 7
	ldr r0, _08045988 @ =0x02000520
	adds r6, r1, r0
	movs r1, 0x7
	mov r8, r1
	ldr r1, _0804598C @ =gUnknown_08400DD6
	adds r0, r6, 0
	bl sub_80034D4
	movs r4, 0
_080458EE:
	movs r0, 0x2B
	bl sub_8043CDC
	lsls r1, r4, 6
	adds r1, r6, r1
	ldr r2, _08045990 @ =REG_BG0CNT
	bl CpuSet
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r8
	bcc _080458EE
	movs r7, 0x3
	movs r2, 0x3
	add r2, r8
	mov r9, r2
	cmp r7, r9
	bge _08045974
	ldr r1, _08045984 @ =gSprites
	ldr r0, _08045990 @ =REG_BG0CNT
	mov r10, r0
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	mov r8, r0
_08045924:
	mov r1, r8
	ldrh r0, [r1, 0x4]
	lsls r0, 22
	lsrs r0, 22
	adds r5, r7, 0
	cmp r7, 0
	bge _08045934
	adds r5, r7, 0x7
_08045934:
	asrs r5, 3
	lsls r4, r5, 3
	subs r4, r7, r4
	adds r0, r4
	lsls r5, 6
	adds r0, r5
	lsls r0, 5
	ldr r2, _08045994 @ =0x06010000
	adds r1, r0, r2
	adds r0, r6, 0
	mov r2, r10
	bl CpuSet
	adds r6, 0x20
	mov r1, r8
	ldrh r0, [r1, 0x4]
	lsls r0, 22
	lsrs r0, 22
	adds r4, 0x8
	adds r0, r4
	adds r0, r5
	lsls r0, 5
	ldr r2, _08045994 @ =0x06010000
	adds r1, r0, r2
	adds r0, r6, 0
	mov r2, r10
	bl CpuSet
	adds r6, 0x20
	adds r7, 0x1
	cmp r7, r9
	blt _08045924
_08045974:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045984: .4byte gSprites
_08045988: .4byte 0x02000520
_0804598C: .4byte gUnknown_08400DD6
_08045990: .4byte REG_BG0CNT
_08045994: .4byte 0x06010000
	thumb_func_end sub_80458B0

	thumb_func_start sub_8045998
sub_8045998: @ 8045998
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08045A38 @ =gUnknown_020238CC
	mov r8, r0
	ldr r1, _08045A3C @ =gUnknown_08400DE6
	bl StringCopy
	adds r7, r0, 0
	ldr r0, _08045A40 @ =gNumSafariBalls
	ldrb r1, [r0]
	adds r0, r7, 0
	movs r2, 0xA
	movs r3, 0x1
	bl sub_8003504
	adds r7, r0, 0
	ldr r1, _08045A44 @ =gUnknown_08400DF0
	bl StringAppend
	ldr r0, _08045A48 @ =gSprites
	lsls r5, r4, 4
	adds r5, r4
	lsls r5, 2
	adds r5, r0
	ldrh r0, [r5, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 1
	adds r4, r0
	lsls r4, 7
	ldr r0, _08045A4C @ =0x02000520
	adds r7, r4, r0
	movs r6, 0x5
	adds r0, r7, 0
	mov r1, r8
	bl sub_80034D4
	ldr r0, _08045A50 @ =0x02000540
	adds r7, r4, r0
	movs r4, 0x6
_080459F8:
	ldrh r0, [r5, 0x4]
	lsls r0, 22
	lsrs r2, r0, 22
	adds r0, r4, 0
	cmp r4, 0
	bge _08045A06
	adds r0, r4, 0x7
_08045A06:
	asrs r0, 3
	lsls r1, r0, 3
	subs r1, r4, r1
	adds r1, 0x18
	adds r1, r2, r1
	lsls r0, 6
	adds r1, r0
	lsls r1, 5
	ldr r0, _08045A54 @ =0x06010000
	adds r1, r0
	adds r0, r7, 0
	ldr r2, _08045A58 @ =REG_BG0CNT
	bl CpuSet
	adds r7, 0x40
	adds r4, 0x1
	adds r0, r6, 0x6
	cmp r4, r0
	blt _080459F8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045A38: .4byte gUnknown_020238CC
_08045A3C: .4byte gUnknown_08400DE6
_08045A40: .4byte gNumSafariBalls
_08045A44: .4byte gUnknown_08400DF0
_08045A48: .4byte gSprites
_08045A4C: .4byte 0x02000520
_08045A50: .4byte 0x02000540
_08045A54: .4byte 0x06010000
_08045A58: .4byte REG_BG0CNT
	thumb_func_end sub_8045998

	thumb_func_start sub_8045A5C
sub_8045A5C: @ 8045A5C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	mov r9, r1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r2, 24
	lsrs r7, r2, 24
	ldr r1, _08045BE4 @ =gSprites
	lsls r0, 4
	add r0, r8
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08045A92
	b _08045BF0
_08045A92:
	cmp r7, 0x3
	beq _08045A9A
	cmp r7, 0
	bne _08045AAE
_08045A9A:
	mov r0, r9
	movs r1, 0x38
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl sub_8043FC0
_08045AAE:
	cmp r7, 0x1
	bhi _08045AC8
	mov r0, r9
	movs r1, 0x39
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	mov r0, r8
	movs r2, 0
	bl sub_80440EC
_08045AC8:
	cmp r7, 0x2
	beq _08045AD0
	cmp r7, 0
	bne _08045AE6
_08045AD0:
	mov r0, r9
	movs r1, 0x3A
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	mov r0, r8
	movs r2, 0x1
	bl sub_80440EC
_08045AE6:
	cmp r7, 0x5
	beq _08045AEE
	cmp r7, 0
	bne _08045B22
_08045AEE:
	movs r0, 0
	bl load_gfxc_health_bar
	mov r0, r9
	movs r1, 0x3A
	bl GetMonData
	adds r4, r0, 0
	mov r0, r9
	movs r1, 0x39
	bl GetMonData
	adds r3, r0, 0
	movs r0, 0
	str r0, [sp]
	mov r0, r10
	mov r1, r8
	adds r2, r4, 0
	bl sub_8043D84
	mov r0, r10
	mov r1, r8
	movs r2, 0
	movs r3, 0
	bl sub_8045C78
_08045B22:
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	cmp r0, 0
	bne _08045BA6
	cmp r7, 0x6
	beq _08045B38
	cmp r7, 0
	bne _08045BA6
_08045B38:
	movs r0, 0x3
	bl load_gfxc_health_bar
	mov r0, r9
	movs r1, 0xB
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r0, r9
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r0, r9
	movs r1, 0x19
	bl GetMonData
	adds r3, r0, 0
	ldr r6, _08045BE8 @ =gExperienceTables
	lsls r1, r4, 2
	ldr r2, _08045BEC @ =gBaseStats
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0, 0x13]
	movs r0, 0xCA
	lsls r0, 1
	muls r0, r2
	adds r1, r0
	adds r1, r6
	ldr r1, [r1]
	subs r3, r1
	adds r4, 0x1
	lsls r4, 2
	adds r4, r0
	adds r4, r6
	ldr r2, [r4]
	subs r2, r1
	ldr r0, [sp, 0x4]
	str r0, [sp]
	mov r0, r10
	mov r1, r8
	bl sub_8043D84
	mov r0, r10
	mov r1, r8
	movs r2, 0x1
	movs r3, 0
	bl sub_8045C78
_08045BA6:
	cmp r7, 0x4
	beq _08045BAE
	cmp r7, 0
	bne _08045BB6
_08045BAE:
	mov r0, r8
	mov r1, r9
	bl sub_80451A0
_08045BB6:
	cmp r7, 0x9
	beq _08045BBE
	cmp r7, 0
	bne _08045BC4
_08045BBE:
	mov r0, r8
	bl draw_status_ailment_maybe
_08045BC4:
	cmp r7, 0xA
	bne _08045BCE
	mov r0, r8
	bl sub_80458B0
_08045BCE:
	adds r0, r7, 0
	subs r0, 0xA
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08045C66
	mov r0, r8
	bl sub_8045998
	b _08045C66
	.align 2, 0
_08045BE4: .4byte gSprites
_08045BE8: .4byte gExperienceTables
_08045BEC: .4byte gBaseStats
_08045BF0:
	cmp r7, 0x3
	beq _08045BF8
	cmp r7, 0
	bne _08045C0C
_08045BF8:
	mov r0, r9
	movs r1, 0x38
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl sub_8043FC0
_08045C0C:
	cmp r7, 0x5
	beq _08045C14
	cmp r7, 0
	bne _08045C48
_08045C14:
	movs r0, 0
	bl load_gfxc_health_bar
	mov r0, r9
	movs r1, 0x3A
	bl GetMonData
	adds r4, r0, 0
	mov r0, r9
	movs r1, 0x39
	bl GetMonData
	adds r3, r0, 0
	movs r0, 0
	str r0, [sp]
	mov r0, r10
	mov r1, r8
	adds r2, r4, 0
	bl sub_8043D84
	mov r0, r10
	mov r1, r8
	movs r2, 0
	movs r3, 0
	bl sub_8045C78
_08045C48:
	cmp r7, 0x4
	beq _08045C50
	cmp r7, 0
	bne _08045C58
_08045C50:
	mov r0, r8
	mov r1, r9
	bl sub_80451A0
_08045C58:
	cmp r7, 0x9
	beq _08045C60
	cmp r7, 0
	bne _08045C66
_08045C60:
	mov r0, r8
	bl draw_status_ailment_maybe
_08045C66:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8045A5C

	thumb_func_start sub_8045C78
sub_8045C78: @ 8045C78
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	cmp r2, 0
	bne _08045CBC
	lsls r5, r7, 2
	adds r3, r5, r7
	lsls r3, 2
	ldr r4, _08045CB8 @ =0x02017850
	adds r2, r3, r4
	ldr r0, [r2, 0x4]
	ldr r1, [r2, 0x8]
	ldr r2, [r2, 0xC]
	adds r4, 0x10
	adds r3, r4
	movs r4, 0x6
	str r4, [sp]
	movs r4, 0x1
	str r4, [sp, 0x4]
	bl sub_8045F58
	adds r6, r0, 0
	adds r4, r5, 0
	b _08045D0A
	.align 2, 0
_08045CB8: .4byte 0x02017850
_08045CBC:
	lsls r4, r7, 2
	adds r0, r4, r7
	lsls r0, 2
	mov r10, r0
	ldr r6, _08045D50 @ =0x02017850
	add r6, r10
	ldr r0, [r6, 0x8]
	ldr r1, [r6, 0xC]
	ldr r2, [r6, 0x4]
	movs r3, 0x8
	bl sub_8046188
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08045CDE
	movs r5, 0x1
_08045CDE:
	ldr r0, [r6, 0xC]
	mov r8, r0
	adds r1, r5, 0
	bl __divsi3
	cmp r0, 0
	bge _08045CEE
	negs r0, r0
_08045CEE:
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, [r6, 0x4]
	ldr r1, [r6, 0x8]
	ldr r3, _08045D50 @ =0x02017850
	adds r3, 0x10
	add r3, r10
	movs r2, 0x8
	str r2, [sp]
	str r5, [sp, 0x4]
	mov r2, r8
	bl sub_8045F58
	adds r6, r0, 0
_08045D0A:
	mov r0, r9
	cmp r0, 0x1
	beq _08045D22
	cmp r0, 0
	bne _08045D2A
	ldr r0, _08045D54 @ =0x02017800
	adds r0, r4, r0
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _08045D2A
_08045D22:
	adds r0, r7, 0
	mov r1, r9
	bl sub_8045D58
_08045D2A:
	movs r0, 0x1
	negs r0, r0
	cmp r6, r0
	bne _08045D3E
	adds r0, r4, r7
	lsls r0, 2
	ldr r1, _08045D50 @ =0x02017850
	adds r0, r1
	movs r1, 0
	str r1, [r0, 0x10]
_08045D3E:
	adds r0, r6, 0
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08045D50: .4byte 0x02017850
_08045D54: .4byte 0x02017800
	thumb_func_end sub_8045C78

	thumb_func_start sub_8045D58
sub_8045D58: @ 8045D58
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0
	beq _08045D72
	cmp r1, 0x1
	beq _08045E54
	b _08045F42
_08045D72:
	lsls r5, r6, 2
	adds r3, r5, r6
	lsls r3, 2
	ldr r4, _08045E00 @ =0x02017850
	adds r2, r3, r4
	ldr r0, [r2, 0x4]
	ldr r1, [r2, 0x8]
	ldr r2, [r2, 0xC]
	adds r4, 0x10
	adds r3, r4
	add r4, sp, 0x8
	str r4, [sp]
	movs r4, 0x6
	str r4, [sp, 0x4]
	bl sub_804602C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	mov r8, r1
	adds r1, r5, 0
	cmp r0, 0x18
	bhi _08045DAC
	movs r2, 0x38
	mov r8, r2
	cmp r0, 0x9
	bls _08045DAC
	movs r4, 0x2F
	mov r8, r4
_08045DAC:
	movs r5, 0
	ldr r7, _08045E04 @ =gSprites
	adds r0, r1, r6
	lsls r6, r0, 2
_08045DB4:
	ldr r0, _08045E00 @ =0x02017850
	adds r0, r6, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	ldrh r0, [r0, 0x38]
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r5, 0x1
	bhi _08045E10
	mov r0, r8
	bl sub_8043CDC
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	ldrb r1, [r1]
	lsls r1, 5
	adds r0, r1
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r7
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r2, r5, 0x2
	adds r1, r2
	lsls r1, 5
	ldr r2, _08045E08 @ =0x06010000
	adds r1, r2
	ldr r2, _08045E0C @ =REG_BG0CNT
	bl CpuSet
	b _08045E3E
	.align 2, 0
_08045E00: .4byte 0x02017850
_08045E04: .4byte gSprites
_08045E08: .4byte 0x06010000
_08045E0C: .4byte REG_BG0CNT
_08045E10:
	mov r0, r8
	bl sub_8043CDC
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	ldrb r1, [r1]
	lsls r1, 5
	adds r0, r1
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r7
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r1, r5, r1
	lsls r1, 5
	ldr r4, _08045E4C @ =0x06010040
	adds r1, r4
	ldr r2, _08045E50 @ =REG_BG0CNT
	bl CpuSet
_08045E3E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08045DB4
	b _08045F42
	.align 2, 0
_08045E4C: .4byte 0x06010040
_08045E50: .4byte REG_BG0CNT
_08045E54:
	lsls r5, r6, 2
	adds r3, r5, r6
	lsls r3, 2
	ldr r4, _08045EF0 @ =0x02017850
	adds r2, r3, r4
	ldr r0, [r2, 0x4]
	ldr r1, [r2, 0x8]
	ldr r2, [r2, 0xC]
	adds r4, 0x10
	adds r3, r4
	add r4, sp, 0x8
	str r4, [sp]
	movs r4, 0x8
	str r4, [sp, 0x4]
	bl sub_804602C
	ldr r1, _08045EF4 @ =gUnknown_02024A6A
	lsls r0, r6, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08045EF8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x38
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	adds r1, r5, 0
	cmp r0, 0x64
	bne _08045EAA
	movs r5, 0
	movs r2, 0
_08045E98:
	mov r0, sp
	adds r0, r5
	adds r0, 0x8
	strb r2, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _08045E98
_08045EAA:
	movs r5, 0
	ldr r7, _08045EFC @ =gSprites
	adds r0, r1, r6
	lsls r0, 2
	ldr r1, _08045EF0 @ =0x02017850
	adds r4, r0, r1
_08045EB6:
	cmp r5, 0x3
	bhi _08045F08
	movs r0, 0xC
	bl sub_8043CDC
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	ldrb r1, [r1]
	lsls r1, 5
	adds r0, r1
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r7
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r2, r5, 0
	adds r2, 0x24
	adds r1, r2
	lsls r1, 5
	ldr r2, _08045F00 @ =0x06010000
	adds r1, r2
	ldr r2, _08045F04 @ =REG_BG0CNT
	bl CpuSet
	b _08045F38
	.align 2, 0
_08045EF0: .4byte 0x02017850
_08045EF4: .4byte gUnknown_02024A6A
_08045EF8: .4byte gPlayerParty
_08045EFC: .4byte gSprites
_08045F00: .4byte 0x06010000
_08045F04: .4byte REG_BG0CNT
_08045F08:
	movs r0, 0xC
	bl sub_8043CDC
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	ldrb r1, [r1]
	lsls r1, 5
	adds r0, r1
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r7
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r1, r5, r1
	lsls r1, 5
	ldr r2, _08045F50 @ =0x06010b80
	adds r1, r2
	ldr r2, _08045F54 @ =REG_BG0CNT
	bl CpuSet
_08045F38:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _08045EB6
_08045F42:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045F50: .4byte 0x06010b80
_08045F54: .4byte REG_BG0CNT
	thumb_func_end sub_8045D58

	thumb_func_start sub_8045F58
sub_8045F58: @ 8045F58
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	adds r4, r1, 0
	mov r8, r2
	adds r5, r3, 0
	ldr r1, [sp, 0x18]
	ldr r0, [sp, 0x1C]
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 27
	lsrs r2, r1, 24
	ldr r1, [r5]
	ldr r0, _08045F84 @ =0xffff8000
	cmp r1, r0
	bne _08045F8A
	cmp r7, r2
	bge _08045F88
	lsls r0, r4, 8
	str r0, [r5]
	b _08045F8A
	.align 2, 0
_08045F84: .4byte 0xffff8000
_08045F88:
	str r4, [r5]
_08045F8A:
	mov r0, r8
	subs r4, r0
	cmp r4, 0
	bge _08045F96
	movs r4, 0
	b _08045F9C
_08045F96:
	cmp r4, r7
	ble _08045F9C
	adds r4, r7, 0
_08045F9C:
	cmp r7, r2
	bge _08045FB8
	ldr r0, [r5]
	asrs r1, r0, 8
	adds r6, r0, 0
	cmp r4, r1
	bne _08045FC4
	movs r0, 0xFF
	ands r0, r6
	cmp r0, 0
	bne _08045FC4
	movs r0, 0x1
	negs r0, r0
	b _08046020
_08045FB8:
	ldr r6, [r5]
	cmp r4, r6
	bne _08045FC4
	movs r0, 0x1
	negs r0, r0
	b _08046020
_08045FC4:
	cmp r7, r2
	bge _08045FFE
	lsls r0, r7, 8
	adds r1, r2, 0
	bl __divsi3
	mov r1, r8
	cmp r1, 0
	bge _08045FE2
	adds r0, r6, r0
	str r0, [r5]
	asrs r2, r0, 8
	cmp r2, r4
	blt _0804601E
	b _08045FF6
_08045FE2:
	subs r0, r6, r0
	str r0, [r5]
	asrs r2, r0, 8
	movs r1, 0xFF
	ands r0, r1
	cmp r0, 0
	ble _08045FF2
	adds r2, 0x1
_08045FF2:
	cmp r2, r4
	bgt _0804601E
_08045FF6:
	lsls r0, r4, 8
	str r0, [r5]
	adds r2, r4, 0
	b _0804601E
_08045FFE:
	mov r0, r8
	cmp r0, 0
	bge _08046010
	ldr r0, [r5]
	adds r0, r3
	str r0, [r5]
	cmp r0, r4
	ble _0804601C
	b _0804601A
_08046010:
	ldr r0, [r5]
	subs r0, r3
	str r0, [r5]
	cmp r0, r4
	bge _0804601C
_0804601A:
	str r4, [r5]
_0804601C:
	ldr r2, [r5]
_0804601E:
	adds r0, r2, 0
_08046020:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8045F58

	thumb_func_start sub_804602C
sub_804602C: @ 804602C
	push {r4-r7,lr}
	adds r4, r0, 0
	mov r12, r3
	ldr r7, [sp, 0x14]
	ldr r0, [sp, 0x18]
	lsls r0, 24
	lsrs r6, r0, 24
	subs r5, r1, r2
	cmp r5, 0
	bge _08046044
	movs r5, 0
	b _0804604A
_08046044:
	cmp r5, r4
	ble _0804604A
	adds r5, r4, 0
_0804604A:
	lsls r0, r6, 27
	lsrs r3, r0, 24
	movs r1, 0
	cmp r1, r6
	bcs _08046064
	movs r2, 0
_08046056:
	adds r0, r7, r1
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r6
	bcc _08046056
_08046064:
	cmp r4, r3
	bge _08046078
	mov r1, r12
	ldr r0, [r1]
	muls r0, r3
	adds r1, r4, 0
	bl __divsi3
	asrs r0, 8
	b _08046084
_08046078:
	mov r1, r12
	ldr r0, [r1]
	muls r0, r3
	adds r1, r4, 0
	bl __divsi3
_08046084:
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r2, 0
	cmp r3, 0
	bne _0804609A
	cmp r5, 0
	ble _0804609A
	movs r0, 0x1
	strb r0, [r7]
	movs r3, 0x1
	b _080460BE
_0804609A:
	movs r1, 0
	movs r4, 0x8
_0804609E:
	cmp r1, r6
	bcs _080460BE
	cmp r2, 0x7
	bls _080460BA
	adds r0, r7, r1
	strb r4, [r0]
	adds r0, r2, 0
	subs r0, 0x8
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	b _0804609E
_080460BA:
	adds r0, r7, r1
	strb r2, [r0]
_080460BE:
	adds r0, r3, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_804602C

	thumb_func_start sub_80460C8
sub_80460C8: @ 80460C8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r5, r0, 0
	adds r6, r1, 0
	adds r4, r2, 0
	mov r8, r3
	ldr r0, [r5]
	ldr r1, [r5, 0x4]
	ldr r2, [r5, 0x8]
	movs r3, 0x6
	str r3, [sp]
	movs r3, 0x1
	str r3, [sp, 0x4]
	adds r3, r6, 0
	bl sub_8045F58
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_8046128
	ldr r0, [r5]
	cmp r0, 0x2F
	bgt _08046108
	ldr r0, [r6]
	lsls r0, 8
	lsrs r1, r0, 16
	b _0804610A
_08046108:
	ldrh r1, [r6]
_0804610A:
	movs r2, 0
	ldrsh r0, [r5, r2]
	lsls r1, 16
	asrs r1, 16
	mov r2, r8
	bl sub_804373C
	lsls r0, r7, 16
	asrs r0, 16
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80460C8

	thumb_func_start sub_8046128
sub_8046128: @ 8046128
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x1C
	adds r5, r0, 0
	adds r3, r1, 0
	mov r8, r2
	ldr r0, [r5]
	ldr r1, [r5, 0x4]
	ldr r2, [r5, 0x8]
	add r4, sp, 0x8
	str r4, [sp]
	movs r4, 0x6
	str r4, [sp, 0x4]
	bl sub_804602C
	movs r3, 0
	add r7, sp, 0x10
	mov r12, r7
	ldrb r0, [r5, 0xC]
	lsls r6, r0, 27
	ldr r4, [r5, 0x10]
_08046154:
	lsls r2, r3, 1
	add r2, r12
	lsrs r1, r6, 15
	mov r0, sp
	adds r0, r3
	adds r0, 0x8
	ldrb r0, [r0]
	adds r0, r4, r0
	orrs r1, r0
	strh r1, [r2]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x5
	bls _08046154
	adds r0, r7, 0
	mov r1, r8
	movs r2, 0x6
	bl CpuSet
	add sp, 0x1C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8046128

	thumb_func_start sub_8046188
sub_8046188: @ 8046188
	push {r4-r7,lr}
	adds r6, r2, 0
	lsls r3, 27
	lsrs r7, r3, 24
	subs r5, r0, r1
	cmp r5, 0
	bge _0804619A
	movs r5, 0
	b _080461A0
_0804619A:
	cmp r5, r6
	ble _080461A0
	adds r5, r6, 0
_080461A0:
	muls r0, r7
	adds r1, r6, 0
	bl __divsi3
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	muls r0, r7
	adds r1, r6, 0
	bl __divsi3
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	subs r0, r4, r0
	cmp r0, 0
	bge _080461C8
	negs r0, r0
_080461C8:
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8046188

	thumb_func_start sub_80461D4
sub_80461D4: @ 80461D4
	push {r4,lr}
	lsls r2, 24
	lsrs r2, 24
	lsls r0, 16
	asrs r4, r0, 16
	adds r0, r4, 0
	muls r0, r2
	lsls r1, 16
	asrs r1, 16
	bl __divsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080461F8
	cmp r4, 0
	ble _080461F8
	movs r0, 0x1
_080461F8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80461D4

	thumb_func_start sub_8046200
sub_8046200: @ 8046200
	push {lr}
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	bne _08046212
	movs r0, 0x4
	b _0804622E
_08046212:
	movs r2, 0x30
	bl sub_80461D4
	lsls r0, 24
	lsrs r1, r0, 24
	movs r0, 0x3
	cmp r1, 0x18
	bhi _0804622E
	movs r0, 0x2
	cmp r1, 0x9
	bhi _0804622E
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
_0804622E:
	pop {r1}
	bx r1
	thumb_func_end sub_8046200

	thumb_func_start sub_8046234
sub_8046234: @ 8046234
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 24
	lsrs r4, r2, 24
	ldr r5, _0804636C @ =gUnknown_081FAEA4
	ldrh r0, [r5, 0x6]
	bl GetSpriteTileStartByTag
	lsls r0, 16
	ldr r1, _08046370 @ =0xffff0000
	cmp r0, r1
	bne _08046266
	adds r0, r5, 0
	bl LoadCompressedObjectPic
	ldr r0, _08046374 @ =gUnknown_081FAEAC
	bl LoadCompressedObjectPalette
_08046266:
	ldr r0, _08046378 @ =sub_8046388
	bl object_new_hidden_with_callback
	mov r8, r0
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r5, r0, 4
	add r5, r8
	lsls r5, 2
	ldr r0, _0804637C @ =gSprites
	adds r5, r0
	strh r4, [r5, 0x30]
	ldr r0, _08046380 @ =gSpriteTemplate_81FAF0C
	mov r9, r0
	lsls r6, 16
	asrs r0, r6, 16
	mov r10, r0
	ldr r0, _08046384 @ =0xfff00000
	adds r6, r0
	asrs r6, 16
	lsls r4, r7, 16
	asrs r7, r4, 16
	adds r4, r0
	asrs r4, 16
	mov r0, r9
	adds r1, r6, 0
	adds r2, r4, 0
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0804637C @ =gSprites
	adds r1, r0
	mov r0, r8
	strh r0, [r1, 0x2E]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r1, 0
	bl AnimateSprite
	mov r0, r9
	mov r1, r10
	adds r2, r4, 0
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0804637C @ =gSprites
	adds r4, r0
	mov r0, r8
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	adds r0, r4, 0
	bl AnimateSprite
	mov r0, r9
	adds r1, r6, 0
	adds r2, r7, 0
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0804637C @ =gSprites
	adds r4, r0
	mov r0, r8
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	adds r0, r4, 0
	bl AnimateSprite
	mov r0, r9
	mov r1, r10
	adds r2, r7, 0
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0804637C @ =gSprites
	adds r4, r0
	mov r0, r8
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r4, 0
	movs r1, 0x3
	bl StartSpriteAnim
	adds r0, r4, 0
	bl AnimateSprite
	mov r0, r8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804636C: .4byte gUnknown_081FAEA4
_08046370: .4byte 0xffff0000
_08046374: .4byte gUnknown_081FAEAC
_08046378: .4byte sub_8046388
_0804637C: .4byte gSprites
_08046380: .4byte gSpriteTemplate_81FAF0C
_08046384: .4byte 0xfff00000
	thumb_func_end sub_8046234

	thumb_func_start sub_8046388
sub_8046388: @ 8046388
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080463C0
	ldr r0, _080463B4 @ =gUnknown_081FAEA4
	ldrh r0, [r0, 0x6]
	bl FreeSpriteTilesByTag
	ldr r0, _080463B8 @ =gUnknown_081FAEAC
	ldrh r0, [r0, 0x4]
	bl FreeSpritePaletteByTag
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080463BC
	adds r0, r4, 0
	bl DestroySprite
	b _080463C0
	.align 2, 0
_080463B4: .4byte gUnknown_081FAEA4
_080463B8: .4byte gUnknown_081FAEAC
_080463BC:
	ldr r0, _080463C8 @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_080463C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080463C8: .4byte SpriteCallbackDummy
	thumb_func_end sub_8046388

	thumb_func_start sub_80463CC
sub_80463CC: @ 80463CC
	push {lr}
	adds r3, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080463F6
	ldr r2, _080463FC @ =gSprites
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x2E]
	subs r1, 0x1
	strh r1, [r0, 0x2E]
	adds r0, r3, 0
	bl DestroySprite
_080463F6:
	pop {r0}
	bx r0
	.align 2, 0
_080463FC: .4byte gSprites
	thumb_func_end sub_80463CC

	.align 2, 0 @ Don't pad with nop.
