#include "global.h"
#include "asm.h"
#include "battle.h"
#include "berry.h"
#include "coins.h"
#include "data2.h"
#include "event_data.h"
#include "field_map_obj_helpers.h"
#include "field_player_avatar.h"
#include "field_weather.h"
#include "fieldmap.h"
#include "item.h"
#include "items.h"
#include "mail.h"
#include "main.h"
#include "map_obj_lock.h"
#include "menu.h"
#include "menu_helpers.h"
#include "metatile_behavior.h"
#include "palette.h"
#include "rom4.h"
#include "script.h"
#include "songs.h"
#include "sound.h"
#include "string_util.h"
#include "strings.h"
#include "task.h"
#include "vars.h"

extern void (*gUnknown_03005D00)(u8);
extern void (*gUnknown_0300485C)(void);
extern void (*gUnknown_03004AE4)(u8);

extern u8 gUnknown_02038561;
extern u8 gLastFieldPokeMenuOpened;
extern u8 gUnknown_02024E6C;

extern u8 gUnknown_081A1654[];
extern u8 gUnknown_081A168F[];

extern u16 gUnknown_02024A6A[];

extern void HandleItemMenuPaletteFade(u8);
extern void ExecuteItemUseFromBlackPalette(void);
extern void DisplayItemMessageOnField(u8, const u8 *, TaskFunc, u16);
extern void CleanUpItemMenuMessage(u8);
extern void CleanUpOverworldMessage(u8);
extern void ItemUseOnFieldCB_Bike(u8);
extern void ItemUseOnFieldCB_Rod(u8);
extern void ItemUseOnFieldCB_Itemfinder(u8);
extern void sub_80A5D04(void);
extern bool8 IsBikingDisallowedByPlayer(void);
extern void GetOnOffBike(u8);
extern struct MapConnection *sub_8056BA0(s16 x, s16 y); // fieldmap.c
extern void sub_810BA7C(u8);
extern void sub_8080E28(void);
extern void UseMedicine(u8);
extern void sub_8070048(u8);
extern void DoPPRecoveryItemEffect(u8);
extern void DoPPUpItemEffect(u8);
extern void DoRareCandyItemEffect(u8);
extern void DoEvolutionStoneItemEffect(u8);
extern u16 ItemIdToBattleMoveId(u16);
extern void sub_80A3FA0(u16 *, u32, u32, u32, u32, u32);
extern void sub_80A3E0C(void);
extern void TeachMonTMMove(u8);
extern void sub_80878A8(void);
extern void sub_8053014(void);
extern void sub_80A7094(u8);
extern bool8 ExecuteTableBasedItemEffect_(struct Pokemon *mon, u16, u8, u16);
extern void sub_8094E4C(void);
extern u8 ExecuteTableBasedItemEffect__(u8 u8, u16 u16, int i);
extern u8 GetItemEffectType();
extern void sub_808B020(void);
extern void sub_810B96C(void);

extern u16 gScriptItemId;
extern u16 gBattleTypeFlags;

bool8 ItemfinderCheckForHiddenItems(struct MapEvents *events, u8 taskId);
void RunItemfinderResults(u8);
void ExitItemfinder(u8);
void sub_80C9720(u8);
void sub_80C9838(u8, s16, s16);
u8 GetPlayerDirectionTowardsHiddenItem(s16, s16);
void SetPlayerDirectionTowardsItem(u8);
void DisplayItemRespondingMessageAndExitItemfinder(u8);
void RotatePlayerAndExitItemfinder(u8);
void sub_80C9D00(u8);
void sub_80C9D74(u8);
void sub_80C9EE4(u8);
void sub_80C9F10(u8);
void sub_80C9F80(u8);
void sub_80C9FC0(u8);
void ItemUseOutOfBattle_TMHM(u8);
void ItemUseOutOfBattle_EvolutionStone(u8);
void ItemUseOutOfBattle_CannotUse(u8);

static const u8 gSSTidalBetaString[] = _("この　チケットで　ふねに　のりほうだい\nはやく　のってみたいな");
static const u8 gSSTidalBetaString2[] = _("この　チケットで　ふねに　のりほうだい\nはやく　のってみたいな");

static const struct TextStruct gUnknown_083D61DC[2] = {
    gSSTidalBetaString,
    gSSTidalBetaString2,
};

static const MainCallback gExitToOverworldFuncList[] = {
    sub_808B020,
    c2_exit_to_overworld_2_switch,
    sub_810B96C,
};

static const u8 gItemFinderDirections[] = {DIR_NORTH, DIR_EAST, DIR_SOUTH, DIR_WEST};

static const struct YesNoFuncTable gUnknown_083D61F4 = {
    .yesFunc = sub_80C9FC0,
    .noFunc = CleanUpItemMenuMessage,
};

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
        || MetatileBehavior_IsVerticalRail(tileBehavior) == TRUE || MetatileBehavior_IsHorizontalRail(tileBehavior) == TRUE || MetatileBehavior_IsIsolatedVerticalRail(tileBehavior) == TRUE || MetatileBehavior_IsIsolatedHorizontalRail(tileBehavior) == TRUE)
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
        if ((events->bgEvents[i].kind == 7) && !FlagGet(events->bgEvents[i].bgUnion.hiddenItem.hiddenItemId + 600))
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
        if (bgEvent[i].kind == 7 && x == (u16)bgEvent[i].x && y == (u16)bgEvent[i].y) // hidden item and coordinates matches x and y passed?
        {
            if (!FlagGet(bgEvent[i].bgUnion.hiddenItem.hiddenItemId + 600))
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

// weird math
#ifdef NONMATCHING
void sub_80C9720(u8 taskId)
{
    s16 x, y;
    s16 curX, curY;
    s16 width = gMapHeader.mapData->width + 7;
    s16 height = gMapHeader.mapData->height + 7;

    PlayerGetDestCoords(&x, &y);

    for (curX = x - 7; curX <= x + 7; curX++)
    {
        for (curY = y - 5; curY <= y + 5; curY++)
        {
            if (7 > curX || curX >= width || 7 > curY || curY >= height)
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
    FieldObjectClearAnimIfSpecialAnimFinished(&gMapObjects[GetFieldObjectIdByLocalIdAndMap(0xFF, 0, 0)]);
    FieldObjectClearAnim(&gMapObjects[GetFieldObjectIdByLocalIdAndMap(0xFF, 0, 0)]);
    UnfreezeMapObject(&gMapObjects[GetFieldObjectIdByLocalIdAndMap(0xFF, 0, 0)]);
    PlayerTurnInPlace(direction);
}

void DisplayItemRespondingMessageAndExitItemfinder(u8 taskId)
{
    if (FieldObjectCheckIfSpecialAnimFinishedOrInactive(&gMapObjects[GetFieldObjectIdByLocalIdAndMap(0xFF, 0, 0)]) == TRUE)
        DisplayItemMessageOnField(taskId, gOtherText_ItemfinderResponding, ExitItemfinder, 0);
}

void RotatePlayerAndExitItemfinder(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (FieldObjectCheckIfSpecialAnimFinishedOrInactive(&gMapObjects[GetFieldObjectIdByLocalIdAndMap(0xFF, 0, 0)]) == TRUE || data[2] == FALSE)
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
        gUnknown_0300485C = (void *)sub_8080E28;
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
        MenuZeroFillWindowRect(0, 0xD, 0xD, 0x14);
        DisplayItemMessageOnField(taskId, gStringVar4, CleanUpItemMenuMessage, 1);
    }
    else
    {
        DisplayItemMessageOnField(taskId, gStringVar4, CleanUpOverworldMessage, 0);
    }
}

void sub_80C9BB8(u8 var)
{
    if (gMain.newKeys & A_BUTTON)
        CleanUpItemMenuMessage(var);
}

void sub_80C9BD8(u8 var)
{
    if (gMain.newKeys & A_BUTTON)
        CleanUpOverworldMessage(var);
}

// unused
void ItemUseOutOfBattle_SSTicket(u8 taskId)
{
    if (gTasks[taskId].data[2] == 0)
    {
        MenuZeroFillWindowRect(0, 0xD, 0xD, 0x14);
        DisplayItemMessageOnField(taskId, (u8 *)gUnknown_083D61DC[ItemId_GetSecondaryId(gScriptItemId)].text, sub_80C9BB8, 1);
    }
    else
    {
        DisplayItemMessageOnField(taskId, (u8 *)gUnknown_083D61DC[ItemId_GetSecondaryId(gScriptItemId)].text, sub_80C9BD8, 0);
    }
}

void sub_80C9C7C(u8 taskId)
{
    if (IsPlayerFacingPlantedBerryTree() == TRUE)
    {
        gUnknown_03005D00 = sub_80C9D00;
        gUnknown_0300485C = ExecuteItemUseFromBlackPalette;
        gTasks[taskId].data[8] = (u32)c2_exit_to_overworld_2_switch >> 16;
        gTasks[taskId].data[9] = (u32)c2_exit_to_overworld_2_switch;
        gTasks[taskId].func = HandleItemMenuPaletteFade;
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0x10, 0);
    }
    else
    {
        ItemId_GetFieldFunc(gScriptItemId)(taskId);
    }
}

void sub_80C9D00(u8 taskId)
{
    RemoveBagItem(gScriptItemId, 1);
    ScriptContext2_Enable();
    ScriptContext1_SetupScript(gUnknown_081A1654);
    DestroyTask(taskId);
}

void ItemUseOutOfBattle_WailmerPail(u8 taskId)
{
    if (TryToWaterBerryTree() == TRUE)
    {
        gUnknown_03005D00 = sub_80C9D74;
        SetUpItemUseOnFieldCallback(taskId);
    }
    else
    {
        DisplayDadsAdviceCannotUseItemMessage(taskId, gTasks[taskId].data[2]);
    }
}

void sub_80C9D74(u8 taskId)
{
    ScriptContext2_Enable();
    ScriptContext1_SetupScript(gUnknown_081A168F);
    DestroyTask(taskId);
}

void sub_80C9D98(u8 taskId)
{
    gUnknown_02038561 = 0;
    ItemMenu_ConfirmNormalFade(taskId);
}

void ItemUseOutOfBattle_Medicine(u8 taskId)
{
    gUnknown_03004AE4 = UseMedicine;
    sub_80C9D98(taskId);
}

void ItemUseOutOfBattle_SacredAsh(u8 taskId)
{
    u8 i;

    gLastFieldPokeMenuOpened = 0;

    for (i = 0; i < 6; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES) != 0 && GetMonData(&gPlayerParty[i], MON_DATA_HP) == 0)
        {
            gLastFieldPokeMenuOpened = i;
            break;
        }
    }
    gUnknown_03004AE4 = sub_8070048;
    gUnknown_02038561 = 4;
    ItemMenu_ConfirmNormalFade(taskId);
}

void ItemUseOutOfBattle_PPRecovery(u8 taskId)
{
    gUnknown_03004AE4 = DoPPRecoveryItemEffect;
    sub_80C9D98(taskId);
}

void ItemUseOutOfBattle_PPUp(u8 taskId)
{
    gUnknown_03004AE4 = DoPPUpItemEffect;
    sub_80C9D98(taskId);
}

void ItemUseOutOfBattle_RareCandy(u8 taskId)
{
    gUnknown_03004AE4 = DoRareCandyItemEffect;
    sub_80C9D98(taskId);
}

void ItemUseOutOfBattle_TMHM(u8 taskId)
{
    MenuZeroFillWindowRect(0, 0xD, 0xD, 0x14);

    if (gScriptItemId >= ITEM_HM01)
        DisplayItemMessageOnField(taskId, gOtherText_BootedHM, sub_80C9EE4, 1); // HM
    else
        DisplayItemMessageOnField(taskId, gOtherText_BootedTM, sub_80C9EE4, 1); // TM
}

void sub_80C9EE4(u8 taskId)
{
    PlaySE(2);
    gTasks[taskId].func = sub_80C9F10;
}

void sub_80C9F10(u8 taskId)
{
    if (gMain.newKeys & A_BUTTON || gMain.newKeys & B_BUTTON)
    {
        StringCopy(gStringVar1, gMoveNames[ItemIdToBattleMoveId(gScriptItemId)]);
        StringExpandPlaceholders(gStringVar4, gOtherText_ContainsMove);
        DisplayItemMessageOnField(taskId, gStringVar4, sub_80C9F80, 1);
    }
}

void sub_80C9F80(u8 var)
{
    DisplayYesNoMenu(7, 7, 1);
    sub_80A3FA0(gBGTilemapBuffers[1], 8, 8, 5, 4, 1);
    sub_80F914C(var, &gUnknown_083D61F4);
}

void sub_80C9FC0(u8 var)
{
    gUnknown_03004AE4 = TeachMonTMMove;
    sub_80C9D98(var);
}

void sub_80C9FDC(void)
{
    RemoveBagItem(gScriptItemId, 1);
    sub_80A3E0C();
    CopyItemName(gScriptItemId, gStringVar2);
    StringExpandPlaceholders(gStringVar4, gOtherText_UsedItem);
}

void ItemUseOutOfBattle_Repel(u8 var)
{
    if (VarGet(VAR_REPEL_STEP_COUNT) == FALSE)
    {
        VarSet(VAR_REPEL_STEP_COUNT, ItemId_GetHoldEffectParam(gScriptItemId));
        sub_80C9FDC();
        DisplayItemMessageOnField(var, gStringVar4, CleanUpItemMenuMessage, 1);
    }
    else
    {
        DisplayItemMessageOnField(var, gOtherText_RepelLingers, CleanUpItemMenuMessage, 1);
    }
}

void sub_80CA07C(void)
{
    sub_80A3E0C();
    CopyItemName(gScriptItemId, gStringVar2);
}

void sub_80CA098(u8 taskId)
{
    if (++gTasks[taskId].data[15] > 7)
    {
        PlaySE(0x75);
        DisplayItemMessageOnField(taskId, gStringVar4, CleanUpItemMenuMessage, 1);
    }
}

void ItemUseOutOfBattle_BlackWhiteFlute(u8 taskId)
{
    if (gScriptItemId == 43)
    {
        FlagSet(SYS_ENC_UP_ITEM);
        FlagReset(SYS_ENC_DOWN_ITEM);
        sub_80CA07C();
        StringExpandPlaceholders(gStringVar4, gOtherText_UsedFlute);
        gTasks[taskId].func = sub_80CA098;
        gTasks[taskId].data[15] = 0;
    }
    else if (gScriptItemId == 42)
    {
        FlagSet(SYS_ENC_DOWN_ITEM);
        FlagReset(SYS_ENC_UP_ITEM);
        sub_80CA07C();
        StringExpandPlaceholders(gStringVar4, gOtherText_UsedRepel);
        gTasks[taskId].func = sub_80CA098;
        gTasks[taskId].data[15] = 0;
    }
}

void task08_080A1C44(u8 taskId)
{
    player_avatar_init_params_reset();
    sub_80878A8();
    DestroyTask(taskId);
}

void sub_80CA18C(u8 taskId)
{
    sub_8053014();
    sub_80C9FDC();
    gTasks[taskId].data[0] = 0;
    DisplayItemMessageOnField(taskId, gStringVar4, task08_080A1C44, 0);
}

bool8 sub_80CA1C8(void)
{
    if (gMapHeader.mapType == MAP_TYPE_UNDERGROUND)
        return TRUE;
    else
        return FALSE;
}

void ItemUseOutOfBattle_EscapeRope(u8 taskId)
{
    if (sub_80CA1C8() == TRUE) // is map type an area you can use escape rope?
    {
        gUnknown_03005D00 = sub_80CA18C;
        SetUpItemUseOnFieldCallback(taskId);
    }
    else
    {
        DisplayDadsAdviceCannotUseItemMessage(taskId, gTasks[taskId].data[2]);
    }
}

void ItemUseOutOfBattle_EvolutionStone(u8 var)
{
    gUnknown_03004AE4 = DoEvolutionStoneItemEffect;
    sub_80C9D98(var);
}

void ItemUseInBattle_PokeBall(u8 var)
{
    if (PlayerPartyAndPokemonStorageFull() == FALSE) // have room for mon?
    {
        RemoveBagItem(gScriptItemId, 1);
        sub_80A7094(var);
    }
    else
    {
        MenuZeroFillWindowRect(0, 0xD, 0xD, 0x14);
        DisplayItemMessageOnField(var, gOtherText_BoxIsFull, CleanUpItemMenuMessage, 1);
    }
}

void sub_80CA294(u8 var)
{
    if (gMain.newKeys & A_BUTTON || gMain.newKeys & B_BUTTON)
        sub_80A7094(var);
}

void sub_80CA2BC(u8 taskId)
{
    if (++gTasks[taskId].data[15] > 7)
    {
        PlaySE(1);
        RemoveBagItem(gScriptItemId, 1);
        DisplayItemMessageOnField(taskId, sub_803F378(gScriptItemId), sub_80CA294, 1);
    }
}

void ItemUseInBattle_StatIncrease(u8 taskId)
{
    u16 partyId = gUnknown_02024A6A[gUnknown_02024E6C];

    MenuZeroFillWindowRect(0, 0xD, 0xD, 0x14);

    if (ExecuteTableBasedItemEffect_(&gPlayerParty[partyId], gScriptItemId, partyId, 0) != FALSE)
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
        gpu_pal_allocator_reset__manage_upper_four();
        DestroyTask(taskId);
    }
}

void sub_80CA3C0(u8 taskId)
{
    gTasks[taskId].func = sub_80CA394;
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
}

void ItemUseInBattle_Medicine(u8 var)
{
    gUnknown_03004AE4 = UseMedicine;
    sub_80CA3C0(var);
}

void unref_sub_80CA410(u8 var)
{
    gUnknown_03004AE4 = sub_8070048;
    sub_80CA3C0(var);
}

void ItemUseInBattle_PPRecovery(u8 var)
{
    gUnknown_03004AE4 = DoPPRecoveryItemEffect;
    sub_80CA3C0(var);
}

void unref_sub_80CA448(u8 var)
{
    MenuZeroFillWindowRect(0, 0xD, 0xD, 0x14);

    if (ExecuteTableBasedItemEffect__(0, gScriptItemId, 0) == FALSE)
    {
        RemoveBagItem(gScriptItemId, 1);
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
    MenuZeroFillWindowRect(0, 0xD, 0xD, 0x14);

    if ((gBattleTypeFlags & BATTLE_TYPE_TRAINER) == FALSE)
    {
        sub_80C9FDC();
        DisplayItemMessageOnField(taskId, gStringVar4, sub_80A7094, 1);
    }
    else
    {
        DisplayDadsAdviceCannotUseItemMessage(taskId, gTasks[taskId].data[2]);
    }
}

void ItemUseOutOfBattle_EnigmaBerry(u8 taskId)
{
    switch (GetItemEffectType(gScriptItemId) - 1)
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
    switch (GetItemEffectType(gScriptItemId))
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
