#include "global.h"
#include "contest_util.h"
#include "battle.h"
#include "berry.h"
#include "choose_party.h"
#include "constants/items.h"
#include "constants/species.h"
#include "contest.h"
#include "contest_link_util.h"
#include "contest_painting.h"
#include "data2.h"
#include "daycare.h"
#include "debug.h"
#include "decompress.h"
#include "event_data.h"
#include "ewram.h"
#include "link.h"
#include "load_save.h"
#include "main.h"
#include "menu.h"
#include "overworld.h"
#include "pokedex.h"
#include "pokemon.h"
#include "random.h"
#include "task.h"
#include "constants/event_objects.h"

#define CONTEST_ENTRY_PIC_LEFT 10
#define CONTEST_ENTRY_PIC_TOP 3

extern struct SpriteTemplate gCreatingSpriteTemplate;

extern u8 gSelectedOrderFromParty[];

extern u16 gSpecialVar_ContestCategory;
extern u16 gSpecialVar_ContestRank;

extern u8 gContestMonPartyIndex;
extern u8 gUnknown_0203856C;

void SetContestTrainerGfxIds(void)
{
    gSaveBlock1.vars[VAR_OBJ_GFX_ID_0 - VARS_START] = gContestMons[0].trainerGfxId;
    gSaveBlock1.vars[VAR_OBJ_GFX_ID_1 - VARS_START] = gContestMons[1].trainerGfxId;
    gSaveBlock1.vars[VAR_OBJ_GFX_ID_2 - VARS_START] = gContestMons[2].trainerGfxId;
}

void GetNpcContestantLocalId(void)
{
    u16 localId;
    u8 specialVar = gSpecialVar_0x8005;

    switch(specialVar)
    {
    case 0:
        localId = LOCALID_CONTESTANT_1;
        break;
    case 1:
        localId = LOCALID_CONTESTANT_2;
        break;
    case 2:
        localId = LOCALID_CONTESTANT_3;
        break;
    default: // Invalid
        localId = 100;
        break;
    }
    gSpecialVar_0x8004 = localId;
}

void BufferContestTrainerAndMonNames(void)
{
    Contest_GetTrainerNameI_StringVar1();
    Contest_GetNicknameI_StringVar1();
    Contest_GetSpeciesNameI_StringVar1();
}

void DoesContestCategoryHaveMuseumPainting(void)
{
    u16 contestWinner;

    switch(gSpecialVar_ContestCategory)
    {
    case CONTEST_CATEGORY_COOL:
        contestWinner = CONTEST_WINNER_MUSEUM_COOL - 1;
        break;
    case CONTEST_CATEGORY_BEAUTY:
        contestWinner = CONTEST_WINNER_MUSEUM_BEAUTY - 1;
        break;
    case CONTEST_CATEGORY_CUTE:
        contestWinner = CONTEST_WINNER_MUSEUM_CUTE - 1;
        break;
    case CONTEST_CATEGORY_SMART:
        contestWinner = CONTEST_WINNER_MUSEUM_SMART - 1;
        break;
    case CONTEST_CATEGORY_TOUGH:
    default:
        contestWinner = CONTEST_WINNER_MUSEUM_TOUGH - 1;
        break;
    }

    if (gSaveBlock1.contestWinners[contestWinner].species == SPECIES_NONE)
        gSpecialVar_0x8004 = FALSE;
    else
        gSpecialVar_0x8004 = TRUE;
}

void SaveMuseumContestPainting(void)
{
    Contest_SaveWinner(CONTEST_SAVE_FOR_MUSEUM);
}

void ShouldReadyContestArtist(void)
{
    if(!gContestFinalStandings[gContestPlayerMonIndex]
    && gSpecialVar_ContestRank == CONTEST_RANK_MASTER
    && gContestMonTotalPoints[gContestPlayerMonIndex] >= 800)
    {
        gSpecialVar_0x8004 = TRUE;
    }
    else
    {
        gSpecialVar_0x8004 = FALSE;
    }
}

u8 CountPlayerMuseumPaintings(void)
{
    u8 retVar = 0;
    int i;

    for (i = 0; i < 5; i++)
        if (gSaveBlock1.museumPortraits[i].species != 0)
            retVar++;

    return retVar;
}

void GetContestantNamesAtRank(void)
{
    s16 conditions[4];
    s32 i;
    s32 j;
    s16 condition;
    u8 contestantOffset;
    u8 tieRank;
    s8 numAtCondition;
    u8 rank;

    // Get round 1 points
    for (i = 0; i < 4; i++)
        conditions[i] = gContestMonRound1Points[i];

    // Sort round 1 points
    for (i = 0; i < 3; i++)
    {
        for (j = 3; j > i; j--)
        {
            if (conditions[j - 1] < conditions[j])
            {
                int temp;
                SWAP(conditions[j], conditions[j - 1], temp)
            }
        }
    }

    // Get round1 points at specified rank
    condition = conditions[gSpecialVar_0x8006];

    // Count number of contestants with the same number of points
    numAtCondition = 0;
    tieRank = 0;

    for (i = 0; i < 4; i++)
    {
        if (conditions[i] == condition)
        {
            numAtCondition++;
            if (i == gSpecialVar_0x8006)
                tieRank = numAtCondition;
        }
    }

    // Get rank of first contestant with the same number of points
    for (i = 0; i < 4; i++)
    {
        if (conditions[i] == condition)
            break;
    }
    rank = i;

    // Get contestant id of player at rank (taking ties into account)
    contestantOffset = tieRank;
    for (i = 0; i < 4; i++)
    {
        if (condition == gContestMonRound1Points[i])
        {
            if (contestantOffset == 1)
                break;
            contestantOffset--;
        }
    }

    // Use contestant id to get names
    Contest_CopyAndConvertNicknameI_Intl(gStringVar1, i);

    if (gIsLinkContest & 1)
        Contest_CopyAndConvertTrainerName_Intl(gStringVar2, gLinkPlayers[i].name);
    else
        Contest_CopyAndConvertTrainerName_Intl(gStringVar2, gContestMons[i].trainerName);

    // Return adjusted rank
    if (numAtCondition == 1)
        gSpecialVar_0x8006 = rank;
    else if (tieRank == numAtCondition)
        gSpecialVar_0x8006 = rank;
    else
        gSpecialVar_0x8006 = rank + 4;
}

void ShowContestWinnerCleanup(void)
{
    SetMainCallback2(CB2_ReturnToFieldContinueScriptPlayMapMusic);
}

// File boundary?

void ShowContestWinner(void)
{
    if(gUnknown_0203856C)
    {
        sub_80AAF30();
        eCurContestWinnerIsForArtist = TRUE;
        eCurContestWinnerSaveIdx = GetContestWinnerSaveIdx(CONTEST_SAVE_FOR_ARTIST, 0);
        Contest_SaveWinner(3);
        gUnknown_0203856C = 0;
    }
    SetMainCallback2(CB2_ContestPainting);
    gMain.savedCallback = ShowContestWinnerCleanup;
}

void ScrSpecial_SetLinkContestTrainerGfxIdx(void)
{
    VarSet(VAR_OBJ_GFX_ID_0, gContestMons[0].trainerGfxId);
    VarSet(VAR_OBJ_GFX_ID_1, gContestMons[1].trainerGfxId);
    VarSet(VAR_OBJ_GFX_ID_2, gContestMons[2].trainerGfxId);
    VarSet(VAR_OBJ_GFX_ID_3, gContestMons[3].trainerGfxId);
}

bool8 GiveMonArtistRibbon(void)
{
    u8 ribbon = GetMonData(&gPlayerParty[gContestMonPartyIndex], MON_DATA_ARTIST_RIBBON);

    if(ribbon == FALSE
    && gContestFinalStandings[gContestPlayerMonIndex] == 0
    && gSpecialVar_ContestRank == 3
    && gContestMonTotalPoints[gContestPlayerMonIndex] >= 800)
    {
        ribbon = TRUE;
        SetMonData(&gPlayerParty[gContestMonPartyIndex], MON_DATA_ARTIST_RIBBON, &ribbon);
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

u8 sub_80C5044(void)
{
    return gUnknown_0203856C;
}

void ShowContestEntryMonPic(void)
{
    const struct CompressedSpritePalette *palette;
    u32 var1, var2;
    u16 species;
    u8 spriteId;
    u8 taskId;

    if(FindTaskIdByFunc(sub_80C5190) == 0xFF)
    {
        u8 left = CONTEST_ENTRY_PIC_LEFT;
        u8 top = CONTEST_ENTRY_PIC_TOP;

        Menu_DrawStdWindowFrame(left, top, 19, 13);
        species = gContestMons[gSpecialVar_0x8006].species;
        var1 = gContestMons[gSpecialVar_0x8006].personality;
        var2 = gContestMons[gSpecialVar_0x8006].otId;
        taskId = CreateTask(sub_80C5190, 0x50);
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].data[1] = species;
        HandleLoadSpecialPokePic(
          &gMonFrontPicTable[species],
          gMonFrontPicCoords[species].coords,
          gMonFrontPicCoords[species].y_offset,
          gMonSpriteGfx_Sprite_ptr[0],
          gMonSpriteGfx_Sprite_ptr[1],
          species,
          var1);
        palette = GetMonSpritePalStructFromOtIdPersonality(species, var2, var1);
        LoadCompressedObjectPalette(palette);
        GetMonSpriteTemplate_803C56C(species, 1);
        gCreatingSpriteTemplate.paletteTag = palette->tag;
        spriteId = CreateSprite(&gCreatingSpriteTemplate, 0x78, 0x40, 0);
        gTasks[taskId].data[2] = spriteId;
        gTasks[taskId].data[3] = left;
        gTasks[taskId].data[4] = top;
        gSprites[spriteId].callback = SpriteCallbackDummy;
        gSprites[spriteId].oam.priority = 0;
    }
}

void sub_80C5164(void)
{
    u8 taskId = FindTaskIdByFunc(sub_80C5190);

    if(taskId != 0xFF)
        gTasks[taskId].data[0]++;
}

void sub_80C5190(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    struct Sprite *sprite;

    switch(task->data[0])
    {
    case 2:
        sprite = &gSprites[task->data[2]];
        FreeSpritePaletteByTag(GetSpritePaletteTagByPaletteNum(sprite->oam.paletteNum));

        if(sprite->oam.affineMode)
            FreeOamMatrix(sprite->oam.matrixNum);

        DestroySprite(sprite);
        task->data[0]++;
        break;
    case 0:
        task->data[0]++;
        break;
    case 3:
        Menu_EraseWindowRect(task->data[3], task->data[4], task->data[3] + 9, task->data[4] + 10);
        DestroyTask(taskId);
        break;
    case 1:
    default:
        break;
    }
}

void ScriptGetMultiplayerId(void)
{
    if(gIsLinkContest & 1)
        gSpecialVar_Result = GetMultiplayerId();
    else
        gSpecialVar_Result = 4;
}

void ScriptRandom(void)
{
    u16 random;
    u16 *scriptPtr;

    if(gIsLinkContest & 1)
    {
        gContestRngValue = 1103515245 * gContestRngValue + 24691;
        random = gContestRngValue >> 16;
        scriptPtr = &gSpecialVar_Result;
    }
    else
    {
        scriptPtr = &gSpecialVar_Result;
        random = Random();
    }
    *scriptPtr = random % *scriptPtr;
}

void ScrSpecial_HealPlayerParty(void)
{
    u8 i, j;
    u8 ppBonuses;
    u8 arg[4];

    // restore HP.
    for(i = 0; i < gPlayerPartyCount; i++)
    {
        u16 maxHP = GetMonData(&gPlayerParty[i], MON_DATA_MAX_HP);
        arg[0] = maxHP;
        arg[1] = maxHP >> 8;
        SetMonData(&gPlayerParty[i], MON_DATA_HP, arg);
        ppBonuses = GetMonData(&gPlayerParty[i], MON_DATA_PP_BONUSES);

        // restore PP.
        for(j = 0; j < 4; j++)
        {
            arg[0] = CalculatePPWithBonus(GetMonData(&gPlayerParty[i], MON_DATA_MOVE1 + j), ppBonuses, j);
            SetMonData(&gPlayerParty[i], MON_DATA_PP1 + j, arg);
        }

        // since status is u32, the four 0 assignments here are probably for safety to prevent undefined data from reaching SetMonData.
        arg[0] = 0;
        arg[1] = 0;
        arg[2] = 0;
        arg[3] = 0;
        SetMonData(&gPlayerParty[i], MON_DATA_STATUS, arg);
    }
}

u8 ScriptGiveMon(u16 species, u8 level, u16 item, u32 unused1, u32 unused2, u8 unused3)
{
    u16 nationalDexNum;
    int sentToPc;
    u8 heldItem[2];
    struct Pokemon mon;

    CreateMon(&mon, species, level, 32, 0, 0, 0, 0);
    heldItem[0] = item;
    heldItem[1] = item >> 8;
    SetMonData(&mon, MON_DATA_HELD_ITEM, heldItem);
    sentToPc = GiveMonToPlayer(&mon);
    nationalDexNum = SpeciesToNationalPokedexNum(species);

    switch(sentToPc)
    {
    case 0:
    case 1:
        GetSetPokedexFlag(nationalDexNum, 2);
        GetSetPokedexFlag(nationalDexNum, 3);
        break;
    }
    return sentToPc;
}

u8 ScriptGiveEgg(u16 species)
{
    struct Pokemon mon;
    u8 isEgg;

    CreateEgg(&mon, species, TRUE);
    isEgg = TRUE;
    SetMonData(&mon, MON_DATA_IS_EGG, &isEgg);

    return GiveMonToPlayer(&mon);
}

void HasEnoughMonsForDoubleBattle(void)
{
    switch (GetMonsStateToDoubles())
    {
    case PLAYER_HAS_TWO_USABLE_MONS:
        gSpecialVar_Result = PLAYER_HAS_TWO_USABLE_MONS;
        break;
    case PLAYER_HAS_ONE_MON:
        gSpecialVar_Result = PLAYER_HAS_ONE_MON;
        break;
    case PLAYER_HAS_ONE_USABLE_MON:
        gSpecialVar_Result = PLAYER_HAS_ONE_USABLE_MON;
        break;
    }
}

bool8 CheckPartyMonHasHeldItem(u16 item)
{
    int i;

    for(i = 0; i < 6; i++)
    {
        u16 species = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2);
        if(species != SPECIES_NONE && species != SPECIES_EGG && GetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM) == item)
            return TRUE;
    }
    return FALSE;
}

bool8 GetNameOfEnigmaBerryInPlayerParty(void)
{
    bool8 hasItem = CheckPartyMonHasHeldItem(ITEM_ENIGMA_BERRY);

    if(hasItem == TRUE)
        GetBerryNameByBerryType(ItemIdToBerryType(ITEM_ENIGMA_BERRY), gStringVar1);

    return hasItem;
}

void CreateScriptedWildMon(u16 species, u8 level, u16 item)
{
    u8 heldItem[2];

    ZeroEnemyPartyMons();
    CreateMon(&gEnemyParty[0], species, level, 0x20, 0, 0, 0, 0);

    if(item)
    {
        heldItem[0] = item;
        heldItem[1] = item >> 8;
        SetMonData(&gEnemyParty[0], MON_DATA_HELD_ITEM, heldItem);
    }
}

void ScriptSetMonMoveSlot(u8 monIndex, u16 move, u8 slot)
{
    if(monIndex > 6)
        monIndex = gPlayerPartyCount - 1;

    SetMonMoveSlot(&gPlayerParty[monIndex], move, slot);
}

void sub_80C5568(void)
{
    gMain.savedCallback = sub_80C5580;
    sub_8121E10();
}

void sub_80C5580(void)
{
    u8 var = gSelectedOrderFromParty[0];

    switch(var)
    {
    case 0:
        gSpecialVar_Result = 0;
        break;
    default:
        gSpecialVar_Result = 1;
        break;
    }

    SetMainCallback2(CB2_ReturnToFieldContinueScriptPlayMapMusic);
}

void ChooseBattleTowerPlayerParty(void)
{
    gMain.savedCallback = SetBattleTowerPlayerParty;
    sub_8121E34();
}

void SetBattleTowerPlayerParty(void)
{
    u8 var = gSelectedOrderFromParty[0];

    switch(var)
    {
    case 0: // player quit battle tower?
        LoadPlayerParty();
        gSpecialVar_Result = 0;
        break;
    default: // load battle tower.
        ReducePlayerPartyToThree();
        gSpecialVar_Result = 1;
        break;
    }

    SetMainCallback2(CB2_ReturnToFieldContinueScriptPlayMapMusic);
}

void ReducePlayerPartyToThree(void)
{
    struct Pokemon party[3];
    int i;

    CpuFill32(0, party, sizeof party);

    // copy the selected pokemon according to the order.
    for(i = 0; i < 3; i++)
        if(gSelectedOrderFromParty[i]) // as long as the order keeps going (did the player select 1 mon? 2? 3?), do not stop
            party[i] = gPlayerParty[gSelectedOrderFromParty[i] - 1]; // index is 0 based, not literal

    // delete the last 3 pokemon
    CpuFill32(0, gPlayerParty, sizeof gPlayerParty);

    // overwrite the first 3 with the order copied to.
    for(i = 0; i < 3; i++)
        gPlayerParty[i] = party[i];

    CalculatePlayerPartyCount();
}
