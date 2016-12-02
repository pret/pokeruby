#ifndef GUARD_COINS_H
#define GUARD_COINS_H

void UpdateCoinsWindow(s32 a, u8 b, u8 c);
void ShowCoinsWindow(u32 a, u8 b, u8 c);
void HideCoinsWindow(u8 a, u8 b);
void PrintCoins(s32 a, u8 b, u8 c, u8 d);
u16 GetCoins(void);
bool8 GiveCoins(u16 coins);
bool8 TakeCoins(u16 coins);

#endif // GUARD_COINS_H
