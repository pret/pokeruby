#include "global.h"
#include "field_ground_effect.h"
#include "field_effect.h"
#include "field_effect_helpers.h"
#include "field_map_obj_helpers.h"
#include "fieldmap.h"
#include "metatile_behavior.h"

static void nullsub(struct MapObject *mapObj, struct Sprite *sprite, u8);
static void DoTracksGroundEffect_Footprints(struct MapObject *mapObj, struct Sprite *sprite, u8);
static void DoTracksGroundEffect_BikeTireTracks(
    struct MapObject *mapObj, struct Sprite *sprite, u8);
void GroundEffect_SpawnOnTallGrass(struct MapObject *mapObj, struct Sprite *sprite);
void sub_8063E94(struct MapObject *mapObj, struct Sprite *sprite);
void sub_8063EE0(struct MapObject *mapObj, struct Sprite *sprite);
void sub_8063F2C(struct MapObject *mapObj, struct Sprite *sprite);
void GroundEffect_WaterReflection(struct MapObject *mapObj, struct Sprite *sprite);
void GroundEffect_IceReflection(struct MapObject *mapObj, struct Sprite *sprite);
void GroundEffect_FlowingWater(struct MapObject *mapObj, struct Sprite *sprite);
void sub_8063FA0(struct MapObject *mapObj, struct Sprite *sprite);
void sub_8063FCC(struct MapObject *mapObj, struct Sprite *sprite);
void GroundEffect_Ripple(struct MapObject *mapObj, struct Sprite *sprite);
void GroundEffect_StepOnPuddle(struct MapObject *mapObj, struct Sprite *sprite);
void GroundEffect_SandPile(struct MapObject *mapObj, struct Sprite *sprite);
void GroundEffect_JumpOnTallGrass(struct MapObject *mapObj, struct Sprite *sprite);
void GroundEffect_JumpOnLongGrass(struct MapObject *mapObj, struct Sprite *sprite);
void GroundEffect_JumpOnShallowWater(struct MapObject *mapObj, struct Sprite *sprite);
void GroundEffect_JumpOnWater(struct MapObject *mapObj, struct Sprite *sprite);
void GroundEffect_JumpLandingDust(struct MapObject *mapObj, struct Sprite *sprite);
void GroundEffect_ShortGrass(struct MapObject *mapObj, struct Sprite *sprite);
void GroundEffect_HotSprings(struct MapObject *mapObj, struct Sprite *sprite);
void GroundEffect_Seaweed(struct MapObject *mapObj, struct Sprite *sprite);

static const u32 sReflectionFlags[] = { 0x00000020, 0x00000010 };

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
    0x00001000, // Landing in tall grass
    0x00002000, // Landing in long grass
    0x00004000, // Landing on puddle
    0x00008000, // Landing on surfable water or underwater
    0x00004000, // Landing on shallow flowing water
    0x00010000, // Landing on any other type of ground
};

static bool8 (*const gUnknown_08376040[])(u8) = {
    MetatileBehavior_IsJumpSouth,
    MetatileBehavior_IsJumpNorth,
    MetatileBehavior_IsJumpWest,
    MetatileBehavior_IsJumpEast,
};

static const u8 gUnknown_08376050[] = {
    0x73, 0x73, 0x53, 0x73, 0x53, 0x73, 0x53, 0x73, 0x53, 0x73, 0x53, 0x73, 0x53, 0x00, 0x00, 0x73
};

// Each byte corresponds to a sprite priority for a field object.
// This is directly the inverse of gFieldObjectPriorities_08376070.
static const u8 gFieldObjectPriorities_08376060[] = {
    2, 2, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 0, 0, 2
};

// Each byte corresponds to a sprite priority for a field object.
// This is the inverse of gFieldObjectPriorities_08376060.
// 1 = Above player sprite
// 2 = Below player sprite
static const u8 gFieldObjectPriorities_08376070[] = {
    1, 1, 1, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 0, 0, 1,
};

static void (*const gUnknown_08376080[])(struct MapObject *mapObj, struct Sprite *sprite, u8 a) = {
    nullsub, DoTracksGroundEffect_Footprints, DoTracksGroundEffect_BikeTireTracks,
};

// First byte is a Field Effect script id. (gFieldEffectScriptPointers)
// Last three bytes are unknown.
static const u8 gSandFootprints_FieldEffectData[] = { 0xD, 0x0, 0x18, 0x0 };

//  Specifies which bike track shape to show next.
//  For example, when the bike turns from up to right, it will show
//  a track that curves to the right.
//  Each 4-byte row corresponds to the initial direction of the bike, and
//  each byte in that row is for the next direction of the bike in the order
//  of down, up, left, right.
static const u8 gBikeTireTracks_Transitions[4][4] = {
    1, 2, 7, 8, 1, 2, 6, 5, 5, 8, 3, 4, 6, 7, 3, 4,
};

static void (*const gUnknown_083760A0[])(
    struct MapObject *mapObj, struct Sprite *sprite) = { GroundEffect_SpawnOnTallGrass,
    sub_8063E94,
    sub_8063EE0,
    sub_8063F2C,
    GroundEffect_WaterReflection,
    GroundEffect_IceReflection,
    GroundEffect_FlowingWater,
    sub_8063FA0,
    sub_8063FCC,
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
    GroundEffect_Seaweed };

#define NUM_GROUND_EFFECTS (sizeof(gUnknown_083760A0) / sizeof(gUnknown_083760A0[0]))

static void GetAllGroundEffectFlags_OnSpawn(struct MapObject *mapObj, u32 *flags)
{
    FieldObjectUpdateMetatileBehaviors(mapObj);
    GetGroundEffectFlags_Reflection(mapObj, flags);
    GetGroundEffectFlags_TallGrassOnSpawn(mapObj, flags);
    GetGroundEffectFlags_LongGrassOnSpawn(mapObj, flags);
    GetGroundEffectFlags_SandPile(mapObj, flags);
    GetGroundEffectFlags_ShallowFlowingWater(mapObj, flags);
    GetGroundEffectFlags_ShortGrass(mapObj, flags);
    GetGroundEffectFlags_HotSprings(mapObj, flags);
}

static void GetAllGroundEffectFlags_OnBeginStep(struct MapObject *mapObj, u32 *flags)
{
    FieldObjectUpdateMetatileBehaviors(mapObj);
    GetGroundEffectFlags_Reflection(mapObj, flags);
    GetGroundEffectFlags_TallGrassOnBeginStep(mapObj, flags);
    GetGroundEffectFlags_LongGrassOnBeginStep(mapObj, flags);
    GetGroundEffectFlags_Tracks(mapObj, flags);
    GetGroundEffectFlags_SandPile(mapObj, flags);
    GetGroundEffectFlags_ShallowFlowingWater(mapObj, flags);
    GetGroundEffectFlags_Puddle(mapObj, flags);
    GetGroundEffectFlags_ShortGrass(mapObj, flags);
    GetGroundEffectFlags_HotSprings(mapObj, flags);
}

static void GetAllGroundEffectFlags_OnFinishStep(struct MapObject *mapObj, u32 *flags)
{
    FieldObjectUpdateMetatileBehaviors(mapObj);
    GetGroundEffectFlags_ShallowFlowingWater(mapObj, flags);
    GetGroundEffectFlags_SandPile(mapObj, flags);
    GetGroundEffectFlags_Puddle(mapObj, flags);
    GetGroundEffectFlags_Ripple(mapObj, flags);
    GetGroundEffectFlags_ShortGrass(mapObj, flags);
    GetGroundEffectFlags_HotSprings(mapObj, flags);
    GetGroundEffectFlags_Seaweed(mapObj, flags);
    GetGroundEffectFlags_JumpLanding(mapObj, flags);
}

void FieldObjectUpdateMetatileBehaviors(struct MapObject *mapObj)
{
    mapObj->mapobj_unk_1F = MapGridGetMetatileBehaviorAt(mapObj->coords3.x, mapObj->coords3.y);
    mapObj->mapobj_unk_1E = MapGridGetMetatileBehaviorAt(mapObj->coords2.x, mapObj->coords2.y);
}

void GetGroundEffectFlags_Reflection(struct MapObject *mapObj, u32 *flags)
{
    u32 reflectionFlags[2];
    u32 a;
    u32 b;
    u8 type;

    // Declaring sReflectionFlags inside the function is a neater match than
    // this.
    b = sReflectionFlags[1];
    a = sReflectionFlags[0];
    reflectionFlags[0] = a;
    reflectionFlags[1] = b;

    type = FieldObjectCheckForReflectiveSurface(mapObj);

    if (type)
    {
        if (!mapObj->mapobj_bit_17)
        {
            mapObj->mapobj_bit_17 = 0;
            mapObj->mapobj_bit_17 = 1;
            *flags |= reflectionFlags[type - 1];
        }
    }
    else
    {
        mapObj->mapobj_bit_17 = 0;
    }
}

void GetGroundEffectFlags_TallGrassOnSpawn(struct MapObject *mapObj, u32 *flags)
{
    if (MetatileBehavior_IsTallGrass(mapObj->mapobj_unk_1E))
        *flags |= 0x1;
}

void GetGroundEffectFlags_TallGrassOnBeginStep(struct MapObject *mapObj, u32 *flags)
{
    if (MetatileBehavior_IsTallGrass(mapObj->mapobj_unk_1E))
        *flags |= 0x2;
}

void GetGroundEffectFlags_LongGrassOnSpawn(struct MapObject *mapObj, u32 *flags)
{
    if (MetatileBehavior_IsLongGrass(mapObj->mapobj_unk_1E))
        *flags |= 0x4;
}

void GetGroundEffectFlags_LongGrassOnBeginStep(struct MapObject *mapObj, u32 *flags)
{
    if (MetatileBehavior_IsLongGrass(mapObj->mapobj_unk_1E))
        *flags |= 0x8;
}

void GetGroundEffectFlags_Tracks(struct MapObject *mapObj, u32 *flags)
{
    if (MetatileBehavior_IsDeepSand(mapObj->mapobj_unk_1F))
    {
        *flags |= 0x100;
    }
    else if (MetatileBehavior_IsSandOrDeepSand(mapObj->mapobj_unk_1F) ||
             MetatileBehavior_IsUnusedFootprintMetatile(mapObj->mapobj_unk_1F))
    {
        *flags |= 0x80;
    }
}

void GetGroundEffectFlags_SandPile(struct MapObject *mapObj, u32 *flags)
{
    if (MetatileBehavior_IsDeepSand(mapObj->mapobj_unk_1E) &&
        MetatileBehavior_IsDeepSand(mapObj->mapobj_unk_1F))
    {
        if (!mapObj->mapobj_bit_20)
        {
            mapObj->mapobj_bit_20 = 0;
            mapObj->mapobj_bit_20 = 1;
            *flags |= 0x800;
        }
    }
    else
    {
        mapObj->mapobj_bit_20 = 0;
    }
}

void GetGroundEffectFlags_ShallowFlowingWater(struct MapObject *mapObj, u32 *flags)
{
    if ((MetatileBehavior_IsShallowFlowingWater(mapObj->mapobj_unk_1E) &&
            MetatileBehavior_IsShallowFlowingWater(mapObj->mapobj_unk_1F)) ||
        (MetatileBehavior_IsPacifidlogLog(mapObj->mapobj_unk_1E) &&
            MetatileBehavior_IsPacifidlogLog(mapObj->mapobj_unk_1F)))
    {
        if (!mapObj->mapobj_bit_19)
        {
            mapObj->mapobj_bit_19 = 0;
            mapObj->mapobj_bit_19 = 1;
            *flags |= 0x40;
        }
    }
    else
    {
        mapObj->mapobj_bit_19 = 0;
    }
}

void GetGroundEffectFlags_Puddle(struct MapObject *mapObj, u32 *flags)
{
    if (MetatileBehavior_IsPuddle(mapObj->mapobj_unk_1E) &&
        MetatileBehavior_IsPuddle(mapObj->mapobj_unk_1F))
    {
        *flags |= 0x400;
    }
}

void GetGroundEffectFlags_Ripple(struct MapObject *mapObj, u32 *flags)
{
    if (MetatileBehavior_HasRipples(mapObj->mapobj_unk_1E))
        *flags |= 0x200;
}

void GetGroundEffectFlags_ShortGrass(struct MapObject *mapObj, u32 *flags)
{
    if (MetatileBehavior_IsShortGrass(mapObj->mapobj_unk_1E) &&
        MetatileBehavior_IsShortGrass(mapObj->mapobj_unk_1F))
    {
        if (!mapObj->mapobj_bit_18)
        {
            mapObj->mapobj_bit_18 = 0;
            mapObj->mapobj_bit_18 = 1;
            *flags |= 0x20000;
        }
    }
    else
    {
        mapObj->mapobj_bit_18 = 0;
    }
}

void GetGroundEffectFlags_HotSprings(struct MapObject *mapObj, u32 *flags)
{
    if (MetatileBehavior_IsHotSprings(mapObj->mapobj_unk_1E) &&
        MetatileBehavior_IsHotSprings(mapObj->mapobj_unk_1F))
    {
        if (!mapObj->mapobj_bit_21)
        {
            mapObj->mapobj_bit_21 = 0;
            mapObj->mapobj_bit_21 = 1;
            *flags |= 0x40000;
        }
    }
    else
    {
        mapObj->mapobj_bit_21 = 0;
    }
}

void GetGroundEffectFlags_Seaweed(struct MapObject *mapObj, u32 *flags)
{
    if (MetatileBehavior_IsSeaweed(mapObj->mapobj_unk_1E))
        *flags |= 0x80000;
}

void GetGroundEffectFlags_JumpLanding(struct MapObject *mapObj, u32 *flags)
{

    if (mapObj->mapobj_bit_5 && !mapObj->mapobj_bit_25)
    {
        u8 i;

        for (i = 0; i < 6; i++)
        {
            if (metatileFuncs[i](mapObj->mapobj_unk_1E))
            {
                *flags |= jumpLandingFlags[i];
                return;
            }
        }
    }
}

#ifdef NONMATCHING
u8 FieldObjectCheckForReflectiveSurface(struct MapObject *mapObj)
{
    const struct MapObjectGraphicsInfo *info = GetFieldObjectGraphicsInfo(mapObj->graphicsId);

    // ceil div by tile width?
    s16 width = (info->width + 8) >> 4;
    s16 height = (info->height + 8) >> 4;
    s16 i;
    s16 j;
    u8 result;
    u8 b;
    register u32 a asm("r10");
    register s32 aa asm("r7");

    for (i = 0; i < height; i++)
    {
        a = 1;
        b = MapGridGetMetatileBehaviorAt(mapObj->coords2.x, mapObj->coords2.y + a + i);
        result = GetReflectionTypeByMetatileBehavior(b);

        if (result)
            return result;

        b = MapGridGetMetatileBehaviorAt(mapObj->coords3.x, mapObj->coords3.y + a + i);
        result = GetReflectionTypeByMetatileBehavior(b);

        if (result)
            return result;

        for (j = 1; j < width; j++)
        {
            aa = 1;

            b = MapGridGetMetatileBehaviorAt(mapObj->coords2.x + j, mapObj->coords2.y + aa + i);
            result = GetReflectionTypeByMetatileBehavior(b);

            if (result)
                return result;

            b = MapGridGetMetatileBehaviorAt(mapObj->coords2.x - j, mapObj->coords2.y + aa + i);
            result = GetReflectionTypeByMetatileBehavior(b);

            if (result)
                return result;

            b = MapGridGetMetatileBehaviorAt(mapObj->coords3.x + j, mapObj->coords3.y + aa + i);
            result = GetReflectionTypeByMetatileBehavior(b);

            if (result)
                return result;

            b = MapGridGetMetatileBehaviorAt(mapObj->coords3.x - j, mapObj->coords3.y + aa + i);
            result = GetReflectionTypeByMetatileBehavior(b);

            if (result)
                return result;
        }
    }

    return 0;
}
#else
__attribute__((naked)) u8 FieldObjectCheckForReflectiveSurface(struct MapObject *mapObj)
{
    asm(".syntax unified\n\
  push {r4-r7,lr}\n\
	mov r7, r10\n\
	mov r6, r9\n\
	mov r5, r8\n\
	push {r5-r7}\n\
	sub sp, 0x8\n\
	adds r5, r0, 0\n\
	ldrb r0, [r5, 0x5]\n\
	bl GetFieldObjectGraphicsInfo\n\
	movs r2, 0x8\n\
	ldrsh r1, [r0, r2]\n\
	adds r1, 0x8\n\
	lsls r1, 12\n\
	lsrs r1, 16\n\
	str r1, [sp]\n\
	movs r1, 0xA\n\
	ldrsh r0, [r0, r1]\n\
	adds r0, 0x8\n\
	lsls r0, 12\n\
	movs r4, 0\n\
	lsrs r2, r0, 16\n\
	str r2, [sp, 0x4]\n\
	asrs r0, 16\n\
	cmp r4, r0\n\
	blt _08063A7A\n\
	b _08063B80\n\
_08063A7A:\n\
	movs r0, 0x1\n\
	mov r10, r0\n\
_08063A7E:\n\
	movs r1, 0x10\n\
	ldrsh r0, [r5, r1]\n\
	movs r2, 0x12\n\
	ldrsh r1, [r5, r2]\n\
	add r1, r10\n\
	lsls r4, 16\n\
	asrs r6, r4, 16\n\
	adds r1, r6\n\
	bl MapGridGetMetatileBehaviorAt\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	bl GetReflectionTypeByMetatileBehavior\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	mov r9, r4\n\
	cmp r0, 0\n\
	bne _08063B82\n\
	movs r1, 0x14\n\
	ldrsh r0, [r5, r1]\n\
	movs r2, 0x16\n\
	ldrsh r1, [r5, r2]\n\
	add r1, r10\n\
	adds r1, r6\n\
	bl MapGridGetMetatileBehaviorAt\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	bl GetReflectionTypeByMetatileBehavior\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	cmp r0, 0\n\
	bne _08063B82\n\
	movs r2, 0x1\n\
	ldr r1, [sp]\n\
	lsls r0, r1, 16\n\
	asrs r1, r0, 16\n\
	mov r8, r0\n\
	cmp r2, r1\n\
	bge _08063B6E\n\
	movs r0, 0x80\n\
	lsls r0, 9\n\
	asrs r7, r0, 16\n\
_08063AD8:\n\
	movs r1, 0x10\n\
	ldrsh r0, [r5, r1]\n\
	lsls r1, r2, 16\n\
	asrs r4, r1, 16\n\
	adds r0, r4\n\
	movs r2, 0x12\n\
	ldrsh r1, [r5, r2]\n\
	adds r1, r7\n\
	adds r1, r6\n\
	bl MapGridGetMetatileBehaviorAt\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	bl GetReflectionTypeByMetatileBehavior\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	cmp r0, 0\n\
	bne _08063B82\n\
	movs r1, 0x10\n\
	ldrsh r0, [r5, r1]\n\
	subs r0, r4\n\
	movs r2, 0x12\n\
	ldrsh r1, [r5, r2]\n\
	adds r1, r7\n\
	adds r1, r6\n\
	bl MapGridGetMetatileBehaviorAt\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	bl GetReflectionTypeByMetatileBehavior\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	cmp r0, 0\n\
	bne _08063B82\n\
	movs r1, 0x14\n\
	ldrsh r0, [r5, r1]\n\
	adds r0, r4\n\
	movs r2, 0x16\n\
	ldrsh r1, [r5, r2]\n\
	adds r1, r7\n\
	adds r1, r6\n\
	bl MapGridGetMetatileBehaviorAt\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	bl GetReflectionTypeByMetatileBehavior\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	cmp r0, 0\n\
	bne _08063B82\n\
	movs r1, 0x14\n\
	ldrsh r0, [r5, r1]\n\
	subs r0, r4\n\
	movs r2, 0x16\n\
	ldrsh r1, [r5, r2]\n\
	adds r1, r7\n\
	adds r1, r6\n\
	bl MapGridGetMetatileBehaviorAt\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	bl GetReflectionTypeByMetatileBehavior\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	cmp r0, 0\n\
	bne _08063B82\n\
	adds r0, r4, 0x1\n\
	lsls r0, 16\n\
	lsrs r2, r0, 16\n\
	cmp r0, r8\n\
	blt _08063AD8\n\
_08063B6E:\n\
	movs r1, 0x80\n\
	lsls r1, 9\n\
	add r1, r9\n\
	lsrs r4, r1, 16\n\
	ldr r2, [sp, 0x4]\n\
	lsls r0, r2, 16\n\
	cmp r1, r0\n\
	bge _08063B80\n\
	b _08063A7E\n\
_08063B80:\n\
	movs r0, 0\n\
_08063B82:\n\
	add sp, 0x8\n\
	pop {r3-r5}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	mov r10, r5\n\
	pop {r4-r7}\n\
	pop {r1}\n\
	bx r1\n\
.syntax divided\n");
}
#endif

u8 GetReflectionTypeByMetatileBehavior(u32 behavior)
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
    u8 b;
    u8 index = z;

    if (index == 0)
        return 0;
    else if (index > 4)
        index -= 4;

    index--;
    b = MapGridGetMetatileBehaviorAt(x, y);

    if (gUnknown_08376040[index](b) == 1)
        return index + 1;

    return 0;
}

void FieldObjectSetSpriteOamTableForLongGrass(struct MapObject *mapObj, struct Sprite *sprite)
{
    if (mapObj->mapobj_bit_4)
        return;

    if (!MetatileBehavior_IsLongGrass(mapObj->mapobj_unk_1E))
        return;

    if (!MetatileBehavior_IsLongGrass(mapObj->mapobj_unk_1F))
        return;

    sprite->subspriteTableNum = 4;

    if (ZCoordToPriority(mapObj->elevation) == 1)
        sprite->subspriteTableNum = 5;
}

bool8 IsZCoordMismatchAt(u8 z, s16 x, s16 y)
{
    u8 mapZ;

    if (z == 0)
        return 0;

    mapZ = MapGridGetZCoordAt(x, y);

    if (mapZ == 0 || mapZ == 0xF)
        return 0;

    if (mapZ != z)
        return 1;

    return 0;
}

void FieldObjectUpdateZCoordAndPriority(struct MapObject *mapObj, struct Sprite *sprite)
{
    if (mapObj->mapobj_bit_26)
        return;

    FieldObjectUpdateZCoord(mapObj);

    sprite->subspriteTableNum = gFieldObjectPriorities_08376070[mapObj->elevation];
    sprite->oam.priority = gFieldObjectPriorities_08376060[mapObj->elevation];
}

void InitObjectPriorityByZCoord(struct Sprite *sprite, u8 z)
{
    sprite->subspriteTableNum = gFieldObjectPriorities_08376070[z];
    sprite->oam.priority = gFieldObjectPriorities_08376060[z];
}

u8 ZCoordToPriority(u8 z)
{
    return gFieldObjectPriorities_08376060[z];
}

void FieldObjectUpdateZCoord(struct MapObject *mapObj)
{
    u8 z = MapGridGetZCoordAt(mapObj->coords2.x, mapObj->coords2.y);
    u8 z2 = MapGridGetZCoordAt(mapObj->coords3.x, mapObj->coords3.y);

    if (z == 0xF || z2 == 0xF)
        return;

    mapObj->mapobj_unk_0B_0 = z;

    if (z != 0 && z != 0xF)
        mapObj->elevation = z;
}

void SetObjectSubpriorityByZCoord(u8 a, struct Sprite *sprite, u8 b)
{
    s32 tmp = sprite->centerToCornerVecY;
    u32 tmpa = *(u16 *)&sprite->pos1.y;
    u32 tmpb = *(u16 *)&gSpriteCoordOffsetY;
    s32 tmp2 = (tmpa - tmp) + tmpb;
    u16 tmp3 = (0x10 - ((((u32)tmp2 + 8) & 0xFF) >> 4)) * 2;
    sprite->subpriority = tmp3 + gUnknown_08376050[a] + b;
}

void FieldObjectUpdateSubpriority(struct MapObject *mapObj, struct Sprite *sprite)
{
    if (mapObj->mapobj_bit_26)
        return;

    SetObjectSubpriorityByZCoord(mapObj->elevation, sprite, 1);
}

bool8 AreZCoordsCompatible(u8 a, u8 b)
{
    if (a == 0 || b == 0)
        return TRUE;

    if (a != b)
        return FALSE;

    return TRUE;
}

#define READ8(ptr, s, member) ((ptr)[offsetof(s, member)])

void GroundEffect_SpawnOnTallGrass(struct MapObject *mapObj, struct Sprite *sprite)
{
    u8 *ptr;

    gUnknown_0202FF84[0] = mapObj->coords2.x;
    gUnknown_0202FF84[1] = mapObj->coords2.y;
    gUnknown_0202FF84[2] = mapObj->elevation;
    gUnknown_0202FF84[3] = 2;
    gUnknown_0202FF84[4] = (mapObj->localId << 8) | mapObj->mapNum;
    gUnknown_0202FF84[5] = mapObj->mapGroup;

    ptr = (u8 *)&gSaveBlock1;
    gUnknown_0202FF84[6] = READ8(ptr, struct SaveBlock1, location.mapNum) << 8 |
                           READ8(ptr, struct SaveBlock1, location.mapGroup);

    gUnknown_0202FF84[7] = 1;
    FieldEffectStart(4);
}

void sub_8063E94(struct MapObject *mapObj, struct Sprite *sprite)
{
    u8 *ptr;

    gUnknown_0202FF84[0] = mapObj->coords2.x;
    gUnknown_0202FF84[1] = mapObj->coords2.y;
    gUnknown_0202FF84[2] = mapObj->elevation;
    gUnknown_0202FF84[3] = 2;
    gUnknown_0202FF84[4] = (mapObj->localId << 8) | mapObj->mapNum;
    gUnknown_0202FF84[5] = mapObj->mapGroup;

    ptr = (u8 *)&gSaveBlock1;
    gUnknown_0202FF84[6] = READ8(ptr, struct SaveBlock1, location.mapNum) << 8 |
                           READ8(ptr, struct SaveBlock1, location.mapGroup);

    gUnknown_0202FF84[7] = 0;
    FieldEffectStart(4);
}

void sub_8063EE0(struct MapObject *mapObj, struct Sprite *sprite)
{
    u8 *ptr;

    gUnknown_0202FF84[0] = mapObj->coords2.x;
    gUnknown_0202FF84[1] = mapObj->coords2.y;
    gUnknown_0202FF84[2] = mapObj->elevation;
    gUnknown_0202FF84[3] = 2;
    gUnknown_0202FF84[4] = (mapObj->localId << 8) | mapObj->mapNum;
    gUnknown_0202FF84[5] = mapObj->mapGroup;

    ptr = (u8 *)&gSaveBlock1;
    gUnknown_0202FF84[6] = READ8(ptr, struct SaveBlock1, location.mapNum) << 8 |
                           READ8(ptr, struct SaveBlock1, location.mapGroup);

    gUnknown_0202FF84[7] = 1;
    FieldEffectStart(17);
}

void sub_8063F2C(struct MapObject *mapObj, struct Sprite *sprite)
{
    u8 *ptr;

    gUnknown_0202FF84[0] = mapObj->coords2.x;
    gUnknown_0202FF84[1] = mapObj->coords2.y;
    gUnknown_0202FF84[2] = mapObj->elevation;
    gUnknown_0202FF84[3] = 2;
    gUnknown_0202FF84[4] = (mapObj->localId << 8) | mapObj->mapNum;
    gUnknown_0202FF84[5] = mapObj->mapGroup;

    ptr = (u8 *)&gSaveBlock1;
    gUnknown_0202FF84[6] = READ8(ptr, struct SaveBlock1, location.mapNum) << 8 |
                           READ8(ptr, struct SaveBlock1, location.mapGroup);

    gUnknown_0202FF84[7] = 0;
    FieldEffectStart(17);
}

void GroundEffect_WaterReflection(struct MapObject *mapObj, struct Sprite *sprite)
{
    SetUpReflection(mapObj, sprite, 0);
}

void GroundEffect_IceReflection(struct MapObject *mapObj, struct Sprite *sprite)
{
    SetUpReflection(mapObj, sprite, 1);
}

void GroundEffect_FlowingWater(struct MapObject *mapObj, struct Sprite *sprite)
{
    oe_exec_and_other_stuff(FLDEFF_FEET_IN_FLOWING_WATER, mapObj);
}

void sub_8063FA0(struct MapObject *mapObj, struct Sprite *sprite)
{
    const struct MapObjectGraphicsInfo *info = GetFieldObjectGraphicsInfo(mapObj->graphicsId);
    gUnknown_08376080[info->tracks](mapObj, sprite, 0);
}

void sub_8063FCC(struct MapObject *mapObj, struct Sprite *sprite)
{
    const struct MapObjectGraphicsInfo *info = GetFieldObjectGraphicsInfo(mapObj->graphicsId);
    gUnknown_08376080[info->tracks](mapObj, sprite, 1);
}

static void nullsub(struct MapObject *mapObj, struct Sprite *sprite, u8 a)
{
}

static void DoTracksGroundEffect_Footprints(struct MapObject *mapObj, struct Sprite *sprite, u8 a)
{
    u16 buf[2];
    memcpy(&buf, gSandFootprints_FieldEffectData, sizeof(gSandFootprints_FieldEffectData));
    gUnknown_0202FF84[0] = mapObj->coords3.x;
    gUnknown_0202FF84[1] = mapObj->coords3.y;
    gUnknown_0202FF84[2] = 149;
    gUnknown_0202FF84[3] = 2;
    gUnknown_0202FF84[4] = mapObj->mapobj_unk_18;
    FieldEffectStart(buf[a]);
}

static void DoTracksGroundEffect_BikeTireTracks(
    struct MapObject *mapObj, struct Sprite *sprite, u8 a)
{
    if (mapObj->coords2.x != mapObj->coords3.x || mapObj->coords2.y != mapObj->coords3.y)
    {
        gUnknown_0202FF84[0] = mapObj->coords3.x;
        gUnknown_0202FF84[1] = mapObj->coords3.y;
        gUnknown_0202FF84[2] = 149;
        gUnknown_0202FF84[3] = 2;
        gUnknown_0202FF84[4] =
            gBikeTireTracks_Transitions[mapObj->mapobj_unk_20][mapObj->mapobj_unk_18 - 5];
        FieldEffectStart(FLDEFF_BIKE_TIRE_TRACKS);
    }
}

void GroundEffect_Ripple(struct MapObject *mapObj, struct Sprite *sprite)
{
    DoRippleFieldEffect(mapObj, sprite);
}

void GroundEffect_StepOnPuddle(struct MapObject *mapObj, struct Sprite *sprite)
{
    oe_exec_and_other_stuff(FLDEFF_SPLASH, mapObj);
}

void GroundEffect_SandPile(struct MapObject *mapObj, struct Sprite *sprite)
{
    oe_exec_and_other_stuff(FLDEFF_SAND_PILE, mapObj);
}

void GroundEffect_JumpOnTallGrass(struct MapObject *mapObj, struct Sprite *sprite)
{
    u8 spriteId;

    gUnknown_0202FF84[0] = mapObj->coords2.x;
    gUnknown_0202FF84[1] = mapObj->coords2.y;
    gUnknown_0202FF84[2] = mapObj->elevation;
    gUnknown_0202FF84[3] = 2;
    FieldEffectStart(FLDEFF_JUMP_TALL_GRASS);

    spriteId = sub_8126FF0(
        mapObj->localId, mapObj->mapNum, mapObj->mapGroup, mapObj->coords2.x, mapObj->coords2.y);

    if (spriteId == MAX_SPRITES)
        GroundEffect_SpawnOnTallGrass(mapObj, sprite);
}

void GroundEffect_JumpOnLongGrass(struct MapObject *mapObj, struct Sprite *sprite)
{
    gUnknown_0202FF84[0] = mapObj->coords2.x;
    gUnknown_0202FF84[1] = mapObj->coords2.y;
    gUnknown_0202FF84[2] = mapObj->elevation;
    gUnknown_0202FF84[3] = 2;
    FieldEffectStart(FLDEFF_JUMP_LONG_GRASS);
}

void GroundEffect_JumpOnShallowWater(struct MapObject *mapObj, struct Sprite *sprite)
{
    gUnknown_0202FF84[0] = mapObj->coords2.x;
    gUnknown_0202FF84[1] = mapObj->coords2.y;
    gUnknown_0202FF84[2] = mapObj->elevation;
    gUnknown_0202FF84[3] = sprite->oam.priority;
    FieldEffectStart(FLDEFF_JUMP_SMALL_SPLASH);
}

void GroundEffect_JumpOnWater(struct MapObject *mapObj, struct Sprite *sprite)
{
    gUnknown_0202FF84[0] = mapObj->coords2.x;
    gUnknown_0202FF84[1] = mapObj->coords2.y;
    gUnknown_0202FF84[2] = mapObj->elevation;
    gUnknown_0202FF84[3] = sprite->oam.priority;
    FieldEffectStart(FLDEFF_JUMP_BIG_SPLASH);
}

void GroundEffect_JumpLandingDust(struct MapObject *mapObj, struct Sprite *sprite)
{
    gUnknown_0202FF84[0] = mapObj->coords2.x;
    gUnknown_0202FF84[1] = mapObj->coords2.y;
    gUnknown_0202FF84[2] = mapObj->elevation;
    gUnknown_0202FF84[3] = sprite->oam.priority;
    FieldEffectStart(FLDEFF_DUST);
}

void GroundEffect_ShortGrass(struct MapObject *mapObj, struct Sprite *sprite)
{
    oe_exec_and_other_stuff(FLDEFF_SHORT_GRASS, mapObj);
}

void GroundEffect_HotSprings(struct MapObject *mapObj, struct Sprite *sprite)
{
    oe_exec_and_other_stuff(FLDEFF_HOT_SPRINGS_WATER, mapObj);
}

void GroundEffect_Seaweed(struct MapObject *mapObj, struct Sprite *sprite)
{
    gUnknown_0202FF84[0] = mapObj->coords2.x;
    gUnknown_0202FF84[1] = mapObj->coords2.y;
    FieldEffectStart(FLDEFF_BUBBLES);
}

void sub_8064218(struct MapObject *mapObj, struct Sprite *sprite, u32 flags)
{
    u8 i;
    for (i = 0; i < NUM_GROUND_EFFECTS; i++, flags >>= 1)
        if (flags & 1)
            gUnknown_083760A0[i](mapObj, sprite);
}

void filters_out_some_ground_effects(struct MapObject *mapObj, u32 *flags)
{
    if (mapObj->mapobj_bit_4)
    {
        mapObj->mapobj_bit_18 = 0;
        mapObj->mapobj_bit_20 = 0;
        mapObj->mapobj_bit_19 = 0;
        mapObj->mapobj_bit_21 = 0;
        *flags &= 0xFFF9F7BD;
    }
}

void FilterOutStepOnPuddleGroundEffectIfJumping(struct MapObject *mapObj, u32 *flags)
{
    if (mapObj->mapobj_bit_5)
        *flags &= 0xFFFFFBFF;
}

void DoGroundEffects_OnSpawn(struct MapObject *mapObj, struct Sprite *sprite)
{
    u32 flags;

    if (mapObj->mapobj_bit_2)
    {
        flags = 0;
        FieldObjectUpdateZCoordAndPriority(mapObj, sprite);
        GetAllGroundEffectFlags_OnSpawn(mapObj, &flags);
        FieldObjectSetSpriteOamTableForLongGrass(mapObj, sprite);
        sub_8064218(mapObj, sprite, flags);
        mapObj->mapobj_bit_2 = 0;
        mapObj->mapobj_bit_4 = 0;
    }
}

void DoGroundEffects_OnBeginStep(struct MapObject *mapObj, struct Sprite *sprite)
{
    u32 flags;

    if (mapObj->mapobj_bit_2)
    {
        flags = 0;
        FieldObjectUpdateZCoordAndPriority(mapObj, sprite);
        GetAllGroundEffectFlags_OnBeginStep(mapObj, &flags);
        FieldObjectSetSpriteOamTableForLongGrass(mapObj, sprite);
        filters_out_some_ground_effects(mapObj, &flags);
        sub_8064218(mapObj, sprite, flags);
        mapObj->mapobj_bit_2 = 0;
        mapObj->mapobj_bit_4 = 0;
    }
}

void DoGroundEffects_OnFinishStep(struct MapObject *mapObj, struct Sprite *sprite)
{
    u32 flags;

    if (mapObj->mapobj_bit_3)
    {
        flags = 0;
        FieldObjectUpdateZCoordAndPriority(mapObj, sprite);
        GetAllGroundEffectFlags_OnFinishStep(mapObj, &flags);
        FieldObjectSetSpriteOamTableForLongGrass(mapObj, sprite);
        FilterOutStepOnPuddleGroundEffectIfJumping(mapObj, &flags);
        sub_8064218(mapObj, sprite, flags);
        mapObj->mapobj_bit_3 = 0;
        mapObj->mapobj_bit_5 = 0;
    }
}
