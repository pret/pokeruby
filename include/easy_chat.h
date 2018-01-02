#ifndef GUARD_EASYCHAT_H
#define GUARD_EASYCHAT_H

extern u8 gUnknown_020388AC;

void sub_80E62A0(u8 arg0, u16 *arg1, void *arg2, u8 arg3);
u16 sub_80EB72C(u16 group);
void sub_80EB6FC(u16 *, u16);
void InitEasyChatPhrases(void);
u8 sub_80EAD7C(u8 group);
u16 sub_80EAE88(u8);
u8 sub_80EB37C(u16);
u8* EasyChat_GetWordText(u8 *, u16);
u8 *ConvertEasyChatWordsToString(u8 *dst, u16 *words, u16, u16);
u16 sub_80EB784(u16 group);
u8 sub_80EB868(u8);
void sub_80EB890(u8);
u8 sub_80EB8C0(void);
u16 sub_80EB8EC(void);
u8 *sub_80EB544(u8 *dst, u16 *words, u16 arg2, u16 arg3);

#if GERMAN
u32 de_sub_80EB748(u32, u32);
#endif

#endif // GUARD_EASYCHAT_H
