	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text
	
	thumb_func_start AccessHallOfFamePC
AccessHallOfFamePC: @ 810D618
	push {lr}
	ldr r0, _0810D628 @ =sub_81428CC
	bl SetMainCallback2
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_0810D628: .4byte sub_81428CC
	thumb_func_end AccessHallOfFamePC

	thumb_func_start ReturnFromHallOfFamePC
ReturnFromHallOfFamePC: @ 810D62C
	push {lr}
	ldr r0, _0810D640 @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	ldr r1, _0810D644 @ =gUnknown_0300485C
	ldr r0, _0810D648 @ =ReshowPCMenuAfterHallOfFamePC
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0810D640: .4byte c2_exit_to_overworld_2_switch
_0810D644: .4byte gUnknown_0300485C
_0810D648: .4byte ReshowPCMenuAfterHallOfFamePC
	thumb_func_end ReturnFromHallOfFamePC

	thumb_func_start ReshowPCMenuAfterHallOfFamePC
ReshowPCMenuAfterHallOfFamePC: @ 810D64C
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	bl sub_8053E90
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	bl TryCreatePCMenu
	bl sub_80B5838
	ldr r0, _0810D680 @ =sub_810D684
	movs r1, 0xA
	bl CreateTask
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0810D680: .4byte sub_810D684
	thumb_func_end ReshowPCMenuAfterHallOfFamePC

	thumb_func_start sub_810D684
sub_810D684: @ 810D684
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0810D6A0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0810D69C
	adds r0, r2, 0
	bl DestroyTask
_0810D69C:
	pop {r0}
	bx r0
	.align 2, 0
_0810D6A0: .4byte gPaletteFade
	thumb_func_end sub_810D684

	.align 2, 0 @ Don't pad with nop.
