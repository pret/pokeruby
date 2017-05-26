#include "global.h"
#include "asm_fieldmap.h"
#include "metatile_behavior.h"

extern u32 gUnknown_08376008[];

void FieldObjectUpdateMetatileBehaviors(struct MapObject *);
void GetGroundEffectFlags_Reflection(struct MapObject *, u32 *);
void GetGroundEffectFlags_TallGrassOnSpawn(struct MapObject *, u32 *);
void GetGroundEffectFlags_TallGrassOnBeginStep(struct MapObject *, u32 *);
void GetGroundEffectFlags_LongGrassOnSpawn(struct MapObject *, u32 *);
void GetGroundEffectFlags_LongGrassOnBeginStep(struct MapObject *, u32 *);
void GetGroundEffectFlags_Tracks(struct MapObject *, u32 *);
void GetGroundEffectFlags_SandPile(struct MapObject *, u32 *);
void GetGroundEffectFlags_ShallowFlowingWater(struct MapObject *, u32 *);
void GetGroundEffectFlags_Puddle(struct MapObject *, u32 *);
void GetGroundEffectFlags_Ripple(struct MapObject *, u32 *);
void GetGroundEffectFlags_ShortGrass(struct MapObject *, u32 *);
void GetGroundEffectFlags_HotSprings(struct MapObject *, u32 *);
void GetGroundEffectFlags_Seaweed(struct MapObject *, u32 *);
void GetGroundEffectFlags_JumpLanding(struct MapObject *, u32 *);
u8 FieldObjectCheckForReflectiveSurface(struct MapObject *);

void GetAllGroundEffectFlags_OnSpawn(struct MapObject *mapObj, u32 *flags)
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

void GetAllGroundEffectFlags_OnBeginStep(struct MapObject *mapObj, u32 *flags)
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

void GetAllGroundEffectFlags_OnFinishStep(struct MapObject *mapObj, u32 *flags)
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
    u32 reflectionFlags[2] = {0x00000020, 0x00000010};
    u8 type = FieldObjectCheckForReflectiveSurface(mapObj);

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
    else if (MetatileBehavior_IsSandOrDeepSand(mapObj->mapobj_unk_1F) || MetatileBehavior_IsUnusedFootprintMetatile(mapObj->mapobj_unk_1F))
    {
        *flags |= 0x80;
    }
}

void GetGroundEffectFlags_SandPile(struct MapObject *mapObj, u32 *flags)
{
    if (MetatileBehavior_IsDeepSand(mapObj->mapobj_unk_1E) && MetatileBehavior_IsDeepSand(mapObj->mapobj_unk_1F))
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
    if ((MetatileBehavior_IsShallowFlowingWater(mapObj->mapobj_unk_1E) && MetatileBehavior_IsShallowFlowingWater(mapObj->mapobj_unk_1F)) || (MetatileBehavior_IsPacifidlogLog(mapObj->mapobj_unk_1E) && MetatileBehavior_IsPacifidlogLog(mapObj->mapobj_unk_1F)))
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
    if (MetatileBehavior_IsPuddle(mapObj->mapobj_unk_1E) && MetatileBehavior_IsPuddle(mapObj->mapobj_unk_1F))
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
    if (MetatileBehavior_IsShortGrass(mapObj->mapobj_unk_1E) && MetatileBehavior_IsShortGrass(mapObj->mapobj_unk_1F))
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
    if (MetatileBehavior_IsHotSprings(mapObj->mapobj_unk_1E) && MetatileBehavior_IsHotSprings(mapObj->mapobj_unk_1F))
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
    typedef bool8 (*MetatileFunc)(u8);

    static const MetatileFunc metatileFuncs[] =
        {
            MetatileBehavior_IsTallGrass,
            MetatileBehavior_IsLongGrass,
            MetatileBehavior_IsPuddle,
            MetatileBehavior_IsSurfableWaterOrUnderwater,
            MetatileBehavior_IsShallowFlowingWater,
            MetatileBehavior_IsATile,
        };

    static const u32 jumpLandingFlags[] =
        {
            0x00001000, // Landing in tall grass
            0x00002000, // Landing in long grass
            0x00004000, // Landing on puddle
            0x00008000, // Landing on surfable water or underwater
            0x00004000, // Landing on shallow flowing water
            0x00010000, // Landing on any other type of ground
        };

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
