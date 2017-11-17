	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start CreateRecordMixingSprite
CreateRecordMixingSprite: @ 80C71D8
	push {r4,r5,lr}
	ldr r0, _080C722C @ =gUnknown_083D2878
	bl LoadSpritePalette
	ldr r0, _080C7230 @ =gSpriteTemplate_83D2894
	movs r1, 0
	movs r2, 0
	movs r3, 0x52
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x40
	beq _080C7238
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	ldr r1, _080C7234 @ =gSprites
	adds r4, r0, r1
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r0, 0x10
	movs r1, 0xD
	bl sub_8060388
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x20]
	adds r0, 0x10
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x22]
	adds r0, 0x2
	strh r0, [r4, 0x22]
	adds r0, r5, 0
	b _080C723A
	.align 2, 0
_080C722C: .4byte gUnknown_083D2878
_080C7230: .4byte gSpriteTemplate_83D2894
_080C7234: .4byte gSprites
_080C7238:
	movs r0, 0x40
_080C723A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end CreateRecordMixingSprite

	thumb_func_start DestroyRecordMixingSprite
DestroyRecordMixingSprite: @ 80C7240
	push {r4-r7,lr}
	ldr r4, _080C7274 @ =gSprites
	adds r7, r4, 0
	movs r6, 0
	movs r5, 0x3F
_080C724A:
	adds r0, r7, 0
	adds r0, 0x14
	adds r0, r6, r0
	ldr r1, [r0]
	ldr r0, _080C7278 @ =gSpriteTemplate_83D2894
	cmp r1, r0
	bne _080C7264
	adds r0, r4, 0
	bl FreeSpritePalette
	adds r0, r4, 0
	bl DestroySprite
_080C7264:
	adds r4, 0x44
	adds r6, 0x44
	subs r5, 0x1
	cmp r5, 0
	bge _080C724A
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C7274: .4byte gSprites
_080C7278: .4byte gSpriteTemplate_83D2894
	thumb_func_end DestroyRecordMixingSprite

	.align 2, 0 @ Don't pad with nop.
