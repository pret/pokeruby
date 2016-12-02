#ifndef GUARD_BERRY_H
#define GUARD_BERRY_H

void unref_sub_80B4884(void);
void sub_80B48A8(u8 *src);
u32 sub_80B48F8(struct EnigmaBerry *enigmaBerry);
bool32 sub_80B4940(void);
struct Berry *GetBerryInfo(u8 berry);
struct BerryTree *GetBerryTreeInfo(u8 id);
bool32 FieldObjectInteractionWaterBerryTree(void);
bool32 IsPlayerFacingPlantedBerryTree(void);
u8 WaterBerryTree(void);
void sub_80B4A90(void);
bool32 BerryTreeGrow(struct BerryTree *tree);
void BerryTreeTimeUpdate(int time);
void PlantBerryTree(u8 id, u8 berry, u8 stage, bool8 sparkle);
void RemoveBerryTree(u8 id);
u8 GetBerryTypeByBerryTreeId(u8 id);
u8 GetStageByBerryTreeId(u8);
u8 ItemIdToBerryType(u16 item);
u16 BerryTypeToItemId(u16 berry);
void GetBerryNameByBerryType(u8 berry, u8 *string);
void ResetBerryTreeSparkleFlag(u8 id);
u8 BerryTreeGetNumStagesWatered(struct BerryTree *tree);
u8 GetNumStagesWateredByBerryTreeId(u8 id);
u8 CalcBerryYieldInternal(u16 max, u16 min, u8 water);
u8 CalcBerryYield(struct BerryTree *tree);
u8 GetBerryCountByBerryTreeId(u8 id);
u16 GetStageDurationByBerryType(u8);
void FieldObjectInteractionGetBerryTreeData(void);
void sub_80B4EE4(void);
void FieldObjectInteractionPlantBerryTree(void);
void FieldObjectInteractionPickBerryTree(void);
void FieldObjectInteractionRemoveBerryTree(void);
u8 PlayerHasBerries(void);
void ResetBerryTreeSparkleFlags(void);

#endif // GUARD_BERRY_H
