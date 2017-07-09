#ifndef GUARD_CABLE_CLUB_H
#define GUARD_CABLE_CLUB_H

#include "task.h"

void sub_8082D4C();
void sub_8082D60(u8, u8);
u16 sub_8082D9C(u8, u8);
u32 sub_8082DF4(u8);
u32 sub_8082E28(u8);
u32 sub_8082EB8(u8);
void sub_8082FEC(u8 taskId);
void sub_80833C4(u8 taskId);
void sub_8083418(u8 taskId);
u8 sub_8083444(u8 taskId);
u8 sub_8083664(void);
void sub_8083A84(TaskFunc);
s32 sub_8083BF4(u8 id);
void sub_8083C50(u8);
void sub_8083188(u8 taskId);

#ifdef DEBUG
void debug_sub_808B838(u8);
#endif

#endif // GUARD_CABLE_CLUB_H
