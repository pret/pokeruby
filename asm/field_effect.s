	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start MultiplyInvertedPaletteRGBComponents
MultiplyInvertedPaletteRGBComponents: @ 8085C7C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 16
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r4, _08085D00 @ =gPlttBufferUnfaded
	lsrs r0, 15
	adds r4, r0, r4
	ldrh r4, [r4]
	movs r5, 0x1F
	mov r9, r5
	mov r8, r4
	mov r6, r8
	ands r6, r5
	mov r8, r6
	movs r6, 0xF8
	lsls r6, 2
	ands r6, r4
	lsrs r6, 5
	movs r5, 0xF8
	lsls r5, 7
	ands r4, r5
	lsrs r4, 10
	mov r7, r9
	mov r5, r8
	subs r7, r5
	mov r12, r7
	mov r7, r12
	muls r7, r1
	adds r1, r7, 0
	asrs r1, 4
	add r8, r1
	mov r5, r9
	subs r1, r5, r6
	muls r1, r2
	asrs r1, 4
	adds r6, r1
	subs r5, r4
	mov r9, r5
	mov r1, r9
	muls r1, r3
	asrs r1, 4
	adds r4, r1
	mov r7, r8
	lsls r7, 16
	lsls r6, 21
	orrs r6, r7
	lsls r4, 26
	orrs r4, r6
	lsrs r4, 16
	ldr r1, _08085D04 @ =gPlttBufferFaded
	adds r0, r1
	strh r4, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085D00: .4byte gPlttBufferUnfaded
_08085D04: .4byte gPlttBufferFaded
	thumb_func_end MultiplyInvertedPaletteRGBComponents

	thumb_func_start MultiplyPaletteRGBComponents
MultiplyPaletteRGBComponents: @ 8085D08
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	lsls r0, 16
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r4, _08085D78 @ =gPlttBufferUnfaded
	lsrs r0, 15
	adds r4, r0, r4
	ldrh r4, [r4]
	movs r5, 0x1F
	mov r8, r5
	mov r6, r8
	ands r6, r4
	mov r8, r6
	movs r5, 0xF8
	lsls r5, 2
	ands r5, r4
	lsrs r5, 5
	movs r6, 0xF8
	lsls r6, 7
	ands r4, r6
	lsrs r4, 10
	mov r6, r8
	muls r6, r1
	adds r1, r6, 0
	asrs r1, 4
	mov r6, r8
	subs r6, r1
	adds r1, r5, 0
	muls r1, r2
	asrs r1, 4
	subs r5, r1
	adds r1, r4, 0
	muls r1, r3
	asrs r1, 4
	subs r4, r1
	lsls r6, 16
	lsls r5, 21
	orrs r5, r6
	lsls r4, 26
	orrs r4, r5
	lsrs r4, 16
	ldr r1, _08085D7C @ =gPlttBufferFaded
	adds r0, r1
	strh r4, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08085D78: .4byte gPlttBufferUnfaded
_08085D7C: .4byte gPlttBufferFaded
	thumb_func_end MultiplyPaletteRGBComponents

	thumb_func_start FldEff_PokecenterHeal
FldEff_PokecenterHeal: @ 8085D80
	push {r4,lr}
	bl CalculatePlayerPartyCount
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08085DBC @ =Task_PokecenterHeal
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08085DC0 @ =gTasks
	adds r1, r0
	strh r4, [r1, 0xA]
	movs r0, 0x5D
	strh r0, [r1, 0xC]
	movs r0, 0x24
	strh r0, [r1, 0xE]
	movs r0, 0x7C
	strh r0, [r1, 0x10]
	movs r0, 0x18
	strh r0, [r1, 0x12]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08085DBC: .4byte Task_PokecenterHeal
_08085DC0: .4byte gTasks
	thumb_func_end FldEff_PokecenterHeal

	thumb_func_start Task_PokecenterHeal
Task_PokecenterHeal: @ 8085DC4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08085DEC @ =gTasks
	adds r1, r0
	ldr r2, _08085DF0 @ =gUnknown_0839F268
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	lsls r0, 2
	adds r0, r2
	ldr r2, [r0]
	adds r0, r1, 0
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_08085DEC: .4byte gTasks
_08085DF0: .4byte gUnknown_0839F268
	thumb_func_end Task_PokecenterHeal

	thumb_func_start PokecenterHealEffect_0
PokecenterHealEffect_0: @ 8085DF4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r2, 0xC
	ldrsh r1, [r4, r2]
	movs r3, 0xE
	ldrsh r2, [r4, r3]
	movs r3, 0x1
	bl CreatePokeballGlowSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x14]
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	bl PokecenterHealEffectHelper
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x16]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PokecenterHealEffect_0

	thumb_func_start PokecenterHealEffect_1
PokecenterHealEffect_1: @ 8085E30
	push {r4,lr}
	adds r2, r0, 0
	ldr r3, _08085E68 @ =gSprites
	movs r1, 0x14
	ldrsh r0, [r2, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	movs r4, 0x2E
	ldrsh r0, [r1, r4]
	cmp r0, 0x1
	ble _08085E62
	movs r0, 0x16
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x2E]
	adds r1, 0x1
	strh r1, [r0, 0x2E]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
_08085E62:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085E68: .4byte gSprites
	thumb_func_end PokecenterHealEffect_1

	thumb_func_start PokecenterHealEffect_2
PokecenterHealEffect_2: @ 8085E6C
	push {lr}
	adds r3, r0, 0
	ldr r2, _08085E90 @ =gSprites
	movs r0, 0x14
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2E
	ldrsh r0, [r0, r1]
	cmp r0, 0x4
	ble _08085E8C
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_08085E8C:
	pop {r0}
	bx r0
	.align 2, 0
_08085E90: .4byte gSprites
	thumb_func_end PokecenterHealEffect_2

	thumb_func_start PokecenterHealEffect_3
PokecenterHealEffect_3: @ 8085E94
	push {lr}
	ldr r2, _08085ECC @ =gSprites
	movs r3, 0x14
	ldrsh r1, [r0, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x6
	ble _08085EC6
	adds r0, r1, 0
	bl DestroySprite
	movs r0, 0x19
	bl FieldEffectActiveListRemove
	ldr r0, _08085ED0 @ =Task_PokecenterHeal
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08085EC6:
	pop {r0}
	bx r0
	.align 2, 0
_08085ECC: .4byte gSprites
_08085ED0: .4byte Task_PokecenterHeal
	thumb_func_end PokecenterHealEffect_3

	thumb_func_start FldEff_HallOfFameRecord
FldEff_HallOfFameRecord: @ 8085ED4
	push {r4,lr}
	bl CalculatePlayerPartyCount
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08085F08 @ =Task_HallOfFameRecord
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08085F0C @ =gTasks
	adds r1, r0
	strh r4, [r1, 0xA]
	movs r0, 0x75
	strh r0, [r1, 0xC]
	movs r0, 0x34
	strh r0, [r1, 0xE]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08085F08: .4byte Task_HallOfFameRecord
_08085F0C: .4byte gTasks
	thumb_func_end FldEff_HallOfFameRecord

	thumb_func_start Task_HallOfFameRecord
Task_HallOfFameRecord: @ 8085F10
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08085F38 @ =gTasks
	adds r1, r0
	ldr r2, _08085F3C @ =gUnknown_0839F278
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	lsls r0, 2
	adds r0, r2
	ldr r2, [r0]
	adds r0, r1, 0
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_08085F38: .4byte gTasks
_08085F3C: .4byte gUnknown_0839F278
	thumb_func_end Task_HallOfFameRecord

	thumb_func_start HallOfFameRecordEffect_0
HallOfFameRecordEffect_0: @ 8085F40
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r2, 0xC
	ldrsh r1, [r4, r2]
	movs r3, 0xE
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreatePokeballGlowSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x14]
	ldr r0, _08085FB0 @ =Task_HallOfFameRecord
	bl FindTaskIdByFunc
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x78
	movs r2, 0x18
	movs r3, 0
	bl HallOfFameRecordEffectHelper
	adds r0, r4, 0
	movs r1, 0x28
	movs r2, 0x8
	movs r3, 0x1
	bl HallOfFameRecordEffectHelper
	adds r0, r4, 0
	movs r1, 0x48
	movs r2, 0x8
	movs r3, 0x1
	bl HallOfFameRecordEffectHelper
	adds r0, r4, 0
	movs r1, 0xA8
	movs r2, 0x8
	movs r3, 0x1
	bl HallOfFameRecordEffectHelper
	adds r0, r4, 0
	movs r1, 0xC8
	movs r2, 0x8
	movs r3, 0x1
	bl HallOfFameRecordEffectHelper
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085FB0: .4byte Task_HallOfFameRecord
	thumb_func_end HallOfFameRecordEffect_0

	thumb_func_start HallOfFameRecordEffect_1
HallOfFameRecordEffect_1: @ 8085FB4
	push {lr}
	adds r3, r0, 0
	ldr r2, _08085FE0 @ =gSprites
	movs r0, 0x14
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2E
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	ble _08085FDA
	ldrh r0, [r3, 0x26]
	adds r0, 0x1
	strh r0, [r3, 0x26]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_08085FDA:
	pop {r0}
	bx r0
	.align 2, 0
_08085FE0: .4byte gSprites
	thumb_func_end HallOfFameRecordEffect_1

	thumb_func_start HallOfFameRecordEffect_2
HallOfFameRecordEffect_2: @ 8085FE4
	push {lr}
	adds r3, r0, 0
	ldr r2, _08086008 @ =gSprites
	movs r0, 0x14
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2E
	ldrsh r0, [r0, r1]
	cmp r0, 0x4
	ble _08086004
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_08086004:
	pop {r0}
	bx r0
	.align 2, 0
_08086008: .4byte gSprites
	thumb_func_end HallOfFameRecordEffect_2

	thumb_func_start HallOfFameRecordEffect_3
HallOfFameRecordEffect_3: @ 808600C
	push {lr}
	ldr r2, _08086044 @ =gSprites
	movs r3, 0x14
	ldrsh r1, [r0, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x6
	ble _0808603E
	adds r0, r1, 0
	bl DestroySprite
	movs r0, 0x3E
	bl FieldEffectActiveListRemove
	ldr r0, _08086048 @ =Task_HallOfFameRecord
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0808603E:
	pop {r0}
	bx r0
	.align 2, 0
_08086044: .4byte gSprites
_08086048: .4byte Task_HallOfFameRecord
	thumb_func_end HallOfFameRecordEffect_3

	thumb_func_start CreatePokeballGlowSprite
CreatePokeballGlowSprite: @ 808604C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r4, r1, 0
	adds r5, r2, 0
	adds r6, r3, 0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	ldr r0, _08086098 @ =SpriteCB_PokeballGlowEffect
	bl CreateInvisibleSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r2, _0808609C @ =gSprites
	adds r1, r2
	strh r4, [r1, 0x24]
	strh r5, [r1, 0x26]
	strh r6, [r1, 0x38]
	mov r2, r8
	strh r2, [r1, 0x3A]
	strh r0, [r1, 0x3C]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08086098: .4byte SpriteCB_PokeballGlowEffect
_0808609C: .4byte gSprites
	thumb_func_end CreatePokeballGlowSprite

	thumb_func_start SpriteCB_PokeballGlowEffect
SpriteCB_PokeballGlowEffect: @ 80860A0
	push {lr}
	ldr r2, _080860B8 @ =gUnknown_0839F288
	movs r3, 0x2E
	ldrsh r1, [r0, r3]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080860B8: .4byte gUnknown_0839F288
	thumb_func_end SpriteCB_PokeballGlowEffect

	thumb_func_start PokeballGlowEffect_0
PokeballGlowEffect_0: @ 80860BC
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080860D4
	subs r0, r1, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _08086130
_080860D4:
	movs r0, 0x19
	strh r0, [r4, 0x30]
	ldr r0, _08086148 @ =gSpriteTemplate_839F208
	ldr r1, _0808614C @ =gUnknown_0839F2A8
	movs r2, 0x32
	ldrsh r3, [r4, r2]
	lsls r3, 2
	adds r3, r1
	ldrh r1, [r4, 0x24]
	ldrh r2, [r3]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	ldrh r2, [r4, 0x26]
	ldrh r3, [r3, 0x2]
	adds r2, r3
	lsls r2, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08086150 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x8
	orrs r0, r2
	strb r0, [r1, 0x5]
	ldrh r0, [r4, 0x3C]
	strh r0, [r1, 0x2E]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x3A]
	subs r0, 0x1
	strh r0, [r4, 0x3A]
	movs r0, 0x17
	bl PlaySE
_08086130:
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08086142
	movs r0, 0x20
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_08086142:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086148: .4byte gSpriteTemplate_839F208
_0808614C: .4byte gUnknown_0839F2A8
_08086150: .4byte gSprites
	thumb_func_end PokeballGlowEffect_0

	thumb_func_start PokeballGlowEffect_1
PokeballGlowEffect_1: @ 8086154
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	subs r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	bne _08086184
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	movs r0, 0x8
	strh r0, [r1, 0x30]
	strh r2, [r1, 0x32]
	strh r2, [r1, 0x34]
	movs r2, 0x38
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _08086184
	movs r0, 0xB8
	lsls r0, 1
	bl PlayFanfare
_08086184:
	pop {r0}
	bx r0
	thumb_func_end PokeballGlowEffect_1

	thumb_func_start PokeballGlowEffect_2
PokeballGlowEffect_2: @ 8086188
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r7, r0, 0
	ldrh r0, [r7, 0x30]
	subs r0, 0x1
	strh r0, [r7, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _080861B8
	movs r0, 0x8
	strh r0, [r7, 0x30]
	ldrh r0, [r7, 0x32]
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	strh r0, [r7, 0x32]
	cmp r0, 0
	bne _080861B8
	ldrh r0, [r7, 0x34]
	adds r0, 0x1
	strh r0, [r7, 0x34]
_080861B8:
	ldrh r4, [r7, 0x32]
	adds r4, 0x3
	movs r0, 0x3
	mov r8, r0
	mov r1, r8
	ands r4, r1
	ldr r3, _080862B0 @ =0x00001007
	mov r10, r3
	mov r0, r10
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	movs r1, 0x84
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	ldr r6, _080862B4 @ =gUnknown_0839F2C0
	adds r1, r4, r6
	ldrb r1, [r1]
	ldr r5, _080862B8 @ =gUnknown_0839F2C4
	adds r2, r4, r5
	ldrb r2, [r2]
	ldr r3, _080862BC @ =gUnknown_0839F2C8
	mov r9, r3
	add r4, r9
	ldrb r3, [r4]
	bl MultiplyInvertedPaletteRGBComponents
	ldrh r4, [r7, 0x32]
	adds r4, 0x2
	mov r0, r8
	ands r4, r0
	mov r0, r10
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	movs r1, 0x83
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	adds r1, r4, r6
	ldrb r1, [r1]
	adds r2, r4, r5
	ldrb r2, [r2]
	add r4, r9
	ldrb r3, [r4]
	bl MultiplyInvertedPaletteRGBComponents
	ldrh r4, [r7, 0x32]
	adds r4, 0x1
	mov r3, r8
	ands r4, r3
	mov r0, r10
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	movs r1, 0x81
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	adds r1, r4, r6
	ldrb r1, [r1]
	adds r2, r4, r5
	ldrb r2, [r2]
	add r4, r9
	ldrb r3, [r4]
	bl MultiplyInvertedPaletteRGBComponents
	ldrh r4, [r7, 0x32]
	lsls r4, 24
	lsrs r4, 24
	mov r0, r10
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	ldr r3, _080862C0 @ =0x01050000
	adds r0, r3
	lsrs r0, 16
	adds r6, r4, r6
	ldrb r6, [r6]
	adds r5, r4, r5
	ldrb r5, [r5]
	add r4, r9
	ldrb r4, [r4]
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl MultiplyInvertedPaletteRGBComponents
	mov r0, r10
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	ldr r1, _080862C4 @ =0x01030000
	adds r0, r1
	lsrs r0, 16
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl MultiplyInvertedPaletteRGBComponents
	movs r3, 0x34
	ldrsh r0, [r7, r3]
	cmp r0, 0x2
	ble _080862A2
	ldrh r0, [r7, 0x2E]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r7, 0x2E]
	movs r0, 0x8
	strh r0, [r7, 0x30]
	strh r1, [r7, 0x32]
_080862A2:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080862B0: .4byte 0x00001007
_080862B4: .4byte gUnknown_0839F2C0
_080862B8: .4byte gUnknown_0839F2C4
_080862BC: .4byte gUnknown_0839F2C8
_080862C0: .4byte 0x01050000
_080862C4: .4byte 0x01030000
	thumb_func_end PokeballGlowEffect_2

	thumb_func_start PokeballGlowEffect_3
PokeballGlowEffect_3: @ 80862C8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	subs r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _080862F8
	movs r0, 0x8
	strh r0, [r2, 0x30]
	ldrh r0, [r2, 0x32]
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	strh r0, [r2, 0x32]
	cmp r0, 0x3
	bne _080862F8
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	movs r0, 0x1E
	strh r0, [r2, 0x30]
_080862F8:
	ldrh r4, [r2, 0x32]
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080863A4 @ =0x00001007
	mov r8, r0
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	movs r1, 0x84
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	ldr r1, _080863A8 @ =gUnknown_0839F2C0
	adds r1, r4, r1
	ldrb r6, [r1]
	ldr r1, _080863AC @ =gUnknown_0839F2C4
	adds r1, r4, r1
	ldrb r5, [r1]
	ldr r1, _080863B0 @ =gUnknown_0839F2C8
	adds r4, r1
	ldrb r4, [r4]
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl MultiplyInvertedPaletteRGBComponents
	mov r0, r8
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	movs r1, 0x83
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl MultiplyInvertedPaletteRGBComponents
	mov r0, r8
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	movs r1, 0x81
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl MultiplyInvertedPaletteRGBComponents
	mov r0, r8
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	ldr r1, _080863B4 @ =0x01050000
	adds r0, r1
	lsrs r0, 16
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl MultiplyInvertedPaletteRGBComponents
	mov r0, r8
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	ldr r1, _080863B8 @ =0x01030000
	adds r0, r1
	lsrs r0, 16
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl MultiplyInvertedPaletteRGBComponents
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080863A4: .4byte 0x00001007
_080863A8: .4byte gUnknown_0839F2C0
_080863AC: .4byte gUnknown_0839F2C4
_080863B0: .4byte gUnknown_0839F2C8
_080863B4: .4byte 0x01050000
_080863B8: .4byte 0x01030000
	thumb_func_end PokeballGlowEffect_3

	thumb_func_start PokeballGlowEffect_4
PokeballGlowEffect_4: @ 80863BC
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	subs r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _080863D2
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
_080863D2:
	pop {r0}
	bx r0
	thumb_func_end PokeballGlowEffect_4

	thumb_func_start PokeballGlowEffect_5
PokeballGlowEffect_5: @ 80863D8
	ldrh r1, [r0, 0x2E]
	adds r1, 0x1
	strh r1, [r0, 0x2E]
	bx lr
	thumb_func_end PokeballGlowEffect_5

	thumb_func_start PokeballGlowEffect_6
PokeballGlowEffect_6: @ 80863E0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080863F6
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _080863FC
_080863F6:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_080863FC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PokeballGlowEffect_6

	thumb_func_start PokeballGlowEffect_7
PokeballGlowEffect_7: @ 8086404
	bx lr
	thumb_func_end PokeballGlowEffect_7

	thumb_func_start SpriteCB_PokeballGlow
SpriteCB_PokeballGlow: @ 8086408
	push {lr}
	adds r3, r0, 0
	ldr r2, _0808642C @ =gSprites
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2E
	ldrsh r0, [r0, r1]
	cmp r0, 0x4
	ble _08086428
	adds r0, r3, 0
	bl FieldEffectFreeGraphicsResources
_08086428:
	pop {r0}
	bx r0
	.align 2, 0
_0808642C: .4byte gSprites
	thumb_func_end SpriteCB_PokeballGlow

	thumb_func_start PokecenterHealEffectHelper
PokecenterHealEffectHelper: @ 8086430
	push {r4,lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r0, _08086480 @ =gSpriteTemplate_839F220
	lsls r3, 16
	asrs r3, 16
	lsls r2, 16
	asrs r2, 16
	adds r1, r3, 0
	movs r3, 0
	bl CreateSpriteAtEnd
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _08086484 @ =gSprites
	adds r0, r1
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0, 0x5]
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _08086488 @ =gUnknown_0839F1A0
	bl SetSubspriteTables
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08086480: .4byte gSpriteTemplate_839F220
_08086484: .4byte gSprites
_08086488: .4byte gUnknown_0839F1A0
	thumb_func_end PokecenterHealEffectHelper

	thumb_func_start SpriteCB_PokecenterMonitor
SpriteCB_PokecenterMonitor: @ 808648C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080864B0
	movs r0, 0
	strh r0, [r4, 0x2E]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	subs r0, 0x5
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
_080864B0:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080864C4
	adds r0, r4, 0
	bl FieldEffectFreeGraphicsResources
_080864C4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_PokecenterMonitor

	thumb_func_start HallOfFameRecordEffectHelper
HallOfFameRecordEffectHelper: @ 80864CC
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 24
	cmp r3, 0
	bne _08086514
	ldr r0, _08086508 @ =gSpriteTemplate_839F238
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _0808650C @ =gSprites
	adds r0, r1
	ldr r1, _08086510 @ =gUnknown_0839F1C8
	bl SetSubspriteTables
	b _08086528
	.align 2, 0
_08086508: .4byte gSpriteTemplate_839F238
_0808650C: .4byte gSprites
_08086510: .4byte gUnknown_0839F1C8
_08086514:
	ldr r0, _08086548 @ =gSpriteTemplate_839F250
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r4, r0, 24
_08086528:
	ldr r1, _0808654C @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r3]
	strh r5, [r0, 0x2E]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086548: .4byte gSpriteTemplate_839F250
_0808654C: .4byte gSprites
	thumb_func_end HallOfFameRecordEffectHelper

	thumb_func_start SpriteCB_HallOfFameMonitor
SpriteCB_HallOfFameMonitor: @ 8086550
	push {lr}
	adds r3, r0, 0
	ldr r2, _080865B8 @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0x26
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080865A6
	ldrh r1, [r3, 0x30]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r0, 0
	beq _0808657E
	subs r0, r1, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _080865A0
_0808657E:
	movs r0, 0x10
	strh r0, [r3, 0x30]
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
_080865A0:
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
_080865A6:
	movs r2, 0x32
	ldrsh r0, [r3, r2]
	cmp r0, 0x7F
	ble _080865B4
	adds r0, r3, 0
	bl FieldEffectFreeGraphicsResources
_080865B4:
	pop {r0}
	bx r0
	.align 2, 0
_080865B8: .4byte gTasks
	thumb_func_end SpriteCB_HallOfFameMonitor

	thumb_func_start sub_80865BC
sub_80865BC: @ 80865BC
	push {lr}
	ldr r0, _080865D0 @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	ldr r1, _080865D4 @ =gUnknown_0300485C
	ldr r0, _080865D8 @ =mapldr_080842E8
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080865D0: .4byte c2_exit_to_overworld_2_switch
_080865D4: .4byte gUnknown_0300485C
_080865D8: .4byte mapldr_080842E8
	thumb_func_end sub_80865BC

	thumb_func_start mapldr_080842E8
mapldr_080842E8: @ 80865DC
	push {lr}
	bl pal_fill_black
	ldr r0, _080865FC @ =task00_8084310
	movs r1, 0
	bl CreateTask
	bl ScriptContext2_Enable
	bl FreezeMapObjects
	ldr r1, _08086600 @ =gUnknown_0300485C
	movs r0, 0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080865FC: .4byte task00_8084310
_08086600: .4byte gUnknown_0300485C
	thumb_func_end mapldr_080842E8

	thumb_func_start task00_8084310
task00_8084310: @ 8086604
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _0808666C @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r5, [r4, r0]
	cmp r5, 0
	bne _08086640
	bl sub_807D770
	lsls r0, 24
	cmp r0, 0
	beq _08086666
	ldr r1, _08086670 @ =gUnknown_0202FF84
	ldr r0, _08086674 @ =gLastFieldPokeMenuOpened
	ldrb r0, [r0]
	str r0, [r1]
	cmp r0, 0x5
	ble _08086634
	str r5, [r1]
_08086634:
	movs r0, 0x1F
	bl FieldEffectStart
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08086640:
	movs r0, 0x1F
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08086666
	bl flag_var_implications_of_teleport_
	bl warp_in
	ldr r0, _08086678 @ =CB2_LoadMap
	bl SetMainCallback2
	ldr r1, _0808667C @ =gUnknown_0300485C
	ldr r0, _08086680 @ =mapldr_08084390
	str r0, [r1]
	adds r0, r6, 0
	bl DestroyTask
_08086666:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808666C: .4byte gTasks
_08086670: .4byte gUnknown_0202FF84
_08086674: .4byte gLastFieldPokeMenuOpened
_08086678: .4byte CB2_LoadMap
_0808667C: .4byte gUnknown_0300485C
_08086680: .4byte mapldr_08084390
	thumb_func_end task00_8084310

	thumb_func_start mapldr_08084390
mapldr_08084390: @ 8086684
	push {r4,lr}
	bl sub_8053E90
	bl pal_fill_black
	ldr r0, _080866DC @ =c3_080843F8
	movs r1, 0
	bl CreateTask
	ldr r4, _080866E0 @ =gMapObjects
	ldr r3, _080866E4 @ =gPlayerAvatar
	ldrb r1, [r3, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x1]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x1]
	ldrb r1, [r3]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080866C6
	ldrb r1, [r3, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x3
	bl FieldObjectTurn
_080866C6:
	bl ScriptContext2_Enable
	bl FreezeMapObjects
	ldr r1, _080866E8 @ =gUnknown_0300485C
	movs r0, 0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080866DC: .4byte c3_080843F8
_080866E0: .4byte gMapObjects
_080866E4: .4byte gPlayerAvatar
_080866E8: .4byte gUnknown_0300485C
	thumb_func_end mapldr_08084390

	thumb_func_start c3_080843F8
c3_080843F8: @ 80866EC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08086740 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0808671E
	ldr r0, _08086744 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08086738
	movs r0, 0x20
	bl FieldEffectStart
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0808671E:
	movs r0, 0x20
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08086738
	bl ScriptContext2_Disable
	bl UnfreezeMapObjects
	adds r0, r5, 0
	bl DestroyTask
_08086738:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086740: .4byte gTasks
_08086744: .4byte gPaletteFade
	thumb_func_end c3_080843F8

	thumb_func_start sub_8086748
sub_8086748: @ 8086748
	push {lr}
	bl sub_8053E90
	bl pal_fill_for_map_transition
	bl ScriptContext2_Enable
	bl FreezeMapObjects
	ldr r0, _0808676C @ =sub_8086774
	movs r1, 0
	bl CreateTask
	ldr r1, _08086770 @ =gUnknown_0300485C
	movs r0, 0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0808676C: .4byte sub_8086774
_08086770: .4byte gUnknown_0300485C
	thumb_func_end sub_8086748

	thumb_func_start sub_8086774
sub_8086774: @ 8086774
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080867A4 @ =gTasks
	adds r4, r1, r0
	ldr r5, _080867A8 @ =gUnknown_0839F2CC
_08086786:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _08086786
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080867A4: .4byte gTasks
_080867A8: .4byte gUnknown_0839F2CC
	thumb_func_end sub_8086774

	thumb_func_start sub_80867AC
sub_80867AC: @ 80867AC
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	mov r9, r0
	ldr r6, _08086848 @ =gPlayerAvatar
	ldrb r0, [r6, 0x5]
	lsls r5, r0, 3
	adds r5, r0
	lsls r5, 2
	ldr r0, _0808684C @ =gMapObjects
	mov r8, r0
	add r5, r8
	ldrb r0, [r6, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08086850 @ =gSprites
	adds r4, r0
	bl CameraObjectReset2
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	add r0, r8
	ldrb r1, [r0, 0x1]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x1]
	movs r0, 0x1
	strb r0, [r6, 0x6]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetSpecialAnim
	adds r3, r4, 0
	adds r3, 0x42
	ldrb r0, [r3]
	lsrs r0, 6
	mov r1, r9
	strh r0, [r1, 0x10]
	ldrb r0, [r5, 0x3]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r5, 0x3]
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	ldrb r1, [r3]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r3]
	mov r1, r9
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x1
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08086848: .4byte gPlayerAvatar
_0808684C: .4byte gMapObjects
_08086850: .4byte gSprites
	thumb_func_end sub_80867AC

	thumb_func_start sub_8086854
sub_8086854: @ 8086854
	push {r4,lr}
	adds r4, r0, 0
	bl sub_807D770
	lsls r0, 24
	cmp r0, 0
	beq _08086868
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08086868:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8086854

	thumb_func_start sub_8086870
sub_8086870: @ 8086870
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080868D4 @ =gPlayerAvatar
	ldrb r0, [r6, 0x4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _080868D8 @ =gSprites
	adds r2, r0
	adds r0, r2, 0
	adds r0, 0x29
	movs r4, 0
	ldrsb r4, [r0, r4]
	lsls r0, r4, 17
	negs r0, r0
	ldrh r1, [r2, 0x22]
	ldr r3, _080868DC @ =gSpriteCoordOffsetY
	adds r1, r4
	ldrh r3, [r3]
	adds r1, r3
	asrs r0, 16
	adds r0, r1
	negs r0, r0
	movs r1, 0
	strh r0, [r2, 0x26]
	movs r0, 0x1
	strh r0, [r5, 0xA]
	strh r1, [r5, 0xC]
	ldr r2, _080868E0 @ =gMapObjects
	ldrb r0, [r6, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	movs r0, 0x2B
	bl PlaySE
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080868D4: .4byte gPlayerAvatar
_080868D8: .4byte gSprites
_080868DC: .4byte gSpriteCoordOffsetY
_080868E0: .4byte gMapObjects
	thumb_func_end sub_8086870

	thumb_func_start sub_80868E4
sub_80868E4: @ 80868E4
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r2, _08086990 @ =gPlayerAvatar
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086994 @ =gMapObjects
	adds r6, r0, r1
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086998 @ =gSprites
	adds r5, r0, r1
	ldrh r0, [r4, 0xA]
	ldrh r1, [r5, 0x26]
	adds r0, r1
	strh r0, [r5, 0x26]
	ldrh r2, [r4, 0xA]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	bgt _08086926
	ldrh r1, [r4, 0xC]
	adds r0, r2, r1
	strh r0, [r4, 0xC]
	movs r1, 0xF
	ands r0, r1
	cmp r0, 0
	beq _08086926
	lsls r0, r2, 1
	strh r0, [r4, 0xA]
_08086926:
	ldrh r2, [r4, 0xE]
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08086964
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	blt _08086964
	adds r0, r2, 0x1
	strh r0, [r4, 0xE]
	ldrb r1, [r6, 0x3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r6, 0x3]
	ldrb r1, [r4, 0x10]
	adds r3, r5, 0
	adds r3, 0x42
	lsls r1, 6
	ldrb r2, [r3]
	movs r0, 0x3F
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldrb r0, [r6]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r6]
_08086964:
	movs r1, 0x26
	ldrsh r0, [r5, r1]
	cmp r0, 0
	blt _08086988
	movs r0, 0xD6
	bl PlaySE
	ldrb r0, [r6]
	movs r1, 0x8
	orrs r0, r1
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r6]
	movs r0, 0
	strh r0, [r5, 0x26]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08086988:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08086990: .4byte gPlayerAvatar
_08086994: .4byte gMapObjects
_08086998: .4byte gSprites
	thumb_func_end sub_80868E4

	thumb_func_start sub_808699C
sub_808699C: @ 808699C
	push {lr}
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	movs r2, 0
	strh r1, [r0, 0x8]
	movs r1, 0x4
	strh r1, [r0, 0xA]
	strh r2, [r0, 0xC]
	movs r0, 0
	bl SetCameraPanningCallback
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_808699C

	thumb_func_start sub_80869B8
sub_80869B8: @ 80869B8
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl SetCameraPanning
	ldrh r0, [r4, 0xA]
	negs r2, r0
	strh r2, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _080869E0
	lsls r0, r2, 16
	asrs r0, 17
	strh r0, [r4, 0xA]
_080869E0:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080869EE
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080869EE:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80869B8

	thumb_func_start sub_80869F8
sub_80869F8: @ 80869F8
	push {lr}
	ldr r1, _08086A24 @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r1, 0x6]
	bl ScriptContext2_Disable
	bl CameraObjectReset1
	bl UnfreezeMapObjects
	bl InstallCameraPanAheadCallback
	ldr r0, _08086A28 @ =sub_8086774
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08086A24: .4byte gPlayerAvatar
_08086A28: .4byte sub_8086774
	thumb_func_end sub_80869F8

	thumb_func_start sub_8086A2C
sub_8086A2C: @ 8086A2C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08086A60 @ =sub_8086A68
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08086A64 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0xA]
	cmp r4, 0x6A
	bne _08086A58
	movs r0, 0x1
	strh r0, [r1, 0xA]
_08086A58:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086A60: .4byte sub_8086A68
_08086A64: .4byte gTasks
	thumb_func_end sub_8086A2C

	thumb_func_start sub_8086A68
sub_8086A68: @ 8086A68
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08086A98 @ =gTasks
	adds r4, r1, r0
	ldr r5, _08086A9C @ =gUnknown_0839F2E8
_08086A7A:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _08086A7A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086A98: .4byte gTasks
_08086A9C: .4byte gUnknown_0839F2E8
	thumb_func_end sub_8086A68

	thumb_func_start sub_8086AA0
sub_8086AA0: @ 8086AA0
	push {r4,lr}
	adds r4, r0, 0
	bl FreezeMapObjects
	bl CameraObjectReset2
	ldrb r0, [r4, 0xA]
	bl sub_80B4824
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8086AA0

	thumb_func_start sub_8086AC0
sub_8086AC0: @ 8086AC0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08086B28 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086B2C @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08086AEA
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08086B1E
_08086AEA:
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r5, 0x8]
	strh r1, [r5, 0xC]
	strh r1, [r5, 0xE]
	ldrb r0, [r5, 0xA]
	cmp r0, 0
	bne _08086B18
	movs r0, 0x4
	strh r0, [r5, 0x8]
_08086B18:
	movs r0, 0x50
	bl PlaySE
_08086B1E:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08086B28: .4byte gPlayerAvatar
_08086B2C: .4byte gMapObjects
	thumb_func_end sub_8086AC0

	thumb_func_start sub_8086B30
sub_8086B30: @ 8086B30
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8086B98
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	ble _08086B4A
	bl sub_8086C30
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08086B4A:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8086B30

	thumb_func_start sub_8086B54
sub_8086B54: @ 8086B54
	push {lr}
	bl sub_8086B98
	bl sub_8086C40
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8086B54

	thumb_func_start sub_8086B64
sub_8086B64: @ 8086B64
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8086BE4
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	ble _08086B7E
	bl sub_8086C30
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08086B7E:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8086B64

	thumb_func_start sub_8086B88
sub_8086B88: @ 8086B88
	push {lr}
	bl sub_8086BE4
	bl sub_8086C40
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8086B88

	thumb_func_start sub_8086B98
sub_8086B98: @ 8086B98
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08086BDC @ =gPlayerAvatar
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08086BE0 @ =gSprites
	adds r4, r0
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	movs r0, 0x84
	bl Cos
	strh r0, [r4, 0x24]
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	movs r0, 0x94
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r5, 0xE]
	adds r0, 0x1
	strh r0, [r5, 0xE]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08086BD6
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
_08086BD6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086BDC: .4byte gPlayerAvatar
_08086BE0: .4byte gSprites
	thumb_func_end sub_8086B98

	thumb_func_start sub_8086BE4
sub_8086BE4: @ 8086BE4
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08086C28 @ =gPlayerAvatar
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08086C2C @ =gSprites
	adds r4, r0
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	movs r0, 0x7C
	bl Cos
	strh r0, [r4, 0x24]
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	movs r0, 0x76
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r5, 0xE]
	adds r0, 0x1
	strh r0, [r5, 0xE]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08086C22
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
_08086C22:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086C28: .4byte gPlayerAvatar
_08086C2C: .4byte gSprites
	thumb_func_end sub_8086BE4

	thumb_func_start sub_8086C30
sub_8086C30: @ 8086C30
	push {lr}
	bl sub_8053FF8
	bl fade_8080918
	pop {r0}
	bx r0
	thumb_func_end sub_8086C30

	thumb_func_start sub_8086C40
sub_8086C40: @ 8086C40
	push {lr}
	ldr r0, _08086C80 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08086C7C
	bl sub_8054034
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08086C7C
	bl sub_80B483C
	bl warp_in
	ldr r1, _08086C84 @ =gUnknown_0300485C
	ldr r0, _08086C88 @ =sub_8086C94
	str r0, [r1]
	ldr r0, _08086C8C @ =CB2_LoadMap
	bl SetMainCallback2
	ldr r0, _08086C90 @ =sub_8086A68
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08086C7C:
	pop {r0}
	bx r0
	.align 2, 0
_08086C80: .4byte gPaletteFade
_08086C84: .4byte gUnknown_0300485C
_08086C88: .4byte sub_8086C94
_08086C8C: .4byte CB2_LoadMap
_08086C90: .4byte sub_8086A68
	thumb_func_end sub_8086C40

	thumb_func_start sub_8086C94
sub_8086C94: @ 8086C94
	push {lr}
	bl sub_8053E90
	bl pal_fill_for_map_transition
	bl ScriptContext2_Enable
	ldr r0, _08086CB4 @ =sub_8086CBC
	movs r1, 0
	bl CreateTask
	ldr r1, _08086CB8 @ =gUnknown_0300485C
	movs r0, 0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08086CB4: .4byte sub_8086CBC
_08086CB8: .4byte gUnknown_0300485C
	thumb_func_end sub_8086C94

	thumb_func_start sub_8086CBC
sub_8086CBC: @ 8086CBC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08086CEC @ =gTasks
	adds r4, r1, r0
	ldr r5, _08086CF0 @ =gUnknown_0839F300
_08086CCE:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _08086CCE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086CEC: .4byte gTasks
_08086CF0: .4byte gUnknown_0839F300
	thumb_func_end sub_8086CBC

	thumb_func_start sub_8086CF4
sub_8086CF4: @ 8086CF4
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	bl CameraObjectReset2
	ldr r0, _08086D54 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08086D58 @ =gMapObjects
	adds r4, r0
	movs r0, 0x4
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r1, r0, 24
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x10
	strh r0, [r5, 0xA]
	cmp r1, 0x6B
	bne _08086D5C
	movs r1, 0x1
	movs r0, 0x3
	strh r0, [r5, 0x8]
	b _08086D5E
	.align 2, 0
_08086D54: .4byte gPlayerAvatar
_08086D58: .4byte gMapObjects
_08086D5C:
	movs r1, 0
_08086D5E:
	adds r0, r1, 0
	bl sub_80B4824
	movs r0, 0x1
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8086CF4

	thumb_func_start sub_8086D70
sub_8086D70: @ 8086D70
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08086DA8 @ =gPlayerAvatar
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08086DAC @ =gSprites
	adds r4, r0
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	movs r0, 0x84
	bl Cos
	strh r0, [r4, 0x24]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	movs r0, 0x94
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08086DA8: .4byte gPlayerAvatar
_08086DAC: .4byte gSprites
	thumb_func_end sub_8086D70

	thumb_func_start sub_8086DB0
sub_8086DB0: @ 8086DB0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _08086E08 @ =gPlayerAvatar
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086E0C @ =gSprites
	adds r5, r0, r1
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0x84
	bl Cos
	strh r0, [r5, 0x24]
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0x94
	bl Sin
	strh r0, [r5, 0x26]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08086DEE
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
_08086DEE:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08086DFE
	strh r0, [r5, 0x24]
	strh r0, [r5, 0x26]
	movs r0, 0x5
	strh r0, [r4, 0x8]
_08086DFE:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08086E08: .4byte gPlayerAvatar
_08086E0C: .4byte gSprites
	thumb_func_end sub_8086DB0

	thumb_func_start sub_8086E10
sub_8086E10: @ 8086E10
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08086E48 @ =gPlayerAvatar
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08086E4C @ =gSprites
	adds r4, r0
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	movs r0, 0x7C
	bl Cos
	strh r0, [r4, 0x24]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	movs r0, 0x76
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08086E48: .4byte gPlayerAvatar
_08086E4C: .4byte gSprites
	thumb_func_end sub_8086E10

	thumb_func_start sub_8086E50
sub_8086E50: @ 8086E50
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _08086EA8 @ =gPlayerAvatar
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086EAC @ =gSprites
	adds r5, r0, r1
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0x7C
	bl Cos
	strh r0, [r5, 0x24]
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0x76
	bl Sin
	strh r0, [r5, 0x26]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08086E8E
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
_08086E8E:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08086EA0
	strh r0, [r5, 0x24]
	strh r0, [r5, 0x26]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08086EA0:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08086EA8: .4byte gPlayerAvatar
_08086EAC: .4byte gSprites
	thumb_func_end sub_8086E50

	thumb_func_start sub_8086EB0
sub_8086EB0: @ 8086EB0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80B4850
	lsls r0, 24
	cmp r0, 0
	bne _08086ECC
	bl sub_80B483C
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	b _08086ECE
_08086ECC:
	movs r0, 0
_08086ECE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8086EB0

	thumb_func_start sub_8086ED4
sub_8086ED4: @ 8086ED4
	push {r4,lr}
	ldr r0, _08086F20 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086F24 @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08086F18
	bl CameraObjectReset1
	bl ScriptContext2_Disable
	movs r0, 0x4
	bl GetGoSpeed0AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldr r0, _08086F28 @ =sub_8086CBC
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08086F18:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08086F20: .4byte gPlayerAvatar
_08086F24: .4byte gMapObjects
_08086F28: .4byte sub_8086CBC
	thumb_func_end sub_8086ED4

	thumb_func_start FldEff_UseWaterfall
FldEff_UseWaterfall: @ 8086F2C
	push {r4,lr}
	ldr r4, _08086F58 @ =sub_8086F64
	adds r0, r4, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08086F5C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _08086F60 @ =gUnknown_0202FF84
	ldr r2, [r2]
	strh r2, [r1, 0xA]
	bl _call_via_r4
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08086F58: .4byte sub_8086F64
_08086F5C: .4byte gTasks
_08086F60: .4byte gUnknown_0202FF84
	thumb_func_end FldEff_UseWaterfall

	thumb_func_start sub_8086F64
sub_8086F64: @ 8086F64
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08086FA0 @ =gUnknown_0839F31C
	ldr r2, _08086FA4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_08086F76:
	movs r0, 0x8
	ldrsh r2, [r4, r0]
	lsls r2, 2
	adds r2, r5
	ldr r0, _08086FA8 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _08086FAC @ =gMapObjects
	adds r1, r0
	ldr r2, [r2]
	adds r0, r4, 0
	bl _call_via_r2
	lsls r0, 24
	cmp r0, 0
	bne _08086F76
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086FA0: .4byte gUnknown_0839F31C
_08086FA4: .4byte gTasks
_08086FA8: .4byte gPlayerAvatar
_08086FAC: .4byte gMapObjects
	thumb_func_end sub_8086F64

	thumb_func_start sub_8086FB0
sub_8086FB0: @ 8086FB0
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	ldr r1, _08086FCC @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08086FCC: .4byte gPlayerAvatar
	thumb_func_end sub_8086FB0

	thumb_func_start waterfall_1_do_anim_probably
waterfall_1_do_anim_probably: @ 8086FD0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl ScriptContext2_Enable
	adds r0, r5, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	bne _08087000
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	ldr r1, _08087008 @ =gUnknown_0202FF84
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r0, 0x3B
	bl FieldEffectStart
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08087000:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08087008: .4byte gUnknown_0202FF84
	thumb_func_end waterfall_1_do_anim_probably

	thumb_func_start waterfall_2_wait_anim_finish_probably
waterfall_2_wait_anim_finish_probably: @ 808700C
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x6
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08087026
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	b _08087028
_08087026:
	movs r0, 0
_08087028:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end waterfall_2_wait_anim_finish_probably

	thumb_func_start sub_8087030
sub_8087030: @ 8087030
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r0, 0x2
	bl GetSimpleGoAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8087030

	thumb_func_start sub_8087058
sub_8087058: @ 8087058
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	bne _0808706E
	movs r0, 0
	b _080870AA
_0808706E:
	ldrb r0, [r4, 0x1E]
	bl MetatileBehavior_IsWaterfall
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080870A4
	bl ScriptContext2_Disable
	ldr r0, _0808709C @ =gPlayerAvatar
	strb r4, [r0, 0x6]
	ldr r0, _080870A0 @ =sub_8086F64
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0x2B
	bl FieldEffectActiveListRemove
	movs r0, 0
	b _080870AA
	.align 2, 0
_0808709C: .4byte gPlayerAvatar
_080870A0: .4byte sub_8086F64
_080870A4:
	movs r0, 0x3
	strh r0, [r5, 0x8]
	movs r0, 0x1
_080870AA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8087058

	thumb_func_start FldEff_UseDive
FldEff_UseDive: @ 80870B0
	push {r4,lr}
	ldr r4, _080870E0 @ =Task_Dive
	adds r0, r4, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080870E4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r3, _080870E8 @ =gUnknown_0202FF84
	ldr r2, [r3]
	strh r2, [r1, 0x26]
	ldr r2, [r3, 0x4]
	strh r2, [r1, 0x24]
	bl _call_via_r4
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080870E0: .4byte Task_Dive
_080870E4: .4byte gTasks
_080870E8: .4byte gUnknown_0202FF84
	thumb_func_end FldEff_UseDive

	thumb_func_start Task_Dive
Task_Dive: @ 80870EC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0808711C @ =gUnknown_0839F330
	ldr r2, _08087120 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080870FE:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080870FE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808711C: .4byte gUnknown_0839F330
_08087120: .4byte gTasks
	thumb_func_end Task_Dive

	thumb_func_start sub_8087124
sub_8087124: @ 8087124
	ldr r2, _08087134 @ =gPlayerAvatar
	movs r1, 0x1
	strb r1, [r2, 0x6]
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	movs r0, 0
	bx lr
	.align 2, 0
_08087134: .4byte gPlayerAvatar
	thumb_func_end sub_8087124

	thumb_func_start dive_2_unknown
dive_2_unknown: @ 8087138
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	ldr r1, _0808715C @ =gUnknown_0202FF84
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r0, 0x3B
	bl FieldEffectStart
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808715C: .4byte gUnknown_0202FF84
	thumb_func_end dive_2_unknown

	thumb_func_start dive_3_unknown
dive_3_unknown: @ 8087160
	push {lr}
	sub sp, 0x8
	mov r1, sp
	adds r1, 0x2
	mov r0, sp
	bl PlayerGetDestCoords
	movs r0, 0x6
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _080871A4
	ldr r2, _080871AC @ =gMapObjects
	ldr r0, _080871B0 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1E]
	mov r0, sp
	bl dive_warp
	ldr r0, _080871B4 @ =Task_Dive
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0x2C
	bl FieldEffectActiveListRemove
_080871A4:
	movs r0, 0
	add sp, 0x8
	pop {r1}
	bx r1
	.align 2, 0
_080871AC: .4byte gMapObjects
_080871B0: .4byte gPlayerAvatar
_080871B4: .4byte Task_Dive
	thumb_func_end dive_3_unknown

	thumb_func_start sub_80871B8
sub_80871B8: @ 80871B8
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _080871CC @ =sub_80871D0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080871CC: .4byte sub_80871D0
	thumb_func_end sub_80871B8

	thumb_func_start sub_80871D0
sub_80871D0: @ 80871D0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _08087218 @ =gUnknown_0839F33C
	ldr r2, _0808721C @ =gTasks
	ldr r5, _08087220 @ =gPlayerAvatar
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080871E4:
	movs r0, 0x8
	ldrsh r3, [r4, r0]
	lsls r3, 2
	adds r3, r6
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _08087224 @ =gMapObjects
	adds r1, r0
	ldrb r0, [r5, 0x4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08087228 @ =gSprites
	adds r2, r0
	ldr r3, [r3]
	adds r0, r4, 0
	bl _call_via_r3
	lsls r0, 24
	cmp r0, 0
	bne _080871E4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08087218: .4byte gUnknown_0839F33C
_0808721C: .4byte gTasks
_08087220: .4byte gPlayerAvatar
_08087224: .4byte gMapObjects
_08087228: .4byte gSprites
	thumb_func_end sub_80871D0

	thumb_func_start sub_808722C
sub_808722C: @ 808722C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl FreezeMapObjects
	bl CameraObjectReset2
	movs r0, 0
	bl SetCameraPanningCallback
	ldr r0, _08087260 @ =gPlayerAvatar
	movs r2, 0x1
	strb r2, [r0, 0x6]
	ldrb r0, [r5, 0x3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r5, 0x3]
	strh r2, [r4, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08087260: .4byte gPlayerAvatar
	thumb_func_end sub_808722C

	thumb_func_start sub_8087264
sub_8087264: @ 8087264
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl SetCameraPanning
	ldrh r0, [r4, 0xA]
	negs r0, r0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _08087290
	movs r0, 0
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08087290:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8087264

	thumb_func_start sub_8087298
sub_8087298: @ 8087298
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0
	strh r0, [r2, 0x26]
	movs r0, 0x1
	strh r0, [r4, 0xE]
	ldr r3, _080872E0 @ =gUnknown_0202FF84
	movs r5, 0x10
	ldrsh r0, [r1, r5]
	str r0, [r3]
	movs r5, 0x12
	ldrsh r0, [r1, r5]
	str r0, [r3, 0x4]
	adds r0, r2, 0
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	str r0, [r3, 0x8]
	ldrb r0, [r2, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r3, 0xC]
	movs r0, 0x32
	bl FieldEffectStart
	movs r0, 0xB2
	bl PlaySE
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080872E0: .4byte gUnknown_0202FF84
	thumb_func_end sub_8087298

	thumb_func_start sub_80872E4
sub_80872E4: @ 80872E4
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r6, r1, 0
	adds r5, r2, 0
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl SetCameraPanning
	ldrh r0, [r4, 0xA]
	negs r2, r0
	strh r2, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r1, r0, 0x1
	strh r1, [r4, 0xC]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x11
	bgt _0808731E
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	bne _08087330
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x3
	bgt _08087330
	lsls r0, r2, 1
	b _0808732E
_0808731E:
	movs r0, 0x4
	ands r1, r0
	cmp r1, 0
	bne _08087330
	lsls r0, r2, 16
	cmp r0, 0
	ble _08087330
	asrs r0, 17
_0808732E:
	strh r0, [r4, 0xA]
_08087330:
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x6
	ble _0808737C
	adds r0, r5, 0
	adds r0, 0x29
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r2, r1, 17
	negs r2, r2
	movs r7, 0x26
	ldrsh r3, [r5, r7]
	movs r7, 0x22
	ldrsh r0, [r5, r7]
	adds r0, r1
	ldr r1, _08087374 @ =gSpriteCoordOffsetY
	movs r7, 0
	ldrsh r1, [r1, r7]
	adds r0, r1
	asrs r2, 16
	adds r0, r2
	cmn r3, r0
	ble _08087378
	ldrh r0, [r5, 0x26]
	ldrh r1, [r4, 0xE]
	subs r0, r1
	strh r0, [r5, 0x26]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x7
	bgt _0808737C
	adds r0, r1, 0x1
	strh r0, [r4, 0xE]
	b _0808737C
	.align 2, 0
_08087374: .4byte gSpriteCoordOffsetY
_08087378:
	movs r0, 0x1
	strh r0, [r4, 0x10]
_0808737C:
	ldrh r2, [r4, 0x12]
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080873BA
	movs r7, 0x26
	ldrsh r1, [r5, r7]
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	bge _080873BA
	adds r0, r2, 0x1
	strh r0, [r4, 0x12]
	ldrb r0, [r6, 0x3]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r6, 0x3]
	ldrb r1, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, 0x5]
	adds r2, r5, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
_080873BA:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080873D0
	movs r7, 0x10
	ldrsh r0, [r4, r7]
	cmp r0, 0
	beq _080873D0
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080873D0:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80872E4

	thumb_func_start sub_80873D8
sub_80873D8: @ 80873D8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8053FF8
	bl fade_8080918
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80873D8

	thumb_func_start sub_80873F4
sub_80873F4: @ 80873F4
	push {lr}
	ldr r0, _08087434 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808742C
	bl sub_8054034
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808742C
	bl warp_in
	ldr r1, _08087438 @ =gUnknown_0300485C
	ldr r0, _0808743C @ =mapldr_080851BC
	str r0, [r1]
	ldr r0, _08087440 @ =CB2_LoadMap
	bl SetMainCallback2
	ldr r0, _08087444 @ =sub_80871D0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0808742C:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08087434: .4byte gPaletteFade
_08087438: .4byte gUnknown_0300485C
_0808743C: .4byte mapldr_080851BC
_08087440: .4byte CB2_LoadMap
_08087444: .4byte sub_80871D0
	thumb_func_end sub_80873F4

	thumb_func_start mapldr_080851BC
mapldr_080851BC: @ 8087448
	push {lr}
	bl sub_8053E90
	bl pal_fill_for_map_transition
	bl ScriptContext2_Enable
	ldr r0, _08087468 @ =gUnknown_0300485C
	movs r1, 0
	str r1, [r0]
	ldr r0, _0808746C @ =sub_8087470
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08087468: .4byte gUnknown_0300485C
_0808746C: .4byte sub_8087470
	thumb_func_end mapldr_080851BC

	thumb_func_start sub_8087470
sub_8087470: @ 8087470
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _080874B8 @ =gUnknown_0839F354
	ldr r2, _080874BC @ =gTasks
	ldr r5, _080874C0 @ =gPlayerAvatar
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_08087484:
	movs r0, 0x8
	ldrsh r3, [r4, r0]
	lsls r3, 2
	adds r3, r6
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _080874C4 @ =gMapObjects
	adds r1, r0
	ldrb r0, [r5, 0x4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _080874C8 @ =gSprites
	adds r2, r0
	ldr r3, [r3]
	adds r0, r4, 0
	bl _call_via_r3
	lsls r0, 24
	cmp r0, 0
	bne _08087484
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080874B8: .4byte gUnknown_0839F354
_080874BC: .4byte gTasks
_080874C0: .4byte gPlayerAvatar
_080874C4: .4byte gMapObjects
_080874C8: .4byte gSprites
	thumb_func_end sub_8087470

	thumb_func_start sub_80874CC
sub_80874CC: @ 80874CC
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	bl CameraObjectReset2
	bl FreezeMapObjects
	ldr r1, _080874F8 @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080874F8: .4byte gPlayerAvatar
	thumb_func_end sub_80874CC

	thumb_func_start sub_80874FC
sub_80874FC: @ 80874FC
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	bl sub_807D770
	lsls r0, 24
	cmp r0, 0
	beq _0808753C
	ldr r1, _08087544 @ =gUnknown_0202FF84
	movs r2, 0x10
	ldrsh r0, [r5, r2]
	str r0, [r1]
	movs r2, 0x12
	ldrsh r0, [r5, r2]
	str r0, [r1, 0x4]
	adds r0, r6, 0
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	str r0, [r1, 0x8]
	ldrb r0, [r6, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r1, 0xC]
	movs r0, 0x31
	bl FieldEffectStart
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0808753C:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08087544: .4byte gUnknown_0202FF84
	thumb_func_end sub_80874FC

	thumb_func_start sub_8087548
sub_8087548: @ 8087548
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0xA
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087598 @ =gSprites
	adds r0, r1
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _08087590
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	ldrb r1, [r4, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	bl CameraObjectReset1
	movs r0, 0xAF
	bl PlaySE
	movs r0, 0x4
	bl sub_80608A4
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
_08087590:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08087598: .4byte gSprites
	thumb_func_end sub_8087548

	thumb_func_start sub_808759C
sub_808759C: @ 808759C
	push {lr}
	adds r0, r1, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _080875C6
	ldr r1, _080875CC @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r1, 0x6]
	bl ScriptContext2_Disable
	bl UnfreezeMapObjects
	ldr r0, _080875D0 @ =sub_8087470
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_080875C6:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080875CC: .4byte gPlayerAvatar
_080875D0: .4byte sub_8087470
	thumb_func_end sub_808759C

	thumb_func_start FldEff_LavaridgeGymWarp
FldEff_LavaridgeGymWarp: @ 80875D4
	push {r4,lr}
	ldr r4, _0808762C @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08087630 @ =gFieldEffectObjectTemplatePointers
	adds r0, 0x84
	ldr r0, [r0]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08087634 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	movs r1, 0x3
	ldrb r3, [r4, 0xC]
	ands r3, r1
	lsls r3, 2
	ldrb r4, [r2, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r4
	orrs r1, r3
	strb r1, [r2, 0x5]
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r3, 0x2
	orrs r1, r3
	strb r1, [r2]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808762C: .4byte gUnknown_0202FF84
_08087630: .4byte gFieldEffectObjectTemplatePointers
_08087634: .4byte gSprites
	thumb_func_end FldEff_LavaridgeGymWarp

	thumb_func_start sub_8087638
sub_8087638: @ 8087638
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08087650
	adds r0, r2, 0
	movs r1, 0x32
	bl FieldEffectStop
_08087650:
	pop {r0}
	bx r0
	thumb_func_end sub_8087638

	thumb_func_start sub_8087654
sub_8087654: @ 8087654
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08087668 @ =sub_808766C
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08087668: .4byte sub_808766C
	thumb_func_end sub_8087654

	thumb_func_start sub_808766C
sub_808766C: @ 808766C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _080876B4 @ =gUnknown_0839F364
	ldr r2, _080876B8 @ =gTasks
	ldr r5, _080876BC @ =gPlayerAvatar
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_08087680:
	movs r0, 0x8
	ldrsh r3, [r4, r0]
	lsls r3, 2
	adds r3, r6
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _080876C0 @ =gMapObjects
	adds r1, r0
	ldrb r0, [r5, 0x4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _080876C4 @ =gSprites
	adds r2, r0
	ldr r3, [r3]
	adds r0, r4, 0
	bl _call_via_r3
	lsls r0, 24
	cmp r0, 0
	bne _08087680
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080876B4: .4byte gUnknown_0839F364
_080876B8: .4byte gTasks
_080876BC: .4byte gPlayerAvatar
_080876C0: .4byte gMapObjects
_080876C4: .4byte gSprites
	thumb_func_end sub_808766C

	thumb_func_start sub_80876C8
sub_80876C8: @ 80876C8
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	bl FreezeMapObjects
	bl CameraObjectReset2
	ldr r1, _080876F4 @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrb r0, [r4, 0x3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4, 0x3]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080876F4: .4byte gPlayerAvatar
	thumb_func_end sub_80876C8

	thumb_func_start sub_80876F8
sub_80876F8: @ 80876F8
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r6, r2, 0
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0808776C
	ldrh r1, [r5, 0xA]
	movs r2, 0xA
	ldrsh r0, [r5, r2]
	cmp r0, 0x3
	ble _0808774C
	ldr r1, _08087748 @ =gUnknown_0202FF84
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	str r0, [r1, 0x4]
	adds r0, r6, 0
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	str r0, [r1, 0x8]
	ldrb r0, [r6, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r1, 0xC]
	movs r0, 0x31
	bl FieldEffectStart
	strh r0, [r5, 0xA]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _0808776C
	.align 2, 0
_08087748: .4byte gUnknown_0202FF84
_0808774C:
	adds r0, r1, 0x1
	strh r0, [r5, 0xA]
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetStepInPlaceDelay4AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	movs r0, 0x27
	bl PlaySE
_0808776C:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80876F8

	thumb_func_start sub_8087774
sub_8087774: @ 8087774
	push {r4,lr}
	adds r3, r0, 0
	adds r4, r1, 0
	ldr r2, _080877A8 @ =gSprites
	movs r0, 0xA
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0808779E
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_0808779E:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080877A8: .4byte gSprites
	thumb_func_end sub_8087774

	thumb_func_start sub_80877AC
sub_80877AC: @ 80877AC
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x31
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _080877CA
	bl sub_8053FF8
	bl fade_8080918
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080877CA:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80877AC

	thumb_func_start sub_80877D4
sub_80877D4: @ 80877D4
	push {lr}
	ldr r0, _08087814 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808780C
	bl sub_8054034
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808780C
	bl warp_in
	ldr r1, _08087818 @ =gUnknown_0300485C
	ldr r0, _0808781C @ =sub_8086748
	str r0, [r1]
	ldr r0, _08087820 @ =CB2_LoadMap
	bl SetMainCallback2
	ldr r0, _08087824 @ =sub_808766C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0808780C:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08087814: .4byte gPaletteFade
_08087818: .4byte gUnknown_0300485C
_0808781C: .4byte sub_8086748
_08087820: .4byte CB2_LoadMap
_08087824: .4byte sub_808766C
	thumb_func_end sub_80877D4

	thumb_func_start FldEff_PopOutOfAsh
FldEff_PopOutOfAsh: @ 8087828
	push {r4,lr}
	ldr r4, _08087880 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08087884 @ =gFieldEffectObjectTemplatePointers
	adds r0, 0x80
	ldr r0, [r0]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08087888 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	movs r1, 0x3
	ldrb r3, [r4, 0xC]
	ands r3, r1
	lsls r3, 2
	ldrb r4, [r2, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r4
	orrs r1, r3
	strb r1, [r2, 0x5]
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r3, 0x2
	orrs r1, r3
	strb r1, [r2]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08087880: .4byte gUnknown_0202FF84
_08087884: .4byte gFieldEffectObjectTemplatePointers
_08087888: .4byte gSprites
	thumb_func_end FldEff_PopOutOfAsh

	thumb_func_start sub_808788C
sub_808788C: @ 808788C
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080878A4
	adds r0, r2, 0
	movs r1, 0x31
	bl FieldEffectStop
_080878A4:
	pop {r0}
	bx r0
	thumb_func_end sub_808788C

	thumb_func_start sub_80878A8
sub_80878A8: @ 80878A8
	push {lr}
	bl ScriptContext2_Enable
	bl FreezeMapObjects
	ldr r0, _080878C0 @ =sub_80878C4
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080878C0: .4byte sub_80878C4
	thumb_func_end sub_80878A8

	thumb_func_start sub_80878C4
sub_80878C4: @ 80878C4
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _080878EC @ =gUnknown_0839F378
	ldr r2, _080878F0 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080878EC: .4byte gUnknown_0839F378
_080878F0: .4byte gTasks
	thumb_func_end sub_80878C4

	thumb_func_start sub_80878F4
sub_80878F4: @ 80878F4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x40
	strh r0, [r4, 0x24]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80878F4

	thumb_func_start sub_8087914
sub_8087914: @ 8087914
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _080879B8 @ =gUnknown_0839F380
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldrh r1, [r4, 0x24]
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08087940
	subs r0, r1, 0x1
	strh r0, [r4, 0x24]
	lsls r0, 16
	cmp r0, 0
	bne _08087940
	bl sub_8053FF8
	bl fade_8080918
_08087940:
	ldr r0, _080879BC @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080879C0 @ =gMapObjects
	adds r5, r0, r1
	adds r0, r5, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08087966
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08087A20
_08087966:
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080879D8
	ldr r0, _080879C4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080879D8
	bl sub_8054034
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080879D8
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetDirection
	bl sub_8053678
	bl warp_in
	ldr r1, _080879C8 @ =gUnknown_0300485C
	ldr r0, _080879CC @ =mapldr_080859D4
	str r0, [r1]
	ldr r0, _080879D0 @ =CB2_LoadMap
	bl SetMainCallback2
	ldr r0, _080879D4 @ =sub_80878C4
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	b _08087A20
	.align 2, 0
_080879B8: .4byte gUnknown_0839F380
_080879BC: .4byte gPlayerAvatar
_080879C0: .4byte gMapObjects
_080879C4: .4byte gPaletteFade
_080879C8: .4byte gUnknown_0300485C
_080879CC: .4byte mapldr_080859D4
_080879D0: .4byte CB2_LoadMap
_080879D4: .4byte sub_80878C4
_080879D8:
	ldrh r1, [r4, 0xA]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080879EC
	subs r0, r1, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bne _08087A20
_080879EC:
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r0, [r0]
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetSpecialAnim
	ldrh r1, [r4, 0xC]
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0xB
	bgt _08087A14
	adds r0, r1, 0x1
	strh r0, [r4, 0xC]
_08087A14:
	ldrh r1, [r4, 0xC]
	lsls r1, 16
	asrs r1, 18
	movs r0, 0x8
	asrs r0, r1
	strh r0, [r4, 0xA]
_08087A20:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8087914

	thumb_func_start mapldr_080859D4
mapldr_080859D4: @ 8087A28
	push {lr}
	bl sub_8053E90
	bl pal_fill_for_map_transition
	bl ScriptContext2_Enable
	bl FreezeMapObjects
	ldr r1, _08087A64 @ =gUnknown_0300485C
	movs r0, 0
	str r0, [r1]
	ldr r2, _08087A68 @ =gMapObjects
	ldr r0, _08087A6C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x1]
	ldr r0, _08087A70 @ =sub_8087A74
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08087A64: .4byte gUnknown_0300485C
_08087A68: .4byte gMapObjects
_08087A6C: .4byte gPlayerAvatar
_08087A70: .4byte sub_8087A74
	thumb_func_end mapldr_080859D4

	thumb_func_start sub_8087A74
sub_8087A74: @ 8087A74
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08087A9C @ =gUnknown_0839F388
	ldr r2, _08087AA0 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08087A9C: .4byte gUnknown_0839F388
_08087AA0: .4byte gTasks
	thumb_func_end sub_8087A74

	thumb_func_start sub_8087AA4
sub_8087AA4: @ 8087AA4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_807D770
	lsls r0, 24
	cmp r0, 0
	beq _08087AC2
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
_08087AC2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8087AA4

	thumb_func_start sub_8087AC8
sub_8087AC8: @ 8087AC8
	push {r4-r6,lr}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r1, _08087B4C @ =gUnknown_0839F380
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldr r0, _08087B50 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087B54 @ =gMapObjects
	adds r6, r0, r1
	ldrh r1, [r5, 0xA]
	movs r2, 0xA
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _08087AFA
	subs r0, r1, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	cmp r0, 0
	bne _08087B8C
_08087AFA:
	adds r0, r6, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08087B12
	adds r0, r6, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08087BA0
_08087B12:
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	cmp r0, 0x1F
	ble _08087B5C
	movs r2, 0x26
	ldrsh r4, [r5, r2]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _08087B5C
	ldrb r1, [r6, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r6, 0x1]
	bl ScriptContext2_Disable
	bl UnfreezeMapObjects
	ldr r0, _08087B58 @ =sub_8087A74
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	b _08087BA0
	.align 2, 0
_08087B4C: .4byte gUnknown_0839F380
_08087B50: .4byte gPlayerAvatar
_08087B54: .4byte gMapObjects
_08087B58: .4byte sub_8087A74
_08087B5C:
	ldrb r0, [r6, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r0, [r0]
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl FieldObjectSetSpecialAnim
	ldrh r1, [r5, 0xC]
	movs r2, 0xC
	ldrsh r0, [r5, r2]
	cmp r0, 0x1F
	bgt _08087B84
	adds r0, r1, 0x1
	strh r0, [r5, 0xC]
_08087B84:
	ldrh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 18
	strh r0, [r5, 0xA]
_08087B8C:
	ldrb r2, [r6, 0x1]
	lsls r1, r2, 26
	lsrs r1, 31
	movs r0, 0x1
	eors r1, r0
	lsls r1, 5
	subs r0, 0x22
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, 0x1]
_08087BA0:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8087AC8

	thumb_func_start sub_8087BA8
sub_8087BA8: @ 8087BA8
	push {lr}
	ldr r0, _08087BB8 @ =sub_8087BBC
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08087BB8: .4byte sub_8087BBC
	thumb_func_end sub_8087BA8

	thumb_func_start sub_8087BBC
sub_8087BBC: @ 8087BBC
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08087BE4 @ =gUnknown_0839F390
	ldr r2, _08087BE8 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08087BE4: .4byte gUnknown_0839F390
_08087BE8: .4byte gTasks
	thumb_func_end sub_8087BBC

	thumb_func_start sub_8087BEC
sub_8087BEC: @ 8087BEC
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	bl FreezeMapObjects
	bl CameraObjectReset2
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8087BEC

	thumb_func_start sub_8087C14
sub_8087C14: @ 8087C14
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _08087C98 @ =gUnknown_0839F380
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldr r0, _08087C9C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087CA0 @ =gMapObjects
	adds r5, r0, r1
	ldrh r1, [r4, 0xA]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08087C46
	subs r0, r1, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bne _08087C60
_08087C46:
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
	adds r0, r5, 0
	bl FieldObjectTurn
	movs r0, 0x8
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
_08087C60:
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	ble _08087C8E
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	cmp r1, r0
	bne _08087C8E
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x4
	strh r0, [r4, 0xA]
	movs r0, 0x8
	strh r0, [r4, 0xC]
	movs r0, 0x1
	strh r0, [r4, 0xE]
	movs r0, 0x2D
	bl PlaySE
_08087C8E:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087C98: .4byte gUnknown_0839F380
_08087C9C: .4byte gPlayerAvatar
_08087CA0: .4byte gMapObjects
	thumb_func_end sub_8087C14

	thumb_func_start sub_8087CA4
sub_8087CA4: @ 8087CA4
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _08087D68 @ =gUnknown_0839F380
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldr r2, _08087D6C @ =gPlayerAvatar
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087D70 @ =gMapObjects
	adds r3, r0, r1
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087D74 @ =gSprites
	adds r5, r0, r1
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bgt _08087CEE
	movs r0, 0x4
	strh r0, [r4, 0xA]
	ldrb r0, [r3, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
	adds r0, r3, 0
	bl FieldObjectTurn
_08087CEE:
	ldrh r0, [r5, 0x22]
	ldrh r1, [r4, 0xE]
	subs r0, r1
	strh r0, [r5, 0x22]
	ldrh r1, [r4, 0xE]
	ldrh r2, [r4, 0x10]
	adds r0, r1, r2
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bgt _08087D1A
	movs r0, 0x4
	strh r0, [r4, 0xC]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x7
	bgt _08087D1A
	lsls r0, r1, 1
	strh r0, [r4, 0xE]
_08087D1A:
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	ble _08087D48
	ldrb r1, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r5, 0x5]
	adds r2, r5, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0
	beq _08087D48
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
_08087D48:
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0xA7
	ble _08087D5E
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	bl sub_8053FF8
	bl fade_8080918
_08087D5E:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087D68: .4byte gUnknown_0839F380
_08087D6C: .4byte gPlayerAvatar
_08087D70: .4byte gMapObjects
_08087D74: .4byte gSprites
	thumb_func_end sub_8087CA4

	thumb_func_start sub_8087D78
sub_8087D78: @ 8087D78
	push {lr}
	ldr r0, _08087DB8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08087DB4
	bl sub_8054034
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08087DB4
	bl sub_8053570
	bl warp_in
	ldr r0, _08087DBC @ =CB2_LoadMap
	bl SetMainCallback2
	ldr r1, _08087DC0 @ =gUnknown_0300485C
	ldr r0, _08087DC4 @ =mapldr_08085D88
	str r0, [r1]
	ldr r0, _08087DC8 @ =sub_8087BBC
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08087DB4:
	pop {r0}
	bx r0
	.align 2, 0
_08087DB8: .4byte gPaletteFade
_08087DBC: .4byte CB2_LoadMap
_08087DC0: .4byte gUnknown_0300485C
_08087DC4: .4byte mapldr_08085D88
_08087DC8: .4byte sub_8087BBC
	thumb_func_end sub_8087D78

	thumb_func_start mapldr_08085D88
mapldr_08085D88: @ 8087DCC
	push {lr}
	bl sub_8053E90
	bl pal_fill_for_map_transition
	bl ScriptContext2_Enable
	bl FreezeMapObjects
	ldr r1, _08087E0C @ =gUnknown_0300485C
	movs r0, 0
	str r0, [r1]
	ldr r2, _08087E10 @ =gMapObjects
	ldr r0, _08087E14 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x1]
	bl CameraObjectReset2
	ldr r0, _08087E18 @ =sub_8087E1C
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08087E0C: .4byte gUnknown_0300485C
_08087E10: .4byte gMapObjects
_08087E14: .4byte gPlayerAvatar
_08087E18: .4byte sub_8087E1C
	thumb_func_end mapldr_08085D88

	thumb_func_start sub_8087E1C
sub_8087E1C: @ 8087E1C
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08087E44 @ =gUnknown_0839F3A0
	ldr r2, _08087E48 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08087E44: .4byte gUnknown_0839F3A0
_08087E48: .4byte gTasks
	thumb_func_end sub_8087E1C

	thumb_func_start sub_8087E4C
sub_8087E4C: @ 8087E4C
	push {r4-r6,lr}
	adds r6, r0, 0
	bl sub_807D770
	lsls r0, 24
	cmp r0, 0
	beq _08087EC2
	ldr r5, _08087EC8 @ =gPlayerAvatar
	ldrb r0, [r5, 0x4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08087ECC @ =gSprites
	adds r2, r0
	adds r0, r2, 0
	adds r0, 0x29
	movs r4, 0
	ldrsb r4, [r0, r4]
	lsls r0, r4, 17
	negs r0, r0
	ldrh r1, [r2, 0x22]
	ldr r3, _08087ED0 @ =gSpriteCoordOffsetY
	adds r1, r4
	ldrh r3, [r3]
	adds r1, r3
	asrs r0, 16
	adds r0, r1
	negs r0, r0
	strh r0, [r2, 0x26]
	ldr r3, _08087ED4 @ =gMapObjects
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r3, [r1, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r3
	strb r0, [r1, 0x1]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	movs r0, 0x8
	strh r0, [r6, 0xA]
	movs r0, 0x1
	strh r0, [r6, 0xC]
	adds r2, 0x42
	ldrb r0, [r2]
	lsrs r0, 6
	strh r0, [r6, 0x24]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x26]
	movs r0, 0x2D
	bl PlaySE
_08087EC2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08087EC8: .4byte gPlayerAvatar
_08087ECC: .4byte gSprites
_08087ED0: .4byte gSpriteCoordOffsetY
_08087ED4: .4byte gMapObjects
	thumb_func_end sub_8087E4C

	thumb_func_start sub_8087ED8
sub_8087ED8: @ 8087ED8
	push {r4-r7,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _08087F40 @ =gUnknown_0839F380
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldr r2, _08087F44 @ =gPlayerAvatar
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087F48 @ =gMapObjects
	adds r6, r0, r1
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087F4C @ =gSprites
	adds r5, r0, r1
	ldrh r0, [r4, 0xA]
	ldrh r1, [r5, 0x26]
	adds r0, r1
	strh r0, [r5, 0x26]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x8
	negs r1, r1
	cmp r0, r1
	blt _08087F50
	ldrh r1, [r4, 0x22]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _08087F76
	adds r0, r1, 0x1
	strh r0, [r4, 0x22]
	ldrb r0, [r6]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r6]
	ldrh r1, [r4, 0x24]
	adds r3, r5, 0
	adds r3, 0x42
	lsls r1, 6
	ldrb r2, [r3]
	movs r0, 0x3F
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _08087F76
	.align 2, 0
_08087F40: .4byte gUnknown_0839F380
_08087F44: .4byte gPlayerAvatar
_08087F48: .4byte gMapObjects
_08087F4C: .4byte gSprites
_08087F50:
	ldrb r1, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r5, 0x5]
	adds r2, r5, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0
	beq _08087F76
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
_08087F76:
	ldrh r2, [r5, 0x26]
	movs r3, 0x26
	ldrsh r1, [r5, r3]
	movs r0, 0x30
	negs r0, r0
	cmp r1, r0
	blt _08087F9A
	ldrh r1, [r4, 0xA]
	movs r3, 0xA
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	ble _08087F9A
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	bne _08087F9A
	subs r0, r1, 0x1
	strh r0, [r4, 0xA]
_08087F9A:
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	movs r7, 0
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bne _08087FBC
	movs r0, 0x4
	strh r0, [r4, 0xC]
	ldrb r0, [r6, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
	adds r0, r6, 0
	bl FieldObjectTurn
_08087FBC:
	movs r1, 0x26
	ldrsh r0, [r5, r1]
	cmp r0, 0
	blt _08087FD2
	strh r7, [r5, 0x26]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	strh r0, [r4, 0xA]
	strh r7, [r4, 0xC]
_08087FD2:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8087ED8

	thumb_func_start sub_8087FDC
sub_8087FDC: @ 8087FDC
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _08088058 @ =gUnknown_0839F380
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldr r0, _0808805C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088060 @ =gMapObjects
	adds r5, r0, r1
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bne _08088050
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
	adds r0, r5, 0
	bl FieldObjectTurn
	movs r0, 0x8
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _08088050
	movs r0, 0x24
	ldrsh r1, [r4, r0]
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	cmp r1, r0
	bne _08088050
	bl ScriptContext2_Disable
	bl CameraObjectReset1
	bl UnfreezeMapObjects
	ldr r0, _08088064 @ =sub_8087E1C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08088050:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088058: .4byte gUnknown_0839F380
_0808805C: .4byte gPlayerAvatar
_08088060: .4byte gMapObjects
_08088064: .4byte sub_8087E1C
	thumb_func_end sub_8087FDC

	thumb_func_start FldEff_FieldMoveShowMon
FldEff_FieldMoveShowMon: @ 8088068
	push {r4,lr}
	bl sav1_map_get_light_level
	lsls r0, 24
	lsrs r0, 24
	bl is_light_level_1_2_3_5_or_6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08088088
	ldr r0, _08088084 @ =sub_8088120
	b _0808808A
	.align 2, 0
_08088084: .4byte sub_8088120
_08088088:
	ldr r0, _080880B8 @ =sub_808847C
_0808808A:
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _080880BC @ =gUnknown_0202FF84
	ldr r0, [r2]
	ldr r1, [r2, 0x4]
	ldr r2, [r2, 0x8]
	bl sub_8088830
	ldr r2, _080880C0 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x26]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080880B8: .4byte sub_808847C
_080880BC: .4byte gUnknown_0202FF84
_080880C0: .4byte gTasks
	thumb_func_end FldEff_FieldMoveShowMon

	thumb_func_start FldEff_FieldMoveShowMonInit
FldEff_FieldMoveShowMonInit: @ 80880C4
	push {r4-r6,lr}
	ldr r5, _08088118 @ =gUnknown_0202FF84
	ldr r0, [r5]
	movs r6, 0x80
	lsls r6, 24
	ands r6, r0
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	adds r4, r0, 0
	muls r4, r1
	ldr r0, _0808811C @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	str r0, [r5]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	str r0, [r5, 0x4]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	str r0, [r5, 0x8]
	ldr r0, [r5]
	orrs r0, r6
	str r0, [r5]
	movs r0, 0x6
	bl FieldEffectStart
	movs r0, 0x3B
	bl FieldEffectActiveListRemove
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08088118: .4byte gUnknown_0202FF84
_0808811C: .4byte gPlayerParty
	thumb_func_end FldEff_FieldMoveShowMonInit

	thumb_func_start sub_8088120
sub_8088120: @ 8088120
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08088148 @ =gUnknown_0839F3AC
	ldr r2, _0808814C @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08088148: .4byte gUnknown_0839F3AC
_0808814C: .4byte gTasks
	thumb_func_end sub_8088120

	thumb_func_start sub_8088150
sub_8088150: @ 8088150
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r6, _080881A0 @ =REG_WININ
	ldrh r0, [r6]
	strh r0, [r4, 0x1E]
	ldr r5, _080881A4 @ =REG_WINOUT
	ldrh r0, [r5]
	strh r0, [r4, 0x20]
	adds r0, r4, 0
	adds r0, 0x22
	ldr r1, _080881A8 @ =gMain
	ldr r1, [r1, 0xC]
	bl StoreWordInTwoHalfwords
	ldr r1, _080881AC @ =0x0000f0f1
	strh r1, [r4, 0xA]
	ldr r0, _080881B0 @ =0x00005051
	strh r0, [r4, 0xC]
	movs r0, 0x3F
	strh r0, [r4, 0xE]
	movs r0, 0x3E
	strh r0, [r4, 0x10]
	ldr r0, _080881B4 @ =REG_WIN0H
	strh r1, [r0]
	ldr r1, _080881B8 @ =REG_WIN0V
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	ldrh r0, [r4, 0xE]
	strh r0, [r6]
	ldrh r0, [r4, 0x10]
	strh r0, [r5]
	ldr r0, _080881BC @ =sub_80883DC
	bl SetVBlankCallback
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080881A0: .4byte REG_WININ
_080881A4: .4byte REG_WINOUT
_080881A8: .4byte gMain
_080881AC: .4byte 0x0000f0f1
_080881B0: .4byte 0x00005051
_080881B4: .4byte REG_WIN0H
_080881B8: .4byte REG_WIN0V
_080881BC: .4byte sub_80883DC
	thumb_func_end sub_8088150

	thumb_func_start sub_80881C0
sub_80881C0: @ 80881C0
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	ldr r0, _08088218 @ =REG_BG0CNT
	ldrh r1, [r0]
	lsrs r1, 2
	lsls r1, 30
	lsrs r1, 16
	ldrh r4, [r0]
	lsrs r4, 8
	lsls r4, 27
	lsrs r4, 16
	ldr r0, _0808821C @ =gFieldMoveStreaksTiles
	movs r5, 0xC0
	lsls r5, 19
	adds r1, r5
	movs r2, 0x80
	lsls r2, 1
	bl CpuSet
	movs r0, 0
	str r0, [sp]
	adds r5, r4, r5
	ldr r2, _08088220 @ =0x05000200
	mov r0, sp
	adds r1, r5, 0
	bl CpuSet
	ldr r0, _08088224 @ =gFieldMoveStreaksPalette
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	adds r0, r4, 0
	bl sub_808843C
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088218: .4byte REG_BG0CNT
_0808821C: .4byte gFieldMoveStreaksTiles
_08088220: .4byte 0x05000200
_08088224: .4byte gFieldMoveStreaksPalette
	thumb_func_end sub_80881C0

	thumb_func_start sub_8088228
sub_8088228: @ 8088228
	push {r4-r7,lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x12]
	subs r0, 0x10
	strh r0, [r3, 0x12]
	ldrh r6, [r3, 0xA]
	ldrh r2, [r3, 0xC]
	movs r7, 0xFF
	lsrs r1, r6, 8
	subs r1, 0x10
	lsls r1, 16
	lsrs r0, r2, 8
	subs r0, 0x2
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r7, 0
	ands r0, r2
	adds r5, r0, 0x2
	lsrs r2, r1, 16
	cmp r1, 0
	bge _08088254
	movs r2, 0
_08088254:
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, 0x27
	bgt _0808825E
	movs r4, 0x28
_0808825E:
	cmp r5, 0x78
	ble _08088264
	movs r5, 0x78
_08088264:
	lsls r2, 16
	asrs r2, 16
	lsls r1, r2, 8
	adds r0, r7, 0
	ands r0, r6
	orrs r1, r0
	strh r1, [r3, 0xA]
	lsls r0, r4, 16
	asrs r4, r0, 16
	lsls r0, r4, 8
	adds r1, r5, 0
	orrs r0, r1
	strh r0, [r3, 0xC]
	cmp r2, 0
	bne _080882A4
	cmp r4, 0x28
	bne _080882A4
	cmp r1, 0x78
	bne _080882A4
	ldr r2, _080882AC @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _080882B0 @ =sub_8088890
	str r1, [r0]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_080882A4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080882AC: .4byte gSprites
_080882B0: .4byte sub_8088890
	thumb_func_end sub_8088228

	thumb_func_start sub_80882B4
sub_80882B4: @ 80882B4
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x12]
	subs r0, 0x10
	strh r0, [r3, 0x12]
	ldr r2, _080882E0 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3C
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080882DA
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_080882DA:
	pop {r0}
	bx r0
	.align 2, 0
_080882E0: .4byte gSprites
	thumb_func_end sub_80882B4

	thumb_func_start sub_80882E4
sub_80882E4: @ 80882E4
	push {r4,lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x12]
	subs r0, 0x10
	strh r0, [r3, 0x12]
	ldrh r2, [r3, 0xC]
	lsls r1, r2, 16
	movs r0, 0xFF
	asrs r1, 24
	adds r1, 0x6
	lsls r1, 16
	ands r0, r2
	subs r0, 0x6
	lsls r0, 16
	lsrs r2, r0, 16
	lsrs r4, r1, 16
	asrs r1, 16
	cmp r1, 0x50
	ble _0808830C
	movs r4, 0x50
_0808830C:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x50
	bgt _08088316
	movs r2, 0x51
_08088316:
	lsls r0, r4, 16
	asrs r0, 16
	lsls r1, r0, 8
	lsls r2, 16
	asrs r2, 16
	orrs r1, r2
	strh r1, [r3, 0xC]
	cmp r0, 0x50
	bne _08088332
	cmp r2, 0x51
	bne _08088332
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_08088332:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80882E4

	thumb_func_start sub_8088338
sub_8088338: @ 8088338
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r0, _08088378 @ =REG_BG0CNT
	ldrh r1, [r0]
	lsrs r1, 8
	lsls r1, 27
	lsrs r1, 16
	movs r0, 0
	str r0, [sp]
	movs r0, 0xC0
	lsls r0, 19
	adds r1, r0
	ldr r2, _0808837C @ =0x05000200
	mov r0, sp
	bl CpuSet
	movs r0, 0xF1
	strh r0, [r4, 0xA]
	movs r0, 0xA1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x1E]
	strh r0, [r4, 0xE]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088378: .4byte REG_BG0CNT
_0808837C: .4byte 0x05000200
	thumb_func_end sub_8088338

	thumb_func_start sub_8088380
sub_8088380: @ 8088380
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r0, 0x22
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp]
	bl SetVBlankCallback
	ldr r4, _080883D0 @ =gWindowConfig_81E6CE4
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080883D4 @ =gSprites
	adds r0, r1
	bl FreeResourcesAndDestroySprite
	movs r0, 0x6
	bl FieldEffectActiveListRemove
	ldr r0, _080883D8 @ =sub_8088120
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080883D0: .4byte gWindowConfig_81E6CE4
_080883D4: .4byte gSprites
_080883D8: .4byte sub_8088120
	thumb_func_end sub_8088380

	thumb_func_start sub_80883DC
sub_80883DC: @ 80883DC
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08088430 @ =sub_8088120
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _08088434 @ =gTasks
	adds r4, r0
	adds r0, r4, 0
	adds r0, 0x22
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp]
	bl _call_via_r0
	ldr r1, _08088438 @ =REG_WIN0H
	ldrh r0, [r4, 0xA]
	strh r0, [r1]
	adds r1, 0x4
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	adds r1, 0x4
	ldrh r0, [r4, 0xE]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0x10]
	strh r0, [r1]
	subs r1, 0x3A
	ldrh r0, [r4, 0x12]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0x14]
	strh r0, [r1]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088430: .4byte sub_8088120
_08088434: .4byte gTasks
_08088438: .4byte REG_WIN0H
	thumb_func_end sub_80883DC

	thumb_func_start sub_808843C
sub_808843C: @ 808843C
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08088470 @ =0x06000140
	adds r2, r0, r1
	movs r1, 0
	ldr r5, _08088474 @ =gFieldMoveStreaksTilemap
	movs r0, 0xF0
	lsls r0, 8
	adds r4, r0, 0
	ldr r3, _08088478 @ =0x0000013f
_08088452:
	lsls r0, r1, 1
	adds r0, r5
	ldrh r0, [r0]
	orrs r0, r4
	strh r0, [r2]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	adds r2, 0x2
	cmp r1, r3
	bls _08088452
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088470: .4byte 0x06000140
_08088474: .4byte gFieldMoveStreaksTilemap
_08088478: .4byte 0x0000013f
	thumb_func_end sub_808843C

	thumb_func_start sub_808847C
sub_808847C: @ 808847C
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _080884A4 @ =gUnknown_0839F3C8
	ldr r2, _080884A8 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080884A4: .4byte gUnknown_0839F3C8
_080884A8: .4byte gTasks
	thumb_func_end sub_808847C

	thumb_func_start sub_80884AC
sub_80884AC: @ 80884AC
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080884DC @ =REG_BG0HOFS
	ldrh r0, [r4, 0xA]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	adds r0, r4, 0
	adds r0, 0x22
	ldr r1, _080884E0 @ =gMain
	ldr r1, [r1, 0xC]
	bl StoreWordInTwoHalfwords
	ldr r0, _080884E4 @ =sub_80886B0
	bl SetVBlankCallback
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080884DC: .4byte REG_BG0HOFS
_080884E0: .4byte gMain
_080884E4: .4byte sub_80886B0
	thumb_func_end sub_80884AC

	thumb_func_start sub_80884E8
sub_80884E8: @ 80884E8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	adds r6, r0, 0
	ldr r0, _08088544 @ =REG_BG0CNT
	ldrh r1, [r0]
	lsrs r1, 2
	lsls r1, 30
	lsrs r1, 16
	ldrh r4, [r0]
	lsrs r4, 8
	lsls r4, 27
	lsrs r4, 16
	movs r0, 0
	mov r8, r0
	strh r4, [r6, 0x20]
	ldr r0, _08088548 @ =gDarknessFieldMoveStreaksTiles
	movs r5, 0xC0
	lsls r5, 19
	adds r1, r5
	movs r2, 0x40
	bl CpuSet
	mov r0, r8
	str r0, [sp]
	adds r4, r5
	ldr r2, _0808854C @ =0x05000200
	mov r0, sp
	adds r1, r4, 0
	bl CpuSet
	ldr r0, _08088550 @ =gDarknessFieldMoveStreaksPalette
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088544: .4byte REG_BG0CNT
_08088548: .4byte gDarknessFieldMoveStreaksTiles
_0808854C: .4byte 0x05000200
_08088550: .4byte gDarknessFieldMoveStreaksPalette
	thumb_func_end sub_80884E8

	thumb_func_start sub_8088554
sub_8088554: @ 8088554
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8088708
	lsls r0, 24
	cmp r0, 0
	beq _0808858A
	ldr r1, _08088598 @ =REG_WIN1H
	movs r0, 0xF0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _0808859C @ =0x00002878
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _080885A0 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _080885A4 @ =sub_8088890
	str r1, [r0]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0808858A:
	adds r0, r4, 0
	bl sub_80886F8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088598: .4byte REG_WIN1H
_0808859C: .4byte 0x00002878
_080885A0: .4byte gSprites
_080885A4: .4byte sub_8088890
	thumb_func_end sub_8088554

	thumb_func_start sub_80885A8
sub_80885A8: @ 80885A8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80886F8
	ldr r2, _080885D4 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3C
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080885CC
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080885CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080885D4: .4byte gSprites
	thumb_func_end sub_80885A8

	thumb_func_start sub_80885D8
sub_80885D8: @ 80885D8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80886F8
	ldrh r1, [r4, 0xA]
	movs r0, 0x7
	ands r0, r1
	movs r1, 0
	strh r0, [r4, 0xE]
	strh r1, [r4, 0x10]
	ldr r0, _08088604 @ =REG_WIN1H
	ldr r2, _08088608 @ =0x0000ffff
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088604: .4byte REG_WIN1H
_08088608: .4byte 0x0000ffff
	thumb_func_end sub_80885D8

	thumb_func_start sub_808860C
sub_808860C: @ 808860C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80886F8
	adds r0, r4, 0
	bl sub_80887C0
	lsls r0, 24
	cmp r0, 0
	beq _08088626
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08088626:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_808860C

	thumb_func_start sub_808862C
sub_808862C: @ 808862C
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r0, _0808869C @ =REG_BG0CNT
	ldrh r1, [r0]
	lsrs r1, 8
	lsls r1, 27
	lsrs r1, 16
	movs r0, 0
	str r0, [sp]
	movs r0, 0xC0
	lsls r0, 19
	adds r1, r0
	ldr r2, _080886A0 @ =0x05000200
	mov r0, sp
	bl CpuSet
	adds r0, r5, 0
	adds r0, 0x22
	add r1, sp, 0x4
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp, 0x4]
	bl SetVBlankCallback
	ldr r4, _080886A4 @ =gWindowConfig_81E6CE4
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080886A8 @ =gSprites
	adds r0, r1
	bl FreeResourcesAndDestroySprite
	movs r0, 0x6
	bl FieldEffectActiveListRemove
	ldr r0, _080886AC @ =sub_808847C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808869C: .4byte REG_BG0CNT
_080886A0: .4byte 0x05000200
_080886A4: .4byte gWindowConfig_81E6CE4
_080886A8: .4byte gSprites
_080886AC: .4byte sub_808847C
	thumb_func_end sub_808862C

	thumb_func_start sub_80886B0
sub_80886B0: @ 80886B0
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _080886EC @ =sub_808847C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080886F0 @ =gTasks
	adds r4, r0
	adds r0, r4, 0
	adds r0, 0x22
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp]
	bl _call_via_r0
	ldr r1, _080886F4 @ =REG_BG0HOFS
	ldrh r0, [r4, 0xA]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080886EC: .4byte sub_808847C
_080886F0: .4byte gTasks
_080886F4: .4byte REG_BG0HOFS
	thumb_func_end sub_80886B0

	thumb_func_start sub_80886F8
sub_80886F8: @ 80886F8
	ldrh r1, [r0, 0xA]
	subs r1, 0x10
	strh r1, [r0, 0xA]
	ldrh r1, [r0, 0xE]
	adds r1, 0x10
	strh r1, [r0, 0xE]
	bx lr
	thumb_func_end sub_80886F8

	thumb_func_start sub_8088708
sub_8088708: @ 8088708
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r2, [r5, 0x10]
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r0, 0x1F
	ble _08088724
	movs r0, 0x1
	b _080887A8
_08088724:
	ldrh r0, [r5, 0xE]
	lsls r0, 16
	asrs r3, r0, 19
	movs r1, 0x1F
	ands r3, r1
	movs r4, 0x10
	ldrsh r0, [r5, r4]
	cmp r3, r0
	blt _080887A6
	movs r0, 0x20
	subs r3, r0, r3
	ands r3, r1
	subs r0, r2
	mov r12, r0
	mov r7, r12
	ands r7, r1
	mov r12, r7
	ldrh r0, [r5, 0x20]
	ldr r1, _080887B8 @ =0x06000140
	adds r1, r0
	mov r8, r1
	movs r4, 0
	ldr r7, _080887BC @ =gDarknessFieldMoveStreaksTilemap
	mov r10, r7
	movs r0, 0xF0
	lsls r0, 8
	mov r9, r0
	adds r1, r3, 0x1
	movs r0, 0x1F
	ands r1, r0
	str r1, [sp]
	mov r6, r12
	adds r6, 0x1
	ands r6, r0
_08088768:
	lsls r1, r4, 5
	adds r2, r1, r3
	lsls r2, 1
	add r2, r8
	mov r7, r12
	adds r0, r7, r1
	lsls r0, 1
	add r0, r10
	ldrh r0, [r0]
	mov r7, r9
	orrs r0, r7
	strh r0, [r2]
	ldr r0, [sp]
	adds r2, r1, r0
	lsls r2, 1
	add r2, r8
	adds r1, r6, r1
	lsls r1, 1
	add r1, r10
	ldrh r0, [r1]
	mov r1, r9
	orrs r0, r1
	strh r0, [r2]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x9
	bls _08088768
	ldrh r0, [r5, 0x10]
	adds r0, 0x2
	strh r0, [r5, 0x10]
_080887A6:
	movs r0, 0
_080887A8:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080887B8: .4byte 0x06000140
_080887BC: .4byte gDarknessFieldMoveStreaksTilemap
	thumb_func_end sub_8088708

	thumb_func_start sub_80887C0
sub_80887C0: @ 80887C0
	push {r4-r7,lr}
	adds r5, r0, 0
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r0, 0x1F
	ble _080887D0
	movs r0, 0x1
	b _08088824
_080887D0:
	ldrh r0, [r5, 0xE]
	lsls r0, 16
	asrs r0, 19
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r2, r0
	blt _08088822
	ldrh r0, [r5, 0xA]
	lsls r0, 16
	asrs r2, r0, 19
	movs r0, 0x1F
	ands r2, r0
	ldrh r0, [r5, 0x20]
	ldr r1, _0808882C @ =0x06000140
	adds r6, r0, r1
	movs r3, 0
	movs r0, 0xF0
	lsls r0, 8
	adds r7, r0, 0
	adds r4, r2, 0x1
	movs r0, 0x1F
	ands r4, r0
_08088800:
	lsls r0, r3, 5
	adds r1, r0, r2
	lsls r1, 1
	adds r1, r6
	strh r7, [r1]
	adds r0, r4
	lsls r0, 1
	adds r0, r6
	strh r7, [r0]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x9
	bls _08088800
	ldrh r0, [r5, 0x10]
	adds r0, 0x2
	strh r0, [r5, 0x10]
_08088822:
	movs r0, 0
_08088824:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808882C: .4byte 0x06000140
	thumb_func_end sub_80887C0

	thumb_func_start sub_8088830
sub_8088830: @ 8088830
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r0, 0
	movs r5, 0x80
	lsls r5, 24
	ands r5, r6
	lsrs r5, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _08088884 @ =0x7fffffff
	ands r6, r0
	lsls r0, r6, 16
	lsrs r0, 16
	movs r3, 0xA0
	lsls r3, 1
	movs r4, 0x50
	str r4, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	bl CreateMonSprite_FieldMove
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r1, _08088888 @ =gSprites
	adds r2, r1
	ldr r1, _0808888C @ =SpriteCallbackDummy
	str r1, [r2, 0x1C]
	ldrb r3, [r2, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	strb r1, [r2, 0x5]
	strh r6, [r2, 0x2E]
	strh r5, [r2, 0x3A]
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08088884: .4byte 0x7fffffff
_08088888: .4byte gSprites
_0808888C: .4byte SpriteCallbackDummy
	thumb_func_end sub_8088830

	thumb_func_start sub_8088890
sub_8088890: @ 8088890
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x20]
	subs r0, 0x14
	strh r0, [r1, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x78
	bgt _080888D0
	movs r0, 0x78
	strh r0, [r1, 0x20]
	movs r0, 0x1E
	strh r0, [r1, 0x30]
	ldr r0, _080888C4 @ =sub_80888D4
	str r0, [r1, 0x1C]
	movs r2, 0x3A
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080888C8
	ldrh r0, [r1, 0x2E]
	movs r1, 0
	movs r2, 0x7D
	movs r3, 0xA
	bl PlayCry2
	b _080888D0
	.align 2, 0
_080888C4: .4byte sub_80888D4
_080888C8:
	ldrh r0, [r1, 0x2E]
	movs r1, 0
	bl PlayCry1
_080888D0:
	pop {r0}
	bx r0
	thumb_func_end sub_8088890

	thumb_func_start sub_80888D4
sub_80888D4: @ 80888D4
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	subs r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _080888E8
	ldr r0, _080888EC @ =sub_80888F0
	str r0, [r1, 0x1C]
_080888E8:
	pop {r0}
	bx r0
	.align 2, 0
_080888EC: .4byte sub_80888F0
	thumb_func_end sub_80888D4

	thumb_func_start sub_80888F0
sub_80888F0: @ 80888F0
	push {lr}
	adds r2, r0, 0
	ldrh r3, [r2, 0x20]
	movs r0, 0x20
	ldrsh r1, [r2, r0]
	movs r0, 0x40
	negs r0, r0
	cmp r1, r0
	bge _08088908
	movs r0, 0x1
	strh r0, [r2, 0x3C]
	b _0808890E
_08088908:
	adds r0, r3, 0
	subs r0, 0x14
	strh r0, [r2, 0x20]
_0808890E:
	pop {r0}
	bx r0
	thumb_func_end sub_80888F0

	thumb_func_start FldEff_UseSurf
FldEff_UseSurf: @ 8088914
	push {lr}
	ldr r0, _08088944 @ =sub_8088954
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08088948 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0808894C @ =gUnknown_0202FF84
	ldr r0, [r0]
	strh r0, [r1, 0x26]
	bl sav1_reset_battle_music_maybe
	ldr r0, _08088950 @ =0x0000016d
	bl sub_8053FB0
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08088944: .4byte sub_8088954
_08088948: .4byte gTasks
_0808894C: .4byte gUnknown_0202FF84
_08088950: .4byte 0x0000016d
	thumb_func_end FldEff_UseSurf

	thumb_func_start sub_8088954
sub_8088954: @ 8088954
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0808897C @ =gUnknown_0839F3E4
	ldr r2, _08088980 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0808897C: .4byte gUnknown_0839F3E4
_08088980: .4byte gTasks
	thumb_func_end sub_8088954

	thumb_func_start sub_8088984
sub_8088984: @ 8088984
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	bl FreezeMapObjects
	ldr r5, _080889DC @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r5, 0x6]
	movs r0, 0x8
	bl SetPlayerAvatarStateMask
	adds r6, r4, 0
	adds r6, 0xA
	movs r0, 0xC
	adds r0, r4
	mov r8, r0
	adds r0, r6, 0
	mov r1, r8
	bl PlayerGetDestCoords
	ldr r2, _080889E0 @ =gMapObjects
	ldrb r1, [r5, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x18]
	lsrs r0, 4
	adds r1, r6, 0
	mov r2, r8
	bl MoveCoords
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080889DC: .4byte gPlayerAvatar
_080889E0: .4byte gMapObjects
	thumb_func_end sub_8088984

	thumb_func_start sub_80889E4
sub_80889E4: @ 80889E4
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08088A28 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088A2C @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08088A0E
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08088A20
_08088A0E:
	bl sub_8059BF4
	adds r0, r4, 0
	movs r1, 0x39
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_08088A20:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088A28: .4byte gPlayerAvatar
_08088A2C: .4byte gMapObjects
	thumb_func_end sub_80889E4

	thumb_func_start sub_8088A30
sub_8088A30: @ 8088A30
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08088A6C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088A70 @ =gMapObjects
	adds r0, r1
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	cmp r0, 0
	beq _08088A66
	ldr r2, _08088A74 @ =gUnknown_0202FF84
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	movs r1, 0x80
	lsls r1, 24
	orrs r0, r1
	str r0, [r2]
	movs r0, 0x3B
	bl FieldEffectStart
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08088A66:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088A6C: .4byte gPlayerAvatar
_08088A70: .4byte gMapObjects
_08088A74: .4byte gUnknown_0202FF84
	thumb_func_end sub_8088A30

	thumb_func_start sub_8088A78
sub_8088A78: @ 8088A78
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r0, 0x6
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08088AE2
	ldr r5, _08088AE8 @ =gPlayerAvatar
	ldrb r0, [r5, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08088AEC @ =gMapObjects
	adds r4, r0
	movs r0, 0x3
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl sub_80608D0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldr r1, _08088AF0 @ =gUnknown_0202FF84
	movs r2, 0xA
	ldrsh r0, [r6, r2]
	str r0, [r1]
	movs r2, 0xC
	ldrsh r0, [r6, r2]
	str r0, [r1, 0x4]
	ldrb r0, [r5, 0x5]
	str r0, [r1, 0x8]
	movs r0, 0x8
	bl FieldEffectStart
	strb r0, [r4, 0x1A]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_08088AE2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088AE8: .4byte gPlayerAvatar
_08088AEC: .4byte gMapObjects
_08088AF0: .4byte gUnknown_0202FF84
	thumb_func_end sub_8088A78

	thumb_func_start sub_8088AF4
sub_8088AF4: @ 8088AF4
	push {r4,r5,lr}
	ldr r5, _08088B5C @ =gPlayerAvatar
	ldrb r1, [r5, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088B60 @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08088B54
	movs r0, 0
	strb r0, [r5, 0x6]
	ldrb r1, [r5]
	movs r0, 0xDF
	ands r0, r1
	strb r0, [r5]
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldrb r0, [r4, 0x1A]
	movs r1, 0x1
	bl sub_8127ED0
	bl UnfreezeMapObjects
	bl ScriptContext2_Disable
	movs r0, 0x9
	bl FieldEffectActiveListRemove
	ldr r0, _08088B64 @ =sub_8088954
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08088B54:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088B5C: .4byte gPlayerAvatar
_08088B60: .4byte gMapObjects
_08088B64: .4byte sub_8088954
	thumb_func_end sub_8088AF4

	thumb_func_start FldEff_NPCFlyOut
FldEff_NPCFlyOut: @ 8088B68
	push {r4,lr}
	ldr r0, _08088BB4 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x68]
	movs r1, 0x78
	movs r2, 0
	movs r3, 0x1
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r2, r4, 4
	adds r2, r4
	lsls r2, 2
	ldr r0, _08088BB8 @ =gSprites
	adds r2, r0
	ldrb r1, [r2, 0x5]
	movs r0, 0xF
	ands r0, r1
	movs r1, 0xD
	negs r1, r1
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, _08088BBC @ =sub_8088BC4
	str r0, [r2, 0x1C]
	ldr r0, _08088BC0 @ =gUnknown_0202FF84
	ldr r0, [r0]
	strh r0, [r2, 0x30]
	movs r0, 0x9E
	bl PlaySE
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08088BB4: .4byte gFieldEffectObjectTemplatePointers
_08088BB8: .4byte gSprites
_08088BBC: .4byte sub_8088BC4
_08088BC0: .4byte gUnknown_0202FF84
	thumb_func_end FldEff_NPCFlyOut

	thumb_func_start sub_8088BC4
sub_8088BC4: @ 8088BC4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r1, 0x8C
	bl Cos
	movs r5, 0
	strh r0, [r4, 0x24]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	movs r1, 0x48
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x32]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08088C26
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08088C3C @ =gSprites
	adds r1, r0
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r3]
	ldrh r0, [r4, 0x24]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r1, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	subs r0, 0x8
	strh r0, [r1, 0x22]
	strh r5, [r1, 0x24]
	strh r5, [r1, 0x26]
_08088C26:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	ble _08088C36
	adds r0, r4, 0
	movs r1, 0x1E
	bl FieldEffectStop
_08088C36:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088C3C: .4byte gSprites
	thumb_func_end sub_8088BC4

	thumb_func_start FldEff_UseFly
FldEff_UseFly: @ 8088C40
	push {lr}
	ldr r0, _08088C64 @ =sub_8088C70
	movs r1, 0xFE
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08088C68 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _08088C6C @ =gUnknown_0202FF84
	ldr r0, [r0]
	strh r0, [r1, 0xA]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08088C64: .4byte sub_8088C70
_08088C68: .4byte gTasks
_08088C6C: .4byte gUnknown_0202FF84
	thumb_func_end FldEff_UseFly

	thumb_func_start sub_8088C70
sub_8088C70: @ 8088C70
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08088C98 @ =gUnknown_0839F3F8
	ldr r2, _08088C9C @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08088C98: .4byte gUnknown_0839F3F8
_08088C9C: .4byte gTasks
	thumb_func_end sub_8088C70

	thumb_func_start sub_8088CA0
sub_8088CA0: @ 8088CA0
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _08088CF0 @ =gPlayerAvatar
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088CF4 @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08088CCA
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08088CE8
_08088CCA:
	ldrb r0, [r6]
	strh r0, [r5, 0x26]
	movs r0, 0x1
	strb r0, [r6, 0x6]
	bl SetPlayerAvatarStateMask
	bl sub_8059BF4
	adds r0, r4, 0
	movs r1, 0x39
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_08088CE8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088CF0: .4byte gPlayerAvatar
_08088CF4: .4byte gMapObjects
	thumb_func_end sub_8088CA0

	thumb_func_start sub_8088CF8
sub_8088CF8: @ 8088CF8
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08088D30 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088D34 @ =gMapObjects
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08088D28
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldr r1, _08088D38 @ =gUnknown_0202FF84
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r0, 0x3B
	bl FieldEffectStart
_08088D28:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088D30: .4byte gPlayerAvatar
_08088D34: .4byte gMapObjects
_08088D38: .4byte gUnknown_0202FF84
	thumb_func_end sub_8088CF8

	thumb_func_start sub_8088D3C
sub_8088D3C: @ 8088D3C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x6
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08088D84
	ldr r0, _08088D8C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088D90 @ =gMapObjects
	adds r5, r0, r1
	ldrh r1, [r4, 0x26]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08088D74
	ldrb r0, [r5, 0x1A]
	movs r1, 0x2
	bl sub_8127ED0
	ldrb r0, [r5, 0x1A]
	movs r1, 0
	bl sub_8127EFC
_08088D74:
	bl sub_8088F60
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08088D84:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088D8C: .4byte gPlayerAvatar
_08088D90: .4byte gMapObjects
	thumb_func_end sub_8088D3C

	thumb_func_start sub_8088D94
sub_8088D94: @ 8088D94
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0xA]
	bl sub_8088FA4
	lsls r0, 24
	cmp r0, 0
	beq _08088DC8
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x10
	strh r0, [r4, 0xC]
	movs r0, 0x1
	bl SetPlayerAvatarTransitionFlags
	ldr r0, _08088DD0 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088DD4 @ =gMapObjects
	adds r0, r1
	movs r1, 0x2
	bl FieldObjectSetSpecialAnim
_08088DC8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088DD0: .4byte gPlayerAvatar
_08088DD4: .4byte gMapObjects
	thumb_func_end sub_8088D94

	thumb_func_start sub_8088DD8
sub_8088DD8: @ 8088DD8
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08088E24 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088E28 @ =gMapObjects
	adds r2, r0, r1
	ldrh r1, [r4, 0xC]
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _08088DFE
	subs r0, r1, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bne _08088E1C
_08088DFE:
	adds r0, r2, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08088E1C
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x9E
	bl PlaySE
	ldrb r0, [r4, 0xA]
	bl sub_8088FC0
_08088E1C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088E24: .4byte gPlayerAvatar
_08088E28: .4byte gMapObjects
	thumb_func_end sub_8088DD8

	thumb_func_start sub_8088E2C
sub_8088E2C: @ 8088E2C
	push {r4-r6,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _08088EA2
	ldr r0, _08088EA8 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088EAC @ =gMapObjects
	adds r4, r0, r1
	movs r0, 0x3
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r6, _08088EB0 @ =gSprites
	adds r0, r6
	movs r1, 0x16
	bl StartSpriteAnim
	ldrb r0, [r4, 0x1]
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r0, r4, 0
	movs r1, 0x48
	bl FieldObjectSetSpecialAnim
	ldrh r1, [r5, 0x26]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08088E98
	ldrb r1, [r4, 0x1A]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl DestroySprite
_08088E98:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	strh r0, [r5, 0xC]
_08088EA2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088EA8: .4byte gPlayerAvatar
_08088EAC: .4byte gMapObjects
_08088EB0: .4byte gSprites
	thumb_func_end sub_8088E2C

	thumb_func_start sub_8088EB4
sub_8088EB4: @ 8088EB4
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	ble _08088F00
	ldr r0, _08088F08 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08088F0C @ =gMapObjects
	adds r4, r0
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimActive
	ldrb r1, [r4, 0x1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r4, 0x2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x2]
	ldrb r0, [r5, 0xA]
	ldrb r1, [r4, 0x4]
	bl sub_8088FFC
	bl CameraObjectReset2
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_08088F00:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088F08: .4byte gPlayerAvatar
_08088F0C: .4byte gMapObjects
	thumb_func_end sub_8088EB4

	thumb_func_start sub_8088F10
sub_8088F10: @ 8088F10
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0xA]
	bl sub_8088FA4
	lsls r0, 24
	cmp r0, 0
	beq _08088F2A
	bl fade_8080918
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08088F2A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8088F10

	thumb_func_start sub_8088F30
sub_8088F30: @ 8088F30
	push {lr}
	ldr r0, _08088F58 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08088F52
	movs r0, 0x1F
	bl FieldEffectActiveListRemove
	ldr r0, _08088F5C @ =sub_8088C70
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08088F52:
	pop {r0}
	bx r0
	.align 2, 0
_08088F58: .4byte gPaletteFade
_08088F5C: .4byte sub_8088C70
	thumb_func_end sub_8088F30

	thumb_func_start sub_8088F60
sub_8088F60: @ 8088F60
	push {lr}
	ldr r0, _08088F98 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x68]
	movs r1, 0xFF
	movs r2, 0xB4
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r1, _08088F9C @ =gSprites
	adds r2, r1
	ldrb r3, [r2, 0x5]
	movs r1, 0xF
	ands r1, r3
	movs r3, 0xD
	negs r3, r3
	ands r1, r3
	movs r3, 0x4
	orrs r1, r3
	strb r1, [r2, 0x5]
	ldr r1, _08088FA0 @ =sub_8089018
	str r1, [r2, 0x1C]
	pop {r1}
	bx r1
	.align 2, 0
_08088F98: .4byte gFieldEffectObjectTemplatePointers
_08088F9C: .4byte gSprites
_08088FA0: .4byte sub_8089018
	thumb_func_end sub_8088F60

	thumb_func_start sub_8088FA4
sub_8088FA4: @ 8088FA4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08088FBC @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	bx lr
	.align 2, 0
_08088FBC: .4byte gSprites
	thumb_func_end sub_8088FA4

	thumb_func_start sub_8088FC0
sub_8088FC0: @ 8088FC0
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08088FF4 @ =gSprites
	adds r4, r0
	ldr r0, _08088FF8 @ =sub_80890D8
	str r0, [r4, 0x1C]
	movs r1, 0
	movs r0, 0x78
	strh r0, [r4, 0x20]
	strh r1, [r4, 0x22]
	strh r1, [r4, 0x24]
	strh r1, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x2E
	movs r2, 0x10
	bl memset
	movs r0, 0x40
	strh r0, [r4, 0x3A]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088FF4: .4byte gSprites
_08088FF8: .4byte sub_80890D8
	thumb_func_end sub_8088FC0

	thumb_func_start sub_8088FFC
sub_8088FFC: @ 8088FFC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08089014 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	strh r1, [r2, 0x3A]
	bx lr
	.align 2, 0
_08089014: .4byte gSprites
	thumb_func_end sub_8088FFC

	thumb_func_start sub_8089018
sub_8089018: @ 8089018
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080890C4
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0808905C
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _080890CC @ =gSpriteAffineAnimTable_0839F44C
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	movs r0, 0x76
	strh r0, [r4, 0x20]
	ldr r0, _080890D0 @ =0x0000ffd0
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0x40
	strh r0, [r4, 0x30]
	adds r0, 0xC0
	strh r0, [r4, 0x32]
_0808905C:
	ldrh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x30]
	adds r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x78
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x78
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r2, [r4, 0x32]
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	ldr r0, _080890D4 @ =0x000007ff
	cmp r1, r0
	bgt _08089092
	adds r0, r2, 0
	adds r0, 0x60
	strh r0, [r4, 0x32]
_08089092:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x81
	ble _080890C4
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4, 0x1]
	lsrs r1, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	adds r0, r4, 0
	movs r3, 0
	bl CalcCenterToCornerVec
_080890C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080890CC: .4byte gSpriteAffineAnimTable_0839F44C
_080890D0: .4byte 0x0000ffd0
_080890D4: .4byte 0x000007ff
	thumb_func_end sub_8089018

	thumb_func_start sub_80890D8
sub_80890D8: @ 80890D8
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r1, 0x8C
	bl Cos
	movs r5, 0
	strh r0, [r4, 0x24]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	movs r1, 0x48
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x32]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0x40
	beq _08089136
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08089148 @ =gSprites
	adds r1, r0
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r3]
	ldrh r0, [r4, 0x24]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r1, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	subs r0, 0x8
	strh r0, [r1, 0x22]
	strh r5, [r1, 0x24]
	strh r5, [r1, 0x26]
_08089136:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	ble _08089142
	movs r0, 0x1
	strh r0, [r4, 0x3C]
_08089142:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08089148: .4byte gSprites
	thumb_func_end sub_80890D8

	thumb_func_start sub_808914C
sub_808914C: @ 808914C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08089220
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _08089196
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _08089228 @ =gSpriteAffineAnimTable_0839F44C
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	movs r0, 0x5E
	strh r0, [r4, 0x20]
	ldr r0, _0808922C @ =0x0000ffe0
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0xF0
	strh r0, [r4, 0x30]
	movs r0, 0x80
	lsls r0, 4
	strh r0, [r4, 0x32]
	movs r0, 0x80
	strh r0, [r4, 0x36]
_08089196:
	ldrh r1, [r4, 0x32]
	lsls r1, 16
	asrs r1, 24
	ldrh r2, [r4, 0x30]
	adds r2, r1
	ldrh r0, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	movs r0, 0xFF
	ands r2, r0
	strh r2, [r4, 0x30]
	movs r3, 0x30
	ldrsh r0, [r4, r3]
	movs r1, 0x20
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x78
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r1, [r4, 0x32]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	movs r2, 0x80
	lsls r2, 1
	cmp r0, r2
	ble _080891D8
	ldrh r0, [r4, 0x36]
	subs r0, r1, r0
	strh r0, [r4, 0x32]
_080891D8:
	ldrh r1, [r4, 0x36]
	movs r3, 0x36
	ldrsh r0, [r4, r3]
	cmp r0, 0xFF
	bgt _080891E8
	adds r0, r1, 0
	adds r0, 0x18
	strh r0, [r4, 0x36]
_080891E8:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0xFF
	bgt _080891F2
	strh r2, [r4, 0x32]
_080891F2:
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r0, 0x3B
	ble _08089220
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_08089220:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089228: .4byte gSpriteAffineAnimTable_0839F44C
_0808922C: .4byte 0x0000ffe0
	thumb_func_end sub_808914C

	thumb_func_start sub_8089230
sub_8089230: @ 8089230
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_8088FC0
	ldr r1, _08089254 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08089258 @ =sub_808914C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089254: .4byte gSprites
_08089258: .4byte sub_808914C
	thumb_func_end sub_8089230

	thumb_func_start FldEff_FlyIn
FldEff_FlyIn: @ 808925C
	push {lr}
	ldr r0, _0808926C @ =sub_8089270
	movs r1, 0xFE
	bl CreateTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0808926C: .4byte sub_8089270
	thumb_func_end FldEff_FlyIn

	thumb_func_start sub_8089270
sub_8089270: @ 8089270
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08089298 @ =gUnknown_0839F454
	ldr r2, _0808929C @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08089298: .4byte gUnknown_0839F454
_0808929C: .4byte gTasks
	thumb_func_end sub_8089270

	thumb_func_start sub_80892A0
sub_80892A0: @ 80892A0
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _08089348 @ =gPlayerAvatar
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0808934C @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _080892CA
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08089342
_080892CA:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x11
	strh r0, [r5, 0xC]
	ldrb r0, [r6]
	strh r0, [r5, 0x26]
	movs r0, 0x1
	strb r0, [r6, 0x6]
	bl SetPlayerAvatarStateMask
	ldrh r1, [r5, 0x26]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080892F2
	ldrb r0, [r4, 0x1A]
	movs r1, 0
	bl sub_8127ED0
_080892F2:
	movs r0, 0x3
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	bl CameraObjectReset2
	adds r0, r4, 0
	movs r1, 0x3
	bl FieldObjectTurn
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08089350 @ =gSprites
	adds r0, r1
	movs r1, 0x16
	bl StartSpriteAnim
	ldrb r1, [r4, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	bl sub_8088F60
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xA]
	bl sub_8088FC0
	ldrb r0, [r5, 0xA]
	ldrb r1, [r4, 0x4]
	bl sub_8088FFC
_08089342:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08089348: .4byte gPlayerAvatar
_0808934C: .4byte gMapObjects
_08089350: .4byte gSprites
	thumb_func_end sub_80892A0

	thumb_func_start sub_8089354
sub_8089354: @ 8089354
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r1, [r5, 0xC]
	movs r2, 0xC
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _0808936C
	subs r0, r1, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	cmp r0, 0
	bne _080893AC
_0808936C:
	ldr r0, _080893B4 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080893B8 @ =gMapObjects
	adds r0, r1
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _080893BC @ =gSprites
	adds r4, r0
	ldrb r0, [r5, 0xA]
	movs r1, 0x40
	bl sub_8088FFC
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	strh r1, [r4, 0x24]
	strh r1, [r4, 0x26]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	strh r1, [r5, 0xC]
_080893AC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080893B4: .4byte gPlayerAvatar
_080893B8: .4byte gMapObjects
_080893BC: .4byte gSprites
	thumb_func_end sub_8089354

	thumb_func_start sub_80893C0
sub_80893C0: @ 80893C0
	push {r4,lr}
	sub sp, 0x24
	adds r4, r0, 0
	ldr r1, _08089408 @ =gUnknown_0839F470
	mov r0, sp
	movs r2, 0x24
	bl memcpy
	ldr r0, _0808940C @ =gPlayerAvatar
	ldrb r0, [r0, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08089410 @ =gSprites
	adds r1, r0
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r1, 0x26]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x11
	ble _080893FE
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080893FE:
	add sp, 0x24
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089408: .4byte gUnknown_0839F470
_0808940C: .4byte gPlayerAvatar
_08089410: .4byte gSprites
	thumb_func_end sub_80893C0

	thumb_func_start sub_8089414
sub_8089414: @ 8089414
	push {r4-r6,lr}
	adds r6, r0, 0
	ldrb r0, [r6, 0xA]
	bl sub_8088FA4
	lsls r0, 24
	cmp r0, 0
	beq _08089478
	ldr r0, _08089480 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r5, r0, 3
	adds r5, r0
	lsls r5, 2
	ldr r0, _08089484 @ =gMapObjects
	adds r5, r0
	ldrb r0, [r5, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08089488 @ =gSprites
	adds r4, r0
	ldrb r1, [r5, 0x1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x1]
	movs r0, 0x10
	ldrsh r1, [r5, r0]
	movs r0, 0x12
	ldrsh r2, [r5, r0]
	adds r0, r5, 0
	bl sub_805C058
	movs r0, 0
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	bl sub_8059BF4
	adds r0, r5, 0
	movs r1, 0x39
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_08089478:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08089480: .4byte gPlayerAvatar
_08089484: .4byte gMapObjects
_08089488: .4byte gSprites
	thumb_func_end sub_8089414

	thumb_func_start sub_808948C
sub_808948C: @ 808948C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080894BC @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080894C0 @ =gMapObjects
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _080894B4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldrb r0, [r4, 0xA]
	bl sub_8089230
_080894B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080894BC: .4byte gPlayerAvatar
_080894C0: .4byte gMapObjects
	thumb_func_end sub_808948C

	thumb_func_start sub_80894C4
sub_80894C4: @ 80894C4
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0xA]
	bl sub_8088FA4
	lsls r0, 24
	cmp r0, 0
	beq _080894F0
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080894F8 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x10
	strh r0, [r4, 0xA]
_080894F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080894F8: .4byte gSprites
	thumb_func_end sub_80894C4

	thumb_func_start fishE
fishE: @ 80894FC
	push {r4-r7,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0xA]
	subs r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	cmp r0, 0
	bne _08089566
	ldr r6, _0808956C @ =gPlayerAvatar
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08089570 @ =gMapObjects
	adds r4, r0, r1
	movs r7, 0
	ldrh r1, [r5, 0x26]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08089530
	movs r7, 0x3
	ldrb r0, [r4, 0x1A]
	movs r1, 0x1
	bl sub_8127ED0
_08089530:
	adds r0, r7, 0
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	adds r0, r4, 0
	movs r1, 0x1
	bl FieldObjectTurn
	ldrh r0, [r5, 0x26]
	strb r0, [r6]
	movs r0, 0
	strb r0, [r6, 0x6]
	movs r0, 0x20
	bl FieldEffectActiveListRemove
	ldr r0, _08089574 @ =sub_8089270
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08089566:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808956C: .4byte gPlayerAvatar
_08089570: .4byte gMapObjects
_08089574: .4byte sub_8089270
	thumb_func_end fishE

	.align 2, 0 @ Don't pad with nop.
