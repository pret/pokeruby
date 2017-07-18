	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start BufferStringBattle
BufferStringBattle: @ 8120AA8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r7, r0, 16
	movs r6, 0
	ldr r5, _08120B70 @ =gSelectedOrderFromParty
	ldr r4, _08120B74 @ =gActiveBank
	ldrb r1, [r4]
	lsls r1, 9
	ldr r0, _08120B78 @ =gUnknown_02023A64
	adds r1, r0
	str r1, [r5]
	ldr r2, _08120B7C @ =gLastUsedItem
	ldrh r0, [r1, 0x4]
	strh r0, [r2]
	ldr r2, _08120B80 @ =gLastUsedAbility
	ldrb r0, [r1, 0x6]
	strb r0, [r2]
	ldr r3, _08120B84 @ =0x02000000
	ldrb r0, [r1, 0x7]
	mov r8, r0
	ldr r2, _08120B88 @ =0x00016003
	adds r0, r3, r2
	mov r2, r8
	strb r2, [r0]
	ldrb r0, [r1, 0x8]
	mov r8, r0
	ldr r2, _08120B8C @ =0x0001605e
	adds r0, r3, r2
	mov r2, r8
	strb r2, [r0]
	ldrb r0, [r1, 0x9]
	mov r8, r0
	ldr r2, _08120B90 @ =0x000160c1
	adds r0, r3, r2
	mov r2, r8
	strb r2, [r0]
	ldr r2, _08120B94 @ =gStringBank
	ldrb r0, [r1, 0xA]
	strb r0, [r2]
	ldrb r1, [r1, 0xB]
	ldr r2, _08120B98 @ =0x000160a0
	adds r0, r3, r2
	strb r1, [r0]
	movs r2, 0
	mov r9, r3
	ldr r3, _08120B9C @ =gBattleTextBuff1
	mov r10, r3
	ldr r3, _08120BA0 @ =gAbilitiesPerBank
_08120B10:
	adds r0, r2, r3
	ldr r1, [r5]
	adds r1, 0xC
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x3
	ble _08120B10
	movs r2, 0
	ldr r0, _08120B9C @ =gBattleTextBuff1
	mov r8, r0
	ldr r3, _08120B70 @ =gSelectedOrderFromParty
	ldr r1, _08120BA4 @ =gBattleTextBuff2
	mov r12, r1
	ldr r5, _08120BA8 @ =gBattleTextBuff3
_08120B30:
	mov r0, r8
	adds r1, r2, r0
	ldr r0, [r3]
	adds r0, 0x10
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	mov r0, r12
	adds r1, r2, r0
	ldr r0, [r3]
	adds r0, 0x20
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r2, r5
	ldr r0, [r3]
	adds r0, 0x30
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, 0x1
	cmp r2, 0xF
	ble _08120B30
	cmp r7, 0x5
	bls _08120B64
	b _08120F50
_08120B64:
	lsls r0, r7, 2
	ldr r1, _08120BAC @ =_08120BB0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08120B70: .4byte gSelectedOrderFromParty
_08120B74: .4byte gActiveBank
_08120B78: .4byte gUnknown_02023A64
_08120B7C: .4byte gLastUsedItem
_08120B80: .4byte gLastUsedAbility
_08120B84: .4byte 0x02000000
_08120B88: .4byte 0x00016003
_08120B8C: .4byte 0x0001605e
_08120B90: .4byte 0x000160c1
_08120B94: .4byte gStringBank
_08120B98: .4byte 0x000160a0
_08120B9C: .4byte gBattleTextBuff1
_08120BA0: .4byte gAbilitiesPerBank
_08120BA4: .4byte gBattleTextBuff2
_08120BA8: .4byte gBattleTextBuff3
_08120BAC: .4byte _08120BB0
	.align 2, 0
_08120BB0:
	.4byte _08120BC8
	.4byte _08120C40
	.4byte _08120CCC
	.4byte _08120D5C
	.4byte _08120DE8
	.4byte _08120E50
_08120BC8:
	ldr r0, _08120BEC @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08120C00
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08120BF8
	movs r0, 0x40
	ands r0, r1
	ldr r6, _08120BF0 @ =gUnknown_084005C7
	cmp r0, 0
	bne _08120BE8
	b _08120F70
_08120BE8:
	ldr r6, _08120BF4 @ =gUnknown_084005DB
	b _08120F70
	.align 2, 0
_08120BEC: .4byte gBattleTypeFlags
_08120BF0: .4byte gUnknown_084005C7
_08120BF4: .4byte gUnknown_084005DB
_08120BF8:
	ldr r6, _08120BFC @ =gUnknown_084005AA
	b _08120F70
	.align 2, 0
_08120BFC: .4byte gUnknown_084005AA
_08120C00:
	movs r0, 0x80
	lsls r0, 6
	ands r0, r1
	cmp r0, 0
	beq _08120C14
	ldr r6, _08120C10 @ =gUnknown_08400568
	b _08120F70
	.align 2, 0
_08120C10: .4byte gUnknown_08400568
_08120C14:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08120C24
	ldr r6, _08120C20 @ =gUnknown_08400590
	b _08120F70
	.align 2, 0
_08120C20: .4byte gUnknown_08400590
_08120C24:
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	ldr r6, _08120C38 @ =gUnknown_08400555
	cmp r0, 0
	bne _08120C32
	b _08120F70
_08120C32:
	ldr r6, _08120C3C @ =gUnknown_0840057B
	b _08120F70
	.align 2, 0
_08120C38: .4byte gUnknown_08400555
_08120C3C: .4byte gUnknown_0840057B
_08120C40:
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _08120C7C
	ldr r0, _08120C68 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08120C74
	movs r0, 0x40
	ands r0, r1
	ldr r6, _08120C6C @ =gUnknown_084006A4
	cmp r0, 0
	bne _08120C64
	b _08120F70
_08120C64:
	ldr r6, _08120C70 @ =gUnknown_084006F1
	b _08120F70
	.align 2, 0
_08120C68: .4byte gBattleTypeFlags
_08120C6C: .4byte gUnknown_084006A4
_08120C70: .4byte gUnknown_084006F1
_08120C74:
	ldr r6, _08120C78 @ =gUnknown_0840069C
	b _08120F70
	.align 2, 0
_08120C78: .4byte gUnknown_0840069C
_08120C7C:
	ldr r0, _08120C94 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08120CB4
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08120C9C
	ldr r6, _08120C98 @ =gUnknown_0840065C
	b _08120F70
	.align 2, 0
_08120C94: .4byte gBattleTypeFlags
_08120C98: .4byte gUnknown_0840065C
_08120C9C:
	movs r0, 0x2
	ands r0, r1
	ldr r6, _08120CAC @ =gUnknown_08400608
	cmp r0, 0
	bne _08120CA8
	b _08120F70
_08120CA8:
	ldr r6, _08120CB0 @ =gUnknown_08400645
	b _08120F70
	.align 2, 0
_08120CAC: .4byte gUnknown_08400608
_08120CB0: .4byte gUnknown_08400645
_08120CB4:
	movs r0, 0x2
	ands r0, r1
	ldr r6, _08120CC4 @ =gUnknown_084005F5
	cmp r0, 0
	bne _08120CC0
	b _08120F70
_08120CC0:
	ldr r6, _08120CC8 @ =gUnknown_08400635
	b _08120F70
	.align 2, 0
_08120CC4: .4byte gUnknown_084005F5
_08120CC8: .4byte gUnknown_08400635
_08120CCC:
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _08120D24
	ldr r0, _08120CE8 @ =0x02000000
	ldr r1, _08120CEC @ =0x000160c1
	adds r0, r1
	ldrb r2, [r0]
	cmp r2, 0
	bne _08120CF4
	ldr r6, _08120CF0 @ =gUnknown_08400709
	b _08120F70
	.align 2, 0
_08120CE8: .4byte 0x02000000
_08120CEC: .4byte 0x000160c1
_08120CF0: .4byte gUnknown_08400709
_08120CF4:
	cmp r2, 0x1
	beq _08120D04
	ldr r0, _08120D08 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08120D10
_08120D04:
	ldr r6, _08120D0C @ =gUnknown_08400727
	b _08120F70
	.align 2, 0
_08120D08: .4byte gBattleTypeFlags
_08120D0C: .4byte gUnknown_08400727
_08120D10:
	ldr r6, _08120D1C @ =gUnknown_08400749
	cmp r2, 0x2
	beq _08120D18
	b _08120F70
_08120D18:
	ldr r6, _08120D20 @ =gUnknown_08400736
	b _08120F70
	.align 2, 0
_08120D1C: .4byte gUnknown_08400749
_08120D20: .4byte gUnknown_08400736
_08120D24:
	ldr r0, _08120D44 @ =gTrainerBattleOpponent
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 4
	cmp r1, r0
	bne _08120D54
	ldr r0, _08120D48 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	ldr r6, _08120D4C @ =gUnknown_08400771
	cmp r0, 0
	bne _08120D40
	b _08120F70
_08120D40:
	ldr r6, _08120D50 @ =gUnknown_08400781
	b _08120F70
	.align 2, 0
_08120D44: .4byte gTrainerBattleOpponent
_08120D48: .4byte gBattleTypeFlags
_08120D4C: .4byte gUnknown_08400771
_08120D50: .4byte gUnknown_08400781
_08120D54:
	ldr r6, _08120D58 @ =gUnknown_0840075E
	b _08120F70
	.align 2, 0
_08120D58: .4byte gUnknown_0840075E
_08120D5C:
	ldr r0, _08120D88 @ =0x00016003
	add r0, r9
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _08120DB8
	ldr r0, _08120D8C @ =0x000160c1
	add r0, r9
	ldrb r3, [r0]
	cmp r3, 0
	beq _08120D82
	ldr r0, _08120D90 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08120D98
_08120D82:
	ldr r6, _08120D94 @ =gUnknown_084006B3
	b _08120F70
	.align 2, 0
_08120D88: .4byte 0x00016003
_08120D8C: .4byte 0x000160c1
_08120D90: .4byte gBattleTypeFlags
_08120D94: .4byte gUnknown_084006B3
_08120D98:
	cmp r3, 0x1
	bne _08120DA4
	ldr r6, _08120DA0 @ =gUnknown_084006BB
	b _08120F70
	.align 2, 0
_08120DA0: .4byte gUnknown_084006BB
_08120DA4:
	ldr r6, _08120DB0 @ =gUnknown_084006D5
	cmp r3, 0x2
	beq _08120DAC
	b _08120F70
_08120DAC:
	ldr r6, _08120DB4 @ =gUnknown_084006C6
	b _08120F70
	.align 2, 0
_08120DB0: .4byte gUnknown_084006D5
_08120DB4: .4byte gUnknown_084006C6
_08120DB8:
	ldr r0, _08120DD4 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08120DE0
	movs r0, 0x40
	ands r0, r1
	ldr r6, _08120DD8 @ =gUnknown_0840067C
	cmp r0, 0
	bne _08120DD0
	b _08120F70
_08120DD0:
	ldr r6, _08120DDC @ =gUnknown_0840068C
	b _08120F70
	.align 2, 0
_08120DD4: .4byte gBattleTypeFlags
_08120DD8: .4byte gUnknown_0840067C
_08120DDC: .4byte gUnknown_0840068C
_08120DE0:
	ldr r6, _08120DE4 @ =gUnknown_08400622
	b _08120F70
	.align 2, 0
_08120DE4: .4byte gUnknown_08400622
_08120DE8:
	mov r0, r10
	bl sub_8121D1C
	ldr r0, _08120E14 @ =gSelectedOrderFromParty
	ldr r2, [r0]
	ldrh r1, [r2]
	movs r0, 0xB1
	lsls r0, 1
	cmp r1, r0
	bls _08120E28
	ldr r0, _08120E18 @ =gBattleTextBuff2
	ldr r2, _08120E1C @ =gUnknown_08401674
	ldr r1, _08120E20 @ =0x02000000
	ldr r3, _08120E24 @ =0x000160a0
	adds r1, r3
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	b _08120E38
	.align 2, 0
_08120E14: .4byte gSelectedOrderFromParty
_08120E18: .4byte gBattleTextBuff2
_08120E1C: .4byte gUnknown_08401674
_08120E20: .4byte 0x02000000
_08120E24: .4byte 0x000160a0
_08120E28:
	ldr r0, _08120E44 @ =gBattleTextBuff2
	ldrh r2, [r2]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _08120E48 @ =gMoveNames
	adds r1, r2
	bl StringCopy
_08120E38:
	ldr r0, _08120E44 @ =gBattleTextBuff2
	bl sub_8121D74
	ldr r6, _08120E4C @ =gUnknown_084007BD
	b _08120F70
	.align 2, 0
_08120E44: .4byte gBattleTextBuff2
_08120E48: .4byte gMoveNames
_08120E4C: .4byte gUnknown_084007BD
_08120E50:
	ldr r5, _08120E90 @ =gBattleTextBuff1
	ldrb r1, [r5]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08120EB8
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r5]
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08120E7C
	ldrb r1, [r5]
	cmp r1, 0x3
	beq _08120E7C
	movs r0, 0x3
	eors r0, r1
	strb r0, [r5]
_08120E7C:
	ldr r0, _08120E90 @ =gBattleTextBuff1
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08120E98
	ldr r6, _08120E94 @ =gUnknown_083FFEFC
	b _08120F70
	.align 2, 0
_08120E90: .4byte gBattleTextBuff1
_08120E94: .4byte gUnknown_083FFEFC
_08120E98:
	ldr r0, _08120EAC @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	ldr r6, _08120EB0 @ =gUnknown_083FFFEA
	cmp r0, 0
	beq _08120F70
	ldr r6, _08120EB4 @ =gUnknown_083FFFF7
	b _08120F70
	.align 2, 0
_08120EAC: .4byte gBattleTypeFlags
_08120EB0: .4byte gUnknown_083FFFEA
_08120EB4: .4byte gUnknown_083FFFF7
_08120EB8:
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08120ED2
	ldrb r1, [r5]
	cmp r1, 0x3
	beq _08120ED2
	movs r0, 0x3
	eors r0, r1
	strb r0, [r5]
_08120ED2:
	ldr r0, _08120EF0 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08120F18
	ldr r0, _08120EF4 @ =gBattleTextBuff1
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _08120F08
	cmp r0, 0x2
	bgt _08120EF8
	cmp r0, 0x1
	beq _08120EFE
	b _08120F70
	.align 2, 0
_08120EF0: .4byte gBattleTypeFlags
_08120EF4: .4byte gBattleTextBuff1
_08120EF8:
	cmp r0, 0x3
	beq _08120F10
	b _08120F70
_08120EFE:
	ldr r6, _08120F04 @ =gUnknown_083FFF6A
	b _08120F70
	.align 2, 0
_08120F04: .4byte gUnknown_083FFF6A
_08120F08:
	ldr r6, _08120F0C @ =gUnknown_083FFF99
	b _08120F70
	.align 2, 0
_08120F0C: .4byte gUnknown_083FFF99
_08120F10:
	ldr r6, _08120F14 @ =gUnknown_083FFFCB
	b _08120F70
	.align 2, 0
_08120F14: .4byte gUnknown_083FFFCB
_08120F18:
	ldr r0, _08120F2C @ =gBattleTextBuff1
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _08120F40
	cmp r0, 0x2
	bgt _08120F30
	cmp r0, 0x1
	beq _08120F36
	b _08120F70
	.align 2, 0
_08120F2C: .4byte gBattleTextBuff1
_08120F30:
	cmp r0, 0x3
	beq _08120F48
	b _08120F70
_08120F36:
	ldr r6, _08120F3C @ =gUnknown_083FFF56
	b _08120F70
	.align 2, 0
_08120F3C: .4byte gUnknown_083FFF56
_08120F40:
	ldr r6, _08120F44 @ =gUnknown_083FFF81
	b _08120F70
	.align 2, 0
_08120F44: .4byte gUnknown_083FFF81
_08120F48:
	ldr r6, _08120F4C @ =gUnknown_083FFFB3
	b _08120F70
	.align 2, 0
_08120F4C: .4byte gUnknown_083FFFB3
_08120F50:
	movs r0, 0xB5
	lsls r0, 1
	cmp r7, r0
	bls _08120F64
	ldr r1, _08120F60 @ =gDisplayedStringBattle
	movs r0, 0xFF
	strb r0, [r1]
	b _08120F76
	.align 2, 0
_08120F60: .4byte gDisplayedStringBattle
_08120F64:
	ldr r1, _08120F84 @ =gBattleStringsTable
	adds r0, r7, 0
	subs r0, 0xC
	lsls r0, 2
	adds r0, r1
	ldr r6, [r0]
_08120F70:
	adds r0, r6, 0
	bl StrCpyDecodeToDisplayedStringBattle
_08120F76:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08120F84: .4byte gBattleStringsTable
	thumb_func_end BufferStringBattle

	thumb_func_start StrCpyDecodeToDisplayedStringBattle
StrCpyDecodeToDisplayedStringBattle: @ 8120F88
	push {lr}
	ldr r1, _08120F94 @ =gDisplayedStringBattle
	bl StrCpyDecodeBattle
	pop {r1}
	bx r1
	.align 2, 0
_08120F94: .4byte gDisplayedStringBattle
	thumb_func_end StrCpyDecodeToDisplayedStringBattle

	thumb_func_start sub_8120F98
sub_8120F98: @ 8120F98
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _08120FB0 @ =gUnknown_084017A8
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	mov r2, sp
	movs r3, 0
	b _08120FC0
	.align 2, 0
_08120FB0: .4byte gUnknown_084017A8
_08120FB4:
	strb r1, [r2]
	adds r4, 0x1
	adds r2, 0x1
	adds r3, 0x1
	cmp r3, 0x7
	bhi _08120FC8
_08120FC0:
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _08120FB4
_08120FC8:
	ldr r5, [sp]
	ldr r4, [sp, 0x4]
	movs r3, 0
	ldr r2, _08120FE4 @ =gUnknown_081FA6D4
_08120FD0:
	ldr r1, [r2]
	ldr r0, [r1]
	cmp r5, r0
	bne _08120FE8
	ldr r0, [r1, 0x4]
	cmp r4, r0
	bne _08120FE8
	ldr r0, [r2, 0x4]
	b _08120FF2
	.align 2, 0
_08120FE4: .4byte gUnknown_081FA6D4
_08120FE8:
	adds r2, 0x8
	adds r3, 0x1
	cmp r3, 0x6
	bls _08120FD0
	movs r0, 0
_08120FF2:
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8120F98

	thumb_func_start StrCpyDecodeBattle
StrCpyDecodeBattle: @ 8120FFC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	mov r9, r0
	mov r8, r1
	movs r6, 0
	movs r4, 0
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r7, r0, 24
	mov r0, r9
	ldrb r1, [r0]
	bl _08121A40
_0812101E:
	cmp r1, 0xFD
	beq _08121026
	bl _08121A30
_08121026:
	movs r1, 0x1
	add r9, r1
	mov r2, r9
	ldrb r0, [r2]
	cmp r0, 0x2A
	bls _08121036
	bl _081219E6
_08121036:
	lsls r0, 2
	ldr r1, _08121040 @ =_08121044
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08121040: .4byte _08121044
	.align 2, 0
_08121044:
	.4byte _081210F0
	.4byte _0812111E
	.4byte _0812115A
	.4byte _08121180
	.4byte _081211A4
	.4byte _081211C8
	.4byte _081211EC
	.4byte _08121218
	.4byte _08121248
	.4byte _08121278
	.4byte _081212A8
	.4byte _0812133C
	.4byte _081213A8
	.4byte _0812141C
	.4byte _08121490
	.4byte _08121504
	.4byte _08121578
	.4byte _081215F8
	.4byte _08121620
	.4byte _08121660
	.4byte _081216EC
	.4byte _081216F4
	.4byte _08121704
	.4byte _08121714
	.4byte _0812172C
	.4byte _0812174C
	.4byte _081217C0
	.4byte _08121830
	.4byte _08121840
	.4byte _08121854
	.4byte _08121868
	.4byte _0812188C
	.4byte _081218B0
	.4byte _081218B8
	.4byte _081218C0
	.4byte _0812195C
	.4byte _081219A4
	.4byte _081219AC
	.4byte _0812197C
	.4byte _08121984
	.4byte _081219CC
	.4byte _081219D4
	.4byte _08121134
_081210F0:
	ldr r5, _08121100 @ =gBattleTextBuff1
	ldrb r0, [r5]
	cmp r0, 0xFD
	bne _08121108
	ldr r4, _08121104 @ =gStringVar1
	adds r0, r5, 0
	b _08121140
	.align 2, 0
_08121100: .4byte gBattleTextBuff1
_08121104: .4byte gStringVar1
_08121108:
	adds r0, r5, 0
	bl sub_8120F98
	adds r4, r0, 0
	cmp r4, 0
	beq _08121118
	bl _081219E6
_08121118:
	adds r4, r5, 0
	bl _081219E6
_0812111E:
	ldr r1, _0812112C @ =gBattleTextBuff2
	ldrb r0, [r1]
	cmp r0, 0xFD
	bne _08121154
	ldr r4, _08121130 @ =gStringVar2
	b _0812113E
	.align 2, 0
_0812112C: .4byte gBattleTextBuff2
_08121130: .4byte gStringVar2
_08121134:
	ldr r1, _0812114C @ =gBattleTextBuff3
	ldrb r0, [r1]
	cmp r0, 0xFD
	bne _08121154
	ldr r4, _08121150 @ =gStringVar3
_0812113E:
	adds r0, r1, 0
_08121140:
	adds r1, r4, 0
	bl sub_8121A68
	bl _081219E6
	.align 2, 0
_0812114C: .4byte gBattleTextBuff3
_08121150: .4byte gStringVar3
_08121154:
	adds r4, r1, 0
	bl _081219E6
_0812115A:
	movs r0, 0
	bl GetBankByPlayerAI
	ldr r1, _08121178 @ =gBattlePartyID
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0812117C @ =gPlayerParty
	adds r0, r1
	bl _0812190E
	.align 2, 0
_08121178: .4byte gBattlePartyID
_0812117C: .4byte gPlayerParty
_08121180:
	movs r0, 0x1
	bl GetBankByPlayerAI
	ldr r1, _0812119C @ =gBattlePartyID
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081211A0 @ =gEnemyParty
	adds r0, r1
	b _0812190E
	.align 2, 0
_0812119C: .4byte gBattlePartyID
_081211A0: .4byte gEnemyParty
_081211A4:
	movs r0, 0x2
	bl GetBankByPlayerAI
	ldr r1, _081211C0 @ =gBattlePartyID
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081211C4 @ =gPlayerParty
	adds r0, r1
	b _0812190E
	.align 2, 0
_081211C0: .4byte gBattlePartyID
_081211C4: .4byte gPlayerParty
_081211C8:
	movs r0, 0x3
	bl GetBankByPlayerAI
	ldr r1, _081211E4 @ =gBattlePartyID
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081211E8 @ =gEnemyParty
	adds r0, r1
	b _0812190E
	.align 2, 0
_081211E4: .4byte gBattlePartyID
_081211E8: .4byte gEnemyParty
_081211EC:
	ldr r2, _0812120C @ =gBattlePartyID
	ldr r1, _08121210 @ =gLinkPlayers
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x18]
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121214 @ =gPlayerParty
	adds r0, r1
	b _0812190E
	.align 2, 0
_0812120C: .4byte gBattlePartyID
_08121210: .4byte gLinkPlayers
_08121214: .4byte gPlayerParty
_08121218:
	ldr r2, _0812123C @ =gBattlePartyID
	ldr r1, _08121240 @ =gLinkPlayers
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x18]
	movs r0, 0x1
	eors r0, r1
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121244 @ =gEnemyParty
	adds r0, r1
	b _0812190E
	.align 2, 0
_0812123C: .4byte gBattlePartyID
_08121240: .4byte gLinkPlayers
_08121244: .4byte gEnemyParty
_08121248:
	ldr r2, _0812126C @ =gBattlePartyID
	ldr r1, _08121270 @ =gLinkPlayers
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x18]
	movs r0, 0x2
	eors r0, r1
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121274 @ =gPlayerParty
	adds r0, r1
	b _0812190E
	.align 2, 0
_0812126C: .4byte gBattlePartyID
_08121270: .4byte gLinkPlayers
_08121274: .4byte gPlayerParty
_08121278:
	ldr r2, _0812129C @ =gBattlePartyID
	ldr r1, _081212A0 @ =gLinkPlayers
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x18]
	movs r0, 0x3
	eors r0, r1
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081212A4 @ =gEnemyParty
	adds r0, r1
	b _0812190E
	.align 2, 0
_0812129C: .4byte gBattlePartyID
_081212A0: .4byte gLinkPlayers
_081212A4: .4byte gEnemyParty
_081212A8:
	ldr r4, _081212CC @ =gBankAttacker
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	adds r2, r4, 0
	cmp r0, 0
	beq _0812131C
	ldr r0, _081212D0 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	ldr r4, _081212D4 @ =gUnknown_08400791
	cmp r0, 0
	beq _081212E6
	ldr r4, _081212D8 @ =gUnknown_08400797
	b _081212E6
	.align 2, 0
_081212CC: .4byte gBankAttacker
_081212D0: .4byte gBattleTypeFlags
_081212D4: .4byte gUnknown_08400791
_081212D8: .4byte gUnknown_08400797
_081212DC:
	mov r3, r8
	adds r0, r3, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
_081212E6:
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _081212DC
	ldrb r0, [r2]
	bl GetBankIdentity
	adds r1, r0, 0
	movs r0, 0x1
	ands r0, r1
	bl GetBankByPlayerAI
	ldr r1, _08121314 @ =gBattlePartyID
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121318 @ =gEnemyParty
	adds r0, r1
	b _0812190E
	.align 2, 0
_08121314: .4byte gBattlePartyID
_08121318: .4byte gEnemyParty
_0812131C:
	ldrb r0, [r2]
	bl GetBankIdentity
	adds r1, r0, 0
	movs r0, 0x1
	ands r0, r1
	bl GetBankByPlayerAI
	ldr r1, _08121338 @ =gBattlePartyID
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r1, [r0]
	b _0812193A
	.align 2, 0
_08121338: .4byte gBattlePartyID
_0812133C:
	ldr r4, _08121370 @ =gBankAttacker
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _0812137C
	ldrb r0, [r4]
	bl GetBankIdentity
	adds r1, r0, 0
	movs r0, 0x1
	ands r0, r1
	bl GetBankByPlayerAI
	ldr r1, _08121374 @ =gBattlePartyID
	lsls r0, 24
	lsrs r0, 23
	adds r0, 0x4
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121378 @ =gPlayerParty
	adds r0, r1
	b _0812190E
	.align 2, 0
_08121370: .4byte gBankAttacker
_08121374: .4byte gBattlePartyID
_08121378: .4byte gPlayerParty
_0812137C:
	ldrb r0, [r4]
	bl GetBankIdentity
	adds r1, r0, 0
	movs r0, 0x1
	ands r0, r1
	bl GetBankByPlayerAI
	ldr r1, _081213A0 @ =gBattlePartyID
	lsls r0, 24
	lsrs r0, 23
	adds r0, 0x4
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081213A4 @ =gEnemyParty
	b _08121940
	.align 2, 0
_081213A0: .4byte gBattlePartyID
_081213A4: .4byte gEnemyParty
_081213A8:
	ldr r5, _081213F4 @ =gBankAttacker
	ldrb r0, [r5]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _0812140C
	ldr r0, _081213F8 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	ldr r4, _081213FC @ =gUnknown_08400791
	cmp r0, 0
	beq _081213C6
	ldr r4, _08121400 @ =gUnknown_08400797
_081213C6:
	ldrb r1, [r4]
	adds r0, r1, 0
	ldr r3, _08121404 @ =gBattlePartyID
	ldr r2, _08121408 @ =gEnemyParty
	mov r12, r2
	adds r2, r5, 0
	cmp r0, 0xFF
	beq _081213E8
_081213D6:
	mov r5, r8
	adds r0, r5, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _081213D6
_081213E8:
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r3
	ldrh r1, [r0]
	b _08121908
	.align 2, 0
_081213F4: .4byte gBankAttacker
_081213F8: .4byte gBattleTypeFlags
_081213FC: .4byte gUnknown_08400791
_08121400: .4byte gUnknown_08400797
_08121404: .4byte gBattlePartyID
_08121408: .4byte gEnemyParty
_0812140C:
	ldr r1, _08121418 @ =gBattlePartyID
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	b _0812193A
	.align 2, 0
_08121418: .4byte gBattlePartyID
_0812141C:
	ldr r5, _08121468 @ =gBankTarget
	ldrb r0, [r5]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _08121480
	ldr r0, _0812146C @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	ldr r4, _08121470 @ =gUnknown_08400791
	cmp r0, 0
	beq _0812143A
	ldr r4, _08121474 @ =gUnknown_08400797
_0812143A:
	ldrb r1, [r4]
	adds r0, r1, 0
	ldr r3, _08121478 @ =gBattlePartyID
	ldr r2, _0812147C @ =gEnemyParty
	mov r12, r2
	adds r2, r5, 0
	cmp r0, 0xFF
	beq _0812145C
_0812144A:
	mov r5, r8
	adds r0, r5, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _0812144A
_0812145C:
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r3
	ldrh r1, [r0]
	b _08121908
	.align 2, 0
_08121468: .4byte gBankTarget
_0812146C: .4byte gBattleTypeFlags
_08121470: .4byte gUnknown_08400791
_08121474: .4byte gUnknown_08400797
_08121478: .4byte gBattlePartyID
_0812147C: .4byte gEnemyParty
_08121480:
	ldr r1, _0812148C @ =gBattlePartyID
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	b _0812193A
	.align 2, 0
_0812148C: .4byte gBattlePartyID
_08121490:
	ldr r5, _081214DC @ =gEffectBank
	ldrb r0, [r5]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _081214F4
	ldr r0, _081214E0 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	ldr r4, _081214E4 @ =gUnknown_08400791
	cmp r0, 0
	beq _081214AE
	ldr r4, _081214E8 @ =gUnknown_08400797
_081214AE:
	ldrb r1, [r4]
	adds r0, r1, 0
	ldr r3, _081214EC @ =gBattlePartyID
	ldr r2, _081214F0 @ =gEnemyParty
	mov r12, r2
	adds r2, r5, 0
	cmp r0, 0xFF
	beq _081214D0
_081214BE:
	mov r5, r8
	adds r0, r5, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _081214BE
_081214D0:
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r3
	ldrh r1, [r0]
	b _08121908
	.align 2, 0
_081214DC: .4byte gEffectBank
_081214E0: .4byte gBattleTypeFlags
_081214E4: .4byte gUnknown_08400791
_081214E8: .4byte gUnknown_08400797
_081214EC: .4byte gBattlePartyID
_081214F0: .4byte gEnemyParty
_081214F4:
	ldr r1, _08121500 @ =gBattlePartyID
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	b _0812193A
	.align 2, 0
_08121500: .4byte gBattlePartyID
_08121504:
	ldr r5, _08121550 @ =gActiveBank
	ldrb r0, [r5]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _08121568
	ldr r0, _08121554 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	ldr r4, _08121558 @ =gUnknown_08400791
	cmp r0, 0
	beq _08121522
	ldr r4, _0812155C @ =gUnknown_08400797
_08121522:
	ldrb r1, [r4]
	adds r0, r1, 0
	ldr r3, _08121560 @ =gBattlePartyID
	ldr r2, _08121564 @ =gEnemyParty
	mov r12, r2
	adds r2, r5, 0
	cmp r0, 0xFF
	beq _08121544
_08121532:
	mov r5, r8
	adds r0, r5, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _08121532
_08121544:
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r3
	ldrh r1, [r0]
	b _08121908
	.align 2, 0
_08121550: .4byte gActiveBank
_08121554: .4byte gBattleTypeFlags
_08121558: .4byte gUnknown_08400791
_0812155C: .4byte gUnknown_08400797
_08121560: .4byte gBattlePartyID
_08121564: .4byte gEnemyParty
_08121568:
	ldr r1, _08121574 @ =gBattlePartyID
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	b _0812193A
	.align 2, 0
_08121574: .4byte gBattlePartyID
_08121578:
	ldr r4, _081215CC @ =0x02000000
	ldr r0, _081215D0 @ =0x00016003
	adds r5, r4, r0
	ldrb r0, [r5]
	bl GetBankSide
	lsls r0, 24
	adds r2, r4, 0
	cmp r0, 0
	beq _081215E8
	ldr r0, _081215D4 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	ldr r4, _081215D8 @ =gUnknown_08400791
	cmp r0, 0
	beq _0812159C
	ldr r4, _081215DC @ =gUnknown_08400797
_0812159C:
	ldrb r1, [r4]
	adds r0, r1, 0
	ldr r3, _081215E0 @ =gBattlePartyID
	ldr r5, _081215E4 @ =gEnemyParty
	mov r12, r5
	cmp r0, 0xFF
	beq _081215BC
_081215AA:
	mov r5, r8
	adds r0, r5, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _081215AA
_081215BC:
	ldr r1, _081215D0 @ =0x00016003
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r3
	ldrh r1, [r0]
	b _08121908
	.align 2, 0
_081215CC: .4byte 0x02000000
_081215D0: .4byte 0x00016003
_081215D4: .4byte gBattleTypeFlags
_081215D8: .4byte gUnknown_08400791
_081215DC: .4byte gUnknown_08400797
_081215E0: .4byte gBattlePartyID
_081215E4: .4byte gEnemyParty
_081215E8:
	ldr r1, _081215F4 @ =gBattlePartyID
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	b _0812193A
	.align 2, 0
_081215F4: .4byte gBattlePartyID
_081215F8:
	ldr r0, _08121610 @ =gSelectedOrderFromParty
	ldr r2, [r0]
	ldrh r1, [r2]
	movs r0, 0xB1
	lsls r0, 1
	cmp r1, r0
	bls _0812161C
	ldr r0, _08121614 @ =0x02000000
	ldr r2, _08121618 @ =0x000160a0
	adds r0, r2
	b _08121634
	.align 2, 0
_08121610: .4byte gSelectedOrderFromParty
_08121614: .4byte 0x02000000
_08121618: .4byte 0x000160a0
_0812161C:
	ldrh r1, [r2]
	b _08121652
_08121620:
	ldr r0, _08121640 @ =gSelectedOrderFromParty
	ldr r2, [r0]
	ldrh r1, [r2, 0x2]
	movs r0, 0xB1
	lsls r0, 1
	cmp r1, r0
	bls _08121650
	ldr r0, _08121644 @ =0x02000000
	ldr r3, _08121648 @ =0x000160a0
	adds r0, r3
_08121634:
	ldrb r0, [r0]
	lsls r0, 2
	ldr r1, _0812164C @ =gUnknown_08401674
	adds r4, r0, r1
	b _081219E6
	.align 2, 0
_08121640: .4byte gSelectedOrderFromParty
_08121644: .4byte 0x02000000
_08121648: .4byte 0x000160a0
_0812164C: .4byte gUnknown_08401674
_08121650:
	ldrh r1, [r2, 0x2]
_08121652:
	movs r0, 0xD
	muls r1, r0
	ldr r0, _0812165C @ =gMoveNames
	adds r4, r1, r0
	b _081219E6
	.align 2, 0
_0812165C: .4byte gMoveNames
_08121660:
	ldr r0, _081216AC @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081216D8
	ldr r1, _081216B0 @ =gLastUsedItem
	ldrh r0, [r1]
	cmp r0, 0xAF
	bne _081216D4
	ldr r2, _081216B4 @ =gLinkPlayers
	ldr r0, _081216B8 @ =0x02000000
	ldr r5, _081216BC @ =0x000160cb
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _081216C0 @ =gStringBank
	ldrb r2, [r1]
	ldrh r0, [r0, 0x18]
	cmp r0, r2
	bne _081216CC
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	ldr r0, _081216C4 @ =gEnigmaBerries
	adds r1, r0
	mov r0, sp
	bl StringCopy
	ldr r1, _081216C8 @ =gUnknown_08400A85
	mov r0, sp
	bl StringAppend
	mov r4, sp
	b _081219E6
	.align 2, 0
_081216AC: .4byte gBattleTypeFlags
_081216B0: .4byte gLastUsedItem
_081216B4: .4byte gLinkPlayers
_081216B8: .4byte 0x02000000
_081216BC: .4byte 0x000160cb
_081216C0: .4byte gStringBank
_081216C4: .4byte gEnigmaBerries
_081216C8: .4byte gUnknown_08400A85
_081216CC:
	ldr r4, _081216D0 @ =gUnknown_08400A78
	b _081219E6
	.align 2, 0
_081216D0: .4byte gUnknown_08400A78
_081216D4:
	ldrh r0, [r1]
	b _081216DC
_081216D8:
	ldr r0, _081216E8 @ =gLastUsedItem
	ldrh r0, [r0]
_081216DC:
	mov r1, sp
	bl CopyItemName
	mov r4, sp
	b _081219E6
	.align 2, 0
_081216E8: .4byte gLastUsedItem
_081216EC:
	ldr r0, _081216F0 @ =gLastUsedAbility
	b _08121734
	.align 2, 0
_081216F0: .4byte gLastUsedAbility
_081216F4:
	ldr r1, _081216FC @ =gAbilitiesPerBank
	ldr r0, _08121700 @ =gBankAttacker
	b _08121730
	.align 2, 0
_081216FC: .4byte gAbilitiesPerBank
_08121700: .4byte gBankAttacker
_08121704:
	ldr r1, _0812170C @ =gAbilitiesPerBank
	ldr r0, _08121710 @ =gBankTarget
	b _08121730
	.align 2, 0
_0812170C: .4byte gAbilitiesPerBank
_08121710: .4byte gBankTarget
_08121714:
	ldr r1, _08121720 @ =gAbilitiesPerBank
	ldr r0, _08121724 @ =0x02000000
	ldr r2, _08121728 @ =0x00016003
	adds r0, r2
	b _08121730
	.align 2, 0
_08121720: .4byte gAbilitiesPerBank
_08121724: .4byte 0x02000000
_08121728: .4byte 0x00016003
_0812172C:
	ldr r1, _08121740 @ =gAbilitiesPerBank
	ldr r0, _08121744 @ =gEffectBank
_08121730:
	ldrb r0, [r0]
	adds r0, r1
_08121734:
	ldrb r1, [r0]
	movs r0, 0xD
	muls r1, r0
	ldr r0, _08121748 @ =gAbilityNames
	adds r4, r1, r0
	b _081219E6
	.align 2, 0
_08121740: .4byte gAbilitiesPerBank
_08121744: .4byte gEffectBank
_08121748: .4byte gAbilityNames
_0812174C:
	ldr r3, _08121764 @ =gTrainerBattleOpponent
	ldrh r1, [r3]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _08121768
	bl GetSecretBaseTrainerNameIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xD
	b _081217AE
	.align 2, 0
_08121764: .4byte gTrainerBattleOpponent
_08121768:
	ldr r0, _08121784 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _08121788
	bl get_trainer_class_name_index
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xD
	b _081217AE
	.align 2, 0
_08121784: .4byte gBattleTypeFlags
_08121788:
	movs r0, 0x80
	lsls r0, 4
	ands r0, r1
	cmp r0, 0
	beq _0812179E
	bl sub_8135FD8
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xD
	b _081217AE
_0812179E:
	ldr r2, _081217B8 @ =gTrainers
	ldrh r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r1, [r0, 0x1]
	movs r0, 0xD
_081217AE:
	muls r1, r0
	ldr r0, _081217BC @ =gTrainerClassNames
	adds r4, r1, r0
	b _081219E6
	.align 2, 0
_081217B8: .4byte gTrainers
_081217BC: .4byte gTrainerClassNames
_081217C0:
	ldr r2, _081217E4 @ =gTrainerBattleOpponent
	ldrh r1, [r2]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _081217EC
	mov r0, sp
	movs r1, 0xFF
	movs r2, 0x8
	bl memset
	ldr r1, _081217E8 @ =0x02017002
	mov r0, sp
	movs r2, 0x7
	bl memcpy
	mov r4, sp
	b _081219E6
	.align 2, 0
_081217E4: .4byte gTrainerBattleOpponent
_081217E8: .4byte 0x02017002
_081217EC:
	ldr r0, _08121804 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _08121808
	mov r0, sp
	bl get_trainer_name
	mov r4, sp
	b _081219E6
	.align 2, 0
_08121804: .4byte gBattleTypeFlags
_08121808:
	movs r0, 0x80
	lsls r0, 4
	ands r0, r1
	cmp r0, 0
	beq _0812181C
	mov r0, sp
	bl sub_8135FF4
	mov r4, sp
	b _081219E6
_0812181C:
	ldrh r0, [r2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0812182C @ =gTrainers + 0x4
	adds r4, r1, r0
	b _081219E6
	.align 2, 0
_0812182C: .4byte gTrainers + 0x4
_08121830:
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	ldr r1, _0812183C @ =gLinkPlayers + 0x8
	adds r4, r0, r1
	b _081219E6
	.align 2, 0
_0812183C: .4byte gLinkPlayers + 0x8
_08121840:
	ldr r4, _08121850 @ =gLinkPlayers
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x18]
	movs r0, 0x2
	b _08121876
	.align 2, 0
_08121850: .4byte gLinkPlayers
_08121854:
	ldr r4, _08121864 @ =gLinkPlayers
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x18]
	movs r0, 0x1
	b _08121876
	.align 2, 0
_08121864: .4byte gLinkPlayers
_08121868:
	ldr r4, _08121888 @ =gLinkPlayers
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x18]
	movs r0, 0x3
_08121876:
	eors r0, r1
	bl sub_803FC34
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r4, 0x8
	adds r4, r1, r4
	b _081219E6
	.align 2, 0
_08121888: .4byte gLinkPlayers
_0812188C:
	ldr r0, _081218A4 @ =0x02000000
	ldr r3, _081218A8 @ =0x00016003
	adds r0, r3
	ldrb r0, [r0]
	bl sub_803FC34
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	ldr r0, _081218AC @ =gLinkPlayers + 0x8
	adds r4, r1, r0
	b _081219E6
	.align 2, 0
_081218A4: .4byte 0x02000000
_081218A8: .4byte 0x00016003
_081218AC: .4byte gLinkPlayers + 0x8
_081218B0:
	ldr r4, _081218B4 @ =gSaveBlock2
	b _081219E6
	.align 2, 0
_081218B4: .4byte gSaveBlock2
_081218B8:
	bl sub_8082830
	adds r4, r0, 0
	b _081219E6
_081218C0:
	ldr r5, _08121918 @ =0x02000000
	ldr r1, _0812191C @ =0x00016003
	adds r0, r5, r1
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _08121934
	ldr r0, _08121920 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	ldr r4, _08121924 @ =gUnknown_08400791
	cmp r0, 0
	beq _081218E2
	ldr r4, _08121928 @ =gUnknown_08400797
_081218E2:
	ldrb r1, [r4]
	adds r0, r1, 0
	ldr r2, _0812192C @ =gEnemyParty
	mov r12, r2
	adds r2, r5, 0
	cmp r0, 0xFF
	beq _08121902
_081218F0:
	mov r3, r8
	adds r0, r3, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _081218F0
_08121902:
	ldr r5, _08121930 @ =0x0001605e
	adds r0, r2, r5
	ldrb r1, [r0]
_08121908:
	movs r0, 0x64
	muls r0, r1
	add r0, r12
_0812190E:
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	b _0812194A
	.align 2, 0
_08121918: .4byte 0x02000000
_0812191C: .4byte 0x00016003
_08121920: .4byte gBattleTypeFlags
_08121924: .4byte gUnknown_08400791
_08121928: .4byte gUnknown_08400797
_0812192C: .4byte gEnemyParty
_08121930: .4byte 0x0001605e
_08121934:
	ldr r1, _08121954 @ =0x0001605e
	adds r0, r5, r1
	ldrb r1, [r0]
_0812193A:
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121958 @ =gPlayerParty
_08121940:
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
_0812194A:
	mov r0, sp
	bl StringGetEnd10
	mov r4, sp
	b _081219E6
	.align 2, 0
_08121954: .4byte 0x0001605e
_08121958: .4byte gPlayerParty
_0812195C:
	ldr r0, _08121970 @ =0x0000084b
	bl FlagGet
	lsls r0, 24
	ldr r4, _08121974 @ =gUnknown_084009ED
	cmp r0, 0
	beq _081219E6
	ldr r4, _08121978 @ =gUnknown_084009F7
	b _081219E6
	.align 2, 0
_08121970: .4byte 0x0000084b
_08121974: .4byte gUnknown_084009ED
_08121978: .4byte gUnknown_084009F7
_0812197C:
	ldr r0, _08121980 @ =gBankAttacker
	b _08121986
	.align 2, 0
_08121980: .4byte gBankAttacker
_08121984:
	ldr r0, _08121998 @ =gBankTarget
_08121986:
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	ldr r4, _0812199C @ =gUnknown_084007A7
	cmp r0, 0
	bne _081219E6
	ldr r4, _081219A0 @ =gUnknown_084007AC
	b _081219E6
	.align 2, 0
_08121998: .4byte gBankTarget
_0812199C: .4byte gUnknown_084007A7
_081219A0: .4byte gUnknown_084007AC
_081219A4:
	ldr r0, _081219A8 @ =gBankAttacker
	b _081219AE
	.align 2, 0
_081219A8: .4byte gBankAttacker
_081219AC:
	ldr r0, _081219C0 @ =gBankTarget
_081219AE:
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	ldr r4, _081219C4 @ =gUnknown_0840079C
	cmp r0, 0
	bne _081219E6
	ldr r4, _081219C8 @ =gUnknown_084007A1
	b _081219E6
	.align 2, 0
_081219C0: .4byte gBankTarget
_081219C4: .4byte gUnknown_0840079C
_081219C8: .4byte gUnknown_084007A1
_081219CC:
	ldr r0, _081219D0 @ =gBankAttacker
	b _081219D6
	.align 2, 0
_081219D0: .4byte gBankAttacker
_081219D4:
	ldr r0, _08121A24 @ =gBankTarget
_081219D6:
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	ldr r4, _08121A28 @ =gUnknown_084007B2
	cmp r0, 0
	bne _081219E6
	ldr r4, _08121A2C @ =gUnknown_084007B7
_081219E6:
	ldrb r1, [r4]
	adds r0, r1, 0
	mov r3, r9
	ldrb r2, [r3]
	adds r3, 0x1
	cmp r0, 0xFF
	beq _08121A06
_081219F4:
	mov r5, r8
	adds r0, r5, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _081219F4
_08121A06:
	lsls r0, r2, 24
	lsrs r0, 24
	cmp r0, 0x21
	bne _08121A3C
	mov r0, r8
	adds r1, r0, r6
	movs r0, 0xFC
	strb r0, [r1]
	adds r6, 0x1
	mov r2, r8
	adds r1, r2, r6
	movs r0, 0x9
	strb r0, [r1]
	adds r6, 0x1
	b _08121A3C
	.align 2, 0
_08121A24: .4byte gBankTarget
_08121A28: .4byte gUnknown_084007B2
_08121A2C: .4byte gUnknown_084007B7
_08121A30:
	mov r3, r8
	adds r0, r3, r6
	strb r1, [r0]
	adds r6, 0x1
	mov r3, r9
	adds r3, 0x1
_08121A3C:
	mov r9, r3
	ldrb r1, [r3]
_08121A40:
	adds r0, r1, 0
	cmp r0, 0xFF
	beq _08121A4A
	bl _0812101E
_08121A4A:
	mov r5, r8
	adds r1, r5, r6
	mov r2, r9
	ldrb r0, [r2]
	strb r0, [r1]
	adds r6, 0x1
	adds r0, r6, 0
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end StrCpyDecodeBattle

	thumb_func_start sub_8121A68
sub_8121A68: @ 8121A68
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	adds r7, r0, 0
	adds r6, r1, 0
	movs r5, 0x1
	movs r0, 0
	mov r8, r0
	movs r0, 0xFF
	strb r0, [r6]
	ldrb r0, [r7, 0x1]
	cmp r0, 0xFF
	bne _08121A86
	b _08121D0E
_08121A86:
	adds r0, r7, r5
	ldrb r1, [r0]
	adds r4, r0, 0
	cmp r1, 0xA
	bls _08121A92
	b _08121D04
_08121A92:
	lsls r0, r1, 2
	ldr r1, _08121A9C @ =_08121AA0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08121A9C: .4byte _08121AA0
	.align 2, 0
_08121AA0:
	.4byte _08121ACC
	.4byte _08121AE8
	.4byte _08121B3C
	.4byte _08121B54
	.4byte _08121B64
	.4byte _08121BDC
	.4byte _08121BF0
	.4byte _08121C02
	.4byte _08121C48
	.4byte _08121C5C
	.4byte _08121C78
_08121ACC:
	adds r0, r5, r7
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldr r0, _08121AE4 @ =gBattleStringsTable
	subs r1, 0xC
	lsls r1, 2
	adds r1, r0
	ldr r1, [r1]
	b _08121CE2
	.align 2, 0
_08121AE4: .4byte gBattleStringsTable
_08121AE8:
	ldrb r0, [r4, 0x1]
	cmp r0, 0x2
	beq _08121B04
	cmp r0, 0x2
	bgt _08121AF8
	cmp r0, 0x1
	beq _08121AFE
	b _08121B26
_08121AF8:
	cmp r0, 0x4
	beq _08121B0C
	b _08121B26
_08121AFE:
	ldrb r4, [r4, 0x3]
	mov r8, r4
	b _08121B26
_08121B04:
	ldrb r1, [r4, 0x3]
	ldrb r0, [r4, 0x4]
	lsls r0, 8
	b _08121B22
_08121B0C:
	ldrb r0, [r4, 0x3]
	mov r8, r0
	ldrb r0, [r4, 0x4]
	lsls r0, 8
	mov r1, r8
	orrs r1, r0
	ldrb r0, [r4, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r4, 0x6]
	lsls r0, 24
_08121B22:
	orrs r1, r0
	mov r8, r1
_08121B26:
	adds r4, r5, r7
	ldrb r3, [r4, 0x2]
	adds r0, r6, 0
	mov r1, r8
	movs r2, 0
	bl ConvertIntToDecimalStringN
	adds r0, r5, 0x3
	ldrb r4, [r4, 0x1]
	adds r5, r0, r4
	b _08121D04
_08121B3C:
	adds r0, r5, r7
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r1, r0
	movs r0, 0xD
	muls r1, r0
	ldr r0, _08121B50 @ =gMoveNames
	adds r1, r0
	b _08121CE2
	.align 2, 0
_08121B50: .4byte gMoveNames
_08121B54:
	adds r0, r5, r7
	ldrb r0, [r0, 0x1]
	lsls r1, r0, 3
	subs r1, r0
	ldr r0, _08121B60 @ =gTypeNames
	b _08121C66
	.align 2, 0
_08121B60: .4byte gTypeNames
_08121B64:
	ldrb r0, [r4, 0x1]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _08121B88
	ldrb r1, [r4, 0x2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121B84 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	b _08121BC4
	.align 2, 0
_08121B84: .4byte gPlayerParty
_08121B88:
	ldr r0, _08121BA0 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08121BA8
	ldr r1, _08121BA4 @ =gUnknown_08400797
	adds r0, r6, 0
	bl StringAppend
	b _08121BB0
	.align 2, 0
_08121BA0: .4byte gBattleTypeFlags
_08121BA4: .4byte gUnknown_08400797
_08121BA8:
	ldr r1, _08121BD4 @ =gUnknown_08400791
	adds r0, r6, 0
	bl StringAppend
_08121BB0:
	adds r0, r5, r7
	ldrb r1, [r0, 0x2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121BD8 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
_08121BC4:
	mov r0, sp
	bl StringGetEnd10
	adds r0, r6, 0
	mov r1, sp
	bl StringAppend
	b _08121D02
	.align 2, 0
_08121BD4: .4byte gUnknown_08400791
_08121BD8: .4byte gEnemyParty
_08121BDC:
	ldr r1, _08121BEC @ =gUnknown_08400F58
	adds r0, r5, r7
	ldrb r0, [r0, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	b _08121C68
	.align 2, 0
_08121BEC: .4byte gUnknown_08400F58
_08121BF0:
	adds r0, r5, r7
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r1, r0
	adds r0, r6, 0
	bl GetSpeciesName
	b _08121D02
_08121C02:
	adds r4, r5, r7
	ldrb r0, [r4, 0x1]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _08121C28
	ldrb r1, [r4, 0x2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121C24 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2
	adds r2, r6, 0
	bl GetMonData
	b _08121C3A
	.align 2, 0
_08121C24: .4byte gPlayerParty
_08121C28:
	ldrb r1, [r4, 0x2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121C44 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x2
	adds r2, r6, 0
	bl GetMonData
_08121C3A:
	adds r0, r6, 0
	bl StringGetEnd10
	b _08121D02
	.align 2, 0
_08121C44: .4byte gEnemyParty
_08121C48:
	ldr r1, _08121C58 @ =gUnknown_08400F78
	adds r0, r5, r7
	ldrb r0, [r0, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	b _08121C68
	.align 2, 0
_08121C58: .4byte gUnknown_08400F78
_08121C5C:
	adds r0, r5, r7
	ldrb r1, [r0, 0x1]
	movs r0, 0xD
	muls r1, r0
	ldr r0, _08121C74 @ =gAbilityNames
_08121C66:
	adds r1, r0
_08121C68:
	adds r0, r6, 0
	bl StringAppend
	adds r5, 0x2
	b _08121D04
	.align 2, 0
_08121C74: .4byte gAbilityNames
_08121C78:
	adds r0, r5, r7
	ldrb r2, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r2, r0
	ldr r0, _08121CC4 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08121CFA
	cmp r2, 0xAF
	bne _08121CF0
	ldr r2, _08121CC8 @ =gLinkPlayers
	ldr r0, _08121CCC @ =0x02000000
	ldr r1, _08121CD0 @ =0x000160cb
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _08121CD4 @ =gStringBank
	ldrb r2, [r1]
	ldrh r0, [r0, 0x18]
	cmp r0, r2
	bne _08121CE0
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	ldr r0, _08121CD8 @ =gEnigmaBerries
	adds r1, r0
	adds r0, r6, 0
	bl StringCopy
	ldr r1, _08121CDC @ =gUnknown_08400A85
	b _08121CE2
	.align 2, 0
_08121CC4: .4byte gBattleTypeFlags
_08121CC8: .4byte gLinkPlayers
_08121CCC: .4byte 0x02000000
_08121CD0: .4byte 0x000160cb
_08121CD4: .4byte gStringBank
_08121CD8: .4byte gEnigmaBerries
_08121CDC: .4byte gUnknown_08400A85
_08121CE0:
	ldr r1, _08121CEC @ =gUnknown_08400A78
_08121CE2:
	adds r0, r6, 0
	bl StringAppend
	b _08121D02
	.align 2, 0
_08121CEC: .4byte gUnknown_08400A78
_08121CF0:
	adds r0, r2, 0
	adds r1, r6, 0
	bl CopyItemName
	b _08121D02
_08121CFA:
	adds r0, r2, 0
	adds r1, r6, 0
	bl CopyItemName
_08121D02:
	adds r5, 0x3
_08121D04:
	adds r0, r7, r5
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _08121D0E
	b _08121A86
_08121D0E:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8121A68

	thumb_func_start sub_8121D1C
sub_8121D1C: @ 8121D1C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r2, 0
	ldr r5, _08121D50 @ =gSelectedOrderFromParty
	ldr r3, _08121D54 @ =gUnknown_084016BC
_08121D26:
	cmp r2, 0x4
	beq _08121D3C
	ldrh r1, [r3]
	cmp r1, 0
	bne _08121D32
	adds r2, 0x1
_08121D32:
	ldr r0, [r5]
	adds r3, 0x2
	ldrh r0, [r0]
	cmp r1, r0
	bne _08121D26
_08121D3C:
	cmp r2, 0
	blt _08121D68
	cmp r2, 0x2
	bgt _08121D5C
	ldr r1, _08121D58 @ =gUnknown_08400E5E
	adds r0, r4, 0
	bl StringCopy
	b _08121D68
	.align 2, 0
_08121D50: .4byte gSelectedOrderFromParty
_08121D54: .4byte gUnknown_084016BC
_08121D58: .4byte gUnknown_08400E5E
_08121D5C:
	cmp r2, 0x4
	bgt _08121D68
	ldr r1, _08121D70 @ =gUnknown_08400E62
	adds r0, r4, 0
	bl StringCopy
_08121D68:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08121D70: .4byte gUnknown_08400E62
	thumb_func_end sub_8121D1C

	thumb_func_start sub_8121D74
sub_8121D74: @ 8121D74
	push {r4,r5,lr}
	adds r3, r0, 0
	movs r4, 0
	b _08121D7E
_08121D7C:
	adds r3, 0x1
_08121D7E:
	ldrb r0, [r3]
	cmp r0, 0xFF
	bne _08121D7C
	ldr r1, _08121DB4 @ =gUnknown_084016BC
	ldr r5, _08121DB8 @ =gSelectedOrderFromParty
	movs r0, 0
	lsls r0, 1
	adds r2, r0, r1
_08121D8E:
	cmp r4, 0x4
	beq _08121DA8
	ldrh r1, [r2]
	cmp r1, 0
	bne _08121D9A
	adds r4, 0x1
_08121D9A:
	ldr r0, [r5]
	adds r2, 0x2
	ldrh r0, [r0]
	cmp r1, r0
	bne _08121D8E
	cmp r4, 0x4
	bhi _08121E04
_08121DA8:
	lsls r0, r4, 2
	ldr r1, _08121DBC @ =_08121DC0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08121DB4: .4byte gUnknown_084016BC
_08121DB8: .4byte gSelectedOrderFromParty
_08121DBC: .4byte _08121DC0
	.align 2, 0
_08121DC0:
	.4byte _08121DD4
	.4byte _08121DDC
	.4byte _08121DE4
	.4byte _08121DEC
	.4byte _08121DFC
_08121DD4:
	ldr r1, _08121DD8 @ =gUnknown_084007C8
	b _08121DEE
	.align 2, 0
_08121DD8: .4byte gUnknown_084007C8
_08121DDC:
	ldr r1, _08121DE0 @ =gUnknown_084007CA
	b _08121DEE
	.align 2, 0
_08121DE0: .4byte gUnknown_084007CA
_08121DE4:
	ldr r1, _08121DE8 @ =gUnknown_084007CC
	b _08121DEE
	.align 2, 0
_08121DE8: .4byte gUnknown_084007CC
_08121DEC:
	ldr r1, _08121DF8 @ =gUnknown_084007CE
_08121DEE:
	adds r0, r3, 0
	bl StringCopy
	b _08121E04
	.align 2, 0
_08121DF8: .4byte gUnknown_084007CE
_08121DFC:
	ldr r1, _08121E0C @ =gUnknown_084007D0
	adds r0, r3, 0
	bl StringCopy
_08121E04:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08121E0C: .4byte gUnknown_084007D0
	thumb_func_end sub_8121D74

	.align 2, 0 @ Don't pad with nop.
