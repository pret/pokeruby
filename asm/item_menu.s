	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80A6D98
sub_80A6D98: @ 80A6D98
	push {lr}
_080A6D9A:
	bl sub_80A317C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A6DBC
	ldr r0, _080A6DB4 @ =sub_80A50C8
	movs r1, 0
	bl CreateTask
	ldr r1, _080A6DB8 @ =gUnknown_02038563
	strb r0, [r1]
	b _080A6DC8
	.align 2, 0
_080A6DB4: .4byte sub_80A50C8
_080A6DB8: .4byte gUnknown_02038563
_080A6DBC:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A6D9A
_080A6DC8:
	pop {r0}
	bx r0
	thumb_func_end sub_80A6D98

	thumb_func_start sub_80A6DCC
sub_80A6DCC: @ 80A6DCC
	push {lr}
	ldr r1, _080A6DE4 @ =gUnknown_03000700
	movs r0, 0
	strb r0, [r1]
	ldr r1, _080A6DE8 @ =gUnknown_03000701
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _080A6DEC @ =sub_80A6D98
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080A6DE4: .4byte gUnknown_03000700
_080A6DE8: .4byte gUnknown_03000701
_080A6DEC: .4byte sub_80A6D98
	thumb_func_end sub_80A6DCC

	thumb_func_start sub_80A6DF0
sub_80A6DF0: @ 80A6DF0
	push {r4-r6,lr}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r4, _080A6E4C @ =gUnknown_02038564
	ldrb r0, [r4]
	subs r0, 0x1
	lsls r0, 25
	lsrs r6, r0, 24
	movs r1, 0x9
	subs r1, r6
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x7
	movs r2, 0xD
	movs r3, 0xC
	bl MenuDrawTextWindow
	movs r2, 0xA
	subs r2, r6
	lsls r2, 24
	lsrs r2, 24
	adds r0, r6, 0x2
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	adds r0, r5, 0
	movs r1, 0x8
	movs r3, 0x5
	bl sub_80A4008
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _080A6E58
	ldr r1, _080A6E50 @ =gUnknown_083C1640
	ldr r0, _080A6E54 @ =gUnknown_03000704
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x8
	movs r2, 0xA
	bl MenuPrint
	b _080A6E80
	.align 2, 0
_080A6E4C: .4byte gUnknown_02038564
_080A6E50: .4byte gUnknown_083C1640
_080A6E54: .4byte gUnknown_03000704
_080A6E58:
	ldr r5, _080A6EAC @ =gUnknown_083C1640
	ldr r4, _080A6EB0 @ =gUnknown_03000704
	ldr r0, [r4]
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r5
	ldr r0, [r0]
	movs r1, 0x8
	movs r2, 0x8
	bl MenuPrint
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	lsls r0, 3
	adds r0, r5
	ldr r0, [r0]
	movs r1, 0x8
	movs r2, 0xA
	bl MenuPrint
_080A6E80:
	movs r2, 0xA
	subs r2, r6
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _080A6EB4 @ =gUnknown_02038564
	ldrb r3, [r0]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x5
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x8
	bl InitMenu
	movs r0, 0x2
	bl sub_80A7528
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A6EAC: .4byte gUnknown_083C1640
_080A6EB0: .4byte gUnknown_03000704
_080A6EB4: .4byte gUnknown_02038564
	thumb_func_end sub_80A6DF0

	thumb_func_start sub_80A6EB8
sub_80A6EB8: @ 80A6EB8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	ldr r2, _080A6EE0 @ =gMain
	ldrh r0, [r2, 0x30]
	movs r1, 0xF0
	ands r1, r0
	cmp r1, 0x40
	bne _080A6EE8
	ldr r4, _080A6EE4 @ =gUnknown_03000700
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _080A6FC0
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _080A6F02
	.align 2, 0
_080A6EE0: .4byte gMain
_080A6EE4: .4byte gUnknown_03000700
_080A6EE8:
	cmp r1, 0x80
	bne _080A6F14
	ldr r4, _080A6F0C @ =gUnknown_03000700
	ldrb r0, [r4]
	adds r0, 0x1
	ldr r1, _080A6F10 @ =gUnknown_02038564
	ldrb r1, [r1]
	cmp r0, r1
	bge _080A6FC0
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_080A6F02:
	bl MoveMenuCursor
	strb r0, [r4]
	b _080A6FC0
	.align 2, 0
_080A6F0C: .4byte gUnknown_03000700
_080A6F10: .4byte gUnknown_02038564
_080A6F14:
	ldrh r1, [r2, 0x2E]
	movs r2, 0x1
	ands r2, r1
	cmp r2, 0
	beq _080A6F84
	ldr r1, _080A6F68 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x1C]
	ldr r1, _080A6F6C @ =gUnknown_03005D10
	ldr r0, _080A6F70 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0]
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_80A48E8
	ldr r0, _080A6F74 @ =gBGTilemapBuffers + 0x800
	bl sub_80A4DA4
	ldr r1, _080A6F78 @ =gUnknown_083C1640
	ldr r0, _080A6F7C @ =gUnknown_03000700
	ldrb r2, [r0]
	ldr r0, _080A6F80 @ =gUnknown_03000704
	ldr r0, [r0]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	b _080A6FC0
	.align 2, 0
_080A6F68: .4byte gTasks
_080A6F6C: .4byte gUnknown_03005D10
_080A6F70: .4byte gUnknown_02038559
_080A6F74: .4byte gBGTilemapBuffers + 0x800
_080A6F78: .4byte gUnknown_083C1640
_080A6F7C: .4byte gUnknown_03000700
_080A6F80: .4byte gUnknown_03000704
_080A6F84:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080A6FC0
	ldr r1, _080A6FC8 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0x1C]
	ldr r1, _080A6FCC @ =gUnknown_03005D10
	ldr r0, _080A6FD0 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0]
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80A48E8
	ldr r0, _080A6FD4 @ =gBGTilemapBuffers + 0x800
	bl sub_80A4DA4
	ldr r0, _080A6FD8 @ =gUnknown_083C1640
	ldr r1, [r0, 0x2C]
	adds r0, r5, 0
	bl _call_via_r1
_080A6FC0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A6FC8: .4byte gTasks
_080A6FCC: .4byte gUnknown_03005D10
_080A6FD0: .4byte gUnknown_02038559
_080A6FD4: .4byte gBGTilemapBuffers + 0x800
_080A6FD8: .4byte gUnknown_083C1640
	thumb_func_end sub_80A6EB8

	thumb_func_start sub_80A6FDC
sub_80A6FDC: @ 80A6FDC
	push {lr}
	ldr r0, _080A6FF8 @ =gScriptItemId
	ldrh r0, [r0]
	bl ItemId_GetBattleUsage
	lsls r0, 24
	cmp r0, 0
	beq _080A7008
	ldr r1, _080A6FFC @ =gUnknown_03000704
	ldr r0, _080A7000 @ =gUnknown_083C1708
	str r0, [r1]
	ldr r1, _080A7004 @ =gUnknown_02038564
	movs r0, 0x2
	b _080A7012
	.align 2, 0
_080A6FF8: .4byte gScriptItemId
_080A6FFC: .4byte gUnknown_03000704
_080A7000: .4byte gUnknown_083C1708
_080A7004: .4byte gUnknown_02038564
_080A7008:
	ldr r1, _080A7018 @ =gUnknown_03000704
	ldr r0, _080A701C @ =gUnknown_083C170A
	str r0, [r1]
	ldr r1, _080A7020 @ =gUnknown_02038564
	movs r0, 0x1
_080A7012:
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080A7018: .4byte gUnknown_03000704
_080A701C: .4byte gUnknown_083C170A
_080A7020: .4byte gUnknown_02038564
	thumb_func_end sub_80A6FDC

	thumb_func_start sub_80A7024
sub_80A7024: @ 80A7024
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _080A707C @ =gUnknown_03000700
	movs r0, 0
	strb r0, [r1]
	bl sub_80A6FDC
	ldr r0, _080A7080 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	ldr r3, _080A7084 @ =gUnknown_03005D10
	ldr r2, _080A7088 @ =gUnknown_02038559
	movs r0, 0
	ldrsb r0, [r2, r0]
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0]
	adds r1, r0
	adds r1, 0x1
	strh r1, [r4, 0x1C]
	movs r0, 0
	ldrsb r0, [r2, r0]
	lsls r0, 2
	adds r0, r3
	ldrb r2, [r0]
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80A48E8
	bl sub_80A73FC
	ldr r0, _080A708C @ =gBGTilemapBuffers + 0x800
	bl sub_80A6DF0
	ldr r0, _080A7090 @ =sub_80A6EB8
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A707C: .4byte gUnknown_03000700
_080A7080: .4byte gTasks
_080A7084: .4byte gUnknown_03005D10
_080A7088: .4byte gUnknown_02038559
_080A708C: .4byte gBGTilemapBuffers + 0x800
_080A7090: .4byte sub_80A6EB8
	thumb_func_end sub_80A7024

	thumb_func_start sub_80A7094
sub_80A7094: @ 80A7094
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A70CC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080A70D0 @ =sub_802E424
	lsrs r0, r2, 16
	movs r3, 0
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	ldr r0, _080A70D4 @ =HandleItemMenuPaletteFade
	str r0, [r1]
	movs r0, 0x1
	negs r0, r0
	str r3, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080A70CC: .4byte gTasks
_080A70D0: .4byte sub_802E424
_080A70D4: .4byte HandleItemMenuPaletteFade
	thumb_func_end sub_80A7094

	thumb_func_start sub_80A70D8
sub_80A70D8: @ 80A70D8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_80A7094
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A70D8

	thumb_func_start ItemMenu_UseInBattle
ItemMenu_UseInBattle: @ 80A70F4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080A7120 @ =gScriptItemId
	ldrh r0, [r4]
	bl ItemId_GetBattleFunc
	cmp r0, 0
	beq _080A711A
	movs r0, 0x5
	bl PlaySE
	ldrh r0, [r4]
	bl ItemId_GetBattleFunc
	adds r1, r0, 0
	adds r0, r5, 0
	bl _call_via_r1
_080A711A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7120: .4byte gScriptItemId
	thumb_func_end ItemMenu_UseInBattle

	thumb_func_start sub_80A7124
sub_80A7124: @ 80A7124
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	bl sub_80A7528
	adds r0, r4, 0
	bl sub_80A41D4
	bl ItemListMenu_InitMenu
	adds r0, r4, 0
	bl sub_80A37C0
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A7124

	thumb_func_start sub_80A7150
sub_80A7150: @ 80A7150
	push {r4,r5,lr}
	ldr r4, _080A7158 @ =gUnknown_02038563
	ldr r5, _080A715C @ =gTasks
	b _080A716C
	.align 2, 0
_080A7158: .4byte gUnknown_02038563
_080A715C: .4byte gTasks
_080A7160:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080A7190
_080A716C:
	bl sub_80A317C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A7160
	ldr r0, _080A7198 @ =sub_80A7230
	movs r1, 0
	bl CreateTask
	strb r0, [r4]
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r1, 0
	strh r1, [r0, 0x26]
_080A7190:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7198: .4byte sub_80A7230
	thumb_func_end sub_80A7150

	thumb_func_start PrepareBagForWallyTutorial
PrepareBagForWallyTutorial: @ 80A719C
	push {r4,r5,lr}
	ldr r0, _080A7214 @ =gUnknown_03000700
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080A7218 @ =gUnknown_02038559
	strb r1, [r0]
	movs r1, 0
	ldr r4, _080A721C @ =0x0201e000
	ldr r5, _080A7220 @ =gSaveBlock1 + 0x560
	ldr r3, _080A7224 @ =gUnknown_03005D10
	movs r2, 0
_080A71B2:
	lsls r0, r1, 2
	adds r0, r3
	strb r2, [r0]
	strb r2, [r0, 0x1]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x4
	bls _080A71B2
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x50
	bl memcpy
	movs r1, 0x80
	lsls r1, 5
	adds r0, r4, r1
	adds r4, r5, 0
	adds r4, 0xA0
	adds r1, r4, 0
	movs r2, 0x40
	bl memcpy
	adds r0, r5, 0
	movs r1, 0x14
	bl ClearItemSlots
	adds r0, r4, 0
	movs r1, 0x10
	bl ClearItemSlots
	movs r0, 0xD
	movs r1, 0x1
	bl AddBagItem
	movs r0, 0x4
	movs r1, 0x1
	bl AddBagItem
	ldr r1, _080A7228 @ =gUnknown_03000701
	movs r0, 0x7
	strb r0, [r1]
	ldr r0, _080A722C @ =sub_80A7150
	bl SetMainCallback2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7214: .4byte gUnknown_03000700
_080A7218: .4byte gUnknown_02038559
_080A721C: .4byte 0x0201e000
_080A7220: .4byte gSaveBlock1 + 0x560
_080A7224: .4byte gUnknown_03005D10
_080A7228: .4byte gUnknown_03000701
_080A722C: .4byte sub_80A7150
	thumb_func_end PrepareBagForWallyTutorial

	thumb_func_start sub_80A7230
sub_80A7230: @ 80A7230
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r6, r0, 3
	ldr r0, _080A725C @ =gTasks + 0x8
	mov r8, r0
	adds r7, r6, r0
	movs r0, 0x1E
	ldrsh r1, [r7, r0]
	cmp r1, 0xCC
	beq _080A727A
	cmp r1, 0xCC
	bgt _080A7260
	cmp r1, 0x66
	beq _080A726A
	b _080A7358
	.align 2, 0
_080A725C: .4byte gTasks + 0x8
_080A7260:
	movs r0, 0x99
	lsls r0, 1
	cmp r1, r0
	beq _080A72F4
	b _080A7358
_080A726A:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	movs r1, 0x2
	bl sub_80A4E8C
	b _080A7358
_080A727A:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x2
	bl sub_80F98A4
	movs r0, 0x3
	bl sub_80F98A4
	ldr r1, _080A72D8 @ =gScriptItemId
	movs r0, 0x4
	strh r0, [r1]
	ldr r1, _080A72DC @ =gUnknown_03000704
	ldr r0, _080A72E0 @ =gUnknown_083C1708
	str r0, [r1]
	ldr r1, _080A72E4 @ =gUnknown_02038564
	movs r0, 0x2
	strb r0, [r1]
	mov r0, r8
	adds r4, r0, r6
	ldr r3, _080A72E8 @ =gUnknown_03005D10
	ldr r2, _080A72EC @ =gUnknown_02038559
	movs r0, 0
	ldrsb r0, [r2, r0]
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0]
	adds r1, r0
	adds r1, 0x1
	strh r1, [r4, 0x14]
	movs r0, 0
	ldrsb r0, [r2, r0]
	lsls r0, 2
	adds r0, r3
	ldrb r2, [r0]
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80A48E8
	bl sub_80A73FC
	ldr r0, _080A72F0 @ =gBGTilemapBuffers + 0x800
	bl sub_80A6DF0
	b _080A7358
	.align 2, 0
_080A72D8: .4byte gScriptItemId
_080A72DC: .4byte gUnknown_03000704
_080A72E0: .4byte gUnknown_083C1708
_080A72E4: .4byte gUnknown_02038564
_080A72E8: .4byte gUnknown_03005D10
_080A72EC: .4byte gUnknown_02038559
_080A72F0: .4byte gBGTilemapBuffers + 0x800
_080A72F4:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080A7344 @ =gBGTilemapBuffers + 0x800
	bl sub_80A4DA4
	ldr r4, _080A7348 @ =gSaveBlock1 + 0x560
	ldr r5, _080A734C @ =0x0201e000
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x50
	bl memcpy
	adds r4, 0xA0
	movs r0, 0x80
	lsls r0, 5
	adds r5, r0
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x40
	bl memcpy
	ldr r1, _080A7350 @ =sub_802E424
	lsrs r0, r1, 16
	strh r0, [r7, 0x10]
	strh r1, [r7, 0x12]
	mov r0, r8
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _080A7354 @ =HandleItemMenuPaletteFade
	str r1, [r0]
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _080A735E
	.align 2, 0
_080A7344: .4byte gBGTilemapBuffers + 0x800
_080A7348: .4byte gSaveBlock1 + 0x560
_080A734C: .4byte 0x0201e000
_080A7350: .4byte sub_802E424
_080A7354: .4byte HandleItemMenuPaletteFade
_080A7358:
	ldrh r0, [r7, 0x1E]
	adds r0, 0x1
	strh r0, [r7, 0x1E]
_080A735E:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A7230

	thumb_func_start ItemListMenu_InitMenu
ItemListMenu_InitMenu: @ 80A736C
	push {lr}
	sub sp, 0x8
	ldr r1, _080A73B0 @ =gUnknown_03005D10
	ldr r0, _080A73B4 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r3, [r0, 0x3]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r0]
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	movs r1, 0xE
	movs r2, 0x2
	bl InitMenu
	ldr r1, _080A73B8 @ =0x0000ffff
	ldr r3, _080A73BC @ =0x00002d9f
	movs r0, 0xF
	str r0, [sp]
	movs r0, 0x10
	movs r2, 0xC
	bl CreateBlendedOutlineCursor
	bl sub_80A73C0
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_080A73B0: .4byte gUnknown_03005D10
_080A73B4: .4byte gUnknown_02038559
_080A73B8: .4byte 0x0000ffff
_080A73BC: .4byte 0x00002d9f
	thumb_func_end ItemListMenu_InitMenu

	thumb_func_start sub_80A73C0
sub_80A73C0: @ 80A73C0
	push {lr}
	ldr r1, _080A73E8 @ =gUnknown_03005D10
	ldr r0, _080A73EC @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	lsls r1, 28
	movs r0, 0x80
	lsls r0, 21
	adds r1, r0
	lsrs r1, 24
	movs r0, 0x70
	bl sub_814AD7C
	pop {r0}
	bx r0
	.align 2, 0
_080A73E8: .4byte gUnknown_03005D10
_080A73EC: .4byte gUnknown_02038559
	thumb_func_end sub_80A73C0

	thumb_func_start sub_80A73F0
sub_80A73F0: @ 80A73F0
	push {lr}
	bl sub_814ADC8
	pop {r0}
	bx r0
	thumb_func_end sub_80A73F0

	thumb_func_start sub_80A73FC
sub_80A73FC: @ 80A73FC
	push {lr}
	bl HandleDestroyMenuCursors
	bl sub_814AD44
	pop {r0}
	bx r0
	thumb_func_end sub_80A73FC

	thumb_func_start sub_80A740C
sub_80A740C: @ 80A740C
	push {lr}
	bl sub_80A75E4
	bl sub_80A7768
	bl sub_80A7420
	pop {r0}
	bx r0
	thumb_func_end sub_80A740C

	thumb_func_start sub_80A7420
sub_80A7420: @ 80A7420
	push {r4,lr}
	ldr r4, _080A7438 @ =gUnknown_0203853C
	ldrb r0, [r4]
	cmp r0, 0x2
	beq _080A743C
	cmp r0, 0x3
	beq _080A7430
	b _080A7512
_080A7430:
	movs r0, 0x2
	strb r0, [r4]
	b _080A7512
	.align 2, 0
_080A7438: .4byte gUnknown_0203853C
_080A743C:
	ldrb r0, [r4, 0x2]
	cmp r0, 0x9
	bhi _080A74FC
	lsls r0, 2
	ldr r1, _080A744C @ =_080A7450
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A744C: .4byte _080A7450
	.align 2, 0
_080A7450:
	.4byte _080A7478
	.4byte _080A74AC
	.4byte _080A74B4
	.4byte _080A74BC
	.4byte _080A74C4
	.4byte _080A74CC
	.4byte _080A74D4
	.4byte _080A74DC
	.4byte _080A74E4
	.4byte _080A74F4
_080A7478:
	ldr r1, _080A74A0 @ =gUnknown_03005D10
	ldr r0, _080A74A4 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0]
	adds r1, r0
	ldr r0, _080A74A8 @ =gUnknown_03005D24
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	movs r2, 0
	ldrsh r0, [r1, r2]
	ldrb r1, [r4, 0x1]
	bl ItemListMenu_ChangeDescription
	b _080A74FC
	.align 2, 0
_080A74A0: .4byte gUnknown_03005D10
_080A74A4: .4byte gUnknown_02038559
_080A74A8: .4byte gUnknown_03005D24
_080A74AC:
	ldr r0, _080A74B0 @ =gOtherText_SwitchWhichItem
	b _080A74E6
	.align 2, 0
_080A74B0: .4byte gOtherText_SwitchWhichItem
_080A74B4:
	ldr r0, _080A74B8 @ =gOtherText_WhatWillYouDo2
	b _080A74E6
	.align 2, 0
_080A74B8: .4byte gOtherText_WhatWillYouDo2
_080A74BC:
	ldr r0, _080A74C0 @ =gOtherText_HowManyToToss
	b _080A74E6
	.align 2, 0
_080A74C0: .4byte gOtherText_HowManyToToss
_080A74C4:
	ldr r0, _080A74C8 @ =gOtherText_ThrewAwayItem
	b _080A74E6
	.align 2, 0
_080A74C8: .4byte gOtherText_ThrewAwayItem
_080A74CC:
	ldr r0, _080A74D0 @ =gOtherText_OkayToThrowAwayPrompt
	b _080A74E6
	.align 2, 0
_080A74D0: .4byte gOtherText_OkayToThrowAwayPrompt
_080A74D4:
	ldr r0, _080A74D8 @ =gOtherText_HowManyToDeposit
	b _080A74E6
	.align 2, 0
_080A74D8: .4byte gOtherText_HowManyToDeposit
_080A74DC:
	ldr r0, _080A74E0 @ =gOtherText_DepositedItems
	b _080A74E6
	.align 2, 0
_080A74E0: .4byte gOtherText_DepositedItems
_080A74E4:
	ldr r0, _080A74F0 @ =gOtherText_NoRoomForItems
_080A74E6:
	ldrb r1, [r4, 0x1]
	bl sub_80A4A98
	b _080A74FC
	.align 2, 0
_080A74F0: .4byte gOtherText_NoRoomForItems
_080A74F4:
	ldr r0, _080A7518 @ =gOtherText_CantStoreSomeoneItem
	ldrb r1, [r4, 0x1]
	bl sub_80A4A98
_080A74FC:
	ldrb r0, [r4, 0x1]
	adds r0, 0x1
	strb r0, [r4, 0x1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _080A7512
	movs r0, 0
	strb r0, [r4]
	bl sub_80A7918
_080A7512:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7518: .4byte gOtherText_CantStoreSomeoneItem
	thumb_func_end sub_80A7420

	thumb_func_start sub_80A751C
sub_80A751C: @ 80A751C
	ldr r1, _080A7524 @ =gUnknown_0203853C
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080A7524: .4byte gUnknown_0203853C
	thumb_func_end sub_80A751C

	thumb_func_start sub_80A7528
sub_80A7528: @ 80A7528
	push {r4,lr}
	ldr r4, _080A7544 @ =gUnknown_0203853C
	movs r1, 0
	strb r1, [r4, 0x1]
	strb r0, [r4, 0x2]
	bl sub_80A78F4
	cmp r0, 0x1
	beq _080A755E
	cmp r0, 0x1
	bgt _080A7548
	cmp r0, 0
	beq _080A754E
	b _080A7566
	.align 2, 0
_080A7544: .4byte gUnknown_0203853C
_080A7548:
	cmp r0, 0x2
	beq _080A7562
	b _080A7566
_080A754E:
	movs r0, 0x2
	strb r0, [r4]
_080A7552:
	bl sub_80A7420
	ldrb r0, [r4]
	cmp r0, 0
	bne _080A7552
	b _080A7566
_080A755E:
	movs r0, 0x3
	b _080A7564
_080A7562:
	movs r0, 0x1
_080A7564:
	strb r0, [r4]
_080A7566:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A7528

	thumb_func_start sub_80A756C
sub_80A756C: @ 80A756C
	push {r4,lr}
	ldr r4, _080A758C @ =gUnknown_0203853C
	ldrb r0, [r4]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080A7580
	bl sub_80A7918
_080A7580:
	movs r0, 0
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A758C: .4byte gUnknown_0203853C
	thumb_func_end sub_80A756C

	thumb_func_start sub_80A7590
sub_80A7590: @ 80A7590
	push {lr}
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	bl sub_80A756C
	pop {r0}
	bx r0
	thumb_func_end sub_80A7590

	thumb_func_start sub_80A75A8
sub_80A75A8: @ 80A75A8
	push {lr}
	ldr r1, _080A75C0 @ =gUnknown_0203853C
	ldrb r0, [r1]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080A75BC
	movs r0, 0x1
	strb r0, [r1]
_080A75BC:
	pop {r0}
	bx r0
	.align 2, 0
_080A75C0: .4byte gUnknown_0203853C
	thumb_func_end sub_80A75A8

	thumb_func_start sub_80A75C4
sub_80A75C4: @ 80A75C4
	push {lr}
	ldr r1, _080A75D8 @ =gUnknown_0203853C
	ldrb r0, [r1]
	cmp r0, 0
	beq _080A75DC
	cmp r0, 0x1
	bne _080A75E0
	movs r0, 0x3
	strb r0, [r1]
	b _080A75E0
	.align 2, 0
_080A75D8: .4byte gUnknown_0203853C
_080A75DC:
	bl sub_80A7918
_080A75E0:
	pop {r0}
	bx r0
	thumb_func_end sub_80A75C4

	thumb_func_start sub_80A75E4
sub_80A75E4: @ 80A75E4
	push {r4,r5,lr}
	ldr r4, _080A7628 @ =gUnknown_02038540
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _080A7622
	bl sub_80A7988
	adds r5, r0, 0
	cmp r5, 0
	bne _080A7622
	ldr r0, _080A762C @ =gUnknown_02038563
	ldrb r0, [r0]
	ldrb r2, [r4, 0x1]
	adds r1, r2, 0
	movs r3, 0x1
	bl sub_80A47E8
	ldrb r0, [r4, 0x1]
	adds r0, 0x1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x2]
	movs r1, 0x7
	cmp r0, 0
	beq _080A7616
	movs r1, 0x5
_080A7616:
	ldrb r0, [r4, 0x1]
	cmp r1, r0
	bge _080A7622
	strb r5, [r4]
	bl sub_80A78E8
_080A7622:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7628: .4byte gUnknown_02038540
_080A762C: .4byte gUnknown_02038563
	thumb_func_end sub_80A75E4

	thumb_func_start sub_80A7630
sub_80A7630: @ 80A7630
	ldr r1, _080A7638 @ =gUnknown_02038540
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080A7638: .4byte gUnknown_02038540
	thumb_func_end sub_80A7630

	thumb_func_start sub_80A763C
sub_80A763C: @ 80A763C
	push {r4,lr}
	ldr r4, _080A7650 @ =gUnknown_02038540
	bl sub_80A78C4
	adds r1, r0, 0
	cmp r1, 0
	beq _080A7654
	cmp r1, 0x1
	beq _080A7668
	b _080A7670
	.align 2, 0
_080A7650: .4byte gUnknown_02038540
_080A7654:
	ldr r0, _080A7664 @ =gUnknown_02038563
	ldrb r0, [r0]
	movs r1, 0
	movs r2, 0x7
	bl sub_80A48E8
	b _080A7670
	.align 2, 0
_080A7664: .4byte gUnknown_02038563
_080A7668:
	movs r0, 0
	strb r1, [r4]
	strb r0, [r4, 0x1]
	strb r0, [r4, 0x2]
_080A7670:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A763C

	thumb_func_start sub_80A7678
sub_80A7678: @ 80A7678
	push {r4,lr}
	ldr r4, _080A7690 @ =gUnknown_02038540
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _080A7686
	bl sub_80A78E8
_080A7686:
	movs r0, 0
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7690: .4byte gUnknown_02038540
	thumb_func_end sub_80A7678

	thumb_func_start sub_80A7694
sub_80A7694: @ 80A7694
	ldr r1, _080A769C @ =gUnknown_02038540
	movs r0, 0x1
	strb r0, [r1, 0x2]
	bx lr
	.align 2, 0
_080A769C: .4byte gUnknown_02038540
	thumb_func_end sub_80A7694

	thumb_func_start sub_80A76A0
sub_80A76A0: @ 80A76A0
	push {lr}
	movs r0, 0xE
	movs r1, 0x2
	movs r2, 0x1D
	movs r3, 0x12
	bl MenuZeroFillWindowRect
	bl sub_80A7678
	pop {r0}
	bx r0
	thumb_func_end sub_80A76A0

	thumb_func_start sub_80A76B8
sub_80A76B8: @ 80A76B8
	push {lr}
	ldr r0, _080A76CC @ =gUnknown_02038540
	movs r1, 0
	ldrb r0, [r0]
	cmp r0, 0
	bne _080A76C6
	movs r1, 0x1
_080A76C6:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_080A76CC: .4byte gUnknown_02038540
	thumb_func_end sub_80A76B8

	thumb_func_start sub_80A76D0
sub_80A76D0: @ 80A76D0
	push {lr}
	ldr r0, _080A76E4 @ =gUnknown_02038540
	movs r1, 0
	ldrb r0, [r0, 0x1]
	cmp r0, 0x5
	bls _080A76DE
	movs r1, 0x1
_080A76DE:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_080A76E4: .4byte gUnknown_02038540
	thumb_func_end sub_80A76D0

	thumb_func_start sub_80A76E8
sub_80A76E8: @ 80A76E8
	push {r4,lr}
	ldr r4, _080A7708 @ =gUnknown_02038544
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _080A7702
	ldrb r0, [r4, 0x1]
	ldr r1, [r4, 0x4]
	ldr r2, [r4, 0x8]
	ldrh r3, [r4, 0x2]
	bl DisplayItemMessageOnField
	movs r0, 0
	strb r0, [r4]
_080A7702:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7708: .4byte gUnknown_02038544
	thumb_func_end sub_80A76E8

	thumb_func_start sub_80A770C
sub_80A770C: @ 80A770C
	ldr r1, _080A7714 @ =gUnknown_02038544
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080A7714: .4byte gUnknown_02038544
	thumb_func_end sub_80A770C

	thumb_func_start DisplayCannotUseItemMessage
DisplayCannotUseItemMessage: @ 80A7718
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	adds r7, r1, 0
	mov r8, r2
	adds r6, r3, 0
	ldr r4, _080A7738 @ =gUnknown_02038544
	bl sub_80A7924
	cmp r0, 0
	beq _080A773C
	cmp r0, 0x2
	beq _080A774E
	b _080A775C
	.align 2, 0
_080A7738: .4byte gUnknown_02038544
_080A773C:
	lsls r0, r5, 24
	lsrs r0, 24
	lsls r3, r6, 16
	lsrs r3, 16
	adds r1, r7, 0
	mov r2, r8
	bl DisplayItemMessageOnField
	b _080A775C
_080A774E:
	movs r0, 0x1
	strb r0, [r4]
	strb r5, [r4, 0x1]
	str r7, [r4, 0x4]
	mov r0, r8
	str r0, [r4, 0x8]
	strh r6, [r4, 0x2]
_080A775C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end DisplayCannotUseItemMessage

	thumb_func_start sub_80A7768
sub_80A7768: @ 80A7768
	push {r4,lr}
	ldr r4, _080A77A8 @ =gUnknown_02038550
	ldrb r0, [r4]
	cmp r0, 0x2
	bne _080A7814
	ldrb r1, [r4, 0x1]
	cmp r1, 0
	beq _080A780E
	ldrb r0, [r4, 0x2]
	cmp r0, 0x1
	beq _080A77B4
	ldr r2, _080A77AC @ =gUnknown_083C1640
	ldr r0, _080A77B0 @ =gUnknown_03000704
	ldr r0, [r0]
	adds r0, r1, r0
	subs r0, 0x1
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r2
	ldr r0, [r0]
	subs r1, 0x1
	lsls r1, 1
	adds r1, 0x1
	ldrb r2, [r4, 0x3]
	adds r2, r1
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x7
	bl MenuPrint
	b _080A77FC
	.align 2, 0
_080A77A8: .4byte gUnknown_02038550
_080A77AC: .4byte gUnknown_083C1640
_080A77B0: .4byte gUnknown_03000704
_080A77B4:
	cmp r1, 0x1
	bne _080A77C8
	ldr r0, _080A77C4 @ =gScriptItemId
	ldrh r0, [r0]
	bl sub_80A4B90
	adds r3, r0, 0
	b _080A77DC
	.align 2, 0
_080A77C4: .4byte gScriptItemId
_080A77C8:
	ldr r2, _080A781C @ =gUnknown_083C1640
	ldrb r0, [r4, 0x1]
	ldr r1, _080A7820 @ =gUnknown_03000704
	ldr r1, [r1]
	adds r0, r1
	subs r0, 0x1
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r2
	ldr r3, [r0]
_080A77DC:
	ldrb r2, [r4, 0x1]
	subs r2, 0x1
	asrs r0, r2, 1
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x1
	ands r2, r0
	lsls r2, 1
	adds r2, 0x8
	adds r0, r3, 0
	bl MenuPrint
_080A77FC:
	ldr r1, _080A7824 @ =gUnknown_02038564
	ldrb r0, [r4, 0x1]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080A780E
	movs r0, 0
	strb r0, [r4]
	bl sub_80A7970
_080A780E:
	ldrb r0, [r4, 0x1]
	adds r0, 0x1
	strb r0, [r4, 0x1]
_080A7814:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A781C: .4byte gUnknown_083C1640
_080A7820: .4byte gUnknown_03000704
_080A7824: .4byte gUnknown_02038564
	thumb_func_end sub_80A7768

	thumb_func_start sub_80A7828
sub_80A7828: @ 80A7828
	ldr r1, _080A7830 @ =gUnknown_02038550
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080A7830: .4byte gUnknown_02038550
	thumb_func_end sub_80A7828

	thumb_func_start sub_80A7834
sub_80A7834: @ 80A7834
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r4, _080A784C @ =gUnknown_02038550
	bl sub_80A7958
	cmp r0, 0x1
	beq _080A7850
	cmp r0, 0x2
	beq _080A7856
	b _080A7862
	.align 2, 0
_080A784C: .4byte gUnknown_02038550
_080A7850:
	movs r1, 0
	movs r0, 0x2
	b _080A785A
_080A7856:
	movs r1, 0
	movs r0, 0x1
_080A785A:
	strb r0, [r4]
	strb r1, [r4, 0x1]
	strb r5, [r4, 0x2]
	strb r6, [r4, 0x3]
_080A7862:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A7834

	thumb_func_start sub_80A7868
sub_80A7868: @ 80A7868
	push {lr}
	ldr r1, _080A787C @ =gUnknown_02038550
	ldrb r0, [r1]
	cmp r0, 0x2
	bne _080A7876
	movs r0, 0x1
	strb r0, [r1]
_080A7876:
	pop {r0}
	bx r0
	.align 2, 0
_080A787C: .4byte gUnknown_02038550
	thumb_func_end sub_80A7868

	thumb_func_start sub_80A7880
sub_80A7880: @ 80A7880
	push {lr}
	ldr r1, _080A7894 @ =gUnknown_02038550
	ldrb r0, [r1]
	cmp r0, 0
	beq _080A7898
	cmp r0, 0x1
	bne _080A789C
	movs r0, 0x2
	strb r0, [r1]
	b _080A789C
	.align 2, 0
_080A7894: .4byte gUnknown_02038550
_080A7898:
	bl sub_80A7970
_080A789C:
	pop {r0}
	bx r0
	thumb_func_end sub_80A7880

	thumb_func_start sub_80A78A0
sub_80A78A0: @ 80A78A0
	push {lr}
	ldr r0, _080A78B4 @ =gUnknown_02038550
	movs r1, 0
	ldrb r0, [r0]
	cmp r0, 0
	bne _080A78AE
	movs r1, 0x1
_080A78AE:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_080A78B4: .4byte gUnknown_02038550
	thumb_func_end sub_80A78A0

	thumb_func_start sub_80A78B8
sub_80A78B8: @ 80A78B8
	ldr r1, _080A78C0 @ =gUnknown_02038554
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080A78C0: .4byte gUnknown_02038554
	thumb_func_end sub_80A78B8

	thumb_func_start sub_80A78C4
sub_80A78C4: @ 80A78C4
	push {lr}
	ldr r0, _080A78DC @ =gLinkOpen
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080A78E0
	bl sub_80A7868
	bl sub_80A75A8
	movs r0, 0x1
	b _080A78E2
	.align 2, 0
_080A78DC: .4byte gLinkOpen
_080A78E0:
	movs r0, 0
_080A78E2:
	pop {r1}
	bx r1
	thumb_func_end sub_80A78C4

	thumb_func_start sub_80A78E8
sub_80A78E8: @ 80A78E8
	push {lr}
	bl sub_80A7880
	pop {r0}
	bx r0
	thumb_func_end sub_80A78E8

	thumb_func_start sub_80A78F4
sub_80A78F4: @ 80A78F4
	push {lr}
	ldr r0, _080A790C @ =gLinkOpen
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080A7910
	bl sub_80A76B8
	movs r1, 0x2
	cmp r0, 0
	beq _080A7912
	movs r1, 0x1
	b _080A7912
	.align 2, 0
_080A790C: .4byte gLinkOpen
_080A7910:
	movs r1, 0
_080A7912:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80A78F4

	thumb_func_start sub_80A7918
sub_80A7918: @ 80A7918
	push {lr}
	bl sub_80A76E8
	pop {r0}
	bx r0
	thumb_func_end sub_80A7918

	thumb_func_start sub_80A7924
sub_80A7924: @ 80A7924
	push {lr}
	ldr r0, _080A7948 @ =gLinkOpen
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080A7942
	bl sub_80A76B8
	cmp r0, 0
	bne _080A7942
	bl sub_80A76D0
	cmp r0, 0
	beq _080A794C
	bl sub_80A7678
_080A7942:
	movs r0, 0
	b _080A7952
	.align 2, 0
_080A7948: .4byte gLinkOpen
_080A794C:
	bl sub_80A7694
	movs r0, 0x2
_080A7952:
	pop {r1}
	bx r1
	thumb_func_end sub_80A7924

	thumb_func_start sub_80A7958
sub_80A7958: @ 80A7958
	push {lr}
	bl sub_80A76B8
	cmp r0, 0
	beq _080A796A
	bl sub_80A75A8
	movs r0, 0x1
	b _080A796C
_080A796A:
	movs r0, 0x2
_080A796C:
	pop {r1}
	bx r1
	thumb_func_end sub_80A7958

	thumb_func_start sub_80A7970
sub_80A7970: @ 80A7970
	push {lr}
	bl sub_80A75C4
	pop {r0}
	bx r0
	thumb_func_end sub_80A7970

	thumb_func_start sub_80A797C
sub_80A797C: @ 80A797C
	ldr r1, _080A7984 @ =gUnknown_02038554
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_080A7984: .4byte gUnknown_02038554
	thumb_func_end sub_80A797C

	thumb_func_start sub_80A7988
sub_80A7988: @ 80A7988
	ldr r1, _080A7994 @ =gUnknown_02038554
	ldrb r0, [r1]
	movs r2, 0
	strb r2, [r1]
	bx lr
	.align 2, 0
_080A7994: .4byte gUnknown_02038554
	thumb_func_end sub_80A7988

	thumb_func_start sub_80A7998
sub_80A7998: @ 80A7998
	adds r2, r0, 0
	adds r2, 0x2A
	movs r1, 0
	strb r1, [r2]
	strh r1, [r0, 0x2E]
	strh r1, [r0, 0x30]
	strh r1, [r0, 0x32]
	strh r1, [r0, 0x34]
	strh r1, [r0, 0x36]
	ldr r1, _080A79B0 @ =sub_80A79B4
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080A79B0: .4byte sub_80A79B4
	thumb_func_end sub_80A7998

	thumb_func_start sub_80A79B4
sub_80A79B4: @ 80A79B4
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080A79E4 @ =gUnknown_0203855B
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080A79CC
	adds r0, r4, 0
	bl sub_80A79EC
_080A79CC:
	ldr r0, _080A79E8 @ =gUnknown_0203855C
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _080A79DE
	adds r0, r4, 0
	bl sub_80A7A94
_080A79DE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A79E4: .4byte gUnknown_0203855B
_080A79E8: .4byte gUnknown_0203855C
	thumb_func_end sub_80A79B4

	thumb_func_start sub_80A79EC
sub_80A79EC: @ 80A79EC
	push {r4-r6,lr}
	adds r2, r0, 0
	movs r0, 0x34
	ldrsh r4, [r2, r0]
	cmp r4, 0
	beq _080A79FE
	cmp r4, 0x1
	beq _080A7A54
	b _080A7A8A
_080A79FE:
	ldr r5, _080A7A28 @ =gUnknown_0203855B
	ldrb r6, [r5]
	movs r0, 0
	ldrsb r0, [r5, r0]
	cmp r0, 0x6
	beq _080A7A2C
	adds r3, r2, 0
	adds r3, 0x3F
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	adds r0, r2, 0
	adds r0, 0x2A
	strb r6, [r0]
	movs r1, 0x1
	negs r1, r1
	adds r0, r1, 0
	strb r0, [r5]
	b _080A7A8A
	.align 2, 0
_080A7A28: .4byte gUnknown_0203855B
_080A7A2C:
	adds r3, r2, 0
	adds r3, 0x3F
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	adds r0, r2, 0
	adds r0, 0x2A
	strb r4, [r0]
	ldrh r0, [r2, 0x22]
	subs r0, 0x4
	strh r0, [r2, 0x22]
	movs r0, 0x4
	strh r0, [r2, 0x2E]
	movs r0, 0x1
	strh r0, [r2, 0x34]
	adds r0, r2, 0
	bl sub_80A7AE4
	b _080A7A8A
_080A7A54:
	ldrh r4, [r2, 0x2E]
	movs r0, 0x2E
	ldrsh r3, [r2, r0]
	cmp r3, 0
	beq _080A7A7C
	ldrh r1, [r2, 0x30]
	movs r3, 0x30
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _080A7A72
	ldrh r0, [r2, 0x22]
	adds r0, 0x1
	strh r0, [r2, 0x22]
	subs r0, r4, 0x1
	strh r0, [r2, 0x2E]
_080A7A72:
	adds r0, r1, 0x1
	movs r1, 0x1
	ands r0, r1
	strh r0, [r2, 0x30]
	b _080A7A8A
_080A7A7C:
	ldr r1, _080A7A90 @ =gUnknown_0203855B
	movs r4, 0x1
	negs r4, r4
	adds r0, r4, 0
	strb r0, [r1]
	strh r3, [r2, 0x30]
	strh r3, [r2, 0x34]
_080A7A8A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A7A90: .4byte gUnknown_0203855B
	thumb_func_end sub_80A79EC

	thumb_func_start sub_80A7A94
sub_80A7A94: @ 80A7A94
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080A7AA6
	cmp r0, 0x1
	beq _080A7AC8
	b _080A7ADC
_080A7AA6:
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _080A7AC4 @ =gSpriteAffineAnimTable_83C1CC4
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	movs r0, 0x1
	strh r0, [r4, 0x36]
	b _080A7ADC
	.align 2, 0
_080A7AC4: .4byte gSpriteAffineAnimTable_83C1CC4
_080A7AC8:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	bne _080A7ADC
	adds r0, r4, 0
	bl sub_80A7AE4
_080A7ADC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A7A94

	thumb_func_start sub_80A7AE4
sub_80A7AE4: @ 80A7AE4
	push {lr}
	ldr r2, _080A7B0C @ =gUnknown_0203855C
	movs r1, 0
	strb r1, [r2]
	ldrb r2, [r0, 0x1]
	movs r1, 0x4
	negs r1, r1
	ands r1, r2
	strb r1, [r0, 0x1]
	movs r1, 0
	strh r1, [r0, 0x32]
	strh r1, [r0, 0x36]
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	pop {r0}
	bx r0
	.align 2, 0
_080A7B0C: .4byte gUnknown_0203855C
	thumb_func_end sub_80A7AE4

	thumb_func_start CreateBagSprite
CreateBagSprite: @ 80A7B10
	push {lr}
	ldr r0, _080A7B24 @ =gSpriteTemplate_83C1CE0
	movs r1, 0x3A
	movs r2, 0x28
	movs r3, 0
	bl CreateSprite
	pop {r0}
	bx r0
	.align 2, 0
_080A7B24: .4byte gSpriteTemplate_83C1CE0
	thumb_func_end CreateBagSprite

	thumb_func_start sub_80A7B28
sub_80A7B28: @ 80A7B28
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0
	strh r0, [r4, 0x34]
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl sub_80A7B6C
	ldr r0, _080A7B44 @ =sub_80A7B6C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7B44: .4byte sub_80A7B6C
	thumb_func_end sub_80A7B28

	thumb_func_start sub_80A7B48
sub_80A7B48: @ 80A7B48
	ldrh r2, [r0, 0x38]
	ldrh r1, [r0, 0x2E]
	adds r1, 0x1
	movs r3, 0x1
	ands r1, r3
	subs r2, r1
	adds r1, r0, 0
	adds r1, 0x28
	strb r2, [r1]
	ldrh r2, [r0, 0x3A]
	ldrh r1, [r0, 0x2E]
	adds r1, 0x1
	ands r1, r3
	subs r2, r1
	adds r0, 0x29
	strb r2, [r0]
	bx lr
	thumb_func_end sub_80A7B48

	thumb_func_start sub_80A7B6C
sub_80A7B6C: @ 80A7B6C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x3C
	ldrsh r2, [r4, r0]
	cmp r2, 0
	beq _080A7C16
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080A7B86
	cmp r0, 0x1
	beq _080A7BD4
	b _080A7C16
_080A7B86:
	ldrb r0, [r4, 0x1]
	movs r1, 0x4
	negs r1, r1
	ands r1, r0
	movs r0, 0x1
	orrs r1, r0
	strb r1, [r4, 0x1]
	cmp r2, 0x1
	bne _080A7BA0
	ldr r0, _080A7B9C @ =gSpriteAffineAnimTable_83C1D20
	b _080A7BA2
	.align 2, 0
_080A7B9C: .4byte gSpriteAffineAnimTable_83C1D20
_080A7BA0:
	ldr r0, _080A7BD0 @ =gSpriteAffineAnimTable_83C1D20 + 0x4
_080A7BA2:
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	movs r0, 0x1
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4, 0x3A]
	adds r0, r4, 0
	bl sub_80A7B48
	b _080A7C16
	.align 2, 0
_080A7BD0: .4byte gSpriteAffineAnimTable_83C1D20 + 0x4
_080A7BD4:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl sub_80A7B48
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x20
	bne _080A7C16
	strh r5, [r4, 0x2E]
	strh r5, [r4, 0x34]
	ldrh r1, [r4, 0x38]
	adds r0, r4, 0
	adds r0, 0x28
	strb r1, [r0]
	ldrh r0, [r4, 0x3A]
	adds r1, r4, 0
	adds r1, 0x29
	strb r0, [r1]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _080A7C1C @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_080A7C16:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7C1C: .4byte SpriteCallbackDummy
	thumb_func_end sub_80A7B6C

	thumb_func_start CreateBagPokeballSprite
CreateBagPokeballSprite: @ 80A7C20
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080A7C54 @ =gUnknown_083C1D30
	bl LoadSpritePalette
	ldr r0, _080A7C58 @ =gSpriteTemplate_83C1D38
	movs r1, 0x10
	movs r2, 0x58
	movs r3, 0
	bl CreateSprite
	ldr r1, _080A7C5C @ =gUnknown_02038568
	strb r0, [r1]
	ldr r2, _080A7C60 @ =gSprites
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r4, [r0, 0x3C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7C54: .4byte gUnknown_083C1D30
_080A7C58: .4byte gSpriteTemplate_83C1D38
_080A7C5C: .4byte gUnknown_02038568
_080A7C60: .4byte gSprites
	thumb_func_end CreateBagPokeballSprite

	thumb_func_start sub_80A7C64
sub_80A7C64: @ 80A7C64
	push {r4,r5,lr}
	movs r0, 0x8
	bl FreeSpritePaletteByTag
	ldr r5, _080A7C98 @ =gSprites
	ldr r4, _080A7C9C @ =gUnknown_02038568
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7C98: .4byte gSprites
_080A7C9C: .4byte gUnknown_02038568
	thumb_func_end sub_80A7C64

	thumb_func_start sub_80A7CA0
sub_80A7CA0: @ 80A7CA0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	adds r4, r1, 0
	movs r2, 0x80
	lsls r2, 4
	adds r0, r4, 0
	movs r1, 0
	bl memset
	movs r0, 0x80
	lsls r0, 1
	adds r4, r0
	movs r7, 0
_080A7CBE:
	adds r4, 0x20
	movs r5, 0
	adds r1, r7, 0x1
	mov r8, r1
_080A7CC6:
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0x20
	bl memcpy
	adds r4, 0x20
	adds r6, 0x20
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _080A7CC6
	cmp r7, 0x5
	beq _080A7CE4
	adds r4, 0x20
_080A7CE4:
	mov r1, r8
	lsls r0, r1, 24
	lsrs r7, r0, 24
	cmp r7, 0x5
	bls _080A7CBE
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A7CA0

	thumb_func_start sub_80A7CF8
sub_80A7CF8: @ 80A7CF8
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2A
	bne _080A7D44
	bl IsEnigmaBerryValid
	cmp r0, 0x1
	bne _080A7D44
	ldr r4, _080A7D34 @ =gSaveBlock1 + 0x317C
	ldr r1, _080A7D38 @ =0x02000000
	adds r0, r4, 0
	bl sub_80A7CA0
	movs r0, 0x90
	lsls r0, 3
	adds r4, r0
	str r4, [sp]
	ldr r1, _080A7D3C @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r1
	ldr r1, _080A7D40 @ =0x00007544
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpritePalette
	b _080A7D72
	.align 2, 0
_080A7D34: .4byte gSaveBlock1 + 0x317C
_080A7D38: .4byte 0x02000000
_080A7D3C: .4byte 0xffff0000
_080A7D40: .4byte 0x00007544
_080A7D44:
	ldr r5, _080A7D7C @ =gBerryGraphicsTable
	lsls r4, 3
	adds r0, r5, 0x4
	adds r0, r4, r0
	ldr r0, [r0]
	str r0, [sp]
	mov r1, sp
	ldr r0, _080A7D80 @ =0x00007544
	strh r0, [r1, 0x4]
	mov r0, sp
	bl LoadCompressedObjectPalette
	adds r4, r5
	ldr r0, [r4]
	ldr r4, _080A7D84 @ =0x02001000
	adds r1, r4, 0
	bl sub_800D238
	ldr r0, _080A7D88 @ =0xfffff000
	adds r1, r4, r0
	adds r0, r4, 0
	bl sub_80A7CA0
_080A7D72:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7D7C: .4byte gBerryGraphicsTable
_080A7D80: .4byte 0x00007544
_080A7D84: .4byte 0x02001000
_080A7D88: .4byte 0xfffff000
	thumb_func_end sub_80A7CF8

	thumb_func_start sub_80A7D8C
sub_80A7D8C: @ 80A7D8C
	push {r4,r5,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	bl sub_80A7CF8
	ldr r0, _080A7DC0 @ =gSpriteTemplate_83C1D74
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A7DC0: .4byte gSpriteTemplate_83C1D74
	thumb_func_end sub_80A7D8C

	thumb_func_start sub_80A7DC4
sub_80A7DC4: @ 80A7DC4
	ldr r1, _080A7DD0 @ =gUnknown_030041B4
	ldrh r1, [r1]
	negs r1, r1
	strh r1, [r0, 0x26]
	bx lr
	.align 2, 0
_080A7DD0: .4byte gUnknown_030041B4
	thumb_func_end sub_80A7DC4

	thumb_func_start sub_80A7DD4
sub_80A7DD4: @ 80A7DD4
	push {lr}
	ldr r0, _080A7DE8 @ =0x00007544
	bl FreeSpritePaletteByTag
	movs r0, 0x8
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	.align 2, 0
_080A7DE8: .4byte 0x00007544
	thumb_func_end sub_80A7DD4

	thumb_func_start sub_80A7DEC
sub_80A7DEC: @ 80A7DEC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	mov r8, r3
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _080A7E50 @ =0x00007544
	bl FreeSpritePaletteByTag
	adds r0, r4, 0
	bl sub_80A7CF8
	ldr r0, _080A7E54 @ =gSpriteTemplate_83C1E04
	adds r1, r5, 0
	adds r2, r6, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	adds r4, r1, 0
	mov r0, r8
	cmp r0, 0x1
	bne _080A7E42
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080A7E58 @ =gSprites
	adds r0, r1
	movs r1, 0x1
	bl StartSpriteAffineAnim
_080A7E42:
	adds r0, r4, 0
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080A7E50: .4byte 0x00007544
_080A7E54: .4byte gSpriteTemplate_83C1E04
_080A7E58: .4byte gSprites
	thumb_func_end sub_80A7DEC

	thumb_func_start sub_80A7E5C
sub_80A7E5C: @ 80A7E5C
	push {lr}
	adds r1, r0, 0
	ldr r0, _080A7E78 @ =gSpriteTemplate_83C1F98
	lsls r1, 16
	asrs r1, 16
	movs r2, 0x63
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080A7E78: .4byte gSpriteTemplate_83C1F98
	thumb_func_end sub_80A7E5C

	.align 2, 0 @ Don't pad with nop.
