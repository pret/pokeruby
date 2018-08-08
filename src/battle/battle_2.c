#include "global.h"
#include "constants/abilities.h"
#include "constants/battle_move_effects.h"
#include "constants/hold_effects.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/songs.h"
#include "constants/species.h"
#include "gba/flash_internal.h"
#include "battle.h"
#include "battle_ai.h"
#include "battle_interface.h"
#include "battle_message.h"
#include "battle_setup.h"
#include "battle_util.h"
#include "data2.h"
#include "decompress.h"
#include "event_data.h"
#include "evolution_scene.h"
#include "item.h"
#include "item_menu.h"
#include "link.h"
#include "main.h"
#include "m4a.h"
#include "name_string_util.h"
#include "overworld.h"
#include "palette.h"
#include "party_menu.h"
#include "pokeball.h"
#include "pokeblock.h"
#include "pokedex.h"
#include "pokemon.h"
#include "random.h"
#include "roamer.h"
#include "rom3.h"
#include "rom_8077ABC.h"
#include "rom_8094928.h"
#include "safari_zone.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
#include "trainer.h"
#include "trig.h"
#include "tv.h"
#include "scanline_effect.h"
#include "util.h"
#include "ewram.h"

struct UnknownStruct7
{
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
};

struct UnknownStruct8
{
    u8 unk0[7];
    u8 unk7;
    u8 unk8[18];
    u8 unk1A;
};

struct UnknownStruct12
{
    u32 unk0;
    u8 filler4[0x54];
};

extern void sub_802BBD4();

extern struct SpriteTemplate gUnknown_02024E8C;
extern const u8 Str_821F7B8[];
extern u8 gUnknown_02023A14_50;
extern const u16 gBattleTextboxPalette[];
extern const struct MonCoords gCastformFrontSpriteCoords[];
extern const u8 Str_821F7EA[];
extern const u8 gUnknown_Debug_821F7F3[];
extern const u8 BattleText_YesNo[];
extern u8 gStatStageRatios[][2];
extern u8 gActionsByTurnOrder[4];
extern struct UnknownPokemonStruct2 gMultiPartnerParty[];
extern u8 gBattleBufferB[][0x200];
extern u8 gActiveBattler;
extern u32 gBattleExecBuffer;
extern u8 gBattlersCount;
extern u16 gBattlerPartyIndexes[];
extern u8 gCurrentActionFuncId;
extern u8 gBanksByTurnOrder[];
extern struct UnknownStruct12 gUnknown_02024AD0[];
extern u8 gBankSpriteIds[];
extern u16 gCurrentMove;  // This is mis-named. It is a species, not a move ID.
extern u8 gLastUsedAbility;
extern u8 gStringBank;
extern u8 gAbsentBattlerFlags;
extern u8 gMultiHitCounter;
extern u8 gActionForBanks[];
extern u16 gUnknown_02024C2C[];
extern u16 gLastUsedMove[];
extern u16 gLastLandedMoves[];
extern u16 gLastHitByType[];
extern u16 gUnknown_02024C4C[];
extern u16 gLockedMoves[];
extern u8 gLastHitBy[];
extern u16 gChosenMovesByBanks[];
extern u32 gHitMarker;
extern u8 gUnknown_02024C70[];
extern u16 gSideAffecting[];
extern u32 gStatuses3[];
//extern u8 gDisableStructs[][0x1C];
extern u16 gPauseCounterBattle;
extern u16 gPaydayMoney;
extern u16 gRandomTurnNumber;
extern u8 gBattleCommunication[];
extern u8 gUnknown_02024D1F[];  // I don't actually know what type this is.
extern u8 gBattleOutcome;
extern u16 gUnknown_02024DE8;
extern u8 gActionSelectionCursor[];
extern u8 gMoveSelectionCursor[];
extern u8 gUnknown_02038470[];
extern struct Window gUnknown_030041D0;
extern struct Window gUnknown_03004210;
extern struct Window gUnknown_03004250;
extern u32 gUnknown_03004284;
extern MainCallback gPreBattleCallback1;
extern void (*gBattleMainFunc)(void);
extern u8 gLeveledUpInBattle;
extern void (*gBattleBankFunc[])(void);
extern u8 gHealthboxIDs[];
extern u16 gBattleTypeFlags;
extern s8 gBattleTerrain;  // I'm not sure if this is supposed to be s8 or u8. Regardless, it must have the same type as the return value of BattleSetup_GetTerrain.
extern u8 gReservedSpritePaletteCount;
extern u16 gTrainerBattleOpponent;
extern struct BattleEnigmaBerry gEnigmaBerries[];
extern u16 gBlockRecvBuffer[MAX_LINK_PLAYERS][BLOCK_BUFFER_SIZE / 2];
extern u8 gBattleMonForms[];
extern u8 gBankAttacker;
extern u8 gBankTarget;
extern u16 gBattleWeather;
extern s32 gBattleMoveDamage;
extern struct BattlePokemon gBattleMons[];
extern u8 gMoveResultFlags;
extern u8 BattleScript_FocusPunchSetUp[];
extern u16 gDynamicBasePower;
extern u8 gCurrentTurnActionNumber;
extern void (* const gUnknown_081FA640[])(void);
extern void (* const gUnknown_081FA678[])(void);
extern u8* gBattlescriptCurrInstr;
extern u8 BattleScript_LinkBattleWonOrLost[];
extern u8 BattleScript_PayDayMoneyAndPickUpItems[];
extern u8 gUnknown_081D8E0D[];
extern u8 BattleScript_LocalTrainerBattleWon[];
extern u8 BattleScript_LocalBattleLost[];
extern u8 BattleScript_GotAwaySafely[];
extern u8 BattleScript_SmokeBallEscape[];
extern u8 BattleScript_RanAwayUsingMonAbility[];
extern u8 BattleScript_WildMonFled[];
extern u8 BattleScript_ActionSwitch[];
extern u8 BattleScript_PrintFailedToRunString[];
extern const BattleCmdFunc gBattleScriptingCommandsTable[];
extern u8 gCritMultiplier;
extern u8 gCurrMovePos;
extern u8 gUnknown_02024BE5;
extern u16 gChosenMove;
extern u8* gBattleScriptsForMoveEffects[];
extern u16 gLastUsedItem;
extern u8 * const gBattlescriptsForBallThrow[];
extern u8 * const gBattlescriptsForRunningByItem[];
extern u8 * const gBattlescriptsForUsingItem[];
extern u8 * const gBattlescriptsForSafariActions[];
extern u8 gBattleTextBuff2[];
extern u8 gNumSafariBalls;
extern u8 gUnknown_081FA70C[][3];
extern u8 gUnknown_081FA71B[];
extern u8 gUnknown_081FA71F[];

void sub_8010824(void);
static void BattlePrepIntroSlide(void);
void CheckFocusPunch_ClearVarsBeforeTurnStarts(void);
void SetActionsAndBanksTurnOrder(void);
static void TurnValuesCleanUp(u8);
void SpecialStatusesClear(void);
static void RunTurnActionsFunctions(void);
void HandleEndTurn_FinishBattle();
static void FreeResetData_ReturnToOvOrDoEvolutions(void);
void TryEvolvePokemon(void);
static void ReturnFromBattleToOverworld(void);
static void WaitForEvoSceneToFinish(void);

void sub_800E7C4(void)
{
    if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
    {
        sub_800B858();
        SetMainCallback2(sub_800F104);
        gBattleCommunication[0] = 0;
    }
    else
    {
        InitBattle();
    }
}

void InitBattle(void)
{
    s32 i;

    SetHBlankCallback(NULL);
    SetVBlankCallback(NULL);

    CpuFill32(0, (void *)VRAM, VRAM_SIZE);

    REG_MOSAIC = 0;
    REG_WIN0H = 0xF0;
    REG_WIN0V = 0x5051;
    REG_WININ = 0;
    REG_WINOUT = 0;
    gBattle_WIN0H = 0xF0;
    gBattle_WIN0V = 0x5051;
    ScanlineEffect_Clear();

    for (i = 0; i < 80; i++)
    {
        gScanlineEffectRegBuffers[0][i] = 0xF0;
        gScanlineEffectRegBuffers[1][i] = 0xF0;
    }
    for (i = 80; i < 160; i++)
    {
        asm(""::"r"(i));  // Needed to stop the compiler from optimizing out the loop counter
        gScanlineEffectRegBuffers[0][i] = 0xFF10;
        gScanlineEffectRegBuffers[1][i] = 0xFF10;
    }
    //ScanlineEffect_SetParams(gUnknown_081F9674.unk0, gUnknown_081F9674.unk4, gUnknown_081F9674.unk8);
    ScanlineEffect_SetParams(gUnknown_081F9674);
    Text_LoadWindowTemplate(&gWindowTemplate_81E6C58);
    ResetPaletteFade();
    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    gBattle_BG1_X = 0;
    gBattle_BG1_Y = 0;
    gBattle_BG2_X = 0;
    gBattle_BG2_Y = 0;
    gBattle_BG3_X = 0;
    gBattle_BG3_Y = 0;

#if DEBUG
    if (!(gUnknown_02023A14_50 & 8))
        gBattleTerrain = BattleSetup_GetTerrain();
#else
    gBattleTerrain = BattleSetup_GetTerrain();
#endif

    Text_InitWindowWithTemplate(&gUnknown_03004210, &gWindowTemplate_81E6C58);
    Text_InitWindowWithTemplate(&gUnknown_030041D0, &gWindowTemplate_81E71D0);
    Text_InitWindowWithTemplate(&gUnknown_03004250, &gWindowTemplate_81E71EC);
    sub_800D6D4();
    LoadBattleTextboxAndBackground();
    ResetSpriteData();
    ResetTasks();
    LoadBattleEntryBackground();
    FreeAllSpritePalettes();
    gReservedSpritePaletteCount = 4;
    SetVBlankCallback(sub_800FCFC);
    setup_poochyena_battle();
    if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
        SetMainCallback2(sub_800F298);
    else
        SetMainCallback2(sub_800EC9C);
    if (!(gBattleTypeFlags & BATTLE_TYPE_LINK)
#if DEBUG
     && !(gUnknown_02023A14_50 & 8)
#endif
       )
    {
        CreateNPCTrainerParty(gEnemyParty, gTrainerBattleOpponent);
        SetWildMonHeldItem();
    }
    gMain.inBattle = TRUE;
    for (i = 0; i < PARTY_SIZE; i++)
        AdjustFriendship(&gPlayerParty[i], FRIENDSHIP_EVENT_LEAGUE_BATTLE);
    gBattleCommunication[0] = 0;
}

void sub_800E9EC(void)
{
    u16 r6 = 0;
    u16 species;
    u16 hp;
    u32 status;
    s32 i;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        species = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2);
        hp = GetMonData(&gPlayerParty[i], MON_DATA_HP);
        status = GetMonData(&gPlayerParty[i], MON_DATA_STATUS);

        if (species == 0)
            continue;
        if (species != SPECIES_EGG && hp != 0 && status == 0)
            r6 |= 1 << i * 2;

        if (species == 0)
            continue;
        if (hp != 0 && (species == SPECIES_EGG || status != 0))
            r6 |= 2 << i * 2;

        if (species == 0)
            continue;
        if (species != SPECIES_EGG && hp == 0)
            r6 |= 3 << i * 2;
    }
    gBattleStruct->unk2 = r6;
    gBattleStruct->unk3 = r6 >> 8;
}

void sub_800EAAC(void)
{
    s32 i;
    struct UnknownStruct8 *_ewram4 = &ewram4;

    for (i = 0; i < 7; i++)
        _ewram4->unk0[i] = gSaveBlock1.enigmaBerry.berry.name[i];
    for (i = 0; i < 18; i++)
        _ewram4->unk8[i] = gSaveBlock1.enigmaBerry.itemEffect[i];
    _ewram4->unk7 = gSaveBlock1.enigmaBerry.holdEffect;
    _ewram4->unk1A = gSaveBlock1.enigmaBerry.holdEffectParam;
}

void sub_800EB08(void)
{
    s32 i;
    s32 j;

    if (!(gBattleTypeFlags & BATTLE_TYPE_LINK))
    {
        for (i = 0; i < 7; i++)
        {
            gEnigmaBerries[0].name[i] = gSaveBlock1.enigmaBerry.berry.name[i];
            gEnigmaBerries[2].name[i] = gSaveBlock1.enigmaBerry.berry.name[i];
        }
        for (i = 0; i < 18; i++)
        {
            gEnigmaBerries[0].itemEffect[i] = gSaveBlock1.enigmaBerry.itemEffect[i];
            gEnigmaBerries[2].itemEffect[i] = gSaveBlock1.enigmaBerry.itemEffect[i];
        }
        gEnigmaBerries[0].holdEffect = gSaveBlock1.enigmaBerry.holdEffect;
        gEnigmaBerries[2].holdEffect = gSaveBlock1.enigmaBerry.holdEffect;
        gEnigmaBerries[0].holdEffectParam = gSaveBlock1.enigmaBerry.holdEffectParam;
        gEnigmaBerries[2].holdEffectParam = gSaveBlock1.enigmaBerry.holdEffectParam;
    }
    else
    {
        s32 numPlayers;
        struct BattleEnigmaBerry *src;
        u8 r4;

        if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
            numPlayers = 4;
        else
            numPlayers = 2;
        for (i = 0; i < numPlayers; i++)
        {
            src = (struct BattleEnigmaBerry *)(gBlockRecvBuffer[i] + 2);
            r4 = gLinkPlayers[i].lp_field_18;

            for (j = 0; j < 7; j++)
                gEnigmaBerries[r4].name[j] = src->name[j];
            for (j = 0; j < 18; j++)
                gEnigmaBerries[r4].itemEffect[j] = src->itemEffect[j];
            gEnigmaBerries[r4].holdEffect = src->holdEffect;
            gEnigmaBerries[r4].holdEffectParam = src->holdEffectParam;
        }
    }
}

void shedinja_something(struct Pokemon *pkmn)
{
    u8 nickname[POKEMON_NAME_LENGTH + 1];
    u8 language = 1;

    if (GetMonData(pkmn, MON_DATA_SPECIES) == SPECIES_SHEDINJA
     && GetMonData(pkmn, MON_DATA_LANGUAGE) != language)
    {
        GetMonData(pkmn, MON_DATA_NICKNAME, nickname);
        if (StringCompareWithoutExtCtrlCodes(nickname, gUnknown_081F96C8) == 0)
            SetMonData(pkmn, MON_DATA_LANGUAGE, &language);
    }
}

void sub_800EC9C(void)
{
    u8 playerId;
    u8 enemyId;
    s32 id;

    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    playerId = GetMultiplayerId();
    ewram160CB = playerId;
    enemyId = playerId ^ 1;

    switch (gBattleCommunication[0])
    {
    case 0:
        if (gBattleTypeFlags & BATTLE_TYPE_LINK)
        {
            if (gReceivedRemoteLinkPlayers != 0 && IsLinkTaskFinished())
            {
                gBattleStruct->unk0 = 1;
                gBattleStruct->unk1 = 1;
                sub_800E9EC();
                sub_800EAAC();
#if DEBUG
                if (gUnknown_02023A14_50 & 8)
                {
                    for (id = 0; id < 2; id++)  // Why < 2 here?
                    {
                        gLinkPlayers[id].lp_field_18 = id;
                        gLinkPlayers[id].linkType = 0x2211;
                    }
                }
#endif
                SendBlock(bitmask_all_link_players_but_self(), gBattleStruct, 32);
                gBattleCommunication[0] = 1;
            }
        }
        else
        {
            gBattleTypeFlags |= BATTLE_TYPE_WILD;
            gBattleCommunication[0] = 8;
            sub_800EB08();
        }
        break;
    case 1:
        if ((GetBlockReceivedStatus() & 3) == 3)
        {
            u8 taskId;

            ResetBlockReceivedFlags();
            id = 0;
            if (gBlockRecvBuffer[0][0] == 0x100)
            {
                if (playerId == 0)
                    gBattleTypeFlags |= 12;
                else
                    gBattleTypeFlags |= 8;
                id++;
            }
            if (id == 0)
            {
                if (gBlockRecvBuffer[0][0] == gBlockRecvBuffer[1][0])
                {
                    if (playerId == 0)
                        gBattleTypeFlags |= 12;
                    else
                        gBattleTypeFlags |= 8;
                    id++;
                }
                if (id == 0)
                {
                    while (id < 2)
                    {
                        if (gBlockRecvBuffer[id][0] > 0x0101 && id != playerId)
                            break;
                        id++;
                    }
                    if (id == 2)
                        gBattleTypeFlags |= 12;
                    else
                        gBattleTypeFlags |= 8;
                }
            }
            sub_800EB08();
            taskId = CreateTask(sub_800DE30, 0);
            gTasks[taskId].data[1] = 0x10E;
            gTasks[taskId].data[2] = 0x5A;
            gTasks[taskId].data[5] = 0;
            gTasks[taskId].data[3] = gBattleStruct->unk2 | (gBattleStruct->unk3 << 8);
            gTasks[taskId].data[4] = gBlockRecvBuffer[enemyId][1];
            gBattleCommunication[0]++;
        }
        break;
    case 2:
        if (IsLinkTaskFinished())
        {
            SendBlock(bitmask_all_link_players_but_self(), gPlayerParty, sizeof(*gPlayerParty) * 2);
            gBattleCommunication[0]++;
        }
        break;
    case 3:
        if ((GetBlockReceivedStatus() & 3) == 3)
        {
            ResetBlockReceivedFlags();
            memcpy(gEnemyParty, gBlockRecvBuffer[enemyId], sizeof(*gEnemyParty) * 2);
            gBattleCommunication[0]++;
        }
        break;
    case 4:
        if (IsLinkTaskFinished())
        {
            SendBlock(bitmask_all_link_players_but_self(), gPlayerParty + 2, sizeof(*gPlayerParty) * 2);
            gBattleCommunication[0]++;
        }
        break;
    case 5:
        if ((GetBlockReceivedStatus() & 3) == 3)
        {
            ResetBlockReceivedFlags();
            memcpy(gEnemyParty + 2, gBlockRecvBuffer[enemyId], sizeof(*gEnemyParty) * 2);
            gBattleCommunication[0]++;
        }
        break;
    case 6:
        if (IsLinkTaskFinished())
        {
            SendBlock(bitmask_all_link_players_but_self(), gPlayerParty + 4, sizeof(*gPlayerParty) * 2);
            gBattleCommunication[0]++;
        }
        break;
    case 7:
        if ((GetBlockReceivedStatus() & 3) == 3)
        {
            ResetBlockReceivedFlags();
            memcpy(gEnemyParty + 4, gBlockRecvBuffer[enemyId], sizeof(*gEnemyParty) * 2);
            shedinja_something(&gEnemyParty[0]);
            shedinja_something(&gEnemyParty[1]);
            shedinja_something(&gEnemyParty[2]);
            shedinja_something(&gEnemyParty[3]);
            shedinja_something(&gEnemyParty[4]);
            shedinja_something(&gEnemyParty[5]);
            gBattleCommunication[0]++;
        }
        break;
    case 8:
        sub_800B950();
        gBattleCommunication[0]++;
        gBattleCommunication[1] = 0;
        gBattleCommunication[2] = 0;
        break;
    case 9:
        if (battle_load_something(gUnknown_02024D1F, gUnknown_02024D1F + 1) != 0)
        {
            gPreBattleCallback1 = gMain.callback1;
            gMain.callback1 = sub_8010824;
            SetMainCallback2(BattleMainCB2);
            if (gBattleTypeFlags & BATTLE_TYPE_LINK)
            {
                gTrainerBattleOpponent = 0x800;
                gBattleTypeFlags |= BATTLE_TYPE_20;
            }
        }
        break;
    }
}

void sub_800F02C(void)
{
    s32 i;

    for (i = 0; i < 3; i++)
    {
        u8 *nickname = gMultiPartnerParty[i].nickname;

        gMultiPartnerParty[i].species     = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES);
        gMultiPartnerParty[i].heldItem    = GetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM);
        GetMonData(&gPlayerParty[i], MON_DATA_NICKNAME, nickname);
        gMultiPartnerParty[i].level       = GetMonData(&gPlayerParty[i], MON_DATA_LEVEL);
        gMultiPartnerParty[i].hp          = GetMonData(&gPlayerParty[i], MON_DATA_HP);
        gMultiPartnerParty[i].maxhp       = GetMonData(&gPlayerParty[i], MON_DATA_MAX_HP);
        gMultiPartnerParty[i].status      = GetMonData(&gPlayerParty[i], MON_DATA_STATUS);
        gMultiPartnerParty[i].personality = GetMonData(&gPlayerParty[i], MON_DATA_PERSONALITY);
        gMultiPartnerParty[i].gender      = GetMonGender(&gPlayerParty[i]);
        Text_StripExtCtrlCodes(nickname);
        gMultiPartnerParty[i].language    = GetMonData(&gPlayerParty[i], MON_DATA_LANGUAGE);
        if (gMultiPartnerParty[i].language != 1)
            PadNameString(nickname, 0);
    }
    memcpy(gSharedMem, gMultiPartnerParty, 0x60);
}

void sub_800F104(void)
{
    u8 playerId;
    MainCallback *pSavedCallback;
    u16 *pSavedBattleTypeFlags;
    s32 i;

    playerId = GetMultiplayerId();
    ewram160CB = playerId;
    // Seriously, Game Freak?
    pSavedCallback = ewram160C4_Callback;
    pSavedBattleTypeFlags = ewram160C2_Flags;
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();

    switch (gBattleCommunication[0])
    {
    case 0:
        if (gReceivedRemoteLinkPlayers != 0)
        {
#if DEBUG
            if (gUnknown_02023A14_50 & 8)
            {
                for (i = 0; i < 4; i++)
                {
                    gLinkPlayers[i].lp_field_18 = i;
                    gLinkPlayers[i].linkType = 0x2211;
                }
            }
#endif
            if (IsLinkTaskFinished())
            {
                sub_800F02C();
                SendBlock(bitmask_all_link_players_but_self(), gSharedMem, 0x60);
                gBattleCommunication[0]++;
            }
        }
        break;
    case 1:
        if ((GetBlockReceivedStatus() & 0xF) == 0xF)
        {
            //s32 i;

            ResetBlockReceivedFlags();
            for (i = 0; i < 4; i++)
            {
                if (i != playerId)
                {
                    if ((!(gLinkPlayers[i].lp_field_18 & 1) && !(gLinkPlayers[playerId].lp_field_18 & 1))
                     || ((gLinkPlayers[i].lp_field_18 & 1) && (gLinkPlayers[playerId].lp_field_18 & 1)))
                        memcpy(gMultiPartnerParty, gBlockRecvBuffer[i], 0x60);
                }
            }
            gBattleCommunication[0]++;
            *pSavedCallback = gMain.savedCallback;
            *pSavedBattleTypeFlags = gBattleTypeFlags;
            gMain.savedCallback = sub_800F104;
            OpenPartyMenu(PARTY_MENU_TYPE_LINK_MULTI_BATTLE, 0);
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            gBattleCommunication[0] = 3;
            sub_800832C();
        }
        break;
    case 3:
        if (gReceivedRemoteLinkPlayers == 0)
        {
            gBattleTypeFlags = *pSavedBattleTypeFlags;
            gMain.savedCallback = *pSavedCallback;
            SetMainCallback2(InitBattle);
        }
        break;
    }
}

void sub_800F298(void)
{
    u8 playerId;
    s32 id;

    playerId = GetMultiplayerId();
    ewram160CB = playerId;
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    switch (gBattleCommunication[0])
    {
    case 0:
        if (gReceivedRemoteLinkPlayers != 0)
        {
#if DEBUG
            if (gUnknown_02023A14_50 & 8)
            {
                for (id = 0; id < 4; id++)
                {
                    gLinkPlayers[id].lp_field_18 = id;
                    gLinkPlayers[id].linkType = 0x2211;
                }
            }
#endif
            if (IsLinkTaskFinished())
            {
                gBattleStruct->unk0 = 1;
                gBattleStruct->unk1 = 1;
                sub_800E9EC();
                sub_800EAAC();
                SendBlock(bitmask_all_link_players_but_self(), gSharedMem, 0x20);
                gBattleCommunication[0]++;
            }
        }
        break;
    case 1:
        if ((GetBlockReceivedStatus() & 0xF) == 0xF)
        {
            u8 taskId;

            ResetBlockReceivedFlags();
            id = 0;
            if (gBlockRecvBuffer[0][0] == 0x100)
            {
                if (playerId == 0)
                    gBattleTypeFlags |= 12;
                else
                    gBattleTypeFlags |= 8;
                id++;
            }
            if (id == 0)
            {
                s32 i;

                for (i = 0; i < MAX_LINK_PLAYERS; i++)
                {
                    if (gBlockRecvBuffer[0][0] != gBlockRecvBuffer[i][0])
                        break;
                }
                if (i == MAX_LINK_PLAYERS)
                {
                    if (playerId == 0)
                        gBattleTypeFlags |= 12;
                    else
                        gBattleTypeFlags |= 8;
                    id++;
                }
                if (id == 0)
                {
                    while (id < MAX_LINK_PLAYERS)
                    {
                        if (gBlockRecvBuffer[id][0] == 0x0101 && id != playerId)
                            if (id < playerId)
                                break;
                        if (gBlockRecvBuffer[id][0] > 0x0101 && id != playerId)
                            break;
                        id++;
                    }
                    if (id == MAX_LINK_PLAYERS)
                        gBattleTypeFlags |= 12;
                    else
                        gBattleTypeFlags |= 8;
                }
            }
            sub_800EB08();
            memcpy(ewram1D000, gPlayerParty, sizeof(struct Pokemon) * 3);
            taskId = CreateTask(sub_800DE30, 0);
            gTasks[taskId].data[1] = 0x10E;
            gTasks[taskId].data[2] = 0x5A;
            gTasks[taskId].data[5] = 0;
            gTasks[taskId].data[3] = 0;
            gTasks[taskId].data[4] = 0;
            for (id = 0; id < MAX_LINK_PLAYERS; id++)
            {
                switch (gLinkPlayers[id].lp_field_18)
                {
                case 0:
                    gTasks[taskId].data[3] |= gBlockRecvBuffer[id][1] & 0x3F;
                    break;
                case 1:
                    gTasks[taskId].data[4] |= gBlockRecvBuffer[id][1] & 0x3F;
                    break;
                case 2:
                    gTasks[taskId].data[3] |= (gBlockRecvBuffer[id][1] & 0x3F) << 6;
                    break;
                case 3:
                    gTasks[taskId].data[4] |= (gBlockRecvBuffer[id][1] & 0x3F) << 6;
                    break;
                }
            }
            ZeroPlayerPartyMons();
            ZeroEnemyPartyMons();
            gBattleCommunication[0]++;
            // fallthrough
    case 2:
            if (IsLinkTaskFinished())
            {
                SendBlock(bitmask_all_link_players_but_self(), ewram1D000, sizeof(struct Pokemon) * 2);
                gBattleCommunication[0]++;
            }
	}
        break;
    case 3:
        if ((GetBlockReceivedStatus() & 0xF) == 0xF)
        {
            ResetBlockReceivedFlags();
            for (id = 0; id < MAX_LINK_PLAYERS; id++)
            {
                if (id == playerId)
                {
                    switch (gLinkPlayers[id].lp_field_18)
                    {
                    case 0:
                    case 3:
                        memcpy(gPlayerParty, gBlockRecvBuffer[id], sizeof(struct Pokemon) * 2);
                        break;
                    case 1:
                    case 2:
                        memcpy(gPlayerParty + 3, gBlockRecvBuffer[id], sizeof(struct Pokemon) * 2);
                        break;
                    }
                }
                else
                {
                    if ((!(gLinkPlayers[id].lp_field_18 & 1) && !(gLinkPlayers[playerId].lp_field_18 & 1))
                     || ((gLinkPlayers[id].lp_field_18 & 1) && (gLinkPlayers[playerId].lp_field_18 & 1)))
                    {
                        switch (gLinkPlayers[id].lp_field_18)
                        {
                        case 0:
                        case 3:
                            memcpy(gPlayerParty, gBlockRecvBuffer[id], sizeof(struct Pokemon) * 2);
                            break;
                        case 1:
                        case 2:
                            memcpy(gPlayerParty + 3, gBlockRecvBuffer[id], sizeof(struct Pokemon) * 2);
                            break;
                        }
                    }
                    else
                    {
                        switch (gLinkPlayers[id].lp_field_18)
                        {
                        case 0:
                        case 3:
                            memcpy(gEnemyParty, gBlockRecvBuffer[id], sizeof(struct Pokemon) * 2);
                            break;
                        case 1:
                        case 2:
                            memcpy(gEnemyParty + 3, gBlockRecvBuffer[id], sizeof(struct Pokemon) * 2);
                            break;
                        }
                    }
                }
            }
            gBattleCommunication[0]++;
        }
        break;
    case 4:
        if (IsLinkTaskFinished())
        {
            SendBlock(bitmask_all_link_players_but_self(), ewram1D000 + 2, sizeof(struct Pokemon));
            gBattleCommunication[0]++;
        }
        break;
    case 5:
        if ((GetBlockReceivedStatus() & 0xF) == 0xF)
        {
            ResetBlockReceivedFlags();
            for (id = 0; id < MAX_LINK_PLAYERS; id++)
            {
                if (id == playerId)
                {
                    switch (gLinkPlayers[id].lp_field_18)
                    {
                    case 0:
                    case 3:
                        memcpy(gPlayerParty + 2, gBlockRecvBuffer[id], sizeof(struct Pokemon));
                        break;
                    case 1:
                    case 2:
                        memcpy(gPlayerParty + 5, gBlockRecvBuffer[id], sizeof(struct Pokemon));
                        break;
                    }
                }
                else
                {
                    if ((!(gLinkPlayers[id].lp_field_18 & 1) && !(gLinkPlayers[playerId].lp_field_18 & 1))
                     || ((gLinkPlayers[id].lp_field_18 & 1) && (gLinkPlayers[playerId].lp_field_18 & 1)))
                    {
                        switch (gLinkPlayers[id].lp_field_18)
                        {
                        case 0:
                        case 3:
                            memcpy(gPlayerParty + 2, gBlockRecvBuffer[id], sizeof(struct Pokemon));
                            break;
                        case 1:
                        case 2:
                            memcpy(gPlayerParty + 5, gBlockRecvBuffer[id], sizeof(struct Pokemon));
                            break;
                        }
                    }
                    else
                    {
                        switch (gLinkPlayers[id].lp_field_18)
                        {
                        case 0:
                        case 3:
                            memcpy(gEnemyParty + 2, gBlockRecvBuffer[id], sizeof(struct Pokemon));
                            break;
                        case 1:
                        case 2:
                            memcpy(gEnemyParty + 5, gBlockRecvBuffer[id], sizeof(struct Pokemon));
                            break;
                        }
                    }
                }
            }

            shedinja_something(&gPlayerParty[0]);
            shedinja_something(&gPlayerParty[1]);
            shedinja_something(&gPlayerParty[2]);
            shedinja_something(&gPlayerParty[3]);
            shedinja_something(&gPlayerParty[4]);
            shedinja_something(&gPlayerParty[5]);

            shedinja_something(&gEnemyParty[0]);
            shedinja_something(&gEnemyParty[1]);
            shedinja_something(&gEnemyParty[2]);
            shedinja_something(&gEnemyParty[3]);
            shedinja_something(&gEnemyParty[4]);
            shedinja_something(&gEnemyParty[5]);

            gBattleCommunication[0]++;
        }
        break;
    case 6:
        sub_800B950();
        gBattleCommunication[0]++;
        gBattleCommunication[1] = 0;
        gBattleCommunication[2] = 0;
        break;
    case 7:
        if (battle_load_something(gUnknown_02024D1F, gUnknown_02024D1F + 1) != 0)
        {
            gPreBattleCallback1 = gMain.callback1;
            gMain.callback1 = sub_8010824;
            SetMainCallback2(BattleMainCB2);
            if (gBattleTypeFlags & BATTLE_TYPE_LINK)
            {
                gTrainerBattleOpponent = 0x800;
                gBattleTypeFlags |= BATTLE_TYPE_20;
            }
        }
        break;
    }
}

void BattleMainCB2(void)
{
    AnimateSprites();
    BuildOamBuffer();

#if DEBUG
    if ((gMain.heldKeys & (R_BUTTON | SELECT_BUTTON)) == ((R_BUTTON | SELECT_BUTTON)))
    {
        gSpecialVar_Result = gBattleOutcome = 1;
        gMain.inBattle = FALSE;
        gScanlineEffect.state = 3;
        gMain.callback1 = gPreBattleCallback1;
        ZeroEnemyPartyMons();
        m4aSongNumStop(0x5A);
        if (gBattleTypeFlags & 2)
            SetMainCallback2(sub_805465C);
        else
            SetMainCallback2(gMain.savedCallback);
    }
    if (gBattleTypeFlags & 2)
    {
        debug_sub_8008264((gBattleTypeFlags >> 2) % 2, 1, 1, 1, 1);
        debug_sub_8008264((gBattleTypeFlags >> 2) % 2, 1, 21, 1, 1);
        debug_sub_8008264((gBattleTypeFlags >> 2) % 2, 1, 41, 1, 1);
    }
#endif

    Text_UpdateWindowInBattle(&gUnknown_03004210);
    UpdatePaletteFade();
    RunTasks();
}

void sub_800F828(struct Sprite *sprite)
{
    sprite->data[0] = 0;
    sprite->callback = sub_800F838;
}

void sub_800F838(struct Sprite *sprite)
{
    u16 *arr = (u16 *)gSharedMem;

    switch (sprite->data[0])
    {
    case 0:
        sprite->data[0]++;
        sprite->data[1] = 0;
        sprite->data[2] = 0x281;
        sprite->data[3] = 0;
        sprite->data[4] = 1;
        // fall through
    case 1:
        sprite->data[4]--;
        if (sprite->data[4] == 0)
        {
            s32 i;
            s32 r2;
            s32 r0;

            sprite->data[4] = 2;
            r2 = sprite->data[1] + sprite->data[3] * 32;
            r0 = sprite->data[2] - sprite->data[3] * 32;
            for (i = 0; i < 29; i += 2)
            {
                arr[r2 + i] = 0x3D;
                arr[r0 + i] = 0x3D;
            }
            sprite->data[3]++;
            if (sprite->data[3] == 21)
            {
                sprite->data[0]++;
                sprite->data[1] = 32;
            }
        }
        break;
    case 2:
        sprite->data[1]--;
        if (sprite->data[1] == 20)
            SetMainCallback2(sub_800E7C4);
        break;
    }
}

u8 CreateNPCTrainerParty(struct Pokemon *party, u16 trainerNum)
{
    u32 nameHash = 0;
    s32 i;

    if (trainerNum == 0x400)
        return 0;

    if ((gBattleTypeFlags & 0x908) == 8)
    {
        ZeroEnemyPartyMons();
        for (i = 0; i < gTrainers[trainerNum].partySize; i++)
        {
            u32 personalityValue;
            s32 j;
            u8 fixedIV;

            if (gTrainers[trainerNum].doubleBattle == TRUE)
                personalityValue = 0x80;
            else if (gTrainers[trainerNum].encounterMusic_gender & 0x80)
                personalityValue = 0x78;
            else
                personalityValue = 0x88;

            for (j = 0; gTrainers[trainerNum].trainerName[j] != 0xFF; j++)
                nameHash += gTrainers[trainerNum].trainerName[j];

            switch (gTrainers[trainerNum].partyFlags)
            {
            case 0:
            {
                const struct TrainerMonNoItemDefaultMoves *partyData = gTrainers[trainerNum].party.NoItemDefaultMoves;

                for (j = 0; gSpeciesNames[partyData[i].species][j] != 0xFF; j++)
                    nameHash += gSpeciesNames[partyData[i].species][j];
                personalityValue += nameHash << 8;
                fixedIV = partyData[i].iv * 31 / 255;
                CreateMon(&party[i], partyData[i].species, partyData[i].level, fixedIV, TRUE, personalityValue, 2, 0);
                break;
            }
            case F_TRAINER_PARTY_CUSTOM_MOVESET:
            {
                const struct TrainerMonNoItemCustomMoves *partyData = gTrainers[trainerNum].party.NoItemCustomMoves;

                for (j = 0; gSpeciesNames[partyData[i].species][j] != 0xFF; j++)
                    nameHash += gSpeciesNames[partyData[i].species][j];
                personalityValue += nameHash << 8;
                fixedIV = partyData[i].iv * 31 / 255;
                CreateMon(&party[i], partyData[i].species, partyData[i].level, fixedIV, TRUE, personalityValue, 2, 0);

                for (j = 0; j < 4; j++)
                {
                    SetMonData(&party[i], MON_DATA_MOVE1 + j, &partyData[i].moves[j]);
                    SetMonData(&party[i], MON_DATA_PP1 + j, &gBattleMoves[partyData[i].moves[j]].pp);
                }
                break;
            }
            case F_TRAINER_PARTY_HELD_ITEM:
            {
                const struct TrainerMonItemDefaultMoves *partyData = gTrainers[trainerNum].party.ItemDefaultMoves;

                for (j = 0; gSpeciesNames[partyData[i].species][j] != 0xFF; j++)
                    nameHash += gSpeciesNames[partyData[i].species][j];
                personalityValue += nameHash << 8;
                fixedIV = partyData[i].iv * 31 / 255;
                CreateMon(&party[i], partyData[i].species, partyData[i].level, fixedIV, TRUE, personalityValue, 2, 0);

                SetMonData(&party[i], MON_DATA_HELD_ITEM, &partyData[i].heldItem);
                break;
            }
            case F_TRAINER_PARTY_CUSTOM_MOVESET | F_TRAINER_PARTY_HELD_ITEM:
            {
                const struct TrainerMonItemCustomMoves *partyData = gTrainers[trainerNum].party.ItemCustomMoves;

                for (j = 0; gSpeciesNames[partyData[i].species][j] != 0xFF; j++)
                    nameHash += gSpeciesNames[partyData[i].species][j];
                personalityValue += nameHash << 8;
                fixedIV = partyData[i].iv * 31 / 255;
                CreateMon(&party[i], partyData[i].species, partyData[i].level, fixedIV, TRUE, personalityValue, 2, 0);

                SetMonData(&party[i], MON_DATA_HELD_ITEM, &partyData[i].heldItem);
                for (j = 0; j < 4; j++)
                {
                    SetMonData(&party[i], MON_DATA_MOVE1 + j, &partyData[i].moves[j]);
                    SetMonData(&party[i], MON_DATA_PP1 + j, &gBattleMoves[partyData[i].moves[j]].pp);
                }
                break;
            }
            }
        }
        gBattleTypeFlags |= gTrainers[trainerNum].doubleBattle;
    }
    return gTrainers[trainerNum].partySize;
}

void sub_800FCD4(void)
{
    if (REG_VCOUNT < 0xA0 && REG_VCOUNT >= 0x6F )
        REG_BG0CNT = 0x9800;
}

void sub_800FCFC(void)
{
    Random();  // unused return value
    REG_BG0HOFS = gBattle_BG0_X;
    REG_BG0VOFS = gBattle_BG0_Y;
    REG_BG1HOFS = gBattle_BG1_X;
    REG_BG1VOFS = gBattle_BG1_Y;
    REG_BG2HOFS = gBattle_BG2_X;
    REG_BG2VOFS = gBattle_BG2_Y;
    REG_BG3HOFS = gBattle_BG3_X;
    REG_BG3VOFS = gBattle_BG3_Y;
    REG_WIN0H = gBattle_WIN0H;
    REG_WIN0V = gBattle_WIN0V;
    REG_WIN1H = gBattle_WIN1H;
    REG_WIN1V = gBattle_WIN1V;
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    ScanlineEffect_InitHBlankDmaTransfer();
}

void nullsub_36(struct Sprite *sprite)
{
}

void sub_800FDB0(struct Sprite *sprite)
{
    if (sprite->data[0] != 0)
        sprite->pos1.x = sprite->data[1] + ((sprite->data[2] & 0xFF00) >> 8);
    else
        sprite->pos1.x = sprite->data[1] - ((sprite->data[2] & 0xFF00) >> 8);
    sprite->data[2] += 0x180;
    if (sprite->affineAnimEnded)
    {
        FreeSpriteTilesByTag(0x2710);
        FreeSpritePaletteByTag(0x2710);
        FreeSpriteOamMatrix(sprite);
        DestroySprite(sprite);
    }
}

void sub_800FE20(struct Sprite *sprite)
{
    StartSpriteAffineAnim(sprite, 1);
    sprite->callback = sub_800FDB0;
    PlaySE(SE_BT_START);
}

void sub_800FE40(u8 taskId)
{
    struct Pokemon *sp4 = NULL;
    struct Pokemon *sp8 = NULL;
    u8 r2 = ewram160CB;
    u32 r7;
    s32 i;

    if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
    {
        switch (gLinkPlayers[r2].lp_field_18)
        {
        case 0:
        case 2:
            sp4 = gPlayerParty;
            sp8 = gEnemyParty;
            break;
        case 1:
        case 3:
            sp4 = gEnemyParty;
            sp8 = gPlayerParty;
            break;
        }
    }
    else
    {
        sp4 = gPlayerParty;
        sp8 = gEnemyParty;
    }

    r7 = 0;
    for (i = 0; i < 6; i++)
    {
        u16 species = GetMonData(&sp4[i], MON_DATA_SPECIES2);
        u16 hp = GetMonData(&sp4[i], MON_DATA_HP);
        u32 status = GetMonData(&sp4[i], MON_DATA_STATUS);

        if (species == 0)
            continue;
        if (species != SPECIES_EGG && hp != 0 && status == 0)
            r7 |= 1 << i * 2;

        if (species == 0)
            continue;
        if (hp != 0 && (species == SPECIES_EGG || status != 0))
            r7 |= 2 << i * 2;

        if (species == 0)
            continue;
        if (species != SPECIES_EGG && hp == 0)
            r7 |= 3 << i * 2;
    }
    gTasks[taskId].data[3] = r7;

    r7 = 0;
    for (i = 0; i < 6; i++)
    {
        u16 species = GetMonData(&sp8[i], MON_DATA_SPECIES2);
        u16 hp = GetMonData(&sp8[i], MON_DATA_HP);
        u32 status = GetMonData(&sp8[i], MON_DATA_STATUS);

        if (species == 0)
            continue;
        if (species != SPECIES_EGG && hp != 0 && status == 0)
            r7 |= 1 << i * 2;

        if (species == 0)
            continue;
        if (hp != 0 && (species == SPECIES_EGG || status != 0))
            r7 |= 2 << i * 2;

        if (species == 0)
            continue;
        if (species != SPECIES_EGG && hp == 0)
            r7 |= 3 << i * 2;
    }
    gTasks[taskId].data[4] = r7;
}

void c2_8011A1C(void)
{
    s32 i;
    u8 taskId;

    SetHBlankCallback(NULL);
    SetVBlankCallback(NULL);
    CpuFill32(0, (void *)VRAM, VRAM_SIZE);
    REG_MOSAIC = 0;
    REG_WIN0H = 0xF0;
    REG_WIN0V = 0x5051;
    REG_WININ = 0;
    REG_WINOUT = 0;
    gBattle_WIN0H = 0xF0;
    gBattle_WIN0V = 0x5051;
    ScanlineEffect_Clear();

    for (i = 0; i < 80; i++)
    {
        gScanlineEffectRegBuffers[0][i] = 0xF0;
        gScanlineEffectRegBuffers[1][i] = 0xF0;
    }
    for (i = 80; i < 160; i++)
    {
        asm(""::"r"(i));  // Needed to stop the compiler from optimizing out the loop counter
        gScanlineEffectRegBuffers[0][i] = 0xFF10;
        gScanlineEffectRegBuffers[1][i] = 0xFF10;
    }
    Text_LoadWindowTemplate(&gWindowTemplate_81E6C58);
    ResetPaletteFade();
    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    gBattle_BG1_X = 0;
    gBattle_BG1_Y = 0;
    gBattle_BG2_X = 0;
    gBattle_BG2_Y = 0;
    gBattle_BG3_X = 0;
    gBattle_BG3_Y = 0;

    Text_InitWindowWithTemplate(&gUnknown_03004210, &gWindowTemplate_81E6C58);
    Text_InitWindowWithTemplate(&gUnknown_030041D0, &gWindowTemplate_81E71D0);
    Text_InitWindowWithTemplate(&gUnknown_03004250, &gWindowTemplate_81E71EC);
    sub_800D6D4();
    LoadCompressedPalette(gBattleTextboxPalette, 0, 64);
    ApplyPlayerChosenFrameToBattleMenu();
    ResetSpriteData();
    ResetTasks();
    LoadBattleEntryBackground();
    REG_WINOUT = 0x37;
    FreeAllSpritePalettes();
    gReservedSpritePaletteCount = 4;
    SetVBlankCallback(sub_800FCFC);
    taskId = CreateTask(sub_800DE30, 0);
    gTasks[taskId].data[1] = 0x10E;
    gTasks[taskId].data[2] = 0x5A;
    gTasks[taskId].data[5] = 1;
    sub_800FE40(taskId);
    SetMainCallback2(sub_80101B8);
    gBattleCommunication[0] = 0;
}

void sub_80101B8(void)
{
    c2_081284E0();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    RunTasks();
}

void c2_081284E0(void)
{
    switch (gBattleCommunication[0])
    {
    case 0:
        gBattleCommunication[1] = 0xFF;
        gBattleCommunication[0]++;
        break;
    case 1:
        gBattleCommunication[1]--;
        if (gBattleCommunication[1] == 0)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
            gBattleCommunication[0]++;
        }
        break;
    case 2:
        if (!gPaletteFade.active)
            SetMainCallback2(gMain.savedCallback);
        break;
    }
}

#if DEBUG

extern u8 gUnknown_Debug_2023B62[];
extern const u8 Str_821F7BD[];
extern const u8 Str_821F7DA[];

void debug_sub_8010818(void);
void debug_sub_80108B8(void);
void debug_sub_8010CAC(void);
void debug_sub_8011498(void);
void debug_sub_801174C(void);
void debug_sub_8011D40(void);
void debug_sub_8011E5C(void);
void debug_sub_8011E74(void);
void debug_sub_8011EA0(u8);
void debug_sub_8012294(void);
void debug_sub_80123D8(u8);
void debug_sub_8012540(void);
void debug_nullsub_3(void);
void debug_sub_80125A0(void);
void debug_sub_80125E4(void);
void debug_sub_8012628(void);
void debug_sub_8012658(void);
void debug_sub_8012688(void);
void debug_sub_8012878(void);
void debug_sub_8012D10(u8);
u32 debug_sub_8013294(u8, void *, u32);
void debug_sub_80132C8(u8, void *, u32);

extern s16 gUnknown_Debug_2023A76[][0x23];
extern s16 gUnknown_Debug_2023B02[][6][4];
extern u8 gUnknown_Debug_03004360;
extern struct Window gUnknown_Debug_03004370;
extern u8 gUnknown_Debug_030043A0;
extern u8 gUnknown_Debug_030043A4;
extern u8 gUnknown_Debug_030043A8;
extern u8 gBattleBuffersTransferData[];

extern const u16 gUnknown_Debug_821F424[][5];
extern const u16 gUnknown_Debug_821F56C[][5];
extern const u32 gUnknown_Debug_821F798[][4];

extern const u8 gUnusedOldCharmap_Gfx_lz[];
extern const u8 gUnusedOldCharmap_Tilemap_lz[];
extern const u8 gUnusedOldCharmap_Pal_lz[];

void debug_sub_8010800(void)
{
    debug_sub_8010818();
    debug_sub_80108B8();
    *(u32 *)(gBattleBuffersTransferData + 0x100) = 0;
}

void debug_sub_8010818(void)
{
	s32 i;

	gUnknown_Debug_2023A76[0][0] = 0x115;
	gUnknown_Debug_2023A76[1][0] = 0x115;
	for (i = 1; i < 31; i++)
	{
		gUnknown_Debug_2023A76[0][i] = gUnknown_Debug_821F424[i][4];
		gUnknown_Debug_2023A76[1][i] = gUnknown_Debug_821F424[i][4];
	}

	for (i = 0; i < 6; i++)
	{
		for (gUnknown_Debug_030043A8 = 0; gUnknown_Debug_030043A8 < 4; gUnknown_Debug_030043A8++)
		{
			gUnknown_Debug_2023B02[0][i][gUnknown_Debug_030043A8] = gUnknown_Debug_821F56C[gUnknown_Debug_030043A8][0];
			gUnknown_Debug_2023B02[1][i][gUnknown_Debug_030043A8] = gUnknown_Debug_821F56C[gUnknown_Debug_030043A8][0];
		}
	}
}

void debug_sub_80108B8(void)
{
	s32 i;

	m4aSoundVSyncOff();
	SetHBlankCallback(NULL);
	SetVBlankCallback(NULL);
	DmaFill32(3, 0, (void *)VRAM, VRAM_SIZE);
	REG_IE = 1;
	REG_DISPCNT = 0x1340;
	gBattle_BG0_X = 0;
	gBattle_BG0_Y = 0;
	gBattle_BG1_X = 0;
	gBattle_BG1_Y = 0;
	gBattle_BG2_X = 0;
	gBattle_BG2_Y = 0;
	gBattle_BG3_X = 0;
	gBattle_BG3_Y = 0;
	REG_BG0CNT = 0x1F09;
	REG_BG1CNT = 0x4801;
	REG_BLDCNT = 0;
	REG_BLDY = 0;
	LZDecompressVram(gUnusedOldCharmap_Gfx_lz, (void *)VRAM);
	LZDecompressWram(gUnusedOldCharmap_Tilemap_lz, gSharedMem);
	LZDecompressVram(gUnusedOldCharmap_Pal_lz, (void *)PLTT);
	LZDecompressVram(gUnusedOldCharmap_Pal_lz, (void *)(PLTT + 0x1E0));
	m4aSoundVSyncOn();
	SetVBlankCallback(debug_sub_8011D40);
	SetMainCallback2(debug_sub_8010CAC);
	ResetTasks();
	ResetSpriteData();
	ScanlineEffect_Stop();
	Text_LoadWindowTemplate(&gWindowTemplate_81E6C3C);
	Text_InitWindowWithTemplate(&gUnknown_Debug_03004370, &gWindowTemplate_81E6C3C);
	gUnknown_Debug_03004360 = 0;
	gUnknown_Debug_030043A0 = 0;
	gUnknown_Debug_030043A4 = 0;
	for (i = 0; i < 31; i++)
		debug_sub_8011EA0(i);
	for (gUnknown_Debug_030043A8 = 0; gUnknown_Debug_030043A8 < 4; gUnknown_Debug_030043A8++)
		debug_sub_8012294();
	debug_sub_80123D8(gUnknown_Debug_030043A4 * 5);
	debug_sub_8012540();
	debug_nullsub_3();
	gUnknown_Debug_030043A8 = 0;
	debug_sub_80125A0();
	if (gUnknown_Debug_2023A76[0][0x22] == 8)
	{
		debug_sub_801174C();
	}
	else
	{
		for (i = 0; i < 8; i++)
			gSharedMem[0x160B4 + i] = 0;
	}
}

void debug_sub_8010A7C(u8 a, u8 b)
{
    s32 i;

    for (i = 0; i < b; i++)
        gBattleTextBuff1[i] = a;
    gBattleTextBuff1[i] = EOS;
}

void debug_sub_8010AAC(u8 a)
{
	switch (gBaseStats[gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A4 * 5]].genderRatio)
	{
	case 0:
		gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A4 * 5 + 4] = 2;
		break;
	case 0xFE:
		gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A4 * 5 + 4] = 3;
		break;
	case 0xFF:
		gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A4 * 5 + 4] = 4;
		break;
	default:
		gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A4 * 5 + 4] &= 1;
		if (a != 0)
			gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A4 * 5 + 4] ^= 1;
		else
			gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A4 * 5 + 4] = 0;
		break;
	}
}

// gUnknown_Debug_2023A76 2D array
void debug_sub_8010B80(u8 a)
{
	s8 r12 = 0;
	s8 r7 = gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A0 + gUnknown_Debug_030043A4 * 5];

	while (r7 >= 10)
	{
		r7 -= 10;
		r12++;
	}

	if (a & 2)
	{
		if (a & 1)
			r12++;
		else
			r12--;
		if (r12 < 0)
			r12 = 9;
		if (r12 > 9)
			r12 = 0;
	}
	else
	{
		if (a & 1)
			r7++;
		else
			r7--;
		if (r7 < 1)
			r7 = 9;
		if (r7 > 9)
			r7 = 1;
	}
	gUnknown_Debug_2023A76[gUnknown_Debug_03004360 ^ 1][gUnknown_Debug_030043A0 + gUnknown_Debug_030043A4 * 5]
	= gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A0 + gUnknown_Debug_030043A4 * 5]
	= r12 * 10 + r7;
}

// For some unexplainable reason, code in various functions will cause SetActionsAndBanksTurnOrder,
// a completely separate and unrelated function, to use different registers. I have
// absolutely no clue as to why this phenomenon occurs. For example,
// I have to make debug_sub_8010CAC access gUnknown_Debug_2023A76 as a 3D array.
// If I use a 2D array, SetActionsAndBanksTurnOrder will no longer match.
#ifdef NONMATCHING
void debug_sub_8010CAC(void)
{
    s32 r5;

    if (gMain.heldKeysRaw == (L_BUTTON | SELECT_BUTTON))
        DoSoftReset();
    if (gMain.newKeysRaw == SELECT_BUTTON)
    {
        if (gUnknown_Debug_030043A4 < 6)
        {
            gUnknown_Debug_030043A8 = 0;
            debug_sub_8012628();
            SetMainCallback2(debug_sub_8011498);
        }
        if (gUnknown_Debug_030043A0 == 0 && gUnknown_Debug_030043A4 == 6)
        {
            gMain.savedCallback = debug_sub_80108B8;
            CreateMon(
              &gPlayerParty[0],
              gUnknown_Debug_2023A76[0][0 * 5 + 0],
              gUnknown_Debug_2023A76[0][0 * 5 + 1],
              32,
              0, 0, 0, 0);
            for (r5 = 0; r5 < 4; r5++)
            {
                SetMonData(&gPlayerParty[0], MON_DATA_MOVE1 + r5, &gUnknown_Debug_2023B02[0][0][r5]);
                SetMonData(&gPlayerParty[0], MON_DATA_PP1 + r5, &gBattleMoves[gUnknown_Debug_2023B02[0][0][r5]].pp);
            }
            switch (gUnknown_Debug_2023A76[0][6 * 5 + 0])
            {
            case 1:
                gCB2_AfterEvolution = debug_sub_80108B8;
                EvolutionScene(&gPlayerParty[0], gUnknown_Debug_2023A76[0][1 * 5 + 0], 1, 0);
                break;
            case 2:
                debug_sub_8012688();
                break;
            }
        }
        if (gUnknown_Debug_030043A0 == 1 && gUnknown_Debug_030043A4 == 6)
        {
            // This is really weird
            r5 = (gSaveBlock2.optionsBattleSceneOff | (gSaveBlock2.optionsSound << 1));
            r5++;
            if (r5 == 4)
                r5 = 0;
            gSaveBlock2.optionsBattleSceneOff = (r5 & 1);
            gSaveBlock2.optionsSound = (r5 & 2) >> 1;
            SetPokemonCryStereo(gSaveBlock2.optionsSound);
            debug_nullsub_3();
        }
    }
    if (gMain.newKeysRaw == START_BUTTON)
        debug_sub_801174C();
    if (gMain.newKeysRaw == DPAD_UP)
    {
        debug_sub_80125E4();
        if (gUnknown_Debug_030043A4 != 0)
            gUnknown_Debug_030043A4--;
        else
            gUnknown_Debug_030043A4 = 6;
        debug_sub_8011E74();
        debug_sub_80123D8(gUnknown_Debug_030043A4 * 5);
        debug_sub_80125A0();
    }
    if (gMain.newKeysRaw == DPAD_DOWN)
    {
        debug_sub_80125E4();
        if (gUnknown_Debug_030043A4 == 6)
            gUnknown_Debug_030043A4 = 0;
        else
            gUnknown_Debug_030043A4++;
        debug_sub_8011E74();
        debug_sub_80123D8(gUnknown_Debug_030043A4 * 5);
        debug_sub_80125A0();
    }
    if (gMain.newKeysRaw == DPAD_LEFT)
    {
        debug_sub_80125E4();
        if (gUnknown_Debug_030043A0 != 0)
        {
            gUnknown_Debug_030043A0--;
        }
        else
        {
            if (gUnknown_Debug_03004360 != 0)
            {
                gUnknown_Debug_03004360 = 0;
                gUnknown_Debug_030043A0 = 4;
                gBattle_BG1_X = 0;
                debug_sub_8011E5C();
                debug_sub_8011E74();
                debug_sub_80123D8(gUnknown_Debug_030043A4 * 5);
            }
        }
        debug_sub_80125A0();
    }
    if (gMain.newKeysRaw == DPAD_RIGHT)
    {
        debug_sub_80125E4();
        if (gUnknown_Debug_030043A0 != 4)
        {
            gUnknown_Debug_030043A0++;
        }
        else
        {
            if (gUnknown_Debug_03004360 == 0)
            {
                gUnknown_Debug_03004360 = 1;
                gUnknown_Debug_030043A0 = 0;
                gBattle_BG1_X = 0x100;
                debug_sub_8011E5C();
                debug_sub_8011E74();
                debug_sub_80123D8(gUnknown_Debug_030043A4 * 5);
            }
        }
        debug_sub_80125A0();
    }
    if (gMain.newAndRepeatedKeys & B_BUTTON)
    {
        switch (gUnknown_Debug_030043A0 + gUnknown_Debug_030043A4 * 5)
        {
        case 31:
            debug_sub_8010818();
            debug_sub_8011E5C();
            debug_sub_8011E74();
            debug_sub_8012540();
            debug_nullsub_3();
            debug_sub_80123D8(gUnknown_Debug_030043A4 * 5);
            break;
        case 32:
            debug_sub_80132C8(31, gUnknown_Debug_2023A76, 0xEC);
            debug_sub_8011E5C();
            debug_sub_8011E74();
            debug_sub_8012540();
            debug_nullsub_3();
            debug_sub_80123D8(gUnknown_Debug_030043A4 * 5);
            break;
        case 33:
            debug_sub_8013294(31, gUnknown_Debug_2023A76, 0xEC);
            break;
        case 34:
            if (gUnknown_Debug_2023A76[0][6 * 5 + 4] != 0)
            {
                gUnknown_Debug_2023A76[0][6 * 5 + 4]--;
                gUnknown_Debug_2023A76[1][6 * 5 + 4]--;
            }
            else
            {
                gUnknown_Debug_2023A76[0][6 * 5 + 4] = 8;
                gUnknown_Debug_2023A76[1][6 * 5 + 4] = 8;
            }
            debug_sub_8012540();
            break;
        case 30:
            debug_sub_8010B80(0);
            debug_sub_8011EA0(gUnknown_Debug_030043A0 + gUnknown_Debug_030043A4 * 5);
            break;
        default:
            if (gUnknown_Debug_030043A0 == 4 && gUnknown_Debug_030043A4 < 6)
            {
                debug_sub_8010AAC(1);
            }
            else
            {
                gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A0 + gUnknown_Debug_030043A4 * 5]--;
                if (gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A0 + gUnknown_Debug_030043A4 * 5] < gUnknown_Debug_821F424[gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0][4])
                    gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A0 + gUnknown_Debug_030043A4 * 5] = gUnknown_Debug_821F424[gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0][3];
            }
            if (gUnknown_Debug_030043A0 == 0)
            {
                debug_sub_8010AAC(0);
                debug_sub_8011EA0(gUnknown_Debug_030043A4 * 5 + 4);
            }
            debug_sub_8011EA0(gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0);
            debug_sub_80123D8(gUnknown_Debug_030043A4 * 5);
            break;
        }
    }
    if (gMain.newAndRepeatedKeys & A_BUTTON)
    {
        switch (gUnknown_Debug_030043A0 + gUnknown_Debug_030043A4 * 5)
        {
        case 31:
            debug_sub_8010818();
            debug_sub_8011E5C();
            debug_sub_8011E74();
            debug_sub_8012540();
            debug_nullsub_3();
            debug_sub_80123D8(gUnknown_Debug_030043A4 * 5);
            break;
        case 32:
            debug_sub_80132C8(31, gUnknown_Debug_2023A76, 0xEC);
            debug_sub_8011E5C();
            debug_sub_8011E74();
            debug_sub_8012540();
            debug_nullsub_3();
            debug_sub_80123D8(gUnknown_Debug_030043A4 * 5);
            break;
        case 33:
            debug_sub_8013294(31, gUnknown_Debug_2023A76, 0xEC);
            break;
        case 34:
            if (gUnknown_Debug_2023A76[0][6 * 5 + 4] < 8)
            {
                gUnknown_Debug_2023A76[0][6 * 5 + 4]++;
                gUnknown_Debug_2023A76[1][6 * 5 + 4]++;
            }
            else
            {
                gUnknown_Debug_2023A76[0][6 * 5 + 4] = 0;
                gUnknown_Debug_2023A76[1][6 * 5 + 4] = 0;
            }
            debug_sub_8012540();
            break;
        case 30:
            debug_sub_8010B80(1);
            debug_sub_8011EA0(gUnknown_Debug_030043A0 + gUnknown_Debug_030043A4 * 5);
            break;
        default:
            if (gUnknown_Debug_030043A0 == 4 && gUnknown_Debug_030043A4 < 6)
            {
                debug_sub_8010AAC(1);
            }
            else
            {
                gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A0 + gUnknown_Debug_030043A4 * 5]++;
                if (gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0] > gUnknown_Debug_821F424[gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0][3])
                    gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0] = gUnknown_Debug_821F424[gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0][4];
            }
            if (gUnknown_Debug_030043A0 == 0)
            {
                debug_sub_8010AAC(0);
                debug_sub_8011EA0(gUnknown_Debug_030043A4 * 5 + 4);
            }
            debug_sub_8011EA0(gUnknown_Debug_030043A0 + gUnknown_Debug_030043A4 * 5);
            debug_sub_80123D8(gUnknown_Debug_030043A4 * 5);
            break;
        }
    }
    if (gMain.newAndRepeatedKeys & L_BUTTON)
    {
        if (gUnknown_Debug_030043A0 == 4 && gUnknown_Debug_030043A4 < 6)
        {
            debug_sub_8010AAC(1);
        }
        else
        {
            if (gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0 == 30)
            {
                debug_sub_8010B80(2);
            }
            else
            {
                gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0] -= 10;
                while (gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0] < gUnknown_Debug_821F424[gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0][4])
                    gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0] += gUnknown_Debug_821F424[gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0][3];
            }
        }
        if (gUnknown_Debug_030043A0 == 0)
        {
            debug_sub_8010AAC(0);
            debug_sub_8011EA0(gUnknown_Debug_030043A4 * 5 + 4);
        }
        debug_sub_8011EA0(gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0);
        debug_sub_80123D8(gUnknown_Debug_030043A4 * 5);
    }
    if (gMain.newAndRepeatedKeys & R_BUTTON)
    {
        if (gUnknown_Debug_030043A0 == 4 && gUnknown_Debug_030043A4 < 6)
        {
            debug_sub_8010AAC(1);
        }
        else
        {
            if (gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0 == 30)
            {
                debug_sub_8010B80(3);
            }
            else
            {
                gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0] += 10;
                while (gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0] > gUnknown_Debug_821F424[gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0][3])
                    gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0] -= gUnknown_Debug_821F424[gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0][3];
            }
        }
        if (gUnknown_Debug_030043A0 == 0)
        {
            debug_sub_8010AAC(0);
            debug_sub_8011EA0(gUnknown_Debug_030043A4 * 5 + 4);
        }
        debug_sub_8011EA0(gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0);
        debug_sub_80123D8(gUnknown_Debug_030043A4 * 5);
    }
    AnimateSprites();
    BuildOamBuffer();
}
#else

// 3D array
extern s16 gUnknown_Debug_2023A76_[][7][5];

void debug_sub_8010CAC(void)
{
    s32 r5;

    if (gMain.heldKeysRaw == (L_BUTTON | SELECT_BUTTON))
        DoSoftReset();
    if (gMain.newKeysRaw == SELECT_BUTTON)
    {
        if (gUnknown_Debug_030043A4 < 6)
        {
            gUnknown_Debug_030043A8 = 0;
            debug_sub_8012628();
            SetMainCallback2(debug_sub_8011498);
        }
        if (gUnknown_Debug_030043A0 == 0 && gUnknown_Debug_030043A4 == 6)
        {
            gMain.savedCallback = debug_sub_80108B8;
            CreateMon(
              &gPlayerParty[0],
              gUnknown_Debug_2023A76_[0][0][0],
              gUnknown_Debug_2023A76_[0][0][1],
              32,
              0, 0, 0, 0);
            for (r5 = 0; r5 < 4; r5++)
            {
                SetMonData(&gPlayerParty[0], MON_DATA_MOVE1 + r5, &gUnknown_Debug_2023B02[0][0][r5]);
                SetMonData(&gPlayerParty[0], MON_DATA_PP1 + r5, &gBattleMoves[gUnknown_Debug_2023B02[0][0][r5]].pp);
            }
            switch (gUnknown_Debug_2023A76_[0][6][0])
            {
            case 1:
                gCB2_AfterEvolution = debug_sub_80108B8;
                EvolutionScene(&gPlayerParty[0], gUnknown_Debug_2023A76_[0][1][0], 1, 0);
                break;
            case 2:
                debug_sub_8012688();
                break;
            }
        }
        if (gUnknown_Debug_030043A0 == 1 && gUnknown_Debug_030043A4 == 6)
        {
            // This is really weird
            r5 = (gSaveBlock2.optionsBattleSceneOff | (gSaveBlock2.optionsSound << 1));
            r5++;
            if (r5 == 4)
                r5 = 0;
            gSaveBlock2.optionsBattleSceneOff = (r5 & 1);
            gSaveBlock2.optionsSound = (r5 & 2) >> 1;
            SetPokemonCryStereo(gSaveBlock2.optionsSound);
            debug_nullsub_3();
        }
    }
    if (gMain.newKeysRaw == START_BUTTON)
        debug_sub_801174C();
    if (gMain.newKeysRaw == DPAD_UP)
    {
        debug_sub_80125E4();
        if (gUnknown_Debug_030043A4 != 0)
            gUnknown_Debug_030043A4--;
        else
            gUnknown_Debug_030043A4 = 6;
        debug_sub_8011E74();
        debug_sub_80123D8(gUnknown_Debug_030043A4 * 5);
        debug_sub_80125A0();
    }
    if (gMain.newKeysRaw == DPAD_DOWN)
    {
        debug_sub_80125E4();
        if (gUnknown_Debug_030043A4 == 6)
            gUnknown_Debug_030043A4 = 0;
        else
            gUnknown_Debug_030043A4++;
        debug_sub_8011E74();
        debug_sub_80123D8(gUnknown_Debug_030043A4 * 5);
        debug_sub_80125A0();
    }
    if (gMain.newKeysRaw == DPAD_LEFT)
    {
        debug_sub_80125E4();
        if (gUnknown_Debug_030043A0 != 0)
        {
            gUnknown_Debug_030043A0--;
        }
        else
        {
            if (gUnknown_Debug_03004360 != 0)
            {
                gUnknown_Debug_03004360 = 0;
                gUnknown_Debug_030043A0 = 4;
                gBattle_BG1_X = 0;
                debug_sub_8011E5C();
                debug_sub_8011E74();
                debug_sub_80123D8(gUnknown_Debug_030043A4 * 5);
            }
        }
        debug_sub_80125A0();
    }
    if (gMain.newKeysRaw == DPAD_RIGHT)
    {
        debug_sub_80125E4();
        if (gUnknown_Debug_030043A0 != 4)
        {
            gUnknown_Debug_030043A0++;
        }
        else
        {
            if (gUnknown_Debug_03004360 == 0)
            {
                gUnknown_Debug_03004360 = 1;
                gUnknown_Debug_030043A0 = 0;
                gBattle_BG1_X = 0x100;
                debug_sub_8011E5C();
                debug_sub_8011E74();
                debug_sub_80123D8(gUnknown_Debug_030043A4 * 5);
            }
        }
        debug_sub_80125A0();
    }
    if (gMain.newAndRepeatedKeys & B_BUTTON)
    {
        switch (gUnknown_Debug_030043A0 + gUnknown_Debug_030043A4 * 5)
        {
        case 31:
            debug_sub_8010818();
            debug_sub_8011E5C();
            debug_sub_8011E74();
            debug_sub_8012540();
            debug_nullsub_3();
            debug_sub_80123D8(gUnknown_Debug_030043A4 * 5);
            break;
        case 32:
            debug_sub_80132C8(31, gUnknown_Debug_2023A76, 0xEC);
            debug_sub_8011E5C();
            debug_sub_8011E74();
            debug_sub_8012540();
            debug_nullsub_3();
            debug_sub_80123D8(gUnknown_Debug_030043A4 * 5);
            break;
        case 33:
            debug_sub_8013294(31, gUnknown_Debug_2023A76, 0xEC);
            break;
        case 34:
            if (gUnknown_Debug_2023A76_[0][6][4] != 0)
            {
                gUnknown_Debug_2023A76_[0][6][4]--;
                gUnknown_Debug_2023A76_[1][6][4]--;
            }
            else
            {
                gUnknown_Debug_2023A76_[0][6][4] = 8;
                gUnknown_Debug_2023A76_[1][6][4] = 8;
            }
            debug_sub_8012540();
            break;
        case 30:
            debug_sub_8010B80(0);
            debug_sub_8011EA0(gUnknown_Debug_030043A0 + gUnknown_Debug_030043A4 * 5);
            break;
        default:
            if (gUnknown_Debug_030043A0 == 4 && gUnknown_Debug_030043A4 < 6)
            {
                debug_sub_8010AAC(1);
            }
            else
            {
                gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A0 + gUnknown_Debug_030043A4 * 5]--;
                if (gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0] < gUnknown_Debug_821F424[gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0][4])
                    gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0] = gUnknown_Debug_821F424[gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0][3];
            }
            if (gUnknown_Debug_030043A0 == 0)
            {
                debug_sub_8010AAC(0);
                debug_sub_8011EA0(gUnknown_Debug_030043A4 * 5 + 4);
            }
            debug_sub_8011EA0(gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0);
            debug_sub_80123D8(gUnknown_Debug_030043A4 * 5);
            break;
        }
    }
    if (gMain.newAndRepeatedKeys & A_BUTTON)
    {
        switch (gUnknown_Debug_030043A0 + gUnknown_Debug_030043A4 * 5)
        {
        case 31:
            debug_sub_8010818();
            debug_sub_8011E5C();
            debug_sub_8011E74();
            debug_sub_8012540();
            debug_nullsub_3();
            debug_sub_80123D8(gUnknown_Debug_030043A4 * 5);
            break;
        case 32:
            debug_sub_80132C8(31, gUnknown_Debug_2023A76, 0xEC);
            debug_sub_8011E5C();
            debug_sub_8011E74();
            debug_sub_8012540();
            debug_nullsub_3();
            debug_sub_80123D8(gUnknown_Debug_030043A4 * 5);
            break;
        case 33:
            debug_sub_8013294(31, gUnknown_Debug_2023A76, 0xEC);
            break;
        case 34:
            if (gUnknown_Debug_2023A76_[0][6][4] < 8)
            {
                gUnknown_Debug_2023A76_[0][6][4]++;
                gUnknown_Debug_2023A76_[1][6][4]++;
            }
            else
            {
                gUnknown_Debug_2023A76_[0][6][4] = 0;
                gUnknown_Debug_2023A76_[1][6][4] = 0;
            }
            debug_sub_8012540();
            break;
        case 30:
            debug_sub_8010B80(1);
            debug_sub_8011EA0(gUnknown_Debug_030043A0 + gUnknown_Debug_030043A4 * 5);
            break;
        default:
            if (gUnknown_Debug_030043A0 == 4 && gUnknown_Debug_030043A4 < 6)
            {
                debug_sub_8010AAC(1);
            }
            else
            {
                gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A0 + gUnknown_Debug_030043A4 * 5]++;
                if (gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0] > gUnknown_Debug_821F424[gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0][3])
                    gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0] = gUnknown_Debug_821F424[gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0][4];
            }
            if (gUnknown_Debug_030043A0 == 0)
            {
                debug_sub_8010AAC(0);
                debug_sub_8011EA0(gUnknown_Debug_030043A4 * 5 + 4);
            }
            debug_sub_8011EA0(gUnknown_Debug_030043A0 + gUnknown_Debug_030043A4 * 5);
            debug_sub_80123D8(gUnknown_Debug_030043A4 * 5);
            break;
        }
    }
    if (gMain.newAndRepeatedKeys & L_BUTTON)
    {
        if (gUnknown_Debug_030043A0 == 4 && gUnknown_Debug_030043A4 < 6)
        {
            debug_sub_8010AAC(1);
        }
        else
        {
            if (gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0 == 30)
            {
                debug_sub_8010B80(2);
            }
            else
            {
                gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0] -= 10;
                while (gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0] < gUnknown_Debug_821F424[gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0][4])
                    gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0] += gUnknown_Debug_821F424[gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0][3];
            }
        }
        if (gUnknown_Debug_030043A0 == 0)
        {
            debug_sub_8010AAC(0);
            debug_sub_8011EA0(gUnknown_Debug_030043A4 * 5 + 4);
        }
        debug_sub_8011EA0(gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0);
        debug_sub_80123D8(gUnknown_Debug_030043A4 * 5);
    }
    if (gMain.newAndRepeatedKeys & R_BUTTON)
    {
        if (gUnknown_Debug_030043A0 == 4 && gUnknown_Debug_030043A4 < 6)
        {
            debug_sub_8010AAC(1);
        }
        else
        {
            if (gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0 == 30)
            {
                debug_sub_8010B80(3);
            }
            else
            {
                gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0] += 10;
                while (gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0] > gUnknown_Debug_821F424[gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0][3])
                    gUnknown_Debug_2023A76[gUnknown_Debug_03004360][gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0] -= gUnknown_Debug_821F424[gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0][3];
            }
        }
        if (gUnknown_Debug_030043A0 == 0)
        {
            debug_sub_8010AAC(0);
            debug_sub_8011EA0(gUnknown_Debug_030043A4 * 5 + 4);
        }
        debug_sub_8011EA0(gUnknown_Debug_030043A4 * 5 + gUnknown_Debug_030043A0);
        debug_sub_80123D8(gUnknown_Debug_030043A4 * 5);
    }
    AnimateSprites();
    BuildOamBuffer();
}
#endif

extern u16 gUnknown_Debug_821F564[][5];

void debug_sub_8011498(void)
{
	u8 r9 = gUnknown_Debug_030043A0 + gUnknown_Debug_030043A4 * 5;

	if (gMain.heldKeysRaw == (L_BUTTON | SELECT_BUTTON))
		DoSoftReset();
	if (gMain.newKeysRaw == SELECT_BUTTON)
	{
		debug_sub_8012658();
		SetMainCallback2(debug_sub_8010CAC);
	}
	if (gMain.newKeysRaw == START_BUTTON)
		debug_sub_801174C();
	if (gMain.newKeysRaw == DPAD_UP || gMain.newKeysRaw == DPAD_DOWN)
	{
		debug_sub_8012658();
		gUnknown_Debug_030043A8 ^= 2;
		debug_sub_8012628();
	}
	if (gMain.newKeysRaw == DPAD_LEFT || gMain.newKeysRaw == DPAD_RIGHT)
	{
		debug_sub_8012658();
		gUnknown_Debug_030043A8 ^= 1;
		debug_sub_8012628();
	}
	if (gMain.newAndRepeatedKeys & B_BUTTON)
	{
		gUnknown_Debug_2023B02[gUnknown_Debug_03004360][r9 / 5][gUnknown_Debug_030043A8]--;
		if (gUnknown_Debug_2023B02[gUnknown_Debug_03004360][r9 / 5][gUnknown_Debug_030043A8] < gUnknown_Debug_821F564[gUnknown_Debug_030043A8][4])
			gUnknown_Debug_2023B02[gUnknown_Debug_03004360][r9 / 5][gUnknown_Debug_030043A8] = gUnknown_Debug_821F564[gUnknown_Debug_030043A8][3];
		debug_sub_8012294();
	}
	if (gMain.newAndRepeatedKeys & A_BUTTON)
	{
		gUnknown_Debug_2023B02[gUnknown_Debug_03004360][r9 / 5][gUnknown_Debug_030043A8]++;
		if (gUnknown_Debug_2023B02[gUnknown_Debug_03004360][r9 / 5][gUnknown_Debug_030043A8] > gUnknown_Debug_821F564[gUnknown_Debug_030043A8][3])
			gUnknown_Debug_2023B02[gUnknown_Debug_03004360][r9 / 5][gUnknown_Debug_030043A8] = gUnknown_Debug_821F564[gUnknown_Debug_030043A8][4];
		debug_sub_8012294();
	}
	if (gMain.newAndRepeatedKeys & L_BUTTON)
	{
		gUnknown_Debug_2023B02[gUnknown_Debug_03004360][r9 / 5][gUnknown_Debug_030043A8] -= 10;
		while (gUnknown_Debug_2023B02[gUnknown_Debug_03004360][r9 / 5][gUnknown_Debug_030043A8] < gUnknown_Debug_821F564[gUnknown_Debug_030043A8][4])
			gUnknown_Debug_2023B02[gUnknown_Debug_03004360][r9 / 5][gUnknown_Debug_030043A8] += gUnknown_Debug_821F564[gUnknown_Debug_030043A8][3];
		debug_sub_8012294();
	}
	if (gMain.newAndRepeatedKeys & R_BUTTON)
	{
		gUnknown_Debug_2023B02[gUnknown_Debug_03004360][r9 / 5][gUnknown_Debug_030043A8] += 10;
		while (gUnknown_Debug_2023B02[gUnknown_Debug_03004360][r9 / 5][gUnknown_Debug_030043A8] > gUnknown_Debug_821F564[gUnknown_Debug_030043A8][3])
			gUnknown_Debug_2023B02[gUnknown_Debug_03004360][r9 / 5][gUnknown_Debug_030043A8] -= gUnknown_Debug_821F564[gUnknown_Debug_030043A8][3];
		debug_sub_8012294();
	}
	AnimateSprites();
	BuildOamBuffer();
}

extern const u16 gUnknown_Debug_821F598[];
extern const u8 str_821F631[][6];
extern const u8 Str_821F649[];
extern const struct Pokeblock gUnknown_Debug_821F5AC[];

extern u8 gUnknown_020297ED;

extern void debug_sub_800D684(void);

void debug_sub_801174C(void)
{
	u8 r9 = 0;
	u8 r6;
	s32 i;
	s32 spC;
	u16 sp10;

	gUnknown_020297ED = 1;
	r6 = Random() % 4;
	StringCopy(gSaveBlock2.playerName, str_821F631[r6]);
	gSaveBlock2.playerGender = r6 >> 1;
	ZeroPlayerPartyMons();
	ZeroEnemyPartyMons();
	i = gUnknown_Debug_2023A76[0][30];
	spC = 0;
	if (i >= 10)
	{
		spC = 0;
		while (i >= 10)
		{
			i -= 10;
			spC++;
		}
	}
	gBattleTypeFlags = gUnknown_Debug_821F598[i - 1];
	gUnknown_02023A14_50 = 8;
	gBattleTerrain = spC;
	if (gBattleTypeFlags & BATTLE_TYPE_SAFARI)
		EnterSafariMode();
	if (gUnknown_Debug_2023A76[0][30] >= 2 && gUnknown_Debug_2023A76[0][30] <= 4)
		gTrainerBattleOpponent = (Random() & 7) + 1;

	gPlayerPartyCount = 0;
	for (i = 0; i < 30; i += 5)
	{
		if (gUnknown_Debug_2023A76[0][i] != 0)
		{
			switch (gUnknown_Debug_2023A76[0][i + 4])
			{
			case 0:
			case 2:
				r6 = 0;
				break;
			case 1:
            case 3:
				r6 = 0xFE;
				break;
			default:
				r6 = 0xFF;
				break;
			}
			if (gUnknown_Debug_2023A76[0][i] == 0xC9 && i + 5 < 30)
				r9 = gUnknown_Debug_2023A76[0][i + 7];
			else
				r9 = 0;
			CreateMonWithGenderNatureLetter(
				&gEnemyParty[i / 5],
				gUnknown_Debug_2023A76[0][i],
				gUnknown_Debug_2023A76[0][i + 1],
				0,
				r6,
				0,
				r9);
		}
		SetMonData(&gEnemyParty[i / 5], MON_DATA_HELD_ITEM, &gUnknown_Debug_2023A76[0][i + 2]);
		sp10 = gUnknown_Debug_2023A76[0][i + 2] - 1;
		if (sp10 <= 11)
			SetMonData(&gEnemyParty[i / 5], MON_DATA_POKEBALL, &gUnknown_Debug_2023A76[0][i + 2]);
		if (gUnknown_Debug_2023A76[0][i + 3] != 0 && gUnknown_Debug_2023A76[0][i + 3] != 3)
		{
			if (gUnknown_Debug_2023A76[0][i + 3] <= 2)
				spC = gUnknown_Debug_2023A76[0][i + 3] - 1;
			else
				spC = gUnknown_Debug_2023A76[0][i + 3] - 4;
			SetMonData(&gEnemyParty[i / 5], MON_DATA_ALT_ABILITY, &spC);
		}

		if (gUnknown_Debug_2023A76[1][i] != 0)
		{
			switch (gUnknown_Debug_2023A76[1][i + 4])
			{
			case 0:
			case 2:
				r6 = 0;
				break;
			case 1:
            case 3:
				r6 = 0xFE;
				break;
			default:
				r6 = 0xFF;
				break;
			}
			if (gUnknown_Debug_2023A76[1][i] == 0xC9 && i + 5 < 30)
				r9 = gUnknown_Debug_2023A76[1][i + 7];
			else
				r9 = 0;
			CreateMonWithGenderNatureLetter(
				&gPlayerParty[i / 5],
				gUnknown_Debug_2023A76[1][i],
				gUnknown_Debug_2023A76[1][i + 1],
				0,
				r6,
				0,
				r9);
			gPlayerPartyCount++;
		}
		SetMonData(&gPlayerParty[i / 5], MON_DATA_HELD_ITEM, &gUnknown_Debug_2023A76[1][i + 2]);
		sp10 = gUnknown_Debug_2023A76[0][i + 2] - 1;
		if (sp10 <= 11)
			SetMonData(&gPlayerParty[i / 5], MON_DATA_POKEBALL, &gUnknown_Debug_2023A76[1][i + 2]);
		if (gUnknown_Debug_2023A76[1][i + 3] != 0 && gUnknown_Debug_2023A76[1][i + 3] != 3)
		{
			if (gUnknown_Debug_2023A76[1][i + 3] <= 2)
				spC = gUnknown_Debug_2023A76[1][i + 3] - 1;
			else
				spC = gUnknown_Debug_2023A76[1][i + 3] - 4;
			SetMonData(&gPlayerParty[i / 5], MON_DATA_ALT_ABILITY, &spC);
		}
		if (gUnknown_Debug_2023A76[1][i + 3] > 2)
		{
			SetMonData(&gPlayerParty[i / 5], MON_DATA_OT_NAME, Str_821F649);
			gUnknown_02023A14_50 |= 0x40;
		}
	}

    for (spC = 0; spC < 6; spC++)
    {
        for (i = 0; i < 4; i++)
        {
            SetMonData(&gEnemyParty[spC], MON_DATA_MOVE1 + i, &gUnknown_Debug_2023B02[0][spC][i]);
            SetMonData(&gEnemyParty[spC], MON_DATA_PP1 + i, &gBattleMoves[gUnknown_Debug_2023B02[0][spC][i]].pp);
            SetMonData(&gPlayerParty[spC], MON_DATA_MOVE1 + i, &gUnknown_Debug_2023B02[1][spC][i]);
            SetMonData(&gPlayerParty[spC], MON_DATA_PP1 + i, &gBattleMoves[gUnknown_Debug_2023B02[1][spC][i]].pp);
        }
    }

    if (gUnknown_Debug_2023A76[0][0x22] == 8)
    {
        gUnknown_02023A14_50 |= 0x80;
        sub_80408BC();
    }
    else if (gUnknown_Debug_2023A76[0][0x22] == 7)
    {
        gUnknown_02023A14_50 |= 0x20;
        sub_80408BC();
    }
    else if (gUnknown_Debug_2023A76[0][0x22] == 6)
    {
        gUnknown_02023A14_50 |= 0x10;
        if (gUnknown_Debug_2023A76[0][2] > 5)
            gSharedMem[0x160A3] = gUnknown_Debug_2023A76[0][2] - 2;
        else
            gSharedMem[0x160A3] = gUnknown_Debug_2023A76[0][2];
        sub_80408BC();
    }
    else if (gUnknown_Debug_2023A76[0][0x22] == 5)
    {
        gUnknown_02023A14_50 |= 0x21;
        sub_80408BC();
    }
    else
    {
        if (!(gUnknown_Debug_2023A76[0][0x22] & 1))
            sub_80408BC();
        if (gUnknown_Debug_2023A76[0][0x22] & 2)
            gUnknown_02023A14_50 |= 4;
        if (gUnknown_Debug_2023A76[0][0x22] & 4)
            gUnknown_02023A14_50 |= 6;
    }

    gMain.savedCallback = debug_sub_80108B8;
    SetMainCallback2(debug_sub_800D684);

    ClearBag();

    AddBagItem(ITEM_MASTER_BALL, 10);
    AddBagItem(ITEM_ULTRA_BALL, 10);
    AddBagItem(ITEM_GREAT_BALL, 10);
    AddBagItem(ITEM_POKE_BALL, 10);
    AddBagItem(ITEM_SAFARI_BALL, 10);
    AddBagItem(ITEM_NET_BALL, 10);
    AddBagItem(ITEM_DIVE_BALL, 10);
    AddBagItem(ITEM_NEST_BALL, 10);
    AddBagItem(ITEM_REPEAT_BALL, 10);
    AddBagItem(ITEM_TIMER_BALL, 10);
    AddBagItem(ITEM_LUXURY_BALL, 10);
    AddBagItem(ITEM_PREMIER_BALL, 10);

    AddBagItem(ITEM_FULL_RESTORE, 99);
    AddBagItem(ITEM_MAX_POTION, 99);
    AddBagItem(ITEM_MAX_REVIVE, 99);
    AddBagItem(ITEM_ETHER, 99);
    AddBagItem(ITEM_MAX_ETHER, 99);
    AddBagItem(ITEM_MAX_ELIXIR, 99);

    AddBagItem(ITEM_GUARD_SPEC, 99);
    AddBagItem(ITEM_DIRE_HIT, 99);
    AddBagItem(ITEM_X_ATTACK, 99);
    AddBagItem(ITEM_X_DEFEND, 99);
    AddBagItem(ITEM_X_SPEED, 99);
    AddBagItem(ITEM_X_ACCURACY, 99);
    // hmm... no X Special? Why do we need Poke Doll?
    AddBagItem(ITEM_POKE_DOLL, 99);

    for (i = 0; i < 15; i++)
        GivePokeblock(&gUnknown_Debug_821F5AC[i]);
}

void debug_sub_8011D40(void)
{
    DmaCopy16(3, gSharedMem, (void *)(VRAM + 0x4000), 0x1000);
    REG_BG0HOFS = gBattle_BG0_X;
    REG_BG0VOFS = gBattle_BG0_Y;
    REG_BG1HOFS = gBattle_BG1_X;
    REG_BG1VOFS = gBattle_BG1_Y;
    REG_BG2HOFS = gBattle_BG2_X;
    REG_BG2VOFS = gBattle_BG2_Y;
    REG_BG3HOFS = gBattle_BG3_X;
    REG_BG3VOFS = gBattle_BG3_Y;
    LoadOam();
    ProcessSpriteCopyRequests();
}

void debug_nullsub_45()
{
}

void debug_sub_8011DD4(void)
{
    REG_BG0CNT = 0x9803;

    REG_BG0HOFS = gBattle_BG0_X;
    REG_BG0VOFS = gBattle_BG0_Y;

    REG_BG1HOFS = gBattle_BG1_X;
    REG_BG1VOFS = gBattle_BG1_Y;

    REG_BG2HOFS = gBattle_BG2_X;
    REG_BG2VOFS = gBattle_BG2_Y;

    REG_BG3HOFS = gBattle_BG3_X;
    REG_BG3VOFS = gBattle_BG3_Y;

    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    ScanlineEffect_InitHBlankDmaTransfer();
}

void debug_sub_8011E5C(void)
{
    s32 i;

    for (i = 0; i < 31; i++)
        debug_sub_8011EA0(i);
}

extern u8 gUnknown_Debug_030043A8;

void debug_sub_8011E74(void)
{
    u8 r5 = gUnknown_Debug_030043A8;

    for (gUnknown_Debug_030043A8 = 0; gUnknown_Debug_030043A8 < 4; gUnknown_Debug_030043A8++)
        debug_sub_8012294();

    gUnknown_Debug_030043A8 = r5;
}

extern const u8 Str_821F624[];

void debug_sub_8011EA0(u8 a)
{
    u32 length;

    switch (a)
    {
    case 0:
    case 5:
    case 10:
    case 15:
    case 20:
    case 25:
        debug_sub_8010A7C(0, 20);
        Text_InitWindow(
            &gUnknown_Debug_03004370,
            gBattleTextBuff1,
            gUnknown_Debug_821F424[a][0],
            gUnknown_Debug_821F424[a][1],
            gUnknown_Debug_821F424[a][2]);
        Text_PrintWindow8002F44(&gUnknown_Debug_03004370);
        ConvertIntToDecimalStringN(gBattleTextBuff1, gUnknown_Debug_2023A76[gUnknown_Debug_03004360][a], 2, 3);
        Text_InitWindow(
            &gUnknown_Debug_03004370,
            gBattleTextBuff1,
            422,
            gUnknown_Debug_03004360 * 32 + 25,
            0);
        Text_PrintWindow8002F44(&gUnknown_Debug_03004370);
        gBattleTextBuff1[0] = EOS;
        StringAppend(gBattleTextBuff1, gSpeciesNames[gUnknown_Debug_2023A76[gUnknown_Debug_03004360][a]]);
        Text_InitWindow(
            &gUnknown_Debug_03004370,
            gBattleTextBuff1,
            gUnknown_Debug_821F424[a][0],
            gUnknown_Debug_821F424[a][1],
            gUnknown_Debug_821F424[a][2]);
        Text_PrintWindow8002F44(&gUnknown_Debug_03004370);
        break;
    case 1:
    case 6:
    case 11:
    case 16:
    case 21:
    case 26:
    case 30:
        ConvertIntToDecimalStringN(gBattleTextBuff1, gUnknown_Debug_2023A76[gUnknown_Debug_03004360][a], 2, 3);
        Text_InitWindow(
            &gUnknown_Debug_03004370,
            gBattleTextBuff1,
            gUnknown_Debug_821F424[a][0],
            gUnknown_Debug_821F424[a][1],
            gUnknown_Debug_821F424[a][2]);
        Text_PrintWindow8002F44(&gUnknown_Debug_03004370);
        break;
    case 2:
    case 7:
    case 12:
    case 17:
    case 22:
    case 27:
        debug_sub_8010A7C(0, 24);
        Text_InitWindow(
            &gUnknown_Debug_03004370,
            gBattleTextBuff1,
            gUnknown_Debug_821F424[a][0],
            gUnknown_Debug_821F424[a][1],
            gUnknown_Debug_821F424[a][2]);
        Text_PrintWindow8002F44(&gUnknown_Debug_03004370);
        ConvertIntToDecimalStringN(gBattleTextBuff1, gUnknown_Debug_2023A76[gUnknown_Debug_03004360][a], 2, 3);
        Text_InitWindow(
            &gUnknown_Debug_03004370,
            gBattleTextBuff1,
            422,
            gUnknown_Debug_03004360 * 32 + 25,
            0);
        Text_PrintWindow8002F44(&gUnknown_Debug_03004370);
        gBattleTextBuff1[0] = EOS;
        if (gUnknown_Debug_2023A76[gUnknown_Debug_03004360][a] != 0)
            StringAppend(gBattleTextBuff1, ItemId_GetName(gUnknown_Debug_2023A76[gUnknown_Debug_03004360][a]));
        else
            StringAppend(gBattleTextBuff1, Str_821F624);
        Text_InitWindow(
            &gUnknown_Debug_03004370,
            gBattleTextBuff1,
            gUnknown_Debug_821F424[a][0],
            gUnknown_Debug_821F424[a][1],
            gUnknown_Debug_821F424[a][2]);
        Text_PrintWindow8002F44(&gUnknown_Debug_03004370);
        break;
    case 4:
    case 9:
    case 14:
    case 19:
    case 24:
    case 29:
        debug_sub_8010A7C(0, 4);
        Text_InitWindow(
            &gUnknown_Debug_03004370,
            gBattleTextBuff1,
            gUnknown_Debug_821F424[a][0],
            gUnknown_Debug_821F424[a][1],
            gUnknown_Debug_821F424[a][2]);
        Text_PrintWindow8002F44(&gUnknown_Debug_03004370);
        length = 0;
        switch (gUnknown_Debug_2023A76[gUnknown_Debug_03004360][a])
        {
        case 0:
            gBattleTextBuff1[0] = CHAR_MALE;
            length = 1;
            break;
        case 1:
            gBattleTextBuff1[0] = CHAR_FEMALE;
            length = 1;
            break;
        case 2:
            gBattleTextBuff1[0] = CHAR_MALE;
            gBattleTextBuff1[1] = CHAR_MALE;
            length = 2;
            break;
        case 3:
            gBattleTextBuff1[0] = CHAR_FEMALE;
            gBattleTextBuff1[1] = CHAR_FEMALE;
            length = 2;
            break;
        default:
            gBattleTextBuff1[length] = CHAR_QUESTION_MARK;
            length++;
            break;
        }
        gBattleTextBuff1[length] = EOS;
        Text_InitWindow(
            &gUnknown_Debug_03004370,
            gBattleTextBuff1,
            gUnknown_Debug_821F424[a][0],
            gUnknown_Debug_821F424[a][1],
            gUnknown_Debug_821F424[a][2]);
        Text_PrintWindow8002F44(&gUnknown_Debug_03004370);
        break;
    case 3:
    case 8:
    case 13:
    case 18:
    case 23:
    case 28:
    default:
        ConvertIntToDecimalStringN(gBattleTextBuff1, gUnknown_Debug_2023A76[gUnknown_Debug_03004360][a], 2, 1);
        Text_InitWindow(
            &gUnknown_Debug_03004370,
            gBattleTextBuff1,
            gUnknown_Debug_821F424[a][0],
            gUnknown_Debug_821F424[a][1],
            gUnknown_Debug_821F424[a][2]);
        Text_PrintWindow8002F44(&gUnknown_Debug_03004370);
        break;
    case 31:
    case 32:
    case 33:
    case 34:
        break;
    }
}

void debug_sub_8012294(void)
{
    u8 r5 = gUnknown_Debug_030043A0 + gUnknown_Debug_030043A4 * 5;
    
    if (r5 < 30)
    {
        debug_sub_8010A7C(0, 24);
        Text_InitWindow(
            &gUnknown_Debug_03004370,
            gBattleTextBuff1,
            gUnknown_Debug_821F564[gUnknown_Debug_030043A8][0],
            gUnknown_Debug_821F564[gUnknown_Debug_030043A8][1],
            gUnknown_Debug_821F564[gUnknown_Debug_030043A8][2]);
        Text_PrintWindow8002F44(&gUnknown_Debug_03004370);
        ConvertIntToDecimalStringN(gBattleTextBuff1, gUnknown_Debug_2023B02[gUnknown_Debug_03004360][r5 / 5][gUnknown_Debug_030043A8], 2, 3);
        Text_InitWindow(
            &gUnknown_Debug_03004370,
            gBattleTextBuff1,
            422,
            gUnknown_Debug_03004360 * 32 + 25,
            0);
        Text_PrintWindow8002F44(&gUnknown_Debug_03004370);
        gBattleTextBuff1[0] = EOS;
        StringAppend(gBattleTextBuff1, gMoveNames[gUnknown_Debug_2023B02[gUnknown_Debug_03004360][r5 / 5][gUnknown_Debug_030043A8]]);
        Text_InitWindow(
            &gUnknown_Debug_03004370,
            gBattleTextBuff1,
            gUnknown_Debug_821F564[gUnknown_Debug_030043A8][0],
            gUnknown_Debug_821F564[gUnknown_Debug_030043A8][1],
            gUnknown_Debug_821F564[gUnknown_Debug_030043A8][2]);
        Text_PrintWindow8002F44(&gUnknown_Debug_03004370);
    }
}

extern const u16 gUnknown_Debug_821F58C[];

void debug_sub_80123D8(u8 a)
{
    if (a < 30)
    {
        debug_sub_8010A7C(0, 18);
        Text_InitWindow(
            &gUnknown_Debug_03004370,
            gBattleTextBuff1,
            gUnknown_Debug_821F58C[0],
            gUnknown_Debug_821F58C[1],
            gUnknown_Debug_821F58C[2]);
        Text_PrintWindow8002F44(&gUnknown_Debug_03004370);
        StringCopy(gBattleTextBuff1, gAbilityNames[gBaseStats[gUnknown_Debug_2023A76[gUnknown_Debug_03004360][a]].ability1]);
        Text_InitWindow(
            &gUnknown_Debug_03004370,
            gBattleTextBuff1,
            gUnknown_Debug_821F58C[0],
            gUnknown_Debug_821F58C[1],
            gUnknown_Debug_821F58C[2]);
        Text_PrintWindow8002F44(&gUnknown_Debug_03004370);
        debug_sub_8010A7C(0, 18);
        Text_InitWindow(
            &gUnknown_Debug_03004370,
            gBattleTextBuff1,
            gUnknown_Debug_821F58C[3],
            gUnknown_Debug_821F58C[4],
            gUnknown_Debug_821F58C[5]);
        Text_PrintWindow8002F44(&gUnknown_Debug_03004370);
        StringCopy(gBattleTextBuff1, gAbilityNames[gBaseStats[gUnknown_Debug_2023A76[gUnknown_Debug_03004360][a]].ability2]);
        Text_InitWindow(
            &gUnknown_Debug_03004370,
            gBattleTextBuff1,
            gUnknown_Debug_821F58C[3],
            gUnknown_Debug_821F58C[4],
            gUnknown_Debug_821F58C[5]);
        Text_PrintWindow8002F44(&gUnknown_Debug_03004370);
    }
    else
    {
        StringCopy(gBattleTextBuff1, gAbilityNames[0]);
        Text_InitWindow(
            &gUnknown_Debug_03004370,
            gBattleTextBuff1,
            gUnknown_Debug_821F58C[0],
            gUnknown_Debug_821F58C[1],
            gUnknown_Debug_821F58C[2]);
        Text_PrintWindow8002F44(&gUnknown_Debug_03004370);
        Text_InitWindow(
            &gUnknown_Debug_03004370,
            gBattleTextBuff1,
            gUnknown_Debug_821F58C[3],
            gUnknown_Debug_821F58C[4],
            gUnknown_Debug_821F58C[5]);
        Text_PrintWindow8002F44(&gUnknown_Debug_03004370);
    }
}

void debug_sub_8012540(void)
{
    ConvertIntToDecimalStringN(gBattleTextBuff1, gUnknown_Debug_2023A76[0][0x22], 0, 1);
    Text_InitWindow(
        &gUnknown_Debug_03004370,
        gBattleTextBuff1,
        gUnknown_Debug_821F424[31][0],
        gUnknown_Debug_821F424[31][1],
        gUnknown_Debug_821F424[31][2]);
    Text_PrintWindow8002F44(&gUnknown_Debug_03004370);
}

void debug_nullsub_3(void)
{
}

extern const u32 gUnknown_Debug_821F680[][0x23];

void debug_sub_80125A0(void)
{
    gSharedMem[gUnknown_Debug_821F680[gUnknown_Debug_03004360][gUnknown_Debug_030043A0 + gUnknown_Debug_030043A4 * 5]] = 0x6D;
}

void debug_sub_80125E4(void)
{
    gSharedMem[gUnknown_Debug_821F680[gUnknown_Debug_03004360][gUnknown_Debug_030043A0 + gUnknown_Debug_030043A4 * 5]] = 0x81;
}

void debug_sub_8012628(void)
{
	gSharedMem[gUnknown_Debug_821F798[gUnknown_Debug_03004360][gUnknown_Debug_030043A8]] = 0x6D;
}

void debug_sub_8012658(void)
{
	gSharedMem[gUnknown_Debug_821F798[gUnknown_Debug_03004360][gUnknown_Debug_030043A8]] = 0x81;
}

void debug_sub_8012688(void)
{
	s32 i;
	u8 spriteId;
	u8 taskId;

	for (i = 0; i < 411; i++)
		gUnknown_Debug_2023B62[i] = 0;
	SetHBlankCallback(NULL);
	SetVBlankCallback(NULL);
	DmaFill32(3, 0, (void *)VRAM, VRAM_SIZE);
	REG_MOSAIC = 0;
	REG_WIN0H = 0;
	REG_WIN0V = 0;
	REG_WIN1H = 0;
	REG_WIN1V = 0;
	REG_WININ = 0;
	REG_WINOUT = 0;
	Text_LoadWindowTemplate(&gWindowTemplate_81E6C58);
	ResetPaletteFade();
	gBattle_BG0_X = 0;
	gBattle_BG0_Y = DISPLAY_HEIGHT;
	gBattle_BG1_X = 0;
	gBattle_BG1_Y = 0;
	gBattle_BG2_X = 0;
	gBattle_BG2_Y = 0;
	gBattle_BG3_X = 0;
	gBattle_BG3_Y = 0;
	gBattleTerrain = 9;
	sub_800D6D4();
	LoadBattleTextboxAndBackground();
	ResetSpriteData();
	ResetTasks();
	FreeAllSpritePalettes();
	gReservedSpritePaletteCount = 4;
	gCurrentMove = 1;
	Text_InitWindowWithTemplate(&gUnknown_03004210, &gWindowTemplate_81E6C58);
	DecompressPicFromTable_2(
	  &gMonFrontPicTable[gCurrentMove],
	  gMonFrontPicCoords[gCurrentMove].coords,
	  gMonFrontPicCoords[gCurrentMove].y_offset,
	  (void *)0x02000000,
	  gUnknown_081FAF4C[1],
	  gCurrentMove);
	LoadCompressedPalette(gMonPaletteTable[gCurrentMove].data, 272, 32);
	GetMonSpriteTemplate_803C56C(gCurrentMove, 1);
	spriteId = CreateSprite(&gUnknown_02024E8C, 176, 40 + gMonFrontPicCoords[gCurrentMove].y_offset, 40);
	gSprites[spriteId].callback = nullsub_37;
	gSprites[spriteId].oam.paletteNum = 1;
	REG_DISPCNT = 0x1F40;
	SetHBlankCallback(debug_nullsub_45);
	SetVBlankCallback(debug_sub_8011DD4);
	m4aMPlayAllStop();
	taskId = CreateTask(debug_sub_8012D10, 0);
	gTasks[taskId].data[0] = 0;
	gTasks[taskId].data[1] = spriteId;
	SetMainCallback2(debug_sub_8012878);
}

void debug_sub_8012878(void)
{
	AnimateSprites();
	BuildOamBuffer();
	Text_UpdateWindowInBattle(&gUnknown_03004210);
	UpdatePaletteFade();
	RunTasks();
	if (gMain.heldKeys == (SELECT_BUTTON | R_BUTTON))
		SetMainCallback2(debug_sub_80108B8);
}

void debug_sub_80128B4(void)
{
    debug_sub_8010A7C(0, 9);
    Text_InitWindow(&gUnknown_03004210, gBattleTextBuff1, 144, 2, 35);
    Text_PrintWindow8002F44(&gUnknown_03004210);
    ConvertIntToDecimalStringN(gBattleTextBuff1, gCurrentMove, 2, 3);
    gBattleTextBuff1[3] = CHAR_SPACE;
    gBattleTextBuff1[4] = EOS;
    StringAppend(gBattleTextBuff1, gSpeciesNames[gCurrentMove]);
    Text_InitWindow(&gUnknown_03004210, gBattleTextBuff1, 144, 2, 35);
    Text_PrintWindow8002F44(&gUnknown_03004210);
}

void debug_sub_8012938(u8 taskId)
{
    debug_sub_8010A7C(0, 7);
    Text_InitWindow(&gUnknown_03004210, gBattleTextBuff1, 162, 2, 37);
    Text_PrintWindow8002F44(&gUnknown_03004210);
    StringCopy(gBattleTextBuff1, Str_821F7B8);
    ConvertIntToDecimalStringN(gBattleTextBuff1 + 4, gUnknown_Debug_2023B62[gCurrentMove - 1], 2, 3);
    Text_InitWindow(&gUnknown_03004210, gBattleTextBuff1, 162, 2, 37);
    Text_PrintWindow8002F44(&gUnknown_03004210);
    gSprites[gTasks[taskId].data[1]].pos2.y = -gUnknown_Debug_2023B62[gCurrentMove - 1];
}

void debug_sub_80129F8(u8 taskId)
{
    DecompressPicFromTable_2(
      &gMonFrontPicTable[gCurrentMove],
      gMonFrontPicCoords[gCurrentMove].coords,
      gMonFrontPicCoords[gCurrentMove].y_offset,
      (void *)0x02000000,
      gUnknown_081FAF4C[1],
      gCurrentMove);
    LoadCompressedPalette(gMonPaletteTable[gCurrentMove].data, 272, 32);
    gSprites[gTasks[taskId].data[1]].pos1.y = gMonFrontPicCoords[gCurrentMove].y_offset + 40;
    gSprites[gTasks[taskId].data[1]].pos2.y = -gUnknown_Debug_2023B62[gCurrentMove - 1];
    StartSpriteAnim(&gSprites[gTasks[taskId].data[1]], 0);
}

void debug_sub_8012AC0(s8 a, u8 taskId)
{
    do
    {
        gCurrentMove += a;
        if (gCurrentMove == 0)
            gCurrentMove = 411;
        if (gCurrentMove == 411)
            gCurrentMove = 1;
    } while (gBaseStats[gCurrentMove].type1 != 2 && gBaseStats[gCurrentMove].type2 != 2);
    debug_sub_80128B4();
    debug_sub_8012938(taskId);
    debug_sub_80129F8(taskId);
}

void debug_sub_8012B2C(u8 a)
{
    *(u16 *)(VRAM + 0xC000 + 0x772 + (a * 4 + 0) * 0x20) = 1;
    *(u16 *)(VRAM + 0xC000 + 0x772 + (a * 4 + 2) * 0x20) = 2;
}

void debug_sub_8012B4C(u8 a)
{
    *(u16 *)(VRAM + 0xC000 + 0x772 + (a * 4 + 0) * 0x20) = 0x1016;
    *(u16 *)(VRAM + 0xC000 + 0x772 + (a * 4 + 2) * 0x20) = 0x1016;
}

void debug_sub_8012B70(u8 taskId, u8 b)
{
    if (b != 0)
    {
        sub_802BBD4(24, 28, 29, 33, 1);
        debug_sub_80128B4();
        debug_sub_8012938(taskId);
        debug_sub_80129F8(taskId);
        gTasks[taskId].data[0] = 1;
    }
    else
    {
        sub_802BBD4(24, 28, 29, 33, 0);
        gTasks[taskId].data[0] = 2;
        Text_InitWindow(&gUnknown_03004210, Str_821F7DA, 656, 26, 29);
        Text_PrintWindow8002F44(&gUnknown_03004210);
        gTasks[taskId].data[3] = 0;
        debug_sub_8012B2C(0);
    }
}

void debug_sub_8012C08(u8 taskId, u8 b)
{
    debug_sub_8010A7C(0, 9);
    Text_InitWindow(&gUnknown_03004210, gBattleTextBuff1, 144, 2, 35);
    Text_PrintWindow8002F44(&gUnknown_03004210);
    debug_sub_8010A7C(0, 7);
    Text_InitWindow(&gUnknown_03004210, gBattleTextBuff1, 162, 2, 37);
    Text_PrintWindow8002F44(&gUnknown_03004210);
    sub_802BBD4(24, 28, 29, 33, 0);
    if (b != 0)
    {
        gTasks[taskId].data[0] = 4;
        Text_InitWindow(&gUnknown_03004210, gUnknown_Debug_821F7F3, 144, 2, 35);
    }
    else
    {
        gTasks[taskId].data[0] = 3;
        Text_InitWindow(&gUnknown_03004210, Str_821F7EA, 144, 2, 35);
    }
    Text_PrintWindow8002F44(&gUnknown_03004210);
    Text_InitWindow(&gUnknown_03004210, BattleText_YesNo, 656, 26, 29);
    Text_PrintWindow8002F44(&gUnknown_03004210);
    gTasks[taskId].data[3] = 1;
    debug_sub_8012B2C(1);
}

void debug_sub_8012D10(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
    case 0:
        debug_sub_80128B4();
        debug_sub_8012938(taskId);
        Text_InitWindow(&gUnknown_03004210, Str_821F7BD, 400, 19, 35);
        Text_PrintWindow8002F44(&gUnknown_03004210);
        gTasks[taskId].data[0]++;
        sub_802E3E4(gTasks[taskId].data[2], 0);
        break;
    case 1:
        if (gMain.newKeys & DPAD_UP)
        {
            PlaySE(SE_SELECT);
            nullsub_8(gTasks[taskId].data[2]);
            gTasks[taskId].data[2] &= ~2;
            sub_802E3E4(gTasks[taskId].data[2], 0);
        }
        else if (gMain.newKeys & DPAD_DOWN)
        {
            PlaySE(SE_SELECT);
            nullsub_8(gTasks[taskId].data[2]);
            gTasks[taskId].data[2] |= 2;
            sub_802E3E4(gTasks[taskId].data[2], 0);
        }
        else if (gMain.newKeys & DPAD_LEFT)
        {
            PlaySE(SE_SELECT);
            nullsub_8(gTasks[taskId].data[2]);
            gTasks[taskId].data[2] &= ~1;
            sub_802E3E4(gTasks[taskId].data[2], 0);
        }
        else if (gMain.newKeys & DPAD_RIGHT)
        {
            PlaySE(SE_SELECT);
            nullsub_8(gTasks[taskId].data[2]);
            gTasks[taskId].data[2] |= 1;
            sub_802E3E4(gTasks[taskId].data[2], 0);
        }
        else if (gMain.newAndRepeatedKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            switch (gTasks[taskId].data[2])
            {
            case 0:
                if (gUnknown_Debug_2023B62[gCurrentMove - 1] < 64)
                {
                    gUnknown_Debug_2023B62[gCurrentMove - 1] += 1;
                    debug_sub_8012938(taskId);
                }
                break;
            case 1:
                debug_sub_8012AC0(1, taskId);
                break;
            case 2:
                if (gCurrentMove < 411)
                    gCurrentMove++;
                else
                    gCurrentMove = 1;
                debug_sub_80128B4();
                debug_sub_8012938(taskId);
                debug_sub_80129F8(taskId);
                break;
            case 3:
                debug_sub_8012B70(taskId, 0);
                break;
            }
        }
        else if (gMain.newAndRepeatedKeys & B_BUTTON)
        {
            PlaySE(SE_SELECT);
            switch (gTasks[taskId].data[2])
            {
            case 0:
                if (gUnknown_Debug_2023B62[gCurrentMove - 1] > 0)
                {
                    gUnknown_Debug_2023B62[gCurrentMove - 1] -= 1;
                    debug_sub_8012938(taskId);
                }
                break;
            case 1:
                debug_sub_8012AC0(-1, taskId);
                break;
            case 2:
                if (gCurrentMove > 1)
                    gCurrentMove--;
                else
                    gCurrentMove = 411;
                debug_sub_80128B4();
                debug_sub_8012938(taskId);
                debug_sub_80129F8(taskId);
                break;
            case 3:
                debug_sub_8012B70(taskId, 0);
                break;
            }
        }
        else if (gMain.newAndRepeatedKeys & R_BUTTON)
        {
            PlaySE(SE_SELECT);
            switch (gTasks[taskId].data[2])
            {
            case 0:
                if (gUnknown_Debug_2023B62[gCurrentMove - 1] < 64)
                {
                    gUnknown_Debug_2023B62[gCurrentMove - 1] += 8;
                    if (gUnknown_Debug_2023B62[gCurrentMove - 1] > 64)
                        gUnknown_Debug_2023B62[gCurrentMove - 1] = 64;
                    debug_sub_8012938(taskId);
                }
                break;
            case 1:
                debug_sub_8012AC0(1, taskId);
                break;
            case 2:
                if (gCurrentMove + 10 < 412)
                    gCurrentMove += 10;
                else
                    gCurrentMove -= 400;
                debug_sub_80128B4();
                debug_sub_8012938(taskId);
                debug_sub_80129F8(taskId);
                break;
            case 3:
                debug_sub_8012B70(taskId, 0);
                break;
            }
        }
        else if (gMain.newAndRepeatedKeys & L_BUTTON)
        {
            PlaySE(SE_SELECT);
            switch (gTasks[taskId].data[2])
            {
            case 0:
                if (gUnknown_Debug_2023B62[gCurrentMove - 1] > 0)
                {
                    if (gUnknown_Debug_2023B62[gCurrentMove - 1] > 8)
                        gUnknown_Debug_2023B62[gCurrentMove - 1] -= 8;
                    else
                        gUnknown_Debug_2023B62[gCurrentMove - 1] = 0;
                    debug_sub_8012938(taskId);
                }
                break;
            case 1:
                debug_sub_8012AC0(-1, taskId);
                break;
            case 2:
                if (gCurrentMove - 10 > 1)
                    gCurrentMove -= 10;
                else
                    gCurrentMove += 400;
                debug_sub_80128B4();
                debug_sub_8012938(taskId);
                debug_sub_80129F8(taskId);
                break;
            case 3:
                debug_sub_8012B70(taskId, 0);
                break;
            }
        }
        break;
    case 2:
        if (gMain.newKeys & DPAD_UP)
        {
            PlaySE(SE_SELECT);
            debug_sub_8012B4C(gTasks[taskId].data[3]);
            gTasks[taskId].data[3] = 0;
            debug_sub_8012B2C(0);
        }
        else if (gMain.newKeys & DPAD_DOWN)
        {
            PlaySE(SE_SELECT);
            debug_sub_8012B4C(gTasks[taskId].data[3]);
            gTasks[taskId].data[3] = 1;
            debug_sub_8012B2C(1);
        }
        else if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            debug_sub_8012C08(taskId, gTasks[taskId].data[3]);
        }
        else if (gMain.newKeys & B_BUTTON)
        {
            PlaySE(SE_SELECT);
            asm("");
            debug_sub_8012B70(taskId, 1);
        }
        return;
    case 3:
        if (gMain.newKeys & DPAD_UP)
        {
            PlaySE(SE_SELECT);
            debug_sub_8012B4C(gTasks[taskId].data[3]);
            gTasks[taskId].data[3] = 0;
            debug_sub_8012B2C(0);
        }
        else if (gMain.newKeys & DPAD_DOWN)
        {
            PlaySE(SE_SELECT);
            debug_sub_8012B4C(gTasks[taskId].data[3]);
            gTasks[taskId].data[3] = 1;
            debug_sub_8012B2C(1);
        }
        else if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            if (gTasks[taskId].data[3] == 0)
                debug_sub_80132C8(31, gUnknown_Debug_2023B62, 411);
            debug_sub_8012B70(taskId, 1);
        }
        else if (gMain.newKeys & B_BUTTON)
        {
            PlaySE(SE_SELECT);
            debug_sub_8012B70(taskId, 1);
        }
        break;
    case 4:
        if (gMain.newKeys & DPAD_UP)
        {
            PlaySE(SE_SELECT);
            debug_sub_8012B4C(gTasks[taskId].data[3]);
            gTasks[taskId].data[3] = 0;
            debug_sub_8012B2C(0);
        }
        else if (gMain.newKeys & DPAD_DOWN)
        {
            PlaySE(SE_SELECT);
            debug_sub_8012B4C(gTasks[taskId].data[3]);
            gTasks[taskId].data[3] = 1;
            debug_sub_8012B2C(1);
        }
        else if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            if (gTasks[taskId].data[3] == 0)
                debug_sub_8013294(31, gUnknown_Debug_2023B62, 411);
            debug_sub_8012B70(taskId, 1);
        }
        else if (gMain.newKeys & B_BUTTON)
        {
            PlaySE(SE_SELECT);
            debug_sub_8012B70(taskId, 1);
        }
        break;
    }
}

u8 debug_sub_8013240(void)
{
    if (IdentifyFlash() == 0)
        return 0;
    else
        return 1;
}

u32 debug_sub_8013258(u16 sectorNum, u8 *data, u32 size)
{
    while (1)
    {
        if (ProgramFlashSectorAndVerify(sectorNum, data) != 0)
            return 0;
        if (size <= 0x1000)
            break;
        size -= 0x1000;
        data += 0x1000;
        sectorNum++;
    }
    return 1;
}

u32 debug_sub_8013294(u8 sectorNum, void *data, u32 size)
{
    u32 result;

    if (debug_sub_8013240() != 0)
        return 0;
    m4aSoundVSyncOff();
    result = debug_sub_8013258(sectorNum, data, size);
    m4aSoundVSyncOn();
    return result;
}

void debug_sub_80132C8(u8 a, void *b, u32 c)
{
    if (debug_sub_8013240() == 0)
        ReadFlash(a, 0, b, c);
}
#endif

void oac_poke_opponent(struct Sprite *sprite)
{
    sprite->callback = sub_8010278;
    StartSpriteAnimIfDifferent(sprite, 0);
    BeginNormalPaletteFade(0x00020000, 0, 10, 10, RGB(15, 15, 15));
}

void sub_8010278(struct Sprite *sprite)
{
    if ((gUnknown_02024DE8 & 1) == 0)
    {
        sprite->pos2.x += 2;
        if (sprite->pos2.x == 0)
        {
            sprite->callback = sub_80102AC;
            PlayCry1(sprite->data[2], 25);
        }
    }
}

void sub_80102AC(struct Sprite *sprite)
{
    if (sprite->animEnded)
    {
        sub_804777C(sprite->data[0]);
        sub_8043DFC(gHealthboxIDs[sprite->data[0]]);
        sprite->callback = nullsub_37;
        StartSpriteAnimIfDifferent(sprite, 0);
        BeginNormalPaletteFade(0x00020000, 0, 10, 0, RGB(15, 15, 15));
    }
}

void nullsub_37(struct Sprite *sprite)
{
}

void unref_sub_801030C(struct Sprite *sprite)
{
    sprite->data[3] = 6;
    sprite->data[4] = 1;
    sprite->callback = sub_8010320;
}

void sub_8010320(struct Sprite *sprite)
{
    sprite->data[4]--;
    if (sprite->data[4] == 0)
    {
        sprite->data[4] = 8;
        sprite->invisible ^= 1;
        sprite->data[3]--;
        if (sprite->data[3] == 0)
        {
            sprite->invisible = FALSE;
            sprite->callback = nullsub_37;
            gUnknown_03004284 = 0;
        }
    }
}

void sub_8010384(struct Sprite *sprite)
{
    u8 r6 = sprite->data[0];
    u16 species;
    u8 yOffset;

    if (ewram17800[r6].transformedSpecies != 0)
        species = ewram17800[r6].transformedSpecies;
    else
        species = sprite->data[2];

    GetMonData(&gEnemyParty[gBattlerPartyIndexes[r6]], MON_DATA_PERSONALITY);  // Unused return value

    if (species == SPECIES_UNOWN)
    {
        u32 personalityValue = GetMonData(&gEnemyParty[gBattlerPartyIndexes[r6]], MON_DATA_PERSONALITY);
        u16 unownForm = ((((personalityValue & 0x3000000) >> 18) | ((personalityValue & 0x30000) >> 12) | ((personalityValue & 0x300) >> 6) | (personalityValue & 3)) % 0x1C);
        u16 unownSpecies;

        if (unownForm == 0)
            unownSpecies = SPECIES_UNOWN;  // Use the A Unown form
        else
            unownSpecies = NUM_SPECIES + unownForm;  // Use one of the other Unown letters

        yOffset = gMonFrontPicCoords[unownSpecies].y_offset;
    }
    else if (species == SPECIES_CASTFORM)
    {
        yOffset = gCastformFrontSpriteCoords[gBattleMonForms[r6]].y_offset;
    }
    else if (species > NUM_SPECIES)
    {
        yOffset = gMonFrontPicCoords[SPECIES_NONE].y_offset;
    }
    else
    {
        yOffset = gMonFrontPicCoords[species].y_offset;
    }

    sprite->data[3] = 8 - yOffset / 8;
    sprite->data[4] = 1;
    sprite->callback = sub_8010494;
}

void sub_8010494(struct Sprite *sprite)
{
    s32 i;
    u8 *dst;

    sprite->data[4]--;
    if (sprite->data[4] == 0)
    {
        sprite->data[4] = 2;
        sprite->pos2.y += 8;
        sprite->data[3]--;
        if (sprite->data[3] < 0)
        {
            FreeSpriteOamMatrix(sprite);
            DestroySprite(sprite);
        }
        else
        {
            // this should use a MEMSET_ALT, but *(dst++) wont match with it.
            dst = (u8 *)gUnknown_081FAF4C[GetBattlerPosition(sprite->data[0])] + (gBattleMonForms[sprite->data[0]] << 11) + (sprite->data[3] << 8);
            for (i = 0; i < 0x100; i++)
                *(dst++) = 0;
            StartSpriteAnim(sprite, gBattleMonForms[sprite->data[0]]);
        }
    }
}

void sub_8010520(struct Sprite *sprite)
{
    sprite->data[3] = 8;
    sprite->data[4] = sprite->invisible;
    sprite->callback = sub_801053C;
}

void sub_801053C(struct Sprite *sprite)
{
    sprite->data[3]--;
    if (sprite->data[3] == 0)
    {
        sprite->invisible ^= 1;
        sprite->data[3] = 8;
    }
}

void sub_8010574(struct Sprite *sprite)
{
    sprite->invisible = sprite->data[4];
    sprite->data[4] = FALSE;
    sprite->callback = nullsub_37;
}

void sub_80105A0(struct Sprite *sprite)
{
    sprite->callback = oac_poke_ally_;
}

void oac_poke_ally_(struct Sprite *sprite)
{
    if ((gUnknown_02024DE8 & 1) == 0)
    {
        sprite->pos2.x -= 2;
        if (sprite->pos2.x == 0)
        {
            sprite->callback = nullsub_86;
            sprite->data[1] = 0;
        }
    }
}

void sub_80105DC(struct Sprite *sprite)
{
    sprite->callback = nullsub_86;
}

void nullsub_86(struct Sprite *sprite)
{
}

void sub_80105EC(struct Sprite *sprite)
{
    if ((gUnknown_02024DE8 & 1) == 0)
    {
        sprite->pos2.x += sprite->data[1];
        sprite->pos2.y += sprite->data[2];
    }
}

void dp11b_obj_instanciate(u8 bank, u8 b, s8 c, s8 d)
{
    u8 spriteId;
    u8 objectID;

    if (b)
    {
        if (ewram17810[bank].unk0_1)
            return;
    }
    else
    {
        if (ewram17810[bank].unk0_2)
            return;
    }

    spriteId = CreateInvisibleSpriteWithCallback(objc_dp11b_pingpong);
    if (b == TRUE)
    {
        objectID = gHealthboxIDs[bank];
        ewram17810[bank].unk2 = spriteId;
        ewram17810[bank].unk0_1 = 1;
        gSprites[spriteId].data[0] = 0x80;
    }
    else
    {
        objectID = gBankSpriteIds[bank];
        ewram17810[bank].unk3 = spriteId;
        ewram17810[bank].unk0_2 = 1;
        gSprites[spriteId].data[0] = 0xC0;
    }
    gSprites[spriteId].data[1] = c;
    gSprites[spriteId].data[2] = d;
    gSprites[spriteId].data[3] = objectID;
    gSprites[spriteId].data[4] = b;
    gSprites[objectID].pos2.x = 0;
    gSprites[objectID].pos2.y = 0;
}

void dp11b_obj_free(u8 a, u8 b)
{
    u8 r4;

    if (b == TRUE)
    {
        if (!ewram17810[a].unk0_1)
            return;
        r4 = gSprites[ewram17810[a].unk2].data[3];
        DestroySprite(&gSprites[ewram17810[a].unk2]);
        ewram17810[a].unk0_1 = 0;
    }
    else
    {
        if (!ewram17810[a].unk0_2)
            return;
        r4 = gSprites[ewram17810[a].unk3].data[3];
        DestroySprite(&gSprites[ewram17810[a].unk3]);
        ewram17810[a].unk0_2 = 0;
    }
    gSprites[r4].pos2.x = 0;
    gSprites[r4].pos2.y = 0;
}

void objc_dp11b_pingpong(struct Sprite *sprite)
{
    u8 spriteId = sprite->data[3];
    s32 var;

    if (sprite->data[4] == 1)
        var = sprite->data[0];
    else
        var = sprite->data[0];

    gSprites[spriteId].pos2.y = Sin(var, sprite->data[2]) + sprite->data[2];
    sprite->data[0] = (sprite->data[0] + sprite->data[1]) & 0xFF;
}

void nullsub_41(void)
{
}

void sub_8010800(void)
{
    sub_8010874();
    gBattleCommunication[1] = 0;
    gBattleMainFunc = bc_8012FAC;
}

#if DEBUG
void debug_sub_80138CC(void)
{
    if (GetBattlerSide(gActiveBattler) == 0)
    {
        switch (gSharedMem[0x160FD])
        {
        case 0:
            if (gBattleBankFunc[gActiveBattler] == sub_802C098)
                gSharedMem[0x160FD]++;
            break;
        case 1:
            gMain.heldKeys = A_BUTTON;
            gMain.newKeys = A_BUTTON;
            gSharedMem[0x160FD]++;
            gSharedMem[0x160FE] = 0x80;
            break;
        case 2:
            gSharedMem[0x160FE]--;
            if (gSharedMem[0x160FE] == 0)
            {
                gMain.heldKeys = A_BUTTON;
                gMain.newKeys = A_BUTTON;
                gSharedMem[0x160FD]++;
                gSharedMem[0x160FE] = 0x80;
            }
            break;
        case 3:
            gSharedMem[0x160FE]--;
            if (gSharedMem[0x160FE] == 0)
            {
                gMain.heldKeys = A_BUTTON;
                gMain.newKeys = A_BUTTON;
                gSharedMem[0x160FD]++;
            }
            break;
        case 4:
            gSharedMem[0x160FD] = 0;
            break;
        }
    }
}
#endif

void sub_8010824(void)
{
#if DEBUG
    if (gUnknown_02023A14_50 & 0x80)
    {
        for (gActiveBattler = 0; gActiveBattler < gBattlersCount; gActiveBattler++)
            debug_sub_80138CC();
        gBattleMainFunc();
        for (gActiveBattler = 0; gActiveBattler < gBattlersCount; gActiveBattler++)
            gBattleBankFunc[gActiveBattler]();
    }
    else
#endif
    {
        gBattleMainFunc();
        for (gActiveBattler = 0; gActiveBattler < gBattlersCount; gActiveBattler++)
            gBattleBankFunc[gActiveBattler]();
    }
}

void sub_8010874(void)
{
    s32 i;
    u32 j;
    u8 *r4;

    TurnValuesCleanUp(0);
    SpecialStatusesClear();

    for (i = 0; i < 4; i++)
    {
        gStatuses3[i] = 0;

        MEMSET_ALT(&gDisableStructs[i], 0, 0x1C, j, r4);
        gDisableStructs[i].isFirstTurn= 2;
        gUnknown_02024C70[i] = 0;
        gLastUsedMove[i] = 0;
        gLastLandedMoves[i] = 0;
        gLastHitByType[i] = 0;
        gUnknown_02024C4C[i] = 0;
        gLastHitBy[i] = 0xFF;
        gLockedMoves[i] = 0;
        gUnknown_02024C2C[i] = 0;
        eFlashFireArr.arr[i] = 0;
    }

    for (i = 0; i < 2; i++)
    {
        gSideAffecting[i] = 0;
        MEMSET_ALT(&gSideTimers[i], 0, 12, j, r4);
    }

    gBankAttacker = 0;
    gBankTarget = 0;
    gBattleWeather = 0;

    MEMSET_ALT(&gWishFutureKnock, 0, 0x2C, i, r4);

    gHitMarker = 0;
    if ((gBattleTypeFlags & BATTLE_TYPE_LINK) == 0 && gSaveBlock2.optionsBattleSceneOff == TRUE)
        gHitMarker = HITMARKER_NO_ANIMATIONS;
    ewram16084 = gSaveBlock2.optionsBattleStyle;
    gMultiHitCounter = 0;
    gBattleOutcome = 0;
    gBattleExecBuffer = 0;
    gPaydayMoney = 0;
    ewram17130 = 0;
    ewram17160 = 0;
    for (i = 0; i < 8; i++)
        gBattleCommunication[i] = 0;
    gPauseCounterBattle = 0;
    gBattleMoveDamage = 0;
    gUnknown_02024DE8 = 0;
    ewram16002 = 0;
    ewram160A1 = 0;
    gLeveledUpInBattle = 0;
    gAbsentBattlerFlags = 0;
    ewram16078 = 0;
    ewram16086 = 0;
    ewram16087 = 0;
    ewram16089 = gBaseStats[GetMonData(&gEnemyParty[0], MON_DATA_SPECIES)].catchRate * 100 / 1275;
    ewram16088 = 3;
    ewram1601B = 0;
    ewram16056 = 1;

    for (i = 0; i < 8; i++)
    {
        ewram160ACarr(i) = 0;
        ewram160CCarr(i) = 0;
        ewram160E8arr(i) = 0;
        ewram160F0arr(i) = 0;
        ewram16100arr(i) = 0;
        ewram16108arr(i) = 0;
    }

    ewram160C8 = 6;
    ewram160C9 = 6;
    ewram16113 = 0;
    for (i = 0; i < 11; i++)
        gBattleResults.usedBalls[i] = 0;
    gBattleResults.battleTurnCounter = 0;
    gBattleResults.playerFaintCounter = 0;
    gBattleResults.opponentFaintCounter = 0;
    gBattleResults.unk2 = 0;
    gBattleResults.unk3 = 0;
    gBattleResults.unk4 = 0;
    gBattleResults.unk5_0 = 0;
    gBattleResults.unk5_1 = 0;
    gBattleResults.lastOpponentSpecies = 0;
    gBattleResults.lastUsedMove = 0;
    gBattleResults.opponentMove = 0;
    gBattleResults.poke1Species = 0;
    gBattleResults.opponentSpecies = 0;
    gBattleResults.caughtPoke = 0;
    for (i = 0; i < 10; i++)
    {
        gBattleResults.pokeString1[i] = 0;
        gBattleResults.pokeString2[i] = 0;
        gBattleResults.caughtNick[i] = 0;
    }
#if DEBUG
    gSharedMem[0x1609E] = 0;
    gSharedMem[0x1609F] = 0;
#endif
}

void SwitchInClearSetData(void)
{
    struct DisableStruct sp0 = gDisableStructs[gActiveBattler];
    s32 i;
    u8 *ptr;

    if (gBattleMoves[gCurrentMove].effect != EFFECT_BATON_PASS)
    {
        for (i = 0; i < 8; i++)
            gBattleMons[gActiveBattler].statStages[i] = 6;
        for (i = 0; i < gBattlersCount; i++)
        {
            struct UnknownStruct12 *sp20 = &gUnknown_02024AD0[i];

            if ((sp20->unk0 & 0x04000000) && gDisableStructs[i].bankPreventingEscape == gActiveBattler)
                sp20->unk0 &= ~0x04000000;
            if ((gStatuses3[i] & STATUS3_ALWAYS_HITS) && gDisableStructs[i].bankWithSureHit == gActiveBattler)
            {
                gStatuses3[i] &= ~STATUS3_ALWAYS_HITS;
                gDisableStructs[i].bankWithSureHit = 0;
            }
        }
    }
    if (gBattleMoves[gCurrentMove].effect == EFFECT_BATON_PASS)
    {
        gBattleMons[gActiveBattler].status2 &= (STATUS2_CONFUSION | STATUS2_FOCUS_ENERGY | STATUS2_SUBSTITUTE | STATUS2_ESCAPE_PREVENTION | STATUS2_CURSED);
        gStatuses3[gActiveBattler] &= (STATUS3_LEECHSEED_BANK | STATUS3_LEECHSEED | STATUS3_ALWAYS_HITS | STATUS3_PERISH_SONG | STATUS3_ROOTED | STATUS3_MUDSPORT | STATUS3_WATERSPORT);

        for (i = 0; i < gBattlersCount; i++)
        {
            if (GetBattlerSide(gActiveBattler) != GetBattlerSide(i)
             && (gStatuses3[i] & STATUS3_ALWAYS_HITS) != 0
             && (gDisableStructs[i].bankWithSureHit == gActiveBattler))
            {
                gStatuses3[i] &= ~STATUS3_ALWAYS_HITS;
                gStatuses3[i] |= 0x10;
            }
        }
    }
    else
    {
        gBattleMons[gActiveBattler].status2 = 0;
        gStatuses3[gActiveBattler] = 0;
    }

    for (i = 0; i < gBattlersCount; i++)
    {
        if (gUnknown_02024AD0[i].unk0 & (gBitTable[gActiveBattler] << 16))
            gUnknown_02024AD0[i].unk0 &= ~(gBitTable[gActiveBattler] << 16);
        if ((gUnknown_02024AD0[i].unk0 & 0xE000) && ewram16020arr(i) == gActiveBattler)
            gUnknown_02024AD0[i].unk0 &= ~0xE000;
    }

    gActionSelectionCursor[gActiveBattler] = 0;
    gMoveSelectionCursor[gActiveBattler] = 0;

    MEMSET_ALT(&gDisableStructs[gActiveBattler], 0, 0x1C, i, ptr);

    if (gBattleMoves[gCurrentMove].effect == EFFECT_BATON_PASS)
    {
        gDisableStructs[gActiveBattler].substituteHP = sp0.substituteHP;
        gDisableStructs[gActiveBattler].bankWithSureHit = sp0.bankWithSureHit;
        gDisableStructs[gActiveBattler].perishSongTimer1 = sp0.perishSongTimer1;
        gDisableStructs[gActiveBattler].perishSongTimer2 = sp0.perishSongTimer2;
    }

    gDisableStructs[gActiveBattler].isFirstTurn= 2;
    gLastUsedMove[gActiveBattler] = 0;
    gLastLandedMoves[gActiveBattler] = 0;
    gLastHitByType[gActiveBattler] = 0;
    gUnknown_02024C4C[gActiveBattler] = 0;
    gUnknown_02024C2C[gActiveBattler] = 0;
    gLastHitBy[gActiveBattler] = 0xFF;

    ewram160ACarr2(0, gActiveBattler) = 0;
    ewram160ACarr2(1, gActiveBattler) = 0;
    ewram16100arr2(0, gActiveBattler) = 0;
    ewram16100arr2(1, gActiveBattler) = 0;
    ewram16100arr2(2, gActiveBattler) = 0;
    ewram16100arr2(3, gActiveBattler) = 0;
    ewram160E8arr2(0, gActiveBattler) = 0;
    ewram160E8arr2(1, gActiveBattler) = 0;

    eFlashFireArr.arr[gActiveBattler] = 0;

    gCurrentMove = 0;
}

void UndoEffectsAfterFainting(void)
{
    s32 i;
    u8 *ptr;

    for (i = 0; i < 8; i++)
        gBattleMons[gActiveBattler].statStages[i] = 6;
    gBattleMons[gActiveBattler].status2 = 0;
    gStatuses3[gActiveBattler] = 0;
    for (i = 0; i < gBattlersCount; i++)
    {
        if ((gBattleMons[i].status2 & STATUS2_ESCAPE_PREVENTION) && gDisableStructs[i].bankPreventingEscape == gActiveBattler)
            gBattleMons[i].status2 &= ~STATUS2_ESCAPE_PREVENTION;
        if (gBattleMons[i].status2 & (gBitTable[gActiveBattler] << 16))
            gBattleMons[i].status2 &= ~(gBitTable[gActiveBattler] << 16);
        if ((gBattleMons[i].status2 & STATUS2_WRAPPED) && ewram16020arr(i) == gActiveBattler)
            gBattleMons[i].status2 &= ~STATUS2_WRAPPED;
    }
    gActionSelectionCursor[gActiveBattler] = 0;
    gMoveSelectionCursor[gActiveBattler] = 0;

    MEMSET_ALT(&gDisableStructs[gActiveBattler], 0, 0x1C, i, ptr);
    gProtectStructs[gActiveBattler].protected = 0;
    gProtectStructs[gActiveBattler].endured = 0;
    gProtectStructs[gActiveBattler].onlyStruggle = 0;
    gProtectStructs[gActiveBattler].helpingHand = 0;
    gProtectStructs[gActiveBattler].bounceMove = 0;
    gProtectStructs[gActiveBattler].stealMove = 0;
    gProtectStructs[gActiveBattler].flag0Unknown = 0;
    gProtectStructs[gActiveBattler].prlzImmobility = 0;
    gProtectStructs[gActiveBattler].confusionSelfDmg = 0;
    gProtectStructs[gActiveBattler].notEffective = 0;
    gProtectStructs[gActiveBattler].chargingTurn = 0;
    gProtectStructs[gActiveBattler].fleeFlag = 0;
    gProtectStructs[gActiveBattler].usedImprisionedMove = 0;
    gProtectStructs[gActiveBattler].loveImmobility = 0;
    gProtectStructs[gActiveBattler].usedDisabledMove = 0;
    gProtectStructs[gActiveBattler].usedTauntedMove = 0;
    gProtectStructs[gActiveBattler].flag2Unknown = 0;
    gProtectStructs[gActiveBattler].flinchImmobility = 0;
    gProtectStructs[gActiveBattler].notFirstStrike = 0;

    gDisableStructs[gActiveBattler].isFirstTurn= 2;
    gLastUsedMove[gActiveBattler] = 0;
    gLastLandedMoves[gActiveBattler] = 0;
    gLastHitByType[gActiveBattler] = 0;
    gUnknown_02024C4C[gActiveBattler] = 0;
    gUnknown_02024C2C[gActiveBattler] = 0;
    gLastHitBy[gActiveBattler] = 0xFF;

    ewram160E8arr2(0, gActiveBattler) = 0;
    ewram160E8arr2(1, gActiveBattler) = 0;
    ewram160ACarr2(0, gActiveBattler) = 0;
    ewram160ACarr2(1, gActiveBattler) = 0;
    ewram16100arr2(0, gActiveBattler) = 0;
    ewram16100arr2(1, gActiveBattler) = 0;
    ewram16100arr2(2, gActiveBattler) = 0;
    ewram16100arr2(3, gActiveBattler) = 0;

    eFlashFireArr.arr[gActiveBattler] = 0;

    gBattleMons[gActiveBattler].type1 = gBaseStats[gBattleMons[gActiveBattler].species].type1;
    gBattleMons[gActiveBattler].type2 = gBaseStats[gBattleMons[gActiveBattler].species].type2;
}

void bc_8012FAC(void)
{
    switch (gBattleCommunication[0])
    {
    case 0:
        gActiveBattler = gBattleCommunication[1];
        EmitGetAttributes(0, 0, 0);
        MarkBufferBankForExecution(gActiveBattler);
        gBattleCommunication[0]++;
        break;
    case 1:
        if (gBattleExecBuffer == 0)
        {
            gBattleCommunication[1]++;
            if (gBattleCommunication[1] == gBattlersCount)
                gBattleMainFunc = BattlePrepIntroSlide;
            else
                gBattleCommunication[0] = 0;
        }
        break;
    }
}

static void BattlePrepIntroSlide(void)
{
    if (gBattleExecBuffer == 0)
    {
        gActiveBattler = GetBattlerAtPosition(0);
        EmitIntroSlide(0, gBattleTerrain);
        MarkBufferBankForExecution(gActiveBattler);
        gBattleMainFunc = sub_8011384;
        gBattleCommunication[0] = 0;
        gBattleCommunication[1] = 0;
    }
}

void sub_8011384(void)
{
    u8 *ptr;
    s32 i;

    if (gBattleExecBuffer == 0)
    {
        for (gActiveBattler = 0; gActiveBattler < gBattlersCount; gActiveBattler++)
        {
            if ((gBattleTypeFlags & BATTLE_TYPE_SAFARI)
             && GetBattlerSide(gActiveBattler) == 0)
            {
                MEMSET_ALT(&gBattleMons[gActiveBattler], 0, 0x58, i, ptr);
            }
            else
            {
                u8 r0;

                MEMSET_ALT(&gBattleMons[gActiveBattler], gBattleBufferB[gActiveBattler][4 + i], 0x58, i, ptr);
                gBattleMons[gActiveBattler].type1 = gBaseStats[gBattleMons[gActiveBattler].species].type1;
                gBattleMons[gActiveBattler].type2 = gBaseStats[gBattleMons[gActiveBattler].species].type2;
                gBattleMons[gActiveBattler].ability = GetAbilityBySpecies(gBattleMons[gActiveBattler].species, gBattleMons[gActiveBattler].altAbility);
                r0 = GetBattlerSide(gActiveBattler);
                ewram160BC[r0] = gBattleMons[gActiveBattler].hp;
                for (i = 0; i < 8; i++)
                    gBattleMons[gActiveBattler].statStages[i] = 6;
                gBattleMons[gActiveBattler].status2 = 0;
            }

            if (GetBattlerPosition(gActiveBattler) == 0)
            {
                EmitTrainerThrow(0);
                MarkBufferBankForExecution(gActiveBattler);
            }

            if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
            {
                if (GetBattlerPosition(gActiveBattler) == 1)
                {
                    EmitTrainerThrow(0);
                    MarkBufferBankForExecution(gActiveBattler);
                }
                if (GetBattlerSide(gActiveBattler) == 1
                 && !(gBattleTypeFlags & (BATTLE_TYPE_EREADER_TRAINER | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_LINK)))
                    GetSetPokedexFlag(SpeciesToNationalPokedexNum(gBattleMons[gActiveBattler].species), 2);
            }
            else
            {
                if (GetBattlerSide(gActiveBattler) == 1
                 && !(gBattleTypeFlags & (BATTLE_TYPE_EREADER_TRAINER | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_LINK)))
                {
                    GetSetPokedexFlag(SpeciesToNationalPokedexNum(gBattleMons[gActiveBattler].species), 2);
                    EmitLoadPokeSprite(0);
                    MarkBufferBankForExecution(gActiveBattler);
                }
            }

            if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
            {
                if (GetBattlerPosition(gActiveBattler) == 2
                 || GetBattlerPosition(gActiveBattler) == 3)
                {
                    EmitTrainerThrow(0);
                    MarkBufferBankForExecution(gActiveBattler);
                }
            }
        }
        gBattleMainFunc = bc_801333C;
    }
}

void bc_801333C(void)
{
    s32 i;

    if (gBattleExecBuffer == 0)
    {
		struct HpAndStatus hpStatus[6];

        if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
        {
            for (i = 0; i < 6; i++)
            {
                if (GetMonData(&gEnemyParty[i], MON_DATA_SPECIES2) == 0
                 || GetMonData(&gEnemyParty[i], MON_DATA_SPECIES2) == SPECIES_EGG)
                {
                    hpStatus[i].hp = 0xFFFF;
                    hpStatus[i].status = 0;
                }
                else
                {
                    hpStatus[i].hp = GetMonData(&gEnemyParty[i], MON_DATA_HP);
                    hpStatus[i].status = GetMonData(&gEnemyParty[i], MON_DATA_STATUS);
                }
            }
            gActiveBattler = GetBattlerAtPosition(1);
            EmitDrawPartyStatusSummary(0, hpStatus, 0x80);
            MarkBufferBankForExecution(gActiveBattler);

            for (i = 0; i < 6; i++)
            {
                if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2) == 0
                 || GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2) == SPECIES_EGG)
                {
                    hpStatus[i].hp = 0xFFFF;
                    hpStatus[i].status = 0;
                }
                else
                {
                    hpStatus[i].hp = GetMonData(&gPlayerParty[i], MON_DATA_HP);
                    hpStatus[i].status = GetMonData(&gPlayerParty[i], MON_DATA_STATUS);
                }
            }
            gActiveBattler = GetBattlerAtPosition(0);
            EmitDrawPartyStatusSummary(0, hpStatus, 0x80);
            MarkBufferBankForExecution(gActiveBattler);

            gBattleMainFunc = bc_battle_begin_message;
        }
        else
        {
            // The array gets set here, but nothing is ever done with it.
            // Likely unfinished code.

            for (i = 0; i < 6; i++)
            {
                if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2) == 0
                 || GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2) == SPECIES_EGG)
                {
                    hpStatus[i].hp = 0xFFFF;
                    hpStatus[i].status = 0;
                }
                else
                {
                    hpStatus[i].hp = GetMonData(&gPlayerParty[i], MON_DATA_HP);
                    hpStatus[i].status = GetMonData(&gPlayerParty[i], MON_DATA_STATUS);
                }
            }

            gBattleMainFunc = bc_8013568;
        }
    }
}

void bc_battle_begin_message(void)
{
    if (gBattleExecBuffer == 0)
    {
        gActiveBattler = GetBattlerAtPosition(1);
        PrepareStringBattle(0, gActiveBattler);
        gBattleMainFunc = sub_8011800;
    }
}

void bc_8013568(void)
{
    if (gBattleExecBuffer == 0)
    {
        gBattleMainFunc = sub_8011970;
        PrepareStringBattle(0, 0);
    }
}

void sub_8011800(void)
{
    if (gBattleExecBuffer == 0)
    {
        PrepareStringBattle(1, GetBattlerAtPosition(1));
        gBattleMainFunc = sub_8011834;
    }
}

void sub_8011834(void)
{
    if (gBattleExecBuffer == 0)
    {
        for (gActiveBattler = 0; gActiveBattler < gBattlersCount; gActiveBattler++)
        {
            if (GetBattlerPosition(gActiveBattler) == 1)
            {
                EmitTrainerBallThrow(0);
                MarkBufferBankForExecution(gActiveBattler);
            }
            if ((gBattleTypeFlags & BATTLE_TYPE_MULTI)
             && GetBattlerPosition(gActiveBattler) == 3)
            {
                EmitTrainerBallThrow(0);
                MarkBufferBankForExecution(gActiveBattler);
            }
        }
        gBattleMainFunc = bc_801362C;
    }
}

void bc_801362C(void)
{
    if (gBattleExecBuffer == 0)
    {
        for (gActiveBattler = 0; gActiveBattler < gBattlersCount; gActiveBattler++)
        {
            if (GetBattlerSide(gActiveBattler) == 1
             && !(gBattleTypeFlags & (BATTLE_TYPE_EREADER_TRAINER | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_LINK)))
                GetSetPokedexFlag(SpeciesToNationalPokedexNum(gBattleMons[gActiveBattler].species), 2);
        }
        gBattleMainFunc = sub_8011970;
    }
}

void unref_sub_8011950(void)
{
    if (gBattleExecBuffer == 0)
        gBattleMainFunc = sub_8011970;
}

void sub_8011970(void)
{
    if (gBattleExecBuffer == 0)
    {
        if (!(gBattleTypeFlags & BATTLE_TYPE_SAFARI))
            PrepareStringBattle(1, GetBattlerAtPosition(0));
        gBattleMainFunc = sub_80119B4;
    }
}

void sub_80119B4(void)
{
    if (gBattleExecBuffer == 0)
    {
        for (gActiveBattler = 0; gActiveBattler < gBattlersCount; gActiveBattler++)
        {
            if (GetBattlerPosition(gActiveBattler) == 0)
            {
                EmitTrainerBallThrow(0);
                MarkBufferBankForExecution(gActiveBattler);
            }
            if ((gBattleTypeFlags & BATTLE_TYPE_MULTI)
             && GetBattlerPosition(gActiveBattler) == 2)
            {
                EmitTrainerBallThrow(0);
                MarkBufferBankForExecution(gActiveBattler);
            }
        }
        ewram16058 = 0;
        ewram160F9 = 0;
        ewram160E6 = 0;
        gBattleMainFunc = BattleBeginFirstTurn;
    }
}

void unref_sub_8011A68(void)
{
    if (gBattleExecBuffer == 0)
    {
        for (gActiveBattler = 0; gActiveBattler < gBattlersCount; gActiveBattler++)
        {
            if (GetBattlerSide(gActiveBattler) == 0)
            {
                EmitSendOutPoke(0, gBattlerPartyIndexes[gActiveBattler], 0);
                MarkBufferBankForExecution(gActiveBattler);
            }
        }
        ewram16058 = 0;
        ewram160F9 = 0;
        ewram160E6 = 0;
        gBattleMainFunc = BattleBeginFirstTurn;
    }
}

void BattleBeginFirstTurn(void)
{
    s32 i;
    s32 j;
    u8 r9 = 0;

    if (gBattleExecBuffer == 0)
    {
        if (ewram16058 == 0)
        {
            for (i = 0; i < gBattlersCount; i++)
                gBanksByTurnOrder[i] = i;
            for (i = 0; i < gBattlersCount - 1; i++)
            {
                for (j = i + 1; j < gBattlersCount; j++)
                {
                    if (GetWhoStrikesFirst(gBanksByTurnOrder[i], gBanksByTurnOrder[j], 1) != 0)
                        SwapTurnOrder(i, j);
                }
            }
        }
        if (ewram160E6 == 0 && AbilityBattleEffects(0, 0, 0, 0xFF, 0) != 0)
        {
            ewram160E6 = 1;
            return;
        }
        while (ewram16058 < gBattlersCount)
        {
            if (AbilityBattleEffects(0, gBanksByTurnOrder[ewram16058], 0, 0, 0) != 0)
                r9++;
            ewram16058++;
            if (r9 != 0)
                return;
        }
        if (AbilityBattleEffects(9, 0, 0, 0, 0) != 0)
            return;
        if (AbilityBattleEffects(11, 0, 0, 0, 0) != 0)
            return;
        while (ewram160F9 < gBattlersCount)
        {
            if (ItemBattleEffects(0, gBanksByTurnOrder[ewram160F9], 0) != 0)
                r9++;
            ewram160F9++;
            if (r9 != 0)
                return;
        }
        // Absolutely pointless for-loop that somehow doesn't get optimized out
        for (i = 0; i < gBattlersCount; i++)
            ;
        for (i = 0; i < 4; i++)
        {
            ewram16068arr(i) = 6;
            gActionForBanks[i] = 0xFF;
            gChosenMovesByBanks[i] = 0;
        }
        TurnValuesCleanUp(0);
        SpecialStatusesClear();
        ewram160A6 = gAbsentBattlerFlags;
        gBattleMainFunc = sub_8012324;
        ResetSentPokesToOpponentValue();
        for (i = 0; i < 8; i++)
            gBattleCommunication[i] = 0;
        for (i = 0; i < gBattlersCount; i++)
            gBattleMons[i].status2 &= ~8;
        ewram16000 = 0;
        ewram16001 = 0;
        ewram16110 = 0;
        ewram16111 = 0;
        ewram1600C = 0;
        ewram16059 = 0;
        ewram1600E = 0;
        gMoveResultFlags = 0;
        gRandomTurnNumber = Random();
    }
}

void bc_8013B1C(void)
{
    s32 i;

    if (gBattleExecBuffer == 0)
    {
        gBattleMainFunc = BattleTurnPassed;
        for (i = 0; i < 8; i++)
            gBattleCommunication[i] = 0;
        for (i = 0; i < gBattlersCount; i++)
        {
            gBattleMons[i].status2 &= ~8;
            if ((gBattleMons[i].status1 & 7) && (gBattleMons[i].status2 & 0x1000))
                CancelMultiTurnMoves(i);
        }
        ewram16000 = 0;
        ewram16001 = 0;
        ewram16110 = 0;
        ewram16111 = 0;
        ewram1600E = 0;
        gMoveResultFlags = 0;
    }
}

void BattleTurnPassed(void)
{
    s32 i;

    TurnValuesCleanUp(1);
    if (gBattleOutcome == 0)
    {
        if (UpdateTurnCounters() != 0)
            return;
        if (TurnBasedEffects() != 0)
            return;
    }
    if (HandleFaintedMonActions() != 0)
        return;
    ewram16059 = 0;
    if (HandleWishPerishSongOnTurnEnd() != 0)
        return;
    TurnValuesCleanUp(0);
    gHitMarker &= ~HITMARKER_NO_ATTACKSTRING;
    gHitMarker &= ~0x80000;
    gHitMarker &= ~0x400000;
    gHitMarker &= ~0x100000;
    ewram16002 = 0;
    ewram160A1 = 0;
    ewram1600C = 0;
    gBattleMoveDamage = 0;
    gMoveResultFlags = 0;
    for (i = 0; i < 5; i++)
        gBattleCommunication[i] = 0;
    if (gBattleOutcome != 0)
    {
        gCurrentActionFuncId = 12;
        gBattleMainFunc = RunTurnActionsFunctions;
        return;
    }
    if (gBattleResults.battleTurnCounter < 0xFF)
        gBattleResults.battleTurnCounter++;
    for (i = 0; i < gBattlersCount; i++)
    {
        gActionForBanks[i] = 0xFF;
        gChosenMovesByBanks[i] = 0;
    }
    for (i = 0; i < 4; i++)
        ewram16068arr(i) = 6;
    ewram160A6 = gAbsentBattlerFlags;
    gBattleMainFunc = sub_8012324;
    gRandomTurnNumber = Random();
}

u8 CanRunFromBattle(void)
{
    u8 r2;
    u8 r6;
    s32 i;

    if (gBattleMons[gActiveBattler].item == ITEM_ENIGMA_BERRY)
        r2 = gEnigmaBerries[gActiveBattler].holdEffect;
    else
        r2 = ItemId_GetHoldEffect(gBattleMons[gActiveBattler].item);
    gStringBank = gActiveBattler;
    if (r2 == HOLD_EFFECT_CAN_ALWAYS_RUN)
        return 0;
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
        return 0;
    if (gBattleMons[gActiveBattler].ability == ABILITY_RUN_AWAY)
        return 0;
    r6 = GetBattlerSide(gActiveBattler);
    for (i = 0; i < gBattlersCount; i++)
    {
        if (r6 != GetBattlerSide(i)
         && gBattleMons[i].ability == ABILITY_SHADOW_TAG)
        {
            ewram16003 = i;
            gLastUsedAbility = gBattleMons[i].ability;
            gBattleCommunication[5] = 2;
            return 2;
        }
        if (r6 != GetBattlerSide(i)
         && gBattleMons[gActiveBattler].ability != ABILITY_LEVITATE
         && gBattleMons[gActiveBattler].type1 != 2
         && gBattleMons[gActiveBattler].type2 != 2
         && gBattleMons[i].ability == ABILITY_ARENA_TRAP)
        {
            ewram16003 = i;
            gLastUsedAbility = gBattleMons[i].ability;
            gBattleCommunication[5] = 2;
            return 2;
        }
    }
    i = AbilityBattleEffects(15, gActiveBattler, ABILITY_MAGNET_PULL, 0, 0);
    if (i != 0 && (gBattleMons[gActiveBattler].type1 == 8 || gBattleMons[gActiveBattler].type2 == 8))
    {
        ewram16003 = i - 1;
        gLastUsedAbility = gBattleMons[i - 1].ability;
        gBattleCommunication[5] = 2;
        return 2;
    }
    if ((gBattleMons[gActiveBattler].status2 & (STATUS2_ESCAPE_PREVENTION | STATUS2_WRAPPED)) || (gStatuses3[gActiveBattler] & STATUS3_ROOTED))
    {
        gBattleCommunication[5] = 0;
        return 1;
    }
    if (gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE)
    {
        gBattleCommunication[5] = 1;
        return 1;
    }
    return 0;
}

void sub_8012258(u8 a)
{
    s32 i;
    u8 r4;
    u8 r1;

    for (i = 0; i < 3; i++)
        gUnknown_02038470[i] = ewram1606Carr(i, a);
    r4 = pokemon_order_func(gBattlerPartyIndexes[a]);
    r1 = pokemon_order_func(ewram16068arr(a));
    sub_8094C98(r4, r1);
    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
    {
        for (i = 0; i < 3; i++)
        {
            ewram1606Carr(i, a) = gUnknown_02038470[i];
            ewram1606Carr(i, (a ^ 2)) = gUnknown_02038470[i];
        }
    }
    else
    {
        for (i = 0; i < 3; i++)
        {
            ewram1606Carr(i, a) = gUnknown_02038470[i];
        }
    }
}

/*
void sub_8012324(void)
{
    u8 r5;

    gBattleCommunication[4] = 0;
    // inverted loop
    //_0801234C
    for (gActiveBattler = 0; gActiveBattler < gBattlersCount; gActiveBattler++)
    {
        r5 = GetBattlerPosition(gActiveBattler);
        switch (gBattleCommunication[gActiveBattler])
        {
        case 0:
            ewram16068arr(gActiveBattler) = 6;
            if (!(gBattleTypeFlags & 0x40)
             && (r5 & 2)
             && !(ewram160A6 & gBitTable[GetBattlerAtPosition(r5 ^ 2)])
             && gBattleCommunication[GetBattlerAtPosition(r5)] != 4)
                break;
            //_080123F8
            if (ewram160A6 & gBitTable[gActiveBattler])
            {
                gActionForBanks[gActiveBattler] = 13;
                if (!(gBattleTypeFlags & 0x40))
                    gBattleCommunication[gActiveBattler] = 4;
                //_08012454
                else
                    gBattleCommunication[gActiveBattler] = 3;
                break;
            }
            //_08012468
            if ((gBattleMons[gActiveBattler].status2 & 0x1000)
             || (gBattleMons[gActiveBattler].status2 & 0x10000000))
            {
                gActionForBanks[gActiveBattler] = 0;
                gBattleCommunication[gActiveBattler] = 3;
            }
            else
            {
                Emitcmd18(0, gActionForBanks[0], gBattleBufferB[0][1] | (gBattleBufferB[0][2] << 8));
                MarkBufferBankForExecution(gActiveBattler);
                gBattleCommunication[gActiveBattler]++;
            }
            break;
        case 1:
        }
    }
}
*/
NAKED
void sub_8012324(void)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x1C\n\
    ldr r0, _08012340 @ =gBattleCommunication\n\
    movs r1, 0\n\
    strb r1, [r0, 0x4]\n\
    ldr r0, _08012344 @ =gActiveBattler\n\
    strb r1, [r0]\n\
    ldr r0, _08012348 @ =gBattlersCount\n\
    bl _08012F74\n\
    .align 2, 0\n\
_08012340: .4byte gBattleCommunication\n\
_08012344: .4byte gActiveBattler\n\
_08012348: .4byte gBattlersCount\n\
_0801234C:\n\
    ldr r4, _08012374 @ =gActiveBattler\n\
    ldrb r0, [r4]\n\
    bl GetBattlerPosition\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    ldr r1, _08012378 @ =gBattleCommunication\n\
    ldrb r0, [r4]\n\
    adds r0, r1\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x6\n\
    bls _08012368\n\
    bl _08012F66\n\
_08012368:\n\
    lsls r0, 2\n\
    ldr r1, _0801237C @ =_08012380\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_08012374: .4byte gActiveBattler\n\
_08012378: .4byte gBattleCommunication\n\
_0801237C: .4byte _08012380\n\
    .align 2, 0\n\
_08012380:\n\
    .4byte _0801239C\n\
    .4byte _080124C8\n\
    .4byte _08012A28\n\
    .4byte _08012DA8\n\
    .4byte _08012E50\n\
    .4byte _08012E94\n\
    .4byte _08012F38\n\
_0801239C:\n\
    ldr r4, _08012434 @ =gSharedMem\n\
    ldr r0, _08012438 @ =gActiveBattler\n\
    ldrb r0, [r0]\n\
    ldr r1, _0801243C @ =0x00016068\n\
    adds r0, r1\n\
    adds r0, r4\n\
    movs r1, 0x6\n\
    strb r1, [r0]\n\
    ldr r0, _08012440 @ =gBattleTypeFlags\n\
    ldrh r1, [r0]\n\
    movs r0, 0x40\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _080123F8\n\
    movs r1, 0x2\n\
    movs r0, 0x2\n\
    ands r0, r5\n\
    cmp r0, 0\n\
    beq _080123F8\n\
    eors r5, r1\n\
    adds r0, r5, 0\n\
    bl GetBattlerAtPosition\n\
    ldr r2, _08012444 @ =0x000160a6\n\
    adds r1, r4, r2\n\
    ldrb r1, [r1]\n\
    ldr r2, _08012448 @ =gBitTable\n\
    lsls r0, 24\n\
    lsrs r0, 22\n\
    adds r0, r2\n\
    ldr r0, [r0]\n\
    ands r1, r0\n\
    cmp r1, 0\n\
    bne _080123F8\n\
    ldr r4, _0801244C @ =gBattleCommunication\n\
    adds r0, r5, 0\n\
    bl GetBattlerAtPosition\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    adds r0, r4\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x4\n\
    beq _080123F8\n\
    bl _08012F66\n\
_080123F8:\n\
    ldr r0, _08012434 @ =gSharedMem\n\
    ldr r3, _08012444 @ =0x000160a6\n\
    adds r0, r3\n\
    ldrb r3, [r0]\n\
    ldr r1, _08012448 @ =gBitTable\n\
    ldr r4, _08012438 @ =gActiveBattler\n\
    ldrb r2, [r4]\n\
    lsls r0, r2, 2\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    ands r3, r0\n\
    cmp r3, 0\n\
    beq _08012468\n\
    ldr r0, _08012450 @ =gActionForBanks\n\
    adds r0, r2, r0\n\
    movs r1, 0xD\n\
    strb r1, [r0]\n\
    ldr r0, _08012440 @ =gBattleTypeFlags\n\
    ldrh r1, [r0]\n\
    movs r0, 0x40\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _08012454\n\
    ldr r0, _0801244C @ =gBattleCommunication\n\
    ldrb r1, [r4]\n\
    adds r1, r0\n\
    movs r0, 0x4\n\
    strb r0, [r1]\n\
    bl _08012F66\n\
    .align 2, 0\n\
_08012434: .4byte gSharedMem\n\
_08012438: .4byte gActiveBattler\n\
_0801243C: .4byte 0x00016068\n\
_08012440: .4byte gBattleTypeFlags\n\
_08012444: .4byte 0x000160a6\n\
_08012448: .4byte gBitTable\n\
_0801244C: .4byte gBattleCommunication\n\
_08012450: .4byte gActionForBanks\n\
_08012454:\n\
    ldr r0, _08012464 @ =gBattleCommunication\n\
    ldrb r1, [r4]\n\
    adds r1, r0\n\
    movs r0, 0x3\n\
    strb r0, [r1]\n\
    bl _08012F66\n\
    .align 2, 0\n\
_08012464: .4byte gBattleCommunication\n\
_08012468:\n\
    ldr r1, _0801249C @ =gBattleMons\n\
    movs r0, 0x58\n\
    muls r0, r2\n\
    adds r1, 0x50\n\
    adds r0, r1\n\
    ldr r1, [r0]\n\
    movs r0, 0x80\n\
    lsls r0, 5\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _08012488\n\
    movs r0, 0x80\n\
    lsls r0, 15\n\
    ands r1, r0\n\
    cmp r1, 0\n\
    beq _080124A8\n\
_08012488:\n\
    ldr r0, _080124A0 @ =gActionForBanks\n\
    adds r0, r2, r0\n\
    strb r3, [r0]\n\
    ldr r1, _080124A4 @ =gBattleCommunication\n\
    ldrb r0, [r4]\n\
    adds r0, r1\n\
    movs r1, 0x3\n\
    strb r1, [r0]\n\
    bl _08012F66\n\
    .align 2, 0\n\
_0801249C: .4byte gBattleMons\n\
_080124A0: .4byte gActionForBanks\n\
_080124A4: .4byte gBattleCommunication\n\
_080124A8:\n\
    ldr r0, _080124C0 @ =gActionForBanks\n\
    ldrb r1, [r0]\n\
    ldr r0, _080124C4 @ =gBattleBufferB\n\
    ldrb r2, [r0, 0x1]\n\
    ldrb r0, [r0, 0x2]\n\
    lsls r0, 8\n\
    orrs r2, r0\n\
    movs r0, 0\n\
    bl Emitcmd18\n\
    bl _08012E32\n\
    .align 2, 0\n\
_080124C0: .4byte gActionForBanks\n\
_080124C4: .4byte gBattleBufferB\n\
_080124C8:\n\
    ldr r4, _08012520 @ =gBattleExecBuffer\n\
    ldr r1, _08012524 @ =gBitTable\n\
    ldr r3, _08012528 @ =gActiveBattler\n\
    ldrb r5, [r3]\n\
    lsls r0, r5, 2\n\
    adds r0, r1\n\
    ldr r2, [r0]\n\
    lsls r0, r2, 4\n\
    movs r1, 0xF0\n\
    lsls r1, 24\n\
    orrs r0, r1\n\
    orrs r0, r2\n\
    lsls r1, r2, 8\n\
    orrs r0, r1\n\
    lsls r2, 12\n\
    orrs r0, r2\n\
    ldr r1, [r4]\n\
    ands r1, r0\n\
    mov r8, r3\n\
    cmp r1, 0\n\
    beq _080124F6\n\
    bl _08012F66\n\
_080124F6:\n\
    ldr r2, _0801252C @ =gActionForBanks\n\
    adds r2, r5, r2\n\
    ldr r1, _08012530 @ =gBattleBufferB\n\
    lsls r0, r5, 9\n\
    adds r1, 0x1\n\
    adds r0, r1\n\
    ldrb r0, [r0]\n\
    strb r0, [r2]\n\
    ldrb r0, [r3]\n\
    lsls r0, 9\n\
    adds r0, r1\n\
    ldrb r0, [r0]\n\
    cmp r0, 0xC\n\
    bls _08012514\n\
    b _08012968\n\
_08012514:\n\
    lsls r0, 2\n\
    ldr r1, _08012534 @ =_08012538\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_08012520: .4byte gBattleExecBuffer\n\
_08012524: .4byte gBitTable\n\
_08012528: .4byte gActiveBattler\n\
_0801252C: .4byte gActionForBanks\n\
_08012530: .4byte gBattleBufferB\n\
_08012534: .4byte _08012538\n\
    .align 2, 0\n\
_08012538:\n\
    .4byte _0801256C\n\
    .4byte _080126B4\n\
    .4byte _080126E0\n\
    .4byte _08012968\n\
    .4byte _08012968\n\
    .4byte _080128B0\n\
    .4byte _08012908\n\
    .4byte _08012968\n\
    .4byte _08012968\n\
    .4byte _08012968\n\
    .4byte _08012968\n\
    .4byte _08012968\n\
    .4byte _0801292C\n\
_0801256C:\n\
    bl AreAllMovesUnusable\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _080125D0\n\
    ldr r0, _080125B4 @ =gBattleCommunication\n\
    ldr r2, _080125B8 @ =gActiveBattler\n\
    ldrb r1, [r2]\n\
    adds r1, r0\n\
    movs r4, 0\n\
    movs r0, 0x5\n\
    strb r0, [r1]\n\
    ldr r3, _080125BC @ =gSharedMem\n\
    ldrb r0, [r2]\n\
    ldr r1, _080125C0 @ =0x00016060\n\
    adds r0, r1\n\
    adds r0, r3\n\
    strb r4, [r0]\n\
    ldrb r0, [r2]\n\
    ldr r4, _080125C4 @ =0x00016094\n\
    adds r0, r4\n\
    adds r0, r3\n\
    movs r1, 0x3\n\
    strb r1, [r0]\n\
    ldrb r1, [r2]\n\
    ldr r0, _080125C8 @ =0x00016010\n\
    adds r2, r1, r0\n\
    adds r2, r3\n\
    ldr r0, _080125CC @ =gBattleBufferB\n\
    lsls r1, 9\n\
    adds r0, 0x3\n\
    adds r1, r0\n\
    ldrb r0, [r1]\n\
    strb r0, [r2]\n\
    bl _08012F90\n\
    .align 2, 0\n\
_080125B4: .4byte gBattleCommunication\n\
_080125B8: .4byte gActiveBattler\n\
_080125BC: .4byte gSharedMem\n\
_080125C0: .4byte 0x00016060\n\
_080125C4: .4byte 0x00016094\n\
_080125C8: .4byte 0x00016010\n\
_080125CC: .4byte gBattleBufferB\n\
_080125D0:\n\
    ldr r1, _080125FC @ =gDisableStructs\n\
    ldr r5, _08012600 @ =gActiveBattler\n\
    ldrb r4, [r5]\n\
    lsls r0, r4, 3\n\
    subs r0, r4\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    ldrh r2, [r0, 0x6]\n\
    cmp r2, 0\n\
    beq _0801260C\n\
    ldr r1, _08012604 @ =gChosenMovesByBanks\n\
    lsls r0, r4, 1\n\
    adds r0, r1\n\
    strh r2, [r0]\n\
    ldr r1, _08012608 @ =gBattleCommunication\n\
    ldrb r0, [r5]\n\
    adds r0, r1\n\
    movs r1, 0x3\n\
    strb r1, [r0]\n\
    bl _08012F90\n\
    .align 2, 0\n\
_080125FC: .4byte gDisableStructs\n\
_08012600: .4byte gActiveBattler\n\
_08012604: .4byte gChosenMovesByBanks\n\
_08012608: .4byte gBattleCommunication\n\
_0801260C:\n\
    add r2, sp, 0x4\n\
    ldr r3, _080126AC @ =gBattleMons\n\
    movs r1, 0x58\n\
    adds r0, r4, 0\n\
    muls r0, r1\n\
    adds r0, r3\n\
    ldrh r0, [r0]\n\
    strh r0, [r2, 0x10]\n\
    ldrb r0, [r5]\n\
    muls r0, r1\n\
    adds r0, r3\n\
    adds r0, 0x21\n\
    ldrb r0, [r0]\n\
    strb r0, [r2, 0x12]\n\
    ldrb r0, [r5]\n\
    muls r0, r1\n\
    adds r0, r3\n\
    adds r0, 0x22\n\
    ldrb r0, [r0]\n\
    strb r0, [r2, 0x13]\n\
    movs r4, 0\n\
    mov r1, sp\n\
    adds r1, 0xC\n\
    str r1, [sp, 0x18]\n\
    add r2, sp, 0x10\n\
    mov r10, r2\n\
    mov r8, r3\n\
    adds r7, r5, 0\n\
    movs r6, 0x58\n\
    movs r3, 0xC\n\
    add r3, r8\n\
    mov r9, r3\n\
    add r5, sp, 0x4\n\
_0801264E:\n\
    lsls r2, r4, 1\n\
    ldrb r0, [r7]\n\
    muls r0, r6\n\
    adds r0, r2, r0\n\
    add r0, r9\n\
    ldrh r0, [r0]\n\
    strh r0, [r5]\n\
    ldr r0, [sp, 0x18]\n\
    adds r3, r0, r4\n\
    ldrb r0, [r7]\n\
    muls r0, r6\n\
    adds r0, r4, r0\n\
    mov r1, r8\n\
    adds r1, 0x24\n\
    adds r0, r1\n\
    ldrb r0, [r0]\n\
    strb r0, [r3]\n\
    ldrb r0, [r7]\n\
    adds r1, r0, 0\n\
    muls r1, r6\n\
    adds r2, r1\n\
    add r2, r9\n\
    ldrh r0, [r2]\n\
    add r1, r8\n\
    adds r1, 0x3B\n\
    ldrb r1, [r1]\n\
    lsls r2, r4, 24\n\
    lsrs r2, 24\n\
    bl CalculatePPWithBonus\n\
    mov r2, r10\n\
    adds r1, r2, r4\n\
    strb r0, [r1]\n\
    adds r5, 0x2\n\
    adds r4, 0x1\n\
    cmp r4, 0x3\n\
    ble _0801264E\n\
    ldr r0, _080126B0 @ =gBattleTypeFlags\n\
    ldrb r0, [r0]\n\
    movs r1, 0x1\n\
    ands r1, r0\n\
    movs r0, 0\n\
    movs r2, 0\n\
    add r3, sp, 0x4\n\
    bl Emitcmd20\n\
    b _0801289E\n\
    .align 2, 0\n\
_080126AC: .4byte gBattleMons\n\
_080126B0: .4byte gBattleTypeFlags\n\
_080126B4:\n\
    ldr r0, _080126D0 @ =gBattleTypeFlags\n\
    ldrh r1, [r0]\n\
    ldr r0, _080126D4 @ =0x00000902\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _080126C2\n\
    b _08012908\n\
_080126C2:\n\
    ldr r1, _080126D8 @ =gUnknown_02024C1C\n\
    mov r3, r8\n\
    ldrb r0, [r3]\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    ldr r1, _080126DC @ =BattleScript_ActionSelectionItemsCantBeUsed\n\
    b _080129CC\n\
    .align 2, 0\n\
_080126D0: .4byte gBattleTypeFlags\n\
_080126D4: .4byte 0x00000902\n\
_080126D8: .4byte gUnknown_02024C1C\n\
_080126DC: .4byte BattleScript_ActionSelectionItemsCantBeUsed\n\
_080126E0:\n\
    ldr r3, _08012738 @ =gSharedMem\n\
    ldr r5, _0801273C @ =gActiveBattler\n\
    ldrb r0, [r5]\n\
    ldr r4, _08012740 @ =0x00016064\n\
    adds r1, r0, r4\n\
    adds r1, r3\n\
    ldr r2, _08012744 @ =gBattlerPartyIndexes\n\
    lsls r0, 1\n\
    adds r0, r2\n\
    ldrh r0, [r0]\n\
    strb r0, [r1]\n\
    ldr r7, _08012748 @ =gBattleMons\n\
    ldrb r2, [r5]\n\
    movs r6, 0x58\n\
    adds r0, r2, 0\n\
    muls r0, r6\n\
    adds r1, r7, 0\n\
    adds r1, 0x50\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    ldr r1, _0801274C @ =0x0400e000\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _08012722\n\
    ldr r0, _08012750 @ =gStatuses3\n\
    lsls r1, r2, 2\n\
    adds r1, r0\n\
    ldr r1, [r1]\n\
    movs r0, 0x80\n\
    lsls r0, 3\n\
    ands r1, r0\n\
    cmp r1, 0\n\
    beq _08012758\n\
_08012722:\n\
    lsls r0, r2, 1\n\
    adds r0, r2\n\
    ldr r2, _08012754 @ =0x0001606c\n\
    adds r1, r3, r2\n\
    adds r0, r1\n\
    str r0, [sp]\n\
    movs r0, 0\n\
    movs r1, 0x2\n\
    movs r2, 0x6\n\
    b _0801286C\n\
    .align 2, 0\n\
_08012738: .4byte gSharedMem\n\
_0801273C: .4byte gActiveBattler\n\
_08012740: .4byte 0x00016064\n\
_08012744: .4byte gBattlerPartyIndexes\n\
_08012748: .4byte gBattleMons\n\
_0801274C: .4byte 0x0400e000\n\
_08012750: .4byte gStatuses3\n\
_08012754: .4byte 0x0001606c\n\
_08012758:\n\
    str r1, [sp]\n\
    movs r0, 0xC\n\
    adds r1, r2, 0\n\
    movs r2, 0x17\n\
    movs r3, 0\n\
    bl AbilityBattleEffects\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    cmp r4, 0\n\
    bne _080127E0\n\
    ldrb r1, [r5]\n\
    str r4, [sp]\n\
    movs r0, 0xC\n\
    movs r2, 0x47\n\
    movs r3, 0\n\
    bl AbilityBattleEffects\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    cmp r4, 0\n\
    beq _080127A8\n\
    ldrb r0, [r5]\n\
    muls r0, r6\n\
    adds r1, r0, r7\n\
    adds r0, r1, 0\n\
    adds r0, 0x21\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x2\n\
    beq _080127A8\n\
    adds r0, r1, 0\n\
    adds r0, 0x22\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x2\n\
    beq _080127A8\n\
    adds r0, r1, 0\n\
    adds r0, 0x20\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x1A\n\
    bne _080127E0\n\
_080127A8:\n\
    ldr r5, _08012808 @ =gActiveBattler\n\
    ldrb r1, [r5]\n\
    movs r0, 0\n\
    str r0, [sp]\n\
    movs r0, 0xF\n\
    movs r2, 0x2A\n\
    movs r3, 0\n\
    bl AbilityBattleEffects\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    cmp r4, 0\n\
    beq _08012818\n\
    ldr r2, _0801280C @ =gBattleMons\n\
    ldrb r1, [r5]\n\
    movs r0, 0x58\n\
    muls r0, r1\n\
    adds r1, r0, r2\n\
    adds r0, r1, 0\n\
    adds r0, 0x21\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x8\n\
    beq _080127E0\n\
    adds r0, r1, 0\n\
    adds r0, 0x22\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x8\n\
    bne _08012818\n\
_080127E0:\n\
    subs r1, r4, 0x1\n\
    lsls r1, 4\n\
    movs r0, 0x4\n\
    orrs r1, r0\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
    ldr r0, _08012810 @ =gLastUsedAbility\n\
    ldrb r3, [r0]\n\
    ldr r0, _08012808 @ =gActiveBattler\n\
    ldrb r2, [r0]\n\
    lsls r0, r2, 1\n\
    adds r0, r2\n\
    ldr r2, _08012814 @ =gSharedMem + 0x1606C\n\
    adds r0, r2\n\
    str r0, [sp]\n\
    movs r0, 0\n\
    movs r2, 0x6\n\
    bl EmitChoosePokemon\n\
    b _0801289E\n\
    .align 2, 0\n\
_08012808: .4byte gActiveBattler\n\
_0801280C: .4byte gBattleMons\n\
_08012810: .4byte gLastUsedAbility\n\
_08012814: .4byte gSharedMem + 0x1606C\n\
_08012818:\n\
    ldr r0, _08012830 @ =gActiveBattler\n\
    ldrb r1, [r0]\n\
    mov r8, r0\n\
    cmp r1, 0x2\n\
    bne _08012840\n\
    ldr r0, _08012834 @ =gActionForBanks\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x2\n\
    bne _08012840\n\
    ldr r3, _08012838 @ =gSharedMem\n\
    ldr r4, _0801283C @ =0x00016068\n\
    b _08012854\n\
    .align 2, 0\n\
_08012830: .4byte gActiveBattler\n\
_08012834: .4byte gActionForBanks\n\
_08012838: .4byte gSharedMem\n\
_0801283C: .4byte 0x00016068\n\
_08012840:\n\
    mov r2, r8\n\
    ldrb r0, [r2]\n\
    cmp r0, 0x3\n\
    bne _08012884\n\
    ldr r0, _08012874 @ =gActionForBanks\n\
    ldrb r0, [r0, 0x1]\n\
    cmp r0, 0x2\n\
    bne _08012884\n\
    ldr r3, _08012878 @ =gSharedMem\n\
    ldr r4, _0801287C @ =0x00016069\n\
_08012854:\n\
    adds r0, r3, r4\n\
    ldrb r2, [r0]\n\
    mov r0, r8\n\
    ldrb r1, [r0]\n\
    lsls r0, r1, 1\n\
    adds r0, r1\n\
    ldr r1, _08012880 @ =0x0001606c\n\
    adds r3, r1\n\
    adds r0, r3\n\
    str r0, [sp]\n\
    movs r0, 0\n\
    movs r1, 0\n\
_0801286C:\n\
    movs r3, 0\n\
    bl EmitChoosePokemon\n\
    b _0801289E\n\
    .align 2, 0\n\
_08012874: .4byte gActionForBanks\n\
_08012878: .4byte gSharedMem\n\
_0801287C: .4byte 0x00016069\n\
_08012880: .4byte 0x0001606c\n\
_08012884:\n\
    ldr r0, _080128A8 @ =gActiveBattler\n\
    ldrb r1, [r0]\n\
    lsls r0, r1, 1\n\
    adds r0, r1\n\
    ldr r1, _080128AC @ =gSharedMem + 0x1606C\n\
    adds r0, r1\n\
    str r0, [sp]\n\
    movs r0, 0\n\
    movs r1, 0\n\
    movs r2, 0x6\n\
    movs r3, 0\n\
    bl EmitChoosePokemon\n\
_0801289E:\n\
    ldr r0, _080128A8 @ =gActiveBattler\n\
    ldrb r0, [r0]\n\
    bl MarkBufferBankForExecution\n\
    b _08012968\n\
    .align 2, 0\n\
_080128A8: .4byte gActiveBattler\n\
_080128AC: .4byte gSharedMem + 0x1606C\n\
_080128B0:\n\
    bl PlayerPartyAndPokemonStorageFull\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _08012968\n\
    ldr r1, _080128EC @ =gUnknown_02024C1C\n\
    ldr r2, _080128F0 @ =gActiveBattler\n\
    ldrb r0, [r2]\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    ldr r1, _080128F4 @ =BattleScript_PrintFullBox\n\
    str r1, [r0]\n\
    ldr r0, _080128F8 @ =gBattleCommunication\n\
    ldrb r1, [r2]\n\
    adds r1, r0\n\
    movs r3, 0\n\
    movs r0, 0x5\n\
    strb r0, [r1]\n\
    ldr r1, _080128FC @ =gSharedMem\n\
    ldrb r0, [r2]\n\
    ldr r4, _08012900 @ =0x00016060\n\
    adds r0, r4\n\
    adds r0, r1\n\
    strb r3, [r0]\n\
    ldrb r0, [r2]\n\
    ldr r2, _08012904 @ =0x00016094\n\
    adds r0, r2\n\
    adds r0, r1\n\
    strb r3, [r0]\n\
    b _08012F90\n\
    .align 2, 0\n\
_080128EC: .4byte gUnknown_02024C1C\n\
_080128F0: .4byte gActiveBattler\n\
_080128F4: .4byte BattleScript_PrintFullBox\n\
_080128F8: .4byte gBattleCommunication\n\
_080128FC: .4byte gSharedMem\n\
_08012900: .4byte 0x00016060\n\
_08012904: .4byte 0x00016094\n\
_08012908:\n\
    ldr r4, _08012924 @ =gActiveBattler\n\
    ldrb r0, [r4]\n\
    lsls r1, r0, 1\n\
    adds r1, r0\n\
    ldr r0, _08012928 @ =gSharedMem + 0x1606C\n\
    adds r1, r0\n\
    movs r0, 0\n\
    bl EmitOpenBag\n\
    ldrb r0, [r4]\n\
    bl MarkBufferBankForExecution\n\
    b _08012968\n\
    .align 2, 0\n\
_08012924: .4byte gActiveBattler\n\
_08012928: .4byte gSharedMem + 0x1606C\n\
_0801292C:\n\
    ldr r4, _08012964 @ =gBattleCommunication\n\
    mov r3, r8\n\
    ldrb r1, [r3]\n\
    adds r1, r4\n\
    movs r5, 0\n\
    movs r0, 0x6\n\
    strb r0, [r1]\n\
    ldrb r0, [r3]\n\
    bl GetBattlerPosition\n\
    movs r1, 0x2\n\
    eors r0, r1\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    bl GetBattlerAtPosition\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    adds r0, r4\n\
    strb r5, [r0]\n\
    movs r0, 0\n\
    bl Emitcmd50\n\
    mov r4, r8\n\
    ldrb r0, [r4]\n\
    bl MarkBufferBankForExecution\n\
    b _08012F90\n\
    .align 2, 0\n\
_08012964: .4byte gBattleCommunication\n\
_08012968:\n\
    ldr r0, _08012994 @ =gBattleTypeFlags\n\
    ldrh r1, [r0]\n\
    movs r0, 0xA\n\
    ands r0, r1\n\
    cmp r0, 0x8\n\
    bne _080129A8\n\
    ldr r0, _08012998 @ =gBattleBufferB\n\
    ldr r4, _0801299C @ =gActiveBattler\n\
    ldrb r1, [r4]\n\
    lsls r1, 9\n\
    adds r0, 0x1\n\
    adds r1, r0\n\
    ldrb r0, [r1]\n\
    cmp r0, 0x3\n\
    bne _080129A8\n\
    ldr r0, _080129A0 @ =BattleScript_PrintCantRunFromTrainer\n\
    bl BattleScriptExecute\n\
    ldr r1, _080129A4 @ =gBattleCommunication\n\
    ldrb r0, [r4]\n\
    adds r0, r1\n\
    b _08012BFE\n\
    .align 2, 0\n\
_08012994: .4byte gBattleTypeFlags\n\
_08012998: .4byte gBattleBufferB\n\
_0801299C: .4byte gActiveBattler\n\
_080129A0: .4byte BattleScript_PrintCantRunFromTrainer\n\
_080129A4: .4byte gBattleCommunication\n\
_080129A8:\n\
    bl CanRunFromBattle\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _08012A14\n\
    ldr r0, _080129F4 @ =gBattleBufferB\n\
    ldr r3, _080129F8 @ =gActiveBattler\n\
    ldrb r2, [r3]\n\
    lsls r1, r2, 9\n\
    adds r0, 0x1\n\
    adds r1, r0\n\
    ldrb r0, [r1]\n\
    cmp r0, 0x3\n\
    bne _08012A14\n\
    ldr r1, _080129FC @ =gUnknown_02024C1C\n\
    lsls r0, r2, 2\n\
    adds r0, r1\n\
    ldr r1, _08012A00 @ =BattleScript_PrintCantEscapeFromBattle\n\
_080129CC:\n\
    str r1, [r0]\n\
    ldr r0, _08012A04 @ =gBattleCommunication\n\
    ldrb r1, [r3]\n\
    adds r1, r0\n\
    movs r2, 0\n\
    movs r0, 0x5\n\
    strb r0, [r1]\n\
    ldr r1, _08012A08 @ =gSharedMem\n\
    ldrb r0, [r3]\n\
    ldr r4, _08012A0C @ =0x00016060\n\
    adds r0, r4\n\
    adds r0, r1\n\
    strb r2, [r0]\n\
    ldrb r0, [r3]\n\
    ldr r3, _08012A10 @ =0x00016094\n\
    adds r0, r3\n\
    adds r0, r1\n\
    strb r2, [r0]\n\
    b _08012F90\n\
    .align 2, 0\n\
_080129F4: .4byte gBattleBufferB\n\
_080129F8: .4byte gActiveBattler\n\
_080129FC: .4byte gUnknown_02024C1C\n\
_08012A00: .4byte BattleScript_PrintCantEscapeFromBattle\n\
_08012A04: .4byte gBattleCommunication\n\
_08012A08: .4byte gSharedMem\n\
_08012A0C: .4byte 0x00016060\n\
_08012A10: .4byte 0x00016094\n\
_08012A14:\n\
    ldr r2, _08012A20 @ =gBattleCommunication\n\
    ldr r0, _08012A24 @ =gActiveBattler\n\
    ldrb r1, [r0]\n\
    adds r1, r2\n\
    b _08012E3E\n\
    .align 2, 0\n\
_08012A20: .4byte gBattleCommunication\n\
_08012A24: .4byte gActiveBattler\n\
_08012A28:\n\
    ldr r4, _08012A6C @ =gBattleExecBuffer\n\
    ldr r1, _08012A70 @ =gBitTable\n\
    ldr r3, _08012A74 @ =gActiveBattler\n\
    ldrb r5, [r3]\n\
    lsls r0, r5, 2\n\
    adds r0, r1\n\
    ldr r2, [r0]\n\
    lsls r0, r2, 4\n\
    movs r1, 0xF0\n\
    lsls r1, 24\n\
    orrs r0, r1\n\
    orrs r0, r2\n\
    lsls r1, r2, 8\n\
    orrs r0, r1\n\
    lsls r2, 12\n\
    orrs r0, r2\n\
    ldr r1, [r4]\n\
    ands r1, r0\n\
    mov r8, r3\n\
    cmp r1, 0\n\
    beq _08012A54\n\
    b _08012F66\n\
_08012A54:\n\
    ldr r1, _08012A78 @ =gActionForBanks\n\
    adds r0, r5, r1\n\
    ldrb r0, [r0]\n\
    adds r3, r1, 0\n\
    cmp r0, 0x9\n\
    bls _08012A62\n\
    b _08012F66\n\
_08012A62:\n\
    lsls r0, 2\n\
    ldr r1, _08012A7C @ =_08012A80\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_08012A6C: .4byte gBattleExecBuffer\n\
_08012A70: .4byte gBitTable\n\
_08012A74: .4byte gActiveBattler\n\
_08012A78: .4byte gActionForBanks\n\
_08012A7C: .4byte _08012A80\n\
    .align 2, 0\n\
_08012A80:\n\
    .4byte _08012AA8\n\
    .4byte _08012BB0\n\
    .4byte _08012BE8\n\
    .4byte _08012CE0\n\
    .4byte _08012D04\n\
    .4byte _08012D18\n\
    .4byte _08012D2C\n\
    .4byte _08012D5C\n\
    .4byte _08012D70\n\
    .4byte _08012D94\n\
_08012AA8:\n\
    ldr r0, _08012AC8 @ =gBattleBufferB\n\
    mov r1, r8\n\
    ldrb r4, [r1]\n\
    lsls r1, r4, 9\n\
    adds r2, r0, 0x1\n\
    adds r1, r2\n\
    ldrb r1, [r1]\n\
    adds r6, r0, 0\n\
    cmp r1, 0x9\n\
    bgt _08012ACC\n\
    cmp r1, 0x3\n\
    blt _08012ACC\n\
    adds r0, r4, r3\n\
    strb r1, [r0]\n\
    b _08012F90\n\
    .align 2, 0\n\
_08012AC8: .4byte gBattleBufferB\n\
_08012ACC:\n\
    adds r3, r6, 0\n\
    mov r5, r8\n\
    ldrb r4, [r5]\n\
    lsls r1, r4, 9\n\
    adds r7, r3, 0x2\n\
    adds r0, r1, r7\n\
    ldrb r2, [r0]\n\
    adds r3, 0x3\n\
    mov r9, r3\n\
    add r1, r9\n\
    ldrb r0, [r1]\n\
    lsls r0, 8\n\
    orrs r2, r0\n\
    ldr r0, _08012AF4 @ =0x0000ffff\n\
    cmp r2, r0\n\
    bne _08012AFC\n\
    ldr r0, _08012AF8 @ =gBattleCommunication\n\
    adds r0, r4, r0\n\
    b _08012BFE\n\
    .align 2, 0\n\
_08012AF4: .4byte 0x0000ffff\n\
_08012AF8: .4byte gBattleCommunication\n\
_08012AFC:\n\
    bl TrySetCantSelectMoveBattleScript\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _08012B48\n\
    ldr r0, _08012B38 @ =gBattleCommunication\n\
    ldrb r1, [r5]\n\
    adds r1, r0\n\
    movs r2, 0\n\
    movs r0, 0x5\n\
    strb r0, [r1]\n\
    ldr r3, _08012B3C @ =gSharedMem\n\
    ldrb r0, [r5]\n\
    ldr r4, _08012B40 @ =0x00016060\n\
    adds r0, r4\n\
    adds r0, r3\n\
    strb r2, [r0]\n\
    ldrb r0, [r5]\n\
    lsls r0, 9\n\
    adds r1, r6, 0x1\n\
    adds r0, r1\n\
    strb r2, [r0]\n\
    ldrb r0, [r5]\n\
    ldr r1, _08012B44 @ =0x00016094\n\
    adds r0, r1\n\
    adds r0, r3\n\
    movs r1, 0x1\n\
    strb r1, [r0]\n\
    b _08012F90\n\
    .align 2, 0\n\
_08012B38: .4byte gBattleCommunication\n\
_08012B3C: .4byte gSharedMem\n\
_08012B40: .4byte 0x00016060\n\
_08012B44: .4byte 0x00016094\n\
_08012B48:\n\
    ldr r6, _08012B98 @ =gSharedMem\n\
    mov r2, r8\n\
    ldrb r0, [r2]\n\
    ldr r2, _08012B9C @ =0x0001608c\n\
    adds r1, r0, r2\n\
    adds r1, r6\n\
    lsls r0, 9\n\
    adds r0, r7\n\
    ldrb r0, [r0]\n\
    strb r0, [r1]\n\
    ldr r0, _08012BA0 @ =gChosenMovesByBanks\n\
    mov r4, r8\n\
    ldrb r3, [r4]\n\
    lsls r5, r3, 1\n\
    adds r5, r0\n\
    ldr r4, _08012BA4 @ =gBattleMons\n\
    adds r2, r3, r2\n\
    adds r2, r6\n\
    ldrb r0, [r2]\n\
    lsls r0, 1\n\
    movs r1, 0x58\n\
    muls r1, r3\n\
    adds r0, r1\n\
    adds r4, 0xC\n\
    adds r0, r4\n\
    ldrh r0, [r0]\n\
    strh r0, [r5]\n\
    mov r1, r8\n\
    ldrb r0, [r1]\n\
    ldr r2, _08012BA8 @ =0x00016010\n\
    adds r1, r0, r2\n\
    adds r1, r6\n\
    lsls r0, 9\n\
    add r0, r9\n\
    ldrb r0, [r0]\n\
    strb r0, [r1]\n\
    ldr r0, _08012BAC @ =gBattleCommunication\n\
    mov r3, r8\n\
    ldrb r1, [r3]\n\
    b _08012E3C\n\
    .align 2, 0\n\
_08012B98: .4byte gSharedMem\n\
_08012B9C: .4byte 0x0001608c\n\
_08012BA0: .4byte gChosenMovesByBanks\n\
_08012BA4: .4byte gBattleMons\n\
_08012BA8: .4byte 0x00016010\n\
_08012BAC: .4byte gBattleCommunication\n\
_08012BB0:\n\
    ldr r2, _08012BD8 @ =gBattleBufferB\n\
    ldr r5, _08012BDC @ =gActiveBattler\n\
    ldrb r4, [r5]\n\
    lsls r1, r4, 9\n\
    adds r0, r2, 0x1\n\
    adds r0, r1, r0\n\
    ldrb r3, [r0]\n\
    adds r2, 0x2\n\
    adds r1, r2\n\
    ldrb r0, [r1]\n\
    lsls r0, 8\n\
    orrs r3, r0\n\
    cmp r3, 0\n\
    bne _08012BCE\n\
    b _08012F60\n\
_08012BCE:\n\
    ldr r0, _08012BE0 @ =gLastUsedItem\n\
    strh r3, [r0]\n\
    ldr r0, _08012BE4 @ =gBattleCommunication\n\
    ldrb r1, [r5]\n\
    b _08012E3C\n\
    .align 2, 0\n\
_08012BD8: .4byte gBattleBufferB\n\
_08012BDC: .4byte gActiveBattler\n\
_08012BE0: .4byte gLastUsedItem\n\
_08012BE4: .4byte gBattleCommunication\n\
_08012BE8:\n\
    ldr r4, _08012C04 @ =gBattleBufferB\n\
    ldr r7, _08012C08 @ =gActiveBattler\n\
    ldrb r2, [r7]\n\
    lsls r0, r2, 9\n\
    adds r1, r4, 0x1\n\
    adds r0, r1\n\
    ldrb r1, [r0]\n\
    cmp r1, 0x6\n\
    bne _08012C10\n\
    ldr r0, _08012C0C @ =gBattleCommunication\n\
    adds r0, r2, r0\n\
_08012BFE:\n\
    movs r1, 0\n\
    strb r1, [r0]\n\
    b _08012F66\n\
    .align 2, 0\n\
_08012C04: .4byte gBattleBufferB\n\
_08012C08: .4byte gActiveBattler\n\
_08012C0C: .4byte gBattleCommunication\n\
_08012C10:\n\
    ldr r0, _08012CC4 @ =gSharedMem\n\
    mov r12, r0\n\
    ldr r3, _08012CC8 @ =0x00016068\n\
    adds r0, r2, r3\n\
    add r0, r12\n\
    strb r1, [r0]\n\
    ldr r0, _08012CCC @ =gBattleTypeFlags\n\
    ldrh r1, [r0]\n\
    movs r0, 0x40\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _08012CBE\n\
    ldrb r0, [r7]\n\
    lsls r1, r0, 1\n\
    adds r1, r0\n\
    ldr r5, _08012CD0 @ =0x0001606c\n\
    adds r1, r5\n\
    add r1, r12\n\
    ldrb r2, [r1]\n\
    movs r0, 0xF\n\
    ands r0, r2\n\
    strb r0, [r1]\n\
    ldrb r0, [r7]\n\
    lsls r2, r0, 1\n\
    adds r2, r0\n\
    adds r2, r5\n\
    add r2, r12\n\
    lsls r0, 9\n\
    adds r6, r4, 0x2\n\
    adds r0, r6\n\
    ldrb r1, [r0]\n\
    movs r3, 0xF0\n\
    adds r0, r3, 0\n\
    ands r0, r1\n\
    ldrb r1, [r2]\n\
    orrs r0, r1\n\
    strb r0, [r2]\n\
    ldrb r0, [r7]\n\
    lsls r1, r0, 1\n\
    adds r1, r0\n\
    ldr r2, _08012CD4 @ =0x0001606d\n\
    adds r1, r2\n\
    add r1, r12\n\
    lsls r0, 9\n\
    adds r4, 0x3\n\
    mov r8, r4\n\
    add r0, r8\n\
    ldrb r0, [r0]\n\
    strb r0, [r1]\n\
    ldrb r0, [r7]\n\
    movs r4, 0x2\n\
    eors r0, r4\n\
    lsls r1, r0, 1\n\
    adds r1, r0\n\
    adds r1, r5\n\
    add r1, r12\n\
    ldrb r2, [r1]\n\
    adds r0, r3, 0\n\
    ands r0, r2\n\
    strb r0, [r1]\n\
    ldrb r0, [r7]\n\
    eors r0, r4\n\
    lsls r1, r0, 1\n\
    adds r1, r0\n\
    adds r1, r5\n\
    add r1, r12\n\
    ldrb r0, [r7]\n\
    lsls r0, 9\n\
    adds r0, r6\n\
    ldrb r0, [r0]\n\
    ands r3, r0\n\
    lsrs r3, 4\n\
    ldrb r0, [r1]\n\
    orrs r3, r0\n\
    strb r3, [r1]\n\
    ldrb r0, [r7]\n\
    eors r4, r0\n\
    lsls r1, r4, 1\n\
    adds r1, r4\n\
    ldr r3, _08012CD8 @ =0x0001606e\n\
    adds r1, r3\n\
    add r1, r12\n\
    ldrb r0, [r7]\n\
    lsls r0, 9\n\
    add r0, r8\n\
    ldrb r0, [r0]\n\
    strb r0, [r1]\n\
_08012CBE:\n\
    ldr r0, _08012CDC @ =gBattleCommunication\n\
    ldrb r1, [r7]\n\
    b _08012E3C\n\
    .align 2, 0\n\
_08012CC4: .4byte gSharedMem\n\
_08012CC8: .4byte 0x00016068\n\
_08012CCC: .4byte gBattleTypeFlags\n\
_08012CD0: .4byte 0x0001606c\n\
_08012CD4: .4byte 0x0001606d\n\
_08012CD8: .4byte 0x0001606e\n\
_08012CDC: .4byte gBattleCommunication\n\
_08012CE0:\n\
    ldr r2, _08012CF8 @ =gHitMarker\n\
    ldr r0, [r2]\n\
    movs r1, 0x80\n\
    lsls r1, 8\n\
    orrs r0, r1\n\
    str r0, [r2]\n\
    ldr r2, _08012CFC @ =gBattleCommunication\n\
    ldr r0, _08012D00 @ =gActiveBattler\n\
    ldrb r1, [r0]\n\
    adds r1, r2\n\
    b _08012E3E\n\
    .align 2, 0\n\
_08012CF8: .4byte gHitMarker\n\
_08012CFC: .4byte gBattleCommunication\n\
_08012D00: .4byte gActiveBattler\n\
_08012D04:\n\
    ldr r2, _08012D10 @ =gBattleCommunication\n\
    ldr r0, _08012D14 @ =gActiveBattler\n\
    ldrb r1, [r0]\n\
    adds r1, r2\n\
    b _08012E3E\n\
    .align 2, 0\n\
_08012D10: .4byte gBattleCommunication\n\
_08012D14: .4byte gActiveBattler\n\
_08012D18:\n\
    ldr r2, _08012D24 @ =gBattleCommunication\n\
    ldr r0, _08012D28 @ =gActiveBattler\n\
    ldrb r1, [r0]\n\
    adds r1, r2\n\
    b _08012E3E\n\
    .align 2, 0\n\
_08012D24: .4byte gBattleCommunication\n\
_08012D28: .4byte gActiveBattler\n\
_08012D2C:\n\
    ldr r2, _08012D50 @ =gBattleBufferB\n\
    ldr r0, _08012D54 @ =gActiveBattler\n\
    ldrb r4, [r0]\n\
    lsls r1, r4, 9\n\
    adds r0, r2, 0x1\n\
    adds r0, r1, r0\n\
    ldrb r3, [r0]\n\
    adds r2, 0x2\n\
    adds r1, r2\n\
    ldrb r0, [r1]\n\
    lsls r0, 8\n\
    orrs r3, r0\n\
    cmp r3, 0\n\
    bne _08012D4A\n\
    b _08012F60\n\
_08012D4A:\n\
    ldr r1, _08012D58 @ =gBattleCommunication\n\
    adds r1, r4, r1\n\
    b _08012E3E\n\
    .align 2, 0\n\
_08012D50: .4byte gBattleBufferB\n\
_08012D54: .4byte gActiveBattler\n\
_08012D58: .4byte gBattleCommunication\n\
_08012D5C:\n\
    ldr r2, _08012D68 @ =gBattleCommunication\n\
    ldr r0, _08012D6C @ =gActiveBattler\n\
    ldrb r1, [r0]\n\
    adds r1, r2\n\
    b _08012E3E\n\
    .align 2, 0\n\
_08012D68: .4byte gBattleCommunication\n\
_08012D6C: .4byte gActiveBattler\n\
_08012D70:\n\
    ldr r2, _08012D88 @ =gHitMarker\n\
    ldr r0, [r2]\n\
    movs r1, 0x80\n\
    lsls r1, 8\n\
    orrs r0, r1\n\
    str r0, [r2]\n\
    ldr r2, _08012D8C @ =gBattleCommunication\n\
    ldr r0, _08012D90 @ =gActiveBattler\n\
    ldrb r1, [r0]\n\
    adds r1, r2\n\
    b _08012E3E\n\
    .align 2, 0\n\
_08012D88: .4byte gHitMarker\n\
_08012D8C: .4byte gBattleCommunication\n\
_08012D90: .4byte gActiveBattler\n\
_08012D94:\n\
    ldr r2, _08012DA0 @ =gBattleCommunication\n\
    ldr r0, _08012DA4 @ =gActiveBattler\n\
    ldrb r1, [r0]\n\
    adds r1, r2\n\
    b _08012E3E\n\
    .align 2, 0\n\
_08012DA0: .4byte gBattleCommunication\n\
_08012DA4: .4byte gActiveBattler\n\
_08012DA8:\n\
    ldr r3, _08012E10 @ =gBattleExecBuffer\n\
    ldr r4, _08012E14 @ =gBitTable\n\
    ldr r0, _08012E18 @ =gActiveBattler\n\
    ldrb r0, [r0]\n\
    lsls r0, 2\n\
    adds r0, r4\n\
    ldr r2, [r0]\n\
    lsls r1, r2, 4\n\
    movs r0, 0xF0\n\
    lsls r0, 24\n\
    orrs r1, r0\n\
    orrs r1, r2\n\
    lsls r0, r2, 8\n\
    orrs r1, r0\n\
    lsls r2, 12\n\
    orrs r1, r2\n\
    ldr r0, [r3]\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _08012DD2\n\
    b _08012F66\n\
_08012DD2:\n\
    ldr r0, _08012E1C @ =gBattleTypeFlags\n\
    ldrh r1, [r0]\n\
    movs r0, 0x41\n\
    ands r0, r1\n\
    cmp r0, 0x1\n\
    bne _08012E06\n\
    movs r1, 0x2\n\
    movs r0, 0x2\n\
    ands r0, r5\n\
    cmp r0, 0\n\
    bne _08012E06\n\
    adds r0, r5, 0\n\
    eors r0, r1\n\
    bl GetBattlerAtPosition\n\
    ldr r1, _08012E20 @ =gSharedMem\n\
    ldr r2, _08012E24 @ =0x000160a6\n\
    adds r1, r2\n\
    ldrb r1, [r1]\n\
    lsls r0, 24\n\
    lsrs r0, 22\n\
    adds r0, r4\n\
    ldr r0, [r0]\n\
    ands r1, r0\n\
    cmp r1, 0\n\
    beq _08012E28\n\
_08012E06:\n\
    movs r0, 0\n\
    movs r1, 0\n\
    bl EmitLinkStandbyMsg\n\
    b _08012E30\n\
    .align 2, 0\n\
_08012E10: .4byte gBattleExecBuffer\n\
_08012E14: .4byte gBitTable\n\
_08012E18: .4byte gActiveBattler\n\
_08012E1C: .4byte gBattleTypeFlags\n\
_08012E20: .4byte gSharedMem\n\
_08012E24: .4byte 0x000160a6\n\
_08012E28:\n\
    movs r0, 0\n\
    movs r1, 0x1\n\
    bl EmitLinkStandbyMsg\n\
_08012E30:\n\
    ldr r4, _08012E48 @ =gActiveBattler\n\
_08012E32:\n\
    ldrb r0, [r4]\n\
    bl MarkBufferBankForExecution\n\
    ldr r0, _08012E4C @ =gBattleCommunication\n\
    ldrb r1, [r4]\n\
_08012E3C:\n\
    adds r1, r0\n\
_08012E3E:\n\
    ldrb r0, [r1]\n\
    adds r0, 0x1\n\
    strb r0, [r1]\n\
    b _08012F66\n\
    .align 2, 0\n\
_08012E48: .4byte gActiveBattler\n\
_08012E4C: .4byte gBattleCommunication\n\
_08012E50:\n\
    ldr r3, _08012E84 @ =gBattleExecBuffer\n\
    ldr r1, _08012E88 @ =gBitTable\n\
    ldr r0, _08012E8C @ =gActiveBattler\n\
    ldrb r0, [r0]\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    ldr r2, [r0]\n\
    lsls r1, r2, 4\n\
    movs r0, 0xF0\n\
    lsls r0, 24\n\
    orrs r1, r0\n\
    orrs r1, r2\n\
    lsls r0, r2, 8\n\
    orrs r1, r0\n\
    lsls r2, 12\n\
    orrs r1, r2\n\
    ldr r0, [r3]\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _08012F66\n\
    ldr r1, _08012E90 @ =gBattleCommunication\n\
    ldrb r0, [r1, 0x4]\n\
    adds r0, 0x1\n\
    strb r0, [r1, 0x4]\n\
    b _08012F66\n\
    .align 2, 0\n\
_08012E84: .4byte gBattleExecBuffer\n\
_08012E88: .4byte gBitTable\n\
_08012E8C: .4byte gActiveBattler\n\
_08012E90: .4byte gBattleCommunication\n\
_08012E94:\n\
    ldr r2, _08012EB8 @ =gSharedMem\n\
    ldr r5, _08012EBC @ =gActiveBattler\n\
    ldrb r1, [r5]\n\
    ldr r3, _08012EC0 @ =0x00016060\n\
    adds r0, r1, r3\n\
    adds r0, r2\n\
    ldrb r0, [r0]\n\
    cmp r0, 0\n\
    beq _08012ECC\n\
    ldr r0, _08012EC4 @ =gBattleCommunication\n\
    adds r0, r1, r0\n\
    ldr r4, _08012EC8 @ =0x00016094\n\
    adds r1, r4\n\
    adds r1, r2\n\
    ldrb r1, [r1]\n\
    strb r1, [r0]\n\
    b _08012F66\n\
    .align 2, 0\n\
_08012EB8: .4byte gSharedMem\n\
_08012EBC: .4byte gActiveBattler\n\
_08012EC0: .4byte 0x00016060\n\
_08012EC4: .4byte gBattleCommunication\n\
_08012EC8: .4byte 0x00016094\n\
_08012ECC:\n\
    ldr r0, _08012F20 @ =gBankAttacker\n\
    strb r1, [r0]\n\
    ldr r7, _08012F24 @ =gBattlescriptCurrInstr\n\
    ldr r6, _08012F28 @ =gUnknown_02024C1C\n\
    ldrb r0, [r5]\n\
    lsls r0, 2\n\
    adds r0, r6\n\
    ldr r4, [r0]\n\
    str r4, [r7]\n\
    ldr r3, _08012F2C @ =gBattleExecBuffer\n\
    ldr r1, _08012F30 @ =gBitTable\n\
    ldrb r0, [r5]\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    ldr r2, [r0]\n\
    lsls r1, r2, 4\n\
    movs r0, 0xF0\n\
    lsls r0, 24\n\
    orrs r1, r0\n\
    orrs r1, r2\n\
    lsls r0, r2, 8\n\
    orrs r1, r0\n\
    lsls r2, 12\n\
    orrs r1, r2\n\
    ldr r0, [r3]\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _08012F12\n\
    ldr r0, _08012F34 @ =gBattleScriptingCommandsTable\n\
    ldrb r1, [r4]\n\
    lsls r1, 2\n\
    adds r1, r0\n\
    ldr r0, [r1]\n\
    bl _call_via_r0\n\
_08012F12:\n\
    ldrb r0, [r5]\n\
    lsls r0, 2\n\
    adds r0, r6\n\
    ldr r1, [r7]\n\
    str r1, [r0]\n\
    b _08012F66\n\
    .align 2, 0\n\
_08012F20: .4byte gBankAttacker\n\
_08012F24: .4byte gBattlescriptCurrInstr\n\
_08012F28: .4byte gUnknown_02024C1C\n\
_08012F2C: .4byte gBattleExecBuffer\n\
_08012F30: .4byte gBitTable\n\
_08012F34: .4byte gBattleScriptingCommandsTable\n\
_08012F38:\n\
    ldr r3, _08012FA0 @ =gBattleExecBuffer\n\
    ldr r1, _08012FA4 @ =gBitTable\n\
    ldr r0, _08012FA8 @ =gActiveBattler\n\
    ldrb r4, [r0]\n\
    lsls r0, r4, 2\n\
    adds r0, r1\n\
    ldr r2, [r0]\n\
    lsls r0, r2, 4\n\
    movs r1, 0xF0\n\
    lsls r1, 24\n\
    orrs r0, r1\n\
    orrs r0, r2\n\
    lsls r1, r2, 8\n\
    orrs r0, r1\n\
    lsls r2, 12\n\
    orrs r0, r2\n\
    ldr r3, [r3]\n\
    ands r3, r0\n\
    cmp r3, 0\n\
    bne _08012F66\n\
_08012F60:\n\
    ldr r0, _08012FAC @ =gBattleCommunication\n\
    adds r0, r4, r0\n\
    strb r3, [r0]\n\
_08012F66:\n\
    ldr r0, _08012FA8 @ =gActiveBattler\n\
    ldrb r1, [r0]\n\
    adds r1, 0x1\n\
    strb r1, [r0]\n\
    ldr r0, _08012FB0 @ =gBattlersCount\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
_08012F74:\n\
    adds r2, r0, 0\n\
    ldrb r0, [r2]\n\
    cmp r1, r0\n\
    bcs _08012F80\n\
    bl _0801234C\n\
_08012F80:\n\
    ldr r0, _08012FAC @ =gBattleCommunication\n\
    ldrb r0, [r0, 0x4]\n\
    ldrb r2, [r2]\n\
    cmp r0, r2\n\
    bne _08012F90\n\
    ldr r1, _08012FB4 @ =gBattleMainFunc\n\
    ldr r0, _08012FB8 @ =SetActionsAndBanksTurnOrder\n\
    str r0, [r1]\n\
_08012F90:\n\
    add sp, 0x1C\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08012FA0: .4byte gBattleExecBuffer\n\
_08012FA4: .4byte gBitTable\n\
_08012FA8: .4byte gActiveBattler\n\
_08012FAC: .4byte gBattleCommunication\n\
_08012FB0: .4byte gBattlersCount\n\
_08012FB4: .4byte gBattleMainFunc\n\
_08012FB8: .4byte SetActionsAndBanksTurnOrder\n\
    .syntax divided\n");
}

void SwapTurnOrder(u8 a, u8 b)
{
    int temp;

    temp = gActionsByTurnOrder[a];
    gActionsByTurnOrder[a] = gActionsByTurnOrder[b];
    gActionsByTurnOrder[b] = temp;

    temp = gBanksByTurnOrder[a];
    gBanksByTurnOrder[a] = gBanksByTurnOrder[b];
    gBanksByTurnOrder[b] = temp;
}

// Determines which of the two given mons will strike first in a battle.
// Returns:
// 0 = first mon moves first
// 1 = second mon moves first
// 2 = second mon moves first because it won a 50/50 roll
u8 GetWhoStrikesFirst(u8 bank1, u8 bank2, bool8 ignoreMovePriorities)
{
    int bank1SpeedMultiplier, bank2SpeedMultiplier;
    u32 bank1AdjustedSpeed, bank2AdjustedSpeed;
    u8 heldItemEffect;
    u8 heldItemEffectParam;
    u16 bank1Move;
    u16 bank2Move;
    u8 strikesFirst = 0;

    // Check for abilities that boost speed in weather.
    if (WEATHER_HAS_EFFECT)
    {
        if ((gBattleMons[bank1].ability == ABILITY_SWIFT_SWIM && (gBattleWeather & WEATHER_RAIN_ANY))
            || (gBattleMons[bank1].ability == ABILITY_CHLOROPHYLL && (gBattleWeather & WEATHER_SUN_ANY)))
            bank1SpeedMultiplier = 2;
        else
            bank1SpeedMultiplier = 1;

        if ((gBattleMons[bank2].ability == ABILITY_SWIFT_SWIM && (gBattleWeather & WEATHER_RAIN_ANY))
            || (gBattleMons[bank2].ability == ABILITY_CHLOROPHYLL && (gBattleWeather & WEATHER_SUN_ANY)))
            bank2SpeedMultiplier = 2;
        else
            bank2SpeedMultiplier = 1;
    }
    else
    {
        bank1SpeedMultiplier = 1;
        bank2SpeedMultiplier = 1;
    }

    // Calculate adjusted speed for first mon.
    bank1AdjustedSpeed = (gBattleMons[bank1].speed * bank1SpeedMultiplier)
        * gStatStageRatios[gBattleMons[bank1].statStages[STAT_STAGE_SPEED]][0] / gStatStageRatios[gBattleMons[bank1].statStages[STAT_STAGE_SPEED]][1];

    if (gBattleMons[bank1].item == ITEM_ENIGMA_BERRY)
    {
        heldItemEffect = gEnigmaBerries[bank1].holdEffect;
        heldItemEffectParam = gEnigmaBerries[bank1].holdEffectParam;
    }
    else
    {
        heldItemEffect = ItemId_GetHoldEffect(gBattleMons[bank1].item);
        heldItemEffectParam = ItemId_GetHoldEffectParam(gBattleMons[bank1].item);
    }

    // Only give badge speed boost to the player's mon.
    if (!(gBattleTypeFlags & BATTLE_TYPE_LINK) && FlagGet(FLAG_BADGE03_GET) && GetBattlerSide(bank1) == 0)
        bank1AdjustedSpeed = (bank1AdjustedSpeed * 110) / 100;

    if (heldItemEffect == HOLD_EFFECT_MACHO_BRACE)
        bank1AdjustedSpeed /= 2;

    if (gBattleMons[bank1].status1 & STATUS_PARALYSIS)
        bank1AdjustedSpeed /= 4;

    if (heldItemEffect == HOLD_EFFECT_QUICK_CLAW && gRandomTurnNumber < (heldItemEffectParam * 0xFFFF) / 100)
        bank1AdjustedSpeed = UINT_MAX;

    // Calculate adjusted speed for second mon.
    bank2AdjustedSpeed = gBattleMons[bank2].speed * bank2SpeedMultiplier
        * gStatStageRatios[gBattleMons[bank2].statStages[STAT_STAGE_SPEED]][0] / gStatStageRatios[gBattleMons[bank2].statStages[STAT_STAGE_SPEED]][1];

    if (gBattleMons[bank2].item == ITEM_ENIGMA_BERRY)
    {
        heldItemEffect = gEnigmaBerries[bank2].holdEffect;
        heldItemEffectParam = gEnigmaBerries[bank2].holdEffectParam;
    }
    else
    {
        heldItemEffect = ItemId_GetHoldEffect(gBattleMons[bank2].item);
        heldItemEffectParam = ItemId_GetHoldEffectParam(gBattleMons[bank2].item);
    }

    // Only give badge speed boost to the player's mon.
    if (!(gBattleTypeFlags & BATTLE_TYPE_LINK) && FlagGet(FLAG_BADGE03_GET) && GetBattlerSide(bank2) == 0)
    {
        bank2AdjustedSpeed = (bank2AdjustedSpeed * 110) / 100;
    }

    if (heldItemEffect == HOLD_EFFECT_MACHO_BRACE)
        bank2AdjustedSpeed /= 2;

    if (gBattleMons[bank2].status1 & STATUS_PARALYSIS)
        bank2AdjustedSpeed /= 4;

    if (heldItemEffect == HOLD_EFFECT_QUICK_CLAW && gRandomTurnNumber < (heldItemEffectParam * 0xFFFF) / 100)
        bank2AdjustedSpeed = UINT_MAX;

    if (ignoreMovePriorities)
    {
        bank1Move = MOVE_NONE;
        bank2Move = MOVE_NONE;
    }
    else
    {
        if (gActionForBanks[bank1] == 0)
        {
            if (gProtectStructs[bank1].onlyStruggle)
                bank1Move = MOVE_STRUGGLE;
            else
                bank1Move = gBattleMons[bank1].moves[ewram1608Carr(bank1)];
        }
        else
            bank1Move = MOVE_NONE;

        if (gActionForBanks[bank2] == 0)
        {
            if (gProtectStructs[bank2].onlyStruggle)
                bank2Move = MOVE_STRUGGLE;
            else
                bank2Move = gBattleMons[bank2].moves[ewram1608Carr(bank2)];
        }
        else
            bank2Move = MOVE_NONE;
    }

    if (gBattleMoves[bank1Move].priority != 0 || gBattleMoves[bank2Move].priority != 0)
    {
        if (gBattleMoves[bank1Move].priority == gBattleMoves[bank2Move].priority)
        {
            if (bank1AdjustedSpeed == bank2AdjustedSpeed && (Random() & 1))
                strikesFirst = 2;
            else if (bank1AdjustedSpeed < bank2AdjustedSpeed)
                strikesFirst = 1;
        }
        else if (gBattleMoves[bank1Move].priority < gBattleMoves[bank2Move].priority)
            strikesFirst = 1;
    }
    else
    {
        if (bank1AdjustedSpeed == bank2AdjustedSpeed && (Random() & 1))
            strikesFirst = 2;
        else if (bank1AdjustedSpeed < bank2AdjustedSpeed)
            strikesFirst = 1;
    }

    return strikesFirst;
}

void SetActionsAndBanksTurnOrder(void)
{
    s32 var = 0;
    s32 i, j;

    if (gBattleTypeFlags & BATTLE_TYPE_SAFARI)
    {
        for (gActiveBattler = 0; gActiveBattler < gBattlersCount; gActiveBattler++)
        {
            gActionsByTurnOrder[var] = gActionForBanks[gActiveBattler];
            gBanksByTurnOrder[var] = gActiveBattler;
            var++;
        }
    }
    else
    {
        if (gBattleTypeFlags & BATTLE_TYPE_LINK)
        {
            for (gActiveBattler = 0; gActiveBattler < gBattlersCount; gActiveBattler++)
            {
                if (gActionForBanks[gActiveBattler] == ACTION_RUN)
                {
                    var = 5;
                    break;
                }
            }
        }
        else
        {
            if (gActionForBanks[0] == ACTION_RUN)
            {
                gActiveBattler = 0;
                var = 5;
            }
        }

        if (var == 5)
        {
            gActionsByTurnOrder[0] = gActionForBanks[gActiveBattler];
            gBanksByTurnOrder[0] = gActiveBattler;
            var = 1;
            for (i = 0; i < gBattlersCount; i++)
            {
                if (i != gActiveBattler)
                {
                    gActionsByTurnOrder[var] = gActionForBanks[i];
                    gBanksByTurnOrder[var] = i;
                    var++;
                }
            }
            gBattleMainFunc = CheckFocusPunch_ClearVarsBeforeTurnStarts;
            eFocusPunchBattler = 0;
            return;
        }
        else
        {
            for (gActiveBattler = 0; gActiveBattler < gBattlersCount; gActiveBattler++)
            {
                if (gActionForBanks[gActiveBattler] == ACTION_USE_ITEM || gActionForBanks[gActiveBattler] == ACTION_SWITCH)
                {
                    gActionsByTurnOrder[var] = gActionForBanks[gActiveBattler];
                    gBanksByTurnOrder[var] = gActiveBattler;
                    var++;
                }
            }
            for (gActiveBattler = 0; gActiveBattler < gBattlersCount; gActiveBattler++)
            {
                if (gActionForBanks[gActiveBattler] != ACTION_USE_ITEM && gActionForBanks[gActiveBattler] != ACTION_SWITCH)
                {
                    gActionsByTurnOrder[var] = gActionForBanks[gActiveBattler];
                    gBanksByTurnOrder[var] = gActiveBattler;
                    var++;
                }
            }
            for (i = 0; i < gBattlersCount - 1; i++)
            {
                for (j = i + 1; j < gBattlersCount; j++)
                {
                    u8 bank1 = gBanksByTurnOrder[i];
                    u8 bank2 = gBanksByTurnOrder[j];
                    if (gActionsByTurnOrder[i] != ACTION_USE_ITEM
                        && gActionsByTurnOrder[j] != ACTION_USE_ITEM
                        && gActionsByTurnOrder[i] != ACTION_SWITCH
                        && gActionsByTurnOrder[j] != ACTION_SWITCH)
                    {
                        if (GetWhoStrikesFirst(bank1, bank2, FALSE))
                            SwapTurnOrder(i, j);
                    }
                }
            }
        }
    }

    gBattleMainFunc = CheckFocusPunch_ClearVarsBeforeTurnStarts;
    eFocusPunchBattler = 0;
}

static void TurnValuesCleanUp(bool8 var0)
{
    s32 i;
    u8 *dataPtr;

    for (gActiveBattler = 0; gActiveBattler < gBattlersCount; gActiveBattler++)
    {
        if (var0)
        {
            gProtectStructs[gActiveBattler].protected = 0;
            gProtectStructs[gActiveBattler].endured = 0;
        }
        else
        {
            dataPtr = (u8*)(&gProtectStructs[gActiveBattler]);
            for (i = 0; i < sizeof(struct ProtectStruct); i++)
                dataPtr[i] = 0;

            if (gDisableStructs[gActiveBattler].isFirstTurn)
                gDisableStructs[gActiveBattler].isFirstTurn--;

            if (gDisableStructs[gActiveBattler].rechargeCounter)
            {
                gDisableStructs[gActiveBattler].rechargeCounter--;
                if (gDisableStructs[gActiveBattler].rechargeCounter == 0)
                    gBattleMons[gActiveBattler].status2 &= ~(STATUS2_RECHARGE);
            }
        }

        if (gDisableStructs[gActiveBattler].substituteHP == 0)
                gBattleMons[gActiveBattler].status2 &= ~(STATUS2_SUBSTITUTE);
    }

    gSideTimers[0].followmeTimer = 0;
    gSideTimers[1].followmeTimer = 0;
}

void SpecialStatusesClear(void)
{
    for (gActiveBattler = 0; gActiveBattler < gBattlersCount; gActiveBattler++)
    {
        s32 i;
        u8 *dataPtr = (u8*)(&gSpecialStatuses[gActiveBattler]);

        for (i = 0; i < sizeof(struct SpecialStatus); i++)
            dataPtr[i] = 0;
    }
}

void CheckFocusPunch_ClearVarsBeforeTurnStarts(void)
{
    if (!(gHitMarker & HITMARKER_RUN))
    {
        while (eFocusPunchBattler < gBattlersCount)
        {
            gActiveBattler = gBankAttacker = eFocusPunchBattler;
            eFocusPunchBattler++;
            if (gChosenMovesByBanks[gActiveBattler] == MOVE_FOCUS_PUNCH
                && !(gBattleMons[gActiveBattler].status1 & STATUS_SLEEP)
                && !(gDisableStructs[gBankAttacker].truantCounter)
                && !(gProtectStructs[gActiveBattler].onlyStruggle))
            {
                BattleScriptExecute(BattleScript_FocusPunchSetUp);
                return;
            }
        }
    }

    TryClearRageStatuses();
    gCurrentTurnActionNumber = 0;
    {
        // something stupid needed to match
        u8 zero;
        gCurrentActionFuncId = gActionsByTurnOrder[(zero = 0)];
    }

    gDynamicBasePower = 0;
    gBattleStruct->dynamicMoveType = 0;
    gBattleMainFunc = RunTurnActionsFunctions;
    gBattleCommunication[3] = 0;
    gBattleCommunication[4] = 0;
    eMultihitMoveEffect = 0;
    ewram17130 = 0;
}

static void RunTurnActionsFunctions(void)
{
    if (gBattleOutcome != 0)
        gCurrentActionFuncId = 12;

    gBattleStruct->unk16057 = gCurrentTurnActionNumber;
    gUnknown_081FA640[gCurrentActionFuncId]();

    if (gCurrentTurnActionNumber >= gBattlersCount) // everyone did their actions, turn finished
    {
        gHitMarker &= ~(HITMARKER_x100000);
        gBattleMainFunc = gUnknown_081FA678[gBattleOutcome & 0x7F];
    }
    else
    {
        if (gBattleStruct->unk16057 != gCurrentTurnActionNumber) // action turn has been done, clear hitmarker bits for another bank
        {
            gHitMarker &= ~(HITMARKER_NO_ATTACKSTRING);
            gHitMarker &= ~(HITMARKER_UNABLE_TO_USE_MOVE);
        }
    }
}

void HandleEndTurn_BattleWon(void)
{
    gCurrentActionFuncId = 0;

    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        gBattleTextBuff1[0] = gBattleOutcome;
        gBankAttacker = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
        gBattlescriptCurrInstr = BattleScript_LinkBattleWonOrLost;
        gBattleOutcome &= ~(OUTCOME_LINK_BATTLE_RUN);
    }
    else if (gBattleTypeFlags & (BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_EREADER_TRAINER))
    {
        gBattlescriptCurrInstr = gUnknown_081D8E0D;
    }
    else if (gBattleTypeFlags & BATTLE_TYPE_TRAINER && !(gBattleTypeFlags & BATTLE_TYPE_LINK))
    {
        BattleStopLowHpSound();
        gBattlescriptCurrInstr = BattleScript_LocalTrainerBattleWon;

        switch (gTrainers[gTrainerBattleOpponent].trainerClass)
        {
        case TRAINER_CLASS_ELITE_FOUR:
        case TRAINER_CLASS_CHAMPION:
            PlayBGM(MUS_KACHI5);
            break;
        case TRAINER_CLASS_TEAM_AQUA:
        case TRAINER_CLASS_TEAM_MAGMA:
        case TRAINER_CLASS_AQUA_ADMIN:
        case TRAINER_CLASS_AQUA_LEADER:
        case TRAINER_CLASS_MAGMA_ADMIN:
        case TRAINER_CLASS_MAGMA_LEADER:
            PlayBGM(MUS_KACHI4);
            break;
        case TRAINER_CLASS_LEADER:
            PlayBGM(MUS_KACHI3);
            break;
        default:
            PlayBGM(MUS_KACHI1);
            break;
        }
    }
    else
    {
        gBattlescriptCurrInstr = BattleScript_PayDayMoneyAndPickUpItems;
    }

    gBattleMainFunc = HandleEndTurn_FinishBattle;
}

void HandleEndTurn_BattleLost(void)
{
    gCurrentActionFuncId = 0;

    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        gBattleTextBuff1[0] = gBattleOutcome;
        gBankAttacker = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
        gBattlescriptCurrInstr = BattleScript_LinkBattleWonOrLost;
        gBattleOutcome &= ~(OUTCOME_LINK_BATTLE_RUN);
    }
    else
    {
        gBattlescriptCurrInstr = BattleScript_LocalBattleLost;
    }

    gBattleMainFunc = HandleEndTurn_FinishBattle;
}

void HandleEndTurn_RanFromBattle(void)
{
    gCurrentActionFuncId = 0;

    switch (gProtectStructs[gBankAttacker].fleeFlag)
    {
    default:
        gBattlescriptCurrInstr = BattleScript_GotAwaySafely;
        break;
    case 1:
        gBattlescriptCurrInstr = BattleScript_SmokeBallEscape;
        break;
    case 2:
        gBattlescriptCurrInstr = BattleScript_RanAwayUsingMonAbility;
        break;
    }

    gBattleMainFunc = HandleEndTurn_FinishBattle;
}

void HandleEndTurn_MonFled(void)
{
    gCurrentActionFuncId = 0;

    PREPARE_MON_NICK_BUFFER(gBattleTextBuff1, gBankAttacker, gBattlerPartyIndexes[gBankAttacker]);
    gBattlescriptCurrInstr = BattleScript_WildMonFled;

    gBattleMainFunc = HandleEndTurn_FinishBattle;
}

void HandleEndTurn_FinishBattle(void)
{
    if (gCurrentActionFuncId == 0xB || gCurrentActionFuncId == 0xC)
    {
        if (!(gBattleTypeFlags & (BATTLE_TYPE_LINK
                                  | BATTLE_TYPE_FIRST_BATTLE
                                  | BATTLE_TYPE_SAFARI
                                  | BATTLE_TYPE_EREADER_TRAINER
                                  | BATTLE_TYPE_WALLY_TUTORIAL
                                  | BATTLE_TYPE_BATTLE_TOWER)))
        {
            for (gActiveBattler = 0; gActiveBattler < gBattlersCount; gActiveBattler++)
            {
                if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
                {
                    if (gBattleResults.poke1Species == SPECIES_NONE)
                    {
                        gBattleResults.poke1Species = gBattleMons[gActiveBattler].species;
                        StringCopy(gBattleResults.pokeString1, gBattleMons[gActiveBattler].nickname);
                    }
                    else
                    {
                        gBattleResults.opponentSpecies = gBattleMons[gActiveBattler].species;
                        StringCopy(gBattleResults.pokeString2, gBattleMons[gActiveBattler].nickname);
                    }
                }
            }
            PutPokemonTodayCaughtOnAir();
        }

        BeginFastPaletteFade(3);
        FadeOutMapMusic(5);
        gBattleMainFunc = FreeResetData_ReturnToOvOrDoEvolutions;
        gCB2_AfterEvolution = BattleMainCB2;
    }
    else
    {
        if (gBattleExecBuffer == 0)
            gBattleScriptingCommandsTable[gBattlescriptCurrInstr[0]]();
    }
}

static void FreeResetData_ReturnToOvOrDoEvolutions(void)
{
    if (!gPaletteFade.active)
    {
        ResetSpriteData();
        if (gLeveledUpInBattle == 0 || gBattleOutcome != BATTLE_WON)
        {
            gBattleMainFunc = ReturnFromBattleToOverworld;
            return;
        }
        else
        {
            gBattleMainFunc = TryEvolvePokemon;
        }
    }
}

void TryEvolvePokemon(void)
{
    s32 i;

    while (gLeveledUpInBattle != 0)
    {
        for (i = 0; i < 6; i++)
        {
            if (gLeveledUpInBattle & gBitTable[i])
            {
                u16 species;
                u8 levelUpBits = gLeveledUpInBattle;

                levelUpBits &= ~(gBitTable[i]);
                gLeveledUpInBattle = levelUpBits;

                species = GetEvolutionTargetSpecies(&gPlayerParty[i], 0, levelUpBits);
                if (species != SPECIES_NONE)
                {
                    gBattleMainFunc = WaitForEvoSceneToFinish;
                    EvolutionScene(&gPlayerParty[i], species, 0x81, i);
                    return;
                }
            }
        }
    }

    gBattleMainFunc = ReturnFromBattleToOverworld;
}

static void WaitForEvoSceneToFinish(void)
{
    if (gMain.callback2 == BattleMainCB2)
        gBattleMainFunc = TryEvolvePokemon;
}

static void ReturnFromBattleToOverworld(void)
{
    if (!(gBattleTypeFlags & BATTLE_TYPE_LINK))
    {
        RandomlyGivePartyPokerus(gPlayerParty);
        PartySpreadPokerus(gPlayerParty);
    }

    if (gBattleTypeFlags & BATTLE_TYPE_LINK && gReceivedRemoteLinkPlayers != 0)
        return;

    gSpecialVar_Result = gBattleOutcome;
    gMain.inBattle = 0;
    gMain.callback1 = gPreBattleCallback1;

    if (gBattleTypeFlags & BATTLE_TYPE_ROAMER)
    {
        UpdateRoamerHPStatus(&gEnemyParty[0]);
        if (gBattleOutcome == BATTLE_WON || gBattleOutcome == BATTLE_CAUGHT)
            SetRoamerInactive();
    }

    m4aSongNumStop(0x5A);
    SetMainCallback2(gMain.savedCallback);
}

void RunBattleScriptCommands_PopCallbacksStack(void)
{
    if (gCurrentActionFuncId == 0xB || gCurrentActionFuncId == 0xC)
    {
        if (B_FUNCTION_STACK->size != 0)
            B_FUNCTION_STACK->size--;
        gBattleMainFunc = B_FUNCTION_STACK->ptr[B_FUNCTION_STACK->size];
    }
    else
    {
        if (gBattleExecBuffer == 0)
            gBattleScriptingCommandsTable[gBattlescriptCurrInstr[0]]();
    }
}

void RunBattleScriptCommands(void)
{
    if (gBattleExecBuffer == 0)
        gBattleScriptingCommandsTable[gBattlescriptCurrInstr[0]]();
}

void HandleAction_UseMove(void)
{
    u8 side;
    u8 var = 4;

    gBankAttacker = gBanksByTurnOrder[gCurrentTurnActionNumber];

    if (ewram160A6 & gBitTable[gBankAttacker])
    {
        gCurrentActionFuncId = ACTION_FINISHED;
        return;
    }

    gCritMultiplier = 1;
    eDmgMultiplier = 1;
    ewram160E7 = 0;
    gMoveResultFlags = 0;
    gMultiHitCounter = 0;
    gBattleCommunication[6] = 0;
    gCurrMovePos = gUnknown_02024BE5 = ewram1608Carr(gBankAttacker);

    // choose move
    if (gProtectStructs[gBankAttacker].onlyStruggle)
    {
        gProtectStructs[gBankAttacker].onlyStruggle = 0;
        gCurrentMove = gChosenMove = MOVE_STRUGGLE;
        gHitMarker |= HITMARKER_NO_PPDEDUCT;
        ewram16010arr(gBankAttacker) = GetMoveTarget(MOVE_STRUGGLE, 0);
    }
    else if (gBattleMons[gBankAttacker].status2 & STATUS2_MULTIPLETURNS || gBattleMons[gBankAttacker].status2 & STATUS2_RECHARGE)
    {
        gCurrentMove = gChosenMove = gLockedMoves[gBankAttacker];
    }
    // encore forces you to use the same move
    else if (gDisableStructs[gBankAttacker].encoredMove != MOVE_NONE
             && gDisableStructs[gBankAttacker].encoredMove == gBattleMons[gBankAttacker].moves[gDisableStructs[gBankAttacker].encoredMovePos])
    {
        gCurrentMove = gChosenMove = gDisableStructs[gBankAttacker].encoredMove;
        gCurrMovePos = gUnknown_02024BE5 = gDisableStructs[gBankAttacker].encoredMovePos;
        ewram16010arr(gBankAttacker) = GetMoveTarget(gCurrentMove, 0);
    }
    // check if the encored move wasn't overwritten
    else if (gDisableStructs[gBankAttacker].encoredMove != MOVE_NONE
             && gDisableStructs[gBankAttacker].encoredMove != gBattleMons[gBankAttacker].moves[gDisableStructs[gBankAttacker].encoredMovePos])
    {
        gCurrMovePos = gUnknown_02024BE5 = gDisableStructs[gBankAttacker].encoredMovePos;
        gCurrentMove = gChosenMove = gBattleMons[gBankAttacker].moves[gCurrMovePos];
        gDisableStructs[gBankAttacker].encoredMove = MOVE_NONE;
        gDisableStructs[gBankAttacker].encoredMovePos = 0;
        gDisableStructs[gBankAttacker].encoreTimer1 = 0;
        ewram16010arr(gBankAttacker) = GetMoveTarget(gCurrentMove, 0);
    }
    else if (gBattleMons[gBankAttacker].moves[gCurrMovePos] != gChosenMovesByBanks[gBankAttacker])
    {
        gCurrentMove = gChosenMove = gBattleMons[gBankAttacker].moves[gCurrMovePos];
        ewram16010arr(gBankAttacker) = GetMoveTarget(gCurrentMove, 0);
    }
    else
    {
        gCurrentMove = gChosenMove = gBattleMons[gBankAttacker].moves[gCurrMovePos];
    }

    if (GetBattlerSide(gBankAttacker) == B_SIDE_PLAYER)
        gBattleResults.lastUsedMove = gCurrentMove;
    else
        gBattleResults.opponentMove = gCurrentMove;

    // choose target
    side = GetBattlerSide(gBankAttacker) ^ BIT_SIDE;
    if (gSideTimers[side].followmeTimer != 0
        && gBattleMoves[gCurrentMove].target == MOVE_TARGET_SELECTED
        && GetBattlerSide(gBankAttacker) != GetBattlerSide(gSideTimers[side].followmeTarget)
        && gBattleMons[gSideTimers[side].followmeTarget].hp != 0)
    {
        gBankTarget = gSideTimers[side].followmeTarget;
    }
    else if ((gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
             && gSideTimers[side].followmeTimer == 0
             && (gBattleMoves[gCurrentMove].power != 0
                 || gBattleMoves[gCurrentMove].target != MOVE_TARGET_x10)
             && gBattleMons[ewram16010arr(gBankAttacker)].ability != ABILITY_LIGHTNING_ROD
             && gBattleMoves[gCurrentMove].type == TYPE_ELECTRIC)
    {
        side = GetBattlerSide(gBankAttacker);
        for (gActiveBattler = 0; gActiveBattler < gBattlersCount; gActiveBattler++)
        {
            if (side != GetBattlerSide(gActiveBattler)
                && ewram16010arr(gBankAttacker) != gActiveBattler
                && gBattleMons[gActiveBattler].ability == ABILITY_LIGHTNING_ROD
                && BankGetTurnOrder(gActiveBattler) < var)
            {
                var = BankGetTurnOrder(gActiveBattler);
            }
        }
        if (var == 4)
        {
            if (gBattleMoves[gChosenMove].target & MOVE_TARGET_RANDOM)
            {
                if (GetBattlerSide(gBankAttacker) == B_SIDE_PLAYER)
                {
                    if (Random() & 1)
                        gBankTarget = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
                    else
                        gBankTarget = GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT);
                }
                else
                {
                    if (Random() & 1)
                        gBankTarget = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
                    else
                        gBankTarget = GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT);
                }
            }
            else
            {
                gBankTarget = ewram16010arr(gBankAttacker);
            }

            if (gAbsentBattlerFlags & gBitTable[gBankTarget])
            {
                if (GetBattlerSide(gBankAttacker) != GetBattlerSide(gBankTarget))
                {
                    gBankTarget = GetBattlerAtPosition(GetBattlerPosition(gBankTarget) ^ BIT_FLANK);
                }
                else
                {
                    gBankTarget = GetBattlerAtPosition(GetBattlerPosition(gBankAttacker) ^ BIT_SIDE);
                    if (gAbsentBattlerFlags & gBitTable[gBankTarget])
                        gBankTarget = GetBattlerAtPosition(GetBattlerPosition(gBankTarget) ^ BIT_FLANK);
                }
            }
        }
        else
        {
            gActiveBattler = gBanksByTurnOrder[var];
            RecordAbilityBattle(gActiveBattler, gBattleMons[gActiveBattler].ability);
            gSpecialStatuses[gActiveBattler].lightningRodRedirected = 1;
            gBankTarget = gActiveBattler;
        }
    }
    else if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE
             && gBattleMoves[gChosenMove].target & MOVE_TARGET_RANDOM)
    {
        if (GetBattlerSide(gBankAttacker) == B_SIDE_PLAYER)
        {
            if (Random() & 1)
                gBankTarget = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
            else
                gBankTarget = GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT);
        }
        else
        {
            if (Random() & 1)
                gBankTarget = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
            else
                gBankTarget = GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT);
        }

        if (gAbsentBattlerFlags & gBitTable[gBankTarget]
            && GetBattlerSide(gBankAttacker) != GetBattlerSide(gBankTarget))
        {
            gBankTarget = GetBattlerAtPosition(GetBattlerPosition(gBankTarget) ^ BIT_FLANK);
        }
    }
    else
    {
        gBankTarget = ewram16010arr(gBankAttacker);
        if (gAbsentBattlerFlags & gBitTable[gBankTarget])
        {
            if (GetBattlerSide(gBankAttacker) != GetBattlerSide(gBankTarget))
            {
                gBankTarget = GetBattlerAtPosition(GetBattlerPosition(gBankTarget) ^ BIT_FLANK);
            }
            else
            {
                gBankTarget = GetBattlerAtPosition(GetBattlerPosition(gBankAttacker) ^ BIT_SIDE);
                if (gAbsentBattlerFlags & gBitTable[gBankTarget])
                    gBankTarget = GetBattlerAtPosition(GetBattlerPosition(gBankTarget) ^ BIT_FLANK);
            }
        }
    }

    gBattlescriptCurrInstr = gBattleScriptsForMoveEffects[gBattleMoves[gCurrentMove].effect];
    gCurrentActionFuncId = ACTION_RUN_BATTLESCRIPT;
}

void HandleAction_Switch(void)
{
    gBankAttacker = gBanksByTurnOrder[gCurrentTurnActionNumber];
    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    gActionSelectionCursor[gBankAttacker] = 0;
    gMoveSelectionCursor[gBankAttacker] = 0;

    PREPARE_MON_NICK_BUFFER(gBattleTextBuff1, gBankAttacker, ewram16064arr(gBankAttacker))

    ewram16003 = gBankAttacker;
    gBattlescriptCurrInstr = BattleScript_ActionSwitch;
    gCurrentActionFuncId = ACTION_RUN_BATTLESCRIPT;

    if (gBattleResults.unk2 < 255)
        gBattleResults.unk2++;
}

#ifdef NONMATCHING
void HandleAction_UseItem(void)
{
    gBankAttacker = gBankTarget = gBanksByTurnOrder[gCurrentTurnActionNumber];
    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    gDisableStructs[gBankAttacker].furyCutterCounter = 0;
    gLastUsedItem = gBattleBufferB[gBankAttacker][1] | (gBattleBufferB[gBankAttacker][2] << 8);

    if (gLastUsedItem <= ITEM_PREMIER_BALL) // is ball
    {
        gBattlescriptCurrInstr = gBattlescriptsForBallThrow[gLastUsedItem];
    }
    else if (gLastUsedItem == ITEM_POKE_DOLL || gLastUsedItem == ITEM_FLUFFY_TAIL)
    {
        gBattlescriptCurrInstr = gBattlescriptsForRunningByItem[0];
    }
    else if (GetBattlerSide(gBankAttacker) == B_SIDE_PLAYER)
    {
        gBattlescriptCurrInstr = gBattlescriptsForUsingItem[0];
    }
    else
    {

        switch (ewram160D8((ewram16003 = gBankAttacker)))
        {
        case AI_ITEM_FULL_RESTORE:
        case AI_ITEM_HEAL_HP:
            break;
        case AI_ITEM_CURE_CONDITION:
            gBattleCommunication[MULTISTRING_CHOOSER] = 0;
            if (ewram160DA(gBankAttacker) & 1)
            {
                if (ewram160DA(gBankAttacker) & 0x3E)
                    gBattleCommunication[MULTISTRING_CHOOSER] = 5;
            }
            else
            {
                while (!(ewram160DA(gBankAttacker) & 1))
                {
                    ewram160DA(gBankAttacker) /= 2;
                    gBattleCommunication[MULTISTRING_CHOOSER]++;
                }
            }
            break;
        case AI_ITEM_X_STAT:
            gBattleCommunication[MULTISTRING_CHOOSER] = 4;
            if (ewram160DA(gBankAttacker) & 0x80)
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = 5;
            }
            else
            {
                PREPARE_STAT_BUFFER(gBattleTextBuff1, STAT_ATK)
                PREPARE_STRING_BUFFER(gBattleTextBuff2, 0xD2)

                while (!(ewram160DA(gBankAttacker) & 1))
                {
                    ewram160DA(gBankAttacker) /= 2;
                    gBattleTextBuff1[2]++;
                }

                ewram160A4 = gBattleTextBuff1[2] + 14;
                ewram160A5 = 0;
            }
            break;
        case AI_ITEM_GUARD_SPECS:
            if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
                gBattleCommunication[MULTISTRING_CHOOSER] = 2;
            else
                gBattleCommunication[MULTISTRING_CHOOSER] = 0;
            break;
        }

        gBattlescriptCurrInstr = gBattlescriptsForUsingItem[ewram160D8(gBankAttacker)];
    }
    gCurrentActionFuncId = ACTION_RUN_BATTLESCRIPT;
}
#else
NAKED
void HandleAction_UseItem(void)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    ldr r4, _08014804 @ =gBankAttacker\n\
    ldr r2, _08014808 @ =gBankTarget\n\
    ldr r1, _0801480C @ =gBanksByTurnOrder\n\
    ldr r0, _08014810 @ =gCurrentTurnActionNumber\n\
    ldrb r0, [r0]\n\
    adds r0, r1\n\
    ldrb r0, [r0]\n\
    strb r0, [r2]\n\
    strb r0, [r4]\n\
    ldr r0, _08014814 @ =gBattle_BG0_X\n\
    movs r2, 0\n\
    strh r2, [r0]\n\
    ldr r0, _08014818 @ =gBattle_BG0_Y\n\
    strh r2, [r0]\n\
    ldr r3, _0801481C @ =gDisableStructs\n\
    ldrb r1, [r4]\n\
    lsls r0, r1, 3\n\
    subs r0, r1\n\
    lsls r0, 2\n\
    adds r0, r3\n\
    strb r2, [r0, 0x10]\n\
    ldr r5, _08014820 @ =gLastUsedItem\n\
    ldr r2, _08014824 @ =gBattleBufferB\n\
    ldrb r1, [r4]\n\
    lsls r1, 9\n\
    adds r0, r2, 0x1\n\
    adds r0, r1, r0\n\
    ldrb r3, [r0]\n\
    adds r2, 0x2\n\
    adds r1, r2\n\
    ldrb r0, [r1]\n\
    lsls r0, 8\n\
    orrs r3, r0\n\
    strh r3, [r5]\n\
    cmp r3, 0xC\n\
    bhi _08014830\n\
    ldr r2, _08014828 @ =gBattlescriptCurrInstr\n\
    ldr r1, _0801482C @ =gBattlescriptsForBallThrow\n\
    ldrh r0, [r5]\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    str r0, [r2]\n\
    b _08014A8C\n\
    .align 2, 0\n\
_08014804: .4byte gBankAttacker\n\
_08014808: .4byte gBankTarget\n\
_0801480C: .4byte gBanksByTurnOrder\n\
_08014810: .4byte gCurrentTurnActionNumber\n\
_08014814: .4byte gBattle_BG0_X\n\
_08014818: .4byte gBattle_BG0_Y\n\
_0801481C: .4byte gDisableStructs\n\
_08014820: .4byte gLastUsedItem\n\
_08014824: .4byte gBattleBufferB\n\
_08014828: .4byte gBattlescriptCurrInstr\n\
_0801482C: .4byte gBattlescriptsForBallThrow\n\
_08014830:\n\
    adds r0, r3, 0\n\
    subs r0, 0x50\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    cmp r0, 0x1\n\
    bhi _0801484C\n\
    ldr r0, _08014844 @ =gBattlescriptCurrInstr\n\
    ldr r1, _08014848 @ =gBattlescriptsForRunningByItem\n\
    b _0801485C\n\
    .align 2, 0\n\
_08014844: .4byte gBattlescriptCurrInstr\n\
_08014848: .4byte gBattlescriptsForRunningByItem\n\
_0801484C:\n\
    ldrb r0, [r4]\n\
    bl GetBattlerSide\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _0801486C\n\
    ldr r0, _08014864 @ =gBattlescriptCurrInstr\n\
    ldr r1, _08014868 @ =gBattlescriptsForUsingItem\n\
_0801485C:\n\
    ldr r1, [r1]\n\
    str r1, [r0]\n\
    b _08014A8C\n\
    .align 2, 0\n\
_08014864: .4byte gBattlescriptCurrInstr\n\
_08014868: .4byte gBattlescriptsForUsingItem\n\
_0801486C:\n\
    ldr r2, _080148A0 @ =gSharedMem\n\
    ldrb r0, [r4]\n\
    ldr r3, _080148A4 @ =0x00016003\n\
    adds r1, r2, r3\n\
    strb r0, [r1]\n\
    lsls r0, 24\n\
    lsrs r0, 25\n\
    ldr r1, _080148A8 @ =0x000160d8\n\
    adds r0, r1\n\
    adds r0, r2\n\
    ldrb r0, [r0]\n\
    subs r0, 0x1\n\
    mov r8, r4\n\
    ldr r3, _080148AC @ =gBattlescriptCurrInstr\n\
    mov r9, r3\n\
    ldr r1, _080148B0 @ =gBattlescriptsForUsingItem\n\
    mov r10, r1\n\
    adds r7, r2, 0\n\
    cmp r0, 0x4\n\
    bls _08014896\n\
    b _08014A74\n\
_08014896:\n\
    lsls r0, 2\n\
    ldr r1, _080148B4 @ =_080148B8\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_080148A0: .4byte gSharedMem\n\
_080148A4: .4byte 0x00016003\n\
_080148A8: .4byte 0x000160d8\n\
_080148AC: .4byte gBattlescriptCurrInstr\n\
_080148B0: .4byte gBattlescriptsForUsingItem\n\
_080148B4: .4byte _080148B8\n\
    .align 2, 0\n\
_080148B8:\n\
    .4byte _08014A74\n\
    .4byte _08014A74\n\
    .4byte _080148CC\n\
    .4byte _08014958\n\
    .4byte _08014A30\n\
_080148CC:\n\
    ldr r2, _08014904 @ =gBattleCommunication\n\
    movs r0, 0\n\
    strb r0, [r2, 0x5]\n\
    ldr r1, _08014908 @ =gBankAttacker\n\
    ldrb r0, [r1]\n\
    lsrs r0, 1\n\
    ldr r6, _0801490C @ =0x000160da\n\
    adds r0, r6\n\
    adds r0, r7\n\
    ldrb r3, [r0]\n\
    movs r0, 0x1\n\
    ands r0, r3\n\
    mov r8, r1\n\
    cmp r0, 0\n\
    beq _08014918\n\
    movs r0, 0x3E\n\
    ands r0, r3\n\
    ldr r3, _08014910 @ =gBattlescriptCurrInstr\n\
    mov r9, r3\n\
    ldr r1, _08014914 @ =gBattlescriptsForUsingItem\n\
    mov r10, r1\n\
    cmp r0, 0\n\
    bne _080148FC\n\
    b _08014A74\n\
_080148FC:\n\
    movs r0, 0x5\n\
    strb r0, [r2, 0x5]\n\
    b _08014A74\n\
    .align 2, 0\n\
_08014904: .4byte gBattleCommunication\n\
_08014908: .4byte gBankAttacker\n\
_0801490C: .4byte 0x000160da\n\
_08014910: .4byte gBattlescriptCurrInstr\n\
_08014914: .4byte gBattlescriptsForUsingItem\n\
_08014918:\n\
    ldr r3, _08014950 @ =gBattlescriptCurrInstr\n\
    mov r9, r3\n\
    ldr r0, _08014954 @ =gBattlescriptsForUsingItem\n\
    mov r10, r0\n\
    adds r5, r7, 0\n\
    mov r4, r8\n\
    adds r3, r6, 0\n\
_08014926:\n\
    ldrb r0, [r4]\n\
    lsrs r0, 1\n\
    adds r0, r3\n\
    adds r0, r5\n\
    ldrb r1, [r0]\n\
    lsrs r1, 1\n\
    strb r1, [r0]\n\
    ldrb r0, [r2, 0x5]\n\
    adds r0, 0x1\n\
    strb r0, [r2, 0x5]\n\
    ldrb r0, [r4]\n\
    lsrs r0, 1\n\
    adds r0, r3\n\
    adds r0, r5\n\
    ldrb r1, [r0]\n\
    movs r0, 0x1\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _08014926\n\
    b _08014A74\n\
    .align 2, 0\n\
_08014950: .4byte gBattlescriptCurrInstr\n\
_08014954: .4byte gBattlescriptsForUsingItem\n\
_08014958:\n\
    ldr r3, _0801498C @ =gBattleCommunication\n\
    movs r0, 0x4\n\
    strb r0, [r3, 0x5]\n\
    ldr r2, _08014990 @ =gBankAttacker\n\
    ldrb r0, [r2]\n\
    lsrs r0, 1\n\
    ldr r1, _08014994 @ =0x000160da\n\
    mov r12, r1\n\
    add r0, r12\n\
    adds r6, r0, r7\n\
    ldrb r1, [r6]\n\
    movs r0, 0x80\n\
    ands r0, r1\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    mov r8, r2\n\
    cmp r5, 0\n\
    beq _080149A0\n\
    movs r0, 0x5\n\
    strb r0, [r3, 0x5]\n\
    ldr r2, _08014998 @ =gBattlescriptCurrInstr\n\
    mov r9, r2\n\
    ldr r3, _0801499C @ =gBattlescriptsForUsingItem\n\
    mov r10, r3\n\
    b _08014A74\n\
    .align 2, 0\n\
_0801498C: .4byte gBattleCommunication\n\
_08014990: .4byte gBankAttacker\n\
_08014994: .4byte 0x000160da\n\
_08014998: .4byte gBattlescriptCurrInstr\n\
_0801499C: .4byte gBattlescriptsForUsingItem\n\
_080149A0:\n\
    ldr r3, _08014A18 @ =gBattleTextBuff1\n\
    movs r4, 0xFD\n\
    strb r4, [r3]\n\
    movs r0, 0x5\n\
    strb r0, [r3, 0x1]\n\
    movs r2, 0x1\n\
    strb r2, [r3, 0x2]\n\
    movs r0, 0xFF\n\
    strb r0, [r3, 0x3]\n\
    ldr r1, _08014A1C @ =gBattleTextBuff2\n\
    strb r4, [r1]\n\
    strb r5, [r1, 0x1]\n\
    movs r0, 0xD2\n\
    strb r0, [r1, 0x2]\n\
    strb r5, [r1, 0x3]\n\
    subs r0, 0xD3\n\
    strb r0, [r1, 0x4]\n\
    ldrb r0, [r6]\n\
    ands r2, r0\n\
    ldr r0, _08014A20 @ =gBattlescriptCurrInstr\n\
    mov r9, r0\n\
    ldr r1, _08014A24 @ =gBattlescriptsForUsingItem\n\
    mov r10, r1\n\
    adds r6, r3, 0\n\
    cmp r2, 0\n\
    bne _08014A02\n\
    adds r3, r7, 0\n\
    mov r5, r8\n\
    mov r4, r12\n\
    adds r2, r6, 0\n\
_080149DC:\n\
    ldrb r0, [r5]\n\
    lsrs r0, 1\n\
    adds r0, r4\n\
    adds r0, r3\n\
    ldrb r1, [r0]\n\
    lsrs r1, 1\n\
    strb r1, [r0]\n\
    ldrb r0, [r2, 0x2]\n\
    adds r0, 0x1\n\
    strb r0, [r2, 0x2]\n\
    ldrb r0, [r5]\n\
    lsrs r0, 1\n\
    adds r0, r4\n\
    adds r0, r3\n\
    ldrb r1, [r0]\n\
    movs r0, 0x1\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080149DC\n\
_08014A02:\n\
    ldrb r0, [r6, 0x2]\n\
    adds r0, 0xE\n\
    ldr r2, _08014A28 @ =0x000160a4\n\
    adds r1, r7, r2\n\
    movs r2, 0\n\
    strb r0, [r1]\n\
    ldr r3, _08014A2C @ =0x000160a5\n\
    adds r0, r7, r3\n\
    strb r2, [r0]\n\
    b _08014A74\n\
    .align 2, 0\n\
_08014A18: .4byte gBattleTextBuff1\n\
_08014A1C: .4byte gBattleTextBuff2\n\
_08014A20: .4byte gBattlescriptCurrInstr\n\
_08014A24: .4byte gBattlescriptsForUsingItem\n\
_08014A28: .4byte 0x000160a4\n\
_08014A2C: .4byte 0x000160a5\n\
_08014A30:\n\
    ldr r0, _08014A50 @ =gBattleTypeFlags\n\
    ldrh r0, [r0]\n\
    movs r1, 0x1\n\
    ands r1, r0\n\
    cmp r1, 0\n\
    beq _08014A64\n\
    ldr r1, _08014A54 @ =gBattleCommunication\n\
    movs r0, 0x2\n\
    strb r0, [r1, 0x5]\n\
    ldr r0, _08014A58 @ =gBankAttacker\n\
    mov r8, r0\n\
    ldr r1, _08014A5C @ =gBattlescriptCurrInstr\n\
    mov r9, r1\n\
    ldr r2, _08014A60 @ =gBattlescriptsForUsingItem\n\
    mov r10, r2\n\
    b _08014A74\n\
    .align 2, 0\n\
_08014A50: .4byte gBattleTypeFlags\n\
_08014A54: .4byte gBattleCommunication\n\
_08014A58: .4byte gBankAttacker\n\
_08014A5C: .4byte gBattlescriptCurrInstr\n\
_08014A60: .4byte gBattlescriptsForUsingItem\n\
_08014A64:\n\
    ldr r0, _08014AA0 @ =gBattleCommunication\n\
    strb r1, [r0, 0x5]\n\
    ldr r3, _08014AA4 @ =gBankAttacker\n\
    mov r8, r3\n\
    ldr r0, _08014AA8 @ =gBattlescriptCurrInstr\n\
    mov r9, r0\n\
    ldr r1, _08014AAC @ =gBattlescriptsForUsingItem\n\
    mov r10, r1\n\
_08014A74:\n\
    mov r2, r8\n\
    ldrb r0, [r2]\n\
    lsrs r0, 1\n\
    ldr r3, _08014AB0 @ =0x000160d8\n\
    adds r0, r3\n\
    adds r0, r7\n\
    ldrb r0, [r0]\n\
    lsls r0, 2\n\
    add r0, r10\n\
    ldr r0, [r0]\n\
    mov r1, r9\n\
    str r0, [r1]\n\
_08014A8C:\n\
    movs r0, 0xA\n\
    ldr r2, _08014AB4 @ =gCurrentActionFuncId\n\
    strb r0, [r2]\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08014AA0: .4byte gBattleCommunication\n\
_08014AA4: .4byte gBankAttacker\n\
_08014AA8: .4byte gBattlescriptCurrInstr\n\
_08014AAC: .4byte gBattlescriptsForUsingItem\n\
_08014AB0: .4byte 0x000160d8\n\
_08014AB4: .4byte gCurrentActionFuncId\n\
    .syntax divided\n");
}
#endif // NONMATCHING

bool8 TryRunFromBattle(u8 bank)
{
    bool8 effect = FALSE;
    u8 holdEffect;
    u8 speedVar;

    if (gBattleMons[bank].item == ITEM_ENIGMA_BERRY)
        holdEffect = gEnigmaBerries[bank].holdEffect;
    else
        holdEffect = ItemId_GetHoldEffect(gBattleMons[bank].item);

    gStringBank = bank;

    if (holdEffect == HOLD_EFFECT_CAN_ALWAYS_RUN)
    {
        gLastUsedItem = gBattleMons[bank].item ;
        gProtectStructs[bank].fleeFlag = 1;
        effect++;
    }
    else if (gBattleMons[bank].ability == ABILITY_RUN_AWAY)
    {
        gLastUsedAbility = ABILITY_RUN_AWAY;
        gProtectStructs[bank].fleeFlag = 2;
        effect++;
    }
    else
    {
        if (!(gBattleTypeFlags & BATTLE_TYPE_DOUBLE))
        {
            if (gBattleMons[bank].speed < gBattleMons[bank ^ BIT_SIDE].speed)
            {
                speedVar = (gBattleMons[bank].speed * 128) / (gBattleMons[bank ^ BIT_SIDE].speed) + (ewram16078 * 30);
                if (speedVar > (Random() & 0xFF))
                    effect++;
            }
            else // same speed or faster
            {
                effect++;
            }
        }

        ewram16078++;
    }

    if (effect)
    {
        gCurrentTurnActionNumber = gBattlersCount;
        gBattleOutcome = BATTLE_RAN;
    }

    return effect;
}

void HandleAction_Run(void)
{
    gBankAttacker = gBanksByTurnOrder[gCurrentTurnActionNumber];

    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        gCurrentTurnActionNumber = gBattlersCount;

        for (gActiveBattler = 0; gActiveBattler < gBattlersCount; gActiveBattler++)
        {
            if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
            {
                if (gActionForBanks[gActiveBattler] == ACTION_RUN)
                    gBattleOutcome |= BATTLE_LOST;
            }
            else
            {
                if (gActionForBanks[gActiveBattler] == ACTION_RUN)
                    gBattleOutcome |= BATTLE_WON;
            }
        }

        gBattleOutcome |= OUTCOME_LINK_BATTLE_RUN;
    }
    else
    {
        if (GetBattlerSide(gBankAttacker) == B_SIDE_PLAYER)
        {
            if (!TryRunFromBattle(gBankAttacker)) // failed to run away
            {
                gBattleMons[gBankAttacker].status2 &= ~STATUS2_DESTINY_BOND;
                gBattleCommunication[MULTISTRING_CHOOSER] = 3;
                gBattlescriptCurrInstr = BattleScript_PrintFailedToRunString;
                gCurrentActionFuncId = ACTION_RUN_BATTLESCRIPT;
            }
        }
        else
        {
            if (gBattleMons[gBankAttacker].status2 & (STATUS2_WRAPPED | STATUS2_ESCAPE_PREVENTION))
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = 4;
                gBattlescriptCurrInstr = BattleScript_PrintFailedToRunString;
                gCurrentActionFuncId = ACTION_RUN_BATTLESCRIPT;
            }
            else
            {
                gCurrentTurnActionNumber = gBattlersCount;
                gBattleOutcome = BATTLE_POKE_FLED;
            }
        }
    }
}

void HandleAction_WatchesCarefully(void)
{
    gBankAttacker = gBanksByTurnOrder[gCurrentTurnActionNumber];
    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    gBattlescriptCurrInstr = gBattlescriptsForSafariActions[0];
    gCurrentActionFuncId = ACTION_RUN_BATTLESCRIPT;
}

void HandleAction_SafariZoneBallThrow(void)
{
    gBankAttacker = gBanksByTurnOrder[gCurrentTurnActionNumber];
    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    gNumSafariBalls--;
    gLastUsedItem = ITEM_SAFARI_BALL;
    gBattlescriptCurrInstr = gBattlescriptsForBallThrow[ITEM_SAFARI_BALL];
    gCurrentActionFuncId = ACTION_RUN_BATTLESCRIPT;
}

void HandleAction_ThrowPokeblock(void)
{
    gBankAttacker = gBanksByTurnOrder[gCurrentTurnActionNumber];
    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    gBattleCommunication[MULTISTRING_CHOOSER] = gBattleBufferB[gBankAttacker][1] - 1;
    gLastUsedItem = gBattleBufferB[gBankAttacker][2];

    if (ewram16087 < 3)
        ewram16087++;
    if (ewram16088 > 1)
    {
        if (ewram16088 < gUnknown_081FA70C[ewram16087][gBattleCommunication[MULTISTRING_CHOOSER]])
            ewram16088 = 1;
        else
            ewram16088 -= gUnknown_081FA70C[ewram16087][gBattleCommunication[MULTISTRING_CHOOSER]];
    }

    gBattlescriptCurrInstr = gBattlescriptsForSafariActions[2];
    gCurrentActionFuncId = ACTION_RUN_BATTLESCRIPT;
}

void HandleAction_GoNear(void)
{
    gBankAttacker = gBanksByTurnOrder[gCurrentTurnActionNumber];
    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;

    ewram16089 += gUnknown_081FA71B[ewram16086];
    if (ewram16089 > 20)
        ewram16089 = 20;

    ewram16088 += gUnknown_081FA71F[ewram16086];
    if (ewram16088 > 20)
        ewram16088 = 20;

    if (ewram16086 < 3)
    {
        ewram16086++;
        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
    }
    else
    {
        gBattleCommunication[MULTISTRING_CHOOSER] = 1;
    }
    gBattlescriptCurrInstr = gBattlescriptsForSafariActions[1];
    gCurrentActionFuncId = ACTION_RUN_BATTLESCRIPT;
}

void HandleAction_SafriZoneRun(void)
{
    gBankAttacker = gBanksByTurnOrder[gCurrentTurnActionNumber];
    PlaySE(SE_NIGERU);
    gCurrentTurnActionNumber = gBattlersCount;
    gBattleOutcome = BATTLE_RAN;
}

void HandleAction_Action9(void)
{
    gBankAttacker = gBanksByTurnOrder[gCurrentTurnActionNumber];
    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;

    PREPARE_MON_NICK_BUFFER(gBattleTextBuff1, gBankAttacker, gBattlerPartyIndexes[gBankAttacker])

    gBattlescriptCurrInstr = gBattlescriptsForSafariActions[3];
    gCurrentActionFuncId = ACTION_RUN_BATTLESCRIPT;
    gActionsByTurnOrder[1] = ACTION_FINISHED;
}

void HandleAction_Action11(void)
{
    if (!HandleFaintedMonActions())
    {
        ewram16059 = 0;
        gCurrentActionFuncId = ACTION_FINISHED;
    }
}

void HandleAction_NothingIsFainted(void)
{
    gCurrentTurnActionNumber++;
    gCurrentActionFuncId = gActionsByTurnOrder[gCurrentTurnActionNumber];
    gHitMarker &= ~(HITMARKER_DESTINYBOND | HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_ATTACKSTRING_PRINTED
                    | HITMARKER_NO_PPDEDUCT | HITMARKER_IGNORE_SAFEGUARD | HITMARKER_IGNORE_ON_AIR
                    | HITMARKER_IGNORE_UNDERGROUND | HITMARKER_IGNORE_UNDERWATER | HITMARKER_x100000
                    | HITMARKER_OBEYS | HITMARKER_x10 | HITMARKER_SYNCHRONISE_EFFECT
                    | HITMARKER_x8000000 | HITMARKER_x4000000);
}

void HandleAction_ActionFinished(void)
{
    gCurrentTurnActionNumber++;
    gCurrentActionFuncId = gActionsByTurnOrder[gCurrentTurnActionNumber];
    SpecialStatusesClear();
    gHitMarker &= ~(HITMARKER_DESTINYBOND | HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_ATTACKSTRING_PRINTED
                    | HITMARKER_NO_PPDEDUCT | HITMARKER_IGNORE_SAFEGUARD | HITMARKER_IGNORE_ON_AIR
                    | HITMARKER_IGNORE_UNDERGROUND | HITMARKER_IGNORE_UNDERWATER | HITMARKER_x100000
                    | HITMARKER_OBEYS | HITMARKER_x10 | HITMARKER_SYNCHRONISE_EFFECT
                    | HITMARKER_x8000000 | HITMARKER_x4000000);

    gBattleMoveDamage = 0;
    ewram16002 = 0;
    ewram160A1 = 0;
    gLastLandedMoves[gBankAttacker] = 0;
    gLastHitByType[gBankAttacker] = 0;
    eDynamicMoveType = 0;
    gDynamicBasePower = 0;
    ewram1600C = 0;
    gBattleCommunication[3] = 0;
    gBattleCommunication[4] = 0;
    eMultihitMoveEffect = 0;
    ewram17130 = 0;
}
