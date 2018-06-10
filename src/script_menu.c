#include "global.h"
#include "script.h"
#include "script_menu.h"
#include "event_data.h"
#include "field_effect.h"
#include "menu.h"
#include "palette.h"
#include "script.h"
#include "constants/songs.h"
#include "sound.h"
#include "sprite.h"
#include "strings.h"
#include "task.h"

// multichoice lists
const struct MenuAction MultichoiceList_00[] =
{
    {OtherText_Petalburg, NULL},
    {OtherText_Slateport, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_02[] =
{
    {OtherText_Enter, NULL},
    {OtherText_Info3, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_03[] =
{
    {OtherText_WhatsAContest, NULL},
    {OtherText_TypesOfContest, NULL},
    {OtherText_Ranks, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_04[] =
{
    {OtherText_CoolContest, NULL},
    {OtherText_BeautyContest, NULL},
    {OtherText_CuteContest, NULL},
    {OtherText_SmartContest, NULL},
    {OtherText_ToughContest, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_06[] =
{
    {OtherText_Decoration, NULL},
    {OtherText_PackUp, NULL},
    {OtherText_Registry, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_05[] =
{
    {OtherText_Decoration, NULL},
    {OtherText_PackUp, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_07[] =
{
    {OtherText_Register, NULL},
    {OtherText_Registry, NULL},
    {OtherText_Information, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_12[] =
{
    {OtherText_Mach, NULL},
    {OtherText_Acro, NULL},
};

const struct MenuAction MultichoiceList_13[] =
{
    {OtherText_Poison, NULL},
    {OtherText_Paralysis, NULL},
    {OtherText_Sleep, NULL},
    {OtherText_Burn, NULL},
    {OtherText_Frozen, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_14[] =
{
    {OtherText_Dewford, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_16[] =
{
    {OtherText_SawIt, NULL},
    {OtherText_NotYet, NULL},
};

const struct MenuAction MultichoiceList_17[] =
{
    {OtherText_Yes, NULL},
    {OtherText_No, NULL},
    {OtherText_Info3, NULL},
};

const struct MenuAction MultichoiceList_18[] =
{
    {OtherText_SingleBattle, NULL},
    {OtherText_DoubleBattle, NULL},
    {OtherText_MultiBattle, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_19[] =
{
    {OtherText_Littleroot, NULL},
    {OtherText_Slateport, NULL},
    {OtherText_Lilycove, NULL},
};

const struct MenuAction MultichoiceList_20[] =
{
    {OtherText_Yes, NULL},
    {OtherText_No, NULL},
    {OtherText_Info3, NULL},
};

const struct MenuAction MultichoiceList_23[] =
{
    {OtherText_MakeAChallenge, NULL},
    {OtherText_ObtainInformation, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_24[] =
{
    {OtherText_Lv50_2, NULL},
    {OtherText_Lv100_2, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_25[] =
{
    {OtherText_Zigzagoon, NULL},
    {OtherText_Nincada, NULL},
    {OtherText_Poochyena, NULL},
};

const struct MenuAction MultichoiceList_26[] =
{
    {OtherText_Nincada2, NULL},
    {OtherText_Lotad, NULL},
    {OtherText_Roselia, NULL},
};

const struct MenuAction MultichoiceList_27[] =
{
    {OtherText_Shroomish, NULL},
    {OtherText_Nincada3, NULL},
    {OtherText_Surskit, NULL},
};

const struct MenuAction MultichoiceList_28[] =
{
    {OtherText_Treecko, NULL},
    {OtherText_Torchic, NULL},
    {OtherText_Mudkip, NULL},
};

const struct MenuAction MultichoiceList_29[] =
{
    {OtherText_Seedot, NULL},
    {OtherText_Shroomish2, NULL},
    {OtherText_Spinda, NULL},
};

const struct MenuAction MultichoiceList_30[] =
{
    {OtherText_Shroomish3, NULL},
    {OtherText_Zigzagoon2, NULL},
    {OtherText_Wurmple, NULL},
};

const struct MenuAction MultichoiceList_31[] =
{
    {OtherText_PokeBall, NULL},
    {OtherText_SuperPotion, NULL},
    {OtherText_SamePrice, NULL},
};

const struct MenuAction MultichoiceList_32[] =
{
    {OtherText_Yen135, NULL},
    {OtherText_Yen155, NULL},
    {OtherText_Yen175, NULL},
};

const struct MenuAction MultichoiceList_33[] =
{
    {OtherText_CostMore, NULL},
    {OtherText_CostLess, NULL},
    {OtherText_SamePrice2, NULL},
};

const struct MenuAction MultichoiceList_34[] =
{
    {OtherText_MaleSymbol, NULL},
    {OtherText_FemaleSymbol, NULL},
    {OtherText_Neither, NULL},
};

const struct MenuAction MultichoiceList_35[] =
{
    {OtherText_Males, NULL},
    {OtherText_Females, NULL},
    {OtherText_SameNumber, NULL},
};

const struct MenuAction MultichoiceList_36[] =
{
    {OtherText_Male, NULL},
    {OtherText_Female, NULL},
    {OtherText_ItDepends, NULL},
};

const struct MenuAction MultichoiceList_37[] =
{
    {OtherText_Six2, NULL},
    {OtherText_Eight2, NULL},
    {OtherText_Ten, NULL},
};

const struct MenuAction MultichoiceList_38[] =
{
    {OtherText_One, NULL},
    {OtherText_Two, NULL},
    {OtherText_Three, NULL},
};

const struct MenuAction MultichoiceList_39[] =
{
    {OtherText_Six, NULL},
    {OtherText_Seven, NULL},
    {OtherText_Eight, NULL},
};

const struct MenuAction MultichoiceList_42[] =
{
    {OtherText_FreshWater, NULL},
    {OtherText_SodaPop, NULL},
    {OtherText_Lemonade, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_43[] =
{
    {OtherText_HowToRide, NULL},
    {OtherText_HowToTurn, NULL},
    {OtherText_SandySlopes, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_44[] =
{
    {OtherText_Wheelies, NULL},
    {OtherText_BunnyHops, NULL},
    {OtherText_Jumping, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_45[] =
{
    {OtherText_Satisfied, NULL},
    {OtherText_Dissatisfied, NULL},
};

const struct MenuAction MultichoiceList_46[] =
{
    {OtherText_Deepseatooth, NULL},
    {OtherText_Deepseascale, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_47[] =
{
    {OtherText_BlueFlute2, NULL},
    {OtherText_YellowFlute2, NULL},
    {OtherText_RedFlute2, NULL},
    {OtherText_WhiteFlute2, NULL},
    {OtherText_BlackFlute2, NULL},
    {OtherText_GlassChair, NULL},
    {OtherText_GlassDesk, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_48[] =
{
    {OtherText_TreeckoDoll, NULL},
    {OtherText_TorchicDoll, NULL},
    {OtherText_MudkipDoll, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_55[] =
{
    {OtherText_TM32, NULL},
    {OtherText_TM29, NULL},
    {OtherText_TM35, NULL},
    {OtherText_TM24, NULL},
    {OtherText_TM13, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_49[] =
{
    {OtherText_50Coins, NULL},
    {OtherText_500Coins, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_50[] =
{
    {OtherText_Excellent, NULL},
    {OtherText_NotSoHot, NULL},
};

const struct MenuAction MultichoiceList_52[] =
{
    {OtherText_Lilycove, NULL},
    {OtherText_BattleTower, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_53[] =
{
    {OtherText_Slateport, NULL},
    {OtherText_Lilycove, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_54[] =
{
    {OtherText_Right, NULL},
    {OtherText_Left, NULL},
};

const struct MenuAction MultichoiceList_56[] =
{
    {OtherText_Slateport, NULL},
    {OtherText_BattleTower, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_57[] =
{
    {OtherText_1F_2, NULL},
    {OtherText_2F_2, NULL},
    {OtherText_3F_2, NULL},
    {OtherText_4F_2, NULL},
    {OtherText_5F_2, NULL},
};

const struct MenuAction MultichoiceList_58[] =
{
    {OtherText_RedShard, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_59[] =
{
    {OtherText_YellowShard, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_60[] =
{
    {OtherText_RedShard, NULL},
    {OtherText_YellowShard, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_61[] =
{
    {OtherText_BlueShard, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_62[] =
{
    {OtherText_RedShard, NULL},
    {OtherText_BlueShard, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_63[] =
{
    {OtherText_YellowShard, NULL},
    {OtherText_BlueShard, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_64[] =
{
    {OtherText_RedShard, NULL},
    {OtherText_YellowShard, NULL},
    {OtherText_BlueShard, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_65[] =
{
    {OtherText_GreenShard, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_66[] =
{
    {OtherText_RedShard, NULL},
    {OtherText_GreenShard, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_67[] =
{
    {OtherText_YellowShard, NULL},
    {OtherText_GreenShard, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_68[] =
{
    {OtherText_RedShard, NULL},
    {OtherText_YellowShard, NULL},
    {OtherText_GreenShard, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_69[] =
{
    {OtherText_BlueShard, NULL},
    {OtherText_GreenShard, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_70[] =
{
    {OtherText_RedShard, NULL},
    {OtherText_BlueShard, NULL},
    {OtherText_GreenShard, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_71[] =
{
    {OtherText_YellowShard, NULL},
    {OtherText_BlueShard, NULL},
    {OtherText_GreenShard, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_72[] =
{
    {OtherText_RedShard, NULL},
    {OtherText_YellowShard, NULL},
    {OtherText_BlueShard, NULL},
    {OtherText_GreenShard, NULL},
    {gOtherText_CancelNoTerminator, NULL},
};

const struct MenuAction MultichoiceList_01[] =
{
    {gOtherText_CancelNoTerminator, NULL},
};

struct MultichoiceListStruct
{
    const struct MenuAction *list;
    u8 count;
};

const struct MultichoiceListStruct gMultichoiceLists[] =
{
    {MultichoiceList_00, ARRAY_COUNT(MultichoiceList_00)},
    {MultichoiceList_01, ARRAY_COUNT(MultichoiceList_01)},
    {MultichoiceList_02, ARRAY_COUNT(MultichoiceList_02)},
    {MultichoiceList_03, ARRAY_COUNT(MultichoiceList_03)},
    {MultichoiceList_04, ARRAY_COUNT(MultichoiceList_04)},
    {MultichoiceList_05, ARRAY_COUNT(MultichoiceList_05)},
    {MultichoiceList_06, ARRAY_COUNT(MultichoiceList_06)},
    {MultichoiceList_07, ARRAY_COUNT(MultichoiceList_07)},
    {MultichoiceList_01, ARRAY_COUNT(MultichoiceList_01)},
    {MultichoiceList_01, ARRAY_COUNT(MultichoiceList_01)},
    {MultichoiceList_01, ARRAY_COUNT(MultichoiceList_01)},
    {MultichoiceList_01, ARRAY_COUNT(MultichoiceList_01)},
    {MultichoiceList_12, ARRAY_COUNT(MultichoiceList_12)},
    {MultichoiceList_13, ARRAY_COUNT(MultichoiceList_13)},
    {MultichoiceList_14, ARRAY_COUNT(MultichoiceList_14)},
    {MultichoiceList_01, ARRAY_COUNT(MultichoiceList_01)},
    {MultichoiceList_16, ARRAY_COUNT(MultichoiceList_16)},
    {MultichoiceList_17, ARRAY_COUNT(MultichoiceList_17)},
    {MultichoiceList_18, ARRAY_COUNT(MultichoiceList_18)},
    {MultichoiceList_19, ARRAY_COUNT(MultichoiceList_19)},
    {MultichoiceList_20, ARRAY_COUNT(MultichoiceList_20)},
    {MultichoiceList_01, ARRAY_COUNT(MultichoiceList_01)},
    {MultichoiceList_01, ARRAY_COUNT(MultichoiceList_01)},
    {MultichoiceList_23, ARRAY_COUNT(MultichoiceList_23)},
    {MultichoiceList_24, ARRAY_COUNT(MultichoiceList_24)},
    {MultichoiceList_25, ARRAY_COUNT(MultichoiceList_25)},
    {MultichoiceList_26, ARRAY_COUNT(MultichoiceList_26)},
    {MultichoiceList_27, ARRAY_COUNT(MultichoiceList_27)},
    {MultichoiceList_28, ARRAY_COUNT(MultichoiceList_28)},
    {MultichoiceList_29, ARRAY_COUNT(MultichoiceList_29)},
    {MultichoiceList_30, ARRAY_COUNT(MultichoiceList_30)},
    {MultichoiceList_31, ARRAY_COUNT(MultichoiceList_31)},
    {MultichoiceList_32, ARRAY_COUNT(MultichoiceList_32)},
    {MultichoiceList_33, ARRAY_COUNT(MultichoiceList_33)},
    {MultichoiceList_34, ARRAY_COUNT(MultichoiceList_34)},
    {MultichoiceList_35, ARRAY_COUNT(MultichoiceList_35)},
    {MultichoiceList_36, ARRAY_COUNT(MultichoiceList_36)},
    {MultichoiceList_37, ARRAY_COUNT(MultichoiceList_37)},
    {MultichoiceList_38, ARRAY_COUNT(MultichoiceList_38)},
    {MultichoiceList_39, ARRAY_COUNT(MultichoiceList_39)},
    {MultichoiceList_01, ARRAY_COUNT(MultichoiceList_01)},
    {MultichoiceList_01, ARRAY_COUNT(MultichoiceList_01)},
    {MultichoiceList_42, ARRAY_COUNT(MultichoiceList_42)},
    {MultichoiceList_43, ARRAY_COUNT(MultichoiceList_43)},
    {MultichoiceList_44, ARRAY_COUNT(MultichoiceList_44)},
    {MultichoiceList_45, ARRAY_COUNT(MultichoiceList_45)},
    {MultichoiceList_46, ARRAY_COUNT(MultichoiceList_46)},
    {MultichoiceList_47, ARRAY_COUNT(MultichoiceList_47)},
    {MultichoiceList_48, ARRAY_COUNT(MultichoiceList_48)},
    {MultichoiceList_49, ARRAY_COUNT(MultichoiceList_49)},
    {MultichoiceList_50, ARRAY_COUNT(MultichoiceList_50)},
    {MultichoiceList_01, ARRAY_COUNT(MultichoiceList_01)},
    {MultichoiceList_52, ARRAY_COUNT(MultichoiceList_52)},
    {MultichoiceList_53, ARRAY_COUNT(MultichoiceList_53)},
    {MultichoiceList_54, ARRAY_COUNT(MultichoiceList_54)},
    {MultichoiceList_55, ARRAY_COUNT(MultichoiceList_55)},
    {MultichoiceList_56, ARRAY_COUNT(MultichoiceList_56)},
    {MultichoiceList_57, ARRAY_COUNT(MultichoiceList_57)},
    {MultichoiceList_58, ARRAY_COUNT(MultichoiceList_58)},
    {MultichoiceList_59, ARRAY_COUNT(MultichoiceList_59)},
    {MultichoiceList_60, ARRAY_COUNT(MultichoiceList_60)},
    {MultichoiceList_61, ARRAY_COUNT(MultichoiceList_61)},
    {MultichoiceList_62, ARRAY_COUNT(MultichoiceList_62)},
    {MultichoiceList_63, ARRAY_COUNT(MultichoiceList_63)},
    {MultichoiceList_64, ARRAY_COUNT(MultichoiceList_64)},
    {MultichoiceList_65, ARRAY_COUNT(MultichoiceList_65)},
    {MultichoiceList_66, ARRAY_COUNT(MultichoiceList_66)},
    {MultichoiceList_67, ARRAY_COUNT(MultichoiceList_67)},
    {MultichoiceList_68, ARRAY_COUNT(MultichoiceList_68)},
    {MultichoiceList_69, ARRAY_COUNT(MultichoiceList_69)},
    {MultichoiceList_70, ARRAY_COUNT(MultichoiceList_70)},
    {MultichoiceList_71, ARRAY_COUNT(MultichoiceList_71)},
    {MultichoiceList_72, ARRAY_COUNT(MultichoiceList_72)},
};

const u8 *const gUnknown_083CE048[] =
{
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

extern u16 gSpecialVar_Result;

static void Task_HandleMultichoiceInput(u8);
static void Task_HandleYesNoInput(u8);
static void Task_HandleMultichoiceGridInput(u8);
static u16 GetStringWidthInTilesForScriptMenu(const u8 *str);
static void DrawMultichoiceMenu(u8, u8, u8, const struct MenuAction *list, u8, u8);
static void StartScriptMenuTask(u8, u8, u8, u8, u8, u8);
static void sub_80B53B4(u8, u8, u8, const struct MenuAction *list, u8);
static bool8 IsPicboxClosed(void);

bool8 ScriptMenu_Multichoice(u8 left, u8 top, u8 multichoiceId, u8 ignoreBPress)
{
    if (FuncIsActiveTask(Task_HandleMultichoiceInput) == TRUE)
    {
        return FALSE;
    }
    else
    {
        gSpecialVar_Result = 0xFF;
        DrawMultichoiceMenu(left, top, gMultichoiceLists[multichoiceId].count, gMultichoiceLists[multichoiceId].list, ignoreBPress, 0);
        return TRUE;
    }
}

bool8 ScriptMenu_MultichoiceWithDefault(u8 left, u8 top, u8 multichoiceId, u8 ignoreBPress, u8 defaultChoice)
{
    if (FuncIsActiveTask(Task_HandleMultichoiceInput) == TRUE)
    {
        return FALSE;
    }
    else
    {
        gSpecialVar_Result = 0xFF;
        DrawMultichoiceMenu(left, top, gMultichoiceLists[multichoiceId].count, gMultichoiceLists[multichoiceId].list, ignoreBPress, defaultChoice);
        return TRUE;
    }
}

static u16 GetStringWidthInTilesForScriptMenu(const u8 *str)
{
    // each tile on screen is 8x8, so it needs the number of tiles and not pixels, hence the division by 8.
    return (Text_GetStringWidthFromWindowTemplate((struct WindowTemplate *)&gMenuTextWindowTemplate, str) + 7) / 8;
}

static void DrawMultichoiceMenu(u8 left, u8 top, u8 count, const struct MenuAction *list, u8 ignoreBPress, u8 cursorPos)
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

    Menu_DrawStdWindowFrame(left, top, right, bottom);
    Menu_PrintItems(left + 1, top + 1, count, list);
    InitMenu(0, left + 1, top + 1, count, cursorPos, right - left - 1);
    StartScriptMenuTask(left, top, right, bottom, ignoreBPress, count);
}

#define tLeft         data[0]
#define tTop          data[1]
#define tRight        data[2]
#define tBottom       data[3]
#define tIgnoreBPress data[4]
#define tDoWrap       data[5]

static void StartScriptMenuTask(u8 left, u8 top, u8 right, u8 bottom, u8 ignoreBPress, u8 count)
{
    u8 taskId = CreateTask(Task_HandleMultichoiceInput, 80);

    gTasks[taskId].tLeft = left;
    gTasks[taskId].tTop = top;
    gTasks[taskId].tRight = right;
    gTasks[taskId].tBottom = bottom;
    gTasks[taskId].tIgnoreBPress = ignoreBPress;

    if (count > 3)
        gTasks[taskId].tDoWrap = TRUE;
    else
        gTasks[taskId].tDoWrap = FALSE;
}

static void Task_HandleMultichoiceInput(u8 taskId)
{
    s8 selection;

    if (!gPaletteFade.active)
    {
        if (!gTasks[taskId].tDoWrap)
            selection = Menu_ProcessInputNoWrap();
        else
            selection = Menu_ProcessInput();

        if (selection != -2)
        {
            if (selection == -1)
            {
                if (gTasks[taskId].tIgnoreBPress)
                    return;
                PlaySE(SE_SELECT);
                gSpecialVar_Result = 127;
            }
            else
            {
                gSpecialVar_Result = selection;
            }
            Menu_DestroyCursor();
            Menu_EraseWindowRect(gTasks[taskId].tLeft, gTasks[taskId].tTop, gTasks[taskId].tRight, gTasks[taskId].tBottom);
            DestroyTask(taskId);
            EnableBothScriptContexts();
        }
    }
}

bool8 Multichoice(u8 left, u8 top, u8 multichoiceId, u8 ignoreBPress)
{
    if (FuncIsActiveTask(Task_HandleMultichoiceInput) == TRUE)
    {
        return FALSE;
    }
    else
    {
        gSpecialVar_Result = 0xFF;
        sub_80B53B4(left, top, gMultichoiceLists[multichoiceId].count, gMultichoiceLists[multichoiceId].list, ignoreBPress);
        return TRUE;
    }
}

static void sub_80B53B4(u8 left, u8 top, u8 count, const struct MenuAction *list, u8 ignoreBPress)
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

    Menu_PrintItems(left, top, count, list);
    InitMenu(0, left, top, count, 0, right - left - 1);
    StartScriptMenuTask(left, top, right, bottom, ignoreBPress, count);
}

bool8 ScriptMenu_YesNo(u8 left, u8 top)
{
    u8 taskId;

    if (FuncIsActiveTask(Task_HandleYesNoInput) == TRUE)
    {
        return FALSE;
    }
    else
    {
        gSpecialVar_Result = 0xFF;
        DisplayYesNoMenu(left, top, 1);
        taskId = CreateTask(Task_HandleYesNoInput, 0x50);
        gTasks[taskId].tLeft = left;
        gTasks[taskId].tTop = top;
        return TRUE;
    }
}

// unused
bool8 IsScriptActive(void)
{
    if (gSpecialVar_Result == 0xFF)
        return FALSE;
    else
        return TRUE;
}

static void Task_HandleYesNoInput(u8 taskId)
{
    u8 left, top;

    if (gTasks[taskId].tRight < 5)
    {
        gTasks[taskId].tRight++;
        return;
    }

    switch (Menu_ProcessInputNoWrap())
    {
    case -2:
        return;
    case -1:
    case 1:
        PlaySE(SE_SELECT);
        gSpecialVar_Result = 0;
        break;
    case 0:
        gSpecialVar_Result = 1;
        break;
    }

    left = gTasks[taskId].tLeft;
    top = gTasks[taskId].tTop;

    Menu_EraseWindowRect(left, top, left + 6, top + 5);
    DestroyTask(taskId);
    EnableBothScriptContexts();
}

bool8 ScriptMenu_MultichoiceGrid(u8 left, u8 top, u8 multichoiceId, u8 ignoreBPress, u8 columnCount)
{
    u8 bottom = 0;

    if (FuncIsActiveTask(Task_HandleMultichoiceGridInput) == TRUE)
    {
        return FALSE;
    }
    else
    {
        u8 taskId;
        u8 width;

        gSpecialVar_Result = 0xFF;

        sub_807274C(left, top, gMultichoiceLists[multichoiceId].count, 0, gMultichoiceLists[multichoiceId].list, columnCount, 0);

        taskId = CreateTask(Task_HandleMultichoiceGridInput, 80);

        if (!((gMultichoiceLists[multichoiceId].count >> 1) < columnCount || (gMultichoiceLists[multichoiceId].count & 1))
         || columnCount == 1 || gMultichoiceLists[multichoiceId].count == columnCount)
        {
            bottom = (2 * (gMultichoiceLists[multichoiceId].count / columnCount)) + 1 + top;
        }
        else
        {
            bottom = (2 * (gMultichoiceLists[multichoiceId].count / columnCount)) + 3 + top;
        }

        width = Menu_GetColumnXCoord(columnCount);
        gTasks[taskId].tLeft = left;
        gTasks[taskId].tTop = top;
        gTasks[taskId].tRight = width + left + 2;
        gTasks[taskId].tBottom = bottom;
        gTasks[taskId].tIgnoreBPress = ignoreBPress;
        return TRUE;
    }
}

static void Task_HandleMultichoiceGridInput(u8 taskId)
{
    s8 selection = Menu_ProcessInputGridLayout();

    if (selection != -2)
    {
        if (selection == -1)
        {
            if (gTasks[taskId].tIgnoreBPress)
                return;
            PlaySE(SE_SELECT);
            gSpecialVar_Result = 127;
        }
        else
        {
            gSpecialVar_Result = selection;
        }
        Menu_DestroyCursor();
        Menu_EraseWindowRect(gTasks[taskId].tLeft, gTasks[taskId].tTop, gTasks[taskId].tRight, gTasks[taskId].tBottom);
        DestroyTask(taskId);
        EnableBothScriptContexts();
    }
}

#undef tLeft
#undef tTop
#undef tRight
#undef tBottom
#undef tIgnoreBPress
#undef tDoWrap

bool8 ScrSpecial_CreatePCMenu(void)
{
    if (FuncIsActiveTask(Task_HandleMultichoiceInput) == TRUE)
    {
        return FALSE;
    }
    else
    {
        gSpecialVar_Result = 0xFF;
        ScriptMenu_CreatePCMenu();
        return TRUE;
    }
}

#if ENGLISH
void ScriptMenu_CreatePCMenu(void)
{
    u16 playersPCWidth = GetStringWidthInTilesForScriptMenu(gPCText_PlayersPC);
    u8 width;
    u8 numChoices;

    if (playersPCWidth > GetStringWidthInTilesForScriptMenu(gPCText_SomeonesPC))
        width = playersPCWidth;
    else
        width = 8;

    if (FlagGet(FLAG_SYS_GAME_CLEAR)) // player has cleared game?
    {
        numChoices = 4;
        Menu_DrawStdWindowFrame(0, 0, width + 2, 9);
        Menu_PrintText(gPCText_HallOfFame, 1, 5);
        Menu_PrintText(gPCText_LogOff, 1, 7);
    }
    else
    {
        numChoices = 3;
        Menu_DrawStdWindowFrame(0, 0, width + 2, 7);
        Menu_PrintText(gPCText_LogOff, 1, 5);
    }

    if (FlagGet(FLAG_SYS_PC_LANETTE)) // player met lanette?
        Menu_PrintText(gPCText_LanettesPC, 1, 1);
    else
        Menu_PrintText(gPCText_SomeonesPC, 1, 1);

    Menu_PrintText(gPCText_PlayersPC, 1, 3);
    InitMenu(0, 1, 1, numChoices, 0, width + 1);
    StartScriptMenuTask(0, 0, width + 2, 2 * numChoices + 1, 0, numChoices);
}
#elif GERMAN
NAKED
void ScriptMenu_CreatePCMenu(void) {
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    sub sp, 0x18\n\
    ldr r0, _080B5748 @ =0x0000084b\n\
    bl FlagGet\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _080B5750\n\
    ldr r0, _080B574C @ =gPCText_LanettesPC\n\
    b _080B5752\n\
    .align 2, 0\n\
_080B5748: .4byte 0x0000084b\n\
_080B574C: .4byte gPCText_LanettesPC\n\
_080B5750:\n\
    ldr r0, _080B57E8 @ =gPCText_SomeonesPC\n\
_080B5752:\n\
    bl GetStringWidthInTilesForScriptMenu\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    str r0, [sp, 0x8]\n\
    movs r4, 0x1\n\
    ldr r0, _080B57EC @ =gPCText_PlayersPC\n\
    bl GetStringWidthInTilesForScriptMenu\n\
    lsls r1, r4, 2\n\
    add r1, sp\n\
    adds r1, 0x8\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    str r0, [r1]\n\
    ldr r0, _080B57F0 @ =gPCText_LogOff\n\
    bl GetStringWidthInTilesForScriptMenu\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    str r0, [sp, 0x10]\n\
    movs r4, 0x3\n\
    ldr r0, _080B57F4 @ =0x00000804\n\
    bl FlagGet\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _080B5798\n\
    ldr r0, _080B57F8 @ =gPCText_HallOfFame\n\
    bl GetStringWidthInTilesForScriptMenu\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    str r0, [sp, 0x14]\n\
    movs r4, 0x4\n\
_080B5798:\n\
    movs r5, 0\n\
    cmp r5, r4\n\
    bge _080B57B4\n\
    add r2, sp, 0x8\n\
    adds r1, r4, 0\n\
_080B57A2:\n\
    ldr r0, [r2]\n\
    cmp r5, r0\n\
    bge _080B57AC\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
_080B57AC:\n\
    adds r2, 0x4\n\
    subs r1, 0x1\n\
    cmp r1, 0\n\
    bne _080B57A2\n\
_080B57B4:\n\
    ldr r0, _080B57F4 @ =0x00000804\n\
    bl FlagGet\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _080B57FC\n\
    movs r7, 0x4\n\
    adds r4, r5, 0x2\n\
    lsls r2, r4, 24\n\
    lsrs r2, 24\n\
    movs r0, 0\n\
    movs r1, 0\n\
    movs r3, 0x9\n\
    bl Menu_DrawStdWindowFrame\n\
    ldr r0, _080B57F8 @ =gPCText_HallOfFame\n\
    movs r1, 0x1\n\
    movs r2, 0x5\n\
    bl Menu_PrintText\n\
    ldr r0, _080B57F0 @ =gPCText_LogOff\n\
    movs r1, 0x1\n\
    movs r2, 0x7\n\
    bl Menu_PrintText\n\
    b _080B5818\n\
    .align 2, 0\n\
_080B57E8: .4byte gPCText_SomeonesPC\n\
_080B57EC: .4byte gPCText_PlayersPC\n\
_080B57F0: .4byte gPCText_LogOff\n\
_080B57F4: .4byte 0x00000804\n\
_080B57F8: .4byte gPCText_HallOfFame\n\
_080B57FC:\n\
    movs r7, 0x3\n\
    adds r4, r5, 0x2\n\
    lsls r2, r4, 24\n\
    lsrs r2, 24\n\
    movs r0, 0\n\
    movs r1, 0\n\
    movs r3, 0x7\n\
    bl Menu_DrawStdWindowFrame\n\
    ldr r0, _080B5834 @ =gPCText_LogOff\n\
    movs r1, 0x1\n\
    movs r2, 0x5\n\
    bl Menu_PrintText\n\
_080B5818:\n\
    adds r6, r4, 0\n\
    ldr r0, _080B5838 @ =0x0000084b\n\
    bl FlagGet\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _080B5840\n\
    ldr r0, _080B583C @ =gPCText_LanettesPC\n\
    movs r1, 0x1\n\
    movs r2, 0x1\n\
    bl Menu_PrintText\n\
    b _080B584A\n\
    .align 2, 0\n\
_080B5834: .4byte gPCText_LogOff\n\
_080B5838: .4byte 0x0000084b\n\
_080B583C: .4byte gPCText_LanettesPC\n\
_080B5840:\n\
    ldr r0, _080B5888 @ =gPCText_SomeonesPC\n\
    movs r1, 0x1\n\
    movs r2, 0x1\n\
    bl Menu_PrintText\n\
_080B584A:\n\
    ldr r0, _080B588C @ =gPCText_PlayersPC\n\
    movs r1, 0x1\n\
    movs r2, 0x3\n\
    bl Menu_PrintText\n\
    movs r4, 0\n\
    str r4, [sp]\n\
    adds r0, r5, 0x1\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    str r0, [sp, 0x4]\n\
    movs r0, 0\n\
    movs r1, 0x1\n\
    movs r2, 0x1\n\
    adds r3, r7, 0\n\
    bl InitMenu\n\
    lsls r2, r6, 24\n\
    lsrs r2, 24\n\
    lsls r3, r7, 1\n\
    adds r3, 0x1\n\
    str r4, [sp]\n\
    str r7, [sp, 0x4]\n\
    movs r0, 0\n\
    movs r1, 0\n\
    bl StartScriptMenuTask\n\
    add sp, 0x18\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080B5888: .4byte gPCText_SomeonesPC\n\
_080B588C: .4byte gPCText_PlayersPC\n\
    .syntax divided\n");
}
#endif

void ScriptMenu_DisplayPCStartupPrompt(void)
{
    Menu_DisplayDialogueFrame();
    Menu_PrintText(gPCText_WhichPCShouldBeAccessed, 2, 15);
}

#define tState       data[0]
#define tMonSpecies  data[1]
#define tMonSpriteId data[2]
#define tWindowX     data[3]
#define tWindowY     data[4]

static void Task_PokemonPicWindow(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->tState)
    {
    case 0:
        task->tState++;
        break;
    case 1:
        break;
    case 2:
        FreeResourcesAndDestroySprite(&gSprites[task->tMonSpriteId]);
        task->tState++;
        break;
    case 3:
        Menu_EraseWindowRect(task->tWindowX, task->tWindowY, task->tWindowX + 9, task->tWindowY + 10);
        DestroyTask(taskId);
        break;
    }
}

bool8 ScriptMenu_ShowPokemonPic(u16 species, u8 x, u8 y)
{
    u8 taskId;
    u8 spriteId;

    if (FindTaskIdByFunc(Task_PokemonPicWindow) != 0xFF)
    {
        return FALSE;
    }
    else
    {
        Menu_DrawStdWindowFrame(x, y, x + 9, y + 10);
        taskId = CreateTask(Task_PokemonPicWindow, 0x50);
        gTasks[taskId].tState = 0;
        gTasks[taskId].tMonSpecies = species;
        spriteId = CreateMonSprite_PicBox(species, x * 8 + 40, y * 8 + 40, 0);
        gTasks[taskId].tMonSpriteId = spriteId;
        gTasks[taskId].tWindowX = x;
        gTasks[taskId].tWindowY = y;
        gSprites[spriteId].callback = SpriteCallbackDummy;
        gSprites[spriteId].oam.priority = 0;
        return TRUE;
    }
}  

bool8 (*ScriptMenu_GetPicboxWaitFunc(void))(void)
{
    u8 taskId = FindTaskIdByFunc(Task_PokemonPicWindow);

    if (taskId == 0xFF)
        return NULL;
    gTasks[taskId].tState++;
    return IsPicboxClosed;
}

static bool8 IsPicboxClosed(void)
{
    if (FindTaskIdByFunc(Task_PokemonPicWindow) == 0xFF)
        return TRUE;
    else
        return FALSE;
}

#undef tState      
#undef tMonSpecies 
#undef tMonSpriteId
#undef tWindowX    
#undef tWindowY  
