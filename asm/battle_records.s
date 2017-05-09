	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_810FF78
sub_810FF78: @ 810FF78
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r2, _0810FFA4 @ =0x01000008
	mov r0, sp
	adds r1, r4, 0
	bl CpuSet
	movs r0, 0xFF
	strb r0, [r4]
	movs r0, 0
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
	strh r0, [r4, 0xE]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810FFA4: .4byte 0x01000008
	thumb_func_end sub_810FF78

	thumb_func_start InitLinkBattleRecords_
InitLinkBattleRecords_: @ 810FFA8
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0x4
_0810FFAE:
	adds r0, r4, 0
	bl sub_810FF78
	adds r4, 0x10
	subs r5, 0x1
	cmp r5, 0
	bge _0810FFAE
	movs r0, 0x17
	movs r1, 0
	bl SetGameStat
	movs r0, 0x18
	movs r1, 0
	bl SetGameStat
	movs r0, 0x19
	movs r1, 0
	bl SetGameStat
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end InitLinkBattleRecords_

	thumb_func_start sub_810FFDC
sub_810FFDC: @ 810FFDC
	adds r1, r0, 0
	ldrh r0, [r1, 0xA]
	ldrh r2, [r1, 0xC]
	adds r0, r2
	ldrh r1, [r1, 0xE]
	adds r0, r1
	bx lr
	thumb_func_end sub_810FFDC

	thumb_func_start sub_810FFEC
sub_810FFEC: @ 810FFEC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	lsls r2, 16
	lsrs r7, r2, 16
	movs r5, 0
	ldr r6, _08110024 @ =gStringVar1
	adds r4, r0, 0
_0810FFFE:
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0x7
	bl memcpy
	movs r0, 0xFF
	strb r0, [r6, 0x7]
	adds r0, r6, 0
	mov r1, r8
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	bne _08110028
	ldrh r0, [r4, 0x8]
	cmp r0, r7
	bne _08110028
	adds r0, r5, 0
	b _08110032
	.align 2, 0
_08110024: .4byte gStringVar1
_08110028:
	adds r4, 0x10
	adds r5, 0x1
	cmp r5, 0x4
	ble _0810FFFE
	movs r0, 0x5
_08110032:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_810FFEC

	thumb_func_start sub_811003C
sub_811003C: @ 811003C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	mov r8, r0
	movs r0, 0x4
_0811004A:
	subs r2, r0, 0x1
	mov r9, r2
	cmp r2, 0
	blt _081100A4
	lsls r0, 4
	mov r1, r8
	adds r6, r1, r0
	lsls r0, r2, 4
	adds r5, r0, r1
_0811005C:
	adds r0, r6, 0
	str r2, [sp, 0x10]
	bl sub_810FFDC
	adds r4, r0, 0
	adds r0, r5, 0
	bl sub_810FFDC
	ldr r2, [sp, 0x10]
	cmp r4, r0
	ble _08110096
	mov r1, sp
	adds r0, r6, 0
	ldm r0!, {r3,r4,r7}
	stm r1!, {r3,r4,r7}
	ldr r0, [r0]
	str r0, [r1]
	adds r1, r6, 0
	adds r0, r5, 0
	ldm r0!, {r3,r4,r7}
	stm r1!, {r3,r4,r7}
	ldr r0, [r0]
	str r0, [r1]
	adds r1, r5, 0
	mov r0, sp
	ldm r0!, {r3,r4,r7}
	stm r1!, {r3,r4,r7}
	ldr r0, [r0]
	str r0, [r1]
_08110096:
	subs r5, 0x10
	movs r0, 0x1
	negs r0, r0
	add r9, r0
	mov r1, r9
	cmp r1, 0
	bge _0811005C
_081100A4:
	adds r0, r2, 0
	cmp r0, 0
	bgt _0811004A
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_811003C

	thumb_func_start sub_81100B8
sub_81100B8: @ 81100B8
	push {lr}
	adds r2, r0, 0
	cmp r1, 0x2
	beq _081100E8
	cmp r1, 0x2
	bgt _081100CA
	cmp r1, 0x1
	beq _081100D0
	b _08110112
_081100CA:
	cmp r1, 0x3
	beq _08110100
	b _08110112
_081100D0:
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _081100E4 @ =0x0000270f
	cmp r0, r1
	bls _08110112
	strh r1, [r2, 0xA]
	b _08110112
	.align 2, 0
_081100E4: .4byte 0x0000270f
_081100E8:
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	strh r0, [r2, 0xC]
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _081100FC @ =0x0000270f
	cmp r0, r1
	bls _08110112
	strh r1, [r2, 0xC]
	b _08110112
	.align 2, 0
_081100FC: .4byte 0x0000270f
_08110100:
	ldrh r0, [r2, 0xE]
	adds r0, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08110118 @ =0x0000270f
	cmp r0, r1
	bls _08110112
	strh r1, [r2, 0xE]
_08110112:
	pop {r0}
	bx r0
	.align 2, 0
_08110118: .4byte 0x0000270f
	thumb_func_end sub_81100B8

	thumb_func_start sub_811011C
sub_811011C: @ 811011C
	push {r4,lr}
	cmp r0, 0x2
	beq _08110136
	cmp r0, 0x2
	bgt _0811012C
	cmp r0, 0x1
	beq _08110132
	b _0811014E
_0811012C:
	cmp r0, 0x3
	beq _0811013A
	b _0811014E
_08110132:
	movs r4, 0x17
	b _0811013C
_08110136:
	movs r4, 0x18
	b _0811013C
_0811013A:
	movs r4, 0x19
_0811013C:
	adds r0, r4, 0
	bl GetGameStat
	ldr r1, _08110154 @ =0x0000270e
	cmp r0, r1
	bhi _0811014E
	adds r0, r4, 0
	bl IncrementGameStat
_0811014E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08110154: .4byte 0x0000270e
	thumb_func_end sub_811011C

	thumb_func_start sub_8110158
sub_8110158: @ 8110158
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r5, r0, 0
	adds r7, r1, 0
	mov r10, r3
	ldr r0, [sp, 0x20]
	lsls r2, 16
	lsrs r2, 16
	mov r9, r2
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	mov r0, r10
	bl sub_811011C
	adds r0, r5, 0
	bl sub_811003C
	adds r0, r5, 0
	adds r1, r7, 0
	mov r2, r9
	bl sub_810FFEC
	adds r6, r0, 0
	cmp r6, 0x5
	bne _081101CC
	movs r6, 0x4
	adds r4, r5, 0
	adds r4, 0x40
	adds r0, r4, 0
	bl sub_810FF78
	mov r0, r8
	cmp r0, 0x1
	bne _081101BA
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x15
	strb r0, [r4, 0x1]
	adds r0, r5, 0
	adds r0, 0x42
	adds r1, r7, 0
	movs r2, 0x5
	bl StringCopyN
	b _081101C4
_081101BA:
	adds r0, r4, 0
	adds r1, r7, 0
	movs r2, 0x7
	bl StringCopyN
_081101C4:
	lsls r0, r6, 4
	adds r0, r5, r0
	mov r1, r9
	strh r1, [r0, 0x8]
_081101CC:
	lsls r0, r6, 4
	adds r0, r5, r0
	mov r1, r10
	bl sub_81100B8
	adds r0, r5, 0
	bl sub_811003C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8110158

	thumb_func_start InitLinkBattleRecords
InitLinkBattleRecords: @ 81101EC
	push {lr}
	ldr r0, _081101F8 @ =gSaveBlock1 + 0x30B8
	bl InitLinkBattleRecords_
	pop {r0}
	bx r0
	.align 2, 0
_081101F8: .4byte gSaveBlock1 + 0x30B8
	thumb_func_end InitLinkBattleRecords

	thumb_func_start sub_81101FC
sub_81101FC: @ 81101FC
	push {lr}
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 3
	ldr r0, _08110220 @ =gTrainerCards + 0x14
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08110224 @ =0x0000270f
	cmp r0, r2
	bls _0811021A
	strh r2, [r1]
_0811021A:
	pop {r0}
	bx r0
	.align 2, 0
_08110220: .4byte gTrainerCards + 0x14
_08110224: .4byte 0x0000270f
	thumb_func_end sub_81101FC

	thumb_func_start sub_8110228
sub_8110228: @ 8110228
	push {lr}
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 3
	ldr r0, _0811024C @ =gTrainerCards + 0x16
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08110250 @ =0x0000270f
	cmp r0, r2
	bls _08110246
	strh r2, [r1]
_08110246:
	pop {r0}
	bx r0
	.align 2, 0
_0811024C: .4byte gTrainerCards + 0x16
_08110250: .4byte 0x0000270f
	thumb_func_end sub_8110228

	thumb_func_start sub_8110254
sub_8110254: @ 8110254
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08110268 @ =gUnknown_02024D26
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0811026C
	cmp r0, 0x2
	beq _0811027A
	b _08110288
	.align 2, 0
_08110268: .4byte gUnknown_02024D26
_0811026C:
	eors r0, r4
	bl sub_81101FC
	adds r0, r4, 0
	bl sub_8110228
	b _08110288
_0811027A:
	movs r0, 0x1
	eors r0, r4
	bl sub_8110228
	adds r0, r4, 0
	bl sub_81101FC
_08110288:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8110254

	thumb_func_start sub_8110290
sub_8110290: @ 8110290
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	bl sub_8110254
	ldr r0, _081102D4 @ =gSaveBlock1 + 0x30B8
	lsls r2, r4, 3
	subs r2, r4
	lsls r2, 3
	ldr r3, _081102D8 @ =gTrainerCards + 0x30
	adds r1, r2, r3
	subs r3, 0x30
	adds r2, r3
	ldrh r2, [r2, 0xE]
	ldr r3, _081102DC @ =gUnknown_02024D26
	ldrb r3, [r3]
	ldr r6, _081102E0 @ =gLinkPlayers
	ldr r5, _081102E4 @ =gLinkPlayerMapObjects
	lsls r4, 2
	adds r4, r5
	ldrb r5, [r4, 0x1]
	lsls r4, r5, 3
	subs r4, r5
	lsls r4, 2
	adds r4, r6
	ldrb r4, [r4, 0x1A]
	str r4, [sp]
	bl sub_8110158
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081102D4: .4byte gSaveBlock1 + 0x30B8
_081102D8: .4byte gTrainerCards + 0x30
_081102DC: .4byte gUnknown_02024D26
_081102E0: .4byte gLinkPlayers
_081102E4: .4byte gLinkPlayerMapObjects
	thumb_func_end sub_8110290

	thumb_func_start PrintLinkBattleWinsLossesDraws
PrintLinkBattleWinsLossesDraws: @ 81102E8
	push {r4,lr}
	ldr r4, _08110338 @ =gStringVar1
	movs r0, 0x17
	bl GetGameStat
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN_DigitWidth6
	ldr r4, _0811033C @ =gStringVar2
	movs r0, 0x18
	bl GetGameStat
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN_DigitWidth6
	ldr r4, _08110340 @ =gStringVar3
	movs r0, 0x19
	bl GetGameStat
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN_DigitWidth6
	ldr r0, _08110344 @ =gOtherText_WinRecord
	movs r1, 0x3
	movs r2, 0x3
	bl MenuPrint
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08110338: .4byte gStringVar1
_0811033C: .4byte gStringVar2
_08110340: .4byte gStringVar3
_08110344: .4byte gOtherText_WinRecord
	thumb_func_end PrintLinkBattleWinsLossesDraws

	thumb_func_start PrintLinkBattleRecord
PrintLinkBattleRecord: @ 8110348
	push {r4-r7,lr}
	sub sp, 0x10
	adds r7, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	ldrh r0, [r7, 0xA]
	cmp r0, 0
	bne _081103C0
	ldr r0, [r7, 0xC]
	cmp r0, 0
	bne _081103C0
	mov r0, sp
	movs r2, 0xFC
	strb r2, [r0]
	mov r1, sp
	movs r0, 0x14
	strb r0, [r1, 0x1]
	movs r0, 0x6
	strb r0, [r1, 0x2]
	mov r0, sp
	strb r2, [r0, 0x3]
	movs r0, 0x11
	strb r0, [r1, 0x4]
	movs r0, 0x1
	strb r0, [r1, 0x5]
	mov r4, sp
	adds r4, 0x6
	ldr r1, _081103B8 @ =gOtherText_SevenDashes
	adds r0, r4, 0
	bl StringCopy
	mov r0, sp
	movs r1, 0x3
	adds r2, r6, 0
	bl MenuPrint
	ldr r1, _081103BC @ =gOtherText_FourDashes
	adds r0, r4, 0
	bl StringCopy
	mov r0, sp
	movs r1, 0xB
	adds r2, r6, 0
	bl MenuPrint
	mov r0, sp
	movs r1, 0x11
	adds r2, r6, 0
	bl MenuPrint
	mov r0, sp
	movs r1, 0x17
	adds r2, r6, 0
	bl MenuPrint
	b _0811042E
	.align 2, 0
_081103B8: .4byte gOtherText_SevenDashes
_081103BC: .4byte gOtherText_FourDashes
_081103C0:
	ldr r4, _08110438 @ =gStringVar1
	adds r0, r4, 0
	movs r1, 0x8
	bl StringFillWithTerminator
	adds r0, r4, 0
	adds r1, r7, 0
	movs r2, 0x7
	bl StringCopyN
	adds r0, r4, 0
	movs r1, 0x3
	adds r2, r6, 0
	bl MenuPrint
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x14
	strb r0, [r4, 0x1]
	movs r0, 0x6
	strb r0, [r4, 0x2]
	adds r5, r4, 0x3
	ldrh r1, [r7, 0xA]
	adds r0, r5, 0
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	adds r0, r4, 0
	movs r1, 0xB
	adds r2, r6, 0
	bl MenuPrint
	ldrh r1, [r7, 0xC]
	adds r0, r5, 0
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	adds r0, r4, 0
	movs r1, 0x11
	adds r2, r6, 0
	bl MenuPrint
	ldrh r1, [r7, 0xE]
	adds r0, r5, 0
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	adds r0, r4, 0
	movs r1, 0x17
	adds r2, r6, 0
	bl MenuPrint
_0811042E:
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08110438: .4byte gStringVar1
	thumb_func_end PrintLinkBattleRecord

.section .text_8110494

	thumb_func_start sub_8110494
sub_8110494: @ 8110494
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _081104B4 @ =gSaveBlock2 + 0xA8
	ldr r2, _081104B8 @ =0x000004ae
	adds r1, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x6
	bhi _081104E0
	lsls r0, 2
	ldr r1, _081104BC @ =_081104C0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081104B4: .4byte gSaveBlock2 + 0xA8
_081104B8: .4byte 0x000004ae
_081104BC: .4byte _081104C0
	.align 2, 0
_081104C0:
	.4byte _081104E0
	.4byte _081104E0
	.4byte _081104DC
	.4byte _081104DC
	.4byte _081104E0
	.4byte _081104E0
	.4byte _081104DC
_081104DC:
	movs r0, 0x1
	b _081104E2
_081104E0:
	movs r0, 0
_081104E2:
	pop {r1}
	bx r1
	thumb_func_end sub_8110494

	thumb_func_start sub_81104E8
sub_81104E8: @ 81104E8
	push {r4-r6,lr}
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 24
	lsrs r2, 24
	adds r5, r2, 0
	lsls r3, 24
	lsrs r3, 24
	adds r6, r3, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl MenuPrint
	ldr r0, _0811052C @ =0x0000270f
	cmp r4, r0
	bls _0811050A
	adds r4, r0, 0
_0811050A:
	ldr r0, _08110530 @ =gStringVar1
	adds r1, r4, 0
	movs r2, 0x18
	movs r3, 0x1
	bl sub_8072C14
	ldr r0, _08110534 @ =gOtherText_WinStreak
	adds r1, r5, 0x7
	lsls r1, 24
	lsrs r1, 24
	adds r2, r6, 0
	bl MenuPrint
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811052C: .4byte 0x0000270f
_08110530: .4byte gStringVar1
_08110534: .4byte gOtherText_WinStreak
	thumb_func_end sub_81104E8

	thumb_func_start sub_8110538
sub_8110538: @ 8110538
	push {r4,lr}
	adds r4, r1, 0
	adds r3, r2, 0
	lsls r0, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r1, _08110564 @ =gSaveBlock2 + 0xA8
	lsrs r0, 23
	movs r2, 0x97
	lsls r2, 3
	adds r1, r2
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _08110568 @ =gOtherText_Record
	adds r2, r4, 0
	bl sub_81104E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08110564: .4byte gSaveBlock2 + 0xA8
_08110568: .4byte gOtherText_Record
	thumb_func_end sub_8110538

	thumb_func_start sub_811056C
sub_811056C: @ 811056C
	push {lr}
	lsls r0, 24
	ldr r1, _08110588 @ =gSaveBlock2
	lsrs r0, 23
	ldr r2, _0811058C @ =0x00000574
	adds r1, r2
	adds r0, r1
	ldrh r0, [r0]
	ldr r1, _08110590 @ =0x0000270f
	cmp r0, r1
	bls _08110584
	adds r0, r1, 0
_08110584:
	pop {r1}
	bx r1
	.align 2, 0
_08110588: .4byte gSaveBlock2
_0811058C: .4byte 0x00000574
_08110590: .4byte 0x0000270f
	thumb_func_end sub_811056C

	thumb_func_start sub_8110594
sub_8110594: @ 8110594
	push {r4-r7,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r7, r2, 24
	adds r0, r4, 0
	bl sub_811056C
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	bl sub_8110494
	cmp r0, 0x1
	bne _081105CC
	ldr r0, _081105C8 @ =gOtherText_Current
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_81104E8
	b _081105D8
	.align 2, 0
_081105C8: .4byte gOtherText_Current
_081105CC:
	ldr r0, _081105E0 @ =gOtherText_Prev
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_81104E8
_081105D8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081105E0: .4byte gOtherText_Prev
	thumb_func_end sub_8110594

	thumb_func_start ShowBattleTowerRecords
ShowBattleTowerRecords: @ 81105E4
	push {r4,lr}
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0x1B
	movs r3, 0x11
	bl MenuDrawTextWindow
	ldr r0, _08110658 @ =gOtherText_BattleTowerResults
	movs r1, 0x3
	movs r2, 0x2
	movs r3, 0xC8
	bl sub_8072BD8
	ldr r0, _0811065C @ =gOtherText_Lv50
	movs r1, 0x5
	movs r2, 0x6
	bl MenuPrint
	ldr r0, _08110660 @ =gOtherText_Lv100
	movs r1, 0x5
	movs r2, 0xC
	bl MenuPrint
	movs r4, 0x5
_08110614:
	lsls r1, r4, 24
	lsrs r1, 24
	movs r0, 0xAE
	movs r2, 0xA
	bl sub_8071F60
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x19
	bls _08110614
	movs r0, 0
	movs r1, 0xA
	movs r2, 0x6
	bl sub_8110594
	movs r0, 0
	movs r1, 0xA
	movs r2, 0x8
	bl sub_8110538
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0xC
	bl sub_8110594
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0xE
	bl sub_8110538
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08110658: .4byte gOtherText_BattleTowerResults
_0811065C: .4byte gOtherText_Lv50
_08110660: .4byte gOtherText_Lv100
	thumb_func_end ShowBattleTowerRecords

	.align 2, 0 @ Don't pad with nop.
