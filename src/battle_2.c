#include "global.h"
#include "battle.h"
#include "main.h"
#include "text.h"
#include "palette.h"
#include "sprite.h"
#include "task.h"
#include "pokemon.h"
#include "species.h"
#include "link.h"
#include "name_string_util.h"
#include "battle_setup.h"

struct UnknownStruct5
{
    u32 unk0;
    u32 unk4;
    u32 unk8;
};

struct UnknownStruct6
{
    u16 unk0[0xA0];
    u8 fillerA0[0x640];
    u16 unk780[0xA0];
};

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

struct UnknownPokemonStruct2
{
    /*0x00*/ u16 species;
    /*0x02*/ u16 heldItem;
    /*0x04*/ u8 nickname[11];
    /*0x0F*/ u8 level;
    /*0x10*/ u16 hp;
    /*0x12*/ u16 maxhp;
    /*0x14*/ u32 status;
    /*0x18*/ u32 personality;
    /*0x1C*/ u8 gender;
    /*0x1D*/ u8 language;
};

extern const struct UnknownStruct5 gUnknown_081F9674;
extern const u8 gUnknown_081F96C8[];
extern const struct Trainer gTrainers[];
extern const u8 gSpeciesNames[][11];
extern const struct BattleMove gBattleMoves[];

extern u8 ewram[];
#define ewram0 (*(struct UnknownStruct7 *)(ewram + 0x0))
#define ewram4 (*(struct UnknownStruct8 *)(ewram + 0x4))
#define ewram160CB (ewram[0x160CB])
#define ewram1D000 ((struct Pokemon *)(ewram + 0x1D000))

extern struct UnknownPokemonStruct2 gUnknown_02023A00[];
extern u8 gUnknown_02024D1E[];
extern u8 gUnknown_02024D1F[];  // I don't actually know what type this is.
extern u16 gUnknown_030041B0;
extern u16 gUnknown_030041B4;
extern u16 gUnknown_030041B8;
extern struct Window gUnknown_030041D0;
extern struct Window gUnknown_03004210;
extern struct Window gUnknown_03004250;
extern u16 gUnknown_03004240;
extern u16 gUnknown_03004280;
extern u16 gUnknown_03004288;
extern u16 gUnknown_030042A0;
extern u16 gUnknown_030042A4;
extern u16 gUnknown_030042C0;
extern u16 gUnknown_030042C4;
extern MainCallback gUnknown_030042D0;
extern struct UnknownStruct6 gUnknown_03004DE0;
//extern u16 gUnknown_03004DE0[][0xA0];  // possibly?
extern u16 gBattleTypeFlags;
extern s8 gBattleTerrain;  // I'm not sure if this is supposed to be s8 or u8. Regardless, it must have the same type as the return value of GetBattleTerrain.
extern u8 gReservedSpritePaletteCount;
extern u16 gTrainerBattleOpponent;
extern struct BattleEnigmaBerry gEnigmaBerries[];
extern u16 gBlockRecvBuffer[MAX_LINK_PLAYERS][BLOCK_BUFFER_SIZE / 2];

extern void sub_800B858(void);
extern void dp12_8087EA4(void);
extern void sub_80895F8();
extern void sub_800D6D4();
extern void sub_800DAB8();
extern void sub_800E23C();
extern void setup_poochyena_battle();
extern void SetWildMonHeldItem(void);
extern void AdjustFriendship(struct Pokemon *, u8);
extern void sub_800DE30(u8);
extern void sub_800B950(void);
extern u8 battle_load_something();
extern void OpenPartyMenu();

void sub_800E7F8(void);
void sub_800EC9C(void);
void sub_800F104(void);
void sub_800F298(void);
void sub_800F808(void);
void sub_800F838(struct Sprite *);
u8 CreateNPCTrainerParty(struct Pokemon *, u16);
void sub_800FCFC(void);
void sub_8010824(void);

void sub_800E7C4(void)
{
    if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
    {
        sub_800B858();
        SetMainCallback2(sub_800F104);
        gUnknown_02024D1E[0] = 0;
    }
    else
    {
        sub_800E7F8();
    }
}

void sub_800E7F8(void)
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
    gUnknown_030042C4 = 0xF0;
    gUnknown_03004240 = 0x5051;
    dp12_8087EA4();

    for (i = 0; i < 80; i++)
    {
        gUnknown_03004DE0.unk0[i] = 0xF0;
        gUnknown_03004DE0.unk780[i] = 0xF0;
    }
    for (i = 80; i < 160; i++)
    {
        asm(""::"r"(i));  // Needed to stop the compiler from optimizing out the loop counter
        gUnknown_03004DE0.unk0[i] = 0xFF10;
        gUnknown_03004DE0.unk780[i] = 0xFF10;
    }
    sub_80895F8(gUnknown_081F9674.unk0, gUnknown_081F9674.unk4, gUnknown_081F9674.unk8);
    SetUpWindowConfig(&gWindowConfig_81E6C58);
    ResetPaletteFade();
    gUnknown_030042A4 = 0;
    gUnknown_030042A0 = 0;
    gUnknown_030042C0 = 0;
    gUnknown_030041B4 = 0;
    gUnknown_03004288 = 0;
    gUnknown_03004280 = 0;
    gUnknown_030041B0 = 0;
    gUnknown_030041B8 = 0;
    gBattleTerrain = GetBattleTerrain();
    InitWindowFromConfig(&gUnknown_03004210, &gWindowConfig_81E6C58);
    InitWindowFromConfig(&gUnknown_030041D0, &gWindowConfig_81E71D0);
    InitWindowFromConfig(&gUnknown_03004250, &gWindowConfig_81E71EC);
    sub_800D6D4();
    sub_800DAB8();
    ResetSpriteData();
    ResetTasks();
    sub_800E23C();
    FreeAllSpritePalettes();
    gReservedSpritePaletteCount = 4;
    SetVBlankCallback(sub_800FCFC);
    setup_poochyena_battle();
    if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
        SetMainCallback2(sub_800F298);
    else
        SetMainCallback2(sub_800EC9C);
    if (!(gBattleTypeFlags & BATTLE_TYPE_LINK))
    {
        CreateNPCTrainerParty(gEnemyParty, gTrainerBattleOpponent);
        SetWildMonHeldItem();
    }
    gMain.inBattle = TRUE;
    for (i = 0; i < 6; i++)
        AdjustFriendship(&gPlayerParty[i], 3);
    gUnknown_02024D1E[0] = 0;
}

void sub_800E9EC(void)
{
    u16 r6 = 0;
    u16 species;
    u16 hp;
    u32 status;
    s32 i;

    for (i = 0; i < 6; i++)
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
    ewram0.unk2 = r6;
    ewram0.unk3 = r6 >> 8;
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

    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    playerId = GetMultiplayerId();
    ewram160CB = playerId;
    enemyId = playerId ^ 1;

    switch (gUnknown_02024D1E[0])
    {
    case 0:
        if (gBattleTypeFlags & BATTLE_TYPE_LINK)
        {
            if (gReceivedRemoteLinkPlayers != 0 && sub_8007ECC())
            {
                ewram0.unk0 = 1;
                ewram0.unk1 = 1;
                sub_800E9EC();
                sub_800EAAC();
                SendBlock(bitmask_all_link_players_but_self(), &ewram0, 32);
                gUnknown_02024D1E[0] = 1;
            }
        }
        else
        {
            gBattleTypeFlags |= BATTLE_TYPE_WILD;
            gUnknown_02024D1E[0] = 8;
            sub_800EB08();
        }
        break;
    case 1:
        if ((GetBlockReceivedStatus() & 3) == 3)
        {
            s32 id;
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
            gTasks[taskId].data[3] = ewram0.unk2 | (ewram0.unk3 << 8);
            gTasks[taskId].data[4] = gBlockRecvBuffer[enemyId][1];
            gUnknown_02024D1E[0]++;
        }
        break;
    case 2:
        if (sub_8007ECC())
        {
            SendBlock(bitmask_all_link_players_but_self(), gPlayerParty, sizeof(*gPlayerParty) * 2);
            gUnknown_02024D1E[0]++;
        }
        break;
    case 3:
        if ((GetBlockReceivedStatus() & 3) == 3)
        {
            ResetBlockReceivedFlags();
            memcpy(gEnemyParty, gBlockRecvBuffer[enemyId], sizeof(*gEnemyParty) * 2);
            gUnknown_02024D1E[0]++;
        }
        break;
    case 4:
        if (sub_8007ECC())
        {
            SendBlock(bitmask_all_link_players_but_self(), gPlayerParty + 2, sizeof(*gPlayerParty) * 2);
            gUnknown_02024D1E[0]++;
        }
        break;
    case 5:
        if ((GetBlockReceivedStatus() & 3) == 3)
        {
            ResetBlockReceivedFlags();
            memcpy(gEnemyParty + 2, gBlockRecvBuffer[enemyId], sizeof(*gEnemyParty) * 2);
            gUnknown_02024D1E[0]++;
        }
        break;
    case 6:
        if (sub_8007ECC())
        {
            SendBlock(bitmask_all_link_players_but_self(), gPlayerParty + 4, sizeof(*gPlayerParty) * 2);
            gUnknown_02024D1E[0]++;
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
            gUnknown_02024D1E[0]++;
        }
        break;
    case 8:
        sub_800B950();
        gUnknown_02024D1E[0]++;
        gUnknown_02024D1E[1] = 0;
        gUnknown_02024D1E[2] = 0;
        break;
    case 9:
        if (battle_load_something(gUnknown_02024D1F, gUnknown_02024D1F + 1) != 0)
        {
            gUnknown_030042D0 = gMain.callback1;
            gMain.callback1 = sub_8010824;
            SetMainCallback2(sub_800F808);
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
        u8 *nickname = gUnknown_02023A00[i].nickname;

        gUnknown_02023A00[i].species     = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES);
        gUnknown_02023A00[i].heldItem    = GetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM);
        GetMonData(&gPlayerParty[i], MON_DATA_NICKNAME, nickname);
        gUnknown_02023A00[i].level       = GetMonData(&gPlayerParty[i], MON_DATA_LEVEL);
        gUnknown_02023A00[i].hp          = GetMonData(&gPlayerParty[i], MON_DATA_HP);
        gUnknown_02023A00[i].maxhp       = GetMonData(&gPlayerParty[i], MON_DATA_MAX_HP);
        gUnknown_02023A00[i].status      = GetMonData(&gPlayerParty[i], MON_DATA_STATUS);
        gUnknown_02023A00[i].personality = GetMonData(&gPlayerParty[i], MON_DATA_PERSONALITY);
        gUnknown_02023A00[i].gender      = GetMonGender(&gPlayerParty[i]);
        StripExtCtrlCodes(nickname);
        gUnknown_02023A00[i].language    = GetMonData(&gPlayerParty[i], MON_DATA_LANGUAGE);
        if (gUnknown_02023A00[i].language != 1)
            PadNameString(nickname, 0);
    }
    memcpy(ewram, gUnknown_02023A00, 0x60);
}

void sub_800F104(void)
{
    u8 playerId;
    MainCallback *pSavedCallback;
    u16 *pSavedBattleTypeFlags;

    playerId = GetMultiplayerId();
    ewram160CB = playerId;
    // Seriously, Game Freak?
    pSavedCallback = (MainCallback *)(ewram + 0x160C4);
    pSavedBattleTypeFlags = (u16 *)(ewram + 0x160C2);
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();

    switch (gUnknown_02024D1E[0])
    {
    case 0:
        if (gReceivedRemoteLinkPlayers != 0 && sub_8007ECC())
        {
            sub_800F02C();
            SendBlock(bitmask_all_link_players_but_self(), ewram, 0x60);
            gUnknown_02024D1E[0]++;
        }
        break;
    case 1:
        if ((GetBlockReceivedStatus() & 0xF) == 0xF)
        {
            s32 i;

            ResetBlockReceivedFlags();
            for (i = 0; i < 4; i++)
            {
                if (i != playerId)
                {
                    if ((!(gLinkPlayers[i].lp_field_18 & 1) && !(gLinkPlayers[playerId].lp_field_18 & 1))
                     || ((gLinkPlayers[i].lp_field_18 & 1) && (gLinkPlayers[playerId].lp_field_18 & 1)))
                        memcpy(gUnknown_02023A00, gBlockRecvBuffer[i], 0x60);
                }
            }
            gUnknown_02024D1E[0]++;
            *pSavedCallback = gMain.savedCallback;
            *pSavedBattleTypeFlags = gBattleTypeFlags;
            gMain.savedCallback = sub_800F104;
            OpenPartyMenu(5, 0);
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            gUnknown_02024D1E[0] = 3;
            sub_800832C();
        }
        break;
    case 3:
        if (gReceivedRemoteLinkPlayers == 0)
        {
            gBattleTypeFlags = *pSavedBattleTypeFlags;
            gMain.savedCallback = *pSavedCallback;
            SetMainCallback2(sub_800E7F8);
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
    switch (gUnknown_02024D1E[0])
    {
        case 0:
            if (gReceivedRemoteLinkPlayers != 0 && sub_8007ECC())
            {
                ewram0.unk0 = 1;
                ewram0.unk1 = 1;
                sub_800E9EC();
                sub_800EAAC();
                SendBlock(bitmask_all_link_players_but_self(), ewram, 0x20);
                gUnknown_02024D1E[0]++;
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
                gUnknown_02024D1E[0]++;
                goto step_2;
            }
            break;
        case 2:
          step_2:
            if (sub_8007ECC())
            {
                SendBlock(bitmask_all_link_players_but_self(), ewram1D000, sizeof(struct Pokemon) * 2);
                gUnknown_02024D1E[0]++;
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
                gUnknown_02024D1E[0]++;
            }
            break;
        case 4:
            if (sub_8007ECC())
            {
                SendBlock(bitmask_all_link_players_but_self(), ewram1D000 + 2, sizeof(struct Pokemon));
                gUnknown_02024D1E[0]++;
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

                gUnknown_02024D1E[0]++;
            }
            break;
        case 6:
            sub_800B950();
            gUnknown_02024D1E[0]++;
            gUnknown_02024D1E[1] = 0;
            gUnknown_02024D1E[2] = 0;
            break;
        case 7:
            if (battle_load_something(gUnknown_02024D1F, gUnknown_02024D1F + 1) != 0)
            {
                gUnknown_030042D0 = gMain.callback1;
                gMain.callback1 = sub_8010824;
                SetMainCallback2(sub_800F808);
                if (gBattleTypeFlags & BATTLE_TYPE_LINK)
                {
                    gTrainerBattleOpponent = 0x800;
                    gBattleTypeFlags |= BATTLE_TYPE_20;
                }
            }
            break;
    }
}

void sub_800F808(void)
{
    AnimateSprites();
    BuildOamBuffer();
    sub_800374C(&gUnknown_03004210);
    UpdatePaletteFade();
    RunTasks();
}

void sub_800F828(struct Sprite *sprite)
{
    sprite->data0 = 0;
    sprite->callback = sub_800F838;
}

void sub_800F838(struct Sprite *sprite)
{
    u16 *arr = (u16 *)ewram;

    switch (sprite->data0)
    {
        case 0:
            sprite->data0++;
            sprite->data1 = 0;
            sprite->data2 = 0x281;
            sprite->data3 = 0;
            sprite->data4 = 1;
            // fall through
        case 1:
            sprite->data4--;
            if (sprite->data4 == 0)
            {
                s32 i;
                s32 r2;
                s32 r0;

                sprite->data4 = 2;
                r2 = sprite->data1 + sprite->data3 * 32;
                r0 = sprite->data2 - sprite->data3 * 32;
                for (i = 0; i < 29; i += 2)
                {
                    arr[r2 + i] = 0x3D;
                    arr[r0 + i] = 0x3D;
                }
                sprite->data3++;
                if (sprite->data3 == 21)
                {
                    sprite->data0++;
                    sprite->data1 = 32;
                }
            }
            break;
        case 2:
            sprite->data1--;
            if (sprite->data1 == 20)
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
                    struct TrainerPartyMember0 *partyData = gTrainers[trainerNum].party;

                    for (j = 0; gSpeciesNames[partyData[i].species][j] != 0xFF; j++)
                        nameHash += gSpeciesNames[partyData[i].species][j];
                    personalityValue += nameHash << 8;
                    fixedIV = partyData[i].iv * 31 / 255;
                    CreateMon(&party[i], partyData[i].species, partyData[i].level, fixedIV, TRUE, personalityValue, 2, 0);
                    break;
                }
                case 1:
                {
                    struct TrainerPartyMember1 *partyData = gTrainers[trainerNum].party;

                    for (j = 0; gSpeciesNames[partyData[i].species][j] != 0xFF; j++)
                        nameHash += gSpeciesNames[partyData[i].species][j];
                    personalityValue += nameHash << 8;
                    fixedIV = partyData[i].iv * 31 / 255;
                    CreateMon(&party[i], partyData[i].species, partyData[i].level, fixedIV, TRUE, personalityValue, 2, 0);

                    for (j = 0; j < 4; j++)
                    {
                        SetMonData(&party[i], MON_DATA_MOVE1 + j, (u8 *)&partyData[i].moves[j]);
                        SetMonData(&party[i], MON_DATA_PP1 + j, &gBattleMoves[partyData[i].moves[j]].pp);
                    }
                    break;
                }
                case 2:
                {
                    struct TrainerPartyMember2 *partyData = gTrainers[trainerNum].party;

                    for (j = 0; gSpeciesNames[partyData[i].species][j] != 0xFF; j++)
                        nameHash += gSpeciesNames[partyData[i].species][j];
                    personalityValue += nameHash << 8;
                    fixedIV = partyData[i].iv * 31 / 255;
                    CreateMon(&party[i], partyData[i].species, partyData[i].level, fixedIV, TRUE, personalityValue, 2, 0);

                    SetMonData(&party[i], MON_DATA_HELD_ITEM, (u8 *)&partyData[i].heldItem);
                    break;
                }
                case 3:
                {
                    struct TrainerPartyMember3 *partyData = gTrainers[trainerNum].party;

                    for (j = 0; gSpeciesNames[partyData[i].species][j] != 0xFF; j++)
                        nameHash += gSpeciesNames[partyData[i].species][j];
                    personalityValue += nameHash << 8;
                    fixedIV = partyData[i].iv * 31 / 255;
                    CreateMon(&party[i], partyData[i].species, partyData[i].level, fixedIV, TRUE, personalityValue, 2, 0);

                    SetMonData(&party[i], MON_DATA_HELD_ITEM, (u8 *)&partyData[i].heldItem);
                    for (j = 0; j < 4; j++)
                    {
                        SetMonData(&party[i], MON_DATA_MOVE1 + j, (u8 *)&partyData[i].moves[j]);
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
    REG_BG0HOFS = gUnknown_030042A4;
    REG_BG0VOFS = gUnknown_030042A0;
    REG_BG1HOFS = gUnknown_030042C0;
    REG_BG1VOFS = gUnknown_030041B4;
    REG_BG2HOFS = gUnknown_03004288;
    REG_BG2VOFS = gUnknown_03004280;
    REG_BG3HOFS = gUnknown_030041B0;
    REG_BG3VOFS = gUnknown_030041B8;
    REG_WIN0H = gUnknown_030042C4;
    REG_WIN0V = gUnknown_03004240;
    REG_WIN1H = gUnknown_03004200;
    REG_WIN1V = gUnknown_03004244;
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    sub_8089668();
}

void nullsub_36(struct Sprite *sprite)
{
}

void sub_800FDB0(struct Sprite *sprite)
{
    if (sprite->data0 != 0)
        sprite->pos1.x = sprite->data1 + ((sprite->data2 & 0xFF00) >> 8);
    else
        sprite->pos1.x = sprite->data1 - ((sprite->data2 & 0xFF00) >> 8);
    sprite->data2 += 0x180;
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

void sub_800FE40(u8 a)
{
    struct Pokemon *sp4 = NULL;
    struct Pokemon *sp8 = NULL;
    u8 r2 = ewram160CB;
    u32 r7;
    s32 i;
    
    
    if (gBattleTypeFlags & 0x40)
    {
        switch (gLinkPlayers[r2].lp_field_18)
        {
        case 1:
        case 3:
            sp4 = gEnemyParty;
            sp8 = gPlayerParty;
            goto foo;
        case 0:
        case 2:
            sp4 = gPlayerParty;
            sp8 = gEnemyParty;
            break;
        }
    }
    else
    {
        sp4 = gPlayerParty;
        sp8 = gEnemyParty;
    }
    //_0800FEBC
    r7 = 0;
    for (i = 0; i < 6; i++)
    {
        u16 r5 = GetMonData(&sp4[i], MON_DATA_SPECIES2);
        u16 r6 = GetMonData(&sp4[i], MON_DATA_HP);
        u32 r1 = GetMonData(&sp4[i], MON_DATA_STATUS);
        
        if (r5 == 0)
            continue;
        if (r5 != SPECIES_EGG && r6 != 0 && r1 == 0)
            r7 |= 1 << i * 2;
        
        if (r5 == 0)
            continue;
        if (r6 != 0 && (r5 == SPECIES_EGG || r1 != 0))
            r7 |= 2 << i * 2;
        
        if (r5 == 0)
            continue;
        if (r5 != SPECIES_EGG && r6 == 0)
            r7 |= 3 << i * 2;
    }
    gTasks[a].data[3] = r7;
    r7 = 0;
    for (i = 0; i < 6; i++)  //_0800FF6A
    {
        u16 r5 = GetMonData(&sp8[i], MON_DATA_SPECIES2);
        u16 r6 = GetMonData(&sp8[i], MON_DATA_HP);
        u32 r1 = GetMonData(&sp8[i], MON_DATA_STATUS);
        
        if (r5 == 0)
            continue;
        if (r5 != SPECIES_EGG && r6 != 0 && r1 == 0)
            r7 |= 1 << i * 2;
        
        if (r5 == 0)
            continue;
        if (r6 != 0 && (r5 == SPECIES_EGG || r1 != 0))
            r7 |= 2 << i * 2;
        
        if (r5 == 0)
            continue;
        if (r5 != SPECIES_EGG && r6 == 0)
            r7 |= 3 << i * 2;
    }
    gTasks[a].data[4] = r7;
}
