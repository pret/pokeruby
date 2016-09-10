	.include "constants/gba_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start script_env_init
script_env_init: @ 8065394
	push {lr}
	adds r3, r0, 0
	movs r0, 0
	strb r0, [r3, 0x1]
	str r0, [r3, 0x8]
	strb r0, [r3]
	str r0, [r3, 0x4]
	str r1, [r3, 0x5C]
	str r2, [r3, 0x60]
	movs r2, 0
	movs r1, 0x3
	adds r0, r3, 0
	adds r0, 0x70
_080653AE:
	str r2, [r0]
	subs r0, 0x4
	subs r1, 0x1
	cmp r1, 0
	bge _080653AE
	adds r1, r3, 0
	adds r1, 0xC
	movs r2, 0
	adds r0, r3, 0
	adds r0, 0x58
_080653C2:
	str r2, [r0]
	subs r0, 0x4
	cmp r0, r1
	bge _080653C2
	pop {r0}
	bx r0
	thumb_func_end script_env_init

	thumb_func_start script_setup_bytecode_script
script_setup_bytecode_script: @ 80653D0
	str r1, [r0, 0x8]
	movs r1, 0x1
	strb r1, [r0, 0x1]
	movs r0, 0x1
	bx lr
	thumb_func_end script_setup_bytecode_script

	thumb_func_start script_setup_asm_script
script_setup_asm_script: @ 80653DC
	movs r2, 0x2
	strb r2, [r0, 0x1]
	str r1, [r0, 0x4]
	bx lr
	thumb_func_end script_setup_asm_script

	thumb_func_start script_stop
script_stop: @ 80653E4
	movs r1, 0
	strb r1, [r0, 0x1]
	str r1, [r0, 0x8]
	bx lr
	thumb_func_end script_stop

	thumb_func_start sub_80653EC
sub_80653EC: @ 80653EC
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _080653FA
_080653F6:
	movs r0, 0
	b _0806546C
_080653FA:
	ldrb r0, [r4, 0x1]
	cmp r0, 0x1
	beq _08065432
	cmp r0, 0x1
	bgt _0806540A
	cmp r0, 0
	beq _080653F6
	b _0806546A
_0806540A:
	cmp r0, 0x2
	bne _0806546A
	ldr r0, [r4, 0x4]
	cmp r0, 0
	beq _0806542E
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806546A
	strb r0, [r4, 0x1]
	b _0806546A
_08065424:
	strb r2, [r4, 0x1]
	b _080653F6
_08065428:
	movs r0, 0
	strb r0, [r4, 0x1]
	b _0806546C
_0806542E:
	movs r0, 0x1
	strb r0, [r4, 0x1]
_08065432:
	ldr r2, [r4, 0x8]
	cmp r2, 0
	beq _08065424
	ldr r0, _08065444
	ldr r0, [r0]
	cmp r2, r0
	bne _08065448
_08065440:
	swi 0x2
	b _08065440
	.align 2, 0
_08065444: .4byte gUnknown_083762D8
_08065448:
	ldrb r1, [r2]
	adds r0, r2, 0x1
	str r0, [r4, 0x8]
	lsls r1, 2
	ldr r0, [r4, 0x5C]
	adds r1, r0, r1
	ldr r0, [r4, 0x60]
	cmp r1, r0
	bcs _08065428
	ldr r1, [r1]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08065432
_0806546A:
	movs r0, 0x1
_0806546C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80653EC

	thumb_func_start script_stack_push
script_stack_push: @ 8065474
	push {lr}
	adds r2, r0, 0
	adds r3, r1, 0
	ldrb r1, [r2]
	adds r0, r1, 0x1
	cmp r0, 0x13
	bgt _08065496
	lsls r0, r1, 2
	adds r1, r2, 0
	adds r1, 0xC
	adds r1, r0
	str r3, [r1]
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	movs r0, 0
	b _08065498
_08065496:
	movs r0, 0x1
_08065498:
	pop {r1}
	bx r1
	thumb_func_end script_stack_push

	thumb_func_start script_stack_pop
script_stack_pop: @ 806549C
	push {lr}
	adds r2, r0, 0
	ldrb r0, [r2]
	cmp r0, 0
	beq _080654B8
	subs r0, 0x1
	strb r0, [r2]
	ldrb r1, [r2]
	lsls r1, 2
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1
	ldr r0, [r0]
	b _080654BA
_080654B8:
	movs r0, 0
_080654BA:
	pop {r1}
	bx r1
	thumb_func_end script_stack_pop

	thumb_func_start script_jump
script_jump: @ 80654C0
	str r1, [r0, 0x8]
	bx lr
	thumb_func_end script_jump

	thumb_func_start script_call
script_call: @ 80654C4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, [r4, 0x8]
	bl script_stack_push
	str r5, [r4, 0x8]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end script_call

	thumb_func_start script_return
script_return: @ 80654D8
	push {r4,lr}
	adds r4, r0, 0
	bl script_stack_pop
	str r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end script_return

	thumb_func_start script_read_halfword
script_read_halfword: @ 80654E8
	adds r3, r0, 0
	ldr r2, [r3, 0x8]
	ldrb r0, [r2]
	adds r2, 0x1
	str r2, [r3, 0x8]
	ldrb r1, [r2]
	lsls r1, 8
	orrs r0, r1
	adds r2, 0x1
	str r2, [r3, 0x8]
	bx lr
	thumb_func_end script_read_halfword

	thumb_func_start script_read_word
script_read_word: @ 8065500
	push {r4-r6,lr}
	adds r3, r0, 0
	ldr r0, [r3, 0x8]
	ldrb r6, [r0]
	adds r0, 0x1
	str r0, [r3, 0x8]
	ldrb r5, [r0]
	adds r2, r0, 0x1
	str r2, [r3, 0x8]
	ldrb r4, [r0, 0x1]
	adds r1, r2, 0x1
	str r1, [r3, 0x8]
	ldrb r0, [r2, 0x1]
	adds r1, 0x1
	str r1, [r3, 0x8]
	lsls r0, 8
	adds r0, r4
	lsls r0, 8
	adds r0, r5
	lsls r0, 8
	adds r0, r6
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end script_read_word

	thumb_func_start script_env_2_enable
script_env_2_enable: @ 8065530
	ldr r1, _08065538
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_08065538: .4byte 0x030006a4
	thumb_func_end script_env_2_enable

	thumb_func_start script_env_2_disable
script_env_2_disable: @ 806553C
	ldr r1, _08065544
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08065544: .4byte 0x030006a4
	thumb_func_end script_env_2_disable

	thumb_func_start script_env_2_is_enabled
script_env_2_is_enabled: @ 8065548
	ldr r0, _08065550
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08065550: .4byte 0x030006a4
	thumb_func_end script_env_2_is_enabled

	thumb_func_start script_env_1_init
script_env_1_init: @ 8065554
	push {lr}
	ldr r0, _0806556C
	ldr r1, _08065570
	ldr r2, _08065574
	bl script_env_init
	ldr r1, _08065578
	movs r0, 0x2
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0806556C: .4byte 0x030005b8
_08065570: .4byte gScriptCmdTable
_08065574: .4byte gScriptCmdTableEnd
_08065578: .4byte 0x030005b0
	thumb_func_end script_env_1_init

	thumb_func_start script_env_2_run_current_script
script_env_2_run_current_script: @ 806557C
	push {r4,lr}
	ldr r4, _080655A0
	ldrb r0, [r4]
	cmp r0, 0x2
	beq _080655B0
	cmp r0, 0x1
	beq _080655B0
	bl script_env_2_enable
	ldr r0, _080655A4
	bl sub_80653EC
	lsls r0, 24
	cmp r0, 0
	beq _080655A8
	movs r0, 0x1
	b _080655B2
	.align 2, 0
_080655A0: .4byte 0x030005b0
_080655A4: .4byte 0x030005b8
_080655A8:
	movs r0, 0x2
	strb r0, [r4]
	bl script_env_2_disable
_080655B0:
	movs r0, 0
_080655B2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end script_env_2_run_current_script

	thumb_func_start script_env_1_execute_new_script
script_env_1_execute_new_script: @ 80655B8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080655E0
	ldr r1, _080655E4
	ldr r2, _080655E8
	adds r0, r4, 0
	bl script_env_init
	adds r0, r4, 0
	adds r1, r5, 0
	bl script_setup_bytecode_script
	bl script_env_2_enable
	ldr r1, _080655EC
	movs r0, 0
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080655E0: .4byte 0x030005b8
_080655E4: .4byte gScriptCmdTable
_080655E8: .4byte gScriptCmdTableEnd
_080655EC: .4byte 0x030005b0
	thumb_func_end script_env_1_execute_new_script

	thumb_func_start sub_80655F0
sub_80655F0: @ 80655F0
	ldr r1, _080655F8
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_080655F8: .4byte 0x030005b0
	thumb_func_end sub_80655F0

	thumb_func_start script_env_2_enable_and_set_ctx_running
script_env_2_enable_and_set_ctx_running: @ 80655FC
	push {lr}
	ldr r1, _0806560C
	movs r0, 0
	strb r0, [r1]
	bl script_env_2_enable
	pop {r0}
	bx r0
	.align 2, 0
_0806560C: .4byte 0x030005b0
	thumb_func_end script_env_2_enable_and_set_ctx_running

	thumb_func_start script_env_2_execute_new_script
script_env_2_execute_new_script: @ 8065610
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _0806563C
	ldr r1, _08065640
	ldr r2, _08065644
	adds r0, r4, 0
	bl script_env_init
	adds r0, r4, 0
	adds r1, r5, 0
	bl script_setup_bytecode_script
_08065628:
	ldr r0, _0806563C
	bl sub_80653EC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08065628
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806563C: .4byte 0x03000630
_08065640: .4byte gScriptCmdTable
_08065644: .4byte gScriptCmdTableEnd
	thumb_func_end script_env_2_execute_new_script

	thumb_func_start mapheader_get_tagged_pointer
mapheader_get_tagged_pointer: @ 8065648
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _08065660
	ldr r2, [r0, 0x8]
	cmp r2, 0
	beq _0806565C
_08065656:
	ldrb r0, [r2]
	cmp r0, 0
	bne _08065664
_0806565C:
	movs r0, 0
	b _08065682
	.align 2, 0
_08065660: .4byte 0x0202e828
_08065664:
	cmp r0, r1
	beq _0806566C
	adds r2, 0x5
	b _08065656
_0806566C:
	adds r2, 0x1
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	adds r0, r1
	ldrb r1, [r2, 0x2]
	lsls r1, 16
	adds r0, r1
	ldrb r1, [r2, 0x3]
	lsls r1, 24
	adds r0, r1
_08065682:
	pop {r1}
	bx r1
	thumb_func_end mapheader_get_tagged_pointer

	thumb_func_start mapheader_run_script_by_tag
mapheader_run_script_by_tag: @ 8065688
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl mapheader_get_tagged_pointer
	cmp r0, 0
	beq _0806569A
	bl script_env_2_execute_new_script
_0806569A:
	pop {r0}
	bx r0
	thumb_func_end mapheader_run_script_by_tag

	thumb_func_start mapheader_get_first_match_from_tagged_ptr_list
mapheader_get_first_match_from_tagged_ptr_list: @ 80656A0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	bl mapheader_get_tagged_pointer
	adds r6, r0, 0
	cmp r6, 0
	beq _080656BC
_080656B0:
	ldrb r1, [r6]
	ldrb r0, [r6, 0x1]
	lsls r0, 8
	orrs r1, r0
	cmp r1, 0
	bne _080656C0
_080656BC:
	movs r0, 0
	b _080656FA
_080656C0:
	adds r6, 0x2
	ldrb r5, [r6]
	ldrb r0, [r6, 0x1]
	lsls r0, 8
	orrs r5, r0
	adds r6, 0x2
	adds r0, r1, 0
	bl VarGet
	adds r4, r0, 0
	adds r0, r5, 0
	bl VarGet
	lsls r4, 16
	lsls r0, 16
	cmp r4, r0
	beq _080656E6
	adds r6, 0x4
	b _080656B0
_080656E6:
	ldrb r0, [r6]
	ldrb r1, [r6, 0x1]
	lsls r1, 8
	adds r0, r1
	ldrb r1, [r6, 0x2]
	lsls r1, 16
	adds r0, r1
	ldrb r1, [r6, 0x3]
	lsls r1, 24
	adds r0, r1
_080656FA:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end mapheader_get_first_match_from_tagged_ptr_list

	thumb_func_start mapheader_run_script_with_tag_x1
mapheader_run_script_with_tag_x1: @ 8065700
	push {lr}
	movs r0, 0x1
	bl mapheader_run_script_by_tag
	pop {r0}
	bx r0
	thumb_func_end mapheader_run_script_with_tag_x1

	thumb_func_start mapheader_run_script_with_tag_x3
mapheader_run_script_with_tag_x3: @ 806570C
	push {lr}
	movs r0, 0x3
	bl mapheader_run_script_by_tag
	pop {r0}
	bx r0
	thumb_func_end mapheader_run_script_with_tag_x3

	thumb_func_start mapheader_run_script_with_tag_x5
mapheader_run_script_with_tag_x5: @ 8065718
	push {lr}
	movs r0, 0x5
	bl mapheader_run_script_by_tag
	pop {r0}
	bx r0
	thumb_func_end mapheader_run_script_with_tag_x5

	thumb_func_start mapheader_run_script_with_tag_x6
mapheader_run_script_with_tag_x6: @ 8065724
	push {lr}
	movs r0, 0x6
	bl mapheader_run_script_by_tag
	pop {r0}
	bx r0
	thumb_func_end mapheader_run_script_with_tag_x6

	thumb_func_start mapheader_run_first_tag2_script_list_match
mapheader_run_first_tag2_script_list_match: @ 8065730
	push {lr}
	movs r0, 0x2
	bl mapheader_get_first_match_from_tagged_ptr_list
	cmp r0, 0
	beq _08065744
	bl script_env_1_execute_new_script
	movs r0, 0x1
	b _08065746
_08065744:
	movs r0, 0
_08065746:
	pop {r1}
	bx r1
	thumb_func_end mapheader_run_first_tag2_script_list_match

	thumb_func_start mapheader_run_first_tag4_script_list_match
mapheader_run_first_tag4_script_list_match: @ 806574C
	push {lr}
	movs r0, 0x4
	bl mapheader_get_first_match_from_tagged_ptr_list
	cmp r0, 0
	beq _0806575C
	bl script_env_2_execute_new_script
_0806575C:
	pop {r0}
	bx r0
	thumb_func_end mapheader_run_first_tag4_script_list_match

	thumb_func_start sub_8065760
sub_8065760: @ 8065760
	push {r4,lr}
	movs r2, 0
	movs r1, 0
	ldr r4, _08065780
	ldr r3, _08065784
_0806576A:
	adds r0, r1, r3
	ldrb r0, [r0]
	adds r2, r0
	adds r1, 0x1
	cmp r1, r4
	bls _0806576A
	adds r0, r2, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08065780: .4byte 0x000003e7
_08065784: .4byte 0x02028dc8
	thumb_func_end sub_8065760

	thumb_func_start killram
killram: @ 8065788
	push {lr}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	ldr r1, _080657A0
	ldr r2, _080657A4
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080657A0: .4byte 0x02028dc4
_080657A4: .4byte 0x050000fb
	thumb_func_end killram

	thumb_func_start sub_80657A8
sub_80657A8: @ 80657A8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r0
	ldr r0, [sp, 0x1C]
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r6, r3, 24
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080657F4
	bl killram
	ldr r0, _080657F8
	cmp r8, r0
	bhi _080657FC
	movs r0, 0x33
	strb r0, [r4]
	strb r7, [r4, 0x1]
	strb r6, [r4, 0x2]
	strb r5, [r4, 0x3]
	adds r0, r4, 0x4
	mov r1, r9
	mov r2, r8
	bl memcpy
	bl sub_8065760
	subs r1, r4, 0x4
	str r0, [r1]
	movs r0, 0x1
	b _080657FE
	.align 2, 0
_080657F4: .4byte 0x02028dc8
_080657F8: .4byte 0x000003e3
_080657FC:
	movs r0, 0
_080657FE:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80657A8

	thumb_func_start sub_806580C
sub_806580C: @ 806580C
	push {r4-r6,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r4, _08065854
	ldr r6, _08065858
	movs r0, 0
	str r0, [r6]
	ldrb r0, [r4]
	cmp r0, 0x33
	bne _08065864
	ldrb r1, [r4, 0x1]
	ldr r0, _0806585C
	adds r2, r4, r0
	movs r0, 0x4
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _08065864
	ldrb r1, [r4, 0x2]
	movs r0, 0x5
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _08065864
	ldrb r0, [r4, 0x3]
	cmp r0, r3
	bne _08065864
	bl sub_8065760
	subs r1, r4, 0x4
	ldr r1, [r1]
	cmp r0, r1
	bne _08065860
	str r5, [r6]
	adds r0, r4, 0x4
	b _08065866
	.align 2, 0
_08065854: .4byte 0x02028dc8
_08065858: .4byte 0x0202e8ac
_0806585C: .4byte 0xffffc96c
_08065860:
	bl killram
_08065864:
	adds r0, r5, 0
_08065866:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_806580C

	thumb_func_start s00_nop
s00_nop: @ 806586C
	movs r0, 0
	bx lr
	thumb_func_end s00_nop

	thumb_func_start sub_8065870
sub_8065870: @ 8065870
	movs r0, 0
	bx lr
	thumb_func_end sub_8065870

	thumb_func_start s02_end
s02_end: @ 8065874
	push {lr}
	bl script_stop
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s02_end

	thumb_func_start s24_execute_ASM_2
s24_execute_ASM_2: @ 8065880
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_word
	adds r1, r0, 0
	adds r0, r4, 0
	bl script_setup_asm_script
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s24_execute_ASM_2

	thumb_func_start sub_8065898
sub_8065898: @ 8065898
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	ldr r1, _080658B4
	lsrs r0, 14
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080658B4: .4byte gSpecials
	thumb_func_end sub_8065898

	thumb_func_start sub_80658B8
sub_80658B8: @ 80658B8
	push {r4-r6,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r6, r0, 0
	ldr r4, _080658E8
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 14
	adds r0, r4
	ldr r0, [r0]
	bl _call_via_r0
	strh r0, [r6]
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080658E8: .4byte gSpecials
	thumb_func_end sub_80658B8

	thumb_func_start sub_80658EC
sub_80658EC: @ 80658EC
	push {lr}
	bl script_read_word
	bl _call_via_r0
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80658EC

	thumb_func_start sub_80658FC
sub_80658FC: @ 80658FC
	push {lr}
	bl sub_80655F0
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_80658FC

	thumb_func_start s05_goto
s05_goto: @ 8065908
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_word
	adds r1, r0, 0
	adds r0, r4, 0
	bl script_jump
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s05_goto

	thumb_func_start s03_return
s03_return: @ 8065920
	push {lr}
	bl script_return
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s03_return

	thumb_func_start s04_call
s04_call: @ 806592C
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_word
	adds r1, r0, 0
	adds r0, r4, 0
	bl script_call
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s04_call

	thumb_func_start s06_if_jump
s06_if_jump: @ 8065944
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	adds r0, r5, 0
	bl script_read_word
	adds r2, r0, 0
	ldr r1, _0806597C
	lsls r0, r4, 1
	adds r0, r4
	ldrb r3, [r5, 0x2]
	adds r0, r3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08065972
	adds r0, r5, 0
	adds r1, r2, 0
	bl script_jump
_08065972:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806597C: .4byte gUnknown_083762DC
	thumb_func_end s06_if_jump

	thumb_func_start s07_if_call
s07_if_call: @ 8065980
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	adds r0, r5, 0
	bl script_read_word
	adds r2, r0, 0
	ldr r1, _080659B8
	lsls r0, r4, 1
	adds r0, r4
	ldrb r3, [r5, 0x2]
	adds r0, r3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080659AE
	adds r0, r5, 0
	adds r1, r2, 0
	bl script_call
_080659AE:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080659B8: .4byte gUnknown_083762DC
	thumb_func_end s07_if_call

	thumb_func_start sB8_set_virtual_address
sB8_set_virtual_address: @ 80659BC
	push {r4,lr}
	ldr r4, [r0, 0x8]
	subs r4, 0x1
	bl script_read_word
	ldr r1, _080659D4
	subs r0, r4
	str r0, [r1]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080659D4: .4byte 0x0202e8b0
	thumb_func_end sB8_set_virtual_address

	thumb_func_start sB9_virtual_jump
sB9_virtual_jump: @ 80659D8
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_word
	adds r1, r0, 0
	ldr r0, _080659F8
	ldr r0, [r0]
	subs r1, r0
	adds r0, r4, 0
	bl script_jump
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080659F8: .4byte 0x0202e8b0
	thumb_func_end sB9_virtual_jump

	thumb_func_start sBA_virtual_call
sBA_virtual_call: @ 80659FC
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_word
	adds r1, r0, 0
	ldr r0, _08065A1C
	ldr r0, [r0]
	subs r1, r0
	adds r0, r4, 0
	bl script_call
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08065A1C: .4byte 0x0202e8b0
	thumb_func_end sBA_virtual_call

	thumb_func_start sBB_virtual_if_jump
sBB_virtual_if_jump: @ 8065A20
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	adds r0, r5, 0
	bl script_read_word
	ldr r1, _08065A5C
	ldr r1, [r1]
	subs r2, r0, r1
	ldr r1, _08065A60
	lsls r0, r4, 1
	adds r0, r4
	ldrb r3, [r5, 0x2]
	adds r0, r3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08065A52
	adds r0, r5, 0
	adds r1, r2, 0
	bl script_jump
_08065A52:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08065A5C: .4byte 0x0202e8b0
_08065A60: .4byte gUnknown_083762DC
	thumb_func_end sBB_virtual_if_jump

	thumb_func_start sBC_virtual_if_call
sBC_virtual_if_call: @ 8065A64
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	adds r0, r5, 0
	bl script_read_word
	ldr r1, _08065AA0
	ldr r1, [r1]
	subs r2, r0, r1
	ldr r1, _08065AA4
	lsls r0, r4, 1
	adds r0, r4
	ldrb r3, [r5, 0x2]
	adds r0, r3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08065A96
	adds r0, r5, 0
	adds r1, r2, 0
	bl script_call
_08065A96:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08065AA0: .4byte 0x0202e8b0
_08065AA4: .4byte gUnknown_083762DC
	thumb_func_end sBC_virtual_if_call

	thumb_func_start s08_jumpstd
s08_jumpstd: @ 8065AA8
	push {lr}
	adds r2, r0, 0
	ldr r0, [r2, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r2, 0x8]
	lsls r1, 2
	ldr r0, _08065AD0
	adds r1, r0
	ldr r0, _08065AD4
	cmp r1, r0
	bcs _08065AC8
	ldr r1, [r1]
	adds r0, r2, 0
	bl script_jump
_08065AC8:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08065AD0: .4byte gStdScripts
_08065AD4: .4byte gStdScripts_End
	thumb_func_end s08_jumpstd

	thumb_func_start s09_callstd
s09_callstd: @ 8065AD8
	push {lr}
	adds r2, r0, 0
	ldr r0, [r2, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r2, 0x8]
	lsls r1, 2
	ldr r0, _08065B00
	adds r1, r0
	ldr r0, _08065B04
	cmp r1, r0
	bcs _08065AF8
	ldr r1, [r1]
	adds r0, r2, 0
	bl script_call
_08065AF8:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08065B00: .4byte gStdScripts
_08065B04: .4byte gStdScripts_End
	thumb_func_end s09_callstd

	thumb_func_start s0A_jumpstd_if
s0A_jumpstd_if: @ 8065B08
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, [r3, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r3, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r3, 0x8]
	ldr r1, _08065B48
	lsls r0, r2, 1
	adds r0, r2
	ldrb r2, [r3, 0x2]
	adds r0, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08065B40
	lsls r0, r4, 2
	ldr r1, _08065B4C
	adds r1, r0, r1
	ldr r0, _08065B50
	cmp r1, r0
	bcs _08065B40
	ldr r1, [r1]
	adds r0, r3, 0
	bl script_jump
_08065B40:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08065B48: .4byte gUnknown_083762DC
_08065B4C: .4byte gStdScripts
_08065B50: .4byte gStdScripts_End
	thumb_func_end s0A_jumpstd_if

	thumb_func_start s0B_callstd_if
s0B_callstd_if: @ 8065B54
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, [r3, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r3, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r3, 0x8]
	ldr r1, _08065B94
	lsls r0, r2, 1
	adds r0, r2
	ldrb r2, [r3, 0x2]
	adds r0, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08065B8C
	lsls r0, r4, 2
	ldr r1, _08065B98
	adds r1, r0, r1
	ldr r0, _08065B9C
	cmp r1, r0
	bcs _08065B8C
	ldr r1, [r1]
	adds r0, r3, 0
	bl script_call
_08065B8C:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08065B94: .4byte gUnknown_083762DC
_08065B98: .4byte gStdScripts
_08065B9C: .4byte gStdScripts_End
	thumb_func_end s0B_callstd_if

	thumb_func_start s0C_restore_execution_after_sCF
s0C_restore_execution_after_sCF: @ 8065BA0
	push {lr}
	ldr r1, _08065BB0
	ldr r1, [r1]
	bl script_jump
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08065BB0: .4byte 0x0202e8ac
	thumb_func_end s0C_restore_execution_after_sCF

	thumb_func_start s0D_endscript_killram
s0D_endscript_killram: @ 8065BB4
	push {r4,lr}
	adds r4, r0, 0
	bl killram
	adds r0, r4, 0
	bl script_stop
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s0D_endscript_killram

	thumb_func_start s0E_set_byte
s0E_set_byte: @ 8065BCC
	push {lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	adds r0, r2, 0
	bl sub_8126160
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s0E_set_byte

	thumb_func_start s0F_u32_var_to_const
s0F_u32_var_to_const: @ 8065BE4
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r5, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	adds r0, r4, 0
	bl script_read_word
	lsls r5, 2
	adds r4, 0x64
	adds r4, r5
	str r0, [r4]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s0F_u32_var_to_const

	thumb_func_start s12_u32_var_to_ptr
s12_u32_var_to_ptr: @ 8065C08
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r5, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	adds r0, r4, 0
	bl script_read_word
	lsls r5, 2
	adds r4, 0x64
	adds r4, r5
	ldrb r0, [r0]
	str r0, [r4]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s12_u32_var_to_ptr

	thumb_func_start s11_u8_ptr_to_const
s11_u8_ptr_to_const: @ 8065C2C
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl script_read_word
	strb r4, [r0]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s11_u8_ptr_to_const

	thumb_func_start sub_8065C44
sub_8065C44: @ 8065C44
	ldr r1, [r0, 0x8]
	ldrb r3, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	lsls r3, 2
	adds r2, r0, 0
	adds r2, 0x64
	adds r2, r3
	ldrb r3, [r1]
	str r3, [r2]
	adds r1, 0x1
	str r1, [r0, 0x8]
	movs r0, 0
	bx lr
	thumb_func_end sub_8065C44

	thumb_func_start s13_u8_var_to_ptr
s13_u8_var_to_ptr: @ 8065C60
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r5, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	adds r0, r4, 0
	bl script_read_word
	lsls r5, 2
	adds r4, 0x64
	adds r4, r5
	ldr r1, [r4]
	strb r1, [r0]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s13_u8_var_to_ptr

	thumb_func_start s14_u32_var_to_var
s14_u32_var_to_var: @ 8065C84
	ldr r1, [r0, 0x8]
	ldrb r3, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	lsls r3, 2
	adds r0, 0x64
	adds r3, r0, r3
	lsls r2, 2
	adds r0, r2
	ldr r0, [r0]
	str r0, [r3]
	movs r0, 0
	bx lr
	thumb_func_end s14_u32_var_to_var

	thumb_func_start s15_u8_ptr_to_ptr
s15_u8_ptr_to_ptr: @ 8065CA4
	push {r4,r5,lr}
	adds r4, r0, 0
	bl script_read_word
	adds r5, r0, 0
	adds r0, r4, 0
	bl script_read_word
	ldrb r0, [r0]
	strb r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s15_u8_ptr_to_ptr

	thumb_func_start s16_u16_gvar_to_const
s16_u16_gvar_to_const: @ 8065CC0
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r4, r0, 0
	adds r0, r5, 0
	bl script_read_halfword
	strh r0, [r4]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s16_u16_gvar_to_const

	thumb_func_start s19_u16_gvar_gvar
s19_u16_gvar_gvar: @ 8065CE4
	push {r4,r5,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r5, r0, 0
	adds r0, r4, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	ldrh r0, [r0]
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s19_u16_gvar_gvar

	thumb_func_start s1A_u16_gvar_gvar
s1A_u16_gvar_gvar: @ 8065D10
	push {r4,r5,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r5, r0, 0
	adds r0, r4, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s1A_u16_gvar_gvar

	thumb_func_start compare_012
compare_012: @ 8065D3C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	cmp r0, r1
	bcs _08065D4E
	movs r0, 0
	b _08065D58
_08065D4E:
	cmp r0, r1
	beq _08065D56
	movs r0, 0x2
	b _08065D58
_08065D56:
	movs r0, 0x1
_08065D58:
	pop {r1}
	bx r1
	thumb_func_end compare_012

	thumb_func_start s1B_cmp_u8_var_var
s1B_cmp_u8_var_var: @ 8065D5C
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, [r4, 0x8]
	ldrb r0, [r2]
	lsls r0, 2
	adds r3, r4, 0
	adds r3, 0x64
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r2, 0x1
	str r2, [r4, 0x8]
	ldrb r1, [r2]
	lsls r1, 2
	adds r3, r1
	ldrb r1, [r3]
	adds r2, 0x1
	str r2, [r4, 0x8]
	bl compare_012
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s1B_cmp_u8_var_var

	thumb_func_start s1C_cmp_u8_var_const
s1C_cmp_u8_var_const: @ 8065D8C
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, [r4, 0x8]
	ldrb r1, [r2]
	lsls r1, 2
	adds r0, 0x64
	adds r0, r1
	ldrb r0, [r0]
	adds r2, 0x1
	str r2, [r4, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r4, 0x8]
	bl compare_012
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s1C_cmp_u8_var_const

	thumb_func_start s1D_cmp_u8_var_ptr
s1D_cmp_u8_var_ptr: @ 8065DB4
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r2, [r4, 0x8]
	ldrb r1, [r2]
	lsls r1, 2
	adds r0, 0x64
	adds r0, r1
	ldrb r5, [r0]
	adds r2, 0x1
	str r2, [r4, 0x8]
	adds r0, r4, 0
	bl script_read_word
	ldrb r1, [r0]
	adds r0, r5, 0
	bl compare_012
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s1D_cmp_u8_var_ptr

	thumb_func_start s1E_cmp_u8_ptr_var
s1E_cmp_u8_ptr_var: @ 8065DE0
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_word
	ldrb r0, [r0]
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	lsls r2, 2
	adds r1, r4, 0
	adds r1, 0x64
	adds r1, r2
	ldrb r1, [r1]
	adds r3, 0x1
	str r3, [r4, 0x8]
	bl compare_012
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s1E_cmp_u8_ptr_var

	thumb_func_start s1F_cmp_u8_ptr_const
s1F_cmp_u8_ptr_const: @ 8065E0C
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_word
	ldrb r0, [r0]
	ldr r2, [r4, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r4, 0x8]
	bl compare_012
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s1F_cmp_u8_ptr_const

	thumb_func_start s20_cmp_u8_ptr_ptr
s20_cmp_u8_ptr_ptr: @ 8065E2C
	push {r4,r5,lr}
	adds r4, r0, 0
	bl script_read_word
	ldrb r5, [r0]
	adds r0, r4, 0
	bl script_read_word
	ldrb r1, [r0]
	adds r0, r5, 0
	bl compare_012
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s20_cmp_u8_ptr_ptr

	thumb_func_start s21_cmp_u16_gvar_const
s21_cmp_u16_gvar_const: @ 8065E50
	push {r4,r5,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	ldrh r5, [r0]
	adds r0, r4, 0
	bl script_read_halfword
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r5, 0
	bl compare_012
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s21_cmp_u16_gvar_const

	thumb_func_start s22_cmp_u16_gvar_gvar
s22_cmp_u16_gvar_gvar: @ 8065E80
	push {r4,r5,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r5, r0, 0
	adds r0, r4, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	ldrh r2, [r5]
	ldrh r1, [r0]
	adds r0, r2, 0
	bl compare_012
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s22_cmp_u16_gvar_gvar

	thumb_func_start s17_u16_gvar_add_const
s17_u16_gvar_add_const: @ 8065EB4
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r4, r0, 0
	adds r0, r5, 0
	bl script_read_halfword
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r4]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s17_u16_gvar_add_const

	thumb_func_start sub_8065EDC
sub_8065EDC: @ 8065EDC
	push {r4,r5,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r5, r0, 0
	adds r0, r4, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldrh r1, [r5]
	subs r1, r0
	strh r1, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065EDC

	thumb_func_start s8F_get_random_val
s8F_get_random_val: @ 8065F0C
	push {r4,r5,lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r5, _08065F3C
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r4, 0
	bl __umodsi3
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08065F3C: .4byte 0x0202e8dc
	thumb_func_end s8F_get_random_val

	thumb_func_start sub_8065F40
sub_8065F40: @ 8065F40
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	ldr r5, _08065F80
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_80A9424
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08065F80: .4byte 0x0202e8dc
	thumb_func_end sub_8065F40

	thumb_func_start sub_8065F84
sub_8065F84: @ 8065F84
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	ldr r5, _08065FC4
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_80A9538
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08065FC4: .4byte 0x0202e8dc
	thumb_func_end sub_8065F84

	thumb_func_start sub_8065FC8
sub_8065FC8: @ 8065FC8
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	ldr r5, _08066008
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_80A9344
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08066008: .4byte 0x0202e8dc
	thumb_func_end sub_8065FC8

	thumb_func_start sub_806600C
sub_806600C: @ 806600C
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	ldr r5, _0806604C
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_80A92D4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806604C: .4byte 0x0202e8dc
	thumb_func_end sub_806600C

	thumb_func_start s48_get_item_type
s48_get_item_type: @ 8066050
	push {r4,lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _08066078
	bl sub_80A9670
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066078: .4byte 0x0202e8dc
	thumb_func_end s48_get_item_type

	thumb_func_start sub_806607C
sub_806607C: @ 806607C
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r5, _080660BC
	adds r0, r4, 0
	bl sub_80A9760
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080660BC: .4byte 0x0202e8dc
	thumb_func_end sub_806607C

	thumb_func_start sub_80660C0
sub_80660C0: @ 80660C0
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r5, _08066100
	adds r0, r4, 0
	bl sub_80A9718
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08066100: .4byte 0x0202e8dc
	thumb_func_end sub_80660C0

	thumb_func_start sub_8066104
sub_8066104: @ 8066104
	push {r4,lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r4, _0806612C
	lsls r0, 24
	lsrs r0, 24
	bl IsThereStorageSpaceForDecoration
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806612C: .4byte 0x0202e8dc
	thumb_func_end sub_8066104

	thumb_func_start sub_8066130
sub_8066130: @ 8066130
	push {r4,lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r4, _08066158
	lsls r0, 24
	lsrs r0, 24
	bl sub_81340A8
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066158: .4byte 0x0202e8dc
	thumb_func_end sub_8066130

	thumb_func_start sub_806615C
sub_806615C: @ 806615C
	push {r4,lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r4, _08066184
	lsls r0, 24
	lsrs r0, 24
	bl sub_8134074
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066184: .4byte 0x0202e8dc
	thumb_func_end sub_806615C

	thumb_func_start sub_8066188
sub_8066188: @ 8066188
	push {r4,lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r4, _080661B0
	lsls r0, 24
	lsrs r0, 24
	bl sub_8133FE4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080661B0: .4byte 0x0202e8dc
	thumb_func_end sub_8066188

	thumb_func_start s29_flag_set
s29_flag_set: @ 80661B4
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl FlagSet
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s29_flag_set

	thumb_func_start s2A_flag_clear
s2A_flag_clear: @ 80661C8
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl FlagReset
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s2A_flag_clear

	thumb_func_start s2B_flag_check
s2B_flag_check: @ 80661DC
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl FlagGet
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s2B_flag_check

	thumb_func_start sC3_unknown
sC3_unknown: @ 80661F8
	push {lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	adds r0, r2, 0
	bl sav12_xor_increment
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sC3_unknown

	thumb_func_start s9A_unknown
s9A_unknown: @ 8066210
	push {lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	adds r0, r2, 0
	bl sub_8081594
	bl sub_80655F0
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end s9A_unknown

	thumb_func_start sub_806622C
sub_806622C: @ 806622C
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl sub_8053CE4
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806622C

	thumb_func_start sub_8066248
sub_8066248: @ 8066248
	push {lr}
	ldr r0, _0806625C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08066260
	movs r0, 0
	b _08066262
	.align 2, 0
_0806625C: .4byte 0x0202f388
_08066260:
	movs r0, 0x1
_08066262:
	pop {r1}
	bx r1
	thumb_func_end sub_8066248

	thumb_func_start s97_screen_special_effect
s97_screen_special_effect: @ 8066268
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, [r4, 0x8]
	ldrb r0, [r1]
	adds r1, 0x1
	str r1, [r4, 0x8]
	movs r1, 0
	bl fade_screen
	ldr r1, _0806628C
	adds r0, r4, 0
	bl script_setup_asm_script
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806628C: .4byte sub_8066248
	thumb_func_end s97_screen_special_effect

	thumb_func_start sub_8066290
sub_8066290: @ 8066290
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, [r4, 0x8]
	ldrb r0, [r2]
	adds r2, 0x1
	str r2, [r4, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r4, 0x8]
	bl fade_screen
	ldr r1, _080662B8
	adds r0, r4, 0
	bl script_setup_asm_script
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080662B8: .4byte sub_8066248
	thumb_func_end sub_8066290

	thumb_func_start s28_pause_asm
s28_pause_asm: @ 80662BC
	push {lr}
	ldr r1, _080662D0
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	beq _080662D4
	movs r0, 0
	b _080662D6
	.align 2, 0
_080662D0: .4byte 0x0202e8b4
_080662D4:
	movs r0, 0x1
_080662D6:
	pop {r1}
	bx r1
	thumb_func_end s28_pause_asm

	thumb_func_start s28_pause
s28_pause: @ 80662DC
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_halfword
	ldr r1, _080662F8
	strh r0, [r1]
	ldr r1, _080662FC
	adds r0, r4, 0
	bl script_setup_asm_script
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080662F8: .4byte 0x0202e8b4
_080662FC: .4byte s28_pause_asm
	thumb_func_end s28_pause

	thumb_func_start s2C_unknown
s2C_unknown: @ 8066300
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl RtcInitLocalTimeOffset
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s2C_unknown

	thumb_func_start s2D_unknown
s2D_unknown: @ 8066338
	push {lr}
	bl InTrainerHill
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s2D_unknown

	thumb_func_start s2E_unknown
s2E_unknown: @ 8066344
	push {lr}
	bl RtcCalcLocalTime
	ldr r2, _0806636C
	ldr r1, _08066370
	movs r0, 0x2
	ldrsb r0, [r1, r0]
	strh r0, [r2]
	ldr r2, _08066374
	movs r0, 0x3
	ldrsb r0, [r1, r0]
	strh r0, [r2]
	ldr r2, _08066378
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	strh r0, [r2]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806636C: .4byte 0x0202e8c4
_08066370: .4byte 0x03004038
_08066374: .4byte 0x0202e8c6
_08066378: .4byte 0x0202e8c8
	thumb_func_end s2E_unknown

	thumb_func_start sA4_set_weather_data
sA4_set_weather_data: @ 806637C
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl sub_80806B4
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sA4_set_weather_data

	thumb_func_start sA3_set_standard_weather_data
sA3_set_standard_weather_data: @ 8066398
	push {lr}
	bl sub_80806E4
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sA3_set_standard_weather_data

	thumb_func_start sub_80663A4
sub_80663A4: @ 80663A4
	push {lr}
	bl sub_808073C
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80663A4

	thumb_func_start sA6_activate_per_step_callback_eg_ash
sA6_activate_per_step_callback_eg_ash: @ 80663B0
	push {lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	adds r0, r2, 0
	bl activate_per_step_callback
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sA6_activate_per_step_callback_eg_ash

	thumb_func_start sub_80663C8
sub_80663C8: @ 80663C8
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl sub_8053D14
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80663C8

	thumb_func_start s39_warp_sfx
s39_warp_sfx: @ 80663E4
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl warp1_set
	bl sub_8080E88
	bl player_avatar_init_params_reset
	movs r0, 0x1
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end s39_warp_sfx

	thumb_func_start s3A_warp_new_music
s3A_warp_new_music: @ 806646C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl warp1_set
	bl sp13E_warp_to_last_warp
	bl player_avatar_init_params_reset
	movs r0, 0x1
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end s3A_warp_new_music

	thumb_func_start s3B_warp_keep_music
s3B_warp_keep_music: @ 80664F4
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl warp1_set
	bl sub_8080EF0
	bl player_avatar_init_params_reset
	movs r0, 0x1
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end s3B_warp_keep_music

	thumb_func_start sub_806657C
sub_806657C: @ 806657C
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r1, [r0, 0x8]
	ldrb r6, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldrb r5, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	mov r4, sp
	adds r4, 0x6
	add r0, sp, 0x4
	adds r1, r4, 0
	bl PlayerGetDestCoords
	cmp r6, 0xFF
	bne _080665BA
	cmp r5, 0xFF
	bne _080665BA
	add r0, sp, 0x4
	ldrh r0, [r0]
	subs r0, 0x7
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r4]
	subs r1, 0x7
	lsls r1, 16
	asrs r1, 16
	bl sub_8053720
	b _080665DE
_080665BA:
	lsls r0, r6, 24
	asrs r0, 24
	lsls r1, r5, 24
	asrs r1, 24
	movs r2, 0x1
	negs r2, r2
	add r3, sp, 0x4
	ldrb r3, [r3]
	subs r3, 0x7
	lsls r3, 24
	asrs r3, 24
	ldrb r4, [r4]
	subs r4, 0x7
	lsls r4, 24
	asrs r4, 24
	str r4, [sp]
	bl warp1_set
_080665DE:
	bl sp13F_fall_to_last_warp
	bl player_avatar_init_params_reset
	movs r0, 0x1
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_806657C

	thumb_func_start s3D_warp_v4
s3D_warp_v4: @ 80665F0
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl warp1_set
	bl sub_8080F68
	bl player_avatar_init_params_reset
	movs r0, 0x1
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end s3D_warp_v4

	thumb_func_start s3E_set_new_map
s3E_set_new_map: @ 8066678
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl warp1_set
	movs r0, 0
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end s3E_set_new_map

	thumb_func_start s3F_set_new_map_DMA
s3F_set_new_map_DMA: @ 80666F8
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	str r4, [sp]
	lsls r0, 24
	asrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0
	mov r1, r9
	mov r2, r8
	adds r3, r6, 0
	bl saved_warp2_set_2
	movs r0, 0
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end s3F_set_new_map_DMA

	thumb_func_start sub_806677C
sub_806677C: @ 806677C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl sub_8053690
	movs r0, 0
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_806677C

	thumb_func_start sub_80667FC
sub_80667FC: @ 80667FC
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl sub_80536E4
	movs r0, 0
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80667FC

	thumb_func_start sC4_unknown
sC4_unknown: @ 806687C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl sub_805363C
	movs r0, 0
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sC4_unknown

	thumb_func_start sub_80668FC
sub_80668FC: @ 80668FC
	push {r4,r5,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r5, r0, 0
	adds r0, r4, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	ldr r2, _08066930
	ldrh r1, [r2]
	strh r1, [r5]
	ldrh r1, [r2, 0x2]
	strh r1, [r0]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08066930: .4byte 0x02025734
	thumb_func_end sub_80668FC

	thumb_func_start s43_get_player_party_count
s43_get_player_party_count: @ 8066934
	push {r4,lr}
	ldr r4, _0806694C
	bl calc_player_party_count
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806694C: .4byte 0x0202e8dc
	thumb_func_end s43_get_player_party_count

	thumb_func_start s2F_music_play
s2F_music_play: @ 8066950
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl audio_play
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s2F_music_play

	thumb_func_start s30_music_check_asm
s30_music_check_asm: @ 8066964
	push {lr}
	bl mplay_has_finished_maybe
	lsls r0, 24
	cmp r0, 0
	beq _08066974
	movs r0, 0
	b _08066976
_08066974:
	movs r0, 0x1
_08066976:
	pop {r1}
	bx r1
	thumb_func_end s30_music_check_asm

	thumb_func_start sub_806697C
sub_806697C: @ 806697C
	push {lr}
	ldr r1, _0806698C
	bl script_setup_asm_script
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_0806698C: .4byte s30_music_check_asm
	thumb_func_end sub_806697C

	thumb_func_start s31_fanfare_play
s31_fanfare_play: @ 8066990
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl fanfare_play
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s31_fanfare_play

	thumb_func_start s32_fanfare_wait_asm
s32_fanfare_wait_asm: @ 80669A4
	push {lr}
	bl task_is_not_running_overworld_fanfare
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end s32_fanfare_wait_asm

	thumb_func_start sub_80669B4
sub_80669B4: @ 80669B4
	push {lr}
	ldr r1, _080669C4
	bl script_setup_asm_script
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_080669C4: .4byte s32_fanfare_wait_asm
	thumb_func_end sub_80669B4

	thumb_func_start s33_play_music
s33_play_music: @ 80669C8
	push {r4,r5,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r2, r0, 16
	adds r5, r2, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r1, 0x1
	bne _080669E8
	adds r0, r2, 0
	bl sav1_set_battle_music_maybe
_080669E8:
	adds r0, r5, 0
	bl current_map_music_set
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s33_play_music

	thumb_func_start s34_unknown
s34_unknown: @ 80669F8
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl sav1_set_battle_music_maybe
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s34_unknown

	thumb_func_start s35_fade_to_default
s35_fade_to_default: @ 8066A0C
	push {lr}
	bl sub_8053F84
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s35_fade_to_default

	thumb_func_start s36_fade_to_music
s36_fade_to_music: @ 8066A18
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl sub_8053FB0
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s36_fade_to_music

	thumb_func_start s37_fadeout
s37_fadeout: @ 8066A2C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r1, 0
	beq _08066A46
	lsls r0, r1, 26
	lsrs r0, 24
	bl sub_8074FB8
	b _08066A4C
_08066A46:
	movs r0, 0x4
	bl sub_8074FB8
_08066A4C:
	ldr r1, _08066A5C
	adds r0, r4, 0
	bl script_setup_asm_script
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066A5C: .4byte sub_8074FD0
	thumb_func_end s37_fadeout

	thumb_func_start s38_fadein
s38_fadein: @ 8066A60
	push {lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	cmp r2, 0
	beq _08066A78
	lsls r0, r2, 26
	lsrs r0, 24
	bl sub_8074FF8
	b _08066A7E
_08066A78:
	movs r0, 0x4
	bl sub_8074FF8
_08066A7E:
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s38_fadein

	thumb_func_start s4F_execute_movement
s4F_execute_movement: @ 8066A84
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_word
	adds r3, r0, 0
	lsls r0, r4, 24
	lsrs r0, 24
	ldr r2, _08066ABC
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl exec_movement
	ldr r0, _08066AC0
	strh r4, [r0]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08066ABC: .4byte 0x02025734
_08066AC0: .4byte 0x0202e8b6
	thumb_func_end s4F_execute_movement

	thumb_func_start s50_execute_movement_remote
s50_execute_movement_remote: @ 8066AC4
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_word
	adds r3, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	lsls r0, r4, 24
	lsrs r0, 24
	bl exec_movement
	ldr r0, _08066B04
	strh r4, [r0]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08066B04: .4byte 0x0202e8b6
	thumb_func_end s50_execute_movement_remote

	thumb_func_start s51a_0806B288
s51a_0806B288: @ 8066B08
	push {lr}
	ldr r0, _08066B24
	ldrb r0, [r0]
	ldr r1, _08066B28
	ldrb r1, [r1]
	ldr r2, _08066B2C
	ldrb r2, [r2]
	bl sub_80A212C
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08066B24: .4byte 0x0202e8b6
_08066B28: .4byte 0x0202e8ba
_08066B2C: .4byte 0x0202e8b8
	thumb_func_end s51a_0806B288

	thumb_func_start s51_waitmove
s51_waitmove: @ 8066B30
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _08066B4C
	ldr r0, _08066B70
	strh r1, [r0]
_08066B4C:
	ldr r1, _08066B74
	ldr r2, _08066B78
	movs r0, 0x4
	ldrsb r0, [r2, r0]
	strh r0, [r1]
	ldr r1, _08066B7C
	movs r0, 0x5
	ldrsb r0, [r2, r0]
	strh r0, [r1]
	ldr r1, _08066B80
	adds r0, r4, 0
	bl script_setup_asm_script
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066B70: .4byte 0x0202e8b6
_08066B74: .4byte 0x0202e8b8
_08066B78: .4byte 0x02025734
_08066B7C: .4byte 0x0202e8ba
_08066B80: .4byte s51a_0806B288
	thumb_func_end s51_waitmove

	thumb_func_start s52_waitmove_remote
s52_waitmove_remote: @ 8066B84
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _08066BA0
	ldr r0, _08066BC8
	strh r1, [r0]
_08066BA0:
	ldr r0, [r4, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	ldr r0, _08066BCC
	strh r2, [r0]
	ldr r0, _08066BD0
	strh r1, [r0]
	ldr r1, _08066BD4
	adds r0, r4, 0
	bl script_setup_asm_script
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066BC8: .4byte 0x0202e8b6
_08066BCC: .4byte 0x0202e8b8
_08066BD0: .4byte 0x0202e8ba
_08066BD4: .4byte s51a_0806B288
	thumb_func_end s52_waitmove_remote

	thumb_func_start sub_8066BD8
sub_8066BD8: @ 8066BD8
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08066BFC
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl RemoveFieldObjectByLocalIdAndMap
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08066BFC: .4byte 0x02025734
	thumb_func_end sub_8066BD8

	thumb_func_start s54_hide_sprite_set_coords
s54_hide_sprite_set_coords: @ 8066C00
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	bl RemoveFieldObjectByLocalIdAndMap
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s54_hide_sprite_set_coords

	thumb_func_start sub_8066C30
sub_8066C30: @ 8066C30
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08066C54
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl show_sprite
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08066C54: .4byte 0x02025734
	thumb_func_end sub_8066C30

	thumb_func_start s56_show_sprite_set_coords
s56_show_sprite_set_coords: @ 8066C58
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	bl show_sprite
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s56_show_sprite_set_coords

	thumb_func_start s57_move_sprites
s57_move_sprites: @ 8066C88
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r6, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r5, 24
	lsrs r5, 24
	ldr r2, _08066CE8
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	lsls r4, 16
	asrs r4, 16
	lsls r0, 16
	asrs r0, 16
	str r0, [sp]
	adds r0, r5, 0
	adds r3, r4, 0
	bl sub_805C0F8
	movs r0, 0
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08066CE8: .4byte 0x02025734
	thumb_func_end s57_move_sprites

	thumb_func_start s63_new_sprite_location_permanent
s63_new_sprite_location_permanent: @ 8066CEC
	push {r4-r6,lr}
	adds r6, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r6, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r2, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 16
	asrs r4, 16
	lsls r2, 16
	asrs r2, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl update_saveblock1_field_object_coords
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end s63_new_sprite_location_permanent

	thumb_func_start s64_set_sprite_top_left_corner
s64_set_sprite_top_left_corner: @ 8066D44
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08066D68
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl sub_805C78C
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08066D68: .4byte 0x02025734
	thumb_func_end s64_set_sprite_top_left_corner

	thumb_func_start s58_npc_f1_clear_x20
s58_npc_f1_clear_x20: @ 8066D6C
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0
	bl npc_by_local_id_and_map_set_field_1_bit_x20
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s58_npc_f1_clear_x20

	thumb_func_start s59_npc_f1_set_x20
s59_npc_f1_set_x20: @ 8066D9C
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0x1
	bl npc_by_local_id_and_map_set_field_1_bit_x20
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s59_npc_f1_set_x20

	thumb_func_start sA8_unknown
sA8_unknown: @ 8066DCC
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r3, [r5, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r5, 0x8]
	ldrb r1, [r3]
	adds r4, r3, 0x1
	str r4, [r5, 0x8]
	ldrb r3, [r3, 0x1]
	adds r4, 0x1
	str r4, [r5, 0x8]
	lsls r0, 24
	lsrs r0, 24
	adds r3, 0x53
	lsls r3, 24
	lsrs r3, 24
	bl sub_805BCF0
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sA8_unknown

	thumb_func_start sA9_unknown
sA9_unknown: @ 8066E08
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	bl sub_805BD48
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sA9_unknown

	thumb_func_start s5A_face_player
s5A_face_player: @ 8066E38
	push {r4,lr}
	ldr r2, _08066E68
	ldr r0, _08066E6C
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	ldrb r0, [r4]
	lsls r0, 31
	cmp r0, 0
	beq _08066E60
	bl player_get_direction_lower_nybble
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectFaceOppositeDirection
_08066E60:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066E68: .4byte 0x030048a0
_08066E6C: .4byte 0x03004ae0
	thumb_func_end s5A_face_player

	thumb_func_start s5B_npc_set_direction
s5B_npc_set_direction: @ 8066E70
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r1, [r4, 0x8]
	ldrb r3, [r1]
	adds r1, 0x1
	str r1, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08066EA0
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl FieldObjectTurnByLocalIdAndMap
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066EA0: .4byte 0x02025734
	thumb_func_end s5B_npc_set_direction

	thumb_func_start s65_set_sprite_behaviour
s65_set_sprite_behaviour: @ 8066EA4
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r2, [r4, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	bl update_saveblock1_field_object_movement_behavior
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s65_set_sprite_behaviour

	thumb_func_start sAA_create_new_sprite
sAA_create_new_sprite: @ 8066ECC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r6, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r3, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	lsls r4, 16
	asrs r4, 16
	lsls r3, 16
	asrs r3, 16
	str r2, [sp]
	str r1, [sp, 0x4]
	mov r0, r8
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_805B410
	movs r0, 0
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sAA_create_new_sprite

	thumb_func_start sAB_unknown
sAB_unknown: @ 8066F3C
	push {lr}
	ldr r2, [r0, 0x8]
	ldrb r3, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	adds r0, r3, 0
	bl sub_8064990
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sAB_unknown

	thumb_func_start sub_8066F58
sub_8066F58: @ 8066F58
	push {r4,lr}
	adds r4, r0, 0
	bl is_c1_link_related_active
	cmp r0, 0
	bne _08066F78
	bl sub_8064D20
	ldr r1, _08066F74
	adds r0, r4, 0
	bl script_setup_asm_script
	movs r0, 0x1
	b _08066F7A
	.align 2, 0
_08066F74: .4byte sub_8064CFC
_08066F78:
	movs r0, 0
_08066F7A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8066F58

	thumb_func_start sub_8066F80
sub_8066F80: @ 8066F80
	push {r4,lr}
	adds r4, r0, 0
	bl is_c1_link_related_active
	cmp r0, 0
	beq _08066F90
	movs r0, 0
	b _08066FCE
_08066F90:
	ldr r2, _08066FB4
	ldr r0, _08066FB8
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	beq _08066FC0
	bl sub_8064DD8
	ldr r1, _08066FBC
	adds r0, r4, 0
	bl script_setup_asm_script
	b _08066FCC
	.align 2, 0
_08066FB4: .4byte 0x030048a0
_08066FB8: .4byte 0x03004ae0
_08066FBC: .4byte sub_8064DB4
_08066FC0:
	bl sub_8064D20
	ldr r1, _08066FD4
	adds r0, r4, 0
	bl script_setup_asm_script
_08066FCC:
	movs r0, 0x1
_08066FCE:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066FD4: .4byte sub_8064CFC
	thumb_func_end sub_8066F80

	thumb_func_start s6B_release
s6B_release: @ 8066FD8
	push {lr}
	bl textbox_close
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0806700C
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimFinished
	bl sub_80A2178
	bl sub_806451C
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806700C: .4byte 0x030048a0
	thumb_func_end s6B_release

	thumb_func_start s6C_release_2
s6C_release_2: @ 8067010
	push {r4,lr}
	bl textbox_close
	ldr r4, _08067060
	ldr r0, _08067064
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r4
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _08067032
	adds r0, r1, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
_08067032:
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl FieldObjectClearAnimIfSpecialAnimFinished
	bl sub_80A2178
	bl sub_806451C
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067060: .4byte 0x030048a0
_08067064: .4byte 0x03004ae0
	thumb_func_end s6C_release_2

	thumb_func_start s67_execute_box
s67_execute_box: @ 8067068
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_word
	cmp r0, 0
	bne _08067076
	ldr r0, [r4, 0x64]
_08067076:
	bl box_related_two__2
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s67_execute_box

	thumb_func_start s9B_unknown
s9B_unknown: @ 8067084
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_word
	cmp r0, 0
	bne _08067092
	ldr r0, [r4, 0x64]
_08067092:
	bl box_related_two__3
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s9B_unknown

	thumb_func_start sub_80670A0
sub_80670A0: @ 80670A0
	push {lr}
	ldr r1, _080670B0
	bl script_setup_asm_script
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_080670B0: .4byte sub_8064C84
	thumb_func_end sub_80670A0

	thumb_func_start s68_close_box
s68_close_box: @ 80670B4
	push {lr}
	bl textbox_close
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s68_close_box

	thumb_func_start sub_80670C0
sub_80670C0: @ 80670C0
	push {lr}
	ldr r0, _080670DC
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080670E0
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080670E0
	movs r0, 0
	b _080670E2
	.align 2, 0
_080670DC: .4byte 0x03001770
_080670E0:
	movs r0, 0x1
_080670E2:
	pop {r1}
	bx r1
	thumb_func_end sub_80670C0

	thumb_func_start sub_80670E8
sub_80670E8: @ 80670E8
	push {lr}
	ldr r1, _080670F8
	bl script_setup_asm_script
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_080670F8: .4byte sub_80670C0
	thumb_func_end sub_80670E8

	thumb_func_start s6E_yes_no
s6E_yes_no: @ 80670FC
	push {lr}
	ldr r2, [r0, 0x8]
	ldrb r3, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	adds r0, r3, 0
	bl yes_no_box
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806711E
	movs r0, 0
	b _08067124
_0806711E:
	bl sub_80655F0
	movs r0, 0x1
_08067124:
	pop {r1}
	bx r1
	thumb_func_end s6E_yes_no

	thumb_func_start sub_8067128
sub_8067128: @ 8067128
	push {r4,r5,lr}
	ldr r2, [r0, 0x8]
	ldrb r5, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r3, r2, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r2, 0x1]
	adds r4, r3, 0x1
	str r4, [r0, 0x8]
	ldrb r3, [r3, 0x1]
	adds r4, 0x1
	str r4, [r0, 0x8]
	adds r0, r5, 0
	bl sub_80B5054
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08067156
	movs r0, 0
	b _0806715C
_08067156:
	bl sub_80655F0
	movs r0, 0x1
_0806715C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8067128

	thumb_func_start sub_8067164
sub_8067164: @ 8067164
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	ldr r2, [r0, 0x8]
	ldrb r1, [r2]
	mov r8, r1
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r3, r2, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r2, 0x1]
	adds r5, r3, 0x1
	str r5, [r0, 0x8]
	ldrb r6, [r3, 0x1]
	adds r4, r5, 0x1
	str r4, [r0, 0x8]
	ldrb r3, [r5, 0x1]
	adds r4, 0x1
	str r4, [r0, 0x8]
	str r6, [sp]
	mov r0, r8
	bl sub_80B50B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080671A2
	movs r0, 0
	b _080671A8
_080671A2:
	bl sub_80655F0
	movs r0, 0x1
_080671A8:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8067164

	thumb_func_start sub_80671B4
sub_80671B4: @ 80671B4
	push {r4,r5,lr}
	ldr r2, [r0, 0x8]
	ldrb r5, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r3, r2, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r2, 0x1]
	adds r4, r3, 0x1
	str r4, [r0, 0x8]
	ldrb r3, [r3, 0x1]
	adds r4, 0x1
	str r4, [r0, 0x8]
	adds r0, r5, 0
	bl MenuDrawTextWindow
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80671B4

	thumb_func_start sub_80671E0
sub_80671E0: @ 80671E0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	ldr r2, [r0, 0x8]
	ldrb r1, [r2]
	mov r8, r1
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r3, r2, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r2, 0x1]
	adds r5, r3, 0x1
	str r5, [r0, 0x8]
	ldrb r6, [r3, 0x1]
	adds r4, r5, 0x1
	str r4, [r0, 0x8]
	ldrb r3, [r5, 0x1]
	adds r4, 0x1
	str r4, [r0, 0x8]
	str r6, [sp]
	mov r0, r8
	bl sub_80B5578
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806721E
	movs r0, 0
	b _08067224
_0806721E:
	bl sub_80655F0
	movs r0, 0x1
_08067224:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80671E0

	thumb_func_start sub_8067230
sub_8067230: @ 8067230
	push {r4,r5,lr}
	ldr r2, [r0, 0x8]
	ldrb r5, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r3, r2, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r2, 0x1]
	adds r4, r3, 0x1
	str r4, [r0, 0x8]
	ldrb r3, [r3, 0x1]
	adds r4, 0x1
	str r4, [r0, 0x8]
	adds r0, r5, 0
	bl MenuZeroFillWindowRect
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8067230

	thumb_func_start s6F_multichoice
s6F_multichoice: @ 806725C
	push {r4,r5,lr}
	ldr r2, [r0, 0x8]
	ldrb r5, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r3, r2, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r2, 0x1]
	adds r4, r3, 0x1
	str r4, [r0, 0x8]
	ldrb r3, [r3, 0x1]
	adds r4, 0x1
	str r4, [r0, 0x8]
	adds r0, r5, 0
	bl Multichoice
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806728A
	movs r0, 0
	b _08067290
_0806728A:
	bl sub_80655F0
	movs r0, 0x1
_08067290:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s6F_multichoice

	thumb_func_start sub_8067298
sub_8067298: @ 8067298
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r3, [r4, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	bl sub_80B58C4
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8067298

	thumb_func_start s76_close_picture_box
s76_close_picture_box: @ 80672C8
	push {r4,lr}
	adds r4, r0, 0
	bl picbox_close
	adds r1, r0, 0
	cmp r1, 0
	beq _080672E0
	adds r0, r4, 0
	bl script_setup_asm_script
	movs r0, 0x1
	b _080672E2
_080672E0:
	movs r0, 0
_080672E2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s76_close_picture_box

	thumb_func_start s77_showcontestwinner
s77_showcontestwinner: @ 80672E8
	push {lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	cmp r2, 0
	beq _080672FC
	adds r0, r2, 0
	bl sub_8106630
_080672FC:
	bl sub_80C4F10
	bl sub_80655F0
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end s77_showcontestwinner

	thumb_func_start sub_806730C
sub_806730C: @ 806730C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	bl script_read_word
	adds r1, r0, 0
	ldrb r5, [r1]
	ldrb r6, [r1, 0x1]
	ldrb r0, [r1, 0x2]
	mov r8, r0
	ldrb r0, [r1, 0x3]
	mov r9, r0
	ldrb r0, [r1, 0x4]
	mov r10, r0
	ldrb r7, [r1, 0x5]
	ldr r4, _08067360
	adds r1, 0x6
	adds r0, r4, 0
	bl StringBraille
	adds r0, r5, 0
	adds r1, r6, 0
	mov r2, r8
	mov r3, r9
	bl MenuDrawTextWindow
	adds r0, r4, 0
	mov r1, r10
	adds r2, r7, 0
	bl MenuPrint
	movs r0, 0
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08067360: .4byte 0x020234cc
	thumb_func_end sub_806730C

	thumb_func_start sBD_virtual_message
sBD_virtual_message: @ 8067364
	push {lr}
	bl script_read_word
	ldr r1, _0806737C
	ldr r1, [r1]
	subs r0, r1
	bl box_related_two__2
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806737C: .4byte 0x0202e8b0
	thumb_func_end sBD_virtual_message

	thumb_func_start s7D_load_pokename
s7D_load_pokename: @ 8067380
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _080673B8
	lsls r4, 2
	adds r4, r1
	ldr r2, [r4]
	movs r1, 0xB
	muls r1, r0
	ldr r0, _080673BC
	adds r1, r0
	adds r0, r2, 0
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080673B8: .4byte gUnknown_083762F0
_080673BC: .4byte gSpeciesNames
	thumb_func_end s7D_load_pokename

	thumb_func_start s7E_load_first_pokenames
s7E_load_first_pokenames: @ 80673C0
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldr r0, _08067400
	lsls r2, 2
	adds r2, r0
	ldr r4, [r2]
	bl sub_810F87C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _08067404
	adds r0, r1
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	movs r1, 0xB
	muls r1, r0
	ldr r0, _08067408
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067400: .4byte gUnknown_083762F0
_08067404: .4byte 0x03004360
_08067408: .4byte gSpeciesNames
	thumb_func_end s7E_load_first_pokenames

	thumb_func_start s7F_load_pokename_team
s7F_load_pokename_team: @ 806740C
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0806744C
	adds r0, r1
	ldr r1, _08067450
	lsls r4, 2
	adds r4, r1
	ldr r4, [r4]
	movs r1, 0x2
	adds r2, r4, 0
	bl GetMonData
	adds r0, r4, 0
	bl StringGetEnd10
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806744C: .4byte 0x03004360
_08067450: .4byte gUnknown_083762F0
	thumb_func_end s7F_load_pokename_team

	thumb_func_start s80_load_item_name
s80_load_item_name: @ 8067454
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08067484
	lsls r4, 2
	adds r4, r1
	ldr r1, [r4]
	bl itemid_copy_name
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067484: .4byte gUnknown_083762F0
	thumb_func_end s80_load_item_name

	thumb_func_start sub_8067488
sub_8067488: @ 8067488
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 16
	ldr r0, _080674BC
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	lsrs r1, 11
	ldr r2, _080674C0
	adds r1, r2
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080674BC: .4byte gUnknown_083762F0
_080674C0: .4byte gDecorations + 0x1
	thumb_func_end sub_8067488

	thumb_func_start s82_load_item_name
s82_load_item_name: @ 80674C4
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _080674FC
	lsls r4, 2
	adds r4, r1
	ldr r2, [r4]
	movs r1, 0xD
	muls r1, r0
	ldr r0, _08067500
	adds r1, r0
	adds r0, r2, 0
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080674FC: .4byte gUnknown_083762F0
_08067500: .4byte gMoveNames
	thumb_func_end s82_load_item_name

	thumb_func_start s83_load_textvar_var
s83_load_textvar_var: @ 8067504
	push {r4,r5,lr}
	ldr r1, [r0, 0x8]
	ldrb r5, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	bl sub_80BF0B8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _08067544
	lsls r5, 2
	adds r5, r0
	ldr r0, [r5]
	adds r1, r4, 0
	movs r2, 0
	bl ConvertIntToDecimalStringN
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08067544: .4byte gUnknown_083762F0
	thumb_func_end s83_load_textvar_var

	thumb_func_start s84_load_textvar_std_expression
s84_load_textvar_std_expression: @ 8067548
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	ldr r1, _08067580
	lsls r4, 2
	adds r4, r1
	ldr r2, [r4]
	ldr r1, _08067584
	lsrs r0, 14
	adds r0, r1
	ldr r1, [r0]
	adds r0, r2, 0
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067580: .4byte gUnknown_083762F0
_08067584: .4byte gUnknown_083CE048
	thumb_func_end s84_load_textvar_std_expression

	thumb_func_start s85_load_textvar_pointer
s85_load_textvar_pointer: @ 8067588
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl script_read_word
	adds r1, r0, 0
	ldr r0, _080675AC
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080675AC: .4byte gUnknown_083762F0
	thumb_func_end s85_load_textvar_pointer

	thumb_func_start sBE_virtual_load_text
sBE_virtual_load_text: @ 80675B0
	push {lr}
	bl script_read_word
	adds r1, r0, 0
	ldr r0, _080675CC
	ldr r0, [r0]
	subs r1, r0
	ldr r0, _080675D0
	bl StringExpandPlaceholders
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080675CC: .4byte 0x0202e8b0
_080675D0: .4byte 0x020234cc
	thumb_func_end sBE_virtual_load_text

	thumb_func_start sBF_virtual_load_textbuffer
sBF_virtual_load_textbuffer: @ 80675D4
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl script_read_word
	adds r1, r0, 0
	ldr r0, _08067600
	ldr r0, [r0]
	subs r1, r0
	ldr r0, _08067604
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067600: .4byte 0x0202e8b0
_08067604: .4byte gUnknown_083762F0
	thumb_func_end sBF_virtual_load_textbuffer

	thumb_func_start s79_give_pokemon
s79_give_pokemon: @ 8067608
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x8
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r6, r0, 0
	lsls r6, 16
	lsrs r6, 16
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r4, 0x8]
	adds r0, r4, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	bl script_read_word
	mov r8, r0
	adds r0, r4, 0
	bl script_read_word
	ldr r1, [r4, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r4, 0x8]
	ldr r4, _08067684
	str r0, [sp]
	str r2, [sp, 0x4]
	adds r0, r6, 0
	mov r1, r9
	adds r2, r5, 0
	mov r3, r8
	bl sub_80C5374
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08067684: .4byte 0x0202e8dc
	thumb_func_end s79_give_pokemon

	thumb_func_start s7A_create_egg
s7A_create_egg: @ 8067688
	push {r4,lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080676B0
	bl sub_80C53F8
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080676B0: .4byte 0x0202e8dc
	thumb_func_end s7A_create_egg

	thumb_func_start s7B_change_pokedata_AP
s7B_change_pokedata_AP: @ 80676B4
	push {r4,r5,lr}
	ldr r1, [r0, 0x8]
	ldrb r5, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl script_read_halfword
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r5, 0
	adds r2, r4, 0
	bl sub_80C5530
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s7B_change_pokedata_AP

	thumb_func_start sub_80676E0
sub_80676E0: @ 80676E0
	push {r4-r7,lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r1, _080676F4
	movs r0, 0x6
	strh r0, [r1]
	movs r6, 0
	b _0806772E
	.align 2, 0
_080676F4: .4byte 0x0202e8dc
_080676F8:
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _08067728
	adds r0, r4, 0
	adds r1, r7, 0
	bl pokemon_has_move
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08067728
	ldr r0, _08067720
	strh r6, [r0]
	ldr r0, _08067724
	strh r5, [r0]
	b _0806774E
	.align 2, 0
_08067720: .4byte 0x0202e8dc
_08067724: .4byte 0x0202e8cc
_08067728:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0806772E:
	cmp r6, 0x5
	bhi _0806774E
	movs r0, 0x64
	adds r1, r6, 0
	muls r1, r0
	ldr r0, _08067758
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	bne _080676F8
_0806774E:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08067758: .4byte 0x03004360
	thumb_func_end sub_80676E0

	thumb_func_start sub_806775C
sub_806775C: @ 806775C
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_word
	adds r2, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r1, 0
	bne _0806777A
	ldr r0, _08067784
	adds r1, r2, 0
	bl sub_80B79B8
_0806777A:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067784: .4byte 0x02025bc4
	thumb_func_end sub_806775C

	thumb_func_start sub_8067788
sub_8067788: @ 8067788
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_word
	adds r2, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r1, 0
	bne _080677A6
	ldr r0, _080677B0
	adds r1, r2, 0
	bl sub_80B79E0
_080677A6:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080677B0: .4byte 0x02025bc4
	thumb_func_end sub_8067788

	thumb_func_start s92_check_money
s92_check_money: @ 80677B4
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_word
	adds r2, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r1, 0
	bne _080677E2
	ldr r4, _080677EC
	ldr r0, _080677F0
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	adds r1, r2, 0
	bl IsEnoughMoney
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
_080677E2:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080677EC: .4byte 0x0202e8dc
_080677F0: .4byte 0x02025734
	thumb_func_end s92_check_money

	thumb_func_start sub_80677F4
sub_80677F4: @ 80677F4
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldrb r3, [r1]
	adds r2, r1, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r1, 0x1]
	adds r2, 0x1
	str r2, [r0, 0x8]
	cmp r1, 0
	bne _08067820
	ldr r0, _08067828
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	adds r1, r4, 0
	adds r2, r3, 0
	bl sub_80B7C14
_08067820:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067828: .4byte 0x02025734
	thumb_func_end sub_80677F4

	thumb_func_start sub_806782C
sub_806782C: @ 806782C
	push {lr}
	ldr r2, [r0, 0x8]
	ldrb r3, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	adds r0, r3, 0
	bl RemoveMoneyLabelObject
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806782C

	thumb_func_start sub_8067848
sub_8067848: @ 8067848
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldrb r3, [r1]
	adds r2, r1, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r1, 0x1]
	adds r2, 0x1
	str r2, [r0, 0x8]
	cmp r1, 0
	bne _08067874
	ldr r0, _0806787C
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	adds r1, r4, 0
	adds r2, r3, 0
	bl sub_80B7BEC
_08067874:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806787C: .4byte 0x02025734
	thumb_func_end sub_8067848

	thumb_func_start sub_8067880
sub_8067880: @ 8067880
	push {lr}
	ldr r3, [r0, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r0, 0x8]
	ldr r0, _080678A4
	ldr r3, _080678A8
	adds r0, r3
	ldrh r0, [r0]
	bl sub_811A72C
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080678A4: .4byte 0x02025734
_080678A8: .4byte 0x00000494
	thumb_func_end sub_8067880

	thumb_func_start sub_80678AC
sub_80678AC: @ 80678AC
	push {lr}
	ldr r2, [r0, 0x8]
	ldrb r3, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	adds r0, r3, 0
	bl sub_811A770
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80678AC

	thumb_func_start sub_80678C8
sub_80678C8: @ 80678C8
	push {lr}
	ldr r3, [r0, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r0, 0x8]
	ldr r0, _080678EC
	ldr r3, _080678F0
	adds r0, r3
	ldrh r0, [r0]
	bl sub_811A704
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080678EC: .4byte 0x02025734
_080678F0: .4byte 0x00000494
	thumb_func_end sub_80678C8

	thumb_func_start s5C_trainer_battle_configure_and_start
s5C_trainer_battle_configure_and_start: @ 80678F4
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	bl sub_80823C8
	str r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s5C_trainer_battle_configure_and_start

	thumb_func_start sub_8067908
sub_8067908: @ 8067908
	push {lr}
	bl sub_80825E4
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8067908

	thumb_func_start sub_8067914
sub_8067914: @ 8067914
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80826E8
	str r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8067914

	thumb_func_start sub_8067928
sub_8067928: @ 8067928
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8082700
	str r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8067928

	thumb_func_start s60_check_trainer_flag
s60_check_trainer_flag: @ 806793C
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl trainer_flag_check
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s60_check_trainer_flag

	thumb_func_start s61_set_trainer_flag
s61_set_trainer_flag: @ 8067960
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl trainer_flag_set
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s61_set_trainer_flag

	thumb_func_start s62_unset_trainer_flag
s62_unset_trainer_flag: @ 806797C
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl trainer_flag_clear
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s62_unset_trainer_flag

	thumb_func_start sB6_load_battle
sB6_load_battle: @ 8067998
	push {r4-r6,lr}
	adds r4, r0, 0
	bl script_read_halfword
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	ldr r0, [r4, 0x8]
	ldrb r6, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	adds r0, r4, 0
	bl script_read_halfword
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_80C54D0
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sB6_load_battle

	thumb_func_start sub_80679CC
sub_80679CC: @ 80679CC
	push {lr}
	bl sub_8081B3C
	bl sub_80655F0
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_80679CC

	thumb_func_start s86_pokemart
s86_pokemart: @ 80679DC
	push {lr}
	bl script_read_word
	bl CreatePokemartMenu
	bl sub_80655F0
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end s86_pokemart

	thumb_func_start s87_pokemartdecor
s87_pokemartdecor: @ 80679F0
	push {lr}
	bl script_read_word
	bl CreateDecorationShop1Menu
	bl sub_80655F0
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end s87_pokemartdecor

	thumb_func_start s88_pokemartbp
s88_pokemartbp: @ 8067A04
	push {lr}
	bl script_read_word
	bl CreateDecorationShop2Menu
	bl sub_80655F0
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end s88_pokemartbp

	thumb_func_start s89_open_casino_game1
s89_open_casino_game1: @ 8067A18
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08067A3C
	bl sub_81018A0
	bl sub_80655F0
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08067A3C: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end s89_open_casino_game1

	thumb_func_start berry_script_cmd
berry_script_cmd: @ 8067A40
	push {r4,r5,lr}
	ldr r1, [r0, 0x8]
	ldrb r5, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldrb r3, [r1]
	adds r2, r1, 0x1
	str r2, [r0, 0x8]
	ldrb r4, [r1, 0x1]
	adds r2, 0x1
	str r2, [r0, 0x8]
	cmp r3, 0
	bne _08067A68
	adds r0, r5, 0
	movs r1, 0
	adds r2, r4, 0
	movs r3, 0
	bl PlantBerryTree
	b _08067A74
_08067A68:
	adds r0, r5, 0
	adds r1, r3, 0
	adds r2, r4, 0
	movs r3, 0
	bl PlantBerryTree
_08067A74:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end berry_script_cmd

	thumb_func_start sub_8067A7C
sub_8067A7C: @ 8067A7C
	push {r4,lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r4, _08067AA4
	lsls r0, 24
	lsrs r0, 24
	bl GetPriceReduction
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067AA4: .4byte 0x0202e8dc
	thumb_func_end sub_8067A7C

	thumb_func_start sub_8067AA8
sub_8067AA8: @ 8067AA8
	push {lr}
	bl sub_80F99CC
	bl sub_80655F0
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8067AA8

	thumb_func_start sub_8067AB8
sub_8067AB8: @ 8067AB8
	push {lr}
	bl sub_80C48C8
	bl sub_80655F0
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8067AB8

	thumb_func_start sub_8067AC8
sub_8067AC8: @ 8067AC8
	push {lr}
	bl sub_80C4940
	bl sub_80655F0
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8067AC8

	thumb_func_start sub_8067AD8
sub_8067AD8: @ 8067AD8
	push {lr}
	ldr r0, _08067AEC
	ldrb r0, [r0]
	bl sub_80C4980
	bl sub_80655F0
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08067AEC: .4byte 0x0203869c
	thumb_func_end sub_8067AD8

	thumb_func_start s9C_execute_HM
s9C_execute_HM: @ 8067AF0
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08067B14
	strh r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	bl FieldEffectStart
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08067B14: .4byte 0x0202e8bc
	thumb_func_end s9C_execute_HM

	thumb_func_start s9D_set_HM_animation_data
s9D_set_HM_animation_data: @ 8067B18
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r1, _08067B44
	lsls r4, 2
	adds r4, r1
	lsls r0, 16
	asrs r0, 16
	str r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067B44: .4byte 0x0202ff84
	thumb_func_end s9D_set_HM_animation_data

	thumb_func_start sub_8067B48
sub_8067B48: @ 8067B48
	push {lr}
	ldr r0, _08067B5C
	ldrb r0, [r0]
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	beq _08067B60
	movs r0, 0
	b _08067B62
	.align 2, 0
_08067B5C: .4byte 0x0202e8bc
_08067B60:
	movs r0, 0x1
_08067B62:
	pop {r1}
	bx r1
	thumb_func_end sub_8067B48

	thumb_func_start s9E_checkarray_HM_animation
s9E_checkarray_HM_animation: @ 8067B68
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r1, _08067B8C
	strh r0, [r1]
	ldr r1, _08067B90
	adds r0, r4, 0
	bl script_setup_asm_script
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067B8C: .4byte 0x0202e8bc
_08067B90: .4byte sub_8067B48
	thumb_func_end s9E_checkarray_HM_animation

	thumb_func_start sub_8067B94
sub_8067B94: @ 8067B94
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	bl sub_8053588
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8067B94

	thumb_func_start sub_8067BB0
sub_8067BB0: @ 8067BB0
	ldr r0, _08067BBC
	ldr r1, _08067BC0
	ldrb r1, [r1, 0x8]
	strh r1, [r0]
	movs r0, 0
	bx lr
	.align 2, 0
_08067BBC: .4byte 0x0202e8dc
_08067BC0: .4byte gSaveBlock2
	thumb_func_end sub_8067BB0

	thumb_func_start sA1_play_cry
sA1_play_cry: @ 8067BC4
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_8075178
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sA1_play_cry

	thumb_func_start sub_8067BFC
sub_8067BFC: @ 8067BFC
	push {lr}
	ldr r1, _08067C0C
	bl script_setup_asm_script
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08067C0C: .4byte sub_8075374
	thumb_func_end sub_8067BFC

	thumb_func_start sA2_setmaptile
sA2_setmaptile: @ 8067C10
	push {r4-r7,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r4, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	adds r1, r6, 0x7
	lsls r1, 16
	lsrs r6, r1, 16
	adds r1, r5, 0x7
	lsls r1, 16
	lsrs r5, r1, 16
	cmp r0, 0
	bne _08067C74
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r7, 0
	bl MapGridSetMetatileIdAt
	b _08067C86
_08067C74:
	movs r1, 0xC0
	lsls r1, 4
	adds r0, r1, 0
	adds r2, r7, 0
	orrs r2, r0
	adds r0, r6, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
_08067C86:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sA2_setmaptile

	thumb_func_start sAC_open_door
sAC_open_door: @ 8067C90
	push {r4,r5,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	adds r5, 0x7
	lsls r5, 16
	lsrs r5, 16
	movs r0, 0xE0
	lsls r0, 11
	adds r4, r0
	lsrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8058790
	lsls r0, 16
	lsrs r0, 16
	bl audio_play
	adds r0, r5, 0
	adds r1, r4, 0
	bl task_overworld_door_add_if_role_69_for_opening_door_at
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sAC_open_door

	thumb_func_start sub_8067CE8
sub_8067CE8: @ 8067CE8
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 16
	adds r4, 0x7
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0xE0
	lsls r0, 11
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_805870C
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8067CE8

	thumb_func_start sub_8067D2C
sub_8067D2C: @ 8067D2C
	push {lr}
	bl sub_805877C
	lsls r0, 24
	cmp r0, 0
	beq _08067D3C
	movs r0, 0
	b _08067D3E
_08067D3C:
	movs r0, 0x1
_08067D3E:
	pop {r1}
	bx r1
	thumb_func_end sub_8067D2C

	thumb_func_start sub_8067D44
sub_8067D44: @ 8067D44
	push {lr}
	ldr r1, _08067D54
	bl script_setup_asm_script
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08067D54: .4byte sub_8067D2C
	thumb_func_end sub_8067D44

	thumb_func_start sub_8067D58
sub_8067D58: @ 8067D58
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 16
	adds r4, 0x7
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0xE0
	lsls r0, 11
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_80586B4
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8067D58

	thumb_func_start sub_8067D9C
sub_8067D9C: @ 8067D9C
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 16
	adds r4, 0x7
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0xE0
	lsls r0, 11
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_80586E0
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8067D9C

	thumb_func_start sub_8067DE0
sub_8067DE0: @ 8067DE0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r6, r0, 0
	ldr r0, [r6, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r0, 0x1
	str r0, [r6, 0x8]
	adds r0, r6, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r6, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r3, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 24
	lsrs r3, 24
	mov r0, r8
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_810E7AC
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8067DE0

	thumb_func_start sub_8067E4C
sub_8067E4C: @ 8067E4C
	push {lr}
	bl sub_810E824
	bl sub_80655F0
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8067E4C

	thumb_func_start sB3_get_coin_amount
sB3_get_coin_amount: @ 8067E5C
	push {r4,lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r4, r0, 0
	bl GetCoins
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sB3_get_coin_amount

	thumb_func_start sub_8067E7C
sub_8067E7C: @ 8067E7C
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl sub_811A840
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08067EA4
	ldr r1, _08067EA0
	movs r0, 0
	b _08067EA8
	.align 2, 0
_08067EA0: .4byte 0x0202e8dc
_08067EA4:
	ldr r1, _08067EB0
	movs r0, 0x1
_08067EA8:
	strh r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08067EB0: .4byte 0x0202e8dc
	thumb_func_end sub_8067E7C

	thumb_func_start sub_8067EB4
sub_8067EB4: @ 8067EB4
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl sub_811A898
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08067EDC
	ldr r1, _08067ED8
	movs r0, 0
	b _08067EE0
	.align 2, 0
_08067ED8: .4byte 0x0202e8dc
_08067EDC:
	ldr r1, _08067EE8
	movs r0, 0x1
_08067EE0:
	strh r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08067EE8: .4byte 0x0202e8dc
	thumb_func_end sub_8067EB4

	thumb_func_start sub_8067EEC
sub_8067EEC: @ 8067EEC
	push {r4,r5,lr}
	movs r1, 0x2
	negs r1, r1
	movs r3, 0x3
	negs r3, r3
	movs r4, 0x5
	negs r4, r4
	movs r5, 0x9
	negs r5, r5
	movs r2, 0
	strb r2, [r0]
	ldrb r2, [r0, 0x1]
	ands r1, r2
	ands r1, r3
	ands r1, r4
	ands r1, r5
	strb r1, [r0, 0x1]
	movs r1, 0
	strb r1, [r0, 0x2]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8067EEC

	thumb_func_start process_overworld_input
process_overworld_input: @ 8067F18
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	ldr r0, _08067FE8
	ldrb r6, [r0, 0x3]
	ldrb r0, [r0, 0x2]
	mov r9, r0
	bl cur_mapdata_block_role_at_player_pos
	lsls r0, 24
	lsrs r0, 24
	bl sub_8056FFC
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r6, 0x2
	bne _08067F4C
	cmp r7, 0
	beq _08067F50
_08067F4C:
	cmp r6, 0
	bne _08067FB2
_08067F50:
	bl sub_80E6034
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	beq _08067F9C
	movs r0, 0x8
	ands r0, r5
	cmp r0, 0
	beq _08067F6C
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
_08067F6C:
	movs r0, 0x4
	ands r0, r5
	cmp r0, 0
	beq _08067F7C
	ldrb r0, [r4]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4]
_08067F7C:
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	beq _08067F8C
	ldrb r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4]
_08067F8C:
	movs r0, 0x2
	ands r0, r5
	cmp r0, 0
	beq _08067F9C
	ldrb r0, [r4]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r4]
_08067F9C:
	movs r0, 0xF0
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _08067FB2
	ldrb r0, [r4]
	movs r1, 0x10
	orrs r0, r1
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4]
_08067FB2:
	cmp r7, 0
	bne _08067FD8
	cmp r6, 0x2
	bne _08067FC8
	mov r0, r9
	cmp r0, 0x2
	bne _08067FC8
	ldrb r0, [r4]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r4]
_08067FC8:
	cmp r7, 0
	bne _08067FD8
	cmp r6, 0x2
	bne _08067FD8
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
_08067FD8:
	movs r0, 0x40
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _08067FEC
	movs r0, 0x2
	b _08068014
	.align 2, 0
_08067FE8: .4byte 0x0202e858
_08067FEC:
	movs r0, 0x80
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _08067FFA
	movs r0, 0x1
	b _08068014
_08067FFA:
	movs r0, 0x20
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _08068008
	movs r0, 0x3
	b _08068014
_08068008:
	movs r0, 0x10
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _08068016
	movs r0, 0x4
_08068014:
	strb r0, [r4, 0x2]
_08068016:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end process_overworld_input

	thumb_func_start sub_8068024
sub_8068024: @ 8068024
	push {r4-r6,lr}
	sub sp, 0x8
	adds r5, r0, 0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r6, r0, 24
	mov r4, sp
	mov r0, sp
	bl player_get_pos_to_and_height
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 16
	lsrs r4, r0, 16
	bl sub_8083FBC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068150
	bl mapheader_run_first_tag2_script_list_match
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068150
	ldrb r1, [r5]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08068076
	bl sub_80687A4
	cmp r0, 0x1
	beq _08068150
_08068076:
	ldrb r1, [r5]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08068098
	movs r0, 0x5
	bl sav12_xor_increment
	mov r0, sp
	adds r1, r4, 0
	adds r2, r6, 0
	bl sub_80687E4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068150
_08068098:
	ldrb r1, [r5]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080680B0
	adds r0, r4, 0
	bl is_it_battle_time_3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068150
_080680B0:
	ldrb r1, [r5]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080680D2
	ldrb r0, [r5, 0x2]
	cmp r0, r6
	bne _080680D2
	mov r0, sp
	adds r1, r4, 0
	adds r2, r6, 0
	bl mapheader_run_first_tag2_script_list_match_conditionally
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068150
_080680D2:
	mov r4, sp
	mov r0, sp
	bl player_get_next_pos_and_height
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 16
	lsrs r4, r0, 16
	ldrb r1, [r5]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08068108
	mov r0, sp
	adds r1, r4, 0
	adds r2, r6, 0
	bl sub_80681F0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068150
_08068108:
	ldrb r1, [r5]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0806812A
	ldrb r0, [r5, 0x2]
	cmp r0, r6
	bne _0806812A
	mov r0, sp
	adds r1, r4, 0
	adds r2, r6, 0
	bl map_warp_consider_2_to_inside
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068150
_0806812A:
	ldrb r1, [r5]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806813C
	bl sub_8068770
	cmp r0, 0x1
	beq _08068150
_0806813C:
	ldrb r1, [r5]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08068154
	movs r0, 0x6
	bl audio_play
	bl sub_8071310
_08068150:
	movs r0, 0x1
	b _08068166
_08068154:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08068164
	bl sub_80A6D1C
	cmp r0, 0x1
	beq _08068150
_08068164:
	movs r0, 0
_08068166:
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8068024

	thumb_func_start player_get_pos_to_and_height
player_get_pos_to_and_height: @ 8068170
	push {r4,lr}
	adds r4, r0, 0
	adds r1, r4, 0x2
	bl PlayerGetDestCoords
	bl PlayerGetZCoord
	strb r0, [r4, 0x4]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end player_get_pos_to_and_height

	thumb_func_start player_get_next_pos_and_height
player_get_next_pos_and_height: @ 8068188
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r1, r5, 0x2
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080681BA
	bl PlayerGetZCoord
_080681BA:
	strb r0, [r5, 0x4]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end player_get_next_pos_and_height

	thumb_func_start cur_mapdata_block_role_at_player_pos
cur_mapdata_block_role_at_player_pos: @ 80681C4
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 16
	lsrs r0, 16
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end cur_mapdata_block_role_at_player_pos

	thumb_func_start sub_80681F0
sub_80681F0: @ 80681F0
	push {r4,lr}
	lsls r2, 24
	lsrs r2, 24
	lsls r1, 24
	lsrs r1, 24
	bl TryGetScriptOnPressingA
	adds r4, r0, 0
	cmp r4, 0
	bne _08068208
	movs r0, 0
	b _08068234
_08068208:
	ldr r0, _0806823C
	cmp r4, r0
	beq _0806822C
	ldr r0, _08068240
	cmp r4, r0
	beq _0806822C
	ldr r0, _08068244
	cmp r4, r0
	beq _0806822C
	ldr r0, _08068248
	cmp r4, r0
	beq _0806822C
	ldr r0, _0806824C
	cmp r4, r0
	beq _0806822C
	movs r0, 0x5
	bl audio_play
_0806822C:
	adds r0, r4, 0
	bl script_env_1_execute_new_script
	movs r0, 0x1
_08068234:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806823C: .4byte gUnknown_0815281E
_08068240: .4byte gUnknown_08152C39
_08068244: .4byte gUnknown_0815F36C
_08068248: .4byte gUnknown_0815F43A
_0806824C: .4byte gUnknown_081A0009
	thumb_func_end sub_80681F0

	thumb_func_start TryGetScriptOnPressingA
TryGetScriptOnPressingA: @ 8068250
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	mov r8, r5
	lsls r2, 24
	lsrs r4, r2, 24
	adds r7, r4, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_8068364
	cmp r0, 0
	bne _0806829C
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl TryGetInvisibleMapObjectScript
	cmp r0, 0
	bne _0806829C
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_8068500
	cmp r0, 0
	bne _0806829C
	adds r0, r6, 0
	mov r1, r8
	adds r2, r7, 0
	bl TryGetFieldMoveScript
	cmp r0, 0
	bne _0806829C
	movs r0, 0
_0806829C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end TryGetScriptOnPressingA

	thumb_func_start sub_80682A8
sub_80682A8: @ 80682A8
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r2, 24
	lsrs r6, r2, 24
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsCounter
	lsls r0, 24
	cmp r0, 0
	bne _080682D0
	ldrh r0, [r4]
	ldrh r1, [r4, 0x2]
	b _080682EE
_080682D0:
	ldr r1, _08068314
	lsls r2, r6, 3
	adds r0, r2, r1
	ldr r3, [r0]
	ldrh r0, [r4]
	adds r0, r3
	lsls r0, 16
	lsrs r0, 16
	adds r1, 0x4
	adds r2, r1
	ldr r2, [r2]
	ldrh r1, [r4, 0x2]
	adds r1, r2
	lsls r1, 16
	lsrs r1, 16
_080682EE:
	ldrb r2, [r4, 0x4]
	bl GetFieldObjectIdByXYZ
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x10
	beq _0806830E
	ldr r1, _08068318
	lsls r2, r3, 3
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x8]
	adds r5, r1, 0
	cmp r0, 0xFF
	bne _0806831C
_0806830E:
	movs r0, 0
	b _0806834E
	.align 2, 0
_08068314: .4byte gUnknown_0821664C
_08068318: .4byte 0x030048a0
_0806831C:
	movs r4, 0
	ldr r1, _08068354
_08068320:
	ldrb r0, [r1]
	cmp r0, 0x1
	bne _0806832C
	ldrb r0, [r1, 0x2]
	cmp r0, r3
	beq _0806830E
_0806832C:
	adds r1, 0x4
	adds r4, 0x1
	cmp r4, 0x3
	ble _08068320
	ldr r0, _08068358
	strb r3, [r0]
	ldr r1, _0806835C
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x8]
	strh r0, [r1]
	ldr r0, _08068360
	strh r6, [r0]
	adds r0, r3, 0
	bl GetFieldObjectScriptPointerByFieldObjectId
_0806834E:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08068354: .4byte 0x02029818
_08068358: .4byte 0x03004ae0
_0806835C: .4byte 0x0202e8de
_08068360: .4byte 0x0202e8e0
	thumb_func_end sub_80682A8

	thumb_func_start sub_8068364
sub_8068364: @ 8068364
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	ldrh r0, [r4]
	ldrh r1, [r4, 0x2]
	ldrb r2, [r4, 0x4]
	bl GetFieldObjectIdByXYZ
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x10
	beq _08068392
	ldr r1, _080683E0
	lsls r2, r3, 3
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x8]
	cmp r0, 0xFF
	bne _080683E8
_08068392:
	adds r0, r5, 0
	bl MetatileBehavior_IsCounter
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080683DC
	ldr r1, _080683E4
	lsls r2, r6, 3
	adds r0, r2, r1
	ldr r3, [r0]
	ldrh r0, [r4]
	adds r0, r3
	lsls r0, 16
	lsrs r0, 16
	adds r1, 0x4
	adds r2, r1
	ldr r2, [r2]
	ldrh r1, [r4, 0x2]
	adds r1, r2
	lsls r1, 16
	lsrs r1, 16
	ldrb r2, [r4, 0x4]
	bl GetFieldObjectIdByXYZ
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x10
	beq _080683DC
	ldr r1, _080683E0
	lsls r2, r3, 3
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x8]
	cmp r0, 0xFF
	bne _080683E8
_080683DC:
	movs r0, 0
	b _0806840C
	.align 2, 0
_080683E0: .4byte 0x030048a0
_080683E4: .4byte gUnknown_0821664C
_080683E8:
	ldr r0, _08068414
	strb r3, [r0]
	ldr r4, _08068418
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x8]
	strh r0, [r4]
	ldr r0, _0806841C
	strh r6, [r0]
	adds r0, r3, 0
	bl GetFieldObjectScriptPointerByFieldObjectId
	adds r1, r0, 0
	ldrb r0, [r4]
	bl sub_806580C
	adds r1, r0, 0
_0806840C:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08068414: .4byte 0x03004ae0
_08068418: .4byte 0x0202e8de
_0806841C: .4byte 0x0202e8e0
	thumb_func_end sub_8068364

	thumb_func_start TryGetInvisibleMapObjectScript
TryGetInvisibleMapObjectScript: @ 8068420
	push {r4,r5,lr}
	lsls r2, 24
	lsrs r5, r2, 24
	ldr r4, _08068450
	ldrh r1, [r0]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r0, 0x2]
	subs r2, 0x7
	lsls r2, 16
	lsrs r2, 16
	ldrb r3, [r0, 0x4]
	adds r0, r4, 0
	bl FindInvisibleMapObjectByPosition
	cmp r0, 0
	beq _08068494
	ldr r2, [r0, 0x8]
	cmp r2, 0
	bne _08068458
	ldr r0, _08068454
	b _080684FA
	.align 2, 0
_08068450: .4byte 0x0202e828
_08068454: .4byte gUnknown_081C6C02
_08068458:
	ldrb r0, [r0, 0x5]
	cmp r0, 0x8
	bhi _080684F8
	lsls r0, 2
	ldr r1, _08068468
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08068468: .4byte _0806846C
	.align 2, 0
_0806846C:
	.4byte _080684F8
	.4byte _08068490
	.4byte _08068498
	.4byte _0806849E
	.4byte _080684A4
	.4byte _080684AA
	.4byte _080684AA
	.4byte _080684AA
	.4byte _080684D8
_08068490:
	cmp r5, 0x2
	beq _080684F8
_08068494:
	movs r0, 0
	b _080684FA
_08068498:
	cmp r5, 0x1
	beq _080684F8
	b _08068494
_0806849E:
	cmp r5, 0x4
	beq _080684F8
	b _08068494
_080684A4:
	cmp r5, 0x3
	beq _080684F8
	b _08068494
_080684AA:
	ldr r1, _080684CC
	lsrs r0, r2, 16
	movs r3, 0x96
	lsls r3, 2
	adds r0, r3
	strh r0, [r1]
	ldr r0, _080684D0
	strh r2, [r0]
	ldrh r0, [r1]
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068494
	ldr r0, _080684D4
	b _080684FA
	.align 2, 0
_080684CC: .4byte 0x0202e8cc
_080684D0: .4byte 0x0202e8ce
_080684D4: .4byte HiddenItemScript
_080684D8:
	cmp r5, 0x2
	bne _08068494
	ldr r0, _080684F0
	strh r2, [r0]
	bl sub_80BC050
	lsls r0, 24
	cmp r0, 0
	beq _08068494
	ldr r0, _080684F4
	b _080684FA
	.align 2, 0
_080684F0: .4byte 0x0202e8cc
_080684F4: .4byte gUnknown_081A2C51
_080684F8:
	adds r0, r2, 0
_080684FA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end TryGetInvisibleMapObjectScript

	thumb_func_start sub_8068500
sub_8068500: @ 8068500
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r2, 0
	bl MetatileBehavior_IsPlayerFacingTVScreen
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068524
	ldr r0, _08068520
	b _080686EE
	.align 2, 0
_08068520: .4byte Event_TV
_08068524:
	adds r0, r5, 0
	bl MetatileBehavior_IsPC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806853C
	ldr r0, _08068538
	b _080686EE
	.align 2, 0
_08068538: .4byte gUnknown_081A0009
_0806853C:
	adds r0, r5, 0
	bl is_tile_x8B
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068554
	ldr r0, _08068550
	b _080686EE
	.align 2, 0
_08068550: .4byte ClosedSootopolisGymDoorScript
_08068554:
	adds r0, r5, 0
	bl is_tile_x84
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806856C
	ldr r0, _08068568
	b _080686EE
	.align 2, 0
_08068568: .4byte gUnknown_081A4363
_0806856C:
	adds r0, r5, 0
	bl is_tile_x87
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068584
	ldr r0, _08068580
	b _080686EE
	.align 2, 0
_08068580: .4byte gUnknown_081C346A
_08068584:
	adds r0, r5, 0
	bl is_tile_x8C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806859C
	ldr r0, _08068598
	b _080686EE
	.align 2, 0
_08068598: .4byte gUnknown_081616E1
_0806859C:
	adds r0, r5, 0
	bl is_tile_x85
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080685B4
	ldr r0, _080685B0
	b _080686EE
	.align 2, 0
_080685B0: .4byte Event_WorldMap
_080685B4:
	adds r0, r5, 0
	bl sub_805791C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080685CC
	ldr r0, _080685C8
	b _080686EE
	.align 2, 0
_080685C8: .4byte Event_RunningShoesManual
_080685CC:
	adds r0, r5, 0
	bl sub_8057930
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080685E4
	ldr r0, _080685E0
	b _080686EE
	.align 2, 0
_080685E0: .4byte PictureBookShelfScript
_080685E4:
	adds r0, r5, 0
	bl sub_8057944
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080685FC
	ldr r0, _080685F8
	b _080686EE
	.align 2, 0
_080685F8: .4byte BookshelfScript
_080685FC:
	adds r0, r5, 0
	bl sub_8057958
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068614
	ldr r0, _08068610
	b _080686EE
	.align 2, 0
_08068610: .4byte PokemonCenterBookshelfScript
_08068614:
	adds r0, r5, 0
	bl sub_805796C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806862C
	ldr r0, _08068628
	b _080686EE
	.align 2, 0
_08068628: .4byte VaseScript
_0806862C:
	adds r0, r5, 0
	bl sub_8057980
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068644
	ldr r0, _08068640
	b _080686EE
	.align 2, 0
_08068640: .4byte TrashCanScript
_08068644:
	adds r0, r5, 0
	bl sub_8057994
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806865C
	ldr r0, _08068658
	b _080686EE
	.align 2, 0
_08068658: .4byte ShopShelfScript
_0806865C:
	adds r0, r5, 0
	bl sub_80579A8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068674
	ldr r0, _08068670
	b _080686EE
	.align 2, 0
_08068670: .4byte BlueprintScript
_08068674:
	movs r4, 0x4
	ldrsb r4, [r6, r4]
	movs r1, 0
	ldrsh r0, [r6, r1]
	movs r2, 0x2
	ldrsh r1, [r6, r2]
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _080686EC
	adds r0, r5, 0
	bl sub_8057238
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080686A4
	ldr r0, _080686A0
	b _080686EE
	.align 2, 0
_080686A0: .4byte gUnknown_0815F36C
_080686A4:
	adds r0, r5, 0
	bl sub_805724C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080686BC
	ldr r0, _080686B8
	b _080686EE
	.align 2, 0
_080686B8: .4byte gUnknown_0815F43A
_080686BC:
	adds r0, r5, 0
	bl sub_8057364
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080686D4
	ldr r0, _080686D0
	b _080686EE
	.align 2, 0
_080686D0: .4byte gUnknown_0815F523
_080686D4:
	adds r0, r5, 0
	bl sub_8057378
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080686EC
	ldr r0, _080686E8
	b _080686EE
	.align 2, 0
_080686E8: .4byte gUnknown_0815F528
_080686EC:
	movs r0, 0
_080686EE:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8068500

	thumb_func_start TryGetFieldMoveScript
TryGetFieldMoveScript: @ 80686F4
	push {r4,lr}
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r0, _08068724
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806872C
	bl PartyHasMonWithSurf
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806872C
	bl IsPlayerFacingSurfableFishableWater
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806872C
	ldr r0, _08068728
	b _0806876A
	.align 2, 0
_08068724: .4byte 0x0000080b
_08068728: .4byte UseSurfScript
_0806872C:
	adds r0, r4, 0
	bl MetatileBehavior_IsWaterfall
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068768
	ldr r0, _08068758
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068760
	bl IsPlayerSurfingNorth
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068760
	ldr r0, _0806875C
	b _0806876A
	.align 2, 0
_08068758: .4byte 0x0000080e
_0806875C: .4byte UseWaterfallScript
_08068760:
	ldr r0, _08068764
	b _0806876A
	.align 2, 0
_08068764: .4byte CannotUseWaterfallScript
_08068768:
	movs r0, 0
_0806876A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end TryGetFieldMoveScript

	thumb_func_start sub_8068770
sub_8068770: @ 8068770
	push {lr}
	ldr r0, _08068794
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0806879C
	bl sub_8068F18
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0806879C
	ldr r0, _08068798
	bl script_env_1_execute_new_script
	movs r0, 0x1
	b _0806879E
	.align 2, 0
_08068794: .4byte 0x0000080d
_08068798: .4byte UseDiveScript
_0806879C:
	movs r0, 0
_0806879E:
	pop {r1}
	bx r1
	thumb_func_end sub_8068770

	thumb_func_start sub_80687A4
sub_80687A4: @ 80687A4
	push {lr}
	ldr r0, _080687D0
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080687DC
	ldr r0, _080687D4
	ldrb r0, [r0, 0x17]
	cmp r0, 0x5
	bne _080687DC
	bl sub_8068F18
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080687DC
	ldr r0, _080687D8
	bl script_env_1_execute_new_script
	movs r0, 0x1
	b _080687DE
	.align 2, 0
_080687D0: .4byte 0x0000080d
_080687D4: .4byte 0x0202e828
_080687D8: .4byte UnderwaterUseDiveScript
_080687DC:
	movs r0, 0
_080687DE:
	pop {r1}
	bx r1
	thumb_func_end sub_80687A4

	thumb_func_start sub_80687E4
sub_80687E4: @ 80687E4
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r1, 16
	lsrs r4, r1, 16
	adds r6, r4, 0
	bl mapheader_trigger_activate_at__run_now
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068834
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8068A64
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068834
	adds r0, r6, 0
	bl sub_8068870
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068834
	bl sub_8068894
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068834
	bl sub_8085558
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068834
	movs r0, 0
	b _08068836
_08068834:
	movs r0, 0x1
_08068836:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80687E4

	thumb_func_start mapheader_trigger_activate_at__run_now
mapheader_trigger_activate_at__run_now: @ 806883C
	push {r4,lr}
	ldr r4, _08068864
	ldrh r1, [r0]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r0, 0x2]
	subs r2, 0x7
	lsls r2, 16
	lsrs r2, 16
	ldrb r3, [r0, 0x4]
	adds r0, r4, 0
	bl mapheader_trigger_activate_at
	cmp r0, 0
	beq _08068868
	bl script_env_1_execute_new_script
	movs r0, 0x1
	b _0806886A
	.align 2, 0
_08068864: .4byte 0x0202e828
_08068868:
	movs r0, 0
_0806886A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end mapheader_trigger_activate_at__run_now

	thumb_func_start sub_8068870
sub_8068870: @ 8068870
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8057818
	lsls r0, 24
	cmp r0, 0
	bne _08068884
	movs r0, 0
	b _0806888C
_08068884:
	ldr r0, _08068890
	bl script_env_1_execute_new_script
	movs r0, 0x1
_0806888C:
	pop {r1}
	bx r1
	.align 2, 0
_08068890: .4byte GraniteCave_B1F_EventScript_1C6BC5
	thumb_func_end sub_8068870

	thumb_func_start sub_8068894
sub_8068894: @ 8068894
	push {lr}
	bl sub_8082B78
	bl happiness_algorithm_step
	bl overworld_poison_step
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080688B4
	ldr r0, _080688B0
	b _080688E8
	.align 2, 0
_080688B0: .4byte gUnknown_081A14B8
_080688B4:
	bl sub_80422A0
	lsls r0, 24
	cmp r0, 0
	beq _080688CC
	movs r0, 0xD
	bl sav12_xor_increment
	ldr r0, _080688C8
	b _080688E8
	.align 2, 0
_080688C8: .4byte Event_EggHatch
_080688CC:
	bl safari_step
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080688EC
	movs r0, 0x1
	bl sub_810D9B0
	cmp r0, 0x1
	beq _080688E6
	movs r0, 0
	b _080688EE
_080688E6:
	ldr r0, _080688F4
_080688E8:
	bl script_env_1_execute_new_script
_080688EC:
	movs r0, 0x1
_080688EE:
	pop {r1}
	bx r1
	.align 2, 0
_080688F4: .4byte gUnknown_0815FD0D
	thumb_func_end sub_8068894

	thumb_func_start unref_sub_80688F8
unref_sub_80688F8: @ 80688F8
	push {lr}
	ldr r0, _08068908
	movs r1, 0
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_08068908: .4byte 0x0000402a
	thumb_func_end unref_sub_80688F8

	thumb_func_start happiness_algorithm_step
happiness_algorithm_step: @ 806890C
	push {r4,r5,lr}
	ldr r0, _08068940
	bl GetVarPointer
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
	ldrh r1, [r0]
	movs r2, 0x7F
	ands r1, r2
	strh r1, [r0]
	cmp r1, 0
	bne _0806893A
	ldr r5, _08068944
	movs r4, 0x5
_0806892A:
	adds r0, r5, 0
	movs r1, 0x5
	bl sub_803FCD4
	adds r5, 0x64
	subs r4, 0x1
	cmp r4, 0
	bge _0806892A
_0806893A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08068940: .4byte 0x0000402a
_08068944: .4byte 0x03004360
	thumb_func_end happiness_algorithm_step

	thumb_func_start overworld_poison_timer_set
overworld_poison_timer_set: @ 8068948
	push {lr}
	ldr r0, _08068958
	movs r1, 0
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_08068958: .4byte 0x0000402b
	thumb_func_end overworld_poison_timer_set

	thumb_func_start overworld_poison_step
overworld_poison_step: @ 806895C
	push {lr}
	ldr r0, _08068994
	ldrb r0, [r0, 0x17]
	cmp r0, 0x9
	beq _0806899C
	ldr r0, _08068998
	bl GetVarPointer
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
	ldrh r1, [r0]
	movs r2, 0x3
	ands r1, r2
	strh r1, [r0]
	cmp r1, 0
	bne _0806899C
	bl overworld_poison
	cmp r0, 0x1
	beq _0806899C
	cmp r0, 0x1
	ble _0806899C
	cmp r0, 0x2
	bne _0806899C
	movs r0, 0x1
	b _0806899E
	.align 2, 0
_08068994: .4byte 0x0202e828
_08068998: .4byte 0x0000402b
_0806899C:
	movs r0, 0
_0806899E:
	pop {r1}
	bx r1
	thumb_func_end overworld_poison_step

	thumb_func_start prev_quest_postbuffer_cursor_backup_reset
prev_quest_postbuffer_cursor_backup_reset: @ 80689A4
	ldr r1, _080689AC
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080689AC: .4byte 0x0202e8c0
	thumb_func_end prev_quest_postbuffer_cursor_backup_reset

	thumb_func_start is_it_battle_time_3
is_it_battle_time_3: @ 80689B0
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r7, r4, 0
	ldr r6, _080689CC
	ldrb r0, [r6]
	cmp r0, 0x3
	bhi _080689D4
	adds r0, 0x1
	strb r0, [r6]
	ldr r0, _080689D0
	strh r4, [r0]
	movs r0, 0
	b _080689F8
	.align 2, 0
_080689CC: .4byte 0x0202e8c0
_080689D0: .4byte 0x0202e8c2
_080689D4:
	ldr r5, _080689EC
	ldrh r1, [r5]
	adds r0, r4, 0
	bl sub_8085104
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080689F0
	strh r4, [r5]
	movs r0, 0
	b _080689F8
	.align 2, 0
_080689EC: .4byte 0x0202e8c2
_080689F0:
	movs r0, 0
	strb r0, [r6]
	strh r7, [r5]
	movs r0, 0x1
_080689F8:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end is_it_battle_time_3

	thumb_func_start mapheader_run_first_tag2_script_list_match_conditionally
mapheader_run_first_tag2_script_list_match_conditionally: @ 8068A00
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _08068A54
	mov r8, r0
	adds r1, r7, 0
	bl map_warp_check_packed
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl is_non_stair_warp_tile
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068A58
	lsls r0, r6, 24
	asrs r4, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _08068A58
	bl walkrun_find_lowest_active_bit_in_bitfield
	mov r0, r8
	adds r1, r4, 0
	adds r2, r7, 0
	bl sub_8068C30
	bl sub_8080E88
	movs r0, 0x1
	b _08068A5A
	.align 2, 0
_08068A54: .4byte 0x0202e828
_08068A58:
	movs r0, 0
_08068A5A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end mapheader_run_first_tag2_script_list_match_conditionally

	thumb_func_start sub_8068A64
sub_8068A64: @ 8068A64
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	ldr r7, _08068ABC
	adds r0, r7, 0
	adds r1, r6, 0
	bl map_warp_check_packed
	lsls r0, 24
	asrs r4, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _08068B28
	adds r0, r5, 0
	bl sub_8068B30
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068B28
	bl walkrun_find_lowest_active_bit_in_bitfield
	adds r0, r7, 0
	adds r1, r4, 0
	adds r2, r6, 0
	bl sub_8068C30
	lsls r0, r5, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsEscalator
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068AC0
	adds r0, r4, 0
	bl sub_8080F2C
	movs r0, 0x1
	b _08068B2A
	.align 2, 0
_08068ABC: .4byte 0x0202e828
_08068AC0:
	adds r0, r4, 0
	bl sub_8057798
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068AD6
	bl sub_8080F48
	movs r0, 0x1
	b _08068B2A
_08068AD6:
	adds r0, r4, 0
	bl is_role_x68
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068AEC
	bl sub_8080F58
	movs r0, 0x1
	b _08068B2A
_08068AEC:
	adds r0, r4, 0
	bl MetatileBehavior_IsAquaHideoutWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068B02
	bl sub_8080F68
	movs r0, 0x1
	b _08068B2A
_08068B02:
	adds r0, r4, 0
	bl sub_8057804
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068B20
	ldr r0, _08068B1C
	bl script_env_1_execute_new_script
	movs r0, 0x1
	b _08068B2A
	.align 2, 0
_08068B1C: .4byte gUnknown_081C6BDE
_08068B20:
	bl sub_8080E88
	movs r0, 0x1
	b _08068B2A
_08068B28:
	movs r0, 0
_08068B2A:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8068A64

	thumb_func_start sub_8068B30
sub_8068B30: @ 8068B30
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl is_tile_x69_2_warp_door
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068BAA
	adds r0, r4, 0
	bl MetatileBehavior_IsLadder
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068BAA
	adds r0, r4, 0
	bl MetatileBehavior_IsEscalator
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068BAA
	adds r0, r4, 0
	bl sub_8056F08
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068BAA
	adds r0, r4, 0
	bl sub_8057798
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068BAA
	adds r0, r4, 0
	bl is_role_x68
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068BAA
	adds r0, r4, 0
	bl MetatileBehavior_IsAquaHideoutWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068BAA
	adds r0, r4, 0
	bl sub_8057804
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068BAA
	movs r0, 0
	b _08068BAC
_08068BAA:
	movs r0, 0x1
_08068BAC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8068B30

	thumb_func_start is_non_stair_warp_tile
is_non_stair_warp_tile: @ 8068BB4
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r1, 24
	adds r2, r1, 0
	cmp r1, 0x2
	beq _08068BD8
	cmp r1, 0x2
	bgt _08068BCE
	cmp r1, 0x1
	beq _08068BE2
	b _08068C04
_08068BCE:
	cmp r2, 0x3
	beq _08068BEC
	cmp r2, 0x4
	beq _08068BF6
	b _08068C04
_08068BD8:
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsNorthArrowWarp
	b _08068BFE
_08068BE2:
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSouthArrowWarp
	b _08068BFE
_08068BEC:
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsWestArrowWarp
	b _08068BFE
_08068BF6:
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsEastArrowWarp
_08068BFE:
	lsls r0, 24
	lsrs r0, 24
	b _08068C06
_08068C04:
	movs r0, 0
_08068C06:
	pop {r1}
	bx r1
	thumb_func_end is_non_stair_warp_tile

	thumb_func_start map_warp_check_packed
map_warp_check_packed: @ 8068C0C
	push {lr}
	adds r3, r1, 0
	ldrh r1, [r3]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r3, 0x2]
	subs r2, 0x7
	lsls r2, 16
	lsrs r2, 16
	ldrb r3, [r3, 0x4]
	bl map_warp_check
	lsls r0, 24
	asrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end map_warp_check_packed

	thumb_func_start sub_8068C30
sub_8068C30: @ 8068C30
	push {r4-r7,lr}
	adds r5, r2, 0
	ldr r0, _08068C50
	ldr r0, [r0, 0x4]
	lsls r1, 24
	asrs r7, r1, 24
	lsls r6, r7, 3
	ldr r0, [r0, 0x8]
	adds r4, r0, r6
	ldrb r0, [r4, 0x6]
	cmp r0, 0x7F
	bne _08068C54
	ldrb r0, [r4, 0x5]
	bl copy_saved_warp2_bank_and_enter_x_to_warp1
	b _08068C9E
	.align 2, 0
_08068C50: .4byte 0x0202e828
_08068C54:
	movs r0, 0x7
	ldrsb r0, [r4, r0]
	movs r1, 0x6
	ldrsb r1, [r4, r1]
	movs r2, 0x5
	ldrsb r2, [r4, r2]
	bl warp1_set_2
	movs r1, 0
	ldrsh r0, [r5, r1]
	movs r2, 0x2
	ldrsh r1, [r5, r2]
	bl sub_80535C4
	ldrb r0, [r4, 0x7]
	ldrb r1, [r4, 0x6]
	bl get_mapheader_by_bank_and_number
	ldr r1, [r0, 0x4]
	ldrb r0, [r4, 0x5]
	ldr r1, [r1, 0x8]
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x6]
	cmp r0, 0x7F
	bne _08068C9E
	adds r0, r6, r1
	ldrb r0, [r0, 0x5]
	ldr r2, _08068CA4
	movs r1, 0x4
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, 0x5]
	lsls r2, 24
	asrs r2, 24
	adds r3, r7, 0
	bl saved_warp2_set
_08068C9E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08068CA4: .4byte 0x02025734
	thumb_func_end sub_8068C30

	thumb_func_start map_warp_consider_2_to_inside
map_warp_consider_2_to_inside: @ 8068CA8
	push {r4-r7,lr}
	adds r5, r0, 0
	lsls r1, 16
	lsrs r0, r1, 16
	adds r7, r0, 0
	lsls r2, 24
	lsrs r2, 24
	cmp r2, 0x2
	bne _08068D2C
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80571C0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068CE0
	ldr r0, _08068CDC
	ldr r1, [r0, 0x4]
	adds r0, r5, 0
	bl sub_80BC038
	movs r0, 0x1
	b _08068D2E
	.align 2, 0
_08068CDC: .4byte 0x0202e828
_08068CE0:
	adds r0, r4, 0
	bl is_tile_x69_2_warp_door
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068D2C
	ldr r6, _08068D28
	adds r0, r6, 0
	adds r1, r5, 0
	bl map_warp_check_packed
	lsls r0, 24
	asrs r4, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _08068D2C
	adds r0, r7, 0
	bl sub_8068B30
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068D2C
	bl walkrun_find_lowest_active_bit_in_bitfield
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8068C30
	bl sub_8080EF0
	movs r0, 0x1
	b _08068D2E
	.align 2, 0
_08068D28: .4byte 0x0202e828
_08068D2C:
	movs r0, 0
_08068D2E:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end map_warp_consider_2_to_inside

	thumb_func_start map_warp_check
map_warp_check: @ 8068D34
	push {r4-r6,lr}
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r5, r2, 16
	lsls r3, 24
	lsrs r4, r3, 24
	ldr r0, [r0, 0x4]
	ldr r1, [r0, 0x8]
	ldrb r3, [r0, 0x1]
	movs r2, 0
	cmp r2, r3
	bge _08068D72
_08068D4E:
	ldrh r0, [r1]
	cmp r0, r6
	bne _08068D6A
	ldrh r0, [r1, 0x2]
	cmp r0, r5
	bne _08068D6A
	ldrb r0, [r1, 0x4]
	cmp r0, r4
	beq _08068D64
	cmp r0, 0
	bne _08068D6A
_08068D64:
	lsls r0, r2, 24
	asrs r0, 24
	b _08068D76
_08068D6A:
	adds r2, 0x1
	adds r1, 0x8
	cmp r2, r3
	blt _08068D4E
_08068D72:
	movs r0, 0x1
	negs r0, r0
_08068D76:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end map_warp_check

	thumb_func_start trigger_activate
trigger_activate: @ 8068D7C
	push {r4,lr}
	adds r4, r0, 0
	cmp r4, 0
	beq _08068DB2
	ldr r1, [r4, 0xC]
	cmp r1, 0
	bne _08068D92
	ldrb r0, [r4, 0x6]
	bl sub_8069408
	b _08068DB2
_08068D92:
	ldrh r0, [r4, 0x6]
	cmp r0, 0
	beq _08068DAC
	ldrh r0, [r4, 0x6]
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r4, 0x8]
	cmp r0, r1
	bne _08068DB2
	ldr r0, [r4, 0xC]
	b _08068DB4
_08068DAC:
	adds r0, r1, 0
	bl script_env_2_execute_new_script
_08068DB2:
	movs r0, 0
_08068DB4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end trigger_activate

	thumb_func_start mapheader_trigger_activate_at
mapheader_trigger_activate_at: @ 8068DBC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	lsls r2, 16
	lsrs r2, 16
	mov r9, r2
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	ldr r0, [r0, 0x4]
	ldr r1, [r0, 0xC]
	ldrb r7, [r0, 0x2]
	movs r6, 0
	cmp r6, r7
	bge _08068E12
	adds r5, r1, 0
	adds r4, r5, 0
_08068DE8:
	ldrh r0, [r4]
	cmp r0, r10
	bne _08068E08
	ldrh r0, [r4, 0x2]
	cmp r0, r9
	bne _08068E08
	ldrb r0, [r4, 0x4]
	cmp r0, r8
	beq _08068DFE
	cmp r0, 0
	bne _08068E08
_08068DFE:
	adds r0, r5, 0
	bl trigger_activate
	cmp r0, 0
	bne _08068E14
_08068E08:
	adds r4, 0x10
	adds r5, 0x10
	adds r6, 0x1
	cmp r6, r7
	blt _08068DE8
_08068E12:
	movs r0, 0
_08068E14:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end mapheader_trigger_activate_at

	thumb_func_start sub_8068E24
sub_8068E24: @ 8068E24
	push {r4,lr}
	ldr r4, _08068E48
	ldrh r1, [r0]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r0, 0x2]
	subs r2, 0x7
	lsls r2, 16
	lsrs r2, 16
	ldrb r3, [r0, 0x4]
	adds r0, r4, 0
	bl mapheader_trigger_activate_at
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08068E48: .4byte 0x0202e828
	thumb_func_end sub_8068E24

	thumb_func_start FindInvisibleMapObjectByPosition
FindInvisibleMapObjectByPosition: @ 8068E4C
	push {r4-r7,lr}
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 16
	lsrs r6, r2, 16
	lsls r3, 24
	lsrs r5, r3, 24
	ldr r0, [r0, 0x4]
	ldr r4, [r0, 0x10]
	ldrb r3, [r0, 0x3]
	movs r2, 0
	cmp r2, r3
	bcs _08068E92
_08068E66:
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r4
	ldrh r0, [r1]
	cmp r0, r7
	bne _08068E88
	ldrh r0, [r1, 0x2]
	cmp r0, r6
	bne _08068E88
	ldrb r0, [r1, 0x4]
	cmp r0, r5
	beq _08068E84
	cmp r0, 0
	bne _08068E88
_08068E84:
	adds r0, r1, 0
	b _08068E94
_08068E88:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r3
	bcc _08068E66
_08068E92:
	movs r0, 0
_08068E94:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end FindInvisibleMapObjectByPosition

	thumb_func_start dive_warp
dive_warp: @ 8068E9C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	ldr r0, _08068ED0
	ldrb r0, [r0, 0x17]
	cmp r0, 0x5
	bne _08068ED4
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_805750C
	lsls r0, 24
	cmp r0, 0
	bne _08068ED4
	ldrh r0, [r4]
	subs r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4, 0x2]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	bl sub_80538B0
	b _08068EF8
	.align 2, 0
_08068ED0: .4byte 0x0202e828
_08068ED4:
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_80574EC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068F10
	ldrh r0, [r4]
	subs r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4, 0x2]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	bl sub_80538D0
_08068EF8:
	lsls r0, 24
	cmp r0, 0
	beq _08068F10
	bl walkrun_find_lowest_active_bit_in_bitfield
	bl sp13E_warp_to_last_warp
	movs r0, 0xE9
	bl audio_play
	movs r0, 0x1
	b _08068F12
_08068F10:
	movs r0, 0
_08068F12:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end dive_warp

	thumb_func_start sub_8068F18
sub_8068F18: @ 8068F18
	push {r4,r5,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08068F70
	ldrb r0, [r0, 0x17]
	cmp r0, 0x5
	bne _08068F74
	adds r0, r5, 0
	bl sub_805750C
	lsls r0, 24
	cmp r0, 0
	bne _08068F74
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	bl sub_80538B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068FA4
	movs r0, 0x1
	b _08068FA6
	.align 2, 0
_08068F70: .4byte 0x0202e828
_08068F74:
	adds r0, r5, 0
	bl sub_80574EC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068FA4
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	bl sub_80538D0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068FA4
	movs r0, 0x2
	b _08068FA6
_08068FA4:
	movs r0, 0
_08068FA6:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8068F18

	thumb_func_start GetFieldObjectScriptPointerForComparison
GetFieldObjectScriptPointerForComparison: @ 8068FB0
	push {r4,r5,lr}
	sub sp, 0x8
	bl player_get_direction_upper_nybble
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r5, sp
	mov r0, sp
	bl player_get_next_pos_and_height
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0x2
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, sp
	adds r2, r4, 0
	bl sub_8068364
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetFieldObjectScriptPointerForComparison

	thumb_func_start sub_8068FEC
sub_8068FEC: @ 8068FEC
	push {r4,lr}
	sub sp, 0x8
	bl player_get_direction_upper_nybble
	mov r4, sp
	mov r0, sp
	bl player_get_pos_to_and_height
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	ldr r4, _0806902C
	adds r0, r4, 0
	mov r1, sp
	bl map_warp_check_packed
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	adds r0, r4, 0
	mov r2, sp
	bl sub_8068C30
	movs r0, 0
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806902C: .4byte 0x0202e828
	thumb_func_end sub_8068FEC

	thumb_func_start sub_8069030
sub_8069030: @ 8069030
	push {r4,lr}
	ldr r4, _08069064
	movs r2, 0x90
	lsls r2, 1
	adds r0, r4, 0
	movs r1, 0
	bl memset
	movs r0, 0x90
	lsls r0, 1
	adds r4, r0
	movs r2, 0x80
	lsls r2, 2
	adds r0, r4, 0
	movs r1, 0
	bl memset
	ldr r0, _08069068
	movs r1, 0
	movs r2, 0x10
	bl memset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069064: .4byte 0x02026954
_08069068: .4byte 0x0202e8e2
	thumb_func_end sub_8069030

	thumb_func_start sub_806906C
sub_806906C: @ 806906C
	push {lr}
	ldr r0, _080690A0
	movs r1, 0
	str r1, [r0]
	movs r1, 0x90
	lsls r1, 1
	adds r0, r1
	movs r1, 0
	movs r2, 0x20
	bl memset
	ldr r0, _080690A4
	bl FlagReset
	ldr r0, _080690A8
	bl FlagReset
	ldr r0, _080690AC
	bl FlagReset
	ldr r0, _080690B0
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_080690A0: .4byte 0x02026954
_080690A4: .4byte 0x0000084d
_080690A8: .4byte 0x0000084e
_080690AC: .4byte 0x00000829
_080690B0: .4byte 0x00000861
	thumb_func_end sub_806906C

	thumb_func_start sub_80690B4
sub_80690B4: @ 80690B4
	push {lr}
	ldr r0, _080690C4
	movs r1, 0
	movs r2, 0x8
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_080690C4: .4byte 0x02026a6c
	thumb_func_end sub_80690B4

	thumb_func_start sub_80690C8
sub_80690C8: @ 80690C8
	push {lr}
	ldr r0, _080690E4
	bl GetVarPointer
	ldr r2, _080690E8
	movs r1, 0
	strb r1, [r2, 0x1A]
	strh r1, [r0]
	ldr r0, _080690EC
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_080690E4: .4byte 0x00004046
_080690E8: .4byte gSaveBlock2
_080690EC: .4byte 0x00000836
	thumb_func_end sub_80690C8

	thumb_func_start sub_80690F0
sub_80690F0: @ 80690F0
	push {r4,r5,lr}
	ldr r0, _0806911C
	bl GetVarPointer
	ldr r4, _08069120
	movs r5, 0
	movs r1, 0xDA
	strb r1, [r4, 0x1A]
	ldr r2, _08069124
	adds r1, r2, 0
	strh r1, [r0]
	ldr r0, _08069128
	bl FlagSet
	movs r0, 0x1
	strb r0, [r4, 0x19]
	strb r5, [r4, 0x18]
	bl sub_808C0A0
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806911C: .4byte 0x00004046
_08069120: .4byte gSaveBlock2
_08069124: .4byte 0x00000302
_08069128: .4byte 0x00000836
	thumb_func_end sub_80690F0

	thumb_func_start sub_806912C
sub_806912C: @ 806912C
	push {lr}
	ldr r0, _08069154
	ldrb r0, [r0, 0x1A]
	cmp r0, 0xDA
	bne _08069164
	ldr r0, _08069158
	bl VarGet
	lsls r0, 16
	ldr r1, _0806915C
	cmp r0, r1
	bne _08069164
	ldr r0, _08069160
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08069164
	movs r0, 0x1
	b _08069166
	.align 2, 0
_08069154: .4byte gSaveBlock2
_08069158: .4byte 0x00004046
_0806915C: .4byte 0x03020000
_08069160: .4byte 0x00000836
_08069164:
	movs r0, 0
_08069166:
	pop {r1}
	bx r1
	thumb_func_end sub_806912C

	thumb_func_start unref_sub_806916C
unref_sub_806916C: @ 806916C
	push {lr}
	ldr r0, _08069178
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_08069178: .4byte 0x0000084c
	thumb_func_end unref_sub_806916C

	thumb_func_start unref_sub_806917C
unref_sub_806917C: @ 806917C
	push {lr}
	ldr r0, _08069188
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_08069188: .4byte 0x0000084c
	thumb_func_end unref_sub_806917C

	thumb_func_start sub_806918C
sub_806918C: @ 806918C
	push {lr}
	ldr r0, _0806919C
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0806919C: .4byte 0x0000084c
	thumb_func_end sub_806918C

	thumb_func_start sub_80691A0
sub_80691A0: @ 80691A0
	push {lr}
	ldr r0, _080691B4
	movs r1, 0
	bl VarSet
	ldr r0, _080691B8
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_080691B4: .4byte 0x0000402c
_080691B8: .4byte 0x00000862
	thumb_func_end sub_80691A0

	thumb_func_start sub_80691BC
sub_80691BC: @ 80691BC
	push {lr}
	ldr r0, _080691D4
	movs r1, 0x92
	lsls r1, 4
	bl VarSet
	ldr r0, _080691D8
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_080691D4: .4byte 0x0000402c
_080691D8: .4byte 0x00000862
	thumb_func_end sub_80691BC

	thumb_func_start sub_80691DC
sub_80691DC: @ 80691DC
	push {lr}
	ldr r0, _08069200
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08069208
	ldr r0, _08069204
	bl VarGet
	lsls r0, 16
	movs r1, 0x92
	lsls r1, 20
	cmp r0, r1
	bne _08069208
	movs r0, 0x1
	b _0806920A
	.align 2, 0
_08069200: .4byte 0x00000862
_08069204: .4byte 0x0000402c
_08069208:
	movs r0, 0
_0806920A:
	pop {r1}
	bx r1
	thumb_func_end sub_80691DC

	thumb_func_start GetVarPointer
GetVarPointer: @ 8069210
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	adds r2, r1, 0
	ldr r0, _08069224
	cmp r1, r0
	bhi _08069228
	movs r0, 0
	b _0806924A
	.align 2, 0
_08069224: .4byte 0x00003fff
_08069228:
	lsls r0, r1, 16
	cmp r0, 0
	bge _08069244
	ldr r0, _0806923C
	ldr r2, _08069240
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	b _0806924A
	.align 2, 0
_0806923C: .4byte gUnknown_0814B14C
_08069240: .4byte 0xffff8000
_08069244:
	lsls r0, r2, 1
	ldr r1, _08069250
	adds r0, r1
_0806924A:
	pop {r1}
	bx r1
	.align 2, 0
_08069250: .4byte 0x0201ea74
	thumb_func_end GetVarPointer

	thumb_func_start VarGet
VarGet: @ 8069254
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl GetVarPointer
	cmp r0, 0
	beq _08069268
	ldrh r0, [r0]
	b _0806926A
_08069268:
	adds r0, r4, 0
_0806926A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end VarGet

	thumb_func_start VarSet
VarSet: @ 8069270
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	bl GetVarPointer
	cmp r0, 0
	beq _08069288
	strh r4, [r0]
	movs r0, 0x1
	b _0806928A
_08069288:
	movs r0, 0
_0806928A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end VarSet

	thumb_func_start VarGetFieldObjectGraphicsId
VarGetFieldObjectGraphicsId: @ 8069290
	push {lr}
	lsls r0, 24
	lsrs r0, 8
	ldr r1, _080692A8
	adds r0, r1
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080692A8: .4byte 0x40100000
	thumb_func_end VarGetFieldObjectGraphicsId

	thumb_func_start GetFlagPointer
GetFlagPointer: @ 80692AC
	push {lr}
	lsls r2, r0, 16
	lsrs r1, r2, 16
	adds r3, r1, 0
	cmp r1, 0
	bne _080692BC
	movs r0, 0
	b _080692E2
_080692BC:
	ldr r0, _080692C8
	cmp r1, r0
	bhi _080692D0
	lsrs r0, r2, 19
	ldr r1, _080692CC
	b _080692E0
	.align 2, 0
_080692C8: .4byte 0x00003fff
_080692CC: .4byte 0x02026954
_080692D0:
	ldr r1, _080692E8
	adds r0, r3, r1
	cmp r0, 0
	bge _080692DC
	adds r1, 0x7
	adds r0, r3, r1
_080692DC:
	asrs r0, 3
	ldr r1, _080692EC
_080692E0:
	adds r0, r1
_080692E2:
	pop {r1}
	bx r1
	.align 2, 0
_080692E8: .4byte 0xffffc000
_080692EC: .4byte 0x0202e8e2
	thumb_func_end GetFlagPointer

	thumb_func_start FlagSet
FlagSet: @ 80692F0
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl GetFlagPointer
	adds r2, r0, 0
	cmp r2, 0
	beq _08069310
	movs r0, 0x7
	ands r0, r4
	movs r1, 0x1
	lsls r1, r0
	ldrb r0, [r2]
	orrs r1, r0
	strb r1, [r2]
_08069310:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FlagSet

	thumb_func_start FlagReset
FlagReset: @ 8069318
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl GetFlagPointer
	adds r2, r0, 0
	cmp r2, 0
	beq _08069338
	movs r0, 0x7
	ands r0, r4
	movs r1, 0x1
	lsls r1, r0
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
_08069338:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FlagReset

	thumb_func_start FlagGet
FlagGet: @ 8069340
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl GetFlagPointer
	cmp r0, 0
	beq _08069364
	ldrb r0, [r0]
	movs r1, 0x7
	ands r1, r4
	asrs r0, r1
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08069364
	movs r0, 0x1
	b _08069366
_08069364:
	movs r0, 0
_08069366:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FlagGet

	thumb_func_start sub_806936C
sub_806936C: @ 806936C
	push {lr}
	movs r0, 0x1
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_806936C

	thumb_func_start sub_8069378
sub_8069378: @ 8069378
	push {lr}
	movs r0, 0x2
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_8069378

	thumb_func_start sub_8069384
sub_8069384: @ 8069384
	push {lr}
	movs r0, 0x3
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_8069384

	thumb_func_start sub_8069390
sub_8069390: @ 8069390
	push {lr}
	movs r0, 0x4
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_8069390

	thumb_func_start sub_806939C
sub_806939C: @ 806939C
	push {lr}
	movs r0, 0x5
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_806939C

	thumb_func_start sub_80693A8
sub_80693A8: @ 80693A8
	push {lr}
	movs r0, 0x6
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693A8

	thumb_func_start sub_80693B4
sub_80693B4: @ 80693B4
	push {lr}
	movs r0, 0x9
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693B4

	thumb_func_start sub_80693C0
sub_80693C0: @ 80693C0
	push {lr}
	movs r0, 0x7
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693C0

	thumb_func_start sub_80693CC
sub_80693CC: @ 80693CC
	push {lr}
	movs r0, 0x8
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693CC

	thumb_func_start sub_80693D8
sub_80693D8: @ 80693D8
	push {lr}
	movs r0, 0xB
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693D8

	thumb_func_start sub_80693E4
sub_80693E4: @ 80693E4
	push {lr}
	movs r0, 0xC
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693E4

	thumb_func_start sub_80693F0
sub_80693F0: @ 80693F0
	push {lr}
	movs r0, 0x14
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693F0

	thumb_func_start sub_80693FC
sub_80693FC: @ 80693FC
	push {lr}
	movs r0, 0x15
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693FC

	thumb_func_start sub_8069408
sub_8069408: @ 8069408
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r2, 0
	ldr r3, _08069428
_08069412:
	lsls r1, r2, 3
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r4
	bne _0806942C
	adds r0, r3, 0x4
	adds r0, r1, r0
	ldr r0, [r0]
	bl _call_via_r0
	b _08069436
	.align 2, 0
_08069428: .4byte gUnknown_083762FC
_0806942C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xC
	bls _08069412
_08069436:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8069408

	thumb_func_start task_per_step_callback_manager
task_per_step_callback_manager: @ 806943C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08069460
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x8
	ldrsh r1, [r1, r2]
	ldr r2, _08069464
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08069460: .4byte 0x03004b20
_08069464: .4byte gUnknown_08376364
	thumb_func_end task_per_step_callback_manager

	thumb_func_start sub_8069468
sub_8069468: @ 8069468
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0806947A
	cmp r0, 0x1
	beq _08069498
	b _080694AC
_0806947A:
	ldr r0, _08069494
	ldr r0, [r0, 0x20]
	movs r1, 0x80
	lsls r1, 5
	ands r0, r1
	cmp r0, 0
	beq _080694AC
	bl InTrainerHill
	ldrh r0, [r4]
	adds r0, 0x1
	b _080694AA
	.align 2, 0
_08069494: .4byte 0x03001770
_08069498:
	ldr r0, _080694B4
	ldr r0, [r0, 0x20]
	movs r1, 0x80
	lsls r1, 5
	ands r0, r1
	cmp r0, 0
	bne _080694AC
	ldrh r0, [r4]
	subs r0, 0x1
_080694AA:
	strh r0, [r4]
_080694AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080694B4: .4byte 0x03001770
	thumb_func_end sub_8069468

	thumb_func_start sub_80694B8
sub_80694B8: @ 80694B8
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080694E8
	adds r4, r1, r0
	bl script_env_2_is_enabled
	lsls r0, 24
	cmp r0, 0
	bne _080694E0
	adds r0, r4, 0
	bl sub_8069468
	adds r0, r4, 0x2
	adds r1, r4, 0x4
	bl sub_80540D0
_080694E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080694E8: .4byte 0x03004b28
	thumb_func_end sub_80694B8

	thumb_func_start overworld_ensure_per_step_coros_running
overworld_ensure_per_step_coros_running: @ 80694EC
	push {r4,r5,lr}
	ldr r5, _08069548
	adds r0, r5, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08069516
	adds r0, r5, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806954C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
_08069516:
	ldr r4, _08069550
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _0806952C
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
_0806952C:
	ldr r4, _08069554
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08069542
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
_08069542:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069548: .4byte task_per_step_callback_manager
_0806954C: .4byte 0x03004b20
_08069550: .4byte sub_806A1E8
_08069554: .4byte sub_80694B8
	thumb_func_end overworld_ensure_per_step_coros_running

	thumb_func_start activate_per_step_callback
activate_per_step_callback: @ 8069558
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08069590
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _0806959A
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _08069594
	adds r1, r0, r1
	movs r2, 0
	adds r0, r1, 0
	adds r0, 0x1E
_0806957C:
	strh r2, [r0]
	subs r0, 0x2
	cmp r0, r1
	bge _0806957C
	cmp r4, 0x7
	bls _08069598
	movs r0, 0
	strh r0, [r1]
	b _0806959A
	.align 2, 0
_08069590: .4byte task_per_step_callback_manager
_08069594: .4byte 0x03004b28
_08069598:
	strh r4, [r1]
_0806959A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end activate_per_step_callback

	thumb_func_start wild_encounter_reset_coro_args
wild_encounter_reset_coro_args: @ 80695A0
	push {lr}
	ldr r0, _080695D0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _080695D4
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _080695CA
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _080695D8
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x2]
	strh r1, [r0, 0x4]
_080695CA:
	pop {r0}
	bx r0
	.align 2, 0
_080695D0: .4byte task_per_step_callback_manager
_080695D4: .4byte sub_80694B8
_080695D8: .4byte 0x03004b28
	thumb_func_end wild_encounter_reset_coro_args

	thumb_func_start nullsub_51
nullsub_51: @ 80695DC
	bx lr
	thumb_func_end nullsub_51

	thumb_func_start sub_80695E0
sub_80695E0: @ 80695E0
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	adds r0, r4, 0
	bl sub_80576A0
	lsls r0, 24
	cmp r0, 0
	beq _080695F8
	adds r0, r5, 0
	b _08069630
_080695F8:
	adds r0, r4, 0
	bl sub_80576B4
	lsls r0, 24
	cmp r0, 0
	beq _0806960A
	adds r0, r5, 0
	adds r0, 0x8
	b _08069630
_0806960A:
	adds r0, r4, 0
	bl sub_80576C8
	lsls r0, 24
	cmp r0, 0
	beq _0806961C
	adds r0, r5, 0
	adds r0, 0x10
	b _08069630
_0806961C:
	adds r0, r4, 0
	bl sub_80576DC
	lsls r0, 24
	cmp r0, 0
	bne _0806962C
	movs r0, 0
	b _08069630
_0806962C:
	adds r0, r5, 0
	adds r0, 0x18
_08069630:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80695E0

	thumb_func_start sub_8069638
sub_8069638: @ 8069638
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	mov r8, r3
	lsls r1, 16
	asrs r6, r1, 16
	lsls r2, 16
	asrs r7, r2, 16
	adds r0, r6, 0
	adds r1, r7, 0
	bl MapGridGetMetatileBehaviorAt
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r5, 0
	bl sub_80695E0
	adds r4, r0, 0
	adds r5, r4, 0
	cmp r4, 0
	beq _080696B6
	movs r0, 0
	ldrsb r0, [r4, r0]
	adds r0, r6, r0
	movs r1, 0x1
	ldrsb r1, [r4, r1]
	adds r1, r7, r1
	ldrh r2, [r4, 0x2]
	bl MapGridSetMetatileIdAt
	mov r0, r8
	cmp r0, 0
	beq _0806968E
	movs r0, 0
	ldrsb r0, [r4, r0]
	adds r0, r6, r0
	movs r1, 0x1
	ldrsb r1, [r4, r1]
	adds r1, r7, r1
	bl CurrentMapDrawMetatileAt
_0806968E:
	movs r0, 0x4
	ldrsb r0, [r5, r0]
	adds r0, r6, r0
	movs r1, 0x5
	ldrsb r1, [r5, r1]
	adds r1, r7, r1
	ldrh r2, [r5, 0x6]
	bl MapGridSetMetatileIdAt
	mov r0, r8
	cmp r0, 0
	beq _080696B6
	movs r0, 0x4
	ldrsb r0, [r5, r0]
	adds r0, r6, r0
	movs r1, 0x5
	ldrsb r1, [r5, r1]
	adds r1, r7, r1
	bl CurrentMapDrawMetatileAt
_080696B6:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8069638

	thumb_func_start sub_80696C0
sub_80696C0: @ 80696C0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r3, r2, 0
	ldr r0, _080696E0
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8069638
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080696E0: .4byte gUnknown_08376384
	thumb_func_end sub_80696C0

	thumb_func_start sub_80696E4
sub_80696E4: @ 80696E4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r3, r2, 0
	ldr r0, _08069704
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8069638
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069704: .4byte gUnknown_083763A4
	thumb_func_end sub_80696E4

	thumb_func_start sub_8069708
sub_8069708: @ 8069708
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r3, r2, 0
	ldr r0, _08069728
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8069638
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069728: .4byte gUnknown_083763C4
	thumb_func_end sub_8069708

	thumb_func_start sub_806972C
sub_806972C: @ 806972C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	mov r10, r8
	lsls r1, 16
	lsrs r7, r1, 16
	mov r9, r7
	lsls r2, 16
	asrs r6, r2, 16
	lsls r3, 16
	asrs r5, r3, 16
	adds r0, r6, 0
	adds r1, r5, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80576A0
	lsls r0, 24
	cmp r0, 0
	beq _08069770
	lsls r0, r7, 16
	asrs r0, 16
	cmp r0, r5
	ble _080697B6
_0806976C:
	movs r0, 0
	b _080697B8
_08069770:
	adds r0, r4, 0
	bl sub_80576B4
	lsls r0, 24
	cmp r0, 0
	beq _08069788
	mov r1, r9
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, r5
	bge _080697B6
	b _0806976C
_08069788:
	adds r0, r4, 0
	bl sub_80576C8
	lsls r0, 24
	cmp r0, 0
	beq _080697A0
	mov r1, r8
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, r6
	ble _080697B6
	b _0806976C
_080697A0:
	adds r0, r4, 0
	bl sub_80576DC
	lsls r0, 24
	cmp r0, 0
	beq _080697B6
	mov r1, r10
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, r6
	blt _0806976C
_080697B6:
	movs r0, 0x1
_080697B8:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_806972C

	thumb_func_start sub_80697C8
sub_80697C8: @ 80697C8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	mov r10, r8
	lsls r3, 16
	lsrs r7, r3, 16
	mov r9, r7
	lsls r0, 16
	asrs r6, r0, 16
	lsls r1, 16
	asrs r5, r1, 16
	adds r0, r6, 0
	adds r1, r5, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80576A0
	lsls r0, 24
	cmp r0, 0
	beq _0806980C
	lsls r0, r7, 16
	asrs r0, 16
	cmp r5, r0
	bge _08069852
_08069808:
	movs r0, 0
	b _08069854
_0806980C:
	adds r0, r4, 0
	bl sub_80576B4
	lsls r0, 24
	cmp r0, 0
	beq _08069824
	mov r1, r9
	lsls r0, r1, 16
	asrs r0, 16
	cmp r5, r0
	ble _08069852
	b _08069808
_08069824:
	adds r0, r4, 0
	bl sub_80576C8
	lsls r0, 24
	cmp r0, 0
	beq _0806983C
	mov r1, r8
	lsls r0, r1, 16
	asrs r0, 16
	cmp r6, r0
	bge _08069852
	b _08069808
_0806983C:
	adds r0, r4, 0
	bl sub_80576DC
	lsls r0, 24
	cmp r0, 0
	beq _08069852
	mov r1, r10
	lsls r0, r1, 16
	asrs r0, 16
	cmp r6, r0
	bgt _08069808
_08069852:
	movs r0, 0x1
_08069854:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80697C8

	thumb_func_start sub_8069864
sub_8069864: @ 8069864
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08069898
	adds r4, r1, r0
	mov r5, sp
	adds r5, 0x2
	mov r0, sp
	adds r1, r5, 0
	bl PlayerGetDestCoords
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	adds r6, r5, 0
	cmp r0, 0x1
	beq _080698BE
	cmp r0, 0x1
	bgt _0806989C
	cmp r0, 0
	beq _080698A2
	b _080699CE
	.align 2, 0
_08069898: .4byte 0x03004b28
_0806989C:
	cmp r0, 0x2
	beq _0806998C
	b _080699CE
_080698A2:
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x4]
	ldrh r0, [r5]
	strh r0, [r4, 0x6]
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r3, 0
	ldrsh r1, [r5, r3]
	movs r2, 0x1
	bl sub_80696E4
	b _080699CA
_080698BE:
	mov r0, sp
	movs r7, 0
	ldrsh r1, [r0, r7]
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080698D8
	movs r3, 0
	ldrsh r1, [r5, r3]
	movs r7, 0x6
	ldrsh r0, [r4, r7]
	cmp r1, r0
	beq _080699CE
_080698D8:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r5, 0x6
	ldrsh r3, [r4, r5]
	bl sub_806972C
	cmp r0, 0
	beq _08069920
	movs r7, 0x4
	ldrsh r0, [r4, r7]
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	movs r2, 0x1
	bl sub_80696C0
	movs r3, 0x4
	ldrsh r0, [r4, r3]
	movs r5, 0x6
	ldrsh r1, [r4, r5]
	movs r2, 0
	bl sub_8069708
	ldrh r0, [r4, 0x4]
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0x6]
	strh r0, [r4, 0xA]
	movs r0, 0x2
	strh r0, [r4, 0x2]
	movs r0, 0x8
	strh r0, [r4, 0xC]
	b _0806992A
_08069920:
	movs r7, 0x1
	negs r7, r7
	adds r0, r7, 0
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xA]
_0806992A:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r5, r6, 0
	movs r2, 0
	ldrsh r1, [r5, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r7, 0x6
	ldrsh r3, [r4, r7]
	bl sub_80697C8
	cmp r0, 0
	beq _0806995E
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	movs r2, 0x1
	bl sub_80696C0
	movs r0, 0x2
	strh r0, [r4, 0x2]
	movs r0, 0x8
	strh r0, [r4, 0xC]
_0806995E:
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x4]
	ldrh r0, [r6]
	strh r0, [r4, 0x6]
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r5, 0
	ldrsh r1, [r6, r5]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsPacifidlogLog
	lsls r0, 24
	cmp r0, 0
	beq _080699CE
	movs r0, 0x46
	bl audio_play
	b _080699CE
_0806998C:
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bne _080699CE
	mov r0, sp
	movs r7, 0
	ldrsh r0, [r0, r7]
	movs r2, 0
	ldrsh r1, [r5, r2]
	movs r2, 0x1
	bl sub_80696E4
	movs r3, 0x8
	ldrsh r0, [r4, r3]
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080699CA
	movs r5, 0xA
	ldrsh r0, [r4, r5]
	cmp r0, r1
	beq _080699CA
	movs r7, 0x8
	ldrsh r0, [r4, r7]
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	movs r2, 0x1
	bl sub_8069708
_080699CA:
	movs r0, 0x1
	strh r0, [r4, 0x2]
_080699CE:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8069864

	thumb_func_start sub_80699D8
sub_80699D8: @ 80699D8
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r5, r1, 16
	bl PlayerGetZCoord
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08069A32
	lsls r0, r4, 16
	asrs r4, r0, 16
	lsls r0, r5, 16
	asrs r5, r0, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	ldr r0, _08069A14
	cmp r1, r0
	beq _08069A18
	adds r0, 0x8
	cmp r1, r0
	beq _08069A28
	b _08069A32
	.align 2, 0
_08069A14: .4byte 0x0000024e
_08069A18:
	ldr r2, _08069A24
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
	b _08069A32
	.align 2, 0
_08069A24: .4byte 0x0000024f
_08069A28:
	ldr r2, _08069A38
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
_08069A32:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069A38: .4byte 0x00000257
	thumb_func_end sub_80699D8

	thumb_func_start sub_8069A3C
sub_8069A3C: @ 8069A3C
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r5, r1, 16
	bl PlayerGetZCoord
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08069A96
	lsls r0, r4, 16
	asrs r4, r0, 16
	lsls r0, r5, 16
	asrs r5, r0, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	ldr r0, _08069A78
	cmp r1, r0
	beq _08069A7C
	adds r0, 0x8
	cmp r1, r0
	beq _08069A8C
	b _08069A96
	.align 2, 0
_08069A78: .4byte 0x0000024f
_08069A7C:
	ldr r2, _08069A88
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
	b _08069A96
	.align 2, 0
_08069A88: .4byte 0x0000024e
_08069A8C:
	ldr r2, _08069A9C
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
_08069A96:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069A9C: .4byte 0x00000256
	thumb_func_end sub_8069A3C

	thumb_func_start sub_8069AA0
sub_8069AA0: @ 8069AA0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08069ADC
	adds r6, r1, r0
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	movs r0, 0x2
	ldrsh r5, [r6, r0]
	mov r9, r4
	cmp r5, 0x1
	beq _08069B34
	cmp r5, 0x1
	bgt _08069AE0
	cmp r5, 0
	beq _08069AE8
	b _08069CA6
	.align 2, 0
_08069ADC: .4byte 0x03004b28
_08069AE0:
	cmp r5, 0x2
	bne _08069AE6
	b _08069C14
_08069AE6:
	b _08069CA6
_08069AE8:
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r6, 0x4]
	mov r1, r9
	ldrh r0, [r1]
	strh r0, [r6, 0x6]
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r3, 0
	ldrsh r1, [r1, r3]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsFortreeBridge
	lsls r0, 24
	cmp r0, 0
	bne _08069B12
	b _08069CA2
_08069B12:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	mov r2, r9
	movs r3, 0
	ldrsh r1, [r2, r3]
	bl sub_80699D8
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	mov r2, r9
	movs r3, 0
	ldrsh r1, [r2, r3]
	bl CurrentMapDrawMetatileAt
	b _08069CA2
_08069B34:
	ldrh r0, [r6, 0x6]
	mov r8, r0
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	ldrh r2, [r6, 0x4]
	mov r10, r2
	movs r3, 0x4
	ldrsh r7, [r6, r3]
	cmp r0, r7
	bne _08069B5C
	mov r0, r9
	movs r2, 0
	ldrsh r1, [r0, r2]
	mov r3, r8
	lsls r0, r3, 16
	asrs r0, 16
	cmp r1, r0
	bne _08069B5C
	b _08069CA6
_08069B5C:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	mov r2, r9
	movs r3, 0
	ldrsh r1, [r2, r3]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsFortreeBridge
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	mov r0, r8
	lsls r4, r0, 16
	asrs r1, r4, 16
	adds r0, r7, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsFortreeBridge
	lsls r0, 24
	lsrs r7, r0, 24
	bl PlayerGetZCoord
	movs r1, 0
	ands r5, r0
	lsls r0, r5, 24
	adds r5, r4, 0
	cmp r0, 0
	bne _08069BA4
	movs r1, 0x1
_08069BA4:
	cmp r1, 0
	beq _08069BB8
	ldr r1, [sp, 0x4]
	cmp r1, 0x1
	beq _08069BB2
	cmp r7, 0x1
	bne _08069BB8
_08069BB2:
	movs r0, 0x47
	bl audio_play
_08069BB8:
	cmp r7, 0
	beq _08069BF4
	mov r2, r10
	lsls r4, r2, 16
	asrs r4, 16
	asrs r5, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8069A3C
	adds r0, r4, 0
	adds r1, r5, 0
	bl CurrentMapDrawMetatileAt
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	mov r2, r9
	movs r3, 0
	ldrsh r1, [r2, r3]
	bl sub_80699D8
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	mov r2, r9
	movs r3, 0
	ldrsh r1, [r2, r3]
	bl CurrentMapDrawMetatileAt
_08069BF4:
	mov r0, r10
	strh r0, [r6, 0x8]
	mov r1, r8
	strh r1, [r6, 0xA]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r6, 0x4]
	mov r2, r9
	ldrh r0, [r2]
	strh r0, [r6, 0x6]
	cmp r7, 0
	beq _08069CA6
	movs r0, 0x10
	strh r0, [r6, 0xC]
	movs r0, 0x2
	strh r0, [r6, 0x2]
_08069C14:
	ldrh r0, [r6, 0xC]
	subs r0, 0x1
	strh r0, [r6, 0xC]
	ldrh r3, [r6, 0x8]
	mov r10, r3
	ldrh r0, [r6, 0xA]
	mov r8, r0
	movs r1, 0xC
	ldrsh r0, [r6, r1]
	movs r1, 0x7
	bl __modsi3
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	bhi _08069C9A
	lsls r0, 2
	ldr r1, _08069C40
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08069C40: .4byte _08069C44
	.align 2, 0
_08069C44:
	.4byte _08069C64
	.4byte _08069C9A
	.4byte _08069C9A
	.4byte _08069C9A
	.4byte _08069C76
	.4byte _08069C9A
	.4byte _08069C9A
	.4byte _08069C9A
_08069C64:
	mov r2, r10
	lsls r0, r2, 16
	asrs r0, 16
	mov r3, r8
	lsls r1, r3, 16
	asrs r1, 16
	bl CurrentMapDrawMetatileAt
	b _08069C9A
_08069C76:
	mov r0, r10
	lsls r5, r0, 16
	asrs r5, 16
	mov r1, r8
	lsls r4, r1, 16
	asrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80699D8
	adds r0, r5, 0
	adds r1, r4, 0
	bl CurrentMapDrawMetatileAt
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8069A3C
_08069C9A:
	movs r2, 0xC
	ldrsh r0, [r6, r2]
	cmp r0, 0
	bne _08069CA6
_08069CA2:
	movs r0, 0x1
	strh r0, [r6, 0x2]
_08069CA6:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8069AA0

	thumb_func_start sub_8069CB8
sub_8069CB8: @ 8069CB8
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	lsls r0, 16
	ldr r2, _08069CE8
	adds r0, r2
	lsrs r0, 16
	cmp r0, 0xA
	bhi _08069CF4
	lsls r0, r1, 16
	asrs r1, r0, 16
	ldr r2, _08069CEC
	adds r0, r2
	lsrs r0, 16
	cmp r0, 0xD
	bhi _08069CF4
	ldr r0, _08069CF0
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	beq _08069CF4
	movs r0, 0x1
	b _08069CF6
	.align 2, 0
_08069CE8: .4byte 0xfffd0000
_08069CEC: .4byte 0xfffa0000
_08069CF0: .4byte gUnknown_083763E4
_08069CF4:
	movs r0, 0
_08069CF6:
	pop {r1}
	bx r1
	thumb_func_end sub_8069CB8

	thumb_func_start sub_8069CFC
sub_8069CFC: @ 8069CFC
	push {r4,r5,lr}
	lsls r0, 16
	asrs r5, r0, 16
	lsls r1, 16
	asrs r4, r1, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8069CB8
	cmp r0, 0
	beq _08069D2A
	ldr r1, _08069D30
	lsls r0, r4, 1
	adds r0, r1
	ldrh r0, [r0]
	bl GetVarPointer
	subs r2, r5, 0x3
	movs r1, 0x1
	lsls r1, r2
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
_08069D2A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069D30: .4byte gUnknown_083763E4
	thumb_func_end sub_8069CFC

	thumb_func_start sub_8069D34
sub_8069D34: @ 8069D34
	push {r4,r5,lr}
	lsls r0, 16
	asrs r5, r0, 16
	lsls r1, 16
	asrs r4, r1, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8069CB8
	cmp r0, 0
	beq _08069D66
	ldr r1, _08069D6C
	lsls r0, r4, 1
	adds r0, r1
	ldrh r0, [r0]
	bl VarGet
	lsls r0, 16
	subs r2, r5, 0x3
	movs r1, 0x80
	lsls r1, 9
	lsls r1, r2
	ands r1, r0
	cmp r1, 0
	bne _08069D70
_08069D66:
	movs r0, 0
	b _08069D72
	.align 2, 0
_08069D6C: .4byte gUnknown_083763E4
_08069D70:
	movs r0, 0x1
_08069D72:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8069D34

	thumb_func_start sub_8069D78
sub_8069D78: @ 8069D78
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _08069DCC
	ldr r0, [r0]
	ldr r1, [r0]
	mov r9, r1
	ldr r7, [r0, 0x4]
	movs r5, 0
	cmp r5, r9
	bge _08069DC0
_08069D90:
	movs r4, 0
	adds r0, r5, 0x1
	mov r8, r0
	cmp r4, r7
	bge _08069DBA
	lsls r6, r5, 16
_08069D9C:
	lsls r1, r4, 16
	asrs r1, 16
	asrs r0, r6, 16
	bl sub_8069D34
	cmp r0, 0x1
	bne _08069DB4
	adds r1, r4, 0x7
	adds r0, r5, 0x7
	ldr r2, _08069DD0
	bl MapGridSetMetatileIdAt
_08069DB4:
	adds r4, 0x1
	cmp r4, r7
	blt _08069D9C
_08069DBA:
	mov r5, r8
	cmp r5, r9
	blt _08069D90
_08069DC0:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08069DCC: .4byte 0x0202e828
_08069DD0: .4byte 0x0000020e
	thumb_func_end sub_8069D78

	thumb_func_start sub_8069DD4
sub_8069DD4: @ 8069DD4
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08069DF8
	adds r5, r1, r0
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _08069E20
	cmp r0, 0x1
	bgt _08069DFC
	cmp r0, 0
	beq _08069E08
	b _08069F56
	.align 2, 0
_08069DF8: .4byte 0x03004b28
_08069DFC:
	cmp r0, 0x2
	beq _08069EB6
	cmp r0, 0x3
	bne _08069E06
	b _08069F10
_08069E06:
	b _08069F56
_08069E08:
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0x4]
	ldrh r0, [r4]
	strh r0, [r5, 0x6]
	b _08069F52
_08069E20:
	mov r7, sp
	adds r7, 0x2
	mov r0, sp
	adds r1, r7, 0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x4
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _08069E4A
	movs r0, 0
	ldrsh r1, [r7, r0]
	movs r3, 0x6
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _08069E4A
	b _08069F56
_08069E4A:
	strh r2, [r5, 0x4]
	ldrh r0, [r7]
	strh r0, [r5, 0x6]
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r7, r2]
	bl MapGridGetMetatileBehaviorAt
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _08069E8C
	bl GetVarPointer
	adds r6, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_8057540
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08069E90
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	movs r0, 0x4
	strh r0, [r5, 0xC]
	movs r0, 0x2
	b _08069EA8
	.align 2, 0
_08069E8C: .4byte 0x00004022
_08069E90:
	adds r0, r4, 0
	bl sub_8057554
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08069F56
	movs r0, 0
	strh r0, [r6]
	movs r0, 0x4
	strh r0, [r5, 0xC]
	movs r0, 0x3
_08069EA8:
	strh r0, [r5, 0x2]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0x8]
	ldrh r0, [r7]
	strh r0, [r5, 0xA]
	b _08069F56
_08069EB6:
	ldrh r1, [r5, 0xC]
	movs r3, 0xC
	ldrsh r0, [r5, r3]
	cmp r0, 0
	bne _08069F1A
	mov r1, sp
	ldrh r0, [r5, 0x8]
	strh r0, [r1]
	mov r4, sp
	adds r4, 0x2
	ldrh r0, [r5, 0xA]
	strh r0, [r4]
	movs r0, 0x2A
	bl audio_play
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldr r2, _08069F0C
	bl MapGridSetMetatileIdAt
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x7
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r4]
	subs r1, 0x7
	lsls r1, 16
	asrs r1, 16
	bl sub_8069CFC
	b _08069F52
	.align 2, 0
_08069F0C: .4byte 0x0000020e
_08069F10:
	ldrh r1, [r5, 0xC]
	movs r3, 0xC
	ldrsh r0, [r5, r3]
	cmp r0, 0
	beq _08069F20
_08069F1A:
	subs r0, r1, 0x1
	strh r0, [r5, 0xC]
	b _08069F56
_08069F20:
	mov r1, sp
	ldrh r0, [r5, 0x8]
	strh r0, [r1]
	mov r4, sp
	adds r4, 0x2
	ldrh r0, [r5, 0xA]
	strh r0, [r4]
	movs r0, 0x29
	bl audio_play
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldr r2, _08069F60
	bl MapGridSetMetatileIdAt
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
_08069F52:
	movs r0, 0x1
	strh r0, [r5, 0x2]
_08069F56:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08069F60: .4byte 0x00000206
	thumb_func_end sub_8069DD4

	thumb_func_start sub_8069F64
sub_8069F64: @ 8069F64
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08069FE8
	adds r5, r1, r0
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x2
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _08069F9E
	movs r0, 0
	ldrsh r1, [r4, r0]
	movs r3, 0x4
	ldrsh r0, [r5, r3]
	cmp r1, r0
	beq _0806A02A
_08069F9E:
	strh r2, [r5, 0x2]
	ldrh r0, [r4]
	strh r0, [r5, 0x4]
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsAsh
	lsls r0, 24
	cmp r0, 0
	beq _0806A02A
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileIdAt
	ldr r1, _08069FEC
	cmp r0, r1
	bne _08069FF4
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldr r2, _08069FF0
	movs r3, 0x4
	bl ash
	b _0806A006
	.align 2, 0
_08069FE8: .4byte 0x03004b28
_08069FEC: .4byte 0x0000020a
_08069FF0: .4byte 0x00000212
_08069FF4:
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldr r2, _0806A034
	movs r3, 0x4
	bl ash
_0806A006:
	movs r0, 0x87
	lsls r0, 1
	movs r1, 0x1
	bl sub_80A92D4
	lsls r0, 24
	cmp r0, 0
	beq _0806A02A
	ldr r0, _0806A038
	bl GetVarPointer
	adds r2, r0, 0
	ldrh r1, [r2]
	ldr r0, _0806A03C
	cmp r1, r0
	bhi _0806A02A
	adds r0, r1, 0x1
	strh r0, [r2]
_0806A02A:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A034: .4byte 0x00000206
_0806A038: .4byte 0x00004048
_0806A03C: .4byte 0x0000270e
	thumb_func_end sub_8069F64

	thumb_func_start sub_806A040
sub_806A040: @ 806A040
	push {r4,r5,lr}
	lsls r0, 16
	asrs r5, r0, 16
	lsls r1, 16
	asrs r4, r1, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridGetMetatileIdAt
	ldr r1, _0806A074
	ldr r2, _0806A078
	cmp r0, r1
	bne _0806A05C
	subs r2, 0x31
_0806A05C:
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridSetMetatileIdAt
	adds r0, r5, 0
	adds r1, r4, 0
	bl CurrentMapDrawMetatileAt
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A074: .4byte 0x0000022f
_0806A078: .4byte 0x00000237
	thumb_func_end sub_806A040

	thumb_func_start sub_806A07C
sub_806A07C: @ 806A07C
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0806A164
	adds r5, r1, r0
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 16
	lsrs r6, r0, 16
	ldrh r1, [r5, 0x8]
	movs r3, 0x8
	ldrsh r0, [r5, r3]
	adds r7, r4, 0
	cmp r0, 0
	beq _0806A0CE
	subs r0, r1, 0x1
	strh r0, [r5, 0x8]
	lsls r0, 16
	cmp r0, 0
	bne _0806A0CE
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	movs r2, 0xC
	ldrsh r1, [r5, r2]
	bl sub_806A040
_0806A0CE:
	ldrh r1, [r5, 0xE]
	movs r3, 0xE
	ldrsh r0, [r5, r3]
	cmp r0, 0
	beq _0806A0EE
	subs r0, r1, 0x1
	strh r0, [r5, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _0806A0EE
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	movs r2, 0x12
	ldrsh r1, [r5, r2]
	bl sub_806A040
_0806A0EE:
	lsls r0, r6, 24
	lsrs r6, r0, 24
	adds r0, r6, 0
	bl sub_8057818
	lsls r0, 24
	cmp r0, 0
	beq _0806A106
	ldr r0, _0806A168
	movs r1, 0
	bl VarSet
_0806A106:
	mov r0, sp
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x4
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _0806A122
	movs r0, 0
	ldrsh r1, [r7, r0]
	movs r3, 0x6
	ldrsh r0, [r5, r3]
	cmp r1, r0
	beq _0806A182
_0806A122:
	strh r2, [r5, 0x4]
	adds r4, r7, 0
	ldrh r0, [r4]
	strh r0, [r5, 0x6]
	adds r0, r6, 0
	bl sub_805782C
	lsls r0, 24
	cmp r0, 0
	beq _0806A182
	bl sub_80E6034
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	beq _0806A14A
	ldr r0, _0806A168
	movs r1, 0
	bl VarSet
_0806A14A:
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0806A16C
	movs r0, 0x3
	strh r0, [r5, 0x8]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0xA]
	ldrh r0, [r4]
	strh r0, [r5, 0xC]
	b _0806A182
	.align 2, 0
_0806A164: .4byte 0x03004b28
_0806A168: .4byte 0x00004022
_0806A16C:
	movs r2, 0xE
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bne _0806A182
	movs r0, 0x3
	strh r0, [r5, 0xE]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0x10]
	ldrh r0, [r7]
	strh r0, [r5, 0x12]
_0806A182:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806A07C

	thumb_func_start sub_806A18C
sub_806A18C: @ 806A18C
	push {r4,r5,lr}
	adds r3, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 16
	lsrs r4, r2, 16
	ldrh r0, [r3]
	subs r0, 0x1
	strh r0, [r3]
	lsls r0, 16
	cmp r0, 0
	bne _0806A1A8
	movs r2, 0xE8
	b _0806A1BC
_0806A1A8:
	ldr r1, _0806A1E4
	movs r2, 0
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bge _0806A1B4
	adds r0, 0x7
_0806A1B4:
	asrs r0, 3
	lsls r0, 1
	adds r0, r1
	ldrh r2, [r0]
_0806A1BC:
	lsls r5, 16
	asrs r5, 16
	lsls r4, 16
	asrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridSetMetatileIdAt
	adds r0, r5, 0
	adds r1, r4, 0
	bl CurrentMapDrawMetatileAt
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0xE8
	bl MapGridSetMetatileIdAt
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A1E4: .4byte gUnknown_08376418
	thumb_func_end sub_806A18C

	thumb_func_start sub_806A1E8
sub_806A1E8: @ 806A1E8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0806A230
	adds r4, r1, r0
	mov r5, sp
	adds r5, 0x2
	mov r0, sp
	adds r1, r5, 0
	bl PlayerGetDestCoords
	ldr r0, _0806A234
	movs r1, 0x4
	ldrsb r1, [r0, r1]
	lsls r1, 8
	ldrb r0, [r0, 0x5]
	lsls r0, 24
	asrs r0, 24
	orrs r0, r1
	lsls r0, 16
	lsrs r7, r0, 16
	movs r0, 0x2
	ldrsh r1, [r4, r0]
	mov r8, r5
	cmp r1, 0
	beq _0806A238
	cmp r1, 0x1
	beq _0806A264
	b _0806A2B8
	.align 2, 0
_0806A230: .4byte 0x03004b28
_0806A234: .4byte 0x02025734
_0806A238:
	strh r7, [r4]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x4]
	ldrh r0, [r5]
	strh r0, [r4, 0x6]
	movs r0, 0x1
	strh r0, [r4, 0x2]
	strh r1, [r4, 0x8]
	strh r1, [r4, 0xE]
	strh r1, [r4, 0x14]
	strh r1, [r4, 0x1A]
	b _0806A2B8
_0806A252:
	movs r0, 0x20
	strh r0, [r1]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r1, 0x2]
	mov r2, r8
	ldrh r0, [r2]
	strh r0, [r1, 0x4]
	b _0806A2B8
_0806A264:
	mov r0, sp
	movs r3, 0x4
	ldrsh r1, [r4, r3]
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bne _0806A280
	movs r0, 0x6
	ldrsh r1, [r4, r0]
	movs r3, 0
	ldrsh r0, [r5, r3]
	cmp r1, r0
	beq _0806A2B8
_0806A280:
	strh r2, [r4, 0x4]
	ldrh r0, [r5]
	strh r0, [r4, 0x6]
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsMuddySlope
	lsls r0, 24
	cmp r0, 0
	beq _0806A2B8
	movs r6, 0x4
	adds r1, r4, 0
	adds r1, 0x8
_0806A2A8:
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _0806A252
	adds r1, 0x6
	adds r6, 0x3
	cmp r6, 0xD
	ble _0806A2A8
_0806A2B8:
	ldr r2, _0806A2D4
	ldrb r1, [r2]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806A2D8
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r7, r0
	beq _0806A2D8
	strh r7, [r4]
	ldrh r0, [r2, 0x4]
	ldrh r1, [r2, 0x8]
	b _0806A2DC
	.align 2, 0
_0806A2D4: .4byte 0x0202e844
_0806A2D8:
	movs r0, 0
	movs r1, 0
_0806A2DC:
	lsls r0, 16
	asrs r0, 16
	mov r8, r0
	lsls r0, r1, 16
	asrs r7, r0, 16
	adds r5, r4, 0
	adds r5, 0x8
	adds r4, r5, 0
	movs r6, 0x9
_0806A2EE:
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0806A312
	ldrh r0, [r4, 0x2]
	mov r3, r8
	subs r0, r3
	strh r0, [r4, 0x2]
	ldrh r0, [r4, 0x4]
	subs r0, r7
	strh r0, [r4, 0x4]
	movs r0, 0x2
	ldrsh r1, [r4, r0]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	adds r0, r5, 0
	bl sub_806A18C
_0806A312:
	adds r4, 0x6
	adds r5, 0x6
	subs r6, 0x3
	cmp r6, 0
	bge _0806A2EE
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806A1E8

	thumb_func_start sub_806A328
sub_806A328: @ 806A328
	push {lr}
	ldr r0, _0806A350
	bl FlagSet
	bl RtcCalcLocalTime
	ldr r2, _0806A354
	adds r2, 0xA0
	ldr r3, _0806A358
	ldr r0, [r3]
	ldr r1, [r3, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _0806A35C
	ldrh r1, [r3]
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_0806A350: .4byte 0x00000835
_0806A354: .4byte gSaveBlock2
_0806A358: .4byte 0x03004038
_0806A35C: .4byte 0x00004040
	thumb_func_end sub_806A328

	thumb_func_start InTrainerHill
InTrainerHill: @ 806A360
	push {r4,lr}
	ldr r0, _0806A388
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0806A380
	bl RtcCalcLocalTime
	ldr r4, _0806A38C
	adds r0, r4, 0
	bl sub_806A390
	adds r0, r4, 0
	bl sub_806A3F4
_0806A380:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A388: .4byte 0x00000835
_0806A38C: .4byte 0x03004038
	thumb_func_end InTrainerHill

	thumb_func_start sub_806A390
sub_806A390: @ 806A390
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _0806A3F0
	bl GetVarPointer
	adds r6, r0, 0
	ldrh r0, [r6]
	movs r2, 0
	ldrsh r1, [r5, r2]
	cmp r0, r1
	beq _0806A3EA
	cmp r0, r1
	bgt _0806A3EA
	ldrh r4, [r5]
	subs r4, r0
	lsls r4, 16
	lsrs r4, 16
	bl sub_80690B4
	adds r0, r4, 0
	bl sub_80FA220
	adds r0, r4, 0
	bl sub_80BE8C4
	adds r0, r4, 0
	bl sub_8080834
	adds r0, r4, 0
	bl sub_80401D8
	adds r0, r4, 0
	bl sub_810D2F4
	adds r0, r4, 0
	bl sub_810D410
	adds r0, r4, 0
	bl sub_810F618
	adds r0, r4, 0
	bl sub_8145AA4
	ldrh r0, [r5]
	strh r0, [r6]
_0806A3EA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A3F0: .4byte 0x00004040
	thumb_func_end sub_806A390

	thumb_func_start sub_806A3F4
sub_806A3F4: @ 806A3F4
	push {r4-r6,lr}
	sub sp, 0x8
	adds r5, r0, 0
	mov r4, sp
	ldr r6, _0806A448
	mov r0, sp
	adds r1, r6, 0
	adds r2, r5, 0
	bl CalcTimeDifference
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 5
	movs r2, 0x2
	ldrsb r2, [r4, r2]
	lsls r0, r2, 4
	subs r0, r2
	lsls r0, 2
	adds r1, r0
	movs r0, 0x3
	ldrsb r0, [r4, r0]
	adds r0, r1, r0
	cmp r0, 0
	beq _0806A43E
	cmp r0, 0
	blt _0806A43E
	bl BerryTreeTimeUpdate
	ldr r0, [r5]
	ldr r1, [r5, 0x4]
	str r0, [r6]
	str r1, [r6, 0x4]
_0806A43E:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A448: .4byte 0x02024f44
	thumb_func_end sub_806A3F4

	thumb_func_start sub_806A44C
sub_806A44C: @ 806A44C
	push {lr}
	bl sub_806A328
	ldr r0, _0806A45C
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0806A45C: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_806A44C

	thumb_func_start sub_806A460
sub_806A460: @ 806A460
	push {lr}
	ldr r0, _0806A474
	bl SetMainCallback2
	ldr r1, _0806A478
	ldr r0, _0806A47C
	str r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_0806A474: .4byte Cb2_StartWallClock
_0806A478: .4byte 0x03001770
_0806A47C: .4byte sub_806A44C
	thumb_func_end sub_806A460

	thumb_func_start sub_806A480
sub_806A480: @ 806A480
	push {lr}
	adds r3, r0, 0
	ldr r2, _0806A4B0
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0xC
	ldrsh r1, [r0, r2]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r1, r0
	beq _0806A596
	strh r1, [r3, 0x30]
	subs r0, r1, 0x1
	cmp r0, 0x5
	bhi _0806A596
	lsls r0, 2
	ldr r1, _0806A4B4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806A4B0: .4byte 0x03004b20
_0806A4B4: .4byte _0806A4B8
	.align 2, 0
_0806A4B8:
	.4byte _0806A4D0
	.4byte _0806A4F4
	.4byte _0806A518
	.4byte _0806A53C
	.4byte _0806A566
	.4byte _0806A590
_0806A4D0:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0x1
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x41
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x35
	b _0806A55E
_0806A4F4:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0x1
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x41
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x56
	b _0806A55E
_0806A518:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0x1
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x41
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x6B
	b _0806A55E
_0806A53C:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0x1
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x41
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x80
_0806A55E:
	strh r0, [r3, 0x20]
	movs r0, 0x44
	strh r0, [r3, 0x22]
	b _0806A596
_0806A566:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0x2
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x42
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x9B
	strh r0, [r3, 0x20]
	movs r0, 0x50
	strh r0, [r3, 0x22]
	b _0806A596
_0806A590:
	adds r0, r3, 0
	bl DestroySprite
_0806A596:
	pop {r0}
	bx r0
	thumb_func_end sub_806A480

	thumb_func_start sub_806A59C
sub_806A59C: @ 806A59C
	push {lr}
	adds r3, r0, 0
	ldr r2, _0806A5CC
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0xC
	ldrsh r1, [r0, r2]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r1, r0
	beq _0806A696
	strh r1, [r3, 0x30]
	subs r0, r1, 0x1
	cmp r0, 0x5
	bhi _0806A696
	lsls r0, 2
	ldr r1, _0806A5D0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806A5CC: .4byte 0x03004b20
_0806A5D0: .4byte _0806A5D4
	.align 2, 0
_0806A5D4:
	.4byte _0806A5EC
	.4byte _0806A610
	.4byte _0806A634
	.4byte _0806A658
	.4byte _0806A682
	.4byte _0806A690
_0806A5EC:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x40
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x35
	b _0806A67A
_0806A610:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x40
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x56
	b _0806A67A
_0806A634:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x40
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x6B
	b _0806A67A
_0806A658:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x40
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x80
_0806A67A:
	strh r0, [r3, 0x20]
	movs r0, 0x5C
	strh r0, [r3, 0x22]
	b _0806A696
_0806A682:
	adds r0, r3, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0806A696
_0806A690:
	adds r0, r3, 0
	bl DestroySprite
_0806A696:
	pop {r0}
	bx r0
	thumb_func_end sub_806A59C

	thumb_func_start sub_806A69C
sub_806A69C: @ 806A69C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _0806A70C
	bl LoadSpritePalette
	ldr r0, _0806A710
	mov r8, r0
	movs r1, 0x35
	movs r2, 0x44
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r6, _0806A714
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r6, 0
	adds r4, 0x1C
	adds r2, r0, r4
	ldr r1, _0806A718
	str r1, [r2]
	adds r0, r6
	strh r5, [r0, 0x2E]
	ldr r1, _0806A71C
	strh r1, [r0, 0x30]
	mov r0, r8
	movs r1, 0x35
	movs r2, 0x44
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r4
	ldr r1, _0806A720
	str r1, [r4]
	adds r0, r6
	strh r5, [r0, 0x2E]
	movs r1, 0x1
	negs r1, r1
	strh r1, [r0, 0x30]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A70C: .4byte gUnknown_083764BC
_0806A710: .4byte gSpriteTemplate_83764E8
_0806A714: .4byte 0x02020004
_0806A718: .4byte sub_806A480
_0806A71C: .4byte 0x0000ffff
_0806A720: .4byte sub_806A59C
	thumb_func_end sub_806A69C

	thumb_func_start sub_806A724
sub_806A724: @ 806A724
	push {lr}
	ldr r0, _0806A734
	ldrh r0, [r0, 0x4]
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	.align 2, 0
_0806A734: .4byte gUnknown_083764BC
	thumb_func_end sub_806A724

	thumb_func_start sub_806A738
sub_806A738: @ 806A738
	push {lr}
	movs r0, 0x3
	movs r1, 0x8
	movs r2, 0x19
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	thumb_func_end sub_806A738

	thumb_func_start sub_806A74C
sub_806A74C: @ 806A74C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r10, r0
	adds r0, r2, 0
	adds r4, r3, 0
	ldr r6, [sp, 0x24]
	ldr r2, [sp, 0x28]
	mov r9, r2
	mov r2, r10
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp]
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	mov r1, r9
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	ldr r7, _0806A83C
	ldr r1, _0806A840
	bl __umodsi3
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	movs r1, 0x18
	bl __umodsi3
	mov r8, r0
	mov r2, r8
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	adds r0, r6, 0
	movs r1, 0x3C
	bl __umodsi3
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	mov r0, r9
	movs r1, 0x3C
	bl __umodsi3
	mov r9, r0
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r4, _0806A844
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x18
	movs r3, 0x1
	bl sub_8072C44
	adds r0, r7, 0
	adds r1, r4, 0
	bl StringCopy
	adds r7, r0, 0
	ldr r1, _0806A848
	bl StringCopy
	adds r7, r0, 0
	adds r0, r4, 0
	mov r1, r8
	movs r2, 0x12
	movs r3, 0x1
	bl sub_8072C44
	adds r0, r7, 0
	adds r1, r4, 0
	bl StringCopy
	adds r7, r0, 0
	ldr r4, _0806A84C
	adds r1, r4, 0
	bl StringCopy
	adds r7, r0, 0
	adds r1, r6, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r7, r0, 0
	adds r1, r4, 0
	bl StringCopy
	adds r7, r0, 0
	mov r1, r9
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _0806A83C
	mov r1, r10
	ldr r2, [sp]
	bl MenuPrint
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A83C: .4byte 0x020234cc
_0806A840: .4byte 0x00002710
_0806A844: .4byte 0x020231cc
_0806A848: .4byte gUnknown_0842D4F6
_0806A84C: .4byte gUnknown_08376500
	thumb_func_end sub_806A74C

	thumb_func_start sub_806A850
sub_806A850: @ 806A850
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	adds r6, r0, 0
	mov r8, r1
	adds r4, r2, 0
	adds r5, r3, 0
	lsls r6, 16
	lsrs r6, 16
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x3
	movs r1, 0x8
	movs r2, 0x19
	movs r3, 0xB
	bl MenuDrawTextWindow
	ldr r0, _0806A8A8
	movs r1, 0x14
	movs r2, 0x9
	bl MenuPrint
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r0, 0x4
	movs r1, 0x9
	adds r2, r6, 0
	mov r3, r8
	bl sub_806A74C
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A8A8: .4byte gUnknown_0842D4FC
	thumb_func_end sub_806A850

	thumb_func_start sub_806A8AC
sub_806A8AC: @ 806A8AC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r3, 16
	lsrs r3, 16
	adds r1, r3, 0
	movs r0, 0x80
	ands r0, r3
	cmp r0, 0
	beq _0806A8C6
	ldrh r0, [r4]
	subs r0, 0x1
	b _0806A8E0
_0806A8C6:
	movs r0, 0x40
	ands r0, r3
	cmp r0, 0
	beq _0806A8D4
	ldrh r0, [r4]
	adds r0, 0x1
	b _0806A8FE
_0806A8D4:
	movs r0, 0x20
	ands r0, r3
	cmp r0, 0
	beq _0806A8EE
	ldrh r0, [r4]
	subs r0, 0xA
_0806A8E0:
	strh r0, [r4]
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, r5
	bge _0806A90A
	strh r2, [r4]
	b _0806A90A
_0806A8EE:
	movs r0, 0x10
	ands r1, r0
	cmp r1, 0
	bne _0806A8FA
	movs r0, 0
	b _0806A90C
_0806A8FA:
	ldrh r0, [r4]
	adds r0, 0xA
_0806A8FE:
	strh r0, [r4]
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, r2
	ble _0806A90A
	strh r5, [r4]
_0806A90A:
	movs r0, 0x1
_0806A90C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806A8AC

	thumb_func_start sub_806A914
sub_806A914: @ 806A914
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806A928
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x1
	strh r0, [r1, 0x8]
	bx lr
	.align 2, 0
_0806A928: .4byte 0x03004b20
	thumb_func_end sub_806A914

	thumb_func_start sub_806A92C
sub_806A92C: @ 806A92C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_806A738
	bl sub_806A724
	ldr r1, _0806A950
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806A954
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A950: .4byte 0x03004b20
_0806A954: .4byte sub_806A914
	thumb_func_end sub_806A92C

	thumb_func_start sub_806A958
sub_806A958: @ 806A958
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r7, r0, 3
	ldr r0, _0806A99C
	mov r8, r0
	adds r5, r7, r0
	ldrb r4, [r5, 0x4]
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	ldr r1, _0806A9A0
	adds r2, r0, r1
	ldr r1, _0806A9A4
	ldrh r3, [r1, 0x2E]
	movs r0, 0x2
	ands r0, r3
	mov r12, r1
	cmp r0, 0
	beq _0806A9AC
	mov r0, r8
	subs r0, 0x8
	adds r0, r7, r0
	ldr r1, _0806A9A8
	str r1, [r0]
	movs r0, 0
	strh r0, [r5, 0x2]
	movs r0, 0x6
	b _0806A9CC
	.align 2, 0
_0806A99C: .4byte 0x03004b28
_0806A9A0: .4byte gUnknown_08376414
_0806A9A4: .4byte 0x03001770
_0806A9A8: .4byte sub_806A92C
_0806A9AC:
	movs r0, 0x10
	ands r0, r3
	cmp r0, 0
	beq _0806A9BA
	ldrb r0, [r2, 0x7]
	cmp r0, 0
	bne _0806A9CC
_0806A9BA:
	mov r3, r12
	ldrh r1, [r3, 0x2E]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0806A9D6
	ldrb r0, [r2, 0x6]
	cmp r0, 0
	beq _0806A9D6
_0806A9CC:
	strh r0, [r5, 0x4]
	movs r0, 0x5
	bl audio_play
	b _0806AA58
_0806A9D6:
	cmp r4, 0x5
	bne _0806AA24
	mov r0, r12
	ldrh r1, [r0, 0x2E]
	movs r4, 0x1
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _0806AA58
	ldr r1, _0806AA18
	ldrh r0, [r5, 0x6]
	strh r0, [r1]
	ldrh r0, [r5, 0x8]
	strb r0, [r1, 0x2]
	ldrh r0, [r5, 0xA]
	strb r0, [r1, 0x3]
	ldrh r0, [r5, 0xC]
	strb r0, [r1, 0x4]
	movs r0, 0x5
	bl audio_play
	ldr r1, _0806AA1C
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806AA20
	str r1, [r0]
	strh r4, [r5, 0x2]
	movs r0, 0x6
	strh r0, [r5, 0x4]
	b _0806AA58
	.align 2, 0
_0806AA18: .4byte 0x03004038
_0806AA1C: .4byte 0x03004b20
_0806AA20: .4byte sub_806A92C
_0806AA24:
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r5, r0
	ldrh r1, [r2, 0x2]
	ldrh r2, [r2, 0x4]
	mov r3, r12
	ldrh r4, [r3, 0x30]
	movs r3, 0xC0
	ands r3, r4
	bl sub_806A8AC
	cmp r0, 0
	beq _0806AA58
	movs r0, 0x5
	bl audio_play
	ldrh r2, [r5, 0x6]
	ldrb r3, [r5, 0x8]
	ldrb r0, [r5, 0xA]
	str r0, [sp]
	ldrb r0, [r5, 0xC]
	str r0, [sp, 0x4]
	movs r0, 0x4
	movs r1, 0x9
	bl sub_806A74C
_0806AA58:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806A958

	thumb_func_start sub_806AA64
sub_806AA64: @ 806AA64
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r6, r5, 2
	adds r6, r5
	lsls r6, 3
	ldr r0, _0806AACC
	mov r8, r0
	adds r4, r6, r0
	movs r0, 0
	strh r0, [r4]
	ldr r3, _0806AAD0
	ldrh r0, [r3]
	strh r0, [r4, 0x6]
	movs r1, 0x2
	ldrsb r1, [r3, r1]
	strh r1, [r4, 0x8]
	movs r2, 0x3
	ldrsb r2, [r3, r2]
	strh r2, [r4, 0xA]
	ldrb r3, [r3, 0x4]
	lsls r3, 24
	asrs r3, 24
	strh r3, [r4, 0xC]
	ldrh r0, [r4, 0x6]
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	bl sub_806A850
	adds r0, r5, 0
	bl sub_806A69C
	movs r0, 0x2
	strh r0, [r4, 0x4]
	movs r0, 0x8
	negs r0, r0
	add r8, r0
	add r6, r8
	ldr r0, _0806AAD4
	str r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806AACC: .4byte 0x03004b28
_0806AAD0: .4byte 0x03004038
_0806AAD4: .4byte sub_806A958
	thumb_func_end sub_806AA64

	thumb_func_start sub_806AAD8
sub_806AAD8: @ 806AAD8
	push {r4-r7,lr}
	sub sp, 0x4
	movs r0, 0x80
	lsls r0, 19
	movs r4, 0
	strh r4, [r0]
	movs r0, 0
	bl SetVBlankCallback
	movs r2, 0xA0
	lsls r2, 19
	mov r0, sp
	strh r4, [r0]
	ldr r1, _0806AB94
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _0806AB98
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0xC0
	lsls r3, 9
	mov r4, sp
	movs r6, 0
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _0806AB9C
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_0806AB16:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r5
	subs r3, r5
	cmp r3, r5
	bhi _0806AB16
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0
	movs r1, 0x80
	bl ResetOamRange
	bl LoadOam
	bl remove_some_task
	bl dp12_8087EA4
	bl ResetSpriteData
	bl ResetTasks
	bl ResetPaletteFade
	ldr r4, _0806ABA0
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0x88
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0806ABA4
	bl SetVBlankCallback
	ldr r0, _0806ABA8
	bl SetMainCallback2
	ldr r0, _0806ABAC
	movs r1, 0x50
	bl CreateTask
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806AB94: .4byte 0x040000d4
_0806AB98: .4byte 0x81000200
_0806AB9C: .4byte 0x81000800
_0806ABA0: .4byte gWindowConfig_81E6CE4
_0806ABA4: .4byte sub_806ABC8
_0806ABA8: .4byte sub_806ABB0
_0806ABAC: .4byte sub_806ACCC
	thumb_func_end sub_806AAD8

	thumb_func_start sub_806ABB0
sub_806ABB0: @ 806ABB0
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_806ABB0

	thumb_func_start sub_806ABC8
sub_806ABC8: @ 806ABC8
	push {lr}
	bl ProcessSpriteCopyRequests
	bl LoadOam
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_806ABC8

	thumb_func_start sub_806ABDC
sub_806ABDC: @ 806ABDC
	push {r4,lr}
	adds r4, r0, 0
	bl MenuDisplayMessageBox
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_806ABDC

	thumb_func_start sub_806ABF4
sub_806ABF4: @ 806ABF4
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0806AC14
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0806AC18
	cmp r0, 0x1
	beq _0806AC80
	b _0806ACC4
	.align 2, 0
_0806AC14: .4byte 0x03004b28
_0806AC18:
	bl MenuZeroFillScreen
	movs r0, 0
	movs r1, 0
	movs r2, 0x14
	movs r3, 0xA
	bl MenuDrawTextWindow
	ldr r0, _0806AC98
	movs r1, 0x1
	movs r2, 0x1
	bl MenuPrint
	ldr r0, _0806AC9C
	ldrh r2, [r0]
	ldrb r3, [r0, 0x2]
	ldrb r1, [r0, 0x3]
	str r1, [sp]
	ldrb r0, [r0, 0x4]
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0x3
	bl sub_806A74C
	ldr r0, _0806ACA0
	movs r1, 0x1
	movs r2, 0x5
	bl MenuPrint
	ldr r1, _0806ACA4
	adds r0, r1, 0
	adds r0, 0xA0
	ldrh r2, [r0]
	adds r0, 0x2
	ldrb r3, [r0]
	adds r0, 0x1
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r1, 0
	adds r0, 0xA4
	ldrb r0, [r0]
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0x7
	bl sub_806A74C
	ldr r0, _0806ACA8
	bl sub_806ABDC
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0806AC80:
	ldr r0, _0806ACAC
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0806ACB0
	adds r0, r5, 0
	bl DestroyTask
	bl DoSoftReset
	b _0806ACC4
	.align 2, 0
_0806AC98: .4byte gUnknown_08411804
_0806AC9C: .4byte 0x03004038
_0806ACA0: .4byte gUnknown_08411819
_0806ACA4: .4byte gSaveBlock2
_0806ACA8: .4byte gUnknown_084117E3
_0806ACAC: .4byte 0x03001770
_0806ACB0:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806ACC4
	movs r0, 0x5
	bl audio_play
	adds r0, r5, 0
	bl DestroyTask
_0806ACC4:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_806ABF4

	thumb_func_start sub_806ACCC
sub_806ACCC: @ 806ACCC
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0806ACF4
	adds r5, r0, r1
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0x6
	bls _0806ACE8
	b _0806AEC4
_0806ACE8:
	lsls r0, 2
	ldr r1, _0806ACF8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806ACF4: .4byte 0x03004b28
_0806ACF8: .4byte _0806ACFC
	.align 2, 0
_0806ACFC:
	.4byte _0806AD18
	.4byte _0806AD34
	.4byte _0806AD80
	.4byte _0806ADD8
	.4byte _0806AE5C
	.4byte _0806AE8C
	.4byte _0806AEAE
_0806AD18:
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0806AD30
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0x1
	strh r0, [r5]
	b _0806AEC4
	.align 2, 0
_0806AD30: .4byte 0x0000ffff
_0806AD34:
	ldr r0, _0806AD5C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0806AD42
	b _0806AEC4
_0806AD42:
	ldr r0, _0806AD60
	ldrh r0, [r0]
	cmp r0, 0
	beq _0806AD4E
	cmp r0, 0x2
	bne _0806AD68
_0806AD4E:
	ldr r0, _0806AD64
	bl sub_806ABDC
	movs r0, 0x5
	strh r0, [r5]
	b _0806AEC4
	.align 2, 0
_0806AD5C: .4byte 0x0202f388
_0806AD60: .4byte 0x03005eb8
_0806AD64: .4byte gUnknown_084118A0
_0806AD68:
	bl RtcCalcLocalTime
	ldr r0, _0806AD7C
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x2]
	b _0806ADFC
	.align 2, 0
_0806AD7C: .4byte sub_806ABF4
_0806AD80:
	ldr r2, _0806ADC4
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x4]
	cmp r0, 0x1
	bne _0806AD96
	b _0806AEC4
_0806AD96:
	bl MenuZeroFillScreen
	ldr r0, _0806ADC8
	bl sub_806ABDC
	ldr r2, _0806ADCC
	ldr r0, _0806ADD0
	adds r0, 0xA0
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _0806ADD4
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x2]
	movs r0, 0x3
	strh r0, [r5]
	b _0806AEC4
	.align 2, 0
_0806ADC4: .4byte 0x03004b20
_0806ADC8: .4byte gUnknown_0841182F
_0806ADCC: .4byte 0x03004038
_0806ADD0: .4byte gSaveBlock2
_0806ADD4: .4byte sub_806AA64
_0806ADD8:
	ldr r2, _0806AE04
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r1, r0, r2
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _0806AEC4
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0806AE08
	ldrb r0, [r5, 0x2]
	bl DestroyTask
_0806ADFC:
	movs r0, 0x2
	strh r0, [r5]
	b _0806AEC4
	.align 2, 0
_0806AE04: .4byte 0x03004b20
_0806AE08:
	ldrb r0, [r5, 0x2]
	bl DestroyTask
	bl RtcReset
	ldr r4, _0806AE4C
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r1, 0x2
	ldrsb r1, [r4, r1]
	movs r2, 0x3
	ldrsb r2, [r4, r2]
	movs r3, 0x4
	ldrsb r3, [r4, r3]
	bl RtcCalcLocalTimeOffset
	ldr r2, _0806AE50
	adds r2, 0xA0
	ldr r0, [r4]
	ldr r1, [r4, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _0806AE54
	ldrh r1, [r4]
	bl VarSet
	bl sub_80691A0
	ldr r0, _0806AE58
	bl sub_806ABDC
	movs r0, 0x4
	strh r0, [r5]
	b _0806AEC4
	.align 2, 0
_0806AE4C: .4byte 0x03004038
_0806AE50: .4byte gSaveBlock2
_0806AE54: .4byte 0x00004040
_0806AE58: .4byte gUnknown_08411846
_0806AE5C:
	movs r0, 0
	bl sub_8125D44
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806AE7C
	ldr r0, _0806AE78
	bl sub_806ABDC
	movs r0, 0x49
	bl audio_play
	b _0806AE88
	.align 2, 0
_0806AE78: .4byte gUnknown_08411881
_0806AE7C:
	ldr r0, _0806AECC
	bl sub_806ABDC
	movs r0, 0x16
	bl audio_play
_0806AE88:
	movs r0, 0x5
	strh r0, [r5]
_0806AE8C:
	ldr r0, _0806AED0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806AEC4
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0806AED4
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r0, 0x6
	strh r0, [r5]
_0806AEAE:
	ldr r0, _0806AED8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0806AEC4
	adds r0, r4, 0
	bl DestroyTask
	bl DoSoftReset
_0806AEC4:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806AECC: .4byte gUnknown_08411891
_0806AED0: .4byte 0x03001770
_0806AED4: .4byte 0x0000ffff
_0806AED8: .4byte 0x0202f388
	thumb_func_end sub_806ACCC

	thumb_func_start sub_806AEDC
sub_806AEDC: @ 806AEDC
	push {r4-r6,lr}
	sub sp, 0x4
	bl AnimateSprites
	bl BuildOamBuffer
	ldr r0, _0806AF2C
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 4
	ldr r1, _0806AF30
	adds r5, r0, r1
	movs r6, 0
_0806AEF8:
	ldrb r0, [r5]
	lsls r0, 3
	ldrb r1, [r5, 0x1]
	lsls r1, 3
	ldr r2, [r5, 0x4]
	lsls r3, r6, 5
	movs r4, 0x80
	lsls r4, 2
	orrs r3, r4
	str r3, [sp]
	movs r3, 0
	bl sub_800142C
	adds r5, 0x8
	adds r6, 0x1
	cmp r6, 0x5
	ble _0806AEF8
	bl RunTasks
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806AF2C: .4byte 0x0202e8fa
_0806AF30: .4byte gUnknown_08376BB4
	thumb_func_end sub_806AEDC

	thumb_func_start sub_806AF34
sub_806AF34: @ 806AF34
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_806B548
	pop {r0}
	bx r0
	thumb_func_end sub_806AF34

	thumb_func_start sub_806AF4C
sub_806AF4C: @ 806AF4C
	push {r4,r5,lr}
	adds r4, r2, 0
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r3, 24
	lsrs r3, 24
	cmp r1, 0xFF
	beq _0806AF64
	ldr r0, _0806AF84
	strh r1, [r0]
_0806AF64:
	ldr r0, _0806AF88
	movs r5, 0x96
	lsls r5, 2
	adds r1, r0, r5
	strb r2, [r1]
	movs r2, 0x97
	lsls r2, 2
	adds r1, r0, r2
	str r4, [r1]
	adds r5, 0x1
	adds r0, r5
	strb r3, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806AF84: .4byte 0x020239f8
_0806AF88: .4byte 0x0201b000
	thumb_func_end sub_806AF4C

	thumb_func_start sub_806AF8C
sub_806AF8C: @ 806AF8C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r3, 24
	lsrs r3, 24
	bl sub_806AF4C
	ldr r0, _0806AFA8
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0806AFA8: .4byte sub_806B460
	thumb_func_end sub_806AF8C

	thumb_func_start sub_806AFAC
sub_806AFAC: @ 806AFAC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0806AFCC
	lsls r3, r0, 1
	adds r3, r0
	lsls r3, 2
	adds r3, r2
	ldr r2, [r3]
	ldrb r3, [r3, 0x8]
	bl sub_806AF8C
	pop {r0}
	bx r0
	.align 2, 0
_0806AFCC: .4byte gUnknown_08376C74
	thumb_func_end sub_806AFAC

	thumb_func_start sub_806AFD0
sub_806AFD0: @ 806AFD0
	push {r4,r5,lr}
	ldr r1, _0806AFF0
	movs r2, 0x99
	lsls r2, 2
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0x9
	bls _0806AFE6
	b _0806B11A
_0806AFE6:
	lsls r0, 2
	ldr r1, _0806AFF4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806AFF0: .4byte 0x0201b000
_0806AFF4: .4byte _0806AFF8
	.align 2, 0
_0806AFF8:
	.4byte _0806B020
	.4byte _0806B060
	.4byte _0806B066
	.4byte _0806B07A
	.4byte _0806B0A4
	.4byte _0806B0AA
	.4byte _0806B0BC
	.4byte _0806B0C2
	.4byte _0806B0D4
	.4byte _0806B0EC
_0806B020:
	ldr r0, _0806B048
	adds r5, r4, r0
	movs r1, 0
	ldrsh r3, [r5, r1]
	ldr r0, _0806B04C
	ldrb r0, [r0]
	cmp r3, r0
	bge _0806B054
	movs r2, 0x98
	lsls r2, 2
	adds r0, r4, r2
	ldrb r0, [r0]
	ldrb r1, [r5]
	movs r2, 0x64
	muls r2, r3
	ldr r3, _0806B050
	adds r2, r3
	bl sub_806D90C
	b _0806B114
	.align 2, 0
_0806B048: .4byte 0x00000266
_0806B04C: .4byte 0x03004350
_0806B050: .4byte 0x03004360
_0806B054:
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r4, r0
	b _0806B0E0
_0806B060:
	bl sub_806DA98
	b _0806B0D8
_0806B066:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_806DC34
	movs r2, 0x99
	lsls r2, 2
	adds r1, r4, r2
	b _0806B0E0
_0806B07A:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	ldr r2, _0806B0A0
	adds r5, r4, r2
	ldrb r1, [r5]
	bl sub_806BD58
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B114
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r4, r0
	b _0806B0E0
	.align 2, 0
_0806B0A0: .4byte 0x00000266
_0806B0A4:
	bl sub_806E334
	b _0806B0D8
_0806B0AA:
	bl sub_806E0C4
	ldr r1, _0806B0B8
	movs r0, 0x99
	lsls r0, 2
	adds r1, r0
	b _0806B0E0
	.align 2, 0
_0806B0B8: .4byte 0x0201b000
_0806B0BC:
	bl sub_806E53C
	b _0806B0D8
_0806B0C2:
	bl nullsub_13
	ldr r1, _0806B0D0
	movs r0, 0x99
	lsls r0, 2
	adds r1, r0
	b _0806B0E0
	.align 2, 0
_0806B0D0: .4byte 0x0201b000
_0806B0D4:
	bl sub_806E6C8
_0806B0D8:
	ldr r1, _0806B0E8
	movs r2, 0x99
	lsls r2, 2
	adds r1, r2
_0806B0E0:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0806B11A
	.align 2, 0
_0806B0E8: .4byte 0x0201b000
_0806B0EC:
	ldr r0, _0806B110
	adds r5, r4, r0
	ldrb r0, [r5]
	bl sub_806B58C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B114
	movs r1, 0
	strh r1, [r5]
	movs r2, 0x99
	lsls r2, 2
	adds r0, r4, r2
	strh r1, [r0]
	movs r0, 0x1
	b _0806B11C
	.align 2, 0
_0806B110: .4byte 0x00000266
_0806B114:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_0806B11A:
	movs r0, 0
_0806B11C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806AFD0

	thumb_func_start sub_806B124
sub_806B124: @ 806B124
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	ldr r0, _0806B144
	ldr r1, _0806B148
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x11
	bls _0806B13A
	b _0806B450
_0806B13A:
	lsls r0, 2
	ldr r1, _0806B14C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806B144: .4byte 0x03001770
_0806B148: .4byte 0x0000043c
_0806B14C: .4byte _0806B150
	.align 2, 0
_0806B150:
	.4byte _0806B198
	.4byte _0806B240
	.4byte _0806B246
	.4byte _0806B27C
	.4byte _0806B282
	.4byte _0806B2AC
	.4byte _0806B2B2
	.4byte _0806B2D0
	.4byte _0806B2EC
	.4byte _0806B318
	.4byte _0806B344
	.4byte _0806B37C
	.4byte _0806B382
	.4byte _0806B3C0
	.4byte _0806B3CC
	.4byte _0806B3E4
	.4byte _0806B40C
	.4byte _0806B440
_0806B198:
	movs r0, 0
	bl SetVBlankCallback
	movs r3, 0xC0
	lsls r3, 19
	movs r4, 0xC0
	lsls r4, 9
	add r2, sp, 0x8
	mov r8, r2
	add r2, sp, 0x4
	movs r6, 0
	ldr r1, _0806B22C
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _0806B230
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_0806B1BC:
	strh r6, [r2]
	add r0, sp, 0x4
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _0806B1BC
	strh r6, [r2]
	add r2, sp, 0x4
	str r2, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r4, 1
	mov r3, r12
	orrs r0, r3
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0xE0
	lsls r0, 19
	movs r3, 0x80
	lsls r3, 3
	movs r4, 0
	str r4, [sp, 0x8]
	ldr r2, _0806B22C
	mov r1, r8
	str r1, [r2]
	str r0, [r2, 0x4]
	lsrs r0, r3, 2
	movs r1, 0x85
	lsls r1, 24
	orrs r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r1, 0xA0
	lsls r1, 19
	add r0, sp, 0x4
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	lsrs r3, 1
	movs r0, 0x81
	lsls r0, 24
	orrs r3, r0
	str r3, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r2, _0806B234
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r1, _0806B238
	ldr r2, _0806B23C
	adds r1, r2
	b _0806B42C
	.align 2, 0
_0806B22C: .4byte 0x040000d4
_0806B230: .4byte 0x81000800
_0806B234: .4byte 0x0202f388
_0806B238: .4byte 0x03001770
_0806B23C: .4byte 0x0000043c
_0806B240:
	bl remove_some_task
	b _0806B426
_0806B246:
	bl sub_806B4A8
	ldr r1, _0806B26C
	movs r2, 0x99
	lsls r2, 2
	adds r0, r1, r2
	movs r2, 0
	strh r2, [r0]
	ldr r3, _0806B270
	adds r0, r1, r3
	strh r2, [r0]
	movs r0, 0x9A
	lsls r0, 2
	adds r1, r0
	strh r2, [r1]
	ldr r1, _0806B274
	ldr r2, _0806B278
	adds r1, r2
	b _0806B42C
	.align 2, 0
_0806B26C: .4byte 0x0201b000
_0806B270: .4byte 0x00000266
_0806B274: .4byte 0x03001770
_0806B278: .4byte 0x0000043c
_0806B27C:
	bl ResetSpriteData
	b _0806B426
_0806B282:
	ldr r0, _0806B2A0
	movs r1, 0x96
	lsls r1, 2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0806B298
	cmp r0, 0x5
	beq _0806B298
	bl ResetTasks
_0806B298:
	ldr r1, _0806B2A4
	ldr r2, _0806B2A8
	adds r1, r2
	b _0806B42C
	.align 2, 0
_0806B2A0: .4byte 0x0201b000
_0806B2A4: .4byte 0x03001770
_0806B2A8: .4byte 0x0000043c
_0806B2AC:
	bl FreeAllSpritePalettes
	b _0806B426
_0806B2B2:
	ldr r4, _0806B2CC
	movs r1, 0x97
	lsls r1, 2
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0
	bl CreateTask
	movs r2, 0x98
	lsls r2, 2
	adds r1, r4, r2
	strb r0, [r1]
	b _0806B426
	.align 2, 0
_0806B2CC: .4byte 0x0201b000
_0806B2D0:
	ldr r0, _0806B2E0
	bl SetUpWindowConfig
	ldr r1, _0806B2E4
	ldr r0, _0806B2E8
	adds r1, r0
	b _0806B42C
	.align 2, 0
_0806B2E0: .4byte gWindowConfig_81E6C90
_0806B2E4: .4byte 0x03001770
_0806B2E8: .4byte 0x0000043c
_0806B2EC:
	ldr r4, _0806B308
	ldr r1, _0806B30C
	adds r0, r4, 0
	bl InitWindowFromConfig
	adds r0, r4, 0
	movs r1, 0x1
	bl MultistepInitWindowTileData
	ldr r1, _0806B310
	ldr r2, _0806B314
	adds r1, r2
	b _0806B42C
	.align 2, 0
_0806B308: .4byte 0x03004210
_0806B30C: .4byte gWindowConfig_81E6C90
_0806B310: .4byte 0x03001770
_0806B314: .4byte 0x0000043c
_0806B318:
	bl MultistepLoadFont
	cmp r0, 0
	bne _0806B322
	b _0806B450
_0806B322:
	ldr r0, _0806B338
	movs r3, 0x99
	lsls r3, 2
	adds r0, r3
	movs r1, 0x1
	strh r1, [r0]
	ldr r1, _0806B33C
	ldr r0, _0806B340
	adds r1, r0
	b _0806B42C
	.align 2, 0
_0806B338: .4byte 0x0201b000
_0806B33C: .4byte 0x03001770
_0806B340: .4byte 0x0000043c
_0806B344:
	ldr r0, _0806B368
	movs r1, 0x99
	lsls r1, 2
	adds r4, r0, r1
	ldrb r0, [r4]
	bl sub_806D718
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B374
	movs r0, 0
	strh r0, [r4]
	ldr r1, _0806B36C
	ldr r2, _0806B370
	adds r1, r2
	b _0806B42C
	.align 2, 0
_0806B368: .4byte 0x0201b000
_0806B36C: .4byte 0x03001770
_0806B370: .4byte 0x0000043c
_0806B374:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0806B450
_0806B37C:
	bl sub_809D51C
	b _0806B426
_0806B382:
	ldr r2, _0806B3B0
	ldr r0, _0806B3B4
	movs r1, 0x96
	lsls r1, 2
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r2, 0x4
	adds r0, r2
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B450
	ldr r1, _0806B3B8
	ldr r2, _0806B3BC
	adds r1, r2
	b _0806B42C
	.align 2, 0
_0806B3B0: .4byte gUnknown_08376C74
_0806B3B4: .4byte 0x0201b000
_0806B3B8: .4byte 0x03001770
_0806B3BC: .4byte 0x0000043c
_0806B3C0:
	ldr r0, _0806B3C8
	bl MultistepInitMenuWindowBegin
	b _0806B426
	.align 2, 0
_0806B3C8: .4byte gWindowConfig_81E6CC8
_0806B3CC:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	beq _0806B450
	ldr r1, _0806B3DC
	ldr r0, _0806B3E0
	adds r1, r0
	b _0806B42C
	.align 2, 0
_0806B3DC: .4byte 0x03001770
_0806B3E0: .4byte 0x0000043c
_0806B3E4:
	ldr r0, _0806B3FC
	ldr r1, _0806B400
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl sub_806D538
	ldr r1, _0806B404
	ldr r2, _0806B408
	adds r1, r2
	b _0806B42C
	.align 2, 0
_0806B3FC: .4byte 0x0201b000
_0806B400: .4byte 0x00000259
_0806B404: .4byte 0x03001770
_0806B408: .4byte 0x0000043c
_0806B40C:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _0806B434
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
_0806B426:
	ldr r1, _0806B438
	ldr r3, _0806B43C
	adds r1, r3
_0806B42C:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0806B450
	.align 2, 0
_0806B434: .4byte 0x0202f388
_0806B438: .4byte 0x03001770
_0806B43C: .4byte 0x0000043c
_0806B440:
	ldr r0, _0806B44C
	bl SetVBlankCallback
	movs r0, 0x1
	b _0806B452
	.align 2, 0
_0806B44C: .4byte sub_806AF34
_0806B450:
	movs r0, 0
_0806B452:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_806B124

	thumb_func_start sub_806B460
sub_806B460: @ 806B460
	push {lr}
	b _0806B470
_0806B464:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806B49C
_0806B470:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B464
	ldr r1, _0806B4A0
	movs r2, 0x96
	lsls r2, 2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x5
	beq _0806B496
	adds r2, 0x8
	adds r0, r1, r2
	ldrb r0, [r0]
	movs r1, 0
	bl sub_806BF74
_0806B496:
	ldr r0, _0806B4A4
	bl SetMainCallback2
_0806B49C:
	pop {r0}
	bx r0
	.align 2, 0
_0806B4A0: .4byte 0x0201b000
_0806B4A4: .4byte sub_806AEDC
	thumb_func_end sub_806B460

	thumb_func_start sub_806B4A8
sub_806B4A8: @ 806B4A8
	push {lr}
	movs r0, 0
	bl SetHBlankCallback
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x8
	ldr r2, _0806B50C
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0806B510
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0806B514
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0806B518
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0806B51C
	movs r1, 0
	strh r1, [r0]
	subs r0, 0x40
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r2, _0806B520
	strh r1, [r2]
	ldr r1, _0806B524
	adds r0, r1, 0
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0806B50C: .4byte 0x00001e05
_0806B510: .4byte 0x00000703
_0806B514: .4byte 0x00000f08
_0806B518: .4byte 0x00000602
_0806B51C: .4byte REG_BLDCNT
_0806B520: .4byte REG_BG3VOFS
_0806B524: .4byte 0x0000ffff
	thumb_func_end sub_806B4A8

	thumb_func_start sub_806B528
sub_806B528: @ 806B528
	push {lr}
	ldr r0, _0806B53C
	ldrh r1, [r0]
	movs r0, 0x4B
	ands r0, r1
	cmp r0, 0x4B
	beq _0806B540
	movs r0, 0
	b _0806B542
	.align 2, 0
_0806B53C: .4byte 0x020239f8
_0806B540:
	movs r0, 0x1
_0806B542:
	pop {r1}
	bx r1
	thumb_func_end sub_806B528

	thumb_func_start sub_806B548
sub_806B548: @ 806B548
	push {r4,lr}
	ldr r0, _0806B574
	ldr r1, _0806B578
	adds r4, r0, r1
	ldrb r3, [r4]
	cmp r3, 0
	beq _0806B56E
	ldr r1, _0806B57C
	ldr r2, _0806B580
	ldr r0, _0806B584
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0806B588
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	cmp r3, 0x2
	bne _0806B56E
	movs r0, 0
	strb r0, [r4]
_0806B56E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806B574: .4byte 0x0201b000
_0806B578: .4byte 0x00000261
_0806B57C: .4byte 0x020221cc
_0806B580: .4byte 0x06003000
_0806B584: .4byte 0x040000d4
_0806B588: .4byte 0x80000400
	thumb_func_end sub_806B548

	thumb_func_start sub_806B58C
sub_806B58C: @ 806B58C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl battle_type_is_double
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _0806B5A8
	ldr r0, _0806B5A4
	strb r2, [r0]
	b _0806B5C8
	.align 2, 0
_0806B5A4: .4byte 0x0202e8fa
_0806B5A8:
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B5C0
	ldr r1, _0806B5BC
	movs r0, 0x2
	b _0806B5C4
	.align 2, 0
_0806B5BC: .4byte 0x0202e8fa
_0806B5C0:
	ldr r1, _0806B5E4
	movs r0, 0x1
_0806B5C4:
	strb r0, [r1]
	adds r0, r1, 0
_0806B5C8:
	ldrb r0, [r0]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r0, _0806B5E8
	adds r4, r1, r0
	cmp r5, 0x8
	bls _0806B5DA
	b _0806B900
_0806B5DA:
	lsls r0, r5, 2
	ldr r1, _0806B5EC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806B5E4: .4byte 0x0202e8fa
_0806B5E8: .4byte gUnknown_083769A8
_0806B5EC: .4byte _0806B5F0
	.align 2, 0
_0806B5F0:
	.4byte _0806B614
	.4byte _0806B628
	.4byte _0806B638
	.4byte _0806B694
	.4byte _0806B71A
	.4byte _0806B7A2
	.4byte _0806B832
	.4byte _0806B8C6
	.4byte _0806B8E8
_0806B614:
	ldr r0, _0806B624
	movs r2, 0x80
	lsls r2, 4
	movs r1, 0
	bl memset
	b _0806B900
	.align 2, 0
_0806B624: .4byte 0x020221cc
_0806B628:
	ldrb r0, [r4]
	ldrb r1, [r4, 0x1]
	movs r2, 0x3
	bl sub_806B9A4
	adds r0, r4, 0
	movs r1, 0
	b _0806B8A8
_0806B638:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _0806B666
	ldr r0, _0806B65C
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _0806B660
	ldrb r0, [r4, 0x2]
	ldrb r1, [r4, 0x3]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0x2
	movs r1, 0x1
	b _0806B8A8
	.align 2, 0
_0806B65C: .4byte 0x03004350
_0806B660:
	ldrb r0, [r4, 0x2]
	ldrb r1, [r4, 0x3]
	b _0806B8BC
_0806B666:
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B684
	ldrb r0, [r4, 0x2]
	ldrb r1, [r4, 0x3]
	movs r2, 0x4
	bl sub_806B9A4
	adds r0, r4, 0x2
	movs r1, 0x1
	movs r2, 0x4
	b _0806B8AA
_0806B684:
	ldrb r0, [r4, 0x2]
	ldrb r1, [r4, 0x3]
	movs r2, 0x3
	bl sub_806B9A4
	adds r0, r4, 0x2
	movs r1, 0x1
	b _0806B8A8
_0806B694:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _0806B6C2
	ldr r0, _0806B6B8
	ldrb r0, [r0]
	cmp r0, 0x2
	bls _0806B6BC
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0x4
	movs r1, 0x2
	b _0806B8A8
	.align 2, 0
_0806B6B8: .4byte 0x03004350
_0806B6BC:
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	b _0806B8BC
_0806B6C2:
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B6F6
	ldr r0, _0806B6EC
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806B6F0
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0x4
	movs r1, 0x2
	b _0806B8A8
	.align 2, 0
_0806B6EC: .4byte 0x03004428
_0806B6F0:
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	b _0806B8BC
_0806B6F6:
	ldr r0, _0806B710
	ldrb r0, [r0]
	cmp r0, 0x2
	bls _0806B714
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0x4
	movs r1, 0x2
	b _0806B8A8
	.align 2, 0
_0806B710: .4byte 0x03004350
_0806B714:
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	b _0806B8BC
_0806B71A:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _0806B74A
	ldr r0, _0806B740
	ldrb r0, [r0]
	cmp r0, 0x3
	bls _0806B744
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0x6
	movs r1, 0x3
	b _0806B8A8
	.align 2, 0
_0806B740: .4byte 0x03004350
_0806B744:
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	b _0806B8BC
_0806B74A:
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B77E
	ldr r0, _0806B774
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806B778
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0x6
	movs r1, 0x3
	b _0806B8A8
	.align 2, 0
_0806B774: .4byte 0x0300448c
_0806B778:
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	b _0806B8BC
_0806B77E:
	ldr r0, _0806B798
	ldrb r0, [r0]
	cmp r0, 0x3
	bls _0806B79C
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0x6
	movs r1, 0x3
	b _0806B8A8
	.align 2, 0
_0806B798: .4byte 0x03004350
_0806B79C:
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	b _0806B8BC
_0806B7A2:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _0806B7D2
	ldr r0, _0806B7C8
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _0806B7CC
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0
	adds r0, 0x8
	movs r1, 0x4
	b _0806B8A8
	.align 2, 0
_0806B7C8: .4byte 0x03004350
_0806B7CC:
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	b _0806B8BC
_0806B7D2:
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B80A
	ldr r0, _0806B800
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806B804
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	movs r2, 0
	movs r3, 0x4
	bl sub_806BA94
	adds r0, r4, 0
	adds r0, 0x8
	movs r1, 0x4
	movs r2, 0x4
	b _0806B8AA
	.align 2, 0
_0806B800: .4byte 0x030044f0
_0806B804:
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	b _0806B884
_0806B80A:
	ldr r0, _0806B828
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _0806B82C
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0
	adds r0, 0x8
	movs r1, 0x4
	b _0806B8A8
	.align 2, 0
_0806B828: .4byte 0x03004350
_0806B82C:
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	b _0806B8BC
_0806B832:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _0806B84C
	ldr r0, _0806B848
	ldrb r0, [r0]
	cmp r0, 0x5
	bhi _0806B896
	b _0806B8B8
	.align 2, 0
_0806B848: .4byte 0x03004350
_0806B84C:
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B88E
	ldr r0, _0806B87C
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806B880
	ldrb r0, [r4, 0xA]
	ldrb r1, [r4, 0xB]
	movs r2, 0
	movs r3, 0x4
	bl sub_806BA94
	adds r0, r4, 0
	adds r0, 0xA
	movs r1, 0x5
	movs r2, 0x4
	b _0806B8AA
	.align 2, 0
_0806B87C: .4byte 0x03004554
_0806B880:
	ldrb r0, [r4, 0xA]
	ldrb r1, [r4, 0xB]
_0806B884:
	movs r2, 0x1
	movs r3, 0x4
	bl sub_806BA94
	b _0806B900
_0806B88E:
	ldr r0, _0806B8B4
	ldrb r0, [r0]
	cmp r0, 0x5
	bls _0806B8B8
_0806B896:
	ldrb r0, [r4, 0xA]
	ldrb r1, [r4, 0xB]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0
	adds r0, 0xA
	movs r1, 0x5
_0806B8A8:
	movs r2, 0x3
_0806B8AA:
	movs r3, 0
	bl sub_806BF24
	b _0806B900
	.align 2, 0
_0806B8B4: .4byte 0x03004350
_0806B8B8:
	ldrb r0, [r4, 0xA]
	ldrb r1, [r4, 0xB]
_0806B8BC:
	movs r2, 0x1
	movs r3, 0x3
	bl sub_806BA94
	b _0806B900
_0806B8C6:
	ldr r0, _0806B8E4
	movs r1, 0x96
	lsls r1, 2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _0806B8DA
	movs r0, 0x1
	bl sub_806BB9C
_0806B8DA:
	movs r0, 0x1
	bl sub_806BBEC
	b _0806B900
	.align 2, 0
_0806B8E4: .4byte 0x0201b000
_0806B8E8:
	ldr r0, _0806B8F8
	ldr r1, _0806B8FC
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	movs r0, 0x1
	b _0806B902
	.align 2, 0
_0806B8F8: .4byte 0x0201b000
_0806B8FC: .4byte 0x00000261
_0806B900:
	movs r0, 0
_0806B902:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806B58C

	thumb_func_start sub_806B908
sub_806B908: @ 806B908
	push {r4,r5,lr}
	ldr r0, _0806B948
	movs r2, 0x80
	lsls r2, 4
	movs r1, 0
	bl memset
	ldr r1, _0806B94C
	movs r0, 0x3
	strb r0, [r1]
	ldr r0, _0806B950
	adds r4, r0, 0
	adds r4, 0x24
	ldr r5, _0806B954
	ldrb r0, [r4]
	ldrb r1, [r4, 0x1]
	movs r2, 0x3
	bl sub_806B9A4
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806B958
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	b _0806B964
	.align 2, 0
_0806B948: .4byte 0x020221cc
_0806B94C: .4byte 0x0202e8fa
_0806B950: .4byte gUnknown_083769A8
_0806B954: .4byte 0x030043c4
_0806B958:
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	movs r2, 0x1
	movs r3, 0x3
	bl sub_806BA94
_0806B964:
	adds r0, r5, 0
	adds r0, 0x64
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806B980
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	b _0806B98C
_0806B980:
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	movs r2, 0x1
	movs r3, 0x3
	bl sub_806BA94
_0806B98C:
	ldr r0, _0806B99C
	ldr r1, _0806B9A0
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806B99C: .4byte 0x0201b000
_0806B9A0: .4byte 0x00000261
	thumb_func_end sub_806B908

	thumb_func_start sub_806B9A4
sub_806B9A4: @ 806B9A4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp]
	lsls r1, 21
	lsrs r1, 16
	str r1, [sp, 0x4]
	movs r1, 0
	lsls r0, 16
	mov r8, r0
	asrs r0, 16
	mov r10, r0
	ldr r4, _0806BA2C
	mov r9, r4
_0806B9CA:
	movs r3, 0
	adds r7, r1, 0x1
	mov r0, r10
	cmp r0, 0x1F
	bgt _0806BA12
	mov r4, r8
	asrs r2, r4, 16
	lsls r0, r1, 5
	ldr r4, [sp, 0x4]
	adds r6, r4, r0
	ldr r0, _0806BA30
	mov r12, r0
	ldr r4, [sp]
	lsls r5, r4, 12
	movs r0, 0xB
	adds r4, r1, 0
	muls r4, r0
_0806B9EC:
	adds r0, r2, r3
	cmp r0, 0
	blt _0806BA02
	adds r0, r6, r0
	lsls r0, 1
	add r0, r12
	adds r1, r4, r3
	add r1, r9
	ldrb r1, [r1]
	orrs r1, r5
	strh r1, [r0]
_0806BA02:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xA
	bhi _0806BA12
	adds r0, r2, r3
	cmp r0, 0x1F
	ble _0806B9EC
_0806BA12:
	lsls r0, r7, 24
	lsrs r1, r0, 24
	cmp r1, 0x6
	bls _0806B9CA
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BA2C: .4byte gUnknown_083769D8
_0806BA30: .4byte 0x020221cc
	thumb_func_end sub_806B9A4

	thumb_func_start sub_806BA34
sub_806BA34: @ 806BA34
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r1, 21
	lsrs r1, 16
	mov r8, r1
	movs r1, 0
	lsls r7, r0, 16
	asrs r0, r7, 16
	mov r12, r0
_0806BA48:
	movs r2, 0
	adds r4, r1, 0x1
	mov r5, r12
	cmp r5, 0x1F
	bgt _0806BA7C
	asrs r3, r7, 16
	lsls r0, r1, 5
	mov r5, r8
	adds r1, r5, r0
	ldr r6, _0806BA90
	movs r5, 0
_0806BA5E:
	adds r0, r3, r2
	cmp r0, 0
	blt _0806BA6C
	adds r0, r1, r0
	lsls r0, 1
	adds r0, r6
	strh r5, [r0]
_0806BA6C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xA
	bhi _0806BA7C
	adds r0, r3, r2
	cmp r0, 0x1F
	ble _0806BA5E
_0806BA7C:
	lsls r0, r4, 24
	lsrs r1, r0, 24
	cmp r1, 0x6
	bls _0806BA48
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BA90: .4byte 0x020221cc
	thumb_func_end sub_806BA34

	thumb_func_start sub_806BA94
sub_806BA94: @ 806BA94
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r0, r1, 16
	lsls r2, 24
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp]
	ldr r1, _0806BB30
	mov r9, r1
	cmp r2, 0
	bne _0806BABC
	ldr r1, _0806BB34
	mov r9, r1
_0806BABC:
	lsls r0, 21
	lsrs r0, 16
	str r0, [sp, 0x4]
	movs r1, 0
	lsls r4, 16
	mov r12, r4
	asrs r4, 16
	mov r10, r4
_0806BACC:
	movs r2, 0
	adds r7, r1, 0x1
	mov r0, r10
	cmp r0, 0x1F
	bgt _0806BB16
	mov r4, r12
	asrs r3, r4, 16
	lsls r0, r1, 5
	ldr r4, [sp, 0x4]
	adds r6, r4, r0
	ldr r0, _0806BB38
	mov r8, r0
	ldr r4, [sp]
	lsls r5, r4, 12
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	subs r4, r0, r1
_0806BAF0:
	adds r0, r3, r2
	cmp r0, 0
	blt _0806BB06
	adds r0, r6, r0
	lsls r0, 1
	add r0, r8
	adds r1, r4, r2
	add r1, r9
	ldrb r1, [r1]
	orrs r1, r5
	strh r1, [r0]
_0806BB06:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x12
	bhi _0806BB16
	adds r0, r3, r2
	cmp r0, 0x1F
	ble _0806BAF0
_0806BB16:
	lsls r0, r7, 24
	lsrs r1, r0, 24
	cmp r1, 0x2
	bls _0806BACC
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BB30: .4byte gUnknown_08376A5E
_0806BB34: .4byte gUnknown_08376A25
_0806BB38: .4byte 0x020221cc
	thumb_func_end sub_806BA94

	thumb_func_start sub_806BB3C
sub_806BB3C: @ 806BB3C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r1, 21
	lsrs r1, 16
	mov r8, r1
	movs r1, 0
	lsls r7, r0, 16
	asrs r0, r7, 16
	mov r12, r0
_0806BB50:
	movs r2, 0
	adds r4, r1, 0x1
	mov r5, r12
	cmp r5, 0x1F
	bgt _0806BB84
	asrs r3, r7, 16
	lsls r0, r1, 5
	mov r5, r8
	adds r1, r5, r0
	ldr r6, _0806BB98
	movs r5, 0
_0806BB66:
	adds r0, r3, r2
	cmp r0, 0
	blt _0806BB74
	adds r0, r1, r0
	lsls r0, 1
	adds r0, r6
	strh r5, [r0]
_0806BB74:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x12
	bhi _0806BB84
	adds r0, r3, r2
	cmp r0, 0x1F
	ble _0806BB66
_0806BB84:
	lsls r0, r4, 24
	lsrs r1, r0, 24
	cmp r1, 0x2
	bls _0806BB50
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BB98: .4byte 0x020221cc
	thumb_func_end sub_806BB3C

	thumb_func_start sub_806BB9C
sub_806BB9C: @ 806BB9C
	push {r4,lr}
	sub sp, 0x18
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0806BBE4
	mov r0, sp
	movs r2, 0x18
	bl memcpy
	ldr r3, _0806BBE8
	movs r2, 0
	lsls r4, 12
_0806BBB6:
	lsls r0, r2, 1
	adds r1, r0, r3
	add r0, sp
	ldrh r0, [r0]
	adds r0, r4
	strh r0, [r1]
	adds r1, 0x40
	adds r0, r2, 0x6
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	adds r0, r4
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x5
	bls _0806BBB6
	add sp, 0x18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806BBE4: .4byte gUnknown_08376CD4
_0806BBE8: .4byte 0x06003c30
	thumb_func_end sub_806BB9C

	thumb_func_start sub_806BBEC
sub_806BBEC: @ 806BBEC
	push {r4,lr}
	sub sp, 0x18
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0806BC34
	mov r0, sp
	movs r2, 0x18
	bl memcpy
	ldr r3, _0806BC38
	movs r2, 0
	lsls r4, 12
_0806BC06:
	lsls r0, r2, 1
	adds r1, r0, r3
	add r0, sp
	ldrh r0, [r0]
	adds r0, r4
	strh r0, [r1]
	adds r1, 0x40
	adds r0, r2, 0x6
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	adds r0, r4
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x5
	bls _0806BC06
	add sp, 0x18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806BC34: .4byte gUnknown_08376CEC
_0806BC38: .4byte 0x06003cb0
	thumb_func_end sub_806BBEC

	thumb_func_start sub_806BC3C
sub_806BC3C: @ 806BC3C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _0806BCB0
	bl battle_type_is_double
	lsls r4, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r4, r1
	adds r4, r6
	ldr r7, [r4]
	movs r6, 0
	adds r0, r5, 0
	movs r1, 0x7
	bl __udivsi3
	lsls r0, 24
	lsrs r4, r0, 19
	ldr r5, _0806BCB4
	movs r0, 0x86
	lsls r0, 1
	adds r3, r0, 0
_0806BC7C:
	adds r1, r6, r4
	lsls r2, r6, 1
	adds r2, r7
	lsls r0, r1, 1
	adds r0, r5
	ldrh r0, [r0]
	adds r0, r3, r0
	strh r0, [r2]
	adds r2, 0x40
	adds r1, 0x20
	lsls r1, 1
	adds r1, r5
	ldrh r1, [r1]
	adds r0, r3, r1
	strh r0, [r2]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x6
	bls _0806BC7C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BCB0: .4byte gUnknown_08376918
_0806BCB4: .4byte gUnknown_08E9A300
	thumb_func_end sub_806BC3C

	thumb_func_start unref_sub_806BCB8
unref_sub_806BCB8: @ 806BCB8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _0806BCE4
	ldrb r1, [r0]
	cmp r4, r1
	bcs _0806BCDE
	adds r6, r0, 0
_0806BCCA:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806BC3C
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r6]
	cmp r4, r0
	bcc _0806BCCA
_0806BCDE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806BCE4: .4byte 0x03004350
	thumb_func_end unref_sub_806BCB8

	thumb_func_start sub_806BCE8
sub_806BCE8: @ 806BCE8
	push {r4,r5,lr}
	movs r5, 0
	b _0806BD46
_0806BCEE:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0806BD20
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0806BD38
	adds r0, r4, 0
	bl GetMonGender
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0806BD24
	cmp r0, 0xFE
	beq _0806BD2E
	adds r0, r5, 0
	movs r1, 0x46
	bl sub_806BC3C
	b _0806BD40
	.align 2, 0
_0806BD20: .4byte 0x03004360
_0806BD24:
	adds r0, r5, 0
	movs r1, 0x54
	bl sub_806BC3C
	b _0806BD40
_0806BD2E:
	adds r0, r5, 0
	movs r1, 0x62
	bl sub_806BC3C
	b _0806BD40
_0806BD38:
	adds r0, r5, 0
	movs r1, 0x46
	bl sub_806BC3C
_0806BD40:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0806BD46:
	ldr r0, _0806BD54
	ldrb r0, [r0]
	cmp r5, r0
	bcc _0806BCEE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806BD54: .4byte 0x03004350
	thumb_func_end sub_806BCE8

	thumb_func_start sub_806BD58
sub_806BD58: @ 806BD58
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0806BD7C
	bl object_new_hidden_with_callback
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_806CA18
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806BD7C: .4byte SpriteCallbackDummy
	thumb_func_end sub_806BD58

	thumb_func_start sub_806BD80
sub_806BD80: @ 806BD80
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _0806BD9C
	ldrh r0, [r0, 0x30]
	cmp r0, 0x20
	beq _0806BDB2
	cmp r0, 0x20
	bgt _0806BDA0
	cmp r0, 0x10
	beq _0806BDB6
	b _0806BDB8
	.align 2, 0
_0806BD9C: .4byte 0x03001770
_0806BDA0:
	cmp r0, 0x40
	beq _0806BDAA
	cmp r0, 0x80
	beq _0806BDAE
	b _0806BDB8
_0806BDAA:
	movs r4, 0xFF
	b _0806BDB8
_0806BDAE:
	movs r4, 0x1
	b _0806BDB8
_0806BDB2:
	movs r4, 0xFE
	b _0806BDB8
_0806BDB6:
	movs r4, 0x2
_0806BDB8:
	lsls r0, r4, 24
	cmp r0, 0
	bne _0806BDDC
	bl sub_80F92BC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806BDD0
	cmp r0, 0x2
	beq _0806BDD4
	b _0806BDD6
_0806BDD0:
	movs r4, 0xFF
	b _0806BDD6
_0806BDD4:
	movs r4, 0x1
_0806BDD6:
	lsls r0, r4, 24
	cmp r0, 0
	beq _0806BDF0
_0806BDDC:
	asrs r1, r0, 24
	adds r0, r5, 0
	bl sub_806BF74
	ldr r0, _0806BDEC
	ldrh r0, [r0, 0x30]
	b _0806BE2C
	.align 2, 0
_0806BDEC: .4byte 0x03001770
_0806BDF0:
	ldr r0, _0806BE1C
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806BE24
	ldr r4, _0806BE20
	adds r0, r5, 0
	bl sub_806CA00
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x7
	bne _0806BE24
	movs r0, 0x2
	b _0806BE2C
	.align 2, 0
_0806BE1C: .4byte 0x03001770
_0806BE20: .4byte 0x02020004
_0806BE24:
	ldr r0, _0806BE34
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
_0806BE2C:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806BE34: .4byte 0x03001770
	thumb_func_end sub_806BD80

	thumb_func_start sub_806BE38
sub_806BE38: @ 806BE38
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _0806BE54
	ldrh r1, [r0, 0x30]
	adds r6, r0, 0
	cmp r1, 0x20
	beq _0806BE6A
	cmp r1, 0x20
	bgt _0806BE58
	cmp r1, 0x10
	beq _0806BE6E
	b _0806BE70
	.align 2, 0
_0806BE54: .4byte 0x03001770
_0806BE58:
	cmp r1, 0x40
	beq _0806BE62
	cmp r1, 0x80
	beq _0806BE66
	b _0806BE70
_0806BE62:
	movs r4, 0xFF
	b _0806BE8E
_0806BE66:
	movs r4, 0x1
	b _0806BE8E
_0806BE6A:
	movs r4, 0xFE
	b _0806BE8E
_0806BE6E:
	movs r4, 0x2
_0806BE70:
	cmp r4, 0
	bne _0806BE8E
	bl sub_80F92BC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806BE86
	cmp r0, 0x2
	beq _0806BE8A
	b _0806BE8C
_0806BE86:
	movs r4, 0xFF
	b _0806BE8C
_0806BE8A:
	movs r4, 0x1
_0806BE8C:
	ldr r6, _0806BEA4
_0806BE8E:
	ldrh r2, [r6, 0x2E]
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _0806BEA8
	adds r0, r5, 0
	bl sub_806C890
	movs r0, 0x8
	b _0806BEF0
	.align 2, 0
_0806BEA4: .4byte 0x03001770
_0806BEA8:
	lsls r0, r4, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _0806BEBA
	adds r0, r5, 0
	bl sub_806C658
	ldrh r0, [r6, 0x30]
	b _0806BEF0
_0806BEBA:
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	beq _0806BEE8
	ldr r4, _0806BEE4
	adds r0, r5, 0
	bl sub_806CA00
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x7
	bne _0806BEE8
	movs r0, 0x2
	b _0806BEF0
	.align 2, 0
_0806BEE4: .4byte 0x02020004
_0806BEE8:
	ldr r0, _0806BEF8
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
_0806BEF0:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806BEF8: .4byte 0x03001770
	thumb_func_end sub_806BE38

	thumb_func_start task_pc_turn_off
task_pc_turn_off: @ 806BEFC
	push {lr}
	adds r2, r0, 0
	lsls r1, 24
	lsrs r3, r1, 24
	ldrb r0, [r2]
	cmp r0, 0
	beq _0806BF14
	ldrb r1, [r2, 0x1]
	movs r2, 0
	bl sub_806BA94
	b _0806BF1E
_0806BF14:
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	adds r2, r3, 0
	bl sub_806B9A4
_0806BF1E:
	pop {r0}
	bx r0
	thumb_func_end task_pc_turn_off

	thumb_func_start sub_806BF24
sub_806BF24: @ 806BF24
	push {r4-r7,lr}
	adds r7, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	lsls r3, 24
	lsrs r6, r3, 24
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0806BF70
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806BF56
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _0806BF56
	movs r4, 0x5
_0806BF56:
	cmp r6, 0x1
	bne _0806BF60
	adds r0, r4, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
_0806BF60:
	adds r0, r7, 0
	adds r1, r4, 0
	bl task_pc_turn_off
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BF70: .4byte 0x03004360
	thumb_func_end sub_806BF24

	thumb_func_start sub_806BF74
sub_806BF74: @ 806BF74
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 24
	lsrs r4, r1, 24
	bl sub_806CA00
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0806C0C4
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, r9
	adds r1, r5, 0
	movs r2, 0
	bl sub_806DA44
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806BFB6
	b _0806C0D8
_0806BFB6:
	cmp r5, 0
	beq _0806BFC2
	cmp r5, 0x2
	beq _0806BFC2
	cmp r5, 0x3
	bne _0806BFD2
_0806BFC2:
	lsls r0, r5, 1
	ldr r1, _0806C0C8
	adds r0, r1
	adds r1, r5, 0
	movs r2, 0x3
	movs r3, 0
	bl sub_806BF24
_0806BFD2:
	cmp r5, 0x1
	beq _0806BFDE
	cmp r5, 0x4
	beq _0806BFDE
	cmp r5, 0x5
	bne _0806BFEE
_0806BFDE:
	lsls r0, r5, 1
	ldr r1, _0806C0C8
	adds r0, r1
	adds r1, r5, 0
	movs r2, 0x4
	movs r3, 0
	bl sub_806BF24
_0806BFEE:
	cmp r5, 0x7
	bne _0806BFF8
	movs r0, 0x1
	bl sub_806BBEC
_0806BFF8:
	lsls r2, r4, 24
	asrs r2, 24
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_806C490
	ldr r2, _0806C0C4
	lsls r1, r6, 4
	adds r0, r1, r6
	lsls r0, 2
	adds r0, r2
	movs r2, 0x2E
	ldrsh r0, [r0, r2]
	mov r8, r1
	cmp r0, 0
	beq _0806C020
	cmp r0, 0x2
	beq _0806C020
	cmp r0, 0x3
	bne _0806C042
_0806C020:
	ldr r0, _0806C0C4
	mov r4, r8
	adds r1, r4, r6
	lsls r1, 2
	adds r1, r0
	movs r7, 0x2E
	ldrsh r0, [r1, r7]
	lsls r0, 1
	ldr r2, _0806C0C8
	adds r0, r2
	ldrh r1, [r1, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x3
	movs r3, 0x1
	bl sub_806BF24
_0806C042:
	ldr r1, _0806C0C4
	mov r2, r8
	adds r0, r2, r6
	lsls r0, 2
	adds r0, r1
	movs r4, 0x2E
	ldrsh r0, [r0, r4]
	cmp r0, 0x1
	beq _0806C05C
	cmp r0, 0x4
	beq _0806C05C
	cmp r0, 0x5
	bne _0806C07E
_0806C05C:
	ldr r0, _0806C0C4
	mov r7, r8
	adds r1, r7, r6
	lsls r1, 2
	adds r1, r0
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	lsls r0, 1
	ldr r2, _0806C0C8
	adds r0, r2
	ldrh r1, [r1, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x4
	movs r3, 0x1
	bl sub_806BF24
_0806C07E:
	ldr r7, _0806C0C4
	mov r4, r8
	adds r0, r4, r6
	lsls r0, 2
	adds r4, r0, r7
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	bne _0806C096
	movs r0, 0x2
	bl sub_806BBEC
_0806C096:
	ldr r0, _0806C0CC
	ldr r2, _0806C0D0
	adds r0, r2
	movs r1, 0x2
	strb r1, [r0]
	ldr r1, _0806C0D4
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	adds r0, 0x40
	ldrb r0, [r0]
	strh r0, [r4, 0x20]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	adds r0, 0x41
	ldrb r0, [r0]
	strh r0, [r4, 0x22]
	adds r0, r7, 0
	b _0806C1A4
	.align 2, 0
_0806C0C4: .4byte 0x02020004
_0806C0C8: .4byte gUnknown_083769C0
_0806C0CC: .4byte 0x0201b000
_0806C0D0: .4byte 0x00000261
_0806C0D4: .4byte gUnknown_083768B8
_0806C0D8:
	bl battle_type_is_double
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r5, 0x5
	bhi _0806C104
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 2
	lsls r1, r5, 1
	adds r0, r1
	ldr r1, _0806C100
	adds r0, r1
	adds r1, r5, 0
	movs r2, 0x3
	movs r3, 0
	bl sub_806BF24
	b _0806C10A
	.align 2, 0
_0806C100: .4byte gUnknown_083769A8
_0806C104:
	movs r0, 0x1
	bl sub_806BBEC
_0806C10A:
	cmp r7, 0
	bne _0806C11C
	lsls r2, r4, 24
	asrs r2, 24
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_806C1E4
	b _0806C128
_0806C11C:
	lsls r2, r4, 24
	asrs r2, 24
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_806C310
_0806C128:
	ldr r1, _0806C160
	lsls r2, r6, 4
	adds r0, r2, r6
	lsls r0, 2
	adds r1, r0, r1
	ldrh r3, [r1, 0x2E]
	movs r4, 0x2E
	ldrsh r0, [r1, r4]
	mov r8, r2
	cmp r0, 0x5
	bgt _0806C168
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 2
	movs r2, 0x2E
	ldrsh r1, [r1, r2]
	lsls r1, 1
	adds r0, r1
	ldr r1, _0806C164
	adds r0, r1
	lsls r1, r3, 24
	lsrs r1, 24
	movs r2, 0x3
	movs r3, 0x1
	bl sub_806BF24
	b _0806C16E
	.align 2, 0
_0806C160: .4byte 0x02020004
_0806C164: .4byte gUnknown_083769A8
_0806C168:
	movs r0, 0x2
	bl sub_806BBEC
_0806C16E:
	ldr r0, _0806C1D4
	ldr r4, _0806C1D8
	adds r0, r4
	movs r1, 0x2
	strb r1, [r0]
	ldr r4, _0806C1DC
	mov r0, r8
	adds r1, r0, r6
	lsls r1, 2
	adds r1, r4
	ldr r3, _0806C1E0
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	lsls r0, 2
	lsls r2, r7, 5
	adds r0, r2
	adds r0, r3
	ldrb r0, [r0]
	strh r0, [r1, 0x20]
	movs r7, 0x2E
	ldrsh r0, [r1, r7]
	lsls r0, 2
	adds r0, r2
	adds r0, r3
	ldrb r0, [r0, 0x1]
	strh r0, [r1, 0x22]
	adds r0, r4, 0
_0806C1A4:
	mov r1, r8
	adds r4, r1, r6
	lsls r4, 2
	adds r4, r0
	ldrh r1, [r4, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	mov r0, r9
	movs r2, 0x1
	bl sub_806DA44
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r5, r0
	beq _0806C1C8
	movs r0, 0x5
	bl audio_play
_0806C1C8:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C1D4: .4byte 0x0201b000
_0806C1D8: .4byte 0x00000261
_0806C1DC: .4byte 0x02020004
_0806C1E0: .4byte gUnknown_083768B8
	thumb_func_end sub_806BF74

	thumb_func_start sub_806C1E4
sub_806C1E4: @ 806C1E4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	movs r0, 0x80
	lsls r0, 18
	adds r2, r0
	asrs r0, r2, 24
	cmp r0, 0x4
	bls _0806C200
	b _0806C306
_0806C200:
	lsls r0, 2
	ldr r1, _0806C20C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806C20C: .4byte _0806C210
	.align 2, 0
_0806C210:
	.4byte _0806C2EC
	.4byte _0806C238
	.4byte _0806C224
	.4byte _0806C25C
	.4byte _0806C2BC
_0806C224:
	ldr r0, _0806C234
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x30]
	b _0806C306
	.align 2, 0
_0806C234: .4byte 0x02020004
_0806C238:
	cmp r3, 0
	beq _0806C266
	cmp r3, 0x7
	bne _0806C298
	ldr r2, _0806C254
	lsls r3, r4, 4
	adds r1, r3, r4
	lsls r1, 2
	adds r1, r2
	ldr r0, _0806C258
	ldrb r0, [r0]
	subs r0, 0x1
	b _0806C2AA
	.align 2, 0
_0806C254: .4byte 0x02020004
_0806C258: .4byte 0x03004350
_0806C25C:
	ldr r0, _0806C278
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r3, r0
	bne _0806C280
_0806C266:
	ldr r2, _0806C27C
	lsls r3, r4, 4
	adds r0, r3, r4
	lsls r0, 2
	adds r0, r2
	movs r1, 0x7
	strh r1, [r0, 0x2E]
	b _0806C2AC
	.align 2, 0
_0806C278: .4byte 0x03004350
_0806C27C: .4byte 0x02020004
_0806C280:
	cmp r3, 0x7
	bne _0806C298
	ldr r2, _0806C294
	lsls r3, r4, 4
	adds r0, r3, r4
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x2E]
	b _0806C2AC
	.align 2, 0
_0806C294: .4byte 0x02020004
_0806C298:
	ldr r2, _0806C2B8
	lsls r3, r4, 4
	adds r1, r3, r4
	lsls r1, 2
	adds r1, r2
	lsls r0, r5, 24
	asrs r0, 24
	ldrh r5, [r1, 0x2E]
	adds r0, r5
_0806C2AA:
	strh r0, [r1, 0x2E]
_0806C2AC:
	adds r0, r3, r4
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x30]
	b _0806C306
	.align 2, 0
_0806C2B8: .4byte 0x02020004
_0806C2BC:
	ldr r0, _0806C2E4
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _0806C306
	cmp r3, 0
	bne _0806C306
	ldr r0, _0806C2E8
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r2, 0x30
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0806C2DE
	movs r0, 0x1
	strh r0, [r1, 0x30]
_0806C2DE:
	ldrh r0, [r1, 0x30]
	strh r0, [r1, 0x2E]
	b _0806C306
	.align 2, 0
_0806C2E4: .4byte 0x03004350
_0806C2E8: .4byte 0x02020004
_0806C2EC:
	subs r0, r3, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _0806C306
	ldr r0, _0806C30C
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x2E]
	strh r3, [r1, 0x30]
_0806C306:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806C30C: .4byte 0x02020004
	thumb_func_end sub_806C1E4

	thumb_func_start sub_806C310
sub_806C310: @ 806C310
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	movs r0, 0x80
	lsls r0, 18
	adds r2, r0
	asrs r0, r2, 24
	cmp r0, 0x4
	bls _0806C32C
	b _0806C486
_0806C32C:
	lsls r0, 2
	ldr r1, _0806C338
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806C338: .4byte _0806C33C
	.align 2, 0
_0806C33C:
	.4byte _0806C44E
	.4byte _0806C38C
	.4byte _0806C350
	.4byte _0806C364
	.4byte _0806C3E8
_0806C350:
	ldr r0, _0806C360
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x30]
	b _0806C486
	.align 2, 0
_0806C360: .4byte 0x02020004
_0806C364:
	cmp r3, 0x7
	bne _0806C37C
	ldr r2, _0806C378
	lsls r3, r4, 4
	adds r0, r3, r4
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x2E]
	b _0806C3D8
	.align 2, 0
_0806C378: .4byte 0x02020004
_0806C37C:
	ldr r0, _0806C388
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r3, r0
	beq _0806C390
	b _0806C3C4
	.align 2, 0
_0806C388: .4byte 0x03004350
_0806C38C:
	cmp r3, 0
	bne _0806C3A4
_0806C390:
	ldr r2, _0806C3A0
	lsls r3, r4, 4
	adds r0, r3, r4
	lsls r0, 2
	adds r0, r2
	movs r1, 0x7
	strh r1, [r0, 0x2E]
	b _0806C3D8
	.align 2, 0
_0806C3A0: .4byte 0x02020004
_0806C3A4:
	cmp r3, 0x7
	bne _0806C3C4
	ldr r2, _0806C3BC
	lsls r3, r4, 4
	adds r1, r3, r4
	lsls r1, 2
	adds r1, r2
	ldr r0, _0806C3C0
	ldrb r0, [r0]
	subs r0, 0x1
	b _0806C3D6
	.align 2, 0
_0806C3BC: .4byte 0x02020004
_0806C3C0: .4byte 0x03004350
_0806C3C4:
	ldr r2, _0806C3E4
	lsls r3, r4, 4
	adds r1, r3, r4
	lsls r1, 2
	adds r1, r2
	lsls r0, r5, 24
	asrs r0, 24
	ldrh r5, [r1, 0x2E]
	adds r0, r5
_0806C3D6:
	strh r0, [r1, 0x2E]
_0806C3D8:
	adds r0, r3, r4
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x30]
	b _0806C486
	.align 2, 0
_0806C3E4: .4byte 0x02020004
_0806C3E8:
	cmp r3, 0
	bne _0806C418
	ldr r0, _0806C410
	ldrb r0, [r0]
	cmp r0, 0x2
	bls _0806C486
	ldr r0, _0806C414
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrh r2, [r1, 0x30]
	subs r0, r2, 0x2
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _0806C43A
	movs r0, 0x2
	strh r0, [r1, 0x2E]
	b _0806C486
	.align 2, 0
_0806C410: .4byte 0x03004350
_0806C414: .4byte 0x02020004
_0806C418:
	cmp r3, 0x1
	bne _0806C486
	ldr r0, _0806C440
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _0806C486
	ldr r0, _0806C444
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrh r2, [r1, 0x30]
	subs r0, r2, 0x4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _0806C448
_0806C43A:
	strh r2, [r1, 0x2E]
	b _0806C486
	.align 2, 0
_0806C440: .4byte 0x03004350
_0806C444: .4byte 0x02020004
_0806C448:
	movs r0, 0x4
	strh r0, [r1, 0x2E]
	b _0806C486
_0806C44E:
	subs r0, r3, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0806C46C
	ldr r0, _0806C468
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	b _0806C482
	.align 2, 0
_0806C468: .4byte 0x02020004
_0806C46C:
	subs r0, r3, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0806C486
	ldr r0, _0806C48C
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r0, 0x1
_0806C482:
	strh r0, [r1, 0x2E]
	strh r3, [r1, 0x30]
_0806C486:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806C48C: .4byte 0x02020004
	thumb_func_end sub_806C310

	thumb_func_start sub_806C490
sub_806C490: @ 806C490
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r2, 24
	movs r0, 0x80
	lsls r0, 18
	adds r2, r0
	asrs r0, r2, 24
	cmp r0, 0x4
	bls _0806C4AA
	b _0806C64E
_0806C4AA:
	lsls r0, 2
	ldr r1, _0806C4B4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806C4B4: .4byte _0806C4B8
	.align 2, 0
_0806C4B8:
	.4byte _0806C618
	.4byte _0806C524
	.4byte _0806C4CC
	.4byte _0806C4E0
	.4byte _0806C57C
_0806C4CC:
	ldr r0, _0806C4DC
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x30]
	b _0806C64E
	.align 2, 0
_0806C4DC: .4byte 0x02020004
_0806C4E0:
	cmp r4, 0x7
	bne _0806C4FC
	ldr r2, _0806C4F8
	lsls r3, r5, 4
	adds r0, r3, r5
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x2E]
	adds r1, r2, 0
	adds r6, r3, 0
	b _0806C566
	.align 2, 0
_0806C4F8: .4byte 0x02020004
_0806C4FC:
	lsls r6, r5, 4
	b _0806C518
_0806C500:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x64
	muls r0, r4
	ldr r1, _0806C520
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	bne _0806C528
_0806C518:
	cmp r4, 0x5
	bne _0806C500
	b _0806C558
	.align 2, 0
_0806C520: .4byte 0x03004360
_0806C524:
	lsls r6, r5, 4
	b _0806C554
_0806C528:
	ldr r1, _0806C534
	adds r0, r6, r5
	lsls r0, 2
	adds r0, r1
	strh r4, [r0, 0x2E]
	b _0806C566
	.align 2, 0
_0806C534: .4byte 0x02020004
_0806C538:
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x6
	beq _0806C554
	movs r0, 0x64
	muls r0, r4
	ldr r1, _0806C574
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	bne _0806C528
_0806C554:
	cmp r4, 0
	bne _0806C538
_0806C558:
	ldr r0, _0806C578
	adds r1, r6, r5
	lsls r1, 2
	adds r1, r0
	movs r2, 0x7
	strh r2, [r1, 0x2E]
	adds r1, r0, 0
_0806C566:
	adds r0, r6, r5
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x30]
	b _0806C64E
	.align 2, 0
_0806C574: .4byte 0x03004360
_0806C578: .4byte 0x02020004
_0806C57C:
	cmp r4, 0
	bne _0806C5C8
	ldr r0, _0806C5AC
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r4, r1, r0
	ldrh r1, [r4, 0x30]
	subs r0, r1, 0x2
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _0806C5E2
	ldr r5, _0806C5B0
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806C5B4
	movs r0, 0x2
	strh r0, [r4, 0x2E]
	b _0806C64E
	.align 2, 0
_0806C5AC: .4byte 0x02020004
_0806C5B0: .4byte 0x03004428
_0806C5B4:
	adds r0, r5, 0
	adds r0, 0x64
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806C64E
	movs r0, 0x3
	strh r0, [r4, 0x2E]
	b _0806C64E
_0806C5C8:
	cmp r4, 0x1
	bne _0806C64E
	ldr r0, _0806C5E8
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r4, r1, r0
	ldrh r1, [r4, 0x30]
	subs r0, r1, 0x4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _0806C5EC
_0806C5E2:
	strh r1, [r4, 0x2E]
	b _0806C64E
	.align 2, 0
_0806C5E8: .4byte 0x02020004
_0806C5EC:
	ldr r5, _0806C600
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806C604
	movs r0, 0x4
	strh r0, [r4, 0x2E]
	b _0806C64E
	.align 2, 0
_0806C600: .4byte 0x030044f0
_0806C604:
	adds r0, r5, 0
	adds r0, 0x64
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806C64E
	movs r0, 0x5
	strh r0, [r4, 0x2E]
	b _0806C64E
_0806C618:
	subs r0, r4, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0806C634
	ldr r0, _0806C630
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	b _0806C64A
	.align 2, 0
_0806C630: .4byte 0x02020004
_0806C634:
	subs r0, r4, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0806C64E
	ldr r0, _0806C654
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	movs r0, 0x1
_0806C64A:
	strh r0, [r1, 0x2E]
	strh r4, [r1, 0x30]
_0806C64E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806C654: .4byte 0x02020004
	thumb_func_end sub_806C490

	thumb_func_start sub_806C658
sub_806C658: @ 806C658
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r4, r1, 24
	bl sub_806CA00
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0806C6A0
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r6, r0, 24
	mov r0, r8
	adds r1, r6, 0
	movs r2, 0
	bl sub_806DA44
	cmp r6, 0x5
	bhi _0806C6A8
	lsls r0, r6, 1
	ldr r1, _0806C6A4
	adds r0, r1
	adds r1, r6, 0
	movs r2, 0x3
	movs r3, 0
	bl sub_806BF24
	b _0806C6BA
	.align 2, 0
_0806C6A0: .4byte 0x02020004
_0806C6A4: .4byte gUnknown_083769A8
_0806C6A8:
	cmp r6, 0x6
	bne _0806C6B4
	movs r0, 0x1
	bl sub_806BB9C
	b _0806C6BA
_0806C6B4:
	movs r0, 0x1
	bl sub_806BBEC
_0806C6BA:
	lsls r1, r4, 24
	movs r2, 0x80
	lsls r2, 18
	adds r0, r1, r2
	asrs r0, 24
	lsls r4, r5, 4
	adds r7, r1, 0
	cmp r0, 0x4
	bls _0806C6CE
	b _0806C7EA
_0806C6CE:
	lsls r0, 2
	ldr r1, _0806C6D8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806C6D8: .4byte _0806C6DC
	.align 2, 0
_0806C6DC:
	.4byte _0806C7D0
	.4byte _0806C708
	.4byte _0806C6F0
	.4byte _0806C740
	.4byte _0806C7A0
_0806C6F0:
	ldr r1, _0806C704
	lsls r2, r5, 4
	adds r0, r2, r5
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x30]
	adds r4, r2, 0
	b _0806C7EA
	.align 2, 0
_0806C704: .4byte 0x02020004
_0806C708:
	cmp r6, 0
	bne _0806C720
	ldr r2, _0806C71C
	lsls r3, r5, 4
	adds r0, r3, r5
	lsls r0, 2
	adds r0, r2
	movs r1, 0x7
	strh r1, [r0, 0x2E]
	b _0806C78E
	.align 2, 0
_0806C71C: .4byte 0x02020004
_0806C720:
	cmp r6, 0x6
	bne _0806C77C
	ldr r2, _0806C738
	lsls r3, r5, 4
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r2
	ldr r0, _0806C73C
	ldrb r0, [r0]
	subs r0, 0x1
	b _0806C78C
	.align 2, 0
_0806C738: .4byte 0x02020004
_0806C73C: .4byte 0x03004350
_0806C740:
	ldr r0, _0806C75C
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r6, r0
	bne _0806C764
	ldr r2, _0806C760
	lsls r3, r5, 4
	adds r0, r3, r5
	lsls r0, 2
	adds r0, r2
	movs r1, 0x6
	strh r1, [r0, 0x2E]
	b _0806C78E
	.align 2, 0
_0806C75C: .4byte 0x03004350
_0806C760: .4byte 0x02020004
_0806C764:
	cmp r6, 0x7
	bne _0806C77C
	ldr r2, _0806C778
	lsls r3, r5, 4
	adds r0, r3, r5
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x2E]
	b _0806C78E
	.align 2, 0
_0806C778: .4byte 0x02020004
_0806C77C:
	ldr r2, _0806C79C
	lsls r3, r5, 4
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r2
	asrs r0, r7, 24
	ldrh r4, [r1, 0x2E]
	adds r0, r4
_0806C78C:
	strh r0, [r1, 0x2E]
_0806C78E:
	adds r4, r3, 0
	adds r0, r4, r5
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x30]
	b _0806C7EA
	.align 2, 0
_0806C79C: .4byte 0x02020004
_0806C7A0:
	ldr r0, _0806C7C8
	ldrb r0, [r0]
	lsls r4, r5, 4
	cmp r0, 0x1
	bls _0806C7EA
	cmp r6, 0
	bne _0806C7EA
	ldr r0, _0806C7CC
	adds r1, r4, r5
	lsls r1, 2
	adds r1, r0
	movs r2, 0x30
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0806C7C2
	movs r0, 0x1
	strh r0, [r1, 0x30]
_0806C7C2:
	ldrh r0, [r1, 0x30]
	strh r0, [r1, 0x2E]
	b _0806C7EA
	.align 2, 0
_0806C7C8: .4byte 0x03004350
_0806C7CC: .4byte 0x02020004
_0806C7D0:
	subs r0, r6, 0x1
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r5, 4
	cmp r0, 0x4
	bhi _0806C7EA
	ldr r0, _0806C82C
	adds r1, r4, r5
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x2E]
	strh r6, [r1, 0x30]
_0806C7EA:
	ldr r1, _0806C82C
	adds r0, r4, r5
	lsls r0, 2
	adds r2, r0, r1
	ldr r1, _0806C830
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r2, 0x20]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x1]
	strh r0, [r2, 0x22]
	ldrh r3, [r2, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x5
	bgt _0806C838
	lsls r0, 1
	ldr r1, _0806C834
	adds r0, r1
	lsls r1, r3, 24
	lsrs r1, 24
	movs r2, 0x3
	movs r3, 0x1
	bl sub_806BF24
	b _0806C84A
	.align 2, 0
_0806C82C: .4byte 0x02020004
_0806C830: .4byte gUnknown_083768B8
_0806C834: .4byte gUnknown_083769A8
_0806C838:
	cmp r0, 0x6
	bne _0806C844
	movs r0, 0x2
	bl sub_806BB9C
	b _0806C84A
_0806C844:
	movs r0, 0x2
	bl sub_806BBEC
_0806C84A:
	ldr r0, _0806C884
	ldr r2, _0806C888
	adds r0, r2
	movs r1, 0x2
	strb r1, [r0]
	ldr r0, _0806C88C
	adds r4, r5
	lsls r4, 2
	adds r4, r0
	ldrh r1, [r4, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	movs r2, 0x1
	bl sub_806DA44
	movs r3, 0x2E
	ldrsh r0, [r4, r3]
	cmp r6, r0
	beq _0806C878
	movs r0, 0x5
	bl audio_play
_0806C878:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C884: .4byte 0x0201b000
_0806C888: .4byte 0x00000261
_0806C88C: .4byte 0x02020004
	thumb_func_end sub_806C658

	thumb_func_start sub_806C890
sub_806C890: @ 806C890
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r6, 0
	bl sub_806CA00
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0806C8D4
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x6
	beq _0806C914
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0
	bl sub_806DA44
	cmp r4, 0x5
	bhi _0806C8DC
	lsls r0, r4, 1
	ldr r1, _0806C8D8
	adds r0, r1
	adds r1, r4, 0
	movs r2, 0x3
	movs r3, 0
	bl sub_806BF24
	b _0806C8E2
	.align 2, 0
_0806C8D4: .4byte 0x02020004
_0806C8D8: .4byte gUnknown_083769A8
_0806C8DC:
	movs r0, 0x1
	bl sub_806BBEC
_0806C8E2:
	ldr r1, _0806C91C
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x30]
	movs r1, 0x6
	strh r1, [r0, 0x2E]
	ldr r2, _0806C920
	ldrb r1, [r2, 0x18]
	strh r1, [r0, 0x20]
	ldrb r1, [r2, 0x19]
	strh r1, [r0, 0x22]
	movs r0, 0x2
	bl sub_806BB9C
	ldr r0, _0806C924
	ldr r1, _0806C928
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	movs r0, 0x5
	bl audio_play
_0806C914:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806C91C: .4byte 0x02020004
_0806C920: .4byte gUnknown_083768B8
_0806C924: .4byte 0x0201b000
_0806C928: .4byte 0x00000261
	thumb_func_end sub_806C890

	thumb_func_start sub_806C92C
sub_806C92C: @ 806C92C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0806C960
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x2E]
	lsls r0, 24
	lsrs r6, r0, 24
	ldrh r0, [r1, 0x30]
	lsls r0, 24
	lsrs r4, r0, 24
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _0806C96A
	cmp r6, 0
	bne _0806C964
	cmp r4, 0
	bne _0806C97C
	movs r4, 0x1
	b _0806C97C
	.align 2, 0
_0806C960: .4byte 0x02020004
_0806C964:
	cmp r4, 0
	beq _0806C97C
	b _0806C97A
_0806C96A:
	cmp r6, 0x1
	bhi _0806C976
	cmp r4, 0x1
	bhi _0806C97C
	movs r4, 0x2
	b _0806C97C
_0806C976:
	cmp r4, 0x1
	bls _0806C97C
_0806C97A:
	movs r4, 0
_0806C97C:
	ldr r1, _0806C990
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	strh r4, [r0, 0x30]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806C990: .4byte 0x02020004
	thumb_func_end sub_806C92C

	thumb_func_start sub_806C994
sub_806C994: @ 806C994
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	bl sub_806CA00
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806C9C0
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	strh r4, [r1, 0x2E]
	bl sub_806C92C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806C9C0: .4byte 0x02020004
	thumb_func_end sub_806C994

	thumb_func_start sub_806C9C4
sub_806C9C4: @ 806C9C4
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	bl sub_806CA00
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0806C9FC
	lsls r2, r4, 4
	adds r2, r4
	lsls r2, 2
	adds r2, r3
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrh r0, [r1, 0x20]
	strh r0, [r2, 0x20]
	ldrh r0, [r1, 0x22]
	strh r0, [r2, 0x22]
	ldrh r0, [r1, 0x2E]
	strh r0, [r2, 0x2E]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806C9FC: .4byte 0x02020004
	thumb_func_end sub_806C9C4

	thumb_func_start sub_806CA00
sub_806CA00: @ 806CA00
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806CA14
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrh r0, [r1, 0xE]
	lsrs r0, 8
	bx lr
	.align 2, 0
_0806CA14: .4byte 0x03004b20
	thumb_func_end sub_806CA00

	thumb_func_start sub_806CA18
sub_806CA18: @ 806CA18
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r3, _0806CA34
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r3
	ldrb r0, [r2, 0xE]
	lsrs r1, 16
	orrs r0, r1
	strh r0, [r2, 0xE]
	bx lr
	.align 2, 0
_0806CA34: .4byte 0x03004b20
	thumb_func_end sub_806CA18

	thumb_func_start sub_806CA38
sub_806CA38: @ 806CA38
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_806CA00
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806CA5C
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0806CA5C: .4byte 0x02020004
	thumb_func_end sub_806CA38

	thumb_func_start sub_806CA60
sub_806CA60: @ 806CA60
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0806CAD8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806CADC
	str r1, [r0]
	ldr r5, _0806CAE0
	strb r4, [r5]
	ldr r0, _0806CAE4
	movs r1, 0
	bl CreateTask
	ldr r0, _0806CAE8
	bl object_new_hidden_with_callback
	strb r0, [r5, 0x1]
	ldrb r1, [r5, 0x1]
	adds r0, r4, 0
	bl sub_806C9C4
	adds r0, r4, 0
	bl sub_806CA00
	strb r0, [r5, 0x2]
	ldr r1, _0806CAEC
	adds r0, r5, r1
	ldrb r0, [r0]
	movs r1, 0
	bl sub_806D538
	ldr r2, _0806CAF0
	ldrb r0, [r5, 0x1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	lsls r0, 1
	ldr r2, _0806CAF4
	adds r0, r2
	ldrh r1, [r1, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x6
	movs r3, 0
	bl sub_806BF24
	ldr r0, _0806CAF8
	adds r5, r0
	movs r0, 0x2
	strb r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CAD8: .4byte 0x03004b20
_0806CADC: .4byte TaskDummy
_0806CAE0: .4byte 0x02001000
_0806CAE4: .4byte sub_806CB74
_0806CAE8: .4byte SpriteCallbackDummy
_0806CAEC: .4byte 0x0001a272
_0806CAF0: .4byte 0x02020004
_0806CAF4: .4byte gUnknown_083769A8
_0806CAF8: .4byte 0x0001a261
	thumb_func_end sub_806CA60

	thumb_func_start sub_806CAFC
sub_806CAFC: @ 806CAFC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _0806CB48
	ldrb r3, [r4, 0x1]
	lsls r2, r3, 4
	adds r2, r3
	lsls r2, 2
	ldr r3, _0806CB4C
	adds r5, r2, r3
	ldrb r2, [r4, 0x2]
	lsls r4, r2, 4
	adds r4, r2
	lsls r4, 2
	adds r4, r3
	lsls r1, 24
	asrs r1, 24
	bl sub_806BF74
	ldrh r2, [r5, 0x2E]
	movs r0, 0x2E
	ldrsh r1, [r5, r0]
	movs r3, 0x2E
	ldrsh r0, [r4, r3]
	cmp r1, r0
	beq _0806CB54
	adds r0, r1, 0
	lsls r0, 1
	ldr r1, _0806CB50
	adds r0, r1
	lsls r1, r2, 24
	lsrs r1, 24
	movs r2, 0x6
	movs r3, 0x1
	bl sub_806BF24
	b _0806CB6A
	.align 2, 0
_0806CB48: .4byte 0x02001000
_0806CB4C: .4byte 0x02020004
_0806CB50: .4byte gUnknown_083769A8
_0806CB54:
	movs r3, 0x2E
	ldrsh r0, [r5, r3]
	lsls r0, 1
	ldr r1, _0806CB70
	adds r0, r1
	lsls r1, r2, 24
	lsrs r1, 24
	movs r2, 0x6
	movs r3, 0
	bl sub_806BF24
_0806CB6A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CB70: .4byte gUnknown_083769A8
	thumb_func_end sub_806CAFC

	thumb_func_start sub_806CB74
sub_806CB74: @ 806CB74
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806CB8C
	ldrh r0, [r0, 0x30]
	cmp r0, 0x20
	beq _0806CBBC
	cmp r0, 0x20
	bgt _0806CB90
	cmp r0, 0x10
	beq _0806CBD0
	b _0806CBDA
	.align 2, 0
_0806CB8C: .4byte 0x03001770
_0806CB90:
	cmp r0, 0x40
	beq _0806CB9A
	cmp r0, 0x80
	beq _0806CBAC
	b _0806CBDA
_0806CB9A:
	ldr r0, _0806CBA8
	ldrb r0, [r0]
	movs r1, 0x1
	negs r1, r1
	bl sub_806CAFC
	b _0806CBDA
	.align 2, 0
_0806CBA8: .4byte 0x02001000
_0806CBAC:
	ldr r0, _0806CBB8
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_806CAFC
	b _0806CBDA
	.align 2, 0
_0806CBB8: .4byte 0x02001000
_0806CBBC:
	ldr r0, _0806CBCC
	ldrb r0, [r0]
	movs r1, 0x2
	negs r1, r1
	bl sub_806CAFC
	b _0806CBDA
	.align 2, 0
_0806CBCC: .4byte 0x02001000
_0806CBD0:
	ldr r0, _0806CC04
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_806CAFC
_0806CBDA:
	ldr r0, _0806CC08
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806CC10
	movs r0, 0x5
	bl audio_play
	ldr r1, _0806CC0C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806CC04
	ldr r1, [r1, 0xC]
	str r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	b _0806CC24
	.align 2, 0
_0806CC04: .4byte 0x02001000
_0806CC08: .4byte 0x03001770
_0806CC0C: .4byte 0x03004b20
_0806CC10:
	lsls r0, r1, 16
	lsrs r0, 16
	cmp r0, 0x2
	bne _0806CC24
	movs r0, 0x5
	bl audio_play
	adds r0, r4, 0
	bl sub_806CD44
_0806CC24:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_806CB74

	thumb_func_start sub_806CC2C
sub_806CC2C: @ 806CC2C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _0806CC68
	ldrb r1, [r5, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0806CC6C
	adds r0, r1
	bl DestroySprite
	movs r0, 0
	movs r1, 0
	bl sub_806D538
	ldr r0, _0806CC70
	adds r1, r5, r0
	movs r0, 0x2
	strb r0, [r1]
	ldrb r0, [r5]
	bl SwitchTaskToFollowupFunc
	adds r0, r4, 0
	bl DestroyTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CC68: .4byte 0x02001000
_0806CC6C: .4byte 0x02020004
_0806CC70: .4byte 0x0001a261
	thumb_func_end sub_806CC2C

	thumb_func_start sub_806CC74
sub_806CC74: @ 806CC74
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0806CCD8
	mov r8, r0
	ldr r6, _0806CCDC
	ldrb r0, [r6, 0x2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r8
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	lsls r0, 1
	ldr r5, _0806CCE0
	adds r0, r5
	ldrh r1, [r1, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x3
	movs r3, 0x1
	bl sub_806BF24
	ldrb r0, [r6, 0x1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r8
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	lsls r0, 1
	adds r0, r5
	ldrh r1, [r1, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x3
	movs r3, 0
	bl sub_806BF24
	adds r0, r4, 0
	bl sub_806CC2C
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806CCD8: .4byte 0x02020004
_0806CCDC: .4byte 0x02001000
_0806CCE0: .4byte gUnknown_083769A8
	thumb_func_end sub_806CC74

	thumb_func_start sub_806CCE4
sub_806CCE4: @ 806CCE4
	push {r4,r5,lr}
	ldr r3, _0806CD38
	ldr r2, _0806CD3C
	ldrb r1, [r2, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r1, [r2, 0x2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r4, 0x5
	bhi _0806CD1E
	lsls r0, r4, 1
	ldr r1, _0806CD40
	adds r0, r1
	adds r1, r4, 0
	movs r2, 0x3
	movs r3, 0
	bl sub_806BF24
_0806CD1E:
	cmp r5, 0x5
	bhi _0806CD32
	lsls r0, r5, 1
	ldr r1, _0806CD40
	adds r0, r1
	adds r1, r5, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_806BF24
_0806CD32:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CD38: .4byte 0x02020004
_0806CD3C: .4byte 0x02001000
_0806CD40: .4byte gUnknown_083769A8
	thumb_func_end sub_806CCE4

	thumb_func_start sub_806CD44
sub_806CD44: @ 806CD44
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_806CCE4
	adds r0, r4, 0
	bl sub_806CC2C
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_806CD44

	thumb_func_start sub_806CD5C
sub_806CD5C: @ 806CD5C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r2, _0806CDA8
	ldr r6, _0806CDAC
	ldrb r1, [r6, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r5, r0, 24
	mov r9, r5
	ldrb r1, [r6, 0x2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r4, r0, 24
	adds r7, r4, 0
	cmp r5, r4
	beq _0806CD9E
	cmp r5, 0x7
	beq _0806CD9E
	cmp r4, 0x7
	bne _0806CDB0
_0806CD9E:
	mov r0, r8
	bl sub_806CD44
	b _0806CED2
	.align 2, 0
_0806CDA8: .4byte 0x02020004
_0806CDAC: .4byte 0x02001000
_0806CDB0:
	adds r0, r5, 0
	bl sub_806D5B8
	adds r0, r4, 0
	bl sub_806D5B8
	cmp r5, r4
	bls _0806CDC6
	strb r4, [r6, 0x5]
	strb r5, [r6, 0x6]
	b _0806CDCC
_0806CDC6:
	mov r0, r9
	strb r0, [r6, 0x5]
	strb r7, [r6, 0x6]
_0806CDCC:
	ldr r4, _0806CE1C
	ldrb r0, [r4]
	ldrb r1, [r4, 0x5]
	bl sub_806DDA0
	strb r0, [r4, 0x3]
	ldrb r0, [r4]
	ldrb r1, [r4, 0x6]
	bl sub_806DDA0
	strb r0, [r4, 0x4]
	ldrb r3, [r4, 0x5]
	cmp r3, 0
	bne _0806CE34
	ldr r2, _0806CE20
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _0806CE24
	strh r1, [r0, 0x2E]
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _0806CE28
	strh r1, [r0, 0x32]
	strh r3, [r4, 0x8]
	movs r0, 0xB
	strh r0, [r4, 0xA]
	ldr r1, _0806CE2C
	mov r3, r8
	lsls r0, r3, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806CE30
	b _0806CE66
	.align 2, 0
_0806CE1C: .4byte 0x02001000
_0806CE20: .4byte 0x02020004
_0806CE24: .4byte 0x0000fff8
_0806CE28: .4byte 0x0000ff58
_0806CE2C: .4byte 0x03004b20
_0806CE30: .4byte sub_806D014
_0806CE34:
	ldr r2, _0806CEE0
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x8
	strh r1, [r0, 0x2E]
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0xA8
	strh r1, [r0, 0x32]
	movs r0, 0xB
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xA]
	ldr r1, _0806CEE4
	mov r3, r8
	lsls r0, r3, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806CEE8
_0806CE66:
	str r1, [r0]
	ldr r0, _0806CEEC
	adds r1, r4, r0
	movs r0, 0x1
	strb r0, [r1]
	adds r6, r2, 0
	ldr r4, _0806CEF0
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r5, r6, 0
	adds r5, 0x1C
	adds r0, r5
	ldr r2, _0806CEF4
	str r2, [r0]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x8
	strh r1, [r0, 0x2E]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0xA8
	strh r1, [r0, 0x32]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	str r2, [r0]
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r5
	adds r0, r6
	ldr r1, [r1]
	bl _call_via_r1
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r5, r0, r5
	adds r0, r6
	ldr r1, [r5]
	bl _call_via_r1
_0806CED2:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806CEE0: .4byte 0x02020004
_0806CEE4: .4byte 0x03004b20
_0806CEE8: .4byte sub_806D118
_0806CEEC: .4byte 0x0001a261
_0806CEF0: .4byte 0x02001000
_0806CEF4: .4byte sub_806D37C
	thumb_func_end sub_806CD5C

	thumb_func_start sub_806CEF8
sub_806CEF8: @ 806CEF8
	ldrh r3, [r0]
	ldrh r2, [r1]
	strh r2, [r0]
	strh r3, [r1]
	bx lr
	thumb_func_end sub_806CEF8

	thumb_func_start sub_806CF04
sub_806CF04: @ 806CF04
	push {r4,r5,lr}
	ldr r4, _0806CF94
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _0806CF98
	adds r0, r5
	ldrb r2, [r4, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	bl sub_806CEF8
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r5, 0x2
	adds r0, r3
	ldrb r2, [r4, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	bl sub_806CEF8
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r5, 0x4
	adds r0, r3
	ldrb r2, [r4, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	bl sub_806CEF8
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r5, 0
	adds r3, 0xE
	adds r0, r3
	ldrb r2, [r4, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	bl sub_806CEF8
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	subs r5, 0x4
	adds r0, r5
	ldr r2, _0806CF9C
	str r2, [r0]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	str r2, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CF94: .4byte 0x02001000
_0806CF98: .4byte 0x02020024
_0806CF9C: .4byte sub_806D37C
	thumb_func_end sub_806CF04

	thumb_func_start sub_806CFA0
sub_806CFA0: @ 806CFA0
	push {r4-r6,lr}
	lsls r4, r1, 24
	lsrs r4, 24
	ldr r5, _0806CFDC
	ldrb r1, [r5, 0x6]
	subs r1, 0x1
	lsls r0, r1, 1
	adds r0, r1
	adds r0, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	movs r1, 0x3
	bl sub_806BA34
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	adds r1, r6, 0
	bl sub_806BB3C
	cmp r4, 0
	bne _0806CFE0
	ldrh r0, [r5, 0x8]
	subs r0, 0x1
	strh r0, [r5, 0x8]
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	b _0806CFEA
	.align 2, 0
_0806CFDC: .4byte 0x02001000
_0806CFE0:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	ldrh r0, [r5, 0xA]
	subs r0, 0x1
_0806CFEA:
	strh r0, [r5, 0xA]
	ldr r4, _0806D010
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	movs r1, 0x3
	movs r2, 0xA
	bl sub_806B9A4
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0xA
	bl sub_806BA94
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806D010: .4byte 0x02001000
	thumb_func_end sub_806CFA0

	thumb_func_start sub_806D014
sub_806D014: @ 806D014
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	movs r1, 0
	bl sub_806CFA0
	ldr r2, _0806D050
	movs r0, 0x8
	ldrsh r1, [r2, r0]
	movs r0, 0xD
	negs r0, r0
	cmp r1, r0
	bge _0806D04A
	movs r1, 0xA
	ldrsh r0, [r2, r1]
	cmp r0, 0x20
	ble _0806D04A
	bl sub_806CF04
	ldr r0, _0806D054
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806D058
	str r0, [r1]
_0806D04A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D050: .4byte 0x02001000
_0806D054: .4byte 0x03004b20
_0806D058: .4byte sub_806D05C
	thumb_func_end sub_806D014

	thumb_func_start sub_806D05C
sub_806D05C: @ 806D05C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806CFA0
	ldr r0, _0806D08C
	ldr r1, [r0, 0x8]
	movs r0, 0xB0
	lsls r0, 12
	cmp r1, r0
	bne _0806D084
	ldr r0, _0806D090
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806D094
	str r0, [r1]
_0806D084:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D08C: .4byte 0x02001000
_0806D090: .4byte 0x03004b20
_0806D094: .4byte sub_806D198
	thumb_func_end sub_806D05C

	thumb_func_start sub_806D098
sub_806D098: @ 806D098
	push {r4-r7,lr}
	lsls r4, r1, 24
	lsrs r4, 24
	ldr r5, _0806D0E0
	ldrb r1, [r5, 0x5]
	subs r1, 0x1
	lsls r0, r1, 1
	adds r0, r1
	adds r0, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r1, [r5, 0x6]
	subs r1, 0x1
	lsls r0, r1, 1
	adds r0, r1
	adds r0, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	adds r1, r7, 0
	bl sub_806BB3C
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	adds r1, r6, 0
	bl sub_806BB3C
	cmp r4, 0
	bne _0806D0E4
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	b _0806D0EE
	.align 2, 0
_0806D0E0: .4byte 0x02001000
_0806D0E4:
	ldrh r0, [r5, 0x8]
	subs r0, 0x1
	strh r0, [r5, 0x8]
	ldrh r0, [r5, 0xA]
	subs r0, 0x1
_0806D0EE:
	strh r0, [r5, 0xA]
	ldr r4, _0806D114
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	adds r1, r7, 0
	movs r2, 0
	movs r3, 0xA
	bl sub_806BA94
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0xA
	bl sub_806BA94
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D114: .4byte 0x02001000
	thumb_func_end sub_806D098

	thumb_func_start sub_806D118
sub_806D118: @ 806D118
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	movs r1, 0
	bl sub_806D098
	ldr r1, _0806D150
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0x20
	ble _0806D14A
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0x20
	ble _0806D14A
	bl sub_806CF04
	ldr r0, _0806D154
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806D158
	str r0, [r1]
_0806D14A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D150: .4byte 0x02001000
_0806D154: .4byte 0x03004b20
_0806D158: .4byte sub_806D15C
	thumb_func_end sub_806D118

	thumb_func_start sub_806D15C
sub_806D15C: @ 806D15C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806D098
	ldr r0, _0806D188
	ldr r1, [r0, 0x8]
	ldr r0, _0806D18C
	cmp r1, r0
	bne _0806D182
	ldr r0, _0806D190
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806D194
	str r0, [r1]
_0806D182:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D188: .4byte 0x02001000
_0806D18C: .4byte 0x000b000b
_0806D190: .4byte 0x03004b20
_0806D194: .4byte sub_806D198
	thumb_func_end sub_806D15C

	thumb_func_start sub_806D198
sub_806D198: @ 806D198
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r10, r0
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r4, _0806D364
	ldrb r0, [r4]
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	bl sub_806DE50
	ldrb r0, [r4]
	ldrb r1, [r4, 0x6]
	ldrb r2, [r4, 0x3]
	bl sub_806DE50
	bl battle_type_is_double
	ldr r5, _0806D368
	ldrb r1, [r4, 0x3]
	lsls r3, r1, 4
	adds r3, r1
	lsls r3, 2
	adds r3, r5
	ldr r6, _0806D36C
	ldrb r2, [r4, 0x6]
	lsls r2, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r2, r1
	adds r2, r6
	ldrb r0, [r2]
	movs r1, 0
	mov r8, r1
	strh r0, [r3, 0x20]
	bl battle_type_is_double
	ldrb r1, [r4, 0x3]
	lsls r3, r1, 4
	adds r3, r1
	lsls r3, 2
	adds r3, r5
	ldrb r2, [r4, 0x6]
	lsls r2, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r2, r1
	adds r2, r6
	ldrb r0, [r2, 0x1]
	strh r0, [r3, 0x22]
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x24]
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x26]
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	movs r1, 0x1C
	adds r1, r5
	mov r9, r1
	add r0, r9
	ldr r7, _0806D370
	str r7, [r0]
	bl battle_type_is_double
	ldrb r1, [r4, 0x4]
	lsls r3, r1, 4
	adds r3, r1
	lsls r3, 2
	adds r3, r5
	ldrb r2, [r4, 0x5]
	lsls r2, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r2, r1
	adds r2, r6
	ldrb r0, [r2]
	strh r0, [r3, 0x20]
	bl battle_type_is_double
	ldrb r1, [r4, 0x4]
	lsls r3, r1, 4
	adds r3, r1
	lsls r3, 2
	adds r3, r5
	ldrb r2, [r4, 0x5]
	lsls r2, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r2, r1
	adds r2, r6
	ldrb r0, [r2, 0x1]
	strh r0, [r3, 0x22]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x24]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x26]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	str r7, [r0]
	ldrb r0, [r4]
	ldrb r2, [r4, 0x2]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	ldrh r1, [r1, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	bl sub_806DDA0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r9
	ldr r0, _0806D374
	str r0, [r1]
	ldrb r0, [r4, 0x5]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _0806D378
	adds r0, r5
	ldrb r1, [r4, 0x6]
	muls r1, r6
	adds r1, r5
	bl sub_806E6F0
	ldrb r0, [r4, 0x5]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl sub_806E2C0
	ldrb r0, [r4, 0x5]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl sub_806E07C
	ldrb r0, [r4, 0x5]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl sub_806E4E8
	ldrb r0, [r4, 0x5]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl nullsub_12
	ldrb r0, [r4, 0x6]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl sub_806E2C0
	ldrb r0, [r4, 0x6]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl sub_806E07C
	ldrb r0, [r4, 0x6]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl sub_806E4E8
	ldrb r0, [r4, 0x6]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl nullsub_12
	bl sub_806E6C8
	mov r0, r10
	bl sub_806CC74
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D364: .4byte 0x02001000
_0806D368: .4byte 0x02020004
_0806D36C: .4byte gUnknown_08376678
_0806D370: .4byte sub_806DA38
_0806D374: .4byte sub_806DA0C
_0806D378: .4byte 0x03004360
	thumb_func_end sub_806D198

	thumb_func_start sub_806D37C
sub_806D37C: @ 806D37C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_809D638
	ldrh r2, [r4, 0x24]
	movs r0, 0x24
	ldrsh r1, [r4, r0]
	movs r3, 0x32
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0806D3A8
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	negs r0, r0
	movs r1, 0
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x32]
	ldr r0, _0806D3A4
	str r0, [r4, 0x1C]
	b _0806D3AE
	.align 2, 0
_0806D3A4: .4byte sub_806DA38
_0806D3A8:
	ldrh r0, [r4, 0x2E]
	adds r0, r2, r0
	strh r0, [r4, 0x24]
_0806D3AE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_806D37C

	thumb_func_start sub_806D3B4
sub_806D3B4: @ 806D3B4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	ldr r6, _0806D438
	ldr r1, _0806D43C
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r5, r0, r1
	ldrh r0, [r5, 0x8]
	ldrb r1, [r6, 0x2]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0x3]
	bl sub_806BA34
	ldrh r0, [r5, 0x8]
	ldrb r1, [r6, 0x8]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0x9]
	bl sub_806BB3C
	ldrh r0, [r5, 0x8]
	ldrb r1, [r6, 0xA]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0xB]
	bl sub_806BB3C
	ldrh r1, [r5, 0x8]
	subs r1, 0x1
	strh r1, [r5, 0x8]
	ldrb r0, [r6, 0x2]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0x3]
	movs r2, 0x4
	bl sub_806B9A4
	cmp r4, 0
	beq _0806D440
	ldrh r0, [r5, 0x8]
	ldrb r1, [r6, 0x8]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0x9]
	movs r2, 0
	movs r3, 0x4
	bl sub_806BA94
	b _0806D454
	.align 2, 0
_0806D438: .4byte gUnknown_083769C0
_0806D43C: .4byte 0x03004b20
_0806D440:
	ldrh r0, [r5, 0x8]
	ldrb r1, [r6, 0x8]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0x9]
	movs r2, 0x1
	movs r3, 0x4
	bl sub_806BA94
_0806D454:
	mov r0, r8
	cmp r0, 0
	beq _0806D480
	ldr r1, _0806D47C
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x8]
	ldrb r1, [r6, 0xA]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0xB]
	movs r2, 0
	movs r3, 0x4
	bl sub_806BA94
	b _0806D49E
	.align 2, 0
_0806D47C: .4byte 0x03004b20
_0806D480:
	ldr r1, _0806D4A8
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x8]
	ldrb r1, [r6, 0xA]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0xB]
	movs r2, 0x1
	movs r3, 0x4
	bl sub_806BA94
_0806D49E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D4A8: .4byte 0x03004b20
	thumb_func_end sub_806D3B4

	thumb_func_start sub_806D4AC
sub_806D4AC: @ 806D4AC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 16
	lsls r2, 24
	lsrs r2, 24
	cmp r1, 0
	beq _0806D4F6
	adds r1, r2, 0x3
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_806DDA0
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806D4FC
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r4, r1, r2
	ldr r0, _0806D500
	strh r0, [r4, 0x2E]
	ldr r3, _0806D504
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r3
	movs r3, 0x8
	ldrsh r0, [r0, r3]
	lsls r0, 3
	negs r0, r0
	strh r0, [r4, 0x32]
	adds r2, 0x1C
	adds r1, r2
	ldr r0, _0806D508
	str r0, [r1]
_0806D4F6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806D4FC: .4byte 0x02020004
_0806D500: .4byte 0x0000fff8
_0806D504: .4byte 0x03004b20
_0806D508: .4byte sub_806D37C
	thumb_func_end sub_806D4AC

	thumb_func_start sub_806D50C
sub_806D50C: @ 806D50C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	bl sub_806DDA0
	ldr r2, _0806D534
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x20]
	adds r0, 0xF0
	strh r0, [r1, 0x20]
	pop {r0}
	bx r0
	.align 2, 0
_0806D534: .4byte 0x02020004
	thumb_func_end sub_806D50C

	thumb_func_start sub_806D538
sub_806D538: @ 806D538
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	adds r0, r1, 0
	cmp r4, 0xFF
	beq _0806D59A
	cmp r1, 0x1
	beq _0806D568
	cmp r1, 0x1
	bgt _0806D556
	cmp r1, 0
	beq _0806D560
	b _0806D58A
_0806D556:
	cmp r0, 0x2
	beq _0806D570
	cmp r0, 0x3
	beq _0806D57E
	b _0806D58A
_0806D560:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x17
	b _0806D576
_0806D568:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x13
	b _0806D576
_0806D570:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x16
_0806D576:
	movs r3, 0x13
	bl MenuDrawTextWindow
	b _0806D58A
_0806D57E:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x12
	movs r3, 0x13
	bl MenuDrawTextWindow
_0806D58A:
	ldr r0, _0806D5A0
	lsls r1, r4, 2
	adds r1, r0
	ldr r0, [r1]
	movs r1, 0x1
	movs r2, 0x11
	bl MenuPrint
_0806D59A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D5A0: .4byte gUnknown_08376624
	thumb_func_end sub_806D538

	thumb_func_start sub_806D5A4
sub_806D5A4: @ 806D5A4
	push {lr}
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	thumb_func_end sub_806D5A4

	thumb_func_start sub_806D5B8
sub_806D5B8: @ 806D5B8
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _0806D658
	bl battle_type_is_double
	lsls r4, r5, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	adds r1, r6
	ldrb r1, [r1]
	mov r10, r1
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	adds r1, r6
	ldrb r1, [r1, 0x1]
	mov r9, r1
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	adds r1, r6
	ldrb r1, [r1, 0x2]
	mov r8, r1
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r4, r1
	adds r4, r6
	ldrb r1, [r4, 0x3]
	ldr r0, _0806D65C
	str r1, [sp]
	mov r1, r10
	mov r2, r9
	mov r3, r8
	bl ZeroFillWindowRect
	movs r0, 0
	str r0, [sp, 0x4]
	lsls r5, 10
	ldr r0, _0806D660
	adds r5, r0
	ldr r2, _0806D664
	add r0, sp, 0x4
	adds r1, r5, 0
	bl CpuFastSet
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806D658: .4byte gUnknown_08376948
_0806D65C: .4byte 0x03004210
_0806D660: .4byte 0x06014000
_0806D664: .4byte 0x01000100
	thumb_func_end sub_806D5B8

	thumb_func_start sub_806D668
sub_806D668: @ 806D668
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _0806D708
	bl battle_type_is_double
	lsls r4, r5, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	adds r1, r6
	ldrb r1, [r1]
	mov r10, r1
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	adds r1, r6
	ldrb r1, [r1, 0x1]
	mov r9, r1
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	adds r1, r6
	ldrb r1, [r1, 0x2]
	mov r8, r1
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r4, r1
	adds r4, r6
	ldrb r1, [r4, 0x3]
	ldr r0, _0806D70C
	str r1, [sp]
	mov r1, r10
	mov r2, r9
	mov r3, r8
	bl ZeroFillWindowRect
	movs r0, 0
	str r0, [sp, 0x4]
	lsls r5, 10
	ldr r0, _0806D710
	adds r5, r0
	ldr r2, _0806D714
	add r0, sp, 0x4
	adds r1, r5, 0
	bl CpuFastSet
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806D708: .4byte gUnknown_08376978
_0806D70C: .4byte 0x03004210
_0806D710: .4byte 0x06014300
_0806D714: .4byte 0x01000040
	thumb_func_end sub_806D668

	thumb_func_start sub_806D718
sub_806D718: @ 806D718
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0806D7C4
	mov r0, sp
	strh r1, [r0]
	movs r5, 0
	cmp r4, 0x1
	bhi _0806D736
	ldr r0, _0806D7C8
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
_0806D736:
	cmp r4, 0x2
	beq _0806D73E
	cmp r4, 0
	bne _0806D746
_0806D73E:
	ldr r0, _0806D7CC
	ldr r1, _0806D7D0
	bl LZDecompressVram
_0806D746:
	cmp r4, 0x3
	beq _0806D74E
	cmp r4, 0
	bne _0806D75A
_0806D74E:
	ldr r0, _0806D7D4
	movs r2, 0xB0
	lsls r2, 1
	movs r1, 0
	bl LoadCompressedPalette
_0806D75A:
	cmp r4, 0x4
	beq _0806D762
	cmp r4, 0
	bne _0806D776
_0806D762:
	mov r0, sp
	movs r1, 0
	movs r2, 0x2
	bl LoadPalette
	ldr r0, _0806D7D8
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
_0806D776:
	cmp r4, 0x5
	beq _0806D77E
	cmp r4, 0
	bne _0806D786
_0806D77E:
	ldr r0, _0806D7DC
	ldr r1, _0806D7E0
	bl LZDecompressVram
_0806D786:
	cmp r4, 0x6
	beq _0806D78E
	cmp r4, 0
	bne _0806D796
_0806D78E:
	ldr r0, _0806D7E4
	ldr r1, _0806D7E8
	bl LZDecompressVram
_0806D796:
	cmp r4, 0x7
	beq _0806D79E
	cmp r4, 0
	bne _0806D7A6
_0806D79E:
	ldr r0, _0806D7EC
	ldr r1, _0806D7F0
	bl LZDecompressVram
_0806D7A6:
	cmp r4, 0x8
	beq _0806D7AE
	cmp r4, 0
	bne _0806D7BA
_0806D7AE:
	ldr r0, _0806D7F4
	movs r1, 0xB0
	movs r2, 0x20
	bl LoadCompressedPalette
	movs r5, 0x1
_0806D7BA:
	adds r0, r5, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806D7C4: .4byte 0x00007fff
_0806D7C8: .4byte gPartyMenuMisc_Gfx
_0806D7CC: .4byte gPartyMenuMisc_Tilemap
_0806D7D0: .4byte 0x06003800
_0806D7D4: .4byte gPartyMenuMisc_Pal
_0806D7D8: .4byte gFontDefaultPalette
_0806D7DC: .4byte gPartyMenuHpBar_Gfx
_0806D7E0: .4byte 0x06006000
_0806D7E4: .4byte gPartyMenuOrderText_Gfx
_0806D7E8: .4byte 0x06006180
_0806D7EC: .4byte gStatusGfx_Icons
_0806D7F0: .4byte 0x06007180
_0806D7F4: .4byte gStatusPal_Icons
	thumb_func_end sub_806D718

	thumb_func_start sub_806D7F8
sub_806D7F8: @ 806D7F8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsls r2, 16
	lsrs r5, r1, 16
	asrs r1, 16
	lsrs r4, r2, 16
	asrs r2, 16
	adds r0, r1, 0
	adds r1, r2, 0
	bl sub_8046200
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	cmp r5, r4
	beq _0806D830
	movs r2, 0x1
	cmp r0, 0x3
	beq _0806D830
	movs r2, 0x2
	cmp r0, 0x2
	beq _0806D830
	movs r2, 0x4
	cmp r0, 0x1
	bne _0806D830
	movs r2, 0x3
_0806D830:
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	ldr r1, _0806D848
	adds r0, r1
	adds r1, r2, 0
	bl sub_809D824
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806D848: .4byte 0x02020004
	thumb_func_end sub_806D7F8

	thumb_func_start sub_806D84C
sub_806D84C: @ 806D84C
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	movs r1, 0x39
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r6, 0
	movs r1, 0x3A
	bl GetMonData
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_806D7F8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_806D84C

	thumb_func_start sub_806D880
sub_806D880: @ 806D880
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	adds r6, r0, 0
	adds r5, r1, 0
	mov r8, r3
	lsls r6, 24
	lsrs r6, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _0806D904
	lsls r1, r5, 2
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r1, r3
	ldrb r0, [r1]
	mov r9, r0
	ldrb r1, [r1, 0x1]
	mov r10, r1
	mov r0, r8
	movs r1, 0x41
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0
	bl GetMonData
	ldr r1, _0806D908
	movs r2, 0x5
	str r2, [sp]
	str r0, [sp, 0x4]
	adds r0, r4, 0
	mov r2, r9
	mov r3, r10
	bl sub_809D2FC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_806DE50
	adds r0, r4, 0
	mov r1, r8
	bl sub_806D84C
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806D904: .4byte gUnknown_08376678
_0806D908: .4byte sub_809D62C
	thumb_func_end sub_806D880

	thumb_func_start sub_806D90C
sub_806D90C: @ 806D90C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r2, 0
	lsls r0, 24
	lsrs r6, r0, 24
	mov r8, r6
	lsls r1, 24
	lsrs r5, r1, 24
	adds r7, r5, 0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806D95A
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D946
	adds r0, r6, 0
	adds r1, r5, 0
	movs r2, 0x2
	adds r3, r4, 0
	bl sub_806D880
	b _0806D95A
_0806D946:
	bl battle_type_is_double
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	mov r0, r8
	adds r1, r7, 0
	adds r3, r4, 0
	bl sub_806D880
_0806D95A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806D90C

	thumb_func_start unref_sub_806D964
unref_sub_806D964: @ 806D964
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	b _0806D986
_0806D96E:
	movs r0, 0x64
	adds r2, r4, 0
	muls r2, r0
	ldr r0, _0806D994
	adds r2, r0
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_806D90C
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_0806D986:
	ldr r0, _0806D998
	ldrb r0, [r0]
	cmp r4, r0
	bcc _0806D96E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806D994: .4byte 0x03004360
_0806D998: .4byte 0x03004350
	thumb_func_end unref_sub_806D964

	thumb_func_start sub_806D99C
sub_806D99C: @ 806D99C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r6, r0, 0
	adds r5, r1, 0
	mov r8, r3
	lsls r6, 24
	lsrs r6, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _0806DA04
	lsls r1, r5, 2
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r1, r3
	ldrb r2, [r1]
	ldrb r3, [r1, 0x1]
	mov r1, r8
	ldrh r0, [r1]
	ldr r1, _0806DA08
	movs r4, 0x5
	str r4, [sp]
	mov r7, r8
	ldr r4, [r7, 0x18]
	str r4, [sp, 0x4]
	bl sub_809D2FC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_806DE50
	ldrh r1, [r7, 0x10]
	ldrh r2, [r7, 0x12]
	adds r0, r4, 0
	bl sub_806D7F8
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DA04: .4byte gUnknown_08376678
_0806DA08: .4byte sub_809D62C
	thumb_func_end sub_806D99C

	thumb_func_start sub_806DA0C
sub_806DA0C: @ 806DA0C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_809D638
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0806DA32
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806DA30
	ldr r0, _0806DA2C
	strh r0, [r4, 0x26]
	b _0806DA32
	.align 2, 0
_0806DA2C: .4byte 0x0000fffd
_0806DA30:
	strh r1, [r4, 0x26]
_0806DA32:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_806DA0C

	thumb_func_start sub_806DA38
sub_806DA38: @ 806DA38
	push {lr}
	bl sub_809D638
	pop {r0}
	bx r0
	thumb_func_end sub_806DA38

	thumb_func_start sub_806DA44
sub_806DA44: @ 806DA44
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	cmp r1, 0x5
	bhi _0806DA8E
	bl sub_806DDA0
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0806DA7C
	lsls r1, r0, 4
	adds r1, r0
	lsls r2, r1, 2
	adds r1, r2, r3
	movs r0, 0
	strh r0, [r1, 0x26]
	strh r0, [r1, 0x2E]
	cmp r4, 0
	bne _0806DA84
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r2, r0
	ldr r1, _0806DA80
	b _0806DA8C
	.align 2, 0
_0806DA7C: .4byte 0x02020004
_0806DA80: .4byte sub_806DA38
_0806DA84:
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r2, r0
	ldr r1, _0806DA94
_0806DA8C:
	str r1, [r0]
_0806DA8E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806DA94: .4byte sub_806DA0C
	thumb_func_end sub_806DA44

	thumb_func_start sub_806DA98
sub_806DA98: @ 806DA98
	push {lr}
	ldr r0, _0806DAAC
	bl LoadSpriteSheet
	ldr r0, _0806DAB0
	bl LoadSpritePalette
	pop {r0}
	bx r0
	.align 2, 0
_0806DAAC: .4byte gUnknown_083765DC
_0806DAB0: .4byte gUnknown_083765E4
	thumb_func_end sub_806DA98

	thumb_func_start sub_806DAB4
sub_806DAB4: @ 806DAB4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x3C]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0806DAE4
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r2
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _0806DAE8
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0806DB06
	.align 2, 0
_0806DAE4: .4byte 0x02020004
_0806DAE8:
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldrh r0, [r2, 0x24]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x26]
	ldrh r2, [r2, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
_0806DB06:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_806DAB4

	thumb_func_start sub_806DB0C
sub_806DB0C: @ 806DB0C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	adds r6, r0, 0
	mov r9, r1
	lsls r6, 24
	lsrs r6, 24
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _0806DB84
	mov r8, r0
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	add r0, r8
	adds r0, 0x43
	ldrb r3, [r0]
	ldr r0, _0806DB88
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	movs r1, 0xFA
	movs r2, 0xAA
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	mov r0, r8
	adds r5, r4, r0
	movs r0, 0x4
	strh r0, [r5, 0x24]
	movs r0, 0xA
	strh r0, [r5, 0x26]
	movs r0, 0x1C
	add r8, r0
	add r4, r8
	ldr r0, _0806DB8C
	str r0, [r4]
	strh r6, [r5, 0x3C]
	adds r0, r5, 0
	mov r1, r9
	bl StartSpriteAnim
	ldr r1, [r4]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806DB84: .4byte 0x02020004
_0806DB88: .4byte gSpriteTemplate_837660C
_0806DB8C: .4byte sub_806DAB4
	thumb_func_end sub_806DB0C

	thumb_func_start sub_806DB90
sub_806DB90: @ 806DB90
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	lsls r2, 24
	lsrs r2, 24
	cmp r2, 0
	beq _0806DBA4
	cmp r2, 0x1
	beq _0806DBEC
	b _0806DC28
_0806DBA4:
	movs r5, 0
	ldrb r0, [r6]
	cmp r5, r0
	bcs _0806DC28
_0806DBAC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0806DBE8
	adds r0, r1
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _0806DBD8
	adds r0, r7, r5
	ldrb r4, [r0]
	adds r0, r1, 0
	bl itemid_is_mail
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_806DB0C
_0806DBD8:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldrb r0, [r6]
	cmp r5, r0
	bcc _0806DBAC
	b _0806DC28
	.align 2, 0
_0806DBE8: .4byte 0x03004360
_0806DBEC:
	movs r5, 0
	b _0806DC22
_0806DBF0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0806DC30
	adds r0, r1
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _0806DC1C
	adds r0, r5, r7
	ldrb r4, [r0, 0x6]
	adds r0, r1, 0
	bl itemid_is_mail
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_806DB0C
_0806DC1C:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_0806DC22:
	ldrb r0, [r6, 0x1]
	cmp r5, r0
	bcc _0806DBF0
_0806DC28:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DC30: .4byte 0x030045c0
	thumb_func_end sub_806DB90

	thumb_func_start sub_806DC34
sub_806DC34: @ 806DC34
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r7, 0
	ldr r0, _0806DCC8
	mov r9, r0
	movs r1, 0x1C
	add r1, r9
	mov r10, r1
_0806DC50:
	movs r0, 0x64
	muls r0, r7
	ldr r1, _0806DCCC
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806DCB0
	mov r0, r8
	adds r1, r7, 0
	bl sub_806DDA0
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _0806DCD0
	movs r1, 0xFA
	movs r2, 0xAA
	movs r3, 0x4
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	mov r1, r9
	adds r6, r4, r1
	movs r1, 0x4
	strh r1, [r6, 0x24]
	movs r1, 0xA
	strh r1, [r6, 0x26]
	strh r5, [r6, 0x3C]
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	add r1, r9
	strh r0, [r1, 0x3C]
	mov r0, r8
	adds r1, r7, 0
	bl sub_806DF60
	add r4, r10
	ldr r1, [r4]
	adds r0, r6, 0
	bl _call_via_r1
_0806DCB0:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x5
	bls _0806DC50
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DCC8: .4byte 0x02020004
_0806DCCC: .4byte 0x03004360
_0806DCD0: .4byte gSpriteTemplate_837660C
	thumb_func_end sub_806DC34

	thumb_func_start sub_806DCD4
sub_806DCD4: @ 806DCD4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 16
	lsrs r7, r2, 16
	bl sub_806DDA0
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0806DD2C
	movs r1, 0xFA
	movs r2, 0xAA
	movs r3, 0x4
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0806DD30
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r5, r0, r1
	movs r0, 0x4
	strh r0, [r5, 0x24]
	movs r0, 0xA
	strh r0, [r5, 0x26]
	strh r4, [r5, 0x3C]
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	strh r6, [r0, 0x3C]
	cmp r7, 0
	bne _0806DD34
	adds r0, r5, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0806DD5C
	.align 2, 0
_0806DD2C: .4byte gSpriteTemplate_837660C
_0806DD30: .4byte 0x02020004
_0806DD34:
	adds r0, r7, 0
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _0806DD46
	adds r0, r5, 0
	movs r1, 0x1
	b _0806DD4A
_0806DD46:
	adds r0, r5, 0
	movs r1, 0
_0806DD4A:
	bl StartSpriteAnim
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_0806DD5C:
	ldr r2, _0806DD78
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r1, r2, 0
	adds r1, 0x1C
	adds r1, r0, r1
	adds r0, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DD78: .4byte 0x02020004
	thumb_func_end sub_806DCD4

	thumb_func_start sub_806DD7C
sub_806DD7C: @ 806DD7C
	ldrh r2, [r0, 0x3C]
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _0806DD9C
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	ldrh r2, [r1, 0x24]
	ldrh r3, [r1, 0x20]
	adds r2, r3
	strh r2, [r0, 0x20]
	ldrh r1, [r1, 0x22]
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_0806DD9C: .4byte 0x02020004
	thumb_func_end sub_806DD7C

	thumb_func_start sub_806DDA0
sub_806DDA0: @ 806DDA0
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r0, r1, 24
	cmp r0, 0x5
	bhi _0806DE38
	lsls r0, 2
	ldr r1, _0806DDB8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806DDB8: .4byte _0806DDBC
	.align 2, 0
_0806DDBC:
	.4byte _0806DE38
	.4byte _0806DDD4
	.4byte _0806DDE8
	.4byte _0806DDFC
	.4byte _0806DE10
	.4byte _0806DE24
_0806DDD4:
	ldr r0, _0806DDE4
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrb r0, [r1, 0x8]
	b _0806DE46
	.align 2, 0
_0806DDE4: .4byte 0x03004b20
_0806DDE8:
	ldr r0, _0806DDF8
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xA]
	b _0806DE44
	.align 2, 0
_0806DDF8: .4byte 0x03004b20
_0806DDFC:
	ldr r0, _0806DE0C
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrb r0, [r1, 0xA]
	b _0806DE46
	.align 2, 0
_0806DE0C: .4byte 0x03004b20
_0806DE10:
	ldr r0, _0806DE20
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xC]
	b _0806DE44
	.align 2, 0
_0806DE20: .4byte 0x03004b20
_0806DE24:
	ldr r0, _0806DE34
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrb r0, [r1, 0xC]
	b _0806DE46
	.align 2, 0
_0806DE34: .4byte 0x03004b20
_0806DE38:
	ldr r0, _0806DE4C
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
_0806DE44:
	lsrs r0, 8
_0806DE46:
	pop {r1}
	bx r1
	.align 2, 0
_0806DE4C: .4byte 0x03004b20
	thumb_func_end sub_806DDA0

	thumb_func_start sub_806DE50
sub_806DE50: @ 806DE50
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r0, r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	cmp r0, 0x5
	bhi _0806DF24
	lsls r0, 2
	ldr r1, _0806DE6C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806DE6C: .4byte _0806DE70
	.align 2, 0
_0806DE70:
	.4byte _0806DE88
	.4byte _0806DEA0
	.4byte _0806DEC0
	.4byte _0806DED8
	.4byte _0806DEF8
	.4byte _0806DF10
_0806DE88:
	ldr r1, _0806DE9C
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0x8]
	lsls r2, r4, 8
	orrs r1, r2
	strh r1, [r0, 0x8]
	b _0806DF24
	.align 2, 0
_0806DE9C: .4byte 0x03004b20
_0806DEA0:
	ldr r0, _0806DEB8
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0x8]
	ldr r0, _0806DEBC
	ands r0, r2
	orrs r0, r4
	strh r0, [r1, 0x8]
	b _0806DF24
	.align 2, 0
_0806DEB8: .4byte 0x03004b20
_0806DEBC: .4byte 0xffffff00
_0806DEC0:
	ldr r1, _0806DED4
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0xA]
	lsls r2, r4, 8
	orrs r1, r2
	strh r1, [r0, 0xA]
	b _0806DF24
	.align 2, 0
_0806DED4: .4byte 0x03004b20
_0806DED8:
	ldr r0, _0806DEF0
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0xA]
	ldr r0, _0806DEF4
	ands r0, r2
	orrs r0, r4
	strh r0, [r1, 0xA]
	b _0806DF24
	.align 2, 0
_0806DEF0: .4byte 0x03004b20
_0806DEF4: .4byte 0xffffff00
_0806DEF8:
	ldr r1, _0806DF0C
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0xC]
	lsls r2, r4, 8
	orrs r1, r2
	strh r1, [r0, 0xC]
	b _0806DF24
	.align 2, 0
_0806DF0C: .4byte 0x03004b20
_0806DF10:
	ldr r0, _0806DF2C
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0xC]
	ldr r0, _0806DF30
	ands r0, r2
	orrs r0, r4
	strh r0, [r1, 0xC]
_0806DF24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806DF2C: .4byte 0x03004b20
_0806DF30: .4byte 0xffffff00
	thumb_func_end sub_806DE50

	thumb_func_start sub_806DF34
sub_806DF34: @ 806DF34
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	bl sub_806DDA0
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806DF5C
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0806DF5C: .4byte 0x02020004
	thumb_func_end sub_806DF34

	thumb_func_start sub_806DF60
sub_806DF60: @ 806DF60
	push {r4-r6,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	adds r1, r4, 0
	bl sub_806DF34
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	movs r0, 0x64
	adds r1, r4, 0
	muls r1, r0
	ldr r0, _0806DFA4
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	cmp r0, 0
	bne _0806DFAC
	ldr r1, _0806DFA8
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0806DFF6
	.align 2, 0
_0806DFA4: .4byte 0x03004360
_0806DFA8: .4byte 0x02020004
_0806DFAC:
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _0806DFD8
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	ldr r0, _0806DFD4
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x1
	b _0806DFE6
	.align 2, 0
_0806DFD4: .4byte 0x02020004
_0806DFD8:
	lsls r4, r6, 4
	adds r4, r6
	lsls r4, 2
	ldr r0, _0806DFFC
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0
_0806DFE6:
	bl StartSpriteAnim
	adds r4, 0x3E
	ldrb r1, [r4]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
_0806DFF6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806DFFC: .4byte 0x02020004
	thumb_func_end sub_806DF60

	thumb_func_start box_print
box_print: @ 806E000
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r6, r2, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	str r0, [sp]
	ldr r5, _0806E040
	ldr r2, _0806E044
	mov r0, sp
	adds r1, r5, 0
	bl CpuFastSet
	ldr r0, _0806E048
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_8004E3C
	lsls r4, 10
	ldr r0, _0806E04C
	adds r4, r0
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x80
	bl CpuFastSet
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E040: .4byte 0x02039360
_0806E044: .4byte 0x01000100
_0806E048: .4byte gWindowConfig_81E6CAC
_0806E04C: .4byte 0x06014000
	thumb_func_end box_print

	thumb_func_start sub_806E050
sub_806E050: @ 806E050
	push {r4,r5,lr}
	sub sp, 0xC
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r1, sp
	bl GetMonNickname
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl box_print
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_806E050

	thumb_func_start sub_806E07C
sub_806E07C: @ 806E07C
	push {r4-r6,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806E0BC
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E0AA
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl sub_806E050
	b _0806E0BC
_0806E0AA:
	bl battle_type_is_double
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	adds r2, r4, 0
	bl sub_806E050
_0806E0BC:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_806E07C

	thumb_func_start sub_806E0C4
sub_806E0C4: @ 806E0C4
	push {r4-r6,lr}
	movs r4, 0
	movs r6, 0x64
	ldr r5, _0806E0E8
_0806E0CC:
	adds r1, r4, 0
	muls r1, r6
	adds r1, r5
	adds r0, r4, 0
	bl sub_806E07C
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0806E0CC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E0E8: .4byte 0x03004360
	thumb_func_end sub_806E0C4

	thumb_func_start GetMonNickname
GetMonNickname: @ 806E0EC
	push {r4,lr}
	adds r4, r1, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl GetMonData
	adds r0, r4, 0
	bl StringGetEnd10
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetMonNickname

	thumb_func_start sub_806E104
sub_806E104: @ 806E104
	push {r4,r5,lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r4, _0806E15C
	lsrs r0, 22
	lsls r3, r1, 1
	adds r3, r1
	lsls r3, 3
	adds r0, r3
	adds r0, r4
	ldrb r1, [r0]
	subs r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r0, 0x1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 19
	adds r1, r0
	lsls r1, 1
	ldr r0, _0806E160
	adds r4, r1, r0
	lsls r2, 26
	lsrs r2, 24
	movs r3, 0
	movs r0, 0xC6
	lsls r0, 1
	adds r2, r0
	ldr r0, _0806E164
	adds r5, r0, 0
_0806E142:
	lsls r0, r3, 1
	adds r0, r4
	adds r1, r2, r3
	orrs r1, r5
	strh r1, [r0]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _0806E142
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806E15C: .4byte gUnknown_08376738
_0806E160: .4byte 0x0600f000
_0806E164: .4byte 0xffffb000
	thumb_func_end sub_806E104

	thumb_func_start sub_806E168
sub_806E168: @ 806E168
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E17E
	movs r3, 0x2
	b _0806E186
_0806E17E:
	bl battle_type_is_double
	lsls r0, 24
	lsrs r3, r0, 24
_0806E186:
	ldr r1, _0806E1C8
	lsls r2, r4, 2
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 3
	adds r2, r0
	adds r2, r1
	ldrb r1, [r2]
	subs r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r2, 0x1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 19
	adds r1, r0
	lsls r1, 1
	ldr r0, _0806E1CC
	adds r1, r0
	movs r3, 0
	movs r2, 0
_0806E1B0:
	lsls r0, r3, 1
	adds r0, r1
	strh r2, [r0]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _0806E1B0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E1C8: .4byte gUnknown_08376738
_0806E1CC: .4byte 0x0600f000
	thumb_func_end sub_806E168

	thumb_func_start sub_806E1D0
sub_806E1D0: @ 806E1D0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 19
	adds r1, r2
	lsls r1, 1
	ldr r2, _0806E1F0
	adds r1, r2
	movs r2, 0x86
	lsls r2, 1
	adds r0, r2
	strh r0, [r1]
	bx lr
	.align 2, 0
_0806E1F0: .4byte 0x0600f000
	thumb_func_end sub_806E1D0

	thumb_func_start sub_806E1F4
sub_806E1F4: @ 806E1F4
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r3, _0806E278
	lsls r2, r4, 2
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r2, r0
	adds r2, r3
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	subs r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0x40
	bl sub_806E1D0
	ldr r6, _0806E27C
	movs r0, 0xFC
	strb r0, [r6]
	movs r0, 0x12
	strb r0, [r6, 0x1]
	movs r0, 0x8
	strb r0, [r6, 0x2]
	adds r0, r6, 0x3
	adds r1, r5, 0
	bl ConvertIntToDecimalString
	movs r0, 0
	str r0, [sp]
	ldr r5, _0806E280
	ldr r2, _0806E284
	mov r0, sp
	adds r1, r5, 0
	bl CpuFastSet
	ldr r0, _0806E288
	ldr r2, _0806E28C
	adds r1, r5, r2
	adds r2, r6, 0
	bl sub_8004E3C
	lsls r4, 10
	ldr r0, _0806E290
	adds r4, r0
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x20
	bl CpuFastSet
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E278: .4byte gUnknown_08376738
_0806E27C: .4byte 0x020231cc
_0806E280: .4byte 0x02039460
_0806E284: .4byte 0x01000020
_0806E288: .4byte gWindowConfig_81E6CAC
_0806E28C: .4byte 0xffffff00
_0806E290: .4byte 0x06014200
	thumb_func_end sub_806E1F4

	thumb_func_start sub_806E294
sub_806E294: @ 806E294
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	movs r1, 0x38
	bl GetMonData
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806E1F4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_806E294

	thumb_func_start sub_806E2C0
sub_806E2C0: @ 806E2C0
	push {r4-r7,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806E32E
	adds r0, r5, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0806E32E
	adds r0, r5, 0
	bl sub_80A1CD8
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E2FA
	movs r6, 0x2
	b _0806E302
_0806E2FA:
	bl battle_type_is_double
	lsls r0, 24
	lsrs r6, r0, 24
_0806E302:
	cmp r4, 0
	beq _0806E31A
	cmp r4, 0x6
	beq _0806E31A
	subs r2, r4, 0x1
	lsls r2, 24
	lsrs r2, 24
	adds r0, r7, 0
	adds r1, r6, 0
	bl sub_806E104
	b _0806E324
_0806E31A:
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_806E294
_0806E324:
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_806E3C0
_0806E32E:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806E2C0

	thumb_func_start sub_806E334
sub_806E334: @ 806E334
	push {r4-r6,lr}
	movs r4, 0
	movs r6, 0x64
	ldr r5, _0806E358
_0806E33C:
	adds r1, r4, 0
	muls r1, r6
	adds r1, r5
	adds r0, r4, 0
	bl sub_806E2C0
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0806E33C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E358: .4byte 0x03004360
	thumb_func_end sub_806E334

	thumb_func_start sub_806E35C
sub_806E35C: @ 806E35C
	push {r4-r7,lr}
	ldr r4, [sp, 0x14]
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	lsls r3, 24
	lsrs r6, r3, 24
	adds r1, r4, 0
	bl sub_8040D8C
	cmp r0, 0
	bne _0806E3BA
	ldr r2, _0806E3A4
	lsls r1, r6, 2
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 3
	adds r1, r0
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x3
	lsls r0, 24
	lsrs r3, r0, 24
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r7, 0
	beq _0806E3A8
	cmp r7, 0xFE
	beq _0806E3B2
	b _0806E3BA
	.align 2, 0
_0806E3A4: .4byte gUnknown_08376738
_0806E3A8:
	movs r0, 0x42
	adds r1, r3, 0
	bl sub_806E1D0
	b _0806E3BA
_0806E3B2:
	movs r0, 0x44
	adds r1, r3, 0
	bl sub_806E1D0
_0806E3BA:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806E35C

	thumb_func_start sub_806E3C0
sub_806E3C0: @ 806E3C0
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	mov r8, r0
	adds r6, r1, 0
	adds r5, r2, 0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _0806E41C
	mov r9, r0
	adds r0, r5, 0
	mov r1, r9
	bl GetMonNickname
	adds r0, r5, 0
	movs r1, 0x41
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl GetMonGender
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r9
	str r0, [sp]
	adds r0, r4, 0
	adds r2, r6, 0
	mov r3, r8
	bl sub_806E35C
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E41C: .4byte 0x020231cc
	thumb_func_end sub_806E3C0

	thumb_func_start sub_806E420
sub_806E420: @ 806E420
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r1, r2, 0
	adds r5, r3, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 16
	lsrs r1, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r2, _0806E48C
	adds r0, r2, 0
	movs r2, 0xF
	movs r3, 0x1
	bl sub_8072C14
	adds r2, r0, 0
	movs r0, 0xBA
	strb r0, [r2]
	adds r2, 0x1
	adds r0, r2, 0
	adds r1, r5, 0
	movs r2, 0x23
	movs r3, 0x1
	bl sub_8072C14
	movs r0, 0
	str r0, [sp]
	ldr r5, _0806E490
	ldr r2, _0806E494
	mov r0, sp
	adds r1, r5, 0
	bl CpuFastSet
	ldr r0, _0806E498
	ldr r2, _0806E49C
	adds r1, r5, r2
	ldr r2, _0806E48C
	bl sub_8004E3C
	lsls r4, 10
	ldr r0, _0806E4A0
	adds r4, r0
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x40
	bl CpuFastSet
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806E48C: .4byte 0x020231cc
_0806E490: .4byte 0x02039460
_0806E494: .4byte 0x01000040
_0806E498: .4byte gWindowConfig_81E6CAC
_0806E49C: .4byte 0xffffff00
_0806E4A0: .4byte 0x06014300
	thumb_func_end sub_806E420

	thumb_func_start sub_806E4A4
sub_806E4A4: @ 806E4A4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	adds r6, r1, 0
	mov r8, r2
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	movs r1, 0x39
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x3A
	bl GetMonData
	adds r3, r0, 0
	lsls r3, 16
	lsrs r3, 16
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_806E420
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_806E4A4

	thumb_func_start sub_806E4E8
sub_806E4E8: @ 806E4E8
	push {r4-r6,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806E534
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0806E534
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E522
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl sub_806E4A4
	b _0806E534
_0806E522:
	bl battle_type_is_double
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	adds r2, r4, 0
	bl sub_806E4A4
_0806E534:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_806E4E8

	thumb_func_start sub_806E53C
sub_806E53C: @ 806E53C
	push {r4-r6,lr}
	movs r4, 0
	movs r6, 0x64
	ldr r5, _0806E560
_0806E544:
	adds r1, r4, 0
	muls r1, r6
	adds r1, r5
	adds r0, r4, 0
	bl sub_806E4E8
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0806E544
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E560: .4byte 0x03004360
	thumb_func_end sub_806E53C

	thumb_func_start unref_sub_806E564
unref_sub_806E564: @ 806E564
	bx lr
	thumb_func_end unref_sub_806E564

	thumb_func_start unref_sub_806E568
unref_sub_806E568: @ 806E568
	bx lr
	thumb_func_end unref_sub_806E568

	thumb_func_start nullsub_12
nullsub_12: @ 806E56C
	bx lr
	thumb_func_end nullsub_12

	thumb_func_start nullsub_13
nullsub_13: @ 806E570
	bx lr
	thumb_func_end nullsub_13

	thumb_func_start sub_806E574
sub_806E574: @ 806E574
	push {r4-r6,lr}
	sub sp, 0x18
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 16
	lsrs r3, 16
	ldr r0, _0806E624
	str r0, [sp, 0x14]
	str r3, [sp]
	str r2, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	lsls r2, 16
	asrs r2, 16
	lsls r3, 16
	asrs r3, 16
	adds r0, r2, 0
	adds r1, r3, 0
	bl sub_8046200
	lsls r0, 24
	lsrs r3, r0, 24
	adds r4, r3, 0
	cmp r3, 0x2
	bls _0806E5BE
	mov r2, sp
	ldrb r1, [r2, 0xC]
	movs r0, 0x20
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0xC]
_0806E5BE:
	cmp r3, 0x2
	bne _0806E5D2
	mov r2, sp
	ldrb r1, [r2, 0xC]
	movs r0, 0x20
	negs r0, r0
	ands r0, r1
	movs r1, 0x5
	orrs r0, r1
	strb r0, [r2, 0xC]
_0806E5D2:
	cmp r4, 0x1
	bhi _0806E5E6
	mov r2, sp
	ldrb r1, [r2, 0xC]
	movs r0, 0x20
	negs r0, r0
	ands r0, r1
	movs r1, 0x6
	orrs r0, r1
	strb r0, [r2, 0xC]
_0806E5E6:
	movs r0, 0x80
	lsls r0, 1
	str r0, [sp, 0x10]
	ldr r2, _0806E628
	lsls r1, r6, 2
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 3
	adds r1, r0
	adds r1, r2
	ldr r4, [r1]
	add r1, sp, 0x14
	mov r0, sp
	adds r2, r4, 0
	movs r3, 0
	bl sub_80460C8
	subs r4, 0x4
	ldr r1, _0806E62C
	adds r0, r1, 0
	strh r0, [r4]
	adds r1, 0x1
	adds r0, r1, 0
	strh r0, [r4, 0x2]
	adds r1, 0x1
	adds r0, r1, 0
	strh r0, [r4, 0x10]
	add sp, 0x18
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E624: .4byte 0xffff8000
_0806E628: .4byte gUnknown_08376858
_0806E62C: .4byte 0x00003109
	thumb_func_end sub_806E574

	thumb_func_start sub_806E630
sub_806E630: @ 806E630
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	adds r6, r1, 0
	mov r8, r2
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	movs r1, 0x39
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x3A
	bl GetMonData
	adds r3, r0, 0
	lsls r3, 16
	lsrs r3, 16
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_806E574
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_806E630

	thumb_func_start sub_806E674
sub_806E674: @ 806E674
	push {r4-r6,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806E6C0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0806E6C0
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E6AE
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl sub_806E630
	b _0806E6C0
_0806E6AE:
	bl battle_type_is_double
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	adds r2, r4, 0
	bl sub_806E630
_0806E6C0:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_806E674

	thumb_func_start sub_806E6C8
sub_806E6C8: @ 806E6C8
	push {r4-r6,lr}
	movs r4, 0
	movs r6, 0x64
	ldr r5, _0806E6EC
_0806E6D0:
	adds r1, r4, 0
	muls r1, r6
	adds r1, r5
	adds r0, r4, 0
	bl sub_806E674
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0806E6D0
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E6EC: .4byte 0x03004360
	thumb_func_end sub_806E6C8

	thumb_func_start sub_806E6F0
sub_806E6F0: @ 806E6F0
	push {r4,r5,lr}
	sub sp, 0x64
	adds r4, r0, 0
	adds r5, r1, 0
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0x64
	bl memcpy
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x64
	bl memcpy
	adds r0, r5, 0
	mov r1, sp
	movs r2, 0x64
	bl memcpy
	add sp, 0x64
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_806E6F0

	thumb_func_start sub_806E720
sub_806E720: @ 806E720
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 21
	adds r0, r3
	ldrb r4, [r0]
	lsls r4, 25
	movs r3, 0x80
	lsls r3, 18
	adds r4, r3
	lsrs r4, 24
	ldrb r0, [r0, 0x1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0x1E
	subs r3, r0
	strb r3, [r1]
	movs r0, 0x14
	subs r0, r4
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_806E720

	thumb_func_start sub_806E750
sub_806E750: @ 806E750
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0xC
	adds r5, r0, 0
	adds r4, r1, 0
	mov r9, r2
	adds r6, r3, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	movs r0, 0x9
	add r0, sp
	mov r8, r0
	adds r0, r5, 0
	add r1, sp, 0x8
	mov r2, r8
	adds r3, r4, 0
	bl sub_806E720
	add r0, sp, 0x8
	ldrb r0, [r0]
	mov r2, r8
	ldrb r1, [r2]
	lsls r5, 3
	adds r5, r4
	ldrb r2, [r5, 0x1]
	ldrb r3, [r5]
	mov r4, r9
	str r4, [sp]
	ldr r4, [r5, 0x4]
	str r4, [sp, 0x4]
	bl sub_8089C50
	add r0, sp, 0x8
	ldrb r1, [r0]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	ldrb r2, [r0]
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r5]
	str r6, [sp]
	ldrb r0, [r5, 0x1]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0
	bl InitMenu
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_806E750

	thumb_func_start sub_806E7D0
sub_806E7D0: @ 806E7D0
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r6, r1, 0
	lsls r4, 24
	lsrs r4, 24
	mov r5, sp
	adds r5, 0x1
	adds r0, r4, 0
	mov r1, sp
	adds r2, r5, 0
	adds r3, r6, 0
	bl sub_806E720
	mov r0, sp
	ldrb r0, [r0]
	ldrb r1, [r5]
	lsls r4, 3
	adds r4, r6
	ldrb r2, [r4, 0x1]
	adds r2, r0, r2
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4]
	lsls r3, 1
	adds r3, r1, r3
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	bl MenuZeroFillWindowRect
	bl sub_8072DEC
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_806E7D0

	thumb_func_start sub_806E81C
sub_806E81C: @ 806E81C
	lsls r0, 24
	lsls r3, 24
	lsrs r3, 24
	lsrs r0, 21
	adds r0, r1
	ldr r0, [r0, 0x4]
	adds r0, r3
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r2
	ldr r0, [r0, 0x4]
	bx lr
	thumb_func_end sub_806E81C

	thumb_func_start sub_806E834
sub_806E834: @ 806E834
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	ldr r1, _0806E878
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0x3
	movs r1, 0xE
	movs r2, 0x1A
	movs r3, 0x13
	bl MenuDrawTextWindow
	adds r0, r5, 0
	movs r1, 0x4
	movs r2, 0xF
	bl MenuPrintMessage
	ldr r0, _0806E87C
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806E880
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806E878: .4byte 0x0202e8f6
_0806E87C: .4byte sub_806E884
_0806E880: .4byte 0x03004b20
	thumb_func_end sub_806E834

	thumb_func_start sub_806E884
sub_806E884: @ 806E884
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _0806E8C0
	ldr r1, _0806E8C8
	movs r0, 0
	strb r0, [r1]
	ldr r1, _0806E8CC
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0806E8BA
	movs r0, 0x3
	movs r1, 0xE
	movs r2, 0x1A
	movs r3, 0x13
	bl MenuZeroFillWindowRect
_0806E8BA:
	adds r0, r5, 0
	bl DestroyTask
_0806E8C0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806E8C8: .4byte 0x0202e8f6
_0806E8CC: .4byte 0x03004b20
	thumb_func_end sub_806E884

	thumb_func_start sub_806E8D0
sub_806E8D0: @ 806E8D0
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r5, 16
	lsrs r5, 16
	ldr r4, _0806E8FC
	str r2, [r4, 0x10]
	strb r0, [r4, 0x4]
	bl sub_806CA38
	strb r0, [r4, 0x5]
	strh r5, [r4, 0x6]
	ldrb r1, [r4, 0x5]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0806E900
	adds r0, r1
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806E8FC: .4byte 0x0201c000
_0806E900: .4byte 0x03004360
	thumb_func_end sub_806E8D0

	thumb_func_start sub_806E904
sub_806E904: @ 806E904
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r1, 16
	lsrs r4, r1, 16
	adds r0, r4, 0
	bl itemid_is_mail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E93C
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80A2BC4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0806E930
	movs r0, 0x1
	b _0806E958
_0806E930:
	ldr r1, _0806E938
	movs r0, 0x2
	b _0806E940
	.align 2, 0
_0806E938: .4byte 0x0202e8f4
_0806E93C:
	ldr r1, _0806E960
	movs r0, 0x1
_0806E940:
	strb r0, [r1]
	mov r0, sp
	strb r4, [r0]
	mov r1, sp
	lsrs r0, r4, 8
	strb r0, [r1, 0x1]
	adds r0, r5, 0
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	movs r0, 0
_0806E958:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806E960: .4byte 0x0202e8f4
	thumb_func_end sub_806E904

	thumb_func_start sub_806E964
sub_806E964: @ 806E964
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r8, r2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r5, r1, 16
	mov r9, r5
	ldr r2, _0806E9D4
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r6, r1, r2
	ldr r1, _0806E9D8
	str r1, [r6]
	adds r1, r5, 0
	mov r2, r8
	bl sub_806E8D0
	ldr r4, _0806E9DC
	ldr r0, [r4]
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r2, r0, 16
	adds r7, r2, 0
	ldr r1, _0806E9E0
	movs r0, 0
	strb r0, [r1]
	ldr r0, _0806E9E4
	mov r10, r0
	movs r0, 0
	mov r1, r10
	strh r0, [r1]
	cmp r2, 0
	beq _0806EA44
	adds r0, r2, 0
	bl itemid_is_mail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E9F0
	ldr r0, _0806E9E8
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _0806E9EC
	movs r1, 0x5
	bl CreateTask
	b _0806EA78
	.align 2, 0
_0806E9D4: .4byte 0x03004b20
_0806E9D8: .4byte TaskDummy
_0806E9DC: .4byte 0x0201c000
_0806E9E0: .4byte 0x0202e8f4
_0806E9E4: .4byte 0x0202e8f8
_0806E9E8: .4byte gUnknown_0840F17F
_0806E9EC: .4byte party_menu_link_mon_held_item_object
_0806E9F0:
	ldr r0, [r4]
	ldr r1, _0806EA30
	bl GetMonNickname
	ldr r1, _0806EA34
	adds r0, r7, 0
	bl itemid_copy_name
	ldr r4, _0806EA38
	ldr r1, _0806EA3C
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _0806EA40
	movs r1, 0x5
	bl CreateTask
	adds r0, r5, 0
	bl itemid_is_mail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806EA78
	mov r0, r10
	strh r7, [r0]
	b _0806EA78
	.align 2, 0
_0806EA30: .4byte 0x020231cc
_0806EA34: .4byte 0x020232cc
_0806EA38: .4byte 0x020234cc
_0806EA3C: .4byte gUnknown_0840F1CD
_0806EA40: .4byte sub_806EBB8
_0806EA44:
	ldr r0, [r4]
	adds r1, r5, 0
	bl sub_806E904
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80A9538
	adds r0, r5, 0
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _0806EA66
	mov r1, r8
	str r1, [r6]
	b _0806EA78
_0806EA66:
	ldrb r0, [r4, 0x5]
	mov r1, r9
	movs r2, 0x1
	bl sub_806EBF0
	ldr r0, _0806EA88
	movs r1, 0x5
	bl CreateTask
_0806EA78:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EA88: .4byte party_menu_link_mon_held_item_object
	thumb_func_end sub_806E964

	thumb_func_start party_menu_link_mon_held_item_object
party_menu_link_mon_held_item_object: @ 806EA8C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0806EAC0
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806EABA
	ldr r4, _0806EAC4
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	bl sub_806DF60
	ldr r2, _0806EAC8
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, [r4, 0x10]
	str r1, [r0]
	adds r0, r5, 0
	bl DestroyTask
_0806EABA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806EAC0: .4byte 0x0202e8f6
_0806EAC4: .4byte 0x0201c000
_0806EAC8: .4byte 0x03004b20
	thumb_func_end party_menu_link_mon_held_item_object

	thumb_func_start sub_806EACC
sub_806EACC: @ 806EACC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	bne _0806EB74
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r4, _0806EB30
	ldr r0, [r4]
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r4, 0x6]
	movs r1, 0x1
	bl sub_80A9538
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80A9424
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806EB5C
	ldr r0, [r4]
	ldrh r1, [r4, 0x6]
	bl sub_806E904
	ldrh r0, [r4, 0x6]
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _0806EB34
	ldrb r0, [r4, 0x5]
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_806EDB4
	b _0806EB9A
	.align 2, 0
_0806EB30: .4byte 0x0201c000
_0806EB34:
	ldrh r0, [r4, 0x6]
	ldr r1, _0806EB50
	bl itemid_copy_name
	ldr r4, _0806EB54
	ldr r1, _0806EB58
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	b _0806EB9A
	.align 2, 0
_0806EB50: .4byte 0x020231cc
_0806EB54: .4byte 0x020234cc
_0806EB58: .4byte gUnknown_0840F26E
_0806EB5C:
	ldr r0, _0806EB70
	movs r1, 0
	bl sub_806E834
	ldrh r0, [r4, 0x6]
	movs r1, 0x1
	bl sub_80A9424
	b _0806EB9A
	.align 2, 0
_0806EB70: .4byte gUnknown_0840F2FC
_0806EB74:
	cmp r1, 0x1
	beq _0806EB80
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806EBA8
_0806EB80:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806EB8E
	movs r0, 0x5
	bl audio_play
_0806EB8E:
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
_0806EB9A:
	ldr r0, _0806EBB0
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806EBB4
	str r0, [r1]
_0806EBA8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806EBB0: .4byte 0x03004b20
_0806EBB4: .4byte party_menu_link_mon_held_item_object
	thumb_func_end sub_806EACC

	thumb_func_start sub_806EBB8
sub_806EBB8: @ 806EBB8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806EBE4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806EBDE
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _0806EBE8
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806EBEC
	str r0, [r1]
_0806EBDE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806EBE4: .4byte 0x0202e8f6
_0806EBE8: .4byte 0x03004b20
_0806EBEC: .4byte sub_806EACC
	thumb_func_end sub_806EBB8

	thumb_func_start sub_806EBF0
sub_806EBF0: @ 806EBF0
	push {r4,r5,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0806EC30
	adds r0, r1
	ldr r1, _0806EC34
	bl GetMonNickname
	ldr r1, _0806EC38
	adds r0, r4, 0
	bl itemid_copy_name
	ldr r4, _0806EC3C
	ldr r1, _0806EC40
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806E834
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806EC30: .4byte 0x03004360
_0806EC34: .4byte 0x020231cc
_0806EC38: .4byte 0x020232cc
_0806EC3C: .4byte 0x020234cc
_0806EC40: .4byte gUnknown_0840F1AE
	thumb_func_end sub_806EBF0

	thumb_func_start sub_806EC44
sub_806EC44: @ 806EC44
	push {r4,r5,lr}
	adds r2, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0806ECA0
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	ldr r3, _0806ECA4
	str r3, [r1]
	movs r1, 0
	bl sub_806E8D0
	ldr r5, _0806ECA8
	ldr r0, [r5]
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	ldr r2, _0806ECAC
	movs r1, 0
	strb r1, [r2]
	movs r1, 0xF8
	lsls r1, 6
	adds r2, r5, r1
	ldrb r1, [r2]
	adds r1, 0x6
	ldrb r2, [r2, 0x2]
	adds r1, r2
	lsls r2, r1, 3
	adds r2, r1
	lsls r2, 2
	ldr r1, _0806ECB0
	adds r4, r2, r1
	cmp r0, 0
	beq _0806ECBC
	ldr r0, _0806ECB4
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _0806ECB8
	movs r1, 0x5
	bl CreateTask
	b _0806ECDA
	.align 2, 0
_0806ECA0: .4byte 0x03004b20
_0806ECA4: .4byte TaskDummy
_0806ECA8: .4byte 0x0201c000
_0806ECAC: .4byte 0x0202e8f4
_0806ECB0: .4byte 0x02028280
_0806ECB4: .4byte gUnknown_0840F29B
_0806ECB8: .4byte party_menu_link_mon_held_item_object
_0806ECBC:
	ldr r0, [r5]
	adds r1, r4, 0
	bl sub_80A2D88
	adds r0, r4, 0
	bl sub_80A2B40
	ldr r0, _0806ECE0
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _0806ECE4
	movs r1, 0x5
	bl CreateTask
_0806ECDA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806ECE0: .4byte gUnknown_0840F2D3
_0806ECE4: .4byte party_menu_link_mon_held_item_object
	thumb_func_end sub_806EC44

	thumb_func_start sub_806ECE8
sub_806ECE8: @ 806ECE8
	push {r4-r6,lr}
	sub sp, 0x4
	adds r2, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0806ED38
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	ldr r3, _0806ED3C
	str r3, [r1]
	movs r1, 0
	bl sub_806E8D0
	ldr r5, _0806ED40
	ldr r0, [r5]
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	adds r6, r4, 0
	cmp r4, 0
	bne _0806ED50
	ldr r4, _0806ED44
	ldr r1, _0806ED48
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0
	bl sub_806E834
	ldr r0, _0806ED4C
	movs r1, 0x5
	bl CreateTask
	b _0806EDA2
	.align 2, 0
_0806ED38: .4byte 0x03004b20
_0806ED3C: .4byte TaskDummy
_0806ED40: .4byte 0x0201c000
_0806ED44: .4byte 0x020234cc
_0806ED48: .4byte gUnknown_0840F213
_0806ED4C: .4byte party_menu_link_mon_held_item_object
_0806ED50:
	mov r0, sp
	movs r1, 0
	strb r1, [r0]
	strb r1, [r0, 0x1]
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80A9424
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806ED92
	adds r0, r4, 0
	bl itemid_is_mail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806ED7C
	ldr r0, [r5]
	bl sub_80A2DF8
_0806ED7C:
	ldrb r0, [r5, 0x5]
	adds r1, r6, 0
	movs r2, 0
	bl sub_806EDB4
	ldr r0, [r5]
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	b _0806ED9A
_0806ED92:
	ldr r0, _0806EDAC
	movs r1, 0
	bl sub_806E834
_0806ED9A:
	ldr r0, _0806EDB0
	movs r1, 0x5
	bl CreateTask
_0806EDA2:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806EDAC: .4byte gUnknown_0840F2FC
_0806EDB0: .4byte party_menu_link_mon_held_item_object
	thumb_func_end sub_806ECE8

	thumb_func_start sub_806EDB4
sub_806EDB4: @ 806EDB4
	push {r4,r5,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0806EDF4
	adds r0, r1
	ldr r1, _0806EDF8
	bl GetMonNickname
	ldr r1, _0806EDFC
	adds r0, r4, 0
	bl itemid_copy_name
	ldr r4, _0806EE00
	ldr r1, _0806EE04
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806E834
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806EDF4: .4byte 0x03004360
_0806EDF8: .4byte 0x020231cc
_0806EDFC: .4byte 0x020232cc
_0806EE00: .4byte 0x020234cc
_0806EE04: .4byte gUnknown_0840F230
	thumb_func_end sub_806EDB4

	thumb_func_start sub_806EE08
sub_806EE08: @ 806EE08
	push {r4,lr}
	adds r2, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0806EE48
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	ldr r3, _0806EE4C
	str r3, [r1]
	movs r1, 0
	bl sub_806E8D0
	ldr r4, _0806EE50
	ldr r0, [r4]
	movs r1, 0xC
	bl GetMonData
	strh r0, [r4, 0x6]
	ldr r0, _0806EE54
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _0806EE58
	movs r1, 0x5
	bl CreateTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806EE48: .4byte 0x03004b20
_0806EE4C: .4byte TaskDummy
_0806EE50: .4byte 0x0201c000
_0806EE54: .4byte gUnknown_0840F0E8
_0806EE58: .4byte sub_806EFEC
	thumb_func_end sub_806EE08

	thumb_func_start sub_806EE5C
sub_806EE5C: @ 806EE5C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	bne _0806EEB0
	ldr r5, _0806EE90
	ldrh r0, [r5, 0x6]
	movs r1, 0x1
	bl sub_80A9424
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806EE98
	ldr r0, [r5]
	bl sub_80A2DF8
	ldr r0, _0806EE94
	movs r1, 0
	bl sub_806E834
	b _0806EEA0
	.align 2, 0
_0806EE90: .4byte 0x0201c000
_0806EE94: .4byte gUnknown_0840F24B
_0806EE98:
	ldr r0, _0806EEAC
	movs r1, 0
	bl sub_806E834
_0806EEA0:
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	b _0806EEDE
	.align 2, 0
_0806EEAC: .4byte gUnknown_0840F2FC
_0806EEB0:
	cmp r1, 0x1
	beq _0806EEBC
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806EEF0
_0806EEBC:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806EECA
	movs r0, 0x5
	bl audio_play
_0806EECA:
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
_0806EEDE:
	bl MenuZeroFillWindowRect
	ldr r0, _0806EEF8
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806EEFC
	str r0, [r1]
_0806EEF0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806EEF8: .4byte 0x03004b20
_0806EEFC: .4byte party_menu_link_mon_held_item_object
	thumb_func_end sub_806EE5C

	thumb_func_start sub_806EF00
sub_806EF00: @ 806EF00
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806EF2C
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806EF26
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _0806EF30
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806EF34
	str r0, [r1]
_0806EF26:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806EF2C: .4byte 0x0202e8f6
_0806EF30: .4byte 0x03004b20
_0806EF34: .4byte sub_806EE5C
	thumb_func_end sub_806EF00

	thumb_func_start sub_806EF38
sub_806EF38: @ 806EF38
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	bne _0806EF9C
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r0, _0806EF70
	ldr r0, [r0]
	bl sub_80A2E78
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0806EF78
	ldr r0, _0806EF74
	movs r1, 0
	bl sub_806E834
	b _0806EF80
	.align 2, 0
_0806EF70: .4byte 0x0201c000
_0806EF74: .4byte gUnknown_0840F10A
_0806EF78:
	ldr r0, _0806EF90
	movs r1, 0
	bl sub_806E834
_0806EF80:
	ldr r0, _0806EF94
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806EF98
	str r0, [r1]
	b _0806EFD8
	.align 2, 0
_0806EF90: .4byte gUnknown_0840F12A
_0806EF94: .4byte 0x03004b20
_0806EF98: .4byte party_menu_link_mon_held_item_object
_0806EF9C:
	cmp r1, 0x1
	beq _0806EFA8
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806EFD8
_0806EFA8:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806EFB6
	movs r0, 0x5
	bl audio_play
_0806EFB6:
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r0, _0806EFE0
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _0806EFE4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806EFE8
	str r1, [r0]
_0806EFD8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806EFE0: .4byte gUnknown_0840F147
_0806EFE4: .4byte 0x03004b20
_0806EFE8: .4byte sub_806EF00
	thumb_func_end sub_806EF38

	thumb_func_start sub_806EFEC
sub_806EFEC: @ 806EFEC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806F018
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806F012
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _0806F01C
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806F020
	str r0, [r1]
_0806F012:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F018: .4byte 0x0202e8f6
_0806F01C: .4byte 0x03004b20
_0806F020: .4byte sub_806EF38
	thumb_func_end sub_806EFEC

	thumb_func_start ItemIdToBattleMoveId
ItemIdToBattleMoveId: @ 806F024
	lsls r0, 16
	ldr r1, _0806F034
	adds r0, r1
	ldr r1, _0806F038
	lsrs r0, 15
	adds r0, r1
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0806F034: .4byte 0xfedf0000
_0806F038: .4byte gUnknown_08376504
	thumb_func_end ItemIdToBattleMoveId

	thumb_func_start pokemon_has_move
pokemon_has_move: @ 806F03C
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	movs r4, 0
_0806F046:
	adds r1, r4, 0
	adds r1, 0xD
	adds r0, r6, 0
	bl GetMonData
	cmp r0, r5
	bne _0806F058
	movs r0, 0x1
	b _0806F064
_0806F058:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _0806F046
	movs r0, 0
_0806F064:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end pokemon_has_move

	thumb_func_start sub_806F06C
sub_806F06C: @ 806F06C
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 16
	lsrs r5, 16
	movs r0, 0x5
	bl audio_play
	ldr r1, _0806F0A8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F0AC
	str r1, [r0]
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_806E8D0
	ldr r0, _0806F0B0
	movs r1, 0x5
	bl CreateTask
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F0A8: .4byte 0x03004b20
_0806F0AC: .4byte TaskDummy
_0806F0B0: .4byte sub_806F0B4
	thumb_func_end sub_806F06C

	thumb_func_start sub_806F0B4
sub_806F0B4: @ 806F0B4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	adds r7, r6, 0
	ldr r5, _0806F114
	ldr r0, [r5]
	ldr r1, _0806F118
	bl GetMonNickname
	ldrh r0, [r5, 0x6]
	bl ItemIdToBattleMoveId
	movs r4, 0
	strh r0, [r5, 0x8]
	ldr r0, _0806F11C
	ldrh r2, [r5, 0x8]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _0806F120
	adds r1, r2
	bl StringCopy
	ldr r1, _0806F124
	adds r0, r5, r1
	strh r4, [r0]
	ldr r0, [r5]
	ldrh r1, [r5, 0x8]
	bl pokemon_has_move
	lsls r0, 24
	cmp r0, 0
	beq _0806F138
	ldr r4, _0806F128
	ldr r1, _0806F12C
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _0806F130
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F134
	b _0806F1B6
	.align 2, 0
_0806F114: .4byte 0x0201c000
_0806F118: .4byte 0x020231cc
_0806F11C: .4byte 0x020232cc
_0806F120: .4byte gMoveNames
_0806F124: .4byte 0xfffff282
_0806F128: .4byte 0x020234cc
_0806F12C: .4byte gUnknown_0840F49E
_0806F130: .4byte 0x03004b20
_0806F134: .4byte party_menu_link_mon_held_item_object
_0806F138:
	ldr r0, [r5]
	ldrb r1, [r5, 0x6]
	subs r1, 0x21
	lsls r1, 24
	lsrs r1, 24
	bl sub_8040374
	cmp r0, 0
	bne _0806F17C
	ldr r4, _0806F16C
	ldr r1, _0806F170
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _0806F174
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F178
	b _0806F1B6
	.align 2, 0
_0806F16C: .4byte 0x020234cc
_0806F170: .4byte gUnknown_0840F347
_0806F174: .4byte 0x03004b20
_0806F178: .4byte party_menu_link_mon_held_item_object
_0806F17C:
	ldr r0, [r5]
	ldrh r1, [r5, 0x8]
	bl GiveMoveToMon
	lsls r0, 16
	ldr r1, _0806F194
	cmp r0, r1
	beq _0806F198
	adds r0, r6, 0
	bl sub_806F1D0
	b _0806F1B8
	.align 2, 0
_0806F194: .4byte 0xffff0000
_0806F198:
	ldr r4, _0806F1C0
	ldr r1, _0806F1C4
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _0806F1C8
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F1CC
_0806F1B6:
	str r1, [r0]
_0806F1B8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F1C0: .4byte 0x020234cc
_0806F1C4: .4byte gUnknown_0840F37C
_0806F1C8: .4byte 0x03004b20
_0806F1CC: .4byte sub_806F358
	thumb_func_end sub_806F0B4

	thumb_func_start sub_806F1D0
sub_806F1D0: @ 806F1D0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0806F234
	ldr r5, _0806F238
	ldrh r2, [r5, 0x8]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _0806F23C
	adds r1, r2
	bl StringCopy
	ldr r4, _0806F240
	ldr r1, _0806F244
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r0, [r5]
	movs r1, 0x4
	bl sub_803FCD4
	ldr r1, _0806F248
	adds r0, r5, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0806F220
	ldrh r1, [r5, 0x6]
	movs r0, 0xA9
	lsls r0, 1
	cmp r1, r0
	bhi _0806F220
	adds r0, r1, 0
	movs r1, 0x1
	bl sub_80A9538
_0806F220:
	ldr r0, _0806F24C
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806F250
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F234: .4byte 0x020232cc
_0806F238: .4byte 0x0201c000
_0806F23C: .4byte gMoveNames
_0806F240: .4byte 0x020234cc
_0806F244: .4byte gUnknown_0840F338
_0806F248: .4byte 0xfffff282
_0806F24C: .4byte 0x03004b20
_0806F250: .4byte sub_806F254
	thumb_func_end sub_806F1D0

	thumb_func_start sub_806F254
sub_806F254: @ 806F254
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806F27C
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806F276
	ldr r0, _0806F280
	bl fanfare_play
	ldr r1, _0806F284
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F288
	str r1, [r0]
_0806F276:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F27C: .4byte 0x0202e8f6
_0806F280: .4byte 0x0000016f
_0806F284: .4byte 0x03004b20
_0806F288: .4byte sub_806F28C
	thumb_func_end sub_806F254

	thumb_func_start sub_806F28C
sub_806F28C: @ 806F28C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	bl task_is_not_running_overworld_fanfare
	lsls r0, 24
	cmp r0, 0
	beq _0806F2F2
	ldr r0, _0806F2D0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0806F2B2
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0806F2F2
_0806F2B2:
	ldr r4, _0806F2D4
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	bl sub_806DF60
	ldr r1, _0806F2D8
	adds r0, r4, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	bne _0806F2DC
	adds r0, r5, 0
	bl sub_8070C54
	b _0806F2F2
	.align 2, 0
_0806F2D0: .4byte 0x03001770
_0806F2D4: .4byte 0x0201c000
_0806F2D8: .4byte 0xfffff282
_0806F2DC:
	ldr r2, _0806F2F8
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, [r4, 0x10]
	str r1, [r0]
	adds r0, r6, 0
	bl DestroyTask
_0806F2F2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F2F8: .4byte 0x03004b20
	thumb_func_end sub_806F28C

	thumb_func_start sub_806F2FC
sub_806F2FC: @ 806F2FC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	ldr r0, _0806F32C
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806F34E
	ldr r4, _0806F330
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	bl sub_806DF60
	ldr r1, _0806F334
	adds r0, r4, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	bne _0806F338
	adds r0, r5, 0
	bl sub_8070C54
	b _0806F34E
	.align 2, 0
_0806F32C: .4byte 0x0202e8f6
_0806F330: .4byte 0x0201c000
_0806F334: .4byte 0xfffff282
_0806F338:
	ldr r2, _0806F354
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, [r4, 0x10]
	str r1, [r0]
	adds r0, r6, 0
	bl DestroyTask
_0806F34E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F354: .4byte 0x03004b20
	thumb_func_end sub_806F2FC

	thumb_func_start sub_806F358
sub_806F358: @ 806F358
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806F384
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806F37E
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _0806F388
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806F38C
	str r0, [r1]
_0806F37E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F384: .4byte 0x0202e8f6
_0806F388: .4byte 0x03004b20
_0806F38C: .4byte sub_806F390
	thumb_func_end sub_806F358

	thumb_func_start sub_806F390
sub_806F390: @ 806F390
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	bne _0806F3D4
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r0, _0806F3C8
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _0806F3CC
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F3D0
	str r1, [r0]
	b _0806F3F4
	.align 2, 0
_0806F3C8: .4byte gUnknown_0840F429
_0806F3CC: .4byte 0x03004b20
_0806F3D0: .4byte sub_806F44C
_0806F3D4:
	cmp r1, 0x1
	beq _0806F3E0
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806F3F4
_0806F3E0:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806F3EE
	movs r0, 0x5
	bl audio_play
_0806F3EE:
	adds r0, r5, 0
	bl sub_806F614
_0806F3F4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_806F390

	thumb_func_start sub_806F3FC
sub_806F3FC: @ 806F3FC
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0806F438
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0806F430
	ldr r0, _0806F43C
	ldr r4, _0806F440
	ldrb r1, [r4, 0x5]
	ldr r2, _0806F444
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _0806F448
	ldrh r4, [r4, 0x8]
	str r4, [sp]
	bl sub_809D9F0
	adds r0, r5, 0
	bl DestroyTask
_0806F430:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F438: .4byte 0x0202f388
_0806F43C: .4byte 0x03004360
_0806F440: .4byte 0x0201c000
_0806F444: .4byte 0x03004350
_0806F448: .4byte sub_808B564
	thumb_func_end sub_806F3FC

	thumb_func_start sub_806F44C
sub_806F44C: @ 806F44C
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806F484
	ldrb r1, [r0]
	cmp r1, 0
	bne _0806F47A
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0806F488
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F48C
	str r1, [r0]
_0806F47A:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F484: .4byte 0x0202e8f6
_0806F488: .4byte 0x03004b20
_0806F48C: .4byte sub_806F3FC
	thumb_func_end sub_806F44C

	thumb_func_start sub_806F490
sub_806F490: @ 806F490
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _0806F50C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0806F506
	ldr r1, _0806F510
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F514
	str r1, [r0]
	ldr r0, _0806F518
	ldrh r1, [r0]
	ldr r2, _0806F51C
	adds r0, r3, 0
	bl sub_806E8D0
	bl sub_809FA30
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r5, _0806F520
	ldr r0, [r5]
	adds r1, 0xD
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, [r5]
	ldr r1, _0806F524
	bl GetMonNickname
	ldr r0, _0806F528
	movs r1, 0xD
	muls r1, r4
	ldr r2, _0806F52C
	adds r1, r2
	bl StringCopy
	ldr r4, _0806F530
	ldr r1, _0806F534
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _0806F538
	movs r1, 0x5
	bl CreateTask
_0806F506:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F50C: .4byte 0x0202f388
_0806F510: .4byte 0x03004b20
_0806F514: .4byte TaskDummy
_0806F518: .4byte 0x0203855e
_0806F51C: .4byte sub_808B508
_0806F520: .4byte 0x0201c000
_0806F524: .4byte 0x020231cc
_0806F528: .4byte 0x020232cc
_0806F52C: .4byte gMoveNames
_0806F530: .4byte 0x020234cc
_0806F534: .4byte gUnknown_0840F44B
_0806F538: .4byte sub_806F53C
	thumb_func_end sub_806F490

	thumb_func_start sub_806F53C
sub_806F53C: @ 806F53C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0806F580
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806F57A
	ldr r4, _0806F584
	ldr r5, [r4]
	bl sub_809FA30
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_803DE34
	ldr r5, [r4]
	ldrh r4, [r4, 0x8]
	bl sub_809FA30
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl SetMonMoveSlot
	adds r0, r6, 0
	bl sub_806F1D0
_0806F57A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F580: .4byte 0x0202e8f6
_0806F584: .4byte 0x0201c000
	thumb_func_end sub_806F53C

	thumb_func_start sub_806F588
sub_806F588: @ 806F588
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _0806F5E8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0806F5E0
	ldr r1, _0806F5EC
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F5F0
	str r1, [r0]
	ldr r0, _0806F5F4
	ldrh r1, [r0]
	ldr r2, _0806F5F8
	adds r0, r3, 0
	bl sub_806E8D0
	ldr r0, _0806F5FC
	ldr r1, _0806F600
	ldrh r2, [r1, 0x8]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _0806F604
	adds r1, r2
	bl StringCopy
	ldr r4, _0806F608
	ldr r1, _0806F60C
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _0806F610
	movs r1, 0x5
	bl CreateTask
_0806F5E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F5E8: .4byte 0x0202f388
_0806F5EC: .4byte 0x03004b20
_0806F5F0: .4byte TaskDummy
_0806F5F4: .4byte 0x0203855e
_0806F5F8: .4byte sub_808B508
_0806F5FC: .4byte 0x020232cc
_0806F600: .4byte 0x0201c000
_0806F604: .4byte gMoveNames
_0806F608: .4byte 0x020234cc
_0806F60C: .4byte gUnknown_0840F3F0
_0806F610: .4byte sub_806F67C
	thumb_func_end sub_806F588

	thumb_func_start sub_806F614
sub_806F614: @ 806F614
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r0, _0806F660
	ldr r1, _0806F664
	ldrh r2, [r1, 0x8]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _0806F668
	adds r1, r2
	bl StringCopy
	ldr r4, _0806F66C
	ldr r1, _0806F670
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _0806F674
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F678
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F660: .4byte 0x020232cc
_0806F664: .4byte 0x0201c000
_0806F668: .4byte gMoveNames
_0806F66C: .4byte 0x020234cc
_0806F670: .4byte gUnknown_0840F3F0
_0806F674: .4byte 0x03004b20
_0806F678: .4byte sub_806F67C
	thumb_func_end sub_806F614

	thumb_func_start sub_806F67C
sub_806F67C: @ 806F67C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806F6A8
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806F6A2
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _0806F6AC
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806F6B0
	str r0, [r1]
_0806F6A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F6A8: .4byte 0x0202e8f6
_0806F6AC: .4byte 0x03004b20
_0806F6B0: .4byte sub_806F6B4
	thumb_func_end sub_806F67C

	thumb_func_start sub_806F6B4
sub_806F6B4: @ 806F6B4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	bne _0806F730
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r4, _0806F710
	ldr r0, [r4]
	ldr r1, _0806F714
	bl GetMonNickname
	ldr r0, _0806F718
	ldrh r2, [r4, 0x8]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _0806F71C
	adds r1, r2
	bl StringCopy
	ldr r4, _0806F720
	ldr r1, _0806F724
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _0806F728
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F72C
	b _0806F78E
	.align 2, 0
_0806F710: .4byte 0x0201c000
_0806F714: .4byte 0x020231cc
_0806F718: .4byte 0x020232cc
_0806F71C: .4byte gMoveNames
_0806F720: .4byte 0x020234cc
_0806F724: .4byte gUnknown_0840F409
_0806F728: .4byte 0x03004b20
_0806F72C: .4byte sub_806F2FC
_0806F730:
	cmp r1, 0x1
	beq _0806F73C
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806F790
_0806F73C:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806F74A
	movs r0, 0x5
	bl audio_play
_0806F74A:
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r4, _0806F798
	ldr r0, [r4]
	ldr r1, _0806F79C
	bl GetMonNickname
	ldr r0, _0806F7A0
	ldrh r2, [r4, 0x8]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _0806F7A4
	adds r1, r2
	bl StringCopy
	ldr r4, _0806F7A8
	ldr r1, _0806F7AC
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _0806F7B0
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F7B4
_0806F78E:
	str r1, [r0]
_0806F790:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F798: .4byte 0x0201c000
_0806F79C: .4byte 0x020231cc
_0806F7A0: .4byte 0x020232cc
_0806F7A4: .4byte gMoveNames
_0806F7A8: .4byte 0x020234cc
_0806F7AC: .4byte gUnknown_0840F37C
_0806F7B0: .4byte 0x03004b20
_0806F7B4: .4byte sub_806F358
	thumb_func_end sub_806F6B4

	thumb_func_start sub_806F7B8
sub_806F7B8: @ 806F7B8
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0
	ldr r3, _0806F7D4
_0806F7C2:
	adds r0, r1, 0
	adds r0, 0x32
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _0806F7D8
	movs r0, 0x1
	b _0806F7E4
	.align 2, 0
_0806F7D4: .4byte gUnknown_08376504
_0806F7D8:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x7
	bls _0806F7C2
	movs r0, 0
_0806F7E4:
	pop {r1}
	bx r1
	thumb_func_end sub_806F7B8

	thumb_func_start sub_806F7E8
sub_806F7E8: @ 806F7E8
	push {r4-r6,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r3, r0, 2
	adds r3, r0
	lsls r3, 3
	ldr r0, _0806F898
	adds r3, r0
	movs r0, 0x14
	ldrsh r1, [r3, r0]
	str r1, [r5]
	movs r4, 0x16
	ldrsh r0, [r3, r4]
	str r0, [r5, 0x4]
	movs r4, 0x18
	ldrsh r0, [r3, r4]
	lsls r2, 24
	asrs r2, 24
	muls r0, r2
	str r0, [r5, 0x8]
	movs r0, 0x80
	lsls r0, 1
	str r0, [r5, 0x10]
	ldr r6, _0806F89C
	ldr r2, _0806F8A0
	adds r0, r6, r2
	movs r4, 0
	ldrsh r0, [r0, r4]
	bl sub_8046200
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r2, 0
	cmp r2, 0x2
	bls _0806F83E
	ldrb r0, [r5, 0xC]
	movs r1, 0x20
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r5, 0xC]
_0806F83E:
	cmp r2, 0x2
	bne _0806F850
	ldrb r0, [r5, 0xC]
	movs r1, 0x20
	negs r1, r1
	ands r1, r0
	movs r0, 0x5
	orrs r1, r0
	strb r1, [r5, 0xC]
_0806F850:
	cmp r3, 0x1
	bhi _0806F862
	ldrb r0, [r5, 0xC]
	movs r1, 0x20
	negs r1, r1
	ands r1, r0
	movs r0, 0x6
	orrs r1, r0
	strb r1, [r5, 0xC]
_0806F862:
	ldr r4, _0806F8A4
	bl battle_type_is_double
	movs r2, 0x80
	lsls r2, 5
	adds r1, r6, r2
	ldrb r2, [r1, 0x5]
	lsls r2, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r2, r1
	adds r2, r4
	ldr r2, [r2]
	ldr r4, _0806F8A8
	adds r1, r6, r4
	adds r0, r5, 0
	movs r3, 0
	bl sub_80460C8
	lsls r0, 16
	asrs r0, 16
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806F898: .4byte 0x03004b28
_0806F89C: .4byte 0x0201b000
_0806F8A0: .4byte 0x00000282
_0806F8A4: .4byte gUnknown_08376858
_0806F8A8: .4byte 0x0000100c
	thumb_func_end sub_806F7E8

	thumb_func_start sub_806F8AC
sub_806F8AC: @ 806F8AC
	push {r4-r7,lr}
	sub sp, 0x18
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0x1
	negs r4, r4
	adds r0, r6, 0
	mov r1, sp
	adds r2, r4, 0
	bl sub_806F7E8
	ldr r1, _0806F8F4
	ldr r2, _0806F8F8
	adds r5, r1, r2
	strh r0, [r5]
	lsls r0, 16
	asrs r0, 16
	cmp r0, r4
	beq _0806F8D4
	b _0806F9F0
_0806F8D4:
	movs r0, 0x80
	lsls r0, 5
	adds r1, r0
	movs r0, 0
	str r0, [r1, 0xC]
	ldr r0, [sp, 0x8]
	negs r3, r0
	ldr r2, [sp, 0x4]
	adds r0, r3, r2
	ldr r1, [sp]
	cmp r0, r1
	ble _0806F8FC
	subs r1, r2
	add r0, sp, 0x14
	strh r1, [r0]
	b _0806F900
	.align 2, 0
_0806F8F4: .4byte 0x0201b000
_0806F8F8: .4byte 0x00000282
_0806F8FC:
	add r0, sp, 0x14
	strh r3, [r0]
_0806F900:
	adds r5, r0, 0
	ldr r1, _0806F940
	ldrh r0, [r5]
	negs r0, r0
	str r0, [r1]
	ldr r0, _0806F944
	ldr r0, [r0]
	ldr r1, _0806F948
	bl GetMonNickname
	ldr r0, _0806F94C
	ldrh r1, [r5]
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r2, _0806F950
	lsls r1, r6, 2
	adds r0, r1, r6
	lsls r0, 3
	adds r0, r2
	movs r2, 0x24
	ldrsh r0, [r0, r2]
	adds r7, r1, 0
	cmp r0, 0
	bne _0806F95C
	ldr r0, _0806F954
	ldr r1, _0806F958
	bl StringExpandPlaceholders
	b _0806F964
	.align 2, 0
_0806F940: .4byte 0x02024bec
_0806F944: .4byte 0x0201c000
_0806F948: .4byte 0x020231cc
_0806F94C: .4byte 0x020232cc
_0806F950: .4byte 0x03004b20
_0806F954: .4byte 0x020234cc
_0806F958: .4byte gUnknown_0840F4B5
_0806F95C:
	ldr r0, _0806F9D4
	ldr r1, _0806F9D8
	bl StringExpandPlaceholders
_0806F964:
	ldr r4, _0806F9DC
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	bl sub_806DDA0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	bl sub_806D84C
	bl battle_type_is_double
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldrb r1, [r4, 0x5]
	lsls r1, 1
	adds r0, r1
	ldr r1, _0806F9E0
	adds r0, r1
	movs r1, 0x7
	bl task_pc_turn_off
	ldr r0, _0806F9E4
	adds r1, r4, r0
	movs r0, 0x2
	strb r0, [r1]
	ldr r0, _0806F9D4
	movs r1, 0x1
	bl sub_806E834
	ldr r1, [sp, 0x4]
	ldrh r0, [r5]
	adds r0, r1
	strh r0, [r5]
	ldr r0, [r4]
	movs r1, 0x39
	adds r2, r5, 0
	bl SetMonData
	ldrh r0, [r4, 0x6]
	movs r1, 0x1
	bl sub_80A9538
	bl sub_8032638
	ldr r1, _0806F9E8
	adds r0, r7, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F9EC
	str r1, [r0]
	b _0806FA10
	.align 2, 0
_0806F9D4: .4byte 0x020234cc
_0806F9D8: .4byte gUnknown_0840F566
_0806F9DC: .4byte 0x0201c000
_0806F9E0: .4byte gUnknown_083769A8
_0806F9E4: .4byte 0xfffff261
_0806F9E8: .4byte 0x03004b20
_0806F9EC: .4byte sub_806FB44
_0806F9F0:
	movs r2, 0x80
	lsls r2, 5
	adds r0, r1, r2
	ldrb r4, [r0, 0x5]
	bl battle_type_is_double
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r5]
	ldr r3, [sp]
	lsls r3, 16
	lsrs r3, 16
	adds r0, r4, 0
	bl sub_806E420
_0806FA10:
	add sp, 0x18
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806F8AC

	thumb_func_start sub_806FA18
sub_806FA18: @ 806FA18
	push {r4-r7,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	mov r1, sp
	movs r2, 0x1
	bl sub_806F7E8
	ldr r6, _0806FAC4
	ldr r1, _0806FAC8
	adds r7, r6, r1
	strh r0, [r7]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _0806FAE4
	movs r0, 0x1
	bl audio_play
	movs r0, 0x80
	lsls r0, 5
	adds r4, r6, r0
	movs r0, 0
	str r0, [r4, 0xC]
	ldr r2, _0806FACC
	lsls r3, r5, 2
	adds r3, r5
	lsls r3, 3
	adds r5, r3, r2
	ldrh r0, [r5, 0x1E]
	ldrh r1, [r5, 0x20]
	subs r0, r1
	strh r0, [r5, 0x1E]
	ldr r0, [r4]
	adds r2, r3
	adds r2, 0x1E
	movs r1, 0x39
	bl SetMonData
	ldrb r0, [r4, 0x4]
	ldr r1, _0806FAD0
	adds r6, r1
	ldrb r1, [r6, 0x1]
	bl sub_806DDA0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	bl sub_806D84C
	ldr r2, _0806FAD4
	ldrb r1, [r6, 0x2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x2E]
	strb r0, [r4, 0x5]
	ldrb r1, [r4, 0x5]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0806FAD8
	adds r0, r1
	str r0, [r4]
	movs r1, 0x3A
	bl GetMonData
	strh r0, [r5, 0x1C]
	ldr r0, [r4]
	movs r1, 0x39
	bl GetMonData
	strh r0, [r5, 0x1E]
	ldr r0, _0806FADC
	str r0, [r4, 0xC]
	ldr r0, [r4, 0x10]
	str r0, [r4, 0x14]
	ldr r0, _0806FAE0
	str r0, [r5]
	ldrh r0, [r5, 0x1E]
	strh r0, [r7]
	b _0806FB04
	.align 2, 0
_0806FAC4: .4byte 0x0201b000
_0806FAC8: .4byte 0x00000282
_0806FACC: .4byte 0x03004b20
_0806FAD0: .4byte 0xfffe6000
_0806FAD4: .4byte 0x02020004
_0806FAD8: .4byte 0x03004360
_0806FADC: .4byte 0xffff8000
_0806FAE0: .4byte sub_806F8AC
_0806FAE4:
	movs r1, 0x80
	lsls r1, 5
	adds r0, r6, r1
	ldrb r4, [r0, 0x5]
	bl battle_type_is_double
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r7]
	ldr r3, [sp]
	lsls r3, 16
	lsrs r3, 16
	adds r0, r4, 0
	bl sub_806E420
_0806FB04:
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806FA18

	thumb_func_start sub_806FB0C
sub_806FB0C: @ 806FB0C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806FB38
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806FB32
	ldr r3, _0806FB3C
	ldr r2, _0806FB40
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	ldr r1, [r2, 0x10]
	str r1, [r0]
	adds r0, r4, 0
	bl DestroyTask
_0806FB32:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806FB38: .4byte 0x0202e8f6
_0806FB3C: .4byte 0x03004b20
_0806FB40: .4byte 0x0201c000
	thumb_func_end sub_806FB0C

	thumb_func_start sub_806FB44
sub_806FB44: @ 806FB44
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806FB70
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806FB6A
	ldr r3, _0806FB74
	ldr r2, _0806FB78
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	ldr r1, [r2, 0x14]
	str r1, [r0]
	adds r0, r4, 0
	bl DestroyTask
_0806FB6A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806FB70: .4byte 0x0202e8f6
_0806FB74: .4byte 0x03004b20
_0806FB78: .4byte 0x0201c000
	thumb_func_end sub_806FB44

	thumb_func_start sub_806FB7C
sub_806FB7C: @ 806FB7C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _0806FB90
	ldr r0, _0806FB8C
	b _0806FB9A
	.align 2, 0
_0806FB8C: .4byte 0x02028daa
_0806FB90:
	ldr r1, _0806FBA8
	subs r0, 0xD
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
_0806FB9A:
	ldrb r1, [r0, 0x4]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _0806FBAC
	movs r0, 0
	b _0806FBAE
	.align 2, 0
_0806FBA8: .4byte gItemEffectTable
_0806FBAC:
	movs r0, 0x1
_0806FBAE:
	pop {r1}
	bx r1
	thumb_func_end sub_806FB7C

	thumb_func_start sub_806FBB4
sub_806FBB4: @ 806FBB4
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_806E168
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806E2C0
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_806FBB4

	thumb_func_start GetMedicineItemEffectMessage
GetMedicineItemEffectMessage: @ 806FBD0
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl sub_8070E48
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x3
	cmp r0, 0x12
	bls _0806FBE6
	b _0806FD7C
_0806FBE6:
	lsls r0, 2
	ldr r1, _0806FBF0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806FBF0: .4byte _0806FBF4
	.align 2, 0
_0806FBF4:
	.4byte _0806FC40
	.4byte _0806FC54
	.4byte _0806FC68
	.4byte _0806FC7C
	.4byte _0806FC90
	.4byte _0806FCA4
	.4byte _0806FCB8
	.4byte _0806FD7C
	.4byte _0806FCCC
	.4byte _0806FCF0
	.4byte _0806FCE0
	.4byte _0806FD20
	.4byte _0806FD30
	.4byte _0806FD10
	.4byte _0806FD00
	.4byte _0806FD7C
	.4byte _0806FD54
	.4byte _0806FD54
	.4byte _0806FD68
_0806FC40:
	ldr r0, _0806FC4C
	ldr r1, _0806FC50
	bl StringExpandPlaceholders
	b _0806FD84
	.align 2, 0
_0806FC4C: .4byte 0x020234cc
_0806FC50: .4byte gUnknown_0840F4DA
_0806FC54:
	ldr r0, _0806FC60
	ldr r1, _0806FC64
	bl StringExpandPlaceholders
	b _0806FD84
	.align 2, 0
_0806FC60: .4byte 0x020234cc
_0806FC64: .4byte gUnknown_0840F518
_0806FC68:
	ldr r0, _0806FC74
	ldr r1, _0806FC78
	bl StringExpandPlaceholders
	b _0806FD84
	.align 2, 0
_0806FC74: .4byte 0x020234cc
_0806FC78: .4byte gUnknown_0840F526
_0806FC7C:
	ldr r0, _0806FC88
	ldr r1, _0806FC8C
	bl StringExpandPlaceholders
	b _0806FD84
	.align 2, 0
_0806FC88: .4byte 0x020234cc
_0806FC8C: .4byte gUnknown_0840F53E
_0806FC90:
	ldr r0, _0806FC9C
	ldr r1, _0806FCA0
	bl StringExpandPlaceholders
	b _0806FD84
	.align 2, 0
_0806FC9C: .4byte 0x020234cc
_0806FCA0: .4byte gUnknown_0840F4FB
_0806FCA4:
	ldr r0, _0806FCB0
	ldr r1, _0806FCB4
	bl StringExpandPlaceholders
	b _0806FD84
	.align 2, 0
_0806FCB0: .4byte 0x020234cc
_0806FCB4: .4byte gUnknown_0840F5D7
_0806FCB8:
	ldr r0, _0806FCC4
	ldr r1, _0806FCC8
	bl StringExpandPlaceholders
	b _0806FD84
	.align 2, 0
_0806FCC4: .4byte 0x020234cc
_0806FCC8: .4byte gUnknown_0840F5FA
_0806FCCC:
	ldr r0, _0806FCD8
	ldr r1, _0806FCDC
	bl StringExpandPlaceholders
	b _0806FD84
	.align 2, 0
_0806FCD8: .4byte 0x020234cc
_0806FCDC: .4byte gUnknown_0840F57C
_0806FCE0:
	ldr r0, _0806FCE8
	ldr r1, _0806FCEC
	b _0806FD34
	.align 2, 0
_0806FCE8: .4byte 0x020232cc
_0806FCEC: .4byte gUnknown_0840EF72
_0806FCF0:
	ldr r0, _0806FCF8
	ldr r1, _0806FCFC
	b _0806FD34
	.align 2, 0
_0806FCF8: .4byte 0x020232cc
_0806FCFC: .4byte gUnknown_0840F7C6
_0806FD00:
	ldr r0, _0806FD08
	ldr r1, _0806FD0C
	b _0806FD34
	.align 2, 0
_0806FD08: .4byte 0x020232cc
_0806FD0C: .4byte gUnknown_0840F7CD
_0806FD10:
	ldr r0, _0806FD18
	ldr r1, _0806FD1C
	b _0806FD34
	.align 2, 0
_0806FD18: .4byte 0x020232cc
_0806FD1C: .4byte gUnknown_0840F7E5
_0806FD20:
	ldr r0, _0806FD28
	ldr r1, _0806FD2C
	b _0806FD34
	.align 2, 0
_0806FD28: .4byte 0x020232cc
_0806FD2C: .4byte gUnknown_0840EF75
_0806FD30:
	ldr r0, _0806FD44
	ldr r1, _0806FD48
_0806FD34:
	bl StringCopy
	ldr r0, _0806FD4C
	ldr r1, _0806FD50
	bl StringExpandPlaceholders
	b _0806FD84
	.align 2, 0
_0806FD44: .4byte 0x020232cc
_0806FD48: .4byte gUnknown_0840EF7D
_0806FD4C: .4byte 0x020234cc
_0806FD50: .4byte gUnknown_0840F5C1
_0806FD54:
	ldr r0, _0806FD60
	ldr r1, _0806FD64
	bl StringExpandPlaceholders
	b _0806FD84
	.align 2, 0
_0806FD60: .4byte 0x020234cc
_0806FD64: .4byte gUnknown_0840F591
_0806FD68:
	ldr r0, _0806FD74
	ldr r1, _0806FD78
	bl StringExpandPlaceholders
	b _0806FD84
	.align 2, 0
_0806FD74: .4byte 0x020234cc
_0806FD78: .4byte gUnknown_0840F553
_0806FD7C:
	ldr r0, _0806FD88
	ldr r1, _0806FD8C
	bl StringExpandPlaceholders
_0806FD84:
	pop {r0}
	bx r0
	.align 2, 0
_0806FD88: .4byte 0x020234cc
_0806FD8C: .4byte gUnknown_0840EF85
	thumb_func_end GetMedicineItemEffectMessage

	thumb_func_start sub_806FD90
sub_806FD90: @ 806FD90
	push {r4,lr}
	adds r4, r0, 0
	lsls r0, r1, 16
	lsrs r0, 16
	bl sub_8070E48
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD
	bne _0806FDBC
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	ldr r1, _0806FDB8
	cmp r0, r1
	bne _0806FDBC
	movs r0, 0x1
	b _0806FDBE
	.align 2, 0
_0806FDB8: .4byte 0x0000012f
_0806FDBC:
	movs r0, 0
_0806FDBE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806FD90

	thumb_func_start ExecuteTableBasedItemEffect__
ExecuteTableBasedItemEffect__: @ 806FDC4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r0, _0806FDF0
	ldr r1, _0806FDF4
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0806FDFC
	movs r0, 0x64
	muls r0, r3
	ldr r1, _0806FDF8
	adds r0, r1
	adds r1, r5, 0
	adds r2, r3, 0
	b _0806FE16
	.align 2, 0
_0806FDF0: .4byte 0x03001770
_0806FDF4: .4byte 0x0000043d
_0806FDF8: .4byte 0x03004360
_0806FDFC:
	movs r0, 0x64
	adds r4, r3, 0
	muls r4, r0
	ldr r0, _0806FE28
	adds r4, r0
	adds r0, r3, 0
	bl sub_8094C20
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
_0806FE16:
	adds r3, r6, 0
	bl ExecuteTableBasedItemEffect_
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806FE28: .4byte 0x03004360
	thumb_func_end ExecuteTableBasedItemEffect__

	thumb_func_start sub_806FE2C
sub_806FE2C: @ 806FE2C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r4, r0, 0
	adds r5, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 16
	lsrs r6, r1, 16
	movs r0, 0
	mov r9, r0
	ldr r1, _0806FED4
	mov r10, r1
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	add r1, r10
	ldr r0, _0806FED8
	str r0, [r1]
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_806E8D0
	ldr r5, _0806FEDC
	ldr r0, [r5]
	adds r1, r6, 0
	bl sub_806FD90
	lsls r0, 24
	cmp r0, 0
	bne _0806FEE0
	adds r0, r6, 0
	bl sub_806FB7C
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r2, r7, 2
	mov r8, r2
	cmp r0, 0x1
	bne _0806FEC2
	ldr r0, [r5]
	movs r1, 0x3A
	bl GetMonData
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	mov r2, r10
	adds r4, r1, r2
	strh r0, [r4, 0x1C]
	ldr r0, [r5]
	movs r1, 0x39
	bl GetMonData
	strh r0, [r4, 0x1E]
	movs r3, 0x1C
	ldrsh r1, [r4, r3]
	lsls r0, 16
	asrs r0, 16
	cmp r1, r0
	bne _0806FEC2
	movs r0, 0
	mov r9, r0
	mov r1, r9
	strh r1, [r4, 0x1C]
	strh r1, [r4, 0x1E]
_0806FEC2:
	ldr r0, _0806FEDC
	ldrb r0, [r0, 0x5]
	adds r1, r6, 0
	movs r2, 0
	bl ExecuteTableBasedItemEffect__
	lsls r0, 24
	lsrs r0, 24
	b _0806FEE6
	.align 2, 0
_0806FED4: .4byte 0x03004b20
_0806FED8: .4byte TaskDummy
_0806FEDC: .4byte 0x0201c000
_0806FEE0:
	movs r0, 0x1
	lsls r2, r7, 2
	mov r8, r2
_0806FEE6:
	cmp r0, 0
	beq _0806FF14
	ldr r1, _0806FF08
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x5
	bl audio_play
	ldr r0, _0806FF0C
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _0806FF10
	mov r3, r8
	adds r0, r3, r7
	b _08070002
	.align 2, 0
_0806FF08: .4byte 0x0202e8f4
_0806FF0C: .4byte gUnknown_0840EF85
_0806FF10: .4byte 0x03004b20
_0806FF14:
	ldr r1, _0806FF30
	movs r0, 0x1
	strb r0, [r1]
	adds r0, r6, 0
	bl IsBlueYellowRedFlute
	lsls r0, 24
	cmp r0, 0
	bne _0806FF34
	movs r0, 0x1
	bl audio_play
	b _0806FF3A
	.align 2, 0
_0806FF30: .4byte 0x0202e8f4
_0806FF34:
	movs r0, 0x75
	bl audio_play
_0806FF3A:
	ldr r4, _0806FF88
	ldr r0, [r4]
	bl sub_80A1CD8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	beq _0806FF4E
	cmp r0, 0
	bne _0806FF56
_0806FF4E:
	ldr r0, [r4]
	ldrb r1, [r4, 0x5]
	bl sub_806FBB4
_0806FF56:
	mov r0, r9
	cmp r0, 0x1
	bne _0806FFC8
	ldr r4, _0806FF88
	ldr r0, [r4]
	movs r1, 0x39
	bl GetMonData
	ldr r2, _0806FF8C
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r2, r1, r2
	ldrh r1, [r2, 0x1E]
	subs r0, r1
	strh r0, [r2, 0x20]
	ldr r0, _0806FF90
	str r0, [r4, 0xC]
	movs r1, 0x1E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _0806FF94
	mov r3, r9
	strh r3, [r2, 0x24]
	b _0806FF98
	.align 2, 0
_0806FF88: .4byte 0x0201c000
_0806FF8C: .4byte 0x03004b20
_0806FF90: .4byte 0xffff8000
_0806FF94:
	movs r0, 0
	strh r0, [r2, 0x24]
_0806FF98:
	ldr r2, _0806FFB8
	ldr r0, [r2, 0x10]
	str r0, [r2, 0x14]
	ldr r1, _0806FFBC
	mov r3, r8
	adds r0, r3, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806FFC0
	str r1, [r0]
	ldrh r0, [r0, 0x1E]
	ldr r1, _0806FFC4
	adds r2, r1
	strh r0, [r2]
	b _0807000A
	.align 2, 0
_0806FFB8: .4byte 0x0201c000
_0806FFBC: .4byte 0x03004b20
_0806FFC0: .4byte sub_806F8AC
_0806FFC4: .4byte 0xfffff282
_0806FFC8:
	ldr r4, _08070018
	ldr r0, [r4]
	ldr r1, _0807001C
	bl GetMonNickname
	adds r0, r6, 0
	bl IsBlueYellowRedFlute
	lsls r0, 24
	cmp r0, 0
	bne _0806FFE6
	adds r0, r6, 0
	movs r1, 0x1
	bl sub_80A9538
_0806FFE6:
	adds r0, r6, 0
	bl GetMedicineItemEffectMessage
	ldrb r0, [r4, 0x5]
	ldr r1, [r4]
	bl sub_806E07C
	ldr r0, _08070020
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _08070024
	mov r2, r8
	adds r0, r2, r7
_08070002:
	lsls r0, 3
	adds r0, r1
	ldr r1, _08070028
	str r1, [r0]
_0807000A:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070018: .4byte 0x0201c000
_0807001C: .4byte 0x020231cc
_08070020: .4byte 0x020234cc
_08070024: .4byte 0x03004b20
_08070028: .4byte sub_806FB0C
	thumb_func_end sub_806FE2C

	thumb_func_start IsBlueYellowRedFlute
IsBlueYellowRedFlute: @ 807002C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x27
	beq _0807003E
	cmp r0, 0x29
	beq _0807003E
	cmp r0, 0x28
	bne _08070042
_0807003E:
	movs r0, 0x1
	b _08070044
_08070042:
	movs r0, 0
_08070044:
	pop {r1}
	bx r1
	thumb_func_end IsBlueYellowRedFlute

	thumb_func_start sub_8070048
sub_8070048: @ 8070048
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08070078
	str r2, [r3, 0x10]
	movs r4, 0
	strb r0, [r3, 0x4]
	movs r2, 0
	strh r1, [r3, 0x6]
	strb r2, [r3, 0x5]
	ldr r1, _0807007C
	str r1, [r3, 0x14]
	ldr r2, _08070080
	adds r1, r3, r2
	strh r4, [r1]
	ldr r1, _08070084
	adds r3, r1
	strh r4, [r3]
	bl sub_8070088
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08070078: .4byte 0x0201c000
_0807007C: .4byte sub_80701DC
_08070080: .4byte 0xfffff27e
_08070084: .4byte 0xfffff280
	thumb_func_end sub_8070048

	thumb_func_start sub_8070088
sub_8070088: @ 8070088
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08070120
	mov r10, r1
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	mov r2, r10
	adds r7, r1, r2
	ldr r5, _08070124
	str r5, [r7]
	ldr r4, _08070128
	ldrb r0, [r4, 0x5]
	movs r1, 0x64
	mov r9, r1
	mov r2, r9
	muls r2, r0
	adds r0, r2, 0
	ldr r1, _0807012C
	mov r8, r1
	add r0, r8
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08070118
	adds r0, r5, 0
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	str r0, [sp]
	mov r0, r10
	adds r0, 0x8
	ldr r2, [sp]
	adds r6, r2, r0
	ldrb r0, [r4, 0x5]
	mov r1, r9
	muls r1, r0
	adds r0, r1, 0
	add r0, r8
	str r0, [r4]
	movs r1, 0x3A
	bl GetMonData
	strh r0, [r6, 0x14]
	ldr r0, [r4]
	movs r1, 0x39
	bl GetMonData
	strh r0, [r6, 0x16]
	ldrb r0, [r4, 0x5]
	ldrh r1, [r4, 0x6]
	movs r2, 0
	bl ExecuteTableBasedItemEffect__
	lsls r0, 24
	cmp r0, 0
	beq _08070134
	adds r0, r5, 0
	bl DestroyTask
_08070118:
	ldr r0, _08070130
	str r0, [r7]
	b _080701B0
	.align 2, 0
_08070120: .4byte 0x03004b20
_08070124: .4byte TaskDummy
_08070128: .4byte 0x0201c000
_0807012C: .4byte 0x03004360
_08070130: .4byte sub_80701DC
_08070134:
	ldr r1, _080701C0
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0x3
	movs r1, 0xE
	movs r2, 0x1A
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0x1
	bl audio_play
	ldr r0, [r4]
	ldrb r1, [r4, 0x5]
	bl sub_806FBB4
	bl battle_type_is_double
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldrb r1, [r4, 0x5]
	lsls r1, 1
	adds r0, r1
	ldr r1, _080701C4
	adds r0, r1
	movs r1, 0x9
	bl task_pc_turn_off
	ldr r2, _080701C8
	adds r1, r4, r2
	movs r0, 0x2
	strb r0, [r1]
	ldr r0, [r4]
	movs r1, 0x39
	bl GetMonData
	ldrh r1, [r6, 0x16]
	subs r0, r1
	strh r0, [r6, 0x18]
	movs r0, 0x1
	strh r0, [r6, 0x1C]
	ldr r1, _080701CC
	adds r0, r4, r1
	movs r1, 0x1
	strh r1, [r0]
	ldr r2, _080701D0
	adds r0, r4, r2
	strh r1, [r0]
	ldrh r1, [r6, 0x16]
	adds r2, 0x2
	adds r0, r4, r2
	strh r1, [r0]
	ldr r0, _080701D4
	str r0, [r4, 0xC]
	ldr r1, [sp]
	add r1, r10
	ldr r0, _080701D8
	str r0, [r1]
_080701B0:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080701C0: .4byte 0x0202e8f4
_080701C4: .4byte gUnknown_083769A8
_080701C8: .4byte 0xfffff261
_080701CC: .4byte 0xfffff27e
_080701D0: .4byte 0xfffff280
_080701D4: .4byte 0xffff8000
_080701D8: .4byte sub_806F8AC
	thumb_func_end sub_8070088

	thumb_func_start sub_80701DC
sub_80701DC: @ 80701DC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _08070280
	ldr r0, _08070284
	adds r7, r6, r0
	movs r1, 0
	ldrsh r0, [r7, r1]
	cmp r0, 0x1
	bne _0807023E
	movs r0, 0x80
	lsls r0, 5
	adds r4, r6, r0
	ldrh r0, [r4, 0x6]
	movs r1, 0x1
	bl sub_80A9424
	ldrb r1, [r4, 0x5]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08070288
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0807023A
	bl battle_type_is_double
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldrb r1, [r4, 0x5]
	lsls r1, 1
	adds r0, r1
	ldr r1, _0807028C
	adds r0, r1
	movs r1, 0x3
	bl task_pc_turn_off
	ldr r0, _08070290
	adds r1, r6, r0
	movs r0, 0x2
	strb r0, [r1]
_0807023A:
	movs r0, 0
	strh r0, [r7]
_0807023E:
	ldr r4, _08070294
	ldrb r0, [r4, 0x5]
	adds r0, 0x1
	strb r0, [r4, 0x5]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	bne _080702D8
	ldr r1, _08070298
	movs r0, 0
	strb r0, [r1]
	ldr r1, _0807029C
	adds r0, r4, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080702B0
	ldr r1, _080702A0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080702A4
	str r1, [r0]
	ldr r0, _080702A8
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _080702AC
	movs r1, 0x8
	bl CreateTask
	b _080702C6
	.align 2, 0
_08070280: .4byte 0x0201b000
_08070284: .4byte 0x0000027e
_08070288: .4byte 0x03004360
_0807028C: .4byte gUnknown_083769A8
_08070290: .4byte 0x00000261
_08070294: .4byte 0x0201c000
_08070298: .4byte 0x0202e8f4
_0807029C: .4byte 0xfffff280
_080702A0: .4byte 0x03004b20
_080702A4: .4byte TaskDummy
_080702A8: .4byte gUnknown_0840EF85
_080702AC: .4byte sub_806FB0C
_080702B0:
	ldrh r0, [r4, 0x6]
	movs r1, 0x1
	bl sub_80A9538
	ldr r1, _080702D0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, [r4, 0x10]
	str r1, [r0]
_080702C6:
	ldr r1, _080702D4
	movs r0, 0
	strb r0, [r1]
	b _080702DE
	.align 2, 0
_080702D0: .4byte 0x03004b20
_080702D4: .4byte 0x03005ce0
_080702D8:
	adds r0, r5, 0
	bl sub_8070088
_080702DE:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80701DC

	thumb_func_start sub_80702E4
sub_80702E4: @ 80702E4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r6, 0
	movs r0, 0x13
	movs r1, 0xA
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	movs r5, 0
	movs r0, 0x64
	adds r7, r4, 0
	muls r7, r0
	ldr r0, _0807036C
	mov r8, r0
_0807030C:
	adds r1, r5, 0
	adds r1, 0xD
	mov r2, r8
	adds r0, r7, r2
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0xD
	muls r0, r4
	ldr r1, _08070370
	adds r0, r1
	lsls r2, r5, 25
	movs r1, 0xB0
	lsls r1, 20
	adds r2, r1
	lsrs r2, 24
	movs r1, 0x14
	bl MenuPrint
	cmp r4, 0
	beq _08070340
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08070340:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _0807030C
	movs r0, 0
	str r0, [sp]
	movs r0, 0x9
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x14
	movs r2, 0xB
	adds r3, r6, 0
	bl InitMenu
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807036C: .4byte 0x03004360
_08070370: .4byte gMoveNames
	thumb_func_end sub_80702E4

	thumb_func_start sub_8070374
sub_8070374: @ 8070374
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	adds r4, r2, 0
	ldr r0, _08070398
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0807039C
	movs r0, 0x5
	bl audio_play
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	b _080703E4
	.align 2, 0
_08070398: .4byte 0x03001770
_0807039C:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080703B2
	movs r0, 0x5
	bl audio_play
	movs r0, 0x1
	bl MoveMenuCursor
	b _080703E4
_080703B2:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080703CC
	ldr r0, _080703C8
	ldr r1, [r0]
	adds r0, r2, 0
	bl _call_via_r1
	b _080703E4
	.align 2, 0
_080703C8: .4byte gUnknown_08376B54
_080703CC:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080703E4
	movs r0, 0x5
	bl audio_play
	ldr r0, _080703EC
	ldr r1, [r0, 0x4]
	adds r0, r4, 0
	bl _call_via_r1
_080703E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080703EC: .4byte gUnknown_08376B54
	thumb_func_end sub_8070374

	thumb_func_start dp05_ether
dp05_ether: @ 80703F0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r2
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r5, r1, 16
	cmp r5, 0xAF
	bne _08070410
	ldr r0, _0807040C
	b _0807041C
	.align 2, 0
_0807040C: .4byte 0x02028daa
_08070410:
	ldr r1, _08070464
	adds r0, r5, 0
	subs r0, 0xD
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
_0807041C:
	mov r8, r0
	ldr r7, _08070468
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r7
	ldr r0, _0807046C
	str r0, [r1]
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r6, 0
	adds r1, r5, 0
	mov r2, r9
	bl sub_806E8D0
	mov r0, r8
	ldrb r1, [r0, 0x4]
	movs r0, 0x10
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08070470
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r7
	strh r1, [r0, 0x1E]
	adds r0, r4, 0
	bl ether_effect_related
	b _08070498
	.align 2, 0
_08070464: .4byte gItemEffectTable
_08070468: .4byte 0x03004b20
_0807046C: .4byte TaskDummy
_08070470:
	movs r0, 0x5
	bl audio_play
	movs r0, 0xA
	movs r1, 0x3
	bl sub_806D538
	ldr r0, _080704A4
	ldrb r0, [r0, 0x5]
	bl sub_80702E4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r7
	ldr r1, _080704A8
	str r1, [r0]
	ldr r1, _080704AC
	movs r0, 0
	strh r0, [r1, 0x2E]
_08070498:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080704A4: .4byte 0x0201c000
_080704A8: .4byte sub_8070374
_080704AC: .4byte 0x03001770
	thumb_func_end dp05_ether

	thumb_func_start ether_effect_related_2
ether_effect_related_2: @ 80704B0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	movs r0, 0x13
	movs r1, 0xA
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_806D5A4
	bl GetMenuCursorPos
	ldr r2, _080704EC
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x1E]
	adds r0, r4, 0
	bl ether_effect_related
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080704EC: .4byte 0x03004b20
	thumb_func_end ether_effect_related_2

	thumb_func_start sub_80704F0
sub_80704F0: @ 80704F0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8072DEC
	movs r0, 0x13
	movs r1, 0xA
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r0, _08070528
	ldr r1, _0807052C
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0807053C
	ldr r2, _08070530
	ldr r0, _08070534
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _08070538
	b _0807054C
	.align 2, 0
_08070528: .4byte 0x03001770
_0807052C: .4byte 0x0000043d
_08070530: .4byte 0x03004b20
_08070534: .4byte 0x0201c000
_08070538: .4byte sub_8095118
_0807053C:
	ldr r2, _08070564
	ldr r0, _08070568
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _0807056C
_0807054C:
	str r1, [r0]
	movs r0, 0x3
	movs r1, 0
	bl sub_806D538
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08070564: .4byte 0x03004b20
_08070568: .4byte 0x0201c000
_0807056C: .4byte sub_808B0C0
	thumb_func_end sub_80704F0

	thumb_func_start ether_effect_related
ether_effect_related: @ 8070570
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r5, 0
	ldr r6, _080705A8
	ldrb r0, [r6, 0x5]
	ldrh r1, [r6, 0x6]
	ldr r3, _080705AC
	lsls r2, r4, 2
	adds r2, r4
	lsls r2, 3
	adds r7, r2, r3
	ldrb r2, [r7, 0x1E]
	bl ExecuteTableBasedItemEffect__
	lsls r0, 24
	cmp r0, 0
	beq _080705B8
	ldr r0, _080705B0
	strb r5, [r0]
	movs r0, 0x5
	bl audio_play
	ldr r0, _080705B4
	movs r1, 0x1
	bl sub_806E834
	b _080705F8
	.align 2, 0
_080705A8: .4byte 0x0201c000
_080705AC: .4byte 0x03004b20
_080705B0: .4byte 0x0202e8f4
_080705B4: .4byte gUnknown_0840EF85
_080705B8:
	ldr r1, _0807060C
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0x1
	bl audio_play
	ldrh r0, [r6, 0x6]
	movs r1, 0x1
	bl sub_80A9538
	ldr r0, [r6]
	movs r2, 0x1E
	ldrsh r1, [r7, r2]
	adds r1, 0xD
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _08070610
	movs r1, 0xD
	muls r1, r5
	ldr r2, _08070614
	adds r1, r2
	bl StringCopy
	ldrh r0, [r6, 0x6]
	bl GetMedicineItemEffectMessage
	ldr r0, _08070618
	movs r1, 0x1
	bl sub_806E834
_080705F8:
	ldr r0, _0807061C
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08070620
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807060C: .4byte 0x0202e8f4
_08070610: .4byte 0x020231cc
_08070614: .4byte gMoveNames
_08070618: .4byte 0x020234cc
_0807061C: .4byte 0x03004b20
_08070620: .4byte sub_806FB0C
	thumb_func_end ether_effect_related

	thumb_func_start dp05_pp_up
dp05_pp_up: @ 8070624
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	ldr r4, _0807066C
	lsls r3, r0, 2
	adds r3, r0
	lsls r3, 3
	adds r3, r4
	ldr r4, _08070670
	str r4, [r3]
	bl sub_806E8D0
	movs r0, 0x5
	bl audio_play
	movs r0, 0xB
	movs r1, 0x3
	bl sub_806D538
	ldr r0, _08070674
	ldrb r0, [r0, 0x5]
	bl sub_80702E4
	ldr r0, _08070678
	movs r1, 0x5
	bl CreateTask
	ldr r1, _0807067C
	movs r0, 0
	strh r0, [r1, 0x2E]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807066C: .4byte 0x03004b20
_08070670: .4byte TaskDummy
_08070674: .4byte 0x0201c000
_08070678: .4byte sub_8070374
_0807067C: .4byte 0x03001770
	thumb_func_end dp05_pp_up

	thumb_func_start sub_8070680
sub_8070680: @ 8070680
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r6, r1, 16
	ldr r3, _080706E0
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	ldr r3, _080706E4
	str r3, [r1]
	adds r1, r6, 0
	bl sub_806E8D0
	ldr r5, _080706E8
	ldr r0, [r5]
	movs r1, 0x38
	bl GetMonData
	cmp r0, 0x64
	beq _080706F4
	movs r4, 0
	ldr r0, _080706EC
	adds r7, r5, r0
_080706B2:
	ldr r0, [r5]
	ldr r1, _080706F0
	adds r1, r4, r1
	ldrb r1, [r1]
	bl GetMonData
	lsls r1, r4, 1
	adds r1, r7, r1
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _080706B2
	ldr r0, _080706E8
	ldrb r0, [r0, 0x5]
	adds r1, r6, 0
	movs r2, 0
	bl ExecuteTableBasedItemEffect__
	lsls r0, 24
	lsrs r0, 24
	b _080706F6
	.align 2, 0
_080706E0: .4byte 0x03004b20
_080706E4: .4byte TaskDummy
_080706E8: .4byte 0x0201c000
_080706EC: .4byte 0xfffff264
_080706F0: .4byte gUnknown_08376D1C
_080706F4:
	movs r0, 0x1
_080706F6:
	cmp r0, 0
	beq _08070724
	ldr r1, _08070718
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x5
	bl audio_play
	ldr r0, _0807071C
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _08070720
	movs r1, 0x5
	bl CreateTask
	b _0807077C
	.align 2, 0
_08070718: .4byte 0x0202e8f4
_0807071C: .4byte gUnknown_0840EF85
_08070720: .4byte sub_806FB0C
_08070724:
	ldr r1, _08070784
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0
	bl pause_music_for_sound_maybe
	ldr r4, _08070788
	ldrb r0, [r4, 0x5]
	ldr r1, [r4]
	bl sub_8070A20
	adds r0, r6, 0
	movs r1, 0x1
	bl sub_80A9538
	ldr r0, [r4]
	ldr r1, _0807078C
	bl GetMonNickname
	ldr r0, [r4]
	movs r1, 0x38
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08070790
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r4, _08070794
	ldr r1, _08070798
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _0807079C
	movs r1, 0x5
	bl CreateTask
_0807077C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070784: .4byte 0x0202e8f4
_08070788: .4byte 0x0201c000
_0807078C: .4byte 0x020231cc
_08070790: .4byte 0x020232cc
_08070794: .4byte 0x020234cc
_08070798: .4byte gUnknown_0840F5A6
_0807079C: .4byte sub_80707A0
	thumb_func_end sub_8070680

	thumb_func_start sub_80707A0
sub_80707A0: @ 80707A0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	bl ducking_tick
	lsls r0, 24
	cmp r0, 0
	beq _080707E8
	ldr r0, _080707F0
	ldrb r0, [r0]
	cmp r0, 0
	bne _080707E8
	ldr r0, _080707F4
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080707CE
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080707E8
_080707CE:
	movs r0, 0x5
	bl audio_play
	adds r0, r4, 0
	bl sub_8070848
	ldr r0, _080707F8
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080707FC
	str r0, [r1]
_080707E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080707F0: .4byte 0x0202e8f6
_080707F4: .4byte 0x03001770
_080707F8: .4byte 0x03004b20
_080707FC: .4byte sub_8070800
	thumb_func_end sub_80707A0

	thumb_func_start sub_8070800
sub_8070800: @ 8070800
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0807083C
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0807081A
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08070834
_0807081A:
	movs r0, 0x5
	bl audio_play
	adds r0, r4, 0
	bl sub_8070968
	ldr r0, _08070840
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08070844
	str r0, [r1]
_08070834:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807083C: .4byte 0x03001770
_08070840: .4byte 0x03004b20
_08070844: .4byte sub_8070AC8
	thumb_func_end sub_8070800

	thumb_func_start sub_8070848
sub_8070848: @ 8070848
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r0, 0xB
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x7
	bl MenuDrawTextWindow
	movs r7, 0
	ldr r0, _080708E4
	mov r10, r0
_08070864:
	ldr r1, _080708E8
	ldr r0, [r1]
	ldr r1, _080708EC
	adds r1, r7, r1
	ldrb r1, [r1]
	bl GetMonData
	adds r1, r7, 0x6
	lsls r1, 1
	ldr r2, _080708F0
	adds r1, r2
	strh r0, [r1]
	lsls r4, r7, 1
	adds r2, r4, r2
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r2]
	adds r0, r7, 0
	movs r1, 0x3
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	adds r1, r0
	adds r1, 0xB
	lsls r1, 24
	lsrs r6, r1, 24
	adds r0, r7, 0
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 1
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r1, _080708F4
	lsls r0, r7, 2
	adds r0, r1
	ldr r0, [r0]
	adds r1, r6, 0x1
	lsls r1, 27
	lsrs r1, 24
	mov r2, r9
	lsls r5, r2, 3
	adds r2, r5, 0
	movs r3, 0x1
	bl sub_80729D8
	mov r8, r4
	cmp r7, 0x2
	bne _080708FC
	adds r4, r6, 0x6
	lsls r1, r4, 3
	adds r1, 0x6
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _080708F8
	adds r2, r5, 0
	movs r3, 0
	bl sub_80729D8
	b _08070910
	.align 2, 0
_080708E4: .4byte 0x020231cc
_080708E8: .4byte 0x0201c000
_080708EC: .4byte gUnknown_08376D1C
_080708F0: .4byte 0x0201b264
_080708F4: .4byte gUnknown_08376D04
_080708F8: .4byte gUnknown_0840E691
_080708FC:
	adds r4, r6, 0x6
	lsls r1, r4, 3
	adds r1, 0x6
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08070960
	adds r2, r5, 0
	movs r3, 0x1
	bl sub_80729D8
_08070910:
	movs r0, 0xFC
	mov r1, r10
	strb r0, [r1]
	movs r0, 0x14
	strb r0, [r1, 0x1]
	movs r0, 0x6
	strb r0, [r1, 0x2]
	ldr r0, _08070964
	add r0, r8
	movs r2, 0
	ldrsh r1, [r0, r2]
	mov r0, r10
	adds r0, 0x3
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	lsls r1, r4, 27
	movs r0, 0xC0
	lsls r0, 20
	adds r1, r0
	lsrs r1, 24
	mov r0, r9
	lsls r2, r0, 3
	mov r0, r10
	movs r3, 0
	bl sub_80729D8
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x5
	bls _08070864
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070960: .4byte gUnknown_0840E691
_08070964: .4byte 0x0201b264
	thumb_func_end sub_8070848

	thumb_func_start sub_8070968
sub_8070968: @ 8070968
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r7, 0
	ldr r0, _08070A10
	mov r9, r0
	ldr r1, _08070A14
	add r1, r9
	mov r10, r1
	ldr r0, _08070A18
	mov r8, r0
_08070982:
	mov r1, r9
	ldr r0, [r1]
	ldr r1, _08070A1C
	adds r1, r7, r1
	ldrb r1, [r1]
	bl GetMonData
	adds r6, r7, 0x6
	lsls r6, 1
	add r6, r10
	strh r0, [r6]
	adds r0, r7, 0
	movs r1, 0x3
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 3
	adds r4, r0
	adds r4, 0xB
	lsls r4, 24
	lsrs r4, 24
	adds r0, r7, 0
	movs r1, 0x3
	bl __umodsi3
	adds r5, r0, 0
	lsls r5, 1
	adds r5, 0x1
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0xFC
	mov r1, r8
	strb r0, [r1]
	movs r0, 0x14
	strb r0, [r1, 0x1]
	movs r0, 0x6
	strb r0, [r1, 0x2]
	movs r0, 0
	ldrsh r1, [r6, r0]
	mov r0, r8
	adds r0, 0x3
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r4, 0x6
	lsls r4, 3
	adds r4, 0x6
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 3
	mov r0, r8
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0
	bl sub_80729D8
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x5
	bls _08070982
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070A10: .4byte 0x0201c000
_08070A14: .4byte 0xfffff264
_08070A18: .4byte 0x020231cc
_08070A1C: .4byte gUnknown_08376D1C
	thumb_func_end sub_8070968

	thumb_func_start sub_8070A20
sub_8070A20: @ 8070A20
	push {r4-r7,lr}
	adds r6, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r6, 0
	bl sub_80A1CD8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08070A3A
	cmp r0, 0x6
	bne _08070A42
_08070A3A:
	adds r0, r6, 0
	adds r1, r7, 0
	bl sub_806FBB4
_08070A42:
	bl battle_type_is_double
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	movs r1, 0x39
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r6, 0
	movs r1, 0x3A
	bl GetMonData
	adds r3, r0, 0
	lsls r3, 16
	lsrs r3, 16
	adds r0, r7, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_806E420
	adds r0, r7, 0
	adds r1, r6, 0
	bl sub_806E674
	ldr r4, _08070ABC
	ldrb r0, [r4, 0x4]
	adds r1, r7, 0
	bl sub_806DDA0
	lsls r0, 24
	lsrs r0, 24
	adds r1, r6, 0
	bl sub_806D84C
	bl battle_type_is_double
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	lsls r1, r7, 1
	adds r0, r1
	ldr r1, _08070AC0
	adds r0, r1
	movs r1, 0x7
	bl task_pc_turn_off
	ldr r0, _08070AC4
	adds r4, r0
	movs r0, 0x2
	strb r0, [r4]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070ABC: .4byte 0x0201c000
_08070AC0: .4byte gUnknown_083769A8
_08070AC4: .4byte 0xfffff261
	thumb_func_end sub_8070A20

	thumb_func_start sub_8070AC8
sub_8070AC8: @ 8070AC8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0
	bl ducking_tick
	lsls r0, 24
	cmp r0, 0
	bne _08070ADC
	b _08070C2C
_08070ADC:
	ldr r0, _08070B24
	ldrh r1, [r0, 0x2E]
	movs r5, 0x1
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _08070AF4
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08070AF4
	b _08070C2C
_08070AF4:
	movs r0, 0xB
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x7
	bl MenuZeroFillWindowRect
	ldr r7, _08070B28
	ldr r0, [r7]
	movs r1, 0x1
	bl sub_803B7C8
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r1, _08070B2C
	adds r0, r7, r1
	strh r5, [r0]
	ldr r0, _08070B30
	cmp r4, r0
	beq _08070BDC
	cmp r4, r0
	bgt _08070B34
	cmp r4, 0
	beq _08070B40
	b _08070BF4
	.align 2, 0
_08070B24: .4byte 0x03001770
_08070B28: .4byte 0x0201c000
_08070B2C: .4byte 0xfffff282
_08070B30: .4byte 0x0000fffe
_08070B34:
	ldr r0, _08070B3C
	cmp r4, r0
	beq _08070B7C
	b _08070BF4
	.align 2, 0
_08070B3C: .4byte 0x0000ffff
_08070B40:
	ldr r0, [r7]
	movs r1, 0
	movs r2, 0
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _08070B74
	ldr r1, _08070B6C
	ldr r0, _08070B70
	str r0, [r1]
	ldr r0, [r7]
	ldrb r3, [r7, 0x5]
	adds r1, r2, 0
	movs r2, 0x1
	bl sub_8111924
	adds r0, r6, 0
	bl DestroyTask
	b _08070C2C
	.align 2, 0
_08070B6C: .4byte 0x03005e94
_08070B70: .4byte sub_80A53F8
_08070B74:
	adds r0, r6, 0
	bl sub_8070D90
	b _08070C2C
_08070B7C:
	ldr r0, [r7]
	ldr r1, _08070BBC
	bl GetMonNickname
	ldr r0, _08070BC0
	ldr r5, _08070BC4
	ldrh r2, [r5]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _08070BC8
	adds r1, r2
	bl StringCopy
	ldr r4, _08070BCC
	ldr r1, _08070BD0
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldrh r0, [r5]
	strh r0, [r7, 0x8]
	ldr r1, _08070BD4
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08070BD8
	b _08070C2A
	.align 2, 0
_08070BBC: .4byte 0x020231cc
_08070BC0: .4byte 0x020232cc
_08070BC4: .4byte 0x02024e82
_08070BC8: .4byte gMoveNames
_08070BCC: .4byte 0x020234cc
_08070BD0: .4byte gUnknown_0840F37C
_08070BD4: .4byte 0x03004b20
_08070BD8: .4byte sub_806F358
_08070BDC:
	ldr r0, _08070BEC
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _08070BF0
	str r0, [r1]
	b _08070C2C
	.align 2, 0
_08070BEC: .4byte 0x03004b20
_08070BF0: .4byte sub_8070C54
_08070BF4:
	ldr r0, _08070C34
	ldr r0, [r0]
	ldr r1, _08070C38
	bl GetMonNickname
	ldr r0, _08070C3C
	movs r1, 0xD
	muls r1, r4
	ldr r2, _08070C40
	adds r1, r2
	bl StringCopy
	ldr r4, _08070C44
	ldr r1, _08070C48
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _08070C4C
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08070C50
_08070C2A:
	str r1, [r0]
_08070C2C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070C34: .4byte 0x0201c000
_08070C38: .4byte 0x020231cc
_08070C3C: .4byte 0x020232cc
_08070C40: .4byte gMoveNames
_08070C44: .4byte 0x020234cc
_08070C48: .4byte gUnknown_0840F338
_08070C4C: .4byte 0x03004b20
_08070C50: .4byte sub_806F254
	thumb_func_end sub_8070AC8

	thumb_func_start sub_8070C54
sub_8070C54: @ 8070C54
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r7, _08070C78
	ldr r0, [r7]
	movs r1, 0
	bl sub_803B7C8
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _08070C7C
	cmp r4, r0
	beq _08070D28
	cmp r4, r0
	bgt _08070C80
	cmp r4, 0
	beq _08070C8C
	b _08070D30
	.align 2, 0
_08070C78: .4byte 0x0201c000
_08070C7C: .4byte 0x0000fffe
_08070C80:
	ldr r0, _08070C88
	cmp r4, r0
	beq _08070CC8
	b _08070D30
	.align 2, 0
_08070C88: .4byte 0x0000ffff
_08070C8C:
	ldr r0, [r7]
	movs r1, 0
	movs r2, 0
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _08070CC0
	ldr r1, _08070CB8
	ldr r0, _08070CBC
	str r0, [r1]
	ldr r0, [r7]
	ldrb r3, [r7, 0x5]
	adds r1, r2, 0
	movs r2, 0x1
	bl sub_8111924
	adds r0, r6, 0
	bl DestroyTask
	b _08070D68
	.align 2, 0
_08070CB8: .4byte 0x03005e94
_08070CBC: .4byte sub_80A53F8
_08070CC0:
	adds r0, r6, 0
	bl sub_8070D90
	b _08070D68
_08070CC8:
	ldr r0, [r7]
	ldr r1, _08070D08
	bl GetMonNickname
	ldr r0, _08070D0C
	ldr r5, _08070D10
	ldrh r2, [r5]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _08070D14
	adds r1, r2
	bl StringCopy
	ldr r4, _08070D18
	ldr r1, _08070D1C
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldrh r0, [r5]
	strh r0, [r7, 0x8]
	ldr r1, _08070D20
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08070D24
	b _08070D66
	.align 2, 0
_08070D08: .4byte 0x020231cc
_08070D0C: .4byte 0x020232cc
_08070D10: .4byte 0x02024e82
_08070D14: .4byte gMoveNames
_08070D18: .4byte 0x020234cc
_08070D1C: .4byte gUnknown_0840F37C
_08070D20: .4byte 0x03004b20
_08070D24: .4byte sub_806F358
_08070D28:
	adds r0, r6, 0
	bl sub_8070C54
	b _08070D68
_08070D30:
	ldr r0, _08070D70
	ldr r0, [r0]
	ldr r1, _08070D74
	bl GetMonNickname
	ldr r0, _08070D78
	movs r1, 0xD
	muls r1, r4
	ldr r2, _08070D7C
	adds r1, r2
	bl StringCopy
	ldr r4, _08070D80
	ldr r1, _08070D84
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _08070D88
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08070D8C
_08070D66:
	str r1, [r0]
_08070D68:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070D70: .4byte 0x0201c000
_08070D74: .4byte 0x020231cc
_08070D78: .4byte 0x020232cc
_08070D7C: .4byte gMoveNames
_08070D80: .4byte 0x020234cc
_08070D84: .4byte gUnknown_0840F338
_08070D88: .4byte 0x03004b20
_08070D8C: .4byte sub_806F254
	thumb_func_end sub_8070C54

	thumb_func_start sub_8070D90
sub_8070D90: @ 8070D90
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08070DB4
	ldr r3, _08070DB8
	ldrb r2, [r3, 0x4]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r4
	ldr r2, [r3, 0x10]
	str r2, [r1]
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08070DB4: .4byte 0x03004b20
_08070DB8: .4byte 0x0201c000
	thumb_func_end sub_8070D90

	thumb_func_start sub_8070DBC
sub_8070DBC: @ 8070DBC
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 16
	lsrs r6, r1, 16
	movs r0, 0x5
	bl audio_play
	ldr r1, _08070E18
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08070E1C
	str r1, [r0]
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_806E8D0
	ldr r1, _08070E20
	ldr r0, _08070E24
	str r0, [r1]
	ldr r0, _08070E28
	ldrb r0, [r0, 0x5]
	adds r1, r6, 0
	movs r2, 0
	bl ExecuteTableBasedItemEffect__
	lsls r0, 24
	cmp r0, 0
	beq _08070E38
	ldr r1, _08070E2C
	movs r0, 0
	strb r0, [r1]
	ldr r0, _08070E30
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _08070E34
	movs r1, 0x5
	bl CreateTask
	b _08070E40
	.align 2, 0
_08070E18: .4byte 0x03004b20
_08070E1C: .4byte TaskDummy
_08070E20: .4byte 0x03005e94
_08070E24: .4byte sub_80A53F8
_08070E28: .4byte 0x0201c000
_08070E2C: .4byte 0x0202e8f4
_08070E30: .4byte gUnknown_0840EF85
_08070E34: .4byte sub_806FB0C
_08070E38:
	adds r0, r6, 0
	movs r1, 0x1
	bl sub_80A9538
_08070E40:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8070DBC

	thumb_func_start sub_8070E48
sub_8070E48: @ 8070E48
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _08070E5C
	ldr r4, _08070E58
	b _08070E66
	.align 2, 0
_08070E58: .4byte 0x02028daa
_08070E5C:
	ldr r1, _08070E8C
	subs r0, 0xD
	lsls r0, 2
	adds r0, r1
	ldr r4, [r0]
_08070E66:
	ldrb r1, [r4]
	movs r5, 0x3F
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _08070E88
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _08070E88
	ldrb r0, [r4, 0x2]
	cmp r0, 0
	bne _08070E88
	ldrb r3, [r4, 0x3]
	movs r0, 0x80
	ands r0, r3
	cmp r0, 0
	beq _08070E90
_08070E88:
	movs r0, 0
	b _08070F8A
	.align 2, 0
_08070E8C: .4byte gItemEffectTable
_08070E90:
	movs r2, 0x40
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _08070E9E
	movs r0, 0xA
	b _08070F8A
_08070E9E:
	adds r0, r2, 0
	ands r0, r3
	cmp r0, 0
	beq _08070EAA
	movs r0, 0x1
	b _08070F8A
_08070EAA:
	adds r2, r5, 0
	ands r2, r3
	cmp r2, 0
	bne _08070EB8
	lsrs r0, r1, 7
	cmp r0, 0
	beq _08070EFA
_08070EB8:
	cmp r2, 0x20
	bne _08070EC0
	movs r0, 0x4
	b _08070F8A
_08070EC0:
	cmp r2, 0x10
	bne _08070EC8
	movs r0, 0x3
	b _08070F8A
_08070EC8:
	cmp r2, 0x8
	bne _08070ED0
	movs r0, 0x5
	b _08070F8A
_08070ED0:
	cmp r2, 0x4
	bne _08070ED8
	movs r0, 0x6
	b _08070F8A
_08070ED8:
	cmp r2, 0x2
	bne _08070EE0
	movs r0, 0x7
	b _08070F8A
_08070EE0:
	cmp r2, 0x1
	bne _08070EE8
	movs r0, 0x8
	b _08070F8A
_08070EE8:
	lsrs r0, r1, 7
	cmp r0, 0
	beq _08070EF6
	cmp r2, 0
	bne _08070EF6
	movs r0, 0x9
	b _08070F8A
_08070EF6:
	movs r0, 0xB
	b _08070F8A
_08070EFA:
	ldrb r1, [r4, 0x4]
	movs r0, 0x44
	ands r0, r1
	adds r2, r1, 0
	cmp r0, 0
	beq _08070F0A
	movs r0, 0x2
	b _08070F8A
_08070F0A:
	movs r5, 0x2
	adds r0, r5, 0
	ands r0, r2
	cmp r0, 0
	beq _08070F18
	movs r0, 0xC
	b _08070F8A
_08070F18:
	movs r3, 0x1
	adds r0, r3, 0
	ands r0, r2
	cmp r0, 0
	beq _08070F26
	movs r0, 0xD
	b _08070F8A
_08070F26:
	ldrb r1, [r4, 0x5]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08070F34
	movs r0, 0xE
	b _08070F8A
_08070F34:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08070F40
	movs r0, 0xF
	b _08070F8A
_08070F40:
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _08070F4C
	movs r0, 0x10
	b _08070F8A
_08070F4C:
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08070F58
	movs r0, 0x11
	b _08070F8A
_08070F58:
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _08070F64
	movs r0, 0x12
	b _08070F8A
_08070F64:
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	beq _08070F70
	movs r0, 0x13
	b _08070F8A
_08070F70:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08070F7C
	movs r0, 0x14
	b _08070F8A
_08070F7C:
	movs r0, 0x18
	ands r0, r2
	cmp r0, 0
	bne _08070F88
	movs r0, 0x16
	b _08070F8A
_08070F88:
	movs r0, 0x15
_08070F8A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8070E48

	thumb_func_start unref_sub_8070F90
unref_sub_8070F90: @ 8070F90
	push {lr}
	ldr r0, _08070FAC
	bl FlagSet
	movs r0, 0x80
	lsls r0, 4
	bl FlagSet
	ldr r0, _08070FB0
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_08070FAC: .4byte 0x00000801
_08070FB0: .4byte 0x00000802
	thumb_func_end unref_sub_8070F90

	thumb_func_start sub_8070FB4
sub_8070FB4: @ 8070FB4
	push {lr}
	ldr r0, _08070FCC
	movs r1, 0
	strb r1, [r0]
	bl is_c1_link_related_active
	cmp r0, 0x1
	bne _08070FD0
	bl sub_80710A0
	b _08070FE2
	.align 2, 0
_08070FCC: .4byte 0x0202e8fd
_08070FD0:
	bl GetSafariZoneFlag
	cmp r0, 0x1
	bne _08070FDE
	bl BuildStartMenuActions_SafariZone
	b _08070FE2
_08070FDE:
	bl BuildStartMenuActions_Normal
_08070FE2:
	pop {r0}
	bx r0
	thumb_func_end sub_8070FB4

	thumb_func_start AddStartMenuAction
AddStartMenuAction: @ 8070FE8
	push {lr}
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _08070FFC
	ldr r1, _08071000
	bl append_byte
	pop {r0}
	bx r0
	.align 2, 0
_08070FFC: .4byte 0x0202e8fe
_08071000: .4byte 0x0202e8fd
	thumb_func_end AddStartMenuAction

	thumb_func_start BuildStartMenuActions_Normal
BuildStartMenuActions_Normal: @ 8071004
	push {lr}
	ldr r0, _08071068
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0807101A
	movs r0, 0
	bl AddStartMenuAction
_0807101A:
	movs r0, 0x80
	lsls r0, 4
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08071030
	movs r0, 0x1
	bl AddStartMenuAction
_08071030:
	movs r0, 0x2
	bl AddStartMenuAction
	ldr r0, _0807106C
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0807104A
	movs r0, 0x3
	bl AddStartMenuAction
_0807104A:
	movs r0, 0x4
	bl AddStartMenuAction
	movs r0, 0x5
	bl AddStartMenuAction
	movs r0, 0x6
	bl AddStartMenuAction
	movs r0, 0x7
	bl AddStartMenuAction
	pop {r0}
	bx r0
	.align 2, 0
_08071068: .4byte 0x00000801
_0807106C: .4byte 0x00000802
	thumb_func_end BuildStartMenuActions_Normal

	thumb_func_start BuildStartMenuActions_SafariZone
BuildStartMenuActions_SafariZone: @ 8071070
	push {lr}
	movs r0, 0x8
	bl AddStartMenuAction
	movs r0, 0
	bl AddStartMenuAction
	movs r0, 0x1
	bl AddStartMenuAction
	movs r0, 0x2
	bl AddStartMenuAction
	movs r0, 0x4
	bl AddStartMenuAction
	movs r0, 0x6
	bl AddStartMenuAction
	movs r0, 0x7
	bl AddStartMenuAction
	pop {r0}
	bx r0
	thumb_func_end BuildStartMenuActions_SafariZone

	thumb_func_start sub_80710A0
sub_80710A0: @ 80710A0
	push {lr}
	movs r0, 0x1
	bl AddStartMenuAction
	movs r0, 0x2
	bl AddStartMenuAction
	ldr r0, _080710D8
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080710C2
	movs r0, 0x3
	bl AddStartMenuAction
_080710C2:
	movs r0, 0x9
	bl AddStartMenuAction
	movs r0, 0x6
	bl AddStartMenuAction
	movs r0, 0x7
	bl AddStartMenuAction
	pop {r0}
	bx r0
	.align 2, 0
_080710D8: .4byte 0x00000802
	thumb_func_end sub_80710A0

	thumb_func_start sub_80710DC
sub_80710DC: @ 80710DC
	push {lr}
	ldr r0, _08071108
	ldr r1, _0807110C
	ldrb r1, [r1]
	movs r2, 0xC
	movs r3, 0x1
	bl sub_8072C44
	movs r0, 0
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x5
	bl MenuDrawTextWindow
	ldr r0, _08071110
	movs r1, 0x1
	movs r2, 0x1
	bl MenuPrint
	pop {r0}
	bx r0
	.align 2, 0
_08071108: .4byte 0x020231cc
_0807110C: .4byte 0x02038808
_08071110: .4byte gUnknown_0842C4A9
	thumb_func_end sub_80710DC

	thumb_func_start sub_8071114
sub_8071114: @ 8071114
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	adds r6, r1, 0
	movs r0, 0
	ldrsh r4, [r7, r0]
	ldr r1, _08071160
	mov r8, r1
	lsls r0, r4, 25
	movs r1, 0x80
	lsls r1, 18
	adds r5, r0, r1
_0807112E:
	ldr r0, _08071164
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r0, 3
	add r0, r8
	ldr r0, [r0]
	lsrs r2, r5, 24
	movs r1, 0x17
	bl MenuPrint
	movs r0, 0x80
	lsls r0, 18
	adds r5, r0
	adds r4, 0x1
	ldr r0, _08071168
	ldrb r0, [r0]
	cmp r4, r0
	bge _0807116C
	subs r6, 0x1
	cmp r6, 0
	bne _0807112E
	strh r4, [r7]
	movs r0, 0
	b _08071170
	.align 2, 0
_08071160: .4byte gUnknown_08376D24
_08071164: .4byte 0x0202e8fe
_08071168: .4byte 0x0202e8fd
_0807116C:
	strh r4, [r7]
	movs r0, 0x1
_08071170:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8071114

	thumb_func_start sub_807117C
sub_807117C: @ 807117C
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bhi _08071224
	lsls r0, 2
	ldr r1, _08071198
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08071198: .4byte _0807119C
	.align 2, 0
_0807119C:
	.4byte _080711F6
	.4byte _080711B4
	.4byte _080711BA
	.4byte _080711DC
	.4byte _080711EA
	.4byte _080711FE
_080711B4:
	bl sub_8070FB4
	b _080711F6
_080711BA:
	ldr r0, _080711D8
	ldrb r3, [r0]
	lsls r3, 25
	movs r0, 0xC0
	lsls r0, 18
	adds r3, r0
	lsrs r3, 24
	movs r0, 0x16
	movs r1, 0
	movs r2, 0x1D
	bl MenuDrawTextWindow
	movs r0, 0
	strh r0, [r5]
	b _080711F6
	.align 2, 0
_080711D8: .4byte 0x0202e8fd
_080711DC:
	bl GetSafariZoneFlag
	cmp r0, 0
	beq _080711F6
	bl sub_80710DC
	b _080711F6
_080711EA:
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_8071114
	cmp r0, 0
	beq _08071224
_080711F6:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _08071224
_080711FE:
	ldr r0, _0807121C
	ldrb r3, [r0]
	ldr r4, _08071220
	ldrb r0, [r4]
	str r0, [sp]
	movs r0, 0x6
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x17
	movs r2, 0x2
	bl InitMenu
	strb r0, [r4]
	movs r0, 0x1
	b _08071226
	.align 2, 0
_0807121C: .4byte 0x0202e8fd
_08071220: .4byte 0x0202e8fc
_08071224:
	movs r0, 0
_08071226:
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_807117C

	thumb_func_start sub_8071230
sub_8071230: @ 8071230
	push {r4,lr}
	sub sp, 0x4
	movs r0, 0
	mov r1, sp
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	adds r4, r1, 0
_08071240:
	mov r0, sp
	adds r1, r4, 0
	bl sub_807117C
	cmp r0, 0
	beq _08071240
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8071230

	thumb_func_start task50_startmenu
task50_startmenu: @ 8071254
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08071280
	adds r4, r0, r1
	adds r1, r4, 0x2
	adds r0, r4, 0
	bl sub_807117C
	cmp r0, 0x1
	bne _0807127A
	movs r0, 0
	strh r0, [r4]
	adds r0, r5, 0
	bl SwitchTaskToFollowupFunc
_0807127A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08071280: .4byte 0x03004b28
	thumb_func_end task50_startmenu

	thumb_func_start sub_8071284
sub_8071284: @ 8071284
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080712AC
	bl InitMenuWindow
	ldr r4, _080712B0
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	adds r2, r5, 0
	bl SetTaskFuncWithFollowupFunc
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080712AC: .4byte gWindowConfig_81E6CE4
_080712B0: .4byte task50_startmenu
	thumb_func_end sub_8071284

	thumb_func_start sub_80712B4
sub_80712B4: @ 80712B4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080712D4
	adds r2, r0, r1
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _080712D8
	cmp r0, 0x1
	beq _080712F0
	b _08071306
	.align 2, 0
_080712D4: .4byte 0x03004b20
_080712D8:
	ldr r1, _080712E8
	ldr r0, _080712EC
	str r0, [r1]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _08071306
	.align 2, 0
_080712E8: .4byte 0x03004ae8
_080712EC: .4byte sub_8071338
_080712F0:
	ldr r0, _0807130C
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08071306
	adds r0, r4, 0
	bl DestroyTask
_08071306:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807130C: .4byte 0x03004ae8
	thumb_func_end sub_80712B4

	thumb_func_start sub_8071310
sub_8071310: @ 8071310
	push {lr}
	bl is_c1_link_related_active
	cmp r0, 0
	bne _08071326
	bl player_bitmagic
	bl sub_80594C0
	bl sub_80597F4
_08071326:
	ldr r0, _08071334
	bl sub_8071284
	bl script_env_2_enable
	pop {r0}
	bx r0
	.align 2, 0
_08071334: .4byte sub_80712B4
	thumb_func_end sub_8071310

	thumb_func_start sub_8071338
sub_8071338: @ 8071338
	push {r4,lr}
	ldr r4, _080713DC
	ldrh r1, [r4, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08071358
	movs r0, 0x5
	bl audio_play
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	ldr r1, _080713E0
	strb r0, [r1]
_08071358:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08071372
	movs r0, 0x5
	bl audio_play
	movs r0, 0x1
	bl MoveMenuCursor
	ldr r1, _080713E0
	strb r0, [r1]
_08071372:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08071400
	movs r0, 0x5
	bl audio_play
	ldr r1, _080713E4
	ldr r2, _080713E8
	ldr r0, _080713E0
	ldrb r0, [r0]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	ldr r0, _080713EC
	cmp r1, r0
	bne _080713A8
	movs r0, 0
	bl pokedex_count
	lsls r0, 16
	cmp r0, 0
	beq _08071408
_080713A8:
	ldr r3, _080713F0
	ldr r1, _080713E4
	ldr r2, _080713E8
	ldr r0, _080713E0
	ldrb r0, [r0]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	str r1, [r3]
	ldr r0, _080713F4
	cmp r1, r0
	beq _08071408
	ldr r0, _080713F8
	cmp r1, r0
	beq _08071408
	ldr r0, _080713FC
	cmp r1, r0
	beq _08071408
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	b _08071408
	.align 2, 0
_080713DC: .4byte 0x03001770
_080713E0: .4byte 0x0202e8fc
_080713E4: .4byte gUnknown_08376D24
_080713E8: .4byte 0x0202e8fe
_080713EC: .4byte StartMenu_Pokedex
_080713F0: .4byte 0x03004ae8
_080713F4: .4byte sub_80714FC
_080713F8: .4byte sub_8071554
_080713FC: .4byte sub_8071560
_08071400:
	movs r0, 0xA
	ands r0, r1
	cmp r0, 0
	bne _0807140C
_08071408:
	movs r0, 0
	b _08071412
_0807140C:
	bl sub_8071C20
	movs r0, 0x1
_08071412:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8071338

	thumb_func_start StartMenu_Pokedex
StartMenu_Pokedex: @ 8071418
	push {lr}
	ldr r0, _0807142C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08071430
	movs r0, 0
	b _08071442
	.align 2, 0
_0807142C: .4byte 0x0202f388
_08071430:
	movs r0, 0x29
	bl sav12_xor_increment
	bl play_some_sound
	ldr r0, _08071448
	bl SetMainCallback2
	movs r0, 0x1
_08071442:
	pop {r1}
	bx r1
	.align 2, 0
_08071448: .4byte sub_808C27C
	thumb_func_end StartMenu_Pokedex

	thumb_func_start sub_807144C
sub_807144C: @ 807144C
	push {lr}
	ldr r0, _08071460
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08071464
	movs r0, 0
	b _08071470
	.align 2, 0
_08071460: .4byte 0x0202f388
_08071464:
	bl play_some_sound
	ldr r0, _08071474
	bl SetMainCallback2
	movs r0, 0x1
_08071470:
	pop {r1}
	bx r1
	.align 2, 0
_08071474: .4byte sub_8089A70
	thumb_func_end sub_807144C

	thumb_func_start sub_8071478
sub_8071478: @ 8071478
	push {lr}
	ldr r0, _0807148C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08071490
	movs r0, 0
	b _0807149C
	.align 2, 0
_0807148C: .4byte 0x0202f388
_08071490:
	bl play_some_sound
	ldr r0, _080714A0
	bl SetMainCallback2
	movs r0, 0x1
_0807149C:
	pop {r1}
	bx r1
	.align 2, 0
_080714A0: .4byte sub_80A53F8
	thumb_func_end sub_8071478

	thumb_func_start sub_80714A4
sub_80714A4: @ 80714A4
	push {lr}
	ldr r0, _080714B8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080714BC
	movs r0, 0
	b _080714C8
	.align 2, 0
_080714B8: .4byte 0x0202f388
_080714BC:
	bl play_some_sound
	ldr r0, _080714CC
	bl SetMainCallback2
	movs r0, 0x1
_080714C8:
	pop {r1}
	bx r1
	.align 2, 0
_080714CC: .4byte sub_80EBA5C
	thumb_func_end sub_80714A4

	thumb_func_start sub_80714D0
sub_80714D0: @ 80714D0
	push {lr}
	ldr r0, _080714E4
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080714E8
	movs r0, 0
	b _080714F4
	.align 2, 0
_080714E4: .4byte 0x0202f388
_080714E8:
	bl play_some_sound
	ldr r0, _080714F8
	bl sub_8093110
	movs r0, 0x1
_080714F4:
	pop {r1}
	bx r1
	.align 2, 0
_080714F8: .4byte sub_805469C
	thumb_func_end sub_80714D0

	thumb_func_start sub_80714FC
sub_80714FC: @ 80714FC
	push {lr}
	bl sub_8072DEC
	ldr r1, _08071510
	ldr r0, _08071514
	str r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08071510: .4byte 0x03004ae8
_08071514: .4byte sub_80715A4
	thumb_func_end sub_80714FC

	thumb_func_start sub_8071518
sub_8071518: @ 8071518
	push {lr}
	ldr r0, _0807152C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08071530
	movs r0, 0
	b _08071542
	.align 2, 0
_0807152C: .4byte 0x0202f388
_08071530:
	bl play_some_sound
	ldr r0, _08071548
	bl SetMainCallback2
	ldr r1, _0807154C
	ldr r0, _08071550
	str r0, [r1, 0x8]
	movs r0, 0x1
_08071542:
	pop {r1}
	bx r1
	.align 2, 0
_08071548: .4byte CB2_InitOptionMenu
_0807154C: .4byte 0x03001770
_08071550: .4byte sub_805469C
	thumb_func_end sub_8071518

	thumb_func_start sub_8071554
sub_8071554: @ 8071554
	push {lr}
	bl sub_8071C20
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8071554

	thumb_func_start sub_8071560
sub_8071560: @ 8071560
	push {lr}
	bl sub_8071C20
	bl sub_80C823C
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8071560

	thumb_func_start sub_8071570
sub_8071570: @ 8071570
	push {lr}
	ldr r0, _08071584
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08071588
	movs r0, 0
	b _08071598
	.align 2, 0
_08071584: .4byte 0x0202f388
_08071588:
	bl play_some_sound
	ldr r0, _0807159C
	ldrb r0, [r0]
	ldr r1, _080715A0
	bl sub_8093130
	movs r0, 0x1
_08071598:
	pop {r1}
	bx r1
	.align 2, 0
_0807159C: .4byte 0x03004860
_080715A0: .4byte sub_805469C
	thumb_func_end sub_8071570

	thumb_func_start sub_80715A4
sub_80715A4: @ 80715A4
	push {lr}
	bl sub_807160C
	ldr r1, _080715B8
	ldr r0, _080715BC
	str r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080715B8: .4byte 0x03004ae8
_080715BC: .4byte sub_80715C0
	thumb_func_end sub_80715A4

	thumb_func_start sub_80715C0
sub_80715C0: @ 80715C0
	push {lr}
	bl sub_8071630
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080715F4
	cmp r0, 0x1
	ble _08071604
	cmp r0, 0x2
	beq _080715DC
	cmp r0, 0x3
	beq _080715F4
	b _08071604
_080715DC:
	bl MenuZeroFillScreen
	bl sub_8071230
	ldr r1, _080715EC
	ldr r0, _080715F0
	str r0, [r1]
	b _08071604
	.align 2, 0
_080715EC: .4byte 0x03004ae8
_080715F0: .4byte sub_8071338
_080715F4:
	bl MenuZeroFillScreen
	bl sub_8064E2C
	bl script_env_2_disable
	movs r0, 0x1
	b _08071606
_08071604:
	movs r0, 0
_08071606:
	pop {r1}
	bx r1
	thumb_func_end sub_80715C0

	thumb_func_start sub_807160C
sub_807160C: @ 807160C
	push {lr}
	bl save_serialize_map
	ldr r1, _08071624
	ldr r0, _08071628
	str r0, [r1]
	ldr r1, _0807162C
	movs r0, 0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08071624: .4byte 0x030006a8
_08071628: .4byte sub_8071794
_0807162C: .4byte 0x030006ad
	thumb_func_end sub_807160C

	thumb_func_start sub_8071630
sub_8071630: @ 8071630
	push {lr}
	ldr r0, _08071648
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807164C
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _0807164C
	movs r0, 0
	b _0807165E
	.align 2, 0
_08071648: .4byte 0x030006ad
_0807164C:
	ldr r1, _08071664
	movs r0, 0
	strb r0, [r1]
	ldr r0, _08071668
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
_0807165E:
	pop {r1}
	bx r1
	.align 2, 0
_08071664: .4byte 0x030006ad
_08071668: .4byte 0x030006a8
	thumb_func_end sub_8071630

	thumb_func_start sub_807166C
sub_807166C: @ 807166C
	push {lr}
	bl sub_807160C
	ldr r0, _08071680
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08071680: .4byte task50_save_game
	thumb_func_end sub_807166C

	thumb_func_start sub_8071684
sub_8071684: @ 8071684
	push {r4,r5,lr}
	adds r2, r0, 0
	adds r5, r1, 0
	ldr r4, _080716B0
	adds r0, r4, 0
	adds r1, r2, 0
	bl StringExpandPlaceholders
	bl MenuDisplayMessageBox
	adds r0, r4, 0
	bl sub_8072044
	ldr r1, _080716B4
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _080716B8
	str r5, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080716B0: .4byte 0x020234cc
_080716B4: .4byte 0x030006ad
_080716B8: .4byte 0x030006a8
	thumb_func_end sub_8071684

	thumb_func_start task50_save_game
task50_save_game: @ 80716BC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8071630
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1
	beq _080716E8
	cmp r1, 0x1
	bgt _080716D8
	cmp r1, 0
	beq _080716F6
	b _080716EC
_080716D8:
	cmp r1, 0x3
	bgt _080716EC
	ldr r1, _080716E4
	movs r0, 0
	strh r0, [r1]
	b _080716EC
	.align 2, 0
_080716E4: .4byte 0x0202e8dc
_080716E8:
	ldr r0, _080716FC
	strh r1, [r0]
_080716EC:
	adds r0, r4, 0
	bl DestroyTask
	bl script_env_2_enable_and_set_ctx_running
_080716F6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080716FC: .4byte 0x0202e8dc
	thumb_func_end task50_save_game

	thumb_func_start sub_8071700
sub_8071700: @ 8071700
	push {lr}
	movs r0, 0
	movs r1, 0
	bl sub_80946C8
	pop {r0}
	bx r0
	thumb_func_end sub_8071700

	thumb_func_start sub_8071710
sub_8071710: @ 8071710
	push {lr}
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1A
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	thumb_func_end sub_8071710

	thumb_func_start sub_8071724
sub_8071724: @ 8071724
	ldr r1, _0807172C
	movs r0, 0x3C
	strb r0, [r1]
	bx lr
	.align 2, 0
_0807172C: .4byte 0x030006ac
	thumb_func_end sub_8071724

	thumb_func_start sub_8071730
sub_8071730: @ 8071730
	push {lr}
	ldr r1, _08071750
	ldrb r0, [r1]
	subs r2, r0, 0x1
	strb r2, [r1]
	ldr r0, _08071754
	ldrh r1, [r0, 0x2C]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08071758
	lsls r0, r2, 24
	cmp r0, 0
	beq _0807175E
	movs r0, 0
	b _08071760
	.align 2, 0
_08071750: .4byte 0x030006ac
_08071754: .4byte 0x03001770
_08071758:
	movs r0, 0x5
	bl audio_play
_0807175E:
	movs r0, 0x1
_08071760:
	pop {r1}
	bx r1
	thumb_func_end sub_8071730

	thumb_func_start sub_8071764
sub_8071764: @ 8071764
	push {lr}
	ldr r1, _08071780
	ldrb r0, [r1]
	cmp r0, 0
	bne _08071788
	ldr r0, _08071784
	ldrh r1, [r0, 0x2C]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0807178C
	movs r0, 0x1
	b _0807178E
	.align 2, 0
_08071780: .4byte 0x030006ac
_08071784: .4byte 0x03001770
_08071788:
	subs r0, 0x1
	strb r0, [r1]
_0807178C:
	movs r0, 0
_0807178E:
	pop {r1}
	bx r1
	thumb_func_end sub_8071764

	thumb_func_start sub_8071794
sub_8071794: @ 8071794
	push {lr}
	bl MenuZeroFillScreen
	movs r0, 0
	movs r1, 0
	bl sub_80945C0
	ldr r0, _080717B0
	ldr r1, _080717B4
	bl sub_8071684
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080717B0: .4byte gUnknown_081C6C85
_080717B4: .4byte sub_80717B8
	thumb_func_end sub_8071794

	thumb_func_start sub_80717B8
sub_80717B8: @ 80717B8
	push {lr}
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r1, _080717D0
	ldr r0, _080717D4
	str r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080717D0: .4byte 0x030006a8
_080717D4: .4byte sub_80717D8
	thumb_func_end sub_80717B8

	thumb_func_start sub_80717D8
sub_80717D8: @ 80717D8
	push {lr}
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _080717FA
	cmp r1, 0
	bgt _080717F4
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0807183C
	b _08071848
_080717F4:
	cmp r1, 0x1
	beq _0807183C
	b _08071848
_080717FA:
	bl sub_8071710
	ldr r0, _0807181C
	ldrh r0, [r0]
	cmp r0, 0
	beq _0807180A
	cmp r0, 0x2
	bne _08071812
_0807180A:
	ldr r0, _08071820
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807182C
_08071812:
	ldr r1, _08071824
	ldr r0, _08071828
	str r0, [r1]
	b _08071848
	.align 2, 0
_0807181C: .4byte 0x03005eb8
_08071820: .4byte 0x020297ec
_08071824: .4byte 0x030006a8
_08071828: .4byte sub_8071850
_0807182C:
	ldr r1, _08071834
	ldr r0, _08071838
	str r0, [r1]
	b _08071848
	.align 2, 0
_08071834: .4byte 0x030006a8
_08071838: .4byte sub_80718E8
_0807183C:
	bl sub_8071710
	bl sub_8071700
	movs r0, 0x2
	b _0807184A
_08071848:
	movs r0, 0
_0807184A:
	pop {r1}
	bx r1
	thumb_func_end sub_80717D8

	thumb_func_start sub_8071850
sub_8071850: @ 8071850
	push {lr}
	ldr r0, _0807186C
	ldrb r0, [r0]
	ldr r2, _08071870
	cmp r0, 0x1
	bne _0807185E
	ldr r2, _08071874
_0807185E:
	ldr r1, _08071878
	adds r0, r2, 0
	bl sub_8071684
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0807186C: .4byte 0x020297ec
_08071870: .4byte gUnknown_081C6CA6
_08071874: .4byte gUnknown_081C6D26
_08071878: .4byte sub_807187C
	thumb_func_end sub_8071850

	thumb_func_start sub_807187C
sub_807187C: @ 807187C
	push {lr}
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r1, _08071894
	ldr r0, _08071898
	str r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08071894: .4byte 0x030006a8
_08071898: .4byte sub_807189C
	thumb_func_end sub_807187C

	thumb_func_start sub_807189C
sub_807189C: @ 807189C
	push {lr}
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _080718BE
	cmp r1, 0
	bgt _080718B8
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080718D4
	b _080718E0
_080718B8:
	cmp r1, 0x1
	beq _080718D4
	b _080718E0
_080718BE:
	bl sub_8071710
	ldr r1, _080718CC
	ldr r0, _080718D0
	str r0, [r1]
	b _080718E0
	.align 2, 0
_080718CC: .4byte 0x030006a8
_080718D0: .4byte sub_80718E8
_080718D4:
	bl sub_8071710
	bl sub_8071700
	movs r0, 0x2
	b _080718E2
_080718E0:
	movs r0, 0
_080718E2:
	pop {r1}
	bx r1
	thumb_func_end sub_807189C

	thumb_func_start sub_80718E8
sub_80718E8: @ 80718E8
	push {lr}
	ldr r0, _080718F8
	ldr r1, _080718FC
	bl sub_8071684
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080718F8: .4byte gUnknown_081C6CE1
_080718FC: .4byte sub_8071900
	thumb_func_end sub_80718E8

	thumb_func_start sub_8071900
sub_8071900: @ 8071900
	push {r4,lr}
	movs r0, 0
	bl sav12_xor_increment
	ldr r4, _08071920
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _08071924
	movs r0, 0x4
	bl sub_8125D44
	lsls r0, 24
	lsrs r1, r0, 24
	movs r0, 0
	strb r0, [r4]
	b _0807192E
	.align 2, 0
_08071920: .4byte 0x020297ec
_08071924:
	movs r0, 0
	bl sub_8125D44
	lsls r0, 24
	lsrs r1, r0, 24
_0807192E:
	cmp r1, 0x1
	bne _08071944
	ldr r0, _0807193C
	ldr r1, _08071940
	bl sub_8071684
	b _0807194C
	.align 2, 0
_0807193C: .4byte gUnknown_081C6D05
_08071940: .4byte sub_8071960
_08071944:
	ldr r0, _08071958
	ldr r1, _0807195C
	bl sub_8071684
_0807194C:
	bl sub_8071724
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08071958: .4byte gUnknown_0840E5D5
_0807195C: .4byte sub_80719AC
	thumb_func_end sub_8071900

	thumb_func_start sub_8071960
sub_8071960: @ 8071960
	push {lr}
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _08071978
	movs r0, 0x37
	bl audio_play
	ldr r1, _08071980
	ldr r0, _08071984
	str r0, [r1]
_08071978:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08071980: .4byte 0x030006a8
_08071984: .4byte sub_8071988
	thumb_func_end sub_8071960

	thumb_func_start sub_8071988
sub_8071988: @ 8071988
	push {lr}
	bl mplay_has_finished_maybe
	lsls r0, 24
	cmp r0, 0
	bne _080719A6
	bl sub_8071730
	lsls r0, 24
	cmp r0, 0
	beq _080719A6
	bl sub_8071700
	movs r0, 0x1
	b _080719A8
_080719A6:
	movs r0, 0
_080719A8:
	pop {r1}
	bx r1
	thumb_func_end sub_8071988

	thumb_func_start sub_80719AC
sub_80719AC: @ 80719AC
	push {lr}
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _080719C4
	movs r0, 0x16
	bl audio_play
	ldr r1, _080719CC
	ldr r0, _080719D0
	str r0, [r1]
_080719C4:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080719CC: .4byte 0x030006a8
_080719D0: .4byte sub_80719D4
	thumb_func_end sub_80719AC

	thumb_func_start sub_80719D4
sub_80719D4: @ 80719D4
	push {lr}
	bl sub_8071764
	lsls r0, 24
	cmp r0, 0
	beq _080719E8
	bl sub_8071700
	movs r0, 0x3
	b _080719EA
_080719E8:
	movs r0, 0
_080719EA:
	pop {r1}
	bx r1
	thumb_func_end sub_80719D4

	thumb_func_start sub_80719F0
sub_80719F0: @ 80719F0
	push {lr}
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_80719F0

	thumb_func_start sub_80719FC
sub_80719FC: @ 80719FC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	mov r8, r0
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _08071A0E
	b _08071B10
_08071A0E:
	lsls r0, 2
	ldr r1, _08071A18
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08071A18: .4byte _08071A1C
	.align 2, 0
_08071A1C:
	.4byte _08071A30
	.4byte _08071AA4
	.4byte _08071AB6
	.4byte _08071AD8
	.4byte _08071B0C
_08071A30:
	movs r0, 0x80
	lsls r0, 19
	movs r4, 0
	strh r4, [r0]
	movs r0, 0
	bl SetVBlankCallback
	bl remove_some_task
	movs r2, 0xA0
	lsls r2, 19
	mov r0, sp
	strh r4, [r0]
	ldr r1, _08071A98
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _08071A9C
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0xC0
	lsls r3, 9
	mov r4, sp
	movs r6, 0
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _08071AA0
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_08071A6E:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r5
	subs r3, r5
	cmp r3, r5
	bhi _08071A6E
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	b _08071B10
	.align 2, 0
_08071A98: .4byte 0x040000d4
_08071A9C: .4byte 0x81000200
_08071AA0: .4byte 0x81000800
_08071AA4:
	bl ResetSpriteData
	bl ResetTasks
	bl ResetPaletteFade
	bl dp12_8087EA4
	b _08071B10
_08071AB6:
	ldr r4, _08071AD4
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	b _08071B10
	.align 2, 0
_08071AD4: .4byte gWindowConfig_81E6CE4
_08071AD8:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	ldr r0, _08071B00
	bl SetVBlankCallback
	ldr r3, _08071B04
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _08071B08
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	b _08071B10
	.align 2, 0
_08071B00: .4byte sub_80719F0
_08071B04: .4byte 0x04000208
_08071B08: .4byte 0x04000200
_08071B0C:
	movs r0, 0x1
	b _08071B1A
_08071B10:
	mov r1, r8
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0
_08071B1A:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80719FC

	thumb_func_start sub_8071B28
sub_8071B28: @ 8071B28
	push {lr}
	ldr r0, _08071B48
	bl sub_80719FC
	cmp r0, 0
	beq _08071B42
	ldr r0, _08071B4C
	movs r1, 0x50
	bl CreateTask
	ldr r0, _08071B50
	bl SetMainCallback2
_08071B42:
	pop {r0}
	bx r0
	.align 2, 0
_08071B48: .4byte 0x03001bac
_08071B4C: .4byte sub_8071B64
_08071B50: .4byte sub_8071B54
	thumb_func_end sub_8071B28

	thumb_func_start sub_8071B54
sub_8071B54: @ 8071B54
	push {lr}
	bl RunTasks
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_8071B54

	thumb_func_start sub_8071B64
sub_8071B64: @ 8071B64
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08071B94
	adds r4, r0, r1
	ldr r0, _08071B98
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08071C14
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bhi _08071C14
	lsls r0, 2
	ldr r1, _08071B9C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08071B94: .4byte 0x03004b28
_08071B98: .4byte 0x0202f388
_08071B9C: .4byte _08071BA0
	.align 2, 0
_08071BA0:
	.4byte _08071BB4
	.4byte _08071BD4
	.4byte _08071BDE
	.4byte _08071BEE
	.4byte _08071C06
_08071BB4:
	bl MenuDisplayMessageBox
	ldr r0, _08071BD0
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	b _08071BFA
	.align 2, 0
_08071BD0: .4byte gUnknown_08411905
_08071BD4:
	bl sub_8047A1C
	bl sub_8125E2C
	b _08071BFE
_08071BDE:
	bl sub_8125E6C
	lsls r0, 24
	cmp r0, 0
	beq _08071C14
	bl sub_8047A34
	b _08071BFE
_08071BEE:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
_08071BFA:
	bl BeginNormalPaletteFade
_08071BFE:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _08071C14
_08071C06:
	ldr r0, _08071C1C
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_08071C14:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08071C1C: .4byte 0x03001770
	thumb_func_end sub_8071B64

	thumb_func_start sub_8071C20
sub_8071C20: @ 8071C20
	push {lr}
	movs r0, 0x5
	bl audio_play
	bl MenuZeroFillScreen
	bl sub_8064E2C
	bl script_env_2_disable
	bl sub_8072DEC
	pop {r0}
	bx r0
	thumb_func_end sub_8071C20

	thumb_func_start append_byte
append_byte: @ 8071C3C
	ldrb r3, [r1]
	adds r0, r3
	strb r2, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bx lr
	thumb_func_end append_byte

	.align 2, 0 @ Don't pad with nop.
