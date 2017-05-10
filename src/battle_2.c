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

extern const struct UnknownStruct5 gUnknown_081F9674;
extern const u8 gUnknown_081F96C8[];

extern u8 ewram[];
#define ewram0 (*(struct UnknownStruct7 *)(ewram + 0x0))
#define ewram4 (*(struct UnknownStruct8 *)(ewram + 0x4))
extern u8 gUnknown_02024D1E;
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
extern struct UnknownStruct6 gUnknown_03004DE0;
//extern u16 gUnknown_03004DE0[][0xA0];
extern u16 gBattleTypeFlags;
extern u8 gBattleTerrain;
extern u8 gReservedSpritePaletteCount;
extern u16 gTrainerBattleOpponent;
extern struct BattleEnigmaBerry gEnigmaBerries[];
extern u16 gBlockRecvBuffer[MAX_LINK_PLAYERS][BLOCK_BUFFER_SIZE / 2];

extern void sub_800B858(void);
extern void dp12_8087EA4(void);
extern void sub_80895F8();
extern u8 GetBattleTerrain();
extern void sub_800D6D4();
extern void sub_800DAB8();
extern void sub_800E23C();
extern void setup_poochyena_battle();
extern void SetWildMonHeldItem(void);
extern void AdjustFriendship(struct Pokemon *, u8);


void sub_800E7F8(void);
void sub_800EC9C(void);
void sub_800F104(void);
void sub_800F298(void);
void sub_800F8E8();
void sub_800FCFC(void);

void sub_800E7C4(void)
{
    if (gBattleTypeFlags & BATTLE_TYPE_40)
    {
        sub_800B858();
        SetMainCallback2(sub_800F104);
        gUnknown_02024D1E = 0;
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
    if (gBattleTypeFlags & BATTLE_TYPE_40)
        SetMainCallback2(sub_800F298);
    else
        SetMainCallback2(sub_800EC9C);
    if (!(gBattleTypeFlags & BATTLE_TYPE_LINK))
    {
        sub_800F8E8(gEnemyParty, gTrainerBattleOpponent);
        SetWildMonHeldItem();
    }
    gMain.inBattle = TRUE;
    for (i = 0; i < 6; i++)
        AdjustFriendship(&gPlayerParty[i], 3);
    gUnknown_02024D1E = 0;
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
        s32 r8;
        struct BattleEnigmaBerry *src;
        u8 r4;
        
        if (gBattleTypeFlags & BATTLE_TYPE_40)
            r8 = 4;
        else
            r8 = 2;
        for (i = 0; i < r8; i++)
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
    u8 r4;
    u8 r5;
    
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    r4 = GetMultiplayerId();
    ewram[0x160CB] = r4;
    r5 = r4 ^ 1;
    switch (gUnknown_02024D1E)
    {
        case 0:
        //_0800ED0C
            if (gBattleTypeFlags & BATTLE_TYPE_LINK)
            {
                if (gReceivedRemoteLinkPlayers != 0 && sub_8007ECC())
                {
                    ewram0.unk0 = 1;
                    ewram0.unk1 = 1;
                    sub_800E9EC();
                    sub_800EAAC();
                    SendBlock(bitmask_all_link_players_but_self(), &ewram0, 32);
                    gUnknown_02024D1E = 1;
                }
            }
            //_0800ED64
            else
            {
                gBattleTypeFlags |= BATTLE_TYPE_WILD;
                gUnknown_02024D1E = 8;
                sub_800EB08();
            }
            break;
        case 1:
        //_0800ED7C
            if ((GetBlockReceivedStatus() & 3) == 3)
            {
                ResetBlockReceivedFlags();
                if (gBlockRecvBuffer[0][0] == 0x100)
                {
                    if (r4 == 0)
                        gBattleTypeFlags |= 12;
                    else
                        gBattleTypeFlags |= 8;
                }
                //_0800EDBC
            }
            break;
    }
}