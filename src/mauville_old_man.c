#include "global.h"

extern void sub_80F83F8(void);
extern void sub_81099CC(void);

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
