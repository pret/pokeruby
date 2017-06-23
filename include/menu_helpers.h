#ifndef GUARD_MENU_HELPERS_H
#define GUARD_MENU_HELPERS_H

#include "task.h"

struct YesNoFuncTable
{
    void (*yesFunc)(u8);
    void (*noFunc)(u8);
};

void DisplayItemMessageOnField(u8, const u8 *, TaskFunc, u16);
void DoYesNoFuncWithChoice(u8, const struct YesNoFuncTable *);
bool8 sub_80F9344(void);
void sub_80F9368(void);
void sub_80F9438(void);
void sub_80F944C(void);
void sub_80F9480(u8 *, u8);
void sub_80F94A4(u8, u8 *, u8, s16);
void sub_80F94F8(u8 *);
void sub_80F9520(u8 *, u8);
void CreateVerticalScrollIndicators(u8, u8, u8);
void sub_80F979C(u8, u8);
void DestroyVerticalScrollIndicator(u8);
void LoadScrollIndicatorPalette(void);
void BuyMenuFreeMemory(void);

#endif // GUARD_MENU_HELPERS_H
