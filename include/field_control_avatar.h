#ifndef GUARD_FIELDCONTROLAVATAR_H
#define GUARD_FIELDCONTROLAVATAR_H

#include "asm.h"

void FieldClearPlayerInput(struct FieldInput *pStruct);
void FieldGetPlayerInput(struct FieldInput *pStruct, u16 keys, u16 heldKeys);
int sub_8068024(struct FieldInput *pStruct);
u8 *sub_80682A8(struct MapPosition *, u8, u8);
void overworld_poison_timer_set(void);
void prev_quest_postbuffer_cursor_backup_reset(void);
u8 *sub_8068E24(struct MapPosition *);
u8 *GetFieldObjectScriptPointerForComparison();

#endif
