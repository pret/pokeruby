	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8091E20
sub_8091E20: @ 8091E20
	push {lr}
	sub sp, 0x8
	movs r1, 0x20
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	movs r1, 0x9
	movs r2, 0x78
	movs r3, 0xD0
	bl sub_8072AB0
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_8091E20

	thumb_func_start sub_8091E3C
sub_8091E3C: @ 8091E3C
	push {lr}
	ldr r0, _08091E50 @ =sub_8091E54
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08091E50: .4byte sub_8091E54
	thumb_func_end sub_8091E3C

	thumb_func_start sub_8091E54
sub_8091E54: @ 8091E54
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08091E78 @ =gMain
	ldr r2, _08091E7C @ =0x0000043c
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r3, r1, 0
	cmp r0, 0x4
	bhi _08091E98
	lsls r0, 2
	ldr r1, _08091E80 @ =_08091E84
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08091E78: .4byte gMain
_08091E7C: .4byte 0x0000043c
_08091E80: .4byte _08091E84
	.align 2, 0
_08091E84:
	.4byte _08091E98
	.4byte _08091F50
	.4byte _08091FC0
	.4byte _08091FE0
	.4byte _0809200C
_08091E98:
	ldr r0, _08091F1C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08091EA6
	b _08092030
_08091EA6:
	ldr r0, _08091F20 @ =gPokedexView
	ldr r0, [r0]
	ldr r1, _08091F24 @ =0x0000064a
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	movs r0, 0
	bl sub_8091060
	ldr r0, _08091F28 @ =gPokedexMenuSearch_Gfx
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08091F2C @ =gUnknown_08E96D2C
	ldr r1, _08091F30 @ =0x06007800
	bl LZ77UnCompVram
	ldr r0, _08091F34 @ =gPokedexMenuSearch_Pal + 0x2
	movs r1, 0x1
	movs r2, 0x7E
	bl LoadPalette
	bl IsNationalPokedexEnabled
	cmp r0, 0
	bne _08091F10
	movs r4, 0
	ldr r2, _08091F38 @ =0x06007a80
	mov r8, r2
	ldr r0, _08091F3C @ =0x06007b00
	mov r12, r0
	movs r5, 0x1
	ldr r7, _08091F40 @ =0x06007ac0
	ldr r6, _08091F44 @ =0x06007b40
_08091EEC:
	lsls r1, r4, 1
	mov r0, r8
	adds r2, r1, r0
	mov r0, r12
	adds r3, r1, r0
	ldrh r0, [r3]
	strh r0, [r2]
	adds r2, r1, r7
	adds r1, r6
	ldrh r0, [r1]
	strh r0, [r2]
	strh r5, [r3]
	strh r5, [r1]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x10
	bls _08091EEC
_08091F10:
	ldr r0, _08091F48 @ =gMain
	ldr r1, _08091F4C @ =0x0000043c
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	b _08092030
	.align 2, 0
_08091F1C: .4byte gPaletteFade
_08091F20: .4byte gPokedexView
_08091F24: .4byte 0x0000064a
_08091F28: .4byte gPokedexMenuSearch_Gfx
_08091F2C: .4byte gUnknown_08E96D2C
_08091F30: .4byte 0x06007800
_08091F34: .4byte gPokedexMenuSearch_Pal + 0x2
_08091F38: .4byte 0x06007a80
_08091F3C: .4byte 0x06007b00
_08091F40: .4byte 0x06007ac0
_08091F44: .4byte 0x06007b40
_08091F48: .4byte gMain
_08091F4C: .4byte 0x0000043c
_08091F50:
	ldr r4, _08091FA8 @ =gWindowConfig_81E7064
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	ldr r0, _08091FAC @ =gUnknown_083A05CC
	bl LoadCompressedObjectPic
	ldr r0, _08091FB0 @ =gUnknown_083A05DC
	bl LoadSpritePalettes
	adds r0, r5, 0
	bl sub_809308C
	movs r4, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r1, r0, 3
	ldr r3, _08091FB4 @ =gTasks + 0x8
	movs r2, 0
_08091F7C:
	lsls r0, r4, 1
	adds r0, r1
	adds r0, r3
	strh r2, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xF
	bls _08091F7C
	adds r0, r5, 0
	bl sub_8092EB0
	movs r0, 0
	bl sub_8092AB0
	adds r0, r5, 0
	bl sub_8092B68
	ldr r1, _08091FB8 @ =gMain
	ldr r2, _08091FBC @ =0x0000043c
	adds r1, r2
	b _08091FF6
	.align 2, 0
_08091FA8: .4byte gWindowConfig_81E7064
_08091FAC: .4byte gUnknown_083A05CC
_08091FB0: .4byte gUnknown_083A05DC
_08091FB4: .4byte gTasks + 0x8
_08091FB8: .4byte gMain
_08091FBC: .4byte 0x0000043c
_08091FC0:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, _08091FD8 @ =gMain
	ldr r0, _08091FDC @ =0x0000043c
	adds r1, r0
	b _08091FF6
	.align 2, 0
_08091FD8: .4byte gMain
_08091FDC: .4byte 0x0000043c
_08091FE0:
	ldr r1, _08092000 @ =REG_BG3CNT
	ldr r2, _08092004 @ =0x00000f03
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xE
	movs r2, 0xE2
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08092008 @ =0x0000043c
	adds r1, r3, r0
_08091FF6:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08092030
	.align 2, 0
_08092000: .4byte REG_BG3CNT
_08092004: .4byte 0x00000f03
_08092008: .4byte 0x0000043c
_0809200C:
	ldr r0, _0809203C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _08092030
	ldr r1, _08092040 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08092044 @ =sub_809204C
	str r1, [r0]
	ldr r1, _08092048 @ =0x0000043c
	adds r0, r3, r1
	strb r2, [r0]
_08092030:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809203C: .4byte gPaletteFade
_08092040: .4byte gTasks
_08092044: .4byte sub_809204C
_08092048: .4byte 0x0000043c
	thumb_func_end sub_8091E54

	thumb_func_start sub_809204C
sub_809204C: @ 809204C
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _08092074 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	ldrb r0, [r4, 0x8]
	bl sub_8092AB0
	adds r0, r5, 0
	bl sub_8092B68
	ldr r0, _08092078 @ =sub_809207C
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08092074: .4byte gTasks
_08092078: .4byte sub_809207C
	thumb_func_end sub_809204C

	thumb_func_start sub_809207C
sub_809207C: @ 809207C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080920A4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080920B0
	movs r0, 0x3
	bl PlaySE
	ldr r0, _080920A8 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080920AC @ =sub_80927B8
	str r0, [r1]
	b _0809216C
	.align 2, 0
_080920A4: .4byte gMain
_080920A8: .4byte gTasks
_080920AC: .4byte sub_80927B8
_080920B0:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0809210C
	ldr r1, _080920D4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r5, r0, r1
	movs r0, 0x8
	ldrsh r4, [r5, r0]
	cmp r4, 0x1
	beq _080920E8
	cmp r4, 0x1
	bgt _080920D8
	cmp r4, 0
	beq _080920DE
	b _0809216C
	.align 2, 0
_080920D4: .4byte gTasks
_080920D8:
	cmp r4, 0x2
	beq _080920FC
	b _0809216C
_080920DE:
	movs r0, 0x15
	bl PlaySE
	strh r4, [r5, 0xA]
	b _080920F2
_080920E8:
	movs r0, 0x15
	bl PlaySE
	movs r0, 0x4
	strh r0, [r5, 0xA]
_080920F2:
	ldr r0, _080920F8 @ =sub_809217C
	str r0, [r5]
	b _0809216C
	.align 2, 0
_080920F8: .4byte sub_809217C
_080920FC:
	movs r0, 0x3
	bl PlaySE
	ldr r0, _08092108 @ =sub_80927B8
	str r0, [r5]
	b _0809216C
	.align 2, 0
_08092108: .4byte sub_80927B8
_0809210C:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0809213A
	ldr r0, _08092174 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r4, r1, r0
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	ble _0809213A
	movs r0, 0x6D
	bl PlaySE
	ldrh r0, [r4, 0x8]
	subs r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8092AB0
_0809213A:
	ldr r0, _08092178 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0809216C
	ldr r0, _08092174 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r4, r1, r0
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bgt _0809216C
	movs r0, 0x6D
	bl PlaySE
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8092AB0
_0809216C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08092174: .4byte gTasks
_08092178: .4byte gMain
	thumb_func_end sub_809207C

	thumb_func_start sub_809217C
sub_809217C: @ 809217C
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _080921A8 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0xA]
	bl sub_8092AD4
	adds r0, r5, 0
	bl sub_8092B68
	ldr r0, _080921AC @ =sub_80921B0
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080921A8: .4byte gTasks
_080921AC: .4byte sub_80921B0
	thumb_func_end sub_809217C

	thumb_func_start sub_80921B0
sub_80921B0: @ 80921B0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080921D8 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080921E4
	bl IsNationalPokedexEnabled
	ldr r6, _080921DC @ =gUnknown_083B586C
	cmp r0, 0
	bne _080921F0
	ldr r6, _080921E0 @ =gUnknown_083B58A4
	b _080921F0
	.align 2, 0
_080921D8: .4byte gTasks
_080921DC: .4byte gUnknown_083B586C
_080921E0: .4byte gUnknown_083B58A4
_080921E4:
	bl IsNationalPokedexEnabled
	ldr r6, _0809221C @ =gUnknown_083B5850
	cmp r0, 0
	bne _080921F0
	ldr r6, _08092220 @ =gUnknown_083B5888
_080921F0:
	ldr r0, _08092224 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	beq _08092230
	movs r0, 0x17
	bl PlaySE
	adds r0, r5, 0
	bl sub_8092EB0
	ldr r0, _08092228 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _0809222C @ =sub_809204C
	str r0, [r1]
	b _080923EC
	.align 2, 0
_0809221C: .4byte gUnknown_083B5850
_08092220: .4byte gUnknown_083B5888
_08092224: .4byte gMain
_08092228: .4byte gTasks
_0809222C: .4byte sub_809204C
_08092230:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08092300
	ldr r0, _080922B4 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r6, r1, r0
	movs r2, 0xA
	ldrsh r0, [r6, r2]
	cmp r0, 0x6
	bne _080922F0
	movs r1, 0x8
	ldrsh r0, [r6, r1]
	cmp r0, 0
	beq _080922D4
	ldr r1, _080922B8 @ =gUnknown_0202FFBA
	movs r0, 0x40
	strb r0, [r1]
	ldr r7, _080922BC @ =gPokedexView
	ldr r1, [r7]
	ldr r0, _080922C0 @ =0x0000062a
	adds r2, r1, r0
	movs r0, 0x40
	strh r0, [r2]
	ldr r0, _080922C4 @ =gUnknown_0202FFB8
	strh r3, [r0]
	movs r2, 0xC2
	lsls r2, 3
	adds r1, r2
	strh r3, [r1]
	adds r0, r5, 0
	movs r1, 0x5
	bl sub_8092E10
	ldr r4, _080922C8 @ =gSaveBlock2
	strb r0, [r4, 0x19]
	bl IsNationalPokedexEnabled
	cmp r0, 0
	bne _08092288
	movs r0, 0
	strb r0, [r4, 0x19]
_08092288:
	ldr r0, [r7]
	ldrb r1, [r4, 0x19]
	ldr r2, _080922CC @ =0x00000614
	adds r0, r2
	strh r1, [r0]
	adds r0, r5, 0
	movs r1, 0x4
	bl sub_8092E10
	strb r0, [r4, 0x18]
	ldr r0, [r7]
	ldrb r1, [r4, 0x18]
	movs r2, 0xC3
	lsls r2, 3
	adds r0, r2
	strh r1, [r0]
	movs r0, 0x3
	bl PlaySE
	ldr r0, _080922D0 @ =sub_80927B8
	str r0, [r6]
	b _080923EC
	.align 2, 0
_080922B4: .4byte gTasks
_080922B8: .4byte gUnknown_0202FFBA
_080922BC: .4byte gPokedexView
_080922C0: .4byte 0x0000062a
_080922C4: .4byte gUnknown_0202FFB8
_080922C8: .4byte gSaveBlock2
_080922CC: .4byte 0x00000614
_080922D0: .4byte sub_80927B8
_080922D4:
	ldr r0, _080922E8 @ =gDexText_Searching
	bl sub_8091E20
	ldr r0, _080922EC @ =sub_80923FC
	str r0, [r6]
	movs r0, 0x70
	bl PlaySE
	b _080923EC
	.align 2, 0
_080922E8: .4byte gDexText_Searching
_080922EC: .4byte sub_80923FC
_080922F0:
	movs r0, 0x15
	bl PlaySE
	ldr r0, _080922FC @ =sub_80925CC
	str r0, [r6]
	b _080923EC
	.align 2, 0
_080922FC: .4byte sub_80925CC
_08092300:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08092338
	ldr r1, _080923F4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _08092338
	movs r0, 0x5
	bl PlaySE
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0]
	strh r1, [r4, 0xA]
	ldrb r0, [r4, 0x8]
	bl sub_8092AD4
_08092338:
	ldr r0, _080923F8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08092374
	ldr r1, _080923F4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0, 0x1]
	cmp r0, 0xFF
	beq _08092374
	movs r0, 0x5
	bl PlaySE
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0, 0x1]
	strh r1, [r4, 0xA]
	ldrb r0, [r4, 0x8]
	bl sub_8092AD4
_08092374:
	ldr r0, _080923F8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080923B0
	ldr r1, _080923F4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0, 0x2]
	cmp r0, 0xFF
	beq _080923B0
	movs r0, 0x5
	bl PlaySE
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0, 0x2]
	strh r1, [r4, 0xA]
	ldrb r0, [r4, 0x8]
	bl sub_8092AD4
_080923B0:
	ldr r0, _080923F8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080923EC
	ldr r1, _080923F4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0, 0x3]
	cmp r0, 0xFF
	beq _080923EC
	movs r0, 0x5
	bl PlaySE
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0, 0x3]
	strh r1, [r4, 0xA]
	ldrb r0, [r4, 0x8]
	bl sub_8092AD4
_080923EC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080923F4: .4byte gTasks
_080923F8: .4byte gMain
	thumb_func_end sub_80921B0

	thumb_func_start sub_80923FC
sub_80923FC: @ 80923FC
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r5, 0
	movs r1, 0x5
	bl sub_8092E10
	mov r10, r0
	mov r0, r10
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	adds r0, r5, 0
	movs r1, 0x4
	bl sub_8092E10
	mov r9, r0
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	adds r0, r5, 0
	movs r1, 0
	bl sub_8092E10
	mov r8, r0
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8092E10
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_8092E10
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_8092E10
	lsls r0, 24
	lsrs r0, 24
	str r4, [sp]
	str r0, [sp, 0x4]
	mov r0, r10
	mov r1, r9
	mov r2, r8
	adds r3, r6, 0
	bl sub_8091AF8
	ldr r1, _0809249C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080924A0 @ =sub_80924A4
	str r1, [r0]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809249C: .4byte gTasks
_080924A0: .4byte sub_80924A4
	thumb_func_end sub_80923FC

	thumb_func_start sub_80924A4
sub_80924A4: @ 80924A4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _080924F6
	ldr r0, _080924D0 @ =gPokedexView
	ldr r0, [r0]
	ldr r1, _080924D4 @ =0x0000060c
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0
	beq _080924DC
	movs r0, 0x1F
	bl PlaySE
	ldr r0, _080924D8 @ =gDexText_SearchComplete
	bl sub_8091E20
	b _080924E8
	.align 2, 0
_080924D0: .4byte gPokedexView
_080924D4: .4byte 0x0000060c
_080924D8: .4byte gDexText_SearchComplete
_080924DC:
	movs r0, 0x20
	bl PlaySE
	ldr r0, _080924FC @ =gDexText_NoMatching
	bl sub_8091E20
_080924E8:
	ldr r0, _08092500 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08092504 @ =sub_8092508
	str r0, [r1]
_080924F6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080924FC: .4byte gDexText_NoMatching
_08092500: .4byte gTasks
_08092504: .4byte sub_8092508
	thumb_func_end sub_80924A4

	thumb_func_start sub_8092508
sub_8092508: @ 8092508
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r2, r4, 0
	ldr r0, _08092570 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080925A4
	ldr r5, _08092574 @ =gPokedexView
	ldr r1, [r5]
	ldr r3, _08092578 @ =0x0000060c
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, 0
	beq _08092590
	ldr r0, _0809257C @ =0x0000064f
	adds r1, r0
	movs r0, 0x1
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x5
	bl sub_8092E10
	ldr r1, [r5]
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08092580 @ =0x00000612
	adds r1, r2
	strh r0, [r1]
	adds r0, r4, 0
	movs r1, 0x4
	bl sub_8092E10
	ldr r1, [r5]
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08092584 @ =0x00000616
	adds r1, r3
	strh r0, [r1]
	ldr r1, _08092588 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809258C @ =sub_80927B8
	str r1, [r0]
	movs r0, 0x3
	bl PlaySE
	b _080925A4
	.align 2, 0
_08092570: .4byte gMain
_08092574: .4byte gPokedexView
_08092578: .4byte 0x0000060c
_0809257C: .4byte 0x0000064f
_08092580: .4byte 0x00000612
_08092584: .4byte 0x00000616
_08092588: .4byte gTasks
_0809258C: .4byte sub_80927B8
_08092590:
	ldr r0, _080925AC @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _080925B0 @ =sub_809217C
	str r0, [r1]
	movs r0, 0x17
	bl PlaySE
_080925A4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080925AC: .4byte gTasks
_080925B0: .4byte sub_809217C
	thumb_func_end sub_8092508

	thumb_func_start sub_80925B4
sub_80925B4: @ 80925B4
	push {lr}
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 15
	adds r1, 0x1
	lsls r1, 27
	lsrs r1, 24
	movs r0, 0x90
	bl sub_814AD7C
	pop {r0}
	bx r0
	thumb_func_end sub_80925B4

	thumb_func_start sub_80925CC
sub_80925CC: @ 80925CC
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl sub_8092C8C
	ldr r2, _08092630 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r6, r1, r2
	ldrb r0, [r6, 0xA]
	adds r2, 0x8
	adds r1, r2
	ldr r2, _08092634 @ =gUnknown_083B5A7C
	lsls r0, 3
	adds r0, r2
	ldrb r5, [r0, 0x4]
	lsls r5, 1
	adds r5, r1, r5
	ldrb r0, [r0, 0x5]
	lsls r0, 1
	adds r1, r0
	ldrh r0, [r5]
	strh r0, [r6, 0x24]
	ldrh r0, [r1]
	strh r0, [r6, 0x26]
	adds r0, r4, 0
	bl sub_8092D78
	ldr r1, _08092638 @ =0x0000ffff
	ldr r3, _0809263C @ =0x00002d9f
	movs r0, 0xB
	str r0, [sp]
	movs r0, 0x10
	movs r2, 0xC
	bl CreateBlendedOutlineCursor
	ldrh r0, [r5]
	movs r1, 0x1
	bl sub_80925B4
	ldr r0, _08092640 @ =sub_8092644
	str r0, [r6]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08092630: .4byte gTasks
_08092634: .4byte gUnknown_083B5A7C
_08092638: .4byte 0x0000ffff
_0809263C: .4byte 0x00002d9f
_08092640: .4byte sub_8092644
	thumb_func_end sub_80925CC

	thumb_func_start sub_8092644
sub_8092644: @ 8092644
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r3, _080926A8 @ =gTasks
	lsls r2, r7, 2
	adds r2, r7
	lsls r2, 3
	adds r6, r2, r3
	ldrb r1, [r6, 0xA]
	ldr r0, _080926AC @ =gUnknown_083B5A7C
	lsls r1, 3
	adds r1, r0
	ldr r0, [r1]
	mov r8, r0
	adds r3, 0x8
	adds r2, r3
	ldrb r0, [r1, 0x4]
	lsls r0, 1
	adds r4, r2, r0
	ldrb r0, [r1, 0x5]
	lsls r0, 1
	adds r5, r2, r0
	ldrh r0, [r1, 0x6]
	subs r0, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _080926B0 @ =gMain
	mov r12, r0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080926B4
	bl sub_814ADC8
	movs r0, 0x15
	bl PlaySE
	movs r0, 0x12
	movs r1, 0x1
	movs r2, 0x1C
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	movs r0, 0x1
	bl sub_8092C8C
	b _080926E0
	.align 2, 0
_080926A8: .4byte gTasks
_080926AC: .4byte gUnknown_083B5A7C
_080926B0: .4byte gMain
_080926B4:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080926EC
	bl sub_814ADC8
	movs r0, 0x17
	bl PlaySE
	movs r0, 0x12
	movs r1, 0x1
	movs r2, 0x1C
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	movs r0, 0x1
	bl sub_8092C8C
	ldrh r0, [r6, 0x24]
	strh r0, [r4]
	ldrh r0, [r6, 0x26]
	strh r0, [r5]
_080926E0:
	ldr r0, _080926E8 @ =sub_809217C
	str r0, [r6]
	b _080927AE
	.align 2, 0
_080926E8: .4byte sub_809217C
_080926EC:
	movs r3, 0
	mov r0, r12
	ldrh r1, [r0, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0809274C
	ldrh r0, [r4]
	cmp r0, 0
	beq _08092716
	movs r1, 0
	bl sub_80925B4
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r4]
	ldrh r0, [r4]
	movs r1, 0x1
	bl sub_80925B4
	b _08092734
_08092716:
	ldrh r0, [r5]
	cmp r0, 0
	beq _08092730
	subs r0, 0x1
	strh r0, [r5]
	adds r0, r7, 0
	bl sub_8092D78
	ldrh r0, [r4]
	movs r1, 0x1
	bl sub_80925B4
	movs r3, 0x1
_08092730:
	cmp r3, 0
	beq _080927AE
_08092734:
	movs r0, 0x5
	bl PlaySE
	ldrh r0, [r4]
	ldrh r1, [r5]
	adds r0, r1
	lsls r0, 3
	add r0, r8
	ldr r0, [r0]
	bl sub_8091E20
	b _080927AE
_0809274C:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080927AE
	ldrh r0, [r4]
	cmp r0, 0x4
	bhi _08092774
	cmp r0, r2
	bcs _08092774
	movs r1, 0
	bl sub_80925B4
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	ldrh r0, [r4]
	movs r1, 0x1
	bl sub_80925B4
	b _08092798
_08092774:
	cmp r2, 0x5
	bls _08092794
	ldrh r1, [r5]
	subs r0, r2, 0x5
	cmp r1, r0
	bge _08092794
	adds r0, r1, 0x1
	strh r0, [r5]
	adds r0, r7, 0
	bl sub_8092D78
	movs r0, 0x5
	movs r1, 0x1
	bl sub_80925B4
	movs r3, 0x1
_08092794:
	cmp r3, 0
	beq _080927AE
_08092798:
	movs r0, 0x5
	bl PlaySE
	ldrh r0, [r4]
	ldrh r1, [r5]
	adds r0, r1
	lsls r0, 3
	add r0, r8
	ldr r0, [r0]
	bl sub_8091E20
_080927AE:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8092644

	thumb_func_start sub_80927B8
sub_80927B8: @ 80927B8
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _080927E8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080927EC @ =sub_80927F0
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080927E8: .4byte gTasks
_080927EC: .4byte sub_80927F0
	thumb_func_end sub_80927B8

	thumb_func_start sub_80927F0
sub_80927F0: @ 80927F0
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0809280C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08092808
	adds r0, r2, 0
	bl DestroyTask
_08092808:
	pop {r0}
	bx r0
	.align 2, 0
_0809280C: .4byte gPaletteFade
	thumb_func_end sub_80927F0

	thumb_func_start sub_8092810
sub_8092810: @ 8092810
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r12, r1
	lsls r2, 24
	lsrs r1, r2, 24
	lsls r3, 24
	lsrs r5, r3, 8
	movs r3, 0
	cmp r5, 0
	beq _0809285A
	lsls r7, r1, 6
	ldr r6, _08092860 @ =0x00000fff
	lsls r4, r0, 12
_08092830:
	mov r0, r12
	adds r1, r0, r3
	lsls r1, 1
	adds r1, r7, r1
	ldr r0, _08092864 @ =0x06007800
	adds r2, r1, r0
	ldrh r0, [r2]
	ands r0, r6
	orrs r0, r4
	strh r0, [r2]
	ldr r0, _08092868 @ =0x06007840
	adds r1, r0
	ldrh r0, [r1]
	ands r0, r6
	orrs r0, r4
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r0, r5
	bcc _08092830
_0809285A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092860: .4byte 0x00000fff
_08092864: .4byte 0x06007800
_08092868: .4byte 0x06007840
	thumb_func_end sub_8092810

	thumb_func_start sub_809286C
sub_809286C: @ 809286C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0x1
	ands r5, r0
	ands r2, r0
	lsls r2, 1
	orrs r5, r2
	cmp r4, 0xA
	bhi _08092958
	lsls r0, r4, 2
	ldr r1, _08092894 @ =_08092898
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08092894: .4byte _08092898
	.align 2, 0
_08092898:
	.4byte _080928C4
	.4byte _080928C4
	.4byte _080928C4
	.4byte _080928D4
	.4byte _080928D4
	.4byte _080928EC
	.4byte _080928EC
	.4byte _080928D4
	.4byte _080928D4
	.4byte _08092914
	.4byte _08092904
_080928C4:
	ldr r1, _080928D0 @ =gUnknown_083B57E4
	lsls r0, r4, 3
	adds r0, r1
	ldrb r1, [r0, 0x4]
	ldrb r2, [r0, 0x5]
	b _08092932
	.align 2, 0
_080928D0: .4byte gUnknown_083B57E4
_080928D4:
	ldr r2, _08092900 @ =gUnknown_083B57FC
	subs r1, r4, 0x3
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	ldrb r2, [r0, 0x5]
	ldrb r3, [r0, 0x6]
	adds r0, r5, 0
	bl sub_8092810
_080928EC:
	ldr r2, _08092900 @ =gUnknown_083B57FC
	subs r1, r4, 0x3
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x7]
	ldrb r2, [r0, 0x8]
	ldrb r3, [r0, 0x9]
	b _08092934
	.align 2, 0
_08092900: .4byte gUnknown_083B57FC
_08092904:
	ldr r0, _08092910 @ =gUnknown_083B57FC
	ldrb r1, [r0, 0x1C]
	ldrb r2, [r0, 0x1D]
	ldrb r3, [r0, 0x1E]
	b _08092934
	.align 2, 0
_08092910: .4byte gUnknown_083B57FC
_08092914:
	bl IsNationalPokedexEnabled
	cmp r0, 0
	bne _08092940
	ldr r2, _0809293C @ =gUnknown_083B57FC
	subs r1, r4, 0x3
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	ldrb r2, [r0, 0x5]
	subs r2, 0x2
	lsls r2, 24
	lsrs r2, 24
_08092932:
	ldrb r3, [r0, 0x6]
_08092934:
	adds r0, r5, 0
	bl sub_8092810
	b _08092958
	.align 2, 0
_0809293C: .4byte gUnknown_083B57FC
_08092940:
	ldr r2, _08092960 @ =gUnknown_083B57FC
	subs r1, r4, 0x3
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	ldrb r2, [r0, 0x5]
	ldrb r3, [r0, 0x6]
	adds r0, r5, 0
	bl sub_8092810
_08092958:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08092960: .4byte gUnknown_083B57FC
	thumb_func_end sub_809286C

	thumb_func_start sub_8092964
sub_8092964: @ 8092964
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x1
	beq _080929CE
	cmp r0, 0x1
	bgt _0809297A
	cmp r0, 0
	beq _08092980
	b _08092AAC
_0809297A:
	cmp r1, 0x2
	beq _08092A3E
	b _08092AAC
_08092980:
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl sub_809286C
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x4
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0xA
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x5
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x6
	movs r1, 0x1
	movs r2, 0
	b _08092A1A
_080929CE:
	movs r0, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl sub_809286C
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0x4
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0xA
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0x5
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0x6
	movs r1, 0x1
	movs r2, 0x1
_08092A1A:
	bl sub_809286C
	movs r0, 0x7
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x8
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x9
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	b _08092AAC
_08092A3E:
	movs r0, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl sub_809286C
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0x4
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0xA
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0x5
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0x6
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0x7
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0x8
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0x9
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
_08092AAC:
	pop {r0}
	bx r0
	thumb_func_end sub_8092964

	thumb_func_start sub_8092AB0
sub_8092AB0: @ 8092AB0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_8092964
	ldr r0, _08092AD0 @ =gUnknown_083B57E4
	lsls r4, 3
	adds r4, r0
	ldr r0, [r4]
	bl sub_8091E20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08092AD0: .4byte gUnknown_083B57E4
	thumb_func_end sub_8092AB0

	thumb_func_start sub_8092AD4
sub_8092AD4: @ 8092AD4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	bl sub_8092964
	cmp r4, 0x6
	bhi _08092B4E
	lsls r0, r4, 2
	ldr r1, _08092AF0 @ =_08092AF4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08092AF0: .4byte _08092AF4
	.align 2, 0
_08092AF4:
	.4byte _08092B10
	.4byte _08092B14
	.4byte _08092B18
	.4byte _08092B26
	.4byte _08092B34
	.4byte _08092B38
	.4byte _08092B44
_08092B10:
	movs r0, 0x3
	b _08092B3A
_08092B14:
	movs r0, 0x4
	b _08092B3A
_08092B18:
	movs r0, 0xA
	movs r1, 0
	movs r2, 0
	bl sub_809286C
	movs r0, 0x5
	b _08092B3A
_08092B26:
	movs r0, 0xA
	movs r1, 0
	movs r2, 0
	bl sub_809286C
	movs r0, 0x6
	b _08092B3A
_08092B34:
	movs r0, 0x7
	b _08092B3A
_08092B38:
	movs r0, 0x8
_08092B3A:
	movs r1, 0
	movs r2, 0
	bl sub_809286C
	b _08092B4E
_08092B44:
	movs r0, 0x9
	movs r1, 0
	movs r2, 0
	bl sub_809286C
_08092B4E:
	ldr r0, _08092B64 @ =gUnknown_083B57FC
	lsls r1, r4, 1
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl sub_8091E20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08092B64: .4byte gUnknown_083B57FC
	thumb_func_end sub_8092AD4

	thumb_func_start sub_8092B68
sub_8092B68: @ 8092B68
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08092C68 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r6, r1, r2
	ldrh r0, [r6, 0x16]
	ldrh r1, [r6, 0x14]
	adds r0, r1
	lsls r0, 16
	ldr r7, _08092C6C @ =gStringVar1
	ldr r1, _08092C70 @ =gUnknown_083B5910
	lsrs r0, 13
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r7, 0
	bl StringCopy
	ldr r0, _08092C74 @ =gUnknown_083B5AB2
	mov r8, r0
	movs r1, 0x2D
	movs r2, 0x10
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	ldrh r0, [r6, 0x1A]
	ldrh r1, [r6, 0x18]
	adds r0, r1
	lsls r0, 16
	ldr r1, _08092C78 @ =gUnknown_083B5968
	lsrs r0, 13
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r7, 0
	bl StringCopy
	mov r0, r8
	movs r1, 0x2D
	movs r2, 0x20
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	ldrh r0, [r6, 0x1E]
	ldrh r1, [r6, 0x1C]
	adds r0, r1
	lsls r0, 16
	ldr r4, _08092C7C @ =gUnknown_083B59C8
	lsrs r0, 13
	adds r4, 0x4
	adds r0, r4
	ldr r1, [r0]
	adds r0, r7, 0
	bl StringCopy
	ldr r5, _08092C80 @ =gUnknown_083B5AAC
	adds r0, r5, 0
	movs r1, 0x2D
	movs r2, 0x30
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	ldrh r0, [r6, 0x22]
	ldrh r1, [r6, 0x20]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 13
	adds r0, r4
	ldr r1, [r0]
	adds r0, r7, 0
	bl StringCopy
	adds r0, r5, 0
	movs r1, 0x5D
	movs r2, 0x30
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	ldrh r0, [r6, 0x12]
	ldrh r1, [r6, 0x10]
	adds r0, r1
	lsls r0, 16
	ldr r1, _08092C84 @ =gUnknown_083B58D8
	lsrs r0, 13
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r7, 0
	bl StringCopy
	mov r0, r8
	movs r1, 0x2D
	movs r2, 0x40
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	bl IsNationalPokedexEnabled
	cmp r0, 0
	beq _08092C5E
	ldrh r0, [r6, 0xE]
	ldrh r6, [r6, 0xC]
	adds r0, r6
	lsls r0, 16
	ldr r1, _08092C88 @ =gUnknown_083B58C0
	lsrs r0, 13
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r7, 0
	bl StringCopy
	mov r0, r8
	movs r1, 0x2D
	movs r2, 0x50
	movs r3, 0x1
	bl MenuPrint_PixelCoords
_08092C5E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092C68: .4byte gTasks
_08092C6C: .4byte gStringVar1
_08092C70: .4byte gUnknown_083B5910
_08092C74: .4byte gUnknown_083B5AB2
_08092C78: .4byte gUnknown_083B5968
_08092C7C: .4byte gUnknown_083B59C8
_08092C80: .4byte gUnknown_083B5AAC
_08092C84: .4byte gUnknown_083B58D8
_08092C88: .4byte gUnknown_083B58C0
	thumb_func_end sub_8092B68

	thumb_func_start sub_8092C8C
sub_8092C8C: @ 8092C8C
	push {r4-r6,lr}
	lsls r0, 24
	cmp r0, 0
	bne _08092D48
	ldr r1, _08092D1C @ =0x06007822
	ldr r2, _08092D20 @ =0x00000c0b
	adds r0, r2, 0
	strh r0, [r1]
	movs r1, 0x12
	ldr r3, _08092D24 @ =0x06007800
	ldr r4, _08092D28 @ =0x0000080d
	adds r2, r4, 0
_08092CA4:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x1C
	bls _08092CA4
	ldr r1, _08092D2C @ =0x0600783a
	ldr r2, _08092D30 @ =0x0000080b
	adds r0, r2, 0
	strh r0, [r1]
	movs r3, 0x1
	ldr r6, _08092D24 @ =0x06007800
	movs r5, 0x2
_08092CC2:
	lsls r2, r3, 6
	ldr r4, _08092D1C @ =0x06007822
	adds r1, r2, r4
	ldr r4, _08092D34 @ =0x0000040a
	adds r0, r4, 0
	strh r0, [r1]
	movs r1, 0x12
	adds r4, r3, 0x1
	adds r3, r2, 0
_08092CD4:
	lsls r0, r1, 1
	adds r0, r3, r0
	adds r0, r6
	strh r5, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x1C
	bls _08092CD4
	ldr r1, _08092D2C @ =0x0600783a
	adds r0, r2, r1
	movs r1, 0xA
	strh r1, [r0]
	lsls r0, r4, 16
	lsrs r3, r0, 16
	cmp r3, 0xC
	bls _08092CC2
	ldr r1, _08092D38 @ =0x06007b62
	ldr r2, _08092D3C @ =0x0000040b
	adds r0, r2, 0
	strh r0, [r1]
	movs r1, 0x12
	ldr r3, _08092D40 @ =0x06007b40
	movs r2, 0xD
_08092D04:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x1C
	bls _08092D04
	ldr r1, _08092D44 @ =0x06007b7a
	movs r0, 0xB
	strh r0, [r1]
	b _08092D6E
	.align 2, 0
_08092D1C: .4byte 0x06007822
_08092D20: .4byte 0x00000c0b
_08092D24: .4byte 0x06007800
_08092D28: .4byte 0x0000080d
_08092D2C: .4byte 0x0600783a
_08092D30: .4byte 0x0000080b
_08092D34: .4byte 0x0000040a
_08092D38: .4byte 0x06007b62
_08092D3C: .4byte 0x0000040b
_08092D40: .4byte 0x06007b40
_08092D44: .4byte 0x06007b7a
_08092D48:
	movs r3, 0
	ldr r6, _08092D74 @ =0x06007800
	movs r5, 0x4F
_08092D4E:
	movs r1, 0x11
	adds r4, r3, 0x1
	lsls r2, r3, 6
_08092D54:
	lsls r0, r1, 1
	adds r0, r2, r0
	adds r0, r6
	strh r5, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x1D
	bls _08092D54
	lsls r0, r4, 16
	lsrs r3, r0, 16
	cmp r3, 0xD
	bls _08092D4E
_08092D6E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08092D74: .4byte 0x06007800
	thumb_func_end sub_8092C8C

	thumb_func_start sub_8092D78
sub_8092D78: @ 8092D78
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08092DBC @ =gUnknown_083B5A7C
	ldr r3, _08092DC0 @ =gTasks
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r0, r2, r3
	movs r5, 0xA
	ldrsh r1, [r0, r5]
	lsls r1, 3
	adds r1, r4
	ldr r6, [r1]
	adds r3, 0x8
	adds r2, r3
	ldrb r0, [r1, 0x4]
	lsls r0, 1
	adds r0, r2
	mov r8, r0
	ldrb r0, [r1, 0x5]
	lsls r0, 1
	adds r7, r2, r0
	movs r0, 0x12
	movs r1, 0x1
	movs r2, 0x1C
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	movs r5, 0
	ldrh r4, [r7]
	b _08092DE8
	.align 2, 0
_08092DBC: .4byte gUnknown_083B5A7C
_08092DC0: .4byte gTasks
_08092DC4:
	lsls r0, r4, 3
	adds r0, r6
	ldr r0, [r0, 0x4]
	lsls r2, r5, 1
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x12
	bl MenuPrint
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r5, 0x5
	bhi _08092DF2
_08092DE8:
	lsls r0, r4, 3
	adds r0, r6
	ldr r0, [r0, 0x4]
	cmp r0, 0
	bne _08092DC4
_08092DF2:
	mov r1, r8
	ldrh r0, [r1]
	ldrh r1, [r7]
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	ldr r0, [r0]
	bl sub_8091E20
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8092D78

	thumb_func_start sub_8092E10
sub_8092E10: @ 8092E10
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08092E50 @ =gTasks + 0x8
	adds r1, r0
	ldr r2, _08092E54 @ =gUnknown_083B5A7C
	lsls r0, r3, 3
	adds r0, r2
	ldrb r2, [r0, 0x4]
	lsls r2, 1
	adds r2, r1, r2
	ldrb r0, [r0, 0x5]
	lsls r0, 1
	adds r1, r0
	ldrh r0, [r1]
	ldrh r2, [r2]
	adds r0, r2
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r3, 0x5
	bhi _08092E74
	lsls r0, r3, 2
	ldr r1, _08092E58 @ =_08092E5C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08092E50: .4byte gTasks + 0x8
_08092E54: .4byte gUnknown_083B5A7C
_08092E58: .4byte _08092E5C
	.align 2, 0
_08092E5C:
	.4byte _08092E88
	.4byte _08092E92
	.4byte _08092EA2
	.4byte _08092EA2
	.4byte _08092E80
	.4byte _08092E78
_08092E74:
	movs r0, 0
	b _08092EA8
_08092E78:
	ldr r0, _08092E7C @ =gUnknown_083B5A60
	b _08092EA4
	.align 2, 0
_08092E7C: .4byte gUnknown_083B5A60
_08092E80:
	ldr r0, _08092E84 @ =gUnknown_083B5A62
	b _08092EA4
	.align 2, 0
_08092E84: .4byte gUnknown_083B5A62
_08092E88:
	cmp r2, 0
	beq _08092E96
	lsls r0, r2, 24
	lsrs r0, 24
	b _08092EA8
_08092E92:
	cmp r2, 0
	bne _08092E9A
_08092E96:
	movs r0, 0xFF
	b _08092EA8
_08092E9A:
	subs r0, r2, 0x1
	lsls r0, 24
	lsrs r0, 24
	b _08092EA8
_08092EA2:
	ldr r0, _08092EAC @ =gUnknown_083B5A68
_08092EA4:
	adds r0, r2, r0
	ldrb r0, [r0]
_08092EA8:
	pop {r1}
	bx r1
	.align 2, 0
_08092EAC: .4byte gUnknown_083B5A68
	thumb_func_end sub_8092E10

	thumb_func_start sub_8092EB0
sub_8092EB0: @ 8092EB0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08092ED0 @ =gPokedexView
	ldr r0, [r1]
	ldr r2, _08092ED4 @ =0x00000614
	adds r0, r2
	ldrh r0, [r0]
	adds r5, r1, 0
	cmp r0, 0
	beq _08092ECA
	cmp r0, 0x1
	beq _08092ED8
_08092ECA:
	movs r3, 0
	b _08092EDA
	.align 2, 0
_08092ED0: .4byte gPokedexView
_08092ED4: .4byte 0x00000614
_08092ED8:
	movs r3, 0x1
_08092EDA:
	ldr r1, _08092F00 @ =gTasks
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 3
	adds r0, r1
	strh r3, [r0, 0xC]
	ldr r0, [r5]
	movs r3, 0xC3
	lsls r3, 3
	adds r0, r3
	ldrh r0, [r0]
	adds r5, r1, 0
	cmp r0, 0x5
	bhi _08092F20
	lsls r0, 2
	ldr r1, _08092F04 @ =_08092F08
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08092F00: .4byte gTasks
_08092F04: .4byte _08092F08
	.align 2, 0
_08092F08:
	.4byte _08092F20
	.4byte _08092F24
	.4byte _08092F28
	.4byte _08092F2C
	.4byte _08092F30
	.4byte _08092F34
_08092F20:
	movs r3, 0
	b _08092F36
_08092F24:
	movs r3, 0x1
	b _08092F36
_08092F28:
	movs r3, 0x2
	b _08092F36
_08092F2C:
	movs r3, 0x3
	b _08092F36
_08092F30:
	movs r3, 0x4
	b _08092F36
_08092F34:
	movs r3, 0x5
_08092F36:
	adds r0, r2, r4
	lsls r0, 3
	adds r0, r5
	strh r3, [r0, 0x10]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8092EB0

	thumb_func_start sub_8092F44
sub_8092F44: @ 8092F44
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08092F7C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r0, r1, r3
	ldrb r2, [r0, 0xA]
	adds r3, 0x8
	adds r1, r3
	ldr r0, _08092F80 @ =gUnknown_083B5A7C
	lsls r2, 3
	adds r2, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 1
	adds r1, r0
	ldrh r0, [r2, 0x6]
	subs r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x5
	bls _08092F84
	ldrh r0, [r1]
	cmp r0, 0
	beq _08092F84
	movs r0, 0
	b _08092F86
	.align 2, 0
_08092F7C: .4byte gTasks
_08092F80: .4byte gUnknown_083B5A7C
_08092F84:
	movs r0, 0x1
_08092F86:
	pop {r1}
	bx r1
	thumb_func_end sub_8092F44

	thumb_func_start sub_8092F8C
sub_8092F8C: @ 8092F8C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08092FC8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r0, r1, r3
	ldrb r2, [r0, 0xA]
	adds r3, 0x8
	adds r1, r3
	ldr r0, _08092FCC @ =gUnknown_083B5A7C
	lsls r2, 3
	adds r2, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 1
	adds r1, r0
	ldrh r0, [r2, 0x6]
	subs r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x5
	bls _08092FD0
	ldrh r1, [r1]
	subs r0, 0x5
	cmp r1, r0
	bge _08092FD0
	movs r0, 0
	b _08092FD2
	.align 2, 0
_08092FC8: .4byte gTasks
_08092FCC: .4byte gUnknown_083B5A7C
_08092FD0:
	movs r0, 0x1
_08092FD2:
	pop {r1}
	bx r1
	thumb_func_end sub_8092F8C

	thumb_func_start sub_8092FD8
sub_8092FD8: @ 8092FD8
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, _08093018 @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0809301C @ =sub_8092644
	cmp r1, r0
	bne _08093078
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08093020
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8092F8C
	lsls r0, 24
	cmp r0, 0
	beq _0809303C
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	b _08093048
	.align 2, 0
_08093018: .4byte gTasks
_0809301C: .4byte sub_8092644
_08093020:
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8092F44
	lsls r0, 24
	cmp r0, 0
	beq _0809303C
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	b _08093048
_0809303C:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
_08093048:
	strb r0, [r2]
	ldrh r2, [r4, 0x32]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	lsls r0, 7
	adds r0, r2, r0
	lsls r0, 24
	ldr r1, _08093074 @ =gSineTable
	lsrs r0, 23
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _08093066
	adds r0, 0x7F
_08093066:
	asrs r0, 7
	strh r0, [r4, 0x26]
	adds r0, r2, 0
	adds r0, 0x8
	strh r0, [r4, 0x32]
	b _08093084
	.align 2, 0
_08093074: .4byte gSineTable
_08093078:
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_08093084:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8092FD8

	thumb_func_start sub_809308C
sub_809308C: @ 809308C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _08093104 @ =gSpriteTemplate_83A053C
	adds r0, r6, 0
	movs r1, 0xB8
	movs r2, 0x4
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08093108 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r0, r1, r4
	movs r2, 0
	strh r5, [r0, 0x2E]
	strh r2, [r0, 0x30]
	movs r0, 0x1C
	adds r0, r4
	mov r9, r0
	add r1, r9
	ldr r0, _0809310C @ =sub_8092FD8
	mov r8, r0
	str r0, [r1]
	adds r0, r6, 0
	movs r1, 0xB8
	movs r2, 0x6C
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r4, r1, r4
	strh r5, [r4, 0x2E]
	movs r0, 0x1
	strh r0, [r4, 0x30]
	adds r4, 0x3F
	ldrb r0, [r4]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r4]
	add r1, r9
	mov r0, r8
	str r0, [r1]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08093104: .4byte gSpriteTemplate_83A053C
_08093108: .4byte gSprites
_0809310C: .4byte sub_8092FD8
	thumb_func_end sub_809308C

	.align 2, 0 @ Don't pad with nop.
