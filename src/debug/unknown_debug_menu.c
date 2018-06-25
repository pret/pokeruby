#include "global.h"
#include "battle_tower.h"
#include "menu.h"

extern u8 gBattleCommunication[];

extern u8 (*gMenuCallback)(void);

static u8 sub_814A4B8(void);
static u8 sub_814A464(void);

const u8 UnknownString_1stRound[] = _("1st round");
const u8 UnknownString_2ndRound[] = _("2nd round");
const u8 UnknownString_3rdRound[] = _("3rd round");
const u8 UnknownString_4thRound[] = _("4th round");
const u8 UnknownString_5thRound[] = _("5th round");
const u8 UnknownString_6thRound[] = _("6th round");
const u8 UnknownString_7thRound[] = _("7th round");
const u8 UnknownString_8thRound[] = _("8th round");


const struct MenuAction gUnknown_0842C29C[] = {
    {UnknownString_1stRound, sub_814A4B8},
    {UnknownString_2ndRound, sub_814A4B8},
    {UnknownString_3rdRound, sub_814A4B8},
    {UnknownString_4thRound, sub_814A4B8},
    {UnknownString_5thRound, sub_814A4B8},
    {UnknownString_6thRound, sub_814A4B8},
    {UnknownString_7thRound, sub_814A4B8},
    {UnknownString_8thRound, sub_814A4B8}
};

int InitSogabeDebugMenu(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 16, 18);
    Menu_PrintItems(2, 1, 8, gUnknown_0842C29C);
    InitMenu(0, 1, 1, 8, 0, 15);
    gMenuCallback = sub_814A464;
    return 0;
}

static u8 sub_814A464(void)
{
    s8 result = Menu_ProcessInput();
    if (result == -2)
    {
        return 0;
    }
    else if (result == -1)
    {
        CloseMenu();
        return 1;
    }
    else
    {
        gBattleCommunication[0] = result;
        gMenuCallback = gUnknown_0842C29C[result].func;
        return 0;
    }
}

static u8 sub_814A4B8(void)
{
    gSaveBlock2.battleTower.var_4AE[0] = 3;
    gSaveBlock2.battleTower.var_4AE[1] = 3;
    gSaveBlock2.battleTower.curStreakChallengesNum[0] = gBattleCommunication[0] + 1;
    gSaveBlock2.battleTower.curStreakChallengesNum[1] = gBattleCommunication[0] + 1;
    gSaveBlock2.battleTower.curChallengeBattleNum[0] = 1;
    gSaveBlock2.battleTower.curChallengeBattleNum[1] = 1;
    CloseMenu();
    return 1;
}
