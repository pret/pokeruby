#ifndef GUARD_START_MENU_H
#define GUARD_START_MENU_H

extern u8 (*gMenuCallback)(void);

//Public functions
void CreateStartMenuTask(void (*func)(u8));
void sub_80712B4(u8 taskId);
void sub_8071310(void);
void SaveGame(void);
void sub_8071B28(void);
void debug_sub_8075DB4(struct BattleTowerEReaderTrainer *ereaderTrainer, const u8 *b, u32 trainerId);
bool8 debug_sub_8075C30(void);

#if DEBUG
extern u32 gUnknown_Debug_03004BD0;
#endif // DEBUG

#endif // GUARD_START_MENU_H
