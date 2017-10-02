#ifndef GUARD_POKEMON_ICON_H
#define GUARD_POKEMON_ICON_H

u8 CreateMonIcon(u16, void (*callback)(struct Sprite *), s16, s16, bool8, u32);
u8 sub_809D3A4(u16 arg0, void (*)(struct Sprite *), int, u8 arg3, u32 arg4);
u16 GetUnownLetterByPersonality(u32);
u16 sub_809D4A8(u16);
void sub_809D510(struct Sprite *);
void sub_809D51C(void);
void sub_809D580(u16);
void sub_809D608(u16);
void UpdateMonIconFrame(struct Sprite *sprite);
void sub_809D824(struct Sprite *, u8);
void sub_809D62C(struct Sprite *);

#endif // GUARD_POKEMON_ICON_H
