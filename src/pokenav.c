
// Includes
#include "global.h"
#include "main.h"
#include "menu.h"
#include "overworld.h"
#include "pokenav.h"
#include "battle.h"
#include "data2.h"
#include "text.h"
#include "gba/io_reg.h"
#include "string_util.h"
#include "strings.h"

// Static type declarations

// Static RAM declarations

EWRAM_DATA u8 gUnknown_020388B0[4] = {};
EWRAM_DATA u16 gUnknown_020388B4 = 0;

// Static ROM declarations
extern void sub_80F445C(u8, u16);
extern void sub_80F443C(u8 *, u16);
extern int sub_80F098C();
u8 sub_80F0718();
// .rodata

// .text
NAKED
void sub_80F063C(s16 arg0)
{
	asm(".syntax unified\n\
    push {r4-r7,lr}\n\
	lsls r0, 16\n\
	ldr r3, _080F0664 @ =gUnknown_083DFEC4\n\
	ldr r2, [r3]\n\
	lsrs r5, r0, 16\n\
	asrs r4, r0, 16\n\
	lsls r1, r4, 4\n\
	ldr r6, _080F0668 @ =0x0000877c\n\
	adds r0, r2, r6\n\
	strh r1, [r0]\n\
	adds r7, r3, 0\n\
	cmp r4, 0x1\n\
	beq _080F065E\n\
	movs r0, 0x1\n\
	negs r0, r0\n\
	cmp r4, r0\n\
	bne _080F066C\n\
_080F065E:\n\
	movs r1, 0x4\n\
	b _080F066E\n\
	.align 2, 0\n\
_080F0664: .4byte gUnknown_083DFEC4\n\
_080F0668: .4byte 0x0000877c\n\
_080F066C:\n\
	movs r1, 0x8\n\
_080F066E:\n\
	ldr r3, _080F06C0 @ =0x0000877a\n\
	adds r0, r2, r3\n\
	strh r1, [r0]\n\
	lsls r0, r5, 16\n\
	asrs r3, r0, 16\n\
	cmp r3, 0\n\
	bge _080F06CC\n\
	ldr r4, [r7]\n\
	ldr r6, _080F06C0 @ =0x0000877a\n\
	adds r1, r4, r6\n\
	movs r2, 0\n\
	ldrsh r0, [r1, r2]\n\
    negs r0, r0\n\
	strh r0, [r1]\n\
	subs r6, 0x2\n\
	adds r1, r4, r6\n\
	lsls r0, r3, 1\n\
    ldrh r1, [r1]\n\
	adds r0, r1\n\
	lsls r0, 16\n\
	lsrs r6, r0, 16\n\
	ldr r1, _080F06C4 @ =0x00008770\n\
	adds r0, r4, r1\n\
	ldrh r0, [r0]\n\
	adds r0, r3, r0\n\
	lsls r0, 16\n\
	lsrs r2, r0, 16\n\
	asrs r0, 16\n\
	cmp r0, 0\n\
	bge _080F06B8\n\
	ldr r2, _080F06C8 @ =0x00008774\n\
	adds r1, r4, r2\n\
	adds r0, 0x1\n\
	ldrh r1, [r1]\n\
	adds r0, r1\n\
	lsls r0, 16\n\
	lsrs r2, r0, 16\n\
_080F06B8:\n\
	negs r0, r3\n\
	lsls r0, 16\n\
	lsrs r5, r0, 16\n\
	b _080F06E6\n\
	.align 2, 0\n\
_080F06C0: .4byte 0x0000877a\n\
_080F06C4: .4byte 0x00008770\n\
_080F06C8: .4byte 0x00008774\n\
_080F06CC:\n\
	ldr r1, [r7]\n\
	ldr r3, _080F070C @ =0x00008778\n\
	adds r0, r1, r3\n\
	ldrh r0, [r0]\n\
	adds r0, 0x10\n\
	lsls r0, 16\n\
	lsrs r6, r0, 16\n\
	ldr r0, _080F0710 @ =0x00008772\n\
	adds r1, r0\n\
	ldrh r0, [r1]\n\
	adds r0, 0x1\n\
	lsls r0, 16\n\
	lsrs r2, r0, 16\n\
_080F06E6:\n\
	ldr r0, [r7]\n\
	ldr r1, _080F0714 @ =0x00008774\n\
	adds r0, r1\n\
	lsls r1, r2, 16\n\
	asrs r1, 16\n\
	movs r3, 0\n\
	ldrsh r0, [r0, r3]\n\
	cmp r1, r0\n\
	ble _080F06FA\n\
	movs r2, 0\n\
_080F06FA:\n\
	movs r1, 0x1F\n\
	adds r0, r2, 0\n\
	ands r1, r6\n\
	adds r2, r5, 0\n\
	bl sub_80F0954\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080F070C: .4byte 0x00008778\n\
_080F0710: .4byte 0x00008772\n\
_080F0714: .4byte 0x00008774\n\
.syntax divided\n");
}

#ifdef NONMATCHING
u8 sub_80F0718()
{
    u16 r0;
    //u16  r1;

    if(sub_80F098C() == 0)
    {
        if((s16)gUnknown_083DFEC4->filler877A[0x2] == 0)
            return 0;
        gUnknown_083DFEC4->filler877A[0x2] = gUnknown_083DFEC4->filler877A[0] - gUnknown_083DFEC4->filler877A[0x2];
        r0 = 256 & (gUnknown_083DFEC4->unk8776 + gUnknown_083DFEC4->filler877A[0]);
        gUnknown_083DFEC4->unk8776 = r0;
        REG_BG3VOFS = r0;
        if((s16)gUnknown_083DFEC4->filler877A[0x2] == 0)
        {
            gUnknown_083DFEC4->unk8778 = (((s16)gUnknown_083DFEC4->unk8776 + 8) & 256) >> 3;
            return 0;
        }
    }
    return 1;
}
#else
asm(".include \"constants/gba_constants.inc\"");
NAKED
u8 sub_80F0718()
{
    asm(".syntax unified\n\
    push {r4,r5,lr}\n\
	bl sub_80F098C\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	bne _080F0790\n\
	ldr r0, _080F073C @ =gUnknown_083DFEC4\n\
	ldr r4, [r0]\n\
	ldr r0, _080F0740 @ =0x0000877c\n\
	adds r3, r4, r0\n\
	ldrh r2, [r3]\n\
	movs r1, 0\n\
	ldrsh r0, [r3, r1]\n\
	cmp r0, 0\n\
	bne _080F0744\n\
	movs r0, 0\n\
	b _080F0792\n\
	.align 2, 0\n\
_080F073C: .4byte gUnknown_083DFEC4\n\
_080F0740: .4byte 0x0000877c\n\
_080F0744:\n\
	ldr r0, _080F0780 @ =0x0000877a\n\
	adds r1, r4, r0\n\
	ldrh r0, [r1]\n\
	subs r0, r2, r0\n\
	strh r0, [r3]\n\
	ldr r0, _080F0784 @ =0x00008776\n\
	adds r2, r4, r0\n\
	ldrh r0, [r1]\n\
	ldrh r1, [r2]\n\
	adds r0, r1\n\
	movs r5, 0xFF\n\
	ands r0, r5\n\
	strh r0, [r2]\n\
	ldr r1, _080F0788 @ =REG_BG3VOFS\n\
	strh r0, [r1]\n\
	movs r1, 0\n\
	ldrsh r0, [r3, r1]\n\
	cmp r0, 0\n\
	bne _080F0790\n\
	movs r1, 0\n\
	ldrsh r0, [r2, r1]\n\
	adds r0, 0x8\n\
	ands r0, r5\n\
	asrs r1, r0, 3\n\
	ldr r2, _080F078C @ =0x00008778\n\
	adds r0, r4, r2\n\
	strh r1, [r0]\n\
	movs r0, 0\n\
	b _080F0792\n\
	.align 2, 0\n\
_080F0780: .4byte 0x0000877a\n\
_080F0784: .4byte 0x00008776\n\
_080F0788: .4byte REG_BG3VOFS\n\
_080F078C: .4byte 0x00008778\n\
_080F0790:\n\
	movs r0, 0x1\n\
_080F0792:\n\
	pop {r4,r5}\n\
	pop {r1}\n\
	bx r1\n\
    .syntax divided\n");
}
#endif

NAKED
void ShowMapNamePopUpWindow()
{
    asm(".syntax unified\n\
    push {lr}\n\
	ldr r0, _080F07B0 @ =gUnknown_083DFEC4\n\
	ldr r2, [r0]\n\
	ldr r1, _080F07B4 @ =0x000087ca\n\
	adds r0, r2, r1\n\
	ldrb r0, [r0]\n\
	cmp r0, 0\n\
	beq _080F07B8\n\
	cmp r0, 0x1\n\
	beq _080F07E0\n\
	b _080F080A\n\
	.align 2, 0\n\
_080F07B0: .4byte gUnknown_083DFEC4\n\
_080F07B4: .4byte 0x000087ca\n\
_080F07B8:\n\
	ldr r3, _080F07D8 @ =0x00008788\n\
	adds r0, r2, r3\n\
	subs r3, 0x1A\n\
	adds r1, r2, r3\n\
	movs r3, 0\n\
	ldrsh r1, [r1, r3]\n\
	lsls r1, 2\n\
	adds r1, r2, r1\n\
	ldr r2, _080F07DC @ =0x0000893e\n\
	adds r1, r2\n\
	ldrh r1, [r1]\n\
	lsls r1, 18\n\
	lsrs r1, 23\n\
	bl sub_80F443C\n\
	b _080F07F4\n\
	.align 2, 0\n\
_080F07D8: .4byte 0x00008788\n\
_080F07DC: .4byte 0x0000893e\n\
_080F07E0:\n\
	ldr r3, _080F0810 @ =0x00008788\n\
	adds r0, r2, r3\n\
	subs r3, 0x1A\n\
	adds r1, r2, r3\n\
	ldrh r1, [r1]\n\
	adds r1, 0x1\n\
	lsls r1, 16\n\
	lsrs r1, 16\n\
	bl sub_80F445C\n\
_080F07F4:\n\
	ldr r0, _080F0814 @ =gWindowTemplate_81E710C\n\
	bl BasicInitMenuWindow\n\
	ldr r0, _080F0818 @ =gUnknown_083DFEC4\n\
	ldr r0, [r0]\n\
	ldr r1, _080F0810 @ =0x00008788\n\
	adds r0, r1\n\
	movs r1, 0x1\n\
	movs r2, 0x6\n\
	bl Menu_PrintText\n\
_080F080A:\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080F0810: .4byte 0x00008788\n\
_080F0814: .4byte gWindowTemplate_81E710C\n\
_080F0818: .4byte gUnknown_083DFEC4\n\
    .syntax divided\n");
}

void sub_80F081C(u8 arg0)
{
    u32 value;

    BasicInitMenuWindow(&gWindowTemplate_81E710C);
    switch(arg0)
    {
        case 0:
            MenuPrint_RightAligned(gOtherText_NumberRegistered, 10, 9);
            ConvertIntToDecimalStringN(&gUnknown_083DFEC4->unk8788[0], (s16)gUnknown_083DFEC4->filler876F[5] + 1, 1, 5);
            MenuPrint_RightAligned(&gUnknown_083DFEC4->unk8788[0], 10, 11);
            MenuPrint_RightAligned(gOtherText_NumberBattles, 10, 11);
            value = GetGameStat(9);
            if(value > 99999)
            {
                value = 99999;
            }
            ConvertIntToDecimalStringN(&gUnknown_083DFEC4->unk8788[0], value, 1, 5);
            MenuPrint_RightAligned(&gUnknown_083DFEC4->unk8788[0], 10, 15);
            break;
        case 1:
            MenuPrint_RightAligned(gOtherText_NumberRegistered, 10, 9);
            break;
        case 2:
            ConvertIntToDecimalStringN(&gUnknown_083DFEC4->unk8788[0], (s16)gUnknown_083DFEC4->filler876F[5] + 1, 1, 5);
            MenuPrint_RightAligned(&gUnknown_083DFEC4->unk8788[0], 10, 11);
            break;
        case 3:
            MenuPrint_RightAligned(gOtherText_NumberBattles, 10, 11);
            break;
        case 4:
            value = GetGameStat(9);
            if(value > 99999)
            {
                value = 99999;
            }
            ConvertIntToDecimalStringN(&gUnknown_083DFEC4->unk8788[0], value, 1, 5);
            MenuPrint_RightAligned(&gUnknown_083DFEC4->unk8788[0], 10, 15);
            break;
        default:
            break;
    }
}
