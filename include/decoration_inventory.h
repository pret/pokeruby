#ifndef GUARD_DECORATION_INVENTORY_H
#define GUARD_DECORATION_INVENTORY_H

void ClearDecorationInventories(void);
s8 FindFreeDecorationInventorySlot(u8);
u8 InventoryContainsDecoration(u8);
u8 GiveDecoration(u8);
u8 CheckDecorationInventoryHasSpace(u8);
s8 RemoveDecorationFromInventory(u8);
void SortDecorationInventory(u8);
u8 GetNumDecorationsInInventoryCategory(u8);
bool8 GetNumDecorationsInInventory(void);
#if DEBUG
void Debug_GiveAllDecorations(void);
#endif // DEBUG

#endif // GUARD_DECORATION_INVENTORY_H
