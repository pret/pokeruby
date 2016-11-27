#ifndef GUARD_RECORD_MIXING_H
#define GUARD_RECORD_MIXING_H

#include "gba/types.h"
#include <stddef.h>

void sub_80B929C();
void sub_80B92AC();
void sub_80B93B0(u32 a);
void sub_80B9450(u8 taskId);
void sub_80B9484(u8 taskId);
void sub_80B95F0(u8 taskId);
void sub_80B97DC(u8 taskId);
void Task_CopyRecvBuffer(u8 taskId);
void sub_80B99B4(u8 taskId);
void sub_80B99E8(u8 taskId);
void sub_80B9A1C(u8 taskId);
void *LoadPtrFromTaskData(u16 *ptr);
void StorePtrInTaskData(void *ptr, u16 *data);
u8 GetMultiplayerId_();
u16 *GetPlayerRecvBuffer(u8 player);
void sub_80B9A78();
void sub_80B9A88(u8 *a);
void sub_80B9B1C(u8 *a, size_t size, u8 index);
void sub_80B9B70(u8 *a, size_t size, u8 index);
u8 sub_80B9BBC(u16 *a);
void sub_80B9BC4(u32 a, u32 b, u32 c, u32 d);
u8 sub_80B9C4C(u8 *a);

// ASM
void sub_80B9C6C(void *, u32, u8, void *);
void sub_80B9F3C(void *, u8);
void sub_80BA00C(u8);

#endif // GUARD_RECORD_MIXING_H
