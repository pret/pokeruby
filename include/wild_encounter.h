#ifndef GUARD_WILD_ENCOUNTER_H
#define GUARD_WILD_ENCOUNTER_H

#include "gba/types.h"

void DisableWildEncounters(bool8 disabled);
bool8 StandardWildEncounter(u16 a, u16 b);
void RockSmashWildEncounter();
bool8 SweetScentWildEncounter();
bool8 GetFishingWildMonListHeader();
void FishingWildEncounter(u8 rod);
u16 GetLocalWildMon(bool8 *isWaterMon);
u16 GetMirageIslandMon();
bool8 UpdateRepelCounter();

#endif // GUARD_WILD_ENCOUNTER_H
