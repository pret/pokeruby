	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	@ fury_cutter_count

	thumb_func_start sub_80D30AC
sub_80D30AC: @ 80D30AC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080D30C8 @ =gBattleAnimArgs
	ldr r1, _080D30CC @ =gDisableStructMoveAnim
	ldr r1, [r1]
	ldrb r2, [r1, 0x10]
	movs r1, 0x1
	ands r1, r2
	strh r1, [r3, 0xE]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080D30C8: .4byte gBattleAnimArgs
_080D30CC: .4byte gDisableStructMoveAnim
	thumb_func_end sub_80D30AC

	thumb_func_start update_fury_cutter_counter_copy
update_fury_cutter_counter_copy: @ 80D30D0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080D30E8 @ =gBattleAnimArgs
	ldr r1, _080D30EC @ =gDisableStructMoveAnim
	ldr r1, [r1]
	ldrb r1, [r1, 0x10]
	strh r1, [r2, 0xE]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080D30E8: .4byte gBattleAnimArgs
_080D30EC: .4byte gDisableStructMoveAnim
	thumb_func_end update_fury_cutter_counter_copy
	
	.align 2, 0 @ Don't pad with nop.
