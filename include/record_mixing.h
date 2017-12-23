#ifndef GUARD_RECORD_MIXING_H
#define GUARD_RECORD_MIXING_H

#include <stddef.h>

void sub_80B929C(void);
void RecordMixing_PrepareExchangePacket(void);
void RecordMixing_ReceiveExchangePacket(u32 a);
void Task_RecordMixing_SoundEffect(u8 taskId);
void Task_RecordMixing_Main(u8 taskId);
void sub_80B95F0(u8 taskId);
void Task_RecordMixing_SendPacket(u8 taskId);
void Task_RecordMixing_CopyReceiveBuffer(u8 taskId);
void sub_80B99B4(u8 taskId);
void Task_RecordMixing_ReceivePacket(u8 taskId);
void Task_RecordMixing_SendPacket_SwitchToReceive(u8 taskId);
void *LoadPtrFromTaskData(u16 *);
void StorePtrInTaskData(void *, u16 *);
u8 GetMultiplayerId_(void);
u16 *GetPlayerRecvBuffer(u8 player);
void sub_80B9A78(void);
void sub_80B9A88(u8 *a);
void sub_80B9B1C(u8 *a, size_t size, u8 index);
void sub_80B9B70(void *a, u32 size, u8 index);
u8 sub_80B9BBC(u16 *a);
void sub_80B9BC4(u8 *, size_t, u8[][2], u8 d, u8 e);
u8 sub_80B9C4C(u8 *a);

// ASM
void sub_80B9C6C(u8 *, u32, u8, void *);
void sub_80B9F3C(u16 *, u8);
void sub_80BA00C(u8);

#endif // GUARD_RECORD_MIXING_H
