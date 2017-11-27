	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	@ sunlight

	thumb_func_start sub_80D517C
sub_80D517C: @ 80D517C
	push {lr}
	movs r1, 0
	strh r1, [r0, 0x20]
	strh r1, [r0, 0x22]
	movs r1, 0x3C
	strh r1, [r0, 0x2E]
	movs r1, 0x8C
	strh r1, [r0, 0x32]
	movs r1, 0x50
	strh r1, [r0, 0x36]
	ldr r1, _080D51A0 @ =sub_8078B34
	str r1, [r0, 0x1C]
	ldr r1, _080D51A4 @ =move_anim_8072740
	bl StoreSpriteCallbackInData
	pop {r0}
	bx r0
	.align 2, 0
_080D51A0: .4byte sub_8078B34
_080D51A4: .4byte move_anim_8072740
	thumb_func_end sub_80D517C
	
	.align 2, 0 @ Don't pad with nop.
