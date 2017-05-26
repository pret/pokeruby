#ifndef GUARD_MENU_HELPERS_H
#define GUARD_MENU_HELPERS_H

#include "task.h"

struct YesNoFuncTable
{
    void (*yesFunc)(u8);
    void (*noFunc)(u8);
};

void sub_80F914C(u8, const struct YesNoFuncTable *);
void DisplayItemMessageOnField(u8, const u8 *, TaskFunc, u16);
bool8 sub_80F9344(void);
u8 sub_80F9344(void);
void sub_80F9368(void);
void sub_80F9438(void);
void sub_80F944C(void);
void CreateVerticalScrollIndicators(u32, u32, u32); // unknown args
void sub_80F979C(u32, u32); // unknown args
void DestroyVerticalScrollIndicator(u8);
void BuyMenuFreeMemory(void);
void sub_80F98DC(int);
void sub_80F996C(u8);

#endif // GUARD_MENU_HELPERS_H
