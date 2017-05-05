#include "global.h"
#include "script_menu.h"
#include "event_data.h"
#include "menu.h"
#include "palette.h"
#include "script.h"
#include "sound.h"
#include "sprite.h"
#include "strings.h"
#include "task.h"

// multichoice lists
const struct MenuAction MultichoiceList_00[] = {
    {(u8 *)OtherText_Petalburg, 0},
    {(u8 *)OtherText_Slateport, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_02[] = {
    {(u8 *)OtherText_Enter, 0},
    {(u8 *)OtherText_Info3, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_03[] = {
    {(u8 *)OtherText_WhatsAContest, 0},
    {(u8 *)OtherText_TypesOfContest, 0},
    {(u8 *)OtherText_Ranks, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_04[] = {
    {(u8 *)OtherText_CoolContest, 0},
    {(u8 *)OtherText_BeautyContest, 0},
    {(u8 *)OtherText_CuteContest, 0},
    {(u8 *)OtherText_SmartContest, 0},
    {(u8 *)OtherText_ToughContest, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_06[] = {
    {(u8 *)OtherText_Decoration, 0},
    {(u8 *)OtherText_PackUp, 0},
    {(u8 *)OtherText_Registry, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_05[] = {
    {(u8 *)OtherText_Decoration, 0},
    {(u8 *)OtherText_PackUp, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_07[] = {
    {(u8 *)OtherText_Register, 0},
    {(u8 *)OtherText_Registry, 0},
    {(u8 *)OtherText_Information, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_12[] = {
    {(u8 *)OtherText_Mach, 0},
    {(u8 *)OtherText_Acro, 0},
};

const struct MenuAction MultichoiceList_13[] = {
    {(u8 *)OtherText_Poison, 0},
    {(u8 *)OtherText_Paralysis, 0},
    {(u8 *)OtherText_Sleep, 0},
    {(u8 *)OtherText_Burn, 0},
    {(u8 *)OtherText_Frozen, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_14[] = {
    {(u8 *)OtherText_Dewford, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_16[] = {
    {(u8 *)OtherText_SawIt, 0},
    {(u8 *)OtherText_NotYet, 0},
};

const struct MenuAction MultichoiceList_17[] = {
    {(u8 *)OtherText_Yes, 0},
    {(u8 *)OtherText_No, 0},
    {(u8 *)OtherText_Info3, 0},
};

const struct MenuAction MultichoiceList_18[] = {
    {(u8 *)OtherText_SingleBattle, 0},
    {(u8 *)OtherText_DoubleBattle, 0},
    {(u8 *)OtherText_MultiBattle, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_19[] = {
    {(u8 *)OtherText_Littleroot, 0},
    {(u8 *)OtherText_Slateport, 0},
    {(u8 *)OtherText_Lilycove, 0},
};

const struct MenuAction MultichoiceList_20[] = {
    {(u8 *)OtherText_Yes, 0},
    {(u8 *)OtherText_No, 0},
    {(u8 *)OtherText_Info3, 0},
};

const struct MenuAction MultichoiceList_23[] = {
    {(u8 *)OtherText_MakeAChallenge, 0},
    {(u8 *)OtherText_ObtainInformation, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_24[] = {
    {(u8 *)OtherText_Lv50_2, 0},
    {(u8 *)OtherText_Lv100_2, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_25[] = {
    {(u8 *)OtherText_Zigzagoon, 0},
    {(u8 *)OtherText_Nincada, 0},
    {(u8 *)OtherText_Poochyena, 0},
};

const struct MenuAction MultichoiceList_26[] = {
    {(u8 *)OtherText_Nincada2, 0},
    {(u8 *)OtherText_Lotad, 0},
    {(u8 *)OtherText_Roselia, 0},
};

const struct MenuAction MultichoiceList_27[] = {
    {(u8 *)OtherText_Shroomish, 0},
    {(u8 *)OtherText_Nincada3, 0},
    {(u8 *)OtherText_Surskit, 0},
};

const struct MenuAction MultichoiceList_28[] = {
    {(u8 *)OtherText_Treecko, 0},
    {(u8 *)OtherText_Torchic, 0},
    {(u8 *)OtherText_Mudkip, 0},
};

const struct MenuAction MultichoiceList_29[] = {
    {(u8 *)OtherText_Seedot, 0},
    {(u8 *)OtherText_Shroomish2, 0},
    {(u8 *)OtherText_Spinda, 0},
};

const struct MenuAction MultichoiceList_30[] = {
    {(u8 *)OtherText_Shroomish3, 0},
    {(u8 *)OtherText_Zigzagoon2, 0},
    {(u8 *)OtherText_Wurmple, 0},
};

const struct MenuAction MultichoiceList_31[] = {
    {(u8 *)OtherText_PokeBall, 0},
    {(u8 *)OtherText_SuperPotion, 0},
    {(u8 *)OtherText_SamePrice, 0},
};

const struct MenuAction MultichoiceList_32[] = {
    {(u8 *)OtherText_Yen135, 0},
    {(u8 *)OtherText_Yen155, 0},
    {(u8 *)OtherText_Yen175, 0},
};

const struct MenuAction MultichoiceList_33[] = {
    {(u8 *)OtherText_CostMore, 0},
    {(u8 *)OtherText_CostLess, 0},
    {(u8 *)OtherText_SamePrice2, 0},
};

const struct MenuAction MultichoiceList_34[] = {
    {(u8 *)OtherText_MaleSymbol, 0},
    {(u8 *)OtherText_FemaleSymbol, 0},
    {(u8 *)OtherText_Neither, 0},
};

const struct MenuAction MultichoiceList_35[] = {
    {(u8 *)OtherText_Males, 0},
    {(u8 *)OtherText_Females, 0},
    {(u8 *)OtherText_SameNumber, 0},
};

const struct MenuAction MultichoiceList_36[] = {
    {(u8 *)OtherText_Male, 0},
    {(u8 *)OtherText_Female, 0},
    {(u8 *)OtherText_ItDepends, 0},
};

const struct MenuAction MultichoiceList_37[] = {
    {(u8 *)OtherText_Six2, 0},
    {(u8 *)OtherText_Eight2, 0},
    {(u8 *)OtherText_Ten, 0},
};

const struct MenuAction MultichoiceList_38[] = {
    {(u8 *)OtherText_One, 0},
    {(u8 *)OtherText_Two, 0},
    {(u8 *)OtherText_Three, 0},
};

const struct MenuAction MultichoiceList_39[] = {
    {(u8 *)OtherText_Six, 0},
    {(u8 *)OtherText_Seven, 0},
    {(u8 *)OtherText_Eight, 0},
};

const struct MenuAction MultichoiceList_42[] = {
    {(u8 *)OtherText_FreshWater, 0},
    {(u8 *)OtherText_SodaPop, 0},
    {(u8 *)OtherText_Lemonade, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_43[] = {
    {(u8 *)OtherText_HowToRide, 0},
    {(u8 *)OtherText_HowToTurn, 0},
    {(u8 *)OtherText_SandySlopes, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_44[] = {
    {(u8 *)OtherText_Wheelies, 0},
    {(u8 *)OtherText_BunnyHops, 0},
    {(u8 *)OtherText_Jumping, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_45[] = {
    {(u8 *)OtherText_Satisfied, 0},
    {(u8 *)OtherText_Dissatisfied, 0},
};

const struct MenuAction MultichoiceList_46[] = {
    {(u8 *)OtherText_Deepseatooth, 0},
    {(u8 *)OtherText_Deepseascale, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_47[] = {
    {(u8 *)OtherText_BlueFlute2, 0},
    {(u8 *)OtherText_YellowFlute2, 0},
    {(u8 *)OtherText_RedFlute2, 0},
    {(u8 *)OtherText_WhiteFlute2, 0},
    {(u8 *)OtherText_BlackFlute2, 0},
    {(u8 *)OtherText_GlassChair, 0},
    {(u8 *)OtherText_GlassDesk, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_48[] = {
    {(u8 *)OtherText_TreeckoDoll, 0},
    {(u8 *)OtherText_TorchicDoll, 0},
    {(u8 *)OtherText_MudkipDoll, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_55[] = {
    {(u8 *)OtherText_TM32, 0},
    {(u8 *)OtherText_TM29, 0},
    {(u8 *)OtherText_TM35, 0},
    {(u8 *)OtherText_TM24, 0},
    {(u8 *)OtherText_TM13, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_49[] = {
    {(u8 *)OtherText_50Coins, 0},
    {(u8 *)OtherText_500Coins, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_50[] = {
    {(u8 *)OtherText_Excellent, 0},
    {(u8 *)OtherText_NotSoHot, 0},
};

const struct MenuAction MultichoiceList_52[] = {
    {(u8 *)OtherText_Lilycove, 0},
    {(u8 *)OtherText_BattleTower, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_53[] = {
    {(u8 *)OtherText_Slateport, 0},
    {(u8 *)OtherText_Lilycove, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_54[] = {
    {(u8 *)OtherText_Right, 0},
    {(u8 *)OtherText_Left, 0},
};

const struct MenuAction MultichoiceList_56[] = {
    {(u8 *)OtherText_Slateport, 0},
    {(u8 *)OtherText_BattleTower, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_57[] = {
    {(u8 *)OtherText_1F_2, 0},
    {(u8 *)OtherText_2F_2, 0},
    {(u8 *)OtherText_3F_2, 0},
    {(u8 *)OtherText_4F_2, 0},
    {(u8 *)OtherText_5F_2, 0},
};

const struct MenuAction MultichoiceList_58[] = {
    {(u8 *)OtherText_RedShard, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_59[] = {
    {(u8 *)OtherText_YellowShard, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_60[] = {
    {(u8 *)OtherText_RedShard, 0},
    {(u8 *)OtherText_YellowShard, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_61[] = {
    {(u8 *)OtherText_BlueShard, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_62[] = {
    {(u8 *)OtherText_RedShard, 0},
    {(u8 *)OtherText_BlueShard, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_63[] = {
    {(u8 *)OtherText_YellowShard, 0},
    {(u8 *)OtherText_BlueShard, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_64[] = {
    {(u8 *)OtherText_RedShard, 0},
    {(u8 *)OtherText_YellowShard, 0},
    {(u8 *)OtherText_BlueShard, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_65[] = {
    {(u8 *)OtherText_GreenShard, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_66[] = {
    {(u8 *)OtherText_RedShard, 0},
    {(u8 *)OtherText_GreenShard, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_67[] = {
    {(u8 *)OtherText_YellowShard, 0},
    {(u8 *)OtherText_GreenShard, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_68[] = {
    {(u8 *)OtherText_RedShard, 0},
    {(u8 *)OtherText_YellowShard, 0},
    {(u8 *)OtherText_GreenShard, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_69[] = {
    {(u8 *)OtherText_BlueShard, 0},
    {(u8 *)OtherText_GreenShard, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_70[] = {
    {(u8 *)OtherText_RedShard, 0},
    {(u8 *)OtherText_BlueShard, 0},
    {(u8 *)OtherText_GreenShard, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_71[] = {
    {(u8 *)OtherText_YellowShard, 0},
    {(u8 *)OtherText_BlueShard, 0},
    {(u8 *)OtherText_GreenShard, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_72[] = {
    {(u8 *)OtherText_RedShard, 0},
    {(u8 *)OtherText_YellowShard, 0},
    {(u8 *)OtherText_BlueShard, 0},
    {(u8 *)OtherText_GreenShard, 0},
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MenuAction MultichoiceList_01[] = {
    {(u8 *)gOtherText_CancelNoTerminator, 0},
};

const struct MultichoiceListStruct gMultichoiceLists[] = {
    {(struct MenuAction *)MultichoiceList_00, 3},
    {(struct MenuAction *)MultichoiceList_01, 1},
    {(struct MenuAction *)MultichoiceList_02, 3},
    {(struct MenuAction *)MultichoiceList_03, 4},
    {(struct MenuAction *)MultichoiceList_04, 6},
    {(struct MenuAction *)MultichoiceList_05, 3},
    {(struct MenuAction *)MultichoiceList_06, 4},
    {(struct MenuAction *)MultichoiceList_07, 4},
    {(struct MenuAction *)MultichoiceList_01, 1},
    {(struct MenuAction *)MultichoiceList_01, 1},
    {(struct MenuAction *)MultichoiceList_01, 1},
    {(struct MenuAction *)MultichoiceList_01, 1},
    {(struct MenuAction *)MultichoiceList_12, 2},
    {(struct MenuAction *)MultichoiceList_13, 6},
    {(struct MenuAction *)MultichoiceList_14, 2},
    {(struct MenuAction *)MultichoiceList_01, 1},
    {(struct MenuAction *)MultichoiceList_16, 2},
    {(struct MenuAction *)MultichoiceList_17, 3},
    {(struct MenuAction *)MultichoiceList_18, 4},
    {(struct MenuAction *)MultichoiceList_19, 3},
    {(struct MenuAction *)MultichoiceList_20, 3},
    {(struct MenuAction *)MultichoiceList_01, 1},
    {(struct MenuAction *)MultichoiceList_01, 1},
    {(struct MenuAction *)MultichoiceList_23, 3},
    {(struct MenuAction *)MultichoiceList_24, 3},
    {(struct MenuAction *)MultichoiceList_25, 3},
    {(struct MenuAction *)MultichoiceList_26, 3},
    {(struct MenuAction *)MultichoiceList_27, 3},
    {(struct MenuAction *)MultichoiceList_28, 3},
    {(struct MenuAction *)MultichoiceList_29, 3},
    {(struct MenuAction *)MultichoiceList_30, 3},
    {(struct MenuAction *)MultichoiceList_31, 3},
    {(struct MenuAction *)MultichoiceList_32, 3},
    {(struct MenuAction *)MultichoiceList_33, 3},
    {(struct MenuAction *)MultichoiceList_34, 3},
    {(struct MenuAction *)MultichoiceList_35, 3},
    {(struct MenuAction *)MultichoiceList_36, 3},
    {(struct MenuAction *)MultichoiceList_37, 3},
    {(struct MenuAction *)MultichoiceList_38, 3},
    {(struct MenuAction *)MultichoiceList_39, 3},
    {(struct MenuAction *)MultichoiceList_01, 1},
    {(struct MenuAction *)MultichoiceList_01, 1},
    {(struct MenuAction *)MultichoiceList_42, 4},
    {(struct MenuAction *)MultichoiceList_43, 4},
    {(struct MenuAction *)MultichoiceList_44, 4},
    {(struct MenuAction *)MultichoiceList_45, 2},
    {(struct MenuAction *)MultichoiceList_46, 3},
    {(struct MenuAction *)MultichoiceList_47, 8},
    {(struct MenuAction *)MultichoiceList_48, 4},
    {(struct MenuAction *)MultichoiceList_49, 3},
    {(struct MenuAction *)MultichoiceList_50, 2},
    {(struct MenuAction *)MultichoiceList_01, 1},
    {(struct MenuAction *)MultichoiceList_52, 3},
    {(struct MenuAction *)MultichoiceList_53, 3},
    {(struct MenuAction *)MultichoiceList_54, 2},
    {(struct MenuAction *)MultichoiceList_55, 6},
    {(struct MenuAction *)MultichoiceList_56, 3},
    {(struct MenuAction *)MultichoiceList_57, 5},
    {(struct MenuAction *)MultichoiceList_58, 2},
    {(struct MenuAction *)MultichoiceList_59, 2},
    {(struct MenuAction *)MultichoiceList_60, 3},
    {(struct MenuAction *)MultichoiceList_61, 2},
    {(struct MenuAction *)MultichoiceList_62, 3},
    {(struct MenuAction *)MultichoiceList_63, 3},
    {(struct MenuAction *)MultichoiceList_64, 4},
    {(struct MenuAction *)MultichoiceList_65, 2},
    {(struct MenuAction *)MultichoiceList_66, 3},
    {(struct MenuAction *)MultichoiceList_67, 3},
    {(struct MenuAction *)MultichoiceList_68, 4},
    {(struct MenuAction *)MultichoiceList_69, 3},
    {(struct MenuAction *)MultichoiceList_70, 4},
    {(struct MenuAction *)MultichoiceList_71, 4},
    {(struct MenuAction *)MultichoiceList_72, 5}
};

const struct TextStruct gUnknown_083CE048[] = {
    OtherText_Cool2,
    OtherText_Beauty3,
    OtherText_Cute2,
    OtherText_Smart2,
    OtherText_Tough2,
    OtherText_Normal,
    OtherText_Super,
    OtherText_Hyper,
    OtherText_Master,
    OtherText_Cool3,
    OtherText_Beauty4,
    OtherText_Cute3,
    OtherText_Smart3,
    OtherText_Tough3,
    OtherText_Items,
    OtherText_KeyItems,
    OtherText_Balls,
    OtherText_TMsHMs,
    OtherText_Berries,
};

extern u8 gPCText_WhichPCShouldBeAccessed[];

extern u16 gScriptResult;

// field_effect
extern void FreeResourcesAndDestroySprite(struct Sprite *sprite);
extern u8 CreateMonSprite_PicBox(u16, s16, s16, u8);

bool8 sub_80B5054(u8 left, u8 top, u8 var3, u8 var4)
{
    if (FuncIsActiveTask(sub_80B52B4) == 1)
        return FALSE;
    else
    {
        gScriptResult = 0xFF;
        DrawMultichoiceMenu(left, top, gMultichoiceLists[var3].count, gMultichoiceLists[var3].list, var4, 0);
        return TRUE;
    }
}

bool8 sub_80B50B0(u8 left, u8 top, u8 var3, u8 var4, u8 var5)
{
    if (FuncIsActiveTask(sub_80B52B4) == 1)
        return FALSE;
    else
    {
        gScriptResult = 0xFF;
        DrawMultichoiceMenu(left, top, gMultichoiceLists[var3].count, gMultichoiceLists[var3].list, var4, var5);
        return TRUE;
    }
}

u16 GetStringWidthInTilesForScriptMenu(const u8 *str)
{
    // each tile on screen is 8x8, so it needs the number of tiles and not pixels, hence the division by 8.
    return (GetStringWidthGivenWindowConfig((struct WindowConfig *)&gWindowConfig_81E6CE4, str) + 7) / 8;
}

void DrawMultichoiceMenu(u8 left, u8 top, u8 count, struct MenuAction *list, u8 var4, u8 cursorPos)
{
    u16 width = GetStringWidthInTilesForScriptMenu(list[0].text);
    u16 newWidth;
    u8 i;
    u8 right;
    u8 bottom;

    for (i = 1; i < count; i++)
    {
        newWidth = GetStringWidthInTilesForScriptMenu(list[i].text);
        if (width < newWidth)
            width = newWidth;
    }

    right = width;
    right = (right + left) + 1;

    if (right > 29)
    {
        left = left + (29 - right);
        right = 29;
    }

    bottom = top + (2 * count + 1);

    MenuDrawTextWindow(left, top, right, bottom);
    PrintMenuItems(left + 1, top + 1, count, list);
    InitMenu(0, left + 1, top + 1, count, cursorPos, right - left - 1);
    sub_80B5230(left, top, right, bottom, var4, count);
}

void sub_80B5230(u8 left, u8 top, u8 right, u8 bottom, u8 unkVar, u8 count)
{
    u8 taskId = CreateTask(sub_80B52B4, 80);

    gTasks[taskId].data[0] = left;
    gTasks[taskId].data[1] = top;
    gTasks[taskId].data[2] = right;
    gTasks[taskId].data[3] = bottom;
    gTasks[taskId].data[4] = unkVar;

    if (count > 3)
        gTasks[taskId].data[5] = TRUE;
    else
        gTasks[taskId].data[5] = FALSE;
}

void sub_80B52B4(u8 taskId)
{
    s8 var;

    if (!gPaletteFade.active)
    {
        if (!gTasks[taskId].data[5])
            var = ProcessMenuInputNoWrap();
        else
            var = ProcessMenuInput();

        if (var != -2)
        {
            if (var == -1)
            {
                if (!gTasks[taskId].data[4])
                {
                    PlaySE(5);
                    gScriptResult = 127;
                }
                else
                {
                    return;
                }
            }
            else
            {
                gScriptResult = var;
            }
            sub_8072DEC();
            MenuZeroFillWindowRect(gTasks[taskId].data[0], gTasks[taskId].data[1], gTasks[taskId].data[2], gTasks[taskId].data[3]);
            DestroyTask(taskId);
            EnableBothScriptContexts();
        }
    }
}

bool8 Multichoice(u8 var1, u8 var2, u8 var3, u8 var4)
{
    if (FuncIsActiveTask(sub_80B52B4) == 1)
        return FALSE;
    else
    {
        gScriptResult = 0xFF;
        sub_80B53B4(var1, var2, gMultichoiceLists[var3].count, gMultichoiceLists[var3].list, var4);
        return TRUE;
    }
}

void sub_80B53B4(u8 left, u8 top, u8 count, struct MenuAction *list, u8 var4)
{
    u16 width = GetStringWidthInTilesForScriptMenu(list[0].text);
    u16 newWidth;
    u8 i;
    u8 right;
    u8 bottom;

    for (i = 1; i < count; i++)
    {
        newWidth = GetStringWidthInTilesForScriptMenu(list[i].text);
        if (width < newWidth)
            width = newWidth;
    }

    right = width;
    right = (right + left) + 2;
    bottom = top + (2 * count + 1);

    PrintMenuItems(left, top, count, list);
    InitMenu(0, left, top, count, 0, right - left - 1);
    sub_80B5230(left, top, right, bottom, var4, count);
}

bool8 yes_no_box(u8 var1, u8 var2)
{
    u8 taskId;

    if (FuncIsActiveTask(task_yes_no_maybe) == 1)
        return FALSE;
    else
    {
        gScriptResult = 0xFF;
        DisplayYesNoMenu(var1, var2, 1);
        taskId = CreateTask(task_yes_no_maybe, 0x50);
        gTasks[taskId].data[0] = var1;
        gTasks[taskId].data[1] = var2;
        return TRUE;
    }
}

// unused
bool8 IsScriptActive(void)
{
    if (gScriptResult == 0xFF)
        return FALSE;
    else
        return TRUE;
}

void task_yes_no_maybe(u8 taskId)
{
    u8 left, top;

    if (gTasks[taskId].data[2] < 5)
    {
        gTasks[taskId].data[2]++;
        return;
    }

    switch (ProcessMenuInputNoWrap())
    {
    case -2:
        return;
    case -1:
    case 1:
        PlaySE(5);
        gScriptResult = 0;
        break;
    case 0:
        gScriptResult = 1;
        break;
    }

    left = gTasks[taskId].data[0];
    top = gTasks[taskId].data[1];

    MenuZeroFillWindowRect(left, top, left + 6, top + 5);
    DestroyTask(taskId);
    EnableBothScriptContexts();
}

bool8 sub_80B5578(u8 left, u8 top, u8 multichoiceId, u8 a4, u8 columnCount)
{
    u8 bottom = 0;

    if (FuncIsActiveTask(sub_80B5684) == TRUE)
    {
        return FALSE;
    }
    else
    {
        u8 taskId;
        u8 width;

        gScriptResult = 0xFF;

        sub_807274C(left, top, gMultichoiceLists[multichoiceId].count, 0, gMultichoiceLists[multichoiceId].list, columnCount, 0);

        taskId = CreateTask(sub_80B5684, 80);

        if (!((gMultichoiceLists[multichoiceId].count >> 1) < columnCount || (gMultichoiceLists[multichoiceId].count & 1))
         || columnCount == 1 || gMultichoiceLists[multichoiceId].count == columnCount)
        {
            bottom = (2 * (gMultichoiceLists[multichoiceId].count / columnCount)) + 1 + top;
        }
        else
        {
            bottom = (2 * (gMultichoiceLists[multichoiceId].count / columnCount)) + 3 + top;
        }

        width = sub_807288C(columnCount);
        gTasks[taskId].data[0] = left;
        gTasks[taskId].data[1] = top;
        gTasks[taskId].data[2] = width + left + 2;
        gTasks[taskId].data[3] = bottom;
        gTasks[taskId].data[4] = a4;
        return TRUE;
    }
}

void sub_80B5684(u8 taskId)
{
    s8 var = sub_80727CC();

    if (var != -2)
    {
        if (var == -1)
        {
            if (!gTasks[taskId].data[4])
            {
                PlaySE(5);
                gScriptResult = 127;
            }
            else
            {
                return;
            }
        }
        else
        {
            gScriptResult = var;
        }
        sub_8072DEC();
        MenuZeroFillWindowRect(gTasks[taskId].data[0], gTasks[taskId].data[1], gTasks[taskId].data[2], gTasks[taskId].data[3]);
        DestroyTask(taskId);
        EnableBothScriptContexts();
    }
}

bool8 TryCreatePCMenu(void)
{
    if (FuncIsActiveTask(sub_80B52B4) == 1)
        return FALSE;
    else
    {
        gScriptResult = 0xFF;
        CreatePCMenu();
        return TRUE;
    }
}

void CreatePCMenu(void)
{
    u16 playersPCWidth = GetStringWidthInTilesForScriptMenu(gPCText_PlayersPC);
    u8 width;
    u8 numChoices;

    if (playersPCWidth > GetStringWidthInTilesForScriptMenu(gPCText_SomeonesPC))
        width = playersPCWidth;
    else
        width = 8;

    if (FlagGet(SYS_GAME_CLEAR)) // player has cleared game?
    {
        numChoices = 4;
        MenuDrawTextWindow(0, 0, width + 2, 9);
        MenuPrint(gPCText_HallOfFame, 1, 5);
        MenuPrint(gPCText_LogOff, 1, 7);
    }
    else
    {
        numChoices = 3;
        MenuDrawTextWindow(0, 0, width + 2, 7);
        MenuPrint(gPCText_LogOff, 1, 5);
    }

    if (FlagGet(SYS_PC_LANETTE)) // player met lanette?
        MenuPrint(gPCText_LanettesPC, 1, 1);
    else
        MenuPrint(gPCText_SomeonesPC, 1, 1);

    MenuPrint(gPCText_PlayersPC, 1, 3);
    InitMenu(0, 1, 1, numChoices, 0, width + 1);
    sub_80B5230(0, 0, width + 2, 2 * numChoices + 1, 0, numChoices);
}

void sub_80B5838(void)
{
    MenuDisplayMessageBox();
    MenuPrint(gPCText_WhichPCShouldBeAccessed, 2, 15);
}

void task_picbox(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        task->data[0]++;
        break;
    case 1:
        break;
    case 2:
        FreeResourcesAndDestroySprite(&gSprites[task->data[2]]);
        task->data[0]++;
        break;
    case 3:
        MenuZeroFillWindowRect(task->data[3], task->data[4], task->data[3] + 9, task->data[4] + 10);
        DestroyTask(taskId);
        break;
    }
}

bool8 sub_80B58C4(u16 var1, u8 var2, u8 var3)
{
    u8 taskId;
    u8 var;

    if (FindTaskIdByFunc(task_picbox) != 0xFF)
        return FALSE;
    else
    {
        MenuDrawTextWindow(var2, var3, var2 + 9, var3 + 10);
        taskId = CreateTask(task_picbox, 0x50);
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].data[1] = var1;
        var = CreateMonSprite_PicBox(var1, var2 * 8 + 40, var3 * 8 + 40, 0);
        gTasks[taskId].data[2] = var;
        gTasks[taskId].data[3] = var2;
        gTasks[taskId].data[4] = var3;
        gSprites[var].callback = SpriteCallbackDummy;
        gSprites[var].oam.priority = 0;
        return TRUE;
    }
}

void *picbox_close(void)
{
    u8 taskId = FindTaskIdByFunc(task_picbox);

    if (taskId == 0xFF)
        return NULL;

    gTasks[taskId].data[0]++;
    return (void *)sub_80B59AC;
}

bool8 sub_80B59AC(void)
{
    if (FindTaskIdByFunc(task_picbox) == 0xFF)
        return TRUE;
    else
        return FALSE;
}
