	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8141E38
sub_8141E38: @ 8141E38
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_8141E38

	thumb_func_start sub_8141E4C
sub_8141E4C: @ 8141E4C
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_8141E4C

	thumb_func_start sub_8141E64
sub_8141E64: @ 8141E64
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08141E80 @ =gMain
	ldr r1, _08141E84 @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x4
	bhi _08141EA0
	lsls r0, 2
	ldr r1, _08141E88 @ =_08141E8C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08141E80: .4byte gMain
_08141E84: .4byte 0x0000043c
_08141E88: .4byte _08141E8C
	.align 2, 0
_08141E8C:
	.4byte _08141EA0
	.4byte _08141EC0
	.4byte _08141EC6
	.4byte _08141F1C
	.4byte _08141F58
_08141EA0:
	movs r0, 0
	bl SetVBlankCallback
	bl sub_81433E0
	ldr r0, _08141EB8 @ =gMain
	ldr r2, _08141EBC @ =0x0000043c
	adds r0, r2
	movs r1, 0x1
	strb r1, [r0]
	b _08141F84
	.align 2, 0
_08141EB8: .4byte gMain
_08141EBC: .4byte 0x0000043c
_08141EC0:
	bl sub_8143570
	b _08141F38
_08141EC6:
	movs r0, 0x1
	negs r0, r0
	movs r4, 0
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _08141F04 @ =sub_8141E38
	bl SetVBlankCallback
	ldr r3, _08141F08 @ =0x04000208
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _08141F0C @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _08141F10 @ =REG_DISPSTAT
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08141F14 @ =gMain
	ldr r2, _08141F18 @ =0x0000043c
	adds r1, r2
	b _08141F3E
	.align 2, 0
_08141F04: .4byte sub_8141E38
_08141F08: .4byte 0x04000208
_08141F0C: .4byte 0x04000200
_08141F10: .4byte REG_DISPSTAT
_08141F14: .4byte gMain
_08141F18: .4byte 0x0000043c
_08141F1C:
	ldr r1, _08141F48 @ =REG_BLDCNT
	ldr r2, _08141F4C @ =0x00003f42
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0xE2
	lsls r2, 3
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0
	strh r0, [r1]
	bl sub_81435B8
_08141F38:
	ldr r1, _08141F50 @ =gMain
	ldr r0, _08141F54 @ =0x0000043c
	adds r1, r0
_08141F3E:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08141F84
	.align 2, 0
_08141F48: .4byte REG_BLDCNT
_08141F4C: .4byte 0x00003f42
_08141F50: .4byte gMain
_08141F54: .4byte 0x0000043c
_08141F58:
	bl UpdatePaletteFade
	ldr r0, _08141F7C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08141F84
	ldr r0, _08141F80 @ =sub_8141E4C
	bl SetMainCallback2
	movs r0, 0xDA
	lsls r0, 1
	bl PlayBGM
	movs r0, 0
	b _08141F86
	.align 2, 0
_08141F7C: .4byte gPaletteFade
_08141F80: .4byte sub_8141E4C
_08141F84:
	movs r0, 0x1
_08141F86:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8141E64

	thumb_func_start sub_8141F90
sub_8141F90: @ 8141F90
	push {r4,lr}
	bl sub_8141E64
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08141FB6
	ldr r0, _08141FBC @ =sub_8141FF8
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08141FC0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
_08141FB6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08141FBC: .4byte sub_8141FF8
_08141FC0: .4byte gTasks
	thumb_func_end sub_8141F90

	thumb_func_start sub_8141FC4
sub_8141FC4: @ 8141FC4
	push {lr}
	bl sub_8141E64
	lsls r0, 24
	cmp r0, 0
	bne _08141FEA
	ldr r0, _08141FF0 @ =sub_8141FF8
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08141FF4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x1
	strh r0, [r1, 0x8]
_08141FEA:
	pop {r0}
	bx r0
	.align 2, 0
_08141FF0: .4byte sub_8141FF8
_08141FF4: .4byte gTasks
	thumb_func_end sub_8141FC4

	thumb_func_start sub_8141FF8
sub_8141FF8: @ 8141FF8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _081420C8 @ =0x0201c000
	mov r9, r0
	ldr r1, _081420CC @ =gTasks
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xC]
	movs r7, 0
	ldr r4, _081420D0 @ =0xfffffe00
	mov r10, r4
_08142024:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _081420D4 @ =gPlayerParty
	adds r6, r1, r0
	adds r0, r6, 0
	movs r1, 0xB
	bl GetMonData
	adds r3, r0, 0
	cmp r3, 0
	beq _081420DC
	adds r0, r6, 0
	movs r1, 0x41
	bl GetMonData
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 2
	mov r1, r9
	adds r5, r1, r4
	ldr r2, _081420D8 @ =0x000001ff
	adds r1, r2, 0
	ands r0, r1
	ldrh r1, [r5, 0x8]
	mov r2, r10
	ands r1, r2
	orrs r1, r0
	strh r1, [r5, 0x8]
	adds r0, r6, 0
	movs r1, 0x1
	bl GetMonData
	str r0, [r5]
	adds r0, r6, 0
	movs r1, 0
	bl GetMonData
	mov r1, r9
	adds r1, 0x4
	adds r1, r4
	str r0, [r1]
	adds r0, r6, 0
	movs r1, 0x38
	bl GetMonData
	lsls r0, 1
	ldrb r2, [r5, 0x9]
	movs r1, 0x1
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x9]
	adds r0, r6, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	movs r2, 0
	mov r6, r8
	lsls r5, r6, 2
	mov r3, r9
	adds r3, 0xA
_081420A0:
	adds r1, r2, r4
	adds r1, r3, r1
	mov r6, sp
	adds r0, r6, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x9
	bls _081420A0
	ldr r0, _081420CC @ =gTasks
	mov r2, r8
	adds r1, r5, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xC]
	adds r0, 0x1
	strh r0, [r1, 0xC]
	b _08142108
	.align 2, 0
_081420C8: .4byte 0x0201c000
_081420CC: .4byte gTasks
_081420D0: .4byte 0xfffffe00
_081420D4: .4byte gPlayerParty
_081420D8: .4byte 0x000001ff
_081420DC:
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 2
	mov r4, r9
	adds r2, r4, r1
	ldrh r0, [r2, 0x8]
	mov r6, r10
	ands r0, r6
	strh r0, [r2, 0x8]
	str r3, [r2]
	mov r0, r9
	adds r0, 0x4
	adds r0, r1
	str r3, [r0]
	ldrb r1, [r2, 0x9]
	movs r0, 0x1
	ands r0, r1
	strb r0, [r2, 0x9]
	movs r0, 0xFF
	strb r0, [r2, 0xA]
	mov r0, r8
	lsls r5, r0, 2
_08142108:
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x5
	bls _08142024
	ldr r0, _08142158 @ =gUnknown_0203931C
	movs r3, 0
	str r3, [r0]
	ldr r4, _0814215C @ =gTasks
	mov r2, r8
	adds r1, r5, r2
	lsls r1, 3
	adds r2, r1, r4
	strh r3, [r2, 0xA]
	movs r0, 0xFF
	strh r0, [r2, 0x10]
	movs r7, 0
	adds r3, r4, 0
	adds r3, 0x8
	movs r2, 0xFF
_08142130:
	adds r0, r7, 0x5
	lsls r0, 1
	adds r0, r1
	adds r0, r3
	strh r2, [r0]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x5
	bls _08142130
	mov r6, r8
	adds r0, r5, r6
	lsls r0, 3
	adds r1, r0, r4
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _08142164
	ldr r0, _08142160 @ =sub_81422E8
	b _08142166
	.align 2, 0
_08142158: .4byte gUnknown_0203931C
_0814215C: .4byte gTasks
_08142160: .4byte sub_81422E8
_08142164:
	ldr r0, _08142178 @ =sub_814217C
_08142166:
	str r0, [r1]
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08142178: .4byte sub_814217C
	thumb_func_end sub_8141FF8

	thumb_func_start sub_814217C
sub_814217C: @ 814217C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _081421C4 @ =0x0201c000
	mov r9, r0
	movs r7, 0x80
	lsls r7, 6
	add r7, r9
	ldr r0, _081421C8 @ =gUnknown_02039324
	ldrb r0, [r0]
	cmp r0, 0
	bne _081421D4
	movs r4, 0
	mov r0, r8
	lsls r0, 2
	mov r10, r0
	ldr r5, _081421CC @ =0xfffe4000
	add r5, r9
	movs r3, 0xF0
	lsls r3, 9
	movs r2, 0
	ldr r1, _081421D0 @ =0x00001fff
_081421B2:
	adds r0, r4, r3
	adds r0, r5
	strb r2, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r1
	bls _081421B2
	b _081421E0
	.align 2, 0
_081421C4: .4byte 0x0201c000
_081421C8: .4byte gUnknown_02039324
_081421CC: .4byte 0xfffe4000
_081421D0: .4byte 0x00001fff
_081421D4:
	movs r0, 0x3
	bl sub_8125EC8
	mov r0, r8
	lsls r0, 2
	mov r10, r0
_081421E0:
	movs r4, 0
	ldrh r1, [r7, 0x8]
	ldr r2, _081421E8 @ =0x000001ff
	b _081421FA
	.align 2, 0
_081421E8: .4byte 0x000001ff
_081421EC:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r7, 0x78
	cmp r4, 0x31
	bhi _08142206
	ldrh r1, [r7, 0x8]
_081421FA:
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _081421EC
	cmp r4, 0x31
	bls _08142228
_08142206:
	ldr r5, _08142264 @ =0x0201e000
	adds r6, r5, 0
	adds r5, 0x78
	movs r4, 0
	subs r7, 0x78
_08142210:
	adds r0, r6, 0
	adds r1, r5, 0
	movs r2, 0x78
	bl memcpy
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r6, 0x78
	adds r5, 0x78
	cmp r4, 0x30
	bls _08142210
_08142228:
	adds r0, r7, 0
	mov r1, r9
	movs r2, 0x78
	bl memcpy
	movs r0, 0x2
	movs r1, 0xE
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08142268 @ =gMenuText_HOFSaving
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _0814226C @ =gTasks
	mov r0, r10
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _08142270 @ =sub_8142274
	str r1, [r0]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08142264: .4byte 0x0201e000
_08142268: .4byte gMenuText_HOFSaving
_0814226C: .4byte gTasks
_08142270: .4byte sub_8142274
	thumb_func_end sub_814217C

	thumb_func_start sub_8142274
sub_8142274: @ 8142274
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _081422A8 @ =gGameContinueCallback
	ldr r0, _081422AC @ =sub_8141FC4
	str r0, [r1]
	movs r0, 0x3
	bl TrySavingData
	movs r0, 0x37
	bl PlaySoundEffect
	ldr r1, _081422B0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081422B4 @ =sub_81422B8
	str r1, [r0]
	movs r1, 0x20
	strh r1, [r0, 0xE]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081422A8: .4byte gGameContinueCallback
_081422AC: .4byte sub_8141FC4
_081422B0: .4byte gTasks
_081422B4: .4byte sub_81422B8
	thumb_func_end sub_8142274

	thumb_func_start sub_81422B8
sub_81422B8: @ 81422B8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081422D8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrh r2, [r1, 0xE]
	movs r3, 0xE
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _081422DC
	subs r0, r2, 0x1
	strh r0, [r1, 0xE]
	b _081422E0
	.align 2, 0
_081422D8: .4byte gTasks
_081422DC:
	ldr r0, _081422E4 @ =sub_81422E8
	str r0, [r1]
_081422E0:
	pop {r0}
	bx r0
	.align 2, 0
_081422E4: .4byte sub_81422E8
	thumb_func_end sub_81422B8

	thumb_func_start sub_81422E8
sub_81422E8: @ 81422E8
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _08142314 @ =gWindowConfig_81E7198
	adds r0, r5, 0
	bl SetUpWindowConfig
	adds r0, r5, 0
	bl InitMenuWindow
	ldr r1, _08142318 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0814231C @ =sub_8142320
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08142314: .4byte gWindowConfig_81E7198
_08142318: .4byte gTasks
_0814231C: .4byte sub_8142320
	thumb_func_end sub_81422E8

	thumb_func_start sub_8142320
sub_8142320: @ 8142320
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r2, _08142350 @ =0x0201c000
	ldr r0, _08142354 @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldrh r6, [r1, 0xA]
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 2
	adds r4, r0, r2
	movs r2, 0xC
	ldrsh r0, [r1, r2]
	cmp r0, 0x3
	ble _0814235C
	ldr r1, _08142358 @ =gUnknown_0840B534
	b _0814235E
	.align 2, 0
_08142350: .4byte 0x0201c000
_08142354: .4byte gTasks
_08142358: .4byte gUnknown_0840B534
_0814235C:
	ldr r1, _081423F0 @ =gUnknown_0840B564
_0814235E:
	lsls r2, r6, 3
	adds r0, r2, r1
	ldrh r5, [r0]
	adds r0, r1, 0x2
	adds r0, r2, r0
	ldrh r3, [r0]
	adds r0, r1, 0x4
	adds r0, r2, r0
	ldrh r0, [r0]
	mov r9, r0
	adds r1, 0x6
	adds r2, r1
	ldrh r2, [r2]
	mov r8, r2
	ldrh r0, [r4, 0x8]
	lsls r0, 23
	lsrs r0, 23
	lsls r1, r5, 16
	asrs r1, 16
	lsls r2, r3, 16
	asrs r2, 16
	ldr r3, [r4]
	str r3, [sp]
	ldr r3, [r4, 0x4]
	str r3, [sp, 0x4]
	adds r3, r6, 0
	bl sub_81436BC
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _081423F4 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r2, r1, r3
	movs r4, 0
	mov r5, r9
	strh r5, [r2, 0x30]
	mov r5, r8
	strh r5, [r2, 0x32]
	strh r4, [r2, 0x2E]
	adds r3, 0x1C
	adds r1, r3
	ldr r2, _081423F8 @ =sub_81435DC
	str r2, [r1]
	ldr r5, _081423FC @ =gTasks
	adds r1, r6, 0x5
	lsls r1, 1
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r1, r4
	adds r2, r5, 0
	adds r2, 0x8
	adds r1, r2
	strh r0, [r1]
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r4, r5
	ldr r0, _08142400 @ =sub_8142404
	str r0, [r4]
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081423F0: .4byte gUnknown_0840B564
_081423F4: .4byte gSprites
_081423F8: .4byte sub_81435DC
_081423FC: .4byte gTasks
_08142400: .4byte sub_8142404
	thumb_func_end sub_8142320

	thumb_func_start sub_8142404
sub_8142404: @ 8142404
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08142470 @ =0x0201c000
	ldr r3, _08142474 @ =gTasks
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r5, r2, r3
	ldrh r1, [r5, 0xA]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r6, r0, r4
	ldr r4, _08142478 @ =gSprites
	adds r1, 0x5
	lsls r1, 1
	adds r1, r2
	adds r3, 0x8
	adds r1, r3
	movs r0, 0
	ldrsh r1, [r1, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x2E
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0814246A
	ldrh r2, [r6, 0x8]
	ldr r0, _0814247C @ =0x000001ff
	ands r0, r2
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _08142458
	lsls r0, r2, 23
	lsrs r0, 23
	movs r1, 0
	bl PlayCry1
_08142458:
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0xE
	bl sub_8143088
	movs r0, 0x78
	strh r0, [r5, 0xE]
	ldr r0, _08142480 @ =sub_8142484
	str r0, [r5]
_0814246A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08142470: .4byte 0x0201c000
_08142474: .4byte gTasks
_08142478: .4byte gSprites
_0814247C: .4byte 0x000001ff
_08142480: .4byte sub_8142484
	thumb_func_end sub_8142404

	thumb_func_start sub_8142484
sub_8142484: @ 8142484
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _081424BC @ =0x0201c000
	ldr r1, _081424C0 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r6, r0, 3
	adds r4, r6, r1
	ldrh r3, [r4, 0xA]
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 2
	adds r0, r2
	mov r9, r0
	ldrh r2, [r4, 0xE]
	movs r7, 0xE
	ldrsh r0, [r4, r7]
	mov r12, r1
	cmp r0, 0
	beq _081424C4
	subs r0, r2, 0x1
	strh r0, [r4, 0xE]
	b _0814255C
	.align 2, 0
_081424BC: .4byte 0x0201c000
_081424C0: .4byte gTasks
_081424C4:
	ldr r2, _0814253C @ =gUnknown_0203931C
	ldr r0, _08142540 @ =gSprites
	mov r8, r0
	adds r0, r3, 0x5
	lsls r0, 1
	adds r0, r6
	mov r1, r12
	adds r1, 0x8
	adds r6, r0, r1
	movs r7, 0
	ldrsh r1, [r6, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	movs r1, 0x80
	lsls r1, 9
	lsls r1, r0
	ldr r3, [r2]
	orrs r3, r1
	str r3, [r2]
	ldrh r2, [r4, 0xA]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bgt _08142550
	mov r7, r9
	ldrh r1, [r7, 0x1C]
	ldr r0, _08142544 @ =0x000001ff
	ands r0, r1
	cmp r0, 0
	beq _08142550
	adds r0, r2, 0x1
	strh r0, [r4, 0xA]
	ldr r0, _08142548 @ =0x0000735f
	str r0, [sp]
	adds r0, r3, 0
	movs r1, 0
	movs r2, 0xC
	movs r3, 0xC
	bl BeginNormalPaletteFade
	movs r0, 0
	ldrsh r1, [r6, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldr r0, _0814254C @ =sub_8142320
	str r0, [r4]
	b _0814255C
	.align 2, 0
_0814253C: .4byte gUnknown_0203931C
_08142540: .4byte gSprites
_08142544: .4byte 0x000001ff
_08142548: .4byte 0x0000735f
_0814254C: .4byte sub_8142320
_08142550:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	add r0, r12
	ldr r1, _0814256C @ =sub_8142570
	str r1, [r0]
_0814255C:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814256C: .4byte sub_8142570
	thumb_func_end sub_8142484

	thumb_func_start sub_8142570
sub_8142570: @ 8142570
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08142604 @ =0xffff0000
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r3, 0
	lsls r1, r4, 2
	adds r0, r1, r4
	lsls r5, r0, 3
	ldr r0, _08142608 @ =gTasks + 0x8
	mov r12, r0
	mov r8, r1
	ldr r6, _0814260C @ =gSprites
	movs r7, 0xD
	negs r7, r7
_0814259E:
	adds r0, r3, 0x5
	lsls r0, 1
	adds r0, r5
	mov r2, r12
	adds r1, r0, r2
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0xFF
	beq _081425C0
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r2, [r1, 0x5]
	adds r0, r7, 0
	ands r0, r2
	strb r0, [r1, 0x5]
_081425C0:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x5
	bls _0814259E
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0xF
	bl sub_8143068
	movs r0, 0x69
	bl PlaySoundEffect
	ldr r1, _08142610 @ =gTasks
	mov r2, r8
	adds r0, r2, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0xC8
	lsls r1, 1
	strh r1, [r0, 0xE]
	ldr r1, _08142614 @ =sub_8142618
	str r1, [r0]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08142604: .4byte 0xffff0000
_08142608: .4byte gTasks + 0x8
_0814260C: .4byte gSprites
_08142610: .4byte gTasks
_08142614: .4byte sub_8142618
	thumb_func_end sub_8142570

	thumb_func_start sub_8142618
sub_8142618: @ 8142618
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r7, _08142658 @ =gTasks
	lsls r4, r6, 2
	adds r0, r4, r6
	lsls r5, r0, 3
	adds r1, r5, r7
	ldrh r2, [r1, 0xE]
	movs r3, 0xE
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _0814265C
	subs r2, 0x1
	strh r2, [r1, 0xE]
	movs r0, 0x3
	ands r0, r2
	cmp r0, 0
	bne _081426D2
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x6E
	ble _081426D2
	bl sub_81438C4
	b _081426D2
	.align 2, 0
_08142658: .4byte gTasks
_0814265C:
	movs r3, 0
	mov r9, r4
	ldr r0, _081426E4 @ =gUnknown_0203931C
	mov r10, r0
	adds r4, r5, 0
	adds r7, 0x8
	mov r8, r7
	ldr r7, _081426E8 @ =gSprites
	movs r1, 0xD
	negs r1, r1
	mov r12, r1
	movs r5, 0x4
_08142674:
	adds r0, r3, 0x5
	lsls r0, 1
	adds r0, r4
	mov r2, r8
	adds r1, r0, r2
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0xFF
	beq _08142698
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	ldrb r2, [r1, 0x5]
	mov r0, r12
	ands r0, r2
	orrs r0, r5
	strb r0, [r1, 0x5]
_08142698:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x5
	bls _08142674
	mov r3, r10
	ldr r0, [r3]
	ldr r1, _081426EC @ =0x0000735f
	str r1, [sp]
	movs r1, 0
	movs r2, 0xC
	movs r3, 0xC
	bl BeginNormalPaletteFade
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _081426F0 @ =gTasks
	mov r2, r9
	adds r0, r2, r6
	lsls r0, 3
	adds r0, r1
	movs r1, 0x7
	strh r1, [r0, 0xE]
	ldr r1, _081426F4 @ =sub_81426F8
	str r1, [r0]
_081426D2:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081426E4: .4byte gUnknown_0203931C
_081426E8: .4byte gSprites
_081426EC: .4byte 0x0000735f
_081426F0: .4byte gTasks
_081426F4: .4byte sub_81426F8
	thumb_func_end sub_8142618

	thumb_func_start sub_81426F8
sub_81426F8: @ 81426F8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08142718 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r2, r1, r2
	ldrh r1, [r2, 0xE]
	movs r3, 0xE
	ldrsh r0, [r2, r3]
	cmp r0, 0xF
	ble _08142720
	ldr r0, _0814271C @ =sub_8142738
	str r0, [r2]
	b _0814272E
	.align 2, 0
_08142718: .4byte gTasks
_0814271C: .4byte sub_8142738
_08142720:
	adds r0, r1, 0x1
	strh r0, [r2, 0xE]
	ldr r1, _08142734 @ =REG_BLDALPHA
	movs r3, 0xE
	ldrsh r0, [r2, r3]
	lsls r0, 8
	strh r0, [r1]
_0814272E:
	pop {r0}
	bx r0
	.align 2, 0
_08142734: .4byte REG_BLDALPHA
	thumb_func_end sub_81426F8

	thumb_func_start sub_8142738
sub_8142738: @ 8142738
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xCA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r4, _08142784 @ =gWindowConfig_81E71B4
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	ldr r0, _08142788 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	movs r1, 0x78
	movs r2, 0x48
	movs r3, 0x6
	bl sub_81437A4
	ldr r2, _0814278C @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r2
	strh r0, [r1, 0x10]
	movs r0, 0x78
	strh r0, [r1, 0xE]
	ldr r0, _08142790 @ =sub_8142794
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08142784: .4byte gWindowConfig_81E71B4
_08142788: .4byte gSaveBlock2
_0814278C: .4byte gTasks
_08142790: .4byte sub_8142794
	thumb_func_end sub_8142738

	thumb_func_start sub_8142794
sub_8142794: @ 8142794
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081427B4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r1, [r4, 0xE]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _081427B8
	subs r0, r1, 0x1
	strh r0, [r4, 0xE]
	b _0814280A
	.align 2, 0
_081427B4: .4byte gTasks
_081427B8:
	ldr r2, _081427D8 @ =gSprites
	movs r3, 0x10
	ldrsh r1, [r4, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	ldrh r2, [r1, 0x20]
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	cmp r0, 0xA0
	beq _081427DC
	adds r0, r2, 0x1
	strh r0, [r1, 0x20]
	b _0814280A
	.align 2, 0
_081427D8: .4byte gSprites
_081427DC:
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0xF
	movs r3, 0x9
	bl MenuDrawTextWindow
	movs r0, 0x1
	movs r1, 0x2
	bl sub_8143300
	movs r0, 0x2
	movs r1, 0xE
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08142810 @ =gMenuText_HOFCongratulations
	movs r1, 0x4
	movs r2, 0xF
	bl MenuPrint
	ldr r0, _08142814 @ =sub_8142818
	str r0, [r4]
_0814280A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08142810: .4byte gMenuText_HOFCongratulations
_08142814: .4byte sub_8142818
	thumb_func_end sub_8142794

	thumb_func_start sub_8142818
sub_8142818: @ 8142818
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08142844 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0814283E
	movs r0, 0x4
	bl FadeOutBGM
	ldr r0, _08142848 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0814284C @ =sub_8142850
	str r0, [r1]
_0814283E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08142844: .4byte gMain
_08142848: .4byte gTasks
_0814284C: .4byte sub_8142850
	thumb_func_end sub_8142818

	thumb_func_start sub_8142850
sub_8142850: @ 8142850
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08142890 @ =gPlttBufferFaded
	ldr r1, _08142894 @ =gPlttBufferUnfaded
	movs r2, 0x80
	lsls r2, 2
	bl CpuSet
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r1, 0x8
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _08142898 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0814289C @ =sub_81428A0
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08142890: .4byte gPlttBufferFaded
_08142894: .4byte gPlttBufferUnfaded
_08142898: .4byte gTasks
_0814289C: .4byte sub_81428A0
	thumb_func_end sub_8142850

	thumb_func_start sub_81428A0
sub_81428A0: @ 81428A0
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _081428C4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081428BE
	adds r0, r2, 0
	bl DestroyTask
	ldr r0, _081428C8 @ =sub_81439D0
	bl SetMainCallback2
_081428BE:
	pop {r0}
	bx r0
	.align 2, 0
_081428C4: .4byte gPaletteFade
_081428C8: .4byte sub_81439D0
	thumb_func_end sub_81428A0

	thumb_func_start sub_81428CC
sub_81428CC: @ 81428CC
	push {r4,r5,lr}
	ldr r0, _081428E4 @ =gMain
	ldr r1, _081428E8 @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x5
	bhi _08142908
	lsls r0, 2
	ldr r1, _081428EC @ =_081428F0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081428E4: .4byte gMain
_081428E8: .4byte 0x0000043c
_081428EC: .4byte _081428F0
	.align 2, 0
_081428F0:
	.4byte _08142908
	.4byte _08142928
	.4byte _0814293C
	.4byte _08142980
	.4byte _081429C0
	.4byte _081429EC
_08142908:
	movs r0, 0
	bl SetVBlankCallback
	bl sub_81433E0
	ldr r0, _08142920 @ =gMain
	ldr r2, _08142924 @ =0x0000043c
	adds r0, r2
	movs r1, 0x1
	strb r1, [r0]
	b _08142A12
	.align 2, 0
_08142920: .4byte gMain
_08142924: .4byte 0x0000043c
_08142928:
	bl sub_8143570
	ldr r1, _08142934 @ =gMain
	ldr r3, _08142938 @ =0x0000043c
	adds r1, r3
	b _081429DC
	.align 2, 0
_08142934: .4byte gMain
_08142938: .4byte 0x0000043c
_0814293C:
	ldr r0, _08142968 @ =sub_8141E38
	bl SetVBlankCallback
	ldr r3, _0814296C @ =0x04000208
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _08142970 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _08142974 @ =REG_DISPSTAT
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08142978 @ =gMain
	ldr r4, _0814297C @ =0x0000043c
	adds r1, r4
	b _081429DC
	.align 2, 0
_08142968: .4byte sub_8141E38
_0814296C: .4byte 0x04000208
_08142970: .4byte 0x04000200
_08142974: .4byte REG_DISPSTAT
_08142978: .4byte gMain
_0814297C: .4byte 0x0000043c
_08142980:
	ldr r0, _081429AC @ =REG_BLDCNT
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bl sub_81435B8
	ldr r0, _081429B0 @ =0x0201c000
	adds r2, r0, 0
	ldr r1, _081429B4 @ =gUnknown_0840B57C
	ldm r1!, {r3-r5}
	stm r2!, {r3-r5}
	ldm r1!, {r3,r5}
	stm r2!, {r3,r5}
	bl sub_80C5CD4
	ldr r1, _081429B8 @ =gMain
	ldr r4, _081429BC @ =0x0000043c
	adds r1, r4
	b _081429DC
	.align 2, 0
_081429AC: .4byte REG_BLDCNT
_081429B0: .4byte 0x0201c000
_081429B4: .4byte gUnknown_0840B57C
_081429B8: .4byte gMain
_081429BC: .4byte 0x0000043c
_081429C0:
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	bl sub_80C5DCC
	lsls r0, 24
	cmp r0, 0
	beq _08142A12
	ldr r1, _081429E4 @ =gMain
	ldr r5, _081429E8 @ =0x0000043c
	adds r1, r5
_081429DC:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08142A12
	.align 2, 0
_081429E4: .4byte gMain
_081429E8: .4byte 0x0000043c
_081429EC:
	ldr r1, _08142A18 @ =REG_BLDCNT
	ldr r2, _08142A1C @ =0x00003f42
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r3, 0xE2
	lsls r3, 3
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08142A20 @ =sub_8142A28
	movs r1, 0
	bl CreateTask
	ldr r0, _08142A24 @ =sub_8141E4C
	bl SetMainCallback2
_08142A12:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08142A18: .4byte REG_BLDCNT
_08142A1C: .4byte 0x00003f42
_08142A20: .4byte sub_8142A28
_08142A24: .4byte sub_8141E4C
	thumb_func_end sub_81428CC

	thumb_func_start sub_8142A28
sub_8142A28: @ 8142A28
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0x3
	bl sub_8125EC8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08142A54
	ldr r0, _08142A4C @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _08142A50 @ =sub_8142FEC
	str r0, [r1]
	b _08142AEA
	.align 2, 0
_08142A4C: .4byte gTasks
_08142A50: .4byte sub_8142FEC
_08142A54:
	ldr r2, _08142A8C @ =0x0201e000
	movs r3, 0
	ldrh r1, [r2, 0x8]
	ldr r4, _08142A90 @ =0x000001ff
	adds r0, r4, 0
	ands r0, r1
	ldr r7, _08142A94 @ =gTasks
	lsls r6, r5, 2
	cmp r0, 0
	beq _08142A7E
_08142A68:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	adds r2, 0x78
	cmp r3, 0x31
	bhi _08142A98
	ldrh r1, [r2, 0x8]
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	bne _08142A68
_08142A7E:
	cmp r3, 0x31
	bhi _08142A98
	adds r0, r6, r5
	lsls r0, 3
	adds r0, r7
	subs r1, r3, 0x1
	b _08142AA0
	.align 2, 0
_08142A8C: .4byte 0x0201e000
_08142A90: .4byte 0x000001ff
_08142A94: .4byte gTasks
_08142A98:
	adds r0, r6, r5
	lsls r0, 3
	adds r0, r7
	movs r1, 0x31
_08142AA0:
	strh r1, [r0, 0x8]
	movs r0, 0xA
	bl GetGameStat
	ldr r2, _08142AF0 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r2
	strh r0, [r1, 0xA]
	movs r3, 0
	ldr r7, _08142AF4 @ =0x0600381a
	ldr r4, _08142AF8 @ =0x0600385a
_08142AB8:
	lsls r1, r3, 1
	adds r2, r1, r7
	adds r0, r3, 0x3
	strh r0, [r2]
	adds r1, r4
	adds r0, 0x11
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x10
	bls _08142AB8
	ldr r4, _08142AFC @ =gWindowConfig_81E7198
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	ldr r1, _08142AF0 @ =gTasks
	adds r0, r6, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08142B00 @ =sub_8142B04
	str r1, [r0]
_08142AEA:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08142AF0: .4byte gTasks
_08142AF4: .4byte 0x0600381a
_08142AF8: .4byte 0x0600385a
_08142AFC: .4byte gWindowConfig_81E7198
_08142B00: .4byte sub_8142B04
	thumb_func_end sub_8142A28

	thumb_func_start sub_8142B04
sub_8142B04: @ 8142B04
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r3, _08142BB8 @ =0x0201e000
	movs r5, 0
	ldr r1, _08142BBC @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r6, r1, 0
	ldr r2, _08142BC0 @ =gUnknown_0203931C
	cmp r5, r0
	bge _08142B3E
	adds r1, r0, 0
_08142B32:
	adds r3, 0x78
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r1
	blt _08142B32
_08142B3E:
	adds r4, r3, 0
	movs r0, 0
	str r0, [r2]
	mov r5, r8
	lsls r2, r5, 2
	adds r1, r2, r5
	lsls r1, 3
	adds r1, r6
	strh r0, [r1, 0xC]
	strh r0, [r1, 0x10]
	movs r5, 0
	str r2, [sp, 0xC]
	ldr r6, _08142BC4 @ =0x000001ff
	adds r2, r1, 0
_08142B5A:
	ldrh r1, [r4, 0x8]
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	beq _08142B6A
	ldrh r0, [r2, 0x10]
	adds r0, 0x1
	strh r0, [r2, 0x10]
_08142B6A:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r4, 0x14
	cmp r5, 0x5
	bls _08142B5A
	adds r4, r3, 0
	movs r5, 0
	ldr r1, _08142BBC @ =gTasks
	ldr r0, [sp, 0xC]
	add r0, r8
	lsls r7, r0, 3
	adds r6, r7, r1
	str r6, [sp, 0x8]
	adds r1, 0x8
	mov r9, r1
	ldr r0, _08142BC8 @ =gUnknown_0840B564
	mov r10, r0
_08142B8E:
	ldrh r1, [r4, 0x8]
	ldr r2, _08142BC4 @ =0x000001ff
	adds r0, r2, 0
	ands r0, r1
	adds r6, r1, 0
	cmp r0, 0
	beq _08142C30
	ldr r1, [sp, 0x8]
	movs r2, 0x10
	ldrsh r0, [r1, r2]
	cmp r0, 0x3
	ble _08142BD4
	lsls r1, r5, 3
	ldr r0, _08142BCC @ =gUnknown_0840B534
	adds r0, 0x4
	adds r0, r1, r0
	ldrh r3, [r0]
	ldr r0, _08142BD0 @ =gUnknown_0840B534 + 0x6
	adds r1, r0
	b _08142BE2
	.align 2, 0
_08142BB8: .4byte 0x0201e000
_08142BBC: .4byte gTasks
_08142BC0: .4byte gUnknown_0203931C
_08142BC4: .4byte 0x000001ff
_08142BC8: .4byte gUnknown_0840B564
_08142BCC: .4byte gUnknown_0840B534
_08142BD0: .4byte gUnknown_0840B534 + 0x6
_08142BD4:
	lsls r1, r5, 3
	mov r0, r10
	adds r0, 0x4
	adds r0, r1, r0
	ldrh r3, [r0]
	ldr r2, _08142C28 @ =gUnknown_0840B564 + 0x6
	adds r1, r2
_08142BE2:
	ldrh r2, [r1]
	lsls r0, r6, 23
	lsrs r0, 23
	lsls r1, r3, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	ldr r3, [r4]
	str r3, [sp]
	ldr r3, [r4, 0x4]
	str r3, [sp, 0x4]
	adds r3, r5, 0
	bl sub_81436BC
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08142C2C @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r3, [r1, 0x5]
	movs r6, 0xD
	negs r6, r6
	adds r2, r6, 0
	ands r3, r2
	movs r2, 0x4
	orrs r3, r2
	strb r3, [r1, 0x5]
	adds r1, r5, 0x5
	lsls r1, 1
	adds r1, r7
	add r1, r9
	strh r0, [r1]
	b _08142C3C
	.align 2, 0
_08142C28: .4byte gUnknown_0840B564 + 0x6
_08142C2C: .4byte gSprites
_08142C30:
	adds r0, r5, 0x5
	lsls r0, 1
	adds r0, r7
	add r0, r9
	movs r1, 0xFF
	strh r1, [r0]
_08142C3C:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r4, 0x14
	cmp r5, 0x5
	bls _08142B8E
	ldr r0, _08142CB0 @ =0xffff0000
	ldr r2, _08142CB4 @ =0x0000735f
	movs r1, 0xC
	bl BlendPalettes
	ldr r3, _08142CB8 @ =gStringVar1
	ldr r1, _08142CBC @ =gMenuText_HOFNumber
	adds r0, r3, 0
	bl StringCopy
	adds r3, r0, 0
	movs r5, 0xFC
	strb r5, [r3]
	movs r0, 0x14
	strb r0, [r3, 0x1]
	movs r0, 0x6
	strb r0, [r3, 0x2]
	adds r3, 0x3
	ldr r0, _08142CC0 @ =gTasks
	ldr r4, [sp, 0xC]
	add r4, r8
	lsls r4, 3
	adds r4, r0
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	adds r0, r3, 0
	bl ConvertIntToDecimalString
	adds r3, r0, 0
	strb r5, [r3]
	movs r0, 0x13
	strb r0, [r3, 0x1]
	movs r0, 0xF0
	strb r0, [r3, 0x2]
	movs r0, 0xFF
	strb r0, [r3, 0x3]
	ldr r0, _08142CB8 @ =gStringVar1
	movs r1, 0
	movs r2, 0
	bl MenuPrint
	ldr r0, _08142CC4 @ =sub_8142CC8
	str r0, [r4]
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08142CB0: .4byte 0xffff0000
_08142CB4: .4byte 0x0000735f
_08142CB8: .4byte gStringVar1
_08142CBC: .4byte gMenuText_HOFNumber
_08142CC0: .4byte gTasks
_08142CC4: .4byte sub_8142CC8
	thumb_func_end sub_8142B04

	thumb_func_start sub_8142CC8
sub_8142CC8: @ 8142CC8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08142DD0 @ =0x0201e000
	mov r8, r0
	movs r3, 0
	ldr r1, _08142DD4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	cmp r3, r0
	bge _08142CFE
	adds r1, r0, 0
_08142CF0:
	movs r0, 0x78
	add r8, r0
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r1
	blt _08142CF0
_08142CFE:
	movs r3, 0
	lsls r6, r4, 2
	adds r0, r6, r4
	lsls r5, r0, 3
	ldr r1, _08142DD8 @ =gTasks + 0x8
	mov r10, r1
	ldr r2, _08142DDC @ =gSprites
	mov r12, r2
	movs r0, 0xD
	negs r0, r0
	mov r9, r0
	movs r7, 0x4
_08142D16:
	adds r0, r3, 0x5
	lsls r0, 1
	adds r0, r5
	add r0, r10
	ldrh r1, [r0]
	cmp r1, 0xFF
	beq _08142D36
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r12
	ldrb r2, [r0, 0x5]
	mov r1, r9
	ands r1, r2
	orrs r1, r7
	strb r1, [r0, 0x5]
_08142D36:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x5
	bls _08142D16
	adds r1, r6, r4
	lsls r1, 3
	ldr r2, _08142DD4 @ =gTasks
	adds r5, r1, r2
	movs r2, 0xC
	ldrsh r0, [r5, r2]
	adds r0, 0x5
	lsls r0, 1
	adds r0, r1
	ldr r1, _08142DD4 @ =gTasks
	adds r1, 0x8
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08142DDC @ =gSprites
	adds r0, r1
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	strb r1, [r0, 0x5]
	lsrs r1, 4
	movs r0, 0x80
	lsls r0, 9
	lsls r0, r1
	ldr r1, _08142DE0 @ =0xffff0000
	eors r0, r1
	ldr r2, _08142DE4 @ =gUnknown_0203931C
	str r0, [r2]
	ldr r2, _08142DE8 @ =0x0000735f
	movs r1, 0xC
	bl BlendPalettesUnfaded
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	mov r1, r8
	adds r4, r1, r0
	ldrh r1, [r4, 0x8]
	ldr r0, _08142DEC @ =0x000001ff
	ands r0, r1
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _08142DB2
	bl StopCryAndClearCrySongs
	ldrh r0, [r4, 0x8]
	lsls r0, 23
	lsrs r0, 23
	movs r1, 0
	bl PlayCry1
_08142DB2:
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0xE
	bl sub_8143088
	ldr r0, _08142DF0 @ =sub_8142DF4
	str r0, [r5]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08142DD0: .4byte 0x0201e000
_08142DD4: .4byte gTasks
_08142DD8: .4byte gTasks + 0x8
_08142DDC: .4byte gSprites
_08142DE0: .4byte 0xffff0000
_08142DE4: .4byte gUnknown_0203931C
_08142DE8: .4byte 0x0000735f
_08142DEC: .4byte 0x000001ff
_08142DF0: .4byte sub_8142DF4
	thumb_func_end sub_8142CC8

	thumb_func_start sub_8142DF4
sub_8142DF4: @ 8142DF4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08142E88 @ =gMain
	ldrh r2, [r1, 0x2E]
	movs r0, 0x1
	ands r0, r2
	adds r3, r1, 0
	cmp r0, 0
	beq _08142EC4
	ldr r7, _08142E8C @ =gTasks
	lsls r0, r6, 2
	adds r1, r0, r6
	lsls r3, r1, 3
	adds r4, r3, r7
	ldrh r2, [r4, 0x8]
	movs r5, 0x8
	ldrsh r1, [r4, r5]
	mov r8, r0
	cmp r1, 0
	beq _08142E98
	subs r0, r2, 0x1
	strh r0, [r4, 0x8]
	movs r5, 0
	adds r7, 0x8
	mov r9, r7
	adds r7, r3, 0
_08142E30:
	adds r0, r5, 0x5
	lsls r0, 1
	adds r0, r7
	add r0, r9
	ldrb r1, [r0]
	cmp r1, 0xFF
	beq _08142E5E
	ldr r0, _08142E90 @ =gSprites
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	adds r4, r0
	ldrb r0, [r4, 0x5]
	lsrs r0, 4
	bl GetSpritePaletteTagByPaletteNum
	lsls r0, 16
	lsrs r0, 16
	bl FreeSpritePaletteByTag
	adds r0, r4, 0
	bl DestroySprite
_08142E5E:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x5
	bls _08142E30
	ldr r0, _08142E8C @ =gTasks
	mov r2, r8
	adds r1, r2, r6
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0xA]
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _08142E80
	subs r0, r2, 0x1
	strh r0, [r1, 0xA]
_08142E80:
	ldr r0, _08142E94 @ =sub_8142B04
	str r0, [r1]
	b _08142F64
	.align 2, 0
_08142E88: .4byte gMain
_08142E8C: .4byte gTasks
_08142E90: .4byte gSprites
_08142E94: .4byte sub_8142B04
_08142E98:
	bl IsCryPlayingOrClearCrySongs
	lsls r0, 24
	cmp r0, 0
	beq _08142EB2
	bl StopCryAndClearCrySongs
	ldr r0, _08142EB8 @ =gMPlay_BGM
	ldr r1, _08142EBC @ =0x0000ffff
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
_08142EB2:
	ldr r0, _08142EC0 @ =sub_8142F78
	str r0, [r4]
	b _08142F64
	.align 2, 0
_08142EB8: .4byte gMPlay_BGM
_08142EBC: .4byte 0x0000ffff
_08142EC0: .4byte sub_8142F78
_08142EC4:
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _08142F08
	bl IsCryPlayingOrClearCrySongs
	lsls r0, 24
	cmp r0, 0
	beq _08142EE6
	bl StopCryAndClearCrySongs
	ldr r0, _08142EF8 @ =gMPlay_BGM
	ldr r1, _08142EFC @ =0x0000ffff
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
_08142EE6:
	ldr r0, _08142F00 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _08142F04 @ =sub_8142F78
	str r0, [r1]
	b _08142F64
	.align 2, 0
_08142EF8: .4byte gMPlay_BGM
_08142EFC: .4byte 0x0000ffff
_08142F00: .4byte gTasks
_08142F04: .4byte sub_8142F78
_08142F08:
	movs r0, 0x40
	ands r0, r2
	cmp r0, 0
	beq _08142F38
	ldr r0, _08142F30 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0xC]
	movs r4, 0xC
	ldrsh r0, [r1, r4]
	cmp r0, 0
	beq _08142F38
	subs r0, r2, 0x1
	strh r0, [r1, 0xC]
	ldr r0, _08142F34 @ =sub_8142CC8
	str r0, [r1]
	b _08142F64
	.align 2, 0
_08142F30: .4byte gTasks
_08142F34: .4byte sub_8142CC8
_08142F38:
	ldrh r1, [r3, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08142F64
	ldr r1, _08142F70 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r2, r0, r1
	movs r5, 0xC
	ldrsh r1, [r2, r5]
	movs r3, 0x10
	ldrsh r0, [r2, r3]
	subs r0, 0x1
	cmp r1, r0
	bge _08142F64
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	strh r0, [r2, 0xC]
	ldr r0, _08142F74 @ =sub_8142CC8
	str r0, [r2]
_08142F64:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08142F70: .4byte gTasks
_08142F74: .4byte sub_8142CC8
	thumb_func_end sub_8142DF4

	thumb_func_start sub_8142F78
sub_8142F78: @ 8142F78
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08142FB4 @ =gPlttBufferFaded
	ldr r1, _08142FB8 @ =gPlttBufferUnfaded
	movs r2, 0x80
	lsls r2, 2
	bl CpuSet
	ldr r0, _08142FBC @ =0x0201c000
	adds r2, r0, 0
	ldr r1, _08142FC0 @ =gUnknown_0840B57C
	ldm r1!, {r3,r5,r6}
	stm r2!, {r3,r5,r6}
	ldm r1!, {r3,r5}
	stm r2!, {r3,r5}
	bl sub_80C5E38
	ldr r1, _08142FC4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08142FC8 @ =sub_8142FCC
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08142FB4: .4byte gPlttBufferFaded
_08142FB8: .4byte gPlttBufferUnfaded
_08142FBC: .4byte 0x0201c000
_08142FC0: .4byte gUnknown_0840B57C
_08142FC4: .4byte gTasks
_08142FC8: .4byte sub_8142FCC
	thumb_func_end sub_8142F78

	thumb_func_start sub_8142FCC
sub_8142FCC: @ 8142FCC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_80C5F98
	lsls r0, 24
	cmp r0, 0
	beq _08142FE6
	adds r0, r4, 0
	bl DestroyTask
	bl ReturnFromHallOfFamePC
_08142FE6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8142FCC

	thumb_func_start sub_8142FEC
sub_8142FEC: @ 8142FEC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	movs r1, 0xE
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08143020 @ =gMenuText_HOFCorrupt
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrintMessage
	ldr r1, _08143024 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08143028 @ =sub_814302C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08143020: .4byte gMenuText_HOFCorrupt
_08143024: .4byte gTasks
_08143028: .4byte sub_814302C
	thumb_func_end sub_8142FEC

	thumb_func_start sub_814302C
sub_814302C: @ 814302C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _08143056
	ldr r0, _0814305C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08143056
	ldr r0, _08143060 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08143064 @ =sub_8142F78
	str r0, [r1]
_08143056:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814305C: .4byte gMain
_08143060: .4byte gTasks
_08143064: .4byte sub_8142F78
	thumb_func_end sub_814302C

	thumb_func_start sub_8143068
sub_8143068: @ 8143068
	push {lr}
	lsls r2, r1, 24
	ldr r0, _08143084 @ =gMenuText_WelcomeToHOFAndDexRating
	movs r1, 0x80
	lsls r1, 17
	adds r2, r1
	lsrs r2, 24
	movs r1, 0
	movs r3, 0xF0
	bl sub_8072BD8
	pop {r0}
	bx r0
	.align 2, 0
_08143084: .4byte gMenuText_WelcomeToHOFAndDexRating
	thumb_func_end sub_8143068

	thumb_func_start sub_8143088
sub_8143088: @ 8143088
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	mov r9, r0
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	ldr r7, _08143188 @ =gStringVar1
	movs r0, 0xFC
	strb r0, [r7]
	movs r0, 0x13
	strb r0, [r7, 0x1]
	movs r0, 0x28
	strb r0, [r7, 0x2]
	movs r0, 0xFF
	strb r0, [r7, 0x3]
	mov r0, r9
	ldrh r2, [r0, 0x8]
	ldr r0, _0814318C @ =0x000001ff
	ands r0, r2
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _081430EA
	lsls r0, r2, 23
	lsrs r0, 23
	bl SpeciesToPokedexNum
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _08143190 @ =0x0000ffff
	cmp r6, r0
	beq _081430EA
	ldr r1, _08143194 @ =gOtherText_Number2
	adds r0, r7, 0
	bl StringCopy
	adds r7, r0, 0
	adds r1, r6, 0
	movs r2, 0x2
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
_081430EA:
	ldr r5, _08143188 @ =gStringVar1
	mov r1, r8
	adds r1, 0x4
	lsls r1, 24
	lsrs r1, 24
	mov r4, r10
	adds r4, 0x1
	lsls r2, r4, 24
	lsrs r2, 24
	adds r0, r5, 0
	bl MenuPrint
	adds r7, r5, 0
	movs r3, 0
	mov r1, r9
	ldrb r0, [r1, 0xA]
	str r4, [sp]
	mov r2, r8
	adds r2, 0x9
	str r2, [sp, 0xC]
	mov r6, r10
	adds r6, 0x3
	str r6, [sp, 0x8]
	cmp r0, 0xFF
	beq _0814313A
	mov r2, r9
	adds r2, 0xA
_08143120:
	adds r1, r7, r3
	adds r0, r2, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x9
	bhi _0814313A
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08143120
_0814313A:
	adds r7, r3
	movs r2, 0xFF
	strb r2, [r7]
	mov r1, r9
	ldrh r0, [r1, 0x8]
	ldr r1, _0814318C @ =0x000001ff
	ands r1, r0
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	bne _08143198
	movs r0, 0xFC
	strb r0, [r7]
	movs r0, 0x13
	strb r0, [r7, 0x1]
	movs r0, 0xA0
	strb r0, [r7, 0x2]
	strb r2, [r7, 0x3]
	ldr r0, _08143188 @ =gStringVar1
	ldr r2, [sp, 0xC]
	lsls r1, r2, 24
	lsrs r1, 24
	ldr r3, [sp]
	lsls r2, r3, 24
	lsrs r2, 24
	bl MenuPrint
	ldr r6, [sp, 0x8]
	lsls r1, r6, 24
	lsrs r1, 24
	mov r3, r10
	adds r3, 0x4
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0
	movs r2, 0x1D
	bl MenuZeroFillWindowRect
	b _081432E4
	.align 2, 0
_08143188: .4byte gStringVar1
_0814318C: .4byte 0x000001ff
_08143190: .4byte 0x0000ffff
_08143194: .4byte gOtherText_Number2
_08143198:
	movs r0, 0xFC
	strb r0, [r7]
	movs r0, 0x13
	strb r0, [r7, 0x1]
	movs r0, 0x3E
	strb r0, [r7, 0x2]
	adds r7, 0x3
	movs r0, 0xBA
	strb r0, [r7]
	adds r7, 0x1
	movs r3, 0
	ldr r2, _08143238 @ =gSpeciesNames
	mov r1, r9
	ldrh r0, [r1, 0x8]
	lsls r0, 23
	lsrs r0, 23
	movs r1, 0xB
	muls r0, r1
	adds r0, r2
	ldrb r0, [r0]
	mov r6, r8
	adds r6, 0x7
	str r6, [sp, 0x4]
	mov r1, r8
	adds r1, 0xD
	str r1, [sp, 0x10]
	cmp r0, 0xFF
	beq _08143204
	adds r5, r2, 0
	movs r4, 0xB
_081431D4:
	adds r1, r7, r3
	mov r6, r9
	ldrh r0, [r6, 0x8]
	lsls r0, 23
	lsrs r0, 23
	muls r0, r4
	adds r0, r3, r0
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x9
	bhi _08143204
	ldrh r0, [r6, 0x8]
	lsls r0, 23
	lsrs r0, 23
	muls r0, r4
	adds r0, r3, r0
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _081431D4
_08143204:
	adds r7, r3
	movs r0, 0
	strb r0, [r7]
	adds r7, 0x1
	mov r1, r9
	ldrh r0, [r1, 0x8]
	ldr r1, _0814323C @ =0x000001ff
	ands r1, r0
	cmp r1, 0x20
	beq _0814324A
	cmp r1, 0x1D
	beq _0814324A
	lsls r0, 23
	lsrs r0, 23
	mov r2, r9
	ldr r1, [r2, 0x4]
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08143240
	cmp r0, 0xFE
	beq _08143244
	b _0814324A
	.align 2, 0
_08143238: .4byte gSpeciesNames
_0814323C: .4byte 0x000001ff
_08143240:
	movs r0, 0xB5
	b _08143246
_08143244:
	movs r0, 0xB6
_08143246:
	strb r0, [r7]
	adds r7, 0x1
_0814324A:
	movs r4, 0xFC
	strb r4, [r7]
	movs r3, 0x13
	mov r8, r3
	strb r3, [r7, 0x1]
	movs r0, 0xA0
	strb r0, [r7, 0x2]
	movs r6, 0xFF
	mov r10, r6
	strb r6, [r7, 0x3]
	ldr r5, _081432F4 @ =gStringVar1
	ldr r0, [sp, 0xC]
	lsls r1, r0, 24
	lsrs r1, 24
	ldr r3, [sp]
	lsls r2, r3, 24
	lsrs r2, 24
	adds r0, r5, 0
	bl MenuPrint
	mov r6, r9
	ldrb r0, [r6, 0x9]
	lsrs r6, r0, 1
	ldr r1, _081432F8 @ =gOtherText_Level3
	adds r0, r5, 0
	bl StringCopy
	adds r7, r0, 0
	strb r4, [r7]
	movs r0, 0x14
	strb r0, [r7, 0x1]
	movs r0, 0x6
	strb r0, [r7, 0x2]
	adds r7, 0x3
	adds r0, r7, 0
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r7, r0, 0
	strb r4, [r7]
	mov r0, r8
	strb r0, [r7, 0x1]
	movs r0, 0x30
	strb r0, [r7, 0x2]
	mov r1, r10
	strb r1, [r7, 0x3]
	ldr r2, [sp, 0x4]
	lsls r1, r2, 24
	lsrs r1, 24
	ldr r3, [sp, 0x8]
	lsls r4, r3, 24
	lsrs r4, 24
	adds r0, r5, 0
	adds r2, r4, 0
	bl MenuPrint
	mov r0, r9
	ldrh r6, [r0]
	ldr r1, _081432FC @ =gOtherText_IDNumber
	adds r0, r5, 0
	bl StringCopy
	adds r7, r0, 0
	adds r1, r6, 0
	movs r2, 0x2
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	ldr r2, [sp, 0x10]
	lsls r1, r2, 24
	lsrs r1, 24
	adds r0, r5, 0
	adds r2, r4, 0
	bl MenuPrint
_081432E4:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081432F4: .4byte gStringVar1
_081432F8: .4byte gOtherText_Level3
_081432FC: .4byte gOtherText_IDNumber
	thumb_func_end sub_8143088

	thumb_func_start sub_8143300
sub_8143300: @ 8143300
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	adds r5, r0, 0
	adds r4, r1, 0
	lsls r5, 24
	lsls r4, 24
	ldr r0, _081433CC @ =gOtherText_Name
	lsrs r1, r5, 24
	mov r8, r1
	movs r2, 0x80
	lsls r2, 17
	adds r5, r2
	lsrs r5, 24
	lsrs r6, r4, 24
	adds r4, r2
	lsrs r4, 24
	adds r1, r5, 0
	adds r2, r4, 0
	bl MenuPrint
	ldr r0, _081433D0 @ =gSaveBlock2
	mov r10, r0
	movs r1, 0xE
	add r8, r1
	mov r2, r8
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	mov r1, r8
	adds r2, r4, 0
	bl MenuPrint_RightAligned
	ldr r0, _081433D4 @ =gOtherText_IDNumber2
	adds r4, r6, 0x3
	lsls r4, 24
	lsrs r4, 24
	adds r1, r5, 0
	adds r2, r4, 0
	bl MenuPrint
	mov r0, r10
	ldrb r1, [r0, 0xA]
	ldrb r0, [r0, 0xB]
	lsls r0, 8
	orrs r1, r0
	ldr r2, _081433D8 @ =gStringVar1
	mov r9, r2
	mov r0, r9
	movs r2, 0x2
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	mov r0, r9
	mov r1, r8
	adds r2, r4, 0
	bl MenuPrint_RightAligned
	ldr r0, _081433DC @ =gMainMenuString_Time
	adds r6, 0x5
	lsls r6, 24
	lsrs r6, 24
	adds r1, r5, 0
	adds r2, r6, 0
	bl MenuPrint
	mov r0, r10
	ldrh r1, [r0, 0xE]
	mov r0, r9
	bl ConvertIntToDecimalString
	adds r2, r0, 0
	movs r1, 0
	strb r1, [r2]
	movs r0, 0xF0
	strb r0, [r2, 0x1]
	strb r1, [r2, 0x2]
	adds r2, 0x3
	mov r0, r10
	ldrb r1, [r0, 0x10]
	adds r0, r2, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r2, r0, 0
	movs r0, 0xFF
	strb r0, [r2]
	mov r0, r9
	mov r1, r8
	adds r2, r6, 0
	bl MenuPrint_RightAligned
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081433CC: .4byte gOtherText_Name
_081433D0: .4byte gSaveBlock2
_081433D4: .4byte gOtherText_IDNumber2
_081433D8: .4byte gStringVar1
_081433DC: .4byte gMainMenuString_Time
	thumb_func_end sub_8143300

	thumb_func_start sub_81433E0
sub_81433E0: @ 81433E0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	movs r0, 0x80
	lsls r0, 19
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x8
	strh r1, [r0]
	adds r0, 0x8
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x8
	strh r1, [r0]
	adds r0, 0xA
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0xA
	strh r1, [r0]
	adds r0, 0xC
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0xC
	strh r1, [r0]
	adds r0, 0xE
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	movs r3, 0xC0
	lsls r3, 19
	movs r4, 0xC0
	lsls r4, 9
	add r0, sp, 0x4
	mov r8, r0
	ldr r1, _0814354C @ =gHallOfFame_Gfx
	mov r9, r1
	mov r2, sp
	movs r6, 0
	ldr r1, _08143550 @ =0x040000d4
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _08143554 @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_08143444:
	strh r6, [r2]
	mov r0, sp
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _08143444
	strh r6, [r2]
	mov r2, sp
	str r2, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r4, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0xE0
	lsls r0, 19
	movs r3, 0x80
	lsls r3, 3
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r2, _08143550 @ =0x040000d4
	mov r1, r8
	str r1, [r2]
	str r0, [r2, 0x4]
	lsrs r0, r3, 2
	movs r1, 0x85
	lsls r1, 24
	orrs r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r1, 0xA0
	lsls r1, 19
	mov r0, sp
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	lsrs r3, 1
	movs r0, 0x81
	lsls r0, 24
	orrs r3, r0
	str r3, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r1, 0xC0
	lsls r1, 19
	mov r0, r9
	bl LZ77UnCompVram
	movs r1, 0
	ldr r3, _08143558 @ =0x06003800
	movs r2, 0x1
_081434B2:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x3F
	bls _081434B2
	movs r1, 0
	ldr r5, _0814355C @ =0x02000000
	ldr r3, _08143560 @ =0x06003b80
	movs r2, 0x1
_081434CA:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xBF
	bls _081434CA
	movs r1, 0
	ldr r4, _08143564 @ =0x06003000
	movs r3, 0x2
	ldr r2, _08143568 @ =0x000003ff
_081434E2:
	lsls r0, r1, 1
	adds r0, r4
	strh r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r2
	bls _081434E2
	adds r2, r5, 0
	movs r3, 0x80
	lsls r3, 7
	mov r4, sp
	movs r6, 0
	ldr r1, _08143550 @ =0x040000d4
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _08143554 @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_0814350A:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r5
	subs r3, r5
	cmp r3, r5
	bhi _0814350A
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl ResetPaletteFade
	ldr r0, _0814356C @ =gHallOfFame_Pal
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814354C: .4byte gHallOfFame_Gfx
_08143550: .4byte 0x040000d4
_08143554: .4byte 0x81000800
_08143558: .4byte 0x06003800
_0814355C: .4byte 0x02000000
_08143560: .4byte 0x06003b80
_08143564: .4byte 0x06003000
_08143568: .4byte 0x000003ff
_0814356C: .4byte gHallOfFame_Pal
	thumb_func_end sub_81433E0

	thumb_func_start sub_8143570
sub_8143570: @ 8143570
	push {r4,lr}
	bl remove_some_task
	bl ResetTasks
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _081435A8 @ =gReservedSpritePaletteCount
	movs r0, 0x8
	strb r0, [r1]
	ldr r0, _081435AC @ =gUnknown_0840B514
	bl LoadCompressedObjectPic
	ldr r0, _081435B0 @ =gUnknown_0840B524
	bl LoadCompressedObjectPalette
	ldr r4, _081435B4 @ =gWindowConfig_81E71B4
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081435A8: .4byte gReservedSpritePaletteCount
_081435AC: .4byte gUnknown_0840B514
_081435B0: .4byte gUnknown_0840B524
_081435B4: .4byte gWindowConfig_81E71B4
	thumb_func_end sub_8143570

	thumb_func_start sub_81435B8
sub_81435B8: @ 81435B8
	ldr r1, _081435D8 @ =REG_BG1CNT
	movs r2, 0xE0
	lsls r2, 3
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	subs r2, 0xFD
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xE
	movs r2, 0xDA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	bx lr
	.align 2, 0
_081435D8: .4byte REG_BG1CNT
	thumb_func_end sub_81435B8

	thumb_func_start sub_81435DC
sub_81435DC: @ 81435DC
	push {r4,lr}
	adds r2, r0, 0
	ldr r1, [r2, 0x20]
	ldr r0, [r2, 0x30]
	cmp r1, r0
	beq _08143632
	ldrh r3, [r2, 0x20]
	movs r1, 0x20
	ldrsh r0, [r2, r1]
	movs r4, 0x30
	ldrsh r1, [r2, r4]
	cmp r0, r1
	bge _081435FC
	adds r0, r3, 0
	adds r0, 0xF
	strh r0, [r2, 0x20]
_081435FC:
	ldrh r3, [r2, 0x20]
	movs r4, 0x20
	ldrsh r0, [r2, r4]
	cmp r0, r1
	ble _0814360C
	adds r0, r3, 0
	subs r0, 0xF
	strh r0, [r2, 0x20]
_0814360C:
	ldrh r3, [r2, 0x22]
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	movs r4, 0x32
	ldrsh r1, [r2, r4]
	cmp r0, r1
	bge _08143620
	adds r0, r3, 0
	adds r0, 0xA
	strh r0, [r2, 0x22]
_08143620:
	ldrh r3, [r2, 0x22]
	movs r4, 0x22
	ldrsh r0, [r2, r4]
	cmp r0, r1
	ble _0814363A
	adds r0, r3, 0
	subs r0, 0xA
	strh r0, [r2, 0x22]
	b _0814363A
_08143632:
	movs r0, 0x1
	strh r0, [r2, 0x2E]
	ldr r0, _08143640 @ =nullsub_81
	str r0, [r2, 0x1C]
_0814363A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08143640: .4byte nullsub_81
	thumb_func_end sub_81435DC

	thumb_func_start nullsub_81
nullsub_81: @ 8143644
	bx lr
	thumb_func_end nullsub_81

	thumb_func_start sub_8143648
sub_8143648: @ 8143648
	push {r4-r7,lr}
	lsls r1, 24
	ldr r4, _08143670 @ =gUnknown_02024E8C
	adds r3, r4, 0
	ldr r2, _08143674 @ =gUnknown_0840B6B8
	ldm r2!, {r5-r7}
	stm r3!, {r5-r7}
	ldm r2!, {r5-r7}
	stm r3!, {r5-r7}
	strh r0, [r4, 0x2]
	ldr r0, _08143678 @ =gUnknown_0840B69C
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	str r0, [r4, 0xC]
	ldr r0, _0814367C @ =gSpriteAnimTable_81E7C64
	str r0, [r4, 0x8]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08143670: .4byte gUnknown_02024E8C
_08143674: .4byte gUnknown_0840B6B8
_08143678: .4byte gUnknown_0840B69C
_0814367C: .4byte gSpriteAnimTable_81E7C64
	thumb_func_end sub_8143648

	thumb_func_start sub_8143680
sub_8143680: @ 8143680
	push {r4-r7,lr}
	lsls r1, 24
	ldr r4, _081436AC @ =gUnknown_02024E8C
	adds r3, r4, 0
	ldr r2, _081436B0 @ =gUnknown_0840B6B8
	ldm r2!, {r5-r7}
	stm r3!, {r5-r7}
	ldm r2!, {r5-r7}
	stm r3!, {r5-r7}
	strh r0, [r4, 0x2]
	ldr r0, _081436B4 @ =gUnknown_0840B69C
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	str r0, [r4, 0xC]
	ldr r0, _081436B8 @ =gUnknown_081EC2A4
	ldr r0, [r0]
	str r0, [r4, 0x8]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081436AC: .4byte gUnknown_02024E8C
_081436B0: .4byte gUnknown_0840B6B8
_081436B4: .4byte gUnknown_0840B69C
_081436B8: .4byte gUnknown_081EC2A4
	thumb_func_end sub_8143680

	thumb_func_start sub_81436BC
sub_81436BC: @ 81436BC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	adds r6, r0, 0
	mov r9, r1
	mov r10, r2
	mov r8, r3
	ldr r7, [sp, 0x34]
	lsls r6, 16
	lsrs r6, 16
	mov r0, r9
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	mov r1, r10
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	mov r2, r8
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	lsls r0, r6, 3
	ldr r1, _08143790 @ =gMonFrontPicTable
	adds r0, r1
	ldr r1, _08143794 @ =gMonFrontPicCoords
	lsls r2, r6, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08143798 @ =gUnknown_0840B5A0
	mov r12, r4
	mov r5, r8
	lsls r4, r5, 2
	add r4, r12
	ldr r4, [r4]
	str r4, [sp]
	str r6, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r4, 0x1
	str r4, [sp, 0xC]
	bl LoadSpecialPokePic
	adds r0, r6, 0
	ldr r1, [sp, 0x30]
	adds r2, r7, 0
	bl species_and_otid_get_pal
	lsls r4, r5, 4
	movs r2, 0x80
	lsls r2, 1
	adds r1, r4, r2
	lsls r1, 16
	lsrs r1, 16
	movs r2, 0x20
	bl LoadCompressedPalette
	lsls r1, r5, 24
	lsrs r1, 24
	mov r0, r8
	bl sub_8143648
	ldr r0, _0814379C @ =gUnknown_02024E8C
	mov r5, r9
	lsls r5, 16
	asrs r5, 16
	mov r9, r5
	mov r1, r10
	lsls r1, 16
	asrs r1, 16
	mov r10, r1
	movs r3, 0xA
	mov r2, r8
	subs r3, r2
	lsls r3, 24
	lsrs r3, 24
	mov r1, r9
	mov r2, r10
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _081437A0 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldrb r3, [r2, 0x5]
	movs r1, 0xF
	ands r1, r3
	orrs r1, r4
	strb r1, [r2, 0x5]
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08143790: .4byte gMonFrontPicTable
_08143794: .4byte gMonFrontPicCoords
_08143798: .4byte gUnknown_0840B5A0
_0814379C: .4byte gUnknown_02024E8C
_081437A0: .4byte gSprites
	thumb_func_end sub_81436BC

	thumb_func_start sub_81437A4
sub_81437A4: @ 81437A4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	mov r9, r1
	mov r10, r2
	adds r6, r3, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	lsls r2, 16
	lsrs r2, 16
	mov r10, r2
	lsls r6, 16
	lsrs r6, 16
	lsls r7, r0, 3
	ldr r1, _08143854 @ =gTrainerFrontPicTable
	mov r8, r1
	add r8, r7
	ldr r1, _08143858 @ =gTrainerFrontPicCoords
	lsls r2, r0, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r5, _0814385C @ =gUnknown_0840B5A0
	lsls r4, r6, 2
	adds r4, r5
	ldr r4, [r4]
	str r4, [sp]
	str r0, [sp, 0x4]
	mov r0, r8
	bl DecompressPicFromTable_2
	ldr r0, _08143860 @ =gTrainerFrontPicPaletteTable
	adds r0, r7, r0
	ldr r0, [r0]
	lsls r4, r6, 4
	movs r2, 0x80
	lsls r2, 1
	adds r1, r4, r2
	lsls r1, 16
	lsrs r1, 16
	movs r2, 0x20
	bl LoadCompressedPalette
	lsls r1, r6, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl sub_8143680
	ldr r0, _08143864 @ =gUnknown_02024E8C
	mov r1, r9
	lsls r1, 16
	asrs r1, 16
	mov r9, r1
	mov r2, r10
	lsls r2, 16
	asrs r2, 16
	mov r10, r2
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08143868 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldrb r3, [r2, 0x5]
	movs r1, 0xF
	ands r1, r3
	orrs r1, r4
	strb r1, [r2, 0x5]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08143854: .4byte gTrainerFrontPicTable
_08143858: .4byte gTrainerFrontPicCoords
_0814385C: .4byte gUnknown_0840B5A0
_08143860: .4byte gTrainerFrontPicPaletteTable
_08143864: .4byte gUnknown_02024E8C
_08143868: .4byte gSprites
	thumb_func_end sub_81437A4

	thumb_func_start sub_814386C
sub_814386C: @ 814386C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r1, [r5, 0x26]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	cmp r0, 0x78
	ble _08143882
	adds r0, r5, 0
	bl DestroySprite
	b _081438BA
_08143882:
	adds r0, r1, 0x1
	ldrh r1, [r5, 0x30]
	adds r0, r1
	strh r0, [r5, 0x26]
	ldrh r4, [r5, 0x2E]
	lsls r4, 24
	lsrs r4, 24
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	ands r0, r1
	adds r0, 0x8
	ldr r1, _081438C0 @ =gSineTable
	lsls r4, 1
	adds r4, r1
	movs r2, 0
	ldrsh r1, [r4, r2]
	muls r0, r1
	cmp r0, 0
	bge _081438B0
	adds r0, 0xFF
_081438B0:
	asrs r0, 8
	strh r0, [r5, 0x24]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x4
	strh r0, [r5, 0x2E]
_081438BA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081438C0: .4byte gSineTable
	thumb_func_end sub_814386C

	thumb_func_start sub_81438C4
sub_81438C4: @ 81438C4
	push {r4,lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF0
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl Random
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	movs r0, 0x7
	ands r2, r0
	negs r2, r2
	ldr r0, _08143934 @ =gSpriteTemplate_840B7A4
	lsls r4, 16
	asrs r4, 16
	lsls r2, 16
	asrs r2, 16
	adds r1, r4, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08143938 @ =gSprites
	adds r4, r1, r0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x11
	bl __umodsi3
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	bl Random
	movs r1, 0x3
	ands r1, r0
	cmp r1, 0
	beq _0814393C
	movs r0, 0
	b _0814393E
	.align 2, 0
_08143934: .4byte gSpriteTemplate_840B7A4
_08143938: .4byte gSprites
_0814393C:
	movs r0, 0x1
_0814393E:
	strh r0, [r4, 0x30]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81438C4

	.align 2, 0 @ Don't pad with nop.
