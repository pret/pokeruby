#ifndef GUARD_SCRIPTMENU_H
#define GUARD_SCRIPTMENU_H

struct MenuAction;

extern const u8 *const gUnknown_083CE048[];

bool8 ScriptMenu_Multichoice(u8 left, u8 top, u8 var3, u8 var4);
bool8 ScriptMenu_MultichoiceWithDefault(u8 left, u8 top, u8 var3, u8 var4, u8 var5);
u16 GetStringWidthInTilesForScriptMenu(const u8 *str);
void DrawMultichoiceMenu(u8, u8, u8, const struct MenuAction *list, u8, u8);
void StartScriptMenuTask(u8, u8, u8, u8, u8, u8);
void Task_HandleMenuInput(u8);
bool8 Multichoice(u8 var1, u8 var2, u8 var3, u8 var4);
void sub_80B53B4(u8, u8, u8, const struct MenuAction *list, u8);
bool8 ScriptMenu_YesNo(u8 var1, u8 var2);
bool8 IsScriptActive(void); // unused
void task_yes_no_maybe(u8);
bool8 sub_80B5578(u8 left, u8 top, u8 multichoiceId, u8 a4, u8 columnCount);
void sub_80B5684(u8);
bool8 TryCreatePCMenu(void);
void CreatePCMenu(void);
void sub_80B5838(void);
void task_picbox(u8 taskId);
bool8 sub_80B58C4(u16 var1, u8 var2, u8 var3);
void *picbox_close(void);
bool8 sub_80B59AC(void);

#endif
