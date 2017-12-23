#ifndef GUARD_BATTLEANIM_H
#define GUARD_BATTLEANIM_H

#include "sprite.h"

#define REG_BGnCNT_BITFIELD(n) (*(vBgCnt *)REG_ADDR_BG##n##CNT)
#define REG_BG0CNT_BITFIELD REG_BGnCNT_BITFIELD(0)
#define REG_BG1CNT_BITFIELD REG_BGnCNT_BITFIELD(1)
#define REG_BG2CNT_BITFIELD REG_BGnCNT_BITFIELD(2)
#define REG_BG3CNT_BITFIELD REG_BGnCNT_BITFIELD(3)

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

extern void (*gAnimScriptCallback)(void);
extern u8 gAnimScriptActive;
extern u8 gHappinessMoveAnim;
extern u8 gUnknown_0202F7C4;

void ExecuteMoveAnim(u16 move);
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
