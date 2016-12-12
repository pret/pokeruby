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

extern u8 gUnknown_020297EC;

extern u8 gPlayerPartyCount;
extern u8 gUnknown_03005CE8;
extern u16 gSaveFileStatus;

extern u8 gUnknown_0819FA81[];
extern const struct SB1_2EFC_Struct gUnknown_08216604;

void write_word_to_mem(u32 a1, u8 *a2)
{
    a2[0] = a1;
    a2[1] = a1 >> 8;
    a2[2] = a1 >> 16;
    a2[3] = a1 >> 24;
}

void sub_8052D10(u8 *a1, u8 *a2)
{
    s32 i;
    for (i = 0; i < 4; i++)
        a1[i] = a2[i];
}

void set_player_trainer_id(void)
{
    write_word_to_mem((Random() << 16) | Random(), gSaveBlock2.playerTrainerId);
}

void SetDefaultOptions(void)
{
    gSaveBlock2.optionsTextSpeed = OPTIONS_TEXT_SPEED_MID;
    gSaveBlock2.optionsWindowFrameType = 0;
    gSaveBlock2.optionsSound = OPTIONS_SOUND_MONO;
    gSaveBlock2.optionsBattleStyle = OPTIONS_BATTLE_STYLE_SHIFT;
    gSaveBlock2.optionsBattleSceneOff = FALSE;
    gSaveBlock2.regionMapZoom = FALSE;
}

void sub_8052D78(void)
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

void sub_8052E04(void)
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
    sub_8052D78();
    sub_8069030();
    sub_80BD7A8();
    sub_80BDAB4();
    sub_80BB5B4();
    sub_80B4A90();
    gSaveBlock1.money = 3000;
    sub_80AB1B0();
    sub_80530AC();
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
    sub_8145A78();
    sub_8052E04();
    ScriptContext2_RunNewScript(gUnknown_0819FA81);
}
