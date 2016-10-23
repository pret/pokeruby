	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_8145B00
sub_8145B00: @ 8145B00
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r1, _08145C24
	movs r0, 0
	strh r0, [r1]
	movs r0, 0
	mov r10, r0
	mov r9, r0
	movs r6, 0
_08145B18:
	movs r0, 0x64
	adds r1, r6, 0
	muls r1, r0
	ldr r0, _08145C28
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08145B74
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _08145B6A
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	adds r1, r0, 0
	ldr r0, _08145C2C
	ldrh r0, [r0]
	lsls r1, 16
	lsrs r1, 16
	bl sub_8145C8C
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08145C24
	ldrh r2, [r1]
	cmp r0, r2
	bls _08145B6A
	cmp r0, 0x1
	bls _08145B6A
	subs r0, 0x1
	strh r0, [r1]
	movs r0, 0xE
	mov r9, r0
	mov r10, r6
_08145B6A:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x5
	bls _08145B18
_08145B74:
	movs r6, 0
_08145B76:
	movs r5, 0
	adds r1, r6, 0x1
	mov r8, r1
	lsls r0, r6, 2
	adds r7, r0, r6
_08145B80:
	lsls r2, r7, 4
	subs r2, r7
	lsls r2, 5
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 4
	ldr r1, _08145C30
	adds r0, r1
	adds r4, r2, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	beq _08145BD8
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetBoxMonData
	cmp r0, 0
	bne _08145BD8
	adds r0, r4, 0
	movs r1, 0x1
	bl GetBoxMonData
	adds r1, r0, 0
	ldr r0, _08145C2C
	ldrh r0, [r0]
	lsls r1, 16
	lsrs r1, 16
	bl sub_8145C8C
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08145C24
	ldrh r2, [r1]
	cmp r0, r2
	bls _08145BD8
	cmp r0, 0x1
	bls _08145BD8
	subs r0, 0x1
	strh r0, [r1]
	mov r9, r6
	mov r10, r5
_08145BD8:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x1D
	bls _08145B80
	mov r1, r8
	lsls r0, r1, 16
	lsrs r6, r0, 16
	cmp r6, 0xD
	bls _08145B76
	ldr r3, _08145C24
	ldrh r0, [r3]
	cmp r0, 0
	beq _08145C72
	ldr r2, _08145C34
	ldr r1, _08145C38
	subs r0, 0x1
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	mov r2, r9
	cmp r2, 0xE
	bne _08145C44
	ldr r1, _08145C3C
	movs r0, 0
	strh r0, [r1]
	movs r0, 0x64
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	ldr r1, _08145C28
	adds r0, r1
	ldr r2, _08145C40
	movs r1, 0x2
	bl GetMonData
	b _08145C6C
	.align 2, 0
_08145C24: .4byte gUnknown_0202E8CC
_08145C28: .4byte gPlayerParty
_08145C2C: .4byte gScriptResult
_08145C30: .4byte gUnknown_020300A4
_08145C34: .4byte gUnknown_0202E8CE
_08145C38: .4byte gUnknown_0840CB04
_08145C3C: .4byte gUnknown_0202E8D0
_08145C40: .4byte gStringVar1
_08145C44:
	ldr r1, _08145C80
	movs r0, 0x1
	strh r0, [r1]
	mov r2, r9
	lsls r1, r2, 2
	add r1, r9
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	mov r2, r10
	lsls r1, r2, 2
	add r1, r10
	lsls r1, 4
	ldr r2, _08145C84
	adds r1, r2
	adds r0, r1
	ldr r2, _08145C88
	movs r1, 0x2
	bl GetBoxMonData
_08145C6C:
	ldr r0, _08145C88
	bl StringGetEnd10
_08145C72:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08145C80: .4byte gUnknown_0202E8D0
_08145C84: .4byte gUnknown_020300A4
_08145C88: .4byte gStringVar1
	thumb_func_end sub_8145B00

	thumb_func_start sub_8145C8C
sub_8145C8C: @ 8145C8C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r5, r1, 16
	movs r0, 0
	mov r8, r0
	movs r7, 0
	ldr r1, _08145D0C
	mov r10, r1
	ldr r0, _08145D10
	mov r9, r0
_08145CAC:
	adds r0, r6, 0
	movs r1, 0xA
	bl __umodsi3
	adds r4, r0, 0
	mov r1, r10
	strh r4, [r1]
	adds r0, r5, 0
	movs r1, 0xA
	bl __umodsi3
	mov r1, r9
	strh r0, [r1]
	lsls r4, 16
	lsls r0, 16
	cmp r4, r0
	bne _08145CFA
	adds r0, r6, 0
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r5, 0
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 16
	lsrs r5, r0, 16
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x4
	bls _08145CAC
_08145CFA:
	mov r0, r8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08145D0C: .4byte gUnknown_02039328
_08145D10: .4byte gUnknown_0203932A
	thumb_func_end sub_8145C8C

	thumb_func_start sub_8145D14
sub_8145D14: @ 8145D14
	push {r4,lr}
	adds r1, r0, 0
	lsrs r4, r1, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _08145D34
	bl VarSet
	ldr r0, _08145D38
	adds r1, r4, 0
	bl VarSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08145D34: .4byte 0x0000404b
_08145D38: .4byte 0x0000404c
	thumb_func_end sub_8145D14

	thumb_func_start sub_8145D3C
sub_8145D3C: @ 8145D3C
	push {r4,lr}
	ldr r0, _08145D5C
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _08145D60
	bl VarGet
	lsls r0, 16
	orrs r0, r4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08145D5C: .4byte 0x0000404b
_08145D60: .4byte 0x0000404c
	thumb_func_end sub_8145D3C

	thumb_func_start unref_sub_8145D64
unref_sub_8145D64: @ 8145D64
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl sub_8145D14
	pop {r0}
	bx r0
	thumb_func_end unref_sub_8145D64

	.align 2, 0 @ Don't pad with nop.
