#ifndef GUARD_BATTLEANIM_H
#define GUARD_BATTLEANIM_H

#include "constants/battle_anim.h"

#include "sprite.h"

// battle_anim_status_effects.c
#define STAT_ANIM_PLUS1  15
#define STAT_ANIM_PLUS2  39
#define STAT_ANIM_MINUS1 22
#define STAT_ANIM_MINUS2 46
#define STAT_ANIM_MULTIPLE_PLUS1 55
#define STAT_ANIM_MULTIPLE_PLUS2 56
#define STAT_ANIM_MULTIPLE_MINUS1 57
#define STAT_ANIM_MULTIPLE_MINUS2 58

#define REG_BGnCNT_BITFIELD(n) (*(vBgCnt *)REG_ADDR_BG##n##CNT)
#define REG_BG0CNT_BITFIELD REG_BGnCNT_BITFIELD(0)
#define REG_BG1CNT_BITFIELD REG_BGnCNT_BITFIELD(1)
#define REG_BG2CNT_BITFIELD REG_BGnCNT_BITFIELD(2)
#define REG_BG3CNT_BITFIELD REG_BGnCNT_BITFIELD(3)

enum
{
    BATTLER_COORD_X,
    BATTLER_COORD_Y,
    BATTLER_COORD_X_2,
    BATTLER_COORD_Y_PIC_OFFSET,
    BATTLER_COORD_Y_PIC_OFFSET_DEFAULT,
};

enum
{
    BATTLER_COORD_ATTR_HEIGHT,
    BATTLER_COORD_ATTR_WIDTH,
    BATTLER_COORD_ATTR_TOP,
    BATTLER_COORD_ATTR_BOTTOM,
    BATTLER_COORD_ATTR_LEFT,
    BATTLER_COORD_ATTR_RIGHT,
    BATTLER_COORD_ATTR_RAW_BOTTOM,
};

struct ContestMoveAnim
{
    u16 species;
    u16 targetSpecies;
    bool8 hasTargetAnim:1;
    u8 contestant;
    u32 personality;
    u32 otId;
    u32 targetPersonality;
};

extern void (*gAnimScriptCallback)(void);
extern u8 gAnimScriptActive;
extern u8 gAnimFriendship;
extern u8 gAnimMoveTurn;
extern struct DisableStruct *gAnimDisableStructPtr;

extern const struct OamData gOamData_837DF24;
extern const struct OamData gOamData_837DF2C;
extern const struct OamData gOamData_837DF34;
extern const struct OamData gOamData_837DF3C;
extern const struct OamData gOamData_837DF44;
extern const struct OamData gOamData_837DF4C;
extern const struct OamData gOamData_837DF54;
extern const struct OamData gOamData_837DF5C;
extern const struct OamData gOamData_837DF64;
extern const struct OamData gOamData_837DF6C;
extern const struct OamData gOamData_837DF74;
extern const struct OamData gOamData_837DF7C;
extern const struct OamData gOamData_837DF84;
extern const struct OamData gOamData_837DF8C;
extern const struct OamData gOamData_837DF94;
extern const struct OamData gOamData_837DF9C;
extern const struct OamData gOamData_837DFA4;
extern const struct OamData gOamData_837DFAC;
extern const struct OamData gOamData_837DFB4;
extern const struct OamData gOamData_837DFBC;
extern const struct OamData gOamData_837DFC4;
extern const struct OamData gOamData_837DFCC;
extern const struct OamData gOamData_837DFD4;
extern const struct OamData gOamData_837DFDC;
extern const struct OamData gOamData_837DFE4;
extern const struct OamData gOamData_837DFEC;
extern const struct OamData gOamData_837DFF4;
extern const struct OamData gOamData_837DFFC;
extern const struct OamData gOamData_837D004;
extern const struct OamData gOamData_837D00C;
extern const struct OamData gOamData_837E014;
extern const struct OamData gOamData_837E01C;
extern const struct OamData gOamData_837E024;
extern const struct OamData gOamData_837E02C;
extern const struct OamData gOamData_837E034;
extern const struct OamData gOamData_837E03C;
extern const struct OamData gOamData_837E044;
extern const struct OamData gOamData_837E04C;
extern const struct OamData gOamData_837E054;
extern const struct OamData gOamData_837E05C;
extern const struct OamData gOamData_837E064;
extern const struct OamData gOamData_837E06C;
extern const struct OamData gOamData_837E074;
extern const struct OamData gOamData_837E07C;
extern const struct OamData gOamData_837E084;
extern const struct OamData gOamData_837E08C;
extern const struct OamData gOamData_837E094;
extern const struct OamData gOamData_837E09C;
extern const struct OamData gOamData_837E0A4;
extern const struct OamData gOamData_837E0AC;
extern const struct OamData gOamData_837E0B4;
extern const struct OamData gOamData_837E0BC;
extern const struct OamData gOamData_837E0C4;
extern const struct OamData gOamData_837E0CC;
extern const struct OamData gOamData_837E0D4;
extern const struct OamData gOamData_837E0DC;
extern const struct OamData gOamData_837E0E4;
extern const struct OamData gOamData_837E0EC;
extern const struct OamData gOamData_837E0F4;
extern const struct OamData gOamData_837E0FC;
extern const struct OamData gOamData_837E104;
extern const struct OamData gOamData_837E10C;
extern const struct OamData gOamData_837E114;
extern const struct OamData gOamData_837E11C;
extern const struct OamData gOamData_837E124;
extern const struct OamData gOamData_837E12C;
extern const struct OamData gOamData_837E134;
extern const struct OamData gOamData_837E13C;
extern const struct OamData gOamData_837E144;
extern const struct OamData gOamData_837E14C;
extern const struct OamData gOamData_837E154;
extern const struct OamData gOamData_837E15C;

void DoMoveAnim(u16 move);
void LaunchBattleAnimation(const u8 *const moveAnims[], u16 b, u8 c);
bool8 IsAnimBankSpriteVisible(u8 a);
void MoveBattlerSpriteToBG(u8, u8);
bool8 IsContest(void);
void ClearBattleAnimationVars(void);
void DestroyAnimSprite(struct Sprite *sprite);
void DestroyAnimVisualTask(u8 task);
void DestroyAnimVisualTask(u8 task);
bool8 IsAnimBankSpriteVisible(u8);
s8 BattleAnimAdjustPanning(s8 a);
void sub_80763FC(u16 a, u16 *b, u32 c, u8 d);
s16 CalculatePanIncrement(s16 sourcePan, s16 targetPan, s16 incrementPan);
s16 sub_8077104(s16 newPan, int oldPan);
void DestroyAnimSoundTask(u8 taskId);
void sub_8076464(u8 a);
s8 BattleAnimAdjustPanning2(s8);

#endif
