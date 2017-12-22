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

extern u16 gScriptContestCategory;
extern u16 gScriptContestRank;
extern u16 gScriptResult;

extern u32 gUnknown_03005D28;

extern u8 gUnknown_02038694;
extern u8 gUnknown_0203856C;
extern u8 gUnknown_02038690[];
extern u16 gUnknown_02038678[];

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

    switch(gScriptContestCategory)
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
    sub_80B2A7C(0xFF);
}

void sub_80C4CF8(void)
{
    if(!gUnknown_02038690[gContestPlayerMonIndex]
    && gScriptContestRank == 3
    && (s16)gUnknown_02038678[gContestPlayerMonIndex] >= 800)
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

// nope. too hard
__attribute__((naked))
void sub_80C4D80(void)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x8\n\
    ldr r0, _080C4EA0 @ =gUnknown_02038670\n\
    mov r12, r0\n\
    ldr r1, _080C4EA4 @ =gSpecialVar_0x8006\n\
    mov r8, r1\n\
    ldr r2, _080C4EA8 @ =gStringVar1\n\
    mov r9, r2\n\
    mov r2, r12\n\
    mov r1, sp\n\
    movs r6, 0x3\n\
_080C4D9E:\n\
    ldrh r0, [r2]\n\
    strh r0, [r1]\n\
    adds r2, 0x2\n\
    adds r1, 0x2\n\
    subs r6, 0x1\n\
    cmp r6, 0\n\
    bge _080C4D9E\n\
    movs r6, 0\n\
_080C4DAE:\n\
    movs r1, 0x3\n\
    cmp r1, r6\n\
    ble _080C4DD8\n\
_080C4DB4:\n\
    subs r4, r1, 0x1\n\
    lsls r0, r4, 1\n\
    mov r5, sp\n\
    adds r3, r5, r0\n\
    lsls r0, r1, 1\n\
    adds r2, r5, r0\n\
    ldrh r5, [r3]\n\
    movs r7, 0\n\
    ldrsh r1, [r3, r7]\n\
    movs r7, 0\n\
    ldrsh r0, [r2, r7]\n\
    cmp r1, r0\n\
    bge _080C4DD2\n\
    strh r5, [r2]\n\
    strh r0, [r3]\n\
_080C4DD2:\n\
    adds r1, r4, 0\n\
    cmp r1, r6\n\
    bgt _080C4DB4\n\
_080C4DD8:\n\
    adds r6, 0x1\n\
    cmp r6, 0x2\n\
    ble _080C4DAE\n\
    mov r2, r8\n\
    ldrh r0, [r2]\n\
    lsls r0, 1\n\
    add r0, sp\n\
    ldrh r0, [r0]\n\
    movs r2, 0\n\
    movs r7, 0\n\
    movs r6, 0\n\
    lsls r0, 16\n\
    asrs r4, r0, 16\n\
    adds r3, r0, 0\n\
    mov r1, sp\n\
_080C4DF6:\n\
    movs r5, 0\n\
    ldrsh r0, [r1, r5]\n\
    cmp r0, r4\n\
    bne _080C4E12\n\
    lsls r0, r2, 24\n\
    movs r2, 0x80\n\
    lsls r2, 17\n\
    adds r0, r2\n\
    lsrs r2, r0, 24\n\
    mov r5, r8\n\
    ldrh r5, [r5]\n\
    cmp r6, r5\n\
    bne _080C4E12\n\
    adds r7, r2, 0\n\
_080C4E12:\n\
    adds r1, 0x2\n\
    adds r6, 0x1\n\
    cmp r6, 0x3\n\
    ble _080C4DF6\n\
    movs r6, 0\n\
    mov r0, sp\n\
    movs r1, 0\n\
    ldrsh r0, [r0, r1]\n\
    asrs r1, r3, 16\n\
    lsls r2, 24\n\
    mov r10, r2\n\
    cmp r0, r1\n\
    beq _080C4E40\n\
    adds r2, r1, 0\n\
    mov r1, sp\n\
_080C4E30:\n\
    adds r1, 0x2\n\
    adds r6, 0x1\n\
    cmp r6, 0x3\n\
    bgt _080C4E40\n\
    movs r4, 0\n\
    ldrsh r0, [r1, r4]\n\
    cmp r0, r2\n\
    bne _080C4E30\n\
_080C4E40:\n\
    lsls r0, r6, 24\n\
    lsrs r4, r0, 24\n\
    adds r2, r7, 0\n\
    movs r6, 0\n\
    asrs r5, r3, 16\n\
    mov r8, r5\n\
    mov r1, r12\n\
    movs r5, 0\n\
    ldrsh r0, [r1, r5]\n\
    cmp r8, r0\n\
    bne _080C4E60\n\
    cmp r7, 0x1\n\
    beq _080C4E78\n\
_080C4E5A:\n\
    subs r0, r2, 0x1\n\
    lsls r0, 24\n\
    lsrs r2, r0, 24\n\
_080C4E60:\n\
    adds r6, 0x1\n\
    cmp r6, 0x3\n\
    bgt _080C4E78\n\
    lsls r0, r6, 1\n\
    add r0, r12\n\
    asrs r1, r3, 16\n\
    movs r5, 0\n\
    ldrsh r0, [r0, r5]\n\
    cmp r1, r0\n\
    bne _080C4E60\n\
    cmp r2, 0x1\n\
    bne _080C4E5A\n\
_080C4E78:\n\
    lsls r1, r6, 24\n\
    lsrs r1, 24\n\
    mov r0, r9\n\
    bl sub_80C4698\n\
    ldr r0, _080C4EAC @ =gIsLinkContest\n\
    ldrb r1, [r0]\n\
    movs r0, 0x1\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080C4EB8\n\
    ldr r0, _080C4EB0 @ =gStringVar2\n\
    lsls r1, r6, 3\n\
    subs r1, r6\n\
    lsls r1, 2\n\
    ldr r2, _080C4EB4 @ =gLinkPlayers + 0x8\n\
    adds r1, r2\n\
    bl sub_80C4674\n\
    b _080C4EC4\n\
    .align 2, 0\n\
_080C4EA0: .4byte gUnknown_02038670\n\
_080C4EA4: .4byte gSpecialVar_0x8006\n\
_080C4EA8: .4byte gStringVar1\n\
_080C4EAC: .4byte gIsLinkContest\n\
_080C4EB0: .4byte gStringVar2\n\
_080C4EB4: .4byte gLinkPlayers + 0x8\n\
_080C4EB8:\n\
    ldr r0, _080C4ED8 @ =gStringVar2\n\
    lsls r1, r6, 6\n\
    ldr r2, _080C4EDC @ =gUnknown_0203857D\n\
    adds r1, r2\n\
    bl sub_80C4674\n\
_080C4EC4:\n\
    mov r1, r10\n\
    asrs r0, r1, 24\n\
    cmp r0, 0x1\n\
    beq _080C4ED0\n\
    cmp r7, r0\n\
    bne _080C4EE4\n\
_080C4ED0:\n\
    ldr r0, _080C4EE0 @ =gSpecialVar_0x8006\n\
    strh r4, [r0]\n\
    b _080C4EEA\n\
    .align 2, 0\n\
_080C4ED8: .4byte gStringVar2\n\
_080C4EDC: .4byte gUnknown_0203857D\n\
_080C4EE0: .4byte gSpecialVar_0x8006\n\
_080C4EE4:\n\
    ldr r1, _080C4EFC @ =gSpecialVar_0x8006\n\
    adds r0, r4, 0x4\n\
    strh r0, [r1]\n\
_080C4EEA:\n\
    add sp, 0x8\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080C4EFC: .4byte gSpecialVar_0x8006\n\
    .syntax divided");
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
        sub_80B2A7C(3);
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
    && gUnknown_02038690[gContestPlayerMonIndex] == 0
    && gScriptContestRank == 3
    && (s16)gUnknown_02038678[gContestPlayerMonIndex] >= 800)
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
        gScriptResult = GetMultiplayerId();
    else
        gScriptResult = 4;
}

void ScriptRandom(void)
{
    u16 random;
    u16 *scriptPtr;

    if(gIsLinkContest & 1)
    {
        gUnknown_03005D28 = 1103515245 * gUnknown_03005D28 + 24691;
        random = gUnknown_03005D28 >> 16;
        scriptPtr = &gScriptResult;
    }
    else
    {
        scriptPtr = &gScriptResult;
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
        gScriptResult = var;
        break;
    case 0:
        gScriptResult = var;
        break;
    case 2:
        gScriptResult = var;
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
        gScriptResult = 0;
        break;
    default:
        gScriptResult = 1;
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
        gScriptResult = 0;
        break;
    default: // load battle tower.
        ReducePlayerPartyToThree();
        gScriptResult = 1;
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
