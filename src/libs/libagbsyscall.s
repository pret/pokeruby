	.include "include/macros.inc"
	.syntax unified

	.text

	thumb_func_start ArcTan2
ArcTan2: @ 81E07E0
	swi 0xA
	bx lr
	thumb_func_end ArcTan2

	thumb_func_start BgAffineSet
BgAffineSet: @ 81E07E4
	swi 0xE
	bx lr
	thumb_func_end BgAffineSet

	thumb_func_start CpuFastSet
CpuFastSet: @ 81E07E8
	swi 0xC
	bx lr
	thumb_func_end CpuFastSet

	thumb_func_start CpuSet
CpuSet: @ 81E07EC
	swi 0xB
	bx lr
	thumb_func_end CpuSet

	thumb_func_start LZ77UnCompVram
LZ77UnCompVram: @ 81E07F4
	swi 0x12
	bx lr
	thumb_func_end LZ77UnCompVram

	thumb_func_start LZ77UnCompWram
LZ77UnCompWram: @ 81E07F8
	swi 0x11
	bx lr
	thumb_func_end LZ77UnCompWram

	thumb_func_start ObjAffineSet
ObjAffineSet: @ 81E0804
	swi 0xF
	bx lr
	thumb_func_end ObjAffineSet

	thumb_func_start RLUnCompVram
RLUnCompVram: @ 81E0808
	swi 0x15
	bx lr
	thumb_func_end RLUnCompVram

	thumb_func_start RLUnCompWram
RLUnCompWram: @ 81E080C
	swi 0x14
	bx lr
	thumb_func_end RLUnCompWram

	thumb_func_start RegisterRamReset
RegisterRamReset: @ 81E0810
	swi 0x1
	bx lr
	thumb_func_end RegisterRamReset

	thumb_func_start SoftReset
SoftReset: @ 81E0814
	ldr r3, =0x04000208
	movs r2, 0
	strb r2, [r3]
	ldr r1, =0x03007f00 @ User Stack
	mov sp, r1
	swi 0x1
	swi 0
	.pool
	thumb_func_end SoftReset

	thumb_func_start Sqrt
Sqrt: @ 81E082C
	swi 0x8
	bx lr
	thumb_func_end Sqrt

	thumb_func_start VBlankIntrWait
VBlankIntrWait: @ 81E0830
	movs r2, 0
	swi 0x5
	bx lr
	thumb_func_end VBlankIntrWait

	.align 2, 0 @ Don't pad with nop.
