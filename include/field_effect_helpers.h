#ifndef GUARD_FIELD_EFFECT_HELPERS_H
#define GUARD_FIELD_EFFECT_HELPERS_H

extern const struct SpriteTemplate *const gFieldEffectObjectTemplatePointers[];

void sub_812869C(struct EventObject *);
bool8 sub_81286C4(struct EventObject *);
void UpdateShadowFieldEffect(struct Sprite *);
void sub_8087638(struct Sprite *);
void sub_808788C(struct Sprite *);
void UpdateShortGrassFieldEffect(struct Sprite *);
void UpdateFootprintsTireTracksFieldEffect(struct Sprite *);
void UpdateSplashFieldEffect(struct Sprite *);
void UpdateHotSpringsWaterFieldEffect(struct Sprite *);
void UpdateAshFieldEffect(struct Sprite *);
void UpdateSurfBlobFieldEffect(struct Sprite *);
void UpdateSandPileFieldEffect(struct Sprite *);
void UpdateBubblesFieldEffect(struct Sprite *);
void UpdateDisguiseFieldEffect(struct Sprite *);
void UpdateSparkleFieldEffect(struct Sprite *);
void UpdateJumpLandingFieldEffect(struct Sprite *);
void WaitFieldEffectSpriteAnim(struct Sprite *);
void UpdateTallGrassFieldEffect(struct Sprite *);
void UpdateLongGrassFieldEffect(struct Sprite *);
u8 CreateWarpArrowSprite(void);
void SetSpriteInvisible(u8);
void ShowWarpArrowSprite(u8 unk_1B, u8 r6, s16 x, s16 y);
void sub_8127ED0(u8, u8);
void sub_8127F28(u8, u8, s16);
u8 sub_8128124(u8 id);
void StartAshFieldEffect(s16, s16, u16, s16);
void InitObjectReflectionSprite(struct EventObject *eventObj, struct Sprite *sprite, u8 a);
u32 StartFieldEffectForEventObject(u8 fieldEffectId, struct EventObject *eventObject);
u8 FindTallGrassFieldEffectSpriteId(u8, u8, u8, s16, s16);

#endif // GUARD_FIELD_EFFECT_HELPERS_H
