#include "global.h"
#include "mauville_old_man.h"
#include "easy_chat.h"
#include "menu.h"
#include "rng.h"
#include "script.h"
#include "string_util.h"
#include "strings.h"
#include "trader.h"

extern u16 gScriptResult;
extern u16 gSpecialVar_0x8004;

extern u32 gUnknown_083E5388[];
extern u32 gUnknown_083E53A8[];

extern u16 gUnknown_083E537C[];

void sub_80F7A34(void)
{
    u16 i;
    OldMan *oldMan = &gSaveBlock1.oldMan;

    oldMan->oldMan1.unk_2D94 = 0;
    oldMan->oldMan1.unk_2DBD = 0;

    for(i = 0; i < 6; i++)
        oldMan->oldMan1.mauvilleOldMan_ecArray[i] = gUnknown_083E537C[i];
}

void sub_80F7A6C(void)
{
    struct UnkMauvilleOldManStruct *bard = &gSaveBlock1.oldMan.oldMan1;

    bard->unk_2D94 = 1;
    bard->unk_2D95 = 0;
}

void sub_80F7A7C(void)
{
    sub_80F83F8();
}

void sub_80F7A88(void)
{
    OldMan *oldMan = &gSaveBlock1.oldMan;

    oldMan->oldMan1.unk_2D94 = 4;
    oldMan->oldMan1.unk_2D95 = 0;
}

void sub_80F7A98(void)
{
    sub_81099CC();
}

void SetMauvilleOldMan(void)
{
    u32 var = ((u16)((gSaveBlock2.playerTrainerId[1] << 8 | gSaveBlock2.playerTrainerId[0])) % 10) / 2;

    switch(var)
    {
    case 0:
        sub_80F7A34();
        break;
    case 1:
        sub_80F7A6C();
        break;
    case 2:
        sub_80F7A98();
        break;
    case 3:
        sub_80F7A7C();
        break;
    case 4:
        sub_80F7A88();
        break;
    }
    sub_80F83D0();
}

#ifdef DEBUG
__attribute__((naked))
void debug_sub_810B32C()
{
    asm(
        "	push	{r4, lr}\n"
        "	add	sp, sp, #0xfffffff8\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	cmp	r0, #0x4\n"
        "	bhi	._37	@cond_branch\n"
        "	lsl	r0, r0, #0x2\n"
        "	ldr	r1, ._23\n"
        "	add	r0, r0, r1\n"
        "	ldr	r0, [r0]\n"
        "	mov	pc, r0\n"
        "._24:\n"
        "	.align	2, 0\n"
        "._23:\n"
        "	.word	._22\n"
        "._22:\n"
        "	.word	._25\n"
        "	.word	._26\n"
        "	.word	._27\n"
        "	.word	._28\n"
        "	.word	._29\n"
        "._25:\n"
        "	bl	sub_80F7A34\n"
        "	b	._37\n"
        "._26:\n"
        "	mov	r2, #0x0\n"
        "	ldr	r3, ._34\n"
        "._31:\n"
        "	mov	r0, sp\n"
        "	add	r1, r0, r2\n"
        "	add	r0, r2, r3\n"
        "	ldrb	r0, [r0]\n"
        "	strb	r0, [r1]\n"
        "	add	r0, r2, #1\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r2, r0, #0x18\n"
        "	cmp	r2, #0x7\n"
        "	bls	._31	@cond_branch\n"
        "	bl	sub_80F7A6C\n"
        "	mov	r2, #0x0\n"
        "	ldr	r3, ._34\n"
        "._32:\n"
        "	add	r1, r2, r3\n"
        "	mov	r4, sp\n"
        "	add	r0, r4, r2\n"
        "	ldrb	r0, [r0]\n"
        "	strb	r0, [r1]\n"
        "	add	r0, r2, #1\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r2, r0, #0x18\n"
        "	cmp	r2, #0x7\n"
        "	bls	._32	@cond_branch\n"
        "	b	._37\n"
        "._35:\n"
        "	.align	2, 0\n"
        "._34:\n"
        "	.word	gSaveBlock1+0x2d8c\n"
        "._27:\n"
        "	bl	sub_80F7A98\n"
        "	b	._37\n"
        "._28:\n"
        "	bl	sub_80F7A7C\n"
        "	b	._37\n"
        "._29:\n"
        "	bl	sub_80F7A88\n"
        "._37:\n"
        "	bl	sub_80F83D0\n"
        "	add	sp, sp, #0x8\n"
        "	pop	{r4}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "\n"
    );
}
#endif

u8 GetCurrentMauvilleOldMan(void)
{
    OldMan *oldMan = &gSaveBlock1.oldMan;

    return oldMan->oldMan1.unk_2D94;
}

void sub_80F7B14(void)
{
    gScriptResult = GetCurrentMauvilleOldMan();
}

void sub_80F7B2C(void)
{
    u16 *scriptPtr = &gScriptResult; // why??
    OldMan *oldMan = &gSaveBlock1.oldMan;

    *scriptPtr = oldMan->oldMan1.unk_2DBD;
}

void sub_80F7B40(void)
{
    u16 i;
    OldMan *oldMan = &gSaveBlock1.oldMan;
    //struct UnkMauvilleOldManStruct *oldManStruct = &gSaveBlock1.oldManStruct;

    StringCopy(oldMan->oldMan1.playerName, gSaveBlock2.playerName);

    for(i = 0; i < 4; i++)
        oldMan->oldMan1.playerTrainerId[i] = gSaveBlock2.playerTrainerId[i];

    for(i = 0; i < 6; i++)
        oldMan->oldMan1.mauvilleOldMan_ecArray[i] = oldMan->oldMan1.mauvilleOldMan_ecArray2[i];

    oldMan->oldMan1.unk_2DBD = 1;
}

void sub_80F7BA0(void)
{
    struct UnkMauvilleOldManStruct *oldMan = &gSaveBlock1.oldMan.oldMan1;
    u16 specialVar = gSpecialVar_0x8004;  // It's a bit odd to use this temp variable, but it seems needed to match.
    u16 *r5;
    u16 i;
    u8 *ptr;
    u8 *r4;

    r5 = oldMan->mauvilleOldMan_ecArray2;
    if (specialVar == 0)
        r5 = oldMan->mauvilleOldMan_ecArray;
    ptr = gStringVar4;
    r4 = ptr;
    for (i = 0; i < 2; i++)
    {
        ptr = sub_80EB3FC(ptr, *(r5++));
        while (ptr != r4)
        {
            if (*r4 == 0)
                *r4 = 0x37;
            r4++;
        }
        r4++;
        *(ptr++) = 0;
        ptr = sub_80EB3FC(ptr, *(r5++));
        while (ptr != r4)
        {
            if (*r4 == 0)
                *r4 = 0x37;
            r4++;
        }
        r4++;
        *(ptr++) = 0xFE;
        ptr = sub_80EB3FC(ptr, *(r5++));
        while (ptr != r4)
        {
            if (*r4 == 0)
                *r4 = 0x37;
            r4++;
        }
        //_080F7C2A
        if (i == 0)
        {
            *(ptr++) = EXT_CTRL_CODE_BEGIN;
            *(ptr++) = 0xF;
        }
    }
}

void sub_80F7C54(void)
{
    sub_80F7F80(gSpecialVar_0x8004);
    MenuDisplayMessageBox();
    ScriptContext1_Stop();
}

void sub_80F7C70(void)
{
    u16 *scriptPtr = &gScriptResult; // again??
    OldMan *oldMan = &gSaveBlock1.oldMan;

    *scriptPtr = oldMan->oldMan1.unk_2D95;
}

void sub_80F7C84(void)
{
    OldMan *oldMan = &gSaveBlock1.oldMan;

    oldMan->oldMan1.unk_2D95 = 1;
}

void sub_80F7C90(void)
{
    u16 var = sub_80EB8EC();

    if(var == 0xFFFF)
    {
        gScriptResult = FALSE;
    }
    else
    {
        sub_80EB3FC(gStringVar1, var);
        gScriptResult = TRUE;
    }
}

void sub_80F7CC8(void)
{
    OldMan *oldMan = &gSaveBlock1.oldMan;

    if(oldMan->oldMan1.unk_2D95 == 10)
    {
        gScriptResult = FALSE;
        oldMan->oldMan1.unk_2D95 = 0;
    }
    else
        gScriptResult = TRUE;
}

void sub_80F7CF4(void)
{
    struct UnkMauvilleOldManStruct2 *oldMan = &gSaveBlock1.oldMan.oldMan2;

    if(oldMan->unk1 == 0)
        sub_80F7DC0();

    if(oldMan->mauvilleOldMan_ecArray[oldMan->unk1] != 0xFFFF) // is not the last element of the array?
    {
        u8 *stringPtr;
        u32 random = Random();

        random %= 8;
        stringPtr = sub_80EB3FC(gStringVar4, oldMan->mauvilleOldMan_ecArray[oldMan->unk1]);
        stringPtr = StringCopy(stringPtr, gOtherText_Is);
        stringPtr = StringCopy(stringPtr, (u8 *)gUnknown_083E5388[random]);
        StringCopy(stringPtr, gOtherText_DontYouAgree);
    }
    else
    {
        StringCopy(gStringVar4, (u8 *)gUnknown_083E53A8[oldMan->mauvilleOldMan_ecArray2[oldMan->unk2++]]);
    }
    if(!(Random() % 10))
        oldMan->unk1 = 10;
    else
        oldMan->unk1++;

    gScriptResult = TRUE;
}
