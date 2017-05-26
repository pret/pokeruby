#include "global.h"
#include "asm.h"
#include "menu.h"
#include "rng.h"
#include "script.h"
#include "string_util.h"
#include "strings.h"

extern u16 gScriptResult;
extern u16 gSpecialVar_0x8004;

extern void sub_80F83F8(void);
extern void sub_81099CC(void);
extern void sub_80F83D0(void);
extern void sub_80F7F80(u8);
extern u16 sub_80EB8EC(void);
extern void sub_80F7DC0(void);
extern u32 gUnknown_083E5388[];
extern u32 gUnknown_083E53A8[];

extern u16 gUnknown_083E537C[];

void sub_80F7A34(void)
{
    u16 i;
    OldMan *oldMan = &gSaveBlock1.oldMan;

    oldMan->oldMan1.unk_2D94 = 0;
    oldMan->oldMan1.unk_2DBD = 0;

    for (i = 0; i < 6; i++)
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

    switch (var)
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

    for (i = 0; i < 4; i++)
        oldMan->oldMan1.playerTrainerId[i] = gSaveBlock2.playerTrainerId[i];

    for (i = 0; i < 6; i++)
        oldMan->oldMan1.mauvilleOldMan_ecArray[i] = oldMan->oldMan1.mauvilleOldMan_ecArray2[i];

    oldMan->oldMan1.unk_2DBD = 1;
}

void sub_80F7BA0(void)
{
    struct UnkMauvilleOldManStruct *oldMan = &gSaveBlock1.oldMan.oldMan1;
    u16 specialVar = gSpecialVar_0x8004; // It's a bit odd to use this temp variable, but it seems needed to match.
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

    if (var == 0xFFFF)
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

    if (oldMan->oldMan1.unk_2D95 == 10)
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

    if (oldMan->unk1 == 0)
        sub_80F7DC0();

    if (oldMan->mauvilleOldMan_ecArray[oldMan->unk1] != 0xFFFF) // is not the last element of the array?
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
    if (!(Random() % 10))
        oldMan->unk1 = 10;
    else
        oldMan->unk1++;

    gScriptResult = TRUE;
}
