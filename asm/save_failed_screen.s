	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_814737C
sub_814737C: @ 814737C
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r6, 0
_08147382:
	movs r4, 0x1
	lsls r4, r6
	adds r0, r5, 0
	ands r0, r4
	cmp r0, 0
	beq _0814739C
	adds r0, r6, 0
	bl sub_8147324
	lsls r0, 24
	cmp r0, 0
	bne _0814739C
	bics r5, r4
_0814739C:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x1F
	bls _08147382
	cmp r5, 0
	beq _081473AE
	movs r0, 0x1
	b _081473B0
_081473AE:
	movs r0, 0
_081473B0:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_814737C

	.align 2, 0 @ Don't pad with nop.
