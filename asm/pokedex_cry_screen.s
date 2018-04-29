	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_811A324
sub_811A324: @ 811A324
	ldr r2, _0811A344 @ =0x040000d4
	ldr r0, _0811A348 @ =gSharedMem
	str r0, [r2]
	movs r1, 0xE0
	lsls r1, 9
	adds r0, r1
	ldrh r0, [r0, 0x14]
	movs r1, 0xC0
	lsls r1, 19
	adds r0, r1
	str r0, [r2, 0x4]
	ldr r0, _0811A34C @ =0x80000e00
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	bx lr
	.align 2, 0
_0811A344: .4byte 0x040000d4
_0811A348: .4byte gSharedMem
_0811A34C: .4byte 0x80000e00
	thumb_func_end sub_811A324

	thumb_func_start sub_811A350
sub_811A350: @ 811A350
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r3, r0, 0
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r2, 24
	cmp r0, 0x1
	beq _0811A38C
	cmp r0, 0x1
	bgt _0811A36E
	cmp r0, 0
	beq _0811A378
	b _0811A3C4
_0811A36E:
	cmp r3, 0x2
	beq _0811A3A0
	cmp r3, 0x3
	beq _0811A3B4
	b _0811A3C4
_0811A378:
	cmp r2, 0
	beq _0811A384
	ldr r0, _0811A380 @ =REG_BG0VOFS
	b _0811A3C2
	.align 2, 0
_0811A380: .4byte REG_BG0VOFS
_0811A384:
	ldr r0, _0811A388 @ =REG_BG0HOFS
	b _0811A3C2
	.align 2, 0
_0811A388: .4byte REG_BG0HOFS
_0811A38C:
	cmp r2, 0
	beq _0811A398
	ldr r0, _0811A394 @ =REG_BG1VOFS
	b _0811A3C2
	.align 2, 0
_0811A394: .4byte REG_BG1VOFS
_0811A398:
	ldr r0, _0811A39C @ =REG_BG1HOFS
	b _0811A3C2
	.align 2, 0
_0811A39C: .4byte REG_BG1HOFS
_0811A3A0:
	cmp r2, 0
	beq _0811A3AC
	ldr r0, _0811A3A8 @ =REG_BG2VOFS
	b _0811A3C2
	.align 2, 0
_0811A3A8: .4byte REG_BG2VOFS
_0811A3AC:
	ldr r0, _0811A3B0 @ =REG_BG2HOFS
	b _0811A3C2
	.align 2, 0
_0811A3B0: .4byte REG_BG2HOFS
_0811A3B4:
	cmp r2, 0
	beq _0811A3C0
	ldr r0, _0811A3BC @ =REG_BG3VOFS
	b _0811A3C2
	.align 2, 0
_0811A3BC: .4byte REG_BG3VOFS
_0811A3C0:
	ldr r0, _0811A3C8 @ =REG_BG3HOFS
_0811A3C2:
	strh r1, [r0]
_0811A3C4:
	pop {r0}
	bx r0
	.align 2, 0
_0811A3C8: .4byte REG_BG3HOFS
	thumb_func_end sub_811A350

	.align 2, 0 @ Don't pad with nop.
