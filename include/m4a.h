#ifndef GUARD_M4A_H
#define GUARD_M4A_H

#include "gba/m4a_internal.h"

void m4aSoundInit();
void m4aSoundMain();
void m4aSongNumStart(u16 n);
void m4aSoundVSync();

void m4aMPlayContinue(struct MusicPlayerInfo *mplayInfo);

#endif //GUARD_M4A_H
