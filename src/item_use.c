#include "global.h"
#include "asm.h"
#include "event_data.h"
#include "field_player_avatar.h"
#include "field_player_avatar.h"
#include "item.h"
#include "mail.h"
#include "map_obj_lock.h"
#include "menu.h"
#include "metatile_behavior.h"
#include "palette.h"
#include "rom4.h"
#include "script.h"
#include "songs.h"
#include "sound.h"
#include "string_util.h"
#include "task.h"
#include "weather.h"
#include "fieldmap.h"

extern void (* const gExitToOverworldFuncList[])();
extern void (* gUnknown_03005D00)(u8);
extern void (* gUnknown_0300485C)(void);

extern void HandleItemMenuPaletteFade(u8);
extern void ExecuteItemUseFromBlackPalette(void);
extern void DisplayItemMessageOnField(u8, u8*, TaskFunc, u16);
extern void CleanUpItemMenuMessage(u8);
extern void CleanUpOverworldMessage(u8);
extern void ItemUseOutOfBattle_TMHM(u8);
extern void ItemUseOutOfBattle_EvolutionStone(u8);
extern void ItemUseOnFieldCB_Bike(u8);
extern void ItemUseOnFieldCB_Rod(u8);
extern void ItemUseOnFieldCB_Itemfinder(u8);
extern void sub_80A5D04(void);
extern bool8 IsBikingDisallowedByPlayer(void);
extern void GetOnOffBike(u8);
extern u8 GetPlayerDirectionTowardsHiddenItem(s16, s16);
extern void SetPlayerDirectionTowardsItem(u8);
extern void DisplayItemRespondingMessageAndExitItemfinder(u8);
extern void RotatePlayerAndExitItemfinder(u8);
extern void sub_80C9838(u8, s16, s16);

extern u8 gOtherText_DadsAdvice[];
extern u8 gOtherText_CantGetOffBike[];
extern u8 gOtherText_NoResponse[];

extern u8 gItemFinderDirections[];

extern u16 gScriptItemId;

bool8 ItemfinderCheckForHiddenItems(struct MapEvents *events, u8 taskId);
void RunItemfinderResults(u8);
void ExitItemfinder(u8);
void sub_80C9720(u8);

void ExecuteSwitchToOverworldFromItemUse(u8 taskId)
{
    u8 taskData;

    if (gScriptItemId == 0xAF)
        taskData = gTasks[taskId].data[15] - 1;
    else
        taskData = ItemId_GetType(gScriptItemId) - 1;

    gTasks[taskId].data[8] = (u32)gExitToOverworldFuncList[taskData] >> 16;
    gTasks[taskId].data[9] = (u32)gExitToOverworldFuncList[taskData];
    gTasks[taskId].func = HandleItemMenuPaletteFade;
}

void ItemMenu_ConfirmNormalFade(u8 var)
{
    ExecuteSwitchToOverworldFromItemUse(var);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
}

void ItemMenu_ConfirmComplexFade(u8 var)
{
    ExecuteSwitchToOverworldFromItemUse(var);
    fade_screen(1, 0);
}

void SetUpItemUseOnFieldCallback(u8 taskId)
{
    if (gTasks[taskId].data[2] != 1)
    {
        gUnknown_0300485C = (void *)ExecuteItemUseFromBlackPalette;
        ItemMenu_ConfirmNormalFade(taskId);
    }
    else
        gUnknown_03005D00(taskId);
}

void HandleDeniedItemUseMessage(u8 var1, u8 playerMenuStatus, const u8 *text)
{
    StringExpandPlaceholders(gStringVar4, text);

    switch (playerMenuStatus)
    {
        case 0: // Item Menu
            MenuZeroFillWindowRect(0, 13, 13, 20);
            DisplayItemMessageOnField(var1, gStringVar4, CleanUpItemMenuMessage, 1);
            break;
        default: // Field
            DisplayItemMessageOnField(var1, gStringVar4, CleanUpOverworldMessage, 0);
            break;
    }
}

void DisplayDadsAdviceCannotUseItemMessage(u8 var1, u8 playerMenuStatus)
{
    HandleDeniedItemUseMessage(var1, playerMenuStatus, gOtherText_DadsAdvice);
}

void DisplayCantGetOffBikeItemMessage(u8 var1, u8 playerMenuStatus)
{
    HandleDeniedItemUseMessage(var1, playerMenuStatus, gOtherText_CantGetOffBike);
}

u8 CheckIfItemIsTMHMOrEvolutionStone(u16 itemId)
{
    if (ItemId_GetFieldFunc(itemId) == ItemUseOutOfBattle_TMHM)
        return 1;
    else if (ItemId_GetFieldFunc(itemId) == ItemUseOutOfBattle_EvolutionStone)
        return 2;
    else
        return 0;
}

void ItemMenu_ReadMail(u8 taskId)
{
    struct MailStruct mailStruct;

    if (!gPaletteFade.active)
    {
        mailStruct.itemId = gScriptItemId;
        HandleReadMail(&mailStruct, sub_80A5D04, 0);
        DestroyTask(taskId);
    }
}

void ItemUseOutOfBattle_Mail(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
    gTasks[taskId].func = ItemMenu_ReadMail;
}

void ItemUseOutOfBattle_Bike(u8 taskId)
{
    s16 x, y;
    u8 tileBehavior;

    PlayerGetDestCoords(&x, &y);
    tileBehavior = MapGridGetMetatileBehaviorAt(x, y);

    if (FlagGet(SYS_CYCLING_ROAD) == TRUE // on cycling road?
        || MetatileBehavior_IsVerticalRail(tileBehavior) == TRUE
        || MetatileBehavior_IsHorizontalRail(tileBehavior) == TRUE
        || MetatileBehavior_IsIsolatedVerticalRail(tileBehavior) == TRUE
        || MetatileBehavior_IsIsolatedHorizontalRail(tileBehavior) == TRUE)
    {
        DisplayCantGetOffBikeItemMessage(taskId, gTasks[taskId].data[2]);
    }
    else
    {
        if (IsBikingAllowedByMap() == TRUE && IsBikingDisallowedByPlayer() == FALSE)
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
    if (ItemId_GetSecondaryId(gScriptItemId) == 0)
        GetOnOffBike(2);
    if (ItemId_GetSecondaryId(gScriptItemId) == 1)
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
    if (CanFish() == TRUE)
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
    IncrementGameStat(0x27);
    gUnknown_03005D00 = (void *)ItemUseOnFieldCB_Itemfinder;
    SetUpItemUseOnFieldCallback(var);
}

void ItemUseOnFieldCB_Itemfinder(u8 taskId)
{
    if (ItemfinderCheckForHiddenItems(gMapHeader.events, taskId) == TRUE)
        gTasks[taskId].func = RunItemfinderResults;
    else
        DisplayItemMessageOnField(taskId, gOtherText_NoResponse, ExitItemfinder, 0);
}

void RunItemfinderResults(u8 taskId)
{
    u8 playerDir;
    u8 playerDirToItem;
    u8 i;
    s16 *data = gTasks[taskId].data;

    if (!data[3])
    {
        if (data[4] == 4)
        {
            playerDirToItem = GetPlayerDirectionTowardsHiddenItem(data[0], data[1]);
            if (playerDirToItem)
            {
                SetPlayerDirectionTowardsItem(gItemFinderDirections[playerDirToItem - 1]);
                gTasks[taskId].func = DisplayItemRespondingMessageAndExitItemfinder;
            }
            else // player is above hidden item.
            {
                playerDir = player_get_direction_lower_nybble();

                // rotate player clockwise depending on current direction.
                for (i = 0; i < 4; i++)
                    if (playerDir == gItemFinderDirections[i])
                        data[5] = (i + 1) & 3;

                gTasks[taskId].func = RotatePlayerAndExitItemfinder;
                data[3] = 0;
                data[2] = 0;
            }
            return;
        }
        PlaySE(SE_DAUGI); // play the itemfinder jingle 4 times before executing the itemfinder.
        data[4]++;
    }
    data[3] = (data[3] + 1) & 0x1F;
}

void ExitItemfinder(u8 taskId)
{
    MenuZeroFillWindowRect(0, 14, 29, 19);
    sub_8064E2C();
    ScriptContext2_Disable();
    DestroyTask(taskId);
}

bool8 ItemfinderCheckForHiddenItems(struct MapEvents *events, u8 taskId)
{
	int distanceX, distanceY;
    u16 x, y;
    s16 newDistanceX, newDistanceY, i;

    PlayerGetDestCoords(&x, &y);
    gTasks[taskId].data[2] = FALSE;

    for (i = 0; i < events->bgEventCount; i++)
    {
        if ((events -> bgEvents[i].kind == 7) && !FlagGet(events -> bgEvents[i].bgUnion.hiddenItem.hiddenItemId + 600))
        {
            // do a distance lookup of each item so long as the index remains less than the objects on the current map.
            distanceX = (u16)events -> bgEvents[i].x + 7;
            newDistanceX = distanceX - x;
            distanceY = (u16)events -> bgEvents[i].y + 7;
            newDistanceY = distanceY - y;

            // is item in range?
            if ((u16)(newDistanceX + 7) < 15 && (newDistanceY >= -5) && (newDistanceY < 6))
                sub_80C9838(taskId, newDistanceX, newDistanceY); // send coordinates of the item relative to the player
        }
    }
    sub_80C9720(taskId);  

    // hidden item detected?
    if(gTasks[taskId].data[2] == TRUE)
        return TRUE;
    else
        return FALSE;
}

bool8 HiddenItemAtPos(struct MapEvents *events, s16 x, s16 y)
{
    u8 bgEventCount = events->bgEventCount;
    struct BgEvent *bgEvent = events->bgEvents;
    int i;

    for(i = 0; i < bgEventCount; i++)
    {
        if(bgEvent[i].kind == 7 && x == (u16)bgEvent[i].x && y == (u16)bgEvent[i].y) // hidden item and coordinates matches x and y passed?
        {
            if(!FlagGet(bgEvent[i].bgUnion.hiddenItem.hiddenItemId + 600))
                return TRUE;
            else
                return FALSE;
        }
    }
    return FALSE;
}

bool8 sub_80C9688(struct MapConnection *connection, int x, int y)
{
	struct MapHeader *mapHeader;
	u16 localX, localY;
	u32 localOffset;
	s32 localLength;
	
	mapHeader = mapconnection_get_mapheader(connection);
	
	switch(connection->direction)
	{
		// same weird temp variable behavior seen in HiddenItemAtPos
		case 2:
			localOffset = connection->offset + 7;
			localX = x - localOffset;
			localLength = mapHeader->mapData->height - 7;
			localY = localLength + y; // additions are reversed for some reason
			break;
		case 1:
			localOffset = connection->offset + 7;
			localX = x - localOffset;
			localLength = gMapHeader.mapData->height + 7;
			localY = y - localLength;
			break;
		case 3:
			localLength = mapHeader->mapData->width - 7;
			localX = localLength + x; // additions are reversed for some reason
			localOffset = connection->offset + 7;
			localY = y - localOffset;
			break;
		case 4:
			localLength = gMapHeader.mapData->width + 7;
			localX = x - localLength;
			localOffset = connection->offset + 7;
			localY = y - localOffset;
			break;
		default:
			return FALSE;
	}
	return HiddenItemAtPos(mapHeader->events, localX, localY);
}
