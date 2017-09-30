
#ifndef GUARD_TRADE_H
#define GUARD_TRADE_H

struct SomeTradeStruct
{
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    struct Window field_4;
    u8 field_34;
};

extern struct SomeTradeStruct* gUnknown_03004828;

const u8 gOtherText_MaleSymbol3[1];
const u8 gOtherText_FemaleSymbol3[1];
const u8 gOtherText_GenderlessSymbol[1];

void sub_804E22C(void);

#endif // GUARD_TRADE_H
