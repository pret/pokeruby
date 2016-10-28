	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start fullscreen_save_activate
fullscreen_save_activate: @ 8146E10
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08146E30 @ =sub_8146E50
	bl SetMainCallback2
	ldr r0, _08146E34 @ =gUnknown_0203933C
	strh r4, [r0]
	ldr r1, _08146E38 @ =gUnknown_0203933E
	movs r0, 0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08146E30: .4byte sub_8146E50
_08146E34: .4byte gUnknown_0203933C
_08146E38: .4byte gUnknown_0203933E
	thumb_func_end fullscreen_save_activate

	thumb_func_start sub_8146E3C
sub_8146E3C: @ 8146E3C
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_8146E3C

	thumb_func_start sub_8146E50
sub_8146E50: @ 8146E50
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	ldr r0, _08146FB0 @ =gMain
	ldr r1, _08146FB4 @ =0x0000043c
	adds r7, r0, r1
	ldrb r0, [r7]
	cmp r0, 0
	beq _08146E6C
	cmp r0, 0x1
	bne _08146E6C
	b _0814701C
_08146E6C:
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0x80
	lsls r0, 19
	mov r9, r0
	movs r1, 0
	strh r1, [r0]
	ldr r6, _08146FB8 @ =REG_BG3CNT
	strh r1, [r6]
	adds r0, 0xC
	mov r8, r0
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	ldr r5, _08146FBC @ =REG_BG0CNT
	strh r1, [r5]
	adds r0, 0x12
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	add r0, sp, 0x4
	strh r1, [r0]
	ldr r2, _08146FC0 @ =0x040000d4
	str r0, [r2]
	movs r1, 0xC0
	lsls r1, 19
	str r1, [r2, 0x4]
	ldr r0, _08146FC4 @ =0x8100c000
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r4, 0
	str r4, [sp, 0x8]
	add r0, sp, 0x8
	str r0, [r2]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r2, 0x4]
	ldr r0, _08146FC8 @ =0x85000100
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	add r0, sp, 0x4
	strh r4, [r0]
	str r0, [r2]
	movs r0, 0xA0
	lsls r0, 19
	str r0, [r2, 0x4]
	ldr r0, _08146FCC @ =0x81000200
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _08146FD0 @ =gUnknown_083F66F0
	bl LZ77UnCompVram
	ldr r0, _08146FD4 @ =gBirchBagTilemap
	ldr r1, _08146FD8 @ =0x06003000
	bl LZ77UnCompVram
	ldr r0, _08146FDC @ =gBirchGrassTilemap
	ldr r1, _08146FE0 @ =0x06003800
	bl LZ77UnCompVram
	ldr r0, _08146FE4 @ =gUnknown_08411980
	ldr r1, _08146FE8 @ =0x06010020
	bl LZ77UnCompVram
	bl ResetSpriteData
	bl ResetTasks
	bl ResetPaletteFade
	ldr r0, _08146FEC @ =gUnknown_083F62EC
	movs r1, 0
	movs r2, 0x40
	bl LoadPalette
	ldr r0, _08146FF0 @ =gUnknown_08411960
	movs r1, 0x80
	lsls r1, 1
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08146FF4 @ =gWindowConfig_81E6C3C
	bl SetUpWindowConfig
	ldr r0, _08146FF8 @ =gWindowConfig_81E6CE4
	bl InitMenuWindow
	.if REVISION >= 1
	movs r0, 0xD
	movs r1, 0x6
	movs r2, 0x10
	movs r3, 0x9
	.else
	movs r0, 0xD
	movs r1, 0x8
	movs r2, 0x10
	movs r3, 0xB
	.endif
	bl MenuDrawTextWindow
	.if REVISION >= 1
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0x13
	.else
	movs r0, 0x1
	movs r1, 0xC
	movs r2, 0x1C
	movs r3, 0x13
	.endif
	bl MenuDrawTextWindow
	ldr r0, _08146FFC @ =gSystemText_SaveFailedBackupCheck
	.if REVISION >= 1
	movs r1, 0x2
	movs r2, 0xB
	.else
	movs r1, 0x2
	movs r2, 0xD
	.endif
	bl MenuPrint
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r3, _08147000 @ =0x04000208
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _08147004 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _08147008 @ =REG_DISPSTAT
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0814700C @ =sub_8146E3C
	bl SetVBlankCallback
	ldr r1, _08147010 @ =0x00000703
	adds r0, r1, 0
	strh r0, [r6]
	ldr r1, _08147014 @ =0x00000602
	adds r0, r1, 0
	mov r1, r8
	strh r0, [r1]
	ldr r1, _08147018 @ =0x00001f08
	adds r0, r1, 0
	strh r0, [r5]
	movs r1, 0xEA
	lsls r1, 5
	adds r0, r1, 0
	mov r1, r9
	strh r0, [r1]
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
	b _08147032
	.align 2, 0
_08146FB0: .4byte gMain
_08146FB4: .4byte 0x0000043c
_08146FB8: .4byte REG_BG3CNT
_08146FBC: .4byte REG_BG0CNT
_08146FC0: .4byte 0x040000d4
_08146FC4: .4byte 0x8100c000
_08146FC8: .4byte 0x85000100
_08146FCC: .4byte 0x81000200
_08146FD0: .4byte gUnknown_083F66F0
_08146FD4: .4byte gBirchBagTilemap
_08146FD8: .4byte 0x06003000
_08146FDC: .4byte gBirchGrassTilemap
_08146FE0: .4byte 0x06003800
_08146FE4: .4byte gUnknown_08411980
_08146FE8: .4byte 0x06010020
_08146FEC: .4byte gUnknown_083F62EC
_08146FF0: .4byte gUnknown_08411960
_08146FF4: .4byte gWindowConfig_81E6C3C
_08146FF8: .4byte gWindowConfig_81E6CE4
_08146FFC: .4byte gSystemText_SaveFailedBackupCheck
_08147000: .4byte 0x04000208
_08147004: .4byte 0x04000200
_08147008: .4byte REG_DISPSTAT
_0814700C: .4byte sub_8146E3C
_08147010: .4byte 0x00000703
_08147014: .4byte 0x00000602
_08147018: .4byte 0x00001f08
_0814701C:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _08147032
	ldr r0, _08147040 @ =sub_8147048
	bl SetMainCallback2
	ldr r0, _08147044 @ =sub_8147218
	bl SetVBlankCallback
_08147032:
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08147040: .4byte sub_8147048
_08147044: .4byte sub_8147218
	thumb_func_end sub_8146E50

	thumb_func_start sub_8147048
sub_8147048: @ 8147048
	push {r4,r5,lr}
	movs r4, 0
	ldr r0, _081470C8 @ =gUnknown_0203933E
	movs r1, 0x1
	strh r1, [r0]
	ldr r1, _081470CC @ =gUnknown_03005EA8
	ldr r0, [r1]
	cmp r0, 0
	beq _081470A6
	adds r5, r1, 0
_0814705C:
	ldr r0, [r5]
	bl sub_814737C
	lsls r0, 24
	cmp r0, 0
	bne _0814710C
	.if REVISION >= 1
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0x13
	.else
	movs r0, 0x1
	movs r1, 0xC
	movs r2, 0x1C
	movs r3, 0x13
	.endif
	bl MenuDrawTextWindow
	ldr r0, _081470D0 @ =gSystemText_CheckCompleteSaveAttempt
	.if REVISION >= 1
	movs r1, 0x2
	movs r2, 0xB
	.else
	movs r1, 0x2
	movs r2, 0xD
	.endif
	bl MenuPrint
	ldr r0, _081470D4 @ =gUnknown_0203933C
	ldrb r0, [r0]
	bl sub_8125C3C
	ldr r0, [r5]
	cmp r0, 0
	beq _08147096
	ldr r0, _081470D8 @ =gSystemText_SaveFailedBackupCheck
	.if REVISION >= 1
	movs r1, 0x2
	movs r2, 0xB
	.else
	movs r1, 0x2
	movs r2, 0xD
	.endif
	bl MenuPrint
_08147096:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, [r5]
	cmp r0, 0
	beq _081470A6
	cmp r4, 0x2
	bls _0814705C
_081470A6:
	cmp r4, 0x3
	bne _081470E4
	.if REVISION >= 1
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0x13
	.else
	movs r0, 0x1
	movs r1, 0xC
	movs r2, 0x1C
	movs r3, 0x13
	.endif
	bl MenuDrawTextWindow
	ldr r0, _081470DC @ =gSystemText_BackupDamagedGameContinue
	.if REVISION >= 1
	movs r1, 0x2
	movs r2, 0xB
	.else
	movs r1, 0x2
	movs r2, 0xD
	.endif
	bl MenuPrint
	ldr r0, _081470E0 @ =sub_81471A4
	bl SetMainCallback2
	b _0814713E
	.align 2, 0
_081470C8: .4byte gUnknown_0203933E
_081470CC: .4byte gUnknown_03005EA8
_081470D0: .4byte gSystemText_CheckCompleteSaveAttempt
_081470D4: .4byte gUnknown_0203933C
_081470D8: .4byte gSystemText_SaveFailedBackupCheck
_081470DC: .4byte gSystemText_BackupDamagedGameContinue
_081470E0: .4byte sub_81471A4
_081470E4:
	.if REVISION >= 1
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0x13
	.else
	movs r0, 0x1
	movs r1, 0xC
	movs r2, 0x1C
	movs r3, 0x13
	.endif
	bl MenuDrawTextWindow
	ldr r0, _08147104 @ =gUnknown_03005EBC
	ldr r0, [r0]
	cmp r0, 0
	bne _08147134
	ldr r0, _08147108 @ =gSystemText_SaveCompletedGameEnd
	.if REVISION >= 1
	movs r1, 0x2
	movs r2, 0xB
	.else
	movs r1, 0x2
	movs r2, 0xD
	.endif
	bl MenuPrint
	b _0814713E
	.align 2, 0
_08147104: .4byte gUnknown_03005EBC
_08147108: .4byte gSystemText_SaveCompletedGameEnd
_0814710C:
	.if REVISION >= 1
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0x13
	.else
	movs r0, 0x1
	movs r1, 0xC
	movs r2, 0x1C
	movs r3, 0x13
	.endif
	bl MenuDrawTextWindow
	ldr r0, _0814712C @ =gSystemText_BackupDamagedGameContinue
	.if REVISION >= 1
	movs r1, 0x2
	movs r2, 0xB
	.else
	movs r1, 0x2
	movs r2, 0xD
	.endif
	bl MenuPrint
	ldr r0, _08147130 @ =sub_8147154
	bl SetMainCallback2
	b _08147144
	.align 2, 0
_0814712C: .4byte gSystemText_BackupDamagedGameContinue
_08147130: .4byte sub_8147154
_08147134:
	ldr r0, _0814714C @ =gSystemText_SaveCompletedPressA
	.if REVISION >= 1
	movs r1, 0x2
	movs r2, 0xB
	.else
	movs r1, 0x2
	movs r2, 0xD
	.endif
	bl MenuPrint
_0814713E:
	ldr r0, _08147150 @ =sub_81471A4
	bl SetMainCallback2
_08147144:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814714C: .4byte gSystemText_SaveCompletedPressA
_08147150: .4byte sub_81471A4
	thumb_func_end sub_8147048

	thumb_func_start sub_8147154
sub_8147154: @ 8147154
	push {lr}
	ldr r1, _08147190 @ =gUnknown_0203933E
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08147194 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0814718A
	.if REVISION >= 1
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0x13
	.else
	movs r0, 0x1
	movs r1, 0xC
	movs r2, 0x1C
	movs r3, 0x13
	.endif
	bl MenuDrawTextWindow
	ldr r0, _08147198 @ =gSystemText_GameplayEnded
	.if REVISION >= 1
	movs r1, 0x2
	movs r2, 0xB
	.else
	movs r1, 0x2
	movs r2, 0xD
	.endif
	bl MenuPrint
	ldr r0, _0814719C @ =sub_8146E3C
	bl SetVBlankCallback
	ldr r0, _081471A0 @ =sub_81471A4
	bl SetMainCallback2
_0814718A:
	pop {r0}
	bx r0
	.align 2, 0
_08147190: .4byte gUnknown_0203933E
_08147194: .4byte gMain
_08147198: .4byte gSystemText_GameplayEnded
_0814719C: .4byte sub_8146E3C
_081471A0: .4byte sub_81471A4
	thumb_func_end sub_8147154

	thumb_func_start sub_81471A4
sub_81471A4: @ 81471A4
	push {lr}
	sub sp, 0x4
	ldr r0, _081471DC @ =gUnknown_0203933E
	movs r2, 0
	strh r2, [r0]
	ldr r0, _081471E0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081471D4
	movs r0, 0x1
	negs r0, r0
	str r2, [sp]
	movs r1, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _081471E4 @ =sub_8146E3C
	bl SetVBlankCallback
	ldr r0, _081471E8 @ =sub_81471EC
	bl SetMainCallback2
_081471D4:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_081471DC: .4byte gUnknown_0203933E
_081471E0: .4byte gMain
_081471E4: .4byte sub_8146E3C
_081471E8: .4byte sub_81471EC
	thumb_func_end sub_81471A4

	thumb_func_start sub_81471EC
sub_81471EC: @ 81471EC
	push {r4,r5,lr}
	bl UpdatePaletteFade
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08147212
	ldr r5, _08147208 @ =gUnknown_03005EBC
	ldr r0, [r5]
	cmp r0, 0
	bne _0814720C
	bl DoSoftReset
	b _08147212
	.align 2, 0
_08147208: .4byte gUnknown_03005EBC
_0814720C:
	bl SetMainCallback2
	str r4, [r5]
_08147212:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81471EC

	thumb_func_start sub_8147218
sub_8147218: @ 8147218
	push {r4,r5,lr}
	ldr r0, _08147290 @ =gMain
	mov r12, r0
	ldr r0, [r0, 0x24]
	lsrs r4, r0, 3
	movs r0, 0x7
	ands r4, r0
	ldr r0, _08147294 @ =gUnknown_08411940
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	mov r2, r12
	str r0, [r2, 0x3C]
	str r1, [r2, 0x40]
	ldrh r1, [r2, 0x3E]
	ldr r0, _08147298 @ =0xfffffe00
	ands r0, r1
	movs r1, 0x70
	orrs r0, r1
	strh r0, [r2, 0x3E]
	mov r1, r12
	adds r1, 0x3C
	.if REVISION >= 1
	movs r0, 0x38
	.else
	movs r0, 0x48
	.endif
	strb r0, [r1]
	ldr r0, _0814729C @ =gUnknown_0203933E
	ldrh r0, [r0]
	cmp r0, 0
	beq _081472A8
	ldr r3, _081472A0 @ =gUnknown_08411948
	lsls r2, r4, 1
	adds r2, r4
	adds r0, r2, r3
	mov r4, r12
	adds r4, 0x40
	ldrb r5, [r0]
	ldrh r1, [r4]
	ldr r0, _081472A4 @ =0xfffffc00
	ands r0, r1
	orrs r0, r5
	strh r0, [r4]
	adds r0, r3, 0x2
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r1, 4
	adds r3, 0x1
	adds r2, r3
	ldrb r0, [r2]
	lsls r0, 3
	orrs r1, r0
	mov r3, r12
	adds r3, 0x3F
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _081472B8
	.align 2, 0
_08147290: .4byte gMain
_08147294: .4byte gUnknown_08411940
_08147298: .4byte 0xfffffe00
_0814729C: .4byte gUnknown_0203933E
_081472A0: .4byte gUnknown_08411948
_081472A4: .4byte 0xfffffc00
_081472A8:
	mov r2, r12
	adds r2, 0x40
	ldrh r1, [r2]
	ldr r0, _081472D8 @ =0xfffffc00
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
_081472B8:
	ldr r0, _081472DC @ =gMain + 0x3C
	movs r1, 0xE0
	lsls r1, 19
	movs r2, 0x1
	bl CpuFastSet
	ldr r1, _081472E0 @ =gUnknown_0203933E
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	beq _081472D0
	subs r0, 0x1
	strh r0, [r1, 0x2]
_081472D0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081472D8: .4byte 0xfffffc00
_081472DC: .4byte gMain + 0x3C
_081472E0: .4byte gUnknown_0203933E
	thumb_func_end sub_8147218

	thumb_func_start sub_81472E4
sub_81472E4: @ 81472E4
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _08147308 @ =0x02000000
	movs r3, 0x80
	lsls r3, 5
	movs r1, 0
	adds r2, r4, 0
	bl ReadFlash
	movs r1, 0
	ldr r2, _0814730C @ =0x000003ff
_081472FC:
	ldr r0, [r4]
	cmp r0, 0
	beq _08147310
	movs r0, 0x1
	b _0814731E
	.align 2, 0
_08147308: .4byte 0x02000000
_0814730C: .4byte 0x000003ff
_08147310:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	adds r4, 0x4
	cmp r1, r2
	bls _081472FC
	movs r0, 0
_0814731E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81472E4

	thumb_func_start sub_8147324
sub_8147324: @ 8147324
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r6, r0, 16
	movs r0, 0
	ldr r1, _08147374 @ =0x00000fff
	mov r8, r1
	ldr r7, _08147378 @ =ProgramFlashByte
_08147336:
	movs r4, 0
	adds r5, r0, 0x1
_0814733A:
	ldr r3, [r7]
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0
	bl _call_via_r3
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r8
	bls _0814733A
	adds r0, r6, 0
	bl sub_81472E4
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r5, 16
	lsrs r0, 16
	cmp r1, 0
	beq _08147366
	cmp r0, 0x81
	bls _08147336
_08147366:
	adds r0, r1, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08147374: .4byte 0x00000fff
_08147378: .4byte ProgramFlashByte
	thumb_func_end sub_8147324

	thumb_func_start sub_814737C
sub_814737C: @ 814737C
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r6, 0
_08147382:
	movs r4, 0x1
	lsls r4, r6
	adds r0, r5, 0
	ands r0, r4
	cmp r0, 0
	beq _0814739C
	adds r0, r6, 0
	bl sub_8147324
	lsls r0, 24
	cmp r0, 0
	bne _0814739C
	bics r5, r4
_0814739C:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x1F
	bls _08147382
	cmp r5, 0
	beq _081473AE
	movs r0, 0x1
	b _081473B0
_081473AE:
	movs r0, 0
_081473B0:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_814737C

	.align 2, 0 @ Don't pad with nop.
