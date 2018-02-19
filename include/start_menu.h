#ifndef GUARD_STARTER_CHOOSE_H
#define GUARD_STARTER_CHOOSE_H

extern u8 (*gMenuCallback)(void);

//Public functions
void CreateStartMenuTask(void (*func)(u8));
void sub_80712B4(u8 taskId);
void sub_8071310(void);
void ScrSpecial_DoSaveDialog(void);
void sub_8071B28(void);

#endif // GUARD_STARTER_CHOOSE_H
