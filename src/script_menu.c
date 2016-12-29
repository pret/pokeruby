#include "global.h"
#include "task.h"
#include "text.h"
#include "menu.h"

struct MultichoiceStruct
{
	u8 *textPtr;
	u8 var;
};

struct MultichoiceListStruct
{
	struct MultichoiceStruct *list;
	u8 count;
};

extern struct MultichoiceListStruct gMultichoiceLists[];

extern void sub_80B52B4(u8);
extern void DrawMultichoiceMenu(u8, u8, u8, struct MultichoiceStruct *list, int, int);

extern u16 gScriptResult;

bool8 sub_80B5054(u8 var1, u8 var2, u8 var3, u8 var4)
{
	if(FuncIsActiveTask(sub_80B52B4) == 1)
		return FALSE;
	else
	{
		gScriptResult = 0xFF;
		DrawMultichoiceMenu(var1, var2, gMultichoiceLists[var3].count, gMultichoiceLists[var3].list, var4, 0);
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
        DrawMultichoiceMenu(var1, var2, gMultichoiceLists[var3].count, gMultichoiceLists[var3].list, var4, var5);
        return TRUE;
    }
}

u8 GetStringWidthInTilesForScriptMenu(u8 *str)
{
	// each tile on screen is 8x8, so it needs the number of tiles and not pixels, hence the division by 8.
    return (GetStringWidthGivenWindowConfig((struct WindowConfig *)&gWindowConfig_81E6CE4, str) + 7) / 8;
}
