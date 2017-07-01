#ifndef GUARD_SCRIPTMENU_H
#define GUARD_SCRIPTMENU_H

struct MultichoiceListStruct
{
    struct MenuAction *list;
    u8 count;
};

extern const struct TextStruct gUnknown_083CE048[];

bool8 sub_80B5054(u8 left, u8 top, u8 var3, u8 var4);
bool8 sub_80B50B0(u8 left, u8 top, u8 var3, u8 var4, u8 var5);
u16 GetStringWidthInTilesForScriptMenu(const u8 *str);
void DrawMultichoiceMenu(u8, u8, u8, struct MenuAction *list, u8, u8);
void sub_80B5230(u8, u8, u8, u8, u8, u8);
void sub_80B52B4(u8);
bool8 Multichoice(u8 var1, u8 var2, u8 var3, u8 var4);
void sub_80B53B4(u8, u8, u8, struct MenuAction *list, u8);
bool8 yes_no_box(u8 var1, u8 var2);
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
