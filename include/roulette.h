#ifndef GUARD_ROULETTE_H
#define GUARD_ROULETTE_H

#include "task.h"

struct UnkStruct1
{
	u16 var00;
	u16 var02;
	u8 var04;
	u8 var05;
	u8 var06;
	s8 var07_0:5;
	s8 var07_5:2;
	s8 var07_7:1;
};

struct UnkStruct3
{
	u8 var00_0:7;
	u8 var00_7:1;
	u8 var01;
	s8 var02;
	s8 var03;
    struct UnkStruct1 var04;
};

struct UnkStruct0
{
	u8 var00;
	u8 var01;
	u16 var02; //flag for each UnkStruct3
	struct UnkStruct3 var04[0x10];
};

struct Roulette /* ewram + 0x19000 */
{
    u8 var00;
    u8 var01;
    u8 var02;
    u8 var03_0:5;
    u8 var03_5:1;
    u8 var03_6:1;
    u8 var03_7:1;
    u8 var04_0:2;
    u8 var04_2:5;
    u8 var04_7:1;
    u32 var08;
    u8 var0C[0x6];
    u8 var12[0x4];
    u8 var16[0x3];
    u8 var19;
    u8 var1A_0:4;
    u8 var1A_4:4;
    u8 var1B[0x6];
    u8 var21;
    u8 var22;
    u8 var23;
    s16 var24;
    s16 var26;
    s16 var28;
    s16 var2A;
    struct OamMatrix var2C;
    u16 var34;
    struct Sprite *var38;
    u8 var3C[0x40]; // Sprite IDs
    u8 var7C;
    u8 var7D;
    u8 var7E;
    u8 var7F;
    s16 var80;
    s16 var82;
    s16 var84;
    s16 var86;
    float var88;
    float var8C;
    float var90;
    float var94;
    float var98;
    float var9C;
    float varA0;
    u8 varA4;
    u8 varA5;
    u8 v51[0x2];
    u16 varA8;
    u16 varAA;
    TaskFunc varAC;
    u8 v46[0x4];
    TaskFunc varB4;
    struct UnkStruct0 varB8;
};

struct StructgUnknown_083F8DF4
{
    u8 var00;
    u8 var01;
    u8 var02;
    u8 var03;
    u8 var04;
    u8 v[0x3];
    u16 var08;
    u16 var0A;
    u16 var0C;
    u16 v13[0x1];
    u16 var10;
    u16 var12;
    u16 var14;
    u8 v1[0x2];
    u16 var18;
    u16 var1A;
    float var1C;
};

struct StructgUnknown_083F8C00
{
    u8 var00;
    u8 var01_0:4;
    u8 var01_4:4;
    u8 var02;
    u8 var03;
    u8 var04;
    u8 var05;
    u8 var06;
    u8 var07;
    u32 var08;
    u32 var0C;
    u16 var10;
    u16 var12;
};

struct StructgUnknown_083F8D90
{
    u8 var00;
    u8 var01;
    u8 var02;
    u32 var04;
};

extern const struct StructgUnknown_083F8C00 gUnknown_083F8C00[];
extern const struct StructgUnknown_083F8D90 gUnknown_083F8D90[];
extern const struct StructgUnknown_083F8DF4 gUnknown_083F8DF4[];

s16 sub_81174C4(s16, s16);
s16 sub_81174E0(s16);
void PlayRoulette(void);

void sub_8117838(u8);
u8 sub_8117890(const struct SpriteTemplate *, u8, u16 *);
void sub_8117900(void);
void unref_sub_8117A74(void);
void sub_8117AA8(u8, u8);
void sub_8117BBC(void);
void sub_8117C60(u8, u8);
void sub_8117D68(u8);
void sub_8117DF4(void);
void sub_8117E98(struct Sprite *);
void sub_8117F2C(void);
void sub_81180F4(u16);
u8 sub_81181E8(u8);
void sub_811829C(u8);
void sub_81182F8(u8);
void sub_81184CC(struct Sprite *);
void sub_81184D8(void);
void sub_8118554(struct Sprite *);
void sub_811857C(void);
void sub_81185E8(void);
void sub_81191F4(struct Sprite *);

#endif
