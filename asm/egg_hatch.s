	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text



	thumb_func_start SpriteCB_Egg_5
SpriteCB_Egg_5: @ 8043504
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _08043540
	ldr r4, _08043594 @ =gSprites
	ldr r3, _08043598 @ =gUnknown_0300481C
	ldr r0, [r3]
	ldrb r1, [r0, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldr r0, [r3]
	ldrb r1, [r0, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x1
	bl StartSpriteAffineAnim
_08043540:
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0x8
	bne _0804355A
	movs r1, 0x1
	negs r1, r1
	ldr r0, _0804359C @ =0x0000ffff
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_0804355A:
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x9
	bgt _08043578
	ldr r2, _08043594 @ =gSprites
	ldr r0, _08043598 @ =gUnknown_0300481C
	ldr r0, [r0]
	ldrb r1, [r0, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	subs r1, 0x1
	strh r1, [r0, 0x22]
_08043578:
	ldrh r1, [r5, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0x28
	ble _08043586
	ldr r0, _080435A0 @ =SpriteCallbackDummy
	str r0, [r5, 0x1C]
_08043586:
	adds r0, r1, 0x1
	strh r0, [r5, 0x2E]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08043594: .4byte gSprites
_08043598: .4byte gUnknown_0300481C
_0804359C: .4byte 0x0000ffff
_080435A0: .4byte SpriteCallbackDummy
	thumb_func_end SpriteCB_Egg_5

	thumb_func_start SpriteCB_EggShard
SpriteCB_EggShard: @ 80435A4
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x36]
	adds r0, r1
	strh r0, [r2, 0x36]
	ldrh r1, [r2, 0x32]
	ldrh r3, [r2, 0x38]
	adds r0, r1, r3
	strh r0, [r2, 0x38]
	movs r4, 0x36
	ldrsh r0, [r2, r4]
	cmp r0, 0
	bge _080435C2
	adds r0, 0xFF
_080435C2:
	asrs r0, 8
	strh r0, [r2, 0x24]
	movs r3, 0x38
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bge _080435D0
	adds r0, 0xFF
_080435D0:
	asrs r0, 8
	strh r0, [r2, 0x26]
	ldrh r0, [r2, 0x34]
	adds r3, r1, r0
	strh r3, [r2, 0x32]
	movs r4, 0x22
	ldrsh r1, [r2, r4]
	movs r4, 0x26
	ldrsh r0, [r2, r4]
	adds r0, r1, r0
	adds r1, 0x14
	cmp r0, r1
	ble _080435F6
	lsls r0, r3, 16
	cmp r0, 0
	ble _080435F6
	adds r0, r2, 0
	bl DestroySprite
_080435F6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_EggShard

	thumb_func_start CreateRandomEggShardSprite
CreateRandomEggShardSprite: @ 80435FC
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r3, _0804364C @ =gEggShardVelocities
	ldr r0, _08043650 @ =gUnknown_0300481C
	ldr r4, [r0]
	adds r4, 0x3A
	ldrb r2, [r4]
	lsls r0, r2, 2
	adds r1, r0, r3
	ldrh r6, [r1]
	adds r3, 0x2
	adds r0, r3
	ldrh r5, [r0]
	adds r2, 0x1
	strb r2, [r4]
	bl Random
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	lsls r6, 16
	asrs r6, 16
	lsls r5, 16
	asrs r5, 16
	movs r0, 0x64
	str r0, [sp]
	lsrs r1, 16
	str r1, [sp, 0x4]
	movs r0, 0x78
	movs r1, 0x3C
	adds r2, r6, 0
	adds r3, r5, 0
	bl CreateEggShardSprite
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804364C: .4byte gEggShardVelocities
_08043650: .4byte gUnknown_0300481C
	thumb_func_end CreateRandomEggShardSprite

	thumb_func_start CreateEggShardSprite
CreateEggShardSprite: @ 8043654
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	mov r8, r3
	ldr r0, [sp, 0x1C]
	mov r9, r0
	ldr r1, [sp, 0x20]
	mov r10, r1
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 16
	lsrs r6, 16
	mov r0, r8
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	mov r1, r9
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	mov r0, r10
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, _080436CC @ =gSpriteTemplate_820A418
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x4
	bl CreateSprite
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080436D0 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r6, [r0, 0x30]
	mov r1, r8
	strh r1, [r0, 0x32]
	mov r1, r9
	strh r1, [r0, 0x34]
	mov r1, r10
	bl StartSpriteAnim
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080436CC: .4byte gSpriteTemplate_820A418
_080436D0: .4byte gSprites
	thumb_func_end CreateEggShardSprite

	thumb_func_start EggHatchPrintMessage1
EggHatchPrintMessage1: @ 80436D4
	push {lr}
	sub sp, 0x4
	adds r1, r0, 0
	ldr r0, _080436F8 @ =gUnknown_0300481C
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x8
	adds r2, 0x38
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x3
	bl sub_8002EB0
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080436F8: .4byte gUnknown_0300481C
	thumb_func_end EggHatchPrintMessage1

	thumb_func_start EggHatchPrintMessage2
EggHatchPrintMessage2: @ 80436FC
	push {lr}
	sub sp, 0x4
	adds r1, r0, 0
	ldr r0, _08043720 @ =gUnknown_0300481C
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x8
	adds r2, 0x38
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x3
	bl sub_8003460
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08043720: .4byte gUnknown_0300481C
	thumb_func_end EggHatchPrintMessage2

	thumb_func_start EggHatchUpdateWindowText
EggHatchUpdateWindowText: @ 8043724
	push {lr}
	ldr r0, _08043738 @ =gUnknown_0300481C
	ldr r0, [r0]
	adds r0, 0x8
	bl sub_80035AC
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08043738: .4byte gUnknown_0300481C
	thumb_func_end EggHatchUpdateWindowText

	.align 2, 0 @ Don't pad with nop.
