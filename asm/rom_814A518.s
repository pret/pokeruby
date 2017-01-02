	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_814A518
sub_814A518: @ 814A518
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	bl StripExtCtrlCodes
	adds r0, r4, 0
	bl StringLength
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r5, 0xFC
	bne _0814A556
	cmp r1, 0x5
	bhi _0814A55A
	movs r3, 0xFC
	movs r2, 0x7
_0814A53A:
	adds r0, r4, r1
	strb r3, [r0]
	strb r2, [r0, 0x1]
	adds r0, r1, 0x2
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x5
	bls _0814A53A
	b _0814A55A
_0814A54C:
	adds r0, r4, r1
	strb r5, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
_0814A556:
	cmp r1, 0x5
	bls _0814A54C
_0814A55A:
	adds r1, r4, r1
	movs r0, 0xFF
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_814A518

	thumb_func_start sub_814A568
sub_814A568: @ 814A568
	push {r4,lr}
	adds r4, r0, 0
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x5
	bhi _0814A582
	adds r0, r4, 0
	movs r1, 0x1
	bl ConvertInternationalString
	b _0814A588
_0814A582:
	adds r0, r4, 0
	bl StripExtCtrlCodes
_0814A588:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_814A568

	.align 2, 0 @ Don't pad with nop.
