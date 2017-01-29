#include "global.h"
#include "string_util.h"

extern u16 gScriptResult;

extern void sub_80F83F8(void);
extern void sub_81099CC(void);
extern void sub_80F83D0(void);

extern u16 gUnknown_083E537C[];

void sub_80F7A34(void)
{
    u16 i;
    struct UnkMauvilleOldManStruct *oldManStruct = &gSaveBlock1.oldManStruct;

    oldManStruct->unk_2D94 = 0;
    oldManStruct->unk_2DBD = 0;
    
    for(i = 0; i < 6; i++)
        oldManStruct->mauvilleOldMan_ecArray[i] = gUnknown_083E537C[i];
}

void sub_80F7A6C(void)
{
    struct UnkMauvilleOldManStruct *oldManStruct = &gSaveBlock1.oldManStruct;
    
    oldManStruct->unk_2D94 = 1;
    oldManStruct->unk_2D95 = 0;
}

void sub_80F7A7C(void)
{
    sub_80F83F8();
}

void sub_80F7A88(void)
{
    struct UnkMauvilleOldManStruct *oldManStruct = &gSaveBlock1.oldManStruct;
    
    oldManStruct->unk_2D94 = 4;
    oldManStruct->unk_2D95 = 0;
}

void sub_80F7A98(void)
{
    sub_81099CC();
}

void sub_80F7AA4(void)
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

u8 GetCurrentMauvilleOldMan(void)
{
    struct UnkMauvilleOldManStruct *oldManStruct = &gSaveBlock1.oldManStruct;

    return oldManStruct->unk_2D94;
}

void sub_80F7B14(void)
{
    gScriptResult = GetCurrentMauvilleOldMan();
}

void sub_80F7B2C(void)
{
    u16 *scriptPtr = &gScriptResult; // why??
    struct UnkMauvilleOldManStruct *oldManStruct = &gSaveBlock1.oldManStruct;
    
    *scriptPtr = oldManStruct->unk_2DBD;
}

void sub_80F7B40(void)
{
    u16 i;
    struct UnkMauvilleOldManStruct *oldManStruct = &gSaveBlock1.oldManStruct;
    
    StringCopy(oldManStruct->playerName, gSaveBlock2.playerName);
    
    for(i = 0; i < 4; i++)
        oldManStruct->playerTrainerId[i] = gSaveBlock2.playerTrainerId[i];
    
    for(i = 0; i < 6; i++)
        oldManStruct->mauvilleOldMan_ecArray[i] = oldManStruct->mauvilleOldMan_ecArray2[i];
    
    oldManStruct->unk_2DBD = 1;
}
