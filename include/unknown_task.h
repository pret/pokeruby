#ifndef GUARD_UNKNOWN_TASK_H
#define GUARD_UNKNOWN_TASK_H

struct UnknownTaskStruct
{
    volatile void *dest;
    u32 control;
    u8 unk8;
    u8 unk9;
};

struct UnknownTaskStruct2
{
    void *src[2];
    volatile void *dest;
    u32 unkC;
    void (*unk10)(void);
    u8 srcBank;
    u8 unk15;
    u8 unk16;
    u8 unk17;
    u8 taskId;
    u8 filler19[0x7];
};

extern struct UnknownTaskStruct2 gUnknown_03004DC0;

extern u16 gUnknown_03004DE0[][0x3C0];

void remove_some_task(void);
void remove_some_task(void);
void dp12_8087EA4(void);
void dp12_8087EA4(void);
//void sub_80895F8(u32 i, u32 i1, u32 i2);
//void sub_80895F8();
void sub_80895F8(struct UnknownTaskStruct unk);
void sub_8089668(void);
void sub_8089668();
//void sub_8089944(int i, int i1, int i2, int i3, int i4, int i5, int i6);
u8 sub_8089944(u8 a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, u8 a7);

#endif // GUARD_UNKNOWN_TASK_H
