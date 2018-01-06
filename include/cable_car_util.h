#ifndef GUARD_CABLE_CAR_UTIL_H
#define GUARD_CABLE_CAR_UTIL_H

// Exported type declarations

// Exported RAM declarations

// Exported ROM declarations

void CableCarUtil_FillWrapped(void *dest, u16 value, u8 x, u8 y, u8 width, u8 height);
void CableCarUtil_CopyWrapped(void *dest, const u16 *src, u8 x, u8 y, u8 width, u8 height);

#endif //GUARD_CABLE_CAR_UTIL_H
