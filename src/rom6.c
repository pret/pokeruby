#include "global.h"
#include "rom6.h"
#include "asm.h"
#include "braille_puzzles.h"
#include "field_effect.h"
#include "field_player_avatar.h"
#include "rom4.h"
#include "script.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"

extern u16 gScriptLastTalked;
extern u32 gUnknown_0202FF84[];
extern struct MapPosition gUnknown_0203923C;
extern void (*gUnknown_0300485C)(void);
extern u8 gLastFieldPokeMenuOpened;
extern void (*gUnknown_03005CE4)(void);
extern u8 UseRockSmashScript[];

extern void sub_808AB90(void);
extern void task08_080A1C44(u8);
extern u8 sub_80CA1C8(void);

static void task08_080C9820(u8);
static void sub_810B3DC(u8);
static void sub_810B428(u8);
static void sub_810B4CC(u8);
static void sub_810B53C(void);
static void sub_810B58C(void);
static void sub_810B5D8(void);
static void sub_810B634(void);

bool8 npc_before_player_of_type(u8 a)
{
    u8 mapObjId;
    
    GetXYCoordsOneStepInFrontOfPlayer(&gUnknown_0203923C.x, &gUnknown_0203923C.y);
    gUnknown_0203923C.height = PlayerGetZCoord();
    mapObjId = GetFieldObjectIdByXYZ(gUnknown_0203923C.x, gUnknown_0203923C.y, gUnknown_0203923C.height);
    if (gMapObjects[mapObjId].graphicsId != a)
    {
        return FALSE;
    }
    else
    {
        gScriptLastTalked = gMapObjects[mapObjId].localId;
        return TRUE;
    }
}

u8 oei_task_add(void)
{
    GetXYCoordsOneStepInFrontOfPlayer(&gUnknown_0203923C.x, &gUnknown_0203923C.y);
    return CreateTask(task08_080C9820, 8);
}

static void task08_080C9820(u8 taskId)
{
    u8 mapObjId;
    
    ScriptContext2_Enable();
    gPlayerAvatar.unk6 = 1;
    mapObjId = gPlayerAvatar.mapObjectId;
    if (!FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(&gMapObjects[mapObjId])
     || FieldObjectClearAnimIfSpecialAnimFinished(&gMapObjects[mapObjId]))
    {
        if (gMapHeader.mapType == 5)
        {
            FieldEffectStart(0x3B);
            gTasks[taskId].func = sub_810B428;
        }
        else
        {
            sub_8059BF4();
            FieldObjectSetSpecialAnim(&gMapObjects[mapObjId], 0x39);
            gTasks[taskId].func = sub_810B3DC;
        }
    }
}

static void sub_810B3DC(u8 taskId)
{
    if (FieldObjectCheckIfSpecialAnimFinishedOrInactive(&gMapObjects[gPlayerAvatar.mapObjectId]) == TRUE)
    {
        FieldEffectStart(0x3B);
        gTasks[taskId].func = sub_810B428;
    }
}

static void sub_810B428(u8 taskId)
{
    if (!FieldEffectActiveListContains(6))
    {
        gUnknown_0202FF84[1] = player_get_direction_lower_nybble();
        if (gUnknown_0202FF84[1] == 1)
            gUnknown_0202FF84[2] = 0;
        if (gUnknown_0202FF84[1] == 2)
            gUnknown_0202FF84[2] = 1;
        if (gUnknown_0202FF84[1] == 3)
            gUnknown_0202FF84[2] = 2;
        if (gUnknown_0202FF84[1] == 4)
            gUnknown_0202FF84[2] = 3;
        sub_805B980(&gMapObjects[gPlayerAvatar.mapObjectId], GetPlayerAvatarGraphicsIdByCurrentState());
        StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], gUnknown_0202FF84[2]);
        FieldEffectActiveListRemove(6);
        gTasks[taskId].func = sub_810B4CC;
    }
}

static void sub_810B4CC(u8 taskId)
{
    void (*func)(void) = (void (*)(void))(((u16)gTasks[taskId].data[8] << 16) | (u16)gTasks[taskId].data[9]);
    
    func();
    gPlayerAvatar.unk6 = 0;
    DestroyTask(taskId);
}

bool8 SetUpFieldMove_RockSmash(void)
{
    if (npc_before_player_of_type(0x56) == TRUE)
    {
        gUnknown_0300485C = sub_808AB90;
        gUnknown_03005CE4 = sub_810B53C;
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

static void sub_810B53C(void)
{
    gUnknown_0202FF84[0] = gLastFieldPokeMenuOpened;
    ScriptContext1_SetupScript(UseRockSmashScript);
}

int FldEff_RockSmash(void)
{
    u8 taskId = oei_task_add();
    
    gTasks[taskId].data[8] = (u32)sub_810B58C >> 16;
    gTasks[taskId].data[9] = (u32)sub_810B58C;
    IncrementGameStat(0x13);
    return 0;
}

static void sub_810B58C(void)
{
    PlaySE(SE_W088);
    FieldEffectActiveListRemove(0x25);
    EnableBothScriptContexts();
}

int SetUpFieldMove_Dig(void)
{
    if (sub_80CA1C8() == TRUE)
    {
        gUnknown_0300485C = sub_808AB90;
        gUnknown_03005CE4 = sub_810B5D8;
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

static void sub_810B5D8(void)
{
    sub_8053014();
    FieldEffectStart(0x26);
    gUnknown_0202FF84[0] = gLastFieldPokeMenuOpened;
}

int FldEff_UseDig(void)
{
    u8 taskId = oei_task_add();
    
    gTasks[taskId].data[8] = (u32)sub_810B634 >> 16;
    gTasks[taskId].data[9] = (u32)sub_810B634;
    if (!ShouldDoBrailleDigEffect())
        SetPlayerAvatarTransitionFlags(1);
    return 0;
}

static void sub_810B634(void)
{
    u8 taskId;
    
    FieldEffectActiveListRemove(0x26);
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
