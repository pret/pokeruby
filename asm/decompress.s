	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_800D238
sub_800D238: @ 800D238
	push {lr}
	bl LZ77UnCompWram
	pop {r0}
	bx r0
	thumb_func_end sub_800D238

	thumb_func_start LZDecompressVram
LZDecompressVram: @ 800D244
	push {lr}
	bl LZ77UnCompVram
	pop {r0}
	bx r0
	thumb_func_end LZDecompressVram

	thumb_func_start LoadCompressedObjectPic
LoadCompressedObjectPic: @ 800D250
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r0, [r4]
	movs r5, 0x80
	lsls r5, 18
	adds r1, r5, 0
	bl LZ77UnCompWram
	str r5, [sp]
	ldrh r1, [r4, 0x6]
	lsls r1, 16
	ldrh r0, [r4, 0x4]
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end LoadCompressedObjectPic

	thumb_func_start LoadCompressedObjectPicOverrideBuffer
LoadCompressedObjectPicOverrideBuffer: @ 800D27C
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, [r4]
	bl LZ77UnCompWram
	str r5, [sp]
	ldrh r1, [r4, 0x6]
	lsls r1, 16
	ldrh r0, [r4, 0x4]
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end LoadCompressedObjectPicOverrideBuffer

	thumb_func_start LoadCompressedObjectPalette
LoadCompressedObjectPalette: @ 800D2A4
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r0, [r5]
	movs r4, 0x80
	lsls r4, 18
	adds r1, r4, 0
	bl LZ77UnCompWram
	str r4, [sp]
	ldrh r2, [r5, 0x4]
	ldr r1, _0800D2D4 @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r1
	orrs r0, r2
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpritePalette
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800D2D4: .4byte 0xffff0000
	thumb_func_end LoadCompressedObjectPalette

	thumb_func_start LoadCompressedObjectPaletteOverrideBuffer
LoadCompressedObjectPaletteOverrideBuffer: @ 800D2D8
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r0, [r5]
	bl LZ77UnCompWram
	str r4, [sp]
	ldrh r2, [r5, 0x4]
	ldr r1, _0800D304 @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r1
	orrs r0, r2
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpritePalette
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800D304: .4byte 0xffff0000
	thumb_func_end LoadCompressedObjectPaletteOverrideBuffer

	thumb_func_start DecompressPicFromTable_2
DecompressPicFromTable_2: @ 800D308
	push {lr}
	adds r2, r0, 0
	ldr r3, [sp, 0x4]
	ldr r1, [sp, 0x8]
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	ble _0800D328
	ldr r0, _0800D324 @ =gMonFrontPicTable
	ldr r0, [r0]
	adds r1, r3, 0
	bl LZ77UnCompWram
	b _0800D330
	.align 2, 0
_0800D324: .4byte gMonFrontPicTable
_0800D328:
	ldr r0, [r2]
	adds r1, r3, 0
	bl LZ77UnCompWram
_0800D330:
	pop {r0}
	bx r0
	thumb_func_end DecompressPicFromTable_2

	thumb_func_start sub_800D334
sub_800D334: @ 800D334
	push {r4-r6,lr}
	sub sp, 0x10
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r2, [sp, 0x20]
	ldr r1, _0800D354 @ =gUnknown_081FAF4C
	ldr r0, [r1]
	cmp r2, r0
	beq _0800D34E
	ldr r0, [r1, 0x8]
	cmp r2, r0
	bne _0800D358
_0800D34E:
	movs r1, 0
	b _0800D35A
	.align 2, 0
_0800D354: .4byte gUnknown_081FAF4C
_0800D358:
	movs r1, 0x1
_0800D35A:
	str r2, [sp]
	ldr r0, [sp, 0x24]
	str r0, [sp, 0x4]
	ldr r0, [sp, 0x28]
	str r0, [sp, 0x8]
	str r1, [sp, 0xC]
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_800D378
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_800D334

	thumb_func_start sub_800D378
sub_800D378: @ 800D378
	push {r4-r7,lr}
	adds r1, r0, 0
	ldr r5, [sp, 0x14]
	ldr r6, [sp, 0x18]
	ldr r4, [sp, 0x1C]
	ldr r0, [sp, 0x20]
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r6, SPECIES_UNOWN
	bne _0800D3EC
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r4
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r4
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r4
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r4
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _0800D3C0
	movs r1, SPECIES_UNOWN
	b _0800D3CA
_0800D3C0:
	movs r2, 0xCE
	lsls r2, 1
	adds r0, r1, r2
	lsls r0, 16
	lsrs r1, r0, 16
_0800D3CA:
	cmp r7, 0
	bne _0800D3DC
	ldr r0, _0800D3D8 @ =gMonBackPicTable
	lsls r1, 3
	adds r1, r0
	ldr r0, [r1]
	b _0800D3F8
	.align 2, 0
_0800D3D8: .4byte gMonBackPicTable
_0800D3DC:
	ldr r0, _0800D3E8 @ =gMonFrontPicTable
	lsls r1, 3
	adds r1, r0
	ldr r0, [r1]
	b _0800D3F8
	.align 2, 0
_0800D3E8: .4byte gMonFrontPicTable
_0800D3EC:
	movs r0, 0xCE
	lsls r0, 1
	cmp r6, r0
	ble _0800D404
	ldr r0, _0800D400 @ =gMonFrontPicTable
	ldr r0, [r0]
_0800D3F8:
	adds r1, r5, 0
	bl LZ77UnCompWram
	b _0800D40C
	.align 2, 0
_0800D400: .4byte gMonFrontPicTable
_0800D404:
	ldr r0, [r1]
	adds r1, r5, 0
	bl LZ77UnCompWram
_0800D40C:
	lsls r0, r6, 16
	lsrs r0, 16
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r7, 0
	bl DrawSpindaSpots
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_800D378

	thumb_func_start Unused_LZDecompressWramIndirect
Unused_LZDecompressWramIndirect: @ 800D420
	push {lr}
	ldr r0, [r0]
	bl LZ77UnCompWram
	pop {r0}
	bx r0
	thumb_func_end Unused_LZDecompressWramIndirect

	.align 2, 0 @ Don't pad with nop.
