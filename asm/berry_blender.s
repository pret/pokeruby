	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text




	thumb_func_start sub_8052530
sub_8052530: @ 8052530
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x98
	ldr r1, _080525C8 @ =gOtherText_BPMAndDash
	mov r0, sp
	bl StringCopy
	mov r0, sp
	movs r1, 0x2
	movs r2, 0
	bl MenuPrint
	ldr r4, _080525CC @ =gUnknown_03000560
	movs r1, 0x1A
	ldrsh r0, [r4, r1]
	movs r1, 0x64
	bl __divsi3
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	mov r0, sp
	movs r2, 0x2
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	mov r0, sp
	movs r1, 0x6
	movs r2, 0
	bl MenuPrint
	movs r6, 0
	mov r2, sp
	adds r2, 0x3
	str r2, [sp, 0x84]
	mov r3, sp
	adds r3, 0x6
	str r3, [sp, 0x88]
	mov r0, sp
	adds r0, 0x9
	str r0, [sp, 0x8C]
	mov r1, sp
	adds r1, 0xC
	str r1, [sp, 0x90]
	adds r2, 0xC
	str r2, [sp, 0x94]
	mov r8, r4
	mov r7, sp
	ldr r3, _080525D0 @ =gBerries
	mov r9, r3
	ldr r0, _080525D4 @ =gUnknown_082165F8
	mov r10, r0
_0805259E:
	mov r1, r8
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, r6
	bne _080525D8
	movs r0, 0xEF
	strb r0, [r7]
	mov r0, r8
	adds r0, 0x1
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, 0x85
	lsls r0, 16
	lsrs r0, 16
	mov r1, sp
	adds r1, 0x1
	bl CopyItemName
	b _080525F8
	.align 2, 0
_080525C8: .4byte gOtherText_BPMAndDash
_080525CC: .4byte gUnknown_03000560
_080525D0: .4byte gBerries
_080525D4: .4byte gUnknown_082165F8
_080525D8:
	mov r0, r8
	adds r0, 0x1
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, 0x85
	lsls r0, 16
	lsrs r0, 16
	mov r1, sp
	bl CopyItemName
	movs r0, 0
	strb r0, [r7, 0x6]
	movs r0, 0xFF
	strb r0, [r7, 0x7]
_080525F8:
	lsls r5, r6, 1
	adds r5, r6
	adds r5, 0x3
	lsls r5, 24
	lsrs r5, 24
	mov r0, sp
	movs r1, 0x2
	adds r2, r5, 0
	bl MenuPrint
	mov r4, r8
	adds r4, 0x1
	adds r4, r6, r4
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r1, [r0, 0x15]
	mov r0, sp
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	mov r0, sp
	mov r1, r10
	bl StringAppend
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r1, [r0, 0x16]
	ldr r0, [sp, 0x84]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	mov r0, sp
	mov r1, r10
	bl StringAppend
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r1, [r0, 0x17]
	ldr r0, [sp, 0x88]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	mov r0, sp
	mov r1, r10
	bl StringAppend
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r1, [r0, 0x18]
	ldr r0, [sp, 0x8C]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	mov r0, sp
	mov r1, r10
	bl StringAppend
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r1, [r0, 0x19]
	ldr r0, [sp, 0x90]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	mov r0, sp
	mov r1, r10
	bl StringAppend
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r1, [r0, 0x1A]
	ldr r0, [sp, 0x94]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	movs r2, 0x1
	negs r2, r2
	add r3, sp, 0x80
	strb r2, [r3]
	movs r0, 0xFF
	strb r0, [r7, 0x11]
	mov r0, sp
	movs r1, 0x7
	adds r2, r5, 0
	bl MenuPrint
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bhi _080526EC
	b _0805259E
_080526EC:
	mov r1, r8
	ldrb r0, [r1, 0x8]
	cmp r0, 0
	beq _080527A4
	ldr r1, _080527B4 @ =gPokeblockNames
	mov r2, r8
	ldrb r0, [r2, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	mov r0, sp
	bl StringCopy
	mov r0, sp
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	mov r3, r8
	ldrb r1, [r3, 0x11]
	mov r0, sp
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	ldr r4, _080527B8 @ =gUnknown_082165F8
	mov r0, sp
	adds r1, r4, 0
	bl StringAppend
	mov r0, r8
	ldrb r1, [r0, 0x12]
	ldr r0, [sp, 0x84]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	mov r0, sp
	adds r1, r4, 0
	bl StringAppend
	mov r2, r8
	ldrb r1, [r2, 0x13]
	ldr r0, [sp, 0x88]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	mov r0, sp
	adds r1, r4, 0
	bl StringAppend
	mov r3, r8
	ldrb r1, [r3, 0x14]
	ldr r0, [sp, 0x8C]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	mov r0, sp
	adds r1, r4, 0
	bl StringAppend
	mov r0, r8
	ldrb r1, [r0, 0x15]
	ldr r0, [sp, 0x90]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	mov r0, sp
	adds r1, r4, 0
	bl StringAppend
	mov r2, r8
	ldrb r1, [r2, 0x16]
	ldr r0, [sp, 0x94]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	mov r1, sp
	ldrb r0, [r1, 0x11]
	add r3, sp, 0x80
	ldrb r3, [r3]
	orrs r0, r3
	strb r0, [r1, 0x11]
	mov r0, sp
	movs r1, 0x7
	movs r2, 0x11
	bl MenuPrint
_080527A4:
	add sp, 0x98
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080527B4: .4byte gPokeblockNames
_080527B8: .4byte gUnknown_082165F8
	thumb_func_end sub_8052530

	thumb_func_start sub_80527BC
sub_80527BC: @ 80527BC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x58
	ldr r0, _08052844 @ =gUnknown_020297DC
	ldrb r0, [r0]
	add r6, sp, 0x48
	cmp r0, 0x1
	bne _08052814
	movs r1, 0
	ldr r3, _08052848 @ =gUnknown_03004840
	movs r2, 0
_080527D6:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x9
	bls _080527D6
	bl Random
	ldr r1, _0805284C @ =gUnknown_03004830
	strh r0, [r1]
	ldr r1, _08052850 @ =gUnknown_020297E0
	movs r0, 0
	str r0, [r1]
	ldr r1, _08052844 @ =gUnknown_020297DC
	movs r0, 0x2
	strb r0, [r1]
	movs r4, 0
	ldr r2, _08052854 @ =0x02000000
	movs r1, 0
_08052800:
	adds r0, r4, r2
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xC7
	bls _08052800
	ldr r1, _08052858 @ =gUnknown_020297E8
	movs r0, 0
	strb r0, [r1]
_08052814:
	movs r4, 0
	movs r0, 0x1
	mov r8, r0
	ldr r7, _08052858 @ =gUnknown_020297E8
	ldr r5, _08052850 @ =gUnknown_020297E0
	ldr r1, _08052854 @ =0x02000000
	mov r9, r1
	ldr r3, _0805285C @ =gUnknown_020297E4
_08052824:
	str r3, [sp, 0x54]
	bl Random
	lsls r0, 16
	lsrs r0, 31
	mov r1, r8
	ands r0, r1
	ldr r3, [sp, 0x54]
	ldrb r1, [r7]
	cmp r0, r1
	bne _08052860
	ldr r0, [r5]
	adds r0, 0x1
	str r0, [r5]
	b _0805287A
	.align 2, 0
_08052844: .4byte gUnknown_020297DC
_08052848: .4byte gUnknown_03004840
_0805284C: .4byte gUnknown_03004830
_08052850: .4byte gUnknown_020297E0
_08052854: .4byte 0x02000000
_08052858: .4byte gUnknown_020297E8
_0805285C: .4byte gUnknown_020297E4
_08052860:
	ldr r2, [r3]
	lsls r0, r2, 1
	add r0, r9
	ldr r1, [r5]
	strh r1, [r0]
	adds r2, 0x1
	str r2, [r3]
	movs r0, 0
	str r0, [r5]
	ldrb r0, [r7]
	mov r1, r8
	eors r0, r1
	strb r0, [r7]
_0805287A:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x63
	bls _08052824
	mov r1, sp
	movs r0, 0xFF
	strb r0, [r1]
	ldr r0, _08052900 @ =gUnknown_03004830
	ldrh r1, [r0]
	adds r0, r6, 0
	movs r2, 0x2
	movs r3, 0x8
	bl ConvertIntToHexStringN
	mov r0, sp
	adds r1, r6, 0
	bl StringAppend
	ldr r1, _08052904 @ =gUnknown_082165F8
	mov r0, sp
	bl StringAppend
	ldr r0, _08052908 @ =gUnknown_020297E0
	ldr r1, [r0]
	adds r0, r6, 0
	movs r2, 0x2
	movs r3, 0x8
	bl ConvertIntToHexStringN
	mov r0, sp
	adds r1, r6, 0
	bl StringAppend
	ldr r1, _0805290C @ =gUnknown_08216600
	mov r0, sp
	bl StringAppend
	ldr r4, _08052910 @ =gUnknown_020297DC
	ldrb r0, [r4]
	cmp r0, 0x3
	bne _080528E8
	ldr r0, _08052914 @ =gUnknown_020297E4
	ldr r1, [r0]
	adds r0, r6, 0
	movs r2, 0x2
	movs r3, 0x10
	bl ConvertIntToHexStringN
	mov r0, sp
	adds r1, r6, 0
	bl StringAppend
	movs r0, 0
	strb r0, [r4]
_080528E8:
	mov r0, sp
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	add sp, 0x58
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052900: .4byte gUnknown_03004830
_08052904: .4byte gUnknown_082165F8
_08052908: .4byte gUnknown_020297E0
_0805290C: .4byte gUnknown_08216600
_08052910: .4byte gUnknown_020297DC
_08052914: .4byte gUnknown_020297E4
	thumb_func_end sub_80527BC

	thumb_func_start sub_8052918
sub_8052918: @ 8052918
	push {r4-r6,lr}
	sub sp, 0x4C
	ldr r2, _08052A88 @ =gMain
	ldrh r1, [r2, 0x2E]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	ldr r4, _08052A8C @ =gUnknown_03000560
	cmp r0, 0
	beq _0805294C
	movs r1, 0xFA
	lsls r1, 2
	adds r0, r1, 0
	ldrh r1, [r4, 0x1A]
	adds r0, r1
	strh r0, [r4, 0x1A]
	lsls r0, 16
	ldr r1, _08052A90 @ =0x75300000
	cmp r0, r1
	ble _08052946
	movs r0, 0xFA
	lsls r0, 2
	strh r0, [r4, 0x1A]
_08052946:
	ldrb r0, [r4, 0x10]
	adds r0, 0x1
	strb r0, [r4, 0x10]
_0805294C:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _08052972
	ldr r1, _08052A94 @ =0xfffffc18
	adds r0, r1, 0
	ldrh r1, [r4, 0x1A]
	adds r0, r1
	strh r0, [r4, 0x1A]
	lsls r0, 16
	cmp r0, 0
	bge _0805296C
	ldr r0, _08052A98 @ =0x00007530
	strh r0, [r4, 0x1A]
_0805296C:
	ldrb r0, [r4, 0x10]
	adds r0, 0x1
	strb r0, [r4, 0x10]
_08052972:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08052992
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	lsls r0, 24
	cmp r0, 0
	bge _0805298C
	movs r0, 0x3
	strb r0, [r4]
_0805298C:
	ldrb r0, [r4, 0x10]
	adds r0, 0x1
	strb r0, [r4, 0x10]
_08052992:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080529B4
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _080529AE
	movs r0, 0
	strb r0, [r4]
_080529AE:
	ldrb r0, [r4, 0x10]
	adds r0, 0x1
	strb r0, [r4, 0x10]
_080529B4:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080529E4
	adds r3, r4, 0
	movs r1, 0
	ldrsb r1, [r3, r1]
	adds r5, r3, 0x1
	adds r1, r5
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bge _080529DE
	movs r0, 0
	ldrsb r0, [r3, r0]
	adds r0, r5
	movs r1, 0x2A
	strb r1, [r0]
_080529DE:
	ldrb r0, [r4, 0x10]
	adds r0, 0x1
	strb r0, [r4, 0x10]
_080529E4:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08052A16
	ldr r3, _08052A8C @ =gUnknown_03000560
	movs r1, 0
	ldrsb r1, [r3, r1]
	adds r4, r3, 0x1
	adds r1, r4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x2A
	ble _08052A10
	movs r0, 0
	ldrsb r0, [r3, r0]
	adds r0, r4
	movs r1, 0
	strb r1, [r0]
_08052A10:
	ldrb r0, [r3, 0x10]
	adds r0, 0x1
	strb r0, [r3, 0x10]
_08052A16:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08052AA0
	movs r6, 0
	movs r4, 0
	ldr r5, _08052A8C @ =gUnknown_03000560
_08052A26:
	adds r0, r5, 0x1
	adds r2, r4, r0
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r0, 0x2A
	beq _08052A64
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r0, r4, 1
	mov r1, sp
	adds r1, r0
	adds r1, 0x4
	movs r0, 0
	ldrsb r0, [r2, r0]
	strh r0, [r1]
	add r0, sp, 0xC
	lsls r1, r4, 4
	adds r0, r1
	movs r1, 0
	ldrsb r1, [r2, r1]
	adds r1, 0x85
	lsls r1, 16
	lsrs r1, 16
	bl Blender_CopyBerryData
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _08052A26
_08052A64:
	cmp r6, 0x1
	bls _08052A9C
	add r0, sp, 0xC
	adds r1, r5, 0
	adds r1, 0x8
	lsls r2, r6, 24
	lsrs r2, 24
	adds r3, r5, 0
	adds r3, 0x11
	ldrh r4, [r5, 0x1A]
	str r4, [sp]
	bl sub_8050744
	ldrb r0, [r5, 0x10]
	adds r0, 0x1
	strb r0, [r5, 0x10]
	b _08052AA0
	.align 2, 0
_08052A88: .4byte gMain
_08052A8C: .4byte gUnknown_03000560
_08052A90: .4byte 0x75300000
_08052A94: .4byte 0xfffffc18
_08052A98: .4byte 0x00007530
_08052A9C:
	movs r0, 0xFF
	strb r0, [r5, 0x8]
_08052AA0:
	ldr r4, _08052AE8 @ =gUnknown_03000560
	ldrb r0, [r4, 0x10]
	cmp r0, 0
	beq _08052AB0
	bl sub_8052530
	movs r0, 0
	strb r0, [r4, 0x10]
_08052AB0:
	ldr r3, _08052AEC @ =gMain
	ldrh r1, [r3, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08052AD4
	ldr r2, _08052AF0 @ =gUnknown_020297DC
	ldrb r0, [r2]
	adds r1, r0, 0
	cmp r1, 0
	bne _08052ADC
	adds r0, 0x1
	strb r0, [r2]
	ldr r0, _08052AF4 @ =gUnknown_020297E0
	str r1, [r0]
	ldrh r0, [r3, 0x20]
	bl SeedRng
_08052AD4:
	ldr r0, _08052AF0 @ =gUnknown_020297DC
	ldrb r0, [r0]
	cmp r0, 0
	beq _08052AE0
_08052ADC:
	bl sub_80527BC
_08052AE0:
	add sp, 0x4C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08052AE8: .4byte gUnknown_03000560
_08052AEC: .4byte gMain
_08052AF0: .4byte gUnknown_020297DC
_08052AF4: .4byte gUnknown_020297E0
	thumb_func_end sub_8052918

	thumb_func_start sub_8052AF8
sub_8052AF8: @ 8052AF8
	push {lr}
	bl sub_8052918
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_8052AF8

	thumb_func_start ShowBerryBlenderRecordWindow
ShowBerryBlenderRecordWindow: @ 8052B14
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x20
	movs r0, 0x6
	movs r1, 0x3
	movs r2, 0x17
	movs r3, 0x10
	bl MenuDrawTextWindow
	ldr r0, _08052BBC @ =gMultiText_BerryBlenderMaxSpeedRecord
	movs r1, 0x8
	movs r2, 0x4
	bl MenuPrint
	ldr r0, _08052BC0 @ =gMultiText_2P3P4P
	movs r1, 0x8
	movs r2, 0x9
	bl MenuPrint
	movs r0, 0
	mov r8, r0
	ldr r0, _08052BC4 @ =gSaveBlock1
	movs r7, 0x90
	lsls r7, 20
	ldr r1, _08052BC8 @ =0x0000096c
	adds r6, r0, r1
	movs r0, 0
	mov r9, r0
_08052B50:
	ldrh r4, [r6]
	adds r0, r4, 0
	movs r1, 0x64
	bl __udivsi3
	adds r1, r0, 0
	mov r0, sp
	movs r2, 0x12
	movs r3, 0x1
	bl sub_8072C14
	adds r5, r0, 0
	mov r1, r9
	strb r1, [r5]
	movs r0, 0xAD
	strb r0, [r5, 0x1]
	strb r1, [r5, 0x2]
	adds r5, 0x3
	adds r0, r4, 0
	movs r1, 0x64
	bl __umodsi3
	adds r1, r0, 0
	adds r0, r5, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r5, r0, 0
	ldr r1, _08052BCC @ =gOtherText_RPM
	bl StringAppend
	lsrs r2, r7, 24
	mov r0, sp
	movs r1, 0xF
	bl MenuPrint
	movs r0, 0x80
	lsls r0, 18
	adds r7, r0
	adds r6, 0x2
	movs r1, 0x1
	add r8, r1
	mov r0, r8
	cmp r0, 0x2
	ble _08052B50
	add sp, 0x20
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052BBC: .4byte gMultiText_BerryBlenderMaxSpeedRecord
_08052BC0: .4byte gMultiText_2P3P4P
_08052BC4: .4byte gSaveBlock1
_08052BC8: .4byte 0x0000096c
_08052BCC: .4byte gOtherText_RPM
	thumb_func_end ShowBerryBlenderRecordWindow

	thumb_func_start sub_8052BD0
sub_8052BD0: @ 8052BD0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _08052C1C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08052BF6
	ldr r0, _08052C20 @ =0x0000016f
	bl PlayFanfare
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08052BF6:
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _08052C16
	ldr r0, _08052C24 @ =sBerryBlenderData
	ldr r0, [r0]
	movs r1, 0xBC
	lsls r1, 1
	adds r0, r1
	ldrh r0, [r0]
	bl PlayBGM
	adds r0, r5, 0
	bl DestroyTask
_08052C16:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08052C1C: .4byte gTasks
_08052C20: .4byte 0x0000016f
_08052C24: .4byte sBerryBlenderData
	thumb_func_end sub_8052BD0
