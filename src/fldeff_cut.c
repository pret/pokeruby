
#include "global.h"
#include "field_camera.h"
#include "field_effect.h"
#include "event_object_movement.h"
#include "field_player_avatar.h"
#include "fieldmap.h"
#include "event_obj_lock.h"
#include "metatile_behavior.h"
#include "pokemon_menu.h"
#include "overworld.h"
#include "rom6.h"
#include "script.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "ewram.h"
#include "constants/field_effects.h"
#include "constants/event_objects.h"
#include "constants/metatile_behaviors.h"
#include "constants/songs.h"

extern void (*gFieldCallback)(void);
extern void (*gPostMenuFieldCallback)(void);
extern u8 gLastFieldPokeMenuOpened;

extern const u8 DoCutFieldEffectScript[];

const struct OamData gOamData_CutGrass =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 0,
    .tileNum = 1,
    .priority = 1,
    .paletteNum = 1,
    .affineParam = 0,
};

const union AnimCmd gSpriteAnim_CutGrass[] =
{
    ANIMCMD_FRAME(0, 30),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_CutGrass[] =
{
    gSpriteAnim_CutGrass,
};

const struct SpriteFrameImage gSpriteImageTable_CutGrass[] =
{
    {gFieldEffectPic_CutGrass, 0x20},
};

const struct SpritePalette gFieldEffectObjectPaletteInfo6 = {gFieldEffectObjectPalette6, 0x1000};

static void FieldCallback_CutTree(void);
static void FieldCallback_CutGrass(void);
static void StartCutTreeFieldEffect(void);
static void StartCutGrassFieldEffect(void);
static void SetCutGrassMetatile(s16, s16);
static void SetCutGrassMetatiles(s16, s16);
static void CutGrassSpriteCallback1(struct Sprite *);
static void CutGrassSpriteCallback2(struct Sprite *);
static void CutGrassSpriteCallbackEnd(struct Sprite *);


static const struct SpriteTemplate gSpriteTemplate_CutGrass =
{
    .tileTag = 0xFFFF,
    .paletteTag = 0x1000,
    .oam = &gOamData_CutGrass,
    .anims = gSpriteAnimTable_CutGrass,
    .images = gSpriteImageTable_CutGrass,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = CutGrassSpriteCallback1,
};

#if DEBUG

void Debug_SetUpFieldMove_Cut(void)
{
    s16 x, y;
    u8 i, j;
    u8 metatileBehavior;

    if (SetLastTalkedObjectInFrontOfPlayer(EVENT_OBJ_GFX_CUTTABLE_TREE) == TRUE)
    {
        gLastFieldPokeMenuOpened = 0;
        FieldCallback_CutTree();
        return;
    }

    PlayerGetDestCoords(&gPlayerFacingPosition.x, &gPlayerFacingPosition.y);
    for (i = 0; i < 3; i++)
    {
        y = i - 1 + gPlayerFacingPosition.y;
        for (j = 0; j < 3; j++)
        {
            x = j - 1 + gPlayerFacingPosition.x;
            if (MapGridGetZCoordAt(x, y) == gPlayerFacingPosition.height)
            {
                metatileBehavior = MapGridGetMetatileBehaviorAt(x, y);
                if (MetatileBehavior_IsPokeGrass(metatileBehavior) == TRUE
                 || MetatileBehavior_IsAshGrass(metatileBehavior) == TRUE)
                {
                    gLastFieldPokeMenuOpened = 0;
                    FieldCallback_CutGrass();
                    return;
                }
            }
        }
    }

    ScriptContext2_Disable();
}

#endif

bool8 SetUpFieldMove_Cut(void)
{
    s16 x, y;
    u8 i, j;
    u8 tileBehavior;

    if (SetLastTalkedObjectInFrontOfPlayer(EVENT_OBJ_GFX_CUTTABLE_TREE) == TRUE)
    {
        // Standing in front of cuttable tree.
        gFieldCallback = FieldCallback_PrepareFadeInFromMenu;
        gPostMenuFieldCallback = FieldCallback_CutTree;
        return TRUE;
    }
    else
    {
        PlayerGetDestCoords(&gPlayerFacingPosition.x, &gPlayerFacingPosition.y);
        for (i = 0; i < 3; i++)
        {
            y = i - 1 + gPlayerFacingPosition.y;
            for (j = 0; j < 3; j++)
            {
                x = j - 1 + gPlayerFacingPosition.x;
                if(MapGridGetZCoordAt(x, y) == gPlayerFacingPosition.height)
                {
                    tileBehavior = MapGridGetMetatileBehaviorAt(x, y);
                    if(MetatileBehavior_IsPokeGrass(tileBehavior) == TRUE
                    || MetatileBehavior_IsAshGrass(tileBehavior) == TRUE)
                    {
                        // Standing in front of grass.
                        gFieldCallback = FieldCallback_PrepareFadeInFromMenu;
                        gPostMenuFieldCallback = FieldCallback_CutGrass;
                        return TRUE;
                    }
                }
            }
        }

        // Not a valid location to use Cut.
        return FALSE;
    }
}

static void FieldCallback_CutGrass(void)
{
    FieldEffectStart(FLDEFF_USE_CUT_ON_GRASS);
    gFieldEffectArguments[0] = gLastFieldPokeMenuOpened;
}

bool8 FldEff_UseCutOnGrass(void)
{
    u8 taskId = oei_task_add();

    gTasks[taskId].data[8] = (u32)StartCutGrassFieldEffect >> 16;
    gTasks[taskId].data[9] = (u32)StartCutGrassFieldEffect;
    IncrementGameStat(GAME_STAT_USED_CUT);
    return FALSE;
}

static void FieldCallback_CutTree(void)
{
    gFieldEffectArguments[0] = gLastFieldPokeMenuOpened;
    ScriptContext1_SetupScript(DoCutFieldEffectScript);
}

bool8 FldEff_UseCutOnTree(void)
{
    u8 taskId = oei_task_add();

    gTasks[taskId].data[8] = (u32)StartCutTreeFieldEffect >> 16;
    gTasks[taskId].data[9] = (u32)StartCutTreeFieldEffect;
    IncrementGameStat(GAME_STAT_USED_CUT);
    return FALSE;
}

static void StartCutGrassFieldEffect(void)
{
    FieldEffectActiveListRemove(FLDEFF_USE_CUT_ON_GRASS);
    FieldEffectStart(FLDEFF_CUT_GRASS);
}

bool8 FldEff_CutGrass(void)
{
    s16 x, y;
    u8 tileBehavior;
    u8 i, j;

    for (i = 0, PlaySE(SE_W015), PlayerGetDestCoords(&gPlayerFacingPosition.x, &gPlayerFacingPosition.y); i < 3; i++)
    {
        y = i - 1 + gPlayerFacingPosition.y;
        for (j = 0; j < 3; j++)
        {
            x = j - 1 + gPlayerFacingPosition.x;
            if (MapGridGetZCoordAt(x, y) == (s8)gPlayerFacingPosition.height)
            {
                tileBehavior = MapGridGetMetatileBehaviorAt(x, y);
                if (MetatileBehavior_IsCuttableGrass(tileBehavior) == TRUE)
                {
                    SetCutGrassMetatile(x, y);
                    sub_805BCC0(x, y);
                }
            }
        }
    }

    SetCutGrassMetatiles(gPlayerFacingPosition.x - 1, gPlayerFacingPosition.y - 2);
    DrawWholeMapView();

    // populate sprite ID array
    for (i = 0; i < 8; i++)
    {
        eCutGrassSpriteArray[i] = CreateSprite((struct SpriteTemplate *)&gSpriteTemplate_CutGrass,
        gSprites[gPlayerAvatar.spriteId].oam.x + 8, gSprites[gPlayerAvatar.spriteId].oam.y + 20, 0);
        gSprites[eCutGrassSpriteArray[i]].data[2] = 32 * i;
    }

    return 0;
}

// set map grid metatile depending on x, y
static void SetCutGrassMetatile(s16 x, s16 y)
{
    int metatileId = MapGridGetMetatileIdAt(x, y);

    switch(metatileId)
    {
    case 0x208:
    case 0x15:
    case 0xD:
        MapGridSetMetatileIdAt(x, y, 0x1);
        break;
    case 0x1C6:
        MapGridSetMetatileIdAt(x, y, 0x1CE);
        break;
    case 0x1C7:
        MapGridSetMetatileIdAt(x, y, 0x1CF);
        break;
    case 0x281:
        MapGridSetMetatileIdAt(x, y, 0x279);
        break;
    case 0x282:
        MapGridSetMetatileIdAt(x, y, 0x27A);
        break;
    case 0x283:
        MapGridSetMetatileIdAt(x, y, 0x27B);
        break;
    case 0x206:
    case 0x207:
        MapGridSetMetatileIdAt(x, y, 0x271);
        break;
    case 0x212:
    case 0x20A:
        MapGridSetMetatileIdAt(x, y, 0x218);
        break;
    case 0x25:
        MapGridSetMetatileIdAt(x, y, 0xE);
        break;
    }
}

static s32 sub_80A28A0(s16 x, s16 y)
{
    u16 metatileId = MapGridGetMetatileIdAt(x, y);

    if(metatileId == 1)
        return 1;
    else if(metatileId == 633)
        return 2;
    else if(metatileId == 634)
        return 3;
    else if(metatileId == 635)
        return 4;
    else
        return 0;
}

static void SetCutGrassMetatiles(s16 x, s16 y)
{
    s16 i;
    u16 lowerY = y + 3;

    for (i = 0; i < 3; i++)
    {
        u16 currentX = x + i;
        s16 currentXsigned = x + i;
        if (MapGridGetMetatileIdAt(currentXsigned, y) == 21)
        {
            switch ((u8)sub_80A28A0(currentXsigned, y + 1))
            {
            case 1:
                MapGridSetMetatileIdAt(currentXsigned, y + 1, 0x208);
                break;
            case 2:
                MapGridSetMetatileIdAt(currentXsigned, y + 1, 0x281);
                break;
            case 3:
                MapGridSetMetatileIdAt(currentXsigned, y + 1, 0x282);
                break;
            case 4:
                MapGridSetMetatileIdAt(currentXsigned, y + 1, 0x283);
                break;
            }
        }
        if (MapGridGetMetatileIdAt((s16)currentX, (s16)lowerY) == 1)
        {
            if (MapGridGetMetatileIdAt((s16)currentX, (s16)lowerY + 1) == 0x208)
                MapGridSetMetatileIdAt((s16)currentX, (s16)lowerY + 1, 0x1);
            if (MapGridGetMetatileIdAt((s16)currentX, (s16)lowerY + 1) == 0x281)
                MapGridSetMetatileIdAt((s16)currentX, (s16)lowerY + 1, 0x279);
            if (MapGridGetMetatileIdAt((s16)currentX, (s16)lowerY + 1) == 0x282)
                MapGridSetMetatileIdAt((s16)currentX, (s16)lowerY + 1, 0x27A);
            if (MapGridGetMetatileIdAt((s16)currentX, (s16)lowerY + 1) == 0x283)
                MapGridSetMetatileIdAt((s16)currentX, (s16)lowerY + 1, 0x27B);
        }
    }
}

static void CutGrassSpriteCallback1(struct Sprite *sprite)
{
    sprite->data[0] = 8;
    sprite->data[1] = 0;
    sprite->data[3] = 0;
    sprite->callback = CutGrassSpriteCallback2;
}

static void CutGrassSpriteCallback2(struct Sprite *sprite)
{
    u16 tempdata;
    u16 tempdata2;

    sprite->pos2.x = Sin(sprite->data[2], sprite->data[0]);
    sprite->pos2.y = Cos(sprite->data[2], sprite->data[0]);

    sprite->data[2] = (sprite->data[2] + 8) & 0xFF;
    sprite->data[0] += ((tempdata2 = sprite->data[3]) << 16 >> 18) + 1; // what?
    sprite->data[3] = tempdata2 + 1;

    tempdata = sprite->data[1];
    if((s16)tempdata != 28) // done rotating the grass, execute clean up function
        sprite->data[1]++;
    else
        sprite->callback = CutGrassSpriteCallbackEnd;
}

static void CutGrassSpriteCallbackEnd(struct Sprite *sprite)
{
    u8 i;

    for (i = 1; i < 8; i++)
        DestroySprite(&gSprites[eCutGrassSpriteArray[i]]);
    FieldEffectStop(&gSprites[eCutGrassSpriteArray[0]], FLDEFF_CUT_GRASS);
    ScriptUnfreezeEventObjects();
    ScriptContext2_Disable();
}

static void StartCutTreeFieldEffect(void)
{
    PlaySE(SE_W015);
    FieldEffectActiveListRemove(FLDEFF_USE_CUT_ON_TREE);
    EnableBothScriptContexts();
}
