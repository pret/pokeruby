#include "global.h"
#include "braille_puzzles.h"
#include "event_object_movement.h"
#include "field_effect.h"
#include "field_player_avatar.h"
#include "item_use.h"
#include "overworld.h"
#include "pokemon_menu.h"
#include "rom6.h"
#include "script.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "constants/event_object_movement_constants.h"
#include "constants/event_objects.h"
#include "constants/field_effects.h"
#include "constants/map_types.h"
#include "constants/songs.h"

extern u16 gSpecialVar_LastTalked;
extern void (*gFieldCallback)(void);
extern u8 gLastFieldPokeMenuOpened;
extern void (*gPostMenuFieldCallback)(void);
extern u8 S_UseRockSmash[];

EWRAM_DATA struct MapPosition gPlayerFacingPosition = {0};

static void task08_080C9820(u8);
static void sub_810B3DC(u8);
static void sub_810B428(u8);
static void sub_810B4CC(u8);
static void sub_810B53C(void);
static void sub_810B58C(void);
static void sub_810B5D8(void);
static void sub_810B634(void);

bool8 CheckObjectGraphicsInFrontOfPlayer(u8 graphicsId)
{
    u8 objEventId;

    GetXYCoordsOneStepInFrontOfPlayer(&gPlayerFacingPosition.x, &gPlayerFacingPosition.y);
    gPlayerFacingPosition.height = PlayerGetZCoord();
    objEventId = GetObjectEventIdByXYZ(gPlayerFacingPosition.x, gPlayerFacingPosition.y, gPlayerFacingPosition.height);
    if (gObjectEvents[objEventId].graphicsId != graphicsId)
    {
        return FALSE;
    }
    else
    {
        gSpecialVar_LastTalked = gObjectEvents[objEventId].localId;
        return TRUE;
    }
}

u8 oei_task_add(void)
{
    GetXYCoordsOneStepInFrontOfPlayer(&gPlayerFacingPosition.x, &gPlayerFacingPosition.y);
    return CreateTask(task08_080C9820, 8);
}

static void task08_080C9820(u8 taskId)
{
    u8 objEventId;

    ScriptContext2_Enable();
    gPlayerAvatar.preventStep = TRUE;
    objEventId = gPlayerAvatar.objectEventId;
    if (!ObjectEventIsMovementOverridden(&gObjectEvents[objEventId])
     || ObjectEventClearHeldMovementIfFinished(&gObjectEvents[objEventId]))
    {
        if (gMapHeader.mapType == MAP_TYPE_UNDERWATER)
        {
            FieldEffectStart(FLDEFF_FIELD_MOVE_SHOW_MON_INIT);
            gTasks[taskId].func = sub_810B428;
        }
        else
        {
            sub_8059BF4();
            ObjectEventSetHeldMovement(&gObjectEvents[objEventId], MOVEMENT_ACTION_START_ANIM_IN_DIRECTION);
            gTasks[taskId].func = sub_810B3DC;
        }
    }
}

static void sub_810B3DC(u8 taskId)
{
    if (ObjectEventCheckHeldMovementStatus(&gObjectEvents[gPlayerAvatar.objectEventId]) == TRUE)
    {
        FieldEffectStart(FLDEFF_FIELD_MOVE_SHOW_MON_INIT);
        gTasks[taskId].func = sub_810B428;
    }
}

static void sub_810B428(u8 taskId)
{
    if (!FieldEffectActiveListContains(FLDEFF_FIELD_MOVE_SHOW_MON))
    {
        gFieldEffectArguments[1] = GetPlayerFacingDirection();
        if (gFieldEffectArguments[1] == 1)
            gFieldEffectArguments[2] = 0;
        if (gFieldEffectArguments[1] == 2)
            gFieldEffectArguments[2] = 1;
        if (gFieldEffectArguments[1] == 3)
            gFieldEffectArguments[2] = 2;
        if (gFieldEffectArguments[1] == 4)
            gFieldEffectArguments[2] = 3;
        ObjectEventSetGraphicsId(&gObjectEvents[gPlayerAvatar.objectEventId], GetPlayerAvatarGraphicsIdByCurrentState());
        StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], gFieldEffectArguments[2]);
        FieldEffectActiveListRemove(6);
        gTasks[taskId].func = sub_810B4CC;
    }
}

static void sub_810B4CC(u8 taskId)
{
    void (*func)(void) = (void (*)(void))(((u16)gTasks[taskId].data[8] << 16) | (u16)gTasks[taskId].data[9]);

    func();
    gPlayerAvatar.preventStep = FALSE;
    DestroyTask(taskId);
}

#if DEBUG
void debug_sub_8120968(void)
{
    if (CheckObjectGraphicsInFrontOfPlayer(OBJ_EVENT_GFX_BREAKABLE_ROCK) == TRUE)
    {
        gLastFieldPokeMenuOpened = 0;
        sub_810B53C();
    }
    else
    {
        ScriptContext2_Disable();
    }
}
#endif

bool8 SetUpFieldMove_RockSmash(void)
{
    if (CheckObjectGraphicsInFrontOfPlayer(OBJ_EVENT_GFX_BREAKABLE_ROCK) == TRUE)
    {
        gFieldCallback = FieldCallback_PrepareFadeInFromMenu;
        gPostMenuFieldCallback = sub_810B53C;
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

static void sub_810B53C(void)
{
    gFieldEffectArguments[0] = gLastFieldPokeMenuOpened;
    ScriptContext1_SetupScript(S_UseRockSmash);
}

int FldEff_RockSmash(void)
{
    u8 taskId = oei_task_add();

    gTasks[taskId].data[8] = (u32)sub_810B58C >> 16;
    gTasks[taskId].data[9] = (u32)sub_810B58C;
    IncrementGameStat(GAME_STAT_USED_ROCK_SMASH);
    return 0;
}

static void sub_810B58C(void)
{
    PlaySE(SE_W088);
    FieldEffectActiveListRemove(FLDEFF_USE_ROCK_SMASH);
    EnableBothScriptContexts();
}

int SetUpFieldMove_Dig(void)
{
    if (CanUseEscapeRopeOnCurrMap() == TRUE)
    {
        gFieldCallback = FieldCallback_PrepareFadeInFromMenu;
        gPostMenuFieldCallback = sub_810B5D8;
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

static void sub_810B5D8(void)
{
    Overworld_ResetStateAfterDigEscRope();
    FieldEffectStart(FLDEFF_USE_DIG);
    gFieldEffectArguments[0] = gLastFieldPokeMenuOpened;
}

int FldEff_UseDig(void)
{
    u8 taskId = oei_task_add();

    gTasks[taskId].data[8] = (u32)sub_810B634 >> 16;
    gTasks[taskId].data[9] = (u32)sub_810B634;
    if (!ShouldDoBrailleDigEffect())
        SetPlayerAvatarTransitionFlags(PLAYER_AVATAR_FLAG_ON_FOOT);
    return 0;
}

static void sub_810B634(void)
{
    u8 taskId;

    FieldEffectActiveListRemove(FLDEFF_USE_DIG);
    if (ShouldDoBrailleDigEffect())
    {
        DoBrailleDigEffect();
    }
    else
    {
        taskId = CreateTask(task08_080A1C44, 8);
        gTasks[taskId].data[0] = 0;
    }
}
