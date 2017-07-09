#ifndef GUARD_ITEM_MENU_H
#define GUARD_ITEM_MENU_H

#include "string_util.h"

void sub_80A3684(void);
void ClearBag(void);
void sub_80A3E0C(void);
//void sub_80A3FA0(u16 *, u32, u32, u32, u32, u32);
void sub_80A3FA0(u16 *a, u8 b, u8 c, u8 d, u8 e, u16 f);
void sub_80A4164(u8 *, u16, enum StringConvertMode, u8);
//void sub_80A418C(u16, enum StringConvertMode, int, int, int);
void sub_80A418C(u16 a, enum StringConvertMode b, u8 c, u8 d, u8 e);
void sub_80A53F8(void);
void HandleItemMenuPaletteFade(u8);
void sub_80A5B40(void);
void CleanUpItemMenuMessage(u8);
void CleanUpOverworldMessage(u8);
void ExecuteItemUseFromBlackPalette(void);
void sub_80A5D04(void);
void sub_80A6300(void);
void sub_80A68CC();
void sub_80A6A30(void);
int sub_80A6D1C(void);
void sub_80A6DCC(void);
void sub_80A7094(u8);
u8 sub_80A7D8C(u8 berry, int i, int i1);
void sub_80A7DD4(void);
u8 sub_80A7E5C(u8);

#endif // GUARD_ITEM_MENU_H
