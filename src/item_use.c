#include "global.h"
#include "task.h"
#include "item.h"
#include "palette.h"
#include "weather.h"
#include "string_util.h"
#include "menu.h"
#include "mail.h"
#include "asm.h"
#include "rom4.h"
#include "metatile_behavior.h"
#include "field_player_avatar.h"
#include "flag.h"
#include "map_obj_lock.h"
#include "script.h"
#include "field_player_avatar.h"
#include "sound.h"

extern void (* const gUnknown_083D61E4[])();
extern void (* gUnknown_03005D00)(u8);
extern void (* gUnknown_0300485C)(void);

extern void sub_80A5B00(u8);
extern void sub_80A5CC4(void);
extern void sub_80C8FAC(u8);
extern void DisplayItemMessageOnField(u8, u8*, TaskFunc, u16);
extern void sub_80A5C48(u8);
extern void sub_80A5C9C(u8);
extern void ItemUseOutOfBattle_TMHM(u8);
extern void ItemUseOutOfBattle_EvolutionStone(u8);
extern void ItemUseOnFieldCB_Bike(u8);
extern void ItemUseOnFieldCB_Rod(u8);
extern void ItemUseOnFieldCB_Itemfinder(u8);
extern void sub_80A5D04(void);
extern bool8 sub_80E5EF4(void);
extern void GetOnOffBike(u8);
extern bool8 ItemfinderCheckForHiddenItems(struct MapEvents *events, int);
extern void sub_80C9458(u8);
extern void sub_80C9520(u8);
extern u8 sub_80C9908(s16, s16);
extern void sub_80C997C(u8);
extern void sub_80C99EC(u8);
extern void sub_80C9A38(u8);

extern u8 gOtherText_DadsAdvice[];
extern u8 gOtherText_CantGetOffBike[];
extern u8 gOtherText_NoResponse[];

extern u8 gUnknown_083D61F0[];

extern u16 gScriptItemId;

void sub_80C8FAC(u8 taskId)
{
    u8 taskData;

    if(gScriptItemId == 0xAF)
        taskData = gTasks[taskId].data[15] - 1;
    else
        taskData = ItemId_GetType(gScriptItemId) - 1;

    gTasks[taskId].data[8] = (u32)gUnknown_083D61E4[taskData] >> 16;
    gTasks[taskId].data[9] = (u32)gUnknown_083D61E4[taskData];
    gTasks[taskId].func = sub_80A5B00;
}

void unknown_ItemMenu_Confirm(u8 var)
{
	sub_80C8FAC(var);
	BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
}

void sub_80C9038(u8 var)
{
	sub_80C8FAC(var);
	fade_screen(1, 0);
}

void SetUpItemUseOnFieldCallback(u8 taskId)
{
	if(gTasks[taskId].data[2] != 1)
	{
		gUnknown_0300485C = (void *)sub_80A5CC4;
		unknown_ItemMenu_Confirm(taskId);
	}
	else
		gUnknown_03005D00(taskId);
}

void sub_80C9098(u8 var1, u8 var2, const u8 *var3)
{
	StringExpandPlaceholders(gStringVar4, var3);
	
	if(!var2)
	{
		MenuZeroFillWindowRect(0, 13, 13, 20);
		DisplayItemMessageOnField(var1, gStringVar4, sub_80A5C48, 1);
	}
	else
		DisplayItemMessageOnField(var1, gStringVar4, sub_80A5C9C, 0);
}

void DisplayDadsAdviceCannotUseItemMessage(u8 var1, u8 var2)
{
	sub_80C9098(var1, var2, gOtherText_DadsAdvice);
}

void sub_80C9104(u8 var1, u8 var2)
{
	sub_80C9098(var1, var2, gOtherText_CantGetOffBike);
}

u8 CheckIfItemIsTMHMOrEvolutionStone(u16 itemId)
{
	if(ItemId_GetFieldFunc(itemId) == ItemUseOutOfBattle_TMHM)
		return 1;
	else if(ItemId_GetFieldFunc(itemId) == ItemUseOutOfBattle_EvolutionStone)
		return 2;
	else
		return 0;
}

void sub_80C9154(u8 taskId)
{
	struct MailStruct mailStruct;

	if(!gPaletteFade.active)
	{
		mailStruct.var20 = gScriptItemId;
		sub_80F890C(&mailStruct, sub_80A5D04, 0);
		DestroyTask(taskId);
	}
}

void ItemUseOutOfBattle_Mail(u8 taskId)
{
	BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
	gTasks[taskId].func = sub_80C9154;
}

void ItemUseOutOfBattle_Bike(u8 taskId)
{
	s16 x, y;
	u8 tileBehavior;
	
	PlayerGetDestCoords(&x, &y);
	tileBehavior = MapGridGetMetatileBehaviorAt(x, y);
	
	if(FlagGet(0x82B) == TRUE
		|| MetatileBehavior_IsVerticalRail(tileBehavior) == TRUE
		|| MetatileBehavior_IsHorizontalRail(tileBehavior) == TRUE
		|| MetatileBehavior_IsIsolatedVerticalRail(tileBehavior) == TRUE
		|| MetatileBehavior_IsIsolatedHorizontalRail(tileBehavior) == TRUE)
	{
		sub_80C9104(taskId, gTasks[taskId].data[2]);
	}
	else
	{
		if(sub_8053C44() == TRUE && sub_80E5EF4() == FALSE)
		{
			gUnknown_03005D00 = (void *)ItemUseOnFieldCB_Bike;
			SetUpItemUseOnFieldCallback(taskId);
		}
		else
			DisplayDadsAdviceCannotUseItemMessage(taskId, gTasks[taskId].data[2]);
	}
}

void ItemUseOnFieldCB_Bike(u8 taskId)
{
	if(ItemId_GetSecondaryId(gScriptItemId) == 0)
		GetOnOffBike(2);
	if(ItemId_GetSecondaryId(gScriptItemId) == 1)
		GetOnOffBike(4);
	
	sub_8064E2C();
	ScriptContext2_Disable();
	DestroyTask(taskId);
}

bool32 CanFish(void)
{
    s16 x, y;
    u16 tileBehavior;

    GetXYCoordsOneStepInFrontOfPlayer(&x, &y);
    tileBehavior = MapGridGetMetatileBehaviorAt(x, y);

    if (MetatileBehavior_IsWaterfall(tileBehavior))
        return FALSE;

    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_4))
        return FALSE;

    if (!TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
    {
        if (IsPlayerFacingSurfableFishableWater())
            return TRUE;
    }
    else
    {
        if (MetatileBehavior_IsSurfableWaterOrUnderwater(tileBehavior) && !MapGridIsImpassableAt(x, y))
            return TRUE;
        if (MetatileBehavior_IsBridge(tileBehavior) == TRUE)
            return TRUE;
    }

    return FALSE;
}

void ItemUseOutOfBattle_Rod(u8 taskId)
{
	if(CanFish() == TRUE)
	{
		gUnknown_03005D00 = (void *)ItemUseOnFieldCB_Rod;
		SetUpItemUseOnFieldCallback(taskId);
	}
	else
		DisplayDadsAdviceCannotUseItemMessage(taskId, gTasks[taskId].data[2]);
}

void ItemUseOnFieldCB_Rod(u8 taskId)
{
	StartFishing(ItemId_GetSecondaryId(gScriptItemId));
	DestroyTask(taskId);
}

void ItemUseOutOfBattle_Itemfinder(u8 var)
{
	sav12_xor_increment(0x27);
	gUnknown_03005D00 = (void *)ItemUseOnFieldCB_Itemfinder;
	SetUpItemUseOnFieldCallback(var);
}

void ItemUseOnFieldCB_Itemfinder(u8 taskId)
{
    if(ItemfinderCheckForHiddenItems(gMapHeader.events, taskId) == TRUE)
        gTasks[taskId].func = sub_80C9458;
    else
        DisplayItemMessageOnField(taskId, gOtherText_NoResponse, sub_80C9520, 0);
}

void sub_80C9458(u8 taskId)
{
    u8 var;
    u8 playerDir;
    u8 i;
    s16 *data = gTasks[taskId].data;

    if(!data[3])
    {
        if(data[4] == 4)
        {
            var = sub_80C9908(data[0], data[1]);
            if(var)
            {
                sub_80C997C(gUnknown_083D61F0[var - 1]);
                gTasks[taskId].func = sub_80C99EC;
            }
            else
            {
                playerDir = player_get_direction_lower_nybble();

                for (i = 0; i < 4; i++)
                    if (playerDir == gUnknown_083D61F0[i])
                        data[5] = (i + 1) & 3;

                gTasks[taskId].func = sub_80C9A38;
                data[3] = 0;
                data[2] = 0;
            }
			return;
        }
        PlaySE(0x48);
        data[4]++;
    }
    data[3] = (data[3] + 1) & 0x1F;
}

void sub_80C9520(u8 taskId)
{
	MenuZeroFillWindowRect(0, 14, 29, 19);
	sub_8064E2C();
	ScriptContext2_Disable();
	DestroyTask(taskId);
}
