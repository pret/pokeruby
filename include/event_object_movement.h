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

#define fieldmap_object_cb(setup, callback, table) \
static u8 callback(struct MapObject *, struct Sprite *);\
void setup(struct Sprite *sprite)\
{\
    meta_step(&gMapObjects[sprite->data[0]], sprite, callback);\
}\
static u8 callback(struct MapObject *mapObject, struct Sprite *sprite)\
{\
    return table[sprite->data[1]](mapObject, sprite);\
}

#define fieldmap_object_empty_callback(setup, callback) \
static u8 callback(struct MapObject *, struct Sprite *);\
void setup(struct Sprite *sprite)\
{\
    meta_step(&gMapObjects[sprite->data[0]], sprite, callback);\
}\
static u8 callback(struct MapObject *mapObject, struct Sprite *sprite)\
{\
    return 0;\
}

struct PairedPalettes
{
    u16 tag;
    const u16 *data;
};

extern const u16 gMapObjectPalette19[];

extern const u32 gMapObjectPic_MovingBox[32];
extern const struct SpriteFrameImage gMapObjectPicTable_PechaBerryTree[];

extern const u8 gFieldEffectPic_CutGrass[];
extern const u16 gFieldEffectObjectPalette6[];

void sub_805C058(struct MapObject *mapObject, s16 a, s16 b);
void FieldObjectSetDirection(struct MapObject *pObject, u8 unk_18);
void MoveCoords(u8 direction, s16 *x, s16 *y);
void meta_step(struct MapObject *pObject,  struct Sprite *pSprite,  u8 (*d8)(struct MapObject *, struct Sprite *));
void npc_reset(struct MapObject *mapObject, struct Sprite *sprite);

u8 sub_805CAAC(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CADC(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CAEC(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CB00(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CB5C(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CBB8(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CC14(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CC70(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CCAC(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CCE8(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CD24(s16 a0, s16 a1, s16 a2, s16 a3);

u8 CopyablePlayerMovement_None(struct MapObject *, struct Sprite *, u8, bool8(u8));
u8 CopyablePlayerMovement_FaceDirection(struct MapObject *, struct Sprite *, u8, bool8(u8));
u8 CopyablePlayerMovement_GoSpeed0(struct MapObject *, struct Sprite *, u8, bool8(u8));
u8 CopyablePlayerMovement_GoSpeed1(struct MapObject *, struct Sprite *, u8, bool8(u8));
u8 CopyablePlayerMovement_GoSpeed2(struct MapObject *, struct Sprite *, u8, bool8(u8));
u8 CopyablePlayerMovement_GoSpeed3(struct MapObject *, struct Sprite *, u8, bool8(u8));
u8 cph_IM_DIFFERENT(struct MapObject *, struct Sprite *, u8, bool8(u8));
u8 CopyablePlayerMovement_GoSpeed4(struct MapObject *, struct Sprite *, u8, bool8(u8));
u8 CopyablePlayerMovement_Jump(struct MapObject *, struct Sprite *, u8, bool8(u8));

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

u8 MovementType_WanderAround_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WanderAround_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_WanderAround_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_WanderAround_Step3(struct MapObject *, struct Sprite *);
u8 MovementType_WanderAround_Step4(struct MapObject *, struct Sprite *);
u8 MovementType_WanderAround_Step5(struct MapObject *, struct Sprite *);
u8 MovementType_WanderAround_Step6(struct MapObject *, struct Sprite *);
u8 MovementType_LookAround_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_LookAround_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_LookAround_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_LookAround_Step3(struct MapObject *, struct Sprite *);
u8 MovementType_LookAround_Step4(struct MapObject *, struct Sprite *);
u8 MovementType_WanderUpAndDown_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WanderUpAndDown_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_WanderUpAndDown_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_WanderUpAndDown_Step3(struct MapObject *, struct Sprite *);
u8 MovementType_WanderUpAndDown_Step4(struct MapObject *, struct Sprite *);
u8 MovementType_WanderUpAndDown_Step5(struct MapObject *, struct Sprite *);
u8 MovementType_WanderUpAndDown_Step6(struct MapObject *, struct Sprite *);
u8 MovementType_WanderLeftAndRight_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WanderLeftAndRight_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_WanderLeftAndRight_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_WanderLeftAndRight_Step3(struct MapObject *, struct Sprite *);
u8 MovementType_WanderLeftAndRight_Step4(struct MapObject *, struct Sprite *);
u8 MovementType_WanderLeftAndRight_Step5(struct MapObject *, struct Sprite *);
u8 MovementType_WanderLeftAndRight_Step6(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDirection_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDirection_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDirection_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_BerryTreeGrowth_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_BerryTreeGrowth_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_BerryTreeGrowth_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_BerryTreeGrowth_Step3(struct MapObject *, struct Sprite *);
u8 MovementType_BerryTreeGrowth_Step4(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownAndUp_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownAndUp_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownAndUp_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownAndUp_Step3(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownAndUp_Step4(struct MapObject *, struct Sprite *);
u8 MovementType_FaceLeftAndRight_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_FaceLeftAndRight_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_FaceLeftAndRight_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_FaceLeftAndRight_Step3(struct MapObject *, struct Sprite *);
u8 MovementType_FaceLeftAndRight_Step4(struct MapObject *, struct Sprite *);
u8 MovementType_FaceUpAndLeft_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_FaceUpAndLeft_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_FaceUpAndLeft_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_FaceUpAndLeft_Step3(struct MapObject *, struct Sprite *);
u8 MovementType_FaceUpAndLeft_Step4(struct MapObject *, struct Sprite *);
u8 MovementType_FaceUpAndRight_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_FaceUpAndRight_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_FaceUpAndRight_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_FaceUpAndRight_Step3(struct MapObject *, struct Sprite *);
u8 MovementType_FaceUpAndRight_Step4(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownAndLeft_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownAndLeft_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownAndLeft_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownAndLeft_Step3(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownAndLeft_Step4(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownAndRight_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownAndRight_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownAndRight_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownAndRight_Step3(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownAndRight_Step4(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownUpAndLeft_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownUpAndLeft_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownUpAndLeft_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownUpAndLeft_Step3(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownUpAndLeft_Step4(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownUpAndRight_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownUpAndRight_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownUpAndRight_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownUpAndRight_Step3(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownUpAndRight_Step4(struct MapObject *, struct Sprite *);
u8 MovementType_FaceUpLeftAndRight_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_FaceUpLeftAndRight_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_FaceUpLeftAndRight_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_FaceUpLeftAndRight_Step3(struct MapObject *, struct Sprite *);
u8 MovementType_FaceUpLeftAndRight_Step4(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownLeftAndRight_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownLeftAndRight_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownLeftAndRight_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownLeftAndRight_Step3(struct MapObject *, struct Sprite *);
u8 MovementType_FaceDownLeftAndRight_Step4(struct MapObject *, struct Sprite *);
u8 MovementType_RotateCounterclockwise_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_RotateCounterclockwise_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_RotateCounterclockwise_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_RotateCounterclockwise_Step3(struct MapObject *, struct Sprite *);
u8 MovementType_RotateClockwise_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_RotateClockwise_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_RotateClockwise_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_RotateClockwise_Step3(struct MapObject *, struct Sprite *);
u8 MovementType_WalkBackAndForth_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkBackAndForth_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_WalkBackAndForth_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_WalkBackAndForth_Step3(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequenceUpRightLeftDown_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequenceRightLeftDownUp_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequenceDownUpRightLeft_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequenceLeftDownUpRight_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequenceUpLeftRightDown_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequenceLeftRightDownUp_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequenceDownUpLeftRight_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequenceRightDownUpLeft_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequenceLeftUpDownRight_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequenceUpDownRightLeft_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequenceRightLeftUpDown_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequenceDownRightLeftUp_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequenceRightUpDownLeft_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequenceUpDownLeftRight_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequenceLeftRightUpDown_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequenceDownLeftRightUp_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequenceUpLeftDownRight_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequenceDownRightUpLeft_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequenceLeftDownRightUp_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequenceRightUpLeftDown_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequenceUpRightDownLeft_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequenceDownLeftUpRight_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequenceLeftUpRightDown_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequenceRightDownLeftUp_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_WalkSequence_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_CopyPlayer_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_CopyPlayer_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_CopyPlayer_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_CopyPlayerInGrass_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_CopyPlayer_Step2(struct MapObject *, struct Sprite *);
u8 MovementType_Hidden_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkInPlace_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkInPlace_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_JogInPlace_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkInPlace_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_RunInPlace_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_WalkInPlace_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_Invisible_Step0(struct MapObject *, struct Sprite *);
u8 MovementType_Invisible_Step1(struct MapObject *, struct Sprite *);
u8 MovementType_Invisible_Step2(struct MapObject *, struct Sprite *);

u8 get_go_image_anim_num(u8);
u8 get_go_fast_image_anim_num(u8);
u8 get_go_fast_image_anim_num(u8);
u8 get_go_faster_image_anim_num(u8);
u8 sub_805FD78(u8);

u32 state_to_direction(u8, u32, u32);

void sub_805AA98();
void sub_805AAB0(void);
u8 sub_805AB54(void);
u8 GetFieldObjectIdByLocalIdAndMap(u8, u8, u8);
bool8 TryGetFieldObjectIdByLocalIdAndMap(u8, u8, u8, u8 *);
u8 GetFieldObjectIdByXY(s16, s16);
u8 GetFieldObjectIdByLocalIdAndMapInternal(u8, u8, u8);
u8 GetFieldObjectIdByLocalId(u8);
u8 GetAvailableFieldObjectSlot(u16, u8, u8, u8 *);
void RemoveFieldObjectByLocalIdAndMap(u8, u8, u8);
void RemoveFieldObjectInternal(struct MapObject *);
u8 SpawnSpecialFieldObject(struct MapObjectTemplate *);
u8 show_sprite(u8, u8, u8);
void MakeObjectTemplateFromFieldObjectTemplate(struct MapObjectTemplate *mapObjTemplate, struct SpriteTemplate *sprTemplate, const struct SubspriteTable **subspriteTables);
u8 AddPseudoFieldObject(u16 graphicsId, void (*callback)(struct Sprite *), s16 x, s16 y, u8 subpriority);
u8 sub_805B410(u8, u8, s16, s16, u8, u8);
void TrySpawnFieldObjects(s16, s16);
void sub_805B710(u16 i, u16 i1);
void sub_805B980(struct MapObject *, u8);
void FieldObjectTurn(struct MapObject *, u8);
void FieldObjectTurnByLocalIdAndMap(u8, u8, u8, u8);
const struct MapObjectGraphicsInfo *GetFieldObjectGraphicsInfo(u8);
void FieldObjectHandleDynamicGraphicsId(struct MapObject *);
void npc_by_local_id_and_map_set_field_1_bit_x20(u8, u8, u8, u8);
void FieldObjectGetLocalIdAndMap(struct MapObject *, void *, void *, void *);
void sub_805BCC0(s16 x, s16 y);
void sub_805BCF0(u8, u8, u8, u8);
void sub_805BD48(u8, u8, u8);
void sub_805BD90(u8 localId, u8 mapNum, u8 mapGroup, s16 x, s16 y);
void gpu_pal_allocator_reset__manage_upper_four(void);
void sub_805BDF8(u16);
u8 sub_805BE58(const struct SpritePalette *);
void pal_patch_for_npc(u16, u16);
u8 FindFieldObjectPaletteIndexByTag(u16);
void npc_load_two_palettes__no_record(u16, u8);
void npc_load_two_palettes__and_record(u16, u8);
void npc_coords_shift(struct MapObject *pObject, s16 x, s16 y);
void sub_805C0F8(u8, u8, u8, s16, s16);
void npc_coords_shift_still(struct MapObject *pObject);
u8 GetFieldObjectIdByXYZ(u16, u16, u8);
void UpdateFieldObjectsForCameraUpdate(s16, s16);
u8 AddCameraObject(u8);
void CameraObjectReset1(void);
u8 * GetFieldObjectScriptPointerByFieldObjectId(u8);
u16 GetFieldObjectFlagIdByFieldObjectId(u8);
u8 FieldObjectGetBerryTreeId(u8);
struct MapObjectTemplate *GetFieldObjectTemplateByLocalIdAndMap(u8, u8, u8);
void sub_805C754(struct MapObject *pObject);
void sub_805C774(struct MapObject *, u8);
void sub_805C78C(u8, u8, u8);
void sub_805C7C4(u8 i);
u8 FieldObjectDirectionToImageAnimId(u8);
u8 get_go_image_anim_num(u8 unk_19);
u8 sub_805FD98(u8);
u8 sub_805FDE8(u8);
u8 sub_805FDF8(u8);
u8 sub_805FE08(u8);
void npc_set_running_behaviour_etc(struct MapObject *, u8);
u8 npc_running_behaviour_by_direction(u8);
u8 GetCollisionAtCoords(struct MapObject *, s16, s16, u32);
u8 sub_8060024(struct MapObject *, s16, s16, u8);
bool8 IsBerryTreeSparkling(u8, u8, u8);
void sub_8060288(u8, u8, u8);
void sub_8060388(s16, s16, s16 *, s16 *);
void sub_80603CC(s16 x, s16 y, s16 *pInt, s16 *pInt1);
void GetFieldObjectMovingCameraOffset(s16 *, s16 *);
void FieldObjectMoveDestCoords(struct MapObject *pObject, u32 unk_19, s16 *pInt, s16 *pInt1);
bool8 FieldObjectIsMovementOverridden(struct MapObject *);
bool8 FieldObjectIsHeldMovementActive(struct MapObject *);
bool8 FieldObjectSetHeldMovement(struct MapObject *, u8);
void FieldObjectForceSetHeldMovement(struct MapObject *pObject, u8 a);
void FieldObjectClearHeldMovementIfActive(struct MapObject *);
void FieldObjectClearHeldMovement(struct MapObject *);
bool8 FieldObjectCheckHeldMovementStatus(struct MapObject *);
u8 FieldObjectClearHeldMovementIfFinished(struct MapObject *);
u8 FieldObjectGetHeldMovementActionId(struct MapObject *);
u8 GetFaceDirectionMovementActionId(u32);
u8 GetSimpleGoAnimId(u32);
u8 GetGoSpeed0MovementActionId(u32);
u8 sub_8060744(u32);
u8 d2s_08064034(u32);
u8 sub_806079C(u32);
u8 sub_80607C8(u32);
u8 sub_80607F4(u32);
u8 GetJumpLedgeAnimId(u32);
u8 sub_806084C(u32);
u8 sub_8060878(u32);
u8 sub_80608A4(u32);
u8 sub_80608D0(u32);
u8 GetStepInPlaceDelay32AnimId(u32);
u8 GetStepInPlaceDelay16MovementActionId(u32);
u8 GetStepInPlaceDelay8AnimId(u32);
u8 GetStepInPlaceDelay4AnimId(u32);
u8 FieldObjectFaceOppositeDirection(struct MapObject *, u8);
u8 sub_80609D8(u8);
u8 sub_8060A04(u8);
u8 sub_8060A30(u8);
u8 sub_8060A5C(u8);
u8 sub_8060A88(u8);
u8 sub_8060AB4(u8);
u8 sub_8060AE0(u8);
u8 sub_8060B0C(u8);
u8 sub_8060B38(u8);
u8 sub_8060B64(u8);
u8 GetOppositeDirection(u8);
void sub_80634D0(struct MapObject *, struct Sprite *);
u8 SpawnSpecialFieldObjectParametrized(u8, u8, u8, s16, s16, u8);
void CameraObjectSetFollowedObjectId(u8);
u8 sub_805ADDC(u8);
void sub_8060320(u32, s16 *, s16 *, s16, s16);
u8 obj_unfreeze(struct Sprite *, s16, s16, u8);
u16 npc_paltag_by_palslot(u8);
void sub_8060470(s16 *, s16 *, s16, s16);
bool8 FreezeMapObject(struct MapObject *);
void FreezeMapObjects(void);
void FreezeMapObjectsExceptOne(u8);
void UnfreezeMapObjects(void);
void sub_806487C(struct Sprite *sprite, bool8 invisible);
void sub_8064990(u8, u8);
void UnfreezeMapObject(struct MapObject *mapObject);
void oamt_npc_ministep_reset(struct Sprite *sprite, u8 a2, u8 a3);
void sub_806467C(struct Sprite *sprite, u8 direction);
bool8 sub_806468C(struct Sprite *sprite);
void sub_80646E4(struct Sprite *sprite, u8 a2, u8 a3, u8 a4);
void DoShadowFieldEffect(struct MapObject *mapObject);
u8 sub_8064704(struct Sprite *);
u8 sub_806478C(struct Sprite *);
void obj_anim_image_set_and_seek(struct Sprite *sprite, u8 a2, u8 a3);
void DoRippleFieldEffect(struct MapObject *mapObj, struct Sprite *sprite);
bool8 IsZCoordMismatchAt(u8 z, s16 x, s16 y);
bool8 AreZCoordsCompatible(u8 z1, u8 z2);
void FieldObjectUpdateMetatileBehaviors(struct MapObject *);
void GetGroundEffectFlags_Reflection(struct MapObject *, u32 *);
void GetGroundEffectFlags_TallGrassOnSpawn(struct MapObject *, u32 *);
void GetGroundEffectFlags_TallGrassOnBeginStep(struct MapObject *, u32 *);
void GetGroundEffectFlags_LongGrassOnSpawn(struct MapObject *, u32 *);
void GetGroundEffectFlags_LongGrassOnBeginStep(struct MapObject *, u32 *);
void GetGroundEffectFlags_Tracks(struct MapObject *, u32 *);
void GetGroundEffectFlags_SandPile(struct MapObject *, u32 *);
void GetGroundEffectFlags_ShallowFlowingWater(struct MapObject *, u32 *);
void GetGroundEffectFlags_Puddle(struct MapObject *, u32 *);
void GetGroundEffectFlags_Ripple(struct MapObject *, u32 *);
void GetGroundEffectFlags_ShortGrass(struct MapObject *, u32 *);
void GetGroundEffectFlags_HotSprings(struct MapObject *, u32 *);
void GetGroundEffectFlags_Seaweed(struct MapObject *, u32 *);
void GetGroundEffectFlags_JumpLanding(struct MapObject *, u32 *);
u8 FieldObjectCheckForReflectiveSurface(struct MapObject *);
u8 GetLedgeJumpDirection(s16, s16, u8);
u8 ZCoordToPriority(u8);
void FieldObjectUpdateZCoord(struct MapObject *pObject);
void SetObjectSubpriorityByZCoord(u8, struct Sprite *, u8);

#endif // GUARD_EVENTOBJMV_H
