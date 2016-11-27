#ifndef GUARD_SAFARI_ZONE_H
#define GUARD_SAFARI_ZONE_H

#include "gba/types.h"

bool32 GetSafariZoneFlag();
void SetSafariZoneFlag();
void ResetSafariZoneFlag();

void EnterSafariMode();
void ExitSafariMode();

bool8 SafariZoneTakeStep();
void SafariZoneRetirePrompt();
void sub_80C824C();

void SafariZoneGetPokeblockNameInFeeder();
struct Pokeblock *unref_sub_80C8418();
struct Pokeblock *SafariZoneGetActivePokeblock();
void SafariZoneActivatePokeblockFeeder(u8 pokeblock_index);
bool8 unref_sub_80C853C();

#endif // GUARD_SAFARI_ZONE_H
