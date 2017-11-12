#ifndef GUARD_BATTLEANIM_H
#define GUARD_BATTLEANIM_H

#include "sprite.h"

#define REG_BGnCNT_BITFIELD(n) (*(struct BGCntrlBitfield *)REG_ADDR_BG##n##CNT)
#define REG_BG1CNT_BITFIELD REG_BGnCNT_BITFIELD(1)
#define REG_BG2CNT_BITFIELD REG_BGnCNT_BITFIELD(2)

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

void DoMoveAnim(const u8 *const moveAnims[], u16 b, u8 c);
bool8 IsAnimBankSpriteVisible(u8 a);
void sub_8076034(u8, u8);
bool8 NotInBattle(void);
void battle_anim_clear_some_data(void);
void move_anim_8072740(struct Sprite *sprite);
void DestroyAnimVisualTask(u8 task);
void DestroyAnimVisualTask(u8 task);
bool8 IsAnimBankSpriteVisible(u8);
s8 sub_8076F98(s8 a);
void sub_80763FC(u16 a, u16 *b, u32 c, u8 d);

#endif
