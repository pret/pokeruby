#include "global.h"
#include "new_game.h"
#include "asm.h"
#include "berry.h"
#include "play_time.h"
#include "pokemon_size_record.h"
#include "script.h"
#include "rom4.h"
#include "pokedex.h"
#include "lottery_corner.h"
#include "rng.h"
#include "rtc.h"
#include "event_data.h"

extern u8 gUnknown_020297EC;

extern u8 gPlayerPartyCount;
extern u8 gUnknown_03005CE8;
extern u16 gSaveFileStatus;

extern u8 gUnknown_0819FA81[];

const struct SB1_2EFC_Struct gUnknown_08216604 =
{
    {
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    }
};

void write_word_to_mem(u32 var, u8 *dataPtr)
{
    dataPtr[0] = var;
    dataPtr[1] = var >> 8;
    dataPtr[2] = var >> 16;
    dataPtr[3] = var >> 24;
}

void copy_word_to_mem(u8 *copyTo, u8 *copyFrom)
{
    s32 i;
    for (i = 0; i < 4; i++)
        copyTo[i] = copyFrom[i];
}

void set_player_trainer_id(void)
{
    write_word_to_mem((Random() << 16) | Random(), gSaveBlock2.playerTrainerId);
}

// L=A isnt set here for some reason.
void SetDefaultOptions(void)
{
    gSaveBlock2.optionsTextSpeed = OPTIONS_TEXT_SPEED_MID;
    gSaveBlock2.optionsWindowFrameType = 0;
    gSaveBlock2.optionsSound = OPTIONS_SOUND_MONO;
    gSaveBlock2.optionsBattleStyle = OPTIONS_BATTLE_STYLE_SHIFT;
    gSaveBlock2.optionsBattleSceneOff = FALSE;
    gSaveBlock2.regionMapZoom = FALSE;
}

void ClearPokedexFlags(void)
{
    gUnknown_03005CE8 = 0;
    memset(&gSaveBlock2.pokedex.owned, 0, sizeof(gSaveBlock2.pokedex.owned));
    memset(&gSaveBlock2.pokedex.seen, 0, sizeof(gSaveBlock2.pokedex.seen));
}

void sub_8052DA8(void)
{
    s32 i;
    sub_80B2D1C();
    for (i = 0; i < 5; i++)
        gSaveBlock1.sb1_2EFC_struct[i] = gUnknown_08216604;
}

void sub_8052DE4(void)
{
    CpuFill32(0, &gSaveBlock2.filler_A8, sizeof(gSaveBlock2.filler_A8));
}

void WarpToTruck(void)
{
    warp1_set(25, 40, -1, -1, -1); // inside of truck
    warp_in();
}

void ClearSav2(void)
{
    CpuFill16(0, &gSaveBlock2, sizeof(gSaveBlock2));
    SetDefaultOptions();
}

void sub_8052E4C(void)
{
    gUnknown_020297EC = 0;
    sub_808C0A0();
    ZeroPlayerPartyMons();
    ZeroEnemyPartyMons();
    sub_80A3684();
}

void NewGameInitData(void)
{
    if (!gSaveFileStatus || gSaveFileStatus == 2)
        RtcReset();
    gUnknown_020297EC = 1;
    ZeroPlayerPartyMons();
    ZeroEnemyPartyMons();
    sub_808C02C();
    sub_8052DE4();
    memset(&gSaveBlock1, 0, sizeof(gSaveBlock1));
    sub_80A2B18();
    gSaveBlock2.specialSaveWarp = 0;
    set_player_trainer_id();
    PlayTimeCounter_Reset();
    ClearPokedexFlags();
    InitEventData();
    sub_80BD7A8();
    sub_80BDAB4();
    sub_80BB5B4();
    ClearBerryTrees();
    gSaveBlock1.money = 3000;
    sub_80AB1B0();
    ResetGameStats();
    sub_8052DA8();
    InitLinkBattleRecords();
    InitShroomishSizeRecord();
    InitBarboachSizeRecord();
    gPlayerPartyCount = 0;
    ZeroPlayerPartyMons();
    sub_80961D8();
    sub_81341F8();
    sub_813420C();
    gSaveBlock1.registeredItem = 0;
    sub_80A3714();
    NewGameInitPCItems();
    sub_810C994();
    sub_8133F80();
    sub_80E6764();
    sub_80F7AA4();
    sub_80FA17C();
    sub_810FA54();
    ResetLotteryCorner();
    WarpToTruck();
    ScriptContext2_RunNewScript(gUnknown_0819FA81);
}
