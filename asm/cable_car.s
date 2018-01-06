	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_81248AC
sub_81248AC: @ 81248AC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _081248BA
	cmp r0, 0x1
	beq _081248E4
_081248BA:
	ldr r1, _081248E0 @ =gUnknown_02039274
	ldr r2, [r1]
	movs r3, 0
	movs r0, 0x2
	strb r0, [r2, 0x1B]
	ldr r0, [r1]
	strb r3, [r0, 0x19]
	ldr r2, [r1]
	movs r0, 0x14
	strb r0, [r2, 0x1A]
	ldr r1, [r1]
	movs r0, 0xC
	strb r0, [r1, 0x18]
	bl sub_812446C
	bl sub_81245F4
	b _08124906
	.align 2, 0
_081248E0: .4byte gUnknown_02039274
_081248E4:
	ldr r1, _08124914 @ =gUnknown_02039274
	ldr r2, [r1]
	movs r0, 0x2
	strb r0, [r2, 0x1B]
	ldr r2, [r1]
	movs r0, 0x1C
	strb r0, [r2, 0x19]
	ldr r2, [r1]
	movs r0, 0x14
	strb r0, [r2, 0x1A]
	ldr r1, [r1]
	movs r0, 0x4
	strb r0, [r1, 0x18]
	bl sub_812446C
	bl sub_812476C
_08124906:
	ldr r0, _08124914 @ =gUnknown_02039274
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x1C]
	pop {r0}
	bx r0
	.align 2, 0
_08124914: .4byte gUnknown_02039274
	thumb_func_end sub_81248AC

	.align 2, 0 @ Don't pad with nop.
