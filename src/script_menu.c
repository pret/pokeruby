#include "global.h"
#include "task.h"
#include "text.h"
#include "menu.h"

extern void sub_80B52B4(u8);
extern void DrawMultichoiceMenu(u8, u8, u8, u8 *, int, int);

struct MultichoiceStruct
{
	u8 *textPtr;
	u8 var;
};

extern struct MultichoiceStruct gMultichoiceLists[];

extern u16 gScriptResult;

bool8 sub_80B5054(u8 var1, u8 var2, u8 var3, u8 var4)
{
	if(FuncIsActiveTask(sub_80B52B4) == 1)
		return FALSE;
	else
	{
		gScriptResult = 0xFF;
		DrawMultichoiceMenu(var1, var2, gMultichoiceLists[var3].var, gMultichoiceLists[var3].textPtr, var4, 0);
		return TRUE;
	}
}

bool8 sub_80B50B0(u8 var1, u8 var2, u8 var3, u8 var4, u8 var5)
{
    if(FuncIsActiveTask(sub_80B52B4) == 1)
        return FALSE;
    else
    {
        gScriptResult = 0xFF;
        DrawMultichoiceMenu(var1, var2, gMultichoiceLists[var3].var, gMultichoiceLists[var3].textPtr, var4, var5);
        return TRUE;
    }
}

u8 GetStringWidthInTilesForScriptMenu(u8 *str)
{
    return (GetStringWidthGivenWindowConfig((struct WindowConfig *)&gWindowConfig_81E6CE4, str) + 7) / 8;
}
