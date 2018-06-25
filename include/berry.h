#ifndef GUARD_BERRY_H
#define GUARD_BERRY_H

#define BERRY_NAME_LENGTH 6
#define BERRY_REGROW_LIMIT 10
#define MAX_BERRY_TREES 128

#define BERRY_NONE 0
#define FIRST_BERRY ITEM_CHERI_BERRY
#define LAST_BERRY  ITEM_ENIGMA_BERRY

#define GETBERRYID(berry) ((berry - FIRST_BERRY) + 1)
#define GETITEMID(berry) ((berry + FIRST_BERRY) - 1)

enum
{
    BERRY_FIRMNESS_UNKNOWN,
    BERRY_FIRMNESS_VERY_SOFT,
    BERRY_FIRMNESS_SOFT,
    BERRY_FIRMNESS_HARD,
    BERRY_FIRMNESS_VERY_HARD,
    BERRY_FIRMNESS_SUPER_HARD,
};

// berry stages
enum
{
    BERRY_STAGE_NO_BERRY, // there is no tree planted and the soil is completely flat.
    BERRY_STAGE_PLANTED,
    BERRY_STAGE_SPROUTED,
    BERRY_STAGE_TALLER,
    BERRY_STAGE_FLOWERING,
    BERRY_STAGE_BERRIES,
    BERRY_STAGE_SPARKLING = 0xFF,
};

void ClearEnigmaBerries(void);
void debug_sub_80C2C18(const u8 *name, u8 holdEffect, u8 holdEffectParam);
void SetEnigmaBerry(u8 *src);
bool32 IsEnigmaBerryValid(void);
const struct Berry *GetBerryInfo(u8 berry);
bool32 EventObjectInteractionWaterBerryTree(void);
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
void EventObjectInteractionGetBerryTreeData(void);
void Berry_FadeAndGoToBerryBagMenu(void);
void EventObjectInteractionPlantBerryTree(void);
void EventObjectInteractionPickBerryTree(void);
void EventObjectInteractionRemoveBerryTree(void);
bool8 PlayerHasBerries(void);
void ResetBerryTreeSparkleFlags(void);
void debug_sub_80C2D24(u8 spicy, u8 dry, u8 sweet, u8 bitter, u8 sour, u8 smoothness);
u8 * DebugOpenBerryInfo(void);

#endif // GUARD_BERRY_H
