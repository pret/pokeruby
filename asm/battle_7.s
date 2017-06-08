	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80318FC
sub_80318FC: @ 80318FC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	mov r8, r0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	movs r1, 0
	bl GetMonData
	str r0, [sp, 0xC]
	mov r0, r9
	lsls r1, r0, 2
	ldr r0, _08031938 @ =0x02017800
	adds r2, r1, r0
	ldrh r0, [r2, 0x2]
	cmp r0, 0
	bne _0803193C
	mov r0, r8
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r7, [sp, 0xC]
	b _08031944
	.align 2, 0
_08031938: .4byte 0x02017800
_0803193C:
	ldrh r6, [r2, 0x2]
	ldr r0, _080319A0 @ =gUnknown_02024E70
	adds r0, r1, r0
	ldr r7, [r0]
_08031944:
	mov r0, r8
	movs r1, 0x1
	bl GetMonData
	mov r10, r0
	mov r0, r9
	bl battle_get_per_side_status
	lsls r0, 24
	lsls r5, r6, 3
	ldr r1, _080319A4 @ =gMonBackPicTable
	adds r5, r1
	ldr r1, _080319A8 @ =gMonBackPicCoords
	lsls r2, r6, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _080319AC @ =gUnknown_081FAF4C
	lsrs r0, 22
	adds r0, r4
	ldr r0, [r0]
	str r0, [sp]
	str r6, [sp, 0x4]
	str r7, [sp, 0x8]
	adds r0, r5, 0
	bl HandleLoadSpecialPokePic
	mov r1, r9
	lsls r2, r1, 4
	movs r0, 0x80
	lsls r0, 1
	adds r7, r2, r0
	lsls r1, 2
	ldr r0, _080319B0 @ =0x02017800
	adds r0, r1, r0
	ldrh r0, [r0, 0x2]
	str r1, [sp, 0x10]
	adds r4, r2, 0
	cmp r0, 0
	bne _080319B4
	mov r0, r8
	bl pokemon_get_pal
	b _080319BE
	.align 2, 0
_080319A0: .4byte gUnknown_02024E70
_080319A4: .4byte gMonBackPicTable
_080319A8: .4byte gMonBackPicCoords
_080319AC: .4byte gUnknown_081FAF4C
_080319B0: .4byte 0x02017800
_080319B4:
	adds r0, r6, 0
	mov r1, r10
	ldr r2, [sp, 0xC]
	bl species_and_otid_get_pal
_080319BE:
	adds r5, r0, 0
	ldr r1, _08031A48 @ =0x02000000
	mov r8, r1
	adds r0, r5, 0
	bl sub_800D238
	mov r0, r8
	adds r1, r7, 0
	movs r2, 0x20
	bl LoadPalette
	adds r1, r4, 0
	adds r1, 0x80
	mov r0, r8
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08031A4C @ =SPECIES_CASTFORM
	cmp r6, r0
	bne _08031A0A
	subs r0, 0x81
	adds r7, r4, r0
	movs r4, 0xB2
	lsls r4, 9
	add r4, r8
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_800D238
	ldr r0, _08031A50 @ =gBattleMonForms
	add r0, r9
	ldrb r0, [r0]
	lsls r0, 5
	adds r0, r4
	adds r1, r7, 0
	movs r2, 0x20
	bl LoadPalette
_08031A0A:
	movs r0, 0xBC
	lsls r0, 9
	add r0, r8
	ldr r1, [sp, 0x10]
	adds r0, r1, r0
	ldrh r0, [r0, 0x2]
	cmp r0, 0
	beq _08031A36
	ldr r3, _08031A54 @ =0x00007fff
	adds r0, r7, 0
	movs r1, 0x10
	movs r2, 0x6
	bl BlendPalette
	lsls r1, r7, 1
	ldr r0, _08031A58 @ =gPlttBufferFaded
	adds r0, r1, r0
	ldr r2, _08031A5C @ =gPlttBufferUnfaded
	adds r1, r2
	ldr r2, _08031A60 @ =REG_BG0CNT
	bl CpuSet
_08031A36:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08031A48: .4byte 0x02000000
_08031A4C: .4byte SPECIES_CASTFORM
_08031A50: .4byte gBattleMonForms
_08031A54: .4byte 0x00007fff
_08031A58: .4byte gPlttBufferFaded
_08031A5C: .4byte gPlttBufferUnfaded
_08031A60: .4byte REG_BG0CNT
	thumb_func_end sub_80318FC

	thumb_func_start unref_sub_8031A64
unref_sub_8031A64: @ 8031A64
	bx lr
	thumb_func_end unref_sub_8031A64

	thumb_func_start nullsub_9
nullsub_9: @ 8031A68
	bx lr
	thumb_func_end nullsub_9

	thumb_func_start sub_8031A6C
sub_8031A6C: @ 8031A6C
	push {r4-r6,lr}
	sub sp, 0x10
	adds r4, r0, 0
	adds r0, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_per_side_status
	lsls r0, 24
	lsls r6, r4, 3
	ldr r5, _08031ADC @ =gTrainerFrontPicTable
	adds r5, r6, r5
	ldr r1, _08031AE0 @ =gTrainerFrontPicCoords
	lsls r4, 2
	adds r4, r1
	ldrb r1, [r4]
	ldrb r2, [r4, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08031AE4 @ =gUnknown_081FAF4C
	lsrs r0, 22
	adds r0, r4
	ldr r4, [r0]
	str r4, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	adds r0, r5, 0
	bl DecompressPicFromTable_2
	str r4, [sp, 0x8]
	ldrh r2, [r5, 0x4]
	ldr r0, _08031AE8 @ =0xffff0000
	ldr r1, [sp, 0xC]
	ands r1, r0
	orrs r1, r2
	str r1, [sp, 0xC]
	ldrh r2, [r5, 0x6]
	lsls r2, 16
	ldr r0, _08031AEC @ =0x0000ffff
	ands r0, r1
	orrs r0, r2
	str r0, [sp, 0xC]
	add r0, sp, 0x8
	bl LoadCompressedObjectPic
	ldr r0, _08031AF0 @ =gTrainerFrontPicPaletteTable
	adds r6, r0
	adds r0, r6, 0
	bl LoadCompressedObjectPalette
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08031ADC: .4byte gTrainerFrontPicTable
_08031AE0: .4byte gTrainerFrontPicCoords
_08031AE4: .4byte gUnknown_081FAF4C
_08031AE8: .4byte 0xffff0000
_08031AEC: .4byte 0x0000ffff
_08031AF0: .4byte gTrainerFrontPicPaletteTable
	thumb_func_end sub_8031A6C

	thumb_func_start sub_8031AF4
sub_8031AF4: @ 8031AF4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	adds r0, r5, 0
	bl battle_get_per_side_status
	lsls r0, 24
	lsls r1, r4, 3
	mov r8, r1
	ldr r6, _08031B60 @ =gTrainerBackPicTable
	add r6, r8
	ldr r1, _08031B64 @ =gTrainerBackPicCoords
	lsls r4, 2
	adds r4, r1
	ldrb r1, [r4]
	ldrb r2, [r4, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08031B68 @ =gUnknown_081FAF4C
	lsrs r0, 22
	adds r0, r4
	ldr r0, [r0]
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	adds r0, r6, 0
	bl DecompressPicFromTable_2
	ldr r0, _08031B6C @ =gTrainerBackPicPaletteTable
	add r8, r0
	mov r1, r8
	ldr r0, [r1]
	lsls r5, 20
	movs r1, 0x80
	lsls r1, 17
	adds r5, r1
	lsrs r5, 16
	adds r1, r5, 0
	movs r2, 0x20
	bl LoadCompressedPalette
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08031B60: .4byte gTrainerBackPicTable
_08031B64: .4byte gTrainerBackPicCoords
_08031B68: .4byte gUnknown_081FAF4C
_08031B6C: .4byte gTrainerBackPicPaletteTable
	thumb_func_end sub_8031AF4

	thumb_func_start nullsub_10
nullsub_10: @ 8031B70
	bx lr
	thumb_func_end nullsub_10

	thumb_func_start sub_8031B74
sub_8031B74: @ 8031B74
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	ldr r0, _08031B98 @ =gTrainerFrontPicPaletteTable
	lsrs r4, 13
	adds r0, r4, r0
	ldrh r0, [r0, 0x4]
	bl FreeSpritePaletteByTag
	ldr r0, _08031B9C @ =gTrainerFrontPicTable
	adds r4, r0
	ldrh r0, [r4, 0x6]
	bl FreeSpriteTilesByTag
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08031B98: .4byte gTrainerFrontPicPaletteTable
_08031B9C: .4byte gTrainerFrontPicTable
	thumb_func_end sub_8031B74

	thumb_func_start unref_sub_8031BA0
unref_sub_8031BA0: @ 8031BA0
	push {r4-r7,lr}
	ldr r4, _08031BCC @ =gUnknown_0820A4D4
	adds r0, r4, 0
	bl LoadSpritePalette
	adds r4, 0x8
	adds r0, r4, 0
	bl LoadSpritePalette
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	bne _08031BD8
	ldr r0, _08031BD0 @ =gUnknown_0820A47C
	bl LoadCompressedObjectPic
	ldr r0, _08031BD4 @ =gUnknown_0820A484
	bl LoadCompressedObjectPic
	movs r5, 0x2
	b _08031BFA
	.align 2, 0
_08031BCC: .4byte gUnknown_0820A4D4
_08031BD0: .4byte gUnknown_0820A47C
_08031BD4: .4byte gUnknown_0820A484
_08031BD8:
	ldr r4, _08031C20 @ =gUnknown_0820A48C
	adds r0, r4, 0
	bl LoadCompressedObjectPic
	adds r4, 0x8
	adds r0, r4, 0
	bl LoadCompressedObjectPic
	ldr r4, _08031C24 @ =gUnknown_0820A49C
	adds r0, r4, 0
	bl LoadCompressedObjectPic
	adds r4, 0x8
	adds r0, r4, 0
	bl LoadCompressedObjectPic
	movs r5, 0x4
_08031BFA:
	movs r4, 0
	cmp r4, r5
	bcs _08031C1A
	ldr r7, _08031C28 @ =gUnknown_02024A72
	ldr r6, _08031C2C @ =gUnknown_0820A4B4
_08031C04:
	adds r0, r4, r7
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r6
	bl LoadCompressedObjectPic
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _08031C04
_08031C1A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08031C20: .4byte gUnknown_0820A48C
_08031C24: .4byte gUnknown_0820A49C
_08031C28: .4byte gUnknown_02024A72
_08031C2C: .4byte gUnknown_0820A4B4
	thumb_func_end unref_sub_8031BA0

	thumb_func_start sub_8031C30
sub_8031C30: @ 8031C30
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	movs r6, 0
	cmp r4, 0
	bne _08031C40
	b _08031D52
_08031C40:
	cmp r4, 0x1
	bne _08031C5C
	ldr r4, _08031C58 @ =gUnknown_0820A4D4
	adds r0, r4, 0
	bl LoadSpritePalette
	adds r4, 0x8
	adds r0, r4, 0
	bl LoadSpritePalette
	b _08031D52
	.align 2, 0
_08031C58: .4byte gUnknown_0820A4D4
_08031C5C:
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	bne _08031CC4
	cmp r4, 0x2
	bne _08031C94
	ldr r0, _08031C80 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08031C88
	ldr r0, _08031C84 @ =gUnknown_0820A4AC
	bl LoadCompressedObjectPic
	b _08031D52
	.align 2, 0
_08031C80: .4byte gBattleTypeFlags
_08031C84: .4byte gUnknown_0820A4AC
_08031C88:
	ldr r0, _08031C90 @ =gUnknown_0820A47C
	bl LoadCompressedObjectPic
	b _08031D52
	.align 2, 0
_08031C90: .4byte gUnknown_0820A47C
_08031C94:
	cmp r4, 0x3
	bne _08031CA4
	ldr r0, _08031CA0 @ =gUnknown_0820A484
	bl LoadCompressedObjectPic
	b _08031D52
	.align 2, 0
_08031CA0: .4byte gUnknown_0820A484
_08031CA4:
	cmp r4, 0x4
	bne _08031CB4
	ldr r0, _08031CB0 @ =gUnknown_02024A72
	ldrb r0, [r0]
	b _08031D3C
	.align 2, 0
_08031CB0: .4byte gUnknown_02024A72
_08031CB4:
	cmp r4, 0x5
	bne _08031D50
	ldr r0, _08031CC0 @ =gUnknown_02024A72
	ldrb r0, [r0, 0x1]
	b _08031D3C
	.align 2, 0
_08031CC0: .4byte gUnknown_02024A72
_08031CC4:
	cmp r4, 0x2
	bne _08031CD4
	ldr r0, _08031CD0 @ =gUnknown_0820A48C
	bl LoadCompressedObjectPic
	b _08031D52
	.align 2, 0
_08031CD0: .4byte gUnknown_0820A48C
_08031CD4:
	cmp r4, 0x3
	bne _08031CE4
	ldr r0, _08031CE0 @ =gUnknown_0820A494
	bl LoadCompressedObjectPic
	b _08031D52
	.align 2, 0
_08031CE0: .4byte gUnknown_0820A494
_08031CE4:
	cmp r4, 0x4
	bne _08031CF4
	ldr r0, _08031CF0 @ =gUnknown_0820A49C
	bl LoadCompressedObjectPic
	b _08031D52
	.align 2, 0
_08031CF0: .4byte gUnknown_0820A49C
_08031CF4:
	cmp r4, 0x5
	bne _08031D04
	ldr r0, _08031D00 @ =gUnknown_0820A4A4
	bl LoadCompressedObjectPic
	b _08031D52
	.align 2, 0
_08031D00: .4byte gUnknown_0820A4A4
_08031D04:
	cmp r4, 0x6
	bne _08031D14
	ldr r0, _08031D10 @ =gUnknown_02024A72
	ldrb r0, [r0]
	b _08031D3C
	.align 2, 0
_08031D10: .4byte gUnknown_02024A72
_08031D14:
	cmp r4, 0x7
	bne _08031D24
	ldr r0, _08031D20 @ =gUnknown_02024A72
	ldrb r0, [r0, 0x1]
	b _08031D3C
	.align 2, 0
_08031D20: .4byte gUnknown_02024A72
_08031D24:
	cmp r4, 0x8
	bne _08031D34
	ldr r0, _08031D30 @ =gUnknown_02024A72
	ldrb r0, [r0, 0x2]
	b _08031D3C
	.align 2, 0
_08031D30: .4byte gUnknown_02024A72
_08031D34:
	cmp r5, 0x9
	bne _08031D50
	ldr r0, _08031D48 @ =gUnknown_02024A72
	ldrb r0, [r0, 0x3]
_08031D3C:
	lsls r0, 3
	ldr r1, _08031D4C @ =gUnknown_0820A4B4
	adds r0, r1
	bl LoadCompressedObjectPic
	b _08031D52
	.align 2, 0
_08031D48: .4byte gUnknown_02024A72
_08031D4C: .4byte gUnknown_0820A4B4
_08031D50:
	movs r6, 0x1
_08031D52:
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8031C30

	thumb_func_start load_gfxc_health_bar
load_gfxc_health_bar: @ 8031D5C
	push {lr}
	ldr r0, _08031D6C @ =gUnknown_08D09C48
	movs r1, 0x80
	lsls r1, 18
	bl sub_800D238
	pop {r0}
	bx r0
	.align 2, 0
_08031D6C: .4byte gUnknown_08D09C48
	thumb_func_end load_gfxc_health_bar

	thumb_func_start battle_load_something
battle_load_something: @ 8031D70
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r6, 0
	ldrb r0, [r5]
	cmp r0, 0x6
	bls _08031D80
	b _08031EDE
_08031D80:
	lsls r0, 2
	ldr r1, _08031D8C @ =_08031D90
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08031D8C: .4byte _08031D90
	.align 2, 0
_08031D90:
	.4byte _08031DAC
	.4byte _08031DB2
	.4byte _08031EBC
	.4byte _08031DC8
	.4byte _08031DF8
	.4byte _08031E34
	.4byte _08031ED4
_08031DAC:
	bl sub_8031F0C
	b _08031EBC
_08031DB2:
	ldrb r0, [r4]
	bl sub_8031C30
	lsls r0, 24
	cmp r0, 0
	beq _08031DC0
	b _08031EB8
_08031DC0:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08031EDE
_08031DC8:
	ldr r0, _08031DE0 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08031DE4
	ldrb r0, [r4]
	cmp r0, 0
	bne _08031DE4
	bl battle_make_oam_safari_battle
	b _08031DEA
	.align 2, 0
_08031DE0: .4byte gBattleTypeFlags
_08031DE4:
	ldrb r0, [r4]
	bl battle_make_oam_normal_battle
_08031DEA:
	ldr r2, _08031DF4 @ =gUnknown_03004340
	ldrb r1, [r4]
	adds r1, r2
	strb r0, [r1]
	b _08031EA6
	.align 2, 0
_08031DF4: .4byte gUnknown_03004340
_08031DF8:
	ldrb r0, [r4]
	bl sub_8043F44
	ldr r0, _08031E18 @ =gUnknown_02024A72
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0x1
	bhi _08031E20
	ldr r0, _08031E1C @ =gUnknown_03004340
	adds r0, r1, r0
	ldrb r0, [r0]
	movs r1, 0
	bl nullsub_11
	b _08031EA6
	.align 2, 0
_08031E18: .4byte gUnknown_02024A72
_08031E1C: .4byte gUnknown_03004340
_08031E20:
	ldr r0, _08031E30 @ =gUnknown_03004340
	adds r0, r1, r0
	ldrb r0, [r0]
	movs r1, 0x1
	bl nullsub_11
	b _08031EA6
	.align 2, 0
_08031E30: .4byte gUnknown_03004340
_08031E34:
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08031E7C
	ldr r0, _08031E6C @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08031E9A
	ldr r0, _08031E70 @ =gUnknown_03004340
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _08031E74 @ =gUnknown_02024A6A
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _08031E78 @ =gPlayerParty
	adds r1, r2
	movs r2, 0
	bl sub_8045A5C
	b _08031E9A
	.align 2, 0
_08031E6C: .4byte gBattleTypeFlags
_08031E70: .4byte gUnknown_03004340
_08031E74: .4byte gUnknown_02024A6A
_08031E78: .4byte gPlayerParty
_08031E7C:
	ldr r0, _08031EC4 @ =gUnknown_03004340
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _08031EC8 @ =gUnknown_02024A6A
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _08031ECC @ =gEnemyParty
	adds r1, r2
	movs r2, 0
	bl sub_8045A5C
_08031E9A:
	ldr r1, _08031EC4 @ =gUnknown_03004340
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8043DB0
_08031EA6:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08031ED0 @ =gUnknown_02024A68
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bne _08031EDE
_08031EB8:
	movs r0, 0
	strb r0, [r4]
_08031EBC:
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	b _08031EDE
	.align 2, 0
_08031EC4: .4byte gUnknown_03004340
_08031EC8: .4byte gUnknown_02024A6A
_08031ECC: .4byte gEnemyParty
_08031ED0: .4byte gUnknown_02024A68
_08031ED4:
	bl sub_80327CC
	bl sub_8094958
	movs r6, 0x1
_08031EDE:
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end battle_load_something

	thumb_func_start sub_8031EE8
sub_8031EE8: @ 8031EE8
	push {r4,lr}
	ldr r4, _08031F08 @ =0x02017810
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x30
	bl memset
	adds r4, 0x30
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x10
	bl memset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08031F08: .4byte 0x02017810
	thumb_func_end sub_8031EE8

	thumb_func_start sub_8031F0C
sub_8031F0C: @ 8031F0C
	push {lr}
	bl sub_8031EE8
	ldr r0, _08031F20 @ =0x02017800
	movs r1, 0
	movs r2, 0x10
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_08031F20: .4byte 0x02017800
	thumb_func_end sub_8031F0C

	thumb_func_start sub_8031F24
sub_8031F24: @ 8031F24
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r4, 0
	ldr r5, _08031F78 @ =gUnknown_02024A68
	ldrb r0, [r5]
	cmp r4, r0
	bge _08031F6E
	ldr r0, _08031F7C @ =gSprites
	mov r8, r0
	movs r7, 0x1
	movs r0, 0x2
	negs r0, r0
	mov r12, r0
	ldr r6, _08031F80 @ =gUnknown_02024BE0
	ldr r3, _08031F84 @ =0x02017800
_08031F44:
	adds r0, r4, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	adds r0, 0x3E
	ldrb r1, [r0]
	lsls r1, 29
	lsrs r1, 31
	ands r1, r7
	ldrb r2, [r3]
	mov r0, r12
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	adds r3, 0x4
	adds r4, 0x1
	ldrb r0, [r5]
	cmp r4, r0
	blt _08031F44
_08031F6E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08031F78: .4byte gUnknown_02024A68
_08031F7C: .4byte gSprites
_08031F80: .4byte gUnknown_02024BE0
_08031F84: .4byte 0x02017800
	thumb_func_end sub_8031F24

	thumb_func_start sub_8031F88
sub_8031F88: @ 8031F88
	lsls r0, 24
	lsrs r0, 24
	lsls r3, r0, 2
	ldr r1, _08031FB8 @ =0x02017800
	adds r3, r1
	ldr r2, _08031FBC @ =gSprites
	ldr r1, _08031FC0 @ =gUnknown_02024BE0
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	lsls r1, 29
	lsrs r1, 31
	ldrb r2, [r3]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bx lr
	.align 2, 0
_08031FB8: .4byte 0x02017800
_08031FBC: .4byte gSprites
_08031FC0: .4byte gUnknown_02024BE0
	thumb_func_end sub_8031F88

	thumb_func_start sub_8031FC4
sub_8031FC4: @ 8031FC4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp, 0xC]
	lsls r2, 24
	cmp r2, 0
	beq _08032088
	ldr r0, _08032064 @ =gUnknown_02024BE0
	mov r1, r8
	adds r6, r1, r0
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r7, _08032068 @ =gSprites
	adds r0, r7
	ldr r4, _0803206C @ =0x02017840
	ldrb r1, [r4]
	bl StartSpriteAnim
	mov r2, r8
	lsls r0, r2, 20
	movs r5, 0x80
	lsls r5, 17
	adds r0, r5
	lsrs r5, r0, 16
	ldrh r0, [r4]
	lsls r0, 5
	ldr r2, _08032070 @ =0xffffebc0
	adds r1, r4, r2
	adds r0, r1
	adds r1, r5, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08032074 @ =gBattleMonForms
	add r0, r8
	ldrh r1, [r4]
	strb r1, [r0]
	mov r1, r8
	lsls r0, r1, 2
	subs r4, 0x40
	adds r0, r4
	ldrh r0, [r0, 0x2]
	cmp r0, 0
	beq _0803204C
	ldr r3, _08032078 @ =0x00007fff
	adds r0, r5, 0
	movs r1, 0x10
	movs r2, 0x6
	bl BlendPalette
	lsls r1, r5, 1
	ldr r0, _0803207C @ =gPlttBufferFaded
	adds r0, r1, r0
	ldr r2, _08032080 @ =gPlttBufferUnfaded
	adds r1, r2
	ldr r2, _08032084 @ =REG_BG0CNT
	bl CpuSet
_0803204C:
	mov r0, r8
	bl sub_8077F68
	ldrb r2, [r6]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r7
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x22]
	b _080322F6
	.align 2, 0
_08032064: .4byte gUnknown_02024BE0
_08032068: .4byte gSprites
_0803206C: .4byte 0x02017840
_08032070: .4byte 0xffffebc0
_08032074: .4byte gBattleMonForms
_08032078: .4byte 0x00007fff
_0803207C: .4byte gPlttBufferFaded
_08032080: .4byte gPlttBufferUnfaded
_08032084: .4byte REG_BG0CNT
_08032088:
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _080320D0
	movs r2, 0
	mov r10, r2
	ldr r5, _080320C0 @ =0x02019348
	ldrh r7, [r5, 0x2]
	ldr r4, [r5, 0x8]
	mov r9, r4
	ldr r6, [r5, 0xC]
	lsls r0, r7, 3
	ldr r1, _080320C4 @ =gMonBackPicTable
	adds r0, r1
	ldr r1, _080320C8 @ =gMonBackPicCoords
	lsls r2, r7, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _080320CC @ =gUnknown_081FAF4C
	ldr r4, [r4]
	str r4, [sp]
	str r7, [sp, 0x4]
	ldr r4, [r5, 0x10]
	b _08032184
	.align 2, 0
_080320C0: .4byte 0x02019348
_080320C4: .4byte gMonBackPicTable
_080320C8: .4byte gMonBackPicCoords
_080320CC: .4byte gUnknown_081FAF4C
_080320D0:
	mov r0, r8
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, [sp, 0xC]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08032104
	ldr r1, _080320FC @ =gUnknown_02024A6A
	ldr r5, [sp, 0xC]
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08032100 @ =gEnemyParty
	b _08032114
	.align 2, 0
_080320FC: .4byte gUnknown_02024A6A
_08032100: .4byte gEnemyParty
_08032104:
	ldr r1, _0803218C @ =gUnknown_02024A6A
	ldr r2, [sp, 0xC]
	lsls r0, r2, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08032190 @ =gPlayerParty
_08032114:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r7, r0, 16
	mov r0, r8
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080321A4
	ldr r0, _0803218C @ =gUnknown_02024A6A
	mov r5, r8
	lsls r4, r5, 1
	adds r4, r0
	ldrh r0, [r4]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _08032190 @ =gPlayerParty
	adds r0, r5
	movs r1, 0
	bl GetMonData
	mov r9, r0
	ldrh r0, [r4]
	muls r0, r6
	adds r0, r5
	movs r1, 0x1
	bl GetMonData
	adds r6, r0, 0
	lsls r0, r7, 3
	ldr r1, _08032194 @ =gMonBackPicTable
	adds r0, r1
	ldr r1, _08032198 @ =gMonBackPicCoords
	lsls r2, r7, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _0803219C @ =gUnknown_081FAF4C
	mov r12, r4
	mov r5, r10
	lsls r4, r5, 2
	add r4, r12
	ldr r4, [r4]
	str r4, [sp]
	str r7, [sp, 0x4]
	ldr r4, _080321A0 @ =gUnknown_02024E70
	mov r12, r4
	mov r5, r8
	lsls r4, r5, 2
	add r4, r12
	ldr r4, [r4]
_08032184:
	str r4, [sp, 0x8]
	bl HandleLoadSpecialPokePic
	b _08032202
	.align 2, 0
_0803218C: .4byte gUnknown_02024A6A
_08032190: .4byte gPlayerParty
_08032194: .4byte gMonBackPicTable
_08032198: .4byte gMonBackPicCoords
_0803219C: .4byte gUnknown_081FAF4C
_080321A0: .4byte gUnknown_02024E70
_080321A4:
	ldr r0, _08032308 @ =gUnknown_02024A6A
	mov r1, r8
	lsls r4, r1, 1
	adds r4, r0
	ldrh r0, [r4]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _0803230C @ =gEnemyParty
	adds r0, r5
	movs r1, 0
	bl GetMonData
	mov r9, r0
	ldrh r0, [r4]
	muls r0, r6
	adds r0, r5
	movs r1, 0x1
	bl GetMonData
	adds r6, r0, 0
	lsls r0, r7, 3
	ldr r1, _08032310 @ =gMonFrontPicTable
	adds r0, r1
	ldr r1, _08032314 @ =gMonFrontPicCoords
	lsls r2, r7, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08032318 @ =gUnknown_081FAF4C
	mov r12, r4
	mov r5, r10
	lsls r4, r5, 2
	add r4, r12
	ldr r4, [r4]
	str r4, [sp]
	str r7, [sp, 0x4]
	ldr r4, _0803231C @ =gUnknown_02024E70
	mov r12, r4
	mov r5, r8
	lsls r4, r5, 2
	add r4, r12
	ldr r4, [r4]
	str r4, [sp, 0x8]
	bl HandleLoadSpecialPokePic
_08032202:
	ldr r1, _08032318 @ =gUnknown_081FAF4C
	mov r2, r10
	lsls r0, r2, 2
	adds r0, r1
	ldr r2, [r0]
	ldr r0, _08032320 @ =gUnknown_02024BE0
	add r0, r8
	mov r10, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08032324 @ =gSprites
	adds r0, r4
	ldrh r0, [r0, 0x4]
	lsls r0, 22
	lsrs r0, 17
	ldr r1, _08032328 @ =0x06010000
	adds r0, r1
	ldr r1, _0803232C @ =0x040000d4
	str r2, [r1]
	str r0, [r1, 0x4]
	ldr r0, _08032330 @ =0x84000200
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r5, r8
	lsls r0, r5, 20
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r5, r0, 16
	adds r0, r7, 0
	adds r1, r6, 0
	mov r2, r9
	bl species_and_otid_get_pal
	adds r6, r0, 0
	ldr r2, _08032334 @ =0x02000000
	mov r9, r2
	mov r1, r9
	bl sub_800D238
	mov r0, r9
	adds r1, r5, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08032338 @ =SPECIES_CASTFORM
	cmp r7, r0
	bne _08032288
	movs r4, 0xB2
	lsls r4, 9
	add r4, r9
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_800D238
	ldr r0, _0803233C @ =gBattleMonForms
	ldr r1, [sp, 0xC]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, 5
	adds r0, r4
	adds r1, r5, 0
	movs r2, 0x20
	bl LoadPalette
_08032288:
	ldr r3, _08032340 @ =0x00007fff
	adds r0, r5, 0
	movs r1, 0x10
	movs r2, 0x6
	bl BlendPalette
	lsls r1, r5, 1
	ldr r0, _08032344 @ =gPlttBufferFaded
	adds r0, r1, r0
	ldr r2, _08032348 @ =gPlttBufferUnfaded
	adds r1, r2
	ldr r2, _0803234C @ =REG_BG0CNT
	bl CpuSet
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080322C8
	mov r2, r8
	lsls r0, r2, 2
	movs r1, 0xBC
	lsls r1, 9
	add r1, r9
	adds r0, r1
	strh r7, [r0, 0x2]
	ldr r0, _0803233C @ =gBattleMonForms
	adds r1, r2, r0
	ldr r4, [sp, 0xC]
	adds r0, r4, r0
	ldrb r0, [r0]
	strb r0, [r1]
_080322C8:
	mov r0, r8
	bl sub_8077F68
	mov r5, r10
	ldrb r2, [r5]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	ldr r2, _08032324 @ =gSprites
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x22]
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _0803233C @ =gBattleMonForms
	add r1, r8
	ldrb r1, [r1]
	bl StartSpriteAnim
_080322F6:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032308: .4byte gUnknown_02024A6A
_0803230C: .4byte gEnemyParty
_08032310: .4byte gMonFrontPicTable
_08032314: .4byte gMonFrontPicCoords
_08032318: .4byte gUnknown_081FAF4C
_0803231C: .4byte gUnknown_02024E70
_08032320: .4byte gUnknown_02024BE0
_08032324: .4byte gSprites
_08032328: .4byte 0x06010000
_0803232C: .4byte 0x040000d4
_08032330: .4byte 0x84000200
_08032334: .4byte 0x02000000
_08032338: .4byte SPECIES_CASTFORM
_0803233C: .4byte gBattleMonForms
_08032340: .4byte 0x00007fff
_08032344: .4byte gPlttBufferFaded
_08032348: .4byte gPlttBufferUnfaded
_0803234C: .4byte REG_BG0CNT
	thumb_func_end sub_8031FC4

	thumb_func_start sub_8032350
sub_8032350: @ 8032350
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	lsls r1, 24
	cmp r1, 0
	bne _08032408
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _0803236C
	movs r4, 0
	b _08032376
_0803236C:
	adds r0, r4, 0
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r4, r0, 24
_08032376:
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _08032388
	ldr r0, _08032384 @ =gSubstituteDollTilemap
	b _08032396
	.align 2, 0
_08032384: .4byte gSubstituteDollTilemap
_08032388:
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080323AC
	ldr r0, _080323A4 @ =gSubstituteDollGfx
_08032396:
	ldr r1, _080323A8 @ =gUnknown_081FAF4C
	lsls r4, 2
	adds r1, r4, r1
	ldr r1, [r1]
	bl LZDecompressVram
	b _080323BA
	.align 2, 0
_080323A4: .4byte gSubstituteDollGfx
_080323A8: .4byte gUnknown_081FAF4C
_080323AC:
	ldr r0, _080323F4 @ =gSubstituteDollTilemap
	ldr r1, _080323F8 @ =gUnknown_081FAF4C
	lsls r4, 2
	adds r1, r4, r1
	ldr r1, [r1]
	bl LZDecompressVram
_080323BA:
	lsls r7, r5, 4
	ldr r0, _080323FC @ =gSubstituteDollPal
	mov r12, r0
	ldr r0, _080323F8 @ =gUnknown_081FAF4C
	adds r0, r4, r0
	ldr r4, [r0]
	ldr r3, _08032400 @ =0x040000d4
	ldr r6, _08032404 @ =0x84000200
	movs r0, 0x80
	lsls r0, 4
	adds r2, r4, r0
	adds r5, r0, 0
	movs r1, 0x2
_080323D4:
	str r4, [r3]
	str r2, [r3, 0x4]
	str r6, [r3, 0x8]
	ldr r0, [r3, 0x8]
	adds r2, r5
	subs r1, 0x1
	cmp r1, 0
	bge _080323D4
	movs r0, 0x80
	lsls r0, 1
	adds r1, r7, r0
	mov r0, r12
	movs r2, 0x20
	bl LoadCompressedPalette
	b _08032456
	.align 2, 0
_080323F4: .4byte gSubstituteDollTilemap
_080323F8: .4byte gUnknown_081FAF4C
_080323FC: .4byte gSubstituteDollPal
_08032400: .4byte 0x040000d4
_08032404: .4byte 0x84000200
_08032408:
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _08032456
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08032440
	ldr r1, _08032438 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0803243C @ =gEnemyParty
	adds r0, r1
	adds r1, r4, 0
	bl sub_8031794
	b _08032456
	.align 2, 0
_08032438: .4byte gUnknown_02024A6A
_0803243C: .4byte gEnemyParty
_08032440:
	ldr r1, _0803245C @ =gUnknown_02024A6A
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08032460 @ =gPlayerParty
	adds r0, r1
	adds r1, r5, 0
	bl sub_80318FC
_08032456:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803245C: .4byte gUnknown_02024A6A
_08032460: .4byte gPlayerParty
	thumb_func_end sub_8032350

	thumb_func_start refresh_graphics_maybe
refresh_graphics_maybe: @ 8032464
	push {r4-r6,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_8032350
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _080324A0 @ =gSprites
	adds r4, r0, r1
	ldr r0, _080324A4 @ =gBattleMonForms
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r0, r4, 0
	bl StartSpriteAnim
	cmp r5, 0
	bne _080324A8
	adds r0, r6, 0
	bl sub_8077F7C
	b _080324AE
	.align 2, 0
_080324A0: .4byte gSprites
_080324A4: .4byte gBattleMonForms
_080324A8:
	adds r0, r6, 0
	bl sub_8077F68
_080324AE:
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end refresh_graphics_maybe

	thumb_func_start sub_80324BC
sub_80324BC: @ 80324BC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	cmp r1, 0xA4
	bne _080324D8
	lsls r2, r0, 2
	ldr r0, _080324DC @ =0x02017800
	adds r2, r0
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_080324D8:
	pop {r0}
	bx r0
	.align 2, 0
_080324DC: .4byte 0x02017800
	thumb_func_end sub_80324BC

	thumb_func_start sub_80324E0
sub_80324E0: @ 80324E0
	lsls r0, 24
	lsrs r0, 22
	ldr r1, _080324F4 @ =0x02017800
	adds r0, r1
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_080324F4: .4byte 0x02017800
	thumb_func_end sub_80324E0

	thumb_func_start sub_80324F8
sub_80324F8: @ 80324F8
	push {r4-r7,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	adds r7, r6, 0
	movs r1, 0x39
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x3A
	bl GetMonData
	adds r1, r0, 0
	lsls r4, 16
	asrs r4, 16
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl GetHPBarLevel
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08032568
	lsls r0, r6, 2
	ldr r3, _08032564 @ =0x02017800
	adds r4, r0, r3
	ldrb r1, [r4]
	movs r5, 0x2
	movs r2, 0x2
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _080325B2
	adds r0, r6, 0
	eors r0, r5
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _0803255A
	movs r0, 0x5A
	bl PlaySE
_0803255A:
	ldrb r0, [r4]
	orrs r0, r5
	strb r0, [r4]
	b _080325B2
	.align 2, 0
_08032564: .4byte 0x02017800
_08032568:
	lsls r1, r6, 2
	ldr r4, _0803258C @ =0x02017800
	adds r1, r4
	ldrb r2, [r1]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	bne _08032590
	movs r0, 0x5A
	bl m4aSongNumStop
	b _080325B2
	.align 2, 0
_0803258C: .4byte 0x02017800
_08032590:
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _080325B2
	movs r0, 0x2
	eors r7, r0
	lsls r0, r7, 2
	adds r0, r4
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080325B2
	movs r0, 0x5A
	bl m4aSongNumStop
_080325B2:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80324F8

	thumb_func_start sub_80325B8
sub_80325B8: @ 80325B8
	push {r4-r6,lr}
	movs r0, 0
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, r4, 2
	ldr r6, _08032600 @ =0x02017800
	adds r1, r6
	ldrb r2, [r1]
	movs r5, 0x3
	negs r5, r5
	adds r0, r5, 0
	ands r0, r2
	strb r0, [r1]
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _080325F2
	movs r0, 0x2
	adds r1, r4, 0
	eors r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r2, [r1]
	adds r0, r5, 0
	ands r0, r2
	strb r0, [r1]
_080325F2:
	movs r0, 0x5A
	bl m4aSongNumStop
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08032600: .4byte 0x02017800
	thumb_func_end sub_80325B8

	thumb_func_start unref_sub_8032604
unref_sub_8032604: @ 8032604
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x39
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x3A
	bl GetMonData
	adds r1, r0, 0
	lsls r4, 16
	asrs r4, 16
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl GetHPBarLevel
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8032604

	thumb_func_start sub_8032638
sub_8032638: @ 8032638
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _080326DC @ =gMain
	ldr r1, _080326E0 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080326CE
	movs r0, 0
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r0, 0x2
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r5, _080326E4 @ =gUnknown_02024A6A
	mov r1, r8
	lsls r0, r1, 1
	adds r0, r5
	ldrb r0, [r0]
	bl pokemon_order_func
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r1, r9
	lsls r0, r1, 1
	adds r0, r5
	ldrb r0, [r0]
	bl pokemon_order_func
	lsls r0, 24
	lsrs r5, r0, 24
	movs r7, 0x64
	adds r0, r4, 0
	muls r0, r7
	ldr r6, _080326E8 @ =gPlayerParty
	adds r4, r0, r6
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _080326AA
	adds r0, r4, 0
	mov r1, r8
	bl sub_80324F8
_080326AA:
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _080326CE
	adds r0, r5, 0
	muls r0, r7
	adds r4, r0, r6
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _080326CE
	adds r0, r4, 0
	mov r1, r9
	bl sub_80324F8
_080326CE:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080326DC: .4byte gMain
_080326E0: .4byte 0x0000043d
_080326E4: .4byte gUnknown_02024A6A
_080326E8: .4byte gPlayerParty
	thumb_func_end sub_8032638

	thumb_func_start sub_80326EC
sub_80326EC: @ 80326EC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r5, 0
	ldr r0, _08032778 @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r5, r0
	bge _080327B4
	movs r0, 0x3
	mov r10, r8
	mov r1, r10
	ands r1, r0
	mov r10, r1
	movs r6, 0
	movs r2, 0x3F
	negs r2, r2
	mov r9, r2
_08032718:
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_8078874
	lsls r0, 24
	cmp r0, 0
	beq _080327A8
	ldr r4, _0803277C @ =gSprites
	ldr r0, _08032780 @ =gUnknown_02024BE0
	adds r3, r5, r0
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x1]
	movs r7, 0x4
	negs r7, r7
	adds r2, r7, 0
	ands r1, r2
	mov r2, r10
	orrs r1, r2
	strb r1, [r0, 0x1]
	mov r7, r8
	cmp r7, 0
	bne _08032788
	ldr r2, _08032784 @ =0x02017810
	adds r2, r6, r2
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	strb r0, [r2, 0x6]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x3]
	mov r2, r9
	ands r1, r2
	strb r1, [r0, 0x3]
	b _080327A8
	.align 2, 0
_08032778: .4byte gUnknown_02024A68
_0803277C: .4byte gSprites
_08032780: .4byte gUnknown_02024BE0
_08032784: .4byte 0x02017810
_08032788:
	ldrb r0, [r3]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	ldr r0, _080327C4 @ =0x02017810
	adds r0, r6, r0
	ldrb r1, [r0, 0x6]
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 1
	ldrb r0, [r2, 0x3]
	mov r3, r9
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x3]
_080327A8:
	adds r6, 0xC
	adds r5, 0x1
	ldr r0, _080327C8 @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r5, r0
	blt _08032718
_080327B4:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080327C4: .4byte 0x02017810
_080327C8: .4byte gUnknown_02024A68
	thumb_func_end sub_80326EC

	thumb_func_start sub_80327CC
sub_80327CC: @ 80327CC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _08032894 @ =gUnknown_081FAF24
	bl LoadCompressedObjectPic
	movs r0, 0x1
	bl battle_get_side_with_given_state
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _08032898 @ =gSpriteTemplate_81FAF34
	mov r8, r0
	adds r0, r5, 0
	movs r1, 0
	bl sub_8077ABC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8077ABC
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 8
	movs r0, 0x80
	lsls r0, 14
	adds r2, r0
	asrs r2, 16
	mov r0, r8
	adds r1, r4, 0
	movs r3, 0xC8
	bl CreateSprite
	lsls r1, r5, 1
	adds r1, r5
	lsls r1, 2
	ldr r6, _0803289C @ =0x02017810
	adds r1, r6
	strb r0, [r1, 0x7]
	ldr r7, _080328A0 @ =gSprites
	ldrb r1, [r1, 0x7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	strh r5, [r0, 0x2E]
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _0803288A
	movs r0, 0x3
	bl battle_get_side_with_given_state
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r5, 0
	movs r1, 0
	bl sub_8077ABC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8077ABC
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 8
	movs r0, 0x80
	lsls r0, 14
	adds r2, r0
	asrs r2, 16
	mov r0, r8
	adds r1, r4, 0
	movs r3, 0xC8
	bl CreateSprite
	lsls r1, r5, 1
	adds r1, r5
	lsls r1, 2
	adds r1, r6
	strb r0, [r1, 0x7]
	ldrb r1, [r1, 0x7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	strh r5, [r0, 0x2E]
_0803288A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032894: .4byte gUnknown_081FAF24
_08032898: .4byte gSpriteTemplate_81FAF34
_0803289C: .4byte 0x02017810
_080328A0: .4byte gSprites
	thumb_func_end sub_80327CC

	thumb_func_start sub_80328A4
sub_80328A4: @ 80328A4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	movs r0, 0
	mov r8, r0
	ldrh r0, [r5, 0x2E]
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080328E8 @ =gUnknown_02024BE0
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080328EC @ =gSprites
	adds r7, r0, r1
	adds r6, r7, 0
	adds r6, 0x3E
	ldrb r1, [r6]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080328E0
	adds r0, r4, 0
	bl sub_8078874
	lsls r0, 24
	cmp r0, 0
	bne _080328F4
_080328E0:
	ldr r0, _080328F0 @ =sub_8032978
	str r0, [r5, 0x1C]
	b _08032964
	.align 2, 0
_080328E8: .4byte gUnknown_02024BE0
_080328EC: .4byte gSprites
_080328F0: .4byte sub_8032978
_080328F4:
	ldr r0, _08032910 @ =gAnimScriptActive
	ldrb r0, [r0]
	cmp r0, 0
	bne _08032906
	ldrb r1, [r6]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08032918
_08032906:
	movs r0, 0x1
	mov r8, r0
	lsls r4, 2
	ldr r6, _08032914 @ =0x02017800
	b _08032938
	.align 2, 0
_08032910: .4byte gAnimScriptActive
_08032914: .4byte 0x02017800
_08032918:
	lsls r0, r4, 2
	ldr r1, _08032970 @ =0x02017800
	adds r3, r0, r1
	ldrh r2, [r3, 0x2]
	adds r4, r0, 0
	adds r6, r1, 0
	cmp r2, 0
	beq _08032938
	ldr r0, _08032974 @ =gEnemyMonElevation
	adds r1, r2, 0
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _08032938
	movs r0, 0x1
	mov r8, r0
_08032938:
	adds r0, r4, r6
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08032948
	movs r0, 0x1
	mov r8, r0
_08032948:
	ldrh r0, [r7, 0x20]
	strh r0, [r5, 0x20]
	ldrh r0, [r7, 0x24]
	strh r0, [r5, 0x24]
	adds r2, r5, 0
	adds r2, 0x3E
	mov r0, r8
	lsls r3, r0, 2
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
_08032964:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032970: .4byte 0x02017800
_08032974: .4byte gEnemyMonElevation
	thumb_func_end sub_80328A4

	thumb_func_start sub_8032978
sub_8032978: @ 8032978
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	bx lr
	thumb_func_end sub_8032978

	thumb_func_start sub_8032984
sub_8032984: @ 8032984
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	lsls r1, 16
	lsrs r5, r1, 16
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080329FA
	lsls r0, r4, 2
	ldr r3, _080329D0 @ =0x02017800
	adds r1, r0, r3
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	beq _080329AA
	adds r5, r0, 0
_080329AA:
	ldr r0, _080329D4 @ =gEnemyMonElevation
	adds r0, r5, r0
	ldrb r0, [r0]
	cmp r0, 0
	beq _080329E0
	ldr r2, _080329D8 @ =gSprites
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r0, r3, r0
	ldrb r1, [r0, 0x17]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _080329DC @ =sub_80328A4
	b _080329F8
	.align 2, 0
_080329D0: .4byte 0x02017800
_080329D4: .4byte gEnemyMonElevation
_080329D8: .4byte gSprites
_080329DC: .4byte sub_80328A4
_080329E0:
	ldr r2, _08032A00 @ =gSprites
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r0, r3, r0
	ldrb r1, [r0, 0x17]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _08032A04 @ =sub_8032978
_080329F8:
	str r1, [r0]
_080329FA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08032A00: .4byte gSprites
_08032A04: .4byte sub_8032978
	thumb_func_end sub_8032984

	thumb_func_start sub_8032A08
sub_8032A08: @ 8032A08
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08032A2C @ =gSprites
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r0, _08032A30 @ =0x02017810
	adds r1, r0
	ldrb r1, [r1, 0x7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _08032A34 @ =sub_8032978
	str r1, [r0]
	bx lr
	.align 2, 0
_08032A2C: .4byte gSprites
_08032A30: .4byte 0x02017810
_08032A34: .4byte sub_8032978
	thumb_func_end sub_8032A08

	thumb_func_start sub_8032A38
sub_8032A38: @ 8032A38
	push {r4-r6,lr}
	ldr r3, _08032AA4 @ =0x06000240
	movs r0, 0
	movs r6, 0xF0
	lsls r6, 8
_08032A42:
	adds r5, r0, 0x1
	movs r4, 0xF
_08032A46:
	ldrh r1, [r3]
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	bne _08032A56
	adds r0, r6, 0
	orrs r0, r1
	strh r0, [r3]
_08032A56:
	ldrh r1, [r3]
	movs r2, 0xF0
	lsls r2, 4
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _08032A6A
	adds r0, r2, 0
	orrs r0, r1
	strh r0, [r3]
_08032A6A:
	ldrh r1, [r3]
	movs r2, 0xF0
	movs r0, 0xF0
	ands r0, r1
	cmp r0, 0
	bne _08032A7C
	adds r0, r1, 0
	orrs r0, r2
	strh r0, [r3]
_08032A7C:
	ldrh r1, [r3]
	movs r2, 0xF
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _08032A8E
	adds r0, r1, 0
	orrs r0, r2
	strh r0, [r3]
_08032A8E:
	adds r3, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _08032A46
	adds r0, r5, 0
	cmp r0, 0x8
	ble _08032A42
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08032AA4: .4byte 0x06000240
	thumb_func_end sub_8032A38

	thumb_func_start sub_8032AA8
sub_8032AA8: @ 8032AA8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsls r2, r4, 2
	ldr r0, _08032AD4 @ =0x02017800
	adds r2, r0
	movs r3, 0
	movs r0, 0
	strh r0, [r2, 0x2]
	ldr r0, _08032AD8 @ =gBattleMonForms
	adds r0, r4, r0
	strb r3, [r0]
	cmp r1, 0
	bne _08032ACC
	adds r0, r4, 0
	bl sub_80324E0
_08032ACC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032AD4: .4byte 0x02017800
_08032AD8: .4byte gBattleMonForms
	thumb_func_end sub_8032AA8

	thumb_func_start nullsub_45
nullsub_45: @ 8032ADC
	bx lr
	thumb_func_end nullsub_45

	thumb_func_start sub_8032AE0
sub_8032AE0: @ 8032AE0
	ldr r1, _08032AF0 @ =gUnknown_03004330
	ldr r0, _08032AF4 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08032AF8 @ =sub_8032AFC
	str r1, [r0]
	bx lr
	.align 2, 0
_08032AF0: .4byte gUnknown_03004330
_08032AF4: .4byte gUnknown_02024A60
_08032AF8: .4byte sub_8032AFC
	thumb_func_end sub_8032AE0

	thumb_func_start sub_8032AFC
sub_8032AFC: @ 8032AFC
	push {lr}
	ldr r2, _08032B30 @ =gUnknown_02024A64
	ldr r1, _08032B34 @ =gBitTable
	ldr r0, _08032B38 @ =gUnknown_02024A60
	ldrb r3, [r0]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08032B48
	ldr r0, _08032B3C @ =gUnknown_02023A60
	lsls r1, r3, 9
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x38
	bhi _08032B44
	ldr r0, _08032B40 @ =gUnknown_081FAF5C
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _08032B48
	.align 2, 0
_08032B30: .4byte gUnknown_02024A64
_08032B34: .4byte gBitTable
_08032B38: .4byte gUnknown_02024A60
_08032B3C: .4byte gUnknown_02023A60
_08032B40: .4byte gUnknown_081FAF5C
_08032B44:
	bl sub_80334EC
_08032B48:
	pop {r0}
	bx r0
	thumb_func_end sub_8032AFC

	thumb_func_start sub_8032B4C
sub_8032B4C: @ 8032B4C
	push {lr}
	ldr r2, _08032B74 @ =gSprites
	ldr r1, _08032B78 @ =gUnknown_02024BE0
	ldr r0, _08032B7C @ =gUnknown_02024A60
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _08032B80 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _08032B70
	bl sub_80334EC
_08032B70:
	pop {r0}
	bx r0
	.align 2, 0
_08032B74: .4byte gSprites
_08032B78: .4byte gUnknown_02024BE0
_08032B7C: .4byte gUnknown_02024A60
_08032B80: .4byte SpriteCallbackDummy
	thumb_func_end sub_8032B4C

	thumb_func_start sub_8032B84
sub_8032B84: @ 8032B84
	push {lr}
	ldr r2, _08032BAC @ =gSprites
	ldr r1, _08032BB0 @ =gUnknown_02024BE0
	ldr r0, _08032BB4 @ =gUnknown_02024A60
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _08032BB8 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _08032BA8
	bl sub_80334EC
_08032BA8:
	pop {r0}
	bx r0
	.align 2, 0
_08032BAC: .4byte gSprites
_08032BB0: .4byte gUnknown_02024BE0
_08032BB4: .4byte gUnknown_02024A60
_08032BB8: .4byte SpriteCallbackDummy
	thumb_func_end sub_8032B84

	thumb_func_start sub_8032BBC
sub_8032BBC: @ 8032BBC
	push {r4-r6,lr}
	ldr r4, _08032C34 @ =gSprites
	ldr r6, _08032C38 @ =gUnknown_02024BE0
	ldr r5, _08032C3C @ =gUnknown_02024A60
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r2, r0, 2
	adds r0, r4, 0
	adds r0, 0x1C
	adds r0, r2, r0
	ldr r1, [r0]
	ldr r0, _08032C40 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _08032C2C
	adds r0, r2, r4
	ldrh r0, [r0, 0x6]
	bl sub_8031B74
	ldrb r0, [r5]
	adds r0, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r1, 0x38]
	ldr r2, _08032C44 @ =0x000003ff
	ands r2, r0
	ldrh r3, [r1, 0x4]
	ldr r0, _08032C48 @ =0xfffffc00
	ands r0, r3
	orrs r0, r2
	strh r0, [r1, 0x4]
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	bl sub_80334EC
_08032C2C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08032C34: .4byte gSprites
_08032C38: .4byte gUnknown_02024BE0
_08032C3C: .4byte gUnknown_02024A60
_08032C40: .4byte SpriteCallbackDummy
_08032C44: .4byte 0x000003ff
_08032C48: .4byte 0xfffffc00
	thumb_func_end sub_8032BBC

	thumb_func_start sub_8032C4C
sub_8032C4C: @ 8032C4C
	push {lr}
	ldr r3, _08032C80 @ =gUnknown_02024A60
	ldrb r0, [r3]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r2, _08032C84 @ =0x02017810
	adds r1, r2
	ldrb r0, [r1, 0x9]
	subs r0, 0x1
	strb r0, [r1, 0x9]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _08032C7C
	ldrb r0, [r3]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0
	strb r0, [r1, 0x9]
	bl sub_80334EC
_08032C7C:
	pop {r0}
	bx r0
	.align 2, 0
_08032C80: .4byte gUnknown_02024A60
_08032C84: .4byte 0x02017810
	thumb_func_end sub_8032C4C

	thumb_func_start sub_8032C88
sub_8032C88: @ 8032C88
	push {r4-r7,lr}
	movs r6, 0
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _08032CAC
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _08032CE0
	ldr r0, _08032CCC @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08032CE0
_08032CAC:
	ldr r2, _08032CD0 @ =gSprites
	ldr r1, _08032CD4 @ =gUnknown_03004340
	ldr r0, _08032CD8 @ =gUnknown_02024A60
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _08032CDC @ =SpriteCallbackDummy
	cmp r1, r0
	bne _08032D16
	b _08032D14
	.align 2, 0
_08032CCC: .4byte gBattleTypeFlags
_08032CD0: .4byte gSprites
_08032CD4: .4byte gUnknown_03004340
_08032CD8: .4byte gUnknown_02024A60
_08032CDC: .4byte SpriteCallbackDummy
_08032CE0:
	ldr r2, _08032DC4 @ =gSprites
	ldr r5, _08032DC8 @ =gUnknown_03004340
	ldr r0, _08032DCC @ =gUnknown_02024A60
	ldrb r3, [r0]
	adds r0, r3, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r4, [r0]
	ldr r0, _08032DD0 @ =SpriteCallbackDummy
	cmp r4, r0
	bne _08032D16
	movs r0, 0x2
	eors r3, r0
	adds r0, r3, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	cmp r0, r4
	bne _08032D16
_08032D14:
	movs r6, 0x1
_08032D16:
	bl IsCryPlayingOrClearCrySongs
	lsls r0, 24
	cmp r0, 0
	beq _08032D22
	movs r6, 0
_08032D22:
	cmp r6, 0
	beq _08032E0E
	ldr r7, _08032DCC @ =gUnknown_02024A60
	ldrb r2, [r7]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r5, _08032DD4 @ =0x02017810
	adds r4, r0, r5
	ldrb r1, [r4, 0x1]
	movs r3, 0x1
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08032E0E
	movs r6, 0x2
	adds r1, r6, 0
	eors r1, r2
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0, 0x1]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08032E0E
	ldrb r1, [r4]
	movs r3, 0x7F
	adds r0, r3, 0
	ands r0, r1
	strb r0, [r4]
	ldrb r0, [r7]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1, 0x1]
	movs r4, 0x2
	negs r4, r4
	adds r0, r4, 0
	ands r0, r2
	strb r0, [r1, 0x1]
	ldrb r0, [r7]
	adds r1, r6, 0
	eors r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0]
	ands r3, r1
	strb r3, [r0]
	ldrb r0, [r7]
	adds r1, r6, 0
	eors r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0, 0x1]
	ands r4, r1
	strb r4, [r0, 0x1]
	ldr r4, _08032DD8 @ =0x000027f9
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	ldr r0, _08032DDC @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08032DE4
	ldr r0, _08032DE0 @ =gMPlay_BGM
	bl m4aMPlayContinue
	b _08032DF0
	.align 2, 0
_08032DC4: .4byte gSprites
_08032DC8: .4byte gUnknown_03004340
_08032DCC: .4byte gUnknown_02024A60
_08032DD0: .4byte SpriteCallbackDummy
_08032DD4: .4byte 0x02017810
_08032DD8: .4byte 0x000027f9
_08032DDC: .4byte gBattleTypeFlags
_08032DE0: .4byte gMPlay_BGM
_08032DE4:
	ldr r0, _08032E14 @ =gMPlay_BGM
	ldr r1, _08032E18 @ =0x0000ffff
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
_08032DF0:
	ldr r2, _08032E1C @ =gUnknown_02024A60
	ldrb r1, [r2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08032E20 @ =0x02017810
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0, 0x9]
	ldr r1, _08032E24 @ =gUnknown_03004330
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08032E28 @ =sub_8032C4C
	str r1, [r0]
_08032E0E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032E14: .4byte gMPlay_BGM
_08032E18: .4byte 0x0000ffff
_08032E1C: .4byte gUnknown_02024A60
_08032E20: .4byte 0x02017810
_08032E24: .4byte gUnknown_03004330
_08032E28: .4byte sub_8032C4C
	thumb_func_end sub_8032C88

	thumb_func_start sub_8032E2C
sub_8032E2C: @ 8032E2C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _08032FEC @ =gUnknown_02024A60
	mov r9, r0
	ldrb r2, [r0]
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	ldr r4, _08032FF0 @ =0x02017810
	adds r0, r4
	ldrb r1, [r0]
	movs r5, 0x88
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _08032E64
	ldr r0, _08032FF4 @ =gUnknown_02024A6A
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08032FF8 @ =gEnemyParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_8141828
_08032E64:
	mov r1, r9
	ldrb r0, [r1]
	movs r7, 0x2
	adds r2, r7, 0
	eors r2, r0
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _08032E94
	ldr r0, _08032FF4 @ =gUnknown_02024A6A
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08032FF8 @ =gEnemyParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_8141828
_08032E94:
	mov r0, r9
	ldrb r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	movs r3, 0x8
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08032EAE
	b _08032FE0
_08032EAE:
	adds r1, r7, 0
	eors r1, r2
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08032EC6
	b _08032FE0
_08032EC6:
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _08032F58
	ldr r0, _08032FFC @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08032F58
	ldr r1, _08033000 @ =gUnknown_0300434C
	mov r2, r9
	ldrb r0, [r2]
	eors r0, r7
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08033004 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r4, _08033008 @ =gUnknown_03004340
	mov r1, r9
	ldrb r0, [r1]
	adds r1, r7, 0
	eors r1, r0
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _08032FF4 @ =gUnknown_02024A6A
	mov r8, r2
	lsls r1, 1
	add r1, r8
	ldrh r1, [r1]
	movs r6, 0x64
	muls r1, r6
	ldr r5, _08032FF8 @ =gEnemyParty
	adds r1, r5
	movs r2, 0
	bl sub_8045A5C
	mov r1, r9
	ldrb r0, [r1]
	eors r0, r7
	bl sub_804777C
	mov r2, r9
	ldrb r0, [r2]
	eors r0, r7
	adds r0, r4
	ldrb r0, [r0]
	bl sub_8043DFC
	mov r1, r9
	ldrb r0, [r1]
	adds r4, r7, 0
	eors r4, r0
	lsls r0, r4, 1
	add r0, r8
	ldrh r0, [r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_8032984
_08032F58:
	ldr r1, _08033000 @ =gUnknown_0300434C
	ldr r4, _08032FEC @ =gUnknown_02024A60
	ldrb r0, [r4]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08033004 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r5, _08033008 @ =gUnknown_03004340
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _08032FF4 @ =gUnknown_02024A6A
	mov r9, r2
	lsls r1, 1
	add r1, r9
	ldrh r1, [r1]
	movs r2, 0x64
	mov r8, r2
	mov r2, r8
	muls r2, r1
	adds r1, r2, 0
	ldr r6, _08032FF8 @ =gEnemyParty
	adds r1, r6
	movs r2, 0
	bl sub_8045A5C
	ldrb r0, [r4]
	bl sub_804777C
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl sub_8043DFC
	ldrb r5, [r4]
	lsls r0, r5, 1
	add r0, r9
	ldrh r0, [r0]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	movs r1, 0xB
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r5, 0
	bl sub_8032984
	ldr r2, _0803300C @ =0x02017840
	ldrb r1, [r2, 0x9]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _08033010 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08033014 @ =sub_8032C88
	str r1, [r0]
_08032FE0:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032FEC: .4byte gUnknown_02024A60
_08032FF0: .4byte 0x02017810
_08032FF4: .4byte gUnknown_02024A6A
_08032FF8: .4byte gEnemyParty
_08032FFC: .4byte gBattleTypeFlags
_08033000: .4byte gUnknown_0300434C
_08033004: .4byte gSprites
_08033008: .4byte gUnknown_03004340
_0803300C: .4byte 0x02017840
_08033010: .4byte gUnknown_03004330
_08033014: .4byte sub_8032C88
	thumb_func_end sub_8032E2C

	thumb_func_start sub_8033018
sub_8033018: @ 8033018
	push {r4-r7,lr}
	ldr r2, _08033070 @ =gSprites
	ldr r0, _08033074 @ =gUnknown_02024BE0
	ldr r7, _08033078 @ =gUnknown_02024A60
	ldrb r3, [r7]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	lsrs r2, r0, 31
	cmp r2, 0x1
	bne _080330BC
	movs r4, 0x24
	ldrsh r0, [r1, r4]
	cmp r0, 0
	bne _080330BC
	lsls r4, r3, 1
	adds r0, r4, r3
	lsls r0, 2
	ldr r6, _0803307C @ =0x02017810
	adds r1, r0, r6
	ldrb r5, [r1]
	movs r0, 0x80
	ands r0, r5
	cmp r0, 0
	bne _08033088
	ldr r0, _08033080 @ =gUnknown_02024A6A
	adds r0, r4, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08033084 @ =gEnemyParty
	adds r1, r0
	adds r0, r3, 0
	bl sub_8141828
	b _080330BC
	.align 2, 0
_08033070: .4byte gSprites
_08033074: .4byte gUnknown_02024BE0
_08033078: .4byte gUnknown_02024A60
_0803307C: .4byte 0x02017810
_08033080: .4byte gUnknown_02024A6A
_08033084: .4byte gEnemyParty
_08033088:
	ldrb r0, [r1, 0x1]
	ands r2, r0
	cmp r2, 0
	beq _080330BC
	movs r0, 0x7F
	ands r0, r5
	strb r0, [r1]
	ldrb r0, [r7]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r2, [r1, 0x1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	ldr r4, _080330C4 @ =0x000027f9
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	bl sub_80334EC
_080330BC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080330C4: .4byte 0x000027f9
	thumb_func_end sub_8033018

	thumb_func_start sub_80330C8
sub_80330C8: @ 80330C8
	push {r4-r6,lr}
	ldr r6, _08033108 @ =gUnknown_02024A60
	ldrb r0, [r6]
	ldr r5, _0803310C @ =gUnknown_03004340
	adds r1, r0, r5
	ldrb r1, [r1]
	movs r2, 0
	movs r3, 0
	bl sub_8045C78
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrb r0, [r6]
	adds r0, r5
	ldrb r0, [r0]
	bl sub_8043DFC
	lsls r4, 16
	asrs r1, r4, 16
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08033110
	ldrb r0, [r6]
	adds r0, r5
	ldrb r0, [r0]
	movs r2, 0
	bl sub_80440EC
	b _08033114
	.align 2, 0
_08033108: .4byte gUnknown_02024A60
_0803310C: .4byte gUnknown_03004340
_08033110:
	bl sub_80334EC
_08033114:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80330C8

	thumb_func_start sub_803311C
sub_803311C: @ 803311C
	push {lr}
	ldr r2, _08033150 @ =gSprites
	ldr r0, _08033154 @ =gUnknown_02024BE0
	ldr r1, _08033158 @ =gUnknown_02024A60
	ldrb r3, [r1]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	bne _0803314A
	ldr r0, _0803315C @ =gUnknown_03004340
	adds r0, r3, r0
	ldrb r0, [r0]
	bl sub_8043DB0
	bl sub_80334EC
_0803314A:
	pop {r0}
	bx r0
	.align 2, 0
_08033150: .4byte gSprites
_08033154: .4byte gUnknown_02024BE0
_08033158: .4byte gUnknown_02024A60
_0803315C: .4byte gUnknown_03004340
	thumb_func_end sub_803311C

	thumb_func_start sub_8033160
sub_8033160: @ 8033160
	push {r4-r6,lr}
	ldr r6, _080331BC @ =gUnknown_02024A60
	ldrb r2, [r6]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r1, _080331C0 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080331B6
	ldr r5, _080331C4 @ =gUnknown_02024BE0
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080331C8 @ =gSprites
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldrb r0, [r6]
	bl sub_8032A08
	ldr r1, _080331CC @ =gUnknown_03004340
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8043DB0
	bl sub_80334EC
_080331B6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080331BC: .4byte gUnknown_02024A60
_080331C0: .4byte 0x02017810
_080331C4: .4byte gUnknown_02024BE0
_080331C8: .4byte gSprites
_080331CC: .4byte gUnknown_03004340
	thumb_func_end sub_8033160

	thumb_func_start sub_80331D0
sub_80331D0: @ 80331D0
	push {lr}
	ldr r0, _080331E4 @ =gUnknown_03004210
	ldrh r0, [r0, 0x16]
	cmp r0, 0
	bne _080331DE
	bl sub_80334EC
_080331DE:
	pop {r0}
	bx r0
	.align 2, 0
_080331E4: .4byte gUnknown_03004210
	thumb_func_end sub_80331D0

	thumb_func_start bx_blink_t7
bx_blink_t7: @ 80331E8
	push {r4,lr}
	ldr r1, _08033224 @ =gUnknown_02024BE0
	ldr r0, _08033228 @ =gUnknown_02024A60
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	ldr r2, _0803322C @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x20
	bne _08033234
	movs r3, 0
	movs r0, 0
	strh r0, [r4, 0x30]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	subs r0, 0x5
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08033230 @ =gUnknown_02024E6D
	strb r3, [r0]
	bl sub_80334EC
	b _0803325E
	.align 2, 0
_08033224: .4byte gUnknown_02024BE0
_08033228: .4byte gUnknown_02024A60
_0803322C: .4byte gSprites
_08033230: .4byte gUnknown_02024E6D
_08033234:
	ldrh r0, [r4, 0x30]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08033258
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
_08033258:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
_0803325E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end bx_blink_t7

	thumb_func_start sub_8033264
sub_8033264: @ 8033264
	push {r4,lr}
	ldr r2, _080332B4 @ =gSprites
	ldr r0, _080332B8 @ =gUnknown_03004340
	ldr r4, _080332BC @ =gUnknown_02024A60
	ldrb r3, [r4]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _080332C0 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _080332AC
	lsls r0, r3, 2
	ldr r1, _080332C4 @ =0x02017800
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080332A0
	adds r0, r3, 0
	adds r1, r3, 0
	adds r2, r3, 0
	movs r3, 0x6
	bl move_anim_start_t4
_080332A0:
	ldr r0, _080332C8 @ =gUnknown_03004330
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, _080332CC @ =sub_80332D0
	str r0, [r1]
_080332AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080332B4: .4byte gSprites
_080332B8: .4byte gUnknown_03004340
_080332BC: .4byte gUnknown_02024A60
_080332C0: .4byte SpriteCallbackDummy
_080332C4: .4byte 0x02017800
_080332C8: .4byte gUnknown_03004330
_080332CC: .4byte sub_80332D0
	thumb_func_end sub_8033264

	thumb_func_start sub_80332D0
sub_80332D0: @ 80332D0
	push {lr}
	ldr r0, _080332FC @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08033300 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080332F6
	ldr r0, _08033304 @ =c3_0802FDF4
	movs r1, 0xA
	bl CreateTask
	bl sub_80334EC
_080332F6:
	pop {r0}
	bx r0
	.align 2, 0
_080332FC: .4byte gUnknown_02024A60
_08033300: .4byte 0x02017810
_08033304: .4byte c3_0802FDF4
	thumb_func_end sub_80332D0

	thumb_func_start sub_8033308
sub_8033308: @ 8033308
	push {r4,r5,lr}
	ldr r5, _080333AC @ =gUnknown_02024A60
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r3, _080333B0 @ =0x02017810
	adds r2, r0, r3
	ldrb r1, [r2, 0x1]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080333A4
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r1, 0x1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	ldr r4, _080333B4 @ =0x000027f9
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	ldr r1, _080333B8 @ =gUnknown_02024BE0
	ldrb r0, [r5]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080333BC @ =gSprites
	adds r0, r1
	movs r1, 0
	bl StartSpriteAnim
	ldr r4, _080333C0 @ =gUnknown_03004340
	ldrb r1, [r5]
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _080333C4 @ =gUnknown_02024A6A
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _080333C8 @ =gEnemyParty
	adds r1, r2
	movs r2, 0
	bl sub_8045A5C
	ldrb r0, [r5]
	bl sub_804777C
	ldrb r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	bl sub_8043DFC
	ldrb r0, [r5]
	bl sub_8031F88
	ldr r1, _080333CC @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080333D0 @ =sub_8033264
	str r1, [r0]
_080333A4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080333AC: .4byte gUnknown_02024A60
_080333B0: .4byte 0x02017810
_080333B4: .4byte 0x000027f9
_080333B8: .4byte gUnknown_02024BE0
_080333BC: .4byte gSprites
_080333C0: .4byte gUnknown_03004340
_080333C4: .4byte gUnknown_02024A6A
_080333C8: .4byte gEnemyParty
_080333CC: .4byte gUnknown_03004330
_080333D0: .4byte sub_8033264
	thumb_func_end sub_8033308

	thumb_func_start sub_80333D4
sub_80333D4: @ 80333D4
	push {r4-r6,lr}
	ldr r5, _08033470 @ =gUnknown_02024A60
	ldrb r2, [r5]
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	ldr r6, _08033474 @ =0x02017810
	adds r0, r6
	ldrb r1, [r0]
	movs r0, 0x88
	ands r0, r1
	cmp r0, 0
	bne _08033402
	ldr r0, _08033478 @ =gUnknown_02024A6A
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0803347C @ =gEnemyParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_8141828
_08033402:
	ldr r4, _08033480 @ =gSprites
	ldr r0, _08033484 @ =gUnknown_0300434C
	ldrb r2, [r5]
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r3, r0, 2
	adds r0, r4, 0
	adds r0, 0x1C
	adds r0, r3, r0
	ldr r1, [r0]
	ldr r0, _08033488 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _08033468
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _08033468
	adds r0, r3, r4
	bl DestroySprite
	ldrb r4, [r5]
	ldr r1, _08033478 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0803347C @ =gEnemyParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_8032984
	ldr r1, _0803348C @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08033490 @ =sub_8033308
	str r1, [r0]
_08033468:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08033470: .4byte gUnknown_02024A60
_08033474: .4byte 0x02017810
_08033478: .4byte gUnknown_02024A6A
_0803347C: .4byte gEnemyParty
_08033480: .4byte gSprites
_08033484: .4byte gUnknown_0300434C
_08033488: .4byte SpriteCallbackDummy
_0803348C: .4byte gUnknown_03004330
_08033490: .4byte sub_8033308
	thumb_func_end sub_80333D4

	thumb_func_start sub_8033494
sub_8033494: @ 8033494
	push {lr}
	ldr r0, _080334B8 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080334BC @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _080334B2
	bl sub_80334EC
_080334B2:
	pop {r0}
	bx r0
	.align 2, 0
_080334B8: .4byte gUnknown_02024A60
_080334BC: .4byte 0x02017810
	thumb_func_end sub_8033494

	thumb_func_start sub_80334C0
sub_80334C0: @ 80334C0
	push {lr}
	ldr r0, _080334E4 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080334E8 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _080334DE
	bl sub_80334EC
_080334DE:
	pop {r0}
	bx r0
	.align 2, 0
_080334E4: .4byte gUnknown_02024A60
_080334E8: .4byte 0x02017810
	thumb_func_end sub_80334C0

	thumb_func_start sub_80334EC
sub_80334EC: @ 80334EC
	ldr r1, _08033510 @ =gUnknown_03004330
	ldr r2, _08033514 @ =gUnknown_02024A60
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08033518 @ =sub_8032AFC
	str r1, [r0]
	ldr r3, _0803351C @ =gUnknown_02024A64
	ldr r1, _08033520 @ =gBitTable
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldr r0, [r3]
	bics r0, r1
	str r0, [r3]
	bx lr
	.align 2, 0
_08033510: .4byte gUnknown_03004330
_08033514: .4byte gUnknown_02024A60
_08033518: .4byte sub_8032AFC
_0803351C: .4byte gUnknown_02024A64
_08033520: .4byte gBitTable
	thumb_func_end sub_80334EC
	
	.align 2, 0 @ Don't pad with nop.
