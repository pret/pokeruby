	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_8146014
sub_8146014: @ 8146014
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTasks
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_8146014

	thumb_func_start sub_814602C
sub_814602C: @ 814602C
	push {lr}
	ldr r2, _0814604C @ =REG_BG0VOFS
	ldr r0, _08146050 @ =gUnknown_030041B4
	ldrh r1, [r0]
	strh r1, [r2]
	ldr r0, _08146054 @ =REG_BG1VOFS
	strh r1, [r0]
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
_0814604C: .4byte REG_BG0VOFS
_08146050: .4byte gUnknown_030041B4
_08146054: .4byte REG_BG1VOFS
	thumb_func_end sub_814602C

	thumb_func_start sub_8146058
sub_8146058: @ 8146058
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08146074 @ =gMain
	ldr r1, _08146078 @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0xC
	bls _0814606A
	b _08146250
_0814606A:
	lsls r0, 2
	ldr r1, _0814607C @ =_08146080
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08146074: .4byte gMain
_08146078: .4byte 0x0000043c
_0814607C: .4byte _08146080
	.align 2, 0
_08146080:
	.4byte _081460B4
	.4byte _081460CC
	.4byte _081460F0
	.4byte _081460F6
	.4byte _08146110
	.4byte _0814611C
	.4byte _0814613C
	.4byte _0814615C
	.4byte _08146170
	.4byte _08146190
	.4byte _081461B4
	.4byte _08146204
	.4byte _08146224
_081460B4:
	bl sub_80F9438
	bl sub_80F9368
	bl sub_8146288
	ldr r1, _081460C8 @ =REG_BLDCNT
	movs r0, 0
	strh r0, [r1]
	b _0814620C
	.align 2, 0
_081460C8: .4byte REG_BLDCNT
_081460CC:
	bl ResetPaletteFade
	ldr r2, _081460E4 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r1, _081460E8 @ =gMain
	ldr r0, _081460EC @ =0x0000043c
	adds r1, r0
	b _08146212
	.align 2, 0
_081460E4: .4byte gPaletteFade
_081460E8: .4byte gMain
_081460EC: .4byte 0x0000043c
_081460F0:
	bl ResetSpriteData
	b _0814620C
_081460F6:
	ldr r0, _08146104 @ =gWindowConfig_81E6E18
	bl SetUpWindowConfig
	ldr r1, _08146108 @ =gMain
	ldr r0, _0814610C @ =0x0000043c
	adds r1, r0
	b _08146212
	.align 2, 0
_08146104: .4byte gWindowConfig_81E6E18
_08146108: .4byte gMain
_0814610C: .4byte 0x0000043c
_08146110:
	ldr r0, _08146118 @ =gWindowConfig_81E6E18
	bl MultistepInitMenuWindowBegin
	b _0814620C
	.align 2, 0
_08146118: .4byte gWindowConfig_81E6E18
_0814611C:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	bne _08146126
	b _08146250
_08146126:
	ldr r0, _08146134 @ =0x02000000
	ldr r1, _08146138 @ =0x0001ffff
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	b _0814620C
	.align 2, 0
_08146134: .4byte 0x02000000
_08146138: .4byte 0x0001ffff
_0814613C:
	bl sub_81462B8
	lsls r0, 24
	cmp r0, 0
	bne _08146148
	b _08146250
_08146148:
	ldr r0, _08146154 @ =0x02000000
	ldr r1, _08146158 @ =0x0001ffff
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	b _0814620C
	.align 2, 0
_08146154: .4byte 0x02000000
_08146158: .4byte 0x0001ffff
_0814615C:
	bl sub_81464E4
	ldr r1, _08146168 @ =gMain
	ldr r0, _0814616C @ =0x0000043c
	adds r1, r0
	b _08146212
	.align 2, 0
_08146168: .4byte gMain
_0814616C: .4byte 0x0000043c
_08146170:
	ldr r0, _08146188 @ =word_203855E
	ldrb r0, [r0]
	adds r0, 0x7B
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x38
	movs r2, 0x40
	bl sub_80A7D8C
	ldr r1, _0814618C @ =gUnknown_0203932C
	strb r0, [r1]
	b _0814620C
	.align 2, 0
_08146188: .4byte word_203855E
_0814618C: .4byte gUnknown_0203932C
_08146190:
	ldr r0, _081461A8 @ =word_203855E
	ldrb r0, [r0]
	adds r0, 0x7B
	lsls r0, 24
	lsrs r0, 24
	bl sub_8146600
	ldr r1, _081461AC @ =gMain
	ldr r0, _081461B0 @ =0x0000043c
	adds r1, r0
	b _08146212
	.align 2, 0
_081461A8: .4byte word_203855E
_081461AC: .4byte gMain
_081461B0: .4byte 0x0000043c
_081461B4:
	ldr r3, _081461EC @ =0x04000208
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _081461F0 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _081461F4 @ =REG_DISPSTAT
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _081461F8 @ =sub_814602C
	bl SetVBlankCallback
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _081461FC @ =gMain
	ldr r0, _08146200 @ =0x0000043c
	adds r1, r0
	b _08146212
	.align 2, 0
_081461EC: .4byte 0x04000208
_081461F0: .4byte 0x04000200
_081461F4: .4byte REG_DISPSTAT
_081461F8: .4byte sub_814602C
_081461FC: .4byte gMain
_08146200: .4byte 0x0000043c
_08146204:
	bl sub_8055870
	cmp r0, 0x1
	beq _08146250
_0814620C:
	ldr r1, _0814621C @ =gMain
	ldr r2, _08146220 @ =0x0000043c
	adds r1, r2
_08146212:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08146250
	.align 2, 0
_0814621C: .4byte gMain
_08146220: .4byte 0x0000043c
_08146224:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _08146248 @ =gPaletteFade
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _0814624C @ =sub_8146014
	bl SetMainCallback2
	movs r0, 0x1
	b _08146252
	.align 2, 0
_08146248: .4byte gPaletteFade
_0814624C: .4byte sub_8146014
_08146250:
	movs r0, 0
_08146252:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8146058

	thumb_func_start sub_814625C
sub_814625C: @ 814625C
	push {lr}
_0814625E:
	bl sub_8146058
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08146278
	ldr r0, _08146274 @ =sub_8146480
	movs r1, 0
	bl CreateTask
	b _08146284
	.align 2, 0
_08146274: .4byte sub_8146480
_08146278:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0814625E
_08146284:
	pop {r0}
	bx r0
	thumb_func_end sub_814625C

	thumb_func_start sub_8146288
sub_8146288: @ 8146288
	ldr r1, _081462A8 @ =REG_BG1CNT
	ldr r2, _081462AC @ =0x00000502
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	adds r2, 0xFE
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _081462B0 @ =0x00000703
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _081462B4 @ =gUnknown_030041B4
	movs r0, 0
	strh r0, [r1]
	bx lr
	.align 2, 0
_081462A8: .4byte REG_BG1CNT
_081462AC: .4byte 0x00000502
_081462B0: .4byte 0x00000703
_081462B4: .4byte gUnknown_030041B4
	thumb_func_end sub_8146288

	thumb_func_start sub_81462B8
sub_81462B8: @ 81462B8
	push {r4-r7,lr}
	ldr r1, _081462D4 @ =0x02000000
	ldr r2, _081462D8 @ =0x0001ffff
	adds r0, r1, r2
	ldrb r0, [r0]
	mov r12, r1
	cmp r0, 0x6
	bls _081462CA
	b _08146404
_081462CA:
	lsls r0, 2
	ldr r1, _081462DC @ =_081462E0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081462D4: .4byte 0x02000000
_081462D8: .4byte 0x0001ffff
_081462DC: .4byte _081462E0
	.align 2, 0
_081462E0:
	.4byte _081462FC
	.4byte _0814630C
	.4byte _0814632C
	.4byte _08146340
	.4byte _081463A4
	.4byte _081463C4
	.4byte _081463E4
_081462FC:
	ldr r0, _08146308 @ =gBerryCheck_Gfx
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
	b _081463CA
	.align 2, 0
_08146308: .4byte gBerryCheck_Gfx
_0814630C:
	ldr r0, _0814631C @ =gUnknown_08E788E4
	ldr r1, _08146320 @ =0x06002800
	bl LZDecompressVram
	ldr r1, _08146324 @ =0x02000000
	ldr r2, _08146328 @ =0x0001ffff
	adds r1, r2
	b _081463D0
	.align 2, 0
_0814631C: .4byte gUnknown_08E788E4
_08146320: .4byte 0x06002800
_08146324: .4byte 0x02000000
_08146328: .4byte 0x0001ffff
_0814632C:
	ldr r0, _08146338 @ =gUnknown_08E78A84
	ldr r1, _0814633C @ =0x06003000
	bl LZDecompressVram
	b _081463CA
	.align 2, 0
_08146338: .4byte gUnknown_08E78A84
_0814633C: .4byte 0x06003000
_08146340:
	movs r1, 0
	ldr r7, _0814635C @ =gBG2TilemapBuffer
	adds r2, r7, 0
	ldr r6, _08146360 @ =0x00004042
	ldr r5, _08146364 @ =gSaveBlock2
	ldr r4, _08146368 @ =0x00005042
	ldr r3, _0814636C @ =0x000003ff
_0814634E:
	ldrb r0, [r5, 0x8]
	cmp r0, 0
	bne _08146370
	lsls r0, r1, 1
	adds r0, r2
	strh r6, [r0]
	b _08146376
	.align 2, 0
_0814635C: .4byte gBG2TilemapBuffer
_08146360: .4byte 0x00004042
_08146364: .4byte gSaveBlock2
_08146368: .4byte 0x00005042
_0814636C: .4byte 0x000003ff
_08146370:
	lsls r0, r1, 1
	adds r0, r2
	strh r4, [r0]
_08146376:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r3
	bls _0814634E
	ldr r1, _08146394 @ =0x06003800
	ldr r0, _08146398 @ =0x040000d4
	str r7, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0814639C @ =0x80000400
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r1, _081463A0 @ =0x0001ffff
	add r1, r12
	b _081463D0
	.align 2, 0
_08146394: .4byte 0x06003800
_08146398: .4byte 0x040000d4
_0814639C: .4byte 0x80000400
_081463A0: .4byte 0x0001ffff
_081463A4:
	ldr r0, _081463B8 @ =gBerryCheck_Pal
	movs r1, 0
	movs r2, 0xC0
	bl LoadCompressedPalette
	ldr r1, _081463BC @ =0x02000000
	ldr r2, _081463C0 @ =0x0001ffff
	adds r1, r2
	b _081463D0
	.align 2, 0
_081463B8: .4byte gBerryCheck_Pal
_081463BC: .4byte 0x02000000
_081463C0: .4byte 0x0001ffff
_081463C4:
	ldr r0, _081463D8 @ =gUnknown_083C1F74
	bl LoadCompressedObjectPic
_081463CA:
	ldr r1, _081463DC @ =0x02000000
	ldr r0, _081463E0 @ =0x0001ffff
	adds r1, r0
_081463D0:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08146404
	.align 2, 0
_081463D8: .4byte gUnknown_083C1F74
_081463DC: .4byte 0x02000000
_081463E0: .4byte 0x0001ffff
_081463E4:
	ldr r0, _081463F8 @ =gUnknown_083C1F7C
	bl LoadCompressedObjectPalette
	ldr r0, _081463FC @ =0x02000000
	ldr r1, _08146400 @ =0x0001ffff
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	b _08146406
	.align 2, 0
_081463F8: .4byte gUnknown_083C1F7C
_081463FC: .4byte 0x02000000
_08146400: .4byte 0x0001ffff
_08146404:
	movs r0, 0
_08146406:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_81462B8

	thumb_func_start sub_814640C
sub_814640C: @ 814640C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08146438 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08146432
	ldr r0, _0814643C @ =sub_80A5B40
	bl SetMainCallback2
	bl sub_80A7DD4
	bl gpu_pal_allocator_reset__manage_upper_four
	adds r0, r4, 0
	bl DestroyTask
_08146432:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08146438: .4byte gPaletteFade
_0814643C: .4byte sub_80A5B40
	thumb_func_end sub_814640C

	thumb_func_start sub_8146440
sub_8146440: @ 8146440
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _08146478 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0814647C @ =sub_814640C
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08146478: .4byte gTasks
_0814647C: .4byte sub_814640C
	thumb_func_end sub_8146440

	thumb_func_start sub_8146480
sub_8146480: @ 8146480
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r7, r4, 0
	ldr r0, _081464DC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081464D6
	ldr r5, _081464E0 @ =gMain
	ldrh r1, [r5, 0x30]
	movs r6, 0xF0
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0x40
	bne _081464AC
	movs r1, 0x1
	negs r1, r1
	adds r0, r4, 0
	bl sub_81466E8
_081464AC:
	ldrh r1, [r5, 0x30]
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0x80
	bne _081464BE
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_81466E8
_081464BE:
	ldrh r1, [r5, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _081464D0
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081464D6
_081464D0:
	adds r0, r7, 0
	bl sub_8146440
_081464D6:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081464DC: .4byte gPaletteFade
_081464E0: .4byte gMain
	thumb_func_end sub_8146480

	thumb_func_start sub_81464E4
sub_81464E4: @ 81464E4
	push {r4-r7,lr}
	ldr r4, _0814659C @ =word_203855E
	ldrb r0, [r4]
	adds r0, 0x7C
	lsls r0, 24
	lsrs r0, 24
	bl GetBerryInfo
	adds r5, r0, 0
	ldr r7, _081465A0 @ =gStringVar1
	ldrh r1, [r4]
	subs r1, 0x84
	adds r0, r7, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r0, r7, 0
	movs r1, 0xC
	movs r2, 0x4
	bl MenuPrint
	adds r0, r5, 0
	movs r1, 0xE
	movs r2, 0x4
	bl MenuPrint
	ldr r0, [r5, 0xC]
	movs r1, 0x4
	movs r2, 0xE
	bl MenuPrint
	ldr r0, [r5, 0x10]
	movs r1, 0x4
	movs r2, 0x10
	bl MenuPrint
	ldrh r1, [r5, 0x8]
	lsls r0, r1, 5
	subs r0, r1
	lsls r0, 2
	adds r0, r1
	lsls r0, 3
	movs r1, 0xFE
	bl __divsi3
	adds r4, r0, 0
	movs r1, 0xA
	bl __umodsi3
	cmp r0, 0x4
	bls _0814654E
	adds r4, 0xA
_0814654E:
	adds r0, r4, 0
	movs r1, 0x64
	bl __umodsi3
	movs r1, 0xA
	bl __udivsi3
	adds r6, r0, 0
	adds r0, r4, 0
	movs r1, 0x64
	bl __udivsi3
	adds r4, r0, 0
	ldr r0, _081465A4 @ =gOtherText_Size
	movs r1, 0xB
	movs r2, 0x7
	bl MenuPrint
	ldrh r0, [r5, 0x8]
	cmp r0, 0
	beq _081465B0
	adds r0, r7, 0
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _081465A8 @ =gStringVar2
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _081465AC @ =gContestStatsText_Unknown1
	movs r1, 0x10
	movs r2, 0x7
	bl MenuPrint
	b _081465BA
	.align 2, 0
_0814659C: .4byte word_203855E
_081465A0: .4byte gStringVar1
_081465A4: .4byte gOtherText_Size
_081465A8: .4byte gStringVar2
_081465AC: .4byte gContestStatsText_Unknown1
_081465B0:
	ldr r0, _081465E0 @ =gOtherText_ThreeQuestions2
	movs r1, 0x10
	movs r2, 0x7
	bl MenuPrint
_081465BA:
	ldr r0, _081465E4 @ =gOtherText_Firm
	movs r1, 0xB
	movs r2, 0x9
	bl MenuPrint
	ldrb r0, [r5, 0x7]
	cmp r0, 0
	beq _081465EC
	ldr r0, _081465E8 @ =gUnknown_0841192C
	ldrb r1, [r5, 0x7]
	subs r1, 0x1
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	movs r1, 0x10
	movs r2, 0x9
	bl MenuPrint
	b _081465F6
	.align 2, 0
_081465E0: .4byte gOtherText_ThreeQuestions2
_081465E4: .4byte gOtherText_Firm
_081465E8: .4byte gUnknown_0841192C
_081465EC:
	ldr r0, _081465FC @ =gOtherText_ThreeQuestions2
	movs r1, 0x10
	movs r2, 0x9
	bl MenuPrint
_081465F6:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081465FC: .4byte gOtherText_ThreeQuestions2
	thumb_func_end sub_81464E4

	thumb_func_start sub_8146600
sub_8146600: @ 8146600
	push {r4,r5,lr}
	lsls r0, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r0, 24
	bl GetBerryInfo
	adds r4, r0, 0
	movs r2, 0
	ldr r5, _08146698 @ =gUnknown_0203932E
	ldr r0, _0814669C @ =0x0000ffff
	adds r3, r0, 0
_0814661A:
	lsls r0, r2, 1
	adds r0, r5
	ldrh r1, [r0]
	orrs r1, r3
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x4
	bls _0814661A
	ldrb r0, [r4, 0x15]
	cmp r0, 0
	beq _08146642
	movs r0, 0x30
	bl sub_80A7E5C
	ldr r1, _08146698 @ =gUnknown_0203932E
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1]
_08146642:
	ldrb r0, [r4, 0x16]
	cmp r0, 0
	beq _08146656
	movs r0, 0x58
	bl sub_80A7E5C
	ldr r1, _08146698 @ =gUnknown_0203932E
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x2]
_08146656:
	ldrb r0, [r4, 0x17]
	cmp r0, 0
	beq _0814666A
	movs r0, 0x80
	bl sub_80A7E5C
	ldr r1, _08146698 @ =gUnknown_0203932E
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x4]
_0814666A:
	ldrb r0, [r4, 0x18]
	cmp r0, 0
	beq _0814667E
	movs r0, 0xA8
	bl sub_80A7E5C
	ldr r1, _08146698 @ =gUnknown_0203932E
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x6]
_0814667E:
	ldrb r0, [r4, 0x19]
	cmp r0, 0
	beq _08146692
	movs r0, 0xD0
	bl sub_80A7E5C
	ldr r1, _08146698 @ =gUnknown_0203932E
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x8]
_08146692:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08146698: .4byte gUnknown_0203932E
_0814669C: .4byte 0x0000ffff
	thumb_func_end sub_8146600

	thumb_func_start sub_81466A0
sub_81466A0: @ 81466A0
	push {r4-r7,lr}
	movs r5, 0
	movs r7, 0x1
	negs r7, r7
	ldr r6, _081466DC @ =gUnknown_0203932E
_081466AA:
	lsls r0, r5, 1
	adds r4, r0, r6
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, r7
	beq _081466CA
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081466E0 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r0, _081466E4 @ =0x0000ffff
	strh r0, [r4]
_081466CA:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x4
	bls _081466AA
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081466DC: .4byte gUnknown_0203932E
_081466E0: .4byte gSprites
_081466E4: .4byte 0x0000ffff
	thumb_func_end sub_81466A0

	thumb_func_start sub_81466E8
sub_81466E8: @ 81466E8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _08146748 @ =gUnknown_03004B28
	adds r6, r0, r1
	ldr r4, _0814674C @ =gUnknown_03005D10
	movs r0, 0xC
	adds r0, r4
	mov r8, r0
	ldrb r1, [r0, 0x1]
	ldrb r0, [r4, 0xC]
	adds r1, r0
	cmp r1, 0
	bne _08146718
	lsls r0, r2, 24
	cmp r0, 0
	blt _0814678C
_08146718:
	adds r0, r1, 0x1
	lsls r5, r2, 24
	mov r1, r8
	ldrb r1, [r1, 0x2]
	cmp r0, r1
	bne _08146728
	cmp r5, 0
	bgt _0814678C
_08146728:
	movs r0, 0x5
	bl PlaySE
	mov r2, r8
	ldrb r3, [r2, 0x1]
	ldrb r4, [r4, 0xC]
	mov r12, r4
	adds r0, r3, r4
	asrs r2, r5, 24
	adds r1, r0, r2
	cmp r1, 0
	bge _08146750
	negs r0, r0
	strh r0, [r6, 0x2]
	b _08146766
	.align 2, 0
_08146748: .4byte gUnknown_03004B28
_0814674C: .4byte gUnknown_03005D10
_08146750:
	mov r4, r8
	ldrb r0, [r4, 0x2]
	cmp r1, r0
	blt _08146764
	subs r0, r3
	mov r1, r12
	subs r0, r1
	subs r0, 0x1
	strh r0, [r6, 0x2]
	b _08146766
_08146764:
	strh r2, [r6, 0x2]
_08146766:
	ldr r0, _08146780 @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldr r0, _08146784 @ =sub_8146798
	str r0, [r1]
	cmp r5, 0
	bge _08146788
	movs r2, 0x10
	negs r2, r2
	adds r0, r2, 0
	b _0814678A
	.align 2, 0
_08146780: .4byte gTasks
_08146784: .4byte sub_8146798
_08146788:
	movs r0, 0x10
_0814678A:
	strh r0, [r6]
_0814678C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81466E8

	thumb_func_start sub_8146798
sub_8146798: @ 8146798
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08146800 @ =gUnknown_03004B28
	adds r0, r1
	ldr r2, _08146804 @ =gUnknown_030041B4
	ldrh r1, [r0]
	ldrh r5, [r2]
	adds r3, r1, r5
	movs r1, 0xFF
	ands r3, r1
	strh r3, [r2]
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	ble _081467C2
	cmp r3, 0x90
	beq _081467CA
_081467C2:
	cmp r0, 0
	bge _081467E0
	cmp r3, 0x70
	bne _081467E0
_081467CA:
	ldr r0, _08146808 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0xA
	ldrsb r0, [r1, r0]
	bl sub_8146810
	bl sub_81468BC
_081467E0:
	ldr r0, _08146804 @ =gUnknown_030041B4
	ldrh r2, [r0]
	cmp r2, 0
	bne _081467FA
	ldr r0, _08146808 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	strh r2, [r1, 0x8]
	strh r2, [r1, 0xA]
	ldr r0, _0814680C @ =sub_8146480
	str r0, [r1]
_081467FA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08146800: .4byte gUnknown_03004B28
_08146804: .4byte gUnknown_030041B4
_08146808: .4byte gTasks
_0814680C: .4byte sub_8146480
	thumb_func_end sub_8146798

	thumb_func_start sub_8146810
sub_8146810: @ 8146810
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	adds r4, r3, 0
	lsls r0, r3, 24
	asrs r1, r0, 24
	cmp r1, 0
	ble _08146848
	ldr r0, _08146840 @ =gUnknown_03005D10
	adds r4, r0, 0
	adds r4, 0xC
	ldrb r2, [r0, 0xC]
	adds r1, r2, r1
	adds r6, r0, 0
	cmp r1, 0x7
	ble _08146844
	adds r0, r3, 0
	adds r0, 0xF9
	adds r0, r2, r0
	ldrb r1, [r4, 0x1]
	adds r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x7
	b _0814686E
	.align 2, 0
_08146840: .4byte gUnknown_03005D10
_08146844:
	adds r0, r2, r3
	b _0814686E
_08146848:
	ldr r0, _08146868 @ =gUnknown_03005D10
	adds r5, r0, 0
	adds r5, 0xC
	ldrb r2, [r0, 0xC]
	adds r1, r2, r1
	adds r6, r0, 0
	cmp r1, 0
	bge _0814686C
	adds r0, r2, r3
	ldrb r1, [r5, 0x1]
	adds r0, r1
	movs r1, 0
	strb r0, [r5, 0x1]
	strb r1, [r6, 0xC]
	b _08146870
	.align 2, 0
_08146868: .4byte gUnknown_03005D10
_0814686C:
	adds r0, r2, r4
_0814686E:
	strb r0, [r6, 0xC]
_08146870:
	ldr r2, _081468AC @ =word_203855E
	movs r0, 0x3
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0]
	adds r1, r0
	ldr r0, _081468B0 @ =gUnknown_03005D24
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1]
	strh r0, [r2]
	ldr r0, _081468B4 @ =gUnknown_0203932C
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081468B8 @ =gSprites
	adds r0, r1
	bl DestroySprite
	bl sub_81466A0
	bl sub_80A7DD4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081468AC: .4byte word_203855E
_081468B0: .4byte gUnknown_03005D24
_081468B4: .4byte gUnknown_0203932C
_081468B8: .4byte gSprites
	thumb_func_end sub_8146810

	thumb_func_start sub_81468BC
sub_81468BC: @ 81468BC
	push {r4,lr}
	movs r0, 0
	movs r1, 0x4
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_81464E4
	ldr r4, _081468F8 @ =word_203855E
	ldrb r0, [r4]
	adds r0, 0x7B
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x38
	movs r2, 0x40
	bl sub_80A7D8C
	ldr r1, _081468FC @ =gUnknown_0203932C
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, 0x7B
	lsls r0, 24
	lsrs r0, 24
	bl sub_8146600
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081468F8: .4byte word_203855E
_081468FC: .4byte gUnknown_0203932C
	thumb_func_end sub_81468BC

	.align 2, 0 @ Don't pad with nop.
