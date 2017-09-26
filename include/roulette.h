#ifndef GUARD_ROULETTE_H
#define GUARD_ROULETTE_H

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
	u8 val1;
	u16 val2; //flag for each UnkStruct3
	struct UnkStruct3 val3[0x10];
};

#endif
