	.include "constants/gba_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start object_new_hidden_with_callback
object_new_hidden_with_callback: @ 8040EB4
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r0, _08040EE8
	movs r1, 0xF8
	movs r2, 0xA8
	movs r3, 0xE
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08040EEC
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r3, r2, r5
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r4, 0x4
	orrs r1, r4
	strb r1, [r3]
	adds r5, 0x1C
	adds r2, r5
	str r6, [r2]
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08040EE8: .4byte gSpriteTemplate_82087AC
_08040EEC: .4byte 0x02020004
	thumb_func_end object_new_hidden_with_callback

	thumb_func_start StoreWordInTwoHalfwords
StoreWordInTwoHalfwords: @ 8040EF0
	strh r1, [r0]
	lsrs r1, 16
	strh r1, [r0, 0x2]
	bx lr
	thumb_func_end StoreWordInTwoHalfwords

	thumb_func_start LoadWordFromTwoHalfwords
LoadWordFromTwoHalfwords: @ 8040EF8
	ldrh r2, [r0]
	movs r3, 0x2
	ldrsh r0, [r0, r3]
	lsls r0, 16
	orrs r2, r0
	str r2, [r1]
	bx lr
	thumb_func_end LoadWordFromTwoHalfwords

	thumb_func_start sub_8040F08
sub_8040F08: @ 8040F08
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r4, [sp, 0x18]
	ldr r5, [sp, 0x1C]
	ldr r6, [sp, 0x20]
	ldr r7, [sp, 0x24]
	mov r8, r7
	str r1, [r0]
	str r2, [r0, 0x4]
	strh r3, [r0, 0x8]
	strh r4, [r0, 0xA]
	strh r5, [r0, 0xC]
	strh r6, [r0, 0xE]
	mov r1, r8
	strh r1, [r0, 0x10]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8040F08

	thumb_func_start sub_8040F34
sub_8040F34: @ 8040F34
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x24
	mov r8, r0
	ldr r0, [sp, 0x38]
	ldr r4, [sp, 0x3C]
	ldr r5, [sp, 0x40]
	ldr r6, [sp, 0x44]
	lsls r6, 16
	lsrs r6, 16
	lsls r3, 16
	asrs r3, 16
	lsls r0, 16
	asrs r0, 16
	str r0, [sp]
	lsls r4, 16
	asrs r4, 16
	str r4, [sp, 0x4]
	lsls r5, 16
	asrs r5, 16
	str r5, [sp, 0x8]
	str r6, [sp, 0xC]
	add r0, sp, 0x10
	bl sub_8040F08
	add r0, sp, 0x10
	mov r1, r8
	movs r2, 0x1
	bl BgAffineSet
	add sp, 0x24
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8040F34

	thumb_func_start sub_8040F80
sub_8040F80: @ 8040F80
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x3C
	str r2, [sp, 0x20]
	adds r4, r3, 0
	ldr r7, [sp, 0x5C]
	lsls r0, 24
	lsls r1, 24
	ldr r2, _08041008
	lsrs r1, 23
	lsrs r0, 21
	adds r1, r0
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	str r0, [sp, 0x24]
	adds r1, r2
	ldrb r1, [r1]
	str r1, [sp, 0x28]
	movs r1, 0
	cmp r1, r0
	bcc _08040FB4
	b _08041136
_08040FB4:
	movs r0, 0x20
	ldr r2, [sp, 0x28]
	subs r0, r2
	lsls r0, 1
	str r0, [sp, 0x2C]
_08040FBE:
	movs r2, 0
	adds r1, 0x1
	str r1, [sp, 0x34]
	ldr r3, [sp, 0x28]
	cmp r2, r3
	bcc _08040FCC
	b _08041124
_08040FCC:
	ldr r0, _0804100C
	mov r8, r0
_08040FD0:
	ldrh r1, [r4]
	ldr r0, _08041010
	ands r0, r1
	lsls r0, 5
	mov r12, r0
	movs r0, 0xC0
	lsls r0, 4
	ands r0, r1
	mov r3, sp
	strh r1, [r3, 0x38]
	cmp r0, 0
	bne _08041018
	ldr r0, [sp, 0x20]
	add r0, r12
	mov r1, r8
	str r0, [r1]
	str r7, [r1, 0x4]
	ldr r3, _08041014
	str r3, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r4, 0x2
	str r4, [sp, 0x30]
	adds r7, 0x20
	mov r10, r7
	adds r2, 0x1
	mov r9, r2
	b _08041112
	.align 2, 0
_08041008: .4byte gUnknown_082087C4
_0804100C: .4byte 0x040000d4
_08041010: .4byte 0x000003ff
_08041014: .4byte 0x84000008
_08041018:
	movs r1, 0x80
	lsls r1, 4
	cmp r0, r1
	bne _08041068
	movs r3, 0
	adds r4, 0x2
	str r4, [sp, 0x30]
	movs r0, 0x20
	adds r0, r7
	mov r10, r0
	adds r2, 0x1
	mov r9, r2
	ldr r4, _08041060
	ldr r6, _08041064
	movs r5, 0x7
_08041036:
	lsls r2, r3, 24
	asrs r2, 24
	subs r0, r5, r2
	lsls r0, 2
	add r0, r12
	ldr r1, [sp, 0x20]
	adds r0, r1, r0
	lsls r1, r2, 2
	adds r1, r7, r1
	str r0, [r4]
	str r1, [r4, 0x4]
	str r6, [r4, 0x8]
	ldr r0, [r4, 0x8]
	adds r2, 0x1
	lsls r2, 24
	lsrs r3, r2, 24
	asrs r2, 24
	cmp r2, 0x7
	ble _08041036
	b _08041112
	.align 2, 0
_08041060: .4byte 0x040000d4
_08041064: .4byte 0x84000001
_08041068:
	movs r3, 0
	adds r4, 0x2
	str r4, [sp, 0x30]
	movs r0, 0x20
	adds r0, r7
	mov r10, r0
	adds r2, 0x1
	mov r9, r2
_08041078:
	movs r2, 0
	lsls r4, r3, 24
	lsls r0, r4, 2
	lsrs r0, 24
	adds r6, r0, 0x3
	mov r1, r12
	adds r5, r1, r0
_08041086:
	lsls r1, r2, 24
	asrs r1, 24
	subs r0, r6, r1
	mov r2, sp
	adds r3, r2, r0
	adds r0, r5, r1
	ldr r2, [sp, 0x20]
	adds r0, r2, r0
	ldrb r2, [r0]
	movs r0, 0xF
	ands r0, r2
	lsls r0, 4
	lsrs r2, 4
	orrs r0, r2
	strb r0, [r3]
	adds r1, 0x1
	lsls r1, 24
	lsrs r2, r1, 24
	asrs r1, 24
	cmp r1, 0x3
	ble _08041086
	movs r3, 0x80
	lsls r3, 17
	adds r0, r4, r3
	lsrs r3, r0, 24
	asrs r0, 24
	cmp r0, 0x7
	ble _08041078
	movs r0, 0x80
	lsls r0, 4
	mov r1, sp
	ldrh r1, [r1, 0x38]
	ands r0, r1
	cmp r0, 0
	beq _08041104
	movs r3, 0
	ldr r4, _080410FC
	ldr r6, _08041100
	movs r5, 0x7
_080410D4:
	lsls r1, r3, 24
	asrs r1, 24
	subs r0, r5, r1
	lsls r0, 2
	mov r3, sp
	adds r2, r3, r0
	lsls r0, r1, 2
	adds r0, r7, r0
	str r2, [r4]
	str r0, [r4, 0x4]
	str r6, [r4, 0x8]
	ldr r0, [r4, 0x8]
	adds r1, 0x1
	lsls r1, 24
	lsrs r3, r1, 24
	asrs r1, 24
	cmp r1, 0x7
	ble _080410D4
	b _08041112
	.align 2, 0
_080410FC: .4byte 0x040000d4
_08041100: .4byte 0x84000001
_08041104:
	mov r0, sp
	mov r1, r8
	str r0, [r1]
	str r7, [r1, 0x4]
	ldr r2, _08041148
	str r2, [r1, 0x8]
	ldr r0, [r1, 0x8]
_08041112:
	ldr r4, [sp, 0x30]
	mov r7, r10
	mov r3, r9
	lsls r0, r3, 24
	lsrs r2, r0, 24
	ldr r0, [sp, 0x28]
	cmp r2, r0
	bcs _08041124
	b _08040FD0
_08041124:
	ldr r1, [sp, 0x2C]
	adds r4, r1
	ldr r2, [sp, 0x34]
	lsls r0, r2, 24
	lsrs r1, r0, 24
	ldr r3, [sp, 0x24]
	cmp r1, r3
	bcs _08041136
	b _08040FBE
_08041136:
	add sp, 0x3C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041148: .4byte 0x84000008
	thumb_func_end sub_8040F80

	thumb_func_start sub_804114C
sub_804114C: @ 804114C
	push {lr}
	adds r2, r0, 0
	movs r1, 0
	movs r3, 0x1
_08041154:
	adds r0, r2, 0
	ands r0, r3
	cmp r0, 0
	beq _08041160
	adds r0, r1, 0
	b _0804116E
_08041160:
	lsrs r2, 1
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1F
	bls _08041154
	movs r0, 0
_0804116E:
	pop {r1}
	bx r1
	thumb_func_end sub_804114C

	thumb_func_start sub_8041174
sub_8041174: @ 8041174
	push {r4-r7,lr}
	adds r7, r0, 0
	adds r4, r1, 0
	ldr r2, _080411A4
	movs r3, 0
	cmp r3, r4
	bge _080411C0
	movs r6, 0x1
	ldr r0, _080411A8
	adds r5, r0, 0
_08041188:
	adds r0, r7, r3
	ldrb r0, [r0]
	eors r2, r0
	movs r1, 0
	adds r3, 0x1
_08041192:
	adds r0, r2, 0
	ands r0, r6
	cmp r0, 0
	beq _080411AC
	lsrs r0, r2, 1
	eors r0, r5
	lsls r0, 16
	lsrs r2, r0, 16
	b _080411AE
	.align 2, 0
_080411A4: .4byte 0x00001121
_080411A8: .4byte 0x00008408
_080411AC:
	lsrs r2, 1
_080411AE:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x7
	bls _08041192
	lsls r0, r3, 16
	lsrs r3, r0, 16
	cmp r3, r4
	blt _08041188
_080411C0:
	mvns r0, r2
	lsls r0, 16
	lsrs r0, 16
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8041174

	thumb_func_start unref_sub_80411CC
unref_sub_80411CC: @ 80411CC
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r2, _08041208
	movs r3, 0
	cmp r3, r4
	bge _080411FA
	ldr r6, _0804120C
_080411DC:
	lsrs r1, r2, 8
	adds r0, r5, r3
	ldrb r0, [r0]
	eors r2, r0
	lsls r0, r2, 24
	lsrs r0, 23
	adds r0, r6
	ldrh r0, [r0]
	adds r2, r0, 0
	eors r2, r1
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r4
	blt _080411DC
_080411FA:
	mvns r0, r2
	lsls r0, 16
	lsrs r0, 16
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08041208: .4byte 0x00001121
_0804120C: .4byte gCrc16Table
	thumb_func_end unref_sub_80411CC

	thumb_func_start BlendPalette
BlendPalette: @ 8041210
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r1, 16
	lsrs r1, 16
	mov r12, r1
	lsls r2, 24
	lsrs r7, r2, 24
	mov r0, sp
	strh r3, [r0]
	movs r6, 0
	cmp r6, r12
	bcs _08041296
	ldr r0, _080412A8
	mov r10, r0
	ldr r1, _080412AC
	mov r9, r1
_0804123E:
	mov r0, r8
	adds r5, r6, r0
	lsls r5, 16
	lsrs r5, 15
	mov r1, r10
	adds r0, r5, r1
	ldr r3, [r0]
	lsls r4, r3, 27
	lsls r2, r3, 22
	lsls r3, 17
	add r5, r9
	lsrs r4, 27
	ldr r1, [sp]
	lsls r0, r1, 27
	lsrs r0, 27
	subs r0, r4
	muls r0, r7
	asrs r0, 4
	adds r4, r0
	lsrs r2, 27
	lsls r0, r1, 22
	lsrs r0, 27
	subs r0, r2
	muls r0, r7
	asrs r0, 4
	adds r2, r0
	lsls r2, 5
	orrs r4, r2
	lsrs r3, 27
	lsls r1, 17
	lsrs r1, 27
	subs r1, r3
	adds r0, r1, 0
	muls r0, r7
	asrs r0, 4
	adds r3, r0
	lsls r3, 10
	orrs r4, r3
	strh r4, [r5]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, r12
	bcc _0804123E
_08041296:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080412A8: .4byte 0x0202eac8
_080412AC: .4byte 0x0202eec8
	thumb_func_end BlendPalette

	thumb_func_start pokemon_get_nick
pokemon_get_nick: @ 80412B0
	push {r4,lr}
	sub sp, 0x14
	adds r4, r1, 0
	movs r1, 0x2
	mov r2, sp
	bl PokemonGetField
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy10
	add sp, 0x14
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end pokemon_get_nick

	thumb_func_start pokemon_get_nick_
pokemon_get_nick_: @ 80412D0
	push {r4,lr}
	sub sp, 0x14
	adds r4, r1, 0
	movs r1, 0x2
	mov r2, sp
	bl PokemonGetEncryptedField
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy10
	add sp, 0x14
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end pokemon_get_nick_

	thumb_func_start daycare_count_pokemon
daycare_count_pokemon: @ 80412F0
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r5, 0
	movs r4, 0
_080412F8:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	adds r0, r6, r0
	movs r1, 0xB
	bl PokemonGetEncryptedField
	cmp r0, 0
	beq _08041310
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_08041310:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bls _080412F8
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end daycare_count_pokemon

	thumb_func_start sub_8041324
sub_8041324: @ 8041324
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r0
	mov r10, r1
	movs r7, 0
	movs r5, 0
	mov r6, r10
	adds r6, 0x74
	movs r0, 0x1
	mov r8, r0
_0804133E:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 4
	mov r1, r9
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl PokemonGetEncryptedField
	cmp r0, 0
	beq _0804136E
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r4, 0
	movs r1, 0xC
	bl PokemonGetEncryptedField
	adds r1, r0, 0
	cmp r1, 0
	bne _0804136E
	lsls r0, r5, 1
	adds r0, r6, r0
	b _08041374
_0804136E:
	lsls r0, r5, 1
	adds r0, r6, r0
	mov r1, r8
_08041374:
	strh r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bls _0804133E
	mov r0, r10
	str r7, [r0, 0x70]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8041324

	thumb_func_start daycare_empty_slot
daycare_empty_slot: @ 8041394
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r4, 0
_0804139A:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	adds r0, r5, r0
	movs r1, 0xB
	bl PokemonGetEncryptedField
	cmp r0, 0
	bne _080413B2
	lsls r0, r4, 24
	asrs r0, 24
	b _080413C0
_080413B2:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bls _0804139A
	movs r0, 0x1
	negs r0, r0
_080413C0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end daycare_empty_slot

	thumb_func_start sub_80413C8
sub_80413C8: @ 80413C8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	mov r8, r1
	mov r0, r8
	bl daycare_empty_slot
	lsls r0, 24
	lsrs r4, r0, 24
	mov r9, r4
	adds r0, r7, 0
	bl sub_80A2B94
	lsls r0, 24
	cmp r0, 0
	beq _0804144A
	lsls r0, r4, 24
	asrs r0, 24
	lsls r4, r0, 3
	subs r4, r0
	lsls r4, 3
	adds r5, r4, 0
	adds r5, 0xA0
	add r5, r8
	adds r6, r5, 0
	adds r6, 0x24
	ldr r1, _08041490
	adds r0, r6, 0
	bl StringCopy
	adds r0, r6, 0
	movs r1, 0xFC
	bl sub_814A518
	adds r6, 0x8
	adds r0, r7, 0
	adds r1, r6, 0
	bl pokemon_get_nick
	adds r0, r7, 0
	movs r1, 0x40
	bl PokemonGetField
	lsls r0, 24
	lsrs r0, 24
	add r4, r8
	ldr r2, _08041494
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r4, 0xA0
	ldr r0, _08041498
	adds r1, r0
	ldm r1!, {r0,r2,r3}
	stm r4!, {r0,r2,r3}
	ldm r1!, {r0,r2,r3}
	stm r4!, {r0,r2,r3}
	ldm r1!, {r0,r2,r3}
	stm r4!, {r0,r2,r3}
	adds r0, r7, 0
	bl sub_80A2DF8
_0804144A:
	mov r2, r9
	lsls r4, r2, 24
	asrs r4, 24
	lsls r5, r4, 2
	adds r4, r5, r4
	lsls r4, 4
	add r4, r8
	adds r0, r4, 0
	adds r1, r7, 0
	movs r2, 0x50
	bl memcpy
	adds r0, r4, 0
	bl pokemon_restore_pp
	movs r0, 0x88
	lsls r0, 1
	add r0, r8
	adds r0, r5
	movs r1, 0
	str r1, [r0]
	adds r0, r7, 0
	bl zero_pokemon_struct
	bl party_compaction
	bl calc_player_party_count
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041490: .4byte gSaveBlock2
_08041494: .4byte 0x02025734
_08041498: .4byte 0x00002b4c
	thumb_func_end sub_80413C8

	thumb_func_start daycare_send
daycare_send: @ 804149C
	push {lr}
	ldr r0, _080414B4
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080414B8
	adds r0, r1
	ldr r1, _080414BC
	bl sub_80413C8
	pop {r0}
	bx r0
	.align 2, 0
_080414B4: .4byte 0x03005ce0
_080414B8: .4byte 0x03004360
_080414BC: .4byte 0x020286d0
	thumb_func_end daycare_send

	thumb_func_start sub_80414C0
sub_80414C0: @ 80414C0
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r5, 0
	adds r4, 0x50
	adds r0, r4, 0
	movs r1, 0xB
	bl PokemonGetEncryptedField
	cmp r0, 0
	beq _08041516
	adds r0, r5, 0
	movs r1, 0xB
	bl PokemonGetEncryptedField
	adds r6, r0, 0
	cmp r6, 0
	bne _08041516
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x50
	bl memcpy
	adds r0, r4, 0
	bl zero_pokemon_boxed_data
	adds r0, r5, 0
	adds r0, 0xA0
	adds r4, 0x88
	adds r1, r4, 0
	movs r2, 0x38
	bl memcpy
	movs r0, 0x88
	lsls r0, 1
	adds r2, r5, r0
	adds r0, 0x4
	adds r1, r5, r0
	ldr r0, [r1]
	str r0, [r2]
	str r6, [r1]
	adds r0, r4, 0
	bl sub_80417F4
_08041516:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80414C0

	thumb_func_start sub_804151C
sub_804151C: @ 804151C
	push {r4-r7,lr}
	adds r4, r0, 0
	movs r5, 0
	ldr r7, _08041538
_08041524:
	adds r0, r4, 0
	bl sub_8040300
	lsls r0, 24
	cmp r0, 0
	beq _08041560
	movs r6, 0x1
	adds r5, 0x1
	b _0804154C
	.align 2, 0
_08041538: .4byte 0x0000ffff
_0804153C:
	movs r6, 0
	cmp r0, r7
	bne _0804154C
	ldr r0, _0804156C
	ldrh r1, [r0]
	adds r0, r4, 0
	bl sub_803B8D4
_0804154C:
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_803B7C8
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0804153C
	cmp r5, 0x63
	ble _08041524
_08041560:
	adds r0, r4, 0
	bl pokemon_calc_effective_stats
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804156C: .4byte 0x02024e82
	thumb_func_end sub_804151C

	thumb_func_start sub_8041570
sub_8041570: @ 8041570
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x68
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r7, r4, 2
	adds r0, r7, r4
	lsls r0, 4
	adds r6, r5, r0
	ldr r1, _08041640
	adds r0, r6, 0
	bl pokemon_get_nick_
	adds r0, r6, 0
	movs r1, 0xB
	bl PokemonGetEncryptedField
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	adds r0, r6, 0
	mov r1, sp
	bl sub_803B4B4
	mov r0, sp
	movs r1, 0x38
	bl PokemonGetField
	cmp r0, 0x64
	beq _080415D8
	mov r0, sp
	movs r1, 0x19
	bl PokemonGetField
	movs r2, 0x88
	lsls r2, 1
	adds r1, r5, r2
	adds r1, r7
	ldr r1, [r1]
	adds r0, r1
	str r0, [sp, 0x64]
	add r2, sp, 0x64
	mov r0, sp
	movs r1, 0x19
	bl pokemon_setattr
	mov r0, sp
	bl sub_804151C
_080415D8:
	ldr r0, _08041644
	movs r1, 0xFA
	lsls r1, 1
	adds r1, r0
	mov r8, r1
	mov r0, r8
	mov r1, sp
	movs r2, 0x64
	bl memcpy
	lsls r0, r4, 3
	subs r0, r4
	lsls r1, r0, 3
	adds r0, r5, r1
	adds r0, 0xC0
	ldrh r0, [r0]
	cmp r0, 0
	beq _08041610
	adds r4, r1, 0
	adds r4, 0xA0
	adds r4, r5, r4
	mov r0, r8
	adds r1, r4, 0
	bl sub_80A2D88
	adds r0, r4, 0
	bl sub_80417F4
_08041610:
	bl party_compaction
	adds r0, r6, 0
	bl zero_pokemon_boxed_data
	movs r2, 0x88
	lsls r2, 1
	adds r0, r5, r2
	adds r0, r7
	movs r1, 0
	str r1, [r0]
	adds r0, r5, 0
	bl sub_80414C0
	bl calc_player_party_count
	mov r0, r9
	add sp, 0x68
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08041640: .4byte 0x020231cc
_08041644: .4byte 0x03004360
	thumb_func_end sub_8041570

	thumb_func_start sub_8041648
sub_8041648: @ 8041648
	push {lr}
	ldr r0, _0804165C
	ldr r1, _08041660
	ldrb r1, [r1]
	bl sub_8041570
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_0804165C: .4byte 0x020286d0
_08041660: .4byte 0x0202e8cc
	thumb_func_end sub_8041648

	thumb_func_start sub_8041664
sub_8041664: @ 8041664
	push {r4,r5,lr}
	sub sp, 0x54
	adds r4, r0, 0
	adds r5, r1, 0
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0x50
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x19
	bl PokemonGetEncryptedField
	adds r0, r5
	str r0, [sp, 0x50]
	add r2, sp, 0x50
	mov r0, sp
	movs r1, 0x19
	bl PokemonSetEncryptedField
	mov r0, sp
	bl sub_803B570
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x54
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8041664

	thumb_func_start sub_80416A0
sub_80416A0: @ 80416A0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	lsls r0, r4, 2
	mov r8, r0
	add r4, r8
	lsls r4, 4
	adds r4, r5, r4
	adds r0, r4, 0
	bl sub_803B570
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	movs r0, 0x88
	lsls r0, 1
	adds r5, r0
	add r5, r8
	ldr r1, [r5]
	adds r0, r4, 0
	bl sub_8041664
	lsls r0, 24
	lsrs r0, 24
	subs r0, r6
	lsls r0, 24
	lsrs r0, 24
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80416A0

	thumb_func_start sub_80416E8
sub_80416E8: @ 80416E8
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	adds r1, r4, 0
	bl sub_80416A0
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	adds r6, r0
	ldr r1, _08041720
	adds r0, r6, 0
	bl pokemon_get_nick_
	ldr r0, _08041724
	adds r1, r5, 0
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08041720: .4byte 0x020231cc
_08041724: .4byte 0x020232cc
	thumb_func_end sub_80416E8

	thumb_func_start sub_8041728
sub_8041728: @ 8041728
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	adds r1, r4, 0
	bl sub_80416A0
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	adds r6, r0
	ldr r1, _08041768
	adds r0, r6, 0
	bl pokemon_get_nick_
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	adds r4, 0x64
	ldr r0, _0804176C
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	adds r0, r4, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08041768: .4byte 0x020231cc
_0804176C: .4byte 0x020232cc
	thumb_func_end sub_8041728

	thumb_func_start sub_8041770
sub_8041770: @ 8041770
	push {lr}
	ldr r0, _08041784
	ldr r1, _08041788
	ldrb r1, [r1]
	bl sub_8041728
	ldr r1, _0804178C
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08041784: .4byte 0x020286d0
_08041788: .4byte 0x0202e8cc
_0804178C: .4byte 0x0202e8ce
	thumb_func_end sub_8041770

	thumb_func_start sub_8041790
sub_8041790: @ 8041790
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _080417AC
	ldr r1, _080417B0
	adds r3, r2, r1
	ldr r1, [r3]
	adds r1, r0
	str r1, [r3]
	ldr r1, _080417B4
	adds r2, r1
	ldr r1, [r2]
	adds r1, r0
	str r1, [r2]
	bx lr
	.align 2, 0
_080417AC: .4byte 0x02025734
_080417B0: .4byte 0x000030ac
_080417B4: .4byte 0x000030b0
	thumb_func_end sub_8041790

	thumb_func_start sub_80417B8
sub_80417B8: @ 80417B8
	push {r4,r5,lr}
	ldr r5, _080417D8
	ldrh r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	ldr r4, _080417DC
	adds r0, r4
	movs r1, 0xB
	bl PokemonGetEncryptedField
	cmp r0, 0
	bne _080417E0
	movs r0, 0
	b _080417EC
	.align 2, 0
_080417D8: .4byte 0x0202e8cc
_080417DC: .4byte 0x020286d0
_080417E0:
	ldrb r1, [r5]
	adds r0, r4, 0
	bl sub_80416E8
	lsls r0, 24
	lsrs r0, 24
_080417EC:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80417B8

	thumb_func_start sub_80417F4
sub_80417F4: @ 80417F4
	push {lr}
	movs r3, 0
	movs r2, 0x7
	adds r1, r0, 0
	adds r1, 0x2B
_080417FE:
	strb r3, [r1]
	subs r1, 0x1
	subs r2, 0x1
	cmp r2, 0
	bge _080417FE
	adds r2, r0, 0
	adds r2, 0x2C
	movs r3, 0
	adds r1, r0, 0
	adds r1, 0x36
_08041812:
	strb r3, [r1]
	subs r1, 0x1
	cmp r1, r2
	bge _08041812
	bl sub_80A2B40
	pop {r0}
	bx r0
	thumb_func_end sub_80417F4

	thumb_func_start unref_sub_8041824
unref_sub_8041824: @ 8041824
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r5, 0
_0804182A:
	lsls r4, r5, 2
	adds r0, r4, r5
	lsls r0, 4
	adds r0, r6, r0
	bl zero_pokemon_boxed_data
	movs r1, 0x88
	lsls r1, 1
	adds r0, r6, r1
	adds r0, r4
	movs r4, 0
	str r4, [r0]
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 3
	adds r0, 0xA0
	adds r0, r6, r0
	bl sub_80417F4
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bls _0804182A
	movs r2, 0x8C
	lsls r2, 1
	adds r0, r6, r2
	movs r1, 0
	strh r4, [r0]
	adds r2, 0x2
	adds r0, r6, r2
	strb r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_8041824

	thumb_func_start sub_8041870
sub_8041870: @ 8041870
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r2, r0, 16
	movs r0, 0
	mov r8, r0
	ldr r0, _0804189C
	mov r12, r0
_08041882:
	movs r7, 0
	movs r6, 0x1
	movs r4, 0x80
	lsls r4, 9
	movs r5, 0x28
	mov r3, r12
	adds r3, 0x28
_08041890:
	movs r1, 0
	ldrh r0, [r3, 0x4]
	cmp r0, r2
	bne _080418A0
	lsrs r2, r4, 16
	b _080418CC
	.align 2, 0
_0804189C: .4byte gEvolutionTable
_080418A0:
	adds r1, 0x1
	cmp r1, 0x4
	bgt _080418B6
	lsls r0, r1, 3
	adds r0, r5
	add r0, r12
	ldrh r0, [r0, 0x4]
	cmp r0, r2
	bne _080418A0
	lsrs r2, r4, 16
	movs r7, 0x1
_080418B6:
	cmp r7, 0
	bne _080418CC
	movs r0, 0x80
	lsls r0, 9
	adds r4, r0
	adds r5, 0x28
	adds r3, 0x28
	adds r6, 0x1
	ldr r0, _080418EC
	cmp r6, r0
	ble _08041890
_080418CC:
	movs r0, 0xCE
	lsls r0, 1
	cmp r6, r0
	beq _080418DE
	movs r0, 0x1
	add r8, r0
	mov r0, r8
	cmp r0, 0x4
	ble _08041882
_080418DE:
	adds r0, r2, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080418EC: .4byte 0x0000019b
	thumb_func_end sub_8041870

	thumb_func_start sub_80418F0
sub_80418F0: @ 80418F0
	push {r4,lr}
	adds r4, r0, 0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08041918
	bl __umodsi3
	adds r0, 0x1
	movs r1, 0x8C
	lsls r1, 1
	adds r4, r1
	strh r0, [r4]
	movs r0, 0x86
	bl FlagSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08041918: .4byte 0x0000fffe
	thumb_func_end sub_80418F0

	thumb_func_start sub_804191C
sub_804191C: @ 804191C
	push {r4,lr}
	adds r4, r0, 0
	bl Random
	movs r2, 0x80
	lsls r2, 8
	adds r1, r2, 0
	movs r2, 0x8C
	lsls r2, 1
	adds r4, r2
	orrs r1, r0
	strh r1, [r4]
	movs r0, 0x86
	bl FlagSet
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_804191C

	thumb_func_start sub_8041940
sub_8041940: @ 8041940
	push {lr}
	ldr r0, _0804194C
	bl sub_80418F0
	pop {r0}
	bx r0
	.align 2, 0
_0804194C: .4byte 0x020286d0
	thumb_func_end sub_8041940

	thumb_func_start sub_8041950
sub_8041950: @ 8041950
	push {lr}
	ldr r0, _0804195C
	bl sub_804191C
	pop {r0}
	bx r0
	.align 2, 0
_0804195C: .4byte 0x020286d0
	thumb_func_end sub_8041950

	thumb_func_start sub_8041960
sub_8041960: @ 8041960
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r1, r4, r1
	movs r0, 0xFF
	strb r0, [r1]
	movs r2, 0
_08041972:
	mov r1, sp
	adds r0, r1, r2
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x5
	ble _08041972
	movs r3, 0
	movs r2, 0
_08041986:
	mov r1, sp
	adds r0, r1, r2
	ldrb r1, [r0]
	adds r0, r1, 0
	cmp r0, 0xFF
	beq _08041998
	adds r0, r4, r3
	strb r1, [r0]
	adds r3, 0x1
_08041998:
	adds r2, 0x1
	cmp r2, 0x5
	ble _08041986
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8041960

	thumb_func_start sub_80419A8
sub_80419A8: @ 80419A8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	mov r9, r0
	mov r8, r1
	movs r5, 0
	add r1, sp, 0x4
	add r7, sp, 0xC
	adds r2, r1, 0
_080419BE:
	adds r0, r2, r5
	strb r5, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _080419BE
	movs r5, 0
	adds r6, r1, 0
_080419D0:
	bl Random
	mov r1, sp
	adds r4, r1, r5
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x6
	subs r1, r5
	bl __modsi3
	adds r0, r6, r0
	ldrb r0, [r0]
	strb r0, [r4]
	ldrb r1, [r4]
	adds r0, r6, 0
	bl sub_8041960
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _080419D0
	movs r5, 0
	movs r4, 0x1
_08041A00:
	bl Random
	adds r1, r7, r5
	lsls r0, 16
	lsrs r0, 16
	ands r0, r4
	strb r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _08041A00
	movs r5, 0
_08041A1A:
	mov r1, sp
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, 0x5
	bhi _08041B02
	lsls r0, 2
	ldr r1, _08041A30
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08041A30: .4byte _08041A34
	.align 2, 0
_08041A34:
	.4byte _08041A4C
	.4byte _08041A6C
	.4byte _08041A88
	.4byte _08041AA4
	.4byte _08041AC0
	.4byte _08041AE2
_08041A4C:
	adds r0, r7, r5
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	add r0, r8
	movs r1, 0x27
	bl PokemonGetEncryptedField
	add r2, sp, 0x10
	strb r0, [r2]
	mov r0, r9
	movs r1, 0x27
	bl pokemon_setattr
	b _08041B02
_08041A6C:
	add r4, sp, 0x10
	adds r0, r7, r5
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	add r0, r8
	movs r1, 0x28
	bl PokemonGetEncryptedField
	strb r0, [r4]
	mov r0, r9
	movs r1, 0x28
	b _08041ADA
_08041A88:
	add r4, sp, 0x10
	adds r0, r7, r5
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	add r0, r8
	movs r1, 0x29
	bl PokemonGetEncryptedField
	strb r0, [r4]
	mov r0, r9
	movs r1, 0x29
	b _08041ADA
_08041AA4:
	add r4, sp, 0x10
	adds r0, r7, r5
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	add r0, r8
	movs r1, 0x2A
	bl PokemonGetEncryptedField
	strb r0, [r4]
	mov r0, r9
	movs r1, 0x2A
	b _08041ADA
_08041AC0:
	add r4, sp, 0x10
	adds r0, r7, r5
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	add r0, r8
	movs r1, 0x2B
	bl PokemonGetEncryptedField
	strb r0, [r4]
	mov r0, r9
	movs r1, 0x2B
_08041ADA:
	adds r2, r4, 0
	bl pokemon_setattr
	b _08041B02
_08041AE2:
	add r4, sp, 0x10
	adds r0, r7, r5
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	add r0, r8
	movs r1, 0x2C
	bl PokemonGetEncryptedField
	strb r0, [r4]
	mov r0, r9
	movs r1, 0x2C
	adds r2, r4, 0
	bl pokemon_setattr
_08041B02:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _08041A1A
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80419A8

	thumb_func_start pokemon_get_eggmoves
pokemon_get_eggmoves: @ 8041B1C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	movs r6, 0
	movs r4, 0
	movs r1, 0xB
	bl PokemonGetField
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	ldr r5, _08041B44
	ldrh r1, [r5]
	ldr r7, _08041B48
	adds r0, r3, r7
	cmp r1, r0
	bne _08041B4C
	movs r4, 0x1
	b _08041B6E
	.align 2, 0
_08041B44: .4byte gEggMoves
_08041B48: .4byte 0x00004e20
_08041B4C:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _08041BB8
	ldr r5, _08041BBC
	cmp r2, r0
	bhi _08041B6E
	lsls r0, r2, 1
	adds r0, r5
	ldrh r1, [r0]
	ldr r7, _08041BC0
	adds r0, r3, r7
	cmp r1, r0
	bne _08041B4C
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_08041B6E:
	movs r2, 0
	lsls r0, r4, 1
	adds r0, r5
	ldrh r0, [r0]
	ldr r1, _08041BC0
	cmp r0, r1
	bhi _08041BAA
	adds r7, r5, 0
	adds r3, r1, 0
_08041B80:
	lsls r1, r2, 1
	add r1, r8
	adds r0, r4, r2
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x9
	bhi _08041BAA
	adds r0, r4, r2
	lsls r0, 1
	adds r0, r5
	ldrh r0, [r0]
	cmp r0, r3
	bls _08041B80
_08041BAA:
	lsls r0, r6, 24
	lsrs r0, 24
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08041BB8: .4byte 0x00000471
_08041BBC: .4byte gEggMoves
_08041BC0: .4byte 0x00004e20
	thumb_func_end pokemon_get_eggmoves

	thumb_func_start daycare_build_child_moveset
daycare_build_child_moveset: @ 8041BC4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	adds r7, r0, 0
	mov r10, r1
	mov r9, r2
	movs r0, 0
	str r0, [sp]
	movs r6, 0
	ldr r5, _08041CC8
	movs r2, 0
	ldr r4, _08041CCC
	ldr r3, _08041CD0
_08041BE4:
	lsls r1, r6, 1
	adds r0, r1, r5
	strh r2, [r0]
	adds r0, r1, r4
	strh r2, [r0]
	adds r1, r3
	strh r2, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bls _08041BE4
	movs r6, 0
	ldr r2, _08041CD4
	movs r1, 0
_08041C02:
	lsls r0, r6, 1
	adds r0, r2
	strh r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x9
	bls _08041C02
	movs r6, 0
	ldr r2, _08041CD8
	movs r1, 0
_08041C18:
	lsls r0, r6, 1
	adds r0, r2
	strh r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x31
	bls _08041C18
	adds r0, r7, 0
	movs r1, 0xB
	bl PokemonGetField
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08041CD8
	bl sub_804051C
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r6, 0
	ldr r1, _08041CCC
	mov r8, r1
_08041C46:
	adds r5, r6, 0
	adds r5, 0xD
	mov r0, r10
	adds r1, r5, 0
	bl PokemonGetEncryptedField
	lsls r4, r6, 1
	mov r2, r8
	adds r1, r4, r2
	strh r0, [r1]
	mov r0, r9
	adds r1, r5, 0
	bl PokemonGetEncryptedField
	ldr r1, _08041CC8
	adds r4, r1
	strh r0, [r4]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bls _08041C46
	ldr r1, _08041CD4
	adds r0, r7, 0
	bl pokemon_get_eggmoves
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r6, 0
_08041C82:
	ldr r0, _08041CCC
	lsls r1, r6, 1
	adds r2, r1, r0
	ldrh r1, [r2]
	mov r9, r0
	cmp r1, 0
	beq _08041CF8
	movs r5, 0
	cmp r5, r8
	bcs _08041CEA
	adds r4, r2, 0
	ldr r2, _08041CDC
_08041C9A:
	ldr r0, _08041CD4
	lsls r1, r5, 1
	adds r1, r0
	ldrh r0, [r4]
	ldrh r1, [r1]
	cmp r0, r1
	bne _08041CE0
	adds r1, r0, 0
	adds r0, r7, 0
	str r2, [sp, 0x8]
	bl pokemon_moveset_pad_
	lsls r0, 16
	lsrs r0, 16
	ldr r2, [sp, 0x8]
	cmp r0, r2
	bne _08041CEA
	ldrh r1, [r4]
	adds r0, r7, 0
	bl sub_803B8D4
	b _08041CEA
	.align 2, 0
_08041CC8: .4byte 0x03000500
_08041CCC: .4byte 0x030004d8
_08041CD0: .4byte 0x030004e0
_08041CD4: .4byte 0x030004e8
_08041CD8: .4byte 0x03000470
_08041CDC: .4byte 0x0000ffff
_08041CE0:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r8
	bcc _08041C9A
_08041CEA:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r3, _08041E14
	mov r9, r3
	cmp r6, 0x3
	bls _08041C82
_08041CF8:
	movs r6, 0
_08041CFA:
	lsls r0, r6, 1
	mov r2, r9
	adds r1, r0, r2
	ldrh r1, [r1]
	adds r2, r0, 0
	adds r6, 0x1
	mov r8, r6
	cmp r1, 0
	beq _08041D5C
	movs r5, 0
	ldr r0, _08041E14
	adds r4, r2, r0
	ldr r6, _08041E18
	mov r9, r0
_08041D16:
	ldr r3, _08041E1C
	adds r0, r5, r3
	lsls r0, 16
	lsrs r0, 16
	bl ItemIdToBattleMoveId
	ldrh r1, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r1, r0
	bne _08041D52
	lsls r1, r5, 24
	lsrs r1, 24
	adds r0, r7, 0
	bl sub_8040374
	cmp r0, 0
	beq _08041D52
	ldrh r1, [r4]
	adds r0, r7, 0
	bl pokemon_moveset_pad_
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r6
	bne _08041D52
	ldrh r1, [r4]
	adds r0, r7, 0
	bl sub_803B8D4
_08041D52:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x39
	bls _08041D16
_08041D5C:
	mov r1, r8
	lsls r0, r1, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bls _08041CFA
	movs r6, 0
	mov r2, r9
	ldrh r0, [r2]
	ldr r3, _08041E20
	mov r10, r3
	cmp r0, 0
	beq _08041DC6
	mov r4, r9
	ldr r0, _08041E24
	mov r9, r0
	mov r12, r10
_08041D7C:
	movs r5, 0
	lsls r2, r6, 1
	adds r6, 0x1
	mov r8, r6
	adds r3, r2, r4
_08041D86:
	lsls r0, r5, 1
	add r0, r9
	ldrh r2, [r3]
	adds r1, r2, 0
	ldrh r0, [r0]
	cmp r1, r0
	bne _08041DA8
	cmp r1, 0
	beq _08041DA8
	ldr r1, [sp]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp]
	lsls r1, 1
	add r1, r12
	strh r2, [r1]
_08041DA8:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _08041D86
	mov r1, r8
	lsls r0, r1, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bhi _08041DC6
	lsls r0, r6, 1
	adds r0, r4
	ldrh r0, [r0]
	cmp r0, 0
	bne _08041D7C
_08041DC6:
	movs r6, 0
	mov r2, r10
	ldrh r0, [r2]
	cmp r0, 0
	beq _08041E50
_08041DD0:
	movs r5, 0
	adds r3, r6, 0x1
	mov r8, r3
	ldr r0, [sp, 0x4]
	cmp r5, r0
	bcs _08041E38
	ldr r2, _08041E18
_08041DDE:
	ldr r1, _08041E28
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	cmp r1, 0
	beq _08041E2C
	lsls r0, r6, 1
	mov r3, r10
	adds r4, r0, r3
	ldrh r0, [r4]
	cmp r0, r1
	bne _08041E2C
	adds r1, r0, 0
	adds r0, r7, 0
	str r2, [sp, 0x8]
	bl pokemon_moveset_pad_
	lsls r0, 16
	lsrs r0, 16
	ldr r2, [sp, 0x8]
	cmp r0, r2
	bne _08041E38
	ldrh r1, [r4]
	adds r0, r7, 0
	bl sub_803B8D4
	b _08041E38
	.align 2, 0
_08041E14: .4byte 0x030004d8
_08041E18: .4byte 0x0000ffff
_08041E1C: .4byte 0x00000121
_08041E20: .4byte 0x030004e0
_08041E24: .4byte 0x03000500
_08041E28: .4byte 0x03000470
_08041E2C:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, [sp, 0x4]
	cmp r5, r0
	bcc _08041DDE
_08041E38:
	mov r1, r8
	lsls r0, r1, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bhi _08041E50
	ldr r0, _08041E60
	lsls r1, r6, 1
	adds r1, r0
	ldrh r1, [r1]
	mov r10, r0
	cmp r1, 0
	bne _08041DD0
_08041E50:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041E60: .4byte 0x030004e0
	thumb_func_end daycare_build_child_moveset

	thumb_func_start sub_8041E64
sub_8041E64: @ 8041E64
	adds r3, r0, 0
	movs r1, 0x8C
	lsls r1, 1
	adds r0, r3, r1
	movs r2, 0
	movs r1, 0
	strh r1, [r0]
	movs r1, 0x8D
	lsls r1, 1
	adds r0, r3, r1
	strb r2, [r0]
	bx lr
	thumb_func_end sub_8041E64

	thumb_func_start sub_8041E7C
sub_8041E7C: @ 8041E7C
	push {lr}
	ldr r0, _08041E88
	bl sub_8041E64
	pop {r0}
	bx r0
	.align 2, 0
_08041E88: .4byte 0x020286d0
	thumb_func_end sub_8041E7C

	thumb_func_start incense_effects
incense_effects: @ 8041E8C
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrh r1, [r4]
	movs r7, 0xB4
	lsls r7, 1
	cmp r1, r7
	beq _08041EA4
	movs r0, 0xAF
	lsls r0, 1
	cmp r1, r0
	bne _08041EE6
_08041EA4:
	adds r0, r5, 0
	movs r1, 0xC
	bl PokemonGetEncryptedField
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r5, 0
	adds r0, 0x50
	movs r1, 0xC
	bl PokemonGetEncryptedField
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r4]
	cmp r0, r7
	bne _08041ED0
	cmp r6, 0xDD
	beq _08041ED0
	cmp r2, 0xDD
	beq _08041ED0
	movs r0, 0xCA
	strh r0, [r4]
_08041ED0:
	ldrh r1, [r4]
	movs r0, 0xAF
	lsls r0, 1
	cmp r1, r0
	bne _08041EE6
	cmp r6, 0xDC
	beq _08041EE6
	cmp r2, 0xDC
	beq _08041EE6
	movs r0, 0xB7
	strh r0, [r4]
_08041EE6:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end incense_effects

	thumb_func_start sub_8041EEC
sub_8041EEC: @ 8041EEC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	mov r8, r0
	adds r6, r1, 0
	movs r4, 0
	movs r7, 0x1
_08041EFC:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	mov r1, r8
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0xB
	bl PokemonGetEncryptedField
	lsls r1, r4, 1
	add r1, sp
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x84
	bne _08041F26
	adds r0, r4, 0
	eors r0, r7
	strb r0, [r6]
	strb r4, [r6, 0x1]
	b _08041F3C
_08041F26:
	adds r0, r5, 0
	bl pokemon_roll_gender
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFE
	bne _08041F3C
	strb r4, [r6]
	adds r0, r4, 0
	eors r0, r7
	strb r0, [r6, 0x1]
_08041F3C:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _08041EFC
	ldrb r0, [r6]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	bl sub_8041870
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1D
	bne _08041F6E
	movs r0, 0x8C
	lsls r0, 1
	add r0, r8
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _08041F6E
	movs r4, 0x20
_08041F6E:
	ldr r0, _08041FC0
	cmp r4, r0
	bne _08041F88
	subs r0, 0x6B
	add r0, r8
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _08041F88
	movs r4, 0xC1
	lsls r4, 1
_08041F88:
	ldrb r0, [r6, 0x1]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	cmp r0, 0x84
	bne _08041FB2
	ldrb r1, [r6]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	add r0, r8
	bl pokemon_roll_gender
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFE
	beq _08041FB2
	ldrb r1, [r6, 0x1]
	ldrb r0, [r6]
	strb r0, [r6, 0x1]
	strb r1, [r6]
_08041FB2:
	adds r0, r4, 0
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08041FC0: .4byte 0x00000183
	thumb_func_end sub_8041EEC

	thumb_func_start sub_8041FC4
sub_8041FC4: @ 8041FC4
	push {r4-r6,lr}
	sub sp, 0x6C
	adds r5, r0, 0
	add r6, sp, 0x64
	adds r1, r6, 0
	bl sub_8041EEC
	add r4, sp, 0x68
	strh r0, [r4]
	adds r0, r4, 0
	adds r1, r5, 0
	bl incense_effects
	ldrh r1, [r4]
	mov r0, sp
	adds r2, r5, 0
	bl sub_80420FC
	mov r0, sp
	adds r1, r5, 0
	bl sub_80419A8
	ldrb r0, [r6, 0x1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 4
	adds r1, r5, r1
	ldrb r0, [r6]
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 4
	adds r2, r5, r2
	mov r0, sp
	bl daycare_build_child_moveset
	mov r2, sp
	adds r2, 0x6A
	movs r0, 0x1
	strb r0, [r2]
	mov r0, sp
	movs r1, 0x2D
	bl pokemon_setattr
	ldr r0, _08042040
	movs r1, 0xFA
	lsls r1, 1
	adds r0, r1
	mov r1, sp
	movs r2, 0x64
	bl memcpy
	bl party_compaction
	bl calc_player_party_count
	adds r0, r5, 0
	bl sub_8041E64
	add sp, 0x6C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08042040: .4byte 0x03004360
	thumb_func_end sub_8041FC4

	thumb_func_start sub_8042044
sub_8042044: @ 8042044
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x18
	adds r7, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 24
	lsrs r6, 24
	movs r4, 0
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	adds r1, r5, 0
	movs r2, 0x5
	movs r3, 0x20
	bl create_pokemon_set_level
	movs r0, 0x12
	add r0, sp
	mov r8, r0
	strb r4, [r0]
	movs r1, 0x4
	add r0, sp, 0x10
	strh r1, [r0]
	mov r4, sp
	adds r4, 0x13
	movs r0, 0x1
	mov r9, r0
	mov r0, r9
	strb r0, [r4]
	adds r0, r7, 0
	movs r1, 0x26
	add r2, sp, 0x10
	bl pokemon_setattr
	ldr r2, _080420F4
	adds r0, r7, 0
	movs r1, 0x2
	bl pokemon_setattr
	lsls r2, r5, 3
	subs r2, r5
	lsls r2, 2
	ldr r0, _080420F8
	adds r2, r0
	adds r0, r7, 0
	movs r1, 0x20
	bl pokemon_setattr
	adds r0, r7, 0
	movs r1, 0x24
	mov r2, r8
	bl pokemon_setattr
	adds r0, r7, 0
	movs r1, 0x3
	adds r2, r4, 0
	bl pokemon_setattr
	cmp r6, 0
	beq _080420D6
	add r2, sp, 0x14
	movs r0, 0xFD
	strb r0, [r2]
	adds r0, r7, 0
	movs r1, 0x23
	bl pokemon_setattr
_080420D6:
	mov r2, sp
	adds r2, 0x15
	mov r0, r9
	strb r0, [r2]
	adds r0, r7, 0
	movs r1, 0x2D
	bl pokemon_setattr
	add sp, 0x18
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080420F4: .4byte gUnknown_08209AD4
_080420F8: .4byte gBaseStats + 0x11 @ egg cycles offset
	thumb_func_end sub_8042044

	thumb_func_start sub_80420FC
sub_80420FC: @ 80420FC
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x14
	adds r6, r0, 0
	adds r5, r1, 0
	adds r4, r2, 0
	lsls r5, 16
	lsrs r5, 16
	bl Random
	movs r1, 0x8C
	lsls r1, 1
	adds r4, r1
	ldrh r1, [r4]
	lsls r0, 16
	orrs r1, r0
	movs r0, 0x1
	mov r8, r0
	str r0, [sp]
	str r1, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	adds r0, r6, 0
	adds r1, r5, 0
	movs r2, 0x5
	movs r3, 0x20
	bl create_pokemon_set_level
	movs r1, 0x12
	add r1, sp
	mov r9, r1
	strb r4, [r1]
	movs r1, 0x4
	add r0, sp, 0x10
	strh r1, [r0]
	mov r4, sp
	adds r4, 0x13
	mov r0, r8
	strb r0, [r4]
	adds r0, r6, 0
	movs r1, 0x26
	add r2, sp, 0x10
	bl pokemon_setattr
	ldr r2, _08042198
	adds r0, r6, 0
	movs r1, 0x2
	bl pokemon_setattr
	lsls r2, r5, 3
	subs r2, r5
	lsls r2, 2
	ldr r0, _0804219C
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x20
	bl pokemon_setattr
	adds r0, r6, 0
	movs r1, 0x24
	mov r2, r9
	bl pokemon_setattr
	adds r0, r6, 0
	movs r1, 0x3
	adds r2, r4, 0
	bl pokemon_setattr
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08042198: .4byte gUnknown_08209AD4
_0804219C: .4byte gBaseStats + 0x11 @ egg cycles offset
	thumb_func_end sub_80420FC

	thumb_func_start sp0B8_daycare
sp0B8_daycare: @ 80421A0
	push {lr}
	ldr r0, _080421AC
	bl sub_8041FC4
	pop {r0}
	bx r0
	.align 2, 0
_080421AC: .4byte 0x020286d0
	thumb_func_end sp0B8_daycare

	thumb_func_start sub_80421B0
sub_80421B0: @ 80421B0
	push {r4-r7,lr}
	sub sp, 0x8
	adds r7, r0, 0
	movs r2, 0
	movs r6, 0
	adds r5, r7, 0
_080421BC:
	lsls r4, r6, 2
	adds r0, r5, 0
	movs r1, 0x5
	str r2, [sp, 0x4]
	bl PokemonGetEncryptedField
	ldr r2, [sp, 0x4]
	cmp r0, 0
	beq _080421DE
	movs r0, 0x88
	lsls r0, 1
	adds r1, r7, r0
	adds r1, r4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	adds r2, 0x1
_080421DE:
	adds r5, 0x50
	adds r6, 0x1
	cmp r6, 0x1
	bls _080421BC
	movs r1, 0x8C
	lsls r1, 1
	adds r0, r7, r1
	ldrh r0, [r0]
	cmp r0, 0
	bne _08042226
	cmp r2, 0x2
	bne _08042226
	subs r1, 0x4
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08042226
	adds r0, r7, 0
	bl daycare_relationship_score
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	muls r0, r1
	ldr r1, _08042240
	bl __udivsi3
	cmp r4, r0
	bls _08042226
	bl sub_8041940
_08042226:
	movs r0, 0x8D
	lsls r0, 1
	adds r1, r7, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _08042290
	movs r6, 0
	b _08042288
	.align 2, 0
_08042240: .4byte 0x0000ffff
_08042244:
	movs r0, 0x64
	adds r1, r6, 0
	muls r1, r0
	ldr r0, _08042270
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x2D
	bl PokemonGetField
	cmp r0, 0
	beq _08042286
	adds r0, r4, 0
	movs r1, 0x20
	bl PokemonGetField
	str r0, [sp]
	cmp r0, 0
	bne _08042278
	ldr r0, _08042274
	strh r6, [r0]
	movs r0, 0x1
	b _08042292
	.align 2, 0
_08042270: .4byte 0x03004360
_08042274: .4byte 0x0202e8cc
_08042278:
	subs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x20
	mov r2, sp
	bl pokemon_setattr
_08042286:
	adds r6, 0x1
_08042288:
	ldr r0, _0804229C
	ldrb r0, [r0]
	cmp r6, r0
	bcc _08042244
_08042290:
	movs r0, 0
_08042292:
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804229C: .4byte 0x03004350
	thumb_func_end sub_80421B0

	thumb_func_start sub_80422A0
sub_80422A0: @ 80422A0
	push {lr}
	ldr r0, _080422B0
	bl sub_80421B0
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080422B0: .4byte 0x020286d0
	thumb_func_end sub_80422A0

	thumb_func_start sub_80422B4
sub_80422B4: @ 80422B4
	movs r1, 0x8C
	lsls r1, 1
	adds r0, r1
	ldrh r1, [r0]
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	bx lr
	thumb_func_end sub_80422B4

	thumb_func_start sub_80422C4
sub_80422C4: @ 80422C4
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0xB
	bl PokemonGetEncryptedField
	cmp r0, 0
	beq _080422FC
	ldr r1, _0804231C
	adds r0, r6, 0
	bl pokemon_get_nick_
	adds r0, r6, 0
	movs r1, 0x3
	bl PokemonGetEncryptedField
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _08042320
	adds r0, r6, 0
	movs r1, 0x7
	adds r2, r5, 0
	bl PokemonGetEncryptedField
	adds r0, r5, 0
	adds r1, r4, 0
	bl ConvertInternationalString
_080422FC:
	adds r4, r6, 0
	adds r4, 0x50
	adds r0, r4, 0
	movs r1, 0xB
	bl PokemonGetEncryptedField
	cmp r0, 0
	beq _08042314
	ldr r1, _08042324
	adds r0, r4, 0
	bl pokemon_get_nick_
_08042314:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804231C: .4byte 0x020231cc
_08042320: .4byte 0x020233cc
_08042324: .4byte 0x020232cc
	thumb_func_end sub_80422C4

	thumb_func_start sub_8042328
sub_8042328: @ 8042328
	push {r4-r6,lr}
	ldr r6, _08042354
	ldrb r0, [r6]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _08042358
	adds r0, r4
	ldr r1, _0804235C
	bl pokemon_get_nick_
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	movs r1, 0xB
	bl PokemonGetEncryptedField
	lsls r0, 16
	lsrs r0, 16
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08042354: .4byte 0x03005ce0
_08042358: .4byte 0x03004360
_0804235C: .4byte 0x020231cc
	thumb_func_end sub_8042328

	thumb_func_start sp0B5_daycare
sp0B5_daycare: @ 8042360
	push {lr}
	ldr r0, _0804236C
	bl sub_80422C4
	pop {r0}
	bx r0
	.align 2, 0
_0804236C: .4byte 0x020286d0
	thumb_func_end sp0B5_daycare

	thumb_func_start sp0B6_daycare
sp0B6_daycare: @ 8042370
	push {r4,lr}
	ldr r4, _08042384
	adds r0, r4, 0
	bl sub_80422B4
	lsls r0, 24
	cmp r0, 0
	beq _08042388
	movs r0, 0x1
	b _080423A0
	.align 2, 0
_08042384: .4byte 0x020286d0
_08042388:
	adds r0, r4, 0
	bl daycare_count_pokemon
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0804239A
	movs r0, 0
	b _080423A0
_0804239A:
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
_080423A0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sp0B6_daycare

	thumb_func_start sub_80423A8
sub_80423A8: @ 80423A8
	push {r4-r6,lr}
	adds r5, r1, 0
	movs r4, 0
	adds r1, r0, 0
_080423B0:
	movs r3, 0
	ldrh r0, [r1]
	adds r2, r5, 0
_080423B6:
	ldrh r6, [r2]
	cmp r0, r6
	bne _080423C0
	movs r0, 0x1
	b _080423D2
_080423C0:
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x1
	ble _080423B6
	adds r1, 0x2
	adds r4, 0x1
	cmp r4, 0x1
	ble _080423B0
	movs r0, 0
_080423D2:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80423A8

	thumb_func_start daycare_relationship_score
daycare_relationship_score: @ 80423D8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	movs r1, 0
	mov r8, r1
	mov r2, sp
	adds r2, 0x8
	str r2, [sp, 0x1C]
	add r1, sp, 0xC
	mov r10, r1
	adds r2, 0xC
	str r2, [sp, 0x20]
	mov r1, sp
	adds r1, 0x2
	ldr r2, _08042488
	mov r9, r2
	ldr r5, [sp, 0x1C]
	adds r7, r1, 0
	mov r6, sp
	ldr r1, [sp, 0x20]
	str r1, [sp, 0x24]
	mov r2, r10
	str r2, [sp, 0x28]
	adds r4, r0, 0
_0804240E:
	adds r0, r4, 0
	movs r1, 0xB
	bl PokemonGetEncryptedField
	strh r0, [r5]
	adds r0, r4, 0
	movs r1, 0x1
	bl PokemonGetEncryptedField
	ldr r1, [sp, 0x28]
	stm r1!, {r0}
	str r1, [sp, 0x28]
	adds r0, r4, 0
	movs r1, 0
	bl PokemonGetEncryptedField
	adds r1, r0, 0
	ldrh r0, [r5]
	bl pokemon_species_get_gender_info
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [sp, 0x24]
	stm r2!, {r0}
	str r2, [sp, 0x24]
	ldrh r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r0, [r0, 0x14]
	strh r0, [r6]
	ldrh r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r0, [r0, 0x15]
	strh r0, [r7]
	adds r5, 0x2
	adds r7, 0x4
	adds r6, 0x4
	adds r4, 0x50
	movs r0, 0x1
	add r8, r0
	mov r1, r8
	cmp r1, 0x1
	bls _0804240E
	mov r0, sp
	ldrh r1, [r0]
	cmp r1, 0xF
	beq _08042484
	ldrh r0, [r0, 0x4]
	cmp r0, 0xF
	beq _08042484
	cmp r1, 0xD
	bne _0804248C
	cmp r0, 0xD
	bne _08042490
_08042484:
	movs r0, 0
	b _080424E4
	.align 2, 0
_08042488: .4byte gBaseStats
_0804248C:
	cmp r0, 0xD
	bne _0804249C
_08042490:
	ldr r1, [sp, 0xC]
	mov r2, r10
	ldr r0, [r2, 0x4]
	cmp r1, r0
	beq _080424DE
	b _080424E2
_0804249C:
	ldr r0, [sp, 0x14]
	ldr r2, [sp, 0x20]
	ldr r1, [r2, 0x4]
	cmp r0, r1
	beq _08042484
	cmp r0, 0xFF
	beq _08042484
	cmp r1, 0xFF
	beq _08042484
	add r1, sp, 0x4
	mov r0, sp
	bl sub_80423A8
	lsls r0, 24
	cmp r0, 0
	beq _08042484
	ldr r0, [sp, 0x1C]
	ldrh r1, [r0, 0x2]
	ldrh r0, [r0]
	cmp r0, r1
	bne _080424D4
	ldr r1, [sp, 0xC]
	mov r2, r10
	ldr r0, [r2, 0x4]
	cmp r1, r0
	beq _080424E2
	movs r0, 0x46
	b _080424E4
_080424D4:
	ldr r1, [sp, 0xC]
	mov r2, r10
	ldr r0, [r2, 0x4]
	cmp r1, r0
	bne _080424E2
_080424DE:
	movs r0, 0x14
	b _080424E4
_080424E2:
	movs r0, 0x32
_080424E4:
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end daycare_relationship_score

	thumb_func_start daycare_relationship_score_from_savegame
daycare_relationship_score_from_savegame: @ 80424F4
	push {lr}
	ldr r0, _08042504
	bl daycare_relationship_score
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08042504: .4byte 0x020286d0
	thumb_func_end daycare_relationship_score_from_savegame

	thumb_func_start sp0B9_daycare_relationship_comment
sp0B9_daycare_relationship_comment: @ 8042508
	push {lr}
	bl daycare_relationship_score_from_savegame
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	movs r1, 0
	cmp r0, 0
	bne _0804251C
	movs r1, 0x3
_0804251C:
	cmp r0, 0x14
	bne _08042522
	movs r1, 0x2
_08042522:
	cmp r0, 0x32
	bne _08042528
	movs r1, 0x1
_08042528:
	cmp r2, 0x46
	bne _0804252E
	movs r1, 0
_0804252E:
	ldr r0, _08042540
	ldr r2, _08042544
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	pop {r0}
	bx r0
	.align 2, 0
_08042540: .4byte 0x020234cc
_08042544: .4byte gUnknown_08209AC4
	thumb_func_end sp0B9_daycare_relationship_comment

	thumb_func_start sub_8042548
sub_8042548: @ 8042548
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	mov r2, sp
	mov r1, sp
	movs r0, 0
	strb r0, [r1, 0x1]
	strb r0, [r2]
	movs r3, 0
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _0804258C
_08042564:
	adds r1, r4, r3
	ldrb r0, [r1]
	cmp r0, 0xB5
	bne _08042572
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
_08042572:
	ldrb r0, [r1]
	cmp r0, 0xB6
	bne _0804257E
	ldrb r0, [r2, 0x1]
	adds r0, 0x1
	strb r0, [r2, 0x1]
_0804257E:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r4, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08042564
_0804258C:
	cmp r5, 0
	bne _080425A0
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0
	beq _080425A0
	mov r0, sp
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _080425B4
_080425A0:
	cmp r5, 0xFE
	bne _080425B8
	mov r0, sp
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _080425B8
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0
	bne _080425B8
_080425B4:
	movs r0, 0x1
	b _080425BA
_080425B8:
	movs r0, 0
_080425BA:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8042548

	thumb_func_start sub_80425C4
sub_80425C4: @ 80425C4
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0
	bne _080425E4
	movs r1, 0
	bl sub_8042548
	lsls r0, 24
	cmp r0, 0
	bne _08042600
	ldr r1, _080425E0
	b _08042602
	.align 2, 0
_080425E0: .4byte gUnknown_0820C33D
_080425E4:
	cmp r1, 0xFE
	bne _08042600
	adds r0, r4, 0
	movs r1, 0xFE
	bl sub_8042548
	lsls r0, 24
	cmp r0, 0
	bne _08042600
	ldr r1, _080425FC
	b _08042602
	.align 2, 0
_080425FC: .4byte gUnknown_0820C33F
_08042600:
	ldr r1, _08042610
_08042602:
	adds r0, r4, 0
	bl StringAppend
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08042610: .4byte gUnknown_0820C341
	thumb_func_end sub_80425C4

	thumb_func_start sub_8042614
sub_8042614: @ 8042614
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	bl pokemon_roll_gender
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_80425C4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8042614

	thumb_func_start sub_8042630
sub_8042630: @ 8042630
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x28
	mov r8, r0
	adds r7, r1, 0
	movs r0, 0xFF
	strb r0, [r7]
	movs r6, 0
	add r0, sp, 0x14
	mov r9, r0
_08042648:
	lsls r0, r6, 2
	adds r0, r6
	lsls r4, r0, 4
	add r4, r8
	lsls r0, 2
	mov r1, sp
	adds r5, r1, r0
	adds r0, r4, 0
	adds r1, r5, 0
	bl pokemon_get_nick_
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8042614
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x1
	bls _08042648
	adds r0, r7, 0
	mov r1, sp
	bl StringCopy
	ldr r4, _080426A8
	adds r0, r7, 0
	adds r1, r4, 0
	bl StringAppend
	adds r0, r7, 0
	mov r1, r9
	bl StringAppend
	adds r0, r7, 0
	adds r1, r4, 0
	bl StringAppend
	ldr r1, _080426AC
	adds r0, r7, 0
	bl StringAppend
	add sp, 0x28
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080426A8: .4byte gUnknown_0842CC28
_080426AC: .4byte gUnknown_0842CC2A
	thumb_func_end sub_8042630

	thumb_func_start sub_80426B0
sub_80426B0: @ 80426B0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	adds r4, r1, 0
	movs r0, 0xFF
	strb r0, [r4]
	movs r5, 0
	movs r0, 0xFC
	mov r8, r0
	movs r7, 0x14
_080426C6:
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 4
	adds r0, r6, r0
	movs r3, 0x88
	lsls r3, 1
	adds r1, r6, r3
	adds r1, r2
	ldr r1, [r1]
	bl sub_8041664
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x34
	strb r0, [r4]
	mov r0, r8
	strb r0, [r4, 0x1]
	strb r7, [r4, 0x2]
	movs r0, 0x6
	strb r0, [r4, 0x3]
	adds r0, r4, 0x4
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r4, r0, 0
	mov r3, r8
	strb r3, [r4]
	strb r7, [r4, 0x1]
	movs r0, 0
	strb r0, [r4, 0x2]
	adds r0, r4, 0x3
	ldr r1, _08042728
	bl StringCopy
	adds r4, r0, 0
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bls _080426C6
	movs r0, 0xFF
	strb r0, [r4]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042728: .4byte gUnknown_0842CC28
	thumb_func_end sub_80426B0

	thumb_func_start sub_804272C
sub_804272C: @ 804272C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	ldr r0, _08042760
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08042768
	ldr r0, _08042764
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0x8]
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _08042816
	subs r0, r2, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x1
	negs r0, r0
	b _0804278A
	.align 2, 0
_08042760: .4byte 0x03001770
_08042764: .4byte 0x03004b20
_08042768:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804279C
	ldr r0, _08042798
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0x8]
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	cmp r0, 0x2
	beq _08042816
	adds r0, r2, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x1
_0804278A:
	bl MoveMenuCursor
	movs r0, 0x5
	bl audio_play
	b _08042816
	.align 2, 0
_08042798: .4byte 0x03004b20
_0804279C:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080427E8
	bl sub_8072DEC
	movs r0, 0x5
	bl audio_play
	ldr r3, _080427DC
	ldr r2, _080427E0
	ldr r1, _080427E4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x8]
	strh r0, [r2]
	strb r0, [r3]
	adds r0, r4, 0
	bl DestroyTask
	movs r0, 0xF
	movs r1, 0x6
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	bl script_env_2_enable_and_set_ctx_running
	b _08042816
	.align 2, 0
_080427DC: .4byte 0x03005ce0
_080427E0: .4byte 0x0202e8dc
_080427E4: .4byte 0x03004b20
_080427E8:
	movs r4, 0x2
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _08042816
	bl sub_8072DEC
	ldr r0, _0804281C
	ldr r1, _08042820
	strh r4, [r1]
	movs r1, 0x2
	strb r1, [r0]
	adds r0, r5, 0
	bl DestroyTask
	movs r0, 0xF
	movs r1, 0x6
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	bl script_env_2_enable_and_set_ctx_running
_08042816:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804281C: .4byte 0x03005ce0
_08042820: .4byte 0x0202e8dc
	thumb_func_end sub_804272C

	thumb_func_start sub_8042824
sub_8042824: @ 8042824
	push {r4,lr}
	sub sp, 0x6C
	movs r0, 0xF
	movs r1, 0x6
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuDrawTextWindow
	ldr r4, _08042880
	adds r0, r4, 0
	add r1, sp, 0x8
	bl sub_8042630
	add r0, sp, 0x8
	movs r1, 0x10
	movs r2, 0x7
	bl MenuPrint
	adds r0, r4, 0
	add r1, sp, 0x8
	bl sub_80426B0
	add r0, sp, 0x8
	movs r1, 0xCE
	movs r2, 0x38
	movs r3, 0x1
	bl sub_80729D8
	movs r0, 0
	str r0, [sp]
	movs r0, 0xD
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x7
	movs r3, 0x3
	bl InitMenu
	ldr r0, _08042884
	movs r1, 0x3
	bl CreateTask
	add sp, 0x6C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08042880: .4byte 0x020286d0
_08042884: .4byte sub_804272C
	thumb_func_end sub_8042824

	thumb_func_start sub_8042888
sub_8042888: @ 8042888
	push {lr}
	movs r0, 0x6
	movs r1, 0
	bl sub_806AFAC
	ldr r1, _0804289C
	ldr r0, _080428A0
	str r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_0804289C: .4byte 0x03001770
_080428A0: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_8042888

	thumb_func_start sub_80428A4
sub_80428A4: @ 80428A4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x48
	adds r6, r0, 0
	adds r5, r1, 0
	movs r1, 0xB
	bl PokemonGetField
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	movs r4, 0
	add r7, sp, 0x18
	mov r0, sp
	adds r0, 0x31
	str r0, [sp, 0x38]
	mov r1, sp
	adds r1, 0x32
	str r1, [sp, 0x3C]
	add r0, sp, 0x30
	mov r9, r0
	adds r1, 0x1
	str r1, [sp, 0x40]
	mov r0, sp
	adds r0, 0x34
	str r0, [sp, 0x44]
_080428DE:
	adds r1, r4, 0
	adds r1, 0xD
	adds r0, r6, 0
	bl PokemonGetField
	lsls r1, r4, 1
	add r1, sp
	adds r1, 0x10
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080428DE
	adds r0, r6, 0
	movs r1, 0
	bl PokemonGetField
	mov r8, r0
	movs r4, 0
_08042906:
	adds r1, r4, 0
	adds r1, 0x27
	adds r0, r6, 0
	bl PokemonGetField
	lsls r1, r4, 2
	adds r1, r7, r1
	str r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _08042906
	adds r0, r6, 0
	movs r1, 0x25
	bl PokemonGetField
	ldr r1, [sp, 0x38]
	strb r0, [r1]
	adds r0, r6, 0
	movs r1, 0x8
	bl PokemonGetField
	ldr r1, [sp, 0x3C]
	strb r0, [r1]
	adds r0, r6, 0
	movs r1, 0x22
	bl PokemonGetField
	str r0, [sp, 0x34]
	movs r0, 0x1
	str r0, [sp]
	mov r0, r8
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	adds r0, r5, 0
	mov r1, r10
	movs r2, 0x5
	movs r3, 0x20
	bl create_pokemon_set_level
	movs r4, 0
_0804295E:
	adds r1, r4, 0
	adds r1, 0xD
	lsls r0, r4, 1
	mov r2, sp
	adds r2, r0
	adds r2, 0x10
	adds r0, r5, 0
	bl pokemon_setattr
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _0804295E
	movs r4, 0
_0804297C:
	adds r1, r4, 0
	adds r1, 0x27
	lsls r2, r4, 2
	adds r2, r7, r2
	adds r0, r5, 0
	bl pokemon_setattr
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0804297C
	movs r0, 0x2
	mov r1, r9
	strb r0, [r1]
	adds r0, r5, 0
	movs r1, 0x3
	mov r2, r9
	bl pokemon_setattr
	adds r0, r5, 0
	movs r1, 0x25
	ldr r2, [sp, 0x38]
	bl pokemon_setattr
	adds r0, r5, 0
	movs r1, 0x8
	ldr r2, [sp, 0x3C]
	bl pokemon_setattr
	movs r0, 0x78
	ldr r1, [sp, 0x40]
	strb r0, [r1]
	adds r0, r5, 0
	movs r1, 0x20
	ldr r2, [sp, 0x40]
	bl pokemon_setattr
	adds r0, r5, 0
	movs r1, 0x22
	ldr r2, [sp, 0x44]
	bl pokemon_setattr
	adds r0, r6, 0
	adds r1, r5, 0
	movs r2, 0x64
	bl memcpy
	add sp, 0x48
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80428A4

	thumb_func_start sub_80429EC
sub_80429EC: @ 80429EC
	push {r4-r6,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	adds r5, r0, 0
	muls r5, r1
	ldr r0, _08042A9C
	adds r5, r0
	ldr r1, _08042AA0
	adds r0, r5, 0
	bl sub_80428A4
	add r2, sp, 0xC
	movs r6, 0
	strb r6, [r2]
	adds r0, r5, 0
	movs r1, 0x2D
	bl pokemon_setattr
	adds r0, r5, 0
	movs r1, 0xB
	bl PokemonGetField
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, sp
	adds r1, r4, 0
	bl GetSpeciesName
	adds r0, r5, 0
	movs r1, 0x2
	mov r2, sp
	bl pokemon_setattr
	adds r0, r4, 0
	bl SpeciesToNationalPokedexNum
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8090D90
	adds r0, r4, 0
	movs r1, 0x3
	bl sub_8090D90
	ldr r1, _08042AA4
	adds r0, r5, 0
	bl pokemon_get_nick
	mov r2, sp
	adds r2, 0xE
	movs r0, 0x4
	strh r0, [r2]
	adds r0, r5, 0
	movs r1, 0x26
	bl pokemon_setattr
	add r2, sp, 0x10
	strh r6, [r2]
	adds r0, r5, 0
	movs r1, 0x24
	bl pokemon_setattr
	bl sav1_map_get_name
	mov r2, sp
	adds r2, 0x12
	strb r0, [r2]
	adds r0, r5, 0
	movs r1, 0x23
	bl pokemon_setattr
	adds r0, r5, 0
	bl sub_8040B1C
	adds r0, r5, 0
	bl pokemon_calc_effective_stats
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08042A9C: .4byte 0x03004360
_08042AA0: .4byte 0x030045c0
_08042AA4: .4byte 0x020231cc
	thumb_func_end sub_80429EC

	thumb_func_start sub_8042AA8
sub_8042AA8: @ 8042AA8
	push {lr}
	ldr r0, _08042AB8
	ldrb r0, [r0]
	bl sub_80429EC
	pop {r0}
	bx r0
	.align 2, 0
_08042AB8: .4byte 0x0202e8cc
	thumb_func_end sub_8042AA8

	thumb_func_start sub_8042ABC
sub_8042ABC: @ 8042ABC
	push {r4-r6,lr}
	sub sp, 0x20
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	adds r0, r5, r0
	mov r1, sp
	bl pokemon_get_nick_
	lsls r0, r4, 3
	subs r0, r4
	lsls r1, r0, 3
	adds r0, r5, r1
	adds r0, 0xC0
	ldrh r0, [r0]
	cmp r0, 0
	beq _08042B40
	adds r0, r1, 0
	adds r0, 0xA0
	adds r5, r0
	adds r6, r5, 0
	adds r6, 0x2C
	mov r0, sp
	adds r1, r6, 0
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	bne _08042B08
	ldr r0, _08042B30
	adds r1, r5, 0
	adds r1, 0x24
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	beq _08042B40
_08042B08:
	ldr r0, _08042B34
	mov r1, sp
	bl StringCopy
	ldr r4, _08042B38
	adds r1, r5, 0
	adds r1, 0x24
	adds r0, r4, 0
	bl StringCopy
	ldr r0, _08042B3C
	adds r1, r6, 0
	bl StringCopy
	adds r0, r4, 0
	bl sub_814A568
	movs r0, 0x1
	b _08042B42
	.align 2, 0
_08042B30: .4byte gSaveBlock2
_08042B34: .4byte 0x020231cc
_08042B38: .4byte 0x020232cc
_08042B3C: .4byte 0x020233cc
_08042B40:
	movs r0, 0
_08042B42:
	add sp, 0x20
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8042ABC

	thumb_func_start sub_8042B4C
sub_8042B4C: @ 8042B4C
	push {lr}
	ldr r0, _08042B60
	ldr r1, _08042B64
	ldrb r1, [r1]
	bl sub_8042ABC
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08042B60: .4byte 0x020286d0
_08042B64: .4byte 0x0202e8cc
	thumb_func_end sub_8042B4C

	thumb_func_start sub_8042B68
sub_8042B68: @ 8042B68
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r3, r0, 24
	adds r4, r3, 0
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r1, r2, 24
	adds r2, r1, 0
	movs r5, 0
	mov r9, r5
	movs r7, 0
	cmp r3, 0
	bne _08042B96
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08042BB0
	adds r7, r1, r0
	movs r5, 0x1
_08042B96:
	cmp r3, 0x1
	bne _08042BA6
	movs r0, 0x64
	adds r1, r2, 0
	muls r1, r0
	ldr r0, _08042BB0
	adds r7, r1, r0
	movs r5, 0x3
_08042BA6:
	cmp r6, 0
	beq _08042BB4
	cmp r6, 0x1
	beq _08042C14
	b _08042C50
	.align 2, 0
_08042BB0: .4byte 0x03004360
_08042BB4:
	adds r0, r7, 0
	movs r1, 0xB
	bl PokemonGetField
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r7, 0
	movs r1, 0
	bl PokemonGetField
	mov r8, r0
	lsls r0, r5, 3
	ldr r1, _08042C04
	adds r0, r1
	ldr r1, _08042C08
	lsls r2, r5, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	ldr r3, _08042C0C
	ldr r6, _08042C10
	lsls r4, 1
	adds r4, 0x1
	lsls r4, 2
	adds r4, r6
	ldr r4, [r4]
	str r4, [sp]
	str r5, [sp, 0x4]
	mov r4, r8
	str r4, [sp, 0x8]
	bl sub_800D334
	adds r0, r7, 0
	bl sub_8040990
	bl LoadCompressedObjectPalette
	b _08042C50
	.align 2, 0
_08042C04: .4byte gMonFrontPicTable
_08042C08: .4byte gMonFrontPicCoords
_08042C0C: .4byte 0x02000000
_08042C10: .4byte gUnknown_081FAF4C
_08042C14:
	adds r0, r7, 0
	bl sub_8040990
	ldrh r0, [r0, 0x4]
	adds r1, r5, 0
	bl gpu_pal_obj_decompress_and_apply
	ldr r0, _08042C60
	movs r1, 0x78
	movs r2, 0x46
	movs r3, 0x6
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r4, _08042C64
	lsls r1, r0, 4
	add r1, r9
	lsls r1, 2
	adds r2, r1, r4
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r2]
	adds r4, 0x1C
	adds r1, r4
	ldr r0, _08042C68
	str r0, [r1]
_08042C50:
	mov r0, r9
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08042C60: .4byte 0x02024e8c
_08042C64: .4byte 0x02020004
_08042C68: .4byte SpriteCallbackDummy
	thumb_func_end sub_8042B68

	thumb_func_start sub_8042C6C
sub_8042C6C: @ 8042C6C
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_8042C6C

	thumb_func_start sub_8042C80
sub_8042C80: @ 8042C80
	push {lr}
	sub sp, 0x4
	bl script_env_2_enable
	ldr r0, _08042CA8
	movs r1, 0xA
	bl CreateTask
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08042CA8: .4byte sub_8042CAC
	thumb_func_end sub_8042C80

	thumb_func_start sub_8042CAC
sub_8042CAC: @ 8042CAC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08042CD8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08042CD0
	ldr r0, _08042CDC
	bl SetMainCallback2
	ldr r1, _08042CE0
	ldr r0, _08042CE4
	str r0, [r1]
	adds r0, r4, 0
	bl DestroyTask
_08042CD0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08042CD8: .4byte 0x0202f388
_08042CDC: .4byte sub_8042CE8
_08042CE0: .4byte 0x0300485c
_08042CE4: .4byte sub_8080990
	thumb_func_end sub_8042CAC

	thumb_func_start sub_8042CE8
sub_8042CE8: @ 8042CE8
	push {r4-r7,lr}
	ldr r0, _08042D04
	ldr r1, _08042D08
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x8
	bls _08042CF8
	b _08042F6E
_08042CF8:
	lsls r0, 2
	ldr r1, _08042D0C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08042D04: .4byte 0x03001770
_08042D08: .4byte 0x0000043c
_08042D0C: .4byte _08042D10
	.align 2, 0
_08042D10:
	.4byte _08042D34
	.4byte _08042D90
	.4byte _08042DC4
	.4byte _08042E20
	.4byte _08042E40
	.4byte _08042E74
	.4byte _08042E88
	.4byte _08042EB0
	.4byte _08042F40
_08042D34:
	movs r0, 0x80
	lsls r0, 19
	movs r2, 0
	strh r2, [r0]
	ldr r1, _08042D74
	ldr r0, _08042D78
	str r0, [r1]
	ldr r1, _08042D7C
	ldrh r1, [r1]
	strb r1, [r0, 0x4]
	adds r0, 0x3A
	strb r2, [r0]
	bl ResetTasks
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, _08042D80
	bl SetVBlankCallback
	ldr r1, _08042D84
	ldr r2, _08042D88
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl current_map_music_get
	ldr r1, _08042D8C
	strh r0, [r1]
	b _08042F6E
	.align 2, 0
_08042D74: .4byte 0x0300481c
_08042D78: .4byte 0x02018000
_08042D7C: .4byte 0x0202e8cc
_08042D80: .4byte sub_8042C6C
_08042D84: .4byte 0x03001770
_08042D88: .4byte 0x0000043c
_08042D8C: .4byte 0x0202e8ce
_08042D90:
	ldr r5, _08042DBC
	adds r0, r5, 0
	bl SetUpWindowConfig
	ldr r4, _08042DC0
	ldr r0, [r4]
	adds r0, 0x8
	adds r1, r5, 0
	bl InitWindowFromConfig
	movs r0, 0x14
	bl SetTextWindowBaseTileNum
	ldr r1, [r4]
	adds r1, 0x38
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, 0x8
	bl LoadTextWindowGraphics
	b _08042F04
	.align 2, 0
_08042DBC: .4byte gWindowConfig_81E6F84
_08042DC0: .4byte 0x0300481c
_08042DC4:
	ldr r0, _08042DFC
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
	ldr r0, _08042E00
	ldr r4, _08042E04
	movs r2, 0x80
	lsls r2, 4
	adds r1, r4, 0
	bl CpuSet
	ldr r1, _08042E08
	str r4, [r1]
	ldr r0, _08042E0C
	str r0, [r1, 0x4]
	ldr r0, _08042E10
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r0, _08042E14
	movs r1, 0
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r1, _08042E18
	ldr r2, _08042E1C
	adds r1, r2
	b _08042F0A
	.align 2, 0
_08042DFC: .4byte gUnknown_08D00000
_08042E00: .4byte gUnknown_08D00524
_08042E04: .4byte 0x02000000
_08042E08: .4byte 0x040000d4
_08042E0C: .4byte 0x06002800
_08042E10: .4byte 0x80000280
_08042E14: .4byte gUnknown_08D004E0
_08042E18: .4byte 0x03001770
_08042E1C: .4byte 0x0000043c
_08042E20:
	ldr r0, _08042E34
	bl LoadSpriteSheet
	ldr r0, _08042E38
	bl LoadSpriteSheet
	ldr r0, _08042E3C
	bl LoadSpritePalette
	b _08042F04
	.align 2, 0
_08042E34: .4byte gUnknown_0820A3B0
_08042E38: .4byte gUnknown_0820A3B8
_08042E3C: .4byte gUnknown_0820A3C0
_08042E40:
	ldr r0, _08042E64
	movs r1, 0x78
	movs r2, 0x4B
	movs r3, 0x5
	bl CreateSprite
	ldr r2, _08042E68
	ldr r1, [r2]
	strb r0, [r1]
	ldr r0, [r2]
	ldrb r0, [r0, 0x4]
	bl sub_80429EC
	ldr r1, _08042E6C
	ldr r2, _08042E70
	adds r1, r2
	b _08042F0A
	.align 2, 0
_08042E64: .4byte gSpriteTemplate_820A3C8
_08042E68: .4byte 0x0300481c
_08042E6C: .4byte 0x03001770
_08042E70: .4byte 0x0000043c
_08042E74:
	ldr r0, _08042E84
	ldr r0, [r0]
	ldrb r2, [r0, 0x4]
	movs r0, 0
	movs r1, 0
	bl sub_8042B68
	b _08042F04
	.align 2, 0
_08042E84: .4byte 0x0300481c
_08042E88:
	ldr r4, _08042EA4
	ldr r0, [r4]
	ldrb r2, [r0, 0x4]
	movs r0, 0
	movs r1, 0x1
	bl sub_8042B68
	ldr r1, [r4]
	strb r0, [r1, 0x1]
	ldr r1, _08042EA8
	ldr r2, _08042EAC
	adds r1, r2
	b _08042F0A
	.align 2, 0
_08042EA4: .4byte 0x0300481c
_08042EA8: .4byte 0x03001770
_08042EAC: .4byte 0x0000043c
_08042EB0:
	ldr r0, _08042F14
	ldr r2, _08042F18
	adds r1, r2, 0
	strh r1, [r0]
	ldr r0, _08042F1C
	movs r1, 0x10
	movs r2, 0xA0
	bl LoadPalette
	ldr r3, _08042F20
	ldr r4, _08042F24
	movs r5, 0x98
	lsls r5, 5
	ldr r1, _08042F28
	ldr r6, _08042F2C
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_08042ED6:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _08042ED6
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _08042F30
	ldr r2, _08042F34
	ldr r0, _08042F28
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _08042F2C
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
_08042F04:
	ldr r1, _08042F38
	ldr r0, _08042F3C
	adds r1, r0
_08042F0A:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08042F6E
	.align 2, 0
_08042F14: .4byte REG_BG2CNT
_08042F18: .4byte 0x00004c06
_08042F1C: .4byte gUnknown_0820C9F8
_08042F20: .4byte gUnknown_0820CA98
_08042F24: .4byte 0x06004000
_08042F28: .4byte 0x040000d4
_08042F2C: .4byte 0x80000800
_08042F30: .4byte gUnknown_0820F798
_08042F34: .4byte 0x06006000
_08042F38: .4byte 0x03001770
_08042F3C: .4byte 0x0000043c
_08042F40:
	ldr r1, _08042F74
	ldr r2, _08042F78
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08042F7C
	movs r4, 0
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	ldr r0, _08042F80
	bl SetMainCallback2
	ldr r0, _08042F84
	ldr r0, [r0]
	strb r4, [r0, 0x2]
_08042F6E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042F74: .4byte REG_BG1CNT
_08042F78: .4byte 0x00000501
_08042F7C: .4byte REG_BG0HOFS
_08042F80: .4byte sub_804300C
_08042F84: .4byte 0x0300481c
	thumb_func_end sub_8042CE8

	thumb_func_start sub_8042F88
sub_8042F88: @ 8042F88
	push {lr}
	ldr r0, _08042FA8
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08042FAC
	adds r0, r1
	ldr r2, _08042FB0
	movs r1, 0x2
	bl pokemon_setattr
	ldr r0, _08042FB4
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08042FA8: .4byte 0x0202e8cc
_08042FAC: .4byte 0x03004360
_08042FB0: .4byte 0x020233cc
_08042FB4: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_8042F88

	thumb_func_start c3_080472E4
c3_080472E4: @ 8042FB8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08043004
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08042FD4
	bl sub_8074D08
_08042FD4:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _08042FE4
	movs r0, 0xBC
	lsls r0, 1
	bl sub_8075474
_08042FE4:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x3C
	ble _08042FF8
	ldr r0, _08043008
	bl sub_8075474
	adds r0, r5, 0
	bl DestroyTask
_08042FF8:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08043004: .4byte 0x03004b20
_08043008: .4byte 0x00000179
	thumb_func_end c3_080472E4

	thumb_func_start sub_804300C
sub_804300C: @ 804300C
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	ldr r1, _08043030
	ldr r0, [r1]
	ldrb r0, [r0, 0x2]
	adds r5, r1, 0
	cmp r0, 0xB
	bls _08043026
	b _080432BA
_08043026:
	lsls r0, 2
	ldr r1, _08043034
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08043030: .4byte 0x0300481c
_08043034: .4byte _08043038
	.align 2, 0
_08043038:
	.4byte _08043068
	.4byte _080430A0
	.4byte _080430C0
	.4byte _080430F8
	.4byte _08043124
	.4byte _08043164
	.4byte _08043172
	.4byte _08043180
	.4byte _080431B8
	.4byte _080431DA
	.4byte _08043288
	.4byte _080432A8
_08043068:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xBA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08043098
	ldr r1, [r0]
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	strb r0, [r1, 0x2]
	ldr r0, _0804309C
	movs r1, 0x5
	bl CreateTask
	b _080432BA
	.align 2, 0
_08043098: .4byte 0x0300481c
_0804309C: .4byte c3_080472E4
_080430A0:
	ldr r0, _080430BC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _080430B2
	b _080432BA
_080430B2:
	ldr r0, [r5]
	strb r1, [r0, 0x3]
	ldr r1, [r5]
	b _0804329C
	.align 2, 0
_080430BC: .4byte 0x0202f388
_080430C0:
	ldr r1, [r5]
	ldrb r0, [r1, 0x3]
	adds r0, 0x1
	strb r0, [r1, 0x3]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1E
	bhi _080430D2
	b _080432BA
_080430D2:
	ldr r1, [r5]
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	strb r0, [r1, 0x2]
	ldr r2, _080430F0
	ldr r0, [r5]
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _080430F4
	str r1, [r0]
	b _080432BA
	.align 2, 0
_080430F0: .4byte 0x02020004
_080430F4: .4byte sub_80432E4
_080430F8:
	ldr r2, _0804311C
	ldr r3, [r5]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _08043120
	cmp r1, r0
	beq _08043112
	b _080432BA
_08043112:
	ldrb r0, [r3, 0x2]
	adds r0, 0x1
	strb r0, [r3, 0x2]
	b _080432BA
	.align 2, 0
_0804311C: .4byte 0x02020004
_08043120: .4byte SpriteCallbackDummy
_08043124:
	ldr r0, [r5]
	ldrb r1, [r0, 0x4]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08043150
	adds r0, r1
	ldr r1, _08043154
	bl pokemon_get_nick
	ldr r4, _08043158
	ldr r1, _0804315C
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	bl sub_80436FC
	ldr r0, _08043160
	bl fanfare_play
	ldr r1, [r5]
	b _0804329C
	.align 2, 0
_08043150: .4byte 0x03004360
_08043154: .4byte 0x020231cc
_08043158: .4byte 0x020234cc
_0804315C: .4byte gUnknown_0842CC38
_08043160: .4byte 0x00000173
_08043164:
	bl task_is_not_running_overworld_fanfare
	lsls r0, 24
	cmp r0, 0
	bne _08043170
	b _080432BA
_08043170:
	b _08043298
_08043172:
	bl task_is_not_running_overworld_fanfare
	lsls r0, 24
	cmp r0, 0
	bne _0804317E
	b _080432BA
_0804317E:
	b _08043298
_08043180:
	ldr r0, [r5]
	ldrb r1, [r0, 0x4]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080431A8
	adds r0, r1
	ldr r1, _080431AC
	bl pokemon_get_nick
	ldr r4, _080431B0
	ldr r1, _080431B4
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	bl sub_80436D4
	ldr r1, [r5]
	b _0804329C
	.align 2, 0
_080431A8: .4byte 0x03004360
_080431AC: .4byte 0x020231cc
_080431B0: .4byte 0x020234cc
_080431B4: .4byte gUnknown_0842CC5A
_080431B8:
	bl sub_8043724
	lsls r0, 24
	cmp r0, 0
	beq _080432BA
	movs r0, 0x16
	movs r1, 0x8
	movs r2, 0x1B
	movs r3, 0xD
	bl MenuDrawTextWindow
	movs r0, 0x16
	movs r1, 0x8
	movs r2, 0x4
	bl InitYesNoMenu
	b _08043298
_080431DA:
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	lsrs r2, r0, 24
	asrs r0, 24
	movs r1, 0x2
	negs r1, r1
	cmp r0, r1
	beq _080432BA
	lsls r0, r2, 24
	asrs r1, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08043298
	cmp r1, 0x1
	beq _08043298
	ldr r0, _08043278
	mov r9, r0
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	movs r1, 0x64
	mov r8, r1
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	ldr r6, _0804327C
	adds r0, r6
	ldr r1, _08043280
	mov r10, r1
	bl pokemon_get_nick
	mov r2, r9
	ldr r0, [r2]
	ldrb r0, [r0, 0x4]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	movs r1, 0xB
	bl PokemonGetField
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r2, r9
	ldr r0, [r2]
	ldrb r0, [r0, 0x4]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	bl pokemon_get_gender
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r2, r9
	ldr r0, [r2]
	ldrb r0, [r0, 0x4]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	movs r1, 0
	movs r2, 0
	bl PokemonGetField
	str r0, [sp]
	ldr r0, _08043284
	str r0, [sp, 0x4]
	movs r0, 0x3
	mov r1, r10
	adds r2, r5, 0
	adds r3, r4, 0
	bl DoNamingScreen
	b _080432BA
	.align 2, 0
_08043278: .4byte 0x0300481c
_0804327C: .4byte 0x03004360
_08043280: .4byte 0x020233cc
_08043284: .4byte sub_8042F88
_08043288:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_08043298:
	ldr r0, _080432A4
	ldr r1, [r0]
_0804329C:
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	strb r0, [r1, 0x2]
	b _080432BA
	.align 2, 0
_080432A4: .4byte 0x0300481c
_080432A8:
	ldr r0, _080432DC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080432BA
	ldr r0, _080432E0
	bl SetMainCallback2
_080432BA:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080432DC: .4byte 0x0202f388
_080432E0: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_804300C

	thumb_func_start sub_80432E4
sub_80432E4: @ 80432E4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _08043304
	ldr r0, _08043300
	str r0, [r4, 0x1C]
	movs r0, 0
	strh r0, [r4, 0x2E]
	b _08043334
	.align 2, 0
_08043300: .4byte sub_804333C
_08043304:
	ldrh r0, [r4, 0x30]
	adds r0, 0x14
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x1
	bl sine
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0xF
	bne _08043334
	movs r0, 0x17
	bl audio_play
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	bl sub_80435FC
_08043334:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80432E4

	thumb_func_start sub_804333C
sub_804333C: @ 804333C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1E
	ble _08043398
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _0804336C
	ldr r0, _08043368
	str r0, [r4, 0x1C]
	strh r1, [r4, 0x2E]
	strh r1, [r4, 0x32]
	b _08043398
	.align 2, 0
_08043368: .4byte sub_80433A0
_0804336C:
	ldrh r0, [r4, 0x30]
	adds r0, 0x14
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x2
	bl sine
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0xF
	bne _08043398
	movs r0, 0x17
	bl audio_play
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
_08043398:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_804333C

	thumb_func_start sub_80433A0
sub_80433A0: @ 80433A0
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	movs r6, 0
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1E
	ble _0804345A
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x26
	ble _08043418
	ldr r0, _08043404
	str r0, [r4, 0x1C]
	strh r6, [r4, 0x2E]
	ldr r5, _08043408
	ldr r0, [r5]
	ldrb r1, [r0, 0x4]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0804340C
	adds r0, r1
	movs r1, 0xB
	bl PokemonGetField
	lsls r0, 16
	ldr r4, _08043410
	ldr r3, [r5]
	ldrb r2, [r3, 0x1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	strh r6, [r1, 0x24]
	ldrb r2, [r3, 0x1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldr r2, _08043414
	lsrs r0, 14
	adds r0, r2
	ldrb r0, [r0, 0x1]
	strh r0, [r1, 0x26]
	b _0804345A
	.align 2, 0
_08043404: .4byte sub_8043460
_08043408: .4byte 0x0300481c
_0804340C: .4byte 0x03004360
_08043410: .4byte 0x02020004
_08043414: .4byte gMonFrontPicCoords
_08043418:
	ldrh r0, [r4, 0x30]
	adds r0, 0x14
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x2
	bl sine
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0xF
	bne _0804344C
	movs r0, 0x17
	bl audio_play
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	bl sub_80435FC
	bl sub_80435FC
_0804344C:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1E
	bne _0804345A
	movs r0, 0x17
	bl audio_play
_0804345A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80433A0

	thumb_func_start sub_8043460
sub_8043460: @ 8043460
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x32
	ble _0804347A
	ldr r0, _08043480
	str r0, [r1, 0x1C]
	movs r0, 0
	strh r0, [r1, 0x2E]
_0804347A:
	pop {r0}
	bx r0
	.align 2, 0
_08043480: .4byte sub_8043484
	thumb_func_end sub_8043460

	thumb_func_start sub_8043484
sub_8043484: @ 8043484
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080434A4
	movs r1, 0x1
	negs r1, r1
	ldr r0, _080434F8
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_080434A4:
	ldrh r0, [r5, 0x2E]
	cmp r0, 0x3
	bhi _080434C0
	movs r4, 0
_080434AC:
	bl sub_80435FC
	lsls r0, r4, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080434AC
_080434C0:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	ldr r0, _080434FC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080434EE
	movs r0, 0x71
	bl audio_play
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08043500
	str r0, [r5, 0x1C]
	strh r4, [r5, 0x2E]
_080434EE:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080434F8: .4byte 0x0000ffff
_080434FC: .4byte 0x0202f388
_08043500: .4byte sub_8043504
	thumb_func_end sub_8043484

	thumb_func_start sub_8043504
sub_8043504: @ 8043504
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _08043540
	ldr r4, _08043594
	ldr r3, _08043598
	ldr r0, [r3]
	ldrb r1, [r0, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldr r0, [r3]
	ldrb r1, [r0, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x1
	bl StartSpriteAffineAnim
_08043540:
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0x8
	bne _0804355A
	movs r1, 0x1
	negs r1, r1
	ldr r0, _0804359C
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_0804355A:
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x9
	bgt _08043578
	ldr r2, _08043594
	ldr r0, _08043598
	ldr r0, [r0]
	ldrb r1, [r0, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	subs r1, 0x1
	strh r1, [r0, 0x22]
_08043578:
	ldrh r1, [r5, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0x28
	ble _08043586
	ldr r0, _080435A0
	str r0, [r5, 0x1C]
_08043586:
	adds r0, r1, 0x1
	strh r0, [r5, 0x2E]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08043594: .4byte 0x02020004
_08043598: .4byte 0x0300481c
_0804359C: .4byte 0x0000ffff
_080435A0: .4byte SpriteCallbackDummy
	thumb_func_end sub_8043504

	thumb_func_start sub_80435A4
sub_80435A4: @ 80435A4
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x36]
	adds r0, r1
	strh r0, [r2, 0x36]
	ldrh r1, [r2, 0x32]
	ldrh r3, [r2, 0x38]
	adds r0, r1, r3
	strh r0, [r2, 0x38]
	movs r4, 0x36
	ldrsh r0, [r2, r4]
	cmp r0, 0
	bge _080435C2
	adds r0, 0xFF
_080435C2:
	asrs r0, 8
	strh r0, [r2, 0x24]
	movs r3, 0x38
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bge _080435D0
	adds r0, 0xFF
_080435D0:
	asrs r0, 8
	strh r0, [r2, 0x26]
	ldrh r0, [r2, 0x34]
	adds r3, r1, r0
	strh r3, [r2, 0x32]
	movs r4, 0x22
	ldrsh r1, [r2, r4]
	movs r4, 0x26
	ldrsh r0, [r2, r4]
	adds r0, r1, r0
	adds r1, 0x14
	cmp r0, r1
	ble _080435F6
	lsls r0, r3, 16
	cmp r0, 0
	ble _080435F6
	adds r0, r2, 0
	bl DestroySprite
_080435F6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80435A4

	thumb_func_start sub_80435FC
sub_80435FC: @ 80435FC
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r3, _0804364C
	ldr r0, _08043650
	ldr r4, [r0]
	adds r4, 0x3A
	ldrb r2, [r4]
	lsls r0, r2, 2
	adds r1, r0, r3
	ldrh r6, [r1]
	adds r3, 0x2
	adds r0, r3
	ldrh r5, [r0]
	adds r2, 0x1
	strb r2, [r4]
	bl Random
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	lsls r6, 16
	asrs r6, 16
	lsls r5, 16
	asrs r5, 16
	movs r0, 0x64
	str r0, [sp]
	lsrs r1, 16
	str r1, [sp, 0x4]
	movs r0, 0x78
	movs r1, 0x3C
	adds r2, r6, 0
	adds r3, r5, 0
	bl sub_8043654
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804364C: .4byte gEggShardVelocities
_08043650: .4byte 0x0300481c
	thumb_func_end sub_80435FC

	thumb_func_start sub_8043654
sub_8043654: @ 8043654
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	mov r8, r3
	ldr r0, [sp, 0x1C]
	mov r9, r0
	ldr r1, [sp, 0x20]
	mov r10, r1
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 16
	lsrs r6, 16
	mov r0, r8
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	mov r1, r9
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	mov r0, r10
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, _080436CC
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x4
	bl CreateSprite
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080436D0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r6, [r0, 0x30]
	mov r1, r8
	strh r1, [r0, 0x32]
	mov r1, r9
	strh r1, [r0, 0x34]
	mov r1, r10
	bl StartSpriteAnim
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080436CC: .4byte gSpriteTemplate_820A418
_080436D0: .4byte 0x02020004
	thumb_func_end sub_8043654

	thumb_func_start sub_80436D4
sub_80436D4: @ 80436D4
	push {lr}
	sub sp, 0x4
	adds r1, r0, 0
	ldr r0, _080436F8
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x8
	adds r2, 0x38
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x3
	bl sub_8002EB0
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080436F8: .4byte 0x0300481c
	thumb_func_end sub_80436D4

	thumb_func_start sub_80436FC
sub_80436FC: @ 80436FC
	push {lr}
	sub sp, 0x4
	adds r1, r0, 0
	ldr r0, _08043720
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x8
	adds r2, 0x38
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x3
	bl sub_8003460
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08043720: .4byte 0x0300481c
	thumb_func_end sub_80436FC

	thumb_func_start sub_8043724
sub_8043724: @ 8043724
	push {lr}
	ldr r0, _08043738
	ldr r0, [r0]
	adds r0, 0x8
	bl sub_80035AC
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08043738: .4byte 0x0300481c
	thumb_func_end sub_8043724

	thumb_func_start sub_804373C
sub_804373C: @ 804373C
	movs r0, 0x9
	bx lr
	thumb_func_end sub_804373C

	thumb_func_start sub_8043740
sub_8043740: @ 8043740
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r7, r1, 0
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	movs r3, 0
	movs r2, 0
_0804375C:
	lsls r0, r3, 24
	asrs r0, 24
	mov r3, sp
	adds r1, r3, r0
	strb r2, [r1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _0804375C
	movs r3, 0x3
	movs r0, 0x1
	negs r0, r0
	mov r9, r0
	mov r8, sp
_0804377C:
	lsls r0, r5, 16
	asrs r6, r0, 16
	cmp r6, 0
	ble _080437AA
	lsls r4, r3, 24
	asrs r4, 24
	mov r1, sp
	adds r5, r1, r4
	adds r0, r6, 0
	movs r1, 0xA
	bl __modsi3
	strb r0, [r5]
	adds r0, r6, 0
	movs r1, 0xA
	bl __divsi3
	lsls r0, 16
	lsrs r5, r0, 16
	subs r4, 0x1
	lsls r4, 24
	lsrs r3, r4, 24
	b _0804377C
_080437AA:
	lsls r1, r3, 24
	asrs r0, r1, 24
	cmp r0, r9
	ble _080437CE
	movs r4, 0xFF
	movs r3, 0x1
	negs r3, r3
_080437B8:
	asrs r2, r1, 24
	mov r5, sp
	adds r1, r5, r2
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	subs r2, 0x1
	lsls r1, r2, 24
	asrs r0, r1, 24
	cmp r0, r3
	bgt _080437B8
_080437CE:
	mov r1, r8
	ldrb r0, [r1, 0x3]
	cmp r0, 0xFF
	bne _080437DA
	movs r0, 0
	strb r0, [r1, 0x3]
_080437DA:
	mov r2, r10
	cmp r2, 0
	bne _0804386A
	movs r3, 0
	movs r1, 0
	movs r6, 0xFC
	lsls r6, 8
	movs r5, 0x1E
	mov r12, r5
_080437EC:
	lsls r1, 24
	asrs r2, r1, 24
	mov r0, sp
	adds r5, r0, r2
	ldrb r0, [r5]
	mov r8, r1
	cmp r0, 0xFF
	bne _08043822
	lsls r1, r2, 1
	adds r1, r7
	ldrh r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	mov r2, r12
	orrs r0, r2
	strh r0, [r1]
	lsls r3, 24
	asrs r1, r3, 23
	adds r1, r7
	adds r1, 0x40
	ldrh r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	mov r5, r12
	orrs r0, r5
	strh r0, [r1]
	b _08043852
_08043822:
	lsls r2, 1
	adds r2, r7
	ldrh r0, [r2]
	adds r1, r6, 0
	ands r1, r0
	ldrb r0, [r5]
	adds r0, 0x14
	orrs r1, r0
	strh r1, [r2]
	lsls r4, r3, 24
	asrs r3, r4, 24
	lsls r2, r3, 1
	adds r2, r7
	adds r2, 0x40
	ldrh r0, [r2]
	adds r1, r6, 0
	ands r1, r0
	mov r5, sp
	adds r0, r5, r3
	ldrb r0, [r0]
	adds r0, 0x34
	orrs r1, r0
	strh r1, [r2]
	adds r3, r4, 0
_08043852:
	movs r0, 0x80
	lsls r0, 17
	add r0, r8
	lsrs r1, r0, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r3, r2
	lsrs r3, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _080437EC
	b _080438CE
_0804386A:
	movs r3, 0
	movs r4, 0xFC
	lsls r4, 8
	movs r6, 0x1E
_08043872:
	lsls r1, r3, 24
	asrs r2, r1, 24
	mov r3, sp
	adds r5, r3, r2
	ldrb r0, [r5]
	adds r3, r1, 0
	cmp r0, 0xFF
	bne _0804389E
	lsls r1, r2, 1
	adds r1, r7
	ldrh r2, [r1]
	adds r0, r4, 0
	ands r0, r2
	orrs r0, r6
	strh r0, [r1]
	adds r1, 0x40
	ldrh r2, [r1]
	adds r0, r4, 0
	ands r0, r2
	orrs r0, r6
	strh r0, [r1]
	b _080438C0
_0804389E:
	lsls r2, 1
	adds r2, r7
	ldrh r0, [r2]
	adds r1, r4, 0
	ands r1, r0
	ldrb r0, [r5]
	adds r0, 0x14
	orrs r1, r0
	strh r1, [r2]
	adds r2, 0x40
	ldrh r0, [r2]
	adds r1, r4, 0
	ands r1, r0
	ldrb r0, [r5]
	adds r0, 0x34
	orrs r1, r0
	strh r1, [r2]
_080438C0:
	movs r5, 0x80
	lsls r5, 17
	adds r0, r3, r5
	lsrs r3, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _08043872
_080438CE:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8043740

	thumb_func_start unref_sub_80438E0
unref_sub_80438E0: @ 80438E0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	adds r5, r2, 0
	lsls r4, 16
	lsrs r4, 16
	movs r1, 0x1E
	strh r1, [r5, 0x8]
	lsls r0, 16
	asrs r0, 16
	adds r1, r5, 0
	movs r2, 0
	bl sub_8043740
	lsls r4, 16
	asrs r4, 16
	adds r5, 0xA
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_8043740
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_80438E0

	thumb_func_start battle_make_oam_normal_battle
battle_make_oam_normal_battle: @ 8043914
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	movs r0, 0
	str r0, [sp]
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _08043A28
	mov r0, r10
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080439AC
	ldr r4, _0804399C
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r4, _080439A0
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0x1]
	movs r3, 0x3F
	adds r0, r3, 0
	ands r0, r2
	strb r0, [r1, 0x1]
	lsls r2, r7, 4
	adds r2, r7
	lsls r2, 2
	adds r2, r4
	ldrb r0, [r2, 0x1]
	ands r3, r0
	strb r3, [r2, 0x1]
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x40
	ldr r4, _080439A4
	adds r0, r4, 0
	ands r1, r0
	ldr r0, _080439A8
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
	b _080439F2
	.align 2, 0
_0804399C: .4byte gSpriteTemplate_820A4EC
_080439A0: .4byte 0x02020004
_080439A4: .4byte 0x000003ff
_080439A8: .4byte 0xfffffc00
_080439AC:
	ldr r4, _08043A14
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08043A18
	lsls r2, r7, 4
	adds r2, r7
	lsls r2, 2
	adds r2, r0
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x20
	ldr r5, _08043A1C
	adds r0, r5, 0
	ands r1, r0
	ldr r0, _08043A20
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
	movs r0, 0x2
	str r0, [sp]
_080439F2:
	ldr r2, _08043A18
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r2
	strh r7, [r0, 0x6]
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	adds r1, r0, r2
	strh r6, [r1, 0x38]
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _08043A24
	str r1, [r0]
	b _08043B50
	.align 2, 0
_08043A14: .4byte gSpriteTemplate_820A51C
_08043A18: .4byte 0x02020004
_08043A1C: .4byte 0x000003ff
_08043A20: .4byte 0xfffffc00
_08043A24: .4byte sub_8043D5C
_08043A28:
	mov r0, r10
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08043ACC
	mov r0, r10
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 25
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldr r4, _08043AB8
	adds r0, r4
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	mov r0, r10
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 25
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r4, _08043ABC
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r4
	strh r7, [r0, 0x6]
	lsls r2, r7, 4
	adds r2, r7
	lsls r2, 2
	adds r3, r2, r4
	strh r6, [r3, 0x38]
	ldrh r1, [r3, 0x4]
	mov r8, r1
	mov r5, r8
	lsls r1, r5, 22
	lsrs r1, 22
	adds r1, 0x20
	ldr r5, _08043AC0
	adds r0, r5, 0
	ands r1, r0
	ldr r0, _08043AC4
	mov r5, r8
	ands r0, r5
	orrs r0, r1
	strh r0, [r3, 0x4]
	adds r4, 0x1C
	adds r2, r4
	ldr r0, _08043AC8
	str r0, [r2]
	movs r0, 0x1
	b _08043B4E
	.align 2, 0
_08043AB8: .4byte gSpriteTemplate_820A4EC
_08043ABC: .4byte 0x02020004
_08043AC0: .4byte 0x000003ff
_08043AC4: .4byte 0xfffffc00
_08043AC8: .4byte sub_8043D5C
_08043ACC:
	mov r0, r10
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 25
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldr r4, _08043C14
	adds r0, r4
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	mov r0, r10
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 25
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r4, _08043C18
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r4
	strh r7, [r0, 0x6]
	lsls r2, r7, 4
	adds r2, r7
	lsls r2, 2
	adds r3, r2, r4
	strh r6, [r3, 0x38]
	ldrh r1, [r3, 0x4]
	mov r8, r1
	mov r5, r8
	lsls r1, r5, 22
	lsrs r1, 22
	adds r1, 0x20
	ldr r5, _08043C1C
	adds r0, r5, 0
	ands r1, r0
	ldr r0, _08043C20
	mov r5, r8
	ands r0, r5
	orrs r0, r1
	strh r0, [r3, 0x4]
	adds r4, 0x1C
	adds r2, r4
	ldr r0, _08043C24
	str r0, [r2]
	movs r0, 0x2
_08043B4E:
	str r0, [sp]
_08043B50:
	ldr r0, _08043C28
	add r0, r10
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldr r1, _08043C2C
	adds r0, r1
	movs r1, 0x8C
	movs r2, 0x3C
	movs r3, 0
	bl CreateSpriteAtEnd
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	ldr r1, _08043C18
	mov r8, r1
	add r4, r8
	mov r0, r10
	bl battle_side_get_owner
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 21
	ldr r0, _08043C30
	adds r1, r0
	adds r0, r4, 0
	bl SetSubspriteTables
	adds r2, r4, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r2, 0x4
	mov r9, r2
	mov r1, r9
	orrs r0, r1
	strb r0, [r4, 0x5]
	movs r0, 0x1
	bl sub_8043CDC
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 17
	ldr r2, _08043C34
	adds r1, r2
	ldr r2, _08043C38
	bl CpuSet
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	add r0, r8
	strh r5, [r0, 0x38]
	mov r2, r10
	strh r2, [r0, 0x3A]
	adds r0, 0x3E
	ldrb r1, [r0]
	mov r5, r9
	orrs r1, r5
	strb r1, [r0]
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	add r0, r8
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r5
	strb r1, [r0]
	strh r6, [r4, 0x38]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x3A]
	adds r4, 0x3E
	ldrb r0, [r4]
	orrs r0, r5
	strb r0, [r4]
	adds r0, r6, 0
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08043C14: .4byte gSpriteTemplate_820A51C
_08043C18: .4byte 0x02020004
_08043C1C: .4byte 0x000003ff
_08043C20: .4byte 0xfffffc00
_08043C24: .4byte sub_8043D5C
_08043C28: .4byte 0x02024a72
_08043C2C: .4byte gSpriteTemplate_820A56C
_08043C30: .4byte gSubspriteTables_820A684
_08043C34: .4byte 0x06010000
_08043C38: .4byte REG_BG0HOFS
	thumb_func_end battle_make_oam_normal_battle

	thumb_func_start battle_make_oam_safari_battle
battle_make_oam_safari_battle: @ 8043C3C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r4, _08043CC8
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSprite
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08043CCC
	mov r9, r1
	lsls r4, r6, 4
	adds r4, r6
	lsls r4, 2
	add r4, r9
	ldrb r3, [r4, 0x1]
	movs r2, 0x3F
	adds r1, r2, 0
	ands r1, r3
	strb r1, [r4, 0x1]
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	mov r7, r9
	adds r5, r3, r7
	ldrb r1, [r5, 0x1]
	ands r2, r1
	strb r2, [r5, 0x1]
	ldrh r1, [r5, 0x4]
	mov r8, r1
	mov r7, r8
	lsls r2, r7, 22
	lsrs r2, 22
	adds r2, 0x40
	ldr r7, _08043CD0
	adds r1, r7, 0
	ands r2, r1
	ldr r1, _08043CD4
	mov r7, r8
	ands r1, r7
	orrs r1, r2
	strh r1, [r5, 0x4]
	strh r0, [r4, 0x6]
	strh r6, [r5, 0x38]
	movs r0, 0x1C
	add r9, r0
	add r3, r9
	ldr r0, _08043CD8
	str r0, [r3]
	adds r0, r6, 0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08043CC8: .4byte gSpriteTemplate_820A54C
_08043CCC: .4byte 0x02020004
_08043CD0: .4byte 0x000003ff
_08043CD4: .4byte 0xfffffc00
_08043CD8: .4byte sub_8043D5C
	thumb_func_end battle_make_oam_safari_battle

	thumb_func_start sub_8043CDC
sub_8043CDC: @ 8043CDC
	lsls r0, 24
	lsrs r0, 19
	ldr r1, _08043CE8
	adds r0, r1
	bx lr
	.align 2, 0
_08043CE8: .4byte gUnknown_08D1216C
	thumb_func_end sub_8043CDC

	thumb_func_start sub_8043CEC
sub_8043CEC: @ 8043CEC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x38]
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08043D1C
	cmp r0, 0x1
	bgt _08043D30
	cmp r0, 0
	bne _08043D30
	ldr r2, _08043D18
	lsls r3, r5, 4
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x20]
	adds r0, 0x10
	b _08043D3E
	.align 2, 0
_08043D18: .4byte 0x02020004
_08043D1C:
	ldr r2, _08043D2C
	lsls r3, r5, 4
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x20]
	adds r0, 0x10
	b _08043D3E
	.align 2, 0
_08043D2C: .4byte 0x02020004
_08043D30:
	ldr r2, _08043D58
	lsls r3, r5, 4
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x20]
	adds r0, 0x8
_08043D3E:
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x22]
	strh r0, [r4, 0x22]
	adds r0, r3, r5
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x24]
	strh r1, [r4, 0x24]
	ldrh r0, [r0, 0x26]
	strh r0, [r4, 0x26]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08043D58: .4byte 0x02020004
	thumb_func_end sub_8043CEC

	thumb_func_start sub_8043D5C
sub_8043D5C: @ 8043D5C
	ldrh r1, [r0, 0x38]
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08043D80
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x20]
	adds r1, 0x40
	strh r1, [r0, 0x20]
	ldrh r1, [r2, 0x22]
	strh r1, [r0, 0x22]
	ldrh r1, [r2, 0x24]
	strh r1, [r0, 0x24]
	ldrh r1, [r2, 0x26]
	strh r1, [r0, 0x26]
	bx lr
	.align 2, 0
_08043D80: .4byte 0x02020004
	thumb_func_end sub_8043D5C

	thumb_func_start sub_8043D84
sub_8043D84: @ 8043D84
	push {r4,r5,lr}
	ldr r5, [sp, 0xC]
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 2
	ldr r0, _08043DA8
	adds r4, r0
	strb r1, [r4]
	str r2, [r4, 0x4]
	str r3, [r4, 0x8]
	str r5, [r4, 0xC]
	ldr r0, _08043DAC
	str r0, [r4, 0x10]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08043DA8: .4byte 0x02017850
_08043DAC: .4byte 0xffff8000
	thumb_func_end sub_8043D84

	thumb_func_start sub_8043DB0
sub_8043DB0: @ 8043DB0
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08043DF8
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	adds r1, r2, 0
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r1]
	movs r0, 0x38
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	ldrh r1, [r2, 0x6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08043DF8: .4byte 0x02020004
	thumb_func_end sub_8043DB0

	thumb_func_start sub_8043DFC
sub_8043DFC: @ 8043DFC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08043E4C
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r5
	adds r4, r2, 0
	adds r4, 0x3E
	ldrb r1, [r4]
	movs r3, 0x5
	negs r3, r3
	adds r0, r3, 0
	ands r0, r1
	strb r0, [r4]
	movs r0, 0x38
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r4, [r0]
	adds r1, r3, 0
	ands r1, r4
	strb r1, [r0]
	ldrh r1, [r2, 0x6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r3, r1
	strb r3, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08043E4C: .4byte 0x02020004
	thumb_func_end sub_8043DFC

	thumb_func_start sub_8043E50
sub_8043E50: @ 8043E50
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08043E6C
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r3, r4
	strh r1, [r3, 0x20]
	strh r2, [r3, 0x22]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08043E6C: .4byte 0x02020004
	thumb_func_end sub_8043E50

	thumb_func_start unref_sub_8043E70
unref_sub_8043E70: @ 8043E70
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08043EAC
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r4, r5
	ldrh r1, [r4, 0x6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	movs r0, 0x38
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	adds r0, r4, 0
	bl DestroySprite
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08043EAC: .4byte 0x02020004
	thumb_func_end unref_sub_8043E70

	thumb_func_start nullsub_11
nullsub_11: @ 8043EB0
	bx lr
	thumb_func_end nullsub_11

	thumb_func_start sub_8043EB4
sub_8043EB4: @ 8043EB4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0
	ldr r1, _08043F38
	mov r8, r1
	ldrb r2, [r1]
	cmp r6, r2
	bge _08043F2C
	ldr r1, _08043F3C
	mov r12, r1
	movs r1, 0x3
	ands r0, r1
	lsls r5, r0, 2
	movs r7, 0xD
	negs r7, r7
	ldr r2, _08043F40
	mov r9, r2
_08043EDE:
	mov r1, r9
	adds r0, r6, r1
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r12
	ldrb r4, [r1, 0x6]
	ldrh r3, [r1, 0x38]
	lsls r3, 24
	lsrs r3, 24
	ldrb r2, [r1, 0x5]
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r5
	strb r0, [r1, 0x5]
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	add r1, r12
	ldrb r2, [r1, 0x5]
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r5
	strb r0, [r1, 0x5]
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	add r1, r12
	ldrb r2, [r1, 0x5]
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r5
	strb r0, [r1, 0x5]
	adds r6, 0x1
	mov r2, r8
	ldrb r2, [r2]
	cmp r6, r2
	blt _08043EDE
_08043F2C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043F38: .4byte 0x02024a68
_08043F3C: .4byte 0x02020004
_08043F40: .4byte 0x03004340
	thumb_func_end sub_8043EB4

	thumb_func_start sub_8043F44
sub_8043F44: @ 8043F44
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	movs r4, 0
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _08043F70
	adds r0, r6, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08043F6A
	movs r5, 0x2C
	movs r4, 0x1E
	b _08043FA8
_08043F6A:
	movs r5, 0x9E
	movs r4, 0x58
	b _08043FA8
_08043F70:
	adds r0, r6, 0
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08043F9E
	cmp r0, 0x1
	bgt _08043F88
	cmp r0, 0
	beq _08043F92
	b _08043FA8
_08043F88:
	cmp r0, 0x2
	beq _08043F98
	cmp r0, 0x3
	beq _08043FA4
	b _08043FA8
_08043F92:
	movs r5, 0x9F
	movs r4, 0x4D
	b _08043FA8
_08043F98:
	movs r5, 0xAB
	movs r4, 0x66
	b _08043FA8
_08043F9E:
	movs r5, 0x2C
	movs r4, 0x13
	b _08043FA8
_08043FA4:
	movs r5, 0x20
	movs r4, 0x2C
_08043FA8:
	ldr r0, _08043FBC
	adds r0, r6, r0
	ldrb r0, [r0]
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_8043E50
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08043FBC: .4byte 0x03004340
	thumb_func_end sub_8043F44

	thumb_func_start sub_8043FC0
sub_8043FC0: @ 8043FC0
	push {r4-r7,lr}
	sub sp, 0x20
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r1, _08044000
	mov r0, sp
	movs r2, 0x1E
	bl memcpy
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _08044010
	ldr r1, _08044004
	lsls r4, r5, 4
	adds r0, r4, r5
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	ldr r7, _08044008
	cmp r0, 0
	bne _0804402E
	ldr r7, _0804400C
	b _0804402E
	.align 2, 0
_08044000: .4byte gUnknown_0820A81C
_08044004: .4byte 0x02020004
_08044008: .4byte gUnknown_0820A80C
_0804400C: .4byte gUnknown_0820A804
_08044010:
	ldr r1, _08044040
	lsls r4, r5, 4
	adds r0, r4, r5
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	ldr r7, _08044044
	cmp r0, 0
	bne _0804402E
	ldr r7, _08044048
_0804402E:
	mov r3, sp
	adds r3, 0x6
	cmp r6, 0x64
	bne _0804404C
	adds r0, r3, 0
	movs r1, 0x64
	movs r2, 0
	movs r3, 0x3
	b _0804408C
	.align 2, 0
_08044040: .4byte 0x02020004
_08044044: .4byte gUnknown_0820A80C
_08044048: .4byte gUnknown_0820A814
_0804404C:
	movs r1, 0xFC
	strb r1, [r3]
	mov r3, sp
	adds r3, 0x7
	movs r0, 0x11
	strb r0, [r3]
	adds r3, 0x1
	movs r0, 0x1
	strb r0, [r3]
	adds r3, 0x1
	strb r1, [r3]
	adds r3, 0x1
	movs r2, 0x14
	strb r2, [r3]
	adds r3, 0x1
	movs r0, 0x4
	strb r0, [r3]
	adds r3, 0x1
	movs r0, 0xF0
	strb r0, [r3]
	adds r3, 0x1
	strb r1, [r3]
	adds r3, 0x1
	strb r2, [r3]
	adds r3, 0x1
	movs r0, 0
	strb r0, [r3]
	adds r3, 0x1
	adds r0, r3, 0
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0x2
_0804408C:
	bl ConvertIntToDecimalStringN
	adds r3, r0, 0
	movs r0, 0xFC
	strb r0, [r3]
	adds r3, 0x1
	movs r0, 0x13
	strb r0, [r3]
	adds r3, 0x1
	movs r0, 0xF
	strb r0, [r3]
	movs r0, 0xFF
	strb r0, [r3, 0x1]
	movs r0, 0x80
	lsls r0, 18
	mov r1, sp
	bl sub_80034D4
	ldr r1, _080440E0
	adds r0, r4, r5
	lsls r0, 2
	adds r6, r0, r1
	ldr r5, _080440E4
	movs r4, 0x2
_080440BC:
	ldrh r0, [r6, 0x4]
	lsls r0, 22
	lsrs r0, 17
	ldm r7!, {r1}
	adds r1, r0
	adds r0, r5, 0
	ldr r2, _080440E8
	bl CpuSet
	adds r5, 0x40
	subs r4, 0x1
	cmp r4, 0
	bne _080440BC
	add sp, 0x20
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080440E0: .4byte 0x02020004
_080440E4: .4byte 0x02000020
_080440E8: .4byte REG_BG0CNT
	thumb_func_end sub_8043FC0

	thumb_func_start sub_80440EC
sub_80440EC: @ 80440EC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	ldr r1, _08044144
	mov r0, sp
	movs r2, 0x14
	bl memcpy
	ldr r1, _08044148
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	adds r4, r0, r1
	movs r0, 0x3A
	ldrsh r5, [r4, r0]
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08044136
	lsls r0, r5, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0804414C
_08044136:
	lsls r1, r6, 16
	asrs r1, 16
	adds r0, r7, 0
	mov r2, r8
	bl sub_8044210
	b _080441F0
	.align 2, 0
_08044144: .4byte gUnknown_0820A864
_08044148: .4byte 0x02020004
_0804414C:
	mov r5, sp
	adds r5, 0x6
	mov r0, r8
	cmp r0, 0
	bne _08044190
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	ldr r4, _08044188
	cmp r0, 0
	bne _0804416A
	ldr r4, _0804418C
_0804416A:
	movs r0, 0x3
	mov r8, r0
	lsls r1, r6, 16
	asrs r1, 16
	adds r0, r5, 0
	movs r2, 0x13
	movs r3, 0x1
	bl sub_8003504
	adds r5, r0, 0
	movs r0, 0xBA
	strb r0, [r5]
	movs r0, 0xFF
	strb r0, [r5, 0x1]
	b _080441B6
	.align 2, 0
_08044188: .4byte gUnknown_0820A848
_0804418C: .4byte gUnknown_0820A83C
_08044190:
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	ldr r4, _080441FC
	cmp r0, 0
	bne _080441A4
	ldr r4, _08044200
_080441A4:
	movs r0, 0x2
	mov r8, r0
	lsls r1, r6, 16
	asrs r1, 16
	adds r0, r5, 0
	movs r2, 0xF
	movs r3, 0x1
	bl sub_8003504
_080441B6:
	movs r0, 0x80
	lsls r0, 18
	mov r1, sp
	bl sub_80034D4
	mov r0, r8
	cmp r0, 0
	beq _080441F0
	ldr r1, _08044204
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	adds r6, r0, r1
	adds r7, r4, 0
	ldr r5, _08044208
	mov r4, r8
_080441D6:
	ldrh r0, [r6, 0x4]
	lsls r0, 22
	lsrs r0, 17
	ldm r7!, {r1}
	adds r1, r0
	adds r0, r5, 0
	ldr r2, _0804420C
	bl CpuSet
	adds r5, 0x40
	subs r4, 0x1
	cmp r4, 0
	bne _080441D6
_080441F0:
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080441FC: .4byte gUnknown_0820A85C
_08044200: .4byte gUnknown_0820A854
_08044204: .4byte 0x02020004
_08044208: .4byte 0x02000020
_0804420C: .4byte REG_BG0CNT
	thumb_func_end sub_80440EC

	thumb_func_start sub_8044210
sub_8044210: @ 8044210
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 16
	lsrs r6, r1, 16
	mov r9, r6
	lsls r2, 24
	lsrs r7, r2, 24
	ldr r1, _0804427C
	mov r0, sp
	movs r2, 0x14
	bl memcpy
	ldr r1, _08044280
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	mov r8, r0
	movs r1, 0x3A
	ldrsh r4, [r0, r1]
	lsls r0, r4, 2
	ldr r1, _08044284
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08044312
	mov r2, sp
	adds r2, 0x6
	cmp r7, 0
	bne _0804428C
	ldr r7, _08044288
	movs r0, 0x6
	mov r10, r0
	lsls r1, r6, 16
	asrs r1, 16
	adds r0, r2, 0
	movs r2, 0x2B
	movs r3, 0x1
	bl sub_8003504
	adds r2, r0, 0
	movs r0, 0xBA
	strb r0, [r2]
	movs r0, 0xFF
	strb r0, [r2, 0x1]
	b _080442CE
	.align 2, 0
_0804427C: .4byte gUnknown_0820A89C
_08044280: .4byte 0x02020004
_08044284: .4byte 0x02017800
_08044288: .4byte gUnknown_0820A87C
_0804428C:
	ldr r7, _08044324
	movs r1, 0x2
	mov r10, r1
	mov r0, r9
	lsls r1, r0, 16
	asrs r1, 16
	adds r0, r2, 0
	movs r2, 0xF
	movs r3, 0x1
	bl sub_8003504
	lsls r0, r4, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080442CE
	movs r0, 0x74
	bl sub_8043CDC
	mov r2, r8
	ldrh r1, [r2, 0x4]
	lsls r1, 22
	lsrs r1, 17
	movs r2, 0xD0
	lsls r2, 3
	adds r1, r2
	ldr r2, _08044328
	adds r1, r2
	ldr r2, _0804432C
	bl CpuSet
_080442CE:
	ldr r6, _08044330
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r6
	movs r1, 0x38
	ldrsh r4, [r0, r1]
	movs r0, 0x80
	lsls r0, 18
	mov r1, sp
	bl sub_80034D4
	mov r2, r10
	cmp r2, 0
	beq _08044312
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r6, r0, r6
	ldr r5, _08044334
	mov r4, r10
_080442F8:
	ldrh r0, [r6, 0x4]
	lsls r0, 22
	lsrs r0, 17
	ldm r7!, {r1}
	adds r1, r0
	adds r0, r5, 0
	ldr r2, _0804432C
	bl CpuSet
	adds r5, 0x40
	subs r4, 0x1
	cmp r4, 0
	bne _080442F8
_08044312:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044324: .4byte gUnknown_0820A894
_08044328: .4byte 0x06010000
_0804432C: .4byte REG_BG0CNT
_08044330: .4byte 0x02020004
_08044334: .4byte 0x02000020
	thumb_func_end sub_8044210

	thumb_func_start sub_8044338
sub_8044338: @ 8044338
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x14]
	ldr r1, _080443CC
	mov r0, sp
	movs r2, 0x14
	bl memcpy
	ldr r1, _080443D0
	ldr r2, [sp, 0x14]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 7
	ldr r3, _080443D4
	adds r6, r1, r3
	movs r0, 0x5
	mov r8, r0
	adds r0, r4, 0
	bl GetNature
	lsls r0, 24
	mov r4, sp
	adds r4, 0x6
	ldr r1, _080443D8
	lsrs r0, 22
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl StringCopy
	adds r0, r6, 0
	mov r1, sp
	bl sub_80034D4
	movs r7, 0x6
	movs r5, 0
	mov r1, sp
	adds r1, 0x9
	str r1, [sp, 0x1C]
_080443AA:
	mov r2, sp
	adds r0, r2, r7
	ldrb r1, [r0]
	adds r0, r1, 0
	subs r0, 0x37
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bls _080443C8
	adds r0, r1, 0
	adds r0, 0x79
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _080443DC
_080443C8:
	movs r0, 0x2C
	b _080443FA
	.align 2, 0
_080443CC: .4byte gUnknown_0820A864
_080443D0: .4byte 0x02020004
_080443D4: .4byte 0x02000520
_080443D8: .4byte gNatureNames
_080443DC:
	adds r0, r1, 0
	subs r0, 0x4B
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080443F4
	adds r0, r1, 0
	adds r0, 0x65
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080443F8
_080443F4:
	movs r0, 0x2D
	b _080443FA
_080443F8:
	movs r0, 0x2B
_080443FA:
	bl sub_8043CDC
	lsls r1, r5, 6
	adds r1, r6, r1
	ldr r2, _080444F8
	bl CpuSet
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, 0x1
	cmp r5, r8
	bcc _080443AA
	movs r7, 0x1
	ldr r3, [sp, 0x14]
	lsls r3, 4
	str r3, [sp, 0x18]
	movs r0, 0x1
	add r0, r8
	mov r9, r0
	cmp r7, r9
	bge _08044486
	ldr r1, _080444FC
	ldr r2, _080444F8
	mov r10, r2
	ldr r2, [sp, 0x14]
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r1
	mov r8, r0
_08044436:
	mov r3, r8
	ldrh r0, [r3, 0x4]
	lsls r0, 22
	lsrs r0, 22
	adds r5, r7, 0
	cmp r7, 0
	bge _08044446
	adds r5, r7, 0x7
_08044446:
	asrs r5, 3
	lsls r4, r5, 3
	subs r4, r7, r4
	adds r0, r4
	lsls r5, 6
	adds r0, r5
	lsls r0, 5
	ldr r2, _08044500
	adds r1, r0, r2
	adds r0, r6, 0
	mov r2, r10
	bl CpuSet
	adds r6, 0x20
	mov r3, r8
	ldrh r0, [r3, 0x4]
	lsls r0, 22
	lsrs r0, 22
	adds r4, 0x8
	adds r0, r4
	adds r0, r5
	lsls r0, 5
	ldr r2, _08044500
	adds r1, r0, r2
	adds r0, r6, 0
	mov r2, r10
	bl CpuSet
	adds r6, 0x20
	adds r7, 0x1
	cmp r7, r9
	blt _08044436
_08044486:
	ldr r6, _080444FC
	ldr r3, [sp, 0x18]
	ldr r1, [sp, 0x14]
	adds r0, r3, r1
	lsls r0, 2
	adds r0, r6
	ldrh r5, [r0, 0x38]
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _08044504
	ldr r2, _08044508
	adds r0, r4, r2
	ldrb r1, [r0]
	mov r0, sp
	adds r0, 0x6
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r3, _0804450C
	adds r4, r3
	ldrb r1, [r4]
	ldr r0, [sp, 0x1C]
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	mov r1, sp
	movs r0, 0
	strb r0, [r1, 0x5]
	movs r0, 0xBA
	strb r0, [r1, 0x8]
	movs r0, 0x80
	lsls r0, 18
	bl sub_80034D4
	movs r7, 0
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r5, r0, r6
	ldr r4, _08044510
_080444DA:
	cmp r7, 0x1
	bgt _08044514
	ldrh r1, [r5, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r0, r7, 0x2
	adds r1, r0
	lsls r1, 5
	ldr r0, _08044500
	adds r1, r0
	adds r0, r4, 0
	ldr r2, _080444F8
	bl CpuSet
	b _0804452A
	.align 2, 0
_080444F8: .4byte REG_BG0CNT
_080444FC: .4byte 0x02020004
_08044500: .4byte 0x06010000
_08044504: .4byte 0x02000000
_08044508: .4byte 0x00016089
_0804450C: .4byte 0x00016088
_08044510: .4byte 0x02000020
_08044514:
	ldrh r1, [r5, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r1, r7, r1
	lsls r1, 5
	ldr r2, _08044544
	adds r1, r2
	adds r0, r4, 0
	ldr r2, _08044548
	bl CpuSet
_0804452A:
	adds r4, 0x40
	adds r7, 0x1
	cmp r7, 0x4
	ble _080444DA
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044544: .4byte 0x060100c0
_08044548: .4byte REG_BG0CNT
	thumb_func_end sub_8044338

	thumb_func_start sub_804454C
sub_804454C: @ 804454C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r0, 0
	mov r8, r0
	ldr r0, _0804466C
	ldrb r0, [r0]
	cmp r8, r0
	blt _08044566
	b _080447E4
_08044566:
	ldr r1, _08044670
	mov r9, r1
	movs r2, 0x64
	mov r10, r2
	ldr r7, _08044674
_08044570:
	ldr r0, _08044678
	mov r6, r8
	adds r5, r6, r0
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	mov r1, r9
	adds r1, 0x1C
	adds r0, r1
	ldr r1, [r0]
	ldr r0, _0804467C
	cmp r1, r0
	beq _0804458E
	b _080447D4
_0804458E:
	lsls r0, r6, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080445A2
	b _080447D4
_080445A2:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _080445BA
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080445BA
	b _080447D4
_080445BA:
	mov r0, r8
	lsls r3, r0, 2
	ldr r0, _08044680
	adds r3, r0
	ldr r0, [r3]
	lsls r0, 27
	lsrs r0, 31
	movs r2, 0x1
	eors r2, r0
	lsls r2, 4
	ldrb r0, [r3]
	movs r6, 0x11
	negs r6, r6
	adds r1, r6, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
	ldr r0, [r3]
	lsls r0, 27
	lsrs r6, r0, 31
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080446DC
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _080445FA
	b _080447D4
_080445FA:
	ldr r0, _08044684
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _0804460C
	b _080447D4
_0804460C:
	cmp r6, 0x1
	bne _08044694
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldrh r0, [r0, 0x38]
	lsls r0, 24
	lsrs r1, r0, 24
	str r2, [sp]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldrh r1, [r0, 0x4]
	lsls r1, 22
	lsrs r1, 17
	ldr r0, _08044688
	adds r1, r0
	mov r0, sp
	ldr r2, _0804468C
	bl CpuSet
	ldrb r4, [r5]
	ldrh r0, [r7]
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	ldr r2, _08044690
	adds r0, r2
	movs r1, 0x39
	bl PokemonGetField
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	movs r2, 0
	bl sub_8044210
	ldrb r4, [r5]
	ldrh r0, [r7]
	mov r6, r10
	muls r6, r0
	adds r0, r6, 0
	ldr r1, _08044690
	b _08044766
	.align 2, 0
_0804466C: .4byte 0x02024a68
_08044670: .4byte 0x02020004
_08044674: .4byte 0x02024a6a
_08044678: .4byte 0x03004340
_0804467C: .4byte SpriteCallbackDummy
_08044680: .4byte 0x02017800
_08044684: .4byte 0x020239f8
_08044688: .4byte 0x06010000
_0804468C: .4byte 0x05000040
_08044690: .4byte 0x03004360
_08044694:
	ldrb r0, [r5]
	bl draw_status_ailment_maybe
	ldrb r0, [r5]
	ldrh r1, [r7]
	mov r2, r10
	muls r2, r1
	adds r1, r2, 0
	ldr r6, _080446D0
	adds r1, r6
	movs r2, 0x5
	bl sub_8045A5C
	movs r0, 0x75
	bl sub_8043CDC
	ldrb r2, [r5]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r9
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 17
	ldr r2, _080446D4
	adds r1, r2
	ldr r2, _080446D8
	bl CpuSet
	b _080447BE
	.align 2, 0
_080446D0: .4byte 0x03004360
_080446D4: .4byte 0x06010680
_080446D8: .4byte REG_BG0CNT
_080446DC:
	cmp r6, 0x1
	bne _0804478C
	ldr r0, _08044704
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _0804470C
	ldrb r0, [r5]
	ldrh r1, [r7]
	mov r6, r10
	muls r6, r1
	adds r1, r6, 0
	ldr r2, _08044708
	adds r1, r2
	bl sub_8044338
	b _080447BE
	.align 2, 0
_08044704: .4byte 0x020239f8
_08044708: .4byte 0x030045c0
_0804470C:
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldrh r0, [r0, 0x38]
	lsls r0, 24
	lsrs r1, r0, 24
	str r2, [sp]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldrh r1, [r0, 0x4]
	lsls r1, 22
	lsrs r1, 17
	ldr r6, _08044780
	adds r1, r6
	mov r0, sp
	ldr r2, _08044784
	bl CpuSet
	ldrb r4, [r5]
	ldrh r0, [r7]
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	ldr r2, _08044788
	adds r0, r2
	movs r1, 0x39
	bl PokemonGetField
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	movs r2, 0
	bl sub_8044210
	ldrb r4, [r5]
	ldrh r0, [r7]
	mov r6, r10
	muls r6, r0
	adds r0, r6, 0
	ldr r1, _08044788
_08044766:
	adds r0, r1
	movs r1, 0x3A
	bl PokemonGetField
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	movs r2, 0x1
	bl sub_8044210
	b _080447BE
	.align 2, 0
_08044780: .4byte 0x06010000
_08044784: .4byte 0x05000040
_08044788: .4byte 0x030045c0
_0804478C:
	ldrb r0, [r5]
	bl draw_status_ailment_maybe
	ldrb r0, [r5]
	ldrh r1, [r7]
	movs r6, 0x64
	muls r1, r6
	ldr r4, _080447F4
	adds r1, r4
	movs r2, 0x5
	bl sub_8045A5C
	ldr r0, _080447F8
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080447BE
	ldrb r0, [r5]
	ldrh r1, [r7]
	muls r1, r6
	adds r1, r4
	movs r2, 0x4
	bl sub_8045A5C
_080447BE:
	ldr r0, _080447FC
	add r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldrh r1, [r0, 0x3C]
	movs r2, 0x1
	eors r1, r2
	strh r1, [r0, 0x3C]
_080447D4:
	adds r7, 0x2
	movs r2, 0x1
	add r8, r2
	ldr r0, _08044800
	ldrb r0, [r0]
	cmp r8, r0
	bge _080447E4
	b _08044570
_080447E4:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080447F4: .4byte 0x030045c0
_080447F8: .4byte 0x020239f8
_080447FC: .4byte 0x03004340
_08044800: .4byte 0x02024a68
	thumb_func_end sub_804454C

	thumb_func_start sub_8044804
sub_8044804: @ 8044804
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	str r1, [sp, 0xC]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
	lsls r2, 24
	lsrs r2, 24
	adds r4, r2, 0
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x10]
	cmp r4, 0
	beq _08044834
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _08044878
_08044834:
	ldr r0, [sp, 0x8]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08044854
	movs r7, 0
	movs r1, 0x88
	movs r2, 0x60
	movs r0, 0x64
	mov r8, r0
	ldr r5, _08044850
	b _08044884
	.align 2, 0
_08044850: .4byte 0x0000fffb
_08044854:
	movs r7, 0x1
	cmp r4, 0
	beq _08044864
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _0804486A
_08044864:
	movs r1, 0x68
	movs r2, 0x28
	b _0804486E
_0804486A:
	movs r1, 0x68
	movs r2, 0x10
_0804486E:
	ldr r3, _08044874
	mov r8, r3
	b _08044882
	.align 2, 0
_08044874: .4byte 0x0000ff9c
_08044878:
	movs r7, 0x1
	movs r1, 0x68
	movs r2, 0x28
	ldr r5, _08044930
	mov r8, r5
_08044882:
	movs r5, 0x5
_08044884:
	movs r6, 0
	str r6, [sp, 0x14]
	lsls r4, r7, 3
	ldr r0, _08044934
	mov r10, r0
	lsls r3, r7, 1
	mov r9, r3
	lsls r1, 16
	str r1, [sp, 0x20]
	lsls r2, 16
	str r2, [sp, 0x24]
	ldr r2, _08044938
	ldr r1, [sp, 0xC]
	movs r6, 0x5
_080448A0:
	ldrh r0, [r1]
	cmp r0, r2
	beq _080448B4
	ldr r3, [sp, 0x14]
	lsls r0, r3, 24
	movs r3, 0x80
	lsls r3, 17
	adds r0, r3
	lsrs r0, 24
	str r0, [sp, 0x14]
_080448B4:
	adds r1, 0x8
	subs r6, 0x1
	cmp r6, 0
	bge _080448A0
	mov r6, r10
	adds r0, r4, r6
	bl LoadCompressedObjectPic
	ldr r0, _0804493C
	adds r0, r4, r0
	bl LoadSpriteSheet
	ldr r0, _08044940
	adds r0, r4, r0
	bl LoadSpritePalette
	ldr r0, _08044944
	adds r0, r4, r0
	bl LoadSpritePalette
	mov r1, r9
	adds r0, r1, r7
	lsls r0, 3
	ldr r1, _08044948
	adds r0, r1
	ldr r2, [sp, 0x20]
	asrs r1, r2, 16
	ldr r3, [sp, 0x24]
	asrs r2, r3, 16
	movs r3, 0xA
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x18]
	lsls r0, 4
	ldr r6, [sp, 0x18]
	adds r0, r6
	lsls r0, 2
	ldr r1, _0804494C
	adds r4, r0, r1
	ldr r1, _08044950
	adds r0, r4, 0
	bl SetSubspriteTables
	mov r0, r8
	strh r0, [r4, 0x24]
	strh r5, [r4, 0x2E]
	cmp r7, 0
	beq _08044954
	ldrh r0, [r4, 0x20]
	subs r0, 0x60
	strh r0, [r4, 0x20]
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r4, 0x3]
	b _0804495A
	.align 2, 0
_08044930: .4byte 0x0000ff9c
_08044934: .4byte gUnknown_0820A754
_08044938: .4byte 0x0000ffff
_0804493C: .4byte gUnknown_0820A784
_08044940: .4byte gUnknown_0820A764
_08044944: .4byte gUnknown_0820A774
_08044948: .4byte gSpriteTemplate_820A7A4
_0804494C: .4byte 0x02020004
_08044950: .4byte gSubspriteTables_820A6E4
_08044954:
	ldrh r0, [r4, 0x20]
	adds r0, 0x60
	strh r0, [r4, 0x20]
_0804495A:
	movs r6, 0
	ldr r1, _08044A04
	mov r10, r1
	mov r4, sp
	mov r2, r9
	adds r0, r2, r7
	lsls r0, 3
	str r0, [sp, 0x1C]
	movs r3, 0xA
	mov r9, r3
	mov r8, r6
_08044970:
	ldr r0, _08044A08
	ldr r5, [sp, 0x24]
	ldr r1, _08044A0C
	adds r2, r5, r1
	ldr r3, [sp, 0x1C]
	adds r0, r3, r0
	ldr r5, [sp, 0x20]
	asrs r1, r5, 16
	asrs r2, 16
	movs r3, 0x9
	bl CreateSpriteAtEnd
	strb r0, [r4]
	ldr r0, [sp, 0x10]
	cmp r0, 0
	bne _080449A0
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r2, _08044A10
	adds r1, r2
	ldr r0, _08044A14
	str r0, [r1]
_080449A0:
	ldr r5, _08044A04
	cmp r7, 0
	bne _080449BE
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	strh r7, [r0, 0x24]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	strh r7, [r0, 0x26]
_080449BE:
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0
	mov r3, sp
	ldrh r3, [r3, 0x18]
	strh r3, [r0, 0x2E]
	cmp r7, 0
	bne _08044A18
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrh r0, [r1, 0x20]
	adds r0, 0x18
	add r0, r8
	strh r0, [r1, 0x20]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r9
	strh r1, [r0, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x78
	b _08044A56
	.align 2, 0
_08044A04: .4byte 0x02020004
_08044A08: .4byte gSpriteTemplate_820A7D4
_08044A0C: .4byte 0xfffc0000
_08044A10: .4byte 0x02020020
_08044A14: .4byte sub_8045180
_08044A18:
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r5
	ldrh r3, [r2, 0x20]
	subs r3, 0x18
	movs r1, 0x5
	subs r1, r6
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 1
	subs r3, r0
	strh r3, [r2, 0x20]
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r5
	movs r1, 0x6
	subs r1, r6
	lsls r0, r1, 3
	subs r0, r1
	adds r0, 0xA
	strh r0, [r2, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08044AC4
_08044A56:
	strh r1, [r0, 0x24]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r7, [r0, 0x32]
	adds r4, 0x1
	movs r2, 0x7
	add r9, r2
	movs r3, 0xA
	add r8, r3
	adds r6, 0x1
	cmp r6, 0x5
	bgt _08044A76
	b _08044970
_08044A76:
	ldr r0, [sp, 0x8]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08044B5E
	movs r6, 0
	ldr r5, _08044AC8
	mov r10, r5
	ldr r0, _08044ACC
	mov r9, r0
	ldr r7, _08044AD0
	ldr r1, _08044AD4
	mov r12, r1
	ldr r2, _08044AD8
	mov r8, r2
	mov r4, sp
	ldr r5, [sp, 0xC]
_08044A9A:
	mov r3, r10
	ldrh r1, [r3]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08044ADC
	ldrh r0, [r5]
	cmp r0, r9
	beq _08044AE6
	cmp r0, 0
	bne _08044B2E
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x3
	b _08044B46
	.align 2, 0
_08044AC4: .4byte 0x0000ff88
_08044AC8: .4byte 0x020239f8
_08044ACC: .4byte 0x0000ffff
_08044AD0: .4byte 0x02020004
_08044AD4: .4byte 0x000003ff
_08044AD8: .4byte 0xfffffc00
_08044ADC:
	ldr r1, [sp, 0x14]
	lsls r0, r1, 24
	asrs r0, 24
	cmp r6, r0
	blt _08044B14
_08044AE6:
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x1
	mov r0, r12
	ands r1, r0
	mov r0, r8
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	movs r1, 0x1
	strh r1, [r0, 0x3C]
	b _08044B52
_08044B14:
	ldrh r0, [r5]
	cmp r0, 0
	bne _08044B2E
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x3
	b _08044B46
_08044B2E:
	ldr r0, [r5, 0x4]
	cmp r0, 0
	beq _08044B52
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x2
_08044B46:
	mov r0, r12
	ands r1, r0
	mov r0, r8
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
_08044B52:
	adds r4, 0x1
	adds r5, 0x8
	adds r6, 0x1
	cmp r6, 0x5
	ble _08044A9A
	b _08044C38
_08044B5E:
	movs r6, 0
	ldr r1, _08044BA4
	mov r10, r1
	ldr r2, _08044BA8
	mov r9, r2
	ldr r7, _08044BAC
	ldr r3, _08044BB0
	mov r12, r3
	ldr r5, _08044BB4
	mov r8, r5
	ldr r5, [sp, 0xC]
	mov r4, sp
	adds r4, 0x5
_08044B78:
	mov r0, r10
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08044BB8
	ldrh r0, [r5]
	cmp r0, r9
	beq _08044BC2
	cmp r0, 0
	bne _08044C0A
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x3
	b _08044C22
	.align 2, 0
_08044BA4: .4byte 0x020239f8
_08044BA8: .4byte 0x0000ffff
_08044BAC: .4byte 0x02020004
_08044BB0: .4byte 0x000003ff
_08044BB4: .4byte 0xfffffc00
_08044BB8:
	ldr r1, [sp, 0x14]
	lsls r0, r1, 24
	asrs r0, 24
	cmp r6, r0
	blt _08044BF0
_08044BC2:
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x1
	mov r0, r12
	ands r1, r0
	mov r0, r8
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	movs r1, 0x1
	strh r1, [r0, 0x3C]
	b _08044C2E
_08044BF0:
	ldrh r0, [r5]
	cmp r0, 0
	bne _08044C0A
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x3
	b _08044C22
_08044C0A:
	ldr r0, [r5, 0x4]
	cmp r0, 0
	beq _08044C2E
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x2
_08044C22:
	mov r0, r12
	ands r1, r0
	mov r0, r8
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
_08044C2E:
	subs r4, 0x1
	adds r5, 0x8
	adds r6, 0x1
	cmp r6, 0x5
	ble _08044B78
_08044C38:
	ldr r0, _08044C98
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _08044C9C
	lsls r3, r4, 2
	adds r1, r3, r4
	lsls r1, 3
	adds r0, r1, r2
	mov r5, sp
	ldrh r5, [r5, 0x8]
	strh r5, [r0, 0x8]
	mov r6, sp
	ldrh r6, [r6, 0x18]
	strh r6, [r0, 0xA]
	movs r6, 0
	adds r0, r2, 0
	adds r0, 0xE
	adds r1, r0
_08044C62:
	mov r5, sp
	adds r0, r5, r6
	ldrb r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	adds r6, 0x1
	cmp r6, 0x5
	ble _08044C62
	adds r0, r3, r4
	lsls r0, 3
	adds r0, r2
	ldrh r6, [r5, 0x10]
	strh r6, [r0, 0x1C]
	movs r0, 0x72
	movs r1, 0
	bl audio_play_and_stuff
	adds r0, r4, 0
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08044C98: .4byte TaskDummy
_08044C9C: .4byte 0x03004b20
	thumb_func_end sub_8044804

	thumb_func_start sub_8044CA0
sub_8044CA0: @ 8044CA0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r2, _08044DB4
	lsls r3, r0, 2
	adds r1, r3, r0
	lsls r1, 3
	adds r0, r1, r2
	ldrb r4, [r0, 0x1C]
	mov r9, r4
	ldrb r4, [r0, 0xA]
	mov r10, r4
	ldrb r0, [r0, 0x8]
	str r0, [sp, 0x8]
	movs r5, 0
	adds r7, r2, 0
	ldr r0, _08044DB8
	mov r12, r0
	str r3, [sp, 0xC]
	adds r0, r7, 0
	adds r0, 0xE
	adds r2, r1, r0
_08044CD8:
	mov r4, sp
	adds r1, r4, r5
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, 0x2
	adds r5, 0x1
	cmp r5, 0x5
	ble _08044CD8
	ldr r1, _08044DBC
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x10
	strh r0, [r1]
	ldr r0, [sp, 0xC]
	add r0, r8
	lsls r0, 3
	adds r0, r7
	movs r1, 0x10
	strh r1, [r0, 0x26]
	movs r5, 0
	mov r4, r10
	lsls r4, 4
	str r4, [sp, 0x10]
	ldr r4, _08044DB8
	movs r6, 0xD
	negs r6, r6
	movs r3, 0x4
_08044D14:
	mov r1, sp
	adds r0, r1, r5
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0x1]
	adds r0, r6, 0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x1]
	adds r5, 0x1
	cmp r5, 0x5
	ble _08044D14
	ldr r2, [sp, 0x10]
	add r2, r10
	lsls r2, 2
	add r2, r12
	ldrb r1, [r2, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x1]
	mov r2, r9
	cmp r2, 0
	bne _08044D50
	b _08044E54
_08044D50:
	movs r5, 0
	mov r6, r12
	mov r9, r5
	adds r3, r6, 0
	adds r3, 0x1C
	mov r4, sp
	movs r7, 0
_08044D5E:
	ldr r0, [sp, 0x8]
	str r3, [sp, 0x14]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r3, [sp, 0x14]
	cmp r2, 0
	beq _08044DC4
	movs r0, 0x5
	subs r0, r5
	mov r1, sp
	adds r2, r1, r0
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r7, [r0, 0x30]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	mov r1, r9
	strh r1, [r0, 0x34]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	mov r1, r9
	strh r1, [r0, 0x36]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, _08044DC0
	str r1, [r0]
	ldr r2, _08044DB8
	mov r12, r2
	b _08044DFA
	.align 2, 0
_08044DB4: .4byte 0x03004b20
_08044DB8: .4byte 0x02020004
_08044DBC: .4byte REG_BLDCNT
_08044DC0: .4byte sub_8045110
_08044DC4:
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r7, [r0, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r2, [r0, 0x34]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r2, [r0, 0x36]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, _08044E3C
	str r1, [r0]
	ldr r0, _08044E40
	mov r12, r0
_08044DFA:
	adds r4, 0x1
	adds r7, 0x7
	adds r5, 0x1
	cmp r5, 0x5
	ble _08044D5E
	ldr r3, [sp, 0x10]
	add r3, r10
	lsls r3, 2
	mov r1, r12
	adds r0, r3, r1
	movs r2, 0x2E
	ldrsh r1, [r0, r2]
	lsrs r2, r1, 31
	adds r1, r2
	asrs r1, 1
	movs r2, 0
	strh r1, [r0, 0x2E]
	strh r2, [r0, 0x30]
	mov r1, r12
	adds r1, 0x1C
	adds r3, r1
	ldr r1, _08044E44
	str r1, [r3]
	ldr r1, _08044E48
	bl SetSubspriteTables
	ldr r1, _08044E4C
	ldr r0, [sp, 0xC]
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _08044E50
	b _08044E5E
	.align 2, 0
_08044E3C: .4byte sub_8045110
_08044E40: .4byte 0x02020004
_08044E44: .4byte sub_8045048
_08044E48: .4byte gSubspriteTables_820A6EC
_08044E4C: .4byte 0x03004b20
_08044E50: .4byte sub_8044E74
_08044E54:
	ldr r0, [sp, 0xC]
	add r0, r8
	lsls r0, 3
	adds r0, r7
	ldr r1, _08044E70
_08044E5E:
	str r1, [r0]
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044E70: .4byte sub_8044F70
	thumb_func_end sub_8044CA0

	thumb_func_start sub_8044E74
sub_8044E74: @ 8044E74
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08044EC0
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r3, r1, r2
	ldrh r0, [r3, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r3, 0x1E]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08044EAE
	ldrh r0, [r3, 0x26]
	subs r2, r0, 0x1
	strh r2, [r3, 0x26]
	lsls r0, r2, 16
	cmp r0, 0
	blt _08044EBA
	ldr r1, _08044EC4
	movs r0, 0x10
	subs r0, r2
	lsls r0, 8
	orrs r2, r0
	strh r2, [r1]
_08044EAE:
	movs r1, 0x26
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _08044EBA
	ldr r0, _08044EC8
	str r0, [r3]
_08044EBA:
	pop {r0}
	bx r0
	.align 2, 0
_08044EC0: .4byte 0x03004b20
_08044EC4: .4byte REG_BLDALPHA
_08044EC8: .4byte sub_8044ECC
	thumb_func_end sub_8044E74

	thumb_func_start sub_8044ECC
sub_8044ECC: @ 8044ECC
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r6, _08044F44
	lsls r0, r3, 2
	adds r0, r3
	lsls r4, r0, 3
	adds r1, r4, r6
	ldrh r0, [r1, 0x26]
	subs r0, 0x1
	movs r5, 0
	strh r0, [r1, 0x26]
	lsls r0, 16
	asrs r2, r0, 16
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	bne _08044F4C
	ldrb r3, [r1, 0xA]
	adds r0, r6, 0
	adds r0, 0xE
	adds r2, r4, r0
_08044EFA:
	mov r0, sp
	adds r1, r0, r5
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, 0x2
	adds r5, 0x1
	cmp r5, 0x5
	ble _08044EFA
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	ldr r4, _08044F48
	adds r0, r4
	bl DestroySpriteAndFreeResources
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySpriteAndFreeResources
	movs r5, 0x1
_08044F2A:
	mov r1, sp
	adds r0, r1, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	adds r5, 0x1
	cmp r5, 0x5
	ble _08044F2A
	b _08044F62
	.align 2, 0
_08044F44: .4byte 0x03004b20
_08044F48: .4byte 0x02020004
_08044F4C:
	movs r0, 0x3
	negs r0, r0
	cmp r2, r0
	bne _08044F62
	ldr r0, _08044F6C
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, r3, 0
	bl DestroyTask
_08044F62:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08044F6C: .4byte REG_BLDCNT
	thumb_func_end sub_8044ECC

	thumb_func_start sub_8044F70
sub_8044F70: @ 8044F70
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r7, _08044FA4
	lsls r0, r4, 2
	adds r0, r4
	lsls r6, r0, 3
	adds r3, r6, r7
	ldrh r0, [r3, 0x26]
	subs r2, r0, 0x1
	movs r5, 0
	strh r2, [r3, 0x26]
	lsls r0, r2, 16
	asrs r1, r0, 16
	cmp r1, 0
	blt _08044FAC
	ldr r1, _08044FA8
	movs r0, 0x10
	subs r0, r2
	lsls r0, 8
	orrs r2, r0
	strh r2, [r1]
	b _08045022
	.align 2, 0
_08044FA4: .4byte 0x03004b20
_08044FA8: .4byte REG_BLDALPHA
_08044FAC:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0804500C
	ldrb r3, [r3, 0xA]
	movs r5, 0
	adds r0, r7, 0
	adds r0, 0xE
	adds r2, r6, r0
_08044FBE:
	mov r0, sp
	adds r1, r0, r5
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, 0x2
	adds r5, 0x1
	cmp r5, 0x5
	ble _08044FBE
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	ldr r4, _08045008
	adds r0, r4
	bl DestroySpriteAndFreeResources
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySpriteAndFreeResources
	movs r5, 0x1
_08044FEE:
	mov r1, sp
	adds r0, r1, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	adds r5, 0x1
	cmp r5, 0x5
	ble _08044FEE
	b _08045022
	.align 2, 0
_08045008: .4byte 0x02020004
_0804500C:
	movs r0, 0x3
	negs r0, r0
	cmp r1, r0
	bne _08045022
	ldr r0, _0804502C
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, r4, 0
	bl DestroyTask
_08045022:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804502C: .4byte REG_BLDCNT
	thumb_func_end sub_8044F70

	thumb_func_start sub_8045030
sub_8045030: @ 8045030
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x24]
	movs r3, 0x24
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _08045044
	ldrh r0, [r1, 0x2E]
	adds r0, r2, r0
	strh r0, [r1, 0x24]
_08045044:
	pop {r0}
	bx r0
	thumb_func_end sub_8045030

	thumb_func_start sub_8045048
sub_8045048: @ 8045048
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	adds r1, r0, 0
	adds r1, 0x20
	strh r1, [r2, 0x30]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	cmp r0, 0
	ble _08045066
	lsls r0, r1, 16
	asrs r0, 20
	ldrh r1, [r2, 0x24]
	adds r0, r1
	b _0804506E
_08045066:
	lsls r1, 16
	asrs r1, 20
	ldrh r0, [r2, 0x24]
	subs r0, r1
_0804506E:
	strh r0, [r2, 0x24]
	ldrh r1, [r2, 0x30]
	movs r0, 0xF
	ands r0, r1
	strh r0, [r2, 0x30]
	pop {r0}
	bx r0
	thumb_func_end sub_8045048

	thumb_func_start sub_804507C
sub_804507C: @ 804507C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _08045090
	subs r0, r1, 0x1
	strh r0, [r4, 0x30]
	b _08045106
_08045090:
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r3, r0, 24
	ldrh r2, [r4, 0x34]
	adds r0, r2, 0
	adds r0, 0x38
	lsls r1, r0, 16
	lsrs r2, r1, 16
	ldr r0, _080450C0
	ands r2, r0
	strh r2, [r4, 0x34]
	cmp r3, 0
	beq _080450C4
	lsrs r0, r1, 20
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	lsls r0, 16
	cmp r0, 0
	ble _080450D4
	movs r0, 0
	strh r0, [r4, 0x24]
	b _080450D4
	.align 2, 0
_080450C0: .4byte 0x0000fff0
_080450C4:
	lsrs r1, 20
	ldrh r0, [r4, 0x24]
	subs r0, r1
	strh r0, [r4, 0x24]
	lsls r0, 16
	cmp r0, 0
	bge _080450D4
	strh r3, [r4, 0x24]
_080450D4:
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _08045106
	movs r1, 0x3F
	cmp r3, 0
	beq _080450E4
	movs r1, 0xC0
_080450E4:
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080450F8
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x74
	bl sub_807552C
	b _08045102
_080450F8:
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x73
	bl sub_80754F8
_08045102:
	ldr r0, _0804510C
	str r0, [r4, 0x1C]
_08045106:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804510C: .4byte SpriteCallbackDummy
	thumb_func_end sub_804507C

	thumb_func_start sub_8045110
sub_8045110: @ 8045110
	push {r4,lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x30]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r0, 0
	ble _08045124
	subs r0, r1, 0x1
	strh r0, [r3, 0x30]
	b _08045174
_08045124:
	ldrh r0, [r3, 0x32]
	lsls r0, 24
	ldrh r2, [r3, 0x34]
	adds r1, r2, 0
	adds r1, 0x38
	lsls r4, r1, 16
	lsrs r2, r4, 16
	ldr r1, _08045144
	ands r2, r1
	strh r2, [r3, 0x34]
	cmp r0, 0
	beq _08045148
	lsrs r0, r4, 20
	ldrh r1, [r3, 0x24]
	adds r0, r1
	b _0804514E
	.align 2, 0
_08045144: .4byte 0x0000fff0
_08045148:
	lsrs r1, r4, 20
	ldrh r0, [r3, 0x24]
	subs r0, r1
_0804514E:
	strh r0, [r3, 0x24]
	movs r2, 0x24
	ldrsh r0, [r3, r2]
	movs r2, 0x20
	ldrsh r1, [r3, r2]
	adds r0, r1
	adds r0, 0x8
	movs r1, 0x80
	lsls r1, 1
	cmp r0, r1
	bls _08045174
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0804517C
	str r0, [r3, 0x1C]
_08045174:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804517C: .4byte SpriteCallbackDummy
	thumb_func_end sub_8045110

	thumb_func_start sub_8045180
sub_8045180: @ 8045180
	ldrh r2, [r0, 0x2E]
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _0804519C
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	ldrh r2, [r1, 0x24]
	strh r2, [r0, 0x24]
	ldrh r1, [r1, 0x26]
	strh r1, [r0, 0x26]
	bx lr
	.align 2, 0
_0804519C: .4byte 0x02020004
	thumb_func_end sub_8045180

	thumb_func_start sub_80451A0
sub_80451A0: @ 80451A0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	adds r7, r1, 0
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r4, _08045238
	ldr r1, _0804523C
	adds r0, r4, 0
	bl StringCopy
	adds r0, r7, 0
	movs r1, 0x2
	mov r2, sp
	bl PokemonGetField
	mov r0, sp
	bl StringGetEnd10
	adds r4, 0x3
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy
	adds r5, r0, 0
	movs r1, 0xFC
	strb r1, [r5]
	movs r0, 0x3
	strb r0, [r5, 0x1]
	movs r0, 0x2
	strb r0, [r5, 0x2]
	strb r1, [r5, 0x3]
	movs r0, 0x1
	strb r0, [r5, 0x4]
	adds r5, 0x5
	adds r0, r7, 0
	bl pokemon_get_gender
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r7, 0
	movs r1, 0xB
	bl PokemonGetField
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r7, 0
	movs r1, 0x3
	bl PokemonGetField
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	mov r1, sp
	bl sub_8040D3C
	cmp r0, 0
	beq _08045222
	movs r6, 0x64
_08045222:
	cmp r6, 0
	beq _08045240
	cmp r6, 0xFE
	beq _08045248
	movs r0, 0xB
	strb r0, [r5]
	movs r0, 0xFF
	strb r0, [r5, 0x1]
	adds r5, 0x1
	b _08045256
	.align 2, 0
_08045238: .4byte 0x020238cc
_0804523C: .4byte gUnknown_0820A8B0
_08045240:
	movs r0, 0xB
	strb r0, [r5]
	movs r0, 0xB5
	b _0804524E
_08045248:
	movs r0, 0xA
	strb r0, [r5]
	movs r0, 0xB6
_0804524E:
	strb r0, [r5, 0x1]
	movs r0, 0xFF
	strb r0, [r5, 0x2]
	adds r5, 0x2
_08045256:
	movs r0, 0xFC
	strb r0, [r5]
	movs r0, 0x13
	strb r0, [r5, 0x1]
	movs r0, 0x37
	strb r0, [r5, 0x2]
	movs r0, 0xFF
	strb r0, [r5, 0x3]
	ldr r1, _080452D8
	mov r0, r9
	lsls r4, r0, 4
	adds r0, r4, r0
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 7
	ldr r2, _080452DC
	adds r5, r1, r2
	ldr r0, _080452E0
	mov r8, r0
	adds r0, r5, 0
	mov r1, r8
	bl sub_80034D4
	movs r6, 0
	movs r1, 0x7
	mov r10, r1
	adds r0, r7, 0
	movs r1, 0x3
	bl PokemonGetField
	str r4, [sp, 0xC]
	cmp r0, 0x1
	bne _08045338
	adds r0, r7, 0
	movs r1, 0x2D
	bl PokemonGetField
	cmp r0, 0
	bne _08045338
	mov r4, r8
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	beq _08045338
	adds r7, r5, 0
_080452C2:
	cmp r1, 0xFC
	bne _080452E4
	ldrb r0, [r4, 0x1]
	bl GetExtCtrlCodeLength
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	adds r4, r0
	b _08045330
	.align 2, 0
_080452D8: .4byte 0x02020004
_080452DC: .4byte 0x02000520
_080452E0: .4byte 0x020238cc
_080452E4:
	adds r0, r1, 0
	subs r0, 0x37
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bls _080452FC
	adds r0, r1, 0
	adds r0, 0x79
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _08045300
_080452FC:
	movs r0, 0x2C
	b _0804531E
_08045300:
	adds r0, r1, 0
	subs r0, 0x4B
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _08045318
	adds r0, r1, 0
	adds r0, 0x65
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _0804531C
_08045318:
	movs r0, 0x2D
	b _0804531E
_0804531C:
	movs r0, 0x2B
_0804531E:
	bl sub_8043CDC
	adds r1, r7, 0
	ldr r2, _080453C8
	bl CpuSet
	adds r7, 0x40
	adds r6, 0x1
	adds r4, 0x1
_08045330:
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _080452C2
_08045338:
	cmp r6, r10
	bge _0804535A
	lsls r0, r6, 6
	adds r4, r0, r5
	mov r2, r10
	subs r6, r2, r6
_08045344:
	movs r0, 0x2B
	bl sub_8043CDC
	adds r1, r4, 0
	ldr r2, _080453C8
	bl CpuSet
	adds r4, 0x40
	subs r6, 0x1
	cmp r6, 0
	bne _08045344
_0804535A:
	ldr r1, _080453CC
	ldr r0, [sp, 0xC]
	add r0, r9
	lsls r0, 2
	adds r6, r0, r1
	ldrh r0, [r6, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080453D4
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _080453D4
	ldr r1, _080453D0
	mov r0, r10
	cmp r0, 0
	beq _08045438
	mov r8, r6
	mov r9, r1
	ldr r7, _080453C8
	mov r6, r10
_0804538E:
	mov r1, r9
	adds r1, 0x4
	mov r9, r1
	subs r1, 0x4
	ldm r1!, {r4}
	mov r2, r8
	ldrh r0, [r2, 0x4]
	lsls r0, 22
	lsrs r0, 17
	adds r4, r0
	adds r0, r5, 0
	adds r1, r4, 0
	adds r2, r7, 0
	bl CpuSet
	adds r5, 0x20
	movs r0, 0x80
	lsls r0, 1
	adds r4, r0
	adds r0, r5, 0
	adds r1, r4, 0
	adds r2, r7, 0
	bl CpuSet
	adds r5, 0x20
	subs r6, 0x1
	cmp r6, 0
	bne _0804538E
	b _08045438
	.align 2, 0
_080453C8: .4byte REG_BG0CNT
_080453CC: .4byte 0x02020004
_080453D0: .4byte gUnknown_0820A8B4
_080453D4:
	ldr r1, _08045448
	ldr r0, [sp, 0xC]
	add r0, r9
	lsls r0, 2
	adds r4, r0, r1
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	ldr r1, _0804544C
	cmp r0, 0
	bne _080453F2
	ldr r1, _08045450
_080453F2:
	mov r2, r10
	cmp r2, 0
	beq _08045438
	mov r8, r4
	mov r9, r1
	ldr r7, _08045454
	mov r6, r10
_08045400:
	mov r0, r9
	adds r0, 0x4
	mov r9, r0
	subs r0, 0x4
	ldm r0!, {r4}
	mov r1, r8
	ldrh r0, [r1, 0x4]
	lsls r0, 22
	lsrs r0, 17
	adds r4, r0
	adds r0, r5, 0
	adds r1, r4, 0
	adds r2, r7, 0
	bl CpuSet
	adds r5, 0x20
	movs r2, 0x80
	lsls r2, 1
	adds r4, r2
	adds r0, r5, 0
	adds r1, r4, 0
	adds r2, r7, 0
	bl CpuSet
	adds r5, 0x20
	subs r6, 0x1
	cmp r6, 0
	bne _08045400
_08045438:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045448: .4byte 0x02020004
_0804544C: .4byte gUnknown_0820A8DC
_08045450: .4byte gUnknown_0820A904
_08045454: .4byte REG_BG0CNT
	thumb_func_end sub_80451A0

	thumb_func_start sub_8045458
sub_8045458: @ 8045458
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	ldr r0, _080454F4
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	bne _0804552E
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _0804552E
	ldr r6, _080454F8
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r5, r0, r6
	ldrh r0, [r5, 0x3A]
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0804552E
	ldr r1, _080454FC
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08045500
	adds r0, r1
	movs r1, 0xB
	bl PokemonGetField
	lsls r0, 16
	lsrs r0, 16
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	beq _0804552E
	ldrh r0, [r5, 0x38]
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r7, 0
	beq _0804550C
	movs r0, 0x46
	bl sub_8043CDC
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r6
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 17
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2
	ldr r2, _08045504
	adds r1, r2
	ldr r2, _08045508
	bl CpuSet
	b _0804552E
	.align 2, 0
_080454F4: .4byte 0x020239f8
_080454F8: .4byte 0x02020004
_080454FC: .4byte 0x02024a6a
_08045500: .4byte 0x030045c0
_08045504: .4byte 0x06010000
_08045508: .4byte REG_BG0CNT
_0804550C:
	str r7, [sp]
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r6
	ldrh r1, [r0, 0x4]
	lsls r1, 22
	lsrs r1, 17
	movs r0, 0x80
	lsls r0, 1
	adds r1, r0
	ldr r0, _08045538
	adds r1, r0
	ldr r2, _0804553C
	mov r0, sp
	bl CpuSet
_0804552E:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045538: .4byte 0x06010000
_0804553C: .4byte 0x05000008
	thumb_func_end sub_8045458

	thumb_func_start draw_status_ailment_maybe
draw_status_ailment_maybe: @ 8045540
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _080455A4
	mov r2, r9
	lsls r1, r2, 4
	add r1, r9
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x3A]
	lsls r0, 24
	lsrs r7, r0, 24
	ldrh r0, [r1, 0x38]
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	adds r0, r7, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080455B0
	ldr r1, _080455A8
	lsls r0, r7, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080455AC
	adds r0, r1
	movs r1, 0x37
	bl PokemonGetField
	adds r4, r0, 0
	bl battle_type_is_double
	lsls r0, 24
	movs r3, 0x12
	mov r8, r3
	cmp r0, 0
	bne _080455CC
	movs r0, 0x1A
	mov r8, r0
	b _080455CC
	.align 2, 0
_080455A4: .4byte 0x02020004
_080455A8: .4byte 0x02024a6a
_080455AC: .4byte 0x03004360
_080455B0:
	ldr r1, _080455EC
	lsls r0, r7, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080455F0
	adds r0, r1
	movs r1, 0x37
	bl PokemonGetField
	adds r4, r0, 0
	movs r1, 0x11
	mov r8, r1
_080455CC:
	movs r0, 0x7
	ands r0, r4
	cmp r0, 0
	beq _080455F4
	movs r0, 0x1B
	adds r1, r7, 0
	bl sub_80457E8
	lsls r0, 24
	lsrs r0, 24
	bl sub_8043CDC
	adds r6, r0, 0
	movs r0, 0x2
	b _080456FC
	.align 2, 0
_080455EC: .4byte 0x02024a6a
_080455F0: .4byte 0x030045c0
_080455F4:
	movs r0, 0x88
	ands r0, r4
	cmp r0, 0
	beq _08045612
	movs r0, 0x15
	adds r1, r7, 0
	bl sub_80457E8
	lsls r0, 24
	lsrs r0, 24
	bl sub_8043CDC
	adds r6, r0, 0
	movs r0, 0
	b _080456FC
_08045612:
	movs r0, 0x10
	ands r0, r4
	cmp r0, 0
	beq _08045630
	movs r0, 0x21
	adds r1, r7, 0
	bl sub_80457E8
	lsls r0, 24
	lsrs r0, 24
	bl sub_8043CDC
	adds r6, r0, 0
	movs r0, 0x4
	b _080456FC
_08045630:
	movs r0, 0x20
	ands r0, r4
	cmp r0, 0
	beq _0804564E
	movs r0, 0x1E
	adds r1, r7, 0
	bl sub_80457E8
	lsls r0, 24
	lsrs r0, 24
	bl sub_8043CDC
	adds r6, r0, 0
	movs r0, 0x3
	b _080456FC
_0804564E:
	movs r0, 0x40
	ands r0, r4
	cmp r0, 0
	beq _0804566C
	movs r0, 0x18
	adds r1, r7, 0
	bl sub_80457E8
	lsls r0, 24
	lsrs r0, 24
	bl sub_8043CDC
	adds r6, r0, 0
	movs r0, 0x1
	b _080456FC
_0804566C:
	movs r0, 0x27
	bl sub_8043CDC
	adds r6, r0, 0
	movs r4, 0
	mov r2, r9
	lsls r0, r2, 4
	mov r3, r8
	lsls r3, 16
	mov r8, r3
	lsls r7, 2
	ldr r1, _080456E8
	add r0, r9
	lsls r0, 2
	adds r5, r0, r1
_0804568A:
	ldrh r1, [r5, 0x4]
	lsls r1, 22
	lsrs r1, 22
	mov r2, r8
	asrs r0, r2, 16
	adds r1, r0
	adds r1, r4
	lsls r1, 5
	ldr r3, _080456EC
	adds r1, r3
	adds r0, r6, 0
	ldr r2, _080456F0
	bl CpuSet
	adds r4, 0x1
	cmp r4, 0x2
	ble _0804568A
	ldr r0, _080456F4
	adds r0, r7, r0
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _080456DC
	movs r0, 0x1
	bl sub_8043CDC
	ldr r2, _080456E8
	mov r3, r10
	lsls r1, r3, 4
	add r1, r10
	lsls r1, 2
	adds r1, r2
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 17
	ldr r2, _080456EC
	adds r1, r2
	ldr r2, _080456F8
	bl CpuSet
_080456DC:
	mov r0, r9
	movs r1, 0x1
	bl sub_8045458
	b _080457BA
	.align 2, 0
_080456E8: .4byte 0x02020004
_080456EC: .4byte 0x06010000
_080456F0: .4byte REG_BG0CNT
_080456F4: .4byte 0x02017800
_080456F8: .4byte REG_BG0HOFS
_080456FC:
	mov r1, r9
	lsls r5, r1, 4
	add r5, r9
	lsls r5, 2
	ldr r2, _080457C8
	adds r5, r2
	ldrb r4, [r5, 0x5]
	lsrs r4, 4
	lsls r4, 4
	adds r4, 0xC
	adds r4, r7
	lsls r0, 1
	ldr r1, _080457CC
	adds r0, r1
	ldrh r0, [r0]
	movs r3, 0x80
	lsls r3, 1
	adds r1, r4, r3
	movs r2, 0x2
	bl FillPalette
	lsls r4, 1
	ldr r0, _080457D0
	adds r0, r4, r0
	ldr r1, _080457D4
	adds r4, r1
	adds r1, r4, 0
	movs r2, 0x1
	bl CpuSet
	ldrh r1, [r5, 0x4]
	lsls r1, 22
	lsrs r1, 22
	add r1, r8
	lsls r1, 5
	ldr r2, _080457D8
	mov r8, r2
	add r1, r8
	ldr r2, _080457DC
	adds r0, r6, 0
	bl CpuSet
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0804576A
	adds r0, r7, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080457B2
_0804576A:
	lsls r0, r7, 2
	ldr r1, _080457E0
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _080457B2
	movs r0, 0
	bl sub_8043CDC
	mov r3, r10
	lsls r4, r3, 4
	add r4, r10
	lsls r4, 2
	ldr r1, _080457C8
	adds r4, r1
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 17
	add r1, r8
	ldr r5, _080457E4
	adds r2, r5, 0
	bl CpuSet
	movs r0, 0x41
	bl sub_8043CDC
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 17
	adds r1, 0x20
	add r1, r8
	adds r2, r5, 0
	bl CpuSet
_080457B2:
	mov r0, r9
	movs r1, 0
	bl sub_8045458
_080457BA:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080457C8: .4byte 0x02020004
_080457CC: .4byte gBattleInterfaceStatusIcons_DynPal
_080457D0: .4byte 0x0202ecc8
_080457D4: .4byte 0x05000200
_080457D8: .4byte 0x06010000
_080457DC: .4byte REG_BG2HOFS
_080457E0: .4byte 0x02017800
_080457E4: .4byte REG_BG0CNT
	thumb_func_end draw_status_ailment_maybe

	thumb_func_start sub_80457E8
sub_80457E8: @ 80457E8
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsrs r2, r0, 24
	adds r0, r2, 0
	subs r0, 0x15
	cmp r0, 0xC
	bhi _080458A8
	lsls r0, 2
	ldr r1, _08045804
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08045804: .4byte _08045808
	.align 2, 0
_08045808:
	.4byte _0804583C
	.4byte _080458A8
	.4byte _080458A8
	.4byte _08045852
	.4byte _080458A8
	.4byte _080458A8
	.4byte _08045868
	.4byte _080458A8
	.4byte _080458A8
	.4byte _0804587E
	.4byte _080458A8
	.4byte _080458A8
	.4byte _08045894
_0804583C:
	movs r2, 0x15
	cmp r3, 0
	beq _080458A8
	movs r2, 0x47
	cmp r3, 0x1
	beq _080458A8
	movs r2, 0x65
	cmp r3, 0x2
	bne _080458A8
	movs r2, 0x56
	b _080458A8
_08045852:
	movs r2, 0x18
	cmp r3, 0
	beq _080458A8
	movs r2, 0x4A
	cmp r3, 0x1
	beq _080458A8
	movs r2, 0x68
	cmp r3, 0x2
	bne _080458A8
	movs r2, 0x59
	b _080458A8
_08045868:
	movs r2, 0x1B
	cmp r3, 0
	beq _080458A8
	movs r2, 0x4D
	cmp r3, 0x1
	beq _080458A8
	movs r2, 0x6B
	cmp r3, 0x2
	bne _080458A8
	movs r2, 0x5C
	b _080458A8
_0804587E:
	movs r2, 0x1E
	cmp r3, 0
	beq _080458A8
	movs r2, 0x50
	cmp r3, 0x1
	beq _080458A8
	movs r2, 0x6E
	cmp r3, 0x2
	bne _080458A8
	movs r2, 0x5F
	b _080458A8
_08045894:
	movs r2, 0x21
	cmp r3, 0
	beq _080458A8
	movs r2, 0x53
	cmp r3, 0x1
	beq _080458A8
	movs r2, 0x71
	cmp r3, 0x2
	bne _080458A8
	movs r2, 0x62
_080458A8:
	adds r0, r2, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80457E8

	thumb_func_start sub_80458B0
sub_80458B0: @ 80458B0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08045984
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 7
	ldr r0, _08045988
	adds r6, r1, r0
	movs r1, 0x7
	mov r8, r1
	ldr r1, _0804598C
	adds r0, r6, 0
	bl sub_80034D4
	movs r4, 0
_080458EE:
	movs r0, 0x2B
	bl sub_8043CDC
	lsls r1, r4, 6
	adds r1, r6, r1
	ldr r2, _08045990
	bl CpuSet
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r8
	bcc _080458EE
	movs r7, 0x3
	movs r2, 0x3
	add r2, r8
	mov r9, r2
	cmp r7, r9
	bge _08045974
	ldr r1, _08045984
	ldr r0, _08045990
	mov r10, r0
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	mov r8, r0
_08045924:
	mov r1, r8
	ldrh r0, [r1, 0x4]
	lsls r0, 22
	lsrs r0, 22
	adds r5, r7, 0
	cmp r7, 0
	bge _08045934
	adds r5, r7, 0x7
_08045934:
	asrs r5, 3
	lsls r4, r5, 3
	subs r4, r7, r4
	adds r0, r4
	lsls r5, 6
	adds r0, r5
	lsls r0, 5
	ldr r2, _08045994
	adds r1, r0, r2
	adds r0, r6, 0
	mov r2, r10
	bl CpuSet
	adds r6, 0x20
	mov r1, r8
	ldrh r0, [r1, 0x4]
	lsls r0, 22
	lsrs r0, 22
	adds r4, 0x8
	adds r0, r4
	adds r0, r5
	lsls r0, 5
	ldr r2, _08045994
	adds r1, r0, r2
	adds r0, r6, 0
	mov r2, r10
	bl CpuSet
	adds r6, 0x20
	adds r7, 0x1
	cmp r7, r9
	blt _08045924
_08045974:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045984: .4byte 0x02020004
_08045988: .4byte 0x02000520
_0804598C: .4byte gUnknown_08400DD6
_08045990: .4byte REG_BG0CNT
_08045994: .4byte 0x06010000
	thumb_func_end sub_80458B0

	thumb_func_start sub_8045998
sub_8045998: @ 8045998
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08045A38
	mov r8, r0
	ldr r1, _08045A3C
	bl StringCopy
	adds r7, r0, 0
	ldr r0, _08045A40
	ldrb r1, [r0]
	adds r0, r7, 0
	movs r2, 0xA
	movs r3, 0x1
	bl sub_8003504
	adds r7, r0, 0
	ldr r1, _08045A44
	bl StringAppend
	ldr r0, _08045A48
	lsls r5, r4, 4
	adds r5, r4
	lsls r5, 2
	adds r5, r0
	ldrh r0, [r5, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 1
	adds r4, r0
	lsls r4, 7
	ldr r0, _08045A4C
	adds r7, r4, r0
	movs r6, 0x5
	adds r0, r7, 0
	mov r1, r8
	bl sub_80034D4
	ldr r0, _08045A50
	adds r7, r4, r0
	movs r4, 0x6
_080459F8:
	ldrh r0, [r5, 0x4]
	lsls r0, 22
	lsrs r2, r0, 22
	adds r0, r4, 0
	cmp r4, 0
	bge _08045A06
	adds r0, r4, 0x7
_08045A06:
	asrs r0, 3
	lsls r1, r0, 3
	subs r1, r4, r1
	adds r1, 0x18
	adds r1, r2, r1
	lsls r0, 6
	adds r1, r0
	lsls r1, 5
	ldr r0, _08045A54
	adds r1, r0
	adds r0, r7, 0
	ldr r2, _08045A58
	bl CpuSet
	adds r7, 0x40
	adds r4, 0x1
	adds r0, r6, 0x6
	cmp r4, r0
	blt _080459F8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045A38: .4byte 0x020238cc
_08045A3C: .4byte gUnknown_08400DE6
_08045A40: .4byte 0x02038808
_08045A44: .4byte gUnknown_08400DF0
_08045A48: .4byte 0x02020004
_08045A4C: .4byte 0x02000520
_08045A50: .4byte 0x02000540
_08045A54: .4byte 0x06010000
_08045A58: .4byte REG_BG0CNT
	thumb_func_end sub_8045998

	thumb_func_start sub_8045A5C
sub_8045A5C: @ 8045A5C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	mov r9, r1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r2, 24
	lsrs r7, r2, 24
	ldr r1, _08045BE4
	lsls r0, 4
	add r0, r8
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08045A92
	b _08045BF0
_08045A92:
	cmp r7, 0x3
	beq _08045A9A
	cmp r7, 0
	bne _08045AAE
_08045A9A:
	mov r0, r9
	movs r1, 0x38
	bl PokemonGetField
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl sub_8043FC0
_08045AAE:
	cmp r7, 0x1
	bhi _08045AC8
	mov r0, r9
	movs r1, 0x39
	bl PokemonGetField
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	mov r0, r8
	movs r2, 0
	bl sub_80440EC
_08045AC8:
	cmp r7, 0x2
	beq _08045AD0
	cmp r7, 0
	bne _08045AE6
_08045AD0:
	mov r0, r9
	movs r1, 0x3A
	bl PokemonGetField
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	mov r0, r8
	movs r2, 0x1
	bl sub_80440EC
_08045AE6:
	cmp r7, 0x5
	beq _08045AEE
	cmp r7, 0
	bne _08045B22
_08045AEE:
	movs r0, 0
	bl load_gfxc_health_bar
	mov r0, r9
	movs r1, 0x3A
	bl PokemonGetField
	adds r4, r0, 0
	mov r0, r9
	movs r1, 0x39
	bl PokemonGetField
	adds r3, r0, 0
	movs r0, 0
	str r0, [sp]
	mov r0, r10
	mov r1, r8
	adds r2, r4, 0
	bl sub_8043D84
	mov r0, r10
	mov r1, r8
	movs r2, 0
	movs r3, 0
	bl sub_8045C78
_08045B22:
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	cmp r0, 0
	bne _08045BA6
	cmp r7, 0x6
	beq _08045B38
	cmp r7, 0
	bne _08045BA6
_08045B38:
	movs r0, 0x3
	bl load_gfxc_health_bar
	mov r0, r9
	movs r1, 0xB
	bl PokemonGetField
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r0, r9
	movs r1, 0x38
	bl PokemonGetField
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r0, r9
	movs r1, 0x19
	bl PokemonGetField
	adds r3, r0, 0
	ldr r6, _08045BE8
	lsls r1, r4, 2
	ldr r2, _08045BEC
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0, 0x13]
	movs r0, 0xCA
	lsls r0, 1
	muls r0, r2
	adds r1, r0
	adds r1, r6
	ldr r1, [r1]
	subs r3, r1
	adds r4, 0x1
	lsls r4, 2
	adds r4, r0
	adds r4, r6
	ldr r2, [r4]
	subs r2, r1
	ldr r0, [sp, 0x4]
	str r0, [sp]
	mov r0, r10
	mov r1, r8
	bl sub_8043D84
	mov r0, r10
	mov r1, r8
	movs r2, 0x1
	movs r3, 0
	bl sub_8045C78
_08045BA6:
	cmp r7, 0x4
	beq _08045BAE
	cmp r7, 0
	bne _08045BB6
_08045BAE:
	mov r0, r8
	mov r1, r9
	bl sub_80451A0
_08045BB6:
	cmp r7, 0x9
	beq _08045BBE
	cmp r7, 0
	bne _08045BC4
_08045BBE:
	mov r0, r8
	bl draw_status_ailment_maybe
_08045BC4:
	cmp r7, 0xA
	bne _08045BCE
	mov r0, r8
	bl sub_80458B0
_08045BCE:
	adds r0, r7, 0
	subs r0, 0xA
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08045C66
	mov r0, r8
	bl sub_8045998
	b _08045C66
	.align 2, 0
_08045BE4: .4byte 0x02020004
_08045BE8: .4byte gExperienceTables
_08045BEC: .4byte gBaseStats
_08045BF0:
	cmp r7, 0x3
	beq _08045BF8
	cmp r7, 0
	bne _08045C0C
_08045BF8:
	mov r0, r9
	movs r1, 0x38
	bl PokemonGetField
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl sub_8043FC0
_08045C0C:
	cmp r7, 0x5
	beq _08045C14
	cmp r7, 0
	bne _08045C48
_08045C14:
	movs r0, 0
	bl load_gfxc_health_bar
	mov r0, r9
	movs r1, 0x3A
	bl PokemonGetField
	adds r4, r0, 0
	mov r0, r9
	movs r1, 0x39
	bl PokemonGetField
	adds r3, r0, 0
	movs r0, 0
	str r0, [sp]
	mov r0, r10
	mov r1, r8
	adds r2, r4, 0
	bl sub_8043D84
	mov r0, r10
	mov r1, r8
	movs r2, 0
	movs r3, 0
	bl sub_8045C78
_08045C48:
	cmp r7, 0x4
	beq _08045C50
	cmp r7, 0
	bne _08045C58
_08045C50:
	mov r0, r8
	mov r1, r9
	bl sub_80451A0
_08045C58:
	cmp r7, 0x9
	beq _08045C60
	cmp r7, 0
	bne _08045C66
_08045C60:
	mov r0, r8
	bl draw_status_ailment_maybe
_08045C66:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8045A5C

	thumb_func_start sub_8045C78
sub_8045C78: @ 8045C78
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	cmp r2, 0
	bne _08045CBC
	lsls r5, r7, 2
	adds r3, r5, r7
	lsls r3, 2
	ldr r4, _08045CB8
	adds r2, r3, r4
	ldr r0, [r2, 0x4]
	ldr r1, [r2, 0x8]
	ldr r2, [r2, 0xC]
	adds r4, 0x10
	adds r3, r4
	movs r4, 0x6
	str r4, [sp]
	movs r4, 0x1
	str r4, [sp, 0x4]
	bl sub_8045F58
	adds r6, r0, 0
	adds r4, r5, 0
	b _08045D0A
	.align 2, 0
_08045CB8: .4byte 0x02017850
_08045CBC:
	lsls r4, r7, 2
	adds r0, r4, r7
	lsls r0, 2
	mov r10, r0
	ldr r6, _08045D50
	add r6, r10
	ldr r0, [r6, 0x8]
	ldr r1, [r6, 0xC]
	ldr r2, [r6, 0x4]
	movs r3, 0x8
	bl sub_8046188
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08045CDE
	movs r5, 0x1
_08045CDE:
	ldr r0, [r6, 0xC]
	mov r8, r0
	adds r1, r5, 0
	bl __divsi3
	cmp r0, 0
	bge _08045CEE
	negs r0, r0
_08045CEE:
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, [r6, 0x4]
	ldr r1, [r6, 0x8]
	ldr r3, _08045D50
	adds r3, 0x10
	add r3, r10
	movs r2, 0x8
	str r2, [sp]
	str r5, [sp, 0x4]
	mov r2, r8
	bl sub_8045F58
	adds r6, r0, 0
_08045D0A:
	mov r0, r9
	cmp r0, 0x1
	beq _08045D22
	cmp r0, 0
	bne _08045D2A
	ldr r0, _08045D54
	adds r0, r4, r0
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _08045D2A
_08045D22:
	adds r0, r7, 0
	mov r1, r9
	bl sub_8045D58
_08045D2A:
	movs r0, 0x1
	negs r0, r0
	cmp r6, r0
	bne _08045D3E
	adds r0, r4, r7
	lsls r0, 2
	ldr r1, _08045D50
	adds r0, r1
	movs r1, 0
	str r1, [r0, 0x10]
_08045D3E:
	adds r0, r6, 0
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08045D50: .4byte 0x02017850
_08045D54: .4byte 0x02017800
	thumb_func_end sub_8045C78

	thumb_func_start sub_8045D58
sub_8045D58: @ 8045D58
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0
	beq _08045D72
	cmp r1, 0x1
	beq _08045E54
	b _08045F42
_08045D72:
	lsls r5, r6, 2
	adds r3, r5, r6
	lsls r3, 2
	ldr r4, _08045E00
	adds r2, r3, r4
	ldr r0, [r2, 0x4]
	ldr r1, [r2, 0x8]
	ldr r2, [r2, 0xC]
	adds r4, 0x10
	adds r3, r4
	add r4, sp, 0x8
	str r4, [sp]
	movs r4, 0x6
	str r4, [sp, 0x4]
	bl sub_804602C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	mov r8, r1
	adds r1, r5, 0
	cmp r0, 0x18
	bhi _08045DAC
	movs r2, 0x38
	mov r8, r2
	cmp r0, 0x9
	bls _08045DAC
	movs r4, 0x2F
	mov r8, r4
_08045DAC:
	movs r5, 0
	ldr r7, _08045E04
	adds r0, r1, r6
	lsls r6, r0, 2
_08045DB4:
	ldr r0, _08045E00
	adds r0, r6, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	ldrh r0, [r0, 0x38]
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r5, 0x1
	bhi _08045E10
	mov r0, r8
	bl sub_8043CDC
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	ldrb r1, [r1]
	lsls r1, 5
	adds r0, r1
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r7
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r2, r5, 0x2
	adds r1, r2
	lsls r1, 5
	ldr r2, _08045E08
	adds r1, r2
	ldr r2, _08045E0C
	bl CpuSet
	b _08045E3E
	.align 2, 0
_08045E00: .4byte 0x02017850
_08045E04: .4byte 0x02020004
_08045E08: .4byte 0x06010000
_08045E0C: .4byte REG_BG0CNT
_08045E10:
	mov r0, r8
	bl sub_8043CDC
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	ldrb r1, [r1]
	lsls r1, 5
	adds r0, r1
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r7
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r1, r5, r1
	lsls r1, 5
	ldr r4, _08045E4C
	adds r1, r4
	ldr r2, _08045E50
	bl CpuSet
_08045E3E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08045DB4
	b _08045F42
	.align 2, 0
_08045E4C: .4byte 0x06010040
_08045E50: .4byte REG_BG0CNT
_08045E54:
	lsls r5, r6, 2
	adds r3, r5, r6
	lsls r3, 2
	ldr r4, _08045EF0
	adds r2, r3, r4
	ldr r0, [r2, 0x4]
	ldr r1, [r2, 0x8]
	ldr r2, [r2, 0xC]
	adds r4, 0x10
	adds r3, r4
	add r4, sp, 0x8
	str r4, [sp]
	movs r4, 0x8
	str r4, [sp, 0x4]
	bl sub_804602C
	ldr r1, _08045EF4
	lsls r0, r6, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08045EF8
	adds r0, r1
	movs r1, 0x38
	bl PokemonGetField
	lsls r0, 24
	lsrs r0, 24
	adds r1, r5, 0
	cmp r0, 0x64
	bne _08045EAA
	movs r5, 0
	movs r2, 0
_08045E98:
	mov r0, sp
	adds r0, r5
	adds r0, 0x8
	strb r2, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _08045E98
_08045EAA:
	movs r5, 0
	ldr r7, _08045EFC
	adds r0, r1, r6
	lsls r0, 2
	ldr r1, _08045EF0
	adds r4, r0, r1
_08045EB6:
	cmp r5, 0x3
	bhi _08045F08
	movs r0, 0xC
	bl sub_8043CDC
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	ldrb r1, [r1]
	lsls r1, 5
	adds r0, r1
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r7
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r2, r5, 0
	adds r2, 0x24
	adds r1, r2
	lsls r1, 5
	ldr r2, _08045F00
	adds r1, r2
	ldr r2, _08045F04
	bl CpuSet
	b _08045F38
	.align 2, 0
_08045EF0: .4byte 0x02017850
_08045EF4: .4byte 0x02024a6a
_08045EF8: .4byte 0x03004360
_08045EFC: .4byte 0x02020004
_08045F00: .4byte 0x06010000
_08045F04: .4byte REG_BG0CNT
_08045F08:
	movs r0, 0xC
	bl sub_8043CDC
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	ldrb r1, [r1]
	lsls r1, 5
	adds r0, r1
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r7
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r1, r5, r1
	lsls r1, 5
	ldr r2, _08045F50
	adds r1, r2
	ldr r2, _08045F54
	bl CpuSet
_08045F38:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _08045EB6
_08045F42:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045F50: .4byte 0x06010b80
_08045F54: .4byte REG_BG0CNT
	thumb_func_end sub_8045D58

	thumb_func_start sub_8045F58
sub_8045F58: @ 8045F58
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	adds r4, r1, 0
	mov r8, r2
	adds r5, r3, 0
	ldr r1, [sp, 0x18]
	ldr r0, [sp, 0x1C]
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 27
	lsrs r2, r1, 24
	ldr r1, [r5]
	ldr r0, _08045F84
	cmp r1, r0
	bne _08045F8A
	cmp r7, r2
	bge _08045F88
	lsls r0, r4, 8
	str r0, [r5]
	b _08045F8A
	.align 2, 0
_08045F84: .4byte 0xffff8000
_08045F88:
	str r4, [r5]
_08045F8A:
	mov r0, r8
	subs r4, r0
	cmp r4, 0
	bge _08045F96
	movs r4, 0
	b _08045F9C
_08045F96:
	cmp r4, r7
	ble _08045F9C
	adds r4, r7, 0
_08045F9C:
	cmp r7, r2
	bge _08045FB8
	ldr r0, [r5]
	asrs r1, r0, 8
	adds r6, r0, 0
	cmp r4, r1
	bne _08045FC4
	movs r0, 0xFF
	ands r0, r6
	cmp r0, 0
	bne _08045FC4
	movs r0, 0x1
	negs r0, r0
	b _08046020
_08045FB8:
	ldr r6, [r5]
	cmp r4, r6
	bne _08045FC4
	movs r0, 0x1
	negs r0, r0
	b _08046020
_08045FC4:
	cmp r7, r2
	bge _08045FFE
	lsls r0, r7, 8
	adds r1, r2, 0
	bl __divsi3
	mov r1, r8
	cmp r1, 0
	bge _08045FE2
	adds r0, r6, r0
	str r0, [r5]
	asrs r2, r0, 8
	cmp r2, r4
	blt _0804601E
	b _08045FF6
_08045FE2:
	subs r0, r6, r0
	str r0, [r5]
	asrs r2, r0, 8
	movs r1, 0xFF
	ands r0, r1
	cmp r0, 0
	ble _08045FF2
	adds r2, 0x1
_08045FF2:
	cmp r2, r4
	bgt _0804601E
_08045FF6:
	lsls r0, r4, 8
	str r0, [r5]
	adds r2, r4, 0
	b _0804601E
_08045FFE:
	mov r0, r8
	cmp r0, 0
	bge _08046010
	ldr r0, [r5]
	adds r0, r3
	str r0, [r5]
	cmp r0, r4
	ble _0804601C
	b _0804601A
_08046010:
	ldr r0, [r5]
	subs r0, r3
	str r0, [r5]
	cmp r0, r4
	bge _0804601C
_0804601A:
	str r4, [r5]
_0804601C:
	ldr r2, [r5]
_0804601E:
	adds r0, r2, 0
_08046020:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8045F58

	thumb_func_start sub_804602C
sub_804602C: @ 804602C
	push {r4-r7,lr}
	adds r4, r0, 0
	mov r12, r3
	ldr r7, [sp, 0x14]
	ldr r0, [sp, 0x18]
	lsls r0, 24
	lsrs r6, r0, 24
	subs r5, r1, r2
	cmp r5, 0
	bge _08046044
	movs r5, 0
	b _0804604A
_08046044:
	cmp r5, r4
	ble _0804604A
	adds r5, r4, 0
_0804604A:
	lsls r0, r6, 27
	lsrs r3, r0, 24
	movs r1, 0
	cmp r1, r6
	bcs _08046064
	movs r2, 0
_08046056:
	adds r0, r7, r1
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r6
	bcc _08046056
_08046064:
	cmp r4, r3
	bge _08046078
	mov r1, r12
	ldr r0, [r1]
	muls r0, r3
	adds r1, r4, 0
	bl __divsi3
	asrs r0, 8
	b _08046084
_08046078:
	mov r1, r12
	ldr r0, [r1]
	muls r0, r3
	adds r1, r4, 0
	bl __divsi3
_08046084:
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r2, 0
	cmp r3, 0
	bne _0804609A
	cmp r5, 0
	ble _0804609A
	movs r0, 0x1
	strb r0, [r7]
	movs r3, 0x1
	b _080460BE
_0804609A:
	movs r1, 0
	movs r4, 0x8
_0804609E:
	cmp r1, r6
	bcs _080460BE
	cmp r2, 0x7
	bls _080460BA
	adds r0, r7, r1
	strb r4, [r0]
	adds r0, r2, 0
	subs r0, 0x8
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	b _0804609E
_080460BA:
	adds r0, r7, r1
	strb r2, [r0]
_080460BE:
	adds r0, r3, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_804602C

	thumb_func_start sub_80460C8
sub_80460C8: @ 80460C8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r5, r0, 0
	adds r6, r1, 0
	adds r4, r2, 0
	mov r8, r3
	ldr r0, [r5]
	ldr r1, [r5, 0x4]
	ldr r2, [r5, 0x8]
	movs r3, 0x6
	str r3, [sp]
	movs r3, 0x1
	str r3, [sp, 0x4]
	adds r3, r6, 0
	bl sub_8045F58
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_8046128
	ldr r0, [r5]
	cmp r0, 0x2F
	bgt _08046108
	ldr r0, [r6]
	lsls r0, 8
	lsrs r1, r0, 16
	b _0804610A
_08046108:
	ldrh r1, [r6]
_0804610A:
	movs r2, 0
	ldrsh r0, [r5, r2]
	lsls r1, 16
	asrs r1, 16
	mov r2, r8
	bl sub_804373C
	lsls r0, r7, 16
	asrs r0, 16
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80460C8

	thumb_func_start sub_8046128
sub_8046128: @ 8046128
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x1C
	adds r5, r0, 0
	adds r3, r1, 0
	mov r8, r2
	ldr r0, [r5]
	ldr r1, [r5, 0x4]
	ldr r2, [r5, 0x8]
	add r4, sp, 0x8
	str r4, [sp]
	movs r4, 0x6
	str r4, [sp, 0x4]
	bl sub_804602C
	movs r3, 0
	add r7, sp, 0x10
	mov r12, r7
	ldrb r0, [r5, 0xC]
	lsls r6, r0, 27
	ldr r4, [r5, 0x10]
_08046154:
	lsls r2, r3, 1
	add r2, r12
	lsrs r1, r6, 15
	mov r0, sp
	adds r0, r3
	adds r0, 0x8
	ldrb r0, [r0]
	adds r0, r4, r0
	orrs r1, r0
	strh r1, [r2]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x5
	bls _08046154
	adds r0, r7, 0
	mov r1, r8
	movs r2, 0x6
	bl CpuSet
	add sp, 0x1C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8046128

	thumb_func_start sub_8046188
sub_8046188: @ 8046188
	push {r4-r7,lr}
	adds r6, r2, 0
	lsls r3, 27
	lsrs r7, r3, 24
	subs r5, r0, r1
	cmp r5, 0
	bge _0804619A
	movs r5, 0
	b _080461A0
_0804619A:
	cmp r5, r6
	ble _080461A0
	adds r5, r6, 0
_080461A0:
	muls r0, r7
	adds r1, r6, 0
	bl __divsi3
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	muls r0, r7
	adds r1, r6, 0
	bl __divsi3
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	subs r0, r4, r0
	cmp r0, 0
	bge _080461C8
	negs r0, r0
_080461C8:
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8046188

	thumb_func_start sub_80461D4
sub_80461D4: @ 80461D4
	push {r4,lr}
	lsls r2, 24
	lsrs r2, 24
	lsls r0, 16
	asrs r4, r0, 16
	adds r0, r4, 0
	muls r0, r2
	lsls r1, 16
	asrs r1, 16
	bl __divsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080461F8
	cmp r4, 0
	ble _080461F8
	movs r0, 0x1
_080461F8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80461D4

	thumb_func_start sub_8046200
sub_8046200: @ 8046200
	push {lr}
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	bne _08046212
	movs r0, 0x4
	b _0804622E
_08046212:
	movs r2, 0x30
	bl sub_80461D4
	lsls r0, 24
	lsrs r1, r0, 24
	movs r0, 0x3
	cmp r1, 0x18
	bhi _0804622E
	movs r0, 0x2
	cmp r1, 0x9
	bhi _0804622E
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
_0804622E:
	pop {r1}
	bx r1
	thumb_func_end sub_8046200

	thumb_func_start sub_8046234
sub_8046234: @ 8046234
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 24
	lsrs r4, r2, 24
	ldr r5, _0804636C
	ldrh r0, [r5, 0x6]
	bl GetSpriteTileStartByTag
	lsls r0, 16
	ldr r1, _08046370
	cmp r0, r1
	bne _08046266
	adds r0, r5, 0
	bl LoadCompressedObjectPic
	ldr r0, _08046374
	bl LoadCompressedObjectPalette
_08046266:
	ldr r0, _08046378
	bl object_new_hidden_with_callback
	mov r8, r0
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r5, r0, 4
	add r5, r8
	lsls r5, 2
	ldr r0, _0804637C
	adds r5, r0
	strh r4, [r5, 0x30]
	ldr r0, _08046380
	mov r9, r0
	lsls r6, 16
	asrs r0, r6, 16
	mov r10, r0
	ldr r0, _08046384
	adds r6, r0
	asrs r6, 16
	lsls r4, r7, 16
	asrs r7, r4, 16
	adds r4, r0
	asrs r4, 16
	mov r0, r9
	adds r1, r6, 0
	adds r2, r4, 0
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0804637C
	adds r1, r0
	mov r0, r8
	strh r0, [r1, 0x2E]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r1, 0
	bl AnimateSprite
	mov r0, r9
	mov r1, r10
	adds r2, r4, 0
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0804637C
	adds r4, r0
	mov r0, r8
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	adds r0, r4, 0
	bl AnimateSprite
	mov r0, r9
	adds r1, r6, 0
	adds r2, r7, 0
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0804637C
	adds r4, r0
	mov r0, r8
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	adds r0, r4, 0
	bl AnimateSprite
	mov r0, r9
	mov r1, r10
	adds r2, r7, 0
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0804637C
	adds r4, r0
	mov r0, r8
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r4, 0
	movs r1, 0x3
	bl StartSpriteAnim
	adds r0, r4, 0
	bl AnimateSprite
	mov r0, r8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804636C: .4byte gUnknown_081FAEA4
_08046370: .4byte 0xffff0000
_08046374: .4byte gUnknown_081FAEAC
_08046378: .4byte sub_8046388
_0804637C: .4byte 0x02020004
_08046380: .4byte gSpriteTemplate_81FAF0C
_08046384: .4byte 0xfff00000
	thumb_func_end sub_8046234

	thumb_func_start sub_8046388
sub_8046388: @ 8046388
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080463C0
	ldr r0, _080463B4
	ldrh r0, [r0, 0x6]
	bl FreeSpriteTilesByTag
	ldr r0, _080463B8
	ldrh r0, [r0, 0x4]
	bl FreeSpritePaletteByTag
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080463BC
	adds r0, r4, 0
	bl DestroySprite
	b _080463C0
	.align 2, 0
_080463B4: .4byte gUnknown_081FAEA4
_080463B8: .4byte gUnknown_081FAEAC
_080463BC:
	ldr r0, _080463C8
	str r0, [r4, 0x1C]
_080463C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080463C8: .4byte SpriteCallbackDummy
	thumb_func_end sub_8046388

	thumb_func_start sub_80463CC
sub_80463CC: @ 80463CC
	push {lr}
	adds r3, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080463F6
	ldr r2, _080463FC
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x2E]
	subs r1, 0x1
	strh r1, [r0, 0x2E]
	adds r0, r3, 0
	bl DestroySprite
_080463F6:
	pop {r0}
	bx r0
	.align 2, 0
_080463FC: .4byte 0x02020004
	thumb_func_end sub_80463CC

	thumb_func_start sub_8046400
sub_8046400: @ 8046400
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _08046450
	movs r0, 0x1
	strb r0, [r1]
	ldr r6, _08046454
	ldrb r1, [r6]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08046458
	adds r0, r1
	ldrb r1, [r0]
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _0804645C
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08046460
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xA]
	strh r5, [r1, 0xC]
	ldrb r0, [r6]
	strh r0, [r1, 0xE]
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08046450: .4byte 0x02024e6d
_08046454: .4byte 0x02024a60
_08046458: .4byte 0x02017810
_0804645C: .4byte sub_8046464
_08046460: .4byte 0x03004b20
	thumb_func_end sub_8046400

	thumb_func_start sub_8046464
sub_8046464: @ 8046464
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	movs r0, 0
	str r0, [sp]
	ldr r1, _08046498
	mov r2, r10
	lsls r0, r2, 2
	add r0, r10
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0x8]
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _0804649C
	adds r0, r2, 0x1
	strh r0, [r1, 0x8]
	b _08046616
	.align 2, 0
_08046498: .4byte 0x03004b20
_0804649C:
	ldrh r0, [r1, 0xC]
	mov r8, r0
	ldrb r5, [r1, 0xE]
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080464C8
	ldr r1, _080464C0
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080464C4
	b _080464D6
	.align 2, 0
_080464C0: .4byte 0x02024a6a
_080464C4: .4byte 0x030045c0
_080464C8:
	ldr r1, _08046544
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08046548
_080464D6:
	adds r0, r1
	movs r1, 0x26
	bl PokemonGetField
	lsls r0, 16
	lsrs r0, 16
	bl ball_number_to_ball_processing_index
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_80478DC
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 3
	ldr r1, _0804654C
	adds r0, r1
	movs r1, 0x20
	movs r2, 0x50
	movs r3, 0x1D
	bl CreateSprite
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r2, _08046550
	mov r9, r2
	lsls r0, r7, 4
	adds r0, r7
	lsls r6, r0, 2
	adds r4, r6, r2
	movs r0, 0x80
	strh r0, [r4, 0x2E]
	movs r3, 0
	strh r3, [r4, 0x30]
	mov r0, r8
	strh r0, [r4, 0x3C]
	mov r2, r8
	cmp r2, 0xFE
	beq _0804655C
	cmp r2, 0xFF
	bne _08046598
	ldr r0, _08046554
	strb r5, [r0]
	movs r0, 0x18
	strh r0, [r4, 0x20]
	movs r0, 0x44
	strh r0, [r4, 0x22]
	mov r0, r9
	adds r0, 0x1C
	adds r0, r6, r0
	ldr r1, _08046558
	str r1, [r0]
	b _080465A6
	.align 2, 0
_08046544: .4byte 0x02024a6a
_08046548: .4byte 0x03004360
_0804654C: .4byte gSpriteTemplate_820AAB4
_08046550: .4byte 0x02020004
_08046554: .4byte 0x02024c08
_08046558: .4byte sub_8047074
_0804655C:
	adds r0, r5, 0
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x18
	strh r0, [r4, 0x22]
	ldr r0, _08046590
	strb r5, [r0]
	movs r3, 0
	strh r3, [r4, 0x2E]
	mov r0, r9
	adds r0, 0x1C
	adds r0, r6, r0
	ldr r1, _08046594
	str r1, [r0]
	b _080465A6
	.align 2, 0
_08046590: .4byte 0x02024c08
_08046594: .4byte sub_8047254
_08046598:
	movs r0, 0x1
	bl battle_get_side_with_given_state
	ldr r1, _080465C4
	strb r0, [r1]
	movs r0, 0x1
	str r0, [sp]
_080465A6:
	ldr r0, _080465C8
	lsls r1, r7, 4
	adds r1, r7
	lsls r1, 2
	adds r4, r1, r0
	ldr r5, _080465C4
	ldrb r0, [r5]
	strh r0, [r4, 0x3A]
	ldr r2, [sp]
	cmp r2, 0
	bne _080465CC
	mov r0, r10
	bl DestroyTask
	b _08046616
	.align 2, 0
_080465C4: .4byte 0x02024c08
_080465C8: .4byte 0x02020004
_080465CC:
	movs r0, 0x22
	strh r0, [r4, 0x2E]
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x10
	strh r0, [r4, 0x36]
	ldr r0, _08046628
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_80786EC
	mov r3, r10
	strh r3, [r4, 0x6]
	ldr r1, _0804662C
	mov r2, r10
	lsls r0, r2, 2
	add r0, r10
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r5]
	strh r1, [r0, 0x10]
	ldr r1, _08046630
	str r1, [r0]
	movs r0, 0x3D
	bl audio_play
_08046616:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046628: .4byte 0x0000ffd8
_0804662C: .4byte 0x03004b20
_08046630: .4byte TaskDummy
	thumb_func_end sub_8046464

	thumb_func_start objc_0804ABD4
objc_0804ABD4: @ 8046634
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r7, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080466D4
	ldrb r6, [r7, 0x6]
	ldr r1, _080466E0
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldrb r5, [r0, 0x10]
	ldrb r0, [r0, 0xC]
	mov r8, r0
	adds r0, r7, 0
	movs r1, 0x1
	bl StartSpriteAnim
	adds r2, r7, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r7, 0x24]
	ldrh r1, [r7, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r7, 0x20]
	ldrh r0, [r7, 0x26]
	ldrh r2, [r7, 0x22]
	adds r0, r2
	strh r0, [r7, 0x22]
	strh r1, [r7, 0x24]
	strh r1, [r7, 0x26]
	strh r1, [r7, 0x38]
	adds r0, r5, 0
	bl sub_8047978
	lsls r0, 16
	lsrs r0, 16
	bl ball_number_to_ball_processing_index
	adds r4, r0, 0
	ldrh r0, [r7, 0x20]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r7, 0x22]
	subs r1, 0x5
	lsls r1, 24
	lsrs r1, 24
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp]
	movs r2, 0x1
	movs r3, 0x1C
	bl sub_814086C
	movs r0, 0
	adds r1, r5, 0
	movs r2, 0xE
	adds r3, r4, 0
	bl sub_8141314
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7, 0x2E]
	strh r5, [r7, 0x3A]
	mov r0, r8
	strh r0, [r7, 0x3C]
	adds r0, r6, 0
	bl DestroyTask
	ldr r0, _080466E4
	str r0, [r7, 0x1C]
_080466D4:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080466E0: .4byte 0x03004b20
_080466E4: .4byte sub_80466E8
	thumb_func_end objc_0804ABD4

	thumb_func_start sub_80466E8
sub_80466E8: @ 80466E8
	ldr r1, _080466F0
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080466F0: .4byte sub_80466F4
	thumb_func_end sub_80466E8

	thumb_func_start sub_80466F4
sub_80466F4: @ 80466F4
	push {r4-r7,lr}
	adds r6, r0, 0
	ldrh r0, [r6, 0x38]
	adds r0, 0x1
	movs r7, 0
	strh r0, [r6, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _0804674E
	strh r7, [r6, 0x38]
	ldr r0, _08046754
	str r0, [r6, 0x1C]
	ldr r5, _08046758
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0804675C
	adds r0, r4
	movs r1, 0x2
	bl StartSpriteAffineAnim
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl AnimateSprite
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r7, [r0, 0x30]
_0804674E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046754: .4byte sub_8046760
_08046758: .4byte 0x02024be0
_0804675C: .4byte 0x02020004
	thumb_func_end sub_80466F4

	thumb_func_start sub_8046760
sub_8046760: @ 8046760
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	bne _08046778
	movs r0, 0x3C
	bl audio_play
_08046778:
	ldr r6, _080467C4
	ldr r5, _080467C8
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r6
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bge _080467D0
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	movs r0, 0
	strh r0, [r4, 0x38]
	ldr r0, _080467CC
	str r0, [r4, 0x1C]
	b _080467F0
	.align 2, 0
_080467C4: .4byte 0x02020004
_080467C8: .4byte 0x02024be0
_080467CC: .4byte sub_80467F8
_080467D0:
	ldrh r0, [r1, 0x30]
	adds r0, 0x60
	strh r0, [r1, 0x30]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	adds r0, r5
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	movs r2, 0x30
	ldrsh r0, [r1, r2]
	negs r0, r0
	asrs r0, 8
	strh r0, [r1, 0x26]
_080467F0:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8046760

	thumb_func_start sub_80467F8
sub_80467F8: @ 80467F8
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08046840
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _08046840
	strh r1, [r4, 0x34]
	movs r0, 0x20
	strh r0, [r4, 0x36]
	strh r1, [r4, 0x38]
	movs r0, 0
	movs r1, 0x20
	bl cosine
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	movs r0, 0x36
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl cosine
	negs r0, r0
	strh r0, [r4, 0x26]
	ldr r0, _08046848
	str r0, [r4, 0x1C]
_08046840:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08046848: .4byte sub_804684C
	thumb_func_end sub_80467F8

	thumb_func_start sub_804684C
sub_804684C: @ 804684C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0
	ldrh r0, [r4, 0x34]
	movs r1, 0xFF
	ands r1, r0
	cmp r1, 0
	beq _08046862
	cmp r1, 0x1
	beq _080468D6
	b _08046902
_08046862:
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl cosine
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r1, [r4, 0x38]
	adds r1, 0x4
	ldrh r2, [r4, 0x34]
	lsls r0, r2, 16
	asrs r0, 24
	adds r1, r0
	strh r1, [r4, 0x38]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x3F
	ble _08046902
	ldrh r0, [r4, 0x36]
	subs r0, 0xA
	strh r0, [r4, 0x36]
	ldr r1, _080468AC
	adds r0, r2, r1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 24
	cmp r0, 0x4
	bne _0804689E
	movs r5, 0x1
_0804689E:
	cmp r0, 0x2
	beq _080468BE
	cmp r0, 0x2
	bgt _080468B0
	cmp r0, 0x1
	beq _080468B6
	b _080468CE
	.align 2, 0
_080468AC: .4byte 0x00000101
_080468B0:
	cmp r0, 0x3
	beq _080468C6
	b _080468CE
_080468B6:
	movs r0, 0x38
	bl audio_play
	b _08046902
_080468BE:
	movs r0, 0x39
	bl audio_play
	b _08046902
_080468C6:
	movs r0, 0x3A
	bl audio_play
	b _08046902
_080468CE:
	movs r0, 0x3B
	bl audio_play
	b _08046902
_080468D6:
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl cosine
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r1, [r4, 0x38]
	subs r1, 0x4
	ldrh r2, [r4, 0x34]
	lsls r0, r2, 16
	asrs r0, 24
	subs r1, r0
	strh r1, [r4, 0x38]
	lsls r1, 16
	cmp r1, 0
	bgt _08046902
	strh r5, [r4, 0x38]
	ldr r0, _08046928
	ands r0, r2
	strh r0, [r4, 0x34]
_08046902:
	cmp r5, 0
	beq _0804693A
	movs r5, 0
	strh r5, [r4, 0x34]
	movs r0, 0x40
	movs r1, 0x20
	bl cosine
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	strh r5, [r4, 0x26]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _08046930
	ldr r0, _0804692C
	str r0, [r4, 0x1C]
	b _0804693A
	.align 2, 0
_08046928: .4byte 0xffffff00
_0804692C: .4byte sub_8046C78
_08046930:
	ldr r0, _08046940
	str r0, [r4, 0x1C]
	movs r0, 0x1
	strh r0, [r4, 0x36]
	strh r5, [r4, 0x38]
_0804693A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08046940: .4byte sub_8046944
	thumb_func_end sub_804684C

	thumb_func_start sub_8046944
sub_8046944: @ 8046944
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _08046978
	movs r0, 0
	strh r0, [r4, 0x34]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r0, _08046980
	str r0, [r4, 0x1C]
	movs r0, 0x17
	bl audio_play
_08046978:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08046980: .4byte sub_8046984
	thumb_func_end sub_8046944

	thumb_func_start sub_8046984
sub_8046984: @ 8046984
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x34]
	movs r1, 0xFF
	ands r1, r0
	cmp r1, 0x4
	bhi _08046A84
	lsls r0, r1, 2
	ldr r1, _0804699C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804699C: .4byte _080469A0
	.align 2, 0
_080469A0:
	.4byte _080469B4
	.4byte _080469E6
	.4byte _080469B4
	.4byte _08046A3A
	.4byte _08046A84
_080469B4:
	ldrh r0, [r4, 0x36]
	ldrh r2, [r4, 0x24]
	adds r1, r0, r2
	strh r1, [r4, 0x24]
	ldrh r1, [r4, 0x38]
	adds r0, r1
	strh r0, [r4, 0x38]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x38]
	adds r0, 0x3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x6
	bls _08046ACA
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	movs r0, 0
	strh r0, [r4, 0x38]
	b _08046ACA
_080469E6:
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _08046A2C
	movs r0, 0
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x36]
	negs r0, r0
	strh r0, [r4, 0x36]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bge _08046A22
	adds r0, r4, 0
	movs r1, 0x2
	bl ChangeSpriteAffineAnim
	b _08046ACA
_08046A22:
	adds r0, r4, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnim
	b _08046ACA
_08046A2C:
	adds r0, r4, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	b _08046ACA
_08046A3A:
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1, 0
	ldrh r2, [r4, 0x34]
	adds r0, r2
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 24
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _08046A5C
	ldr r0, _08046A58
	str r0, [r4, 0x1C]
	b _08046ACA
	.align 2, 0
_08046A58: .4byte sub_8046C78
_08046A5C:
	cmp r1, 0x4
	bne _08046A70
	cmp r0, 0x3
	bne _08046A70
	ldr r0, _08046A6C
	str r0, [r4, 0x1C]
	b _08046A76
	.align 2, 0
_08046A6C: .4byte sub_8046E7C
_08046A70:
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
_08046A76:
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	b _08046ACA
_08046A84:
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _08046ACA
	movs r0, 0
	strh r0, [r4, 0x38]
	ldrh r1, [r4, 0x34]
	ldr r0, _08046AB8
	ands r0, r1
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	movs r1, 0x3
	bl StartSpriteAffineAnim
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _08046ABC
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	b _08046AC4
	.align 2, 0
_08046AB8: .4byte 0xffffff00
_08046ABC:
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
_08046AC4:
	movs r0, 0x17
	bl audio_play
_08046ACA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8046984

	thumb_func_start sub_8046AD0
sub_8046AD0: @ 8046AD0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08046AFC
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrb r6, [r0, 0xC]
	ldrb r3, [r0, 0xA]
	ldrh r5, [r0, 0x8]
	movs r2, 0x26
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0x20
	bhi _08046B88
	lsls r0, 2
	ldr r1, _08046B00
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08046AFC: .4byte 0x03004b20
_08046B00: .4byte _08046B04
	.align 2, 0
_08046B04:
	.4byte _08046B88
	.4byte _08046BA6
	.4byte _08046BB2
	.4byte _08046BF6
	.4byte _08046B88
	.4byte _08046B88
	.4byte _08046B88
	.4byte _08046B88
	.4byte _08046B88
	.4byte _08046B88
	.4byte _08046B88
	.4byte _08046B88
	.4byte _08046B88
	.4byte _08046B88
	.4byte _08046B88
	.4byte _08046B88
	.4byte _08046B88
	.4byte _08046B88
	.4byte _08046B88
	.4byte _08046B88
	.4byte _08046BD0
	.4byte _08046B88
	.4byte _08046B88
	.4byte _08046B88
	.4byte _08046B88
	.4byte _08046B88
	.4byte _08046B88
	.4byte _08046B88
	.4byte _08046B88
	.4byte _08046B88
	.4byte _08046C08
	.4byte _08046C20
	.4byte _08046C48
_08046B88:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r2
	ldrh r2, [r1, 0x18]
	movs r3, 0x18
	ldrsh r0, [r1, r3]
	cmp r0, 0x2
	bgt _08046BA0
	adds r0, r2, 0x1
	strh r0, [r1, 0x18]
	b _08046C72
_08046BA0:
	adds r0, r6, 0x1
	strh r0, [r1, 0x26]
	b _08046C72
_08046BA6:
	lsls r1, r3, 24
	asrs r1, 24
	adds r0, r5, 0
	bl cry_related
	b _08046BEE
_08046BB2:
	bl sub_8075398
	ldr r1, _08046BCC
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0x3
	strh r1, [r0, 0x1C]
	movs r1, 0x14
	strh r1, [r0, 0x26]
	b _08046C72
	.align 2, 0
_08046BCC: .4byte 0x03004b20
_08046BD0:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r2
	ldrh r2, [r1, 0x1C]
	movs r6, 0x1C
	ldrsh r0, [r1, r6]
	cmp r0, 0
	bne _08046C5A
	lsls r1, r3, 24
	asrs r1, 24
	adds r0, r5, 0
	movs r2, 0x1
	bl sub_8075114
_08046BEE:
	adds r0, r4, 0
	bl DestroyTask
	b _08046C72
_08046BF6:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r2
	movs r1, 0x6
	strh r1, [r0, 0x1C]
	movs r1, 0x1E
	strh r1, [r0, 0x26]
	b _08046C72
_08046C08:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r2
	ldrh r2, [r1, 0x1C]
	movs r3, 0x1C
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _08046C5A
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
_08046C20:
	bl sub_80753C4
	lsls r0, 24
	cmp r0, 0
	bne _08046C72
	bl sub_8075398
	ldr r0, _08046C44
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x3
	strh r0, [r1, 0x1C]
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _08046C72
	.align 2, 0
_08046C44: .4byte 0x03004b20
_08046C48:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r2
	ldrh r2, [r1, 0x1C]
	movs r6, 0x1C
	ldrsh r0, [r1, r6]
	cmp r0, 0
	beq _08046C60
_08046C5A:
	subs r0, r2, 0x1
	strh r0, [r1, 0x1C]
	b _08046C72
_08046C60:
	lsls r1, r3, 24
	asrs r1, 24
	adds r0, r5, 0
	movs r2, 0
	bl sub_8075114
	adds r0, r4, 0
	bl DestroyTask
_08046C72:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8046AD0

	thumb_func_start sub_8046C78
sub_8046C78: @ 8046C78
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r6, r0, 0
	ldrh r0, [r6, 0x3A]
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r6, 0
	movs r1, 0x1
	bl StartSpriteAnim
	adds r0, r5, 0
	bl sub_8047978
	lsls r0, 16
	lsrs r0, 16
	bl ball_number_to_ball_processing_index
	adds r4, r0, 0
	ldrh r0, [r6, 0x20]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x22]
	subs r1, 0x5
	lsls r1, 24
	lsrs r1, 24
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp]
	movs r2, 0x1
	movs r3, 0x1C
	bl sub_814086C
	ldrh r1, [r6, 0x3A]
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x1
	movs r2, 0xE
	adds r3, r4, 0
	bl sub_8141314
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x2E]
	ldr r0, _08046D0C
	str r0, [r6, 0x1C]
	ldr r0, _08046D10
	ldr r1, _08046D14
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08046CE8
	b _08046E1C
_08046CE8:
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08046D20
	ldr r1, _08046D18
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08046D1C
	adds r0, r1, r0
	movs r3, 0x19
	mov r8, r3
	b _08046D34
	.align 2, 0
_08046D0C: .4byte sub_8046E9C
_08046D10: .4byte 0x03001770
_08046D14: .4byte 0x0000043d
_08046D18: .4byte 0x02024a6a
_08046D1C: .4byte 0x030045c0
_08046D20:
	ldr r1, _08046D90
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08046D94
	adds r0, r1, r0
	movs r1, 0xE7
	mov r8, r1
_08046D34:
	movs r1, 0xB
	bl PokemonGetField
	lsls r0, 16
	lsrs r7, r0, 16
	movs r0, 0
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	beq _08046D5A
	movs r0, 0x1
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	bne _08046DAE
_08046D5A:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _08046DAE
	ldr r0, _08046D98
	ldrb r1, [r0, 0x9]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08046DAE
	ldr r0, _08046D9C
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08046DA4
	bl sub_80755D4
	lsls r0, 24
	cmp r0, 0
	beq _08046DAE
	ldr r0, _08046DA0
	bl m4aMPlayStop
	b _08046DAE
	.align 2, 0
_08046D90: .4byte 0x02024a6a
_08046D94: .4byte 0x03004360
_08046D98: .4byte 0x02017840
_08046D9C: .4byte 0x020239f8
_08046DA0: .4byte 0x03007380
_08046DA4:
	ldr r0, _08046DC8
	ldr r1, _08046DCC
	movs r2, 0x80
	bl m4aMPlayVolumeControl
_08046DAE:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _08046DC4
	ldr r0, _08046DD0
	ldrb r1, [r0, 0x9]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08046DD4
_08046DC4:
	movs r4, 0
	b _08046DF6
	.align 2, 0
_08046DC8: .4byte 0x03007380
_08046DCC: .4byte 0x0000ffff
_08046DD0: .4byte 0x02017840
_08046DD4:
	movs r0, 0
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	beq _08046DF0
	movs r0, 0x1
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	bne _08046DF4
_08046DF0:
	movs r4, 0x1
	b _08046DF6
_08046DF4:
	movs r4, 0x2
_08046DF6:
	ldr r0, _08046E6C
	movs r1, 0x3
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08046E70
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	strh r7, [r1, 0x8]
	mov r3, r8
	lsls r0, r3, 24
	asrs r0, 24
	strh r0, [r1, 0xA]
	strh r4, [r1, 0xC]
	strh r2, [r1, 0x26]
_08046E1C:
	ldr r5, _08046E74
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08046E78
	adds r0, r4
	movs r1, 0x1
	bl StartSpriteAffineAnim
	movs r3, 0x3A
	ldrsh r0, [r6, r3]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl AnimateSprite
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x80
	lsls r1, 5
	strh r1, [r0, 0x30]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046E6C: .4byte sub_8046AD0
_08046E70: .4byte 0x03004b20
_08046E74: .4byte 0x02024be0
_08046E78: .4byte 0x02020004
	thumb_func_end sub_8046C78

	thumb_func_start sub_8046E7C
sub_8046E7C: @ 8046E7C
	adds r3, r0, 0
	adds r3, 0x2C
	ldrb r1, [r3]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _08046E98
	str r1, [r0, 0x1C]
	movs r1, 0
	strh r1, [r0, 0x34]
	strh r1, [r0, 0x36]
	strh r1, [r0, 0x38]
	bx lr
	.align 2, 0
_08046E98: .4byte sub_8046FBC
	thumb_func_end sub_8046E7C

	thumb_func_start sub_8046E9C
sub_8046E9C: @ 8046E9C
	push {r4-r7,lr}
	adds r5, r0, 0
	movs r7, 0
	ldrh r0, [r5, 0x3A]
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r6, _08046F00
	ldr r0, _08046F04
	adds r3, r4, r0
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08046EDE
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_08046EDE:
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bge _08046F08
	adds r0, r1, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	movs r7, 0x1
	b _08046F24
	.align 2, 0
_08046F00: .4byte 0x02020004
_08046F04: .4byte 0x02024be0
_08046F08:
	ldr r2, _08046FA8
	adds r0, r2, 0
	ldrh r2, [r1, 0x30]
	adds r0, r2
	strh r0, [r1, 0x30]
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r1, 0x26]
_08046F24:
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08046FA0
	cmp r7, 0
	beq _08046FA0
	ldr r2, _08046FAC
	ldr r0, _08046FB0
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r2, 0
	movs r1, 0
	strh r1, [r0, 0x26]
	ldr r0, _08046FB4
	strb r2, [r0]
	lsls r1, r4, 1
	adds r1, r4
	lsls r1, 2
	ldr r4, _08046FB8
	adds r1, r4
	ldrb r2, [r1]
	movs r0, 0x9
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	adds r0, r5, 0
	bl FreeSpriteOamMatrix
	adds r0, r5, 0
	bl DestroySprite
	movs r3, 0
	movs r5, 0x8
	adds r2, r4, 0
	movs r4, 0x3
_08046F78:
	ldrb r1, [r2]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _08046F84
	adds r3, 0x1
_08046F84:
	adds r2, 0xC
	subs r4, 0x1
	cmp r4, 0
	bge _08046F78
	cmp r3, 0x4
	bne _08046FA0
	movs r4, 0
_08046F92:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_804794C
	adds r4, 0x1
	cmp r4, 0xB
	ble _08046F92
_08046FA0:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046FA8: .4byte 0xfffffee0
_08046FAC: .4byte 0x02020004
_08046FB0: .4byte 0x02024be0
_08046FB4: .4byte 0x02024e6d
_08046FB8: .4byte 0x02017810
	thumb_func_end sub_8046E9C

	thumb_func_start sub_8046FBC
sub_8046FBC: @ 8046FBC
	push {r4-r7,lr}
	adds r6, r0, 0
	ldrh r0, [r6, 0x3A]
	lsls r0, 24
	lsrs r7, r0, 24
	ldrh r0, [r6, 0x36]
	adds r0, 0x1
	strh r0, [r6, 0x36]
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0x28
	beq _08047056
	cmp r1, 0x5F
	bne _08046FF4
	ldr r0, _08046FEC
	movs r1, 0
	strb r1, [r0]
	bl m4aMPlayAllStop
	ldr r0, _08046FF0
	bl audio_play
	b _08047056
	.align 2, 0
_08046FEC: .4byte 0x02024e6d
_08046FF0: .4byte 0x00000173
_08046FF4:
	ldr r0, _0804705C
	cmp r1, r0
	bne _08047056
	ldr r5, _08047060
	ldr r4, _08047064
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	adds r0, r6, 0
	bl DestroySpriteAndFreeResources
	ldr r0, _08047068
	ldr r1, _0804706C
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08047056
	lsls r1, r7, 1
	adds r1, r7
	lsls r1, 2
	ldr r0, _08047070
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x9
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
_08047056:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804705C: .4byte 0x0000013b
_08047060: .4byte 0x02020004
_08047064: .4byte 0x02024be0
_08047068: .4byte 0x03001770
_0804706C: .4byte 0x0000043d
_08047070: .4byte 0x02017810
	thumb_func_end sub_8046FBC

	thumb_func_start sub_8047074
sub_8047074: @ 8047074
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x19
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x18
	strh r0, [r4, 0x36]
	ldr r0, _080470BC
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x3A]
	strh r0, [r4, 0x6]
	adds r0, r4, 0
	bl sub_80786EC
	ldr r0, _080470C0
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080470BC: .4byte 0x0000ffe2
_080470C0: .4byte sub_80470C4
	thumb_func_end sub_8047074

	thumb_func_start sub_80470C4
sub_80470C4: @ 80470C4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	ldrh r0, [r5, 0x3C]
	movs r1, 0xFF
	mov r8, r1
	lsrs r0, 8
	subs r0, 0x23
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2C
	bhi _080471B8
	ldrh r1, [r5, 0x6]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	bne _08047126
	ldrh r0, [r5, 0x30]
	movs r1, 0x1
	adds r6, r1, 0
	ands r6, r0
	ldrh r0, [r5, 0x32]
	adds r7, r1, 0
	ands r7, r0
	movs r2, 0x30
	ldrsh r0, [r5, r2]
	movs r1, 0x3
	bl __divsi3
	movs r1, 0x2
	negs r1, r1
	adds r4, r1, 0
	ands r0, r4
	orrs r6, r0
	strh r6, [r5, 0x30]
	movs r2, 0x32
	ldrsh r0, [r5, r2]
	movs r1, 0x3
	bl __divsi3
	ands r0, r4
	orrs r7, r0
	strh r7, [r5, 0x32]
	adds r0, r5, 0
	movs r1, 0x4
	bl StartSpriteAffineAnim
_08047126:
	ldrh r4, [r5, 0x2E]
	adds r0, r5, 0
	bl sub_8078B5C
	movs r1, 0x3A
	ldrsh r0, [r5, r1]
	movs r1, 0x3
	bl __divsi3
	adds r1, r0, 0
	ldrh r0, [r5, 0x3C]
	adds r0, r1
	strh r0, [r5, 0x3C]
	lsls r0, 16
	asrs r0, 24
	mov r2, r8
	ands r0, r2
	movs r2, 0x38
	ldrsh r1, [r5, r2]
	bl sine
	ldrh r1, [r5, 0x26]
	adds r0, r1
	strh r0, [r5, 0x26]
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	ldrh r1, [r5, 0x6]
	adds r0, r1
	strh r0, [r5, 0x6]
	lsls r0, 16
	lsrs r0, 24
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	beq _08047176
	strh r4, [r5, 0x2E]
	b _0804717E
_08047176:
	lsls r0, r4, 16
	asrs r0, 16
	subs r0, 0x1
	strh r0, [r5, 0x2E]
_0804717E:
	ldrh r0, [r5, 0x3C]
	lsrs r0, 8
	cmp r0, 0x4F
	ble _08047220
	ldrh r0, [r5, 0x30]
	movs r1, 0x1
	adds r6, r1, 0
	ands r6, r0
	ldrh r0, [r5, 0x32]
	adds r7, r1, 0
	ands r7, r0
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	lsls r0, r1, 1
	adds r0, r1
	movs r1, 0x2
	negs r1, r1
	adds r2, r1, 0
	ands r0, r2
	orrs r0, r6
	strh r0, [r5, 0x30]
	movs r0, 0x32
	ldrsh r1, [r5, r0]
	lsls r0, r1, 1
	adds r0, r1
	ands r0, r2
	orrs r0, r7
	strh r0, [r5, 0x32]
	b _08047220
_080471B8:
	adds r0, r5, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _08047220
	ldrh r0, [r5, 0x24]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x26]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	strh r1, [r5, 0x26]
	strh r1, [r5, 0x24]
	ldrb r0, [r5, 0x6]
	strh r0, [r5, 0x3A]
	strh r1, [r5, 0x2E]
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _08047214
	ldr r0, _0804720C
	ldrb r1, [r0, 0x9]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08047214
	movs r0, 0x3A
	ldrsh r4, [r5, r0]
	movs r0, 0x2
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _08047214
	ldr r0, _08047210
	b _08047216
	.align 2, 0
_0804720C: .4byte 0x02017840
_08047210: .4byte sub_8047230
_08047214:
	ldr r0, _0804722C
_08047216:
	str r0, [r5, 0x1C]
	adds r0, r5, 0
	movs r1, 0
	bl StartSpriteAffineAnim
_08047220:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804722C: .4byte sub_8046C78
	thumb_func_end sub_80470C4

	thumb_func_start sub_8047230
sub_8047230: @ 8047230
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r1, r0, 0x1
	strh r1, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x18
	ble _0804724A
	movs r0, 0
	strh r0, [r2, 0x2E]
	ldr r0, _08047250
	str r0, [r2, 0x1C]
_0804724A:
	pop {r0}
	bx r0
	.align 2, 0
_08047250: .4byte sub_8046C78
	thumb_func_end sub_8047230

	thumb_func_start sub_8047254
sub_8047254: @ 8047254
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _080472A4
	movs r0, 0
	strh r0, [r5, 0x2E]
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _080472A0
	ldr r0, _08047298
	ldrb r1, [r0, 0x9]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080472A0
	movs r0, 0x3A
	ldrsh r4, [r5, r0]
	movs r0, 0x3
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _080472A0
	ldr r0, _0804729C
	b _080472A2
	.align 2, 0
_08047298: .4byte 0x02017840
_0804729C: .4byte sub_8047230
_080472A0:
	ldr r0, _080472AC
_080472A2:
	str r0, [r5, 0x1C]
_080472A4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080472AC: .4byte sub_8046C78
	thumb_func_end sub_8047254

	thumb_func_start sub_80472B0
sub_80472B0: @ 80472B0
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	movs r4, 0
	str r4, [sp]
	bl sub_814086C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80472B0

	thumb_func_start sub_80472D8
sub_80472D8: @ 80472D8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0
	bl sub_8141314
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80472D8

	thumb_func_start AddTextPrinterForMessage
AddTextPrinterForMessage: @ 80472F0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r5, r0, 0
	mov r9, r2
	mov r10, r3
	ldr r6, [sp, 0x24]
	ldr r4, [sp, 0x28]
	ldr r0, [sp, 0x2C]
	lsls r5, 24
	lsrs r5, 24
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp]
	mov r1, r9
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	mov r2, r10
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _080473BC
	bl LoadCompressedObjectPic
	ldr r0, _080473C0
	bl LoadCompressedObjectPalette
	ldr r0, _080473C4
	mov r1, r9
	mov r2, r10
	adds r3, r4, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080473C8
	mov r8, r3
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r1, r4, r3
	strh r5, [r1, 0x2E]
	lsls r2, r5, 4
	adds r2, r5
	lsls r2, 2
	add r2, r8
	ldrh r0, [r2, 0x20]
	strh r0, [r1, 0x38]
	ldrh r0, [r2, 0x22]
	strh r0, [r1, 0x3A]
	mov r0, r9
	strh r0, [r2, 0x20]
	mov r3, r10
	strh r3, [r2, 0x22]
	strh r7, [r1, 0x30]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r1, 0x32]
	mov r3, sp
	ldrh r3, [r3, 0x30]
	strh r3, [r1, 0x34]
	ldr r3, [sp, 0x30]
	lsrs r0, r3, 16
	strh r0, [r1, 0x36]
	movs r0, 0x3
	ands r6, r0
	lsls r6, 2
	ldrb r3, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r6
	strb r0, [r1, 0x5]
	movs r0, 0x1C
	add r8, r0
	add r4, r8
	ldr r0, _080473CC
	str r0, [r4]
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080473BC: .4byte gUnknown_0820A92C
_080473C0: .4byte gUnknown_0820A98C
_080473C4: .4byte gSpriteTemplate_820AAB4
_080473C8: .4byte 0x02020004
_080473CC: .4byte sub_80473D0
	thumb_func_end AddTextPrinterForMessage

	thumb_func_start sub_80473D0
sub_80473D0: @ 80473D0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	ldrh r1, [r6, 0x30]
	movs r2, 0x30
	ldrsh r0, [r6, r2]
	cmp r0, 0
	bne _0804747C
	ldrh r0, [r6, 0x2E]
	lsls r0, 24
	lsrs r7, r0, 24
	ldrh r0, [r6, 0x32]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrh r4, [r6, 0x34]
	ldrh r0, [r6, 0x36]
	lsls r0, 16
	orrs r4, r0
	adds r0, r6, 0
	adds r0, 0x43
	ldrb r0, [r0]
	cmp r0, 0
	beq _0804740A
	subs r0, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	b _0804740C
_0804740A:
	movs r5, 0
_0804740C:
	adds r0, r6, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldrh r0, [r6, 0x20]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x22]
	subs r1, 0x5
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r6, 0x5]
	lsls r2, 28
	lsrs r2, 30
	adds r3, r5, 0
	bl sub_80472B0
	movs r0, 0x1
	mov r1, r8
	adds r2, r4, 0
	bl sub_80472D8
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r6, 0x30]
	ldr r0, _08047474
	str r0, [r6, 0x1C]
	ldr r0, _08047478
	lsls r4, r7, 4
	adds r4, r7
	lsls r4, 2
	adds r4, r0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	adds r0, r4, 0
	bl AnimateSprite
	movs r0, 0x80
	lsls r0, 5
	strh r0, [r4, 0x30]
	strh r5, [r6, 0x3C]
	b _08047480
	.align 2, 0
_08047474: .4byte sub_804748C
_08047478: .4byte 0x02020004
_0804747C:
	subs r0, r1, 0x1
	strh r0, [r6, 0x30]
_08047480:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80473D0

	thumb_func_start sub_804748C
sub_804748C: @ 804748C
	push {r4-r7,lr}
	adds r4, r0, 0
	movs r0, 0
	mov r12, r0
	movs r6, 0
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080474B6
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_080474B6:
	ldr r0, _08047544
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	adds r5, r1, r0
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bge _080474D8
	adds r0, r5, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	movs r1, 0x1
	mov r12, r1
_080474D8:
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	movs r7, 0x20
	ldrsh r1, [r4, r7]
	subs r0, r1
	movs r1, 0x3C
	ldrsh r2, [r4, r1]
	muls r0, r2
	cmp r0, 0
	bge _080474EE
	adds r0, 0x7F
_080474EE:
	asrs r0, 7
	ldrh r7, [r4, 0x20]
	adds r0, r7
	lsls r0, 16
	lsrs r3, r0, 16
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	movs r7, 0x22
	ldrsh r1, [r4, r7]
	subs r0, r1
	muls r0, r2
	cmp r0, 0
	bge _0804750A
	adds r0, 0x7F
_0804750A:
	asrs r0, 7
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r3, [r5, 0x20]
	strh r0, [r5, 0x22]
	ldrh r2, [r4, 0x3C]
	movs r7, 0x3C
	ldrsh r0, [r4, r7]
	cmp r0, 0x7F
	bgt _0804754C
	ldr r1, _08047548
	lsls r0, r2, 24
	lsrs r0, 23
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _08047530
	adds r0, 0x7
_08047530:
	asrs r0, 3
	negs r0, r0
	lsls r0, 16
	lsrs r0, 16
	adds r1, r2, 0x4
	strh r1, [r4, 0x3C]
	strh r0, [r5, 0x24]
	strh r0, [r5, 0x26]
	b _0804755A
	.align 2, 0
_08047544: .4byte 0x02020004
_08047548: .4byte gSineTable
_0804754C:
	ldrh r0, [r4, 0x38]
	strh r0, [r5, 0x20]
	ldrh r0, [r4, 0x3A]
	strh r0, [r5, 0x22]
	strh r6, [r5, 0x24]
	strh r6, [r5, 0x26]
	movs r6, 0x1
_0804755A:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08047578
	mov r2, r12
	cmp r2, 0
	beq _08047578
	cmp r6, 0
	beq _08047578
	adds r0, r4, 0
	bl DestroySpriteAndFreeResources
_08047578:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_804748C

	thumb_func_start sub_8047580
sub_8047580: @ 8047580
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r10, r0
	adds r6, r2, 0
	mov r8, r3
	ldr r5, [sp, 0x20]
	ldr r4, [sp, 0x24]
	ldr r0, [sp, 0x28]
	mov r9, r0
	mov r0, r10
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r6, 24
	lsrs r6, 24
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	lsrs r4, 24
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _08047624
	bl LoadCompressedObjectPic
	ldr r0, _08047628
	bl LoadCompressedObjectPalette
	ldr r0, _0804762C
	adds r1, r6, 0
	mov r2, r8
	adds r3, r4, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _08047630
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r2, r3, r6
	mov r1, r10
	strh r1, [r2, 0x2E]
	mov r4, r9
	strh r4, [r2, 0x30]
	strh r7, [r2, 0x32]
	mov r1, sp
	ldrh r1, [r1, 0x2C]
	strh r1, [r2, 0x34]
	ldr r4, [sp, 0x2C]
	lsrs r1, r4, 16
	strh r1, [r2, 0x36]
	movs r1, 0x3
	ands r5, r1
	lsls r5, 2
	ldrb r4, [r2, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r4
	orrs r1, r5
	strb r1, [r2, 0x5]
	adds r6, 0x1C
	adds r3, r6
	ldr r1, _08047634
	str r1, [r3]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08047624: .4byte gUnknown_0820A92C
_08047628: .4byte gUnknown_0820A98C
_0804762C: .4byte gSpriteTemplate_820AAB4
_08047630: .4byte 0x02020004
_08047634: .4byte sub_8047638
	thumb_func_end sub_8047580

	thumb_func_start sub_8047638
sub_8047638: @ 8047638
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080476D0
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r7, r0, 24
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrh r5, [r4, 0x34]
	ldrh r0, [r4, 0x36]
	lsls r0, 16
	orrs r5, r0
	adds r0, r4, 0
	adds r0, 0x43
	ldrb r0, [r0]
	cmp r0, 0
	beq _08047672
	subs r0, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	b _08047674
_08047672:
	movs r6, 0
_08047674:
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldrh r0, [r4, 0x20]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x22]
	subs r1, 0x5
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r4, 0x5]
	lsls r2, 28
	lsrs r2, 30
	adds r3, r6, 0
	bl sub_80472B0
	movs r0, 0x1
	mov r1, r8
	adds r2, r5, 0
	bl sub_80472D8
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r4, 0x30]
	ldr r0, _080476C8
	str r0, [r4, 0x1C]
	lsls r4, r7, 4
	adds r4, r7
	lsls r4, 2
	ldr r0, _080476CC
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	adds r0, r4, 0
	bl AnimateSprite
	strh r5, [r4, 0x30]
	b _080476D4
	.align 2, 0
_080476C8: .4byte sub_80476E0
_080476CC: .4byte 0x02020004
_080476D0:
	subs r0, r1, 0x1
	strh r0, [r4, 0x30]
_080476D4:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8047638

	thumb_func_start sub_80476E0
sub_80476E0: @ 80476E0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x38]
	adds r0, 0x1
	strh r0, [r5, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	bne _080476F8
	movs r0, 0x3C
	bl audio_play
_080476F8:
	ldrh r1, [r5, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08047734
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bge _0804773C
	adds r0, r5, 0
	movs r1, 0x2
	bl StartSpriteAnim
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0
	strh r0, [r5, 0x38]
	ldr r0, _08047738
	str r0, [r5, 0x1C]
	b _0804774C
	.align 2, 0
_08047734: .4byte 0x02020004
_08047738: .4byte sub_8047754
_0804773C:
	ldrh r0, [r4, 0x30]
	adds r0, 0x60
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	negs r0, r0
	asrs r0, 8
	strh r0, [r4, 0x26]
_0804774C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80476E0

	thumb_func_start sub_8047754
sub_8047754: @ 8047754
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08047768
	ldr r0, _0804776C
	str r0, [r2, 0x1C]
_08047768:
	pop {r0}
	bx r0
	.align 2, 0
_0804776C: .4byte SpriteCallbackDummy
	thumb_func_end sub_8047754

	thumb_func_start obj_delete_and_free_associated_resources_
obj_delete_and_free_associated_resources_: @ 8047770
	push {lr}
	bl DestroySpriteAndFreeResources
	pop {r0}
	bx r0
	thumb_func_end obj_delete_and_free_associated_resources_

	thumb_func_start sub_804777C
sub_804777C: @ 804777C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r0, _080477FC
	adds r0, r5, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r6, _08047800
	adds r4, r0, r6
	movs r1, 0
	movs r0, 0x5
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x30]
	movs r0, 0x73
	strh r0, [r4, 0x24]
	strh r1, [r4, 0x26]
	ldr r0, _08047804
	str r0, [r4, 0x1C]
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080477CA
	ldrh r0, [r4, 0x2E]
	negs r0, r0
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	negs r0, r0
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x24]
	negs r0, r0
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x26]
	negs r0, r0
	strh r0, [r4, 0x26]
_080477CA:
	movs r0, 0x38
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r6, 0
	adds r1, 0x1C
	adds r1, r0, r1
	adds r0, r6
	ldr r1, [r1]
	bl _call_via_r1
	adds r0, r5, 0
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080477F4
	ldr r0, _08047808
	str r0, [r4, 0x1C]
_080477F4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080477FC: .4byte 0x03004340
_08047800: .4byte 0x02020004
_08047804: .4byte sub_8047830
_08047808: .4byte sub_804780C
	thumb_func_end sub_804777C

	thumb_func_start sub_804780C
sub_804780C: @ 804780C
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bne _08047826
	movs r0, 0
	strh r0, [r1, 0x30]
	ldr r0, _0804782C
	str r0, [r1, 0x1C]
_08047826:
	pop {r0}
	bx r0
	.align 2, 0
_0804782C: .4byte sub_8047830
	thumb_func_end sub_804780C

	thumb_func_start sub_8047830
sub_8047830: @ 8047830
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x24]
	ldrh r1, [r2, 0x2E]
	subs r0, r1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x26]
	ldrh r1, [r2, 0x30]
	subs r0, r1
	strh r0, [r2, 0x26]
	ldr r0, [r2, 0x24]
	cmp r0, 0
	bne _0804784E
	ldr r0, _08047854
	str r0, [r2, 0x1C]
_0804784E:
	pop {r0}
	bx r0
	.align 2, 0
_08047854: .4byte SpriteCallbackDummy
	thumb_func_end sub_8047830

	thumb_func_start sub_8047858
sub_8047858: @ 8047858
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _08047890
	adds r0, r5, 0
	bl object_new_hidden_with_callback
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08047894
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r3, r1, r2
	movs r0, 0x1
	strh r0, [r3, 0x2E]
	ldr r0, _08047898
	adds r4, r0
	ldrb r0, [r4]
	strh r0, [r3, 0x30]
	adds r2, 0x1C
	adds r1, r2
	str r5, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08047890: .4byte oamc_804BEB4
_08047894: .4byte 0x02020004
_08047898: .4byte 0x03004340
	thumb_func_end sub_8047858

	thumb_func_start oamc_804BEB4
oamc_804BEB4: @ 804789C
	push {lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x30]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080478D8
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	ldrh r0, [r3, 0x2E]
	movs r2, 0
	strh r0, [r1, 0x26]
	ldrh r0, [r3, 0x2E]
	negs r0, r0
	strh r0, [r3, 0x2E]
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x15
	bne _080478D4
	strh r2, [r1, 0x24]
	strh r2, [r1, 0x26]
	adds r0, r3, 0
	bl DestroySprite
_080478D4:
	pop {r0}
	bx r0
	.align 2, 0
_080478D8: .4byte 0x02020004
	thumb_func_end oamc_804BEB4

	thumb_func_start sub_80478DC
sub_80478DC: @ 80478DC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08047938
	lsls r6, r4, 3
	adds r5, r6, r0
	ldrh r0, [r5, 0x6]
	bl GetSpriteTileStartByTag
	lsls r0, 16
	ldr r1, _0804793C
	cmp r0, r1
	bne _08047904
	adds r0, r5, 0
	bl LoadCompressedObjectPic
	ldr r0, _08047940
	adds r0, r6, r0
	bl LoadCompressedObjectPalette
_08047904:
	cmp r4, 0x6
	beq _08047930
	cmp r4, 0x6
	blt _08047914
	cmp r4, 0xB
	bgt _08047914
	cmp r4, 0xA
	bge _08047930
_08047914:
	ldr r1, _08047938
	lsls r0, r4, 3
	adds r0, r1
	ldrh r0, [r0, 0x6]
	bl GetSpriteTileStartByTag
	adds r1, r0, 0
	lsls r1, 16
	ldr r0, _08047944
	lsrs r1, 11
	ldr r2, _08047948
	adds r1, r2
	bl LZDecompressVram
_08047930:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047938: .4byte gUnknown_0820A92C
_0804793C: .4byte 0xffff0000
_08047940: .4byte gUnknown_0820A98C
_08047944: .4byte gUnknown_08D030D0
_08047948: .4byte 0x06010100
	thumb_func_end sub_80478DC

	thumb_func_start sub_804794C
sub_804794C: @ 804794C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	ldr r0, _08047970
	lsrs r4, 21
	adds r0, r4, r0
	ldrh r0, [r0, 0x6]
	bl FreeSpriteTilesByTag
	ldr r0, _08047974
	adds r4, r0
	ldrh r0, [r4, 0x4]
	bl FreeSpritePaletteByTag
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047970: .4byte gUnknown_0820A92C
_08047974: .4byte gUnknown_0820A98C
	thumb_func_end sub_804794C

	thumb_func_start sub_8047978
sub_8047978: @ 8047978
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080479A4
	ldr r1, _0804799C
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080479A0
	b _080479B2
	.align 2, 0
_0804799C: .4byte 0x02024a6a
_080479A0: .4byte 0x030045c0
_080479A4:
	ldr r1, _080479C4
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080479C8
_080479B2:
	adds r0, r1
	movs r1, 0x26
	bl PokemonGetField
	lsls r0, 16
	lsrs r0, 16
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080479C4: .4byte 0x02024a6a
_080479C8: .4byte 0x03004360
	thumb_func_end sub_8047978

	thumb_func_start CheckForFlashMemory
CheckForFlashMemory: @ 80479CC
	push {lr}
	bl IdentifyFlash
	lsls r0, 16
	cmp r0, 0
	bne _080479E8
	ldr r1, _080479E4
	movs r0, 0x1
	str r0, [r1]
	bl InitFlashTimer
	b _080479EE
	.align 2, 0
_080479E4: .4byte 0x03004820
_080479E8:
	ldr r1, _080479F4
	movs r0, 0
	str r0, [r1]
_080479EE:
	pop {r0}
	bx r0
	.align 2, 0
_080479F4: .4byte 0x03004820
	thumb_func_end CheckForFlashMemory

	thumb_func_start sub_80479F8
sub_80479F8: @ 80479F8
	ldr r0, _08047A00
	ldrb r0, [r0, 0x9]
	bx lr
	.align 2, 0
_08047A00: .4byte gSaveBlock2
	thumb_func_end sub_80479F8

	thumb_func_start sub_8047A04
sub_8047A04: @ 8047A04
	ldr r1, _08047A0C
	movs r0, 0
	strb r0, [r1, 0x9]
	bx lr
	.align 2, 0
_08047A0C: .4byte gSaveBlock2
	thumb_func_end sub_8047A04

	thumb_func_start sub_8047A10
sub_8047A10: @ 8047A10
	ldr r1, _08047A18
	movs r0, 0x1
	strb r0, [r1, 0x9]
	bx lr
	.align 2, 0
_08047A18: .4byte gSaveBlock2
	thumb_func_end sub_8047A10

	thumb_func_start sub_8047A1C
sub_8047A1C: @ 8047A1C
	push {lr}
	movs r0, 0
	bl gpu_sync_bg_hide
	ldr r1, _08047A30
	movs r0, 0x1
	strb r0, [r1, 0x9]
	pop {r0}
	bx r0
	.align 2, 0
_08047A30: .4byte gSaveBlock2
	thumb_func_end sub_8047A1C

	thumb_func_start sub_8047A34
sub_8047A34: @ 8047A34
	ldr r1, _08047A3C
	movs r0, 0
	strb r0, [r1, 0x9]
	bx lr
	.align 2, 0
_08047A3C: .4byte gSaveBlock2
	thumb_func_end sub_8047A34

	thumb_func_start sub_8047A40
sub_8047A40: @ 8047A40
	push {r4-r6,lr}
	ldr r2, _08047A78
	ldr r0, _08047A7C
	ldrb r1, [r0]
	movs r3, 0x8D
	lsls r3, 2
	adds r0, r2, r3
	strb r1, [r0]
	movs r6, 0
	movs r0, 0x8E
	lsls r0, 2
	adds r5, r2, r0
	movs r4, 0
_08047A5A:
	ldr r1, _08047A80
	adds r1, r4, r1
	adds r0, r5, 0
	movs r2, 0x64
	bl memcpy
	adds r5, 0x64
	adds r4, 0x64
	adds r6, 0x1
	cmp r6, 0x5
	ble _08047A5A
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047A78: .4byte 0x02025734
_08047A7C: .4byte 0x03004350
_08047A80: .4byte 0x03004360
	thumb_func_end sub_8047A40

	thumb_func_start copy_player_party_from_sav1
copy_player_party_from_sav1: @ 8047A84
	push {r4-r6,lr}
	ldr r0, _08047AC0
	ldr r1, _08047AC4
	movs r2, 0x8D
	lsls r2, 2
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r0]
	ldr r4, _08047AC8
	movs r5, 0
	movs r0, 0xFA
	lsls r0, 1
	adds r6, r4, r0
_08047A9E:
	ldr r1, _08047AC4
	adds r1, r5, r1
	movs r2, 0x8E
	lsls r2, 2
	adds r1, r2
	adds r0, r4, 0
	movs r2, 0x64
	bl memcpy
	adds r4, 0x64
	adds r5, 0x64
	cmp r4, r6
	ble _08047A9E
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047AC0: .4byte 0x03004350
_08047AC4: .4byte 0x02025734
_08047AC8: .4byte 0x03004360
	thumb_func_end copy_player_party_from_sav1

	thumb_func_start sub_8047ACC
sub_8047ACC: @ 8047ACC
	push {r4-r7,lr}
	ldr r0, _08047AFC
	ldr r4, _08047B00
	movs r1, 0x9E
	lsls r1, 4
	adds r3, r0, r1
	movs r2, 0xF
_08047ADA:
	adds r1, r3, 0
	adds r0, r4, 0
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	adds r4, 0x24
	adds r3, 0x24
	subs r2, 0x1
	cmp r2, 0
	bge _08047ADA
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047AFC: .4byte 0x02025734
_08047B00: .4byte 0x030048a0
	thumb_func_end sub_8047ACC

	thumb_func_start save_deserialize_npcs
save_deserialize_npcs: @ 8047B04
	push {r4-r7,lr}
	ldr r0, _08047B34
	movs r1, 0x9E
	lsls r1, 4
	adds r4, r0, r1
	ldr r3, _08047B38
	movs r2, 0xF
_08047B12:
	adds r1, r3, 0
	adds r0, r4, 0
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	adds r4, 0x24
	adds r3, 0x24
	subs r2, 0x1
	cmp r2, 0
	bge _08047B12
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047B34: .4byte 0x02025734
_08047B38: .4byte 0x030048a0
	thumb_func_end save_deserialize_npcs

	thumb_func_start save_serialize_game
save_serialize_game: @ 8047B3C
	push {lr}
	bl sub_8047A40
	bl sub_8047ACC
	pop {r0}
	bx r0
	thumb_func_end save_serialize_game

	thumb_func_start save_deserialize_game
save_deserialize_game: @ 8047B4C
	push {lr}
	bl copy_player_party_from_sav1
	bl save_deserialize_npcs
	pop {r0}
	bx r0
	thumb_func_end save_deserialize_game

	thumb_func_start copy_bags_and_unk_data_from_save_blocks
copy_bags_and_unk_data_from_save_blocks: @ 8047B5C
	push {r4-r7,lr}
	ldr r0, _08047C0C
	movs r1, 0xAC
	lsls r1, 3
	adds r3, r0, r1
	ldr r1, _08047C10
	movs r2, 0x13
_08047B6A:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047B6A
	ldr r1, _08047C10
	ldr r0, _08047C0C
	movs r2, 0xB6
	lsls r2, 3
	adds r3, r0, r2
	adds r1, 0x50
	movs r2, 0x13
_08047B82:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047B82
	ldr r1, _08047C10
	ldr r0, _08047C0C
	movs r5, 0xC0
	lsls r5, 3
	adds r3, r0, r5
	adds r1, 0xA0
	movs r2, 0xF
_08047B9A:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047B9A
	ldr r1, _08047C10
	ldr r0, _08047C0C
	movs r6, 0xC8
	lsls r6, 3
	adds r3, r0, r6
	adds r1, 0xE0
	movs r2, 0x3F
_08047BB2:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047BB2
	ldr r1, _08047C10
	ldr r0, _08047C0C
	movs r7, 0xE8
	lsls r7, 3
	adds r3, r0, r7
	movs r0, 0xF0
	lsls r0, 1
	adds r1, r0
	movs r2, 0x2D
_08047BCE:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047BCE
	ldr r0, _08047C10
	ldr r4, _08047C0C
	movs r1, 0xA6
	lsls r1, 2
	adds r3, r0, r1
	ldr r2, _08047C14
	mov r12, r2
	movs r2, 0xF
_08047BE8:
	adds r1, r3, 0
	mov r5, r12
	adds r0, r4, r5
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	adds r4, 0x24
	adds r3, 0x24
	subs r2, 0x1
	cmp r2, 0
	bge _08047BE8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047C0C: .4byte 0x02025734
_08047C10: .4byte 0x020291f4
_08047C14: .4byte 0x00002b4c
	thumb_func_end copy_bags_and_unk_data_from_save_blocks

	thumb_func_start copy_bags_and_unk_data_to_save_blocks
copy_bags_and_unk_data_to_save_blocks: @ 8047C18
	push {r4-r7,lr}
	ldr r0, _08047CCC
	ldr r3, _08047CD0
	movs r2, 0xAC
	lsls r2, 3
	adds r1, r0, r2
	movs r2, 0x13
_08047C26:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047C26
	ldr r1, _08047CCC
	ldr r0, _08047CD0
	adds r3, r0, 0
	adds r3, 0x50
	movs r5, 0xB6
	lsls r5, 3
	adds r1, r5
	movs r2, 0x13
_08047C40:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047C40
	ldr r1, _08047CCC
	ldr r0, _08047CD0
	adds r3, r0, 0
	adds r3, 0xA0
	movs r6, 0xC0
	lsls r6, 3
	adds r1, r6
	movs r2, 0xF
_08047C5A:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047C5A
	ldr r1, _08047CCC
	ldr r0, _08047CD0
	adds r3, r0, 0
	adds r3, 0xE0
	movs r7, 0xC8
	lsls r7, 3
	adds r1, r7
	movs r2, 0x3F
_08047C74:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047C74
	ldr r1, _08047CCC
	ldr r0, _08047CD0
	movs r2, 0xF0
	lsls r2, 1
	adds r3, r0, r2
	movs r5, 0xE8
	lsls r5, 3
	adds r1, r5
	movs r2, 0x2D
_08047C90:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047C90
	ldr r0, _08047CCC
	ldr r4, _08047CD0
	ldr r6, _08047CD4
	adds r3, r0, r6
	movs r7, 0xA6
	lsls r7, 2
	mov r12, r7
	movs r2, 0xF
_08047CAA:
	adds r1, r3, 0
	mov r5, r12
	adds r0, r4, r5
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	adds r4, 0x24
	adds r3, 0x24
	subs r2, 0x1
	cmp r2, 0
	bge _08047CAA
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047CCC: .4byte 0x02025734
_08047CD0: .4byte 0x020291f4
_08047CD4: .4byte 0x00002b4c
	thumb_func_end copy_bags_and_unk_data_to_save_blocks

	thumb_func_start sub_8047CD8
sub_8047CD8: @ 8047CD8
	push {lr}
	ldr r0, _08047CE4
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08047CE4: .4byte sub_8047EC0
	thumb_func_end sub_8047CD8

	thumb_func_start sub_8047CE8
sub_8047CE8: @ 8047CE8
	push {r4-r6,lr}
	ldr r6, _08047D44
	ldr r5, _08047D48
	ldr r1, [r5]
	ldr r2, _08047D4C
	adds r0, r6, 0
	movs r3, 0xC
	bl sub_804AFB8
	bl GetMultiplayerId
	lsls r0, 24
	ldr r1, [r5, 0xC]
	movs r3, 0x80
	lsls r3, 17
	eors r3, r0
	lsrs r3, 24
	lsls r2, r3, 3
	subs r2, r3
	lsls r2, 2
	ldr r0, _08047D50
	adds r2, r0
	adds r0, r6, 0
	movs r3, 0xC
	bl sub_804AFB8
	ldr r1, [r5, 0x18]
	ldr r4, _08047D54
	ldr r2, [r4]
	adds r0, r6, 0
	movs r3, 0x8
	bl sub_804AFB8
	ldr r0, [r4, 0x4]
	ldr r1, [r5, 0x20]
	movs r2, 0x14
	bl sub_804ACD8
	movs r0, 0x3
	movs r1, 0
	bl nullsub_5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047D44: .4byte gWindowConfig_81E725C
_08047D48: .4byte 0x020296cc
_08047D4C: .4byte gSaveBlock2
_08047D50: .4byte 0x03002978
_08047D54: .4byte gUnknown_0820C14C
	thumb_func_end sub_8047CE8

	thumb_func_start sub_8047D58
sub_8047D58: @ 8047D58
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x18
	ldr r0, _08047E30
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	cmp r0, 0x5
	bls _08047D72
	movs r1, 0x1
_08047D72:
	movs r5, 0
	lsls r2, r1, 2
	mov r6, sp
	ldr r0, _08047E34
	adds r1, r0, 0x1
	adds r1, r2
	mov r8, r1
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r4, r0, 16
_08047D86:
	mov r1, sp
	ldr r0, _08047E38
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	ldrh r0, [r6]
	adds r0, r5
	strh r0, [r6]
	asrs r1, r4, 16
	mov r0, sp
	mov r3, r8
	ldrb r2, [r3]
	movs r3, 0x1
	bl CreateSprite
	movs r7, 0x80
	lsls r7, 14
	adds r4, r7
	adds r5, 0x1
	cmp r5, 0x2
	ble _08047D86
	bl GetMultiplayerId
	lsls r0, 24
	movs r1, 0x80
	lsls r1, 17
	eors r1, r0
	lsrs r1, 24
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	ldr r1, _08047E3C
	adds r0, r1
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	cmp r0, 0x5
	bls _08047DDA
	movs r1, 0x1
_08047DDA:
	movs r5, 0
	lsls r2, r1, 2
	mov r6, sp
	ldr r0, _08047E40
	adds r1, r2, r0
	mov r8, r1
	subs r0, 0x1
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r4, r0, 16
_08047DEE:
	mov r1, sp
	ldr r0, _08047E38
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	adds r0, r5, 0x3
	ldrh r1, [r6]
	adds r0, r1
	strh r0, [r6]
	asrs r1, r4, 16
	mov r0, sp
	mov r3, r8
	ldrb r2, [r3]
	movs r3, 0x1
	bl CreateSprite
	movs r7, 0x80
	lsls r7, 14
	adds r4, r7
	adds r5, 0x1
	cmp r5, 0x2
	ble _08047DEE
	movs r0, 0x5
	movs r1, 0
	bl nullsub_5
	add sp, 0x18
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047E30: .4byte gSaveBlock2
_08047E34: .4byte gTradeUnknownSpriteCoords
_08047E38: .4byte gSpriteTemplate_820C0EC
_08047E3C: .4byte 0x03002978
_08047E40: .4byte gTradeUnknownSpriteCoords + 0x3
	thumb_func_end sub_8047D58

	thumb_func_start sub_8047E44
sub_8047E44: @ 8047E44
	push {r4-r7,lr}
	sub sp, 0x18
	movs r4, 0
	mov r5, sp
	movs r6, 0xD6
	lsls r6, 16
_08047E50:
	mov r1, sp
	ldr r0, _08047EBC
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	adds r0, r4, 0x6
	ldrh r1, [r5]
	adds r0, r1
	strh r0, [r5]
	asrs r1, r6, 16
	mov r0, sp
	movs r2, 0x98
	movs r3, 0x1
	bl CreateSprite
	movs r2, 0x80
	lsls r2, 14
	adds r6, r2
	adds r4, 0x1
	cmp r4, 0x1
	ble _08047E50
	movs r4, 0
	mov r5, sp
	movs r6, 0xC0
	lsls r6, 13
_08047E84:
	mov r1, sp
	ldr r0, _08047EBC
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	adds r0, r4, 0
	adds r0, 0x8
	ldrh r3, [r5]
	adds r0, r3
	strh r0, [r5]
	asrs r1, r6, 16
	mov r0, sp
	movs r2, 0x96
	movs r3, 0x1
	bl CreateSprite
	movs r7, 0x80
	lsls r7, 14
	adds r6, r7
	adds r4, 0x1
	cmp r4, 0x4
	ble _08047E84
	add sp, 0x18
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047EBC: .4byte gSpriteTemplate_820C0EC
	thumb_func_end sub_8047E44

	thumb_func_start sub_8047EC0
sub_8047EC0: @ 8047EC0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	ldr r1, _08047EE4
	ldr r2, _08047EE8
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r3, r1, 0
	cmp r0, 0x15
	bls _08047ED8
	b _080484C6
_08047ED8:
	lsls r0, 2
	ldr r1, _08047EEC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08047EE4: .4byte 0x03001770
_08047EE8: .4byte 0x0000043c
_08047EEC: .4byte _08047EF0
	.align 2, 0
_08047EF0:
	.4byte _08047F48
	.4byte _08048048
	.4byte _080480B4
	.4byte _080480E0
	.4byte _08048130
	.4byte _08048160
	.4byte _08048172
	.4byte _080482B4
	.4byte _080482DC
	.4byte _08048300
	.4byte _08048328
	.4byte _0804834C
	.4byte _08048360
	.4byte _080483B8
	.4byte _08048400
	.4byte _08048418
	.4byte _08048430
	.4byte _08048448
	.4byte _0804845A
	.4byte _08048470
	.4byte _08048488
	.4byte _080484A8
_08047F48:
	ldr r5, _08048018
	ldr r6, _0804801C
	str r6, [r5]
	bl sub_804AA88
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r0, [r5]
	adds r0, 0xC8
	ldr r1, _08048020
	bl sub_804A964
	ldr r0, _08048024
	bl SetVBlankCallback
	ldr r0, _08048028
	bl InitMenuWindowConfig
	ldr r4, _0804802C
	adds r0, r4, 0
	bl SetUpWindowConfig
	ldr r0, [r5]
	adds r0, 0x4
	adds r1, r4, 0
	bl InitWindowFromConfig
	movs r0, 0x14
	bl SetTextWindowBaseTileNum
	ldr r1, [r5]
	adds r1, 0x7A
	movs r4, 0
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, 0x4
	bl LoadTextWindowGraphics
	bl MenuZeroFillScreen
	bl sub_809D51C
	ldr r0, [r5]
	adds r0, 0x75
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x7B
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x7C
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x80
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x81
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x86
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x87
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0xB4
	strb r4, [r0]
	ldr r0, _08048030
	strb r4, [r0]
	ldr r1, _08048034
	ldr r3, _08048038
	adds r1, r3
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0
	bl sub_804AA0C
	add r0, sp, 0x10
	strh r4, [r0]
	movs r0, 0xC0
	lsls r0, 7
	adds r1, r6, r0
	ldr r2, _0804803C
	add r0, sp, 0x10
	bl CpuSet
	ldr r1, _08048040
	movs r2, 0xD8
	lsls r2, 7
	adds r6, r2
	adds r0, r1, 0
	adds r0, 0x30
	ldr r2, _08048044
_0804800A:
	str r6, [r0]
	adds r6, r2
	subs r0, 0x4
	cmp r0, r1
	bge _0804800A
	b _080484C6
	.align 2, 0
_08048018: .4byte 0x03004824
_0804801C: .4byte 0x02017000
_08048020: .4byte 0x06002800
_08048024: .4byte sub_80489F4
_08048028: .4byte gWindowConfig_81E6CE4
_0804802C: .4byte gWindowConfig_81E6F84
_08048030: .4byte 0x03000508
_08048034: .4byte 0x03001770
_08048038: .4byte 0x0000043c
_0804803C: .4byte 0x01000680
_08048040: .4byte 0x020296cc
_08048044: .4byte 0xffffff00
_08048048:
	ldr r1, _08048098
	ldr r3, _0804809C
	adds r0, r3, 0
	strh r0, [r1]
	bl OpenLink
	movs r6, 0
	movs r4, 0
_08048058:
	movs r0, 0x64
	muls r0, r6
	ldr r1, _080480A0
	adds r0, r1
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	movs r1, 0
	movs r2, 0
	movs r3, 0x20
	bl create_pokemon_set_level
	adds r6, 0x1
	cmp r6, 0x5
	ble _08048058
	ldr r1, _080480A4
	ldr r0, _080480A8
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	ldr r0, _080480AC
	ldr r0, [r0]
	adds r0, 0xB4
	strb r2, [r0]
	ldr r0, _080480B0
	movs r1, 0x1
	bl CreateTask
	b _080484C6
	.align 2, 0
_08048098: .4byte 0x03002b74
_0804809C: .4byte 0x00001122
_080480A0: .4byte 0x030045c0
_080480A4: .4byte 0x03001770
_080480A8: .4byte 0x0000043c
_080480AC: .4byte 0x03004824
_080480B0: .4byte sub_8083C50
_080480B4:
	ldr r2, _080480D8
	ldr r1, [r2]
	adds r1, 0xB4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	adds r1, r0, 0
	adds r1, 0xB4
	ldrb r0, [r1]
	cmp r0, 0xB
	bhi _080480CE
	b _080484C6
_080480CE:
	movs r0, 0
	strb r0, [r1]
	ldr r2, _080480DC
	adds r1, r3, r2
	b _08048498
	.align 2, 0
_080480D8: .4byte 0x03004824
_080480DC: .4byte 0x0000043c
_080480E0:
	bl GetLinkPlayerCount_2
	adds r4, r0, 0
	bl sub_800820C
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bcs _080480F4
	b _080484C6
_080480F4:
	bl IsLinkMaster
	lsls r0, 24
	cmp r0, 0
	beq _08048120
	ldr r0, _0804811C
	ldr r1, [r0]
	adds r1, 0xB4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1E
	bhi _08048114
	b _080484C6
_08048114:
	bl sub_8007F4C
	b _08048492
	.align 2, 0
_0804811C: .4byte 0x03004824
_08048120:
	ldr r1, _08048128
	ldr r0, _0804812C
	adds r1, r0
	b _08048498
	.align 2, 0
_08048128: .4byte 0x03001770
_0804812C: .4byte 0x0000043c
_08048130:
	ldr r0, _08048154
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0804813A
	b _080484C6
_0804813A:
	bl IsLinkPlayerDataExchangeComplete
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08048148
	b _080484C6
_08048148:
	bl calc_player_party_count
	ldr r1, _08048158
	ldr r2, _0804815C
	adds r1, r2
	b _08048498
	.align 2, 0
_08048154: .4byte 0x03002fa4
_08048158: .4byte 0x03001770
_0804815C: .4byte 0x0000043c
_08048160:
	bl sub_8048D44
	lsls r0, 24
	cmp r0, 0
	bne _0804816C
	b _080484C6
_0804816C:
	bl sub_804AF84
	b _08048492
_08048172:
	bl calc_enemy_party_count
	ldr r4, _08048294
	ldr r0, [r4]
	adds r0, 0x4
	movs r1, 0x1D
	str r1, [sp]
	movs r1, 0x13
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillWindowRect_DefaultPalette
	movs r1, 0x80
	lsls r1, 19
	movs r0, 0
	strh r0, [r1]
	ldr r0, [r4]
	ldr r1, _08048298
	ldrb r1, [r1]
	adds r0, 0x42
	strb r1, [r0]
	ldr r0, [r4]
	ldr r1, _0804829C
	ldrb r1, [r1]
	adds r0, 0x43
	strb r1, [r0]
	movs r6, 0
	ldr r0, [r4]
	adds r0, 0x42
	ldrb r0, [r0]
	cmp r6, r0
	bge _08048216
	mov r8, r4
	ldr r7, _080482A0
_080481BA:
	movs r0, 0x64
	adds r4, r6, 0
	muls r4, r0
	ldr r0, _080482A4
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl PokemonGetField
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	movs r1, 0
	bl PokemonGetField
	ldrb r2, [r7]
	lsls r2, 19
	movs r1, 0xE0
	lsls r1, 12
	adds r2, r1
	asrs r2, 16
	ldrb r3, [r7, 0x1]
	lsls r3, 19
	ldr r1, _080482A8
	adds r3, r1
	asrs r3, 16
	movs r1, 0x1
	str r1, [sp]
	str r0, [sp, 0x4]
	adds r0, r5, 0
	ldr r1, _080482AC
	bl sub_809D2FC
	mov r2, r8
	ldr r1, [r2]
	adds r1, 0x34
	adds r1, r6
	strb r0, [r1]
	adds r7, 0x2
	adds r6, 0x1
	ldr r0, [r2]
	adds r0, 0x42
	ldrb r0, [r0]
	cmp r6, r0
	blt _080481BA
_08048216:
	movs r6, 0
	ldr r1, _08048294
	ldr r0, [r1]
	adds r0, 0x43
	ldrb r0, [r0]
	cmp r6, r0
	bge _0804828A
	ldr r0, _080482A0
	mov r8, r1
	adds r7, r0, 0
	adds r7, 0xC
_0804822C:
	movs r0, 0x64
	adds r4, r6, 0
	muls r4, r0
	ldr r0, _080482B0
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl PokemonGetField
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	movs r1, 0
	bl PokemonGetField
	ldrb r2, [r7]
	lsls r2, 19
	movs r3, 0xE0
	lsls r3, 12
	adds r2, r3
	asrs r2, 16
	ldrb r3, [r7, 0x1]
	lsls r3, 19
	ldr r1, _080482A8
	adds r3, r1
	asrs r3, 16
	movs r1, 0x1
	str r1, [sp]
	str r0, [sp, 0x4]
	adds r0, r5, 0
	ldr r1, _080482AC
	bl sub_809D2FC
	mov r2, r8
	ldr r1, [r2]
	adds r1, 0x3A
	adds r1, r6
	strb r0, [r1]
	adds r7, 0x2
	adds r6, 0x1
	ldr r0, [r2]
	adds r0, 0x43
	ldrb r0, [r0]
	cmp r6, r0
	blt _0804822C
_0804828A:
	movs r0, 0x2
	movs r1, 0
	bl nullsub_5
	b _08048492
	.align 2, 0
_08048294: .4byte 0x03004824
_08048298: .4byte 0x03004350
_0804829C: .4byte 0x030045b8
_080482A0: .4byte gTradeMonSpriteCoords
_080482A4: .4byte 0x03004360
_080482A8: .4byte 0xfff40000
_080482AC: .4byte sub_809D62C
_080482B0: .4byte 0x030045c0
_080482B4:
	bl sub_806DA98
	ldr r0, _080482D0
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x42
	adds r1, 0x34
	movs r2, 0
	bl sub_806DB90
	ldr r1, _080482D4
	ldr r0, _080482D8
	adds r1, r0
	b _08048498
	.align 2, 0
_080482D0: .4byte 0x03004824
_080482D4: .4byte 0x03001770
_080482D8: .4byte 0x0000043c
_080482DC:
	ldr r0, _080482F4
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x42
	adds r1, 0x34
	movs r2, 0x1
	bl sub_806DB90
	ldr r1, _080482F8
	ldr r2, _080482FC
	adds r1, r2
	b _08048498
	.align 2, 0
_080482F4: .4byte 0x03004824
_080482F8: .4byte 0x03001770
_080482FC: .4byte 0x0000043c
_08048300:
	bl sub_8047CE8
	ldr r1, _0804831C
	ldr r3, _08048320
	adds r1, r3
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	ldr r0, _08048324
	ldr r0, [r0]
	adds r0, 0xB4
	strb r2, [r0]
	b _080484C6
	.align 2, 0
_0804831C: .4byte 0x03001770
_08048320: .4byte 0x0000043c
_08048324: .4byte 0x03004824
_08048328:
	movs r0, 0x4
	movs r1, 0
	bl nullsub_5
	bl sub_804ABF8
	lsls r0, 24
	cmp r0, 0
	bne _0804833C
	b _080484C6
_0804833C:
	ldr r1, _08048344
	ldr r0, _08048348
	adds r1, r0
	b _08048498
	.align 2, 0
_08048344: .4byte 0x03001770
_08048348: .4byte 0x0000043c
_0804834C:
	bl sub_8047D58
	ldr r1, _08048358
	ldr r2, _0804835C
	adds r1, r2
	b _08048498
	.align 2, 0
_08048358: .4byte 0x03001770
_0804835C: .4byte 0x0000043c
_08048360:
	bl sub_8047E44
	ldr r0, _080483A4
	ldr r2, _080483A8
	ldrb r1, [r2]
	lsls r1, 19
	movs r3, 0x80
	lsls r3, 14
	adds r1, r3
	asrs r1, 16
	ldrb r2, [r2, 0x1]
	lsls r2, 3
	movs r3, 0x2
	bl CreateSprite
	ldr r2, _080483AC
	ldr r1, [r2]
	adds r1, 0x40
	movs r3, 0
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, 0x41
	strb r3, [r0]
	ldr r1, _080483B0
	ldr r0, _080483B4
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0x6
	movs r1, 0
	bl nullsub_5
	b _080484C6
	.align 2, 0
_080483A4: .4byte gSpriteTemplate_820C134
_080483A8: .4byte gTradeMonSpriteCoords
_080483AC: .4byte 0x03004824
_080483B0: .4byte 0x03001770
_080483B4: .4byte 0x0000043c
_080483B8:
	movs r0, 0
	bl sub_804ACF4
	movs r0, 0
	bl sub_804A41C
	ldr r2, _080483F0
	ldr r0, [r2]
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, 0x1]
	bl sub_8048C70
	ldr r1, _080483F4
	ldr r2, _080483F8
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0x7
	movs r1, 0
	bl nullsub_5
	ldr r0, _080483FC
	bl sub_8075474
	b _080484C6
	.align 2, 0
_080483F0: .4byte 0x03004824
_080483F4: .4byte 0x03001770
_080483F8: .4byte 0x0000043c
_080483FC: .4byte 0x000001b3
_08048400:
	movs r0, 0x1
	bl sub_804ACF4
	movs r0, 0x1
	bl sub_804A41C
	ldr r1, _08048428
	ldr r3, _0804842C
	adds r1, r3
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08048418:
	movs r0, 0
	bl sub_8048B0C
	ldr r1, _08048428
	ldr r0, _0804842C
	adds r1, r0
	b _08048498
	.align 2, 0
_08048428: .4byte 0x03001770
_0804842C: .4byte 0x0000043c
_08048430:
	movs r0, 0x1
	bl sub_8048B0C
	ldr r1, _08048440
	ldr r2, _08048444
	adds r1, r2
	b _08048498
	.align 2, 0
_08048440: .4byte 0x03001770
_08048444: .4byte 0x0000043c
_08048448:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _08048492
_0804845A:
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0804846C
	adds r1, r3, r0
	b _08048498
	.align 2, 0
_0804846C: .4byte 0x0000043c
_08048470:
	movs r0, 0
	bl sub_804AE3C
	ldr r1, _08048480
	ldr r2, _08048484
	adds r1, r2
	b _08048498
	.align 2, 0
_08048480: .4byte 0x03001770
_08048484: .4byte 0x0000043c
_08048488:
	movs r0, 0x1
	bl sub_804AE3C
	bl sub_804AF10
_08048492:
	ldr r1, _080484A0
	ldr r3, _080484A4
	adds r1, r3
_08048498:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080484C6
	.align 2, 0
_080484A0: .4byte 0x03001770
_080484A4: .4byte 0x0000043c
_080484A8:
	ldr r0, _080484E4
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080484C6
	ldr r0, _080484E8
	str r0, [r3]
	ldr r0, _080484EC
	bl SetMainCallback2
	ldr r0, _080484F0
	strb r4, [r0]
_080484C6:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080484E4: .4byte 0x0202f388
_080484E8: .4byte sub_80494D8
_080484EC: .4byte sub_8048AB4
_080484F0: .4byte 0x03000508
	thumb_func_end sub_8047EC0

	thumb_func_start sub_80484F4
sub_80484F4: @ 80484F4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	ldr r1, _08048518
	ldr r2, _0804851C
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x15
	bls _0804850C
	b _080489CA
_0804850C:
	lsls r0, 2
	ldr r1, _08048520
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08048518: .4byte 0x03001770
_0804851C: .4byte 0x0000043c
_08048520: .4byte _08048524
	.align 2, 0
_08048524:
	.4byte _0804857C
	.4byte _0804865C
	.4byte _08048668
	.4byte _08048674
	.4byte _08048680
	.4byte _08048694
	.4byte _080486A0
	.4byte _080487E8
	.4byte _08048810
	.4byte _08048834
	.4byte _0804885C
	.4byte _08048880
	.4byte _08048894
	.4byte _080489CA
	.4byte _080489CA
	.4byte _08048914
	.4byte _0804891C
	.4byte _08048950
	.4byte _08048970
	.4byte _08048988
	.4byte _08048994
	.4byte _080489B0
_0804857C:
	ldr r5, _08048630
	ldr r6, _08048634
	str r6, [r5]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r0, [r5]
	adds r0, 0xC8
	ldr r1, _08048638
	bl sub_804A964
	ldr r0, _0804863C
	bl SetVBlankCallback
	ldr r0, _08048640
	bl InitMenuWindowConfig
	ldr r4, _08048644
	adds r0, r4, 0
	bl SetUpWindowConfig
	ldr r0, [r5]
	adds r0, 0x4
	adds r1, r4, 0
	bl InitWindowFromConfig
	movs r0, 0x14
	bl SetTextWindowBaseTileNum
	ldr r1, [r5]
	adds r1, 0x7A
	movs r4, 0
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, 0x4
	bl LoadTextWindowGraphics
	bl MenuZeroFillScreen
	bl sub_809D51C
	ldr r0, [r5]
	adds r0, 0x75
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x7B
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x7C
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x80
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x81
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x86
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x87
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0xB4
	strb r4, [r0]
	ldr r0, _08048648
	strb r4, [r0]
	ldr r1, _0804864C
	ldr r3, _08048650
	adds r1, r3
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, _08048654
	movs r5, 0xD8
	lsls r5, 7
	adds r6, r5
	adds r0, r1, 0
	adds r0, 0x30
	ldr r2, _08048658
_08048622:
	str r6, [r0]
	adds r6, r2
	subs r0, 0x4
	cmp r0, r1
	bge _08048622
	b _080489CA
	.align 2, 0
_08048630: .4byte 0x03004824
_08048634: .4byte 0x02017000
_08048638: .4byte 0x06002800
_0804863C: .4byte sub_80489F4
_08048640: .4byte gWindowConfig_81E6CE4
_08048644: .4byte gWindowConfig_81E6F84
_08048648: .4byte 0x03000508
_0804864C: .4byte 0x03001770
_08048650: .4byte 0x0000043c
_08048654: .4byte 0x020296cc
_08048658: .4byte 0xffffff00
_0804865C:
	ldr r0, _08048664
	adds r1, r2, r0
	b _0804883E
	.align 2, 0
_08048664: .4byte 0x0000043c
_08048668:
	ldr r3, _08048670
	adds r1, r2, r3
	b _0804899E
	.align 2, 0
_08048670: .4byte 0x0000043c
_08048674:
	ldr r5, _0804867C
	adds r1, r2, r5
	b _0804899E
	.align 2, 0
_0804867C: .4byte 0x0000043c
_08048680:
	bl calc_player_party_count
	ldr r1, _0804868C
	ldr r0, _08048690
	adds r1, r0
	b _0804899E
	.align 2, 0
_0804868C: .4byte 0x03001770
_08048690: .4byte 0x0000043c
_08048694:
	ldr r3, _0804869C
	adds r1, r2, r3
	b _0804899E
	.align 2, 0
_0804869C: .4byte 0x0000043c
_080486A0:
	bl calc_enemy_party_count
	movs r1, 0x80
	lsls r1, 19
	movs r0, 0
	strh r0, [r1]
	ldr r4, _080487C0
	ldr r0, [r4]
	ldr r1, _080487C4
	ldrb r1, [r1]
	adds r0, 0x42
	strb r1, [r0]
	ldr r0, [r4]
	ldr r1, _080487C8
	ldrb r1, [r1]
	adds r0, 0x43
	strb r1, [r0]
	movs r0, 0
	bl sub_804A41C
	movs r0, 0x1
	bl sub_804A41C
	movs r6, 0
	ldr r0, [r4]
	adds r0, 0x42
	ldrb r0, [r0]
	cmp r6, r0
	bge _0804873C
	mov r8, r4
	ldr r7, _080487CC
_080486DE:
	movs r0, 0x64
	adds r4, r6, 0
	muls r4, r0
	ldr r0, _080487D0
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl PokemonGetField
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	movs r1, 0
	bl PokemonGetField
	ldrb r2, [r7]
	lsls r2, 19
	movs r1, 0xE0
	lsls r1, 12
	adds r2, r1
	asrs r2, 16
	ldrb r3, [r7, 0x1]
	lsls r3, 19
	ldr r1, _080487D4
	adds r3, r1
	asrs r3, 16
	movs r1, 0x1
	str r1, [sp]
	str r0, [sp, 0x4]
	adds r0, r5, 0
	ldr r1, _080487D8
	bl sub_809D2FC
	mov r2, r8
	ldr r1, [r2]
	adds r1, 0x34
	adds r1, r6
	strb r0, [r1]
	adds r7, 0x2
	adds r6, 0x1
	ldr r0, [r2]
	adds r0, 0x42
	ldrb r0, [r0]
	cmp r6, r0
	blt _080486DE
_0804873C:
	movs r6, 0
	ldr r1, _080487C0
	ldr r0, [r1]
	adds r0, 0x43
	ldrb r0, [r0]
	cmp r6, r0
	bge _080487B0
	ldr r0, _080487CC
	mov r8, r1
	adds r7, r0, 0
	adds r7, 0xC
_08048752:
	movs r0, 0x64
	adds r4, r6, 0
	muls r4, r0
	ldr r0, _080487DC
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl PokemonGetField
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	movs r1, 0
	bl PokemonGetField
	ldrb r2, [r7]
	lsls r2, 19
	movs r3, 0xE0
	lsls r3, 12
	adds r2, r3
	asrs r2, 16
	ldrb r3, [r7, 0x1]
	lsls r3, 19
	ldr r1, _080487D4
	adds r3, r1
	asrs r3, 16
	movs r1, 0x1
	str r1, [sp]
	str r0, [sp, 0x4]
	adds r0, r5, 0
	ldr r1, _080487D8
	bl sub_809D2FC
	mov r2, r8
	ldr r1, [r2]
	adds r1, 0x3A
	adds r1, r6
	strb r0, [r1]
	adds r7, 0x2
	adds r6, 0x1
	ldr r0, [r2]
	adds r0, 0x43
	ldrb r0, [r0]
	cmp r6, r0
	blt _08048752
_080487B0:
	movs r0, 0x2
	movs r1, 0
	bl nullsub_5
	ldr r1, _080487E0
	ldr r3, _080487E4
	adds r1, r3
	b _0804899E
	.align 2, 0
_080487C0: .4byte 0x03004824
_080487C4: .4byte 0x03004350
_080487C8: .4byte 0x030045b8
_080487CC: .4byte gTradeMonSpriteCoords
_080487D0: .4byte 0x03004360
_080487D4: .4byte 0xfff40000
_080487D8: .4byte sub_809D62C
_080487DC: .4byte 0x030045c0
_080487E0: .4byte 0x03001770
_080487E4: .4byte 0x0000043c
_080487E8:
	bl sub_806DA98
	ldr r0, _08048804
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x42
	adds r1, 0x34
	movs r2, 0
	bl sub_806DB90
	ldr r1, _08048808
	ldr r5, _0804880C
	adds r1, r5
	b _0804899E
	.align 2, 0
_08048804: .4byte 0x03004824
_08048808: .4byte 0x03001770
_0804880C: .4byte 0x0000043c
_08048810:
	ldr r0, _08048828
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x42
	adds r1, 0x34
	movs r2, 0x1
	bl sub_806DB90
	ldr r1, _0804882C
	ldr r0, _08048830
	adds r1, r0
	b _0804899E
	.align 2, 0
_08048828: .4byte 0x03004824
_0804882C: .4byte 0x03001770
_08048830: .4byte 0x0000043c
_08048834:
	bl sub_8047CE8
	ldr r1, _08048850
	ldr r2, _08048854
	adds r1, r2
_0804883E:
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	ldr r0, _08048858
	ldr r0, [r0]
	adds r0, 0xB4
	strb r2, [r0]
	b _080489CA
	.align 2, 0
_08048850: .4byte 0x03001770
_08048854: .4byte 0x0000043c
_08048858: .4byte 0x03004824
_0804885C:
	movs r0, 0x4
	movs r1, 0
	bl nullsub_5
	bl sub_804ABF8
	lsls r0, 24
	cmp r0, 0
	bne _08048870
	b _080489CA
_08048870:
	ldr r1, _08048878
	ldr r3, _0804887C
	adds r1, r3
	b _0804899E
	.align 2, 0
_08048878: .4byte 0x03001770
_0804887C: .4byte 0x0000043c
_08048880:
	bl sub_8047D58
	ldr r1, _0804888C
	ldr r5, _08048890
	adds r1, r5
	b _0804899E
	.align 2, 0
_0804888C: .4byte 0x03001770
_08048890: .4byte 0x0000043c
_08048894:
	bl sub_8047E44
	ldr r2, _080488AC
	ldr r0, _080488B0
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0x41
	ldrb r0, [r1]
	cmp r0, 0x5
	bhi _080488B4
	ldrb r0, [r2, 0x9]
	b _080488B8
	.align 2, 0
_080488AC: .4byte 0x02018000
_080488B0: .4byte 0x03004824
_080488B4:
	ldrb r0, [r2, 0x9]
	adds r0, 0x6
_080488B8:
	strb r0, [r1]
	ldr r0, _08048900
	ldr r3, _08048904
	ldr r4, _08048908
	ldr r1, [r4]
	adds r1, 0x41
	ldrb r2, [r1]
	lsls r2, 1
	adds r1, r2, r3
	ldrb r1, [r1]
	lsls r1, 19
	movs r5, 0x80
	lsls r5, 14
	adds r1, r5
	asrs r1, 16
	adds r3, 0x1
	adds r2, r3
	ldrb r2, [r2]
	lsls r2, 3
	movs r3, 0x2
	bl CreateSprite
	ldr r1, [r4]
	adds r1, 0x40
	strb r0, [r1]
	ldr r0, _0804890C
	ldr r1, _08048910
	adds r0, r1
	movs r1, 0xF
	strb r1, [r0]
	movs r0, 0x6
	movs r1, 0
	bl nullsub_5
	b _080489CA
	.align 2, 0
_08048900: .4byte gSpriteTemplate_820C134
_08048904: .4byte gTradeMonSpriteCoords
_08048908: .4byte 0x03004824
_0804890C: .4byte 0x03001770
_08048910: .4byte 0x0000043c
_08048914:
	movs r0, 0
	bl sub_8048B0C
	b _08048998
_0804891C:
	movs r0, 0x1
	bl sub_8048B0C
	ldr r2, _08048944
	ldr r0, [r2]
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, 0x1]
	bl sub_8048C70
	movs r0, 0x7
	movs r1, 0
	bl nullsub_5
	ldr r1, _08048948
	ldr r3, _0804894C
	adds r1, r3
	b _0804899E
	.align 2, 0
_08048944: .4byte 0x03004824
_08048948: .4byte 0x03001770
_0804894C: .4byte 0x0000043c
_08048950:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, _08048968
	ldr r5, _0804896C
	adds r1, r5
	b _0804899E
	.align 2, 0
_08048968: .4byte 0x03001770
_0804896C: .4byte 0x0000043c
_08048970:
	movs r1, 0x80
	lsls r1, 19
	movs r3, 0xFA
	lsls r3, 5
	adds r0, r3, 0
	strh r0, [r1]
	ldr r5, _08048984
	adds r1, r2, r5
	b _0804899E
	.align 2, 0
_08048984: .4byte 0x0000043c
_08048988:
	ldr r0, _08048990
	adds r1, r2, r0
	b _0804899E
	.align 2, 0
_08048990: .4byte 0x0000043c
_08048994:
	bl sub_804AF10
_08048998:
	ldr r1, _080489A8
	ldr r2, _080489AC
	adds r1, r2
_0804899E:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080489CA
	.align 2, 0
_080489A8: .4byte 0x03001770
_080489AC: .4byte 0x0000043c
_080489B0:
	ldr r0, _080489E8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080489CA
	ldr r0, _080489EC
	bl SetMainCallback2
	ldr r0, _080489F0
	strb r4, [r0]
_080489CA:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080489E8: .4byte 0x0202f388
_080489EC: .4byte sub_8048AB4
_080489F0: .4byte 0x03000508
	thumb_func_end sub_80484F4

	thumb_func_start sub_80489F4
sub_80489F4: @ 80489F4
	push {lr}
	ldr r0, _08048A10
	ldr r0, [r0]
	adds r0, 0xC8
	bl sub_804A940
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
_08048A10: .4byte 0x03004824
	thumb_func_end sub_80489F4

	thumb_func_start sub_8048A14
sub_8048A14: @ 8048A14
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _08048A4C
	ldr r1, [r4]
	adds r1, 0xB4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xF
	bls _08048A44
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0xA
	strb r1, [r0]
_08048A44:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048A4C: .4byte 0x03004824
	thumb_func_end sub_8048A14

	thumb_func_start sub_8048A50
sub_8048A50: @ 8048A50
	push {r4,lr}
	ldr r0, _08048A84
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08048A7E
	ldr r2, _08048A88
	ldr r4, _08048A8C
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0x41
	ldrb r1, [r1]
	strb r1, [r2]
	adds r0, 0x8A
	ldrb r0, [r0]
	strb r0, [r2, 0x1]
	bl sub_800832C
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0xD
	strb r1, [r0]
_08048A7E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048A84: .4byte 0x0202f388
_08048A88: .4byte 0x020297d8
_08048A8C: .4byte 0x03004824
	thumb_func_end sub_8048A50

	thumb_func_start sub_8048A90
sub_8048A90: @ 8048A90
	push {lr}
	ldr r0, _08048AA8
	ldrb r1, [r0]
	cmp r1, 0
	bne _08048AA4
	ldr r0, _08048AAC
	str r1, [r0]
	ldr r0, _08048AB0
	bl SetMainCallback2
_08048AA4:
	pop {r0}
	bx r0
	.align 2, 0
_08048AA8: .4byte 0x03002fa4
_08048AAC: .4byte 0x03001770
_08048AB0: .4byte sub_804B41C
	thumb_func_end sub_8048A90

	thumb_func_start sub_8048AB4
sub_8048AB4: @ 8048AB4
	push {r4,lr}
	bl sub_8049DE0
	bl sub_804AB30
	movs r0, 0
	bl sub_8049ED4
	movs r0, 0x1
	bl sub_8049ED4
	ldr r4, _08048B04
	ldr r3, _08048B08
	ldr r2, [r3]
	ldrb r0, [r2]
	adds r1, r0, 0x1
	strb r1, [r2]
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	adds r4, 0x4
	ldr r2, [r3]
	ldrb r0, [r2, 0x1]
	adds r1, r0, 0
	adds r1, 0xFF
	strb r1, [r2, 0x1]
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048B04: .4byte REG_BG2HOFS
_08048B08: .4byte 0x03004824
	thumb_func_end sub_8048AB4

	thumb_func_start sub_8048B0C
sub_8048B0C: @ 8048B0C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08048B1C
	cmp r0, 0x1
	beq _08048BD0
	b _08048C3A
_08048B1C:
	ldr r5, _08048BA0
	ldr r0, _08048BA4
	mov r12, r0
	ldr r1, _08048BA8
	ldr r4, _08048BAC
	ldr r3, _08048BB0
	movs r2, 0x2F
_08048B2A:
	ldrh r0, [r1]
	strh r0, [r3]
	ldrh r0, [r1]
	strh r0, [r4]
	adds r1, 0x2
	adds r4, 0x2
	adds r3, 0x2
	subs r2, 0x1
	cmp r2, 0
	bge _08048B2A
	adds r3, r5, 0
	movs r4, 0xC0
	lsls r4, 19
	movs r5, 0x94
	lsls r5, 5
	ldr r1, _08048BB4
	ldr r6, _08048BB8
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_08048B54:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _08048B54
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r2, 0
	ldr r5, _08048BBC
	ldr r4, _08048BC0
	ldr r3, _08048BC4
_08048B7A:
	ldr r0, [r4]
	lsls r1, r2, 1
	adds r0, 0xDA
	adds r0, r1
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, 0x2
	adds r2, 0x1
	cmp r2, r5
	ble _08048B7A
	ldr r1, _08048BC8
	ldr r0, _08048BB4
	mov r2, r12
	str r2, [r0]
	str r1, [r0, 0x4]
	ldr r1, _08048BCC
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	b _08048C3A
	.align 2, 0
_08048BA0: .4byte gUnknown_08EA0348
_08048BA4: .4byte gTradeStripesBG2Tilemap
_08048BA8: .4byte gUnknown_08EA02C8
_08048BAC: .4byte 0x0202eec8
_08048BB0: .4byte 0x0202eac8
_08048BB4: .4byte 0x040000d4
_08048BB8: .4byte 0x80000800
_08048BBC: .4byte 0x000003ff
_08048BC0: .4byte 0x03004824
_08048BC4: .4byte gUnknown_08EA15C8
_08048BC8: .4byte 0x06003000
_08048BCC: .4byte 0x80000400
_08048BD0:
	ldr r1, _08048C40
	ldr r2, _08048C44
	ldr r0, _08048C48
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _08048C4C
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	movs r0, 0
	bl sub_804A6DC
	movs r0, 0x1
	bl sub_804A6DC
	ldr r0, _08048C50
	ldr r0, [r0]
	adds r0, 0xC8
	bl sub_804A938
	ldr r2, _08048C54
	ldrh r1, [r2]
	ldr r0, _08048C58
	ands r0, r1
	strh r0, [r2]
	ldr r1, _08048C5C
	ldr r2, _08048C60
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _08048C64
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _08048C68
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08048C6C
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	subs r0, 0xA
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
_08048C3A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048C40: .4byte gTradeStripesBG3Tilemap
_08048C44: .4byte 0x06003800
_08048C48: .4byte 0x040000d4
_08048C4C: .4byte 0x80000400
_08048C50: .4byte 0x03004824
_08048C54: .4byte REG_BG0CNT
_08048C58: .4byte 0x0000fffc
_08048C5C: .4byte REG_BG1CNT
_08048C60: .4byte 0x00000501
_08048C64: .4byte 0x00000602
_08048C68: .4byte 0x00000703
_08048C6C: .4byte REG_BG0HOFS
	thumb_func_end sub_8048B0C

	thumb_func_start sub_8048C70
sub_8048C70: @ 8048C70
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r3, 0
	ldr r5, _08048CC0
	mov r8, r5
	ldr r0, _08048CC4
	mov r12, r0
	movs r1, 0x5
	negs r1, r1
	mov r9, r1
	movs r4, 0x6
	movs r7, 0x1
	movs r6, 0
_08048C8E:
	mov r1, r8
	ldr r0, [r1]
	adds r1, r0, 0
	adds r1, 0x42
	ldrb r1, [r1]
	cmp r3, r1
	bge _08048CC8
	adds r0, 0x34
	adds r0, r3
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r12
	adds r1, 0x3E
	ldrb r2, [r1]
	mov r0, r9
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, 0x44
	adds r0, r3
	strb r7, [r0]
	b _08048CCE
	.align 2, 0
_08048CC0: .4byte 0x03004824
_08048CC4: .4byte 0x02020004
_08048CC8:
	adds r0, 0x44
	adds r0, r3
	strb r6, [r0]
_08048CCE:
	mov r1, r8
	ldr r0, [r1]
	adds r1, r0, 0
	adds r1, 0x43
	ldrb r1, [r1]
	cmp r3, r1
	bge _08048CFE
	adds r0, 0x3A
	adds r0, r3
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r12
	adds r1, 0x3E
	ldrb r2, [r1]
	mov r0, r9
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, 0x44
	adds r0, r4
	strb r7, [r0]
	b _08048D04
_08048CFE:
	adds r0, 0x44
	adds r0, r4
	strb r6, [r0]
_08048D04:
	adds r4, 0x1
	adds r3, 0x1
	cmp r3, 0x5
	ble _08048C8E
	ldr r0, [r5]
	adds r0, 0x50
	movs r1, 0x1
	strb r1, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8048C70

	thumb_func_start nullsub_5
nullsub_5: @ 8048D20
	bx lr
	thumb_func_end nullsub_5

	thumb_func_start sub_8048D24
sub_8048D24: @ 8048D24
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r3, 0
	cmp r3, r2
	bcs _08048D3E
_08048D30:
	adds r0, r5, r3
	adds r1, r4, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, 0x1
	cmp r3, r2
	bcc _08048D30
_08048D3E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8048D24

	thumb_func_start sub_8048D44
sub_8048D44: @ 8048D44
	push {r4-r7,lr}
	sub sp, 0xC
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r6, _08048D90
	ldr r0, [r6]
	adds r0, 0x75
	ldrb r5, [r0]
	adds r0, r5, 0
	movs r1, 0x64
	bl __udivsi3
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x64
	bl __umodsi3
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl SetLinkDebugValues
	ldr r0, [r6]
	adds r0, 0x75
	ldrb r0, [r0]
	cmp r0, 0x10
	bls _08048D86
	b _0804907C
_08048D86:
	lsls r0, 2
	ldr r1, _08048D94
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08048D90: .4byte 0x03004824
_08048D94: .4byte _08048D98
	.align 2, 0
_08048D98:
	.4byte _08048DDC
	.4byte _08048DF8
	.4byte _08048E28
	.4byte _08048E3C
	.4byte _08048E74
	.4byte _08048E90
	.4byte _08048EA4
	.4byte _08048EDC
	.4byte _08048EF8
	.4byte _08048F0C
	.4byte _08048F44
	.4byte _08048F60
	.4byte _08048F74
	.4byte _08048FAC
	.4byte _08048FC8
	.4byte _08048FDC
	.4byte _08049018
_08048DDC:
	ldr r0, _08048DEC
	ldr r1, _08048DF0
	movs r2, 0xC8
	bl sub_8048D24
	ldr r0, _08048DF4
	ldr r1, [r0]
	b _08049006
	.align 2, 0
_08048DEC: .4byte 0x03002a70
_08048DF0: .4byte 0x03004360
_08048DF4: .4byte 0x03004824
_08048DF8:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _08048E04
	b _0804907C
_08048E04:
	bl GetBlockRecievedStatus
	lsls r0, 24
	cmp r0, 0
	bne _08048E18
	ldr r0, _08048E14
	ldr r1, [r0]
	b _08049006
	.align 2, 0
_08048E14: .4byte 0x03004824
_08048E18:
	bl ResetBlockReceivedFlags
	ldr r0, _08048E24
	ldr r1, [r0]
	b _08049006
	.align 2, 0
_08048E24: .4byte 0x03004824
_08048E28:
	cmp r7, 0
	bne _08048E32
	movs r0, 0x1
	bl sub_8007E9C
_08048E32:
	ldr r0, _08048E38
	ldr r1, [r0]
	b _08049006
	.align 2, 0
_08048E38: .4byte 0x03004824
_08048E3C:
	bl GetBlockRecievedStatus
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _08048E4A
	b _0804907C
_08048E4A:
	ldr r0, _08048E68
	movs r2, 0x1
	adds r1, r7, 0
	eors r1, r2
	lsls r1, 8
	ldr r2, _08048E6C
	adds r1, r2
	movs r2, 0xC8
	bl sub_8048D24
	bl ResetBlockReceivedFlags
	ldr r0, _08048E70
	ldr r1, [r0]
	b _08049006
	.align 2, 0
_08048E68: .4byte 0x030045c0
_08048E6C: .4byte 0x03002b80
_08048E70: .4byte 0x03004824
_08048E74:
	ldr r0, _08048E84
	ldr r1, _08048E88
	movs r2, 0xC8
	bl sub_8048D24
	ldr r0, _08048E8C
	ldr r1, [r0]
	b _08049006
	.align 2, 0
_08048E84: .4byte 0x03002a70
_08048E88: .4byte 0x03004428
_08048E8C: .4byte 0x03004824
_08048E90:
	cmp r7, 0
	bne _08048E9A
	movs r0, 0x1
	bl sub_8007E9C
_08048E9A:
	ldr r0, _08048EA0
	ldr r1, [r0]
	b _08049006
	.align 2, 0
_08048EA0: .4byte 0x03004824
_08048EA4:
	bl GetBlockRecievedStatus
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _08048EB2
	b _0804907C
_08048EB2:
	ldr r0, _08048ED0
	movs r2, 0x1
	adds r1, r7, 0
	eors r1, r2
	lsls r1, 8
	ldr r2, _08048ED4
	adds r1, r2
	movs r2, 0xC8
	bl sub_8048D24
	bl ResetBlockReceivedFlags
	ldr r0, _08048ED8
	ldr r1, [r0]
	b _08049006
	.align 2, 0
_08048ED0: .4byte 0x03004688
_08048ED4: .4byte 0x03002b80
_08048ED8: .4byte 0x03004824
_08048EDC:
	ldr r0, _08048EEC
	ldr r1, _08048EF0
	movs r2, 0xC8
	bl sub_8048D24
	ldr r0, _08048EF4
	ldr r1, [r0]
	b _08049006
	.align 2, 0
_08048EEC: .4byte 0x03002a70
_08048EF0: .4byte 0x030044f0
_08048EF4: .4byte 0x03004824
_08048EF8:
	cmp r7, 0
	bne _08048F02
	movs r0, 0x1
	bl sub_8007E9C
_08048F02:
	ldr r0, _08048F08
	ldr r1, [r0]
	b _08049006
	.align 2, 0
_08048F08: .4byte 0x03004824
_08048F0C:
	bl GetBlockRecievedStatus
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _08048F1A
	b _0804907C
_08048F1A:
	ldr r0, _08048F38
	movs r2, 0x1
	adds r1, r7, 0
	eors r1, r2
	lsls r1, 8
	ldr r2, _08048F3C
	adds r1, r2
	movs r2, 0xC8
	bl sub_8048D24
	bl ResetBlockReceivedFlags
	ldr r0, _08048F40
	ldr r1, [r0]
	b _08049006
	.align 2, 0
_08048F38: .4byte 0x03004750
_08048F3C: .4byte 0x03002b80
_08048F40: .4byte 0x03004824
_08048F44:
	ldr r0, _08048F54
	ldr r1, _08048F58
	movs r2, 0xDC
	bl sub_8048D24
	ldr r0, _08048F5C
	ldr r1, [r0]
	b _08049006
	.align 2, 0
_08048F54: .4byte 0x03002a70
_08048F58: .4byte 0x02028280
_08048F5C: .4byte 0x03004824
_08048F60:
	cmp r7, 0
	bne _08048F6A
	movs r0, 0x3
	bl sub_8007E9C
_08048F6A:
	ldr r0, _08048F70
	ldr r1, [r0]
	b _08049006
	.align 2, 0
_08048F70: .4byte 0x03004824
_08048F74:
	bl GetBlockRecievedStatus
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _08048F82
	b _0804907C
_08048F82:
	ldr r0, _08048FA0
	movs r2, 0x1
	adds r1, r7, 0
	eors r1, r2
	lsls r1, 8
	ldr r2, _08048FA4
	adds r1, r2
	movs r2, 0xD8
	bl sub_8048D24
	bl ResetBlockReceivedFlags
	ldr r0, _08048FA8
	ldr r1, [r0]
	b _08049006
	.align 2, 0
_08048FA0: .4byte 0x02029700
_08048FA4: .4byte 0x03002b80
_08048FA8: .4byte 0x03004824
_08048FAC:
	ldr r0, _08048FBC
	ldr r1, _08048FC0
	movs r2, 0xB
	bl sub_8048D24
	ldr r0, _08048FC4
	ldr r1, [r0]
	b _08049006
	.align 2, 0
_08048FBC: .4byte 0x03002a70
_08048FC0: .4byte 0x02028844
_08048FC4: .4byte 0x03004824
_08048FC8:
	cmp r7, 0
	bne _08048FD2
	movs r0, 0x4
	bl sub_8007E9C
_08048FD2:
	ldr r0, _08048FD8
	ldr r1, [r0]
	b _08049006
	.align 2, 0
_08048FD8: .4byte 0x03004824
_08048FDC:
	bl GetBlockRecievedStatus
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _0804907C
	ldr r4, _08049010
	ldr r0, [r4]
	adds r0, 0xB5
	movs r2, 0x1
	adds r1, r7, 0
	eors r1, r2
	lsls r1, 8
	ldr r2, _08049014
	adds r1, r2
	movs r2, 0xB
	bl sub_8048D24
	bl ResetBlockReceivedFlags
	ldr r1, [r4]
_08049006:
	adds r1, 0x75
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0804907C
	.align 2, 0
_08049010: .4byte 0x03004824
_08049014: .4byte 0x03002b80
_08049018:
	ldr r4, _0804906C
	ldr r6, _08049070
	movs r5, 0x5
_0804901E:
	adds r0, r4, 0
	movs r1, 0xB
	bl PokemonGetField
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	beq _0804905E
	cmp r0, r6
	bne _0804905E
	adds r0, r4, 0
	movs r1, 0x3
	bl PokemonGetField
	cmp r0, 0x1
	beq _0804905E
	adds r0, r4, 0
	movs r1, 0x2
	mov r2, sp
	bl PokemonGetField
	mov r0, sp
	ldr r1, _08049074
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	bne _0804905E
	adds r0, r4, 0
	movs r1, 0x2
	ldr r2, _08049078
	bl pokemon_setattr
_0804905E:
	adds r4, 0x64
	subs r5, 0x1
	cmp r5, 0
	bge _0804901E
	movs r0, 0x1
	b _0804907E
	.align 2, 0
_0804906C: .4byte 0x030045c0
_08049070: .4byte 0x0000012f
_08049074: .4byte gUnknown_0820C3B0
_08049078: .4byte gSpeciesNames + 0xD05
_0804907C:
	movs r0, 0
_0804907E:
	add sp, 0xC
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8048D44

	thumb_func_start sub_8049088
sub_8049088: @ 8049088
	push {lr}
	sub sp, 0x1C
	ldr r1, _080490B0
	mov r0, sp
	bl StringCopy
	ldr r0, _080490B4
	ldr r0, [r0]
	adds r0, 0x7E
	ldrh r1, [r0]
	lsls r1, 5
	ldr r0, _080490B8
	adds r1, r0
	mov r0, sp
	movs r2, 0x14
	bl sub_804ACD8
	add sp, 0x1C
	pop {r0}
	bx r0
	.align 2, 0
_080490B0: .4byte gUnknown_0842C7B6
_080490B4: .4byte 0x03004824
_080490B8: .4byte 0x06010000
	thumb_func_end sub_8049088

	thumb_func_start sub_80490BC
sub_80490BC: @ 80490BC
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	movs r3, 0x1
	adds r0, r4, 0
	ands r0, r3
	cmp r0, 0
	beq _08049148
	ldr r1, _080490EC
	lsls r0, r2, 8
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _080490F0
	cmp r1, r0
	beq _08049128
	cmp r1, r0
	bgt _080490F8
	ldr r0, _080490F4
	cmp r1, r0
	beq _08049118
	b _08049142
	.align 2, 0
_080490EC: .4byte 0x03002b80
_080490F0: .4byte 0x0000bbbb
_080490F4: .4byte 0x0000aabb
_080490F8:
	ldr r0, _0804910C
	cmp r1, r0
	beq _08049138
	ldr r0, _08049110
	cmp r1, r0
	bne _08049142
	ldr r0, _08049114
	ldr r0, [r0]
	adds r0, 0x84
	b _0804913E
	.align 2, 0
_0804910C: .4byte 0x0000bbcc
_08049110: .4byte 0x0000eeaa
_08049114: .4byte 0x03004824
_08049118:
	ldr r0, _08049124
	ldr r0, [r0]
	adds r0, 0x84
	strb r3, [r0]
	b _08049142
	.align 2, 0
_08049124: .4byte 0x03004824
_08049128:
	ldr r0, _08049134
	ldr r0, [r0]
	adds r0, 0x86
	strb r3, [r0]
	b _08049142
	.align 2, 0
_08049134: .4byte 0x03004824
_08049138:
	ldr r0, _08049170
	ldr r0, [r0]
	adds r0, 0x86
_0804913E:
	movs r1, 0x2
	strb r1, [r0]
_08049142:
	movs r0, 0
	bl ResetBlockReceivedFlag
_08049148:
	movs r2, 0x2
	adds r0, r4, 0
	ands r0, r2
	cmp r0, 0
	beq _080491DA
	ldr r3, _08049174
	movs r1, 0x80
	lsls r1, 1
	adds r0, r3, r1
	ldrh r1, [r0]
	ldr r0, _08049178
	cmp r1, r0
	beq _080491BC
	cmp r1, r0
	bgt _08049180
	ldr r0, _0804917C
	cmp r1, r0
	beq _080491A0
	b _080491D4
	.align 2, 0
_08049170: .4byte 0x03004824
_08049174: .4byte 0x03002b80
_08049178: .4byte 0x0000bbbb
_0804917C: .4byte 0x0000aabb
_08049180:
	ldr r0, _08049194
	cmp r1, r0
	beq _080491CC
	ldr r0, _08049198
	cmp r1, r0
	bne _080491D4
	ldr r0, _0804919C
	ldr r0, [r0]
	adds r0, 0x85
	b _080491D2
	.align 2, 0
_08049194: .4byte 0x0000bbcc
_08049198: .4byte 0x0000eeaa
_0804919C: .4byte 0x03004824
_080491A0:
	ldr r2, _080491B8
	ldr r1, [r2]
	movs r4, 0x81
	lsls r4, 1
	adds r0, r3, r4
	ldrb r0, [r0]
	adds r0, 0x6
	adds r1, 0x8A
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, 0x85
	b _080491C2
	.align 2, 0
_080491B8: .4byte 0x03004824
_080491BC:
	ldr r0, _080491C8
	ldr r0, [r0]
	adds r0, 0x87
_080491C2:
	movs r1, 0x1
	strb r1, [r0]
	b _080491D4
	.align 2, 0
_080491C8: .4byte 0x03004824
_080491CC:
	ldr r0, _080491E0
	ldr r0, [r0]
	adds r0, 0x87
_080491D2:
	strb r2, [r0]
_080491D4:
	movs r0, 0x1
	bl ResetBlockReceivedFlag
_080491DA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080491E0: .4byte 0x03004824
	thumb_func_end sub_80490BC

	thumb_func_start sub_80491E4
sub_80491E4: @ 80491E4
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r1, 24
	lsrs r5, r1, 24
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	beq _080492BE
	ldr r2, _08049210
	ldrh r1, [r2]
	ldr r0, _08049214
	cmp r1, r0
	beq _080492A8
	cmp r1, r0
	bgt _08049220
	ldr r0, _08049218
	cmp r1, r0
	beq _08049288
	ldr r0, _0804921C
	cmp r1, r0
	beq _0804925C
	b _080492B8
	.align 2, 0
_08049210: .4byte 0x03002b80
_08049214: .4byte 0x0000ddee
_08049218: .4byte 0x0000ccdd
_0804921C: .4byte 0x0000dddd
_08049220:
	ldr r0, _08049230
	cmp r1, r0
	beq _08049234
	adds r0, 0x11
	cmp r1, r0
	beq _08049258
	b _080492B8
	.align 2, 0
_08049230: .4byte 0x0000eebb
_08049234:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r0, 0x4
	bl sub_804AA0C
	ldr r0, _08049254
	ldr r0, [r0]
	adds r0, 0x7B
	movs r1, 0xB
	b _080492B6
	.align 2, 0
_08049254: .4byte 0x03004824
_08049258:
	movs r0, 0x5
	b _080492AA
_0804925C:
	ldr r4, _08049284
	ldr r1, [r4]
	ldrb r0, [r2, 0x2]
	adds r0, 0x6
	adds r1, 0x8A
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, 0x41
	ldrb r0, [r0]
	bl sub_8049E9C
	ldr r0, [r4]
	adds r0, 0x8A
	ldrb r0, [r0]
	bl sub_8049E9C
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0x7
	b _080492B6
	.align 2, 0
_08049284: .4byte 0x03004824
_08049288:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _080492A4
	ldr r0, [r0]
	adds r0, 0x7B
	movs r1, 0xA
	b _080492B6
	.align 2, 0
_080492A4: .4byte 0x03004824
_080492A8:
	movs r0, 0x1
_080492AA:
	bl sub_804AA0C
	ldr r0, _080492D4
	ldr r0, [r0]
	adds r0, 0x7B
	movs r1, 0x8
_080492B6:
	strb r1, [r0]
_080492B8:
	movs r0, 0
	bl ResetBlockReceivedFlag
_080492BE:
	movs r0, 0x2
	ands r0, r5
	cmp r0, 0
	beq _080492CC
	movs r0, 0x1
	bl ResetBlockReceivedFlag
_080492CC:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080492D4: .4byte 0x03004824
	thumb_func_end sub_80491E4

	thumb_func_start sub_80492D8
sub_80492D8: @ 80492D8
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r6, _08049334
	ldr r2, [r6]
	adds r1, r2, 0
	adds r1, 0x84
	ldrb r0, [r1]
	cmp r0, 0
	bne _080492EC
	b _08049420
_080492EC:
	adds r0, r2, 0
	adds r0, 0x85
	ldrb r0, [r0]
	cmp r0, 0
	bne _080492F8
	b _08049420
_080492F8:
	ldrh r1, [r1]
	ldr r0, _08049338
	cmp r1, r0
	bne _08049340
	adds r1, r2, 0
	adds r1, 0x7B
	movs r0, 0x6
	strb r0, [r1]
	ldr r2, [r6]
	adds r1, r2, 0
	adds r1, 0x8C
	movs r4, 0
	ldr r0, _0804933C
	strh r0, [r1]
	adds r0, r2, 0
	adds r0, 0x41
	ldrb r1, [r0]
	adds r0, 0x4D
	strh r1, [r0]
	movs r0, 0x5
	movs r1, 0
	bl sub_804AADC
	ldr r0, [r6]
	adds r2, r0, 0
	adds r2, 0x85
	strb r4, [r2]
	adds r0, 0x84
	strb r4, [r0]
	b _08049420
	.align 2, 0
_08049334: .4byte 0x03004824
_08049338: .4byte 0x00000101
_0804933C: .4byte 0x0000dddd
_08049340:
	ldr r0, _08049388
	cmp r1, r0
	bne _08049390
	movs r0, 0x1
	bl sub_804AA0C
	ldr r1, [r6]
	adds r2, r1, 0
	adds r2, 0x8C
	movs r4, 0
	movs r3, 0
	ldr r0, _0804938C
	strh r0, [r2]
	adds r1, 0x8E
	strh r3, [r1]
	movs r0, 0x5
	movs r1, 0
	bl sub_804AADC
	ldr r0, [r6]
	adds r1, r0, 0
	adds r1, 0x87
	strb r4, [r1]
	adds r0, 0x86
	strb r4, [r0]
	ldr r0, [r6]
	adds r1, r0, 0
	adds r1, 0x85
	strb r4, [r1]
	adds r0, 0x84
	strb r4, [r0]
	ldr r0, [r6]
	adds r0, 0x7B
	movs r1, 0x8
	b _0804941E
	.align 2, 0
_08049388: .4byte 0x00000201
_0804938C: .4byte 0x0000eecc
_08049390:
	movs r0, 0x81
	lsls r0, 1
	cmp r1, r0
	bne _080493DC
	movs r0, 0x5
	bl sub_804AA0C
	ldr r1, [r6]
	adds r2, r1, 0
	adds r2, 0x8C
	movs r4, 0
	movs r3, 0
	ldr r0, _080493D8
	strh r0, [r2]
	adds r1, 0x8E
	strh r3, [r1]
	movs r0, 0x5
	movs r1, 0
	bl sub_804AADC
	ldr r0, [r6]
	adds r1, r0, 0
	adds r1, 0x87
	strb r4, [r1]
	adds r0, 0x86
	strb r4, [r0]
	ldr r0, [r6]
	adds r1, r0, 0
	adds r1, 0x85
	strb r4, [r1]
	adds r0, 0x84
	strb r4, [r0]
	ldr r0, [r6]
	adds r0, 0x7B
	movs r1, 0x8
	b _0804941E
	.align 2, 0
_080493D8: .4byte 0x0000ddee
_080493DC:
	ldr r0, _080494C0
	cmp r1, r0
	bne _08049420
	adds r1, r2, 0
	adds r1, 0x8C
	movs r5, 0
	movs r4, 0
	ldr r0, _080494C4
	strh r0, [r1]
	adds r0, r2, 0
	adds r0, 0x8E
	strh r4, [r0]
	movs r0, 0x5
	movs r1, 0
	bl sub_804AADC
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, [r6]
	adds r1, r0, 0
	adds r1, 0x85
	strb r5, [r1]
	adds r0, 0x84
	strb r5, [r0]
	ldr r0, [r6]
	adds r0, 0x7B
	movs r1, 0xB
_0804941E:
	strb r1, [r0]
_08049420:
	ldr r5, _080494C8
	ldr r3, [r5]
	adds r1, r3, 0
	adds r1, 0x86
	ldrb r0, [r1]
	cmp r0, 0
	beq _080494B8
	adds r0, r3, 0
	adds r0, 0x87
	ldrb r0, [r0]
	cmp r0, 0
	beq _080494B8
	ldrh r1, [r1]
	ldr r0, _080494CC
	cmp r1, r0
	bne _0804946E
	adds r1, r3, 0
	adds r1, 0x8C
	movs r4, 0
	movs r2, 0
	ldr r0, _080494D0
	strh r0, [r1]
	adds r0, r3, 0
	adds r0, 0x8E
	strh r2, [r0]
	movs r0, 0x5
	movs r1, 0
	bl sub_804AADC
	ldr r0, [r5]
	adds r0, 0x86
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x87
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x7B
	movs r1, 0x9
	strb r1, [r0]
_0804946E:
	ldr r1, [r5]
	adds r0, r1, 0
	adds r0, 0x86
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _08049484
	adds r0, r1, 0
	adds r0, 0x87
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _080494B8
_08049484:
	movs r0, 0x1
	bl sub_804AA0C
	ldr r1, [r5]
	adds r2, r1, 0
	adds r2, 0x8C
	movs r4, 0
	movs r3, 0
	ldr r0, _080494D4
	strh r0, [r2]
	adds r1, 0x8E
	strh r3, [r1]
	movs r0, 0x5
	movs r1, 0
	bl sub_804AADC
	ldr r0, [r5]
	adds r0, 0x86
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x87
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x7B
	movs r1, 0x8
	strb r1, [r0]
_080494B8:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080494C0: .4byte 0x00000202
_080494C4: .4byte 0x0000eebb
_080494C8: .4byte 0x03004824
_080494CC: .4byte 0x00000101
_080494D0: .4byte 0x0000ccdd
_080494D4: .4byte 0x0000ddee
	thumb_func_end sub_80492D8

	thumb_func_start sub_80494D8
sub_80494D8: @ 80494D8
	push {r4,lr}
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r4, r0, 24
	bl GetBlockRecievedStatus
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _08049504
	cmp r4, 0
	bne _080494FA
	movs r0, 0
	bl sub_80490BC
	b _08049500
_080494FA:
	adds r0, r4, 0
	bl sub_80491E4
_08049500:
	bl ResetBlockReceivedFlags
_08049504:
	cmp r4, 0
	bne _0804950C
	bl sub_80492D8
_0804950C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80494D8

	thumb_func_start sub_8049514
sub_8049514: @ 8049514
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	movs r6, 0
	movs r5, 0
	ldr r2, _08049548
	ldr r3, [r2]
	ldr r4, _0804954C
	lsls r2, r1, 1
	adds r2, r1
	lsls r2, 1
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r3, 0x44
	adds r2, r1
	adds r2, r4
_0804953A:
	ldrb r1, [r2]
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08049550
	adds r6, r1, 0
	b _08049558
	.align 2, 0
_08049548: .4byte 0x03004824
_0804954C: .4byte gTradeNextSelectedMonTable
_08049550:
	adds r2, 0x1
	adds r5, 0x1
	cmp r5, 0x5
	ble _0804953A
_08049558:
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8049514

	thumb_func_start sub_8049560
sub_8049560: @ 8049560
	push {r4-r7,lr}
	adds r7, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r7]
	bl sub_8049514
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xC
	bne _080495B8
	ldr r5, _080495B0
	ldr r0, [r5]
	adds r0, 0x40
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080495B4
	adds r0, r4
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r2, [r5]
	adds r2, 0x40
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xE0
	strh r1, [r0, 0x20]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xA0
	strh r1, [r0, 0x22]
	b _08049600
	.align 2, 0
_080495B0: .4byte 0x03004824
_080495B4: .4byte 0x02020004
_080495B8:
	ldr r4, _08049614
	ldr r0, [r4]
	adds r0, 0x40
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _08049618
	adds r0, r5
	movs r1, 0
	bl StartSpriteAnim
	ldr r4, [r4]
	adds r4, 0x40
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldr r2, _0804961C
	lsls r3, r6, 1
	adds r0, r3, r2
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, 0x20
	strh r0, [r1, 0x20]
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r2, 0x1
	adds r3, r2
	ldrb r0, [r3]
	lsls r0, 3
	strh r0, [r1, 0x22]
_08049600:
	ldrb r0, [r7]
	cmp r0, r6
	beq _0804960C
	movs r0, 0x5
	bl audio_play
_0804960C:
	strb r6, [r7]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049614: .4byte 0x03004824
_08049618: .4byte 0x02020004
_0804961C: .4byte gTradeMonSpriteCoords
	thumb_func_end sub_8049560

	thumb_func_start sub_8049620
sub_8049620: @ 8049620
	push {r4,lr}
	movs r0, 0
	bl sub_804AA0C
	ldr r4, _08049668
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0x5
	strb r1, [r0]
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08049670
	ldr r2, [r4]
	adds r1, r2, 0
	adds r1, 0x8C
	ldr r0, _0804966C
	strh r0, [r1]
	adds r0, r2, 0
	adds r0, 0x41
	ldrb r1, [r0]
	adds r0, 0x4D
	strh r1, [r0]
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	adds r1, 0x8C
	movs r2, 0x14
	bl SendBlock
	b _08049678
	.align 2, 0
_08049668: .4byte 0x03004824
_0804966C: .4byte 0x0000aabb
_08049670:
	ldr r0, [r4]
	adds r0, 0x84
	movs r1, 0x1
	strb r1, [r0]
_08049678:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8049620

	thumb_func_start sub_8049680
sub_8049680: @ 8049680
	push {r4,lr}
	sub sp, 0x8
	ldr r0, _080496A0
	ldrh r1, [r0, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080496A8
	ldr r0, _080496A4
	ldr r0, [r0]
	adds r0, 0x41
	movs r1, 0
	bl sub_8049560
	b _080496F4
	.align 2, 0
_080496A0: .4byte 0x03001770
_080496A4: .4byte 0x03004824
_080496A8:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080496C4
	ldr r0, _080496C0
	ldr r0, [r0]
	adds r0, 0x41
	movs r1, 0x1
	bl sub_8049560
	b _080496F4
	.align 2, 0
_080496C0: .4byte 0x03004824
_080496C4:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080496E0
	ldr r0, _080496DC
	ldr r0, [r0]
	adds r0, 0x41
	movs r1, 0x2
	bl sub_8049560
	b _080496F4
	.align 2, 0
_080496DC: .4byte 0x03004824
_080496E0:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080496F4
	ldr r0, _08049750
	ldr r0, [r0]
	adds r0, 0x41
	movs r1, 0x3
	bl sub_8049560
_080496F4:
	ldr r0, _08049754
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080497B6
	movs r0, 0x5
	bl audio_play
	ldr r4, _08049750
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0x41
	ldrb r1, [r1]
	cmp r1, 0x5
	bhi _0804975C
	adds r0, 0x4
	movs r1, 0x13
	str r1, [sp]
	movs r1, 0x12
	movs r2, 0xE
	movs r3, 0x1C
	bl DrawTextWindow
	ldr r3, _08049758
	movs r0, 0x13
	movs r1, 0xF
	movs r2, 0x2
	bl PrintMenuItems
	movs r0, 0
	str r0, [sp]
	movs r0, 0x9
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x13
	movs r2, 0xF
	movs r3, 0x2
	bl InitMenu
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0x1
	strb r1, [r0]
	b _080497B6
	.align 2, 0
_08049750: .4byte 0x03004824
_08049754: .4byte 0x03001770
_08049758: .4byte gUnknown_0820C320
_0804975C:
	cmp r1, 0xB
	bhi _0804977A
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0x2
	strb r1, [r0]
	b _080497B6
_0804977A:
	cmp r1, 0xC
	bne _080497B6
	adds r0, 0x4
	movs r1, 0x13
	str r1, [sp]
	movs r1, 0x18
	movs r2, 0xE
	movs r3, 0x1D
	bl DrawTextWindow
	movs r0, 0x18
	movs r1, 0xE
	movs r2, 0x4
	bl InitYesNoMenu
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0x4
	strb r1, [r0]
	ldr r0, _080497F4
	ldr r0, [r0, 0x10]
	ldr r1, [r4]
	adds r1, 0x7E
	ldrh r1, [r1]
	lsls r1, 5
	ldr r2, _080497F8
	adds r1, r2
	movs r2, 0x14
	bl sub_804ACD8
_080497B6:
	ldr r0, _080497FC
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080497EC
	movs r2, 0
	ldr r3, _08049800
_080497C8:
	ldr r0, [r3]
	lsls r1, r2, 1
	adds r0, 0x8C
	adds r0, r1
	strh r2, [r0]
	adds r2, 0x1
	cmp r2, 0x9
	ble _080497C8
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08049800
	ldr r1, [r1]
	adds r1, 0x8C
	movs r2, 0x14
	bl SendBlock
_080497EC:
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080497F4: .4byte gUnknown_0820C14C
_080497F8: .4byte 0x06010000
_080497FC: .4byte 0x03001770
_08049800: .4byte 0x03004824
	thumb_func_end sub_8049680

	thumb_func_start sub_8049804
sub_8049804: @ 8049804
	push {lr}
	bl sub_8072DEC
	bl sub_804A80C
	ldr r3, _08049850
	ldr r0, [r3]
	adds r0, 0x7B
	movs r1, 0
	strb r1, [r0]
	ldr r2, _08049854
	ldr r0, [r3]
	adds r0, 0x40
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldr r0, _08049858
	ldr r0, [r0, 0x4]
	ldr r1, [r3]
	adds r1, 0x7E
	ldrh r1, [r1]
	lsls r1, 5
	ldr r2, _0804985C
	adds r1, r2
	movs r2, 0x14
	bl sub_804ACD8
	pop {r0}
	bx r0
	.align 2, 0
_08049850: .4byte 0x03004824
_08049854: .4byte 0x02020004
_08049858: .4byte gUnknown_0820C14C
_0804985C: .4byte 0x06010000
	thumb_func_end sub_8049804

	thumb_func_start sub_8049860
sub_8049860: @ 8049860
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _0804987C
	ldrh r1, [r0, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08049880
	movs r0, 0x5
	bl audio_play
	movs r0, 0x1
	negs r0, r0
	b _08049890
	.align 2, 0
_0804987C: .4byte 0x03001770
_08049880:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804989C
	movs r0, 0x5
	bl audio_play
	movs r0, 0x1
_08049890:
	bl MoveMenuCursor
	ldr r1, _080498D8
	ldr r1, [r1]
	adds r1, 0x7C
	strb r0, [r1]
_0804989C:
	ldr r0, _080498DC
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08049938
	movs r0, 0x5
	bl audio_play
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _080498E0
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _080498D8
	ldr r0, [r0]
	adds r0, 0x7B
	movs r1, 0x2
	strb r1, [r0]
	b _0804994A
	.align 2, 0
_080498D8: .4byte 0x03004824
_080498DC: .4byte 0x03001770
_080498E0:
	ldr r4, _08049910
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x51
	adds r1, r2, 0
	adds r1, 0x42
	ldrb r1, [r1]
	adds r2, 0x41
	ldrb r2, [r2]
	bl sub_80499F0
	lsls r0, 24
	cmp r0, 0
	bne _08049914
	movs r0, 0x3
	movs r1, 0x2
	bl sub_804AADC
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0x8
	strb r1, [r0]
	b _0804994A
	.align 2, 0
_08049910: .4byte 0x03004824
_08049914:
	bl sub_8049620
	ldr r2, _08049934
	ldr r0, [r4]
	adds r0, 0x40
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0804994A
	.align 2, 0
_08049934: .4byte 0x02020004
_08049938:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0804994A
	movs r0, 0x5
	bl audio_play
	bl sub_8049804
_0804994A:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8049860

	thumb_func_start sub_8049954
sub_8049954: @ 8049954
	push {lr}
	ldr r0, _08049978
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0804996A
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08049974
_0804996A:
	movs r0, 0x5
	bl audio_play
	bl sub_8049804
_08049974:
	pop {r0}
	bx r0
	.align 2, 0
_08049978: .4byte 0x03001770
	thumb_func_end sub_8049954

	thumb_func_start sub_804997C
sub_804997C: @ 804997C
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _080499B4
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080499E0
	ldr r0, _080499B8
	ldr r2, [r0]
	adds r3, r2, 0
	adds r3, 0x41
	ldrb r1, [r3]
	cmp r1, 0x5
	bhi _080499C4
	ldr r0, _080499BC
	ldrb r1, [r3]
	adds r2, 0x42
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _080499C0
	movs r4, 0x4
	str r4, [sp]
	bl sub_809D8BC
	b _080499E0
	.align 2, 0
_080499B4: .4byte 0x0202f388
_080499B8: .4byte 0x03004824
_080499BC: .4byte 0x03004360
_080499C0: .4byte sub_80484F4
_080499C4:
	ldr r0, _080499E8
	subs r1, 0x6
	lsls r1, 24
	lsrs r1, 24
	adds r2, 0x43
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _080499EC
	movs r4, 0x4
	str r4, [sp]
	bl sub_809D8BC
_080499E0:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080499E8: .4byte 0x030045c0
_080499EC: .4byte sub_80484F4
	thumb_func_end sub_804997C

	thumb_func_start sub_80499F0
sub_80499F0: @ 80499F0
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0
	movs r3, 0
	cmp r1, r4
	bge _08049A18
_08049A04:
	cmp r2, r3
	beq _08049A12
	adds r0, r5, r3
	ldrb r0, [r0]
	adds r0, r1, r0
	lsls r0, 24
	lsrs r1, r0, 24
_08049A12:
	adds r3, 0x1
	cmp r3, r4
	blt _08049A04
_08049A18:
	adds r0, r1, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80499F0

	thumb_func_start sub_8049A20
sub_8049A20: @ 8049A20
	push {r4,r5,lr}
	sub sp, 0xC
	movs r2, 0
	ldr r0, _08049A80
	ldr r1, [r0]
	adds r3, r1, 0
	adds r3, 0x42
	adds r5, r0, 0
	ldrb r0, [r3]
	cmp r2, r0
	bge _08049A4C
	adds r4, r1, 0
	adds r4, 0x51
_08049A3A:
	mov r1, sp
	adds r0, r1, r2
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	ldrb r0, [r3]
	cmp r2, r0
	blt _08049A3A
_08049A4C:
	adds r4, r5, 0
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0x42
	ldrb r1, [r1]
	adds r0, 0x41
	ldrb r2, [r0]
	mov r0, sp
	bl sub_80499F0
	lsls r0, 24
	cmp r0, 0
	bne _08049A88
	movs r0, 0x3
	movs r1, 0x2
	bl sub_804AADC
	ldr r0, [r4]
	adds r0, 0x8C
	ldr r1, _08049A84
	strh r1, [r0]
	movs r0, 0xB4
	movs r1, 0
	bl sub_804AADC
	b _08049AB4
	.align 2, 0
_08049A80: .4byte 0x03004824
_08049A84: .4byte 0x0000bbcc
_08049A88:
	movs r0, 0x3
	movs r1, 0x1
	bl sub_804AADC
	ldr r0, [r5]
	adds r0, 0x8C
	ldr r1, _08049ABC
	strh r1, [r0]
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _08049AB4
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r5]
	adds r1, 0x8C
	movs r2, 0x14
	bl SendBlock
_08049AB4:
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08049ABC: .4byte 0x0000bbbb
	thumb_func_end sub_8049A20

	thumb_func_start sub_8049AC0
sub_8049AC0: @ 8049AC0
	push {r4,lr}
	ldr r0, _08049ADC
	ldrh r1, [r0, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08049AE0
	movs r0, 0x5
	bl audio_play
	movs r0, 0x1
	negs r0, r0
	b _08049AF0
	.align 2, 0
_08049ADC: .4byte 0x03001770
_08049AE0:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08049AFC
	movs r0, 0x5
	bl audio_play
	movs r0, 0x1
_08049AF0:
	bl MoveMenuCursor
	ldr r1, _08049B20
	ldr r1, [r1]
	adds r1, 0x7C
	strb r0, [r1]
_08049AFC:
	ldr r0, _08049B24
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08049B64
	movs r0, 0x5
	bl audio_play
	bl GetMenuCursorPos
	lsls r0, 24
	cmp r0, 0
	bne _08049B28
	bl sub_8049A20
	b _08049B56
	.align 2, 0
_08049B20: .4byte 0x03004824
_08049B24: .4byte 0x03001770
_08049B28:
	movs r0, 0x3
	movs r1, 0x1
	bl sub_804AADC
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _08049B56
	ldr r4, _08049B5C
	ldr r0, [r4]
	adds r0, 0x8C
	ldr r1, _08049B60
	strh r1, [r0]
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	adds r1, 0x8C
	movs r2, 0x14
	bl SendBlock
_08049B56:
	ldr r0, _08049B5C
	ldr r0, [r0]
	b _08049BAA
	.align 2, 0
_08049B5C: .4byte 0x03004824
_08049B60: .4byte 0x0000bbcc
_08049B64:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08049BB0
	movs r0, 0x3
	movs r1, 0x1
	bl sub_804AADC
	bl GetMenuCursorPos
	lsls r0, 24
	cmp r0, 0
	bne _08049B8C
	movs r0, 0x1
	bl MoveMenuCursor
	ldr r1, _08049BB8
	ldr r1, [r1]
	adds r1, 0x7C
	strb r0, [r1]
_08049B8C:
	ldr r4, _08049BB8
	ldr r0, [r4]
	adds r0, 0x8C
	ldr r1, _08049BBC
	strh r1, [r0]
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	adds r1, 0x8C
	movs r2, 0x14
	bl SendBlock
	ldr r0, [r4]
_08049BAA:
	adds r0, 0x7B
	movs r1, 0x64
	strb r1, [r0]
_08049BB0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08049BB8: .4byte 0x03004824
_08049BBC: .4byte 0x0000bbcc
	thumb_func_end sub_8049AC0

	thumb_func_start sub_8049BC0
sub_8049BC0: @ 8049BC0
	push {r4,r5,lr}
	ldr r0, _08049BDC
	ldrh r1, [r0, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08049BE0
	movs r0, 0x5
	bl audio_play
	movs r0, 0x1
	negs r0, r0
	b _08049BF0
	.align 2, 0
_08049BDC: .4byte 0x03001770
_08049BE0:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08049BFC
	movs r0, 0x5
	bl audio_play
	movs r0, 0x1
_08049BF0:
	bl MoveMenuCursor
	ldr r1, _08049C5C
	ldr r1, [r1]
	adds r1, 0x7C
	strb r0, [r1]
_08049BFC:
	ldr r0, _08049C60
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08049C72
	movs r0, 0x5
	bl audio_play
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08049C6C
	movs r0, 0x4
	bl sub_804AA0C
	ldr r4, _08049C5C
	ldr r0, [r4]
	adds r2, r0, 0
	adds r2, 0x8C
	ldr r1, _08049C64
	strh r1, [r2]
	adds r0, 0x8E
	strh r5, [r0]
	movs r0, 0x5
	movs r1, 0
	bl sub_804AADC
	ldr r2, _08049C68
	ldr r0, [r4]
	adds r0, 0x40
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0x64
	strb r1, [r0]
	b _08049C84
	.align 2, 0
_08049C5C: .4byte 0x03004824
_08049C60: .4byte 0x03001770
_08049C64: .4byte 0x0000eeaa
_08049C68: .4byte 0x02020004
_08049C6C:
	bl sub_8049804
	b _08049C84
_08049C72:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08049C84
	movs r0, 0x5
	bl audio_play
	bl sub_8049804
_08049C84:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8049BC0

	thumb_func_start sub_8049C8C
sub_8049C8C: @ 8049C8C
	push {r4,lr}
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	bne _08049CAE
	ldr r4, _08049CC0
	ldr r0, [r4]
	adds r0, 0x41
	ldrb r0, [r0]
	bl sub_8049E9C
	ldr r0, [r4]
	adds r0, 0x8A
	ldrb r0, [r0]
	bl sub_8049E9C
_08049CAE:
	ldr r0, _08049CC0
	ldr r0, [r0]
	adds r0, 0x7B
	movs r1, 0x7
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08049CC0: .4byte 0x03004824
	thumb_func_end sub_8049C8C

	thumb_func_start sub_8049CC4
sub_8049CC4: @ 8049CC4
	push {r4,lr}
	ldr r4, _08049CE8
	ldr r0, [r4]
	adds r0, 0x80
	ldrh r1, [r0]
	ldr r0, _08049CEC
	cmp r1, r0
	bne _08049CE0
	bl sub_8049088
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0xE
	strb r1, [r0]
_08049CE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08049CE8: .4byte 0x03004824
_08049CEC: .4byte 0x00000505
	thumb_func_end sub_8049CC4

	thumb_func_start DisplayMessageAndContinueTask
DisplayMessageAndContinueTask: @ 8049CF0
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _08049D40
	ldr r1, [r4]
	adds r1, 0xB4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0xB4
	ldrb r0, [r0]
	cmp r0, 0x78
	bls _08049D36
	adds r0, r1, 0x4
	movs r1, 0x13
	str r1, [sp]
	movs r1, 0x18
	movs r2, 0xE
	movs r3, 0x1D
	bl DrawTextWindow
	movs r0, 0x18
	movs r1, 0xE
	movs r2, 0x4
	bl InitYesNoMenu
	ldr r0, [r4]
	adds r0, 0xB4
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0x3
	strb r1, [r0]
_08049D36:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08049D40: .4byte 0x03004824
	thumb_func_end DisplayMessageAndContinueTask

	thumb_func_start sub_8049D44
sub_8049D44: @ 8049D44
	push {lr}
	ldr r0, _08049D90
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08049D8A
	movs r0, 0x5
	bl audio_play
	movs r0, 0
	bl sub_804A840
	movs r0, 0x1
	bl sub_804A840
	ldr r2, _08049D94
	ldr r0, [r2]
	adds r0, 0x7B
	movs r1, 0
	strb r1, [r0]
	ldr r3, _08049D98
	ldr r0, [r2]
	adds r0, 0x40
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_08049D8A:
	pop {r0}
	bx r0
	.align 2, 0
_08049D90: .4byte 0x03001770
_08049D94: .4byte 0x03004824
_08049D98: .4byte 0x02020004
	thumb_func_end sub_8049D44

	thumb_func_start sub_8049D9C
sub_8049D9C: @ 8049D9C
	push {lr}
	ldr r0, _08049DBC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08049DB8
	bl sub_800832C
	ldr r0, _08049DC0
	ldr r0, [r0]
	adds r0, 0x7B
	movs r1, 0xC
	strb r1, [r0]
_08049DB8:
	pop {r0}
	bx r0
	.align 2, 0
_08049DBC: .4byte 0x0202f388
_08049DC0: .4byte 0x03004824
	thumb_func_end sub_8049D9C

	thumb_func_start sub_8049DC4
sub_8049DC4: @ 8049DC4
	push {lr}
	ldr r0, _08049DD8
	ldrb r0, [r0]
	cmp r0, 0
	bne _08049DD4
	ldr r0, _08049DDC
	bl SetMainCallback2
_08049DD4:
	pop {r0}
	bx r0
	.align 2, 0
_08049DD8: .4byte 0x03002fa4
_08049DDC: .4byte sub_805465C
	thumb_func_end sub_8049DC4

	thumb_func_start sub_8049DE0
sub_8049DE0: @ 8049DE0
	push {lr}
	ldr r0, _08049DF8
	ldr r0, [r0]
	adds r0, 0x7B
	ldrb r0, [r0]
	cmp r0, 0xF
	bhi _08049E98
	lsls r0, 2
	ldr r1, _08049DFC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08049DF8: .4byte 0x03004824
_08049DFC: .4byte _08049E00
	.align 2, 0
_08049E00:
	.4byte _08049E40
	.4byte _08049E46
	.4byte _08049E4C
	.4byte _08049E52
	.4byte _08049E58
	.4byte _08049E98
	.4byte _08049E5E
	.4byte _08049E64
	.4byte _08049E6A
	.4byte _08049E70
	.4byte _08049E76
	.4byte _08049E7C
	.4byte _08049E82
	.4byte _08049E88
	.4byte _08049E8E
	.4byte _08049E94
_08049E40:
	bl sub_8049680
	b _08049E98
_08049E46:
	bl sub_8049860
	b _08049E98
_08049E4C:
	bl sub_804997C
	b _08049E98
_08049E52:
	bl sub_8049AC0
	b _08049E98
_08049E58:
	bl sub_8049BC0
	b _08049E98
_08049E5E:
	bl sub_8049C8C
	b _08049E98
_08049E64:
	bl sub_8049CC4
	b _08049E98
_08049E6A:
	bl sub_8049D44
	b _08049E98
_08049E70:
	bl sub_8048A14
	b _08049E98
_08049E76:
	bl sub_8048A50
	b _08049E98
_08049E7C:
	bl sub_8049D9C
	b _08049E98
_08049E82:
	bl sub_8049DC4
	b _08049E98
_08049E88:
	bl sub_8048A90
	b _08049E98
_08049E8E:
	bl DisplayMessageAndContinueTask
	b _08049E98
_08049E94:
	bl sub_8049954
_08049E98:
	pop {r0}
	bx r0
	thumb_func_end sub_8049DE0

	thumb_func_start sub_8049E9C
sub_8049E9C: @ 8049E9C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	movs r1, 0x6
	bl __udivsi3
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r3, _08049ED0
	ldr r0, [r3]
	adds r0, 0x80
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	bne _08049EC8
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, [r3]
	adds r0, 0x82
	adds r0, r2
	strb r4, [r0]
_08049EC8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08049ED0: .4byte 0x03004824
	thumb_func_end sub_8049E9C

	thumb_func_start sub_8049ED4
sub_8049ED4: @ 8049ED4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x74
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, _08049F24
	ldr r5, [r0]
	adds r0, r5, 0
	adds r0, 0x82
	add r0, r10
	ldrb r0, [r0]
	movs r1, 0x1
	str r1, [sp, 0x6C]
	cmp r0, 0x5
	bhi _08049EFE
	movs r2, 0
	str r2, [sp, 0x6C]
_08049EFE:
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	adds r0, r5, 0
	adds r0, 0x80
	mov r1, r10
	adds r3, r0, r1
	ldrb r0, [r3]
	cmp r0, 0x2
	bne _08049F1A
	b _0804A0AC
_08049F1A:
	cmp r0, 0x2
	bgt _08049F28
	cmp r0, 0x1
	beq _08049F36
	b _0804A294
	.align 2, 0
_08049F24: .4byte 0x03004824
_08049F28:
	cmp r0, 0x3
	bne _08049F2E
	b _0804A0E4
_08049F2E:
	cmp r0, 0x4
	bne _08049F34
	b _0804A244
_08049F34:
	b _0804A294
_08049F36:
	movs r4, 0
	adds r0, r5, 0
	adds r0, 0x42
	add r0, r10
	ldr r7, _0804A094
	ldr r2, [sp, 0x6C]
	lsls r2, 1
	mov r9, r2
	ldr r3, _0804A098
	mov r12, r3
	mov r5, r10
	lsls r5, 4
	str r5, [sp, 0x70]
	ldrb r0, [r0]
	cmp r4, r0
	bcs _08049F8E
	adds r6, r7, 0
	ldr r2, _0804A09C
	ldr r0, [sp, 0x6C]
	add r0, r9
	lsls r3, r0, 1
	movs r5, 0x4
_08049F62:
	ldr r0, [r2]
	adds r1, r4, r3
	adds r0, 0x34
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r5
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, [r2]
	adds r0, 0x42
	add r0, r10
	ldrb r0, [r0]
	cmp r4, r0
	bcc _08049F62
_08049F8E:
	ldr r1, _0804A09C
	ldr r0, [r1]
	ldr r5, [sp, 0x6C]
	add r5, r9
	lsls r3, r5, 1
	mov r2, r8
	adds r6, r2, r3
	adds r0, 0x34
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldr r0, _0804A09C
	ldr r4, [r0]
	adds r4, 0x34
	adds r4, r6
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	movs r1, 0x14
	strh r1, [r0, 0x2E]
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	lsls r5, 2
	mov r1, r12
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r3, 0x1
	lsls r3, 1
	add r3, r12
	ldrb r1, [r3]
	adds r0, r1
	asrs r0, 1
	lsls r0, 3
	adds r0, 0xE
	strh r0, [r2, 0x32]
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	mov r0, r12
	adds r0, 0x1
	adds r5, r0
	ldrb r0, [r5]
	lsls r0, 3
	subs r0, 0xC
	strh r0, [r1, 0x36]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	ldr r1, _0804A0A0
	bl oamt_set_x3A_32
	ldr r2, _0804A09C
	ldr r1, [r2]
	adds r1, 0x80
	add r1, r10
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, 0x34
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	bl sub_8078A34
	bl sub_8072DEC
	ldr r3, _0804A09C
	ldr r0, [r3]
	adds r0, 0x4
	ldr r1, _0804A0A4
	mov r5, r9
	adds r2, r5, r1
	ldrb r2, [r2]
	adds r1, 0x1
	add r1, r9
	ldrb r1, [r1]
	str r1, [sp]
	movs r1, 0x13
	str r1, [sp, 0x4]
	movs r1, 0
	movs r3, 0
	bl FillWindowRect_DefaultPalette
	ldr r1, _0804A09C
	ldr r0, [r1]
	adds r0, 0xC8
	ldr r2, [sp, 0x70]
	mov r3, r10
	subs r1, r2, r3
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0804A0A8
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x11
	str r2, [sp, 0x4]
	movs r5, 0
	str r5, [sp, 0x8]
	movs r2, 0
	bl sub_804A96C
	ldr r0, [sp, 0x6C]
	cmp r0, 0
	beq _0804A08C
	b _0804A294
_0804A08C:
	bl sub_804A80C
	b _0804A294
	.align 2, 0
_0804A094: .4byte 0x02020004
_0804A098: .4byte gTradeMonSpriteCoords
_0804A09C: .4byte 0x03004824
_0804A0A0: .4byte sub_809D62C
_0804A0A4: .4byte gUnknown_0820C330
_0804A0A8: .4byte gTradePartyBoxTilemap
_0804A0AC:
	ldr r2, _0804A0DC
	ldr r1, [sp, 0x6C]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 1
	add r0, r8
	adds r1, r5, 0
	adds r1, 0x34
	adds r1, r0
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0804A0E0
	cmp r1, r0
	beq _0804A0D4
	b _0804A294
_0804A0D4:
	movs r0, 0x3
	strb r0, [r3]
	b _0804A294
	.align 2, 0
_0804A0DC: .4byte 0x02020004
_0804A0E0: .4byte sub_809D62C
_0804A0E4:
	adds r0, r5, 0
	adds r0, 0xC8
	ldr r2, [sp, 0x6C]
	lsls r1, r2, 4
	subs r1, r2
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0804A228
	movs r2, 0xF
	str r2, [sp]
	movs r7, 0x11
	str r7, [sp, 0x4]
	movs r5, 0
	str r5, [sp, 0x8]
	movs r2, 0
	bl sub_804A96C
	ldr r0, _0804A22C
	ldr r3, [r0]
	ldr r1, [sp, 0x6C]
	lsls r6, r1, 1
	adds r1, r6
	mov r9, r1
	lsls r1, 1
	mov r2, r8
	adds r0, r2, r1
	adds r3, 0x34
	adds r3, r0
	ldrb r0, [r3]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r5, _0804A230
	adds r2, r5
	ldr r4, _0804A234
	mov r0, r9
	lsls r5, r0, 2
	adds r0, r5, r4
	ldrb r0, [r0]
	adds r1, 0x1
	lsls r1, 1
	adds r1, r4
	ldrb r1, [r1]
	adds r0, r1
	asrs r0, 1
	lsls r0, 3
	adds r0, 0xE
	strh r0, [r2, 0x20]
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r2, _0804A230
	adds r1, r2
	adds r4, 0x1
	adds r5, r4
	ldrb r0, [r5]
	lsls r0, 3
	subs r0, 0xC
	strh r0, [r1, 0x22]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r5, 0
	strh r5, [r0, 0x24]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r5, [r0, 0x26]
	mov r0, sp
	adds r0, 0x12
	ldr r1, [sp, 0x6C]
	mov r2, r8
	bl sub_804A2B4
	add r1, sp, 0xC
	movs r3, 0xFC
	strb r3, [r1]
	adds r2, r1, 0
	movs r1, 0x6
	strb r1, [r2, 0x1]
	movs r1, 0x4
	strb r1, [r2, 0x2]
	adds r1, r2, 0
	strb r3, [r1, 0x3]
	strb r7, [r1, 0x4]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x40
	subs r1, r0
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	strb r1, [r2, 0x5]
	ldr r0, _0804A22C
	ldr r1, [r0]
	adds r0, r1, 0x4
	adds r1, 0x7A
	ldrb r2, [r1]
	mov r1, r9
	lsls r1, 6
	mov r9, r1
	add r2, r9
	ldr r4, _0804A238
	ldr r3, [sp, 0x6C]
	lsls r1, r3, 2
	adds r3, r1, r4
	ldrb r3, [r3]
	ldr r5, _0804A23C
	adds r1, r5
	ldrb r1, [r1]
	str r1, [sp]
	add r1, sp, 0xC
	bl sub_8003460
	add r7, sp, 0x34
	adds r0, r7, 0
	ldr r1, [sp, 0x6C]
	mov r2, r8
	bl sub_804A33C
	ldr r0, _0804A22C
	ldr r2, [r0]
	adds r0, r2, 0x4
	ldr r1, _0804A240
	adds r2, 0x7A
	ldrb r2, [r2]
	add r2, r9
	adds r2, 0x20
	adds r6, 0x1
	lsls r6, 1
	adds r4, r6, r4
	ldrb r5, [r4]
	ldr r3, _0804A23C
	adds r6, r3
	ldrb r4, [r6]
	adds r4, 0x1
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp]
	adds r3, r5, 0
	bl sub_8003460
	ldr r0, _0804A22C
	ldr r1, [r0]
	adds r0, r1, 0x4
	adds r1, 0x7A
	ldrb r2, [r1]
	add r2, r9
	adds r2, 0x26
	str r4, [sp]
	adds r1, r7, 0
	adds r3, r5, 0
	bl sub_8003460
	ldr r2, _0804A22C
	ldr r1, [r2]
	b _0804A28A
	.align 2, 0
_0804A228: .4byte gTradeMovesBoxTilemap
_0804A22C: .4byte 0x03004824
_0804A230: .4byte 0x02020004
_0804A234: .4byte gTradeMonSpriteCoords
_0804A238: .4byte gUnknown_0820C334
_0804A23C: .4byte gUnknown_0820C334 + 0x1
_0804A240: .4byte gUnknown_0842C7CA
_0804A244:
	ldr r0, _0804A2A4
	ldr r0, [r0, 0x14]
	adds r1, r5, 0
	adds r1, 0x7E
	ldrh r1, [r1]
	lsls r1, 5
	ldr r3, _0804A2A8
	adds r1, r3
	movs r2, 0x14
	bl sub_804ACD8
	ldr r0, _0804A2AC
	mov r5, r10
	lsls r1, r5, 1
	adds r4, r1, r0
	ldrb r2, [r4]
	adds r2, 0x4
	lsls r2, 24
	lsrs r2, 24
	adds r0, 0x1
	adds r1, r0
	ldrb r3, [r1]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r4]
	str r0, [sp]
	ldrb r0, [r1]
	str r0, [sp, 0x4]
	mov r0, r10
	mov r1, r8
	bl sub_804A51C
	ldr r0, _0804A2B0
	ldr r1, [r0]
_0804A28A:
	adds r1, 0x80
	add r1, r10
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0804A294:
	add sp, 0x74
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A2A4: .4byte gUnknown_0820C14C
_0804A2A8: .4byte 0x06010000
_0804A2AC: .4byte gUnknown_0820C3D1
_0804A2B0: .4byte 0x03004824
	thumb_func_end sub_8049ED4

	thumb_func_start sub_804A2B4
sub_804A2B4: @ 804A2B4
	push {r4,r5,lr}
	sub sp, 0xC
	adds r5, r0, 0
	lsls r1, 24
	lsls r2, 24
	lsrs r2, 24
	cmp r1, 0
	bne _0804A2F4
	movs r0, 0x64
	adds r4, r2, 0
	muls r4, r0
	ldr r0, _0804A2F0
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x2
	mov r2, sp
	bl PokemonGetField
	adds r0, r5, 0
	mov r1, sp
	bl StringCopy10
	adds r0, r4, 0
	bl pokemon_get_gender
	adds r0, r4, 0
	movs r1, 0x38
	bl PokemonGetField
	b _0804A31E
	.align 2, 0
_0804A2F0: .4byte 0x03004360
_0804A2F4:
	movs r0, 0x64
	adds r4, r2, 0
	muls r4, r0
	ldr r0, _0804A334
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x2
	mov r2, sp
	bl PokemonGetField
	adds r0, r5, 0
	mov r1, sp
	bl StringCopy10
	adds r0, r4, 0
	bl pokemon_get_gender
	adds r0, r4, 0
	movs r1, 0x38
	bl PokemonGetField
_0804A31E:
	ldr r0, _0804A338
	adds r1, r5, 0
	bl GetStringWidthGivenWindowConfig
	lsls r0, 24
	lsrs r0, 24
	add sp, 0xC
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0804A334: .4byte 0x030045c0
_0804A338: .4byte gWindowConfig_81E7294
	thumb_func_end sub_804A2B4

	thumb_func_start sub_804A33C
sub_804A33C: @ 804A33C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	adds r6, r0, 0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _0804A384
	ldr r1, [r0]
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 1
	adds r0, r2, r0
	adds r1, 0x5D
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _0804A3F4
	movs r4, 0
	movs r0, 0x64
	adds r5, r2, 0
	muls r5, r0
	ldr r0, _0804A388
	mov r9, r0
	ldr r2, _0804A38C
	mov r8, r2
_0804A376:
	cmp r7, 0
	bne _0804A390
	adds r1, r4, 0
	adds r1, 0xD
	mov r2, r9
	b _0804A396
	.align 2, 0
_0804A384: .4byte 0x03004824
_0804A388: .4byte 0x03004360
_0804A38C: .4byte 0x030045c0
_0804A390:
	adds r1, r4, 0
	adds r1, 0xD
	mov r2, r8
_0804A396:
	adds r0, r5, r2
	movs r2, 0
	bl PokemonGetField
	lsls r1, r4, 1
	add r1, sp
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _0804A376
	ldr r1, _0804A3E8
	adds r0, r6, 0
	bl StringCopy
	movs r4, 0
_0804A3B8:
	lsls r0, r4, 1
	mov r2, sp
	adds r1, r2, r0
	ldrh r0, [r1]
	cmp r0, 0
	beq _0804A3D4
	adds r1, r0, 0
	movs r0, 0xD
	muls r1, r0
	ldr r0, _0804A3EC
	adds r1, r0
	adds r0, r6, 0
	bl StringAppend
_0804A3D4:
	adds r0, r6, 0
	ldr r1, _0804A3F0
	bl StringAppend
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _0804A3B8
	b _0804A404
	.align 2, 0
_0804A3E8: .4byte gUnknown_0820C33C
_0804A3EC: .4byte gMoveNames
_0804A3F0: .4byte gUnknown_0842C7CB
_0804A3F4:
	ldr r1, _0804A414
	adds r0, r6, 0
	bl StringCopy
	ldr r1, _0804A418
	adds r0, r6, 0
	bl StringAppend
_0804A404:
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A414: .4byte gUnknown_0820C33C
_0804A418: .4byte gUnknown_0842C7D6
	thumb_func_end sub_804A33C

	thumb_func_start sub_804A41C
sub_804A41C: @ 804A41C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x44
	lsls r0, 24
	lsrs r5, r0, 24
	add r3, sp, 0x1C
	movs r2, 0
	movs r1, 0xFC
	strb r1, [r3]
	movs r0, 0x6
	strb r0, [r3, 0x1]
	movs r0, 0x4
	strb r0, [r3, 0x2]
	strb r1, [r3, 0x3]
	movs r0, 0x11
	strb r0, [r3, 0x4]
	strb r2, [r3, 0x5]
	movs r6, 0
	ldr r1, _0804A470
	ldr r0, [r1]
	adds r0, 0x42
	adds r0, r5
	ldrb r0, [r0]
	cmp r6, r0
	bcs _0804A504
	mov r8, r3
	adds r7, r1, 0
	ldr r0, _0804A474
	mov r9, r0
	movs r4, 0x1
	add r4, r9
	mov r10, r4
_0804A462:
	cmp r5, 0
	bne _0804A47C
	movs r0, 0x64
	adds r4, r6, 0
	muls r4, r0
	ldr r0, _0804A478
	b _0804A484
	.align 2, 0
_0804A470: .4byte 0x03004824
_0804A474: .4byte gTradeMonSpriteCoords
_0804A478: .4byte 0x03004360
_0804A47C:
	movs r0, 0x64
	adds r4, r6, 0
	muls r4, r0
	ldr r0, _0804A514
_0804A484:
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x2
	add r2, sp, 0x4
	bl PokemonGetField
	mov r0, sp
	adds r0, 0x22
	add r1, sp, 0x4
	bl StringCopy10
	adds r0, r4, 0
	bl pokemon_get_gender
	mov r1, sp
	adds r1, 0x22
	ldr r0, _0804A518
	bl GetStringWidthGivenWindowConfig
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x32
	subs r1, r0
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	mov r0, r8
	strb r1, [r0, 0x5]
	ldr r1, [r7]
	adds r0, r1, 0x4
	adds r1, 0x7A
	lsls r2, r5, 5
	adds r2, r5
	lsls r2, 2
	ldrb r1, [r1]
	adds r2, r1
	movs r1, 0x16
	muls r1, r6
	adds r2, r1
	lsls r2, 16
	lsrs r2, 16
	lsls r1, r5, 1
	adds r1, r5
	lsls r1, 1
	adds r1, r6, r1
	lsls r1, 1
	mov r4, r9
	adds r3, r1, r4
	ldrb r3, [r3]
	add r1, r10
	ldrb r1, [r1]
	str r1, [sp]
	mov r1, r8
	bl sub_8003460
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, [r7]
	adds r0, 0x42
	adds r0, r5
	ldrb r0, [r0]
	cmp r6, r0
	bcc _0804A462
_0804A504:
	add sp, 0x44
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A514: .4byte 0x030045c0
_0804A518: .4byte gWindowConfig_81E7294
	thumb_func_end sub_804A41C

	thumb_func_start sub_804A51C
sub_804A51C: @ 804A51C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	ldr r4, [sp, 0x48]
	ldr r5, [sp, 0x4C]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x24]
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _0804A59C
	ldr r0, [r0]
	adds r0, 0xC8
	ldr r3, _0804A5A0
	movs r1, 0x6
	str r1, [sp]
	movs r1, 0x3
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_804A96C
	mov r0, r8
	cmp r0, 0
	bne _0804A5A8
	movs r0, 0x64
	mov r4, r9
	muls r4, r0
	ldr r0, _0804A5A4
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x38
	movs r2, 0
	bl PokemonGetField
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r4, 0
	bl pokemon_get_gender
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r4, 0
	movs r1, 0x2
	add r2, sp, 0xC
	bl PokemonGetField
	b _0804A5D4
	.align 2, 0
_0804A59C: .4byte 0x03004824
_0804A5A0: .4byte gTradeMonBoxTilemap
_0804A5A4: .4byte 0x03004360
_0804A5A8:
	movs r0, 0x64
	mov r4, r9
	muls r4, r0
	ldr r0, _0804A65C
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x38
	movs r2, 0
	bl PokemonGetField
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r4, 0
	bl pokemon_get_gender
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r4, 0
	movs r1, 0x2
	add r2, sp, 0xC
	bl PokemonGetField
_0804A5D4:
	ldr r1, _0804A660
	ldr r5, [r1]
	mov r3, r8
	lsls r0, r3, 1
	add r0, r8
	lsls r0, 1
	add r0, r9
	adds r1, r5, 0
	adds r1, 0x5D
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _0804A690
	adds r0, r6, 0
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, [sp, 0x24]
	lsls r2, r0, 5
	cmp r4, 0
	beq _0804A614
	mov r1, r10
	adds r0, r1, r2
	lsls r0, 1
	adds r1, r5, 0
	adds r1, 0xDA
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x60
	strh r0, [r1]
_0804A614:
	ldr r3, _0804A660
	ldr r4, [r3]
	mov r0, r10
	adds r5, r0, r2
	adds r0, r5, 0x1
	lsls r0, 1
	adds r4, 0xDA
	adds r4, r0
	adds r0, r6, 0
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x70
	strh r0, [r4]
	cmp r7, 0
	bne _0804A664
	add r0, sp, 0xC
	movs r1, 0
	bl sub_8042548
	lsls r0, 24
	cmp r0, 0
	bne _0804A6CC
	ldr r3, _0804A660
	ldr r1, [r3]
	adds r0, r5, 0
	subs r0, 0x1F
	lsls r0, 1
	adds r1, 0xDA
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	b _0804A6CA
	.align 2, 0
_0804A65C: .4byte 0x030045c0
_0804A660: .4byte 0x03004824
_0804A664:
	cmp r7, 0xFE
	bne _0804A6CC
	add r0, sp, 0xC
	movs r1, 0xFE
	bl sub_8042548
	lsls r0, 24
	cmp r0, 0
	bne _0804A6CC
	ldr r0, _0804A68C
	ldr r1, [r0]
	adds r0, r5, 0
	subs r0, 0x1F
	lsls r0, 1
	adds r1, 0xDA
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x2
	b _0804A6CA
	.align 2, 0
_0804A68C: .4byte 0x03004824
_0804A690:
	ldr r1, [sp, 0x24]
	lsls r0, r1, 5
	mov r1, r10
	adds r3, r1, r0
	adds r1, r3, 0
	subs r1, 0x20
	lsls r1, 1
	adds r2, r5, 0
	adds r2, 0xDA
	adds r1, r2, r1
	adds r0, r3, 0
	subs r0, 0x21
	lsls r0, 1
	adds r0, r2, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, r3, 0
	subs r1, 0x1F
	lsls r1, 1
	adds r1, r2, r1
	adds r0, r3, 0
	subs r0, 0x24
	lsls r0, 1
	adds r2, r0
	ldrh r2, [r2]
	movs r3, 0x80
	lsls r3, 3
	adds r0, r3, 0
	orrs r0, r2
_0804A6CA:
	strh r0, [r1]
_0804A6CC:
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_804A51C

	thumb_func_start sub_804A6DC
sub_804A6DC: @ 804A6DC
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	movs r7, 0
	ldr r0, _0804A734
	ldr r0, [r0]
	adds r0, 0x42
	adds r0, r6
	ldrb r0, [r0]
	cmp r7, r0
	bge _0804A72C
	lsls r0, r6, 1
	adds r0, r6
	ldr r1, _0804A738
	lsls r0, 2
	adds r5, r0, r1
	ldr r1, _0804A73C
	adds r4, r0, r1
_0804A702:
	lsls r1, r7, 24
	lsrs r1, 24
	ldrb r2, [r5]
	ldrb r3, [r5, 0x1]
	ldrb r0, [r4]
	str r0, [sp]
	ldrb r0, [r4, 0x1]
	str r0, [sp, 0x4]
	adds r0, r6, 0
	bl sub_804A51C
	adds r5, 0x2
	adds r4, 0x2
	adds r7, 0x1
	ldr r0, _0804A734
	ldr r0, [r0]
	adds r0, 0x42
	adds r0, r6
	ldrb r0, [r0]
	cmp r7, r0
	blt _0804A702
_0804A72C:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A734: .4byte 0x03004824
_0804A738: .4byte gTradeLevelDisplayCoords
_0804A73C: .4byte gTradeMonBoxCoords
	thumb_func_end sub_804A6DC

	thumb_func_start sub_804A740
sub_804A740: @ 804A740
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	movs r7, 0
	ldr r3, _0804A800
	ldr r0, [r3]
	adds r0, 0x42
	add r0, r12
	ldrb r0, [r0]
	cmp r7, r0
	bge _0804A7F2
	ldr r6, _0804A804
	mov r9, r3
	mov r1, r12
	lsls r0, r1, 1
	add r0, r12
	lsls r2, r0, 1
	mov r10, r2
	ldr r1, _0804A808
	movs r2, 0
	mov r8, r2
	lsls r0, 2
	adds r5, r0, r1
_0804A778:
	mov r1, r9
	ldr r0, [r1]
	mov r2, r10
	adds r4, r7, r2
	adds r0, 0x34
	adds r0, r4
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	mov r0, r9
	ldr r3, [r0]
	adds r2, r3, 0
	adds r2, 0x34
	adds r2, r4
	ldrb r0, [r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r0, [r5]
	lsls r0, 3
	adds r0, 0xE
	strh r0, [r1, 0x20]
	ldrb r0, [r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r0, [r5, 0x1]
	lsls r0, 3
	subs r0, 0xC
	strh r0, [r1, 0x22]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	mov r1, r8
	strh r1, [r0, 0x24]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	mov r2, r8
	strh r2, [r0, 0x26]
	adds r5, 0x2
	adds r7, 0x1
	adds r3, 0x42
	add r3, r12
	ldrb r3, [r3]
	cmp r7, r3
	blt _0804A778
_0804A7F2:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A800: .4byte 0x03004824
_0804A804: .4byte 0x02020004
_0804A808: .4byte gTradeMonSpriteCoords
	thumb_func_end sub_804A740

	thumb_func_start sub_804A80C
sub_804A80C: @ 804A80C
	push {lr}
	sub sp, 0x8
	ldr r0, _0804A838
	ldr r0, [r0]
	adds r0, 0x4
	ldr r1, _0804A83C
	ldrb r2, [r1, 0x2]
	ldrb r1, [r1, 0x3]
	str r1, [sp]
	movs r1, 0x13
	str r1, [sp, 0x4]
	movs r1, 0
	movs r3, 0
	bl FillWindowRect_DefaultPalette
	movs r0, 0x1
	bl sub_804A41C
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_0804A838: .4byte 0x03004824
_0804A83C: .4byte gUnknown_0820C330
	thumb_func_end sub_804A80C

	thumb_func_start sub_804A840
sub_804A840: @ 804A840
	push {r4,r5,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _0804A8A8
	ldr r4, _0804A89C
	ldr r0, [r4]
	adds r0, 0x4
	ldr r1, _0804A8A0
	ldrb r2, [r1]
	ldrb r1, [r1, 0x1]
	str r1, [sp]
	movs r1, 0x13
	str r1, [sp, 0x4]
	movs r1, 0
	movs r3, 0
	bl FillWindowRect_DefaultPalette
	ldr r0, [r4]
	adds r0, 0xC8
	ldr r3, _0804A8A4
	movs r1, 0xF
	str r1, [sp]
	movs r1, 0x11
	str r1, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r1, 0
	movs r2, 0
	bl sub_804A96C
	movs r0, 0
	bl sub_804A6DC
	movs r0, 0
	bl sub_804A41C
	movs r0, 0
	bl sub_804A740
	ldr r0, [r4]
	adds r0, 0xC8
	bl sub_804A938
	b _0804A8FA
	.align 2, 0
_0804A89C: .4byte 0x03004824
_0804A8A0: .4byte gUnknown_0820C330
_0804A8A4: .4byte gTradePartyBoxTilemap
_0804A8A8:
	bl sub_8072DEC
	ldr r4, _0804A924
	ldr r0, [r4]
	adds r0, 0x4
	ldr r1, _0804A928
	ldrb r2, [r1, 0x2]
	ldrb r1, [r1, 0x3]
	str r1, [sp]
	movs r1, 0x13
	str r1, [sp, 0x4]
	movs r1, 0
	movs r3, 0
	bl FillWindowRect_DefaultPalette
	ldr r0, [r4]
	adds r0, 0xC8
	ldr r3, _0804A92C
	movs r1, 0xF
	str r1, [sp]
	movs r1, 0x11
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0xF
	movs r2, 0
	bl sub_804A96C
	movs r0, 0x1
	bl sub_804A6DC
	movs r0, 0x1
	bl sub_804A41C
	movs r0, 0x1
	bl sub_804A740
	ldr r0, [r4]
	adds r0, 0xC8
	bl sub_804A938
_0804A8FA:
	ldr r0, _0804A930
	ldr r0, [r0, 0x4]
	ldr r4, _0804A924
	ldr r1, [r4]
	adds r1, 0x7E
	ldrh r1, [r1]
	lsls r1, 5
	ldr r2, _0804A934
	adds r1, r2
	movs r2, 0x14
	bl sub_804ACD8
	ldr r0, [r4]
	adds r0, 0x80
	adds r0, r5
	movs r1, 0
	strb r1, [r0]
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804A924: .4byte 0x03004824
_0804A928: .4byte gUnknown_0820C330
_0804A92C: .4byte gTradePartyBoxTilemap
_0804A930: .4byte gUnknown_0820C14C
_0804A934: .4byte 0x06010000
	thumb_func_end sub_804A840

	thumb_func_start sub_804A938
sub_804A938: @ 804A938
	movs r1, 0x1
	strb r1, [r0, 0x10]
	bx lr
	thumb_func_end sub_804A938

	thumb_func_start sub_804A940
sub_804A940: @ 804A940
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0x10]
	cmp r0, 0
	beq _0804A95C
	adds r0, r4, 0
	adds r0, 0x12
	ldr r1, [r4, 0x8]
	movs r2, 0x80
	lsls r2, 3
	bl CpuSet
	movs r0, 0
	strb r0, [r4, 0x10]
_0804A95C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_804A940

	thumb_func_start sub_804A964
sub_804A964: @ 804A964
	movs r2, 0
	strb r2, [r0, 0x10]
	str r1, [r0, 0x8]
	bx lr
	thumb_func_end sub_804A964

	thumb_func_start sub_804A96C
sub_804A96C: @ 804A96C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	str r0, [sp]
	mov r10, r3
	ldr r0, [sp, 0x24]
	ldr r3, [sp, 0x28]
	ldr r4, [sp, 0x2C]
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r3, 24
	lsrs r3, 24
	mov r12, r3
	lsls r4, 16
	lsrs r7, r4, 16
	movs r2, 0
	cmp r2, r12
	bge _0804A9DE
	ldr r0, [sp]
	adds r0, 0x12
	mov r9, r0
	lsls r0, r6, 5
	adds r0, r1
	mov r8, r0
_0804A9AA:
	movs r4, 0
	adds r6, r2, 0x1
	cmp r4, r5
	bge _0804A9D8
	lsls r1, r2, 5
	add r1, r8
	adds r0, r5, 0
	muls r0, r2
	lsls r0, 1
	mov r2, r10
	adds r3, r0, r2
	lsls r1, 1
	mov r0, r9
	adds r2, r1, r0
_0804A9C6:
	ldrh r1, [r3]
	adds r0, r7, 0
	orrs r0, r1
	strh r0, [r2]
	adds r3, 0x2
	adds r2, 0x2
	adds r4, 0x1
	cmp r4, r5
	blt _0804A9C6
_0804A9D8:
	adds r2, r6, 0
	cmp r2, r12
	blt _0804A9AA
_0804A9DE:
	movs r0, 0x1
	ldr r1, [sp]
	strb r0, [r1, 0x10]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_804A96C

	thumb_func_start sub_804A9F4
sub_804A9F4: @ 804A9F4
	push {lr}
	bl MenuZeroFillScreen
	pop {r0}
	bx r0
	thumb_func_end sub_804A9F4

	thumb_func_start sub_804AA00
sub_804AA00: @ 804AA00
	push {lr}
	bl MenuZeroFillScreen
	pop {r0}
	bx r0
	thumb_func_end sub_804AA00

	thumb_func_start sub_804AA0C
sub_804AA0C: @ 804AA0C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	ldr r0, _0804AA7C
	mov r8, r0
	ldr r0, [r0]
	adds r0, 0x4
	ldr r2, _0804AA80
	lsrs r4, 22
	adds r1, r4, r2
	ldrb r6, [r1]
	adds r1, r2, 0x1
	adds r1, r4, r1
	ldrb r5, [r1]
	adds r1, r2, 0x2
	adds r1, r4, r1
	ldrb r3, [r1]
	adds r2, 0x3
	adds r2, r4, r2
	ldrb r1, [r2]
	str r1, [sp]
	adds r1, r6, 0
	adds r2, r5, 0
	bl DrawTextWindow
	mov r1, r8
	ldr r3, [r1]
	adds r0, r3, 0x4
	ldr r1, _0804AA84
	adds r4, r1
	ldr r1, [r4]
	adds r3, 0x7A
	movs r4, 0xC0
	lsls r4, 1
	adds r2, r4, 0
	ldrb r3, [r3]
	adds r2, r3
	adds r6, 0x1
	lsls r6, 24
	lsrs r6, 24
	adds r5, 0x1
	lsls r5, 24
	lsrs r5, 24
	str r5, [sp]
	adds r3, r6, 0
	bl sub_8003460
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804AA7C: .4byte 0x03004824
_0804AA80: .4byte gTradeMessageWindowRects
_0804AA84: .4byte gUnknown_0820C2F0
	thumb_func_end sub_804AA0C

	thumb_func_start sub_804AA88
sub_804AA88: @ 804AA88
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r3, 0
	ldr r5, _0804AAD0
	ldr r0, _0804AAD4
	mov r8, r0
	movs r4, 0
	ldr r2, _0804AAD8
	mov r12, r2
	movs r7, 0x8E
	lsls r7, 4
	movs r6, 0xFF
_0804AAA2:
	ldr r0, [r5]
	lsls r2, r3, 3
	adds r0, r2
	add r0, r8
	strb r4, [r0]
	ldr r1, [r5]
	adds r1, r2
	mov r2, r12
	adds r0, r1, r2
	strh r4, [r0]
	adds r1, r7
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	adds r3, 0x1
	cmp r3, 0x3
	ble _0804AAA2
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804AAD0: .4byte 0x03004824
_0804AAD4: .4byte 0x000008dc
_0804AAD8: .4byte 0x000008de
	thumb_func_end sub_804AA88

	thumb_func_start sub_804AADC
sub_804AADC: @ 804AADC
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 24
	lsrs r6, r1, 24
	movs r3, 0
	ldr r4, _0804AB18
	mov r12, r4
	ldr r7, _0804AB1C
_0804AAEE:
	mov r1, r12
	ldr r0, [r1]
	lsls r1, r3, 3
	adds r2, r0, r1
	adds r0, r2, r7
	ldrb r0, [r0]
	cmp r0, 0
	bne _0804AB24
	ldr r3, _0804AB20
	adds r0, r2, r3
	strh r5, [r0]
	adds r3, 0x2
	adds r0, r2, r3
	strb r6, [r0]
	ldr r0, [r4]
	adds r0, r1
	ldr r1, _0804AB1C
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	b _0804AB2A
	.align 2, 0
_0804AB18: .4byte 0x03004824
_0804AB1C: .4byte 0x000008dc
_0804AB20: .4byte 0x000008de
_0804AB24:
	adds r3, 0x1
	cmp r3, 0x3
	ble _0804AAEE
_0804AB2A:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_804AADC

	thumb_func_start sub_804AB30
sub_804AB30: @ 804AB30
	push {r4,r5,lr}
	movs r4, 0
	ldr r3, _0804AB58
_0804AB36:
	ldr r0, [r3]
	lsls r1, r4, 3
	adds r2, r0, r1
	ldr r5, _0804AB5C
	adds r0, r2, r5
	ldrb r0, [r0]
	adds r5, r1, 0
	cmp r0, 0
	beq _0804ABE2
	ldr r0, _0804AB60
	adds r1, r2, r0
	ldrh r0, [r1]
	cmp r0, 0
	beq _0804AB64
	subs r0, 0x1
	strh r0, [r1]
	b _0804ABE2
	.align 2, 0
_0804AB58: .4byte 0x03004824
_0804AB5C: .4byte 0x000008dc
_0804AB60: .4byte 0x000008de
_0804AB64:
	movs r1, 0x8E
	lsls r1, 4
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x5
	bhi _0804ABD2
	lsls r0, 2
	ldr r1, _0804AB7C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804AB7C: .4byte _0804AB80
	.align 2, 0
_0804AB80:
	.4byte _0804AB98
	.4byte _0804ABB4
	.4byte _0804ABBC
	.4byte _0804ABC4
	.4byte _0804ABC4
	.4byte _0804ABCC
_0804AB98:
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0804ABB0
	ldr r1, [r1]
	adds r1, 0x8C
	movs r2, 0x14
	bl SendBlock
	b _0804ABD2
	.align 2, 0
_0804ABB0: .4byte 0x03004824
_0804ABB4:
	movs r0, 0
	bl sub_804AA0C
	b _0804ABD2
_0804ABBC:
	movs r0, 0x2
	bl sub_804AA0C
	b _0804ABD2
_0804ABC4:
	movs r0, 0x3
	bl sub_804AA0C
	b _0804ABD2
_0804ABCC:
	movs r0, 0x3
	bl sub_804AA0C
_0804ABD2:
	ldr r0, _0804ABF0
	ldr r1, [r0]
	adds r1, r5
	ldr r2, _0804ABF4
	adds r1, r2
	movs r2, 0
	strb r2, [r1]
	adds r3, r0, 0
_0804ABE2:
	adds r4, 0x1
	cmp r4, 0x3
	ble _0804AB36
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804ABF0: .4byte 0x03004824
_0804ABF4: .4byte 0x000008dc
	thumb_func_end sub_804AB30

	thumb_func_start sub_804ABF8
sub_804ABF8: @ 804ABF8
	push {r4,lr}
	ldr r0, _0804AC14
	ldr r1, [r0]
	adds r1, 0xB4
	ldrb r1, [r1]
	subs r1, 0x8
	adds r4, r0, 0
	cmp r1, 0x8
	bhi _0804ACB0
	lsls r0, r1, 2
	ldr r1, _0804AC18
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804AC14: .4byte 0x03004824
_0804AC18: .4byte _0804AC1C
	.align 2, 0
_0804AC1C:
	.4byte _0804AC40
	.4byte _0804ACB0
	.4byte _0804ACB0
	.4byte _0804ACB0
	.4byte _0804ACB0
	.4byte _0804AC60
	.4byte _0804AC74
	.4byte _0804AC88
	.4byte _0804AC9A
_0804AC40:
	ldr r0, [r4]
	adds r0, 0xB4
	ldrb r0, [r0]
	lsls r0, 3
	ldr r1, _0804AC5C
	adds r0, r1
	bl LoadSpriteSheet
	ldr r1, [r4]
	adds r2, r1, 0
	adds r2, 0x7E
	strh r0, [r2]
	b _0804ACC2
	.align 2, 0
_0804AC5C: .4byte gUnknown_0820C07C
_0804AC60:
	ldr r0, _0804AC6C
	bl LoadSpritePalette
	ldr r0, _0804AC70
	ldr r1, [r0]
	b _0804ACC2
	.align 2, 0
_0804AC6C: .4byte gUnknown_0820C0E4
_0804AC70: .4byte 0x03004824
_0804AC74:
	ldr r0, _0804AC80
	bl LoadSpritePalette
	ldr r0, _0804AC84
	ldr r1, [r0]
	b _0804ACC2
	.align 2, 0
_0804AC80: .4byte gUnknown_0820C12C
_0804AC84: .4byte 0x03004824
_0804AC88:
	ldr r0, _0804ACA8
	bl LoadSpriteSheet
	ldr r0, _0804ACAC
	ldr r1, [r0]
	adds r1, 0xB4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0804AC9A:
	ldr r0, _0804ACAC
	ldr r0, [r0]
	adds r0, 0xB4
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	b _0804ACCC
	.align 2, 0
_0804ACA8: .4byte gUnknown_0820C124
_0804ACAC: .4byte 0x03004824
_0804ACB0:
	ldr r0, [r4]
	adds r0, 0xB4
	ldrb r0, [r0]
	lsls r0, 3
	ldr r1, _0804ACD4
	adds r0, r1
	bl LoadSpriteSheet
	ldr r1, [r4]
_0804ACC2:
	adds r1, 0xB4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0
_0804ACCC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0804ACD4: .4byte gUnknown_0820C07C
	thumb_func_end sub_804ABF8

	thumb_func_start sub_804ACD8
sub_804ACD8: @ 804ACD8
	push {r4,lr}
	adds r4, r0, 0
	lsls r3, r2, 24
	lsrs r3, 24
	ldr r0, _0804ACF0
	adds r2, r4, 0
	bl sub_804AFB8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804ACF0: .4byte gWindowConfig_81E725C
	thumb_func_end sub_804ACD8

	thumb_func_start sub_804ACF4
sub_804ACF4: @ 804ACF4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0
	beq _0804AD0C
	cmp r0, 0x1
	beq _0804ADA0
	b _0804AE2C
_0804AD0C:
	movs r7, 0
	ldr r1, _0804AD4C
	ldr r0, [r1]
	adds r0, 0x42
	ldrb r0, [r0]
	cmp r7, r0
	blt _0804AD1C
	b _0804AE2C
_0804AD1C:
	adds r6, r1, 0
	movs r5, 0
	mov r9, r5
_0804AD22:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _0804AD50
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x2D
	bl PokemonGetField
	adds r1, r0, 0
	cmp r1, 0x1
	bne _0804AD54
	ldr r0, [r6]
	adds r0, 0x51
	adds r0, r5
	mov r2, r9
	strb r2, [r0]
	ldr r0, [r6]
	adds r0, 0x5D
	adds r0, r5
	b _0804AD84
	.align 2, 0
_0804AD4C: .4byte 0x03004824
_0804AD50: .4byte 0x03004360
_0804AD54:
	adds r0, r4, 0
	movs r1, 0x39
	bl PokemonGetField
	adds r1, r0, 0
	cmp r1, 0
	bne _0804AD72
	ldr r0, [r6]
	adds r0, 0x51
	adds r0, r5
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, 0x5D
	adds r0, r5
	b _0804AD84
_0804AD72:
	ldr r0, [r6]
	adds r0, 0x51
	adds r0, r5
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, 0x5D
	adds r0, r5
	mov r1, r9
_0804AD84:
	strb r1, [r0]
	ldr r0, _0804AD9C
	adds r5, 0x1
	adds r7, 0x1
	ldr r0, [r0]
	adds r0, 0x42
	add r0, r8
	ldrb r0, [r0]
	cmp r7, r0
	blt _0804AD22
	b _0804AE2C
	.align 2, 0
_0804AD9C: .4byte 0x03004824
_0804ADA0:
	movs r7, 0
	ldr r1, _0804ADE0
	ldr r0, [r1]
	adds r0, 0x43
	ldrb r0, [r0]
	cmp r7, r0
	bge _0804AE2C
	adds r6, r1, 0
	movs r5, 0x6
	movs r2, 0
	mov r9, r2
_0804ADB6:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _0804ADE4
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x2D
	bl PokemonGetField
	adds r1, r0, 0
	cmp r1, 0x1
	bne _0804ADE8
	ldr r0, [r6]
	adds r0, 0x51
	adds r0, r5
	mov r2, r9
	strb r2, [r0]
	ldr r0, [r6]
	adds r0, 0x5D
	adds r0, r5
	b _0804AE18
	.align 2, 0
_0804ADE0: .4byte 0x03004824
_0804ADE4: .4byte 0x030045c0
_0804ADE8:
	adds r0, r4, 0
	movs r1, 0x39
	bl PokemonGetField
	adds r1, r0, 0
	cmp r1, 0
	bne _0804AE06
	ldr r0, [r6]
	adds r0, 0x51
	adds r0, r5
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, 0x5D
	adds r0, r5
	b _0804AE18
_0804AE06:
	ldr r0, [r6]
	adds r0, 0x51
	adds r0, r5
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, 0x5D
	adds r0, r5
	mov r1, r9
_0804AE18:
	strb r1, [r0]
	ldr r0, _0804AE38
	adds r5, 0x1
	adds r7, 0x1
	ldr r0, [r0]
	adds r0, 0x42
	add r0, r8
	ldrb r0, [r0]
	cmp r7, r0
	blt _0804ADB6
_0804AE2C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804AE38: .4byte 0x03004824
	thumb_func_end sub_804ACF4

	thumb_func_start sub_804AE3C
sub_804AE3C: @ 804AE3C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0804AE4C
	cmp r0, 0x1
	beq _0804AEAC
	b _0804AF00
_0804AE4C:
	movs r6, 0
	ldr r1, _0804AEA4
	ldr r0, [r1]
	adds r0, 0x42
	ldrb r0, [r0]
	cmp r6, r0
	bcs _0804AF00
	adds r7, r1, 0
_0804AE5C:
	movs r0, 0x64
	adds r4, r6, 0
	muls r4, r0
	ldr r0, _0804AEA8
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl PokemonGetField
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0x3A
	bl PokemonGetField
	adds r1, r0, 0
	lsls r0, r5, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl sub_8046200
	ldr r1, [r7]
	adds r1, 0x69
	adds r1, r6
	strb r0, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, [r7]
	adds r0, 0x42
	ldrb r0, [r0]
	cmp r6, r0
	bcc _0804AE5C
	b _0804AF00
	.align 2, 0
_0804AEA4: .4byte 0x03004824
_0804AEA8: .4byte 0x03004360
_0804AEAC:
	movs r6, 0
	ldr r1, _0804AF08
	ldr r0, [r1]
	adds r0, 0x43
	ldrb r0, [r0]
	cmp r6, r0
	bcs _0804AF00
	adds r7, r1, 0
_0804AEBC:
	movs r0, 0x64
	adds r4, r6, 0
	muls r4, r0
	ldr r0, _0804AF0C
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl PokemonGetField
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0x3A
	bl PokemonGetField
	adds r1, r0, 0
	lsls r0, r5, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl sub_8046200
	ldr r1, [r7]
	adds r1, 0x6F
	adds r1, r6
	strb r0, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, [r7]
	adds r0, 0x43
	ldrb r0, [r0]
	cmp r6, r0
	bcc _0804AEBC
_0804AF00:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804AF08: .4byte 0x03004824
_0804AF0C: .4byte 0x030045c0
	thumb_func_end sub_804AE3C

	thumb_func_start sub_804AF10
sub_804AF10: @ 804AF10
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r5, 0
_0804AF18:
	movs r4, 0
	ldr r2, _0804AF7C
	ldr r0, [r2]
	adds r0, 0x42
	adds r0, r5
	adds r1, r5, 0x1
	mov r8, r1
	ldrb r0, [r0]
	cmp r4, r0
	bge _0804AF6A
	adds r6, r2, 0
	lsls r0, r5, 1
	adds r0, r5
	lsls r7, r0, 1
_0804AF34:
	ldr r2, [r6]
	adds r3, r4, r7
	adds r0, r2, 0
	adds r0, 0x34
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0804AF80
	adds r0, r1
	adds r2, 0x69
	adds r2, r3
	ldrb r2, [r2]
	movs r1, 0x4
	subs r1, r2
	lsls r1, 24
	lsrs r1, 24
	bl sub_809D824
	adds r4, 0x1
	ldr r0, [r6]
	adds r0, 0x42
	adds r0, r5
	ldrb r0, [r0]
	cmp r4, r0
	blt _0804AF34
_0804AF6A:
	mov r5, r8
	cmp r5, 0x1
	ble _0804AF18
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804AF7C: .4byte 0x03004824
_0804AF80: .4byte 0x02020004
	thumb_func_end sub_804AF10

	thumb_func_start sub_804AF84
sub_804AF84: @ 804AF84
	push {r4,lr}
	movs r2, 0
	ldr r4, _0804AFB0
	ldr r3, _0804AFB4
_0804AF8C:
	adds r1, r2, r4
	ldrb r0, [r1]
	cmp r0, 0
	bne _0804AFA2
	ldr r0, [r3]
	adds r0, 0xB5
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0804AFA2
	strb r0, [r1]
_0804AFA2:
	adds r2, 0x1
	cmp r2, 0xA
	ble _0804AF8C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804AFB0: .4byte 0x02028844
_0804AFB4: .4byte 0x03004824
	thumb_func_end sub_804AF84

	thumb_func_start sub_804AFB8
sub_804AFB8: @ 804AFB8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r9, r0
	mov r8, r1
	mov r10, r2
	lsls r3, 24
	lsrs r6, r3, 24
	adds r0, r6, 0x3
	lsrs r6, r0, 2
	ldr r7, _0804B054
	mov r0, sp
	movs r5, 0
	strh r5, [r0]
	lsls r4, r6, 6
	movs r0, 0x80
	lsls r0, 17
	orrs r4, r0
	mov r0, sp
	adds r1, r7, 0
	adds r2, r4, 0
	bl CpuSet
	mov r0, sp
	adds r0, 0x2
	strh r5, [r0]
	mov r2, r9
	ldrb r1, [r2, 0xD]
	lsls r1, 5
	adds r1, r7
	adds r2, r4, 0
	bl CpuSet
	mov r0, r9
	adds r1, r7, 0
	mov r2, r10
	bl sub_8004E3C
	movs r4, 0
	cmp r4, r6
	bcs _0804B042
_0804B010:
	lsls r0, r4, 7
	adds r0, r7, r0
	lsls r1, r4, 8
	add r1, r8
	movs r2, 0x40
	bl CpuSet
	lsls r0, r4, 2
	mov r1, r9
	ldrb r1, [r1, 0xD]
	adds r0, r1
	lsls r0, 5
	adds r0, r7, r0
	lsls r1, r4, 3
	adds r1, 0x4
	lsls r1, 5
	add r1, r8
	movs r2, 0x40
	bl CpuSet
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bcc _0804B010
_0804B042:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B054: .4byte 0x02039360
	thumb_func_end sub_804AFB8

	thumb_func_start sub_804B058
sub_804B058: @ 804B058
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _0804B074
	movs r0, 0x17
	bl audio_play
	movs r0, 0
	strh r0, [r4, 0x2E]
_0804B074:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_804B058

	thumb_func_start sub_804B07C
sub_804B07C: @ 804B07C
	push {lr}
	adds r2, r0, 0
	movs r0, 0x30
	ldrsh r1, [r2, r0]
	cmp r1, 0
	bne _0804B0B2
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	bne _0804B098
	strh r1, [r2, 0x2E]
_0804B098:
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	lsls r0, 1
	ldr r1, _0804B0B8
	adds r0, r1
	ldrb r1, [r2, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	lsls r1, 4
	adds r1, 0x4
	movs r2, 0x2
	bl LoadPalette
_0804B0B2:
	pop {r0}
	bx r0
	.align 2, 0
_0804B0B8: .4byte gTradeGlow2PaletteAnimTable
	thumb_func_end sub_804B07C

	thumb_func_start sub_804B0BC
sub_804B0BC: @ 804B0BC
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x2E]
	adds r1, 0x1
	strh r1, [r2, 0x2E]
	ldrh r0, [r2, 0x26]
	adds r0, 0x1
	strh r0, [r2, 0x26]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0xA
	bne _0804B0DA
	adds r0, r2, 0
	bl DestroySprite
_0804B0DA:
	pop {r0}
	bx r0
	thumb_func_end sub_804B0BC

	thumb_func_start sub_804B0E0
sub_804B0E0: @ 804B0E0
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x2E]
	adds r1, 0x1
	strh r1, [r2, 0x2E]
	ldrh r0, [r2, 0x26]
	subs r0, 0x1
	strh r0, [r2, 0x26]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0xA
	bne _0804B0FE
	adds r0, r2, 0
	bl DestroySprite
_0804B0FE:
	pop {r0}
	bx r0
	thumb_func_end sub_804B0E0

	thumb_func_start sub_804B104
sub_804B104: @ 804B104
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	bne _0804B120
	movs r0, 0xCC
	bl audio_play
	movs r0, 0
	strh r0, [r4, 0x2E]
_0804B120:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_804B104

	thumb_func_start sub_804B128
sub_804B128: @ 804B128
	push {r4,r5,lr}
	sub sp, 0x20
	ldr r0, _0804B1B4
	ldr r0, [r0]
	mov r12, r0
	movs r0, 0x82
	lsls r0, 1
	add r0, r12
	ldrh r1, [r0]
	lsls r1, 8
	movs r0, 0x83
	lsls r0, 1
	add r0, r12
	ldrh r2, [r0]
	lsls r2, 8
	movs r0, 0x86
	lsls r0, 1
	add r0, r12
	movs r4, 0
	ldrsh r3, [r0, r4]
	movs r0, 0x87
	lsls r0, 1
	add r0, r12
	movs r5, 0
	ldrsh r0, [r0, r5]
	str r0, [sp]
	movs r4, 0x8C
	lsls r4, 1
	add r4, r12
	movs r5, 0
	ldrsh r0, [r4, r5]
	str r0, [sp, 0x4]
	movs r5, 0
	ldrsh r0, [r4, r5]
	str r0, [sp, 0x8]
	movs r0, 0x8E
	lsls r0, 1
	add r0, r12
	ldrh r0, [r0]
	str r0, [sp, 0xC]
	add r0, sp, 0x10
	bl sub_8040F34
	ldr r1, _0804B1B8
	add r0, sp, 0x10
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	add r0, sp, 0x10
	ldrh r0, [r0, 0x2]
	strh r0, [r1]
	adds r1, 0x2
	add r0, sp, 0x10
	ldrh r0, [r0, 0x4]
	strh r0, [r1]
	adds r1, 0x2
	add r0, sp, 0x10
	ldrh r0, [r0, 0x6]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, [sp, 0x18]
	str r0, [r1]
	adds r1, 0x4
	ldr r0, [sp, 0x1C]
	str r0, [r1]
	add sp, 0x20
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804B1B4: .4byte 0x03004828
_0804B1B8: .4byte REG_BG2PA
	thumb_func_end sub_804B128

	thumb_func_start sub_804B1BC
sub_804B1BC: @ 804B1BC
	push {lr}
	ldr r1, _0804B1FC
	ldr r0, _0804B200
	ldr r2, [r0]
	movs r3, 0x88
	lsls r3, 1
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, 0x2
	adds r3, 0x2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1]
	movs r0, 0x80
	lsls r0, 19
	ldrh r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0804B208
	ldr r1, _0804B204
	adds r3, 0x2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, 0x2
	adds r3, 0x2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1]
	b _0804B20C
	.align 2, 0
_0804B1FC: .4byte REG_BG1VOFS
_0804B200: .4byte 0x03004828
_0804B204: .4byte REG_BG2VOFS
_0804B208:
	bl sub_804B128
_0804B20C:
	pop {r0}
	bx r0
	thumb_func_end sub_804B1BC

	thumb_func_start sub_804B210
sub_804B210: @ 804B210
	push {lr}
	bl sub_804B1BC
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_804B210

	thumb_func_start sub_804B228
sub_804B228: @ 804B228
	push {r4,lr}
	ldr r4, _0804B248
	ldr r1, [r4]
	adds r2, r1, 0
	adds r2, 0xB4
	movs r3, 0
	movs r0, 0
	strh r0, [r2]
	adds r1, 0xB2
	strb r3, [r1]
	ldr r0, [r4]
	adds r0, 0xB3
	strb r3, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B248: .4byte 0x03004828
	thumb_func_end sub_804B228

	thumb_func_start sub_804B24C
sub_804B24C: @ 804B24C
	push {r4,r5,lr}
	ldr r1, _0804B270
	ldr r2, [r1]
	adds r0, r2, 0
	adds r0, 0xB2
	adds r3, r2, 0
	adds r3, 0xB3
	ldrb r0, [r0]
	adds r5, r1, 0
	ldrb r3, [r3]
	cmp r0, r3
	bne _0804B274
	adds r1, r2, 0
	adds r1, 0xB4
	ldrh r0, [r1]
	adds r0, 0x1
	b _0804B27A
	.align 2, 0
_0804B270: .4byte 0x03004828
_0804B274:
	adds r1, r2, 0
	adds r1, 0xB4
	movs r0, 0
_0804B27A:
	strh r0, [r1]
	adds r4, r5, 0
	ldr r3, [r4]
	adds r2, r3, 0
	adds r2, 0xB4
	ldrh r0, [r2]
	cmp r0, 0xB4
	bls _0804B29C
	movs r1, 0
	movs r0, 0
	strh r0, [r2]
	adds r0, r3, 0
	adds r0, 0xB3
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, 0xB2
	strb r1, [r0]
_0804B29C:
	ldr r0, [r5]
	adds r1, r0, 0
	adds r1, 0xB2
	ldrb r1, [r1]
	adds r0, 0xB3
	strb r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_804B24C

	thumb_func_start sub_804B2B0
sub_804B2B0: @ 804B2B0
	push {lr}
	ldr r0, _0804B2C0
	ldrb r0, [r0]
	cmp r0, 0
	bne _0804B2C4
	movs r0, 0
	b _0804B2CC
	.align 2, 0
_0804B2C0: .4byte 0x03002fa4
_0804B2C4:
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
_0804B2CC:
	pop {r1}
	bx r1
	thumb_func_end sub_804B2B0

	thumb_func_start sub_804B2D0
sub_804B2D0: @ 804B2D0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	movs r4, 0
	mov r10, r4
	cmp r7, 0
	bne _0804B2FC
	ldr r0, _0804B324
	ldrb r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0804B328
	adds r1, r0
	mov r10, r1
	movs r4, 0x1
_0804B2FC:
	cmp r7, 0x1
	bne _0804B31A
	ldr r0, _0804B324
	ldrb r0, [r0, 0x1]
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r1, r0
	ldr r0, _0804B32C
	adds r1, r0
	mov r10, r1
	movs r4, 0x3
_0804B31A:
	cmp r5, 0
	beq _0804B330
	cmp r5, 0x1
	beq _0804B3A4
	b _0804B3FA
	.align 2, 0
_0804B324: .4byte 0x020297d8
_0804B328: .4byte 0x03004360
_0804B32C: .4byte 0x030045c0
_0804B330:
	mov r0, r10
	movs r1, 0x41
	bl PokemonGetField
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r0, r10
	movs r1, 0
	bl PokemonGetField
	mov r9, r0
	lsls r0, r5, 3
	ldr r1, _0804B390
	adds r0, r1
	ldr r1, _0804B394
	lsls r2, r5, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	ldr r3, _0804B398
	ldr r6, _0804B39C
	lsls r7, 1
	mov r8, r7
	mov r4, r8
	adds r4, 0x1
	lsls r4, 2
	adds r4, r6
	ldr r4, [r4]
	str r4, [sp]
	str r5, [sp, 0x4]
	mov r4, r9
	str r4, [sp, 0x8]
	bl sub_800D334
	mov r0, r10
	bl sub_8040990
	bl LoadCompressedObjectPalette
	ldr r0, _0804B3A0
	ldr r0, [r0]
	movs r1, 0x90
	lsls r1, 1
	adds r0, r1
	add r0, r8
	strh r5, [r0]
	b _0804B3FA
	.align 2, 0
_0804B390: .4byte gMonFrontPicTable
_0804B394: .4byte gMonFrontPicCoords
_0804B398: .4byte 0x02000000
_0804B39C: .4byte gUnknown_081FAF4C
_0804B3A0: .4byte 0x03004828
_0804B3A4:
	mov r0, r10
	bl sub_8040990
	ldrh r0, [r0, 0x4]
	adds r1, r4, 0
	bl gpu_pal_obj_decompress_and_apply
	ldr r0, _0804B40C
	movs r1, 0x78
	movs r2, 0x3C
	movs r3, 0x6
	bl CreateSprite
	ldr r4, _0804B410
	ldr r1, [r4]
	adds r1, 0xB8
	adds r1, r7
	strb r0, [r1]
	ldr r3, _0804B414
	ldr r0, [r4]
	adds r0, 0xB8
	adds r0, r7
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, 0xB8
	adds r0, r7
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, 0x1C
	adds r0, r3
	ldr r1, _0804B418
	str r1, [r0]
_0804B3FA:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B40C: .4byte 0x02024e8c
_0804B410: .4byte 0x03004828
_0804B414: .4byte 0x02020004
_0804B418: .4byte SpriteCallbackDummy
	thumb_func_end sub_804B2D0

	thumb_func_start sub_804B41C
sub_804B41C: @ 804B41C
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r1, _0804B43C
	ldr r2, _0804B440
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0xC
	bls _0804B430
	b _0804B76E
_0804B430:
	lsls r0, 2
	ldr r1, _0804B444
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804B43C: .4byte 0x03001770
_0804B440: .4byte 0x0000043c
_0804B444: .4byte _0804B448
	.align 2, 0
_0804B448:
	.4byte _0804B47C
	.4byte _0804B5AC
	.4byte _0804B5D4
	.4byte _0804B5FC
	.4byte _0804B648
	.4byte _0804B678
	.4byte _0804B6A8
	.4byte _0804B6B2
	.4byte _0804B6CC
	.4byte _0804B6E4
	.4byte _0804B71C
	.4byte _0804B726
	.4byte _0804B75C
_0804B47C:
	movs r1, 0x80
	lsls r1, 19
	movs r0, 0
	strh r0, [r1]
	bl ResetTasks
	bl CloseLink
	ldr r6, _0804B570
	ldr r5, _0804B574
	str r5, [r6]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, _0804B578
	bl SetVBlankCallback
	bl sub_804B228
	ldr r4, _0804B57C
	adds r0, r4, 0
	bl SetUpWindowConfig
	ldr r0, [r6]
	adds r0, 0x4
	adds r1, r4, 0
	bl InitWindowFromConfig
	movs r0, 0x2
	bl SetTextWindowBaseTileNum
	ldr r1, [r6]
	adds r1, 0x34
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0x4
	bl LoadTextWindowGraphics
	bl MenuZeroFillScreen
	ldr r1, _0804B580
	ldr r4, _0804B584
	adds r0, r4, 0
	strh r0, [r1]
	ldr r1, _0804B588
	ldr r0, _0804B58C
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, _0804B590
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
	ldr r0, _0804B594
	ldr r1, _0804B598
	adds r5, r1
	movs r2, 0x80
	lsls r2, 4
	adds r1, r5, 0
	bl CpuSet
	ldr r1, _0804B59C
	ldr r0, _0804B5A0
	str r5, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0804B5A4
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _0804B5A8
	movs r1, 0
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r1, [r6]
	adds r0, r1, 0
	adds r0, 0xB6
	movs r2, 0
	strh r2, [r0]
	adds r0, 0xE
	strh r2, [r0]
	movs r4, 0x8F
	lsls r4, 1
	adds r1, r4
	movs r0, 0x1
	strb r0, [r1]
	ldr r3, [r6]
	movs r1, 0x82
	lsls r1, 1
	adds r0, r3, r1
	movs r1, 0x40
	strh r1, [r0]
	subs r4, 0x18
	adds r0, r3, r4
	strh r1, [r0]
	adds r1, 0xC8
	adds r0, r3, r1
	strh r2, [r0]
	adds r4, 0x4
	adds r0, r3, r4
	strh r2, [r0]
	movs r0, 0x86
	lsls r0, 1
	adds r1, r3, r0
	movs r0, 0x78
	strh r0, [r1]
	adds r4, 0x4
	adds r1, r3, r4
	movs r0, 0x50
	strh r0, [r1]
	adds r0, 0xC8
	adds r1, r3, r0
	subs r0, 0x18
	strh r0, [r1]
	movs r1, 0x8E
	lsls r1, 1
	adds r0, r3, r1
	strh r2, [r0]
	b _0804B76E
	.align 2, 0
_0804B570: .4byte 0x03004828
_0804B574: .4byte 0x0201f000
_0804B578: .4byte sub_804B210
_0804B57C: .4byte gWindowConfig_81E6F84
_0804B580: .4byte 0x03002b74
_0804B584: .4byte 0x00001144
_0804B588: .4byte 0x03001770
_0804B58C: .4byte 0x0000043c
_0804B590: .4byte gUnknown_08D00000
_0804B594: .4byte gUnknown_08D00524
_0804B598: .4byte 0xfffe1000
_0804B59C: .4byte 0x06002800
_0804B5A0: .4byte 0x040000d4
_0804B5A4: .4byte 0x80000280
_0804B5A8: .4byte gUnknown_08D004E0
_0804B5AC:
	bl OpenLink
	ldr r1, _0804B5C8
	ldr r2, _0804B5CC
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	ldr r0, _0804B5D0
	ldr r0, [r0]
	adds r0, 0xC0
	str r2, [r0]
	b _0804B76E
	.align 2, 0
_0804B5C8: .4byte 0x03001770
_0804B5CC: .4byte 0x0000043c
_0804B5D0: .4byte 0x03004828
_0804B5D4:
	ldr r0, _0804B5F4
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x3C
	bhi _0804B5E8
	b _0804B76E
_0804B5E8:
	movs r0, 0
	str r0, [r1]
	ldr r4, _0804B5F8
	adds r1, r2, r4
	b _0804B74C
	.align 2, 0
_0804B5F4: .4byte 0x03004828
_0804B5F8: .4byte 0x0000043c
_0804B5FC:
	bl IsLinkMaster
	lsls r0, 24
	cmp r0, 0
	bne _0804B608
	b _0804B746
_0804B608:
	bl GetLinkPlayerCount_2
	adds r4, r0, 0
	bl sub_800820C
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bcs _0804B61C
	b _0804B76E
_0804B61C:
	ldr r0, _0804B63C
	ldr r1, [r0]
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x1E
	bhi _0804B62E
	b _0804B76E
_0804B62E:
	bl sub_8007F4C
	ldr r1, _0804B640
	ldr r0, _0804B644
	adds r1, r0
	b _0804B74C
	.align 2, 0
_0804B63C: .4byte 0x03004828
_0804B640: .4byte 0x03001770
_0804B644: .4byte 0x0000043c
_0804B648:
	bl sub_804B24C
	ldr r0, _0804B66C
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0804B656
	b _0804B76E
_0804B656:
	bl IsLinkPlayerDataExchangeComplete
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0804B664
	b _0804B76E
_0804B664:
	ldr r1, _0804B670
	ldr r4, _0804B674
	adds r1, r4
	b _0804B74C
	.align 2, 0
_0804B66C: .4byte 0x03002fa4
_0804B670: .4byte 0x03001770
_0804B674: .4byte 0x0000043c
_0804B678:
	ldr r2, _0804B69C
	ldr r0, [r2]
	adds r0, 0x9C
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, 0x9D
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, 0xBD
	strb r1, [r0]
	movs r0, 0
	bl sub_804B2D0
	ldr r1, _0804B6A0
	ldr r0, _0804B6A4
	adds r1, r0
	b _0804B74C
	.align 2, 0
_0804B69C: .4byte 0x03004828
_0804B6A0: .4byte 0x03001770
_0804B6A4: .4byte 0x0000043c
_0804B6A8:
	movs r0, 0
	movs r1, 0x1
	bl sub_804B2D0
	b _0804B746
_0804B6B2:
	movs r0, 0x1
	movs r1, 0
	bl sub_804B2D0
	ldr r1, _0804B6C4
	ldr r4, _0804B6C8
	adds r1, r4
	b _0804B74C
	.align 2, 0
_0804B6C4: .4byte 0x03001770
_0804B6C8: .4byte 0x0000043c
_0804B6CC:
	movs r0, 0x1
	movs r1, 0x1
	bl sub_804B2D0
	ldr r1, _0804B6DC
	ldr r0, _0804B6E0
	adds r1, r0
	b _0804B74C
	.align 2, 0
_0804B6DC: .4byte 0x03001770
_0804B6E0: .4byte 0x0000043c
_0804B6E4:
	bl sub_804C164
	ldr r0, _0804B704
	bl LoadSpriteSheet
	ldr r0, _0804B708
	bl LoadSpritePalette
	ldr r1, _0804B70C
	ldr r2, _0804B710
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0804B714
	ldr r4, _0804B718
	adds r1, r4
	b _0804B74C
	.align 2, 0
_0804B704: .4byte gUnknown_0821594C
_0804B708: .4byte gUnknown_08215954
_0804B70C: .4byte REG_BG1CNT
_0804B710: .4byte 0x00000502
_0804B714: .4byte 0x03001770
_0804B718: .4byte 0x0000043c
_0804B71C:
	ldr r0, _0804B754
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0804B726:
	movs r0, 0x5
	bl sub_804BBE8
	movs r0, 0
	bl sub_804BBE8
	bl sub_804C1A8
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_0804B746:
	ldr r1, _0804B758
	ldr r2, _0804B754
	adds r1, r2
_0804B74C:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0804B76E
	.align 2, 0
_0804B754: .4byte 0x0000043c
_0804B758: .4byte 0x03001770
_0804B75C:
	ldr r0, _0804B788
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804B76E
	ldr r0, _0804B78C
	bl SetMainCallback2
_0804B76E:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804B788: .4byte 0x0202f388
_0804B78C: .4byte sub_804DB84
	thumb_func_end sub_804B41C

	thumb_func_start sub_804B790
sub_804B790: @ 804B790
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x10
	ldr r1, _0804B7B4
	ldr r2, _0804B7B8
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0xC
	bls _0804B7A8
	b _0804B9F2
_0804B7A8:
	lsls r0, 2
	ldr r1, _0804B7BC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804B7B4: .4byte 0x03001770
_0804B7B8: .4byte 0x0000043c
_0804B7BC: .4byte _0804B7C0
	.align 2, 0
_0804B7C0:
	.4byte _0804B7F4
	.4byte _0804B9F2
	.4byte _0804B9F2
	.4byte _0804B9F2
	.4byte _0804B9F2
	.4byte _0804B914
	.4byte _0804B92C
	.4byte _0804B944
	.4byte _0804B94E
	.4byte _0804B968
	.4byte _0804B9A0
	.4byte _0804B9AA
	.4byte _0804B9E0
_0804B7F4:
	ldr r1, _0804B8E0
	ldr r0, _0804B8E4
	ldrh r0, [r0]
	movs r6, 0
	strb r0, [r1]
	movs r0, 0x6
	strb r0, [r1, 0x1]
	ldr r4, _0804B8E8
	ldr r1, _0804B8EC
	adds r0, r4, 0
	bl StringCopy
	ldr r0, _0804B8F0
	movs r1, 0x7
	add r2, sp, 0x4
	bl PokemonGetField
	adds r4, 0x1C
	adds r0, r4, 0
	add r1, sp, 0x4
	bl StringCopy
	movs r0, 0x80
	lsls r0, 19
	movs r3, 0
	mov r8, r3
	strh r6, [r0]
	bl ResetTasks
	ldr r5, _0804B8F4
	ldr r0, _0804B8F8
	str r0, [r5]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, _0804B8FC
	bl SetVBlankCallback
	bl sub_804B228
	ldr r4, _0804B900
	adds r0, r4, 0
	bl SetUpWindowConfig
	ldr r0, [r5]
	adds r0, 0x4
	adds r1, r4, 0
	bl InitWindowFromConfig
	movs r0, 0x2
	bl SetTextWindowBaseTileNum
	ldr r1, [r5]
	adds r1, 0x34
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, 0x4
	bl LoadTextWindowGraphics
	bl MenuZeroFillScreen
	ldr r1, _0804B904
	ldr r2, _0804B908
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, [r5]
	movs r3, 0x8F
	lsls r3, 1
	adds r0, r3
	mov r1, r8
	strb r1, [r0]
	ldr r2, [r5]
	adds r0, r2, 0
	adds r0, 0xB6
	strh r6, [r0]
	adds r0, 0xE
	strh r6, [r0]
	subs r3, 0x1A
	adds r0, r2, r3
	movs r1, 0x40
	strh r1, [r0]
	adds r3, 0x2
	adds r0, r2, r3
	strh r1, [r0]
	adds r1, 0xC8
	adds r0, r2, r1
	strh r6, [r0]
	adds r3, 0x4
	adds r0, r2, r3
	strh r6, [r0]
	movs r0, 0x86
	lsls r0, 1
	adds r1, r2, r0
	movs r0, 0x78
	strh r0, [r1]
	adds r3, 0x4
	adds r1, r2, r3
	movs r0, 0x50
	strh r0, [r1]
	adds r0, 0xC8
	adds r1, r2, r0
	subs r0, 0x18
	strh r0, [r1]
	movs r1, 0x8E
	lsls r1, 1
	adds r0, r2, r1
	strh r6, [r0]
	adds r0, r2, 0
	adds r0, 0xC0
	str r6, [r0]
	ldr r0, _0804B90C
	ldr r2, _0804B910
	adds r0, r2
	movs r1, 0x5
	strb r1, [r0]
	b _0804B9F2
	.align 2, 0
_0804B8E0: .4byte 0x020297d8
_0804B8E4: .4byte 0x0202e8ce
_0804B8E8: .4byte 0x03002978
_0804B8EC: .4byte gSaveBlock2
_0804B8F0: .4byte 0x030045c0
_0804B8F4: .4byte 0x03004828
_0804B8F8: .4byte 0x0201f000
_0804B8FC: .4byte sub_804B210
_0804B900: .4byte gWindowConfig_81E717C
_0804B904: .4byte 0x03002b74
_0804B908: .4byte 0x00001144
_0804B90C: .4byte 0x03001770
_0804B910: .4byte 0x0000043c
_0804B914:
	movs r0, 0
	movs r1, 0
	bl sub_804B2D0
	ldr r1, _0804B924
	ldr r3, _0804B928
	adds r1, r3
	b _0804B9D0
	.align 2, 0
_0804B924: .4byte 0x03001770
_0804B928: .4byte 0x0000043c
_0804B92C:
	movs r0, 0
	movs r1, 0x1
	bl sub_804B2D0
	ldr r1, _0804B93C
	ldr r0, _0804B940
	adds r1, r0
	b _0804B9D0
	.align 2, 0
_0804B93C: .4byte 0x03001770
_0804B940: .4byte 0x0000043c
_0804B944:
	movs r0, 0x1
	movs r1, 0
	bl sub_804B2D0
	b _0804B9CA
_0804B94E:
	movs r0, 0x1
	movs r1, 0x1
	bl sub_804B2D0
	ldr r1, _0804B960
	ldr r3, _0804B964
	adds r1, r3
	b _0804B9D0
	.align 2, 0
_0804B960: .4byte 0x03001770
_0804B964: .4byte 0x0000043c
_0804B968:
	bl sub_804C164
	ldr r0, _0804B988
	bl LoadSpriteSheet
	ldr r0, _0804B98C
	bl LoadSpritePalette
	ldr r1, _0804B990
	ldr r2, _0804B994
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0804B998
	ldr r3, _0804B99C
	adds r1, r3
	b _0804B9D0
	.align 2, 0
_0804B988: .4byte gUnknown_0821594C
_0804B98C: .4byte gUnknown_08215954
_0804B990: .4byte REG_BG1CNT
_0804B994: .4byte 0x00000502
_0804B998: .4byte 0x03001770
_0804B99C: .4byte 0x0000043c
_0804B9A0:
	ldr r0, _0804B9D8
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0804B9AA:
	movs r0, 0x5
	bl sub_804BBE8
	movs r0, 0
	bl sub_804BBE8
	bl sub_804C1A8
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_0804B9CA:
	ldr r1, _0804B9DC
	ldr r2, _0804B9D8
	adds r1, r2
_0804B9D0:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0804B9F2
	.align 2, 0
_0804B9D8: .4byte 0x0000043c
_0804B9DC: .4byte 0x03001770
_0804B9E0:
	ldr r0, _0804BA10
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804B9F2
	ldr r0, _0804BA14
	bl SetMainCallback2
_0804B9F2:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804BA10: .4byte 0x0202f388
_0804BA14: .4byte sub_804BBCC
	thumb_func_end sub_804B790

	thumb_func_start sub_804BA18
sub_804BA18: @ 804BA18
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r1, r0
	ldr r0, _0804BA60
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x2D
	bl PokemonGetField
	cmp r0, 0
	bne _0804BA5A
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl PokemonGetField
	lsls r0, 16
	lsrs r0, 16
	bl SpeciesToNationalPokedexNum
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8090D90
	adds r0, r4, 0
	movs r1, 0x3
	bl sub_8090D90
_0804BA5A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BA60: .4byte 0x03004360
	thumb_func_end sub_804BA18

	thumb_func_start sub_804BA64
sub_804BA64: @ 804BA64
	push {lr}
	bl GetMultiplayerId
	lsls r0, 24
	ldr r2, _0804BA90
	movs r1, 0x80
	lsls r1, 17
	eors r1, r0
	lsrs r1, 24
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x2]
	movs r0, 0x80
	lsls r0, 8
	cmp r1, r0
	bne _0804BA8C
	bl sub_80690F0
_0804BA8C:
	pop {r0}
	bx r0
	.align 2, 0
_0804BA90: .4byte 0x03002970
	thumb_func_end sub_804BA64

	thumb_func_start sub_804BA94
sub_804BA94: @ 804BA94
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r4, 24
	lsrs r4, 24
	movs r5, 0x64
	mov r1, r9
	muls r1, r5
	ldr r0, _0804BB60
	adds r7, r1, r0
	adds r0, r7, 0
	movs r1, 0x40
	bl PokemonGetField
	lsls r0, 16
	lsrs r6, r0, 16
	adds r1, r4, 0
	muls r1, r5
	ldr r0, _0804BB64
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0x40
	bl PokemonGetField
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r6, 0xFF
	beq _0804BAE8
	lsls r0, r6, 3
	adds r0, r6
	lsls r0, 2
	ldr r1, _0804BB68
	adds r0, r1
	bl sub_80A2B40
_0804BAE8:
	ldr r4, _0804BB6C
	ldr r0, [r4]
	adds r0, 0x38
	adds r1, r7, 0
	movs r2, 0x64
	bl memcpy
	adds r0, r7, 0
	adds r1, r5, 0
	movs r2, 0x64
	bl memcpy
	ldr r1, [r4]
	adds r1, 0x38
	adds r0, r5, 0
	movs r2, 0x64
	bl memcpy
	movs r1, 0x46
	mov r0, sp
	strb r1, [r0]
	adds r0, r7, 0
	movs r1, 0x2D
	bl PokemonGetField
	cmp r0, 0
	bne _0804BB28
	adds r0, r7, 0
	movs r1, 0x20
	mov r2, sp
	bl pokemon_setattr
_0804BB28:
	mov r0, r8
	cmp r0, 0xFF
	beq _0804BB3E
	lsls r1, r0, 3
	add r1, r8
	lsls r1, 2
	ldr r0, _0804BB70
	adds r1, r0
	adds r0, r7, 0
	bl sub_80A2D88
_0804BB3E:
	mov r0, r9
	bl sub_804BA18
	ldr r0, _0804BB74
	ldrb r0, [r0]
	cmp r0, 0
	beq _0804BB50
	bl sub_804BA64
_0804BB50:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BB60: .4byte 0x03004360
_0804BB64: .4byte 0x030045c0
_0804BB68: .4byte 0x02028280
_0804BB6C: .4byte 0x03004828
_0804BB70: .4byte 0x02029700
_0804BB74: .4byte 0x03002fa4
	thumb_func_end sub_804BA94

	thumb_func_start sub_804BB78
sub_804BB78: @ 804BB78
	push {r4,lr}
	ldr r4, _0804BB8C
	ldr r0, [r4]
	adds r0, 0xBD
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0804BB90
	cmp r0, 0x2
	beq _0804BBB6
	b _0804BBC0
	.align 2, 0
_0804BB8C: .4byte 0x03004828
_0804BB90:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _0804BBB6
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	adds r1, 0x9E
	movs r2, 0x14
	bl SendBlock
	ldr r1, [r4]
	adds r1, 0xBD
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0804BBB6:
	ldr r0, _0804BBC8
	ldr r0, [r0]
	adds r0, 0xBD
	movs r1, 0
	strb r1, [r0]
_0804BBC0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BBC8: .4byte 0x03004828
	thumb_func_end sub_804BB78

	thumb_func_start sub_804BBCC
sub_804BBCC: @ 804BBCC
	push {lr}
	bl sub_804C29C
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_804BBCC

	thumb_func_start sub_804BBE8
sub_804BBE8: @ 804BBE8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x7
	bls _0804BBF4
	b _0804C0CA
_0804BBF4:
	lsls r0, 2
	ldr r1, _0804BC00
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804BC00: .4byte _0804BC04
	.align 2, 0
_0804BC04:
	.4byte _0804BC24
	.4byte _0804BCC4
	.4byte _0804BD5C
	.4byte _0804BDA4
	.4byte _0804BE48
	.4byte _0804BEF8
	.4byte _0804BFA0
	.4byte _0804C060
_0804BC24:
	ldr r0, _0804BCA0
	movs r1, 0x10
	movs r2, 0xA0
	bl LoadPalette
	ldr r3, _0804BCA4
	ldr r4, _0804BCA8
	movs r5, 0x98
	lsls r5, 5
	ldr r1, _0804BCAC
	ldr r6, _0804BCB0
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_0804BC42:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _0804BC42
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _0804BCB4
	ldr r2, _0804BCB8
	ldr r0, _0804BCAC
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0804BCB0
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _0804BCBC
	ldr r2, [r0]
	movs r0, 0x8A
	lsls r0, 1
	adds r1, r2, r0
	movs r0, 0
	strh r0, [r1]
	movs r3, 0x8B
	lsls r3, 1
	adds r1, r2, r3
	movs r0, 0xB4
	strh r0, [r1]
	movs r1, 0x80
	lsls r1, 19
	movs r4, 0xBA
	lsls r4, 5
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0xC
	ldr r2, _0804BCC0
	adds r0, r2, 0
	strh r0, [r1]
	b _0804C0CA
	.align 2, 0
_0804BCA0: .4byte gUnknown_0820C9F8
_0804BCA4: .4byte gUnknown_0820CA98
_0804BCA8: .4byte 0x06004000
_0804BCAC: .4byte 0x040000d4
_0804BCB0: .4byte 0x80000800
_0804BCB4: .4byte gUnknown_0820F798
_0804BCB8: .4byte 0x06009000
_0804BCBC: .4byte 0x03004828
_0804BCC0: .4byte 0x00005206
_0804BCC4:
	ldr r0, _0804BD3C
	ldr r2, [r0]
	movs r3, 0x89
	lsls r3, 1
	adds r1, r2, r3
	movs r0, 0
	strh r0, [r1]
	movs r4, 0x88
	lsls r4, 1
	adds r0, r2, r4
	movs r1, 0xAE
	lsls r1, 1
	strh r1, [r0]
	ldr r0, _0804BD40
	strh r1, [r0]
	ldr r1, _0804BD44
	ldr r2, _0804BD48
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0804BD4C
	ldr r2, _0804BD50
	movs r3, 0x80
	lsls r3, 5
	adds r1, 0xCA
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	movs r2, 0x80
	lsls r2, 24
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r4, [r1, 0x8]
	ldr r4, _0804BD54
	movs r5, 0xC0
	lsls r5, 19
	movs r6, 0x98
	lsls r6, 5
	adds r7, r0, 0
_0804BD10:
	str r4, [r1]
	str r5, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r4, r3
	adds r5, r3
	subs r6, r3
	cmp r6, r3
	bhi _0804BD10
	str r4, [r1]
	str r5, [r1, 0x4]
	lsrs r0, r6, 1
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r1, 0x80
	lsls r1, 19
	ldr r3, _0804BD58
	adds r0, r3, 0
	strh r0, [r1]
	b _0804C0CA
	.align 2, 0
_0804BD3C: .4byte 0x03004828
_0804BD40: .4byte REG_BG1VOFS
_0804BD44: .4byte REG_BG1CNT
_0804BD48: .4byte 0x00008502
_0804BD4C: .4byte gUnknown_08210798
_0804BD50: .4byte 0x06002800
_0804BD54: .4byte gUnknown_0820CA98
_0804BD58: .4byte 0x00001241
_0804BD5C:
	ldr r0, _0804BD8C
	ldr r2, [r0]
	movs r4, 0x88
	lsls r4, 1
	adds r0, r2, r4
	movs r1, 0
	strh r1, [r0]
	movs r3, 0x89
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	movs r1, 0x80
	lsls r1, 19
	ldr r4, _0804BD90
	adds r0, r4, 0
	strh r0, [r1]
	ldr r1, _0804BD94
	ldr r2, _0804BD98
	ldr r0, _0804BD9C
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0804BDA0
	b _0804C0C6
	.align 2, 0
_0804BD8C: .4byte 0x03004828
_0804BD90: .4byte 0x00001241
_0804BD94: .4byte gUnknown_08211798
_0804BD98: .4byte 0x06002800
_0804BD9C: .4byte 0x040000d4
_0804BDA0: .4byte 0x80000400
_0804BDA4:
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0x92
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0804BE24
	ldr r3, [r0]
	movs r4, 0x82
	lsls r4, 1
	adds r1, r3, r4
	movs r2, 0
	movs r0, 0x40
	strh r0, [r1]
	adds r4, 0x2
	adds r1, r3, r4
	strh r0, [r1]
	adds r0, 0xCC
	adds r1, r3, r0
	movs r0, 0x78
	strh r0, [r1]
	adds r4, 0x8
	adds r1, r3, r4
	ldr r0, _0804BE28
	strh r0, [r1]
	movs r1, 0x8E
	lsls r1, 1
	adds r0, r3, r1
	strh r2, [r0]
	ldr r3, _0804BE2C
	ldr r4, _0804BE30
	movs r5, 0xD0
	lsls r5, 5
	ldr r2, _0804BE34
	mov r12, r2
	ldr r1, _0804BE38
	ldr r6, _0804BE3C
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_0804BDF6:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _0804BDF6
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _0804BE40
	ldr r0, _0804BE38
	mov r3, r12
	str r3, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0804BE44
	b _0804C0C6
	.align 2, 0
_0804BE24: .4byte 0x03004828
_0804BE28: .4byte 0x0000ffba
_0804BE2C: .4byte gUnknown_0820DD98
_0804BE30: .4byte 0x06004000
_0804BE34: .4byte gUnknown_08211F98
_0804BE38: .4byte 0x040000d4
_0804BE3C: .4byte 0x80000800
_0804BE40: .4byte 0x06009000
_0804BE44: .4byte 0x80000080
_0804BE48:
	movs r1, 0x80
	lsls r1, 19
	ldr r4, _0804BED0
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0xC
	ldr r2, _0804BED4
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0804BED8
	ldr r3, [r0]
	movs r4, 0x82
	lsls r4, 1
	adds r1, r3, r4
	movs r2, 0
	movs r0, 0x40
	strh r0, [r1]
	adds r0, 0xC6
	adds r1, r3, r0
	movs r0, 0x5C
	strh r0, [r1]
	adds r4, 0x14
	adds r1, r3, r4
	movs r0, 0x20
	strh r0, [r1]
	adds r0, 0xFA
	adds r1, r3, r0
	movs r0, 0x80
	lsls r0, 3
	strh r0, [r1]
	movs r1, 0x8E
	lsls r1, 1
	adds r0, r3, r1
	strh r2, [r0]
	ldr r3, _0804BEDC
	ldr r4, _0804BEE0
	movs r5, 0x81
	lsls r5, 6
	ldr r2, _0804BEE4
	mov r12, r2
	ldr r1, _0804BEE8
	ldr r6, _0804BEEC
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_0804BEA4:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _0804BEA4
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _0804BEF0
	ldr r0, _0804BEE8
	mov r3, r12
	str r3, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0804BEF4
	b _0804C0C6
	.align 2, 0
_0804BED0: .4byte 0x00001441
_0804BED4: .4byte 0x00001287
_0804BED8: .4byte 0x03004828
_0804BEDC: .4byte gUnknown_08213738
_0804BEE0: .4byte 0x06004000
_0804BEE4: .4byte gUnknown_08215778
_0804BEE8: .4byte 0x040000d4
_0804BEEC: .4byte 0x80000800
_0804BEF0: .4byte 0x06009000
_0804BEF4: .4byte 0x80000080
_0804BEF8:
	ldr r0, _0804BF78
	ldr r2, [r0]
	movs r4, 0x88
	lsls r4, 1
	adds r0, r2, r4
	movs r1, 0
	strh r1, [r0]
	movs r3, 0x89
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	ldr r1, _0804BF7C
	ldr r4, _0804BF80
	adds r0, r4, 0
	strh r0, [r1]
	ldr r0, _0804BF84
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
	ldr r0, _0804BF88
	ldr r4, _0804BF8C
	movs r2, 0x80
	lsls r2, 4
	adds r1, r4, 0
	bl CpuSet
	ldr r0, _0804BF90
	movs r1, 0x70
	movs r2, 0x20
	bl LoadCompressedPalette
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	bl FillPalette
	movs r0, 0xE0
	lsls r0, 7
	adds r2, r0, 0
	movs r1, 0xA0
	lsls r1, 2
_0804BF4C:
	ldrh r0, [r4]
	orrs r0, r2
	strh r0, [r4]
	adds r4, 0x2
	subs r1, 0x1
	cmp r1, 0
	bne _0804BF4C
	ldr r1, _0804BF8C
	ldr r2, _0804BF94
	ldr r0, _0804BF98
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0804BF9C
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	movs r0, 0x2
	movs r1, 0xF
	movs r2, 0x1B
	movs r3, 0x12
	bl MenuZeroFillWindowRect
	b _0804C0CA
	.align 2, 0
_0804BF78: .4byte 0x03004828
_0804BF7C: .4byte REG_BG1CNT
_0804BF80: .4byte 0x00000502
_0804BF84: .4byte gUnknown_08D00000
_0804BF88: .4byte gUnknown_08D00524
_0804BF8C: .4byte 0x02000000
_0804BF90: .4byte gUnknown_08D004E0
_0804BF94: .4byte 0x06002800
_0804BF98: .4byte 0x040000d4
_0804BF9C: .4byte 0x80000280
_0804BFA0:
	movs r1, 0x80
	lsls r1, 19
	ldr r2, _0804C038
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0xC
	ldr r3, _0804C03C
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _0804C040
	ldr r3, [r0]
	movs r4, 0x82
	lsls r4, 1
	adds r1, r3, r4
	movs r2, 0
	movs r0, 0x40
	strh r0, [r1]
	adds r0, 0xC6
	adds r1, r3, r0
	movs r0, 0x5C
	strh r0, [r1]
	adds r4, 0x14
	adds r1, r3, r4
	adds r0, 0xA4
	strh r0, [r1]
	adds r0, 0x1A
	adds r1, r3, r0
	movs r0, 0x80
	strh r0, [r1]
	subs r4, 0xC
	adds r1, r3, r4
	movs r0, 0x78
	strh r0, [r1]
	adds r0, 0x96
	adds r1, r3, r0
	movs r0, 0x50
	strh r0, [r1]
	movs r1, 0x8E
	lsls r1, 1
	adds r0, r3, r1
	strh r2, [r0]
	ldr r3, _0804C044
	ldr r4, _0804C048
	movs r5, 0x81
	lsls r5, 6
	ldr r2, _0804C04C
	mov r12, r2
	ldr r1, _0804C050
	ldr r6, _0804C054
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_0804C00A:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _0804C00A
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _0804C058
	ldr r0, _0804C050
	mov r3, r12
	str r3, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0804C05C
	b _0804C0C6
	.align 2, 0
_0804C038: .4byte 0x00001441
_0804C03C: .4byte 0x00001287
_0804C040: .4byte 0x03004828
_0804C044: .4byte gUnknown_08213738
_0804C048: .4byte 0x06004000
_0804C04C: .4byte gUnknown_08215778
_0804C050: .4byte 0x040000d4
_0804C054: .4byte 0x80000800
_0804C058: .4byte 0x06009000
_0804C05C: .4byte 0x80000080
_0804C060:
	ldr r0, _0804C0D0
	ldr r2, [r0]
	movs r4, 0x8A
	lsls r4, 1
	adds r0, r2, r4
	movs r1, 0
	strh r1, [r0]
	movs r3, 0x8B
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	ldr r1, _0804C0D4
	ldr r4, _0804C0D8
	adds r0, r4, 0
	strh r0, [r1]
	ldr r0, _0804C0DC
	movs r1, 0x10
	movs r2, 0xA0
	bl LoadPalette
	ldr r3, _0804C0E0
	ldr r4, _0804C0E4
	movs r5, 0x98
	lsls r5, 5
	ldr r1, _0804C0E8
	ldr r6, _0804C0EC
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_0804C09C:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _0804C09C
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _0804C0F0
	ldr r2, _0804C0F4
	ldr r0, _0804C0E8
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0804C0EC
_0804C0C6:
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
_0804C0CA:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C0D0: .4byte 0x03004828
_0804C0D4: .4byte REG_BG2CNT
_0804C0D8: .4byte 0x00005206
_0804C0DC: .4byte gUnknown_0820C9F8
_0804C0E0: .4byte gUnknown_0820CA98
_0804C0E4: .4byte 0x06004000
_0804C0E8: .4byte 0x040000d4
_0804C0EC: .4byte 0x80000800
_0804C0F0: .4byte gUnknown_0820F798
_0804C0F4: .4byte 0x06009000
	thumb_func_end sub_804BBE8

	thumb_func_start sub_804C0F8
sub_804C0F8: @ 804C0F8
	push {lr}
	lsls r0, 24
	cmp r0, 0
	bne _0804C130
	ldr r0, _0804C128
	ldr r2, [r0]
	movs r1, 0x88
	lsls r1, 1
	adds r0, r2, r1
	movs r3, 0
	ldrsh r1, [r0, r3]
	ldr r0, _0804C12C
	cmp r1, r0
	bgt _0804C15A
	adds r0, 0x5
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r3, 0x8E
	lsls r3, 1
	adds r1, r2, r3
	b _0804C154
	.align 2, 0
_0804C128: .4byte 0x03004828
_0804C12C: .4byte 0x00000109
_0804C130:
	ldr r0, _0804C160
	ldr r0, [r0]
	mov r12, r0
	movs r2, 0x87
	lsls r2, 1
	add r2, r12
	ldrh r3, [r2]
	movs r0, 0
	ldrsh r1, [r2, r0]
	movs r0, 0x40
	negs r0, r0
	cmp r1, r0
	ble _0804C15A
	subs r0, r3, 0x1
	strh r0, [r2]
	movs r1, 0x8E
	lsls r1, 1
	add r1, r12
_0804C154:
	ldrh r0, [r1]
	adds r0, 0x40
	strh r0, [r1]
_0804C15A:
	pop {r0}
	bx r0
	.align 2, 0
_0804C160: .4byte 0x03004828
	thumb_func_end sub_804C0F8

	thumb_func_start sub_804C164
sub_804C164: @ 804C164
	push {lr}
	ldr r0, _0804C190
	bl LoadSpriteSheet
	ldr r0, _0804C194
	bl LoadSpriteSheet
	ldr r0, _0804C198
	bl LoadSpriteSheet
	ldr r0, _0804C19C
	bl LoadSpriteSheet
	ldr r0, _0804C1A0
	bl LoadSpritePalette
	ldr r0, _0804C1A4
	bl LoadSpritePalette
	pop {r0}
	bx r0
	.align 2, 0
_0804C190: .4byte gUnknown_082159A4
_0804C194: .4byte gUnknown_082159F4
_0804C198: .4byte gUnknown_08215A28
_0804C19C: .4byte gUnknown_08215A78
_0804C1A0: .4byte gUnknown_082159AC
_0804C1A4: .4byte gUnknown_082159B4
	thumb_func_end sub_804C164

	thumb_func_start sub_804C1A8
sub_804C1A8: @ 804C1A8
	push {r4,r5,lr}
	sub sp, 0x14
	ldr r0, _0804C21C
	ldr r0, [r0]
	movs r1, 0x8F
	lsls r1, 1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0804C23C
	bl GetMultiplayerId
	lsls r0, 24
	ldr r3, _0804C220
	movs r2, 0x80
	lsls r2, 17
	eors r2, r0
	lsrs r2, 24
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	ldr r0, _0804C224
	adds r1, r0
	adds r0, r3, 0
	bl StringCopy
	ldr r5, _0804C228
	ldrb r0, [r5, 0x1]
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0x64
	muls r0, r4
	ldr r1, _0804C22C
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl PokemonGetField
	ldr r0, _0804C230
	mov r1, sp
	bl StringCopy10
	ldrb r0, [r5]
	muls r0, r4
	ldr r1, _0804C234
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl PokemonGetField
	ldr r0, _0804C238
	mov r1, sp
	bl StringCopy10
	b _0804C278
	.align 2, 0
_0804C21C: .4byte 0x03004828
_0804C220: .4byte 0x020231cc
_0804C224: .4byte 0x03002978
_0804C228: .4byte 0x020297d8
_0804C22C: .4byte 0x030045c0
_0804C230: .4byte 0x020233cc
_0804C234: .4byte 0x03004360
_0804C238: .4byte 0x020232cc
_0804C23C:
	ldr r0, _0804C280
	ldrh r0, [r0]
	lsls r4, r0, 4
	subs r4, r0
	lsls r4, 2
	ldr r0, _0804C284
	adds r4, r0
	ldr r0, _0804C288
	adds r1, r4, 0
	adds r1, 0x2B
	bl StringCopy
	ldr r0, _0804C28C
	adds r1, r4, 0
	bl StringCopy10
	ldr r0, _0804C290
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0804C294
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl PokemonGetField
	ldr r0, _0804C298
	mov r1, sp
	bl StringCopy10
_0804C278:
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804C280: .4byte 0x0202e8cc
_0804C284: .4byte gIngameTrades
_0804C288: .4byte 0x020231cc
_0804C28C: .4byte 0x020233cc
_0804C290: .4byte 0x0202e8ce
_0804C294: .4byte 0x03004360
_0804C298: .4byte 0x020232cc
	thumb_func_end sub_804C1A8

	thumb_func_start sub_804C29C
sub_804C29C: @ 804C29C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	ldr r1, _0804C2C0
	ldr r0, [r1]
	adds r0, 0xC4
	ldrh r0, [r0]
	adds r6, r1, 0
	cmp r0, 0xC8
	bls _0804C2B6
	bl _0804D570
_0804C2B6:
	lsls r0, 2
	ldr r1, _0804C2C4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804C2C0: .4byte 0x03004828
_0804C2C4: .4byte _0804C2C8
	.align 2, 0
_0804C2C8:
	.4byte _0804C5EC
	.4byte _0804C66C
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804C6C8
	.4byte _0804C704
	.4byte _0804C79C
	.4byte _0804D570
	.4byte _0804C824
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804C848
	.4byte _0804C868
	.4byte _0804C87A
	.4byte _0804C89C
	.4byte _0804C8F4
	.4byte _0804C92C
	.4byte _0804C978
	.4byte _0804C9C8
	.4byte _0804CA1C
	.4byte _0804CAB4
	.4byte _0804CAD8
	.4byte _0804CB24
	.4byte _0804CB70
	.4byte _0804CBCC
	.4byte _0804CC2C
	.4byte _0804CC40
	.4byte _0804CC54
	.4byte _0804CC68
	.4byte _0804CD94
	.4byte _0804CE64
	.4byte _0804CEEC
	.4byte _0804CF68
	.4byte _0804CF78
	.4byte _0804CFA0
	.4byte _0804CFFC
	.4byte _0804D028
	.4byte _0804D054
	.4byte _0804D06A
	.4byte _0804D0D4
	.4byte _0804D570
	.4byte _0804D0FC
	.4byte _0804D13C
	.4byte _0804D182
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D1A4
	.4byte _0804D1C4
	.4byte _0804D1D2
	.4byte _0804D1F4
	.4byte _0804D2A8
	.4byte _0804D2E4
	.4byte _0804D314
	.4byte _0804D3C4
	.4byte _0804D41C
	.4byte _0804D48C
	.4byte _0804D4A0
	.4byte _0804D4A6
	.4byte _0804D4CC
	.4byte _0804D528
	.4byte _0804D54C
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804CA54
_0804C5EC:
	ldr r3, _0804C65C
	ldr r0, [r6]
	adds r0, 0xB8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldr r4, [r6]
	adds r2, r4, 0
	adds r2, 0xB8
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, _0804C660
	strh r1, [r0, 0x24]
	ldrb r0, [r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldr r2, _0804C664
	movs r3, 0x90
	lsls r3, 1
	adds r0, r4, r3
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	strh r0, [r1, 0x26]
	adds r1, r4, 0
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	bl current_map_music_get
	ldr r1, [r6]
	movs r7, 0x92
	lsls r7, 1
	adds r1, r7
	strh r0, [r1]
	ldr r0, _0804C668
	bl sub_8075474
	bl _0804D570
	.align 2, 0
_0804C65C: .4byte 0x02020004
_0804C660: .4byte 0x0000ff4c
_0804C664: .4byte gMonFrontPicCoords
_0804C668: .4byte 0x00000179
_0804C66C:
	ldr r4, [r6]
	movs r0, 0x8B
	lsls r0, 1
	adds r5, r4, r0
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0
	ble _0804C6A0
	ldr r2, _0804C69C
	adds r0, r4, 0
	adds r0, 0xB8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x24]
	adds r1, 0x3
	strh r1, [r0, 0x24]
	ldrh r0, [r5]
	subs r0, 0x3
	strh r0, [r5]
	bl _0804D570
	.align 2, 0
_0804C69C: .4byte 0x02020004
_0804C6A0:
	ldr r2, _0804C6C4
	adds r0, r4, 0
	adds r0, 0xB8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x24]
	strh r1, [r5]
	adds r1, r4, 0
	adds r1, 0xC4
	movs r0, 0xA
	strh r0, [r1]
	bl _0804D570
	.align 2, 0
_0804C6C4: .4byte 0x02020004
_0804C6C8:
	ldr r5, _0804C6F8
	ldr r1, _0804C6FC
	adds r0, r5, 0
	bl StringExpandPlaceholders
	ldr r4, _0804C700
	ldr r1, [r4]
	adds r0, r1, 0x4
	adds r1, 0x34
	ldrb r2, [r1]
	movs r1, 0xF
	str r1, [sp]
	adds r1, r5, 0
	movs r3, 0x2
	bl sub_8003460
	ldr r1, [r4]
	adds r2, r1, 0
	adds r2, 0xC4
	movs r3, 0
	movs r0, 0xB
	bl _0804D40C
	.align 2, 0
_0804C6F8: .4byte 0x020234cc
_0804C6FC: .4byte gUnknown_0842C60B
_0804C700: .4byte 0x03004828
_0804C704:
	ldr r2, [r6]
	adds r1, r2, 0
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x50
	beq _0804C718
	bl _0804D570
_0804C718:
	adds r0, r2, 0
	adds r0, 0xB8
	ldrb r0, [r0]
	ldr r2, _0804C78C
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x5]
	lsrs r1, 4
	movs r2, 0x2
	str r2, [sp]
	movs r2, 0x1
	str r2, [sp, 0x4]
	movs r2, 0x14
	str r2, [sp, 0x8]
	ldr r2, _0804C790
	str r2, [sp, 0xC]
	movs r2, 0x78
	movs r3, 0x20
	bl sub_8047580
	ldr r1, [r6]
	movs r2, 0x81
	lsls r2, 1
	adds r1, r2
	strb r0, [r1]
	ldr r0, [r6]
	adds r2, r0, 0
	adds r2, 0xC4
	ldrh r1, [r2]
	adds r1, 0x1
	strh r1, [r2]
	adds r0, 0x4
	movs r1, 0x13
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x1D
	bl ZeroFillWindowRect
	ldr r4, _0804C794
	ldr r1, _0804C798
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r1, [r6]
	adds r0, r1, 0x4
	adds r1, 0x34
	ldrb r2, [r1]
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r3, 0x2
	bl sub_8003460
	bl _0804D570
	.align 2, 0
_0804C78C: .4byte 0x02020004
_0804C790: .4byte 0x000fffff
_0804C794: .4byte 0x020234cc
_0804C798: .4byte gUnknown_0842C622
_0804C79C:
	ldr r7, _0804C810
	ldr r2, [r6]
	movs r5, 0x81
	lsls r5, 1
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r7, 0
	adds r4, 0x1C
	adds r0, r4
	ldr r1, [r0]
	ldr r0, _0804C814
	cmp r1, r0
	beq _0804C7C0
	bl _0804D570
_0804C7C0:
	adds r0, r2, 0x4
	bl sub_80035AC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0804C7D2
	bl _0804D570
_0804C7D2:
	ldr r0, _0804C818
	movs r1, 0x78
	movs r2, 0x20
	movs r3, 0
	bl CreateSprite
	ldr r1, [r6]
	ldr r2, _0804C81C
	adds r1, r2
	strb r0, [r1]
	ldr r3, [r6]
	adds r2, r3, r2
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _0804C820
	str r1, [r0]
	adds r3, r5
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	bl DestroySprite
	ldr r1, [r6]
	bl _0804D53C
	.align 2, 0
_0804C810: .4byte 0x02020004
_0804C814: .4byte SpriteCallbackDummy
_0804C818: .4byte gSpriteTemplate_821595C
_0804C81C: .4byte 0x00000103
_0804C820: .4byte sub_804D738
_0804C824:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0804C844
	ldr r0, [r0]
	adds r0, 0xC4
	movs r1, 0x14
	strh r1, [r0]
	bl _0804D570
	.align 2, 0
_0804C844: .4byte 0x03004828
_0804C848:
	ldr r0, _0804C864
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804C858
	bl _0804D570
_0804C858:
	movs r0, 0x4
	bl sub_804BBE8
	bl _0804D538
	.align 2, 0
_0804C864: .4byte 0x0202f388
_0804C868:
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x10
	movs r3, 0
	bl _0804D534
_0804C87A:
	ldr r0, _0804C898
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804C88A
	bl _0804D570
_0804C88A:
	ldr r0, [r6]
	adds r0, 0xC4
	movs r1, 0x17
	strh r1, [r0]
	bl _0804D570
	.align 2, 0
_0804C898: .4byte 0x0202f388
_0804C89C:
	ldr r4, _0804C8B8
	ldr r0, [r4]
	movs r3, 0x8D
	lsls r3, 1
	adds r2, r0, r3
	ldrh r1, [r2]
	movs r0, 0x80
	lsls r0, 1
	cmp r1, r0
	bls _0804C8BC
	adds r0, r1, 0
	subs r0, 0x34
	strh r0, [r2]
	b _0804C8E0
	.align 2, 0
_0804C8B8: .4byte 0x03004828
_0804C8BC:
	movs r0, 0x1
	bl sub_804BBE8
	ldr r3, [r4]
	movs r7, 0x8D
	lsls r7, 1
	adds r1, r3, r7
	movs r2, 0
	movs r0, 0x80
	strh r0, [r1]
	adds r1, r3, 0
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	adds r0, r3, 0
	adds r0, 0xC0
	str r2, [r0]
_0804C8E0:
	ldr r0, _0804C8F0
	ldr r4, [r0]
	movs r1, 0x8D
	lsls r1, 1
	adds r0, r4, r1
	bl _0804D16E
	.align 2, 0
_0804C8F0: .4byte 0x03004828
_0804C8F4:
	ldr r1, [r6]
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x14
	bhi _0804C906
	bl _0804D570
_0804C906:
	movs r0, 0x3
	bl sub_804BBE8
	bl sub_804B128
	ldr r0, _0804C928
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	ldr r1, [r6]
	adds r1, 0xBB
	strb r0, [r1]
	ldr r1, [r6]
	bl _0804D53C
	.align 2, 0
_0804C928: .4byte gSpriteTemplate_8215A80
_0804C92C:
	ldr r2, _0804C96C
	ldr r0, [r6]
	adds r0, 0xBB
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	cmp r0, 0
	blt _0804C94C
	bl _0804D570
_0804C94C:
	adds r0, r1, 0
	bl DestroySprite
	ldr r1, _0804C970
	movs r3, 0xC8
	lsls r3, 3
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r7, _0804C974
	adds r0, r7, 0
	strh r0, [r1]
	ldr r1, [r6]
	bl _0804D53C
	.align 2, 0
_0804C96C: .4byte 0x02020004
_0804C970: .4byte REG_BLDCNT
_0804C974: .4byte 0x0000040c
_0804C978:
	ldr r2, [r6]
	movs r3, 0x88
	lsls r3, 1
	adds r0, r2, r3
	ldrh r1, [r0]
	subs r1, 0x1
	strh r1, [r0]
	lsls r1, 16
	movs r0, 0x9E
	lsls r0, 17
	cmp r1, r0
	bne _0804C99A
	adds r1, r2, 0
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_0804C99A:
	ldr r0, [r6]
	adds r0, r3
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0xA4
	lsls r0, 1
	cmp r1, r0
	beq _0804C9AE
	bl _0804D570
_0804C9AE:
	ldr r0, _0804C9C4
	movs r1, 0x80
	movs r2, 0x41
	movs r3, 0
	bl CreateSprite
	ldr r1, [r6]
	adds r1, 0xBC
	strb r0, [r1]
	bl _0804D570
	.align 2, 0
_0804C9C4: .4byte gSpriteTemplate_8215A30
_0804C9C8:
	ldr r0, _0804CA0C
	movs r1, 0x80
	movs r2, 0x50
	movs r3, 0x3
	bl CreateSprite
	ldr r4, _0804CA10
	ldr r1, [r4]
	adds r1, 0xBA
	strb r0, [r1]
	ldr r0, _0804CA14
	movs r1, 0x80
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	ldr r1, [r4]
	adds r1, 0xBB
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, 0xBB
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0804CA18
	adds r0, r1
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r1, [r4]
	bl _0804D53C
	.align 2, 0
_0804CA0C: .4byte gSpriteTemplate_82159BC
_0804CA10: .4byte 0x03004828
_0804CA14: .4byte gSpriteTemplate_82159FC
_0804CA18: .4byte 0x02020004
_0804CA1C:
	ldr r2, [r6]
	movs r3, 0x88
	lsls r3, 1
	adds r1, r2, r3
	ldrh r0, [r1]
	subs r0, 0x2
	strh r0, [r1]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA6
	bne _0804CA3A
	adds r1, r2, 0
	adds r1, 0xC4
	movs r0, 0xC8
	strh r0, [r1]
_0804CA3A:
	movs r0, 0
	bl sub_804C0F8
	movs r1, 0x80
	lsls r1, 19
	ldr r7, _0804CA50
	adds r0, r7, 0
	strh r0, [r1]
	bl _0804D570
	.align 2, 0
_0804CA50: .4byte 0x00001641
_0804CA54:
	ldr r4, _0804CAB0
	ldr r2, [r6]
	adds r0, r2, 0
	adds r0, 0xBA
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x22]
	subs r1, 0x2
	strh r1, [r0, 0x22]
	adds r2, 0xBB
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x22]
	subs r1, 0x2
	strh r1, [r0, 0x22]
	movs r0, 0
	bl sub_804C0F8
	ldr r2, [r6]
	adds r0, r2, 0
	adds r0, 0xBA
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r3, 0x22
	ldrsh r1, [r0, r3]
	movs r0, 0x8
	negs r0, r0
	cmp r1, r0
	blt _0804CAA4
	bl _0804D570
_0804CAA4:
	adds r1, r2, 0
	adds r1, 0xC4
	movs r0, 0x1D
	strh r0, [r1]
	bl _0804D570
	.align 2, 0
_0804CAB0: .4byte 0x02020004
_0804CAB4:
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0804CAD4
	ldr r0, [r0]
	adds r0, 0xC4
	movs r1, 0x1E
	strh r1, [r0]
	bl _0804D570
	.align 2, 0
_0804CAD4: .4byte 0x03004828
_0804CAD8:
	ldr r0, _0804CB1C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804CAE8
	bl _0804D570
_0804CAE8:
	ldr r0, [r6]
	adds r0, 0xBA
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0804CB20
	adds r0, r4
	bl DestroySprite
	ldr r0, [r6]
	adds r0, 0xBB
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	movs r0, 0x2
	bl sub_804BBE8
	ldr r1, [r6]
	bl _0804D53C
	.align 2, 0
_0804CB1C: .4byte 0x0202f388
_0804CB20: .4byte 0x02020004
_0804CB24:
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r5, _0804CB68
	adds r0, r5, 0
	movs r1, 0x6F
	movs r2, 0xAA
	movs r3, 0
	bl CreateSprite
	ldr r4, _0804CB6C
	ldr r1, [r4]
	adds r1, 0xBA
	strb r0, [r1]
	movs r2, 0xA
	negs r2, r2
	adds r0, r5, 0
	movs r1, 0x81
	movs r3, 0
	bl CreateSprite
	ldr r1, [r4]
	adds r1, 0xBB
	strb r0, [r1]
	ldr r1, [r4]
	bl _0804D53C
	.align 2, 0
_0804CB68: .4byte gSpriteTemplate_82159FC
_0804CB6C: .4byte 0x03004828
_0804CB70:
	ldr r0, _0804CBC0
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804CB8E
	movs r0, 0x2E
	bl audio_play
	ldr r0, _0804CBC4
	ldr r1, [r0]
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_0804CB8E:
	ldr r3, _0804CBC8
	ldr r0, _0804CBC4
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0xBA
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x26]
	subs r1, 0x3
	strh r1, [r0, 0x26]
	adds r2, 0xBB
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	strh r1, [r0, 0x26]
	bl _0804D570
	.align 2, 0
_0804CBC0: .4byte 0x0202f388
_0804CBC4: .4byte 0x03004828
_0804CBC8: .4byte 0x02020004
_0804CBCC:
	ldr r5, _0804CC28
	ldr r4, [r6]
	adds r2, r4, 0
	adds r2, 0xBA
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x26]
	subs r1, 0x3
	strh r1, [r0, 0x26]
	adds r6, r4, 0
	adds r6, 0xBB
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	strh r1, [r0, 0x26]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r5
	movs r7, 0x26
	ldrsh r1, [r3, r7]
	movs r0, 0x5A
	negs r0, r0
	cmp r1, r0
	ble _0804CC12
	bl _0804D570
_0804CC12:
	movs r2, 0x1
	strh r2, [r3, 0x30]
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x30]
	adds r1, r4, 0
	bl _0804D53C
	.align 2, 0
_0804CC28: .4byte 0x02020004
_0804CC2C:
	ldr r2, _0804CC3C
	movs r0, 0x1
	movs r1, 0x10
	bl BlendPalettes
	bl _0804D538
	.align 2, 0
_0804CC3C: .4byte 0x0000ffff
_0804CC40:
	ldr r2, _0804CC50
	movs r0, 0x1
	movs r1, 0
	bl BlendPalettes
	bl _0804D538
	.align 2, 0
_0804CC50: .4byte 0x0000ffff
_0804CC54:
	ldr r2, _0804CC64
	movs r0, 0x1
	movs r1, 0x10
	bl BlendPalettes
	bl _0804D538
	.align 2, 0
_0804CC64: .4byte 0x0000ffff
_0804CC68:
	ldr r5, _0804CCD8
	ldr r0, [r5]
	movs r1, 0x90
	lsls r1, 1
	adds r0, r1
	ldrh r0, [r0]
	bl sub_8040A3C
	lsls r0, 24
	cmp r0, 0
	bne _0804CCE4
	ldr r4, _0804CCDC
	ldr r2, [r5]
	adds r2, 0xB8
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x10
	adds r0, r1
	ldr r1, _0804CCE0
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x1]
	movs r2, 0x3
	orrs r1, r2
	strb r1, [r0, 0x1]
	ldr r0, [r5]
	adds r0, 0xB8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0
	movs r2, 0x3
	movs r3, 0x3
	bl CalcCenterToCornerVec
	ldr r0, [r5]
	adds r0, 0xB8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0
	bl StartSpriteAffineAnim
	b _0804CCFA
	.align 2, 0
_0804CCD8: .4byte 0x03004828
_0804CCDC: .4byte 0x02020004
_0804CCE0: .4byte gSpriteAffineAnimTable_8215AC0
_0804CCE4:
	ldr r0, [r5]
	adds r0, 0xB8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0804CD88
	adds r0, r1
	movs r1, 0
	bl StartSpriteAffineAnim
_0804CCFA:
	ldr r5, _0804CD8C
	ldr r0, [r5]
	adds r0, 0xB9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0804CD88
	adds r0, r4
	movs r1, 0
	bl StartSpriteAffineAnim
	ldr r2, [r5]
	adds r3, r2, 0
	adds r3, 0xB8
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x3C
	strh r1, [r0, 0x20]
	adds r2, 0xB9
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xB4
	strh r1, [r0, 0x20]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xC0
	strh r1, [r0, 0x22]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _0804CD90
	strh r1, [r0, 0x22]
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, 0xB9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	ldr r1, [r5]
	bl _0804D53C
	.align 2, 0
_0804CD88: .4byte 0x02020004
_0804CD8C: .4byte 0x03004828
_0804CD90: .4byte 0x0000ffe0
_0804CD94:
	ldr r4, _0804CE5C
	ldr r2, [r6]
	adds r3, r2, 0
	adds r3, 0xB8
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x26]
	subs r1, 0x3
	movs r5, 0
	strh r1, [r0, 0x26]
	adds r2, 0xB9
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	strh r1, [r0, 0x26]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r0, [r0, 0x26]
	adds r0, 0xA3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bhi _0804CDDC
	movs r0, 0x2D
	bl audio_play
_0804CDDC:
	ldr r2, [r6]
	adds r3, r2, 0
	adds r3, 0xB8
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r7, 0x26
	ldrsh r1, [r0, r7]
	movs r0, 0xDE
	negs r0, r0
	cmp r1, r0
	blt _0804CDFA
	b _0804D570
_0804CDFA:
	adds r0, r2, 0
	adds r0, 0xBA
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r5, [r0, 0x30]
	adds r0, r2, 0
	adds r0, 0xBB
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r5, [r0, 0x30]
	adds r1, r2, 0
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, 0xB9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	ldr r2, _0804CE60
	movs r0, 0x1
	movs r1, 0
	bl BlendPalettes
	b _0804D570
	.align 2, 0
_0804CE5C: .4byte 0x02020004
_0804CE60: .4byte 0x0000ffff
_0804CE64:
	ldr r4, _0804CEE8
	ldr r2, [r6]
	adds r3, r2, 0
	adds r3, 0xBA
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x26]
	subs r1, 0x3
	strh r1, [r0, 0x26]
	adds r2, 0xBB
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	strh r1, [r0, 0x26]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r2, 0x26
	ldrsh r1, [r0, r2]
	movs r0, 0xDE
	negs r0, r0
	cmp r1, r0
	ble _0804CEA6
	b _0804D570
_0804CEA6:
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, [r6]
	adds r2, r1, 0
	adds r2, 0xC4
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	adds r1, 0xBA
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r0, [r6]
	adds r0, 0xBB
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	b _0804D570
	.align 2, 0
_0804CEE8: .4byte 0x02020004
_0804CEEC:
	ldr r0, _0804CF58
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804CEFA
	b _0804D570
_0804CEFA:
	ldr r1, [r6]
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0x1
	bl sub_804BBE8
	ldr r0, [r6]
	movs r3, 0x88
	lsls r3, 1
	adds r0, r3
	movs r1, 0xA6
	strh r1, [r0]
	ldr r0, _0804CF5C
	movs r4, 0x14
	negs r4, r4
	movs r1, 0x80
	adds r2, r4, 0
	movs r3, 0x3
	bl CreateSprite
	ldr r1, [r6]
	adds r1, 0xBA
	strb r0, [r1]
	ldr r0, _0804CF60
	movs r1, 0x80
	adds r2, r4, 0
	movs r3, 0
	bl CreateSprite
	ldr r1, [r6]
	adds r1, 0xBB
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0xBB
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0804CF64
	adds r0, r1
	movs r1, 0x1
	bl StartSpriteAnim
	b _0804D570
	.align 2, 0
_0804CF58: .4byte 0x0202f388
_0804CF5C: .4byte gSpriteTemplate_82159BC
_0804CF60: .4byte gSpriteTemplate_82159FC
_0804CF64: .4byte 0x02020004
_0804CF68:
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x10
	movs r3, 0
	b _0804D534
_0804CF78:
	movs r1, 0x80
	lsls r1, 19
	ldr r7, _0804CF98
	adds r0, r7, 0
	strh r0, [r1]
	movs r0, 0x1
	bl sub_804C0F8
	ldr r0, _0804CF9C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804CF96
	b _0804D570
_0804CF96:
	b _0804D538
	.align 2, 0
_0804CF98: .4byte 0x00001641
_0804CF9C: .4byte 0x0202f388
_0804CFA0:
	movs r0, 0x1
	bl sub_804C0F8
	ldr r2, _0804CFF4
	ldr r0, _0804CFF8
	ldr r3, [r0]
	adds r4, r3, 0
	adds r4, 0xBA
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	strh r1, [r0, 0x26]
	adds r0, r3, 0
	adds r0, 0xBB
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	strh r1, [r0, 0x26]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r2, 0x26
	ldrsh r1, [r0, r2]
	movs r7, 0x22
	ldrsh r0, [r0, r7]
	adds r1, r0
	cmp r1, 0x40
	beq _0804CFEE
	b _0804D570
_0804CFEE:
	adds r1, r3, 0
	b _0804D53C
	.align 2, 0
_0804CFF4: .4byte 0x02020004
_0804CFF8: .4byte 0x03004828
_0804CFFC:
	movs r0, 0x1
	bl sub_804C0F8
	ldr r0, _0804D024
	ldr r1, [r0]
	movs r0, 0x88
	lsls r0, 1
	adds r2, r1, r0
	ldrh r0, [r2]
	adds r0, 0x2
	strh r0, [r2]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x9E
	lsls r3, 1
	cmp r0, r3
	bgt _0804D020
	b _0804D570
_0804D020:
	strh r3, [r2]
	b _0804D53C
	.align 2, 0
_0804D024: .4byte 0x03004828
_0804D028:
	ldr r0, [r6]
	adds r0, 0xBA
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0804D050
	adds r0, r4
	bl DestroySprite
	ldr r0, [r6]
	adds r0, 0xBB
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	b _0804D400
	.align 2, 0
_0804D050: .4byte 0x02020004
_0804D054:
	ldr r2, [r6]
	adds r1, r2, 0
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0xA
	beq _0804D066
	b _0804D570
_0804D066:
	adds r1, 0x4
	b _0804D53E
_0804D06A:
	ldr r1, [r6]
	movs r4, 0x88
	lsls r4, 1
	adds r2, r1, r4
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0xAE
	lsls r3, 1
	cmp r0, r3
	ble _0804D08E
	strh r3, [r2]
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_0804D08E:
	ldr r0, [r6]
	adds r0, r4
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0xA4
	lsls r0, 1
	cmp r1, r0
	bne _0804D0B0
	ldr r0, _0804D0C8
	movs r1, 0x80
	movs r2, 0x41
	movs r3, 0
	bl CreateSprite
	ldr r1, [r6]
	adds r1, 0xBC
	strb r0, [r1]
_0804D0B0:
	ldr r2, _0804D0CC
	ldr r0, [r6]
	adds r0, 0xBC
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _0804D0D0
	str r1, [r0]
	b _0804D570
	.align 2, 0
_0804D0C8: .4byte gSpriteTemplate_8215A30
_0804D0CC: .4byte 0x02020004
_0804D0D0: .4byte sub_804B0E0
_0804D0D4:
	ldr r0, _0804D0F4
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	ldr r2, _0804D0F8
	ldr r1, [r2]
	adds r1, 0xBB
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, 0xC4
	movs r1, 0x32
	strh r1, [r0]
	b _0804D570
	.align 2, 0
_0804D0F4: .4byte gSpriteTemplate_8215A80
_0804D0F8: .4byte 0x03004828
_0804D0FC:
	ldr r2, _0804D138
	ldr r0, [r6]
	adds r0, 0xBB
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	cmp r0, 0
	blt _0804D11A
	b _0804D570
_0804D11A:
	adds r0, r1, 0
	bl DestroySprite
	movs r0, 0x6
	bl sub_804BBE8
	ldr r1, [r6]
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0x9F
	bl audio_play
	b _0804D570
	.align 2, 0
_0804D138: .4byte 0x02020004
_0804D13C:
	ldr r1, [r6]
	movs r3, 0x8D
	lsls r3, 1
	adds r2, r1, r3
	ldrh r3, [r2]
	ldr r0, _0804D154
	cmp r3, r0
	bhi _0804D158
	adds r0, r3, 0
	adds r0, 0x34
	strh r0, [r2]
	b _0804D166
	.align 2, 0
_0804D154: .4byte 0x000003ff
_0804D158:
	movs r0, 0x80
	lsls r0, 3
	strh r0, [r2]
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_0804D166:
	ldr r4, [r6]
	movs r7, 0x8D
	lsls r7, 1
	adds r0, r4, r7
_0804D16E:
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 8
	bl __divsi3
	movs r2, 0x8C
	lsls r2, 1
	adds r1, r4, r2
	strh r0, [r1]
	b _0804D570
_0804D182:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0804D1A0
	ldr r0, [r0]
	adds r0, 0xC4
	movs r1, 0x3C
	strh r1, [r0]
	b _0804D570
	.align 2, 0
_0804D1A0: .4byte 0x03004828
_0804D1A4:
	ldr r0, _0804D1C0
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804D1B2
	b _0804D570
_0804D1B2:
	movs r0, 0x5
	bl sub_804BBE8
	movs r0, 0x7
	bl sub_804BBE8
	b _0804D538
	.align 2, 0
_0804D1C0: .4byte 0x0202f388
_0804D1C4:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	b _0804D534
_0804D1D2:
	movs r1, 0x80
	lsls r1, 19
	movs r3, 0xA2
	lsls r3, 5
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _0804D1F0
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804D1EC
	b _0804D570
_0804D1EC:
	ldr r1, [r6]
	b _0804D53C
	.align 2, 0
_0804D1F0: .4byte 0x0202f388
_0804D1F4:
	ldr r0, _0804D290
	movs r2, 0x8
	negs r2, r2
	movs r1, 0x78
	movs r3, 0
	bl CreateSprite
	ldr r6, _0804D294
	ldr r1, [r6]
	ldr r5, _0804D298
	adds r1, r5
	movs r7, 0
	mov r8, r7
	strb r0, [r1]
	ldr r4, _0804D29C
	ldr r2, [r6]
	adds r2, r5
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x4A
	strh r1, [r0, 0x34]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0804D2A0
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x2
	bl StartSpriteAffineAnim
	ldr r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	ldr r2, _0804D2A4
	movs r1, 0x10
	bl BlendPalettes
	ldr r1, [r6]
	adds r2, r1, 0
	adds r2, 0xC4
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	adds r1, 0xC0
	mov r0, r8
	str r0, [r1]
	b _0804D570
	.align 2, 0
_0804D290: .4byte gSpriteTemplate_821595C
_0804D294: .4byte 0x03004828
_0804D298: .4byte 0x00000103
_0804D29C: .4byte 0x02020004
_0804D2A0: .4byte sub_804D80C
_0804D2A4: .4byte 0x0000ffff
_0804D2A8:
	ldr r2, _0804D2D8
	ldr r0, [r6]
	ldr r1, _0804D2DC
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	ldr r1, _0804D2E0
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, [r6]
	b _0804D53C
	.align 2, 0
_0804D2D8: .4byte 0x02020004
_0804D2DC: .4byte 0x00000103
_0804D2E0: .4byte 0x0000ffff
_0804D2E4:
	ldr r2, _0804D308
	ldr r3, [r6]
	ldr r7, _0804D30C
	adds r0, r3, r7
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0804D310
	cmp r1, r0
	beq _0804D302
	b _0804D570
_0804D302:
	adds r1, r3, 0
	b _0804D53C
	.align 2, 0
_0804D308: .4byte 0x02020004
_0804D30C: .4byte 0x00000103
_0804D310: .4byte SpriteCallbackDummy
_0804D314:
	ldr r4, _0804D3B4
	ldr r0, [r6]
	mov r8, r0
	mov r5, r8
	adds r5, 0xB9
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r3, 0
	movs r1, 0x78
	strh r1, [r0, 0x20]
	ldrb r0, [r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldr r2, _0804D3B8
	movs r0, 0x91
	lsls r0, 1
	add r0, r8
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	adds r0, 0x3C
	strh r0, [r1, 0x22]
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r3, [r0, 0x24]
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r3, [r0, 0x26]
	ldrb r0, [r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r1, [r1, 0x5]
	lsrs r1, 4
	movs r2, 0x2
	str r2, [sp]
	movs r2, 0x1
	str r2, [sp, 0x4]
	movs r2, 0x14
	str r2, [sp, 0x8]
	ldr r2, _0804D3BC
	str r2, [sp, 0xC]
	movs r2, 0x78
	movs r3, 0x54
	bl AddTextPrinterForMessage
	ldr r0, [r6]
	ldr r5, _0804D3C0
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldr r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r1, [r6]
	b _0804D53C
	.align 2, 0
_0804D3B4: .4byte 0x02020004
_0804D3B8: .4byte gMonFrontPicCoords
_0804D3BC: .4byte 0x000fffff
_0804D3C0: .4byte 0x00000103
_0804D3C4:
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xBA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, [r6]
	adds r0, 0x4
	movs r1, 0x13
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x1D
	bl ZeroFillWindowRect
	ldr r4, _0804D414
	ldr r1, _0804D418
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r1, [r6]
	adds r0, r1, 0x4
	adds r1, 0x34
	ldrb r2, [r1]
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r3, 0x2
	bl sub_8003460
_0804D400:
	ldr r1, [r6]
	adds r2, r1, 0
	adds r2, 0xC4
	ldrh r0, [r2]
	adds r0, 0x1
	movs r3, 0
_0804D40C:
	strh r0, [r2]
	adds r1, 0xC0
	str r3, [r1]
	b _0804D570
	.align 2, 0
_0804D414: .4byte 0x020234cc
_0804D418: .4byte gUnknown_0842C62F
_0804D41C:
	ldr r1, [r6]
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x4
	bne _0804D430
	ldr r0, _0804D480
	bl fanfare_play
_0804D430:
	ldr r2, [r6]
	adds r0, r2, 0
	adds r0, 0xC0
	ldr r0, [r0]
	cmp r0, 0xF0
	beq _0804D43E
	b _0804D570
_0804D43E:
	adds r1, r2, 0
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r1]
	adds r0, r2, 0x4
	movs r1, 0x13
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x1D
	bl ZeroFillWindowRect
	ldr r4, _0804D484
	ldr r1, _0804D488
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r1, [r6]
	adds r0, r1, 0x4
	adds r1, 0x34
	ldrb r2, [r1]
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r3, 0x2
	bl sub_8003460
	ldr r0, [r6]
	adds r0, 0xC0
	str r5, [r0]
	b _0804D570
	.align 2, 0
_0804D480: .4byte 0x00000173
_0804D484: .4byte 0x020234cc
_0804D488: .4byte gUnknown_0842C640
_0804D48C:
	ldr r2, [r6]
	adds r1, r2, 0
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x3C
	bne _0804D570
	adds r1, 0x4
	b _0804D53E
_0804D4A0:
	bl sub_804E1DC
	b _0804D538
_0804D4A6:
	ldr r2, [r6]
	movs r3, 0x8F
	lsls r3, 1
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, 0
	beq _0804D4B8
	movs r0, 0x1
	b _0804D572
_0804D4B8:
	ldr r0, _0804D4C8
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0804D570
	adds r1, r2, 0
	b _0804D53C
	.align 2, 0
_0804D4C8: .4byte 0x03001770
_0804D4CC:
	ldr r0, _0804D510
	ldrb r0, [r0]
	movs r1, 0
	bl sub_804BA94
	ldr r1, _0804D514
	ldr r0, _0804D518
	str r0, [r1]
	ldr r7, _0804D51C
	ldrb r0, [r7]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _0804D520
	adds r0, r5
	movs r1, 0x1
	movs r2, 0
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _0804D538
	ldrb r3, [r7]
	adds r0, r3, 0
	muls r0, r6
	adds r0, r5
	ldr r1, _0804D524
	ldr r1, [r1]
	adds r1, 0xB9
	ldrb r2, [r1]
	adds r1, r4, 0
	bl sub_81120E4
	b _0804D538
	.align 2, 0
_0804D510: .4byte 0x0202e8ce
_0804D514: .4byte 0x03005e94
_0804D518: .4byte sub_804BBCC
_0804D51C: .4byte 0x020297d8
_0804D520: .4byte 0x03004360
_0804D524: .4byte 0x03004828
_0804D528:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
_0804D534:
	bl BeginNormalPaletteFade
_0804D538:
	ldr r0, _0804D548
	ldr r1, [r0]
_0804D53C:
	adds r1, 0xC4
_0804D53E:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0804D570
	.align 2, 0
_0804D548: .4byte 0x03004828
_0804D54C:
	ldr r0, _0804D580
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804D570
	ldr r0, [r6]
	movs r7, 0x92
	lsls r7, 1
	adds r0, r7
	ldrh r0, [r0]
	bl sub_8075474
	ldr r0, _0804D584
	bl SetMainCallback2
	bl sub_804D8E4
_0804D570:
	movs r0, 0
_0804D572:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804D580: .4byte 0x0202f388
_0804D584: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_804C29C

	thumb_func_start sub_804D588
sub_804D588: @ 804D588
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _0804D5A0
	ldr r2, _0804D5A4
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _0804D5A8
	cmp r0, 0x4
	beq _0804D5B8
	b _0804D614
	.align 2, 0
_0804D5A0: .4byte 0x03001770
_0804D5A4: .4byte 0x0000043c
_0804D5A8:
	movs r0, 0x4
	strb r0, [r1]
	ldr r1, _0804D5B4
	movs r0, 0x1
	b _0804D612
	.align 2, 0
_0804D5B4: .4byte 0x03001bb4
_0804D5B8:
	ldr r0, _0804D5F4
	ldr r1, _0804D5F8
	mov r8, r1
	str r1, [r0]
	ldr r7, _0804D5FC
	ldrb r0, [r7]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _0804D600
	adds r0, r5
	movs r1, 0x1
	movs r2, 0
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _0804D608
	ldrb r3, [r7]
	adds r0, r3, 0
	muls r0, r6
	adds r0, r5
	ldr r1, _0804D604
	ldr r1, [r1]
	adds r1, 0xB9
	ldrb r2, [r1]
	adds r1, r4, 0
	bl sub_81120E4
	b _0804D60E
	.align 2, 0
_0804D5F4: .4byte 0x03005e94
_0804D5F8: .4byte sub_804DC88
_0804D5FC: .4byte 0x020297d8
_0804D600: .4byte 0x03004360
_0804D604: .4byte 0x03004828
_0804D608:
	mov r0, r8
	bl SetMainCallback2
_0804D60E:
	ldr r1, _0804D638
	movs r0, 0xFF
_0804D612:
	strb r0, [r1]
_0804D614:
	bl HasLinkErrorOccurred
	lsls r0, 24
	cmp r0, 0
	bne _0804D622
	bl RunTasks
_0804D622:
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D638: .4byte 0x020297d8
	thumb_func_end sub_804D588

	thumb_func_start sub_804D63C
sub_804D63C: @ 804D63C
	push {r4-r6,lr}
	bl sub_804B2B0
	bl GetBlockRecievedStatus
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0x1
	adds r0, r5, 0
	ands r0, r6
	cmp r0, 0
	beq _0804D67A
	ldr r4, _0804D6A8
	ldrh r1, [r4]
	ldr r0, _0804D6AC
	cmp r1, r0
	bne _0804D664
	ldr r0, _0804D6B0
	bl SetMainCallback2
_0804D664:
	ldrh r1, [r4]
	ldr r0, _0804D6B4
	cmp r1, r0
	bne _0804D674
	ldr r0, _0804D6B8
	ldr r0, [r0]
	adds r0, 0x9C
	strb r6, [r0]
_0804D674:
	movs r0, 0
	bl ResetBlockReceivedFlag
_0804D67A:
	movs r0, 0x2
	ands r0, r5
	cmp r0, 0
	beq _0804D6A2
	ldr r0, _0804D6A8
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _0804D6B4
	cmp r1, r0
	bne _0804D69C
	ldr r0, _0804D6B8
	ldr r0, [r0]
	adds r0, 0x9D
	movs r1, 0x1
	strb r1, [r0]
_0804D69C:
	movs r0, 0x1
	bl ResetBlockReceivedFlag
_0804D6A2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804D6A8: .4byte 0x03002b80
_0804D6AC: .4byte 0x0000dcba
_0804D6B0: .4byte sub_804D588
_0804D6B4: .4byte 0x0000abcd
_0804D6B8: .4byte 0x03004828
	thumb_func_end sub_804D63C

	thumb_func_start sub_804D6BC
sub_804D6BC: @ 804D6BC
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	movs r1, 0xA
	bl __divsi3
	ldrh r4, [r5, 0x22]
	adds r4, r0
	strh r4, [r5, 0x22]
	ldrh r0, [r5, 0x30]
	ldrh r2, [r5, 0x38]
	adds r0, r2
	strh r0, [r5, 0x38]
	movs r1, 0x38
	ldrsh r0, [r5, r1]
	movs r1, 0xA
	bl __divsi3
	strh r0, [r5, 0x20]
	lsls r4, 16
	asrs r4, 16
	cmp r4, 0x4C
	ble _0804D70A
	movs r0, 0x4C
	strh r0, [r5, 0x22]
	movs r2, 0x2E
	ldrsh r1, [r5, r2]
	movs r2, 0x32
	ldrsh r0, [r5, r2]
	muls r0, r1
	negs r0, r0
	movs r1, 0x64
	bl __divsi3
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
_0804D70A:
	movs r1, 0x20
	ldrsh r0, [r5, r1]
	cmp r0, 0x78
	bne _0804D716
	movs r0, 0
	strh r0, [r5, 0x30]
_0804D716:
	ldrh r0, [r5, 0x36]
	ldrh r2, [r5, 0x2E]
	adds r0, r2
	strh r0, [r5, 0x2E]
	movs r1, 0x34
	ldrsh r0, [r5, r1]
	cmp r0, 0x4
	bne _0804D72E
	movs r0, 0x1
	strh r0, [r5, 0x3C]
	ldr r0, _0804D734
	str r0, [r5, 0x1C]
_0804D72E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804D734: .4byte SpriteCallbackDummy
	thumb_func_end sub_804D6BC

	thumb_func_start sub_804D738
sub_804D738: @ 804D738
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r1, _0804D7A0
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0x16
	bne _0804D760
	movs r0, 0x38
	bl audio_play
_0804D760:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2C
	bne _0804D796
	movs r0, 0x8C
	bl audio_play
	ldr r0, _0804D7A4
	str r0, [r4, 0x1C]
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldrb r1, [r4, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	movs r1, 0x1
	negs r1, r1
	ldr r2, _0804D7A8
	str r2, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_0804D796:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804D7A0: .4byte gTradeBallVerticalVelocityTable
_0804D7A4: .4byte sub_804D7AC
_0804D7A8: .4byte 0x0000ffff
	thumb_func_end sub_804D738

	thumb_func_start sub_804D7AC
sub_804D7AC: @ 804D7AC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x14
	bne _0804D7C0
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
_0804D7C0:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _0804D7FE
	ldr r1, _0804D804
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	adds r0, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	ldrh r0, [r4, 0x26]
	subs r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x17
	bne _0804D7FE
	adds r0, r4, 0
	bl DestroySprite
	ldr r0, _0804D808
	ldr r0, [r0]
	adds r0, 0xC4
	movs r1, 0xE
	strh r1, [r0]
_0804D7FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804D804: .4byte gTradeBallVerticalVelocityTable
_0804D808: .4byte 0x03004828
	thumb_func_end sub_804D7AC

	thumb_func_start sub_804D80C
sub_804D80C: @ 804D80C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x32]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0804D83C
	ldrh r0, [r4, 0x22]
	adds r0, 0x4
	strh r0, [r4, 0x22]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x34
	ldrsh r1, [r4, r3]
	cmp r0, r1
	ble _0804D88C
	adds r0, r2, 0x1
	strh r0, [r4, 0x32]
	movs r0, 0x16
	strh r0, [r4, 0x2E]
	movs r0, 0x38
	bl audio_play
	b _0804D88C
_0804D83C:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x42
	bne _0804D84A
	movs r0, 0x39
	bl audio_play
_0804D84A:
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0x5C
	bne _0804D858
	movs r0, 0x3A
	bl audio_play
_0804D858:
	movs r3, 0x2E
	ldrsh r0, [r4, r3]
	cmp r0, 0x6B
	bne _0804D866
	movs r0, 0x3B
	bl audio_play
_0804D866:
	ldr r1, _0804D894
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r3, [r4, 0x26]
	adds r0, r3
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6C
	bne _0804D88C
	ldr r0, _0804D898
	str r0, [r4, 0x1C]
_0804D88C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804D894: .4byte gTradeBallVerticalVelocityTable
_0804D898: .4byte SpriteCallbackDummy
	thumb_func_end sub_804D80C

	thumb_func_start sub_804D89C
sub_804D89C: @ 804D89C
	push {r4-r6,lr}
	ldr r0, _0804D8D0
	ldrh r0, [r0]
	lsls r4, r0, 4
	subs r4, r0
	lsls r4, 2
	ldr r0, _0804D8D4
	adds r4, r0
	ldr r0, _0804D8D8
	ldrh r1, [r4, 0x38]
	movs r6, 0xB
	muls r1, r6
	ldr r5, _0804D8DC
	adds r1, r5
	bl StringCopy
	ldr r0, _0804D8E0
	ldrh r1, [r4, 0xC]
	muls r1, r6
	adds r1, r5
	bl StringCopy
	ldrh r0, [r4, 0x38]
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804D8D0: .4byte 0x0202e8cc
_0804D8D4: .4byte gIngameTrades
_0804D8D8: .4byte 0x020231cc
_0804D8DC: .4byte gSpeciesNames
_0804D8E0: .4byte 0x020232cc
	thumb_func_end sub_804D89C

	thumb_func_start sub_804D8E4
sub_804D8E4: @ 804D8E4
	push {r4,lr}
	sub sp, 0x20
	ldr r0, _0804D92C
	ldrh r0, [r0]
	lsls r4, r0, 4
	subs r4, r0
	lsls r4, 2
	ldr r0, _0804D930
	adds r4, r0
	ldr r0, _0804D934
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0804D938
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl PokemonGetField
	ldr r0, _0804D93C
	mov r1, sp
	bl StringCopy10
	ldr r0, _0804D940
	ldrh r2, [r4, 0xC]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _0804D944
	adds r1, r2
	bl StringCopy
	add sp, 0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804D92C: .4byte 0x0202e8cc
_0804D930: .4byte gIngameTrades
_0804D934: .4byte 0x0202e8ce
_0804D938: .4byte 0x03004360
_0804D93C: .4byte 0x020231cc
_0804D940: .4byte 0x020232cc
_0804D944: .4byte gSpeciesNames
	thumb_func_end sub_804D8E4

	thumb_func_start sub_804D948
sub_804D948: @ 804D948
	push {r4-r7,lr}
	sub sp, 0x38
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, r1, 4
	subs r2, r1
	lsls r2, 2
	ldr r1, _0804DAA4
	adds r5, r2, r1
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0804DAA8
	adds r0, r1
	movs r1, 0x38
	bl PokemonGetField
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	add r4, sp, 0x34
	movs r0, 0xFE
	strb r0, [r4]
	ldr r6, _0804DAAC
	ldrh r1, [r5, 0xC]
	movs r3, 0x1
	str r3, [sp]
	ldr r0, [r5, 0x24]
	str r0, [sp, 0x4]
	str r3, [sp, 0x8]
	ldr r0, [r5, 0x18]
	str r0, [sp, 0xC]
	adds r0, r6, 0
	movs r3, 0x20
	bl create_pokemon_set_level
	adds r2, r5, 0
	adds r2, 0xE
	adds r0, r6, 0
	movs r1, 0x27
	bl pokemon_setattr
	adds r2, r5, 0
	adds r2, 0xF
	adds r0, r6, 0
	movs r1, 0x28
	bl pokemon_setattr
	adds r2, r5, 0
	adds r2, 0x10
	adds r0, r6, 0
	movs r1, 0x29
	bl pokemon_setattr
	adds r2, r5, 0
	adds r2, 0x11
	adds r0, r6, 0
	movs r1, 0x2A
	bl pokemon_setattr
	adds r2, r5, 0
	adds r2, 0x12
	adds r0, r6, 0
	movs r1, 0x2B
	bl pokemon_setattr
	adds r2, r5, 0
	adds r2, 0x13
	adds r0, r6, 0
	movs r1, 0x2C
	bl pokemon_setattr
	adds r0, r6, 0
	movs r1, 0x2
	adds r2, r5, 0
	bl pokemon_setattr
	adds r2, r5, 0
	adds r2, 0x2B
	adds r0, r6, 0
	movs r1, 0x7
	bl pokemon_setattr
	adds r2, r5, 0
	adds r2, 0x36
	adds r0, r6, 0
	movs r1, 0x31
	bl pokemon_setattr
	adds r2, r5, 0
	adds r2, 0x14
	adds r0, r6, 0
	movs r1, 0x2E
	bl pokemon_setattr
	adds r2, r5, 0
	adds r2, 0x1D
	adds r0, r6, 0
	movs r1, 0x17
	bl pokemon_setattr
	adds r2, r5, 0
	adds r2, 0x1E
	adds r0, r6, 0
	movs r1, 0x18
	bl pokemon_setattr
	adds r2, r5, 0
	adds r2, 0x1C
	adds r0, r6, 0
	movs r1, 0x16
	bl pokemon_setattr
	adds r2, r5, 0
	adds r2, 0x1F
	adds r0, r6, 0
	movs r1, 0x21
	bl pokemon_setattr
	adds r2, r5, 0
	adds r2, 0x20
	adds r0, r6, 0
	movs r1, 0x2F
	bl pokemon_setattr
	adds r2, r5, 0
	adds r2, 0x37
	adds r0, r6, 0
	movs r1, 0x30
	bl pokemon_setattr
	adds r0, r6, 0
	movs r1, 0x23
	adds r2, r4, 0
	bl pokemon_setattr
	mov r4, sp
	adds r4, 0x35
	movs r0, 0
	strb r0, [r4]
	ldrh r0, [r5, 0x28]
	cmp r0, 0
	beq _0804DAC0
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _0804DAB4
	add r0, sp, 0x10
	adds r1, r5, 0
	bl sub_804DAD4
	ldr r0, _0804DAB0
	add r1, sp, 0x10
	ldm r1!, {r2,r3,r7}
	stm r0!, {r2,r3,r7}
	ldm r1!, {r2,r3,r7}
	stm r0!, {r2,r3,r7}
	ldm r1!, {r2,r3,r7}
	stm r0!, {r2,r3,r7}
	adds r0, r6, 0
	movs r1, 0x40
	adds r2, r4, 0
	bl pokemon_setattr
	adds r2, r5, 0
	adds r2, 0x28
	adds r0, r6, 0
	movs r1, 0xC
	bl pokemon_setattr
	b _0804DAC0
	.align 2, 0
_0804DAA4: .4byte gIngameTrades
_0804DAA8: .4byte 0x03004360
_0804DAAC: .4byte 0x030045c0
_0804DAB0: .4byte 0x02029700
_0804DAB4:
	adds r2, r5, 0
	adds r2, 0x28
	adds r0, r6, 0
	movs r1, 0xC
	bl pokemon_setattr
_0804DAC0:
	ldr r0, _0804DAD0
	bl pokemon_calc_effective_stats
	add sp, 0x38
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804DAD0: .4byte 0x030045c0
	thumb_func_end sub_804D948

	thumb_func_start sub_804DAD4
sub_804DAD4: @ 804DAD4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r2, _0804DB28
	adds r0, r5, 0
	adds r0, 0x2A
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r2
	adds r1, r4, 0
	movs r3, 0x8
_0804DAEE:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _0804DAEE
	adds r0, r4, 0
	adds r0, 0x12
	adds r1, r5, 0
	adds r1, 0x2B
	bl StringCopy
	ldr r1, [r5, 0x18]
	lsrs r0, r1, 24
	strb r0, [r4, 0x1A]
	lsrs r0, r1, 16
	strb r0, [r4, 0x1B]
	lsrs r0, r1, 8
	strb r0, [r4, 0x1C]
	strb r1, [r4, 0x1D]
	ldrh r0, [r5, 0xC]
	strh r0, [r4, 0x1E]
	ldrh r0, [r5, 0x28]
	strh r0, [r4, 0x20]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804DB28: .4byte gIngameTradeMail
	thumb_func_end sub_804DAD4

	thumb_func_start sub_804DB2C
sub_804DB2C: @ 804DB2C
	push {r4-r6,lr}
	ldr r6, _0804DB58
	ldrh r0, [r6]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _0804DB5C
	adds r0, r4
	movs r1, 0x2D
	bl PokemonGetField
	cmp r0, 0
	bne _0804DB60
	ldrh r0, [r6]
	muls r0, r5
	adds r0, r4
	movs r1, 0xB
	bl PokemonGetField
	lsls r0, 16
	lsrs r0, 16
	b _0804DB62
	.align 2, 0
_0804DB58: .4byte 0x0202e8ce
_0804DB5C: .4byte 0x03004360
_0804DB60:
	movs r0, 0
_0804DB62:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_804DB2C

	thumb_func_start sub_804DB68
sub_804DB68: @ 804DB68
	push {lr}
	ldr r0, _0804DB7C
	ldrb r0, [r0]
	ldr r1, _0804DB80
	ldrb r1, [r1]
	bl sub_804D948
	pop {r0}
	bx r0
	.align 2, 0
_0804DB7C: .4byte 0x0202e8ce
_0804DB80: .4byte 0x0202e8cc
	thumb_func_end sub_804DB68

	thumb_func_start sub_804DB84
sub_804DB84: @ 804DB84
	push {r4-r6,lr}
	bl sub_804C29C
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x1
	bne _0804DBE6
	ldr r5, _0804DC04
	ldr r0, [r5]
	adds r0, 0xB8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0804DC08
	adds r0, r4
	bl DestroySprite
	ldr r0, [r5]
	adds r0, 0xB9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldr r0, _0804DC0C
	ldrb r4, [r0]
	ldrb r0, [r0, 0x1]
	movs r1, 0x6
	bl __umodsi3
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_804BA94
	ldr r0, [r5]
	adds r2, r0, 0
	adds r2, 0x9E
	ldr r1, _0804DC10
	strh r1, [r2]
	adds r0, 0xBD
	strb r6, [r0]
	ldr r0, _0804DC14
	bl SetMainCallback2
_0804DBE6:
	bl sub_804BB78
	bl sub_804D63C
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804DC04: .4byte 0x03004828
_0804DC08: .4byte 0x02020004
_0804DC0C: .4byte 0x020297d8
_0804DC10: .4byte 0x0000abcd
_0804DC14: .4byte sub_804DC18
	thumb_func_end sub_804DB84

	thumb_func_start sub_804DC18
sub_804DC18: @ 804DC18
	push {r4,lr}
	bl sub_804B2B0
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_804D63C
	cmp r4, 0
	bne _0804DC64
	ldr r4, _0804DC7C
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x9C
	ldrh r1, [r0]
	ldr r0, _0804DC80
	cmp r1, r0
	bne _0804DC64
	adds r1, r2, 0
	adds r1, 0x9E
	ldr r0, _0804DC84
	strh r0, [r1]
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	adds r1, 0x9E
	movs r2, 0x14
	bl SendBlock
	ldr r0, [r4]
	adds r0, 0x9C
	movs r1, 0x2
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, 0x9D
	strb r1, [r0]
_0804DC64:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804DC7C: .4byte 0x03004828
_0804DC80: .4byte 0x00000101
_0804DC84: .4byte 0x0000dcba
	thumb_func_end sub_804DC18

	thumb_func_start sub_804DC88
sub_804DC88: @ 804DC88
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r1, _0804DCA8
	ldr r2, _0804DCAC
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x65
	bls _0804DC9C
	b _0804E11A
_0804DC9C:
	lsls r0, 2
	ldr r1, _0804DCB0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804DCA8: .4byte 0x03001770
_0804DCAC: .4byte 0x0000043c
_0804DCB0: .4byte _0804DCB4
	.align 2, 0
_0804DCB4:
	.4byte _0804DE4C
	.4byte _0804DE9C
	.4byte _0804DF14
	.4byte _0804E11A
	.4byte _0804DFE0
	.4byte _0804E078
	.4byte _0804E0A0
	.4byte _0804E0BC
	.4byte _0804E0E4
	.4byte _0804E10C
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E008
	.4byte _0804E034
	.4byte _0804E04C
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804DF54
	.4byte _0804DF7C
	.4byte _0804DF9C
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804DEB4
	.4byte _0804DEF4
_0804DE4C:
	ldr r5, _0804DE88
	ldr r0, _0804DE8C
	str r0, [r5]
	ldr r1, _0804DE90
	adds r2, r1
	ldrb r1, [r2]
	adds r1, 0x1
	strb r1, [r2]
	adds r0, 0x4
	movs r1, 0x13
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x1D
	bl ZeroFillWindowRect
	ldr r4, _0804DE94
	ldr r1, _0804DE98
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r1, [r5]
	adds r0, r1, 0x4
	adds r1, 0x34
	ldrb r2, [r1]
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	b _0804DF3E
	.align 2, 0
_0804DE88: .4byte 0x03004828
_0804DE8C: .4byte 0x0201f000
_0804DE90: .4byte 0x0000043c
_0804DE94: .4byte 0x020234cc
_0804DE98: .4byte gUnknown_0842D1EE
_0804DE9C:
	bl sub_80084A4
	ldr r0, _0804DEAC
	ldr r2, _0804DEB0
	adds r0, r2
	movs r2, 0
	movs r1, 0x64
	b _0804DFEE
	.align 2, 0
_0804DEAC: .4byte 0x03001770
_0804DEB0: .4byte 0x0000043c
_0804DEB4:
	ldr r0, _0804DEE8
	ldr r0, [r0]
	adds r3, r0, 0
	adds r3, 0xC0
	ldr r0, [r3]
	adds r0, 0x1
	str r0, [r3]
	cmp r0, 0xB4
	bls _0804DED2
	ldr r1, _0804DEEC
	adds r0, r2, r1
	movs r2, 0
	movs r1, 0x65
	strb r1, [r0]
	str r2, [r3]
_0804DED2:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _0804DEDE
	b _0804E11A
_0804DEDE:
	ldr r0, _0804DEF0
	ldr r2, _0804DEEC
	adds r0, r2
	b _0804DF06
	.align 2, 0
_0804DEE8: .4byte 0x03004828
_0804DEEC: .4byte 0x0000043c
_0804DEF0: .4byte 0x03001770
_0804DEF4:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _0804DF00
	b _0804E11A
_0804DF00:
	ldr r0, _0804DF0C
	ldr r1, _0804DF10
	adds r0, r1
_0804DF06:
	movs r1, 0x2
	strb r1, [r0]
	b _0804E11A
	.align 2, 0
_0804DF0C: .4byte 0x03001770
_0804DF10: .4byte 0x0000043c
_0804DF14:
	ldr r0, _0804DF48
	adds r1, r2, r0
	movs r0, 0x32
	strb r0, [r1]
	ldr r4, _0804DF4C
	ldr r0, [r4]
	adds r0, 0x4
	movs r1, 0x13
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x1D
	bl ZeroFillWindowRect
	ldr r2, [r4]
	adds r0, r2, 0x4
	ldr r1, _0804DF50
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
_0804DF3E:
	movs r3, 0x2
	bl sub_8003460
	b _0804E11A
	.align 2, 0
_0804DF48: .4byte 0x0000043c
_0804DF4C: .4byte 0x03004828
_0804DF50: .4byte gUnknown_08411905
_0804DF54:
	bl sub_8047A1C
	movs r0, 0x15
	bl sav12_xor_increment
	bl sub_8125D80
	ldr r1, _0804DF74
	ldr r2, _0804DF78
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	b _0804DFF0
	.align 2, 0
_0804DF74: .4byte 0x03001770
_0804DF78: .4byte 0x0000043c
_0804DF7C:
	ldr r0, _0804DF94
	ldr r1, [r0]
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x5
	beq _0804DF8E
	b _0804E11A
_0804DF8E:
	ldr r0, _0804DF98
	adds r1, r2, r0
	b _0804E0FA
	.align 2, 0
_0804DF94: .4byte 0x03004828
_0804DF98: .4byte 0x0000043c
_0804DF9C:
	bl sub_8125DA8
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _0804DFC0
	bl sub_8047A34
	ldr r0, _0804DFB8
	ldr r1, _0804DFBC
	adds r0, r1
	movs r1, 0x4
	strb r1, [r0]
	b _0804E11A
	.align 2, 0
_0804DFB8: .4byte 0x03001770
_0804DFBC: .4byte 0x0000043c
_0804DFC0:
	ldr r0, _0804DFD4
	ldr r0, [r0]
	adds r0, 0xC0
	str r1, [r0]
	ldr r0, _0804DFD8
	ldr r2, _0804DFDC
	adds r0, r2
	movs r1, 0x33
	strb r1, [r0]
	b _0804E11A
	.align 2, 0
_0804DFD4: .4byte 0x03004828
_0804DFD8: .4byte 0x03001770
_0804DFDC: .4byte 0x0000043c
_0804DFE0:
	bl sub_8125DDC
	ldr r0, _0804DFFC
	ldr r1, _0804E000
	adds r0, r1
	movs r2, 0
	movs r1, 0x28
_0804DFEE:
	strb r1, [r0]
_0804DFF0:
	ldr r0, _0804E004
	ldr r0, [r0]
	adds r0, 0xC0
	str r2, [r0]
	b _0804E11A
	.align 2, 0
_0804DFFC: .4byte 0x03001770
_0804E000: .4byte 0x0000043c
_0804E004: .4byte 0x03004828
_0804E008:
	ldr r0, _0804E02C
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x32
	bhi _0804E01C
	b _0804E11A
_0804E01C:
	movs r0, 0
	str r0, [r1]
	ldr r0, _0804E030
	adds r1, r2, r0
	movs r0, 0x29
	strb r0, [r1]
	b _0804E11A
	.align 2, 0
_0804E02C: .4byte 0x03004828
_0804E030: .4byte 0x0000043c
_0804E034:
	bl sub_80084A4
	ldr r0, _0804E044
	ldr r1, _0804E048
	adds r0, r1
	movs r1, 0x2A
	strb r1, [r0]
	b _0804E11A
	.align 2, 0
_0804E044: .4byte 0x03001770
_0804E048: .4byte 0x0000043c
_0804E04C:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _0804E11A
	bl sub_8125E04
	ldr r1, _0804E06C
	movs r0, 0
	strb r0, [r1]
	ldr r0, _0804E070
	ldr r2, _0804E074
	adds r0, r2
	movs r1, 0x5
	strb r1, [r0]
	b _0804E11A
	.align 2, 0
_0804E06C: .4byte 0x03001bb4
_0804E070: .4byte 0x03001770
_0804E074: .4byte 0x0000043c
_0804E078:
	ldr r0, _0804E098
	ldr r1, [r0]
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x3C
	bls _0804E11A
	ldr r0, _0804E09C
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl sub_80084A4
	b _0804E11A
	.align 2, 0
_0804E098: .4byte 0x03004828
_0804E09C: .4byte 0x0000043c
_0804E0A0:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _0804E11A
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _0804E0F4
_0804E0BC:
	ldr r0, _0804E0D8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804E11A
	movs r0, 0x3
	bl play_sound_effect
	ldr r1, _0804E0DC
	ldr r0, _0804E0E0
	adds r1, r0
	b _0804E0FA
	.align 2, 0
_0804E0D8: .4byte 0x0202f388
_0804E0DC: .4byte 0x03001770
_0804E0E0: .4byte 0x0000043c
_0804E0E4:
	bl sub_8075028
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0804E11A
	bl sub_800832C
_0804E0F4:
	ldr r1, _0804E104
	ldr r2, _0804E108
	adds r1, r2
_0804E0FA:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0804E11A
	.align 2, 0
_0804E104: .4byte 0x03001770
_0804E108: .4byte 0x0000043c
_0804E10C:
	ldr r0, _0804E13C
	ldrb r0, [r0]
	cmp r0, 0
	bne _0804E11A
	ldr r0, _0804E140
	bl SetMainCallback2
_0804E11A:
	bl HasLinkErrorOccurred
	lsls r0, 24
	cmp r0, 0
	bne _0804E128
	bl RunTasks
_0804E128:
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E13C: .4byte 0x03002fa4
_0804E140: .4byte sub_804E144
	thumb_func_end sub_804DC88

	thumb_func_start sub_804E144
sub_804E144: @ 804E144
	push {lr}
	ldr r0, _0804E16C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804E158
	ldr r0, _0804E170
	bl SetMainCallback2
_0804E158:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
_0804E16C: .4byte 0x0202f388
_0804E170: .4byte sub_8047CD8
	thumb_func_end sub_804E144

	thumb_func_start sub_804E174
sub_804E174: @ 804E174
	push {lr}
	sub sp, 0x4
	bl script_env_2_enable
	ldr r0, _0804E19C
	movs r1, 0xA
	bl CreateTask
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0804E19C: .4byte sub_804E1A0
	thumb_func_end sub_804E174

	thumb_func_start sub_804E1A0
sub_804E1A0: @ 804E1A0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0804E1CC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804E1C4
	ldr r0, _0804E1D0
	bl SetMainCallback2
	ldr r1, _0804E1D4
	ldr r0, _0804E1D8
	str r0, [r1]
	adds r0, r4, 0
	bl DestroyTask
_0804E1C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804E1CC: .4byte 0x0202f388
_0804E1D0: .4byte sub_804B790
_0804E1D4: .4byte 0x0300485c
_0804E1D8: .4byte sub_8080990
	thumb_func_end sub_804E1A0

	thumb_func_start sub_804E1DC
sub_804E1DC: @ 804E1DC
	push {r4,r5,lr}
	movs r5, 0
	movs r4, 0
_0804E1E2:
	ldr r0, _0804E220
	ldrb r0, [r0, 0x1]
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0804E224
	adds r0, r1
	adds r1, r4, 0
	adds r1, 0x43
	bl PokemonGetField
	adds r0, r5, r0
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xB
	bls _0804E1E2
	cmp r5, 0
	beq _0804E21A
	ldr r0, _0804E228
	bl FlagSet
_0804E21A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E220: .4byte 0x020297d8
_0804E224: .4byte 0x030045c0
_0804E228: .4byte 0x0000083b
	thumb_func_end sub_804E1DC

	thumb_func_start sub_804E22C
sub_804E22C: @ 804E22C
	push {r4,lr}
	ldr r0, _0804E26C
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
	ldr r0, _0804E270
	ldr r4, _0804E274
	movs r2, 0x80
	lsls r2, 4
	adds r1, r4, 0
	bl CpuSet
	ldr r1, _0804E278
	ldr r0, _0804E27C
	str r4, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0804E280
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _0804E284
	movs r1, 0
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r1, _0804E288
	ldr r2, _0804E28C
	adds r0, r2, 0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804E26C: .4byte gUnknown_08D00000
_0804E270: .4byte gUnknown_08D00524
_0804E274: .4byte 0x02000000
_0804E278: .4byte 0x06002800
_0804E27C: .4byte 0x040000d4
_0804E280: .4byte 0x80000280
_0804E284: .4byte gUnknown_08D004E0
_0804E288: .4byte REG_BG1CNT
_0804E28C: .4byte 0x00000502
	thumb_func_end sub_804E22C

	thumb_func_start sub_804E290
sub_804E290: @ 804E290
	push {lr}
	ldr r0, _0804E2B0
	ldr r1, _0804E2B4
	ldr r2, _0804E2B8
	ldr r2, [r2]
	adds r2, 0x56
	movs r3, 0
	ldrsh r2, [r2, r3]
	subs r2, 0x80
	lsls r2, 17
	asrs r2, 16
	bl m4aMPlayPitchControl
	pop {r0}
	bx r0
	.align 2, 0
_0804E2B0: .4byte 0x03007400
_0804E2B4: .4byte 0x0000ffff
_0804E2B8: .4byte 0x03004854
	thumb_func_end sub_804E290

	thumb_func_start sub_804E2BC
sub_804E2BC: @ 804E2BC
	push {lr}
	bl sub_80514A4
	bl sub_80514F0
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_804E2BC

	thumb_func_start sub_804E2D8
sub_804E2D8: @ 804E2D8
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_804E2D8

	thumb_func_start sub_804E2EC
sub_804E2EC: @ 804E2EC
	push {r4-r7,lr}
	ldr r1, _0804E308
	ldr r0, [r1]
	ldrb r0, [r0, 0x1]
	mov r12, r1
	cmp r0, 0x9
	bls _0804E2FC
	b _0804E4F4
_0804E2FC:
	lsls r0, 2
	ldr r1, _0804E30C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804E308: .4byte 0x03004854
_0804E30C: .4byte _0804E310
	.align 2, 0
_0804E310:
	.4byte _0804E338
	.4byte _0804E34C
	.4byte _0804E380
	.4byte _0804E3C4
	.4byte _0804E3D8
	.4byte _0804E3EC
	.4byte _0804E410
	.4byte _0804E434
	.4byte _0804E48C
	.4byte _0804E4BC
_0804E338:
	ldr r0, _0804E344
	ldr r1, _0804E348
	bl sub_800D238
	b _0804E49E
	.align 2, 0
_0804E344: .4byte gUnknown_08E6C100
_0804E348: .4byte 0x02010000
_0804E34C:
	ldr r1, _0804E36C
	ldr r2, _0804E370
	ldr r0, _0804E374
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0804E378
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _0804E37C
	movs r2, 0x80
	lsls r2, 1
	movs r1, 0
	bl LoadPalette
	b _0804E49E
	.align 2, 0
_0804E36C: .4byte gUnknown_08215C2C
_0804E370: .4byte 0x06004000
_0804E374: .4byte 0x040000d4
_0804E378: .4byte 0x80000200
_0804E37C: .4byte gUnknown_08215C0C
_0804E380:
	ldr r3, _0804E3B8
	movs r4, 0xC0
	lsls r4, 19
	movs r5, 0x80
	lsls r5, 6
	ldr r1, _0804E3BC
	ldr r6, _0804E3C0
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_0804E396:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _0804E396
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r0, r12
	b _0804E4A0
	.align 2, 0
_0804E3B8: .4byte 0x02010000
_0804E3BC: .4byte 0x040000d4
_0804E3C0: .4byte 0x80000800
_0804E3C4:
	ldr r0, _0804E3D0
	ldr r1, _0804E3D4
	bl sub_800D238
	b _0804E49E
	.align 2, 0
_0804E3D0: .4byte gUnknown_08E6C920
_0804E3D4: .4byte 0x02010000
_0804E3D8:
	ldr r0, _0804E3E4
	ldr r1, _0804E3E8
	bl sub_800D238
	b _0804E49E
	.align 2, 0
_0804E3E4: .4byte gUnknown_08E6D354
_0804E3E8: .4byte 0x02013000
_0804E3EC:
	ldr r1, _0804E400
	ldr r2, _0804E404
	ldr r0, _0804E408
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0804E40C
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	mov r0, r12
	b _0804E4A0
	.align 2, 0
_0804E400: .4byte 0x02010000
_0804E404: .4byte 0x0600e000
_0804E408: .4byte 0x040000d4
_0804E40C: .4byte 0x80000800
_0804E410:
	ldr r1, _0804E424
	ldr r2, _0804E428
	ldr r0, _0804E42C
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0804E430
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	mov r0, r12
	b _0804E4A0
	.align 2, 0
_0804E424: .4byte 0x02011000
_0804E428: .4byte 0x0600f000
_0804E42C: .4byte 0x040000d4
_0804E430: .4byte 0x80000800
_0804E434:
	ldr r3, _0804E474
	movs r2, 0
	adds r6, r3, 0
	ldr r7, _0804E478
	movs r0, 0x80
	lsls r0, 1
	adds r5, r0, 0
	ldr r4, _0804E47C
_0804E444:
	lsls r0, r2, 1
	adds r0, r3
	ldrh r1, [r0]
	orrs r1, r5
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r4
	bls _0804E444
	ldr r1, _0804E480
	ldr r0, _0804E484
	str r6, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0804E488
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	adds r0, r7, 0
	movs r1, 0x80
	movs r2, 0x20
	bl LoadPalette
	b _0804E49E
	.align 2, 0
_0804E474: .4byte 0x02013000
_0804E478: .4byte gUnknown_0821602C
_0804E47C: .4byte 0x0000027f
_0804E480: .4byte 0x06006000
_0804E484: .4byte 0x040000d4
_0804E488: .4byte 0x80000280
_0804E48C:
	ldr r0, _0804E4AC
	bl LoadSpriteSheet
	ldr r0, _0804E4B0
	bl LoadSpriteSheet
	ldr r0, _0804E4B4
	bl LoadSpriteSheet
_0804E49E:
	ldr r0, _0804E4B8
_0804E4A0:
	ldr r1, [r0]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
	b _0804E4F4
	.align 2, 0
_0804E4AC: .4byte gUnknown_082163DC
_0804E4B0: .4byte gUnknown_082164F4
_0804E4B4: .4byte gUnknown_08216454
_0804E4B8: .4byte 0x03004854
_0804E4BC:
	ldr r0, _0804E4E0
	bl LoadSpriteSheet
	ldr r0, _0804E4E4
	bl LoadSpriteSheet
	ldr r0, _0804E4E8
	bl LoadSpritePalette
	ldr r0, _0804E4EC
	bl LoadSpritePalette
	ldr r0, _0804E4F0
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x1]
	movs r0, 0x1
	b _0804E4F6
	.align 2, 0
_0804E4E0: .4byte gUnknown_08216540
_0804E4E4: .4byte gUnknown_08216574
_0804E4E8: .4byte gUnknown_082163EC
_0804E4EC: .4byte gUnknown_082163E4
_0804E4F0: .4byte 0x03004854
_0804E4F4:
	movs r0, 0
_0804E4F6:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_804E2EC

	thumb_func_start sub_804E4FC
sub_804E4FC: @ 804E4FC
	movs r1, 0x80
	lsls r1, 19
	ldr r2, _0804E52C
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0xC
	movs r2, 0x91
	lsls r2, 7
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	ldr r2, _0804E530
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0804E534
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bx lr
	.align 2, 0
_0804E52C: .4byte 0x00001341
_0804E530: .4byte 0x00000c0d
_0804E534: .4byte REG_BG0HOFS
	thumb_func_end sub_804E4FC

	thumb_func_start sub_804E538
sub_804E538: @ 804E538
	push {lr}
	ldr r1, _0804E55C
	ldr r0, _0804E560
	str r0, [r1]
	adds r2, r0, 0
	adds r2, 0x6F
	movs r1, 0
	strb r1, [r0]
	strb r1, [r2]
	ldr r0, _0804E564
	ldrb r0, [r0]
	bl sub_804E884
	ldr r0, _0804E568
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0804E55C: .4byte 0x03004854
_0804E560: .4byte 0x02018000
_0804E564: .4byte 0x0202e8cc
_0804E568: .4byte sub_804E56C
	thumb_func_end sub_804E538

	thumb_func_start sub_804E56C
sub_804E56C: @ 804E56C
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r0, _0804E588
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x6
	bls _0804E57C
	b _0804E71A
_0804E57C:
	lsls r0, 2
	ldr r1, _0804E58C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804E588: .4byte 0x03004854
_0804E58C: .4byte _0804E590
	.align 2, 0
_0804E590:
	.4byte _0804E5AC
	.4byte _0804E614
	.4byte _0804E67C
	.4byte _0804E692
	.4byte _0804E6A8
	.4byte _0804E6D4
	.4byte _0804E700
_0804E5AC:
	movs r0, 0x80
	lsls r0, 19
	movs r5, 0
	strh r5, [r0]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	movs r0, 0
	bl SetVBlankCallback
	ldr r4, _0804E60C
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindowConfig
	ldr r3, _0804E610
	ldr r2, [r3]
	ldrb r0, [r2]
	adds r0, 0x1
	movs r1, 0
	strb r0, [r2]
	ldr r2, [r3]
	movs r3, 0xA0
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	subs r3, 0x2
	adds r0, r2, r3
	strh r1, [r0]
	movs r0, 0xA1
	lsls r0, 1
	adds r3, r2, r0
	movs r0, 0x50
	strh r0, [r3]
	movs r3, 0xA2
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	adds r3, 0x2
	adds r0, r2, r3
	strh r1, [r0]
	strb r5, [r2, 0x1]
	bl sub_8051474
	b _0804E71A
	.align 2, 0
_0804E60C: .4byte gWindowConfig_81E6F68
_0804E610: .4byte 0x03004854
_0804E614:
	bl sub_804E2EC
	lsls r0, 24
	cmp r0, 0
	bne _0804E620
	b _0804E71A
_0804E620:
	movs r4, 0
	ldr r5, _0804E668
	ldr r6, _0804E66C
_0804E626:
	ldrb r1, [r5]
	ldrb r2, [r5, 0x1]
	ldr r0, _0804E670
	movs r3, 0x1
	bl CreateSprite
	ldr r1, [r6]
	adds r1, 0x5C
	adds r1, r4
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0x5C
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0804E674
	adds r0, r1
	adds r1, r4, 0
	adds r1, 0x8
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAnim
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _0804E626
	ldr r0, _0804E678
	bl SetVBlankCallback
	b _0804E6BE
	.align 2, 0
_0804E668: .4byte gUnknown_082162E4
_0804E66C: .4byte 0x03004854
_0804E670: .4byte gSpriteTemplate_82163F4
_0804E674: .4byte 0x02020004
_0804E678: .4byte sub_804E2BC
_0804E67C:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	bl sub_8051474
	b _0804E6BE
_0804E692:
	bl sub_804E4FC
	ldr r0, _0804E6A4
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804E71A
	b _0804E6BE
	.align 2, 0
_0804E6A4: .4byte 0x0202f388
_0804E6A8:
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _0804E6CC
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrintMessage
_0804E6BE:
	ldr r0, _0804E6D0
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0804E71A
	.align 2, 0
_0804E6CC: .4byte gUnknown_0842D307
_0804E6D0: .4byte 0x03004854
_0804E6D4:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _0804E71A
	ldr r0, _0804E6FC
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	movs r0, 0x1
	negs r0, r0
	str r2, [sp]
	movs r1, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _0804E71A
	.align 2, 0
_0804E6FC: .4byte 0x03004854
_0804E700:
	ldr r0, _0804E730
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0804E71A
	bl sub_80A6978
	ldr r0, _0804E734
	ldr r0, [r0]
	strb r4, [r0]
_0804E71A:
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804E730: .4byte 0x0202f388
_0804E734: .4byte 0x03004854
	thumb_func_end sub_804E56C

	thumb_func_start sub_804E738
sub_804E738: @ 804E738
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x30]
	adds r0, r1
	strh r0, [r4, 0x30]
	ldrh r1, [r4, 0x32]
	ldrh r2, [r4, 0x36]
	subs r1, r2
	ldrh r0, [r4, 0x3C]
	adds r1, r0
	strh r1, [r4, 0x32]
	ldrh r3, [r4, 0x2E]
	adds r0, r3
	strh r0, [r4, 0x2E]
	subs r2, 0x1
	strh r2, [r4, 0x36]
	lsls r0, 16
	lsls r1, 16
	cmp r0, r1
	bge _0804E786
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x36]
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _0804E780
	adds r0, r4, 0
	bl DestroySprite
	b _0804E786
_0804E780:
	movs r0, 0x74
	bl audio_play
_0804E786:
	ldrh r0, [r4, 0x30]
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x32]
	strh r0, [r4, 0x22]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_804E738

	thumb_func_start sub_804E794
sub_804E794: @ 804E794
	push {r4-r6,lr}
	ldr r5, [sp, 0x10]
	ldr r6, [sp, 0x14]
	lsls r2, 16
	lsrs r2, 16
	movs r4, 0
	strh r2, [r0, 0x2E]
	strh r1, [r0, 0x30]
	strh r2, [r0, 0x32]
	strh r3, [r0, 0x34]
	movs r1, 0xA
	strh r1, [r0, 0x36]
	strh r4, [r0, 0x38]
	strh r5, [r0, 0x3A]
	strh r6, [r0, 0x3C]
	ldr r1, _0804E7BC
	str r1, [r0, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804E7BC: .4byte sub_804E738
	thumb_func_end sub_804E794

	thumb_func_start sub_804E7C0
sub_804E7C0: @ 804E7C0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	adds r6, r1, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r0, 24
	movs r1, 0xF6
	lsls r1, 23
	adds r0, r1
	lsrs r0, 24
	movs r3, 0x1
	ands r3, r6
	movs r1, 0
	movs r2, 0x50
	bl sub_80A7DEC
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	mov r8, r2
	add r8, r0
	mov r3, r8
	lsls r3, 2
	mov r8, r3
	ldr r0, _0804E83C
	add r8, r0
	ldr r5, _0804E840
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 1
	adds r0, r4, r5
	movs r6, 0
	ldrsh r1, [r0, r6]
	adds r0, r5, 0x2
	adds r0, r4, r0
	movs r3, 0
	ldrsh r2, [r0, r3]
	adds r0, r5, 0x4
	adds r0, r4, r0
	movs r6, 0
	ldrsh r3, [r0, r6]
	adds r0, r5, 0x6
	adds r0, r4, r0
	movs r6, 0
	ldrsh r0, [r0, r6]
	str r0, [sp]
	adds r5, 0x8
	adds r4, r5
	movs r5, 0
	ldrsh r0, [r4, r5]
	str r0, [sp, 0x4]
	mov r0, r8
	bl sub_804E794
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804E83C: .4byte 0x02020004
_0804E840: .4byte gUnknown_08216594
	thumb_func_end sub_804E7C0

	thumb_func_start sub_804E844
sub_804E844: @ 804E844
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r5, r1, 16
	lsrs r5, 16
	adds r0, r5, 0
	adds r0, 0x7C
	lsls r0, 24
	lsrs r0, 24
	bl GetBerryInfo
	adds r4, r0, 0
	strh r5, [r6]
	adds r0, r6, 0x2
	adds r1, r4, 0
	bl StringCopy
	ldrb r0, [r4, 0x15]
	strb r0, [r6, 0x9]
	ldrb r0, [r4, 0x16]
	strb r0, [r6, 0xA]
	ldrb r0, [r4, 0x17]
	strb r0, [r6, 0xB]
	ldrb r0, [r4, 0x18]
	strb r0, [r6, 0xC]
	ldrb r0, [r4, 0x19]
	strb r0, [r6, 0xD]
	ldrb r0, [r4, 0x1A]
	strb r0, [r6, 0xE]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_804E844

	thumb_func_start sub_804E884
sub_804E884: @ 804E884
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _0804E89E
	ldr r2, _0804E8AC
	movs r3, 0x2
	adds r0, r2, 0
	adds r0, 0x54
_0804E896:
	strh r3, [r0, 0x1A]
	subs r0, 0x1C
	cmp r0, r2
	bge _0804E896
_0804E89E:
	cmp r1, 0x1
	beq _0804E8C4
	cmp r1, 0x1
	bgt _0804E8B0
	cmp r1, 0
	beq _0804E8BA
	b _0804E974
	.align 2, 0
_0804E8AC: .4byte 0x03002970
_0804E8B0:
	cmp r1, 0x2
	beq _0804E8F8
	cmp r1, 0x3
	beq _0804E93C
	b _0804E974
_0804E8BA:
	ldr r0, _0804E8C0
	strb r1, [r0]
	b _0804E974
	.align 2, 0
_0804E8C0: .4byte 0x03004834
_0804E8C4:
	ldr r0, _0804E8E4
	strb r1, [r0]
	ldr r0, _0804E8E8
	ldr r0, [r0]
	adds r0, 0x88
	movs r1, 0x2
	strb r1, [r0]
	ldr r4, _0804E8EC
	ldr r1, _0804E8F0
	adds r0, r4, 0
	bl StringCopy
	adds r4, 0x1C
	ldr r0, _0804E8F4
	ldr r1, [r0]
	b _0804E920
	.align 2, 0
_0804E8E4: .4byte 0x03004834
_0804E8E8: .4byte 0x03004854
_0804E8EC: .4byte 0x03002978
_0804E8F0: .4byte gSaveBlock2
_0804E8F4: .4byte gUnknown_082162B8
_0804E8F8:
	ldr r0, _0804E928
	strb r1, [r0]
	ldr r0, _0804E92C
	ldr r0, [r0]
	adds r0, 0x88
	movs r1, 0x3
	strb r1, [r0]
	ldr r4, _0804E930
	ldr r1, _0804E934
	adds r0, r4, 0
	bl StringCopy
	adds r0, r4, 0
	adds r0, 0x1C
	ldr r5, _0804E938
	ldr r1, [r5]
	bl StringCopy
	adds r4, 0x38
	ldr r1, [r5, 0x4]
_0804E920:
	adds r0, r4, 0
	bl StringCopy
	b _0804E974
	.align 2, 0
_0804E928: .4byte 0x03004834
_0804E92C: .4byte 0x03004854
_0804E930: .4byte 0x03002978
_0804E934: .4byte gSaveBlock2
_0804E938: .4byte gUnknown_082162B8
_0804E93C:
	ldr r0, _0804E97C
	strb r1, [r0]
	ldr r0, _0804E980
	ldr r0, [r0]
	adds r0, 0x88
	movs r1, 0x4
	strb r1, [r0]
	ldr r4, _0804E984
	ldr r1, _0804E988
	adds r0, r4, 0
	bl StringCopy
	adds r0, r4, 0
	adds r0, 0x1C
	ldr r5, _0804E98C
	ldr r1, [r5]
	bl StringCopy
	adds r0, r4, 0
	adds r0, 0x38
	ldr r1, [r5, 0x4]
	bl StringCopy
	adds r4, 0x54
	ldr r1, [r5, 0x8]
	adds r0, r4, 0
	bl StringCopy
_0804E974:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E97C: .4byte 0x03004834
_0804E980: .4byte 0x03004854
_0804E984: .4byte 0x03002978
_0804E988: .4byte gSaveBlock2
_0804E98C: .4byte gUnknown_082162B8
	thumb_func_end sub_804E884

	thumb_func_start sub_804E990
sub_804E990: @ 804E990
	push {r4,r5,lr}
	movs r0, 0x80
	lsls r0, 19
	movs r2, 0
	strh r2, [r0]
	ldr r3, _0804E9D8
	ldr r0, _0804E9DC
	str r0, [r3]
	movs r1, 0
	strb r2, [r0]
	movs r2, 0x9A
	lsls r2, 1
	adds r0, r2
	str r1, [r0]
	movs r2, 0
	ldr r5, _0804E9E0
	adds r4, r3, 0
	movs r3, 0
_0804E9B4:
	ldr r0, [r4]
	lsls r1, r2, 1
	adds r0, 0x80
	adds r0, r1
	strh r3, [r0]
	adds r2, 0x1
	cmp r2, 0x3
	ble _0804E9B4
	ldrb r0, [r5]
	bl sub_804E884
	ldrh r0, [r5]
	cmp r0, 0
	bne _0804E9E8
	ldr r0, _0804E9E4
	bl SetMainCallback2
	b _0804E9EE
	.align 2, 0
_0804E9D8: .4byte 0x03004854
_0804E9DC: .4byte 0x02018000
_0804E9E0: .4byte 0x0202e8cc
_0804E9E4: .4byte sub_804E9F8
_0804E9E8:
	ldr r0, _0804E9F4
	bl SetMainCallback2
_0804E9EE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E9F4: .4byte sub_804F378
	thumb_func_end sub_804E990

	thumb_func_start sub_804E9F8
sub_804E9F8: @ 804E9F8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r1, _0804EA18
	ldr r0, [r1]
	ldrb r0, [r0]
	mov r8, r1
	cmp r0, 0x66
	bls _0804EA0E
	b _0804F0CE
_0804EA0E:
	lsls r0, 2
	ldr r1, _0804EA1C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804EA18: .4byte 0x03004854
_0804EA1C: .4byte _0804EA20
	.align 2, 0
_0804EA20:
	.4byte _0804EBBC
	.4byte _0804EC74
	.4byte _0804EC94
	.4byte _0804ECE8
	.4byte _0804ECFA
	.4byte _0804ED14
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804ED48
	.4byte _0804ED94
	.4byte _0804EDB8
	.4byte _0804EE46
	.4byte _0804EEA0
	.4byte _0804EF16
	.4byte _0804EF34
	.4byte _0804EFD8
	.4byte _0804F00C
	.4byte _0804F0CE
	.4byte _0804F020
	.4byte _0804F024
	.4byte _0804F02A
	.4byte _0804F03A
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F084
	.4byte _0804F0A0
	.4byte _0804F0BC
_0804EBBC:
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r0, _0804EC60
	bl SetVBlankCallback
	ldr r4, _0804EC64
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindowConfig
	ldr r1, _0804EC68
	ldr r2, _0804EC6C
	adds r0, r2, 0
	strh r0, [r1]
	ldr r3, _0804EC70
	ldr r1, [r3]
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	ldr r0, [r3]
	adds r4, r0, 0
	adds r4, 0x4E
	movs r1, 0
	strh r2, [r4]
	adds r0, 0x7E
	strb r1, [r0]
	ldr r1, [r3]
	movs r4, 0xA2
	lsls r4, 1
	adds r0, r1, r4
	strh r2, [r0]
	adds r4, 0x2
	adds r0, r1, r4
	strh r2, [r0]
	movs r5, 0
	movs r6, 0
	mov r8, r3
	movs r7, 0xA6
	lsls r7, 1
_0804EC18:
	ldr r0, [r3]
	lsls r1, r5, 1
	adds r0, 0x70
	adds r0, r1
	strh r6, [r0]
	adds r4, r5, 0x1
	adds r1, r5
	lsls r1, 1
	movs r2, 0x2
_0804EC2A:
	ldr r0, [r3]
	adds r0, r7
	adds r0, r1
	strh r6, [r0]
	adds r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bge _0804EC2A
	adds r5, r4, 0
	cmp r5, 0x3
	ble _0804EC18
	mov r0, r8
	ldr r3, [r0]
	adds r0, r3, 0
	adds r0, 0x7C
	movs r2, 0
	movs r1, 0
	strh r1, [r0]
	subs r0, 0x26
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x6
	strh r1, [r0]
	strb r2, [r3, 0x1]
	b _0804F0CE
	.align 2, 0
_0804EC60: .4byte sub_804E2BC
_0804EC64: .4byte gWindowConfig_81E6F68
_0804EC68: .4byte 0x03002b74
_0804EC6C: .4byte 0x00004422
_0804EC70: .4byte 0x03004854
_0804EC74:
	bl sub_804E2EC
	lsls r0, 24
	cmp r0, 0
	bne _0804EC80
	b _0804F0CE
_0804EC80:
	ldr r0, _0804EC90
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl sub_8051474
	b _0804F0CE
	.align 2, 0
_0804EC90: .4byte 0x03004854
_0804EC94:
	movs r5, 0
	ldr r4, _0804ECD8
	ldr r6, _0804ECDC
_0804EC9A:
	ldrb r1, [r4]
	ldrb r2, [r4, 0x1]
	ldr r0, _0804ECE0
	movs r3, 0x1
	bl CreateSprite
	ldr r1, [r6]
	adds r1, 0x60
	adds r1, r5
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0x60
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0804ECE4
	adds r0, r1
	adds r1, r5, 0
	adds r1, 0x8
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAnim
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _0804EC9A
	b _0804F0AA
	.align 2, 0
_0804ECD8: .4byte gUnknown_082162E4
_0804ECDC: .4byte 0x03004854
_0804ECE0: .4byte gSpriteTemplate_82163F4
_0804ECE4: .4byte 0x02020004
_0804ECE8:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _0804F0AA
_0804ECFA:
	bl sub_804E4FC
	ldr r0, _0804ED10
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804ED0C
	b _0804F0CE
_0804ED0C:
	b _0804F0AA
	.align 2, 0
_0804ED10: .4byte 0x0202f388
_0804ED14:
	movs r0, 0
	movs r1, 0xD
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _0804ED40
	movs r1, 0x1
	movs r2, 0xE
	bl MenuPrint
	ldr r2, _0804ED44
	ldr r1, [r2]
	movs r3, 0
	movs r0, 0x8
	strb r0, [r1]
	ldr r0, [r2]
	movs r1, 0x98
	lsls r1, 1
	adds r0, r1
	str r3, [r0]
	b _0804F0CE
	.align 2, 0
_0804ED40: .4byte gUnknown_0842D3A5
_0804ED44: .4byte 0x03004854
_0804ED48:
	mov r2, r8
	ldr r1, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	movs r5, 0
	strb r0, [r1]
	ldr r0, [r2]
	movs r3, 0x9E
	lsls r3, 1
	adds r0, r3
	strb r5, [r0]
	ldr r0, [r2]
	movs r4, 0xBE
	lsls r4, 1
	adds r0, r4
	ldr r1, _0804ED8C
	ldrh r1, [r1]
	bl sub_804E844
	ldr r0, _0804ED90
	mov r2, r8
	ldr r1, [r2]
	adds r1, r4
	movs r2, 0x10
	bl memcpy
	bl sub_80084A4
	mov r3, r8
	ldr r0, [r3]
	subs r4, 0x4C
	adds r0, r4
	str r5, [r0]
	b _0804F0CE
	.align 2, 0
_0804ED8C: .4byte 0x0203855e
_0804ED90: .4byte 0x03002a70
_0804ED94:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _0804EDA0
	b _0804F0CE
_0804EDA0:
	bl ResetBlockReceivedFlags
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	beq _0804EDB0
	b _0804F0AA
_0804EDB0:
	movs r0, 0x4
	bl sub_8007E9C
	b _0804F0AA
_0804EDB8:
	mov r0, r8
	ldr r1, [r0]
	movs r2, 0x98
	lsls r2, 1
	adds r1, r2
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x14
	bgt _0804EDCE
	b _0804F0CE
_0804EDCE:
	bl MenuZeroFillScreen
	bl GetBlockRecievedStatus
	adds r4, r0, 0
	bl sub_8008198
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _0804EDE6
	b _0804F0CE
_0804EDE6:
	movs r5, 0
	mov r7, r8
	movs r6, 0xBE
	lsls r6, 1
	b _0804EE18
_0804EDF0:
	ldr r0, [r7]
	lsls r4, r5, 4
	adds r0, r4, r0
	adds r0, r6
	lsls r1, r5, 8
	ldr r2, _0804EE2C
	adds r1, r2
	movs r2, 0x10
	bl memcpy
	ldr r0, [r7]
	lsls r2, r5, 1
	adds r1, r0, 0
	adds r1, 0x80
	adds r1, r2
	adds r0, r4
	adds r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	adds r5, 0x1
_0804EE18:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	blt _0804EDF0
	bl ResetBlockReceivedFlags
	b _0804F0AA
	.align 2, 0
_0804EE2C: .4byte 0x03002b80
_0804EE30:
	ldrb r1, [r4]
	lsls r1, 1
	adds r0, r2, 0
	adds r0, 0x80
	adds r0, r1
	ldrh r0, [r0]
	lsls r1, r5, 24
	lsrs r1, 24
	bl sub_804E7C0
	b _0804EE7A
_0804EE46:
	bl GetLinkPlayerCount
	ldr r2, _0804EE98
	ldr r1, [r2]
	adds r1, 0x88
	strb r0, [r1]
	movs r5, 0
	ldr r2, [r2]
	movs r3, 0x9E
	lsls r3, 1
	adds r4, r2, r3
	ldr r1, _0804EE9C
	adds r0, r2, 0
	adds r0, 0x88
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 2
	ldrb r3, [r4]
	adds r0, r1
_0804EE6C:
	ldrb r1, [r0]
	cmp r3, r1
	beq _0804EE30
	adds r0, 0x1
	adds r5, 0x1
	cmp r5, 0x3
	ble _0804EE6C
_0804EE7A:
	ldr r3, _0804EE98
	ldr r1, [r3]
	movs r4, 0x98
	lsls r4, 1
	adds r2, r1, r4
	movs r0, 0
	str r0, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, [r3]
	movs r0, 0x9E
	lsls r0, 1
	adds r1, r0
	b _0804F0AE
	.align 2, 0
_0804EE98: .4byte 0x03004854
_0804EE9C: .4byte gUnknown_082162EC
_0804EEA0:
	mov r1, r8
	ldr r2, [r1]
	movs r3, 0x98
	lsls r3, 1
	adds r1, r2, r3
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x3C
	bgt _0804EEB6
	b _0804F0CE
_0804EEB6:
	movs r4, 0x9E
	lsls r4, 1
	adds r0, r2, r4
	adds r1, r2, 0
	adds r1, 0x88
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _0804EF00
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	mov r0, r8
	ldr r2, [r0]
	ldr r3, _0804EEF4
	ldr r1, _0804EEF8
	adds r0, r2, 0
	adds r0, 0x88
	ldrb r0, [r0]
	subs r0, 0x2
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r3
	ldr r3, _0804EEFC
	adds r1, r3, 0
	ldrh r0, [r0]
	adds r1, r0
	adds r2, 0x54
	strh r1, [r2]
	b _0804EF06
	.align 2, 0
_0804EEF4: .4byte gUnknown_082162F8
_0804EEF8: .4byte gUnknown_08216300
_0804EEFC: .4byte 0xffffa800
_0804EF00:
	ldrb r0, [r2]
	subs r0, 0x1
	strb r0, [r2]
_0804EF06:
	mov r4, r8
	ldr r0, [r4]
	movs r1, 0x98
	lsls r1, 1
	adds r0, r1
	movs r1, 0
	str r1, [r0]
	b _0804F0CE
_0804EF16:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _0804EF22
	b _0804F0CE
_0804EF22:
	ldr r2, _0804EF30
	ldr r1, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	b _0804EFBC
	.align 2, 0
_0804EF30: .4byte 0x03004854
_0804EF34:
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 3
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	mov r4, r8
	ldr r2, [r4]
	adds r1, r2, 0
	adds r1, 0x54
	movs r3, 0x80
	lsls r3, 2
	adds r0, r3, 0
	ldrh r4, [r1]
	adds r0, r4
	strh r0, [r1]
	movs r0, 0xA1
	lsls r0, 1
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x4
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xFF
	bls _0804EFB8
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	mov r1, r8
	ldr r3, [r1]
	movs r2, 0xA1
	lsls r2, 1
	adds r1, r3, r2
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r1]
	ldr r2, _0804EFC8
	ldr r1, _0804EFCC
	adds r0, r3, 0
	adds r0, 0x88
	ldrb r0, [r0]
	subs r0, 0x2
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	adds r0, r3, 0
	adds r0, 0x54
	strh r1, [r0]
	ldr r1, _0804EFD0
	ldr r4, _0804EFD4
	adds r0, r4, 0
	strh r0, [r1]
	movs r0, 0x98
	lsls r0, 1
	adds r1, r3, r0
	movs r0, 0
	str r0, [r1]
	bl sub_804F238
	bl BuyMenuDrawFieldObjects
_0804EFB8:
	mov r1, r8
	ldr r0, [r1]
_0804EFBC:
	movs r2, 0xB4
	lsls r2, 1
	adds r0, r2
	bl sub_8051414
	b _0804F0CE
	.align 2, 0
_0804EFC8: .4byte gUnknown_082162F8
_0804EFCC: .4byte gUnknown_08216300
_0804EFD0: .4byte REG_BG2CNT
_0804EFD4: .4byte 0x00004882
_0804EFD8:
	bl sub_8051B8C
	lsls r0, 24
	cmp r0, 0
	beq _0804EFF6
	ldr r0, _0804F008
	ldr r1, [r0]
	movs r3, 0x98
	lsls r3, 1
	adds r2, r1, r3
	movs r0, 0
	str r0, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0804EFF6:
	ldr r0, _0804F008
	ldr r0, [r0]
	movs r4, 0xB4
	lsls r4, 1
	adds r0, r4
	bl sub_8051414
	b _0804F0CE
	.align 2, 0
_0804F008: .4byte 0x03004854
_0804F00C:
	ldr r0, _0804F01C
	movs r2, 0x10
	negs r2, r2
	movs r1, 0x78
	movs r3, 0x3
	bl CreateSprite
	b _0804F0AA
	.align 2, 0
_0804F01C: .4byte gSpriteTemplate_8216548
_0804F020:
	mov r0, r8
	b _0804F0AC
_0804F024:
	bl sub_80084A4
	b _0804F0AA
_0804F02A:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _0804F0CE
	bl sub_8007E24
	b _0804F0AA
_0804F03A:
	mov r1, r8
	ldr r3, [r1]
	adds r2, r3, 0
	adds r2, 0x56
	movs r1, 0
	movs r0, 0x80
	strh r0, [r2]
	movs r2, 0x96
	lsls r2, 1
	adds r0, r3, r2
	str r1, [r0]
	ldr r0, _0804F07C
	bl SetMainCallback2
	bl current_map_music_get
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0804F080
	cmp r0, r4
	beq _0804F074
	bl current_map_music_get
	mov r3, r8
	ldr r1, [r3]
	movs r2, 0xBC
	lsls r2, 1
	adds r1, r2
	strh r0, [r1]
_0804F074:
	adds r0, r4, 0
	bl sub_8075474
	b _0804F0CE
	.align 2, 0
_0804F07C: .4byte sub_80501FC
_0804F080: .4byte 0x00000193
_0804F084:
	movs r0, 0
	movs r1, 0xD
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _0804F09C
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrintMessage
	b _0804F0AA
	.align 2, 0
_0804F09C: .4byte gUnknown_0842D2D9
_0804F0A0:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _0804F0CE
_0804F0AA:
	ldr r0, _0804F0B8
_0804F0AC:
	ldr r1, [r0]
_0804F0AE:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0804F0CE
	.align 2, 0
_0804F0B8: .4byte 0x03004854
_0804F0BC:
	ldr r0, _0804F0EC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804F0CE
	ldr r0, _0804F0F0
	bl SetMainCallback2
_0804F0CE:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F0EC: .4byte 0x0202f388
_0804F0F0: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_804E9F8

	thumb_func_start sub_804F0F4
sub_804F0F4: @ 804F0F4
	push {r4,lr}
	movs r1, 0x80
	lsls r1, 19
	movs r0, 0
	strh r0, [r1]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r0, _0804F158
	bl SetVBlankCallback
	ldr r4, _0804F15C
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindowConfig
	ldr r1, _0804F160
	ldr r2, _0804F164
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0804F168
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x4E
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x8
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x6
	strh r1, [r0]
	movs r3, 0xA2
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	adds r3, 0x2
	adds r0, r2, r3
	strh r1, [r0]
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804F158: .4byte sub_804E2BC
_0804F15C: .4byte gWindowConfig_81E6F68
_0804F160: .4byte 0x03002b74
_0804F164: .4byte 0x00004422
_0804F168: .4byte 0x03004854
	thumb_func_end sub_804F0F4

	thumb_func_start task_tutorial_oak_boy_girl
task_tutorial_oak_boy_girl: @ 804F16C
	push {lr}
	lsls r0, 16
	lsls r1, 24
	lsrs r0, 24
	adds r2, r0, 0
	adds r2, 0x18
	ldr r0, _0804F1A8
	ldr r0, [r0]
	lsrs r1, 23
	adds r0, 0xA2
	adds r0, r1
	ldrb r0, [r0]
	ldr r1, _0804F1AC
	adds r0, r1
	ldrb r1, [r0]
	cmp r2, r1
	bcc _0804F1B4
	adds r0, r1, 0
	adds r0, 0x30
	cmp r2, r0
	bcs _0804F1B4
	subs r0, 0x1C
	cmp r2, r0
	bcc _0804F1B0
	adds r0, 0x8
	cmp r2, r0
	bcs _0804F1B0
	movs r0, 0x2
	b _0804F1B6
	.align 2, 0
_0804F1A8: .4byte 0x03004854
_0804F1AC: .4byte gUnknown_08216303
_0804F1B0:
	movs r0, 0x1
	b _0804F1B6
_0804F1B4:
	movs r0, 0
_0804F1B6:
	pop {r1}
	bx r1
	thumb_func_end task_tutorial_oak_boy_girl

	thumb_func_start sub_804F1BC
sub_804F1BC: @ 804F1BC
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r1, 24
	movs r4, 0
	cmp r0, 0xAF
	bne _0804F1EE
	movs r3, 0
	subs r5, r1, 0x1
	adds r2, 0x9
_0804F1D2:
	adds r0, r2, r4
	adds r1, r2, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _0804F1E0
	adds r4, r3, 0
_0804F1E0:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x4
	bls _0804F1D2
	adds r0, r4, 0x5
	b _0804F204
_0804F1EE:
	subs r0, 0x85
	lsls r0, 16
	lsrs r4, r0, 16
	subs r5, r1, 0x1
	cmp r4, 0x4
	bls _0804F208
	adds r0, r4, 0
	movs r1, 0x5
	bl __umodsi3
	adds r0, 0x5
_0804F204:
	lsls r0, 16
	lsrs r4, r0, 16
_0804F208:
	movs r3, 0
	cmp r3, r5
	bge _0804F22E
	ldr r7, _0804F234
	lsls r0, r4, 1
	adds r6, r0, r4
_0804F214:
	adds r4, r3, 0x1
	lsls r0, r4, 24
	lsrs r0, 24
	adds r1, r3, r6
	adds r1, r7
	ldrb r1, [r1]
	adds r1, 0x85
	bl sub_80516C4
	lsls r4, 16
	lsrs r3, r4, 16
	cmp r3, r5
	blt _0804F214
_0804F22E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F234: .4byte gUnknown_082165BC
	thumb_func_end sub_804F1BC

	thumb_func_start sub_804F238
sub_804F238: @ 804F238
	push {r4-r7,lr}
	movs r4, 0
	ldr r7, _0804F2A0
	movs r6, 0xFF
	ldr r5, _0804F2A4
_0804F242:
	ldr r3, [r7]
	lsls r2, r4, 1
	adds r0, r3, 0
	adds r0, 0xA2
	adds r0, r2
	strh r6, [r0]
	adds r1, r3, 0
	adds r1, 0x9A
	adds r1, r2
	adds r0, r3, 0
	adds r0, 0x88
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 2
	adds r0, r4, r0
	adds r0, r5
	ldrb r0, [r0]
	strh r0, [r1]
	adds r4, 0x1
	cmp r4, 0x3
	ble _0804F242
	movs r3, 0
	ldr r7, _0804F2A0
_0804F270:
	movs r4, 0
	adds r6, r3, 0x1
	lsls r5, r3, 1
_0804F276:
	ldr r2, [r7]
	lsls r0, r4, 1
	adds r1, r2, 0
	adds r1, 0x9A
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, r3
	bne _0804F28E
	adds r0, r2, 0
	adds r0, 0xA2
	adds r0, r5
	strh r4, [r0]
_0804F28E:
	adds r4, 0x1
	cmp r4, 0x3
	ble _0804F276
	adds r3, r6, 0
	cmp r3, 0x3
	ble _0804F270
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F2A0: .4byte 0x03004854
_0804F2A4: .4byte gUnknown_082162EC
	thumb_func_end sub_804F238

	thumb_func_start BuyMenuDrawFieldObjects
BuyMenuDrawFieldObjects: @ 804F2A8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0
	ldr r7, _0804F360
	ldr r0, _0804F364
	mov r8, r0
_0804F2B6:
	ldr r2, [r7]
	lsls r4, r6, 1
	adds r0, r2, 0
	adds r0, 0x9A
	adds r3, r0, r4
	ldrh r0, [r3]
	cmp r0, 0xFF
	beq _0804F34A
	ldr r5, _0804F368
	adds r1, r2, 0
	adds r1, 0x5C
	ldrh r3, [r3]
	adds r1, r3
	adds r0, r2, 0
	adds r0, 0x60
	adds r0, r6
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, [r7]
	adds r1, r0, 0
	adds r1, 0x9A
	adds r1, r4
	adds r0, 0x5C
	ldrh r1, [r1]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0804F36C
	adds r0, r1
	lsls r1, r6, 24
	lsrs r1, 24
	bl StartSpriteAnim
	bl GetMultiplayerId
	lsls r0, 24
	ldr r1, [r7]
	adds r1, 0x9A
	adds r1, r4
	lsrs r0, 24
	ldrh r1, [r1]
	cmp r0, r1
	bne _0804F31A
	adds r0, r5, 0
	ldr r1, _0804F370
	bl StringCopy
	adds r5, r0, 0
_0804F31A:
	ldr r0, [r7]
	adds r0, 0x9A
	adds r0, r4
	ldrh r0, [r0]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	ldr r0, _0804F374
	adds r1, r0
	adds r0, r5, 0
	bl StringCopy
	mov r0, r8
	ldrb r1, [r0]
	lsls r1, 3
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0x1]
	lsls r2, 3
	ldr r0, _0804F368
	movs r3, 0x1
	bl sub_80729D8
_0804F34A:
	movs r0, 0x2
	add r8, r0
	adds r6, 0x1
	cmp r6, 0x3
	ble _0804F2B6
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F360: .4byte 0x03004854
_0804F364: .4byte gUnknown_082162D4
_0804F368: .4byte 0x020231cc
_0804F36C: .4byte 0x02020004
_0804F370: .4byte gUnknown_082162C4
_0804F374: .4byte 0x03002978
	thumb_func_end BuyMenuDrawFieldObjects

	thumb_func_start sub_804F378
sub_804F378: @ 804F378
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r1, _0804F398
	ldr r0, [r1]
	ldrb r0, [r0]
	mov r8, r1
	cmp r0, 0x15
	bls _0804F38E
	b _0804F7E6
_0804F38E:
	lsls r0, 2
	ldr r1, _0804F39C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804F398: .4byte 0x03004854
_0804F39C: .4byte _0804F3A0
	.align 2, 0
_0804F3A0:
	.4byte _0804F3F8
	.4byte _0804F474
	.4byte _0804F494
	.4byte _0804F4EC
	.4byte _0804F518
	.4byte _0804F7E6
	.4byte _0804F7E6
	.4byte _0804F7E6
	.4byte _0804F54C
	.4byte _0804F7E6
	.4byte _0804F7E6
	.4byte _0804F578
	.4byte _0804F5C8
	.4byte _0804F636
	.4byte _0804F650
	.4byte _0804F6F8
	.4byte _0804F720
	.4byte _0804F7E6
	.4byte _0804F73C
	.4byte _0804F742
	.4byte _0804F748
	.4byte _0804F754
_0804F3F8:
	bl sub_804F0F4
	ldr r4, _0804F46C
	ldrh r1, [r4]
	movs r0, 0
	bl sub_80516C4
	ldr r5, _0804F470
	ldr r0, [r5]
	movs r6, 0xBE
	lsls r6, 1
	adds r0, r6
	ldrh r1, [r4]
	bl sub_804E844
	ldrh r0, [r4]
	ldr r2, [r5]
	adds r1, r2, 0
	adds r1, 0x88
	ldrb r1, [r1]
	adds r2, r6
	bl sub_804F1BC
	movs r4, 0
	movs r6, 0
	mov r8, r5
	movs r7, 0xA6
	lsls r7, 1
_0804F430:
	ldr r0, [r5]
	lsls r1, r4, 1
	adds r0, 0x70
	adds r0, r1
	strh r6, [r0]
	adds r3, r4, 0x1
	adds r1, r4
	lsls r1, 1
	movs r2, 0x2
_0804F442:
	ldr r0, [r5]
	adds r0, r7
	adds r0, r1
	strh r6, [r0]
	adds r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bge _0804F442
	adds r4, r3, 0
	cmp r4, 0x3
	ble _0804F430
	mov r0, r8
	ldr r3, [r0]
	adds r1, r3, 0
	adds r1, 0x7C
	movs r2, 0
	movs r0, 0
	strh r0, [r1]
	strb r2, [r3, 0x1]
	b _0804F7E6
	.align 2, 0
_0804F46C: .4byte 0x0203855e
_0804F470: .4byte 0x03004854
_0804F474:
	bl sub_804E2EC
	lsls r0, 24
	cmp r0, 0
	bne _0804F480
	b _0804F7E6
_0804F480:
	ldr r0, _0804F490
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl sub_8051474
	b _0804F7E6
	.align 2, 0
_0804F490: .4byte 0x03004854
_0804F494:
	movs r4, 0
	ldr r5, _0804F4DC
	ldr r6, _0804F4E0
_0804F49A:
	ldrb r1, [r5]
	ldrb r2, [r5, 0x1]
	ldr r0, _0804F4E4
	movs r3, 0x1
	bl CreateSprite
	ldr r1, [r6]
	adds r1, 0x60
	adds r1, r4
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0x60
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0804F4E8
	adds r0, r1
	adds r1, r4, 0
	adds r1, 0x8
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAnim
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _0804F49A
	ldr r0, _0804F4E0
	ldr r1, [r0]
	b _0804F74C
	.align 2, 0
_0804F4DC: .4byte gUnknown_082162E4
_0804F4E0: .4byte 0x03004854
_0804F4E4: .4byte gSpriteTemplate_82163F4
_0804F4E8: .4byte 0x02020004
_0804F4EC:
	movs r0, 0x1
	negs r0, r0
	movs r4, 0
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _0804F514
	ldr r1, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	movs r1, 0x98
	lsls r1, 1
	adds r0, r1
	str r4, [r0]
	b _0804F7E6
	.align 2, 0
_0804F514: .4byte 0x03004854
_0804F518:
	mov r2, r8
	ldr r1, [r2]
	movs r3, 0x98
	lsls r3, 1
	adds r1, r3
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x2
	bne _0804F530
	bl sub_804E4FC
_0804F530:
	ldr r0, _0804F548
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804F53E
	b _0804F7E6
_0804F53E:
	mov r5, r8
	ldr r1, [r5]
	movs r0, 0x8
	strb r0, [r1]
	b _0804F7E6
	.align 2, 0
_0804F548: .4byte 0x0202f388
_0804F54C:
	mov r0, r8
	ldr r1, [r0]
	movs r2, 0
	movs r0, 0xB
	strb r0, [r1]
	mov r1, r8
	ldr r0, [r1]
	movs r3, 0x9E
	lsls r3, 1
	adds r0, r3
	strb r2, [r0]
	b _0804F7E6
_0804F564:
	lsls r1, 1
	adds r0, r3, 0
	adds r0, 0x80
	adds r0, r1
	ldrh r0, [r0]
	lsls r1, r4, 24
	lsrs r1, 24
	bl sub_804E7C0
	b _0804F5A2
_0804F578:
	movs r4, 0
	ldr r2, _0804F5C0
	ldr r0, _0804F5C4
	ldr r3, [r0]
	adds r0, r3, 0
	adds r0, 0x88
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 2
	movs r5, 0x9E
	lsls r5, 1
	adds r1, r3, r5
	ldrb r1, [r1]
	adds r0, r2
_0804F594:
	ldrb r2, [r0]
	cmp r1, r2
	beq _0804F564
	adds r0, 0x1
	adds r4, 0x1
	cmp r4, 0x3
	ble _0804F594
_0804F5A2:
	ldr r3, _0804F5C4
	ldr r1, [r3]
	movs r5, 0x98
	lsls r5, 1
	adds r2, r1, r5
	movs r0, 0
	str r0, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, [r3]
	movs r0, 0x9E
	lsls r0, 1
	adds r1, r0
	b _0804F74C
	.align 2, 0
_0804F5C0: .4byte gUnknown_082162EC
_0804F5C4: .4byte 0x03004854
_0804F5C8:
	mov r1, r8
	ldr r3, [r1]
	movs r2, 0x98
	lsls r2, 1
	adds r1, r3, r2
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x3C
	bgt _0804F5DE
	b _0804F7E6
_0804F5DE:
	movs r5, 0x9E
	lsls r5, 1
	adds r0, r3, r5
	adds r4, r3, 0
	adds r4, 0x88
	ldrb r0, [r0]
	ldrb r1, [r4]
	cmp r0, r1
	bcc _0804F620
	ldr r2, _0804F614
	ldr r1, _0804F618
	ldrb r0, [r4]
	subs r0, 0x2
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r2
	ldr r2, _0804F61C
	adds r1, r2, 0
	ldrh r0, [r0]
	adds r1, r0
	adds r0, r3, 0
	adds r0, 0x54
	strh r1, [r0]
	ldrb r0, [r3]
	adds r0, 0x1
	b _0804F624
	.align 2, 0
_0804F614: .4byte gUnknown_082162F8
_0804F618: .4byte gUnknown_08216300
_0804F61C: .4byte 0xffffa800
_0804F620:
	ldrb r0, [r3]
	subs r0, 0x1
_0804F624:
	strb r0, [r3]
	mov r3, r8
	ldr r0, [r3]
	movs r5, 0x98
	lsls r5, 1
	adds r0, r5
	movs r1, 0
	str r1, [r0]
	b _0804F7E6
_0804F636:
	mov r1, r8
	ldr r0, [r1]
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	bl sub_804F238
	movs r0, 0x2B
	bl audio_play
	mov r2, r8
	ldr r0, [r2]
	b _0804F710
_0804F650:
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r5, 0x80
	lsls r5, 3
	adds r1, r5, 0
	orrs r0, r1
	strh r0, [r2]
	mov r0, r8
	ldr r2, [r0]
	adds r1, r2, 0
	adds r1, 0x54
	movs r3, 0x80
	lsls r3, 2
	adds r0, r3, 0
	ldrh r5, [r1]
	adds r0, r5
	strh r0, [r1]
	movs r0, 0xA1
	lsls r0, 1
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x4
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xFF
	bls _0804F6D6
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	mov r1, r8
	ldr r3, [r1]
	movs r2, 0xA1
	lsls r2, 1
	adds r1, r3, r2
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r1]
	ldr r2, _0804F6E8
	ldr r1, _0804F6EC
	adds r0, r3, 0
	adds r0, 0x88
	ldrb r0, [r0]
	subs r0, 0x2
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	adds r0, r3, 0
	adds r0, 0x54
	strh r1, [r0]
	ldr r1, _0804F6F0
	ldr r5, _0804F6F4
	adds r0, r5, 0
	strh r0, [r1]
	movs r0, 0x98
	lsls r0, 1
	adds r1, r3, r0
	movs r0, 0
	str r0, [r1]
	movs r0, 0x34
	bl audio_play
	bl BuyMenuDrawFieldObjects
_0804F6D6:
	mov r1, r8
	ldr r0, [r1]
	movs r2, 0xB4
	lsls r2, 1
	adds r0, r2
	bl sub_8051414
	b _0804F7E6
	.align 2, 0
_0804F6E8: .4byte gUnknown_082162F8
_0804F6EC: .4byte gUnknown_08216300
_0804F6F0: .4byte REG_BG2CNT
_0804F6F4: .4byte 0x00004882
_0804F6F8:
	bl sub_8051B8C
	lsls r0, 24
	cmp r0, 0
	beq _0804F70C
	ldr r0, _0804F71C
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0804F70C:
	ldr r0, _0804F71C
	ldr r0, [r0]
_0804F710:
	movs r3, 0xB4
	lsls r3, 1
	adds r0, r3
	bl sub_8051414
	b _0804F7E6
	.align 2, 0
_0804F71C: .4byte 0x03004854
_0804F720:
	ldr r0, _0804F734
	movs r2, 0x10
	negs r2, r2
	movs r1, 0x78
	movs r3, 0x3
	bl CreateSprite
	ldr r0, _0804F738
	ldr r1, [r0]
	b _0804F74C
	.align 2, 0
_0804F734: .4byte gSpriteTemplate_8216548
_0804F738: .4byte 0x03004854
_0804F73C:
	mov r5, r8
	ldr r1, [r5]
	b _0804F74C
_0804F742:
	mov r0, r8
	ldr r1, [r0]
	b _0804F74C
_0804F748:
	mov r2, r8
	ldr r1, [r2]
_0804F74C:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0804F7E6
_0804F754:
	bl sub_804F81C
	ldr r3, _0804F804
	ldr r4, [r3]
	adds r5, r4, 0
	adds r5, 0x56
	movs r2, 0
	movs r1, 0
	movs r0, 0x80
	strh r0, [r5]
	movs r5, 0x96
	lsls r5, 1
	adds r0, r4, r5
	str r1, [r0]
	ldr r1, _0804F808
	adds r0, r4, r1
	strb r2, [r0]
	ldr r0, [r3]
	adds r0, 0x7E
	strb r2, [r0]
	ldr r0, _0804F80C
	bl SetMainCallback2
	movs r4, 0
	ldr r0, _0804F810
	ldrh r0, [r0]
	cmp r4, r0
	bge _0804F7B8
	movs r5, 0xA0
	lsls r5, 20
	ldr r6, _0804F814
_0804F792:
	ldm r6!, {r0}
	lsrs r1, r5, 24
	bl CreateTask
	ldr r1, _0804F804
	ldr r1, [r1]
	movs r2, 0xA4
	lsls r2, 1
	adds r1, r2
	adds r1, r4
	strb r0, [r1]
	movs r3, 0x80
	lsls r3, 17
	adds r5, r3
	adds r4, 0x1
	ldr r0, _0804F810
	ldrh r0, [r0]
	cmp r4, r0
	blt _0804F792
_0804F7B8:
	bl current_map_music_get
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0804F818
	cmp r0, r4
	beq _0804F7D6
	bl current_map_music_get
	ldr r1, _0804F804
	ldr r1, [r1]
	movs r5, 0xBC
	lsls r5, 1
	adds r1, r5
	strh r0, [r1]
_0804F7D6:
	adds r0, r4, 0
	bl sub_8075474
	movs r0, 0x35
	bl audio_play
	bl sub_804E290
_0804F7E6:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F804: .4byte 0x03004854
_0804F808: .4byte 0x0000014b
_0804F80C: .4byte sub_80501FC
_0804F810: .4byte 0x0202e8cc
_0804F814: .4byte gUnknown_08216308
_0804F818: .4byte 0x00000193
	thumb_func_end sub_804F378

	thumb_func_start sub_804F81C
sub_804F81C: @ 804F81C
	push {lr}
	ldr r3, _0804F83C
	movs r0, 0
	ldr r1, _0804F840
	movs r2, 0x3
_0804F826:
	strh r0, [r3]
	strh r0, [r3, 0x4]
	strh r0, [r1]
	strh r0, [r1, 0x10]
	adds r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bge _0804F826
	pop {r0}
	bx r0
	.align 2, 0
_0804F83C: .4byte 0x03002f90
_0804F840: .4byte 0x03002a20
	thumb_func_end sub_804F81C

	thumb_func_start sub_804F844
sub_804F844: @ 804F844
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _0804F884
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	lsls r0, 16
	asrs r0, 16
	movs r4, 0xA
	ldrsh r1, [r2, r4]
	cmp r0, r1
	ble _0804F87C
	ldr r0, _0804F888
	movs r4, 0xC
	ldrsh r1, [r2, r4]
	lsls r1, 1
	adds r0, 0x10
	adds r1, r0
	ldr r0, _0804F88C
	strh r0, [r1]
	adds r0, r3, 0
	bl DestroyTask
_0804F87C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804F884: .4byte 0x03004b20
_0804F888: .4byte 0x03002a20
_0804F88C: .4byte 0x00002345
	thumb_func_end sub_804F844

	thumb_func_start sub_804F890
sub_804F890: @ 804F890
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0804F8C0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0804F8C4
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xA]
	strh r5, [r1, 0xC]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804F8C0: .4byte sub_804F844
_0804F8C4: .4byte 0x03004b20
	thumb_func_end sub_804F890

	thumb_func_start sub_804F8C8
sub_804F8C8: @ 804F8C8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _0804F934
	ldr r0, [r4]
	adds r0, 0x54
	ldrh r0, [r0]
	movs r1, 0x1
	bl task_tutorial_oak_boy_girl
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _0804F8E6
	b _0804F9DC
_0804F8E6:
	ldr r2, _0804F938
	lsls r1, r5, 2
	adds r0, r1, r5
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r6, r1, 0
	cmp r0, 0
	beq _0804F8FC
	b _0804F9EA
_0804F8FC:
	ldr r0, [r4]
	ldr r1, _0804F93C
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0804F9BE
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0804F940
	bl __udivsi3
	lsls r0, 24
	lsrs r1, r0, 24
	adds r3, r1, 0
	ldr r0, [r4]
	adds r0, 0x56
	movs r4, 0
	ldrsh r2, [r0, r4]
	ldr r0, _0804F944
	cmp r2, r0
	bgt _0804F964
	cmp r1, 0x4B
	bls _0804F950
	ldr r1, _0804F948
	ldr r0, _0804F94C
	b _0804F954
	.align 2, 0
_0804F934: .4byte 0x03004854
_0804F938: .4byte 0x03004b20
_0804F93C: .4byte 0x0000014b
_0804F940: .4byte 0x0000028f
_0804F944: .4byte 0x000001f3
_0804F948: .4byte 0x03002a20
_0804F94C: .4byte 0x00004523
_0804F950:
	ldr r1, _0804F95C
	ldr r0, _0804F960
_0804F954:
	strh r0, [r1, 0x12]
	ldr r0, _0804F960
	b _0804F9C2
	.align 2, 0
_0804F95C: .4byte 0x03002a20
_0804F960: .4byte 0x00005432
_0804F964:
	ldr r0, _0804F980
	cmp r2, r0
	bgt _0804F992
	cmp r1, 0x50
	bhi _0804F9BE
	adds r0, r1, 0
	subs r0, 0x15
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3B
	bhi _0804F98C
	ldr r1, _0804F984
	ldr r0, _0804F988
	b _0804F9C2
	.align 2, 0
_0804F980: .4byte 0x000005db
_0804F984: .4byte 0x03002a20
_0804F988: .4byte 0x00005432
_0804F98C:
	cmp r1, 0x9
	bhi _0804F9C4
	b _0804F9B4
_0804F992:
	cmp r1, 0x5A
	bhi _0804F9BE
	adds r0, r1, 0
	subs r0, 0x47
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _0804F9B0
	ldr r1, _0804F9A8
	ldr r0, _0804F9AC
	b _0804F9C2
	.align 2, 0
_0804F9A8: .4byte 0x03002a20
_0804F9AC: .4byte 0x00005432
_0804F9B0:
	cmp r3, 0x1D
	bhi _0804F9C4
_0804F9B4:
	movs r0, 0x1
	movs r1, 0x5
	bl sub_804F890
	b _0804F9C4
_0804F9BE:
	ldr r1, _0804F9D0
	ldr r0, _0804F9D4
_0804F9C2:
	strh r0, [r1, 0x12]
_0804F9C4:
	ldr r0, _0804F9D8
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	b _0804F9E8
	.align 2, 0
_0804F9D0: .4byte 0x03002a20
_0804F9D4: .4byte 0x00004523
_0804F9D8: .4byte 0x03004b20
_0804F9DC:
	ldr r0, _0804F9F0
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	movs r0, 0
_0804F9E8:
	strh r0, [r1, 0x8]
_0804F9EA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804F9F0: .4byte 0x03004b20
	thumb_func_end sub_804F8C8

	thumb_func_start sub_804F9F4
sub_804F9F4: @ 804F9F4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r6, _0804FA78
	ldr r3, [r6]
	adds r0, r3, 0
	adds r0, 0x54
	ldrh r0, [r0]
	movs r1, 0xC0
	lsls r1, 5
	adds r0, r1
	ldr r1, _0804FA7C
	ands r0, r1
	adds r1, r3, 0
	adds r1, 0xA6
	ldrb r1, [r1]
	lsrs r2, r0, 8
	ldr r0, _0804FA80
	adds r1, r0
	ldrb r1, [r1]
	adds r0, r1, 0
	adds r0, 0x14
	cmp r2, r0
	bls _0804FB04
	adds r0, 0x14
	cmp r2, r0
	bcs _0804FB04
	ldr r2, _0804FA84
	lsls r1, r4, 2
	adds r0, r1, r4
	lsls r0, 3
	adds r2, r0, r2
	movs r5, 0x8
	ldrsh r0, [r2, r5]
	adds r5, r1, 0
	cmp r0, 0
	bne _0804FB12
	ldr r1, _0804FA88
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0804FAF0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0804FA8C
	bl __udivsi3
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r2, 0
	ldr r0, [r6]
	adds r0, 0x56
	movs r6, 0
	ldrsh r1, [r0, r6]
	ldr r0, _0804FA90
	cmp r1, r0
	bgt _0804FAAC
	cmp r2, 0x42
	bls _0804FA9C
	ldr r1, _0804FA94
	ldr r0, _0804FA98
	strh r0, [r1, 0x14]
	b _0804FAD4
	.align 2, 0
_0804FA78: .4byte 0x03004854
_0804FA7C: .4byte 0x0000ffff
_0804FA80: .4byte gUnknown_08216303
_0804FA84: .4byte 0x03004b20
_0804FA88: .4byte 0x0000014b
_0804FA8C: .4byte 0x0000028f
_0804FA90: .4byte 0x000001f3
_0804FA94: .4byte 0x03002a20
_0804FA98: .4byte 0x00004523
_0804FA9C:
	ldr r1, _0804FAA4
	ldr r0, _0804FAA8
	strh r0, [r1, 0x14]
	b _0804FAD4
	.align 2, 0
_0804FAA4: .4byte 0x03002a20
_0804FAA8: .4byte 0x00005432
_0804FAAC:
	cmp r2, 0x41
	bls _0804FAB6
	ldr r1, _0804FAE0
	ldr r0, _0804FAE4
	strh r0, [r1, 0x14]
_0804FAB6:
	adds r0, r2, 0
	subs r0, 0x29
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x18
	bhi _0804FAC8
	ldr r1, _0804FAE0
	ldr r0, _0804FAE8
	strh r0, [r1, 0x14]
_0804FAC8:
	cmp r3, 0x9
	bhi _0804FAD4
	movs r0, 0x2
	movs r1, 0x5
	bl sub_804F890
_0804FAD4:
	ldr r0, _0804FAEC
	adds r1, r5, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	b _0804FB10
	.align 2, 0
_0804FAE0: .4byte 0x03002a20
_0804FAE4: .4byte 0x00004523
_0804FAE8: .4byte 0x00005432
_0804FAEC: .4byte 0x03004b20
_0804FAF0:
	ldr r0, _0804FAFC
	ldr r1, _0804FB00
	strh r1, [r0, 0x14]
	movs r0, 0x1
	strh r0, [r2, 0x8]
	b _0804FB12
	.align 2, 0
_0804FAFC: .4byte 0x03002a20
_0804FB00: .4byte 0x00004523
_0804FB04:
	ldr r0, _0804FB18
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0
_0804FB10:
	strh r0, [r1, 0x8]
_0804FB12:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804FB18: .4byte 0x03004b20
	thumb_func_end sub_804F9F4

	thumb_func_start sub_804FB1C
sub_804FB1C: @ 804FB1C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r5, _0804FB9C
	ldr r3, [r5]
	adds r0, r3, 0
	adds r0, 0x54
	ldrh r0, [r0]
	movs r1, 0xC0
	lsls r1, 5
	adds r0, r1
	ldr r1, _0804FBA0
	ands r0, r1
	adds r1, r3, 0
	adds r1, 0xA8
	ldrb r1, [r1]
	lsrs r2, r0, 8
	ldr r0, _0804FBA4
	adds r1, r0
	ldrb r1, [r1]
	adds r0, r1, 0
	adds r0, 0x14
	cmp r2, r0
	bls _0804FC30
	adds r0, 0x14
	cmp r2, r0
	bcs _0804FC30
	ldr r2, _0804FBA8
	lsls r1, r4, 2
	adds r0, r1, r4
	lsls r0, 3
	adds r2, r0, r2
	movs r6, 0x8
	ldrsh r0, [r2, r6]
	adds r6, r1, 0
	cmp r0, 0
	bne _0804FC3E
	ldr r1, _0804FBAC
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0804FC1C
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0804FBB0
	bl __udivsi3
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, [r5]
	adds r0, 0x56
	movs r3, 0
	ldrsh r1, [r0, r3]
	ldr r0, _0804FBB4
	cmp r1, r0
	bgt _0804FBD0
	cmp r2, 0x58
	bls _0804FBC0
	ldr r1, _0804FBB8
	ldr r0, _0804FBBC
	strh r0, [r1, 0x16]
	b _0804FC02
	.align 2, 0
_0804FB9C: .4byte 0x03004854
_0804FBA0: .4byte 0x0000ffff
_0804FBA4: .4byte gUnknown_08216303
_0804FBA8: .4byte 0x03004b20
_0804FBAC: .4byte 0x0000014b
_0804FBB0: .4byte 0x0000028f
_0804FBB4: .4byte 0x000001f3
_0804FBB8: .4byte 0x03002a20
_0804FBBC: .4byte 0x00004523
_0804FBC0:
	ldr r1, _0804FBC8
	ldr r0, _0804FBCC
	strh r0, [r1, 0x16]
	b _0804FC02
	.align 2, 0
_0804FBC8: .4byte 0x03002a20
_0804FBCC: .4byte 0x00005432
_0804FBD0:
	cmp r2, 0x3C
	bls _0804FBE4
	ldr r1, _0804FBDC
	ldr r0, _0804FBE0
	b _0804FBF4
	.align 2, 0
_0804FBDC: .4byte 0x03002a20
_0804FBE0: .4byte 0x00004523
_0804FBE4:
	adds r0, r2, 0
	subs r0, 0x38
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _0804FBF6
	ldr r1, _0804FC10
	ldr r0, _0804FC14
_0804FBF4:
	strh r0, [r1, 0x16]
_0804FBF6:
	cmp r2, 0x4
	bhi _0804FC02
	movs r0, 0x3
	movs r1, 0x5
	bl sub_804F890
_0804FC02:
	ldr r0, _0804FC18
	adds r1, r6, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	b _0804FC3C
	.align 2, 0
_0804FC10: .4byte 0x03002a20
_0804FC14: .4byte 0x00005432
_0804FC18: .4byte 0x03004b20
_0804FC1C:
	ldr r0, _0804FC28
	ldr r1, _0804FC2C
	strh r1, [r0, 0x16]
	movs r0, 0x1
	strh r0, [r2, 0x8]
	b _0804FC3E
	.align 2, 0
_0804FC28: .4byte 0x03002a20
_0804FC2C: .4byte 0x00004523
_0804FC30:
	ldr r0, _0804FC44
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0
_0804FC3C:
	strh r0, [r1, 0x8]
_0804FC3E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804FC44: .4byte 0x03004b20
	thumb_func_end sub_804FB1C

	thumb_func_start sub_804FC48
sub_804FC48: @ 804FC48
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r7, r0, 16
	mov r8, r7
	lsls r1, 24
	ldr r0, _0804FCBC
	ldr r4, _0804FCC0
	lsrs r1, 23
	adds r2, r1, r4
	ldrb r6, [r2]
	ldr r5, _0804FCC4
	adds r2, r1, r5
	movs r3, 0
	ldrsb r3, [r2, r3]
	lsls r2, r3, 2
	adds r2, r3
	lsls r2, 1
	subs r6, r2
	adds r4, 0x1
	adds r4, r1, r4
	ldrb r2, [r4]
	adds r5, 0x1
	adds r1, r5
	movs r3, 0
	ldrsb r3, [r1, r3]
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 1
	subs r2, r1
	adds r1, r6, 0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	adds r2, r1, 0
	ldr r0, _0804FCC8
	cmp r7, r0
	bne _0804FCD4
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	ldr r5, _0804FCCC
	adds r0, r4, r5
	movs r1, 0x2
	bl StartSpriteAnim
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _0804FCD0
	str r0, [r4]
	movs r0, 0x28
	bl audio_play
	b _0804FD18
	.align 2, 0
_0804FCBC: .4byte gSpriteTemplate_821645C
_0804FCC0: .4byte gUnknown_082162E4
_0804FCC4: .4byte gUnknown_082162CC
_0804FCC8: .4byte 0x00004523
_0804FCCC: .4byte 0x02020004
_0804FCD0: .4byte sub_8051684
_0804FCD4:
	ldr r0, _0804FCF4
	cmp r7, r0
	bne _0804FCFC
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0804FCF8
	adds r0, r1
	movs r1, 0
	bl StartSpriteAnim
	movs r0, 0x1F
	bl audio_play
	b _0804FD18
	.align 2, 0
_0804FCF4: .4byte 0x00005432
_0804FCF8: .4byte 0x02020004
_0804FCFC:
	ldr r0, _0804FD28
	cmp r8, r0
	bne _0804FD18
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	ldr r1, _0804FD2C
	adds r0, r1
	movs r1, 0x1
	bl StartSpriteAnim
	movs r0, 0x20
	bl audio_play
_0804FD18:
	bl sub_805156C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804FD28: .4byte 0x00002345
_0804FD2C: .4byte 0x02020004
	thumb_func_end sub_804FC48

	thumb_func_start sub_804FD30
sub_804FD30: @ 804FD30
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r5, r4, 0
	bl sub_804E290
	ldr r0, _0804FD50
	cmp r4, r0
	beq _0804FD64
	cmp r4, r0
	bgt _0804FD58
	ldr r0, _0804FD54
	cmp r4, r0
	beq _0804FE34
	b _0804FE60
	.align 2, 0
_0804FD50: .4byte 0x00004523
_0804FD54: .4byte 0x00002345
_0804FD58:
	ldr r0, _0804FD60
	cmp r5, r0
	beq _0804FDFC
	b _0804FE60
	.align 2, 0
_0804FD60: .4byte 0x00005432
_0804FD64:
	ldr r7, _0804FD94
	ldr r4, [r7]
	adds r5, r4, 0
	adds r5, 0x56
	ldrh r6, [r5]
	movs r0, 0
	ldrsh r1, [r5, r0]
	ldr r0, _0804FD98
	cmp r1, r0
	bgt _0804FDA0
	ldr r1, _0804FD9C
	adds r0, r4, 0
	adds r0, 0x88
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0xC0
	lsls r0, 1
	bl __divsi3
	adds r0, r6, r0
	strh r0, [r5]
	b _0804FE60
	.align 2, 0
_0804FD94: .4byte 0x03004854
_0804FD98: .4byte 0x000005db
_0804FD9C: .4byte gUnknown_082165DA
_0804FDA0:
	ldr r1, _0804FDF8
	adds r0, r4, 0
	adds r0, 0x88
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x80
	bl __divsi3
	adds r0, r6, r0
	strh r0, [r5]
	movs r1, 0xA2
	lsls r1, 1
	adds r4, r1
	movs r1, 0
	ldrsh r0, [r5, r1]
	movs r1, 0x64
	bl __divsi3
	adds r1, r0, 0
	subs r1, 0xA
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_8051AC8
	ldr r0, [r7]
	movs r1, 0xA3
	lsls r1, 1
	adds r4, r0, r1
	adds r0, 0x56
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r1, 0x64
	bl __divsi3
	adds r1, r0, 0
	subs r1, 0xA
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_8051AC8
	b _0804FE60
	.align 2, 0
_0804FDF8: .4byte gUnknown_082165DA
_0804FDFC:
	ldr r0, _0804FE28
	ldr r2, [r0]
	adds r4, r2, 0
	adds r4, 0x56
	ldrh r5, [r4]
	movs r0, 0
	ldrsh r1, [r4, r0]
	ldr r0, _0804FE2C
	cmp r1, r0
	bgt _0804FE60
	ldr r1, _0804FE30
	adds r0, r2, 0
	adds r0, 0x88
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x80
	lsls r0, 1
	bl __divsi3
	adds r0, r5, r0
	b _0804FE5E
	.align 2, 0
_0804FE28: .4byte 0x03004854
_0804FE2C: .4byte 0x000005db
_0804FE30: .4byte gUnknown_082165DA
_0804FE34:
	ldr r0, _0804FE68
	ldr r0, [r0]
	adds r4, r0, 0
	adds r4, 0x56
	ldr r1, _0804FE6C
	adds r0, 0x88
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x80
	lsls r0, 1
	bl __divsi3
	ldrh r1, [r4]
	subs r1, r0
	strh r1, [r4]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x7F
	bgt _0804FE60
	movs r0, 0x80
_0804FE5E:
	strh r0, [r4]
_0804FE60:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804FE68: .4byte 0x03004854
_0804FE6C: .4byte gUnknown_082165DA
	thumb_func_end sub_804FD30

	thumb_func_start sub_804FE70
sub_804FE70: @ 804FE70
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r0, _0804FF40
	ldrh r0, [r0]
	cmp r0, 0
	beq _0804FEB6
	ldr r3, _0804FF44
	ldrh r0, [r3, 0x4]
	ldr r2, _0804FF48
	cmp r0, 0
	beq _0804FE98
	movs r1, 0
	strh r0, [r2, 0x10]
	ldr r0, _0804FF4C
	strh r0, [r2]
	strh r1, [r3, 0x4]
_0804FE98:
	ldr r0, _0804FF48
	ldr r3, _0804FF4C
	adds r1, r2, 0x2
	adds r2, r0, 0
	adds r2, 0x12
	movs r6, 0x2
_0804FEA4:
	ldrh r0, [r2]
	cmp r0, 0
	beq _0804FEAC
	strh r3, [r1]
_0804FEAC:
	adds r1, 0x2
	adds r2, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _0804FEA4
_0804FEB6:
	movs r6, 0
	ldr r7, _0804FF50
	adds r1, r7, 0
	ldr r0, [r1]
	adds r0, 0x88
	ldrb r0, [r0]
	cmp r6, r0
	blt _0804FEC8
	b _0805005C
_0804FEC8:
	movs r2, 0
	str r2, [sp]
	mov r9, r2
	ldr r0, _0804FF48
	adds r0, 0x10
	mov r8, r0
	ldr r1, _0804FF54
	mov r10, r1
_0804FED8:
	ldr r2, [sp]
	ldr r1, _0804FF48
	adds r0, r2, r1
	ldrh r1, [r0]
	ldr r0, _0804FF4C
	cmp r1, r0
	beq _0804FEE8
	b _0805003E
_0804FEE8:
	ldr r0, [r7]
	adds r0, 0xA2
	adds r0, r2
	ldrh r5, [r0]
	mov r2, r8
	ldrh r4, [r2]
	ldr r0, _0804FF58
	cmp r4, r0
	bne _0804FF60
	bl sub_804FD30
	ldr r0, [r7]
	movs r1, 0x9F
	lsls r1, 1
	adds r4, r0, r1
	adds r0, 0x56
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r1, 0x37
	bl __divsi3
	ldrh r1, [r4]
	adds r1, r0
	strh r1, [r4]
	lsls r1, 16
	ldr r0, _0804FF5C
	cmp r1, r0
	bls _0804FF26
	movs r0, 0xFA
	lsls r0, 2
	strh r0, [r4]
_0804FF26:
	lsls r1, r5, 24
	lsrs r1, 24
	ldr r0, _0804FF58
	bl sub_804FC48
	ldr r1, [r7]
	movs r0, 0xA6
	lsls r0, 1
	adds r1, r0
	add r1, r9
	ldrh r0, [r1]
	adds r0, 0x1
	b _0804FFCA
	.align 2, 0
_0804FF40: .4byte 0x0202e8cc
_0804FF44: .4byte 0x03002f90
_0804FF48: .4byte 0x03002a20
_0804FF4C: .4byte 0x00004444
_0804FF50: .4byte 0x03004854
_0804FF54: .4byte 0x00005432
_0804FF58: .4byte 0x00004523
_0804FF5C: .4byte 0x03e70000
_0804FF60:
	cmp r4, r10
	bne _0804FF9E
	mov r0, r10
	bl sub_804FD30
	ldr r0, [r7]
	movs r1, 0x9F
	lsls r1, 1
	adds r4, r0, r1
	adds r0, 0x56
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r1, 0x46
	bl __divsi3
	ldrh r1, [r4]
	adds r1, r0
	strh r1, [r4]
	lsls r1, r5, 24
	lsrs r1, 24
	mov r0, r10
	bl sub_804FC48
	ldr r1, [r7]
	movs r0, 0xA7
	lsls r0, 1
	adds r1, r0
	add r1, r9
	ldrh r0, [r1]
	adds r0, 0x1
	b _0804FFCA
_0804FF9E:
	ldr r0, _08050018
	cmp r4, r0
	bne _0804FFD6
	lsls r1, r5, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_804FC48
	adds r0, r4, 0
	bl sub_804FD30
	ldr r0, [r7]
	movs r1, 0xA8
	lsls r1, 1
	adds r0, r1
	mov r2, r9
	adds r1, r0, r2
	ldrh r2, [r1]
	ldr r0, _0805001C
	cmp r2, r0
	bhi _0804FFCC
	adds r0, r2, 0x1
_0804FFCA:
	strh r0, [r1]
_0804FFCC:
	mov r0, r8
	ldrh r1, [r0]
	ldr r0, _08050018
	cmp r1, r0
	beq _0804FFE4
_0804FFD6:
	mov r1, r8
	ldrh r0, [r1]
	ldr r2, _08050020
	cmp r0, r2
	beq _0804FFE4
	cmp r0, r10
	bne _0805003E
_0804FFE4:
	ldr r0, _08050024
	ldr r0, [r0]
	adds r2, r0, 0
	adds r2, 0x56
	movs r0, 0
	ldrsh r1, [r2, r0]
	ldr r0, _08050028
	cmp r1, r0
	ble _08050034
	adds r0, r1, 0
	ldr r2, _0805002C
	adds r0, r2
	movs r1, 0x14
	bl __divsi3
	adds r1, r0, 0
	movs r0, 0x80
	lsls r0, 1
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _08050030
	bl m4aMPlayTempoControl
	b _0805003E
	.align 2, 0
_08050018: .4byte 0x00002345
_0805001C: .4byte 0x000003e6
_08050020: .4byte 0x00004523
_08050024: .4byte 0x03004854
_08050028: .4byte 0x000005dc
_0805002C: .4byte 0xfffffd12
_08050030: .4byte 0x03007380
_08050034:
	ldr r0, _08050098
	movs r1, 0x80
	lsls r1, 1
	bl m4aMPlayTempoControl
_0805003E:
	ldr r1, [sp]
	adds r1, 0x2
	str r1, [sp]
	movs r2, 0x6
	add r9, r2
	movs r0, 0x2
	add r8, r0
	adds r6, 0x1
	ldr r7, _0805009C
	ldr r0, [r7]
	adds r0, 0x88
	ldrb r0, [r0]
	cmp r6, r0
	bge _0805005C
	b _0804FED8
_0805005C:
	ldr r0, _080500A0
	ldrh r0, [r0]
	cmp r0, 0
	beq _08050088
	movs r6, 0
	ldr r3, _0805009C
	ldr r0, [r3]
	adds r0, 0x88
	ldrb r0, [r0]
	cmp r6, r0
	bge _08050088
	movs r2, 0
	ldr r1, _080500A4
_08050076:
	strh r2, [r1]
	strh r2, [r1, 0x10]
	adds r1, 0x2
	adds r6, 0x1
	ldr r0, [r3]
	adds r0, 0x88
	ldrb r0, [r0]
	cmp r6, r0
	blt _08050076
_08050088:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050098: .4byte 0x03007380
_0805009C: .4byte 0x03004854
_080500A0: .4byte 0x0202e8cc
_080500A4: .4byte 0x03002a20
	thumb_func_end sub_804FE70

	thumb_func_start sub_80500A8
sub_80500A8: @ 80500A8
	push {r4-r6,lr}
	movs r6, 0
	ldr r5, _080500EC
	ldr r4, [r5]
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 23
	adds r4, 0xA2
	adds r4, r0
	ldrb r3, [r4]
	ldr r0, [r5]
	adds r0, 0x6F
	ldrb r0, [r0]
	cmp r0, 0
	bne _0805018A
	ldr r0, _080500F0
	ldrb r0, [r0, 0x13]
	cmp r0, 0x2
	bne _080500FC
	ldr r2, _080500F4
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0805010A
	ldrh r0, [r2, 0x28]
	ldr r1, _080500F8
	bics r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r6, r0, 31
	b _0805010A
	.align 2, 0
_080500EC: .4byte 0x03004854
_080500F0: .4byte gSaveBlock2
_080500F4: .4byte 0x03001770
_080500F8: .4byte 0x00000201
_080500FC:
	ldr r0, _0805015C
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0805010A
	movs r6, 0x1
_0805010A:
	cmp r6, 0
	beq _0805018A
	ldr r4, _08050160
	ldr r1, [r4]
	lsls r2, r3, 1
	adds r0, r1, 0
	adds r0, 0x9A
	adds r0, r2
	adds r1, 0x5C
	ldrh r0, [r0]
	adds r1, r0
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08050164
	adds r0, r1
	adds r1, r3, 0x4
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAnim
	ldr r0, [r4]
	adds r0, 0x54
	ldrh r4, [r0]
	bl GetMultiplayerId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl task_tutorial_oak_boy_girl
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _08050170
	ldr r1, _08050168
	ldr r0, _0805016C
	b _08050188
	.align 2, 0
_0805015C: .4byte 0x03001770
_08050160: .4byte 0x03004854
_08050164: .4byte 0x02020004
_08050168: .4byte 0x03002f90
_0805016C: .4byte 0x00004523
_08050170:
	cmp r0, 0x1
	bne _08050184
	ldr r1, _0805017C
	ldr r0, _08050180
	b _08050188
	.align 2, 0
_0805017C: .4byte 0x03002f90
_08050180: .4byte 0x00005432
_08050184:
	ldr r1, _080501E4
	ldr r0, _080501E8
_08050188:
	strh r0, [r1, 0x4]
_0805018A:
	ldr r2, _080501EC
	ldr r1, [r2]
	adds r1, 0x7E
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bls _080501BA
	ldr r0, [r2]
	adds r1, r0, 0
	adds r1, 0x56
	ldrh r3, [r1]
	movs r4, 0
	ldrsh r0, [r1, r4]
	cmp r0, 0x80
	ble _080501B2
	subs r0, r3, 0x1
	strh r0, [r1]
_080501B2:
	ldr r0, [r2]
	adds r0, 0x7E
	movs r1, 0
	strb r1, [r0]
_080501BA:
	ldr r0, _080501F0
	ldrb r0, [r0]
	cmp r0, 0
	beq _080501DE
	ldr r0, _080501F4
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _080501DE
	ldr r0, [r2]
	ldr r1, _080501F8
	adds r2, r0, r1
	ldrb r0, [r2]
	movs r1, 0x1
	eors r0, r1
	strb r0, [r2]
_080501DE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080501E4: .4byte 0x03002f90
_080501E8: .4byte 0x00002345
_080501EC: .4byte 0x03004854
_080501F0: .4byte 0x020297ed
_080501F4: .4byte 0x03001770
_080501F8: .4byte 0x0000014b
	thumb_func_end sub_80500A8

	thumb_func_start sub_80501FC
sub_80501FC: @ 80501FC
	push {r4-r6,lr}
	bl sub_8051474
	ldr r4, _08050294
	ldr r0, [r4]
	movs r1, 0x96
	lsls r1, 1
	adds r2, r0, r1
	ldr r1, [r2]
	ldr r0, _08050298
	cmp r1, r0
	bhi _08050218
	adds r0, r1, 0x1
	str r0, [r2]
_08050218:
	bl sub_80500A8
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x56
	ldrh r0, [r0]
	movs r5, 0x9F
	lsls r5, 1
	adds r1, r5
	ldrh r1, [r1]
	bl SetLinkDebugValues
	bl sub_804FE70
	ldr r0, [r4]
	adds r0, r5
	ldrh r0, [r0]
	movs r6, 0xFA
	lsls r6, 2
	adds r1, r6, 0
	bl sub_805194C
	ldr r0, [r4]
	adds r0, 0x56
	ldrh r0, [r0]
	bl sub_8051A3C
	bl sub_8051B18
	bl sub_805123C
	ldr r2, [r4]
	adds r3, r2, 0
	adds r3, 0x6F
	ldrb r0, [r3]
	cmp r0, 0
	bne _0805027E
	movs r1, 0xA0
	lsls r1, 1
	adds r0, r2, r1
	ldrh r1, [r0]
	ldr r0, _0805029C
	cmp r1, r0
	bls _0805027E
	adds r0, r2, r5
	strh r6, [r0]
	movs r0, 0x1
	strb r0, [r3]
	ldr r0, _080502A0
	bl SetMainCallback2
_0805027E:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08050294: .4byte 0x03004854
_08050298: .4byte 0x00057e03
_0805029C: .4byte 0x000003e7
_080502A0: .4byte sub_8050954
	thumb_func_end sub_80501FC

	thumb_func_start help_system_is_not_first_time
help_system_is_not_first_time: @ 80502A4
	push {r4,r5,lr}
	lsls r1, 24
	lsls r2, 24
	lsrs r1, 20
	adds r4, r1, r0
	lsrs r2, 20
	adds r5, r2, r0
	ldrh r0, [r4]
	ldrh r1, [r5]
	cmp r0, r1
	bne _080502E2
	adds r0, r4, 0x2
	adds r1, r5, 0x2
	bl StringCompare
	cmp r0, 0
	bne _080502F0
	ldr r0, [r4, 0x8]
	ldr r2, _080502E8
	ands r0, r2
	ldr r1, [r5, 0x8]
	ands r1, r2
	cmp r0, r1
	bne _080502F0
	ldr r0, [r4, 0xC]
	ldr r2, _080502EC
	ands r0, r2
	ldr r1, [r5, 0xC]
	ands r1, r2
	cmp r0, r1
	bne _080502F0
_080502E2:
	movs r0, 0x1
	b _080502F2
	.align 2, 0
_080502E8: .4byte 0xffffff00
_080502EC: .4byte 0x00ffffff
_080502F0:
	movs r0, 0
_080502F2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end help_system_is_not_first_time

	thumb_func_start sub_80502F8
sub_80502F8: @ 80502F8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	mov r10, r0
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x10]
	lsls r3, 24
	lsrs r3, 24
	mov r2, sp
	movs r4, 0x5
_08050314:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, 0x2
	adds r2, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _08050314
	movs r6, 0
	mov r1, sp
	movs r4, 0x4
_08050328:
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _08050332
	adds r6, 0x1
_08050332:
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _08050328
	cmp r6, 0x5
	beq _08050386
	cmp r3, 0x3
	bhi _08050386
	movs r4, 0
	ldr r3, [sp, 0x10]
	cmp r4, r3
	bge _0805039E
	mov r3, r10
_0805034C:
	movs r6, 0
	ldr r7, [sp, 0x10]
	cmp r6, r7
	bge _08050394
	mov r9, r3
	mov r5, r10
	lsls r0, r4, 24
	mov r8, r0
_0805035C:
	mov r1, r9
	ldrh r0, [r1]
	ldrh r2, [r5]
	cmp r0, r2
	bne _0805038A
	cmp r4, r6
	beq _0805038A
	cmp r0, 0xAF
	bne _08050386
	lsls r2, r6, 24
	lsrs r2, 24
	mov r0, r10
	mov r7, r8
	lsrs r1, r7, 24
	str r3, [sp, 0xC]
	bl help_system_is_not_first_time
	lsls r0, 24
	ldr r3, [sp, 0xC]
	cmp r0, 0
	beq _0805038A
_08050386:
	movs r0, 0xC
	b _080504DE
_0805038A:
	adds r5, 0x10
	adds r6, 0x1
	ldr r0, [sp, 0x10]
	cmp r6, r0
	blt _0805035C
_08050394:
	adds r3, 0x10
	adds r4, 0x1
	ldr r1, [sp, 0x10]
	cmp r4, r1
	blt _0805034C
_0805039E:
	movs r2, 0
	mov r1, sp
	movs r4, 0x4
_080503A4:
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	ble _080503B2
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_080503B2:
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _080503A4
	cmp r2, 0x3
	bls _080503C2
	movs r0, 0xD
	b _080504DE
_080503C2:
	cmp r2, 0x3
	bne _080503CA
	movs r0, 0xB
	b _080504DE
_080503CA:
	movs r4, 0
	mov r1, sp
_080503CE:
	movs r7, 0
	ldrsh r0, [r1, r7]
	cmp r0, 0x32
	ble _080503D8
	b _080504D8
_080503D8:
	adds r1, 0x2
	adds r4, 0x1
	cmp r4, 0x4
	ble _080503CE
	cmp r2, 0x1
	bne _0805042A
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	ble _080503F2
	movs r0, 0x1
	b _080504DE
_080503F2:
	mov r0, sp
	ldrh r0, [r0, 0x2]
	lsls r0, 16
	cmp r0, 0
	ble _08050400
	movs r0, 0x2
	b _080504DE
_08050400:
	mov r0, sp
	movs r3, 0x4
	ldrsh r0, [r0, r3]
	cmp r0, 0
	ble _0805040E
	movs r0, 0x3
	b _080504DE
_0805040E:
	mov r0, sp
	movs r4, 0x6
	ldrsh r0, [r0, r4]
	cmp r0, 0
	ble _0805041C
	movs r0, 0x4
	b _080504DE
_0805041C:
	mov r0, sp
	movs r7, 0x8
	ldrsh r0, [r0, r7]
	cmp r0, 0
	ble _0805042A
	movs r0, 0x5
	b _080504DE
_0805042A:
	cmp r2, 0x2
	bne _080504DC
	movs r4, 0
	ldr r5, _08050474
	mov r1, sp
	adds r2, r5, 0
_08050436:
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	ble _08050442
	strh r4, [r2]
	adds r2, 0x2
_08050442:
	adds r1, 0x2
	adds r4, 0x1
	cmp r4, 0x4
	ble _08050436
	movs r4, 0
	ldrsh r3, [r5, r4]
	lsls r0, r3, 1
	mov r7, sp
	adds r1, r7, r0
	movs r0, 0x2
	ldrsh r2, [r5, r0]
	lsls r0, r2, 1
	add r0, sp
	movs r4, 0
	ldrsh r1, [r1, r4]
	movs r7, 0
	ldrsh r0, [r0, r7]
	cmp r1, r0
	blt _08050498
	adds r0, r3, 0
	cmp r0, 0
	bne _08050478
	lsls r0, r2, 16
	b _080504A2
	.align 2, 0
_08050474: .4byte 0x03000520
_08050478:
	cmp r0, 0x1
	bne _08050480
	lsls r0, r2, 16
	b _080504AE
_08050480:
	cmp r0, 0x2
	bne _08050488
	lsls r0, r2, 16
	b _080504BA
_08050488:
	cmp r0, 0x3
	bne _08050490
	lsls r0, r2, 16
	b _080504C6
_08050490:
	cmp r0, 0x4
	bne _080504DC
	lsls r0, r2, 16
	b _080504D2
_08050498:
	movs r2, 0x2
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bne _080504A8
	lsls r0, r3, 16
_080504A2:
	movs r1, 0x6
	orrs r0, r1
	b _080504DE
_080504A8:
	cmp r0, 0x1
	bne _080504B4
	lsls r0, r3, 16
_080504AE:
	movs r1, 0x7
	orrs r0, r1
	b _080504DE
_080504B4:
	cmp r0, 0x2
	bne _080504C0
	lsls r0, r3, 16
_080504BA:
	movs r1, 0x8
	orrs r0, r1
	b _080504DE
_080504C0:
	cmp r0, 0x3
	bne _080504CC
	lsls r0, r3, 16
_080504C6:
	movs r1, 0x9
	orrs r0, r1
	b _080504DE
_080504CC:
	cmp r0, 0x4
	bne _080504DC
	lsls r0, r3, 16
_080504D2:
	movs r1, 0xA
	orrs r0, r1
	b _080504DE
_080504D8:
	movs r0, 0xE
	b _080504DE
_080504DC:
	movs r0, 0
_080504DE:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80502F8

	thumb_func_start sub_80504F0
sub_80504F0: @ 80504F0
	ldr r1, _080504F8
	strh r0, [r1]
	bx lr
	.align 2, 0
_080504F8: .4byte 0x0300052c
	thumb_func_end sub_80504F0

	thumb_func_start unref_sub_80504FC
unref_sub_80504FC: @ 80504FC
	ldr r0, _08050504
	movs r1, 0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_08050504: .4byte 0x0300052c
	thumb_func_end unref_sub_80504FC

	thumb_func_start sub_8050508
sub_8050508: @ 8050508
	ldr r1, _08050510
	strh r0, [r1]
	bx lr
	.align 2, 0
_08050510: .4byte 0x0300052e
	thumb_func_end sub_8050508

	thumb_func_start unref_sub_8050514
unref_sub_8050514: @ 8050514
	ldr r0, _0805051C
	movs r1, 0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_0805051C: .4byte 0x0300052e
	thumb_func_end unref_sub_8050514

	thumb_func_start sub_8050520
sub_8050520: @ 8050520
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	str r0, [sp]
	mov r8, r1
	str r3, [sp, 0x4]
	ldr r0, [sp, 0x30]
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	ldr r7, _080505DC
	adds r2, r7, 0
	movs r1, 0
	adds r0, r7, 0
	adds r0, 0xA
_0805054A:
	strh r1, [r0]
	subs r0, 0x2
	cmp r0, r2
	bge _0805054A
	movs r6, 0
	cmp r6, r9
	bge _08050580
	ldr r0, _080505DC
	mov r12, r0
	ldr r5, [sp]
	adds r5, 0x9
_08050560:
	movs r3, 0
	adds r4, r5, 0
	mov r2, r12
_08050566:
	adds r1, r4, r3
	ldrh r0, [r2]
	ldrb r1, [r1]
	adds r0, r1
	strh r0, [r2]
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x5
	ble _08050566
	adds r5, 0x10
	adds r6, 0x1
	cmp r6, r9
	blt _08050560
_08050580:
	movs r1, 0
	ldrsh r3, [r7, r1]
	ldrh r0, [r7]
	ldrh r1, [r7, 0x2]
	subs r0, r1
	strh r0, [r7]
	ldrh r0, [r7, 0x4]
	subs r1, r0
	strh r1, [r7, 0x2]
	ldrh r1, [r7, 0x6]
	subs r0, r1
	strh r0, [r7, 0x4]
	ldrh r0, [r7, 0x8]
	subs r1, r0
	strh r1, [r7, 0x6]
	subs r0, r3
	strh r0, [r7, 0x8]
	movs r3, 0
	movs r2, 0
	adds r1, r7, 0
	movs r6, 0x4
_080505AA:
	movs r4, 0
	ldrsh r0, [r1, r4]
	cmp r0, 0
	bge _080505B6
	strh r2, [r1]
	adds r3, 0x1
_080505B6:
	adds r1, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _080505AA
	lsls r0, r3, 24
	lsrs r0, 24
	mov r10, r0
	movs r4, 0
	ldr r1, _080505DC
	movs r6, 0x4
_080505CA:
	ldrh r2, [r1]
	movs r5, 0
	ldrsh r0, [r1, r5]
	cmp r0, 0
	ble _080505E4
	cmp r0, r3
	bge _080505E0
	strh r4, [r1]
	b _080505E4
	.align 2, 0
_080505DC: .4byte 0x03000510
_080505E0:
	subs r0, r2, r3
	strh r0, [r1]
_080505E4:
	adds r1, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _080505CA
	ldr r1, _080506C4
	ldr r2, _080506C8
	movs r6, 0x4
_080505F2:
	movs r3, 0
	ldrsh r0, [r1, r3]
	stm r2!, {r0}
	adds r1, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _080505F2
	ldr r1, _080506CC
	ldr r0, [sp, 0x8]
	bl __udivsi3
	lsls r0, 16
	lsrs r0, 16
	adds r3, r0, 0
	adds r3, 0x64
	ldr r4, _080506D0
	str r3, [r4]
	movs r6, 0x4
_08050616:
	movs r0, 0
	ldrsh r5, [r7, r0]
	adds r0, r5, 0
	muls r0, r3
	movs r1, 0xA
	str r3, [sp, 0xC]
	bl __divsi3
	adds r5, r0, 0
	movs r1, 0xA
	bl __modsi3
	adds r4, r0, 0
	adds r0, r5, 0
	movs r1, 0xA
	bl __divsi3
	adds r5, r0, 0
	ldr r3, [sp, 0xC]
	cmp r4, 0x4
	ble _08050642
	adds r5, 0x1
_08050642:
	strh r5, [r7]
	adds r7, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _08050616
	ldr r1, _080506C4
	ldr r2, _080506D4
	movs r6, 0x4
_08050652:
	movs r3, 0
	ldrsh r0, [r1, r3]
	stm r2!, {r0}
	adds r1, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _08050652
	ldr r4, _080506C4
	ldr r0, [sp]
	adds r1, r4, 0
	mov r2, r9
	mov r3, r10
	bl sub_80502F8
	mov r5, r8
	strb r0, [r5]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	mov r1, r9
	bl __divsi3
	mov r3, r9
	subs r0, r3
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bge _0805068C
	movs r0, 0
	strh r0, [r4, 0xA]
_0805068C:
	mov r5, r8
	ldrb r0, [r5]
	cmp r0, 0xC
	bne _080506E6
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 16
	lsrs r3, r0, 16
	movs r6, 0
	ldr r0, _080506D8
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, r4, 0
	movs r4, 0x1
	movs r3, 0x2
_080506B4:
	adds r2, r0, 0
	asrs r2, r6
	ands r2, r4
	cmp r2, 0
	beq _080506DC
	strh r3, [r1]
	b _080506DE
	.align 2, 0
_080506C4: .4byte 0x03000510
_080506C8: .4byte 0x03000530
_080506CC: .4byte 0x0000014d
_080506D0: .4byte 0x0300055c
_080506D4: .4byte 0x03000548
_080506D8: .4byte gUnknown_082165DF
_080506DC:
	strh r2, [r1]
_080506DE:
	adds r1, 0x2
	adds r6, 0x1
	cmp r6, 0x4
	ble _080506B4
_080506E6:
	ldr r7, _08050740
	movs r2, 0xFF
	adds r1, r7, 0
	movs r6, 0x5
_080506EE:
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0xFF
	ble _080506F8
	strh r2, [r1]
_080506F8:
	adds r1, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _080506EE
	ldrh r0, [r7]
	mov r4, r8
	strb r0, [r4, 0x1]
	ldrh r0, [r7, 0x2]
	strb r0, [r4, 0x2]
	ldrh r0, [r7, 0x4]
	strb r0, [r4, 0x3]
	ldrh r0, [r7, 0x6]
	strb r0, [r4, 0x4]
	ldrh r0, [r7, 0x8]
	strb r0, [r4, 0x5]
	ldrh r0, [r7, 0xA]
	strb r0, [r4, 0x6]
	movs r6, 0
	adds r2, r7, 0
_0805071E:
	ldr r5, [sp, 0x4]
	adds r1, r5, r6
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, 0x2
	adds r6, 0x1
	cmp r6, 0x5
	ble _0805071E
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050740: .4byte 0x03000510
	thumb_func_end sub_8050520

	thumb_func_start sub_8050744
sub_8050744: @ 8050744
	push {r4,lr}
	sub sp, 0x4
	ldr r4, [sp, 0xC]
	lsls r2, 24
	lsrs r2, 24
	lsls r4, 16
	lsrs r4, 16
	str r4, [sp]
	bl sub_8050520
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8050744

	thumb_func_start sub_8050760
sub_8050760: @ 8050760
	push {r4-r6,lr}
	ldr r0, _08050780
	ldr r0, [r0]
	movs r2, 0x96
	lsls r2, 1
	adds r1, r0, r2
	ldrh r1, [r1]
	adds r0, 0x5A
	ldrh r4, [r0]
	movs r2, 0
	ldr r5, _08050784
	cmp r1, r5
	bhi _08050788
	movs r2, 0x5
	b _080507DA
	.align 2, 0
_08050780: .4byte 0x03004854
_08050784: .4byte 0x00000383
_08050788:
	ldr r3, _0805079C
	adds r0, r1, r3
	lsls r0, 16
	lsrs r0, 16
	ldr r3, _080507A0
	cmp r0, r3
	bhi _080507A4
	movs r2, 0x4
	b _080507DA
	.align 2, 0
_0805079C: .4byte 0xfffffc7c
_080507A0: .4byte 0x00000257
_080507A4:
	ldr r6, _080507B4
	adds r0, r1, r6
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r3
	bhi _080507B8
	movs r2, 0x3
	b _080507DA
	.align 2, 0
_080507B4: .4byte 0xfffffa24
_080507B8:
	ldr r3, _080507C8
	adds r0, r1, r3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r5
	bhi _080507CC
	movs r2, 0x2
	b _080507DA
	.align 2, 0
_080507C8: .4byte 0xfffff7cc
_080507CC:
	ldr r6, _080507F8
	adds r0, r1, r6
	lsls r0, 16
	ldr r1, _080507FC
	cmp r0, r1
	bhi _080507DA
	movs r2, 0x1
_080507DA:
	lsls r0, r2, 16
	asrs r0, 16
	bl sub_8050508
	movs r2, 0
	cmp r4, 0x40
	bhi _080508BC
	adds r0, r4, 0
	subs r0, 0x32
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _08050804
	ldr r2, _08050800
	b _080508BC
	.align 2, 0
_080507F8: .4byte 0xfffff31c
_080507FC: .4byte 0x012b0000
_08050800: .4byte 0x0000ffff
_08050804:
	adds r0, r4, 0
	subs r0, 0x64
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _08050818
	ldr r2, _08050814
	b _080508BC
	.align 2, 0
_08050814: .4byte 0x0000fffe
_08050818:
	adds r0, r4, 0
	subs r0, 0x96
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _0805082C
	ldr r2, _08050828
	b _080508BC
	.align 2, 0
_08050828: .4byte 0x0000fffd
_0805082C:
	adds r0, r4, 0
	subs r0, 0xC8
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _08050840
	ldr r2, _0805083C
	b _080508BC
	.align 2, 0
_0805083C: .4byte 0x0000fffc
_08050840:
	adds r0, r4, 0
	subs r0, 0xFA
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _08050854
	ldr r2, _08050850
	b _080508BC
	.align 2, 0
_08050850: .4byte 0x0000fffb
_08050854:
	ldr r1, _08050864
	adds r0, r4, r1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _0805086C
	ldr r2, _08050868
	b _080508BC
	.align 2, 0
_08050864: .4byte 0xfffffea2
_08050868: .4byte 0x0000fffa
_0805086C:
	ldr r3, _0805087C
	adds r0, r4, r3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _08050884
	ldr r2, _08050880
	b _080508BC
	.align 2, 0
_0805087C: .4byte 0xfffffe70
_08050880: .4byte 0x0000fff9
_08050884:
	ldr r6, _08050894
	adds r0, r4, r6
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _0805089C
	ldr r2, _08050898
	b _080508BC
	.align 2, 0
_08050894: .4byte 0xfffffe0c
_08050898: .4byte 0x0000fff8
_0805089C:
	ldr r1, _080508AC
	adds r0, r4, r1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _080508B4
	ldr r2, _080508B0
	b _080508BC
	.align 2, 0
_080508AC: .4byte 0xfffffdda
_080508B0: .4byte 0x0000fff7
_080508B4:
	ldr r0, _080508CC
	cmp r4, r0
	bls _080508BC
	ldr r2, _080508D0
_080508BC:
	lsls r0, r2, 16
	asrs r0, 16
	bl sub_80504F0
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080508CC: .4byte 0x00000257
_080508D0: .4byte 0x0000fff6
	thumb_func_end sub_8050760

	thumb_func_start sub_80508D4
sub_80508D4: @ 80508D4
	push {lr}
	ldr r2, _080508F8
	ldr r1, [r2]
	adds r1, 0xAA
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, 0xAA
	ldrb r1, [r0]
	lsls r1, 28
	movs r0, 0x90
	lsls r0, 23
	adds r1, r0
	lsrs r1, 24
	movs r0, 0xC0
	bl sub_814A880
	pop {r0}
	bx r0
	.align 2, 0
_080508F8: .4byte 0x03004854
	thumb_func_end sub_80508D4

	thumb_func_start sub_80508FC
sub_80508FC: @ 80508FC
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _08050944
	ldr r0, [r4]
	adds r0, 0xAA
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1C
	movs r3, 0xD
	bl MenuDrawTextWindow
	ldr r1, _08050948
	ldr r3, _0805094C
	movs r0, 0x20
	str r0, [sp]
	movs r0, 0
	movs r2, 0xC
	bl sub_814A5C0
	ldr r0, _08050950
	movs r1, 0x18
	movs r2, 0x9
	bl MenuPrint
	ldr r0, [r4]
	adds r0, 0xAA
	ldrb r0, [r0]
	bl sub_80508D4
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050944: .4byte 0x03004854
_08050948: .4byte 0x0000ffff
_0805094C: .4byte 0x00002d9f
_08050950: .4byte gUnknown_0842D2C5
	thumb_func_end sub_80508FC

	thumb_func_start sub_8050954
sub_8050954: @ 8050954
	push {r4-r7,lr}
	bl sub_8051474
	bl GetMultiplayerId
	ldr r0, _08050978
	ldr r0, [r0]
	adds r0, 0x6F
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r0, 0xC
	bls _0805096E
	b _08050CB6
_0805096E:
	lsls r0, 2
	ldr r1, _0805097C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08050978: .4byte 0x03004854
_0805097C: .4byte _08050980
	.align 2, 0
_08050980:
	.4byte _080509B4
	.4byte _080509F8
	.4byte _08050A4C
	.4byte _08050A94
	.4byte _08050AD0
	.4byte _08050ADE
	.4byte _08050B08
	.4byte _08050B34
	.4byte _08050B42
	.4byte _08050B58
	.4byte _08050BE0
	.4byte _08050C64
	.4byte _08050C98
_080509B4:
	bl ClearLinkCallback
	ldr r0, _080509C8
	movs r1, 0x80
	lsls r1, 1
	bl m4aMPlayTempoControl
	movs r4, 0
	b _080509E4
	.align 2, 0
_080509C8: .4byte 0x03007380
_080509CC:
	ldr r0, _080509F0
	ldr r0, [r0]
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r1
	adds r0, r4
	ldrb r0, [r0]
	bl DestroyTask
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080509E4:
	ldr r0, _080509F4
	ldrh r0, [r0]
	cmp r4, r0
	bcc _080509CC
	b _08050C82
	.align 2, 0
_080509F0: .4byte 0x03004854
_080509F4: .4byte 0x0202e8cc
_080509F8:
	ldr r1, _08050A24
	ldr r3, [r1]
	adds r2, r3, 0
	adds r2, 0x56
	ldrh r0, [r2]
	subs r0, 0x20
	strh r0, [r2]
	lsls r0, 16
	adds r4, r1, 0
	cmp r0, 0
	bgt _08050A40
	movs r0, 0
	strh r0, [r2]
	ldr r0, _08050A28
	ldrb r0, [r0]
	cmp r0, 0
	beq _08050A2C
	adds r1, r3, 0
	adds r1, 0x6F
	ldrb r0, [r1]
	adds r0, 0x1
	b _08050A32
	.align 2, 0
_08050A24: .4byte 0x03004854
_08050A28: .4byte 0x03002fa4
_08050A2C:
	adds r1, r3, 0
	adds r1, 0x6F
	movs r0, 0x5
_08050A32:
	strb r0, [r1]
	ldr r0, [r4]
	movs r1, 0
	strb r1, [r0]
	ldr r0, _08050A48
	bl m4aMPlayStop
_08050A40:
	bl sub_804E290
	b _08050CB6
	.align 2, 0
_08050A48: .4byte 0x03007400
_08050A4C:
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	beq _08050A58
	b _08050C82
_08050A58:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _08050A64
	b _08050CB6
_08050A64:
	ldr r4, _08050A90
	ldr r3, [r4]
	movs r2, 0xDE
	lsls r2, 1
	adds r1, r3, r2
	movs r5, 0x96
	lsls r5, 1
	adds r0, r3, r5
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r3, 0
	adds r0, 0x5A
	ldrh r2, [r0]
	adds r5, 0x94
	adds r0, r3, r5
	strh r2, [r0]
	movs r0, 0
	movs r2, 0x28
	bl SendBlock
	ldr r1, [r4]
	b _08050C86
	.align 2, 0
_08050A90: .4byte 0x03004854
_08050A94:
	bl GetBlockRecievedStatus
	lsls r0, 24
	cmp r0, 0
	bne _08050AA0
	b _08050CB6
_08050AA0:
	ldr r2, _08050AC8
	ldr r0, _08050ACC
	ldr r3, [r0]
	ldrh r0, [r2, 0x4]
	adds r1, r3, 0
	adds r1, 0x5A
	strh r0, [r1]
	movs r0, 0x96
	lsls r0, 1
	adds r1, r3, r0
	ldr r0, [r2]
	str r0, [r1]
	adds r1, r3, 0
	adds r1, 0x6F
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl ResetBlockReceivedFlags
	b _08050CB6
	.align 2, 0
_08050AC8: .4byte 0x03002b80
_08050ACC: .4byte 0x03004854
_08050AD0:
	bl sub_8052228
	lsls r0, 24
	cmp r0, 0
	bne _08050ADC
	b _08050CB6
_08050ADC:
	b _08050C82
_08050ADE:
	bl sub_8051C58
	lsls r0, 24
	cmp r0, 0
	bne _08050AEA
	b _08050CB6
_08050AEA:
	ldr r0, _08050AFC
	ldrb r0, [r0]
	cmp r0, 0
	bne _08050B00
	movs r0, 0x22
	bl sav12_xor_increment
	b _08050C82
	.align 2, 0
_08050AFC: .4byte 0x03004834
_08050B00:
	movs r0, 0x21
	bl sav12_xor_increment
	b _08050C82
_08050B08:
	ldr r0, _08050B2C
	ldr r1, [r0]
	adds r1, 0x6F
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08050B30
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrintMessage
	b _08050CB6
	.align 2, 0
_08050B2C: .4byte 0x03004854
_08050B30: .4byte gUnknown_0842D3B5
_08050B34:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _08050B40
	b _08050CB6
_08050B40:
	b _08050C82
_08050B42:
	ldr r4, _08050B54
	ldr r0, [r4]
	adds r0, 0xAA
	movs r1, 0
	strb r1, [r0]
	bl sub_80508FC
	ldr r1, [r4]
	b _08050C86
	.align 2, 0
_08050B54: .4byte 0x03004854
_08050B58:
	ldr r0, _08050B80
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08050B88
	ldr r0, _08050B84
	ldr r0, [r0]
	adds r0, 0xAA
	ldrb r0, [r0]
	cmp r0, 0
	beq _08050B76
	movs r0, 0x5
	bl audio_play
_08050B76:
	movs r0, 0
	bl sub_80508D4
	b _08050CB6
	.align 2, 0
_08050B80: .4byte 0x03001770
_08050B84: .4byte 0x03004854
_08050B88:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08050BA8
	ldr r0, _08050BA4
	ldr r0, [r0]
	adds r0, 0xAA
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08050BD4
	movs r0, 0x5
	bl audio_play
	b _08050BD4
	.align 2, 0
_08050BA4: .4byte 0x03004854
_08050BA8:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08050BB8
	movs r0, 0x5
	bl audio_play
	b _08050C82
_08050BB8:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08050BC2
	b _08050CB6
_08050BC2:
	movs r0, 0x5
	bl audio_play
	ldr r0, _08050BDC
	ldr r1, [r0]
	adds r1, 0x6F
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08050BD4:
	movs r0, 0x1
	bl sub_80508D4
	b _08050CB6
	.align 2, 0
_08050BDC: .4byte 0x03004854
_08050BE0:
	ldr r6, _08050C10
	movs r7, 0
	ldr r0, _08050C14
	strh r0, [r6]
	ldr r4, _08050C18
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0xAA
	ldrb r5, [r0]
	cmp r5, 0
	bne _08050C50
	movs r0, 0x4
	bl IsBagPocketNonEmpty
	lsls r0, 24
	cmp r0, 0
	bne _08050C20
	ldr r0, [r4]
	adds r0, 0x7C
	movs r1, 0x2
	strh r1, [r0]
	ldr r0, _08050C1C
	b _08050C48
	.align 2, 0
_08050C10: .4byte 0x03002f90
_08050C14: .4byte 0x00002fff
_08050C18: .4byte 0x03004854
_08050C1C: .4byte 0x00009999
_08050C20:
	bl sub_810CA00
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _08050C40
	ldr r0, [r4]
	adds r0, 0x7C
	movs r1, 0x3
	strh r1, [r0]
	ldr r0, _08050C3C
	b _08050C48
	.align 2, 0
_08050C3C: .4byte 0x0000aaaa
_08050C40:
	ldr r0, [r4]
	adds r0, 0x7C
	strh r5, [r0]
	ldr r0, _08050C4C
_08050C48:
	strh r0, [r6, 0x2]
	b _08050C82
	.align 2, 0
_08050C4C: .4byte 0x00007779
_08050C50:
	adds r1, r2, 0
	adds r1, 0x7C
	movs r0, 0x1
	strh r0, [r1]
	ldr r0, _08050C60
	strh r0, [r6, 0x2]
	subs r1, 0xD
	b _08050C88
	.align 2, 0
_08050C60: .4byte 0x00008888
_08050C64:
	ldr r0, _08050C70
	ldrb r0, [r0]
	cmp r0, 0
	beq _08050C78
	ldr r0, _08050C74
	b _08050CA4
	.align 2, 0
_08050C70: .4byte 0x03004834
_08050C74: .4byte sub_80510E8
_08050C78:
	ldr r0, _08050C90
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrintMessage
_08050C82:
	ldr r0, _08050C94
	ldr r1, [r0]
_08050C86:
	adds r1, 0x6F
_08050C88:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08050CB6
	.align 2, 0
_08050C90: .4byte gUnknown_0842D3A5
_08050C94: .4byte 0x03004854
_08050C98:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _08050CB6
	ldr r0, _08050CE0
_08050CA4:
	bl SetMainCallback2
	ldr r2, _08050CE4
	ldr r0, [r2]
	adds r0, 0x6F
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0]
_08050CB6:
	bl sub_8051B18
	ldr r0, _08050CE4
	ldr r0, [r0]
	adds r0, 0x56
	ldrh r0, [r0]
	bl sub_8051A3C
	bl sub_805123C
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050CE0: .4byte sub_8050E30
_08050CE4: .4byte 0x03004854
	thumb_func_end sub_8050954

	thumb_func_start sub_8050CE8
sub_8050CE8: @ 8050CE8
	push {r4,lr}
	ldr r1, _08050D08
	ldr r0, [r1]
	movs r2, 0xE2
	lsls r2, 1
	adds r0, r2
	ldr r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x6
	bls _08050CFE
	b _08050E28
_08050CFE:
	lsls r0, 2
	ldr r1, _08050D0C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08050D08: .4byte 0x03004854
_08050D0C: .4byte _08050D10
	.align 2, 0
_08050D10:
	.4byte _08050D2C
	.4byte _08050D44
	.4byte _08050D70
	.4byte _08050D80
	.4byte _08050DA6
	.4byte _08050DEC
	.4byte _08050E06
_08050D2C:
	bl sub_80084A4
	ldr r0, _08050D40
	ldr r2, [r0]
	movs r3, 0xE2
	lsls r3, 1
	adds r1, r2, r3
	movs r0, 0x1
	b _08050DF8
	.align 2, 0
_08050D40: .4byte 0x03004854
_08050D44:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _08050E28
	ldr r0, _08050D68
	ldr r1, [r0]
	movs r2, 0xE2
	lsls r2, 1
	adds r1, r2
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	ldr r1, _08050D6C
	movs r0, 0x1
	strb r0, [r1]
	b _08050E28
	.align 2, 0
_08050D68: .4byte 0x03004854
_08050D6C: .4byte 0x03001bb4
_08050D70:
	bl sub_8125E2C
	ldr r0, _08050D7C
	ldr r2, [r0]
	b _08050DEE
	.align 2, 0
_08050D7C: .4byte 0x03004854
_08050D80:
	ldr r1, [r4]
	movs r2, 0x98
	lsls r2, 1
	adds r1, r2
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0xA
	bne _08050E28
	bl sub_80084A4
	ldr r1, [r4]
	movs r3, 0xE2
	lsls r3, 1
	adds r1, r3
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	b _08050E28
_08050DA6:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _08050E28
	bl sub_8125E6C
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _08050DD0
	ldr r0, _08050DCC
	ldr r0, [r0]
	movs r1, 0xE2
	lsls r1, 1
	adds r0, r1
	movs r1, 0x5
	str r1, [r0]
	b _08050E28
	.align 2, 0
_08050DCC: .4byte 0x03004854
_08050DD0:
	ldr r0, _08050DE8
	ldr r1, [r0]
	movs r3, 0x98
	lsls r3, 1
	adds r0, r1, r3
	str r2, [r0]
	movs r0, 0xE2
	lsls r0, 1
	adds r1, r0
	movs r0, 0x3
	str r0, [r1]
	b _08050E28
	.align 2, 0
_08050DE8: .4byte 0x03004854
_08050DEC:
	ldr r2, [r4]
_08050DEE:
	movs r3, 0xE2
	lsls r3, 1
	adds r1, r2, r3
	ldr r0, [r1]
	adds r0, 0x1
_08050DF8:
	str r0, [r1]
	movs r0, 0x98
	lsls r0, 1
	adds r1, r2, r0
	movs r0, 0
	str r0, [r1]
	b _08050E28
_08050E06:
	ldr r1, [r4]
	movs r2, 0x98
	lsls r2, 1
	adds r1, r2
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x5
	ble _08050E28
	ldr r1, _08050E24
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	b _08050E2A
	.align 2, 0
_08050E24: .4byte 0x03001bb4
_08050E28:
	movs r0, 0
_08050E2A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8050CE8

	thumb_func_start sub_8050E30
sub_8050E30: @ 8050E30
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r1, _08050E50
	ldr r0, [r1]
	adds r0, 0x6F
	ldrb r0, [r0]
	adds r5, r1, 0
	cmp r0, 0xC
	bls _08050E44
	b _080510C4
_08050E44:
	lsls r0, 2
	ldr r1, _08050E54
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08050E50: .4byte 0x03004854
_08050E54: .4byte _08050E58
	.align 2, 0
_08050E58:
	.4byte _08050E8C
	.4byte _08050ED8
	.4byte _08050F18
	.4byte _08050F6C
	.4byte _08050F8C
	.4byte _08050FAA
	.4byte _08050FD4
	.4byte _08051004
	.4byte _08051020
	.4byte _08051030
	.4byte _08051054
	.4byte _08051094
	.4byte _080510B6
_08050E8C:
	ldr r1, [r5]
	adds r0, r1, 0
	adds r0, 0x70
	ldrh r2, [r0]
	ldr r0, _08050EB8
	cmp r2, r0
	bne _08050E9C
	b _08050FA2
_08050E9C:
	ldr r0, _08050EBC
	cmp r2, r0
	beq _08050EA4
	b _080510C4
_08050EA4:
	adds r0, r1, 0
	adds r0, 0x78
	ldrh r2, [r0]
	ldr r0, _08050EC0
	cmp r2, r0
	bne _08050EC4
	adds r1, 0x6F
	movs r0, 0x2
	strb r0, [r1]
	b _080510C4
	.align 2, 0
_08050EB8: .4byte 0x00002222
_08050EBC: .4byte 0x00001111
_08050EC0: .4byte 0x00009999
_08050EC4:
	ldr r0, _08050ED4
	cmp r2, r0
	bne _08050FA2
	adds r1, 0x6F
	movs r0, 0x1
	strb r0, [r1]
	b _080510C4
	.align 2, 0
_08050ED4: .4byte 0x0000aaaa
_08050ED8:
	ldr r0, [r5]
	adds r0, 0x6F
	movs r1, 0x3
	strb r1, [r0]
	bl sub_814A7FC
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1C
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r4, _08050F0C
	ldr r0, [r5]
	adds r0, 0x7A
	ldrh r0, [r0]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	ldr r0, _08050F10
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
	ldr r1, _08050F14
	b _08050F4C
	.align 2, 0
_08050F0C: .4byte 0x020234cc
_08050F10: .4byte 0x03002978
_08050F14: .4byte gUnknown_0842D461
_08050F18:
	ldr r1, [r5]
	adds r1, 0x6F
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl sub_814A7FC
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1C
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r4, _08050F60
	ldr r0, [r5]
	adds r0, 0x7A
	ldrh r0, [r0]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	ldr r0, _08050F64
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
	ldr r1, _08050F68
_08050F4C:
	adds r0, r4, 0
	bl StringAppend
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrintMessage
	b _080510C4
	.align 2, 0
_08050F60: .4byte 0x020234cc
_08050F64: .4byte 0x03002978
_08050F68: .4byte gUnknown_0842D434
_08050F6C:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _08050F78
	b _080510C4
_08050F78:
	ldr r0, _08050F88
	ldr r1, [r0]
	movs r0, 0x98
	lsls r0, 1
	adds r2, r1, r0
	movs r0, 0
	str r0, [r2]
	b _080510AC
	.align 2, 0
_08050F88: .4byte 0x03004854
_08050F8C:
	ldr r2, [r5]
	movs r0, 0x98
	lsls r0, 1
	adds r1, r2, r0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x3C
	bgt _08050FA0
	b _080510C4
_08050FA0:
	adds r1, r2, 0
_08050FA2:
	adds r1, 0x6F
	movs r0, 0x5
	strb r0, [r1]
	b _080510C4
_08050FAA:
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08050FCC
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	bl sub_80084A4
	ldr r0, _08050FD0
	ldr r1, [r0]
	b _080510AC
	.align 2, 0
_08050FCC: .4byte gUnknown_0842C328
_08050FD0: .4byte 0x03004854
_08050FD4:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080510C4
	ldr r3, _08051000
	ldr r1, [r3]
	movs r2, 0x98
	lsls r2, 1
	adds r0, r1, r2
	movs r2, 0
	str r2, [r0]
	adds r1, 0x6F
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r3]
	movs r1, 0xE2
	lsls r1, 1
	adds r0, r1
	str r2, [r0]
	b _080510C4
	.align 2, 0
_08051000: .4byte 0x03004854
_08051004:
	bl sub_8050CE8
	lsls r0, 24
	cmp r0, 0
	beq _080510C4
	movs r0, 0x37
	bl audio_play
	ldr r0, _0805101C
	ldr r1, [r0]
	b _080510AC
	.align 2, 0
_0805101C: .4byte 0x03004854
_08051020:
	ldr r1, [r5]
	adds r1, 0x6F
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl sub_80084A4
	b _080510C4
_08051030:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080510C4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08051050
	ldr r1, [r0]
	b _080510AC
	.align 2, 0
_08051050: .4byte 0x03004854
_08051054:
	ldr r0, _0805107C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	bne _080510C4
	ldr r2, [r5]
	adds r0, r2, 0
	adds r0, 0x70
	ldrh r1, [r0]
	ldr r0, _08051080
	cmp r1, r0
	bne _08051088
	ldr r0, _08051084
	bl SetMainCallback2
	b _080510C4
	.align 2, 0
_0805107C: .4byte 0x0202f388
_08051080: .4byte 0x00002222
_08051084: .4byte sub_804E538
_08051088:
	movs r1, 0x98
	lsls r1, 1
	adds r0, r2, r1
	str r3, [r0]
	adds r1, r2, 0
	b _080510AC
_08051094:
	ldr r1, [r5]
	movs r2, 0x98
	lsls r2, 1
	adds r1, r2
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x1E
	ble _080510C4
	bl sub_800832C
	ldr r1, [r5]
_080510AC:
	adds r1, 0x6F
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080510C4
_080510B6:
	ldr r0, _080510E0
	ldrb r0, [r0]
	cmp r0, 0
	bne _080510C4
	ldr r0, _080510E4
	bl SetMainCallback2
_080510C4:
	bl sub_805123C
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080510E0: .4byte 0x03002fa4
_080510E4: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_8050E30

	thumb_func_start sub_80510E8
sub_80510E8: @ 80510E8
	push {lr}
	ldr r1, _08051104
	ldr r0, [r1]
	adds r0, 0x6F
	ldrb r0, [r0]
	adds r3, r1, 0
	cmp r0, 0xA
	bls _080510FA
	b _0805121E
_080510FA:
	lsls r0, 2
	ldr r1, _08051108
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08051104: .4byte 0x03004854
_08051108: .4byte _0805110C
	.align 2, 0
_0805110C:
	.4byte _08051138
	.4byte _0805116E
	.4byte _08051190
	.4byte _080511BC
	.4byte _0805121E
	.4byte _0805121E
	.4byte _0805121E
	.4byte _0805121E
	.4byte _0805121E
	.4byte _080511D8
	.4byte _080511F0
_08051138:
	ldr r1, [r3]
	adds r0, r1, 0
	adds r0, 0x7C
	ldrh r0, [r0]
	cmp r0, 0x1
	bhi _0805114A
	adds r1, 0x6F
	movs r0, 0x9
	strb r0, [r1]
_0805114A:
	ldr r2, [r3]
	adds r0, r2, 0
	adds r0, 0x7C
	ldrh r1, [r0]
	cmp r1, 0x2
	bne _0805115A
	subs r0, 0xD
	strb r1, [r0]
_0805115A:
	ldr r1, [r3]
	adds r0, r1, 0
	adds r0, 0x7C
	ldrh r0, [r0]
	cmp r0, 0x3
	bne _0805121E
	adds r1, 0x6F
	movs r0, 0x1
	strb r0, [r1]
	b _0805121E
_0805116E:
	ldr r0, [r3]
	adds r0, 0x6F
	movs r1, 0x3
	strb r1, [r0]
	bl sub_814A7FC
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1C
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r0, _0805118C
	b _080511AC
	.align 2, 0
_0805118C: .4byte gUnknown_0842D41A
_08051190:
	ldr r0, [r3]
	adds r0, 0x6F
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	bl sub_814A7FC
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1C
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r0, _080511B8
_080511AC:
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrintMessage
	b _0805121E
	.align 2, 0
_080511B8: .4byte gUnknown_0842D3DC
_080511BC:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _0805121E
	ldr r0, _080511D4
	ldr r0, [r0]
	adds r0, 0x6F
	movs r1, 0x9
	strb r1, [r0]
	b _0805121E
	.align 2, 0
_080511D4: .4byte 0x03004854
_080511D8:
	movs r0, 0x3
	bl BeginFastPaletteFade
	ldr r0, _080511EC
	ldr r1, [r0]
	adds r1, 0x6F
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0805121E
	.align 2, 0
_080511EC: .4byte 0x03004854
_080511F0:
	ldr r0, _08051210
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0805121E
	ldr r0, [r3]
	adds r0, 0x7C
	ldrh r0, [r0]
	cmp r0, 0
	bne _08051218
	ldr r0, _08051214
	bl SetMainCallback2
	b _0805121E
	.align 2, 0
_08051210: .4byte 0x0202f388
_08051214: .4byte sub_804E538
_08051218:
	ldr r0, _08051238
	bl SetMainCallback2
_0805121E:
	bl sub_805123C
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
_08051238: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_80510E8

	thumb_func_start sub_805123C
sub_805123C: @ 805123C
	push {r4-r6,lr}
	ldr r0, _0805126C
	ldrb r0, [r0]
	cmp r0, 0
	bne _08051248
	b _08051404
_08051248:
	ldr r4, _08051270
	ldrh r1, [r4]
	ldr r0, _08051274
	cmp r1, r0
	bne _080512C6
	ldrh r1, [r4, 0x8]
	ldr r0, _08051278
	cmp r1, r0
	bne _080512B8
	ldrh r3, [r4, 0x10]
	ldr r0, _0805127C
	cmp r3, r0
	beq _08051298
	cmp r3, r0
	bgt _08051284
	ldr r0, _08051280
	b _08051286
	.align 2, 0
_0805126C: .4byte 0x03002fa4
_08051270: .4byte 0x03002a20
_08051274: .4byte 0x00002fff
_08051278: .4byte 0x00001111
_0805127C: .4byte 0x00009999
_08051280: .4byte 0x00008888
_08051284:
	ldr r0, _08051290
_08051286:
	cmp r3, r0
	beq _08051298
	ldr r2, _08051294
	b _080512A8
	.align 2, 0
_08051290: .4byte 0x0000aaaa
_08051294: .4byte 0x03004854
_08051298:
	ldr r2, _080512B0
	ldr r0, [r2]
	adds r1, r0, 0
	adds r1, 0x78
	strh r3, [r1]
	ldrh r1, [r4, 0x18]
	adds r0, 0x7A
	strh r1, [r0]
_080512A8:
	ldr r0, [r2]
	adds r0, 0x70
	ldr r1, _080512B4
	b _080512C4
	.align 2, 0
_080512B0: .4byte 0x03004854
_080512B4: .4byte 0x00001111
_080512B8:
	ldr r0, _080512F4
	cmp r1, r0
	bne _080512C6
	ldr r0, _080512F8
	ldr r0, [r0]
	adds r0, 0x70
_080512C4:
	strh r1, [r0]
_080512C6:
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	beq _080512D2
	b _08051404
_080512D2:
	ldr r2, _080512F8
	ldr r0, [r2]
	adds r0, 0x70
	ldrh r1, [r0]
	ldr r0, _080512FC
	cmp r1, r0
	bne _080512E2
	b _08051404
_080512E2:
	ldr r0, _080512F4
	cmp r1, r0
	bne _080512EA
	b _08051404
_080512EA:
	movs r4, 0
	ldr r6, _08051300
	adds r5, r2, 0
	b _0805134E
	.align 2, 0
_080512F4: .4byte 0x00002222
_080512F8: .4byte 0x03004854
_080512FC: .4byte 0x00001111
_08051300: .4byte 0x00002fff
_08051304:
	ldr r1, _08051328
	lsls r2, r4, 1
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, r6
	bne _08051348
	adds r0, r1, 0
	adds r0, 0x8
	adds r0, r2, r0
	ldrh r1, [r0]
	ldr r0, _0805132C
	cmp r1, r0
	beq _08051340
	cmp r1, r0
	bgt _08051334
	ldr r0, _08051330
	b _0805133C
	.align 2, 0
_08051328: .4byte 0x03002a20
_0805132C: .4byte 0x00008888
_08051330: .4byte 0x00007779
_08051334:
	ldr r0, _08051360
	cmp r1, r0
	beq _08051340
	ldr r0, _08051364
_0805133C:
	cmp r1, r0
	bne _08051348
_08051340:
	ldr r0, [r5]
	adds r0, 0x70
	adds r0, r2
	strh r1, [r0]
_08051348:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_0805134E:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _08051304
	movs r4, 0
	b _0805136E
	.align 2, 0
_08051360: .4byte 0x00009999
_08051364: .4byte 0x0000aaaa
_08051368:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_0805136E:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcs _0805138A
	ldr r0, _0805139C
	ldr r0, [r0]
	lsls r1, r4, 1
	adds r0, 0x70
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0
	bne _08051368
_0805138A:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _08051404
	movs r4, 0
	ldr r5, _080513A0
	b _080513AA
	.align 2, 0
_0805139C: .4byte 0x03004854
_080513A0: .4byte 0x00007779
_080513A4:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080513AA:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcs _080513C6
	ldr r0, _080513E0
	ldr r0, [r0]
	lsls r1, r4, 1
	adds r0, 0x70
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r5
	beq _080513A4
_080513C6:
	ldr r5, _080513E4
	movs r6, 0
	ldr r0, _080513E8
	strh r0, [r5]
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _080513F0
	ldr r0, _080513EC
	strh r0, [r5, 0x2]
	b _08051404
	.align 2, 0
_080513E0: .4byte 0x03004854
_080513E4: .4byte 0x03002f90
_080513E8: .4byte 0x00002fff
_080513EC: .4byte 0x00002222
_080513F0:
	ldr r0, _0805140C
	strh r0, [r5, 0x2]
	ldr r0, _08051410
	ldr r0, [r0]
	lsls r1, r4, 1
	adds r0, 0x70
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r5, 0x4]
	strh r4, [r5, 0x6]
_08051404:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805140C: .4byte 0x00001111
_08051410: .4byte 0x03004854
	thumb_func_end sub_805123C

	thumb_func_start sub_8051414
sub_8051414: @ 8051414
	push {lr}
	sub sp, 0x14
	adds r1, r0, 0
	movs r0, 0xF0
	lsls r0, 7
	str r0, [sp]
	movs r0, 0xA0
	lsls r0, 7
	str r0, [sp, 0x4]
	mov r3, sp
	ldr r0, _08051470
	ldr r0, [r0]
	mov r12, r0
	movs r0, 0xA2
	lsls r0, 1
	add r0, r12
	ldrh r2, [r0]
	movs r0, 0x78
	subs r0, r2
	strh r0, [r3, 0x8]
	movs r0, 0xA3
	lsls r0, 1
	add r0, r12
	ldrh r2, [r0]
	movs r0, 0x50
	subs r0, r2
	strh r0, [r3, 0xA]
	mov r2, sp
	movs r3, 0xA1
	lsls r3, 1
	add r3, r12
	ldrh r0, [r3]
	strh r0, [r2, 0xC]
	ldrh r0, [r3]
	strh r0, [r2, 0xE]
	mov r0, r12
	adds r0, 0x54
	ldrh r0, [r0]
	strh r0, [r2, 0x10]
	mov r0, sp
	movs r2, 0x1
	bl BgAffineSet
	add sp, 0x14
	pop {r0}
	bx r0
	.align 2, 0
_08051470: .4byte 0x03004854
	thumb_func_end sub_8051414

	thumb_func_start sub_8051474
sub_8051474: @ 8051474
	push {lr}
	ldr r0, _080514A0
	ldr r3, [r0]
	adds r1, r3, 0
	adds r1, 0x54
	ldrh r2, [r1]
	adds r0, r3, 0
	adds r0, 0x58
	strh r2, [r0]
	subs r0, 0x2
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r2
	strh r0, [r1]
	movs r1, 0xB4
	lsls r1, 1
	adds r0, r3, r1
	bl sub_8051414
	pop {r0}
	bx r0
	.align 2, 0
_080514A0: .4byte 0x03004854
	thumb_func_end sub_8051474

	thumb_func_start sub_80514A4
sub_80514A4: @ 80514A4
	ldr r1, _080514E8
	ldr r0, _080514EC
	ldr r2, [r0]
	movs r3, 0xB4
	lsls r3, 1
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	adds r3, 0x2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	adds r3, 0x2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	adds r3, 0x2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	adds r3, 0x2
	adds r0, r2, r3
	ldr r0, [r0]
	str r0, [r1]
	adds r1, 0x4
	adds r3, 0x4
	adds r0, r2, r3
	ldr r0, [r0]
	str r0, [r1]
	bx lr
	.align 2, 0
_080514E8: .4byte REG_BG2PA
_080514EC: .4byte 0x03004854
	thumb_func_end sub_80514A4

	thumb_func_start sub_80514F0
sub_80514F0: @ 80514F0
	ldr r1, _0805151C
	ldr r0, _08051520
	ldr r3, [r0]
	movs r0, 0xA2
	lsls r0, 1
	adds r2, r3, r0
	ldrh r0, [r2]
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0xA3
	lsls r0, 1
	adds r3, r0
	ldrh r0, [r3]
	strh r0, [r1]
	subs r1, 0x6
	ldrh r0, [r2]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r3]
	strh r0, [r1]
	bx lr
	.align 2, 0
_0805151C: .4byte REG_BG1HOFS
_08051520: .4byte 0x03004854
	thumb_func_end sub_80514F0

	thumb_func_start sub_8051524
sub_8051524: @ 8051524
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x32]
	adds r0, r1
	strh r0, [r2, 0x32]
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x34]
	adds r0, r1
	strh r0, [r2, 0x34]
	movs r1, 0x32
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bge _08051542
	adds r0, 0x7
_08051542:
	asrs r0, 3
	strh r0, [r2, 0x24]
	movs r1, 0x34
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bge _08051550
	adds r0, 0x7
_08051550:
	asrs r0, 3
	strh r0, [r2, 0x26]
	adds r0, r2, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08051568
	adds r0, r2, 0
	bl DestroySprite
_08051568:
	pop {r0}
	bx r0
	thumb_func_end sub_8051524

	thumb_func_start sub_805156C
sub_805156C: @ 805156C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	bl Random
	lsls r0, 16
	lsrs r1, r0, 16
	movs r0, 0x1
	ands r1, r0
	adds r0, r1, 0x1
	cmp r0, 0
	beq _08051628
	ldr r0, _08051638
	mov r9, r0
	ldr r2, _0805163C
	mov r10, r2
	adds r6, r1, 0x1
	movs r3, 0x1F
	mov r8, r3
	movs r7, 0x10
_08051598:
	bl Random
	ldr r1, _08051640
	ldr r4, [r1]
	adds r4, 0x54
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x14
	bl __umodsi3
	ldrh r1, [r4]
	adds r1, r0
	lsls r1, 16
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r2, r0, 16
	adds r0, r2, 0
	adds r0, 0x40
	lsls r0, 1
	add r0, r9
	movs r3, 0
	ldrsh r1, [r0, r3]
	cmp r1, 0
	bge _080515CC
	adds r1, 0x3
_080515CC:
	asrs r1, 2
	lsls r0, r2, 1
	add r0, r9
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bge _080515DC
	adds r0, 0x3
_080515DC:
	asrs r2, r0, 2
	adds r1, 0x78
	adds r2, 0x50
	ldr r0, _08051644
	movs r3, 0x1
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl Random
	lsls r5, r4, 4
	adds r5, r4
	lsls r5, 2
	mov r3, r10
	adds r4, r5, r3
	lsls r0, 16
	lsrs r0, 16
	mov r1, r8
	ands r0, r1
	subs r0, r7, r0
	strh r0, [r4, 0x2E]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	mov r2, r8
	ands r0, r2
	subs r0, r7, r0
	strh r0, [r4, 0x30]
	ldr r3, _08051648
	adds r5, r3
	ldr r0, _0805164C
	str r0, [r5]
	subs r6, 0x1
	cmp r6, 0
	bne _08051598
_08051628:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051638: .4byte gSineTable
_0805163C: .4byte 0x02020004
_08051640: .4byte 0x03004854
_08051644: .4byte gSpriteTemplate_82164FC
_08051648: .4byte 0x02020020
_0805164C: .4byte sub_8051524
	thumb_func_end sub_805156C

	thumb_func_start sub_8051650
sub_8051650: @ 8051650
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x3
	bl __divsi3
	negs r0, r0
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0805167C
	adds r0, r4, 0
	bl DestroySprite
_0805167C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8051650

	thumb_func_start sub_8051684
sub_8051684: @ 8051684
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	lsls r0, 1
	negs r0, r0
	strh r0, [r2, 0x26]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0xC
	negs r1, r1
	cmp r0, r1
	bge _080516A8
	ldr r0, _080516C0
	strh r0, [r2, 0x26]
_080516A8:
	adds r0, r2, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080516BC
	adds r0, r2, 0
	bl DestroySprite
_080516BC:
	pop {r0}
	bx r0
	.align 2, 0
_080516C0: .4byte 0x0000fff4
	thumb_func_end sub_8051684

	thumb_func_start sub_80516C4
sub_80516C4: @ 80516C4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _080516F4
	ldr r3, [r2]
	lsls r4, r0, 1
	adds r2, r3, 0
	adds r2, 0x80
	adds r2, r4
	strh r1, [r2]
	lsls r0, 4
	movs r2, 0xBE
	lsls r2, 1
	adds r0, r2
	adds r3, r0
	adds r0, r3, 0
	bl sub_804E844
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080516F4: .4byte 0x03004854
	thumb_func_end sub_80516C4

	thumb_func_start unref_sub_80516F8
unref_sub_80516F8: @ 80516F8
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080517B8
	adds r4, r0, r1
	ldr r6, _080517BC
	ldrb r0, [r6]
	cmp r0, 0
	beq _0805180C
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _080517D4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x78
	ble _08051730
	strh r1, [r4, 0x8]
_08051730:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x64
	bne _080517A0
	ldr r0, _080517C0
	ldr r0, [r0]
	adds r0, 0x4
	movs r1, 0x14
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl ZeroFillWindowRect
	movs r0, 0x4
	movs r1, 0x4
	movs r2, 0xA
	movs r3, 0xC
	bl MenuDrawTextWindow
	movs r2, 0
	ldr r6, _080517C4
_0805175C:
	adds r4, r2, 0x1
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	cmp r0, 0
	beq _08051784
	ldr r1, _080517C8
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r2, 25
	movs r1, 0xA0
	lsls r1, 19
	adds r2, r1
	lsrs r2, 24
	movs r1, 0x5
	bl MenuPrint
_08051784:
	movs r0, 0
	movs r1, 0xD
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _080517CC
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	adds r2, r4, 0
	cmp r2, 0x2
	ble _0805175C
_080517A0:
	ldr r0, _080517D0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0805180C
	bl sub_8007E4C
	adds r0, r5, 0
	bl DestroyTask
	b _0805180C
	.align 2, 0
_080517B8: .4byte 0x03004b20
_080517BC: .4byte 0x03002fa4
_080517C0: .4byte 0x03004854
_080517C4: .4byte 0x03002974
_080517C8: .4byte gUnknown_08216284
_080517CC: .4byte gUnknown_0842D373
_080517D0: .4byte 0x03001770
_080517D4:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0xA
	bne _080517E6
	ldr r0, _08051814
	movs r1, 0x3
	movs r2, 0xA
	bl MenuPrint
_080517E6:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x78
	ble _080517F8
	movs r0, 0
	strh r0, [r4, 0x8]
_080517F8:
	ldr r0, _08051818
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _0805180C
	ldrb r0, [r6]
	cmp r0, 0x1
	bne _0805180C
	adds r0, r5, 0
	bl DestroyTask
_0805180C:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08051814: .4byte gUnknown_0842D390
_08051818: .4byte 0x03002a68
	thumb_func_end unref_sub_80516F8

	thumb_func_start sub_805181C
sub_805181C: @ 805181C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08051858
	cmp r0, 0x1
	bgt _08051832
	cmp r0, 0
	beq _08051838
	b _080518BE
_08051832:
	cmp r0, 0x2
	beq _08051872
	b _080518BE
_08051838:
	ldrh r0, [r4, 0x30]
	adds r0, 0x8
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x58
	ble _080518BE
	movs r0, 0x58
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0x38
	bl audio_play
	b _080518BE
_08051858:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _080518BE
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0
	strh r0, [r4, 0x32]
	b _080518BE
_08051872:
	ldrh r0, [r4, 0x30]
	adds r0, 0x4
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB0
	ble _080518BE
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	adds r1, r0, 0
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080518AC
	adds r0, r4, 0
	bl DestroySprite
	ldr r0, _080518A8
	movs r2, 0x14
	negs r2, r2
	movs r1, 0x78
	movs r3, 0x2
	bl CreateSprite
	b _080518BE
	.align 2, 0
_080518A8: .4byte gSpriteTemplate_821657C
_080518AC:
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _080518C8
	strh r0, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
_080518BE:
	ldrh r0, [r4, 0x30]
	strh r0, [r4, 0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080518C8: .4byte 0x0000fff0
	thumb_func_end sub_805181C

	thumb_func_start sub_80518CC
sub_80518CC: @ 80518CC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08051908
	cmp r0, 0x1
	bgt _080518E2
	cmp r0, 0
	beq _080518E8
	b _0805193C
_080518E2:
	cmp r0, 0x2
	beq _0805191E
	b _0805193C
_080518E8:
	ldrh r0, [r4, 0x30]
	adds r0, 0x8
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5C
	ble _0805193C
	movs r0, 0x5C
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0x15
	bl audio_play
	b _0805193C
_08051908:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _0805193C
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _0805193C
_0805191E:
	ldrh r0, [r4, 0x30]
	adds r0, 0x4
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB0
	ble _0805193C
	ldr r0, _08051948
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	adds r0, r4, 0
	bl DestroySprite
_0805193C:
	ldrh r0, [r4, 0x30]
	strh r0, [r4, 0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08051948: .4byte 0x03004854
	thumb_func_end sub_80518CC

	thumb_func_start sub_805194C
sub_805194C: @ 805194C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r3, r1, 16
	ldr r1, _08051978
	ldr r1, [r1]
	movs r2, 0xA0
	lsls r2, 1
	adds r1, r2
	ldrh r2, [r1]
	cmp r2, r0
	bcs _08051972
	adds r0, r2, 0x2
	strh r0, [r1]
	ldrh r0, [r1]
	adds r1, r3, 0
	bl sub_805197C
_08051972:
	pop {r0}
	bx r0
	.align 2, 0
_08051978: .4byte 0x03004854
	thumb_func_end sub_805194C

	thumb_func_start sub_805197C
sub_805197C: @ 805197C
	push {r4-r7,lr}
	lsls r0, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r7, _08051A0C
	lsrs r0, 10
	bl __divsi3
	adds r1, r0, 0
	cmp r1, 0
	bge _08051994
	adds r0, r1, 0x7
_08051994:
	asrs r4, r0, 3
	movs r3, 0
	cmp r3, r4
	bge _080519BC
	ldr r0, _08051A10
	adds r6, r0, 0
	adds r0, 0x10
	adds r5, r0, 0
	adds r2, r7, 0
	adds r2, 0x56
	adds r0, r7, 0
	adds r3, r4, 0
_080519AC:
	strh r6, [r0, 0x16]
	strh r5, [r2]
	adds r2, 0x2
	adds r0, 0x2
	subs r3, 0x1
	cmp r3, 0
	bne _080519AC
	adds r3, r4, 0
_080519BC:
	adds r0, r1, 0
	cmp r1, 0
	bge _080519C4
	adds r0, r1, 0x7
_080519C4:
	asrs r2, r0, 3
	lsls r0, r2, 3
	subs r2, r1, r0
	cmp r2, 0
	beq _080519E2
	lsls r0, r3, 1
	adds r0, r7
	ldr r4, _08051A14
	adds r1, r2, r4
	strh r1, [r0, 0x16]
	adds r0, 0x56
	adds r4, 0x10
	adds r1, r2, r4
	strh r1, [r0]
	adds r3, 0x1
_080519E2:
	cmp r3, 0x7
	bgt _08051A06
	ldr r0, _08051A18
	adds r4, r0, 0
	adds r0, 0x10
	adds r2, r0, 0
	lsls r1, r3, 1
	adds r0, r1, 0
	adds r0, 0x56
	adds r0, r7
	adds r1, r7
_080519F8:
	strh r4, [r1, 0x16]
	strh r2, [r0]
	adds r0, 0x2
	adds r1, 0x2
	adds r3, 0x1
	cmp r3, 0x7
	ble _080519F8
_08051A06:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051A0C: .4byte 0x06006000
_08051A10: .4byte 0x000081e9
_08051A14: .4byte 0xffff81e1
_08051A18: .4byte 0x000081e1
	thumb_func_end sub_805197C

	thumb_func_start sub_8051A1C
sub_8051A1C: @ 8051A1C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08051A34
	muls r0, r1
	cmp r0, 0
	bge _08051A2E
	ldr r1, _08051A38
	adds r0, r1
_08051A2E:
	asrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_08051A34: .4byte 0x00057e40
_08051A38: .4byte 0x0000ffff
	thumb_func_end sub_8051A1C

	thumb_func_start sub_8051A3C
sub_8051A3C: @ 8051A3C
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 16
	lsrs r0, 16
	bl sub_8051A1C
	adds r5, r0, 0
	ldr r0, _08051ABC
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0x5A
	ldrh r0, [r1]
	cmp r0, r5
	bcs _08051A5A
	strh r5, [r1]
_08051A5A:
	movs r6, 0
_08051A5C:
	mov r0, sp
	adds r4, r0, r6
	adds r0, r5, 0
	movs r1, 0xA
	bl __umodsi3
	strb r0, [r4]
	adds r0, r5, 0
	movs r1, 0xA
	bl __udivsi3
	adds r5, r0, 0
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x4
	bls _08051A5C
	ldr r2, _08051AC0
	mov r0, sp
	ldr r3, _08051AC4
	adds r1, r3, 0
	ldrb r0, [r0, 0x4]
	adds r0, r1, r0
	strh r0, [r2]
	adds r2, 0x2
	mov r0, sp
	ldrb r0, [r0, 0x3]
	adds r0, r1
	strh r0, [r2]
	adds r2, 0x2
	mov r0, sp
	ldrb r0, [r0, 0x2]
	adds r0, r1
	strh r0, [r2]
	adds r2, 0x4
	mov r0, sp
	ldrb r0, [r0, 0x1]
	adds r0, r1
	strh r0, [r2]
	adds r2, 0x2
	mov r0, sp
	ldrb r0, [r0]
	adds r1, r0
	strh r1, [r2]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08051ABC: .4byte 0x03004854
_08051AC0: .4byte 0x06006458
_08051AC4: .4byte 0x00008172
	thumb_func_end sub_8051A3C

	thumb_func_start sub_8051AC8
sub_8051AC8: @ 8051AC8
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r4, r1, 16
	lsrs r5, r4, 16
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _08051AEC
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r5, 0
	bl __umodsi3
	lsrs r1, r4, 17
	subs r0, r1
	strh r0, [r6]
_08051AEC:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8051AC8

	thumb_func_start sub_8051AF4
sub_8051AF4: @ 8051AF4
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1]
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bge _08051B06
	adds r0, r2, 0x1
	strh r0, [r1]
_08051B06:
	ldrh r2, [r1]
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	ble _08051B14
	subs r0, r2, 0x1
	strh r0, [r1]
_08051B14:
	pop {r0}
	bx r0
	thumb_func_end sub_8051AF4

	thumb_func_start sub_8051B18
sub_8051B18: @ 8051B18
	push {r4,lr}
	ldr r4, _08051B3C
	ldr r0, [r4]
	movs r1, 0xA2
	lsls r1, 1
	adds r0, r1
	bl sub_8051AF4
	ldr r0, [r4]
	movs r1, 0xA3
	lsls r1, 1
	adds r0, r1
	bl sub_8051AF4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08051B3C: .4byte 0x03004854
	thumb_func_end sub_8051B18

	thumb_func_start sub_8051B40
sub_8051B40: @ 8051B40
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r1, 16
	movs r5, 0x8
	cmp r1, 0x9
	bhi _08051B50
	movs r5, 0x10
_08051B50:
	ldrh r0, [r4]
	movs r2, 0
	ldrsh r1, [r4, r2]
	cmp r1, 0
	bne _08051B6E
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r5, 0
	bl __modsi3
	lsrs r1, r5, 1
	subs r0, r1
	b _08051B82
_08051B6E:
	cmp r1, 0
	bge _08051B76
	adds r0, 0x1
	strh r0, [r4]
_08051B76:
	ldrh r1, [r4]
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _08051B84
	subs r0, r1, 0x1
_08051B82:
	strh r0, [r4]
_08051B84:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8051B40

	thumb_func_start sub_8051B8C
sub_8051B8C: @ 8051B8C
	push {r4,r5,lr}
	ldr r5, _08051BE4
	ldr r2, [r5]
	movs r4, 0x98
	lsls r4, 1
	adds r0, r2, r4
	ldr r1, [r0]
	cmp r1, 0
	bne _08051BAC
	movs r3, 0xA2
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	adds r3, 0x2
	adds r0, r2, r3
	strh r1, [r0]
_08051BAC:
	ldr r0, [r5]
	adds r2, r0, r4
	ldr r1, [r2]
	adds r1, 0x1
	str r1, [r2]
	movs r2, 0xA2
	lsls r2, 1
	adds r0, r2
	lsls r1, 16
	lsrs r1, 16
	bl sub_8051B40
	ldr r1, [r5]
	movs r3, 0xA3
	lsls r3, 1
	adds r0, r1, r3
	adds r1, r4
	ldrh r1, [r1]
	bl sub_8051B40
	ldr r2, [r5]
	adds r0, r2, r4
	ldr r0, [r0]
	cmp r0, 0x14
	beq _08051BE8
	movs r0, 0
	b _08051BFC
	.align 2, 0
_08051BE4: .4byte 0x03004854
_08051BE8:
	movs r1, 0xA2
	lsls r1, 1
	adds r0, r2, r1
	movs r1, 0
	strh r1, [r0]
	movs r3, 0xA3
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	movs r0, 0x1
_08051BFC:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8051B8C

	thumb_func_start sub_8051C04
sub_8051C04: @ 8051C04
	ldr r1, _08051C20
	ldr r2, [r1]
	movs r3, 0xA2
	lsls r3, 1
	adds r1, r2, r3
	ldrh r1, [r1]
	negs r1, r1
	strh r1, [r0, 0x24]
	adds r3, 0x2
	adds r1, r2, r3
	ldrh r1, [r1]
	negs r1, r1
	strh r1, [r0, 0x26]
	bx lr
	.align 2, 0
_08051C20: .4byte 0x03004854
	thumb_func_end sub_8051C04

	thumb_func_start sub_8051C24
sub_8051C24: @ 8051C24
	push {lr}
	ldr r2, _08051C4C
	ldr r0, _08051C50
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x88
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 1
	ldr r3, _08051C54
	adds r2, r3
	adds r2, r0, r2
	adds r1, 0x5A
	ldrh r1, [r1]
	ldrh r0, [r2]
	cmp r0, r1
	bcs _08051C48
	strh r1, [r2]
_08051C48:
	pop {r0}
	bx r0
	.align 2, 0
_08051C4C: .4byte 0x02025734
_08051C50: .4byte 0x03004854
_08051C54: .4byte 0x0000096c
	thumb_func_end sub_8051C24

	thumb_func_start sub_8051C58
sub_8051C58: @ 8051C58
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x34
	ldr r1, _08051C7C
	ldr r0, [r1]
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x6
	bls _08051C72
	b _0805200A
_08051C72:
	lsls r0, 2
	ldr r1, _08051C80
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08051C7C: .4byte 0x03004854
_08051C80: .4byte _08051C84
	.align 2, 0
_08051C84:
	.4byte _08051CA0
	.4byte _08051CB6
	.4byte _08051CD0
	.4byte _08051D20
	.4byte _08051F44
	.4byte _08051F58
	.4byte _08051FF8
_08051CA0:
	ldr r1, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	movs r1, 0x98
	lsls r1, 1
	adds r0, r1
	movs r1, 0x11
	str r1, [r0]
	b _0805200A
_08051CB6:
	ldr r1, [r2]
	movs r0, 0x98
	lsls r0, 1
	adds r2, r1, r0
	ldr r0, [r2]
	subs r0, 0xA
	str r0, [r2]
	cmp r0, 0
	blt _08051CCA
	b _0805200A
_08051CCA:
	movs r0, 0
	str r0, [r2]
	b _08051FE2
_08051CD0:
	ldr r1, [r2]
	movs r2, 0x98
	lsls r2, 1
	adds r1, r2
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x14
	bgt _08051CE4
	b _0805200A
_08051CE4:
	movs r6, 0
_08051CE6:
	ldr r4, _08051D18
	ldr r0, [r4]
	adds r0, 0x50
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08051D1C
	adds r0, r1
	bl DestroySprite
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x2
	bls _08051CE6
	ldr r1, [r4]
	movs r0, 0x98
	lsls r0, 1
	adds r2, r1, r0
	movs r0, 0
	str r0, [r2]
	b _08051FE2
	.align 2, 0
_08051D18: .4byte 0x03004854
_08051D1C: .4byte 0x02020004
_08051D20:
	movs r0, 0x4
	movs r1, 0x2
	movs r2, 0x19
	movs r3, 0x11
	bl MenuDrawTextWindow
	ldr r0, _08051F14
	movs r1, 0x5
	movs r2, 0x3
	movs r3, 0xA0
	bl sub_8072BD8
	movs r6, 0
	ldr r1, _08051F18
	ldr r0, [r1]
	adds r0, 0x88
	add r2, sp, 0xC
	mov r9, r2
	mov r2, sp
	adds r2, 0x16
	str r2, [sp, 0x30]
	ldrb r0, [r0]
	cmp r6, r0
	bcs _08051E04
	mov r8, r1
	ldr r0, _08051F1C
	mov r10, r0
_08051D56:
	mov r1, r8
	ldr r2, [r1]
	movs r1, 0xB2
	lsls r1, 1
	adds r0, r2, r1
	adds r0, r6
	ldrb r5, [r0]
	mov r7, r9
	lsls r1, r5, 4
	adds r1, r2
	movs r2, 0xBF
	lsls r2, 1
	adds r1, r2
	adds r0, r7, 0
	bl StringCopy
	lsls r4, r5, 3
	subs r4, r5
	lsls r4, 2
	mov r1, r10
	adds r0, r4, r1
	ldrb r1, [r0, 0x1A]
	adds r0, r7, 0
	bl ConvertInternationalString
	adds r0, r7, 0
	ldr r1, _08051F20
	bl StringAppend
	mov r2, r8
	ldr r0, [r2]
	adds r7, r0, 0
	adds r7, 0xAB
	adds r5, r6, 0x1
	adds r0, r7, 0
	adds r1, r5, 0
	bl ConvertIntToDecimalString
	adds r7, r0, 0
	movs r1, 0
	strb r1, [r7]
	movs r0, 0xAD
	strb r0, [r7, 0x1]
	strb r1, [r7, 0x2]
	adds r7, 0x3
	ldr r0, _08051F24
	adds r4, r0
	adds r0, r7, 0
	adds r1, r4, 0
	movs r2, 0x58
	movs r3, 0
	bl sub_8072C74
	adds r7, r0, 0
	add r1, sp, 0xC
	movs r2, 0x9D
	movs r3, 0
	bl sub_8072C74
	mov r2, r8
	ldr r1, [r2]
	adds r0, r1, 0
	adds r0, 0xAB
	ldr r3, _08051F28
	adds r1, 0x88
	ldrb r2, [r1]
	adds r3, r2, r3
	ldr r1, _08051F2C
	adds r2, r1
	ldrb r1, [r2]
	adds r2, r6, 0
	muls r2, r1
	ldrb r3, [r3]
	adds r2, r3
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x5
	bl MenuPrint
	lsls r5, 16
	lsrs r6, r5, 16
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0x88
	ldrb r0, [r0]
	cmp r6, r0
	bcc _08051D56
_08051E04:
	ldr r6, _08051F18
	ldr r0, [r6]
	adds r0, 0x5A
	ldrh r0, [r0]
	movs r1, 0x64
	bl __umodsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r0, r9
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, [r6]
	adds r7, r0, 0
	adds r7, 0xAB
	ldr r1, _08051F30
	adds r0, r7, 0
	bl StringCopy
	adds r7, r0, 0
	ldr r0, [r6]
	adds r0, 0x5A
	ldrh r0, [r0]
	movs r1, 0x64
	bl __udivsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r7, 0
	movs r2, 0x79
	movs r3, 0x1
	bl sub_8072C14
	adds r7, r0, 0
	movs r1, 0
	strb r1, [r7]
	movs r0, 0xAD
	strb r0, [r7, 0x1]
	strb r1, [r7, 0x2]
	adds r7, 0x3
	adds r0, r7, 0
	mov r1, r9
	movs r2, 0x8E
	movs r3, 0x1
	bl sub_8072C74
	adds r7, r0, 0
	ldr r1, _08051F34
	bl StringCopy
	ldr r0, [r6]
	adds r0, 0xAB
	movs r1, 0x5
	movs r2, 0xD
	bl MenuPrint
	ldr r0, [r6]
	movs r2, 0x96
	lsls r2, 1
	adds r0, r2
	ldr r0, [r0]
	movs r1, 0x3C
	bl __udivsi3
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	movs r1, 0x3C
	bl __umodsi3
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	movs r1, 0x3C
	bl __udivsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r0, r9
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, [sp, 0x30]
	adds r1, r5, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, [r6]
	adds r7, r0, 0
	adds r7, 0xAB
	ldr r1, _08051F38
	adds r0, r7, 0
	bl StringCopy
	adds r7, r0, 0
	mov r1, r9
	movs r2, 0x66
	movs r3, 0x1
	bl sub_8072C74
	adds r7, r0, 0
	ldr r1, _08051F3C
	bl StringAppend
	adds r7, r0, 0
	ldr r1, [sp, 0x30]
	movs r2, 0x88
	movs r3, 0x1
	bl sub_8072C74
	adds r7, r0, 0
	ldr r1, _08051F40
	bl StringCopy
	ldr r0, [r6]
	adds r0, 0xAB
	movs r1, 0x5
	movs r2, 0xF
	bl MenuPrint
	ldr r1, [r6]
	movs r0, 0x98
	lsls r0, 1
	adds r2, r1, r0
	movs r0, 0
	str r0, [r2]
	b _08051FE2
	.align 2, 0
_08051F14: .4byte gUnknown_0842D479
_08051F18: .4byte 0x03004854
_08051F1C: .4byte 0x03002970
_08051F20: .4byte gUnknown_0842D498
_08051F24: .4byte 0x03002978
_08051F28: .4byte gUnknown_082165E9
_08051F2C: .4byte gUnknown_082165EE
_08051F30: .4byte gUnknown_0842D4B7
_08051F34: .4byte gUnknown_0842D4C5
_08051F38: .4byte gUnknown_0842D49F
_08051F3C: .4byte gUnknown_0842D4AD
_08051F40: .4byte gUnknown_0842D4B2
_08051F44:
	ldr r0, _08051F54
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0805200A
	ldr r1, [r2]
	b _08051FE2
	.align 2, 0
_08051F54: .4byte 0x03001770
_08051F58:
	bl MenuZeroFillScreen
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	movs r6, 0
	add r5, sp, 0x28
	ldr r0, _08051FEC
	ldr r0, [r0]
	adds r3, r0, 0
	adds r3, 0x80
	add r2, sp, 0x20
_08051F76:
	lsls r1, r6, 1
	adds r0, r3, r1
	ldrh r0, [r0]
	cmp r0, 0
	beq _08051F86
	adds r1, r2, r1
	subs r0, 0x85
	strh r0, [r1]
_08051F86:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bls _08051F76
	bl sub_8050760
	ldr r4, _08051FEC
	ldr r3, [r4]
	movs r1, 0xBE
	lsls r1, 1
	adds r0, r3, r1
	adds r1, r3, 0
	adds r1, 0x88
	ldrb r2, [r1]
	subs r1, 0x2E
	ldrh r1, [r1]
	str r1, [sp]
	adds r1, r5, 0
	add r3, sp, 0x4
	bl sub_8050520
	ldr r1, [r4]
	adds r1, 0xAB
	adds r0, r5, 0
	bl sub_805201C
	ldr r0, _08051FF0
	movs r1, 0x6
	bl CreateTask
	ldr r0, [r4]
	adds r0, 0xAB
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrintMessage
	ldr r0, _08051FF4
	ldrh r0, [r0]
	movs r1, 0x1
	bl sub_80A9538
	adds r0, r5, 0
	bl sub_810CA34
	ldr r1, [r4]
_08051FE2:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0805200A
	.align 2, 0
_08051FEC: .4byte 0x03004854
_08051FF0: .4byte sub_8052BD0
_08051FF4: .4byte 0x0203855e
_08051FF8:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _0805200A
	bl sub_8051C24
	movs r0, 0x1
	b _0805200C
_0805200A:
	movs r0, 0
_0805200C:
	add sp, 0x34
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8051C58

	thumb_func_start sub_805201C
sub_805201C: @ 805201C
	push {r4-r6,lr}
	sub sp, 0xC
	adds r5, r0, 0
	adds r6, r1, 0
	movs r0, 0xFF
	strb r0, [r6]
	ldr r1, _080520B0
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r6, 0
	bl StringCopy
	ldr r1, _080520B4
	adds r0, r6, 0
	bl StringAppend
	ldr r1, _080520B8
	adds r0, r6, 0
	bl StringAppend
	adds r0, r5, 0
	bl sub_810C9B0
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl sub_810C9E8
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _080520BC
	adds r0, r6, 0
	bl StringAppend
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r0, r6, 0
	mov r1, sp
	bl StringAppend
	ldr r1, _080520C0
	adds r0, r6, 0
	bl StringAppend
	mov r0, sp
	adds r1, r5, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r0, r6, 0
	mov r1, sp
	bl StringAppend
	ldr r1, _080520C4
	adds r0, r6, 0
	bl StringAppend
	ldr r1, _080520C8
	adds r0, r6, 0
	bl StringAppend
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080520B0: .4byte gUnknown_083F7EB8
_080520B4: .4byte gUnknown_0842D368
_080520B8: .4byte gUnknown_082162C8
_080520BC: .4byte gUnknown_0842D4D3
_080520C0: .4byte gUnknown_0842D4E1
_080520C4: .4byte gUnknown_0842D4F4
_080520C8: .4byte gUnknown_08216249
	thumb_func_end sub_805201C

	thumb_func_start sub_80520CC
sub_80520CC: @ 80520CC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r0
	mov r12, r2
	lsls r1, 24
	lsrs r7, r1, 24
	movs r0, 0
	cmp r0, r7
	bge _08052118
_080520E2:
	movs r5, 0
	adds r1, r0, 0x1
	mov r8, r1
	cmp r5, r7
	bge _08052112
	mov r1, r9
	adds r6, r1, r0
_080520F0:
	ldrb r4, [r6]
	lsls r1, r4, 2
	add r1, r12
	mov r0, r9
	adds r2, r0, r5
	ldrb r3, [r2]
	lsls r0, r3, 2
	add r0, r12
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	bls _0805210C
	strb r3, [r6]
	strb r4, [r2]
_0805210C:
	adds r5, 0x1
	cmp r5, r7
	blt _080520F0
_08052112:
	mov r0, r8
	cmp r0, r7
	blt _080520E2
_08052118:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80520CC

	thumb_func_start sub_8052124
sub_8052124: @ 8052124
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	movs r5, 0
	ldr r1, _08052144
	ldr r0, [r1]
	adds r0, 0x88
	mov r10, r1
	mov r2, sp
	adds r2, 0x4
	str r2, [sp, 0x14]
	b _08052158
	.align 2, 0
_08052144: .4byte 0x03004854
_08052148:
	mov r4, sp
	adds r0, r4, r5
	strb r5, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, [r1]
	adds r0, 0x88
_08052158:
	ldrb r0, [r0]
	cmp r5, r0
	bcc _08052148
	movs r5, 0
	mov r1, r10
	ldr r0, [r1]
	adds r1, r0, 0
	adds r1, 0x88
	ldrb r2, [r1]
	cmp r5, r2
	bcs _080521D6
	ldr r4, [sp, 0x14]
	mov r9, r4
	movs r2, 0xA6
	lsls r2, 1
	adds r2, r0
	mov r8, r2
	mov r12, r1
	movs r4, 0xA7
	lsls r4, 1
	adds r7, r0, r4
	movs r1, 0xA8
	lsls r1, 1
	adds r6, r0, r1
_08052188:
	lsls r4, r5, 2
	add r4, r9
	lsls r3, r5, 1
	adds r3, r5
	lsls r3, 1
	mov r2, r8
	adds r0, r2, r3
	ldrh r2, [r0]
	lsls r0, r2, 5
	subs r0, r2
	lsls r1, r0, 6
	subs r1, r0
	lsls r1, 3
	adds r1, r2
	lsls r1, 6
	str r1, [r4]
	adds r0, r7, r3
	ldrh r2, [r0]
	lsls r0, r2, 5
	subs r0, r2
	lsls r0, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	str r1, [r4]
	movs r0, 0xFA
	lsls r0, 2
	adds r1, r0
	adds r3, r6, r3
	ldrh r0, [r3]
	subs r1, r0
	str r1, [r4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r1, r12
	ldrb r1, [r1]
	cmp r5, r1
	bcc _08052188
_080521D6:
	mov r2, r10
	ldr r0, [r2]
	adds r0, 0x88
	ldrb r1, [r0]
	mov r0, sp
	ldr r2, [sp, 0x14]
	bl sub_80520CC
	movs r5, 0
	mov r4, r10
	ldr r0, [r4]
	adds r0, 0x88
	ldrb r0, [r0]
	cmp r5, r0
	bcs _08052218
	mov r2, r10
	movs r3, 0xB2
	lsls r3, 1
_080521FA:
	ldr r1, [r2]
	adds r1, r3
	adds r1, r5
	mov r4, sp
	adds r0, r4, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, [r2]
	adds r0, 0x88
	ldrb r0, [r0]
	cmp r5, r0
	bcc _080521FA
_08052218:
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8052124

	thumb_func_start sub_8052228
sub_8052228: @ 8052228
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r1, _08052248
	ldr r0, [r1]
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x6
	bls _0805223C
	b _080524AE
_0805223C:
	lsls r0, 2
	ldr r1, _0805224C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08052248: .4byte 0x03004854
_0805224C: .4byte _08052250
	.align 2, 0
_08052250:
	.4byte _0805226C
	.4byte _08052282
	.4byte _0805229C
	.4byte _080522B6
	.4byte _08052464
	.4byte _0805247E
	.4byte _080524A4
_0805226C:
	ldr r1, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	movs r1, 0x98
	lsls r1, 1
	adds r0, r1
	movs r1, 0xFF
	str r1, [r0]
	b _080524AE
_08052282:
	ldr r1, [r2]
	movs r0, 0x98
	lsls r0, 1
	adds r2, r1, r0
	ldr r0, [r2]
	subs r0, 0xA
	str r0, [r2]
	cmp r0, 0
	blt _08052296
	b _080524AE
_08052296:
	movs r0, 0
	str r0, [r2]
	b _08052494
_0805229C:
	ldr r1, [r2]
	movs r0, 0x98
	lsls r0, 1
	adds r2, r1, r0
	ldr r0, [r2]
	adds r0, 0x1
	str r0, [r2]
	cmp r0, 0x14
	bgt _080522B0
	b _080524AE
_080522B0:
	movs r0, 0
	str r0, [r2]
	b _08052494
_080522B6:
	movs r0, 0x4
	movs r1, 0x2
	movs r2, 0x19
	movs r3, 0x11
	bl MenuDrawTextWindow
	ldr r0, _0805236C
	movs r1, 0x5
	movs r2, 0x3
	movs r3, 0xA0
	bl sub_8072BD8
	ldr r6, _08052370
	adds r0, r6, 0
	movs r1, 0x8C
	movs r2, 0x34
	movs r3, 0
	bl CreateSprite
	ldr r7, _08052374
	ldr r1, [r7]
	adds r1, 0x50
	strb r0, [r1]
	ldr r1, _08052378
	mov r8, r1
	ldr r2, [r7]
	adds r2, 0x50
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	mov r5, r8
	adds r5, 0x1C
	adds r0, r5
	ldr r4, _0805237C
	str r4, [r0]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	movs r1, 0x3
	bl StartSpriteAnim
	adds r0, r6, 0
	movs r1, 0xA4
	movs r2, 0x34
	movs r3, 0
	bl CreateSprite
	ldr r1, [r7]
	adds r1, 0x51
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, 0x51
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	str r4, [r0]
	adds r0, r6, 0
	movs r1, 0xBC
	movs r2, 0x34
	movs r3, 0
	bl CreateSprite
	ldr r1, [r7]
	adds r1, 0x52
	strb r0, [r1]
	ldr r2, [r7]
	adds r2, 0x52
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	str r4, [r0]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	movs r1, 0x1
	bl StartSpriteAnim
	bl sub_8052124
	movs r2, 0
	mov r8, r2
	b _0805243C
	.align 2, 0
_0805236C: .4byte gUnknown_0842D4CB
_08052370: .4byte gSpriteTemplate_821645C
_08052374: .4byte 0x03004854
_08052378: .4byte 0x02020004
_0805237C: .4byte SpriteCallbackDummy
_08052380:
	ldr r1, [r7]
	movs r2, 0xB2
	lsls r2, 1
	adds r0, r1, r2
	add r0, r8
	ldrb r5, [r0]
	adds r2, r1, 0
	adds r2, 0xAB
	movs r0, 0xFC
	strb r0, [r2]
	movs r0, 0x13
	strb r0, [r2, 0x1]
	movs r0, 0x4
	strb r0, [r2, 0x2]
	adds r2, 0x3
	mov r6, r8
	adds r6, 0x1
	adds r0, r2, 0
	adds r1, r6, 0
	bl ConvertIntToDecimalString
	adds r2, r0, 0
	movs r1, 0
	strb r1, [r2]
	movs r0, 0xAD
	strb r0, [r2, 0x1]
	strb r1, [r2, 0x2]
	adds r2, 0x3
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	ldr r0, _08052458
	adds r1, r0
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	ldr r0, [r7]
	lsls r4, r5, 1
	adds r4, r5
	lsls r4, 1
	movs r1, 0xA6
	lsls r1, 1
	adds r0, r1
	adds r0, r4
	ldrh r1, [r0]
	adds r0, r2, 0
	movs r2, 0x6C
	movs r3, 0x1
	bl sub_8072C14
	adds r2, r0, 0
	ldr r0, [r7]
	movs r1, 0xA7
	lsls r1, 1
	adds r0, r1
	adds r0, r4
	ldrh r1, [r0]
	adds r0, r2, 0
	movs r2, 0x84
	movs r3, 0x1
	bl sub_8072C14
	adds r2, r0, 0
	ldr r0, [r7]
	movs r1, 0xA8
	lsls r1, 1
	adds r0, r1
	adds r0, r4
	ldrh r1, [r0]
	adds r0, r2, 0
	movs r2, 0x9C
	movs r3, 0x1
	bl sub_8072C14
	ldr r1, [r7]
	adds r0, r1, 0
	adds r0, 0xAB
	ldr r2, _0805245C
	adds r1, 0x88
	ldrb r1, [r1]
	adds r1, r2
	ldrb r1, [r1]
	mov r2, r8
	muls r2, r1
	adds r2, 0x8
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x5
	bl MenuPrint
	lsls r6, 16
	lsrs r6, 16
	mov r8, r6
_0805243C:
	ldr r0, [r7]
	adds r0, 0x88
	ldrb r0, [r0]
	cmp r8, r0
	bcc _08052380
	ldr r0, _08052460
	ldr r1, [r0]
	movs r0, 0x98
	lsls r0, 1
	adds r2, r1, r0
	movs r0, 0
	str r0, [r2]
	b _08052494
	.align 2, 0
_08052458: .4byte 0x03002978
_0805245C: .4byte gUnknown_082165F3
_08052460: .4byte 0x03004854
_08052464:
	ldr r2, [r2]
	movs r0, 0x98
	lsls r0, 1
	adds r1, r2, r0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x14
	ble _080524AE
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	b _080524AE
_0805247E:
	ldr r0, _0805249C
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080524AE
	movs r0, 0x5
	bl audio_play
	ldr r0, _080524A0
	ldr r1, [r0]
_08052494:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080524AE
	.align 2, 0
_0805249C: .4byte 0x03001770
_080524A0: .4byte 0x03004854
_080524A4:
	ldr r1, [r2]
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	b _080524B0
_080524AE:
	movs r0, 0
_080524B0:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8052228

	thumb_func_start unref_sub_80524BC
unref_sub_80524BC: @ 80524BC
	push {r4,lr}
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r0, _0805251C
	bl SetVBlankCallback
	ldr r4, _08052520
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindowConfig
	ldr r0, _08052524
	ldrh r0, [r0, 0x20]
	bl SeedRng
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xAA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	ldr r1, _08052528
	movs r0, 0xFA
	lsls r0, 5
	strh r0, [r1, 0x1A]
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	ldr r0, _0805252C
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805251C: .4byte sub_804E2D8
_08052520: .4byte gWindowConfig_81E6CE4
_08052524: .4byte 0x03001770
_08052528: .4byte 0x03000560
_0805252C: .4byte sub_8052AF8
	thumb_func_end unref_sub_80524BC

	thumb_func_start sub_8052530
sub_8052530: @ 8052530
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x98
	ldr r1, _080525C8
	mov r0, sp
	bl StringCopy
	mov r0, sp
	movs r1, 0x2
	movs r2, 0
	bl MenuPrint
	ldr r4, _080525CC
	movs r1, 0x1A
	ldrsh r0, [r4, r1]
	movs r1, 0x64
	bl __divsi3
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	mov r0, sp
	movs r2, 0x2
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	mov r0, sp
	movs r1, 0x6
	movs r2, 0
	bl MenuPrint
	movs r6, 0
	mov r2, sp
	adds r2, 0x3
	str r2, [sp, 0x84]
	mov r3, sp
	adds r3, 0x6
	str r3, [sp, 0x88]
	mov r0, sp
	adds r0, 0x9
	str r0, [sp, 0x8C]
	mov r1, sp
	adds r1, 0xC
	str r1, [sp, 0x90]
	adds r2, 0xC
	str r2, [sp, 0x94]
	mov r8, r4
	mov r7, sp
	ldr r3, _080525D0
	mov r9, r3
	ldr r0, _080525D4
	mov r10, r0
_0805259E:
	mov r1, r8
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, r6
	bne _080525D8
	movs r0, 0xEF
	strb r0, [r7]
	mov r0, r8
	adds r0, 0x1
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, 0x85
	lsls r0, 16
	lsrs r0, 16
	mov r1, sp
	adds r1, 0x1
	bl itemid_copy_name
	b _080525F8
	.align 2, 0
_080525C8: .4byte gUnknown_082165FA
_080525CC: .4byte 0x03000560
_080525D0: .4byte gBerries
_080525D4: .4byte gUnknown_082165F8
_080525D8:
	mov r0, r8
	adds r0, 0x1
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, 0x85
	lsls r0, 16
	lsrs r0, 16
	mov r1, sp
	bl itemid_copy_name
	movs r0, 0
	strb r0, [r7, 0x6]
	movs r0, 0xFF
	strb r0, [r7, 0x7]
_080525F8:
	lsls r5, r6, 1
	adds r5, r6
	adds r5, 0x3
	lsls r5, 24
	lsrs r5, 24
	mov r0, sp
	movs r1, 0x2
	adds r2, r5, 0
	bl MenuPrint
	mov r4, r8
	adds r4, 0x1
	adds r4, r6, r4
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r1, [r0, 0x15]
	mov r0, sp
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	mov r0, sp
	mov r1, r10
	bl StringAppend
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r1, [r0, 0x16]
	ldr r0, [sp, 0x84]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	mov r0, sp
	mov r1, r10
	bl StringAppend
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r1, [r0, 0x17]
	ldr r0, [sp, 0x88]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	mov r0, sp
	mov r1, r10
	bl StringAppend
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r1, [r0, 0x18]
	ldr r0, [sp, 0x8C]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	mov r0, sp
	mov r1, r10
	bl StringAppend
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r1, [r0, 0x19]
	ldr r0, [sp, 0x90]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	mov r0, sp
	mov r1, r10
	bl StringAppend
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r1, [r0, 0x1A]
	ldr r0, [sp, 0x94]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	movs r2, 0x1
	negs r2, r2
	add r3, sp, 0x80
	strb r2, [r3]
	movs r0, 0xFF
	strb r0, [r7, 0x11]
	mov r0, sp
	movs r1, 0x7
	adds r2, r5, 0
	bl MenuPrint
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bhi _080526EC
	b _0805259E
_080526EC:
	mov r1, r8
	ldrb r0, [r1, 0x8]
	cmp r0, 0
	beq _080527A4
	ldr r1, _080527B4
	mov r2, r8
	ldrb r0, [r2, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	mov r0, sp
	bl StringCopy
	mov r0, sp
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	mov r3, r8
	ldrb r1, [r3, 0x11]
	mov r0, sp
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	ldr r4, _080527B8
	mov r0, sp
	adds r1, r4, 0
	bl StringAppend
	mov r0, r8
	ldrb r1, [r0, 0x12]
	ldr r0, [sp, 0x84]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	mov r0, sp
	adds r1, r4, 0
	bl StringAppend
	mov r2, r8
	ldrb r1, [r2, 0x13]
	ldr r0, [sp, 0x88]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	mov r0, sp
	adds r1, r4, 0
	bl StringAppend
	mov r3, r8
	ldrb r1, [r3, 0x14]
	ldr r0, [sp, 0x8C]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	mov r0, sp
	adds r1, r4, 0
	bl StringAppend
	mov r0, r8
	ldrb r1, [r0, 0x15]
	ldr r0, [sp, 0x90]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	mov r0, sp
	adds r1, r4, 0
	bl StringAppend
	mov r2, r8
	ldrb r1, [r2, 0x16]
	ldr r0, [sp, 0x94]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	mov r1, sp
	ldrb r0, [r1, 0x11]
	add r3, sp, 0x80
	ldrb r3, [r3]
	orrs r0, r3
	strb r0, [r1, 0x11]
	mov r0, sp
	movs r1, 0x7
	movs r2, 0x11
	bl MenuPrint
_080527A4:
	add sp, 0x98
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080527B4: .4byte gUnknown_083F7EB8
_080527B8: .4byte gUnknown_082165F8
	thumb_func_end sub_8052530

	thumb_func_start sub_80527BC
sub_80527BC: @ 80527BC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x58
	ldr r0, _08052844
	ldrb r0, [r0]
	add r6, sp, 0x48
	cmp r0, 0x1
	bne _08052814
	movs r1, 0
	ldr r3, _08052848
	movs r2, 0
_080527D6:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x9
	bls _080527D6
	bl Random
	ldr r1, _0805284C
	strh r0, [r1]
	ldr r1, _08052850
	movs r0, 0
	str r0, [r1]
	ldr r1, _08052844
	movs r0, 0x2
	strb r0, [r1]
	movs r4, 0
	ldr r2, _08052854
	movs r1, 0
_08052800:
	adds r0, r4, r2
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xC7
	bls _08052800
	ldr r1, _08052858
	movs r0, 0
	strb r0, [r1]
_08052814:
	movs r4, 0
	movs r0, 0x1
	mov r8, r0
	ldr r7, _08052858
	ldr r5, _08052850
	ldr r1, _08052854
	mov r9, r1
	ldr r3, _0805285C
_08052824:
	str r3, [sp, 0x54]
	bl Random
	lsls r0, 16
	lsrs r0, 31
	mov r1, r8
	ands r0, r1
	ldr r3, [sp, 0x54]
	ldrb r1, [r7]
	cmp r0, r1
	bne _08052860
	ldr r0, [r5]
	adds r0, 0x1
	str r0, [r5]
	b _0805287A
	.align 2, 0
_08052844: .4byte 0x020297dc
_08052848: .4byte 0x03004840
_0805284C: .4byte 0x03004830
_08052850: .4byte 0x020297e0
_08052854: .4byte 0x02000000
_08052858: .4byte 0x020297e8
_0805285C: .4byte 0x020297e4
_08052860:
	ldr r2, [r3]
	lsls r0, r2, 1
	add r0, r9
	ldr r1, [r5]
	strh r1, [r0]
	adds r2, 0x1
	str r2, [r3]
	movs r0, 0
	str r0, [r5]
	ldrb r0, [r7]
	mov r1, r8
	eors r0, r1
	strb r0, [r7]
_0805287A:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x63
	bls _08052824
	mov r1, sp
	movs r0, 0xFF
	strb r0, [r1]
	ldr r0, _08052900
	ldrh r1, [r0]
	adds r0, r6, 0
	movs r2, 0x2
	movs r3, 0x8
	bl ConvertIntToHexStringN
	mov r0, sp
	adds r1, r6, 0
	bl StringAppend
	ldr r1, _08052904
	mov r0, sp
	bl StringAppend
	ldr r0, _08052908
	ldr r1, [r0]
	adds r0, r6, 0
	movs r2, 0x2
	movs r3, 0x8
	bl ConvertIntToHexStringN
	mov r0, sp
	adds r1, r6, 0
	bl StringAppend
	ldr r1, _0805290C
	mov r0, sp
	bl StringAppend
	ldr r4, _08052910
	ldrb r0, [r4]
	cmp r0, 0x3
	bne _080528E8
	ldr r0, _08052914
	ldr r1, [r0]
	adds r0, r6, 0
	movs r2, 0x2
	movs r3, 0x10
	bl ConvertIntToHexStringN
	mov r0, sp
	adds r1, r6, 0
	bl StringAppend
	movs r0, 0
	strb r0, [r4]
_080528E8:
	mov r0, sp
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	add sp, 0x58
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052900: .4byte 0x03004830
_08052904: .4byte gUnknown_082165F8
_08052908: .4byte 0x020297e0
_0805290C: .4byte gUnknown_08216600
_08052910: .4byte 0x020297dc
_08052914: .4byte 0x020297e4
	thumb_func_end sub_80527BC

	thumb_func_start sub_8052918
sub_8052918: @ 8052918
	push {r4-r6,lr}
	sub sp, 0x4C
	ldr r2, _08052A88
	ldrh r1, [r2, 0x2E]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	ldr r4, _08052A8C
	cmp r0, 0
	beq _0805294C
	movs r1, 0xFA
	lsls r1, 2
	adds r0, r1, 0
	ldrh r1, [r4, 0x1A]
	adds r0, r1
	strh r0, [r4, 0x1A]
	lsls r0, 16
	ldr r1, _08052A90
	cmp r0, r1
	ble _08052946
	movs r0, 0xFA
	lsls r0, 2
	strh r0, [r4, 0x1A]
_08052946:
	ldrb r0, [r4, 0x10]
	adds r0, 0x1
	strb r0, [r4, 0x10]
_0805294C:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _08052972
	ldr r1, _08052A94
	adds r0, r1, 0
	ldrh r1, [r4, 0x1A]
	adds r0, r1
	strh r0, [r4, 0x1A]
	lsls r0, 16
	cmp r0, 0
	bge _0805296C
	ldr r0, _08052A98
	strh r0, [r4, 0x1A]
_0805296C:
	ldrb r0, [r4, 0x10]
	adds r0, 0x1
	strb r0, [r4, 0x10]
_08052972:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08052992
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	lsls r0, 24
	cmp r0, 0
	bge _0805298C
	movs r0, 0x3
	strb r0, [r4]
_0805298C:
	ldrb r0, [r4, 0x10]
	adds r0, 0x1
	strb r0, [r4, 0x10]
_08052992:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080529B4
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _080529AE
	movs r0, 0
	strb r0, [r4]
_080529AE:
	ldrb r0, [r4, 0x10]
	adds r0, 0x1
	strb r0, [r4, 0x10]
_080529B4:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080529E4
	adds r3, r4, 0
	movs r1, 0
	ldrsb r1, [r3, r1]
	adds r5, r3, 0x1
	adds r1, r5
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bge _080529DE
	movs r0, 0
	ldrsb r0, [r3, r0]
	adds r0, r5
	movs r1, 0x2A
	strb r1, [r0]
_080529DE:
	ldrb r0, [r4, 0x10]
	adds r0, 0x1
	strb r0, [r4, 0x10]
_080529E4:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08052A16
	ldr r3, _08052A8C
	movs r1, 0
	ldrsb r1, [r3, r1]
	adds r4, r3, 0x1
	adds r1, r4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x2A
	ble _08052A10
	movs r0, 0
	ldrsb r0, [r3, r0]
	adds r0, r4
	movs r1, 0
	strb r1, [r0]
_08052A10:
	ldrb r0, [r3, 0x10]
	adds r0, 0x1
	strb r0, [r3, 0x10]
_08052A16:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08052AA0
	movs r6, 0
	movs r4, 0
	ldr r5, _08052A8C
_08052A26:
	adds r0, r5, 0x1
	adds r2, r4, r0
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r0, 0x2A
	beq _08052A64
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r0, r4, 1
	mov r1, sp
	adds r1, r0
	adds r1, 0x4
	movs r0, 0
	ldrsb r0, [r2, r0]
	strh r0, [r1]
	add r0, sp, 0xC
	lsls r1, r4, 4
	adds r0, r1
	movs r1, 0
	ldrsb r1, [r2, r1]
	adds r1, 0x85
	lsls r1, 16
	lsrs r1, 16
	bl sub_804E844
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _08052A26
_08052A64:
	cmp r6, 0x1
	bls _08052A9C
	add r0, sp, 0xC
	adds r1, r5, 0
	adds r1, 0x8
	lsls r2, r6, 24
	lsrs r2, 24
	adds r3, r5, 0
	adds r3, 0x11
	ldrh r4, [r5, 0x1A]
	str r4, [sp]
	bl sub_8050744
	ldrb r0, [r5, 0x10]
	adds r0, 0x1
	strb r0, [r5, 0x10]
	b _08052AA0
	.align 2, 0
_08052A88: .4byte 0x03001770
_08052A8C: .4byte 0x03000560
_08052A90: .4byte 0x75300000
_08052A94: .4byte 0xfffffc18
_08052A98: .4byte 0x00007530
_08052A9C:
	movs r0, 0xFF
	strb r0, [r5, 0x8]
_08052AA0:
	ldr r4, _08052AE8
	ldrb r0, [r4, 0x10]
	cmp r0, 0
	beq _08052AB0
	bl sub_8052530
	movs r0, 0
	strb r0, [r4, 0x10]
_08052AB0:
	ldr r3, _08052AEC
	ldrh r1, [r3, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08052AD4
	ldr r2, _08052AF0
	ldrb r0, [r2]
	adds r1, r0, 0
	cmp r1, 0
	bne _08052ADC
	adds r0, 0x1
	strb r0, [r2]
	ldr r0, _08052AF4
	str r1, [r0]
	ldrh r0, [r3, 0x20]
	bl SeedRng
_08052AD4:
	ldr r0, _08052AF0
	ldrb r0, [r0]
	cmp r0, 0
	beq _08052AE0
_08052ADC:
	bl sub_80527BC
_08052AE0:
	add sp, 0x4C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08052AE8: .4byte 0x03000560
_08052AEC: .4byte 0x03001770
_08052AF0: .4byte 0x020297dc
_08052AF4: .4byte 0x020297e0
	thumb_func_end sub_8052918

	thumb_func_start sub_8052AF8
sub_8052AF8: @ 8052AF8
	push {lr}
	bl sub_8052918
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_8052AF8

	thumb_func_start ShowBerryBlenderRecordWindow
ShowBerryBlenderRecordWindow: @ 8052B14
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x20
	movs r0, 0x6
	movs r1, 0x3
	movs r2, 0x17
	movs r3, 0x10
	bl MenuDrawTextWindow
	ldr r0, _08052BBC
	movs r1, 0x8
	movs r2, 0x4
	bl MenuPrint
	ldr r0, _08052BC0
	movs r1, 0x8
	movs r2, 0x9
	bl MenuPrint
	movs r0, 0
	mov r8, r0
	ldr r0, _08052BC4
	movs r7, 0x90
	lsls r7, 20
	ldr r1, _08052BC8
	adds r6, r0, r1
	movs r0, 0
	mov r9, r0
_08052B50:
	ldrh r4, [r6]
	adds r0, r4, 0
	movs r1, 0x64
	bl __udivsi3
	adds r1, r0, 0
	mov r0, sp
	movs r2, 0x12
	movs r3, 0x1
	bl sub_8072C14
	adds r5, r0, 0
	mov r1, r9
	strb r1, [r5]
	movs r0, 0xAD
	strb r0, [r5, 0x1]
	strb r1, [r5, 0x2]
	adds r5, 0x3
	adds r0, r4, 0
	movs r1, 0x64
	bl __umodsi3
	adds r1, r0, 0
	adds r0, r5, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r5, r0, 0
	ldr r1, _08052BCC
	bl StringAppend
	lsrs r2, r7, 24
	mov r0, sp
	movs r1, 0xF
	bl MenuPrint
	movs r0, 0x80
	lsls r0, 18
	adds r7, r0
	adds r6, 0x2
	movs r1, 0x1
	add r8, r1
	mov r0, r8
	cmp r0, 0x2
	ble _08052B50
	add sp, 0x20
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052BBC: .4byte gUnknown_0842C2E6
_08052BC0: .4byte gUnknown_0842C30A
_08052BC4: .4byte 0x02025734
_08052BC8: .4byte 0x0000096c
_08052BCC: .4byte gUnknown_0842D4C5
	thumb_func_end ShowBerryBlenderRecordWindow

	thumb_func_start sub_8052BD0
sub_8052BD0: @ 8052BD0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _08052C1C
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08052BF6
	ldr r0, _08052C20
	bl fanfare_play
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08052BF6:
	bl task_is_not_running_overworld_fanfare
	lsls r0, 24
	cmp r0, 0
	beq _08052C16
	ldr r0, _08052C24
	ldr r0, [r0]
	movs r1, 0xBC
	lsls r1, 1
	adds r0, r1
	ldrh r0, [r0]
	bl sub_8075474
	adds r0, r5, 0
	bl DestroyTask
_08052C16:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08052C1C: .4byte 0x03004b20
_08052C20: .4byte 0x0000016f
_08052C24: .4byte 0x03004854
	thumb_func_end sub_8052BD0
