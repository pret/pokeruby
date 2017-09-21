#ifndef GUARD_MONEY_H
#define GUARD_MONEY_H

bool8 IsEnoughMoney(u32, u32);
void AddMoney(u32 *, u32);
void RemoveMoney(u32 *, u32);
void GetMoneyAmountText(u8 *buffer, u32 arg1, u8 arg2);
void PrintMoneyAmount(u32 arg0, u8 arg1, u8 x, u8 y);
void sub_80B7AEC(u32, u8 left, u8 top);
void sub_80B7B34(u8, u8, int);
void UpdateMoneyWindow(u32, u8, u8);
void OpenMoneyWindow(u32, u8, u8);
void CloseMoneyWindow(u8, u8);
bool8 sub_80B7CE8(void);
void sub_80B7D0C(void);

#endif // GUARD_MONEY_H
