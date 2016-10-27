	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_80F99CC
sub_80F99CC: @ 80F99CC
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	ldr r0, _080F9A04 @ =sub_80F9A8C
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080F9A08 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	movs r0, 0x2
	strh r0, [r1, 0x8]
	subs r0, 0x3
	str r2, [sp]
	movs r1, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080F9A04: .4byte sub_80F9A8C
_080F9A08: .4byte gTasks
	thumb_func_end sub_80F99CC

	thumb_func_start sub_80F9A0C
sub_80F9A0C: @ 80F9A0C
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	ldr r0, _080F9A44 @ =sub_80F9A8C
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080F9A48 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	movs r0, 0x3
	strh r0, [r1, 0x8]
	subs r0, 0x4
	str r2, [sp]
	movs r1, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080F9A44: .4byte sub_80F9A8C
_080F9A48: .4byte gTasks
	thumb_func_end sub_80F9A0C

	thumb_func_start sub_80F9A4C
sub_80F9A4C: @ 80F9A4C
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	ldr r0, _080F9A84 @ =sub_80F9A8C
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080F9A88 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	movs r0, 0x7
	strh r0, [r1, 0x8]
	subs r0, 0x8
	str r2, [sp]
	movs r1, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080F9A84: .4byte sub_80F9A8C
_080F9A88: .4byte gTasks
	thumb_func_end sub_80F9A4C

	thumb_func_start sub_80F9A8C
sub_80F9A8C: @ 80F9A8C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _080F9AC4 @ =gPaletteFade
	ldrb r1, [r2, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080F9ABE
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r1, _080F9AC8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x8]
	movs r1, 0
	bl OpenPartyMenu
	adds r0, r4, 0
	bl DestroyTask
_080F9ABE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F9AC4: .4byte gPaletteFade
_080F9AC8: .4byte gTasks
	thumb_func_end sub_80F9A8C

	thumb_func_start sub_80F9ACC
sub_80F9ACC: @ 80F9ACC
	push {r4,r5,lr}
	ldr r1, _080F9AEC @ =0x0201b000
	movs r2, 0x99
	lsls r2, 2
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0x7
	bls _080F9AE2
	b _080F9BF6
_080F9AE2:
	lsls r0, 2
	ldr r1, _080F9AF0 @ =_080F9AF4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F9AEC: .4byte 0x0201b000
_080F9AF0: .4byte _080F9AF4
	.align 2, 0
_080F9AF4:
	.4byte _080F9B14
	.4byte _080F9B54
	.4byte _080F9B5A
	.4byte _080F9B6E
	.4byte _080F9B98
	.4byte _080F9B9E
	.4byte _080F9BB0
	.4byte _080F9BC8
_080F9B14:
	ldr r0, _080F9B3C @ =0x00000266
	adds r5, r4, r0
	movs r1, 0
	ldrsh r3, [r5, r1]
	ldr r0, _080F9B40 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r3, r0
	bge _080F9B48
	movs r2, 0x98
	lsls r2, 2
	adds r0, r4, r2
	ldrb r0, [r0]
	ldrb r1, [r5]
	movs r2, 0x64
	muls r2, r3
	ldr r3, _080F9B44 @ =gPlayerParty
	adds r2, r3
	bl sub_806D90C
	b _080F9BF0
	.align 2, 0
_080F9B3C: .4byte 0x00000266
_080F9B40: .4byte gPlayerPartyCount
_080F9B44: .4byte gPlayerParty
_080F9B48:
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r4, r0
	b _080F9BBC
_080F9B54:
	bl sub_806DA98
	b _080F9BB4
_080F9B5A:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_806DC34
	movs r2, 0x99
	lsls r2, 2
	adds r1, r4, r2
	b _080F9BBC
_080F9B6E:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	ldr r2, _080F9B94 @ =0x00000266
	adds r5, r4, r2
	ldrb r1, [r5]
	bl sub_806BD58
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080F9BF0
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r4, r0
	b _080F9BBC
	.align 2, 0
_080F9B94: .4byte 0x00000266
_080F9B98:
	bl sub_806E334
	b _080F9BB4
_080F9B9E:
	bl sub_806E0C4
	ldr r1, _080F9BAC @ =0x0201b000
	movs r0, 0x99
	lsls r0, 2
	adds r1, r0
	b _080F9BBC
	.align 2, 0
_080F9BAC: .4byte 0x0201b000
_080F9BB0:
	bl sub_80F9C00
_080F9BB4:
	ldr r1, _080F9BC4 @ =0x0201b000
	movs r2, 0x99
	lsls r2, 2
	adds r1, r2
_080F9BBC:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080F9BF6
	.align 2, 0
_080F9BC4: .4byte 0x0201b000
_080F9BC8:
	ldr r0, _080F9BEC @ =0x00000266
	adds r5, r4, r0
	ldrb r0, [r5]
	bl sub_806B58C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080F9BF0
	movs r1, 0
	strh r1, [r5]
	movs r2, 0x99
	lsls r2, 2
	adds r0, r4, r2
	strh r1, [r0]
	movs r0, 0x1
	b _080F9BF8
	.align 2, 0
_080F9BEC: .4byte 0x00000266
_080F9BF0:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_080F9BF6:
	movs r0, 0
_080F9BF8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80F9ACC

	thumb_func_start sub_80F9C00
sub_80F9C00: @ 80F9C00
	push {r4,lr}
	movs r4, 0
	b _080F9C58
_080F9C06:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _080F9C24 @ =gPlayerParty
	adds r0, r1
	bl sub_80AE47C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080F9C52
	lsls r0, 2
	ldr r1, _080F9C28 @ =_080F9C2C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F9C24: .4byte gPlayerParty
_080F9C28: .4byte _080F9C2C
	.align 2, 0
_080F9C2C:
	.4byte _080F9C40
	.4byte _080F9C4A
	.4byte _080F9C4A
	.4byte _080F9C40
	.4byte _080F9C40
_080F9C40:
	adds r0, r4, 0
	movs r1, 0x7E
	bl sub_806BC3C
	b _080F9C52
_080F9C4A:
	adds r0, r4, 0
	movs r1, 0x70
	bl sub_806BC3C
_080F9C52:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080F9C58:
	ldr r0, _080F9C68 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r4, r0
	bcc _080F9C06
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F9C68: .4byte gPlayerPartyCount
	thumb_func_end sub_80F9C00

	thumb_func_start sub_80F9C6C
sub_80F9C6C: @ 80F9C6C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080F9C94 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080F9CD8
	adds r0, r4, 0
	bl sub_806BD80
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _080F9C98
	cmp r0, 0x2
	beq _080F9CC0
	b _080F9CD8
	.align 2, 0
_080F9C94: .4byte gPaletteFade
_080F9C98:
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_806CA38
	ldr r1, _080F9CB8 @ =gUnknown_02038694
	strb r0, [r1]
	ldr r2, _080F9CBC @ =gUnknown_0202E8CC
	ldrb r0, [r1]
	strh r0, [r2]
	adds r0, r4, 0
	bl sub_8123138
	b _080F9CD8
	.align 2, 0
_080F9CB8: .4byte gUnknown_02038694
_080F9CBC: .4byte gUnknown_0202E8CC
_080F9CC0:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080F9CE0 @ =gUnknown_02038694
	movs r0, 0xFF
	strb r0, [r1]
	ldr r1, _080F9CE4 @ =gUnknown_0202E8CC
	movs r0, 0xFF
	strh r0, [r1]
	adds r0, r4, 0
	bl sub_8123138
_080F9CD8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F9CE0: .4byte gUnknown_02038694
_080F9CE4: .4byte gUnknown_0202E8CC
	thumb_func_end sub_80F9C6C

	thumb_func_start sub_80F9CE8
sub_80F9CE8: @ 80F9CE8
	push {r4,r5,lr}
	ldr r1, _080F9D08 @ =0x0201b000
	movs r2, 0x99
	lsls r2, 2
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0x7
	bls _080F9CFE
	b _080F9E12
_080F9CFE:
	lsls r0, 2
	ldr r1, _080F9D0C @ =_080F9D10
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F9D08: .4byte 0x0201b000
_080F9D0C: .4byte _080F9D10
	.align 2, 0
_080F9D10:
	.4byte _080F9D30
	.4byte _080F9D70
	.4byte _080F9D76
	.4byte _080F9D8A
	.4byte _080F9DB4
	.4byte _080F9DBA
	.4byte _080F9DCC
	.4byte _080F9DE4
_080F9D30:
	ldr r0, _080F9D58 @ =0x00000266
	adds r5, r4, r0
	movs r1, 0
	ldrsh r3, [r5, r1]
	ldr r0, _080F9D5C @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r3, r0
	bge _080F9D64
	movs r2, 0x98
	lsls r2, 2
	adds r0, r4, r2
	ldrb r0, [r0]
	ldrb r1, [r5]
	movs r2, 0x64
	muls r2, r3
	ldr r3, _080F9D60 @ =gPlayerParty
	adds r2, r3
	bl sub_806D90C
	b _080F9E0C
	.align 2, 0
_080F9D58: .4byte 0x00000266
_080F9D5C: .4byte gPlayerPartyCount
_080F9D60: .4byte gPlayerParty
_080F9D64:
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r4, r0
	b _080F9DD8
_080F9D70:
	bl sub_806DA98
	b _080F9DD0
_080F9D76:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_806DC34
	movs r2, 0x99
	lsls r2, 2
	adds r1, r4, r2
	b _080F9DD8
_080F9D8A:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	ldr r2, _080F9DB0 @ =0x00000266
	adds r5, r4, r2
	ldrb r1, [r5]
	bl sub_806BD58
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080F9E0C
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r4, r0
	b _080F9DD8
	.align 2, 0
_080F9DB0: .4byte 0x00000266
_080F9DB4:
	bl sub_806E334
	b _080F9DD0
_080F9DBA:
	bl sub_806E0C4
	ldr r1, _080F9DC8 @ =0x0201b000
	movs r0, 0x99
	lsls r0, 2
	adds r1, r0
	b _080F9DD8
	.align 2, 0
_080F9DC8: .4byte 0x0201b000
_080F9DCC:
	bl sub_80F9E1C
_080F9DD0:
	ldr r1, _080F9DE0 @ =0x0201b000
	movs r2, 0x99
	lsls r2, 2
	adds r1, r2
_080F9DD8:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080F9E12
	.align 2, 0
_080F9DE0: .4byte 0x0201b000
_080F9DE4:
	ldr r0, _080F9E08 @ =0x00000266
	adds r5, r4, r0
	ldrb r0, [r5]
	bl sub_806B58C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080F9E0C
	movs r1, 0
	strh r1, [r5]
	movs r2, 0x99
	lsls r2, 2
	adds r0, r4, r2
	strh r1, [r0]
	movs r0, 0x1
	b _080F9E14
	.align 2, 0
_080F9E08: .4byte 0x00000266
_080F9E0C:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_080F9E12:
	movs r0, 0
_080F9E14:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80F9CE8

	thumb_func_start sub_80F9E1C
sub_80F9E1C: @ 80F9E1C
	push {r4,lr}
	movs r4, 0
	b _080F9E52
_080F9E22:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _080F9E40 @ =gPlayerParty
	adds r0, r1
	bl sub_8040574
	lsls r0, 24
	cmp r0, 0
	bne _080F9E44
	adds r0, r4, 0
	movs r1, 0x9A
	bl sub_806BC3C
	b _080F9E4C
	.align 2, 0
_080F9E40: .4byte gPlayerParty
_080F9E44:
	adds r0, r4, 0
	movs r1, 0x8C
	bl sub_806BC3C
_080F9E4C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080F9E52:
	ldr r0, _080F9E60 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r4, r0
	bcc _080F9E22
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F9E60: .4byte gPlayerPartyCount
	thumb_func_end sub_80F9E1C

	thumb_func_start sub_80F9E64
sub_80F9E64: @ 80F9E64
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080F9E8C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080F9EE2
	adds r0, r6, 0
	bl sub_806BD80
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _080F9E90
	cmp r0, 0x2
	beq _080F9ED0
	b _080F9EE2
	.align 2, 0
_080F9E8C: .4byte gPaletteFade
_080F9E90:
	movs r0, 0x5
	bl PlaySE
	ldr r4, _080F9EC4 @ =gUnknown_0202E8CC
	adds r0, r6, 0
	bl sub_806CA38
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	ldr r5, _080F9EC8 @ =gUnknown_0202E8CE
	ldrh r1, [r4]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080F9ECC @ =gPlayerParty
	adds r0, r1
	bl sub_8040574
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	adds r0, r6, 0
	bl sub_8123138
	b _080F9EE2
	.align 2, 0
_080F9EC4: .4byte gUnknown_0202E8CC
_080F9EC8: .4byte gUnknown_0202E8CE
_080F9ECC: .4byte gPlayerParty
_080F9ED0:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080F9EE8 @ =gUnknown_0202E8CC
	movs r0, 0xFF
	strh r0, [r1]
	adds r0, r6, 0
	bl sub_8123138
_080F9EE2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F9EE8: .4byte gUnknown_0202E8CC
	thumb_func_end sub_80F9E64

	thumb_func_start sub_80F9EEC
sub_80F9EEC: @ 80F9EEC
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _080F9F20 @ =gPlayerParty
	ldr r1, _080F9F24 @ =gUnknown_0202E8CC
	ldrb r1, [r1]
	ldr r2, _080F9F28 @ =gPlayerPartyCount
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _080F9F2C @ =c2_exit_to_overworld_2_switch
	movs r4, 0
	str r4, [sp]
	bl sub_809D9F0
	ldr r1, _080F9F30 @ =0x02018000
	movs r0, 0x3
	strb r0, [r1, 0x8]
	ldr r1, _080F9F34 @ =gUnknown_0300485C
	ldr r0, _080F9F38 @ =sub_8080990
	str r0, [r1]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F9F20: .4byte gPlayerParty
_080F9F24: .4byte gUnknown_0202E8CC
_080F9F28: .4byte gPlayerPartyCount
_080F9F2C: .4byte c2_exit_to_overworld_2_switch
_080F9F30: .4byte 0x02018000
_080F9F34: .4byte gUnknown_0300485C
_080F9F38: .4byte sub_8080990
	thumb_func_end sub_80F9EEC

	thumb_func_start sub_80F9F3C
sub_80F9F3C: @ 80F9F3C
	push {r4,r5,lr}
	ldr r1, _080F9F78 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	movs r4, 0
	adds r5, r1, 0
_080F9F48:
	ldr r0, _080F9F7C @ =gUnknown_0202E8CC
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080F9F80 @ =gPlayerParty
	adds r0, r1
	adds r1, r4, 0
	adds r1, 0xD
	bl GetMonData
	cmp r0, 0
	beq _080F9F66
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_080F9F66:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080F9F48
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F9F78: .4byte gScriptResult
_080F9F7C: .4byte gUnknown_0202E8CC
_080F9F80: .4byte gPlayerParty
	thumb_func_end sub_80F9F3C

	thumb_func_start sub_80F9F84
sub_80F9F84: @ 80F9F84
	push {r4,r5,lr}
	ldr r0, _080F9FC4 @ =gUnknown_0202E8CC
	ldrh r1, [r0]
	movs r0, 0x64
	adds r5, r1, 0
	muls r5, r0
	ldr r0, _080F9FC8 @ =gPlayerParty
	adds r5, r0
	ldr r0, _080F9FCC @ =gUnknown_0202E8CE
	ldrh r1, [r0]
	adds r1, 0xD
	adds r0, r5, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r1, _080F9FD0 @ =gStringVar1
	adds r0, r5, 0
	bl GetMonNickname
	ldr r0, _080F9FD4 @ =gStringVar2
	movs r1, 0xD
	muls r1, r4
	ldr r2, _080F9FD8 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F9FC4: .4byte gUnknown_0202E8CC
_080F9FC8: .4byte gPlayerParty
_080F9FCC: .4byte gUnknown_0202E8CE
_080F9FD0: .4byte gStringVar1
_080F9FD4: .4byte gStringVar2
_080F9FD8: .4byte gMoveNames
	thumb_func_end sub_80F9F84

	thumb_func_start sub_80F9FDC
sub_80F9FDC: @ 80F9FDC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	mov r8, r0
	adds r5, r1, 0
	adds r4, r2, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	adds r0, 0xD
	str r0, [sp, 0x8]
	mov r0, r8
	ldr r1, [sp, 0x8]
	bl GetMonData
	mov r1, sp
	adds r1, 0x2
	str r1, [sp, 0x14]
	strh r0, [r1]
	adds r3, r4, 0
	adds r3, 0xD
	str r3, [sp, 0xC]
	mov r0, r8
	adds r1, r3, 0
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	adds r7, r5, 0
	adds r7, 0x11
	str r7, [sp, 0x10]
	mov r0, r8
	adds r1, r7, 0
	bl GetMonData
	mov r1, sp
	adds r1, 0x5
	str r1, [sp, 0x18]
	strb r0, [r1]
	adds r3, r4, 0
	adds r3, 0x11
	str r3, [sp, 0x1C]
	mov r0, r8
	adds r1, r3, 0
	bl GetMonData
	add r7, sp, 0x4
	mov r10, r7
	strb r0, [r7]
	mov r0, r8
	movs r1, 0x15
	bl GetMonData
	mov r6, sp
	adds r6, 0x6
	strb r0, [r6]
	ldr r1, _080FA0D8 @ =gUnknown_08208238
	adds r0, r5, r1
	ldrb r0, [r0]
	mov r9, r0
	ldrb r0, [r6]
	adds r2, r0, 0
	mov r3, r9
	ands r2, r3
	lsls r5, 1
	asrs r2, r5
	lsls r2, 24
	lsrs r2, 24
	adds r1, r4, r1
	ldrb r3, [r1]
	adds r1, r0, 0
	ands r1, r3
	lsls r4, 1
	asrs r1, r4
	lsls r1, 24
	lsrs r1, 24
	mov r7, r9
	bics r0, r7
	strb r0, [r6]
	ldrb r0, [r6]
	bics r0, r3
	strb r0, [r6]
	lsls r2, r4
	lsls r1, r5
	adds r2, r1
	ldrb r0, [r6]
	orrs r0, r2
	strb r0, [r6]
	mov r0, r8
	ldr r1, [sp, 0x8]
	mov r2, sp
	bl SetMonData
	mov r0, r8
	ldr r1, [sp, 0xC]
	ldr r2, [sp, 0x14]
	bl SetMonData
	mov r0, r8
	ldr r1, [sp, 0x10]
	mov r2, r10
	bl SetMonData
	mov r0, r8
	ldr r1, [sp, 0x1C]
	ldr r2, [sp, 0x18]
	bl SetMonData
	mov r0, r8
	movs r1, 0x15
	adds r2, r6, 0
	bl SetMonData
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FA0D8: .4byte gUnknown_08208238
	thumb_func_end sub_80F9FDC

	thumb_func_start sub_80FA0DC
sub_80FA0DC: @ 80FA0DC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r0, _080FA13C @ =gUnknown_0202E8CC
	mov r8, r0
	ldrh r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _080FA140 @ =gPlayerParty
	adds r0, r5
	ldr r4, _080FA144 @ =gUnknown_0202E8CE
	ldrb r2, [r4]
	movs r1, 0
	bl SetMonMoveSlot
	mov r1, r8
	ldrh r0, [r1]
	muls r0, r6
	adds r0, r5
	ldrb r1, [r4]
	bl RemoveMonPPBonus
	ldrh r4, [r4]
	cmp r4, 0x2
	bhi _080FA130
_080FA10E:
	ldr r0, _080FA13C @ =gUnknown_0202E8CC
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080FA140 @ =gPlayerParty
	adds r0, r1
	lsls r1, r4, 24
	lsrs r1, 24
	adds r4, 0x1
	lsls r2, r4, 24
	lsrs r2, 24
	bl sub_80F9FDC
	lsls r4, 16
	lsrs r4, 16
	cmp r4, 0x2
	bls _080FA10E
_080FA130:
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FA13C: .4byte gUnknown_0202E8CC
_080FA140: .4byte gPlayerParty
_080FA144: .4byte gUnknown_0202E8CE
	thumb_func_end sub_80FA0DC

	thumb_func_start sub_80FA148
sub_80FA148: @ 80FA148
	push {r4,lr}
	ldr r0, _080FA170 @ =gUnknown_0202E8CC
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080FA174 @ =gPlayerParty
	adds r0, r1
	ldr r4, _080FA178 @ =gScriptResult
	movs r1, 0
	strh r1, [r4]
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _080FA16A
	movs r0, 0x1
	strh r0, [r4]
_080FA16A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FA170: .4byte gUnknown_0202E8CC
_080FA174: .4byte gPlayerParty
_080FA178: .4byte gScriptResult
	thumb_func_end sub_80FA148

	.align 2, 0 @ Don't pad with nop.
