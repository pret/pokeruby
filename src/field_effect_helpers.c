#include "global.h"
#include "sprite.h"
#include "fieldmap.h"
#include "metatile_behavior.h"
#include "sound.h"
#include "event_object_movement.h"
#include "field_camera.h"
#include "field_weather.h"
#include "field_effect.h"
#include "field_effect_helpers.h"
#include "constants/field_effects.h"
#include "constants/songs.h"

static void UpdateObjectReflectionSprite(struct Sprite *);
static void LoadObjectReflectionPalette(struct EventObject *eventObject, struct Sprite *sprite);
static void LoadObjectHighBridgeReflectionPalette(struct EventObject *, u8);
static void LoadObjectRegularReflectionPalette(struct EventObject *, u8);
static void FadeFootprintsTireTracks_Step0(struct Sprite *);
static void FadeFootprintsTireTracks_Step1(struct Sprite *);
static void UpdateAshFieldEffect_Step0(struct Sprite *);
static void UpdateAshFieldEffect_Step1(struct Sprite *);
static void UpdateAshFieldEffect_Step2(struct Sprite *);
static void sub_812882C(struct Sprite *, u8, u8);
static void UpdateFeetInFlowingWaterFieldEffect(struct Sprite *);
static void sub_8127FD4(struct EventObject *, struct Sprite *);
static void sub_812800C(struct EventObject *, struct Sprite *);
static void sub_81280A0(struct EventObject *, struct Sprite *, struct Sprite *);
static void sub_8128174(struct Sprite *);
static u32 ShowDisguiseFieldEffect(u8, u8, u8);

void InitObjectReflectionSprite(struct EventObject *eventObject, struct Sprite *sprite, bool8 stillReflection)
{
    struct Sprite *reflectionSprite;

    reflectionSprite = &gSprites[CreateCopySpriteAt(sprite, sprite->pos1.x, sprite->pos1.y, 0x98)];
    reflectionSprite->callback = UpdateObjectReflectionSprite;
    reflectionSprite->oam.priority = 3;
    reflectionSprite->oam.paletteNum = gReflectionEffectPaletteMap[reflectionSprite->oam.paletteNum];
    reflectionSprite->usingSheet = TRUE;
    reflectionSprite->anims = gDummySpriteAnimTable;
    StartSpriteAnim(reflectionSprite, 0);
    reflectionSprite->affineAnims = gDummySpriteAffineAnimTable;
    reflectionSprite->affineAnimBeginning = TRUE;
    reflectionSprite->subspriteMode = SUBSPRITES_OFF;
    reflectionSprite->data[0] = sprite->data[0];
    reflectionSprite->data[1] = eventObject->localId;
    reflectionSprite->data[7] = stillReflection;
    LoadObjectReflectionPalette(eventObject, reflectionSprite);

    if (!stillReflection)
        reflectionSprite->oam.affineMode = ST_OAM_AFFINE_NORMAL;
}

static s16 GetReflectionVerticalOffset(struct EventObject *eventObject)
{
    return GetEventObjectGraphicsInfo(eventObject->graphicsId)->height - 2;
}

static void LoadObjectReflectionPalette(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 bridgeType;
    u16 bridgeReflectionVerticalOffsets[] = { 12, 28, 44 };
    sprite->data[2] = 0;
    if (!GetEventObjectGraphicsInfo(eventObject->graphicsId)->disableReflectionPaletteLoad && ((bridgeType = MetatileBehavior_GetBridgeType(eventObject->previousMetatileBehavior)) || (bridgeType = MetatileBehavior_GetBridgeType(eventObject->currentMetatileBehavior))))
    {
        sprite->data[2] = bridgeReflectionVerticalOffsets[bridgeType - 1];
        LoadObjectHighBridgeReflectionPalette(eventObject, sprite->oam.paletteNum);
    }
    else
    {
        LoadObjectRegularReflectionPalette(eventObject, sprite->oam.paletteNum);
    }
}

static void LoadObjectRegularReflectionPalette(struct EventObject *eventObject, u8 paletteIndex)
{
    const struct EventObjectGraphicsInfo *graphicsInfo;

    graphicsInfo = GetEventObjectGraphicsInfo(eventObject->graphicsId);
    if (graphicsInfo->bridgeReflectionPaletteTag != 0x11ff)
    {
        if (graphicsInfo->paletteSlot == 0)
        {
            LoadPlayerObjectReflectionPalette(graphicsInfo->paletteTag, paletteIndex);
        }
        else if (graphicsInfo->paletteSlot == 10)
        {
            LoadSpecialObjectReflectionPalette(graphicsInfo->paletteTag, paletteIndex);
        }
        else
        {
            PatchObjectPalette(GetObjectPaletteTag(paletteIndex), paletteIndex);
        }
        UpdateSpritePaletteWithWeather(paletteIndex);
    }
}

// When walking on a bridge high above water (Route 120), the reflection is a solid dark blue color.
// This is so the sprite blends in with the dark water metatile underneath the bridge.
static void LoadObjectHighBridgeReflectionPalette(struct EventObject *eventObject, u8 paletteNum)
{
    const struct EventObjectGraphicsInfo *graphicsInfo;

    graphicsInfo = GetEventObjectGraphicsInfo(eventObject->graphicsId);
    if (graphicsInfo->bridgeReflectionPaletteTag != 0x11ff)
    {
        PatchObjectPalette(graphicsInfo->bridgeReflectionPaletteTag, paletteNum);
        UpdateSpritePaletteWithWeather(paletteNum);
    }
}

static void UpdateObjectReflectionSprite(struct Sprite *reflectionSprite)
{
    struct EventObject *eventObject;
    struct Sprite *mainSprite;

    eventObject = &gEventObjects[reflectionSprite->data[0]];
    mainSprite = &gSprites[eventObject->spriteId];
    if (!eventObject->active || !eventObject->hasReflection || eventObject->localId != reflectionSprite->data[1])
    {
        reflectionSprite->inUse = FALSE;
    }
    else
    {
        reflectionSprite->oam.paletteNum = gReflectionEffectPaletteMap[mainSprite->oam.paletteNum];
        reflectionSprite->oam.shape = mainSprite->oam.shape;
        reflectionSprite->oam.size = mainSprite->oam.size;
        reflectionSprite->oam.matrixNum = mainSprite->oam.matrixNum | 0x10;
        reflectionSprite->oam.tileNum = mainSprite->oam.tileNum;
        reflectionSprite->subspriteTables = mainSprite->subspriteTables;
        reflectionSprite->subspriteTableNum = mainSprite->subspriteTableNum;
        reflectionSprite->invisible = mainSprite->invisible;
        reflectionSprite->pos1.x = mainSprite->pos1.x;
        // reflectionSprite->data[2] holds an additional vertical offset, used by the high bridges on Route 120
        reflectionSprite->pos1.y = mainSprite->pos1.y + GetReflectionVerticalOffset(eventObject) + reflectionSprite->data[2];
        reflectionSprite->centerToCornerVecX = mainSprite->centerToCornerVecX;
        reflectionSprite->centerToCornerVecY = mainSprite->centerToCornerVecY;
        reflectionSprite->pos2.x = mainSprite->pos2.x;
        reflectionSprite->pos2.y = -mainSprite->pos2.y;
        reflectionSprite->coordOffsetEnabled = mainSprite->coordOffsetEnabled;

        // Check if the reflection is not still.
        if (reflectionSprite->data[7] == FALSE)
        {
            // Sets the reflection sprite's rot/scale matrix to the appropriate
            // matrix based on whether or not the main sprite is horizontally flipped.
            // If the sprite is facing to the east, then it is flipped, and its matrixNum is 8.
            reflectionSprite->oam.matrixNum = 0;
            if (mainSprite->oam.matrixNum & 0x8)
                reflectionSprite->oam.matrixNum = 1;
        }
    }
}

u8 CreateWarpArrowSprite(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[8], 0, 0, 0x52);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->oam.priority = 1;
        sprite->coordOffsetEnabled = TRUE;
        sprite->invisible = TRUE;
    }
    return spriteId;
}

void SetSpriteInvisible(u8 spriteId)
{
    gSprites[spriteId].invisible = TRUE;
}

void ShowWarpArrowSprite(u8 spriteId, u8 direction, s16 x, s16 y)
{
    s16 x2;
    s16 y2;
    struct Sprite *sprite;

    sprite = &gSprites[spriteId];
    if (sprite->invisible || sprite->data[0] != x || sprite->data[1] != y)
    {
        sub_80603CC(x, y, &x2, &y2);
        sprite = &gSprites[spriteId];
        sprite->pos1.x = x2 + 8;
        sprite->pos1.y = y2 + 8;
        sprite->invisible = FALSE;
        sprite->data[0] = x;
        sprite->data[1] = y;
        StartSpriteAnim(sprite, direction - 1);
    }
}

const u8 gShadowEffectTemplateIds[] = {
    0,
    1,
    2,
    3
};

const u16 gShadowVerticalOffsets[] = {
    4,
    4,
    4,
    16
};

u32 FldEff_Shadow(void)
{
    u8 eventObjectId;
    const struct EventObjectGraphicsInfo *graphicsInfo;
    u8 spriteId;

    eventObjectId = GetEventObjectIdByLocalIdAndMap(gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    graphicsInfo = GetEventObjectGraphicsInfo(gEventObjects[eventObjectId].graphicsId);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[gShadowEffectTemplateIds[graphicsInfo->shadowSize]], 0, 0, 0x94);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].coordOffsetEnabled = TRUE;
        gSprites[spriteId].data[0] = gFieldEffectArguments[0];
        gSprites[spriteId].data[1] = gFieldEffectArguments[1];
        gSprites[spriteId].data[2] = gFieldEffectArguments[2];
        gSprites[spriteId].data[3] = (graphicsInfo->height >> 1) - gShadowVerticalOffsets[graphicsInfo->shadowSize];
    }
    return 0;
}

void UpdateShadowFieldEffect(struct Sprite *sprite)
{
    u8 eventObjectId;
    struct EventObject *eventObject;
    struct Sprite *linkedSprite;

    if (TryGetEventObjectIdByLocalIdAndMap(sprite->data[0], sprite->data[1], sprite->data[2], &eventObjectId))
    {
        FieldEffectStop(sprite, FLDEFF_SHADOW);
    }
    else
    {
        eventObject = &gEventObjects[eventObjectId];
        linkedSprite = &gSprites[eventObject->spriteId];
        sprite->oam.priority = linkedSprite->oam.priority;
        sprite->pos1.x = linkedSprite->pos1.x;
        sprite->pos1.y = linkedSprite->pos1.y + sprite->data[3];
        if (!eventObject->active || !eventObject->hasShadow
         || MetatileBehavior_IsPokeGrass(eventObject->currentMetatileBehavior)
         || MetatileBehavior_IsSurfableWaterOrUnderwater(eventObject->currentMetatileBehavior)
         || MetatileBehavior_IsSurfableWaterOrUnderwater(eventObject->previousMetatileBehavior)
         || MetatileBehavior_IsReflective(eventObject->currentMetatileBehavior)
         || MetatileBehavior_IsReflective(eventObject->previousMetatileBehavior))
        {
            FieldEffectStop(sprite, FLDEFF_SHADOW);
        }
    }
}

u32 FldEff_TallGrass(void)
{
    s16 x;
    s16 y;
    u8 spriteId;
    struct Sprite *sprite;

    x = gFieldEffectArguments[0];
    y = gFieldEffectArguments[1];
    sub_8060470(&x, &y, 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[4], x, y, 0);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[0] = gFieldEffectArguments[2];
        sprite->data[1] = gFieldEffectArguments[0];
        sprite->data[2] = gFieldEffectArguments[1];
        sprite->data[3] = gFieldEffectArguments[4];
        sprite->data[4] = gFieldEffectArguments[5];
        sprite->data[5] = gFieldEffectArguments[6];
        if (gFieldEffectArguments[7])
        {
            SeekSpriteAnim(sprite, 4);
        }
    }
    return 0;
}

void UpdateTallGrassFieldEffect(struct Sprite *sprite)
{
    u8 mapNum;
    u8 mapGroup;
    u8 metatileBehavior;
    u8 localId;
    u8 eventObjectId;
    struct EventObject *eventObject;

    mapNum = sprite->data[5] >> 8;
    mapGroup = sprite->data[5];
    if (gCamera.field_0 && (gSaveBlock1.location.mapNum != mapNum || gSaveBlock1.location.mapGroup != mapGroup))
    {
        sprite->data[1] -= gCamera.x;
        sprite->data[2] -= gCamera.y;
        sprite->data[5] = ((u8)gSaveBlock1.location.mapNum << 8) | (u8)gSaveBlock1.location.mapGroup;
    }
    localId = sprite->data[3] >> 8;
    mapNum = sprite->data[3];
    mapGroup = sprite->data[4];
    metatileBehavior = MapGridGetMetatileBehaviorAt(sprite->data[1], sprite->data[2]);
    if (TryGetEventObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &eventObjectId) || !MetatileBehavior_IsTallGrass(metatileBehavior) || (sprite->data[7] && sprite->animEnded))
    {
        FieldEffectStop(sprite, FLDEFF_TALL_GRASS);
    }
    else
    {
        eventObject = &gEventObjects[eventObjectId];
        if ((eventObject->currentCoords.x != sprite->data[1] || eventObject->currentCoords.y != sprite->data[2]) && (eventObject->previousCoords.x != sprite->data[1] || eventObject->previousCoords.y != sprite->data[2]))
            sprite->data[7] = TRUE;

        metatileBehavior = 0;
        if (sprite->animCmdIndex == 0)
            metatileBehavior = 4;

        UpdateEventObjectSpriteVisibility(sprite, 0);
        sub_812882C(sprite, sprite->data[0], metatileBehavior);
    }
}

u32 FldEff_JumpTallGrass(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    sub_8060470((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 12);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[10], gFieldEffectArguments[0], gFieldEffectArguments[1], 0);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[0] = gFieldEffectArguments[2];
        sprite->data[1] = 12;
    }
    return 0;
}

u8 FindTallGrassFieldEffectSpriteId(u8 localId, u8 mapNum, u8 mapGroup, s16 x, s16 y)
{
    struct Sprite *sprite;
    u8 i;

    for (i = 0; i < MAX_SPRITES; i ++)
    {
        if (gSprites[i].inUse)
        {
            sprite = &gSprites[i];
            if (sprite->callback == UpdateTallGrassFieldEffect && (x == sprite->data[1] && y == sprite->data[2]) && (localId == (u8)(sprite->data[3] >> 8) && mapNum == (sprite->data[3] & 0xFF) && mapGroup == sprite->data[4]))
                return i;
        }
    }

    return MAX_SPRITES;
}

u32 FldEff_LongGrass(void)
{
    s16 x;
    s16 y;
    u8 spriteId;
    struct Sprite *sprite;

    x = gFieldEffectArguments[0];
    y = gFieldEffectArguments[1];
    sub_8060470(&x, &y, 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[15], x, y, 0);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = ZCoordToPriority(gFieldEffectArguments[2]);
        sprite->data[0] = gFieldEffectArguments[2];
        sprite->data[1] = gFieldEffectArguments[0];
        sprite->data[2] = gFieldEffectArguments[1];
        sprite->data[3] = gFieldEffectArguments[4];
        sprite->data[4] = gFieldEffectArguments[5];
        sprite->data[5] = gFieldEffectArguments[6];
        if (gFieldEffectArguments[7])
        {
            SeekSpriteAnim(sprite, 6);
        }
    }
    return 0;
}

void UpdateLongGrassFieldEffect(struct Sprite *sprite)
{
    u8 mapNum;
    u8 mapGroup;
    u8 metatileBehavior;
    u8 localId;
    u8 eventObjectId;
    struct EventObject *eventObject;

    mapNum = sprite->data[5] >> 8;
    mapGroup = sprite->data[5];
    if (gCamera.field_0 && (gSaveBlock1.location.mapNum != mapNum || gSaveBlock1.location.mapGroup != mapGroup))
    {
        sprite->data[1] -= gCamera.x;
        sprite->data[2] -= gCamera.y;
        sprite->data[5] = ((u8)gSaveBlock1.location.mapNum << 8) | (u8)gSaveBlock1.location.mapGroup;
    }
    localId = sprite->data[3] >> 8;
    mapNum = sprite->data[3];
    mapGroup = sprite->data[4];
    metatileBehavior = MapGridGetMetatileBehaviorAt(sprite->data[1], sprite->data[2]);
    if (TryGetEventObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &eventObjectId) || !MetatileBehavior_IsLongGrass(metatileBehavior) || (sprite->data[7] && sprite->animEnded))
    {
        FieldEffectStop(sprite, FLDEFF_LONG_GRASS);
    }
    else
    {
        eventObject = &gEventObjects[eventObjectId];
        if ((eventObject->currentCoords.x != sprite->data[1] || eventObject->currentCoords.y != sprite->data[2]) && (eventObject->previousCoords.x != sprite->data[1] || eventObject->previousCoords.y != sprite->data[2]))
        {
            sprite->data[7] = TRUE;
        }
        UpdateEventObjectSpriteVisibility(sprite, 0);
        sub_812882C(sprite, sprite->data[0], 0);
    }
}

u32 FldEff_JumpLongGrass(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    sub_8060470((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[16], gFieldEffectArguments[0], gFieldEffectArguments[1], 0);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[0] = gFieldEffectArguments[2];
        sprite->data[1] = 18;
    }
    return 0;
}

u32 FldEff_ShortGrass(void)
{
    u8 eventObjectId;
    struct EventObject *eventObject;
    u8 spriteId;
    struct Sprite *sprite;

    eventObjectId = GetEventObjectIdByLocalIdAndMap(gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    eventObject = &gEventObjects[eventObjectId];
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[30], 0, 0, 0);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &(gSprites[spriteId]);
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gSprites[eventObject->spriteId].oam.priority;
        sprite->data[0] = gFieldEffectArguments[0];
        sprite->data[1] = gFieldEffectArguments[1];
        sprite->data[2] = gFieldEffectArguments[2];
        sprite->data[3] = gSprites[eventObject->spriteId].pos1.x;
        sprite->data[4] = gSprites[eventObject->spriteId].pos1.y;
    }
    return 0;
}

void UpdateShortGrassFieldEffect(struct Sprite *sprite)
{
    u8 eventObjectId;
    s16 x;
    s16 y;
    const struct EventObjectGraphicsInfo *graphicsInfo;
    struct Sprite *linkedSprite;

    if (TryGetEventObjectIdByLocalIdAndMap(sprite->data[0], sprite->data[1], sprite->data[2], &eventObjectId) || !gEventObjects[eventObjectId].inShortGrass)
    {
        FieldEffectStop(sprite, FLDEFF_SHORT_GRASS);
    }
    else
    {
        graphicsInfo = GetEventObjectGraphicsInfo(gEventObjects[eventObjectId].graphicsId);
        linkedSprite = &gSprites[gEventObjects[eventObjectId].spriteId];
        y = linkedSprite->pos1.y;
        x = linkedSprite->pos1.x;
        if (x != sprite->data[3] || y != sprite->data[4])
        {
            sprite->data[3] = x;
            sprite->data[4] = y;
            if (sprite->animEnded)
            {
                StartSpriteAnim(sprite, 0);
            }
        }
        sprite->pos1.x = x;
        sprite->pos1.y = y;
        sprite->pos2.y = (graphicsInfo->height >> 1) - 8;
        sprite->subpriority = linkedSprite->subpriority - 1;
        sprite->oam.priority = linkedSprite->oam.priority;
        UpdateEventObjectSpriteVisibility(sprite, linkedSprite->invisible);
    }
}

u32 FldEff_SandFootprints(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    sub_8060470((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[11], gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[7] = FLDEFF_SAND_FOOTPRINTS;
        StartSpriteAnim(sprite, gFieldEffectArguments[4]);
    }
    return 0;
}

u32 FldEff_DeepSandFootprints(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    sub_8060470((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[23], gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[7] = FLDEFF_DEEP_SAND_FOOTPRINTS;
        StartSpriteAnim(sprite, gFieldEffectArguments[4]);
    }
    return spriteId;
}

u32 FldEff_BikeTireTracks(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    sub_8060470((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[27], gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[7] = FLDEFF_BIKE_TIRE_TRACKS;
        StartSpriteAnim(sprite, gFieldEffectArguments[4]);
    }
    return spriteId;
}

void (*const gFadeFootprintsTireTracksFuncs[])(struct Sprite *) = {
    FadeFootprintsTireTracks_Step0,
    FadeFootprintsTireTracks_Step1
};

void UpdateFootprintsTireTracksFieldEffect(struct Sprite *sprite)
{
    gFadeFootprintsTireTracksFuncs[sprite->data[0]](sprite);
}

static void FadeFootprintsTireTracks_Step0(struct Sprite *sprite)
{
    // Wait 40 frames before the flickering starts.
    if (++sprite->data[1] > 40)
        sprite->data[0] = 1;

    UpdateEventObjectSpriteVisibility(sprite, FALSE);
}

static void FadeFootprintsTireTracks_Step1(struct Sprite *sprite)
{
    sprite->invisible ^= 1;
    sprite->data[1]++;
    UpdateEventObjectSpriteVisibility(sprite, sprite->invisible);
    if (sprite->data[1] > 56)
    {
        FieldEffectStop(sprite, sprite->data[7]);
    }
}

u32 FldEff_Splash(void)
{
    u8 eventObjectId;
    struct EventObject *eventObject;
    u8 spriteId;
    struct Sprite *sprite;
    const struct EventObjectGraphicsInfo *graphicsInfo;
    struct Sprite *linkedSprite;

    eventObjectId = GetEventObjectIdByLocalIdAndMap(gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    eventObject = &gEventObjects[eventObjectId];
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[13], 0, 0, 0);
    if (spriteId != MAX_SPRITES)
    {
        graphicsInfo = GetEventObjectGraphicsInfo(eventObject->graphicsId);
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        linkedSprite = &gSprites[eventObject->spriteId];
        sprite->oam.priority = linkedSprite->oam.priority;
        sprite->data[0] = gFieldEffectArguments[0];
        sprite->data[1] = gFieldEffectArguments[1];
        sprite->data[2] = gFieldEffectArguments[2];
        sprite->pos2.y = (graphicsInfo->height >> 1) - 4;
        PlaySE(SE_MIZU);
    }
    return 0;
}

void UpdateSplashFieldEffect(struct Sprite *sprite)
{
    u8 eventObjectId;

    if (sprite->animEnded || TryGetEventObjectIdByLocalIdAndMap(sprite->data[0], sprite->data[1], sprite->data[2], &eventObjectId))
    {
        FieldEffectStop(sprite, FLDEFF_SPLASH);
    }
    else
    {
        sprite->pos1.x = gSprites[gEventObjects[eventObjectId].spriteId].pos1.x;
        sprite->pos1.y = gSprites[gEventObjects[eventObjectId].spriteId].pos1.y;
        UpdateEventObjectSpriteVisibility(sprite, FALSE);
    }
}

u32 FldEff_JumpSmallSplash(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    sub_8060470((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 12);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[14], gFieldEffectArguments[0], gFieldEffectArguments[1], 0);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[0] = gFieldEffectArguments[2];
        sprite->data[1] = FLDEFF_JUMP_SMALL_SPLASH;
    }
    return 0;
}

u32 FldEff_JumpBigSplash(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    sub_8060470((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[12], gFieldEffectArguments[0], gFieldEffectArguments[1], 0);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[0] = gFieldEffectArguments[2];
        sprite->data[1] = FLDEFF_JUMP_BIG_SPLASH;
    }
    return 0;
}

u32 FldEff_FeetInFlowingWater(void)
{
    u8 eventObjectId;
    struct EventObject *eventObject;
    u8 spriteId;
    struct Sprite *sprite;
    const struct EventObjectGraphicsInfo *graphicsInfo;

    eventObjectId = GetEventObjectIdByLocalIdAndMap(gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    eventObject = &gEventObjects[eventObjectId];
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[13], 0, 0, 0);
    if (spriteId != MAX_SPRITES)
    {
        graphicsInfo = GetEventObjectGraphicsInfo(eventObject->graphicsId);
        sprite = &gSprites[spriteId];
        sprite->callback = UpdateFeetInFlowingWaterFieldEffect;
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gSprites[eventObject->spriteId].oam.priority;
        sprite->data[0] = gFieldEffectArguments[0];
        sprite->data[1] = gFieldEffectArguments[1];
        sprite->data[2] = gFieldEffectArguments[2];
        sprite->data[3] = -1;
        sprite->data[4] = -1;
        sprite->pos2.y = (graphicsInfo->height >> 1) - 4;
        StartSpriteAnim(sprite, 1);
    }
    return 0;
}

static void UpdateFeetInFlowingWaterFieldEffect(struct Sprite *sprite)
{
    u8 eventObjectId;
    struct Sprite *linkedSprite;
    struct EventObject *eventObject;

    if (TryGetEventObjectIdByLocalIdAndMap(sprite->data[0], sprite->data[1], sprite->data[2], &eventObjectId) || !gEventObjects[eventObjectId].inShallowFlowingWater)
    {
        FieldEffectStop(sprite, FLDEFF_FEET_IN_FLOWING_WATER);
    }
    else
    {
        eventObject = &gEventObjects[eventObjectId];
        linkedSprite = &gSprites[eventObject->spriteId];
        sprite->pos1.x = linkedSprite->pos1.x;
        sprite->pos1.y = linkedSprite->pos1.y;
        sprite->subpriority = linkedSprite->subpriority;
        UpdateEventObjectSpriteVisibility(sprite, FALSE);
        if (eventObject->currentCoords.x != sprite->data[3] || eventObject->currentCoords.y != sprite->data[4])
        {
            sprite->data[3] = eventObject->currentCoords.x;
            sprite->data[4] = eventObject->currentCoords.y;
            if (!sprite->invisible)
            {
                PlaySE(SE_MIZU);
            }
        }
    }
}

u32 FldEff_Ripple(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[5], gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[0] = FLDEFF_RIPPLE;
    }
    return 0;
}

u32 FldEff_HotSpringsWater(void)
{
    u8 eventObjectId;
    struct EventObject *eventObject;
    u8 spriteId;
    struct Sprite *sprite;

    eventObjectId = GetEventObjectIdByLocalIdAndMap(gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    eventObject = &gEventObjects[eventObjectId];
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[31], 0, 0, 0);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gSprites[eventObject->spriteId].oam.priority;
        sprite->data[0] = gFieldEffectArguments[0];
        sprite->data[1] = gFieldEffectArguments[1];
        sprite->data[2] = gFieldEffectArguments[2];
        sprite->data[3] = gSprites[eventObject->spriteId].pos1.x;
        sprite->data[4] = gSprites[eventObject->spriteId].pos1.y;
    }
    return 0;
}

void UpdateHotSpringsWaterFieldEffect(struct Sprite *sprite)
{
    u8 eventObjectId;
    const struct EventObjectGraphicsInfo *graphicsInfo;
    struct Sprite *linkedSprite;

    if (TryGetEventObjectIdByLocalIdAndMap(sprite->data[0], sprite->data[1], sprite->data[2], &eventObjectId) || !gEventObjects[eventObjectId].inHotSprings)
    {
        FieldEffectStop(sprite, FLDEFF_HOT_SPRINGS_WATER);
    }
    else
    {
        graphicsInfo = GetEventObjectGraphicsInfo(gEventObjects[eventObjectId].graphicsId);
        linkedSprite = &gSprites[gEventObjects[eventObjectId].spriteId];
        sprite->pos1.x = linkedSprite->pos1.x;
        sprite->pos1.y = (graphicsInfo->height >> 1) + linkedSprite->pos1.y - 8;
        sprite->subpriority = linkedSprite->subpriority - 1;
        UpdateEventObjectSpriteVisibility(sprite, FALSE);
    }
}

u32 FldEff_Unknown19(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    sub_8060470((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[17], gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[0] = FLDEFF_UNKNOWN_19;
    }
    return 0;
}

u32 FldEff_Unknown20(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    sub_8060470((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[18], gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[0] = FLDEFF_UNKNOWN_20;
    }
    return 0;
}

u32 FldEff_Unknown21(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    sub_8060470((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[19], gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[0] = FLDEFF_UNKNOWN_21;
    }
    return 0;
}

u32 FldEff_Unknown22(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    sub_8060470((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[20], gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[0] = FLDEFF_UNKNOWN_22;
    }
    return 0;
}

void StartAshFieldEffect(s16 x, s16 y, u16 c, s16 d)
{
    gFieldEffectArguments[0] = x;
    gFieldEffectArguments[1] = y;
    gFieldEffectArguments[2] = 0x52;
    gFieldEffectArguments[3] = 1;
    gFieldEffectArguments[4] = c;
    gFieldEffectArguments[5] = d;
    FieldEffectStart(FLDEFF_ASH);
}

u32 FldEff_Ash(void)
{
    s16 x;
    s16 y;
    u8 spriteId;
    struct Sprite *sprite;

    x = gFieldEffectArguments[0];
    y = gFieldEffectArguments[1];
    sub_8060470(&x, &y, 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[6], x, y, gFieldEffectArguments[2]);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[1] = gFieldEffectArguments[0];
        sprite->data[2] = gFieldEffectArguments[1];
        sprite->data[3] = gFieldEffectArguments[4];
        sprite->data[4] = gFieldEffectArguments[5];
    }
    return 0;
}

void (*const gAshFieldEffectFuncs[])(struct Sprite *) = {
    UpdateAshFieldEffect_Step0,
    UpdateAshFieldEffect_Step1,
    UpdateAshFieldEffect_Step2
};

void UpdateAshFieldEffect(struct Sprite *sprite)
{
    gAshFieldEffectFuncs[sprite->data[0]](sprite);
}

static void UpdateAshFieldEffect_Step0(struct Sprite *sprite)
{
    sprite->invisible = TRUE;
    sprite->animPaused = TRUE;
    if (--sprite->data[4] == 0)
        sprite->data[0] = 1;
}

static void UpdateAshFieldEffect_Step1(struct Sprite *sprite)
{
    sprite->invisible = FALSE;
    sprite->animPaused = FALSE;
    MapGridSetMetatileIdAt(sprite->data[1], sprite->data[2], sprite->data[3]);
    CurrentMapDrawMetatileAt(sprite->data[1], sprite->data[2]);
    gEventObjects[gPlayerAvatar.eventObjectId].triggerGroundEffectsOnMove = TRUE;
    sprite->data[0] = 2;
}

static void UpdateAshFieldEffect_Step2(struct Sprite *sprite)
{
    UpdateEventObjectSpriteVisibility(sprite, FALSE);
    if (sprite->animEnded)
        FieldEffectStop(sprite, FLDEFF_ASH);
}

u32 FldEff_SurfBlob(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    sub_8060470((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[7], gFieldEffectArguments[0], gFieldEffectArguments[1], 0x96);
    if (spriteId !=MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.paletteNum = 0;
        sprite->data[2] = gFieldEffectArguments[2];
        sprite->data[3] = -1;
        sprite->data[6] = -1;
        sprite->data[7] = -1;
    }
    FieldEffectActiveListRemove(FLDEFF_SURF_BLOB);
    return spriteId;
}

void sub_8127ED0(u8 spriteId, u8 value)
{
    gSprites[spriteId].data[0] = (gSprites[spriteId].data[0] & ~0xF) | (value & 0xF);
}

void sub_8127EFC(u8 spriteId, u8 value)
{
    gSprites[spriteId].data[0] = (gSprites[spriteId].data[0] & ~0xF0) | ((value & 0xF) << 4);
}

void sub_8127F28(u8 spriteId, u8 value, s16 data1)
{
    gSprites[spriteId].data[0] = (gSprites[spriteId].data[0] & ~0xF00) | ((value & 0xF) << 8);
    gSprites[spriteId].data[1] = data1;
}

static u8 sub_8127F5C(struct Sprite *sprite)
{
    return sprite->data[0] & 0xF;
}

static u8 sub_8127F64(struct Sprite *sprite)
{
    return (sprite->data[0] & 0xF0) >> 4;
}

static u8 sub_8127F70(struct Sprite *sprite)
{
    return (sprite->data[0] & 0xF00) >> 8;
}

void UpdateSurfBlobFieldEffect(struct Sprite *sprite)
{
    struct EventObject *eventObject;
    struct Sprite *linkedSprite;

    eventObject = &gEventObjects[sprite->data[2]];
    linkedSprite = &gSprites[eventObject->spriteId];
    sub_8127FD4(eventObject, sprite);
    sub_812800C(eventObject, sprite);
    sub_81280A0(eventObject, linkedSprite, sprite);
    sprite->oam.priority = linkedSprite->oam.priority;
}

static void sub_8127FD4(struct EventObject *eventObject, struct Sprite *sprite)
{
    u8 surfBlobDirectionAnims[] = {
        0, // DIR_NONE
        0, // DIR_SOUTH
        1, // DIR_NORTH
        2, // DIR_WEST
        3, // DIR_EAST
    };

    if (sub_8127F64(sprite) == 0)
        StartSpriteAnimIfDifferent(sprite, surfBlobDirectionAnims[eventObject->movementDirection]);
}

#ifdef NONMATCHING
static void sub_812800C(struct EventObject *eventObject, struct Sprite *sprite)
{
    s16 x;
    s16 y;
    u8 i;

    x = eventObject->currentCoords.x;
    y = eventObject->currentCoords.y;
    if (sprite->pos2.y == 0 && (x != sprite->data[6] || y != sprite->data[7]))
    {
        sprite->data[5] = sprite->pos2.y;
        for (sprite->data[6] = x, sprite->data[7] = y, i = DIR_SOUTH; i <= DIR_EAST; i ++, x = sprite->data[6], y = sprite->data[7])
        {
            MoveCoords(i, &x, &y);
            if (MapGridGetZCoordAt(x, y) == 3)
            {
                sprite->data[5] ++;
                break;
            }
        }
    }
}
#else
NAKED static void sub_812800C(struct EventObject *eventObject, struct Sprite *sprite)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                    "\tmov r7, r8\n"
                    "\tpush {r7}\n"
                    "\tsub sp, 0x4\n"
                    "\tadds r4, r1, 0\n"
                    "\tldrh r2, [r0, 0x10]\n"
                    "\tmov r1, sp\n"
                    "\tstrh r2, [r1]\n"
                    "\tldrh r1, [r0, 0x12]\n"
                    "\tmov r0, sp\n"
                    "\tadds r0, 0x2\n"
                    "\tstrh r1, [r0]\n"
                    "\tmovs r2, 0x26\n"
                    "\tldrsh r3, [r4, r2]\n"
                    "\tmov r8, r0\n"
                    "\tcmp r3, 0\n"
                    "\tbne _08128094\n"
                    "\tmov r0, sp\n"
                    "\tmovs r5, 0\n"
                    "\tldrsh r2, [r0, r5]\n"
                    "\tmovs r5, 0x3A\n"
                    "\tldrsh r0, [r4, r5]\n"
                    "\tcmp r2, r0\n"
                    "\tbne _08128048\n"
                    "\tlsls r0, r1, 16\n"
                    "\tasrs r0, 16\n"
                    "\tmovs r5, 0x3C\n"
                    "\tldrsh r1, [r4, r5]\n"
                    "\tcmp r0, r1\n"
                    "\tbeq _08128094\n"
                    "_08128048:\n"
                    "\tstrh r3, [r4, 0x38]\n"
                    "\tstrh r2, [r4, 0x3A]\n"
                    "\tmov r1, r8\n"
                    "\tmovs r2, 0\n"
                    "\tldrsh r0, [r1, r2]\n"
                    "\tstrh r0, [r4, 0x3C]\n"
                    "\tmovs r5, 0x1\n"
                    "\tmov r7, r8\n"
                    "\tmov r6, sp\n"
                    "_0812805A:\n"
                    "\tadds r0, r5, 0\n"
                    "\tmov r1, sp\n"
                    "\tadds r2, r7, 0\n"
                    "\tbl MoveCoords\n"
                    "\tmovs r1, 0\n"
                    "\tldrsh r0, [r6, r1]\n"
                    "\tmovs r2, 0\n"
                    "\tldrsh r1, [r7, r2]\n"
                    "\tbl MapGridGetZCoordAt\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r0, 24\n"
                    "\tcmp r0, 0x3\n"
                    "\tbne _08128080\n"
                    "\tldrh r0, [r4, 0x38]\n"
                    "\tadds r0, 0x1\n"
                    "\tstrh r0, [r4, 0x38]\n"
                    "\tb _08128094\n"
                    "_08128080:\n"
                    "\tadds r0, r5, 0x1\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r5, r0, 24\n"
                    "\tldrh r0, [r4, 0x3A]\n"
                    "\tstrh r0, [r6]\n"
                    "\tldrh r0, [r4, 0x3C]\n"
                    "\tmov r1, r8\n"
                    "\tstrh r0, [r1]\n"
                    "\tcmp r5, 0x4\n"
                    "\tbls _0812805A\n"
                    "_08128094:\n"
                    "\tadd sp, 0x4\n"
                    "\tpop {r3}\n"
                    "\tmov r8, r3\n"
                    "\tpop {r4-r7}\n"
                    "\tpop {r0}\n"
                    "\tbx r0");
}
#endif

static void sub_81280A0(struct EventObject *eventObject, struct Sprite *linkedSprite, struct Sprite *sprite)
{
    u16 unk_8401E5A[] = {3, 7};
    u8 v0 = sub_8127F5C(sprite);
    if (v0 != 0)
    {
        if (((u16)(++ sprite->data[4]) & unk_8401E5A[sprite->data[5]]) == 0)
        {
            sprite->pos2.y += sprite->data[3];
        }
        if ((sprite->data[4] & 0x0F) == 0)
        {
            sprite->data[3] = -sprite->data[3];
        }
        if (v0 != 2)
        {
            if (sub_8127F70(sprite) == 0)
            {
                linkedSprite->pos2.y = sprite->pos2.y;
            }
            else
            {
                linkedSprite->pos2.y = sprite->data[1] + sprite->pos2.y;
            }
            sprite->pos1.x = linkedSprite->pos1.x;
            sprite->pos1.y = linkedSprite->pos1.y + 8;
        }
    }
}

u8 sub_8128124(u8 oldSpriteId)
{
    u8 spriteId;
    struct Sprite *sprite;

    spriteId = CreateSpriteAtEnd(&gDummySpriteTemplate, 0, 0, -1);
    sprite = &gSprites[spriteId];
    sprite->callback = sub_8128174;
    sprite->invisible = TRUE;
    sprite->data[0] = oldSpriteId;
    sprite->data[1] = 1;
    return spriteId;
}

static void sub_8128174(struct Sprite *sprite)
{
    struct Sprite *oldSprite;

    oldSprite = &gSprites[sprite->data[0]];
    if (((sprite->data[2]++) & 0x03) == 0)
    {
        oldSprite->pos2.y += sprite->data[1];
    }
    if ((sprite->data[2] & 0x0F) == 0)
    {
        sprite->data[1] = -sprite->data[1];
    }
}

u32 FldEff_Dust(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    sub_8060470((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 12);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[9], gFieldEffectArguments[0], gFieldEffectArguments[1], 0);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[0] = gFieldEffectArguments[2];
        sprite->data[1] = 10;
    }
    return 0;
}

u32 FldEff_SandPile(void)
{
    u8 eventObjectId;
    struct EventObject *eventObject;
    u8 spriteId;
    struct Sprite *sprite;
    const struct EventObjectGraphicsInfo *graphicsInfo;

    eventObjectId = GetEventObjectIdByLocalIdAndMap(gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    eventObject = &gEventObjects[eventObjectId];
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[29], 0, 0, 0);
    if (spriteId != MAX_SPRITES)
    {
        graphicsInfo = GetEventObjectGraphicsInfo(eventObject->graphicsId);
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gSprites[eventObject->spriteId].oam.priority;
        sprite->data[0] = gFieldEffectArguments[0];
        sprite->data[1] = gFieldEffectArguments[1];
        sprite->data[2] = gFieldEffectArguments[2];
        sprite->data[3] = gSprites[eventObject->spriteId].pos1.x;
        sprite->data[4] = gSprites[eventObject->spriteId].pos1.y;
        sprite->pos2.y = (graphicsInfo->height >> 1) - 2;
        SeekSpriteAnim(sprite, 2);
    }
    return 0;
}

void UpdateSandPileFieldEffect(struct Sprite *sprite)
{
    u8 eventObjectId;
    s16 x;
    s16 y;

    if (TryGetEventObjectIdByLocalIdAndMap(sprite->data[0], sprite->data[1], sprite->data[2], &eventObjectId) || !gEventObjects[eventObjectId].inSandPile)
    {
        FieldEffectStop(sprite, FLDEFF_SAND_PILE);
    }
    else
    {
        y = gSprites[gEventObjects[eventObjectId].spriteId].pos1.y;
        x = gSprites[gEventObjects[eventObjectId].spriteId].pos1.x;
        if (x != sprite->data[3] || y != sprite->data[4])
        {
            sprite->data[3] = x;
            sprite->data[4] = y;
            if (sprite->animEnded)
            {
                StartSpriteAnim(sprite, 0);
            }
        }
        sprite->pos1.x = x;
        sprite->pos1.y = y;
        sprite->subpriority = gSprites[gEventObjects[eventObjectId].spriteId].subpriority;
        UpdateEventObjectSpriteVisibility(sprite, FALSE);
    }
}

u32 FldEff_Bubbles(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    sub_8060470((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 0);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[34], gFieldEffectArguments[0], gFieldEffectArguments[1], 0x52);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = 1;
    }
    return 0;
}

void UpdateBubblesFieldEffect(struct Sprite *sprite)
{
    sprite->data[0] += 0x80;
    sprite->data[0] &= 0x100;
    sprite->pos1.y -= sprite->data[0] >> 8;
    UpdateEventObjectSpriteVisibility(sprite, FALSE);
    if (sprite->invisible || sprite->animEnded)
    {
        FieldEffectStop(sprite, FLDEFF_BUBBLES);
    }
}

u32 FldEff_BerryTreeGrowthSparkle(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    sub_8060470((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 4);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[22], gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->oam.paletteNum = 5;
        sprite->data[0] = FLDEFF_BERRY_TREE_GROWTH_SPARKLE;
    }
    return 0;
}

u32 FldEff_TreeDisguise(void)
{
    return ShowDisguiseFieldEffect(FLDEFF_TREE_DISGUISE, 24, 4);
}


u32 FldEff_MountainDisguise(void)
{
    return ShowDisguiseFieldEffect(FLDEFF_MOUNTAIN_DISGUISE, 25, 3);
}


u32 FldEff_SandDisguise(void)
{
    return ShowDisguiseFieldEffect(FLDEFF_SAND_DISGUISE, 28, 2);
}

static u32 ShowDisguiseFieldEffect(u8 fldEff, u8 templateIdx, u8 paletteNum)
{
    u8 spriteId;
    struct Sprite *sprite;

    if (TryGetEventObjectIdByLocalIdAndMap(gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2], &spriteId))
    {
        FieldEffectActiveListRemove(fldEff);
        return MAX_SPRITES;
    }
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[templateIdx], 0, 0, 0);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled ++;
        sprite->oam.paletteNum = paletteNum;
        sprite->data[1] = fldEff;
        sprite->data[2] = gFieldEffectArguments[0];
        sprite->data[3] = gFieldEffectArguments[1];
        sprite->data[4] = gFieldEffectArguments[2];
    }
    return spriteId;
}

void UpdateDisguiseFieldEffect(struct Sprite *sprite)
{
    u8 eventObjectId;
    const struct EventObjectGraphicsInfo *graphicsInfo;
    struct Sprite *linkedSprite;

    if (TryGetEventObjectIdByLocalIdAndMap(sprite->data[2], sprite->data[3], sprite->data[4], &eventObjectId))
    {
        FieldEffectStop(sprite, sprite->data[1]);
    }

    graphicsInfo = GetEventObjectGraphicsInfo(gEventObjects[eventObjectId].graphicsId);
    linkedSprite = &gSprites[gEventObjects[eventObjectId].spriteId];
    sprite->invisible = linkedSprite->invisible;
    sprite->pos1.x = linkedSprite->pos1.x;
    sprite->pos1.y = (graphicsInfo->height >> 1) + linkedSprite->pos1.y - 16;
    sprite->subpriority = linkedSprite->subpriority - 1;
    if (sprite->data[0] == 1)
    {
        sprite->data[0] ++;
        StartSpriteAnim(sprite, 1);
    }
    if (sprite->data[0] == 2 && sprite->animEnded)
    {
        sprite->data[7] = 1;
    }
    if (sprite->data[0] == 3)
    {
        FieldEffectStop(sprite, sprite->data[1]);
    }
}

void sub_812869C(struct EventObject *eventObject)
{
    if (eventObject->directionSequenceIndex == 1)
    {
        gSprites[eventObject->fieldEffectSpriteId].data[0]++;
    }
}

bool8 sub_81286C4(struct EventObject *eventObject)
{
    struct Sprite *sprite;

    if (eventObject->directionSequenceIndex == 2)
    {
        return TRUE;
    }
    if (eventObject->directionSequenceIndex == 0)
    {
        return TRUE;
    }
    sprite = &gSprites[eventObject->fieldEffectSpriteId];
    if (sprite->data[7])
    {
        eventObject->directionSequenceIndex = 2;
        sprite->data[0]++;
        return TRUE;
    }
    return FALSE;
}

u32 FldEff_Sparkle(void)
{
    u8 spriteId;

    gFieldEffectArguments[0] += 7;
    gFieldEffectArguments[1] += 7;
    sub_8060470((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[35], gFieldEffectArguments[0], gFieldEffectArguments[1], 0x52);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].oam.priority = gFieldEffectArguments[2];
        gSprites[spriteId].coordOffsetEnabled = TRUE;
    }
    return 0;
}

void UpdateSparkleFieldEffect(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        if (sprite->animEnded)
        {
            sprite->invisible = TRUE;
            sprite->data[0]++;
        }

        if (sprite->data[0] == 0)
            return;
    }

    if (++sprite->data[1] > 34)
        FieldEffectStop(sprite, FLDEFF_SPARKLE);
}

void UpdateJumpLandingFieldEffect(struct Sprite *sprite)
{
    if (sprite->animEnded)
    {
        FieldEffectStop(sprite, sprite->data[1]);
    }
    else
    {
        UpdateEventObjectSpriteVisibility(sprite, FALSE);
        SetObjectSubpriorityByZCoord(sprite->data[0], sprite, 0);
    }
}

void WaitFieldEffectSpriteAnim(struct Sprite *sprite)
{
    if (sprite->animEnded)
        FieldEffectStop(sprite, sprite->data[0]);
    else
        UpdateEventObjectSpriteVisibility(sprite, FALSE);
}

#ifdef NONMATCHING
static void sub_812882C(struct Sprite *sprite /*r6*/, u8 z, u8 offset)
{
    u8 i;
    s16 xlo;
    s16 xhi;
    s16 lx;
    s16 lyhi;
    s16 ly;
    s16 ylo;
    s16 yhi;
    struct EventObject *eventObject; // r4
    const struct EventObjectGraphicsInfo *graphicsInfo; // destroyed
    struct Sprite *linkedSprite; // r5

    SetObjectSubpriorityByZCoord(z, sprite, offset);
    for (i = 0; i < 16; i ++)
    {
        eventObject = &gEventObjects[i];
        if (eventObject->active)
        {
            graphicsInfo = GetEventObjectGraphicsInfo(eventObject->graphicsId);
            linkedSprite = &gSprites[eventObject->spriteId];
            xhi = sprite->pos1.x + sprite->centerToCornerVecX;
            xlo = sprite->pos1.x - sprite->centerToCornerVecX;
            lx = linkedSprite->pos1.x;
            if (xhi < lx && xlo > lx)
            {
                lyhi = linkedSprite->pos1.y + linkedSprite->centerToCornerVecY;
                ly = linkedSprite->pos1.y;
                ylo = sprite->pos1.y - sprite->centerToCornerVecY;
                yhi = ylo + linkedSprite->centerToCornerVecY;
                if ((lyhi < yhi || lyhi < ylo) && ly > yhi)
                {
                    if (sprite->subpriority <= linkedSprite->subpriority)
                    {
                        sprite->subpriority = linkedSprite->subpriority + 2;
                        break;
                    }
                }
            }
        }
    }
}
#else
NAKED static void sub_812882C(struct Sprite *sprite /*r6*/, u8 z, u8 offset)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                    "\tadds r6, r0, 0\n"
                    "\tadds r0, r1, 0\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r0, 24\n"
                    "\tlsls r2, 24\n"
                    "\tlsrs r2, 24\n"
                    "\tadds r1, r6, 0\n"
                    "\tbl SetObjectSubpriorityByZCoord\n"
                    "\tmovs r7, 0\n"
                    "_08128842:\n"
                    "\tlsls r0, r7, 3\n"
                    "\tadds r0, r7\n"
                    "\tlsls r0, 2\n"
                    "\tldr r1, _081288DC @ =gEventObjects\n"
                    "\tadds r4, r0, r1\n"
                    "\tldrb r0, [r4]\n"
                    "\tlsls r0, 31\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _081288E4\n"
                    "\tldrb r0, [r4, 0x5]\n"
                    "\tbl GetEventObjectGraphicsInfo\n"
                    "\tldrb r1, [r4, 0x4]\n"
                    "\tlsls r0, r1, 4\n"
                    "\tadds r0, r1\n"
                    "\tlsls r0, 2\n"
                    "\tldr r1, _081288E0 @ =gSprites\n"
                    "\tadds r5, r0, r1\n"
                    "\tadds r0, r6, 0\n"
                    "\tadds r0, 0x28\n"
                    "\tmovs r2, 0\n"
                    "\tldrsb r2, [r0, r2]\n"
                    "\tldrh r0, [r6, 0x20]\n"
                    "\tadds r1, r0, r2\n"
                    "\tsubs r0, r2\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r4, r0, 16\n"
                    "\tlsls r1, 16\n"
                    "\tasrs r1, 16\n"
                    "\tmovs r0, 0x20\n"
                    "\tldrsh r2, [r5, r0]\n"
                    "\tcmp r1, r2\n"
                    "\tbge _081288E4\n"
                    "\tlsls r0, r4, 16\n"
                    "\tasrs r0, 16\n"
                    "\tcmp r0, r2\n"
                    "\tble _081288E4\n"
                    "\tadds r0, r5, 0\n"
                    "\tadds r0, 0x29\n"
                    "\tmovs r3, 0\n"
                    "\tldrsb r3, [r0, r3]\n"
                    "\tldrh r2, [r5, 0x22]\n"
                    "\tadds r2, r3\n"
                    "\tldrh r4, [r5, 0x22]\n"
                    "\tadds r0, r6, 0\n"
                    "\tadds r0, 0x29\n"
                    "\tmovs r1, 0\n"
                    "\tldrsb r1, [r0, r1]\n"
                    "\tldrh r0, [r6, 0x22]\n"
                    "\tsubs r0, r1\n"
                    "\tlsls r0, 16\n"
                    "\tasrs r0, 16\n"
                    "\tadds r3, r0, r3\n"
                    "\tlsls r2, 16\n"
                    "\tasrs r2, 16\n"
                    "\tlsls r3, 16\n"
                    "\tasrs r3, 16\n"
                    "\tcmp r2, r3\n"
                    "\tblt _081288BC\n"
                    "\tcmp r2, r0\n"
                    "\tbge _081288E4\n"
                    "_081288BC:\n"
                    "\tlsls r0, r4, 16\n"
                    "\tasrs r0, 16\n"
                    "\tcmp r0, r3\n"
                    "\tble _081288E4\n"
                    "\tadds r2, r6, 0\n"
                    "\tadds r2, 0x43\n"
                    "\tadds r0, r5, 0\n"
                    "\tadds r0, 0x43\n"
                    "\tldrb r1, [r0]\n"
                    "\tldrb r0, [r2]\n"
                    "\tcmp r0, r1\n"
                    "\tbhi _081288E4\n"
                    "\tadds r0, r1, 0x2\n"
                    "\tstrb r0, [r2]\n"
                    "\tb _081288EE\n"
                    "\t.align 2, 0\n"
                    "_081288DC: .4byte gEventObjects\n"
                    "_081288E0: .4byte gSprites\n"
                    "_081288E4:\n"
                    "\tadds r0, r7, 0x1\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r7, r0, 24\n"
                    "\tcmp r7, 0xF\n"
                    "\tbls _08128842\n"
                    "_081288EE:\n"
                    "\tpop {r4-r7}\n"
                    "\tpop {r0}\n"
                    "\tbx r0");
}
#endif
