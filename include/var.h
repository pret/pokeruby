#ifndef GUARD_VAR_H
#define GUARD_VAR_H

#include "vars.h"

u16 *GetVarPointer(u16 id);
u16 VarGet(u16 id);
bool8 VarSet(u16 id, u16 value);
u8 VarGetFieldObjectGraphicsId(u8 id);

#endif // GUARD_VAR_H
