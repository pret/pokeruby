#ifndef GUARD_EVENTOBJMV_H
#define GUARD_EVENTOBJMV_H

#include "sprite.h"

#define GROUND_EFFECT_FLAG_TALL_GRASS_ON_SPAWN   (1 << 0)
#define GROUND_EFFECT_FLAG_TALL_GRASS_ON_MOVE    (1 << 1)
#define GROUND_EFFECT_FLAG_LONG_GRASS_ON_SPAWN   (1 << 2)
#define GROUND_EFFECT_FLAG_LONG_GRASS_ON_MOVE    (1 << 3)
#define GROUND_EFFECT_FLAG_ICE_REFLECTION        (1 << 4)
#define GROUND_EFFECT_FLAG_REFLECTION            (1 << 5)
#define GROUND_EFFECT_FLAG_SHALLOW_FLOWING_WATER (1 << 6)
#define GROUND_EFFECT_FLAG_SAND                  (1 << 7)
#define GROUND_EFFECT_FLAG_DEEP_SAND             (1 << 8)
#define GROUND_EFFECT_FLAG_RIPPLES               (1 << 9)
#define GROUND_EFFECT_FLAG_PUDDLE                (1 << 10)
#define GROUND_EFFECT_FLAG_SAND_PILE             (1 << 11)
#define GROUND_EFFECT_FLAG_LAND_IN_TALL_GRASS    (1 << 12)
#define GROUND_EFFECT_FLAG_LAND_IN_LONG_GRASS    (1 << 13)
#define GROUND_EFFECT_FLAG_LAND_IN_SHALLOW_WATER (1 << 14)
#define GROUND_EFFECT_FLAG_LAND_IN_DEEP_WATER    (1 << 15)
#define GROUND_EFFECT_FLAG_LAND_ON_NORMAL_GROUND (1 << 16)
#define GROUND_EFFECT_FLAG_SHORT_GRASS           (1 << 17)
#define GROUND_EFFECT_FLAG_HOT_SPRINGS           (1 << 18)
#define GROUND_EFFECT_FLAG_SEAWEED               (1 << 19)

extern const u8 gReflectionEffectPaletteMap[];

#define movement_type_def(setup, table) \
static u8 setup##_callback(struct EventObject *, struct Sprite *);\
void setup(struct Sprite *sprite)\
{\
    UpdateEventObjectCurrentMovement(&gEventObjects[sprite->data[0]], sprite, setup##_callback);\
}\
static u8 setup##_callback(struct EventObject *eventObject, struct Sprite *sprite)\
{\
    return table[sprite->data[1]](eventObject, sprite);\
}

#define movement_type_empty_callback(setup) \
static u8 setup##_callback(struct EventObject *, struct Sprite *);\
void setup(struct Sprite *sprite)\
{\
    UpdateEventObjectCurrentMovement(&gEventObjects[sprite->data[0]], sprite, setup##_callback);\
}\
static u8 setup##_callback(struct EventObject *eventObject, struct Sprite *sprite)\
{\
    return 0;\
}

struct ReflectionPaletteSet
{
    u16 mainPaletteTag;
    const u16 *reflectionPaletteTags;
};

extern const u16 gEventObjectPalette19[];

extern const u32 gEventObjectPic_MovingBox[32];
extern const struct SpriteFrameImage gEventObjectPicTable_PechaBerryTree[];

extern const u8 gFieldEffectPic_CutGrass[];
extern const u16 gFieldEffectObjectPalette6[];

void sub_805C058(struct EventObject *eventObject, s16 a, s16 b);
void SetEventObjectDirection(struct EventObject *pObject, u8 unk_18);
void MoveCoords(u8 direction, s16 *x, s16 *y);
void UpdateEventObjectCurrentMovement(struct EventObject *pObject,  struct Sprite *pSprite,  u8 (*d8)(struct EventObject *, struct Sprite *));

u8 GetVectorDirection(s16 a0, s16 a1, s16 a2, s16 a3);
u8 GetLimitedVectorDirection_SouthNorth(s16 a0, s16 a1, s16 a2, s16 a3);
u8 GetLimitedVectorDirection_WestEast(s16 a0, s16 a1, s16 a2, s16 a3);
u8 GetLimitedVectorDirection_WestNorth(s16 a0, s16 a1, s16 a2, s16 a3);
u8 GetLimitedVectorDirection_EastNorth(s16 a0, s16 a1, s16 a2, s16 a3);
u8 GetLimitedVectorDirection_WestSouth(s16 a0, s16 a1, s16 a2, s16 a3);
u8 GetLimitedVectorDirection_EastSouth(s16 a0, s16 a1, s16 a2, s16 a3);
u8 GetLimitedVectorDirection_SouthNorthWest(s16 a0, s16 a1, s16 a2, s16 a3);
u8 GetLimitedVectorDirection_SouthNorthEast(s16 a0, s16 a1, s16 a2, s16 a3);
u8 GetLimitedVectorDirection_NorthWestEast(s16 a0, s16 a1, s16 a2, s16 a3);
u8 GetLimitedVectorDirection_SouthWestEast(s16 a0, s16 a1, s16 a2, s16 a3);

u8 CopyablePlayerMovement_None(struct EventObject *, struct Sprite *, u8, bool8(u8));
u8 CopyablePlayerMovement_FaceDirection(struct EventObject *, struct Sprite *, u8, bool8(u8));
u8 CopyablePlayerMovement_GoSpeed0(struct EventObject *, struct Sprite *, u8, bool8(u8));
u8 CopyablePlayerMovement_GoSpeed1(struct EventObject *, struct Sprite *, u8, bool8(u8));
u8 CopyablePlayerMovement_GoSpeed2(struct EventObject *, struct Sprite *, u8, bool8(u8));
u8 CopyablePlayerMovement_Slide(struct EventObject *, struct Sprite *, u8, bool8(u8));
u8 cph_IM_DIFFERENT(struct EventObject *, struct Sprite *, u8, bool8(u8));
u8 CopyablePlayerMovement_GoSpeed4(struct EventObject *, struct Sprite *, u8, bool8(u8));
u8 CopyablePlayerMovement_Jump(struct EventObject *, struct Sprite *, u8, bool8(u8));

extern struct FieldCamera gFieldCamera;
extern u16 gTotalCameraPixelOffsetY;
extern u16 gTotalCameraPixelOffsetX;

extern const struct Coords16 gDirectionToVector[];

void MovementType_BerryTreeGrowth(struct Sprite *);
void MovementType_Hidden(struct Sprite *);
void MovementType_MountainDisguise(struct Sprite *);
void MovementType_TreeDisguise(struct Sprite *);
void MovementType_Player(struct Sprite *);
void MovementType_None(struct Sprite *);
void MovementType_WanderAround(struct Sprite *);
void MovementType_LookAround(struct Sprite *);
void MovementType_WanderUpAndDown(struct Sprite *);
void MovementType_WanderLeftAndRight(struct Sprite *);
void MovementType_FaceDirection(struct Sprite *);
void MovementType_FaceDownAndUp(struct Sprite *);
void MovementType_FaceLeftAndRight(struct Sprite *);
void MovementType_FaceUpAndLeft(struct Sprite *);
void MovementType_FaceUpAndRight(struct Sprite *);
void MovementType_FaceDownAndLeft(struct Sprite *);
void MovementType_FaceDownAndRight(struct Sprite *);
void MovementType_FaceDownUpAndLeft(struct Sprite *);
void MovementType_FaceDownUpAndRight(struct Sprite *);
void MovementType_FaceUpLeftAndRight(struct Sprite *);
void MovementType_FaceDownLeftAndRight(struct Sprite *);
void MovementType_RotateCounterclockwise(struct Sprite *);
void MovementType_RotateClockwise(struct Sprite *);
void MovementType_WalkBackAndForth(struct Sprite *);
void MovementType_WalkSequenceUpRightLeftDown(struct Sprite *);
void MovementType_WalkSequenceRightLeftDownUp(struct Sprite *);
void MovementType_WalkSequenceDownUpRightLeft(struct Sprite *);
void MovementType_WalkSequenceLeftDownUpRight(struct Sprite *);
void MovementType_WalkSequenceUpLeftRightDown(struct Sprite *);
void MovementType_WalkSequenceLeftRightDownUp(struct Sprite *);
void MovementType_WalkSequenceDownUpLeftRight(struct Sprite *);
void MovementType_WalkSequenceRightDownUpLeft(struct Sprite *);
void MovementType_WalkSequenceLeftUpDownRight(struct Sprite *);
void MovementType_WalkSequenceUpDownRightLeft(struct Sprite *);
void MovementType_WalkSequenceRightLeftUpDown(struct Sprite *);
void MovementType_WalkSequenceDownRightLeftUp(struct Sprite *);
void MovementType_WalkSequenceRightUpDownLeft(struct Sprite *);
void MovementType_WalkSequenceUpDownLeftRight(struct Sprite *);
void MovementType_WalkSequenceLeftRightUpDown(struct Sprite *);
void MovementType_WalkSequenceDownLeftRightUp(struct Sprite *);
void MovementType_WalkSequenceUpLeftDownRight(struct Sprite *);
void MovementType_WalkSequenceDownRightUpLeft(struct Sprite *);
void MovementType_WalkSequenceLeftDownRightUp(struct Sprite *);
void MovementType_WalkSequenceRightUpLeftDown(struct Sprite *);
void MovementType_WalkSequenceUpRightDownLeft(struct Sprite *);
void MovementType_WalkSequenceDownLeftUpRight(struct Sprite *);
void MovementType_WalkSequenceLeftUpRightDown(struct Sprite *);
void MovementType_WalkSequenceRightDownLeftUp(struct Sprite *);
void MovementType_CopyPlayer(struct Sprite *);
void MovementType_CopyPlayerInGrass(struct Sprite *);
void MovementType_WalkInPlace(struct Sprite *);
void MovementType_JogInPlace(struct Sprite *);
void MovementType_RunInPlace(struct Sprite *);
void MovementType_Invisible(struct Sprite *);

u8 MovementType_WanderAround_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WanderAround_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_WanderAround_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_WanderAround_Step3(struct EventObject *, struct Sprite *);
u8 MovementType_WanderAround_Step4(struct EventObject *, struct Sprite *);
u8 MovementType_WanderAround_Step5(struct EventObject *, struct Sprite *);
u8 MovementType_WanderAround_Step6(struct EventObject *, struct Sprite *);
u8 MovementType_LookAround_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_LookAround_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_LookAround_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_LookAround_Step3(struct EventObject *, struct Sprite *);
u8 MovementType_LookAround_Step4(struct EventObject *, struct Sprite *);
u8 MovementType_WanderUpAndDown_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WanderUpAndDown_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_WanderUpAndDown_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_WanderUpAndDown_Step3(struct EventObject *, struct Sprite *);
u8 MovementType_WanderUpAndDown_Step4(struct EventObject *, struct Sprite *);
u8 MovementType_WanderUpAndDown_Step5(struct EventObject *, struct Sprite *);
u8 MovementType_WanderUpAndDown_Step6(struct EventObject *, struct Sprite *);
u8 MovementType_WanderLeftAndRight_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WanderLeftAndRight_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_WanderLeftAndRight_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_WanderLeftAndRight_Step3(struct EventObject *, struct Sprite *);
u8 MovementType_WanderLeftAndRight_Step4(struct EventObject *, struct Sprite *);
u8 MovementType_WanderLeftAndRight_Step5(struct EventObject *, struct Sprite *);
u8 MovementType_WanderLeftAndRight_Step6(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDirection_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDirection_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDirection_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_BerryTreeGrowth_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_BerryTreeGrowth_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_BerryTreeGrowth_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_BerryTreeGrowth_Step3(struct EventObject *, struct Sprite *);
u8 MovementType_BerryTreeGrowth_Step4(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownAndUp_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownAndUp_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownAndUp_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownAndUp_Step3(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownAndUp_Step4(struct EventObject *, struct Sprite *);
u8 MovementType_FaceLeftAndRight_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_FaceLeftAndRight_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_FaceLeftAndRight_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_FaceLeftAndRight_Step3(struct EventObject *, struct Sprite *);
u8 MovementType_FaceLeftAndRight_Step4(struct EventObject *, struct Sprite *);
u8 MovementType_FaceUpAndLeft_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_FaceUpAndLeft_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_FaceUpAndLeft_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_FaceUpAndLeft_Step3(struct EventObject *, struct Sprite *);
u8 MovementType_FaceUpAndLeft_Step4(struct EventObject *, struct Sprite *);
u8 MovementType_FaceUpAndRight_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_FaceUpAndRight_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_FaceUpAndRight_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_FaceUpAndRight_Step3(struct EventObject *, struct Sprite *);
u8 MovementType_FaceUpAndRight_Step4(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownAndLeft_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownAndLeft_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownAndLeft_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownAndLeft_Step3(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownAndLeft_Step4(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownAndRight_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownAndRight_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownAndRight_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownAndRight_Step3(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownAndRight_Step4(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownUpAndLeft_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownUpAndLeft_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownUpAndLeft_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownUpAndLeft_Step3(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownUpAndLeft_Step4(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownUpAndRight_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownUpAndRight_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownUpAndRight_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownUpAndRight_Step3(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownUpAndRight_Step4(struct EventObject *, struct Sprite *);
u8 MovementType_FaceUpLeftAndRight_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_FaceUpLeftAndRight_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_FaceUpLeftAndRight_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_FaceUpLeftAndRight_Step3(struct EventObject *, struct Sprite *);
u8 MovementType_FaceUpLeftAndRight_Step4(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownLeftAndRight_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownLeftAndRight_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownLeftAndRight_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownLeftAndRight_Step3(struct EventObject *, struct Sprite *);
u8 MovementType_FaceDownLeftAndRight_Step4(struct EventObject *, struct Sprite *);
u8 MovementType_RotateCounterclockwise_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_RotateCounterclockwise_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_RotateCounterclockwise_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_RotateCounterclockwise_Step3(struct EventObject *, struct Sprite *);
u8 MovementType_RotateClockwise_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_RotateClockwise_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_RotateClockwise_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_RotateClockwise_Step3(struct EventObject *, struct Sprite *);
u8 MovementType_WalkBackAndForth_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WalkBackAndForth_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_WalkBackAndForth_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_WalkBackAndForth_Step3(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequenceUpRightLeftDown_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequenceRightLeftDownUp_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequenceDownUpRightLeft_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequenceLeftDownUpRight_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequenceUpLeftRightDown_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequenceLeftRightDownUp_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequenceDownUpLeftRight_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequenceRightDownUpLeft_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequenceLeftUpDownRight_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequenceUpDownRightLeft_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequenceRightLeftUpDown_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequenceDownRightLeftUp_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequenceRightUpDownLeft_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequenceUpDownLeftRight_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequenceLeftRightUpDown_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequenceDownLeftRightUp_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequenceUpLeftDownRight_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequenceDownRightUpLeft_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequenceLeftDownRightUp_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequenceRightUpLeftDown_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequenceUpRightDownLeft_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequenceDownLeftUpRight_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequenceLeftUpRightDown_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequenceRightDownLeftUp_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_CopyPlayer_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_CopyPlayer_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_CopyPlayer_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_CopyPlayerInGrass_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_CopyPlayer_Step2(struct EventObject *, struct Sprite *);
u8 MovementType_Hidden_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WalkInPlace_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_MoveInPlace_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_JogInPlace_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_MoveInPlace_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_RunInPlace_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_MoveInPlace_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_Invisible_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_Invisible_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_Invisible_Step2(struct EventObject *, struct Sprite *);

u8 GetMoveDirectionAnimNum(u8);
u8 GetMoveDirectionFastAnimNum(u8);
u8 GetMoveDirectionFastAnimNum(u8);
u8 GetMoveDirectionFasterAnimNum(u8);
u8 GetMoveDirectionFastestAnimNum(u8);

u32 state_to_direction(u8, u32, u32);

void ResetEventObjects();
u8 GetFirstInactiveEventObjectId(void);
u8 GetEventObjectIdByLocalIdAndMap(u8, u8, u8);
bool8 TryGetEventObjectIdByLocalIdAndMap(u8, u8, u8, u8 *);
u8 GetEventObjectIdByXY(s16, s16);
u8 GetEventObjectIdByLocalIdAndMapInternal(u8, u8, u8);
u8 GetEventObjectIdByLocalId(u8);
u8 GetAvailableEventObjectId(u16, u8, u8, u8 *);
void RemoveEventObjectByLocalIdAndMap(u8, u8, u8);
void RemoveEventObjectInternal(struct EventObject *);
u8 SpawnSpecialEventObject(struct EventObjectTemplate *);
u8 show_sprite(u8, u8, u8);
void MakeObjectTemplateFromEventObjectTemplate(struct EventObjectTemplate *eventObjTemplate, struct SpriteTemplate *sprTemplate, const struct SubspriteTable **subspriteTables);
u8 AddPseudoEventObject(u16 graphicsId, void (*callback)(struct Sprite *), s16 x, s16 y, u8 subpriority);
u8 sub_805B410(u8, u8, s16, s16, u8, u8);
void TrySpawnEventObjects(s16, s16);
void sub_805B710(u16 i, u16 i1);
void sub_805B980(struct EventObject *, u8);
void EventObjectTurn(struct EventObject *, u8);
void EventObjectTurnByLocalIdAndMap(u8, u8, u8, u8);
const struct EventObjectGraphicsInfo *GetEventObjectGraphicsInfo(u8);
void SetEventObjectDynamicGraphicsId(struct EventObject *);
void npc_by_local_id_and_map_set_field_1_bit_x20(u8, u8, u8, u8);
void EventObjectGetLocalIdAndMap(struct EventObject *, void *, void *, void *);
void sub_805BCC0(s16 x, s16 y);
void sub_805BCF0(u8, u8, u8, u8);
void sub_805BD48(u8, u8, u8);
void sub_805BD90(u8 localId, u8 mapNum, u8 mapGroup, s16 x, s16 y);
void FreeAndReserveObjectSpritePalettes(void);
void sub_805BDF8(u16);
u8 sub_805BE58(const struct SpritePalette *);
void PatchObjectPalette(u16, u16);
u8 FindEventObjectPaletteIndexByTag(u16);
void LoadPlayerObjectReflectionPalette(u16, u8);
void LoadSpecialObjectReflectionPalette(u16, u8);
void ShiftEventObjectCoords(struct EventObject *pObject, s16 x, s16 y);
void sub_805C0F8(u8, u8, u8, s16, s16);
void ShiftStillEventObjectCoords(struct EventObject *pObject);
u8 GetEventObjectIdByXYZ(u16, u16, u8);
void UpdateEventObjectsForCameraUpdate(s16, s16);
u8 AddCameraObject(u8);
void CameraObjectReset1(void);
u8 * GetEventObjectScriptPointerByEventObjectId(u8);
u16 GetEventObjectFlagIdByEventObjectId(u8);
u8 EventObjectGetBerryTreeId(u8);
struct EventObjectTemplate *GetEventObjectTemplateByLocalIdAndMap(u8, u8, u8);
void OverrideTemplateCoordsForEventObject(struct EventObject *pObject);
void OverrideMovementTypeForEventObject(struct EventObject *, u8);
void TryOverrideTemplateCoordsForEventObject(u8, u8, u8);
void InitEventObjectPalettes(u8);
u8 GetFaceDirectionAnimNum(u8);
u8 GetMoveDirectionAnimNum(u8 unk_19);
u8 GetAcroWheelieDirectionAnimNum(u8);
u8 GetFishingDirectionAnimNum(u8);
u8 GetFishingNoCatchDirectionAnimNum(u8);
u8 GetFishingBiteDirectionAnimNum(u8);
void SetTrainerMovementType(struct EventObject *, u8);
u8 GetTrainerFacingDirectionMovementType(u8);
u8 GetCollisionAtCoords(struct EventObject *, s16, s16, u32);
u8 GetCollisionFlagsAtCoords(struct EventObject *, s16, s16, u8);
bool8 IsBerryTreeSparkling(u8, u8, u8);
void sub_8060288(u8, u8, u8);
void sub_8060388(s16, s16, s16 *, s16 *);
void sub_80603CC(s16 x, s16 y, s16 *pInt, s16 *pInt1);
void GetEventObjectMovingCameraOffset(s16 *, s16 *);
void EventObjectMoveDestCoords(struct EventObject *pObject, u32 unk_19, s16 *pInt, s16 *pInt1);
bool8 EventObjectIsMovementOverridden(struct EventObject *);
bool8 EventObjectIsHeldMovementActive(struct EventObject *);
bool8 EventObjectSetHeldMovement(struct EventObject *, u8);
void EventObjectForceSetHeldMovement(struct EventObject *pObject, u8 a);
void EventObjectClearHeldMovementIfActive(struct EventObject *);
void EventObjectClearHeldMovement(struct EventObject *);
bool8 EventObjectCheckHeldMovementStatus(struct EventObject *);
u8 EventObjectClearHeldMovementIfFinished(struct EventObject *);
u8 EventObjectGetHeldMovementActionId(struct EventObject *);
u8 GetFaceDirectionMovementAction(u32);
u8 GetWalkSlowMovementAction(u32);
u8 GetWalkNormalMovementAction(u32);
u8 GetWalkFastMovementAction(u32);
u8 GetRideWaterCurrentMovementAction(u32);
u8 GetWalkFastestMovementAction(u32);
u8 GetSlideMovementAction(u32);
u8 GetPlayerRunMovementAction(u32);
u8 GetJump2MovementAction(u32);
u8 GetJumpInPlaceMovementAction(u32);
u8 GetJumpInPlaceTurnAroundMovementAction(u32);
u8 GetJumpMovementAction(u32);
u8 GetJumpSpecialMovementAction(u32);
u8 GetWalkInPlaceSlowMovementAction(u32);
u8 GetWalkInPlaceNormalMovementAction(u32);
u8 GetWalkInPlaceFastMovementAction(u32);
u8 GetWalkInPlaceFastestMovementAction(u32);
u8 EventObjectFaceOppositeDirection(struct EventObject *, u8);
u8 GetAcroWheelieFaceDirectionMovementAction(u8);
u8 GetAcroPopWheelieFaceDirectionMovementAction(u8);
u8 GetAcroEndWheelieFaceDirectionMovementAction(u8);
u8 GetAcroWheelieHopFaceDirectionMovementAction(u8);
u8 GetAcroWheelieHopDirectionMovementAction(u8);
u8 GetAcroWheelieJumpDirectionMovementAction(u8);
u8 GetAcroWheelieInPlaceDirectionMovementAction(u8);
u8 GetAcroPopWheelieMoveDirectionMovementAction(u8);
u8 GetAcroWheelieMoveDirectionMovementAction(u8);
u8 GetAcroEndWheelieMoveDirectionMovementAction(u8);
u8 GetOppositeDirection(u8);
u8 SpawnSpecialEventObjectParametrized(u8, u8, u8, s16, s16, u8);
void CameraObjectSetFollowedObjectId(u8);
u8 TryInitLocalEventObject(u8);
u8 CreateCopySpriteAt(struct Sprite *, s16, s16, u8);
u16 GetObjectPaletteTag(u8);
void sub_8060470(s16 *, s16 *, s16, s16);
bool8 FreezeEventObject(struct EventObject *);
void FreezeEventObjects(void);
void FreezeEventObjectsExceptOne(u8);
void UnfreezeEventObjects(void);
void UpdateEventObjectSpriteVisibility(struct Sprite *sprite, bool8 invisible);
void TurnEventObject(u8, u8);
void UnfreezeEventObject(struct EventObject *eventObject);
void sub_806467C(struct Sprite *sprite, u8 direction);
bool8 sub_806468C(struct Sprite *sprite);
void sub_80646E4(struct Sprite *sprite, u8 a2, u8 a3, u8 a4);
void DoShadowFieldEffect(struct EventObject *eventObject);
u8 sub_8064704(struct Sprite *);
u8 sub_806478C(struct Sprite *);
void SetAndStartSpriteAnim(struct Sprite *sprite, u8 a2, u8 a3);
void DoRippleFieldEffect(struct EventObject *eventObj, struct Sprite *sprite);
bool8 IsZCoordMismatchAt(u8 z, s16 x, s16 y);
bool8 AreZCoordsCompatible(u8 z1, u8 z2);
void EventObjectUpdateMetatileBehaviors(struct EventObject *);
void GetGroundEffectFlags_Reflection(struct EventObject *, u32 *);
void GetGroundEffectFlags_TallGrassOnSpawn(struct EventObject *, u32 *);
void GetGroundEffectFlags_TallGrassOnBeginStep(struct EventObject *, u32 *);
void GetGroundEffectFlags_LongGrassOnSpawn(struct EventObject *, u32 *);
void GetGroundEffectFlags_LongGrassOnBeginStep(struct EventObject *, u32 *);
void GetGroundEffectFlags_Tracks(struct EventObject *, u32 *);
void GetGroundEffectFlags_SandPile(struct EventObject *, u32 *);
void GetGroundEffectFlags_ShallowFlowingWater(struct EventObject *, u32 *);
void GetGroundEffectFlags_Puddle(struct EventObject *, u32 *);
void GetGroundEffectFlags_Ripple(struct EventObject *, u32 *);
void GetGroundEffectFlags_ShortGrass(struct EventObject *, u32 *);
void GetGroundEffectFlags_HotSprings(struct EventObject *, u32 *);
void GetGroundEffectFlags_Seaweed(struct EventObject *, u32 *);
void GetGroundEffectFlags_JumpLanding(struct EventObject *, u32 *);
u8 EventObjectCheckForReflectiveSurface(struct EventObject *);
u8 GetLedgeJumpDirection(s16, s16, u8);
u8 ZCoordToPriority(u8);
void EventObjectUpdateZCoord(struct EventObject *pObject);
void SetObjectSubpriorityByZCoord(u8, struct Sprite *, u8);

#endif // GUARD_EVENTOBJMV_H
