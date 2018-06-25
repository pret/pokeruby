#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "palette.h"
#include "main.h"
#include "scanline_effect.h"
#include "text.h"
#include "rom_8077ABC.h"
#include "data2.h"
#include "ewram.h"

extern struct SpriteTemplate gUnknown_02024E8C;
extern struct Window gUnknown_03004210;
extern u8 gReservedSpritePaletteCount;
extern u8 gActionSelectionCursor[4];
extern u8 gBankInMenu;
extern u16 gBattlerPartyIndexes[4];
extern u8 gBattlersCount;
extern u16 gBattleTypeFlags;
extern u8 gBankSpriteIds[4];
extern u8 gBattleMonForms[4];
extern u8 gHealthboxIDs[4];

bool8 LoadChosenBattleElement(u8 a0);
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
void nullsub_11(u8 healthboxID, u8 a1);
void sub_8043DB0(u8 bank);
u8 battle_make_oam_normal_battle(u8 bank);
u8 battle_make_oam_safari_battle(void);
void sub_8045A5C(u8 healthboxID, struct Pokemon*, u8);
void sub_8043F44(u8 bank);
void sub_8043DFC(u8 healthboxID);

// this file's functions
static void CB2_ReshowBattleScreenAfterMenu(void);
static bool8 LoadAppropiateBankSprite(u8 bank);
static void sub_807B184(u8 bank);
static void sub_807B508(u8 bank);
static void sub_807B06C(void);

void nullsub_14(void)
{

}

void ReshowBattleScreenAfterMenu(void)
{
    gPaletteFade.bufferTransferDisabled = 1;
    SetHBlankCallback(0);
    SetVBlankCallback(0);
    REG_MOSAIC = 0;
    gReshowState = 0;
    gHelperState = 0;
    SetMainCallback2(CB2_ReshowBattleScreenAfterMenu);
}

static void CB2_ReshowBattleScreenAfterMenu(void)
{
    switch (gReshowState)
    {
    case 0:
        ScanlineEffect_Clear();
        Text_LoadWindowTemplate(&gWindowTemplate_81E6C58);
        ResetPaletteFade();
        Text_InitWindowWithTemplate(&gUnknown_03004210, &gWindowTemplate_81E6C58);
        gBattle_BG0_X = 0;
        gBattle_BG0_Y = 0;
        gBattle_BG1_X = 0;
        gBattle_BG1_Y = 0;
        gBattle_BG2_X = 0;
        gBattle_BG2_Y = 0;
        gBattle_BG3_X = 0;
        gBattle_BG3_Y = 0;
        break;
    case 1:
        {
            const u32 zero = 0;
            CpuFastSet(&zero, (void*) VRAM, 0x1006000);
        }
        break;
    case 2:
        if (!LoadChosenBattleElement(gHelperState))
        {
            gHelperState++;
            gReshowState--;
        }
        else
            gHelperState = 0;
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
        if (sub_8031C30(gHelperState))
            gHelperState = 0;
        else
        {
            gHelperState++;
            gReshowState--;
        }
        break;
    case 7:
        if (!LoadAppropiateBankSprite(0))
            gReshowState--;
        break;
    case 8:
        if (!LoadAppropiateBankSprite(1))
            gReshowState--;
        break;
    case 9:
        if (!LoadAppropiateBankSprite(2))
            gReshowState--;
        break;
    case 10:
        if (!LoadAppropiateBankSprite(3))
            gReshowState--;
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

            opponentBank = GetBattlerAtPosition(1);
            species = GetMonData(&gEnemyParty[gBattlerPartyIndexes[opponentBank]], MON_DATA_SPECIES);
            sub_8032984(opponentBank, species);

            if (IsDoubleBattle())
            {
                opponentBank = GetBattlerAtPosition(3);
                species = GetMonData(&gEnemyParty[gBattlerPartyIndexes[opponentBank]], MON_DATA_SPECIES);
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
        SetMainCallback2(BattleMainCB2);
        break;
    }
    gReshowState++;
}

static void sub_807B06C(void)
{
    sub_800D6D4();
    ((vBgCnt *)&REG_BG1CNT)->charBaseBlock = 0;
    ((vBgCnt *)&REG_BG2CNT)->charBaseBlock = 0;
}

static bool8 LoadAppropiateBankSprite(u8 bank)
{
    if (bank < gBattlersCount)
    {
        if (GetBattlerSide(bank))
        {
            if (!ewram17800[bank].substituteSprite)
                BattleLoadOpponentMonSprite(&gEnemyParty[gBattlerPartyIndexes[bank]], bank);
            else
                BattleLoadSubstituteSprite(bank, 0);
        }
        else if (gBattleTypeFlags & BATTLE_TYPE_SAFARI && bank == 0)
            LoadPlayerTrainerBankSprite(gSaveBlock2.playerGender, 0);
        else if (gBattleTypeFlags & BATTLE_TYPE_WALLY_TUTORIAL && bank == 0)
            LoadPlayerTrainerBankSprite(2, 0);
        else if (!ewram17800[bank].substituteSprite)
            BattleLoadPlayerMonSprite(&gPlayerParty[gBattlerPartyIndexes[bank]], bank);
        else
            BattleLoadSubstituteSprite(bank, 0);

        gHelperState = 0;
    }
    return 1;
}

static void sub_807B184(u8 bank)
{
    if (bank < gBattlersCount)
    {
        u8 posY;

        if (ewram17800[bank].substituteSprite)
            posY = sub_8077F7C(bank);
        else
            posY = sub_8077F68(bank);
        if (GetBattlerSide(bank))
        {
            if (GetMonData(&gEnemyParty[gBattlerPartyIndexes[bank]], MON_DATA_HP) == 0)
                return;
            GetMonSpriteTemplate_803C56C(GetMonData(&gEnemyParty[gBattlerPartyIndexes[bank]], MON_DATA_SPECIES), GetBattlerPosition(bank));
            gBankSpriteIds[bank] = CreateSprite(&gUnknown_02024E8C, GetBattlerSpriteCoord(bank, 2), posY, sub_8079E90(bank));
            gSprites[gBankSpriteIds[bank]].oam.paletteNum = bank;
            gSprites[gBankSpriteIds[bank]].callback = SpriteCallbackDummy;
            gSprites[gBankSpriteIds[bank]].data[0] = bank;
            gSprites[gBankSpriteIds[bank]].data[2] = GetMonData(&gEnemyParty[gBattlerPartyIndexes[bank]], MON_DATA_SPECIES);
            StartSpriteAnim(&gSprites[gBankSpriteIds[bank]], gBattleMonForms[bank]);
        }
        else if (gBattleTypeFlags & BATTLE_TYPE_SAFARI && bank == 0)
        {
            GetMonSpriteTemplate_803C5A0(gSaveBlock2.playerGender, GetBattlerPosition(0));
            gBankSpriteIds[bank] = CreateSprite(&gUnknown_02024E8C, 0x50,
                                                (8 - gTrainerBackPicCoords[gSaveBlock2.playerGender].coords) * 4 + 80,
                                                 sub_8079E90(0));
            gSprites[gBankSpriteIds[bank]].oam.paletteNum = bank;
            gSprites[gBankSpriteIds[bank]].callback = SpriteCallbackDummy;
            gSprites[gBankSpriteIds[bank]].data[0] = bank;
        }
        else if (gBattleTypeFlags & BATTLE_TYPE_WALLY_TUTORIAL && bank == 0)
        {
            GetMonSpriteTemplate_803C5A0(2, GetBattlerPosition(0));
            gBankSpriteIds[bank] = CreateSprite(&gUnknown_02024E8C, 0x50,
                                                (8 - gTrainerBackPicCoords[2].coords) * 4 + 80,
                                                 sub_8079E90(0));
            gSprites[gBankSpriteIds[bank]].oam.paletteNum = bank;
            gSprites[gBankSpriteIds[bank]].callback = SpriteCallbackDummy;
            gSprites[gBankSpriteIds[bank]].data[0] = bank;
        }
        else
        {
            if (GetMonData(&gPlayerParty[gBattlerPartyIndexes[bank]], MON_DATA_HP) == 0)
                return;
            GetMonSpriteTemplate_803C56C(GetMonData(&gPlayerParty[gBattlerPartyIndexes[bank]], MON_DATA_SPECIES), GetBattlerPosition(bank));
            gBankSpriteIds[bank] = CreateSprite(&gUnknown_02024E8C, GetBattlerSpriteCoord(bank, 2), posY, sub_8079E90(bank));
            gSprites[gBankSpriteIds[bank]].oam.paletteNum = bank;
            gSprites[gBankSpriteIds[bank]].callback = SpriteCallbackDummy;
            gSprites[gBankSpriteIds[bank]].data[0] = bank;
            gSprites[gBankSpriteIds[bank]].data[2] = GetMonData(&gPlayerParty[gBattlerPartyIndexes[bank]], MON_DATA_SPECIES);
            StartSpriteAnim(&gSprites[gBankSpriteIds[bank]], gBattleMonForms[bank]);
        }
        gSprites[gBankSpriteIds[bank]].invisible = ewram17800[bank].invisible;
    }
}

static void sub_807B508(u8 bank)
{
    if (bank < gBattlersCount)
    {
        u8 healthboxID;
        if (gBattleTypeFlags & BATTLE_TYPE_SAFARI && bank == 0)
            healthboxID = battle_make_oam_safari_battle();
        else if (gBattleTypeFlags & BATTLE_TYPE_WALLY_TUTORIAL && bank == 0)
            return;
        else
            healthboxID = battle_make_oam_normal_battle(bank);
        gHealthboxIDs[bank] = healthboxID;
        sub_8043F44(bank);
        sub_8043DFC(healthboxID);
        if (GetBattlerSide(bank))
            sub_8045A5C(gHealthboxIDs[bank], &gEnemyParty[gBattlerPartyIndexes[bank]], 0);
        else if (gBattleTypeFlags & BATTLE_TYPE_SAFARI)
            sub_8045A5C(gHealthboxIDs[bank], &gPlayerParty[gBattlerPartyIndexes[bank]], 10);
        else
            sub_8045A5C(gHealthboxIDs[bank], &gPlayerParty[gBattlerPartyIndexes[bank]], 0);
        if (GetBattlerPosition(bank) == 3 || GetBattlerPosition(bank) == 2)
            nullsub_11(gHealthboxIDs[bank], 1);
        else
            nullsub_11(gHealthboxIDs[bank], 0);
        if (GetBattlerSide(bank))
        {
            if (GetMonData(&gEnemyParty[gBattlerPartyIndexes[bank]], MON_DATA_HP) == 0)
                sub_8043DB0(healthboxID);
        }
        else if (!(gBattleTypeFlags & BATTLE_TYPE_SAFARI))
        {
            if (GetMonData(&gPlayerParty[gBattlerPartyIndexes[bank]], MON_DATA_HP) == 0)
                sub_8043DB0(healthboxID);
        }
    }
}
