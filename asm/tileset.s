	.include "constants/gba_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_8072DF8
sub_8072DF8: @ 8072DF8
	push {lr}
	sub sp, 0x4
	ldr r1, _08072E18
	movs r0, 0
	strb r0, [r1]
	movs r0, 0
	str r0, [sp]
	ldr r1, _08072E1C
	ldr r2, _08072E20
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08072E18: .4byte gUnknown_030006C0
_08072E1C: .4byte gUnknown_0202E9D8
_08072E20: .4byte 0x0500003c
	thumb_func_end sub_8072DF8

	thumb_func_start sub_8072E24
sub_8072E24: @ 8072E24
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 16
	lsrs r6, r2, 16
	ldr r3, _08072E6C
	ldrb r0, [r3]
	cmp r0, 0x13
	bhi _08072E64
	ldr r2, _08072E70
	adds r1, r0, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	str r4, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r1, r2, 0x4
	adds r0, r1
	str r5, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r6, [r0, 0x8]
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
_08072E64:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08072E6C: .4byte gUnknown_030006C0
_08072E70: .4byte gUnknown_0202E9D8
	thumb_func_end sub_8072E24

	thumb_func_start sub_8072E74
sub_8072E74: @ 8072E74
	push {r4-r6,lr}
	movs r3, 0
	ldr r4, _08072EB0
	adds r6, r4, 0
	ldrb r0, [r4]
	cmp r3, r0
	bge _08072EA6
	ldr r2, _08072EB4
	ldr r1, _08072EB8
	movs r5, 0x80
	lsls r5, 24
_08072E8A:
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, [r1, 0x4]
	str r0, [r2, 0x4]
	ldrh r0, [r1, 0x8]
	lsrs r0, 1
	orrs r0, r5
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	adds r1, 0xC
	adds r3, 0x1
	ldrb r0, [r4]
	cmp r3, r0
	blt _08072E8A
_08072EA6:
	movs r0, 0
	strb r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08072EB0: .4byte gUnknown_030006C0
_08072EB4: .4byte 0x040000d4
_08072EB8: .4byte gUnknown_0202E9D8
	thumb_func_end sub_8072E74

	thumb_func_start cur_mapheader_run_tileset_funcs_after_some_cpuset
cur_mapheader_run_tileset_funcs_after_some_cpuset: @ 8072EBC
	push {lr}
	bl sub_8072DF8
	bl cur_mapheader_run_tileset1_func
	bl cur_mapheader_run_tileset2_func
	pop {r0}
	bx r0
	thumb_func_end cur_mapheader_run_tileset_funcs_after_some_cpuset

	thumb_func_start sub_8072ED0
sub_8072ED0: @ 8072ED0
	push {lr}
	bl cur_mapheader_run_tileset2_func
	pop {r0}
	bx r0
	thumb_func_end sub_8072ED0

	thumb_func_start sub_8072EDC
sub_8072EDC: @ 8072EDC
	push {r4,lr}
	bl sub_8072DF8
	ldr r2, _08072F34
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	ldr r1, _08072F38
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r1]
	cmp r0, r1
	bcc _08072EFA
	movs r0, 0
	strh r0, [r2]
_08072EFA:
	ldr r4, _08072F3C
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	ldr r1, _08072F40
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r1]
	cmp r0, r1
	bcc _08072F12
	movs r0, 0
	strh r0, [r4]
_08072F12:
	ldr r0, _08072F44
	ldr r1, [r0]
	cmp r1, 0
	beq _08072F20
	ldrh r0, [r2]
	bl _call_via_r1
_08072F20:
	ldr r0, _08072F48
	ldr r1, [r0]
	cmp r1, 0
	beq _08072F2E
	ldrh r0, [r4]
	bl _call_via_r1
_08072F2E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08072F34: .4byte gUnknown_030006C2
_08072F38: .4byte gUnknown_030006C4
_08072F3C: .4byte gUnknown_030006C6
_08072F40: .4byte gUnknown_030006C8
_08072F44: .4byte gUnknown_030006CC
_08072F48: .4byte gUnknown_030006D0
	thumb_func_end sub_8072EDC

	thumb_func_start cur_mapheader_run_tileset1_func
cur_mapheader_run_tileset1_func: @ 8072F4C
	push {lr}
	ldr r0, _08072F78
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08072F7C
	strh r1, [r0]
	ldr r1, _08072F80
	movs r0, 0
	str r0, [r1]
	ldr r0, _08072F84
	ldr r0, [r0]
	ldr r0, [r0, 0x10]
	cmp r0, 0
	beq _08072F72
	ldr r0, [r0, 0x14]
	cmp r0, 0
	beq _08072F72
	bl _call_via_r0
_08072F72:
	pop {r0}
	bx r0
	.align 2, 0
_08072F78: .4byte gUnknown_030006C2
_08072F7C: .4byte gUnknown_030006C4
_08072F80: .4byte gUnknown_030006CC
_08072F84: .4byte gMapHeader
	thumb_func_end cur_mapheader_run_tileset1_func

	thumb_func_start cur_mapheader_run_tileset2_func
cur_mapheader_run_tileset2_func: @ 8072F88
	push {lr}
	ldr r0, _08072FB4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08072FB8
	strh r1, [r0]
	ldr r1, _08072FBC
	movs r0, 0
	str r0, [r1]
	ldr r0, _08072FC0
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	cmp r0, 0
	beq _08072FAE
	ldr r0, [r0, 0x14]
	cmp r0, 0
	beq _08072FAE
	bl _call_via_r0
_08072FAE:
	pop {r0}
	bx r0
	.align 2, 0
_08072FB4: .4byte gUnknown_030006C6
_08072FB8: .4byte gUnknown_030006C8
_08072FBC: .4byte gUnknown_030006D0
_08072FC0: .4byte gMapHeader
	thumb_func_end cur_mapheader_run_tileset2_func

	thumb_func_start TilesetCB_General
TilesetCB_General: @ 8072FC4
	ldr r1, _08072FDC
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08072FE0
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08072FE4
	ldr r0, _08072FE8
	str r0, [r1]
	bx lr
	.align 2, 0
_08072FDC: .4byte gUnknown_030006C2
_08072FE0: .4byte gUnknown_030006C4
_08072FE4: .4byte gUnknown_030006CC
_08072FE8: .4byte sub_8073014
	thumb_func_end TilesetCB_General

	thumb_func_start TilesetCB_Building
TilesetCB_Building: @ 8072FEC
	ldr r1, _08073004
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08073008
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0807300C
	ldr r0, _08073010
	str r0, [r1]
	bx lr
	.align 2, 0
_08073004: .4byte gUnknown_030006C2
_08073008: .4byte gUnknown_030006C4
_0807300C: .4byte gUnknown_030006CC
_08073010: .4byte sub_8073058
	thumb_func_end TilesetCB_Building

	thumb_func_start sub_8073014
sub_8073014: @ 8073014
	push {r4,r5,lr}
	lsls r5, r0, 16
	movs r0, 0xF0
	lsls r0, 12
	ands r0, r5
	lsrs r4, r0, 16
	cmp r4, 0
	bne _0807302A
	lsrs r0, r5, 20
	bl sub_8073070
_0807302A:
	cmp r4, 0x1
	bne _08073034
	lsrs r0, r5, 20
	bl sub_8073098
_08073034:
	cmp r4, 0x2
	bne _0807303E
	lsrs r0, r5, 20
	bl sub_80730C0
_0807303E:
	cmp r4, 0x3
	bne _08073048
	lsrs r0, r5, 20
	bl sub_80730E8
_08073048:
	cmp r4, 0x4
	bne _08073052
	lsrs r0, r5, 20
	bl sub_807361C
_08073052:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8073014

	thumb_func_start sub_8073058
sub_8073058: @ 8073058
	push {lr}
	lsls r1, r0, 16
	movs r0, 0xE0
	lsls r0, 11
	ands r0, r1
	cmp r0, 0
	bne _0807306C
	lsrs r0, r1, 19
	bl sub_8073904
_0807306C:
	pop {r0}
	bx r0
	thumb_func_end sub_8073058

	thumb_func_start sub_8073070
sub_8073070: @ 8073070
	push {lr}
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	ldr r0, _08073090
	lsrs r1, 14
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _08073094
	movs r2, 0x80
	bl sub_8072E24
	pop {r0}
	bx r0
	.align 2, 0
_08073090: .4byte gTilesetAnimTable_General_0
_08073094: .4byte 0x06003f80
	thumb_func_end sub_8073070

	thumb_func_start sub_8073098
sub_8073098: @ 8073098
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x7
	ands r0, r1
	ldr r1, _080730B8
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080730BC
	movs r2, 0xF0
	lsls r2, 2
	bl sub_8072E24
	pop {r0}
	bx r0
	.align 2, 0
_080730B8: .4byte gTilesetAnimTable_General_1
_080730BC: .4byte 0x06003600
	thumb_func_end sub_8073098

	thumb_func_start sub_80730C0
sub_80730C0: @ 80730C0
	push {lr}
	lsls r0, 16
	movs r1, 0xE0
	lsls r1, 11
	ands r1, r0
	ldr r0, _080730E0
	lsrs r1, 14
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _080730E4
	movs r2, 0xA0
	lsls r2, 1
	bl sub_8072E24
	pop {r0}
	bx r0
	.align 2, 0
_080730E0: .4byte gTilesetAnimTable_General_2
_080730E4: .4byte 0x06003a00
	thumb_func_end sub_80730C0

	thumb_func_start sub_80730E8
sub_80730E8: @ 80730E8
	push {lr}
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	ldr r0, _08073108
	lsrs r1, 14
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _0807310C
	movs r2, 0xC0
	bl sub_8072E24
	pop {r0}
	bx r0
	.align 2, 0
_08073108: .4byte gTilesetAnimTable_General_3
_0807310C: .4byte 0x06003e00
	thumb_func_end sub_80730E8

	thumb_func_start TilesetCB_Petalburg
TilesetCB_Petalburg: @ 8073110
	ldr r1, _08073128
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0807312C
	ldr r0, _08073130
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08073134
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_08073128: .4byte gUnknown_030006C6
_0807312C: .4byte gUnknown_030006C8
_08073130: .4byte gUnknown_030006C4
_08073134: .4byte gUnknown_030006D0
	thumb_func_end TilesetCB_Petalburg

	thumb_func_start TilesetCB_Rustboro
TilesetCB_Rustboro: @ 8073138
	ldr r1, _08073150
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08073154
	ldr r0, _08073158
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0807315C
	ldr r0, _08073160
	str r0, [r1]
	bx lr
	.align 2, 0
_08073150: .4byte gUnknown_030006C6
_08073154: .4byte gUnknown_030006C8
_08073158: .4byte gUnknown_030006C4
_0807315C: .4byte gUnknown_030006D0
_08073160: .4byte sub_8073424
	thumb_func_end TilesetCB_Rustboro

	thumb_func_start TilesetCB_Dewford
TilesetCB_Dewford: @ 8073164
	ldr r1, _0807317C
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08073180
	ldr r0, _08073184
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08073188
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_0807317C: .4byte gUnknown_030006C6
_08073180: .4byte gUnknown_030006C8
_08073184: .4byte gUnknown_030006C4
_08073188: .4byte gUnknown_030006D0
	thumb_func_end TilesetCB_Dewford

	thumb_func_start TilesetCB_Slateport
TilesetCB_Slateport: @ 807318C
	ldr r1, _080731A4
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080731A8
	ldr r0, _080731AC
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080731B0
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_080731A4: .4byte gUnknown_030006C6
_080731A8: .4byte gUnknown_030006C8
_080731AC: .4byte gUnknown_030006C4
_080731B0: .4byte gUnknown_030006D0
	thumb_func_end TilesetCB_Slateport

	thumb_func_start TilesetCB_Mauville
TilesetCB_Mauville: @ 80731B4
	ldr r1, _080731CC
	ldr r0, _080731D0
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080731D4
	ldr r0, _080731D8
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080731DC
	ldr r0, _080731E0
	str r0, [r1]
	bx lr
	.align 2, 0
_080731CC: .4byte gUnknown_030006C6
_080731D0: .4byte gUnknown_030006C2
_080731D4: .4byte gUnknown_030006C8
_080731D8: .4byte gUnknown_030006C4
_080731DC: .4byte gUnknown_030006D0
_080731E0: .4byte sub_80734A0
	thumb_func_end TilesetCB_Mauville

	thumb_func_start TilesetCB_Lavaridge
TilesetCB_Lavaridge: @ 80731E4
	ldr r1, _080731FC
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08073200
	ldr r0, _08073204
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08073208
	ldr r0, _0807320C
	str r0, [r1]
	bx lr
	.align 2, 0
_080731FC: .4byte gUnknown_030006C6
_08073200: .4byte gUnknown_030006C8
_08073204: .4byte gUnknown_030006C4
_08073208: .4byte gUnknown_030006D0
_0807320C: .4byte sub_8073514
	thumb_func_end TilesetCB_Lavaridge

	thumb_func_start TilesetCB_Fallarbor
TilesetCB_Fallarbor: @ 8073210
	ldr r1, _08073228
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0807322C
	ldr r0, _08073230
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08073234
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_08073228: .4byte gUnknown_030006C6
_0807322C: .4byte gUnknown_030006C8
_08073230: .4byte gUnknown_030006C4
_08073234: .4byte gUnknown_030006D0
	thumb_func_end TilesetCB_Fallarbor

	thumb_func_start TilesetCB_Fortree
TilesetCB_Fortree: @ 8073238
	ldr r1, _08073250
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08073254
	ldr r0, _08073258
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0807325C
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_08073250: .4byte gUnknown_030006C6
_08073254: .4byte gUnknown_030006C8
_08073258: .4byte gUnknown_030006C4
_0807325C: .4byte gUnknown_030006D0
	thumb_func_end TilesetCB_Fortree

	thumb_func_start TilesetCB_Lilycove
TilesetCB_Lilycove: @ 8073260
	ldr r1, _08073278
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0807327C
	ldr r0, _08073280
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08073284
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_08073278: .4byte gUnknown_030006C6
_0807327C: .4byte gUnknown_030006C8
_08073280: .4byte gUnknown_030006C4
_08073284: .4byte gUnknown_030006D0
	thumb_func_end TilesetCB_Lilycove

	thumb_func_start TilesetCB_Mossdeep
TilesetCB_Mossdeep: @ 8073288
	ldr r1, _080732A0
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080732A4
	ldr r0, _080732A8
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080732AC
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_080732A0: .4byte gUnknown_030006C6
_080732A4: .4byte gUnknown_030006C8
_080732A8: .4byte gUnknown_030006C4
_080732AC: .4byte gUnknown_030006D0
	thumb_func_end TilesetCB_Mossdeep

	thumb_func_start TilesetCB_EverGrande
TilesetCB_EverGrande: @ 80732B0
	ldr r1, _080732C8
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080732CC
	ldr r0, _080732D0
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080732D4
	ldr r0, _080732D8
	str r0, [r1]
	bx lr
	.align 2, 0
_080732C8: .4byte gUnknown_030006C6
_080732CC: .4byte gUnknown_030006C8
_080732D0: .4byte gUnknown_030006C4
_080732D4: .4byte gUnknown_030006D0
_080732D8: .4byte sub_8073540
	thumb_func_end TilesetCB_EverGrande

	thumb_func_start TilesetCB_Pacifidlog
TilesetCB_Pacifidlog: @ 80732DC
	ldr r1, _080732F4
	ldr r0, _080732F8
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080732FC
	ldr r0, _08073300
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08073304
	ldr r0, _08073308
	str r0, [r1]
	bx lr
	.align 2, 0
_080732F4: .4byte gUnknown_030006C6
_080732F8: .4byte gUnknown_030006C2
_080732FC: .4byte gUnknown_030006C8
_08073300: .4byte gUnknown_030006C4
_08073304: .4byte gUnknown_030006D0
_08073308: .4byte sub_80735B4
	thumb_func_end TilesetCB_Pacifidlog

	thumb_func_start TilesetCB_Sootopolis
TilesetCB_Sootopolis: @ 807330C
	ldr r1, _08073324
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08073328
	ldr r0, _0807332C
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08073330
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_08073324: .4byte gUnknown_030006C6
_08073328: .4byte gUnknown_030006C8
_0807332C: .4byte gUnknown_030006C4
_08073330: .4byte gUnknown_030006D0
	thumb_func_end TilesetCB_Sootopolis

	thumb_func_start TilesetCB_Underwater
TilesetCB_Underwater: @ 8073334
	ldr r1, _08073348
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0807334C
	movs r0, 0x80
	strh r0, [r1]
	ldr r1, _08073350
	ldr r0, _08073354
	str r0, [r1]
	bx lr
	.align 2, 0
_08073348: .4byte gUnknown_030006C6
_0807334C: .4byte gUnknown_030006C8
_08073350: .4byte gUnknown_030006D0
_08073354: .4byte sub_80735E4
	thumb_func_end TilesetCB_Underwater

	thumb_func_start TilesetCB_SootopolisGym
TilesetCB_SootopolisGym: @ 8073358
	ldr r1, _0807336C
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08073370
	movs r0, 0xF0
	strh r0, [r1]
	ldr r1, _08073374
	ldr r0, _08073378
	str r0, [r1]
	bx lr
	.align 2, 0
_0807336C: .4byte gUnknown_030006C6
_08073370: .4byte gUnknown_030006C8
_08073374: .4byte gUnknown_030006D0
_08073378: .4byte sub_80738A8
	thumb_func_end TilesetCB_SootopolisGym

	thumb_func_start TilesetCB_Cave
TilesetCB_Cave: @ 807337C
	ldr r1, _08073394
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08073398
	ldr r0, _0807339C
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080733A0
	ldr r0, _080733A4
	str r0, [r1]
	bx lr
	.align 2, 0
_08073394: .4byte gUnknown_030006C6
_08073398: .4byte gUnknown_030006C8
_0807339C: .4byte gUnknown_030006C4
_080733A0: .4byte gUnknown_030006D0
_080733A4: .4byte sub_8073600
	thumb_func_end TilesetCB_Cave

	thumb_func_start TilesetCB_EliteFour
TilesetCB_EliteFour: @ 80733A8
	ldr r1, _080733BC
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080733C0
	movs r0, 0x80
	strh r0, [r1]
	ldr r1, _080733C4
	ldr r0, _080733C8
	str r0, [r1]
	bx lr
	.align 2, 0
_080733BC: .4byte gUnknown_030006C6
_080733C0: .4byte gUnknown_030006C8
_080733C4: .4byte gUnknown_030006D0
_080733C8: .4byte sub_80738C0
	thumb_func_end TilesetCB_EliteFour

	thumb_func_start TilesetCB_MauvilleGym
TilesetCB_MauvilleGym: @ 80733CC
	ldr r1, _080733E4
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080733E8
	ldr r0, _080733EC
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080733F0
	ldr r0, _080733F4
	str r0, [r1]
	bx lr
	.align 2, 0
_080733E4: .4byte gUnknown_030006C6
_080733E8: .4byte gUnknown_030006C8
_080733EC: .4byte gUnknown_030006C4
_080733F0: .4byte gUnknown_030006D0
_080733F4: .4byte sub_8073890
	thumb_func_end TilesetCB_MauvilleGym

	thumb_func_start TilesetCB_BikeShop
TilesetCB_BikeShop: @ 80733F8
	ldr r1, _08073410
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08073414
	ldr r0, _08073418
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0807341C
	ldr r0, _08073420
	str r0, [r1]
	bx lr
	.align 2, 0
_08073410: .4byte gUnknown_030006C6
_08073414: .4byte gUnknown_030006C8
_08073418: .4byte gUnknown_030006C4
_0807341C: .4byte gUnknown_030006D0
_08073420: .4byte sub_80738EC
	thumb_func_end TilesetCB_BikeShop

	thumb_func_start sub_8073424
sub_8073424: @ 8073424
	push {r4-r6,lr}
	lsls r5, r0, 16
	movs r0, 0xE0
	lsls r0, 11
	ands r0, r5
	lsrs r6, r0, 16
	cmp r6, 0
	bne _08073444
	lsrs r4, r5, 19
	adds r0, r4, 0
	movs r1, 0
	bl sub_80737A4
	adds r0, r4, 0
	bl sub_80737E0
_08073444:
	cmp r6, 0x1
	bne _08073450
	lsrs r0, r5, 19
	movs r1, 0x1
	bl sub_80737A4
_08073450:
	cmp r6, 0x2
	bne _0807345C
	lsrs r0, r5, 19
	movs r1, 0x2
	bl sub_80737A4
_0807345C:
	cmp r6, 0x3
	bne _08073468
	lsrs r0, r5, 19
	movs r1, 0x3
	bl sub_80737A4
_08073468:
	cmp r6, 0x4
	bne _08073474
	lsrs r0, r5, 19
	movs r1, 0x4
	bl sub_80737A4
_08073474:
	cmp r6, 0x5
	bne _08073480
	lsrs r0, r5, 19
	movs r1, 0x5
	bl sub_80737A4
_08073480:
	cmp r6, 0x6
	bne _0807348C
	lsrs r0, r5, 19
	movs r1, 0x6
	bl sub_80737A4
_0807348C:
	cmp r6, 0x7
	bne _08073498
	lsrs r0, r5, 19
	movs r1, 0x7
	bl sub_80737A4
_08073498:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8073424

	thumb_func_start sub_80734A0
sub_80734A0: @ 80734A0
	push {r4,r5,lr}
	lsls r4, r0, 16
	movs r0, 0xE0
	lsls r0, 11
	ands r0, r4
	lsrs r5, r0, 16
	cmp r5, 0
	bne _080734B8
	lsrs r0, r4, 19
	movs r1, 0
	bl sub_8073704
_080734B8:
	cmp r5, 0x1
	bne _080734C4
	lsrs r0, r4, 19
	movs r1, 0x1
	bl sub_8073704
_080734C4:
	cmp r5, 0x2
	bne _080734D0
	lsrs r0, r4, 19
	movs r1, 0x2
	bl sub_8073704
_080734D0:
	cmp r5, 0x3
	bne _080734DC
	lsrs r0, r4, 19
	movs r1, 0x3
	bl sub_8073704
_080734DC:
	cmp r5, 0x4
	bne _080734E8
	lsrs r0, r4, 19
	movs r1, 0x4
	bl sub_8073704
_080734E8:
	cmp r5, 0x5
	bne _080734F4
	lsrs r0, r4, 19
	movs r1, 0x5
	bl sub_8073704
_080734F4:
	cmp r5, 0x6
	bne _08073500
	lsrs r0, r4, 19
	movs r1, 0x6
	bl sub_8073704
_08073500:
	cmp r5, 0x7
	bne _0807350C
	lsrs r0, r4, 19
	movs r1, 0x7
	bl sub_8073704
_0807350C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80734A0

	thumb_func_start sub_8073514
sub_8073514: @ 8073514
	push {r4,r5,lr}
	lsls r4, r0, 16
	movs r0, 0xF0
	lsls r0, 12
	ands r0, r4
	lsrs r5, r0, 16
	cmp r5, 0
	bne _0807352E
	lsrs r0, r4, 20
	lsls r0, 24
	lsrs r0, 24
	bl sub_8073644
_0807352E:
	cmp r5, 0x1
	bne _08073538
	lsrs r0, r4, 20
	bl sub_8073808
_08073538:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8073514

	thumb_func_start sub_8073540
sub_8073540: @ 8073540
	push {r4,r5,lr}
	lsls r4, r0, 16
	movs r0, 0xE0
	lsls r0, 11
	ands r0, r4
	lsrs r5, r0, 16
	cmp r5, 0
	bne _08073558
	lsrs r0, r4, 19
	movs r1, 0
	bl sub_8073830
_08073558:
	cmp r5, 0x1
	bne _08073564
	lsrs r0, r4, 19
	movs r1, 0x1
	bl sub_8073830
_08073564:
	cmp r5, 0x2
	bne _08073570
	lsrs r0, r4, 19
	movs r1, 0x2
	bl sub_8073830
_08073570:
	cmp r5, 0x3
	bne _0807357C
	lsrs r0, r4, 19
	movs r1, 0x3
	bl sub_8073830
_0807357C:
	cmp r5, 0x4
	bne _08073588
	lsrs r0, r4, 19
	movs r1, 0x4
	bl sub_8073830
_08073588:
	cmp r5, 0x5
	bne _08073594
	lsrs r0, r4, 19
	movs r1, 0x5
	bl sub_8073830
_08073594:
	cmp r5, 0x6
	bne _080735A0
	lsrs r0, r4, 19
	movs r1, 0x6
	bl sub_8073830
_080735A0:
	cmp r5, 0x7
	bne _080735AC
	lsrs r0, r4, 19
	movs r1, 0x7
	bl sub_8073830
_080735AC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8073540

	thumb_func_start sub_80735B4
sub_80735B4: @ 80735B4
	push {r4,r5,lr}
	lsls r4, r0, 16
	movs r0, 0xF0
	lsls r0, 12
	ands r0, r4
	lsrs r5, r0, 16
	cmp r5, 0
	bne _080735CE
	lsrs r0, r4, 20
	lsls r0, 24
	lsrs r0, 24
	bl sub_807368C
_080735CE:
	cmp r5, 0x1
	bne _080735DC
	lsrs r0, r4, 20
	lsls r0, 24
	lsrs r0, 24
	bl sub_80736DC
_080735DC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80735B4

	thumb_func_start sub_80735E4
sub_80735E4: @ 80735E4
	push {lr}
	lsls r1, r0, 16
	movs r0, 0xF0
	lsls r0, 12
	ands r0, r1
	cmp r0, 0
	bne _080735FC
	lsrs r0, r1, 20
	lsls r0, 24
	lsrs r0, 24
	bl sub_80736B4
_080735FC:
	pop {r0}
	bx r0
	thumb_func_end sub_80735E4

	thumb_func_start sub_8073600
sub_8073600: @ 8073600
	push {lr}
	lsls r1, r0, 16
	movs r0, 0xF0
	lsls r0, 12
	ands r0, r1
	lsrs r0, 16
	cmp r0, 0x1
	bne _08073616
	lsrs r0, r1, 20
	bl sub_8073868
_08073616:
	pop {r0}
	bx r0
	thumb_func_end sub_8073600

	thumb_func_start sub_807361C
sub_807361C: @ 807361C
	push {lr}
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	ldr r0, _0807363C
	lsrs r1, 14
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _08073640
	movs r2, 0xA0
	lsls r2, 1
	bl sub_8072E24
	pop {r0}
	bx r0
	.align 2, 0
_0807363C: .4byte gTilesetAnimTable_General_4
_08073640: .4byte 0x06003c00
	thumb_func_end sub_807361C

	thumb_func_start sub_8073644
sub_8073644: @ 8073644
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x3
	ands r0, r4
	ldr r5, _08073680
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	ldr r1, _08073684
	movs r2, 0x80
	bl sub_8072E24
	adds r1, r4, 0x2
	adds r0, r1, 0
	asrs r0, 2
	lsls r0, 2
	subs r0, r1, r0
	lsls r0, 24
	lsrs r0, 22
	adds r0, r5
	ldr r0, [r0]
	ldr r1, _08073688
	movs r2, 0x80
	bl sub_8072E24
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08073680: .4byte gTilesetAnimTable_Lavaridge
_08073684: .4byte 0x06006400
_08073688: .4byte 0x06006480
	thumb_func_end sub_8073644

	thumb_func_start sub_807368C
sub_807368C: @ 807368C
	push {lr}
	lsls r0, 24
	movs r1, 0xC0
	lsls r1, 18
	ands r1, r0
	ldr r0, _080736AC
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _080736B0
	movs r2, 0xF0
	lsls r2, 2
	bl sub_8072E24
	pop {r0}
	bx r0
	.align 2, 0
_080736AC: .4byte gTilesetAnimTable_Pacifidlog_0
_080736B0: .4byte 0x06007a00
	thumb_func_end sub_807368C

	thumb_func_start sub_80736B4
sub_80736B4: @ 80736B4
	push {lr}
	lsls r0, 24
	movs r1, 0xC0
	lsls r1, 18
	ands r1, r0
	ldr r0, _080736D4
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _080736D8
	movs r2, 0x80
	bl sub_8072E24
	pop {r0}
	bx r0
	.align 2, 0
_080736D4: .4byte gTilesetAnimTable_Underwater
_080736D8: .4byte 0x06007e00
	thumb_func_end sub_80736B4

	thumb_func_start sub_80736DC
sub_80736DC: @ 80736DC
	push {lr}
	lsls r0, 24
	movs r1, 0xE0
	lsls r1, 19
	ands r1, r0
	ldr r0, _080736FC
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _08073700
	movs r2, 0x80
	lsls r2, 1
	bl sub_8072E24
	pop {r0}
	bx r0
	.align 2, 0
_080736FC: .4byte gTilesetAnimTable_Pacifidlog_1
_08073700: .4byte 0x06007e00
	thumb_func_end sub_80736DC

	thumb_func_start sub_8073704
sub_8073704: @ 8073704
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 24
	lsrs r6, r1, 24
	subs r0, r5, r6
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0xB
	bhi _08073760
	adds r0, r5, 0
	movs r1, 0xC
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 16
	ldr r0, _08073750
	lsrs r4, 14
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _08073754
	lsls r5, r6, 2
	adds r1, r5, r1
	ldr r1, [r1]
	movs r2, 0x80
	bl sub_8072E24
	ldr r0, _08073758
	adds r4, r0
	ldr r0, [r4]
	ldr r1, _0807375C
	adds r5, r1
	ldr r1, [r5]
	movs r2, 0x80
	bl sub_8072E24
	b _0807378C
	.align 2, 0
_08073750: .4byte gTilesetAnimTable_Mauville_0A
_08073754: .4byte gUnknown_0837BAE4
_08073758: .4byte gTilesetAnimTable_Mauville_1A
_0807375C: .4byte gUnknown_0837BB04
_08073760:
	movs r0, 0x3
	ands r5, r0
	ldr r0, _08073794
	lsls r5, 2
	adds r0, r5, r0
	ldr r0, [r0]
	ldr r1, _08073798
	lsls r4, r6, 2
	adds r1, r4, r1
	ldr r1, [r1]
	movs r2, 0x80
	bl sub_8072E24
	ldr r0, _0807379C
	adds r5, r0
	ldr r0, [r5]
	ldr r1, _080737A0
	adds r4, r1
	ldr r1, [r4]
	movs r2, 0x80
	bl sub_8072E24
_0807378C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08073794: .4byte gTilesetAnimTable_Mauville_0B
_08073798: .4byte gUnknown_0837BAE4
_0807379C: .4byte gTilesetAnimTable_Mauville_1B
_080737A0: .4byte gUnknown_0837BB04
	thumb_func_end sub_8073704

	thumb_func_start sub_80737A4
sub_80737A4: @ 80737A4
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r3, r1, 24
	subs r0, r3
	lsls r0, 16
	movs r1, 0xE0
	lsls r1, 11
	ands r1, r0
	ldr r0, _080737D8
	lsrs r1, 14
	adds r1, r0
	ldr r2, [r1]
	cmp r2, 0
	beq _080737D4
	ldr r0, _080737DC
	lsls r1, r3, 2
	adds r1, r0
	ldr r1, [r1]
	adds r0, r2, 0
	movs r2, 0x80
	bl sub_8072E24
_080737D4:
	pop {r0}
	bx r0
	.align 2, 0
_080737D8: .4byte gTilesetAnimTable_Rustboro_0
_080737DC: .4byte gUnknown_0837BFA4
	thumb_func_end sub_80737A4

	thumb_func_start sub_80737E0
sub_80737E0: @ 80737E0
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	ldr r1, _08073800
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08073804
	movs r2, 0x80
	bl sub_8072E24
	pop {r0}
	bx r0
	.align 2, 0
_08073800: .4byte gTilesetAnimTable_Rustboro_1
_08073804: .4byte 0x06007800
	thumb_func_end sub_80737E0

	thumb_func_start sub_8073808
sub_8073808: @ 8073808
	push {lr}
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	ldr r0, _08073828
	lsrs r1, 14
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _0807382C
	movs r2, 0x80
	bl sub_8072E24
	pop {r0}
	bx r0
	.align 2, 0
_08073828: .4byte gTilesetAnimTable_Cave
_0807382C: .4byte 0x06005400
	thumb_func_end sub_8073808

	thumb_func_start sub_8073830
sub_8073830: @ 8073830
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r1, 24
	subs r0, r1
	lsls r0, 16
	movs r2, 0xE0
	lsls r2, 11
	ands r2, r0
	ldr r0, _08073860
	lsrs r2, 14
	adds r2, r0
	ldr r0, [r2]
	ldr r2, _08073864
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	movs r2, 0x80
	bl sub_8072E24
	pop {r0}
	bx r0
	.align 2, 0
_08073860: .4byte gTilesetAnimTable_EverGrande
_08073864: .4byte gUnknown_0837C93C
	thumb_func_end sub_8073830

	thumb_func_start sub_8073868
sub_8073868: @ 8073868
	push {lr}
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	ldr r0, _08073888
	lsrs r1, 14
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _0807388C
	movs r2, 0x80
	bl sub_8072E24
	pop {r0}
	bx r0
	.align 2, 0
_08073888: .4byte gTilesetAnimTable_Cave
_0807388C: .4byte 0x06007400
	thumb_func_end sub_8073868

	thumb_func_start sub_8073890
sub_8073890: @ 8073890
	push {lr}
	lsls r2, r0, 16
	lsrs r0, r2, 16
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080738A4
	lsrs r0, r2, 17
	bl sub_80739C4
_080738A4:
	pop {r0}
	bx r0
	thumb_func_end sub_8073890

	thumb_func_start sub_80738A8
sub_80738A8: @ 80738A8
	push {lr}
	lsls r1, r0, 16
	movs r0, 0xE0
	lsls r0, 11
	ands r0, r1
	cmp r0, 0
	bne _080738BC
	lsrs r0, r1, 19
	bl sub_807392C
_080738BC:
	pop {r0}
	bx r0
	thumb_func_end sub_80738A8

	thumb_func_start sub_80738C0
sub_80738C0: @ 80738C0
	push {r4,r5,lr}
	lsls r4, r0, 16
	lsrs r0, r4, 16
	adds r5, r0, 0
	movs r0, 0x3F
	ands r0, r5
	cmp r0, 0
	bne _080738D6
	lsrs r0, r4, 22
	bl sub_807399C
_080738D6:
	movs r0, 0x7
	ands r0, r5
	cmp r0, 0x1
	bne _080738E4
	lsrs r0, r4, 19
	bl sub_8073974
_080738E4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80738C0

	thumb_func_start sub_80738EC
sub_80738EC: @ 80738EC
	push {lr}
	lsls r1, r0, 16
	movs r0, 0xC0
	lsls r0, 10
	ands r0, r1
	cmp r0, 0
	bne _08073900
	lsrs r0, r1, 18
	bl sub_80739EC
_08073900:
	pop {r0}
	bx r0
	thumb_func_end sub_80738EC

	thumb_func_start sub_8073904
sub_8073904: @ 8073904
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	ldr r1, _08073924
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08073928
	movs r2, 0x80
	bl sub_8072E24
	pop {r0}
	bx r0
	.align 2, 0
_08073924: .4byte gTilesetAnimTable_Building
_08073928: .4byte 0x06003e00
	thumb_func_end sub_8073904

	thumb_func_start sub_807392C
sub_807392C: @ 807392C
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 16
	ldr r0, _08073964
	lsrs r4, 14
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _08073968
	movs r2, 0xC0
	lsls r2, 1
	bl sub_8072E24
	ldr r0, _0807396C
	adds r4, r0
	ldr r0, [r4]
	ldr r1, _08073970
	movs r2, 0xA0
	lsls r2, 2
	bl sub_8072E24
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073964: .4byte gTilesetAnimTable_SootopolisGym_0
_08073968: .4byte 0x06007e00
_0807396C: .4byte gTilesetAnimTable_SootopolisGym_1
_08073970: .4byte 0x06007a00
	thumb_func_end sub_807392C

	thumb_func_start sub_8073974
sub_8073974: @ 8073974
	push {lr}
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	ldr r0, _08073994
	lsrs r1, 14
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _08073998
	movs r2, 0x20
	bl sub_8072E24
	pop {r0}
	bx r0
	.align 2, 0
_08073994: .4byte gTilesetAnimTable_EliteFour_0
_08073998: .4byte 0x06007f00
	thumb_func_end sub_8073974

	thumb_func_start sub_807399C
sub_807399C: @ 807399C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	ldr r1, _080739BC
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080739C0
	movs r2, 0x80
	bl sub_8072E24
	pop {r0}
	bx r0
	.align 2, 0
_080739BC: .4byte gTilesetAnimTable_EliteFour_1
_080739C0: .4byte 0x06007c00
	thumb_func_end sub_807399C

	thumb_func_start sub_80739C4
sub_80739C4: @ 80739C4
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	ldr r1, _080739E4
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080739E8
	movs r2, 0x80
	lsls r2, 2
	bl sub_8072E24
	pop {r0}
	bx r0
	.align 2, 0
_080739E4: .4byte gTilesetAnimTable_MauvilleGym
_080739E8: .4byte 0x06005200
	thumb_func_end sub_80739C4

	thumb_func_start sub_80739EC
sub_80739EC: @ 80739EC
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	ldr r1, _08073A0C
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08073A10
	movs r2, 0x90
	lsls r2, 1
	bl sub_8072E24
	pop {r0}
	bx r0
	.align 2, 0
_08073A0C: .4byte gTilesetAnimTable_BikeShop
_08073A10: .4byte 0x06007e00
	thumb_func_end sub_80739EC

	.align 2, 0 @ Don't pad with nop.
