	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text
	
	thumb_func_start SetUpFieldMove_SweetScent
SetUpFieldMove_SweetScent: @ 812BFB4
	ldr r1, _0812BFC4 @ =gUnknown_0300485C
	ldr r0, _0812BFC8 @ =sub_808AB90
	str r0, [r1]
	ldr r1, _0812BFCC @ =gUnknown_03005CE4
	ldr r0, _0812BFD0 @ =sub_812BFD4
	str r0, [r1]
	movs r0, 0x1
	bx lr
	.align 2, 0
_0812BFC4: .4byte gUnknown_0300485C
_0812BFC8: .4byte sub_808AB90
_0812BFCC: .4byte gUnknown_03005CE4
_0812BFD0: .4byte sub_812BFD4
	thumb_func_end SetUpFieldMove_SweetScent

	thumb_func_start sub_812BFD4
sub_812BFD4: @ 812BFD4
	push {lr}
	movs r0, 0x33
	bl FieldEffectStart
	ldr r0, _0812BFE8 @ =gUnknown_0202FF84
	ldr r1, _0812BFEC @ =gLastFieldPokeMenuOpened
	ldrb r1, [r1]
	str r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0812BFE8: .4byte gUnknown_0202FF84
_0812BFEC: .4byte gLastFieldPokeMenuOpened
	thumb_func_end sub_812BFD4

	thumb_func_start FldEff_SweetScent
FldEff_SweetScent: @ 812BFF0
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0812C014 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _0812C018 @ =sub_812C01C
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0812C014: .4byte gTasks
_0812C018: .4byte sub_812C01C
	thumb_func_end FldEff_SweetScent

	thumb_func_start sub_812C01C
sub_812C01C: @ 812C01C
	push {lr}
	sub sp, 0x4
	movs r0, 0xEC
	bl PlaySE
	bl GetPlayerAvatarObjectId
	ldr r2, _0812C078 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	mvns r0, r0
	movs r1, 0x1F
	str r1, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x8
	bl BeginNormalPaletteFade
	ldr r0, _0812C07C @ =sub_812C084
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0812C080 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	movs r0, 0x33
	bl FieldEffectActiveListRemove
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0812C078: .4byte gSprites
_0812C07C: .4byte sub_812C084
_0812C080: .4byte gTasks
	thumb_func_end sub_812C01C

	thumb_func_start sub_812C084
sub_812C084: @ 812C084
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0812C0C8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _0812C110
	ldr r0, _0812C0CC @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r4, r1, r0
	ldrh r1, [r4, 0x8]
	movs r3, 0x8
	ldrsh r0, [r4, r3]
	cmp r0, 0x40
	bne _0812C10C
	strh r2, [r4, 0x8]
	bl SweetScentWildEncounter
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812C0D0
	adds r0, r5, 0
	bl DestroyTask
	b _0812C110
	.align 2, 0
_0812C0C8: .4byte gPaletteFade
_0812C0CC: .4byte gTasks
_0812C0D0:
	ldr r0, _0812C104 @ =sub_812C118
	str r0, [r4]
	bl GetPlayerAvatarObjectId
	ldr r2, _0812C108 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	mvns r0, r0
	movs r1, 0x1F
	str r1, [sp]
	movs r1, 0x4
	movs r2, 0x8
	movs r3, 0
	bl BeginNormalPaletteFade
	b _0812C110
	.align 2, 0
_0812C104: .4byte sub_812C118
_0812C108: .4byte gSprites
_0812C10C:
	adds r0, r1, 0x1
	strh r0, [r4, 0x8]
_0812C110:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_812C084

	thumb_func_start sub_812C118
sub_812C118: @ 812C118
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0812C13C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0812C136
	ldr r0, _0812C140 @ =SweetScentNothingHereScript
	bl ScriptContext1_SetupScript
	adds r0, r4, 0
	bl DestroyTask
_0812C136:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812C13C: .4byte gPaletteFade
_0812C140: .4byte SweetScentNothingHereScript
	thumb_func_end sub_812C118

	.align 2, 0 @ Don't pad with nop.
