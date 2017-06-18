#ifndef GUARD_REGION_MAP_H
#define GUARD_REGION_MAP_H

void sub_80FA8EC(u32, u8);
void sub_80FAB10(void);
u8 sub_80FAB60(void);
void sub_80FBB3C(u16, u16);
void sub_80FBCF0(u32, u8);
void sub_80FBFB4(u8 *str, u8 region, u8);
void CopyMapName();
u8 *CopyLocationName(u8 *dest, u8 location);

#endif // GUARD_REGION_MAP_H
