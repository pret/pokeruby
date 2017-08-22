#ifndef GUARD_BATTLE_MESSAGE_H
#define GUARD_BATTLE_MESSAGE_H

void BufferStringBattle(u16 stringID);
u32 StrCpyDecodeToDisplayedStringBattle(const u8* src);
u32 StrCpyDecodeBattle(const u8* src, u8* dst);

#endif // GUARD_BATTLE_MESSAGE_H
