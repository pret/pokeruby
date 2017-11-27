	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80D2CF8
sub_80D2CF8: @ 80D2CF8
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _080D2D2C @ =gBattleAnimArgs
	ldrb r0, [r0]
	bl GetAnimBankSpriteId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _080D2D30 @ =gTasks
	adds r4, r0
	ldr r2, _080D2D34 @ =gUnknown_083D7CA8
	adds r0, r4, 0
	bl sub_80798F4
	ldr r0, _080D2D38 @ =sub_80D2D3C
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D2D2C: .4byte gBattleAnimArgs
_080D2D30: .4byte gTasks
_080D2D34: .4byte gUnknown_083D7CA8
_080D2D38: .4byte sub_80D2D3C
	thumb_func_end sub_80D2CF8

	thumb_func_start sub_80D2D3C
sub_80D2D3C: @ 80D2D3C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080D2D64 @ =gTasks
	adds r0, r1
	bl sub_807992C
	lsls r0, 24
	cmp r0, 0
	bne _080D2D5C
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080D2D5C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D2D64: .4byte gTasks
	thumb_func_end sub_80D2D3C
	
	.align 2, 0 @ Don't pad with nop.
