#ifndef GUARD_BERRY_H
#define GUARD_BERRY_H

void ClearEnigmaBerries(void);
void debug_sub_80C2C18(const u8 *name, u8 holdEffect, u8 holdEffectParam);
void SetEnigmaBerry(u8 *src);
bool32 IsEnigmaBerryValid(void);
const struct Berry *GetBerryInfo(u8 berry);
bool32 ObjectEventInteractionWaterBerryTree(void);
bool8 IsPlayerFacingUnplantedSoil(void);
bool8 TryToWaterBerryTree(void);
void ClearBerryTrees(void);
void BerryTreeTimeUpdate(s32 minutes);
void PlantBerryTree(u8 id, u8 berry, u8 stage, bool8 sparkle);
void RemoveBerryTree(u8 id);
u8 GetBerryTypeByBerryTreeId(u8 id);
u8 GetStageByBerryTreeId(u8);
u8 ItemIdToBerryType(u16 item);
void GetBerryNameByBerryType(u8 berry, u8 *string);
void ResetBerryTreeSparkleFlag(u8 id);
void ObjectEventInteractionGetBerryTreeData(void);
void Berry_FadeAndGoToBerryBagMenu(void);
void ObjectEventInteractionPlantBerryTree(void);
void ObjectEventInteractionPickBerryTree(void);
void ObjectEventInteractionRemoveBerryTree(void);
bool8 PlayerHasBerries(void);
void ResetBerryTreeSparkleFlags(void);
void debug_sub_80C2D24(u8 spicy, u8 dry, u8 sweet, u8 bitter, u8 sour, u8 smoothness);
u8 * DebugOpenBerryInfo(void);

#endif // GUARD_BERRY_H
