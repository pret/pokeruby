#ifndef GUARD_DECORATION_INVENTORY_H
#define GUARD_DECORATION_INVENTORY_H

void ClearDecorationInventories(void);
s8 sub_8133F9C(u8);
u8 sub_8133FE4(u8);
u8 GiveDecoration(u8);
u8 sub_8134074(u8);
s8 sub_81340A8(u8);
u8 sub_8134194(u8);
#if DEBUG
void Debug_GiveAllDecorations(void);
#endif // DEBUG

#endif // GUARD_DECORATION_INVENTORY_H
