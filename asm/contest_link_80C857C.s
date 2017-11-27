	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80C857C
sub_80C857C: @ 80C857C
	push {r4,r5,lr}
	adds r2, r0, 0
	lsls r4, r1, 16
	lsrs r4, 16
	ldr r5, _080C85A8 @ =gSharedMem + 0x1E000
	adds r0, r5, 0
	adds r1, r2, 0
	adds r2, r4, 0
	bl memcpy
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	adds r1, r5, 0
	adds r2, r4, 0
	bl SendBlock
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C85A8: .4byte gSharedMem + 0x1E000
	thumb_func_end sub_80C857C

	thumb_func_start sub_80C85AC
sub_80C85AC: @ 80C85AC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x80
	lsls r1, 17
	lsls r1, r0
	lsrs r4, r1, 24
	bl GetBlockReceivedStatus
	adds r1, r4, 0
	ands r1, r0
	cmp r1, 0
	beq _080C85D0
	adds r0, r4, 0
	bl ResetBlockReceivedFlag
	movs r0, 0x1
	b _080C85D2
_080C85D0:
	movs r0, 0
_080C85D2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80C85AC

	thumb_func_start sub_80C85D8
sub_80C85D8: @ 80C85D8
	push {r4,lr}
	movs r4, 0
_080C85DC:
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r0, 24
	asrs r0, r4
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080C85F2
	movs r0, 0
	b _080C85FE
_080C85F2:
	adds r4, 0x1
	cmp r4, 0x3
	ble _080C85DC
	bl ResetBlockReceivedFlags
	movs r0, 0x1
_080C85FE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80C85D8

	thumb_func_start sub_80C8604
sub_80C8604: @ 80C8604
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	ldr r5, _080C8638 @ =gTasks
	ldr r6, _080C863C @ =sub_80C8644
	ldr r4, _080C8640 @ =gBlockRecvBuffer
	movs r3, 0xFF
_080C8614:
	lsls r0, r1, 8
	adds r0, r4
	strh r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bls _080C8614
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r5
	movs r1, 0
	strh r1, [r0, 0x8]
	str r6, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C8638: .4byte gTasks
_080C863C: .4byte sub_80C8644
_080C8640: .4byte gBlockRecvBuffer
	thumb_func_end sub_80C8604

	thumb_func_start sub_80C8644
sub_80C8644: @ 80C8644
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C8658 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080C865C @ =sub_80C8660
	str r0, [r1]
	bx lr
	.align 2, 0
_080C8658: .4byte gTasks
_080C865C: .4byte sub_80C8660
	thumb_func_end sub_80C8644

	thumb_func_start sub_80C8660
sub_80C8660: @ 80C8660
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C8694 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _080C868E
	bl GetMultiplayerId
	ldr r1, _080C8698 @ =gContestPlayerMonIndex
	strb r0, [r1]
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _080C868E
	ldr r1, _080C869C @ =gIsLinkContest
	movs r0, 0x1
	strb r0, [r1]
	adds r0, r4, 0
	bl SwitchTaskToFollowupFunc
_080C868E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C8694: .4byte gReceivedRemoteLinkPlayers
_080C8698: .4byte gContestPlayerMonIndex
_080C869C: .4byte gIsLinkContest
	thumb_func_end sub_80C8660

	thumb_func_start sub_80C86A0
sub_80C86A0: @ 80C86A0
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0x2
	ldrb r0, [r4]
	cmp r0, 0xFC
	bne _080C86B6
	ldrb r0, [r4, 0x1]
	cmp r0, 0x15
	bne _080C86B6
	movs r0, 0x2
	b _080C872C
_080C86B6:
	adds r0, r4, 0
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x5
	bhi _080C872A
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _080C872A
_080C86CA:
	ldrb r1, [r4]
	adds r0, r1, 0
	adds r0, 0x45
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x33
	bls _080C871E
	adds r0, r1, 0
	adds r0, 0x5F
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bls _080C871E
	adds r0, r1, 0
	cmp r0, 0
	beq _080C871E
	cmp r0, 0xAD
	beq _080C871E
	cmp r0, 0xB8
	beq _080C871E
	cmp r0, 0xAB
	beq _080C871E
	cmp r0, 0xAC
	beq _080C871E
	cmp r0, 0xB5
	beq _080C871E
	cmp r0, 0xB6
	beq _080C871E
	cmp r0, 0xBA
	beq _080C871E
	cmp r0, 0xAE
	beq _080C871E
	cmp r0, 0xB0
	beq _080C871E
	cmp r0, 0xB1
	beq _080C871E
	cmp r0, 0xB2
	beq _080C871E
	cmp r0, 0xB3
	beq _080C871E
	cmp r0, 0xB1
	bne _080C8728
_080C871E:
	adds r4, 0x1
	ldrb r0, [r4]
	cmp r0, 0xFF
	bne _080C86CA
	b _080C872A
_080C8728:
	movs r5, 0x1
_080C872A:
	adds r0, r5, 0
_080C872C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80C86A0

	thumb_func_start sub_80C8734
sub_80C8734: @ 80C8734
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r1, _080C8768 @ =gTasks
	lsls r5, r0, 2
	adds r0, r5, r0
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080C876C
	cmp r0, 0x1
	beq _080C87D0
	movs r0, 0
	strh r0, [r4, 0x8]
	mov r0, r9
	bl SwitchTaskToFollowupFunc
	b _080C8896
	.align 2, 0
_080C8768: .4byte gTasks
_080C876C:
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	bne _080C87A8
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _080C8782
	b _080C8896
_080C8782:
	ldr r0, _080C879C @ =gBlockSendBuffer
	ldr r1, _080C87A0 @ =gContestPlayerMonIndex
	ldrb r1, [r1]
	lsls r1, 6
	ldr r2, _080C87A4 @ =gContestMons
	adds r1, r2
	movs r2, 0x40
	bl memcpy
	movs r0, 0x2
	bl sub_8007E9C
	b _080C87BA
	.align 2, 0
_080C879C: .4byte gBlockSendBuffer
_080C87A0: .4byte gContestPlayerMonIndex
_080C87A4: .4byte gContestMons
_080C87A8:
	ldr r0, _080C87C4 @ =gBlockSendBuffer
	ldr r1, _080C87C8 @ =gContestPlayerMonIndex
	ldrb r1, [r1]
	lsls r1, 6
	ldr r2, _080C87CC @ =gContestMons
	adds r1, r2
	movs r2, 0x40
	bl memcpy
_080C87BA:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080C8896
	.align 2, 0
_080C87C4: .4byte gBlockSendBuffer
_080C87C8: .4byte gContestPlayerMonIndex
_080C87CC: .4byte gContestMons
_080C87D0:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8896
	movs r7, 0
	str r5, [sp]
	ldr r0, _080C8818 @ =gContestMons
	ldr r6, _080C881C @ =gLinkPlayers
	movs r5, 0
	mov r10, r0
	movs r2, 0xFF
	mov r8, r2
_080C87EA:
	lsls r1, r7, 8
	ldr r0, _080C8820 @ =gBlockRecvBuffer
	adds r1, r0
	mov r0, r10
	movs r2, 0x40
	bl memcpy
	ldr r0, _080C8824 @ =gContestMons + 0x2
	adds r4, r5, r0
	ldrh r0, [r6, 0x1A]
	cmp r0, 0x1
	bne _080C8828
	adds r0, r4, 0
	bl sub_80C86A0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ConvertInternationalString
	b _080C883E
	.align 2, 0
_080C8818: .4byte gContestMons
_080C881C: .4byte gLinkPlayers
_080C8820: .4byte gBlockRecvBuffer
_080C8824: .4byte gContestMons + 0x2
_080C8828:
	ldrb r0, [r4, 0xA]
	cmp r0, 0xFC
	bne _080C8838
	adds r0, r4, 0
	movs r1, 0x1
	bl ConvertInternationalString
	b _080C883E
_080C8838:
	strb r0, [r4, 0x5]
	mov r1, r8
	strb r1, [r4, 0xA]
_080C883E:
	ldr r0, _080C886C @ =gUnknown_0203857D
	adds r4, r5, r0
	ldrh r0, [r6, 0x1A]
	cmp r0, 0x1
	bne _080C8870
	mov r2, r8
	strb r2, [r4, 0x7]
	ldrb r0, [r4, 0x4]
	strb r0, [r4, 0x6]
	ldrb r0, [r4, 0x3]
	strb r0, [r4, 0x5]
	ldrb r0, [r4, 0x2]
	strb r0, [r4, 0x4]
	ldrb r0, [r4, 0x1]
	strb r0, [r4, 0x3]
	ldrb r0, [r4]
	strb r0, [r4, 0x2]
	movs r0, 0x15
	strb r0, [r4, 0x1]
	movs r0, 0xFC
	strb r0, [r4]
	b _080C8878
	.align 2, 0
_080C886C: .4byte gUnknown_0203857D
_080C8870:
	ldrb r0, [r4, 0x7]
	strb r0, [r4, 0x5]
	mov r0, r8
	strb r0, [r4, 0x7]
_080C8878:
	adds r6, 0x1C
	adds r5, 0x40
	movs r1, 0x40
	add r10, r1
	adds r7, 0x1
	cmp r7, 0x3
	ble _080C87EA
	ldr r0, _080C88A8 @ =gTasks
	ldr r1, [sp]
	add r1, r9
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_080C8896:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C88A8: .4byte gTasks
	thumb_func_end sub_80C8734

	thumb_func_start sub_80C88AC
sub_80C88AC: @ 80C88AC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080C88D4 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080C88D8
	cmp r0, 0x1
	beq _080C88FC
	movs r0, 0
	strh r0, [r5, 0x8]
	adds r0, r2, 0
	bl SwitchTaskToFollowupFunc
	b _080C8924
	.align 2, 0
_080C88D4: .4byte gTasks
_080C88D8:
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	bne _080C891E
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8924
	ldr r0, _080C88F8 @ =gRngValue
	movs r1, 0x4
	bl sub_80C857C
	b _080C891E
	.align 2, 0
_080C88F8: .4byte gRngValue
_080C88FC:
	movs r0, 0
	bl sub_80C85AC
	lsls r0, 24
	cmp r0, 0
	beq _080C8924
	ldr r0, _080C892C @ =gRngValue
	ldr r4, _080C8930 @ =gBlockRecvBuffer
	adds r1, r4, 0
	movs r2, 0x4
	bl memcpy
	ldr r0, _080C8934 @ =gUnknown_03005D28
	adds r1, r4, 0
	movs r2, 0x4
	bl memcpy
_080C891E:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_080C8924:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C892C: .4byte gRngValue
_080C8930: .4byte gBlockRecvBuffer
_080C8934: .4byte gUnknown_03005D28
	thumb_func_end sub_80C88AC

	thumb_func_start sub_80C8938
sub_80C8938: @ 80C8938
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080C8968 @ =gTasks
	mov r8, r0
	lsls r6, r5, 2
	adds r0, r6, r5
	lsls r7, r0, 3
	mov r1, r8
	adds r4, r7, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080C896C
	cmp r0, 0x1
	beq _080C8998
	movs r0, 0
	strh r0, [r4, 0x8]
	adds r0, r5, 0
	bl SwitchTaskToFollowupFunc
	b _080C89CE
	.align 2, 0
_080C8968: .4byte gTasks
_080C896C:
	ldr r1, _080C8994 @ =gBlockSendBuffer
	ldrh r0, [r4, 0x1A]
	strb r0, [r1]
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	bne _080C898C
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C89CE
	movs r0, 0x2
	bl sub_8007E9C
_080C898C:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080C89CE
	.align 2, 0
_080C8994: .4byte gBlockSendBuffer
_080C8998:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C89CE
	movs r3, 0
	mov r12, r8
	adds r1, r6, 0
	ldr r4, _080C89D8 @ =gBlockRecvBuffer
	mov r0, r12
	adds r0, 0xA
	adds r2, r7, r0
	movs r6, 0x80
	lsls r6, 1
_080C89B4:
	ldrh r0, [r4]
	strh r0, [r2]
	adds r4, r6
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x3
	ble _080C89B4
	adds r1, r5
	lsls r1, 3
	add r1, r12
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_080C89CE:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C89D8: .4byte gBlockRecvBuffer
	thumb_func_end sub_80C8938

	thumb_func_start sub_80C89DC
sub_80C89DC: @ 80C89DC
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080C8A04 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080C8A08
	cmp r0, 0x1
	beq _080C8A20
	movs r0, 0
	strh r0, [r4, 0x8]
	adds r0, r2, 0
	bl SwitchTaskToFollowupFunc
	b _080C8A30
	.align 2, 0
_080C8A04: .4byte gTasks
_080C8A08:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8A30
	ldr r0, _080C8A1C @ =gContestPlayerMonIndex
	movs r1, 0x1
	bl sub_80C857C
	b _080C8A2A
	.align 2, 0
_080C8A1C: .4byte gContestPlayerMonIndex
_080C8A20:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8A30
_080C8A2A:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080C8A30:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C89DC

	thumb_func_start sub_80C8A38
sub_80C8A38: @ 80C8A38
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r7, _080C8A60 @ =gTasks
	lsls r6, r5, 2
	adds r0, r6, r5
	lsls r0, 3
	adds r4, r0, r7
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080C8A64
	cmp r0, 0x1
	beq _080C8A94
	movs r0, 0
	strh r0, [r4, 0x8]
	adds r0, r5, 0
	bl SwitchTaskToFollowupFunc
	b _080C8AC2
	.align 2, 0
_080C8A60: .4byte gTasks
_080C8A64:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8AC2
	ldr r0, _080C8A8C @ =gContestPlayerMonIndex
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	ldr r1, _080C8A90 @ =gSharedMem + 0x19266
	adds r0, r1
	movs r1, 0x2
	bl sub_80C857C
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080C8AC2
	.align 2, 0
_080C8A8C: .4byte gContestPlayerMonIndex
_080C8A90: .4byte gSharedMem + 0x19266
_080C8A94:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8AC2
	ldr r1, _080C8AC8 @ =gBlockRecvBuffer
	ldr r3, _080C8ACC @ =gSharedMem + 0x19266
	movs r4, 0x80
	lsls r4, 1
	movs r2, 0x3
_080C8AA8:
	ldrh r0, [r1]
	strh r0, [r3]
	adds r1, r4
	adds r3, 0x1C
	subs r2, 0x1
	cmp r2, 0
	bge _080C8AA8
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r7
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_080C8AC2:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C8AC8: .4byte gBlockRecvBuffer
_080C8ACC: .4byte gSharedMem + 0x19266
	thumb_func_end sub_80C8A38

	thumb_func_start sub_80C8AD0
sub_80C8AD0: @ 80C8AD0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080C8AF8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	movs r3, 0x8
	ldrsh r0, [r2, r3]
	adds r3, r1, 0
	cmp r0, 0xB
	bls _080C8AEC
	b _080C8C70
_080C8AEC:
	lsls r0, 2
	ldr r1, _080C8AFC @ =_080C8B00
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C8AF8: .4byte gTasks
_080C8AFC: .4byte _080C8B00
	.align 2, 0
_080C8B00:
	.4byte _080C8B30
	.4byte _080C8B4C
	.4byte _080C8B74
	.4byte _080C8B98
	.4byte _080C8BB0
	.4byte _080C8B74
	.4byte _080C8BD8
	.4byte _080C8BF0
	.4byte _080C8B74
	.4byte _080C8C18
	.4byte _080C8C30
	.4byte _080C8B74
_080C8B30:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _080C8B3C
	b _080C8C7A
_080C8B3C:
	ldr r0, _080C8B48 @ =gUnknown_02038678
	movs r1, 0x8
	bl sub_80C857C
	b _080C8C4C
	.align 2, 0
_080C8B48: .4byte gUnknown_02038678
_080C8B4C:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	bne _080C8B58
	b _080C8C7A
_080C8B58:
	ldr r0, _080C8B68 @ =gUnknown_02038678
	ldr r1, _080C8B6C @ =gUnknown_0203869B
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C8B70 @ =gBlockRecvBuffer
	adds r1, r2
	movs r2, 0x8
	b _080C8C48
	.align 2, 0
_080C8B68: .4byte gUnknown_02038678
_080C8B6C: .4byte gUnknown_0203869B
_080C8B70: .4byte gBlockRecvBuffer
_080C8B74:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r3
	ldrh r0, [r2, 0xA]
	adds r1, r0, 0x1
	strh r1, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bgt _080C8B8C
	b _080C8C7A
_080C8B8C:
	movs r0, 0
	strh r0, [r2, 0xA]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _080C8C7A
_080C8B98:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8C7A
	ldr r0, _080C8BAC @ =gUnknown_02038680
	movs r1, 0x8
	bl sub_80C857C
	b _080C8C4C
	.align 2, 0
_080C8BAC: .4byte gUnknown_02038680
_080C8BB0:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8C7A
	ldr r0, _080C8BCC @ =gUnknown_02038680
	ldr r1, _080C8BD0 @ =gUnknown_0203869B
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C8BD4 @ =gBlockRecvBuffer
	adds r1, r2
	movs r2, 0x8
	b _080C8C48
	.align 2, 0
_080C8BCC: .4byte gUnknown_02038680
_080C8BD0: .4byte gUnknown_0203869B
_080C8BD4: .4byte gBlockRecvBuffer
_080C8BD8:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8C7A
	ldr r0, _080C8BEC @ =gUnknown_02038688
	movs r1, 0x8
	bl sub_80C857C
	b _080C8C4C
	.align 2, 0
_080C8BEC: .4byte gUnknown_02038688
_080C8BF0:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8C7A
	ldr r0, _080C8C0C @ =gUnknown_02038688
	ldr r1, _080C8C10 @ =gUnknown_0203869B
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C8C14 @ =gBlockRecvBuffer
	adds r1, r2
	movs r2, 0x8
	b _080C8C48
	.align 2, 0
_080C8C0C: .4byte gUnknown_02038688
_080C8C10: .4byte gUnknown_0203869B
_080C8C14: .4byte gBlockRecvBuffer
_080C8C18:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8C7A
	ldr r0, _080C8C2C @ =gUnknown_02038690
	movs r1, 0x4
	bl sub_80C857C
	b _080C8C4C
	.align 2, 0
_080C8C2C: .4byte gUnknown_02038690
_080C8C30:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8C7A
	ldr r0, _080C8C60 @ =gUnknown_02038690
	ldr r1, _080C8C64 @ =gUnknown_0203869B
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C8C68 @ =gBlockRecvBuffer
	adds r1, r2
	movs r2, 0x4
_080C8C48:
	bl memcpy
_080C8C4C:
	ldr r1, _080C8C6C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _080C8C7A
	.align 2, 0
_080C8C60: .4byte gUnknown_02038690
_080C8C64: .4byte gUnknown_0203869B
_080C8C68: .4byte gBlockRecvBuffer
_080C8C6C: .4byte gTasks
_080C8C70:
	movs r0, 0
	strh r0, [r2, 0x8]
	adds r0, r4, 0
	bl SwitchTaskToFollowupFunc
_080C8C7A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C8AD0

	thumb_func_start sub_80C8C80
sub_80C8C80: @ 80C8C80
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080C8CA8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	movs r3, 0x8
	ldrsh r0, [r2, r3]
	adds r3, r1, 0
	cmp r0, 0xB
	bls _080C8C9C
	b _080C8E0C
_080C8C9C:
	lsls r0, 2
	ldr r1, _080C8CAC @ =_080C8CB0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C8CA8: .4byte gTasks
_080C8CAC: .4byte _080C8CB0
	.align 2, 0
_080C8CB0:
	.4byte _080C8CE0
	.4byte _080C8CFC
	.4byte _080C8D24
	.4byte _080C8D46
	.4byte _080C8D60
	.4byte _080C8D24
	.4byte _080C8D88
	.4byte _080C8DA0
	.4byte _080C8D24
	.4byte _080C8DB4
	.4byte _080C8DCC
	.4byte _080C8D24
_080C8CE0:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _080C8CEC
	b _080C8E16
_080C8CEC:
	ldr r0, _080C8CF8 @ =gSharedMem + 0x19260
	movs r1, 0x70
	bl sub_80C857C
	b _080C8DE8
	.align 2, 0
_080C8CF8: .4byte gSharedMem + 0x19260
_080C8CFC:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	bne _080C8D08
	b _080C8E16
_080C8D08:
	ldr r0, _080C8D18 @ =gSharedMem + 0x19260
	ldr r1, _080C8D1C @ =gUnknown_0203869B
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C8D20 @ =gBlockRecvBuffer
	adds r1, r2
	movs r2, 0x70
	b _080C8DE4
	.align 2, 0
_080C8D18: .4byte gSharedMem + 0x19260
_080C8D1C: .4byte gUnknown_0203869B
_080C8D20: .4byte gBlockRecvBuffer
_080C8D24:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r3
	ldrh r0, [r2, 0xA]
	adds r1, r0, 0x1
	strh r1, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	ble _080C8E16
	movs r0, 0
	strh r0, [r2, 0xA]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _080C8E16
_080C8D46:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8E16
	ldr r0, _080C8D5C @ =gSharedMem + 0x192D0
	movs r1, 0x14
	bl sub_80C857C
	b _080C8DE8
	.align 2, 0
_080C8D5C: .4byte gSharedMem + 0x192D0
_080C8D60:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8E16
	ldr r0, _080C8D7C @ =gSharedMem + 0x192D0
	ldr r1, _080C8D80 @ =gUnknown_0203869B
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C8D84 @ =gBlockRecvBuffer
	adds r1, r2
	movs r2, 0x14
	b _080C8DE4
	.align 2, 0
_080C8D7C: .4byte gSharedMem + 0x192D0
_080C8D80: .4byte gUnknown_0203869B
_080C8D84: .4byte gBlockRecvBuffer
_080C8D88:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8E16
	ldr r0, _080C8D9C @ =gSharedMem + 0x19328
	movs r1, 0x4
	bl sub_80C857C
	b _080C8DE8
	.align 2, 0
_080C8D9C: .4byte gSharedMem + 0x19328
_080C8DA0:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8E16
	ldr r0, _080C8DB0 @ =gSharedMem + 0x19328
	b _080C8DD8
	.align 2, 0
_080C8DB0: .4byte gSharedMem + 0x19328
_080C8DB4:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8E16
	ldr r0, _080C8DC8 @ =gUnknown_02038696
	movs r1, 0x4
	bl sub_80C857C
	b _080C8DE8
	.align 2, 0
_080C8DC8: .4byte gUnknown_02038696
_080C8DCC:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8E16
	ldr r0, _080C8DFC @ =gUnknown_02038696
_080C8DD8:
	ldr r1, _080C8E00 @ =gUnknown_0203869B
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C8E04 @ =gBlockRecvBuffer
	adds r1, r2
	movs r2, 0x4
_080C8DE4:
	bl memcpy
_080C8DE8:
	ldr r1, _080C8E08 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _080C8E16
	.align 2, 0
_080C8DFC: .4byte gUnknown_02038696
_080C8E00: .4byte gUnknown_0203869B
_080C8E04: .4byte gBlockRecvBuffer
_080C8E08: .4byte gTasks
_080C8E0C:
	movs r0, 0
	strh r0, [r2, 0x8]
	adds r0, r4, 0
	bl SwitchTaskToFollowupFunc
_080C8E16:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C8C80

	thumb_func_start sub_80C8E1C
sub_80C8E1C: @ 80C8E1C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080C8E4C @ =gTasks
	mov r8, r0
	lsls r6, r5, 2
	adds r0, r6, r5
	lsls r7, r0, 3
	mov r1, r8
	adds r4, r7, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080C8E50
	cmp r0, 0x1
	beq _080C8E7C
	movs r0, 0
	strh r0, [r4, 0x8]
	adds r0, r5, 0
	bl SwitchTaskToFollowupFunc
	b _080C8EAE
	.align 2, 0
_080C8E4C: .4byte gTasks
_080C8E50:
	ldr r1, _080C8E78 @ =gBlockSendBuffer
	movs r0, 0x64
	strb r0, [r1]
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	bne _080C8E70
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8EAE
	movs r0, 0x2
	bl sub_8007E9C
_080C8E70:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080C8EAE
	.align 2, 0
_080C8E78: .4byte gBlockSendBuffer
_080C8E7C:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8EAE
	ldr r1, _080C8EB8 @ =gBlockRecvBuffer
	mov r0, r8
	adds r0, 0x12
	adds r2, r7, r0
	movs r4, 0x80
	lsls r4, 1
	movs r3, 0x3
_080C8E94:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, r4
	adds r2, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080C8E94
	adds r1, r6, r5
	lsls r1, 3
	add r1, r8
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_080C8EAE:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C8EB8: .4byte gBlockRecvBuffer
	thumb_func_end sub_80C8E1C

	thumb_func_start sub_80C8EBC
sub_80C8EBC: @ 80C8EBC
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080C8EE4 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080C8EE8
	cmp r0, 0x1
	beq _080C8F00
	movs r0, 0
	strh r0, [r4, 0x8]
	adds r0, r2, 0
	bl SwitchTaskToFollowupFunc
	b _080C8F22
	.align 2, 0
_080C8EE4: .4byte gTasks
_080C8EE8:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8F22
	ldr r0, _080C8EFC @ =gUnknown_02038670
	movs r1, 0x8
	bl sub_80C857C
	b _080C8F1C
	.align 2, 0
_080C8EFC: .4byte gUnknown_02038670
_080C8F00:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8F22
	ldr r0, _080C8F28 @ =gUnknown_02038670
	ldr r1, _080C8F2C @ =gUnknown_0203869B
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C8F30 @ =gBlockRecvBuffer
	adds r1, r2
	movs r2, 0x8
	bl memcpy
_080C8F1C:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080C8F22:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C8F28: .4byte gUnknown_02038670
_080C8F2C: .4byte gUnknown_0203869B
_080C8F30: .4byte gBlockRecvBuffer
	thumb_func_end sub_80C8EBC

	thumb_func_start sub_80C8F34
sub_80C8F34: @ 80C8F34
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080C8F5C @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080C8F60
	cmp r0, 0x1
	beq _080C8F78
	movs r0, 0
	strh r0, [r4, 0x8]
	adds r0, r2, 0
	bl SwitchTaskToFollowupFunc
	b _080C8F9A
	.align 2, 0
_080C8F5C: .4byte gTasks
_080C8F60:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8F9A
	ldr r0, _080C8F74 @ =gUnknown_02038696
	movs r1, 0x4
	bl sub_80C857C
	b _080C8F94
	.align 2, 0
_080C8F74: .4byte gUnknown_02038696
_080C8F78:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8F9A
	ldr r0, _080C8FA0 @ =gUnknown_02038696
	ldr r1, _080C8FA4 @ =gUnknown_0203869B
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C8FA8 @ =gBlockRecvBuffer
	adds r1, r2
	movs r2, 0x4
	bl memcpy
_080C8F94:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080C8F9A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C8FA0: .4byte gUnknown_02038696
_080C8FA4: .4byte gUnknown_0203869B
_080C8FA8: .4byte gBlockRecvBuffer
	thumb_func_end sub_80C8F34

	.align 2, 0 @ Don't pad with nop.
