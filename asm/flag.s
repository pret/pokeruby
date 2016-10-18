	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start GetFlagPointer
GetFlagPointer: @ 80692AC
	push {lr}
	lsls r2, r0, 16
	lsrs r1, r2, 16
	adds r3, r1, 0
	cmp r1, 0
	bne _080692BC
	movs r0, 0
	b _080692E2
_080692BC:
	ldr r0, _080692C8
	cmp r1, r0
	bhi _080692D0
	lsrs r0, r2, 19
	ldr r1, _080692CC
	b _080692E0
	.align 2, 0
_080692C8: .4byte 0x00003fff
_080692CC: .4byte gSaveBlock1 + 0x1220
_080692D0:
	ldr r1, _080692E8
	adds r0, r3, r1
	cmp r0, 0
	bge _080692DC
	adds r1, 0x7
	adds r0, r3, r1
_080692DC:
	asrs r0, 3
	ldr r1, _080692EC
_080692E0:
	adds r0, r1
_080692E2:
	pop {r1}
	bx r1
	.align 2, 0
_080692E8: .4byte 0xffffc000
_080692EC: .4byte gUnknown_0202E8E2
	thumb_func_end GetFlagPointer

	thumb_func_start FlagSet
FlagSet: @ 80692F0
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl GetFlagPointer
	adds r2, r0, 0
	cmp r2, 0
	beq _08069310
	movs r0, 0x7
	ands r0, r4
	movs r1, 0x1
	lsls r1, r0
	ldrb r0, [r2]
	orrs r1, r0
	strb r1, [r2]
_08069310:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FlagSet

	thumb_func_start FlagReset
FlagReset: @ 8069318
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl GetFlagPointer
	adds r2, r0, 0
	cmp r2, 0
	beq _08069338
	movs r0, 0x7
	ands r0, r4
	movs r1, 0x1
	lsls r1, r0
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
_08069338:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FlagReset

	thumb_func_start FlagGet
FlagGet: @ 8069340
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl GetFlagPointer
	cmp r0, 0
	beq _08069364
	ldrb r0, [r0]
	movs r1, 0x7
	ands r1, r4
	asrs r0, r1
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08069364
	movs r0, 0x1
	b _08069366
_08069364:
	movs r0, 0
_08069366:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FlagGet

	.align 2, 0 @ Don't pad with nop.
