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
#include "constants/trainers.h"

extern struct SpriteTemplate gCreatingSpriteTemplate;
extern struct Window gWindowTemplate_Contest_MoveDescription;
extern u8 gReservedSpritePaletteCount;
extern u8 gActionSelectionCursor[4];
extern u8 gBattlerInMenuId;
extern u16 gBattlerPartyIndexes[4];
extern u8 gBattlersCount;
extern u16 gBattleTypeFlags;
extern u8 gBattlerSpriteIds[4];
extern u8 gBattleMonForms[4];
extern u8 gHealthboxSpriteIds[4];

bool8 LoadChosenBattleElement(u8 a0);
bool8 sub_8031C30(u8 a0);
void sub_8031EE8(void);
void sub_80327CC(void);
void sub_8032984(u8 a, u16 b);
void sub_800FCD4(void);
void BattleLoadOpponentMonSprite(struct Pokemon *, u8 bank);
void BattleLoadPlayerMonSprite(struct Pokemon *, u8 bank);
void BattleLoadSubstituteSprite(u8 bank, u8 b);
void DecompressTrainerBackPic(u16 a0, u8 bank);
u8 sub_8077F7C(u8 bank);
u8 GetBattlerSpriteDefault_Y(u8 bank);
void nullsub_11(u8 healthboxID, u8 a1);
void SetHealthboxSpriteInvisible(u8 bank);
u8 battle_make_oam_normal_battle(u8 bank);
u8 battle_make_oam_safari_battle(void);
void UpdateHealthboxAttribute(u8 healthboxID, struct Pokemon*, u8);
void sub_8043F44(u8 bank);
void SetHealthboxSpriteVisible(u8 healthboxID);

// this file's functions
static void CB2_ReshowBattleScreenAfterMenu(void);
static bool8 LoadAppropiateBankSprite(u8 bank);
static void sub_807B184(u8 bank);
static void sub_807B508(u8 bank);
static void sub_807B06C(void);

void ReshowBattleScreenDummy(void)
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
        Text_InitWindowWithTemplate(&gWindowTemplate_Contest_MoveDescription, &gWindowTemplate_81E6C58);
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
            sub_802E3E4(gActionSelectionCursor[gBattlerInMenuId], 0);
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
            if (!gBattleSpriteInfo[bank].behindSubstitute)
                BattleLoadOpponentMonSprite(&gEnemyParty[gBattlerPartyIndexes[bank]], bank);
            else
                BattleLoadSubstituteSprite(bank, 0);
        }
        else if (gBattleTypeFlags & BATTLE_TYPE_SAFARI && bank == 0)
            DecompressTrainerBackPic(gSaveBlock2.playerGender, 0);
        else if (gBattleTypeFlags & BATTLE_TYPE_WALLY_TUTORIAL && bank == 0)
            DecompressTrainerBackPic(TRAINER_BACK_PIC_WALLY, 0);
        else if (!gBattleSpriteInfo[bank].behindSubstitute)
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

        if (gBattleSpriteInfo[bank].behindSubstitute)
            posY = sub_8077F7C(bank);
        else
            posY = GetBattlerSpriteDefault_Y(bank);
        if (GetBattlerSide(bank))
        {
            if (GetMonData(&gEnemyParty[gBattlerPartyIndexes[bank]], MON_DATA_HP) == 0)
                return;
            SetMultiuseSpriteTemplateToPokemon(GetMonData(&gEnemyParty[gBattlerPartyIndexes[bank]], MON_DATA_SPECIES), GetBattlerPosition(bank));
            gBattlerSpriteIds[bank] = CreateSprite(&gCreatingSpriteTemplate, GetBattlerSpriteCoord(bank, 2), posY, GetBattlerSpriteSubpriority(bank));
            gSprites[gBattlerSpriteIds[bank]].oam.paletteNum = bank;
            gSprites[gBattlerSpriteIds[bank]].callback = SpriteCallbackDummy;
            gSprites[gBattlerSpriteIds[bank]].data[0] = bank;
            gSprites[gBattlerSpriteIds[bank]].data[2] = GetMonData(&gEnemyParty[gBattlerPartyIndexes[bank]], MON_DATA_SPECIES);
            StartSpriteAnim(&gSprites[gBattlerSpriteIds[bank]], gBattleMonForms[bank]);
        }
        else if (gBattleTypeFlags & BATTLE_TYPE_SAFARI && bank == 0)
        {
            SetMultiuseSpriteTemplateToTrainerBack(gSaveBlock2.playerGender, GetBattlerPosition(0));
            gBattlerSpriteIds[bank] = CreateSprite(&gCreatingSpriteTemplate, 0x50,
                                                (8 - gTrainerBackPicCoords[gSaveBlock2.playerGender].coords) * 4 + 80,
                                                 GetBattlerSpriteSubpriority(0));
            gSprites[gBattlerSpriteIds[bank]].oam.paletteNum = bank;
            gSprites[gBattlerSpriteIds[bank]].callback = SpriteCallbackDummy;
            gSprites[gBattlerSpriteIds[bank]].data[0] = bank;
        }
        else if (gBattleTypeFlags & BATTLE_TYPE_WALLY_TUTORIAL && bank == 0)
        {
            SetMultiuseSpriteTemplateToTrainerBack(TRAINER_BACK_PIC_WALLY, GetBattlerPosition(0));
            gBattlerSpriteIds[bank] = CreateSprite(&gCreatingSpriteTemplate, 0x50,
                                                (8 - gTrainerBackPicCoords[2].coords) * 4 + 80,
                                                 GetBattlerSpriteSubpriority(0));
            gSprites[gBattlerSpriteIds[bank]].oam.paletteNum = bank;
            gSprites[gBattlerSpriteIds[bank]].callback = SpriteCallbackDummy;
            gSprites[gBattlerSpriteIds[bank]].data[0] = bank;
        }
        else
        {
            if (GetMonData(&gPlayerParty[gBattlerPartyIndexes[bank]], MON_DATA_HP) == 0)
                return;
            SetMultiuseSpriteTemplateToPokemon(GetMonData(&gPlayerParty[gBattlerPartyIndexes[bank]], MON_DATA_SPECIES), GetBattlerPosition(bank));
            gBattlerSpriteIds[bank] = CreateSprite(&gCreatingSpriteTemplate, GetBattlerSpriteCoord(bank, 2), posY, GetBattlerSpriteSubpriority(bank));
            gSprites[gBattlerSpriteIds[bank]].oam.paletteNum = bank;
            gSprites[gBattlerSpriteIds[bank]].callback = SpriteCallbackDummy;
            gSprites[gBattlerSpriteIds[bank]].data[0] = bank;
            gSprites[gBattlerSpriteIds[bank]].data[2] = GetMonData(&gPlayerParty[gBattlerPartyIndexes[bank]], MON_DATA_SPECIES);
            StartSpriteAnim(&gSprites[gBattlerSpriteIds[bank]], gBattleMonForms[bank]);
        }
        gSprites[gBattlerSpriteIds[bank]].invisible = gBattleSpriteInfo[bank].invisible;
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
        gHealthboxSpriteIds[bank] = healthboxID;
        sub_8043F44(bank);
        SetHealthboxSpriteVisible(healthboxID);
        if (GetBattlerSide(bank))
            UpdateHealthboxAttribute(gHealthboxSpriteIds[bank], &gEnemyParty[gBattlerPartyIndexes[bank]], 0);
        else if (gBattleTypeFlags & BATTLE_TYPE_SAFARI)
            UpdateHealthboxAttribute(gHealthboxSpriteIds[bank], &gPlayerParty[gBattlerPartyIndexes[bank]], 10);
        else
            UpdateHealthboxAttribute(gHealthboxSpriteIds[bank], &gPlayerParty[gBattlerPartyIndexes[bank]], 0);
        if (GetBattlerPosition(bank) == 3 || GetBattlerPosition(bank) == 2)
            nullsub_11(gHealthboxSpriteIds[bank], 1);
        else
            nullsub_11(gHealthboxSpriteIds[bank], 0);
        if (GetBattlerSide(bank))
        {
            if (GetMonData(&gEnemyParty[gBattlerPartyIndexes[bank]], MON_DATA_HP) == 0)
                SetHealthboxSpriteInvisible(healthboxID);
        }
        else if (!(gBattleTypeFlags & BATTLE_TYPE_SAFARI))
        {
            if (GetMonData(&gPlayerParty[gBattlerPartyIndexes[bank]], MON_DATA_HP) == 0)
                SetHealthboxSpriteInvisible(healthboxID);
        }
    }
}
