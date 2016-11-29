#ifndef GUARD_WILD_ENCOUNTER_H
#define GUARD_WILD_ENCOUNTER_H

#include "gba/types.h"

void DisableWildEncounters(bool8 disabled);
bool8 StandardWildEncounter(u16 a, u16 b);
void RockSmashWildEncounter(void);
bool8 SweetScentWildEncounter(void);
bool8 GetFishingWildMonListHeader(void);
void FishingWildEncounter(u8 rod);
u16 GetLocalWildMon(bool8 *isWaterMon);
u16 GetMirageIslandMon(void);
bool8 UpdateRepelCounter(void);

#endif // GUARD_WILD_ENCOUNTER_H
