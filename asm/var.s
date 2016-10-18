	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start GetVarPointer
GetVarPointer: @ 8069210
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	adds r2, r1, 0
	ldr r0, _08069224
	cmp r1, r0
	bhi _08069228
	movs r0, 0
	b _0806924A
	.align 2, 0
_08069224: .4byte 0x00003fff
_08069228:
	lsls r0, r1, 16
	cmp r0, 0
	bge _08069244
	ldr r0, _0806923C
	ldr r2, _08069240
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	b _0806924A
	.align 2, 0
_0806923C: .4byte gUnknown_0814B14C
_08069240: .4byte 0xffff8000
_08069244:
	lsls r0, r2, 1
	ldr r1, _08069250
	adds r0, r1
_0806924A:
	pop {r1}
	bx r1
	.align 2, 0
_08069250: .4byte 0x0201ea74
	thumb_func_end GetVarPointer

	thumb_func_start VarGet
VarGet: @ 8069254
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl GetVarPointer
	cmp r0, 0
	beq _08069268
	ldrh r0, [r0]
	b _0806926A
_08069268:
	adds r0, r4, 0
_0806926A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end VarGet

	thumb_func_start VarSet
VarSet: @ 8069270
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	bl GetVarPointer
	cmp r0, 0
	beq _08069288
	strh r4, [r0]
	movs r0, 0x1
	b _0806928A
_08069288:
	movs r0, 0
_0806928A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end VarSet

	thumb_func_start VarGetFieldObjectGraphicsId
VarGetFieldObjectGraphicsId: @ 8069290
	push {lr}
	lsls r0, 24
	lsrs r0, 8
	ldr r1, _080692A8
	adds r0, r1
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080692A8: .4byte 0x40100000
	thumb_func_end VarGetFieldObjectGraphicsId

	.align 2, 0 @ Don't pad with nop.
