#ifndef GUARD_LIBGNCMULTIBOOT_H
#define GUARD_LIBGNCMULTIBOOT_H

struct GcmbStruct
{
    u16 gcmb_field_0;
    u8 gcmb_field_2;
    u8 filler3[0x2C - 0x3];
};

void GameCubeMultiBoot_Main(struct GcmbStruct *pStruct);
void GameCubeMultiBoot_ExecuteProgram(struct GcmbStruct *pStruct);
void GameCubeMultiBoot_Init(struct GcmbStruct *pStruct);
void GameCubeMultiBoot_HandleSerialInterrupt(struct GcmbStruct *pStruct);
void GameCubeMultiBoot_Quit(void);

#endif // GUARD_LIBGNCMULTIBOOT_H
