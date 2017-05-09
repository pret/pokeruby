#ifndef GUARD_DEWFORDTREND_H
#define GUARD_DEWFORDTREND_H

#define ARRAY_2007800 ((struct EasyChatPair *)(unk_2000000 + 0x7800))
#define ARRAY_2007900 ((struct EasyChatPair *)(unk_2000000 + 0x7900))

void InitDewfordTrends(void);
void sub_80FA4E4(void *, u32, u8);

#endif
