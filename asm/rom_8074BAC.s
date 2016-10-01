	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_8075624
sub_8075624: @ 8075624
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _080756B8
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080756BC
	strb r1, [r0]
	ldr r0, _080756C0
	strb r1, [r0]
	ldr r0, _080756C4
	strb r1, [r0]
	ldr r0, _080756C8
	movs r1, 0
	str r1, [r0]
	ldr r0, _080756CC
	str r1, [r0]
	ldr r0, _080756D0
	movs r2, 0
	strh r1, [r0]
	ldr r0, _080756D4
	strb r2, [r0]
	ldr r4, _080756D8
	ldr r5, _080756DC
	ldr r6, _080756E0
	ldr r7, _080756E4
	ldr r0, _080756E8
	mov r12, r0
	ldr r1, _080756EC
	mov r8, r1
	ldr r0, _080756F0
	mov r9, r0
	ldr r1, _080756F4
	adds r3, r1, 0
	ldr r1, _080756F8
	movs r2, 0x7
_0807566E:
	ldrh r0, [r1]
	orrs r0, r3
	strh r0, [r1]
	adds r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bge _0807566E
	ldr r1, _080756FC
	movs r2, 0
	adds r0, r1, 0
	adds r0, 0xE
_08075684:
	strh r2, [r0]
	subs r0, 0x2
	cmp r0, r1
	bge _08075684
	movs r1, 0
	movs r0, 0xFF
	strb r0, [r4]
	movs r0, 0x1
	negs r0, r0
	strb r0, [r4, 0x1]
	strb r1, [r5]
	strb r1, [r6]
	movs r0, 0
	strh r1, [r7]
	mov r1, r12
	strb r0, [r1]
	mov r1, r8
	strb r0, [r1]
	mov r1, r9
	strb r0, [r1]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080756B8: .4byte gUnknown_0202F7B0
_080756BC: .4byte gUnknown_0202F7B1
_080756C0: .4byte gUnknown_0202F7B2
_080756C4: .4byte gUnknown_0202F7B3
_080756C8: .4byte gUnknown_0202F7B4
_080756CC: .4byte gUnknown_0202F7B8
_080756D0: .4byte gUnknown_0202F7BC
_080756D4: .4byte gUnknown_0202F7BE
_080756D8: .4byte gUnknown_0202F7C2
_080756DC: .4byte gUnknown_0202F7C4
_080756E0: .4byte gUnknown_0202F7C5
_080756E4: .4byte gUnknown_0202F7C6
_080756E8: .4byte gUnknown_0202F7C8
_080756EC: .4byte gUnknown_0202F7C9
_080756F0: .4byte gUnknown_0202F7D2
_080756F4: .4byte 0x0000ffff
_080756F8: .4byte gUnknown_03004B10
_080756FC: .4byte gUnknown_03004B00
	thumb_func_end sub_8075624

	thumb_func_start move_anim_start_t1
move_anim_start_t1: @ 8075700
	push {lr}
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _08075724
	ldr r0, _08075728
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r2, _0807572C
	ldr r0, _08075730
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, _08075734
	movs r2, 0x1
	bl move_something
	pop {r0}
	bx r0
	.align 2, 0
_08075724: .4byte gUnknown_0202F7C8
_08075728: .4byte gUnknown_02024C07
_0807572C: .4byte gUnknown_0202F7C9
_08075730: .4byte gUnknown_02024C08
_08075734: .4byte gBattleAnims_Moves
	thumb_func_end move_anim_start_t1

	thumb_func_start move_something
move_something: @ 8075738
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	str r0, [sp]
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080757D8
	bl sub_8079E24
	movs r0, 0
	bl sub_8043EB4
	movs r4, 0
	mov r0, r8
	lsls r0, 2
	mov r10, r0
	ldr r6, _0807578C
	movs r7, 0x64
	ldr r5, _08075790
_08075774:
	lsls r0, r4, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08075798
	ldrh r0, [r6]
	muls r0, r7
	ldr r1, _08075794
	b _0807579E
	.align 2, 0
_0807578C: .4byte gUnknown_02024A6A
_08075790: .4byte gUnknown_0202F7CA
_08075794: .4byte gEnemyParty
_08075798:
	ldrh r0, [r6]
	muls r0, r7
	ldr r1, _080757C0
_0807579E:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	strh r0, [r5]
	adds r6, 0x2
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _08075774
	ldr r3, _080757C4
	ldr r5, _080757C8
	ldr r1, _080757CC
	mov r12, r1
	ldr r7, _080757D0
	ldr r6, _080757D4
	b _080757FC
	.align 2, 0
_080757C0: .4byte gPlayerParty
_080757C4: .4byte gUnknown_0202F7C6
_080757C8: .4byte gUnknown_0202F7C2
_080757CC: .4byte gUnknown_0202F7B1
_080757D0: .4byte gUnknown_0202F7AC
_080757D4: .4byte sub_80759D0
_080757D8:
	ldr r3, _08075808
	ldr r5, _0807580C
	mov r0, r8
	lsls r0, 2
	mov r10, r0
	ldr r1, _08075810
	mov r12, r1
	ldr r7, _08075814
	ldr r6, _08075818
	ldr r2, _0807581C
	ldr r1, _08075820
	movs r4, 0x3
_080757F0:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _080757F0
_080757FC:
	mov r0, r9
	cmp r0, 0
	bne _08075824
	strh r0, [r3]
	b _08075828
	.align 2, 0
_08075808: .4byte gUnknown_0202F7C6
_0807580C: .4byte gUnknown_0202F7C2
_08075810: .4byte gUnknown_0202F7B1
_08075814: .4byte gUnknown_0202F7AC
_08075818: .4byte sub_80759D0
_0807581C: .4byte 0x02019348
_08075820: .4byte gUnknown_0202F7CA
_08075824:
	mov r1, r8
	strh r1, [r3]
_08075828:
	ldr r1, _0807587C
	movs r2, 0
	adds r0, r1, 0
	adds r0, 0xE
_08075830:
	strh r2, [r0]
	subs r0, 0x2
	cmp r0, r1
	bge _08075830
	movs r0, 0xFF
	strb r0, [r5]
	movs r0, 0x1
	negs r0, r0
	strb r0, [r5, 0x1]
	ldr r0, [sp]
	add r0, r10
	ldr r0, [r0]
	ldr r1, _08075880
	str r0, [r1]
	movs r0, 0x1
	mov r1, r12
	strb r0, [r1]
	movs r0, 0
	ldr r1, _08075884
	strb r0, [r1]
	str r6, [r7]
	ldr r0, _08075888
	adds r2, r0, 0
	ldr r1, _0807588C
	movs r4, 0x7
_08075862:
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _08075862
	mov r1, r9
	cmp r1, 0
	beq _080758AE
	movs r4, 0
	ldr r2, _08075890
	b _08075896
	.align 2, 0
_0807587C: .4byte gUnknown_03004B00
_08075880: .4byte gUnknown_0202F7A4
_08075884: .4byte gUnknown_0202F7B0
_08075888: .4byte 0x0000ffff
_0807588C: .4byte gUnknown_03004B10
_08075890: .4byte gUnknown_081C7160
_08075894:
	adds r4, 0x1
_08075896:
	lsls r0, r4, 1
	adds r0, r2
	ldrh r0, [r0]
	ldr r1, _080758D0
	cmp r0, r1
	beq _080758AE
	cmp r8, r0
	bne _08075894
	ldr r0, _080758D4
	movs r2, 0x80
	bl m4aMPlayVolumeControl
_080758AE:
	ldr r0, _080758D8
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080758DC
	strh r1, [r0]
	ldr r0, _080758E0
	strh r1, [r0]
	ldr r0, _080758E4
	strh r1, [r0]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080758D0: .4byte 0x0000ffff
_080758D4: .4byte gMPlay_BGM
_080758D8: .4byte gUnknown_030042C4
_080758DC: .4byte gUnknown_03004240
_080758E0: .4byte gUnknown_03004200
_080758E4: .4byte gUnknown_03004244
	thumb_func_end move_something

	thumb_func_start move_anim_8072740
move_anim_8072740: @ 80758E8
	push {r4,lr}
	adds r4, r0, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	ldr r1, _08075904
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075904: .4byte gUnknown_0202F7B2
	thumb_func_end move_anim_8072740

	thumb_func_start move_anim_task_del
move_anim_task_del: @ 8075908
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	ldr r1, _08075920
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08075920: .4byte gUnknown_0202F7B2
	thumb_func_end move_anim_task_del

	thumb_func_start move_anim_related_task_del
move_anim_related_task_del: @ 8075924
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	ldr r1, _0807593C
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0807593C: .4byte gUnknown_0202F7B3
	thumb_func_end move_anim_related_task_del

	thumb_func_start sub_8075940
sub_8075940: @ 8075940
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	ldr r4, _08075958
	ldr r1, _0807595C
_0807594C:
	ldrh r0, [r1]
	cmp r0, r4
	bne _08075960
	strh r3, [r1]
	b _08075968
	.align 2, 0
_08075958: .4byte 0x0000ffff
_0807595C: .4byte gUnknown_03004B10
_08075960:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, 0x7
	ble _0807594C
_08075968:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8075940

	thumb_func_start sub_8075970
sub_8075970: @ 8075970
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	ldr r0, _0807598C
	adds r4, r0, 0
	ldr r1, _08075990
_0807597E:
	ldrh r0, [r1]
	cmp r0, r3
	bne _08075994
	orrs r0, r4
	strh r0, [r1]
	b _0807599C
	.align 2, 0
_0807598C: .4byte 0x0000ffff
_08075990: .4byte gUnknown_03004B10
_08075994:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, 0x7
	ble _0807597E
_0807599C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8075970

	thumb_func_start move_anim_waiter
move_anim_waiter: @ 80759A4
	push {lr}
	ldr r2, _080759BC
	ldrb r1, [r2]
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r0, 0
	bgt _080759C8
	ldr r0, _080759C0
	ldr r1, _080759C4
	str r1, [r0]
	movs r0, 0
	b _080759CA
	.align 2, 0
_080759BC: .4byte gUnknown_0202F7B0
_080759C0: .4byte gUnknown_0202F7AC
_080759C4: .4byte sub_80759D0
_080759C8:
	subs r0, r1, 0x1
_080759CA:
	strb r0, [r2]
	pop {r0}
	bx r0
	thumb_func_end move_anim_waiter

	thumb_func_start sub_80759D0
sub_80759D0: @ 80759D0
	push {r4,lr}
	ldr r4, _08075A00
_080759D4:
	ldr r0, _08075A04
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _08075A08
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bne _080759F8
	ldr r0, _08075A0C
	ldrb r0, [r0]
	cmp r0, 0
	bne _080759D4
_080759F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075A00: .4byte gUnknown_0837F4B8
_08075A04: .4byte gUnknown_0202F7A4
_08075A08: .4byte gUnknown_0202F7B0
_08075A0C: .4byte gUnknown_0202F7B1
	thumb_func_end sub_80759D0

	thumb_func_start ma00_load_graphics
ma00_load_graphics: @ 8075A10
	push {r4-r6,lr}
	ldr r6, _08075A5C
	ldr r0, [r6]
	adds r1, r0, 0x1
	str r1, [r6]
	ldrb r4, [r0, 0x1]
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	orrs r4, r0
	lsls r5, r4, 3
	ldr r0, _08075A60
	adds r0, r5, r0
	bl LoadCompressedObjectPic
	ldr r0, _08075A64
	adds r5, r0
	adds r0, r5, 0
	bl LoadCompressedObjectPalette
	ldr r0, [r6]
	adds r0, 0x2
	str r0, [r6]
	ldr r0, _08075A68
	adds r4, r0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	bl sub_8075940
	ldr r1, _08075A6C
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _08075A70
	ldr r0, _08075A74
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08075A5C: .4byte gUnknown_0202F7A4
_08075A60: .4byte gBattleAnimPicTable - (10000 * 8)
_08075A64: .4byte gBattleAnimPaletteTable - (10000 * 8)
_08075A68: .4byte 0xffffd8f0
_08075A6C: .4byte gUnknown_0202F7B0
_08075A70: .4byte gUnknown_0202F7AC
_08075A74: .4byte move_anim_waiter
	thumb_func_end ma00_load_graphics

	thumb_func_start ma01_080728D0
ma01_080728D0: @ 8075A78
	push {r4-r6,lr}
	ldr r6, _08075AB8
	ldr r0, [r6]
	adds r1, r0, 0x1
	str r1, [r6]
	ldrb r4, [r0, 0x1]
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	orrs r4, r0
	ldr r1, _08075ABC
	ldr r0, _08075AC0
	adds r4, r0
	lsls r0, r4, 3
	adds r0, r1
	ldrh r5, [r0, 0x6]
	adds r0, r5, 0
	bl FreeSpriteTilesByTag
	adds r0, r5, 0
	bl FreeSpritePaletteByTag
	ldr r0, [r6]
	adds r0, 0x2
	str r0, [r6]
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	bl sub_8075970
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08075AB8: .4byte gUnknown_0202F7A4
_08075ABC: .4byte gBattleAnimPicTable
_08075AC0: .4byte 0xffffd8f0
	thumb_func_end ma01_080728D0

	thumb_func_start ma02_instanciate_template
ma02_instanciate_template: @ 8075AC4
	push {r4-r7,lr}
	ldr r5, _08075B2C
	ldr r1, [r5]
	adds r3, r1, 0x1
	str r3, [r5]
	ldrb r2, [r1, 0x1]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r3, 0x2]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r3, 0x3]
	lsls r0, 24
	adds r7, r2, r0
	adds r0, r1, 0x5
	str r0, [r5]
	ldrb r4, [r1, 0x5]
	adds r0, r1, 0x6
	str r0, [r5]
	ldrb r0, [r1, 0x6]
	adds r1, 0x7
	str r1, [r5]
	cmp r0, 0
	beq _08075B14
	adds r6, r5, 0
	ldr r5, _08075B30
	adds r3, r0, 0
_08075AFC:
	ldr r2, [r6]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	strh r1, [r5]
	adds r2, 0x2
	str r2, [r6]
	adds r5, 0x2
	subs r3, 0x1
	cmp r3, 0
	bne _08075AFC
_08075B14:
	movs r0, 0x80
	ands r0, r4
	cmp r0, 0
	beq _08075B44
	movs r0, 0x80
	eors r4, r0
	cmp r4, 0x3F
	bls _08075B34
	adds r0, r4, 0
	subs r0, 0x40
	b _08075B36
	.align 2, 0
_08075B2C: .4byte gUnknown_0202F7A4
_08075B30: .4byte gUnknown_03004B00
_08075B34:
	negs r0, r4
_08075B36:
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08075B40
	b _08075B56
	.align 2, 0
_08075B40: .4byte gUnknown_0202F7C9
_08075B44:
	cmp r4, 0x3F
	bls _08075B4E
	adds r0, r4, 0
	subs r0, 0x40
	b _08075B50
_08075B4E:
	negs r0, r4
_08075B50:
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08075BAC
_08075B56:
	ldrb r0, [r0]
	bl sub_8079E90
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r4, 24
	asrs r1, 24
	adds r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r0, r6, 16
	asrs r0, 16
	cmp r0, 0x2
	bgt _08075B74
	movs r6, 0x3
_08075B74:
	ldr r5, _08075BB0
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r3, r6, 24
	lsrs r3, 24
	adds r0, r7, 0
	adds r1, r4, 0
	bl CreateSpriteAndAnimate
	ldr r1, _08075BB4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075BAC: .4byte gUnknown_0202F7C8
_08075BB0: .4byte gUnknown_0202F7C9
_08075BB4: .4byte gUnknown_0202F7B2
	thumb_func_end ma02_instanciate_template

	thumb_func_start sub_8075BB8
sub_8075BB8: @ 8075BB8
	push {r4-r7,lr}
	ldr r4, _08075C28
	ldr r1, [r4]
	adds r3, r1, 0x1
	str r3, [r4]
	ldrb r2, [r1, 0x1]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r3, 0x2]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r3, 0x3]
	lsls r0, 24
	adds r6, r2, r0
	adds r0, r1, 0x5
	str r0, [r4]
	ldrb r7, [r1, 0x5]
	adds r0, r1, 0x6
	str r0, [r4]
	ldrb r0, [r1, 0x6]
	adds r1, 0x7
	str r1, [r4]
	cmp r0, 0
	beq _08075C08
	adds r5, r4, 0
	ldr r4, _08075C2C
	adds r3, r0, 0
_08075BF0:
	ldr r2, [r5]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	strh r1, [r4]
	adds r2, 0x2
	str r2, [r5]
	adds r4, 0x2
	subs r3, 0x1
	cmp r3, 0
	bne _08075BF0
_08075C08:
	adds r0, r6, 0
	adds r1, r7, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r6
	ldr r1, _08075C30
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075C28: .4byte gUnknown_0202F7A4
_08075C2C: .4byte gUnknown_03004B00
_08075C30: .4byte gUnknown_0202F7B2
	thumb_func_end sub_8075BB8

	thumb_func_start ma04_wait_countdown
ma04_wait_countdown: @ 8075C34
	push {r4,lr}
	ldr r1, _08075C64
	ldr r0, [r1]
	adds r2, r0, 0x1
	str r2, [r1]
	ldr r3, _08075C68
	ldrb r0, [r0, 0x1]
	strb r0, [r3]
	lsls r0, 24
	cmp r0, 0
	bne _08075C52
	movs r4, 0x1
	negs r4, r4
	adds r0, r4, 0
	strb r0, [r3]
_08075C52:
	adds r0, r2, 0x1
	str r0, [r1]
	ldr r1, _08075C6C
	ldr r0, _08075C70
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075C64: .4byte gUnknown_0202F7A4
_08075C68: .4byte gUnknown_0202F7B0
_08075C6C: .4byte gUnknown_0202F7AC
_08075C70: .4byte move_anim_waiter
	thumb_func_end ma04_wait_countdown

	thumb_func_start sub_8075C74
sub_8075C74: @ 8075C74
	push {lr}
	ldr r0, _08075C8C
	ldrb r2, [r0]
	cmp r2, 0
	bne _08075C98
	ldr r0, _08075C90
	ldr r1, [r0]
	adds r1, 0x1
	str r1, [r0]
	ldr r0, _08075C94
	strb r2, [r0]
	b _08075C9E
	.align 2, 0
_08075C8C: .4byte gUnknown_0202F7B2
_08075C90: .4byte gUnknown_0202F7A4
_08075C94: .4byte gUnknown_0202F7B0
_08075C98:
	ldr r1, _08075CA4
	movs r0, 0x1
	strb r0, [r1]
_08075C9E:
	pop {r0}
	bx r0
	.align 2, 0
_08075CA4: .4byte gUnknown_0202F7B0
	thumb_func_end sub_8075C74

	thumb_func_start nullsub_53
nullsub_53: @ 8075CA8
	bx lr
	thumb_func_end nullsub_53

	thumb_func_start nullsub_88
nullsub_88: @ 8075CAC
	bx lr
	thumb_func_end nullsub_88

	thumb_func_start sub_8075CB0
sub_8075CB0: @ 8075CB0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r0, 0
	mov r8, r0
	ldr r0, _08075CE0
	ldrb r0, [r0]
	cmp r0, 0
	bne _08075CD8
	ldr r0, _08075CE4
	ldrb r0, [r0]
	cmp r0, 0
	bne _08075CD8
	ldr r1, _08075CE8
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _08075CD8
	ldrb r0, [r1, 0x1]
	cmp r0, 0xFF
	beq _08075CF0
_08075CD8:
	ldr r1, _08075CEC
	movs r0, 0
	strh r0, [r1]
	b _08075D0A
	.align 2, 0
_08075CE0: .4byte gUnknown_0202F7B2
_08075CE4: .4byte gUnknown_0202F7B3
_08075CE8: .4byte gUnknown_0202F7C2
_08075CEC: .4byte gUnknown_03004AF0
_08075CF0:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08075D28
	ldr r1, _08075D14
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x5A
	bhi _08075D1C
_08075D0A:
	ldr r1, _08075D18
	movs r0, 0x1
	strb r0, [r1]
	b _08075D8E
	.align 2, 0
_08075D14: .4byte gUnknown_03004AF0
_08075D18: .4byte gUnknown_0202F7B0
_08075D1C:
	ldr r0, _08075D98
	bl m4aMPlayStop
	ldr r0, _08075D9C
	bl m4aMPlayStop
_08075D28:
	ldr r1, _08075DA0
	movs r0, 0
	strh r0, [r1]
	movs r5, 0
	ldr r7, _08075DA4
	ldr r6, _08075DA8
	ldr r4, _08075DAC
_08075D36:
	ldrh r0, [r4]
	cmp r0, r7
	beq _08075D5A
	lsls r0, 3
	adds r0, r6
	ldrh r0, [r0, 0x6]
	bl FreeSpriteTilesByTag
	ldrh r0, [r4]
	lsls r0, 3
	adds r0, r6
	ldrh r0, [r0, 0x6]
	bl FreeSpritePaletteByTag
	ldrh r1, [r4]
	adds r0, r7, 0
	orrs r0, r1
	strh r0, [r4]
_08075D5A:
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x7
	ble _08075D36
	mov r1, r8
	cmp r1, 0
	bne _08075D8E
	ldr r0, _08075DB0
	ldr r1, _08075DA4
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08075D88
	bl sub_8079E24
	movs r0, 0x1
	bl sub_8043EB4
_08075D88:
	ldr r0, _08075DB4
	mov r1, r8
	strb r1, [r0]
_08075D8E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075D98: .4byte gMPlay_SE1
_08075D9C: .4byte gMPlay_SE2
_08075DA0: .4byte gUnknown_03004AF0
_08075DA4: .4byte 0x0000ffff
_08075DA8: .4byte gBattleAnimPicTable
_08075DAC: .4byte gUnknown_03004B10
_08075DB0: .4byte gMPlay_BGM
_08075DB4: .4byte gUnknown_0202F7B1
	thumb_func_end sub_8075CB0

	thumb_func_start ma09_play_sound
ma09_play_sound: @ 8075DB8
	push {r4,lr}
	ldr r4, _08075DDC
	ldr r0, [r4]
	adds r1, r0, 0x1
	str r1, [r4]
	ldrb r0, [r0, 0x1]
	ldrb r1, [r1, 0x1]
	lsls r1, 8
	orrs r0, r1
	bl PlaySE
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075DDC: .4byte gUnknown_0202F7A4
	thumb_func_end ma09_play_sound

	thumb_func_start sub_8075DE0
sub_8075DE0: @ 8075DE0
	push {r4-r7,lr}
	ldr r0, _08075DF4
	ldr r2, [r0]
	adds r1, r2, 0x1
	str r1, [r0]
	ldrb r6, [r2, 0x1]
	cmp r6, 0
	bne _08075DF8
	movs r6, 0x2
	b _08075E02
	.align 2, 0
_08075DF4: .4byte gUnknown_0202F7A4
_08075DF8:
	cmp r6, 0x1
	bne _08075DFE
	movs r6, 0x3
_08075DFE:
	cmp r6, 0
	beq _08075E06
_08075E02:
	cmp r6, 0x2
	bne _08075E10
_08075E06:
	ldr r0, _08075E0C
	b _08075E12
	.align 2, 0
_08075E0C: .4byte gUnknown_0202F7C8
_08075E10:
	ldr r0, _08075E44
_08075E12:
	ldrb r5, [r0]
	adds r0, r5, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08075ECE
	adds r0, r5, 0
	bl battle_get_per_side_status
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _08075E3E
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08075E48
_08075E3E:
	movs r7, 0
	b _08075E4A
	.align 2, 0
_08075E44: .4byte gUnknown_0202F7C9
_08075E48:
	movs r7, 0x1
_08075E4A:
	adds r0, r5, 0
	adds r1, r7, 0
	bl sub_8076034
	ldr r0, _08075E98
	adds r0, r5, r0
	ldrb r4, [r0]
	ldr r0, _08075E9C
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _08075EA0
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r2, r0, r1
	strh r4, [r2, 0x8]
	ldr r1, _08075EA4
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x24]
	ldrh r4, [r0, 0x20]
	adds r1, r4
	strh r1, [r2, 0xA]
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r1, r0
	strh r1, [r2, 0xC]
	cmp r7, 0
	bne _08075EB0
	ldr r0, _08075EA8
	ldrh r0, [r0]
	strh r0, [r2, 0xE]
	ldr r0, _08075EAC
	b _08075EB8
	.align 2, 0
_08075E98: .4byte gUnknown_02024BE0
_08075E9C: .4byte task_pA_ma0A_obj_to_bg_pal
_08075EA0: .4byte gTasks
_08075EA4: .4byte gSprites
_08075EA8: .4byte gUnknown_030042C0
_08075EAC: .4byte gUnknown_030041B4
_08075EB0:
	ldr r0, _08075F04
	ldrh r0, [r0]
	strh r0, [r2, 0xE]
	ldr r0, _08075F08
_08075EB8:
	ldrh r0, [r0]
	strh r0, [r2, 0x10]
	ldr r0, _08075F0C
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	strh r7, [r1, 0x12]
	strh r5, [r1, 0x14]
	ldr r0, _08075F10
	strb r3, [r0]
_08075ECE:
	movs r0, 0x2
	eors r5, r0
	cmp r6, 0x1
	bls _08075F9A
	adds r0, r5, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08075F9A
	adds r0, r5, 0
	bl battle_get_per_side_status
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _08075F00
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08075F14
_08075F00:
	movs r7, 0
	b _08075F16
	.align 2, 0
_08075F04: .4byte gUnknown_03004288
_08075F08: .4byte gUnknown_03004280
_08075F0C: .4byte gTasks
_08075F10: .4byte gUnknown_0202F7C2
_08075F14:
	movs r7, 0x1
_08075F16:
	adds r0, r5, 0
	adds r1, r7, 0
	bl sub_8076034
	ldr r0, _08075F64
	adds r0, r5, r0
	ldrb r4, [r0]
	ldr r0, _08075F68
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _08075F6C
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r2, r0, r1
	strh r4, [r2, 0x8]
	ldr r1, _08075F70
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x24]
	ldrh r4, [r0, 0x20]
	adds r1, r4
	strh r1, [r2, 0xA]
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r1, r0
	strh r1, [r2, 0xC]
	cmp r7, 0
	bne _08075F7C
	ldr r0, _08075F74
	ldrh r0, [r0]
	strh r0, [r2, 0xE]
	ldr r0, _08075F78
	b _08075F84
	.align 2, 0
_08075F64: .4byte gUnknown_02024BE0
_08075F68: .4byte task_pA_ma0A_obj_to_bg_pal
_08075F6C: .4byte gTasks
_08075F70: .4byte gSprites
_08075F74: .4byte gUnknown_030042C0
_08075F78: .4byte gUnknown_030041B4
_08075F7C:
	ldr r0, _08075FA8
	ldrh r0, [r0]
	strh r0, [r2, 0xE]
	ldr r0, _08075FAC
_08075F84:
	ldrh r0, [r0]
	strh r0, [r2, 0x10]
	ldr r0, _08075FB0
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	strh r7, [r1, 0x12]
	strh r5, [r1, 0x14]
	ldr r0, _08075FB4
	strb r3, [r0, 0x1]
_08075F9A:
	ldr r1, _08075FB8
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075FA8: .4byte gUnknown_03004288
_08075FAC: .4byte gUnknown_03004280
_08075FB0: .4byte gTasks
_08075FB4: .4byte gUnknown_0202F7C2
_08075FB8: .4byte gUnknown_0202F7A4
	thumb_func_end sub_8075DE0

	thumb_func_start b_side_obj__get_some_boolean
b_side_obj__get_some_boolean: @ 8075FBC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08075FDC
	ldr r0, _08075FD8
	ldrb r0, [r0]
	cmp r4, r0
	beq _0807601C
	b _0807602C
	.align 2, 0
_08075FD8: .4byte gUnknown_0202F7C8
_08075FDC:
	adds r0, r4, 0
	bl sub_8078874
	lsls r0, 24
	cmp r0, 0
	beq _0807602C
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0807601C
	lsls r0, r5, 2
	ldr r1, _08076020
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0807601C
	ldr r2, _08076024
	ldr r0, _08076028
	adds r0, r5, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	blt _0807602C
_0807601C:
	movs r0, 0x1
	b _0807602E
	.align 2, 0
_08076020: .4byte 0x02017800
_08076024: .4byte gSprites
_08076028: .4byte gUnknown_02024BE0
_0807602C:
	movs r0, 0
_0807602E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end b_side_obj__get_some_boolean

	thumb_func_start sub_8076034
sub_8076034: @ 8076034
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 24
	cmp r1, 0
	beq _0807604E
	b _08076220
_0807604E:
	add r4, sp, 0x10
	adds r0, r4, 0
	bl sub_8078914
	ldr r2, [sp, 0x10]
	movs r3, 0x80
	lsls r3, 6
	add r6, sp, 0x1C
	add r0, sp, 0x20
	mov r10, r0
	mov r1, r9
	lsls r1, 5
	str r1, [sp, 0x24]
	movs r5, 0
	ldr r1, _08076194
	movs r4, 0x80
	lsls r4, 5
	mov r12, r6
	ldr r7, _08076198
	movs r0, 0x85
	lsls r0, 24
	mov r8, r0
_0807607A:
	str r5, [sp, 0x1C]
	mov r0, r12
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _0807607A
	str r5, [sp, 0x1C]
	str r6, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r8
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add r0, sp, 0xC
	movs r1, 0
	strb r1, [r0]
	strb r1, [r0]
	ldr r1, [sp, 0x14]
	movs r0, 0xFF
	mov r3, r10
	strh r0, [r3]
	ldr r0, _08076194
	str r3, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0807619C
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r2, _080761A0
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r2, 0x1]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r1, [r2, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x1]
	ldr r0, _080761A4
	add r0, r9
	ldrb r4, [r0]
	ldr r5, _080761A8
	ldr r0, _080761AC
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x24]
	ldrh r1, [r1, 0x20]
	adds r0, r1
	negs r0, r0
	adds r0, 0x20
	strh r0, [r5]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0807611C
	ldr r0, _080761B0
	ldrh r0, [r0]
	bl sub_80AEB1C
	lsls r0, 24
	cmp r0, 0
	beq _0807611C
	ldrh r0, [r5]
	subs r0, 0x1
	strh r0, [r5]
_0807611C:
	ldr r3, _080761B4
	ldr r2, _080761AC
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x26]
	ldrh r1, [r1, 0x22]
	adds r0, r1
	negs r0, r0
	adds r0, 0x20
	strh r0, [r3]
	ldr r0, _080761A4
	add r0, r9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldr r1, _080761B8
	ldr r0, _080761A8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r3]
	strh r0, [r1]
	ldr r4, _080761BC
	ldr r0, [sp, 0x24]
	adds r4, r0, r4
	mov r2, sp
	ldrb r1, [r2, 0x18]
	lsls r1, 4
	adds r0, r4, 0
	movs r2, 0x20
	bl LoadPalette
	mov r3, sp
	ldrb r0, [r3, 0x18]
	lsls r0, 5
	movs r1, 0xA0
	lsls r1, 19
	adds r0, r1
	ldr r1, _08076194
	str r4, [r1]
	str r0, [r1, 0x4]
	ldr r0, _080761C0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080761C4
	movs r2, 0
	b _080761CE
	.align 2, 0
_08076194: .4byte 0x040000d4
_08076198: .4byte 0x85000400
_0807619C: .4byte 0x81000800
_080761A0: .4byte REG_BG1CNT
_080761A4: .4byte gUnknown_02024BE0
_080761A8: .4byte gUnknown_030042C0
_080761AC: .4byte gSprites
_080761B0: .4byte 0x02019348
_080761B4: .4byte gUnknown_030041B4
_080761B8: .4byte REG_BG1HOFS
_080761BC: .4byte gPlttBufferUnfaded + 0x200
_080761C0: .4byte 0x84000008
_080761C4:
	mov r0, r9
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r2, r0, 24
_080761CE:
	mov r0, sp
	ldrb r3, [r0, 0x18]
	ldr r0, [sp, 0x10]
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp]
	ldr r4, [sp, 0x14]
	movs r1, 0xFA
	lsls r1, 24
	adds r0, r4, r1
	cmp r0, 0
	bge _080761EA
	ldr r1, _08076218
	adds r0, r4, r1
_080761EA:
	asrs r0, 11
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	ldr r0, _0807621C
	ldr r0, [r0]
	lsls r0, 28
	lsrs r0, 30
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	bl sub_80E4EF8
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08076210
	b _08076338
_08076210:
	bl sub_8076380
	b _08076338
	.align 2, 0
_08076218: .4byte 0xfa0007ff
_0807621C: .4byte REG_BG1CNT
_08076220:
	ldr r3, _08076348
	movs r5, 0x80
	lsls r5, 6
	add r6, sp, 0x1C
	ldr r2, _0807634C
	mov r10, r2
	mov r0, r9
	lsls r0, 5
	str r0, [sp, 0x24]
	movs r4, 0
	ldr r1, _08076350
	movs r2, 0x80
	lsls r2, 5
	mov r12, r6
	ldr r7, _08076354
	movs r0, 0x85
	lsls r0, 24
	mov r8, r0
_08076244:
	str r4, [sp, 0x1C]
	mov r0, r12
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	subs r5, r2
	cmp r5, r2
	bhi _08076244
	str r4, [sp, 0x1C]
	str r6, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r5, 2
	mov r2, r8
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add r0, sp, 0xC
	movs r1, 0
	strb r1, [r0]
	strb r1, [r0]
	ldr r1, _08076358
	movs r0, 0
	str r0, [sp, 0x1C]
	ldr r5, _08076350
	str r6, [r5]
	str r1, [r5, 0x4]
	ldr r0, _0807635C
	str r0, [r5, 0x8]
	ldr r0, [r5, 0x8]
	ldr r6, _08076360
	ldrb r1, [r6]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r6]
	ldrb r1, [r6, 0x1]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r6, 0x1]
	ldrb r1, [r6, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r6, 0x1]
	ldr r2, _08076364
	add r2, r9
	ldrb r4, [r2]
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	add r1, r10
	ldrh r0, [r1, 0x24]
	ldrh r3, [r1, 0x20]
	adds r0, r3
	negs r0, r0
	adds r0, 0x20
	ldr r3, _08076368
	strh r0, [r3]
	ldrh r0, [r1, 0x26]
	ldrh r1, [r1, 0x22]
	adds r0, r1
	negs r0, r0
	adds r0, 0x20
	ldr r1, _0807636C
	strh r0, [r1]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldr r1, _08076370
	ldrh r0, [r3]
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0807636C
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r3, [sp, 0x24]
	ldr r0, _08076374
	adds r4, r3, r0
	adds r0, r4, 0
	movs r1, 0x90
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08076378
	str r4, [r5]
	str r0, [r5, 0x4]
	ldr r0, _0807637C
	str r0, [r5, 0x8]
	ldr r0, [r5, 0x8]
	mov r0, r9
	bl battle_get_per_side_status
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0xC0
	lsls r0, 7
	str r0, [sp]
	movs r0, 0x1E
	str r0, [sp, 0x4]
	ldr r0, [r6]
	lsls r0, 28
	lsrs r0, 30
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r3, 0x9
	bl sub_80E4EF8
_08076338:
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076348: .4byte 0x06006000
_0807634C: .4byte gSprites
_08076350: .4byte 0x040000d4
_08076354: .4byte 0x85000400
_08076358: .4byte 0x0600f000
_0807635C: .4byte 0x85000200
_08076360: .4byte REG_BG2CNT
_08076364: .4byte gUnknown_02024BE0
_08076368: .4byte gUnknown_03004288
_0807636C: .4byte gUnknown_03004280
_08076370: .4byte REG_BG2HOFS
_08076374: .4byte gPlttBufferUnfaded + 0x200
_08076378: .4byte 0x05000120
_0807637C: .4byte 0x84000008
	thumb_func_end sub_8076034

	thumb_func_start sub_8076380
sub_8076380: @ 8076380
	push {r4-r7,lr}
	sub sp, 0xC
	ldr r0, _080763F8
	ldrh r0, [r0]
	bl sub_80AEB1C
	lsls r0, 24
	cmp r0, 0
	beq _080763EE
	mov r0, sp
	bl sub_8078914
	ldr r6, [sp, 0x4]
	movs r5, 0
	movs r0, 0x7
	mov r12, r0
	movs r7, 0
_080763A2:
	movs r4, 0
	adds r3, r7, r6
	mov r1, r12
	lsls r0, r1, 1
	adds r2, r0, r6
_080763AC:
	ldrh r1, [r3]
	ldrh r0, [r2]
	strh r0, [r3]
	strh r1, [r2]
	adds r3, 0x2
	subs r2, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _080763AC
	movs r0, 0x20
	add r12, r0
	adds r7, 0x40
	adds r5, 0x1
	cmp r5, 0x7
	ble _080763A2
	movs r5, 0
	movs r1, 0x80
	lsls r1, 3
	adds r3, r1, 0
_080763D2:
	adds r2, r5, 0x1
	lsls r0, r5, 6
	adds r1, r0, r6
	movs r4, 0x7
_080763DA:
	ldrh r0, [r1]
	eors r0, r3
	strh r0, [r1]
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _080763DA
	adds r5, r2, 0
	cmp r5, 0x7
	ble _080763D2
_080763EE:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080763F8: .4byte 0x02019348
	thumb_func_end sub_8076380

	thumb_func_start sub_80763FC
sub_80763FC: @ 80763FC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r12, r1
	adds r7, r2, 0
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r3, 24
	movs r0, 0x40
	mov r9, r0
	cmp r3, 0
	bne _0807641A
	movs r1, 0x20
	mov r9, r1
_0807641A:
	lsls r0, r6, 28
	lsrs r6, r0, 16
	movs r0, 0
	cmp r0, r9
	bcs _08076452
	ldr r1, _08076460
	mov r8, r1
_08076428:
	movs r3, 0
	adds r5, r0, 0x1
	lsls r4, r0, 5
_0807642E:
	adds r1, r4, r3
	lsls r1, 1
	add r1, r12
	ldrh r2, [r1]
	mov r0, r8
	ands r0, r2
	orrs r0, r6
	adds r0, r7
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1F
	bls _0807642E
	lsls r0, r5, 24
	lsrs r0, 24
	cmp r0, r9
	bcc _08076428
_08076452:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076460: .4byte 0x00000fff
	thumb_func_end sub_80763FC

	thumb_func_start sub_8076464
sub_8076464: @ 8076464
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	add r5, sp, 0x4
	adds r0, r5, 0
	bl sub_8078914
	cmp r4, 0
	beq _0807648C
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080764F0
_0807648C:
	ldr r2, [sp, 0x4]
	movs r3, 0x80
	lsls r3, 6
	add r5, sp, 0x10
	ldr r0, _080764E0
	mov r9, r0
	ldr r0, _080764E4
	mov r10, r0
	movs r6, 0
	ldr r1, _080764E8
	movs r4, 0x80
	lsls r4, 5
	mov r12, r5
	ldr r7, _080764EC
	movs r0, 0x85
	lsls r0, 24
	mov r8, r0
_080764AE:
	str r6, [sp, 0x10]
	mov r0, r12
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _080764AE
	str r6, [sp, 0x10]
	str r5, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r8
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r0, sp
	movs r1, 0
	strb r1, [r0]
	strb r1, [r0]
	ldr r1, [sp, 0x8]
	b _08076540
	.align 2, 0
_080764E0: .4byte gUnknown_030042C0
_080764E4: .4byte gUnknown_030041B4
_080764E8: .4byte 0x040000d4
_080764EC: .4byte 0x85000400
_080764F0:
	ldr r2, _08076568
	movs r3, 0x80
	lsls r3, 6
	add r5, sp, 0x10
	ldr r0, _0807656C
	mov r9, r0
	ldr r0, _08076570
	mov r10, r0
	movs r6, 0
	ldr r1, _08076574
	movs r4, 0x80
	lsls r4, 5
	mov r12, r5
	ldr r7, _08076578
	movs r0, 0x85
	lsls r0, 24
	mov r8, r0
_08076512:
	str r6, [sp, 0x10]
	mov r0, r12
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _08076512
	str r6, [sp, 0x10]
	str r5, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r8
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r0, sp
	movs r1, 0
	strb r1, [r0]
	strb r1, [r0]
	ldr r1, _0807657C
_08076540:
	movs r2, 0
	str r2, [sp, 0x10]
	ldr r0, _08076574
	str r5, [r0]
	str r1, [r0, 0x4]
	ldr r1, _08076580
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	mov r0, r9
	strh r2, [r0]
	mov r0, r10
	strh r2, [r0]
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076568: .4byte 0x06006000
_0807656C: .4byte gUnknown_03004288
_08076570: .4byte gUnknown_03004280
_08076574: .4byte 0x040000d4
_08076578: .4byte 0x85000400
_0807657C: .4byte 0x0600f000
_08076580: .4byte 0x85000200
	thumb_func_end sub_8076464

	thumb_func_start task_pA_ma0A_obj_to_bg_pal
task_pA_ma0A_obj_to_bg_pal: @ 8076584
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080765FC
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r5, r1, r2
	ldrb r4, [r5, 0x8]
	ldrb r6, [r5, 0x14]
	mov r0, sp
	bl sub_8078914
	ldr r0, _08076600
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrh r2, [r1, 0x24]
	ldrh r0, [r1, 0x20]
	adds r2, r0
	ldrh r0, [r5, 0xA]
	subs r0, r2
	lsls r0, 16
	lsrs r3, r0, 16
	ldrh r2, [r1, 0x26]
	ldrh r1, [r1, 0x22]
	adds r2, r1
	ldrh r0, [r5, 0xC]
	subs r0, r2
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0x12
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _08076614
	ldr r1, _08076604
	lsls r0, r3, 16
	asrs r0, 16
	ldrh r3, [r5, 0xE]
	adds r0, r3
	strh r0, [r1]
	ldr r1, _08076608
	lsls r0, r2, 16
	asrs r0, 16
	ldrh r5, [r5, 0x10]
	adds r0, r5
	strh r0, [r1]
	lsls r2, r6, 5
	ldr r1, _0807660C
	adds r2, r1
	mov r0, sp
	ldrb r0, [r0, 0x8]
	lsls r0, 5
	ldr r3, _08076610
	adds r1, r3
	adds r0, r1
	b _08076634
	.align 2, 0
_080765FC: .4byte gTasks
_08076600: .4byte gSprites
_08076604: .4byte gUnknown_030042C0
_08076608: .4byte gUnknown_030041B4
_0807660C: .4byte gPlttBufferFaded + 0x200
_08076610: .4byte 0xfffffe00
_08076614:
	ldr r1, _08076648
	lsls r0, r3, 16
	asrs r0, 16
	ldrh r3, [r5, 0xE]
	adds r0, r3
	strh r0, [r1]
	ldr r1, _0807664C
	lsls r0, r2, 16
	asrs r0, 16
	ldrh r5, [r5, 0x10]
	adds r0, r5
	strh r0, [r1]
	lsls r2, r6, 5
	ldr r0, _08076650
	adds r2, r0
	subs r0, 0xE0
_08076634:
	ldr r1, _08076654
	str r2, [r1]
	str r0, [r1, 0x4]
	ldr r0, _08076658
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08076648: .4byte gUnknown_03004288
_0807664C: .4byte gUnknown_03004280
_08076650: .4byte gPlttBufferFaded + 0x200
_08076654: .4byte 0x040000d4
_08076658: .4byte 0x84000008
	thumb_func_end task_pA_ma0A_obj_to_bg_pal

	thumb_func_start ma0B_0807324C
ma0B_0807324C: @ 807665C
	push {r4,r5,lr}
	ldr r0, _08076670
	ldr r2, [r0]
	adds r1, r2, 0x1
	str r1, [r0]
	ldrb r4, [r2, 0x1]
	cmp r4, 0
	bne _08076674
	movs r4, 0x2
	b _0807667E
	.align 2, 0
_08076670: .4byte gUnknown_0202F7A4
_08076674:
	cmp r4, 0x1
	bne _0807667A
	movs r4, 0x3
_0807667A:
	cmp r4, 0
	beq _08076682
_0807667E:
	cmp r4, 0x2
	bne _0807668C
_08076682:
	ldr r0, _08076688
	b _0807668E
	.align 2, 0
_08076688: .4byte gUnknown_0202F7C8
_0807668C:
	ldr r0, _080766E4
_0807668E:
	ldrb r5, [r0]
	ldr r3, _080766E8
	ldrb r0, [r3]
	cmp r0, 0xFF
	beq _080766B4
	ldr r2, _080766EC
	ldr r0, _080766F0
	adds r0, r5, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_080766B4:
	cmp r4, 0x1
	bls _080766F4
	ldrb r0, [r3, 0x1]
	cmp r0, 0xFF
	beq _080766F4
	ldr r3, _080766EC
	ldr r2, _080766F0
	movs r1, 0x2
	adds r0, r5, 0
	eors r0, r1
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	b _080766F6
	.align 2, 0
_080766E4: .4byte gUnknown_0202F7C9
_080766E8: .4byte gUnknown_0202F7C2
_080766EC: .4byte gSprites
_080766F0: .4byte gUnknown_02024BE0
_080766F4:
	movs r4, 0
_080766F6:
	ldr r0, _08076720
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08076724
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	strh r5, [r1, 0xC]
	ldr r1, _08076728
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08076720: .4byte sub_807672C
_08076724: .4byte gTasks
_08076728: .4byte gUnknown_0202F7A4
	thumb_func_end ma0B_0807324C

	thumb_func_start sub_807672C
sub_807672C: @ 807672C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0807676C
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r1, r0, r1
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	beq _080767B6
	ldrb r0, [r1, 0xC]
	bl battle_get_per_side_status
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _08076768
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08076770
_08076768:
	movs r4, 0
	b _08076772
	.align 2, 0
_0807676C: .4byte gTasks
_08076770:
	movs r4, 0x1
_08076772:
	ldr r6, _080767BC
	ldrb r0, [r6]
	cmp r0, 0xFF
	beq _0807678A
	adds r0, r4, 0
	bl sub_8076464
	ldrb r0, [r6]
	bl DestroyTask
	movs r0, 0xFF
	strb r0, [r6]
_0807678A:
	ldr r0, _080767C0
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	ble _080767B0
	movs r0, 0x1
	eors r4, r0
	adds r0, r4, 0
	bl sub_8076464
	ldrb r0, [r6, 0x1]
	bl DestroyTask
	movs r0, 0xFF
	strb r0, [r6, 0x1]
_080767B0:
	adds r0, r5, 0
	bl DestroyTask
_080767B6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080767BC: .4byte gUnknown_0202F7C2
_080767C0: .4byte gTasks
	thumb_func_end sub_807672C

	thumb_func_start sub_80767C4
sub_80767C4: @ 80767C4
	push {r4,r5,lr}
	ldr r0, _080767D8
	ldr r2, [r0]
	adds r1, r2, 0x1
	str r1, [r0]
	ldrb r5, [r2, 0x1]
	cmp r5, 0
	bne _080767DC
	movs r5, 0x2
	b _080767E6
	.align 2, 0
_080767D8: .4byte gUnknown_0202F7A4
_080767DC:
	cmp r5, 0x1
	bne _080767E2
	movs r5, 0x3
_080767E2:
	cmp r5, 0
	beq _080767EA
_080767E6:
	cmp r5, 0x2
	bne _080767F4
_080767EA:
	ldr r0, _080767F0
	b _080767F6
	.align 2, 0
_080767F0: .4byte gUnknown_0202F7C8
_080767F4:
	ldr r0, _08076828
_080767F6:
	ldrb r4, [r0]
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08076850
	adds r0, r4, 0
	bl battle_get_per_side_status
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _08076822
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0807682C
_08076822:
	movs r1, 0
	b _0807682E
	.align 2, 0
_08076828: .4byte gUnknown_0202F7C9
_0807682C:
	movs r1, 0x1
_0807682E:
	adds r0, r4, 0
	bl sub_8076034
	ldr r2, _08076888
	ldr r0, _0807688C
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_08076850:
	movs r0, 0x2
	eors r4, r0
	cmp r5, 0x1
	bls _080768B4
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080768B4
	adds r0, r4, 0
	bl battle_get_per_side_status
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _08076882
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08076890
_08076882:
	movs r1, 0
	b _08076892
	.align 2, 0
_08076888: .4byte gSprites
_0807688C: .4byte gUnknown_02024BE0
_08076890:
	movs r1, 0x1
_08076892:
	adds r0, r4, 0
	bl sub_8076034
	ldr r2, _080768C4
	ldr r0, _080768C8
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_080768B4:
	ldr r1, _080768CC
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080768C4: .4byte gSprites
_080768C8: .4byte gUnknown_02024BE0
_080768CC: .4byte gUnknown_0202F7A4
	thumb_func_end sub_80767C4

	thumb_func_start ma23_8073484
ma23_8073484: @ 80768D0
	push {r4-r6,lr}
	ldr r0, _080768E4
	ldr r2, [r0]
	adds r1, r2, 0x1
	str r1, [r0]
	ldrb r5, [r2, 0x1]
	cmp r5, 0
	bne _080768E8
	movs r5, 0x2
	b _080768F2
	.align 2, 0
_080768E4: .4byte gUnknown_0202F7A4
_080768E8:
	cmp r5, 0x1
	bne _080768EE
	movs r5, 0x3
_080768EE:
	cmp r5, 0
	beq _080768F6
_080768F2:
	cmp r5, 0x2
	bne _08076900
_080768F6:
	ldr r0, _080768FC
	b _08076902
	.align 2, 0
_080768FC: .4byte gUnknown_0202F7C8
_08076900:
	ldr r0, _08076960
_08076902:
	ldrb r6, [r0]
	adds r0, r6, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _0807692C
	ldr r2, _08076964
	ldr r0, _08076968
	adds r0, r6, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_0807692C:
	cmp r5, 0x1
	bls _0807696C
	movs r0, 0x2
	adds r4, r6, 0
	eors r4, r0
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _0807696C
	ldr r2, _08076964
	ldr r0, _08076968
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	b _0807696E
	.align 2, 0
_08076960: .4byte gUnknown_0202F7C9
_08076964: .4byte gSprites
_08076968: .4byte gUnknown_02024BE0
_0807696C:
	movs r5, 0
_0807696E:
	ldr r0, _08076998
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807699C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r5, [r1, 0x8]
	strh r6, [r1, 0xC]
	ldr r1, _080769A0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08076998: .4byte sub_80769A4
_0807699C: .4byte gTasks
_080769A0: .4byte gUnknown_0202F7A4
	thumb_func_end ma23_8073484

	thumb_func_start sub_80769A4
sub_80769A4: @ 80769A4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080769E8
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r1, r0, r1
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	beq _08076A32
	ldrb r4, [r1, 0xC]
	adds r0, r4, 0
	bl battle_get_per_side_status
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _080769E2
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080769EC
_080769E2:
	movs r5, 0
	b _080769EE
	.align 2, 0
_080769E8: .4byte gTasks
_080769EC:
	movs r5, 0x1
_080769EE:
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08076A00
	adds r0, r5, 0
	bl sub_8076464
_08076A00:
	ldr r0, _08076A38
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	ble _08076A2C
	movs r0, 0x2
	eors r4, r0
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08076A2C
	movs r0, 0x1
	eors r5, r0
	adds r0, r5, 0
	bl sub_8076464
_08076A2C:
	adds r0, r6, 0
	bl DestroyTask
_08076A32:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08076A38: .4byte gTasks
	thumb_func_end sub_80769A4

	thumb_func_start sub_8076A3C
sub_8076A3C: @ 8076A3C
	push {r4,lr}
	ldr r2, _08076A6C
	ldr r0, [r2]
	adds r1, r0, 0x1
	str r1, [r2]
	ldrb r3, [r0, 0x1]
	adds r0, r1, 0x1
	str r0, [r2]
	ldrb r1, [r1, 0x1]
	lsls r1, 8
	adds r0, 0x1
	str r0, [r2]
	ldr r2, _08076A70
	movs r4, 0xFD
	lsls r4, 6
	adds r0, r4, 0
	strh r0, [r2]
	ldr r0, _08076A74
	orrs r3, r1
	strh r3, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076A6C: .4byte gUnknown_0202F7A4
_08076A70: .4byte REG_BLDCNT
_08076A74: .4byte REG_BLDALPHA
	thumb_func_end sub_8076A3C

	thumb_func_start sub_8076A78
sub_8076A78: @ 8076A78
	ldr r2, _08076A98
	ldr r0, [r2]
	adds r1, r0, 0x1
	str r1, [r2]
	ldrb r3, [r0, 0x1]
	adds r0, r1, 0x1
	str r0, [r2]
	ldrb r1, [r1, 0x1]
	lsls r1, 8
	adds r0, 0x1
	str r0, [r2]
	ldr r0, _08076A9C
	orrs r3, r1
	strh r3, [r0]
	bx lr
	.align 2, 0
_08076A98: .4byte gUnknown_0202F7A4
_08076A9C: .4byte REG_BLDCNT
	thumb_func_end sub_8076A78

	thumb_func_start sub_8076AA0
sub_8076AA0: @ 8076AA0
	ldr r1, _08076AB4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	ldr r0, _08076AB8
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bx lr
	.align 2, 0
_08076AB4: .4byte gUnknown_0202F7A4
_08076AB8: .4byte REG_BLDCNT
	thumb_func_end sub_8076AA0

	thumb_func_start ma0E_call
ma0E_call: @ 8076ABC
	push {r4,lr}
	ldr r4, _08076AE8
	ldr r1, [r4]
	adds r3, r1, 0x1
	str r3, [r4]
	ldr r2, _08076AEC
	adds r0, r1, 0x5
	str r0, [r2]
	ldrb r1, [r1, 0x1]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r3, 0x2]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r3, 0x3]
	lsls r0, 24
	adds r1, r0
	str r1, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076AE8: .4byte gUnknown_0202F7A4
_08076AEC: .4byte gUnknown_0202F7A8
	thumb_func_end ma0E_call

	thumb_func_start sub_8076AF0
sub_8076AF0: @ 8076AF0
	ldr r0, _08076AFC
	ldr r1, _08076B00
	ldr r1, [r1]
	str r1, [r0]
	bx lr
	.align 2, 0
_08076AFC: .4byte gUnknown_0202F7A4
_08076B00: .4byte gUnknown_0202F7A8
	thumb_func_end sub_8076AF0

	thumb_func_start ma10_080736AC
ma10_080736AC: @ 8076B04
	push {r4,r5,lr}
	ldr r5, _08076B30
	ldr r1, [r5]
	adds r0, r1, 0x1
	str r0, [r5]
	ldrb r2, [r1, 0x1]
	adds r3, r0, 0x1
	str r3, [r5]
	ldrb r4, [r0, 0x1]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r4, r0
	adds r1, 0x4
	str r1, [r5]
	ldr r0, _08076B34
	lsls r2, 1
	adds r2, r0
	strh r4, [r2]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08076B30: .4byte gUnknown_0202F7A4
_08076B34: .4byte gUnknown_03004B00
	thumb_func_end ma10_080736AC

	thumb_func_start ma11_if_else
ma11_if_else: @ 8076B38
	push {lr}
	ldr r3, _08076B70
	ldr r2, [r3]
	adds r0, r2, 0x1
	str r0, [r3]
	ldr r0, _08076B74
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08076B52
	adds r0, r2, 0x5
	str r0, [r3]
_08076B52:
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	adds r1, r0
	str r1, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_08076B70: .4byte gUnknown_0202F7A4
_08076B74: .4byte gUnknown_0202F7C4
	thumb_func_end ma11_if_else

	thumb_func_start ma12_cond_if
ma12_cond_if: @ 8076B78
	push {r4,r5,lr}
	ldr r5, _08076BA8
	ldr r4, [r5]
	adds r2, r4, 0x1
	str r2, [r5]
	ldrb r1, [r4, 0x1]
	adds r3, r2, 0x1
	str r3, [r5]
	ldr r0, _08076BAC
	ldrb r0, [r0]
	cmp r1, r0
	bne _08076BB0
	ldrb r1, [r2, 0x1]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r3, 0x2]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r3, 0x3]
	lsls r0, 24
	adds r1, r0
	str r1, [r5]
	b _08076BB4
	.align 2, 0
_08076BA8: .4byte gUnknown_0202F7A4
_08076BAC: .4byte gUnknown_0202F7C4
_08076BB0:
	adds r0, r4, 0x6
	str r0, [r5]
_08076BB4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end ma12_cond_if

	thumb_func_start sub_8076BBC
sub_8076BBC: @ 8076BBC
	ldr r3, _08076BDC
	ldr r0, [r3]
	adds r2, r0, 0x1
	str r2, [r3]
	ldrb r1, [r0, 0x1]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	adds r1, r0
	str r1, [r3]
	bx lr
	.align 2, 0
_08076BDC: .4byte gUnknown_0202F7A4
	thumb_func_end sub_8076BBC

	thumb_func_start sub_8076BE0
sub_8076BE0: @ 8076BE0
	push {lr}
	ldr r0, _08076BF8
	ldr r1, _08076BFC
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08076C00
	movs r0, 0
	b _08076C02
	.align 2, 0
_08076BF8: .4byte gMain
_08076BFC: .4byte 0x0000043d
_08076C00:
	movs r0, 0x1
_08076C02:
	pop {r1}
	bx r1
	thumb_func_end sub_8076BE0

	thumb_func_start ma14_load_background
ma14_load_background: @ 8076C08
	push {r4,lr}
	ldr r1, _08076C3C
	ldr r2, [r1]
	adds r0, r2, 0x1
	str r0, [r1]
	ldrb r4, [r2, 0x1]
	adds r0, 0x1
	str r0, [r1]
	ldr r0, _08076C40
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08076C44
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	ldr r1, _08076C48
	movs r0, 0x1
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076C3C: .4byte gUnknown_0202F7A4
_08076C40: .4byte task_p5_load_battle_screen_elements
_08076C44: .4byte gTasks
_08076C48: .4byte gUnknown_0202F7C5
	thumb_func_end ma14_load_background

	thumb_func_start sub_8076C4C
sub_8076C4C: @ 8076C4C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r2, _08076C8C
	ldr r1, [r2]
	adds r0, r1, 0x1
	str r0, [r2]
	ldrb r3, [r1, 0x1]
	mov r8, r3
	ldrb r7, [r0, 0x1]
	ldrb r6, [r0, 0x2]
	adds r1, 0x4
	str r1, [r2]
	ldr r0, _08076C90
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08076C98
	ldr r1, _08076C94
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r6, [r0, 0x8]
	b _08076CCA
	.align 2, 0
_08076C8C: .4byte gUnknown_0202F7A4
_08076C90: .4byte task_p5_load_battle_screen_elements
_08076C94: .4byte gTasks
_08076C98:
	ldr r0, _08076CB4
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08076CBC
	ldr r1, _08076CB8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r7, [r0, 0x8]
	b _08076CCA
	.align 2, 0
_08076CB4: .4byte gUnknown_0202F7C9
_08076CB8: .4byte gTasks
_08076CBC:
	ldr r1, _08076CDC
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	mov r1, r8
	strh r1, [r0, 0x8]
_08076CCA:
	ldr r1, _08076CE0
	movs r0, 0x1
	strb r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076CDC: .4byte gTasks
_08076CE0: .4byte gUnknown_0202F7C5
	thumb_func_end sub_8076C4C

	thumb_func_start task_p5_load_battle_screen_elements
task_p5_load_battle_screen_elements: @ 8076CE4
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08076D18
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r6, [r4, 0x1C]
	movs r0, 0x1C
	ldrsh r3, [r4, r0]
	adds r7, r1, 0
	cmp r3, 0
	bne _08076D1C
	str r3, [sp]
	movs r0, 0xE8
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginHardwarePaletteFade
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
	b _08076DAC
	.align 2, 0
_08076D18: .4byte gTasks
_08076D1C:
	ldr r2, _08076D38
	ldrb r1, [r2, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08076DAC
	cmp r3, 0x1
	bne _08076D40
	adds r0, r6, 0x1
	strh r0, [r4, 0x1C]
	ldr r1, _08076D3C
	movs r0, 0x2
	strb r0, [r1]
	b _08076D84
	.align 2, 0
_08076D38: .4byte gPaletteFade
_08076D3C: .4byte gUnknown_0202F7C5
_08076D40:
	cmp r3, 0x2
	bne _08076D84
	ldrh r0, [r4, 0x8]
	lsls r2, r0, 16
	asrs r1, r2, 16
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _08076D58
	bl dp01t_11_3_message_for_player_only
	b _08076D5E
_08076D58:
	lsrs r0, r2, 16
	bl sub_8076DB8
_08076D5E:
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xE8
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginHardwarePaletteFade
	ldr r1, _08076D80
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x1C]
	adds r1, 0x1
	strh r1, [r0, 0x1C]
	b _08076DAC
	.align 2, 0
_08076D80: .4byte gTasks
_08076D84:
	ldrb r1, [r2, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08076DAC
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r7
	movs r1, 0x1C
	ldrsh r0, [r0, r1]
	cmp r0, 0x3
	bne _08076DAC
	adds r0, r5, 0
	bl DestroyTask
	ldr r0, _08076DB4
	strb r4, [r0]
_08076DAC:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076DB4: .4byte gUnknown_0202F7C5
	thumb_func_end task_p5_load_battle_screen_elements

	thumb_func_start sub_8076DB8
sub_8076DB8: @ 8076DB8
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08076E70
	ldr r7, _08076E54
	lsls r0, r6, 1
	adds r0, r6
	lsls r4, r0, 2
	adds r0, r7, 0
	adds r0, 0x8
	adds r0, r4, r0
	ldr r5, [r0]
	bl sub_8076BE0
	lsls r0, 24
	ldr r1, _08076E58
	cmp r0, 0
	beq _08076DE8
	ldr r0, _08076E5C
	adds r1, r0
_08076DE8:
	adds r0, r5, 0
	bl sub_800D238
	bl sub_80789BC
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	ldr r1, _08076E58
	cmp r0, 0
	beq _08076E06
	ldr r0, _08076E5C
	adds r1, r0
_08076E06:
	movs r2, 0x80
	lsls r2, 1
	adds r0, r5, 0
	movs r3, 0
	bl sub_80763FC
	bl sub_8076BE0
	lsls r0, 24
	ldr r2, _08076E58
	cmp r0, 0
	beq _08076E22
	ldr r0, _08076E5C
	adds r2, r0
_08076E22:
	ldr r1, _08076E60
	ldr r0, _08076E64
	str r2, [r0]
	str r1, [r0, 0x4]
	ldr r1, _08076E68
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	adds r0, r4, r7
	ldr r0, [r0]
	ldr r1, _08076E6C
	bl LZDecompressVram
	adds r0, r7, 0x4
	adds r0, r4, r0
	ldr r4, [r0]
	bl sub_80789BC
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 20
	adds r0, r4, 0
	movs r2, 0x20
	bl LoadCompressedPalette
	b _08076E9E
	.align 2, 0
_08076E54: .4byte gBattleAnimBackgroundTable
_08076E58: .4byte 0x02018000
_08076E5C: .4byte 0xffffc800
_08076E60: .4byte 0x0600d000
_08076E64: .4byte 0x040000d4
_08076E68: .4byte 0x84000200
_08076E6C: .4byte 0x06002000
_08076E70:
	ldr r5, _08076EA4
	lsls r4, r6, 1
	adds r4, r6
	lsls r4, 2
	adds r0, r5, 0
	adds r0, 0x8
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _08076EA8
	bl LZDecompressVram
	adds r0, r4, r5
	ldr r0, [r0]
	ldr r1, _08076EAC
	bl LZDecompressVram
	adds r5, 0x4
	adds r4, r5
	ldr r0, [r4]
	movs r1, 0x20
	movs r2, 0x20
	bl LoadCompressedPalette
_08076E9E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076EA4: .4byte gBattleAnimBackgroundTable
_08076EA8: .4byte 0x0600d000
_08076EAC: .4byte 0x06008000
	thumb_func_end sub_8076DB8

	thumb_func_start dp01t_11_3_message_for_player_only
dp01t_11_3_message_for_player_only: @ 8076EB0
	push {lr}
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08076EC2
	bl sub_80AB2AC
	b _08076EC6
_08076EC2:
	bl sub_800D7B8
_08076EC6:
	pop {r0}
	bx r0
	thumb_func_end dp01t_11_3_message_for_player_only

	thumb_func_start ma15_load_battle_screen_elements
ma15_load_battle_screen_elements: @ 8076ECC
	push {lr}
	ldr r1, _08076EFC
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	ldr r0, _08076F00
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08076F04
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _08076F08
	strh r0, [r1, 0x8]
	ldr r1, _08076F0C
	movs r0, 0x1
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08076EFC: .4byte gUnknown_0202F7A4
_08076F00: .4byte task_p5_load_battle_screen_elements
_08076F04: .4byte gTasks
_08076F08: .4byte 0x0000ffff
_08076F0C: .4byte gUnknown_0202F7C5
	thumb_func_end ma15_load_battle_screen_elements

	thumb_func_start ma16_wait_for_battle_screen_elements_s2
ma16_wait_for_battle_screen_elements_s2: @ 8076F10
	push {lr}
	ldr r0, _08076F28
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _08076F34
	ldr r1, _08076F2C
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	ldr r1, _08076F30
	movs r0, 0
	b _08076F38
	.align 2, 0
_08076F28: .4byte gUnknown_0202F7C5
_08076F2C: .4byte gUnknown_0202F7A4
_08076F30: .4byte gUnknown_0202F7B0
_08076F34:
	ldr r1, _08076F40
	movs r0, 0x1
_08076F38:
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08076F40: .4byte gUnknown_0202F7B0
	thumb_func_end ma16_wait_for_battle_screen_elements_s2

	thumb_func_start sub_8076F44
sub_8076F44: @ 8076F44
	push {lr}
	ldr r0, _08076F5C
	ldrb r2, [r0]
	cmp r2, 0
	bne _08076F68
	ldr r0, _08076F60
	ldr r1, [r0]
	adds r1, 0x1
	str r1, [r0]
	ldr r0, _08076F64
	strb r2, [r0]
	b _08076F6E
	.align 2, 0
_08076F5C: .4byte gUnknown_0202F7C5
_08076F60: .4byte gUnknown_0202F7A4
_08076F64: .4byte gUnknown_0202F7B0
_08076F68:
	ldr r1, _08076F74
	movs r0, 0x1
	strb r0, [r1]
_08076F6E:
	pop {r0}
	bx r0
	.align 2, 0
_08076F74: .4byte gUnknown_0202F7B0
	thumb_func_end sub_8076F44

	thumb_func_start ma18_load_background_probably
ma18_load_background_probably: @ 8076F78
	push {r4,lr}
	ldr r4, _08076F94
	ldr r1, [r4]
	adds r0, r1, 0x1
	str r0, [r4]
	ldrb r0, [r1, 0x1]
	bl sub_8076DB8
	ldr r0, [r4]
	adds r0, 0x1
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076F94: .4byte gUnknown_0202F7A4
	thumb_func_end ma18_load_background_probably

	thumb_func_start sub_8076F98
sub_8076F98: @ 8076F98
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08076FDC
	ldr r0, _08076FD4
	ldrb r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r1, _08076FD8
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08076FDC
	adds r0, r2, 0
	bl battle_side_get_owner
	lsls r0, 24
	movs r4, 0xC0
	cmp r0, 0
	beq _0807706E
	movs r4, 0x3F
	b _0807706E
	.align 2, 0
_08076FD4: .4byte gUnknown_0202F7C8
_08076FD8: .4byte 0x02017810
_08076FDC:
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08077004
	ldr r0, _08076FFC
	ldr r1, _08077000
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08077068
	cmp r0, 0x2
	bne _08077068
	cmp r4, 0x3F
	beq _0807707A
	b _08077068
	.align 2, 0
_08076FFC: .4byte gUnknown_0202F7C8
_08077000: .4byte gUnknown_0202F7C9
_08077004:
	ldr r0, _0807702C
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08077042
	ldr r0, _08077030
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0807706E
	lsls r0, r4, 24
	asrs r1, r0, 24
	cmp r1, 0x3F
	bne _08077034
	movs r4, 0xC0
	b _0807706E
	.align 2, 0
_0807702C: .4byte gUnknown_0202F7C8
_08077030: .4byte gUnknown_0202F7C9
_08077034:
	movs r0, 0x40
	negs r0, r0
	cmp r1, r0
	beq _0807706E
	negs r0, r1
	lsls r0, 24
	b _0807706C
_08077042:
	ldr r0, _08077064
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08077068
	lsls r0, r4, 24
	asrs r0, 24
	movs r1, 0x40
	negs r1, r1
	cmp r0, r1
	bne _0807706E
	movs r4, 0x3F
	b _0807706E
	.align 2, 0
_08077064: .4byte gUnknown_0202F7C9
_08077068:
	lsls r0, r4, 24
	negs r0, r0
_0807706C:
	lsrs r4, r0, 24
_0807706E:
	lsls r0, r4, 24
	asrs r0, 24
	cmp r0, 0x3F
	ble _0807707A
	movs r4, 0x3F
	b _08077088
_0807707A:
	lsls r0, r4, 24
	asrs r0, 24
	movs r1, 0x40
	negs r1, r1
	cmp r0, r1
	bge _08077088
	movs r4, 0xC0
_08077088:
	lsls r0, r4, 24
	asrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8076F98

	thumb_func_start sub_8077094
sub_8077094: @ 8077094
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080770D8
	ldr r0, _080770D0
	ldrb r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r1, _080770D4
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080770D8
	adds r0, r2, 0
	bl battle_side_get_owner
	lsls r0, 24
	movs r4, 0xC0
	cmp r0, 0
	beq _080770F6
	movs r4, 0x3F
	b _080770F6
	.align 2, 0
_080770D0: .4byte gUnknown_0202F7C8
_080770D4: .4byte 0x02017810
_080770D8:
	ldr r0, _08077100
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080770F0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080770F6
_080770F0:
	lsls r0, r4, 24
	negs r0, r0
	lsrs r4, r0, 24
_080770F6:
	lsls r0, r4, 24
	asrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08077100: .4byte gUnknown_0202F7C8
	thumb_func_end sub_8077094

	thumb_func_start sub_8077104
sub_8077104: @ 8077104
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	asrs r2, r0, 16
	cmp r2, 0x3F
	ble _08077114
	movs r1, 0x3F
	b _0807711E
_08077114:
	movs r0, 0x40
	negs r0, r0
	cmp r2, r0
	bge _0807711E
	ldr r1, _08077128
_0807711E:
	lsls r0, r1, 16
	asrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_08077128: .4byte 0x0000ffc0
	thumb_func_end sub_8077104

	thumb_func_start sub_807712C
sub_807712C: @ 807712C
	push {lr}
	lsls r2, 16
	lsrs r2, 16
	adds r3, r2, 0
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	bge _0807714A
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0
	bge _0807715A
	b _08077158
_0807714A:
	cmp r0, r1
	ble _08077160
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, 0
	bge _08077158
	negs r0, r0
_08077158:
	negs r0, r0
_0807715A:
	lsls r0, 16
	lsrs r0, 16
	b _08077162
_08077160:
	movs r0, 0
_08077162:
	lsls r0, 16
	asrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_807712C

	thumb_func_start ma19_08073BC8
ma19_08073BC8: @ 807716C
	push {r4,r5,lr}
	ldr r5, _080771A0
	ldr r0, [r5]
	adds r1, r0, 0x1
	str r1, [r5]
	ldrb r4, [r0, 0x1]
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	orrs r4, r0
	movs r0, 0x2
	ldrsb r0, [r1, r0]
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	adds r0, r4, 0
	bl PlaySE12WithPanning
	ldr r0, [r5]
	adds r0, 0x3
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080771A0: .4byte gUnknown_0202F7A4
	thumb_func_end ma19_08073BC8

	thumb_func_start ma1A_8073C00
ma1A_8073C00: @ 80771A4
	push {r4,lr}
	ldr r4, _080771CC
	ldr r1, [r4]
	adds r0, r1, 0x1
	str r0, [r4]
	movs r0, 0x1
	ldrsb r0, [r1, r0]
	bl sub_8076F98
	lsls r0, 24
	asrs r0, 24
	bl SE12PanpotControl
	ldr r0, [r4]
	adds r0, 0x1
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080771CC: .4byte gUnknown_0202F7A4
	thumb_func_end ma1A_8073C00

	thumb_func_start ma1B_8073C2C
ma1B_8073C2C: @ 80771D0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _08077280
	mov r10, r0
	ldr r0, [r0]
	adds r1, r0, 0x1
	mov r2, r10
	str r1, [r2]
	ldrb r0, [r0, 0x1]
	mov r9, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	mov r2, r9
	orrs r2, r0
	mov r9, r2
	ldrb r4, [r1, 0x3]
	ldrb r6, [r1, 0x4]
	ldrb r7, [r1, 0x5]
	movs r0, 0x2
	ldrsb r0, [r1, r0]
	bl sub_8076F98
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	asrs r4, 24
	adds r0, r4, 0
	bl sub_8076F98
	mov r8, r0
	lsls r5, 24
	asrs r5, 24
	mov r0, r8
	lsls r0, 24
	asrs r0, 24
	mov r8, r0
	lsls r6, 24
	asrs r6, 24
	adds r0, r5, 0
	mov r1, r8
	adds r2, r6, 0
	bl sub_807712C
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08077284
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08077288
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r5, [r1, 0x8]
	mov r2, r8
	strh r2, [r1, 0xA]
	lsls r4, 24
	asrs r4, 24
	strh r4, [r1, 0xC]
	strh r7, [r1, 0xE]
	strh r5, [r1, 0x10]
	mov r0, r9
	adds r1, r5, 0
	bl PlaySE12WithPanning
	ldr r1, _0807728C
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r1, r10
	ldr r0, [r1]
	adds r0, 0x6
	str r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077280: .4byte gUnknown_0202F7A4
_08077284: .4byte c3_08073CEC
_08077288: .4byte gTasks
_0807728C: .4byte gUnknown_0202F7B3
	thumb_func_end ma1B_8073C2C

	thumb_func_start c3_08073CEC
c3_08073CEC: @ 8077290
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r7, 0
	ldr r1, _080772D4
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0x18]
	adds r1, r0, 0x1
	strh r1, [r2, 0x18]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0xE
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _08077314
	strh r7, [r2, 0x18]
	ldrh r6, [r2, 0x8]
	ldrh r3, [r2, 0xA]
	movs r4, 0x10
	ldrsh r0, [r2, r4]
	movs r4, 0xC
	ldrsh r1, [r2, r4]
	adds r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
	strh r4, [r2, 0x10]
	cmp r1, 0
	bne _080772D8
	lsls r2, r3, 16
	b _080772FC
	.align 2, 0
_080772D4: .4byte gTasks
_080772D8:
	lsls r1, r6, 16
	lsls r0, r3, 16
	asrs r3, r0, 16
	adds r2, r0, 0
	cmp r1, r2
	bge _080772EE
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, r3
	blt _080772F8
	b _080772FC
_080772EE:
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, r3
	bgt _080772F8
	movs r7, 0x1
_080772F8:
	cmp r7, 0
	beq _0807730C
_080772FC:
	lsrs r4, r2, 16
	adds r0, r5, 0
	bl DestroyTask
	ldr r1, _0807731C
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_0807730C:
	lsls r0, r4, 24
	asrs r0, 24
	bl SE12PanpotControl
_08077314:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807731C: .4byte gUnknown_0202F7B3
	thumb_func_end c3_08073CEC

	thumb_func_start sub_8077320
sub_8077320: @ 8077320
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	ldr r0, _080773A4
	mov r9, r0
	ldr r0, [r0]
	adds r1, r0, 0x1
	mov r2, r9
	str r1, [r2]
	ldrb r0, [r0, 0x1]
	mov r8, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	mov r2, r8
	orrs r2, r0
	mov r8, r2
	ldrb r4, [r1, 0x2]
	ldrb r5, [r1, 0x3]
	ldrb r6, [r1, 0x4]
	ldrb r1, [r1, 0x5]
	mov r10, r1
	ldr r0, _080773A8
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080773AC
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	lsls r4, 24
	asrs r4, 24
	strh r4, [r1, 0x8]
	lsls r5, 24
	asrs r5, 24
	strh r5, [r1, 0xA]
	lsls r6, 24
	asrs r6, 24
	strh r6, [r1, 0xC]
	mov r0, r10
	strh r0, [r1, 0xE]
	strh r4, [r1, 0x10]
	mov r0, r8
	adds r1, r4, 0
	bl PlaySE12WithPanning
	ldr r1, _080773B0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r1, r9
	ldr r0, [r1]
	adds r0, 0x6
	str r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080773A4: .4byte gUnknown_0202F7A4
_080773A8: .4byte c3_08073CEC
_080773AC: .4byte gTasks
_080773B0: .4byte gUnknown_0202F7B3
	thumb_func_end sub_8077320

	thumb_func_start sub_80773B4
sub_80773B4: @ 80773B4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _08077464
	mov r10, r0
	ldr r0, [r0]
	adds r1, r0, 0x1
	mov r2, r10
	str r1, [r2]
	ldrb r0, [r0, 0x1]
	mov r9, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	mov r2, r9
	orrs r2, r0
	mov r9, r2
	ldrb r4, [r1, 0x3]
	ldrb r0, [r1, 0x4]
	mov r8, r0
	ldrb r7, [r1, 0x5]
	movs r0, 0x2
	ldrsb r0, [r1, r0]
	bl sub_8077094
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 24
	asrs r4, 24
	adds r0, r4, 0
	bl sub_8077094
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	mov r0, r8
	bl sub_8077094
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08077468
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807746C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	lsls r6, 24
	asrs r6, 24
	strh r6, [r1, 0x8]
	lsls r5, 24
	asrs r5, 24
	strh r5, [r1, 0xA]
	lsls r4, 24
	asrs r4, 24
	strh r4, [r1, 0xC]
	strh r7, [r1, 0xE]
	strh r6, [r1, 0x10]
	mov r0, r9
	adds r1, r6, 0
	bl PlaySE12WithPanning
	ldr r1, _08077470
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r2, r10
	ldr r0, [r2]
	adds r0, 0x6
	str r0, [r2]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077464: .4byte gUnknown_0202F7A4
_08077468: .4byte c3_08073CEC
_0807746C: .4byte gTasks
_08077470: .4byte gUnknown_0202F7B3
	thumb_func_end sub_80773B4

	thumb_func_start ma1C_8073ED0
ma1C_8073ED0: @ 8077474
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	ldr r6, _080774EC
	ldr r0, [r6]
	adds r1, r0, 0x1
	str r1, [r6]
	ldrb r5, [r0, 0x1]
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	orrs r5, r0
	ldrb r0, [r1, 0x3]
	mov r8, r0
	ldrb r2, [r1, 0x4]
	mov r9, r2
	movs r0, 0x2
	ldrsb r0, [r1, r0]
	bl sub_8076F98
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080774F0
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080774F4
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r5, [r1, 0x8]
	lsls r4, 24
	asrs r4, 24
	strh r4, [r1, 0xA]
	mov r2, r8
	strh r2, [r1, 0xC]
	mov r2, r9
	strh r2, [r1, 0xE]
	mov r2, r8
	strh r2, [r1, 0x18]
	ldr r1, [r1]
	bl _call_via_r1
	ldr r1, _080774F8
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0x5
	str r0, [r6]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080774EC: .4byte gUnknown_0202F7A4
_080774F0: .4byte sub_80774FC
_080774F4: .4byte gTasks
_080774F8: .4byte gUnknown_0202F7B3
	thumb_func_end ma1C_8073ED0

	thumb_func_start sub_80774FC
sub_80774FC: @ 80774FC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08077550
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0x18]
	adds r1, r0, 0x1
	strh r1, [r2, 0x18]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0xC
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _0807754A
	movs r0, 0
	strh r0, [r2, 0x18]
	ldrh r0, [r2, 0x8]
	ldrb r1, [r2, 0xA]
	ldrh r4, [r2, 0xE]
	subs r4, 0x1
	strh r4, [r2, 0xE]
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	asrs r1, 24
	bl PlaySE12WithPanning
	cmp r4, 0
	bne _0807754A
	adds r0, r5, 0
	bl DestroyTask
	ldr r1, _08077554
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_0807754A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077550: .4byte gTasks
_08077554: .4byte gUnknown_0202F7B3
	thumb_func_end sub_80774FC

	thumb_func_start ma1D_08073FB4
ma1D_08073FB4: @ 8077558
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r6, _080775BC
	ldr r0, [r6]
	adds r1, r0, 0x1
	str r1, [r6]
	ldrb r5, [r0, 0x1]
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	orrs r5, r0
	ldrb r0, [r1, 0x3]
	mov r8, r0
	movs r0, 0x2
	ldrsb r0, [r1, r0]
	bl sub_8076F98
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080775C0
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080775C4
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r5, [r1, 0x8]
	lsls r4, 24
	asrs r4, 24
	strh r4, [r1, 0xA]
	mov r0, r8
	strh r0, [r1, 0xC]
	ldr r1, _080775C8
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0x4
	str r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080775BC: .4byte gUnknown_0202F7A4
_080775C0: .4byte sub_80775CC
_080775C4: .4byte gTasks
_080775C8: .4byte gUnknown_0202F7B3
	thumb_func_end ma1D_08073FB4

	thumb_func_start sub_80775CC
sub_80775CC: @ 80775CC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08077608
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0xC]
	subs r1, r0, 0x1
	strh r1, [r2, 0xC]
	lsls r0, 16
	cmp r0, 0
	bgt _08077600
	ldrh r0, [r2, 0x8]
	movs r1, 0xA
	ldrsb r1, [r2, r1]
	bl PlaySE12WithPanning
	adds r0, r4, 0
	bl DestroyTask
	ldr r1, _0807760C
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_08077600:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077608: .4byte gTasks
_0807760C: .4byte gUnknown_0202F7B3
	thumb_func_end sub_80775CC

	thumb_func_start sub_8077610
sub_8077610: @ 8077610
	push {r4-r6,lr}
	ldr r4, _08077678
	ldr r1, [r4]
	adds r3, r1, 0x1
	str r3, [r4]
	ldrb r2, [r1, 0x1]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r3, 0x2]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r3, 0x3]
	lsls r0, 24
	adds r6, r2, r0
	adds r0, r1, 0x5
	str r0, [r4]
	ldrb r0, [r1, 0x5]
	adds r1, 0x6
	str r1, [r4]
	cmp r0, 0
	beq _0807765A
	adds r5, r4, 0
	ldr r4, _0807767C
	adds r3, r0, 0
_08077642:
	ldr r2, [r5]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	strh r1, [r4]
	adds r2, 0x2
	str r2, [r5]
	adds r4, 0x2
	subs r3, 0x1
	cmp r3, 0
	bne _08077642
_0807765A:
	adds r0, r6, 0
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r6
	ldr r1, _08077680
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08077678: .4byte gUnknown_0202F7A4
_0807767C: .4byte gUnknown_03004B00
_08077680: .4byte gUnknown_0202F7B3
	thumb_func_end sub_8077610

	thumb_func_start ma20_wait_for_something
ma20_wait_for_something: @ 8077684
	push {r4,r5,lr}
	ldr r0, _080776BC
	ldrb r5, [r0]
	cmp r5, 0
	bne _080776CC
	bl IsSEPlaying
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _080776E4
	ldr r4, _080776C0
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x5A
	bls _080776D2
	ldr r0, _080776C4
	bl m4aMPlayStop
	ldr r0, _080776C8
	bl m4aMPlayStop
	strh r5, [r4]
	b _080776F6
	.align 2, 0
_080776BC: .4byte gUnknown_0202F7B3
_080776C0: .4byte gUnknown_03004AF0
_080776C4: .4byte gMPlay_SE1
_080776C8: .4byte gMPlay_SE2
_080776CC:
	ldr r1, _080776DC
	movs r0, 0
	strh r0, [r1]
_080776D2:
	ldr r1, _080776E0
	movs r0, 0x1
	strb r0, [r1]
	b _080776F6
	.align 2, 0
_080776DC: .4byte gUnknown_03004AF0
_080776E0: .4byte gUnknown_0202F7B0
_080776E4:
	ldr r0, _080776FC
	movs r2, 0
	strh r1, [r0]
	ldr r1, _08077700
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	ldr r0, _08077704
	strb r2, [r0]
_080776F6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080776FC: .4byte gUnknown_03004AF0
_08077700: .4byte gUnknown_0202F7A4
_08077704: .4byte gUnknown_0202F7B0
	thumb_func_end ma20_wait_for_something

	thumb_func_start ma21_08074164
ma21_08074164: @ 8077708
	push {r4-r6,lr}
	ldr r5, _08077748
	ldr r4, [r5]
	adds r3, r4, 0x1
	str r3, [r5]
	ldrb r2, [r4, 0x1]
	ldrb r1, [r3, 0x1]
	ldrb r0, [r3, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldr r0, _0807774C
	lsls r2, 1
	adds r2, r0
	lsls r1, 16
	asrs r1, 16
	movs r6, 0
	ldrsh r0, [r2, r6]
	cmp r1, r0
	bne _08077750
	ldrb r1, [r3, 0x3]
	ldrb r0, [r3, 0x4]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 24
	adds r1, r0
	str r1, [r5]
	b _08077756
	.align 2, 0
_08077748: .4byte gUnknown_0202F7A4
_0807774C: .4byte gUnknown_03004B00
_08077750:
	adds r0, r4, 0
	adds r0, 0x8
	str r0, [r5]
_08077756:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end ma21_08074164

	thumb_func_start sub_807775C
sub_807775C: @ 807775C
	push {r4,lr}
	ldr r4, _0807778C
	ldr r0, [r4]
	adds r0, 0x1
	str r0, [r4]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08077790
	ldr r2, [r4]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	adds r1, r0
	str r1, [r4]
	b _08077796
	.align 2, 0
_0807778C: .4byte gUnknown_0202F7A4
_08077790:
	ldr r0, [r4]
	adds r0, 0x4
	str r0, [r4]
_08077796:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_807775C

	thumb_func_start sub_807779C
sub_807779C: @ 807779C
	push {r4,lr}
	ldr r0, _080777B0
	ldr r1, [r0]
	ldrb r2, [r1, 0x1]
	adds r1, 0x2
	str r1, [r0]
	cmp r2, 0
	beq _080777B8
	ldr r0, _080777B4
	b _080777BA
	.align 2, 0
_080777B0: .4byte gUnknown_0202F7A4
_080777B4: .4byte gUnknown_0202F7C9
_080777B8:
	ldr r0, _080777FC
_080777BA:
	ldrb r0, [r0]
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080777F4
	cmp r4, 0
	beq _080777D6
	cmp r4, 0x3
	bne _080777F4
_080777D6:
	ldr r3, _08077800
	ldrb r2, [r3]
	movs r1, 0x4
	negs r1, r1
	adds r0, r1, 0
	ands r0, r2
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r3]
	ldr r2, _08077804
	ldrb r0, [r2]
	ands r1, r0
	movs r0, 0x2
	orrs r1, r0
	strb r1, [r2]
_080777F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080777FC: .4byte gUnknown_0202F7C8
_08077800: .4byte REG_BG1CNT
_08077804: .4byte REG_BG2CNT
	thumb_func_end sub_807779C

	thumb_func_start sub_8077808
sub_8077808: @ 8077808
	push {lr}
	ldr r0, _08077840
	ldr r1, [r0]
	adds r1, 0x1
	str r1, [r0]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0807783A
	ldr r3, _08077844
	ldrb r2, [r3]
	movs r1, 0x4
	negs r1, r1
	adds r0, r1, 0
	ands r0, r2
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r3]
	ldr r2, _08077848
	ldrb r0, [r2]
	ands r1, r0
	movs r0, 0x2
	orrs r1, r0
	strb r1, [r2]
_0807783A:
	pop {r0}
	bx r0
	.align 2, 0
_08077840: .4byte gUnknown_0202F7A4
_08077844: .4byte REG_BG1CNT
_08077848: .4byte REG_BG2CNT
	thumb_func_end sub_8077808

	thumb_func_start sub_807784C
sub_807784C: @ 807784C
	push {r4-r7,lr}
	ldr r1, _0807787C
	ldr r0, [r1]
	ldrb r6, [r0, 0x1]
	adds r0, 0x2
	str r0, [r1]
	ldr r7, _08077880
	ldrb r0, [r7]
	bl battle_side_get_owner
	adds r4, r0, 0
	ldr r5, _08077884
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _080778C2
	cmp r6, 0
	beq _08077888
	ldrb r0, [r5]
	b _0807788A
	.align 2, 0
_0807787C: .4byte gUnknown_0202F7A4
_08077880: .4byte gUnknown_0202F7C8
_08077884: .4byte gUnknown_0202F7C9
_08077888:
	ldrb r0, [r7]
_0807788A:
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080778C2
	cmp r4, 0
	beq _080778A4
	cmp r4, 0x3
	bne _080778C2
_080778A4:
	ldr r3, _080778C8
	ldrb r2, [r3]
	movs r1, 0x4
	negs r1, r1
	adds r0, r1, 0
	ands r0, r2
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r3]
	ldr r2, _080778CC
	ldrb r0, [r2]
	ands r1, r0
	movs r0, 0x2
	orrs r1, r0
	strb r1, [r2]
_080778C2:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080778C8: .4byte REG_BG1CNT
_080778CC: .4byte REG_BG2CNT
	thumb_func_end sub_807784C

	thumb_func_start ma2B_make_side_invisible
ma2B_make_side_invisible: @ 80778D0
	push {r4,lr}
	ldr r4, _08077904
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080778F8
	ldr r1, _08077908
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_080778F8:
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077904: .4byte gUnknown_0202F7A4
_08077908: .4byte gSprites
	thumb_func_end ma2B_make_side_invisible

	thumb_func_start ma2C_make_side_visible
ma2C_make_side_visible: @ 807790C
	push {r4,lr}
	ldr r4, _08077944
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _08077936
	ldr r1, _08077948
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_08077936:
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077944: .4byte gUnknown_0202F7A4
_08077948: .4byte gSprites
	thumb_func_end ma2C_make_side_visible

	thumb_func_start sub_807794C
sub_807794C: @ 807794C
	push {r4-r7,lr}
	ldr r1, _08077998
	ldr r0, [r1]
	ldrb r7, [r0, 0x1]
	adds r0, 0x2
	str r0, [r1]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080779F6
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _080779F6
	ldr r6, _0807799C
	ldrb r0, [r6]
	bl battle_side_get_owner
	adds r4, r0, 0
	ldr r5, _080779A0
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080779F6
	cmp r7, 0
	bne _080779A4
	ldrb r0, [r6]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	b _080779B0
	.align 2, 0
_08077998: .4byte gUnknown_0202F7A4
_0807799C: .4byte gUnknown_0202F7C8
_080779A0: .4byte gUnknown_0202F7C9
_080779A4:
	ldrb r0, [r5]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x1
_080779B0:
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080779F6
	ldr r1, _080779EC
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r2, r0, r1
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	cmp r4, 0x2
	bne _080779E0
	ldrb r0, [r2, 0x5]
	movs r1, 0xC
	orrs r0, r1
	strb r0, [r2, 0x5]
_080779E0:
	cmp r4, 0x1
	bne _080779F0
	movs r0, 0
	bl sub_8076464
	b _080779F6
	.align 2, 0
_080779EC: .4byte gSprites
_080779F0:
	movs r0, 0x1
	bl sub_8076464
_080779F6:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_807794C

	thumb_func_start sub_80779FC
sub_80779FC: @ 80779FC
	push {r4-r7,lr}
	ldr r1, _08077A48
	ldr r0, [r1]
	ldrb r7, [r0, 0x1]
	adds r0, 0x2
	str r0, [r1]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08077A88
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _08077A88
	ldr r6, _08077A4C
	ldrb r0, [r6]
	bl battle_side_get_owner
	adds r4, r0, 0
	ldr r5, _08077A50
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _08077A88
	cmp r7, 0
	bne _08077A54
	ldrb r0, [r6]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	b _08077A60
	.align 2, 0
_08077A48: .4byte gUnknown_0202F7A4
_08077A4C: .4byte gUnknown_0202F7C8
_08077A50: .4byte gUnknown_0202F7C9
_08077A54:
	ldrb r0, [r5]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x1
_08077A60:
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _08077A88
	cmp r4, 0x2
	bne _08077A88
	ldr r1, _08077A90
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0, 0x5]
_08077A88:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077A90: .4byte gSprites
	thumb_func_end sub_80779FC

	thumb_func_start ma2F_stop_music
ma2F_stop_music: @ 8077A94
	push {lr}
	ldr r0, _08077AB0
	bl m4aMPlayStop
	ldr r0, _08077AB4
	bl m4aMPlayStop
	ldr r1, _08077AB8
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08077AB0: .4byte gMPlay_SE1
_08077AB4: .4byte gMPlay_SE2
_08077AB8: .4byte gUnknown_0202F7A4
	thumb_func_end ma2F_stop_music

	thumb_func_start sub_8077ABC
sub_8077ABC: @ 8077ABC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08077ADA
	cmp r4, 0x3
	bne _08077ADA
	cmp r5, 0x3
	bne _08077ADA
	movs r4, 0x1
_08077ADA:
	cmp r4, 0x4
	bhi _08077B50
	lsls r0, r4, 2
	ldr r1, _08077AE8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08077AE8: .4byte _08077AEC
	.align 2, 0
_08077AEC:
	.4byte _08077B00
	.4byte _08077B28
	.4byte _08077B00
	.4byte _08077B50
	.4byte _08077B50
_08077B00:
	ldr r4, _08077B20
	adds r0, r5, 0
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 22
	ldr r1, _08077B24
	ldrh r2, [r1]
	movs r1, 0x1
	ands r1, r2
	lsls r1, 4
	adds r0, r1
	adds r0, r4
	ldrb r0, [r0]
	b _08077BF4
	.align 2, 0
_08077B20: .4byte gUnknown_0837F578
_08077B24: .4byte gUnknown_020239F8
_08077B28:
	ldr r4, _08077B48
	adds r0, r5, 0
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 22
	ldr r1, _08077B4C
	ldrh r2, [r1]
	movs r1, 0x1
	ands r1, r2
	lsls r1, 4
	adds r0, r1
	adds r0, r4
	ldrb r0, [r0, 0x1]
	b _08077BF4
	.align 2, 0
_08077B48: .4byte gUnknown_0837F578
_08077B4C: .4byte gUnknown_020239F8
_08077B50:
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08077B74
	ldr r2, _08077B6C
	ldrb r1, [r2, 0x4]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08077B70
	ldrh r1, [r2, 0x2]
	b _08077BDE
	.align 2, 0
_08077B6C: .4byte 0x02019348
_08077B70:
	ldrh r1, [r2]
	b _08077BDE
_08077B74:
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08077BA8
	lsls r0, r5, 2
	ldr r1, _08077B9C
	adds r1, r0, r1
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08077BDC
	ldr r1, _08077BA0
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08077BA4
	b _08077BC2
	.align 2, 0
_08077B9C: .4byte 0x02017800
_08077BA0: .4byte gUnknown_02024A6A
_08077BA4: .4byte gEnemyParty
_08077BA8:
	lsls r0, r5, 2
	ldr r1, _08077BD0
	adds r1, r0, r1
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08077BDC
	ldr r1, _08077BD4
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08077BD8
_08077BC2:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	b _08077BDE
	.align 2, 0
_08077BD0: .4byte 0x02017800
_08077BD4: .4byte gUnknown_02024A6A
_08077BD8: .4byte gPlayerParty
_08077BDC:
	ldrh r1, [r1, 0x2]
_08077BDE:
	cmp r4, 0x3
	bne _08077BE8
	adds r0, r5, 0
	movs r2, 0x1
	b _08077BEC
_08077BE8:
	adds r0, r5, 0
	movs r2, 0
_08077BEC:
	bl sub_8077E44
	lsls r0, 24
	lsrs r0, 24
_08077BF4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8077ABC

	thumb_func_start sub_8077BFC
sub_8077BFC: @ 8077BFC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 16
	lsrs r5, r1, 16
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08077C1C
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08077D04
_08077C1C:
	cmp r5, 0xC9
	bne _08077CCC
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08077C44
	ldr r2, _08077C3C
	ldrb r1, [r2, 0x4]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08077C40
	ldr r2, [r2, 0x10]
	b _08077C7E
	.align 2, 0
_08077C3C: .4byte 0x02019348
_08077C40:
	ldr r2, [r2, 0x8]
	b _08077C7E
_08077C44:
	lsls r1, r4, 2
	ldr r0, _08077C6C
	adds r0, r1, r0
	ldrh r0, [r0, 0x2]
	cmp r0, 0
	bne _08077C78
	ldr r1, _08077C70
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08077C74
	adds r0, r1
	movs r1, 0
	bl GetMonData
	adds r2, r0, 0
	b _08077C7E
	.align 2, 0
_08077C6C: .4byte 0x02017800
_08077C70: .4byte gUnknown_02024A6A
_08077C74: .4byte gPlayerParty
_08077C78:
	ldr r0, _08077CB4
	adds r0, r1, r0
	ldr r2, [r0]
_08077C7E:
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r2
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r2
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r2
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r2
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _08077CB8
	adds r0, r5, 0
	b _08077CC2
	.align 2, 0
_08077CB4: .4byte gUnknown_02024E70
_08077CB8:
	movs r1, 0xCE
	lsls r1, 1
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
_08077CC2:
	ldr r1, _08077CC8
	lsls r0, 2
	b _08077DC8
	.align 2, 0
_08077CC8: .4byte gMonBackPicCoords
_08077CCC:
	ldr r0, _08077CE0
	cmp r5, r0
	bne _08077CEC
	ldr r0, _08077CE4
	ldr r1, _08077CE8
	adds r1, r4, r1
	ldrb r1, [r1]
	adds r1, r0
	ldrb r0, [r1]
	b _08077DCC
	.align 2, 0
_08077CE0: .4byte SPECIES_CASTFORM
_08077CE4: .4byte gUnknown_0837F5AC
_08077CE8: .4byte gUnknown_02024E84
_08077CEC:
	movs r0, 0xCE
	lsls r0, 1
	cmp r5, r0
	bls _08077CFC
	ldr r0, _08077CF8
	b _08077DCA
	.align 2, 0
_08077CF8: .4byte gMonBackPicCoords
_08077CFC:
	ldr r1, _08077D00
	b _08077DC6
	.align 2, 0
_08077D00: .4byte gMonBackPicCoords
_08077D04:
	cmp r5, 0xC9
	bne _08077D90
	lsls r1, r4, 2
	ldr r0, _08077D30
	adds r0, r1, r0
	ldrh r0, [r0, 0x2]
	cmp r0, 0
	bne _08077D3C
	ldr r1, _08077D34
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08077D38
	adds r0, r1
	movs r1, 0
	bl GetMonData
	adds r2, r0, 0
	b _08077D42
	.align 2, 0
_08077D30: .4byte 0x02017800
_08077D34: .4byte gUnknown_02024A6A
_08077D38: .4byte gEnemyParty
_08077D3C:
	ldr r0, _08077D78
	adds r0, r1, r0
	ldr r2, [r0]
_08077D42:
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r2
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r2
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r2
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r2
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _08077D7C
	adds r0, r5, 0
	b _08077D86
	.align 2, 0
_08077D78: .4byte gUnknown_02024E70
_08077D7C:
	movs r1, 0xCE
	lsls r1, 1
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
_08077D86:
	ldr r1, _08077D8C
	lsls r0, 2
	b _08077DC8
	.align 2, 0
_08077D8C: .4byte gMonFrontPicCoords
_08077D90:
	ldr r0, _08077DA8
	cmp r5, r0
	bne _08077DB4
	ldr r0, _08077DAC
	ldr r1, _08077DB0
	adds r1, r4, r1
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	b _08077DCC
	.align 2, 0
_08077DA8: .4byte SPECIES_CASTFORM
_08077DAC: .4byte gUnknownCastformCoords_0837F598
_08077DB0: .4byte gUnknown_02024E84
_08077DB4:
	movs r0, 0xCE
	lsls r0, 1
	cmp r5, r0
	bls _08077DC4
	ldr r0, _08077DC0
	b _08077DCA
	.align 2, 0
_08077DC0: .4byte gMonFrontPicCoords
_08077DC4:
	ldr r1, _08077DD4
_08077DC6:
	lsls r0, r5, 2
_08077DC8:
	adds r0, r1
_08077DCA:
	ldrb r0, [r0, 0x1]
_08077DCC:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08077DD4: .4byte gMonFrontPicCoords
	thumb_func_end sub_8077BFC

	thumb_func_start sub_8077DD8
sub_8077DD8: @ 8077DD8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	adds r7, r4, 0
	movs r5, 0
	adds r0, r6, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08077E36
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08077E36
	ldr r0, _08077E14
	cmp r4, r0  @ check if the given pokemon species is Castform
	bne _08077E20
	ldr r0, _08077E18
	ldr r1, _08077E1C
	adds r1, r6, r1
	ldrb r1, [r1]
	adds r1, r0
	ldrb r5, [r1]
	b _08077E36
	.align 2, 0
_08077E14: .4byte SPECIES_CASTFORM
_08077E18: .4byte gUnknownCastformData_0837F5A8
_08077E1C: .4byte gUnknown_02024E84
_08077E20:
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	bls _08077E30
	ldr r0, _08077E2C
	b _08077E34
	.align 2, 0
_08077E2C: .4byte gEnemyMonElevation
_08077E30:
	ldr r0, _08077E40
	adds r0, r7, r0
_08077E34:
	ldrb r5, [r0]
_08077E36:
	adds r0, r5, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08077E40: .4byte gEnemyMonElevation
	thumb_func_end sub_8077DD8

	thumb_func_start sub_8077E44
sub_8077E44: @ 8077E44
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 24
	lsrs r7, r2, 24
	adds r0, r6, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08077E68
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08077E76
_08077E68:
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_8077BFC
	lsls r0, 24
	lsrs r4, r0, 24
	b _08077E94
_08077E76:
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_8077BFC
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_8077DD8
	lsls r0, 24
	lsrs r0, 24
	subs r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
_08077E94:
	adds r0, r6, 0
	bl battle_get_per_side_status
	ldr r3, _08077EDC
	lsls r0, 24
	lsrs r0, 22
	ldr r1, _08077EE0
	ldrh r2, [r1]
	movs r1, 0x1
	ands r1, r2
	lsls r1, 4
	adds r0, r1
	adds r0, r3
	ldrb r0, [r0, 0x1]
	adds r0, r4
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r7, 0
	beq _08077ED4
	adds r0, r6, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08077ECE
	adds r0, r4, 0
	adds r0, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
_08077ECE:
	cmp r4, 0x68
	bls _08077ED4
	movs r4, 0x68
_08077ED4:
	adds r0, r4, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08077EDC: .4byte gUnknown_0837F578
_08077EE0: .4byte gUnknown_020239F8
	thumb_func_end sub_8077E44

	thumb_func_start sub_8077EE4
sub_8077EE4: @ 8077EE4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	movs r0, 0xFD
	lsls r0, 24
	adds r1, r0
	lsrs r1, 24
	cmp r1, 0x1
	bhi _08077F56
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08077F1C
	ldr r2, _08077F14
	ldrb r1, [r2, 0x4]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08077F18
	ldrh r1, [r2, 0x2]
	b _08077F3E
	.align 2, 0
_08077F14: .4byte 0x02019348
_08077F18:
	ldrh r1, [r2]
	b _08077F3E
_08077F1C:
	lsls r0, r4, 2
	ldr r1, _08077F34
	adds r1, r0, r1
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08077F3C
	ldr r1, _08077F38
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	b _08077F3E
	.align 2, 0
_08077F34: .4byte 0x02017800
_08077F38: .4byte gUnknown_0202F7CA
_08077F3C:
	ldrh r1, [r1, 0x2]
_08077F3E:
	cmp r5, 0x3
	bne _08077F4C
	adds r0, r4, 0
	movs r2, 0x1
	bl sub_8077E44
	b _08077F5E
_08077F4C:
	adds r0, r4, 0
	movs r2, 0
	bl sub_8077E44
	b _08077F5E
_08077F56:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8077ABC
_08077F5E:
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8077EE4

	thumb_func_start sub_8077F68
sub_8077F68: @ 8077F68
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x4
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8077F68

	thumb_func_start sub_8077F7C
sub_8077F7C: @ 8077F7C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08077FA0
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 8
	movs r1, 0x80
	lsls r1, 13
	b _08077FB0
_08077FA0:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 8
	movs r1, 0x88
	lsls r1, 13
_08077FB0:
	adds r0, r1
	lsrs r0, 16
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8077F7C

	thumb_func_start sub_8077FC0
sub_8077FC0: @ 8077FC0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r6, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08078060
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08078010
	lsls r0, r5, 2
	ldr r1, _08078004
	adds r1, r0, r1
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08078044
	ldr r1, _08078008
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0807800C
	b _0807802A
	.align 2, 0
_08078004: .4byte 0x02017800
_08078008: .4byte gUnknown_02024A6A
_0807800C: .4byte gEnemyParty
_08078010:
	lsls r0, r5, 2
	ldr r1, _08078038
	adds r1, r0, r1
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08078044
	ldr r1, _0807803C
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08078040
_0807802A:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	b _08078046
	.align 2, 0
_08078038: .4byte 0x02017800
_0807803C: .4byte gUnknown_02024A6A
_08078040: .4byte gPlayerParty
_08078044:
	ldrh r4, [r1, 0x2]
_08078046:
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08078060
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8077DD8
	subs r0, r6, r0
	lsls r0, 24
	lsrs r6, r0, 24
_08078060:
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8077FC0

	thumb_func_start obj_id_for_side_relative_to_move
obj_id_for_side_relative_to_move: @ 8078068
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0
	bne _08078090
	ldr r4, _08078088
	ldrb r0, [r4]
	bl sub_8078874
	lsls r0, 24
	cmp r0, 0
	beq _080780DE
	ldr r1, _0807808C
	ldrb r0, [r4]
	b _080780EE
	.align 2, 0
_08078088: .4byte gUnknown_0202F7C8
_0807808C: .4byte gUnknown_02024BE0
_08078090:
	cmp r0, 0x1
	bne _080780B0
	ldr r4, _080780A8
	ldrb r0, [r4]
	bl sub_8078874
	lsls r0, 24
	cmp r0, 0
	beq _080780DE
	ldr r1, _080780AC
	ldrb r0, [r4]
	b _080780EE
	.align 2, 0
_080780A8: .4byte gUnknown_0202F7C9
_080780AC: .4byte gUnknown_02024BE0
_080780B0:
	cmp r1, 0x2
	bne _080780CC
	ldr r5, _080780C8
	ldrb r0, [r5]
	movs r4, 0x2
	eors r0, r4
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080780DE
	b _080780E8
	.align 2, 0
_080780C8: .4byte gUnknown_0202F7C8
_080780CC:
	ldr r5, _080780E4
	ldrb r0, [r5]
	movs r4, 0x2
	eors r0, r4
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	bne _080780E8
_080780DE:
	movs r0, 0xFF
	b _080780F2
	.align 2, 0
_080780E4: .4byte gUnknown_0202F7C9
_080780E8:
	ldr r1, _080780F8
	ldrb r0, [r5]
	eors r0, r4
_080780EE:
	adds r0, r1
	ldrb r0, [r0]
_080780F2:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080780F8: .4byte gUnknown_02024BE0
	thumb_func_end obj_id_for_side_relative_to_move

	thumb_func_start oamt_set_x3A_32
oamt_set_x3A_32: @ 80780FC
	strh r1, [r0, 0x3A]
	lsrs r1, 16
	strh r1, [r0, 0x3C]
	bx lr
	thumb_func_end oamt_set_x3A_32

	thumb_func_start sub_8078104
sub_8078104: @ 8078104
	ldrh r2, [r0, 0x3A]
	movs r3, 0x3C
	ldrsh r1, [r0, r3]
	lsls r1, 16
	orrs r2, r1
	str r2, [r0, 0x1C]
	bx lr
	thumb_func_end sub_8078104

	thumb_func_start sub_8078114
sub_8078114: @ 8078114
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08078168
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x2E]
	adds r1, r0, r2
	strh r1, [r4, 0x2E]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _08078154
	ldr r2, _08078150
	b _0807815C
	.align 2, 0
_08078150: .4byte 0xffffff00
_08078154:
	cmp r0, 0
	bge _08078160
	movs r2, 0x80
	lsls r2, 1
_0807815C:
	adds r0, r1, r2
	strh r0, [r4, 0x2E]
_08078160:
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x34]
	b _0807816E
_08078168:
	adds r0, r4, 0
	bl sub_8078104
_0807816E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078114

	thumb_func_start sub_8078174
sub_8078174: @ 8078174
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080781E4
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	ldrh r1, [r4, 0x38]
	lsls r1, 16
	asrs r1, 24
	ldrh r2, [r4, 0x30]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, 0x38]
	lsls r1, 16
	asrs r1, 24
	ldrh r2, [r4, 0x30]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x2E]
	adds r1, r0, r2
	strh r1, [r4, 0x2E]
	ldrh r0, [r4, 0x36]
	ldrh r2, [r4, 0x38]
	adds r0, r2
	strh r0, [r4, 0x38]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _080781D0
	ldr r2, _080781CC
	b _080781D8
	.align 2, 0
_080781CC: .4byte 0xffffff00
_080781D0:
	cmp r0, 0
	bge _080781DC
	movs r2, 0x80
	lsls r2, 1
_080781D8:
	adds r0, r1, r2
	strh r0, [r4, 0x2E]
_080781DC:
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x34]
	b _080781EA
_080781E4:
	adds r0, r4, 0
	bl sub_8078104
_080781EA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078174

	thumb_func_start unref_sub_80781F0
unref_sub_80781F0: @ 80781F0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0807826C
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x2E]
	adds r1, r0, r2
	strh r1, [r4, 0x2E]
	ldrh r0, [r4, 0x38]
	ldrh r2, [r4, 0x36]
	adds r0, r2
	strh r0, [r4, 0x36]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _08078238
	ldr r2, _08078234
	b _08078240
	.align 2, 0
_08078234: .4byte 0xffffff00
_08078238:
	cmp r0, 0
	bge _08078244
	movs r2, 0x80
	lsls r2, 1
_08078240:
	adds r0, r1, r2
	strh r0, [r4, 0x2E]
_08078244:
	ldrh r1, [r4, 0x36]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	cmp r0, 0xFF
	ble _08078258
	ldr r2, _08078254
	b _08078260
	.align 2, 0
_08078254: .4byte 0xffffff00
_08078258:
	cmp r0, 0
	bge _08078264
	movs r2, 0x80
	lsls r2, 1
_08078260:
	adds r0, r1, r2
	strh r0, [r4, 0x36]
_08078264:
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x34]
	b _08078272
_0807826C:
	adds r0, r4, 0
	bl sub_8078104
_08078272:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_80781F0

	thumb_func_start sub_8078278
sub_8078278: @ 8078278
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080782CC
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x2E]
	adds r1, r0, r2
	strh r1, [r4, 0x2E]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _080782B8
	ldr r2, _080782B4
	b _080782C0
	.align 2, 0
_080782B4: .4byte 0xffffff00
_080782B8:
	cmp r0, 0
	bge _080782C4
	movs r2, 0x80
	lsls r2, 1
_080782C0:
	adds r0, r1, r2
	strh r0, [r4, 0x2E]
_080782C4:
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x34]
	b _080782D2
_080782CC:
	adds r0, r4, 0
	bl sub_8078104
_080782D2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078278

	thumb_func_start sub_80782D8
sub_80782D8: @ 80782D8
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r1, r3]
	cmp r0, 0
	ble _080782EC
	subs r0, r2, 0x1
	strh r0, [r1, 0x2E]
	b _080782F2
_080782EC:
	adds r0, r1, 0
	bl sub_8078104
_080782F2:
	pop {r0}
	bx r0
	thumb_func_end sub_80782D8

	thumb_func_start sub_80782F8
sub_80782F8: @ 80782F8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078314
	ldr r1, _08078310
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078310: .4byte sub_8078364
	thumb_func_end sub_80782F8

	thumb_func_start sub_8078314
sub_8078314: @ 8078314
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _0807832A
	ldrh r0, [r4, 0x2E]
	negs r0, r0
	strh r0, [r4, 0x2E]
_0807832A:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	subs r0, r1
	ldrh r5, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	bl __divsi3
	cmp r0, 0
	bge _08078344
	negs r0, r0
_08078344:
	strh r0, [r4, 0x2E]
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	subs r0, r1
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	bl __divsi3
	strh r0, [r4, 0x32]
	strh r5, [r4, 0x30]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8078314

	thumb_func_start sub_8078364
sub_8078364: @ 8078364
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r1, r3]
	cmp r0, 0
	ble _08078388
	subs r0, r2, 0x1
	strh r0, [r1, 0x2E]
	ldrh r0, [r1, 0x30]
	ldrh r2, [r1, 0x24]
	adds r0, r2
	strh r0, [r1, 0x24]
	ldrh r0, [r1, 0x32]
	ldrh r3, [r1, 0x26]
	adds r0, r3
	strh r0, [r1, 0x26]
	b _0807838E
_08078388:
	adds r0, r1, 0
	bl sub_8078104
_0807838E:
	pop {r0}
	bx r0
	thumb_func_end sub_8078364

	thumb_func_start sub_8078394
sub_8078394: @ 8078394
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	cmp r0, 0
	ble _080783C4
	subs r0, r1, 0x1
	strh r0, [r2, 0x2E]
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x34]
	adds r0, r1
	strh r0, [r2, 0x34]
	ldrh r1, [r2, 0x32]
	ldrh r3, [r2, 0x36]
	adds r1, r3
	strh r1, [r2, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r2, 0x24]
	lsls r1, 16
	asrs r1, 24
	strh r1, [r2, 0x26]
	b _080783CA
_080783C4:
	adds r0, r2, 0
	bl sub_8078104
_080783CA:
	pop {r0}
	bx r0
	thumb_func_end sub_8078394

	thumb_func_start sub_80783D0
sub_80783D0: @ 80783D0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _08078400
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	ldrh r1, [r4, 0x32]
	ldrh r2, [r4, 0x36]
	adds r1, r2
	strh r1, [r4, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	lsls r1, 16
	asrs r1, 24
	strh r1, [r4, 0x26]
	b _08078406
_08078400:
	adds r0, r4, 0
	bl sub_8078104
_08078406:
	adds r0, r4, 0
	bl sub_809D638
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80783D0

	thumb_func_start unref_sub_8078414
unref_sub_8078414: @ 8078414
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x26]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x34]
	ldr r5, _08078450
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	ldr r0, _08078454
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08078450: .4byte gUnknown_0202F7C9
_08078454: .4byte sub_80782F8
	thumb_func_end unref_sub_8078414

	thumb_func_start sub_8078458
sub_8078458: @ 8078458
	push {r4,lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r3, r2]
	cmp r0, 0
	ble _0807849C
	subs r0, r1, 0x1
	strh r0, [r3, 0x2E]
	ldr r2, _08078498
	movs r4, 0x34
	ldrsh r1, [r3, r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x30]
	ldrh r4, [r0, 0x24]
	adds r1, r4
	strh r1, [r0, 0x24]
	movs r0, 0x34
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x32]
	ldrh r2, [r0, 0x26]
	adds r1, r2
	strh r1, [r0, 0x26]
	b _080784A2
	.align 2, 0
_08078498: .4byte gSprites
_0807849C:
	adds r0, r3, 0
	bl sub_8078104
_080784A2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078458

	thumb_func_start sub_80784A8
sub_80784A8: @ 80784A8
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080784F8
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x30]
	ldrh r0, [r4, 0x34]
	adds r1, r0
	strh r1, [r4, 0x34]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x36]
	adds r0, r2
	strh r0, [r4, 0x36]
	ldr r3, _080784F4
	movs r0, 0x38
	ldrsh r2, [r4, r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	lsls r1, 16
	asrs r1, 24
	strh r1, [r0, 0x24]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r1, 0x26]
	b _080784FE
	.align 2, 0
_080784F4: .4byte gSprites
_080784F8:
	adds r0, r4, 0
	bl sub_8078104
_080784FE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80784A8

	thumb_func_start sub_8078504
sub_8078504: @ 8078504
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _08078566
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x32]
	lsls r0, r1, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x30]
	adds r1, r0
	strh r1, [r4, 0x32]
	ldrh r1, [r4, 0x36]
	lsls r0, r1, 16
	asrs r0, 24
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x34]
	adds r1, r0
	strh r1, [r4, 0x36]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl __modsi3
	cmp r0, 0
	bne _0807856C
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0807856C
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _0807856C
_08078566:
	adds r0, r4, 0
	bl sub_8078104
_0807856C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078504

	thumb_func_start move_anim_8074EE0
move_anim_8074EE0: @ 8078574
	push {r4,lr}
	adds r4, r0, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl move_anim_8072740
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end move_anim_8074EE0

	thumb_func_start unref_sub_8078588
unref_sub_8078588: @ 8078588
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x26]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x34]
	ldr r5, _080785C4
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	ldr r0, _080785C8
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080785C4: .4byte gUnknown_0202F7C8
_080785C8: .4byte sub_80782F8
	thumb_func_end unref_sub_8078588

	thumb_func_start unref_sub_80785CC
unref_sub_80785CC: @ 80785CC
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x38]
	bl ResetPaletteStructByUid
	adds r0, r4, 0
	bl move_anim_8074EE0
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_80785CC

	thumb_func_start sub_80785E4
sub_80785E4: @ 80785E4
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080785FA
	adds r0, r2, 0
	bl sub_8078104
_080785FA:
	pop {r0}
	bx r0
	thumb_func_end sub_80785E4

	thumb_func_start sub_8078600
sub_8078600: @ 8078600
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08078616
	adds r0, r2, 0
	bl sub_8078104
_08078616:
	pop {r0}
	bx r0
	thumb_func_end sub_8078600

	thumb_func_start sub_807861C
sub_807861C: @ 807861C
	push {lr}
	ldr r1, _08078630
	movs r2, 0
	strh r2, [r1]
	adds r1, 0x2
	strh r2, [r1]
	bl move_anim_8072740
	pop {r0}
	bx r0
	.align 2, 0
_08078630: .4byte REG_BLDCNT
	thumb_func_end sub_807861C

	thumb_func_start sub_8078634
sub_8078634: @ 8078634
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0807864C
	movs r2, 0
	strh r2, [r1]
	adds r1, 0x2
	strh r2, [r1]
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_0807864C: .4byte REG_BLDCNT
	thumb_func_end sub_8078634

	thumb_func_start sub_8078650
sub_8078650: @ 8078650
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _08078678
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08078678: .4byte gUnknown_0202F7C8
	thumb_func_end sub_8078650

	thumb_func_start sub_807867C
sub_807867C: @ 807867C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	mov r8, r5
	ldr r7, _080786B4
	ldrb r0, [r7]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080786B8
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bhi _080786C8
	cmp r6, r0
	bcs _080786BC
	lsls r0, r5, 16
	b _080786D8
	.align 2, 0
_080786B4: .4byte gUnknown_0202F7C8
_080786B8: .4byte gUnknown_0202F7C9
_080786BC:
	ldrb r0, [r7]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080786D4
_080786C8:
	ldrh r1, [r4, 0x20]
	lsls r0, r5, 16
	asrs r0, 16
	subs r1, r0
	strh r1, [r4, 0x20]
	b _080786E0
_080786D4:
	mov r1, r8
	lsls r0, r1, 16
_080786D8:
	asrs r0, 16
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
_080786E0:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_807867C

	thumb_func_start sub_80786EC
sub_80786EC: @ 80786EC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	movs r5, 0
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	movs r0, 0x80
	lsls r0, 8
	bl __divsi3
	strh r0, [r4, 0x3A]
	strh r5, [r4, 0x3C]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80786EC

	thumb_func_start sub_8078718
sub_8078718: @ 8078718
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	bne _08078744
	ldrh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x3C]
	adds r0, r1
	strh r0, [r4, 0x3C]
	lsls r0, 16
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	movs r0, 0
	b _08078746
_08078744:
	movs r0, 0x1
_08078746:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8078718

	thumb_func_start oamt_add_pos2_onto_pos1
oamt_add_pos2_onto_pos1: @ 807874C
	ldrh r1, [r0, 0x24]
	ldrh r2, [r0, 0x20]
	adds r1, r2
	movs r2, 0
	strh r1, [r0, 0x20]
	ldrh r1, [r0, 0x26]
	ldrh r3, [r0, 0x22]
	adds r1, r3
	strh r1, [r0, 0x22]
	strh r2, [r0, 0x24]
	strh r2, [r0, 0x26]
	bx lr
	thumb_func_end oamt_add_pos2_onto_pos1

	thumb_func_start sub_8078764
sub_8078764: @ 8078764
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	cmp r1, 0
	bne _0807878C
	ldr r4, _080787A8
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077EE4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077EE4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
_0807878C:
	ldr r4, _080787AC
	movs r0, 0
	ldrsh r1, [r4, r0]
	adds r0, r5, 0
	bl sub_807867C
	ldrh r0, [r4, 0x2]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080787A8: .4byte gUnknown_0202F7C9
_080787AC: .4byte gUnknown_03004B00
	thumb_func_end sub_8078764

	thumb_func_start sub_80787B0
sub_80787B0: @ 80787B0
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	cmp r1, 0
	bne _080787D4
	ldr r4, _080787D0
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077EE4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	b _080787E8
	.align 2, 0
_080787D0: .4byte gUnknown_0202F7C8
_080787D4:
	ldr r4, _0807880C
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077EE4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
_080787E8:
	bl sub_8077EE4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r4, _08078810
	movs r0, 0
	ldrsh r1, [r4, r0]
	adds r0, r5, 0
	bl sub_807867C
	ldrh r0, [r4, 0x2]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807880C: .4byte gUnknown_0202F7C8
_08078810: .4byte gUnknown_03004B00
	thumb_func_end sub_80787B0

	thumb_func_start battle_side_get_owner
battle_side_get_owner: @ 8078814
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08078824
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_08078824: .4byte gUnknown_02024A72
	thumb_func_end battle_side_get_owner

	thumb_func_start battle_get_per_side_status
battle_get_per_side_status: @ 8078828
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08078834
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08078834: .4byte gUnknown_02024A72
	thumb_func_end battle_get_per_side_status

	thumb_func_start battle_get_side_with_given_state
battle_get_side_with_given_state: @ 8078838
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r1, 0
	ldr r0, _0807886C
	ldrb r2, [r0]
	cmp r1, r2
	bcs _08078862
	ldr r4, _08078870
	ldrb r0, [r4]
	cmp r0, r3
	beq _08078862
_08078850:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r2
	bcs _08078862
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _08078850
_08078862:
	adds r0, r1, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807886C: .4byte gUnknown_02024A68
_08078870: .4byte gUnknown_02024A72
	thumb_func_end battle_get_side_with_given_state

	thumb_func_start sub_8078874
sub_8078874: @ 8078874
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080788A0
	ldr r0, _08078898
	ldrb r0, [r0]
	cmp r0, r4
	beq _080788EE
	ldr r0, _0807889C
	ldrb r0, [r0]
	cmp r0, r4
	beq _080788EE
	b _080788FC
	.align 2, 0
_08078898: .4byte gUnknown_0202F7C8
_0807889C: .4byte gUnknown_0202F7C9
_080788A0:
	ldr r0, _080788C8
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _080788FC
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080788D4
	ldr r1, _080788CC
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080788D0
	b _080788E2
	.align 2, 0
_080788C8: .4byte gUnknown_02024A72
_080788CC: .4byte gUnknown_02024A6A
_080788D0: .4byte gEnemyParty
_080788D4:
	ldr r1, _080788F4
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080788F8
_080788E2:
	adds r0, r1
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _080788FC
_080788EE:
	movs r0, 0x1
	b _080788FE
	.align 2, 0
_080788F4: .4byte gUnknown_02024A6A
_080788F8: .4byte gPlayerParty
_080788FC:
	movs r0, 0
_080788FE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8078874

	thumb_func_start battle_type_is_double
battle_type_is_double: @ 8078904
	ldr r0, _08078910
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_08078910: .4byte gUnknown_020239F8
	thumb_func_end battle_type_is_double

	thumb_func_start sub_8078914
sub_8078914: @ 8078914
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08078938
	ldr r0, _08078930
	str r0, [r4]
	ldr r0, _08078934
	str r0, [r4, 0x4]
	movs r0, 0xE
	b _08078942
	.align 2, 0
_08078930: .4byte 0x06008000
_08078934: .4byte 0x0600f000
_08078938:
	ldr r0, _0807894C
	str r0, [r4]
	ldr r0, _08078950
	str r0, [r4, 0x4]
	movs r0, 0x8
_08078942:
	strb r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807894C: .4byte 0x06004000
_08078950: .4byte 0x0600e000
	thumb_func_end sub_8078914

	thumb_func_start sub_8078954
sub_8078954: @ 8078954
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08078978
	ldr r0, _08078970
	str r0, [r4]
	ldr r0, _08078974
	str r0, [r4, 0x4]
	movs r0, 0xE
	b _080789AA
	.align 2, 0
_08078970: .4byte 0x06008000
_08078974: .4byte 0x0600f000
_08078978:
	ldr r0, _08078994
	ldrb r0, [r0]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080789A0
	ldr r0, _08078998
	str r0, [r4]
	ldr r0, _0807899C
	str r0, [r4, 0x4]
	movs r0, 0x8
	b _080789AA
	.align 2, 0
_08078994: .4byte gUnknown_0202F7C8
_08078998: .4byte 0x06004000
_0807899C: .4byte 0x0600e000
_080789A0:
	ldr r0, _080789B4
	str r0, [r4]
	ldr r0, _080789B8
	str r0, [r4, 0x4]
	movs r0, 0x9
_080789AA:
	strb r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080789B4: .4byte 0x06006000
_080789B8: .4byte 0x0600f000
	thumb_func_end sub_8078954

	thumb_func_start sub_80789BC
sub_80789BC: @ 80789BC
	push {lr}
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080789CC
	movs r0, 0x2
	b _080789CE
_080789CC:
	movs r0, 0x1
_080789CE:
	pop {r1}
	bx r1
	thumb_func_end sub_80789BC

	thumb_func_start sub_80789D4
sub_80789D4: @ 80789D4
	push {lr}
	lsls r0, 24
	cmp r0, 0
	bne _080789F4
	ldr r2, _080789F0
	ldrb r1, [r2, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2, 0x1]
	ldrb r0, [r2, 0x1]
	movs r1, 0x20
	orrs r0, r1
	b _08078A2A
	.align 2, 0
_080789F0: .4byte REG_BG3CNT
_080789F4:
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08078A14
	ldr r2, _08078A10
	ldrb r1, [r2, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2, 0x1]
	ldrb r0, [r2, 0x1]
	movs r1, 0x20
	orrs r0, r1
	b _08078A2A
	.align 2, 0
_08078A10: .4byte REG_BG3CNT
_08078A14:
	ldr r2, _08078A30
	ldrb r1, [r2, 0x1]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r1, [r2, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
_08078A2A:
	strb r0, [r2, 0x1]
	pop {r0}
	bx r0
	.align 2, 0
_08078A30: .4byte REG_BG3CNT
	thumb_func_end sub_80789D4

	thumb_func_start sub_8078A34
sub_8078A34: @ 8078A34
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	bl sub_8078A5C
	ldr r1, _08078A58
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078A58: .4byte sub_80783D0
	thumb_func_end sub_8078A34

	thumb_func_start sub_8078A5C
sub_8078A5C: @ 8078A5C
	push {r4-r6,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x32]
	ldrh r1, [r5, 0x30]
	subs r0, r1
	ldrh r4, [r5, 0x36]
	ldrh r1, [r5, 0x34]
	subs r4, r1
	lsls r4, 24
	lsrs r4, 16
	lsls r0, 24
	asrs r0, 16
	movs r2, 0x2E
	ldrsh r1, [r5, r2]
	bl __divsi3
	movs r6, 0
	strh r0, [r5, 0x30]
	lsls r4, 16
	asrs r4, 16
	movs r0, 0x2E
	ldrsh r1, [r5, r0]
	adds r0, r4, 0
	bl __divsi3
	strh r0, [r5, 0x32]
	strh r6, [r5, 0x36]
	strh r6, [r5, 0x34]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8078A5C

	thumb_func_start obj_translate_based_on_private_1_2_3_4
obj_translate_based_on_private_1_2_3_4: @ 8078A9C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	movs r0, 0x32
	ldrsh r1, [r7, r0]
	movs r2, 0x30
	ldrsh r0, [r7, r2]
	subs r1, r0
	movs r3, 0x36
	ldrsh r2, [r7, r3]
	movs r3, 0x34
	ldrsh r0, [r7, r3]
	subs r2, r0
	lsrs r0, r1, 31
	mov r8, r0
	lsrs r3, r2, 31
	mov r9, r3
	cmp r1, 0
	bge _08078AC8
	negs r1, r1
_08078AC8:
	lsls r0, r1, 24
	lsrs r6, r0, 16
	adds r0, r2, 0
	cmp r0, 0
	bge _08078AD4
	negs r0, r0
_08078AD4:
	lsls r0, 24
	lsrs r5, r0, 16
	movs r0, 0x2E
	ldrsh r4, [r7, r0]
	adds r0, r6, 0
	adds r1, r4, 0
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl __divsi3
	lsls r0, 16
	lsrs r5, r0, 16
	mov r2, r8
	cmp r2, 0
	beq _08078B00
	movs r0, 0x1
	orrs r6, r0
	b _08078B04
_08078B00:
	ldr r0, _08078B10
	ands r6, r0
_08078B04:
	mov r3, r9
	cmp r3, 0
	beq _08078B14
	movs r0, 0x1
	orrs r5, r0
	b _08078B18
	.align 2, 0
_08078B10: .4byte 0x0000fffe
_08078B14:
	ldr r0, _08078B30
	ands r5, r0
_08078B18:
	movs r0, 0
	strh r6, [r7, 0x30]
	strh r5, [r7, 0x32]
	strh r0, [r7, 0x36]
	strh r0, [r7, 0x34]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08078B30: .4byte 0x0000fffe
	thumb_func_end obj_translate_based_on_private_1_2_3_4

	thumb_func_start sub_8078B34
sub_8078B34: @ 8078B34
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r1, _08078B58
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078B58: .4byte sub_8078BB8
	thumb_func_end sub_8078B34

	thumb_func_start sub_8078B5C
sub_8078B5C: @ 8078B5C
	push {r4-r6,lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _08078B6C
	movs r0, 0x1
	b _08078BB0
_08078B6C:
	ldrh r1, [r2, 0x30]
	ldrh r4, [r2, 0x32]
	ldrh r6, [r2, 0x34]
	ldrh r5, [r2, 0x36]
	adds r0, r6, r1
	lsls r3, r0, 16
	lsrs r6, r3, 16
	adds r0, r5, r4
	lsls r0, 16
	lsrs r5, r0, 16
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08078B8E
	lsrs r0, r3, 24
	negs r0, r0
	b _08078B90
_08078B8E:
	lsrs r0, r3, 24
_08078B90:
	strh r0, [r2, 0x24]
	movs r0, 0x1
	ands r4, r0
	cmp r4, 0
	beq _08078BA0
	lsrs r0, r5, 8
	negs r0, r0
	b _08078BA2
_08078BA0:
	lsrs r0, r5, 8
_08078BA2:
	strh r0, [r2, 0x26]
	strh r6, [r2, 0x34]
	strh r5, [r2, 0x36]
	ldrh r0, [r2, 0x2E]
	subs r0, 0x1
	strh r0, [r2, 0x2E]
	movs r0, 0
_08078BB0:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8078B5C

	thumb_func_start sub_8078BB8
sub_8078BB8: @ 8078BB8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	beq _08078BCC
	adds r0, r4, 0
	bl sub_8078104
_08078BCC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078BB8

	thumb_func_start sub_8078BD4
sub_8078BD4: @ 8078BD4
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	subs r0, r1, r0
	cmp r0, 0
	bge _08078BE8
	negs r0, r0
_08078BE8:
	lsls r0, 8
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	bl __divsi3
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078BD4

	thumb_func_start sub_8078C00
sub_8078C00: @ 8078C00
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	bl sub_8078BD4
	ldr r1, _08078C24
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078C24: .4byte sub_8078BB8
	thumb_func_end sub_8078C00

	thumb_func_start sub_8078C28
sub_8078C28: @ 8078C28
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	movs r0, 0x32
	ldrsh r1, [r7, r0]
	movs r2, 0x30
	ldrsh r0, [r7, r2]
	subs r1, r0
	movs r3, 0x36
	ldrsh r2, [r7, r3]
	movs r3, 0x34
	ldrsh r0, [r7, r3]
	subs r2, r0
	lsrs r0, r1, 31
	mov r8, r0
	lsrs r3, r2, 31
	mov r9, r3
	cmp r1, 0
	bge _08078C54
	negs r1, r1
_08078C54:
	lsls r0, r1, 20
	lsrs r6, r0, 16
	adds r0, r2, 0
	cmp r0, 0
	bge _08078C60
	negs r0, r0
_08078C60:
	lsls r0, 20
	lsrs r5, r0, 16
	movs r0, 0x2E
	ldrsh r4, [r7, r0]
	adds r0, r6, 0
	adds r1, r4, 0
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl __divsi3
	lsls r0, 16
	lsrs r5, r0, 16
	mov r2, r8
	cmp r2, 0
	beq _08078C8C
	movs r0, 0x1
	orrs r6, r0
	b _08078C90
_08078C8C:
	ldr r0, _08078C9C
	ands r6, r0
_08078C90:
	mov r3, r9
	cmp r3, 0
	beq _08078CA0
	movs r0, 0x1
	orrs r5, r0
	b _08078CA4
	.align 2, 0
_08078C9C: .4byte 0x0000fffe
_08078CA0:
	ldr r0, _08078CBC
	ands r5, r0
_08078CA4:
	movs r0, 0
	strh r6, [r7, 0x30]
	strh r5, [r7, 0x32]
	strh r0, [r7, 0x36]
	strh r0, [r7, 0x34]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08078CBC: .4byte 0x0000fffe
	thumb_func_end sub_8078C28

	thumb_func_start sub_8078CC0
sub_8078CC0: @ 8078CC0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	bl sub_8078C28
	ldr r1, _08078CE4
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078CE4: .4byte sub_8078D44
	thumb_func_end sub_8078CC0

	thumb_func_start sub_8078CE8
sub_8078CE8: @ 8078CE8
	push {r4-r6,lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _08078CF8
	movs r0, 0x1
	b _08078D3C
_08078CF8:
	ldrh r1, [r2, 0x30]
	ldrh r4, [r2, 0x32]
	ldrh r6, [r2, 0x34]
	ldrh r5, [r2, 0x36]
	adds r0, r6, r1
	lsls r3, r0, 16
	lsrs r6, r3, 16
	adds r0, r5, r4
	lsls r0, 16
	lsrs r5, r0, 16
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08078D1A
	lsrs r0, r3, 20
	negs r0, r0
	b _08078D1C
_08078D1A:
	lsrs r0, r3, 20
_08078D1C:
	strh r0, [r2, 0x24]
	movs r0, 0x1
	ands r4, r0
	cmp r4, 0
	beq _08078D2C
	lsrs r0, r5, 4
	negs r0, r0
	b _08078D2E
_08078D2C:
	lsrs r0, r5, 4
_08078D2E:
	strh r0, [r2, 0x26]
	strh r6, [r2, 0x34]
	strh r5, [r2, 0x36]
	ldrh r0, [r2, 0x2E]
	subs r0, 0x1
	strh r0, [r2, 0x2E]
	movs r0, 0
_08078D3C:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8078CE8

	thumb_func_start sub_8078D44
sub_8078D44: @ 8078D44
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078CE8
	lsls r0, 24
	cmp r0, 0
	beq _08078D58
	adds r0, r4, 0
	bl sub_8078104
_08078D58:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078D44

	thumb_func_start sub_8078D60
sub_8078D60: @ 8078D60
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	subs r0, r1, r0
	cmp r0, 0
	bge _08078D74
	negs r0, r0
_08078D74:
	lsls r0, 4
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	bl __divsi3
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl sub_8078C28
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078D60

	thumb_func_start sub_8078D8C
sub_8078D8C: @ 8078D8C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	bl sub_8078D60
	ldr r1, _08078DB0
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078DB0: .4byte sub_8078D44
	thumb_func_end sub_8078D8C

	thumb_func_start obj_id_set_rotscale
obj_id_set_rotscale: @ 8078DB4
	push {r4,r5,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 16
	lsls r3, 16
	lsrs r3, 16
	ldr r5, _08078E2C
	lsls r2, 16
	lsrs r1, 16
	orrs r1, r2
	str r1, [sp]
	ldr r0, [sp, 0x4]
	ands r0, r5
	orrs r0, r3
	str r0, [sp, 0x4]
	bl sub_8078E38
	lsls r0, 24
	cmp r0, 0
	beq _08078DF0
	mov r0, sp
	ldrh r0, [r0]
	negs r0, r0
	lsls r0, 16
	lsrs r0, 16
	ldr r1, [sp]
	ands r1, r5
	orrs r1, r0
	str r1, [sp]
_08078DF0:
	ldr r1, _08078E30
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r4, [r0, 0x3]
	lsls r4, 26
	lsrs r4, 27
	add r5, sp, 0x8
	mov r0, sp
	adds r1, r5, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ObjAffineSet
	ldr r0, _08078E34
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r5]
	strh r0, [r4]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x2]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x4]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x6]
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08078E2C: .4byte 0xffff0000
_08078E30: .4byte gSprites
_08078E34: .4byte gOamMatrices
	thumb_func_end obj_id_set_rotscale

	thumb_func_start sub_8078E38
sub_8078E38: @ 8078E38
	push {r4,lr}
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08078E68
	ldr r4, _08078E64
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	movs r2, 0x32
	ldrsh r0, [r1, r2]
	cmp r0, 0xC9
	beq _08078E68
	movs r0, 0x1
	b _08078E6A
	.align 2, 0
_08078E64: .4byte gSprites
_08078E68:
	movs r0, 0
_08078E6A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8078E38

	thumb_func_start sub_8078E70
sub_8078E70: @ 8078E70
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	ldr r1, _08078F38
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r4, r0, r1
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r7, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08078EA6
	adds r0, r7, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08078EB4
_08078EA6:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_08078EB4:
	ldr r1, _08078F38
	lsls r4, r6, 4
	adds r0, r4, r6
	lsls r0, 2
	adds r5, r0, r1
	movs r0, 0x3
	mov r1, r8
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r5, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x1]
	adds r2, r5, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08078F0E
	ldrb r0, [r5, 0x1]
	lsls r0, 30
	cmp r0, 0
	bne _08078F0E
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 2
	ldr r1, _08078F3C
	adds r0, r1
	ldrb r1, [r0, 0x6]
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r5, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x3]
_08078F0E:
	ldr r1, _08078F38
	adds r0, r4, r6
	lsls r0, 2
	adds r0, r1
	ldrb r3, [r0, 0x1]
	movs r1, 0x3
	orrs r3, r1
	strb r3, [r0, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r0, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	bl CalcCenterToCornerVec
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08078F38: .4byte gSprites
_08078F3C: .4byte 0x02017810
	thumb_func_end sub_8078E70

	thumb_func_start sub_8078F40
sub_8078F40: @ 8078F40
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r2, 0x80
	lsls r2, 1
	adds r0, r4, 0
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldr r1, _08078F98
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0, 0x1]
	movs r1, 0x4
	negs r1, r1
	ands r1, r2
	movs r2, 0x1
	orrs r1, r2
	movs r2, 0xD
	negs r2, r2
	ands r1, r2
	strb r1, [r0, 0x1]
	adds r3, r0, 0
	adds r3, 0x2C
	ldrb r2, [r3]
	movs r1, 0x7F
	ands r1, r2
	strb r1, [r3]
	ldrb r3, [r0, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r0, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	bl CalcCenterToCornerVec
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078F98: .4byte gSprites
	thumb_func_end sub_8078F40

	thumb_func_start sub_8078F9C
sub_8078F9C: @ 8078F9C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08078FD4
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r2, r1, r2
	ldrb r0, [r2, 0x3]
	lsls r0, 26
	lsrs r0, 27
	ldr r1, _08078FD8
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x4]
	movs r3, 0x4
	ldrsh r0, [r0, r3]
	cmp r0, 0
	bge _08078FC8
	negs r0, r0
	lsls r0, 16
	lsrs r1, r0, 16
_08078FC8:
	lsls r0, r1, 16
	asrs r0, 19
	strh r0, [r2, 0x26]
	pop {r0}
	bx r0
	.align 2, 0
_08078FD4: .4byte gSprites
_08078FD8: .4byte gOamMatrices
	thumb_func_end sub_8078F9C

	thumb_func_start sub_8078FDC
sub_8078FDC: @ 8078FDC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r4, r0, 0
	ldr r0, [sp, 0x28]
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 16
	lsrs r5, r2, 16
	lsls r3, 16
	lsrs r7, r3, 16
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldrb r0, [r4, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08079082
	adds r0, r4, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	cmp r6, 0
	beq _0807902A
	ldrb r3, [r4, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	adds r0, r4, 0
	bl CalcCenterToCornerVec
_0807902A:
	ldr r6, _08079090
	lsls r0, r7, 16
	orrs r5, r0
	str r5, [sp]
	ldr r0, [sp, 0x4]
	ands r0, r6
	mov r1, r8
	orrs r0, r1
	str r0, [sp, 0x4]
	bl sub_8078E38
	lsls r0, 24
	cmp r0, 0
	beq _08079058
	mov r0, sp
	ldrh r0, [r0]
	negs r0, r0
	lsls r0, 16
	lsrs r0, 16
	ldr r1, [sp]
	ands r1, r6
	orrs r1, r0
	str r1, [sp]
_08079058:
	ldrb r4, [r4, 0x3]
	lsls r4, 26
	lsrs r4, 27
	add r5, sp, 0x8
	mov r0, sp
	adds r1, r5, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ObjAffineSet
	ldr r0, _08079094
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r5]
	strh r0, [r4]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x2]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x4]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x6]
_08079082:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079090: .4byte 0xffff0000
_08079094: .4byte gOamMatrices
	thumb_func_end sub_8078FDC

	thumb_func_start sub_8079098
sub_8079098: @ 8079098
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r3, 0x80
	lsls r3, 1
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x1
	adds r2, r3, 0
	bl sub_8078FDC
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	ldrb r3, [r4, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	adds r0, r4, 0
	bl CalcCenterToCornerVec
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8079098

	thumb_func_start sub_80790D8
sub_80790D8: @ 80790D8
	push {lr}
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl ArcTan2
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_80790D8

	thumb_func_start sub_80790F0
sub_80790F0: @ 80790F0
	push {lr}
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl sub_80790D8
	lsls r0, 16
	negs r0, r0
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_80790F0

	thumb_func_start sub_8079108
sub_8079108: @ 8079108
	push {r4-r7,lr}
	lsls r1, 24
	lsls r0, 20
	lsrs r0, 16
	cmp r1, 0
	bne _08079184
	ldr r2, _08079178
	ldr r1, _0807917C
	lsls r0, 1
	adds r4, r0, r1
	adds r5, r0, r2
	movs r6, 0xF
_08079120:
	ldr r0, [r5]
	lsls r2, r0, 27
	lsrs r2, 27
	lsls r1, r0, 22
	lsrs r1, 27
	adds r2, r1
	lsls r0, 17
	lsrs r0, 27
	adds r0, r2
	movs r1, 0x3
	bl __udivsi3
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1F
	ands r0, r1
	ldrb r1, [r4]
	movs r3, 0x20
	negs r3, r3
	adds r2, r3, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4]
	lsls r3, r0, 5
	ldrh r1, [r4]
	ldr r7, _08079180
	adds r2, r7, 0
	ands r1, r2
	orrs r1, r3
	strh r1, [r4]
	lsls r0, 2
	ldrb r1, [r4, 0x1]
	movs r3, 0x7D
	negs r3, r3
	adds r2, r3, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x1]
	adds r4, 0x2
	adds r5, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _08079120
	b _08079194
	.align 2, 0
_08079178: .4byte gPlttBufferUnfaded
_0807917C: .4byte gPlttBufferFaded
_08079180: .4byte 0xfffffc1f
_08079184:
	lsls r1, r0, 1
	ldr r0, _0807919C
	adds r0, r1, r0
	ldr r2, _080791A0
	adds r1, r2
	ldr r2, _080791A4
	bl CpuSet
_08079194:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807919C: .4byte gPlttBufferUnfaded
_080791A0: .4byte gPlttBufferFaded
_080791A4: .4byte REG_BG0CNT
	thumb_func_end sub_8079108

	thumb_func_start sub_80791A8
sub_80791A8: @ 80791A8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r4, [sp, 0x28]
	ldr r5, [sp, 0x2C]
	ldr r6, [sp, 0x30]
	lsls r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 24
	lsrs r3, 24
	mov r9, r3
	lsls r4, 24
	lsrs r4, 24
	mov r10, r4
	lsls r5, 24
	lsrs r5, 24
	str r5, [sp]
	lsls r6, 24
	lsrs r6, 24
	str r6, [sp, 0x4]
	movs r4, 0
	cmp r0, 0
	beq _080791FE
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080791F2
	movs r4, 0xE
	b _080791FE
_080791F2:
	bl sub_80789BC
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0x1
	lsls r4, r0
_080791FE:
	cmp r7, 0
	beq _08079210
	ldr r0, _08079288
	ldrb r0, [r0]
	adds r1, r0, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	orrs r4, r0
_08079210:
	mov r0, r8
	cmp r0, 0
	beq _08079224
	ldr r0, _0807928C
	ldrb r0, [r0]
	adds r1, r0, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	orrs r4, r0
_08079224:
	mov r0, r9
	cmp r0, 0
	beq _0807924A
	ldr r6, _08079288
	ldrb r0, [r6]
	movs r5, 0x2
	eors r0, r5
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _0807924A
	ldrb r0, [r6]
	eors r0, r5
	adds r1, r0, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	orrs r4, r0
_0807924A:
	mov r0, r10
	cmp r0, 0
	beq _08079270
	ldr r6, _0807928C
	ldrb r0, [r6]
	movs r5, 0x2
	eors r0, r5
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08079270
	ldrb r0, [r6]
	eors r0, r5
	adds r1, r0, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	orrs r4, r0
_08079270:
	ldr r0, [sp]
	cmp r0, 0
	beq _08079296
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08079290
	movs r0, 0x80
	lsls r0, 1
	b _08079294
	.align 2, 0
_08079288: .4byte gUnknown_0202F7C8
_0807928C: .4byte gUnknown_0202F7C9
_08079290:
	movs r0, 0x80
	lsls r0, 7
_08079294:
	orrs r4, r0
_08079296:
	ldr r0, [sp, 0x4]
	cmp r0, 0
	beq _080792AC
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080792AC
	movs r0, 0x80
	lsls r0, 2
	orrs r4, r0
_080792AC:
	adds r0, r4, 0
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80791A8

	thumb_func_start sub_80792C0
sub_80792C0: @ 80792C0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	movs r4, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080792EE
	cmp r5, 0
	beq _0807939C
	movs r4, 0x80
	lsls r4, 11
	b _0807939C
_080792EE:
	cmp r5, 0
	beq _08079316
	movs r0, 0
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08079316
	movs r0, 0
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r4, 0x1
	lsls r4, r0
_08079316:
	cmp r6, 0
	beq _08079342
	movs r0, 0x2
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08079342
	movs r0, 0x2
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	orrs r4, r0
_08079342:
	cmp r7, 0
	beq _0807936E
	movs r0, 0x1
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _0807936E
	movs r0, 0x1
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	orrs r4, r0
_0807936E:
	mov r0, r8
	cmp r0, 0
	beq _0807939C
	movs r0, 0x3
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _0807939C
	movs r0, 0x3
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	orrs r4, r0
_0807939C:
	adds r0, r4, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80792C0

	thumb_func_start sub_80793A8
sub_80793A8: @ 80793A8
	lsls r0, 24
	lsrs r0, 24
	bx lr
	thumb_func_end sub_80793A8

	thumb_func_start unref_sub_80793B0
unref_sub_80793B0: @ 80793B0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end unref_sub_80793B0

	thumb_func_start sub_80793C4
sub_80793C4: @ 80793C4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08079402
	ldr r2, _080793F0
	movs r3, 0x6
	ldrsh r0, [r2, r3]
	movs r1, 0
	cmp r0, 0
	bne _080793DE
	movs r1, 0x1
_080793DE:
	movs r3, 0x4
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _080793F4
	adds r0, r4, 0
	bl sub_80787B0
	b _080793FA
	.align 2, 0
_080793F0: .4byte gUnknown_03004B00
_080793F4:
	adds r0, r4, 0
	bl sub_8078764
_080793FA:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _08079416
_08079402:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x30
	ands r0, r1
	cmp r0, 0
	beq _08079416
	adds r0, r4, 0
	bl move_anim_8074EE0
_08079416:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80793C4

	thumb_func_start sub_807941C
sub_807941C: @ 807941C
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r6, _08079494
	movs r1, 0xA
	ldrsh r0, [r6, r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0
	cmp r0, 0
	bne _08079434
	movs r1, 0x1
_08079434:
	ldrb r0, [r6, 0xA]
	movs r7, 0x1
	cmp r0, 0
	bne _0807943E
	movs r7, 0x3
_0807943E:
	adds r0, r5, 0
	bl sub_80787B0
	ldr r0, _08079498
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08079458
	ldrh r0, [r6, 0x4]
	negs r0, r0
	strh r0, [r6, 0x4]
_08079458:
	ldrh r0, [r6, 0x8]
	strh r0, [r5, 0x2E]
	ldr r4, _0807949C
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x4]
	adds r0, r1
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	adds r1, r7, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x6]
	adds r0, r6
	strh r0, [r5, 0x36]
	ldr r0, _080794A0
	str r0, [r5, 0x1C]
	ldr r1, _080794A4
	adds r0, r5, 0
	bl oamt_set_x3A_32
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079494: .4byte gUnknown_03004B00
_08079498: .4byte gUnknown_0202F7C8
_0807949C: .4byte gUnknown_0202F7C9
_080794A0: .4byte sub_8078B34
_080794A4: .4byte move_anim_8072740
	thumb_func_end sub_807941C

	thumb_func_start sub_80794A8
sub_80794A8: @ 80794A8
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _08079508
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080794C8
	ldr r1, _0807950C
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080794C8:
	ldr r4, _0807950C
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x2E]
	ldr r5, _08079510
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x6]
	adds r0, r1
	strh r0, [r6, 0x36]
	ldrh r0, [r4, 0xA]
	strh r0, [r6, 0x38]
	adds r0, r6, 0
	bl sub_80786EC
	ldr r0, _08079514
	str r0, [r6, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08079508: .4byte gUnknown_0202F7C8
_0807950C: .4byte gUnknown_03004B00
_08079510: .4byte gUnknown_0202F7C9
_08079514: .4byte sub_8079518
	thumb_func_end sub_80794A8

	thumb_func_start sub_8079518
sub_8079518: @ 8079518
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _0807952C
	adds r0, r4, 0
	bl move_anim_8072740
_0807952C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8079518

	thumb_func_start sub_8079534
sub_8079534: @ 8079534
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r0, _08079548
	movs r2, 0xC
	ldrsh r1, [r0, r2]
	cmp r1, 0
	bne _0807954C
	movs r4, 0x1
	movs r7, 0x3
	b _08079550
	.align 2, 0
_08079548: .4byte gUnknown_03004B00
_0807954C:
	movs r4, 0
	movs r7, 0x1
_08079550:
	movs r1, 0xA
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _08079568
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80787B0
	ldr r0, _08079564
	b _08079572
	.align 2, 0
_08079564: .4byte gUnknown_0202F7C8
_08079568:
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8078764
	ldr r0, _080795D0
_08079572:
	ldrb r6, [r0]
	ldr r0, _080795D4
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0807958A
	ldr r1, _080795D8
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_0807958A:
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8078764
	ldr r4, _080795D8
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x2E]
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r4, 0x4]
	adds r0, r2
	strh r0, [r5, 0x32]
	adds r0, r6, 0
	adds r1, r7, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x6]
	adds r0, r4
	strh r0, [r5, 0x36]
	ldr r0, _080795DC
	str r0, [r5, 0x1C]
	ldr r1, _080795E0
	adds r0, r5, 0
	bl oamt_set_x3A_32
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080795D0: .4byte gUnknown_0202F7C9
_080795D4: .4byte gUnknown_0202F7C8
_080795D8: .4byte gUnknown_03004B00
_080795DC: .4byte sub_8078B34
_080795E0: .4byte move_anim_8072740
	thumb_func_end sub_8079534

	thumb_func_start duplicate_obj_of_side_rel2move_in_transparent_mode
duplicate_obj_of_side_rel2move_in_transparent_mode: @ 80795E4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _0807964E
	movs r6, 0
	ldr r2, _08079640
	lsls r0, r1, 4
	adds r0, r1
	lsls r1, r0, 2
_08079600:
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r4, r0, r2
	adds r5, r4, 0
	adds r5, 0x3E
	ldrb r0, [r5]
	lsls r0, 31
	cmp r0, 0
	bne _08079644
	adds r0, r4, 0
	adds r1, r2
	movs r2, 0x44
	bl memcpy
	ldrb r1, [r4, 0x1]
	movs r2, 0xD
	negs r2, r2
	adds r0, r2, 0
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4, 0x1]
	ldrb r0, [r5]
	adds r2, 0x8
	adds r1, r2, 0
	ands r0, r1
	strb r0, [r5]
	lsls r0, r6, 16
	asrs r0, 16
	b _08079652
	.align 2, 0
_08079640: .4byte gSprites
_08079644:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x3F
	bls _08079600
_0807964E:
	movs r0, 0x1
	negs r0, r0
_08079652:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end duplicate_obj_of_side_rel2move_in_transparent_mode

	thumb_func_start obj_delete_but_dont_free_vram
obj_delete_but_dont_free_vram: @ 8079658
	push {lr}
	adds r3, r0, 0
	adds r3, 0x3F
	ldrb r1, [r3]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r3]
	bl DestroySprite
	pop {r0}
	bx r0
	thumb_func_end obj_delete_but_dont_free_vram

	thumb_func_start sub_8079670
sub_8079670: @ 8079670
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r5, 0
	movs r3, 0
	ldr r4, _080796E4
	movs r0, 0x4
	ldrsh r1, [r4, r0]
	movs r6, 0
	ldrsh r0, [r4, r6]
	cmp r1, r0
	ble _0807968A
	movs r3, 0x1
_0807968A:
	cmp r1, r0
	bge _08079690
	ldr r3, _080796E8
_08079690:
	movs r0, 0x6
	ldrsh r1, [r4, r0]
	movs r6, 0x2
	ldrsh r0, [r4, r6]
	cmp r1, r0
	ble _0807969E
	movs r5, 0x1
_0807969E:
	cmp r1, r0
	bge _080796A4
	ldr r5, _080796E8
_080796A4:
	ldr r0, _080796EC
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	movs r2, 0
	strh r2, [r1, 0x8]
	ldrh r0, [r4, 0x8]
	strh r0, [r1, 0xA]
	strh r2, [r1, 0xC]
	ldrh r0, [r4]
	strh r0, [r1, 0xE]
	ldrh r0, [r4, 0x2]
	strh r0, [r1, 0x10]
	strh r3, [r1, 0x12]
	strh r5, [r1, 0x14]
	ldrh r0, [r4, 0x4]
	strh r0, [r1, 0x16]
	ldrh r0, [r4, 0x6]
	strh r0, [r1, 0x18]
	ldr r3, _080796F0
	ldrh r0, [r4, 0x2]
	lsls r0, 8
	ldrh r2, [r4]
	orrs r0, r2
	strh r0, [r3]
	ldr r0, _080796F4
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080796E4: .4byte gUnknown_03004B00
_080796E8: .4byte 0x0000ffff
_080796EC: .4byte gTasks
_080796F0: .4byte REG_BLDALPHA
_080796F4: .4byte sub_80796F8
	thumb_func_end sub_8079670

	thumb_func_start sub_80796F8
sub_80796F8: @ 80796F8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08079744
	adds r3, r0, r1
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xA
	ldrsh r1, [r3, r2]
	cmp r0, r1
	ble _08079786
	movs r0, 0
	strh r0, [r3, 0x8]
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	strh r0, [r3, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08079748
	ldrh r2, [r3, 0xE]
	movs r5, 0xE
	ldrsh r1, [r3, r5]
	movs r5, 0x16
	ldrsh r0, [r3, r5]
	cmp r1, r0
	beq _0807975C
	ldrh r0, [r3, 0x12]
	adds r0, r2, r0
	strh r0, [r3, 0xE]
	b _0807975C
	.align 2, 0
_08079744: .4byte gTasks
_08079748:
	ldrh r2, [r3, 0x10]
	movs r0, 0x10
	ldrsh r1, [r3, r0]
	movs r5, 0x18
	ldrsh r0, [r3, r5]
	cmp r1, r0
	beq _0807975C
	ldrh r0, [r3, 0x14]
	adds r0, r2, r0
	strh r0, [r3, 0x10]
_0807975C:
	ldr r2, _0807978C
	ldrh r0, [r3, 0x10]
	lsls r0, 8
	ldrh r1, [r3, 0xE]
	orrs r0, r1
	strh r0, [r2]
	movs r0, 0xE
	ldrsh r1, [r3, r0]
	movs r2, 0x16
	ldrsh r0, [r3, r2]
	cmp r1, r0
	bne _08079786
	movs r5, 0x10
	ldrsh r1, [r3, r5]
	movs r2, 0x18
	ldrsh r0, [r3, r2]
	cmp r1, r0
	bne _08079786
	adds r0, r4, 0
	bl move_anim_task_del
_08079786:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807978C: .4byte REG_BLDALPHA
	thumb_func_end sub_80796F8

	thumb_func_start sub_8079790
sub_8079790: @ 8079790
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080797B0
	ldrb r0, [r0]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xFF
	bne _080797B4
	adds r0, r4, 0
	bl move_anim_task_del
	b _080797DA
	.align 2, 0
_080797B0: .4byte gUnknown_03004B00
_080797B4:
	ldr r1, _080797E0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r2, _080797E4
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x5]
	lsrs r1, 4
	lsls r1, 4
	ldr r3, _080797E8
	adds r2, r3, 0
	adds r1, r2
	strh r1, [r0, 0x8]
	bl sub_80797EC
_080797DA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080797E0: .4byte gTasks
_080797E4: .4byte gSprites
_080797E8: .4byte 0x00000101
	thumb_func_end sub_8079790

	thumb_func_start sub_80797EC
sub_80797EC: @ 80797EC
	ldr r3, _0807980C
	ldrh r1, [r3, 0x2]
	movs r2, 0
	strh r1, [r0, 0xA]
	strh r2, [r0, 0xC]
	ldrh r1, [r3, 0x4]
	strh r1, [r0, 0xE]
	strh r2, [r0, 0x10]
	ldrh r1, [r3, 0x6]
	strh r1, [r0, 0x12]
	strh r2, [r0, 0x14]
	ldrh r1, [r3, 0x8]
	strh r1, [r0, 0x16]
	ldr r1, _08079810
	str r1, [r0]
	bx lr
	.align 2, 0
_0807980C: .4byte gUnknown_03004B00
_08079810: .4byte sub_8079814
	thumb_func_end sub_80797EC

	thumb_func_start sub_8079814
sub_8079814: @ 8079814
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0807986C
	adds r4, r0, r1
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _080798A4
	movs r0, 0
	strh r0, [r4, 0x10]
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08079870
	ldrh r2, [r4, 0xC]
	adds r2, 0x1
	strh r2, [r4, 0xC]
	ldrh r0, [r4, 0x8]
	lsls r2, 24
	lsrs r2, 24
	ldrh r3, [r4, 0xA]
	movs r1, 0xF
	bl BlendPalette
	movs r2, 0xC
	ldrsh r1, [r4, r2]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080798A4
	movs r0, 0x1
	strh r0, [r4, 0x14]
	b _080798A4
	.align 2, 0
_0807986C: .4byte gTasks
_08079870:
	ldrh r2, [r4, 0xC]
	subs r2, 0x1
	strh r2, [r4, 0xC]
	ldrh r0, [r4, 0x8]
	lsls r2, 24
	lsrs r2, 24
	ldrh r3, [r4, 0xA]
	movs r1, 0xF
	bl BlendPalette
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	cmp r1, 0
	bne _080798A4
	ldrh r0, [r4, 0x16]
	subs r0, 0x1
	strh r0, [r4, 0x16]
	lsls r0, 16
	cmp r0, 0
	beq _0807989E
	strh r1, [r4, 0x10]
	strh r1, [r4, 0x14]
	b _080798A4
_0807989E:
	adds r0, r5, 0
	bl move_anim_task_del
_080798A4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8079814

	thumb_func_start sub_80798AC
sub_80798AC: @ 80798AC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080798CC
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	bne _080798D0
	adds r0, r4, 0
	bl move_anim_task_del
	b _080798E6
	.align 2, 0
_080798CC: .4byte gUnknown_03004B00
_080798D0:
	ldr r1, _080798EC
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	lsls r1, r2, 4
	ldr r2, _080798F0
	adds r1, r2
	strh r1, [r0, 0x8]
	bl sub_80797EC
_080798E6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080798EC: .4byte gTasks
_080798F0: .4byte 0x00000101
	thumb_func_end sub_80798AC

	thumb_func_start sub_80798F4
sub_80798F4: @ 80798F4
	push {r4,lr}
	adds r3, r0, 0
	adds r4, r1, 0
	lsls r4, 24
	lsrs r4, 24
	movs r1, 0
	strh r1, [r3, 0x16]
	strh r1, [r3, 0x18]
	strh r1, [r3, 0x1A]
	strh r4, [r3, 0x26]
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r3, 0x1C]
	strh r0, [r3, 0x1E]
	strh r1, [r3, 0x20]
	adds r0, r3, 0
	adds r0, 0x22
	adds r3, 0x24
	adds r1, r3, 0
	bl sub_8079BF4
	adds r0, r4, 0
	movs r1, 0
	bl sub_8078E70
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80798F4

	thumb_func_start sub_807992C
sub_807992C: @ 807992C
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r5, _080799CC
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	bl sub_8079BFC
	movs r3, 0x16
	ldrsh r1, [r4, r3]
	lsls r1, 3
	adds r1, r0, r1
	str r1, [r5]
	movs r6, 0
	ldrsh r2, [r1, r6]
	ldr r0, _080799D0
	cmp r2, r0
	beq _080799D4
	cmp r2, r0
	bgt _08079A34
	subs r0, 0x1
	cmp r2, r0
	beq _080799DA
	ldrb r0, [r1, 0x5]
	cmp r0, 0
	bne _0807997A
	ldrh r0, [r1]
	strh r0, [r4, 0x1C]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x1E]
	ldrb r0, [r1, 0x4]
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
	adds r0, r1, 0
	adds r0, 0x8
	str r0, [r5]
_0807997A:
	ldr r1, [r5]
	ldrh r0, [r1]
	ldrh r2, [r4, 0x1C]
	adds r0, r2
	strh r0, [r4, 0x1C]
	ldrh r0, [r1, 0x2]
	ldrh r3, [r4, 0x1E]
	adds r0, r3
	strh r0, [r4, 0x1E]
	ldrh r0, [r4, 0x20]
	ldrb r1, [r1, 0x4]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0x1C
	ldrsh r1, [r4, r6]
	movs r3, 0x1E
	ldrsh r2, [r4, r3]
	ldrh r3, [r4, 0x20]
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8079A64
	ldrh r0, [r4, 0x18]
	adds r0, 0x1
	strh r0, [r4, 0x18]
	lsls r0, 16
	asrs r0, 16
	ldr r1, [r5]
	ldrb r1, [r1, 0x5]
	cmp r0, r1
	blt _08079A5A
	movs r0, 0
	strh r0, [r4, 0x18]
	b _08079A2C
	.align 2, 0
_080799CC: .4byte gUnknown_0202F7D4
_080799D0: .4byte 0x00007ffe
_080799D4:
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x16]
	b _08079A5A
_080799DA:
	ldrh r2, [r1, 0x2]
	movs r6, 0x2
	ldrsh r0, [r1, r6]
	cmp r0, 0
	beq _08079A2C
	ldrh r1, [r4, 0x1A]
	movs r3, 0x1A
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _080799FA
	subs r0, r1, 0x1
	strh r0, [r4, 0x1A]
	lsls r0, 16
	cmp r0, 0
	bne _080799FC
	b _08079A2C
_080799FA:
	strh r2, [r4, 0x1A]
_080799FC:
	movs r6, 0x16
	ldrsh r0, [r4, r6]
	cmp r0, 0
	beq _08079A5A
	ldr r3, _08079A24
	ldr r5, _08079A28
_08079A08:
	ldrh r2, [r4, 0x16]
	subs r1, r2, 0x1
	strh r1, [r4, 0x16]
	ldr r0, [r3]
	subs r0, 0x8
	str r0, [r3]
	movs r6, 0
	ldrsh r0, [r0, r6]
	cmp r0, r5
	beq _08079A58
	lsls r0, r1, 16
	cmp r0, 0
	bne _08079A08
	b _08079A5A
	.align 2, 0
_08079A24: .4byte gUnknown_0202F7D4
_08079A28: .4byte 0x00007ffd
_08079A2C:
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
	b _08079A5A
_08079A34:
	ldr r2, _08079A54
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x26]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F40
	movs r0, 0
	b _08079A5C
	.align 2, 0
_08079A54: .4byte gSprites
_08079A58:
	strh r2, [r4, 0x16]
_08079A5A:
	movs r0, 0x1
_08079A5C:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_807992C

	thumb_func_start sub_8079A64
sub_8079A64: @ 8079A64
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_8079B10
	lsls r0, 16
	lsrs r0, 15
	movs r1, 0x40
	subs r5, r1, r0
	ldr r1, _08079AB0
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r4, r0, r1
	ldrb r1, [r4, 0x3]
	lsls r1, 26
	lsrs r1, 27
	lsls r0, r5, 8
	ldr r2, _08079AB4
	lsls r1, 3
	adds r1, r2
	movs r2, 0x6
	ldrsh r1, [r1, r2]
	bl __divsi3
	cmp r0, 0x80
	ble _08079AA0
	movs r0, 0x80
_08079AA0:
	subs r0, r5, r0
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r4, 0x26]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08079AB0: .4byte gSprites
_08079AB4: .4byte gOamMatrices
	thumb_func_end sub_8079A64

	thumb_func_start sub_8079AB8
sub_8079AB8: @ 8079AB8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 24
	lsrs r0, 24
	bl sub_8079B10
	lsls r0, 16
	lsrs r0, 15
	movs r1, 0x40
	subs r5, r1, r0
	ldr r1, _08079B08
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r4, r0, r1
	ldrb r1, [r4, 0x3]
	lsls r1, 26
	lsrs r1, 27
	lsls r0, r5, 8
	ldr r2, _08079B0C
	lsls r1, 3
	adds r1, r2
	movs r2, 0x6
	ldrsh r1, [r1, r2]
	bl __divsi3
	cmp r0, 0x80
	ble _08079AF8
	movs r0, 0x80
_08079AF8:
	subs r0, r5, r0
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r4, 0x26]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08079B08: .4byte gSprites
_08079B0C: .4byte gOamMatrices
	thumb_func_end sub_8079AB8

	thumb_func_start sub_8079B10
sub_8079B10: @ 8079B10
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _08079B44
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	movs r4, 0
	ldr r1, _08079B48
	ldr r6, _08079B4C
	lsrs r5, r0, 22
_08079B2C:
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, r2
	bne _08079BE0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08079B54
	ldr r0, _08079B50
	ldrh r1, [r0]
	b _08079B96
	.align 2, 0
_08079B44: .4byte gSprites
_08079B48: .4byte gUnknown_02024BE0
_08079B4C: .4byte gMonBackPicCoords
_08079B50: .4byte 0x02019348
_08079B54:
	lsls r0, r4, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08079B9E
	ldr r0, _08079B88
	adds r1, r5, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08079B94
	ldr r1, _08079B8C
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08079B90
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	b _08079B96
	.align 2, 0
_08079B88: .4byte 0x02017800
_08079B8C: .4byte gUnknown_02024A6A
_08079B90: .4byte gPlayerParty
_08079B94:
	ldrh r1, [r1, 0x2]
_08079B96:
	lsls r0, r1, 2
	adds r0, r6
	ldrb r0, [r0, 0x1]
	b _08079BEC
_08079B9E:
	ldr r0, _08079BC4
	adds r1, r5, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08079BD0
	ldr r1, _08079BC8
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08079BCC
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	b _08079BD2
	.align 2, 0
_08079BC4: .4byte 0x02017800
_08079BC8: .4byte gUnknown_02024A6A
_08079BCC: .4byte gEnemyParty
_08079BD0:
	ldrh r1, [r1, 0x2]
_08079BD2:
	ldr r0, _08079BDC
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	b _08079BEC
	.align 2, 0
_08079BDC: .4byte gMonFrontPicCoords
_08079BE0:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _08079B2C
	movs r0, 0x40
_08079BEC:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8079B10

	thumb_func_start sub_8079BF4
sub_8079BF4: @ 8079BF4
	strh r2, [r0]
	asrs r2, 16
	strh r2, [r1]
	bx lr
	thumb_func_end sub_8079BF4

	thumb_func_start sub_8079BFC
sub_8079BFC: @ 8079BFC
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	orrs r0, r1
	bx lr
	thumb_func_end sub_8079BFC

	thumb_func_start sub_8079C08
sub_8079C08: @ 8079C08
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r5, r3, 0
	ldr r0, [sp, 0x14]
	ldr r4, [sp, 0x18]
	ldr r6, [sp, 0x1C]
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 16
	lsrs r2, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 16
	lsrs r4, 16
	lsls r6, 16
	lsrs r6, 16
	mov r3, r8
	strh r6, [r3, 0x18]
	strh r1, [r3, 0x26]
	strh r2, [r3, 0x1A]
	strh r5, [r3, 0x1C]
	strh r0, [r3, 0x22]
	strh r4, [r3, 0x24]
	lsls r0, 16
	asrs r0, 16
	lsls r2, 16
	asrs r2, 16
	subs r0, r2
	adds r1, r6, 0
	bl __divsi3
	mov r1, r8
	strh r0, [r1, 0x1E]
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	subs r4, r5
	adds r0, r4, 0
	adds r1, r6, 0
	bl __divsi3
	mov r3, r8
	strh r0, [r3, 0x20]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8079C08

	thumb_func_start sub_8079C74
sub_8079C74: @ 8079C74
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x18]
	movs r2, 0x18
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _08079C86
	movs r0, 0
	b _08079CE2
_08079C86:
	subs r0, r1, 0x1
	strh r0, [r4, 0x18]
	lsls r0, 16
	cmp r0, 0
	beq _08079CA0
	ldrh r0, [r4, 0x1E]
	ldrh r3, [r4, 0x1A]
	adds r0, r3
	strh r0, [r4, 0x1A]
	ldrh r0, [r4, 0x20]
	ldrh r1, [r4, 0x1C]
	adds r0, r1
	b _08079CA6
_08079CA0:
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x1A]
	ldrh r0, [r4, 0x24]
_08079CA6:
	strh r0, [r4, 0x1C]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x1A
	ldrsh r1, [r4, r2]
	movs r3, 0x1C
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl obj_id_set_rotscale
	movs r0, 0x18
	ldrsh r3, [r4, r0]
	cmp r3, 0
	beq _08079CD0
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8079A64
	b _08079CE0
_08079CD0:
	ldr r2, _08079CE8
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r3, [r0, 0x26]
_08079CE0:
	ldrb r0, [r4, 0x18]
_08079CE2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08079CE8: .4byte gSprites
	thumb_func_end sub_8079C74

	thumb_func_start sub_8079CEC
sub_8079CEC: @ 8079CEC
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08079D18
	ldrb r0, [r0]
	movs r1, 0
	cmp r0, 0x1E
	bls _08079D0A
	movs r1, 0x1
	cmp r0, 0x64
	bls _08079D0A
	movs r1, 0x3
	cmp r0, 0xC8
	bhi _08079D0A
	movs r1, 0x2
_08079D0A:
	ldr r0, _08079D1C
	strh r1, [r0, 0xE]
	adds r0, r2, 0
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_08079D18: .4byte gUnknown_0202F7BE
_08079D1C: .4byte gUnknown_03004B00
	thumb_func_end sub_8079CEC

	thumb_func_start unref_sub_8079D20
unref_sub_8079D20: @ 8079D20
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r7, r4, 0
	ldr r6, _08079E14
	ldrb r0, [r6]
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08079D60
	ldr r2, _08079E18
	ldr r1, _08079E1C
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x3
	adds r2, r4, 0
	ands r2, r0
	lsls r2, 2
	ldrb r3, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
_08079D60:
	ldr r0, _08079E20
	mov r8, r0
	ldrb r0, [r0]
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08079D98
	ldr r2, _08079E18
	ldr r1, _08079E1C
	mov r3, r8
	ldrb r0, [r3]
	adds r0, r1
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x3
	adds r2, r4, 0
	ands r2, r0
	lsls r2, 2
	ldrb r3, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
_08079D98:
	ldrb r0, [r6]
	movs r5, 0x2
	eors r0, r5
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08079DD0
	ldr r2, _08079E18
	ldr r1, _08079E1C
	ldrb r0, [r6]
	eors r0, r5
	adds r0, r1
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x3
	adds r2, r4, 0
	ands r2, r0
	lsls r2, 2
	ldrb r3, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
_08079DD0:
	mov r1, r8
	ldrb r0, [r1]
	eors r0, r5
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08079E08
	ldr r2, _08079E18
	ldr r1, _08079E1C
	mov r3, r8
	ldrb r0, [r3]
	eors r0, r5
	adds r0, r1
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x3
	ands r7, r0
	lsls r3, r7, 2
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
_08079E08:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079E14: .4byte gUnknown_0202F7C9
_08079E18: .4byte gSprites
_08079E1C: .4byte gUnknown_02024BE0
_08079E20: .4byte gUnknown_0202F7C8
	thumb_func_end unref_sub_8079D20

	thumb_func_start sub_8079E24
sub_8079E24: @ 8079E24
	push {r4-r6,lr}
	movs r5, 0
	ldr r0, _08079E84
	ldrb r0, [r0]
	cmp r5, r0
	bge _08079E7E
	ldr r6, _08079E88
_08079E32:
	lsls r0, r5, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08079E74
	adds r0, r4, 0
	bl sub_8079E90
	ldr r3, _08079E8C
	adds r3, r5, r3
	ldrb r2, [r3]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r6
	adds r1, 0x43
	strb r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r2, [r0, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r2, r1
	movs r1, 0x8
	orrs r2, r1
	strb r2, [r0, 0x5]
_08079E74:
	adds r5, 0x1
	ldr r0, _08079E84
	ldrb r0, [r0]
	cmp r5, r0
	blt _08079E32
_08079E7E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08079E84: .4byte gUnknown_02024A68
_08079E88: .4byte gSprites
_08079E8C: .4byte gUnknown_02024BE0
	thumb_func_end sub_8079E24

	thumb_func_start sub_8079E90
sub_8079E90: @ 8079E90
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08079EAC
	cmp r4, 0x2
	bne _08079EA8
	movs r0, 0x1E
	b _08079ECC
_08079EA8:
	movs r0, 0x28
	b _08079ECC
_08079EAC:
	adds r0, r4, 0
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1E
	cmp r0, 0
	beq _08079ECA
	movs r1, 0x14
	cmp r0, 0x2
	beq _08079ECA
	movs r1, 0x32
	cmp r0, 0x1
	bne _08079ECA
	movs r1, 0x28
_08079ECA:
	adds r0, r1, 0
_08079ECC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8079E90

	thumb_func_start sub_8079ED4
sub_8079ED4: @ 8079ED4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08079EF0
	movs r0, 0x2
	b _08079F08
_08079EF0:
	cmp r4, 0
	beq _08079EF8
	cmp r4, 0x3
	bne _08079F00
_08079EF8:
	ldr r0, _08079EFC
	b _08079F02
	.align 2, 0
_08079EFC: .4byte REG_BG2CNT
_08079F00:
	ldr r0, _08079F10
_08079F02:
	ldr r0, [r0]
	lsls r0, 30
	lsrs r0, 30
_08079F08:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08079F10: .4byte REG_BG1CNT
	thumb_func_end sub_8079ED4

	thumb_func_start battle_get_per_side_status_permutated
battle_get_per_side_status_permutated: @ 8079F14
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08079F3A
	adds r0, r4, 0
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08079F36
	cmp r0, 0x3
	bne _08079F3A
_08079F36:
	movs r0, 0x2
	b _08079F3C
_08079F3A:
	movs r0, 0x1
_08079F3C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end battle_get_per_side_status_permutated

	thumb_func_start sub_8079F44
sub_8079F44: @ 8079F44
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	ldr r4, [sp, 0x38]
	ldr r5, [sp, 0x3C]
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 16
	lsrs r3, 16
	mov r9, r3
	lsls r4, 16
	lsrs r4, 16
	str r4, [sp, 0x10]
	lsls r5, 24
	lsrs r5, 24
	str r5, [sp, 0x14]
	lsls r0, r7, 3
	ldr r1, _08079FE0
	adds r0, r1
	bl LoadSpriteSheet
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	ldr r1, _08079FE4
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x2]
	bl AllocSpritePalette
	lsls r0, 24
	lsrs r4, r0, 24
	mov r0, r8
	cmp r0, 0
	bne _08079FF0
	adds r0, r6, 0
	ldr r1, [sp, 0x44]
	ldr r2, [sp, 0x40]
	bl species_and_otid_get_pal
	lsls r1, r4, 20
	movs r2, 0x80
	lsls r2, 17
	adds r1, r2
	lsrs r1, 16
	movs r2, 0x20
	bl LoadCompressedPalette
	lsls r0, r6, 3
	ldr r1, _08079FE8
	adds r0, r1
	ldr r2, _08079FEC
	lsls r5, r6, 2
	adds r2, r5, r2
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	str r3, [sp]
	str r6, [sp, 0x4]
	ldr r4, [sp, 0x40]
	str r4, [sp, 0x8]
	movs r4, 0x1
	str r4, [sp, 0xC]
	bl sub_800D378
	b _0807A02E
	.align 2, 0
_08079FE0: .4byte gUnknown_0837F5E0
_08079FE4: .4byte gSpriteTemplate_837F5B0
_08079FE8: .4byte gMonFrontPicTable
_08079FEC: .4byte gMonFrontPicCoords
_08079FF0:
	adds r0, r6, 0
	ldr r1, [sp, 0x44]
	ldr r2, [sp, 0x40]
	bl species_and_otid_get_pal
	lsls r1, r4, 20
	movs r2, 0x80
	lsls r2, 17
	adds r1, r2
	lsrs r1, 16
	movs r2, 0x20
	bl LoadCompressedPalette
	lsls r0, r6, 3
	ldr r1, _0807A068
	adds r0, r1
	ldr r2, _0807A06C
	lsls r5, r6, 2
	adds r2, r5, r2
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	str r3, [sp]
	str r6, [sp, 0x4]
	ldr r4, [sp, 0x40]
	str r4, [sp, 0x8]
	movs r4, 0
	str r4, [sp, 0xC]
	bl sub_800D378
_0807A02E:
	movs r2, 0x80
	lsls r2, 18
	mov r6, r10
	lsls r0, r6, 5
	ldr r1, _0807A070
	adds r0, r1
	ldr r1, _0807A074
	str r2, [r1]
	str r0, [r1, 0x4]
	ldr r0, _0807A078
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r2, r8
	cmp r2, 0
	bne _0807A084
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 3
	ldr r1, _0807A07C
	adds r0, r1
	mov r3, r9
	lsls r1, r3, 16
	asrs r1, 16
	ldr r2, _0807A080
	adds r2, r5, r2
	ldrb r2, [r2, 0x1]
	ldr r4, [sp, 0x10]
	adds r2, r4
	b _0807A09E
	.align 2, 0
_0807A068: .4byte gMonBackPicTable
_0807A06C: .4byte gMonBackPicCoords
_0807A070: .4byte 0x06010000
_0807A074: .4byte 0x040000d4
_0807A078: .4byte 0x84000200
_0807A07C: .4byte gSpriteTemplate_837F5B0
_0807A080: .4byte gMonFrontPicCoords
_0807A084:
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 3
	ldr r1, _0807A0E4
	adds r0, r1
	mov r6, r9
	lsls r1, r6, 16
	asrs r1, 16
	ldr r2, _0807A0E8
	adds r2, r5, r2
	ldrb r2, [r2, 0x1]
	ldr r3, [sp, 0x10]
	adds r2, r3
_0807A09E:
	lsls r2, 16
	asrs r2, 16
	ldr r3, [sp, 0x14]
	bl CreateSprite
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0807A0D0
	ldr r3, _0807A0EC
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x10
	adds r1, r0, r1
	ldr r2, _0807A0F0
	str r2, [r1]
	adds r0, r3
	movs r1, 0
	bl StartSpriteAffineAnim
_0807A0D0:
	adds r0, r4, 0
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807A0E4: .4byte gSpriteTemplate_837F5B0
_0807A0E8: .4byte gMonBackPicCoords
_0807A0EC: .4byte gSprites
_0807A0F0: .4byte gSpriteAffineAnimTable_81E7C18
	thumb_func_end sub_8079F44

	thumb_func_start sub_807A0F4
sub_807A0F4: @ 807A0F4
	push {lr}
	bl DestroySpriteAndFreeResources
	pop {r0}
	bx r0
	thumb_func_end sub_807A0F4

	thumb_func_start sub_807A100
sub_807A100: @ 807A100
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0807A1A4
	ldr r2, _0807A130
	ldrb r1, [r2, 0x4]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0807A134
	ldrh r7, [r2, 0x2]
	ldr r2, [r2, 0x10]
	b _0807A138
	.align 2, 0
_0807A130: .4byte 0x02019348
_0807A134:
	ldrh r7, [r2]
	ldr r2, [r2, 0x8]
_0807A138:
	cmp r7, 0xC9
	bne _0807A184
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r2
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r2
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r2
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r2
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0807A170
	movs r0, 0xC9
	b _0807A17A
_0807A170:
	movs r1, 0xCE
	lsls r1, 1
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
_0807A17A:
	lsls r1, r0, 2
	ldr r0, _0807A180
	b _0807A33C
	.align 2, 0
_0807A180: .4byte gMonBackPicCoords
_0807A184:
	ldr r0, _0807A19C
	cmp r7, r0
	bne _0807A18C
	b _0807A30C
_0807A18C:
	movs r0, 0xCE
	lsls r0, 1
	cmp r7, r0
	bhi _0807A258
	lsls r1, r7, 2
	ldr r0, _0807A1A0
	b _0807A33C
	.align 2, 0
_0807A19C: .4byte SPECIES_CASTFORM
_0807A1A0: .4byte gMonBackPicCoords
_0807A1A4:
	mov r0, r8
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0807A26C
	mov r0, r8
	lsls r2, r0, 2
	ldr r0, _0807A1EC
	adds r1, r2, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _0807A1F8
	ldr r0, _0807A1F0
	mov r1, r8
	lsls r4, r1, 1
	adds r4, r0
	ldrh r0, [r4]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _0807A1F4
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r7, r0, 16
	ldrh r0, [r4]
	muls r0, r6
	adds r0, r5
	movs r1, 0
	bl GetMonData
	adds r2, r0, 0
	b _0807A200
	.align 2, 0
_0807A1EC: .4byte 0x02017800
_0807A1F0: .4byte gUnknown_02024A6A
_0807A1F4: .4byte gPlayerParty
_0807A1F8:
	ldrh r7, [r1, 0x2]
	ldr r0, _0807A238
	adds r0, r2, r0
	ldr r2, [r0]
_0807A200:
	cmp r7, 0xC9
	bne _0807A250
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r2
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r2
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r2
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r2
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0807A23C
	movs r0, 0xC9
	b _0807A246
	.align 2, 0
_0807A238: .4byte gUnknown_02024E70
_0807A23C:
	movs r1, 0xCE
	lsls r1, 1
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
_0807A246:
	lsls r1, r0, 2
	ldr r0, _0807A24C
	b _0807A33C
	.align 2, 0
_0807A24C: .4byte gMonBackPicCoords
_0807A250:
	movs r0, 0xCE
	lsls r0, 1
	cmp r7, r0
	bls _0807A260
_0807A258:
	ldr r4, _0807A25C
	b _0807A33E
	.align 2, 0
_0807A25C: .4byte gMonBackPicCoords
_0807A260:
	lsls r1, r7, 2
	ldr r0, _0807A268
	b _0807A33C
	.align 2, 0
_0807A268: .4byte gMonBackPicCoords
_0807A26C:
	mov r0, r8
	lsls r2, r0, 2
	ldr r0, _0807A2A8
	adds r1, r2, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _0807A2B4
	ldr r0, _0807A2AC
	mov r1, r8
	lsls r4, r1, 1
	adds r4, r0
	ldrh r0, [r4]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _0807A2B0
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r7, r0, 16
	ldrh r0, [r4]
	muls r0, r6
	adds r0, r5
	movs r1, 0
	bl GetMonData
	adds r2, r0, 0
	b _0807A2BC
	.align 2, 0
_0807A2A8: .4byte 0x02017800
_0807A2AC: .4byte gUnknown_02024A6A
_0807A2B0: .4byte gEnemyParty
_0807A2B4:
	ldrh r7, [r1, 0x2]
	ldr r0, _0807A2F4
	adds r0, r2, r0
	ldr r2, [r0]
_0807A2BC:
	cmp r7, 0xC9
	bne _0807A306
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r2
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r2
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r2
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r2
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0807A2F8
	movs r0, 0xC9
	b _0807A302
	.align 2, 0
_0807A2F4: .4byte gUnknown_02024E70
_0807A2F8:
	movs r1, 0xCE
	lsls r1, 1
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
_0807A302:
	lsls r1, r0, 2
	b _0807A33A
_0807A306:
	ldr r0, _0807A31C
	cmp r7, r0
	bne _0807A328
_0807A30C:
	ldr r0, _0807A320
	add r0, r8
	ldrb r0, [r0]
	lsls r0, 2
	ldr r1, _0807A324
	adds r4, r0, r1
	b _0807A33E
	.align 2, 0
_0807A31C: .4byte SPECIES_CASTFORM
_0807A320: .4byte gUnknown_02024E84
_0807A324: .4byte gUnknownCastformCoords_0837F598
_0807A328:
	movs r0, 0xCE
	lsls r0, 1
	cmp r7, r0
	bls _0807A338
	ldr r4, _0807A334
	b _0807A33E
	.align 2, 0
_0807A334: .4byte gMonFrontPicCoords
_0807A338:
	lsls r1, r7, 2
_0807A33A:
	ldr r0, _0807A350
_0807A33C:
	adds r4, r1, r0
_0807A33E:
	mov r0, r9
	cmp r0, 0x6
	bhi _0807A3EE
	lsls r0, 2
	ldr r1, _0807A354
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807A350: .4byte gMonFrontPicCoords
_0807A354: .4byte _0807A358
	.align 2, 0
_0807A358:
	.4byte _0807A374
	.4byte _0807A37E
	.4byte _0807A3AA
	.4byte _0807A3C2
	.4byte _0807A386
	.4byte _0807A398
	.4byte _0807A3DA
_0807A374:
	ldrb r1, [r4]
	movs r0, 0xF
	ands r0, r1
	lsls r0, 3
	b _0807A3F0
_0807A37E:
	ldrb r0, [r4]
	lsrs r0, 4
	lsls r0, 3
	b _0807A3F0
_0807A386:
	mov r0, r8
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r4]
	lsrs r1, 4
	b _0807A3BC
_0807A398:
	mov r0, r8
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r4]
	lsrs r1, 4
	b _0807A3D4
_0807A3AA:
	mov r0, r8
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrb r2, [r4]
	movs r1, 0xF
	ands r1, r2
_0807A3BC:
	lsls r1, 2
	subs r0, r1
	b _0807A3F0
_0807A3C2:
	mov r0, r8
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrb r2, [r4]
	movs r1, 0xF
	ands r1, r2
_0807A3D4:
	lsls r1, 2
	adds r0, r1
	b _0807A3F0
_0807A3DA:
	mov r0, r8
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1F
	ldrb r1, [r4, 0x1]
	subs r0, r1
	b _0807A3F0
_0807A3EE:
	movs r0, 0
_0807A3F0:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_807A100

	thumb_func_start sub_807A3FC
sub_807A3FC: @ 807A3FC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r2
	mov r10, r3
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	cmp r1, 0
	bne _0807A41A
	movs r5, 0
	movs r6, 0x1
	b _0807A41E
_0807A41A:
	movs r5, 0x2
	movs r6, 0x3
_0807A41E:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r7, r0, 24
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _0807A470
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0807A470
	movs r0, 0x2
	eors r4, r0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r3, r0, 24
	mov r0, r8
	lsls r1, r0, 16
	lsls r2, r7, 16
	b _0807A47C
_0807A470:
	mov r0, r8
	lsls r1, r0, 16
	lsrs r5, r1, 16
	lsls r0, r7, 16
	lsrs r3, r0, 16
	adds r2, r0, 0
_0807A47C:
	asrs r0, r1, 16
	adds r0, r5
	asrs r0, 1
	mov r1, r9
	strh r0, [r1]
	asrs r0, r2, 16
	adds r0, r3
	asrs r0, 1
	mov r1, r10
	strh r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_807A3FC

	thumb_func_start sub_807A4A0
sub_807A4A0: @ 807A4A0
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x4
	lsls r6, r1, 24
	lsrs r6, 24
	ldr r0, _0807A538
	mov r10, r0
	bl object_new_hidden_with_callback
	mov r8, r0
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0807A53C
	mov r9, r0
	mov r0, r8
	lsls r3, r0, 4
	add r3, r8
	lsls r3, 2
	mov r0, r9
	adds r5, r3, r0
	lsls r4, r6, 4
	adds r4, r6
	lsls r4, 2
	add r4, r9
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x44
	str r3, [sp]
	bl memcpy
	adds r2, r5, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	ldrb r2, [r5, 0x5]
	movs r1, 0xD
	negs r1, r1
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r5, 0x5]
	ldrb r0, [r5, 0x1]
	ands r1, r0
	movs r0, 0x8
	orrs r1, r0
	strb r1, [r5, 0x1]
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 22
	ldrh r2, [r5, 0x4]
	ldr r0, _0807A540
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	movs r0, 0x1C
	add r9, r0
	ldr r3, [sp]
	add r3, r9
	mov r0, r10
	str r0, [r3]
	mov r0, r8
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0807A538: .4byte SpriteCallbackDummy
_0807A53C: .4byte gSprites
_0807A540: .4byte 0xfffffc00
	thumb_func_end sub_807A4A0

	thumb_func_start sub_807A544
sub_807A544: @ 807A544
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078650
	ldr r0, _0807A57C
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0807A584
	ldr r2, _0807A580
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x6]
	negs r0, r0
	strh r0, [r2, 0x6]
	adds r3, r4, 0
	adds r3, 0x3F
	ldrb r0, [r3]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r3]
	adds r1, r2, 0
	b _0807A58E
	.align 2, 0
_0807A57C: .4byte gUnknown_0202F7C8
_0807A580: .4byte gUnknown_03004B00
_0807A584:
	ldr r1, _0807A5B8
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
_0807A58E:
	ldrh r0, [r1, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x34]
	ldrh r0, [r1, 0xA]
	strh r0, [r4, 0x38]
	ldr r1, _0807A5BC
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _0807A5C0
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807A5B8: .4byte gUnknown_03004B00
_0807A5BC: .4byte move_anim_8074EE0
_0807A5C0: .4byte sub_8078504
	thumb_func_end sub_807A544

	thumb_func_start sub_807A5C4
sub_807A5C4: @ 807A5C4
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0807A5EC
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0807A5F4
	ldr r2, _0807A5F0
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	movs r1, 0x6
	ldrsh r0, [r2, r1]
	negs r0, r0
	strh r0, [r2, 0x6]
	adds r1, r2, 0
	b _0807A5FE
	.align 2, 0
_0807A5EC: .4byte gUnknown_0202F7C8
_0807A5F0: .4byte gUnknown_03004B00
_0807A5F4:
	ldr r1, _0807A630
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
_0807A5FE:
	ldrh r0, [r1, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x34]
	ldrh r0, [r1, 0xA]
	strh r0, [r4, 0x38]
	ldrb r1, [r1, 0xC]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r1, _0807A634
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _0807A638
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807A630: .4byte gUnknown_03004B00
_0807A634: .4byte move_anim_8074EE0
_0807A638: .4byte sub_8078504
	thumb_func_end sub_807A5C4

	thumb_func_start sub_807A63C
sub_807A63C: @ 807A63C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078650
	ldr r0, _0807A660
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0807A668
	ldr r0, _0807A664
	ldrh r1, [r4, 0x20]
	ldrh r2, [r0]
	subs r1, r2
	strh r1, [r4, 0x20]
	b _0807A674
	.align 2, 0
_0807A660: .4byte gUnknown_0202F7C8
_0807A664: .4byte gUnknown_03004B00
_0807A668:
	ldr r1, _0807A690
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	adds r0, r1, 0
_0807A674:
	ldrh r0, [r0, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, _0807A694
	str r0, [r4, 0x1C]
	ldr r1, _0807A698
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807A690: .4byte gUnknown_03004B00
_0807A694: .4byte sub_8078600
_0807A698: .4byte move_anim_8072740
	thumb_func_end sub_807A63C

	thumb_func_start sub_807A69C
sub_807A69C: @ 807A69C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0807A730
	adds r5, r1, r0
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0
	strh r0, [r5, 0x8]
	ldr r7, _0807A734
	ldrb r0, [r7]
	bl battle_side_get_owner
	lsls r0, 24
	movs r1, 0x8
	cmp r0, 0
	beq _0807A6D0
	movs r0, 0x8
	negs r0, r0
	adds r1, r0, 0
_0807A6D0:
	strh r1, [r5, 0xA]
	strh r6, [r5, 0xC]
	strh r6, [r5, 0xE]
	ldr r4, _0807A738
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x24]
	ldrh r2, [r5, 0x8]
	subs r1, r2
	strh r1, [r0, 0x24]
	ldr r0, _0807A73C
	bl AllocSpritePalette
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x10]
	strh r6, [r5, 0x12]
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	adds r0, 0x10
	lsls r0, 20
	lsrs r6, r0, 16
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	lsls r4, r0, 4
	ldrb r0, [r7]
	bl sub_8079E90
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x14]
	cmp r0, 0x14
	beq _0807A72C
	cmp r0, 0x28
	bne _0807A740
_0807A72C:
	movs r0, 0x2
	b _0807A742
	.align 2, 0
_0807A730: .4byte gTasks
_0807A734: .4byte gUnknown_0202F7C8
_0807A738: .4byte gSprites
_0807A73C: .4byte 0x00002771
_0807A740:
	movs r0, 0x3
_0807A742:
	strh r0, [r5, 0x14]
	lsls r0, r4, 1
	ldr r1, _0807A770
	adds r0, r1
	lsls r1, r6, 1
	ldr r2, _0807A774
	adds r1, r2
	ldr r2, _0807A778
	bl CpuSet
	ldr r0, _0807A77C
	ldrb r2, [r0, 0x2]
	ldrh r3, [r0]
	adds r0, r6, 0
	movs r1, 0x10
	bl BlendPalette
	ldr r0, _0807A780
	str r0, [r5]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807A770: .4byte gPlttBufferUnfaded
_0807A774: .4byte gPlttBufferFaded
_0807A778: .4byte REG_BG0CNT
_0807A77C: .4byte gUnknown_03004B00
_0807A780: .4byte sub_807A784
	thumb_func_end sub_807A69C

	thumb_func_start sub_807A784
sub_807A784: @ 807A784
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0807A7A8
	adds r4, r0, r1
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0807A7E8
	cmp r0, 0x1
	bgt _0807A7AC
	cmp r0, 0
	beq _0807A7B2
	b _0807A844
	.align 2, 0
_0807A7A8: .4byte gTasks
_0807A7AC:
	cmp r0, 0x2
	beq _0807A830
	b _0807A844
_0807A7B2:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_807A850
	ldr r2, _0807A7E4
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0xA]
	ldrh r2, [r0, 0x24]
	adds r1, r2
	strh r1, [r0, 0x24]
	ldrh r1, [r4, 0xE]
	adds r0, r1, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _0807A844
	strh r1, [r4, 0xE]
	b _0807A822
	.align 2, 0
_0807A7E4: .4byte gSprites
_0807A7E8:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_807A850
	ldr r3, _0807A82C
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x24]
	ldrh r2, [r4, 0xA]
	subs r1, r2
	strh r1, [r0, 0x24]
	ldrh r0, [r4, 0xE]
	subs r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	bne _0807A844
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	strh r2, [r1, 0x24]
_0807A822:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	b _0807A844
	.align 2, 0
_0807A82C: .4byte gSprites
_0807A830:
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0807A844
	ldr r0, _0807A84C
	bl FreeSpritePaletteByTag
	adds r0, r5, 0
	bl move_anim_task_del
_0807A844:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807A84C: .4byte 0x00002771
	thumb_func_end sub_807A784

	thumb_func_start sub_807A850
sub_807A850: @ 807A850
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	movs r0, 0
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	lsls r0, 16
	lsrs r7, r0, 16
	asrs r0, 16
	cmp r0, 0
	blt _0807A8C0
	ldr r5, _0807A8CC
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r3, r4, r5
	movs r0, 0x3
	ldrb r1, [r6, 0x14]
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x5]
	ldrb r1, [r6, 0x10]
	lsls r1, 4
	movs r2, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x5]
	movs r0, 0x8
	strh r0, [r3, 0x2E]
	mov r0, r8
	strh r0, [r3, 0x30]
	strh r7, [r3, 0x32]
	movs r0, 0x8
	ldrsh r1, [r6, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r0, [r0, 0x24]
	strh r0, [r3, 0x24]
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _0807A8D0
	str r0, [r4]
	ldrh r0, [r6, 0x12]
	adds r0, 0x1
	strh r0, [r6, 0x12]
_0807A8C0:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807A8CC: .4byte gSprites
_0807A8D0: .4byte sub_807A8D4
	thumb_func_end sub_807A850

	thumb_func_start sub_807A8D4
sub_807A8D4: @ 807A8D4
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	subs r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _0807A8FE
	ldr r2, _0807A904
	movs r0, 0x30
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x12]
	subs r1, 0x1
	strh r1, [r0, 0x12]
	adds r0, r3, 0
	bl obj_delete_but_dont_free_vram
_0807A8FE:
	pop {r0}
	bx r0
	.align 2, 0
_0807A904: .4byte gTasks
	thumb_func_end sub_807A8D4

	thumb_func_start sub_807A908
sub_807A908: @ 807A908
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _0807A93C
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0807A940
	movs r0, 0x5
	b _0807A942
	.align 2, 0
_0807A93C: .4byte gUnknown_0202F7C8
_0807A940:
	ldr r0, _0807A954
_0807A942:
	strh r0, [r5, 0x2E]
	ldr r0, _0807A958
	strh r0, [r5, 0x30]
	ldr r0, _0807A95C
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807A954: .4byte 0x0000fff6
_0807A958: .4byte 0x0000ffd8
_0807A95C: .4byte sub_807A960
	thumb_func_end sub_807A908

	thumb_func_start sub_807A960
sub_807A960: @ 807A960
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x32]
	adds r0, r1
	strh r0, [r4, 0x32]
	ldrh r5, [r4, 0x30]
	ldrh r2, [r4, 0x34]
	adds r0, r5, r2
	strh r0, [r4, 0x34]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r1, 0xA
	bl __divsi3
	strh r0, [r4, 0x24]
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	movs r1, 0xA
	bl __divsi3
	strh r0, [r4, 0x26]
	lsls r0, r5, 16
	asrs r0, 16
	movs r1, 0x14
	negs r1, r1
	cmp r0, r1
	bge _0807A99C
	adds r0, r5, 0x1
	strh r0, [r4, 0x30]
_0807A99C:
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	bge _0807A9B4
	adds r0, r4, 0
	bl move_anim_8072740
_0807A9B4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_807A960

	thumb_func_start sub_807A9BC
sub_807A9BC: @ 807A9BC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _0807A9F4
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x8]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x32]
	ldrh r0, [r5, 0xA]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x36]
	ldr r0, _0807A9F8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0807A9FC
	ldrh r0, [r5, 0x8]
	adds r0, 0x1E
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0xA]
	subs r0, 0x14
	b _0807AA0A
	.align 2, 0
_0807A9F4: .4byte gUnknown_03004B00
_0807A9F8: .4byte gUnknown_0202F7C9
_0807A9FC:
	ldrh r0, [r5, 0x8]
	subs r0, 0x1E
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0xA]
	subs r0, 0x50
_0807AA0A:
	strh r0, [r4, 0x22]
	ldr r0, _0807AA20
	str r0, [r4, 0x1C]
	ldr r1, _0807AA24
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807AA20: .4byte sub_8078B34
_0807AA24: .4byte move_anim_8072740
	thumb_func_end sub_807A9BC
