#ifndef GUARD_SLOT_MACHINE_H
#define GUARD_SLOT_MACHINE_H

void PlaySlotMachine(u8 arg0, MainCallback cb);
void sub_8104DA4(void);
u8 sub_8105BB4(u8 templateIdx, u8 cbAndCoordsIdx, s16 a2);
void debug_sub_811609C(u8, void (*)(void));

#endif // GUARD_SLOT_MACHINE_H
