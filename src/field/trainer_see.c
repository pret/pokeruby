#include "global.h"
#include "trainer_see.h"
#include "battle_setup.h"
#include "field_effect.h"
#include "field_map_obj.h"
#include "field_player_avatar.h"
#include "script.h"
#include "sprite.h"
#include "task.h"
#include "util.h"

const u8 gSpriteImage_839B308[] = INCBIN_U8("graphics/unknown_sprites/839B4E0/0.4bpp");
const u8 gSpriteImage_839B388[] = INCBIN_U8("graphics/unknown_sprites/839B4E0/1.4bpp");
const u8 gSpriteImage_839B408[] = INCBIN_U8("graphics/unknown_sprites/839B408.4bpp");

u8 GetTrainerApproachDistanceSouth(struct MapObject *trainerObj, s16 range, s16 x, s16 y);
u8 GetTrainerApproachDistanceNorth(struct MapObject *trainerObj, s16 range, s16 x, s16 y);
u8 GetTrainerApproachDistanceWest(struct MapObject *trainerObj, s16 range, s16 x, s16 y);
u8 GetTrainerApproachDistanceEast(struct MapObject *trainerObj, s16 range, s16 x, s16 y);

static u8 (*const sDirectionalApproachDistanceFuncs[])(struct MapObject *, s16, s16, s16) =
{
    GetTrainerApproachDistanceSouth,
    GetTrainerApproachDistanceNorth,
    GetTrainerApproachDistanceWest,
    GetTrainerApproachDistanceEast,
};

extern struct SpriteTemplate gSpriteTemplate_839B510;
extern struct SpriteTemplate gSpriteTemplate_839B528;

bool8 CheckTrainers(void)
{
    u8 mapObjId;

    for (mapObjId = 0; mapObjId < 16; mapObjId++)
    {
        if (gMapObjects[mapObjId].active
         && (gMapObjects[mapObjId].trainerType == 1 ||  gMapObjects[mapObjId].trainerType == 3)
         && CheckTrainer(mapObjId))
            return TRUE;
    }
    return FALSE;
}

bool8 CheckTrainer(u8 mapObjId)
{
    u8 *scriptPtr = GetFieldObjectScriptPointerByFieldObjectId(mapObjId);

    if (GetTrainerFlagFromScriptPointer(scriptPtr))
    {
        return FALSE;
    }
    else
    {
        struct MapObject *trainerObj = &gMapObjects[mapObjId];
        bool8 canApproach = TrainerCanApproachPlayer(trainerObj);

        if (canApproach)
        {
            TrainerWantsBattle(mapObjId, scriptPtr);
            sub_80842C8(trainerObj, (canApproach - 1));
            return TRUE;
        }
        else
        {
            return FALSE;
        }
    }
}

bool8 TrainerCanApproachPlayer(struct MapObject *trainerObj)
{
    s16 x, y;
    u8 i;
    u8 approachDistance;

    PlayerGetDestCoords(&x, &y);
    if (trainerObj->trainerType == 1)  // can only see in one direction
    {
        approachDistance = sDirectionalApproachDistanceFuncs[trainerObj->mapobj_unk_18 - 1](trainerObj, trainerObj->trainerRange_berryTreeId, x, y);
        return CheckPathBetweenTrainerAndPlayer((struct MapObject2 *)trainerObj, approachDistance, trainerObj->mapobj_unk_18);
    }
    else  // can see in all directions
    {
        for (i = 0; i < 4; i++)
        {
            approachDistance = sDirectionalApproachDistanceFuncs[i](trainerObj, trainerObj->trainerRange_berryTreeId, x, y);
            if (CheckPathBetweenTrainerAndPlayer((struct MapObject2 *)trainerObj, approachDistance, i + 1)) // directions are 1-4 instead of 0-3. south north west east
                return approachDistance;
        }
    }
    return FALSE;
}

// Returns how far south the player is from trainer. 0 if out of trainer's sight.
u8 GetTrainerApproachDistanceSouth(struct MapObject *trainerObj, s16 range, s16 x, s16 y)
{
    if (trainerObj->coords2.x == x
     && y > trainerObj->coords2.y
     && y <= trainerObj->coords2.y + range)
        return (y - trainerObj->coords2.y);
    else
        return 0;
}

// Returns how far north the player is from trainer. 0 if out of trainer's sight.
u8 GetTrainerApproachDistanceNorth(struct MapObject *trainerObj, s16 range, s16 x, s16 y)
{
    if (trainerObj->coords2.x == x
     && y < trainerObj->coords2.y
     && y >= trainerObj->coords2.y - range)
        return (trainerObj->coords2.y - y);
    else
        return 0;
}

// Returns how far west the player is from trainer. 0 if out of trainer's sight.
u8 GetTrainerApproachDistanceWest(struct MapObject *trainerObj, s16 range, s16 x, s16 y)
{
    if (trainerObj->coords2.y == y
     && x < trainerObj->coords2.x
     && x >= trainerObj->coords2.x - range)
        return (trainerObj->coords2.x - x);
    else
        return 0;
}

// Returns how far east the player is from trainer. 0 if out of trainer's sight.
u8 GetTrainerApproachDistanceEast(struct MapObject *trainerObj, s16 range, s16 x, s16 y)
{
    if (trainerObj->coords2.y == y
     && x > trainerObj->coords2.x
     && x <= trainerObj->coords2.x + range)
        return (x - trainerObj->coords2.x);
    else
        return 0;
}

#ifdef BUGFIX_TRAINERAPPROACH
#define COLLISION_MASK ~1
#else
#define COLLISION_MASK 1
#endif

bool8 CheckPathBetweenTrainerAndPlayer(struct MapObject2 *trainerObj, u8 approachDistance, u8 direction)
{
    s16 x, y;
    u8 unk19_temp;
    u8 unk19b_temp;
    u8 i;
    u8 collision;

    if (approachDistance == 0)
        return FALSE;

    x = trainerObj->coords2.x;
    y = trainerObj->coords2.y;

    for (i = 0; i <= approachDistance - 1; i++, MoveCoords(direction, &x, &y))
    {
        collision = sub_8060024((struct MapObject *)trainerObj, x, y, direction);
        if (collision != 0 && (collision & COLLISION_MASK))
            return FALSE;
    }

    // preserve mapobj_unk_19 before clearing.
    unk19_temp = trainerObj->mapobj_unk_19;
    unk19b_temp = trainerObj->mapobj_unk_19b;
    trainerObj->mapobj_unk_19 = 0;
    trainerObj->mapobj_unk_19b = 0;

    collision = npc_block_way((struct MapObject *)trainerObj, x, y, direction);

    trainerObj->mapobj_unk_19 = unk19_temp;
    trainerObj->mapobj_unk_19b = unk19b_temp;
    if (collision == 4)
        return approachDistance;

    return FALSE;
}

#define tTrainerObjHi   data[1]
#define tTrainerObjLo   data[2]

void sub_80842C8(struct MapObject *trainerObj, u8 b)
{
    u8 taskId = CreateTask(RunTrainerSeeFuncList, 0x50);
    struct Task *task = &gTasks[taskId];

    task->tTrainerObjHi = (u32)(trainerObj) >> 16;
    task->tTrainerObjLo = (u32)(trainerObj);
    task->data[3] = b;
}

void sub_80842FC(TaskFunc followupFunc)
{
    TaskFunc taskFunc = RunTrainerSeeFuncList;
    u8 taskId = FindTaskIdByFunc(taskFunc);

    SetTaskFuncWithFollowupFunc(taskId, taskFunc, followupFunc);
    gTasks[taskId].data[0] = 1;
    taskFunc(taskId);
}

static bool8 sub_8084394(u8 taskId, struct Task *task, struct MapObject *trainerObj);
static bool8 sub_8084398(u8 taskId, struct Task *task, struct MapObject *trainerObj);
static bool8 sub_80843DC(u8 taskId, struct Task *task, struct MapObject *trainerObj);
static bool8 sub_808441C(u8 taskId, struct Task *task, struct MapObject *trainerObj);
static bool8 sub_8084478(u8 taskId, struct Task *task, struct MapObject *trainerObj);
static bool8 sub_8084534(u8 taskId, struct Task *task, struct MapObject *trainerObj);
static bool8 sub_8084578(u8 taskId, struct Task *task, struct MapObject *trainerObj);
static bool8 sub_80845AC(u8 taskId, struct Task *task, struct MapObject *trainerObj);
static bool8 sub_80845C8(u8 taskId, struct Task *task, struct MapObject *trainerObj);
static bool8 sub_80845FC(u8 taskId, struct Task *task, struct MapObject *trainerObj);
static bool8 sub_8084654(u8 taskId, struct Task *task, struct MapObject *trainerObj);
static bool8 sub_80846C8(u8 taskId, struct Task *task, struct MapObject *trainerObj);

static bool8 (*const gTrainerSeeFuncList[])(u8 taskId, struct Task *task, struct MapObject *trainerObj) =
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

void RunTrainerSeeFuncList(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    struct MapObject *trainerObj = (struct MapObject *)((task->tTrainerObjHi << 16) | (task->tTrainerObjLo));

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

static bool8 sub_8084394(u8 taskId, struct Task *task, struct MapObject *trainerObj) // cant be void because it is called with RunTrainerSeeFuncList with arguments.
{
    return FALSE;
}

static bool8 sub_8084398(u8 taskId, struct Task *task, struct MapObject *trainerObj)
{
    u8 direction;

    FieldObjectGetLocalIdAndMap(trainerObj, &gFieldEffectArguments[0], &gFieldEffectArguments[1], &gFieldEffectArguments[2]);
    FieldEffectStart(FLDEFF_EXCLAMATION_MARK_ICON_1);
    direction = GetFaceDirectionAnimId(trainerObj->mapobj_unk_18);
    FieldObjectSetSpecialAnim(trainerObj, direction);
    task->data[0]++;
    return TRUE;
}

static bool8 sub_80843DC(u8 taskId, struct Task *task, struct MapObject *trainerObj)
{
    if (FieldEffectActiveListContains(0))
    {
        return FALSE;
    }
    else
    {
        task->data[0]++;
        if (trainerObj->animPattern == 57 || trainerObj->animPattern == 58)
            task->data[0] = 6;
        if (trainerObj->animPattern == 63)
            task->data[0] = 8;
        return TRUE;
    }
}

static bool8 sub_808441C(u8 taskId, struct Task *task, struct MapObject *trainerObj)
{
    if (!(FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(trainerObj)) || FieldObjectClearAnimIfSpecialAnimFinished(trainerObj))
    {
        if (task->data[3])
        {
            FieldObjectSetSpecialAnim(trainerObj, GetGoSpeed0AnimId(trainerObj->mapobj_unk_18));
            task->data[3]--;
        }
        else
        {
            FieldObjectSetSpecialAnim(trainerObj, 0x3E);
            task->data[0]++;
        }
    }
    return FALSE;
}

static bool8 sub_8084478(u8 taskId, struct Task *task, struct MapObject *trainerObj)
{
    struct MapObject *playerObj;

    if (FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(trainerObj) && !FieldObjectClearAnimIfSpecialAnimFinished(trainerObj))
        return FALSE;

    npc_set_running_behaviour_etc(trainerObj, npc_running_behaviour_by_direction(trainerObj->mapobj_unk_18));
    sub_805C774(trainerObj, npc_running_behaviour_by_direction(trainerObj->mapobj_unk_18));
    sub_805C754(trainerObj);

    playerObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    if (FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(playerObj) && !FieldObjectClearAnimIfSpecialAnimFinished(playerObj))
        return FALSE;

    sub_80597E8();
    FieldObjectSetSpecialAnim(&gMapObjects[gPlayerAvatar.mapObjectId], GetFaceDirectionAnimId(GetOppositeDirection(trainerObj->mapobj_unk_18)));
    task->data[0]++;
    return FALSE;
}

static bool8 sub_8084534(u8 taskId, struct Task *task, struct MapObject *trainerObj) // technically only 1 parameter, but needs all 3 for TrainerSeeFuncList call.
{
    struct MapObject *playerObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    if (!FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(playerObj)
     || FieldObjectClearAnimIfSpecialAnimFinished(playerObj))
        SwitchTaskToFollowupFunc(taskId);
    return FALSE;
}

static bool8 sub_8084578(u8 taskId, struct Task *task, struct MapObject *trainerObj)
{
    if (!FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(trainerObj)
     || FieldObjectClearAnimIfSpecialAnimFinished(trainerObj))
    {
        FieldObjectSetSpecialAnim(trainerObj, 0x59);
        task->data[0]++;
    }
    return FALSE;
}

static bool8 sub_80845AC(u8 taskId, struct Task *task, struct MapObject *trainerObj)
{
    if (FieldObjectClearAnimIfSpecialAnimFinished(trainerObj))
        task->data[0] = 3;

    return FALSE;
}

static bool8 sub_80845C8(u8 taskId, struct Task *task, struct MapObject *trainerObj)
{
    if (!FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(trainerObj)
     || FieldObjectClearAnimIfSpecialAnimFinished(trainerObj))
    {
        FieldObjectSetSpecialAnim(trainerObj, 0x3E);
        task->data[0]++;
    }
    return FALSE;
}

static bool8 sub_80845FC(u8 taskId, struct Task *task, struct MapObject *trainerObj)
{
    if (FieldObjectCheckIfSpecialAnimFinishedOrInactive(trainerObj))
    {
        gFieldEffectArguments[0] = trainerObj->coords2.x;
        gFieldEffectArguments[1] = trainerObj->coords2.y;
        gFieldEffectArguments[2] = gSprites[trainerObj->spriteId].subpriority - 1;
        gFieldEffectArguments[3] = 2;
        task->data[4] = FieldEffectStart(FLDEFF_POP_OUT_OF_ASH);
        task->data[0]++;
    }
    return FALSE;
}

static bool8 sub_8084654(u8 taskId, struct Task *task, struct MapObject *trainerObj)
{
    struct Sprite *sprite;

    if (gSprites[task->data[4]].animCmdIndex == 2)
    {
        trainerObj->mapobj_bit_26 = 0;
        trainerObj->mapobj_bit_2 = 1;

        sprite = &gSprites[trainerObj->spriteId];
        sprite->oam.priority = 2;
        FieldObjectClearAnimIfSpecialAnimFinished(trainerObj);
        FieldObjectSetSpecialAnim(trainerObj, sub_806084C(trainerObj->mapobj_unk_18));
        task->data[0]++;
    }
    return FALSE;
}

static bool8 sub_80846C8(u8 taskId, struct Task *task, struct MapObject *trainerObj)
{
    if (!FieldEffectActiveListContains(49))
        task->data[0] = 3;

    return FALSE;
}

static bool8 (*const gTrainerSeeFuncList2[])(u8, struct Task *, struct MapObject *) =
{
    sub_80845C8,
    sub_80845FC,
    sub_8084654,
    sub_80846C8,
};

void sub_80846E4(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    struct MapObject *mapObj;

    // another mapObj loaded into by loadword?
    LoadWordFromTwoHalfwords(&task->data[1], (u32 *)&mapObj);
    if (!task->data[7])
    {
        FieldObjectClearAnim(mapObj);
        task->data[7]++;
    }
    gTrainerSeeFuncList2[task->data[0]](taskId, task, mapObj);
    if (task->data[0] == 3 && !FieldEffectActiveListContains(49))
    {
        npc_set_running_behaviour_etc(mapObj, npc_running_behaviour_by_direction(mapObj->mapobj_unk_18));
        sub_805C774(mapObj, npc_running_behaviour_by_direction(mapObj->mapobj_unk_18));
        DestroyTask(taskId);
    }
    else
        mapObj->mapobj_bit_7 = 0;
}

void sub_8084794(struct MapObject *var)
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

u8 FldEff_ExclamationMarkIcon1(void)
{
    u8 spriteId = CreateSpriteAtEnd(&gSpriteTemplate_839B510, 0, 0, 0x53);

    if (spriteId != 64)
        sub_8084894(&gSprites[spriteId], 0, 0);

    return 0;
}

u8 FldEff_ExclamationMarkIcon2(void)
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

void sub_8084894(struct Sprite *sprite, u16 a2, u8 a3)
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

void objc_exclamation_mark_probably(struct Sprite *sprite)
{
    u8 mapObjId;

    if (TryGetFieldObjectIdByLocalIdAndMap(sprite->data[0], sprite->data[1], sprite->data[2], &mapObjId)
     || sprite->animEnded)
    {
        FieldEffectStop(sprite, (u8)sprite->data[7]);
    }
    else
    {
        struct Sprite *mapObjSprite = &gSprites[gMapObjects[mapObjId].spriteId];
        sprite->data[4] += sprite->data[3];
        sprite->pos1.x = mapObjSprite->pos1.x;
        sprite->pos1.y = mapObjSprite->pos1.y - 16;
        sprite->pos2.x = mapObjSprite->pos2.x;
        sprite->pos2.y = mapObjSprite->pos2.y + sprite->data[4];
        if (sprite->data[4])
            sprite->data[3]++;
        else
            sprite->data[3] = 0;
    }
}
