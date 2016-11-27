#ifndef GUARD_LIBGNCMULTIBOOT_H
#define GUARD_LIBGNCMULTIBOOT_H

#include "gba/types.h"

struct GcmbStruct
{
	u16 gcmb_field_0;
	u8 gcmb_field_2;
};

void GameCubeMultiBoot_Main(struct GcmbStruct *pStruct);
void GameCubeMultiBoot_ExecuteProgram(struct GcmbStruct *pStruct);
void GameCubeMultiBoot_Init(struct GcmbStruct *pStruct);
void GameCubeMultiBoot_HandleSerialInterrupt(struct GcmbStruct *pStruct);
void GameCubeMultiBoot_Quit();

#endif // GUARD_LIBGNCMULTIBOOT_H
