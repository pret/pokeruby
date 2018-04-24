	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

	thumb_func_start LoadAreaUnknownGraphics
LoadAreaUnknownGraphics: @ 81117AC
	push {lr}
	sub sp, 0x8
	ldr r0, _081117D4 @ =gUnknown_083F8664
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r0, _081117D8 @ =gAreaUnknownTiles
	ldr r1, _081117DC @ =gSharedMem + 0xFB4
	bl LZ77UnCompWram
	mov r0, sp
	bl LoadSpriteSheet
	ldr r0, _081117E0 @ =gUnknown_083F865C
	bl LoadSpritePalette
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_081117D4: .4byte gUnknown_083F8664
_081117D8: .4byte gAreaUnknownTiles
_081117DC: .4byte gSharedMem + 0xFB4
_081117E0: .4byte gUnknown_083F865C
	thumb_func_end LoadAreaUnknownGraphics

	thumb_func_start CreateAreaUnknownSprites
CreateAreaUnknownSprites: @ 81117E4
	push {r4-r7,lr}
	ldr r1, _08111810 @ =gSharedMem
	movs r2, 0x88
	lsls r2, 1
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, 0
	beq _08111818
	movs r4, 0
	ldr r7, _08111814 @ =0x00000fa8
	adds r2, r1, r7
	movs r1, 0
_081117FC:
	lsls r0, r4, 2
	adds r0, r2
	str r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x2
	bls _081117FC
	b _0811188E
	.align 2, 0
_08111810: .4byte gSharedMem
_08111814: .4byte 0x00000fa8
_08111818:
	movs r4, 0
	ldr r6, _08111868 @ =gSprites
	ldr r0, _0811186C @ =0x00000fa8
	adds r5, r1, r0
_08111820:
	lsls r1, r4, 21
	movs r2, 0xA0
	lsls r2, 16
	adds r1, r2
	asrs r1, 16
	ldr r0, _08111870 @ =gSpriteTemplate_83F8674
	movs r2, 0x8C
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0811187C
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r6
	ldrh r3, [r2, 0x4]
	lsls r0, r3, 22
	lsrs r0, 22
	lsls r1, r4, 4
	adds r0, r1
	ldr r7, _08111874 @ =0x000003ff
	adds r1, r7, 0
	ands r0, r1
	ldr r7, _08111878 @ =0xfffffc00
	adds r1, r7, 0
	ands r3, r1
	orrs r3, r0
	strh r3, [r2, 0x4]
	lsls r0, r4, 2
	adds r0, r5
	str r2, [r0]
	b _08111884
	.align 2, 0
_08111868: .4byte gSprites
_0811186C: .4byte 0x00000fa8
_08111870: .4byte gSpriteTemplate_83F8674
_08111874: .4byte 0x000003ff
_08111878: .4byte 0xfffffc00
_0811187C:
	lsls r0, r4, 2
	adds r0, r5
	movs r1, 0
	str r1, [r0]
_08111884:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x2
	bls _08111820
_0811188E:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end CreateAreaUnknownSprites

	.align 2, 0 @ Don't pad with nop.
