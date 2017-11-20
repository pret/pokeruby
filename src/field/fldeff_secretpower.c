#include "global.h"
#include "event_data.h"
#include "fieldmap.h"
#include "field_effect.h"
#include "field_player_avatar.h"
#include "metatile_behavior.h"
#include "metatile_behaviors.h"
#include "overworld.h"
#include "pokemon_menu.h"
#include "rom6.h"
#include "script.h"
#include "secret_base.h"
#include "songs.h"
#include "sound.h"

extern u8 gUnknown_081A2CE6[];
extern u8 gUnknown_081A2D3E[];
extern u8 gUnknown_081A2D96[];

extern struct SpriteTemplate gSpriteTemplate_83D2614;
extern struct SpriteTemplate gSpriteTemplate_83D262C;
extern struct SpriteTemplate gSpriteTemplate_83D2644;

void sub_80C639C(void);
void sub_80C63E8(void);
void sub_80C6468(struct Sprite *);
void sub_80C6498(struct Sprite *);
void sub_80C64A8(void);
void sub_80C64F4(void);
void sub_80C65C4(struct Sprite *);
void sub_80C65FC(struct Sprite *);
void sub_80C660C(void);
void sub_80C6658(void);
void sub_80C66D8(struct Sprite *sprite);
void sub_80C6708(struct Sprite *sprite);

void sub_80C6264(void)
{
    sub_80BBFD8(&gUnknown_0203923C, gMapHeader.events);
    sub_80BB5E4();
}

void sub_80C6280(void)
{
    switch (gFieldEffectArguments[1])
    {
    case 1:
        gFieldEffectArguments[5] = 8;
        gFieldEffectArguments[6] = 40;
        break;
    case 2:
        gFieldEffectArguments[5] = 8;
        gFieldEffectArguments[6] = 8;
        break;
    case 3:
        gFieldEffectArguments[5] = -8;
        gFieldEffectArguments[6] = 24;
        break;
    case 4:
        gFieldEffectArguments[5] = 24;
        gFieldEffectArguments[6] = 24;
        break;
    }
}

bool8 SetUpFieldMove_SecretPower(void)
{
    u8 behavior;

    sub_80BB63C();

    if (gScriptResult == 1 || player_get_direction_lower_nybble() != DIR_NORTH)
        return FALSE;

    GetXYCoordsOneStepInFrontOfPlayer(&gUnknown_0203923C.x, &gUnknown_0203923C.y);
    behavior = MapGridGetMetatileBehaviorAt(gUnknown_0203923C.x, gUnknown_0203923C.y);

    if (MetatileBehavior_IsSecretBaseCave(behavior) == TRUE)
    {
        sub_80C6264();
        gFieldCallback = FieldCallback_Teleport;
        gUnknown_03005CE4 = sub_80C639C;
        return TRUE;
    }

    if (MetatileBehavior_IsSecretBaseTree(behavior) == TRUE)
    {
        sub_80C6264();
        gFieldCallback = FieldCallback_Teleport;
        gUnknown_03005CE4 = sub_80C64A8;
        return TRUE;
    }

    if (MetatileBehavior_IsSecretBaseShrub(behavior) == TRUE)
    {
        sub_80C6264();
        gFieldCallback = FieldCallback_Teleport;
        gUnknown_03005CE4 = sub_80C660C;
        return TRUE;
    }

    return FALSE;
}

void sub_80C639C(void)
{
    gFieldEffectArguments[0] = gLastFieldPokeMenuOpened;
    ScriptContext1_SetupScript(gUnknown_081A2CE6);
}

bool8 FldEff_UseSecretPowerCave(void)
{
    u8 taskId = oei_task_add();

    gTasks[taskId].data[8] = (uintptr_t)sub_80C63E8 >> 16;
    gTasks[taskId].data[9] = (uintptr_t)sub_80C63E8;

    return FALSE;
}

void sub_80C63E8(void)
{
    FieldEffectActiveListRemove(FLDEFF_USE_SECRET_POWER_CAVE);
    FieldEffectStart(FLDEFF_SECRET_POWER_CAVE);
}

bool8 FldEff_SecretPowerCave(void)
{
    sub_80C6280();
    CreateSprite(
        &gSpriteTemplate_83D2614,
        gSprites[gPlayerAvatar.spriteId].oam.x + gFieldEffectArguments[5],
        gSprites[gPlayerAvatar.spriteId].oam.y + gFieldEffectArguments[6],
        148);
    return FALSE;
}

void sub_80C644C(struct Sprite *sprite)
{
    PlaySE(SE_W088);
    sprite->data[0] = 0;
    sprite->callback = sub_80C6468;
}

void sub_80C6468(struct Sprite *sprite)
{
    if (sprite->data[0] < 40)
    {
        sprite->data[0]++;
        if (sprite->data[0] == 20 )
            sub_80BB800();
    }
    else
    {
        sprite->data[0] = 0;
        sprite->callback = sub_80C6498;
    }
}

void sub_80C6498(struct Sprite *sprite)
{
    FieldEffectStop(sprite, FLDEFF_SECRET_POWER_CAVE);
    EnableBothScriptContexts();
}

void sub_80C64A8(void)
{
    gFieldEffectArguments[0] = gLastFieldPokeMenuOpened;
    ScriptContext1_SetupScript(gUnknown_081A2D3E);
}

bool8 FldEff_UseSecretPowerTree(void)
{
    u8 taskId = oei_task_add();

    gTasks[taskId].data[8] = (uintptr_t)sub_80C64F4 >> 16;
    gTasks[taskId].data[9] = (uintptr_t)sub_80C64F4;

    return FALSE;
}

void sub_80C64F4(void)
{
    FieldEffectActiveListRemove(FLDEFF_USE_SECRET_POWER_TREE);
    FieldEffectStart(FLDEFF_SECRET_POWER_TREE);
}

bool8 FldEff_SecretPowerTree(void)
{
    s16 behavior = MapGridGetMetatileBehaviorAt(gUnknown_0203923C.x, gUnknown_0203923C.y) & 0xFFF;

    if (behavior == MB_SECRET_BASE_SPOT_TREE_1)
    {
        gFieldEffectArguments[7] = 0;
    }

    if (behavior == MB_SECRET_BASE_SPOT_TREE_2)
    {
        gFieldEffectArguments[7] = 2;
    }

    sub_80C6280();

    CreateSprite(
        &gSpriteTemplate_83D262C,
        gSprites[gPlayerAvatar.spriteId].oam.x + gFieldEffectArguments[5],
        gSprites[gPlayerAvatar.spriteId].oam.y + gFieldEffectArguments[6],
        148);

    if (gFieldEffectArguments[7] == 1 || gFieldEffectArguments[7] == 3)
        sub_80BB800();

    return FALSE;
}

void sub_80C6598(struct Sprite *sprite)
{
    PlaySE(SE_W010);
    sprite->animNum = gFieldEffectArguments[7];
    sprite->data[0] = 0;
    sprite->callback = sub_80C65C4;
}

void sub_80C65C4(struct Sprite *sprite)
{
    sprite->data[0]++;

    if (sprite->data[0] >= 40)
    {
        if (gFieldEffectArguments[7] == 0 || gFieldEffectArguments[7] == 2)
            sub_80BB800();
        sprite->data[0] = 0;
        sprite->callback = sub_80C65FC;
    }
}


void sub_80C65FC(struct Sprite *sprite)
{
    FieldEffectStop(sprite, FLDEFF_SECRET_POWER_TREE);
    EnableBothScriptContexts();
}

void sub_80C660C(void)
{
    gFieldEffectArguments[0] = gLastFieldPokeMenuOpened;
    ScriptContext1_SetupScript(gUnknown_081A2D96);
}

bool8 FldEff_UseSecretPowerShrub(void)
{
    u8 taskId = oei_task_add();

    gTasks[taskId].data[8] = (uintptr_t)sub_80C6658 >> 16;
    gTasks[taskId].data[9] = (uintptr_t)sub_80C6658;

    return FALSE;
}

void sub_80C6658(void)
{
    FieldEffectActiveListRemove(FLDEFF_USE_SECRET_POWER_SHRUB);
    FieldEffectStart(FLDEFF_SECRET_POWER_SHRUB);
}

bool8 FldEff_SecretPowerShrub(void)
{
    sub_80C6280();
    CreateSprite(
        &gSpriteTemplate_83D2644,
        gSprites[gPlayerAvatar.spriteId].oam.x + gFieldEffectArguments[5],
        gSprites[gPlayerAvatar.spriteId].oam.y + gFieldEffectArguments[6],
        148);
    return FALSE;
}

void sub_80C66BC(struct Sprite *sprite)
{
    PlaySE(SE_W077);
    sprite->data[0] = 0;
    sprite->callback = sub_80C66D8;
}

void sub_80C66D8(struct Sprite *sprite)
{
    if (sprite->data[0] < 40)
    {
        sprite->data[0]++;
        if (sprite->data[0] == 20 )
            sub_80BB800();
    }
    else
    {
        sprite->data[0] = 0;
        sprite->callback = sub_80C6708;
    }
}


void sub_80C6708(struct Sprite *sprite)
{
    FieldEffectStop(sprite, FLDEFF_SECRET_POWER_SHRUB);
    EnableBothScriptContexts();
}
