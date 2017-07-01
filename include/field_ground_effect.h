#ifndef GUARD_FIELD_GROUND_EFFECT_H
#define GUARD_FIELD_GROUND_EFFECT_H

bool8 IsZCoordMismatchAt(u8 z, s16 x, s16 y);
bool8 AreZCoordsCompatible(u8 z1, u8 z2);
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
u8 GetLedgeJumpDirection(s16, s16, u8);
u8 ZCoordToPriority(u8);
void FieldObjectUpdateZCoord(struct MapObject *pObject);
void SetObjectSubpriorityByZCoord(u8, struct Sprite *, u8);

#endif // GUARD_FIELD_GROUND_EFFECT_H
