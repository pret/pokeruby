#ifndef GUARD_FIELDCONTROLAVATAR_H
#define GUARD_FIELDCONTROLAVATAR_H

struct FieldInput
{
    u8 pressedAButton:1;
    u8 checkStandardWildEncounter:1;
    u8 pressedStartButton:1;
    u8 pressedSelectButton:1;
    u8 input_field_0_4:1;
    u8 input_field_0_5:1;
    u8 tookStep:1;
    u8 pressedBButton:1;
    u8 input_field_1_0:1;
    u8 input_field_1_1:1;
    u8 input_field_1_2:1;
    u8 input_field_1_3:1;
    u8 input_field_1_4:1;
    u8 input_field_1_5:1;
    u8 input_field_1_6:1;
    u8 input_field_1_7:1;
    u8 dpadDirection;
    u8 input_field_3;
};

void ClearPlayerFieldInput(struct FieldInput *pStruct);
void GetPlayerFieldInput(struct FieldInput *pStruct, u16 keys, u16 heldKeys);
int ProcessPlayerFieldInput(struct FieldInput *pStruct);
u8 *GetInteractedLinkPlayerScript(struct MapPosition *, u8, u8);
void ClearPoisonStepCounter(void);
void RestartWildEncounterImmunitySteps(void);
u8 *GetCoordEventScriptAtMapPosition(struct MapPosition *);
u8 *GetEventObjectScriptPointerPlayerFacing(void);
u8 TrySetDiveWarp(void);
bool8 dive_warp(struct MapPosition*, u16);

#endif
