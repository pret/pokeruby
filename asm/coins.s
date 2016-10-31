	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start UpdateCoinsWindow
UpdateCoinsWindow: @ 811A704
	push {r4,lr}
	adds r4, r1, 0
	adds r3, r2, 0
	lsls r4, 24
	lsls r3, 24
	movs r1, 0x80
	lsls r1, 18
	adds r4, r1
	lsrs r4, 24
	movs r1, 0x80
	lsls r1, 17
	adds r3, r1
	lsrs r3, 24
	movs r1, 0x4
	adds r2, r4, 0
	bl PrintCoins
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end UpdateCoinsWindow

	thumb_func_start ShowCoinsWindow
ShowCoinsWindow: @ 811A72C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r4, r1, 0
	adds r3, r2, 0
	lsls r4, 24
	lsls r3, 24
	lsrs r6, r4, 24
	movs r0, 0x90
	lsls r0, 20
	adds r4, r0
	lsrs r4, 24
	lsrs r5, r3, 24
	movs r0, 0xC0
	lsls r0, 18
	adds r3, r0
	lsrs r3, 24
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl MenuDrawTextWindow
	mov r0, r8
	adds r1, r6, 0
	adds r2, r5, 0
	bl UpdateCoinsWindow
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end ShowCoinsWindow

	thumb_func_start HideCoinsWindow
HideCoinsWindow: @ 811A770
	push {r4,lr}
	adds r2, r0, 0
	adds r3, r1, 0
	lsls r2, 24
	lsls r3, 24
	lsrs r0, r2, 24
	movs r1, 0x90
	lsls r1, 20
	adds r2, r1
	lsrs r2, 24
	lsrs r1, r3, 24
	movs r4, 0xC0
	lsls r4, 18
	adds r3, r4
	lsrs r3, 24
	bl MenuZeroFillWindowRect
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end HideCoinsWindow

	thumb_func_start PrintCoins
PrintCoins: @ 811A798
	push {r4-r7,lr}
	sub sp, 0x10
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r5, r1, 0
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r3, 24
	lsrs r7, r3, 24
	mov r0, sp
	adds r1, r4, 0
	bl ConvertIntToDecimalString
	lsls r1, r5, 1
	adds r1, r5
	lsls r1, 1
	adds r1, 0x21
	adds r0, r5, 0x2
	lsls r0, 3
	subs r1, r0
	lsls r1, 24
	lsrs r0, r1, 27
	subs r0, r6, r0
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0xE0
	lsls r0, 19
	ands r0, r1
	lsrs r1, r0, 24
	ldr r4, _0811A824 @ =gStringVar1
	cmp r1, 0
	beq _0811A7EA
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x11
	strb r0, [r4, 0x1]
	movs r0, 0x8
	subs r0, r1
	strb r0, [r4, 0x2]
	adds r4, 0x3
_0811A7EA:
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x11
	strb r0, [r4, 0x1]
	mov r0, sp
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	subs r0, r5, r0
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	strb r1, [r4, 0x2]
	adds r4, 0x3
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy
	ldr r0, _0811A828 @ =gOtherText_Coins2
	adds r1, r6, 0
	adds r2, r7, 0
	bl MenuPrint
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811A824: .4byte gStringVar1
_0811A828: .4byte gOtherText_Coins2
	thumb_func_end PrintCoins

	thumb_func_start GetCoins
GetCoins: @ 811A82C
	ldr r0, _0811A838 @ =gSaveBlock1
	ldr r1, _0811A83C @ =0x00000494
	adds r0, r1
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0811A838: .4byte gSaveBlock1
_0811A83C: .4byte 0x00000494
	thumb_func_end GetCoins

	thumb_func_start GiveCoins
GiveCoins: @ 811A840
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl GetCoins
	lsls r0, 16
	ldr r1, _0811A858 @ =0x270e0000
	cmp r0, r1
	bls _0811A85C
	movs r0, 0
	b _0811A88C
	.align 2, 0
_0811A858: .4byte 0x270e0000
_0811A85C:
	ldr r0, _0811A874 @ =gSaveBlock1
	ldr r1, _0811A878 @ =0x00000494
	adds r3, r0, r1
	ldrh r1, [r3]
	adds r2, r4, r1
	lsls r0, r2, 16
	lsrs r0, 16
	cmp r1, r0
	bls _0811A880
	ldr r0, _0811A87C @ =0x0000270f
	strh r0, [r3]
	b _0811A88A
	.align 2, 0
_0811A874: .4byte gSaveBlock1
_0811A878: .4byte 0x00000494
_0811A87C: .4byte 0x0000270f
_0811A880:
	strh r2, [r3]
	ldr r1, _0811A894 @ =0x0000270f
	cmp r0, r1
	bls _0811A88A
	strh r1, [r3]
_0811A88A:
	movs r0, 0x1
_0811A88C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811A894: .4byte 0x0000270f
	thumb_func_end GiveCoins

	thumb_func_start TakeCoins
TakeCoins: @ 811A898
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl GetCoins
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r4
	bcs _0811A8AE
	movs r0, 0
	b _0811A8BC
_0811A8AE:
	ldr r1, _0811A8C4 @ =gSaveBlock1
	ldr r0, _0811A8C8 @ =0x00000494
	adds r1, r0
	ldrh r0, [r1]
	subs r0, r4
	strh r0, [r1]
	movs r0, 0x1
_0811A8BC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811A8C4: .4byte gSaveBlock1
_0811A8C8: .4byte 0x00000494
	thumb_func_end TakeCoins

	.align 2, 0 @ Don't pad with nop.
