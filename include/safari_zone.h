#ifndef GUARD_SAFARI_ZONE_H
#define GUARD_SAFARI_ZONE_H

extern u8 gNumSafariBalls;
extern u16 gSafariZoneStepCounter;

bool32 GetSafariZoneFlag(void);
void SetSafariZoneFlag(void);
void ResetSafariZoneFlag(void);

void EnterSafariMode(void);
void ExitSafariMode(void);

bool8 SafariZoneTakeStep(void);
void SafariZoneRetirePrompt(void);
void sub_80C824C(void);

void SafariZoneGetPokeblockNameInFeeder(void);
struct Pokeblock *unref_sub_80C8418(void);
struct Pokeblock *SafariZoneGetActivePokeblock(void);
void SafariZoneActivatePokeblockFeeder(u8 pokeblock_index);
bool32 debug_sub_80C853C(void);

#endif // GUARD_SAFARI_ZONE_H
