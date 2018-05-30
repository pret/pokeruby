#ifndef GUARD_EVENTOBJMV_H
#define GUARD_EVENTOBJMV_H

#include "sprite.h"

enum {
    MOVEMENT_TYPE_NONE,
    MOVEMENT_TYPE_LOOK_AROUND,
    MOVEMENT_TYPE_WANDER_AROUND,
    MOVEMENT_TYPE_WANDER_UP_AND_DOWN,
    MOVEMENT_TYPE_WANDER_DOWN_AND_UP,
    MOVEMENT_TYPE_WANDER_LEFT_AND_RIGHT,
    MOVEMENT_TYPE_WANDER_RIGHT_AND_LEFT,
    MOVEMENT_TYPE_FACE_UP,
    MOVEMENT_TYPE_FACE_DOWN,
    MOVEMENT_TYPE_FACE_LEFT,
    MOVEMENT_TYPE_FACE_RIGHT,
    MOVEMENT_TYPE_PLAYER,
    MOVEMENT_TYPE_BERRY_TREE_GROWTH,
    MOVEMENT_TYPE_FACE_DOWN_AND_UP,
    MOVEMENT_TYPE_FACE_LEFT_AND_RIGHT,
    MOVEMENT_TYPE_FACE_UP_AND_LEFT,
    MOVEMENT_TYPE_FACE_UP_AND_RIGHT,
    MOVEMENT_TYPE_FACE_DOWN_AND_LEFT,
    MOVEMENT_TYPE_FACE_DOWN_AND_RIGHT,
    MOVEMENT_TYPE_FACE_DOWN_UP_AND_LEFT,
    MOVEMENT_TYPE_FACE_DOWN_UP_AND_RIGHT,
    MOVEMENT_TYPE_FACE_UP_LEFT_AND_RIGHT,
    MOVEMENT_TYPE_FACE_DOWN_LEFT_AND_RIGHT,
    MOVEMENT_TYPE_ROTATE_COUNTERCLOCKWISE,
    MOVEMENT_TYPE_ROTATE_CLOCKWISE,
    MOVEMENT_TYPE_WALK_UP_AND_DOWN,
    MOVEMENT_TYPE_WALK_DOWN_AND_UP,
    MOVEMENT_TYPE_WALK_LEFT_AND_RIGHT,
    MOVEMENT_TYPE_WALK_RIGHT_AND_LEFT,
    MOVEMENT_TYPE_WALK_SEQUENCE_UP_RIGHT_LEFT_DOWN,
    MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_LEFT_DOWN_UP,
    MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_UP_RIGHT_LEFT,
    MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_DOWN_UP_RIGHT,
    MOVEMENT_TYPE_WALK_SEQUENCE_UP_LEFT_RIGHT_DOWN,
    MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_RIGHT_DOWN_UP,
    MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_UP_LEFT_RIGHT,
    MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_DOWN_UP_LEFT,
    MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_UP_DOWN_RIGHT,
    MOVEMENT_TYPE_WALK_SEQUENCE_UP_DOWN_RIGHT_LEFT,
    MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_LEFT_UP_DOWN,
    MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_RIGHT_LEFT_UP,
    MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_UP_DOWN_LEFT,
    MOVEMENT_TYPE_WALK_SEQUENCE_UP_DOWN_LEFT_RIGHT,
    MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_RIGHT_UP_DOWN,
    MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_LEFT_RIGHT_UP,
    MOVEMENT_TYPE_WALK_SEQUENCE_UP_LEFT_DOWN_RIGHT,
    MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_RIGHT_UP_LEFT,
    MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_DOWN_RIGHT_UP,
    MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_UP_LEFT_DOWN,
    MOVEMENT_TYPE_WALK_SEQUENCE_UP_RIGHT_DOWN_LEFT,
    MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_LEFT_UP_RIGHT,
    MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_UP_RIGHT_DOWN,
    MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_DOWN_LEFT_UP,
    MOVEMENT_TYPE_COPY_PLAYER,
    MOVEMENT_TYPE_COPY_PLAYER_OPPOSITE,
    MOVEMENT_TYPE_COPY_PLAYER_COUNTERCLOCKWISE,
    MOVEMENT_TYPE_COPY_PLAYER_CLOCKWISE,
    MOVEMENT_TYPE_TREE_DISGUISE,
    MOVEMENT_TYPE_MOUNTAIN_DISGUISE,
    MOVEMENT_TYPE_COPY_PLAYER_IN_GRASS,
    MOVEMENT_TYPE_COPY_PLAYER_OPPOSITE_IN_GRASS,
    MOVEMENT_TYPE_COPY_PLAYER_COUNTERCLOCKWISE_IN_GRASS,
    MOVEMENT_TYPE_COPY_PLAYER_CLOCKWISE_IN_GRASS,
    MOVEMENT_TYPE_HIDDEN,
    MOVEMENT_TYPE_WALK_IN_PLACE_DOWN,
    MOVEMENT_TYPE_WALK_IN_PLACE_UP,
    MOVEMENT_TYPE_WALK_IN_PLACE_LEFT,
    MOVEMENT_TYPE_WALK_IN_PLACE_RIGHT,
    MOVEMENT_TYPE_JOG_IN_PLACE_DOWN,
    MOVEMENT_TYPE_JOG_IN_PLACE_UP,
    MOVEMENT_TYPE_JOG_IN_PLACE_LEFT,
    MOVEMENT_TYPE_JOG_IN_PLACE_RIGHT,
    MOVEMENT_TYPE_RUN_IN_PLACE_DOWN,
    MOVEMENT_TYPE_RUN_IN_PLACE_UP,
    MOVEMENT_TYPE_RUN_IN_PLACE_LEFT,
    MOVEMENT_TYPE_RUN_IN_PLACE_RIGHT,
    MOVEMENT_TYPE_INVISIBLE,
};

enum {
    MOVEMENT_ACTION_FACE_DOWN,
    MOVEMENT_ACTION_FACE_UP,
    MOVEMENT_ACTION_FACE_LEFT,
    MOVEMENT_ACTION_FACE_RIGHT,
    MOVEMENT_ACTION_WALK_SLOW_DOWN,
    MOVEMENT_ACTION_WALK_SLOW_UP,
    MOVEMENT_ACTION_WALK_SLOW_LEFT,
    MOVEMENT_ACTION_WALK_SLOW_RIGHT,
    MOVEMENT_ACTION_WALK_NORMAL_DOWN,
    MOVEMENT_ACTION_WALK_NORMAL_UP,
    MOVEMENT_ACTION_WALK_NORMAL_LEFT,
    MOVEMENT_ACTION_WALK_NORMAL_RIGHT,
    MOVEMENT_ACTION_JUMP_2_DOWN,
    MOVEMENT_ACTION_JUMP_2_UP,
    MOVEMENT_ACTION_JUMP_2_LEFT,
    MOVEMENT_ACTION_JUMP_2_RIGHT,
    MOVEMENT_ACTION_DELAY_1,
    MOVEMENT_ACTION_DELAY_2,
    MOVEMENT_ACTION_DELAY_4,
    MOVEMENT_ACTION_DELAY_8,
    MOVEMENT_ACTION_DELAY_16,
    MOVEMENT_ACTION_WALK_FAST_DOWN,
    MOVEMENT_ACTION_WALK_FAST_UP,
    MOVEMENT_ACTION_WALK_FAST_LEFT,
    MOVEMENT_ACTION_WALK_FAST_RIGHT,
    MOVEMENT_ACTION_WALK_IN_PLACE_SLOW_DOWN,
    MOVEMENT_ACTION_WALK_IN_PLACE_SLOW_UP,
    MOVEMENT_ACTION_WALK_IN_PLACE_SLOW_LEFT,
    MOVEMENT_ACTION_WALK_IN_PLACE_SLOW_RIGHT,
    MOVEMENT_ACTION_WALK_IN_PLACE_NORMAL_DOWN,
    MOVEMENT_ACTION_WALK_IN_PLACE_NORMAL_UP,
    MOVEMENT_ACTION_WALK_IN_PLACE_NORMAL_LEFT,
    MOVEMENT_ACTION_WALK_IN_PLACE_NORMAL_RIGHT,
    MOVEMENT_ACTION_WALK_IN_PLACE_FAST_DOWN,
    MOVEMENT_ACTION_WALK_IN_PLACE_FAST_UP,
    MOVEMENT_ACTION_WALK_IN_PLACE_FAST_LEFT,
    MOVEMENT_ACTION_WALK_IN_PLACE_FAST_RIGHT,
    MOVEMENT_ACTION_WALK_IN_PLACE_FASTEST_DOWN,
    MOVEMENT_ACTION_WALK_IN_PLACE_FASTEST_UP,
    MOVEMENT_ACTION_WALK_IN_PLACE_FASTEST_LEFT,
    MOVEMENT_ACTION_WALK_IN_PLACE_FASTEST_RIGHT,
    MOVEMENT_ACTION_RIDE_WATER_CURRENT_DOWN,
    MOVEMENT_ACTION_RIDE_WATER_CURRENT_UP,
    MOVEMENT_ACTION_RIDE_WATER_CURRENT_LEFT,
    MOVEMENT_ACTION_RIDE_WATER_CURRENT_RIGHT,
    MOVEMENT_ACTION_WALK_FASTEST_DOWN,
    MOVEMENT_ACTION_WALK_FASTEST_UP,
    MOVEMENT_ACTION_WALK_FASTEST_LEFT,
    MOVEMENT_ACTION_WALK_FASTEST_RIGHT,
    MOVEMENT_ACTION_SLIDE_DOWN,
    MOVEMENT_ACTION_SLIDE_UP,
    MOVEMENT_ACTION_SLIDE_LEFT,
    MOVEMENT_ACTION_SLIDE_RIGHT,
    MOVEMENT_ACTION_PLAYER_RUN_DOWN,
    MOVEMENT_ACTION_PLAYER_RUN_UP,
    MOVEMENT_ACTION_PLAYER_RUN_LEFT,
    MOVEMENT_ACTION_PLAYER_RUN_RIGHT,
    MOVEMENT_ACTION_START_ANIM_IN_DIRECTION,
    MOVEMENT_ACTION_JUMP_SPECIAL_DOWN,
    MOVEMENT_ACTION_JUMP_SPECIAL_UP,
    MOVEMENT_ACTION_JUMP_SPECIAL_LEFT ,
    MOVEMENT_ACTION_JUMP_SPECIAL_RIGHT,
    MOVEMENT_ACITON_FACE_PLAYER,
    MOVEMENT_ACITON_FACE_AWAY_PLAYER,
    MOVEMENT_ACTION_LOCK_FACING_DIRECTION,
    MOVEMENT_ACTION_UNLOCK_FACING_DIRECTION,
    MOVEMENT_ACITON_JUMP_DOWN,
    MOVEMENT_ACITON_JUMP_UP,
    MOVEMENT_ACITON_JUMP_LEFT,
    MOVEMENT_ACITON_JUMP_RIGHT,
    MOVEMENT_ACTION_JUMP_IN_PLACE_DOWN,
    MOVEMENT_ACTION_JUMP_IN_PLACE_UP,
    MOVEMENT_ACTION_JUMP_IN_PLACE_LEFT,
    MOVEMENT_ACTION_JUMP_IN_PLACE_RIGHT,
    MOVEMENT_ACTION_JUMP_IN_PLACE_DOWN_UP,
    MOVEMENT_ACTION_JUMP_IN_PLACE_UP_DOWN,
    MOVEMENT_ACTION_JUMP_IN_PLACE_LEFT_RIGHT,
    MOVEMENT_ACTION_JUMP_IN_PLACE_RIGHT_LEFT,
    MOVEMENT_ACTION_FACE_ORIGINAL_DIRECTION,
    MOVEMENT_ACTION_NURSE_JOY_BOW_DOWN,
    MOVEMENT_ACTION_ENABLE_JUMP_LANDING_GROUND_EFFECT,
    MOVEMENT_ACTION_DISABLE_JUMP_LANDING_GROUND_EFFECT,
    MOVEMENT_ACTION_DISABLE_ANIMATION,
    MOVEMENT_ACTION_RESTORE_ANIMATION,
    MOVEMENT_ACTION_SET_INVISIBLE,
    MOVEMENT_ACTION_SET_VISIBLE,
    MOVEMENT_ACTION_EMOTE_EXCLAMATION_MARK,
    MOVEMENT_ACTION_EMOTE_QUESTION_MARK,
    MOVEMENT_ACTION_EMOTE_HEART,
    MOVEMENT_ACTION_REVEAL_TRAINER,
    MOVEMENT_ACTION_ROCK_SMASH_BREAK,
    MOVEMENT_ACTION_CUT_TREE,
    MOVEMENT_ACTION_SET_FIXED_PRIORITY,
    MOVEMENT_ACTION_CLEAR_FIXED_PRIORITY,
    MOVEMENT_ACTION_INIT_AFFINE_ANIM,
    MOVEMENT_ACTION_CLEAR_AFFINE_ANIM,
    MOVEMENT_ACTION_WALK_DOWN_AFFINE_0,
    MOVEMENT_ACTION_WALK_DOWN_AFFINE_1,
    MOVEMENT_ACTION_ACRO_WHEELIE_FACE_DOWN,
    MOVEMENT_ACTION_ACRO_WHEELIE_FACE_UP,
    MOVEMENT_ACTION_ACRO_WHEELIE_FACE_LEFT,
    MOVEMENT_ACTION_ACRO_WHEELIE_FACE_RIGHT,
    MOVEMENT_ACTION_ACRO_POP_WHEELIE_DOWN,
    MOVEMENT_ACTION_ACRO_POP_WHEELIE_UP,
    MOVEMENT_ACTION_ACRO_POP_WHEELIE_LEFT,
    MOVEMENT_ACTION_ACRO_POP_WHEELIE_RIGHT,
    MOVEMENT_ACTION_ACRO_END_WHEELIE_FACE_DOWN,
    MOVEMENT_ACTION_ACRO_END_WHEELIE_FACE_UP,
    MOVEMENT_ACTION_ACRO_END_WHEELIE_FACE_LEFT,
    MOVEMENT_ACTION_ACRO_END_WHEELIE_FACE_RIGHT,
    MOVEMENT_ACTION_ACRO_WHEELIE_HOP_FACE_DOWN,
    MOVEMENT_ACTION_ACRO_WHEELIE_HOP_FACE_UP,
    MOVEMENT_ACTION_ACRO_WHEELIE_HOP_FACE_LEFT,
    MOVEMENT_ACTION_ACRO_WHEELIE_HOP_FACE_RIGHT,
    MOVEMENT_ACTION_ACRO_WHEELIE_HOP_DOWN,
    MOVEMENT_ACTION_ACRO_WHEELIE_HOP_UP,
    MOVEMENT_ACTION_ACRO_WHEELIE_HOP_LEFT,
    MOVEMENT_ACTION_ACRO_WHEELIE_HOP_RIGHT,
    MOVEMENT_ACTION_ACRO_WHEELIE_JUMP_DOWN,
    MOVEMENT_ACTION_ACRO_WHEELIE_JUMP_UP,
    MOVEMENT_ACTION_ACRO_WHEELIE_JUMP_LEFT,
    MOVEMENT_ACTION_ACRO_WHEELIE_JUMP_RIGHT,
    MOVEMENT_ACTION_ACRO_WHEELIE_IN_PLACE_DOWN,
    MOVEMENT_ACTION_ACRO_WHEELIE_IN_PLACE_UP,
    MOVEMENT_ACTION_ACRO_WHEELIE_IN_PLACE_LEFT,
    MOVEMENT_ACTION_ACRO_WHEELIE_IN_PLACE_RIGHT,
    MOVEMENT_ACTION_ACRO_POP_WHEELIE_MOVE_DOWN,
    MOVEMENT_ACTION_ACRO_POP_WHEELIE_MOVE_UP,
    MOVEMENT_ACTION_ACRO_POP_WHEELIE_MOVE_LEFT,
    MOVEMENT_ACTION_ACRO_POP_WHEELIE_MOVE_RIGHT,
    MOVEMENT_ACTION_ACRO_WHEELIE_MOVE_DOWN,
    MOVEMENT_ACTION_ACRO_WHEELIE_MOVE_UP,
    MOVEMENT_ACTION_ACRO_WHEELIE_MOVE_LEFT,
    MOVEMENT_ACTION_ACRO_WHEELIE_MOVE_RIGHT,
    MOVEMENT_ACTION_ACRO_END_WHEELIE_MOVE_DOWN,
    MOVEMENT_ACTION_ACRO_END_WHEELIE_MOVE_UP,
    MOVEMENT_ACTION_ACRO_END_WHEELIE_MOVE_LEFT,
    MOVEMENT_ACTION_ACRO_END_WHEELIE_MOVE_RIGHT,
};

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

extern const u8 gUnknown_0830FD14[];

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

struct PairedPalettes
{
    u16 tag;
    const u16 *data;
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

extern struct CameraSomething gUnknown_03004880;
extern u16 gUnknown_03004898;
extern u16 gUnknown_0300489C;

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
u8 MovementType_WalkInPlace_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_JogInPlace_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WalkInPlace_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_RunInPlace_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_WalkInPlace_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_Invisible_Step0(struct EventObject *, struct Sprite *);
u8 MovementType_Invisible_Step1(struct EventObject *, struct Sprite *);
u8 MovementType_Invisible_Step2(struct EventObject *, struct Sprite *);

u8 GetMoveDirectionAnimNum(u8);
u8 GetMoveDirectionFastAnimNum(u8);
u8 GetMoveDirectionFastAnimNum(u8);
u8 GetMoveDirectionFasterAnimNum(u8);
u8 GetMoveDirectionFastestAnimNum(u8);

u32 state_to_direction(u8, u32, u32);

void sub_805AA98();
void sub_805AAB0(void);
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
void gpu_pal_allocator_reset__manage_upper_four(void);
void sub_805BDF8(u16);
u8 sub_805BE58(const struct SpritePalette *);
void pal_patch_for_npc(u16, u16);
u8 FindEventObjectPaletteIndexByTag(u16);
void npc_load_two_palettes__no_record(u16, u8);
void npc_load_two_palettes__and_record(u16, u8);
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
void sub_805C7C4(u8 i);
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
u8 sub_80608A4(u32);
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
u8 obj_unfreeze(struct Sprite *, s16, s16, u8);
u16 npc_paltag_by_palslot(u8);
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
