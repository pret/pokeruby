#ifndef GUARD_SAVE_H
#define GUARD_SAVE_H

#include "gba/types.h"

struct SaveSectionLocation
{
	void *data;
	u16 size;
};

struct SaveSection
{
	u8 data[0xFF4];
	u16 id;
	u16 checksum;
	u32 unknown;
	u32 counter;
};

struct UnkSaveSection
{
	u8 data[0xFF4];
	u32 unknown;
};

void ClearSaveData(void);
void sub_81251B8(void);
bool32 sub_81251D4(u8 op, u8 bit);
u8 save_write_to_flash(u16 a1, struct SaveSectionLocation *a2);
u8 sub_81252D8(u16, struct SaveSectionLocation *);
u8 sub_81253C8(u8 sector, u8 *data, u16 size);
u8 sub_8125440(u8, u8 *);
u32 sub_812546C(struct SaveSectionLocation *a1);
u32 sub_81254C8(struct SaveSectionLocation *a1);
u8 sub_812550C(u16 a1, struct SaveSectionLocation *a2);
u8 sub_812556C(u16 a1, struct SaveSectionLocation *a2);
u8 sub_81255B8(u16, struct SaveSectionLocation *);
u8 sub_8125758(u16 a1, struct SaveSectionLocation *a2);
u8 sub_81257F0(u16 a1, struct SaveSectionLocation *a2);
u8 sub_812587C(u16 a1, struct SaveSectionLocation *a2);
u8 sub_81258BC(u16, struct SaveSectionLocation *);
u8 sub_8125974(struct SaveSectionLocation *);
u8 sub_8125B88(u8 a1, u8 *data, u16 size);
u8 sub_8125BF8(u8, struct SaveSection *);
u16 sub_8125C10(void *, u16);
u8 sub_8125C3C(u8 a1);
u8 sub_8125D44(u8 a1);
u8 sub_8125D80(void);
bool8 sub_8125DA8(void);
u8 sub_8125DDC(void);
u8 sub_8125E04(void);
u8 sub_8125E2C(void);
u8 sub_8125E6C(void);
u8 sub_8125EC8(u8 a1);
bool8 unref_sub_8125F4C(struct UnkSaveSection *a1);
u8 unref_sub_8125FA0(void);
u8 unref_sub_8125FF0(u8 *data, u16 size);
u8 unref_sub_8126068(u8 sector, u8 *data, u32 size);
u8 unref_sub_8126080(u8 sector, u8 *data);

#endif // GUARD_SAVE_H
