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
#include "event_data.h"
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

bool8 ItemfinderCheckForHiddenItems(struct MapEvents *events, int);

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
		mailStruct.itemId = gScriptItemId;
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

// too much struct math.
__attribute__((naked))
bool8 ItemfinderCheckForHiddenItems(struct MapEvents *events, int var)
{
	asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r9\n\
	mov r6, r8\n\
	push {r6,r7}\n\
	sub sp, 0x4\n\
	adds r5, r0, 0\n\
	lsls r1, 24\n\
	lsrs r6, r1, 24\n\
	mov r4, sp\n\
	adds r4, 0x2\n\
	mov r0, sp\n\
	adds r1, r4, 0\n\
	bl PlayerGetDestCoords\n\
	ldr r1, _080C9618 @ =gTasks\n\
	lsls r0, r6, 2\n\
	adds r0, r6\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	movs r1, 0\n\
	strh r1, [r0, 0xC]\n\
	movs r3, 0\n\
	mov r9, r4\n\
	ldrb r0, [r5, 0x3]\n\
	cmp r3, r0\n\
	bge _080C95FC\n\
	subs r1, 0x5\n\
	mov r8, r1\n\
_080C9580:\n\
	lsls r3, 16\n\
	asrs r1, r3, 16\n\
	ldr r2, [r5, 0x10]\n\
	lsls r0, r1, 1\n\
	adds r0, r1\n\
	lsls r4, r0, 2\n\
	adds r1, r4, r2\n\
	ldrb r0, [r1, 0x5]\n\
	adds r7, r3, 0\n\
	cmp r0, 0x7\n\
	bne _080C95EC\n\
	movs r2, 0x96\n\
	lsls r2, 2\n\
	adds r0, r2, 0\n\
	ldrh r1, [r1, 0xA]\n\
	adds r0, r1\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	bl FlagGet\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	bne _080C95EC\n\
	ldr r1, [r5, 0x10]\n\
	adds r1, r4, r1\n\
	ldrh r2, [r1]\n\
	adds r2, 0x7\n\
	mov r0, sp\n\
	ldrh r0, [r0]\n\
	subs r2, r0\n\
	ldrh r0, [r1, 0x2]\n\
	adds r0, 0x7\n\
	mov r3, r9\n\
	ldrh r1, [r3]\n\
	subs r0, r1\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	lsls r2, 16\n\
	asrs r1, r2, 16\n\
	movs r3, 0xE0\n\
	lsls r3, 11\n\
	adds r2, r3\n\
	lsrs r2, 16\n\
	cmp r2, 0xE\n\
	bhi _080C95EC\n\
	lsls r0, 16\n\
	asrs r2, r0, 16\n\
	cmp r2, r8\n\
	blt _080C95EC\n\
	cmp r2, 0x5\n\
	bgt _080C95EC\n\
	adds r0, r6, 0\n\
	bl sub_80C9838\n\
_080C95EC:\n\
	movs r1, 0x80\n\
	lsls r1, 9\n\
	adds r0, r7, r1\n\
	lsrs r3, r0, 16\n\
	asrs r0, 16\n\
	ldrb r2, [r5, 0x3]\n\
	cmp r0, r2\n\
	blt _080C9580\n\
_080C95FC:\n\
	adds r0, r6, 0\n\
	bl sub_80C9720\n\
	ldr r0, _080C9618 @ =gTasks\n\
	lsls r1, r6, 2\n\
	adds r1, r6\n\
	lsls r1, 3\n\
	adds r1, r0\n\
	movs r3, 0xC\n\
	ldrsh r0, [r1, r3]\n\
	cmp r0, 0x1\n\
	beq _080C961C\n\
	movs r0, 0\n\
	b _080C961E\n\
	.align 2, 0\n\
_080C9618: .4byte gTasks\n\
_080C961C:\n\
	movs r0, 0x1\n\
_080C961E:\n\
	add sp, 0x4\n\
	pop {r3,r4}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	pop {r4-r7}\n\
	pop {r1}\n\
	bx r1\n\
	.syntax divided");
}
