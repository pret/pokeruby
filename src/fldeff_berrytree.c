#include "global.h"
#include "event_object_movement.h"
#include "field_player_avatar.h"
#include "script.h"

static void Task_WateringBerryTreeAnim_0(u8);
static void Task_WateringBerryTreeAnim_1(u8);
static void Task_WateringBerryTreeAnim_2(u8);
static void Task_WateringBerryTreeAnim_3(u8);

static void Task_WateringBerryTreeAnim_0(u8 taskId)
{
    gTasks[taskId].func = Task_WateringBerryTreeAnim_1;
}

static void Task_WateringBerryTreeAnim_1(u8 taskId)
{
    struct EventObject *playerEventObj = &gEventObjects[gPlayerAvatar.eventObjectId];
    if (!EventObjectIsMovementOverridden(playerEventObj)
        || EventObjectClearHeldMovementIfFinished(playerEventObj))
    {
        sub_8059D08(GetPlayerFacingDirection());
        EventObjectSetHeldMovement(playerEventObj, GetWalkInPlaceNormalMovementAction(GetPlayerFacingDirection()));
        gTasks[taskId].func = Task_WateringBerryTreeAnim_2;
    }
}

static void Task_WateringBerryTreeAnim_2(u8 taskId)
{
    struct EventObject *playerEventObj = &gEventObjects[gPlayerAvatar.eventObjectId];
    if (EventObjectClearHeldMovementIfFinished(playerEventObj))
    {
        s16 value = gTasks[taskId].data[1]++;
        
        if (value < 10)
        {
            EventObjectSetHeldMovement(playerEventObj, GetWalkInPlaceNormalMovementAction(GetPlayerFacingDirection()));
        }
        else
        {
            gTasks[taskId].func = Task_WateringBerryTreeAnim_3;
        }
    }
}

static void Task_WateringBerryTreeAnim_3(u8 taskId)
{
    SetPlayerAvatarTransitionFlags(sub_80597D0());
    DestroyTask(taskId);
    EnableBothScriptContexts();
}

void DoWateringBerryTreeAnim(void)
{
    CreateTask(Task_WateringBerryTreeAnim_0, 80);
}
