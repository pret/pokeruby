	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sp109_CreatePCMenu
sp109_CreatePCMenu: @ 80B5704
	push {lr}
	ldr r0, _080B5724 @ =sub_80B52B4
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080B572C
	ldr r1, _080B5728 @ =gScriptResult
	movs r0, 0xFF
	strh r0, [r1]
	bl CreatePCMenu
	movs r0, 0x1
	b _080B572E
	.align 2, 0
_080B5724: .4byte sub_80B52B4
_080B5728: .4byte gScriptResult
_080B572C:
	movs r0, 0
_080B572E:
	pop {r1}
	bx r1
	thumb_func_end sp109_CreatePCMenu

	thumb_func_start CreatePCMenu
CreatePCMenu: @ 80B5734
	push {r4-r7,lr}
	sub sp, 0x8
	ldr r0, _080B5758 @ =gPCText_PlayersPC
	bl GetStringWidthInTilesForScriptMenu
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _080B575C @ =gPCText_SomeonesPC
	bl GetStringWidthInTilesForScriptMenu
	lsls r0, 16
	lsrs r0, 16
	cmp r4, r0
	bls _080B5760
	lsls r0, r4, 24
	lsrs r5, r0, 24
	b _080B5762
	.align 2, 0
_080B5758: .4byte gPCText_PlayersPC
_080B575C: .4byte gPCText_SomeonesPC
_080B5760:
	movs r5, 0x8
_080B5762:
	ldr r0, _080B5798 @ =0x00000804
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080B57A4
	movs r7, 0x4
	adds r4, r5, 0x2
	lsls r2, r4, 24
	lsrs r2, 24
	movs r0, 0
	movs r1, 0
	movs r3, 0x9
	bl MenuDrawTextWindow
	ldr r0, _080B579C @ =gPCText_HallOfFame
	movs r1, 0x1
	movs r2, 0x5
	bl MenuPrint
	ldr r0, _080B57A0 @ =gPCText_LogOff
	movs r1, 0x1
	movs r2, 0x7
	bl MenuPrint
	b _080B57C0
	.align 2, 0
_080B5798: .4byte 0x00000804
_080B579C: .4byte gPCText_HallOfFame
_080B57A0: .4byte gPCText_LogOff
_080B57A4:
	movs r7, 0x3
	adds r4, r5, 0x2
	lsls r2, r4, 24
	lsrs r2, 24
	movs r0, 0
	movs r1, 0
	movs r3, 0x7
	bl MenuDrawTextWindow
	ldr r0, _080B57DC @ =gPCText_LogOff
	movs r1, 0x1
	movs r2, 0x5
	bl MenuPrint
_080B57C0:
	adds r6, r4, 0
	ldr r0, _080B57E0 @ =0x0000084b
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080B57E8
	ldr r0, _080B57E4 @ =gPCText_LanettesPC
	movs r1, 0x1
	movs r2, 0x1
	bl MenuPrint
	b _080B57F2
	.align 2, 0
_080B57DC: .4byte gPCText_LogOff
_080B57E0: .4byte 0x0000084b
_080B57E4: .4byte gPCText_LanettesPC
_080B57E8:
	ldr r0, _080B5830 @ =gPCText_SomeonesPC
	movs r1, 0x1
	movs r2, 0x1
	bl MenuPrint
_080B57F2:
	ldr r0, _080B5834 @ =gPCText_PlayersPC
	movs r1, 0x1
	movs r2, 0x3
	bl MenuPrint
	movs r4, 0
	str r4, [sp]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	adds r3, r7, 0
	bl InitMenu
	lsls r2, r6, 24
	lsrs r2, 24
	lsls r3, r7, 1
	adds r3, 0x1
	str r4, [sp]
	str r7, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	bl sub_80B5230
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5830: .4byte gPCText_SomeonesPC
_080B5834: .4byte gPCText_PlayersPC
	thumb_func_end CreatePCMenu

	thumb_func_start sub_80B5838
sub_80B5838: @ 80B5838
	push {lr}
	bl MenuDisplayMessageBox
	ldr r0, _080B584C @ =gUnknown_081A0A01
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	pop {r0}
	bx r0
	.align 2, 0
_080B584C: .4byte gUnknown_081A0A01
	thumb_func_end sub_80B5838

	thumb_func_start task_picbox
task_picbox: @ 80B5850
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080B5874 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080B58BE
	cmp r0, 0x1
	bgt _080B5878
	cmp r0, 0
	beq _080B5894
	b _080B58BE
	.align 2, 0
_080B5874: .4byte gTasks
_080B5878:
	cmp r0, 0x2
	beq _080B5882
	cmp r0, 0x3
	beq _080B58A0
	b _080B58BE
_080B5882:
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B589C @ =gSprites
	adds r0, r1
	bl FreeResourcesAndDestroySprite
_080B5894:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B58BE
	.align 2, 0
_080B589C: .4byte gSprites
_080B58A0:
	ldrb r2, [r4, 0xE]
	adds r0, r2, 0
	ldrb r3, [r4, 0x10]
	adds r1, r3, 0
	adds r2, 0x9
	lsls r2, 24
	lsrs r2, 24
	adds r3, 0xA
	lsls r3, 24
	lsrs r3, 24
	bl MenuZeroFillWindowRect
	adds r0, r5, 0
	bl DestroyTask
_080B58BE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end task_picbox

	thumb_func_start sub_80B58C4
sub_80B58C4: @ 80B58C4
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r7, r0, 16
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	ldr r4, _080B595C @ =task_picbox
	adds r0, r4, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080B596C
	adds r2, r6, 0
	adds r2, 0x9
	lsls r2, 24
	lsrs r2, 24
	adds r3, r5, 0
	adds r3, 0xA
	lsls r3, 24
	lsrs r3, 24
	adds r0, r6, 0
	adds r1, r5, 0
	bl MenuDrawTextWindow
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B5960 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r0, 0
	strh r0, [r4, 0x8]
	strh r7, [r4, 0xA]
	lsls r1, r6, 19
	movs r0, 0xA0
	lsls r0, 14
	adds r1, r0
	asrs r1, 16
	lsls r2, r5, 19
	adds r2, r0
	asrs r2, 16
	adds r0, r7, 0
	movs r3, 0
	bl CreateMonSprite_PicBox
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xC]
	strh r6, [r4, 0xE]
	strh r5, [r4, 0x10]
	ldr r3, _080B5964 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r1, r0
	ldr r2, _080B5968 @ =SpriteCallbackDummy
	str r2, [r0]
	adds r1, r3
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x5]
	movs r0, 0x1
	b _080B596E
	.align 2, 0
_080B595C: .4byte task_picbox
_080B5960: .4byte gTasks
_080B5964: .4byte gSprites
_080B5968: .4byte SpriteCallbackDummy
_080B596C:
	movs r0, 0
_080B596E:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80B58C4

	thumb_func_start picbox_close
picbox_close: @ 80B5974
	push {lr}
	ldr r0, _080B5998 @ =task_picbox
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080B59A4
	ldr r0, _080B599C @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r0, _080B59A0 @ =sub_80B59AC
	b _080B59A6
	.align 2, 0
_080B5998: .4byte task_picbox
_080B599C: .4byte gTasks
_080B59A0: .4byte sub_80B59AC
_080B59A4:
	movs r0, 0
_080B59A6:
	pop {r1}
	bx r1
	thumb_func_end picbox_close

	thumb_func_start sub_80B59AC
sub_80B59AC: @ 80B59AC
	push {lr}
	ldr r0, _080B59C0 @ =task_picbox
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080B59C4
	movs r0, 0
	b _080B59C6
	.align 2, 0
_080B59C0: .4byte task_picbox
_080B59C4:
	movs r0, 0x1
_080B59C6:
	pop {r1}
	bx r1
	thumb_func_end sub_80B59AC

	.align 2, 0 @ Don't pad with nop.
