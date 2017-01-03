	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

gScriptConditionTable:: @ 83762DC
	@     <  =  >
	.byte 1, 0, 0 @ <
	.byte 0, 1, 0 @ =
	.byte 0, 0, 1 @ >
	.byte 1, 1, 0 @ <=
	.byte 0, 1, 1 @ >=
	.byte 1, 0, 1 @ !=

	.align 2
gUnknown_083762F0:: @ 83762F0
	.4byte gStringVar1
	.4byte gStringVar2
	.4byte gStringVar3
