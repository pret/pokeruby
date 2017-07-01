#ifndef GUARD_SAVE_MENU_UTIL_H
#define GUARD_SAVE_MENU_UTIL_H

void HandleDrawSaveWindowInfo(s16 left, s16 top);
void HandleCloseSaveWindow(u16 left, u16 top);
u8 IsResizeSaveWindowEnabled(void);
void PrintSavePlayerName(s16 x, s16 y);
void PrintSaveMapName(s16 x, s16 y);
void PrintSaveBadges(s16 x, s16 y);
void PrintSavePokedexCount(s16 x, s16 y);
void PrintSavePlayTime(s16 x, s16 y);
u8 GetBadgeCount(void);
u16 GetPokedexSeenCount(void);
void FormatPlayTime(char *playtime, u16 hours, u16 minutes, bool16 colon);

#endif // GUARD_SAVE_MENU_UTIL_H
