	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_811EC68
sub_811EC68: @ 811EC68
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x34
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0811ECA0 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 9
	ldr r2, _0811ECA4 @ =gUnknown_02023A63
	adds r3, r0, r2
	adds r6, r3, 0
	subs r1, r2, 0x2
	adds r0, r1
	ldrb r0, [r0]
	adds r7, r2, 0
	cmp r0, 0x3B
	bls _0811EC94
	bl _0811F62E
_0811EC94:
	lsls r0, 2
	ldr r1, _0811ECA8 @ =_0811ECAC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811ECA0: .4byte gUnknown_02024A60
_0811ECA4: .4byte gUnknown_02023A63
_0811ECA8: .4byte _0811ECAC
	.align 2, 0
_0811ECAC:
	.4byte _0811ED9C
	.4byte _0811EF34
	.4byte _0811EF54
	.4byte _0811EF74
	.4byte _0811EFCC
	.4byte _0811EFCC
	.4byte _0811EFCC
	.4byte _0811EFCC
	.4byte _0811EFF4
	.4byte _0811F058
	.4byte _0811F058
	.4byte _0811F058
	.4byte _0811F058
	.4byte _0811F62E
	.4byte _0811F62E
	.4byte _0811F62E
	.4byte _0811F62E
	.4byte _0811F088
	.4byte _0811F0A8
	.4byte _0811F0C8
	.4byte _0811F0E8
	.4byte _0811F108
	.4byte _0811F128
	.4byte _0811F148
	.4byte _0811F168
	.4byte _0811F188
	.4byte _0811F1A8
	.4byte _0811F1C8
	.4byte _0811F1E8
	.4byte _0811F208
	.4byte _0811F228
	.4byte _0811F248
	.4byte _0811F2B8
	.4byte _0811F2D8
	.4byte _0811F2F8
	.4byte _0811F318
	.4byte _0811F338
	.4byte _0811F358
	.4byte _0811F378
	.4byte _0811F398
	.4byte _0811F3B8
	.4byte _0811F3D8
	.4byte _0811F3F8
	.4byte _0811F418
	.4byte _0811F438
	.4byte _0811F458
	.4byte _0811F478
	.4byte _0811F498
	.4byte _0811F4B8
	.4byte _0811F4D8
	.4byte _0811F4F8
	.4byte _0811F518
	.4byte _0811F538
	.4byte _0811F558
	.4byte _0811F578
	.4byte _0811F598
	.4byte _0811F5B8
	.4byte _0811F5D8
	.4byte _0811F5F8
	.4byte _0811F618
_0811ED9C:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0811EF30 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	adds r2, r6, 0
	bl SetMonData
	adds r2, r6, 0
	adds r2, 0x2E
	adds r0, r4, 0
	movs r1, 0xC
	bl SetMonData
	movs r0, 0
	mov r8, r0
	movs r0, 0x3B
	adds r0, r6
	mov r10, r0
	adds r0, r6, 0
	adds r0, 0x2B
	str r0, [sp, 0x20]
	adds r0, 0x19
	str r0, [sp, 0x28]
	adds r0, 0x4
	str r0, [sp, 0x2C]
	adds r0, 0x4
	str r0, [sp, 0x30]
	subs r0, 0x22
	str r0, [sp, 0x1C]
	subs r0, 0x2
	str r0, [sp, 0x18]
	adds r0, 0x4
	str r0, [sp, 0x24]
	adds r0, r6, 0x2
	str r0, [sp, 0x4]
	adds r0, r6, 0x4
	str r0, [sp, 0x8]
	adds r0, r6, 0x6
	str r0, [sp, 0xC]
	adds r0, 0x2
	str r0, [sp, 0x10]
	adds r0, 0x2
	str r0, [sp, 0x14]
	mov r9, r4
	adds r7, r6, 0
	adds r7, 0x24
	adds r4, r6, 0
	adds r4, 0xC
_0811EE02:
	mov r1, r8
	adds r1, 0xD
	mov r0, r9
	adds r2, r4, 0
	bl SetMonData
	mov r1, r8
	adds r1, 0x11
	mov r0, r9
	adds r2, r7, 0
	bl SetMonData
	adds r7, 0x1
	adds r4, 0x2
	movs r0, 0x1
	add r8, r0
	mov r0, r8
	cmp r0, 0x3
	ble _0811EE02
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0811EF30 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x15
	mov r2, r10
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x20
	ldr r2, [sp, 0x20]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x19
	ldr r2, [sp, 0x28]
	bl SetMonData
	ldrb r0, [r6, 0x14]
	lsls r0, 27
	lsrs r0, 27
	mov r1, sp
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x27
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r6, 0x14]
	lsls r0, 22
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x28
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r6, 0x15]
	lsls r0, 25
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x29
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldr r0, [r6, 0x14]
	lsls r0, 12
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2A
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r6, 0x16]
	lsls r0, 23
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2B
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r6, 0x17]
	lsls r0, 26
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2C
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0
	ldr r2, [sp, 0x2C]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x37
	ldr r2, [sp, 0x30]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x38
	ldr r2, [sp, 0x1C]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x39
	ldr r2, [sp, 0x18]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3A
	ldr r2, [sp, 0x24]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3B
	ldr r2, [sp, 0x4]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3C
	ldr r2, [sp, 0x8]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3D
	ldr r2, [sp, 0xC]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3E
	ldr r2, [sp, 0x10]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3F
	ldr r2, [sp, 0x14]
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811EF30: .4byte gPlayerParty
_0811EF34:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EF4C @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811EF50 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0xB
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811EF4C: .4byte gPlayerParty
_0811EF50: .4byte gUnknown_02024A60
_0811EF54:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EF6C @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811EF70 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0xC
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811EF6C: .4byte gPlayerParty
_0811EF70: .4byte gUnknown_02024A60
_0811EF74:
	movs r0, 0
	mov r8, r0
	movs r0, 0xC
	adds r0, r3
	mov r9, r0
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0811EFC8 @ =gPlayerParty
	adds r7, r1, r0
	adds r6, r3, 0
	adds r6, 0x8
	adds r4, r3, 0
_0811EF8E:
	mov r1, r8
	adds r1, 0xD
	adds r0, r7, 0
	adds r2, r4, 0
	bl SetMonData
	mov r1, r8
	adds r1, 0x11
	adds r0, r7, 0
	adds r2, r6, 0
	bl SetMonData
	adds r6, 0x1
	adds r4, 0x2
	movs r0, 0x1
	add r8, r0
	mov r0, r8
	cmp r0, 0x3
	ble _0811EF8E
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EFC8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x15
	mov r2, r9
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811EFC8: .4byte gPlayerParty
_0811EFCC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EFE8 @ =gPlayerParty
	adds r0, r1
	ldr r3, _0811EFEC @ =gUnknown_02023A60
	ldr r1, _0811EFF0 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, 0x9
	b _0811F070
	.align 2, 0
_0811EFE8: .4byte gPlayerParty
_0811EFEC: .4byte gUnknown_02023A60
_0811EFF0: .4byte gUnknown_02024A60
_0811EFF4:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0811F050 @ =gPlayerParty
	adds r4, r0
	ldr r5, _0811F054 @ =gUnknown_02024A60
	ldrb r2, [r5]
	lsls r2, 9
	adds r2, r7
	adds r0, r4, 0
	movs r1, 0x11
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x1
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x12
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x2
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x13
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x3
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x14
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x4
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x15
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F050: .4byte gPlayerParty
_0811F054: .4byte gUnknown_02024A60
_0811F058:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F07C @ =gPlayerParty
	adds r0, r1
	ldr r3, _0811F080 @ =gUnknown_02023A60
	ldr r1, _0811F084 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, 0x8
_0811F070:
	adds r3, 0x3
	adds r2, r3
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F07C: .4byte gPlayerParty
_0811F080: .4byte gUnknown_02023A60
_0811F084: .4byte gUnknown_02024A60
_0811F088:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F0A0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F0A4 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F0A0: .4byte gPlayerParty
_0811F0A4: .4byte gUnknown_02024A60
_0811F0A8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F0C0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F0C4 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x19
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F0C0: .4byte gPlayerParty
_0811F0C4: .4byte gUnknown_02024A60
_0811F0C8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F0E0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F0E4 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1A
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F0E0: .4byte gPlayerParty
_0811F0E4: .4byte gUnknown_02024A60
_0811F0E8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F100 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F104 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1B
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F100: .4byte gPlayerParty
_0811F104: .4byte gUnknown_02024A60
_0811F108:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F120 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F124 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1C
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F120: .4byte gPlayerParty
_0811F124: .4byte gUnknown_02024A60
_0811F128:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F140 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F144 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1D
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F140: .4byte gPlayerParty
_0811F144: .4byte gUnknown_02024A60
_0811F148:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F160 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F164 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1E
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F160: .4byte gPlayerParty
_0811F164: .4byte gUnknown_02024A60
_0811F168:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F180 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F184 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1F
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F180: .4byte gPlayerParty
_0811F184: .4byte gUnknown_02024A60
_0811F188:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F1A0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F1A4 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x20
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F1A0: .4byte gPlayerParty
_0811F1A4: .4byte gUnknown_02024A60
_0811F1A8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F1C0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F1C4 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x22
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F1C0: .4byte gPlayerParty
_0811F1C4: .4byte gUnknown_02024A60
_0811F1C8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F1E0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F1E4 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x23
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F1E0: .4byte gPlayerParty
_0811F1E4: .4byte gUnknown_02024A60
_0811F1E8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F200 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F204 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x24
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F200: .4byte gPlayerParty
_0811F204: .4byte gUnknown_02024A60
_0811F208:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F220 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F224 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x25
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F220: .4byte gPlayerParty
_0811F224: .4byte gUnknown_02024A60
_0811F228:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F240 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F244 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x26
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F240: .4byte gPlayerParty
_0811F244: .4byte gUnknown_02024A60
_0811F248:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0811F2B0 @ =gPlayerParty
	adds r4, r0
	ldr r5, _0811F2B4 @ =gUnknown_02024A60
	ldrb r2, [r5]
	lsls r2, 9
	adds r2, r7
	adds r0, r4, 0
	movs r1, 0x27
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x1
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x28
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x2
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x29
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x3
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x2A
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x4
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x2B
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x5
	adds r2, r0
	adds r0, r4, 0
	b _0811F368
	.align 2, 0
_0811F2B0: .4byte gPlayerParty
_0811F2B4: .4byte gUnknown_02024A60
_0811F2B8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F2D0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F2D4 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x27
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F2D0: .4byte gPlayerParty
_0811F2D4: .4byte gUnknown_02024A60
_0811F2D8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F2F0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F2F4 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x28
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F2F0: .4byte gPlayerParty
_0811F2F4: .4byte gUnknown_02024A60
_0811F2F8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F310 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F314 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x29
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F310: .4byte gPlayerParty
_0811F314: .4byte gUnknown_02024A60
_0811F318:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F330 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F334 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2A
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F330: .4byte gPlayerParty
_0811F334: .4byte gUnknown_02024A60
_0811F338:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F350 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F354 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2B
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F350: .4byte gPlayerParty
_0811F354: .4byte gUnknown_02024A60
_0811F358:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F370 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F374 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
_0811F368:
	movs r1, 0x2C
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F370: .4byte gPlayerParty
_0811F374: .4byte gUnknown_02024A60
_0811F378:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F390 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F394 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F390: .4byte gPlayerParty
_0811F394: .4byte gUnknown_02024A60
_0811F398:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F3B0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F3B4 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x9
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F3B0: .4byte gPlayerParty
_0811F3B4: .4byte gUnknown_02024A60
_0811F3B8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F3D0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F3D4 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x37
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F3D0: .4byte gPlayerParty
_0811F3D4: .4byte gUnknown_02024A60
_0811F3D8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F3F0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F3F4 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x38
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F3F0: .4byte gPlayerParty
_0811F3F4: .4byte gUnknown_02024A60
_0811F3F8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F410 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F414 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x39
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F410: .4byte gPlayerParty
_0811F414: .4byte gUnknown_02024A60
_0811F418:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F430 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F434 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3A
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F430: .4byte gPlayerParty
_0811F434: .4byte gUnknown_02024A60
_0811F438:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F450 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F454 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3B
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F450: .4byte gPlayerParty
_0811F454: .4byte gUnknown_02024A60
_0811F458:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F470 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F474 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3C
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F470: .4byte gPlayerParty
_0811F474: .4byte gUnknown_02024A60
_0811F478:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F490 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F494 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3D
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F490: .4byte gPlayerParty
_0811F494: .4byte gUnknown_02024A60
_0811F498:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F4B0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F4B4 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3E
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F4B0: .4byte gPlayerParty
_0811F4B4: .4byte gUnknown_02024A60
_0811F4B8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F4D0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F4D4 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3F
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F4D0: .4byte gPlayerParty
_0811F4D4: .4byte gUnknown_02024A60
_0811F4D8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F4F0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F4F4 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x16
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F4F0: .4byte gPlayerParty
_0811F4F4: .4byte gUnknown_02024A60
_0811F4F8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F510 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F514 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x17
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F510: .4byte gPlayerParty
_0811F514: .4byte gUnknown_02024A60
_0811F518:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F530 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F534 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x18
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F530: .4byte gPlayerParty
_0811F534: .4byte gUnknown_02024A60
_0811F538:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F550 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F554 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x21
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F550: .4byte gPlayerParty
_0811F554: .4byte gUnknown_02024A60
_0811F558:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F570 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F574 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2F
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F570: .4byte gPlayerParty
_0811F574: .4byte gUnknown_02024A60
_0811F578:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F590 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F594 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x30
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F590: .4byte gPlayerParty
_0811F594: .4byte gUnknown_02024A60
_0811F598:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F5B0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F5B4 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x32
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F5B0: .4byte gPlayerParty
_0811F5B4: .4byte gUnknown_02024A60
_0811F5B8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F5D0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F5D4 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x33
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F5D0: .4byte gPlayerParty
_0811F5D4: .4byte gUnknown_02024A60
_0811F5D8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F5F0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F5F4 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x34
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F5F0: .4byte gPlayerParty
_0811F5F4: .4byte gUnknown_02024A60
_0811F5F8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F610 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F614 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x35
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F610: .4byte gPlayerParty
_0811F614: .4byte gUnknown_02024A60
_0811F618:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F658 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F65C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x36
	bl SetMonData
_0811F62E:
	ldr r2, _0811F660 @ =gUnknown_02024A6A
	ldr r0, _0811F65C @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _0811F658 @ =gPlayerParty
	adds r0, r2
	bl sub_80324F8
	add sp, 0x34
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811F658: .4byte gPlayerParty
_0811F65C: .4byte gUnknown_02024A60
_0811F660: .4byte gUnknown_02024A6A
	thumb_func_end sub_811EC68

	thumb_func_start sub_811F664
sub_811F664: @ 811F664
	push {r4-r7,lr}
	ldr r1, _0811F6C8 @ =gUnknown_02024A6A
	ldr r7, _0811F6CC @ =gUnknown_02024A60
	ldrb r2, [r7]
	lsls r0, r2, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	adds r3, r1, 0
	muls r3, r0
	ldr r4, _0811F6D0 @ =gUnknown_02023A60
	lsls r2, 9
	adds r0, r4, 0x1
	adds r0, r2, r0
	ldrb r0, [r0]
	ldr r1, _0811F6D4 @ =gPlayerParty
	adds r0, r1
	adds r5, r3, r0
	movs r3, 0
	adds r0, r4, 0x2
	adds r2, r0
	ldrb r2, [r2]
	cmp r3, r2
	bcs _0811F6BC
	adds r6, r4, 0
	adds r2, r7, 0
	adds r4, r0, 0
_0811F69A:
	adds r1, r5, r3
	ldrb r0, [r2]
	lsls r0, 9
	adds r0, 0x3
	adds r0, r3, r0
	adds r0, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	ldrb r0, [r2]
	lsls r0, 9
	adds r0, r4
	ldrb r0, [r0]
	cmp r3, r0
	bcc _0811F69A
_0811F6BC:
	bl dp01_tbl3_exec_completed
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811F6C8: .4byte gUnknown_02024A6A
_0811F6CC: .4byte gUnknown_02024A60
_0811F6D0: .4byte gUnknown_02023A60
_0811F6D4: .4byte gPlayerParty
	thumb_func_end sub_811F664

	thumb_func_start sub_811F6D8
sub_811F6D8: @ 811F6D8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r0, _0811F7CC @ =gUnknown_02024A6A
	mov r8, r0
	ldr r6, _0811F7D0 @ =gUnknown_02024A60
	ldrb r1, [r6]
	lsls r0, r1, 1
	add r0, r8
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _0811F7D4 @ =gPlayerParty
	adds r0, r4
	bl sub_80318FC
	ldrb r0, [r6]
	lsls r0, 1
	add r0, r8
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r4
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrb r0, [r6]
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _0811F7D8 @ =gUnknown_02024E8C
	mov r8, r0
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8077ABC
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldrb r0, [r6]
	bl sub_8077F68
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r6]
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r8
	adds r1, r5, 0
	adds r2, r4, 0
	bl CreateSprite
	ldr r4, _0811F7DC @ =gUnknown_02024BE0
	ldrb r1, [r6]
	adds r1, r4
	strb r0, [r1]
	ldr r5, _0811F7E0 @ =gSprites
	ldrb r0, [r6]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _0811F7E4 @ =0x0000ff10
	strh r1, [r0, 0x24]
	ldrb r2, [r6]
	adds r0, r2, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x2E]
	ldrb r3, [r6]
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r2, [r6]
	adds r4, r2, r4
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _0811F7E8 @ =gBattleMonForms
	adds r2, r1
	ldrb r1, [r2]
	bl StartSpriteAnim
	ldr r1, _0811F7EC @ =gUnknown_03004330
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811F7F0 @ =sub_811DDE8
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811F7CC: .4byte gUnknown_02024A6A
_0811F7D0: .4byte gUnknown_02024A60
_0811F7D4: .4byte gPlayerParty
_0811F7D8: .4byte gUnknown_02024E8C
_0811F7DC: .4byte gUnknown_02024BE0
_0811F7E0: .4byte gSprites
_0811F7E4: .4byte 0x0000ff10
_0811F7E8: .4byte gBattleMonForms
_0811F7EC: .4byte gUnknown_03004330
_0811F7F0: .4byte sub_811DDE8
	thumb_func_end sub_811F6D8

	thumb_func_start sub_811F7F4
sub_811F7F4: @ 811F7F4
	push {r4-r6,lr}
	ldr r5, _0811F84C @ =gUnknown_02024A60
	ldrb r0, [r5]
	ldr r4, _0811F850 @ =gUnknown_02023A60
	lsls r1, r0, 9
	adds r6, r4, 0x2
	adds r1, r6
	ldrb r1, [r1]
	bl sub_8032AA8
	ldr r2, _0811F854 @ =gUnknown_02024A6A
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r2
	lsls r0, 9
	adds r4, 0x1
	adds r0, r4
	ldrb r0, [r0]
	strh r0, [r1]
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _0811F858 @ =gPlayerParty
	adds r0, r2
	bl sub_80318FC
	ldrb r0, [r5]
	lsls r1, r0, 9
	adds r1, r6
	ldrb r1, [r1]
	bl sub_811F864
	ldr r1, _0811F85C @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811F860 @ =sub_811E1BC
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811F84C: .4byte gUnknown_02024A60
_0811F850: .4byte gUnknown_02023A60
_0811F854: .4byte gUnknown_02024A6A
_0811F858: .4byte gPlayerParty
_0811F85C: .4byte gUnknown_03004330
_0811F860: .4byte sub_811E1BC
	thumb_func_end sub_811F7F4

	thumb_func_start sub_811F864
sub_811F864: @ 811F864
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl sub_8032AA8
	ldr r0, _0811F9A8 @ =gUnknown_02024A6A
	lsls r2, r6, 1
	adds r2, r0
	ldr r0, _0811F9AC @ =gUnknown_02023A60
	lsls r1, r6, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	strh r0, [r2]
	ldrh r1, [r2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0811F9B0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	mov r8, r0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _0811F9B4 @ =sub_80312F0
	bl CreateInvisibleSpriteWithCallback
	ldr r1, _0811F9B8 @ =gUnknown_0300434C
	mov r9, r1
	add r9, r6
	mov r1, r9
	strb r0, [r1]
	adds r0, r6, 0
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _0811F9BC @ =gUnknown_02024E8C
	mov r10, r0
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_8077ABC
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	bl sub_8077F68
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r10
	adds r1, r5, 0
	adds r2, r4, 0
	bl CreateSprite
	ldr r4, _0811F9C0 @ =gUnknown_02024BE0
	adds r4, r6, r4
	strb r0, [r4]
	ldr r5, _0811F9C4 @ =gSprites
	mov r0, r9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r4]
	strh r1, [r0, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r6, [r0, 0x2E]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x32]
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, r6, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _0811F9C8 @ =gBattleMonForms
	adds r6, r1
	ldrb r1, [r6]
	bl StartSpriteAnim
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0811F9CC @ =SpriteCallbackDummy
	str r1, [r0]
	movs r0, 0
	movs r1, 0xFF
	bl sub_8046400
	mov r1, r9
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x2E]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811F9A8: .4byte gUnknown_02024A6A
_0811F9AC: .4byte gUnknown_02023A60
_0811F9B0: .4byte gPlayerParty
_0811F9B4: .4byte sub_80312F0
_0811F9B8: .4byte gUnknown_0300434C
_0811F9BC: .4byte gUnknown_02024E8C
_0811F9C0: .4byte gUnknown_02024BE0
_0811F9C4: .4byte gSprites
_0811F9C8: .4byte gBattleMonForms
_0811F9CC: .4byte SpriteCallbackDummy
	thumb_func_end sub_811F864

	thumb_func_start sub_811F9D0
sub_811F9D0: @ 811F9D0
	push {r4-r6,lr}
	ldr r1, _0811FA00 @ =gUnknown_02023A60
	ldr r6, _0811FA04 @ =gUnknown_02024A60
	ldrb r2, [r6]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r3, [r0]
	cmp r3, 0
	bne _0811FA14
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r1, _0811FA08 @ =0x02017810
	adds r0, r1
	strb r3, [r0, 0x4]
	ldr r1, _0811FA0C @ =gUnknown_03004330
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811FA10 @ =sub_811FA5C
	str r1, [r0]
	b _0811FA4A
	.align 2, 0
_0811FA00: .4byte gUnknown_02023A60
_0811FA04: .4byte gUnknown_02024A60
_0811FA08: .4byte 0x02017810
_0811FA0C: .4byte gUnknown_03004330
_0811FA10: .4byte sub_811FA5C
_0811FA14:
	ldr r5, _0811FA50 @ =gUnknown_02024BE0
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0811FA54 @ =gSprites
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r1, _0811FA58 @ =gUnknown_03004340
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8043DB0
	bl dp01_tbl3_exec_completed
_0811FA4A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811FA50: .4byte gUnknown_02024BE0
_0811FA54: .4byte gSprites
_0811FA58: .4byte gUnknown_03004340
	thumb_func_end sub_811F9D0

	thumb_func_start sub_811FA5C
sub_811FA5C: @ 811FA5C
	push {r4,r5,lr}
	ldr r5, _0811FA78 @ =gUnknown_02024A60
	ldrb r2, [r5]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r4, _0811FA7C @ =0x02017810
	adds r3, r0, r4
	ldrb r0, [r3, 0x4]
	cmp r0, 0
	beq _0811FA80
	cmp r0, 0x1
	beq _0811FAAC
	b _0811FAD4
	.align 2, 0
_0811FA78: .4byte gUnknown_02024A60
_0811FA7C: .4byte 0x02017810
_0811FA80:
	lsls r0, r2, 2
	adds r1, r4, 0
	subs r1, 0x10
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0811FA9C
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl move_anim_start_t4
_0811FA9C:
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	movs r0, 0x1
	strb r0, [r1, 0x4]
	b _0811FAD4
_0811FAAC:
	ldrb r1, [r3]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0811FAD4
	strb r0, [r3, 0x4]
	ldrb r2, [r5]
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x1
	bl move_anim_start_t4
	ldr r1, _0811FADC @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811FAE0 @ =sub_811DF34
	str r1, [r0]
_0811FAD4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811FADC: .4byte gUnknown_03004330
_0811FAE0: .4byte sub_811DF34
	thumb_func_end sub_811FA5C

	thumb_func_start sub_811FAE4
sub_811FAE4: @ 811FAE4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r0, _0811FB14 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0811FB24
	ldr r6, _0811FB18 @ =gUnknown_02024A60
	ldrb r0, [r6]
	bl battle_get_per_side_status
	movs r1, 0x2
	ands r1, r0
	ldr r5, _0811FB1C @ =0x0000fff0
	cmp r1, 0
	beq _0811FB0A
	movs r5, 0x10
_0811FB0A:
	ldr r4, _0811FB20 @ =gLinkPlayers
	ldrb r0, [r6]
	bl sub_803FC34
	b _0811FB34
	.align 2, 0
_0811FB14: .4byte gBattleTypeFlags
_0811FB18: .4byte gUnknown_02024A60
_0811FB1C: .4byte 0x0000fff0
_0811FB20: .4byte gLinkPlayers
_0811FB24:
	movs r5, 0
	ldr r4, _0811FC08 @ =gLinkPlayers
	bl GetMultiplayerId
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
_0811FB34:
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r4, [r1, 0x13]
	ldr r6, _0811FC0C @ =gUnknown_02024A60
	ldrb r1, [r6]
	adds r0, r4, 0
	bl sub_8031AF4
	ldrb r0, [r6]
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl GetMonSpriteTemplate_803C5A0
	ldr r0, _0811FC10 @ =gUnknown_02024E8C
	mov r8, r0
	lsls r5, 16
	movs r0, 0xA0
	lsls r0, 15
	adds r5, r0
	asrs r5, 16
	ldr r0, _0811FC14 @ =gTrainerBackPicCoords
	lsls r4, 2
	adds r4, r0
	ldrb r0, [r4]
	movs r4, 0x8
	subs r4, r0
	lsls r4, 18
	movs r0, 0xA0
	lsls r0, 15
	adds r4, r0
	asrs r4, 16
	ldrb r0, [r6]
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r8
	adds r1, r5, 0
	adds r2, r4, 0
	bl CreateSprite
	ldr r5, _0811FC18 @ =gUnknown_02024BE0
	ldrb r1, [r6]
	adds r1, r5
	strb r0, [r1]
	ldr r4, _0811FC1C @ =gSprites
	ldrb r3, [r6]
	adds r0, r3, r5
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xF0
	strh r1, [r0, 0x24]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _0811FC20 @ =0x0000fffe
	strh r1, [r0, 0x2E]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _0811FC24 @ =sub_80313A0
	str r1, [r0]
	ldr r1, _0811FC28 @ =gUnknown_03004330
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811FC2C @ =sub_811DAE4
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811FC08: .4byte gLinkPlayers
_0811FC0C: .4byte gUnknown_02024A60
_0811FC10: .4byte gUnknown_02024E8C
_0811FC14: .4byte gTrainerBackPicCoords
_0811FC18: .4byte gUnknown_02024BE0
_0811FC1C: .4byte gSprites
_0811FC20: .4byte 0x0000fffe
_0811FC24: .4byte sub_80313A0
_0811FC28: .4byte gUnknown_03004330
_0811FC2C: .4byte sub_811DAE4
	thumb_func_end sub_811FAE4

	thumb_func_start sub_811FC30
sub_811FC30: @ 811FC30
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_811FC30

	thumb_func_start sub_811FC3C
sub_811FC3C: @ 811FC3C
	push {r4-r6,lr}
	ldr r6, _0811FCC8 @ =gUnknown_02024BE0
	ldr r4, _0811FCCC @ =gUnknown_02024A60
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _0811FCD0 @ =gSprites
	adds r0, r5
	bl oamt_add_pos2_onto_pos1
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x23
	strh r1, [r0, 0x2E]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _0811FCD4 @ =0x0000ffd8
	strh r1, [r0, 0x32]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0x36]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0811FCD8 @ =sub_8078B34
	str r1, [r0]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _0811FCDC @ =SpriteCallbackDummy
	bl oamt_set_x3A_32
	ldr r1, _0811FCE0 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811FCE4 @ =sub_811DB1C
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811FCC8: .4byte gUnknown_02024BE0
_0811FCCC: .4byte gUnknown_02024A60
_0811FCD0: .4byte gSprites
_0811FCD4: .4byte 0x0000ffd8
_0811FCD8: .4byte sub_8078B34
_0811FCDC: .4byte SpriteCallbackDummy
_0811FCE0: .4byte gUnknown_03004330
_0811FCE4: .4byte sub_811DB1C
	thumb_func_end sub_811FC3C

	thumb_func_start sub_811FCE8
sub_811FCE8: @ 811FCE8
	push {r4,r5,lr}
	ldr r5, _0811FD2C @ =gUnknown_02024A60
	ldrb r2, [r5]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r4, _0811FD30 @ =0x02017810
	adds r3, r0, r4
	ldrb r0, [r3, 0x4]
	cmp r0, 0
	bne _0811FD34
	lsls r0, r2, 2
	adds r1, r4, 0
	subs r1, 0x10
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0811FD1A
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl move_anim_start_t4
_0811FD1A:
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r0, [r1, 0x4]
	adds r0, 0x1
	strb r0, [r1, 0x4]
	b _0811FDAA
	.align 2, 0
_0811FD2C: .4byte gUnknown_02024A60
_0811FD30: .4byte 0x02017810
_0811FD34:
	ldrb r1, [r3]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0811FDAA
	strb r4, [r3, 0x4]
	ldr r2, _0811FDB0 @ =gUnknown_02024A6A
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _0811FDB4 @ =gPlayerParty
	adds r0, r2
	bl sub_80324F8
	movs r1, 0x40
	negs r1, r1
	movs r0, 0x10
	bl PlaySoundEffect12WithPanning
	ldr r2, _0811FDB8 @ =gSprites
	ldr r3, _0811FDBC @ =gUnknown_02024BE0
	ldrb r0, [r5]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r4, [r0, 0x30]
	ldrb r0, [r5]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x5
	strh r1, [r0, 0x32]
	ldrb r0, [r5]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _0811FDC0 @ =sub_80105EC
	str r1, [r0]
	ldr r1, _0811FDC4 @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811FDC8 @ =sub_811DE98
	str r1, [r0]
_0811FDAA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811FDB0: .4byte gUnknown_02024A6A
_0811FDB4: .4byte gPlayerParty
_0811FDB8: .4byte gSprites
_0811FDBC: .4byte gUnknown_02024BE0
_0811FDC0: .4byte sub_80105EC
_0811FDC4: .4byte gUnknown_03004330
_0811FDC8: .4byte sub_811DE98
	thumb_func_end sub_811FCE8

	thumb_func_start sub_811FDCC
sub_811FDCC: @ 811FDCC
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_811FDCC

	thumb_func_start sub_811FDD8
sub_811FDD8: @ 811FDD8
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_811FDD8

	thumb_func_start sub_811FDE4
sub_811FDE4: @ 811FDE4
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_811FDE4

	thumb_func_start sub_811FDF0
sub_811FDF0: @ 811FDF0
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_811FDF0

	thumb_func_start sub_811FDFC
sub_811FDFC: @ 811FDFC
	push {r4-r6,lr}
	ldr r6, _0811FEE0 @ =gUnknown_02024A60
	ldrb r0, [r6]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	beq _0811FE0E
	b _0811FF1E
_0811FE0E:
	ldr r0, _0811FEE4 @ =gUnknown_02023A60
	mov r12, r0
	ldrb r2, [r6]
	lsls r2, 9
	adds r0, 0x1
	adds r0, r2, r0
	ldrb r0, [r0]
	mov r1, r12
	adds r1, 0x2
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	ldr r5, _0811FEE8 @ =gUnknown_0202F7C4
	mov r1, r12
	adds r1, 0x3
	adds r2, r1
	ldrb r1, [r2]
	strb r1, [r5]
	ldr r4, _0811FEEC @ =gUnknown_0202F7BC
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x4
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0x5
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r3, r1
	strh r3, [r4]
	ldr r4, _0811FEF0 @ =gUnknown_0202F7B8
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x6
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0x7
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 8
	orrs r3, r1
	mov r1, r12
	adds r1, 0x8
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 16
	orrs r3, r1
	mov r1, r12
	adds r1, 0x9
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 24
	orrs r3, r1
	str r3, [r4]
	ldr r3, _0811FEF4 @ =gUnknown_0202F7BE
	ldrb r1, [r6]
	lsls r1, 9
	mov r2, r12
	adds r2, 0xA
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r3]
	ldr r4, _0811FEF8 @ =gUnknown_0202F7C0
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0xC
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0xD
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r3, r1
	strh r3, [r4]
	ldr r3, _0811FEFC @ =gUnknown_0202F7B4
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x10
	adds r2, r1
	str r2, [r3]
	ldr r3, _0811FF00 @ =gUnknown_02024E70
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r3
	ldr r2, [r2]
	str r2, [r1]
	ldrb r1, [r5]
	bl sub_8031720
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _0811FF04
	bl dp01_tbl3_exec_completed
	b _0811FF1E
	.align 2, 0
_0811FEE0: .4byte gUnknown_02024A60
_0811FEE4: .4byte gUnknown_02023A60
_0811FEE8: .4byte gUnknown_0202F7C4
_0811FEEC: .4byte gUnknown_0202F7BC
_0811FEF0: .4byte gUnknown_0202F7B8
_0811FEF4: .4byte gUnknown_0202F7BE
_0811FEF8: .4byte gUnknown_0202F7C0
_0811FEFC: .4byte gUnknown_0202F7B4
_0811FF00: .4byte gUnknown_02024E70
_0811FF04:
	ldrb r1, [r6]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0811FF24 @ =0x02017810
	adds r0, r1
	strb r2, [r0, 0x4]
	ldr r1, _0811FF28 @ =gUnknown_03004330
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811FF2C @ =sub_811FF30
	str r1, [r0]
_0811FF1E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811FF24: .4byte 0x02017810
_0811FF28: .4byte gUnknown_03004330
_0811FF2C: .4byte sub_811FF30
	thumb_func_end sub_811FDFC

	thumb_func_start sub_811FF30
sub_811FF30: @ 811FF30
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r2, _0811FF74 @ =gUnknown_02023A60
	ldr r5, _0811FF78 @ =gUnknown_02024A60
	ldrb r3, [r5]
	lsls r1, r3, 9
	adds r0, r2, 0x1
	mov r9, r0
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r6, r2, 0x2
	mov r8, r6
	adds r0, r1, r6
	ldrb r0, [r0]
	lsls r0, 8
	orrs r4, r0
	adds r2, 0xB
	adds r1, r2
	ldrb r7, [r1]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r6, _0811FF7C @ =0x02017810
	adds r0, r6
	ldrb r2, [r0, 0x4]
	cmp r2, 0x1
	beq _0811FFBE
	cmp r2, 0x1
	bgt _0811FF80
	cmp r2, 0
	beq _0811FF8A
	b _08120088
	.align 2, 0
_0811FF74: .4byte gUnknown_02023A60
_0811FF78: .4byte gUnknown_02024A60
_0811FF7C: .4byte 0x02017810
_0811FF80:
	cmp r2, 0x2
	beq _0811FFE4
	cmp r2, 0x3
	beq _08120050
	b _08120088
_0811FF8A:
	lsls r1, r3, 2
	adds r0, r6, 0
	subs r0, 0x10
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0xC
	ands r0, r2
	cmp r0, 0x4
	bne _0811FFAE
	movs r0, 0x8
	orrs r0, r2
	strb r0, [r1]
	ldrb r2, [r5]
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl move_anim_start_t4
_0811FFAE:
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	movs r0, 0x1
	strb r0, [r1, 0x4]
	b _08120088
_0811FFBE:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08120088
	movs r0, 0
	bl sub_80326EC
	adds r0, r4, 0
	bl ExecuteMoveAnim
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	movs r0, 0x2
	strb r0, [r1, 0x4]
	b _08120088
_0811FFE4:
	ldr r0, _08120040 @ =gAnimScriptCallback
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _08120044 @ =gAnimScriptActive
	ldrb r0, [r0]
	cmp r0, 0
	bne _08120088
	movs r0, 0x1
	bl sub_80326EC
	ldrb r2, [r5]
	lsls r0, r2, 2
	adds r4, r6, 0
	subs r4, 0x10
	adds r0, r4
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0812002C
	cmp r7, 0x1
	bhi _0812002C
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x6
	bl move_anim_start_t4
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r4
	ldrb r2, [r0]
	movs r1, 0x9
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_0812002C:
	ldr r0, _08120048 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0812004C @ =0x02017810
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0, 0x4]
	b _08120088
	.align 2, 0
_08120040: .4byte gAnimScriptCallback
_08120044: .4byte gAnimScriptActive
_08120048: .4byte gUnknown_02024A60
_0812004C: .4byte 0x02017810
_08120050:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08120088
	bl sub_8031F24
	ldrb r0, [r5]
	lsls r2, r0, 9
	mov r3, r9
	adds r1, r2, r3
	ldrb r1, [r1]
	add r2, r8
	ldrb r2, [r2]
	lsls r2, 8
	orrs r1, r2
	bl sub_80324BC
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strb r4, [r0, 0x4]
	bl dp01_tbl3_exec_completed
_08120088:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_811FF30

	thumb_func_start sub_8120094
sub_8120094: @ 8120094
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _081200D8 @ =gUnknown_030042A4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _081200DC @ =gUnknown_030042A0
	strh r1, [r0]
	ldr r4, _081200E0 @ =gUnknown_02024A60
	ldrb r0, [r4]
	lsls r0, 9
	ldr r1, _081200E4 @ =gUnknown_02023A62
	adds r0, r1
	ldrh r0, [r0]
	bl sub_8120AA8
	ldr r0, _081200E8 @ =gUnknown_03004210
	ldr r1, _081200EC @ =gUnknown_020238CC
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _081200F0 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081200F4 @ =sub_811DFA0
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081200D8: .4byte gUnknown_030042A4
_081200DC: .4byte gUnknown_030042A0
_081200E0: .4byte gUnknown_02024A60
_081200E4: .4byte gUnknown_02023A62
_081200E8: .4byte gUnknown_03004210
_081200EC: .4byte gUnknown_020238CC
_081200F0: .4byte gUnknown_03004330
_081200F4: .4byte sub_811DFA0
	thumb_func_end sub_8120094

	thumb_func_start sub_81200F8
sub_81200F8: @ 81200F8
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_81200F8

	thumb_func_start sub_8120104
sub_8120104: @ 8120104
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120104

	thumb_func_start sub_8120110
sub_8120110: @ 8120110
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120110

	thumb_func_start sub_812011C
sub_812011C: @ 812011C
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812011C

	thumb_func_start sub_8120128
sub_8120128: @ 8120128
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120128

	thumb_func_start sub_8120134
sub_8120134: @ 8120134
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120134

	thumb_func_start sub_8120140
sub_8120140: @ 8120140
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120140

	thumb_func_start sub_812014C
sub_812014C: @ 812014C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	movs r0, 0
	bl load_gfxc_health_bar
	ldr r3, _081201C4 @ =gUnknown_02023A60
	ldr r0, _081201C8 @ =gUnknown_02024A60
	mov r9, r0
	ldrb r4, [r0]
	lsls r2, r4, 9
	adds r0, r3, 0x2
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r3, 0x3
	adds r2, r3
	ldrb r0, [r2]
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	asrs r7, r1, 16
	ldr r0, _081201CC @ =0x00007fff
	cmp r7, r0
	beq _081201DC
	ldr r6, _081201D0 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r6
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _081201D4 @ =gPlayerParty
	adds r0, r4
	movs r1, 0x3A
	bl GetMonData
	mov r8, r0
	mov r1, r9
	ldrb r0, [r1]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r4
	movs r1, 0x39
	bl GetMonData
	adds r3, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r1, _081201D8 @ =gUnknown_03004340
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	mov r2, r8
	bl sub_8043D84
	b _08120206
	.align 2, 0
_081201C4: .4byte gUnknown_02023A60
_081201C8: .4byte gUnknown_02024A60
_081201CC: .4byte 0x00007fff
_081201D0: .4byte gUnknown_02024A6A
_081201D4: .4byte gPlayerParty
_081201D8: .4byte gUnknown_03004340
_081201DC:
	ldr r1, _08120224 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08120228 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3A
	bl GetMonData
	adds r2, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r1, _0812022C @ =gUnknown_03004340
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	movs r3, 0
	bl sub_8043D84
_08120206:
	ldr r1, _08120230 @ =gUnknown_03004330
	ldr r0, _08120234 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08120238 @ =bx_t3_healthbar_update
	str r1, [r0]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08120224: .4byte gUnknown_02024A6A
_08120228: .4byte gPlayerParty
_0812022C: .4byte gUnknown_03004340
_08120230: .4byte gUnknown_03004330
_08120234: .4byte gUnknown_02024A60
_08120238: .4byte bx_t3_healthbar_update
	thumb_func_end sub_812014C

	thumb_func_start sub_812023C
sub_812023C: @ 812023C
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812023C

	thumb_func_start sub_8120248
sub_8120248: @ 8120248
	push {r4,lr}
	ldr r4, _081202A0 @ =gUnknown_02024A60
	ldrb r0, [r4]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _08120298
	ldr r0, _081202A4 @ =gUnknown_03004340
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _081202A8 @ =gUnknown_02024A6A
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _081202AC @ =gPlayerParty
	adds r1, r2
	movs r2, 0x9
	bl sub_8045A5C
	ldrb r0, [r4]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r0, _081202B0 @ =0x02017810
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r1, _081202B4 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081202B8 @ =sub_811E38C
	str r1, [r0]
_08120298:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081202A0: .4byte gUnknown_02024A60
_081202A4: .4byte gUnknown_03004340
_081202A8: .4byte gUnknown_02024A6A
_081202AC: .4byte gPlayerParty
_081202B0: .4byte 0x02017810
_081202B4: .4byte gUnknown_03004330
_081202B8: .4byte sub_811E38C
	thumb_func_end sub_8120248

	thumb_func_start sub_81202BC
sub_81202BC: @ 81202BC
	push {r4,r5,lr}
	ldr r5, _08120314 @ =gUnknown_02024A60
	ldrb r0, [r5]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _0812030C
	ldr r4, _08120318 @ =gUnknown_02023A60
	ldrb r3, [r5]
	lsls r3, 9
	adds r0, r4, 0x1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, r4, 0x2
	adds r1, r3, r1
	ldrb r1, [r1]
	adds r2, r4, 0x3
	adds r2, r3, r2
	ldrb r2, [r2]
	lsls r2, 8
	orrs r1, r2
	adds r2, r4, 0x4
	adds r2, r3, r2
	ldrb r2, [r2]
	lsls r2, 16
	orrs r1, r2
	adds r4, 0x5
	adds r3, r4
	ldrb r2, [r3]
	lsls r2, 24
	orrs r1, r2
	bl move_anim_start_t2_for_situation
	ldr r1, _0812031C @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08120320 @ =sub_811E38C
	str r1, [r0]
_0812030C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08120314: .4byte gUnknown_02024A60
_08120318: .4byte gUnknown_02023A60
_0812031C: .4byte gUnknown_03004330
_08120320: .4byte sub_811E38C
	thumb_func_end sub_81202BC

	thumb_func_start sub_8120324
sub_8120324: @ 8120324
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120324

	thumb_func_start sub_8120330
sub_8120330: @ 8120330
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120330

	thumb_func_start sub_812033C
sub_812033C: @ 812033C
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812033C

	thumb_func_start sub_8120348
sub_8120348: @ 8120348
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120348

	thumb_func_start sub_8120354
sub_8120354: @ 8120354
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120354

	thumb_func_start sub_8120360
sub_8120360: @ 8120360
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120360

	thumb_func_start sub_812036C
sub_812036C: @ 812036C
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812036C

	thumb_func_start sub_8120378
sub_8120378: @ 8120378
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120378

	thumb_func_start sub_8120384
sub_8120384: @ 8120384
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120384

	thumb_func_start sub_8120390
sub_8120390: @ 8120390
	push {lr}
	ldr r2, _081203A8 @ =gUnknown_020238C8
	ldrb r1, [r2]
	movs r0, 0x80
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_081203A8: .4byte gUnknown_020238C8
	thumb_func_end sub_8120390

	thumb_func_start sub_81203AC
sub_81203AC: @ 81203AC
	push {lr}
	ldr r3, _081203D8 @ =gUnknown_020238C8
	ldr r1, _081203DC @ =gUnknown_02023A60
	ldr r0, _081203E0 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x7F
	ands r1, r0
	ldrb r2, [r3]
	movs r0, 0x80
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_081203D8: .4byte gUnknown_020238C8
_081203DC: .4byte gUnknown_02023A60
_081203E0: .4byte gUnknown_02024A60
	thumb_func_end sub_81203AC

	thumb_func_start sub_81203E4
sub_81203E4: @ 81203E4
	push {lr}
	ldr r2, _081203F8 @ =gUnknown_020238C8
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_081203F8: .4byte gUnknown_020238C8
	thumb_func_end sub_81203E4

	thumb_func_start sub_81203FC
sub_81203FC: @ 81203FC
	push {lr}
	ldr r3, _08120420 @ =gUnknown_020238C8
	ldr r1, [r3]
	lsls r1, 24
	lsrs r1, 31
	movs r0, 0x1
	eors r1, r0
	lsls r1, 7
	ldrb r2, [r3]
	movs r0, 0x7F
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08120420: .4byte gUnknown_020238C8
	thumb_func_end sub_81203FC

	thumb_func_start dp01t_29_3_blink
dp01t_29_3_blink: @ 8120424
	push {r4,lr}
	ldr r3, _0812044C @ =gSprites
	ldr r2, _08120450 @ =gUnknown_02024BE0
	ldr r4, _08120454 @ =gUnknown_02024A60
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _08120458
	bl dp01_tbl3_exec_completed
	b _08120482
	.align 2, 0
_0812044C: .4byte gSprites
_08120450: .4byte gUnknown_02024BE0
_08120454: .4byte gUnknown_02024A60
_08120458:
	ldr r1, _08120488 @ =gUnknown_02024E6D
	movs r0, 0x1
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0
	strh r1, [r0, 0x30]
	ldrb r0, [r4]
	bl sub_8047858
	ldr r1, _0812048C @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08120490 @ =bx_blink_t3
	str r1, [r0]
_08120482:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08120488: .4byte gUnknown_02024E6D
_0812048C: .4byte gUnknown_03004330
_08120490: .4byte bx_blink_t3
	thumb_func_end dp01t_29_3_blink

	thumb_func_start sub_8120494
sub_8120494: @ 8120494
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120494

	thumb_func_start sub_81204A0
sub_81204A0: @ 81204A0
	push {r4,lr}
	ldr r4, _081204DC @ =gUnknown_02024A60
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	movs r3, 0x3F
	cmp r0, 0
	bne _081204B4
	movs r3, 0xC0
_081204B4:
	ldr r2, _081204E0 @ =gUnknown_02023A60
	ldrb r1, [r4]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	lsls r1, r3, 24
	asrs r1, 24
	bl PlaySoundEffect12WithPanning
	bl dp01_tbl3_exec_completed
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081204DC: .4byte gUnknown_02024A60
_081204E0: .4byte gUnknown_02023A60
	thumb_func_end sub_81204A0

	thumb_func_start sub_81204E4
sub_81204E4: @ 81204E4
	push {lr}
	ldr r2, _0812050C @ =gUnknown_02023A60
	ldr r0, _08120510 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	bl PlayFanfare
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_0812050C: .4byte gUnknown_02023A60
_08120510: .4byte gUnknown_02024A60
	thumb_func_end sub_81204E4

	thumb_func_start sub_8120514
sub_8120514: @ 8120514
	push {lr}
	ldr r1, _08120548 @ =gUnknown_02024A6A
	ldr r0, _0812054C @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08120550 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x19
	negs r1, r1
	movs r2, 0x5
	bl PlayCry3
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08120548: .4byte gUnknown_02024A6A
_0812054C: .4byte gUnknown_02024A60
_08120550: .4byte gPlayerParty
	thumb_func_end sub_8120514

	thumb_func_start dp01t_2E_3_battle_intro
dp01t_2E_3_battle_intro: @ 8120554
	push {lr}
	ldr r1, _0812057C @ =gUnknown_02023A60
	ldr r0, _08120580 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80E43C0
	ldr r2, _08120584 @ =gUnknown_02024DE8
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_0812057C: .4byte gUnknown_02023A60
_08120580: .4byte gUnknown_02024A60
_08120584: .4byte gUnknown_02024DE8
	thumb_func_end dp01t_2E_3_battle_intro

	thumb_func_start sub_8120588
sub_8120588: @ 8120588
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r6, _081206DC @ =gUnknown_02024BE0
	ldr r7, _081206E0 @ =gUnknown_02024A60
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _081206E4 @ =gSprites
	adds r0, r5
	bl oamt_add_pos2_onto_pos1
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x32
	strh r1, [r0, 0x2E]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _081206E8 @ =0x0000ffd8
	strh r1, [r0, 0x32]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0x36]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _081206EC @ =sub_8078B34
	str r1, [r0]
	ldrb r2, [r7]
	adds r0, r2, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x38]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _081206F0 @ =sub_8030E38
	bl oamt_set_x3A_32
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, _081206F4 @ =0x0000d6f9
	bl AllocSpritePalette
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _081206F8 @ =gTrainerBackPicPaletteTable
	mov r8, r0
	ldrb r0, [r7]
	bl sub_803FC34
	ldr r2, _081206FC @ =gLinkPlayers
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x13]
	lsls r0, 3
	add r0, r8
	ldr r0, [r0]
	lsls r4, 4
	movs r2, 0x80
	lsls r2, 1
	adds r1, r4, r2
	movs r2, 0x20
	bl LoadCompressedPalette
	ldrb r0, [r7]
	adds r0, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r4
	strb r0, [r1, 0x5]
	ldr r0, _08120700 @ =sub_812071C
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08120704 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	ldrb r0, [r7]
	strh r0, [r1, 0x8]
	ldrb r3, [r7]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r2, _08120708 @ =0x02017810
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081206BA
	ldr r0, _0812070C @ =gUnknown_02024E68
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	ldr r1, _08120710 @ =sub_8044CA0
	str r1, [r0]
_081206BA:
	adds r2, 0x30
	ldrb r0, [r2, 0x9]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _08120714 @ =gUnknown_03004330
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08120718 @ =nullsub_74
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081206DC: .4byte gUnknown_02024BE0
_081206E0: .4byte gUnknown_02024A60
_081206E4: .4byte gSprites
_081206E8: .4byte 0x0000ffd8
_081206EC: .4byte sub_8078B34
_081206F0: .4byte sub_8030E38
_081206F4: .4byte 0x0000d6f9
_081206F8: .4byte gTrainerBackPicPaletteTable
_081206FC: .4byte gLinkPlayers
_08120700: .4byte sub_812071C
_08120704: .4byte gTasks
_08120708: .4byte 0x02017810
_0812070C: .4byte gUnknown_02024E68
_08120710: .4byte sub_8044CA0
_08120714: .4byte gUnknown_03004330
_08120718: .4byte nullsub_74
	thumb_func_end sub_8120588

	thumb_func_start sub_812071C
sub_812071C: @ 812071C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _08120744 @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0xA]
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	cmp r0, 0x17
	bgt _08120748
	adds r0, r2, 0x1
	strh r0, [r1, 0xA]
	b _08120804
	.align 2, 0
_08120744: .4byte gTasks
_08120748:
	ldr r7, _08120788 @ =gUnknown_02024A60
	ldrb r0, [r7]
	mov r9, r0
	ldrh r0, [r1, 0x8]
	strb r0, [r7]
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _08120768
	ldr r0, _0812078C @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08120798
_08120768:
	ldr r0, _08120790 @ =gUnknown_02023A60
	ldrb r1, [r7]
	lsls r2, r1, 9
	adds r0, 0x1
	adds r2, r0
	ldr r0, _08120794 @ =gUnknown_02024A6A
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	strb r0, [r2]
	ldrb r0, [r7]
	movs r1, 0
	bl sub_811F864
	b _081207EC
	.align 2, 0
_08120788: .4byte gUnknown_02024A60
_0812078C: .4byte gBattleTypeFlags
_08120790: .4byte gUnknown_02023A60
_08120794: .4byte gUnknown_02024A6A
_08120798:
	ldr r4, _08120810 @ =gUnknown_02023A60
	ldrb r0, [r7]
	lsls r1, r0, 9
	adds r4, 0x1
	adds r1, r4
	ldr r5, _08120814 @ =gUnknown_02024A6A
	lsls r0, 1
	adds r0, r5
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, 0
	bl sub_811F864
	ldrb r0, [r7]
	movs r6, 0x2
	eors r0, r6
	strb r0, [r7]
	ldrb r0, [r7]
	lsls r1, r0, 9
	adds r1, r4
	lsls r0, 1
	adds r0, r5
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r0, r1, 1
	adds r0, r5
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _08120818 @ =gPlayerParty
	adds r0, r2
	bl sub_80318FC
	ldrb r0, [r7]
	movs r1, 0
	bl sub_811F864
	ldrb r0, [r7]
	eors r0, r6
	strb r0, [r7]
_081207EC:
	ldr r1, _0812081C @ =gUnknown_03004330
	ldr r2, _08120820 @ =gUnknown_02024A60
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08120824 @ =sub_811DCA0
	str r1, [r0]
	mov r3, r9
	strb r3, [r2]
	mov r0, r8
	bl DestroyTask
_08120804:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08120810: .4byte gUnknown_02023A60
_08120814: .4byte gUnknown_02024A6A
_08120818: .4byte gPlayerParty
_0812081C: .4byte gUnknown_03004330
_08120820: .4byte gUnknown_02024A60
_08120824: .4byte sub_811DCA0
	thumb_func_end sub_812071C

	thumb_func_start dp01t_30_3_80EB11C
dp01t_30_3_80EB11C: @ 8120828
	push {r4-r6,lr}
	ldr r1, _08120850 @ =gUnknown_02023A60
	ldr r0, _08120854 @ =gUnknown_02024A60
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08120858
	adds r0, r2, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08120858
	bl dp01_tbl3_exec_completed
	b _081208C0
	.align 2, 0
_08120850: .4byte gUnknown_02023A60
_08120854: .4byte gUnknown_02024A60
_08120858:
	ldr r5, _081208C8 @ =gUnknown_02024A60
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r6, _081208CC @ =0x02017810
	adds r0, r6
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	ldrb r0, [r5]
	lsls r3, r0, 9
	ldr r4, _081208D0 @ =gUnknown_02023A64
	adds r1, r3, r4
	subs r2, r4, 0x3
	adds r2, r3, r2
	ldrb r2, [r2]
	subs r4, 0x2
	adds r3, r4
	ldrb r3, [r3]
	bl sub_8044804
	ldr r2, _081208D4 @ =gUnknown_02024E68
	ldrb r1, [r5]
	adds r1, r2
	movs r2, 0
	strb r0, [r1]
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strb r2, [r0, 0x5]
	ldrb r1, [r5]
	lsls r0, r1, 9
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _081208B4
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x5D
	strb r1, [r0, 0x5]
_081208B4:
	ldr r0, _081208D8 @ =gUnknown_03004330
	ldrb r1, [r5]
	lsls r1, 2
	adds r1, r0
	ldr r0, _081208DC @ =sub_81208E0
	str r0, [r1]
_081208C0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081208C8: .4byte gUnknown_02024A60
_081208CC: .4byte 0x02017810
_081208D0: .4byte gUnknown_02023A64
_081208D4: .4byte gUnknown_02024E68
_081208D8: .4byte gUnknown_03004330
_081208DC: .4byte sub_81208E0
	thumb_func_end dp01t_30_3_80EB11C

	thumb_func_start sub_81208E0
sub_81208E0: @ 81208E0
	push {r4,lr}
	ldr r4, _08120918 @ =gUnknown_02024A60
	ldrb r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r3, _0812091C @ =0x02017810
	adds r0, r3
	ldrb r1, [r0, 0x5]
	adds r2, r1, 0x1
	strb r2, [r0, 0x5]
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x5C
	bls _08120910
	ldrb r0, [r4]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	movs r0, 0
	strb r0, [r1, 0x5]
	bl dp01_tbl3_exec_completed
_08120910:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08120918: .4byte gUnknown_02024A60
_0812091C: .4byte 0x02017810
	thumb_func_end sub_81208E0

	thumb_func_start sub_8120920
sub_8120920: @ 8120920
	push {lr}
	ldr r0, _08120958 @ =gUnknown_02024A60
	ldrb r3, [r0]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r1, _0812095C @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0812094E
	ldr r2, _08120960 @ =gTasks
	ldr r0, _08120964 @ =gUnknown_02024E68
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _08120968 @ =sub_8044CA0
	str r1, [r0]
_0812094E:
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08120958: .4byte gUnknown_02024A60
_0812095C: .4byte 0x02017810
_08120960: .4byte gTasks
_08120964: .4byte gUnknown_02024E68
_08120968: .4byte sub_8044CA0
	thumb_func_end sub_8120920

	thumb_func_start sub_812096C
sub_812096C: @ 812096C
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812096C

	thumb_func_start sub_8120978
sub_8120978: @ 8120978
	push {r4,lr}
	ldr r4, _081209C8 @ =gUnknown_02024A60
	ldrb r0, [r4]
	bl sub_8078874
	lsls r0, 24
	cmp r0, 0
	beq _081209BE
	ldr r3, _081209CC @ =gSprites
	ldr r0, _081209D0 @ =gUnknown_02024BE0
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldr r0, _081209D4 @ =gUnknown_02023A60
	lsls r1, 9
	adds r0, 0x1
	adds r1, r0
	adds r2, 0x3E
	movs r0, 0x1
	ldrb r1, [r1]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r4]
	bl sub_8031F88
_081209BE:
	bl dp01_tbl3_exec_completed
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081209C8: .4byte gUnknown_02024A60
_081209CC: .4byte gSprites
_081209D0: .4byte gUnknown_02024BE0
_081209D4: .4byte gUnknown_02023A60
	thumb_func_end sub_8120978

	thumb_func_start sub_81209D8
sub_81209D8: @ 81209D8
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r6, _08120A1C @ =gUnknown_02024A60
	ldrb r0, [r6]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _08120A30
	ldr r5, _08120A20 @ =gUnknown_02023A60
	ldrb r2, [r6]
	lsls r1, r2, 9
	adds r0, r5, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r0, r5, 0x2
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r5, 0x3
	adds r1, r5
	ldrb r0, [r1]
	lsls r0, 8
	orrs r4, r0
	str r4, [sp]
	adds r0, r2, 0
	adds r1, r2, 0
	bl move_anim_start_t3
	lsls r0, 24
	cmp r0, 0
	beq _08120A24
	bl dp01_tbl3_exec_completed
	b _08120A30
	.align 2, 0
_08120A1C: .4byte gUnknown_02024A60
_08120A20: .4byte gUnknown_02023A60
_08120A24:
	ldr r0, _08120A38 @ =gUnknown_03004330
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _08120A3C @ =sub_811E3B8
	str r0, [r1]
_08120A30:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08120A38: .4byte gUnknown_03004330
_08120A3C: .4byte sub_811E3B8
	thumb_func_end sub_81209D8

	thumb_func_start sub_8120A40
sub_8120A40: @ 8120A40
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120A40

	thumb_func_start sub_8120A4C
sub_8120A4C: @ 8120A4C
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120A4C

	thumb_func_start sub_8120A58
sub_8120A58: @ 8120A58
	push {r4,lr}
	ldr r2, _08120A90 @ =gUnknown_02024D26
	ldr r1, _08120A94 @ =gUnknown_02023A60
	ldr r4, _08120A98 @ =gUnknown_02024A60
	ldrb r0, [r4]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, 0x5
	bl FadeOutMapMusic
	movs r0, 0x3
	bl BeginFastPaletteFade
	bl dp01_tbl3_exec_completed
	ldr r1, _08120A9C @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08120AA0 @ =sub_811E29C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08120A90: .4byte gUnknown_02024D26
_08120A94: .4byte gUnknown_02023A60
_08120A98: .4byte gUnknown_02024A60
_08120A9C: .4byte gUnknown_03004330
_08120AA0: .4byte sub_811E29C
	thumb_func_end sub_8120A58

	thumb_func_start nullsub_75
nullsub_75: @ 8120AA4
	bx lr
	thumb_func_end nullsub_75

	.align 2, 0 @ Don't pad with nop.
