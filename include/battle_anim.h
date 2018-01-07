#ifndef GUARD_BATTLEANIM_H
#define GUARD_BATTLEANIM_H

#include "sprite.h"

#define REG_BGnCNT_BITFIELD(n) (*(vBgCnt *)REG_ADDR_BG##n##CNT)
#define REG_BG0CNT_BITFIELD REG_BGnCNT_BITFIELD(0)
#define REG_BG1CNT_BITFIELD REG_BGnCNT_BITFIELD(1)
#define REG_BG2CNT_BITFIELD REG_BGnCNT_BITFIELD(2)
#define REG_BG3CNT_BITFIELD REG_BGnCNT_BITFIELD(3)

enum
{
    ANIM_BANK_ATTACKER,
    ANIM_BANK_TARGET,
    ANIM_BANK_ATK_PARTNER,
    ANIM_BANK_DEF_PARTNER,
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

extern void (*gAnimScriptCallback)(void);
extern u8 gAnimScriptActive;
extern u8 gAnimFriendship;
extern u8 gAnimMoveTurn;
extern struct DisableStruct *gAnimDisableStructPtr;

void DoMoveAnim(u16 move);
void LaunchBattleAnimation(const u8 *const moveAnims[], u16 b, u8 c);
bool8 IsAnimBankSpriteVisible(u8 a);
void sub_8076034(u8, u8);
bool8 IsContest(void);
void ClearBattleAnimationVars(void);
void DestroyAnimSprite(struct Sprite *sprite);
void DestroyAnimVisualTask(u8 task);
void DestroyAnimVisualTask(u8 task);
bool8 IsAnimBankSpriteVisible(u8);
s8 BattleAnimAdjustPanning(s8 a);
void sub_80763FC(u16 a, u16 *b, u32 c, u8 d);
s16 CalculatePanIncrement(s16 sourcePan, s16 targetPan, s16 incrementPan);
s16 sub_8077104(s16 a);

#endif
