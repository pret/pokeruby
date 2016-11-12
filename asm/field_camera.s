	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start camera_move_and_redraw
camera_move_and_redraw: @ 80581FC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl CameraMove
	lsls r0, r4, 16
	asrs r0, 16
	lsls r1, r5, 16
	asrs r1, 16
	bl UpdateFieldObjectsForCameraUpdate
	bl DrawWholeMapView
	ldr r1, _08058230 @ =gUnknown_0300489C
	lsls r4, 4
	ldrh r0, [r1]
	subs r0, r4
	strh r0, [r1]
	ldr r1, _08058234 @ =gUnknown_03004898
	lsls r5, 4
	ldrh r0, [r1]
	subs r0, r5
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058230: .4byte gUnknown_0300489C
_08058234: .4byte gUnknown_03004898
	thumb_func_end camera_move_and_redraw

	thumb_func_start SetCameraPanningCallback
SetCameraPanningCallback: @ 8058238
	ldr r1, _08058240 @ =gUnknown_030005A0
	str r0, [r1]
	bx lr
	.align 2, 0
_08058240: .4byte gUnknown_030005A0
	thumb_func_end SetCameraPanningCallback

	thumb_func_start SetCameraPanning
SetCameraPanning: @ 8058244
	ldr r2, _08058254 @ =gUnknown_03000598
	strh r0, [r2]
	ldr r0, _08058258 @ =gUnknown_0300059A
	lsls r1, 16
	asrs r1, 16
	adds r1, 0x20
	strh r1, [r0]
	bx lr
	.align 2, 0
_08058254: .4byte gUnknown_03000598
_08058258: .4byte gUnknown_0300059A
	thumb_func_end SetCameraPanning

	thumb_func_start InstallCameraPanAheadCallback
InstallCameraPanAheadCallback: @ 805825C
	ldr r1, _08058278 @ =gUnknown_030005A0
	ldr r0, _0805827C @ =CameraPanningCB_PanAhead
	str r0, [r1]
	ldr r1, _08058280 @ =gUnknown_0300059C
	movs r0, 0
	strb r0, [r1]
	ldr r1, _08058284 @ =gUnknown_03000598
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08058288 @ =gUnknown_0300059A
	movs r0, 0x20
	strh r0, [r1]
	bx lr
	.align 2, 0
_08058278: .4byte gUnknown_030005A0
_0805827C: .4byte CameraPanningCB_PanAhead
_08058280: .4byte gUnknown_0300059C
_08058284: .4byte gUnknown_03000598
_08058288: .4byte gUnknown_0300059A
	thumb_func_end InstallCameraPanAheadCallback

	thumb_func_start UpdateCameraPanning
UpdateCameraPanning: @ 805828C
	push {lr}
	ldr r0, _080582BC @ =gUnknown_030005A0
	ldr r0, [r0]
	cmp r0, 0
	beq _0805829A
	bl _call_via_r0
_0805829A:
	ldr r2, _080582C0 @ =gSpriteCoordOffsetX
	ldr r0, _080582C4 @ =gUnknown_0300489C
	ldr r1, _080582C8 @ =gUnknown_03000598
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r2]
	ldr r2, _080582CC @ =gSpriteCoordOffsetY
	ldr r0, _080582D0 @ =gUnknown_03004898
	ldr r1, _080582D4 @ =gUnknown_0300059A
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r1
	subs r0, 0x8
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080582BC: .4byte gUnknown_030005A0
_080582C0: .4byte gSpriteCoordOffsetX
_080582C4: .4byte gUnknown_0300489C
_080582C8: .4byte gUnknown_03000598
_080582CC: .4byte gSpriteCoordOffsetY
_080582D0: .4byte gUnknown_03004898
_080582D4: .4byte gUnknown_0300059A
	thumb_func_end UpdateCameraPanning

	thumb_func_start CameraPanningCB_PanAhead
CameraPanningCB_PanAhead: @ 80582D8
	push {lr}
	ldr r0, _080582E8 @ =gUnknown_0202E854
	ldrb r0, [r0]
	cmp r0, 0
	bne _080582EC
	bl InstallCameraPanAheadCallback
	b _08058374
	.align 2, 0
_080582E8: .4byte gUnknown_0202E854
_080582EC:
	ldr r0, _08058304 @ =gPlayerAvatar
	ldrb r0, [r0, 0x3]
	cmp r0, 0x1
	bne _0805830C
	ldr r0, _08058308 @ =gUnknown_0300059C
	ldrb r1, [r0]
	movs r2, 0x1
	eors r1, r2
	strb r1, [r0]
	cmp r1, 0
	beq _08058374
	b _08058312
	.align 2, 0
_08058304: .4byte gPlayerAvatar
_08058308: .4byte gUnknown_0300059C
_0805830C:
	ldr r1, _08058334 @ =gUnknown_0300059C
	movs r0, 0
	strb r0, [r1]
_08058312:
	bl player_get_direction_upper_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0805833C
	ldr r2, _08058338 @ =gUnknown_0300059A
	ldrh r3, [r2]
	movs r0, 0
	ldrsh r1, [r2, r0]
	movs r0, 0x8
	negs r0, r0
	cmp r1, r0
	ble _08058374
	subs r0, r3, 0x2
	b _08058372
	.align 2, 0
_08058334: .4byte gUnknown_0300059C
_08058338: .4byte gUnknown_0300059A
_0805833C:
	cmp r0, 0x1
	bne _08058358
	ldr r1, _08058354 @ =gUnknown_0300059A
	ldrh r2, [r1]
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0x47
	bgt _08058374
	adds r0, r2, 0x2
	strh r0, [r1]
	b _08058374
	.align 2, 0
_08058354: .4byte gUnknown_0300059A
_08058358:
	ldr r2, _08058368 @ =gUnknown_0300059A
	ldrh r0, [r2]
	movs r3, 0
	ldrsh r1, [r2, r3]
	cmp r1, 0x1F
	bgt _0805836C
	adds r0, 0x2
	b _08058372
	.align 2, 0
_08058368: .4byte gUnknown_0300059A
_0805836C:
	cmp r1, 0x20
	ble _08058374
	subs r0, 0x2
_08058372:
	strh r0, [r2]
_08058374:
	pop {r0}
	bx r0
	thumb_func_end CameraPanningCB_PanAhead

	.align 2, 0 @ Don't pad with nop.
