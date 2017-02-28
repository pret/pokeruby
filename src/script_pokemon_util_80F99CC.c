#include "global.h"
#include "script.h"
#include "task.h"
#include "palette.h"
#include "battle_party_menu.h"

extern u8 gPlayerPartyCount;

extern void OpenPartyMenu(u8, u8);
extern void TryCreatePartyMenuMonIcon(u8, u8, struct Pokemon *);
extern void LoadHeldItemIconGraphics(void);
extern void CreateHeldItemIcons_806DC34(); // undefined args
extern u8 sub_806BD58(u8, u8);
extern void PartyMenuPrintMonsLevelOrStatus(void);
extern void PrintPartyMenuMonNicknames(void);
extern void sub_80F9C00(void);
extern u8 sub_806B58C(u8);

void sub_80F9A8C(u8);

void sub_80F99CC(void)
{
	u8 taskId;

	ScriptContext2_Enable();
	taskId = CreateTask((void *)sub_80F9A8C, 0xA);
	gTasks[taskId].data[0] = 2;
	BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
}

void sub_80F9A0C(void)
{
	u8 taskId;

	ScriptContext2_Enable();
	taskId = CreateTask((void *)sub_80F9A8C, 0xA);
	gTasks[taskId].data[0] = 3;
	BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
}

void sub_80F9A4C(void)
{
	u8 taskId;

	ScriptContext2_Enable();
	taskId = CreateTask((void *)sub_80F9A8C, 0xA);
	gTasks[taskId].data[0] = 7;
	BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
}

void sub_80F9A8C(u8 taskId)
{
	if(!gPaletteFade.active)
	{
		gPaletteFade.bufferTransferDisabled = 1;
		OpenPartyMenu(gTasks[taskId].data[0], 0);
		DestroyTask(taskId);
	}
}

bool8 sub_80F9ACC(void)
{
	switch(EWRAM_1B000.unk264)
	{
		case 0:
			if(EWRAM_1B000.unk266 < gPlayerPartyCount)
			{
				TryCreatePartyMenuMonIcon(EWRAM_1B000.unk260, EWRAM_1B000.unk266, &gPlayerParty[EWRAM_1B000.unk266]);
				EWRAM_1B000.unk266++;
			}
			else
			{
				EWRAM_1B000.unk266 = 0;
				EWRAM_1B000.unk264++;
				
			}
			break;
		case 1:
			LoadHeldItemIconGraphics();
			EWRAM_1B000.unk264++;
			break;
		case 2:
			CreateHeldItemIcons_806DC34(EWRAM_1B000.unk260);
			EWRAM_1B000.unk264++;
			break;
		case 3:
			if(sub_806BD58(EWRAM_1B000.unk260, EWRAM_1B000.unk266) != 1)
			{
				EWRAM_1B000.unk266++;
				break;
			}
			else
			{
				EWRAM_1B000.unk266 = 0;
				EWRAM_1B000.unk264++;
				break;
			}
		case 4:
			PartyMenuPrintMonsLevelOrStatus();
			EWRAM_1B000.unk264++;
			break;
		case 5:
			PrintPartyMenuMonNicknames();
			EWRAM_1B000.unk264++;
			break;
		case 6:
			sub_80F9C00();
			EWRAM_1B000.unk264++;
			break;
		case 7: // the only case that can return true.
			if(sub_806B58C(EWRAM_1B000.unk266) != 1)
			{
				EWRAM_1B000.unk266++;
				break;
			}
			else
			{
				EWRAM_1B000.unk266 = 0;
				EWRAM_1B000.unk264 = 0;
				return TRUE;
			}
	}
	return FALSE;
}

/*
	thumb_func_start sub_80F9ACC
sub_80F9ACC: @ 80F9ACC
	push {r4,r5,lr}
	ldr r1, _080F9AEC @ =0x0201b000
	movs r2, 0x99
	lsls r2, 2
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0x7
	bls _080F9AE2
	b _080F9BF6
_080F9AE2:
	lsls r0, 2
	ldr r1, _080F9AF0 @ =_080F9AF4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F9AEC: .4byte 0x0201b000
_080F9AF0: .4byte _080F9AF4
	.align 2, 0
_080F9AF4:
	.4byte _080F9B14
	.4byte _080F9B54
	.4byte _080F9B5A
	.4byte _080F9B6E
	.4byte _080F9B98
	.4byte _080F9B9E
	.4byte _080F9BB0
	.4byte _080F9BC8
_080F9B14:
	ldr r0, _080F9B3C @ =0x00000266
	adds r5, r4, r0
	movs r1, 0
	ldrsh r3, [r5, r1]
	ldr r0, _080F9B40 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r3, r0
	bge _080F9B48
	movs r2, 0x98
	lsls r2, 2
	adds r0, r4, r2
	ldrb r0, [r0]
	ldrb r1, [r5]
	movs r2, 0x64
	muls r2, r3
	ldr r3, _080F9B44 @ =gPlayerParty
	adds r2, r3
	bl TryCreatePartyMenuMonIcon
	b _080F9BF0
	.align 2, 0
_080F9B3C: .4byte 0x00000266
_080F9B40: .4byte gPlayerPartyCount
_080F9B44: .4byte gPlayerParty
_080F9B48:
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r4, r0
	b _080F9BBC
_080F9B54:
	bl LoadHeldItemIconGraphics
	b _080F9BB4
_080F9B5A:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	bl CreateHeldItemIcons_806DC34
	movs r2, 0x99
	lsls r2, 2
	adds r1, r4, r2
	b _080F9BBC
_080F9B6E:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	ldr r2, _080F9B94 @ =0x00000266
	adds r5, r4, r2
	ldrb r1, [r5]
	bl sub_806BD58
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080F9BF0
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r4, r0
	b _080F9BBC
	.align 2, 0
_080F9B94: .4byte 0x00000266
_080F9B98:
	bl PartyMenuPrintMonsLevelOrStatus
	b _080F9BB4
_080F9B9E:
	bl PrintPartyMenuMonNicknames
	ldr r1, _080F9BAC @ =0x0201b000
	movs r0, 0x99
	lsls r0, 2
	adds r1, r0
	b _080F9BBC
	.align 2, 0
_080F9BAC: .4byte 0x0201b000
_080F9BB0:
	bl sub_80F9C00
_080F9BB4:
	ldr r1, _080F9BC4 @ =0x0201b000
	movs r2, 0x99
	lsls r2, 2
	adds r1, r2
_080F9BBC:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080F9BF6
	.align 2, 0
_080F9BC4: .4byte 0x0201b000
_080F9BC8:
	ldr r0, _080F9BEC @ =0x00000266
	adds r5, r4, r0
	ldrb r0, [r5]
	bl sub_806B58C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080F9BF0
	movs r1, 0
	strh r1, [r5]
	movs r2, 0x99
	lsls r2, 2
	adds r0, r4, r2
	strh r1, [r0]
	movs r0, 0x1
	b _080F9BF8
	.align 2, 0
_080F9BEC: .4byte 0x00000266
_080F9BF0:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_080F9BF6:
	movs r0, 0
_080F9BF8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80F9ACC
*/
