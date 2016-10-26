	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start GetLandmarkName
GetLandmarkName: @ 811A8CC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	bl GetLandmarkList
	adds r4, r0, 0
	cmp r4, 0
	bne _0811A8E8
_0811A8E4:
	movs r0, 0
	b _0811A91A
_0811A8E8:
	ldr r6, _0811A8EC @ =0x0000ffff
	b _0811A8FE
	.align 2, 0
_0811A8EC: .4byte 0x0000ffff
_0811A8F0:
	subs r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0811A8F6:
	adds r4, 0x4
	ldr r0, [r4]
	cmp r0, 0
	beq _0811A8E4
_0811A8FE:
	ldr r1, [r4]
	ldrh r0, [r1, 0x4]
	cmp r0, r6
	beq _0811A912
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0811A8F6
_0811A912:
	cmp r5, 0
	bne _0811A8F0
	ldr r0, [r4]
	ldr r0, [r0]
_0811A91A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetLandmarkName

	thumb_func_start GetLandmarkList
GetLandmarkList: @ 811A920
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	movs r2, 0
	ldr r0, _0811A964 @ =gLandmarkLists
	ldrb r1, [r0]
	adds r4, r0, 0
	cmp r1, 0x58
	beq _0811A990
	adds r1, r4, 0
_0811A938:
	lsls r0, r2, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, r3
	bhi _0811A990
	cmp r0, r3
	beq _0811A956
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r0, r2, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x58
	bne _0811A938
_0811A956:
	lsls r0, r2, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x58
	bne _0811A970
	b _0811A990
	.align 2, 0
_0811A964: .4byte gLandmarkLists
_0811A968:
	adds r0, r4, 0x4
	adds r0, r1, r0
	ldr r0, [r0]
	b _0811A992
_0811A970:
	cmp r0, r3
	bne _0811A990
	ldr r5, _0811A998 @ =gLandmarkLists
_0811A976:
	lsls r1, r2, 3
	adds r0, r1, r5
	ldrb r0, [r0, 0x1]
	cmp r0, r6
	beq _0811A968
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r0, r2, 3
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, r3
	beq _0811A976
_0811A990:
	movs r0, 0
_0811A992:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811A998: .4byte gLandmarkLists
	thumb_func_end GetLandmarkList

	.align 2, 0 @ Don't pad with nop.
