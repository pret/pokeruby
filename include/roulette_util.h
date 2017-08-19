#ifndef ROULETTE_UTIL_H
#define ROULETTE_UTIL_H

struct UnkStruct1
{
	u16 val0;
	u16 val1;
	u8 val2;
	u8 val3;
	u8 val4;
	s8 field0:5;
	s8 field1:2;
	s8 field2:1;
};

struct UnkStruct3
{
	u8 field0:7;
	u8 field1:1;
	u8 val1;
	s8 val2;
	s8 val3;
	u16 val4;
	u16 val5;
	u8 val6;
	u8 val7;
	u8 val8;
	s8 field2:5;
	s8 field3:2;
	s8 field4:1;
};

struct UnkStruct0
{
	u8 val0;
	u8 val1; //unused ?
	u16 val2; //flag for each UnkStruct3
	struct UnkStruct3 val3[0x10];
};


void sub_8124918(struct UnkStruct0 *);
u8 sub_812492C(struct UnkStruct0 *, u8, struct UnkStruct1 *);
u8 unref_sub_81249B0(struct UnkStruct0 *, u8);
void task_tutorial_controls_fadein(struct UnkStruct0 *);
void sub_8124CE8(struct UnkStruct0 *, u16);
void sub_8124D3C(struct UnkStruct0 *, u16);
void sub_8124DDC(u16 *, u16, u8, u8, u8, u8);
void sub_8124E2C(u16 *, u16 *, u8, u8, u8, u8);

#endif
