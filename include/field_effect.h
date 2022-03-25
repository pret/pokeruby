#ifndef GUARD_FIELD_EFFECT_H
#define GUARD_FIELD_EFFECT_H

#include "sprite.h"
#include "task.h"

extern const struct CompressedSpritePalette gTrainerFrontPicPaletteTable[2];
extern const struct SpritePalette gUnknown_0839F114;
extern const struct CompressedSpriteSheet gTrainerFrontPicTable[2];
extern const struct SpriteTemplate gSpriteTemplate_839F128;
extern const struct OamData gOamData_839F0F4;
extern struct SpriteTemplate gCreatingSpriteTemplate;

extern u8 gLastFieldPokeMenuOpened;

u32 FieldEffectStart(u8 id);
bool8 FieldEffectCmd_loadtiles(u8 **script, u32 *val);
bool8 FieldEffectCmd_loadfadedpal(u8 **script, u32 *val);
bool8 FieldEffectCmd_loadpal(u8 **script, u32 *val);
bool8 FieldEffectCmd_callnative(u8 **script, u32 *val);
bool8 FieldEffectCmd_end(u8 **script, u32 *val);
bool8 FieldEffectCmd_loadgfx_callnative(u8 **script, u32 *val);
bool8 FieldEffectCmd_loadtiles_callnative(u8 **script, u32 *val);
bool8 FieldEffectCmd_loadfadedpal_callnative(u8 **script, u32 *val);
u32 FieldEffectScript_ReadWord(u8 **script);
void FieldEffectScript_LoadTiles(u8 **script);
void FieldEffectScript_LoadFadedPalette(u8 **script);
void FieldEffectScript_LoadPalette(u8 **script);
void FieldEffectScript_CallNative(u8 **script, u32 *val);
void FieldEffectFreeGraphicsResources(struct Sprite *sprite);
void FieldEffectStop(struct Sprite *sprite, u8 id);
void FieldEffectFreeTilesIfUnused(u16 tileStart);
void FieldEffectFreePaletteIfUnused(u8 paletteNum);
void FieldEffectActiveListClear(void);
void FieldEffectActiveListAdd(u8 id);
void FieldEffectActiveListRemove(u8 id);
bool8 FieldEffectActiveListContains(u8 id);

void SpriteCB_PokeballGlow(struct Sprite *);
void SpriteCB_PokecenterMonitor(struct Sprite *);
void SpriteCB_HallOfFameMonitor(struct Sprite *);

void ReturnToFieldFromFlyMapSelect(void);

void PokecenterHealEffect_0(struct Task *);
void PokecenterHealEffect_1(struct Task *);
void PokecenterHealEffect_2(struct Task *);
void PokecenterHealEffect_3(struct Task *);

void HallOfFameRecordEffect_0(struct Task *);
void HallOfFameRecordEffect_1(struct Task *);
void HallOfFameRecordEffect_2(struct Task *);
void HallOfFameRecordEffect_3(struct Task *);

void PokeballGlowEffect_0(struct Sprite *);
void PokeballGlowEffect_1(struct Sprite *);
void PokeballGlowEffect_2(struct Sprite *);
void PokeballGlowEffect_3(struct Sprite *);
void PokeballGlowEffect_4(struct Sprite *);
void PokeballGlowEffect_5(struct Sprite *);
void PokeballGlowEffect_6(struct Sprite *);
void PokeballGlowEffect_7(struct Sprite *);

void FieldCB_FallWarpExit(void);

bool8 FallWarpEffect_Init(struct Task *);
bool8 FallWarpEffect_WaitWeather(struct Task *);
bool8 FallWarpEffect_StartFall(struct Task *);
bool8 FallWarpEffect_Fall(struct Task *);
bool8 sub_808699C(struct Task *);
bool8 FallWarpEffect_CameraShake(struct Task *);
bool8 FallWarpEffect_End(struct Task *);

void StartEscalatorWarp(u8, u8);

bool8 EscalatorWarpOut_Init(struct Task *);
bool8 EscalatorWarpOut_WaitForPlayer(struct Task *);
bool8 EscalatorWarpOut_Up_Ride(struct Task *);
bool8 EscalatorWarpOut_Up_End(struct Task *);
bool8 EscalatorWarpOut_Down_Ride(struct Task *);
bool8 EscalatorWarpOut_Down_End(struct Task *);

bool8 EscalatorWarpIn_Init(struct Task *);
bool8 EscalatorWarpIn_Down_Init(struct Task *);
bool8 EscalatorWarpIn_Down_Ride(struct Task *);
bool8 EscalatorWarpIn_Up_Init(struct Task *);
bool8 EscalatorWarpIn_Up_Ride(struct Task *);
bool8 EscalatorWarpIn_WaitForMovement(struct Task *);
bool8 EscalatorWarpIn_End(struct Task *);

bool8 WaterfallFieldEffect_Init(struct Task *, struct ObjectEvent *);
bool8 WaterfallFieldEffect_ShowMon(struct Task *, struct ObjectEvent *);
bool8 WaterfallFieldEffect_WaitForShowMon(struct Task *, struct ObjectEvent *);
bool8 WaterfallFieldEffect_RideUp(struct Task *, struct ObjectEvent *);
bool8 WaterfallFieldEffect_ContinueRideOrEnd(struct Task *, struct ObjectEvent *);

bool8 DiveFieldEffect_Init(struct Task *);
bool8 DiveFieldEffect_ShowMon(struct Task *);
bool8 DiveFieldEffect_TryWarp(struct Task *);

void StartLavaridgeGymB1FWarp(u8);

bool8 LavaridgeGymB1FWarpEffect_Init(struct Task *, struct ObjectEvent *, struct Sprite *);
bool8 LavaridgeGymB1FWarpEffect_CameraShake(struct Task *, struct ObjectEvent *, struct Sprite *);
bool8 LavaridgeGymB1FWarpEffect_Launch(struct Task *, struct ObjectEvent *, struct Sprite *);
bool8 LavaridgeGymB1FWarpEffect_Rise(struct Task *, struct ObjectEvent *, struct Sprite *);
bool8 LavaridgeGymB1FWarpEffect_FadeOut(struct Task *, struct ObjectEvent *, struct Sprite *);
bool8 LavaridgeGymB1FWarpEffect_Warp(struct Task *, struct ObjectEvent *, struct Sprite *);

bool8 LavaridgeGymB1FWarpExitEffect_Init(struct Task *, struct ObjectEvent *, struct Sprite *);
bool8 LavaridgeGymB1FWarpExitEffect_StartPopOut(struct Task *, struct ObjectEvent *, struct Sprite *);
bool8 LavaridgeGymB1FWarpExitEffect_PopOut(struct Task *, struct ObjectEvent *, struct Sprite *);
bool8 LavaridgeGymB1FWarpExitEffect_End(struct Task *, struct ObjectEvent *, struct Sprite *);

void StartLavaridgeGym1FWarp(u8);

bool8 LavaridgeGym1FWarpEffect_Init(struct Task *, struct ObjectEvent *, struct Sprite *);
bool8 LavaridgeGym1FWarpEffect_AshPuff(struct Task *, struct ObjectEvent *, struct Sprite *);
bool8 LavaridgeGym1FWarpEffect_Disappear(struct Task *, struct ObjectEvent *, struct Sprite *);
bool8 LavaridgeGym1FWarpEffect_FadeOut(struct Task *, struct ObjectEvent *, struct Sprite *);
bool8 LavaridgeGym1FWarpEffect_Warp(struct Task *, struct ObjectEvent *, struct Sprite *);

void EscapeRopeWarpInEffect_Init(struct Task *);
void EscapeRopeWarpInEffect_Spin(struct Task *);

void TeleportWarpInFieldEffect_Init(struct Task *);
void TeleportWarpInFieldEffect_SpinEnter(struct Task *);
void TeleportWarpInFieldEffect_SpinGround(struct Task *);

void FieldMoveShowMonOutdoorsEffect_Init(struct Task *);
void FieldMoveShowMonOutdoorsEffect_LoadGfx(struct Task *);
void FieldMoveShowMonOutdoorsEffect_CreateBanner(struct Task *);
void FieldMoveShowMonOutdoorsEffect_WaitForMon(struct Task *);
void FieldMoveShowMonOutdoorsEffect_ShrinkBanner(struct Task *);
void FieldMoveShowMonOutdoorsEffect_RestoreBg(struct Task *);
void FieldMoveShowMonOutdoorsEffect_End(struct Task *);

void sub_80884AC(struct Task *);
void sub_80884E8(struct Task *);
void sub_8088554(struct Task *);
void sub_80885A8(struct Task *);
void sub_80885D8(struct Task *);
void sub_808860C(struct Task *);
void sub_808862C(struct Task *);

void sub_8088984(struct Task *);
void sub_80889E4(struct Task *);
void sub_8088A30(struct Task *);
void sub_8088A78(struct Task *);
void sub_8088AF4(struct Task *);

void sub_8088CA0(struct Task *);
void sub_8088CF8(struct Task *);
void sub_8088D3C(struct Task *);
void sub_8088D94(struct Task *);
void sub_8088DD8(struct Task *);
void sub_8088E2C(struct Task *);
void sub_8088EB4(struct Task *);
void sub_8088F10(struct Task *);
void sub_8088F30(struct Task *);

void sub_80892A0(struct Task *);
void sub_8089354(struct Task *);
void sub_80893C0(struct Task *);
void sub_8089414(struct Task *);
void sub_808948C(struct Task *);
void sub_80894C4(struct Task *);
void fishE(struct Task *);

u8 CreateTrainerSprite(u8 trainerSpriteID, s16 x, s16 y, u8 subpriority, u8 *buffer);
void LoadTrainerGfx_TrainerCard(u8 gender, u16 palOffset, u8 *dest);
u8 CreateBirchSprite(s16 x, s16 y, u8 subpriority);
u8 CreateMonSprite_PicBox(u16, s16, s16, u8);
void FreeResourcesAndDestroySprite(struct Sprite *sprite);
void MultiplyInvertedPaletteRGBComponents(u16, u8, u8, u8);
void StartEscapeRopeFieldEffect(void);
void FldEff_TeleportWarpOut(void);
void MultiplyPaletteRGBComponents(u16 i, u8 r, u8 g, u8 b);

extern s32 gFieldEffectArguments[8];

#endif // GUARD_FIELD_EFFECT_H
