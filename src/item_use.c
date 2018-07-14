#include "global.h"
#include "item_use.h"
#include "battle.h"
#include "berry.h"
#include "bike.h"
#include "coins.h"
#include "data2.h"
#include "event_data.h"
#include "field_effect.h"
#include "field_fadetransition.h"
#include "field_player_avatar.h"
#include "field_weather.h"
#include "fieldmap.h"
#include "item.h"
#include "item_menu.h"
#include "constants/flags.h"
#include "constants/items.h"
#include "mail.h"
#include "main.h"
#include "event_obj_lock.h"
#include "menu.h"
#include "menu_helpers.h"
#include "metatile_behavior.h"
#include "palette.h"
#include "party_menu.h"
#include "pokeblock.h"
#include "pokemon_item_effect.h"
#include "pokemon_menu.h"
#include "overworld.h"
#include "rom_8094928.h"
#include "script.h"
#include "constants/songs.h"
#include "sound.h"
#include "string_util.h"
#include "strings.h"
#include "task.h"
#include "constants/bg_event_constants.h"
#include "constants/map_types.h"
#include "constants/species.h"
#include "constants/vars.h"

extern void (*gFieldItemUseCallback)(u8);
extern void (*gFieldCallback)(void);
extern void (*gPokemonItemUseCallback)(u8, u16, TaskFunc);

extern u8 gPokemonItemUseType;
extern u8 gLastFieldPokeMenuOpened;
extern u8 gBankInMenu;

extern u8 S_PlantBerryTreeFromBag[];
extern u8 S_WaterBerryTreeFromBag[];

extern u16 gBattlerPartyIndexes[];

extern u16 gBattleTypeFlags;

static void ItemUseOnFieldCB_Berry(u8);
static void ItemUseOnFieldCB_WailmerPail(u8);
static void StartTeachMonTMHMMove(u8);
static void DisplayTeachMonTMHMYesNoChoice(u8);
static void BootTMHM(u8);
static void WaitButtonPressAndDisplayTMHMInfo(u8);

static const u8 gSSTidalBetaString[] = _("この　チケットで　ふねに　のりほうだい\nはやく　のってみたいな");
static const u8 gSSTidalBetaString2[] = _("この　チケットで　ふねに　のりほうだい\nはやく　のってみたいな");

static const u8 *const sSSTidalBetaStrings[] =
{
    gSSTidalBetaString,
    gSSTidalBetaString2,
};

static const MainCallback gExitToOverworldFuncList[] =
{
    sub_808B020,
    c2_exit_to_overworld_2_switch,
    sub_810B96C,
};

static const u8 gItemFinderDirections[] = { DIR_NORTH, DIR_EAST, DIR_SOUTH, DIR_WEST };

static const struct YesNoFuncTable sTeachMonTMHMYesNoActions =
{
    .yesFunc = StartTeachMonTMHMMove,
    .noFunc = CleanUpItemMenuMessage,
};

void ExecuteSwitchToOverworldFromItemUse(u8 taskId)
{
    u8 taskData;

    if (gSpecialVar_ItemId == ITEM_ENIGMA_BERRY)
        taskData = gTasks[taskId].data[15] - 1;
    else
        taskData = ItemId_GetType(gSpecialVar_ItemId) - 1;

    gTasks[taskId].data[8] = (u32)gExitToOverworldFuncList[taskData] >> 16;
    gTasks[taskId].data[9] = (u32)gExitToOverworldFuncList[taskData];
    gTasks[taskId].func = HandleItemMenuPaletteFade;
}

void ItemMenu_ConfirmNormalFade(u8 var)
{
    ExecuteSwitchToOverworldFromItemUse(var);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
}

void ItemMenu_ConfirmComplexFade(u8 var)
{
    ExecuteSwitchToOverworldFromItemUse(var);
    FadeScreen(1, 0);
}

void SetUpItemUseOnFieldCallback(u8 taskId)
{
    if (gTasks[taskId].data[2] != 1)
    {
        gFieldCallback = ExecuteItemUseFromBlackPalette;
        ItemMenu_ConfirmNormalFade(taskId);
    }
    else
    {
        gFieldItemUseCallback(taskId);
    }
}

static void HandleDeniedItemUseMessage(u8 taskId, u8 playerMenuStatus, const u8 *text)
{
    StringExpandPlaceholders(gStringVar4, text);

    switch (playerMenuStatus)
    {
    case 0: // Item Menu
        Menu_EraseWindowRect(0, 13, 13, 20);
        DisplayItemMessageOnField(taskId, gStringVar4, CleanUpItemMenuMessage, 1);
        break;
    default: // Field
        DisplayItemMessageOnField(taskId, gStringVar4, CleanUpOverworldMessage, 0);
        break;
    }
}

void DisplayDadsAdviceCannotUseItemMessage(u8 taskId, u8 playerMenuStatus)
{
    HandleDeniedItemUseMessage(taskId, playerMenuStatus, gOtherText_DadsAdvice);
}

void DisplayCantGetOffBikeItemMessage(u8 taskId, u8 playerMenuStatus)
{
    HandleDeniedItemUseMessage(taskId, playerMenuStatus, gOtherText_CantGetOffBike);
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
        mailStruct.itemId = gSpecialVar_ItemId;
        HandleReadMail(&mailStruct, sub_80A5D04, 0);
        DestroyTask(taskId);
    }
}

void ItemUseOutOfBattle_Mail(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
    gTasks[taskId].func = ItemMenu_ReadMail;
}

void ItemUseOutOfBattle_Bike(u8 taskId)
{
    s16 x, y;
    u8 tileBehavior;

    PlayerGetDestCoords(&x, &y);
    tileBehavior = MapGridGetMetatileBehaviorAt(x, y);

    if (FlagGet(FLAG_SYS_CYCLING_ROAD) == TRUE
        || MetatileBehavior_IsVerticalRail(tileBehavior) == TRUE
        || MetatileBehavior_IsHorizontalRail(tileBehavior) == TRUE
        || MetatileBehavior_IsIsolatedVerticalRail(tileBehavior) == TRUE
        || MetatileBehavior_IsIsolatedHorizontalRail(tileBehavior) == TRUE)
    {
        DisplayCantGetOffBikeItemMessage(taskId, gTasks[taskId].data[2]);
    }
    else
    {
        if (Overworld_IsBikingAllowed() == TRUE && IsBikingDisallowedByPlayer() == FALSE)
        {
            gFieldItemUseCallback = (void *)ItemUseOnFieldCB_Bike;
            SetUpItemUseOnFieldCallback(taskId);
        }
        else
            DisplayDadsAdviceCannotUseItemMessage(taskId, gTasks[taskId].data[2]);
    }
}

void ItemUseOnFieldCB_Bike(u8 taskId)
{
    if (ItemId_GetSecondaryId(gSpecialVar_ItemId) == 0)
        GetOnOffBike(PLAYER_AVATAR_FLAG_MACH_BIKE);
    if (ItemId_GetSecondaryId(gSpecialVar_ItemId) == 1)
        GetOnOffBike(PLAYER_AVATAR_FLAG_ACRO_BIKE);

    ScriptUnfreezeEventObjects();
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

    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_UNDERWATER))
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
        gFieldItemUseCallback = (void *)ItemUseOnFieldCB_Rod;
        SetUpItemUseOnFieldCallback(taskId);
    }
    else
        DisplayDadsAdviceCannotUseItemMessage(taskId, gTasks[taskId].data[2]);
}

void ItemUseOnFieldCB_Rod(u8 taskId)
{
    StartFishing(ItemId_GetSecondaryId(gSpecialVar_ItemId));
    DestroyTask(taskId);
}

void ItemUseOutOfBattle_Itemfinder(u8 taskId)
{
    IncrementGameStat(GAME_STAT_USED_ITEMFINDER);
    gFieldItemUseCallback = (void *)ItemUseOnFieldCB_Itemfinder;
    SetUpItemUseOnFieldCallback(taskId);
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
                playerDir = GetPlayerFacingDirection();

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
    Menu_EraseWindowRect(0, 14, 29, 19);
    ScriptUnfreezeEventObjects();
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
        if ((events->bgEvents[i].kind == BG_EVENT_HIDDEN_ITEM) && !FlagGet(events->bgEvents[i].bgUnion.hiddenItem.hiddenItemId + FLAG_HIDDEN_ITEMS_START))
        {
            // do a distance lookup of each item so long as the index remains less than the objects on the current map.
            distanceX = (u16)events->bgEvents[i].x + 7;
            newDistanceX = distanceX - x;
            distanceY = (u16)events->bgEvents[i].y + 7;
            newDistanceY = distanceY - y;

            // is item in range?
            if ((u16)(newDistanceX + 7) < 15 && (newDistanceY >= -5) && (newDistanceY < 6))
                sub_80C9838(taskId, newDistanceX, newDistanceY); // send coordinates of the item relative to the player
        }
    }
    sub_80C9720(taskId);

    // hidden item detected?
    if (gTasks[taskId].data[2] == TRUE)
        return TRUE;
    else
        return FALSE;
}

bool8 HiddenItemAtPos(struct MapEvents *events, s16 x, s16 y)
{
    u8 bgEventCount = events->bgEventCount;
    struct BgEvent *bgEvent = events->bgEvents;
    int i;

    for (i = 0; i < bgEventCount; i++)
    {
        if (bgEvent[i].kind == BG_EVENT_HIDDEN_ITEM && x == (u16)bgEvent[i].x && y == (u16)bgEvent[i].y) // hidden item and coordinates matches x and y passed?
        {
            if (!FlagGet(bgEvent[i].bgUnion.hiddenItem.hiddenItemId + FLAG_HIDDEN_ITEMS_START))
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

    switch (connection->direction)
    {
    // same weird temp variable behavior seen in HiddenItemAtPos
    case 2:
        localOffset = connection->offset + 7;
        localX = x - localOffset;
        localLength = mapHeader->mapLayout->height - 7;
        localY = localLength + y; // additions are reversed for some reason
        break;
    case 1:
        localOffset = connection->offset + 7;
        localX = x - localOffset;
        localLength = gMapHeader.mapLayout->height + 7;
        localY = y - localLength;
        break;
    case 3:
        localLength = mapHeader->mapLayout->width - 7;
        localX = localLength + x; // additions are reversed for some reason
        localOffset = connection->offset + 7;
        localY = y - localOffset;
        break;
    case 4:
        localLength = gMapHeader.mapLayout->width + 7;
        localX = x - localLength;
        localOffset = connection->offset + 7;
        localY = y - localOffset;
        break;
    default:
        return FALSE;
    }
    return HiddenItemAtPos(mapHeader->events, localX, localY);
}

// weird math
#ifdef NONMATCHING
void sub_80C9720(u8 taskId)
{
    s16 x, y;
    s16 curX, curY;
    s16 width = gMapHeader.mapLayout->width + 7;
    s16 height = gMapHeader.mapLayout->height + 7;

    PlayerGetDestCoords(&x, &y);

    for (curX = x - 7; curX <= x + 7; curX++)
    {
        for (curY = y - 5; curY <= y + 5; curY++)
        {
            if (7 > curX
             || curX >= width
             || 7 > curY
             || curY >= height)
            {
                struct MapConnection *conn = sub_8056BA0(curX, curY);
                if (conn && sub_80C9688(conn, curX, curY) == TRUE)
                    sub_80C9838(taskId, curX - x, curY - y);
            }
        }
    }
}
#else
NAKED
void sub_80C9720(u8 taskId)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x14\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    str r0, [sp, 0x4]\n\
    ldr r0, _080C9834 @ =gMapHeader\n\
    ldr r1, [r0]\n\
    ldr r0, [r1]\n\
    adds r0, 0x7\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    str r0, [sp, 0x8]\n\
    ldr r0, [r1, 0x4]\n\
    adds r0, 0x7\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    str r0, [sp, 0xC]\n\
    mov r4, sp\n\
    adds r4, 0x2\n\
    mov r0, sp\n\
    adds r1, r4, 0\n\
    bl PlayerGetDestCoords\n\
    mov r0, sp\n\
    ldrh r0, [r0]\n\
    subs r0, 0x7\n\
    lsls r0, 16\n\
    lsrs r3, r0, 16\n\
    asrs r0, 16\n\
    mov r1, sp\n\
    movs r2, 0\n\
    ldrsh r1, [r1, r2]\n\
    adds r1, 0x7\n\
    cmp r0, r1\n\
    bgt _080C9824\n\
_080C976E:\n\
    mov r5, sp\n\
    ldrh r0, [r5, 0x2]\n\
    subs r0, 0x5\n\
    lsls r0, 16\n\
    lsrs r4, r0, 16\n\
    lsls r2, r4, 16\n\
    asrs r1, r2, 16\n\
    movs r6, 0x2\n\
    ldrsh r0, [r5, r6]\n\
    adds r0, 0x5\n\
    lsls r3, 16\n\
    mov r8, r3\n\
    cmp r1, r0\n\
    bgt _080C980E\n\
    movs r0, 0x7\n\
    str r0, [sp, 0x10]\n\
    mov r1, r8\n\
    asrs r1, 16\n\
    mov r9, r1\n\
    mov r10, r0\n\
_080C9796:\n\
    ldr r3, [sp, 0x10]\n\
    cmp r3, r9\n\
    bgt _080C97B8\n\
    ldr r5, [sp, 0x8]\n\
    lsls r0, r5, 16\n\
    asrs r0, 16\n\
    cmp r9, r0\n\
    bge _080C97B8\n\
    asrs r1, r2, 16\n\
    cmp r10, r1\n\
    bgt _080C97B8\n\
    ldr r6, [sp, 0xC]\n\
    lsls r0, r6, 16\n\
    asrs r0, 16\n\
    lsls r7, r4, 16\n\
    cmp r1, r0\n\
    blt _080C97F6\n\
_080C97B8:\n\
    mov r0, r8\n\
    asrs r5, r0, 16\n\
    lsls r4, 16\n\
    asrs r6, r4, 16\n\
    adds r0, r5, 0\n\
    adds r1, r6, 0\n\
    bl sub_8056BA0\n\
    adds r7, r4, 0\n\
    cmp r0, 0\n\
    beq _080C97F6\n\
    adds r1, r5, 0\n\
    adds r2, r6, 0\n\
    bl sub_80C9688\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0x1\n\
    bne _080C97F6\n\
    mov r0, sp\n\
    ldrh r1, [r0]\n\
    subs r1, r5, r1\n\
    lsls r1, 16\n\
    asrs r1, 16\n\
    ldrh r2, [r0, 0x2]\n\
    subs r2, r6, r2\n\
    lsls r2, 16\n\
    asrs r2, 16\n\
    ldr r0, [sp, 0x4]\n\
    bl sub_80C9838\n\
_080C97F6:\n\
    movs r1, 0x80\n\
    lsls r1, 9\n\
    adds r0, r7, r1\n\
    lsrs r4, r0, 16\n\
    lsls r2, r4, 16\n\
    asrs r1, r2, 16\n\
    mov r3, sp\n\
    movs r5, 0x2\n\
    ldrsh r0, [r3, r5]\n\
    adds r0, 0x5\n\
    cmp r1, r0\n\
    ble _080C9796\n\
_080C980E:\n\
    movs r1, 0x80\n\
    lsls r1, 9\n\
    add r1, r8\n\
    lsrs r3, r1, 16\n\
    asrs r1, 16\n\
    mov r0, sp\n\
    movs r6, 0\n\
    ldrsh r0, [r0, r6]\n\
    adds r0, 0x7\n\
    cmp r1, r0\n\
    ble _080C976E\n\
_080C9824:\n\
    add sp, 0x14\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080C9834: .4byte gMapHeader\n\
    .syntax divided");
}
#endif

void sub_80C9838(u8 taskId, s16 x, s16 y)
{
    s16 *data = gTasks[taskId].data;
    s16 var1, var2, var3, var4;

    if (data[2] == FALSE)
    {
        data[0] = x;
        data[1] = y;
        data[2] = TRUE;
    }
    else
    {
        // data[0] and data[1] contain the player's coordinates.
        // x and y contain the item's coordinates.
        if (data[0] < 0)
            var1 = data[0] * -1; // item is to the left
        else
            var1 = data[0]; // item is to the right

        if (data[1] < 0)
            var2 = data[1] * -1; // item is to the north
        else
            var2 = data[1]; // item is to the south

        if (x < 0)
            var3 = x * -1;
        else
            var3 = x;

        if (y < 0)
            var4 = y * -1;
        else
            var4 = y;

        if (var1 + var2 > var3 + var4)
        {
            data[0] = x;
            data[1] = y;
        }
        else
        {
            if (var1 + var2 == var3 + var4 && (var2 > var4 || (var2 == var4 && data[1] < y)))
            {
                data[0] = x;
                data[1] = y;
            }
        }
    }
}

u8 GetPlayerDirectionTowardsHiddenItem(s16 itemX, s16 itemY)
{
    s16 abX, abY;

    if (itemX == 0 && itemY == 0)
        return DIR_NONE; // player is standing on the item.

    // get absolute X distance.
    if (itemX < 0)
        abX = itemX * -1;
    else
        abX = itemX;

    // get absolute Y distance.
    if (itemY < 0)
        abY = itemY * -1;
    else
        abY = itemY;

    if (abX > abY)
    {
        if (itemX < 0)
            return DIR_EAST;
        else
            return DIR_NORTH;
    }
    else
    {
        if (abX < abY)
        {
            if (itemY < 0)
                return DIR_SOUTH;
            else
                return DIR_WEST;
        }
        if (abX == abY)
        {
            if (itemY < 0)
                return DIR_SOUTH;
            else
                return DIR_WEST;
        }
        return DIR_NONE; // should never get here. return something so it doesnt crash.
    }
}

void SetPlayerDirectionTowardsItem(u8 direction)
{
    EventObjectClearHeldMovementIfFinished(&gEventObjects[GetEventObjectIdByLocalIdAndMap(0xFF, 0, 0)]);
    EventObjectClearHeldMovement(&gEventObjects[GetEventObjectIdByLocalIdAndMap(0xFF, 0, 0)]);
    UnfreezeEventObject(&gEventObjects[GetEventObjectIdByLocalIdAndMap(0xFF, 0, 0)]);
    PlayerTurnInPlace(direction);
}

void DisplayItemRespondingMessageAndExitItemfinder(u8 taskId)
{
    if (EventObjectCheckHeldMovementStatus(&gEventObjects[GetEventObjectIdByLocalIdAndMap(0xFF, 0, 0)]) == TRUE)
        DisplayItemMessageOnField(taskId, gOtherText_ItemfinderResponding, ExitItemfinder, 0);
}

void RotatePlayerAndExitItemfinder(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (EventObjectCheckHeldMovementStatus(&gEventObjects[GetEventObjectIdByLocalIdAndMap(0xFF, 0, 0)]) == TRUE
    || data[2] == FALSE)
    {
        SetPlayerDirectionTowardsItem(gItemFinderDirections[data[5]]);
        data[2] = 1;
        data[5] = (data[5] + 1) & 3;
        data[3]++;

        if (data[3] == 4)
            DisplayItemMessageOnField(taskId, gOtherText_ItemfinderItemUnderfoot, ExitItemfinder, 0);
    }
}

void ItemUseOutOfBattle_PokeblockCase(u8 taskId)
{
    if (sub_80F9344() == TRUE)
    {
        DisplayDadsAdviceCannotUseItemMessage(taskId, gTasks[taskId].data[2]);
    }
    else if (gTasks[taskId].data[2] != TRUE)
    {
        sub_810BA7C(0);
        ItemMenu_ConfirmNormalFade(taskId);
    }
    else
    {
        gFieldCallback = (void *)sub_8080E28;
        sub_810BA7C(1);
        ItemMenu_ConfirmComplexFade(taskId);
    }
}

void ItemUseOutOfBattle_CoinCase(u8 taskId)
{
    ConvertIntToDecimalStringN(gStringVar1, GetCoins(), 0, 4);
    StringExpandPlaceholders(gStringVar4, gOtherText_Coins3);

    if (!gTasks[taskId].data[2])
    {
        Menu_EraseWindowRect(0, 13, 13, 20);
        DisplayItemMessageOnField(taskId, gStringVar4, CleanUpItemMenuMessage, 1);
    }
    else
    {
        DisplayItemMessageOnField(taskId, gStringVar4, CleanUpOverworldMessage, 0);
    }
}

static void SSTicketWaitForAButtonPress(u8 taskId)
{
    if (gMain.newKeys & A_BUTTON)
        CleanUpItemMenuMessage(taskId);
}

static void SSTicketWaitForAButtonPress2(u8 taskId)
{
    if (gMain.newKeys & A_BUTTON)
        CleanUpOverworldMessage(taskId);
}

// unused
void ItemUseOutOfBattle_SSTicket(u8 taskId)
{
    if (gTasks[taskId].data[2] == 0)
    {
        Menu_EraseWindowRect(0, 13, 13, 20);
        DisplayItemMessageOnField(taskId, sSSTidalBetaStrings[ItemId_GetSecondaryId(gSpecialVar_ItemId)], SSTicketWaitForAButtonPress, 1);
    }
    else
    {
        DisplayItemMessageOnField(taskId, sSSTidalBetaStrings[ItemId_GetSecondaryId(gSpecialVar_ItemId)], SSTicketWaitForAButtonPress2, 0);
    }
}

void ItemUseOutOfBattle_Berry(u8 taskId)
{
    if (IsPlayerFacingUnplantedSoil() == TRUE)
    {
        gFieldItemUseCallback = ItemUseOnFieldCB_Berry;
        gFieldCallback = ExecuteItemUseFromBlackPalette;
        gTasks[taskId].data[8] = (u32)c2_exit_to_overworld_2_switch >> 16;
        gTasks[taskId].data[9] = (u32)c2_exit_to_overworld_2_switch;
        gTasks[taskId].func = HandleItemMenuPaletteFade;
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0x10, RGB(0, 0, 0));
    }
    else
    {
        ItemId_GetFieldFunc(gSpecialVar_ItemId)(taskId);
    }
}

static void ItemUseOnFieldCB_Berry(u8 taskId)
{
    RemoveBagItem(gSpecialVar_ItemId, 1);
    ScriptContext2_Enable();
    ScriptContext1_SetupScript(S_PlantBerryTreeFromBag);
    DestroyTask(taskId);
}

void ItemUseOutOfBattle_WailmerPail(u8 taskId)
{
    if (TryToWaterBerryTree() == TRUE)
    {
        gFieldItemUseCallback = ItemUseOnFieldCB_WailmerPail;
        SetUpItemUseOnFieldCallback(taskId);
    }
    else
    {
        DisplayDadsAdviceCannotUseItemMessage(taskId, gTasks[taskId].data[2]);
    }
}

static void ItemUseOnFieldCB_WailmerPail(u8 taskId)
{
    ScriptContext2_Enable();
    ScriptContext1_SetupScript(S_WaterBerryTreeFromBag);
    DestroyTask(taskId);
}

static void SetPokemonItemUseAndFadeOut(u8 taskId)
{
    gPokemonItemUseType = ITEM_USE_SINGLE_MON;
    ItemMenu_ConfirmNormalFade(taskId);
}

void ItemUseOutOfBattle_Medicine(u8 taskId)
{
    gPokemonItemUseCallback = UseMedicine;
    SetPokemonItemUseAndFadeOut(taskId);
}

void ItemUseOutOfBattle_SacredAsh(u8 taskId)
{
    u8 i;

    gLastFieldPokeMenuOpened = 0;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES) != SPECIES_NONE && GetMonData(&gPlayerParty[i], MON_DATA_HP) == 0)
        {
            gLastFieldPokeMenuOpened = i;
            break;
        }
    }
    gPokemonItemUseCallback = DoSacredAshItemEffect;
    gPokemonItemUseType = ITEM_USE_ALL_MONS;
    ItemMenu_ConfirmNormalFade(taskId);
}

void ItemUseOutOfBattle_PPRecovery(u8 taskId)
{
    gPokemonItemUseCallback = DoPPRecoveryItemEffect;
    SetPokemonItemUseAndFadeOut(taskId);
}

void ItemUseOutOfBattle_PPUp(u8 taskId)
{
    gPokemonItemUseCallback = DoPPUpItemEffect;
    SetPokemonItemUseAndFadeOut(taskId);
}

void ItemUseOutOfBattle_RareCandy(u8 taskId)
{
    gPokemonItemUseCallback = DoRareCandyItemEffect;
    SetPokemonItemUseAndFadeOut(taskId);
}

void ItemUseOutOfBattle_TMHM(u8 taskId)
{
    Menu_EraseWindowRect(0, 13, 13, 20);

    if (gSpecialVar_ItemId >= ITEM_HM01_CUT)
        DisplayItemMessageOnField(taskId, gOtherText_BootedHM, BootTMHM, 1); // HM
    else
        DisplayItemMessageOnField(taskId, gOtherText_BootedTM, BootTMHM, 1); // TM
}

static void BootTMHM(u8 taskId)
{
    PlaySE(SE_PC_LOGON);
    gTasks[taskId].func = WaitButtonPressAndDisplayTMHMInfo;
}

static void WaitButtonPressAndDisplayTMHMInfo(u8 taskId)
{
    if (gMain.newKeys & A_BUTTON || gMain.newKeys & B_BUTTON)
    {
        StringCopy(gStringVar1, gMoveNames[ItemIdToBattleMoveId(gSpecialVar_ItemId)]);
        StringExpandPlaceholders(gStringVar4, gOtherText_ContainsMove);
        DisplayItemMessageOnField(taskId, gStringVar4, DisplayTeachMonTMHMYesNoChoice, 1);
    }
}

static void DisplayTeachMonTMHMYesNoChoice(u8 taskId)
{
    DisplayYesNoMenu(7, 7, 1);
    sub_80A3FA0(gBGTilemapBuffers[1], 8, 8, 5, 4, 1);
    DoYesNoFuncWithChoice(taskId, &sTeachMonTMHMYesNoActions);
}

static void StartTeachMonTMHMMove(u8 taskId)
{
    gPokemonItemUseCallback = TeachMonTMMove;
    SetPokemonItemUseAndFadeOut(taskId);
}

static void PrepareItemUseMessage(void)
{
    RemoveBagItem(gSpecialVar_ItemId, 1);
    sub_80A3E0C();
    CopyItemName(gSpecialVar_ItemId, gStringVar2);
    StringExpandPlaceholders(gStringVar4, gOtherText_UsedItem);
}

void ItemUseOutOfBattle_Repel(u8 taskId)
{
    if (VarGet(VAR_REPEL_STEP_COUNT) == 0)
    {
        VarSet(VAR_REPEL_STEP_COUNT, ItemId_GetHoldEffectParam(gSpecialVar_ItemId));
        PrepareItemUseMessage();
        DisplayItemMessageOnField(taskId, gStringVar4, CleanUpItemMenuMessage, 1);
    }
    else
    {
        DisplayItemMessageOnField(taskId, gOtherText_RepelLingers, CleanUpItemMenuMessage, 1);
    }
}

static void sub_80CA07C(void)
{
    sub_80A3E0C();
    CopyItemName(gSpecialVar_ItemId, gStringVar2);
}

static void PlayBlackWhiteFluteSound(u8 taskId)
{
    if(++gTasks[taskId].data[15] > 7)
    {
        PlaySE(SE_BIDORO);
        DisplayItemMessageOnField(taskId, gStringVar4, CleanUpItemMenuMessage, 1);
    }
}

void ItemUseOutOfBattle_BlackWhiteFlute(u8 taskId)
{
    if (gSpecialVar_ItemId == ITEM_WHITE_FLUTE)
    {
        FlagSet(FLAG_SYS_ENC_UP_ITEM);
        FlagClear(FLAG_SYS_ENC_DOWN_ITEM);
        sub_80CA07C();
        StringExpandPlaceholders(gStringVar4, gOtherText_UsedFlute);
        gTasks[taskId].func = PlayBlackWhiteFluteSound;
        gTasks[taskId].data[15] = 0;
    }
    else if (gSpecialVar_ItemId == ITEM_BLACK_FLUTE)
    {
        FlagSet(FLAG_SYS_ENC_DOWN_ITEM);
        FlagClear(FLAG_SYS_ENC_UP_ITEM);
        sub_80CA07C();
        StringExpandPlaceholders(gStringVar4, gOtherText_UsedRepel);
        gTasks[taskId].func = PlayBlackWhiteFluteSound;
        gTasks[taskId].data[15] = 0;
    }
}

void task08_080A1C44(u8 taskId)
{
    ResetInitialPlayerAvatarState();
    StartEscapeRopeFieldEffect();
    DestroyTask(taskId);
}

static void ItemUseOnFieldCB_EscapeRope(u8 taskId)
{
    Overworld_ResetStateAfterDigEscRope();
    PrepareItemUseMessage();
    gTasks[taskId].data[0] = 0;
    DisplayItemMessageOnField(taskId, gStringVar4, task08_080A1C44, 0);
}

bool8 CanUseEscapeRopeOnCurrMap(void)
{
    if (gMapHeader.mapType == MAP_TYPE_UNDERGROUND)
        return TRUE;
    else
        return FALSE;
}

void ItemUseOutOfBattle_EscapeRope(u8 taskId)
{
    if (CanUseEscapeRopeOnCurrMap() == TRUE)
    {
        gFieldItemUseCallback = ItemUseOnFieldCB_EscapeRope;
        SetUpItemUseOnFieldCallback(taskId);
    }
    else
    {
        DisplayDadsAdviceCannotUseItemMessage(taskId, gTasks[taskId].data[2]);
    }
}

void ItemUseOutOfBattle_EvolutionStone(u8 taskId)
{
    gPokemonItemUseCallback = DoEvolutionStoneItemEffect;
    SetPokemonItemUseAndFadeOut(taskId);
}

void ItemUseInBattle_PokeBall(u8 taskId)
{
    if (PlayerPartyAndPokemonStorageFull() == FALSE) // have room for mon?
    {
        RemoveBagItem(gSpecialVar_ItemId, 1);
        sub_80A7094(taskId);
    }
    else
    {
        Menu_EraseWindowRect(0, 13, 13, 20);
        DisplayItemMessageOnField(taskId, gOtherText_BoxIsFull, CleanUpItemMenuMessage, 1);
    }
}

void sub_80CA294(u8 taskId)
{
    if (gMain.newKeys & A_BUTTON || gMain.newKeys & B_BUTTON)
        sub_80A7094(taskId);
}

void sub_80CA2BC(u8 taskId)
{
    if(++gTasks[taskId].data[15] > 7)
    {
        PlaySE(SE_KAIFUKU);
        RemoveBagItem(gSpecialVar_ItemId, 1);
        DisplayItemMessageOnField(taskId, sub_803F378(gSpecialVar_ItemId), sub_80CA294, 1);
    }
}

void ItemUseInBattle_StatIncrease(u8 taskId)
{
    u16 partyId = gBattlerPartyIndexes[gBankInMenu];

    Menu_EraseWindowRect(0, 13, 13, 20);

    if (ExecuteTableBasedItemEffect_(&gPlayerParty[partyId], gSpecialVar_ItemId, partyId, 0) != FALSE)
    {
        DisplayItemMessageOnField(taskId, gOtherText_WontHaveAnyEffect, CleanUpItemMenuMessage, 1);
    }
    else
    {
        gTasks[taskId].func = sub_80CA2BC;
        gTasks[taskId].data[15] = 0;
    }
}

void sub_80CA394(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        sub_8094E4C();
        FreeAndReserveObjectSpritePalettes();
        DestroyTask(taskId);
    }
}

void sub_80CA3C0(u8 taskId)
{
    gTasks[taskId].func = sub_80CA394;
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
}

void ItemUseInBattle_Medicine(u8 var)
{
    gPokemonItemUseCallback = UseMedicine;
    sub_80CA3C0(var);
}

void unref_sub_80CA410(u8 var)
{
    gPokemonItemUseCallback = DoSacredAshItemEffect;
    sub_80CA3C0(var);
}

void ItemUseInBattle_PPRecovery(u8 var)
{
    gPokemonItemUseCallback = DoPPRecoveryItemEffect;
    sub_80CA3C0(var);
}

void unref_sub_80CA448(u8 var)
{
    Menu_EraseWindowRect(0, 13, 13, 20);

    if (ExecuteTableBasedItemEffect__(0, gSpecialVar_ItemId, 0) == FALSE)
    {
        RemoveBagItem(gSpecialVar_ItemId, 1);
        GetMonNickname(&gPlayerParty[0], gStringVar1);
        StringExpandPlaceholders(gStringVar4, gOtherText_SnapConfusion);
        DisplayItemMessageOnField(var, gStringVar4, sub_80A7094, 1);
    }
    else
    {
        DisplayItemMessageOnField(var, gOtherText_WontHaveAnyEffect, CleanUpItemMenuMessage, 1);
    }
}

void ItemUseInBattle_Escape(u8 taskId)
{
    Menu_EraseWindowRect(0, 13, 13, 20);

    if ((gBattleTypeFlags & BATTLE_TYPE_TRAINER) == FALSE)
    {
        PrepareItemUseMessage();
        DisplayItemMessageOnField(taskId, gStringVar4, sub_80A7094, 1);
    }
    else
    {
        DisplayDadsAdviceCannotUseItemMessage(taskId, gTasks[taskId].data[2]);
    }
}

void ItemUseOutOfBattle_EnigmaBerry(u8 taskId)
{
    switch (GetItemEffectType(gSpecialVar_ItemId) - 1)
    {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
        gTasks[taskId].data[15] = 1;
        ItemUseOutOfBattle_Medicine(taskId);
        break;
    case 9:
        gTasks[taskId].data[15] = 1;
        ItemUseOutOfBattle_SacredAsh(taskId);
        break;
    case 0:
        gTasks[taskId].data[15] = 1;
        ItemUseOutOfBattle_RareCandy(taskId);
        break;
    case 18:
    case 19:
        gTasks[taskId].data[15] = 1;
        ItemUseOutOfBattle_PPUp(taskId);
        break;
    case 20:
        gTasks[taskId].data[15] = 1;
        ItemUseOutOfBattle_PPRecovery(taskId);
        break;
    default:
        gTasks[taskId].data[15] = 4;
        ItemUseOutOfBattle_CannotUse(taskId);
    }
}

void ItemUseInBattle_EnigmaBerry(u8 taskId)
{
    switch (GetItemEffectType(gSpecialVar_ItemId))
    {
    case 0:
        ItemUseInBattle_StatIncrease(taskId);
        break;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 11:
        ItemUseInBattle_Medicine(taskId);
        break;
    case 21:
        ItemUseInBattle_PPRecovery(taskId);
        break;
    default:
        ItemUseOutOfBattle_CannotUse(taskId);
    }
}

void ItemUseOutOfBattle_CannotUse(u8 taskId)
{
    DisplayDadsAdviceCannotUseItemMessage(taskId, gTasks[taskId].data[2]);
}
