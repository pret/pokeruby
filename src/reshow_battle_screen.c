#include "global.h"
#include "battle.h"
#include "palette.h"
#include "main.h"
#include "unknown_task.h"
#include "text.h"
#include "rom_8077ABC.h"

extern struct Window gUnknown_03004210;
extern u16 gUnknown_03004280;
extern u16 gUnknown_03004288;
extern u16 gUnknown_030042A4;
extern u16 gUnknown_030042C0;
extern u16 gUnknown_030041B0;
extern u16 gUnknown_030041B4;
extern u16 gUnknown_030041B8;
extern u16 gUnknown_030042A0;
extern u8 gReservedSpritePaletteCount;
extern u8 gActionSelectionCursor[4];
extern u8 gBankInMenu;
extern u16 gBattlePartyID[4];
extern u8 gNoOfAllBanks;
extern u16 gBattleTypeFlags;
extern u8 gObjectBankIDs[4];

bool8 sub_800E414(u8 a0);
bool8 sub_8031C30(u8 a0);
void sub_8031EE8(void);
void sub_80327CC(void);
void sub_8032984(u8 a, u16 b);
void sub_800FCD4(void);
void BattleLoadOpponentMonSprite(struct Pokemon *, u8 bank);
void BattleLoadPlayerMonSprite(struct Pokemon *, u8 bank);
void BattleLoadSubstituteSprite(u8 bank, u8 b);
void LoadPlayerTrainerBankSprite(u16 a0, u8 bank);
u8 sub_8077F7C(u8 bank);
u8 sub_8077F68(u8 bank);

// this file's functions
static void CB2_ReshowBattleScreenAfterMenu(void);
static bool8 LoadAppropiateBankSprite(u8 bank);
void sub_807B184(u8 bank);
void sub_807B508(u8 bank);
void sub_807B06C(void);

#define RESHOW_STATE 0x1FFFF
#define HELPER_STATE 0x1FFFE

struct BGCNT
{
    u16 priority : 2;
    u16 charBaseBlock : 2;
    u16 reserved : 2;
    u16 mosaic : 1;
    u16 colors : 1;
    u16 screenBaseBlock : 5;
    u16 screenSize : 2;
};

void nullsub_14(void)
{

}

void ReshowBattleScreenAfterMenu(void)
{
    gPaletteFade.bufferTransferDisabled = 1;
    SetHBlankCallback(0);
    SetVBlankCallback(0);
    REG_MOSAIC = 0;
    ewram[RESHOW_STATE] = 0;
    ewram[HELPER_STATE] = 0;
    SetMainCallback2(CB2_ReshowBattleScreenAfterMenu);
}

static void CB2_ReshowBattleScreenAfterMenu(void)
{
    switch (ewram[RESHOW_STATE])
    {
    case 0:
        dp12_8087EA4();
        SetUpWindowConfig(&gWindowConfig_81E6C58);
        ResetPaletteFade();
        InitWindowFromConfig(&gUnknown_03004210, &gWindowConfig_81E6C58);
        gUnknown_030042A4 = 0;
        gUnknown_030042A0 = 0;
        gUnknown_030042C0 = 0;
        gUnknown_030041B4 = 0;
        gUnknown_03004288 = 0;
        gUnknown_03004280 = 0;
        gUnknown_030041B0 = 0;
        gUnknown_030041B8 = 0;
        break;
    case 1:
        {
            const u32 zero = 0;
            CpuFastSet(&zero, (void*) VRAM, 0x1006000);
        }
        break;
    case 2:
        if (!sub_800E414(ewram[HELPER_STATE]))
        {
            ewram[HELPER_STATE]++;
            ewram[RESHOW_STATE]--;
        }
        else
            ewram[HELPER_STATE] = 0;
        break;
    case 3:
        ResetSpriteData();
        break;
    case 4:
        FreeAllSpritePalettes();
        gReservedSpritePaletteCount = 4;
        break;
    case 5:
        sub_8031EE8();
        break;
    case 6:
        if (sub_8031C30(ewram[HELPER_STATE]))
            ewram[HELPER_STATE] = 0;
        else
        {
            ewram[HELPER_STATE]++;
            ewram[RESHOW_STATE]--;
        }
        break;
    case 7:
        if (!LoadAppropiateBankSprite(0))
            ewram[RESHOW_STATE]--;
        break;
    case 8:
        if (!LoadAppropiateBankSprite(1))
            ewram[RESHOW_STATE]--;
        break;
    case 9:
        if (!LoadAppropiateBankSprite(2))
            ewram[RESHOW_STATE]--;
        break;
    case 10:
        if (!LoadAppropiateBankSprite(3))
            ewram[RESHOW_STATE]--;
        break;
    case 11:
        sub_807B184(0);
        break;
    case 12:
        sub_807B184(1);
        break;
    case 13:
        sub_807B184(2);
        break;
    case 14:
        sub_807B184(3);
        break;
    case 15:
        sub_807B508(0);
        break;
    case 16:
        sub_807B508(1);
        break;
    case 17:
        sub_807B508(2);
        break;
    case 18:
        sub_807B508(3);
        break;
    case 19:
        {
            u8 opponentBank;
            u16 species;

            sub_80327CC();

            opponentBank = GetBankByPlayerAI(1);
            species = GetMonData(&gEnemyParty[gBattlePartyID[opponentBank]], MON_DATA_SPECIES);
            sub_8032984(opponentBank, species);

            if (IsDoubleBattle())
            {
                opponentBank = GetBankByPlayerAI(3);
                species = GetMonData(&gEnemyParty[gBattlePartyID[opponentBank]], MON_DATA_SPECIES);
                sub_8032984(opponentBank, species);
            }
            sub_802E3E4(gActionSelectionCursor[gBankInMenu], 0);
        }
        break;
    default:
        SetHBlankCallback(sub_800FCD4);
        SetVBlankCallback(sub_800FCFC);
        sub_807B06C();
        BeginHardwarePaletteFade(0xFF, 0, 0x10, 0, 1);
        gPaletteFade.bufferTransferDisabled = 0;
        SetMainCallback2(sub_800F808);
        break;
    }
    ewram[RESHOW_STATE]++;
}

void sub_807B06C(void)
{
    struct BGCNT *regBgcnt1, *regBgcnt2;

    sub_800D6D4();

    regBgcnt1 = (void*)(&REG_BG1CNT);
    regBgcnt1->charBaseBlock = 0;

    regBgcnt2 = (void*)(&REG_BG2CNT);
    regBgcnt2->charBaseBlock = 0;
}

static bool8 LoadAppropiateBankSprite(u8 bank)
{
    if (bank < gNoOfAllBanks)
    {
        if (GetBankSide(bank))
        {
            if (!ewram17800[bank].substituteSprite)
                BattleLoadOpponentMonSprite(&gEnemyParty[gBattlePartyID[bank]], bank);
            else
                BattleLoadSubstituteSprite(bank, 0);
        }
        else if (gBattleTypeFlags & BATTLE_TYPE_SAFARI && bank == 0)
            LoadPlayerTrainerBankSprite(gSaveBlock2.playerGender, 0);
        else if (gBattleTypeFlags & BATTLE_TYPE_WALLY_TUTORIAL && bank == 0)
            LoadPlayerTrainerBankSprite(2, 0);
        else if (!ewram17800[bank].substituteSprite)
            BattleLoadPlayerMonSprite(&gPlayerParty[gBattlePartyID[bank]], bank);
        else
            BattleLoadSubstituteSprite(bank, 0);

        ewram[HELPER_STATE] = 0;
    }
    return 1;
}

void sub_807B184(u8 bank)
{
    if (bank < gNoOfAllBanks)
    {
        u16 species;
        s16 posX, posY;
        u8 subpriority;

        if (ewram17800[bank].substituteSprite)
            posY = sub_8077F7C();
        else
            posY = sub_8077F68();
        if (GetBankSide(bank))
        {
            if (GetMonData(&gEnemyParty[gBattlePartyID[bank]], MON_DATA_HP))
            {
                species = GetMonData(&gEnemyParty[gBattlePartyID[bank]], MON_DATA_SPECIES);
                GetMonSpriteTemplate_803C56C(species, GetBankIdentity(bank));
                posX = sub_8077ABC(bank);
                subpriority = sub_8079E90(bank);
                gObjectBankIDs[] = todo;
            }
        }
    }
}
