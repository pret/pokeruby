	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_81231EC
sub_81231EC: @ 81231EC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08123210 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0812320A
	ldr r0, _08123214 @ =sub_8123244
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_0812320A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08123210: .4byte gPaletteFade
_08123214: .4byte sub_8123244
	thumb_func_end sub_81231EC

	thumb_func_start sub_8123218
sub_8123218: @ 8123218
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	ldr r0, _08123240 @ =sub_81231EC
	movs r1, 0x1
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
_08123240: .4byte sub_81231EC
	thumb_func_end sub_8123218

	thumb_func_start sub_8123244
sub_8123244: @ 8123244
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	ldr r1, _08123268 @ =gMain
	ldr r2, _0812326C @ =0x0000043c
	adds r0, r1, r2
	ldrb r0, [r0]
	mov r9, r1
	cmp r0, 0x8
	bhi _08123298
	lsls r0, 2
	ldr r1, _08123270 @ =_08123274
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08123268: .4byte gMain
_0812326C: .4byte 0x0000043c
_08123270: .4byte _08123274
	.align 2, 0
_08123274:
	.4byte _08123298
	.4byte _08123384
	.4byte _081233E8
	.4byte _08123484
	.4byte _081234A0
	.4byte _08123504
	.4byte _08123598
	.4byte _08123678
	.4byte _081236B0
_08123298:
	movs r0, 0
	bl SetVBlankCallback
	bl remove_some_task
	movs r3, 0xC0
	lsls r3, 19
	movs r4, 0xC0
	lsls r4, 9
	add r0, sp, 0xC
	mov r9, r0
	add r2, sp, 0x8
	movs r6, 0
	ldr r1, _08123368 @ =0x040000d4
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _0812336C @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r8, r0
_081232C0:
	strh r6, [r2]
	add r0, sp, 0x8
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _081232C0
	strh r6, [r2]
	add r2, sp, 0x8
	str r2, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r4, 1
	mov r2, r8
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0xE0
	lsls r0, 19
	movs r3, 0x80
	lsls r3, 3
	movs r4, 0
	str r4, [sp, 0xC]
	ldr r2, _08123368 @ =0x040000d4
	mov r1, r9
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
	add r0, sp, 0x8
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	lsrs r3, 1
	movs r4, 0x81
	lsls r4, 24
	orrs r3, r4
	str r3, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r1, _08123370 @ =gUnknown_02039274
	ldr r0, _08123374 @ =0x02017000
	str r0, [r1]
	adds r3, r0, 0
	ldr r5, _08123378 @ =0x000010fc
	ldr r0, _0812337C @ =gMain
	mov r9, r0
	add r1, sp, 0x8
	movs r7, 0
	movs r6, 0x80
	lsls r6, 5
	ldr r0, _0812336C @ =0x81000800
	mov r8, r0
_08123338:
	strh r7, [r1]
	add r0, sp, 0x8
	str r0, [r2]
	str r3, [r2, 0x4]
	mov r0, r8
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	adds r3, r6
	subs r5, r6
	cmp r5, r6
	bhi _08123338
	strh r7, [r1]
	add r1, sp, 0x8
	str r1, [r2]
	str r3, [r2, 0x4]
	lsrs r0, r5, 1
	orrs r0, r4
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r1, _08123380 @ =0x0000043c
	add r1, r9
	ldrb r0, [r1]
	adds r0, 0x1
	b _0812370C
	.align 2, 0
_08123368: .4byte 0x040000d4
_0812336C: .4byte 0x81000800
_08123370: .4byte gUnknown_02039274
_08123374: .4byte 0x02017000
_08123378: .4byte 0x000010fc
_0812337C: .4byte gMain
_08123380: .4byte 0x0000043c
_08123384:
	bl ResetSpriteData
	bl ResetTasks
	bl FreeAllSpritePalettes
	bl ResetPaletteFade
	bl sub_807C828
	movs r4, 0
	ldr r0, _081233D4 @ =gUnknown_08396FC4
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0xF0
	movs r2, 0
_081233A4:
	lsls r0, r4, 2
	adds r0, r1, r0
	str r2, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x13
	bls _081233A4
	bl InitMapMusic
	bl ResetMapMusic
	ldr r2, _081233D8 @ =gSpriteCoordOffsetX
	ldr r1, _081233DC @ =gSpriteCoordOffsetY
	movs r0, 0
	strh r0, [r1]
	strh r0, [r2]
	ldr r1, _081233E0 @ =gMain
	ldr r2, _081233E4 @ =0x0000043c
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	b _0812370C
	.align 2, 0
_081233D4: .4byte gUnknown_08396FC4
_081233D8: .4byte gSpriteCoordOffsetX
_081233DC: .4byte gSpriteCoordOffsetY
_081233E0: .4byte gMain
_081233E4: .4byte 0x0000043c
_081233E8:
	movs r4, 0
	ldr r5, _08123454 @ =gUnknown_08401CF8
_081233EC:
	lsls r0, r4, 3
	adds r0, r5
	bl LoadCompressedObjectPic
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _081233EC
	ldr r0, _08123458 @ =gUnknown_08401D18
	bl LoadSpritePalettes
	ldr r0, _0812345C @ =gCableCarMtChimneyTilemap
	ldr r4, _08123460 @ =0x02019000
	adds r1, r4, 0
	bl sub_800D238
	ldr r0, _08123464 @ =gCableCarTreeTilemap
	movs r2, 0xB4
	lsls r2, 1
	adds r1, r4, r2
	bl sub_800D238
	ldr r0, _08123468 @ =gCableCarMountainTilemap
	movs r2, 0xA5
	lsls r2, 3
	adds r1, r4, r2
	bl sub_800D238
	ldr r0, _0812346C @ =gCableCarPylonStemTilemap
	ldr r1, _08123470 @ =0x000009d8
	adds r4, r1
	adds r1, r4, 0
	bl sub_800D238
	ldr r0, _08123474 @ =gCableCarBG_Pal
	movs r1, 0
	movs r2, 0x80
	bl LoadPalette
	ldr r0, _08123478 @ =gCableCarBG_Gfx
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r1, _0812347C @ =gMain
	ldr r2, _08123480 @ =0x0000043c
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	b _0812370C
	.align 2, 0
_08123454: .4byte gUnknown_08401CF8
_08123458: .4byte gUnknown_08401D18
_0812345C: .4byte gCableCarMtChimneyTilemap
_08123460: .4byte 0x02019000
_08123464: .4byte gCableCarTreeTilemap
_08123468: .4byte gCableCarMountainTilemap
_0812346C: .4byte gCableCarPylonStemTilemap
_08123470: .4byte 0x000009d8
_08123474: .4byte gCableCarBG_Pal
_08123478: .4byte gCableCarBG_Gfx
_0812347C: .4byte gMain
_08123480: .4byte 0x0000043c
_08123484:
	bl sub_8124118
	bl RunTasks
	ldr r1, _08123498 @ =gMain
	ldr r0, _0812349C @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	b _0812370C
	.align 2, 0
_08123498: .4byte gMain
_0812349C: .4byte 0x0000043c
_081234A0:
	ldr r0, _081234B4 @ =gUnknown_02039274
	ldr r0, [r0]
	ldrb r0, [r0, 0x2]
	cmp r0, 0x7
	bne _081234BC
	ldr r1, _081234B8 @ =0x0000043c
	add r1, r9
	ldrb r0, [r1]
	adds r0, 0x1
	b _0812370C
	.align 2, 0
_081234B4: .4byte gUnknown_02039274
_081234B8: .4byte 0x0000043c
_081234BC:
	ldr r0, _081234FC @ =gUnknown_08396FC4
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0xF0
	ldr r0, [r1]
	cmp r0, 0
	bne _081234CC
	b _0812370E
_081234CC:
	movs r4, 0
	adds r3, r1, 0
	movs r5, 0xD
	negs r5, r5
_081234D4:
	lsls r0, r4, 2
	adds r0, r3, r0
	ldr r2, [r0]
	cmp r2, 0
	beq _081234E6
	ldrb r1, [r2, 0x5]
	adds r0, r5, 0
	ands r0, r1
	strb r0, [r2, 0x5]
_081234E6:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x13
	bls _081234D4
	ldr r1, _08123500 @ =0x0000043c
	add r1, r9
	ldrb r0, [r1]
	adds r0, 0x1
	b _0812370C
	.align 2, 0
_081234FC: .4byte gUnknown_08396FC4
_08123500: .4byte 0x0000043c
_08123504:
	ldr r0, _08123578 @ =0x0600e800
	ldr r5, _0812357C @ =0x02019168
	movs r1, 0x20
	str r1, [sp]
	movs r1, 0xF
	str r1, [sp, 0x4]
	adds r1, r5, 0
	movs r2, 0
	movs r3, 0x11
	bl sub_8124F08
	ldr r0, _08123580 @ =0x0600f000
	movs r2, 0xF0
	lsls r2, 2
	adds r1, r5, r2
	movs r2, 0x1E
	str r2, [sp]
	movs r2, 0x14
	mov r9, r2
	str r2, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_8124F08
	ldr r0, _08123584 @ =gUnknown_02039274
	mov r8, r0
	ldr r0, [r0]
	ldr r6, _08123588 @ =0x000008fc
	adds r0, r6
	ldr r1, _0812358C @ =gCableCarPylonHookTilemapEntries
	movs r2, 0x5
	str r2, [sp]
	movs r4, 0x2
	str r4, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_8124F08
	mov r1, r8
	ldr r0, [r1]
	adds r0, r6
	movs r2, 0x87
	lsls r2, 4
	adds r5, r2
	str r4, [sp]
	mov r1, r9
	str r1, [sp, 0x4]
	adds r1, r5, 0
	movs r2, 0
	movs r3, 0x2
	bl sub_8124F08
	ldr r1, _08123590 @ =gMain
	ldr r2, _08123594 @ =0x0000043c
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	b _0812370C
	.align 2, 0
_08123578: .4byte 0x0600e800
_0812357C: .4byte 0x02019168
_08123580: .4byte 0x0600f000
_08123584: .4byte gUnknown_02039274
_08123588: .4byte 0x000008fc
_0812358C: .4byte gCableCarPylonHookTilemapEntries
_08123590: .4byte gMain
_08123594: .4byte 0x0000043c
_08123598:
	ldr r0, _08123664 @ =gUnknown_0202E8CC
	ldrb r0, [r0]
	bl sub_81248AC
	ldr r0, _08123668 @ =gUnknown_02039274
	mov r8, r0
	ldr r0, [r0]
	adds r0, 0xFC
	ldr r4, _0812366C @ =0x02019090
	movs r6, 0xC
	str r6, [sp]
	movs r5, 0x3
	str r5, [sp, 0x4]
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0xE
	bl sub_8124F08
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0xFC
	adds r1, r4, 0
	adds r1, 0x48
	str r6, [sp]
	str r5, [sp, 0x4]
	movs r2, 0xC
	movs r3, 0x11
	bl sub_8124F08
	mov r2, r8
	ldr r0, [r2]
	adds r0, 0xFC
	adds r1, r4, 0
	adds r1, 0x90
	str r6, [sp]
	str r5, [sp, 0x4]
	movs r2, 0x18
	movs r3, 0x14
	bl sub_8124F08
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0xFC
	movs r2, 0x90
	negs r2, r2
	adds r2, r4
	mov r9, r2
	str r6, [sp]
	str r5, [sp, 0x4]
	mov r1, r9
	movs r2, 0
	movs r3, 0x11
	bl sub_8124F08
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0xFC
	subs r4, 0x48
	str r6, [sp]
	str r5, [sp, 0x4]
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x14
	bl sub_8124F08
	mov r2, r8
	ldr r0, [r2]
	adds r0, 0xFC
	str r6, [sp]
	str r5, [sp, 0x4]
	mov r1, r9
	movs r2, 0xC
	movs r3, 0x14
	bl sub_8124F08
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0xFC
	str r6, [sp]
	str r5, [sp, 0x4]
	adds r1, r4, 0
	movs r2, 0xC
	movs r3, 0x17
	bl sub_8124F08
	mov r2, r8
	ldr r0, [r2]
	adds r0, 0xFC
	str r6, [sp]
	str r5, [sp, 0x4]
	mov r1, r9
	movs r2, 0x18
	movs r3, 0x17
	bl sub_8124F08
	ldr r1, _08123670 @ =gMain
	ldr r0, _08123674 @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	b _0812370C
	.align 2, 0
_08123664: .4byte gUnknown_0202E8CC
_08123668: .4byte gUnknown_02039274
_0812366C: .4byte 0x02019090
_08123670: .4byte gMain
_08123674: .4byte 0x0000043c
_08123678:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r1, 0x3
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _081236A4 @ =0x000001a9
	movs r1, 0x1
	bl FadeInNewBGM
	movs r0, 0x1
	bl sub_8123FBC
	ldr r1, _081236A8 @ =gMain
	ldr r2, _081236AC @ =0x0000043c
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	b _0812370C
	.align 2, 0
_081236A4: .4byte 0x000001a9
_081236A8: .4byte gMain
_081236AC: .4byte 0x0000043c
_081236B0:
	ldr r3, _081236E4 @ =0x04000208
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _081236E8 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r0, _081236EC @ =sub_8123C40
	bl SetVBlankCallback
	ldr r0, _081236F0 @ =mainloop
	bl SetMainCallback2
	ldr r0, _081236F4 @ =sub_8123878
	movs r1, 0
	bl CreateTask
	ldr r0, _081236F8 @ =gUnknown_0202E8CC
	ldrh r0, [r0]
	cmp r0, 0
	bne _08123700
	ldr r0, _081236FC @ =sub_81239E4
	b _08123702
	.align 2, 0
_081236E4: .4byte 0x04000208
_081236E8: .4byte 0x04000200
_081236EC: .4byte sub_8123C40
_081236F0: .4byte sub_8123724
_081236F4: .4byte sub_8123878
_081236F8: .4byte gUnknown_0202E8CC
_081236FC: .4byte sub_81239E4
_08123700:
	ldr r0, _0812371C @ =sub_8123AF8
_08123702:
	movs r1, 0x1
	bl CreateTask
	ldr r1, _08123720 @ =gUnknown_02039274
	ldr r1, [r1]
_0812370C:
	strb r0, [r1]
_0812370E:
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812371C: .4byte sub_8123AF8
_08123720: .4byte gUnknown_02039274
	thumb_func_end sub_8123244

	thumb_func_start sub_8123724
sub_8123724: @ 8123724
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	bl MapMusicMain
	pop {r0}
	bx r0
	thumb_func_end sub_8123724

	thumb_func_start sub_8123740
sub_8123740: @ 8123740
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	movs r4, 0
	movs r0, 0
	bl sub_8123FBC
	ldr r0, _08123854 @ =gSpriteCoordOffsetX
	strh r4, [r0]
	movs r0, 0
	bl sub_807C9B4
	add r7, sp, 0x4
	ldr r0, _08123858 @ =gUnknown_08396FC4
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0xF0
	movs r2, 0
_08123766:
	lsls r0, r4, 2
	adds r0, r1, r0
	str r2, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x13
	bls _08123766
	bl ResetTasks
	bl ResetSpriteData
	bl ResetPaletteFade
	ldr r2, _0812385C @ =0x02000000
	movs r3, 0x80
	lsls r3, 10
	movs r5, 0
	ldr r1, _08123860 @ =0x040000d4
	movs r4, 0x80
	lsls r4, 5
	ldr r6, _08123864 @ =0x85000400
	movs r0, 0x85
	lsls r0, 24
	mov r12, r0
_08123798:
	str r5, [sp]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _08123798
	str r5, [sp]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _08123868 @ =gUnknown_02039274
	movs r0, 0
	str r0, [r1]
	movs r3, 0xC0
	lsls r3, 19
	movs r4, 0xC0
	lsls r4, 9
	adds r2, r7, 0
	movs r6, 0
	ldr r1, _08123860 @ =0x040000d4
	movs r5, 0x80
	lsls r5, 5
	ldr r0, _0812386C @ =0x81000800
	mov r12, r0
	movs r0, 0x81
	lsls r0, 24
	mov r8, r0
_081237E0:
	strh r6, [r2]
	str r2, [r1]
	str r3, [r1, 0x4]
	mov r0, r12
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _081237E0
	strh r6, [r7]
	str r7, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r4, 1
	mov r2, r8
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0xE0
	lsls r0, 19
	movs r3, 0x80
	lsls r3, 3
	movs r4, 0
	str r4, [sp]
	ldr r2, _08123860 @ =0x040000d4
	mov r1, sp
	str r1, [r2]
	str r0, [r2, 0x4]
	lsrs r0, r3, 2
	movs r1, 0x85
	lsls r1, 24
	orrs r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r0, 0xA0
	lsls r0, 19
	strh r4, [r7]
	str r7, [r2]
	str r0, [r2, 0x4]
	lsrs r3, 1
	movs r0, 0x81
	lsls r0, 24
	orrs r3, r0
	str r3, [r2, 0x8]
	ldr r0, [r2, 0x8]
	bl warp_in
	ldr r0, _08123870 @ =gUnknown_0300485C
	str r4, [r0]
	ldr r0, _08123874 @ =CB2_LoadMap
	bl SetMainCallback2
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08123854: .4byte gSpriteCoordOffsetX
_08123858: .4byte gUnknown_08396FC4
_0812385C: .4byte 0x02000000
_08123860: .4byte 0x040000d4
_08123864: .4byte 0x85000400
_08123868: .4byte gUnknown_02039274
_0812386C: .4byte 0x81000800
_08123870: .4byte gUnknown_0300485C
_08123874: .4byte CB2_LoadMap
	thumb_func_end sub_8123740

	thumb_func_start sub_8123878
sub_8123878: @ 8123878
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	ldr r5, _081238A4 @ =gUnknown_02039274
	ldr r3, [r5]
	ldrh r0, [r3, 0x6]
	adds r0, 0x1
	strh r0, [r3, 0x6]
	ldrb r2, [r3, 0x1]
	adds r7, r5, 0
	cmp r2, 0x2
	beq _0812397E
	cmp r2, 0x2
	bgt _081238A8
	cmp r2, 0
	beq _081238B6
	cmp r2, 0x1
	beq _081238D0
	b _081239D6
	.align 2, 0
_081238A4: .4byte gUnknown_02039274
_081238A8:
	cmp r2, 0x3
	bne _081238AE
	b _081239A4
_081238AE:
	cmp r2, 0xFF
	bne _081238B4
	b _081239BC
_081238B4:
	b _081239D6
_081238B6:
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r3, 0x4]
	cmp r0, r1
	beq _081238C2
	b _081239D6
_081238C2:
	ldrb r0, [r3, 0x2]
	bl DoWeatherEffect
	ldr r1, [r5]
	movs r0, 0x1
	strb r0, [r1, 0x1]
	b _081239D6
_081238D0:
	ldrb r0, [r3, 0x2]
	cmp r0, 0x2
	beq _08123924
	cmp r0, 0x7
	beq _081238DC
	b _081239D6
_081238DC:
	ldr r0, _08123920 @ =gUnknown_08396FC4
	ldr r0, [r0]
	adds r2, r0, 0
	adds r2, 0xF0
	ldr r0, [r2]
	cmp r0, 0
	beq _081239D6
	ldrb r1, [r0, 0x5]
	movs r0, 0xC
	ands r0, r1
	cmp r0, 0
	beq _081239D6
	adds r3, r2, 0
	movs r5, 0xD
	negs r5, r5
_081238FA:
	lsls r0, r4, 2
	adds r0, r3, r0
	ldr r2, [r0]
	cmp r2, 0
	beq _0812390C
	ldrb r1, [r2, 0x5]
	adds r0, r5, 0
	ands r0, r1
	strb r0, [r2, 0x5]
_0812390C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x13
	bls _081238FA
	ldr r1, [r7]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	b _081239D6
	.align 2, 0
_08123920: .4byte gUnknown_08396FC4
_08123924:
	ldr r0, _08123938 @ =gUnknown_08396FC4
	ldr r2, [r0]
	movs r1, 0xDA
	lsls r1, 3
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0812393C
	strb r0, [r3, 0x1]
	b _081239D6
	.align 2, 0
_08123938: .4byte gUnknown_08396FC4
_0812393C:
	ldrh r1, [r3, 0x6]
	ldrh r0, [r3, 0x4]
	adds r0, 0x8
	cmp r1, r0
	blt _081239D6
	adds r6, r2, 0
	adds r6, 0xF0
	movs r5, 0x1
	movs r7, 0x5
	negs r7, r7
_08123950:
	lsls r0, r4, 2
	adds r0, r6, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _08123972
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r1, r2, 29
	lsrs r1, 31
	eors r1, r5
	ands r1, r5
	lsls r1, 2
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_08123972:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x13
	bls _08123950
	b _081239D6
_0812397E:
	lsls r1, r0, 16
	ldr r0, _081239A0 @ =0x023a0000
	cmp r1, r0
	bne _081239D6
	movs r0, 0x3
	strb r0, [r3, 0x1]
	subs r0, 0x4
	str r4, [sp]
	movs r1, 0x3
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r0, 0x4
	bl FadeOutBGM
	b _081239D6
	.align 2, 0
_081239A0: .4byte 0x023a0000
_081239A4:
	ldr r0, _081239B8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081239D6
	movs r0, 0xFF
	strb r0, [r3, 0x1]
	b _081239D6
	.align 2, 0
_081239B8: .4byte gPaletteFade
_081239BC:
	movs r0, 0
	bl SetVBlankCallback
	adds r0, r6, 0
	bl DestroyTask
	ldr r0, [r5]
	ldrb r0, [r0]
	bl DestroyTask
	ldr r0, _081239E0 @ =sub_8123740
	bl SetMainCallback2
_081239D6:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081239E0: .4byte sub_8123740
	thumb_func_end sub_8123878

	thumb_func_start sub_81239E4
sub_81239E4: @ 81239E4
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r6, _08123A38 @ =gUnknown_02039274
	ldr r1, [r6]
	ldrb r0, [r1, 0x1]
	cmp r0, 0xFF
	beq _08123AC0
	ldrb r0, [r1, 0x14]
	subs r0, 0x1
	strb r0, [r1, 0x14]
	ldr r1, [r6]
	ldrh r0, [r1, 0x6]
	movs r3, 0x1
	ands r0, r3
	cmp r0, 0
	bne _08123A0A
	ldrb r0, [r1, 0x15]
	subs r0, 0x1
	strb r0, [r1, 0x15]
_08123A0A:
	ldr r2, [r6]
	ldrh r0, [r2, 0x6]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _08123A24
	ldrb r0, [r2, 0xC]
	subs r0, 0x1
	strb r0, [r2, 0xC]
	ldr r1, [r6]
	ldrb r0, [r1, 0xD]
	subs r0, 0x1
	strb r0, [r1, 0xD]
_08123A24:
	ldr r0, [r6]
	ldrb r1, [r0, 0x14]
	cmp r1, 0x20
	beq _08123A74
	cmp r1, 0x20
	bgt _08123A3C
	cmp r1, 0x10
	beq _08123A90
	b _08123AC0
	.align 2, 0
_08123A38: .4byte gUnknown_02039274
_08123A3C:
	cmp r1, 0x28
	beq _08123A60
	cmp r1, 0xAF
	bne _08123AC0
	ldr r1, _08123A5C @ =0x000008fc
	adds r0, r1
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0xA
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0x16
	bl sub_8124E7C
	b _08123AC0
	.align 2, 0
_08123A5C: .4byte 0x000008fc
_08123A60:
	ldr r1, _08123A70 @ =0x000008fc
	adds r0, r1
	movs r1, 0x2
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0x3
	b _08123A82
	.align 2, 0
_08123A70: .4byte 0x000008fc
_08123A74:
	ldr r1, _08123A8C @ =0x000008fc
	adds r0, r1
	str r3, [sp]
	movs r1, 0x2
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0x2
_08123A82:
	movs r3, 0
	bl sub_8124E7C
	b _08123AC0
	.align 2, 0
_08123A8C: .4byte 0x000008fc
_08123A90:
	ldr r5, _08123AE8 @ =0x000008fc
	adds r0, r5
	ldr r1, _08123AEC @ =gCableCarPylonHookTilemapEntries
	movs r2, 0x5
	str r2, [sp]
	movs r4, 0x2
	str r4, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_8124F08
	ldr r0, [r6]
	adds r0, r5
	ldr r1, _08123AF0 @ =0x020199d8
	str r4, [sp]
	movs r2, 0x1E
	str r2, [sp, 0x4]
	movs r2, 0
	movs r3, 0x2
	bl sub_8124F08
	ldr r1, [r6]
	movs r0, 0x40
	strb r0, [r1, 0x15]
_08123AC0:
	bl sub_812453C
	ldr r3, _08123AF4 @ =gSpriteCoordOffsetX
	movs r0, 0
	ldrsh r2, [r3, r0]
	adds r1, r2, 0x1
	adds r0, r1, 0
	cmp r1, 0
	bge _08123AD6
	adds r0, r2, 0
	adds r0, 0x80
_08123AD6:
	asrs r0, 7
	lsls r0, 7
	subs r0, r1, r0
	strh r0, [r3]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08123AE8: .4byte 0x000008fc
_08123AEC: .4byte gCableCarPylonHookTilemapEntries
_08123AF0: .4byte 0x020199d8
_08123AF4: .4byte gSpriteCoordOffsetX
	thumb_func_end sub_81239E4

	thumb_func_start sub_8123AF8
sub_8123AF8: @ 8123AF8
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r6, _08123B4C @ =gUnknown_02039274
	ldr r1, [r6]
	ldrb r0, [r1, 0x1]
	cmp r0, 0xFF
	beq _08123BEE
	ldrb r0, [r1, 0x14]
	adds r0, 0x1
	strb r0, [r1, 0x14]
	ldr r2, [r6]
	ldrh r0, [r2, 0x6]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08123B1E
	ldrb r0, [r2, 0x15]
	adds r0, 0x1
	strb r0, [r2, 0x15]
_08123B1E:
	ldr r2, [r6]
	ldrh r0, [r2, 0x6]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _08123B38
	ldrb r0, [r2, 0xC]
	adds r0, 0x1
	strb r0, [r2, 0xC]
	ldr r1, [r6]
	ldrb r0, [r1, 0xD]
	adds r0, 0x1
	strb r0, [r1, 0xD]
_08123B38:
	ldr r3, [r6]
	ldrb r0, [r3, 0x14]
	cmp r0, 0x20
	beq _08123BB0
	cmp r0, 0x20
	bgt _08123B50
	cmp r0, 0x10
	beq _08123B78
	b _08123BEE
	.align 2, 0
_08123B4C: .4byte gUnknown_02039274
_08123B50:
	cmp r0, 0x28
	beq _08123BDC
	cmp r0, 0xB0
	bne _08123BEE
	ldr r1, _08123B70 @ =0x000008fc
	adds r0, r3, r1
	ldr r1, _08123B74 @ =0x020199d8
	movs r2, 0x2
	str r2, [sp]
	movs r2, 0x1E
	str r2, [sp, 0x4]
	movs r2, 0
	movs r3, 0x2
	bl sub_8124F08
	b _08123BEE
	.align 2, 0
_08123B70: .4byte 0x000008fc
_08123B74: .4byte 0x020199d8
_08123B78:
	ldr r5, _08123BAC @ =0x000008fc
	adds r0, r3, r5
	movs r1, 0x3
	str r1, [sp]
	movs r4, 0x2
	str r4, [sp, 0x4]
	movs r1, 0
	movs r2, 0x2
	movs r3, 0
	bl sub_8124E7C
	ldr r0, [r6]
	adds r0, r5
	str r4, [sp]
	movs r1, 0xA
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0x16
	bl sub_8124E7C
	ldr r1, [r6]
	movs r0, 0xC0
	strb r0, [r1, 0x15]
	b _08123BEE
	.align 2, 0
_08123BAC: .4byte 0x000008fc
_08123BB0:
	ldr r1, _08123BD4 @ =gCableCarPylonHookTilemapEntries + 0x4
	ldrh r2, [r1]
	movs r4, 0x90
	lsls r4, 4
	adds r0, r3, r4
	strh r2, [r0]
	ldrh r2, [r1, 0x2]
	adds r4, 0x2
	adds r0, r3, r4
	strh r2, [r0]
	ldrh r2, [r1, 0xA]
	adds r4, 0x3E
	adds r0, r3, r4
	strh r2, [r0]
	ldrh r1, [r1, 0xC]
	ldr r2, _08123BD8 @ =0x00000942
	b _08123BEA
	.align 2, 0
_08123BD4: .4byte gCableCarPylonHookTilemapEntries + 0x4
_08123BD8: .4byte 0x00000942
_08123BDC:
	ldr r2, _08123C08 @ =gCableCarPylonHookTilemapEntries + 0x8
	ldrh r1, [r2]
	ldr r4, _08123C0C @ =0x00000904
	adds r0, r3, r4
	strh r1, [r0]
	ldrh r1, [r2, 0xA]
	ldr r2, _08123C10 @ =0x00000944
_08123BEA:
	adds r0, r3, r2
	strh r1, [r0]
_08123BEE:
	bl sub_8124598
	ldr r0, _08123C14 @ =gUnknown_02039274
	ldr r1, [r0]
	ldrh r0, [r1, 0x6]
	ldrh r1, [r1, 0x4]
	cmp r0, r1
	bcs _08123C1C
	ldr r4, _08123C18 @ =gSpriteCoordOffsetX
	movs r1, 0
	ldrsh r0, [r4, r1]
	b _08123C26
	.align 2, 0
_08123C08: .4byte gCableCarPylonHookTilemapEntries + 0x8
_08123C0C: .4byte 0x00000904
_08123C10: .4byte 0x00000944
_08123C14: .4byte gUnknown_02039274
_08123C18: .4byte gSpriteCoordOffsetX
_08123C1C:
	ldr r0, _08123C38 @ =gUnknown_08396FC4
	ldr r4, [r0]
	ldr r2, _08123C3C @ =0x000006fc
	adds r4, r2
	ldrh r0, [r4]
_08123C26:
	adds r0, 0xF7
	movs r1, 0xF8
	bl __modsi3
	strh r0, [r4]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08123C38: .4byte gUnknown_08396FC4
_08123C3C: .4byte 0x000006fc
	thumb_func_end sub_8123AF8

	thumb_func_start sub_8123C40
sub_8123C40: @ 8123C40
	push {r4,lr}
	ldr r1, _08123C9C @ =0x040000d4
	ldr r0, _08123CA0 @ =gUnknown_02039274
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0xFC
	str r0, [r1]
	ldr r0, _08123CA4 @ =0x0600e000
	str r0, [r1, 0x4]
	ldr r3, _08123CA8 @ =0x80000400
	str r3, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r4, _08123CAC @ =0x000008fc
	adds r0, r2, r4
	str r0, [r1]
	ldr r0, _08123CB0 @ =0x0600f800
	str r0, [r1, 0x4]
	str r3, [r1, 0x8]
	ldr r0, [r1, 0x8]
	subs r1, 0xB8
	ldrb r0, [r2, 0x14]
	strh r0, [r1]
	adds r1, 0x2
	ldrb r0, [r2, 0x15]
	strh r0, [r1]
	subs r1, 0xA
	ldrb r0, [r2, 0xC]
	strh r0, [r1]
	adds r1, 0x2
	ldrb r0, [r2, 0xD]
	strh r0, [r1]
	subs r1, 0x6
	ldrb r0, [r2, 0x8]
	strh r0, [r1]
	adds r1, 0x2
	ldrb r0, [r2, 0x9]
	strh r0, [r1]
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08123C9C: .4byte 0x040000d4
_08123CA0: .4byte gUnknown_02039274
_08123CA4: .4byte 0x0600e000
_08123CA8: .4byte 0x80000400
_08123CAC: .4byte 0x000008fc
_08123CB0: .4byte 0x0600f800
	thumb_func_end sub_8123C40

	thumb_func_start nullsub_76
nullsub_76: @ 8123CB4
	bx lr
	thumb_func_end nullsub_76

	thumb_func_start sub_8123CB8
sub_8123CB8: @ 8123CB8
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _08123D20 @ =gUnknown_02039274
	ldr r6, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0xFF
	beq _08123D84
	ldr r0, _08123D24 @ =gUnknown_0202E8CC
	ldrh r0, [r0]
	cmp r0, 0
	bne _08123D34
	movs r0, 0x6
	ldrsh r4, [r6, r0]
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _08123CE2
	ldr r1, _08123D28 @ =0x47800000
	bl __addsf3
_08123CE2:
	ldr r1, _08123D2C @ =0x3e0f5c29
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x2E]
	subs r1, r0
	strh r1, [r5, 0x20]
	movs r1, 0x6
	ldrsh r4, [r6, r1]
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _08123D0A
	ldr r1, _08123D28 @ =0x47800000
	bl __addsf3
_08123D0A:
	ldr r1, _08123D30 @ =0x3d89374c
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x30]
	subs r1, r0
	strh r1, [r5, 0x22]
	b _08123D84
	.align 2, 0
_08123D20: .4byte gUnknown_02039274
_08123D24: .4byte gUnknown_0202E8CC
_08123D28: .4byte 0x47800000
_08123D2C: .4byte 0x3e0f5c29
_08123D30: .4byte 0x3d89374c
_08123D34:
	movs r0, 0x6
	ldrsh r4, [r6, r0]
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _08123D48
	ldr r1, _08123D8C @ =0x47800000
	bl __addsf3
_08123D48:
	ldr r1, _08123D90 @ =0x3e0f5c29
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x2E]
	adds r0, r1
	strh r0, [r5, 0x20]
	movs r0, 0x6
	ldrsh r4, [r6, r0]
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _08123D70
	ldr r1, _08123D8C @ =0x47800000
	bl __addsf3
_08123D70:
	ldr r1, _08123D94 @ =0x3d89374c
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x30]
	adds r0, r1
	strh r0, [r5, 0x22]
_08123D84:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08123D8C: .4byte 0x47800000
_08123D90: .4byte 0x3e0f5c29
_08123D94: .4byte 0x3d89374c
	thumb_func_end sub_8123CB8

	thumb_func_start sub_8123D98
sub_8123D98: @ 8123D98
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _08123E04 @ =gUnknown_02039274
	ldr r6, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0xFF
	bne _08123DA8
	b _08123EB0
_08123DA8:
	ldr r0, _08123E08 @ =gUnknown_0202E8CC
	ldrh r0, [r0]
	cmp r0, 0
	bne _08123E18
	movs r0, 0x6
	ldrsh r4, [r6, r0]
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _08123DC4
	ldr r1, _08123E0C @ =0x47800000
	bl __addsf3
_08123DC4:
	ldr r1, _08123E10 @ =0x3e0f5c29
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x2E]
	subs r1, r0
	strh r1, [r5, 0x20]
	movs r1, 0x6
	ldrsh r4, [r6, r1]
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _08123DEC
	ldr r1, _08123E0C @ =0x47800000
	bl __addsf3
_08123DEC:
	ldr r1, _08123E14 @ =0x3d89374c
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x30]
	subs r1, r0
	strh r1, [r5, 0x22]
	b _08123E68
	.align 2, 0
_08123E04: .4byte gUnknown_02039274
_08123E08: .4byte gUnknown_0202E8CC
_08123E0C: .4byte 0x47800000
_08123E10: .4byte 0x3e0f5c29
_08123E14: .4byte 0x3d89374c
_08123E18:
	movs r0, 0x6
	ldrsh r4, [r6, r0]
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _08123E2C
	ldr r1, _08123E8C @ =0x47800000
	bl __addsf3
_08123E2C:
	ldr r1, _08123E90 @ =0x3e0f5c29
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x2E]
	adds r0, r1
	strh r0, [r5, 0x20]
	movs r0, 0x6
	ldrsh r4, [r6, r0]
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _08123E54
	ldr r1, _08123E8C @ =0x47800000
	bl __addsf3
_08123E54:
	ldr r1, _08123E94 @ =0x3d89374c
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x30]
	adds r0, r1
	strh r0, [r5, 0x22]
_08123E68:
	movs r0, 0x32
	ldrsh r2, [r5, r0]
	cmp r2, 0
	bne _08123E98
	movs r0, 0x11
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x34]
	adds r1, r0, 0x1
	strh r1, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	ble _08123EB0
	strh r2, [r5, 0x34]
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
	b _08123EB0
	.align 2, 0
_08123E8C: .4byte 0x47800000
_08123E90: .4byte 0x3e0f5c29
_08123E94: .4byte 0x3d89374c
_08123E98:
	movs r2, 0
	movs r0, 0x10
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x34]
	adds r1, r0, 0x1
	strh r1, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	ble _08123EB0
	strh r2, [r5, 0x34]
	strh r2, [r5, 0x32]
_08123EB0:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8123D98

	thumb_func_start sub_8123EB8
sub_8123EB8: @ 8123EB8
	push {lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _08123EE8
	adds r0, r2, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 1
	ldrh r3, [r2, 0x20]
	adds r0, r3
	strh r0, [r2, 0x20]
	ldrh r1, [r2, 0x22]
	adds r1, 0x10
	adds r0, r2, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	strh r0, [r2, 0x22]
_08123EE8:
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x32
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _08123F3E
	movs r0, 0x30
	ldrsh r1, [r2, r0]
	cmp r1, 0
	beq _08123F08
	cmp r1, 0x1
	beq _08123F12
	b _08123F30
_08123F08:
	ldrh r0, [r2, 0x20]
	adds r0, 0x1
	strh r0, [r2, 0x20]
	ldrh r0, [r2, 0x2E]
	b _08123F22
_08123F12:
	ldrh r0, [r2, 0x2E]
	ands r0, r1
	cmp r0, 0
	beq _08123F30
	ldrh r0, [r2, 0x20]
	adds r0, 0x1
	strh r0, [r2, 0x20]
	ldrh r0, [r2, 0x20]
_08123F22:
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08123F30
	ldrh r0, [r2, 0x22]
	adds r0, 0x1
	strh r0, [r2, 0x22]
_08123F30:
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	cmp r0, 0xA0
	ble _08123F3E
	adds r0, r2, 0
	bl DestroySprite
_08123F3E:
	pop {r0}
	bx r0
	thumb_func_end sub_8123EB8

	thumb_func_start sub_8123F44
sub_8123F44: @ 8123F44
	push {lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _08123F62
	ldrh r1, [r2, 0x22]
	adds r1, 0x10
	adds r0, r2, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	strh r0, [r2, 0x22]
_08123F62:
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x32
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _08123FB8
	movs r0, 0x30
	ldrsh r1, [r2, r0]
	cmp r1, 0
	beq _08123F82
	cmp r1, 0x1
	beq _08123F8C
	b _08123FAA
_08123F82:
	ldrh r0, [r2, 0x20]
	subs r0, 0x1
	strh r0, [r2, 0x20]
	ldrh r0, [r2, 0x2E]
	b _08123F9C
_08123F8C:
	ldrh r0, [r2, 0x2E]
	ands r0, r1
	cmp r0, 0
	beq _08123FAA
	ldrh r0, [r2, 0x20]
	subs r0, 0x1
	strh r0, [r2, 0x20]
	ldrh r0, [r2, 0x20]
_08123F9C:
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08123FAA
	ldrh r0, [r2, 0x22]
	subs r0, 0x1
	strh r0, [r2, 0x22]
_08123FAA:
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	cmp r0, 0x4F
	bgt _08123FB8
	adds r0, r2, 0
	bl DestroySprite
_08123FB8:
	pop {r0}
	bx r0
	thumb_func_end sub_8123F44

	thumb_func_start sub_8123FBC
sub_8123FBC: @ 8123FBC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08123FCA
	cmp r0, 0x1
	beq _08124024
_08123FCA:
	ldr r1, _08124020 @ =REG_WININ
	movs r0, 0
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	subs r1, 0xA
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	subs r1, 0x46
	strh r0, [r1]
	adds r1, 0xE
	strh r0, [r1]
	subs r1, 0x2
	strh r0, [r1]
	subs r1, 0x2
	strh r0, [r1]
	subs r1, 0x2
	strh r0, [r1]
	adds r1, 0x14
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	subs r1, 0x6
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	subs r1, 0x6
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	subs r1, 0x6
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	adds r1, 0x3E
	strh r0, [r1]
	b _081240EE
	.align 2, 0
_08124020: .4byte REG_WININ
_08124024:
	ldr r0, _08124060 @ =REG_WININ
	movs r3, 0
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	subs r0, 0xA
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	ldr r0, _08124064 @ =gUnknown_0202E8CC
	ldrh r0, [r0]
	cmp r0, 0
	bne _0812406C
	ldr r1, _08124068 @ =gUnknown_02039274
	ldr r2, [r1]
	movs r0, 0xB0
	strb r0, [r2, 0x14]
	ldr r2, [r1]
	movs r0, 0x10
	strb r0, [r2, 0x15]
	ldr r0, [r1]
	strb r3, [r0, 0xC]
	ldr r2, [r1]
	movs r0, 0x50
	b _08124082
	.align 2, 0
_08124060: .4byte REG_WININ
_08124064: .4byte gUnknown_0202E8CC
_08124068: .4byte gUnknown_02039274
_0812406C:
	ldr r1, _081240F4 @ =gUnknown_02039274
	ldr r2, [r1]
	movs r0, 0x60
	strb r0, [r2, 0x14]
	ldr r2, [r1]
	movs r0, 0xE8
	strb r0, [r2, 0x15]
	ldr r0, [r1]
	strb r3, [r0, 0xC]
	ldr r2, [r1]
	movs r0, 0x4
_08124082:
	strb r0, [r2, 0xD]
	ldr r0, [r1]
	strb r3, [r0, 0x9]
	ldr r0, [r1]
	strb r3, [r0, 0x9]
	adds r2, r1, 0
	ldr r1, _081240F8 @ =REG_BG3HOFS
	ldr r2, [r2]
	ldrb r0, [r2, 0x14]
	strh r0, [r1]
	adds r1, 0x2
	ldrb r0, [r2, 0x15]
	strh r0, [r1]
	ldr r0, _081240FC @ =REG_BG2HOFS
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r1, _08124100 @ =REG_BG1HOFS
	ldrb r0, [r2, 0xC]
	strh r0, [r1]
	adds r1, 0x2
	ldrb r0, [r2, 0xD]
	strh r0, [r1]
	subs r1, 0x6
	ldrb r0, [r2, 0x8]
	strh r0, [r1]
	adds r1, 0x2
	ldrb r0, [r2, 0x9]
	strh r0, [r1]
	subs r1, 0xA
	ldr r2, _08124104 @ =0x00003c01
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _08124108 @ =0x00003d02
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0812410C @ =0x00003e03
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08124110 @ =REG_BG3CNT
	movs r3, 0xFC
	lsls r3, 6
	adds r2, r3, 0
	strh r2, [r0]
	subs r1, 0xC
	movs r3, 0xFA
	lsls r3, 5
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _08124114 @ =REG_BLDCNT
	strh r2, [r0]
_081240EE:
	pop {r0}
	bx r0
	.align 2, 0
_081240F4: .4byte gUnknown_02039274
_081240F8: .4byte REG_BG3HOFS
_081240FC: .4byte REG_BG2HOFS
_08124100: .4byte REG_BG1HOFS
_08124104: .4byte 0x00003c01
_08124108: .4byte 0x00003d02
_0812410C: .4byte 0x00003e03
_08124110: .4byte REG_BG3CNT
_08124114: .4byte REG_BLDCNT
	thumb_func_end sub_8123FBC

	thumb_func_start sub_8124118
sub_8124118: @ 8124118
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	ldr r1, _0812422C @ =gCableCarPlayerGraphicsIDs
	add r0, sp, 0x8
	movs r2, 0x2
	bl memcpy
	bl Random
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	add r6, sp, 0xC
	ldr r1, _08124230 @ =gMtChimneyHikerGraphicsIDs
	adds r0, r6, 0
	movs r2, 0x4
	bl memcpy
	add r5, sp, 0x10
	ldr r1, _08124234 @ =gMtChimneyHikerCoords
	adds r0, r5, 0
	movs r2, 0x8
	bl memcpy
	add r4, sp, 0x18
	ldr r1, _08124238 @ =gMtChimneyHikerMovementDelayTable
	adds r0, r4, 0
	movs r2, 0x4
	bl memcpy
	ldr r0, _0812423C @ =gUnknown_08401D9C
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x1C]
	str r1, [sp, 0x20]
	ldr r0, _08124240 @ =gUnknown_0202E8CC
	ldrh r0, [r0]
	mov r8, r6
	mov r10, r5
	cmp r0, 0
	beq _08124176
	cmp r0, 0x1
	beq _08124258
_08124176:
	ldr r0, _08124244 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	add r0, sp
	adds r0, 0x8
	ldrb r0, [r0]
	ldr r1, _08124248 @ =sub_8123D98
	movs r2, 0x66
	str r2, [sp]
	movs r2, 0xC8
	movs r3, 0x49
	bl AddPseudoFieldObject
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x40
	beq _081241BE
	ldr r0, _0812424C @ =gSprites
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x8
	orrs r0, r2
	strb r0, [r1, 0x5]
	movs r0, 0x8
	strh r0, [r1, 0x24]
	movs r0, 0x10
	strh r0, [r1, 0x26]
	movs r0, 0xC8
	strh r0, [r1, 0x2E]
	movs r0, 0x49
	strh r0, [r1, 0x30]
_081241BE:
	ldr r4, _08124250 @ =gSpriteTemplate_8401D40
	adds r0, r4, 0
	movs r1, 0xB0
	movs r2, 0x2B
	movs r3, 0x67
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _0812424C @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r5
	movs r1, 0x20
	strh r1, [r0, 0x26]
	strh r1, [r0, 0x24]
	movs r1, 0xB0
	strh r1, [r0, 0x2E]
	movs r1, 0x2B
	strh r1, [r0, 0x30]
	adds r4, 0x18
	adds r0, r4, 0
	movs r1, 0xC8
	movs r2, 0x63
	movs r3, 0x65
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r5
	movs r1, 0x8
	strh r1, [r0, 0x24]
	movs r1, 0x4
	strh r1, [r0, 0x26]
	movs r1, 0xC8
	strh r1, [r0, 0x2E]
	movs r1, 0x63
	strh r1, [r0, 0x30]
	ldr r2, _08124254 @ =gUnknown_02039274
	ldr r1, [r2]
	movs r0, 0x7
	strb r0, [r1, 0x2]
	ldr r1, [r2]
	movs r0, 0xAF
	lsls r0, 1
	strh r0, [r1, 0x4]
	movs r0, 0x2
	bl sub_807C9B4
	b _0812431E
	.align 2, 0
_0812422C: .4byte gCableCarPlayerGraphicsIDs
_08124230: .4byte gMtChimneyHikerGraphicsIDs
_08124234: .4byte gMtChimneyHikerCoords
_08124238: .4byte gMtChimneyHikerMovementDelayTable
_0812423C: .4byte gUnknown_08401D9C
_08124240: .4byte gUnknown_0202E8CC
_08124244: .4byte gSaveBlock2
_08124248: .4byte sub_8123D98
_0812424C: .4byte gSprites
_08124250: .4byte gSpriteTemplate_8401D40
_08124254: .4byte gUnknown_02039274
_08124258:
	ldr r7, _081243EC @ =gUnknown_02039274
	ldr r0, [r7]
	adds r0, 0xFC
	ldr r1, _081243F0 @ =0x02019048
	movs r2, 0xC
	str r2, [sp]
	movs r2, 0x3
	str r2, [sp, 0x4]
	movs r2, 0x18
	movs r3, 0x1A
	bl sub_8124F08
	ldr r0, _081243F4 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	add r0, sp
	adds r0, 0x8
	ldrb r0, [r0]
	ldr r1, _081243F8 @ =sub_8123D98
	movs r2, 0x66
	str r2, [sp]
	movs r2, 0x80
	movs r3, 0x27
	bl AddPseudoFieldObject
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x40
	beq _081242B8
	ldr r0, _081243FC @ =gSprites
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x8
	orrs r0, r2
	strb r0, [r1, 0x5]
	movs r0, 0x8
	strh r0, [r1, 0x24]
	movs r0, 0x10
	strh r0, [r1, 0x26]
	movs r0, 0x80
	strh r0, [r1, 0x2E]
	movs r0, 0x27
	strh r0, [r1, 0x30]
_081242B8:
	ldr r4, _08124400 @ =gSpriteTemplate_8401D40
	adds r0, r4, 0
	movs r1, 0x68
	movs r2, 0x9
	movs r3, 0x67
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _081243FC @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r5
	movs r1, 0x20
	strh r1, [r0, 0x26]
	strh r1, [r0, 0x24]
	movs r1, 0x68
	strh r1, [r0, 0x2E]
	movs r1, 0x9
	strh r1, [r0, 0x30]
	adds r4, 0x18
	adds r0, r4, 0
	movs r1, 0x80
	movs r2, 0x41
	movs r3, 0x65
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r5
	movs r1, 0x8
	strh r1, [r0, 0x24]
	movs r1, 0x4
	strh r1, [r0, 0x26]
	movs r1, 0x80
	strh r1, [r0, 0x2E]
	movs r1, 0x41
	strh r1, [r0, 0x30]
	ldr r1, [r7]
	movs r0, 0x2
	strb r0, [r1, 0x2]
	ldr r1, [r7]
	ldr r0, _08124404 @ =0x00000109
	strh r0, [r1, 0x4]
	movs r0, 0x7
	bl sub_807C9B4
_0812431E:
	movs r4, 0
	ldr r5, _081243FC @ =gSprites
_08124322:
	lsls r1, r4, 20
	movs r0, 0xC0
	lsls r0, 15
	adds r1, r0
	asrs r1, 16
	lsls r2, r4, 19
	ldr r3, _08124408 @ =0xfff80000
	adds r2, r3
	asrs r2, 16
	ldr r0, _0812440C @ =gSpriteTemplate_8401D70
	movs r3, 0x68
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r5
	movs r1, 0x8
	strh r1, [r0, 0x24]
	strh r1, [r0, 0x26]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x8
	bls _08124322
	movs r0, 0x3F
	mov r4, r9
	ands r0, r4
	cmp r0, 0
	bne _08124458
	mov r0, r9
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	add r0, r8
	ldrb r0, [r0]
	ldr r5, _08124410 @ =gUnknown_0202E8CC
	ldrh r4, [r5]
	lsls r4, 2
	add r1, sp, 0x1C
	adds r1, r4, r1
	ldr r1, [r1]
	mov r3, r10
	adds r2, r3, r4
	movs r3, 0
	ldrsh r2, [r2, r3]
	mov r3, sp
	adds r3, 0x12
	adds r3, r4
	movs r4, 0
	ldrsh r3, [r3, r4]
	movs r4, 0x6A
	str r4, [sp]
	bl AddPseudoFieldObject
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x40
	beq _08124458
	ldr r1, _081243FC @ =gSprites
	lsls r2, r6, 4
	adds r0, r2, r6
	lsls r0, 2
	adds r4, r0, r1
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4, 0x5]
	adds r0, r4, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	negs r0, r0
	strh r0, [r4, 0x24]
	adds r0, r4, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r0, [r5]
	mov r8, r2
	cmp r0, 0
	bne _0812441A
	movs r7, 0x1
	mov r5, r9
	ands r5, r7
	cmp r5, 0
	beq _08124414
	adds r0, r4, 0
	movs r1, 0x6
	b _08124428
	.align 2, 0
_081243EC: .4byte gUnknown_02039274
_081243F0: .4byte 0x02019048
_081243F4: .4byte gSaveBlock2
_081243F8: .4byte sub_8123D98
_081243FC: .4byte gSprites
_08124400: .4byte gSpriteTemplate_8401D40
_08124404: .4byte 0x00000109
_08124408: .4byte 0xfff80000
_0812440C: .4byte gSpriteTemplate_8401D70
_08124410: .4byte gUnknown_0202E8CC
_08124414:
	adds r0, r4, 0
	movs r1, 0x7
	b _0812443A
_0812441A:
	movs r7, 0x1
	mov r5, r9
	ands r5, r7
	cmp r5, 0
	beq _08124436
	adds r0, r4, 0
	movs r1, 0x7
_08124428:
	bl StartSpriteAnim
	strh r7, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	adds r0, 0x2
	strh r0, [r4, 0x22]
	b _08124440
_08124436:
	adds r0, r4, 0
	movs r1, 0x6
_0812443A:
	bl StartSpriteAnim
	strh r5, [r4, 0x30]
_08124440:
	ldr r0, _08124468 @ =gSprites
	mov r2, r8
	adds r1, r2, r6
	lsls r1, 2
	adds r1, r0
	movs r0, 0x3
	mov r3, r9
	ands r0, r3
	add r0, sp
	adds r0, 0x18
	ldrb r0, [r0]
	strh r0, [r1, 0x32]
_08124458:
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08124468: .4byte gSprites
	thumb_func_end sub_8124118

	thumb_func_start sub_812446C
sub_812446C: @ 812446C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r3, 0
	mov r9, r3
	ldr r2, _08124530 @ =gUnknown_02039274
	ldr r0, [r2]
	ldrb r1, [r0, 0x1B]
	adds r1, 0x2
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 26
	lsrs r0, 24
	mov r12, r0
_0812448E:
	movs r6, 0
	lsls r0, r3, 1
	adds r1, r3, 0x3
	adds r2, r3, 0x6
	adds r4, r3, 0x1
	str r4, [sp]
	adds r0, r3
	lsls r0, 3
	mov r10, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	mov r8, r0
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 3
	str r0, [sp, 0x4]
_081244B0:
	ldr r7, _08124530 @ =gUnknown_02039274
	ldr r5, [r7]
	lsls r3, r6, 1
	mov r0, r10
	adds r2, r3, r0
	adds r4, r5, 0
	adds r4, 0x22
	adds r2, r4, r2
	mov r1, r12
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	lsls r1, 1
	ldr r7, _08124534 @ =0x02019000
	adds r1, r7
	ldrh r0, [r1]
	strh r0, [r2]
	mov r0, r8
	adds r1, r3, r0
	adds r1, r4, r1
	mov r7, r9
	lsls r2, r7, 1
	ldr r7, _08124534 @ =0x02019000
	adds r0, r2, r7
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, [sp, 0x4]
	adds r3, r0
	adds r4, r3
	ldr r1, _08124538 @ =0x02019048
	adds r2, r1
	ldrh r0, [r2]
	strh r0, [r4]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xB
	bls _081244B0
	ldr r4, [sp]
	lsls r0, r4, 24
	lsrs r3, r0, 24
	cmp r3, 0x2
	bls _0812448E
	ldrb r0, [r5, 0x1B]
	adds r0, 0x1
	movs r1, 0x3
	bl __modsi3
	strb r0, [r5, 0x1B]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08124530: .4byte gUnknown_02039274
_08124534: .4byte 0x02019000
_08124538: .4byte 0x02019048
	thumb_func_end sub_812446C

	thumb_func_start sub_812453C
sub_812453C: @ 812453C
	push {r4,r5,lr}
	ldr r5, _08124594 @ =gUnknown_02039274
	ldr r4, [r5]
	ldrb r0, [r4, 0x1C]
	adds r0, 0x1
	movs r1, 0x60
	bl __modsi3
	strb r0, [r4, 0x1C]
	ldr r1, [r5]
	ldrb r0, [r1, 0x1F]
	ldrb r2, [r1, 0x1D]
	subs r0, r2
	strb r0, [r1, 0x8]
	ldr r2, [r5]
	adds r0, r2, 0
	adds r0, 0x20
	ldrb r0, [r0]
	ldrb r1, [r2, 0x1E]
	subs r0, r1
	strb r0, [r2, 0x9]
	ldr r1, [r5]
	ldrb r0, [r1, 0x1D]
	adds r0, 0x1
	strb r0, [r1, 0x1D]
	ldr r2, [r5]
	ldrb r0, [r2, 0x1D]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08124580
	ldrb r0, [r2, 0x1E]
	adds r0, 0x1
	strb r0, [r2, 0x1E]
_08124580:
	ldr r0, [r5]
	ldrb r0, [r0, 0x1D]
	cmp r0, 0x10
	bls _0812458C
	bl sub_81245F4
_0812458C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08124594: .4byte gUnknown_02039274
	thumb_func_end sub_812453C

	thumb_func_start sub_8124598
sub_8124598: @ 8124598
	push {r4,r5,lr}
	ldr r5, _081245F0 @ =gUnknown_02039274
	ldr r4, [r5]
	ldrb r0, [r4, 0x1C]
	adds r0, 0x1
	movs r1, 0x60
	bl __modsi3
	strb r0, [r4, 0x1C]
	ldr r1, [r5]
	ldrb r0, [r1, 0x1D]
	ldrb r2, [r1, 0x1F]
	adds r0, r2
	strb r0, [r1, 0x8]
	ldr r1, [r5]
	adds r2, r1, 0
	adds r2, 0x20
	ldrb r0, [r1, 0x1E]
	ldrb r2, [r2]
	adds r0, r2
	strb r0, [r1, 0x9]
	ldr r1, [r5]
	ldrb r0, [r1, 0x1D]
	adds r0, 0x1
	strb r0, [r1, 0x1D]
	ldr r2, [r5]
	ldrb r0, [r2, 0x1D]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _081245DC
	ldrb r0, [r2, 0x1E]
	adds r0, 0x1
	strb r0, [r2, 0x1E]
_081245DC:
	ldr r0, [r5]
	ldrb r0, [r0, 0x1D]
	cmp r0, 0x10
	bls _081245E8
	bl sub_812476C
_081245E8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081245F0: .4byte gUnknown_02039274
	thumb_func_end sub_8124598

	thumb_func_start sub_81245F4
sub_81245F4: @ 81245F4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r0, 0
	mov r12, r0
	ldr r2, _0812475C @ =gUnknown_02039274
	ldr r0, [r2]
	mov r1, r12
	strb r1, [r0, 0x1E]
	strb r1, [r0, 0x1D]
	ldr r1, [r2]
	ldrb r0, [r1, 0x8]
	strb r0, [r1, 0x1F]
	ldr r0, [r2]
	ldrb r1, [r0, 0x9]
	adds r0, 0x20
	strb r1, [r0]
	ldr r4, [r2]
	ldrb r1, [r4, 0x19]
	adds r3, r1, 0
	adds r3, 0x1E
	adds r0, r3, 0
	mov r9, r2
	asrs r0, 5
	lsls r0, 5
	subs r0, r3, r0
	strb r0, [r4, 0x19]
	mov r2, r9
	ldr r1, [r2]
	ldrb r0, [r1, 0x18]
	subs r0, 0x2
	strb r0, [r1, 0x18]
	ldr r0, [r2]
	ldrb r1, [r0, 0x1A]
	adds r2, r1, 0
	adds r2, 0x17
	adds r0, r2, 0
	ldr r3, _08124760 @ =gUnknown_0203927A
	mov r10, r3
	asrs r0, 5
	lsls r0, 5
	subs r0, r2, r0
	mov r4, r10
	strb r0, [r4]
	ldr r7, _08124764 @ =gUnknown_02039278
	ldr r0, _08124768 @ =gUnknown_02039279
	mov r8, r0
_08124658:
	mov r1, r9
	ldr r3, [r1]
	ldrb r0, [r3, 0x19]
	strb r0, [r7]
	mov r2, r10
	ldrb r0, [r2]
	mov r4, r12
	adds r1, r0, r4
	adds r0, r1, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r1, r0
	mov r1, r8
	strb r0, [r1]
	ldrb r2, [r7]
	lsls r2, 1
	ldrb r0, [r1]
	lsls r0, 6
	adds r2, r0
	adds r6, r3, 0
	adds r6, 0xFC
	adds r2, r6, r2
	ldrb r1, [r3, 0x18]
	lsls r1, 1
	mov r4, r12
	lsls r0, r4, 1
	add r0, r12
	lsls r5, r0, 3
	adds r1, r5
	adds r4, r3, 0
	adds r4, 0x22
	adds r1, r4, r1
	ldrh r0, [r1]
	strh r0, [r2]
	ldrb r1, [r7]
	adds r2, r1, 0x1
	adds r0, r2, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r2, r0
	strb r0, [r7]
	ldrb r1, [r7]
	lsls r1, 1
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 6
	adds r1, r0
	adds r1, r6, r1
	ldrb r0, [r3, 0x18]
	adds r0, 0x1
	lsls r0, 1
	adds r0, r5
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, r12
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	cmp r0, 0x8
	bls _08124658
	ldr r4, _08124764 @ =gUnknown_02039278
	mov r5, r9
	ldr r3, [r5]
	ldrb r1, [r3, 0x19]
	adds r2, r1, 0
	adds r2, 0x1E
	adds r0, r2, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r2, r0
	strb r0, [r4]
	adds r0, r3, 0
	adds r0, 0xFC
	ldrb r2, [r4]
	movs r1, 0x2
	str r1, [sp]
	movs r6, 0x20
	str r6, [sp, 0x4]
	movs r1, 0
	movs r3, 0
	bl sub_8124E7C
	ldr r1, [r5]
	ldrb r0, [r1, 0x18]
	cmp r0, 0
	bne _0812474C
	ldrb r2, [r1, 0x1A]
	adds r3, r2, 0
	adds r3, 0x1D
	adds r0, r3, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r3, r0
	strb r0, [r1, 0x1A]
	mov r3, r9
	ldr r1, [r3]
	movs r0, 0xC
	strb r0, [r1, 0x18]
	bl sub_812446C
	mov r4, r9
	ldr r1, [r4]
	ldrb r3, [r1, 0x1A]
	adds r4, r3, 0x1
	adds r0, r4, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r4, r0
	ldr r2, _08124764 @ =gUnknown_02039278
	strb r0, [r2]
	adds r0, r1, 0
	adds r0, 0xFC
	ldrb r3, [r2]
	str r6, [sp]
	movs r1, 0x9
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	bl sub_8124E7C
_0812474C:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812475C: .4byte gUnknown_02039274
_08124760: .4byte gUnknown_0203927A
_08124764: .4byte gUnknown_02039278
_08124768: .4byte gUnknown_02039279
	thumb_func_end sub_81245F4

	thumb_func_start sub_812476C
sub_812476C: @ 812476C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r0, 0
	mov r12, r0
	ldr r2, _0812489C @ =gUnknown_02039274
	ldr r0, [r2]
	mov r1, r12
	strb r1, [r0, 0x1E]
	strb r1, [r0, 0x1D]
	ldr r1, [r2]
	ldrb r0, [r1, 0x8]
	strb r0, [r1, 0x1F]
	ldr r0, [r2]
	ldrb r1, [r0, 0x9]
	adds r0, 0x20
	strb r1, [r0]
	ldr r4, [r2]
	ldrb r1, [r4, 0x19]
	adds r3, r1, 0x2
	adds r0, r3, 0
	mov r9, r2
	asrs r0, 5
	lsls r0, 5
	subs r0, r3, r0
	strb r0, [r4, 0x19]
	mov r2, r9
	ldr r1, [r2]
	ldrb r0, [r1, 0x18]
	adds r0, 0x2
	strb r0, [r1, 0x18]
	ldr r1, _081248A0 @ =gUnknown_0203927D
	ldr r0, [r2]
	ldrb r0, [r0, 0x1A]
	strb r0, [r1]
	ldr r4, _081248A4 @ =gUnknown_0203927C
	mov r10, r4
	ldr r7, _081248A8 @ =gUnknown_0203927B
	mov r8, r10
_081247C0:
	mov r0, r9
	ldr r3, [r0]
	ldrb r0, [r3, 0x19]
	strb r0, [r7]
	ldr r1, _081248A0 @ =gUnknown_0203927D
	ldrb r0, [r1]
	mov r2, r12
	adds r1, r0, r2
	adds r0, r1, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r1, r0
	mov r4, r8
	strb r0, [r4]
	ldrb r2, [r7]
	lsls r2, 1
	ldrb r0, [r4]
	lsls r0, 6
	adds r2, r0
	adds r6, r3, 0
	adds r6, 0xFC
	adds r2, r6, r2
	ldrb r1, [r3, 0x18]
	lsls r1, 1
	mov r4, r12
	lsls r0, r4, 1
	add r0, r12
	lsls r5, r0, 3
	adds r1, r5
	adds r4, r3, 0
	adds r4, 0x22
	adds r1, r4, r1
	ldrh r0, [r1]
	strh r0, [r2]
	ldrb r1, [r7]
	adds r2, r1, 0x1
	adds r0, r2, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r2, r0
	strb r0, [r7]
	ldrb r1, [r7]
	lsls r1, 1
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 6
	adds r1, r0
	adds r1, r6, r1
	ldrb r0, [r3, 0x18]
	adds r0, 0x1
	lsls r0, 1
	adds r0, r5
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, r12
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	cmp r0, 0x8
	bls _081247C0
	mov r4, r9
	ldr r1, [r4]
	ldrb r2, [r1, 0x1A]
	adds r3, r2, 0
	adds r3, 0x17
	adds r0, r3, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r3, r0
	mov r2, r10
	strb r0, [r2]
	adds r0, r1, 0
	adds r0, 0xFC
	ldrb r2, [r1, 0x19]
	mov r1, r10
	ldrb r3, [r1]
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0x9
	str r1, [sp, 0x4]
	movs r1, 0
	bl sub_8124E7C
	ldr r1, [r4]
	ldrb r0, [r1, 0x18]
	cmp r0, 0xA
	bne _0812488C
	ldrb r2, [r1, 0x1A]
	adds r3, r2, 0x3
	adds r0, r3, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r3, r0
	strb r0, [r1, 0x1A]
	mov r2, r9
	ldr r1, [r2]
	movs r0, 0xFE
	strb r0, [r1, 0x18]
	bl sub_812446C
_0812488C:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812489C: .4byte gUnknown_02039274
_081248A0: .4byte gUnknown_0203927D
_081248A4: .4byte gUnknown_0203927C
_081248A8: .4byte gUnknown_0203927B
	thumb_func_end sub_812476C

	thumb_func_start sub_81248AC
sub_81248AC: @ 81248AC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _081248BA
	cmp r0, 0x1
	beq _081248E4
_081248BA:
	ldr r1, _081248E0 @ =gUnknown_02039274
	ldr r2, [r1]
	movs r3, 0
	movs r0, 0x2
	strb r0, [r2, 0x1B]
	ldr r0, [r1]
	strb r3, [r0, 0x19]
	ldr r2, [r1]
	movs r0, 0x14
	strb r0, [r2, 0x1A]
	ldr r1, [r1]
	movs r0, 0xC
	strb r0, [r1, 0x18]
	bl sub_812446C
	bl sub_81245F4
	b _08124906
	.align 2, 0
_081248E0: .4byte gUnknown_02039274
_081248E4:
	ldr r1, _08124914 @ =gUnknown_02039274
	ldr r2, [r1]
	movs r0, 0x2
	strb r0, [r2, 0x1B]
	ldr r2, [r1]
	movs r0, 0x1C
	strb r0, [r2, 0x19]
	ldr r2, [r1]
	movs r0, 0x14
	strb r0, [r2, 0x1A]
	ldr r1, [r1]
	movs r0, 0x4
	strb r0, [r1, 0x18]
	bl sub_812446C
	bl sub_812476C
_08124906:
	ldr r0, _08124914 @ =gUnknown_02039274
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x1C]
	pop {r0}
	bx r0
	.align 2, 0
_08124914: .4byte gUnknown_02039274
	thumb_func_end sub_81248AC

	.align 2, 0 @ Don't pad with nop.
