#ifndef GUARD_MATSUDADEBUG_H
#define GUARD_MATSUDADEBUG_H

#define BIT(n) (1 << (n))

void sub_80AA280(u8);
void sub_80AA5E8(u8);
void sub_80AA658(u8);
u8 MatsudaDebugMenu_Contest(void);
u8 MatsudaDebugMenu_ContestResults(void);
u8 MatsudaDebugMenu_ContestComm(void);
u8 MatsudaDebugMenu_CommTest(void);
u8 MatsudaDebugMenu_SetHighScore(void);
u8 MatsudaDebugMenu_ResetHighScore(void);
u8 MatsudaDebugMenu_SetArtMuseumItems(void);
void sub_80AA754(struct Sprite *sprite);
void sub_80AA8C8(struct Sprite *, s8);
void sub_80AA8D8(struct Sprite *, s8);
void sub_80AA8E8(struct Sprite *, s8);
void sub_80AA8F8(struct Sprite *, s8);
void sub_80AAC5C(struct Sprite *, s8);
void sub_80AAC5C(struct Sprite *, s8);
void sub_80AA930(struct Sprite *, s8);
void sub_80AA974(struct Sprite *, s8);
void sub_80AA9B8(struct Sprite *, s8);
void sub_80AA9FC(struct Sprite *, s8);
void sub_80AAA40(struct Sprite *, s8);
void sub_80AAA84(struct Sprite *, s8);
void sub_80AAAF0(struct Sprite *, s8);
void sub_80AAB30(struct Sprite *, s8);
void sub_80AAB70(struct Sprite *, s8);
void sub_80AABB0(struct Sprite *, s8);
void sub_80AABF0(struct Sprite *, s8);
void sub_80AAD44(struct Sprite *, s8);

#endif
