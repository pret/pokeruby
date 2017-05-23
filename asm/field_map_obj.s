	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_805E5DC
sub_805E5DC: @ 805E5DC
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805E5F8 @ =gMapObjects
	adds r0, r2
	ldr r2, _0805E5FC @ =sub_805E600
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805E5F8: .4byte gMapObjects
_0805E5FC: .4byte sub_805E600
	thumb_func_end sub_805E5DC

	thumb_func_start sub_805E600
sub_805E600: @ 805E600
	push {r4,lr}
	ldr r3, _0805E61C @ =gUnknown_0837540C
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805E61C: .4byte gUnknown_0837540C
	thumb_func_end sub_805E600

	thumb_func_start sub_805E620
sub_805E620: @ 805E620
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805E664 @ =gUnknown_08375418
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805E64C
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805E64C
	movs r0, 0x3
	strb r0, [r2]
_0805E64C:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805E664: .4byte gUnknown_08375418
	thumb_func_end sub_805E620

	thumb_func_start sub_805E668
sub_805E668: @ 805E668
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805E684 @ =gMapObjects
	adds r0, r2
	ldr r2, _0805E688 @ =sub_805E68C
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805E684: .4byte gMapObjects
_0805E688: .4byte sub_805E68C
	thumb_func_end sub_805E668

	thumb_func_start sub_805E68C
sub_805E68C: @ 805E68C
	push {r4,lr}
	ldr r3, _0805E6A8 @ =gUnknown_0837541C
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805E6A8: .4byte gUnknown_0837541C
	thumb_func_end sub_805E68C

	thumb_func_start sub_805E6AC
sub_805E6AC: @ 805E6AC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805E6F0 @ =gUnknown_08375428
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _0805E6D8
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805E6D8
	movs r0, 0x2
	strb r0, [r2]
_0805E6D8:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805E6F0: .4byte gUnknown_08375428
	thumb_func_end sub_805E6AC

	thumb_func_start sub_805E6F4
sub_805E6F4: @ 805E6F4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805E710 @ =gMapObjects
	adds r0, r2
	ldr r2, _0805E714 @ =sub_805E718
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805E710: .4byte gMapObjects
_0805E714: .4byte sub_805E718
	thumb_func_end sub_805E6F4

	thumb_func_start sub_805E718
sub_805E718: @ 805E718
	push {r4,lr}
	ldr r3, _0805E734 @ =gUnknown_0837542C
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805E734: .4byte gUnknown_0837542C
	thumb_func_end sub_805E718

	thumb_func_start sub_805E738
sub_805E738: @ 805E738
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805E77C @ =gUnknown_08375438
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _0805E764
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805E764
	movs r0, 0x2
	strb r0, [r2]
_0805E764:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805E77C: .4byte gUnknown_08375438
	thumb_func_end sub_805E738

	thumb_func_start sub_805E780
sub_805E780: @ 805E780
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805E79C @ =gMapObjects
	adds r0, r2
	ldr r2, _0805E7A0 @ =sub_805E7A4
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805E79C: .4byte gMapObjects
_0805E7A0: .4byte sub_805E7A4
	thumb_func_end sub_805E780

	thumb_func_start sub_805E7A4
sub_805E7A4: @ 805E7A4
	push {r4,lr}
	ldr r3, _0805E7C0 @ =gUnknown_0837543C
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805E7C0: .4byte gUnknown_0837543C
	thumb_func_end sub_805E7A4

	thumb_func_start sub_805E7C4
sub_805E7C4: @ 805E7C4
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805E808 @ =gUnknown_08375448
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805E7F0
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805E7F0
	movs r0, 0x3
	strb r0, [r2]
_0805E7F0:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805E808: .4byte gUnknown_08375448
	thumb_func_end sub_805E7C4

	thumb_func_start sub_805E80C
sub_805E80C: @ 805E80C
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805E828 @ =gMapObjects
	adds r0, r2
	ldr r2, _0805E82C @ =sub_805E830
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805E828: .4byte gMapObjects
_0805E82C: .4byte sub_805E830
	thumb_func_end sub_805E80C

	thumb_func_start sub_805E830
sub_805E830: @ 805E830
	push {r4,lr}
	ldr r3, _0805E84C @ =gUnknown_0837544C
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805E84C: .4byte gUnknown_0837544C
	thumb_func_end sub_805E830

	thumb_func_start sub_805E850
sub_805E850: @ 805E850
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805E894 @ =gUnknown_08375458
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805E87C
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805E87C
	movs r0, 0x3
	strb r0, [r2]
_0805E87C:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805E894: .4byte gUnknown_08375458
	thumb_func_end sub_805E850

	thumb_func_start sub_805E898
sub_805E898: @ 805E898
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805E8B4 @ =gMapObjects
	adds r0, r2
	ldr r2, _0805E8B8 @ =sub_805E8BC
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805E8B4: .4byte gMapObjects
_0805E8B8: .4byte sub_805E8BC
	thumb_func_end sub_805E898

	thumb_func_start sub_805E8BC
sub_805E8BC: @ 805E8BC
	push {r4,lr}
	ldr r3, _0805E8D8 @ =gUnknown_0837545C
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805E8D8: .4byte gUnknown_0837545C
	thumb_func_end sub_805E8BC

	thumb_func_start sub_805E8DC
sub_805E8DC: @ 805E8DC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805E920 @ =gUnknown_08375468
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _0805E908
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805E908
	movs r0, 0x2
	strb r0, [r2]
_0805E908:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805E920: .4byte gUnknown_08375468
	thumb_func_end sub_805E8DC

	thumb_func_start sub_805E924
sub_805E924: @ 805E924
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805E940 @ =gMapObjects
	adds r0, r2
	ldr r2, _0805E944 @ =sub_805E948
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805E940: .4byte gMapObjects
_0805E944: .4byte sub_805E948
	thumb_func_end sub_805E924

	thumb_func_start sub_805E948
sub_805E948: @ 805E948
	push {r4,lr}
	ldr r3, _0805E964 @ =gUnknown_0837546C
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805E964: .4byte gUnknown_0837546C
	thumb_func_end sub_805E948

	thumb_func_start sub_805E968
sub_805E968: @ 805E968
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805E9AC @ =gUnknown_08375240
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _0805E994
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805E994
	movs r0, 0x2
	strb r0, [r2]
_0805E994:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805E9AC: .4byte gUnknown_08375240
	thumb_func_end sub_805E968

	thumb_func_start sub_805E9B0
sub_805E9B0: @ 805E9B0
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805E9CC @ =gMapObjects
	adds r0, r2
	ldr r2, _0805E9D0 @ =sub_805E9D4
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805E9CC: .4byte gMapObjects
_0805E9D0: .4byte sub_805E9D4
	thumb_func_end sub_805E9B0

	thumb_func_start sub_805E9D4
sub_805E9D4: @ 805E9D4
	push {r4,lr}
	ldr r3, _0805E9F0 @ =gUnknown_08375478
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805E9F0: .4byte gUnknown_08375478
	thumb_func_end sub_805E9D4

	thumb_func_start sub_805E9F4
sub_805E9F4: @ 805E9F4
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805EA38 @ =gUnknown_08375484
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805EA20
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805EA20
	movs r0, 0x3
	strb r0, [r2]
_0805EA20:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805EA38: .4byte gUnknown_08375484
	thumb_func_end sub_805E9F4

	thumb_func_start sub_805EA3C
sub_805EA3C: @ 805EA3C
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EA58 @ =gMapObjects
	adds r0, r2
	ldr r2, _0805EA5C @ =sub_805EA60
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EA58: .4byte gMapObjects
_0805EA5C: .4byte sub_805EA60
	thumb_func_end sub_805EA3C

	thumb_func_start sub_805EA60
sub_805EA60: @ 805EA60
	push {r4,lr}
	ldr r3, _0805EA7C @ =gUnknown_08375488
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805EA7C: .4byte gUnknown_08375488
	thumb_func_end sub_805EA60

	thumb_func_start sub_805EA80
sub_805EA80: @ 805EA80
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805EAC4 @ =gUnknown_08375494
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805EAAC
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805EAAC
	movs r0, 0x3
	strb r0, [r2]
_0805EAAC:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805EAC4: .4byte gUnknown_08375494
	thumb_func_end sub_805EA80

	thumb_func_start sub_805EAC8
sub_805EAC8: @ 805EAC8
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EAE4 @ =gMapObjects
	adds r0, r2
	ldr r2, _0805EAE8 @ =sub_805EAEC
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EAE4: .4byte gMapObjects
_0805EAE8: .4byte sub_805EAEC
	thumb_func_end sub_805EAC8

	thumb_func_start sub_805EAEC
sub_805EAEC: @ 805EAEC
	push {r4,lr}
	ldr r3, _0805EB08 @ =gUnknown_08375498
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805EB08: .4byte gUnknown_08375498
	thumb_func_end sub_805EAEC

	thumb_func_start sub_805EB0C
sub_805EB0C: @ 805EB0C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805EB50 @ =gUnknown_083754A4
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _0805EB38
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805EB38
	movs r0, 0x2
	strb r0, [r2]
_0805EB38:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805EB50: .4byte gUnknown_083754A4
	thumb_func_end sub_805EB0C

	thumb_func_start sub_805EB54
sub_805EB54: @ 805EB54
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EB70 @ =gMapObjects
	adds r0, r2
	ldr r2, _0805EB74 @ =sub_805EB78
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EB70: .4byte gMapObjects
_0805EB74: .4byte sub_805EB78
	thumb_func_end sub_805EB54

	thumb_func_start sub_805EB78
sub_805EB78: @ 805EB78
	push {r4,lr}
	ldr r3, _0805EB94 @ =gUnknown_083754A8
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805EB94: .4byte gUnknown_083754A8
	thumb_func_end sub_805EB78

	thumb_func_start sub_805EB98
sub_805EB98: @ 805EB98
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805EBDC @ =gUnknown_083754B4
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _0805EBC4
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805EBC4
	movs r0, 0x2
	strb r0, [r2]
_0805EBC4:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805EBDC: .4byte gUnknown_083754B4
	thumb_func_end sub_805EB98

	thumb_func_start sub_805EBE0
sub_805EBE0: @ 805EBE0
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EBFC @ =gMapObjects
	adds r0, r2
	ldr r2, _0805EC00 @ =sub_805EC04
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EBFC: .4byte gMapObjects
_0805EC00: .4byte sub_805EC04
	thumb_func_end sub_805EBE0

	thumb_func_start sub_805EC04
sub_805EC04: @ 805EC04
	push {r4,lr}
	ldr r3, _0805EC20 @ =gUnknown_083754B8
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805EC20: .4byte gUnknown_083754B8
	thumb_func_end sub_805EC04

	thumb_func_start sub_805EC24
sub_805EC24: @ 805EC24
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805EC68 @ =gUnknown_083754C4
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805EC50
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805EC50
	movs r0, 0x3
	strb r0, [r2]
_0805EC50:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805EC68: .4byte gUnknown_083754C4
	thumb_func_end sub_805EC24

	thumb_func_start sub_805EC6C
sub_805EC6C: @ 805EC6C
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EC88 @ =gMapObjects
	adds r0, r2
	ldr r2, _0805EC8C @ =sub_805EC90
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EC88: .4byte gMapObjects
_0805EC8C: .4byte sub_805EC90
	thumb_func_end sub_805EC6C

	thumb_func_start sub_805EC90
sub_805EC90: @ 805EC90
	push {r4,lr}
	ldr r3, _0805ECAC @ =gUnknown_083754C8
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805ECAC: .4byte gUnknown_083754C8
	thumb_func_end sub_805EC90

	thumb_func_start sub_805ECB0
sub_805ECB0: @ 805ECB0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805ECF4 @ =gUnknown_083754D4
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805ECDC
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805ECDC
	movs r0, 0x3
	strb r0, [r2]
_0805ECDC:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805ECF4: .4byte gUnknown_083754D4
	thumb_func_end sub_805ECB0

	thumb_func_start sub_805ECF8
sub_805ECF8: @ 805ECF8
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805ED14 @ =gMapObjects
	adds r0, r2
	ldr r2, _0805ED18 @ =sub_805ED1C
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805ED14: .4byte gMapObjects
_0805ED18: .4byte sub_805ED1C
	thumb_func_end sub_805ECF8

	thumb_func_start sub_805ED1C
sub_805ED1C: @ 805ED1C
	push {r4,lr}
	ldr r3, _0805ED38 @ =gUnknown_083754D8
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805ED38: .4byte gUnknown_083754D8
	thumb_func_end sub_805ED1C

	thumb_func_start sub_805ED3C
sub_805ED3C: @ 805ED3C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805ED80 @ =gUnknown_083754E4
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _0805ED68
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805ED68
	movs r0, 0x2
	strb r0, [r2]
_0805ED68:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805ED80: .4byte gUnknown_083754E4
	thumb_func_end sub_805ED3C

	thumb_func_start sub_805ED84
sub_805ED84: @ 805ED84
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EDA0 @ =gMapObjects
	adds r0, r2
	ldr r2, _0805EDA4 @ =sub_805EDA8
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EDA0: .4byte gMapObjects
_0805EDA4: .4byte sub_805EDA8
	thumb_func_end sub_805ED84

	thumb_func_start sub_805EDA8
sub_805EDA8: @ 805EDA8
	push {r4,lr}
	ldr r3, _0805EDC4 @ =gUnknown_083754E8
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805EDC4: .4byte gUnknown_083754E8
	thumb_func_end sub_805EDA8

	thumb_func_start sub_805EDC8
sub_805EDC8: @ 805EDC8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805EE0C @ =gUnknown_083754F4
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _0805EDF4
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805EDF4
	movs r0, 0x2
	strb r0, [r2]
_0805EDF4:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805EE0C: .4byte gUnknown_083754F4
	thumb_func_end sub_805EDC8

	thumb_func_start sub_805EE10
sub_805EE10: @ 805EE10
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EE2C @ =gMapObjects
	adds r0, r2
	ldr r2, _0805EE30 @ =sub_805EE34
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EE2C: .4byte gMapObjects
_0805EE30: .4byte sub_805EE34
	thumb_func_end sub_805EE10

	thumb_func_start sub_805EE34
sub_805EE34: @ 805EE34
	push {r4,lr}
	ldr r3, _0805EE50 @ =gUnknown_083754F8
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805EE50: .4byte gUnknown_083754F8
	thumb_func_end sub_805EE34

	thumb_func_start sub_805EE54
sub_805EE54: @ 805EE54
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805EE98 @ =gUnknown_08375504
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805EE80
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805EE80
	movs r0, 0x3
	strb r0, [r2]
_0805EE80:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805EE98: .4byte gUnknown_08375504
	thumb_func_end sub_805EE54

	thumb_func_start sub_805EE9C
sub_805EE9C: @ 805EE9C
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EEB8 @ =gMapObjects
	adds r0, r2
	ldr r2, _0805EEBC @ =sub_805EEC0
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EEB8: .4byte gMapObjects
_0805EEBC: .4byte sub_805EEC0
	thumb_func_end sub_805EE9C

	thumb_func_start sub_805EEC0
sub_805EEC0: @ 805EEC0
	push {r4,lr}
	ldr r3, _0805EEDC @ =gUnknown_08375508
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805EEDC: .4byte gUnknown_08375508
	thumb_func_end sub_805EEC0

	thumb_func_start sub_805EEE0
sub_805EEE0: @ 805EEE0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805EF24 @ =gUnknown_08375514
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805EF0C
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805EF0C
	movs r0, 0x3
	strb r0, [r2]
_0805EF0C:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805EF24: .4byte gUnknown_08375514
	thumb_func_end sub_805EEE0

	thumb_func_start sub_805EF28
sub_805EF28: @ 805EF28
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EF44 @ =gMapObjects
	adds r0, r2
	ldr r2, _0805EF48 @ =sub_805EF4C
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EF44: .4byte gMapObjects
_0805EF48: .4byte sub_805EF4C
	thumb_func_end sub_805EF28

	thumb_func_start sub_805EF4C
sub_805EF4C: @ 805EF4C
	push {r4,lr}
	ldr r3, _0805EF68 @ =gUnknown_08375518
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805EF68: .4byte gUnknown_08375518
	thumb_func_end sub_805EF4C

	thumb_func_start sub_805EF6C
sub_805EF6C: @ 805EF6C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805EFB0 @ =gUnknown_08375524
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805EF98
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805EF98
	movs r0, 0x3
	strb r0, [r2]
_0805EF98:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805EFB0: .4byte gUnknown_08375524
	thumb_func_end sub_805EF6C

	thumb_func_start sub_805EFB4
sub_805EFB4: @ 805EFB4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EFD0 @ =gMapObjects
	adds r0, r2
	ldr r2, _0805EFD4 @ =sub_805EFD8
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EFD0: .4byte gMapObjects
_0805EFD4: .4byte sub_805EFD8
	thumb_func_end sub_805EFB4

	thumb_func_start sub_805EFD8
sub_805EFD8: @ 805EFD8
	push {r4,lr}
	ldr r3, _0805EFF4 @ =gUnknown_08375528
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805EFF4: .4byte gUnknown_08375528
	thumb_func_end sub_805EFD8

	thumb_func_start sub_805EFF8
sub_805EFF8: @ 805EFF8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805F03C @ =gUnknown_08375534
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805F024
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805F024
	movs r0, 0x3
	strb r0, [r2]
_0805F024:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F03C: .4byte gUnknown_08375534
	thumb_func_end sub_805EFF8

	thumb_func_start sub_805F040
sub_805F040: @ 805F040
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805F05C @ =gMapObjects
	adds r0, r2
	ldr r2, _0805F060 @ =sub_805F064
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805F05C: .4byte gMapObjects
_0805F060: .4byte sub_805F064
	thumb_func_end sub_805F040

	thumb_func_start sub_805F064
sub_805F064: @ 805F064
	push {r4,lr}
	ldr r3, _0805F080 @ =gUnknown_08375538
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805F080: .4byte gUnknown_08375538
	thumb_func_end sub_805F064

	thumb_func_start sub_805F084
sub_805F084: @ 805F084
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805F0C8 @ =gUnknown_08375544
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805F0B0
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805F0B0
	movs r0, 0x3
	strb r0, [r2]
_0805F0B0:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F0C8: .4byte gUnknown_08375544
	thumb_func_end sub_805F084

	thumb_func_start sub_805F0CC
sub_805F0CC: @ 805F0CC
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805F0E8 @ =gMapObjects
	adds r0, r2
	ldr r2, _0805F0EC @ =sub_805F0F0
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805F0E8: .4byte gMapObjects
_0805F0EC: .4byte sub_805F0F0
	thumb_func_end sub_805F0CC

	thumb_func_start sub_805F0F0
sub_805F0F0: @ 805F0F0
	push {r4,lr}
	ldr r3, _0805F10C @ =gUnknown_08375548
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805F10C: .4byte gUnknown_08375548
	thumb_func_end sub_805F0F0

	thumb_func_start sub_805F110
sub_805F110: @ 805F110
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805F154 @ =gUnknown_08375554
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805F13C
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805F13C
	movs r0, 0x3
	strb r0, [r2]
_0805F13C:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F154: .4byte gUnknown_08375554
	thumb_func_end sub_805F110

	thumb_func_start sub_805F158
sub_805F158: @ 805F158
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805F174 @ =gMapObjects
	adds r0, r2
	ldr r2, _0805F178 @ =sub_805F17C
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805F174: .4byte gMapObjects
_0805F178: .4byte sub_805F17C
	thumb_func_end sub_805F158

	thumb_func_start sub_805F17C
sub_805F17C: @ 805F17C
	push {r4,lr}
	ldr r3, _0805F198 @ =gUnknown_08375558
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805F198: .4byte gUnknown_08375558
	thumb_func_end sub_805F17C

	thumb_func_start sub_805F19C
sub_805F19C: @ 805F19C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805F1E0 @ =gUnknown_08375564
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805F1C8
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805F1C8
	movs r0, 0x3
	strb r0, [r2]
_0805F1C8:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F1E0: .4byte gUnknown_08375564
	thumb_func_end sub_805F19C

	thumb_func_start sub_805F1E4
sub_805F1E4: @ 805F1E4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805F200 @ =gMapObjects
	adds r0, r2
	ldr r2, _0805F204 @ =sub_805F208
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805F200: .4byte gMapObjects
_0805F204: .4byte sub_805F208
	thumb_func_end sub_805F1E4

	thumb_func_start sub_805F208
sub_805F208: @ 805F208
	push {r4,lr}
	ldr r3, _0805F224 @ =gUnknown_08375568
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805F224: .4byte gUnknown_08375568
	thumb_func_end sub_805F208

	thumb_func_start sub_805F228
sub_805F228: @ 805F228
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805F26C @ =gUnknown_08375574
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805F254
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805F254
	movs r0, 0x3
	strb r0, [r2]
_0805F254:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F26C: .4byte gUnknown_08375574
	thumb_func_end sub_805F228

	thumb_func_start sub_805F270
sub_805F270: @ 805F270
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805F28C @ =gMapObjects
	adds r0, r2
	ldr r2, _0805F290 @ =sub_805F294
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805F28C: .4byte gMapObjects
_0805F290: .4byte sub_805F294
	thumb_func_end sub_805F270

	thumb_func_start sub_805F294
sub_805F294: @ 805F294
	push {r4,lr}
	ldr r3, _0805F2B0 @ =gUnknown_08375578
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805F2B0: .4byte gUnknown_08375578
	thumb_func_end sub_805F294

	thumb_func_start sub_805F2B4
sub_805F2B4: @ 805F2B4
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805F2F8 @ =gUnknown_08375584
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805F2E0
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805F2E0
	movs r0, 0x3
	strb r0, [r2]
_0805F2E0:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F2F8: .4byte gUnknown_08375584
	thumb_func_end sub_805F2B4

	thumb_func_start sub_805F2FC
sub_805F2FC: @ 805F2FC
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805F318 @ =gMapObjects
	adds r0, r2
	ldr r2, _0805F31C @ =sub_805F320
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805F318: .4byte gMapObjects
_0805F31C: .4byte sub_805F320
	thumb_func_end sub_805F2FC

	thumb_func_start sub_805F320
sub_805F320: @ 805F320
	push {r4,lr}
	ldr r3, _0805F33C @ =gUnknown_08375588
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805F33C: .4byte gUnknown_08375588
	thumb_func_end sub_805F320

	thumb_func_start mss_npc_reset_oampriv3_1_unk2_unk3
mss_npc_reset_oampriv3_1_unk2_unk3: @ 805F340
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	adds r4, 0x21
	ldrb r0, [r4]
	cmp r0, 0
	bne _0805F358
	bl player_get_direction_lower_nybble
	strb r0, [r4]
_0805F358:
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end mss_npc_reset_oampriv3_1_unk2_unk3

	thumb_func_start sub_805F364
sub_805F364: @ 805F364
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	ldr r2, _0805F388 @ =gMapObjects
	ldr r3, _0805F38C @ =gPlayerAvatar
	ldrb r1, [r3, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1C]
	cmp r0, 0xFF
	beq _0805F384
	ldrb r0, [r3, 0x3]
	cmp r0, 0x2
	bne _0805F390
_0805F384:
	movs r0, 0
	b _0805F3B8
	.align 2, 0
_0805F388: .4byte gMapObjects
_0805F38C: .4byte gPlayerAvatar
_0805F390:
	ldr r5, _0805F3C0 @ =gUnknown_08375594
	bl player_get_x22
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 22
	adds r4, r5
	bl player_get_direction_upper_nybble
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r4, [r4]
	adds r0, r6, 0
	adds r1, r7, 0
	movs r3, 0
	bl _call_via_r4
	lsls r0, 24
	lsrs r0, 24
_0805F3B8:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805F3C0: .4byte gUnknown_08375594
	thumb_func_end sub_805F364

	thumb_func_start sub_805F3C4
sub_805F3C4: @ 805F3C4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805F3E2
	ldrb r0, [r4]
	movs r1, 0x3
	negs r1, r1
	ands r1, r0
	strb r1, [r4]
	movs r0, 0x1
	strh r0, [r5, 0x30]
_0805F3E2:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805F3C4

	thumb_func_start sub_805F3EC
sub_805F3EC: @ 805F3EC
	movs r0, 0
	bx lr
	thumb_func_end sub_805F3EC

	thumb_func_start sub_805F3F0
sub_805F3F0: @ 805F3F0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r1, _0805F434 @ =gUnknown_0836DC09
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	bl state_to_direction
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F434: .4byte gUnknown_0836DC09
	thumb_func_end sub_805F3F0

	thumb_func_start sub_805F438
sub_805F438: @ 805F438
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _0805F4EC @ =gUnknown_0836DC09
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	mov r5, sp
	adds r5, 0x2
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, sp
	adds r3, r5, 0
	bl FieldObjectMoveDestCoords
	adds r0, r6, 0
	bl GetGoSpeed0AnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _0805F4BE
	mov r1, r8
	cmp r1, 0
	beq _0805F4D2
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _0805F4D2
_0805F4BE:
	adds r0, r6, 0
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
_0805F4D2:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805F4EC: .4byte gUnknown_0836DC09
	thumb_func_end sub_805F438

	thumb_func_start sub_805F4F0
sub_805F4F0: @ 805F4F0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _0805F5A4 @ =gUnknown_0836DC09
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	mov r5, sp
	adds r5, 0x2
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, sp
	adds r3, r5, 0
	bl FieldObjectMoveDestCoords
	adds r0, r6, 0
	bl sub_8060744
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _0805F576
	mov r1, r8
	cmp r1, 0
	beq _0805F58A
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _0805F58A
_0805F576:
	adds r0, r6, 0
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
_0805F58A:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805F5A4: .4byte gUnknown_0836DC09
	thumb_func_end sub_805F4F0

	thumb_func_start sub_805F5A8
sub_805F5A8: @ 805F5A8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _0805F65C @ =gUnknown_0836DC09
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	mov r5, sp
	adds r5, 0x2
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, sp
	adds r3, r5, 0
	bl FieldObjectMoveDestCoords
	adds r0, r6, 0
	bl sub_806079C
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _0805F62E
	mov r1, r8
	cmp r1, 0
	beq _0805F642
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _0805F642
_0805F62E:
	adds r0, r6, 0
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
_0805F642:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805F65C: .4byte gUnknown_0836DC09
	thumb_func_end sub_805F5A8

	thumb_func_start sub_805F660
sub_805F660: @ 805F660
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _0805F714 @ =gUnknown_0836DC09
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	mov r5, sp
	adds r5, 0x2
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, sp
	adds r3, r5, 0
	bl FieldObjectMoveDestCoords
	adds r0, r6, 0
	bl sub_80607C8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _0805F6E6
	mov r1, r8
	cmp r1, 0
	beq _0805F6FA
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _0805F6FA
_0805F6E6:
	adds r0, r6, 0
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
_0805F6FA:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805F714: .4byte gUnknown_0836DC09
	thumb_func_end sub_805F660

	thumb_func_start cph_IM_DIFFERENT
cph_IM_DIFFERENT: @ 805F718
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r1, _0805F75C @ =gUnknown_0836DC09
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	bl state_to_direction
	bl sub_806084C
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F75C: .4byte gUnknown_0836DC09
	thumb_func_end cph_IM_DIFFERENT

	thumb_func_start sub_805F760
sub_805F760: @ 805F760
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _0805F814 @ =gUnknown_0836DC09
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	mov r5, sp
	adds r5, 0x2
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, sp
	adds r3, r5, 0
	bl FieldObjectMoveDestCoords
	adds r0, r6, 0
	bl sub_80608A4
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _0805F7E6
	mov r1, r8
	cmp r1, 0
	beq _0805F7FA
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _0805F7FA
_0805F7E6:
	adds r0, r6, 0
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
_0805F7FA:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805F814: .4byte gUnknown_0836DC09
	thumb_func_end sub_805F760

	thumb_func_start oac_hopping
oac_hopping: @ 805F818
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _0805F8DC @ =gUnknown_0836DC09
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	ldrh r1, [r4, 0x10]
	add r0, sp, 0x4
	strh r1, [r0]
	ldrh r0, [r4, 0x12]
	mov r5, sp
	adds r5, 0x6
	strh r0, [r5]
	movs r0, 0x2
	str r0, [sp]
	adds r0, r6, 0
	add r1, sp, 0x4
	adds r2, r5, 0
	movs r3, 0x2
	bl sub_8060320
	adds r0, r6, 0
	bl GetJumpLedgeAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
	add r0, sp, 0x4
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _0805F8AC
	mov r1, r8
	cmp r1, 0
	beq _0805F8C0
	add r0, sp, 0x4
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _0805F8C0
_0805F8AC:
	adds r0, r6, 0
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
_0805F8C0:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805F8DC: .4byte gUnknown_0836DC09
	thumb_func_end oac_hopping

	thumb_func_start sub_805F8E0
sub_805F8E0: @ 805F8E0
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805F8FC @ =gMapObjects
	adds r0, r2
	ldr r2, _0805F900 @ =sub_805F904
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805F8FC: .4byte gMapObjects
_0805F900: .4byte sub_805F904
	thumb_func_end sub_805F8E0

	thumb_func_start sub_805F904
sub_805F904: @ 805F904
	push {r4,lr}
	ldr r3, _0805F920 @ =gUnknown_083755C0
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805F920: .4byte gUnknown_083755C0
	thumb_func_end sub_805F904

	thumb_func_start mss_08062EA4
mss_08062EA4: @ 805F924
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	ldr r2, _0805F948 @ =gMapObjects
	ldr r3, _0805F94C @ =gPlayerAvatar
	ldrb r1, [r3, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1C]
	cmp r0, 0xFF
	beq _0805F944
	ldrb r0, [r3, 0x3]
	cmp r0, 0x2
	bne _0805F950
_0805F944:
	movs r0, 0
	b _0805F978
	.align 2, 0
_0805F948: .4byte gMapObjects
_0805F94C: .4byte gPlayerAvatar
_0805F950:
	ldr r5, _0805F980 @ =gUnknown_08375594
	bl player_get_x22
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 22
	adds r4, r5
	bl player_get_direction_upper_nybble
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _0805F984 @ =MetatileBehavior_IsPokeGrass
	ldr r4, [r4]
	adds r0, r6, 0
	adds r1, r7, 0
	bl _call_via_r4
	lsls r0, 24
	lsrs r0, 24
_0805F978:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805F980: .4byte gUnknown_08375594
_0805F984: .4byte MetatileBehavior_IsPokeGrass
	thumb_func_end mss_08062EA4

	thumb_func_start FieldObjectCB_TreeDisguise
FieldObjectCB_TreeDisguise: @ 805F988
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _0805F9EC @ =gMapObjects
	adds r4, r1, r0
	adds r6, r4, 0
	adds r6, 0x21
	ldrb r0, [r6]
	cmp r0, 0
	beq _0805F9B0
	cmp r0, 0x1
	bne _0805F9D0
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0805F9D0
_0805F9B0:
	ldr r1, _0805F9F0 @ =gUnknown_0202FF84
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	adds r0, r4, 0
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0x1C
	bl FieldEffectStart
	strb r0, [r4, 0x1A]
	movs r0, 0x1
	strb r0, [r6]
	ldrh r0, [r5, 0x3C]
	adds r0, 0x1
	strh r0, [r5, 0x3C]
_0805F9D0:
	movs r0, 0x2E
	ldrsh r1, [r5, r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805F9EC @ =gMapObjects
	adds r0, r1
	ldr r2, _0805F9F4 @ =sub_805F9F8
	adds r1, r5, 0
	bl meta_step
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805F9EC: .4byte gMapObjects
_0805F9F0: .4byte gUnknown_0202FF84
_0805F9F4: .4byte sub_805F9F8
	thumb_func_end FieldObjectCB_TreeDisguise

	thumb_func_start sub_805F9F8
sub_805F9F8: @ 805F9F8
	push {lr}
	bl npc_reset
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_805F9F8

	thumb_func_start FieldObjectCB_MountainDisguise
FieldObjectCB_MountainDisguise: @ 805FA04
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _0805FA68 @ =gMapObjects
	adds r4, r1, r0
	adds r6, r4, 0
	adds r6, 0x21
	ldrb r0, [r6]
	cmp r0, 0
	beq _0805FA2C
	cmp r0, 0x1
	bne _0805FA4C
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0805FA4C
_0805FA2C:
	ldr r1, _0805FA6C @ =gUnknown_0202FF84
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	adds r0, r4, 0
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0x1D
	bl FieldEffectStart
	strb r0, [r4, 0x1A]
	movs r0, 0x1
	strb r0, [r6]
	ldrh r0, [r5, 0x3C]
	adds r0, 0x1
	strh r0, [r5, 0x3C]
_0805FA4C:
	movs r0, 0x2E
	ldrsh r1, [r5, r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805FA68 @ =gMapObjects
	adds r0, r1
	ldr r2, _0805FA70 @ =sub_805F9F8
	adds r1, r5, 0
	bl meta_step
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805FA68: .4byte gMapObjects
_0805FA6C: .4byte gUnknown_0202FF84
_0805FA70: .4byte sub_805F9F8
	thumb_func_end FieldObjectCB_MountainDisguise

	thumb_func_start FieldObjectCB_Hidden1
FieldObjectCB_Hidden1: @ 805FA74
	push {r4,lr}
	adds r3, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r3, r1]
	ldr r4, _0805FAD0 @ =gMapObjects
	cmp r0, 0
	bne _0805FAB4
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x3]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x3]
	adds r2, r3, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r3, 0x5]
	movs r1, 0xC
	orrs r0, r1
	strb r0, [r3, 0x5]
	ldrh r0, [r3, 0x3C]
	adds r0, 0x1
	strh r0, [r3, 0x3C]
_0805FAB4:
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r2, _0805FAD4 @ =sub_805FAD8
	adds r1, r3, 0
	bl meta_step
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805FAD0: .4byte gMapObjects
_0805FAD4: .4byte sub_805FAD8
	thumb_func_end FieldObjectCB_Hidden1

	thumb_func_start sub_805FAD8
sub_805FAD8: @ 805FAD8
	push {r4,lr}
	ldr r3, _0805FAF4 @ =gUnknown_083755CC
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805FAF4: .4byte gUnknown_083755CC
	thumb_func_end sub_805FAD8

	thumb_func_start sub_805FAF8
sub_805FAF8: @ 805FAF8
	push {lr}
	bl npc_reset
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_805FAF8

	thumb_func_start sub_805FB04
sub_805FB04: @ 805FB04
	push {r4,lr}
	adds r4, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805FB16
	movs r0, 0
	strh r0, [r4, 0x30]
_0805FB16:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805FB04

	thumb_func_start sub_805FB20
sub_805FB20: @ 805FB20
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805FB3C @ =gMapObjects
	adds r0, r2
	ldr r2, _0805FB40 @ =sub_805FB44
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805FB3C: .4byte gMapObjects
_0805FB40: .4byte sub_805FB44
	thumb_func_end sub_805FB20

	thumb_func_start sub_805FB44
sub_805FB44: @ 805FB44
	push {r4,lr}
	ldr r3, _0805FB60 @ =gUnknown_083755D0
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805FB60: .4byte gUnknown_083755D0
	thumb_func_end sub_805FB44

	thumb_func_start sub_805FB64
sub_805FB64: @ 805FB64
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetStepInPlaceDelay16AnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805FB64

	thumb_func_start sub_805FB90
sub_805FB90: @ 805FB90
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805FBAC @ =gMapObjects
	adds r0, r2
	ldr r2, _0805FBB0 @ =sub_805FBB4
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805FBAC: .4byte gMapObjects
_0805FBB0: .4byte sub_805FBB4
	thumb_func_end sub_805FB90

	thumb_func_start sub_805FBB4
sub_805FBB4: @ 805FBB4
	push {r4,lr}
	ldr r3, _0805FBD0 @ =gUnknown_083755D8
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805FBD0: .4byte gUnknown_083755D8
	thumb_func_end sub_805FBB4

	thumb_func_start sub_805FBD4
sub_805FBD4: @ 805FBD4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetStepInPlaceDelay8AnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805FBD4

	thumb_func_start sub_805FC00
sub_805FC00: @ 805FC00
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805FC1C @ =gMapObjects
	adds r0, r2
	ldr r2, _0805FC20 @ =sub_805FC24
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805FC1C: .4byte gMapObjects
_0805FC20: .4byte sub_805FC24
	thumb_func_end sub_805FC00

	thumb_func_start sub_805FC24
sub_805FC24: @ 805FC24
	push {r4,lr}
	ldr r3, _0805FC40 @ =gUnknown_083755E0
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805FC40: .4byte gUnknown_083755E0
	thumb_func_end sub_805FC24

	thumb_func_start sub_805FC44
sub_805FC44: @ 805FC44
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetStepInPlaceDelay4AnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805FC44

	thumb_func_start sub_805FC70
sub_805FC70: @ 805FC70
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805FC8C @ =gMapObjects
	adds r0, r2
	ldr r2, _0805FC90 @ =sub_805FC94
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805FC8C: .4byte gMapObjects
_0805FC90: .4byte sub_805FC94
	thumb_func_end sub_805FC70

	thumb_func_start sub_805FC94
sub_805FC94: @ 805FC94
	push {r4,lr}
	ldr r3, _0805FCB0 @ =gUnknown_083755E8
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805FCB0: .4byte gUnknown_083755E8
	thumb_func_end sub_805FC94

	thumb_func_start sub_805FCB4
sub_805FCB4: @ 805FCB4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805FCB4

	thumb_func_start sub_805FCE8
sub_805FCE8: @ 805FCE8
	push {r4,lr}
	adds r4, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	bne _0805FCFA
	movs r0, 0
	b _0805FD00
_0805FCFA:
	movs r0, 0x2
	strh r0, [r4, 0x30]
	movs r0, 0x1
_0805FD00:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805FCE8

	thumb_func_start sub_805FD08
sub_805FD08: @ 805FD08
	ldrb r2, [r0]
	movs r1, 0x3
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	movs r0, 0
	bx lr
	.align 2, 0
	thumb_func_end sub_805FD08

	.section .text_805fd18

	thumb_func_start IsMetatileDirectionallyImpassable
IsMetatileDirectionallyImpassable: @ 8060160
	push {r4-r7,lr}
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r7, r2, 16
	lsls r3, 24
	ldr r1, _080601A8 @ =gUnknown_08375684
	lsrs r3, 22
	subs r5, r3, 0x4
	adds r1, r5, r1
	ldrb r0, [r0, 0x1E]
	ldr r1, [r1]
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080601A2
	ldr r4, _080601AC @ =gUnknown_08375694
	adds r4, r5, r4
	lsls r0, r6, 16
	asrs r0, 16
	lsls r1, r7, 16
	asrs r1, 16
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	beq _080601B0
_080601A2:
	movs r0, 0x1
	b _080601B2
	.align 2, 0
_080601A8: .4byte gUnknown_08375684
_080601AC: .4byte gUnknown_08375694
_080601B0:
	movs r0, 0
_080601B2:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end IsMetatileDirectionallyImpassable

	thumb_func_start CheckForCollisionBetweenFieldObjects
CheckForCollisionBetweenFieldObjects: @ 80601B8
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r7, r1, 16
	movs r4, 0
	lsls r2, 16
	asrs r5, r2, 16
_080601C6:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	ldr r1, _0806021C @ =gMapObjects
	adds r2, r0, r1
	ldrb r0, [r2]
	lsls r0, 31
	cmp r0, 0
	beq _08060220
	cmp r2, r6
	beq _08060220
	movs r0, 0x10
	ldrsh r1, [r2, r0]
	lsls r0, r7, 16
	asrs r3, r0, 16
	cmp r1, r3
	bne _080601F0
	movs r1, 0x12
	ldrsh r0, [r2, r1]
	cmp r0, r5
	beq _08060200
_080601F0:
	movs r1, 0x14
	ldrsh r0, [r2, r1]
	cmp r0, r3
	bne _08060220
	movs r1, 0x16
	ldrsh r0, [r2, r1]
	cmp r0, r5
	bne _08060220
_08060200:
	ldrb r0, [r6, 0xB]
	lsls r0, 28
	lsrs r0, 28
	ldrb r1, [r2, 0xB]
	lsls r1, 28
	lsrs r1, 28
	bl AreZCoordsCompatible
	lsls r0, 24
	cmp r0, 0
	beq _08060220
	movs r0, 0x1
	b _0806022C
	.align 2, 0
_0806021C: .4byte gMapObjects
_08060220:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _080601C6
	movs r0, 0
_0806022C:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckForCollisionBetweenFieldObjects

	thumb_func_start sub_8060234
sub_8060234: @ 8060234
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _08060280
	ldr r3, _08060278 @ =gSprites
	ldr r2, _0806027C @ =gMapObjects
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x3C]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08060280
	movs r0, 0x1
	b _08060282
	.align 2, 0
_08060278: .4byte gSprites
_0806027C: .4byte gMapObjects
_08060280:
	movs r0, 0
_08060282:
	add sp, 0x4
	pop {r1}
	bx r1
	thumb_func_end sub_8060234

	thumb_func_start sub_8060288
sub_8060288: @ 8060288
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _080602C6
	ldr r3, _080602CC @ =gSprites
	ldr r2, _080602D0 @ =gMapObjects
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrh r2, [r1, 0x3C]
	movs r0, 0x4
	orrs r0, r2
	strh r0, [r1, 0x3C]
_080602C6:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080602CC: .4byte gSprites
_080602D0: .4byte gMapObjects
	thumb_func_end sub_8060288

	thumb_func_start MoveCoords
MoveCoords: @ 80602D4
	push {r4,lr}
	lsls r0, 24
	ldr r3, _080602F4 @ =gDirectionToVector
	lsrs r0, 22
	adds r0, r3
	ldrh r3, [r0]
	ldrh r4, [r1]
	adds r3, r4
	strh r3, [r1]
	ldrh r0, [r0, 0x2]
	ldrh r1, [r2]
	adds r0, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080602F4: .4byte gDirectionToVector
	thumb_func_end MoveCoords

	thumb_func_start unref_sub_80602F8
unref_sub_80602F8: @ 80602F8
	push {r4,lr}
	lsls r0, 24
	ldr r3, _0806031C @ =gDirectionToVector
	lsrs r0, 22
	adds r0, r3
	ldrh r3, [r0]
	lsls r3, 4
	ldrh r4, [r1]
	adds r3, r4
	strh r3, [r1]
	ldrh r0, [r0, 0x2]
	lsls r0, 4
	ldrh r1, [r2]
	adds r0, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806031C: .4byte gDirectionToVector
	thumb_func_end unref_sub_80602F8

	thumb_func_start sub_8060320
sub_8060320: @ 8060320
	push {r4-r7,lr}
	adds r4, r1, 0
	ldr r1, [sp, 0x14]
	lsls r0, 24
	lsls r3, 16
	lsrs r3, 16
	adds r7, r3, 0
	lsls r1, 16
	lsrs r6, r1, 16
	mov r12, r6
	ldr r1, _08060384 @ =gDirectionToVector
	lsrs r0, 22
	adds r5, r0, r1
	movs r0, 0
	ldrsh r1, [r5, r0]
	cmp r1, 0
	ble _0806034C
	lsls r0, r3, 16
	asrs r0, 16
	ldrh r3, [r4]
	adds r0, r3
	strh r0, [r4]
_0806034C:
	cmp r1, 0
	bge _0806035A
	ldrh r1, [r4]
	lsls r0, r7, 16
	asrs r0, 16
	subs r1, r0
	strh r1, [r4]
_0806035A:
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	cmp r1, 0
	ble _0806036C
	lsls r0, r6, 16
	asrs r0, 16
	ldrh r3, [r2]
	adds r0, r3
	strh r0, [r2]
_0806036C:
	cmp r1, 0
	bge _0806037C
	ldrh r1, [r2]
	mov r3, r12
	lsls r0, r3, 16
	asrs r0, 16
	subs r1, r0
	strh r1, [r2]
_0806037C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08060384: .4byte gDirectionToVector
	thumb_func_end sub_8060320

	thumb_func_start sub_8060388
sub_8060388: @ 8060388
	push {r4,r5,lr}
	ldr r5, _080603C0 @ =gSaveBlock1
	ldrh r4, [r5]
	lsls r0, 16
	asrs r0, 16
	subs r0, r4
	lsls r0, 4
	strh r0, [r2]
	ldrh r0, [r5, 0x2]
	lsls r1, 16
	asrs r1, 16
	subs r1, r0
	lsls r1, 4
	strh r1, [r3]
	ldr r1, _080603C4 @ =gUnknown_0300489C
	ldrh r0, [r2]
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r2]
	ldr r1, _080603C8 @ =gUnknown_03004898
	ldrh r0, [r3]
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r3]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080603C0: .4byte gSaveBlock1
_080603C4: .4byte gUnknown_0300489C
_080603C8: .4byte gUnknown_03004898
	thumb_func_end sub_8060388

	thumb_func_start sub_80603CC
sub_80603CC: @ 80603CC
	push {r4-r7,lr}
	adds r7, r2, 0
	mov r12, r3
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	ldr r0, _0806045C @ =gUnknown_0300489C
	ldrh r0, [r0]
	negs r0, r0
	ldr r1, _08060460 @ =gUnknown_03004880
	ldr r2, [r1, 0x10]
	subs r0, r2
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _08060464 @ =gUnknown_03004898
	ldrh r0, [r0]
	negs r0, r0
	ldr r1, [r1, 0x14]
	subs r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r2, 0
	ble _08060406
	lsls r0, r3, 16
	movs r3, 0x80
	lsls r3, 13
	adds r0, r3
	lsrs r3, r0, 16
_08060406:
	cmp r2, 0
	bge _08060412
	lsls r0, r3, 16
	ldr r2, _08060468 @ =0xfff00000
	adds r0, r2
	lsrs r3, r0, 16
_08060412:
	cmp r1, 0
	ble _08060420
	lsls r0, r4, 16
	movs r2, 0x80
	lsls r2, 13
	adds r0, r2
	lsrs r4, r0, 16
_08060420:
	cmp r1, 0
	bge _0806042C
	lsls r0, r4, 16
	ldr r1, _08060468 @ =0xfff00000
	adds r0, r1
	lsrs r4, r0, 16
_0806042C:
	ldr r2, _0806046C @ =gSaveBlock1
	ldrh r1, [r2]
	lsls r0, r5, 16
	asrs r0, 16
	subs r0, r1
	lsls r0, 4
	lsls r1, r3, 16
	asrs r1, 16
	adds r1, r0
	strh r1, [r7]
	ldrh r1, [r2, 0x2]
	lsls r0, r6, 16
	asrs r0, 16
	subs r0, r1
	lsls r0, 4
	lsls r1, r4, 16
	asrs r1, 16
	adds r1, r0
	mov r2, r12
	strh r1, [r2]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806045C: .4byte gUnknown_0300489C
_08060460: .4byte gUnknown_03004880
_08060464: .4byte gUnknown_03004898
_08060468: .4byte 0xfff00000
_0806046C: .4byte gSaveBlock1
	thumb_func_end sub_80603CC

	thumb_func_start sub_8060470
sub_8060470: @ 8060470
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r6, r0, 0
	mov r8, r1
	adds r4, r2, 0
	adds r5, r3, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	movs r1, 0
	ldrsh r0, [r6, r1]
	mov r2, r8
	movs r3, 0
	ldrsh r1, [r2, r3]
	adds r2, r6, 0
	mov r3, r8
	bl sub_80603CC
	lsls r4, 16
	asrs r4, 16
	ldrh r0, [r6]
	adds r4, r0
	strh r4, [r6]
	lsls r5, 16
	asrs r5, 16
	mov r1, r8
	ldrh r1, [r1]
	adds r5, r1
	mov r2, r8
	strh r5, [r2]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8060470

	thumb_func_start GetFieldObjectMovingCameraOffset
GetFieldObjectMovingCameraOffset: @ 80604BC
	push {lr}
	adds r2, r0, 0
	movs r0, 0
	strh r0, [r2]
	strh r0, [r1]
	ldr r3, _080604F8 @ =gUnknown_03004880
	ldr r0, [r3, 0x10]
	cmp r0, 0
	ble _080604D2
	movs r0, 0x1
	strh r0, [r2]
_080604D2:
	ldr r0, [r3, 0x10]
	cmp r0, 0
	bge _080604DE
	ldrh r0, [r2]
	subs r0, 0x1
	strh r0, [r2]
_080604DE:
	ldr r2, [r3, 0x14]
	cmp r2, 0
	ble _080604EA
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080604EA:
	cmp r2, 0
	bge _080604F4
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
_080604F4:
	pop {r0}
	bx r0
	.align 2, 0
_080604F8: .4byte gUnknown_03004880
	thumb_func_end GetFieldObjectMovingCameraOffset

	thumb_func_start FieldObjectMoveDestCoords
FieldObjectMoveDestCoords: @ 80604FC
	push {r4,lr}
	lsls r1, 24
	lsrs r1, 24
	ldrh r4, [r0, 0x10]
	strh r4, [r2]
	ldrh r0, [r0, 0x12]
	strh r0, [r3]
	adds r0, r1, 0
	adds r1, r2, 0
	adds r2, r3, 0
	bl MoveCoords
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FieldObjectMoveDestCoords

	thumb_func_start FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive: @ 806051C
	push {lr}
	ldrb r1, [r0]
	movs r0, 0x42
	ands r0, r1
	cmp r0, 0
	bne _0806052C
	movs r0, 0
	b _0806052E
_0806052C:
	movs r0, 0x1
_0806052E:
	pop {r1}
	bx r1
	thumb_func_end FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive

	thumb_func_start FieldObjectIsSpecialAnimActive
FieldObjectIsSpecialAnimActive: @ 8060534
	push {lr}
	adds r1, r0, 0
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	bge _0806054A
	ldrb r0, [r1, 0x1C]
	cmp r0, 0xFF
	beq _0806054A
	movs r0, 0x1
	b _0806054C
_0806054A:
	movs r0, 0
_0806054C:
	pop {r1}
	bx r1
	thumb_func_end FieldObjectIsSpecialAnimActive

	thumb_func_start FieldObjectSetSpecialAnim
FieldObjectSetSpecialAnim: @ 8060550
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	bne _08060590
	adds r0, r4, 0
	bl UnfreezeMapObject
	strb r5, [r4, 0x1C]
	ldrb r0, [r4]
	movs r1, 0x40
	orrs r0, r1
	movs r1, 0x7F
	ands r0, r1
	strb r0, [r4]
	ldr r2, _0806058C @ =gSprites
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r6, [r0, 0x32]
	movs r0, 0
	b _08060592
	.align 2, 0
_0806058C: .4byte gSprites
_08060590:
	movs r0, 0x1
_08060592:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end FieldObjectSetSpecialAnim

	thumb_func_start FieldObjectForceSetSpecialAnim
FieldObjectForceSetSpecialAnim: @ 8060598
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	bl FieldObjectClearAnimIfSpecialAnimActive
	adds r0, r5, 0
	adds r1, r4, 0
	bl FieldObjectSetSpecialAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end FieldObjectForceSetSpecialAnim

	thumb_func_start FieldObjectClearAnimIfSpecialAnimActive
FieldObjectClearAnimIfSpecialAnimActive: @ 80605B4
	push {lr}
	adds r1, r0, 0
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	bge _080605C6
	adds r0, r1, 0
	bl FieldObjectClearAnim
_080605C6:
	pop {r0}
	bx r0
	thumb_func_end FieldObjectClearAnimIfSpecialAnimActive

	thumb_func_start FieldObjectClearAnim
FieldObjectClearAnim: @ 80605CC
	movs r1, 0xFF
	strb r1, [r0, 0x1C]
	ldrb r2, [r0]
	movs r1, 0x41
	negs r1, r1
	ands r1, r2
	movs r2, 0x7F
	ands r1, r2
	strb r1, [r0]
	ldr r3, _080605FC @ =gSprites
	ldrb r2, [r0, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	movs r2, 0
	strh r2, [r1, 0x30]
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r2, [r0, 0x32]
	bx lr
	.align 2, 0
_080605FC: .4byte gSprites
	thumb_func_end FieldObjectClearAnim

	thumb_func_start FieldObjectCheckIfSpecialAnimFinishedOrInactive
FieldObjectCheckIfSpecialAnimFinishedOrInactive: @ 8060600
	push {lr}
	ldrb r1, [r0]
	lsls r0, r1, 25
	cmp r0, 0
	blt _0806060E
	movs r0, 0x10
	b _08060610
_0806060E:
	lsrs r0, r1, 7
_08060610:
	pop {r1}
	bx r1
	thumb_func_end FieldObjectCheckIfSpecialAnimFinishedOrInactive

	thumb_func_start FieldObjectClearAnimIfSpecialAnimFinished
FieldObjectClearAnimIfSpecialAnimFinished: @ 8060614
	push {r4,r5,lr}
	adds r5, r0, 0
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _0806062E
	cmp r4, 0x10
	beq _0806062E
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimActive
_0806062E:
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end FieldObjectClearAnimIfSpecialAnimFinished

	thumb_func_start FieldObjectGetSpecialAnim
FieldObjectGetSpecialAnim: @ 8060638
	push {lr}
	adds r1, r0, 0
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	blt _08060648
	movs r0, 0xFF
	b _0806064A
_08060648:
	ldrb r0, [r1, 0x1C]
_0806064A:
	pop {r1}
	bx r1
	thumb_func_end FieldObjectGetSpecialAnim

	thumb_func_start meta_step
meta_step: @ 8060650
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	bl DoGroundEffects_OnSpawn
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80634A0
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _0806067A
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectExecSpecialAnim
	b _08060690
_0806067A:
	ldrb r0, [r4, 0x1]
	lsls r0, 31
	cmp r0, 0
	bne _08060690
_08060682:
	adds r0, r4, 0
	adds r1, r5, 0
	bl _call_via_r6
	lsls r0, 24
	cmp r0, 0
	bne _08060682
_08060690:
	adds r0, r4, 0
	adds r1, r5, 0
	bl DoGroundEffects_OnBeginStep
	adds r0, r4, 0
	adds r1, r5, 0
	bl DoGroundEffects_OnFinishStep
	adds r0, r4, 0
	adds r1, r5, 0
	bl npc_obj_transfer_image_anim_pause_flag
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80634D0
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectUpdateSubpriority
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end meta_step

	thumb_func_start GetFaceDirectionAnimId
GetFaceDirectionAnimId: @ 80606C0
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080606E8 @ =gUnknown_083756C8
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _080606D8
	movs r4, 0
_080606D8:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080606E8: .4byte gUnknown_083756C8
	thumb_func_end GetFaceDirectionAnimId

	thumb_func_start GetSimpleGoAnimId
GetSimpleGoAnimId: @ 80606EC
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060714 @ =gUnknown_083756CD
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060704
	movs r4, 0
_08060704:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060714: .4byte gUnknown_083756CD
	thumb_func_end GetSimpleGoAnimId

	thumb_func_start GetGoSpeed0AnimId
GetGoSpeed0AnimId: @ 8060718
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060740 @ =gUnknown_083756D2
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060730
	movs r4, 0
_08060730:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060740: .4byte gUnknown_083756D2
	thumb_func_end GetGoSpeed0AnimId

	thumb_func_start sub_8060744
sub_8060744: @ 8060744
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0806076C @ =gUnknown_083756D7
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _0806075C
	movs r4, 0
_0806075C:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806076C: .4byte gUnknown_083756D7
	thumb_func_end sub_8060744

	thumb_func_start d2s_08064034
d2s_08064034: @ 8060770
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060798 @ =gUnknown_083756DC
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060788
	movs r4, 0
_08060788:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060798: .4byte gUnknown_083756DC
	thumb_func_end d2s_08064034

	thumb_func_start sub_806079C
sub_806079C: @ 806079C
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080607C4 @ =gUnknown_083756E1
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _080607B4
	movs r4, 0
_080607B4:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080607C4: .4byte gUnknown_083756E1
	thumb_func_end sub_806079C

	thumb_func_start sub_80607C8
sub_80607C8: @ 80607C8
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080607F0 @ =gUnknown_083756E6
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _080607E0
	movs r4, 0
_080607E0:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080607F0: .4byte gUnknown_083756E6
	thumb_func_end sub_80607C8

	thumb_func_start sub_80607F4
sub_80607F4: @ 80607F4
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0806081C @ =gUnknown_083756EB
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _0806080C
	movs r4, 0
_0806080C:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806081C: .4byte gUnknown_083756EB
	thumb_func_end sub_80607F4

	thumb_func_start GetJumpLedgeAnimId
GetJumpLedgeAnimId: @ 8060820
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060848 @ =gUnknown_083756F0
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060838
	movs r4, 0
_08060838:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060848: .4byte gUnknown_083756F0
	thumb_func_end GetJumpLedgeAnimId

	thumb_func_start sub_806084C
sub_806084C: @ 806084C
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060874 @ =gUnknown_083756F5
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060864
	movs r4, 0
_08060864:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060874: .4byte gUnknown_083756F5
	thumb_func_end sub_806084C

	thumb_func_start sub_8060878
sub_8060878: @ 8060878
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080608A0 @ =gUnknown_083756FA
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060890
	movs r4, 0
_08060890:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080608A0: .4byte gUnknown_083756FA
	thumb_func_end sub_8060878

	thumb_func_start sub_80608A4
sub_80608A4: @ 80608A4
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080608CC @ =gUnknown_083756FF
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _080608BC
	movs r4, 0
_080608BC:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080608CC: .4byte gUnknown_083756FF
	thumb_func_end sub_80608A4

	thumb_func_start sub_80608D0
sub_80608D0: @ 80608D0
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080608F8 @ =gUnknown_08375704
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _080608E8
	movs r4, 0
_080608E8:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080608F8: .4byte gUnknown_08375704
	thumb_func_end sub_80608D0

	thumb_func_start GetStepInPlaceDelay32AnimId
GetStepInPlaceDelay32AnimId: @ 80608FC
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060924 @ =gUnknown_08375709
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060914
	movs r4, 0
_08060914:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060924: .4byte gUnknown_08375709
	thumb_func_end GetStepInPlaceDelay32AnimId

	thumb_func_start GetStepInPlaceDelay16AnimId
GetStepInPlaceDelay16AnimId: @ 8060928
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060950 @ =gUnknown_0837570E
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060940
	movs r4, 0
_08060940:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060950: .4byte gUnknown_0837570E
	thumb_func_end GetStepInPlaceDelay16AnimId

	thumb_func_start GetStepInPlaceDelay8AnimId
GetStepInPlaceDelay8AnimId: @ 8060954
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0806097C @ =gUnknown_08375713
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _0806096C
	movs r4, 0
_0806096C:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806097C: .4byte gUnknown_08375713
	thumb_func_end GetStepInPlaceDelay8AnimId

	thumb_func_start GetStepInPlaceDelay4AnimId
GetStepInPlaceDelay4AnimId: @ 8060980
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080609A8 @ =gUnknown_08375718
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060998
	movs r4, 0
_08060998:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080609A8: .4byte gUnknown_08375718
	thumb_func_end GetStepInPlaceDelay4AnimId

	thumb_func_start FieldObjectFaceOppositeDirection
FieldObjectFaceOppositeDirection: @ 80609AC
	push {r4,lr}
	adds r4, r0, 0
	lsls r0, r1, 24
	lsrs r0, 24
	bl GetOppositeDirection
	lsls r0, 24
	lsrs r0, 24
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FieldObjectFaceOppositeDirection

	thumb_func_start sub_80609D8
sub_80609D8: @ 80609D8
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060A00 @ =gUnknown_0837571D
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _080609F0
	movs r4, 0
_080609F0:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060A00: .4byte gUnknown_0837571D
	thumb_func_end sub_80609D8

	thumb_func_start sub_8060A04
sub_8060A04: @ 8060A04
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060A2C @ =gUnknown_08375722
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060A1C
	movs r4, 0
_08060A1C:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060A2C: .4byte gUnknown_08375722
	thumb_func_end sub_8060A04

	thumb_func_start sub_8060A30
sub_8060A30: @ 8060A30
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060A58 @ =gUnknown_08375727
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060A48
	movs r4, 0
_08060A48:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060A58: .4byte gUnknown_08375727
	thumb_func_end sub_8060A30

	thumb_func_start sub_8060A5C
sub_8060A5C: @ 8060A5C
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060A84 @ =gUnknown_0837572C
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060A74
	movs r4, 0
_08060A74:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060A84: .4byte gUnknown_0837572C
	thumb_func_end sub_8060A5C

	thumb_func_start sub_8060A88
sub_8060A88: @ 8060A88
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060AB0 @ =gUnknown_08375731
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060AA0
	movs r4, 0
_08060AA0:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060AB0: .4byte gUnknown_08375731
	thumb_func_end sub_8060A88

	thumb_func_start sub_8060AB4
sub_8060AB4: @ 8060AB4
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060ADC @ =gUnknown_08375736
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060ACC
	movs r4, 0
_08060ACC:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060ADC: .4byte gUnknown_08375736
	thumb_func_end sub_8060AB4

	thumb_func_start sub_8060AE0
sub_8060AE0: @ 8060AE0
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060B08 @ =gUnknown_0837573B
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060AF8
	movs r4, 0
_08060AF8:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060B08: .4byte gUnknown_0837573B
	thumb_func_end sub_8060AE0

	thumb_func_start sub_8060B0C
sub_8060B0C: @ 8060B0C
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060B34 @ =gUnknown_08375740
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060B24
	movs r4, 0
_08060B24:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060B34: .4byte gUnknown_08375740
	thumb_func_end sub_8060B0C

	thumb_func_start sub_8060B38
sub_8060B38: @ 8060B38
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060B60 @ =gUnknown_08375745
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060B50
	movs r4, 0
_08060B50:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060B60: .4byte gUnknown_08375745
	thumb_func_end sub_8060B38

	thumb_func_start sub_8060B64
sub_8060B64: @ 8060B64
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060B8C @ =gUnknown_0837574A
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060B7C
	movs r4, 0
_08060B7C:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060B8C: .4byte gUnknown_0837574A
	thumb_func_end sub_8060B64

	thumb_func_start GetOppositeDirection
GetOppositeDirection: @ 8060B90
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060BB4 @ =gUnknown_0837574F
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	subs r1, r4, 0x1
	lsls r0, r1, 24
	lsrs r0, 24
	cmp r0, 0x7
	bhi _08060BB8
	mov r2, sp
	adds r0, r2, r1
	ldrb r0, [r0]
	b _08060BBA
	.align 2, 0
_08060BB4: .4byte gUnknown_0837574F
_08060BB8:
	adds r0, r4, 0
_08060BBA:
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetOppositeDirection

	thumb_func_start zffu_offset_calc
zffu_offset_calc: @ 8060BC4
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08060BD8 @ =gUnknown_08375757
	lsrs r0, 22
	subs r0, 0x5
	adds r1, r0
	adds r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_08060BD8: .4byte gUnknown_08375757
	thumb_func_end zffu_offset_calc

	thumb_func_start state_to_direction
state_to_direction: @ 8060BDC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	adds r0, r1, 0
	lsls r2, 24
	lsrs r2, 24
	cmp r1, 0
	beq _08060BFC
	cmp r2, 0
	beq _08060BFC
	cmp r1, 0x4
	bhi _08060BFC
	cmp r2, 0x4
	bls _08060C00
_08060BFC:
	movs r0, 0
	b _08060C12
_08060C00:
	adds r1, r2, 0
	bl zffu_offset_calc
	ldr r2, _08060C18 @ =gUnknown_08375767
	lsls r1, r4, 2
	subs r1, 0x5
	adds r0, r1
	adds r0, r2
	ldrb r0, [r0]
_08060C12:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060C18: .4byte gUnknown_08375767
	thumb_func_end state_to_direction

	thumb_func_start FieldObjectExecSpecialAnim
FieldObjectExecSpecialAnim: @ 8060C1C
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, _08060C50 @ =gUnknown_08375778
	ldrb r0, [r4, 0x1C]
	lsls r0, 2
	adds r0, r2
	movs r3, 0x32
	ldrsh r2, [r1, r3]
	ldr r0, [r0]
	lsls r2, 2
	adds r2, r0
	ldr r2, [r2]
	adds r0, r4, 0
	bl _call_via_r2
	lsls r0, 24
	cmp r0, 0
	beq _08060C48
	ldrb r0, [r4]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r4]
_08060C48:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060C50: .4byte gUnknown_08375778
	thumb_func_end FieldObjectExecSpecialAnim

	thumb_func_start FieldObjectExecRegularAnim
FieldObjectExecRegularAnim: @ 8060C54
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _08060C80 @ =gUnknown_08375778
	ldrb r0, [r4, 0x1C]
	lsls r0, 2
	adds r0, r1
	movs r2, 0x32
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	ldr r2, [r1]
	adds r0, r4, 0
	adds r1, r5, 0
	bl _call_via_r2
	lsls r0, 24
	cmp r0, 0
	bne _08060C84
	movs r0, 0
	b _08060C8E
	.align 2, 0
_08060C80: .4byte gUnknown_08375778
_08060C84:
	movs r0, 0xFF
	strb r0, [r4, 0x1C]
	movs r0, 0
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08060C8E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end FieldObjectExecRegularAnim

	thumb_func_start FieldObjectSetRegularAnim
FieldObjectSetRegularAnim: @ 8060C94
	movs r3, 0
	strb r2, [r0, 0x1C]
	strh r3, [r1, 0x32]
	bx lr
	thumb_func_end FieldObjectSetRegularAnim

	thumb_func_start an_look_any
an_look_any: @ 8060C9C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r1, r2, 24
	lsrs r1, 24
	bl FieldObjectSetDirection
	adds r0, r4, 0
	bl npc_coords_shift_still
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl get_go_image_anim_num
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805FE64
	adds r2, r5, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
	strh r0, [r5, 0x32]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end an_look_any

	thumb_func_start sub_8060CE0
sub_8060CE0: @ 8060CE0
	push {lr}
	movs r2, 0x1
	bl an_look_any
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8060CE0

	thumb_func_start sub_8060CF0
sub_8060CF0: @ 8060CF0
	push {lr}
	movs r2, 0x2
	bl an_look_any
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8060CF0

	thumb_func_start sub_8060D00
sub_8060D00: @ 8060D00
	push {lr}
	movs r2, 0x3
	bl an_look_any
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8060D00

	thumb_func_start sub_8060D10
sub_8060D10: @ 8060D10
	push {lr}
	movs r2, 0x4
	bl an_look_any
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8060D10

	thumb_func_start sub_8060D20
sub_8060D20: @ 8060D20
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	mov r8, r0
	mov r9, r1
	adds r4, r2, 0
	adds r6, r3, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	ldrh r1, [r0, 0x10]
	mov r0, sp
	strh r1, [r0]
	mov r1, r8
	ldrh r0, [r1, 0x12]
	mov r5, sp
	adds r5, 0x2
	strh r0, [r5]
	mov r0, r8
	adds r1, r4, 0
	bl FieldObjectSetDirection
	adds r0, r4, 0
	mov r1, sp
	adds r2, r5, 0
	bl MoveCoords
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	mov r0, r8
	bl npc_coords_shift
	mov r0, r9
	adds r1, r4, 0
	adds r2, r6, 0
	bl oamt_npc_ministep_reset
	mov r2, r9
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x4
	orrs r0, r1
	mov r2, r8
	strb r0, [r2]
	movs r0, 0x1
	mov r1, r9
	strh r0, [r1, 0x32]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8060D20

	thumb_func_start do_go_anim
do_go_anim: @ 8060DA4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	adds r5, r0, 0
	mov r8, r1
	adds r4, r3, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r4, 24
	lsrs r4, 24
	mov r1, sp
	ldr r0, _08060DFC @ =gUnknown_083759C0
	ldm r0!, {r3,r6,r7}
	stm r1!, {r3,r6,r7}
	ldm r0!, {r3,r6}
	stm r1!, {r3,r6}
	adds r0, r5, 0
	mov r1, r8
	adds r3, r4, 0
	bl sub_8060D20
	lsls r4, 2
	mov r7, sp
	adds r1, r7, r4
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	ldr r1, [r1]
	bl _call_via_r1
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	mov r1, r8
	bl sub_805FE28
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08060DFC: .4byte gUnknown_083759C0
	thumb_func_end do_go_anim

	thumb_func_start do_run_anim
do_run_anim: @ 8060E00
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	movs r3, 0x1
	bl sub_8060D20
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl get_run_image_anim_num
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805FE28
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end do_run_anim

	thumb_func_start npc_obj_ministep_stop_on_arrival
npc_obj_ministep_stop_on_arrival: @ 8060E30
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl obj_npc_ministep
	lsls r0, 24
	cmp r0, 0
	bne _08060E46
	movs r0, 0
	b _08060E62
_08060E46:
	adds r0, r4, 0
	bl npc_coords_shift_still
	ldrb r0, [r4]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4]
	adds r2, r5, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
_08060E62:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end npc_obj_ministep_stop_on_arrival

	thumb_func_start sub_8060E68
sub_8060E68: @ 8060E68
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	adds r6, r0, 0
	mov r8, r1
	lsls r5, r2, 24
	lsrs r5, 24
	ldrh r1, [r6, 0x10]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r6, 0x12]
	mov r4, sp
	adds r4, 0x2
	strh r0, [r4]
	adds r0, r6, 0
	adds r1, r5, 0
	bl FieldObjectSetDirection
	adds r0, r5, 0
	mov r1, sp
	adds r2, r4, 0
	bl MoveCoords
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r4, r0]
	adds r0, r6, 0
	bl npc_coords_shift
	mov r0, r8
	adds r1, r5, 0
	bl sub_806467C
	mov r2, r8
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r6]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r6]
	movs r0, 0x1
	mov r1, r8
	strh r0, [r1, 0x32]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8060E68

	thumb_func_start sub_8060ED8
sub_8060ED8: @ 8060ED8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	bl sub_8060E68
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl get_go_image_anim_num
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805FE28
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8060ED8

	thumb_func_start an_walk_any_2
an_walk_any_2: @ 8060F04
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_806468C
	lsls r0, 24
	cmp r0, 0
	bne _08060F1A
	movs r0, 0
	b _08060F36
_08060F1A:
	adds r0, r4, 0
	bl npc_coords_shift_still
	ldrb r0, [r4]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4]
	adds r2, r5, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
_08060F36:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end an_walk_any_2

	thumb_func_start sub_8060F3C
sub_8060F3C: @ 8060F3C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	bl sub_8060ED8
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8060F5C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8060F3C

	thumb_func_start sub_8060F5C
sub_8060F5C: @ 8060F5C
	push {r4,lr}
	adds r4, r1, 0
	bl an_walk_any_2
	lsls r0, 24
	cmp r0, 0
	bne _08060F6E
	movs r0, 0
	b _08060F74
_08060F6E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08060F74:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8060F5C

	thumb_func_start sub_8060F7C
sub_8060F7C: @ 8060F7C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	bl sub_8060ED8
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8060F9C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8060F7C

	thumb_func_start sub_8060F9C
sub_8060F9C: @ 8060F9C
	push {r4,lr}
	adds r4, r1, 0
	bl an_walk_any_2
	lsls r0, 24
	cmp r0, 0
	bne _08060FAE
	movs r0, 0
	b _08060FB4
_08060FAE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08060FB4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8060F9C

	thumb_func_start sub_8060FBC
sub_8060FBC: @ 8060FBC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	bl sub_8060ED8
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8060FDC
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8060FBC

	thumb_func_start sub_8060FDC
sub_8060FDC: @ 8060FDC
	push {r4,lr}
	adds r4, r1, 0
	bl an_walk_any_2
	lsls r0, 24
	cmp r0, 0
	bne _08060FEE
	movs r0, 0
	b _08060FF4
_08060FEE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08060FF4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8060FDC

	thumb_func_start sub_8060FFC
sub_8060FFC: @ 8060FFC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	bl sub_8060ED8
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806101C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8060FFC

	thumb_func_start sub_806101C
sub_806101C: @ 806101C
	push {r4,lr}
	adds r4, r1, 0
	bl an_walk_any_2
	lsls r0, 24
	cmp r0, 0
	bne _0806102E
	movs r0, 0
	b _08061034
_0806102E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061034:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806101C

	thumb_func_start sub_806103C
sub_806103C: @ 806103C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806105C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806103C

	thumb_func_start sub_806105C
sub_806105C: @ 806105C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806106E
	movs r0, 0
	b _08061074
_0806106E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061074:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806105C

	thumb_func_start sub_806107C
sub_806107C: @ 806107C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806109C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806107C

	thumb_func_start sub_806109C
sub_806109C: @ 806109C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080610AE
	movs r0, 0
	b _080610B4
_080610AE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080610B4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806109C

	thumb_func_start sub_80610BC
sub_80610BC: @ 80610BC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80610DC
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80610BC

	thumb_func_start sub_80610DC
sub_80610DC: @ 80610DC
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080610EE
	movs r0, 0
	b _080610F4
_080610EE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080610F4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80610DC

	thumb_func_start sub_80610FC
sub_80610FC: @ 80610FC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806111C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80610FC

	thumb_func_start sub_806111C
sub_806111C: @ 806111C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806112E
	movs r0, 0
	b _08061134
_0806112E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061134:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806111C

	thumb_func_start sub_806113C
sub_806113C: @ 806113C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	adds r7, r0, 0
	mov r10, r1
	adds r4, r2, 0
	mov r8, r3
	ldr r0, [sp, 0x30]
	lsls r4, 24
	lsrs r4, 24
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r1, _080611F4 @ =gUnknown_08375A34
	add r0, sp, 0x4
	movs r2, 0x6
	bl memcpy
	add r5, sp, 0xC
	movs r0, 0
	strh r0, [r5]
	mov r6, sp
	adds r6, 0xE
	strh r0, [r6]
	adds r0, r7, 0
	adds r1, r4, 0
	bl FieldObjectSetDirection
	mov r1, r8
	lsls r0, r1, 1
	add r0, sp
	adds r0, 0x4
	movs r1, 0
	ldrsh r3, [r0, r1]
	str r3, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_8060320
	ldrh r1, [r5]
	ldrh r0, [r7, 0x10]
	adds r1, r0
	lsls r1, 16
	asrs r1, 16
	ldrh r2, [r6]
	ldrh r0, [r7, 0x12]
	adds r2, r0
	lsls r2, 16
	asrs r2, 16
	adds r0, r7, 0
	bl npc_coords_shift
	mov r0, r10
	adds r1, r4, 0
	mov r2, r8
	mov r3, r9
	bl sub_80646E4
	movs r0, 0x1
	mov r1, r10
	strh r0, [r1, 0x32]
	movs r0, 0x2C
	add r10, r0
	mov r0, r10
	ldrb r1, [r0]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	mov r1, r10
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r7]
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080611F4: .4byte gUnknown_08375A34
	thumb_func_end sub_806113C

	thumb_func_start maybe_shadow_1
maybe_shadow_1: @ 80611F8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, [sp, 0x10]
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	adds r0, r4, 0
	bl sub_806113C
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl get_go_image_anim_num
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805FE28
	adds r0, r4, 0
	bl DoShadowFieldEffect
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end maybe_shadow_1

	thumb_func_start sub_806123C
sub_806123C: @ 806123C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r6, r0, 0
	adds r7, r1, 0
	adds r4, r2, 0
	ldr r1, _080612C8 @ =gUnknown_08375A3A
	add r0, sp, 0x4
	movs r2, 0x6
	bl memcpy
	adds r0, r7, 0
	bl _call_via_r4
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x1
	bne _080612CC
	movs r1, 0x36
	ldrsh r0, [r7, r1]
	lsls r0, 1
	add r0, sp
	adds r0, 0x4
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	beq _080612CC
	add r4, sp, 0xC
	movs r0, 0
	strh r0, [r4]
	mov r5, sp
	adds r5, 0xE
	strh r0, [r5]
	ldrb r0, [r6, 0x18]
	lsrs r0, 4
	movs r2, 0x36
	ldrsh r1, [r7, r2]
	lsls r1, 1
	add r1, sp
	adds r1, 0x4
	movs r2, 0
	ldrsh r3, [r1, r2]
	str r3, [sp]
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8060320
	ldrh r1, [r4]
	ldrh r0, [r6, 0x10]
	adds r1, r0
	lsls r1, 16
	asrs r1, 16
	ldrh r2, [r5]
	ldrh r0, [r6, 0x12]
	adds r2, r0
	lsls r2, 16
	asrs r2, 16
	adds r0, r6, 0
	bl npc_coords_shift
	ldrb r0, [r6]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r6]
	b _080612F0
	.align 2, 0
_080612C8: .4byte gUnknown_08375A3A
_080612CC:
	mov r1, r8
	cmp r1, 0xFF
	bne _080612F0
	adds r0, r6, 0
	bl npc_coords_shift_still
	ldrb r0, [r6]
	movs r1, 0x8
	orrs r0, r1
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r6]
	adds r2, r7, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
_080612F0:
	mov r0, r8
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_806123C

	thumb_func_start sub_8061300
sub_8061300: @ 8061300
	push {lr}
	ldr r2, _08061310 @ =sub_8064704
	bl sub_806123C
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08061310: .4byte sub_8064704
	thumb_func_end sub_8061300

	thumb_func_start sub_8061314
sub_8061314: @ 8061314
	push {lr}
	ldr r2, _08061324 @ =sub_806478C
	bl sub_806123C
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08061324: .4byte sub_806478C
	thumb_func_end sub_8061314

	thumb_func_start sub_8061328
sub_8061328: @ 8061328
	push {lr}
	bl sub_8061300
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0806133A
	movs r0, 0
	b _0806133C
_0806133A:
	movs r0, 0x1
_0806133C:
	pop {r1}
	bx r1
	thumb_func_end sub_8061328

	thumb_func_start sub_8061340
sub_8061340: @ 8061340
	push {lr}
	bl sub_8061314
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _08061352
	movs r0, 0
	b _08061354
_08061352:
	movs r0, 0x1
_08061354:
	pop {r1}
	bx r1
	thumb_func_end sub_8061340

	thumb_func_start sub_8061358
sub_8061358: @ 8061358
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061300
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08061372
	cmp r0, 0xFF
	bne _0806139E
	movs r0, 0x1
	b _080613A0
_08061372:
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetOppositeDirection
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetDirection
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl get_go_image_anim_num
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805FE64
_0806139E:
	movs r0, 0
_080613A0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061358

	thumb_func_start sub_80613A8
sub_80613A8: @ 80613A8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x2
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80613D4
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80613A8

	thumb_func_start sub_80613D4
sub_80613D4: @ 80613D4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _080613E8
	movs r0, 0
	b _080613F8
_080613E8:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080613F8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80613D4

	thumb_func_start sub_8061400
sub_8061400: @ 8061400
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806142C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061400

	thumb_func_start sub_806142C
sub_806142C: @ 806142C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08061440
	movs r0, 0
	b _08061450
_08061440:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08061450:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806142C

	thumb_func_start sub_8061458
sub_8061458: @ 8061458
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0x2
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061484
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061458

	thumb_func_start sub_8061484
sub_8061484: @ 8061484
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08061498
	movs r0, 0
	b _080614A8
_08061498:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080614A8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061484

	thumb_func_start sub_80614B0
sub_80614B0: @ 80614B0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0x2
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80614DC
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80614B0

	thumb_func_start sub_80614DC
sub_80614DC: @ 80614DC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _080614F0
	movs r0, 0
	b _08061500
_080614F0:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08061500:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80614DC

	thumb_func_start sub_8061508
sub_8061508: @ 8061508
	movs r2, 0x1
	strh r2, [r0, 0x32]
	strh r1, [r0, 0x34]
	bx lr
	thumb_func_end sub_8061508

	thumb_func_start sub_8061510
sub_8061510: @ 8061510
	push {lr}
	ldrh r0, [r1, 0x34]
	subs r0, 0x1
	strh r0, [r1, 0x34]
	lsls r0, 16
	cmp r0, 0
	beq _08061522
	movs r0, 0
	b _08061528
_08061522:
	movs r0, 0x2
	strh r0, [r1, 0x32]
	movs r0, 0x1
_08061528:
	pop {r1}
	bx r1
	thumb_func_end sub_8061510

	thumb_func_start sub_806152C
sub_806152C: @ 806152C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8061508
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8061510
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806152C

	thumb_func_start sub_806154C
sub_806154C: @ 806154C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8061508
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8061510
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806154C

	thumb_func_start sub_806156C
sub_806156C: @ 806156C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x4
	bl sub_8061508
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8061510
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806156C

	thumb_func_start sub_806158C
sub_806158C: @ 806158C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x8
	bl sub_8061508
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8061510
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806158C

	thumb_func_start sub_80615AC
sub_80615AC: @ 80615AC
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x10
	bl sub_8061508
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8061510
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80615AC

	thumb_func_start sub_80615CC
sub_80615CC: @ 80615CC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x1
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80615EC
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80615CC

	thumb_func_start sub_80615EC
sub_80615EC: @ 80615EC
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080615FE
	movs r0, 0
	b _08061604
_080615FE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061604:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80615EC

	thumb_func_start sub_806160C
sub_806160C: @ 806160C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806162C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806160C

	thumb_func_start sub_806162C
sub_806162C: @ 806162C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806163E
	movs r0, 0
	b _08061644
_0806163E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061644:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806162C

	thumb_func_start sub_806164C
sub_806164C: @ 806164C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x1
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806166C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806164C

	thumb_func_start sub_806166C
sub_806166C: @ 806166C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806167E
	movs r0, 0
	b _08061684
_0806167E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061684:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806166C

	thumb_func_start sub_806168C
sub_806168C: @ 806168C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x1
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80616AC
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806168C

	thumb_func_start sub_80616AC
sub_80616AC: @ 80616AC
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080616BE
	movs r0, 0
	b _080616C4
_080616BE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080616C4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80616AC

	thumb_func_start sub_80616CC
sub_80616CC: @ 80616CC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r6, r1, 0
	adds r1, r2, 0
	adds r4, r3, 0
	ldr r5, [sp, 0x14]
	lsls r1, 24
	lsrs r1, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 16
	lsrs r5, 16
	bl FieldObjectSetDirection
	mov r0, r8
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_805FE28
	adds r2, r6, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x1
	strh r0, [r6, 0x32]
	strh r5, [r6, 0x34]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80616CC

	thumb_func_start sub_8061714
sub_8061714: @ 8061714
	push {lr}
	ldrh r0, [r1, 0x34]
	subs r0, 0x1
	strh r0, [r1, 0x34]
	lsls r0, 16
	cmp r0, 0
	beq _08061726
	movs r0, 0
	b _08061738
_08061726:
	movs r0, 0x2
	strh r0, [r1, 0x32]
	adds r2, r1, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
_08061738:
	pop {r1}
	bx r1
	thumb_func_end sub_8061714

	thumb_func_start sub_806173C
sub_806173C: @ 806173C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldrh r1, [r4, 0x34]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08061766
	adds r3, r4, 0
	adds r3, 0x2C
	ldrb r2, [r3]
	lsls r1, r2, 26
	lsrs r1, 26
	adds r1, 0x1
	movs r0, 0x3F
	ands r1, r0
	movs r0, 0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_08061766:
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806173C

	thumb_func_start sub_8061778
sub_8061778: @ 8061778
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x20
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806173C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061778

	thumb_func_start sub_80617B0
sub_80617B0: @ 80617B0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x20
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806173C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80617B0

	thumb_func_start sub_80617E8
sub_80617E8: @ 80617E8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x20
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806173C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80617E8

	thumb_func_start sub_8061820
sub_8061820: @ 8061820
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x20
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806173C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061820

	thumb_func_start sub_8061858
sub_8061858: @ 8061858
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x10
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061858

	thumb_func_start sub_8061890
sub_8061890: @ 8061890
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x10
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061890

	thumb_func_start sub_80618C8
sub_80618C8: @ 80618C8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x10
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80618C8

	thumb_func_start sub_8061900
sub_8061900: @ 8061900
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x10
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061900

	thumb_func_start sub_8061938
sub_8061938: @ 8061938
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl get_go_fast_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061938

	thumb_func_start sub_8061970
sub_8061970: @ 8061970
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl get_go_fast_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061970

	thumb_func_start sub_80619A8
sub_80619A8: @ 80619A8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl get_go_fast_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80619A8

	thumb_func_start sub_80619E0
sub_80619E0: @ 80619E0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl get_go_fast_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80619E0

	thumb_func_start sub_8061A18
sub_8061A18: @ 8061A18
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl get_go_faster_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x4
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061A18

	thumb_func_start sub_8061A50
sub_8061A50: @ 8061A50
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl get_go_faster_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x4
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061A50

	thumb_func_start sub_8061A88
sub_8061A88: @ 8061A88
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl get_go_faster_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x4
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061A88

	thumb_func_start sub_8061AC0
sub_8061AC0: @ 8061AC0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl get_go_faster_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x4
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061AC0

	thumb_func_start sub_8061AF8
sub_8061AF8: @ 8061AF8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x2
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061B18
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061AF8

	thumb_func_start sub_8061B18
sub_8061B18: @ 8061B18
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061B2A
	movs r0, 0
	b _08061B30
_08061B2A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061B30:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061B18

	thumb_func_start sub_8061B38
sub_8061B38: @ 8061B38
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x2
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061B58
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061B38

	thumb_func_start sub_8061B58
sub_8061B58: @ 8061B58
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061B6A
	movs r0, 0
	b _08061B70
_08061B6A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061B70:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061B58

	thumb_func_start sub_8061B78
sub_8061B78: @ 8061B78
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x2
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061B98
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061B78

	thumb_func_start sub_8061B98
sub_8061B98: @ 8061B98
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061BAA
	movs r0, 0
	b _08061BB0
_08061BAA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061BB0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061B98

	thumb_func_start sub_8061BB8
sub_8061BB8: @ 8061BB8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x2
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061BD8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061BB8

	thumb_func_start sub_8061BD8
sub_8061BD8: @ 8061BD8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061BEA
	movs r0, 0
	b _08061BF0
_08061BEA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061BF0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061BD8

	thumb_func_start sub_8061BF8
sub_8061BF8: @ 8061BF8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x3
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061C18
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061BF8

	thumb_func_start sub_8061C18
sub_8061C18: @ 8061C18
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061C2A
	movs r0, 0
	b _08061C30
_08061C2A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061C30:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061C18

	thumb_func_start sub_8061C38
sub_8061C38: @ 8061C38
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x3
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061C58
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061C38

	thumb_func_start sub_8061C58
sub_8061C58: @ 8061C58
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061C6A
	movs r0, 0
	b _08061C70
_08061C6A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061C70:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061C58

	thumb_func_start sub_8061C78
sub_8061C78: @ 8061C78
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x3
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061C98
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061C78

	thumb_func_start sub_8061C98
sub_8061C98: @ 8061C98
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061CAA
	movs r0, 0
	b _08061CB0
_08061CAA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061CB0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061C98

	thumb_func_start sub_8061CB8
sub_8061CB8: @ 8061CB8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x3
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061CD8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061CB8

	thumb_func_start sub_8061CD8
sub_8061CD8: @ 8061CD8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061CEA
	movs r0, 0
	b _08061CF0
_08061CEA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061CF0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061CD8

	thumb_func_start sub_8061CF8
sub_8061CF8: @ 8061CF8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x4
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061D18
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061CF8

	thumb_func_start sub_8061D18
sub_8061D18: @ 8061D18
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061D2A
	movs r0, 0
	b _08061D30
_08061D2A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061D30:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061D18

	thumb_func_start sub_8061D38
sub_8061D38: @ 8061D38
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x4
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061D58
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061D38

	thumb_func_start sub_8061D58
sub_8061D58: @ 8061D58
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061D6A
	movs r0, 0
	b _08061D70
_08061D6A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061D70:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061D58

	thumb_func_start sub_8061D78
sub_8061D78: @ 8061D78
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x4
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061D98
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061D78

	thumb_func_start sub_8061D98
sub_8061D98: @ 8061D98
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061DAA
	movs r0, 0
	b _08061DB0
_08061DAA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061DB0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061D98

	thumb_func_start sub_8061DB8
sub_8061DB8: @ 8061DB8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x4
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061DD8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061DB8

	thumb_func_start sub_8061DD8
sub_8061DD8: @ 8061DD8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061DEA
	movs r0, 0
	b _08061DF0
_08061DEA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061DF0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061DD8

	thumb_func_start do_run_south_anim
do_run_south_anim: @ 8061DF8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	bl do_run_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061E18
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end do_run_south_anim

	thumb_func_start sub_8061E18
sub_8061E18: @ 8061E18
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061E2A
	movs r0, 0
	b _08061E30
_08061E2A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061E30:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061E18

	thumb_func_start do_run_north_anim
do_run_north_anim: @ 8061E38
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	bl do_run_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061E58
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end do_run_north_anim

	thumb_func_start sub_8061E58
sub_8061E58: @ 8061E58
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061E6A
	movs r0, 0
	b _08061E70
_08061E6A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061E70:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061E58

	thumb_func_start do_run_west_anim
do_run_west_anim: @ 8061E78
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	bl do_run_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061E98
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end do_run_west_anim

	thumb_func_start sub_8061E98
sub_8061E98: @ 8061E98
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061EAA
	movs r0, 0
	b _08061EB0
_08061EAA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061EB0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061E98

	thumb_func_start do_run_east_anim
do_run_east_anim: @ 8061EB8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	bl do_run_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061ED8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end do_run_east_anim

	thumb_func_start sub_8061ED8
sub_8061ED8: @ 8061ED8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061EEA
	movs r0, 0
	b _08061EF0
_08061EEA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061EF0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061ED8

	thumb_func_start npc_set_direction_and_anim__an_proceed
npc_set_direction_and_anim__an_proceed: @ 8061EF8
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	adds r4, r2, 0
	adds r1, r3, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	movs r2, 0
	bl obj_anim_image_set_and_seek
	adds r0, r6, 0
	adds r1, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x32]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end npc_set_direction_and_anim__an_proceed

	thumb_func_start sub_8061F24
sub_8061F24: @ 8061F24
	push {lr}
	ldrb r2, [r0, 0x18]
	lsrs r2, 4
	adds r3, r1, 0
	adds r3, 0x2A
	ldrb r3, [r3]
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8061F24

	thumb_func_start sub_8061F3C
sub_8061F3C: @ 8061F3C
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	bl sub_8064864
	lsls r0, 24
	cmp r0, 0
	bne _08061F50
	movs r0, 0
	b _08061F56
_08061F50:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061F56:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061F3C

	thumb_func_start sub_8061F5C
sub_8061F5C: @ 8061F5C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r1, 0
	lsls r4, r2, 24
	lsrs r4, 24
	movs r1, 0
	str r1, [sp]
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0x1
	bl sub_806113C
	adds r0, r4, 0
	bl sub_805FD88
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8061F5C

	thumb_func_start sub_8061F90
sub_8061F90: @ 8061F90
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	bl sub_8061F5C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061FB0
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061F90

	thumb_func_start sub_8061FB0
sub_8061FB0: @ 8061FB0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061340
	lsls r0, 24
	cmp r0, 0
	bne _08061FC4
	movs r0, 0
	b _08061FD2
_08061FC4:
	movs r0, 0x2
	strh r0, [r5, 0x32]
	ldrb r1, [r4]
	subs r0, 0x23
	ands r0, r1
	strb r0, [r4]
	movs r0, 0x1
_08061FD2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061FB0

	thumb_func_start sub_8061FD8
sub_8061FD8: @ 8061FD8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	bl sub_8061F5C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061FF8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061FD8

	thumb_func_start sub_8061FF8
sub_8061FF8: @ 8061FF8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061340
	lsls r0, 24
	cmp r0, 0
	bne _0806200C
	movs r0, 0
	b _0806201A
_0806200C:
	movs r0, 0x2
	strh r0, [r5, 0x32]
	ldrb r1, [r4]
	subs r0, 0x23
	ands r0, r1
	strb r0, [r4]
	movs r0, 0x1
_0806201A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061FF8

	thumb_func_start sub_8062020
sub_8062020: @ 8062020
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	bl sub_8061F5C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062040
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062020

	thumb_func_start sub_8062040
sub_8062040: @ 8062040
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061340
	lsls r0, 24
	cmp r0, 0
	bne _08062054
	movs r0, 0
	b _08062062
_08062054:
	movs r0, 0x2
	strh r0, [r5, 0x32]
	ldrb r1, [r4]
	subs r0, 0x23
	ands r0, r1
	strb r0, [r4]
	movs r0, 0x1
_08062062:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062040

	thumb_func_start sub_8062068
sub_8062068: @ 8062068
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	bl sub_8061F5C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062088
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062068

	thumb_func_start sub_8062088
sub_8062088: @ 8062088
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061340
	lsls r0, 24
	cmp r0, 0
	bne _0806209C
	movs r0, 0
	b _080620AA
_0806209C:
	movs r0, 0x2
	strh r0, [r5, 0x32]
	ldrb r1, [r4]
	subs r0, 0x23
	ands r0, r1
	strb r0, [r4]
	movs r0, 0x1
_080620AA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062088

	thumb_func_start sub_80620B0
sub_80620B0: @ 80620B0
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _080620FA
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	movs r2, 0x12
	ldrsh r1, [r5, r2]
	ldr r4, _08062108 @ =gMapObjects
	mov r2, sp
	ldrb r2, [r2]
	lsls r3, r2, 3
	adds r3, r2
	lsls r3, 2
	adds r3, r4
	movs r4, 0x10
	ldrsh r2, [r3, r4]
	movs r4, 0x12
	ldrsh r3, [r3, r4]
	bl sub_805FE90
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r6, 0
	bl an_look_any
_080620FA:
	movs r0, 0x1
	strh r0, [r6, 0x32]
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08062108: .4byte gMapObjects
	thumb_func_end sub_80620B0

	thumb_func_start sub_806210C
sub_806210C: @ 806210C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0806215E
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	movs r2, 0x12
	ldrsh r1, [r5, r2]
	ldr r4, _0806216C @ =gMapObjects
	mov r2, sp
	ldrb r2, [r2]
	lsls r3, r2, 3
	adds r3, r2
	lsls r3, 2
	adds r3, r4
	movs r4, 0x10
	ldrsh r2, [r3, r4]
	movs r4, 0x12
	ldrsh r3, [r3, r4]
	bl sub_805FE90
	lsls r0, 24
	lsrs r0, 24
	bl GetOppositeDirection
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r6, 0
	bl an_look_any
_0806215E:
	movs r0, 0x1
	strh r0, [r6, 0x32]
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806216C: .4byte gMapObjects
	thumb_func_end sub_806210C

	thumb_func_start sub_8062170
sub_8062170: @ 8062170
	ldrb r2, [r0, 0x1]
	movs r3, 0x2
	orrs r2, r3
	strb r2, [r0, 0x1]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_8062170

	thumb_func_start sub_8062180
sub_8062180: @ 8062180
	ldrb r3, [r0, 0x1]
	movs r2, 0x3
	negs r2, r2
	ands r2, r3
	strb r2, [r0, 0x1]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_8062180

	thumb_func_start sub_8062190
sub_8062190: @ 8062190
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x1
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80621BC
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062190

	thumb_func_start sub_80621BC
sub_80621BC: @ 80621BC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _080621D0
	movs r0, 0
	b _080621E0
_080621D0:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080621E0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80621BC

	thumb_func_start sub_80621E8
sub_80621E8: @ 80621E8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x1
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062214
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80621E8

	thumb_func_start sub_8062214
sub_8062214: @ 8062214
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062228
	movs r0, 0
	b _08062238
_08062228:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062238:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062214

	thumb_func_start sub_8062240
sub_8062240: @ 8062240
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0x1
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806226C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062240

	thumb_func_start sub_806226C
sub_806226C: @ 806226C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062280
	movs r0, 0
	b _08062290
_08062280:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062290:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806226C

	thumb_func_start sub_8062298
sub_8062298: @ 8062298
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0x1
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80622C4
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062298

	thumb_func_start sub_80622C4
sub_80622C4: @ 80622C4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _080622D8
	movs r0, 0
	b _080622E8
_080622D8:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080622E8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80622C4

	thumb_func_start sub_80622F0
sub_80622F0: @ 80622F0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806231C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80622F0

	thumb_func_start sub_806231C
sub_806231C: @ 806231C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062330
	movs r0, 0
	b _08062340
_08062330:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062340:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806231C

	thumb_func_start sub_8062348
sub_8062348: @ 8062348
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062374
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062348

	thumb_func_start sub_8062374
sub_8062374: @ 8062374
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062388
	movs r0, 0
	b _08062398
_08062388:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062398:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062374

	thumb_func_start sub_80623A0
sub_80623A0: @ 80623A0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80623CC
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80623A0

	thumb_func_start sub_80623CC
sub_80623CC: @ 80623CC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _080623E0
	movs r0, 0
	b _080623F0
_080623E0:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080623F0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80623CC

	thumb_func_start sub_80623F8
sub_80623F8: @ 80623F8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062424
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80623F8

	thumb_func_start sub_8062424
sub_8062424: @ 8062424
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062438
	movs r0, 0
	b _08062448
_08062438:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062448:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062424

	thumb_func_start sub_8062450
sub_8062450: @ 8062450
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806247C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062450

	thumb_func_start sub_806247C
sub_806247C: @ 806247C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061358
	lsls r0, 24
	cmp r0, 0
	bne _08062490
	movs r0, 0
	b _080624A0
_08062490:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080624A0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806247C

	thumb_func_start sub_80624A8
sub_80624A8: @ 80624A8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80624D4
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80624A8

	thumb_func_start sub_80624D4
sub_80624D4: @ 80624D4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061358
	lsls r0, 24
	cmp r0, 0
	bne _080624E8
	movs r0, 0
	b _080624F8
_080624E8:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080624F8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80624D4

	thumb_func_start sub_8062500
sub_8062500: @ 8062500
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806252C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062500

	thumb_func_start sub_806252C
sub_806252C: @ 806252C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061358
	lsls r0, 24
	cmp r0, 0
	bne _08062540
	movs r0, 0
	b _08062550
_08062540:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062550:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806252C

	thumb_func_start sub_8062558
sub_8062558: @ 8062558
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062584
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062558

	thumb_func_start sub_8062584
sub_8062584: @ 8062584
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061358
	lsls r0, 24
	cmp r0, 0
	bne _08062598
	movs r0, 0
	b _080625A8
_08062598:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080625A8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062584

	thumb_func_start sub_80625B0
sub_80625B0: @ 80625B0
	push {lr}
	ldr r3, _080625C4 @ =gUnknown_0836DC09
	ldrb r2, [r0, 0x6]
	adds r2, r3
	ldrb r2, [r2]
	bl an_look_any
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_080625C4: .4byte gUnknown_0836DC09
	thumb_func_end sub_80625B0

	thumb_func_start sub_80625C8
sub_80625C8: @ 80625C8
	push {lr}
	movs r2, 0x1
	movs r3, 0x14
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80625C8

	thumb_func_start sub_80625D8
sub_80625D8: @ 80625D8
	ldrb r3, [r0, 0x3]
	movs r2, 0x3
	negs r2, r2
	ands r2, r3
	strb r2, [r0, 0x3]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_80625D8

	thumb_func_start sub_80625E8
sub_80625E8: @ 80625E8
	ldrb r2, [r0, 0x3]
	movs r3, 0x2
	orrs r2, r3
	strb r2, [r0, 0x3]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_80625E8

	thumb_func_start sub_80625F8
sub_80625F8: @ 80625F8
	ldrb r2, [r0, 0x1]
	movs r3, 0x10
	orrs r2, r3
	strb r2, [r0, 0x1]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_80625F8

	thumb_func_start sub_8062608
sub_8062608: @ 8062608
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x5]
	bl GetFieldObjectGraphicsInfo
	ldrb r1, [r0, 0xC]
	lsls r1, 25
	lsrs r1, 31
	lsls r1, 4
	ldrb r2, [r4, 0x1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x1
	strh r0, [r5, 0x32]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062608

	thumb_func_start sub_8062634
sub_8062634: @ 8062634
	ldrb r2, [r0, 0x1]
	movs r3, 0x20
	orrs r2, r3
	strb r2, [r0, 0x1]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_8062634

	thumb_func_start sub_8062644
sub_8062644: @ 8062644
	ldrb r3, [r0, 0x1]
	movs r2, 0x21
	negs r2, r2
	ands r2, r3
	strb r2, [r0, 0x1]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_8062644

	thumb_func_start do_exclamation_mark_bubble_1
do_exclamation_mark_bubble_1: @ 8062654
	push {r4,lr}
	adds r4, r1, 0
	ldr r1, _08062674 @ =gUnknown_0202FF84
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0
	bl FieldEffectStart
	movs r0, 0x1
	strh r0, [r4, 0x32]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08062674: .4byte gUnknown_0202FF84
	thumb_func_end do_exclamation_mark_bubble_1

	thumb_func_start do_exclamation_mark_bubble_2
do_exclamation_mark_bubble_2: @ 8062678
	push {r4,lr}
	adds r4, r1, 0
	ldr r1, _08062698 @ =gUnknown_0202FF84
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0x21
	bl FieldEffectStart
	movs r0, 0x1
	strh r0, [r4, 0x32]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08062698: .4byte gUnknown_0202FF84
	thumb_func_end do_exclamation_mark_bubble_2

	thumb_func_start do_heart_bubble
do_heart_bubble: @ 806269C
	push {r4,lr}
	adds r4, r1, 0
	ldr r1, _080626BC @ =gUnknown_0202FF84
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0x2E
	bl FieldEffectStart
	movs r0, 0x1
	strh r0, [r4, 0x32]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080626BC: .4byte gUnknown_0202FF84
	thumb_func_end do_heart_bubble

	thumb_func_start sub_80626C0
sub_80626C0: @ 80626C0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x6]
	cmp r0, 0x3F
	bne _080626D6
	adds r0, r4, 0
	bl sub_8084794
	movs r0, 0
	b _080626FE
_080626D6:
	subs r0, 0x39
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080626F8
	adds r0, r4, 0
	bl sub_812869C
	movs r0, 0x1
	strh r0, [r5, 0x32]
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062704
	lsls r0, 24
	lsrs r0, 24
	b _080626FE
_080626F8:
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080626FE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80626C0

	thumb_func_start sub_8062704
sub_8062704: @ 8062704
	push {r4,lr}
	adds r4, r1, 0
	bl sub_81286C4
	lsls r0, 24
	cmp r0, 0
	bne _08062716
	movs r0, 0
	b _0806271C
_08062716:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_0806271C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8062704

	thumb_func_start sub_8062724
sub_8062724: @ 8062724
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl obj_anim_image_set_and_seek
	movs r0, 0x1
	strh r0, [r4, 0x32]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8062724

	thumb_func_start sub_8062740
sub_8062740: @ 8062740
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	bl sub_8064864
	lsls r0, 24
	cmp r0, 0
	beq _0806275C
	adds r0, r4, 0
	movs r1, 0x20
	bl sub_8064820
	movs r0, 0x2
	strh r0, [r4, 0x32]
_0806275C:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8062740

	thumb_func_start sub_8062764
sub_8062764: @ 8062764
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r2, [r4, 0x1]
	lsls r1, r2, 26
	lsrs r1, 31
	movs r0, 0x1
	eors r1, r0
	lsls r1, 5
	subs r0, 0x22
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	beq _08062796
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x3
	strh r0, [r5, 0x32]
_08062796:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062764

	thumb_func_start sub_80627A0
sub_80627A0: @ 80627A0
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl obj_anim_image_set_and_seek
	movs r0, 0x1
	strh r0, [r4, 0x32]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80627A0

	thumb_func_start sub_80627BC
sub_80627BC: @ 80627BC
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	bl sub_8064864
	lsls r0, 24
	cmp r0, 0
	beq _080627D8
	adds r0, r4, 0
	movs r1, 0x20
	bl sub_8064820
	movs r0, 0x2
	strh r0, [r4, 0x32]
_080627D8:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80627BC

	thumb_func_start sub_80627E0
sub_80627E0: @ 80627E0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r2, [r4, 0x1]
	lsls r1, r2, 26
	lsrs r1, 31
	movs r0, 0x1
	eors r1, r0
	lsls r1, 5
	subs r0, 0x22
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	beq _08062812
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x3
	strh r0, [r5, 0x32]
_08062812:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80627E0

	thumb_func_start sub_806281C
sub_806281C: @ 806281C
	ldrb r2, [r0, 0x3]
	movs r3, 0x4
	orrs r2, r3
	strb r2, [r0, 0x3]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_806281C

	thumb_func_start sub_806282C
sub_806282C: @ 806282C
	ldrb r3, [r0, 0x3]
	movs r2, 0x5
	negs r2, r2
	ands r2, r3
	strb r2, [r0, 0x3]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_806282C

	thumb_func_start sub_806283C
sub_806283C: @ 806283C
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	adds r4, 0x42
	ldrb r1, [r4]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r4]
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806283C

	thumb_func_start sub_806286C
sub_806286C: @ 806286C
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r0, [r4, 0x1]
	movs r1, 0x4
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x1]
	lsrs r1, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	movs r3, 0
	adds r0, r4, 0
	bl CalcCenterToCornerVec
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806286C

	thumb_func_start sub_806289C
sub_806289C: @ 806289C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r2, 0x1
	bl sub_8060ED8
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAffineAnimIfDifferent
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80628D0
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806289C

	thumb_func_start sub_80628D0
sub_80628D0: @ 80628D0
	push {r4,lr}
	adds r4, r1, 0
	bl an_walk_any_2
	lsls r0, 24
	cmp r0, 0
	bne _080628E2
	movs r0, 0
	b _080628F4
_080628E2:
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080628F4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80628D0

	thumb_func_start sub_80628FC
sub_80628FC: @ 80628FC
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r2, 0x1
	bl sub_8060ED8
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnimIfDifferent
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8062930
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80628FC

	thumb_func_start sub_8062930
sub_8062930: @ 8062930
	push {r4,lr}
	adds r4, r1, 0
	bl an_walk_any_2
	lsls r0, 24
	cmp r0, 0
	bne _08062942
	movs r0, 0
	b _08062954
_08062942:
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08062954:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8062930

	thumb_func_start sub_806295C
sub_806295C: @ 806295C
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	lsls r4, r2, 24
	lsrs r4, 24
	adds r1, r4, 0
	bl FieldObjectSetDirection
	adds r0, r5, 0
	bl npc_coords_shift_still
	adds r0, r4, 0
	bl sub_805FDD8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_805FE64
	adds r2, r6, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
	strh r0, [r6, 0x32]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_806295C

	thumb_func_start sub_806299C
sub_806299C: @ 806299C
	push {lr}
	movs r2, 0x1
	bl sub_806295C
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_806299C

	thumb_func_start sub_80629AC
sub_80629AC: @ 80629AC
	push {lr}
	movs r2, 0x2
	bl sub_806295C
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_80629AC

	thumb_func_start sub_80629BC
sub_80629BC: @ 80629BC
	push {lr}
	movs r2, 0x3
	bl sub_806295C
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_80629BC

	thumb_func_start sub_80629CC
sub_80629CC: @ 80629CC
	push {lr}
	movs r2, 0x4
	bl sub_806295C
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_80629CC

	thumb_func_start sub_80629DC
sub_80629DC: @ 80629DC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl sub_805FD98
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80629DC

	thumb_func_start sub_8062A00
sub_8062A00: @ 8062A00
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl sub_805FD98
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062A00

	thumb_func_start sub_8062A24
sub_8062A24: @ 8062A24
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl sub_805FD98
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062A24

	thumb_func_start sub_8062A48
sub_8062A48: @ 8062A48
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl sub_805FD98
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062A48

	thumb_func_start sub_8062A6C
sub_8062A6C: @ 8062A6C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl sub_805FDB8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062A6C

	thumb_func_start sub_8062A90
sub_8062A90: @ 8062A90
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl sub_805FDB8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062A90

	thumb_func_start sub_8062AB4
sub_8062AB4: @ 8062AB4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl sub_805FDB8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062AB4

	thumb_func_start sub_8062AD8
sub_8062AD8: @ 8062AD8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl sub_805FDB8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062AD8

	thumb_func_start sub_8062AFC
sub_8062AFC: @ 8062AFC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl sub_805FDC8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062AFC

	thumb_func_start sub_8062B20
sub_8062B20: @ 8062B20
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl sub_805FDC8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062B20

	thumb_func_start sub_8062B44
sub_8062B44: @ 8062B44
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl sub_805FDC8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062B44

	thumb_func_start sub_8062B68
sub_8062B68: @ 8062B68
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl sub_805FDC8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062B68

	thumb_func_start sub_8062B8C
sub_8062B8C: @ 8062B8C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	adds r5, r1, 0
	adds r4, r2, 0
	ldr r0, [sp, 0x14]
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	adds r0, r6, 0
	adds r2, r4, 0
	bl sub_806113C
	adds r0, r4, 0
	bl sub_805FD98
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnimIfDifferent
	adds r0, r6, 0
	bl DoShadowFieldEffect
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8062B8C

	thumb_func_start sub_8062BD0
sub_8062BD0: @ 8062BD0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062BFC
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062BD0

	thumb_func_start sub_8062BFC
sub_8062BFC: @ 8062BFC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062C10
	movs r0, 0
	b _08062C20
_08062C10:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062C20:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062BFC

	thumb_func_start sub_8062C28
sub_8062C28: @ 8062C28
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062C54
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062C28

	thumb_func_start sub_8062C54
sub_8062C54: @ 8062C54
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062C68
	movs r0, 0
	b _08062C78
_08062C68:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062C78:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062C54

	thumb_func_start sub_8062C80
sub_8062C80: @ 8062C80
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062CAC
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062C80

	thumb_func_start sub_8062CAC
sub_8062CAC: @ 8062CAC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062CC0
	movs r0, 0
	b _08062CD0
_08062CC0:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062CD0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062CAC

	thumb_func_start sub_8062CD8
sub_8062CD8: @ 8062CD8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062D04
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062CD8

	thumb_func_start sub_8062D04
sub_8062D04: @ 8062D04
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062D18
	movs r0, 0
	b _08062D28
_08062D18:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062D28:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062D04

	thumb_func_start sub_8062D30
sub_8062D30: @ 8062D30
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x1
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062D5C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062D30

	thumb_func_start sub_8062D5C
sub_8062D5C: @ 8062D5C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062D70
	movs r0, 0
	b _08062D80
_08062D70:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062D80:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062D5C

	thumb_func_start sub_8062D88
sub_8062D88: @ 8062D88
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062DB4
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062D88

	thumb_func_start sub_8062DB4
sub_8062DB4: @ 8062DB4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062DC8
	movs r0, 0
	b _08062DD8
_08062DC8:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062DD8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062DB4

	thumb_func_start sub_8062DE0
sub_8062DE0: @ 8062DE0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062E0C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062DE0

	thumb_func_start sub_8062E0C
sub_8062E0C: @ 8062E0C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062E20
	movs r0, 0
	b _08062E30
_08062E20:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062E30:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062E0C

	thumb_func_start sub_8062E38
sub_8062E38: @ 8062E38
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0x1
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062E64
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062E38

	thumb_func_start sub_8062E64
sub_8062E64: @ 8062E64
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062E78
	movs r0, 0
	b _08062E88
_08062E78:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062E88:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062E64

	thumb_func_start sub_8062E90
sub_8062E90: @ 8062E90
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x2
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062EBC
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062E90

	thumb_func_start sub_8062EBC
sub_8062EBC: @ 8062EBC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062ED0
	movs r0, 0
	b _08062EE0
_08062ED0:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062EE0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062EBC

	thumb_func_start sub_8062EE8
sub_8062EE8: @ 8062EE8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062F14
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062EE8

	thumb_func_start sub_8062F14
sub_8062F14: @ 8062F14
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062F28
	movs r0, 0
	b _08062F38
_08062F28:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062F38:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062F14

	thumb_func_start sub_8062F40
sub_8062F40: @ 8062F40
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0x2
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062F6C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062F40

	thumb_func_start sub_8062F6C
sub_8062F6C: @ 8062F6C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062F80
	movs r0, 0
	b _08062F90
_08062F80:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062F90:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062F6C

	thumb_func_start sub_8062F98
sub_8062F98: @ 8062F98
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0x2
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062FC4
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062F98

	thumb_func_start sub_8062FC4
sub_8062FC4: @ 8062FC4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062FD8
	movs r0, 0
	b _08062FE8
_08062FD8:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062FE8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062FC4

	thumb_func_start sub_8062FF0
sub_8062FF0: @ 8062FF0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl sub_805FDD8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062FF0

	thumb_func_start sub_8063028
sub_8063028: @ 8063028
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl sub_805FDD8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063028

	thumb_func_start sub_8063060
sub_8063060: @ 8063060
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl sub_805FDD8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063060

	thumb_func_start sub_8063098
sub_8063098: @ 8063098
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl sub_805FDD8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063098

	thumb_func_start sub_80630D0
sub_80630D0: @ 80630D0
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	bl sub_8060D20
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_805FD98
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	movs r1, 0
	bl SeekSpriteAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80630D0

	thumb_func_start sub_8063108
sub_8063108: @ 8063108
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x1
	bl sub_80630D0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063128
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063108

	thumb_func_start sub_8063128
sub_8063128: @ 8063128
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806313A
	movs r0, 0
	b _08063140
_0806313A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08063140:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063128

	thumb_func_start sub_8063148
sub_8063148: @ 8063148
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_80630D0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063168
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063148

	thumb_func_start sub_8063168
sub_8063168: @ 8063168
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806317A
	movs r0, 0
	b _08063180
_0806317A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08063180:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063168

	thumb_func_start sub_8063188
sub_8063188: @ 8063188
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_80630D0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80631A8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063188

	thumb_func_start sub_80631A8
sub_80631A8: @ 80631A8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080631BA
	movs r0, 0
	b _080631C0
_080631BA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080631C0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80631A8

	thumb_func_start sub_80631C8
sub_80631C8: @ 80631C8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x1
	bl sub_80630D0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80631E8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80631C8

	thumb_func_start sub_80631E8
sub_80631E8: @ 80631E8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080631FA
	movs r0, 0
	b _08063200
_080631FA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08063200:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80631E8

	thumb_func_start sub_8063208
sub_8063208: @ 8063208
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	bl sub_8060D20
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_805FDD8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805FE28
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8063208

	thumb_func_start sub_8063238
sub_8063238: @ 8063238
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x1
	bl sub_8063208
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063258
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063238

	thumb_func_start sub_8063258
sub_8063258: @ 8063258
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806326A
	movs r0, 0
	b _08063270
_0806326A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08063270:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063258

	thumb_func_start sub_8063278
sub_8063278: @ 8063278
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_8063208
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063298
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063278

	thumb_func_start sub_8063298
sub_8063298: @ 8063298
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080632AA
	movs r0, 0
	b _080632B0
_080632AA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080632B0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063298

	thumb_func_start sub_80632B8
sub_80632B8: @ 80632B8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_8063208
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80632D8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80632B8

	thumb_func_start sub_80632D8
sub_80632D8: @ 80632D8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080632EA
	movs r0, 0
	b _080632F0
_080632EA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080632F0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80632D8

	thumb_func_start sub_80632F8
sub_80632F8: @ 80632F8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x1
	bl sub_8063208
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063318
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80632F8

	thumb_func_start sub_8063318
sub_8063318: @ 8063318
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806332A
	movs r0, 0
	b _08063330
_0806332A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08063330:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063318

	thumb_func_start sub_8063338
sub_8063338: @ 8063338
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	bl sub_8060D20
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_805FDB8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	movs r1, 0
	bl SeekSpriteAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8063338

	thumb_func_start sub_8063370
sub_8063370: @ 8063370
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x1
	bl sub_8063338
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063390
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063370

	thumb_func_start sub_8063390
sub_8063390: @ 8063390
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080633A2
	movs r0, 0
	b _080633A8
_080633A2:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080633A8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063390

	thumb_func_start sub_80633B0
sub_80633B0: @ 80633B0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_8063338
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80633D0
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80633B0

	thumb_func_start sub_80633D0
sub_80633D0: @ 80633D0
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080633E2
	movs r0, 0
	b _080633E8
_080633E2:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080633E8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80633D0

	thumb_func_start sub_80633F0
sub_80633F0: @ 80633F0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_8063338
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063410
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80633F0

	thumb_func_start sub_8063410
sub_8063410: @ 8063410
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08063422
	movs r0, 0
	b _08063428
_08063422:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08063428:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063410

	thumb_func_start sub_8063430
sub_8063430: @ 8063430
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x1
	bl sub_8063338
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063450
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063430

	thumb_func_start sub_8063450
sub_8063450: @ 8063450
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08063462
	movs r0, 0
	b _08063468
_08063462:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08063468:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063450

	thumb_func_start sub_8063470
sub_8063470: @ 8063470
	movs r0, 0x1
	bx lr
	thumb_func_end sub_8063470

	thumb_func_start sub_8063474
sub_8063474: @ 8063474
	adds r1, 0x2C
	ldrb r0, [r1]
	movs r2, 0x40
	orrs r0, r2
	strb r0, [r1]
	movs r0, 0x1
	bx lr
	thumb_func_end sub_8063474

	thumb_func_start npc_obj_transfer_image_anim_pause_flag
npc_obj_transfer_image_anim_pause_flag: @ 8063484
	push {lr}
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	cmp r0, 0
	bge _0806349A
	adds r0, r1, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
_0806349A:
	pop {r0}
	bx r0
	thumb_func_end npc_obj_transfer_image_anim_pause_flag

	thumb_func_start sub_80634A0
sub_80634A0: @ 80634A0
	push {r4,lr}
	adds r4, r0, 0
	ldrb r3, [r4, 0x1]
	lsls r0, r3, 28
	cmp r0, 0
	bge _080634C8
	adds r2, r1, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	movs r1, 0x9
	negs r1, r1
	ands r0, r1
	strb r0, [r4, 0x1]
_080634C8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80634A0

	thumb_func_start sub_80634D0
sub_80634D0: @ 80634D0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_80634E8
	adds r0, r4, 0
	adds r1, r5, 0
	bl npc_update_obj_anim_flag
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80634D0

	thumb_func_start sub_80634E8
sub_80634E8: @ 80634E8
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldrb r1, [r5, 0x1]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x1]
	ldrb r0, [r5, 0x5]
	bl GetFieldObjectGraphicsInfo
	adds r6, r0, 0
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0806354C
	ldrh r1, [r4, 0x24]
	ldrh r0, [r4, 0x20]
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldr r2, _08063544 @ =gSpriteCoordOffsetX
	adds r0, r1
	ldrh r2, [r2]
	adds r0, r2
	lsls r0, 16
	lsrs r3, r0, 16
	ldrh r1, [r4, 0x26]
	ldrh r0, [r4, 0x22]
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldr r2, _08063548 @ =gSpriteCoordOffsetY
	adds r0, r1
	ldrh r2, [r2]
	adds r0, r2
	b _08063574
	.align 2, 0
_08063544: .4byte gSpriteCoordOffsetX
_08063548: .4byte gSpriteCoordOffsetY
_0806354C:
	ldrh r1, [r4, 0x24]
	ldrh r0, [r4, 0x20]
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	ldrh r1, [r4, 0x26]
	ldrh r0, [r4, 0x22]
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
_08063574:
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r6, 0x8]
	adds r0, r3
	lsls r0, 16
	lsrs r1, r0, 16
	ldrh r0, [r6, 0xA]
	adds r0, r2
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, 0xFF
	bgt _0806359C
	lsls r0, r1, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _080635A4
_0806359C:
	ldrb r0, [r5, 0x1]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r5, 0x1]
_080635A4:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0xAF
	bgt _080635B8
	lsls r0, r4, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _080635C0
_080635B8:
	ldrb r0, [r5, 0x1]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r5, 0x1]
_080635C0:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80634E8

	thumb_func_start npc_update_obj_anim_flag
npc_update_obj_anim_flag: @ 80635C8
	push {lr}
	adds r2, r1, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r3, 0x5
	negs r3, r3
	ands r3, r1
	strb r3, [r2]
	ldrb r1, [r0, 0x1]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _080635EA
	movs r1, 0x4
	adds r0, r3, 0
	orrs r0, r1
	strb r0, [r2]
_080635EA:
	pop {r0}
	bx r0
	thumb_func_end npc_update_obj_anim_flag

	.align 2, 0 @ Don't pad with nop.
