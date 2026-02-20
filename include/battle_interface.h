#ifndef GUARD_BATTLE_INTERFACE_H
#define GUARD_BATTLE_INTERFACE_H

#include "battle_controllers.h"  // for struct HpAndStatus

struct BattleInterfaceStruct1
{
    s32 unk0;
    s32 unk4;
    s32 unk8;
    u32 unkC_0:5;
    u32 unk10;
};

enum
{
    HP_CURRENT,
    HP_MAX
};

enum
{
    HEALTH_BAR,
    EXP_BAR
};

enum
{
    HEALTHBOX_ALL,
    HEALTHBOX_CURRENT_HP,
    HEALTHBOX_MAX_HP,
    HEALTHBOX_LEVEL,
    HEALTHBOX_NICK,
    HEALTHBOX_HEALTH_BAR,
    HEALTHBOX_EXP_BAR,
    HEALTHBOX_UNUSED_7,
    HEALTHBOX_UNUSED_8,
    HEALTHBOX_STATUS_ICON,
    HEALTHBOX_SAFARI_ALL_TEXT,
    HEALTHBOX_SAFARI_BALLS_TEXT
};

u8 battle_make_oam_normal_battle(u8);
u8 battle_make_oam_safari_battle(void);
void SetBattleBarStruct(u8, u8, u32, u32, u32);
void SetHealthboxSpriteInvisible(u8);
void SetHealthboxSpriteVisible(u8);
void nullsub_11();
void UpdateOamPriorityInAllHealthboxes(u8);
void sub_8043F44(u8);
void sub_804454C(void);
u8 CreatePartyStatusSummarySprites(u8, const struct HpAndStatus *, u8, u8);
void sub_8044CA0(u8);
void UpdateHealthboxAttribute(u8, struct Pokemon *, u8);
s32 MoveBattleBar(u8, u8, u8, u8);
s16 sub_80460C8(struct BattleInterfaceStruct1 *, int *, u16 *, int);
u8 GetScaledHPFraction(s16, s16, u8);
u8 GetHPBarLevel(s16, s16);
void UpdateHpTextInHealthbox(u8 a, s16 b, u8 c);

#endif  // GUARD_BATTLE_INTERFACE_H
