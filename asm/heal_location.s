	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_80FA86C
sub_80FA86C: @ 80FA86C
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r1, 16
	movs r3, 0
	ldr r2, _080FA890 @ =gUnknown_083E5A20
_080FA87A:
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r0, r4
	bne _080FA894
	movs r0, 0x1
	ldrsb r0, [r2, r0]
	cmp r0, r1
	bne _080FA894
	adds r0, r3, 0x1
	b _080FA89E
	.align 2, 0
_080FA890: .4byte gUnknown_083E5A20
_080FA894:
	adds r2, 0x8
	adds r3, 0x1
	cmp r3, 0x15
	bls _080FA87A
	movs r0, 0
_080FA89E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80FA86C

	thumb_func_start unref_sub_80FA8A4
unref_sub_80FA8A4: @ 80FA8A4
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	bl sub_80FA86C
	cmp r0, 0
	beq _080FA8C4
	lsls r0, 3
	ldr r1, _080FA8C0 @ =gUnknown_083E5A18
	adds r0, r1
	b _080FA8C6
	.align 2, 0
_080FA8C0: .4byte gUnknown_083E5A18
_080FA8C4:
	movs r0, 0
_080FA8C6:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_80FA8A4

	thumb_func_start sub_80FA8CC
sub_80FA8CC: @ 80FA8CC
	push {lr}
	cmp r0, 0
	beq _080FA8E4
	cmp r0, 0x16
	bhi _080FA8E4
	lsls r0, 3
	ldr r1, _080FA8E0 @ =gUnknown_083E5A18
	adds r0, r1
	b _080FA8E6
	.align 2, 0
_080FA8E0: .4byte gUnknown_083E5A18
_080FA8E4:
	movs r0, 0
_080FA8E6:
	pop {r1}
	bx r1
	thumb_func_end sub_80FA8CC

	.align 2, 0 @ Don't pad with nop.
