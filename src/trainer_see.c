#include "global.h"
#include "trainer_see.h"
#include "battle_setup.h"
#include "field_effect.h"
#include "event_object_movement.h"
#include "field_player_avatar.h"
#include "script.h"
#include "sprite.h"
#include "task.h"
#include "util.h"
#include "constants/event_object_movement_constants.h"
#include "constants/field_effects.h"

static bool8 CheckTrainer(u8);
static void sub_8084894(struct Sprite *sprite, u16 a2, u8 a3);
static void objc_exclamation_mark_probably(struct Sprite *sprite);
static bool8 TrainerCanApproachPlayer(struct EventObject *);
static void sub_80842C8(struct EventObject *, u8);
static bool8 CheckPathBetweenTrainerAndPlayer(struct EventObject *trainerObj, u8 approachDistance, u8 direction);
static void RunTrainerSeeFuncList(u8 taskId);

const u8 gSpriteImage_839B308[] = INCBIN_U8("graphics/unknown_sprites/839B4E0/0.4bpp");
const u8 gSpriteImage_839B388[] = INCBIN_U8("graphics/unknown_sprites/839B4E0/1.4bpp");
const u8 gSpriteImage_839B408[] = INCBIN_U8("graphics/unknown_sprites/839B408.4bpp");

static u8 GetTrainerApproachDistanceSouth(struct EventObject *trainerObj, s16 range, s16 x, s16 y);
static u8 GetTrainerApproachDistanceNorth(struct EventObject *trainerObj, s16 range, s16 x, s16 y);
static u8 GetTrainerApproachDistanceWest(struct EventObject *trainerObj, s16 range, s16 x, s16 y);
static u8 GetTrainerApproachDistanceEast(struct EventObject *trainerObj, s16 range, s16 x, s16 y);

static u8 (*const sDirectionalApproachDistanceFuncs[])(struct EventObject *, s16, s16, s16) =
{
    GetTrainerApproachDistanceSouth,
    GetTrainerApproachDistanceNorth,
    GetTrainerApproachDistanceWest,
    GetTrainerApproachDistanceEast,
};

bool8 CheckTrainers(void)
{
    u8 eventObjId;

    for (eventObjId = 0; eventObjId < 16; eventObjId++)
    {
        if (gEventObjects[eventObjId].active
         && (gEventObjects[eventObjId].trainerType == 1 ||  gEventObjects[eventObjId].trainerType == 3)
         && CheckTrainer(eventObjId))
            return TRUE;
    }
    return FALSE;
}

static bool8 CheckTrainer(u8 eventObjId)
{
    u8 *scriptPtr = GetEventObjectScriptPointerByEventObjectId(eventObjId);

    if (GetTrainerFlagFromScriptPointer(scriptPtr))
    {
        return FALSE;
    }
    else
    {
        struct EventObject *trainerObj = &gEventObjects[eventObjId];
        bool8 canApproach = TrainerCanApproachPlayer(trainerObj);

        if (canApproach)
        {
            TrainerWantsBattle(eventObjId, scriptPtr);
            sub_80842C8(trainerObj, (canApproach - 1));
            return TRUE;
        }
        else
        {
            return FALSE;
        }
    }
}

static bool8 TrainerCanApproachPlayer(struct EventObject *trainerObj)
{
    s16 x, y;
    u8 i;
    u8 approachDistance;

    PlayerGetDestCoords(&x, &y);
    if (trainerObj->trainerType == 1)  // can only see in one direction
    {
        approachDistance = sDirectionalApproachDistanceFuncs[trainerObj->facingDirection - 1](trainerObj, trainerObj->trainerRange_berryTreeId, x, y);
        return CheckPathBetweenTrainerAndPlayer(trainerObj, approachDistance, trainerObj->facingDirection);
    }
    else  // can see in all directions
    {
        for (i = 0; i < 4; i++)
        {
            approachDistance = sDirectionalApproachDistanceFuncs[i](trainerObj, trainerObj->trainerRange_berryTreeId, x, y);
            if (CheckPathBetweenTrainerAndPlayer(trainerObj, approachDistance, i + 1)) // directions are 1-4 instead of 0-3. south north west east
                return approachDistance;
        }
    }
    return FALSE;
}

// Returns how far south the player is from trainer. 0 if out of trainer's sight.
static u8 GetTrainerApproachDistanceSouth(struct EventObject *trainerObj, s16 range, s16 x, s16 y)
{
    if (trainerObj->currentCoords.x == x
     && y > trainerObj->currentCoords.y
     && y <= trainerObj->currentCoords.y + range)
        return (y - trainerObj->currentCoords.y);
    else
        return 0;
}

// Returns how far north the player is from trainer. 0 if out of trainer's sight.
static u8 GetTrainerApproachDistanceNorth(struct EventObject *trainerObj, s16 range, s16 x, s16 y)
{
    if (trainerObj->currentCoords.x == x
     && y < trainerObj->currentCoords.y
     && y >= trainerObj->currentCoords.y - range)
        return (trainerObj->currentCoords.y - y);
    else
        return 0;
}

// Returns how far west the player is from trainer. 0 if out of trainer's sight.
static u8 GetTrainerApproachDistanceWest(struct EventObject *trainerObj, s16 range, s16 x, s16 y)
{
    if (trainerObj->currentCoords.y == y
     && x < trainerObj->currentCoords.x
     && x >= trainerObj->currentCoords.x - range)
        return (trainerObj->currentCoords.x - x);
    else
        return 0;
}

// Returns how far east the player is from trainer. 0 if out of trainer's sight.
static u8 GetTrainerApproachDistanceEast(struct EventObject *trainerObj, s16 range, s16 x, s16 y)
{
    if (trainerObj->currentCoords.y == y
     && x > trainerObj->currentCoords.x
     && x <= trainerObj->currentCoords.x + range)
        return (x - trainerObj->currentCoords.x);
    else
        return 0;
}

#ifdef BUGFIX_TRAINERAPPROACH
#define COLLISION_MASK ~1
#else
#define COLLISION_MASK 1
#endif

static bool8 CheckPathBetweenTrainerAndPlayer(struct EventObject *trainerObj, u8 approachDistance, u8 direction)
{
    s16 x, y;
    u8 unk19_temp;
    u8 unk19b_temp;
    u8 i;
    u8 collision;

    if (approachDistance == 0)
        return FALSE;

    x = trainerObj->currentCoords.x;
    y = trainerObj->currentCoords.y;

    for (i = 0; i <= approachDistance - 1; i++, MoveCoords(direction, &x, &y))
    {
        collision = GetCollisionFlagsAtCoords(trainerObj, x, y, direction);
        if (collision != 0 && (collision & COLLISION_MASK))
            return FALSE;
    }

    // preserve trainer sight range before clearing.
    unk19_temp = trainerObj->range.as_nybbles.x;
    unk19b_temp = trainerObj->range.as_nybbles.y;
    trainerObj->range.as_nybbles.x = 0;
    trainerObj->range.as_nybbles.y = 0;

    collision = GetCollisionAtCoords((struct EventObject *)trainerObj, x, y, direction);

    trainerObj->range.as_nybbles.x = unk19_temp;
    trainerObj->range.as_nybbles.y = unk19b_temp;
    if (collision == 4)
        return approachDistance;

    return FALSE;
}

#define tTrainerObjHi   data[1]
#define tTrainerObjLo   data[2]

static void sub_80842C8(struct EventObject *trainerObj, u8 b)
{
    u8 taskId = CreateTask(RunTrainerSeeFuncList, 0x50);
    struct Task *task = &gTasks[taskId];

    task->tTrainerObjHi = (u32)(trainerObj) >> 16;
    task->tTrainerObjLo = (u32)(trainerObj);
    task->data[3] = b;
}

static void sub_80842FC(TaskFunc followupFunc)
{
    TaskFunc taskFunc = RunTrainerSeeFuncList;
    u8 taskId = FindTaskIdByFunc(taskFunc);

    SetTaskFuncWithFollowupFunc(taskId, taskFunc, followupFunc);
    gTasks[taskId].data[0] = 1;
    taskFunc(taskId);
}

static bool8 sub_8084394(u8 taskId, struct Task *task, struct EventObject *trainerObj);
static bool8 sub_8084398(u8 taskId, struct Task *task, struct EventObject *trainerObj);
static bool8 sub_80843DC(u8 taskId, struct Task *task, struct EventObject *trainerObj);
static bool8 sub_808441C(u8 taskId, struct Task *task, struct EventObject *trainerObj);
static bool8 sub_8084478(u8 taskId, struct Task *task, struct EventObject *trainerObj);
static bool8 sub_8084534(u8 taskId, struct Task *task, struct EventObject *trainerObj);
static bool8 sub_8084578(u8 taskId, struct Task *task, struct EventObject *trainerObj);
static bool8 sub_80845AC(u8 taskId, struct Task *task, struct EventObject *trainerObj);
static bool8 sub_80845C8(u8 taskId, struct Task *task, struct EventObject *trainerObj);
static bool8 sub_80845FC(u8 taskId, struct Task *task, struct EventObject *trainerObj);
static bool8 sub_8084654(u8 taskId, struct Task *task, struct EventObject *trainerObj);
static bool8 sub_80846C8(u8 taskId, struct Task *task, struct EventObject *trainerObj);

static bool8 (*const gTrainerSeeFuncList[])(u8 taskId, struct Task *task, struct EventObject *trainerObj) =
{
    sub_8084394,
    sub_8084398,
    sub_80843DC,
    sub_808441C,
    sub_8084478,
    sub_8084534,
    sub_8084578,
    sub_80845AC,
    sub_80845C8,
    sub_80845FC,
    sub_8084654,
    sub_80846C8,
};

static void RunTrainerSeeFuncList(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    struct EventObject *trainerObj = (struct EventObject *)((task->tTrainerObjHi << 16) | (task->tTrainerObjLo));

    if (!trainerObj->active)
    {
        SwitchTaskToFollowupFunc(taskId);
    }
    else
    {
        while (gTrainerSeeFuncList[task->data[0]](taskId, task, trainerObj))
            ;
    }
}

static bool8 sub_8084394(u8 taskId, struct Task *task, struct EventObject *trainerObj) // cant be void because it is called with RunTrainerSeeFuncList with arguments.
{
    return FALSE;
}

static bool8 sub_8084398(u8 taskId, struct Task *task, struct EventObject *trainerObj)
{
    u8 direction;

    EventObjectGetLocalIdAndMap(trainerObj, &gFieldEffectArguments[0], &gFieldEffectArguments[1], &gFieldEffectArguments[2]);
    FieldEffectStart(FLDEFF_EXCLAMATION_MARK_ICON);
    direction = GetFaceDirectionMovementAction(trainerObj->facingDirection);
    EventObjectSetHeldMovement(trainerObj, direction);
    task->data[0]++;
    return TRUE;
}

static bool8 sub_80843DC(u8 taskId, struct Task *task, struct EventObject *trainerObj)
{
    if (FieldEffectActiveListContains(FLDEFF_EXCLAMATION_MARK_ICON))
    {
        return FALSE;
    }
    else
    {
        task->data[0]++;
        if (trainerObj->movementType == MOVEMENT_TYPE_TREE_DISGUISE || trainerObj->movementType == MOVEMENT_TYPE_MOUNTAIN_DISGUISE)
            task->data[0] = 6;
        if (trainerObj->movementType == MOVEMENT_TYPE_HIDDEN)
            task->data[0] = 8;
        return TRUE;
    }
}

static bool8 sub_808441C(u8 taskId, struct Task *task, struct EventObject *trainerObj)
{
    if (!(EventObjectIsMovementOverridden(trainerObj)) || EventObjectClearHeldMovementIfFinished(trainerObj))
    {
        if (task->data[3])
        {
            EventObjectSetHeldMovement(trainerObj, GetWalkNormalMovementAction(trainerObj->facingDirection));
            task->data[3]--;
        }
        else
        {
            EventObjectSetHeldMovement(trainerObj, MOVEMENT_ACTION_FACE_PLAYER);
            task->data[0]++;
        }
    }
    return FALSE;
}

static bool8 sub_8084478(u8 taskId, struct Task *task, struct EventObject *trainerObj)
{
    struct EventObject *playerObj;

    if (EventObjectIsMovementOverridden(trainerObj) && !EventObjectClearHeldMovementIfFinished(trainerObj))
        return FALSE;

    SetTrainerMovementType(trainerObj, GetTrainerFacingDirectionMovementType(trainerObj->facingDirection));
    OverrideMovementTypeForEventObject(trainerObj, GetTrainerFacingDirectionMovementType(trainerObj->facingDirection));
    OverrideTemplateCoordsForEventObject(trainerObj);

    playerObj = &gEventObjects[gPlayerAvatar.eventObjectId];
    if (EventObjectIsMovementOverridden(playerObj) && !EventObjectClearHeldMovementIfFinished(playerObj))
        return FALSE;

    sub_80597E8();
    EventObjectSetHeldMovement(&gEventObjects[gPlayerAvatar.eventObjectId], GetFaceDirectionMovementAction(GetOppositeDirection(trainerObj->facingDirection)));
    task->data[0]++;
    return FALSE;
}

static bool8 sub_8084534(u8 taskId, struct Task *task, struct EventObject *trainerObj) // technically only 1 parameter, but needs all 3 for TrainerSeeFuncList call.
{
    struct EventObject *playerObj = &gEventObjects[gPlayerAvatar.eventObjectId];

    if (!EventObjectIsMovementOverridden(playerObj)
     || EventObjectClearHeldMovementIfFinished(playerObj))
        SwitchTaskToFollowupFunc(taskId);
    return FALSE;
}

static bool8 sub_8084578(u8 taskId, struct Task *task, struct EventObject *trainerObj)
{
    if (!EventObjectIsMovementOverridden(trainerObj)
     || EventObjectClearHeldMovementIfFinished(trainerObj))
    {
        EventObjectSetHeldMovement(trainerObj, MOVEMENT_ACTION_REVEAL_TRAINER);
        task->data[0]++;
    }
    return FALSE;
}

static bool8 sub_80845AC(u8 taskId, struct Task *task, struct EventObject *trainerObj)
{
    if (EventObjectClearHeldMovementIfFinished(trainerObj))
        task->data[0] = 3;

    return FALSE;
}

static bool8 sub_80845C8(u8 taskId, struct Task *task, struct EventObject *trainerObj)
{
    if (!EventObjectIsMovementOverridden(trainerObj)
     || EventObjectClearHeldMovementIfFinished(trainerObj))
    {
        EventObjectSetHeldMovement(trainerObj, MOVEMENT_ACTION_FACE_PLAYER);
        task->data[0]++;
    }
    return FALSE;
}

static bool8 sub_80845FC(u8 taskId, struct Task *task, struct EventObject *trainerObj)
{
    if (EventObjectCheckHeldMovementStatus(trainerObj))
    {
        gFieldEffectArguments[0] = trainerObj->currentCoords.x;
        gFieldEffectArguments[1] = trainerObj->currentCoords.y;
        gFieldEffectArguments[2] = gSprites[trainerObj->spriteId].subpriority - 1;
        gFieldEffectArguments[3] = 2;
        task->data[4] = FieldEffectStart(FLDEFF_POP_OUT_OF_ASH);
        task->data[0]++;
    }
    return FALSE;
}

static bool8 sub_8084654(u8 taskId, struct Task *task, struct EventObject *trainerObj)
{
    struct Sprite *sprite;

    if (gSprites[task->data[4]].animCmdIndex == 2)
    {
        trainerObj->fixedPriority = 0;
        trainerObj->triggerGroundEffectsOnMove = 1;

        sprite = &gSprites[trainerObj->spriteId];
        sprite->oam.priority = 2;
        EventObjectClearHeldMovementIfFinished(trainerObj);
        EventObjectSetHeldMovement(trainerObj, GetJumpInPlaceMovementAction(trainerObj->facingDirection));
        task->data[0]++;
    }
    return FALSE;
}

static bool8 sub_80846C8(u8 taskId, struct Task *task, struct EventObject *trainerObj)
{
    if (!FieldEffectActiveListContains(FLDEFF_POP_OUT_OF_ASH))
        task->data[0] = 3;

    return FALSE;
}

static bool8 (*const gTrainerSeeFuncList2[])(u8, struct Task *, struct EventObject *) =
{
    sub_80845C8,
    sub_80845FC,
    sub_8084654,
    sub_80846C8,
};

void sub_80846E4(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    struct EventObject *eventObj;

    // another eventObj loaded into by loadword?
    LoadWordFromTwoHalfwords(&task->data[1], (u32 *)&eventObj);
    if (!task->data[7])
    {
        EventObjectClearHeldMovement(eventObj);
        task->data[7]++;
    }
    gTrainerSeeFuncList2[task->data[0]](taskId, task, eventObj);
    if (task->data[0] == 3 && !FieldEffectActiveListContains(FLDEFF_POP_OUT_OF_ASH))
    {
        SetTrainerMovementType(eventObj, GetTrainerFacingDirectionMovementType(eventObj->facingDirection));
        OverrideMovementTypeForEventObject(eventObj, GetTrainerFacingDirectionMovementType(eventObj->facingDirection));
        DestroyTask(taskId);
    }
    else
    {
        eventObj->heldMovementFinished = 0;
    }
}

void sub_8084794(struct EventObject *var)
{
    StoreWordInTwoHalfwords(&gTasks[CreateTask(sub_80846E4, 0)].data[1], (u32)var);
}

static void Task_DestroyTrainerApproachTask(u8);

void ScrSpecial_EndTrainerApproach(void)
{
    sub_80842FC(Task_DestroyTrainerApproachTask);
}

static void Task_DestroyTrainerApproachTask(u8 taskId)
{
    DestroyTask(taskId);
    EnableBothScriptContexts();
}

static const struct OamData gOamData_839B4D8 = {
    .size = 1, .priority = 1
};

static const struct SpriteFrameImage gSpriteImageTable_839B4E0[] = {
    { gSpriteImage_839B308, sizeof gSpriteImage_839B308 },
    { gSpriteImage_839B388, sizeof gSpriteImage_839B388 }
};

static const struct SpriteFrameImage gSpriteImageTable_839B4F0[] = {
    { gSpriteImage_839B408, sizeof gSpriteImage_839B408 }
};

static const union AnimCmd gSpriteAnim_839B4F8[] = {
    ANIMCMD_FRAME(0, 60),
    ANIMCMD_END
};

static const union AnimCmd gSpriteAnim_839B500[] = {
    ANIMCMD_FRAME(1, 60),
    ANIMCMD_END
};

static const union AnimCmd *const gSpriteAnimTable_839B508[] = {
    gSpriteAnim_839B4F8,
    gSpriteAnim_839B500
};

static const struct SpriteTemplate gSpriteTemplate_839B510 = {
    0xffff, 0xffff, &gOamData_839B4D8, gSpriteAnimTable_839B508, gSpriteImageTable_839B4E0, gDummySpriteAffineAnimTable, objc_exclamation_mark_probably
};
static const struct SpriteTemplate gSpriteTemplate_839B528 = {
    0xffff, 4100, &gOamData_839B4D8, gSpriteAnimTable_839B508, gSpriteImageTable_839B4F0, gDummySpriteAffineAnimTable, objc_exclamation_mark_probably
};

u8 FldEff_ExclamationMarkIcon(void)
{
    u8 spriteId = CreateSpriteAtEnd(&gSpriteTemplate_839B510, 0, 0, 0x53);

    if (spriteId != 64)
        sub_8084894(&gSprites[spriteId], 0, 0);

    return 0;
}

u8 FldEff_QuestionMarkIcon(void)
{
    u8 spriteId = CreateSpriteAtEnd(&gSpriteTemplate_839B510, 0, 0, 0x52);

    if (spriteId != 64)
        sub_8084894(&gSprites[spriteId], 33, 1);

    return 0;
}

u8 FldEff_HeartIcon(void)
{
    u8 spriteId = CreateSpriteAtEnd(&gSpriteTemplate_839B528, 0, 0, 0x52);

    if (spriteId != 64)
        sub_8084894(&gSprites[spriteId], 46, 0);

    return 0;
}

static void sub_8084894(struct Sprite *sprite, u16 a2, u8 a3)
{
    sprite->oam.priority = 1;
    sprite->coordOffsetEnabled = 1;

    sprite->data[0] = gFieldEffectArguments[0];
    sprite->data[1] = gFieldEffectArguments[1];
    sprite->data[2] = gFieldEffectArguments[2];
    sprite->data[3] = -5;
    sprite->data[7] = a2;

    StartSpriteAnim(sprite, a3);
}

static void objc_exclamation_mark_probably(struct Sprite *sprite)
{
    u8 eventObjId;

    if (TryGetEventObjectIdByLocalIdAndMap(sprite->data[0], sprite->data[1], sprite->data[2], &eventObjId)
     || sprite->animEnded)
    {
        FieldEffectStop(sprite, (u8)sprite->data[7]);
    }
    else
    {
        struct Sprite *eventObjSprite = &gSprites[gEventObjects[eventObjId].spriteId];
        sprite->data[4] += sprite->data[3];
        sprite->pos1.x = eventObjSprite->pos1.x;
        sprite->pos1.y = eventObjSprite->pos1.y - 16;
        sprite->pos2.x = eventObjSprite->pos2.x;
        sprite->pos2.y = eventObjSprite->pos2.y + sprite->data[4];
        if (sprite->data[4])
            sprite->data[3]++;
        else
            sprite->data[3] = 0;
    }
}
