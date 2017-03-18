#ifndef GUARD_BATTLEANIM_H
#define GUARD_BATTLEANIM_H

#define SCRIPT_READ_8(ptr)  ((ptr)[0])
#define SCRIPT_READ_16(ptr) ((ptr)[0] | ((ptr)[1] << 8))
#define SCRIPT_READ_32(ptr) ((ptr)[0] + ((ptr)[1] << 8) + ((ptr)[2] << 16) + ((ptr)[3] << 24))

#define REG_BGnCNT_BITFIELD(n) (*(struct BGCntrlBitfield *)REG_ADDR_BG##n##CNT)
#define REG_BG1CNT_BITFIELD REG_BGnCNT_BITFIELD(1)
#define REG_BG2CNT_BITFIELD REG_BGnCNT_BITFIELD(2)

#define EWRAM_14800 ((u16 *)(unk_2000000 + 0x14800))
#define EWRAM_17800 ((struct UnknownStruct1 *)(unk_2000000 + 0x17800))
#define EWRAM_17810 ((struct UnknownStruct3 *)(unk_2000000 + 0x17810))
#define EWRAM_18000 ((u16 *)(unk_2000000 + 0x18000))
#define EWRAM_19348 (*(u16 *)(unk_2000000 + 0x19348))

struct BGCntrlBitfield
{
    volatile u16 priority:2;
    volatile u16 charBaseBlock:2;
    volatile u16 field_0_2:4;
    volatile u16 field_1_0:5;
    volatile u16 areaOverflowMode:1;
    volatile u16 screenSize:2;
};

struct BattleAnimBackground
{
    void *image;
    void *palette;
    void *tilemap;
};

struct UnknownStruct1
{
    u8 unk0;
};

struct UnknownStruct2
{
    void *unk0;
    u16 *unk4;
    u8 unk8;
};

struct UnknownStruct3
{
    u8 unk0;
    u8 filler1[0xB];
};

void move_something(const u8 *const moveAnims[], u16 b, u8 c);
bool8 b_side_obj__get_some_boolean(u8 a);
void sub_8076034(u8, u8);
bool8 sub_8076BE0(void);

#endif
