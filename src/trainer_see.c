#include "global.h"
#include "trainer_see.h"
#include "asm.h"
#include "asm_fieldmap.h"
#include "battle_setup.h"
#include "field_effect.h"
#include "field_map_obj.h"
#include "field_player_avatar.h"
#include "script.h"
#include "sprite.h"
#include "task.h"

extern bool8 (*gIsTrainerInRange[])(struct MapObject *, u16, s16, s16);
extern bool8 (*gTrainerSeeFuncList[])(u8, struct Task *, struct MapObject *);
extern bool8 (*gTrainerSeeFuncList2[])(u8, struct Task *, struct MapObject *);

extern u32 gUnknown_0202FF84[];

extern struct SpriteTemplate gSpriteTemplate_839B510;
extern struct SpriteTemplate gSpriteTemplate_839B528;

bool8 CheckTrainers(void)
{
    u8 i;

    for (i = 0; i < 16; i++)
    {
        if ( gMapObjects[i].active )
            if ( gMapObjects[i].trainerType == 1 ||  gMapObjects[i].trainerType == 3 )
                if ( CheckTrainer(i) )
                    return TRUE;
    }
    return FALSE;
}

bool8 CheckTrainer(u8 trainer)
{
   u8 *scriptPtr = GetFieldObjectScriptPointerByFieldObjectId(trainer);

   if (GetTrainerFlagFromScriptPointer(scriptPtr))
       return FALSE;
   else
   {
       struct MapObject *trainerObj = &gMapObjects[trainer];
       u8 canApproach = TrainerCanApproachPlayer(trainerObj);

       if (canApproach != 0)
        {
           TrainerWantsBattle(trainer, scriptPtr);
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
    u8 playerCoord;

    PlayerGetDestCoords(&x, &y);
    if ( trainerObj->trainerType == 1 ) // trainers that don't spin
    {
        playerCoord = gIsTrainerInRange[trainerObj->mapobj_unk_18 - 1](trainerObj, trainerObj->trainerRange_berryTreeId, x, y);
        return CheckPathBetweenTrainerAndPlayer((struct MapObject2 *)trainerObj, playerCoord, trainerObj->mapobj_unk_18);
    }
    else // spinners
    {
        for (i = 0; i < 4; i++)
        {
            playerCoord = gIsTrainerInRange[i](trainerObj, trainerObj->trainerRange_berryTreeId, x, y);
            if ( CheckPathBetweenTrainerAndPlayer((struct MapObject2 *)trainerObj, playerCoord, i + 1) ) // directions are 1-4 instead of 0-3. south north west east
                return playerCoord;
        }
        return FALSE;
    }
}

bool8 IsTrainerInRangeSouth(struct MapObject *trainerObj, s16 vision, s16 x, s16 y)
{
    if ( trainerObj->coords2.x == x
        && y > trainerObj->coords2.y
        && y <= trainerObj->coords2.y + vision )
        return (y - trainerObj->coords2.y);
    else
        return FALSE;
}

bool8 IsTrainerInRangeNorth(struct MapObject *trainerObj, s16 vision, s16 x, s16 y)
{
    if ( trainerObj->coords2.x == x
        && y < trainerObj->coords2.y
        && y >= trainerObj->coords2.y - vision )
        return (trainerObj->coords2.y - y);
    else
        return FALSE;
}

bool8 IsTrainerInRangeWest(struct MapObject *trainerObj, s16 vision, s16 x, s16 y)
{
    if ( trainerObj->coords2.y == y
        && x < trainerObj->coords2.x
        && x >= trainerObj->coords2.x - vision )
        return (trainerObj->coords2.x - x);
    else
        return FALSE;
}

bool8 IsTrainerInRangeEast(struct MapObject *trainerObj, s16 vision, s16 x, s16 y)
{
    if ( trainerObj->coords2.y == y
        && x > trainerObj->coords2.x
        && x <= trainerObj->coords2.x + vision )
        return (x - trainerObj->coords2.x);
    else
        return FALSE;
}

#ifdef BUGFIX_TRAINERAPPROACH
#define COLLISION_MASK ~1
#else
#define COLLISION_MASK 1
#endif

bool8 CheckPathBetweenTrainerAndPlayer(struct MapObject2 *trainerObj, u8 playerCoord, u8 direction)
{
    s16 x, y;
    u8 unk19_temp;
    u8 unk19b_temp;
    u8 i;
    u8 var;

    if (!playerCoord)
        return FALSE;

    x = trainerObj->coords2.x;
    y = trainerObj->coords2.y;

    for (i = 0; i <= playerCoord - 1; i++, MoveCoords(direction, &x, &y))
    {
        var = sub_8060024((struct MapObject *)trainerObj, x, y, direction);

        if (var && (var & COLLISION_MASK))
            return FALSE;
    }

    // preserve mapobj_unk_19 before clearing.
    unk19_temp = trainerObj->mapobj_unk_19;
    unk19b_temp = trainerObj->mapobj_unk_19b;
    trainerObj->mapobj_unk_19 = 0;
    trainerObj->mapobj_unk_19b = 0;

    var = npc_block_way((struct MapObject *)trainerObj, x, y, direction);

    trainerObj->mapobj_unk_19 = unk19_temp;
    trainerObj->mapobj_unk_19b = unk19b_temp;
    if (var == 4)
        return playerCoord;

    return FALSE;
}

void sub_80842C8(struct MapObject *trainerObj, u8 taskId)
{
    struct Task *task = &gTasks[CreateTask(RunTrainerSeeFuncList, 0x50)];

    task->data[1] = (u32)(trainerObj) >> 16;
    task->data[2] = (u32)(trainerObj);
    task->data[3] = taskId;
}

void sub_80842FC(TaskFunc func)
{
    TaskFunc func2 = RunTrainerSeeFuncList;
    u8 taskId = FindTaskIdByFunc(func2);

    SetTaskFuncWithFollowupFunc(taskId, RunTrainerSeeFuncList, func);
    gTasks[taskId].data[0] = 1;
    func2(taskId);
}

void RunTrainerSeeFuncList(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    struct MapObject *trainerObj = (struct MapObject *)((task->data[1] << 16) | (task->data[2]));

    if (!trainerObj->active)
        SwitchTaskToFollowupFunc(taskId);
    else
        while (gTrainerSeeFuncList[task->data[0]](taskId, task, trainerObj));
}

u8 sub_8084394() // cant be void because it is called with RunTrainerSeeFuncList with arguments.
{
    return 0;
}

s8 sub_8084398(u8 taskId, struct Task *task, struct MapObject *trainerObj)
{
    u8 direction;

    FieldObjectGetLocalIdAndMap(trainerObj, (u8 *)&gUnknown_0202FF84[0], (u8 *)&gUnknown_0202FF84[1], (u8 *)&gUnknown_0202FF84[2]);
    FieldEffectStart(0);

    direction = GetFaceDirectionAnimId(trainerObj->mapobj_unk_18);

    FieldObjectSetSpecialAnim(trainerObj, direction);
    task->data[0]++;
    return 1;
}

s8 sub_80843DC(u8 taskId, struct Task *task, struct MapObject *trainerObj)
{
    if (FieldEffectActiveListContains(0))
        return 0;
    else
    {
        task->data[0]++;
        if ((u8)(trainerObj->animPattern - 57) <= 1)
            task->data[0] = 6;
        if (trainerObj->animPattern == 63)
            task->data[0] = 8;
        return 1;
    }
}

s8 sub_808441C(u8 taskId, struct Task *task, struct MapObject *trainerObj)
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
    return 0;
}

s8 sub_8084478(u8 taskId, struct Task *task, struct MapObject *trainerObj)
{
    struct MapObject *playerObj;

    if (FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(trainerObj) && !FieldObjectClearAnimIfSpecialAnimFinished(trainerObj))
        return 0;

    npc_set_running_behaviour_etc(trainerObj, npc_running_behaviour_by_direction(trainerObj->mapobj_unk_18));
    sub_805C774(trainerObj, npc_running_behaviour_by_direction(trainerObj->mapobj_unk_18));
    sub_805C754(trainerObj);

    playerObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    if (FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(playerObj)
     && !FieldObjectClearAnimIfSpecialAnimFinished(playerObj))
        return 0;

    sub_80597E8();
    FieldObjectSetSpecialAnim(&gMapObjects[gPlayerAvatar.mapObjectId], GetFaceDirectionAnimId(GetOppositeDirection(trainerObj->mapobj_unk_18)));
    task->data[0]++;
    return 0;
}

s8 sub_8084534(u8 taskId, struct Task *task, struct MapObject *trainerObj) // technically only 1 parameter, but needs all 3 for TrainerSeeFuncList call.
{
    struct MapObject *playerObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    if ( !FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(playerObj)
        || FieldObjectClearAnimIfSpecialAnimFinished(playerObj) )
    SwitchTaskToFollowupFunc(taskId);

    return 0;
}

s8 sub_8084578(u8 taskId, struct Task *task, struct MapObject *trainerObj)
{
    if (!FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(trainerObj)
        || FieldObjectClearAnimIfSpecialAnimFinished(trainerObj))
    {
        FieldObjectSetSpecialAnim(trainerObj, 0x59);
        task->data[0]++;
    }
    return 0;
}

s8 sub_80845AC(u8 taskId, struct Task *task, struct MapObject *trainerObj)
{
    if ( FieldObjectClearAnimIfSpecialAnimFinished(trainerObj) )
        task->data[0] = 3;

    return 0;
}

s8 sub_80845C8(u8 taskId, struct Task *task, struct MapObject *trainerObj)
{
    if (!FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(trainerObj)
        || FieldObjectClearAnimIfSpecialAnimFinished(trainerObj))
    {
        FieldObjectSetSpecialAnim(trainerObj, 0x3E);
        task->data[0]++;
    }
    return 0;
}

s8 sub_80845FC(u8 taskId, struct Task *task, struct MapObject *trainerObj)
{
    if (FieldObjectCheckIfSpecialAnimFinishedOrInactive(trainerObj))
    {
        gUnknown_0202FF84[0] = trainerObj->coords2.x;
        gUnknown_0202FF84[1] = trainerObj->coords2.y;
        gUnknown_0202FF84[2] = gSprites[trainerObj->spriteId].subpriority - 1;
        gUnknown_0202FF84[3] = 2;
        task->data[4] = FieldEffectStart(49);
        task->data[0]++;
    }
    return 0;
}

s8 sub_8084654(u8 taskId, struct Task *task, struct MapObject *trainerObj)
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
    return 0;
}

s8 sub_80846C8(u8 taskId, struct Task *task, struct MapObject *trainerObj)
{
    if (!FieldEffectActiveListContains(49))
        task->data[0] = 3;

    return 0;
}

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

void sub_80847C8(void)
{
    sub_80842FC(sub_80847D8);
}

void sub_80847D8(u8 taskId)
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

    sprite->data0 = gUnknown_0202FF84[0];
    sprite->data1 = gUnknown_0202FF84[1];
    sprite->data2 = gUnknown_0202FF84[2];
    sprite->data3 = -5;
    sprite->data7 = a2;

    StartSpriteAnim(sprite, a3);
}

void objc_exclamation_mark_probably(struct Sprite *sprite)
{
    u8 mapObjId;

    if (TryGetFieldObjectIdByLocalIdAndMap(sprite->data0, sprite->data1, sprite->data2, &mapObjId)
     || sprite->animEnded)
    {
        FieldEffectStop(sprite, (u8)sprite->data7);
    }
    else
    {
        struct Sprite *mapObjSprite = &gSprites[gMapObjects[mapObjId].spriteId];
        sprite->data4 += sprite->data3;
        sprite->pos1.x = mapObjSprite->pos1.x;
        sprite->pos1.y = mapObjSprite->pos1.y - 16;
        sprite->pos2.x = mapObjSprite->pos2.x;
        sprite->pos2.y = mapObjSprite->pos2.y + sprite->data4;
        if (sprite->data4)
            sprite->data3++;
        else
            sprite->data3 = 0;
    }
}
