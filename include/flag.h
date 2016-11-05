#ifndef GUARD_FLAG_H
#define GUARD_FLAG_H

u8 *GetFlagPointer(u16 id);
u8 FlagSet(u16 id);
u8 FlagReset(u16 id);
bool8 FlagGet(u16 id);

#endif // GUARD_FLAG_H
