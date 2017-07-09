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
	ldr r0, _08120C04 @ =0x0000ffff
	b _08120F9A
	.align 2, 0
_08120BFC: .4byte gUnknown_084005AA
_08120C04: .4byte 0x0000ffff
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
	ldr r6, _08120CB8d @ =gUnknown_08400645
	cmp r0, 0
	beq _08120CA8
	b _08120F70
_08120CA8:
	ldr r6, _08120CBCd @ =gUnknown_08400608
	ldr r0, _08120CC0d @ =0x0000ffff
	b _08120F9A
	.align 2, 0
_08120CB8d: .4byte gUnknown_08400645
_08120CBCd: .4byte gUnknown_08400608
_08120CC0d: .4byte 0x0000ffff
_08120CB4:
	movs r0, 0x2
	ands r0, r1
	ldr r6, _08120CD8 @ =gUnknown_08400635
	cmp r0, 0
	beq _08120CC0
	b _08120F70
_08120CC0:
	ldr r6, _08120CDC @ =gUnknown_084005F5
	ldr r0, _08120CE0 @ =0x0000ffff
	b _08120F9A
	.align 2, 0
_08120CD8: .4byte gUnknown_08400635
_08120CDC: .4byte gUnknown_084005F5
_08120CE0: .4byte 0x0000ffff
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
	ldr r0, _d08120D78 @ =0x0000ffff
	b _08120F9A
	.align 2, 0
_08120D58: .4byte gUnknown_0840075E
_d08120D78: .4byte 0x0000ffff
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
	ldr r0, _d08120E0C @ =0x0000ffff
	b _08120F9A
	.align 2, 0
_08120DE4: .4byte gUnknown_08400622
_d08120E0C: .4byte 0x0000ffff
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
	adds r0, r7, 0
_08120F9A:
	adds r1, r6, 0
	bl de_sub_804110C
	adds r6, r0, 0
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
StrCpyDecodeBattle:
.syntax divided
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	sp, sp, #0xfffffff4
	mov	r9, r0
	mov	r8, r1
	mov	r6, #0x0
	mov	r4, #0x0
	bl	GetMultiplayerId
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
	mov	r0, r9
	ldrb	r1, [r0]
	bl	._184
._460:
	cmp	r1, #0xfd
	beq	._185	@cond_branch
	bl	._186
._185:
	mov	r1, #0x1
	add r9, r9, r1
	mov	r2, r9
	ldrb	r0, [r2]
	cmp	r0, #0x2a
	bls	._187	@cond_branch
	bl	._452
._187:
	lsl	r0, r0, #0x2
	ldr	r1, ._190
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
._191:
	.align	2, 0
._190:
	.word	._189
._189:
	.word	._192
	.word	._193
	.word	._194
	.word	._195
	.word	._196
	.word	._197
	.word	._198
	.word	._199
	.word	._200
	.word	._201
	.word	._202
	.word	._203
	.word	._204
	.word	._205
	.word	._206
	.word	._207
	.word	._208
	.word	._209
	.word	._210
	.word	._211
	.word	._212
	.word	._213
	.word	._214
	.word	._215
	.word	._216
	.word	._217
	.word	._218
	.word	._219
	.word	._220
	.word	._221
	.word	._222
	.word	._223
	.word	._224
	.word	._225
	.word	._226
	.word	._227
	.word	._228
	.word	._229
	.word	._230
	.word	._231
	.word	._232
	.word	._233
	.word	._234
._192:
	ldr	r5, ._237
	ldrb	r0, [r5]
	cmp	r0, #0xfd
	bne	._235	@cond_branch
	ldr	r4, ._237 + 4
	add	r0, r5, #0
	b	._236
._238:
	.align	2, 0
._237:
	.word	gBattleTextBuff1
	.word	gStringVar1
._235:
	add	r0, r5, #0
	bl	sub_8120F98
	add	r4, r0, #0
	cmp	r4, #0
	beq	._239	@cond_branch
	bl	._452
._239:
	add	r4, r5, #0
	bl	._452
._193:
	ldr	r1, ._244
	ldrb	r0, [r1]
	cmp	r0, #0xfd
	bne	._246	@cond_branch
	ldr	r4, ._244 + 4
	b	._243
._245:
	.align	2, 0
._244:
	.word	gBattleTextBuff2
	.word	gStringVar2
._234:
	ldr	r1, ._248
	ldrb	r0, [r1]
	cmp	r0, #0xfd
	bne	._246	@cond_branch
	ldr	r4, ._248 + 4
._243:
	add	r0, r1, #0
._236:
	add	r1, r4, #0
	bl	sub_8121A68
	bl	._452
._249:
	.align	2, 0
._248:
	.word	gBattleTextBuff3
	.word	gStringVar3
._246:
	add	r4, r1, #0
	bl	._452
._194:
	mov	r0, #0x0
	bl	GetBankByPlayerAI
	ldr	r1, ._252
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x17
	add	r0, r0, r1
	ldrh	r1, [r0]
	b	._333
._253:
	.align	2, 0
._252:
	.word	gBattlePartyID
._195:
	mov	r0, #0x1
	bl	GetBankByPlayerAI
	ldr	r1, ._255
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x17
	add	r0, r0, r1
	ldrh	r1, [r0]
	mov	r0, #0x64
	mul	r0, r0, r1
	ldr	r1, ._255 + 4
	b	._272
._256:
	.align	2, 0
._255:
	.word	gBattlePartyID
	.word	gEnemyParty
._196:
	mov	r0, #0x2
	bl	GetBankByPlayerAI
	ldr	r1, ._258
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x17
	add	r0, r0, r1
	ldrh	r1, [r0]
	b	._333
._259:
	.align	2, 0
._258:
	.word	gBattlePartyID
._197:
	mov	r0, #0x3
	bl	GetBankByPlayerAI
	ldr	r1, ._261
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x17
	add	r0, r0, r1
	ldrh	r1, [r0]
	mov	r0, #0x64
	mul	r0, r0, r1
	ldr	r1, ._261 + 4
	b	._272
._262:
	.align	2, 0
._261:
	.word	gBattlePartyID
	.word	gEnemyParty
._198:
	ldr	r2, ._264
	ldr	r1, ._264 + 4
	lsl	r0, r7, #0x3
	sub	r0, r0, r7
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldrh	r0, [r0, #0x18]
	lsl	r0, r0, #0x1
	add	r0, r0, r2
	ldrh	r1, [r0]
	b	._333
._265:
	.align	2, 0
._264:
	.word	gBattlePartyID
	.word	gLinkPlayers
._199:
	ldr	r2, ._267
	ldr	r1, ._267 + 4
	lsl	r0, r7, #0x3
	sub	r0, r0, r7
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldrh	r1, [r0, #0x18]
	mov	r0, #0x1
	eor	r0, r0, r1
	lsl	r0, r0, #0x1
	add	r0, r0, r2
	ldrh	r1, [r0]
	mov	r0, #0x64
	mul	r0, r0, r1
	ldr	r1, ._267 + 8
	b	._272
._268:
	.align	2, 0
._267:
	.word	gBattlePartyID
	.word	gLinkPlayers
	.word	gEnemyParty
._200:
	ldr	r2, ._270
	ldr	r1, ._270 + 4
	lsl	r0, r7, #0x3
	sub	r0, r0, r7
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldrh	r1, [r0, #0x18]
	mov	r0, #0x2
	eor	r0, r0, r1
	lsl	r0, r0, #0x1
	add	r0, r0, r2
	ldrh	r1, [r0]
	b	._333
._271:
	.align	2, 0
._270:
	.word	gBattlePartyID
	.word	gLinkPlayers
._201:
	ldr	r2, ._273
	ldr	r1, ._273 + 4
	lsl	r0, r7, #0x3
	sub	r0, r0, r7
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldrh	r1, [r0, #0x18]
	mov	r0, #0x3
	eor	r0, r0, r1
	lsl	r0, r0, #0x1
	add	r0, r0, r2
	ldrh	r1, [r0]
	mov	r0, #0x64
	mul	r0, r0, r1
	ldr	r1, ._273 + 8
	b	._272
._274:
	.align	2, 0
._273:
	.word	gBattlePartyID
	.word	gLinkPlayers
	.word	gEnemyParty
._202:
	ldr	r4, ._277
	ldrb	r0, [r4]
	bl	GetBankSide
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	._275	@cond_branch
	ldrb	r0, [r4]
	bl	GetBankIdentity
	add	r1, r0, #0
	mov	r0, #0x1
	and	r0, r0, r1
	bl	GetBankByPlayerAI
	ldr	r1, ._277 + 4
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x17
	add	r0, r0, r1
	ldrh	r1, [r0]
	mov	r0, #0x64
	mul	r0, r0, r1
	ldr	r1, ._277 + 8
	add	r0, r0, r1
	mov	r1, #0x2
	mov	r2, sp
	bl	GetMonData
	mov	r0, sp
	bl	StringGetEnd10
	mov	r4, sp
	b	._276
._278:
	.align	2, 0
._277:
	.word	gBankAttacker
	.word	gBattlePartyID
	.word	gEnemyParty
._279:
	mov	r3, r8
	add	r0, r3, r6
	strb	r1, [r0]
	add	r6, r6, #0x1
	add	r4, r4, #0x1
._276:
	ldrb	r1, [r4]
	add	r0, r1, #0
	cmp	r0, #0xff
	bne	._279	@cond_branch
	b	._332
._275:
	ldrb	r0, [r4]
	bl	GetBankIdentity
	add	r1, r0, #0
	mov	r0, #0x1
	and	r0, r0, r1
	bl	GetBankByPlayerAI
	ldr	r1, ._282
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x17
	add	r0, r0, r1
	ldrh	r1, [r0]
	b	._333
._283:
	.align	2, 0
._282:
	.word	gBattlePartyID
._203:
	ldr	r4, ._286
	ldrb	r0, [r4]
	bl	GetBankSide
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	._284	@cond_branch
	ldrb	r0, [r4]
	bl	GetBankIdentity
	add	r1, r0, #0
	mov	r0, #0x1
	and	r0, r0, r1
	bl	GetBankByPlayerAI
	ldr	r1, ._286 + 4
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x17
	add	r0, r0, #0x4
	add	r0, r0, r1
	ldrh	r1, [r0]
	b	._333
._287:
	.align	2, 0
._286:
	.word	gBankAttacker
	.word	gBattlePartyID
._284:
	ldrb	r0, [r4]
	bl	GetBankIdentity
	add	r1, r0, #0
	mov	r0, #0x1
	and	r0, r0, r1
	bl	GetBankByPlayerAI
	ldr	r1, ._289
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x17
	add	r0, r0, #0x4
	add	r0, r0, r1
	ldrh	r1, [r0]
	mov	r0, #0x64
	mul	r0, r0, r1
	ldr	r1, ._289 + 4
	add	r0, r0, r1
	mov	r1, #0x2
	mov	r2, sp
	bl	GetMonData
	b	._288
._290:
	.align	2, 0
._289:
	.word	gBattlePartyID
	.word	gEnemyParty
._204:
	ldr	r4, ._293
	ldrb	r0, [r4]
	bl	GetBankSide
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	._291	@cond_branch
	ldr	r1, ._293 + 4
	ldrb	r0, [r4]
	lsl	r0, r0, #0x1
	add	r0, r0, r1
	ldrh	r1, [r0]
	mov	r0, #0x64
	mul	r0, r0, r1
	ldr	r1, ._293 + 8
	add	r0, r0, r1
	mov	r1, #0x2
	mov	r2, sp
	bl	GetMonData
	mov	r0, sp
	bl	StringGetEnd10
	mov	r4, sp
	b	._292
._294:
	.align	2, 0
._293:
	.word	gBankAttacker
	.word	gBattlePartyID
	.word	gEnemyParty
._295:
	mov	r5, r8
	add	r0, r5, r6
	strb	r1, [r0]
	add	r6, r6, #0x1
	add	r4, r4, #0x1
._292:
	ldrb	r1, [r4]
	add	r0, r1, #0
	cmp	r0, #0xff
	bne	._295	@cond_branch
	b	._332
._291:
	ldr	r1, ._298
	ldrb	r0, [r4]
	lsl	r0, r0, #0x1
	add	r0, r0, r1
	ldrh	r1, [r0]
	b	._333
._299:
	.align	2, 0
._298:
	.word	gBattlePartyID
._205:
	ldr	r4, ._302
	ldrb	r0, [r4]
	bl	GetBankSide
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	._300	@cond_branch
	ldr	r1, ._302 + 4
	ldrb	r0, [r4]
	lsl	r0, r0, #0x1
	add	r0, r0, r1
	ldrh	r1, [r0]
	mov	r0, #0x64
	mul	r0, r0, r1
	ldr	r1, ._302 + 8
	add	r0, r0, r1
	mov	r1, #0x2
	mov	r2, sp
	bl	GetMonData
	mov	r0, sp
	bl	StringGetEnd10
	mov	r4, sp
	b	._301
._303:
	.align	2, 0
._302:
	.word	gBankTarget
	.word	gBattlePartyID
	.word	gEnemyParty
._304:
	mov	r2, r8
	add	r0, r2, r6
	strb	r1, [r0]
	add	r6, r6, #0x1
	add	r4, r4, #0x1
._301:
	ldrb	r1, [r4]
	add	r0, r1, #0
	cmp	r0, #0xff
	bne	._304	@cond_branch
	b	._332
._300:
	ldr	r1, ._307
	ldrb	r0, [r4]
	lsl	r0, r0, #0x1
	add	r0, r0, r1
	ldrh	r1, [r0]
	b	._333
._308:
	.align	2, 0
._307:
	.word	gBattlePartyID
._206:
	ldr	r4, ._311
	ldrb	r0, [r4]
	bl	GetBankSide
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	._309	@cond_branch
	ldr	r1, ._311 + 4
	ldrb	r0, [r4]
	lsl	r0, r0, #0x1
	add	r0, r0, r1
	ldrh	r1, [r0]
	mov	r0, #0x64
	mul	r0, r0, r1
	ldr	r1, ._311 + 8
	add	r0, r0, r1
	mov	r1, #0x2
	mov	r2, sp
	bl	GetMonData
	mov	r0, sp
	bl	StringGetEnd10
	mov	r4, sp
	b	._310
._312:
	.align	2, 0
._311:
	.word	gEffectBank
	.word	gBattlePartyID
	.word	gEnemyParty
._313:
	mov	r3, r8
	add	r0, r3, r6
	strb	r1, [r0]
	add	r6, r6, #0x1
	add	r4, r4, #0x1
._310:
	ldrb	r1, [r4]
	add	r0, r1, #0
	cmp	r0, #0xff
	bne	._313	@cond_branch
	b	._332
._309:
	ldr	r1, ._316
	ldrb	r0, [r4]
	lsl	r0, r0, #0x1
	add	r0, r0, r1
	ldrh	r1, [r0]
	b	._333
._317:
	.align	2, 0
._316:
	.word	gBattlePartyID
._207:
	ldr	r4, ._320
	ldrb	r0, [r4]
	bl	GetBankSide
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	._318	@cond_branch
	ldr	r1, ._320 + 4
	ldrb	r0, [r4]
	lsl	r0, r0, #0x1
	add	r0, r0, r1
	ldrh	r1, [r0]
	mov	r0, #0x64
	mul	r0, r0, r1
	ldr	r1, ._320 + 8
	add	r0, r0, r1
	mov	r1, #0x2
	mov	r2, sp
	bl	GetMonData
	mov	r0, sp
	bl	StringGetEnd10
	mov	r4, sp
	b	._319
._321:
	.align	2, 0
._320:
	.word	gActiveBank
	.word	gBattlePartyID
	.word	gEnemyParty
._322:
	mov	r5, r8
	add	r0, r5, r6
	strb	r1, [r0]
	add	r6, r6, #0x1
	add	r4, r4, #0x1
._319:
	ldrb	r1, [r4]
	add	r0, r1, #0
	cmp	r0, #0xff
	bne	._322	@cond_branch
	b	._332
._318:
	ldr	r1, ._325
	ldrb	r0, [r4]
	lsl	r0, r0, #0x1
	add	r0, r0, r1
	ldrh	r1, [r0]
	b	._333
._326:
	.align	2, 0
._325:
	.word	gBattlePartyID
._208:
	ldr	r0, ._329
	ldr	r1, ._329 + 4
	add	r4, r0, r1
	ldrb	r0, [r4]
	bl	GetBankSide
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	._327	@cond_branch
	ldr	r1, ._329 + 8
	ldrb	r0, [r4]
	lsl	r0, r0, #0x1
	add	r0, r0, r1
	ldrh	r1, [r0]
	mov	r0, #0x64
	mul	r0, r0, r1
	ldr	r1, ._329 + 12
	add	r0, r0, r1
	mov	r1, #0x2
	mov	r2, sp
	bl	GetMonData
	mov	r0, sp
	bl	StringGetEnd10
	mov	r4, sp
	b	._328
._330:
	.align	2, 0
._329:
	.word	+0x2000000
	.word	0x16003
	.word	gBattlePartyID
	.word	gEnemyParty
._331:
	mov	r2, r8
	add	r0, r2, r6
	strb	r1, [r0]
	add	r6, r6, #0x1
	add	r4, r4, #0x1
._328:
	ldrb	r1, [r4]
	add	r0, r1, #0
	cmp	r0, #0xff
	bne	._331	@cond_branch
	b	._332
._327:
	ldr	r1, ._334
	ldrb	r0, [r4]
	lsl	r0, r0, #0x1
	add	r0, r0, r1
	ldrh	r1, [r0]
	b	._333
._335:
	.align	2, 0
._334:
	.word	gBattlePartyID
._209:
	ldr	r0, ._338
	ldr	r2, [r0]
	ldrh	r1, [r2]
	mov	r0, #0xb1
	lsl	r0, r0, #0x1
	cmp	r1, r0
	bls	._336	@cond_branch
	ldr	r0, ._338 + 4
	ldr	r3, ._338 + 8
	add	r0, r0, r3
	b	._337
._339:
	.align	2, 0
._338:
	.word	gSelectedOrderFromParty
	.word	+0x2000000
	.word	0x160a0
._336:
	ldrh	r1, [r2]
	b	._340
._210:
	ldr	r0, ._343
	ldr	r2, [r0]
	ldrh	r1, [r2, #0x2]
	mov	r0, #0xb1
	lsl	r0, r0, #0x1
	cmp	r1, r0
	bls	._341	@cond_branch
	ldr	r0, ._343 + 4
	ldr	r5, ._343 + 8
	add	r0, r0, r5
._337:
	ldrb	r0, [r0]
	lsl	r0, r0, #0x2
	ldr	r1, ._343 + 12
	add	r4, r0, r1
	b	._452
._344:
	.align	2, 0
._343:
	.word	gSelectedOrderFromParty
	.word	+0x2000000
	.word	0x160a0
	.word	gUnknown_08401674
._341:
	ldrh	r1, [r2, #0x2]
._340:
	mov	r0, #0xd
	mul	r1, r1, r0
	ldr	r0, ._346
	add	r4, r1, r0
	b	._452
._347:
	.align	2, 0
._346:
	.word	gMoveNames
._211:
	ldr	r0, ._352
	ldrh	r1, [r0]
	mov	r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	._348	@cond_branch
	ldr	r1, ._352 + 4
	ldrh	r0, [r1]
	cmp	r0, #0xaf
	bne	._349	@cond_branch
	ldr	r2, ._352 + 8
	ldr	r0, ._352 + 12
	ldr	r1, ._352 + 16
	add	r0, r0, r1
	ldrb	r1, [r0]
	lsl	r0, r1, #0x3
	sub	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r2
	ldr	r1, ._352 + 20
	ldrb	r2, [r1]
	ldrh	r0, [r0, #0x18]
	cmp	r0, r2
	bne	._350	@cond_branch
	lsl	r1, r2, #0x3
	sub	r1, r1, r2
	lsl	r1, r1, #0x2
	ldr	r0, ._352 + 24
	add	r1, r1, r0
	mov	r0, sp
	bl	StringCopy
	ldr	r1, ._352 + 28
	mov	r0, sp
	bl	de_sub_8073174
	mov	r4, sp
	b	._452
._353:
	.align	2, 0
._352:
	.word	gBattleTypeFlags
	.word	gLastUsedItem
	.word	gLinkPlayers
	.word	+0x2000000
	.word	0x160cb
	.word	gStringBank
	.word	gEnigmaBerries
	.word	gUnknown_08400A85
._350:
	ldr	r4, ._355
	b	._452
._356:
	.align	2, 0
._355:
	.word	gUnknown_08400A78
._349:
	ldrh	r0, [r1]
	b	._357
._348:
	ldr	r0, ._359
	ldrh	r0, [r0]
._357:
	mov	r1, sp
	bl	CopyItemName
	mov	r4, sp
	b	._452
._360:
	.align	2, 0
._359:
	.word	gLastUsedItem
._212:
	ldr	r0, ._362
	b	._361
._363:
	.align	2, 0
._362:
	.word	gLastUsedAbility
._213:
	ldr	r1, ._365
	ldr	r0, ._365 + 4
	b	._370
._366:
	.align	2, 0
._365:
	.word	gAbilitiesPerBank
	.word	gBankAttacker
._214:
	ldr	r1, ._368
	ldr	r0, ._368 + 4
	b	._370
._369:
	.align	2, 0
._368:
	.word	gAbilitiesPerBank
	.word	gBankTarget
._215:
	ldr	r1, ._371
	ldr	r0, ._371 + 4
	ldr	r2, ._371 + 8
	add	r0, r0, r2
	b	._370
._372:
	.align	2, 0
._371:
	.word	gAbilitiesPerBank
	.word	+0x2000000
	.word	0x16003
._216:
	ldr	r1, ._374
	ldr	r0, ._374 + 4
._370:
	ldrb	r0, [r0]
	add	r0, r0, r1
._361:
	ldrb	r1, [r0]
	mov	r0, #0xd
	mul	r1, r1, r0
	ldr	r0, ._374 + 8
	add	r4, r1, r0
	b	._452
._375:
	.align	2, 0
._374:
	.word	gAbilitiesPerBank
	.word	gEffectBank
	.word	gAbilityNames
._217:
	ldr	r3, ._378
	ldrh	r1, [r3]
	mov	r0, #0x80
	lsl	r0, r0, #0x3
	cmp	r1, r0
	bne	._376	@cond_branch
	add	r0, r1, #0
	mov	r1, #0x0
	b	._385
._379:
	.align	2, 0
._378:
	.word	gTrainerBattleOpponent
._376:
	ldr	r0, ._382
	ldrh	r1, [r0]
	mov	r2, #0x80
	lsl	r2, r2, #0x1
	add	r0, r2, #0
	and	r0, r0, r1
	cmp	r0, #0
	beq	._380	@cond_branch
	add	r0, r2, #0
	mov	r1, #0x0
	b	._385
._383:
	.align	2, 0
._382:
	.word	gBattleTypeFlags
._380:
	mov	r2, #0x80
	lsl	r2, r2, #0x4
	add	r0, r2, #0
	and	r0, r0, r1
	cmp	r0, #0
	beq	._384	@cond_branch
	add	r0, r2, #0
	mov	r1, #0x0
	b	._385
._384:
	ldrh	r1, [r3]
	mov	r0, #0x0
._385:
	bl	de_sub_8041024
	add	r4, r0, #0
	b	._452
._218:
	ldr	r2, ._389
	ldrh	r1, [r2]
	mov	r0, #0x80
	lsl	r0, r0, #0x3
	cmp	r1, r0
	bne	._387	@cond_branch
	mov	r0, sp
	mov	r1, #0xff
	mov	r2, #0x8
	bl	gScriptFuncs_End+0x5c24
	ldr	r1, ._389 + 4
	mov	r0, sp
	mov	r2, #0x7
	bl	gScriptFuncs_End+0x5bc4
	mov	r4, sp
	b	._452
._390:
	.align	2, 0
._389:
	.word	gTrainerBattleOpponent
	.word	+0x2017002
._387:
	ldr	r0, ._393
	ldrh	r1, [r0]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._391	@cond_branch
	mov	r0, sp
	bl	get_trainer_name
	mov	r4, sp
	b	._452
._394:
	.align	2, 0
._393:
	.word	gBattleTypeFlags
._391:
	mov	r0, #0x80
	lsl	r0, r0, #0x4
	and	r0, r0, r1
	cmp	r0, #0
	beq	._395	@cond_branch
	mov	r0, sp
	bl	sub_8135FF4
	mov	r4, sp
	b	._452
._395:
	ldrh	r0, [r2]
	lsl	r1, r0, #0x2
	add	r1, r1, r0
	lsl	r1, r1, #0x3
	ldr	r0, ._398
	add	r4, r1, r0
	b	._452
._399:
	.align	2, 0
._398:
	.word	gTrainers+0x4
._219:
	lsl	r0, r7, #0x3
	sub	r0, r0, r7
	lsl	r0, r0, #0x2
	ldr	r1, ._401
	add	r4, r0, r1
	b	._452
._402:
	.align	2, 0
._401:
	.word	gLinkPlayers+0x8
._220:
	ldr	r4, ._404
	lsl	r0, r7, #0x3
	sub	r0, r0, r7
	lsl	r0, r0, #0x2
	add	r0, r0, r4
	ldrh	r1, [r0, #0x18]
	mov	r0, #0x2
	b	._406
._405:
	.align	2, 0
._404:
	.word	gLinkPlayers
._221:
	ldr	r4, ._407
	lsl	r0, r7, #0x3
	sub	r0, r0, r7
	lsl	r0, r0, #0x2
	add	r0, r0, r4
	ldrh	r1, [r0, #0x18]
	mov	r0, #0x1
	b	._406
._408:
	.align	2, 0
._407:
	.word	gLinkPlayers
._222:
	ldr	r4, ._410
	lsl	r0, r7, #0x3
	sub	r0, r0, r7
	lsl	r0, r0, #0x2
	add	r0, r0, r4
	ldrh	r1, [r0, #0x18]
	mov	r0, #0x3
._406:
	eor	r0, r0, r1
	bl	sub_803FC34
	lsl	r1, r0, #0x3
	sub	r1, r1, r0
	lsl	r1, r1, #0x2
	add	r4, r4, #0x8
	add	r4, r1, r4
	b	._452
._411:
	.align	2, 0
._410:
	.word	gLinkPlayers
._223:
	ldr	r0, ._413
	ldr	r3, ._413 + 4
	add	r0, r0, r3
	ldrb	r0, [r0]
	bl	sub_803FC34
	lsl	r1, r0, #0x3
	sub	r1, r1, r0
	lsl	r1, r1, #0x2
	ldr	r0, ._413 + 8
	add	r4, r1, r0
	b	._452
._414:
	.align	2, 0
._413:
	.word	+0x2000000
	.word	0x16003
	.word	gLinkPlayers+0x8
._224:
	ldr	r4, ._416
	b	._452
._417:
	.align	2, 0
._416:
	.word	gSaveBlock2
._225:
	bl	sub_8082830
	add	r4, r0, #0
	b	._452
._226:
	ldr	r4, ._421
	ldr	r5, ._421 + 4
	add	r0, r4, r5
	ldrb	r0, [r0]
	bl	GetBankSide
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	._419	@cond_branch
	ldr	r1, ._421 + 8
	add	r0, r4, r1
	ldrb	r1, [r0]
	mov	r0, #0x64
	mul	r0, r0, r1
	ldr	r1, ._421 + 12
	add	r0, r0, r1
	mov	r1, #0x2
	mov	r2, sp
	bl	GetMonData
	mov	r0, sp
	bl	StringGetEnd10
	mov	r4, sp
	b	._420
._422:
	.align	2, 0
._421:
	.word	+0x2000000
	.word	0x16003
	.word	0x1605e
	.word	gEnemyParty
._423:
	mov	r2, r8
	add	r0, r2, r6
	strb	r1, [r0]
	add	r6, r6, #0x1
	add	r4, r4, #0x1
._420:
	ldrb	r1, [r4]
	add	r0, r1, #0
	cmp	r0, #0xff
	bne	._423	@cond_branch
._332:
	ldr	r0, ._426
	ldrh	r1, [r0]
	mov	r0, #0x8
	and	r0, r0, r1
	ldr	r4, ._426 + 4
	cmp	r0, #0
	beq	._452	@cond_branch
	ldr	r4, ._426 + 8
	b	._452
._427:
	.align	2, 0
._426:
	.word	gBattleTypeFlags
	.word	gUnknown_08400791
	.word	gUnknown_08400797
._419:
	ldr	r3, ._429
	add	r0, r4, r3
	ldrb	r1, [r0]
._333:
	mov	r0, #0x64
	mul	r0, r0, r1
	ldr	r1, ._429 + 4
._272:
	add	r0, r0, r1
	mov	r1, #0x2
	mov	r2, sp
	bl	GetMonData
._288:
	mov	r0, sp
	bl	StringGetEnd10
	mov	r4, sp
	b	._452
._430:
	.align	2, 0
._429:
	.word	0x1605e
	.word	gPlayerParty
._227:
	ldr	r0, ._433
	bl	FlagGet
	lsl	r0, r0, #0x18
	ldr	r4, ._433 + 4
	cmp	r0, #0
	beq	._452	@cond_branch
	ldr	r4, ._433 + 8
	b	._452
._434:
	.align	2, 0
._433:
	.word	0x84b
	.word	gUnknown_084009ED
	.word	gUnknown_084009F7
._230:
	ldr	r0, ._436
	b	._435
._437:
	.align	2, 0
._436:
	.word	gBankAttacker
._231:
	ldr	r0, ._440
._435:
	ldrb	r0, [r0]
	bl	GetBankSide
	lsl	r0, r0, #0x18
	ldr	r4, ._440 + 4
	cmp	r0, #0
	bne	._452	@cond_branch
	ldr	r4, ._440 + 8
	b	._452
._441:
	.align	2, 0
._440:
	.word	gBankTarget
	.word	gUnknown_084007A7
	.word	gUnknown_084007AC
._228:
	ldr	r0, ._443
	b	._442
._444:
	.align	2, 0
._443:
	.word	gBankAttacker
._229:
	ldr	r0, ._447
._442:
	ldrb	r0, [r0]
	bl	GetBankSide
	lsl	r0, r0, #0x18
	ldr	r4, ._447 + 4
	cmp	r0, #0
	bne	._452	@cond_branch
	ldr	r4, ._447 + 8
	b	._452
._448:
	.align	2, 0
._447:
	.word	gBankTarget
	.word	gUnknown_0840079C
	.word	gUnknown_084007A1
._232:
	ldr	r0, ._450
	b	._449
._451:
	.align	2, 0
._450:
	.word	gBankAttacker
._233:
	ldr	r0, ._457
._449:
	ldrb	r0, [r0]
	bl	GetBankSide
	lsl	r0, r0, #0x18
	ldr	r4, ._457 + 4
	cmp	r0, #0
	bne	._452	@cond_branch
	ldr	r4, ._457 + 8
._452:
	ldrb	r1, [r4]
	add	r0, r1, #0
	mov	r5, r9
	ldrb	r2, [r5]
	mov	r3, r9
	add	r3, r3, #0x1
	cmp	r0, #0xff
	beq	._453	@cond_branch
._454:
	mov	r5, r8
	add	r0, r5, r6
	strb	r1, [r0]
	add	r6, r6, #0x1
	add	r4, r4, #0x1
	ldrb	r1, [r4]
	add	r0, r1, #0
	cmp	r0, #0xff
	bne	._454	@cond_branch
._453:
	lsl	r0, r2, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x21
	bne	._456	@cond_branch
	mov	r0, r8
	add	r1, r0, r6
	mov	r0, #0xfc
	strb	r0, [r1]
	add	r6, r6, #0x1
	mov	r2, r8
	add	r1, r2, r6
	mov	r0, #0x9
	strb	r0, [r1]
	add	r6, r6, #0x1
	b	._456
._458:
	.align	2, 0
._457:
	.word	gBankTarget
	.word	gUnknown_084007B2
	.word	gUnknown_084007B7
._186:
	mov	r3, r8
	add	r0, r3, r6
	strb	r1, [r0]
	add	r6, r6, #0x1
	mov	r3, r9
	add	r3, r3, #0x1
._456:
	mov	r9, r3
	ldrb	r1, [r3]
._184:
	add	r0, r1, #0
	cmp	r0, #0xff
	beq	._459	@cond_branch
	bl	._460
._459:
	mov	r5, r8
	add	r1, r5, r6
	mov	r2, r9
	ldrb	r0, [r2]
	strb	r0, [r1]
	add	r6, r6, #0x1
	add	r0, r6, #0
	add	sp, sp, #0xc
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.syntax unified
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
	adds r2, r0, 0
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
	ldrb r2, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r2, r0
	cmp r2, 0xD1
	beq _08de121ADA
	cmp r2, 0xD3
	bne _08de121ADC
_08de121ADA:
	adds r5, 0x3
_08de121ADC:
	ldr r0, _08121AE4 @ =gBattleStringsTable
	adds r1, r2, 0
	subs r1, 0xC
	lsls r1, 2
	adds r1, r0
	ldr r1, [r1]
	b _08121CE2
	.align 2, 0
_08121AE4: .4byte gBattleStringsTable
_08121AE8:
	adds r1, r2, 0
	ldrb r0, [r1, 0x1]
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
	ldrb r1, [r1, 0x3]
	b _08de121B30
_08121B04:
	ldrb r0, [r1, 0x3]
	mov r8, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 8
	mov r1, r8
	b _08121B22
_08121B0C:
	ldrb r0, [r2, 0x3]
	mov r8, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 8
	mov r1, r8
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 24
_08121B22:
	orrs r1, r0
_08de121B30:
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
	ldr r0, _08de121B5C @ =gMoveNames
	adds r1, r0
	b _08121CE2
	.align 2, 0
_08de121B5C: .4byte gMoveNames
_08121B54:
	adds r0, r5, r7
	ldrb r0, [r0, 0x1]
	lsls r1, r0, 3
	subs r1, r0
	ldr r0, _08de121B6C @ =gTypeNames
	b _08121C66
	.align 2, 0
_08de121B6C: .4byte gTypeNames
_08121B64:
	adds r4, r5, r7
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
	mov r0, sp
	bl StringGetEnd10
	adds r0, r6, 0
	mov r1, sp
	bl StringAppend
	b _08121D02
	.align 2, 0
_08121B84: .4byte gPlayerParty
_08121B88:
	ldrb r1, [r4, 0x2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08de121BD4 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	adds r0, r6, 0
	mov r1, sp
	bl StringAppend
	ldr r0, _08121BA0 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08121BA8
	ldr r1, _08121BA4 @ =gUnknown_08400797
	b _08121CE2
	.align 2, 0
_08de121BD4: .4byte gEnemyParty
_08121BA0: .4byte gBattleTypeFlags
_08121BA4: .4byte gUnknown_08400797
_08121BA8:
	ldr r1, _08121BD4 @ =gUnknown_08400791
	adds r0, r6, 0
	bl StringAppend
	b _08121D02
	.align 2, 0
_08121BD4: .4byte gUnknown_08400791
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
	adds r0, r6, 0
	bl de_sub_8073174
	b _08121D02
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
