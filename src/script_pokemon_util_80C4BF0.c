#include "global.h"
#include "battle.h"
#include "berry.h"
#include "choose_party.h"
#include "contest.h"
#include "contest_link_80C2020.h"
#include "contest_painting.h"
#include "data2.h"
#include "daycare.h"
#include "debug.h"
#include "decompress.h"
#include "event_data.h"
#include "constants/items.h"
#include "link.h"
#include "load_save.h"
#include "main.h"
#include "menu.h"
#include "pokedex.h"
#include "pokemon.h"
#include "random.h"
#include "overworld.h"
#include "script_pokemon_80C4.h"
#include "constants/species.h"
#include "task.h"
#include "ewram.h"

extern void sub_80C4674();
extern void sub_80C4698(u8 *, u8);

#define CONTEST_ENTRY_PIC_LEFT 10
#define CONTEST_ENTRY_PIC_TOP 3

extern struct SpriteTemplate gUnknown_02024E8C;

extern u8 gContestPlayerMonIndex;
extern u8 gIsLinkContest;
extern u8 gPlayerPartyCount;
extern u8 gSelectedOrderFromParty[];

extern u16 gSpecialVar_0x8004;
extern u16 gSpecialVar_0x8005;
extern u16 gSpecialVar_0x8006;

extern u16 gSpecialVar_ContestCategory;
extern u16 gSpecialVar_ContestRank;
extern u16 gSpecialVar_Result;

extern u32 gUnknown_03005D28;

extern u8 gUnknown_02038694;
extern u8 gUnknown_0203856C;
extern u8 gContestFinalStandings[];
extern s16 gUnknown_02038670[];
extern s16 gUnknown_02038678[];

void sub_80C4BF0(void)
{
    gSaveBlock1.vars[0x10] = gContestMons[0].trainerGfxId;
    gSaveBlock1.vars[0x11] = gContestMons[1].trainerGfxId;
    gSaveBlock1.vars[0x12] = gContestMons[2].trainerGfxId;
}

void sub_80C4C28(void)
{
    u16 var;
    u8 specialVar = gSpecialVar_0x8005;

    switch(specialVar)
    {
    case 0:
        var = 3;
        break;
    case 1:
        var = 4;
        break;
    case 2:
        var = 5;
        break;
    default:
        var = 100;
        break;
    }
    gSpecialVar_0x8004 = var;
}

void sub_80C4C64(void)
{
    sub_80C46EC();
    sub_80C4740();
    sub_80C48F4();
}

void sub_80C4C78(void)
{
    u16 var;
    u16 returnVar;

    switch(gSpecialVar_ContestCategory)
    {
    case 0:
        var = 8;
        break;
    case 1:
        var = 9;
        break;
    case 2:
        var = 10;
        break;
    case 3:
        var = 11;
        break;
    case 4:
    default:
        var = 12;
        break;
    }

    returnVar = gSaveBlock1.contestWinners[var].species;

    if(returnVar == 0)
        gSpecialVar_0x8004 = returnVar;
    else
        gSpecialVar_0x8004 = 1;
}

void sub_80C4CEC(void)
{
    Contest_SaveWinner(0xFF);
}

void sub_80C4CF8(void)
{
    if(!gContestFinalStandings[gContestPlayerMonIndex]
    && gSpecialVar_ContestRank == 3
    && gUnknown_02038678[gContestPlayerMonIndex] >= 800)
    {
        gSpecialVar_0x8004 = 1;
    }
    else
    {
        gSpecialVar_0x8004 = 0;
    }
}

u8 sub_80C4D50(void)
{
    u8 retVar = 0;
    int i;

    for (i = 0; i < 5; i++)
        if (gSaveBlock1.museumPortraits[i].species != 0)
            retVar++;

    return retVar;
}

void sub_80C4D80(void)
{
    s16 sp0[4];
    s32 i;
    s32 j;
    s16 r4;
    u8 r2;
    u8 r7;
    s8 r10;
    u8 r4_;

    for (i = 0; i < 4; i++)
        sp0[i] = gUnknown_02038670[i];

    for (i = 0; i < 3; i++)
    {
        for (j = 3; j > i; j--)
        {
            if (sp0[j - 1] < sp0[j])
            {
                s32 temp = sp0[j];

                sp0[j] = sp0[j - 1];
                sp0[j - 1] = temp;
            }
        }
    }

    r4 = sp0[gSpecialVar_0x8006];
    r10 = 0;
    r7 = 0;

    for (i = 0; i < 4; i++)
    {
        if (sp0[i] == r4)
        {
            r10++;
            if (i == gSpecialVar_0x8006)
                r7 = r10;
        }
    }

    for (i = 0; i < 4; i++)
    {
        if (sp0[i] == r4)
            break;
    }

    r4_ = i;
    r2 = r7;

    for (i = 0; i < 4; i++)
    {
        if (r4 == gUnknown_02038670[i])
        {
            if (r2 == 1)
                break;
            r2--;
        }
    }

    sub_80C4698(gStringVar1, i);

    if (gIsLinkContest & 1)
        sub_80C4674(gStringVar2, gLinkPlayers[i].name);
    else
        sub_80C4674(gStringVar2, gContestMons[i].trainerName);

    if (r10 == 1 || r7 == r10)
        gSpecialVar_0x8006 = r4_;
    else
        gSpecialVar_0x8006 = r4_ + 4;
}

void ShowContestWinnerCleanup(void)
{
    SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
}

void ShowContestWinner(void)
{
    if(gUnknown_0203856C)
    {
        sub_80AAF30();
        BATTLE_STRUCT->unk15DDF = 1;
        BATTLE_STRUCT->unk15DDE = sub_80B2C4C(254, 0);
        Contest_SaveWinner(3);
        gUnknown_0203856C = 0;
    }
    SetMainCallback2(CB2_ContestPainting);
    gMain.savedCallback = ShowContestWinnerCleanup;
}

void sub_80C4F70(void)
{
    VarSet(0x4010, gContestMons[0].trainerGfxId);
    VarSet(0x4011, gContestMons[1].trainerGfxId);
    VarSet(0x4012, gContestMons[2].trainerGfxId);
    VarSet(0x4013, gContestMons[3].trainerGfxId);
}

bool8 GiveMonArtistRibbon(void)
{
    u8 ribbon = GetMonData(&gPlayerParty[gUnknown_02038694], MON_DATA_ARTIST_RIBBON);

    if(ribbon == FALSE
    && gContestFinalStandings[gContestPlayerMonIndex] == 0
    && gSpecialVar_ContestRank == 3
    && gUnknown_02038678[gContestPlayerMonIndex] >= 800)
    {
        ribbon = TRUE;
        SetMonData(&gPlayerParty[gUnknown_02038694], MON_DATA_ARTIST_RIBBON, &ribbon);
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

        MenuDrawTextWindow(left, top, 19, 13);
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
          (u32)gUnknown_081FAF4C[0],
          gUnknown_081FAF4C[1],
          species,
          var1);
        palette = GetMonSpritePalStructFromOtIdPersonality(species, var2, var1);
        LoadCompressedObjectPalette(palette);
        GetMonSpriteTemplate_803C56C(species, 1);
        gUnknown_02024E8C.paletteTag = palette->tag;
        spriteId = CreateSprite(&gUnknown_02024E8C, 0x78, 0x40, 0);
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
        MenuZeroFillWindowRect(task->data[3], task->data[4], task->data[3] + 9, task->data[4] + 10);
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
        gUnknown_03005D28 = 1103515245 * gUnknown_03005D28 + 24691;
        random = gUnknown_03005D28 >> 16;
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

void CheckForAlivePartyMons(void)
{
    u8 var = sub_803DAA0();

    switch(var)
    {
    case 1:
        gSpecialVar_Result = var;
        break;
    case 0:
        gSpecialVar_Result = var;
        break;
    case 2:
        gSpecialVar_Result = var;
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

    SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
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

    SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
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
