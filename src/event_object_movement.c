#include "global.h"
#include "event_object_movement.h"
#include "berry.h"
#include "event_data.h"
#include "field_camera.h"
#include "field_effect.h"
#include "field_effect_helpers.h"
#include "field_player_avatar.h"
#include "fieldmap.h"
#include "palette.h"
#include "random.h"
#include "overworld.h"
#include "sprite.h"
#include "metatile_behavior.h"
#include "trainer_see.h"
#include "constants/field_effects.h"
#include "constants/maps.h"
#include "constants/event_object_movement_constants.h"
#include "constants/event_objects.h"

// this file was known as evobjmv.c in Game Freak's original source

static u8 MovementType_BerryTreeGrowth_Callback(struct EventObject*, struct Sprite*);
static u8 MovementType_Disguise_Callback(struct EventObject*, struct Sprite*);
static u8 MovementType_Hidden_Callback(struct EventObject*, struct Sprite*);
static bool8 IsCoordOutsideEventObjectMovementRange(struct EventObject*, s16, s16);
static bool8 DoesObjectCollideWithObjectAt(struct EventObject*, s16, s16);
static bool8 IsMetatileDirectionallyImpassable(struct EventObject*, s16, s16, u8);
static void ClearEventObjectMovement(struct EventObject*, struct Sprite *sprite);
static void EventObjectSetSingleMovement(struct EventObject*, struct Sprite*, u8);
static u8 EventObjectExecSingleMovementAction(struct EventObject*, struct Sprite*);
static void SetMovementDelay(struct Sprite*, s16);
static u8 WaitForMovementDelay(struct Sprite*);
static u8 GetCollisionInDirection(struct EventObject*, u8);
static void MoveCoordsInDirection(u32, s16 *, s16 *, s16, s16);
static void DoGroundEffects_OnSpawn(struct EventObject*, struct Sprite*);
static void DoGroundEffects_OnBeginStep(struct EventObject*, struct Sprite*);
static void DoGroundEffects_OnFinishStep(struct EventObject*, struct Sprite*);
static void UpdateEventObjectSpriteAnimPause(struct EventObject*, struct Sprite*);
static void TryEnableEventObjectAnim(struct EventObject*, struct Sprite*);
static void EventObjectExecHeldMovementAction(struct EventObject*, struct Sprite*);
static void EventObjectUpdateSubpriority(struct EventObject*, struct Sprite*);
static void UpdateEventObjectVisibility(struct EventObject*, struct Sprite*);
static void UpdateEventObjectIsOffscreen(struct EventObject*, struct Sprite*);
static void UpdateEventObjSpriteVisibility(struct EventObject*, struct Sprite*);
static void nullsub(struct EventObject*, struct Sprite*, u8);
static void DoTracksGroundEffect_Footprints(struct EventObject*, struct Sprite*, u8);
static void DoTracksGroundEffect_BikeTireTracks(struct EventObject*, struct Sprite*, u8);
static u8 GetReflectionTypeByMetatileBehavior(u32);
static void Step1(struct Sprite *sprite, u8 direction);
static void Step2(struct Sprite *sprite, u8 direction);
static void Step3(struct Sprite *sprite, u8 direction);
static void Step4(struct Sprite *sprite, u8 direction);
static void Step8(struct Sprite *sprite, u8 direction);
static void oamt_npc_ministep_reset(struct Sprite*, u8, u8);
static void CameraObject_0(struct Sprite *);
static void CameraObject_1(struct Sprite *);
static void CameraObject_2(struct Sprite *);
static void ObjectCB_CameraObject(struct Sprite *sprite);
static bool8 EventObjectZCoordIsCompatible(struct EventObject*, u8);
static struct EventObjectTemplate *FindEventObjectTemplateByLocalId(u8, struct EventObjectTemplate*, u8);
static void UpdateEventObjectSpriteSubpriorityAndVisibility(struct Sprite *);
static void InitObjectPriorityByZCoord(struct Sprite *sprite, u8 z);
static void CreateReflectionEffectSprites(void);

const u8 gReflectionEffectPaletteMap[] = {1, 1, 6, 7, 8, 9, 6, 7, 8, 9, 11, 11, 0, 0, 0, 0};

const struct SpriteTemplate gCameraSpriteTemplate = {0, 0xFFFF, &gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, ObjectCB_CameraObject};

void (*const gCameraObjectFuncs[])(struct Sprite *) = {
    CameraObject_0,
    CameraObject_1,
    CameraObject_2,
};

#include "data/field_event_obj/event_object_graphics.h"
#include "data/field_event_obj/field_effect_object_graphics.h"

// movement type callbacks
static void (*const sMovementTypeCallbacks[])(struct Sprite *) =
{
    MovementType_None,                        // MOVEMENT_TYPE_NONE
    MovementType_LookAround,                  // MOVEMENT_TYPE_LOOK_AROUND
    MovementType_WanderAround,                // MOVEMENT_TYPE_WANDER_AROUND
    MovementType_WanderUpAndDown,             // MOVEMENT_TYPE_WANDER_UP_AND_DOWN
    MovementType_WanderUpAndDown,             // MOVEMENT_TYPE_WANDER_DOWN_AND_UP
    MovementType_WanderLeftAndRight,          // MOVEMENT_TYPE_WANDER_LEFT_AND_RIGHT
    MovementType_WanderLeftAndRight,          // MOVEMENT_TYPE_WANDER_RIGHT_AND_LEFT
    MovementType_FaceDirection,               // MOVEMENT_TYPE_FACE_UP
    MovementType_FaceDirection,               // MOVEMENT_TYPE_FACE_DOWN
    MovementType_FaceDirection,               // MOVEMENT_TYPE_FACE_LEFT
    MovementType_FaceDirection,               // MOVEMENT_TYPE_FACE_RIGHT
    MovementType_Player,                      // MOVEMENT_TYPE_PLAYER
    MovementType_BerryTreeGrowth,             // MOVEMENT_TYPE_BERRY_TREE_GROWTH
    MovementType_FaceDownAndUp,               // MOVEMENT_TYPE_FACE_DOWN_AND_UP
    MovementType_FaceLeftAndRight,            // MOVEMENT_TYPE_FACE_LEFT_AND_RIGHT
    MovementType_FaceUpAndLeft,               // MOVEMENT_TYPE_FACE_UP_AND_LEFT
    MovementType_FaceUpAndRight,              // MOVEMENT_TYPE_FACE_UP_AND_RIGHT
    MovementType_FaceDownAndLeft,             // MOVEMENT_TYPE_FACE_DOWN_AND_LEFT
    MovementType_FaceDownAndRight,            // MOVEMENT_TYPE_FACE_DOWN_AND_RIGHT
    MovementType_FaceDownUpAndLeft,           // MOVEMENT_TYPE_FACE_DOWN_UP_AND_LEFT
    MovementType_FaceDownUpAndRight,          // MOVEMENT_TYPE_FACE_DOWN_UP_AND_RIGHT
    MovementType_FaceUpLeftAndRight,          // MOVEMENT_TYPE_FACE_UP_LEFT_AND_RIGHT
    MovementType_FaceDownLeftAndRight,        // MOVEMENT_TYPE_FACE_DOWN_LEFT_AND_RIGHT
    MovementType_RotateCounterclockwise,      // MOVEMENT_TYPE_ROTATE_COUNTERCLOCKWISE
    MovementType_RotateClockwise,             // MOVEMENT_TYPE_ROTATE_CLOCKWISE
    MovementType_WalkBackAndForth,            // MOVEMENT_TYPE_WALK_UP_AND_DOWN
    MovementType_WalkBackAndForth,            // MOVEMENT_TYPE_WALK_DOWN_AND_UP
    MovementType_WalkBackAndForth,            // MOVEMENT_TYPE_WALK_LEFT_AND_RIGHT
    MovementType_WalkBackAndForth,            // MOVEMENT_TYPE_WALK_RIGHT_AND_LEFT
    MovementType_WalkSequenceUpRightLeftDown, // MOVEMENT_TYPE_WALK_SEQUENCE_UP_RIGHT_LEFT_DOWN
    MovementType_WalkSequenceRightLeftDownUp, // MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_LEFT_DOWN_UP
    MovementType_WalkSequenceDownUpRightLeft, // MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_UP_RIGHT_LEFT
    MovementType_WalkSequenceLeftDownUpRight, // MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_DOWN_UP_RIGHT
    MovementType_WalkSequenceUpLeftRightDown, // MOVEMENT_TYPE_WALK_SEQUENCE_UP_LEFT_RIGHT_DOWN
    MovementType_WalkSequenceLeftRightDownUp, // MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_RIGHT_DOWN_UP
    MovementType_WalkSequenceDownUpLeftRight, // MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_UP_LEFT_RIGHT
    MovementType_WalkSequenceRightDownUpLeft, // MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_DOWN_UP_LEFT
    MovementType_WalkSequenceLeftUpDownRight, // MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_UP_DOWN_RIGHT
    MovementType_WalkSequenceUpDownRightLeft, // MOVEMENT_TYPE_WALK_SEQUENCE_UP_DOWN_RIGHT_LEFT
    MovementType_WalkSequenceRightLeftUpDown, // MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_LEFT_UP_DOWN
    MovementType_WalkSequenceDownRightLeftUp, // MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_RIGHT_LEFT_UP
    MovementType_WalkSequenceRightUpDownLeft, // MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_UP_DOWN_LEFT
    MovementType_WalkSequenceUpDownLeftRight, // MOVEMENT_TYPE_WALK_SEQUENCE_UP_DOWN_LEFT_RIGHT
    MovementType_WalkSequenceLeftRightUpDown, // MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_RIGHT_UP_DOWN
    MovementType_WalkSequenceDownLeftRightUp, // MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_LEFT_RIGHT_UP
    MovementType_WalkSequenceUpLeftDownRight, // MOVEMENT_TYPE_WALK_SEQUENCE_UP_LEFT_DOWN_RIGHT
    MovementType_WalkSequenceDownRightUpLeft, // MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_RIGHT_UP_LEFT
    MovementType_WalkSequenceLeftDownRightUp, // MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_DOWN_RIGHT_UP
    MovementType_WalkSequenceRightUpLeftDown, // MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_UP_LEFT_DOWN
    MovementType_WalkSequenceUpRightDownLeft, // MOVEMENT_TYPE_WALK_SEQUENCE_UP_RIGHT_DOWN_LEFT
    MovementType_WalkSequenceDownLeftUpRight, // MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_LEFT_UP_RIGHT
    MovementType_WalkSequenceLeftUpRightDown, // MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_UP_RIGHT_DOWN
    MovementType_WalkSequenceRightDownLeftUp, // MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_DOWN_LEFT_UP
    MovementType_CopyPlayer,                  // MOVEMENT_TYPE_COPY_PLAYER
    MovementType_CopyPlayer,                  // MOVEMENT_TYPE_COPY_PLAYER_OPPOSITE
    MovementType_CopyPlayer,                  // MOVEMENT_TYPE_COPY_PLAYER_COUNTERCLOCKWISE
    MovementType_CopyPlayer,                  // MOVEMENT_TYPE_COPY_PLAYER_CLOCKWISE
    MovementType_TreeDisguise,                // MOVEMENT_TYPE_TREE_DISGUISE
    MovementType_MountainDisguise,            // MOVEMENT_TYPE_MOUNTAIN_DISGUISE
    MovementType_CopyPlayerInGrass,           // MOVEMENT_TYPE_COPY_PLAYER_IN_GRASS
    MovementType_CopyPlayerInGrass,           // MOVEMENT_TYPE_COPY_PLAYER_OPPOSITE_IN_GRASS
    MovementType_CopyPlayerInGrass,           // MOVEMENT_TYPE_COPY_PLAYER_COUNTERCLOCKWISE_IN_GRASS
    MovementType_CopyPlayerInGrass,           // MOVEMENT_TYPE_COPY_PLAYER_CLOCKWISE_IN_GRASS
    MovementType_Hidden,                      // MOVEMENT_TYPE_HIDDEN
    MovementType_WalkInPlace,                 // MOVEMENT_TYPE_WALK_IN_PLACE_DOWN
    MovementType_WalkInPlace,                 // MOVEMENT_TYPE_WALK_IN_PLACE_UP
    MovementType_WalkInPlace,                 // MOVEMENT_TYPE_WALK_IN_PLACE_LEFT
    MovementType_WalkInPlace,                 // MOVEMENT_TYPE_WALK_IN_PLACE_RIGHT
    MovementType_JogInPlace,                  // MOVEMENT_TYPE_JOG_IN_PLACE_DOWN
    MovementType_JogInPlace,                  // MOVEMENT_TYPE_JOG_IN_PLACE_UP
    MovementType_JogInPlace,                  // MOVEMENT_TYPE_JOG_IN_PLACE_LEFT
    MovementType_JogInPlace,                  // MOVEMENT_TYPE_JOG_IN_PLACE_RIGHT
    MovementType_RunInPlace,                  // MOVEMENT_TYPE_RUN_IN_PLACE_DOWN
    MovementType_RunInPlace,                  // MOVEMENT_TYPE_RUN_IN_PLACE_UP
    MovementType_RunInPlace,                  // MOVEMENT_TYPE_RUN_IN_PLACE_LEFT
    MovementType_RunInPlace,                  // MOVEMENT_TYPE_RUN_IN_PLACE_RIGHT
    MovementType_Invisible,                   // MOVEMENT_TYPE_INVISIBLE
};

const u8 gRangedMovementTypes[] = {
    0, // MOVEMENT_TYPE_NONE
    0, // MOVEMENT_TYPE_LOOK_AROUND
    1, // MOVEMENT_TYPE_WANDER_AROUND
    1, // MOVEMENT_TYPE_WANDER_UP_AND_DOWN
    1, // MOVEMENT_TYPE_WANDER_DOWN_AND_UP
    1, // MOVEMENT_TYPE_WANDER_LEFT_AND_RIGHT
    1, // MOVEMENT_TYPE_WANDER_RIGHT_AND_LEFT
    0, // MOVEMENT_TYPE_FACE_UP
    0, // MOVEMENT_TYPE_FACE_DOWN
    0, // MOVEMENT_TYPE_FACE_LEFT
    0, // MOVEMENT_TYPE_FACE_RIGHT
    0, // MOVEMENT_TYPE_PLAYER
    0, // MOVEMENT_TYPE_BERRY_TREE_GROWTH
    0, // MOVEMENT_TYPE_FACE_DOWN_AND_UP
    0, // MOVEMENT_TYPE_FACE_LEFT_AND_RIGHT
    0, // MOVEMENT_TYPE_FACE_UP_AND_LEFT
    0, // MOVEMENT_TYPE_FACE_UP_AND_RIGHT
    0, // MOVEMENT_TYPE_FACE_DOWN_AND_LEFT
    0, // MOVEMENT_TYPE_FACE_DOWN_AND_RIGHT
    0, // MOVEMENT_TYPE_FACE_DOWN_UP_AND_LEFT
    0, // MOVEMENT_TYPE_FACE_DOWN_UP_AND_RIGHT
    0, // MOVEMENT_TYPE_FACE_UP_LEFT_AND_RIGHT
    0, // MOVEMENT_TYPE_FACE_DOWN_LEFT_AND_RIGHT
    0, // MOVEMENT_TYPE_ROTATE_COUNTERCLOCKWISE
    0, // MOVEMENT_TYPE_ROTATE_CLOCKWISE
    1, // MOVEMENT_TYPE_WALK_UP_AND_DOWN
    1, // MOVEMENT_TYPE_WALK_DOWN_AND_UP
    1, // MOVEMENT_TYPE_WALK_LEFT_AND_RIGHT
    1, // MOVEMENT_TYPE_WALK_RIGHT_AND_LEFT
    1, // MOVEMENT_TYPE_WALK_SEQUENCE_UP_RIGHT_LEFT_DOWN
    1, // MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_LEFT_DOWN_UP
    1, // MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_UP_RIGHT_LEFT
    1, // MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_DOWN_UP_RIGHT
    1, // MOVEMENT_TYPE_WALK_SEQUENCE_UP_LEFT_RIGHT_DOWN
    1, // MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_RIGHT_DOWN_UP
    1, // MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_UP_LEFT_RIGHT
    1, // MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_DOWN_UP_LEFT
    1, // MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_UP_DOWN_RIGHT
    1, // MOVEMENT_TYPE_WALK_SEQUENCE_UP_DOWN_RIGHT_LEFT
    1, // MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_LEFT_UP_DOWN
    1, // MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_RIGHT_LEFT_UP
    1, // MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_UP_DOWN_LEFT
    1, // MOVEMENT_TYPE_WALK_SEQUENCE_UP_DOWN_LEFT_RIGHT
    1, // MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_RIGHT_UP_DOWN
    1, // MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_LEFT_RIGHT_UP
    1, // MOVEMENT_TYPE_WALK_SEQUENCE_UP_LEFT_DOWN_RIGHT
    1, // MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_RIGHT_UP_LEFT
    1, // MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_DOWN_RIGHT_UP
    1, // MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_UP_LEFT_DOWN
    1, // MOVEMENT_TYPE_WALK_SEQUENCE_UP_RIGHT_DOWN_LEFT
    1, // MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_LEFT_UP_RIGHT
    1, // MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_UP_RIGHT_DOWN
    1, // MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_DOWN_LEFT_UP
    1, // MOVEMENT_TYPE_COPY_PLAYER
    1, // MOVEMENT_TYPE_COPY_PLAYER_OPPOSITE
    1, // MOVEMENT_TYPE_COPY_PLAYER_COUNTERCLOCKWISE
    1, // MOVEMENT_TYPE_COPY_PLAYER_CLOCKWISE
    0, // MOVEMENT_TYPE_TREE_DISGUISE
    0, // MOVEMENT_TYPE_MOUNTAIN_DISGUISE
    1, // MOVEMENT_TYPE_COPY_PLAYER_IN_GRASS
    1, // MOVEMENT_TYPE_COPY_PLAYER_OPPOSITE_IN_GRASS
    1, // MOVEMENT_TYPE_COPY_PLAYER_COUNTERCLOCKWISE_IN_GRASS
    1, // MOVEMENT_TYPE_COPY_PLAYER_CLOCKWISE_IN_GRASS
    0, // MOVEMENT_TYPE_HIDDEN
    0, // MOVEMENT_TYPE_WALK_IN_PLACE_DOWN
    0, // MOVEMENT_TYPE_WALK_IN_PLACE_UP
    0, // MOVEMENT_TYPE_WALK_IN_PLACE_LEFT
    0, // MOVEMENT_TYPE_WALK_IN_PLACE_RIGHT
    0, // MOVEMENT_TYPE_JOG_IN_PLACE_DOWN
    0, // MOVEMENT_TYPE_JOG_IN_PLACE_UP
    0, // MOVEMENT_TYPE_JOG_IN_PLACE_LEFT
    0, // MOVEMENT_TYPE_JOG_IN_PLACE_RIGHT
    0, // MOVEMENT_TYPE_RUN_IN_PLACE_DOWN
    0, // MOVEMENT_TYPE_RUN_IN_PLACE_UP
    0, // MOVEMENT_TYPE_RUN_IN_PLACE_LEFT
    0, // MOVEMENT_TYPE_RUN_IN_PLACE_RIGHT
    0, // MOVEMENT_TYPE_INVISIBLE
};

const u8 gInitialMovementTypeFacingDirections[] = {
    DIR_SOUTH, // MOVEMENT_TYPE_NONE
    DIR_SOUTH, // MOVEMENT_TYPE_LOOK_AROUND
    DIR_SOUTH, // MOVEMENT_TYPE_WANDER_AROUND
    DIR_NORTH, // MOVEMENT_TYPE_WANDER_UP_AND_DOWN
    DIR_SOUTH, // MOVEMENT_TYPE_WANDER_DOWN_AND_UP
    DIR_WEST,  // MOVEMENT_TYPE_WANDER_LEFT_AND_RIGHT
    DIR_EAST,  // MOVEMENT_TYPE_WANDER_RIGHT_AND_LEFT
    DIR_NORTH, // MOVEMENT_TYPE_FACE_UP
    DIR_SOUTH, // MOVEMENT_TYPE_FACE_DOWN
    DIR_WEST,  // MOVEMENT_TYPE_FACE_LEFT
    DIR_EAST,  // MOVEMENT_TYPE_FACE_RIGHT
    DIR_SOUTH, // MOVEMENT_TYPE_PLAYER
    DIR_SOUTH, // MOVEMENT_TYPE_BERRY_TREE_GROWTH
    DIR_SOUTH, // MOVEMENT_TYPE_FACE_DOWN_AND_UP
    DIR_WEST,  // MOVEMENT_TYPE_FACE_LEFT_AND_RIGHT
    DIR_NORTH, // MOVEMENT_TYPE_FACE_UP_AND_LEFT
    DIR_NORTH, // MOVEMENT_TYPE_FACE_UP_AND_RIGHT
    DIR_SOUTH, // MOVEMENT_TYPE_FACE_DOWN_AND_LEFT
    DIR_SOUTH, // MOVEMENT_TYPE_FACE_DOWN_AND_RIGHT
    DIR_SOUTH, // MOVEMENT_TYPE_FACE_DOWN_UP_AND_LEFT
    DIR_SOUTH, // MOVEMENT_TYPE_FACE_DOWN_UP_AND_RIGHT
    DIR_NORTH, // MOVEMENT_TYPE_FACE_UP_LEFT_AND_RIGHT
    DIR_SOUTH, // MOVEMENT_TYPE_FACE_DOWN_LEFT_AND_RIGHT
    DIR_SOUTH, // MOVEMENT_TYPE_ROTATE_COUNTERCLOCKWISE
    DIR_SOUTH, // MOVEMENT_TYPE_ROTATE_CLOCKWISE
    DIR_NORTH, // MOVEMENT_TYPE_WALK_UP_AND_DOWN
    DIR_SOUTH, // MOVEMENT_TYPE_WALK_DOWN_AND_UP
    DIR_WEST,  // MOVEMENT_TYPE_WALK_LEFT_AND_RIGHT
    DIR_EAST,  // MOVEMENT_TYPE_WALK_RIGHT_AND_LEFT
    DIR_NORTH, // MOVEMENT_TYPE_WALK_SEQUENCE_UP_RIGHT_LEFT_DOWN
    DIR_EAST,  // MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_LEFT_DOWN_UP
    DIR_SOUTH, // MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_UP_RIGHT_LEFT
    DIR_WEST,  // MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_DOWN_UP_RIGHT
    DIR_NORTH, // MOVEMENT_TYPE_WALK_SEQUENCE_UP_LEFT_RIGHT_DOWN
    DIR_WEST,  // MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_RIGHT_DOWN_UP
    DIR_SOUTH, // MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_UP_LEFT_RIGHT
    DIR_EAST,  // MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_DOWN_UP_LEFT
    DIR_WEST,  // MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_UP_DOWN_RIGHT
    DIR_NORTH, // MOVEMENT_TYPE_WALK_SEQUENCE_UP_DOWN_RIGHT_LEFT
    DIR_EAST,  // MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_LEFT_UP_DOWN
    DIR_SOUTH, // MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_RIGHT_LEFT_UP
    DIR_EAST,  // MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_UP_DOWN_LEFT
    DIR_NORTH, // MOVEMENT_TYPE_WALK_SEQUENCE_UP_DOWN_LEFT_RIGHT
    DIR_WEST,  // MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_RIGHT_UP_DOWN
    DIR_SOUTH, // MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_LEFT_RIGHT_UP
    DIR_NORTH, // MOVEMENT_TYPE_WALK_SEQUENCE_UP_LEFT_DOWN_RIGHT
    DIR_SOUTH, // MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_RIGHT_UP_LEFT
    DIR_WEST,  // MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_DOWN_RIGHT_UP
    DIR_EAST,  // MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_UP_LEFT_DOWN
    DIR_NORTH, // MOVEMENT_TYPE_WALK_SEQUENCE_UP_RIGHT_DOWN_LEFT
    DIR_SOUTH, // MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_LEFT_UP_RIGHT
    DIR_WEST,  // MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_UP_RIGHT_DOWN
    DIR_EAST,  // MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_DOWN_LEFT_UP
    DIR_NORTH, // MOVEMENT_TYPE_COPY_PLAYER
    DIR_SOUTH, // MOVEMENT_TYPE_COPY_PLAYER_OPPOSITE
    DIR_WEST,  // MOVEMENT_TYPE_COPY_PLAYER_COUNTERCLOCKWISE
    DIR_EAST,  // MOVEMENT_TYPE_COPY_PLAYER_CLOCKWISE
    DIR_SOUTH, // MOVEMENT_TYPE_TREE_DISGUISE
    DIR_SOUTH, // MOVEMENT_TYPE_MOUNTAIN_DISGUISE
    DIR_NORTH, // MOVEMENT_TYPE_COPY_PLAYER_IN_GRASS
    DIR_SOUTH, // MOVEMENT_TYPE_COPY_PLAYER_OPPOSITE_IN_GRASS
    DIR_WEST,  // MOVEMENT_TYPE_COPY_PLAYER_COUNTERCLOCKWISE_IN_GRASS
    DIR_EAST,  // MOVEMENT_TYPE_COPY_PLAYER_CLOCKWISE_IN_GRASS
    DIR_SOUTH, // MOVEMENT_TYPE_HIDDEN
    DIR_SOUTH, // MOVEMENT_TYPE_WALK_IN_PLACE_DOWN
    DIR_NORTH, // MOVEMENT_TYPE_WALK_IN_PLACE_UP
    DIR_WEST,  // MOVEMENT_TYPE_WALK_IN_PLACE_LEFT
    DIR_EAST,  // MOVEMENT_TYPE_WALK_IN_PLACE_RIGHT
    DIR_SOUTH, // MOVEMENT_TYPE_JOG_IN_PLACE_DOWN
    DIR_NORTH, // MOVEMENT_TYPE_JOG_IN_PLACE_UP
    DIR_WEST,  // MOVEMENT_TYPE_JOG_IN_PLACE_LEFT
    DIR_EAST,  // MOVEMENT_TYPE_JOG_IN_PLACE_RIGHT
    DIR_SOUTH, // MOVEMENT_TYPE_RUN_IN_PLACE_DOWN
    DIR_NORTH, // MOVEMENT_TYPE_RUN_IN_PLACE_UP
    DIR_WEST,  // MOVEMENT_TYPE_RUN_IN_PLACE_LEFT
    DIR_EAST,  // MOVEMENT_TYPE_RUN_IN_PLACE_RIGHT
    DIR_SOUTH, // MOVEMENT_TYPE_INVISIBLE
};

#include "data/field_event_obj/event_object_graphics_info_pointers.h"
#include "data/field_event_obj/field_effect_object_template_pointers.h"
#include "data/field_event_obj/event_object_pic_tables.h"
#include "data/field_event_obj/event_object_anims.h"
#include "data/field_event_obj/base_oam.h"
#include "data/field_event_obj/event_object_subsprites.h"
#include "data/field_event_obj/event_object_graphics_info.h"

const struct SpritePalette sEventObjectSpritePalettes[] = {
    {gEventObjectPalette0, 0x1103},
    {gEventObjectPalette1, 0x1104},
    {gEventObjectPalette2, 0x1105},
    {gEventObjectPalette3, 0x1106},
    {gEventObjectPalette4, 0x1107},
    {gEventObjectPalette5, 0x1108},
    {gEventObjectPalette6, 0x1109},
    {gEventObjectPalette7, 0x110A},
    {gEventObjectPalette8, 0x1100},
    {gEventObjectPalette9, 0x1101},
    {gEventObjectPalette10, 0x1102},
    {gEventObjectPalette11, 0x1115},
    {gEventObjectPalette12, 0x110B},
    {gEventObjectPalette13, 0x110C},
    {gEventObjectPalette14, 0x110D},
    {gEventObjectPalette15, 0x110E},
    {gEventObjectPalette16, 0x110F},
    {gEventObjectPalette17, 0x1110},
    {gEventObjectPalette18, 0x1111},
    {gEventObjectPalette19, 0x1112},
    {gEventObjectPalette20, 0x1113},
    {gEventObjectPalette21, 0x1114},
    {gEventObjectPalette22, 0x1116},
    {gEventObjectPalette23, 0x1117},
    {gEventObjectPalette24, 0x1118},
    {gEventObjectPalette25, 0x1119},
    {gEventObjectPalette26, 0x111A},
    {NULL,                0x0000}
};

const u16 gPlayerReflectionPaletteTags[] = {
    0x1101,
    0x1101,
    0x1101,
    0x1101
};

// These were probably intended to be used for the female player's reflection.
const u16 gUnusedPlayerReflectionPaletteTags[] = {
    0x1111,
    0x1111,
    0x1111,
    0x1111
};

const u16 gPlayerUnderwaterReflectionPaletteTags[] = {
    0x1115,
    0x1115,
    0x1115,
    0x1115
};

const struct ReflectionPaletteSet gPlayerReflectionPaletteSets[] = {
    {0x1100, gPlayerReflectionPaletteTags},
    {0x1110, gPlayerReflectionPaletteTags},
    {0x1115, gPlayerUnderwaterReflectionPaletteTags},
    {0x11FF, NULL}
};

const u16 gQuintyPlumpReflectionPaletteTags[] = {
    0x110C,
    0x110C,
    0x110C,
    0x110C
};

const u16 gTruckReflectionPaletteTags[] = {
    0x110D,
    0x110D,
    0x110D,
    0x110D
};

const u16 gMachokeMoverReflectionPaletteTags[] = {
    0x110E,
    0x110E,
    0x110E,
    0x110E
};

const u16 gMovingBoxReflectionPaletteTags[] = {
    0x1112,
    0x1112,
    0x1112,
    0x1112
};

const u16 gCableCarReflectionPaletteTags[] = {
    0x1113,
    0x1113,
    0x1113,
    0x1113
};

const u16 gSSTidalReflectionPaletteTags[] = {
    0x1114,
    0x1114,
    0x1114,
    0x1114
};

const u16 gSubmarineShadowReflectionPaletteTags[] = {
    0x111A,
    0x111A,
    0x111A,
    0x111A
};

const u16 gKyogre2ReflectionPaletteTags[] = {
    0x1117,
    0x1117,
    0x1117,
    0x1117
};

const u16 gGroudon2ReflectionPaletteTags[] = {
    0x1119,
    0x1119,
    0x1119,
    0x1119
};

const u16 gInvisibleKecleonReflectionPaletteTags[] = {
    0x1109,
    0x1109,
    0x1109,
    0x1109
};

const struct ReflectionPaletteSet gSpecialObjectReflectionPaletteSets[] = {
    {0x1100, gPlayerReflectionPaletteTags},
    {0x1110, gPlayerReflectionPaletteTags},
    {0x110B, gQuintyPlumpReflectionPaletteTags},
    {0x110D, gTruckReflectionPaletteTags},
    {0x110E, gMachokeMoverReflectionPaletteTags},
    {0x1112, gMovingBoxReflectionPaletteTags},
    {0x1113, gCableCarReflectionPaletteTags},
    {0x1114, gSSTidalReflectionPaletteTags},
    {0x1116, gKyogre2ReflectionPaletteTags},
    {0x1118, gGroudon2ReflectionPaletteTags},
    {0x1105, gInvisibleKecleonReflectionPaletteTags},
    {0x111A, gSubmarineShadowReflectionPaletteTags},
    {0x11FF, NULL}
};

const u16 gObjectPaletteTags0[] = {
    0x1100,
    0x1101,
    0x1103,
    0x1104,
    0x1105,
    0x1106,
    0x1107,
    0x1108,
    0x1109,
    0x110A
};

const u16 gObjectPaletteTags1[] = {
    0x1100,
    0x1101,
    0x1103,
    0x1104,
    0x1105,
    0x1106,
    0x1107,
    0x1108,
    0x1109,
    0x110A
};

const u16 gObjectPaletteTags2[] = {
    0x1100,
    0x1101,
    0x1103,
    0x1104,
    0x1105,
    0x1106,
    0x1107,
    0x1108,
    0x1109,
    0x110A
};

const u16 gObjectPaletteTags3[] = {
    0x1100,
    0x1101,
    0x1103,
    0x1104,
    0x1105,
    0x1106,
    0x1107,
    0x1108,
    0x1109,
    0x110A
};

const u16 *const gObjectPaletteTagSets[] = {
    gObjectPaletteTags0,
    gObjectPaletteTags1,
    gObjectPaletteTags2,
    gObjectPaletteTags3
};

#include "data/field_event_obj/berry_tree_graphics_tables.h"
#include "data/field_event_obj/field_effect_objects.h"

const s16 gMovementDelaysMedium[] = {32, 64,  96, 128};
const s16 gMovementDelaysLong[] =   {32, 64, 128, 192};
const s16 gMovementDelaysShort[] =  {32, 48,  64,  80};

#include "data/field_event_obj/movement_type_func_tables.h"

const u8 gFaceDirectionAnimNums[] = {
    0, // DIR_NONE
    0, // DIR_SOUTH
    1, // DIR_NORTH
    2, // DIR_WEST
    3, // DIR_EAST
    0, // DIR_SOUTHWEST
    0, // DIR_SOUTHEAST
    1, // DIR_NORTHWEST
    1, // DIR_NORTHEAST
};
const u8 gMoveDirectionAnimNums[] = {
    4, // DIR_NONE
    4, // DIR_SOUTH
    5, // DIR_NORTH
    6, // DIR_WEST
    7, // DIR_EAST
    4, // DIR_SOUTHWEST
    4, // DIR_SOUTHEAST
    5, // DIR_NORTHWEST
    5, // DIR_NORTHEAST
};
const u8 gMoveDirectionFastAnimNums[] = {
    8,  // DIR_NONE
    8,  // DIR_SOUTH
    9,  // DIR_NORTH
    10, // DIR_WEST
    11, // DIR_EAST
    8,  // DIR_SOUTHWEST
    8,  // DIR_SOUTHEAST
    9,  // DIR_NORTHWEST
    9,  // DIR_NORTHEAST
};
const u8 gMoveDirectionFasterAnimNums[] = {
    12, // DIR_NONE
    12, // DIR_SOUTH
    13, // DIR_NORTH
    14, // DIR_WEST
    15, // DIR_EAST
    12, // DIR_SOUTHWEST
    12, // DIR_SOUTHEAST
    13, // DIR_NORTHWEST
    13, // DIR_NORTHEAST
};
const u8 gMoveDirectionFastestAnimNums[] = {
    16, // DIR_NONE
    16, // DIR_SOUTH
    17, // DIR_NORTH
    18, // DIR_WEST
    19, // DIR_EAST
    16, // DIR_SOUTHWEST
    16, // DIR_SOUTHEAST
    17, // DIR_NORTHWEST
    17, // DIR_NORTHEAST
};
const u8 gJumpSpecialDirectionAnimNums[] = { // used for jumping onto surf mon
    20, // DIR_NONE
    20, // DIR_SOUTH
    21, // DIR_NORTH
    22, // DIR_WEST
    23, // DIR_EAST
    20, // DIR_SOUTHWEST
    20, // DIR_SOUTHEAST
    21, // DIR_NORTHWEST
    21, // DIR_NORTHEAST
};
const u8 gAcroWheelieDirectionAnimNums[] = {
    20, // DIR_NONE
    20, // DIR_SOUTH
    21, // DIR_NORTH
    22, // DIR_WEST
    23, // DIR_EAST
    20, // DIR_SOUTHWEST
    20, // DIR_SOUTHEAST
    21, // DIR_NORTHWEST
    21, // DIR_NORTHEAST
};
const u8 gUnrefAnimNums_08375633[] = {
    24, // DIR_NONE
    24, // DIR_SOUTH
    25, // DIR_NORTH
    26, // DIR_WEST
    27, // DIR_EAST
    24, // DIR_SOUTHWEST
    24, // DIR_SOUTHEAST
    25, // DIR_NORTHWEST
    25, // DIR_NORTHEAST
};
const u8 gAcroEndWheelieDirectionAnimNums[] = {
    28, // DIR_NONE
    28, // DIR_SOUTH
    29, // DIR_NORTH
    30, // DIR_WEST
    31, // DIR_EAST
    28, // DIR_SOUTHWEST
    28, // DIR_SOUTHEAST
    29, // DIR_NORTHWEST
    29, // DIR_NORTHEAST
};
const u8 gAcroUnusedActionDirectionAnimNums[] = {
    32, // DIR_NONE
    32, // DIR_SOUTH
    33, // DIR_NORTH
    34, // DIR_WEST
    35, // DIR_EAST
    32, // DIR_SOUTHWEST
    32, // DIR_SOUTHEAST
    33, // DIR_NORTHWEST
    33, // DIR_NORTHEAST
};
const u8 gAcroWheeliePedalDirectionAnimNums[] = {
    36, // DIR_NONE
    36, // DIR_SOUTH
    37, // DIR_NORTH
    38, // DIR_WEST
    39, // DIR_EAST
    36, // DIR_SOUTHWEST
    36, // DIR_SOUTHEAST
    37, // DIR_NORTHWEST
    37, // DIR_NORTHEAST
};
const u8 gFishingDirectionAnimNums[] = {
    0, // DIR_NONE
    0, // DIR_SOUTH
    1, // DIR_NORTH
    2, // DIR_WEST
    3, // DIR_EAST
    0, // DIR_SOUTHWEST
    0, // DIR_SOUTHEAST
    1, // DIR_NORTHWEST
    1, // DIR_NORTHEAST
};
const u8 gFishingNoCatchDirectionAnimNums[] = {
    4, // DIR_NONE
    4, // DIR_SOUTH
    5, // DIR_NORTH
    6, // DIR_WEST
    7, // DIR_EAST
    4, // DIR_SOUTHWEST
    4, // DIR_SOUTHEAST
    5, // DIR_NORTHWEST
    5, // DIR_NORTHEAST
};
const u8 gFishingBiteDirectionAnimNums[] = {
    8,  // DIR_NONE
    8,  // DIR_SOUTH
    9,  // DIR_NORTH
    10, // DIR_WEST
    11, // DIR_EAST
    8,  // DIR_SOUTHWEST
    8,  // DIR_SOUTHEAST
    9,  // DIR_NORTHWEST
    9,  // DIR_NORTHEAST
};
const u8 gRunningDirectionAnimNums[] = {
    20, // DIR_NONE
    20, // DIR_SOUTH
    21, // DIR_NORTH
    22, // DIR_WEST
    23, // DIR_EAST
    20, // DIR_SOUTHWEST
    20, // DIR_SOUTHEAST
    21, // DIR_NORTHWEST
    21, // DIR_NORTHEAST
};

const u8 gTrainerFacingDirectionMovementTypes[] = {
    MOVEMENT_TYPE_FACE_DOWN,  // DIR_NONE
    MOVEMENT_TYPE_FACE_DOWN,  // DIR_SOUTH
    MOVEMENT_TYPE_FACE_UP,    // DIR_NORTH
    MOVEMENT_TYPE_FACE_LEFT,  // DIR_WEST
    MOVEMENT_TYPE_FACE_RIGHT, // DIR_EAST
    MOVEMENT_TYPE_FACE_DOWN,  // DIR_SOUTHWEST
    MOVEMENT_TYPE_FACE_DOWN,  // DIR_SOUTHEAST
    MOVEMENT_TYPE_FACE_UP,    // DIR_NORTHWEST
    MOVEMENT_TYPE_FACE_UP,    // DIR_NORTHEAST
};

bool8 (*const gOppositeDirectionBlockedMetatileFuncs[])(u8) = {
    MetatileBehavior_IsSouthBlocked,
    MetatileBehavior_IsNorthBlocked,
    MetatileBehavior_IsWestBlocked,
    MetatileBehavior_IsEastBlocked
};

bool8 (*const gDirectionBlockedMetatileFuncs[])(u8) = {
    MetatileBehavior_IsNorthBlocked,
    MetatileBehavior_IsSouthBlocked,
    MetatileBehavior_IsEastBlocked,
    MetatileBehavior_IsWestBlocked
};

static const struct Coords16 sDirectionToVectors[] = {
    { 0,  0},
    { 0,  1},
    { 0, -1},
    {-1,  0},
    { 1,  0},
    {-1,  1},
    { 1,  1},
    {-1, -1},
    { 1, -1}
};

const u8 gFaceDirectionMovementActions[] = {
    MOVEMENT_ACTION_FACE_DOWN,
    MOVEMENT_ACTION_FACE_DOWN,
    MOVEMENT_ACTION_FACE_UP,
    MOVEMENT_ACTION_FACE_LEFT,
    MOVEMENT_ACTION_FACE_RIGHT,
};
const u8 gWalkSlowMovementActions[] = {
    MOVEMENT_ACTION_WALK_SLOW_DOWN,
    MOVEMENT_ACTION_WALK_SLOW_DOWN,
    MOVEMENT_ACTION_WALK_SLOW_UP,
    MOVEMENT_ACTION_WALK_SLOW_LEFT,
    MOVEMENT_ACTION_WALK_SLOW_RIGHT,
};
const u8 gWalkNormalMovementActions[] = {
    MOVEMENT_ACTION_WALK_NORMAL_DOWN,
    MOVEMENT_ACTION_WALK_NORMAL_DOWN,
    MOVEMENT_ACTION_WALK_NORMAL_UP,
    MOVEMENT_ACTION_WALK_NORMAL_LEFT,
    MOVEMENT_ACTION_WALK_NORMAL_RIGHT,
};
const u8 gWalkFastMovementActions[] = {
    MOVEMENT_ACTION_WALK_FAST_DOWN,
    MOVEMENT_ACTION_WALK_FAST_DOWN,
    MOVEMENT_ACTION_WALK_FAST_UP,
    MOVEMENT_ACTION_WALK_FAST_LEFT,
    MOVEMENT_ACTION_WALK_FAST_RIGHT,
};
const u8 gRideWaterCurrentMovementActions[] = {
    MOVEMENT_ACTION_RIDE_WATER_CURRENT_DOWN,
    MOVEMENT_ACTION_RIDE_WATER_CURRENT_DOWN,
    MOVEMENT_ACTION_RIDE_WATER_CURRENT_UP,
    MOVEMENT_ACTION_RIDE_WATER_CURRENT_LEFT,
    MOVEMENT_ACTION_RIDE_WATER_CURRENT_RIGHT,
};
const u8 gWalkFastestMovementActions[] = {
    MOVEMENT_ACTION_WALK_FASTEST_DOWN,
    MOVEMENT_ACTION_WALK_FASTEST_DOWN,
    MOVEMENT_ACTION_WALK_FASTEST_UP,
    MOVEMENT_ACTION_WALK_FASTEST_LEFT,
    MOVEMENT_ACTION_WALK_FASTEST_RIGHT,
};
const u8 gSlideMovementActions[] = {
    MOVEMENT_ACTION_SLIDE_DOWN,
    MOVEMENT_ACTION_SLIDE_DOWN,
    MOVEMENT_ACTION_SLIDE_UP,
    MOVEMENT_ACTION_SLIDE_LEFT,
    MOVEMENT_ACTION_SLIDE_RIGHT,
};
const u8 gPlayerRunMovementActions[] = {
    MOVEMENT_ACTION_PLAYER_RUN_DOWN,
    MOVEMENT_ACTION_PLAYER_RUN_DOWN,
    MOVEMENT_ACTION_PLAYER_RUN_UP,
    MOVEMENT_ACTION_PLAYER_RUN_LEFT,
    MOVEMENT_ACTION_PLAYER_RUN_RIGHT,
};
const u8 gJump2MovementActions[] = {
    MOVEMENT_ACTION_JUMP_2_DOWN,
    MOVEMENT_ACTION_JUMP_2_DOWN,
    MOVEMENT_ACTION_JUMP_2_UP,
    MOVEMENT_ACTION_JUMP_2_LEFT,
    MOVEMENT_ACTION_JUMP_2_RIGHT,
};
const u8 gJumpInPlaceMovementActions[] = {
    MOVEMENT_ACTION_JUMP_IN_PLACE_DOWN,
    MOVEMENT_ACTION_JUMP_IN_PLACE_DOWN,
    MOVEMENT_ACTION_JUMP_IN_PLACE_UP,
    MOVEMENT_ACTION_JUMP_IN_PLACE_LEFT,
    MOVEMENT_ACTION_JUMP_IN_PLACE_RIGHT,
};
const u8 gJumpInPlaceTurnAroundMovementActions[] = {
    MOVEMENT_ACTION_JUMP_IN_PLACE_UP_DOWN,
    MOVEMENT_ACTION_JUMP_IN_PLACE_UP_DOWN,
    MOVEMENT_ACTION_JUMP_IN_PLACE_DOWN_UP,
    MOVEMENT_ACTION_JUMP_IN_PLACE_RIGHT_LEFT,
    MOVEMENT_ACTION_JUMP_IN_PLACE_LEFT_RIGHT,
};
const u8 gJumpMovementActions[] = {
    MOVEMENT_ACTION_JUMP_DOWN,
    MOVEMENT_ACTION_JUMP_DOWN,
    MOVEMENT_ACTION_JUMP_UP,
    MOVEMENT_ACTION_JUMP_LEFT,
    MOVEMENT_ACTION_JUMP_RIGHT,
};
const u8 gJumpSpecialMovementActions[] = {
    MOVEMENT_ACTION_JUMP_SPECIAL_DOWN,
    MOVEMENT_ACTION_JUMP_SPECIAL_DOWN,
    MOVEMENT_ACTION_JUMP_SPECIAL_UP,
    MOVEMENT_ACTION_JUMP_SPECIAL_LEFT,
    MOVEMENT_ACTION_JUMP_SPECIAL_RIGHT,
};
const u8 gWalkInPlaceSlowMovementActions[] = {
    MOVEMENT_ACTION_WALK_IN_PLACE_SLOW_DOWN,
    MOVEMENT_ACTION_WALK_IN_PLACE_SLOW_DOWN,
    MOVEMENT_ACTION_WALK_IN_PLACE_SLOW_UP,
    MOVEMENT_ACTION_WALK_IN_PLACE_SLOW_LEFT,
    MOVEMENT_ACTION_WALK_IN_PLACE_SLOW_RIGHT,
};
const u8 gWalkInPlaceNormalMovementActions[] = {
    MOVEMENT_ACTION_WALK_IN_PLACE_NORMAL_DOWN,
    MOVEMENT_ACTION_WALK_IN_PLACE_NORMAL_DOWN,
    MOVEMENT_ACTION_WALK_IN_PLACE_NORMAL_UP,
    MOVEMENT_ACTION_WALK_IN_PLACE_NORMAL_LEFT,
    MOVEMENT_ACTION_WALK_IN_PLACE_NORMAL_RIGHT,
};
const u8 gWalkInPlaceFastMovementActions[] = {
    MOVEMENT_ACTION_WALK_IN_PLACE_FAST_DOWN,
    MOVEMENT_ACTION_WALK_IN_PLACE_FAST_DOWN,
    MOVEMENT_ACTION_WALK_IN_PLACE_FAST_UP,
    MOVEMENT_ACTION_WALK_IN_PLACE_FAST_LEFT,
    MOVEMENT_ACTION_WALK_IN_PLACE_FAST_RIGHT,
};
const u8 gWalkInPlaceFastestMovementActions[] = {
    MOVEMENT_ACTION_WALK_IN_PLACE_FASTEST_DOWN,
    MOVEMENT_ACTION_WALK_IN_PLACE_FASTEST_DOWN,
    MOVEMENT_ACTION_WALK_IN_PLACE_FASTEST_UP,
    MOVEMENT_ACTION_WALK_IN_PLACE_FASTEST_LEFT,
    MOVEMENT_ACTION_WALK_IN_PLACE_FASTEST_RIGHT,
};
const u8 gAcroWheelieFaceDirectionMovementActions[] = {
    MOVEMENT_ACTION_ACRO_WHEELIE_FACE_DOWN,
    MOVEMENT_ACTION_ACRO_WHEELIE_FACE_DOWN,
    MOVEMENT_ACTION_ACRO_WHEELIE_FACE_UP,
    MOVEMENT_ACTION_ACRO_WHEELIE_FACE_LEFT,
    MOVEMENT_ACTION_ACRO_WHEELIE_FACE_RIGHT,
};
const u8 gAcroPopWheelieFaceDirectionMovementActions[] = {
    MOVEMENT_ACTION_ACRO_POP_WHEELIE_DOWN,
    MOVEMENT_ACTION_ACRO_POP_WHEELIE_DOWN,
    MOVEMENT_ACTION_ACRO_POP_WHEELIE_UP,
    MOVEMENT_ACTION_ACRO_POP_WHEELIE_LEFT,
    MOVEMENT_ACTION_ACRO_POP_WHEELIE_RIGHT,
};
const u8 gAcroEndWheelieFaceDirectionMovementActions[] = {
    MOVEMENT_ACTION_ACRO_END_WHEELIE_FACE_DOWN,
    MOVEMENT_ACTION_ACRO_END_WHEELIE_FACE_DOWN,
    MOVEMENT_ACTION_ACRO_END_WHEELIE_FACE_UP,
    MOVEMENT_ACTION_ACRO_END_WHEELIE_FACE_LEFT,
    MOVEMENT_ACTION_ACRO_END_WHEELIE_FACE_RIGHT,
};
const u8 gAcroWheelieHopFaceDirectionMovementActions[] = {
    MOVEMENT_ACTION_ACRO_WHEELIE_HOP_FACE_DOWN,
    MOVEMENT_ACTION_ACRO_WHEELIE_HOP_FACE_DOWN,
    MOVEMENT_ACTION_ACRO_WHEELIE_HOP_FACE_UP,
    MOVEMENT_ACTION_ACRO_WHEELIE_HOP_FACE_LEFT,
    MOVEMENT_ACTION_ACRO_WHEELIE_HOP_FACE_RIGHT,
};
const u8 gAcroWheelieHopDirectionMovementActions[] = {
    MOVEMENT_ACTION_ACRO_WHEELIE_HOP_DOWN,
    MOVEMENT_ACTION_ACRO_WHEELIE_HOP_DOWN,
    MOVEMENT_ACTION_ACRO_WHEELIE_HOP_UP,
    MOVEMENT_ACTION_ACRO_WHEELIE_HOP_LEFT,
    MOVEMENT_ACTION_ACRO_WHEELIE_HOP_RIGHT,
};
const u8 gAcroWheelieJumpDirectionMovementActions[] = {
    MOVEMENT_ACTION_ACRO_WHEELIE_JUMP_DOWN,
    MOVEMENT_ACTION_ACRO_WHEELIE_JUMP_DOWN,
    MOVEMENT_ACTION_ACRO_WHEELIE_JUMP_UP,
    MOVEMENT_ACTION_ACRO_WHEELIE_JUMP_LEFT,
    MOVEMENT_ACTION_ACRO_WHEELIE_JUMP_RIGHT,
};
const u8 gAcroWheelieInPlaceDirectionMovementActions[] = {
    MOVEMENT_ACTION_ACRO_WHEELIE_IN_PLACE_DOWN,
    MOVEMENT_ACTION_ACRO_WHEELIE_IN_PLACE_DOWN,
    MOVEMENT_ACTION_ACRO_WHEELIE_IN_PLACE_UP,
    MOVEMENT_ACTION_ACRO_WHEELIE_IN_PLACE_LEFT,
    MOVEMENT_ACTION_ACRO_WHEELIE_IN_PLACE_RIGHT,
};
const u8 gAcroPopWheelieMoveDirectionMovementActions[] = {
    MOVEMENT_ACTION_ACRO_POP_WHEELIE_MOVE_DOWN,
    MOVEMENT_ACTION_ACRO_POP_WHEELIE_MOVE_DOWN,
    MOVEMENT_ACTION_ACRO_POP_WHEELIE_MOVE_UP,
    MOVEMENT_ACTION_ACRO_POP_WHEELIE_MOVE_LEFT,
    MOVEMENT_ACTION_ACRO_POP_WHEELIE_MOVE_RIGHT,
};
const u8 gAcroWheelieMoveDirectionMovementActions[] = {
    MOVEMENT_ACTION_ACRO_WHEELIE_MOVE_DOWN,
    MOVEMENT_ACTION_ACRO_WHEELIE_MOVE_DOWN,
    MOVEMENT_ACTION_ACRO_WHEELIE_MOVE_UP,
    MOVEMENT_ACTION_ACRO_WHEELIE_MOVE_LEFT,
    MOVEMENT_ACTION_ACRO_WHEELIE_MOVE_RIGHT,
};
const u8 gAcroEndWheelieMoveDirectionMovementActions[] = {
    MOVEMENT_ACTION_ACRO_END_WHEELIE_MOVE_DOWN,
    MOVEMENT_ACTION_ACRO_END_WHEELIE_MOVE_DOWN,
    MOVEMENT_ACTION_ACRO_END_WHEELIE_MOVE_UP,
    MOVEMENT_ACTION_ACRO_END_WHEELIE_MOVE_LEFT,
    MOVEMENT_ACTION_ACRO_END_WHEELIE_MOVE_RIGHT,
};

const u8 gOppositeDirections[] = {
    DIR_NORTH,
    DIR_SOUTH,
    DIR_EAST,
    DIR_WEST,
    DIR_NORTHEAST,
    DIR_NORTHWEST,
    DIR_SOUTHEAST,
    DIR_SOUTHWEST
};

const u8 gUnknown_08375757[][4] = {
    {2, 1, 4, 3},
    {1, 2, 3, 4},
    {3, 4, 2, 1},
    {4, 3, 1, 2}
};

const u8 gUnknown_08375767[][4] = {
    {2, 1, 4, 3},
    {1, 2, 3, 4},
    {4, 3, 1, 2},
    {3, 4, 2, 1}
};

#include "data/field_event_obj/movement_action_func_tables.h"

// There is code supporing multiple sets of player reflection palettes, but
// the data for each is identical. Perhaps non-water/ice reflections were planned.
static u8 sCurrentReflectionType;

static u16 sCurrentSpecialObjectPaletteTag;

extern struct LinkPlayerEventObject gLinkPlayerEventObjects[];
extern u8 gReservedSpritePaletteCount;
extern struct Camera gCamera;
extern struct EventObject gEventObjects[16];
#if DEBUG
u8 gUnknown_Debug_03004BC0;
#endif

static void ClearEventObject(struct EventObject *eventObj)
{
    memset(eventObj, 0, sizeof(struct EventObject));
    eventObj->localId = 0xFF;
    eventObj->mapNum = 0xFF;
    eventObj->mapGroup = 0xFF;
    eventObj->movementActionId = 0xFF;
}

static void ClearAllEventObjects(void)
{
    u8 i;

    for (i = 0; i < 16; i++)
        ClearEventObject(&gEventObjects[i]);
#if DEBUG
    gUnknown_Debug_03004BC0 = 0;
#endif
}

void ResetEventObjects(void)
{
    ClearLinkPlayerEventObjects();
    ClearAllEventObjects();
    ClearPlayerAvatarInfo();
    CreateReflectionEffectSprites();
}

static void CreateReflectionEffectSprites(void)
{
    // The reflection effect when an event object is standing over water or ice
    // is driven by these two invisible sprites' callback functions. The callback
    // continuously updates OAM rot/scale matrices using affine animations that scale
    // the sprite up and down horizontally. The second one is needed to handle the inverted
    // effect when the object is facing to the east. (The sprite has h-flip enabled).
    u8 spriteId = spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[21], 0, 0, 0x1F);
    gSprites[spriteId].oam.affineMode = 1;
    InitSpriteAffineAnim(&gSprites[spriteId]);
    StartSpriteAffineAnim(&gSprites[spriteId], 0);
    gSprites[spriteId].invisible = 1;

    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[21], 0, 0, 0x1F);
    gSprites[spriteId].oam.affineMode = 1;
    InitSpriteAffineAnim(&gSprites[spriteId]);
    StartSpriteAffineAnim(&gSprites[spriteId], 1);
    gSprites[spriteId].invisible = 1;
}

u8 GetFirstInactiveEventObjectId(void)
{
    u8 i;
    for (i = 0; i < 16; i++)
    {
        if (!gEventObjects[i].active)
            break;
    }

    return i;
}

u8 GetEventObjectIdByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup)
{
    if (localId < 255)
        return GetEventObjectIdByLocalIdAndMapInternal(localId, mapNum, mapGroup);
    else
        return GetEventObjectIdByLocalId(localId);
}

bool8 TryGetEventObjectIdByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup, u8 *eventObjectId)
{
    *eventObjectId = GetEventObjectIdByLocalIdAndMap(localId, mapNum, mapGroup);
    if (*eventObjectId == 16)
        return TRUE;
    else
        return FALSE;
}

u8 GetEventObjectIdByXY(s16 x, s16 y)
{
    u8 i;
    for (i = 0; i < 16; i++)
    {
        if (gEventObjects[i].active && gEventObjects[i].currentCoords.x == x && gEventObjects[i].currentCoords.y == y)
            break;
    }

    return i;
}

u8 GetEventObjectIdByLocalIdAndMapInternal(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 i;
    for (i = 0; i < 16; i++)
    {
        if (gEventObjects[i].active && gEventObjects[i].localId == localId && gEventObjects[i].mapNum == mapNum && gEventObjects[i].mapGroup == mapGroup)
            return i;
    }

    return 16;
}

u8 GetEventObjectIdByLocalId(u8 localId)
{
    u8 i;
    for (i = 0; i < 16; i++)
    {
        if (gEventObjects[i].active && gEventObjects[i].localId == localId)
            return i;
    }

    return 16;
}

u8 TryInitEventObjectStateFromTemplate(struct EventObjectTemplate *template, u8 mapNum, u8 mapGroup)
{
    struct EventObject *eventObj;
    u8 eventObjectId;
    s16 initialX;
    s16 initialY;

    if (GetAvailableEventObjectId(template->localId, mapNum, mapGroup, &eventObjectId) != 0)
        return 16;

    eventObj = (void *)&gEventObjects[eventObjectId];
    ClearEventObject((struct EventObject *)eventObj);
    initialX = template->x + 7;
    initialY = template->y + 7;
    eventObj->active = TRUE;
    eventObj->triggerGroundEffectsOnMove = TRUE;
    eventObj->graphicsId = template->graphicsId;
    eventObj->movementType = template->movementType;
    eventObj->localId = template->localId;
    eventObj->mapNum = mapNum;
    asm("":::"r6");
    eventObj->mapGroup = mapGroup;
    eventObj->initialCoords.x = initialX;
    eventObj->initialCoords.y = initialY;
    eventObj->currentCoords.x = initialX;
    eventObj->currentCoords.y = initialY;
    eventObj->previousCoords.x = initialX;
    eventObj->previousCoords.y = initialY;
    eventObj->currentElevation = template->elevation;
    eventObj->previousElevation = template->elevation;
    eventObj->range.as_nybbles.x = template->movementRangeX;
    eventObj->range.as_nybbles.y = template->movementRangeY;
    eventObj->trainerType = template->trainerType;
    eventObj->trainerRange_berryTreeId = template->trainerRange_berryTreeId;
    eventObj->previousMovementDirection = gInitialMovementTypeFacingDirections[template->movementType];
    SetEventObjectDirection((struct EventObject *)eventObj, eventObj->previousMovementDirection);
    asm("":::"r5","r6");
    SetEventObjectDynamicGraphicsId((struct EventObject *)eventObj);

    if (gRangedMovementTypes[eventObj->movementType])
    {
        // Ensure a ranged movement type has at least 1 tile of room to move.
        if (eventObj->range.as_nybbles.x == 0)
            eventObj->range.as_nybbles.x++;
        if (eventObj->range.as_nybbles.y == 0)
            eventObj->range.as_nybbles.y++;
    }

#if DEBUG
    gUnknown_Debug_03004BC0++;
#endif
    return eventObjectId;
}

u8 TryInitLocalEventObject(u8 localId)
{
    u8 eventObjectCount;
    u8 i;

    if (gMapHeader.events == NULL)
        return 16;

    eventObjectCount = gMapHeader.events->eventObjectCount;
    for (i = 0; i < eventObjectCount; i++)
    {
        struct EventObjectTemplate *template = &gSaveBlock1.eventObjectTemplates[i];
        if (template->localId == localId && !FlagGet(template->flagId))
            return TryInitEventObjectStateFromTemplate(template, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup);
    }

    return 16;
}

u8 GetAvailableEventObjectId(u16 localId, u8 mapNum, u8 mapGroup, u8 *eventObjectId)
{
    u8 i = 0;

    for (i = 0; i < 16 && gEventObjects[i].active; i++)
    {
        if (gEventObjects[i].localId == localId && gEventObjects[i].mapNum == mapNum && gEventObjects[i].mapGroup == mapGroup)
            return 1;
    }
    if (i >= 16)
        return 1;
    *eventObjectId = i;
    for (; i < 16; i++)
    {
        if (gEventObjects[i].active && gEventObjects[i].localId == localId && gEventObjects[i].mapNum == mapNum && gEventObjects[i].mapGroup == mapGroup)
            return 1;
    }
    return 0;
}

void RemoveEventObject(struct EventObject *eventObject)
{
    eventObject->active = FALSE;
    RemoveEventObjectInternal(eventObject);
#if DEBUG
    gUnknown_Debug_03004BC0--;
#endif
}

void RemoveEventObjectByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 eventObjectId;
    if (!TryGetEventObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &eventObjectId))
    {
        FlagSet(GetEventObjectFlagIdByEventObjectId(eventObjectId));
        RemoveEventObject(&gEventObjects[eventObjectId]);
    }
}

void RemoveEventObjectInternal(struct EventObject *eventObject)
{
    struct SpriteFrameImage image;
    image.size = GetEventObjectGraphicsInfo(eventObject->graphicsId)->size;
    gSprites[eventObject->spriteId].images = &image;
    DestroySprite(&gSprites[eventObject->spriteId]);
}

void RemoveAllEventObjectsExceptPlayer(void)
{
    u8 i;

    for (i = 0; i < 16; i++)
    {
        if (i != gPlayerAvatar.eventObjectId)
            RemoveEventObject(&gEventObjects[i]);
    }
}

static u8 TrySetupEventObjectSprite(struct EventObjectTemplate *eventObjTemplate, struct SpriteTemplate *sprTemplate, u8 mapNum, u8 mapGroup, s16 cameraDeltaX, s16 cameraDeltaY)
{
    u8 eventObjectId;
    u8 spriteId;
    const struct EventObjectGraphicsInfo *gfxInfo;
    struct EventObject *eventObject;
    struct Sprite *sprite;

    eventObjectId = TryInitEventObjectStateFromTemplate(eventObjTemplate, mapNum, mapGroup);
    if (eventObjectId == 16)
        return 16;

    eventObject = &gEventObjects[eventObjectId];
    gfxInfo = GetEventObjectGraphicsInfo(eventObject->graphicsId);
    if (gfxInfo->paletteSlot == 0)
        LoadPlayerObjectReflectionPalette(gfxInfo->paletteTag, gfxInfo->paletteSlot);
    else if (gfxInfo->paletteSlot == 10)
        LoadSpecialObjectReflectionPalette(gfxInfo->paletteTag, gfxInfo->paletteSlot);

    if (eventObject->movementType == MOVEMENT_TYPE_INVISIBLE)
        eventObject->invisible = TRUE;

#ifdef NONMATCHING
    sprTemplate->paletteTag = 0xFFFF;
#else
    *(u16 *)&sprTemplate->paletteTag = 0xFFFF;
#endif
    spriteId = CreateSprite(sprTemplate, 0, 0, 0);
    if (spriteId == MAX_SPRITES)
    {
#if DEBUG
        gUnknown_Debug_03004BC0--;
#endif
        gEventObjects[eventObjectId].active = FALSE;
        return 16;
    }
    sprite = &gSprites[spriteId];
    sub_8060388(cameraDeltaX + eventObject->currentCoords.x, cameraDeltaY + eventObject->currentCoords.y, &sprite->pos1.x, &sprite->pos1.y);
    sprite->centerToCornerVecX = -(gfxInfo->width >> 1);
    sprite->centerToCornerVecY = -(gfxInfo->height >> 1);
    sprite->pos1.x += 8;
    sprite->pos1.y += 16 + sprite->centerToCornerVecY;
    sprite->oam.paletteNum = gfxInfo->paletteSlot;
    sprite->coordOffsetEnabled = TRUE;
    sprite->data[0] = eventObjectId;
    eventObject->spriteId = spriteId;
    eventObject->inanimate = gfxInfo->inanimate;
    if (!eventObject->inanimate)
        StartSpriteAnim(sprite, GetFaceDirectionAnimNum(eventObject->facingDirection));
    SetObjectSubpriorityByZCoord(eventObject->previousElevation, sprite, 1);
    UpdateEventObjectVisibility(eventObject, sprite);
    return eventObjectId;
}

u8 TrySpawnEventObject(struct EventObjectTemplate *eventObjTemplate, u8 mapNum, u8 mapGroup, s16 cameraDeltaX, s16 cameraDeltaY)
{
    struct SpriteTemplate spriteTemplate;
    const struct SubspriteTable *subspriteTables = NULL;
    struct SpriteFrameImage spriteFrameImage;
    const struct EventObjectGraphicsInfo *gfxInfo;
    u8 eventObjectId;

    gfxInfo = GetEventObjectGraphicsInfo(eventObjTemplate->graphicsId);
    MakeObjectTemplateFromEventObjectTemplate(eventObjTemplate, &spriteTemplate, &subspriteTables);
    spriteFrameImage.size = gfxInfo->size;
    spriteTemplate.images = &spriteFrameImage;
    eventObjectId = TrySetupEventObjectSprite(eventObjTemplate, &spriteTemplate, mapNum, mapGroup, cameraDeltaX, cameraDeltaY);
    if (eventObjectId == 16)
        return 16;
    gSprites[gEventObjects[eventObjectId].spriteId].images = gfxInfo->images;
    if (subspriteTables != NULL)
        SetSubspriteTables(&gSprites[gEventObjects[eventObjectId].spriteId], subspriteTables);
    return eventObjectId;
}

u8 SpawnSpecialEventObject(struct EventObjectTemplate *eventObjTemplate)
{
    s16 x;
    s16 y;

    GetEventObjectMovingCameraOffset(&x, &y);
    return TrySpawnEventObject(eventObjTemplate, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, x, y);
}

u8 SpawnSpecialEventObjectParametrized(u8 graphicsId, u8 movementType, u8 localId, s16 x, s16 y, u8 elevation)
{
    struct EventObjectTemplate eventObjTemplate;

    x -= 7;
    y -= 7;
    eventObjTemplate.localId = localId;
    eventObjTemplate.graphicsId = graphicsId;
    eventObjTemplate.unk2 = 0;
    eventObjTemplate.x = x;
    eventObjTemplate.y = y;
    eventObjTemplate.elevation = elevation;
    eventObjTemplate.movementType = movementType;
    eventObjTemplate.movementRangeX = 0;
    eventObjTemplate.movementRangeY = 0;
    eventObjTemplate.trainerType = 0;
    eventObjTemplate.trainerRange_berryTreeId = 0;
    return SpawnSpecialEventObject(&eventObjTemplate);
}

u8 show_sprite(u8 a, u8 b, u8 c)
{
    struct EventObjectTemplate *r5;
    s16 x;
    s16 y;

    r5 = GetEventObjectTemplateByLocalIdAndMap(a, b, c);
    if (r5 == NULL)
        return 16;
    GetEventObjectMovingCameraOffset(&x, &y);
    return TrySpawnEventObject(r5, b, c, x, y);
}

void MakeObjectTemplateFromEventObjectGraphicsInfo(u16 graphicsId, void (*callback)(struct Sprite *), struct SpriteTemplate *sprTemplate, const struct SubspriteTable **subspriteTables)
{
    const struct EventObjectGraphicsInfo *gfxInfo = GetEventObjectGraphicsInfo(graphicsId);

    sprTemplate->tileTag = gfxInfo->tileTag;
    sprTemplate->paletteTag = gfxInfo->paletteTag;
    sprTemplate->oam = gfxInfo->oam;
    sprTemplate->anims = gfxInfo->anims;
    sprTemplate->images = gfxInfo->images;
    sprTemplate->affineAnims = gfxInfo->affineAnims;
    sprTemplate->callback = callback;
    *subspriteTables = gfxInfo->subspriteTables;
}

void MakeObjectTemplateFromEventObjectGraphicsInfoWithCallbackIndex(u16 graphicsId, u16 movementType, struct SpriteTemplate *sprTemplate, const struct SubspriteTable **subspriteTables)
{
    MakeObjectTemplateFromEventObjectGraphicsInfo(graphicsId, sMovementTypeCallbacks[movementType], sprTemplate, subspriteTables);
}

void MakeObjectTemplateFromEventObjectTemplate(struct EventObjectTemplate *eventObjTemplate, struct SpriteTemplate *sprTemplate, const struct SubspriteTable **subspriteTables)
{
    MakeObjectTemplateFromEventObjectGraphicsInfoWithCallbackIndex(eventObjTemplate->graphicsId, eventObjTemplate->movementType, sprTemplate, subspriteTables);
}

u8 AddPseudoEventObject(u16 graphicsId, void (*callback)(struct Sprite *), s16 x, s16 y, u8 subpriority)
{
    struct SpriteTemplate spriteTemplate;
    const struct SubspriteTable *subspriteTables;
    u8 spriteId;

    MakeObjectTemplateFromEventObjectGraphicsInfo(graphicsId, callback, &spriteTemplate, &subspriteTables);
    if (spriteTemplate.paletteTag != 0xFFFF)
        sub_805BDF8(spriteTemplate.paletteTag);
    spriteId = CreateSprite(&spriteTemplate, x, y, subpriority);
    if (spriteId != 64 && subspriteTables != NULL)
    {
        SetSubspriteTables(&gSprites[spriteId], subspriteTables);
        gSprites[spriteId].subspriteMode = 2;
    }
    return spriteId;
}

u8 sub_805B410(u8 graphicsId, u8 b, s16 x, s16 y, u8 elevation, u8 direction)
{
    const struct EventObjectGraphicsInfo *gfxInfo;
    struct SpriteTemplate spriteTemplate;
    const struct SubspriteTable *subspriteTables;
    u8 spriteId;

    gfxInfo = GetEventObjectGraphicsInfo(graphicsId);
    MakeObjectTemplateFromEventObjectGraphicsInfo(graphicsId, UpdateEventObjectSpriteSubpriorityAndVisibility, &spriteTemplate, &subspriteTables);
#ifdef NONMATCHING
    spriteTemplate.paletteTag = 0xFFFF;
#else
    *(u16 *)&spriteTemplate.paletteTag = 0xFFFF;
#endif
    x += 7;
    y += 7;
    sub_8060470(&x, &y, 8, 16);
    spriteId = CreateSpriteAtEnd(&spriteTemplate, x, y, 0);
    if (spriteId != 64)
    {
        struct Sprite *sprite = &gSprites[spriteId];

        sprite->centerToCornerVecX = -(gfxInfo->width >> 1);
        sprite->centerToCornerVecY = -(gfxInfo->height >> 1);
        sprite->pos1.y += sprite->centerToCornerVecY;
        sprite->oam.paletteNum = gfxInfo->paletteSlot;
        sprite->coordOffsetEnabled = TRUE;
        sprite->data[0] = b;
        sprite->data[1] = elevation;
        if (gfxInfo->paletteSlot == 10)
            LoadSpecialObjectReflectionPalette(gfxInfo->paletteTag, gfxInfo->paletteSlot);
        if (subspriteTables != NULL)
        {
            SetSubspriteTables(sprite, subspriteTables);
            sprite->subspriteMode = 2;
        }
        InitObjectPriorityByZCoord(sprite, elevation);
        SetObjectSubpriorityByZCoord(elevation, sprite, 1);
        StartSpriteAnim(sprite, GetFaceDirectionAnimNum(direction));
    }
    return spriteId;
}

void TrySpawnEventObjects(s16 cameraDeltaX, s16 cameraDeltaY)
{
    u8 i;

    if (gMapHeader.events != NULL)
    {
        s16 r9 = gSaveBlock1.pos.x - 2;
        s16 sp8 = gSaveBlock1.pos.x + 17;
        s16 r10 = gSaveBlock1.pos.y;
        s16 spC = gSaveBlock1.pos.y + 16;
        u8 objectCount = gMapHeader.events->eventObjectCount;

        for (i = 0; i < objectCount; i++)
        {
            struct EventObjectTemplate *template = &gSaveBlock1.eventObjectTemplates[i];
            s16 foo = template->x + 7;
            s16 bar = template->y + 7;

            if (r10 <= bar && spC >= bar && r9 <= foo && sp8 >= foo
             && !FlagGet(template->flagId))
                TrySpawnEventObject(template, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, cameraDeltaX, cameraDeltaY);
        }
    }
}

void RemoveEventObjectIfOutsideView(struct EventObject *eventObject);

void RemoveEventObjectsOutsideView(void)
{
    u8 i;
    u8 j;

    for (i = 0; i < 16; i++)
    {
        bool8 isActiveLinkPlayer;

        for (j = 0, isActiveLinkPlayer = 0; j < 4; j++)
        {
            if (gLinkPlayerEventObjects[j].active && i == gLinkPlayerEventObjects[j].eventObjId)
                isActiveLinkPlayer = TRUE;
        }
        if (!isActiveLinkPlayer)
        {
            struct EventObject *eventObject = &gEventObjects[i];

            if (eventObject->active && !eventObject->isPlayer)
                RemoveEventObjectIfOutsideView(eventObject);
        }
    }
}

void RemoveEventObjectIfOutsideView(struct EventObject *eventObject)
{
    s16 r7 = gSaveBlock1.pos.x - 2;
    s16 r5 = gSaveBlock1.pos.x + 17;
    s16 r4 = gSaveBlock1.pos.y;
    s16 r6 = gSaveBlock1.pos.y + 16;

    if (eventObject->currentCoords.x >= r7 && eventObject->currentCoords.x <= r5
     && eventObject->currentCoords.y >= r4 && eventObject->currentCoords.y <= r6)
        return;
    if (eventObject->initialCoords.x >= r7 && eventObject->initialCoords.x <= r5
     && eventObject->initialCoords.y >= r4 && eventObject->initialCoords.y <= r6)
        return;
    RemoveEventObject(eventObject);
}

void sub_805B75C(u8, s16, s16);

void sub_805B710(u16 a, u16 b)
{
    u8 i;

#if DEBUG
    gUnknown_Debug_03004BC0 = 0;
#endif
    ClearPlayerAvatarInfo();
    for (i = 0; i < 16; i++)
    {
        if (gEventObjects[i].active)
        {
            sub_805B75C(i, a, b);
#if DEBUG
            gUnknown_Debug_03004BC0++;
#endif
        }
    }
    CreateReflectionEffectSprites();
}

extern void SetPlayerAvatarEventObjectIdAndObjectId(u8, u8);
extern void sub_805B914(struct EventObject *);

void sub_805B75C(u8 eventObjectId, s16 b, s16 c)
{
    struct SpriteTemplate sp0;
    struct SpriteFrameImage sp18;
    const struct SubspriteTable *subspriteTables;
    const struct EventObjectGraphicsInfo *gfxInfo;
    struct EventObject *eventObject;
    u8 spriteId;

    #define i spriteId
    for (i = 0; i < 4; i++)
    {
        if (gLinkPlayerEventObjects[i].active && eventObjectId == gLinkPlayerEventObjects[i].eventObjId)
            return;
    }
    #undef i

    eventObject = &gEventObjects[eventObjectId];
    asm("":::"r5");
    subspriteTables = NULL;
    gfxInfo = GetEventObjectGraphicsInfo(eventObject->graphicsId);
    sp18.size = gfxInfo->size;
    MakeObjectTemplateFromEventObjectGraphicsInfoWithCallbackIndex(eventObject->graphicsId, eventObject->movementType, &sp0, &subspriteTables);
    sp0.images = &sp18;
    *(u16 *)&sp0.paletteTag = 0xFFFF;
    if (gfxInfo->paletteSlot == 0)
        LoadPlayerObjectReflectionPalette(gfxInfo->paletteTag, gfxInfo->paletteSlot);
    if (gfxInfo->paletteSlot > 9)
        LoadSpecialObjectReflectionPalette(gfxInfo->paletteTag, gfxInfo->paletteSlot);
    *(u16 *)&sp0.paletteTag = 0xFFFF;
    spriteId = CreateSprite(&sp0, 0, 0, 0);
    if (spriteId != 64)
    {
        struct Sprite *sprite = &gSprites[spriteId];

        sub_8060388(b + eventObject->currentCoords.x, c + eventObject->currentCoords.y, &sprite->pos1.x, &sprite->pos1.y);
        sprite->centerToCornerVecX = -(gfxInfo->width >> 1);
        sprite->centerToCornerVecY = -(gfxInfo->height >> 1);
        sprite->pos1.x += 8;
        sprite->pos1.y += 16 + sprite->centerToCornerVecY;
        sprite->images = gfxInfo->images;
        if (eventObject->movementType == MOVEMENT_TYPE_PLAYER)
        {
            SetPlayerAvatarEventObjectIdAndObjectId(eventObjectId, spriteId);
            eventObject->warpArrowSpriteId = CreateWarpArrowSprite();
        }
        if (subspriteTables != NULL)
            SetSubspriteTables(sprite, subspriteTables);
        sprite->oam.paletteNum = gfxInfo->paletteSlot;
        sprite->coordOffsetEnabled = TRUE;
        sprite->data[0] = eventObjectId;
        eventObject->spriteId = spriteId;
        if (!eventObject->inanimate && eventObject->movementType != MOVEMENT_TYPE_PLAYER)
            StartSpriteAnim(sprite, GetFaceDirectionAnimNum(eventObject->facingDirection));
        sub_805B914(eventObject);
        SetObjectSubpriorityByZCoord(eventObject->previousElevation, sprite, 1);
    }
}

void sub_805B914(struct EventObject *eventObject)
{
    eventObject->singleMovementActive = FALSE;
    eventObject->triggerGroundEffectsOnMove = TRUE;
    eventObject->hasShadow = FALSE;
    eventObject->hasReflection = FALSE;
    eventObject->inShortGrass = FALSE;
    eventObject->inShallowFlowingWater = FALSE;
    eventObject->inSandPile = FALSE;
    eventObject->inHotSprings = FALSE;
    EventObjectClearHeldMovement(eventObject);
}

void SetPlayerAvatarEventObjectIdAndObjectId(u8 eventObjectId, u8 spriteId)
{
    gPlayerAvatar.eventObjectId = eventObjectId;
    gPlayerAvatar.spriteId = spriteId;
    gPlayerAvatar.gender = GetPlayerAvatarGenderByGraphicsId(gEventObjects[eventObjectId].graphicsId);
    SetPlayerAvatarExtraStateTransition(gEventObjects[eventObjectId].graphicsId, 0x20);
}

void sub_805B980(struct EventObject *eventObject, u8 graphicsId)
{
    const struct EventObjectGraphicsInfo *gfxInfo;
    struct Sprite *sprite;

    gfxInfo = GetEventObjectGraphicsInfo(graphicsId);
    sprite = &gSprites[eventObject->spriteId];
    if (gfxInfo->paletteSlot == 0)
        PatchObjectPalette(gfxInfo->paletteTag, gfxInfo->paletteSlot);
    if (gfxInfo->paletteSlot == 10)
        LoadSpecialObjectReflectionPalette(gfxInfo->paletteTag, gfxInfo->paletteSlot);
    sprite->oam.shape = gfxInfo->oam->shape;
    sprite->oam.size = gfxInfo->oam->size;
    sprite->images = gfxInfo->images;
    sprite->anims = gfxInfo->anims;
    sprite->subspriteTables = gfxInfo->subspriteTables;
    sprite->oam.paletteNum = gfxInfo->paletteSlot;
    eventObject->inanimate = gfxInfo->inanimate;
    eventObject->graphicsId = graphicsId;
    sub_80603CC(eventObject->currentCoords.x, eventObject->currentCoords.y, &sprite->pos1.x, &sprite->pos1.y);
    sprite->centerToCornerVecX = -(gfxInfo->width >> 1);
    sprite->centerToCornerVecY = -(gfxInfo->height >> 1);
    sprite->pos1.x += 8;
    sprite->pos1.y += 16 + sprite->centerToCornerVecY;
    if (eventObject->trackedByCamera)
        CameraObjectReset1();
}

void unref_sub_805BA80(u8 localId, u8 mapNum, u8 mapGroup, u8 graphicsId)
{
    u8 eventObjectId;

    if (!TryGetEventObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &eventObjectId))
        sub_805B980(&gEventObjects[eventObjectId], graphicsId);
}

void EventObjectTurn(struct EventObject *eventObject, u8 direction)
{
    SetEventObjectDirection(eventObject, direction);
    if (!eventObject->inanimate)
    {
        StartSpriteAnim(&gSprites[eventObject->spriteId], GetFaceDirectionAnimNum(eventObject->facingDirection));
        SeekSpriteAnim(&gSprites[eventObject->spriteId], 0);
    }
}

void EventObjectTurnByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup, u8 direction)
{
    u8 eventObjectId;

    if (!TryGetEventObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &eventObjectId))
        EventObjectTurn(&gEventObjects[eventObjectId], direction);
}

void unref_TurnPlayer(struct PlayerAvatar *player, u8 direction)
{
    EventObjectTurn(&gEventObjects[player->eventObjectId], direction);
}

void get_berry_tree_graphics(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 treeStage;
    u8 treeId;

    eventObject->invisible = TRUE;
    sprite->invisible = TRUE;
    treeStage = GetStageByBerryTreeId(eventObject->trainerRange_berryTreeId);
    if (treeStage != 0)
    {
        eventObject->invisible = FALSE;
        sprite->invisible = FALSE;
        treeId = GetBerryTypeByBerryTreeId(eventObject->trainerRange_berryTreeId) - 1;
        treeStage--;
        if (treeId > 0x2B)
            treeId = 0;
        sub_805B980(eventObject, gBerryTreeGraphicsIdTablePointers[treeId][treeStage]);
        sprite->images = gBerryTreePicTablePointers[treeId];
        sprite->oam.paletteNum = gBerryTreePaletteSlotTablePointers[treeId][treeStage];
        StartSpriteAnim(sprite, treeStage);
    }
}

const struct EventObjectGraphicsInfo *GetEventObjectGraphicsInfo(u8 graphicsId)
{
    if (graphicsId > 0xEF)
        graphicsId = VarGetEventObjectGraphicsId(graphicsId + 16);
    if (graphicsId > 0xD9)
        graphicsId = 5;
    return gEventObjectGraphicsInfoPointers[graphicsId];
}

void SetEventObjectDynamicGraphicsId(struct EventObject *eventObject)
{
    if (eventObject->graphicsId > 0xEF)
        eventObject->graphicsId = VarGetEventObjectGraphicsId(eventObject->graphicsId + 16);
}

void npc_by_local_id_and_map_set_field_1_bit_x20(u8 localId, u8 mapNum, u8 mapGroup, u8 d)
{
    u8 eventObjectId;

    if (!TryGetEventObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &eventObjectId))
        gEventObjects[eventObjectId].invisible = d;
}

void EventObjectGetLocalIdAndMap(struct EventObject *eventObject, void *localId, void *mapNum, void *mapGroup)
{
    *(u8 *)localId = eventObject->localId;
    *(u8 *)mapNum = eventObject->mapNum;
    *(u8 *)mapGroup = eventObject->mapGroup;
}

void sub_805BCC0(s16 x, s16 y)
{
    u8 eventObjectId;
    struct EventObject *eventObject;

    eventObjectId = GetEventObjectIdByXY(x, y);
    if (eventObjectId != 16)
    {
        eventObject = &gEventObjects[eventObjectId];
        eventObject->triggerGroundEffectsOnMove = TRUE;
    }
}

void sub_805BCF0(u8 localId, u8 mapNum, u8 mapGroup, u8 subpriority)
{
    u8 eventObjectId;
    struct EventObject *eventObject;
    struct Sprite *sprite;

    if (!TryGetEventObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &eventObjectId))
    {
        eventObject = &gEventObjects[eventObjectId];
        sprite = &gSprites[eventObject->spriteId];
        eventObject->fixedPriority = TRUE;
        sprite->subpriority = subpriority;
    }
}

void sub_805BD48(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 eventObjectId;
    struct EventObject *eventObject;

    if (!TryGetEventObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &eventObjectId))
    {
        eventObject = &gEventObjects[eventObjectId];
        eventObject->fixedPriority = FALSE;
        eventObject->triggerGroundEffectsOnMove = TRUE;
    }
}

void sub_805BD90(u8 localId, u8 mapNum, u8 mapGroup, s16 x, s16 y)
{
    u8 eventObjectId;
    struct Sprite *sprite;

    if (!TryGetEventObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &eventObjectId))
    {
        sprite = &gSprites[gEventObjects[eventObjectId].spriteId];
        sprite->pos2.x = x;
        sprite->pos2.y = y;
    }
}

void FreeAndReserveObjectSpritePalettes(void)
{
    FreeAllSpritePalettes();
    gReservedSpritePaletteCount = 12;
}

void sub_805BDF8(u16 tag)
{
    u16 paletteIndex = FindEventObjectPaletteIndexByTag(tag);

    if (paletteIndex != 0x11FF)  //always happens. FindEventObjectPaletteIndexByTag returns u8
        sub_805BE58(&sEventObjectSpritePalettes[paletteIndex]);
}

void unref_sub_805BE24(u16 *arr)
{
    u8 i;

    for (i = 0; arr[i] != 0x11FF; i++)
        sub_805BDF8(arr[i]);
}

u8 sub_805BE58(const struct SpritePalette *palette)
{
    if (IndexOfSpritePaletteTag(palette->tag) != 0xFF)
        return 0xFF;
    else
        return LoadSpritePalette(palette);
}

void PatchObjectPalette(u16 paletteTag, u16 paletteIndex)
{
    u8 index = paletteIndex;
    u8 tagPaletteIndex = FindEventObjectPaletteIndexByTag(paletteTag);

    LoadPalette(sEventObjectSpritePalettes[tagPaletteIndex].data, index * 16 + 0x100, 0x20);
}

static void PatchObjectPalettes(const u16 *paletteTags, u8 paletteIndex, u8 maxPaletteIndex)
{
    for (; paletteIndex < maxPaletteIndex; paletteTags++, paletteIndex++)
        PatchObjectPalette(*paletteTags, paletteIndex);
}

u8 FindEventObjectPaletteIndexByTag(u16 tag)
{
    u8 i;

    for (i = 0; sEventObjectSpritePalettes[i].tag != 0x11FF; i++)
    {
        if (sEventObjectSpritePalettes[i].tag == tag)
            return i;
    }
    return 0xFF;
}

void LoadPlayerObjectReflectionPalette(u16 paletteTag, u8 paletteIndex)
{
    u8 i;

    PatchObjectPalette(paletteTag, paletteIndex);
    for (i = 0; gPlayerReflectionPaletteSets[i].mainPaletteTag != 0x11FF; i++)
    {
        if (gPlayerReflectionPaletteSets[i].mainPaletteTag == paletteTag)
        {
            PatchObjectPalette(gPlayerReflectionPaletteSets[i].reflectionPaletteTags[sCurrentReflectionType], gReflectionEffectPaletteMap[paletteIndex]);
            break;
        }
    }
}

void LoadSpecialObjectReflectionPalette(u16 paletteTag, u8 paletteIndex)
{
    u8 i;

    sCurrentSpecialObjectPaletteTag = paletteTag;
    PatchObjectPalette(paletteTag, paletteIndex);
    for (i = 0; gSpecialObjectReflectionPaletteSets[i].mainPaletteTag != 0x11FF; i++)
    {
        if (gSpecialObjectReflectionPaletteSets[i].mainPaletteTag == paletteTag)
        {
            PatchObjectPalette(gSpecialObjectReflectionPaletteSets[i].reflectionPaletteTags[sCurrentReflectionType], gReflectionEffectPaletteMap[paletteIndex]);
            break;
        }
    }
}

void unref_sub_805C014(struct EventObject *eventObject, s16 x, s16 y)
{
    eventObject->previousCoords.x = eventObject->currentCoords.x;
    eventObject->previousCoords.y = eventObject->currentCoords.y;
    eventObject->currentCoords.x += x;
    eventObject->currentCoords.y += y;
}

void ShiftEventObjectCoords(struct EventObject *eventObject, s16 x, s16 y)
{
    eventObject->previousCoords.x = eventObject->currentCoords.x;
    eventObject->previousCoords.y = eventObject->currentCoords.y;
    eventObject->currentCoords.x = x;
    eventObject->currentCoords.y = y;
}

void SetEventObjectCoords(struct EventObject *eventObject, s16 x, s16 y)
{
    eventObject->previousCoords.x = x;
    eventObject->previousCoords.y = y;
    eventObject->currentCoords.x = x;
    eventObject->currentCoords.y = y;
}

void sub_805C058(struct EventObject *eventObject, s16 x, s16 y)
{
    struct Sprite *sprite = &gSprites[eventObject->spriteId];
    const struct EventObjectGraphicsInfo *gfxInfo = GetEventObjectGraphicsInfo(eventObject->graphicsId);

    SetEventObjectCoords(eventObject, x, y);
    sub_80603CC(eventObject->currentCoords.x, eventObject->currentCoords.y, &sprite->pos1.x, &sprite->pos1.y);
    sprite->centerToCornerVecX = -(gfxInfo->width >> 1);
    sprite->centerToCornerVecY = -(gfxInfo->height >> 1);
    sprite->pos1.x += 8;
    sprite->pos1.y += 16 + sprite->centerToCornerVecY;
    sub_805B914(eventObject);
    if (eventObject->trackedByCamera)
        CameraObjectReset1();
}

void sub_805C0F8(u8 localId, u8 mapNum, u8 mapGroup, s16 x, s16 y)
{
    u8 eventObjectId;

    if (!TryGetEventObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &eventObjectId))
    {
        x += 7;
        y += 7;
        sub_805C058(&gEventObjects[eventObjectId], x, y);
    }
}

void ShiftStillEventObjectCoords(struct EventObject *eventObject)
{
    ShiftEventObjectCoords(eventObject, eventObject->currentCoords.x, eventObject->currentCoords.y);
}

void UpdateEventObjectCoordsForCameraUpdate(void)
{
    u8 i;
    s16 deltaX;
    s16 deltaY;

    if (gCamera.field_0)
    {
        deltaX = gCamera.x;
        deltaY = gCamera.y;
        for (i = 0; i < 16; i++)
        {
            if (gEventObjects[i].active)
            {
                gEventObjects[i].initialCoords.x -= deltaX;
                gEventObjects[i].initialCoords.y -= deltaY;
                gEventObjects[i].currentCoords.x -= deltaX;
                gEventObjects[i].currentCoords.y -= deltaY;
                gEventObjects[i].previousCoords.x -= deltaX;
                gEventObjects[i].previousCoords.y -= deltaY;
            }
        }
    }
}

u8 GetEventObjectIdByXYZ(u16 x, u16 y, u8 z)
{
    u8 i;

    for (i = 0; i < 16; i++)
    {
        if (gEventObjects[i].active && gEventObjects[i].currentCoords.x == x && gEventObjects[i].currentCoords.y == y
         && EventObjectZCoordIsCompatible(&gEventObjects[i], z))
            return i;
    }
    return 16;
}

static bool8 EventObjectZCoordIsCompatible(struct EventObject *eventObject, u8 z)
{
    if (eventObject->currentElevation != 0 && z != 0
     && eventObject->currentElevation != z)
        return FALSE;
    else
        return TRUE;
}

void UpdateEventObjectsForCameraUpdate(s16 cameraDeltaX, s16 cameraDeltaY)
{
    UpdateEventObjectCoordsForCameraUpdate();
    TrySpawnEventObjects(cameraDeltaX, cameraDeltaY);
    RemoveEventObjectsOutsideView();
}

u8 AddCameraObject(u8 trackedSpriteId)
{
    u8 spriteId = CreateSprite(&gCameraSpriteTemplate, 0, 0, 4);

    gSprites[spriteId].invisible = TRUE;
    gSprites[spriteId].data[0] = trackedSpriteId;
    return spriteId;
}

static void ObjectCB_CameraObject(struct Sprite *sprite)
{
    void (*cameraObjectFuncs[3])(struct Sprite *);
    memcpy(cameraObjectFuncs, gCameraObjectFuncs, sizeof(gCameraObjectFuncs));
    cameraObjectFuncs[sprite->data[1]](sprite);
}

static void CameraObject_0(struct Sprite *sprite)
{
    sprite->pos1.x = gSprites[sprite->data[0]].pos1.x;
    sprite->pos1.y = gSprites[sprite->data[0]].pos1.y;
    sprite->invisible = TRUE;
    sprite->data[1] = 1;
    CameraObject_1(sprite);
}

static void CameraObject_1(struct Sprite *sprite)
{
    s16 x = gSprites[sprite->data[0]].pos1.x;
    s16 y = gSprites[sprite->data[0]].pos1.y;

    sprite->data[2] = x - sprite->pos1.x;
    sprite->data[3] = y - sprite->pos1.y;
    sprite->pos1.x = x;
    sprite->pos1.y = y;
}

static void CameraObject_2(struct Sprite *sprite)
{
    sprite->pos1.x = gSprites[sprite->data[0]].pos1.x;
    sprite->pos1.y = gSprites[sprite->data[0]].pos1.y;
    sprite->data[2] = 0;
    sprite->data[3] = 0;
}

struct Sprite *FindCameraObject(void)
{
    u8 i;

    for (i = 0; i < MAX_SPRITES; i++)
    {
        if (gSprites[i].inUse && gSprites[i].callback == ObjectCB_CameraObject)
            return &gSprites[i];
    }
    return NULL;
}

void CameraObjectReset1(void)
{
    struct Sprite *cameraSprite = FindCameraObject();

    if (cameraSprite != NULL)
    {
        cameraSprite->data[1] = 0;
        cameraSprite->callback(cameraSprite);
    }
}

void CameraObjectSetFollowedObjectId(u8 spriteId)
{
    struct Sprite *cameraSprite = FindCameraObject();

    if (cameraSprite != NULL)
    {
        cameraSprite->data[0] = spriteId;
        CameraObjectReset1();
    }
}

u8 CameraObjectGetFollowedObjectId(void)
{
    struct Sprite *cameraSprite = FindCameraObject();

    if (cameraSprite == NULL)
        return 64;
    else
        return cameraSprite->data[0];
}

void CameraObjectReset2(void)
{
    struct Sprite *cameraSprite = FindCameraObject();

    cameraSprite->data[1] = 2;
}

u8 unref_sub_805C43C(struct Sprite *src, s16 x, s16 y, u8 subpriority)
{
    u8 i;

    for (i = 0; i < MAX_SPRITES; i++)
    {
        if (!gSprites[i].inUse)
        {
            gSprites[i] = *src;
            gSprites[i].pos1.x = x;
            gSprites[i].pos1.y = y;
            gSprites[i].subpriority = subpriority;
            break;
        }
    }
    return i;
}

u8 CreateCopySpriteAt(struct Sprite *src, s16 x, s16 y, u8 subpriority)
{
    s16 i;

    for (i = MAX_SPRITES - 1; i > -1; i--)
    {
        if (!gSprites[i].inUse)
        {
            gSprites[i] = *src;
            gSprites[i].pos1.x = x;
            gSprites[i].pos1.y = y;
            gSprites[i].subpriority = subpriority;
            return i;
        }
    }

    return MAX_SPRITES;
}

void SetEventObjectDirection(struct EventObject *eventObject, u8 direction)
{
    eventObject->previousMovementDirection = eventObject->facingDirection;
    if (!eventObject->facingDirectionLocked)
    {
        s8 _direction = direction;  //needed for the asm to match
        eventObject->facingDirection = _direction;
    }
    eventObject->movementDirection = direction;
}

u8 *GetEventObjectScriptPointerByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup)
{
    struct EventObjectTemplate *template = GetEventObjectTemplateByLocalIdAndMap(localId, mapNum, mapGroup);

    return template->script;
}

u8 *GetEventObjectScriptPointerByEventObjectId(u8 eventObjectId)
{
    return GetEventObjectScriptPointerByLocalIdAndMap(gEventObjects[eventObjectId].localId, gEventObjects[eventObjectId].mapNum, gEventObjects[eventObjectId].mapGroup);
}

u16 GetEventObjectFlagIdByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup)
{
    struct EventObjectTemplate *template = GetEventObjectTemplateByLocalIdAndMap(localId, mapNum, mapGroup);

    return template->flagId;
}

u16 GetEventObjectFlagIdByEventObjectId(u8 eventObjectId)
{
    return GetEventObjectFlagIdByLocalIdAndMap(gEventObjects[eventObjectId].localId, gEventObjects[eventObjectId].mapNum, gEventObjects[eventObjectId].mapGroup);
}

u8 unref_sub_805C5D0(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 eventObjectId;

    if (TryGetEventObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &eventObjectId))
        return 0xFF;
    else
        return gEventObjects[eventObjectId].trainerType;
}

u8 unref_sub_805C60C(u8 eventObjectId)
{
    return gEventObjects[eventObjectId].trainerType;
}

u8 unref_sub_805C624(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 eventObjectId;

    if (TryGetEventObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &eventObjectId))
        return 0xFF;
    else
        return gEventObjects[eventObjectId].trainerRange_berryTreeId;
}

u8 EventObjectGetBerryTreeId(u8 eventObjectId)
{
    return gEventObjects[eventObjectId].trainerRange_berryTreeId;
}

struct EventObjectTemplate *GetEventObjectTemplateByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup)
{
    if (gSaveBlock1.location.mapNum == mapNum && gSaveBlock1.location.mapGroup == mapGroup)
        return FindEventObjectTemplateByLocalId(localId, gSaveBlock1.eventObjectTemplates, gMapHeader.events->eventObjectCount);
    else
    {
        struct MapHeader *mapHeader = Overworld_GetMapHeaderByGroupAndId(mapGroup, mapNum);

        return FindEventObjectTemplateByLocalId(localId, mapHeader->events->eventObjects, mapHeader->events->eventObjectCount);
    }
}

static struct EventObjectTemplate *FindEventObjectTemplateByLocalId(u8 localId, struct EventObjectTemplate *templates, u8 count)
{
    u8 i;

    for (i = 0; i < count; i++)
    {
        if (templates[i].localId == localId)
            return &templates[i];
    }
    return NULL;
}

static struct EventObjectTemplate *GetBaseTemplateForEventObject(struct EventObject *eventObject)
{
    s32 i;

    if (eventObject->mapNum != gSaveBlock1.location.mapNum
     || eventObject->mapGroup != gSaveBlock1.location.mapGroup)
        return NULL;

    for (i = 0; i < 64; i++)
    {
        if (eventObject->localId == gSaveBlock1.eventObjectTemplates[i].localId)
            return &gSaveBlock1.eventObjectTemplates[i];
    }
    return NULL;
}

void OverrideTemplateCoordsForEventObject(struct EventObject *eventObject)
{
    struct EventObjectTemplate *template = GetBaseTemplateForEventObject(eventObject);

    if (template != NULL)
    {
        template->x = eventObject->currentCoords.x - 7;
        template->y = eventObject->currentCoords.y - 7;
    }
}

void OverrideMovementTypeForEventObject(struct EventObject *eventObject, u8 movementType)
{
    struct EventObjectTemplate *template = GetBaseTemplateForEventObject(eventObject);

    if (template != NULL)
        template->movementType = movementType;
}

void TryOverrideTemplateCoordsForEventObject(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 eventObjectId;

    if (!TryGetEventObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &eventObjectId))
        OverrideTemplateCoordsForEventObject(&gEventObjects[eventObjectId]);
}

void InitEventObjectPalettes(u8 reflectionType)
{
    FreeAndReserveObjectSpritePalettes();
    sCurrentSpecialObjectPaletteTag = 0x11FF;
    sCurrentReflectionType = reflectionType;
    PatchObjectPalettes(gObjectPaletteTagSets[sCurrentReflectionType], 0, 10);
}

u16 GetObjectPaletteTag(u8 paletteIndex)
{
    u8 i;

    // Regular objects and the player occupy the first 10 palettes.
    if (paletteIndex < 10)
        return gObjectPaletteTagSets[sCurrentReflectionType][paletteIndex];

    // Palette slots 10 and 11 belong to the special object.
    for (i = 0; gSpecialObjectReflectionPaletteSets[i].mainPaletteTag != 0x11FF; i++)
    {
        if (gSpecialObjectReflectionPaletteSets[i].mainPaletteTag == sCurrentSpecialObjectPaletteTag)
        {
            return gSpecialObjectReflectionPaletteSets[i].reflectionPaletteTags[sCurrentReflectionType];
        }
    }

    return 0x11FF;
}

movement_type_empty_callback(MovementType_None);
movement_type_def(MovementType_WanderAround, gMovementTypeFuncs_WanderAround);

u8 MovementType_WanderAround_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    ClearEventObjectMovement(eventObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 MovementType_WanderAround_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    EventObjectSetSingleMovement(eventObject, sprite, GetFaceDirectionMovementAction(eventObject->facingDirection));
    sprite->data[1] = 2;
    return 1;
}

u8 MovementType_WanderAround_Step2(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (EventObjectExecSingleMovementAction(eventObject, sprite) == 0)
    {
        return 0;
    }
    SetMovementDelay(sprite, gMovementDelaysMedium[Random() & 3]);
    sprite->data[1] = 3;
    return 1;
}

u8 MovementType_WanderAround_Step3(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite))
    {
        sprite->data[1] = 4;
        return 1;
    }
    return 0;
}

u8 MovementType_WanderAround_Step4(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[4];
    memcpy(directions, gStandardDirections, 4);
    direction = directions[Random() & 3];
    SetEventObjectDirection(eventObject, direction);
    sprite->data[1] = 5;
    if (GetCollisionInDirection(eventObject, direction) != 0)
    {
        sprite->data[1] = 1;
    }
    return 1;
}

u8 MovementType_WanderAround_Step5(struct EventObject *eventObject, struct Sprite *sprite)
{
    EventObjectSetSingleMovement(eventObject, sprite, GetWalkNormalMovementAction(eventObject->movementDirection));
    eventObject->singleMovementActive = 1;
    sprite->data[1] = 6;
    return 1;
}

u8 MovementType_WanderAround_Step6(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (EventObjectExecSingleMovementAction(eventObject, sprite) != 0)
    {
        eventObject->singleMovementActive = 0;
        sprite->data[1] = 1;
    }
    return 0;
}

u8 EventObjectIsTrainerAndCloseToPlayer(struct EventObject *eventObject)
{
    s16 x;
    s16 y;
    s16 objx;
    s16 objy;
    s16 minx;
    s16 maxx;
    s16 miny;
    s16 maxy;
    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_DASH) == 0)
    {
        return 0;
    }
    if (eventObject->trainerType != 1 && eventObject->trainerType != 3)
    {
        return 0;
    }
    PlayerGetDestCoords(&x, &y);
    objx = eventObject->currentCoords.x;
    objy = eventObject->currentCoords.y;
    minx = objx - eventObject->trainerRange_berryTreeId;
    miny = objy - eventObject->trainerRange_berryTreeId;
    maxx = objx + eventObject->trainerRange_berryTreeId;
    maxy = objy + eventObject->trainerRange_berryTreeId;
    if (minx > x || maxx < x || miny > y || maxy < y)
    {
        return 0;
    }
    return 1;
}

u8 GetVectorDirection(s16 x, s16 y, s16 xAbs, s16 yAbs)
{
    u8 direction;
    if (xAbs > yAbs)
    {
        direction = DIR_EAST;
        if (x < 0)
        {
            direction = DIR_WEST;
        }
    }
    else
    {
        direction = DIR_SOUTH;
        if (y < 0)
        {
            direction = DIR_NORTH;
        }
    }
    return direction;
}

u8 GetLimitedVectorDirection_SouthNorth(s16 x, s16 y, s16 xAbs, s16 yAbs)
{
    u8 direction;
    direction = DIR_SOUTH;
    if (y < 0)
    {
        direction = DIR_NORTH;
    }
    return direction;
}

u8 GetLimitedVectorDirection_WestEast(s16 x, s16 y, s16 xAbs, s16 yAbs)
{
    u8 direction;
    direction = DIR_EAST;
    if (x < 0)
    {
        direction = DIR_WEST;
    }
    return direction;
}

u8 GetLimitedVectorDirection_WestNorth(s16 x, s16 y, s16 xAbs, s16 yAbs)
{
    u8 direction;
    direction = GetVectorDirection(x, y, xAbs, yAbs);
    if (direction == DIR_SOUTH)
    {
        direction = GetLimitedVectorDirection_WestEast(x, y, xAbs, yAbs);
        if (direction == DIR_EAST)
        {
            direction = DIR_NORTH;
        }
    }
    else if (direction == DIR_EAST)
    {
        direction = GetLimitedVectorDirection_SouthNorth(x, y, xAbs, yAbs);
        if (direction == DIR_SOUTH)
        {
            direction = DIR_NORTH;
        }
    }
    return direction;
}

u8 GetLimitedVectorDirection_EastNorth(s16 x, s16 y, s16 xAbs, s16 yAbs)
{
    u8 direction;
    direction = GetVectorDirection(x, y, xAbs, yAbs);
    if (direction == DIR_SOUTH)
    {
        direction = GetLimitedVectorDirection_WestEast(x, y, xAbs, yAbs);
        if (direction == DIR_WEST)
        {
            direction = DIR_NORTH;
        }
    }
    else if (direction == DIR_WEST)
    {
        direction = GetLimitedVectorDirection_SouthNorth(x, y, xAbs, yAbs);
        if (direction == DIR_SOUTH)
        {
            direction = DIR_NORTH;
        }
    }
    return direction;
}

u8 GetLimitedVectorDirection_WestSouth(s16 x, s16 y, s16 xAbs, s16 yAbs)
{
    u8 direction;
    direction = GetVectorDirection(x, y, xAbs, yAbs);
    if (direction == DIR_NORTH)
    {
        direction = GetLimitedVectorDirection_WestEast(x, y, xAbs, yAbs);
        if (direction == DIR_EAST)
        {
            direction = DIR_SOUTH;
        }
    }
    else if (direction == DIR_EAST)
    {
        direction = GetLimitedVectorDirection_SouthNorth(x, y, xAbs, yAbs);
        if (direction == DIR_NORTH)
        {
            direction = DIR_SOUTH;
        }
    }
    return direction;
}

u8 GetLimitedVectorDirection_EastSouth(s16 x, s16 y, s16 xAbs, s16 yAbs) {
    u8 direction;
    direction = GetVectorDirection(x, y, xAbs, yAbs);
    if (direction == DIR_NORTH)
    {
        direction = GetLimitedVectorDirection_WestEast(x, y, xAbs, yAbs);
        if (direction == DIR_WEST)
        {
            direction = DIR_SOUTH;
        }
    }
    else if (direction == DIR_WEST)
    {
        direction = GetLimitedVectorDirection_SouthNorth(x, y, xAbs, yAbs);
        if (direction == DIR_NORTH)
        {
            direction = DIR_SOUTH;
        }
    }
    return direction;
}

u8 GetLimitedVectorDirection_SouthNorthWest(s16 x, s16 y, s16 xAbs, s16 yAbs)
{
    u8 direction;
    direction = GetVectorDirection(x, y, xAbs, yAbs);
    if (direction == DIR_EAST)
    {
        direction = GetLimitedVectorDirection_SouthNorth(x, y, xAbs, yAbs);
    }
    return direction;
}

u8 GetLimitedVectorDirection_SouthNorthEast(s16 x, s16 y, s16 xAbs, s16 yAbs)
{
    u8 direction;
    direction = GetVectorDirection(x, y, xAbs, yAbs);
    if (direction == DIR_WEST)
    {
        direction = GetLimitedVectorDirection_SouthNorth(x, y, xAbs, yAbs);
    }
    return direction;
}

u8 GetLimitedVectorDirection_NorthWestEast(s16 x, s16 y, s16 xAbs, s16 yAbs)
{
    u8 direction;
    direction = GetVectorDirection(x, y, xAbs, yAbs);
    if (direction == DIR_SOUTH)
    {
        direction = GetLimitedVectorDirection_WestEast(x, y, xAbs, yAbs);
    }
    return direction;
}

u8 GetLimitedVectorDirection_SouthWestEast(s16 x, s16 y, s16 xAbs, s16 yAbs)
{
    u8 direction;
    direction = GetVectorDirection(x, y, xAbs, yAbs);
    if (direction == DIR_NORTH)
    {
        direction = GetLimitedVectorDirection_WestEast(x, y, xAbs, yAbs);
    }
    return direction;
}

u8 TryGetTrainerEncounterDirection(struct EventObject *eventObject, u8 directionFuncIndex)
{
    s16 x, y;
    s16 xAbs, yAbs;
    if (!EventObjectIsTrainerAndCloseToPlayer(eventObject))
    {
        return 0;
    }
    PlayerGetDestCoords(&x, &y);
    x -= eventObject->currentCoords.x;
    y -= eventObject->currentCoords.y;
    xAbs = x;
    yAbs = y;
    if (xAbs < 0)
        xAbs = -xAbs;
    if (yAbs < 0)
        yAbs = -yAbs;

    return gGetVectorDirectionFuncs[directionFuncIndex](x, y, xAbs, yAbs);
}

movement_type_def(MovementType_LookAround, gMovementTypeFuncs_LookAround);

u8 MovementType_LookAround_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    ClearEventObjectMovement(eventObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 MovementType_LookAround_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    EventObjectSetSingleMovement(eventObject, sprite, GetFaceDirectionMovementAction(eventObject->facingDirection));
    sprite->data[1] = 2;
    return 1;
}

u8 MovementType_LookAround_Step2(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (EventObjectExecSingleMovementAction(eventObject, sprite))
    {
        SetMovementDelay(sprite, gMovementDelaysMedium[Random() & 3]);
        eventObject->singleMovementActive = 0;
        sprite->data[1] = 3;
    }
    return 0;
}

u8 MovementType_LookAround_Step3(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite) || EventObjectIsTrainerAndCloseToPlayer(eventObject))
    {
        sprite->data[1] = 4;
        return 1;
    }
    return 0;
}

u8 MovementType_LookAround_Step4(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[4];
    memcpy(directions, gStandardDirections, 4);
    direction = TryGetTrainerEncounterDirection(eventObject, 0);
    if (direction == DIR_NONE)
        direction = directions[Random() & 3];

    SetEventObjectDirection(eventObject, direction);
    sprite->data[1] = 1;
    return 1;
}

movement_type_def(MovementType_WanderUpAndDown, gMovementTypeFuncs_WanderUpAndDown);

u8 MovementType_WanderUpAndDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    ClearEventObjectMovement(eventObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 MovementType_WanderUpAndDown_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    EventObjectSetSingleMovement(eventObject, sprite, GetFaceDirectionMovementAction(eventObject->facingDirection));
    sprite->data[1] = 2;
    return 1;
}

u8 MovementType_WanderUpAndDown_Step2(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (EventObjectExecSingleMovementAction(eventObject, sprite) == 0)
    {
        return 0;
    }
    SetMovementDelay(sprite, gMovementDelaysMedium[Random() & 3]);
    sprite->data[1] = 3;
    return 1;
}

u8 MovementType_WanderUpAndDown_Step3(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite))
    {
        sprite->data[1] = 4;
        return 1;
    }
    return 0;
}

u8 MovementType_WanderUpAndDown_Step4(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gUpAndDownDirections, 2);
    direction = directions[Random() & 1];
    SetEventObjectDirection(eventObject, direction);
    sprite->data[1] = 5;
    if (GetCollisionInDirection(eventObject, direction) != 0)
    {
        sprite->data[1] = 1;
    }
    return 1;
}

u8 MovementType_WanderUpAndDown_Step5(struct EventObject *eventObject, struct Sprite *sprite)
{
    EventObjectSetSingleMovement(eventObject, sprite, GetWalkNormalMovementAction(eventObject->movementDirection));
    eventObject->singleMovementActive = 1;
    sprite->data[1] = 6;
    return 1;
}

u8 MovementType_WanderUpAndDown_Step6(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (EventObjectExecSingleMovementAction(eventObject, sprite) != 0)
    {
        eventObject->singleMovementActive = 0;
        sprite->data[1] = 1;
    }
    return 0;
}

movement_type_def(MovementType_WanderLeftAndRight, gMovementTypeFuncs_WanderLeftAndRight);

u8 MovementType_WanderLeftAndRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    ClearEventObjectMovement(eventObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 MovementType_WanderLeftAndRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    EventObjectSetSingleMovement(eventObject, sprite, GetFaceDirectionMovementAction(eventObject->facingDirection));
    sprite->data[1] = 2;
    return 1;
}

u8 MovementType_WanderLeftAndRight_Step2(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (EventObjectExecSingleMovementAction(eventObject, sprite) == 0)
    {
        return 0;
    }
    SetMovementDelay(sprite, gMovementDelaysMedium[Random() & 3]);
    sprite->data[1] = 3;
    return 1;
}

u8 MovementType_WanderLeftAndRight_Step3(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite))
    {
        sprite->data[1] = 4;
        return 1;
    }
    return 0;
}

u8 MovementType_WanderLeftAndRight_Step4(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gLeftAndRightDirections, 2);
    direction = directions[Random() & 1];
    SetEventObjectDirection(eventObject, direction);
    sprite->data[1] = 5;
    if (GetCollisionInDirection(eventObject, direction) != 0)
    {
        sprite->data[1] = 1;
    }
    return 1;
}

u8 MovementType_WanderLeftAndRight_Step5(struct EventObject *eventObject, struct Sprite *sprite)
{
    EventObjectSetSingleMovement(eventObject, sprite, GetWalkNormalMovementAction(eventObject->movementDirection));
    eventObject->singleMovementActive = 1;
    sprite->data[1] = 6;
    return 1;
}

u8 MovementType_WanderLeftAndRight_Step6(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (EventObjectExecSingleMovementAction(eventObject, sprite) != 0)
    {
        eventObject->singleMovementActive = 0;
        sprite->data[1] = 1;
    }
    return 0;
}

movement_type_def(MovementType_FaceDirection, gMovementTypeFuncs_FaceDirection);

u8 MovementType_FaceDirection_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    ClearEventObjectMovement(eventObject, sprite);
    EventObjectSetSingleMovement(eventObject, sprite, GetFaceDirectionMovementAction(eventObject->facingDirection));
    sprite->data[1] = 1;
    return 1;
}

u8 MovementType_FaceDirection_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (EventObjectExecSingleMovementAction(eventObject, sprite) != 0)
    {
        sprite->data[1] = 2;
        return 1;
    }
    return 0;
}

u8 MovementType_FaceDirection_Step2(struct EventObject *eventObject, struct Sprite *sprite)
{
    eventObject->singleMovementActive = 0;
    return 0;
}

void MovementType_BerryTreeGrowth(struct Sprite *sprite)
{
    struct EventObject *eventObject;
    eventObject = &gEventObjects[sprite->data[0]];
    if (!(sprite->data[7] & 1))
    {
        get_berry_tree_graphics(eventObject, sprite);
        sprite->data[7] |= 1;
    }
    UpdateEventObjectCurrentMovement(eventObject, sprite, MovementType_BerryTreeGrowth_Callback);
}

static u8 MovementType_BerryTreeGrowth_Callback(struct EventObject *eventObject, struct Sprite *sprite)
{
    return gMovementTypeFuncs_BerryTreeGrowth[sprite->data[1]](eventObject, sprite);
}

u8 MovementType_BerryTreeGrowth_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 berryTreeStage;
    ClearEventObjectMovement(eventObject, sprite);
    eventObject->invisible = 1;
    sprite->invisible = 1;
    berryTreeStage = GetStageByBerryTreeId(eventObject->trainerRange_berryTreeId);
    if (!berryTreeStage)
    {
        if (!(sprite->data[7] & 4) && sprite->animNum == 4)
        {
            gFieldEffectArguments[0] = eventObject->currentCoords.x;
            gFieldEffectArguments[1] = eventObject->currentCoords.y;
            gFieldEffectArguments[2] = sprite->subpriority - 1;
            gFieldEffectArguments[3] = sprite->oam.priority;
            FieldEffectStart(FLDEFF_BERRY_TREE_GROWTH_SPARKLE);
            sprite->animNum = 0;
        }
        return 0;
    }
    eventObject->invisible = 0;
    sprite->invisible = 0;
    berryTreeStage--;
    if (sprite->animNum != berryTreeStage)
    {
        sprite->data[1] = 2;
        return 1;
    }
    get_berry_tree_graphics(eventObject, sprite);
    EventObjectSetSingleMovement(eventObject, sprite, MOVEMENT_ACTION_START_ANIM_IN_DIRECTION);
    sprite->data[1] = 1;
    return 1;
}

u8 MovementType_BerryTreeGrowth_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (EventObjectExecSingleMovementAction(eventObject, sprite))
    {
        sprite->data[1] = 0;
        return 1;
    }
    return 0;
}

u8 MovementType_BerryTreeGrowth_Step2(struct EventObject *eventObject, struct Sprite *sprite)
{
    eventObject->singleMovementActive = 1;
    sprite->data[1] = 3;
    sprite->data[2] = 0;
    sprite->data[7] |= 2;
    gFieldEffectArguments[0] = eventObject->currentCoords.x;
    gFieldEffectArguments[1] = eventObject->currentCoords.y;
    gFieldEffectArguments[2] = sprite->subpriority - 1;
    gFieldEffectArguments[3] = sprite->oam.priority;
    FieldEffectStart(FLDEFF_BERRY_TREE_GROWTH_SPARKLE);
    return 1;
}

u8 MovementType_BerryTreeGrowth_Step3(struct EventObject *eventObject, struct Sprite *sprite)
{
    sprite->data[2]++;
    eventObject->invisible = ((sprite->data[2] & 0x2) >> 1);
    sprite->animPaused = 1;
    if (sprite->data[2] > 64)
    {
        get_berry_tree_graphics(eventObject, sprite);
        sprite->data[1] = 4;
        sprite->data[2] = 0;
        return 1;
    }
    return 0;
}

u8 MovementType_BerryTreeGrowth_Step4(struct EventObject *eventObject, struct Sprite *sprite)
{
    sprite->data[2]++;
    eventObject->invisible = ((sprite->data[2] & 0x2) >> 1);
    sprite->animPaused = 1;
    if (sprite->data[2] > 64)
    {
        sprite->data[1] = 0;
        sprite->data[7] &= (-3);
        return 1;
    }
    return 0;
}

movement_type_def(MovementType_FaceDownAndUp, gMovementTypeFuncs_FaceDownAndUp);

u8 MovementType_FaceDownAndUp_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    ClearEventObjectMovement(eventObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 MovementType_FaceDownAndUp_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    EventObjectSetSingleMovement(eventObject, sprite, GetFaceDirectionMovementAction(eventObject->facingDirection));
    sprite->data[1] = 2;
    return 1;
}

u8 MovementType_FaceDownAndUp_Step2(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (EventObjectExecSingleMovementAction(eventObject, sprite))
    {
        SetMovementDelay(sprite, gMovementDelaysMedium[Random() & 3]);
        eventObject->singleMovementActive = 0;
        sprite->data[1] = 3;
    }
    return 0;
}

u8 MovementType_FaceDownAndUp_Step3(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite) || EventObjectIsTrainerAndCloseToPlayer(eventObject))
    {
        sprite->data[1] = 4;
        return 1;
    }
    return 0;
}

u8 MovementType_FaceDownAndUp_Step4(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gUpAndDownDirections, 2);
    direction = TryGetTrainerEncounterDirection(eventObject, 1);
    if (direction == DIR_NONE)
    {
        direction = directions[Random() & 1];
    }
    SetEventObjectDirection(eventObject, direction);
    sprite->data[1] = 1;
    return 1;
}

movement_type_def(MovementType_FaceLeftAndRight, gMovementTypeFuncs_FaceLeftAndRight);

u8 MovementType_FaceLeftAndRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    ClearEventObjectMovement(eventObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 MovementType_FaceLeftAndRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    EventObjectSetSingleMovement(eventObject, sprite, GetFaceDirectionMovementAction(eventObject->facingDirection));
    sprite->data[1] = 2;
    return 1;
}

u8 MovementType_FaceLeftAndRight_Step2(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (EventObjectExecSingleMovementAction(eventObject, sprite))
    {
        SetMovementDelay(sprite, gMovementDelaysMedium[Random() & 3]);
        eventObject->singleMovementActive = 0;
        sprite->data[1] = 3;
    }
    return 0;
}

u8 MovementType_FaceLeftAndRight_Step3(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite) || EventObjectIsTrainerAndCloseToPlayer(eventObject))
    {
        sprite->data[1] = 4;
        return 1;
    }
    return 0;
}

u8 MovementType_FaceLeftAndRight_Step4(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gLeftAndRightDirections, 2);
    direction = TryGetTrainerEncounterDirection(eventObject, 2);
    if (direction == DIR_NONE)
    {
        direction = directions[Random() & 1];
    }
    SetEventObjectDirection(eventObject, direction);
    sprite->data[1] = 1;
    return 1;
}

movement_type_def(MovementType_FaceUpAndLeft, gMovementTypeFuncs_FaceUpAndLeft);

u8 MovementType_FaceUpAndLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    ClearEventObjectMovement(eventObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 MovementType_FaceUpAndLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    EventObjectSetSingleMovement(eventObject, sprite, GetFaceDirectionMovementAction(eventObject->facingDirection));
    sprite->data[1] = 2;
    return 1;
}

u8 MovementType_FaceUpAndLeft_Step2(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (EventObjectExecSingleMovementAction(eventObject, sprite))
    {
        SetMovementDelay(sprite, gMovementDelaysShort[Random() & 3]);
        eventObject->singleMovementActive = 0;
        sprite->data[1] = 3;
    }
    return 0;
}

u8 MovementType_FaceUpAndLeft_Step3(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite) || EventObjectIsTrainerAndCloseToPlayer(eventObject))
    {
        sprite->data[1] = 4;
        return 1;
    }
    return 0;
}

u8 MovementType_FaceUpAndLeft_Step4(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gUpAndLeftDirections, 2);
    direction = TryGetTrainerEncounterDirection(eventObject, 3);
    if (direction == DIR_NONE)
    {
        direction = directions[Random() & 1];
    }
    SetEventObjectDirection(eventObject, direction);
    sprite->data[1] = 1;
    return 1;
}

movement_type_def(MovementType_FaceUpAndRight, gMovementTypeFuncs_FaceUpAndRight);

u8 MovementType_FaceUpAndRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    ClearEventObjectMovement(eventObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 MovementType_FaceUpAndRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    EventObjectSetSingleMovement(eventObject, sprite, GetFaceDirectionMovementAction(eventObject->facingDirection));
    sprite->data[1] = 2;
    return 1;
}

u8 MovementType_FaceUpAndRight_Step2(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (EventObjectExecSingleMovementAction(eventObject, sprite))
    {
        SetMovementDelay(sprite, gMovementDelaysShort[Random() & 3]);
        eventObject->singleMovementActive = 0;
        sprite->data[1] = 3;
    }
    return 0;
}

u8 MovementType_FaceUpAndRight_Step3(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite) || EventObjectIsTrainerAndCloseToPlayer(eventObject))
    {
        sprite->data[1] = 4;
        return 1;
    }
    return 0;
}

u8 MovementType_FaceUpAndRight_Step4(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gUpAndRightDirections, 2);
    direction = TryGetTrainerEncounterDirection(eventObject, 4);
    if (direction == DIR_NONE)
    {
        direction = directions[Random() & 1];
    }
    SetEventObjectDirection(eventObject, direction);
    sprite->data[1] = 1;
    return 1;
}

movement_type_def(MovementType_FaceDownAndLeft, gMovementTypeFuncs_FaceDownAndLeft);

u8 MovementType_FaceDownAndLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    ClearEventObjectMovement(eventObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 MovementType_FaceDownAndLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    EventObjectSetSingleMovement(eventObject, sprite, GetFaceDirectionMovementAction(eventObject->facingDirection));
    sprite->data[1] = 2;
    return 1;
}

u8 MovementType_FaceDownAndLeft_Step2(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (EventObjectExecSingleMovementAction(eventObject, sprite))
    {
        SetMovementDelay(sprite, gMovementDelaysShort[Random() & 3]);
        eventObject->singleMovementActive = 0;
        sprite->data[1] = 3;
    }
    return 0;
}

u8 MovementType_FaceDownAndLeft_Step3(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite) || EventObjectIsTrainerAndCloseToPlayer(eventObject))
    {
        sprite->data[1] = 4;
        return 1;
    }
    return 0;
}

u8 MovementType_FaceDownAndLeft_Step4(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gDownAndLeftDirections, 2);
    direction = TryGetTrainerEncounterDirection(eventObject, 5);
    if (direction == DIR_NONE)
    {
        direction = directions[Random() & 1];
    }
    SetEventObjectDirection(eventObject, direction);
    sprite->data[1] = 1;
    return 1;
}

movement_type_def(MovementType_FaceDownAndRight, gMovementTypeFuncs_FaceDownAndRight);

u8 MovementType_FaceDownAndRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    ClearEventObjectMovement(eventObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 MovementType_FaceDownAndRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    EventObjectSetSingleMovement(eventObject, sprite, GetFaceDirectionMovementAction(eventObject->facingDirection));
    sprite->data[1] = 2;
    return 1;
}

u8 MovementType_FaceDownAndRight_Step2(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (EventObjectExecSingleMovementAction(eventObject, sprite))
    {
        SetMovementDelay(sprite, gMovementDelaysShort[Random() & 3]);
        eventObject->singleMovementActive = 0;
        sprite->data[1] = 3;
    }
    return 0;
}

u8 MovementType_FaceDownAndRight_Step3(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite) || EventObjectIsTrainerAndCloseToPlayer(eventObject))
    {
        sprite->data[1] = 4;
        return 1;
    }
    return 0;
}

u8 MovementType_FaceDownAndRight_Step4(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gDownAndRightDirections, 2);
    direction = TryGetTrainerEncounterDirection(eventObject, 6);
    if (direction == DIR_NONE)
    {
        direction = directions[Random() & 1];
    }
    SetEventObjectDirection(eventObject, direction);
    sprite->data[1] = 1;
    return 1;
}

movement_type_def(MovementType_FaceDownUpAndLeft, gMovementTypeFuncs_FaceDownUpAndLeft);

u8 MovementType_FaceDownUpAndLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    ClearEventObjectMovement(eventObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 MovementType_FaceDownUpAndLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    EventObjectSetSingleMovement(eventObject, sprite, GetFaceDirectionMovementAction(eventObject->facingDirection));
    sprite->data[1] = 2;
    return 1;
}

u8 MovementType_FaceDownUpAndLeft_Step2(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (EventObjectExecSingleMovementAction(eventObject, sprite))
    {
        SetMovementDelay(sprite, gMovementDelaysShort[Random() & 3]);
        eventObject->singleMovementActive = 0;
        sprite->data[1] = 3;
    }
    return 0;
}

u8 MovementType_FaceDownUpAndLeft_Step3(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite) || EventObjectIsTrainerAndCloseToPlayer(eventObject))
    {
        sprite->data[1] = 4;
        return 1;
    }
    return 0;
}

u8 MovementType_FaceDownUpAndLeft_Step4(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[4];
    memcpy(directions, gDownUpAndLeftDirections, 4);
    direction = TryGetTrainerEncounterDirection(eventObject, 7);
    if (direction == DIR_NONE)
    {
        direction = directions[Random() & 3];
    }
    SetEventObjectDirection(eventObject, direction);
    sprite->data[1] = 1;
    return 1;
}

movement_type_def(MovementType_FaceDownUpAndRight, gMovementTypeFuncs_FaceDownUpAndRight);

u8 MovementType_FaceDownUpAndRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    ClearEventObjectMovement(eventObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 MovementType_FaceDownUpAndRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    EventObjectSetSingleMovement(eventObject, sprite, GetFaceDirectionMovementAction(eventObject->facingDirection));
    sprite->data[1] = 2;
    return 1;
}

u8 MovementType_FaceDownUpAndRight_Step2(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (EventObjectExecSingleMovementAction(eventObject, sprite))
    {
        SetMovementDelay(sprite, gMovementDelaysShort[Random() & 3]);
        eventObject->singleMovementActive = 0;
        sprite->data[1] = 3;
    }
    return 0;
}

u8 MovementType_FaceDownUpAndRight_Step3(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite) || EventObjectIsTrainerAndCloseToPlayer(eventObject))
    {
        sprite->data[1] = 4;
        return 1;
    }
    return 0;
}

u8 MovementType_FaceDownUpAndRight_Step4(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[4];
    memcpy(directions, gDownUpAndRightDirections, 4);
    direction = TryGetTrainerEncounterDirection(eventObject, 8);
    if (direction == DIR_NONE)
    {
        direction = directions[Random() & 3];
    }
    SetEventObjectDirection(eventObject, direction);
    sprite->data[1] = 1;
    return 1;
}

movement_type_def(MovementType_FaceUpLeftAndRight, gMovementTypeFuncs_FaceUpLeftAndRight);

u8 MovementType_FaceUpLeftAndRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    ClearEventObjectMovement(eventObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 MovementType_FaceUpLeftAndRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    EventObjectSetSingleMovement(eventObject, sprite, GetFaceDirectionMovementAction(eventObject->facingDirection));
    sprite->data[1] = 2;
    return 1;
}

u8 MovementType_FaceUpLeftAndRight_Step2(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (EventObjectExecSingleMovementAction(eventObject, sprite))
    {
        SetMovementDelay(sprite, gMovementDelaysShort[Random() & 3]);
        eventObject->singleMovementActive = 0;
        sprite->data[1] = 3;
    }
    return 0;
}

u8 MovementType_FaceUpLeftAndRight_Step3(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite) || EventObjectIsTrainerAndCloseToPlayer(eventObject))
    {
        sprite->data[1] = 4;
        return 1;
    }
    return 0;
}

u8 MovementType_FaceUpLeftAndRight_Step4(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[4];
    memcpy(directions, gUpLeftAndRightDirections, 4);
    direction = TryGetTrainerEncounterDirection(eventObject, 9);
    if (direction == DIR_NONE)
    {
        direction = directions[Random() & 3];
    }
    SetEventObjectDirection(eventObject, direction);
    sprite->data[1] = 1;
    return 1;
}

movement_type_def(MovementType_FaceDownLeftAndRight, gMovementTypeFuncs_FaceDownLeftAndRight);

u8 MovementType_FaceDownLeftAndRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    ClearEventObjectMovement(eventObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 MovementType_FaceDownLeftAndRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    EventObjectSetSingleMovement(eventObject, sprite, GetFaceDirectionMovementAction(eventObject->facingDirection));
    sprite->data[1] = 2;
    return 1;
}

u8 MovementType_FaceDownLeftAndRight_Step2(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (EventObjectExecSingleMovementAction(eventObject, sprite))
    {
        SetMovementDelay(sprite, gMovementDelaysShort[Random() & 3]);
        eventObject->singleMovementActive = 0;
        sprite->data[1] = 3;
    }
    return 0;
}

u8 MovementType_FaceDownLeftAndRight_Step3(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite) || EventObjectIsTrainerAndCloseToPlayer(eventObject))
    {
        sprite->data[1] = 4;
        return 1;
    }
    return 0;
}

u8 MovementType_FaceDownLeftAndRight_Step4(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[4];
    memcpy(directions, gDownLeftAndRightDirections, 4);
    direction = TryGetTrainerEncounterDirection(eventObject, 10);
    if (direction == DIR_NONE)
    {
        direction = directions[Random() & 3];
    }
    SetEventObjectDirection(eventObject, direction);
    sprite->data[1] = 1;
    return 1;
}

movement_type_def(MovementType_RotateCounterclockwise, gMovementTypeFuncs_RotateCounterclockwise);

u8 MovementType_RotateCounterclockwise_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    ClearEventObjectMovement(eventObject, sprite);
    EventObjectSetSingleMovement(eventObject, sprite, GetFaceDirectionMovementAction(eventObject->facingDirection));
    sprite->data[1] = 1;
    return 1;
}

u8 MovementType_RotateCounterclockwise_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (EventObjectExecSingleMovementAction(eventObject, sprite))
    {
        SetMovementDelay(sprite, 48);
        sprite->data[1] = 2;
    }
    return 0;
}

u8 MovementType_RotateCounterclockwise_Step2(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite) || EventObjectIsTrainerAndCloseToPlayer(eventObject))
    {
        sprite->data[1] = 3;
    }
    return 0;
}

u8 MovementType_RotateCounterclockwise_Step3(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[5];
    memcpy(directions, gCounterclockwiseDirections, 5);
    direction = TryGetTrainerEncounterDirection(eventObject, 0);
    if (direction == DIR_NONE)
    {
        direction = directions[eventObject->facingDirection];
    }
    SetEventObjectDirection(eventObject, direction);
    sprite->data[1] = 0;
    return 1;
}

movement_type_def(MovementType_RotateClockwise, gMovementTypeFuncs_RotateClockwise);

u8 MovementType_RotateClockwise_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    ClearEventObjectMovement(eventObject, sprite);
    EventObjectSetSingleMovement(eventObject, sprite, GetFaceDirectionMovementAction(eventObject->facingDirection));
    sprite->data[1] = 1;
    return 1;
}

u8 MovementType_RotateClockwise_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (EventObjectExecSingleMovementAction(eventObject, sprite))
    {
        SetMovementDelay(sprite, 0x30);
        sprite->data[1] = 2;
    }
    return 0;
}

u8 MovementType_RotateClockwise_Step2(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite) || EventObjectIsTrainerAndCloseToPlayer(eventObject))
    {
        sprite->data[1] = 3;
    }
    return 0;
}

u8 MovementType_RotateClockwise_Step3(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[5];
    memcpy(directions, gClockwiseDirections, 5);
    direction = TryGetTrainerEncounterDirection(eventObject, 0);
    if (direction == DIR_NONE)
    {
        direction = directions[eventObject->facingDirection];
    }
    SetEventObjectDirection(eventObject, direction);
    sprite->data[1] = 0;
    return 1;
}

movement_type_def(MovementType_WalkBackAndForth, gMovementTypeFuncs_WalkBackAndForth);

u8 MovementType_WalkBackAndForth_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    ClearEventObjectMovement(eventObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 MovementType_WalkBackAndForth_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 direction;
    direction = gInitialMovementTypeFacingDirections[eventObject->movementType];
    if (eventObject->directionSequenceIndex != 0)
    {
        direction = GetOppositeDirection(direction);
    }
    SetEventObjectDirection(eventObject, direction);
    sprite->data[1] = 2;
    return 1;
}

u8 MovementType_WalkBackAndForth_Step2(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 collisionState;
    u8 movementActionId;
    if (eventObject->directionSequenceIndex && eventObject->initialCoords.x == eventObject->currentCoords.x && eventObject->initialCoords.y == eventObject->currentCoords.y)
    {
        eventObject->directionSequenceIndex = 0;
        SetEventObjectDirection(eventObject, GetOppositeDirection(eventObject->movementDirection));
    }
    collisionState = GetCollisionInDirection(eventObject, eventObject->movementDirection);
    movementActionId = GetWalkNormalMovementAction(eventObject->movementDirection);
    if (collisionState == 1)
    {
        eventObject->directionSequenceIndex++;
        SetEventObjectDirection(eventObject, GetOppositeDirection(eventObject->movementDirection));
        movementActionId = GetWalkNormalMovementAction(eventObject->movementDirection);
        collisionState = GetCollisionInDirection(eventObject, eventObject->movementDirection);
    }
    if (collisionState != 0)
    {
        movementActionId = GetWalkInPlaceNormalMovementAction(eventObject->facingDirection);
    }
    EventObjectSetSingleMovement(eventObject, sprite, movementActionId);
    eventObject->singleMovementActive = 1;
    sprite->data[1] = 3;
    return 1;
}

u8 MovementType_WalkBackAndForth_Step3(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (EventObjectExecSingleMovementAction(eventObject, sprite))
    {
        eventObject->singleMovementActive = 0;
        sprite->data[1] = 1;
    }
    return 0;
}

u8 MovementType_WalkSequence_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    ClearEventObjectMovement(eventObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 MoveNextDirectionInSequence(struct EventObject *eventObject, struct Sprite *sprite, u8 *directionSequence)
{
    u8 collisionState;
    u8 movementActionId;
    if (eventObject->directionSequenceIndex == 3 && eventObject->initialCoords.x == eventObject->currentCoords.x && eventObject->initialCoords.y == eventObject->currentCoords.y)
    {
        eventObject->directionSequenceIndex = 0;
    }
    SetEventObjectDirection(eventObject, directionSequence[eventObject->directionSequenceIndex]);
    movementActionId = GetWalkNormalMovementAction(eventObject->movementDirection);
    collisionState = GetCollisionInDirection(eventObject, eventObject->movementDirection);
    if (collisionState == 1)
    {
        eventObject->directionSequenceIndex++;
        SetEventObjectDirection(eventObject, directionSequence[eventObject->directionSequenceIndex]);
        movementActionId = GetWalkNormalMovementAction(eventObject->movementDirection);
        collisionState = GetCollisionInDirection(eventObject, eventObject->movementDirection);
    }
    if (collisionState != 0)
    {
        movementActionId = GetWalkInPlaceNormalMovementAction(eventObject->facingDirection);
    }
    EventObjectSetSingleMovement(eventObject, sprite, movementActionId);
    eventObject->singleMovementActive = 1;
    sprite->data[1] = 2;
    return 1;
}

u8 MovementType_WalkSequence_Step2(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (EventObjectExecSingleMovementAction(eventObject, sprite))
    {
        eventObject->singleMovementActive = 0;
        sprite->data[1] = 1;
    }
    return 0;
}

movement_type_def(MovementType_WalkSequenceUpRightLeftDown, gMovementTypeFuncs_WalkSequenceUpRightLeftDown);

u8 MovementType_WalkSequenceUpRightLeftDown_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUpRightLeftDownDirections, 4);
    if (eventObject->directionSequenceIndex == 2 && eventObject->initialCoords.x == eventObject->currentCoords.x)
    {
        eventObject->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(eventObject, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceRightLeftDownUp, gMovementTypeFuncs_WalkSequenceRightLeftDownUp);

u8 MovementType_WalkSequenceRightLeftDownUp_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gRightLeftDownUpDirections, 4);
    if (eventObject->directionSequenceIndex == 1 && eventObject->initialCoords.x == eventObject->currentCoords.x)
    {
        eventObject->directionSequenceIndex = 2;
    }
    return MoveNextDirectionInSequence(eventObject, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceDownUpRightLeft, gMovementTypeFuncs_WalkSequenceDownUpRightLeft);

u8 MovementType_WalkSequenceDownUpRightLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gDownUpRightLeftDirections, 4);
    if (eventObject->directionSequenceIndex == 1 && eventObject->initialCoords.y == eventObject->currentCoords.y)
    {
        eventObject->directionSequenceIndex = 2;
    }
    return MoveNextDirectionInSequence(eventObject, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceLeftDownUpRight, gMovementTypeFuncs_WalkSequenceLeftDownUpRight);

u8 MovementType_WalkSequenceLeftDownUpRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gLeftDownUpRightDirections, 4);
    if (eventObject->directionSequenceIndex == 2 && eventObject->initialCoords.y == eventObject->currentCoords.y)
    {
        eventObject->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(eventObject, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceUpLeftRightDown, gMovementTypeFuncs_WalkSequenceUpLeftRightDown);

u8 MovementType_WalkSequenceUpLeftRightDown_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUpLeftRightDownDirections, 4);
    if (eventObject->directionSequenceIndex == 2 && eventObject->initialCoords.x == eventObject->currentCoords.x)
    {
        eventObject->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(eventObject, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceLeftRightDownUp, gMovementTypeFuncs_WalkSequenceLeftRightDownUp);

u8 MovementType_WalkSequenceLeftRightDownUp_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gLeftRightDownUpDirections, 4);
    if (eventObject->directionSequenceIndex == 1 && eventObject->initialCoords.x == eventObject->currentCoords.x)
    {
        eventObject->directionSequenceIndex = 2;
    }
    return MoveNextDirectionInSequence(eventObject, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceDownUpLeftRight, gMovementTypeFuncs_WalkSequenceDownUpLeftRight);

u8 MovementType_WalkSequenceDownUpLeftRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gStandardDirections, 4);
    if (eventObject->directionSequenceIndex == 1 && eventObject->initialCoords.y == eventObject->currentCoords.y)
    {
        eventObject->directionSequenceIndex = 2;
    }
    return MoveNextDirectionInSequence(eventObject, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceRightDownUpLeft, gMovementTypeFuncs_WalkSequenceRightDownUpLeft);

u8 MovementType_WalkSequenceRightDownUpLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gRightDownUpLeftDirections, 4);
    if (eventObject->directionSequenceIndex == 2 && eventObject->initialCoords.y == eventObject->currentCoords.y)
    {
        eventObject->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(eventObject, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceLeftUpDownRight, gMovementTypeFuncs_WalkSequenceLeftUpDownRight);

u8 MovementType_WalkSequenceLeftUpDownRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gLeftUpDownRightDirections, 4);
    if (eventObject->directionSequenceIndex == 2 && eventObject->initialCoords.y == eventObject->currentCoords.y)
    {
        eventObject->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(eventObject, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceUpDownRightLeft, gMovementTypeFuncs_WalkSequenceUpDownRightLeft);

u8 MovementType_WalkSequenceUpDownRightLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUpDownRightLeftDirections, 4);
    if (eventObject->directionSequenceIndex == 1 && eventObject->initialCoords.y == eventObject->currentCoords.y)
    {
        eventObject->directionSequenceIndex = 2;
    }
    return MoveNextDirectionInSequence(eventObject, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceRightLeftUpDown, gMovementTypeFuncs_WalkSequenceRightLeftUpDown);

u8 MovementType_WalkSequenceRightLeftUpDown_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gRightLeftUpDownDirections, 4);
    if (eventObject->directionSequenceIndex == 1 && eventObject->initialCoords.x == eventObject->currentCoords.x)
    {
        eventObject->directionSequenceIndex = 2;
    }
    return MoveNextDirectionInSequence(eventObject, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceDownRightLeftUp, gMovementTypeFuncs_WalkSequenceDownRightLeftUp);

u8 MovementType_WalkSequenceDownRightLeftUp_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gDownRightLeftUpDirections, 4);
    if (eventObject->directionSequenceIndex == 2 && eventObject->initialCoords.x == eventObject->currentCoords.x)
    {
        eventObject->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(eventObject, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceRightUpDownLeft, gMovementTypeFuncs_WalkSequenceRightUpDownLeft);

u8 MovementType_WalkSequenceRightUpDownLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gRightUpDownLeftDirections, 4);
    if (eventObject->directionSequenceIndex == 2 && eventObject->initialCoords.y == eventObject->currentCoords.y)
    {
        eventObject->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(eventObject, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceUpDownLeftRight, gMovementTypeFuncs_WalkSequenceUpDownLeftRight);

u8 MovementType_WalkSequenceUpDownLeftRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUpDownLeftRightDirections, 4);
    if (eventObject->directionSequenceIndex == 1 && eventObject->initialCoords.y == eventObject->currentCoords.y)
    {
        eventObject->directionSequenceIndex = 2;
    }
    return MoveNextDirectionInSequence(eventObject, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceLeftRightUpDown, gMovementTypeFuncs_WalkSequenceLeftRightUpDown);

u8 MovementType_WalkSequenceLeftRightUpDown_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gLeftRightUpDownDirections, 4);
    if (eventObject->directionSequenceIndex == 1 && eventObject->initialCoords.x == eventObject->currentCoords.x)
    {
        eventObject->directionSequenceIndex = 2;
    }
    return MoveNextDirectionInSequence(eventObject, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceDownLeftRightUp, gMovementTypeFuncs_WalkSequenceDownLeftRightUp);

u8 MovementType_WalkSequenceDownLeftRightUp_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gDownLeftRightUpDirections, 4);
    if (eventObject->directionSequenceIndex == 2 && eventObject->initialCoords.x == eventObject->currentCoords.x)
    {
        eventObject->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(eventObject, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceUpLeftDownRight, gMovementTypeFuncs_WalkSequenceUpLeftDownRight);

u8 MovementType_WalkSequenceUpLeftDownRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUpLeftDownRightDirections, 4);
    if (eventObject->directionSequenceIndex == 2 && eventObject->initialCoords.y == eventObject->currentCoords.y)
    {
        eventObject->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(eventObject, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceDownRightUpLeft, gMovementTypeFuncs_WalkSequenceDownRightUpLeft);

u8 MovementType_WalkSequenceDownRightUpLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gDownRightUpLeftDirections, 4);
    if (eventObject->directionSequenceIndex == 2 && eventObject->initialCoords.y == eventObject->currentCoords.y)
    {
        eventObject->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(eventObject, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceLeftDownRightUp, gMovementTypeFuncs_WalkSequenceLeftDownRightUp);

u8 MovementType_WalkSequenceLeftDownRightUp_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gLeftDownRightUpDirections, 4);
    if (eventObject->directionSequenceIndex == 2 && eventObject->initialCoords.x == eventObject->currentCoords.x)
    {
        eventObject->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(eventObject, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceRightUpLeftDown, gMovementTypeFuncs_WalkSequenceRightUpLeftDown);

u8 MovementType_WalkSequenceRightUpLeftDown_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gRightUpLeftDownDirections, 4);
    if (eventObject->directionSequenceIndex == 2 && eventObject->initialCoords.x == eventObject->currentCoords.x)
    {
        eventObject->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(eventObject, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceUpRightDownLeft, gMovementTypeFuncs_WalkSequenceUpRightDownLeft);

u8 MovementType_WalkSequenceUpRightDownLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUpRightDownLeftDirections, 4);
    if (eventObject->directionSequenceIndex == 2 && eventObject->initialCoords.y == eventObject->currentCoords.y)
    {
        eventObject->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(eventObject, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceDownLeftUpRight, gMovementTypeFuncs_WalkSequenceDownLeftUpRight);

u8 MovementType_WalkSequenceDownLeftUpRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gDownLeftUpRightDirections, 4);
    if (eventObject->directionSequenceIndex == 2 && eventObject->initialCoords.y == eventObject->currentCoords.y)
    {
        eventObject->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(eventObject, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceLeftUpRightDown, gMovementTypeFuncs_WalkSequenceLeftUpRightDown);

u8 MovementType_WalkSequenceLeftUpRightDown_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gLeftUpRightDownDirections, 4);
    if (eventObject->directionSequenceIndex == 2 && eventObject->initialCoords.x == eventObject->currentCoords.x)
    {
        eventObject->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(eventObject, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceRightDownLeftUp, gMovementTypeFuncs_WalkSequenceRightDownLeftUp);

u8 MovementType_WalkSequenceRightDownLeftUp_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gRightDownLeftUpDirections, 4);
    if (eventObject->directionSequenceIndex == 2 && eventObject->initialCoords.x == eventObject->currentCoords.x)
    {
        eventObject->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(eventObject, sprite, directions);
};

movement_type_def(MovementType_CopyPlayer, gMovementTypeFuncs_CopyPlayer);

u8 MovementType_CopyPlayer_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    ClearEventObjectMovement(eventObject, sprite);
    if (eventObject->directionSequenceIndex == 0)
    {
        eventObject->directionSequenceIndex = GetPlayerFacingDirection();
    }
    sprite->data[1] = 1;
    return 1;
}

u8 MovementType_CopyPlayer_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (gEventObjects[gPlayerAvatar.eventObjectId].movementActionId == 0xFF || gPlayerAvatar.tileTransitionState == T_TILE_CENTER)
    {
        return 0;
    }
    return gCopyPlayerMovementFuncs[PlayerGetCopyableMovement()](eventObject, sprite, GetPlayerMovementDirection(), NULL);
}

u8 MovementType_CopyPlayer_Step2(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (EventObjectExecSingleMovementAction(eventObject, sprite))
    {
        eventObject->singleMovementActive = 0;
        sprite->data[1] = 1;
    }
    return 0;
}

bool8 CopyablePlayerMovement_None(struct EventObject *eventObject, struct Sprite *sprite, u8 playerDirection, bool8 tileCallback(u8))
{
    return 0;
}

bool8 CopyablePlayerMovement_FaceDirection(struct EventObject *eventObject, struct Sprite *sprite, u8 playerDirection, bool8 tileCallback(u8))
{
    EventObjectSetSingleMovement(eventObject, sprite, GetFaceDirectionMovementAction(state_to_direction(gInitialMovementTypeFacingDirections[eventObject->movementType], eventObject->directionSequenceIndex, playerDirection)));
    eventObject->singleMovementActive = 1;
    sprite->data[1] = 2;
    return 1;
}

bool8 CopyablePlayerMovement_GoSpeed0(struct EventObject *eventObject, struct Sprite *sprite, u8 playerDirection, bool8 tileCallback(u8))
{
    u32 direction;
    s16 x;
    s16 y;

    direction = playerDirection;
    direction = state_to_direction(gInitialMovementTypeFacingDirections[eventObject->movementType], eventObject->directionSequenceIndex, direction);
    EventObjectMoveDestCoords(eventObject, direction, &x, &y);
    EventObjectSetSingleMovement(eventObject, sprite, GetWalkNormalMovementAction(direction));
    if (GetCollisionAtCoords(eventObject, x, y, direction) || (tileCallback != NULL && !tileCallback(MapGridGetMetatileBehaviorAt(x, y))))
    {
        EventObjectSetSingleMovement(eventObject, sprite, GetFaceDirectionMovementAction(direction));
    }
    eventObject->singleMovementActive = 1;
    sprite->data[1] = 2;
    return 1;
}

bool8 CopyablePlayerMovement_GoSpeed1(struct EventObject *eventObject, struct Sprite *sprite, u8 playerDirection, bool8 tileCallback(u8))
{
    u32 direction;
    s16 x;
    s16 y;

    direction = playerDirection;
    direction = state_to_direction(gInitialMovementTypeFacingDirections[eventObject->movementType], eventObject->directionSequenceIndex, direction);
    EventObjectMoveDestCoords(eventObject, direction, &x, &y);
    EventObjectSetSingleMovement(eventObject, sprite, GetWalkFastMovementAction(direction));
    if (GetCollisionAtCoords(eventObject, x, y, direction) || (tileCallback != NULL && !tileCallback(MapGridGetMetatileBehaviorAt(x, y))))
    {
        EventObjectSetSingleMovement(eventObject, sprite, GetFaceDirectionMovementAction(direction));
    }
    eventObject->singleMovementActive = TRUE;
    sprite->data[1] = 2;
    return TRUE;
}

bool8 CopyablePlayerMovement_GoSpeed2(struct EventObject *eventObject, struct Sprite *sprite, u8 playerDirection, bool8 tileCallback(u8))
{
    u32 direction;
    s16 x;
    s16 y;

    direction = playerDirection;
    direction = state_to_direction(gInitialMovementTypeFacingDirections[eventObject->movementType], eventObject->directionSequenceIndex, direction);
    EventObjectMoveDestCoords(eventObject, direction, &x, &y);
    EventObjectSetSingleMovement(eventObject, sprite, GetWalkFastestMovementAction(direction));
    if (GetCollisionAtCoords(eventObject, x, y, direction) || (tileCallback != NULL && !tileCallback(MapGridGetMetatileBehaviorAt(x, y))))
    {
        EventObjectSetSingleMovement(eventObject, sprite, GetFaceDirectionMovementAction(direction));
    }
    eventObject->singleMovementActive = TRUE;
    sprite->data[1] = 2;
    return TRUE;
}

bool8 CopyablePlayerMovement_Slide(struct EventObject *eventObject, struct Sprite *sprite, u8 playerDirection, bool8 tileCallback(u8))
{
    u32 direction;
    s16 x;
    s16 y;

    direction = playerDirection;
    direction = state_to_direction(gInitialMovementTypeFacingDirections[eventObject->movementType], eventObject->directionSequenceIndex, direction);
    EventObjectMoveDestCoords(eventObject, direction, &x, &y);
    EventObjectSetSingleMovement(eventObject, sprite, GetSlideMovementAction(direction));
    if (GetCollisionAtCoords(eventObject, x, y, direction) || (tileCallback != NULL && !tileCallback(MapGridGetMetatileBehaviorAt(x, y))))
    {
        EventObjectSetSingleMovement(eventObject, sprite, GetFaceDirectionMovementAction(direction));
    }
    eventObject->singleMovementActive = TRUE;
    sprite->data[1] = 2;
    return TRUE;
}

bool8 cph_IM_DIFFERENT(struct EventObject *eventObject, struct Sprite *sprite, u8 playerDirection, bool8 tileCallback(u8))
{
    u32 direction;

    direction = playerDirection;
    direction = state_to_direction(gInitialMovementTypeFacingDirections[eventObject->movementType], eventObject->directionSequenceIndex, direction);
    EventObjectSetSingleMovement(eventObject, sprite, GetJumpInPlaceMovementAction(direction));
    eventObject->singleMovementActive = TRUE;
    sprite->data[1] = 2;
    return TRUE;
}

bool8 CopyablePlayerMovement_GoSpeed4(struct EventObject *eventObject, struct Sprite *sprite, u8 playerDirection, bool8 tileCallback(u8))
{
    u32 direction;
    s16 x;
    s16 y;

    direction = playerDirection;
    direction = state_to_direction(gInitialMovementTypeFacingDirections[eventObject->movementType], eventObject->directionSequenceIndex, direction);
    EventObjectMoveDestCoords(eventObject, direction, &x, &y);
    EventObjectSetSingleMovement(eventObject, sprite, GetJumpMovementAction(direction));
    if (GetCollisionAtCoords(eventObject, x, y, direction) || (tileCallback != NULL && !tileCallback(MapGridGetMetatileBehaviorAt(x, y))))
    {
        EventObjectSetSingleMovement(eventObject, sprite, GetFaceDirectionMovementAction(direction));
    }
    eventObject->singleMovementActive = TRUE;
    sprite->data[1] = 2;
    return TRUE;
}

bool8 CopyablePlayerMovement_Jump(struct EventObject *eventObject, struct Sprite *sprite, u8 playerDirection, bool8 tileCallback(u8))
{
    u32 direction;
    s16 x;
    s16 y;

    direction = playerDirection;
    direction = state_to_direction(gInitialMovementTypeFacingDirections[eventObject->movementType], eventObject->directionSequenceIndex, direction);
    x = eventObject->currentCoords.x;
    y = eventObject->currentCoords.y;
    MoveCoordsInDirection(direction, &x, &y, 2, 2);
    EventObjectSetSingleMovement(eventObject, sprite, GetJump2MovementAction(direction));
    if (GetCollisionAtCoords(eventObject, x, y, direction) || (tileCallback != NULL && !tileCallback(MapGridGetMetatileBehaviorAt(x, y))))
    {
        EventObjectSetSingleMovement(eventObject, sprite, GetFaceDirectionMovementAction(direction));
    }
    eventObject->singleMovementActive = TRUE;
    sprite->data[1] = 2;
    return TRUE;
}

movement_type_def(MovementType_CopyPlayerInGrass, gMovementTypeFuncs_CopyPlayerInGrass);

u8 MovementType_CopyPlayerInGrass_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (gEventObjects[gPlayerAvatar.eventObjectId].movementActionId == 0xFF || gPlayerAvatar.tileTransitionState == T_TILE_CENTER)
    {
        return 0;
    }
    return gCopyPlayerMovementFuncs[PlayerGetCopyableMovement()](eventObject, sprite, GetPlayerMovementDirection(), MetatileBehavior_IsPokeGrass);
}

void MovementType_TreeDisguise(struct Sprite *sprite)
{
    struct EventObject *eventObject;
    eventObject = &gEventObjects[sprite->data[0]];
    if (eventObject->directionSequenceIndex == 0 || (eventObject->directionSequenceIndex == 1 && sprite->data[7] == 0))
    {
        EventObjectGetLocalIdAndMap(eventObject, &gFieldEffectArguments[0], &gFieldEffectArguments[1], &gFieldEffectArguments[2]);
        eventObject->fieldEffectSpriteId = FieldEffectStart(FLDEFF_TREE_DISGUISE);
        eventObject->directionSequenceIndex = 1;
        sprite->data[7]++;
    }
    UpdateEventObjectCurrentMovement(&gEventObjects[sprite->data[0]], sprite, MovementType_Disguise_Callback);
}

static u8 MovementType_Disguise_Callback(struct EventObject *eventObject, struct Sprite *sprite)
{
    ClearEventObjectMovement(eventObject, sprite);
    return 0;
}

void MovementType_MountainDisguise(struct Sprite *sprite)
{
    struct EventObject *eventObject;
    eventObject = &gEventObjects[sprite->data[0]];
    if (eventObject->directionSequenceIndex == 0 || (eventObject->directionSequenceIndex == 1 && sprite->data[7] == 0))
    {
        EventObjectGetLocalIdAndMap(eventObject, &gFieldEffectArguments[0], &gFieldEffectArguments[1], &gFieldEffectArguments[2]);
        eventObject->fieldEffectSpriteId = FieldEffectStart(FLDEFF_MOUNTAIN_DISGUISE);
        eventObject->directionSequenceIndex = 1;
        sprite->data[7]++;
    }
    UpdateEventObjectCurrentMovement(&gEventObjects[sprite->data[0]], sprite, MovementType_Disguise_Callback);
}

void MovementType_Hidden(struct Sprite *sprite)
{
    if (sprite->data[7] == 0)
    {
        gEventObjects[sprite->data[0]].fixedPriority = 1;
        sprite->subspriteMode = 2;
        sprite->oam.priority = 3;
        sprite->data[7]++;
    }
    UpdateEventObjectCurrentMovement(&gEventObjects[sprite->data[0]], sprite, MovementType_Hidden_Callback);
}

static u8 MovementType_Hidden_Callback(struct EventObject *eventObject, struct Sprite *sprite)
{
    return gMovementTypeFuncs_Hidden[sprite->data[1]](eventObject, sprite);
}

u8 MovementType_Hidden_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    ClearEventObjectMovement(eventObject, sprite);
    return 0;
}

u8 MovementType_MoveInPlace_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (EventObjectExecSingleMovementAction(eventObject, sprite))
    {
        sprite->data[1] = 0;
    }
    return 0;
}

movement_type_def(MovementType_WalkInPlace, gMovementTypeFuncs_WalkInPlace);

u8 MovementType_WalkInPlace_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    ClearEventObjectMovement(eventObject, sprite);
    EventObjectSetSingleMovement(eventObject, sprite, GetWalkInPlaceNormalMovementAction(eventObject->facingDirection));
    sprite->data[1] = 1;
    return 1;
}

movement_type_def(MovementType_JogInPlace, gMovementTypeFuncs_JogInPlace);

u8 MovementType_JogInPlace_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    ClearEventObjectMovement(eventObject, sprite);
    EventObjectSetSingleMovement(eventObject, sprite, GetWalkInPlaceFastMovementAction(eventObject->facingDirection));
    sprite->data[1] = 1;
    return 1;
}

movement_type_def(MovementType_RunInPlace, gMovementTypeFuncs_RunInPlace);

u8 MovementType_RunInPlace_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    ClearEventObjectMovement(eventObject, sprite);
    EventObjectSetSingleMovement(eventObject, sprite, GetWalkInPlaceFastestMovementAction(eventObject->facingDirection));
    sprite->data[1] = 1;
    return 1;
}

movement_type_def(MovementType_Invisible, gMovementTypeFuncs_Invisible);

u8 MovementType_Invisible_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    ClearEventObjectMovement(eventObject, sprite);
    EventObjectSetSingleMovement(eventObject, sprite, GetFaceDirectionMovementAction(eventObject->facingDirection));
    eventObject->invisible = 1;
    sprite->data[1] = 1;
    return 1;
}

u8 MovementType_Invisible_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (EventObjectExecSingleMovementAction(eventObject, sprite))
    {
        sprite->data[1] = 2;
        return 1;
    }
    return 0;
}

u8 MovementType_Invisible_Step2(struct EventObject *eventObject, struct Sprite *sprite)
{
    eventObject->singleMovementActive = 0;
    return 0;
}

static void ClearEventObjectMovement(struct EventObject *eventObject, struct Sprite *sprite)
{
    eventObject->singleMovementActive = 0;
    eventObject->heldMovementActive = 0;
    eventObject->heldMovementFinished = 0;
    eventObject->movementActionId = 0xff;
    sprite->data[1] = 0;
}

u8 GetFaceDirectionAnimNum(u8 direction)
{
    return gFaceDirectionAnimNums[direction];
}

u8 GetMoveDirectionAnimNum(u8 direction)
{
    return gMoveDirectionAnimNums[direction];
}

u8 GetMoveDirectionFastAnimNum(u8 direction)
{
    return gMoveDirectionFastAnimNums[direction];
}

u8 GetMoveDirectionFasterAnimNum(u8 direction)
{
    return gMoveDirectionFasterAnimNums[direction];
}

u8 GetMoveDirectionFastestAnimNum(u8 direction)
{
    return gMoveDirectionFastestAnimNums[direction];
}

u8 GetJumpSpecialDirectionAnimNum(u8 direction)
{
    return gJumpSpecialDirectionAnimNums[direction];
}

u8 GetAcroWheelieDirectionAnimNum(u8 direction)
{
    return gAcroWheelieDirectionAnimNums[direction];
}

u8 Unref_GetAnimNums_08375633(u8 direction)
{
    return gUnrefAnimNums_08375633[direction];
}

u8 GetAcroEndWheelieDirectionAnimNum(u8 direction)
{
    return gAcroEndWheelieDirectionAnimNums[direction];
}

u8 GetAcroUnusedActionDirectionAnimNum(u8 direction)
{
    return gAcroUnusedActionDirectionAnimNums[direction];
}

u8 GetAcroWheeliePedalDirectionAnimNum(u8 direction)
{
    return gAcroWheeliePedalDirectionAnimNums[direction];
}

u8 GetFishingDirectionAnimNum(u8 direction)
{
    return gFishingDirectionAnimNums[direction];
}

u8 GetFishingNoCatchDirectionAnimNum(u8 direction)
{
    return gFishingNoCatchDirectionAnimNums[direction];
}

u8 GetFishingBiteDirectionAnimNum(u8 direction)
{
    return gFishingBiteDirectionAnimNums[direction];
}

u8 GetRunningDirectionAnimNum(u8 direction)
{
    return gRunningDirectionAnimNums[direction];
}

void sub_805FE28(struct EventObject *eventObject, struct Sprite *sprite, u8 animNum)
{
    if (!eventObject->inanimate)
    {
        sprite->animNum = animNum;
        if (sprite->animCmdIndex == 1)
        {
            sprite->animCmdIndex = 2;
        } else if (sprite->animCmdIndex == 3)
        {
            sprite->animCmdIndex = 0;
        }
        SeekSpriteAnim(sprite, sprite->animCmdIndex);
    }
}

void sub_805FE64(struct EventObject *eventObject, struct Sprite *sprite, u8 animNum)
{
    u8 animCmdIndex;
    if (!eventObject->inanimate)
    {
        sprite->animNum = animNum;
        animCmdIndex = 3;
        if (sprite->animCmdIndex < 2)
        {
            animCmdIndex = 1;
        }
        SeekSpriteAnim(sprite, animCmdIndex);
    }
}

static u8 GetDirectionToFace(s16 x1, s16 y1, s16 x2, s16 y2)
{
    if (x1 > x2)
        return DIR_WEST;
    if (x1 < x2)
        return DIR_EAST;
    if (y1 > y2)
        return DIR_NORTH;
    return DIR_SOUTH;
}

void SetTrainerMovementType(struct EventObject *eventObject, u8 movementType)
{
    eventObject->movementType = movementType;
    eventObject->directionSequenceIndex = 0;
    eventObject->playerCopyableMovement = 0;
    gSprites[eventObject->spriteId].callback = sMovementTypeCallbacks[movementType];
    gSprites[eventObject->spriteId].data[1] = 0;
}

u8 GetTrainerFacingDirectionMovementType(u8 direction)
{
    return gTrainerFacingDirectionMovementTypes[direction];
}

static u8 GetCollisionInDirection(struct EventObject *eventObject, u8 direction)
{
    s16 x;
    s16 y;
    x = eventObject->currentCoords.x;
    y = eventObject->currentCoords.y;
    MoveCoords(direction, &x, &y);
    return GetCollisionAtCoords(eventObject, x, y, direction);
}

u8 GetCollisionAtCoords(struct EventObject *eventObject, s16 x, s16 y, u32 dirn)
{
    u8 direction;
    direction = dirn;
    if (IsCoordOutsideEventObjectMovementRange(eventObject, x, y))
        return 1;
    else if (MapGridIsImpassableAt(x, y) || GetMapBorderIdAt(x, y) == -1 || IsMetatileDirectionallyImpassable(eventObject, x, y, direction))
        return 2;
    else if (eventObject->trackedByCamera && !CanCameraMoveInDirection(direction))
        return 2;
    else if (IsZCoordMismatchAt(eventObject->currentElevation, x, y))
        return 3;
    else if (DoesObjectCollideWithObjectAt(eventObject, x, y))
        return 4;
    return 0;
}

u8 GetCollisionFlagsAtCoords(struct EventObject *eventObject, s16 x, s16 y, u8 direction)
{
    u8 flags = 0;

    if (IsCoordOutsideEventObjectMovementRange(eventObject, x, y))
        flags |= 1;
    if (MapGridIsImpassableAt(x, y) || GetMapBorderIdAt(x, y) == -1 || IsMetatileDirectionallyImpassable(eventObject, x, y, direction) || (eventObject->trackedByCamera && !CanCameraMoveInDirection(direction)))
        flags |= 2;
    if (IsZCoordMismatchAt(eventObject->currentElevation, x, y))
        flags |= 4;
    if (DoesObjectCollideWithObjectAt(eventObject, x, y))
        flags |= 8;
    return flags;
}

static bool8 IsCoordOutsideEventObjectMovementRange(struct EventObject *eventObject, s16 x, s16 y)
{
    s16 minv;
    s16 maxv;

    if (eventObject->range.as_nybbles.x != 0)
    {
        minv = eventObject->initialCoords.x - (eventObject->range.as_nybbles.x);
        maxv = eventObject->initialCoords.x + (eventObject->range.as_nybbles.x);
        if (minv > x || maxv < x)
            return TRUE;
    }
    if (eventObject->range.as_nybbles.y != 0)
    {
        minv = eventObject->initialCoords.y - (eventObject->range.as_nybbles.y);
        maxv = eventObject->initialCoords.y + (eventObject->range.as_nybbles.y);
        if (minv > y || maxv < y)
            return TRUE;
    }
    return FALSE;
}

static bool8 IsMetatileDirectionallyImpassable(struct EventObject *eventObject, s16 x, s16 y, u8 direction)
{
    if (gOppositeDirectionBlockedMetatileFuncs[direction - 1](eventObject->currentMetatileBehavior)
        || gDirectionBlockedMetatileFuncs[direction - 1](MapGridGetMetatileBehaviorAt(x, y)))
    {
        return 1;
    }
    return 0;
}

static bool8 DoesObjectCollideWithObjectAt(struct EventObject *eventObject, s16 x, s16 y)
{
    u8 i;

    for (i = 0; i < 16; i++)
    {
        struct EventObject *eventObject2 = &gEventObjects[i];

        if (eventObject2->active && eventObject2 != eventObject)
        {
            if (((eventObject2->currentCoords.x == x && eventObject2->currentCoords.y == y) || (eventObject2->previousCoords.x == x && eventObject2->previousCoords.y == y))
             && AreZCoordsCompatible(eventObject->currentElevation, eventObject2->currentElevation))
                return TRUE;
        }
    }
    return 0;
}

bool8 IsBerryTreeSparkling(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 eventObjectId;

    if (!TryGetEventObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &eventObjectId))
        if (gSprites[gEventObjects[eventObjectId].spriteId].data[7] & 2)
            return TRUE;

    return FALSE;
}

void sub_8060288(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 eventObjectId;
    if (!TryGetEventObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &eventObjectId))
    {
        gSprites[gEventObjects[eventObjectId].spriteId].data[7] |= 4;
    }
}

void MoveCoords(u8 direction, s16 *x, s16 *y)
{
    *x += sDirectionToVectors[direction].x;
    *y += sDirectionToVectors[direction].y;
}

void Unref_MovePixelCoords(u8 direction, s16 *x, s16 *y)
{
    *x += sDirectionToVectors[direction].x << 4;
    *y += sDirectionToVectors[direction].y << 4;
}

static void MoveCoordsInDirection(u32 dir, s16 *x, s16 *y, s16 deltaX, s16 deltaY)
{
    u8 direction = dir;
    s16 dx2 = (u16)deltaX;
    s16 dy2 = (u16)deltaY;
    if (sDirectionToVectors[direction].x > 0)
        *x += dx2;
    if (sDirectionToVectors[direction].x < 0)
        *x -= dx2;
    if (sDirectionToVectors[direction].y > 0)
        *y += dy2;
    if (sDirectionToVectors[direction].y < 0)
        *y -= dy2;
}

void sub_8060388(s16 x1, s16 y1, s16 *x2, s16 *y2)
{
    *x2 = (x1 - gSaveBlock1.pos.x) << 4;
    *y2 = (y1 - gSaveBlock1.pos.y) << 4;
    *x2 -= gTotalCameraPixelOffsetX;
    *y2 -= gTotalCameraPixelOffsetY;
}

void sub_80603CC(s16 x1, s16 y1, s16 *x2, s16 *y2)
{
    s16 x3;
    s16 y3;
    x3 = -gTotalCameraPixelOffsetX - gFieldCamera.curMovementOffsetX;
    y3 = -gTotalCameraPixelOffsetY - gFieldCamera.curMovementOffsetY;
    if (gFieldCamera.curMovementOffsetX > 0)
    {
        x3 += 0x10;
    }
    if (gFieldCamera.curMovementOffsetX < 0)
    {
        x3 -= 0x10;
    }
    if (gFieldCamera.curMovementOffsetY > 0)
    {
        y3 += 0x10;
    }
    if (gFieldCamera.curMovementOffsetY < 0)
    {
        y3 -= 0x10;
    }
    *x2 = ((x1 - gSaveBlock1.pos.x) << 4) + x3;
    *y2 = ((y1 - gSaveBlock1.pos.y) << 4) + y3;
}

void sub_8060470(s16 *x, s16 *y, s16 dx, s16 dy)
{
    sub_80603CC(*x, *y, x, y);
    *x += dx;
    *y += dy;
}

void GetEventObjectMovingCameraOffset(s16 *x, s16 *y)
{
    *x = 0;
    *y = 0;
    if (gFieldCamera.curMovementOffsetX > 0)
    {
        (*x)++;
    }
    if (gFieldCamera.curMovementOffsetX < 0)
    {
        (*x)--;
    }
    if (gFieldCamera.curMovementOffsetY > 0)
    {
        (*y)++;
    }
    if (gFieldCamera.curMovementOffsetY < 0)
    {
        (*y)--;
    }
}

void EventObjectMoveDestCoords(struct EventObject *eventObject, u32 direction, s16 *x, s16 *y)
{
    u8 newDirn = direction;
    *x = eventObject->currentCoords.x;
    *y = eventObject->currentCoords.y;
    MoveCoords(newDirn, x, y);
}

bool8 EventObjectIsMovementOverridden(struct EventObject *eventObject)
{
    if (eventObject->singleMovementActive || eventObject->heldMovementActive)
        return TRUE;

    return FALSE;
}

bool8 EventObjectIsHeldMovementActive(struct EventObject *eventObject)
{
    if (eventObject->heldMovementActive && eventObject->movementActionId != 0xff)
        return TRUE;

    return FALSE;
}

bool8 EventObjectSetHeldMovement(struct EventObject *eventObject, u8 movementActionId)
{
    if (EventObjectIsMovementOverridden(eventObject))
        return TRUE;

    UnfreezeEventObject(eventObject);
    eventObject->movementActionId = movementActionId;
    eventObject->heldMovementActive = 1;
    eventObject->heldMovementFinished = 0;
    gSprites[eventObject->spriteId].data[2] = 0;
    return FALSE;
}

void EventObjectForceSetHeldMovement(struct EventObject *eventObject, u8 movementActionId)
{
    EventObjectClearHeldMovementIfActive(eventObject);
    EventObjectSetHeldMovement(eventObject, movementActionId);
}

void EventObjectClearHeldMovementIfActive(struct EventObject *eventObject)
{
    if (eventObject->heldMovementActive)
        EventObjectClearHeldMovement(eventObject);
}

void EventObjectClearHeldMovement(struct EventObject *eventObject)
{
    eventObject->movementActionId = 0xFF;
    eventObject->heldMovementActive = 0;
    eventObject->heldMovementFinished = 0;
    gSprites[eventObject->spriteId].data[1] = 0;
    gSprites[eventObject->spriteId].data[2] = 0;
}

bool8 EventObjectCheckHeldMovementStatus(struct EventObject *eventObject)
{
    if (eventObject->heldMovementActive)
        return eventObject->heldMovementFinished;

    return 16;
}

bool8 EventObjectClearHeldMovementIfFinished(struct EventObject *eventObject)
{
    u8 heldMovementStatus = EventObjectCheckHeldMovementStatus(eventObject);
    if (heldMovementStatus != 0 && heldMovementStatus != 16)
        EventObjectClearHeldMovementIfActive(eventObject);

    return heldMovementStatus;
}

u8 EventObjectGetHeldMovementActionId(struct EventObject *eventObject)
{
    if (eventObject->heldMovementActive)
        return eventObject->movementActionId;

    return 0xFF;
}

void UpdateEventObjectCurrentMovement(struct EventObject *eventObject, struct Sprite *sprite, u8 (*callback)(struct EventObject *, struct Sprite *))
{
    DoGroundEffects_OnSpawn(eventObject, sprite);
    TryEnableEventObjectAnim(eventObject, sprite);
    if (EventObjectIsHeldMovementActive(eventObject))
    {
        EventObjectExecHeldMovementAction(eventObject, sprite);
    }
    else if (!eventObject->frozen)
    {
        while (callback(eventObject, sprite));
    }

    DoGroundEffects_OnBeginStep(eventObject, sprite);
    DoGroundEffects_OnFinishStep(eventObject, sprite);
    UpdateEventObjectSpriteAnimPause(eventObject, sprite);
    UpdateEventObjectVisibility(eventObject, sprite);
    EventObjectUpdateSubpriority(eventObject, sprite);
}

#define dirn_to_anim(name, table)\
u8 name(u32 idx)\
{\
    u8 direction;\
    u8 animIds[sizeof(table)];\
    direction = idx;\
    memcpy(animIds, (table), sizeof(table));\
    if (direction > DIR_EAST) direction = 0;\
    return animIds[direction];\
}

dirn_to_anim(GetFaceDirectionMovementAction, gFaceDirectionMovementActions)
dirn_to_anim(GetWalkSlowMovementAction, gWalkSlowMovementActions)
dirn_to_anim(GetWalkNormalMovementAction, gWalkNormalMovementActions)
dirn_to_anim(GetWalkFastMovementAction, gWalkFastMovementActions)
dirn_to_anim(GetRideWaterCurrentMovementAction, gRideWaterCurrentMovementActions)
dirn_to_anim(GetWalkFastestMovementAction, gWalkFastestMovementActions)
dirn_to_anim(GetSlideMovementAction, gSlideMovementActions)
dirn_to_anim(GetPlayerRunMovementAction, gPlayerRunMovementActions)
dirn_to_anim(GetJump2MovementAction, gJump2MovementActions)
dirn_to_anim(GetJumpInPlaceMovementAction, gJumpInPlaceMovementActions)
dirn_to_anim(GetJumpInPlaceTurnAroundMovementAction, gJumpInPlaceTurnAroundMovementActions)
dirn_to_anim(GetJumpMovementAction, gJumpMovementActions)
dirn_to_anim(GetJumpSpecialMovementAction, gJumpSpecialMovementActions)
dirn_to_anim(GetWalkInPlaceSlowMovementAction, gWalkInPlaceSlowMovementActions)
dirn_to_anim(GetWalkInPlaceNormalMovementAction, gWalkInPlaceNormalMovementActions)
dirn_to_anim(GetWalkInPlaceFastMovementAction, gWalkInPlaceFastMovementActions)
dirn_to_anim(GetWalkInPlaceFastestMovementAction, gWalkInPlaceFastestMovementActions)

u8 EventObjectFaceOppositeDirection(struct EventObject *eventObject, u8 direction)
{
    return EventObjectSetHeldMovement(eventObject, GetFaceDirectionMovementAction(GetOppositeDirection(direction)));
}

u8 GetAcroWheelieFaceDirectionMovementAction(u8 direction)
{
    u8 movementActions[5];
    memcpy(movementActions, gAcroWheelieFaceDirectionMovementActions, 5);
    if (direction >= 5)
    {
        direction = 0;
    }
    return movementActions[direction];
}

u8 GetAcroPopWheelieFaceDirectionMovementAction(u8 direction)
{
    u8 movementActions[5];
    memcpy(movementActions, gAcroPopWheelieFaceDirectionMovementActions, 5);
    if (direction >= 5)
    {
        direction = 0;
    }
    return movementActions[direction];
}

u8 GetAcroEndWheelieFaceDirectionMovementAction(u8 direction)
{
    u8 movementActions[5];
    memcpy(movementActions, gAcroEndWheelieFaceDirectionMovementActions, 5);
    if (direction >= 5)
    {
        direction = 0;
    }
    return movementActions[direction];
}

u8 GetAcroWheelieHopFaceDirectionMovementAction(u8 direction)
{
    u8 movementActions[5];
    memcpy(movementActions, gAcroWheelieHopFaceDirectionMovementActions, 5);
    if (direction >= 5)
    {
        direction = 0;
    }
    return movementActions[direction];
}

u8 GetAcroWheelieHopDirectionMovementAction(u8 direction)
{
    u8 movementActions[5];
    memcpy(movementActions, gAcroWheelieHopDirectionMovementActions, 5);
    if (direction >= 5)
    {
        direction = 0;
    }
    return movementActions[direction];
}

u8 GetAcroWheelieJumpDirectionMovementAction(u8 direction)
{
    u8 movementActions[5];
    memcpy(movementActions, gAcroWheelieJumpDirectionMovementActions, 5);
    if (direction >= 5)
    {
        direction = 0;
    }
    return movementActions[direction];
}

u8 GetAcroWheelieInPlaceDirectionMovementAction(u8 direction)
{
    u8 movementActions[5];
    memcpy(movementActions, gAcroWheelieInPlaceDirectionMovementActions, 5);
    if (direction >= 5)
    {
        direction = 0;
    }
    return movementActions[direction];
}

u8 GetAcroPopWheelieMoveDirectionMovementAction(u8 direction)
{
    u8 movementActions[5];
    memcpy(movementActions, gAcroPopWheelieMoveDirectionMovementActions, 5);
    if (direction >= 5)
    {
        direction = 0;
    }
    return movementActions[direction];
}

u8 GetAcroWheelieMoveDirectionMovementAction(u8 direction)
{
    u8 movementActions[5];
    memcpy(movementActions, gAcroWheelieMoveDirectionMovementActions, 5);
    if (direction >= 5)
    {
        direction = 0;
    }
    return movementActions[direction];
}

u8 GetAcroEndWheelieMoveDirectionMovementAction(u8 direction)
{
    u8 movementActions[5];
    memcpy(movementActions, gAcroEndWheelieMoveDirectionMovementActions, 5);
    if (direction >= 5)
    {
        direction = 0;
    }
    return movementActions[direction];
}

u8 GetOppositeDirection(u8 direction)
{
    u8 oppositeDirections[8];
    memcpy(oppositeDirections, gOppositeDirections, 8);
    if (direction == DIR_NONE || direction > 8)
    {
        return direction;
    }
    return oppositeDirections[direction - 1];
}

u32 zffu_offset_calc(u8 a0, u8 a1)
{
    return gUnknown_08375757[a0 - 1][a1 - 1];
}

u32 state_to_direction(u8 a0, u32 a1, u32 a2)
{
    u32 zffuOffset;
    u8 a1_2 = a1;
    u8 a2_2 = a2;
    if (a1_2 == 0 || a2_2 == 0 || a1_2 > DIR_EAST || a2_2 > DIR_EAST)
    {
        return 0;
    }
    zffuOffset = zffu_offset_calc(a1_2, a2);
    return gUnknown_08375767[a0 - 1][zffuOffset - 1];
}

static void EventObjectExecHeldMovementAction(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (gMovementActionFuncs[eventObject->movementActionId][sprite->data[2]](eventObject, sprite))
    {
        eventObject->heldMovementFinished = 1;
    }
}

static bool8 EventObjectExecSingleMovementAction(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (gMovementActionFuncs[eventObject->movementActionId][sprite->data[2]](eventObject, sprite))
    {
        eventObject->movementActionId = 0xFF;
        sprite->data[2] = 0;
        return 1;
    }

    return 0;
}

static void EventObjectSetSingleMovement(struct EventObject *eventObject, struct Sprite *sprite, u8 movementActionId)
{
    eventObject->movementActionId = movementActionId;
    sprite->data[2] = 0;
}

void FaceDirection(struct EventObject *eventObject, struct Sprite *sprite, u8 direction)
{
    SetEventObjectDirection(eventObject, direction);
    ShiftStillEventObjectCoords(eventObject);
    sub_805FE64(eventObject, sprite, GetMoveDirectionAnimNum(eventObject->facingDirection));
    sprite->animPaused = 1;
    sprite->data[2] = 1;
}

u8 MovementAction_FaceDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    FaceDirection(eventObject, sprite, DIR_SOUTH);
    return 1;
}

u8 MovementAction_FaceUp_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    FaceDirection(eventObject, sprite, DIR_NORTH);
    return 1;
}

u8 MovementAction_FaceLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    FaceDirection(eventObject, sprite, DIR_WEST);
    return 1;
}

u8 MovementAction_FaceRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    FaceDirection(eventObject, sprite, DIR_EAST);
    return 1;
}

void sub_8060D20(struct EventObject *eventObject, struct Sprite *sprite, u8 direction, u8 a3)
{
    s16 x;
    s16 y;
    x = eventObject->currentCoords.x;
    y = eventObject->currentCoords.y;
    SetEventObjectDirection(eventObject, direction);
    MoveCoords(direction, &x, &y);
    ShiftEventObjectCoords(eventObject, x, y);
    oamt_npc_ministep_reset(sprite, direction, a3);
    sprite->animPaused = 0;
    eventObject->triggerGroundEffectsOnMove = 1;
    sprite->data[2] = 1;
}

extern u8 (*const gUnknown_083759C0[5])(u8);

void do_go_anim(struct EventObject *eventObject, struct Sprite *sprite, u8 direction, u8 a3)
{
    u8 (*const functions[5])(u8);
    memcpy((void *)functions, gUnknown_083759C0, sizeof(gUnknown_083759C0));
    sub_8060D20(eventObject, sprite, direction, a3);
    sub_805FE28(eventObject, sprite, functions[a3](eventObject->facingDirection));
}

void StartRunningAnim(struct EventObject *eventObject, struct Sprite *sprite, u8 direction)
{
    sub_8060D20(eventObject, sprite, direction, 1);
    sub_805FE28(eventObject, sprite, GetRunningDirectionAnimNum(eventObject->facingDirection));
}

bool8 obj_npc_ministep(struct Sprite *);

bool8 npc_obj_ministep_stop_on_arrival(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (obj_npc_ministep(sprite))
    {
        ShiftStillEventObjectCoords(eventObject);
        eventObject->triggerGroundEffectsOnStop = 1;
        sprite->animPaused = 1;
        return 1;
    }
    return 0;
}

void sub_8060E68(struct EventObject *eventObject, struct Sprite *sprite, u8 direction)
{
    s16 x;
    s16 y;
    x = eventObject->currentCoords.x;
    y = eventObject->currentCoords.y;
    SetEventObjectDirection(eventObject, direction);
    MoveCoords(direction, &x, &y);
    ShiftEventObjectCoords(eventObject, x, y);
    sub_806467C(sprite, direction);
    sprite->animPaused = 0;
    eventObject->triggerGroundEffectsOnMove = 1;
    sprite->data[2] = 1;
}

void sub_8060ED8(struct EventObject *eventObject, struct Sprite *sprite, u8 direction)
{
    sub_8060E68(eventObject, sprite, direction);
    sub_805FE28(eventObject, sprite, GetMoveDirectionAnimNum(eventObject->facingDirection));
}

bool8 an_walk_any_2(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_806468C(sprite))
    {
        ShiftStillEventObjectCoords(eventObject);
        eventObject->triggerGroundEffectsOnStop = 1;
        sprite->animPaused = 1;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_WalkSlowDown_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_WalkSlowDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8060ED8(eventObject, sprite, DIR_SOUTH);
    return MovementAction_WalkSlowDown_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkSlowDown_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (an_walk_any_2(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_WalkSlowUp_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_WalkSlowUp_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8060ED8(eventObject, sprite, DIR_NORTH);
    return MovementAction_WalkSlowUp_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkSlowUp_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (an_walk_any_2(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_WalkSlowLeft_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_WalkSlowLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8060ED8(eventObject, sprite, DIR_WEST);
    return MovementAction_WalkSlowLeft_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkSlowLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (an_walk_any_2(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_WalkSlowRight_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_WalkSlowRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8060ED8(eventObject, sprite, DIR_EAST);
    return MovementAction_WalkSlowRight_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkSlowRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (an_walk_any_2(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_WalkNormalDown_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_WalkNormalDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    do_go_anim(eventObject, sprite, DIR_SOUTH, 0);
    return MovementAction_WalkNormalDown_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkNormalDown_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_WalkNormalUp_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_WalkNormalUp_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    do_go_anim(eventObject, sprite, DIR_NORTH, 0);
    return MovementAction_WalkNormalUp_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkNormalUp_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_WalkNormalLeft_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_WalkNormalLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    do_go_anim(eventObject, sprite, DIR_WEST, 0);
    return MovementAction_WalkNormalLeft_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkNormalLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_WalkNormalRight_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_WalkNormalRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    do_go_anim(eventObject, sprite, DIR_EAST, 0);
    return MovementAction_WalkNormalRight_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkNormalRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

void sub_806113C(struct EventObject *eventObject, struct Sprite *sprite, u8 direction, u8 a4, u8 a5)
{
    s16 vSPp4[3];
    s16 x;
    s16 y;
    memcpy(vSPp4, gUnknown_08375A34, sizeof gUnknown_08375A34);
    x = 0;
    y = 0;
    SetEventObjectDirection(eventObject, direction);
    MoveCoordsInDirection(direction, &x, &y, vSPp4[a4], vSPp4[a4]);
    ShiftEventObjectCoords(eventObject, eventObject->currentCoords.x + x, eventObject->currentCoords.y + y);
    sub_80646E4(sprite, direction, a4, a5);
    sprite->data[2] = 1;
    sprite->animPaused = 0;
    eventObject->triggerGroundEffectsOnMove = 1;
    eventObject->disableCoveringGroundEffects = 1;
}

void maybe_shadow_1(struct EventObject *eventObject, struct Sprite *sprite, u8 direction, u8 a4, u8 a5)
{
    sub_806113C(eventObject, sprite, direction, a4, a5);
    sub_805FE28(eventObject, sprite, GetMoveDirectionAnimNum(eventObject->facingDirection));
    DoShadowFieldEffect(eventObject);
}

u8 sub_806123C(struct EventObject *eventObject, struct Sprite *sprite, u8 (*const callback)(struct Sprite *))
{
    s16 vSPp4[3];
    s16 x;
    s16 y;
    u8 retval;
    memcpy(vSPp4, gUnknown_08375A3A, sizeof gUnknown_08375A3A);
    retval = callback(sprite);
    if (retval == 1 && vSPp4[sprite->data[4]] != 0)
    {
        x = 0;
        y = 0;
        MoveCoordsInDirection(eventObject->movementDirection, &x, &y, vSPp4[sprite->data[4]], vSPp4[sprite->data[4]]);
        ShiftEventObjectCoords(eventObject, eventObject->currentCoords.x + x, eventObject->currentCoords.y + y);
        eventObject->triggerGroundEffectsOnMove = 1;
        eventObject->disableCoveringGroundEffects = 1;
    } else if (retval == 0xff)
    {
        ShiftStillEventObjectCoords(eventObject);
        eventObject->triggerGroundEffectsOnStop = 1;
        eventObject->landingJump = 1;
        sprite->animPaused = 1;
    }
    return retval;
}

u8 sub_8061300(struct EventObject *eventObject, struct Sprite *sprite)
{
    return sub_806123C(eventObject, sprite, sub_8064704);
}

u8 sub_8061314(struct EventObject *eventObject, struct Sprite *sprite)
{
    return sub_806123C(eventObject, sprite, sub_806478C);
}

bool8 sub_8061328(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061300(eventObject, sprite) == 0xFF)
    {
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8061340(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061314(eventObject, sprite) == 0xFF)
    {
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8061358(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 retval;

    retval = sub_8061300(eventObject, sprite);
    if (retval != 1)
    {
        if (retval == 0xFF)
        {
            return TRUE;
        }
        return FALSE;
    }
    SetEventObjectDirection(eventObject, GetOppositeDirection(eventObject->movementDirection));
    sub_805FE64(eventObject, sprite, GetMoveDirectionAnimNum(eventObject->facingDirection));
    return FALSE;
}

bool8 MovementAction_Jump2Down_Step1(struct EventObject *, struct Sprite *);
bool8 MovementAction_Jump2Up_Step1(struct EventObject *, struct Sprite *);
bool8 MovementAction_Jump2Left_Step1(struct EventObject *, struct Sprite *);
bool8 MovementAction_Jump2Right_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_Jump2Down_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    maybe_shadow_1(eventObject, sprite, DIR_SOUTH, 2, 0);
    return MovementAction_Jump2Down_Step1(eventObject, sprite);
}

bool8 MovementAction_Jump2Down_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061328(eventObject, sprite))
    {
        eventObject->hasShadow = 0;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_Jump2Up_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    maybe_shadow_1(eventObject, sprite, DIR_NORTH, 2, 0);
    return MovementAction_Jump2Up_Step1(eventObject, sprite);
}

bool8 MovementAction_Jump2Up_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061328(eventObject, sprite))
    {
        eventObject->hasShadow = 0;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_Jump2Left_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    maybe_shadow_1(eventObject, sprite, DIR_WEST, 2, 0);
    return MovementAction_Jump2Left_Step1(eventObject, sprite);
}

bool8 MovementAction_Jump2Left_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061328(eventObject, sprite))
    {
        eventObject->hasShadow = 0;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_Jump2Right_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    maybe_shadow_1(eventObject, sprite, DIR_EAST, 2, 0);
    return MovementAction_Jump2Right_Step1(eventObject, sprite);
}

bool8 MovementAction_Jump2Right_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061328(eventObject, sprite))
    {
        eventObject->hasShadow = 0;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

void sub_8061508(struct Sprite *sprite, u16 duration)
{
    sprite->data[2] = 1;
    sprite->data[3] = duration;
}

bool8 MovementAction_Delay_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    sprite->data[3]--;
    if (!sprite->data[3])
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_Delay1_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8061508(sprite, 1);
    return MovementAction_Delay_Step1(eventObject, sprite);
}

bool8 MovementAction_Delay2_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8061508(sprite, 2);
    return MovementAction_Delay_Step1(eventObject, sprite);
}

bool8 MovementAction_Delay4_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8061508(sprite, 4);
    return MovementAction_Delay_Step1(eventObject, sprite);
}

bool8 MovementAction_Delay8_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8061508(sprite, 8);
    return MovementAction_Delay_Step1(eventObject, sprite);
}

bool8 MovementAction_Delay16_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8061508(sprite, 16);
    return MovementAction_Delay_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkFastDown_Step1(struct EventObject *eventObject, struct Sprite *sprite);
bool8 MovementAction_WalkFastUp_Step1(struct EventObject *eventObject, struct Sprite *sprite);
bool8 MovementAction_WalkFastLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite);
bool8 MovementAction_WalkFastRight_Step1(struct EventObject *eventObject, struct Sprite *sprite);

bool8 MovementAction_WalkFastDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    do_go_anim(eventObject, sprite, DIR_SOUTH, 1);
    return MovementAction_WalkFastDown_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkFastDown_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}
bool8 MovementAction_WalkFastUp_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    do_go_anim(eventObject, sprite, DIR_NORTH, 1);
    return MovementAction_WalkFastUp_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkFastUp_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}
bool8 MovementAction_WalkFastLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    do_go_anim(eventObject, sprite, DIR_WEST, 1);
    return MovementAction_WalkFastLeft_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkFastLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}
bool8 MovementAction_WalkFastRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    do_go_anim(eventObject, sprite, DIR_EAST, 1);
    return MovementAction_WalkFastRight_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkFastRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

void sub_80616CC(struct EventObject *eventObject, struct Sprite *sprite, u8 direction, u8 animNum, u16 duration)
{
    SetEventObjectDirection(eventObject, direction);
    sub_805FE28(eventObject, sprite, animNum);
    sprite->animPaused = 0;
    sprite->data[2] = 1;
    sprite->data[3] = duration;
}

bool8 MovementAction_WalkInPlace_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    sprite->data[3]--;
    if (sprite->data[3] == 0)
    {
        sprite->data[2] = 2;
        sprite->animPaused = 1;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_WalkInPlaceSlow_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sprite->data[3] & 1)
    {
        sprite->animDelayCounter++;
    }
    return MovementAction_WalkInPlace_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkInPlaceSlowDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_80616CC(eventObject, sprite, DIR_SOUTH, GetMoveDirectionAnimNum(DIR_SOUTH), 32);
    return MovementAction_WalkInPlaceSlow_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkInPlaceSlowUp_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_80616CC(eventObject, sprite, DIR_NORTH, GetMoveDirectionAnimNum(DIR_NORTH), 32);
    return MovementAction_WalkInPlaceSlow_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkInPlaceSlowLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_80616CC(eventObject, sprite, DIR_WEST, GetMoveDirectionAnimNum(DIR_WEST), 32);
    return MovementAction_WalkInPlaceSlow_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkInPlaceSlowRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_80616CC(eventObject, sprite, DIR_EAST, GetMoveDirectionAnimNum(DIR_EAST), 32);
    return MovementAction_WalkInPlaceSlow_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkInPlaceNormalDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_80616CC(eventObject, sprite, DIR_SOUTH, GetMoveDirectionAnimNum(DIR_SOUTH), 16);
    return MovementAction_WalkInPlace_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkInPlaceNormalUp_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_80616CC(eventObject, sprite, DIR_NORTH, GetMoveDirectionAnimNum(DIR_NORTH), 16);
    return MovementAction_WalkInPlace_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkInPlaceNormalLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_80616CC(eventObject, sprite, DIR_WEST, GetMoveDirectionAnimNum(DIR_WEST), 16);
    return MovementAction_WalkInPlace_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkInPlaceNormalRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_80616CC(eventObject, sprite, DIR_EAST, GetMoveDirectionAnimNum(DIR_EAST), 16);
    return MovementAction_WalkInPlace_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkInPlaceFastDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_80616CC(eventObject, sprite, DIR_SOUTH, GetMoveDirectionFastAnimNum(DIR_SOUTH), 8);
    return MovementAction_WalkInPlace_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkInPlaceFastUp_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_80616CC(eventObject, sprite, DIR_NORTH, GetMoveDirectionFastAnimNum(DIR_NORTH), 8);
    return MovementAction_WalkInPlace_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkInPlaceFastLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_80616CC(eventObject, sprite, DIR_WEST, GetMoveDirectionFastAnimNum(DIR_WEST), 8);
    return MovementAction_WalkInPlace_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkInPlaceFastRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_80616CC(eventObject, sprite, DIR_EAST, GetMoveDirectionFastAnimNum(DIR_EAST), 8);
    return MovementAction_WalkInPlace_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkInPlaceFastestDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_80616CC(eventObject, sprite, DIR_SOUTH, GetMoveDirectionFasterAnimNum(DIR_SOUTH), 4);
    return MovementAction_WalkInPlace_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkInPlaceFastestUp_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_80616CC(eventObject, sprite, DIR_NORTH, GetMoveDirectionFasterAnimNum(DIR_NORTH), 4);
    return MovementAction_WalkInPlace_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkInPlaceFastestLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_80616CC(eventObject, sprite, DIR_WEST, GetMoveDirectionFasterAnimNum(DIR_WEST), 4);
    return MovementAction_WalkInPlace_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkInPlaceFastestRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_80616CC(eventObject, sprite, DIR_EAST, GetMoveDirectionFasterAnimNum(DIR_EAST), 4);
    return MovementAction_WalkInPlace_Step1(eventObject, sprite);
}

bool8 MovementAction_RideWaterCurrentDown_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_RideWaterCurrentDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    do_go_anim(eventObject, sprite, DIR_SOUTH, 2);
    return MovementAction_RideWaterCurrentDown_Step1(eventObject, sprite);
}

bool8 MovementAction_RideWaterCurrentDown_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}


bool8 MovementAction_RideWaterCurrentUp_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_RideWaterCurrentUp_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    do_go_anim(eventObject, sprite, DIR_NORTH, 2);
    return MovementAction_RideWaterCurrentUp_Step1(eventObject, sprite);
}

bool8 MovementAction_RideWaterCurrentUp_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}


bool8 MovementAction_RideWaterCurrentLeft_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_RideWaterCurrentLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    do_go_anim(eventObject, sprite, DIR_WEST, 2);
    return MovementAction_RideWaterCurrentLeft_Step1(eventObject, sprite);
}

bool8 MovementAction_RideWaterCurrentLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}


bool8 MovementAction_RideWaterCurrentRight_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_RideWaterCurrentRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    do_go_anim(eventObject, sprite, DIR_EAST, 2);
    return MovementAction_RideWaterCurrentRight_Step1(eventObject, sprite);
}

bool8 MovementAction_RideWaterCurrentRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_WalkFastestDown_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_WalkFastestDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    do_go_anim(eventObject, sprite, DIR_SOUTH, 3);
    return MovementAction_WalkFastestDown_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkFastestDown_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_WalkFastestUp_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_WalkFastestUp_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    do_go_anim(eventObject, sprite, DIR_NORTH, 3);
    return MovementAction_WalkFastestUp_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkFastestUp_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}


bool8 MovementAction_WalkFastestLeft_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_WalkFastestLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    do_go_anim(eventObject, sprite, DIR_WEST, 3);
    return MovementAction_WalkFastestLeft_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkFastestLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}


bool8 MovementAction_WalkFastestRight_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_WalkFastestRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    do_go_anim(eventObject, sprite, DIR_EAST, 3);
    return MovementAction_WalkFastestRight_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkFastestRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_SlideDown_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_SlideDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    do_go_anim(eventObject, sprite, DIR_SOUTH, 4);
    return MovementAction_SlideDown_Step1(eventObject, sprite);
}

bool8 MovementAction_SlideDown_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_SlideUp_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_SlideUp_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    do_go_anim(eventObject, sprite, DIR_NORTH, 4);
    return MovementAction_SlideUp_Step1(eventObject, sprite);
}

bool8 MovementAction_SlideUp_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}


bool8 MovementAction_SlideLeft_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_SlideLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    do_go_anim(eventObject, sprite, DIR_WEST, 4);
    return MovementAction_SlideLeft_Step1(eventObject, sprite);
}

bool8 MovementAction_SlideLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}


bool8 MovementAction_SlideRight_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_SlideRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    do_go_anim(eventObject, sprite, DIR_EAST, 4);
    return MovementAction_SlideRight_Step1(eventObject, sprite);
}

bool8 MovementAction_SlideRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_PlayerRunDown_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_PlayerRunDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    StartRunningAnim(eventObject, sprite, DIR_SOUTH);
    return MovementAction_PlayerRunDown_Step1(eventObject, sprite);
}

bool8 MovementAction_PlayerRunDown_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_PlayerRunUp_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_PlayerRunUp_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    StartRunningAnim(eventObject, sprite, DIR_NORTH);
    return MovementAction_PlayerRunUp_Step1(eventObject, sprite);
}

bool8 MovementAction_PlayerRunUp_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_PlayerRunLeft_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_PlayerRunLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    StartRunningAnim(eventObject, sprite, DIR_WEST);
    return MovementAction_PlayerRunLeft_Step1(eventObject, sprite);
}

bool8 MovementAction_PlayerRunLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_PlayerRunRight_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_PlayerRunRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    StartRunningAnim(eventObject, sprite, DIR_EAST);
    return MovementAction_PlayerRunRight_Step1(eventObject, sprite);
}

bool8 MovementAction_PlayerRunRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

void StartSpriteAnimInDirection(struct EventObject *eventObject, struct Sprite *sprite, u8 direction, u8 animNum)
{
    SetAndStartSpriteAnim(sprite, animNum, 0);
    SetEventObjectDirection(eventObject, direction);
    sprite->data[2] = 1;
}

bool8 MovementAction_StartAnimInDirection_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    StartSpriteAnimInDirection(eventObject, sprite, eventObject->movementDirection, sprite->animNum);
    return FALSE;
}

bool8 SpriteAnimEnded(struct Sprite *);

bool8 MovementAction_WaitSpriteAnim(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (SpriteAnimEnded(sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

void sub_8061F5C(struct EventObject *eventObject, struct Sprite *sprite, u8 direction)
{
    sub_806113C(eventObject, sprite, direction, 1, 0);
    StartSpriteAnim(sprite, GetJumpSpecialDirectionAnimNum(direction));
}

bool8 MovementAction_JumpSpecialDown_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_JumpSpecialDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8061F5C(eventObject, sprite, DIR_SOUTH);
    return MovementAction_JumpSpecialDown_Step1(eventObject, sprite);
}

bool8 MovementAction_JumpSpecialDown_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061340(eventObject, sprite))
    {
        sprite->data[2] = 2;
        eventObject->landingJump = 0;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_JumpSpecialUp_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_JumpSpecialUp_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8061F5C(eventObject, sprite, DIR_NORTH);
    return MovementAction_JumpSpecialUp_Step1(eventObject, sprite);
}

bool8 MovementAction_JumpSpecialUp_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061340(eventObject, sprite))
    {
        sprite->data[2] = 2;
        eventObject->landingJump = 0;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_JumpSpecialLeft_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_JumpSpecialLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8061F5C(eventObject, sprite, DIR_WEST);
    return MovementAction_JumpSpecialLeft_Step1(eventObject, sprite);
}

bool8 MovementAction_JumpSpecialLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061340(eventObject, sprite))
    {
        sprite->data[2] = 2;
        eventObject->landingJump = 0;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_JumpSpecialRight_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_JumpSpecialRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8061F5C(eventObject, sprite, DIR_EAST);
    return MovementAction_JumpSpecialRight_Step1(eventObject, sprite);
}

bool8 MovementAction_JumpSpecialRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061340(eventObject, sprite))
    {
        sprite->data[2] = 2;
        eventObject->landingJump = 0;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_FacePlayer_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 playerObjectId;
    if (!TryGetEventObjectIdByLocalIdAndMap(0xFF, 0, 0, &playerObjectId))
    {
        FaceDirection(eventObject, sprite, GetDirectionToFace(eventObject->currentCoords.x, eventObject->currentCoords.y, gEventObjects[playerObjectId].currentCoords.x, gEventObjects[playerObjectId].currentCoords.y));
    }
    sprite->data[2] = 1;
    return TRUE;
}

bool8 MovementAction_FaceAwayPlayer_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 playerObjectId;
    if (!TryGetEventObjectIdByLocalIdAndMap(0xFF, 0, 0, &playerObjectId))
    {
        FaceDirection(eventObject, sprite, GetOppositeDirection(GetDirectionToFace(eventObject->currentCoords.x, eventObject->currentCoords.y, gEventObjects[playerObjectId].currentCoords.x, gEventObjects[playerObjectId].currentCoords.y)));
    }
    sprite->data[2] = 1;
    return TRUE;
}

bool8 MovementAction_LockFacingDirection_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    eventObject->facingDirectionLocked = 1;
    sprite->data[2] = 1;
    return TRUE;
}

bool8 MovementAction_UnlockFacingDirection_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    eventObject->facingDirectionLocked = 0;
    sprite->data[2] = 1;
    return TRUE;
}

bool8 MovementAction_JumpDown_Step1(struct EventObject *eventObject, struct Sprite *sprite);

bool8 MovementAction_JumpDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    maybe_shadow_1(eventObject, sprite, DIR_SOUTH, 1, 2);
    return MovementAction_JumpDown_Step1(eventObject, sprite);
}

bool8 MovementAction_JumpDown_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061328(eventObject, sprite))
    {
        eventObject->hasShadow = 0;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_JumpUp_Step1(struct EventObject *eventObject, struct Sprite *sprite);

bool8 MovementAction_JumpUp_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    maybe_shadow_1(eventObject, sprite, DIR_NORTH, 1, 2);
    return MovementAction_JumpUp_Step1(eventObject, sprite);
}

bool8 MovementAction_JumpUp_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061328(eventObject, sprite))
    {
        eventObject->hasShadow = 0;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_JumpLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite);

bool8 MovementAction_JumpLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    maybe_shadow_1(eventObject, sprite, DIR_WEST, 1, 2);
    return MovementAction_JumpLeft_Step1(eventObject, sprite);
}

bool8 MovementAction_JumpLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061328(eventObject, sprite))
    {
        eventObject->hasShadow = 0;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_JumpRight_Step1(struct EventObject *eventObject, struct Sprite *sprite);

bool8 MovementAction_JumpRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    maybe_shadow_1(eventObject, sprite, DIR_EAST, 1, 2);
    return MovementAction_JumpRight_Step1(eventObject, sprite);
}

bool8 MovementAction_JumpRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061328(eventObject, sprite))
    {
        eventObject->hasShadow = 0;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_JumpInPlaceDown_Step1(struct EventObject *eventObject, struct Sprite *sprite);

bool8 MovementAction_JumpInPlaceDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    maybe_shadow_1(eventObject, sprite, DIR_SOUTH, 0, 0);
    return MovementAction_JumpInPlaceDown_Step1(eventObject, sprite);
}

bool8 MovementAction_JumpInPlaceDown_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061328(eventObject, sprite))
    {
        eventObject->hasShadow = 0;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_JumpInPlaceUp_Step1(struct EventObject *eventObject, struct Sprite *sprite);

bool8 MovementAction_JumpInPlaceUp_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    maybe_shadow_1(eventObject, sprite, DIR_NORTH, 0, 0);
    return MovementAction_JumpInPlaceUp_Step1(eventObject, sprite);
}

bool8 MovementAction_JumpInPlaceUp_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061328(eventObject, sprite))
    {
        eventObject->hasShadow = 0;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_JumpInPlaceLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite);

bool8 MovementAction_JumpInPlaceLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    maybe_shadow_1(eventObject, sprite, DIR_WEST, 0, 0);
    return MovementAction_JumpInPlaceLeft_Step1(eventObject, sprite);
}

bool8 MovementAction_JumpInPlaceLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061328(eventObject, sprite))
    {
        eventObject->hasShadow = 0;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_JumpInPlaceRight_Step1(struct EventObject *eventObject, struct Sprite *sprite);

bool8 MovementAction_JumpInPlaceRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    maybe_shadow_1(eventObject, sprite, DIR_EAST, 0, 0);
    return MovementAction_JumpInPlaceRight_Step1(eventObject, sprite);
}

bool8 MovementAction_JumpInPlaceRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061328(eventObject, sprite))
    {
        eventObject->hasShadow = 0;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_JumpInPlaceDownUp_Step1(struct EventObject *eventObject, struct Sprite *sprite);

bool8 MovementAction_JumpInPlaceDownUp_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    maybe_shadow_1(eventObject, sprite, DIR_SOUTH, 0, 2);
    return MovementAction_JumpInPlaceDownUp_Step1(eventObject, sprite);
}

bool8 MovementAction_JumpInPlaceDownUp_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061358(eventObject, sprite))
    {
        eventObject->hasShadow = 0;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_JumpInPlaceUpDown_Step1(struct EventObject *eventObject, struct Sprite *sprite);

bool8 MovementAction_JumpInPlaceUpDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    maybe_shadow_1(eventObject, sprite, DIR_NORTH, 0, 2);
    return MovementAction_JumpInPlaceUpDown_Step1(eventObject, sprite);
}

bool8 MovementAction_JumpInPlaceUpDown_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061358(eventObject, sprite))
    {
        eventObject->hasShadow = 0;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_JumpInPlaceLeftRight_Step1(struct EventObject *eventObject, struct Sprite *sprite);

bool8 MovementAction_JumpInPlaceLeftRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    maybe_shadow_1(eventObject, sprite, DIR_WEST, 0, 2);
    return MovementAction_JumpInPlaceLeftRight_Step1(eventObject, sprite);
}

bool8 MovementAction_JumpInPlaceLeftRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061358(eventObject, sprite))
    {
        eventObject->hasShadow = 0;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_JumpInPlaceRightLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite);

bool8 MovementAction_JumpInPlaceRightLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    maybe_shadow_1(eventObject, sprite, DIR_EAST, 0, 2);
    return MovementAction_JumpInPlaceRightLeft_Step1(eventObject, sprite);
}

bool8 MovementAction_JumpInPlaceRightLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061358(eventObject, sprite))
    {
        eventObject->hasShadow = 0;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_FaceOriginalDirection_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    FaceDirection(eventObject, sprite, gInitialMovementTypeFacingDirections[eventObject->movementType]);
    return TRUE;
}

bool8 MovementAction_NurseJoyBowDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    StartSpriteAnimInDirection(eventObject, sprite, DIR_SOUTH, 0x14);
    return FALSE;
}

bool8 MovementAction_EnableJumpLandingGroundEffect_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    eventObject->disableJumpLandingGroundEffect = 0;
    sprite->data[2] = 1;
    return TRUE;
}

bool8 MovementAction_DisableJumpLandingGroundEffect_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    eventObject->disableJumpLandingGroundEffect = 1;
    sprite->data[2] = 1;
    return TRUE;
}

bool8 MovementAction_DisableAnimation_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    eventObject->inanimate = 1;
    sprite->data[2] = 1;
    return TRUE;
}

bool8 MovementAction_RestoreAnimation_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    eventObject->inanimate = GetEventObjectGraphicsInfo(eventObject->graphicsId)->inanimate;
    sprite->data[2] = 1;
    return TRUE;
}

bool8 MovementAction_SetInvisible_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    eventObject->invisible = 1;
    sprite->data[2] = 1;
    return TRUE;
}

bool8 MovementAction_SetVisible_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    eventObject->invisible = 0;
    sprite->data[2] = 1;
    return TRUE;
}

bool8 MovementAction_EmoteExclamationMark_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    EventObjectGetLocalIdAndMap(eventObject, &gFieldEffectArguments[0], &gFieldEffectArguments[1], &gFieldEffectArguments[2]);
    FieldEffectStart(FLDEFF_EXCLAMATION_MARK_ICON);
    sprite->data[2] = 1;
    return TRUE;
}

bool8 MovementAction_EmoteQuestionMark_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    EventObjectGetLocalIdAndMap(eventObject, &gFieldEffectArguments[0], &gFieldEffectArguments[1], &gFieldEffectArguments[2]);
    FieldEffectStart(FLDEFF_QUESTION_MARK_ICON);
    sprite->data[2] = 1;
    return TRUE;
}

bool8 MovementAction_EmoteHeart_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    EventObjectGetLocalIdAndMap(eventObject, &gFieldEffectArguments[0], &gFieldEffectArguments[1], &gFieldEffectArguments[2]);
    FieldEffectStart(FLDEFF_HEART_ICON);
    sprite->data[2] = 1;
    return TRUE;
}

bool8 MovementAction_RevealTrainer_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_RevealTrainer_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (eventObject->movementType == MOVEMENT_TYPE_HIDDEN)
    {
        sub_8084794(eventObject);
        return FALSE;
    }
    else if (eventObject->movementType != MOVEMENT_TYPE_TREE_DISGUISE && eventObject->movementType != MOVEMENT_TYPE_MOUNTAIN_DISGUISE)
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    else
    {
        sub_812869C(eventObject);
        sprite->data[2] = 1;
        return MovementAction_RevealTrainer_Step1(eventObject, sprite);
    }
}

bool8 MovementAction_RevealTrainer_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_81286C4(eventObject))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_RockSmashBreak_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    SetAndStartSpriteAnim(sprite, 1, 0);
    sprite->data[2] = 1;
    return FALSE;
}

bool8 MovementAction_RockSmashBreak_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (SpriteAnimEnded(sprite))
    {
        SetMovementDelay(sprite, 0x20);
        sprite->data[2] = 2;
    }
    return FALSE;
}

bool8 MovementAction_RockSmashBreak_Step2(struct EventObject *eventObject, struct Sprite *sprite)
{
    eventObject->invisible ^= 1;
    if (WaitForMovementDelay(sprite))
    {
        eventObject->invisible = 1;
        sprite->data[2] = 3;
    }
    return FALSE;
}

bool8 MovementAction_CutTree_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    SetAndStartSpriteAnim(sprite, 1, 0);
    sprite->data[2] = 1;
    return FALSE;
}

bool8 MovementAction_CutTree_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (SpriteAnimEnded(sprite))
    {
        SetMovementDelay(sprite, 0x20);
        sprite->data[2] = 2;
    }
    return FALSE;
}

bool8 MovementAction_CutTree_Step2(struct EventObject *eventObject, struct Sprite *sprite)
{
    eventObject->invisible ^= 1;
    if (WaitForMovementDelay(sprite))
    {
        eventObject->invisible = 1;
        sprite->data[2] = 3;
    }
    return FALSE;
}

bool8 MovementAction_SetFixedPriority_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    eventObject->fixedPriority = 1;
    sprite->data[2] = 1;
    return TRUE;
}

bool8 MovementAction_ClearFixedPriority_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    eventObject->fixedPriority = 0;
    sprite->data[2] = 1;
    return TRUE;
}

bool8 MovementAction_InitAffineAnim_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sprite->oam.affineMode = ST_OAM_AFFINE_DOUBLE;
    InitSpriteAffineAnim(sprite);
    sprite->affineAnimPaused = 1;
    sprite->subspriteMode = 0;
    return TRUE;
}

bool8 MovementAction_ClearAffineAnim_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    FreeOamMatrix(sprite->oam.matrixNum);
    sprite->oam.affineMode = ST_OAM_AFFINE_OFF;
    CalcCenterToCornerVec(sprite, sprite->oam.shape, sprite->oam.size, sprite->oam.affineMode);
    return TRUE;
}

bool8 MovementAction_WalkDownStartAffine_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_WalkDownStartAffine_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8060ED8(eventObject, sprite, DIR_SOUTH);
    sprite->affineAnimPaused = 0;
    StartSpriteAffineAnimIfDifferent(sprite, 0);
    return MovementAction_WalkDownStartAffine_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkDownStartAffine_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (an_walk_any_2(eventObject, sprite))
    {
        sprite->affineAnimPaused = 1;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_WalkDownAffine_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_WalkDownAffine_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8060ED8(eventObject, sprite, DIR_SOUTH);
    sprite->affineAnimPaused = 0;
    ChangeSpriteAffineAnimIfDifferent(sprite, 1);
    return MovementAction_WalkDownAffine_Step1(eventObject, sprite);
}

bool8 MovementAction_WalkDownAffine_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (an_walk_any_2(eventObject, sprite))
    {
        sprite->affineAnimPaused = 1;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

void sub_806295C(struct EventObject *eventObject, struct Sprite *sprite, u8 direction)
{
    SetEventObjectDirection(eventObject, direction);
    ShiftStillEventObjectCoords(eventObject);
    sub_805FE64(eventObject, sprite, GetAcroWheeliePedalDirectionAnimNum(direction));
    sprite->animPaused = 1;
    sprite->data[2] = 1;
}

bool8 MovementAction_AcroWheelieFaceDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_806295C(eventObject, sprite, DIR_SOUTH);
    return TRUE;
}

bool8 MovementAction_AcroWheelieFaceUp_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_806295C(eventObject, sprite, DIR_NORTH);
    return TRUE;
}

bool8 MovementAction_AcroWheelieFaceLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_806295C(eventObject, sprite, DIR_WEST);
    return TRUE;
}

bool8 MovementAction_AcroWheelieFaceRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_806295C(eventObject, sprite, DIR_EAST);
    return TRUE;
}

bool8 MovementAction_AcroPopWheelieDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    StartSpriteAnimInDirection(eventObject, sprite, DIR_SOUTH, GetAcroWheelieDirectionAnimNum(DIR_SOUTH));
    return FALSE;
}

bool8 MovementAction_AcroPopWheelieUp_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    StartSpriteAnimInDirection(eventObject, sprite, DIR_NORTH, GetAcroWheelieDirectionAnimNum(DIR_NORTH));
    return FALSE;
}

bool8 MovementAction_AcroPopWheelieLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    StartSpriteAnimInDirection(eventObject, sprite, DIR_WEST, GetAcroWheelieDirectionAnimNum(DIR_WEST));
    return FALSE;
}

bool8 MovementAction_AcroPopWheelieRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    StartSpriteAnimInDirection(eventObject, sprite, DIR_EAST, GetAcroWheelieDirectionAnimNum(DIR_EAST));
    return FALSE;
}

bool8 MovementAction_AcroEndWheelieFaceDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    StartSpriteAnimInDirection(eventObject, sprite, DIR_SOUTH, GetAcroEndWheelieDirectionAnimNum(DIR_SOUTH));
    return FALSE;
}

bool8 MovementAction_AcroEndWheelieFaceUp_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    StartSpriteAnimInDirection(eventObject, sprite, DIR_NORTH, GetAcroEndWheelieDirectionAnimNum(DIR_NORTH));
    return FALSE;
}

bool8 MovementAction_AcroEndWheelieFaceLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    StartSpriteAnimInDirection(eventObject, sprite, DIR_WEST, GetAcroEndWheelieDirectionAnimNum(DIR_WEST));
    return FALSE;
}

bool8 MovementAction_AcroEndWheelieFaceRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    StartSpriteAnimInDirection(eventObject, sprite, DIR_EAST, GetAcroEndWheelieDirectionAnimNum(DIR_EAST));
    return FALSE;
}

bool8 MovementAction_UnusedAcroActionDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    StartSpriteAnimInDirection(eventObject, sprite, DIR_SOUTH, GetAcroUnusedActionDirectionAnimNum(DIR_SOUTH));
    return FALSE;
}

bool8 MovementAction_UnusedAcroActionUp_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    StartSpriteAnimInDirection(eventObject, sprite, DIR_NORTH, GetAcroUnusedActionDirectionAnimNum(DIR_NORTH));
    return FALSE;
}

bool8 MovementAction_UnusedAcroActionLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    StartSpriteAnimInDirection(eventObject, sprite, DIR_WEST, GetAcroUnusedActionDirectionAnimNum(DIR_WEST));
    return FALSE;
}

bool8 MovementAction_UnusedAcroActionRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    StartSpriteAnimInDirection(eventObject, sprite, DIR_EAST, GetAcroUnusedActionDirectionAnimNum(DIR_EAST));
    return FALSE;
}

void sub_8062B8C(struct EventObject *eventObject, struct Sprite *sprite, u8 direction, u8 a3, u8 a4)
{
    sub_806113C(eventObject, sprite, direction, a3, a4);
    StartSpriteAnimIfDifferent(sprite, GetAcroWheelieDirectionAnimNum(direction));
    DoShadowFieldEffect(eventObject);
}

bool8 MovementAction_AcroWheelieHopFaceDown_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_AcroWheelieHopFaceDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8062B8C(eventObject, sprite, DIR_SOUTH, 0, 1);
    return MovementAction_AcroWheelieHopFaceDown_Step1(eventObject, sprite);
}

bool8 MovementAction_AcroWheelieHopFaceDown_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061328(eventObject, sprite))
    {
        eventObject->hasShadow = 0;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_AcroWheelieHopFaceUp_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_AcroWheelieHopFaceUp_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8062B8C(eventObject, sprite, DIR_NORTH, 0, 1);
    return MovementAction_AcroWheelieHopFaceUp_Step1(eventObject, sprite);
}

bool8 MovementAction_AcroWheelieHopFaceUp_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061328(eventObject, sprite))
    {
        eventObject->hasShadow = 0;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_AcroWheelieHopFaceLeft_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_AcroWheelieHopFaceLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8062B8C(eventObject, sprite, DIR_WEST, 0, 1);
    return MovementAction_AcroWheelieHopFaceLeft_Step1(eventObject, sprite);
}

bool8 MovementAction_AcroWheelieHopFaceLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061328(eventObject, sprite))
    {
        eventObject->hasShadow = 0;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_AcroWheelieHopFaceRight_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_AcroWheelieHopFaceRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8062B8C(eventObject, sprite, DIR_EAST, 0, 1);
    return MovementAction_AcroWheelieHopFaceRight_Step1(eventObject, sprite);
}

bool8 MovementAction_AcroWheelieHopFaceRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061328(eventObject, sprite))
    {
        eventObject->hasShadow = 0;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_AcroWheelieHopDown_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_AcroWheelieHopDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8062B8C(eventObject, sprite, DIR_SOUTH, 1, 1);
    return MovementAction_AcroWheelieHopDown_Step1(eventObject, sprite);
}

bool8 MovementAction_AcroWheelieHopDown_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061328(eventObject, sprite))
    {
        eventObject->hasShadow = 0;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_AcroWheelieHopUp_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_AcroWheelieHopUp_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8062B8C(eventObject, sprite, DIR_NORTH, 1, 1);
    return MovementAction_AcroWheelieHopUp_Step1(eventObject, sprite);
}

bool8 MovementAction_AcroWheelieHopUp_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061328(eventObject, sprite))
    {
        eventObject->hasShadow = 0;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_AcroWheelieHopLeft_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_AcroWheelieHopLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8062B8C(eventObject, sprite, DIR_WEST, 1, 1);
    return MovementAction_AcroWheelieHopLeft_Step1(eventObject, sprite);
}

bool8 MovementAction_AcroWheelieHopLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061328(eventObject, sprite))
    {
        eventObject->hasShadow = 0;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_AcroWheelieHopRight_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_AcroWheelieHopRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8062B8C(eventObject, sprite, DIR_EAST, 1, 1);
    return MovementAction_AcroWheelieHopRight_Step1(eventObject, sprite);
}

bool8 MovementAction_AcroWheelieHopRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061328(eventObject, sprite))
    {
        eventObject->hasShadow = 0;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_AcroWheelieJumpDown_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_AcroWheelieJumpDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8062B8C(eventObject, sprite, DIR_SOUTH, 2, 0);
    return MovementAction_AcroWheelieJumpDown_Step1(eventObject, sprite);
}

bool8 MovementAction_AcroWheelieJumpDown_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061328(eventObject, sprite))
    {
        eventObject->hasShadow = 0;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_AcroWheelieJumpUp_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_AcroWheelieJumpUp_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8062B8C(eventObject, sprite, DIR_NORTH, 2, 0);
    return MovementAction_AcroWheelieJumpUp_Step1(eventObject, sprite);
}

bool8 MovementAction_AcroWheelieJumpUp_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061328(eventObject, sprite))
    {
        eventObject->hasShadow = 0;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_AcroWheelieJumpLeft_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_AcroWheelieJumpLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8062B8C(eventObject, sprite, DIR_WEST, 2, 0);
    return MovementAction_AcroWheelieJumpLeft_Step1(eventObject, sprite);
}

bool8 MovementAction_AcroWheelieJumpLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061328(eventObject, sprite))
    {
        eventObject->hasShadow = 0;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_AcroWheelieJumpRight_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_AcroWheelieJumpRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8062B8C(eventObject, sprite, DIR_EAST, 2, 0);
    return MovementAction_AcroWheelieJumpRight_Step1(eventObject, sprite);
}

bool8 MovementAction_AcroWheelieJumpRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (sub_8061328(eventObject, sprite))
    {
        eventObject->hasShadow = 0;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_AcroWheelieInPlaceDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_80616CC(eventObject, sprite, DIR_SOUTH, GetAcroWheeliePedalDirectionAnimNum(DIR_SOUTH), 8);
    return MovementAction_WalkInPlace_Step1(eventObject, sprite);
}

bool8 MovementAction_AcroWheelieInPlaceUp_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_80616CC(eventObject, sprite, DIR_NORTH, GetAcroWheeliePedalDirectionAnimNum(DIR_NORTH), 8);
    return MovementAction_WalkInPlace_Step1(eventObject, sprite);
}

bool8 MovementAction_AcroWheelieInPlaceLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_80616CC(eventObject, sprite, DIR_WEST, GetAcroWheeliePedalDirectionAnimNum(DIR_WEST), 8);
    return MovementAction_WalkInPlace_Step1(eventObject, sprite);
}

bool8 MovementAction_AcroWheelieInPlaceRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_80616CC(eventObject, sprite, DIR_EAST, GetAcroWheeliePedalDirectionAnimNum(DIR_EAST), 8);
    return MovementAction_WalkInPlace_Step1(eventObject, sprite);
}

void sub_80630D0(struct EventObject *eventObject, struct Sprite *sprite, u8 direction, u8 a3)
{
    sub_8060D20(eventObject, sprite, direction, a3);
    StartSpriteAnim(sprite, GetAcroWheelieDirectionAnimNum(eventObject->facingDirection));
    SeekSpriteAnim(sprite, 0);
}

bool8 MovementAction_AcroPopWheelieMoveDown_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_AcroPopWheelieMoveDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_80630D0(eventObject, sprite, DIR_SOUTH, 1);
    return MovementAction_AcroPopWheelieMoveDown_Step1(eventObject, sprite);
}

bool8 MovementAction_AcroPopWheelieMoveDown_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_AcroPopWheelieMoveUp_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_AcroPopWheelieMoveUp_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_80630D0(eventObject, sprite, DIR_NORTH, 1);
    return MovementAction_AcroPopWheelieMoveUp_Step1(eventObject, sprite);
}

bool8 MovementAction_AcroPopWheelieMoveUp_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_AcroPopWheelieMoveLeft_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_AcroPopWheelieMoveLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_80630D0(eventObject, sprite, DIR_WEST, 1);
    return MovementAction_AcroPopWheelieMoveLeft_Step1(eventObject, sprite);
}

bool8 MovementAction_AcroPopWheelieMoveLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_AcroPopWheelieMoveRight_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_AcroPopWheelieMoveRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_80630D0(eventObject, sprite, DIR_EAST, 1);
    return MovementAction_AcroPopWheelieMoveRight_Step1(eventObject, sprite);
}

bool8 MovementAction_AcroPopWheelieMoveRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

void sub_8063208(struct EventObject *eventObject, struct Sprite *sprite, u8 direction, u8 a3)
{
    sub_8060D20(eventObject, sprite, direction, a3);
    sub_805FE28(eventObject, sprite, GetAcroWheeliePedalDirectionAnimNum(eventObject->facingDirection));
}

bool8 MovementAction_AcroWheelieMoveDown_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_AcroWheelieMoveDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8063208(eventObject, sprite, DIR_SOUTH, 1);
    return MovementAction_AcroWheelieMoveDown_Step1(eventObject, sprite);
}

bool8 MovementAction_AcroWheelieMoveDown_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_AcroWheelieMoveUp_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_AcroWheelieMoveUp_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8063208(eventObject, sprite, DIR_NORTH, 1);
    return MovementAction_AcroWheelieMoveUp_Step1(eventObject, sprite);
}

bool8 MovementAction_AcroWheelieMoveUp_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_AcroWheelieMoveLeft_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_AcroWheelieMoveLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8063208(eventObject, sprite, DIR_WEST, 1);
    return MovementAction_AcroWheelieMoveLeft_Step1(eventObject, sprite);
}

bool8 MovementAction_AcroWheelieMoveLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_AcroWheelieMoveRight_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_AcroWheelieMoveRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8063208(eventObject, sprite, DIR_EAST, 1);
    return MovementAction_AcroWheelieMoveRight_Step1(eventObject, sprite);
}

bool8 MovementAction_AcroWheelieMoveRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

void sub_8063338(struct EventObject *eventObject, struct Sprite *sprite, u8 direction, u8 a3)
{
    sub_8060D20(eventObject, sprite, direction, a3);
    StartSpriteAnim(sprite, GetAcroEndWheelieDirectionAnimNum(eventObject->facingDirection));
    SeekSpriteAnim(sprite, 0);
}

bool8 MovementAction_AcroEndWheelieMoveDown_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_AcroEndWheelieMoveDown_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8063338(eventObject, sprite, DIR_SOUTH, 1);
    return MovementAction_AcroEndWheelieMoveDown_Step1(eventObject, sprite);
}

bool8 MovementAction_AcroEndWheelieMoveDown_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_AcroEndWheelieMoveUp_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_AcroEndWheelieMoveUp_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8063338(eventObject, sprite, DIR_NORTH, 1);
    return MovementAction_AcroEndWheelieMoveUp_Step1(eventObject, sprite);
}

bool8 MovementAction_AcroEndWheelieMoveUp_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_AcroEndWheelieMoveLeft_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_AcroEndWheelieMoveLeft_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8063338(eventObject, sprite, DIR_WEST, 1);
    return MovementAction_AcroEndWheelieMoveLeft_Step1(eventObject, sprite);
}

bool8 MovementAction_AcroEndWheelieMoveLeft_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_AcroEndWheelieMoveRight_Step1(struct EventObject *, struct Sprite *);

bool8 MovementAction_AcroEndWheelieMoveRight_Step0(struct EventObject *eventObject, struct Sprite *sprite)
{
    sub_8063338(eventObject, sprite, DIR_EAST, 1);
    return MovementAction_AcroEndWheelieMoveRight_Step1(eventObject, sprite);
}

bool8 MovementAction_AcroEndWheelieMoveRight_Step1(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(eventObject, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 MovementAction_Finish(struct EventObject *eventObject, struct Sprite *sprite)
{
    return TRUE;
}

bool8 MovementAction_PauseSpriteAnim(struct EventObject *eventObject, struct Sprite *sprite)
{
    sprite->animPaused = 1;
    return TRUE;
}

static void UpdateEventObjectSpriteAnimPause(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (eventObject->disableAnim)
        sprite->animPaused = 1;
}

static void TryEnableEventObjectAnim(struct EventObject *eventObject, struct Sprite *sprite)
{
    if (eventObject->enableAnim)
    {
        sprite->animPaused = 0;
        eventObject->disableAnim = 0;
        eventObject->enableAnim = 0;
    }
}

static void UpdateEventObjectVisibility(struct EventObject *eventObject, struct Sprite *sprite)
{
    UpdateEventObjectIsOffscreen(eventObject, sprite);
    UpdateEventObjSpriteVisibility(eventObject, sprite);
}

static void UpdateEventObjectIsOffscreen(struct EventObject *eventObject, struct Sprite *sprite)
{
    u16 x, y;
    s16 x2, y2;
    const struct EventObjectGraphicsInfo *graphicsInfo;
    eventObject->offScreen = 0;
    graphicsInfo = GetEventObjectGraphicsInfo(eventObject->graphicsId);
    if (sprite->coordOffsetEnabled)
    {
        x = sprite->pos1.x + sprite->pos2.x + sprite->centerToCornerVecX + gSpriteCoordOffsetX;
        y = sprite->pos1.y + sprite->pos2.y + sprite->centerToCornerVecY + gSpriteCoordOffsetY;
    }
    else
    {
        x = sprite->pos1.x + sprite->pos2.x + sprite->centerToCornerVecX;
        y = sprite->pos1.y + sprite->pos2.y + sprite->centerToCornerVecY;
    }

    x2 = graphicsInfo->width + (s16)x;
    y2 = graphicsInfo->height + (s16)y;
    if ((s16)x >= 0x100 || x2 < -0x10)
    {
        eventObject->offScreen = 1;
    }
    if ((s16)y >= 0xB0 || y2 < -0x10)
    {
        eventObject->offScreen = 1;
    }
}

static void UpdateEventObjSpriteVisibility(struct EventObject *eventObject, struct Sprite *sprite)
{
    sprite->invisible = 0;
    if (eventObject->invisible || eventObject->offScreen)
    {
        sprite->invisible = 1;
    }
}

static void GetAllGroundEffectFlags_OnSpawn(struct EventObject *eventObj, u32 *flags)
{
    EventObjectUpdateMetatileBehaviors(eventObj);
    GetGroundEffectFlags_Reflection(eventObj, flags);
    GetGroundEffectFlags_TallGrassOnSpawn(eventObj, flags);
    GetGroundEffectFlags_LongGrassOnSpawn(eventObj, flags);
    GetGroundEffectFlags_SandPile(eventObj, flags);
    GetGroundEffectFlags_ShallowFlowingWater(eventObj, flags);
    GetGroundEffectFlags_ShortGrass(eventObj, flags);
    GetGroundEffectFlags_HotSprings(eventObj, flags);
}

static void GetAllGroundEffectFlags_OnBeginStep(struct EventObject *eventObj, u32 *flags)
{
    EventObjectUpdateMetatileBehaviors(eventObj);
    GetGroundEffectFlags_Reflection(eventObj, flags);
    GetGroundEffectFlags_TallGrassOnBeginStep(eventObj, flags);
    GetGroundEffectFlags_LongGrassOnBeginStep(eventObj, flags);
    GetGroundEffectFlags_Tracks(eventObj, flags);
    GetGroundEffectFlags_SandPile(eventObj, flags);
    GetGroundEffectFlags_ShallowFlowingWater(eventObj, flags);
    GetGroundEffectFlags_Puddle(eventObj, flags);
    GetGroundEffectFlags_ShortGrass(eventObj, flags);
    GetGroundEffectFlags_HotSprings(eventObj, flags);
}

static void GetAllGroundEffectFlags_OnFinishStep(struct EventObject *eventObj, u32 *flags)
{
    EventObjectUpdateMetatileBehaviors(eventObj);
    GetGroundEffectFlags_ShallowFlowingWater(eventObj, flags);
    GetGroundEffectFlags_SandPile(eventObj, flags);
    GetGroundEffectFlags_Puddle(eventObj, flags);
    GetGroundEffectFlags_Ripple(eventObj, flags);
    GetGroundEffectFlags_ShortGrass(eventObj, flags);
    GetGroundEffectFlags_HotSprings(eventObj, flags);
    GetGroundEffectFlags_Seaweed(eventObj, flags);
    GetGroundEffectFlags_JumpLanding(eventObj, flags);
}

void EventObjectUpdateMetatileBehaviors(struct EventObject *eventObj)
{
    eventObj->previousMetatileBehavior = MapGridGetMetatileBehaviorAt(eventObj->previousCoords.x, eventObj->previousCoords.y);
    eventObj->currentMetatileBehavior = MapGridGetMetatileBehaviorAt(eventObj->currentCoords.x, eventObj->currentCoords.y);
}

void GetGroundEffectFlags_Reflection(struct EventObject *eventObj, u32 *flags)
{
    u32 reflectionFlags[2] = { GROUND_EFFECT_FLAG_REFLECTION, GROUND_EFFECT_FLAG_ICE_REFLECTION };
    u8 type = EventObjectCheckForReflectiveSurface(eventObj);

    if (type)
    {
        if (!eventObj->hasReflection)
        {
            eventObj->hasReflection = 0;
            eventObj->hasReflection = 1;
            *flags |= reflectionFlags[type - 1];
        }
    }
    else
    {
        eventObj->hasReflection = 0;
    }
}

void GetGroundEffectFlags_TallGrassOnSpawn(struct EventObject *eventObj, u32 *flags)
{
    if (MetatileBehavior_IsTallGrass(eventObj->currentMetatileBehavior))
        *flags |= GROUND_EFFECT_FLAG_TALL_GRASS_ON_SPAWN;
}

void GetGroundEffectFlags_TallGrassOnBeginStep(struct EventObject *eventObj, u32 *flags)
{
    if (MetatileBehavior_IsTallGrass(eventObj->currentMetatileBehavior))
        *flags |= GROUND_EFFECT_FLAG_TALL_GRASS_ON_MOVE;
}

void GetGroundEffectFlags_LongGrassOnSpawn(struct EventObject *eventObj, u32 *flags)
{
    if (MetatileBehavior_IsLongGrass(eventObj->currentMetatileBehavior))
        *flags |= GROUND_EFFECT_FLAG_LONG_GRASS_ON_SPAWN;
}

void GetGroundEffectFlags_LongGrassOnBeginStep(struct EventObject *eventObj, u32 *flags)
{
    if (MetatileBehavior_IsLongGrass(eventObj->currentMetatileBehavior))
        *flags |= GROUND_EFFECT_FLAG_LONG_GRASS_ON_MOVE;
}

void GetGroundEffectFlags_Tracks(struct EventObject *eventObj, u32 *flags)
{
    if (MetatileBehavior_IsDeepSand(eventObj->previousMetatileBehavior))
    {
        *flags |= GROUND_EFFECT_FLAG_DEEP_SAND;
    }
    else if (MetatileBehavior_IsSandOrDeepSand(eventObj->previousMetatileBehavior)
             || MetatileBehavior_IsFootprints(eventObj->previousMetatileBehavior))
    {
        *flags |= GROUND_EFFECT_FLAG_SAND;
    }
}

void GetGroundEffectFlags_SandPile(struct EventObject *eventObj, u32 *flags)
{
    if (MetatileBehavior_IsDeepSand(eventObj->currentMetatileBehavior)
        && MetatileBehavior_IsDeepSand(eventObj->previousMetatileBehavior))
    {
        if (!eventObj->inSandPile)
        {
            eventObj->inSandPile = 0;
            eventObj->inSandPile = 1;
            *flags |= GROUND_EFFECT_FLAG_SAND_PILE;
        }
    }
    else
    {
        eventObj->inSandPile = 0;
    }
}

void GetGroundEffectFlags_ShallowFlowingWater(struct EventObject *eventObj, u32 *flags)
{
    if ((MetatileBehavior_IsShallowFlowingWater(eventObj->currentMetatileBehavior)
         && MetatileBehavior_IsShallowFlowingWater(eventObj->previousMetatileBehavior))
        || (MetatileBehavior_IsPacifidlogLog(eventObj->currentMetatileBehavior)
            && MetatileBehavior_IsPacifidlogLog(eventObj->previousMetatileBehavior)))
    {
        if (!eventObj->inShallowFlowingWater)
        {
            eventObj->inShallowFlowingWater = 0;
            eventObj->inShallowFlowingWater = 1;
            *flags |= GROUND_EFFECT_FLAG_SHALLOW_FLOWING_WATER;
        }
    }
    else
    {
        eventObj->inShallowFlowingWater = 0;
    }
}

void GetGroundEffectFlags_Puddle(struct EventObject *eventObj, u32 *flags)
{
    if (MetatileBehavior_IsPuddle(eventObj->currentMetatileBehavior)
        && MetatileBehavior_IsPuddle(eventObj->previousMetatileBehavior))
    {
        *flags |= GROUND_EFFECT_FLAG_PUDDLE;
    }
}

void GetGroundEffectFlags_Ripple(struct EventObject *eventObj, u32 *flags)
{
    if (MetatileBehavior_HasRipples(eventObj->currentMetatileBehavior))
        *flags |= GROUND_EFFECT_FLAG_RIPPLES;
}

void GetGroundEffectFlags_ShortGrass(struct EventObject *eventObj, u32 *flags)
{
    if (MetatileBehavior_IsShortGrass(eventObj->currentMetatileBehavior)
        && MetatileBehavior_IsShortGrass(eventObj->previousMetatileBehavior))
    {
        if (!eventObj->inShortGrass)
        {
            eventObj->inShortGrass = 0;
            eventObj->inShortGrass = 1;
            *flags |= GROUND_EFFECT_FLAG_SHORT_GRASS;
        }
    }
    else
    {
        eventObj->inShortGrass = 0;
    }
}

void GetGroundEffectFlags_HotSprings(struct EventObject *eventObj, u32 *flags)
{
    if (MetatileBehavior_IsHotSprings(eventObj->currentMetatileBehavior)
        && MetatileBehavior_IsHotSprings(eventObj->previousMetatileBehavior))
    {
        if (!eventObj->inHotSprings)
        {
            eventObj->inHotSprings = 0;
            eventObj->inHotSprings = 1;
            *flags |= GROUND_EFFECT_FLAG_HOT_SPRINGS;
        }
    }
    else
    {
        eventObj->inHotSprings = 0;
    }
}

void GetGroundEffectFlags_Seaweed(struct EventObject *eventObj, u32 *flags)
{
    if (MetatileBehavior_IsSeaweed(eventObj->currentMetatileBehavior))
        *flags |= GROUND_EFFECT_FLAG_SEAWEED;
}

void GetGroundEffectFlags_JumpLanding(struct EventObject *eventObj, u32 *flags)
{
    typedef bool8 (*MetatileFunc)(u8);

    static const MetatileFunc metatileFuncs[] = {
        MetatileBehavior_IsTallGrass,
        MetatileBehavior_IsLongGrass,
        MetatileBehavior_IsPuddle,
        MetatileBehavior_IsSurfableWaterOrUnderwater,
        MetatileBehavior_IsShallowFlowingWater,
        MetatileBehavior_IsATile,
    };

    static const u32 jumpLandingFlags[] = {
        GROUND_EFFECT_FLAG_LAND_IN_TALL_GRASS,
        GROUND_EFFECT_FLAG_LAND_IN_LONG_GRASS,
        GROUND_EFFECT_FLAG_LAND_IN_SHALLOW_WATER,
        GROUND_EFFECT_FLAG_LAND_IN_DEEP_WATER,
        GROUND_EFFECT_FLAG_LAND_IN_SHALLOW_WATER,
        GROUND_EFFECT_FLAG_LAND_ON_NORMAL_GROUND,
    };

    if (eventObj->landingJump && !eventObj->disableJumpLandingGroundEffect)
    {
        u8 i;

        for (i = 0; i < ARRAY_COUNT(metatileFuncs); i++)
        {
            if (metatileFuncs[i](eventObj->currentMetatileBehavior))
            {
                *flags |= jumpLandingFlags[i];
                return;
            }
        }
    }
}

u8 EventObjectCheckForReflectiveSurface(struct EventObject *eventObj)
{
    const struct EventObjectGraphicsInfo *info = GetEventObjectGraphicsInfo(eventObj->graphicsId);

    // ceil div by tile width?
    s16 width = (info->width + 8) >> 4;
    s16 height = (info->height + 8) >> 4;
    s16 i;
    s16 j;
    u8 result;
    u8 b;
    s16 one;

#define RETURN_REFLECTION_TYPE_AT(x, y)              \
    b = MapGridGetMetatileBehaviorAt(x, y);          \
    result = GetReflectionTypeByMetatileBehavior(b); \
    if (result != 0)                                 \
        return result;

    for (i = 0, one = 1; i < height; i++)
    {
        RETURN_REFLECTION_TYPE_AT(eventObj->currentCoords.x, eventObj->currentCoords.y + one + i)
        RETURN_REFLECTION_TYPE_AT(eventObj->previousCoords.x, eventObj->previousCoords.y + one + i)
        for (j = 1; j < width; j++)
        {
            RETURN_REFLECTION_TYPE_AT(eventObj->currentCoords.x + j, eventObj->currentCoords.y + one + i)
            RETURN_REFLECTION_TYPE_AT(eventObj->currentCoords.x - j, eventObj->currentCoords.y + one + i)
            RETURN_REFLECTION_TYPE_AT(eventObj->previousCoords.x + j, eventObj->previousCoords.y + one + i)
            RETURN_REFLECTION_TYPE_AT(eventObj->previousCoords.x - j, eventObj->previousCoords.y + one + i)
        }
    }
    return 0;

#undef RETURN_REFLECTION_TYPE_AT
}

static u8 GetReflectionTypeByMetatileBehavior(u32 behavior)
{
    if (MetatileBehavior_IsIce(behavior))
        return 1;
    else if (MetatileBehavior_IsReflective(behavior))
        return 2;
    else
        return 0;
}

u8 GetLedgeJumpDirection(s16 x, s16 y, u8 z)
{
    static bool8 (*const unknown_08376040[])(u8) = {
        MetatileBehavior_IsJumpSouth,
        MetatileBehavior_IsJumpNorth,
        MetatileBehavior_IsJumpWest,
        MetatileBehavior_IsJumpEast,
    };

    u8 b;
    u8 index = z;

    if (index == 0)
        return 0;
    else if (index > 4)
        index -= 4;

    index--;
    b = MapGridGetMetatileBehaviorAt(x, y);

    if (unknown_08376040[index](b) == 1)
        return index + 1;

    return 0;
}

void SetEventObjectSpriteOamTableForLongGrass(struct EventObject *eventObj, struct Sprite *sprite)
{
    if (eventObj->disableCoveringGroundEffects)
        return;

    if (!MetatileBehavior_IsLongGrass(eventObj->currentMetatileBehavior))
        return;

    if (!MetatileBehavior_IsLongGrass(eventObj->previousMetatileBehavior))
        return;

    sprite->subspriteTableNum = 4;

    if (ZCoordToPriority(eventObj->previousElevation) == 1)
        sprite->subspriteTableNum = 5;
}

bool8 IsZCoordMismatchAt(u8 z, s16 x, s16 y)
{
    u8 mapZ;

    if (z == 0)
        return FALSE;

    mapZ = MapGridGetZCoordAt(x, y);

    if (mapZ == 0 || mapZ == 0xF)
        return FALSE;

    if (mapZ != z)
        return TRUE;

    return FALSE;
}

static const u8 sUnknown_08376050[] = {
    0x73, 0x73, 0x53, 0x73, 0x53, 0x73, 0x53, 0x73, 0x53, 0x73, 0x53, 0x73, 0x53, 0x00, 0x00, 0x73
};

// Each byte corresponds to a sprite priority for an event object.
// This is directly the inverse of gEventObjectPriorities_08376070.
static const u8 sEventObjectPriorities_08376060[] = {
    2, 2, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 0, 0, 2
};

// Each byte corresponds to a sprite priority for an event object.
// This is the inverse of gEventObjectPriorities_08376060.
// 1 = Above player sprite
// 2 = Below player sprite
static const u8 sEventObjectPriorities_08376070[] = {
    1, 1, 1, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 0, 0, 1,
};

void UpdateEventObjectZCoordAndPriority(struct EventObject *eventObj, struct Sprite *sprite)
{
    if (eventObj->fixedPriority)
        return;

    EventObjectUpdateZCoord(eventObj);

    sprite->subspriteTableNum = sEventObjectPriorities_08376070[eventObj->previousElevation];
    sprite->oam.priority = sEventObjectPriorities_08376060[eventObj->previousElevation];
}

static void InitObjectPriorityByZCoord(struct Sprite *sprite, u8 z)
{
    sprite->subspriteTableNum = sEventObjectPriorities_08376070[z];
    sprite->oam.priority = sEventObjectPriorities_08376060[z];
}

u8 ZCoordToPriority(u8 z)
{
    return sEventObjectPriorities_08376060[z];
}

void EventObjectUpdateZCoord(struct EventObject *eventObj)
{
    u8 z = MapGridGetZCoordAt(eventObj->currentCoords.x, eventObj->currentCoords.y);
    u8 z2 = MapGridGetZCoordAt(eventObj->previousCoords.x, eventObj->previousCoords.y);

    if (z == 0xF || z2 == 0xF)
        return;

    eventObj->currentElevation = z;

    if (z != 0 && z != 0xF)
        eventObj->previousElevation = z;
}

void SetObjectSubpriorityByZCoord(u8 a, struct Sprite *sprite, u8 b)
{
    s32 tmp = sprite->centerToCornerVecY;
    u32 tmpa = *(u16 *)&sprite->pos1.y;
    u32 tmpb = *(u16 *)&gSpriteCoordOffsetY;
    s32 tmp2 = (tmpa - tmp) + tmpb;
    u16 tmp3 = (0x10 - ((((u32)tmp2 + 8) & 0xFF) >> 4)) * 2;
    sprite->subpriority = tmp3 + sUnknown_08376050[a] + b;
}

static void EventObjectUpdateSubpriority(struct EventObject *eventObj, struct Sprite *sprite)
{
    if (eventObj->fixedPriority)
        return;

    SetObjectSubpriorityByZCoord(eventObj->previousElevation, sprite, 1);
}

bool8 AreZCoordsCompatible(u8 a, u8 b)
{
    if (a == 0 || b == 0)
        return TRUE;

    if (a != b)
        return FALSE;

    return TRUE;
}

void GroundEffect_SpawnOnTallGrass(struct EventObject *eventObj, struct Sprite *sprite)
{
    gFieldEffectArguments[0] = eventObj->currentCoords.x;
    gFieldEffectArguments[1] = eventObj->currentCoords.y;
    gFieldEffectArguments[2] = eventObj->previousElevation;
    gFieldEffectArguments[3] = 2;
    gFieldEffectArguments[4] = eventObj->localId << 8 | eventObj->mapNum;
    gFieldEffectArguments[5] = eventObj->mapGroup;
    gFieldEffectArguments[6] = (u8)gSaveBlock1.location.mapNum << 8 | (u8)gSaveBlock1.location.mapGroup;
    gFieldEffectArguments[7] = 1;
    FieldEffectStart(FLDEFF_TALL_GRASS);
}

void GroundEffect_MoveOnTallGrass(struct EventObject *eventObj, struct Sprite *sprite)
{
    gFieldEffectArguments[0] = eventObj->currentCoords.x;
    gFieldEffectArguments[1] = eventObj->currentCoords.y;
    gFieldEffectArguments[2] = eventObj->previousElevation;
    gFieldEffectArguments[3] = 2;
    gFieldEffectArguments[4] = eventObj->localId << 8 | eventObj->mapNum;
    gFieldEffectArguments[5] = eventObj->mapGroup;
    gFieldEffectArguments[6] = (u8)gSaveBlock1.location.mapNum << 8 | (u8)gSaveBlock1.location.mapGroup;
    gFieldEffectArguments[7] = 0;
    FieldEffectStart(FLDEFF_TALL_GRASS);
}

void GroundEffect_SpawnOnLongGrass(struct EventObject *eventObj, struct Sprite *sprite)
{
    gFieldEffectArguments[0] = eventObj->currentCoords.x;
    gFieldEffectArguments[1] = eventObj->currentCoords.y;
    gFieldEffectArguments[2] = eventObj->previousElevation;
    gFieldEffectArguments[3] = 2;
    gFieldEffectArguments[4] = eventObj->localId << 8 | eventObj->mapNum;
    gFieldEffectArguments[5] = eventObj->mapGroup;
    gFieldEffectArguments[6] = (u8)gSaveBlock1.location.mapNum << 8 | (u8)gSaveBlock1.location.mapGroup;
    gFieldEffectArguments[7] = 1;
    FieldEffectStart(FLDEFF_LONG_GRASS);
}

void GroundEffect_MoveOnLongGrass(struct EventObject *eventObj, struct Sprite *sprite)
{
    gFieldEffectArguments[0] = eventObj->currentCoords.x;
    gFieldEffectArguments[1] = eventObj->currentCoords.y;
    gFieldEffectArguments[2] = eventObj->previousElevation;
    gFieldEffectArguments[3] = 2;
    gFieldEffectArguments[4] = (eventObj->localId << 8) | eventObj->mapNum;
    gFieldEffectArguments[5] = eventObj->mapGroup;
    gFieldEffectArguments[6] = (u8)gSaveBlock1.location.mapNum << 8 | (u8)gSaveBlock1.location.mapGroup;
    gFieldEffectArguments[7] = 0;
    FieldEffectStart(FLDEFF_LONG_GRASS);
}

void GroundEffect_WaterReflection(struct EventObject *eventObj, struct Sprite *sprite)
{
    InitObjectReflectionSprite(eventObj, sprite, 0);
}

void GroundEffect_IceReflection(struct EventObject *eventObj, struct Sprite *sprite)
{
    InitObjectReflectionSprite(eventObj, sprite, 1);
}

void GroundEffect_FlowingWater(struct EventObject *eventObj, struct Sprite *sprite)
{
    StartFieldEffectForEventObject(FLDEFF_FEET_IN_FLOWING_WATER, eventObj);
}

static void (*const sGroundEffectTracksFuncs[])(struct EventObject *eventObj, struct Sprite *sprite, u8 a) = {
    nullsub, DoTracksGroundEffect_Footprints, DoTracksGroundEffect_BikeTireTracks,
};

void GroundEffect_SandTracks(struct EventObject *eventObj, struct Sprite *sprite)
{
    const struct EventObjectGraphicsInfo *info = GetEventObjectGraphicsInfo(eventObj->graphicsId);
    sGroundEffectTracksFuncs[info->tracks](eventObj, sprite, 0);
}

void GroundEffect_DeepSandTracks(struct EventObject *eventObj, struct Sprite *sprite)
{
    const struct EventObjectGraphicsInfo *info = GetEventObjectGraphicsInfo(eventObj->graphicsId);
    sGroundEffectTracksFuncs[info->tracks](eventObj, sprite, 1);
}

static void nullsub(struct EventObject *eventObj, struct Sprite *sprite, u8 a)
{
}

static void DoTracksGroundEffect_Footprints(struct EventObject *eventObj, struct Sprite *sprite, u8 a)
{
    // First half-word is a Field Effect script id. (gFieldEffectScriptPointers)
    u16 sandFootprints_FieldEffectData[2] = {
        FLDEFF_SAND_FOOTPRINTS,
        FLDEFF_DEEP_SAND_FOOTPRINTS
    };

    gFieldEffectArguments[0] = eventObj->previousCoords.x;
    gFieldEffectArguments[1] = eventObj->previousCoords.y;
    gFieldEffectArguments[2] = 149;
    gFieldEffectArguments[3] = 2;
    gFieldEffectArguments[4] = eventObj->facingDirection;
    FieldEffectStart(sandFootprints_FieldEffectData[a]);
}

static void DoTracksGroundEffect_BikeTireTracks(struct EventObject *eventObj, struct Sprite *sprite, u8 a)
{
    //  Specifies which bike track shape to show next.
    //  For example, when the bike turns from up to right, it will show
    //  a track that curves to the right.
    //  Each 4-byte row corresponds to the initial direction of the bike, and
    //  each byte in that row is for the next direction of the bike in the order
    //  of down, up, left, right.
    static const u8 bikeTireTracks_Transitions[4][4] = {
        1, 2, 7, 8,
        1, 2, 6, 5,
        5, 8, 3, 4,
        6, 7, 3, 4,
    };

    if (eventObj->currentCoords.x != eventObj->previousCoords.x || eventObj->currentCoords.y != eventObj->previousCoords.y)
    {
        gFieldEffectArguments[0] = eventObj->previousCoords.x;
        gFieldEffectArguments[1] = eventObj->previousCoords.y;
        gFieldEffectArguments[2] = 149;
        gFieldEffectArguments[3] = 2;
        gFieldEffectArguments[4] =
            bikeTireTracks_Transitions[eventObj->previousMovementDirection][eventObj->facingDirection - 5];
        FieldEffectStart(FLDEFF_BIKE_TIRE_TRACKS);
    }
}

void GroundEffect_Ripple(struct EventObject *eventObj, struct Sprite *sprite)
{
    DoRippleFieldEffect(eventObj, sprite);
}

void GroundEffect_StepOnPuddle(struct EventObject *eventObj, struct Sprite *sprite)
{
    StartFieldEffectForEventObject(FLDEFF_SPLASH, eventObj);
}

void GroundEffect_SandPile(struct EventObject *eventObj, struct Sprite *sprite)
{
    StartFieldEffectForEventObject(FLDEFF_SAND_PILE, eventObj);
}

void GroundEffect_JumpOnTallGrass(struct EventObject *eventObj, struct Sprite *sprite)
{
    u8 spriteId;

    gFieldEffectArguments[0] = eventObj->currentCoords.x;
    gFieldEffectArguments[1] = eventObj->currentCoords.y;
    gFieldEffectArguments[2] = eventObj->previousElevation;
    gFieldEffectArguments[3] = 2;
    FieldEffectStart(FLDEFF_JUMP_TALL_GRASS);

    spriteId = FindTallGrassFieldEffectSpriteId(
        eventObj->localId,
        eventObj->mapNum,
        eventObj->mapGroup,
        eventObj->currentCoords.x,
        eventObj->currentCoords.y);

    if (spriteId == MAX_SPRITES)
        GroundEffect_SpawnOnTallGrass(eventObj, sprite);
}

void GroundEffect_JumpOnLongGrass(struct EventObject *eventObj, struct Sprite *sprite)
{
    gFieldEffectArguments[0] = eventObj->currentCoords.x;
    gFieldEffectArguments[1] = eventObj->currentCoords.y;
    gFieldEffectArguments[2] = eventObj->previousElevation;
    gFieldEffectArguments[3] = 2;
    FieldEffectStart(FLDEFF_JUMP_LONG_GRASS);
}

void GroundEffect_JumpOnShallowWater(struct EventObject *eventObj, struct Sprite *sprite)
{
    gFieldEffectArguments[0] = eventObj->currentCoords.x;
    gFieldEffectArguments[1] = eventObj->currentCoords.y;
    gFieldEffectArguments[2] = eventObj->previousElevation;
    gFieldEffectArguments[3] = sprite->oam.priority;
    FieldEffectStart(FLDEFF_JUMP_SMALL_SPLASH);
}

void GroundEffect_JumpOnWater(struct EventObject *eventObj, struct Sprite *sprite)
{
    gFieldEffectArguments[0] = eventObj->currentCoords.x;
    gFieldEffectArguments[1] = eventObj->currentCoords.y;
    gFieldEffectArguments[2] = eventObj->previousElevation;
    gFieldEffectArguments[3] = sprite->oam.priority;
    FieldEffectStart(FLDEFF_JUMP_BIG_SPLASH);
}

void GroundEffect_JumpLandingDust(struct EventObject *eventObj, struct Sprite *sprite)
{
    gFieldEffectArguments[0] = eventObj->currentCoords.x;
    gFieldEffectArguments[1] = eventObj->currentCoords.y;
    gFieldEffectArguments[2] = eventObj->previousElevation;
    gFieldEffectArguments[3] = sprite->oam.priority;
    FieldEffectStart(FLDEFF_DUST);
}

void GroundEffect_ShortGrass(struct EventObject *eventObj, struct Sprite *sprite)
{
    StartFieldEffectForEventObject(FLDEFF_SHORT_GRASS, eventObj);
}

void GroundEffect_HotSprings(struct EventObject *eventObj, struct Sprite *sprite)
{
    StartFieldEffectForEventObject(FLDEFF_HOT_SPRINGS_WATER, eventObj);
}

void GroundEffect_Seaweed(struct EventObject *eventObj, struct Sprite *sprite)
{
    gFieldEffectArguments[0] = eventObj->currentCoords.x;
    gFieldEffectArguments[1] = eventObj->currentCoords.y;
    FieldEffectStart(FLDEFF_BUBBLES);
}

static void (*const sGroundEffectFuncs[])(struct EventObject *eventObj, struct Sprite *sprite) = {
    GroundEffect_SpawnOnTallGrass,
    GroundEffect_MoveOnTallGrass,
    GroundEffect_SpawnOnLongGrass,
    GroundEffect_MoveOnLongGrass,
    GroundEffect_WaterReflection,
    GroundEffect_IceReflection,
    GroundEffect_FlowingWater,
    GroundEffect_SandTracks,
    GroundEffect_DeepSandTracks,
    GroundEffect_Ripple,
    GroundEffect_StepOnPuddle,
    GroundEffect_SandPile,
    GroundEffect_JumpOnTallGrass,
    GroundEffect_JumpOnLongGrass,
    GroundEffect_JumpOnShallowWater,
    GroundEffect_JumpOnWater,
    GroundEffect_JumpLandingDust,
    GroundEffect_ShortGrass,
    GroundEffect_HotSprings,
    GroundEffect_Seaweed
};

static void StartTriggeredGroundEffects(struct EventObject *eventObj, struct Sprite *sprite, u32 flags)
{
    u8 i;
    for (i = 0; i < ARRAY_COUNT(sGroundEffectFuncs); i++, flags >>= 1)
        if (flags & 1)
            sGroundEffectFuncs[i](eventObj, sprite);
}

void FilterOutDisabledCoveringGroundEffects(struct EventObject *eventObj, u32 *flags)
{
    if (eventObj->disableCoveringGroundEffects)
    {
        eventObj->inShortGrass = 0;
        eventObj->inSandPile = 0;
        eventObj->inShallowFlowingWater = 0;
        eventObj->inHotSprings = 0;
        *flags &= ~(GROUND_EFFECT_FLAG_HOT_SPRINGS
                  | GROUND_EFFECT_FLAG_SHORT_GRASS
                  | GROUND_EFFECT_FLAG_SAND_PILE
                  | GROUND_EFFECT_FLAG_SHALLOW_FLOWING_WATER
                  | GROUND_EFFECT_FLAG_TALL_GRASS_ON_MOVE);
    }
}

void FilterOutStepOnPuddleGroundEffectIfJumping(struct EventObject *eventObj, u32 *flags)
{
    if (eventObj->landingJump)
        *flags &= ~GROUND_EFFECT_FLAG_PUDDLE;
}

static void DoGroundEffects_OnSpawn(struct EventObject *eventObj, struct Sprite *sprite)
{
    u32 flags;

    if (eventObj->triggerGroundEffectsOnMove)
    {
        flags = 0;
        UpdateEventObjectZCoordAndPriority(eventObj, sprite);
        GetAllGroundEffectFlags_OnSpawn(eventObj, &flags);
        SetEventObjectSpriteOamTableForLongGrass(eventObj, sprite);
        StartTriggeredGroundEffects(eventObj, sprite, flags);
        eventObj->triggerGroundEffectsOnMove = 0;
        eventObj->disableCoveringGroundEffects = 0;
    }
}

static void DoGroundEffects_OnBeginStep(struct EventObject *eventObj, struct Sprite *sprite)
{
    u32 flags;

    if (eventObj->triggerGroundEffectsOnMove)
    {
        flags = 0;
        UpdateEventObjectZCoordAndPriority(eventObj, sprite);
        GetAllGroundEffectFlags_OnBeginStep(eventObj, &flags);
        SetEventObjectSpriteOamTableForLongGrass(eventObj, sprite);
        FilterOutDisabledCoveringGroundEffects(eventObj, &flags);
        StartTriggeredGroundEffects(eventObj, sprite, flags);
        eventObj->triggerGroundEffectsOnMove = 0;
        eventObj->disableCoveringGroundEffects = 0;
    }
}

static void DoGroundEffects_OnFinishStep(struct EventObject *eventObj, struct Sprite *sprite)
{
    u32 flags;

    if (eventObj->triggerGroundEffectsOnStop)
    {
        flags = 0;
        UpdateEventObjectZCoordAndPriority(eventObj, sprite);
        GetAllGroundEffectFlags_OnFinishStep(eventObj, &flags);
        SetEventObjectSpriteOamTableForLongGrass(eventObj, sprite);
        FilterOutStepOnPuddleGroundEffectIfJumping(eventObj, &flags);
        StartTriggeredGroundEffects(eventObj, sprite, flags);
        eventObj->triggerGroundEffectsOnStop = 0;
        eventObj->landingJump = 0;
    }
}

bool8 FreezeEventObject(struct EventObject *eventObject)
{
    if (eventObject->heldMovementActive || eventObject->frozen)
    {
        return TRUE;
    }
    else
    {
        eventObject->frozen = 1;
        eventObject->spriteAnimPausedBackup = gSprites[eventObject->spriteId].animPaused;
        eventObject->spriteAffineAnimPausedBackup = gSprites[eventObject->spriteId].affineAnimPaused;
        gSprites[eventObject->spriteId].animPaused = 1;
        gSprites[eventObject->spriteId].affineAnimPaused = 1;
        return FALSE;
    }
}

void FreezeEventObjects(void)
{
    u8 i;
    for (i = 0; i < 16; i++)
        if (gEventObjects[i].active && i != gPlayerAvatar.eventObjectId)
            FreezeEventObject(&gEventObjects[i]);
}

void FreezeEventObjectsExceptOne(u8 eventObjectId)
{
    u8 i;
    for (i = 0; i < 16; i++)
        if (i != eventObjectId && gEventObjects[i].active && i != gPlayerAvatar.eventObjectId)
            FreezeEventObject(&gEventObjects[i]);
}

void UnfreezeEventObject(struct EventObject *eventObject)
{
    if (eventObject->active && eventObject->frozen)
    {
        eventObject->frozen = 0;
        gSprites[eventObject->spriteId].animPaused = eventObject->spriteAnimPausedBackup;
        gSprites[eventObject->spriteId].affineAnimPaused = eventObject->spriteAffineAnimPausedBackup;
    }
}

void UnfreezeEventObjects(void)
{
    u8 i;
    for (i = 0; i < 16; i++)
        if (gEventObjects[i].active)
            UnfreezeEventObject(&gEventObjects[i]);
}

static void Step1(struct Sprite *sprite, u8 dir)
{
    sprite->pos1.x += sDirectionToVectors[dir].x;
    sprite->pos1.y += sDirectionToVectors[dir].y;
}

static void Step2(struct Sprite *sprite, u8 dir)
{
    sprite->pos1.x += 2 * (u16) sDirectionToVectors[dir].x;
    sprite->pos1.y += 2 * (u16) sDirectionToVectors[dir].y;
}

static void Step3(struct Sprite *sprite, u8 dir)
{
    sprite->pos1.x += 2 * (u16) sDirectionToVectors[dir].x + (u16) sDirectionToVectors[dir].x;
    sprite->pos1.y += 2 * (u16) sDirectionToVectors[dir].y + (u16) sDirectionToVectors[dir].y;
}

static void Step4(struct Sprite *sprite, u8 dir)
{
    sprite->pos1.x += 4 * (u16) sDirectionToVectors[dir].x;
    sprite->pos1.y += 4 * (u16) sDirectionToVectors[dir].y;
}

static void Step8(struct Sprite *sprite, u8 dir)
{
    sprite->pos1.x += 8 * (u16) sDirectionToVectors[dir].x;
    sprite->pos1.y += 8 * (u16) sDirectionToVectors[dir].y;
}

static void oamt_npc_ministep_reset(struct Sprite *sprite, u8 direction, u8 a3)
{
    sprite->data[3] = direction;
    sprite->data[4] = a3;
    sprite->data[5] = 0;
}

typedef void (*SpriteStepFunc)(struct Sprite *sprite, u8 direction);

static const SpriteStepFunc Unknown_83760F0[] = {
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1
};

static const SpriteStepFunc Unknown_8376130[] = {
    Step2,
    Step2,
    Step2,
    Step2,
    Step2,
    Step2,
    Step2,
    Step2
};

static const SpriteStepFunc Unknown_8376150[] = {
    Step2,
    Step3,
    Step3,
    Step2,
    Step3,
    Step3
};

static const SpriteStepFunc Unknown_8376168[] = {
    Step4,
    Step4,
    Step4,
    Step4
};

static const SpriteStepFunc Unknown_8376178[] = {
    Step8,
    Step8
};

static const SpriteStepFunc *const gUnknown_08376180[] = {
    Unknown_83760F0,
    Unknown_8376130,
    Unknown_8376150,
    Unknown_8376168,
    Unknown_8376178
};

static const s16 gUnknown_08376194[] = {
    16, 8, 6, 4, 2
};

bool8 obj_npc_ministep(struct Sprite *sprite)
{
    if (sprite->data[5] >= gUnknown_08376194[sprite->data[4]])
        return FALSE;

    gUnknown_08376180[sprite->data[4]][sprite->data[5]](sprite, sprite->data[3]);

    sprite->data[5]++;

    if (sprite->data[5] < gUnknown_08376194[sprite->data[4]])
        return FALSE;

    return TRUE;
}

void sub_806467C(struct Sprite *sprite, u8 direction)
{
    sprite->data[3] = direction;
    sprite->data[4] = 0;
    sprite->data[5] = 0;
}

bool8 sub_806468C(struct Sprite *sprite)
{
    if (!(sprite->data[4] & 1))
    {
        Step1(sprite, sprite->data[3]);
        sprite->data[5]++;
    }

    sprite->data[4]++;

    if (sprite->data[5] > 15)
        return TRUE;
    else
        return FALSE;
}

static const s8 Unknown_837619E[] = {
     -4,  -6,  -8, -10, -11, -12, -12, -12, -11, -10,  -9,  -8,  -6,  -4,   0,   0
};

static const s8 Unknown_83761AE[] = {
      0,  -2,  -3,  -4,  -5,  -6,  -6,  -6,  -5,  -5,  -4,  -3,  -2,   0,   0,   0
};

static const s8 Unknown_83761BE[] = {
     -2,  -4,  -6,  -8,  -9, -10, -10, -10,  -9,  -8,  -6,  -5,  -3,  -2,   0,   0
};

static const s8 *const gUnknown_083761D0[] = {
    Unknown_837619E,
    Unknown_83761AE,
    Unknown_83761BE
};

s16 sub_80646C8(s16 a1, u8 a2)
{
    return gUnknown_083761D0[a2][a1];
}

void sub_80646E4(struct Sprite *sprite, u8 a2, u8 a3, u8 a4)
{
    sprite->data[3] = a2;
    sprite->data[4] = a3;
    sprite->data[5] = a4;
    sprite->data[6] = 0;
}

u8 sub_8064704(struct Sprite *sprite)
{
    s16 v5[3] = {0x10, 0x10, 0x20};
    u8 v6[3] = {0, 0, 1};
    u8 v2 = 0;

    if (sprite->data[4])
        Step1(sprite, sprite->data[3]);

    sprite->pos2.y = sub_80646C8(sprite->data[6] >> v6[sprite->data[4]], sprite->data[5]);

    sprite->data[6]++;

    if (sprite->data[6] == (v5[sprite->data[4]] >> 1))
        v2 = 1;

    if (sprite->data[6] >= v5[sprite->data[4]])
    {
        sprite->pos2.y = 0;
        v2 = -1;
    }

    return v2;
}

u8 sub_806478C(struct Sprite *sprite)
{
    s16 v5[3] = {0x20, 0x20, 0x40};
    u8 v6[3] = {1, 1, 2};
    u8 v2 = 0;

    if (sprite->data[4] && !(sprite->data[6] & 1))
        Step1(sprite, sprite->data[3]);

    sprite->pos2.y = sub_80646C8(sprite->data[6] >> v6[sprite->data[4]], sprite->data[5]);

    sprite->data[6]++;

    if (sprite->data[6] == (v5[sprite->data[4]] >> 1))
        v2 = 1;

    if (sprite->data[6] >= v5[sprite->data[4]])
    {
        sprite->pos2.y = 0;
        v2 = -1;
    }

    return v2;
}

static void SetMovementDelay(struct Sprite *sprite, s16 delay)
{
    sprite->data[3] = delay;
}

static bool8 WaitForMovementDelay(struct Sprite *sprite)
{
    sprite->data[3]--;

    if (sprite->data[3] == 0)
        return TRUE;
    else
        return FALSE;
}

void SetAndStartSpriteAnim(struct Sprite *sprite, u8 animNum, u8 animCmdIndex)
{
    sprite->animNum = animNum;
    sprite->animPaused = 0;
    SeekSpriteAnim(sprite, animCmdIndex);
}

bool8 SpriteAnimEnded(struct Sprite *sprite)
{
    if (sprite->animEnded)
        return TRUE;
    else
        return FALSE;
}

void UpdateEventObjectSpriteVisibility(struct Sprite *sprite, bool8 invisible)
{
    u16 x, y;
    s16 x2, y2;

    sprite->invisible = invisible;

    if (sprite->coordOffsetEnabled)
    {
        x = sprite->pos1.x + sprite->pos2.x + sprite->centerToCornerVecX + gSpriteCoordOffsetX;
        y = sprite->pos1.y + sprite->pos2.y + sprite->centerToCornerVecY + gSpriteCoordOffsetY;
    }
    else
    {
        x = sprite->pos1.x + sprite->pos2.x + sprite->centerToCornerVecX;
        y = sprite->pos1.y + sprite->pos2.y + sprite->centerToCornerVecY;
    }

    x2 = x - (sprite->centerToCornerVecX >> 1);
    y2 = y - (sprite->centerToCornerVecY >> 1);

    if ((s16)x > 255 || x2 < -16)
        sprite->invisible = 1;
    if ((s16)y > 175 || y2 < -16)
        sprite->invisible = 1;
}

static void UpdateEventObjectSpriteSubpriorityAndVisibility(struct Sprite *sprite)
{
    SetObjectSubpriorityByZCoord(sprite->data[1], sprite, 1);
    UpdateEventObjectSpriteVisibility(sprite, 0);
}

void TurnEventObject(u8 eventObjectId, u8 direction)
{
    u8 i;
    for (i = 0; i < MAX_SPRITES; i++)
    {
        struct Sprite *sprite = &gSprites[i];
        if (sprite->inUse && sprite->callback == UpdateEventObjectSpriteSubpriorityAndVisibility && (u8)sprite->data[0] == eventObjectId)
        {
            u8 animNum = GetFaceDirectionAnimNum(direction);
            StartSpriteAnim(sprite, animNum);
            break;
        }
    }
}

u32 StartFieldEffectForEventObject(u8 fieldEffectId, struct EventObject *eventObject)
{
    EventObjectGetLocalIdAndMap(eventObject, &gFieldEffectArguments[0], &gFieldEffectArguments[1], &gFieldEffectArguments[2]);
    return FieldEffectStart(fieldEffectId);
}

void DoShadowFieldEffect(struct EventObject *eventObject)
{
    if (!eventObject->hasShadow)
    {
        eventObject->hasShadow = 1;
        StartFieldEffectForEventObject(FLDEFF_SHADOW, eventObject);
    }
}

void DoRippleFieldEffect(struct EventObject *eventObject, struct Sprite *sprite)
{
    const struct EventObjectGraphicsInfo *gfxInfo = GetEventObjectGraphicsInfo(eventObject->graphicsId);
    gFieldEffectArguments[0] = sprite->pos1.x;
    gFieldEffectArguments[1] = sprite->pos1.y + (gfxInfo->height >> 1) - 2;
    gFieldEffectArguments[2] = 151;
    gFieldEffectArguments[3] = 3;
    FieldEffectStart(FLDEFF_RIPPLE);
}
