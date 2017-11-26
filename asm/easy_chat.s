	.include "constants/gba_constants.inc"

	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80E60D8
sub_80E60D8: @ 80E60D8
	push {r4-r7,lr}
	movs r4, 0x3
	ldr r0, _080E60F4 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	adds r7, r0, 0
	cmp r1, 0xD
	bls _080E60E8
	b _080E6284
_080E60E8:
	lsls r0, r1, 2
	ldr r1, _080E60F8 @ =_080E60FC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E60F4: .4byte gSpecialVar_0x8004
_080E60F8: .4byte _080E60FC
	.align 2, 0
_080E60FC:
	.4byte _080E6134
	.4byte _080E613C
	.4byte _080E6144
	.4byte _080E614C
	.4byte _080E6154
	.4byte _080E619C
	.4byte _080E616C
	.4byte _080E61BC
	.4byte _080E61E0
	.4byte _080E61FC
	.4byte _080E6200
	.4byte _080E6214
	.4byte _080E623C
	.4byte _080E6260
_080E6134:
	ldr r1, _080E6138 @ =gSaveBlock1 + 0x2B1C
	b _080E624C
	.align 2, 0
_080E6138: .4byte gSaveBlock1 + 0x2B1C
_080E613C:
	ldr r1, _080E6140 @ =gSaveBlock1 + 0x2B28
	b _080E6276
	.align 2, 0
_080E6140: .4byte gSaveBlock1 + 0x2B28
_080E6144:
	ldr r1, _080E6148 @ =gSaveBlock1 + 0x2B34
	b _080E624C
	.align 2, 0
_080E6148: .4byte gSaveBlock1 + 0x2B34
_080E614C:
	ldr r1, _080E6150 @ =gSaveBlock1 + 0x2B40
	b _080E6276
	.align 2, 0
_080E6150: .4byte gSaveBlock1 + 0x2B40
_080E6154:
	ldr r0, _080E6164 @ =gSpecialVar_0x8005
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E6168 @ =gSaveBlock1 + 0x2B4C
	adds r1, r0, r1
	b _080E624C
	.align 2, 0
_080E6164: .4byte gSpecialVar_0x8005
_080E6168: .4byte gSaveBlock1 + 0x2B4C
_080E616C:
	ldr r0, _080E6194 @ =gSaveBlock1 + 0x2D94
	movs r2, 0
	ldr r1, _080E6198 @ =sub_80546B8
	mov r12, r1
	adds r3, r0, 0
	adds r3, 0xE
	adds r5, r0, 0x2
	adds r6, r3, 0
_080E617C:
	lsls r0, r2, 1
	adds r1, r3, r0
	adds r0, r5, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x5
	bls _080E617C
	adds r1, r6, 0
	b _080E627A
	.align 2, 0
_080E6194: .4byte gSaveBlock1 + 0x2D94
_080E6198: .4byte sub_80546B8
_080E619C:
	ldr r0, _080E61B0 @ =gSpecialVar_0x8005
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E61B4 @ =gSaveBlock1 + 0x273C
	adds r1, r0, r1
	ldr r0, _080E61B8 @ =gSpecialVar_0x8006
	ldrb r4, [r0]
	b _080E6276
	.align 2, 0
_080E61B0: .4byte gSpecialVar_0x8005
_080E61B4: .4byte gSaveBlock1 + 0x273C
_080E61B8: .4byte gSpecialVar_0x8006
_080E61BC:
	ldr r0, _080E61D4 @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _080E61D8 @ =gSaveBlock1 + 0x2754
	adds r1, r0
	ldr r0, _080E61DC @ =gSpecialVar_0x8006
	ldrh r0, [r0]
	lsls r0, 1
	adds r1, r0
	b _080E624A
	.align 2, 0
_080E61D4: .4byte gSpecialVar_0x8005
_080E61D8: .4byte gSaveBlock1 + 0x2754
_080E61DC: .4byte gSpecialVar_0x8006
_080E61E0:
	ldr r0, _080E61F4 @ =gSpecialVar_0x8005
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E61F8 @ =gSaveBlock1 + 0x273A
	adds r1, r0, r1
	movs r4, 0
	b _080E6276
	.align 2, 0
_080E61F4: .4byte gSpecialVar_0x8005
_080E61F8: .4byte gSaveBlock1 + 0x273A
_080E61FC:
	movs r1, 0
	b _080E624C
_080E6200:
	ldr r1, _080E620C @ =gSaveBlock1 + 0x2B16
	ldr r2, _080E6210 @ =0x0000ffff
	adds r0, r2, 0
	strh r0, [r1]
	b _080E624A
	.align 2, 0
_080E620C: .4byte gSaveBlock1 + 0x2B16
_080E6210: .4byte 0x0000ffff
_080E6214:
	ldr r0, _080E6230 @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _080E6234 @ =gSaveBlock1 + 0x273C
	adds r1, r0
	ldr r0, _080E6238 @ =gSpecialVar_0x8006
	ldrh r0, [r0]
	lsls r0, 1
	adds r1, r0
	movs r4, 0
	b _080E6276
	.align 2, 0
_080E6230: .4byte gSpecialVar_0x8005
_080E6234: .4byte gSaveBlock1 + 0x273C
_080E6238: .4byte gSpecialVar_0x8006
_080E623C:
	ldr r0, _080E6254 @ =gSpecialVar_0x8005
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E6258 @ =gSaveBlock1 + 0x2750
	adds r1, r0, r1
_080E624A:
	movs r4, 0x1
_080E624C:
	ldr r0, _080E625C @ =sub_80546B8
	mov r12, r0
	b _080E627A
	.align 2, 0
_080E6254: .4byte gSpecialVar_0x8005
_080E6258: .4byte gSaveBlock1 + 0x2750
_080E625C: .4byte sub_80546B8
_080E6260:
	ldr r1, _080E628C @ =gSharedMem + 0x1000
	ldr r0, _080E6290 @ =0x00009c7c
	adds r2, r1, r0
	ldr r0, _080E6294 @ =0x0000ffff
	strh r0, [r2]
	ldr r0, _080E6298 @ =0x00009c7e
	adds r1, r0
	movs r0, 0x1
	negs r0, r0
	strh r0, [r1]
	adds r1, r2, 0
_080E6276:
	ldr r2, _080E629C @ =sub_80546B8
	mov r12, r2
_080E627A:
	ldrb r0, [r7]
	mov r2, r12
	adds r3, r4, 0
	bl sub_80E62A0
_080E6284:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E628C: .4byte gSharedMem + 0x1000
_080E6290: .4byte 0x00009c7c
_080E6294: .4byte 0x0000ffff
_080E6298: .4byte 0x00009c7e
_080E629C: .4byte sub_80546B8
	thumb_func_end sub_80E60D8

	thumb_func_start sub_80E62A0
sub_80E62A0: @ 80E62A0
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _080E62DC @ =gSharedMem + 0x1000
	str r2, [r4]
	str r1, [r4, 0x4]
	strb r0, [r4, 0x8]
	strb r3, [r4, 0xB]
	cmp r0, 0x9
	bne _080E62D0
	ldr r0, _080E62E0 @ =0x00009c7c
	adds r2, r4, r0
	str r2, [r4, 0x4]
	ldr r0, _080E62E4 @ =gSaveBlock1
	ldr r3, _080E62E8 @ =0x00002dd8
	adds r1, r0, r3
	ldrh r1, [r1]
	strh r1, [r2]
	ldr r1, _080E62EC @ =0x00002dda
	adds r0, r1
	ldrh r1, [r0]
	ldr r2, _080E62F0 @ =0x00009c7e
	adds r0, r4, r2
	strh r1, [r0]
_080E62D0:
	ldr r0, _080E62F4 @ =sub_80E62F8
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E62DC: .4byte gSharedMem + 0x1000
_080E62E0: .4byte 0x00009c7c
_080E62E4: .4byte gSaveBlock1
_080E62E8: .4byte 0x00002dd8
_080E62EC: .4byte 0x00002dda
_080E62F0: .4byte 0x00009c7e
_080E62F4: .4byte sub_80E62F8
	thumb_func_end sub_80E62A0

	thumb_func_start sub_80E62F8
sub_80E62F8: @ 80E62F8
	push {lr}
	sub sp, 0x4
	ldr r0, _080E6314 @ =gMain
	ldr r1, _080E6318 @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x8
	bhi _080E6344
	lsls r0, 2
	ldr r1, _080E631C @ =_080E6320
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E6314: .4byte gMain
_080E6318: .4byte 0x0000043c
_080E631C: .4byte _080E6320
	.align 2, 0
_080E6320:
	.4byte _080E6344
	.4byte _080E6380
	.4byte _080E638C
	.4byte _080E63A8
	.4byte _080E63AE
	.4byte _080E63B4
	.4byte _080E63BE
	.4byte _080E63D8
	.4byte _080E63EA
_080E6344:
	movs r1, 0x80
	lsls r1, 19
	movs r0, 0
	strh r0, [r1]
	movs r0, 0
	bl SetVBlankCallback
	bl ResetPaletteFade
	bl ResetSpriteData
	bl dp12_8087EA4
	bl remove_some_task
	bl sub_80EAD08
	ldr r2, _080E637C @ =gUnknown_083DB698
	ldr r0, [r2]
	ldr r1, [r2, 0x4]
	ldr r2, [r2, 0x8]
	bl sub_80895F8
	bl FreeSpriteTileRanges
	bl FreeAllSpritePalettes
	b _080E6402
	.align 2, 0
_080E637C: .4byte gUnknown_083DB698
_080E6380:
	ldr r0, _080E6388 @ =gWindowConfig_81E6DA8
	bl SetUpWindowConfig
	b _080E6402
	.align 2, 0
_080E6388: .4byte gWindowConfig_81E6DA8
_080E638C:
	ldr r0, _080E63A0 @ =gWindowConfig_81E6D54
	bl InitMenuWindow
	ldr r0, _080E63A4 @ =gWindowConfig_81E6DA8
	bl InitMenuWindow
	bl MenuZeroFillScreen
	b _080E6402
	.align 2, 0
_080E63A0: .4byte gWindowConfig_81E6D54
_080E63A4: .4byte gWindowConfig_81E6DA8
_080E63A8:
	bl sub_80E6424
	b _080E6402
_080E63AE:
	bl sub_80E8DD8
	b _080E6402
_080E63B4:
	bl sub_80E8218
	bl sub_80E8CEC
	b _080E6402
_080E63BE:
	bl sub_80E69F8
	ldr r0, _080E63D0 @ =sub_80E6AA8
	bl sub_80E682C
	ldr r0, _080E63D4 @ =sub_80E6A6C
	bl SetVBlankCallback
	b _080E6402
	.align 2, 0
_080E63D0: .4byte sub_80E6AA8
_080E63D4: .4byte sub_80E6A6C
_080E63D8:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _080E6402
_080E63EA:
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080E6414 @ =sub_80E6A88
	bl SetMainCallback2
	ldr r0, _080E6418 @ =0x00000805
	bl FlagSet
_080E6402:
	ldr r1, _080E641C @ =gMain
	ldr r0, _080E6420 @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080E6414: .4byte sub_80E6A88
_080E6418: .4byte 0x00000805
_080E641C: .4byte gMain
_080E6420: .4byte 0x0000043c
	thumb_func_end sub_80E62F8

	thumb_func_start sub_80E6424
sub_80E6424: @ 80E6424
	push {lr}
	ldr r2, _080E6444 @ =gSharedMem + 0x1000
	ldr r0, _080E6448 @ =gUnknown_083DB6A4
	ldrb r1, [r2, 0x8]
	adds r1, r0
	ldrb r0, [r1]
	strb r0, [r2, 0x9]
	ldrb r0, [r2, 0x9]
	adds r3, r2, 0
	cmp r0, 0x5
	bhi _080E6512
	lsls r0, 2
	ldr r1, _080E644C @ =_080E6450
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E6444: .4byte gSharedMem + 0x1000
_080E6448: .4byte gUnknown_083DB6A4
_080E644C: .4byte _080E6450
	.align 2, 0
_080E6450:
	.4byte _080E64A0
	.4byte _080E64B8
	.4byte _080E64DA
	.4byte _080E64F6
	.4byte _080E6468
	.4byte _080E6480
_080E6468:
	movs r2, 0x4
	strb r2, [r3, 0xA]
	adds r0, r3, 0
	adds r0, 0x83
	movs r1, 0x2
	strb r1, [r0]
	adds r0, 0x1
	strb r1, [r0]
	adds r1, r3, 0
	adds r1, 0x88
	movs r0, 0x5
	b _080E64D0
_080E6480:
	movs r1, 0x4
	strb r1, [r3, 0xA]
	adds r2, r3, 0
	adds r2, 0x83
	movs r0, 0x1
	strb r0, [r2]
	adds r0, r3, 0
	adds r0, 0x84
	strb r1, [r0]
	adds r1, r3, 0
	adds r1, 0x88
	movs r0, 0x10
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x2
	b _080E6510
_080E64A0:
	movs r0, 0x6
	strb r0, [r3, 0xA]
	adds r1, r3, 0
	adds r1, 0x83
	movs r0, 0x2
	strb r0, [r1]
	adds r0, r3, 0
	adds r0, 0x84
	movs r2, 0x3
	strb r2, [r0]
	adds r1, 0x5
	b _080E64CE
_080E64B8:
	movs r2, 0
	movs r0, 0x9
	strb r0, [r3, 0xA]
	adds r1, r3, 0
	adds r1, 0x83
	movs r0, 0x2
	strb r0, [r1]
	adds r1, 0x1
	movs r0, 0x5
	strb r0, [r1]
	adds r1, 0x4
_080E64CE:
	movs r0, 0x4
_080E64D0:
	strh r0, [r1]
	adds r0, r3, 0
	adds r0, 0x8A
	strh r2, [r0]
	b _080E6512
_080E64DA:
	movs r1, 0x1
	strb r1, [r3, 0xA]
	adds r0, r3, 0
	adds r0, 0x83
	strb r1, [r0]
	adds r0, 0x1
	strb r1, [r0]
	adds r1, r3, 0
	adds r1, 0x88
	movs r0, 0x10
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x4
	b _080E6510
_080E64F6:
	movs r0, 0x2
	strb r0, [r3, 0xA]
	adds r1, r3, 0
	adds r1, 0x83
	strb r0, [r1]
	adds r1, 0x1
	movs r0, 0x1
	strb r0, [r1]
	adds r1, 0x4
	movs r0, 0x5
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x3
_080E6510:
	strh r0, [r1]
_080E6512:
	adds r1, r3, 0
	adds r1, 0x86
	movs r0, 0
	strb r0, [r1]
	subs r1, 0x1
	strb r0, [r1]
	adds r1, 0x2
	strb r0, [r1]
	subs r1, 0x61
	strb r0, [r1]
	movs r2, 0xDD
	lsls r2, 1
	adds r1, r3, r2
	strh r0, [r1]
	movs r0, 0xDF
	lsls r0, 1
	adds r1, r3, r0
	movs r0, 0x2
	strb r0, [r1]
	bl sub_80E6554
	bl sub_80EAECC
	bl sub_80EB040
	bl sub_80E7E50
	bl sub_80E6630
	bl sub_80E6690
	pop {r0}
	bx r0
	thumb_func_end sub_80E6424

	thumb_func_start sub_80E6554
sub_80E6554: @ 80E6554
	push {r4-r7,lr}
	sub sp, 0x4
	movs r4, 0
	movs r7, 0
	ldr r0, _080E6564 @ =gSharedMem + 0x1000
	mov r12, r0
	b _080E656E
	.align 2, 0
_080E6564: .4byte gSharedMem + 0x1000
_080E6568:
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
_080E656E:
	movs r5, 0
	lsls r3, r7, 1
	mov r6, r12
	adds r6, 0x2A
	adds r2, r3, r6
	adds r1, r4, 0
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	strb r1, [r2]
	cmp r4, 0x11
	beq _080E65A6
_080E6586:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x1
	bhi _080E65A2
	adds r2, r5, r3
	adds r2, r6
	adds r1, r4, 0
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	strb r1, [r2]
	cmp r4, 0x11
	bne _080E6586
_080E65A2:
	cmp r4, 0x11
	bne _080E6568
_080E65A6:
	movs r0, 0x11
	mov r1, r12
	strh r0, [r1, 0x28]
	cmp r4, 0x15
	bhi _080E6612
	mov r6, r12
	adds r2, r6, 0
	adds r2, 0x78
_080E65B6:
	lsls r0, r4, 24
	lsrs r0, 24
	str r2, [sp]
	bl sub_80EAD7C
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r2, [sp]
	cmp r1, 0
	beq _080E65FC
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x1
	bls _080E65DC
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	movs r5, 0
_080E65DC:
	lsls r0, r7, 1
	adds r0, r5, r0
	adds r1, r6, 0
	adds r1, 0x2A
	adds r0, r1
	strb r4, [r0]
	adds r0, r4, 0
	subs r0, 0x11
	adds r0, r2
	movs r1, 0x1
	strb r1, [r0]
	ldrh r0, [r6, 0x28]
	adds r0, 0x1
	strh r0, [r6, 0x28]
	mov r12, r6
	b _080E6608
_080E65FC:
	adds r0, r4, 0
	subs r0, 0x11
	adds r0, r2
	strb r1, [r0]
	ldr r0, _080E662C @ =gSharedMem + 0x1000
	mov r12, r0
_080E6608:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x15
	bls _080E65B6
_080E6612:
	mov r1, r12
	ldrh r0, [r1, 0x28]
	adds r0, 0x1
	asrs r0, 1
	movs r1, 0xDB
	lsls r1, 1
	add r1, r12
	strb r0, [r1]
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E662C: .4byte gSharedMem + 0x1000
	thumb_func_end sub_80E6554

	thumb_func_start sub_80E6630
sub_80E6630: @ 80E6630
	push {r4-r7,lr}
	movs r1, 0
	ldr r0, _080E6664 @ =gUnknown_083DB6B2
	mov r12, r0
_080E6638:
	lsls r0, r1, 4
	mov r2, r12
	adds r5, r0, r2
	movs r3, 0
	ldrb r0, [r5]
	adds r7, r1, 0x1
	cmp r0, 0xFF
	beq _080E6680
	lsls r0, r1, 3
	subs r0, r1
	lsls r4, r0, 1
	ldr r6, _080E6668 @ =gSharedMem + 0x1040
_080E6650:
	adds r0, r5, r3
	ldrb r1, [r0]
	adds r2, r1, 0
	cmp r2, 0
	beq _080E666C
	adds r0, r3, r4
	adds r0, r6
	adds r1, 0x46
	strb r1, [r0]
	b _080E6672
	.align 2, 0
_080E6664: .4byte gUnknown_083DB6B2
_080E6668: .4byte gSharedMem + 0x1040
_080E666C:
	adds r0, r3, r4
	adds r0, r6
	strb r2, [r0]
_080E6672:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r5, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080E6650
_080E6680:
	lsls r0, r7, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bls _080E6638
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80E6630

	thumb_func_start sub_80E6690
sub_80E6690: @ 80E6690
	push {r4-r6,lr}
	sub sp, 0x10
	mov r0, sp
	ldr r1, _080E66E0 @ =gUnknown_083DB7DC
	ldm r1!, {r2-r4}
	stm r0!, {r2-r4}
	ldr r1, [r1]
	str r1, [r0]
	movs r5, 0
	ldr r6, _080E66E4 @ =gUnknown_083DB7C0
_080E66A4:
	ldr r0, _080E66E8 @ =gSharedMem + 0x1000
	ldrb r0, [r0, 0x8]
	lsls r0, 1
	adds r0, r5, r0
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E66EC @ =gUnknown_083DB6F4
	adds r4, r0, r1
	lsls r0, r5, 3
	add r0, sp
	ldr r0, [r0]
	ldr r1, [r4]
	bl StringCopy
	adds r3, r0, 0
	ldrb r0, [r4, 0x8]
	cmp r0, 0
	beq _080E66F0
	lsls r0, r5, 1
	adds r0, 0x1
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	ldr r1, [r4, 0x4]
	bl StringCopy
	b _080E670A
	.align 2, 0
_080E66E0: .4byte gUnknown_083DB7DC
_080E66E4: .4byte gUnknown_083DB7C0
_080E66E8: .4byte gSharedMem + 0x1000
_080E66EC: .4byte gUnknown_083DB6F4
_080E66F0:
	strb r0, [r3]
	adds r3, 0x1
	ldr r1, [r4, 0x4]
	adds r0, r3, 0
	bl StringCopy
	lsls r0, r5, 1
	adds r0, 0x1
	lsls r0, 2
	add r0, sp
	ldr r1, [r0]
	movs r0, 0xFF
	strb r0, [r1]
_080E670A:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x1
	bls _080E66A4
	movs r5, 0
	ldr r3, _080E6758 @ =gSharedMem + 0x1000
	ldr r0, _080E675C @ =0x00009da4
	adds r2, r3, r0
	movs r1, 0
_080E671E:
	adds r0, r5, r2
	strb r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x23
	bls _080E671E
	ldr r1, _080E675C @ =0x00009da4
	adds r0, r3, r1
	adds r0, r5, r0
	movs r4, 0x1
	negs r4, r4
	adds r2, r4, 0
	movs r1, 0xFF
	strb r1, [r0]
	ldr r0, _080E6760 @ =0x00009f6e
	adds r3, r0
	movs r0, 0xFC
	strb r0, [r3]
	movs r0, 0x11
	strb r0, [r3, 0x1]
	movs r0, 0xE0
	strb r0, [r3, 0x2]
	strb r2, [r3, 0x3]
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E6758: .4byte gSharedMem + 0x1000
_080E675C: .4byte 0x00009da4
_080E6760: .4byte 0x00009f6e
	thumb_func_end sub_80E6690

	thumb_func_start InitEasyChatPhrases
InitEasyChatPhrases: @ 80E6764
	push {r4-r6,lr}
	movs r3, 0
	ldr r4, _080E680C @ =gSaveBlock1 + 0x2B1C
	ldr r2, _080E6810 @ =gUnknown_083DB7EC
_080E676C:
	lsls r0, r3, 1
	adds r1, r0, r4
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3
	bls _080E676C
	movs r3, 0
	ldr r4, _080E6814 @ =gSaveBlock1 + 0x2B28
	ldr r2, _080E6818 @ =gUnknown_083DB7F4
_080E6786:
	lsls r0, r3, 1
	adds r1, r0, r4
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x5
	bls _080E6786
	movs r3, 0
	ldr r5, _080E681C @ =gSaveBlock1 + 0x2B34
	ldr r0, _080E6820 @ =0x0000ffff
	adds r4, r0, 0
	adds r6, r5, 0
	adds r6, 0xC
_080E67A6:
	lsls r1, r3, 1
	adds r2, r1, r5
	ldrh r0, [r2]
	orrs r0, r4
	strh r0, [r2]
	adds r1, r6
	ldrh r0, [r1]
	orrs r0, r4
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x5
	bls _080E67A6
	movs r3, 0
	ldr r6, _080E6824 @ =gSaveBlock1 + 0x2B4C
	ldr r0, _080E6820 @ =0x0000ffff
	adds r5, r0, 0
_080E67CA:
	movs r2, 0
	lsls r0, r3, 3
	adds r0, r3
	lsls r4, r0, 2
_080E67D2:
	lsls r0, r2, 1
	adds r0, r4
	adds r0, r6
	ldrh r1, [r0]
	orrs r1, r5
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x8
	bls _080E67D2
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0xF
	bls _080E67CA
	movs r3, 0
	ldr r2, _080E6828 @ =gSaveBlock1 + 0x2D8C
	movs r1, 0
_080E67F8:
	adds r0, r3, r2
	strb r1, [r0]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3F
	bls _080E67F8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E680C: .4byte gSaveBlock1 + 0x2B1C
_080E6810: .4byte gUnknown_083DB7EC
_080E6814: .4byte gSaveBlock1 + 0x2B28
_080E6818: .4byte gUnknown_083DB7F4
_080E681C: .4byte gSaveBlock1 + 0x2B34
_080E6820: .4byte 0x0000ffff
_080E6824: .4byte gSaveBlock1 + 0x2B4C
_080E6828: .4byte gSaveBlock1 + 0x2D8C
	thumb_func_end InitEasyChatPhrases

	thumb_func_start sub_80E682C
sub_80E682C: @ 80E682C
	ldr r1, _080E6838 @ =gSharedMem + 0x1000
	str r0, [r1, 0x20]
	movs r0, 0
	strh r0, [r1, 0x24]
	bx lr
	.align 2, 0
_080E6838: .4byte gSharedMem + 0x1000
	thumb_func_end sub_80E682C

	thumb_func_start sub_80E683C
sub_80E683C: @ 80E683C
	push {r4,r5,lr}
	ldr r1, _080E6890 @ =gSharedMem + 0x1000
	adds r0, r1, 0
	adds r0, 0x26
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0
	bne _080E6898
	movs r1, 0
	movs r0, 0xDB
	lsls r0, 1
	adds r3, r2, r0
	movs r0, 0
	ldrsb r0, [r3, r0]
	cmp r1, r0
	bge _080E6876
	movs r0, 0xD5
	lsls r0, 1
	adds r5, r2, r0
	movs r4, 0x2
_080E6864:
	adds r0, r1, r5
	strb r4, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	movs r0, 0
	ldrsb r0, [r3, r0]
	cmp r1, r0
	blt _080E6864
_080E6876:
	adds r0, r2, r1
	ldr r1, _080E6894 @ =0x000001a9
	adds r3, r0, r1
	ldrh r0, [r2, 0x28]
	movs r1, 0x1
	ands r0, r1
	strb r0, [r3]
	cmp r0, 0
	bne _080E68B8
	movs r0, 0x2
	strb r0, [r3]
	b _080E68B8
	.align 2, 0
_080E6890: .4byte gSharedMem + 0x1000
_080E6894: .4byte 0x000001a9
_080E6898:
	movs r3, 0xD5
	lsls r3, 1
	adds r1, r2, r3
	movs r0, 0x7
	strb r0, [r1]
	ldr r1, _080E68E0 @ =0x000001ab
	adds r3, r2, r1
	movs r1, 0x6
	strb r1, [r3]
	movs r3, 0xD6
	lsls r3, 1
	adds r1, r2, r3
	strb r0, [r1]
	adds r3, 0x1
	adds r1, r2, r3
	strb r0, [r1]
_080E68B8:
	movs r0, 0xD4
	lsls r0, 1
	adds r1, r2, r0
	movs r0, 0
	strb r0, [r1]
	ldr r3, _080E68E4 @ =0x000001a9
	adds r1, r2, r3
	strb r0, [r1]
	adds r3, 0xC
	adds r1, r2, r3
	strb r0, [r1]
	adds r3, 0x2
	adds r1, r2, r3
	strb r0, [r1]
	bl sub_80E9A4C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E68E0: .4byte 0x000001ab
_080E68E4: .4byte 0x000001a9
	thumb_func_end sub_80E683C

	thumb_func_start sub_80E68E8
sub_80E68E8: @ 80E68E8
	push {r4-r6,lr}
	bl sub_80EB0B0
	ldr r3, _080E694C @ =gSharedMem + 0x1000
	adds r0, r3, 0
	adds r0, 0x26
	ldrb r0, [r0]
	cmp r0, 0
	bne _080E695C
	movs r1, 0xDC
	lsls r1, 1
	adds r0, r3, r1
	ldrb r6, [r0]
	lsls r0, r6, 1
	ldr r2, _080E6950 @ =0x00004178
	adds r1, r3, r2
	adds r0, r1
	ldrh r0, [r0]
	adds r0, 0x1
	asrs r0, 1
	ldr r1, _080E6954 @ =0x00009a28
	adds r2, r3, r1
	strb r0, [r2]
	movs r1, 0
	movs r0, 0
	ldrsb r0, [r2, r0]
	adds r5, r3, 0
	cmp r1, r0
	bge _080E693A
	ldr r3, _080E6958 @ =0x000099a6
	adds r4, r5, r3
	movs r3, 0x2
_080E6928:
	adds r0, r1, r4
	strb r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	blt _080E6928
_080E693A:
	subs r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r2, _080E6958 @ =0x000099a6
	adds r0, r5, r2
	adds r2, r1, r0
	lsls r0, r6, 1
	ldr r3, _080E6950 @ =0x00004178
	b _080E69AC
	.align 2, 0
_080E694C: .4byte gSharedMem + 0x1000
_080E6950: .4byte 0x00004178
_080E6954: .4byte 0x00009a28
_080E6958: .4byte 0x000099a6
_080E695C:
	movs r1, 0xDC
	lsls r1, 1
	adds r0, r3, r1
	ldrb r6, [r0]
	lsls r0, r6, 1
	ldr r2, _080E69E0 @ =0x00004142
	adds r1, r3, r2
	adds r0, r1
	ldrh r0, [r0]
	adds r0, 0x1
	asrs r0, 1
	ldr r1, _080E69E4 @ =0x00009a28
	adds r2, r3, r1
	strb r0, [r2]
	movs r1, 0
	movs r0, 0
	ldrsb r0, [r2, r0]
	adds r5, r3, 0
	cmp r1, r0
	bge _080E699C
	ldr r3, _080E69E8 @ =0x000099a6
	adds r4, r5, r3
	movs r3, 0x2
_080E698A:
	adds r0, r1, r4
	strb r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	blt _080E698A
_080E699C:
	subs r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r2, _080E69E8 @ =0x000099a6
	adds r0, r5, r2
	adds r2, r1, r0
	lsls r0, r6, 1
	ldr r3, _080E69E0 @ =0x00004142
_080E69AC:
	adds r1, r5, r3
	adds r0, r1
	ldrh r0, [r0]
	movs r1, 0x1
	ands r0, r1
	strb r0, [r2]
	cmp r0, 0
	bne _080E69C0
	movs r0, 0x2
	strb r0, [r2]
_080E69C0:
	ldr r1, _080E69EC @ =0x000099a4
	adds r0, r5, r1
	movs r1, 0
	strb r1, [r0]
	ldr r2, _080E69F0 @ =0x000099a5
	adds r0, r5, r2
	strb r1, [r0]
	ldr r3, _080E69F4 @ =0x00009a29
	adds r0, r5, r3
	strb r1, [r0]
	bl sub_80E9A4C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E69E0: .4byte 0x00004142
_080E69E4: .4byte 0x00009a28
_080E69E8: .4byte 0x000099a6
_080E69EC: .4byte 0x000099a4
_080E69F0: .4byte 0x000099a5
_080E69F4: .4byte 0x00009a29
	thumb_func_end sub_80E68E8

	thumb_func_start sub_80E69F8
sub_80E69F8: @ 80E69F8
	push {r4,lr}
	ldr r0, _080E6A10 @ =gSharedMem + 0x1000
	ldrb r1, [r0, 0x8]
	adds r4, r0, 0
	cmp r1, 0xD
	bhi _080E6A50
	lsls r0, r1, 2
	ldr r1, _080E6A14 @ =_080E6A18
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E6A10: .4byte gSharedMem + 0x1000
_080E6A14: .4byte _080E6A18
	.align 2, 0
_080E6A18:
	.4byte _080E6A50
	.4byte _080E6A50
	.4byte _080E6A50
	.4byte _080E6A50
	.4byte _080E6A50
	.4byte _080E6A58
	.4byte _080E6A50
	.4byte _080E6A58
	.4byte _080E6A58
	.4byte _080E6A50
	.4byte _080E6A58
	.4byte _080E6A58
	.4byte _080E6A58
	.4byte _080E6A50
_080E6A50:
	ldrb r0, [r4, 0x8]
	bl sub_80E9368
	b _080E6A66
_080E6A58:
	ldrb r0, [r4, 0x8]
	bl sub_80E9368
	ldrb r0, [r4, 0xB]
	ldrb r1, [r4, 0x9]
	bl sub_80E8BF4
_080E6A66:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E69F8

	thumb_func_start sub_80E6A6C
sub_80E6A6C: @ 80E6A6C
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl sub_80EAC5C
	bl TransferPlttBuffer
	bl sub_8089668
	pop {r0}
	bx r0
	thumb_func_end sub_80E6A6C

	thumb_func_start sub_80E6A88
sub_80E6A88: @ 80E6A88
	push {lr}
	ldr r0, _080E6AA4 @ =gSharedMem + 0x1000
	ldr r0, [r0, 0x20]
	bl _call_via_r0
	bl AnimateSprites
	bl BuildOamBuffer
	bl sub_80EAD08
	pop {r0}
	bx r0
	.align 2, 0
_080E6AA4: .4byte gSharedMem + 0x1000
	thumb_func_end sub_80E6A88

	thumb_func_start sub_80E6AA8
sub_80E6AA8: @ 80E6AA8
	push {lr}
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _080E6ABA
	ldr r0, _080E6AC0 @ =sub_80E6AC4
	bl sub_80E682C
_080E6ABA:
	pop {r0}
	bx r0
	.align 2, 0
_080E6AC0: .4byte sub_80E6AC4
	thumb_func_end sub_80E6AA8

	thumb_func_start sub_80E6AC4
sub_80E6AC4: @ 80E6AC4
	push {lr}
	bl sub_80E88F0
	movs r0, 0
	bl sub_80E8398
	movs r0, 0
	bl sub_80E91D4
	ldr r0, _080E6AE0 @ =sub_80E6AE4
	bl sub_80E682C
	pop {r0}
	bx r0
	.align 2, 0
_080E6AE0: .4byte sub_80E6AE4
	thumb_func_end sub_80E6AC4

	thumb_func_start sub_80E6AE4
sub_80E6AE4: @ 80E6AE4
	push {r4,r5,lr}
	bl sub_80E75D8
	ldr r4, _080E6B44 @ =gSharedMem + 0x1000
	adds r1, r4, 0
	adds r1, 0x87
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	beq _080E6AFE
	movs r0, 0x5
	bl PlaySE
_080E6AFE:
	ldr r2, _080E6B48 @ =gMain
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	adds r5, r2, 0
	cmp r0, 0
	beq _080E6BA4
	movs r0, 0x5
	bl PlaySE
	adds r1, r4, 0
	adds r1, 0x86
	adds r0, r4, 0
	adds r0, 0x84
	ldrb r2, [r1]
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r1, r0
	bne _080E6B78
	adds r0, r4, 0
	adds r0, 0x85
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	beq _080E6B60
	cmp r0, 0x1
	bgt _080E6B4C
	cmp r0, 0
	beq _080E6B52
	b _080E6BA4
	.align 2, 0
_080E6B44: .4byte gSharedMem + 0x1000
_080E6B48: .4byte gMain
_080E6B4C:
	cmp r0, 0x2
	beq _080E6B6C
	b _080E6BA4
_080E6B52:
	ldr r0, _080E6B5C @ =sub_80E6BC0
	bl sub_80E682C
	b _080E6BB4
	.align 2, 0
_080E6B5C: .4byte sub_80E6BC0
_080E6B60:
	ldr r0, _080E6B68 @ =sub_80E6C84
	bl sub_80E682C
	b _080E6BB4
	.align 2, 0
_080E6B68: .4byte sub_80E6C84
_080E6B6C:
	ldr r0, _080E6B74 @ =sub_80E6D7C
	bl sub_80E682C
	b _080E6BB4
	.align 2, 0
_080E6B74: .4byte sub_80E6D7C
_080E6B78:
	adds r0, r4, 0
	adds r0, 0x83
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x85
	adds r3, r0, 0
	muls r3, r2
	adds r0, r3, 0
	ldrb r1, [r1]
	adds r0, r1
	adds r1, r4, 0
	adds r1, 0x27
	strb r0, [r1]
	bl sub_80E7574
	ldr r0, _080E6BA0 @ =sub_80E6F68
	bl sub_80E682C
	b _080E6BB4
	.align 2, 0
_080E6BA0: .4byte sub_80E6F68
_080E6BA4:
	ldrh r1, [r5, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080E6BB4
	ldr r0, _080E6BBC @ =sub_80E6C84
	bl sub_80E682C
_080E6BB4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E6BBC: .4byte sub_80E6C84
	thumb_func_end sub_80E6AE4

	thumb_func_start sub_80E6BC0
sub_80E6BC0: @ 80E6BC0
	push {r4,lr}
	ldr r4, _080E6BD4 @ =gSharedMem + 0x1000
	ldrh r0, [r4, 0x24]
	cmp r0, 0x1
	beq _080E6C12
	cmp r0, 0x1
	bgt _080E6BD8
	cmp r0, 0
	beq _080E6BE2
	b _080E6C76
	.align 2, 0
_080E6BD4: .4byte gSharedMem + 0x1000
_080E6BD8:
	cmp r0, 0x2
	beq _080E6C54
	cmp r0, 0x64
	beq _080E6C64
	b _080E6C76
_080E6BE2:
	movs r0, 0x2
	bl sub_80E8398
	ldrb r0, [r4, 0x8]
	cmp r0, 0x6
	bne _080E6BFA
	movs r0, 0x6
	bl sub_80E91D4
	movs r0, 0x64
	strh r0, [r4, 0x24]
	b _080E6C76
_080E6BFA:
	movs r0, 0x2
	bl sub_80E91D4
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	movs r0, 0x1
	bl MoveMenuCursor
	b _080E6C3E
_080E6C12:
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _080E6C32
	cmp r1, 0
	bgt _080E6C2C
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080E6C46
	b _080E6C76
_080E6C2C:
	cmp r1, 0x1
	beq _080E6C46
	b _080E6C76
_080E6C32:
	bl sub_80E7D6C
	bl sub_80E98C4
	bl sub_80E95A4
_080E6C3E:
	ldrh r0, [r4, 0x24]
	adds r0, 0x1
	strh r0, [r4, 0x24]
	b _080E6C76
_080E6C46:
	ldr r1, _080E6C50 @ =gSharedMem + 0x1000
	ldrh r0, [r1, 0x24]
	adds r0, 0x1
	strh r0, [r1, 0x24]
	b _080E6C76
	.align 2, 0
_080E6C50: .4byte gSharedMem + 0x1000
_080E6C54:
	bl sub_80E81FC
	ldr r0, _080E6C60 @ =sub_80E6AC4
	bl sub_80E682C
	b _080E6C76
	.align 2, 0
_080E6C60: .4byte sub_80E6AC4
_080E6C64:
	ldr r0, _080E6C7C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _080E6C76
	ldr r0, _080E6C80 @ =sub_80E6AC4
	bl sub_80E682C
_080E6C76:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E6C7C: .4byte gMain
_080E6C80: .4byte sub_80E6AC4
	thumb_func_end sub_80E6BC0

	thumb_func_start sub_80E6C84
sub_80E6C84: @ 80E6C84
	push {r4,lr}
	ldr r4, _080E6C98 @ =gSharedMem + 0x1000
	ldrh r0, [r4, 0x24]
	cmp r0, 0x1
	beq _080E6CF4
	cmp r0, 0x1
	bgt _080E6C9C
	cmp r0, 0
	beq _080E6CA6
	b _080E6D72
	.align 2, 0
_080E6C98: .4byte gSharedMem + 0x1000
_080E6C9C:
	cmp r0, 0x2
	beq _080E6D24
	cmp r0, 0xFF
	beq _080E6D64
	b _080E6D72
_080E6CA6:
	movs r0, 0x2
	bl sub_80E8398
	movs r0, 0x3
	bl sub_80E91D4
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0
	bl DisplayYesNoMenu
	movs r0, 0x1
	bl MoveMenuCursor
	ldrb r0, [r4, 0x8]
	cmp r0, 0x9
	beq _080E6CE8
	cmp r0, 0x4
	beq _080E6CE8
	cmp r0, 0x7
	beq _080E6CE8
	cmp r0, 0x8
	beq _080E6CE8
	cmp r0, 0xA
	beq _080E6CE8
	cmp r0, 0xB
	beq _080E6CE8
	cmp r0, 0xC
	beq _080E6CE8
	cmp r0, 0x5
	beq _080E6CE8
	cmp r0, 0xD
	bne _080E6D1C
_080E6CE8:
	ldr r1, _080E6CF0 @ =gSharedMem + 0x1000
	movs r0, 0x2
	strh r0, [r1, 0x24]
	b _080E6D72
	.align 2, 0
_080E6CF0: .4byte gSharedMem + 0x1000
_080E6CF4:
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _080E6D06
	cmp r1, 0
	ble _080E6D34
	b _080E6D3E
_080E6D06:
	movs r0, 0x4
	bl sub_80E91D4
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0
	bl DisplayYesNoMenu
	movs r0, 0x1
	bl MoveMenuCursor
_080E6D1C:
	ldrh r0, [r4, 0x24]
	adds r0, 0x1
	strh r0, [r4, 0x24]
	b _080E6D72
_080E6D24:
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _080E6D44
	cmp r1, 0
	bgt _080E6D3E
_080E6D34:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080E6D58
	b _080E6D72
_080E6D3E:
	cmp r1, 0x1
	beq _080E6D58
	b _080E6D72
_080E6D44:
	ldr r0, _080E6D50 @ =gScriptResult
	strh r1, [r0]
	ldr r0, _080E6D54 @ =sub_80E752C
	bl sub_80E682C
	b _080E6D72
	.align 2, 0
_080E6D50: .4byte gScriptResult
_080E6D54: .4byte sub_80E752C
_080E6D58:
	ldr r1, _080E6D60 @ =gSharedMem + 0x1000
	movs r0, 0xFF
	strh r0, [r1, 0x24]
	b _080E6D72
	.align 2, 0
_080E6D60: .4byte gSharedMem + 0x1000
_080E6D64:
	bl HandleDestroyMenuCursors
	bl sub_80E81FC
	ldr r0, _080E6D78 @ =sub_80E6AC4
	bl sub_80E682C
_080E6D72:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E6D78: .4byte sub_80E6AC4
	thumb_func_end sub_80E6C84

	thumb_func_start sub_80E6D7C
sub_80E6D7C: @ 80E6D7C
	push {r4-r7,lr}
	ldr r5, _080E6D98 @ =gSharedMem + 0x1000
	ldrh r0, [r5, 0x24]
	cmp r0, 0xA
	bne _080E6D88
	b _080E6F06
_080E6D88:
	cmp r0, 0xA
	bgt _080E6D9C
	cmp r0, 0
	beq _080E6DB6
	cmp r0, 0x1
	beq _080E6E3C
	b _080E6F5E
	.align 2, 0
_080E6D98: .4byte gSharedMem + 0x1000
_080E6D9C:
	cmp r0, 0x65
	bne _080E6DA2
	b _080E6F30
_080E6DA2:
	cmp r0, 0x65
	bgt _080E6DAE
	cmp r0, 0x64
	bne _080E6DAC
	b _080E6F24
_080E6DAC:
	b _080E6F5E
_080E6DAE:
	cmp r0, 0x66
	bne _080E6DB4
	b _080E6F50
_080E6DB4:
	b _080E6F5E
_080E6DB6:
	movs r0, 0x2
	bl sub_80E8398
	bl sub_80E8054
	lsls r0, 24
	cmp r0, 0
	beq _080E6DCA
	movs r0, 0x5
	b _080E6DEE
_080E6DCA:
	ldrb r0, [r5, 0x8]
	cmp r0, 0x9
	bne _080E6DFC
	bl sub_80E7FA8
	lsls r0, 24
	cmp r0, 0
	bne _080E6DDE
	movs r0, 0x8
	b _080E6DEE
_080E6DDE:
	ldrh r0, [r5, 0xC]
	ldr r1, _080E6DF8 @ =0x0000ffff
	cmp r0, r1
	beq _080E6DEC
	ldrh r0, [r5, 0xE]
	cmp r0, r1
	bne _080E6DFC
_080E6DEC:
	movs r0, 0x9
_080E6DEE:
	bl sub_80E91D4
	movs r0, 0xA
	strh r0, [r5, 0x24]
	b _080E6F5E
	.align 2, 0
_080E6DF8: .4byte 0x0000ffff
_080E6DFC:
	ldr r0, _080E6E18 @ =gSharedMem + 0x1000
	ldrb r0, [r0, 0x8]
	cmp r0, 0x4
	bne _080E6E20
	bl sub_80E7FA8
	lsls r0, 24
	cmp r0, 0
	bne _080E6E20
	ldr r0, _080E6E1C @ =sub_80E6C84
	bl sub_80E682C
	b _080E6F5E
	.align 2, 0
_080E6E18: .4byte gSharedMem + 0x1000
_080E6E1C: .4byte sub_80E6C84
_080E6E20:
	movs r0, 0x1
	bl sub_80E91D4
	bl sub_80E9744
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0
	bl DisplayYesNoMenu
	movs r0, 0
	bl MoveMenuCursor
	b _080E6F3C
_080E6E3C:
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r6, r0, 24
	cmp r6, 0
	beq _080E6E5C
	cmp r6, 0
	bgt _080E6E56
	movs r0, 0x1
	negs r0, r0
	cmp r6, r0
	beq _080E6EDC
	b _080E6F5E
_080E6E56:
	cmp r6, 0x1
	beq _080E6EDC
	b _080E6F5E
_080E6E5C:
	ldr r7, _080E6EC8 @ =gScriptResult
	bl sub_80E7FA8
	lsls r0, 24
	lsrs r0, 24
	negs r0, r0
	lsrs r0, 31
	strh r0, [r7]
	bl sub_80E7D9C
	ldrb r0, [r5, 0x8]
	cmp r0, 0
	bne _080E6E82
	ldr r4, _080E6ECC @ =gSpecialVar_0x8004
	bl sub_80E8094
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
_080E6E82:
	ldrb r0, [r5, 0x8]
	cmp r0, 0x9
	bne _080E6E9C
	bl sub_80E81C0
	ldr r4, _080E6ECC @ =gSpecialVar_0x8004
	ldr r1, _080E6ED0 @ =0x00009c7c
	adds r0, r5, r1
	bl sub_80FA364
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
_080E6E9C:
	ldrb r0, [r5, 0x8]
	cmp r0, 0xD
	bne _080E6EBE
	ldrh r0, [r5, 0xC]
	ldr r1, _080E6ED4 @ =0x0000ffff
	cmp r0, r1
	beq _080E6EB0
	ldrh r0, [r5, 0xE]
	cmp r0, r1
	bne _080E6EB2
_080E6EB0:
	strh r6, [r7]
_080E6EB2:
	ldr r4, _080E6ECC @ =gSpecialVar_0x8004
	bl sub_80E810C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
_080E6EBE:
	ldr r0, _080E6ED8 @ =sub_80E752C
	bl sub_80E682C
	b _080E6F5E
	.align 2, 0
_080E6EC8: .4byte gScriptResult
_080E6ECC: .4byte gSpecialVar_0x8004
_080E6ED0: .4byte 0x00009c7c
_080E6ED4: .4byte 0x0000ffff
_080E6ED8: .4byte sub_80E752C
_080E6EDC:
	bl HandleDestroyMenuCursors
	bl sub_80E81FC
	ldr r4, _080E6EFC @ =gSharedMem + 0x1000
	ldrb r0, [r4, 0x8]
	cmp r0, 0x6
	bne _080E6F00
	bl sub_80E7FA8
	lsls r0, 24
	cmp r0, 0
	beq _080E6F00
	movs r0, 0x64
	strh r0, [r4, 0x24]
	b _080E6F5E
	.align 2, 0
_080E6EFC: .4byte gSharedMem + 0x1000
_080E6F00:
	bl sub_80E95A4
	b _080E6F12
_080E6F06:
	ldr r0, _080E6F1C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _080E6F5E
_080E6F12:
	ldr r0, _080E6F20 @ =sub_80E6AC4
	bl sub_80E682C
	b _080E6F5E
	.align 2, 0
_080E6F1C: .4byte gMain
_080E6F20: .4byte sub_80E6AC4
_080E6F24:
	movs r0, 0x7
	bl sub_80E91D4
	ldrh r0, [r5, 0x24]
	adds r0, 0x1
	strh r0, [r5, 0x24]
_080E6F30:
	ldr r0, _080E6F48 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080E6F5E
_080E6F3C:
	ldr r1, _080E6F4C @ =gSharedMem + 0x1000
	ldrh r0, [r1, 0x24]
	adds r0, 0x1
	strh r0, [r1, 0x24]
	b _080E6F5E
	.align 2, 0
_080E6F48: .4byte gMain
_080E6F4C: .4byte gSharedMem + 0x1000
_080E6F50:
	bl sub_80E7E50
	bl sub_80E95A4
	ldr r0, _080E6F64 @ =sub_80E6AC4
	bl sub_80E682C
_080E6F5E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E6F64: .4byte sub_80E6AC4
	thumb_func_end sub_80E6D7C

	thumb_func_start sub_80E6F68
sub_80E6F68: @ 80E6F68
	push {r4,lr}
	ldr r4, _080E6F78 @ =gSharedMem + 0x1000
	ldrh r0, [r4, 0x24]
	cmp r0, 0
	beq _080E6F7C
	cmp r0, 0x1
	beq _080E6F9C
	b _080E6FBC
	.align 2, 0
_080E6F78: .4byte gSharedMem + 0x1000
_080E6F7C:
	movs r0, 0x1
	bl sub_80E8398
	movs r0, 0xA
	bl sub_80E91D4
	bl sub_80E683C
	bl sub_80E9974
	bl sub_80E9E98
	ldrh r0, [r4, 0x24]
	adds r0, 0x1
	strh r0, [r4, 0x24]
	b _080E6FBC
_080E6F9C:
	bl sub_80E9EA8
	lsls r0, 24
	cmp r0, 0
	beq _080E6FBC
	movs r0, 0x1
	bl sub_80E8D8C
	bl sub_80E8420
	movs r0, 0
	bl sub_80E8958
	ldr r0, _080E6FC4 @ =sub_80E6FC8
	bl sub_80E682C
_080E6FBC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E6FC4: .4byte sub_80E6FC8
	thumb_func_end sub_80E6F68

	thumb_func_start sub_80E6FC8
sub_80E6FC8: @ 80E6FC8
	push {r4,lr}
	bl sub_80E77C8
	adds r1, r0, 0
	ldr r4, _080E7000 @ =gSharedMem + 0x1000
	adds r0, r4, 0
	adds r0, 0x96
	strb r1, [r0]
	movs r2, 0xE0
	lsls r2, 1
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _080E700C
	movs r0, 0x5
	bl PlaySE
	movs r1, 0xE2
	lsls r1, 1
	adds r0, r4, r1
	ldr r1, _080E7004 @ =sub_80E6FC8
	str r1, [r0]
	ldr r0, _080E7008 @ =sub_80E7458
	bl sub_80E682C
	b _080E710A
	.align 2, 0
_080E7000: .4byte gSharedMem + 0x1000
_080E7004: .4byte sub_80E6FC8
_080E7008: .4byte sub_80E7458
_080E700C:
	lsls r0, r1, 24
	cmp r0, 0
	beq _080E7018
	movs r0, 0x5
	bl PlaySE
_080E7018:
	ldr r0, _080E7054 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080E70E8
	ldr r2, _080E7058 @ =0x000001b7
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _080E7090
	movs r0, 0x5
	bl PlaySE
	movs r1, 0xD4
	lsls r1, 1
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x2
	beq _080E7070
	cmp r0, 0x2
	bgt _080E705C
	cmp r0, 0x1
	beq _080E7062
	b _080E710A
	.align 2, 0
_080E7054: .4byte gMain
_080E7058: .4byte 0x000001b7
_080E705C:
	cmp r0, 0x3
	beq _080E70F0
	b _080E710A
_080E7062:
	ldr r0, _080E706C @ =sub_80E718C
	bl sub_80E682C
	b _080E710A
	.align 2, 0
_080E706C: .4byte sub_80E718C
_080E7070:
	ldrb r0, [r4, 0x8]
	cmp r0, 0x6
	beq _080E710A
	adds r0, r4, 0
	adds r0, 0x27
	ldrb r0, [r0]
	ldr r1, _080E708C @ =0x0000ffff
	bl sub_80E7F00
	bl sub_80E7574
	bl sub_80E95A4
	b _080E710A
	.align 2, 0
_080E708C: .4byte 0x0000ffff
_080E7090:
	adds r0, r4, 0
	adds r0, 0x26
	ldrb r0, [r0]
	cmp r0, 0
	beq _080E70CA
	ldr r2, _080E70DC @ =0x000001a9
	adds r0, r4, r2
	movs r2, 0
	ldrsb r2, [r0, r2]
	movs r1, 0xD4
	lsls r1, 1
	adds r0, r4, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	adds r2, r0
	adds r0, r4, 0
	adds r0, 0x40
	adds r2, r0
	ldrb r0, [r2]
	lsls r0, 1
	ldr r2, _080E70E0 @ =0x00004142
	adds r1, r4, r2
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0
	beq _080E710A
_080E70CA:
	movs r0, 0x5
	bl PlaySE
	bl sub_80E7AD4
	ldr r0, _080E70E4 @ =sub_80E7218
	bl sub_80E682C
	b _080E710A
	.align 2, 0
_080E70DC: .4byte 0x000001a9
_080E70E0: .4byte 0x00004142
_080E70E4: .4byte sub_80E7218
_080E70E8:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080E70FC
_080E70F0:
	ldr r0, _080E70F8 @ =sub_80E7114
	bl sub_80E682C
	b _080E710A
	.align 2, 0
_080E70F8: .4byte sub_80E7114
_080E70FC:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080E710A
	ldr r0, _080E7110 @ =sub_80E718C
	bl sub_80E682C
_080E710A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E7110: .4byte sub_80E718C
	thumb_func_end sub_80E6FC8

	thumb_func_start sub_80E7114
sub_80E7114: @ 80E7114
	push {lr}
	ldr r0, _080E712C @ =gSharedMem + 0x1000
	ldrh r1, [r0, 0x24]
	adds r2, r0, 0
	cmp r1, 0x4
	bhi _080E7182
	lsls r0, r1, 2
	ldr r1, _080E7130 @ =_080E7134
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E712C: .4byte gSharedMem + 0x1000
_080E7130: .4byte _080E7134
	.align 2, 0
_080E7134:
	.4byte _080E7148
	.4byte _080E715C
	.4byte _080E715C
	.4byte _080E7164
	.4byte _080E717C
_080E7148:
	bl sub_80E8504
	bl sub_80E9E98
	bl sub_80E88F0
	movs r0, 0
	bl sub_80E8D8C
	b _080E716E
_080E715C:
	ldrh r0, [r2, 0x24]
	adds r0, 0x1
	strh r0, [r2, 0x24]
	b _080E7182
_080E7164:
	bl sub_80E9F50
	lsls r0, 24
	cmp r0, 0
	beq _080E7182
_080E716E:
	ldr r1, _080E7178 @ =gSharedMem + 0x1000
	ldrh r0, [r1, 0x24]
	adds r0, 0x1
	strh r0, [r1, 0x24]
	b _080E7182
	.align 2, 0
_080E7178: .4byte gSharedMem + 0x1000
_080E717C:
	ldr r0, _080E7188 @ =sub_80E6AC4
	bl sub_80E682C
_080E7182:
	pop {r0}
	bx r0
	.align 2, 0
_080E7188: .4byte sub_80E6AC4
	thumb_func_end sub_80E7114

	thumb_func_start sub_80E718C
sub_80E718C: @ 80E718C
	push {r4,lr}
	ldr r0, _080E71A4 @ =gSharedMem + 0x1000
	ldrh r1, [r0, 0x24]
	adds r4, r0, 0
	cmp r1, 0x1
	beq _080E71C6
	cmp r1, 0x1
	bgt _080E71A8
	cmp r1, 0
	beq _080E71AE
	b _080E71EC
	.align 2, 0
_080E71A4: .4byte gSharedMem + 0x1000
_080E71A8:
	cmp r1, 0x8
	beq _080E71F4
	b _080E71EC
_080E71AE:
	bl sub_80E8504
	bl sub_80E9E98
	bl sub_80E88F0
	ldrh r0, [r4, 0x24]
	adds r0, 0x1
	strh r0, [r4, 0x24]
	bl sub_80E8D54
	b _080E720E
_080E71C6:
	bl sub_80E9FD4
	lsls r0, 24
	cmp r0, 0
	beq _080E720E
	movs r2, 0
	adds r1, r4, 0
	adds r1, 0x26
	ldrb r0, [r1]
	cmp r0, 0
	bne _080E71DE
	movs r2, 0x1
_080E71DE:
	strb r2, [r1]
	bl sub_80E683C
	bl sub_80E9974
	bl sub_80E9E98
_080E71EC:
	ldrh r0, [r4, 0x24]
	adds r0, 0x1
	strh r0, [r4, 0x24]
	b _080E720E
_080E71F4:
	bl sub_80EA014
	lsls r0, 24
	cmp r0, 0
	beq _080E720E
	bl sub_80E8420
	movs r0, 0
	bl sub_80E8958
	ldr r0, _080E7214 @ =sub_80E6FC8
	bl sub_80E682C
_080E720E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E7214: .4byte sub_80E6FC8
	thumb_func_end sub_80E718C

	thumb_func_start sub_80E7218
sub_80E7218: @ 80E7218
	push {r4,lr}
	ldr r4, _080E7230 @ =gSharedMem + 0x1000
	ldrh r0, [r4, 0x24]
	adds r1, r4, 0
	cmp r0, 0x9
	beq _080E7260
	cmp r0, 0x9
	bgt _080E7234
	cmp r0, 0x8
	beq _080E7244
	b _080E723C
	.align 2, 0
_080E7230: .4byte gSharedMem + 0x1000
_080E7234:
	cmp r0, 0xA
	beq _080E7276
	cmp r0, 0xB
	beq _080E7288
_080E723C:
	ldrh r0, [r1, 0x24]
	adds r0, 0x1
	strh r0, [r1, 0x24]
	b _080E7288
_080E7244:
	movs r0, 0
	bl sub_80E8D8C
	bl sub_80E8504
	bl sub_80E9AD4
	bl sub_80E68E8
	bl sub_80E88F0
	bl sub_80E9E98
	b _080E726E
_080E7260:
	bl sub_80EA050
	lsls r0, 24
	cmp r0, 0
	beq _080E7288
	bl sub_80E9C94
_080E726E:
	ldrh r0, [r4, 0x24]
	adds r0, 0x1
	strh r0, [r4, 0x24]
	b _080E7288
_080E7276:
	movs r0, 0x1
	bl sub_80E87CC
	movs r0, 0x1
	bl sub_80E8958
	ldr r0, _080E7290 @ =sub_80E7294
	bl sub_80E682C
_080E7288:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E7290: .4byte sub_80E7294
	thumb_func_end sub_80E7218

	thumb_func_start sub_80E7294
sub_80E7294: @ 80E7294
	push {r4,lr}
	bl sub_80E7B40
	adds r1, r0, 0
	ldr r4, _080E72CC @ =gSharedMem + 0x1000
	ldr r2, _080E72D0 @ =0x000001b9
	adds r0, r4, r2
	strb r1, [r0]
	adds r2, 0x7
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _080E72DC
	movs r0, 0x5
	bl PlaySE
	movs r1, 0xE2
	lsls r1, 1
	adds r0, r4, r1
	ldr r1, _080E72D4 @ =sub_80E7294
	str r1, [r0]
	ldr r0, _080E72D8 @ =sub_80E7458
	bl sub_80E682C
	b _080E731A
	.align 2, 0
_080E72CC: .4byte gSharedMem + 0x1000
_080E72D0: .4byte 0x000001b9
_080E72D4: .4byte sub_80E7294
_080E72D8: .4byte sub_80E7458
_080E72DC:
	lsls r0, r1, 24
	cmp r0, 0
	beq _080E72E8
	movs r0, 0x5
	bl PlaySE
_080E72E8:
	ldr r0, _080E7304 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080E730C
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080E7308 @ =sub_80E7324
	bl sub_80E682C
	b _080E731A
	.align 2, 0
_080E7304: .4byte gMain
_080E7308: .4byte sub_80E7324
_080E730C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080E731A
	ldr r0, _080E7320 @ =sub_80E73D0
	bl sub_80E682C
_080E731A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E7320: .4byte sub_80E73D0
	thumb_func_end sub_80E7294

	thumb_func_start sub_80E7324
sub_80E7324: @ 80E7324
	push {lr}
	ldr r0, _080E733C @ =gSharedMem + 0x1000
	ldrh r1, [r0, 0x24]
	adds r2, r0, 0
	cmp r1, 0x4
	bhi _080E73C6
	lsls r0, r1, 2
	ldr r1, _080E7340 @ =_080E7344
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E733C: .4byte gSharedMem + 0x1000
_080E7340: .4byte _080E7344
	.align 2, 0
_080E7344:
	.4byte _080E7358
	.4byte _080E737C
	.4byte _080E7384
	.4byte _080E738A
	.4byte _080E73A4
_080E7358:
	bl sub_80E7DD0
	lsls r0, 24
	cmp r0, 0
	bne _080E7370
	ldr r0, _080E736C @ =sub_80E7294
	bl sub_80E682C
	b _080E73C6
	.align 2, 0
_080E736C: .4byte sub_80E7294
_080E7370:
	bl sub_80E88F0
	movs r0, 0
	bl sub_80E87CC
	b _080E7394
_080E737C:
	ldrh r0, [r2, 0x24]
	adds r0, 0x1
	strh r0, [r2, 0x24]
	b _080E73C6
_080E7384:
	bl sub_80E9E98
	b _080E7394
_080E738A:
	bl sub_80EA184
	lsls r0, 24
	cmp r0, 0
	beq _080E73C6
_080E7394:
	ldr r1, _080E73A0 @ =gSharedMem + 0x1000
	ldrh r0, [r1, 0x24]
	adds r0, 0x1
	strh r0, [r1, 0x24]
	b _080E73C6
	.align 2, 0
_080E73A0: .4byte gSharedMem + 0x1000
_080E73A4:
	ldrb r0, [r2, 0x8]
	cmp r0, 0x6
	bne _080E73C0
	bl sub_80E7FA8
	lsls r0, 24
	cmp r0, 0
	beq _080E73C0
	ldr r0, _080E73BC @ =sub_80E6D7C
	bl sub_80E682C
	b _080E73C6
	.align 2, 0
_080E73BC: .4byte sub_80E6D7C
_080E73C0:
	ldr r0, _080E73CC @ =sub_80E6AC4
	bl sub_80E682C
_080E73C6:
	pop {r0}
	bx r0
	.align 2, 0
_080E73CC: .4byte sub_80E6AC4
	thumb_func_end sub_80E7324

	thumb_func_start sub_80E73D0
sub_80E73D0: @ 80E73D0
	push {lr}
	ldr r0, _080E73E4 @ =gSharedMem + 0x1000
	ldrh r0, [r0, 0x24]
	cmp r0, 0x4
	bhi _080E744E
	lsls r0, 2
	ldr r1, _080E73E8 @ =_080E73EC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E73E4: .4byte gSharedMem + 0x1000
_080E73E8: .4byte _080E73EC
	.align 2, 0
_080E73EC:
	.4byte _080E7400
	.4byte _080E740C
	.4byte _080E7416
	.4byte _080E742C
	.4byte _080E7444
_080E7400:
	movs r0, 0
	bl sub_80E87CC
	bl sub_80E88F0
	b _080E7436
_080E740C:
	bl sub_80E9AD4
	bl sub_80E9E98
	b _080E7436
_080E7416:
	bl sub_80EA0E4
	lsls r0, 24
	cmp r0, 0
	beq _080E744E
	movs r0, 0x1
	bl sub_80E8D8C
	bl sub_80E9A14
	b _080E7436
_080E742C:
	bl sub_80E8420
	movs r0, 0
	bl sub_80E8958
_080E7436:
	ldr r1, _080E7440 @ =gSharedMem + 0x1000
	ldrh r0, [r1, 0x24]
	adds r0, 0x1
	strh r0, [r1, 0x24]
	b _080E744E
	.align 2, 0
_080E7440: .4byte gSharedMem + 0x1000
_080E7444:
	bl sub_80E9974
	ldr r0, _080E7454 @ =sub_80E6FC8
	bl sub_80E682C
_080E744E:
	pop {r0}
	bx r0
	.align 2, 0
_080E7454: .4byte sub_80E6FC8
	thumb_func_end sub_80E73D0

	thumb_func_start sub_80E7458
sub_80E7458: @ 80E7458
	push {r4,r5,lr}
	ldr r4, _080E7468 @ =gSharedMem + 0x1000
	ldrh r5, [r4, 0x24]
	cmp r5, 0
	beq _080E746C
	cmp r5, 0x1
	beq _080E74A4
	b _080E7518
	.align 2, 0
_080E7468: .4byte gSharedMem + 0x1000
_080E746C:
	movs r1, 0xE2
	lsls r1, 1
	adds r0, r4, r1
	ldr r1, [r0]
	ldr r0, _080E7480 @ =sub_80E6FC8
	cmp r1, r0
	bne _080E7484
	bl sub_80E9D7C
	b _080E7488
	.align 2, 0
_080E7480: .4byte sub_80E6FC8
_080E7484:
	bl sub_80E9D00
_080E7488:
	ldr r4, _080E74A0 @ =gSharedMem + 0x1000
	movs r2, 0xDF
	lsls r2, 1
	adds r0, r4, r2
	ldrb r0, [r0]
	bl sub_80E9E08
	ldrh r0, [r4, 0x24]
	adds r0, 0x1
	strh r0, [r4, 0x24]
	b _080E7518
	.align 2, 0
_080E74A0: .4byte gSharedMem + 0x1000
_080E74A4:
	bl sub_80E9E54
	lsls r0, 24
	cmp r0, 0
	beq _080E7518
	movs r1, 0xE2
	lsls r1, 1
	adds r0, r4, r1
	ldr r1, [r0]
	ldr r0, _080E74DC @ =sub_80E6FC8
	cmp r1, r0
	bne _080E74E4
	bl sub_80E9D7C
	ldr r2, _080E74E0 @ =0x000001b5
	adds r1, r4, r2
	adds r2, 0xB
	adds r0, r4, r2
	ldrb r0, [r0]
	ldrb r2, [r1]
	adds r0, r2
	strb r0, [r1]
	bl sub_80E7A98
	adds r0, r4, 0
	adds r0, 0x96
	b _080E74FE
	.align 2, 0
_080E74DC: .4byte sub_80E6FC8
_080E74E0: .4byte 0x000001b5
_080E74E4:
	ldr r0, _080E7520 @ =0x00009a29
	adds r1, r4, r0
	movs r2, 0xE0
	lsls r2, 1
	adds r0, r4, r2
	ldrb r0, [r0]
	ldrb r2, [r1]
	adds r0, r2
	strb r0, [r1]
	bl sub_80E7D30
	ldr r1, _080E7524 @ =0x000001b9
	adds r0, r4, r1
_080E74FE:
	strb r5, [r0]
	ldr r1, _080E7528 @ =gSharedMem + 0x1000
	movs r0, 0xDF
	lsls r0, 1
	adds r2, r1, r0
	movs r0, 0x2
	strb r0, [r2]
	movs r2, 0xE2
	lsls r2, 1
	adds r0, r1, r2
	ldr r0, [r0]
	bl sub_80E682C
_080E7518:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E7520: .4byte 0x00009a29
_080E7524: .4byte 0x000001b9
_080E7528: .4byte gSharedMem + 0x1000
	thumb_func_end sub_80E7458

	thumb_func_start sub_80E752C
sub_80E752C: @ 80E752C
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _080E7540 @ =gSharedMem + 0x1000
	ldrh r1, [r4, 0x24]
	cmp r1, 0
	beq _080E7544
	cmp r1, 0x1
	beq _080E755C
	b _080E756C
	.align 2, 0
_080E7540: .4byte gSharedMem + 0x1000
_080E7544:
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0x24]
	adds r0, 0x1
	strh r0, [r4, 0x24]
	b _080E756C
_080E755C:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _080E756C
	ldr r0, [r4]
	bl SetMainCallback2
_080E756C:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E752C

	thumb_func_start sub_80E7574
sub_80E7574: @ 80E7574
	push {r4,r5,lr}
	ldr r4, _080E75B8 @ =gSharedMem + 0x1000
	ldrb r5, [r4, 0x8]
	cmp r5, 0x1
	bne _080E75BC
	adds r0, r4, 0
	adds r0, 0x86
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r1, r4, 0
	adds r1, 0x7E
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _080E75BC
	adds r0, r4, 0
	adds r0, 0x27
	ldrb r0, [r0]
	lsls r0, 1
	subs r1, 0x72
	adds r0, r1
	ldrh r0, [r0]
	bl sub_80EB2D4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x7
	beq _080E75BC
	adds r0, r4, 0
	adds r0, 0x7D
	strb r5, [r0]
	adds r1, r4, 0
	b _080E75C6
	.align 2, 0
_080E75B8: .4byte gSharedMem + 0x1000
_080E75BC:
	ldr r1, _080E75D4 @ =gSharedMem + 0x1000
	adds r2, r1, 0
	adds r2, 0x7D
	movs r0, 0
	strb r0, [r2]
_080E75C6:
	adds r1, 0x7D
	movs r0, 0
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E75D4: .4byte gSharedMem + 0x1000
	thumb_func_end sub_80E7574

	thumb_func_start sub_80E75D8
sub_80E75D8: @ 80E75D8
	push {r4-r6,lr}
	movs r4, 0
	ldr r2, _080E75FC @ =gMain
	ldrh r1, [r2, 0x2E]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080E7604
	ldr r1, _080E7600 @ =gSharedMem + 0x1000
	adds r0, r1, 0
	adds r0, 0x84
	ldrb r0, [r0]
	adds r2, r1, 0
	adds r2, 0x86
	strb r0, [r2]
	adds r1, 0x85
	movs r0, 0x2
	b _080E768E
	.align 2, 0
_080E75FC: .4byte gMain
_080E7600: .4byte gSharedMem + 0x1000
_080E7604:
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080E7630
	ldr r2, _080E762C @ =gSharedMem + 0x1000
	adds r1, r2, 0
	adds r1, 0x86
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bge _080E765C
	adds r0, r2, 0
	adds r0, 0x84
	ldrb r0, [r0]
	strb r0, [r1]
	b _080E765C
	.align 2, 0
_080E762C: .4byte gSharedMem + 0x1000
_080E7630:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080E7658
	ldr r0, _080E7684 @ =gSharedMem + 0x1000
	adds r3, r0, 0
	adds r3, 0x86
	ldrb r1, [r3]
	adds r1, 0x1
	strb r1, [r3]
	adds r0, 0x84
	lsls r1, 24
	asrs r1, 24
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r1, r0
	ble _080E7656
	strb r4, [r3]
_080E7656:
	movs r4, 0x1
_080E7658:
	cmp r4, 0
	beq _080E76EA
_080E765C:
	ldr r2, _080E7684 @ =gSharedMem + 0x1000
	ldrb r3, [r2, 0x9]
	cmp r3, 0x2
	bne _080E7692
	adds r1, r2, 0
	adds r1, 0x86
	adds r0, r2, 0
	adds r0, 0x84
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r1, r0
	bne _080E7688
	adds r0, r2, 0
	adds r0, 0x85
	strb r3, [r0]
	b _080E77BC
	.align 2, 0
_080E7684: .4byte gSharedMem + 0x1000
_080E7688:
	adds r1, r2, 0
	adds r1, 0x85
	movs r0, 0
_080E768E:
	strb r0, [r1]
	b _080E77BC
_080E7692:
	movs r0, 0x85
	adds r0, r2
	mov r12, r0
	adds r4, r2, 0
	adds r4, 0x83
	movs r1, 0
	ldrsb r1, [r0, r1]
	ldrb r3, [r4]
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r1, r0
	blt _080E76B0
	subs r0, r3, 0x1
	mov r1, r12
	strb r0, [r1]
_080E76B0:
	adds r1, r2, 0
	adds r1, 0x86
	adds r0, r2, 0
	adds r0, 0x84
	ldrb r3, [r1]
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r1, r0
	beq _080E77BC
	ldrb r0, [r4]
	adds r4, r0, 0
	muls r4, r3
	adds r0, r4, 0
	mov r5, r12
	ldrb r5, [r5]
	adds r0, r5
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r2, 0xA]
	cmp r0, r1
	bcc _080E77BC
	subs r0, r1
	mov r6, r12
	strb r0, [r6]
	b _080E77BC
_080E76EA:
	ldrh r2, [r2, 0x30]
	movs r0, 0x20
	ands r0, r2
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _080E7744
	ldr r2, _080E7728 @ =gSharedMem + 0x1000
	adds r3, r2, 0
	adds r3, 0x85
	ldrb r0, [r3]
	subs r0, 0x1
	strb r0, [r3]
	lsls r0, 24
	cmp r0, 0
	bge _080E77BC
	adds r1, r2, 0
	adds r1, 0x86
	adds r0, r2, 0
	adds r0, 0x84
	ldrb r4, [r1]
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r1, r0
	bne _080E772C
	movs r0, 0x2
	b _080E77BA
	.align 2, 0
_080E7728: .4byte gSharedMem + 0x1000
_080E772C:
	adds r0, r2, 0
	adds r0, 0x83
	ldrb r0, [r0]
	subs r1, r0, 0x1
	strb r1, [r3]
	adds r5, r4, 0
	muls r5, r0
	adds r0, r5, 0
	adds r1, r0
	lsls r1, 24
	lsrs r0, r1, 24
	b _080E77B2
_080E7744:
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	beq _080E77C0
	ldr r2, _080E777C @ =gSharedMem + 0x1000
	adds r5, r2, 0
	adds r5, 0x86
	adds r0, r2, 0
	adds r0, 0x84
	movs r1, 0
	ldrsb r1, [r5, r1]
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r1, r0
	bne _080E7780
	adds r1, r2, 0
	adds r1, 0x85
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x2
	ble _080E77BC
	strb r4, [r1]
	b _080E77BC
	.align 2, 0
_080E777C: .4byte gSharedMem + 0x1000
_080E7780:
	adds r3, r2, 0
	adds r3, 0x85
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	movs r6, 0x83
	adds r6, r2
	mov r12, r6
	lsls r0, 24
	asrs r0, 24
	movs r1, 0
	ldrsb r1, [r6, r1]
	cmp r0, r1
	blt _080E779E
	strb r4, [r3]
_080E779E:
	ldrb r1, [r5]
	mov r4, r12
	ldrb r0, [r4]
	adds r5, r0, 0
	muls r5, r1
	adds r0, r5, 0
	ldrb r6, [r3]
	adds r0, r6
	lsls r0, 24
	lsrs r0, 24
_080E77B2:
	ldrb r1, [r2, 0xA]
	cmp r0, r1
	bcc _080E77BC
	subs r0, r1
_080E77BA:
	strb r0, [r3]
_080E77BC:
	movs r0, 0x1
	b _080E77C2
_080E77C0:
	movs r0, 0
_080E77C2:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80E75D8

	thumb_func_start sub_80E77C8
sub_80E77C8: @ 80E77C8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r7, 0
	ldr r1, _080E780C @ =gSharedMem + 0x1000
	ldr r2, _080E7810 @ =0x000001b7
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r3, r1, 0
	cmp r0, 0
	beq _080E783E
	ldr r1, _080E7814 @ =gMain
	ldrh r2, [r1, 0x30]
	movs r0, 0x40
	ands r0, r2
	adds r6, r1, 0
	cmp r0, 0
	beq _080E7818
	movs r4, 0xD4
	lsls r4, 1
	adds r1, r3, r4
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	ble _080E7806
	b _080E7948
_080E7806:
	movs r0, 0x3
	strb r0, [r1]
	b _080E7948
	.align 2, 0
_080E780C: .4byte gSharedMem + 0x1000
_080E7810: .4byte 0x000001b7
_080E7814: .4byte gMain
_080E7818:
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	bne _080E7822
	b _080E7950
_080E7822:
	movs r5, 0xD4
	lsls r5, 1
	adds r1, r3, r5
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x3
	bgt _080E7838
	b _080E7948
_080E7838:
	movs r0, 0x1
	strb r0, [r1]
	b _080E7948
_080E783E:
	adds r0, r3, 0
	adds r0, 0x26
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080E789A
	movs r4, 0
	ldr r1, _080E7870 @ =gMain
	ldrh r2, [r1, 0x30]
	movs r0, 0x40
	ands r0, r2
	adds r6, r1, 0
	cmp r0, 0
	beq _080E7874
	movs r6, 0xD4
	lsls r6, 1
	adds r1, r3, r6
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bge _080E7944
	movs r0, 0x3
	strb r0, [r1]
	b _080E7944
	.align 2, 0
_080E7870: .4byte gMain
_080E7874:
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _080E7894
	movs r0, 0xD4
	lsls r0, 1
	adds r1, r3, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _080E7892
	strb r7, [r1]
_080E7892:
	movs r4, 0x1
_080E7894:
	cmp r4, 0
	beq _080E7950
	b _080E7944
_080E789A:
	movs r4, 0
	movs r1, 0xE0
	lsls r1, 1
	adds r5, r3, r1
	strb r7, [r5]
	ldr r1, _080E78E0 @ =gMain
	ldrh r2, [r1, 0x30]
	movs r0, 0x40
	ands r0, r2
	adds r6, r1, 0
	cmp r0, 0
	beq _080E78E8
	movs r2, 0xD4
	lsls r2, 1
	adds r1, r3, r2
	ldrb r2, [r1]
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0
	bne _080E78C4
	b _080E7A88
_080E78C4:
	subs r0, r2, 0x1
	strb r0, [r1]
	ldr r4, _080E78E4 @ =0x000001b5
	adds r1, r3, r4
	lsls r0, 24
	asrs r0, 24
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	cmp r0, r1
	bge _080E7932
	movs r0, 0xFF
	strb r0, [r5]
	b _080E7932
	.align 2, 0
_080E78E0: .4byte gMain
_080E78E4: .4byte 0x000001b5
_080E78E8:
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _080E792E
	movs r0, 0xD4
	lsls r0, 1
	adds r2, r3, r0
	movs r1, 0
	ldrsb r1, [r2, r1]
	movs r4, 0xDB
	lsls r4, 1
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	subs r0, 0x1
	cmp r1, r0
	blt _080E790E
	b _080E7A88
_080E790E:
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	movs r1, 0
	ldrsb r1, [r2, r1]
	ldr r2, _080E794C @ =0x000001b5
	adds r0, r3, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, 0x3
	cmp r1, r0
	ble _080E792C
	movs r0, 0x1
	strb r0, [r5]
_080E792C:
	movs r4, 0x1
_080E792E:
	cmp r4, 0
	beq _080E7950
_080E7932:
	movs r4, 0xE0
	lsls r4, 1
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _080E7944
	b _080E7A88
_080E7944:
	bl sub_80E7A98
_080E7948:
	movs r0, 0x1
	b _080E7A8A
	.align 2, 0
_080E794C: .4byte 0x000001b5
_080E7950:
	ldrh r1, [r6, 0x30]
	movs r0, 0x20
	ands r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0
	beq _080E7992
	ldr r5, _080E7974 @ =0x000001a9
	adds r2, r3, r5
	ldrb r1, [r2]
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r0, 0
	beq _080E7978
	subs r0, r1, 0x1
	strb r0, [r2]
	b _080E79E6
	.align 2, 0
_080E7974: .4byte 0x000001a9
_080E7978:
	movs r6, 0xD4
	lsls r6, 1
	adds r0, r3, r6
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	movs r4, 0xD5
	lsls r4, 1
	adds r1, r3, r4
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	b _080E79E6
_080E7992:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080E79E2
	ldr r5, _080E79D4 @ =0x000001b7
	adds r0, r3, r5
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bne _080E79CC
	ldr r0, _080E79D8 @ =0x000001a9
	adds r4, r3, r0
	movs r1, 0xD4
	lsls r1, 1
	adds r0, r3, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r2, 0xD5
	lsls r2, 1
	adds r0, r3, r2
	adds r1, r0
	ldrb r5, [r4]
	movs r2, 0
	ldrsb r2, [r4, r2]
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	bne _080E79DC
_080E79CC:
	ldr r4, _080E79D8 @ =0x000001a9
	adds r0, r3, r4
	strb r6, [r0]
	b _080E79E0
	.align 2, 0
_080E79D4: .4byte 0x000001b7
_080E79D8: .4byte 0x000001a9
_080E79DC:
	adds r0, r5, 0x1
	strb r0, [r4]
_080E79E0:
	movs r7, 0x1
_080E79E2:
	cmp r7, 0
	beq _080E7A88
_080E79E6:
	adds r2, r3, 0
	ldr r5, _080E7A48 @ =0x000001b7
	adds r7, r2, r5
	ldrb r6, [r7]
	mov r9, r6
	movs r1, 0
	ldr r0, _080E7A4C @ =0x000001a9
	adds r0, r2
	mov r12, r0
	subs r5, 0xF
	adds r4, r2, r5
	movs r0, 0
	ldrsb r0, [r4, r0]
	movs r6, 0xD5
	lsls r6, 1
	adds r6, r2
	mov r8, r6
	add r0, r8
	mov r6, r12
	movs r5, 0
	ldrsb r5, [r6, r5]
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r5, r0
	bne _080E7A1C
	movs r1, 0x1
_080E7A1C:
	strb r1, [r7]
	cmp r1, 0
	beq _080E7A58
	ldr r0, _080E7A50 @ =0x000001b5
	adds r1, r2, r0
	ldrb r0, [r4]
	ldrb r1, [r1]
	subs r0, r1
	strb r0, [r4]
	lsls r0, 24
	cmp r0, 0
	beq _080E7A36
	b _080E7948
_080E7A36:
	movs r0, 0x1
	strb r0, [r4]
	ldr r1, _080E7A54 @ =0x000001ab
	adds r0, r2, r1
	ldrb r0, [r0]
	mov r2, r12
	strb r0, [r2]
	b _080E7948
	.align 2, 0
_080E7A48: .4byte 0x000001b7
_080E7A4C: .4byte 0x000001a9
_080E7A50: .4byte 0x000001b5
_080E7A54: .4byte 0x000001ab
_080E7A58:
	mov r6, r9
	cmp r6, 0
	bne _080E7A60
	b _080E7948
_080E7A60:
	ldr r1, _080E7A84 @ =0x000001b5
	adds r0, r3, r1
	ldrb r0, [r0]
	ldrb r2, [r4]
	adds r0, r2
	strb r0, [r4]
	cmp r5, 0
	bne _080E7A72
	b _080E7948
_080E7A72:
	movs r0, 0
	ldrsb r0, [r4, r0]
	add r0, r8
	ldrb r0, [r0]
	subs r0, 0x1
	mov r4, r12
	strb r0, [r4]
	b _080E7948
	.align 2, 0
_080E7A84: .4byte 0x000001b5
_080E7A88:
	movs r0, 0
_080E7A8A:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80E77C8

	thumb_func_start sub_80E7A98
sub_80E7A98: @ 80E7A98
	push {lr}
	ldr r1, _080E7ACC @ =gSharedMem + 0x1000
	ldr r0, _080E7AD0 @ =0x000001a9
	adds r3, r1, r0
	movs r2, 0xD4
	lsls r2, 1
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r2, 0x2
	adds r1, r2
	adds r0, r1
	movs r1, 0
	ldrsb r1, [r3, r1]
	ldrb r2, [r0]
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r1, r0
	blt _080E7AC6
	subs r0, r2, 0x1
	strb r0, [r3]
_080E7AC6:
	pop {r0}
	bx r0
	.align 2, 0
_080E7ACC: .4byte gSharedMem + 0x1000
_080E7AD0: .4byte 0x000001a9
	thumb_func_end sub_80E7A98

	thumb_func_start sub_80E7AD4
sub_80E7AD4: @ 80E7AD4
	push {lr}
	ldr r3, _080E7B08 @ =gSharedMem + 0x1000
	adds r0, r3, 0
	adds r0, 0x26
	ldrb r0, [r0]
	cmp r0, 0
	bne _080E7B10
	ldr r1, _080E7B0C @ =0x000001a9
	adds r0, r3, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r2, 0xD4
	lsls r2, 1
	adds r0, r3, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 1
	adds r1, r0
	adds r0, r3, 0
	adds r0, 0x2A
	adds r1, r0
	ldrb r1, [r1]
	adds r2, 0x10
	b _080E7B34
	.align 2, 0
_080E7B08: .4byte gSharedMem + 0x1000
_080E7B0C: .4byte 0x000001a9
_080E7B10:
	ldr r1, _080E7B3C @ =0x000001a9
	adds r0, r3, r1
	movs r2, 0
	ldrsb r2, [r0, r2]
	subs r1, 0x1
	adds r0, r3, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	adds r2, r0
	adds r0, r3, 0
	adds r0, 0x40
	adds r2, r0
	ldrb r1, [r2]
	movs r2, 0xDC
	lsls r2, 1
_080E7B34:
	adds r0, r3, r2
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080E7B3C: .4byte 0x000001a9
	thumb_func_end sub_80E7AD4

	thumb_func_start sub_80E7B40
sub_80E7B40: @ 80E7B40
	push {r4-r7,lr}
	movs r5, 0
	ldr r2, _080E7B8C @ =gSharedMem + 0x1000
	movs r0, 0xE0
	lsls r0, 1
	adds r6, r2, r0
	strb r5, [r6]
	ldr r1, _080E7B90 @ =gMain
	ldrh r4, [r1, 0x30]
	movs r0, 0x40
	ands r0, r4
	adds r3, r2, 0
	adds r7, r1, 0
	cmp r0, 0
	beq _080E7B9C
	ldr r2, _080E7B94 @ =0x000099a4
	adds r1, r3, r2
	ldrb r2, [r1]
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0
	bne _080E7B6E
	b _080E7D1A
_080E7B6E:
	subs r0, r2, 0x1
	strb r0, [r1]
	ldr r4, _080E7B98 @ =0x00009a29
	adds r1, r3, r4
	lsls r0, 24
	asrs r0, 24
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	cmp r0, r1
	bge _080E7BF2
	movs r0, 0xFF
	strb r0, [r6]
	b _080E7D1A
	.align 2, 0
_080E7B8C: .4byte gSharedMem + 0x1000
_080E7B90: .4byte gMain
_080E7B94: .4byte 0x000099a4
_080E7B98: .4byte 0x00009a29
_080E7B9C:
	movs r0, 0x80
	ands r0, r4
	cmp r0, 0
	beq _080E7BEE
	ldr r0, _080E7BE0 @ =0x000099a4
	adds r2, r3, r0
	movs r1, 0
	ldrsb r1, [r2, r1]
	ldr r4, _080E7BE4 @ =0x00009a28
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	subs r0, 0x1
	cmp r1, r0
	blt _080E7BBE
	b _080E7D1A
_080E7BBE:
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	movs r1, 0
	ldrsb r1, [r2, r1]
	ldr r2, _080E7BE8 @ =0x00009a29
	adds r0, r3, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, 0x4
	cmp r1, r0
	blt _080E7BEC
	movs r0, 0x1
	strb r0, [r6]
	b _080E7D1A
	.align 2, 0
_080E7BE0: .4byte 0x000099a4
_080E7BE4: .4byte 0x00009a28
_080E7BE8: .4byte 0x00009a29
_080E7BEC:
	movs r5, 0x1
_080E7BEE:
	cmp r5, 0
	beq _080E7BFA
_080E7BF2:
	bl sub_80E7D30
_080E7BF6:
	movs r0, 0x1
	b _080E7D1C
_080E7BFA:
	ldrh r1, [r7, 0x30]
	movs r0, 0x20
	ands r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	beq _080E7C38
	ldr r4, _080E7C30 @ =0x000099a5
	adds r2, r3, r4
	ldrb r0, [r2]
	subs r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	cmp r0, 0
	bge _080E7BF6
	ldr r6, _080E7C34 @ =0x000099a4
	adds r0, r3, r6
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r4, 0x1
	adds r1, r3, r4
	adds r0, r1
	ldrb r0, [r0]
	subs r0, 0x1
	strb r0, [r2]
	b _080E7BF6
	.align 2, 0
_080E7C30: .4byte 0x000099a5
_080E7C34: .4byte 0x000099a4
_080E7C38:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080E7C70
	ldr r6, _080E7C68 @ =0x000099a5
	adds r4, r3, r6
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r2, _080E7C6C @ =0x000099a4
	adds r1, r3, r2
	movs r2, 0
	ldrsb r2, [r1, r2]
	adds r6, 0x1
	adds r1, r3, r6
	adds r2, r1
	lsls r0, 24
	asrs r0, 24
	movs r1, 0
	ldrsb r1, [r2, r1]
	cmp r0, r1
	blt _080E7BF6
	strb r5, [r4]
	b _080E7BF6
	.align 2, 0
_080E7C68: .4byte 0x000099a5
_080E7C6C: .4byte 0x000099a4
_080E7C70:
	ldrh r1, [r7, 0x2E]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080E7CC4
	ldr r1, _080E7CBC @ =0x00009a29
	adds r0, r3, r1
	ldrb r1, [r0]
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _080E7CA2
	negs r0, r1
	movs r4, 0xE0
	lsls r4, 1
	adds r2, r3, r4
	strb r0, [r2]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x4
	negs r1, r1
	cmp r0, r1
	bge _080E7CA2
	strb r1, [r2]
_080E7CA2:
	ldr r6, _080E7CC0 @ =0x000099a4
	adds r1, r3, r6
	movs r2, 0xE0
	lsls r2, 1
	adds r0, r3, r2
	ldrb r0, [r0]
	ldrb r4, [r1]
	adds r0, r4
	strb r0, [r1]
	movs r6, 0xDF
	lsls r6, 1
	adds r1, r3, r6
	b _080E7D16
	.align 2, 0
_080E7CBC: .4byte 0x00009a29
_080E7CC0: .4byte 0x000099a4
_080E7CC4:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080E7D1A
	ldr r0, _080E7D24 @ =0x00009a29
	adds r4, r3, r0
	movs r1, 0
	ldrsb r1, [r4, r1]
	ldr r6, _080E7D28 @ =0x00009a28
	adds r2, r3, r6
	movs r0, 0
	ldrsb r0, [r2, r0]
	subs r0, 0x4
	cmp r1, r0
	bge _080E7CFE
	ldrb r1, [r4]
	adds r1, 0x4
	ldrb r0, [r2]
	subs r0, r1
	movs r2, 0xE0
	lsls r2, 1
	adds r1, r3, r2
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x4
	ble _080E7CFE
	movs r0, 0x4
	strb r0, [r1]
_080E7CFE:
	ldr r4, _080E7D2C @ =0x000099a4
	adds r1, r3, r4
	movs r6, 0xE0
	lsls r6, 1
	adds r0, r3, r6
	ldrb r0, [r0]
	ldrb r2, [r1]
	adds r0, r2
	strb r0, [r1]
	movs r4, 0xDF
	lsls r4, 1
	adds r1, r3, r4
_080E7D16:
	movs r0, 0x4
	strb r0, [r1]
_080E7D1A:
	movs r0, 0
_080E7D1C:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080E7D24: .4byte 0x00009a29
_080E7D28: .4byte 0x00009a28
_080E7D2C: .4byte 0x000099a4
	thumb_func_end sub_80E7B40

	thumb_func_start sub_80E7D30
sub_80E7D30: @ 80E7D30
	push {r4,lr}
	ldr r0, _080E7D60 @ =gSharedMem + 0x1000
	ldr r1, _080E7D64 @ =0x000099a5
	adds r4, r0, r1
	ldr r2, _080E7D68 @ =0x000099a4
	adds r1, r0, r2
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	adds r2, 0x2
	adds r0, r2
	adds r1, r0
	movs r2, 0
	ldrsb r2, [r4, r2]
	ldrb r3, [r1]
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	blt _080E7D5A
	subs r0, r3, 0x1
	strb r0, [r4]
_080E7D5A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E7D60: .4byte gSharedMem + 0x1000
_080E7D64: .4byte 0x000099a5
_080E7D68: .4byte 0x000099a4
	thumb_func_end sub_80E7D30

	thumb_func_start sub_80E7D6C
sub_80E7D6C: @ 80E7D6C
	push {r4,r5,lr}
	movs r4, 0
	ldr r0, _080E7D94 @ =gSharedMem + 0x1000
	ldrb r1, [r0, 0xA]
	cmp r4, r1
	bcs _080E7D8E
	adds r5, r0, 0
_080E7D7A:
	adds r0, r4, 0
	ldr r1, _080E7D98 @ =0x0000ffff
	bl sub_80E7F00
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrb r0, [r5, 0xA]
	cmp r4, r0
	bcc _080E7D7A
_080E7D8E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E7D94: .4byte gSharedMem + 0x1000
_080E7D98: .4byte 0x0000ffff
	thumb_func_end sub_80E7D6C

	thumb_func_start sub_80E7D9C
sub_80E7D9C: @ 80E7D9C
	push {r4,r5,lr}
	movs r2, 0
	ldr r0, _080E7DCC @ =gSharedMem + 0x1000
	ldrb r1, [r0, 0xA]
	cmp r2, r1
	bcs _080E7DC6
	adds r3, r0, 0
	ldr r4, [r3, 0x4]
	adds r5, r3, 0
	adds r5, 0xC
_080E7DB0:
	lsls r0, r2, 1
	adds r1, r0, r4
	adds r0, r5
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldrb r0, [r3, 0xA]
	cmp r2, r0
	bcc _080E7DB0
_080E7DC6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E7DCC: .4byte gSharedMem + 0x1000
	thumb_func_end sub_80E7D9C

	thumb_func_start sub_80E7DD0
sub_80E7DD0: @ 80E7DD0
	push {r4,lr}
	ldr r2, _080E7E28 @ =gSharedMem + 0x1000
	ldr r1, _080E7E2C @ =0x000099a5
	adds r0, r2, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r1, 1
	ldr r3, _080E7E30 @ =0x000099a4
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r1, r0
	adds r3, 0x86
	adds r0, r2, r3
	adds r1, r0
	ldrh r4, [r1]
	adds r0, r2, 0
	adds r0, 0x7D
	ldrb r0, [r0]
	cmp r0, 0
	beq _080E7E34
	adds r0, r2, 0
	adds r0, 0x86
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r1, r2, 0
	adds r1, 0x7E
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _080E7E34
	adds r0, r4, 0
	bl sub_80EB2D4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x7
	bne _080E7E34
	movs r0, 0
	b _080E7E46
	.align 2, 0
_080E7E28: .4byte gSharedMem + 0x1000
_080E7E2C: .4byte 0x000099a5
_080E7E30: .4byte 0x000099a4
_080E7E34:
	ldr r0, _080E7E4C @ =gSharedMem + 0x1000
	adds r0, 0x27
	ldrb r0, [r0]
	adds r1, r4, 0
	bl sub_80E7F00
	bl sub_80E95A4
	movs r0, 0x1
_080E7E46:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080E7E4C: .4byte gSharedMem + 0x1000
	thumb_func_end sub_80E7DD0

	thumb_func_start sub_80E7E50
sub_80E7E50: @ 80E7E50
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r5, 0
	movs r2, 0
	ldr r1, _080E7EF0 @ =gSharedMem + 0x1000
	adds r3, r1, 0
	adds r3, 0x84
	movs r0, 0
	ldrsb r0, [r3, r0]
	cmp r2, r0
	bge _080E7EDE
	mov r8, r1
	adds r0, r1, 0
	str r0, [sp]
_080E7E74:
	mov r0, r8
	adds r0, 0x7E
	adds r0, r2, r0
	movs r1, 0
	strb r1, [r0]
	movs r3, 0
	ldr r6, _080E7EF4 @ =gSharedMem + 0x1083
	movs r0, 0
	ldrsb r0, [r6, r0]
	adds r1, r2, 0x1
	str r1, [sp, 0x4]
	cmp r3, r0
	bge _080E7ECE
	ldr r6, [sp]
	mov r12, r6
	movs r0, 0
	mov r10, r0
	ldr r1, _080E7EF4 @ =gSharedMem + 0x1083
	mov r9, r1
	ldr r7, _080E7EF8 @ =gSharedMem + 0x100C
	lsls r4, r2, 1
_080E7E9E:
	lsls r1, r5, 1
	adds r2, r1, r7
	mov r6, r12
	ldr r0, [r6, 0x4]
	adds r1, r0
	ldrh r0, [r1]
	strh r0, [r2]
	adds r0, r3, r4
	mov r1, r12
	adds r1, 0x8C
	adds r0, r1
	mov r1, r10
	strb r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	mov r6, r9
	movs r0, 0
	ldrsb r0, [r6, r0]
	cmp r3, r0
	blt _080E7E9E
_080E7ECE:
	ldr r1, [sp, 0x4]
	lsls r0, r1, 16
	lsrs r2, r0, 16
	ldr r6, _080E7EFC @ =gSharedMem + 0x1084
	movs r0, 0
	ldrsb r0, [r6, r0]
	cmp r2, r0
	blt _080E7E74
_080E7EDE:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E7EF0: .4byte gSharedMem + 0x1000
_080E7EF4: .4byte gSharedMem + 0x1083
_080E7EF8: .4byte gSharedMem + 0x100C
_080E7EFC: .4byte gSharedMem + 0x1084
	thumb_func_end sub_80E7E50

	thumb_func_start sub_80E7F00
sub_80E7F00: @ 80E7F00
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	ldr r7, _080E7F68 @ =gSharedMem + 0x1000
	adds r0, r7, 0
	adds r0, 0x83
	movs r4, 0
	ldrsb r4, [r0, r4]
	adds r0, r6, 0
	adds r1, r4, 0
	bl __divsi3
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r6, 0
	adds r1, r4, 0
	bl __modsi3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r0, r6, 1
	adds r1, r7, 0
	adds r1, 0xC
	adds r0, r1
	ldrh r0, [r0]
	bl sub_80EB2D4
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r9
	bl sub_80EB2D4
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r4, 0x7
	bne _080E7F6C
	cmp r3, 0x7
	beq _080E7F7C
	adds r1, r7, 0
	adds r1, 0x7E
	adds r1, r5, r1
	ldrb r0, [r1]
	subs r0, 0x1
	b _080E7F7A
	.align 2, 0
_080E7F68: .4byte gSharedMem + 0x1000
_080E7F6C:
	cmp r3, 0x7
	bne _080E7F7C
	adds r1, r7, 0
	adds r1, 0x7E
	adds r1, r5, r1
	ldrb r0, [r1]
	adds r0, 0x1
_080E7F7A:
	strb r0, [r1]
_080E7F7C:
	movs r3, 0
	ldr r2, _080E7FA4 @ =gSharedMem + 0x1000
	lsls r0, r5, 1
	add r0, r8
	adds r1, r2, 0
	adds r1, 0x8C
	adds r0, r1
	strb r3, [r0]
	lsls r0, r6, 1
	adds r2, 0xC
	adds r0, r2
	mov r1, r9
	strh r1, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E7FA4: .4byte gSharedMem + 0x1000
	thumb_func_end sub_80E7F00

	thumb_func_start sub_80E7FA8
sub_80E7FA8: @ 80E7FA8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r0, 0
	mov r8, r0
	movs r5, 0
	ldr r0, _080E8040 @ =gSharedMem + 0x1000
	ldrb r1, [r0, 0xA]
	cmp r8, r1
	bcs _080E802E
	ldr r3, _080E8044 @ =0x00009e14
	adds r6, r0, r3
	ldr r1, _080E8048 @ =0x00009e41
	adds r1, r0
	mov r9, r1
_080E7FC8:
	ldr r3, _080E804C @ =0xffff61ec
	adds r7, r6, r3
	ldr r0, [r7, 0x4]
	lsls r4, r5, 1
	adds r0, r4, r0
	ldrh r1, [r0]
	adds r0, r6, 0
	movs r2, 0
	bl sub_80EB218
	ldr r1, _080E8050 @ =0xffff61f8
	adds r0, r6, r1
	adds r0, r4
	ldrh r1, [r0]
	mov r0, r9
	movs r2, 0
	bl sub_80EB218
	adds r1, r6, 0
	mov r2, r9
	ldrb r0, [r1]
	adds r4, r5, 0x1
	ldrb r3, [r2]
	cmp r0, r3
	bne _080E8018
	adds r3, r7, 0
	cmp r0, 0xFF
	beq _080E8010
_080E8000:
	adds r1, 0x1
	adds r2, 0x1
	ldrb r0, [r1]
	ldrb r5, [r2]
	cmp r0, r5
	bne _080E8018
	cmp r0, 0xFF
	bne _080E8000
_080E8010:
	ldrb r0, [r1]
	ldrb r2, [r2]
	cmp r0, r2
	beq _080E8024
_080E8018:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r3, _080E8040 @ =gSharedMem + 0x1000
_080E8024:
	lsls r0, r4, 16
	lsrs r5, r0, 16
	ldrb r3, [r3, 0xA]
	cmp r5, r3
	bcc _080E7FC8
_080E802E:
	mov r1, r8
	lsls r0, r1, 24
	lsrs r0, 24
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080E8040: .4byte gSharedMem + 0x1000
_080E8044: .4byte 0x00009e14
_080E8048: .4byte 0x00009e41
_080E804C: .4byte 0xffff61ec
_080E8050: .4byte 0xffff61f8
	thumb_func_end sub_80E7FA8

	thumb_func_start sub_80E8054
sub_80E8054: @ 80E8054
	push {r4,lr}
	movs r1, 0
	ldr r2, _080E8078 @ =gSharedMem + 0x1000
	ldrb r0, [r2, 0xA]
	cmp r1, r0
	bcs _080E808A
	adds r4, r2, 0
	adds r4, 0xC
	ldr r3, _080E807C @ =0x0000ffff
	adds r2, r0, 0
_080E8068:
	lsls r0, r1, 1
	adds r0, r4
	ldrh r0, [r0]
	cmp r0, r3
	beq _080E8080
	movs r0, 0
	b _080E808C
	.align 2, 0
_080E8078: .4byte gSharedMem + 0x1000
_080E807C: .4byte 0x0000ffff
_080E8080:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r2
	bcc _080E8068
_080E808A:
	movs r0, 0x1
_080E808C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80E8054

	thumb_func_start sub_80E8094
sub_80E8094: @ 80E8094
	push {r4-r7,lr}
	movs r5, 0
	ldr r6, _080E80C4 @ =gSharedMem + 0xAE14
	adds r7, r6, 0
	adds r7, 0x2D
_080E809E:
	lsls r4, r5, 1
	ldr r1, _080E80C8 @ =0xffff61f8
	adds r0, r6, r1
	adds r0, r4
	ldrh r1, [r0]
	adds r0, r6, 0
	movs r2, 0
	bl sub_80EB218
	ldr r0, _080E80CC @ =gMysteryEventPhrase
	adds r4, r0
	ldrh r1, [r4]
	adds r0, r7, 0
	movs r2, 0
	bl sub_80EB218
	adds r3, r6, 0
	adds r4, r7, 0
	b _080E80D8
	.align 2, 0
_080E80C4: .4byte gSharedMem + 0xAE14
_080E80C8: .4byte 0xffff61f8
_080E80CC: .4byte gMysteryEventPhrase
_080E80D0:
	adds r4, 0x1
	adds r3, 0x1
	cmp r2, r1
	bne _080E80F4
_080E80D8:
	ldrb r2, [r3]
	adds r0, r2, 0
	cmp r0, 0xFF
	beq _080E80EE
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _080E80D0
	ldrb r0, [r3]
	cmp r0, 0xFF
	bne _080E80F4
_080E80EE:
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _080E80F8
_080E80F4:
	movs r0, 0
	b _080E8104
_080E80F8:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _080E809E
	movs r0, 0x1
_080E8104:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80E8094

	thumb_func_start sub_80E810C
sub_80E810C: @ 80E810C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r5, 0
	ldr r6, _080E8198 @ =gSharedMem + 0xAE6E
	ldr r0, _080E819C @ =0xffff6192
	adds r0, r6
	mov r9, r0
	movs r1, 0
	mov r8, r1
	adds r7, r6, 0
	adds r7, 0x80
	ldr r2, _080E81A0 @ =gBerryMasterWifePhrases
	mov r10, r2
_080E812C:
	mov r0, r9
	ldrh r1, [r0, 0xC]
	adds r0, r6, 0
	movs r2, 0
	bl sub_80EB218
	mov r1, r8
	strb r1, [r0]
	adds r0, 0x1
	mov r2, r9
	ldrh r1, [r2, 0xE]
	movs r2, 0
	bl sub_80EB218
	lsls r4, r5, 2
	mov r1, r10
	adds r0, r4, r1
	ldrh r1, [r0]
	adds r0, r7, 0
	movs r2, 0
	bl sub_80EB218
	mov r2, r8
	strb r2, [r0]
	adds r0, 0x1
	ldr r1, _080E81A4 @ =gBerryMasterWifePhrases + 0x2
	adds r4, r1
	ldrh r1, [r4]
	movs r2, 0
	bl sub_80EB218
	adds r0, r6, 0
	adds r3, r7, 0
	adds r4, r5, 0x1
_080E8170:
	ldrb r2, [r0]
	cmp r2, 0xFF
	beq _080E818A
	ldrb r1, [r3]
	cmp r1, 0xFF
	beq _080E8184
	adds r3, 0x1
	adds r0, 0x1
	cmp r2, r1
	beq _080E8170
_080E8184:
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080E81A8
_080E818A:
	ldrb r0, [r3]
	cmp r0, 0xFF
	bne _080E81A8
	lsls r0, r4, 24
	lsrs r0, 24
	b _080E81B2
	.align 2, 0
_080E8198: .4byte gSharedMem + 0xAE6E
_080E819C: .4byte 0xffff6192
_080E81A0: .4byte gBerryMasterWifePhrases
_080E81A4: .4byte gBerryMasterWifePhrases + 0x2
_080E81A8:
	lsls r0, r4, 16
	lsrs r5, r0, 16
	cmp r5, 0x4
	bls _080E812C
	movs r0, 0
_080E81B2:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80E810C

	thumb_func_start sub_80E81C0
sub_80E81C0: @ 80E81C0
	push {r4,lr}
	ldr r0, _080E81EC @ =gStringVar2
	ldr r4, _080E81F0 @ =gSharedMem + 0x1000
	ldr r2, _080E81F4 @ =0x00009c7c
	adds r1, r4, r2
	ldrh r1, [r1]
	movs r2, 0
	bl sub_80EB218
	movs r1, 0
	strb r1, [r0]
	adds r0, 0x1
	ldr r1, _080E81F8 @ =0x00009c7e
	adds r4, r1
	ldrh r1, [r4]
	movs r2, 0
	bl sub_80EB218
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E81EC: .4byte gStringVar2
_080E81F0: .4byte gSharedMem + 0x1000
_080E81F4: .4byte 0x00009c7c
_080E81F8: .4byte 0x00009c7e
	thumb_func_end sub_80E81C0

	thumb_func_start sub_80E81FC
sub_80E81FC: @ 80E81FC
	push {lr}
	movs r0, 0x5
	bl PlaySE
	bl sub_80E95A4
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	thumb_func_end sub_80E81FC

	thumb_func_start sub_80E8218
sub_80E8218: @ 80E8218
	push {r4,r5,lr}
	sub sp, 0x40
	mov r1, sp
	ldr r0, _080E8260 @ =gSpriteSheets_Interview
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r4,r5}
	stm r1!, {r2,r4,r5}
	ldr r0, [r0]
	str r0, [r1]
	add r4, sp, 0x28
	adds r1, r4, 0
	ldr r0, _080E8264 @ =gSpritePalettes_Interview
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	mov r0, sp
	bl LoadSpriteSheets
	adds r0, r4, 0
	bl LoadSpritePalettes
	bl sub_80E8268
	bl sub_80E8818
	bl sub_80E8A7C
	add sp, 0x40
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E8260: .4byte gSpriteSheets_Interview
_080E8264: .4byte gSpritePalettes_Interview
	thumb_func_end sub_80E8218

	thumb_func_start sub_80E8268
sub_80E8268: @ 80E8268
	push {lr}
	ldr r0, _080E82B0 @ =gSpriteTemplate_83DBBFC
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080E82B4 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldr r0, _080E82B8 @ =gUnknown_083DB694
	ldr r3, [r0]
	adds r0, r3, 0
	adds r0, 0x8A
	ldrh r0, [r0]
	lsls r0, 3
	adds r0, 0x8
	movs r2, 0
	strh r0, [r1, 0x22]
	adds r0, r3, 0
	adds r0, 0x88
	ldrh r0, [r0]
	lsls r0, 3
	adds r0, 0x4
	strh r0, [r1, 0x20]
	strh r2, [r1, 0x2E]
	strh r2, [r1, 0x30]
	adds r0, r3, 0
	adds r0, 0x98
	str r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080E82B0: .4byte gSpriteTemplate_83DBBFC
_080E82B4: .4byte gSprites
_080E82B8: .4byte gUnknown_083DB694
	thumb_func_end sub_80E8268

	thumb_func_start sub_80E82BC
sub_80E82BC: @ 80E82BC
	push {r4-r7,lr}
	adds r3, r0, 0
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080E838C
	ldr r0, _080E8334 @ =gUnknown_083DB694
	ldr r2, [r0]
	adds r1, r2, 0
	adds r1, 0x87
	ldrb r1, [r1]
	mov r12, r0
	cmp r1, 0
	beq _080E836C
	adds r0, r2, 0
	adds r0, 0x86
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r2, 0
	adds r0, 0x85
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 16
	lsrs r4, r0, 16
	movs r7, 0
	movs r1, 0
	cmp r7, r4
	bcs _080E8316
	lsls r6, r5, 1
	adds r2, 0x8C
_080E8300:
	adds r0, r1, r6
	adds r0, r2, r0
	ldrb r0, [r0]
	adds r0, r7, r0
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r4
	bcc _080E8300
_080E8316:
	mov r0, r12
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x84
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r5, r0
	bne _080E8338
	movs r0, 0x60
	strh r0, [r3, 0x22]
	lsls r0, r4, 3
	subs r0, r4
	adds r0, 0x3
	b _080E8356
	.align 2, 0
_080E8334: .4byte gUnknown_083DB694
_080E8338:
	adds r1, r2, 0
	adds r1, 0x8A
	lsls r0, r5, 1
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 3
	adds r0, 0x8
	strh r0, [r3, 0x22]
	adds r0, r2, 0
	adds r0, 0x88
	ldrh r0, [r0]
	adds r0, r7
	movs r1, 0xB
	muls r1, r4
	adds r0, r1
_080E8356:
	lsls r0, 3
	adds r0, 0x4
	strh r0, [r3, 0x20]
	movs r1, 0
	ldr r0, _080E8368 @ =0x0000fffa
	strh r0, [r3, 0x24]
	strh r1, [r3, 0x2E]
	b _080E838C
	.align 2, 0
_080E8368: .4byte 0x0000fffa
_080E836C:
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080E838C
	strh r1, [r3, 0x2E]
	ldrh r0, [r3, 0x24]
	adds r0, 0x1
	strh r0, [r3, 0x24]
	lsls r0, 16
	cmp r0, 0
	ble _080E838C
	ldr r0, _080E8394 @ =0x0000fffa
	strh r0, [r3, 0x24]
_080E838C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E8394: .4byte 0x0000fffa
	thumb_func_end sub_80E82BC

	thumb_func_start sub_80E8398
sub_80E8398: @ 80E8398
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1
	beq _080E83D4
	cmp r3, 0x1
	bgt _080E83AC
	cmp r3, 0
	beq _080E83B2
	b _080E8416
_080E83AC:
	cmp r3, 0x2
	beq _080E83F8
	b _080E8416
_080E83B2:
	ldr r0, _080E83D0 @ =gUnknown_083DB694
	ldr r0, [r0]
	adds r0, 0x98
	ldr r1, [r0]
	strh r3, [r1, 0x30]
	ldr r1, [r0]
	strh r3, [r1, 0x24]
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	b _080E8414
	.align 2, 0
_080E83D0: .4byte gUnknown_083DB694
_080E83D4:
	ldr r0, _080E83F4 @ =gUnknown_083DB694
	ldr r1, [r0]
	adds r1, 0x98
	ldr r0, [r1]
	movs r2, 0
	strh r3, [r0, 0x30]
	ldr r0, [r1]
	strh r2, [r0, 0x24]
	ldr r1, [r1]
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	b _080E8414
	.align 2, 0
_080E83F4: .4byte gUnknown_083DB694
_080E83F8:
	ldr r0, _080E841C @ =gUnknown_083DB694
	ldr r1, [r0]
	adds r1, 0x98
	ldr r2, [r1]
	movs r3, 0
	movs r0, 0x1
	strh r0, [r2, 0x30]
	ldr r0, [r1]
	strh r3, [r0, 0x24]
	ldr r1, [r1]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
_080E8414:
	strb r0, [r1]
_080E8416:
	pop {r0}
	bx r0
	.align 2, 0
_080E841C: .4byte gUnknown_083DB694
	thumb_func_end sub_80E8398

	thumb_func_start sub_80E8420
sub_80E8420: @ 80E8420
	push {r4-r7,lr}
	sub sp, 0x18
	mov r1, sp
	ldr r0, _080E84E0 @ =gSpriteTemplate_83DBCAC
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	mov r0, sp
	movs r1, 0
	movs r2, 0
	movs r3, 0x3
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080E84E4 @ =gUnknown_083DB694
	ldr r7, [r1]
	adds r5, r7, 0
	adds r5, 0x9C
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r4, _080E84E8 @ =gSprites
	adds r1, r4
	str r1, [r5]
	ldr r0, _080E84EC @ =gSpriteAnimTable_83DBC8C
	str r0, [sp, 0x8]
	ldr r0, _080E84F0 @ =sub_80E872C
	str r0, [sp, 0x14]
	mov r0, sp
	movs r1, 0
	movs r2, 0
	movs r3, 0x4
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	adds r6, r7, 0
	adds r6, 0xA0
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	str r1, [r6]
	ldr r0, _080E84F4 @ =gSpriteAnimTable_83DBC9C
	str r0, [sp, 0x8]
	ldr r0, _080E84F8 @ =sub_80E8760
	str r0, [sp, 0x14]
	mov r0, sp
	movs r1, 0
	movs r2, 0
	movs r3, 0x5
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	adds r2, r7, 0
	adds r2, 0xA4
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	str r1, [r2]
	ldr r0, [r5]
	movs r1, 0
	strh r1, [r0, 0x2E]
	ldr r0, [r6]
	strh r1, [r0, 0x2E]
	ldr r0, [r2]
	strh r1, [r0, 0x2E]
	movs r0, 0x1
	bl IndexOfSpritePaletteTag
	ldr r1, [r5]
	lsls r0, 24
	lsrs r0, 20
	ldr r2, _080E84FC @ =0x00000101
	adds r0, r2
	strh r0, [r1, 0x34]
	bl sub_80E8534
	adds r1, r7, 0
	adds r1, 0x96
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _080E8500 @ =REG_BLDCNT
	movs r3, 0xFD
	lsls r3, 6
	adds r0, r3, 0
	strh r0, [r1]
	add sp, 0x18
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E84E0: .4byte gSpriteTemplate_83DBCAC
_080E84E4: .4byte gUnknown_083DB694
_080E84E8: .4byte gSprites
_080E84EC: .4byte gSpriteAnimTable_83DBC8C
_080E84F0: .4byte sub_80E872C
_080E84F4: .4byte gSpriteAnimTable_83DBC9C
_080E84F8: .4byte sub_80E8760
_080E84FC: .4byte 0x00000101
_080E8500: .4byte REG_BLDCNT
	thumb_func_end sub_80E8420

	thumb_func_start sub_80E8504
sub_80E8504: @ 80E8504
	push {r4,lr}
	ldr r0, _080E8530 @ =gUnknown_083DB694
	ldr r4, [r0]
	adds r0, r4, 0
	adds r0, 0x9C
	ldr r0, [r0]
	bl DestroySprite
	adds r0, r4, 0
	adds r0, 0xA0
	ldr r0, [r0]
	bl DestroySprite
	adds r0, r4, 0
	adds r0, 0xA4
	ldr r0, [r0]
	bl DestroySprite
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E8530: .4byte gUnknown_083DB694
	thumb_func_end sub_80E8504

	thumb_func_start sub_80E8534
sub_80E8534: @ 80E8534
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r1, _080E8554 @ =gUnknown_083DB694
	ldr r3, [r1]
	ldr r2, _080E8558 @ =0x000001b7
	adds r0, r3, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r4, r1, 0
	cmp r0, 0
	beq _080E8560
	ldr r1, _080E855C @ =gUnknown_020388AC
	movs r0, 0x1
	b _080E8598
	.align 2, 0
_080E8554: .4byte gUnknown_083DB694
_080E8558: .4byte 0x000001b7
_080E855C: .4byte gUnknown_020388AC
_080E8560:
	adds r0, r3, 0
	adds r0, 0x26
	ldrb r2, [r0]
	cmp r2, 0
	bne _080E8578
	ldr r0, _080E8574 @ =gUnknown_020388AC
	strb r2, [r0]
	adds r7, r0, 0
	b _080E859C
	.align 2, 0
_080E8574: .4byte gUnknown_020388AC
_080E8578:
	movs r1, 0xD4
	lsls r1, 1
	adds r0, r3, r1
	ldrh r1, [r0]
	movs r0, 0xC0
	lsls r0, 3
	cmp r1, r0
	bne _080E8594
	ldr r1, _080E8590 @ =gUnknown_020388AC
	movs r0, 0x2
	b _080E8598
	.align 2, 0
_080E8590: .4byte gUnknown_020388AC
_080E8594:
	ldr r1, _080E85F4 @ =gUnknown_020388AC
	movs r0, 0x3
_080E8598:
	strb r0, [r1]
	adds r7, r1, 0
_080E859C:
	ldr r2, [r4]
	adds r4, r2, 0
	adds r4, 0x9C
	ldr r1, [r4]
	ldrb r0, [r7]
	movs r3, 0
	mov r8, r3
	strh r0, [r1, 0x32]
	adds r5, r2, 0
	adds r5, 0xA0
	ldr r1, [r5]
	ldrb r0, [r7]
	strh r0, [r1, 0x32]
	adds r6, r2, 0
	adds r6, 0xA4
	ldr r1, [r6]
	ldrb r0, [r7]
	strh r0, [r1, 0x32]
	ldr r0, [r4]
	ldrb r1, [r7]
	bl StartSpriteAnim
	ldr r0, [r5]
	ldrb r1, [r7]
	bl StartSpriteAnim
	ldr r0, [r6]
	ldrb r1, [r7]
	bl StartSpriteAnim
	ldr r0, [r4]
	movs r1, 0x8
	strh r1, [r0, 0x38]
	ldr r0, [r4]
	strh r1, [r0, 0x3A]
	ldr r0, [r4]
	mov r1, r8
	strh r1, [r0, 0x30]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E85F4: .4byte gUnknown_020388AC
	thumb_func_end sub_80E8534

	thumb_func_start sub_80E85F8
sub_80E85F8: @ 80E85F8
	push {r4-r6,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080E8624
	ldr r1, _080E8620 @ =gSineTable
	movs r2, 0x30
	ldrsh r0, [r5, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 21
	adds r0, 0x8
	strh r0, [r5, 0x38]
	b _080E863A
	.align 2, 0
_080E8620: .4byte gSineTable
_080E8624:
	ldr r1, _080E8688 @ =gSineTable
	movs r2, 0x30
	ldrsh r0, [r5, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	lsls r1, 16
	asrs r1, 21
	movs r0, 0x8
	subs r0, r1
	strh r0, [r5, 0x3A]
_080E863A:
	ldrh r0, [r5, 0x30]
	adds r0, 0x5
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x30]
	ldr r2, _080E868C @ =REG_BLDALPHA
	ldrh r0, [r5, 0x3A]
	lsls r0, 8
	ldrh r1, [r5, 0x38]
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _080E8690 @ =gUnknown_083DB694
	ldr r6, [r0]
	adds r0, r6, 0
	adds r0, 0x96
	ldrb r0, [r0]
	cmp r0, 0
	beq _080E871A
	bl sub_80E8534
	adds r1, r6, 0
	adds r1, 0x9C
	ldr r0, [r1]
	movs r2, 0x8
	strh r2, [r0, 0x38]
	ldr r0, [r1]
	strh r2, [r0, 0x3A]
	ldr r1, [r1]
	movs r0, 0
	strh r0, [r1, 0x30]
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080E86C4
	cmp r0, 0x1
	bgt _080E8694
	cmp r0, 0
	beq _080E869E
	b _080E871A
	.align 2, 0
_080E8688: .4byte gSineTable
_080E868C: .4byte REG_BLDALPHA
_080E8690: .4byte gUnknown_083DB694
_080E8694:
	cmp r0, 0x2
	beq _080E86D6
	cmp r0, 0x3
	beq _080E86DE
	b _080E871A
_080E869E:
	ldr r2, _080E86C0 @ =0x000001a9
	adds r0, r6, r2
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x58
	muls r0, r1
	adds r0, 0x20
	strh r0, [r5, 0x20]
	movs r1, 0xD4
	lsls r1, 1
	adds r0, r6, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r2, 0xC
	b _080E870A
	.align 2, 0
_080E86C0: .4byte 0x000001a9
_080E86C4:
	movs r0, 0xD8
	strh r0, [r5, 0x20]
	movs r1, 0xD4
	lsls r1, 1
	adds r0, r6, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	b _080E8714
_080E86D6:
	movs r0, 0x97
	strh r0, [r5, 0x20]
	movs r0, 0x60
	b _080E8718
_080E86DE:
	ldr r4, _080E8720 @ =gUnknown_083DBCC4
	ldr r2, _080E8724 @ =0x000001a9
	adds r0, r6, r2
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0xD4
	lsls r0, 1
	adds r3, r6, r0
	movs r2, 0
	ldrsb r2, [r3, r2]
	lsls r0, r2, 3
	subs r0, r2
	adds r1, r0
	adds r1, r4
	movs r0, 0
	ldrsb r0, [r1, r0]
	lsls r0, 3
	adds r0, 0x1F
	strh r0, [r5, 0x20]
	movs r0, 0
	ldrsb r0, [r3, r0]
	ldr r2, _080E8728 @ =0x000001b5
_080E870A:
	adds r1, r6, r2
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	subs r0, r1
_080E8714:
	lsls r0, 4
	adds r0, 0x60
_080E8718:
	strh r0, [r5, 0x22]
_080E871A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E8720: .4byte gUnknown_083DBCC4
_080E8724: .4byte 0x000001a9
_080E8728: .4byte 0x000001b5
	thumb_func_end sub_80E85F8

	thumb_func_start sub_80E872C
sub_80E872C: @ 80E872C
	push {lr}
	adds r2, r0, 0
	ldr r0, _080E875C @ =gUnknown_083DB694
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x96
	ldrb r0, [r0]
	cmp r0, 0
	beq _080E8756
	movs r3, 0x32
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _080E8756
	adds r1, 0x9C
	ldr r0, [r1]
	ldrh r0, [r0, 0x20]
	adds r0, 0x20
	strh r0, [r2, 0x20]
	ldr r0, [r1]
	ldrh r0, [r0, 0x22]
	strh r0, [r2, 0x22]
_080E8756:
	pop {r0}
	bx r0
	.align 2, 0
_080E875C: .4byte gUnknown_083DB694
	thumb_func_end sub_80E872C

	thumb_func_start sub_80E8760
sub_80E8760: @ 80E8760
	push {lr}
	adds r2, r0, 0
	ldr r0, _080E8780 @ =gUnknown_083DB694
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x96
	ldrb r0, [r0]
	cmp r0, 0
	beq _080E879E
	movs r3, 0x32
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _080E8784
	cmp r0, 0x2
	beq _080E878E
	b _080E879E
	.align 2, 0
_080E8780: .4byte gUnknown_083DB694
_080E8784:
	adds r1, 0x9C
	ldr r0, [r1]
	ldrh r0, [r0, 0x20]
	adds r0, 0x40
	b _080E8796
_080E878E:
	adds r1, 0x9C
	ldr r0, [r1]
	ldrh r0, [r0, 0x20]
	adds r0, 0x15
_080E8796:
	strh r0, [r2, 0x20]
	ldr r0, [r1]
	ldrh r0, [r0, 0x22]
	strh r0, [r2, 0x22]
_080E879E:
	pop {r0}
	bx r0
	thumb_func_end sub_80E8760

	thumb_func_start sub_80E87A4
sub_80E87A4: @ 80E87A4
	push {r4,lr}
	lsls r0, 24
	ldr r1, _080E87C8 @ =gUnknown_083DB694
	ldr r1, [r1]
	adds r2, r1, 0
	adds r2, 0xA8
	ldr r3, [r2]
	movs r4, 0
	cmp r0, 0
	bne _080E87BA
	movs r4, 0x1
_080E87BA:
	movs r1, 0
	strh r4, [r3, 0x30]
	ldr r0, [r2]
	strh r1, [r0, 0x24]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E87C8: .4byte gUnknown_083DB694
	thumb_func_end sub_80E87A4

	thumb_func_start sub_80E87CC
sub_80E87CC: @ 80E87CC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r0, _080E8810 @ =gUnknown_083DB694
	ldr r5, [r0]
	adds r0, r5, 0
	adds r0, 0xA8
	ldr r0, [r0]
	movs r3, 0
	cmp r4, 0
	bne _080E87E6
	movs r3, 0x1
_080E87E6:
	adds r2, r0, 0
	adds r2, 0x3E
	lsls r3, 2
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	adds r0, r4, 0
	bl sub_80E87A4
	cmp r4, 0
	beq _080E880A
	ldr r0, _080E8814 @ =0x000001b9
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
_080E880A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E8810: .4byte gUnknown_083DB694
_080E8814: .4byte 0x000001b9
	thumb_func_end sub_80E87CC

	thumb_func_start sub_80E8818
sub_80E8818: @ 80E8818
	push {lr}
	ldr r0, _080E8850 @ =gSpriteTemplate_83DBBFC
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080E8854 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x2E]
	strh r0, [r1, 0x30]
	ldr r0, _080E8858 @ =gUnknown_083DB694
	ldr r0, [r0]
	adds r0, 0xA8
	str r1, [r0]
	ldr r0, _080E885C @ =sub_80E8860
	str r0, [r1, 0x1C]
	movs r0, 0
	bl sub_80E87CC
	pop {r0}
	bx r0
	.align 2, 0
_080E8850: .4byte gSpriteTemplate_83DBBFC
_080E8854: .4byte gSprites
_080E8858: .4byte gUnknown_083DB694
_080E885C: .4byte sub_80E8860
	thumb_func_end sub_80E8818

	thumb_func_start sub_80E8860
sub_80E8860: @ 80E8860
	push {r4,r5,lr}
	adds r2, r0, 0
	movs r0, 0x30
	ldrsh r4, [r2, r0]
	cmp r4, 0
	bne _080E88E4
	ldr r0, _080E88B0 @ =gUnknown_083DB694
	ldr r3, [r0]
	ldr r1, _080E88B4 @ =0x000001b9
	adds r0, r3, r1
	ldrb r1, [r0]
	cmp r1, 0
	beq _080E88C4
	ldr r5, _080E88B8 @ =0x000099a5
	adds r0, r3, r5
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x58
	muls r0, r1
	adds r0, 0x2C
	strh r0, [r2, 0x20]
	ldr r1, _080E88BC @ =0x000099a4
	adds r0, r3, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r5, 0x84
	adds r1, r3, r5
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	subs r0, r1
	lsls r0, 4
	adds r0, 0x60
	strh r0, [r2, 0x22]
	ldr r0, _080E88C0 @ =0x0000fffa
	strh r0, [r2, 0x24]
	strh r4, [r2, 0x2E]
	b _080E88E4
	.align 2, 0
_080E88B0: .4byte gUnknown_083DB694
_080E88B4: .4byte 0x000001b9
_080E88B8: .4byte 0x000099a5
_080E88BC: .4byte 0x000099a4
_080E88C0: .4byte 0x0000fffa
_080E88C4:
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080E88E4
	strh r1, [r2, 0x2E]
	ldrh r0, [r2, 0x24]
	adds r0, 0x1
	strh r0, [r2, 0x24]
	lsls r0, 16
	cmp r0, 0
	ble _080E88E4
	ldr r0, _080E88EC @ =0x0000fffa
	strh r0, [r2, 0x24]
_080E88E4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E88EC: .4byte 0x0000fffa
	thumb_func_end sub_80E8860

	thumb_func_start sub_80E88F0
sub_80E88F0: @ 80E88F0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r4, 0
	ldr r0, _080E8950 @ =gUnknown_083DB694
	mov r8, r0
	ldr r0, [r0]
	movs r6, 0x4
	movs r5, 0
	movs r1, 0xB4
	adds r1, r0
	mov r12, r1
	adds r7, r0, 0
	adds r7, 0xAC
_080E890C:
	lsls r2, r4, 2
	adds r3, r7, r2
	ldr r1, [r3]
	adds r1, 0x3E
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	ldr r0, [r3]
	strh r5, [r0, 0x30]
	add r2, r12
	ldr r1, [r2]
	adds r1, 0x3E
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	ldr r0, [r2]
	strh r5, [r0, 0x30]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _080E890C
	mov r1, r8
	ldr r0, [r1]
	ldr r1, _080E8954 @ =0x00009c70
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E8950: .4byte gUnknown_083DB694
_080E8954: .4byte 0x00009c70
	thumb_func_end sub_80E88F0

	thumb_func_start sub_80E8958
sub_80E8958: @ 80E8958
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0
	bne _080E89B4
	movs r0, 0x64
	mov r9, r0
	ldr r0, _080E8998 @ =gUnknown_083DB694
	ldr r2, [r0]
	ldr r3, _080E899C @ =0x00009c6c
	adds r1, r2, r3
	ldr r3, _080E89A0 @ =0x000001b5
	adds r0, r2, r3
	str r0, [r1]
	adds r0, r2, 0
	adds r0, 0x26
	ldrb r0, [r0]
	cmp r0, 0
	bne _080E89A8
	movs r1, 0xDB
	lsls r1, 1
	adds r0, r2, r1
	ldrb r0, [r0]
	subs r0, 0x4
	ldr r3, _080E89A4 @ =0x00009c71
	adds r1, r2, r3
	strb r0, [r1]
	b _080E8A00
	.align 2, 0
_080E8998: .4byte gUnknown_083DB694
_080E899C: .4byte 0x00009c6c
_080E89A0: .4byte 0x000001b5
_080E89A4: .4byte 0x00009c71
_080E89A8:
	ldr r1, _080E89B0 @ =0x00009c71
	adds r0, r2, r1
	strb r7, [r0]
	b _080E8A00
	.align 2, 0
_080E89B0: .4byte 0x00009c71
_080E89B4:
	movs r3, 0x78
	mov r9, r3
	ldr r0, _080E8A64 @ =gUnknown_083DB694
	ldr r2, [r0]
	ldr r0, _080E8A68 @ =0x00009c6c
	adds r1, r2, r0
	ldr r3, _080E8A6C @ =0x00009a29
	adds r0, r2, r3
	str r0, [r1]
	ldr r1, _080E8A70 @ =0x00009a28
	adds r0, r2, r1
	ldrb r0, [r0]
	subs r0, 0x4
	ldr r3, _080E8A74 @ =0x00009c71
	adds r1, r2, r3
	strb r0, [r1]
	movs r4, 0
	adds r5, r2, 0
	adds r5, 0xB4
	movs r0, 0x5
	negs r0, r0
	mov r12, r0
	movs r6, 0x1
_080E89E2:
	lsls r3, r4, 2
	adds r3, r5, r3
	ldr r1, [r3]
	adds r1, 0x3E
	ldrb r2, [r1]
	mov r0, r12
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	strh r6, [r0, 0x30]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _080E89E2
_080E8A00:
	ldr r0, _080E8A64 @ =gUnknown_083DB694
	ldr r2, [r0]
	ldr r3, _080E8A74 @ =0x00009c71
	adds r1, r2, r3
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0
	bge _080E8A14
	movs r0, 0
	strb r0, [r1]
_080E8A14:
	movs r4, 0
	adds r6, r2, 0
	adds r6, 0xAC
	movs r0, 0x5
	negs r0, r0
	mov r8, r0
_080E8A20:
	lsls r2, r4, 2
	adds r2, r6, r2
	ldr r0, [r2]
	mov r1, r9
	strh r1, [r0, 0x20]
	ldr r1, [r2]
	adds r1, 0x3E
	ldrb r0, [r1]
	mov r3, r8
	ands r0, r3
	strb r0, [r1]
	ldr r0, [r2]
	movs r5, 0x1
	strh r5, [r0, 0x30]
	ldr r0, [r2]
	adds r1, r7, 0
	bl StartSpriteAnim
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _080E8A20
	ldr r0, _080E8A64 @ =gUnknown_083DB694
	ldr r0, [r0]
	ldr r1, _080E8A78 @ =0x00009c70
	adds r0, r1
	strb r5, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E8A64: .4byte gUnknown_083DB694
_080E8A68: .4byte 0x00009c6c
_080E8A6C: .4byte 0x00009a29
_080E8A70: .4byte 0x00009a28
_080E8A74: .4byte 0x00009c71
_080E8A78: .4byte 0x00009c70
	thumb_func_end sub_80E8958

	thumb_func_start sub_80E8A7C
sub_80E8A7C: @ 80E8A7C
	push {r4-r7,lr}
	sub sp, 0x18
	mov r1, sp
	ldr r0, _080E8B68 @ =gSpriteTemplate_83DBD18
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	movs r5, 0
_080E8A8E:
	lsls r2, r5, 3
	adds r2, r5
	lsls r2, 19
	movs r0, 0xA8
	lsls r0, 15
	adds r2, r0
	asrs r2, 16
	mov r0, sp
	movs r1, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _080E8B6C @ =gUnknown_083DB694
	ldr r2, [r0]
	lsls r0, r5, 2
	adds r2, 0xAC
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E8B70 @ =gSprites
	adds r0, r1
	str r0, [r2]
	strh r5, [r0, 0x2E]
	ldr r3, [r2]
	adds r3, 0x3F
	movs r0, 0x1
	adds r2, r5, 0
	ands r2, r0
	lsls r2, 1
	ldrb r0, [r3]
	movs r4, 0x3
	negs r4, r4
	adds r1, r4, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x1
	bls _080E8A8E
	mov r0, sp
	movs r1, 0x3
	strh r1, [r0]
	ldr r0, _080E8B74 @ =gSpriteAnimTable_83DBD10
	str r0, [sp, 0x8]
	movs r5, 0
	movs r7, 0x3F
	movs r6, 0x40
_080E8AF6:
	lsls r4, r5, 2
	adds r1, r4, r5
	lsls r1, 19
	movs r0, 0x8E
	lsls r0, 16
	adds r1, r0
	asrs r1, 16
	mov r0, sp
	movs r2, 0x58
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _080E8B6C @ =gUnknown_083DB694
	ldr r2, [r0]
	adds r2, 0xB4
	adds r2, r4
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E8B70 @ =gSprites
	adds r0, r1
	str r0, [r2]
	strh r5, [r0, 0x2E]
	ldr r3, [r2]
	ldrb r1, [r3, 0x1]
	adds r0, r7, 0
	ands r0, r1
	orrs r0, r6
	strb r0, [r3, 0x1]
	ldr r3, [r2]
	ldrb r1, [r3, 0x3]
	adds r0, r7, 0
	ands r0, r1
	orrs r0, r6
	strb r0, [r3, 0x3]
	ldr r0, [r2]
	lsls r1, r5, 24
	lsrs r1, 24
	bl StartSpriteAnim
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x1
	bls _080E8AF6
	movs r0, 0
	bl sub_80E8958
	bl sub_80E88F0
	add sp, 0x18
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E8B68: .4byte gSpriteTemplate_83DBD18
_080E8B6C: .4byte gUnknown_083DB694
_080E8B70: .4byte gSprites
_080E8B74: .4byte gSpriteAnimTable_83DBD10
	thumb_func_end sub_80E8A7C

	thumb_func_start sub_80E8B78
sub_80E8B78: @ 80E8B78
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _080E8BB0 @ =gUnknown_083DB694
	ldr r1, [r0]
	ldr r2, _080E8BB4 @ =0x00009c70
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _080E8BE8
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r0, 0
	beq _080E8BE8
	movs r2, 0x2E
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bne _080E8BBC
	movs r4, 0
	ldr r2, _080E8BB8 @ =0x00009c6c
	adds r0, r1, r2
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bne _080E8BD6
	b _080E8BD4
	.align 2, 0
_080E8BB0: .4byte gUnknown_083DB694
_080E8BB4: .4byte 0x00009c70
_080E8BB8: .4byte 0x00009c6c
_080E8BBC:
	movs r4, 0
	ldr r2, _080E8BF0 @ =0x00009c6c
	adds r0, r1, r2
	ldr r0, [r0]
	adds r2, 0x5
	adds r1, r2
	movs r2, 0
	ldrsb r2, [r0, r2]
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	bne _080E8BD6
_080E8BD4:
	movs r4, 0x1
_080E8BD6:
	adds r2, r3, 0
	adds r2, 0x3E
	lsls r3, r4, 2
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
_080E8BE8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E8BF0: .4byte 0x00009c6c
	thumb_func_end sub_80E8B78

	thumb_func_start sub_80E8BF4
sub_80E8BF4: @ 80E8BF4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	ldr r0, _080E8C28 @ =gUnknown_083DBD30
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x4]
	str r1, [sp, 0x8]
	ldr r0, _080E8C2C @ =gUnknown_083DBD38
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0xC]
	str r1, [sp, 0x10]
	cmp r2, 0x2
	beq _080E8C20
	cmp r2, 0x5
	beq _080E8C30
_080E8C20:
	movs r4, 0x40
	movs r5, 0x28
	b _080E8C34
	.align 2, 0
_080E8C28: .4byte gUnknown_083DBD30
_080E8C2C: .4byte gUnknown_083DBD38
_080E8C30:
	movs r4, 0x24
	movs r5, 0x30
_080E8C34:
	cmp r3, 0
	beq _080E8C3C
	cmp r3, 0x1
	beq _080E8C40
_080E8C3C:
	movs r0, 0x43
	b _080E8C42
_080E8C40:
	movs r0, 0x44
_080E8C42:
	mov r8, r0
	add r0, sp, 0x4
	bl LoadCompressedObjectPic
	add r0, sp, 0xC
	bl LoadSpritePalette
	ldr r0, _080E8CDC @ =gSpriteTemplate_83DBD48
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x1
	bl CreateSprite
	ldr r0, _080E8CE0 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	movs r1, 0x69
	cmp r0, 0
	bne _080E8C68
	movs r1, 0x64
_080E8C68:
	ldr r7, _080E8CE4 @ =SpriteCallbackDummy
	adds r2, r4, 0
	subs r2, 0xC
	movs r6, 0
	str r6, [sp]
	adds r0, r1, 0
	adds r1, r7, 0
	adds r3, r5, 0
	bl AddPseudoFieldObject
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080E8C9E
	ldr r1, _080E8CE8 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	strb r1, [r0, 0x5]
	movs r1, 0x3
	bl StartSpriteAnim
_080E8C9E:
	adds r2, r4, 0
	adds r2, 0xC
	str r6, [sp]
	mov r0, r8
	adds r1, r7, 0
	adds r3, r5, 0
	bl AddPseudoFieldObject
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080E8CD0
	ldr r1, _080E8CE8 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	strb r1, [r0, 0x5]
	movs r1, 0x2
	bl StartSpriteAnim
_080E8CD0:
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E8CDC: .4byte gSpriteTemplate_83DBD48
_080E8CE0: .4byte gSaveBlock2
_080E8CE4: .4byte SpriteCallbackDummy
_080E8CE8: .4byte gSprites
	thumb_func_end sub_80E8BF4

	thumb_func_start sub_80E8CEC
sub_80E8CEC: @ 80E8CEC
	push {lr}
	ldr r0, _080E8D24 @ =gUnknown_083DBD60
	bl LoadCompressedObjectPic
	ldr r0, _080E8D28 @ =gUnknown_083DBD68
	bl LoadSpritePalette
	ldr r0, _080E8D2C @ =gSpriteTemplate_83DBDE4
	movs r1, 0xE0
	movs r2, 0x58
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080E8D3C
	ldr r0, _080E8D30 @ =gUnknown_083DB694
	ldr r2, [r0]
	ldr r0, _080E8D34 @ =0x00009c74
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E8D38 @ =gSprites
	adds r0, r1
	str r0, [r2]
	b _080E8D48
	.align 2, 0
_080E8D24: .4byte gUnknown_083DBD60
_080E8D28: .4byte gUnknown_083DBD68
_080E8D2C: .4byte gSpriteTemplate_83DBDE4
_080E8D30: .4byte gUnknown_083DB694
_080E8D34: .4byte 0x00009c74
_080E8D38: .4byte gSprites
_080E8D3C:
	ldr r0, _080E8D4C @ =gUnknown_083DB694
	ldr r0, [r0]
	ldr r1, _080E8D50 @ =0x00009c74
	adds r0, r1
	movs r1, 0
	str r1, [r0]
_080E8D48:
	pop {r0}
	bx r0
	.align 2, 0
_080E8D4C: .4byte gUnknown_083DB694
_080E8D50: .4byte 0x00009c74
	thumb_func_end sub_80E8CEC

	thumb_func_start sub_80E8D54
sub_80E8D54: @ 80E8D54
	push {lr}
	ldr r0, _080E8D78 @ =gUnknown_083DB694
	ldr r2, [r0]
	ldr r1, _080E8D7C @ =0x00009c74
	adds r0, r2, r1
	ldr r1, [r0]
	cmp r1, 0
	beq _080E8D88
	adds r0, r2, 0
	adds r0, 0x26
	ldrb r0, [r0]
	cmp r0, 0
	bne _080E8D80
	adds r0, r1, 0
	movs r1, 0x1
	bl StartSpriteAnim
	b _080E8D88
	.align 2, 0
_080E8D78: .4byte gUnknown_083DB694
_080E8D7C: .4byte 0x00009c74
_080E8D80:
	adds r0, r1, 0
	movs r1, 0x2
	bl StartSpriteAnim
_080E8D88:
	pop {r0}
	bx r0
	thumb_func_end sub_80E8D54

	thumb_func_start sub_80E8D8C
sub_80E8D8C: @ 80E8D8C
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _080E8DB8 @ =gUnknown_083DB694
	ldr r2, [r0]
	ldr r1, _080E8DBC @ =0x00009c74
	adds r0, r2, r1
	ldr r1, [r0]
	cmp r1, 0
	beq _080E8DD2
	cmp r3, 0
	beq _080E8DCA
	adds r0, r2, 0
	adds r0, 0x26
	ldrb r0, [r0]
	cmp r0, 0
	bne _080E8DC0
	adds r0, r1, 0
	movs r1, 0x3
	bl StartSpriteAnim
	b _080E8DD2
	.align 2, 0
_080E8DB8: .4byte gUnknown_083DB694
_080E8DBC: .4byte 0x00009c74
_080E8DC0:
	adds r0, r1, 0
	movs r1, 0x4
	bl StartSpriteAnim
	b _080E8DD2
_080E8DCA:
	adds r0, r1, 0
	movs r1, 0x5
	bl StartSpriteAnim
_080E8DD2:
	pop {r0}
	bx r0
	thumb_func_end sub_80E8D8C

	thumb_func_start sub_80E8DD8
sub_80E8DD8: @ 80E8DD8
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x8
	ldr r0, _080E8F2C @ =REG_BG0HOFS
	movs r6, 0
	strh r6, [r0]
	adds r0, 0x2
	strh r6, [r0]
	adds r0, 0x2
	strh r6, [r0]
	adds r0, 0x2
	strh r6, [r0]
	adds r0, 0x4
	strh r6, [r0]
	subs r0, 0x2
	strh r6, [r0]
	adds r0, 0x4
	strh r6, [r0]
	adds r0, 0x2
	strh r6, [r0]
	ldr r1, _080E8F30 @ =REG_BG0CNT
	movs r2, 0x8B
	lsls r2, 8
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080E8F34 @ =0x00000d09
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080E8F38 @ =gUnknown_08E945D0
	ldr r1, _080E8F3C @ =gUnknown_083DB694
	ldr r1, [r1]
	mov r8, r1
	movs r4, 0xE4
	lsls r4, 1
	add r4, r8
	movs r5, 0xA0
	lsls r5, 2
	adds r1, r4, 0
	adds r2, r5, 0
	bl CpuSet
	ldr r0, _080E8F40 @ =gUnknown_08E953D0
	movs r1, 0xD9
	lsls r1, 3
	add r1, r8
	bl LZ77UnCompWram
	ldr r0, _080E8F44 @ =gMenuWordGroupFrame_Gfx
	ldr r1, _080E8F48 @ =0x06008000
	bl LZ77UnCompVram
	ldr r1, _080E8F4C @ =0x06006800
	adds r0, r4, 0
	adds r2, r5, 0
	bl CpuSet
	ldr r0, _080E8F50 @ =gMenuWordGroupFrame1_Pal
	movs r1, 0x40
	movs r2, 0x40
	bl LoadPalette
	ldr r1, _080E8F54 @ =REG_BG2CNT
	ldr r2, _080E8F58 @ =0x00000e02
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _080E8F5C @ =0x06007000
	movs r5, 0x80
	lsls r5, 4
	mov r0, sp
	strh r6, [r0]
	ldr r4, _080E8F60 @ =0x040000d4
	str r0, [r4]
	str r1, [r4, 0x4]
	lsrs r0, r5, 1
	movs r2, 0x81
	lsls r2, 24
	orrs r0, r2
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	ldr r0, _080E8F64 @ =gUnknown_08E9AB00
	ldr r2, _080E8F68 @ =0x06006000
	str r0, [r4]
	str r2, [r4, 0x4]
	ldr r0, _080E8F6C @ =0x80000020
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	ldr r0, _080E8F70 @ =gUnknown_08E9AB60
	bl LZ77UnCompVram
	ldr r0, _080E8F74 @ =gUnknown_08E9AB40
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _080E8F78 @ =gUnknown_083DBDFC
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _080E8F7C @ =REG_BG3CNT
	ldr r2, _080E8F80 @ =0x00000f0f
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _080E8F84 @ =0x06007800
	movs r0, 0
	mov r9, r0
	str r0, [sp, 0x4]
	add r0, sp, 0x4
	str r0, [r4]
	str r1, [r4, 0x4]
	lsrs r5, 2
	movs r0, 0x85
	lsls r0, 24
	orrs r5, r0
	str r5, [r4, 0x8]
	ldr r0, [r4, 0x8]
	ldr r0, _080E8F88 @ =gUnknown_083DBE40
	movs r1, 0x20
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _080E8F8C @ =gPlttBufferUnfaded
	adds r1, r0, 0
	adds r1, 0x7E
	ldr r3, _080E8F90 @ =0x00007fff
	strh r3, [r1]
	subs r1, 0x1C
	ldr r2, _080E8F94 @ =0x00006f5b
	strh r2, [r1]
	adds r0, 0x70
	ldr r1, _080E8F98 @ =0x0000739c
	strh r1, [r0]
	ldr r0, _080E8F9C @ =gPlttBufferFaded
	adds r4, r0, 0
	adds r4, 0x7E
	strh r3, [r4]
	adds r3, r0, 0
	adds r3, 0x62
	strh r2, [r3]
	adds r0, 0x70
	strh r1, [r0]
	movs r1, 0xBC
	add r8, r1
	mov r2, r8
	strb r6, [r2]
	bl sub_80E8FA4
	bl sub_80E948C
	movs r0, 0xA
	bl sub_80E9198
	movs r0, 0
	bl sub_80E91D4
	bl sub_80E95A4
	ldr r0, _080E8FA0 @ =REG_BLDCNT
	mov r1, r9
	strh r1, [r0]
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E8F2C: .4byte REG_BG0HOFS
_080E8F30: .4byte REG_BG0CNT
_080E8F34: .4byte 0x00000d09
_080E8F38: .4byte gUnknown_08E945D0
_080E8F3C: .4byte gUnknown_083DB694
_080E8F40: .4byte gUnknown_08E953D0
_080E8F44: .4byte gMenuWordGroupFrame_Gfx
_080E8F48: .4byte 0x06008000
_080E8F4C: .4byte 0x06006800
_080E8F50: .4byte gMenuWordGroupFrame1_Pal
_080E8F54: .4byte REG_BG2CNT
_080E8F58: .4byte 0x00000e02
_080E8F5C: .4byte 0x06007000
_080E8F60: .4byte 0x040000d4
_080E8F64: .4byte gUnknown_08E9AB00
_080E8F68: .4byte 0x06006000
_080E8F6C: .4byte 0x80000020
_080E8F70: .4byte gUnknown_08E9AB60
_080E8F74: .4byte gUnknown_08E9AB40
_080E8F78: .4byte gUnknown_083DBDFC
_080E8F7C: .4byte REG_BG3CNT
_080E8F80: .4byte 0x00000f0f
_080E8F84: .4byte 0x06007800
_080E8F88: .4byte gUnknown_083DBE40
_080E8F8C: .4byte gPlttBufferUnfaded
_080E8F90: .4byte 0x00007fff
_080E8F94: .4byte 0x00006f5b
_080E8F98: .4byte 0x0000739c
_080E8F9C: .4byte gPlttBufferFaded
_080E8FA0: .4byte REG_BLDCNT
	thumb_func_end sub_80E8DD8

	thumb_func_start sub_80E8FA4
sub_80E8FA4: @ 80E8FA4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	movs r0, 0
	mov r9, r0
	mov r1, sp
	adds r1, 0x18
	str r1, [sp, 0x24]
	add r2, sp, 0xC
	mov r12, r2
_080E8FBE:
	mov r3, r9
	lsls r1, r3, 1
	ldr r4, _080E90F4 @ =gMenuWordGroupFrame2_Pal + 0x2
	adds r0, r1, r4
	ldrh r2, [r0]
	movs r0, 0x1F
	ands r0, r2
	lsls r0, 8
	str r0, [sp]
	ldr r5, _080E90F8 @ =gMenuWordGroupFrame2_Pal + 0x8
	adds r1, r5
	ldrh r1, [r1]
	movs r0, 0x1F
	ands r0, r1
	lsls r0, 8
	str r0, [sp, 0xC]
	lsls r2, 16
	lsrs r0, r2, 21
	movs r3, 0x1F
	ands r0, r3
	lsls r0, 8
	str r0, [sp, 0x4]
	lsls r1, 16
	lsrs r0, r1, 21
	ands r0, r3
	lsls r0, 8
	mov r4, r12
	str r0, [r4, 0x4]
	lsrs r2, 26
	ands r2, r3
	lsls r2, 8
	str r2, [sp, 0x8]
	lsrs r1, 26
	ands r1, r3
	lsls r1, 8
	str r1, [r4, 0x8]
	movs r3, 0
	mov r5, r9
	lsls r5, 3
	mov r10, r5
	mov r0, r9
	adds r0, 0x1
	str r0, [sp, 0x28]
	ldr r4, [sp, 0x24]
_080E9016:
	lsls r0, r3, 2
	adds r2, r4, r0
	mov r5, r12
	adds r1, r5, r0
	add r0, sp
	ldr r1, [r1]
	ldr r0, [r0]
	subs r0, r1, r0
	cmp r0, 0
	bge _080E902C
	adds r0, 0x7
_080E902C:
	asrs r0, 3
	str r0, [r2]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x2
	bls _080E9016
	movs r4, 0
	ldr r0, _080E90FC @ =gUnknown_083DB694
	ldr r1, [r0]
	mov r0, r10
	add r0, r9
	lsls r0, 1
	mov r8, r0
	movs r5, 0x1F
	ldr r6, [sp, 0x24]
	ldr r0, _080E9100 @ =0x00009c34
	adds r7, r1, r0
_080E9050:
	lsls r2, r4, 1
	add r2, r8
	adds r2, r7, r2
	ldr r1, [sp, 0x8]
	asrs r1, 8
	ands r1, r5
	lsls r1, 10
	ldr r0, [sp, 0x4]
	asrs r0, 8
	ands r0, r5
	lsls r0, 5
	orrs r1, r0
	ldr r0, [sp]
	asrs r0, 8
	ands r0, r5
	orrs r1, r0
	strh r1, [r2]
	movs r3, 0
	adds r4, 0x1
_080E9076:
	lsls r0, r3, 2
	mov r1, sp
	adds r2, r1, r0
	adds r0, r6, r0
	ldr r1, [r2]
	ldr r0, [r0]
	adds r1, r0
	str r1, [r2]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x2
	bls _080E9076
	lsls r0, r4, 16
	lsrs r4, r0, 16
	cmp r4, 0x7
	bls _080E9050
	ldr r2, _080E90FC @ =gUnknown_083DB694
	ldr r3, [r2]
	mov r0, r10
	add r0, r9
	adds r0, r4
	lsls r0, 1
	ldr r4, _080E9100 @ =0x00009c34
	adds r2, r3, r4
	adds r2, r0
	mov r5, r12
	ldr r1, [r5, 0x8]
	asrs r1, 8
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 10
	ldr r0, [r5, 0x4]
	asrs r0, 8
	movs r4, 0x1F
	ands r0, r4
	lsls r0, 5
	orrs r1, r0
	ldr r0, [sp, 0xC]
	asrs r0, 8
	ands r0, r4
	orrs r1, r0
	strh r1, [r2]
	ldr r5, [sp, 0x28]
	lsls r0, r5, 16
	lsrs r0, 16
	mov r9, r0
	cmp r0, 0x2
	bhi _080E90DA
	b _080E8FBE
_080E90DA:
	ldr r0, _080E9104 @ =0x00009c32
	adds r1, r3, r0
	movs r0, 0
	strb r0, [r1]
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E90F4: .4byte gMenuWordGroupFrame2_Pal + 0x2
_080E90F8: .4byte gMenuWordGroupFrame2_Pal + 0x8
_080E90FC: .4byte gUnknown_083DB694
_080E9100: .4byte 0x00009c34
_080E9104: .4byte 0x00009c32
	thumb_func_end sub_80E8FA4

	thumb_func_start sub_80E9108
sub_80E9108: @ 80E9108
	push {r4-r7,lr}
	lsls r0, 24
	ldr r1, _080E9164 @ =gUnknown_083DB694
	ldr r2, [r1]
	ldr r3, _080E9168 @ =0x00009c32
	adds r1, r2, r3
	lsrs r0, 24
	ldrb r3, [r1]
	adds r0, r3
	strb r0, [r1]
	movs r4, 0
	ldr r0, _080E916C @ =gPlttBufferUnfaded
	mov r12, r0
	adds r6, r1, 0
	ldr r3, _080E9170 @ =0x00009c34
	adds r5, r2, r3
	ldr r7, _080E9174 @ =gPlttBufferFaded
_080E912A:
	adds r2, r4, 0
	adds r2, 0x51
	lsls r2, 1
	mov r0, r12
	adds r3, r2, r0
	ldrb r0, [r6]
	lsls r0, 1
	lsls r1, r4, 3
	adds r1, r4
	lsls r1, 1
	adds r0, r1
	adds r0, r5, r0
	ldrh r0, [r0]
	strh r0, [r3]
	adds r2, r7
	ldrb r0, [r6]
	lsls r0, 1
	adds r0, r1
	adds r0, r5, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x2
	bls _080E912A
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E9164: .4byte gUnknown_083DB694
_080E9168: .4byte 0x00009c32
_080E916C: .4byte gPlttBufferUnfaded
_080E9170: .4byte 0x00009c34
_080E9174: .4byte gPlttBufferFaded
	thumb_func_end sub_80E9108

	thumb_func_start sub_80E9178
sub_80E9178: @ 80E9178
	push {lr}
	ldr r0, _080E9190 @ =gUnknown_083DB694
	ldr r0, [r0]
	ldr r1, _080E9194 @ =0x00009c32
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	movs r0, 0
	bl sub_80E9108
	pop {r0}
	bx r0
	.align 2, 0
_080E9190: .4byte gUnknown_083DB694
_080E9194: .4byte 0x00009c32
	thumb_func_end sub_80E9178

	thumb_func_start sub_80E9198
sub_80E9198: @ 80E9198
	ldr r1, _080E91A0 @ =gUnknown_03000740
	strb r0, [r1]
	bx lr
	.align 2, 0
_080E91A0: .4byte gUnknown_03000740
	thumb_func_end sub_80E9198

	thumb_func_start sub_80E91A4
sub_80E91A4: @ 80E91A4
	ldr r0, _080E91AC @ =gUnknown_03000740
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080E91AC: .4byte gUnknown_03000740
	thumb_func_end sub_80E91A4

	thumb_func_start sub_80E91B0
sub_80E91B0: @ 80E91B0
	push {lr}
	sub sp, 0x8
	lsls r2, 24
	lsls r1, 27
	lsrs r1, 24
	lsrs r2, 21
	lsls r3, 27
	lsrs r3, 24
	str r3, [sp]
	movs r3, 0x1
	str r3, [sp, 0x4]
	movs r3, 0xB0
	bl sub_8072AB0
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_80E91B0

	thumb_func_start sub_80E91D4
sub_80E91D4: @ 80E91D4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r0, _080E91FC @ =gWindowConfig_81E6DA8
	bl BasicInitMenuWindow
	cmp r4, 0xA
	bne _080E9200
	movs r0, 0x3
	movs r1, 0xE
	movs r2, 0x1A
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0xA
	bl sub_80E9198
	b _080E935C
	.align 2, 0
_080E91FC: .4byte gWindowConfig_81E6DA8
_080E9200:
	bl sub_80E91A4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA
	bne _080E9218
	movs r0, 0x3
	movs r1, 0xE
	movs r2, 0x1A
	movs r3, 0x13
	bl MenuDrawTextWindow
_080E9218:
	adds r0, r4, 0
	bl sub_80E9198
	cmp r4, 0x9
	bls _080E9224
	b _080E935C
_080E9224:
	lsls r0, r4, 2
	ldr r1, _080E9230 @ =_080E9234
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E9230: .4byte _080E9234
	.align 2, 0
_080E9234:
	.4byte _080E925C
	.4byte _080E9284
	.4byte _080E92AC
	.4byte _080E92C4
	.4byte _080E92F0
	.4byte _080E9308
	.4byte _080E9310
	.4byte _080E9318
	.4byte _080E933C
	.4byte _080E9350
_080E925C:
	ldr r0, _080E9278 @ =gUnknown_083DB694
	ldr r4, [r0]
	ldr r1, _080E927C @ =0x00009c80
	adds r0, r4, r1
	movs r1, 0x4
	movs r2, 0xF
	movs r3, 0x2
	bl sub_80E91B0
	ldr r0, _080E9280 @ =0x00009cc9
	adds r4, r0
	adds r0, r4, 0
	b _080E9326
	.align 2, 0
_080E9278: .4byte gUnknown_083DB694
_080E927C: .4byte 0x00009c80
_080E9280: .4byte 0x00009cc9
_080E9284:
	ldr r0, _080E92A0 @ =gUnknown_083DB694
	ldr r4, [r0]
	ldr r1, _080E92A4 @ =0x00009d12
	adds r0, r4, r1
	movs r1, 0x4
	movs r2, 0xF
	movs r3, 0x2
	bl sub_80E91B0
	ldr r0, _080E92A8 @ =0x00009d5b
	adds r4, r0
	adds r0, r4, 0
	b _080E9326
	.align 2, 0
_080E92A0: .4byte gUnknown_083DB694
_080E92A4: .4byte 0x00009d12
_080E92A8: .4byte 0x00009d5b
_080E92AC:
	ldr r0, _080E92BC @ =gOtherText_TextDeletedConfirmPage1
	movs r1, 0x4
	movs r2, 0xF
	movs r3, 0x2
	bl sub_80E91B0
	ldr r0, _080E92C0 @ =gOtherText_TextDeletedConfirmPage2
	b _080E9326
	.align 2, 0
_080E92BC: .4byte gOtherText_TextDeletedConfirmPage1
_080E92C0: .4byte gOtherText_TextDeletedConfirmPage2
_080E92C4:
	ldr r0, _080E92D8 @ =gUnknown_083DB694
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	cmp r0, 0x4
	beq _080E92E0
	cmp r0, 0x9
	bne _080E92E8
	ldr r0, _080E92DC @ =gOtherText_QuitGivingInfo
	b _080E933E
	.align 2, 0
_080E92D8: .4byte gUnknown_083DB694
_080E92DC: .4byte gOtherText_QuitGivingInfo
_080E92E0:
	ldr r0, _080E92E4 @ =gOtherText_StopGivingMail
	b _080E933E
	.align 2, 0
_080E92E4: .4byte gOtherText_StopGivingMail
_080E92E8:
	ldr r0, _080E92EC @ =gOtherText_QuitEditing
	b _080E933E
	.align 2, 0
_080E92EC: .4byte gOtherText_QuitEditing
_080E92F0:
	ldr r0, _080E9300 @ =gOtherText_EditedTextNoSavePage1
	movs r1, 0x4
	movs r2, 0xF
	movs r3, 0x2
	bl sub_80E91B0
	ldr r0, _080E9304 @ =gOtherText_EditedTextNoSavePage2
	b _080E9326
	.align 2, 0
_080E9300: .4byte gOtherText_EditedTextNoSavePage1
_080E9304: .4byte gOtherText_EditedTextNoSavePage2
_080E9308:
	ldr r0, _080E930C @ =gOtherText_EnterAPhraseOrWord
	b _080E933E
	.align 2, 0
_080E930C: .4byte gOtherText_EnterAPhraseOrWord
_080E9310:
	ldr r0, _080E9314 @ =gOtherText_TextNoDelete
	b _080E933E
	.align 2, 0
_080E9314: .4byte gOtherText_TextNoDelete
_080E9318:
	ldr r0, _080E9334 @ =gOtherText_OnlyOnePhrase
	movs r1, 0x4
	movs r2, 0xF
	movs r3, 0x2
	bl sub_80E91B0
	ldr r0, _080E9338 @ =gOtherText_OriginalSongRestored
_080E9326:
	movs r1, 0x4
	movs r2, 0x11
	movs r3, 0x2
	bl sub_80E91B0
	b _080E935C
	.align 2, 0
_080E9334: .4byte gOtherText_OnlyOnePhrase
_080E9338: .4byte gOtherText_OriginalSongRestored
_080E933C:
	ldr r0, _080E934C @ =gOtherText_TrendyAlready
_080E933E:
	movs r1, 0x4
	movs r2, 0xF
	movs r3, 0x4
	bl sub_80E91B0
	b _080E935C
	.align 2, 0
_080E934C: .4byte gOtherText_TrendyAlready
_080E9350:
	ldr r0, _080E9364 @ =gOtherText_CombineTwoPhrases
	movs r1, 0x4
	movs r2, 0xF
	movs r3, 0x4
	bl sub_80E91B0
_080E935C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E9364: .4byte gOtherText_CombineTwoPhrases
	thumb_func_end sub_80E91D4

	thumb_func_start sub_80E9368
sub_80E9368: @ 80E9368
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD
	bhi _080E93F8
	lsls r0, 2
	ldr r1, _080E937C @ =_080E9380
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E937C: .4byte _080E9380
	.align 2, 0
_080E9380:
	.4byte _080E93B8
	.4byte _080E93C0
	.4byte _080E93C8
	.4byte _080E93D0
	.4byte _080E93F8
	.4byte _080E93E8
	.4byte _080E93D8
	.4byte _080E93E8
	.4byte _080E93E8
	.4byte _080E93E0
	.4byte _080E93E8
	.4byte _080E93E8
	.4byte _080E93E8
	.4byte _080E93F0
_080E93B8:
	ldr r4, _080E93BC @ =gOtherText_Profile
	b _080E93FA
	.align 2, 0
_080E93BC: .4byte gOtherText_Profile
_080E93C0:
	ldr r4, _080E93C4 @ =gOtherText_AtBattleStart
	b _080E93FA
	.align 2, 0
_080E93C4: .4byte gOtherText_AtBattleStart
_080E93C8:
	ldr r4, _080E93CC @ =gOtherText_UponWinningBattle
	b _080E93FA
	.align 2, 0
_080E93CC: .4byte gOtherText_UponWinningBattle
_080E93D0:
	ldr r4, _080E93D4 @ =gOtherText_UponLosingBattle
	b _080E93FA
	.align 2, 0
_080E93D4: .4byte gOtherText_UponLosingBattle
_080E93D8:
	ldr r4, _080E93DC @ =gOtherText_TheBardsSong
	b _080E93FA
	.align 2, 0
_080E93DC: .4byte gOtherText_TheBardsSong
_080E93E0:
	ldr r4, _080E93E4 @ =gOtherText_WhatsHipHappening
	b _080E93FA
	.align 2, 0
_080E93E4: .4byte gOtherText_WhatsHipHappening
_080E93E8:
	ldr r4, _080E93EC @ =gOtherText_Interview
	b _080E93FA
	.align 2, 0
_080E93EC: .4byte gOtherText_Interview
_080E93F0:
	ldr r4, _080E93F4 @ =gOtherText_GoodSaying
	b _080E93FA
	.align 2, 0
_080E93F4: .4byte gOtherText_GoodSaying
_080E93F8:
	movs r4, 0
_080E93FA:
	ldr r0, _080E943C @ =gWindowConfig_81E6D8C
	bl BasicInitMenuWindow
	ldr r0, _080E9440 @ =gUnknown_083DB694
	ldr r2, [r0]
	ldr r0, _080E9444 @ =0x00009f8e
	adds r5, r2, r0
	movs r3, 0xFC
	strb r3, [r5]
	adds r0, 0x1
	adds r1, r2, r0
	movs r0, 0x5
	strb r0, [r1]
	ldr r0, _080E9448 @ =0x00009f90
	adds r1, r2, r0
	movs r0, 0x1
	strb r0, [r1]
	cmp r4, 0
	beq _080E9450
	ldr r1, _080E944C @ =0x00009f91
	adds r0, r2, r1
	adds r1, r4, 0
	movs r2, 0xF0
	movs r3, 0x2
	bl sub_8072C74
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl MenuPrint
	b _080E9476
	.align 2, 0
_080E943C: .4byte gWindowConfig_81E6D8C
_080E9440: .4byte gUnknown_083DB694
_080E9444: .4byte 0x00009f8e
_080E9448: .4byte 0x00009f90
_080E944C: .4byte 0x00009f91
_080E9450:
	ldr r0, _080E9484 @ =0x00009f91
	adds r1, r2, r0
	strb r3, [r1]
	movs r0, 0x11
	strb r0, [r1, 0x1]
	movs r0, 0x10
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl MenuPrint
	adds r0, r5, 0
	movs r1, 0x1C
	movs r2, 0
	bl MenuPrint
_080E9476:
	ldr r0, _080E9488 @ =gWindowConfig_81E6DA8
	bl BasicInitMenuWindow
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E9484: .4byte 0x00009f91
_080E9488: .4byte gWindowConfig_81E6DA8
	thumb_func_end sub_80E9368

	thumb_func_start sub_80E948C
sub_80E948C: @ 80E948C
	push {lr}
	sub sp, 0x10
	ldr r0, _080E94A8 @ =gUnknown_083DB694
	ldr r0, [r0]
	ldrb r0, [r0, 0x9]
	cmp r0, 0x5
	bls _080E949C
	b _080E9594
_080E949C:
	lsls r0, 2
	ldr r1, _080E94AC @ =_080E94B0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E94A8: .4byte gUnknown_083DB694
_080E94AC: .4byte _080E94B0
	.align 2, 0
_080E94B0:
	.4byte _080E9508
	.4byte _080E9530
	.4byte _080E9554
	.4byte _080E9578
	.4byte _080E94C8
	.4byte _080E94E8
_080E94C8:
	ldr r0, _080E94E0 @ =0x06006800
	ldr r3, _080E94E4 @ =gUnknown_08E94AD0
	movs r1, 0
	str r1, [sp]
	movs r1, 0x1A
	str r1, [sp, 0x4]
	movs r1, 0x18
	str r1, [sp, 0x8]
	movs r1, 0x6
	str r1, [sp, 0xC]
	movs r1, 0x3
	b _080E9568
	.align 2, 0
_080E94E0: .4byte 0x06006800
_080E94E4: .4byte gUnknown_08E94AD0
_080E94E8:
	ldr r0, _080E9500 @ =0x06006800
	ldr r3, _080E9504 @ =gUnknown_08E94AD0
	movs r1, 0
	str r1, [sp]
	movs r1, 0x12
	str r1, [sp, 0x4]
	movs r1, 0xD
	str r1, [sp, 0x8]
	movs r1, 0x8
	str r1, [sp, 0xC]
	movs r1, 0xE
	b _080E951E
	.align 2, 0
_080E9500: .4byte 0x06006800
_080E9504: .4byte gUnknown_08E94AD0
_080E9508:
	ldr r0, _080E9528 @ =0x06006800
	ldr r3, _080E952C @ =gUnknown_08E94AD0
	movs r1, 0
	str r1, [sp]
	movs r1, 0xA
	str r1, [sp, 0x4]
	movs r1, 0x1A
	str r1, [sp, 0x8]
	movs r1, 0x8
	str r1, [sp, 0xC]
	movs r1, 0x2
_080E951E:
	movs r2, 0x2
	bl sub_809D104
	b _080E9594
	.align 2, 0
_080E9528: .4byte 0x06006800
_080E952C: .4byte gUnknown_08E94AD0
_080E9530:
	ldr r0, _080E954C @ =0x06006800
	ldr r3, _080E9550 @ =gUnknown_08E94AD0
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r1, 0x1A
	str r1, [sp, 0x8]
	movs r1, 0xA
	str r1, [sp, 0xC]
	movs r1, 0x2
	movs r2, 0
	bl sub_809D104
	b _080E9594
	.align 2, 0
_080E954C: .4byte 0x06006800
_080E9550: .4byte gUnknown_08E94AD0
_080E9554:
	ldr r0, _080E9570 @ =0x06006800
	ldr r3, _080E9574 @ =gUnknown_08E94AD0
	movs r2, 0xD
	str r2, [sp]
	movs r1, 0x12
	str r1, [sp, 0x4]
	str r2, [sp, 0x8]
	movs r1, 0x4
	str r1, [sp, 0xC]
	movs r1, 0xE
_080E9568:
	movs r2, 0x3
	bl sub_809D104
	b _080E9594
	.align 2, 0
_080E9570: .4byte 0x06006800
_080E9574: .4byte gUnknown_08E94AD0
_080E9578:
	ldr r0, _080E959C @ =0x06006800
	ldr r3, _080E95A0 @ =gUnknown_08E94AD0
	movs r1, 0
	str r1, [sp]
	movs r1, 0x20
	str r1, [sp, 0x4]
	movs r1, 0x18
	str r1, [sp, 0x8]
	movs r1, 0x4
	str r1, [sp, 0xC]
	movs r1, 0x3
	movs r2, 0x2
	bl sub_809D104
_080E9594:
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_080E959C: .4byte 0x06006800
_080E95A0: .4byte gUnknown_08E94AD0
	thumb_func_end sub_80E948C

	thumb_func_start sub_80E95A4
sub_80E95A4: @ 80E95A4
	push {lr}
	ldr r0, _080E95C0 @ =gWindowConfig_81E6D8C
	bl BasicInitMenuWindow
	ldr r0, _080E95C4 @ =gUnknown_083DB694
	ldr r0, [r0]
	ldrb r0, [r0, 0x9]
	cmp r0, 0x5
	bhi _080E9612
	lsls r0, 2
	ldr r1, _080E95C8 @ =_080E95CC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E95C0: .4byte gWindowConfig_81E6D8C
_080E95C4: .4byte gUnknown_083DB694
_080E95C8: .4byte _080E95CC
	.align 2, 0
_080E95CC:
	.4byte _080E95F2
	.4byte _080E95F6
	.4byte _080E9600
	.4byte _080E960A
	.4byte _080E95E4
	.4byte _080E95EE
_080E95E4:
	movs r0, 0x4
	movs r1, 0x6
	bl sub_80E9620
	b _080E9612
_080E95EE:
	movs r0, 0x2
	b _080E9602
_080E95F2:
	movs r0, 0x3
	b _080E95F8
_080E95F6:
	movs r0, 0
_080E95F8:
	movs r1, 0x5
	bl sub_80E9620
	b _080E9612
_080E9600:
	movs r0, 0x4
_080E9602:
	movs r1, 0x11
	bl sub_80E9620
	b _080E9612
_080E960A:
	movs r0, 0x3
	movs r1, 0x6
	bl sub_80E9620
_080E9612:
	ldr r0, _080E961C @ =gWindowConfig_81E6DA8
	bl BasicInitMenuWindow
	pop {r0}
	bx r0
	.align 2, 0
_080E961C: .4byte gWindowConfig_81E6DA8
	thumb_func_end sub_80E95A4

	thumb_func_start sub_80E9620
sub_80E9620: @ 80E9620
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	lsls r0, 16
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp, 0x14]
	movs r1, 0
	mov r10, r1
	lsrs r7, r0, 16
	mov r9, r1
	ldr r0, _080E9644 @ =gUnknown_083DB694
	ldr r0, [r0]
	b _080E971A
	.align 2, 0
_080E9644: .4byte gUnknown_083DB694
_080E9648:
	ldr r6, [sp, 0x14]
	movs r2, 0
	mov r8, r2
	adds r0, r7, 0x2
	str r0, [sp, 0x1C]
	mov r1, r9
	adds r1, 0x1
	str r1, [sp, 0x18]
	b _080E96E4
_080E965A:
	mov r2, r10
	lsls r0, r2, 1
	adds r1, r5, 0
	adds r1, 0xC
	adds r1, r0
	ldrh r0, [r1]
	ldr r2, _080E9690 @ =0x0000ffff
	cmp r0, r2
	bne _080E969C
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r1, 0x9
	str r1, [sp, 0x8]
	movs r0, 0x2
	str r0, [sp, 0xC]
	str r1, [sp, 0x10]
	ldr r0, _080E9694 @ =0x06007000
	adds r1, r6, 0
	adds r2, r7, 0
	ldr r3, _080E9698 @ =gUnknown_083DBE1C
	bl sub_8095C8C
	adds r0, r6, 0
	adds r0, 0xB
	b _080E96CC
	.align 2, 0
_080E9690: .4byte 0x0000ffff
_080E9694: .4byte 0x06007000
_080E9698: .4byte gUnknown_083DBE1C
_080E969C:
	ldr r0, _080E9738 @ =0x00009e14
	adds r4, r5, r0
	ldrh r1, [r1]
	adds r0, r4, 0
	movs r2, 0xB
	bl sub_80EB218
	lsls r1, r6, 24
	lsrs r1, 24
	lsls r2, r7, 24
	lsrs r2, 24
	adds r0, r4, 0
	bl MenuPrint
	mov r1, r9
	lsls r0, r1, 1
	add r0, r8
	adds r1, r5, 0
	adds r1, 0x8C
	adds r1, r0
	adds r0, r6, 0
	adds r0, 0xB
	ldrb r1, [r1]
	adds r0, r1
_080E96CC:
	lsls r0, 16
	lsrs r6, r0, 16
	mov r0, r10
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	mov r0, r8
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
_080E96E4:
	ldr r0, _080E973C @ =gUnknown_083DB694
	ldr r5, [r0]
	adds r0, r5, 0
	adds r0, 0x83
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r8, r0
	bge _080E970A
	ldrb r2, [r5, 0xA]
	cmp r10, r2
	bcc _080E965A
	lsls r1, r6, 24
	lsrs r1, 24
	lsls r2, r7, 24
	lsrs r2, 24
	ldr r0, _080E9740 @ =gUnknown_083DBEA8
	bl MenuPrint
_080E970A:
	ldr r1, [sp, 0x1C]
	lsls r0, r1, 16
	lsrs r7, r0, 16
	ldr r2, [sp, 0x18]
	lsls r0, r2, 16
	lsrs r0, 16
	mov r9, r0
	adds r0, r5, 0
_080E971A:
	adds r0, 0x84
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r9, r0
	blt _080E9648
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E9738: .4byte 0x00009e14
_080E973C: .4byte gUnknown_083DB694
_080E9740: .4byte gUnknown_083DBEA8
	thumb_func_end sub_80E9620

	thumb_func_start sub_80E9744
sub_80E9744: @ 80E9744
	push {lr}
	ldr r0, _080E9760 @ =gWindowConfig_81E6D8C
	bl BasicInitMenuWindow
	ldr r0, _080E9764 @ =gUnknown_083DB694
	ldr r0, [r0]
	ldrb r0, [r0, 0x9]
	cmp r0, 0x5
	bhi _080E97B2
	lsls r0, 2
	ldr r1, _080E9768 @ =_080E976C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E9760: .4byte gWindowConfig_81E6D8C
_080E9764: .4byte gUnknown_083DB694
_080E9768: .4byte _080E976C
	.align 2, 0
_080E976C:
	.4byte _080E9792
	.4byte _080E9796
	.4byte _080E97A0
	.4byte _080E97AA
	.4byte _080E9784
	.4byte _080E978E
_080E9784:
	movs r0, 0x4
	movs r1, 0x6
	bl sub_80E97C0
	b _080E97B2
_080E978E:
	movs r0, 0x2
	b _080E97A2
_080E9792:
	movs r0, 0x3
	b _080E9798
_080E9796:
	movs r0, 0
_080E9798:
	movs r1, 0x5
	bl sub_80E97C0
	b _080E97B2
_080E97A0:
	movs r0, 0x4
_080E97A2:
	movs r1, 0x11
	bl sub_80E97C0
	b _080E97B2
_080E97AA:
	movs r0, 0x3
	movs r1, 0x6
	bl sub_80E97C0
_080E97B2:
	ldr r0, _080E97BC @ =gWindowConfig_81E6DA8
	bl BasicInitMenuWindow
	pop {r0}
	bx r0
	.align 2, 0
_080E97BC: .4byte gWindowConfig_81E6DA8
	thumb_func_end sub_80E9744

	thumb_func_start sub_80E97C0
sub_80E97C0: @ 80E97C0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r7, 0
	movs r3, 0
	ldr r1, _080E98B8 @ =gUnknown_083DB694
	ldr r0, [r1]
	adds r0, 0x84
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r3, r0
	bge _080E98A6
_080E97EA:
	ldr r1, [r1]
	ldr r0, _080E98BC @ =0x00009e6e
	adds r2, r1, r0
	movs r6, 0
	adds r0, r1, 0
	adds r0, 0x83
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldr r4, [sp]
	lsls r4, 24
	mov r8, r4
	lsls r4, r5, 24
	mov r9, r4
	adds r5, 0x2
	mov r10, r5
	adds r3, 0x1
	str r3, [sp, 0x4]
	cmp r6, r0
	bge _080E985E
	ldrb r1, [r1, 0xA]
	cmp r7, r1
	bcs _080E985E
	ldr r0, _080E98B8 @ =gUnknown_083DB694
	ldr r4, [r0]
	ldr r5, _080E98C0 @ =0x0000ffff
_080E981E:
	lsls r0, r7, 1
	adds r1, r4, 0
	adds r1, 0xC
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, r5
	beq _080E983E
	adds r1, r0, 0
	adds r0, r2, 0
	movs r2, 0
	bl sub_80EB218
	adds r2, r0, 0
	movs r0, 0
	strb r0, [r2]
	adds r2, 0x1
_080E983E:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r4, 0
	adds r0, 0x83
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r6, r0
	bge _080E985E
	ldrb r0, [r4, 0xA]
	cmp r7, r0
	bcc _080E981E
_080E985E:
	ldr r1, _080E98B8 @ =gUnknown_083DB694
	ldr r4, [r1]
	adds r0, r4, 0
	adds r0, 0x83
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0xB
	muls r1, r0
	movs r0, 0xFC
	strb r0, [r2]
	movs r0, 0x13
	strb r0, [r2, 0x1]
	lsls r1, 3
	strb r1, [r2, 0x2]
	movs r0, 0xFF
	strb r0, [r2, 0x3]
	ldr r2, _080E98BC @ =0x00009e6e
	adds r0, r4, r2
	mov r3, r8
	lsrs r1, r3, 24
	mov r3, r9
	lsrs r2, r3, 24
	bl MenuPrint
	mov r1, r10
	lsls r0, r1, 16
	lsrs r5, r0, 16
	ldr r2, [sp, 0x4]
	lsls r0, r2, 24
	lsrs r3, r0, 24
	ldr r1, _080E98B8 @ =gUnknown_083DB694
	adds r4, 0x84
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r3, r0
	blt _080E97EA
_080E98A6:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E98B8: .4byte gUnknown_083DB694
_080E98BC: .4byte 0x00009e6e
_080E98C0: .4byte 0x0000ffff
	thumb_func_end sub_80E97C0

	thumb_func_start sub_80E98C4
sub_80E98C4: @ 80E98C4
	push {lr}
	ldr r0, _080E98E0 @ =gWindowConfig_81E6D8C
	bl BasicInitMenuWindow
	ldr r0, _080E98E4 @ =gUnknown_083DB694
	ldr r0, [r0]
	ldrb r0, [r0, 0x9]
	cmp r0, 0x5
	bhi _080E9936
	lsls r0, 2
	ldr r1, _080E98E8 @ =_080E98EC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E98E0: .4byte gWindowConfig_81E6D8C
_080E98E4: .4byte gUnknown_083DB694
_080E98E8: .4byte _080E98EC
	.align 2, 0
_080E98EC:
	.4byte _080E990A
	.4byte _080E9910
	.4byte _080E9916
	.4byte _080E991A
	.4byte _080E9904
	.4byte _080E990A
_080E9904:
	movs r1, 0x4
	movs r3, 0x2
	b _080E991E
_080E990A:
	movs r1, 0x3
	movs r3, 0x2
	b _080E991E
_080E9910:
	movs r1, 0x1
	movs r3, 0x3
	b _080E991E
_080E9916:
	movs r1, 0x4
	b _080E991C
_080E991A:
	movs r1, 0x3
_080E991C:
	movs r3, 0x1
_080E991E:
	lsls r3, 1
	adds r3, r1, r3
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x2
	movs r2, 0x1B
	bl MenuFillWindowRectWithBlankTile
	ldr r0, _080E993C @ =gWindowConfig_81E6DA8
	bl BasicInitMenuWindow
_080E9936:
	pop {r0}
	bx r0
	.align 2, 0
_080E993C: .4byte gWindowConfig_81E6DA8
	thumb_func_end sub_80E98C4

	thumb_func_start sub_80E9940
sub_80E9940: @ 80E9940
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r5, r1, 24
	lsrs r5, 24
	movs r4, 0x7
	ands r4, r5
	lsls r3, r4, 1
	adds r1, r3, 0
	adds r3, 0x1
	movs r0, 0x2
	movs r2, 0x1F
	bl MenuFillWindowRectWithBlankTile
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_80E9A7C
	lsls r4, 1
	adds r0, r6, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl sub_80E9A60
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80E9940

	thumb_func_start sub_80E9974
sub_80E9974: @ 80E9974
	push {r4-r6,lr}
	ldr r0, _080E99C4 @ =gWindowConfig_81E6D54
	bl BasicInitMenuWindow
	ldr r0, _080E99C8 @ =gUnknown_083DB694
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x26
	ldrb r0, [r0]
	cmp r0, 0
	bne _080E99D4
	ldr r1, _080E99CC @ =0x000001b5
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r1, r0, 16
	lsrs r4, r1, 16
	adds r0, 0x4
	cmp r4, r0
	bge _080E9A08
	adds r5, r2, 0
	ldr r2, _080E99CC @ =0x000001b5
	adds r6, r5, r2
_080E99A4:
	lsls r1, r4, 24
	lsrs r1, 24
	ldr r2, _080E99D0 @ =0x00009dc9
	adds r0, r5, r2
	bl sub_80E9940
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0
	ldrsb r0, [r6, r0]
	adds r0, 0x4
	cmp r4, r0
	blt _080E99A4
	b _080E9A08
	.align 2, 0
_080E99C4: .4byte gWindowConfig_81E6D54
_080E99C8: .4byte gUnknown_083DB694
_080E99CC: .4byte 0x000001b5
_080E99D0: .4byte 0x00009dc9
_080E99D4:
	bl sub_80E9AD4
	ldr r4, _080E9A10 @ =gUnknown_083DBEAC
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0
	bl sub_80E9A60
	adds r0, r4, 0
	adds r0, 0x20
	movs r1, 0x2
	movs r2, 0x2
	bl sub_80E9A60
	adds r0, r4, 0
	adds r0, 0x40
	movs r1, 0x2
	movs r2, 0x4
	bl sub_80E9A60
	adds r4, 0x60
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0x6
	bl sub_80E9A60
_080E9A08:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E9A10: .4byte gUnknown_083DBEAC
	thumb_func_end sub_80E9974

	thumb_func_start sub_80E9A14
sub_80E9A14: @ 80E9A14
	push {lr}
	bl sub_80E9A4C
	ldr r0, _080E9A44 @ =gUnknown_083DB694
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x26
	ldrb r0, [r0]
	cmp r0, 0
	bne _080E9A40
	movs r0, 0xDD
	lsls r0, 1
	adds r2, r1, r0
	ldr r3, _080E9A48 @ =0x000001b5
	adds r0, r1, r3
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 4
	ldrh r1, [r2]
	adds r0, r1
	strh r0, [r2]
_080E9A40:
	pop {r0}
	bx r0
	.align 2, 0
_080E9A44: .4byte gUnknown_083DB694
_080E9A48: .4byte 0x000001b5
	thumb_func_end sub_80E9A14

	thumb_func_start sub_80E9A4C
sub_80E9A4C: @ 80E9A4C
	ldr r0, _080E9A5C @ =gUnknown_083DB694
	ldr r0, [r0]
	movs r2, 0xDD
	lsls r2, 1
	adds r1, r0, r2
	movs r0, 0
	strh r0, [r1]
	bx lr
	.align 2, 0
_080E9A5C: .4byte gUnknown_083DB694
	thumb_func_end sub_80E9A4C

	thumb_func_start sub_80E9A60
sub_80E9A60: @ 80E9A60
	push {lr}
	lsls r2, 16
	movs r3, 0xF0
	lsls r3, 12
	ands r3, r2
	lsls r1, 24
	lsrs r1, 24
	lsrs r3, 16
	adds r2, r3, 0
	bl MenuPrint
	pop {r0}
	bx r0
	thumb_func_end sub_80E9A60

	thumb_func_start sub_80E9A7C
sub_80E9A7C: @ 80E9A7C
	push {r4-r7,lr}
	adds r2, r0, 0
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r0, r7, 17
	lsrs r5, r0, 16
	movs r4, 0
	ldr r0, _080E9AD0 @ =gUnknown_083DB694
	ldr r6, [r0]
_080E9A8E:
	movs r0, 0xFC
	strb r0, [r2]
	movs r0, 0x12
	strb r0, [r2, 0x1]
	movs r0, 0x58
	muls r0, r4
	strb r0, [r2, 0x2]
	adds r2, 0x3
	lsls r1, r7, 1
	adds r1, r4, r1
	adds r0, r6, 0
	adds r0, 0x2A
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r2, 0
	movs r2, 0xB
	bl sub_80EAD64
	adds r2, r0, 0
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r6, 0x28]
	cmp r5, r0
	bcs _080E9ACA
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _080E9A8E
_080E9ACA:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E9AD0: .4byte gUnknown_083DB694
	thumb_func_end sub_80E9A7C

	thumb_func_start sub_80E9AD4
sub_80E9AD4: @ 80E9AD4
	push {r4,lr}
	ldr r0, _080E9AF4 @ =gWindowConfig_81E6D54
	bl BasicInitMenuWindow
	movs r4, 0
_080E9ADE:
	adds r0, r4, 0
	bl sub_80E9C74
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xF
	bls _080E9ADE
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E9AF4: .4byte gWindowConfig_81E6D54
	thumb_func_end sub_80E9AD4

	thumb_func_start sub_80E9AF8
sub_80E9AF8: @ 80E9AF8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r7, 0
	bl sub_80E9C74
	ldr r4, _080E9B7C @ =gUnknown_083DB694
	ldr r5, [r4]
	ldr r0, _080E9B80 @ =0x00009e14
	adds r0, r5
	mov r8, r0
	movs r0, 0xFC
	mov r1, r8
	strb r0, [r1]
	movs r0, 0x11
	strb r0, [r1, 0x1]
	movs r0, 0x10
	strb r0, [r1, 0x2]
	ldr r2, _080E9B84 @ =0x00009e17
	adds r2, r5
	mov r8, r2
	adds r0, r5, 0
	adds r0, 0x7D
	ldrb r0, [r0]
	cmp r0, 0
	beq _080E9BF4
	movs r6, 0
	ldr r3, _080E9B88 @ =0x000099a6
	adds r0, r5, r3
	adds r0, r7
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r6, r0
	blt _080E9B4A
	b _080E9C52
_080E9B4A:
	lsls r0, r7, 2
	mov r9, r0
	ldr r1, _080E9B8C @ =0x00009a2a
	adds r1, r5, r1
	str r1, [sp]
	lsls r2, r7, 17
	mov r10, r2
_080E9B58:
	lsls r4, r6, 1
	mov r3, r9
	adds r0, r4, r3
	ldr r1, [sp]
	adds r0, r1, r0
	ldrh r0, [r0]
	bl sub_80EB2D4
	lsls r0, 16
	lsrs r0, 16
	adds r5, r4, 0
	cmp r0, 0x7
	bne _080E9B94
	ldr r0, _080E9B90 @ =gWindowConfig_81E6D70
	bl BasicInitMenuWindow
	b _080E9B9A
	.align 2, 0
_080E9B7C: .4byte gUnknown_083DB694
_080E9B80: .4byte 0x00009e14
_080E9B84: .4byte 0x00009e17
_080E9B88: .4byte 0x000099a6
_080E9B8C: .4byte 0x00009a2a
_080E9B90: .4byte gWindowConfig_81E6D70
_080E9B94:
	ldr r0, _080E9BE0 @ =gWindowConfig_81E6D54
	bl BasicInitMenuWindow
_080E9B9A:
	ldr r2, _080E9BE4 @ =gUnknown_083DB694
	ldr r4, [r2]
	mov r3, r9
	adds r1, r5, r3
	ldr r2, _080E9BE8 @ =0x00009a2a
	adds r0, r4, r2
	adds r0, r1
	ldrh r1, [r0]
	mov r0, r8
	movs r2, 0x9
	bl sub_80EB218
	ldr r3, _080E9BEC @ =0x00009e14
	adds r0, r4, r3
	movs r1, 0xB
	muls r1, r6
	adds r1, 0x4
	lsls r1, 16
	lsrs r1, 16
	mov r3, r10
	lsrs r2, r3, 16
	bl sub_80E9A60
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _080E9BF0 @ =0x000099a6
	adds r4, r0
	adds r4, r7
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r6, r0
	blt _080E9B58
	b _080E9C52
	.align 2, 0
_080E9BE0: .4byte gWindowConfig_81E6D54
_080E9BE4: .4byte gUnknown_083DB694
_080E9BE8: .4byte 0x00009a2a
_080E9BEC: .4byte 0x00009e14
_080E9BF0: .4byte 0x000099a6
_080E9BF4:
	ldr r0, _080E9C64 @ =gWindowConfig_81E6D54
	bl BasicInitMenuWindow
	movs r6, 0
	ldr r1, _080E9C68 @ =0x000099a6
	adds r0, r5, r1
	adds r0, r7
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r6, r0
	bge _080E9C52
	adds r4, r5, 0
	adds r0, r4, r1
	adds r0, r7
	mov r9, r0
	lsls r5, r7, 17
_080E9C16:
	lsls r1, r6, 1
	lsls r0, r7, 2
	adds r1, r0
	ldr r2, _080E9C6C @ =0x00009a2a
	adds r0, r4, r2
	adds r0, r1
	ldrh r1, [r0]
	mov r0, r8
	movs r2, 0x9
	bl sub_80EB218
	movs r0, 0xB
	adds r1, r6, 0
	muls r1, r0
	adds r1, 0x4
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _080E9C70 @ =0x00009e14
	adds r0, r4, r3
	lsrs r2, r5, 16
	bl sub_80E9A60
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	mov r1, r9
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r6, r0
	blt _080E9C16
_080E9C52:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E9C64: .4byte gWindowConfig_81E6D54
_080E9C68: .4byte 0x000099a6
_080E9C6C: .4byte 0x00009a2a
_080E9C70: .4byte 0x00009e14
	thumb_func_end sub_80E9AF8

	thumb_func_start sub_80E9C74
sub_80E9C74: @ 80E9C74
	push {lr}
	lsls r0, 16
	movs r1, 0xE0
	lsls r1, 11
	ands r1, r0
	lsrs r1, 16
	lsls r3, r1, 1
	adds r1, r3, 0
	adds r3, 0x1
	movs r0, 0
	movs r2, 0x1D
	bl MenuFillWindowRectWithBlankTile
	pop {r0}
	bx r0
	thumb_func_end sub_80E9C74

	thumb_func_start sub_80E9C94
sub_80E9C94: @ 80E9C94
	push {r4-r6,lr}
	ldr r0, _080E9CAC @ =gUnknown_083DB694
	ldr r0, [r0]
	ldr r2, _080E9CB0 @ =0x00009a28
	adds r1, r0, r2
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0x3
	bgt _080E9CB4
	lsls r0, 16
	lsrs r0, 16
	b _080E9CB6
	.align 2, 0
_080E9CAC: .4byte gUnknown_083DB694
_080E9CB0: .4byte 0x00009a28
_080E9CB4:
	movs r0, 0x4
_080E9CB6:
	adds r5, r0, 0
	movs r4, 0
	cmp r4, r5
	bcs _080E9CF4
	ldr r0, _080E9CE0 @ =gUnknown_083DB694
	ldr r0, [r0]
	ldr r1, _080E9CE4 @ =0x00009a29
	adds r6, r0, r1
_080E9CC6:
	movs r0, 0
	ldrsb r0, [r6, r0]
	adds r0, r4, r0
	lsls r0, 16
	lsrs r0, 16
	bl sub_80E9AF8
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r5
	bcc _080E9CC6
	b _080E9CF4
	.align 2, 0
_080E9CE0: .4byte gUnknown_083DB694
_080E9CE4: .4byte 0x00009a29
_080E9CE8:
	adds r0, r4, 0
	adds r1, r0, 0x1
	lsls r1, 16
	lsrs r4, r1, 16
	bl sub_80E9C74
_080E9CF4:
	cmp r4, 0x3
	bls _080E9CE8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80E9C94

	thumb_func_start sub_80E9D00
sub_80E9D00: @ 80E9D00
	push {r4-r6,lr}
	ldr r0, _080E9D28 @ =gUnknown_083DB694
	ldr r2, [r0]
	movs r0, 0xE0
	lsls r0, 1
	adds r1, r2, r0
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0
	ble _080E9D30
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r1, _080E9D2C @ =0x00009a29
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, 0x4
	b _080E9D46
	.align 2, 0
_080E9D28: .4byte gUnknown_083DB694
_080E9D2C: .4byte 0x00009a29
_080E9D30:
	movs r0, 0
	ldrsb r0, [r1, r0]
	negs r0, r0
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r1, _080E9D74 @ =0x00009a29
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	subs r0, r4
_080E9D46:
	lsls r0, 16
	lsrs r5, r0, 16
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _080E9D78 @ =0x0000ffff
	cmp r4, r0
	beq _080E9D6E
	adds r6, r0, 0
_080E9D58:
	adds r0, r5, 0
	adds r1, r0, 0x1
	lsls r1, 16
	lsrs r5, r1, 16
	bl sub_80E9AF8
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r6
	bne _080E9D58
_080E9D6E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E9D74: .4byte 0x00009a29
_080E9D78: .4byte 0x0000ffff
	thumb_func_end sub_80E9D00

	thumb_func_start sub_80E9D7C
sub_80E9D7C: @ 80E9D7C
	push {r4-r7,lr}
	ldr r0, _080E9DAC @ =gWindowConfig_81E6D54
	bl BasicInitMenuWindow
	ldr r0, _080E9DB0 @ =gUnknown_083DB694
	ldr r2, [r0]
	movs r0, 0xE0
	lsls r0, 1
	adds r1, r2, r0
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0
	bge _080E9DB8
	negs r0, r0
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r1, _080E9DB4 @ =0x000001b5
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	subs r0, r6
	b _080E9DCC
	.align 2, 0
_080E9DAC: .4byte gWindowConfig_81E6D54
_080E9DB0: .4byte gUnknown_083DB694
_080E9DB4: .4byte 0x000001b5
_080E9DB8:
	movs r0, 0
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r1, _080E9DFC @ =0x000001b5
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, 0x4
_080E9DCC:
	lsls r0, 16
	lsrs r4, r0, 16
	movs r5, 0
	cmp r5, r6
	bcs _080E9DF6
	ldr r0, _080E9E00 @ =gUnknown_083DB694
	ldr r7, [r0]
_080E9DDA:
	lsls r1, r4, 24
	lsrs r1, 24
	ldr r2, _080E9E04 @ =0x00009dc9
	adds r0, r7, r2
	bl sub_80E9940
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r6
	bcc _080E9DDA
_080E9DF6:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E9DFC: .4byte 0x000001b5
_080E9E00: .4byte gUnknown_083DB694
_080E9E04: .4byte 0x00009dc9
	thumb_func_end sub_80E9D7C

	thumb_func_start sub_80E9E08
sub_80E9E08: @ 80E9E08
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080E9E4C @ =gUnknown_083DB694
	ldr r3, [r0]
	movs r0, 0xDD
	lsls r0, 1
	adds r1, r3, r0
	movs r5, 0xE0
	lsls r5, 1
	adds r2, r3, r5
	movs r0, 0
	ldrsb r0, [r2, r0]
	lsls r0, 4
	ldrh r1, [r1]
	adds r0, r1
	movs r1, 0x7F
	ands r0, r1
	subs r5, 0x4
	adds r1, r3, r5
	strh r0, [r1]
	adds r1, r4, 0
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r0, 0
	bge _080E9E3E
	negs r1, r4
_080E9E3E:
	ldr r2, _080E9E50 @ =0x000001bf
	adds r0, r3, r2
	strb r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E9E4C: .4byte gUnknown_083DB694
_080E9E50: .4byte 0x000001bf
	thumb_func_end sub_80E9E08

	thumb_func_start sub_80E9E54
sub_80E9E54: @ 80E9E54
	push {r4,lr}
	ldr r0, _080E9E8C @ =gUnknown_083DB694
	ldr r2, [r0]
	movs r0, 0xDD
	lsls r0, 1
	adds r3, r2, r0
	ldr r1, _080E9E90 @ =0x000001bf
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r4, [r3]
	adds r0, r4
	movs r1, 0x7F
	ands r0, r1
	strh r0, [r3]
	movs r3, 0
	movs r4, 0xDE
	lsls r4, 1
	adds r1, r2, r4
	ldrh r1, [r1]
	cmp r0, r1
	bne _080E9E84
	movs r3, 0x1
_080E9E84:
	adds r0, r3, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080E9E8C: .4byte gUnknown_083DB694
_080E9E90: .4byte 0x000001bf
	thumb_func_end sub_80E9E54

	thumb_func_start nullsub_23
nullsub_23: @ 80E9E94
	bx lr
	thumb_func_end nullsub_23

	thumb_func_start sub_80E9E98
sub_80E9E98: @ 80E9E98
	ldr r0, _080E9EA4 @ =gUnknown_083DB694
	ldr r0, [r0]
	adds r0, 0xBE
	movs r1, 0
	strh r1, [r0]
	bx lr
	.align 2, 0
_080E9EA4: .4byte gUnknown_083DB694
	thumb_func_end sub_80E9E98

	thumb_func_start sub_80E9EA8
sub_80E9EA8: @ 80E9EA8
	push {lr}
	ldr r1, _080E9EC4 @ =gUnknown_083DB694
	ldr r0, [r1]
	adds r0, 0xBE
	ldrh r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x5
	bhi _080E9F48
	lsls r0, 2
	ldr r1, _080E9EC8 @ =_080E9ECC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E9EC4: .4byte gUnknown_083DB694
_080E9EC8: .4byte _080E9ECC
	.align 2, 0
_080E9ECC:
	.4byte _080E9EE4
	.4byte _080E9EF4
	.4byte _080E9F0C
	.4byte _080E9F24
	.4byte _080E9F38
	.4byte _080E9F44
_080E9EE4:
	bl sub_80EA24C
	ldr r0, _080E9F08 @ =gUnknown_083DB694
	ldr r1, [r0]
	adds r1, 0xBE
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080E9EF4:
	bl sub_80EA1E0
	lsls r0, 24
	cmp r0, 0
	beq _080E9F48
	bl sub_80EA4A4
	ldr r0, _080E9F08 @ =gUnknown_083DB694
	ldr r1, [r0]
	b _080E9F3A
	.align 2, 0
_080E9F08: .4byte gUnknown_083DB694
_080E9F0C:
	bl sub_80EA1E0
	lsls r0, 24
	cmp r0, 0
	beq _080E9F48
	bl sub_80EA704
	ldr r0, _080E9F20 @ =gUnknown_083DB694
	ldr r1, [r0]
	b _080E9F3A
	.align 2, 0
_080E9F20: .4byte gUnknown_083DB694
_080E9F24:
	bl sub_80EA1E0
	lsls r0, 24
	cmp r0, 0
	beq _080E9F48
	ldr r0, _080E9F34 @ =gUnknown_083DB694
	ldr r1, [r0]
	b _080E9F3A
	.align 2, 0
_080E9F34: .4byte gUnknown_083DB694
_080E9F38:
	ldr r1, [r2]
_080E9F3A:
	adds r1, 0xBE
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080E9F48
_080E9F44:
	movs r0, 0x1
	b _080E9F4A
_080E9F48:
	movs r0, 0
_080E9F4A:
	pop {r1}
	bx r1
	thumb_func_end sub_80E9EA8

	thumb_func_start sub_80E9F50
sub_80E9F50: @ 80E9F50
	push {lr}
	ldr r0, _080E9F68 @ =gUnknown_083DB694
	ldr r0, [r0]
	adds r0, 0xBE
	ldrh r0, [r0]
	cmp r0, 0x6
	bhi _080E9FCC
	lsls r0, 2
	ldr r1, _080E9F6C @ =_080E9F70
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E9F68: .4byte gUnknown_083DB694
_080E9F6C: .4byte _080E9F70
	.align 2, 0
_080E9F70:
	.4byte _080E9F8C
	.4byte _080E9FAC
	.4byte _080E9F96
	.4byte _080E9FAC
	.4byte _080E9F9C
	.4byte _080E9FAC
	.4byte _080E9FC8
_080E9F8C:
	bl nullsub_23
	bl sub_80EA764
	b _080E9FA0
_080E9F96:
	bl sub_80EA5A0
	b _080E9FA0
_080E9F9C:
	bl sub_80EA348
_080E9FA0:
	ldr r0, _080E9FC4 @ =gUnknown_083DB694
	ldr r1, [r0]
	adds r1, 0xBE
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080E9FAC:
	bl sub_80EA1E0
	lsls r0, 24
	cmp r0, 0
	beq _080E9FCC
	ldr r0, _080E9FC4 @ =gUnknown_083DB694
	ldr r1, [r0]
	adds r1, 0xBE
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080E9FCC
	.align 2, 0
_080E9FC4: .4byte gUnknown_083DB694
_080E9FC8:
	movs r0, 0x1
	b _080E9FCE
_080E9FCC:
	movs r0, 0
_080E9FCE:
	pop {r1}
	bx r1
	thumb_func_end sub_80E9F50

	thumb_func_start sub_80E9FD4
sub_80E9FD4: @ 80E9FD4
	push {r4,lr}
	ldr r0, _080E9FEC @ =gUnknown_083DB694
	ldr r0, [r0]
	adds r4, r0, 0
	adds r4, 0xBE
	ldrh r0, [r4]
	cmp r0, 0
	beq _080E9FF0
	cmp r0, 0x1
	beq _080E9FFE
	b _080EA00C
	.align 2, 0
_080E9FEC: .4byte gUnknown_083DB694
_080E9FF0:
	bl nullsub_23
	bl sub_80EA5A0
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_080E9FFE:
	bl sub_80EA1E0
	lsls r0, 24
	cmp r0, 0
	beq _080EA00C
	movs r0, 0x1
	b _080EA00E
_080EA00C:
	movs r0, 0
_080EA00E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80E9FD4

	thumb_func_start sub_80EA014
sub_80EA014: @ 80EA014
	push {r4,lr}
	ldr r0, _080EA02C @ =gUnknown_083DB694
	ldr r0, [r0]
	adds r4, r0, 0
	adds r4, 0xBE
	ldrh r0, [r4]
	cmp r0, 0
	beq _080EA030
	cmp r0, 0x1
	beq _080EA03A
	b _080EA048
	.align 2, 0
_080EA02C: .4byte gUnknown_083DB694
_080EA030:
	bl sub_80EA4A4
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_080EA03A:
	bl sub_80EA1E0
	lsls r0, 24
	cmp r0, 0
	beq _080EA048
	movs r0, 0x1
	b _080EA04A
_080EA048:
	movs r0, 0
_080EA04A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80EA014

	thumb_func_start sub_80EA050
sub_80EA050: @ 80EA050
	push {lr}
	ldr r0, _080EA068 @ =gUnknown_083DB694
	ldr r0, [r0]
	adds r0, 0xBE
	ldrh r0, [r0]
	cmp r0, 0x4
	bhi _080EA0DC
	lsls r0, 2
	ldr r1, _080EA06C @ =_080EA070
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EA068: .4byte gUnknown_083DB694
_080EA06C: .4byte _080EA070
	.align 2, 0
_080EA070:
	.4byte _080EA084
	.4byte _080EA08E
	.4byte _080EA09E
	.4byte _080EA0B4
	.4byte _080EA0D8
_080EA084:
	bl nullsub_23
	bl sub_80EA764
	b _080EA0C4
_080EA08E:
	bl sub_80EA1E0
	lsls r0, 24
	cmp r0, 0
	beq _080EA0DC
	bl sub_80EA7F4
	b _080EA0C4
_080EA09E:
	movs r0, 0x1
	bl sub_80E9108
	bl sub_80EA1E0
	lsls r0, 24
	cmp r0, 0
	beq _080EA0DC
	bl sub_80EA8BC
	b _080EA0C4
_080EA0B4:
	movs r0, 0x1
	bl sub_80E9108
	bl sub_80EA1E0
	lsls r0, 24
	cmp r0, 0
	beq _080EA0DC
_080EA0C4:
	ldr r0, _080EA0D4 @ =gUnknown_083DB694
	ldr r1, [r0]
	adds r1, 0xBE
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080EA0DC
	.align 2, 0
_080EA0D4: .4byte gUnknown_083DB694
_080EA0D8:
	movs r0, 0x1
	b _080EA0DE
_080EA0DC:
	movs r0, 0
_080EA0DE:
	pop {r1}
	bx r1
	thumb_func_end sub_80EA050

	thumb_func_start sub_80EA0E4
sub_80EA0E4: @ 80EA0E4
	push {lr}
	ldr r0, _080EA0FC @ =gUnknown_083DB694
	ldr r0, [r0]
	adds r0, 0xBE
	ldrh r0, [r0]
	cmp r0, 0x4
	bhi _080EA17C
	lsls r0, 2
	ldr r1, _080EA100 @ =_080EA104
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EA0FC: .4byte gUnknown_083DB694
_080EA100: .4byte _080EA104
	.align 2, 0
_080EA104:
	.4byte _080EA118
	.4byte _080EA128
	.4byte _080EA144
	.4byte _080EA15C
	.4byte _080EA178
_080EA118:
	bl sub_80EA948
	ldr r0, _080EA140 @ =gUnknown_083DB694
	ldr r1, [r0]
	adds r1, 0xBE
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EA128:
	movs r0, 0x1
	negs r0, r0
	bl sub_80E9108
	bl sub_80EA1E0
	lsls r0, 24
	cmp r0, 0
	beq _080EA17C
	bl sub_80EAA44
	b _080EA166
	.align 2, 0
_080EA140: .4byte gUnknown_083DB694
_080EA144:
	movs r0, 0x1
	negs r0, r0
	bl sub_80E9108
	bl sub_80EA1E0
	lsls r0, 24
	cmp r0, 0
	beq _080EA17C
	bl sub_80EA704
	b _080EA166
_080EA15C:
	bl sub_80EA1E0
	lsls r0, 24
	cmp r0, 0
	beq _080EA17C
_080EA166:
	ldr r0, _080EA174 @ =gUnknown_083DB694
	ldr r1, [r0]
	adds r1, 0xBE
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080EA17C
	.align 2, 0
_080EA174: .4byte gUnknown_083DB694
_080EA178:
	movs r0, 0x1
	b _080EA17E
_080EA17C:
	movs r0, 0
_080EA17E:
	pop {r1}
	bx r1
	thumb_func_end sub_80EA0E4

	thumb_func_start sub_80EA184
sub_80EA184: @ 80EA184
	push {r4,lr}
	ldr r0, _080EA1A0 @ =gUnknown_083DB694
	ldr r0, [r0]
	adds r4, r0, 0
	adds r4, 0xBE
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _080EA1B4
	cmp r0, 0x1
	bgt _080EA1A4
	cmp r0, 0
	beq _080EA1AA
	b _080EA1D8
	.align 2, 0
_080EA1A0: .4byte gUnknown_083DB694
_080EA1A4:
	cmp r0, 0x2
	beq _080EA1D0
	b _080EA1D8
_080EA1AA:
	bl sub_80EAAD4
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_080EA1B4:
	bl sub_80EA1E0
	lsls r0, 24
	cmp r0, 0
	beq _080EA1D8
	ldr r0, _080EA1CC @ =gUnknown_083DB694
	ldr r1, [r0]
	adds r1, 0xBE
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080EA1D8
	.align 2, 0
_080EA1CC: .4byte gUnknown_083DB694
_080EA1D0:
	bl sub_80E9178
	movs r0, 0x1
	b _080EA1DA
_080EA1D8:
	movs r0, 0
_080EA1DA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80EA184

	thumb_func_start sub_80EA1E0
sub_80EA1E0: @ 80EA1E0
	push {r4-r6,lr}
	ldr r0, _080EA240 @ =gUnknown_083DB694
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0xC4
	ldrh r0, [r0]
	cmp r0, 0
	beq _080EA244
	movs r4, 0
	adds r0, r1, 0
	adds r0, 0xC2
	ldrh r2, [r0]
	cmp r4, r2
	bcs _080EA228
	adds r5, r1, 0
	adds r6, r0, 0
_080EA200:
	lsls r0, r4, 4
	adds r0, 0xC8
	adds r0, r5, r0
	bl sub_80EAC0C
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r1
	adds r0, r5, r0
	bl sub_80EAC48
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrh r2, [r6]
	cmp r4, r2
	bcc _080EA200
_080EA228:
	ldr r0, _080EA240 @ =gUnknown_083DB694
	ldr r1, [r0]
	adds r2, r1, 0
	adds r2, 0xBC
	movs r0, 0x1
	strb r0, [r2]
	adds r1, 0xC4
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	movs r0, 0
	b _080EA246
	.align 2, 0
_080EA240: .4byte gUnknown_083DB694
_080EA244:
	movs r0, 0x1
_080EA246:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80EA1E0

	thumb_func_start sub_80EA24C
sub_80EA24C: @ 80EA24C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	ldr r0, _080EA340 @ =gUnknown_083DB694
	ldr r7, [r0]
	adds r0, r7, 0
	adds r0, 0xC8
	movs r6, 0xF
	str r6, [sp]
	ldr r1, _080EA344 @ =0x0000fffe
	mov r8, r1
	str r1, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0xD
	movs r2, 0xE
	movs r3, 0xD
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	movs r1, 0xD9
	lsls r1, 3
	adds r5, r7, r1
	str r5, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xD8
	str r6, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x2
	mov r9, r1
	str r1, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0xC
	movs r2, 0xE
	movs r3, 0xC
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r1, 0x1E
	movs r2, 0
	mov r3, r8
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xE8
	movs r6, 0x10
	str r6, [sp]
	mov r1, r8
	str r1, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0xD
	movs r2, 0xF
	movs r3, 0xD
	bl sub_80EABD4
	movs r1, 0xB0
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r1, 0
	movs r2, 0x9
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xF8
	str r6, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	mov r1, r9
	str r1, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0xC
	movs r2, 0xF
	movs r3, 0xC
	bl sub_80EABD4
	movs r1, 0xB6
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r1, 0x1E
	movs r2, 0x9
	mov r3, r8
	bl sub_80EAC30
	adds r1, r7, 0
	adds r1, 0xC2
	movs r0, 0x4
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x6
	strh r0, [r1]
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EA340: .4byte gUnknown_083DB694
_080EA344: .4byte 0x0000fffe
	thumb_func_end sub_80EA24C

	thumb_func_start sub_80EA348
sub_80EA348: @ 80EA348
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	ldr r0, _080EA49C @ =gUnknown_083DB694
	ldr r7, [r0]
	adds r0, r7, 0
	adds r0, 0xC8
	movs r5, 0xF
	str r5, [sp]
	movs r1, 0x2
	mov r9, r1
	str r1, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x1
	movs r2, 0xE
	movs r3, 0xD
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	movs r1, 0xD9
	lsls r1, 3
	adds r6, r7, r1
	str r6, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xD8
	str r5, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	ldr r1, _080EA4A0 @ =0x0000fffe
	mov r8, r1
	str r1, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0xC
	movs r2, 0xE
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	str r6, [sp, 0x4]
	movs r1, 0x12
	movs r2, 0
	movs r3, 0x2
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xE8
	movs r5, 0x10
	str r5, [sp]
	mov r1, r9
	str r1, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x1
	movs r2, 0xF
	movs r3, 0xD
	bl sub_80EABD4
	movs r1, 0xB0
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	str r6, [sp, 0x4]
	movs r1, 0
	movs r2, 0x9
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xF8
	str r5, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	mov r1, r8
	str r1, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0xC
	movs r2, 0xF
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xB6
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	str r6, [sp, 0x4]
	movs r1, 0x12
	movs r2, 0x9
	movs r3, 0x2
	bl sub_80EAC30
	movs r1, 0x84
	lsls r1, 1
	adds r0, r7, r1
	str r5, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	mov r1, r9
	str r1, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x1
	movs r2, 0xE
	movs r3, 0x1
	bl sub_80EABD4
	movs r1, 0xBC
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	adds r1, 0x50
	adds r6, r7, r1
	str r6, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0xE
	movs r3, 0
	bl sub_80EAC30
	movs r1, 0x8C
	lsls r1, 1
	adds r0, r7, r1
	str r5, [sp]
	mov r1, r8
	str r1, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x18
	movs r2, 0xE
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xC2
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	str r6, [sp, 0x4]
	movs r1, 0x18
	movs r2, 0xE
	mov r3, r8
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xC2
	movs r1, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EA49C: .4byte gUnknown_083DB694
_080EA4A0: .4byte 0x0000fffe
	thumb_func_end sub_80EA348

	thumb_func_start sub_80EA4A4
sub_80EA4A4: @ 80EA4A4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	ldr r0, _080EA598 @ =gUnknown_083DB694
	ldr r7, [r0]
	adds r0, r7, 0
	adds r0, 0xC8
	movs r6, 0xF
	str r6, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r1, _080EA59C @ =0x0000ffff
	mov r8, r1
	str r1, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x1
	movs r2, 0xE
	movs r3, 0xD
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	movs r1, 0xD9
	lsls r1, 3
	adds r5, r7, r1
	str r5, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xD8
	str r6, [sp]
	str r4, [sp, 0x4]
	mov r1, r8
	str r1, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0xC
	movs r2, 0xE
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r1, 0x12
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xE8
	movs r1, 0x10
	mov r9, r1
	str r1, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	movs r6, 0x1
	str r6, [sp, 0x10]
	movs r1, 0x1
	movs r2, 0xF
	movs r3, 0xD
	bl sub_80EABD4
	movs r1, 0xB0
	lsls r1, 1
	adds r0, r7, r1
	mov r1, r8
	str r1, [sp]
	str r5, [sp, 0x4]
	movs r1, 0
	movs r2, 0x9
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xF8
	mov r1, r9
	str r1, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r6, [sp, 0x10]
	movs r1, 0xC
	movs r2, 0xF
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xB6
	lsls r1, 1
	adds r0, r7, r1
	mov r1, r8
	str r1, [sp]
	str r5, [sp, 0x4]
	movs r1, 0x12
	movs r2, 0x9
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xC2
	movs r1, 0x4
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EA598: .4byte gUnknown_083DB694
_080EA59C: .4byte 0x0000ffff
	thumb_func_end sub_80EA4A4

	thumb_func_start sub_80EA5A0
sub_80EA5A0: @ 80EA5A0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	ldr r0, _080EA6FC @ =gUnknown_083DB694
	ldr r7, [r0]
	adds r0, r7, 0
	adds r0, 0xC8
	movs r6, 0xF
	str r6, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	movs r1, 0x1
	mov r8, r1
	str r1, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r2, 0xA
	movs r3, 0xD
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	movs r1, 0xD9
	lsls r1, 3
	adds r5, r7, r1
	str r5, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xD8
	str r6, [sp]
	str r4, [sp, 0x4]
	mov r1, r8
	str r1, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0xC
	movs r2, 0xA
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r1, 0x12
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xE8
	movs r1, 0x14
	mov r9, r1
	str r1, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	ldr r6, _080EA700 @ =0x0000ffff
	str r6, [sp, 0x10]
	movs r1, 0x1
	movs r2, 0xF
	movs r3, 0xD
	bl sub_80EABD4
	movs r1, 0xB0
	lsls r1, 1
	adds r0, r7, r1
	mov r1, r8
	str r1, [sp]
	str r5, [sp, 0x4]
	movs r1, 0
	movs r2, 0x5
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xF8
	mov r1, r9
	str r1, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r6, [sp, 0x10]
	movs r1, 0xC
	movs r2, 0xF
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xB6
	lsls r1, 1
	adds r0, r7, r1
	mov r1, r8
	str r1, [sp]
	str r5, [sp, 0x4]
	movs r1, 0x12
	movs r2, 0x5
	movs r3, 0
	bl sub_80EAC30
	movs r1, 0x84
	lsls r1, 1
	adds r0, r7, r1
	movs r1, 0xA
	str r1, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	mov r1, r8
	str r1, [sp, 0x10]
	movs r1, 0x1
	movs r2, 0xA
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xBC
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	adds r1, 0x50
	adds r5, r7, r1
	str r5, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0xA
	movs r3, 0
	bl sub_80EAC30
	movs r1, 0x8C
	lsls r1, 1
	adds r0, r7, r1
	mov r1, r9
	str r1, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x1
	movs r2, 0x14
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xC2
	lsls r1, 1
	adds r0, r7, r1
	str r6, [sp]
	str r5, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0x14
	movs r3, 0
	bl sub_80EAC30
	adds r1, r7, 0
	adds r1, 0xC2
	movs r0, 0x6
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x4
	strh r0, [r1]
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EA6FC: .4byte gUnknown_083DB694
_080EA700: .4byte 0x0000ffff
	thumb_func_end sub_80EA5A0

	thumb_func_start sub_80EA704
sub_80EA704: @ 80EA704
	push {r4-r6,lr}
	sub sp, 0x14
	ldr r0, _080EA75C @ =gUnknown_083DB694
	ldr r6, [r0]
	adds r0, r6, 0
	adds r0, 0xC8
	movs r1, 0x14
	str r1, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r5, 0x1
	str r5, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x18
	movs r2, 0xC
	movs r3, 0x19
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r6, r1
	ldr r3, _080EA760 @ =0x0000ffff
	str r4, [sp]
	movs r2, 0xD9
	lsls r2, 3
	adds r1, r6, r2
	str r1, [sp, 0x4]
	movs r1, 0x5
	movs r2, 0xA
	bl sub_80EAC30
	adds r0, r6, 0
	adds r0, 0xC2
	strh r5, [r0]
	adds r1, r6, 0
	adds r1, 0xC4
	movs r0, 0x5
	strh r0, [r1]
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EA75C: .4byte gUnknown_083DB694
_080EA760: .4byte 0x0000ffff
	thumb_func_end sub_80EA704

	thumb_func_start sub_80EA764
sub_80EA764: @ 80EA764
	push {r4-r7,lr}
	sub sp, 0x14
	ldr r0, _080EA7EC @ =gUnknown_083DB694
	ldr r7, [r0]
	adds r0, r7, 0
	adds r0, 0xC8
	movs r6, 0x14
	str r6, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	ldr r5, _080EA7F0 @ =0x0000ffff
	str r5, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x18
	movs r2, 0xC
	movs r3, 0x1E
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	movs r2, 0xD9
	lsls r2, 3
	adds r1, r7, r2
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x1
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xD8
	str r6, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x1E
	movs r2, 0xC
	movs r3, 0x1F
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	movs r2, 0xE4
	lsls r2, 1
	adds r1, r7, r2
	str r1, [sp, 0x4]
	movs r1, 0x1E
	movs r2, 0xC
	adds r3, r5, 0
	bl sub_80EAC30
	adds r1, r7, 0
	adds r1, 0xC2
	movs r0, 0x2
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x6
	strh r0, [r1]
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EA7EC: .4byte gUnknown_083DB694
_080EA7F0: .4byte 0x0000ffff
	thumb_func_end sub_80EA764

	thumb_func_start sub_80EA7F4
sub_80EA7F4: @ 80EA7F4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	ldr r0, _080EA8B4 @ =gUnknown_083DB694
	ldr r7, [r0]
	adds r0, r7, 0
	adds r0, 0xC8
	movs r6, 0x14
	str r6, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r5, 0x1
	str r5, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x14
	movs r2, 0xA
	movs r3, 0x19
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r7, r1
	ldr r3, _080EA8B8 @ =0x0000ffff
	str r4, [sp]
	movs r2, 0xD9
	lsls r2, 3
	adds r2, r7
	mov r8, r2
	str r2, [sp, 0x4]
	movs r1, 0x19
	movs r2, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xD8
	str r6, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r5, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x1
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	movs r2, 0xE4
	lsls r2, 1
	adds r1, r7, r2
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xE8
	str r6, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x1
	movs r2, 0xA
	movs r3, 0x4
	bl sub_80EABD4
	movs r1, 0xB0
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	mov r2, r8
	str r2, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r1, r7, 0
	adds r1, 0xC2
	movs r0, 0x3
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x2
	strh r0, [r1]
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EA8B4: .4byte gUnknown_083DB694
_080EA8B8: .4byte 0x0000ffff
	thumb_func_end sub_80EA7F4

	thumb_func_start sub_80EA8BC
sub_80EA8BC: @ 80EA8BC
	push {r4-r6,lr}
	sub sp, 0x14
	ldr r0, _080EA944 @ =gUnknown_083DB694
	ldr r6, [r0]
	adds r0, r6, 0
	adds r0, 0xC8
	movs r5, 0x14
	str r5, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x3
	movs r2, 0xA
	movs r3, 0x4
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r6, r1
	str r4, [sp]
	movs r2, 0xD9
	lsls r2, 3
	adds r1, r6, r2
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r0, r6, 0
	adds r0, 0xD8
	str r5, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x2
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r6, r1
	str r4, [sp]
	movs r2, 0xE4
	lsls r2, 1
	adds r1, r6, r2
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0
	bl sub_80EAC30
	adds r1, r6, 0
	adds r1, 0xC2
	movs r0, 0x2
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x1
	strh r0, [r1]
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EA944: .4byte gUnknown_083DB694
	thumb_func_end sub_80EA8BC

	thumb_func_start sub_80EA948
sub_80EA948: @ 80EA948
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	ldr r0, _080EAA3C @ =gUnknown_083DB694
	ldr r7, [r0]
	adds r0, r7, 0
	adds r0, 0xC8
	movs r6, 0x14
	str r6, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	ldr r5, _080EAA40 @ =0x0000ffff
	str r5, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x2
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	adds r1, 0x80
	adds r1, r7
	mov r9, r1
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xD8
	str r6, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x3
	movs r2, 0xA
	movs r3, 0x5
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	movs r1, 0xD9
	lsls r1, 3
	adds r1, r7
	mov r8, r1
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xE8
	str r6, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x1A
	movs r2, 0xA
	movs r3, 0x1E
	bl sub_80EABD4
	movs r1, 0xB0
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	mov r1, r9
	str r1, [sp, 0x4]
	movs r1, 0x1A
	movs r2, 0xA
	adds r3, r5, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xF8
	str r6, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	str r5, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x19
	movs r2, 0xA
	movs r3, 0x1A
	bl sub_80EABD4
	movs r1, 0xB6
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	mov r1, r8
	str r1, [sp, 0x4]
	movs r1, 0x1D
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r1, r7, 0
	adds r1, 0xC2
	movs r0, 0x4
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x2
	strh r0, [r1]
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EAA3C: .4byte gUnknown_083DB694
_080EAA40: .4byte 0x0000ffff
	thumb_func_end sub_80EA948

	thumb_func_start sub_80EAA44
sub_80EAA44: @ 80EAA44
	push {r4-r6,lr}
	sub sp, 0x14
	ldr r0, _080EAACC @ =gUnknown_083DB694
	ldr r6, [r0]
	adds r0, r6, 0
	adds r0, 0xC8
	movs r5, 0x14
	str r5, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x18
	movs r2, 0xA
	movs r3, 0x1E
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r6, r1
	str r4, [sp]
	movs r2, 0xE4
	lsls r2, 1
	adds r1, r6, r2
	str r1, [sp, 0x4]
	movs r1, 0x18
	movs r2, 0xA
	movs r3, 0
	bl sub_80EAC30
	adds r0, r6, 0
	adds r0, 0xD8
	str r5, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	ldr r1, _080EAAD0 @ =0x0000ffff
	str r1, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x17
	movs r2, 0xA
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r6, r1
	str r4, [sp]
	movs r2, 0xD9
	lsls r2, 3
	adds r1, r6, r2
	str r1, [sp, 0x4]
	movs r1, 0x1D
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r1, r6, 0
	adds r1, 0xC2
	movs r0, 0x2
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x1
	strh r0, [r1]
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EAACC: .4byte gUnknown_083DB694
_080EAAD0: .4byte 0x0000ffff
	thumb_func_end sub_80EAA44

	thumb_func_start sub_80EAAD4
sub_80EAAD4: @ 80EAAD4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	ldr r0, _080EABCC @ =gUnknown_083DB694
	ldr r7, [r0]
	adds r0, r7, 0
	adds r0, 0xC8
	movs r1, 0xF
	str r1, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	movs r5, 0x1
	str r5, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x1E
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	movs r1, 0xD9
	lsls r1, 3
	adds r1, r7
	mov r8, r1
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xD8
	movs r1, 0x14
	mov r9, r1
	str r1, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	ldr r6, _080EABD0 @ =0x0000ffff
	str r6, [sp, 0x10]
	movs r1, 0
	movs r2, 0xF
	movs r3, 0x1E
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r7, r1
	str r5, [sp]
	mov r1, r8
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0x5
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xE8
	movs r1, 0xA
	str r1, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r5, [sp, 0x10]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x1E
	bl sub_80EABD4
	movs r1, 0xB0
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	adds r1, 0x68
	adds r5, r7, r1
	str r5, [sp, 0x4]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xF8
	mov r1, r9
	str r1, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0
	movs r2, 0x14
	movs r3, 0x1E
	bl sub_80EABD4
	movs r1, 0xB6
	lsls r1, 1
	adds r0, r7, r1
	str r6, [sp]
	str r5, [sp, 0x4]
	movs r1, 0
	movs r2, 0x14
	movs r3, 0
	bl sub_80EAC30
	adds r1, r7, 0
	adds r1, 0xC2
	movs r0, 0x4
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x5
	strh r0, [r1]
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EABCC: .4byte gUnknown_083DB694
_080EABD0: .4byte 0x0000ffff
	thumb_func_end sub_80EAAD4

	thumb_func_start sub_80EABD4
sub_80EABD4: @ 80EABD4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r5, [sp, 0x1C]
	ldr r6, [sp, 0x20]
	ldr r4, [sp, 0x24]
	mov r9, r4
	ldr r4, [sp, 0x28]
	ldr r7, [sp, 0x2C]
	mov r8, r7
	strh r1, [r0]
	strh r3, [r0, 0x2]
	strh r2, [r0, 0x4]
	strh r5, [r0, 0x6]
	strh r6, [r0, 0x8]
	strh r4, [r0, 0xA]
	mov r1, r9
	strh r1, [r0, 0xC]
	mov r4, r8
	strh r4, [r0, 0xE]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80EABD4

	thumb_func_start sub_80EAC0C
sub_80EAC0C: @ 80EAC0C
	ldrh r1, [r0, 0x8]
	ldrh r2, [r0]
	adds r1, r2
	strh r1, [r0]
	ldrh r1, [r0, 0xA]
	ldrh r2, [r0, 0x2]
	adds r1, r2
	strh r1, [r0, 0x2]
	ldrh r1, [r0, 0xC]
	ldrh r2, [r0, 0x4]
	adds r1, r2
	strh r1, [r0, 0x4]
	ldrh r1, [r0, 0xE]
	ldrh r2, [r0, 0x6]
	adds r1, r2
	strh r1, [r0, 0x6]
	bx lr
	thumb_func_end sub_80EAC0C

	thumb_func_start sub_80EAC30
sub_80EAC30: @ 80EAC30
	push {r4,r5,lr}
	ldr r4, [sp, 0xC]
	ldr r5, [sp, 0x10]
	strh r1, [r0]
	strh r2, [r0, 0x2]
	strh r3, [r0, 0x4]
	strh r4, [r0, 0x6]
	str r5, [r0, 0x8]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80EAC30

	thumb_func_start sub_80EAC48
sub_80EAC48: @ 80EAC48
	ldrh r1, [r0, 0x4]
	ldrh r2, [r0]
	adds r1, r2
	strh r1, [r0]
	ldrh r1, [r0, 0x6]
	ldrh r2, [r0, 0x2]
	adds r1, r2
	strh r1, [r0, 0x2]
	bx lr
	thumb_func_end sub_80EAC48

	thumb_func_start sub_80EAC5C
sub_80EAC5C: @ 80EAC5C
	push {r4-r6,lr}
	ldr r0, _080EACB4 @ =gUnknown_083DB694
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0xBC
	ldrb r0, [r0]
	cmp r0, 0
	beq _080EACAC
	movs r4, 0
	adds r0, r1, 0
	adds r0, 0xC2
	ldrh r2, [r0]
	cmp r4, r2
	bcs _080EACA2
	adds r5, r1, 0
	adds r6, r0, 0
_080EAC7C:
	lsls r1, r4, 4
	adds r1, 0xC8
	adds r1, r5, r1
	lsls r2, r4, 1
	adds r2, r4
	lsls r2, 2
	movs r0, 0xA4
	lsls r0, 1
	adds r2, r0
	adds r2, r5, r2
	ldr r0, _080EACB8 @ =0x06006800
	bl sub_80EACBC
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrh r2, [r6]
	cmp r4, r2
	bcc _080EAC7C
_080EACA2:
	ldr r0, _080EACB4 @ =gUnknown_083DB694
	ldr r0, [r0]
	adds r0, 0xBC
	movs r1, 0
	strb r1, [r0]
_080EACAC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EACB4: .4byte gUnknown_083DB694
_080EACB8: .4byte 0x06006800
	thumb_func_end sub_80EAC5C

	thumb_func_start sub_80EACBC
sub_80EACBC: @ 80EACBC
	push {r4-r7,lr}
	sub sp, 0x10
	adds r7, r0, 0
	adds r3, r1, 0
	adds r4, r2, 0
	ldrh r2, [r3, 0x2]
	ldrh r0, [r3]
	subs r2, r0
	ldrh r0, [r3, 0x6]
	ldrh r1, [r3, 0x4]
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	lsls r6, r2, 16
	cmp r6, 0
	ble _080EACFE
	lsls r5, r0, 16
	cmp r5, 0
	ble _080EACFE
	ldrh r1, [r3]
	ldrh r2, [r3, 0x4]
	ldr r3, [r4, 0x8]
	ldrh r0, [r4]
	str r0, [sp]
	ldrh r0, [r4, 0x2]
	str r0, [sp, 0x4]
	lsrs r0, r6, 16
	str r0, [sp, 0x8]
	lsrs r0, r5, 16
	str r0, [sp, 0xC]
	adds r0, r7, 0
	bl sub_809D104
_080EACFE:
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80EACBC

	thumb_func_start sub_80EAD08
sub_80EAD08: @ 80EAD08
	push {r4,r5,lr}
	ldr r0, _080EAD58 @ =gUnknown_03004DC0
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	ldr r1, _080EAD5C @ =gUnknown_03004DE0
	adds r4, r0, r1
	adds r4, 0xB0
	ldr r0, _080EAD60 @ =gUnknown_083DB694
	ldr r1, [r0]
	movs r0, 0xDD
	lsls r0, 1
	adds r1, r0
	ldrh r0, [r1]
	adds r2, r0, 0
	subs r2, 0x58
	movs r0, 0xFF
	ands r2, r0
	movs r3, 0
	movs r5, 0xFF
_080EAD32:
	ldrh r0, [r1]
	adds r0, r3
	cmp r0, 0x80
	bne _080EAD42
	negs r0, r3
	adds r2, r0, 0
	subs r2, 0x58
	ands r2, r5
_080EAD42:
	strh r2, [r4]
	adds r4, 0x2
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3F
	bls _080EAD32
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EAD58: .4byte gUnknown_03004DC0
_080EAD5C: .4byte gUnknown_03004DE0
_080EAD60: .4byte gUnknown_083DB694
	thumb_func_end sub_80EAD08

	thumb_func_start sub_80EAD64
sub_80EAD64: @ 80EAD64
	push {lr}
	lsls r1, 24
	ldr r2, _080EAD78 @ =gEasyChatGroupNames
	lsrs r1, 22
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	pop {r1}
	bx r1
	.align 2, 0
_080EAD78: .4byte gEasyChatGroupNames
	thumb_func_end sub_80EAD64

	thumb_func_start sub_80EAD7C
sub_80EAD7C: @ 80EAD7C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x14
	beq _080EADA2
	cmp r0, 0x14
	bgt _080EAD9C
	cmp r0, 0x11
	blt _080EADBA
	ldr r0, _080EAD98 @ =0x00000804
	bl FlagGet
	b _080EADB4
	.align 2, 0
_080EAD98: .4byte 0x00000804
_080EAD9C:
	cmp r1, 0x15
	beq _080EADB0
	b _080EADBA
_080EADA2:
	ldr r0, _080EADAC @ =0x00000806
	bl FlagGet
	b _080EADB4
	.align 2, 0
_080EADAC: .4byte 0x00000806
_080EADB0:
	bl sub_80EB9C8
_080EADB4:
	lsls r0, 24
	lsrs r0, 24
	b _080EADBC
_080EADBA:
	movs r0, 0x1
_080EADBC:
	pop {r1}
	bx r1
	thumb_func_end sub_80EAD7C

	thumb_func_start sub_80EADC0
sub_80EADC0: @ 80EADC0
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 16
	lsrs r3, r1, 16
	cmp r2, 0x15
	bhi _080EAE82
	lsls r0, r2, 2
	ldr r1, _080EADD8 @ =_080EADDC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EADD8: .4byte _080EADDC
	.align 2, 0
_080EADDC:
	.4byte _080EAE50
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE62
	.4byte _080EAE62
	.4byte _080EAE62
	.4byte _080EAE34
	.4byte _080EAE78
_080EAE34:
	ldr r0, _080EAE4C @ =gUnknown_083DB694
	ldr r0, [r0]
	adds r0, r2
	adds r0, 0x67
	ldrb r0, [r0]
	cmp r0, 0
	beq _080EAE70
	lsls r0, r3, 24
	lsrs r0, 24
	bl sub_80EB868
	b _080EAE7C
	.align 2, 0
_080EAE4C: .4byte gUnknown_083DB694
_080EAE50:
	adds r0, r3, 0
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	bl GetSetPokedexFlag
	b _080EAE7C
_080EAE62:
	ldr r0, _080EAE74 @ =gUnknown_083DB694
	ldr r0, [r0]
	adds r0, r2
	adds r0, 0x67
	ldrb r0, [r0]
	cmp r0, 0
	bne _080EAE82
_080EAE70:
	movs r0, 0
	b _080EAE84
	.align 2, 0
_080EAE74: .4byte gUnknown_083DB694
_080EAE78:
	bl sub_80EB9C8
_080EAE7C:
	lsls r0, 24
	lsrs r0, 24
	b _080EAE84
_080EAE82:
	movs r0, 0x1
_080EAE84:
	pop {r1}
	bx r1
	thumb_func_end sub_80EADC0

	thumb_func_start sub_80EAE88
sub_80EAE88: @ 80EAE88
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _080EAEA6
	cmp r4, 0x14
	beq _080EAEB2
	adds r0, r4, 0
	bl sub_80EAD7C
	lsls r0, 24
	cmp r0, 0
	bne _080EAEBC
	movs r0, 0
	b _080EAEC2
_080EAEA6:
	movs r0, 0
	bl GetHoennPokedexCount
	lsls r0, 16
	lsrs r0, 16
	b _080EAEC2
_080EAEB2:
	bl sub_80EB8C0
	lsls r0, 24
	lsrs r0, 24
	b _080EAEC2
_080EAEBC:
	ldr r0, _080EAEC8 @ =gEasyChatGroupSizes
	adds r0, r4, r0
	ldrb r0, [r0]
_080EAEC2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080EAEC8: .4byte gEasyChatGroupSizes
	thumb_func_end sub_80EAE88

	thumb_func_start sub_80EAECC
sub_80EAECC: @ 80EAECC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	movs r0, 0
	mov r8, r0
	ldr r1, _080EAF10 @ =gUnknown_083DB694
	ldr r0, [r1]
	ldr r3, _080EAF14 @ =0x00004142
	adds r3, r0, r3
	str r3, [sp, 0x4]
_080EAEE6:
	ldr r1, _080EAF18 @ =gEasyChatWordsByLetter
	mov r7, r8
	lsls r2, r7, 1
	adds r0, r2, r1
	ldrh r4, [r0]
	mov r3, r8
	adds r3, 0x1
	lsls r0, r3, 1
	adds r0, r1
	ldrh r0, [r0]
	str r0, [sp]
	ldr r0, [sp, 0x4]
	adds r1, r0, r2
	movs r0, 0
	strh r0, [r1]
	mov r9, r0
	adds r6, r4, 0
	mov r10, r2
	str r3, [sp, 0x8]
	b _080EB00C
	.align 2, 0
_080EAF10: .4byte gUnknown_083DB694
_080EAF14: .4byte 0x00004142
_080EAF18: .4byte gEasyChatWordsByLetter
_080EAF1C:
	ldr r2, _080EAFB0 @ =gEasyChatWordsAlphabetized
	adds r0, r6, 0
	adds r1, r0, 0x1
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	adds r4, r1, 0
	ldr r0, _080EAFB4 @ =0x0000feff
	cmp r1, r0
	bls _080EAFCC
	movs r0, 0xFF
	ands r1, r0
	movs r7, 0
	subs r0, r1, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r3, _080EAFB8 @ =0x0000ffff
	cmp r5, r3
	beq _080EB00C
	mov r1, r8
	lsls r0, r1, 8
	subs r0, r1
	lsls r3, r0, 1
_080EAF4E:
	adds r1, r6, 0
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 1
	ldr r0, _080EAFB0 @ =gEasyChatWordsAlphabetized
	adds r1, r0
	ldrh r4, [r1]
	lsrs r0, r4, 9
	ldr r1, _080EAFBC @ =0x000001ff
	adds r2, r1, 0
	adds r1, r4, 0
	ands r1, r2
	str r3, [sp, 0xC]
	bl sub_80EADC0
	lsls r0, 24
	ldr r3, [sp, 0xC]
	cmp r0, 0
	beq _080EAFA2
	cmp r7, 0
	bne _080EAFA2
	ldr r7, _080EAFC0 @ =gUnknown_083DB694
	ldr r2, [r7]
	mov r1, r9
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	lsls r1, 1
	adds r1, r3
	ldr r7, _080EAFC4 @ =0x00000b78
	adds r0, r2, r7
	adds r0, r1
	strh r4, [r0]
	ldr r0, _080EAFC8 @ =0x00004142
	adds r2, r0
	add r2, r10
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	movs r7, 0x1
_080EAFA2:
	subs r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r1, _080EAFB8 @ =0x0000ffff
	cmp r5, r1
	bne _080EAF4E
	b _080EB00C
	.align 2, 0
_080EAFB0: .4byte gEasyChatWordsAlphabetized
_080EAFB4: .4byte 0x0000feff
_080EAFB8: .4byte 0x0000ffff
_080EAFBC: .4byte 0x000001ff
_080EAFC0: .4byte gUnknown_083DB694
_080EAFC4: .4byte 0x00000b78
_080EAFC8: .4byte 0x00004142
_080EAFCC:
	lsrs r0, r4, 9
	ldr r3, _080EB030 @ =0x000001ff
	adds r2, r3, 0
	adds r1, r4, 0
	ands r1, r2
	bl sub_80EADC0
	lsls r0, 24
	cmp r0, 0
	beq _080EB00C
	ldr r7, _080EB034 @ =gUnknown_083DB694
	ldr r2, [r7]
	mov r1, r9
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	mov r3, r8
	lsls r0, r3, 8
	subs r0, r3
	adds r0, r1
	lsls r0, 1
	ldr r7, _080EB038 @ =0x00000b78
	adds r1, r2, r7
	adds r1, r0
	strh r4, [r1]
	ldr r0, _080EB03C @ =0x00004142
	adds r2, r0
	add r2, r10
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
_080EB00C:
	ldr r1, [sp]
	cmp r6, r1
	bcc _080EAF1C
	ldr r3, [sp, 0x8]
	lsls r0, r3, 16
	lsrs r0, 16
	mov r8, r0
	cmp r0, 0x1A
	bhi _080EB020
	b _080EAEE6
_080EB020:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EB030: .4byte 0x000001ff
_080EB034: .4byte gUnknown_083DB694
_080EB038: .4byte 0x00000b78
_080EB03C: .4byte 0x00004142
	thumb_func_end sub_80EAECC

	thumb_func_start sub_80EB040
sub_80EB040: @ 80EB040
	push {r4-r6,lr}
	movs r3, 0
_080EB044:
	adds r6, r3, 0x1
	cmp r3, 0
	beq _080EB094
	cmp r3, 0x15
	beq _080EB094
	cmp r3, 0x12
	beq _080EB094
	cmp r3, 0x13
	beq _080EB094
	ldr r0, _080EB0A4 @ =gEasyChatGroupWords
	lsls r1, r3, 2
	adds r1, r0
	ldr r2, [r1]
	movs r4, 0
	ldrb r0, [r2]
	cmp r0, 0xFF
	beq _080EB094
	ldr r0, _080EB0A8 @ =gUnknown_083DB694
	ldr r0, [r0]
	ldr r1, _080EB0AC @ =0x000041a4
	adds r5, r0, r1
_080EB06E:
	lsls r0, r4, 2
	lsls r1, r3, 10
	adds r0, r1
	adds r0, r5, r0
	str r2, [r0]
	ldrb r0, [r2]
	adds r1, r4, 0x1
	cmp r0, 0xFF
	beq _080EB088
_080EB080:
	adds r2, 0x1
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _080EB080
_080EB088:
	adds r2, 0x1
	lsls r0, r1, 16
	lsrs r4, r0, 16
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _080EB06E
_080EB094:
	lsls r0, r6, 16
	lsrs r3, r0, 16
	cmp r3, 0x15
	bls _080EB044
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EB0A4: .4byte gEasyChatGroupWords
_080EB0A8: .4byte gUnknown_083DB694
_080EB0AC: .4byte 0x000041a4
	thumb_func_end sub_80EB040

	thumb_func_start sub_80EB0B0
sub_80EB0B0: @ 80EB0B0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r3, _080EB184 @ =gUnknown_083DB694
	ldr r4, [r3]
	adds r0, r4, 0
	adds r0, 0x26
	ldrb r5, [r0]
	cmp r5, 0
	bne _080EB19C
	movs r0, 0xDC
	lsls r0, 1
	adds r2, r4, r0
	ldrb r6, [r2]
	lsls r1, r6, 1
	ldr r7, _080EB188 @ =0x00004178
	adds r0, r4, r7
	adds r0, r1
	strh r5, [r0]
	movs r7, 0
	movs r0, 0
	mov r9, r0
	ldr r1, _080EB18C @ =gEasyChatGroupOrders
	lsls r0, r6, 2
	adds r0, r1
	ldr r0, [r0]
	str r0, [sp]
	movs r1, 0
	mov r8, r1
	ldr r1, _080EB190 @ =gEasyChatGroupSizes
	ldrb r0, [r2]
	adds r0, r1
	ldrb r0, [r0]
	cmp r8, r0
	bcc _080EB0FE
	b _080EB1FA
_080EB0FE:
	movs r2, 0xDC
	lsls r2, 1
	adds r2, r4, r2
	str r2, [sp, 0x4]
	lsls r5, r6, 24
	mov r10, r5
_080EB10A:
	mov r1, r8
	lsls r0, r1, 1
	ldr r2, [sp]
	adds r5, r0, r2
	ldrh r1, [r5]
	mov r2, r10
	lsrs r0, r2, 24
	bl sub_80EADC0
	lsls r0, 24
	cmp r0, 0
	beq _080EB16A
	ldr r0, _080EB184 @ =gUnknown_083DB694
	ldr r3, [r0]
	lsls r1, r7, 1
	mov r2, r9
	lsls r0, r2, 2
	adds r1, r0
	ldr r0, _080EB194 @ =0x00009a2a
	adds r4, r3, r0
	adds r4, r1
	movs r0, 0x7F
	ands r0, r6
	lsls r0, 9
	ldrh r1, [r5]
	ldr r5, _080EB198 @ =0x000001ff
	adds r2, r5, 0
	ands r1, r2
	orrs r0, r1
	strh r0, [r4]
	lsls r0, r6, 1
	ldr r1, _080EB188 @ =0x00004178
	adds r3, r1
	adds r3, r0
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x1
	bls _080EB16A
	movs r7, 0
	mov r0, r9
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
_080EB16A:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r1, _080EB190 @ =gEasyChatGroupSizes
	ldr r2, [sp, 0x4]
	ldrb r0, [r2]
	adds r0, r1
	ldrb r0, [r0]
	cmp r8, r0
	bcc _080EB10A
	b _080EB1FA
	.align 2, 0
_080EB184: .4byte gUnknown_083DB694
_080EB188: .4byte 0x00004178
_080EB18C: .4byte gEasyChatGroupOrders
_080EB190: .4byte gEasyChatGroupSizes
_080EB194: .4byte 0x00009a2a
_080EB198: .4byte 0x000001ff
_080EB19C:
	movs r5, 0xDC
	lsls r5, 1
	adds r0, r4, r5
	ldrb r2, [r0]
	movs r3, 0
	movs r6, 0
	movs r5, 0
	lsls r1, r2, 1
	ldr r7, _080EB20C @ =0x00004142
	adds r0, r4, r7
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r5, r0
	bcs _080EB1FA
	ldr r7, _080EB210 @ =0x00009a2a
	adds r7, r4
	mov r8, r7
	lsls r0, r2, 8
	subs r0, r2
	lsls r7, r0, 1
	ldr r0, _080EB214 @ =0x00000b78
	adds r2, r4, r0
	adds r4, r1, 0
_080EB1CA:
	lsls r1, r3, 1
	lsls r0, r6, 2
	adds r1, r0
	add r1, r8
	lsls r0, r5, 1
	adds r0, r7
	adds r0, r2, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x1
	bls _080EB1EE
	movs r3, 0
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_080EB1EE:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r1, [r4]
	cmp r5, r1
	bcc _080EB1CA
_080EB1FA:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EB20C: .4byte 0x00004142
_080EB210: .4byte 0x00009a2a
_080EB214: .4byte 0x00000b78
	thumb_func_end sub_80EB0B0

	thumb_func_start sub_80EB218
sub_80EB218: @ 80EB218
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	lsls r6, r1, 16
	lsrs r4, r6, 16
	adds r7, r4, 0
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	adds r0, r4, 0
	bl sub_80EB37C
	lsls r0, 24
	cmp r0, 0
	beq _080EB240
	ldr r1, _080EB23C @ =gOtherText_ThreeQuestions
	b _080EB2A2
	.align 2, 0
_080EB23C: .4byte gOtherText_ThreeQuestions
_080EB240:
	ldr r0, _080EB250 @ =0x0000ffff
	cmp r4, r0
	bne _080EB254
	adds r1, r5, 0
	movs r0, 0xFF
	strb r0, [r1]
	b _080EB2AA
	.align 2, 0
_080EB250: .4byte 0x0000ffff
_080EB254:
	lsrs r2, r6, 25
	ldr r1, _080EB268 @ =0x000001ff
	ands r1, r7
	cmp r2, 0x13
	bgt _080EB26C
	cmp r2, 0x12
	bge _080EB280
	cmp r2, 0
	beq _080EB270
	b _080EB290
	.align 2, 0
_080EB268: .4byte 0x000001ff
_080EB26C:
	cmp r2, 0x15
	bne _080EB290
_080EB270:
	movs r0, 0xB
	muls r1, r0
	ldr r0, _080EB27C @ =gSpeciesNames
	adds r1, r0
	b _080EB2A2
	.align 2, 0
_080EB27C: .4byte gSpeciesNames
_080EB280:
	movs r0, 0xD
	muls r1, r0
	ldr r0, _080EB28C @ =gMoveNames
	adds r1, r0
	b _080EB2A2
	.align 2, 0
_080EB28C: .4byte gMoveNames
_080EB290:
	ldr r0, _080EB2CC @ =gUnknown_083DB694
	ldr r0, [r0]
	lsls r1, 2
	lsls r2, 10
	adds r1, r2
	ldr r2, _080EB2D0 @ =0x000041a4
	adds r0, r2
	adds r0, r1
	ldr r1, [r0]
_080EB2A2:
	adds r0, r5, 0
	bl StringCopy
	adds r1, r0, 0
_080EB2AA:
	movs r0, 0xFC
	strb r0, [r1]
	movs r0, 0x13
	strb r0, [r1, 0x1]
	mov r2, r8
	lsls r0, r2, 3
	strb r0, [r1, 0x2]
	adds r1, 0x3
	movs r0, 0xFF
	strb r0, [r1]
	adds r0, r1, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080EB2CC: .4byte gUnknown_083DB694
_080EB2D0: .4byte 0x000041a4
	thumb_func_end sub_80EB218

	thumb_func_start sub_80EB2D4
sub_80EB2D4: @ 80EB2D4
	push {r4-r6,lr}
	lsls r5, r0, 16
	lsrs r4, r5, 16
	adds r6, r4, 0
	adds r0, r4, 0
	bl sub_80EB37C
	lsls r0, 24
	cmp r0, 0
	beq _080EB2F8
	ldr r0, _080EB2F4 @ =gOtherText_ThreeQuestions
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	b _080EB374
	.align 2, 0
_080EB2F4: .4byte gOtherText_ThreeQuestions
_080EB2F8:
	ldr r0, _080EB304 @ =0x0000ffff
	cmp r4, r0
	bne _080EB308
	movs r0, 0
	b _080EB374
	.align 2, 0
_080EB304: .4byte 0x0000ffff
_080EB308:
	lsrs r2, r5, 25
	ldr r1, _080EB31C @ =0x000001ff
	ands r1, r6
	cmp r2, 0x13
	bgt _080EB320
	cmp r2, 0x12
	bge _080EB334
	cmp r2, 0
	beq _080EB324
	b _080EB344
	.align 2, 0
_080EB31C: .4byte 0x000001ff
_080EB320:
	cmp r2, 0x15
	bne _080EB344
_080EB324:
	movs r0, 0xB
	muls r1, r0
	ldr r0, _080EB330 @ =gSpeciesNames
	adds r1, r0
	b _080EB356
	.align 2, 0
_080EB330: .4byte gSpeciesNames
_080EB334:
	movs r0, 0xD
	muls r1, r0
	ldr r0, _080EB340 @ =gMoveNames
	adds r1, r0
	b _080EB356
	.align 2, 0
_080EB340: .4byte gMoveNames
_080EB344:
	ldr r0, _080EB35C @ =gUnknown_083DB694
	ldr r0, [r0]
	lsls r1, 2
	lsls r2, 10
	adds r1, r2
	ldr r2, _080EB360 @ =0x000041a4
	adds r0, r2
	adds r0, r1
	ldr r1, [r0]
_080EB356:
	movs r2, 0
	b _080EB36C
	.align 2, 0
_080EB35C: .4byte gUnknown_083DB694
_080EB360: .4byte 0x000041a4
_080EB364:
	adds r1, 0x1
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
_080EB36C:
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _080EB364
	adds r0, r2, 0
_080EB374:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80EB2D4

	thumb_func_start sub_80EB37C
sub_80EB37C: @ 80EB37C
	push {r4,r5,lr}
	lsls r1, r0, 16
	lsrs r3, r1, 16
	ldr r0, _080EB3A0 @ =0x0000ffff
	cmp r3, r0
	beq _080EB3EA
	lsrs r2, r1, 25
	ldr r5, _080EB3A4 @ =0x000001ff
	ands r5, r3
	cmp r2, 0x15
	bhi _080EB3F4
	cmp r2, 0x13
	bgt _080EB3A8
	cmp r2, 0x12
	bge _080EB3AC
	cmp r2, 0
	beq _080EB3AC
	b _080EB3E0
	.align 2, 0
_080EB3A0: .4byte 0x0000ffff
_080EB3A4: .4byte 0x000001ff
_080EB3A8:
	cmp r2, 0x15
	bne _080EB3E0
_080EB3AC:
	ldr r0, _080EB3D8 @ =gEasyChatGroupWords
	lsls r1, r2, 2
	adds r1, r0
	ldr r4, [r1]
	movs r3, 0
	ldr r0, _080EB3DC @ =gEasyChatGroupSizes
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r3, r0
	bcs _080EB3F4
	adds r1, r0, 0
_080EB3C2:
	lsls r0, r3, 1
	adds r0, r4
	ldrh r0, [r0]
	cmp r5, r0
	beq _080EB3EA
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r1
	bcc _080EB3C2
	b _080EB3F4
	.align 2, 0
_080EB3D8: .4byte gEasyChatGroupWords
_080EB3DC: .4byte gEasyChatGroupSizes
_080EB3E0:
	ldr r0, _080EB3F0 @ =gEasyChatGroupSizes
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r5, r0
	bcs _080EB3F4
_080EB3EA:
	movs r0, 0
	b _080EB3F6
	.align 2, 0
_080EB3F0: .4byte gEasyChatGroupSizes
_080EB3F4:
	movs r0, 0x1
_080EB3F6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80EB37C

	.align 2, 0 @ Don't pad with nop.
