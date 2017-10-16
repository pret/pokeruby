	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

.section .text_80BC1D0

	thumb_func_start sub_80BD1FC
sub_80BD1FC: @ 80BD1FC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrb r0, [r5]
	cmp r0, 0
	beq _080BD278
	ldrb r0, [r5]
	bl sub_80BD12C
	lsls r0, 16
	lsrs r4, r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	beq _080BD278
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	beq _080BD254
	ldr r0, _080BD24C @ =gSaveBlock1
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 5
	adds r1, r0
	ldr r0, _080BD250 @ =0x00001a09
	adds r1, r0
	ldrb r1, [r1]
	lsls r0, r1, 28
	lsrs r0, 28
	cmp r0, 0x1
	beq _080BD278
	lsrs r0, r1, 6
	cmp r0, 0x2
	bne _080BD246
	ldrb r1, [r5, 0x1]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	bne _080BD278
_080BD246:
	lsls r4, 24
	lsrs r4, 24
	b _080BD26C
	.align 2, 0
_080BD24C: .4byte gSaveBlock1
_080BD250: .4byte 0x00001a09
_080BD254:
	bl sub_80BD170
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080BD26C
	bl sub_80BD1B0
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _080BD278
_080BD26C:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80BD034
	adds r0, r4, 0
	b _080BD27A
_080BD278:
	movs r0, 0
_080BD27A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD1FC

	thumb_func_start sub_80BD280
sub_80BD280: @ 80BD280
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xA0
	ldr r0, _080BD324 @ =gSaveBlock1 + 0x1A08
	mov r8, r0
	movs r2, 0x1
_080BD290:
	adds r1, r2, 0x1
	lsls r0, r1, 24
	lsrs r5, r0, 24
	mov r9, r1
	cmp r5, 0x13
	bhi _080BD30C
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 5
	mov r1, r8
	adds r6, r0, r1
	movs r7, 0xC0
_080BD2A8:
	ldrb r0, [r6, 0x1]
	adds r3, r7, 0
	ands r3, r0
	cmp r3, 0
	bne _080BD2C6
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 5
	add r0, r8
	ldrb r1, [r0, 0x1]
	adds r0, r7, 0
	ands r0, r1
	adds r4, r2, 0
	cmp r0, 0x40
	beq _080BD2DE
_080BD2C6:
	cmp r3, 0x80
	bne _080BD302
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 5
	add r0, r8
	ldrb r1, [r0, 0x1]
	adds r0, r7, 0
	ands r0, r1
	adds r4, r2, 0
	cmp r0, 0x80
	beq _080BD302
_080BD2DE:
	mov r0, sp
	adds r1, r6, 0
	movs r2, 0xA0
	bl memcpy
	adds r4, r5
	lsls r4, 5
	add r4, r8
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0xA0
	bl memcpy
	adds r0, r4, 0
	mov r1, sp
	movs r2, 0xA0
	bl memcpy
_080BD302:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080BD2A8
_080BD30C:
	mov r1, r9
	lsls r0, r1, 24
	lsrs r2, r0, 24
	cmp r2, 0x12
	bls _080BD290
	add sp, 0xA0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD324: .4byte gSaveBlock1 + 0x1A08
	thumb_func_end sub_80BD280

	thumb_func_start sub_80BD328
sub_80BD328: @ 80BD328
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	movs r4, 0x1
_080BD332:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 5
	adds r1, r0, r6
	ldrb r0, [r1, 0x1]
	lsrs r0, 6
	cmp r0, r5
	bne _080BD348
	adds r0, r1, 0
	bl sub_80BD1FC
_080BD348:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _080BD332
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80BD328

	thumb_func_start sub_80BD358
sub_80BD358: @ 80BD358
	push {r4-r6,lr}
	adds r5, r0, 0
	ldrb r0, [r5]
	cmp r0, 0
	beq _080BD372
	ldrb r0, [r5, 0x1]
	lsls r0, 27
	ldr r1, _080BD378 @ =gSaveBlock2
	lsrs r0, 31
	adds r4, r1, 0
	ldrb r1, [r4, 0x8]
	cmp r0, r1
	beq _080BD37C
_080BD372:
	movs r0, 0
	b _080BD3D4
	.align 2, 0
_080BD378: .4byte gSaveBlock2
_080BD37C:
	movs r2, 0
	adds r3, r5, 0
	adds r3, 0x9
	adds r6, r4, 0
	adds r6, 0xA
_080BD386:
	adds r0, r3, r2
	adds r1, r2, r6
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080BD372
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _080BD386
	movs r2, 0
	ldrb r0, [r5, 0x2]
	cmp r0, 0xFF
	bne _080BD3AA
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _080BD3D2
_080BD3AA:
	adds r3, r5, 0x2
	adds r0, r3, r2
	adds r1, r2, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080BD372
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x6
	bhi _080BD3D2
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080BD3AA
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080BD3AA
_080BD3D2:
	movs r0, 0x1
_080BD3D4:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD358

	thumb_func_start sub_80BD3DC
sub_80BD3DC: @ 80BD3DC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r10, r0
	mov r9, r1
	mov r8, r2
	movs r5, 0
	movs r6, 0
_080BD3F0:
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	bne _080BD41A
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 5
	mov r1, r10
	adds r4, r1, r0
	adds r0, r4, 0
	bl sub_80BD358
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BD41A
	adds r0, r4, 0
	bl sub_80BB4AC
	movs r0, 0x1
	orrs r5, r0
_080BD41A:
	movs r7, 0x2
	movs r0, 0x2
	ands r0, r5
	cmp r0, 0
	bne _080BD448
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 5
	mov r1, r9
	adds r4, r1, r0
	adds r0, r4, 0
	bl sub_80BD358
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BD448
	adds r0, r4, 0
	bl sub_80BB4AC
	orrs r5, r7
	lsls r0, r5, 24
	lsrs r5, r0, 24
_080BD448:
	movs r7, 0x4
	movs r0, 0x4
	ands r0, r5
	cmp r0, 0
	bne _080BD476
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 5
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	bl sub_80BD358
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BD476
	adds r0, r4, 0
	bl sub_80BB4AC
	orrs r5, r7
	lsls r0, r5, 24
	lsrs r5, r0, 24
_080BD476:
	cmp r5, 0x7
	beq _080BD484
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x13
	bls _080BD3F0
_080BD484:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BD3DC

	thumb_func_start sub_80BD494
sub_80BD494: @ 80BD494
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	mov r8, r1
	lsls r2, 24
	lsrs r7, r2, 24
	movs r5, 0
_080BD4A4:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 5
	mov r1, r8
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	beq _080BD4FE
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_80BD0EC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BD4FE
	cmp r7, 0
	bne _080BD4D0
	adds r0, r4, 0
	bl sub_80BB4AC
	b _080BD508
_080BD4D0:
	ldrh r0, [r6, 0xE]
	ldrh r3, [r4, 0xE]
	cmp r0, r3
	bls _080BD4E0
	adds r0, r4, 0
	bl sub_80BB4AC
	b _080BD508
_080BD4E0:
	ldrb r0, [r6, 0x1]
	lsls r0, 28
	lsrs r0, 28
	ldrb r1, [r4, 0x1]
	movs r3, 0x10
	negs r3, r3
	adds r2, r3, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x1]
	adds r0, r6, 0
	bl sub_80BB4AC
	movs r0, 0x1
	b _080BD50A
_080BD4FE:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080BD4A4
_080BD508:
	movs r0, 0
_080BD50A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD494

	thumb_func_start sub_80BD514
sub_80BD514: @ 80BD514
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r0
	adds r7, r1, 0
	mov r8, r2
	adds r6, r3, 0
	movs r5, 0x1
_080BD526:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 5
	mov r1, r9
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	beq _080BD578
	ldrb r1, [r4, 0x1]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0x40
	bne _080BD54E
	movs r2, 0x10
	negs r2, r2
	adds r0, r2, 0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
_080BD54E:
	adds r0, r4, 0
	adds r1, r7, 0
	adds r2, r5, 0
	bl sub_80BD494
	lsls r0, 24
	cmp r0, 0
	bne _080BD578
	adds r0, r4, 0
	mov r1, r8
	adds r2, r5, 0
	bl sub_80BD494
	lsls r0, 24
	cmp r0, 0
	bne _080BD578
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_80BD494
_080BD578:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080BD526
	movs r5, 0
_080BD584:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 5
	adds r4, r0, r7
	ldrb r0, [r4]
	cmp r0, 0
	beq _080BD5B8
	ldrb r0, [r4, 0x1]
	movs r2, 0x21
	negs r2, r2
	adds r1, r2, 0
	ands r0, r1
	strb r0, [r4, 0x1]
	adds r0, r4, 0
	mov r1, r8
	adds r2, r5, 0
	bl sub_80BD494
	lsls r0, 24
	cmp r0, 0
	bne _080BD5B8
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_80BD494
_080BD5B8:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080BD584
	movs r5, 0
	movs r0, 0x21
	negs r0, r0
	adds r7, r0, 0
_080BD5CA:
	lsls r0, r5, 2
	adds r0, r5
	lsls r4, r0, 5
	mov r2, r8
	adds r1, r4, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _080BD5EA
	ldrb r0, [r1, 0x1]
	ands r0, r7
	strb r0, [r1, 0x1]
	adds r0, r1, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_80BD494
_080BD5EA:
	adds r1, r4, r6
	ldrb r0, [r1]
	cmp r0, 0
	beq _080BD5F8
	ldrb r0, [r1, 0x1]
	ands r0, r7
	strb r0, [r1, 0x1]
_080BD5F8:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080BD5CA
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BD514

	thumb_func_start sub_80BD610
sub_80BD610: @ 80BD610
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	bl sub_80BD3DC
	ldr r0, _080BD670 @ =gSaveBlock1 + 0x1A08
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl sub_80BD514
	adds r0, r4, 0
	bl sub_80BD1FC
	adds r0, r5, 0
	bl sub_80BD1FC
	adds r0, r6, 0
	bl sub_80BD1FC
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80BD328
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80BD328
	adds r0, r6, 0
	movs r1, 0x1
	bl sub_80BD328
	adds r0, r4, 0
	movs r1, 0
	bl sub_80BD328
	adds r0, r5, 0
	movs r1, 0
	bl sub_80BD328
	adds r0, r6, 0
	movs r1, 0
	bl sub_80BD328
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BD670: .4byte gSaveBlock1 + 0x1A08
	thumb_func_end sub_80BD610

	thumb_func_start sub_80BD674
sub_80BD674: @ 80BD674
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r7, r2, 24
	movs r0, 0x60
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _080BD68C
	b _080BD790
_080BD68C:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _080BD69E
	cmp r0, 0x3
	beq _080BD6BA
	b _080BD6C8
_080BD69E:
	lsls r4, r5, 1
	adds r0, r6, r4
	movs r1, 0
	adds r2, r5, 0
	bl memset
	adds r4, r5
	adds r4, r6, r4
	adds r0, r4, 0
	movs r1, 0
	adds r2, r5, 0
	bl memset
	b _080BD6C8
_080BD6BA:
	lsls r0, r5, 1
	adds r0, r5
	adds r0, r6, r0
	movs r1, 0
	adds r2, r5, 0
	bl memset
_080BD6C8:
	cmp r7, 0x1
	beq _080BD6F0
	cmp r7, 0x1
	bgt _080BD6D6
	cmp r7, 0
	beq _080BD6E0
	b _080BD71C
_080BD6D6:
	cmp r7, 0x2
	beq _080BD700
	cmp r7, 0x3
	beq _080BD710
	b _080BD71C
_080BD6E0:
	adds r0, r6, r5
	lsls r2, r5, 1
	adds r1, r6, r2
	adds r2, r5
	adds r2, r6, r2
	bl sub_80BD610
	b _080BD71C
_080BD6F0:
	lsls r1, r5, 1
	adds r0, r6, r1
	adds r1, r5
	adds r1, r6, r1
	adds r2, r6, 0
	bl sub_80BD610
	b _080BD71C
_080BD700:
	lsls r0, r5, 1
	adds r0, r5
	adds r0, r6, r0
	adds r2, r6, r5
	adds r1, r6, 0
	bl sub_80BD610
	b _080BD71C
_080BD710:
	adds r1, r6, r5
	lsls r2, r5, 1
	adds r2, r6, r2
	adds r0, r6, 0
	bl sub_80BD610
_080BD71C:
	movs r3, 0x1
	ldr r6, _080BD798 @ =gSaveBlock1
	movs r5, 0x10
	negs r5, r5
	ldr r4, _080BD79C @ =0x00001a09
_080BD726:
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 5
	adds r0, r6
	adds r2, r0, r4
	ldrb r1, [r2]
	lsls r0, r1, 28
	lsrs r0, 28
	cmp r0, 0x1
	bne _080BD746
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	ands r0, r5
	strb r0, [r2]
_080BD746:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x13
	bls _080BD726
	bl sub_80BD280
	movs r3, 0x1
	ldr r4, _080BD798 @ =gSaveBlock1
	ldr r6, _080BD79C @ =0x00001a09
	adds r7, r4, 0
	movs r5, 0x3F
_080BD75E:
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 5
	adds r0, r4
	adds r2, r0, r6
	ldrb r1, [r2]
	lsrs r0, r1, 6
	cmp r0, 0x2
	bne _080BD776
	adds r0, r5, 0
	ands r0, r1
	strb r0, [r2]
_080BD776:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x13
	bls _080BD75E
	ldr r0, _080BD7A0 @ =0x00001a16
	adds r2, r7, r0
	ldrh r1, [r2]
	ldr r0, _080BD7A4 @ =0x0000ffff
	cmp r1, r0
	beq _080BD790
	adds r0, r1, 0x1
	strh r0, [r2]
_080BD790:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD798: .4byte gSaveBlock1
_080BD79C: .4byte 0x00001a09
_080BD7A0: .4byte 0x00001a16
_080BD7A4: .4byte 0x0000ffff
	thumb_func_end sub_80BD674

	.align 2, 0 @ Don't pad with nop.
