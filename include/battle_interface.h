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

u8 battle_make_oam_normal_battle(u8);
u8 battle_make_oam_safari_battle(void);
void sub_8043D84(u8, u8, u32, u32, u32);
void sub_8043DB0(u8);
void sub_8043DFC(u8);
void nullsub_11();
void UpdateOamPriorityInAllHealthboxes(u8);
void sub_8043F44(u8);
void SwapHpBarsWithHpText(void);
u8 CreatePartyStatusSummarySprites(u8, const struct HpAndStatus *, u8, u8);
void sub_8044CA0(u8);
void sub_8045A5C(u8, struct Pokemon *, u8);
s32 sub_8045C78(u8, u8, u8, u8);
s16 sub_80460C8(struct BattleInterfaceStruct1 *, int *, u16 *, int);
u8 GetScaledHPFraction(s16, s16, u8);
u8 GetHPBarLevel(s16, s16);
void sub_80440EC(u8 a, s16 b, u8 c);

#endif  // GUARD_BATTLE_INTERFACE_H
