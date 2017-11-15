#include "global.h"
#include "pokemon_summary_screen.h"
#include "data2.h"
#include "ewram.h"
#include "item.h"
#include "items.h"
#include "link.h"
#include "menu.h"
#include "menu_helpers.h"
#include "overworld.h"
#include "palette.h"
#include "party_menu.h"
#include "pokeball.h"
#include "pokemon.h"
#include "region_map.h"
#include "sound.h"
#include "species.h"
#include "sprite.h"
#include "string_util.h"
#include "strings.h"
#include "strings2.h"
#include "task.h"
#include "tv.h"

struct SummaryScreenStruct
{
    /*0x00*/ u8 filler0[9];
    /*0x09*/ u8 unk9;
    /*0x0A*/ u8 fillerA;
    /*0x0B*/ u8 unkB;
    /*0x0C*/ u8 fillerC;
    /*0x0D*/ u8 unkD;
    /*0x0E*/ u8 fillerE[0x2];
    /*0x10*/ struct Pokemon unk10;
    /*0x74*/ u8 filler74;
    /*0x75*/ u8 unk75;
    /*0x76*/ u8 unk76;
    /*0x77*/ u8 filler77[0x2];
    /*0x79*/ u8 unk79;
    /*0x7A*/ u8 unk7A;
    /*0x7B*/ u8 filler7B[0x3];
    /*0x7E*/ u8 unk7E;
    /*0x7F*/ u8 unk7F;
};

#define ewramSS (*(struct SummaryScreenStruct *)(gSharedMem + 0x18000))

extern void sub_80A20A8(u8);
extern u8 ball_number_to_ball_processing_index(u16);
extern void sub_809F678(struct Pokemon *);
extern void sub_80A1BC0(struct Sprite *sprite);
extern void sub_80A1888(struct Sprite *);
extern void sub_80A00F4(s16);
extern void sub_80A0428(struct Pokemon *, s16*);
extern void sub_80A18E4(u8);
extern void GetStringCenterAlignXOffset(u8, u8, u8);
extern u8 *sub_80A1E58(u8 *, u8);
static void sub_80A0A2C(struct Pokemon *, u8, u8);
extern void sub_80A1FF8(const u8 *, u8, u8, u8);

extern TaskFunc gUnknown_03005CF0;
extern const u8 gUnknown_083C15BC[];
extern struct Sprite *gUnknown_020384F4;
extern const u16 gSummaryScreenMonMarkingsPalette[];
extern struct SpriteTemplate gSpriteTemplate_83C1304;
extern struct SpriteTemplate gSpriteTemplate_83C1280;
extern const u8 gUnknown_083C11D8[];
extern struct SpriteTemplate gSpriteTemplate_83C11C0;
extern struct SpriteTemplate gUnknown_02024E8C;
extern const u16 gUnknown_08E94510[];
extern const u16 gUnknown_08E94550[];
extern const u16 gUnknown_08E94590[];
extern const u8 gUnknown_08E73E88[];
extern const u8 gUnknown_083C15AE[];
extern const u8 gUnknown_083C15B4[];
extern const u8 *const gUnknown_083C1068[];

bool8 PokemonSummaryScreen_CheckOT(struct Pokemon *mon)
{
    u32 trainerId;

    if (ewram18000_3 == gEnemyParty)
    {
        u8 enemyId = GetMultiplayerId() ^ 1;
        trainerId = gLinkPlayers[enemyId].trainerId & 0xFFFF;
        StringCopy(gStringVar1, gLinkPlayers[enemyId].name);
        StripExtCtrlCodes(gStringVar1);
    }
    else
    {
        trainerId = GetPlayerTrainerId() & 0xFFFF;
        StringCopy(gStringVar1, gSaveBlock2.playerName);
    }

    if (trainerId != (GetMonData(mon, MON_DATA_OT_ID) & 0xFFFF))
        return FALSE;

    GetMonData(mon, MON_DATA_OT_NAME, gStringVar2);

    if (!StringCompareWithoutExtCtrlCodes(gStringVar1, gStringVar2))
        return TRUE;

    return FALSE;
}

void PokemonSummaryScreen_PrintEggTrainerMemo(struct Pokemon *mon, u8 left, u8 top)
{
    u8 locationMet;
    u8 gameMet = GetMonData(mon, MON_DATA_MET_GAME);

    if (!(gameMet == VERSION_RUBY || gameMet == VERSION_SAPPHIRE || gameMet == VERSION_EMERALD))
    {
        MenuPrint(gOtherText_EggObtainedInTrade, left, top);
        return;
    }

    locationMet = GetMonData(mon, MON_DATA_MET_LOCATION);

    if (locationMet == 255)
    {
        // Eggs received from Pokemon Box.
        MenuPrint(gOtherText_EggNicePlace, left, top);
        return;
    }

    if (!PokemonSummaryScreen_CheckOT(mon))
    {
        MenuPrint(gOtherText_EggObtainedInTrade, left, top);
        return;
    }

    asm(""); // needed to match for some reason

    if (locationMet == 253)
    {
        MenuPrint(gOtherText_EggHotSprings, left, top);
        return;
    }

    MenuPrint(gOtherText_EggDayCare, left, top);
}

void PokemonSummaryScreen_PrintTrainerMemo(struct Pokemon *pokemon, u8 left, u8 top)
{
    u8 locationMet;
    u8 gameMet;
    u8 *ptr = gStringVar4;
    u8 nature = GetNature(pokemon);

#if ENGLISH
    ptr = sub_80A1E9C(ptr, gNatureNames[nature], 14);

    if (nature != NATURE_BOLD && nature != NATURE_GENTLE)
    {
        ptr = StringCopy(ptr, gOtherText_Terminator4);
    }

    ptr = StringCopy(ptr, gOtherText_Nature);
#elif GERMAN
    ptr = StringCopy(gStringVar4, gOtherText_Nature);
    ptr = sub_80A1E9C(ptr, gNatureNames[nature], 14);
    ptr = StringCopy(ptr, gOtherText_Terminator4);
#endif

    if (PokemonSummaryScreen_CheckOT(pokemon) == TRUE)
    {
        locationMet = GetMonData(pokemon, MON_DATA_MET_LOCATION);

        if (GetMonData(pokemon, MON_DATA_MET_LEVEL) == 0)
        {
            ptr = PokemonSummaryScreen_CopyPokemonLevel(ptr, 5);
            *ptr = CHAR_NEWLINE;
            ptr++;

            CopyLocationName(gStringVar1, locationMet);
            ptr = sub_80A1E9C(ptr, gStringVar1, 14);
            StringCopy(ptr, gOtherText_Egg2);
        }
        else if (locationMet >= 88)
        {
            *ptr = CHAR_NEWLINE;
            ptr++;

            StringCopy(ptr, gOtherText_ObtainedInTrade);
        }
        else
        {
            u8 levelMet = GetMonData(pokemon, MON_DATA_MET_LEVEL);

            ptr = PokemonSummaryScreen_CopyPokemonLevel(ptr, levelMet);
            *ptr = CHAR_NEWLINE;
            ptr++;

            CopyLocationName(gStringVar1, locationMet);
            ptr = sub_80A1E9C(ptr, gStringVar1, 14);
            StringCopy(ptr, gOtherText_Met);
        }
    }
    else
    {
        gameMet = GetMonData(pokemon, MON_DATA_MET_GAME);

        if (!(gameMet == VERSION_RUBY || gameMet == VERSION_SAPPHIRE || gameMet == VERSION_EMERALD))
        {
            *ptr = CHAR_NEWLINE;
            ptr++;

            StringCopy(ptr, gOtherText_ObtainedInTrade);
        }
        else
        {
            locationMet = GetMonData(pokemon, MON_DATA_MET_LOCATION);
            if (locationMet == 0xFF)
            {
                u8 levelMet = GetMonData(pokemon, MON_DATA_MET_LEVEL);

                ptr = PokemonSummaryScreen_CopyPokemonLevel(ptr, levelMet);
                *ptr = CHAR_NEWLINE;
                ptr++;

                StringCopy(ptr, gOtherText_FatefulEncounter);
            }
            else if (locationMet >= 88)
            {
                *ptr = CHAR_NEWLINE;
                ptr++;

                StringCopy(ptr, gOtherText_ObtainedInTrade);
            }
            else
            {
                u8 levelMet = GetMonData(pokemon, MON_DATA_MET_LEVEL);

                ptr = PokemonSummaryScreen_CopyPokemonLevel(ptr, levelMet);
                *ptr = CHAR_NEWLINE;
                ptr++;

                CopyLocationName(gStringVar1, locationMet);
                ptr = sub_80A1E9C(ptr, gStringVar1, 14);
                StringCopy(ptr, gOtherText_Met2);
            }
        }
    }

    MenuPrint(gStringVar4, left++, top++);
}

void sub_80A0958(struct Pokemon *pokemon)
{
    u16 species;
    u8 *buffer;
    u8 level;

    species = GetMonData(pokemon, MON_DATA_SPECIES);

    buffer = gStringVar1;
    buffer = sub_80A1E58(buffer, 13);
    buffer[0] = EXT_CTRL_CODE_BEGIN;
    buffer[1] = 0x11;
    buffer[2] = 0x7;
    buffer[3] = CHAR_SLASH;
    buffer += 4;
    buffer = StringCopy(buffer, gSpeciesNames[species]);

    buffer[0] = EXT_CTRL_CODE_BEGIN;
    buffer[1] = 0x13;
    buffer[2] = 0x50;
    buffer[3] = EOS;

    MenuPrint(gStringVar1, 0, 14);
    MenuZeroFillWindowRect(3, 16, 9, 17);

    level = GetMonData(pokemon, MON_DATA_LEVEL);

    buffer = sub_80A1E58(gStringVar1, 13);
    buffer[0] = 0x34;
    buffer += 1;
    buffer = ConvertIntToDecimalString(buffer, level);

    buffer[0] = EXT_CTRL_CODE_BEGIN;
    buffer[1] = 0x13;
    buffer[2] = 0x20;
    buffer[3] = EOS;

    MenuPrint(gStringVar1, 3, 16);
    sub_80A0A2C(pokemon, 7, 16);
}

void sub_80A0A2C(struct Pokemon *pokemon, u8 left, u8 top)
{
    const u8 *genderSymbol;
    u8 var1;
    u8 bottom;
    u16 species = GetMonData(pokemon, MON_DATA_SPECIES2);

    if (species != SPECIES_NIDORAN_M && species != SPECIES_NIDORAN_F)
    {
        u8 gender = GetMonGender(pokemon);
        switch (gender)
        {
        default:
            bottom = top + 1;
            MenuZeroFillWindowRect(left, top, left, bottom);
            return;
        case MON_MALE:
            genderSymbol = gOtherText_MaleSymbol2;
            var1 = 11;
            break;
        case MON_FEMALE:
            genderSymbol = gOtherText_FemaleSymbolAndLv;
            var1 = 12;
            break;
        }

        sub_80A1FF8(genderSymbol, var1, left, top);
    }
}

u8 GetNumRibbons(struct Pokemon *pokemon)
{
    u8 numRibbons = GetMonData(pokemon, MON_DATA_COOL_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_BEAUTY_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_CUTE_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_SMART_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_TOUGH_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_CHAMPION_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_WINNING_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_VICTORY_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_ARTIST_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_EFFORT_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_GIFT_RIBBON_1);
    numRibbons += GetMonData(pokemon, MON_DATA_GIFT_RIBBON_2);
    numRibbons += GetMonData(pokemon, MON_DATA_GIFT_RIBBON_3);
    numRibbons += GetMonData(pokemon, MON_DATA_GIFT_RIBBON_4);
    numRibbons += GetMonData(pokemon, MON_DATA_GIFT_RIBBON_5);
    numRibbons += GetMonData(pokemon, MON_DATA_GIFT_RIBBON_6);
    numRibbons += GetMonData(pokemon, MON_DATA_GIFT_RIBBON_7);

    return numRibbons;
}

void PrintNumRibbons(struct Pokemon *pokemon)
{
    u8 numRibbons = GetNumRibbons(pokemon);

    if (numRibbons == 0)
    {
        StringCopy(gStringVar1, gOtherText_None);
    }
    else
    {
        u8 ribbonsStringLength;
        u8 *text;

        StringCopy(gStringVar1, gOtherText_Ribbons00);
        ribbonsStringLength = StringLength(gStringVar1);

        text = &gStringVar1[ribbonsStringLength - 2];

        text[0] = EXT_CTRL_CODE_BEGIN;
        text[1] = 0x14;
        text[2] = 6;
        ConvertIntToDecimalStringN(&text[3], numRibbons, 1, 2);
    }

    MenuPrint(gUnknown_083C15AE, 21, 4);
}

void PrintHeldItemName(u16 itemId, u8 left, u8 top)
{
    if (itemId == ITEM_ENIGMA_BERRY
        && sub_80F9344() == TRUE
        && IsLinkDoubleBattle() == TRUE
        && (ewramSS.unk9 == 1 || ewramSS.unk9 == 4 || ewramSS.unk9 == 5))
    {
        StringCopy(gStringVar1, ItemId_GetItem(itemId)->name);
    }
    else if (itemId == 0)
    {
        StringCopy(gStringVar1, gOtherText_None);
    }
    else
    {
        CopyItemName(itemId, gStringVar1);
    }

    MenuPrint(gUnknown_083C15B4, left, top);
}

void DrawExperienceProgressBar(struct Pokemon *pokemon, u8 left, u8 top)
{
    u32 curExperience;
    u8 level;
    u16 species;
    u8 i;
    u16 *vramAddr;
    u32 expToNextLevel = 0;
    s64 numExpProgressBarTicks = 0;

    curExperience = GetMonData(pokemon, MON_DATA_EXP);
    level = GetMonData(pokemon, MON_DATA_LEVEL);
    species = GetMonData(pokemon, MON_DATA_SPECIES);

    // The experience progress bar is shown as empty when the Pokemon is already level 100.
    if (level < 100)
    {
        u32 nextLevelExp;
        u32 expSinceLastLevel;
        u32 expBetweenLevels;
        u32 curLevelExperience;

        nextLevelExp = gExperienceTables[gBaseStats[species].growthRate][level + 1];
        expToNextLevel = nextLevelExp - curExperience;
        curLevelExperience = gExperienceTables[gBaseStats[species].growthRate][level];
        expBetweenLevels = (nextLevelExp - curLevelExperience);
        expSinceLastLevel = curExperience - curLevelExperience;

        // Calculate the number of 1-pixel "ticks" to illuminate in the experience progress bar.
        // There are 8 tiles that make up the bar, and each tile has 8 "ticks". Hence, the numerator
        // is multiplied by 64.
        numExpProgressBarTicks = (expSinceLastLevel * 64) / expBetweenLevels;
        if (numExpProgressBarTicks == 0 && expSinceLastLevel != 0)
        {
            // Ensure sure some exp. gain is visible in the progress bar.
            numExpProgressBarTicks = 1;
        }
    }

    ConvertIntToDecimalString(gStringVar1, expToNextLevel);
    MenuPrint_RightAligned(gStringVar1, left + 6, top);


    // Draw each of the 8 tiles that make up the experience progress bar.
    vramAddr = (u16 *)(VRAM + 0x4CAA);
    for (i = 0; i < 8; i++)
    {
        u16 tile;
        u16 baseTile = 0x2062;

        if (numExpProgressBarTicks > 7)
        {
            tile = 0x206A; // full exp. bar block
        }
        else
        {
            tile = (numExpProgressBarTicks % 8) + baseTile;
        }

        vramAddr[i] = tile;

        numExpProgressBarTicks -= 8;
        if (numExpProgressBarTicks < 0)
        {
            numExpProgressBarTicks = 0;
        }
    }
}

// Prints the text displayed in the top-left or top-right of the screen.
// Each of the 4 summary screens displays different text.
void PrintSummaryWindowHeaderText(void)
{
    u8 *buffer = gStringVar1;

    buffer[0] = EXT_CTRL_CODE_BEGIN;
    buffer[1] = 0x12;
    buffer[2] = 0x2;

    buffer += 3;
    buffer = sub_80A1E58(buffer, 13);
    buffer = StringCopy(buffer, gUnknown_083C1068[ewramSS.unk7E]);

    buffer[0] = EXT_CTRL_CODE_BEGIN;
    buffer[1] = 0x13;
    buffer[2] = 0x58;
    buffer[3] = EOS;

    MenuPrint(gStringVar1, 0, 0);

    if (ewramSS.unk7F != 0)
    {
        GetStringCenterAlignXOffset(5, 23, 0);
        GetStringCenterAlignXOffset(6, 24, 0);
    }
    else
    {
        MenuZeroFillWindowRect(23, 0, 24, 1);
    }

    buffer = gStringVar1;
    buffer = sub_80A1E58(buffer, 13);
    buffer = StringCopy(buffer, gUnknown_083C1068[ewramSS.unk7F]);

    buffer[0] = EXT_CTRL_CODE_BEGIN;
    buffer[1] = 0x13;
    buffer[2] = 0x28;
    buffer[3] = EOS;

    MenuPrint(gStringVar1, 25, 0);
}

// If the given pokemon previously had the pokerus virus, a small
// dot will be drawn in between the pokeball and the mon's level.
void DrawPokerusSurvivorDot(struct Pokemon *pokemon)
{
    u16 *vram1 = (u16 *)(VRAM + 0xE444);
    u16 *vram2 = (u16 *)(VRAM + 0xEC44);

    if (!CheckPartyPokerus(pokemon, 0) && CheckPartyHasHadPokerus(pokemon, 0))
    {
        *vram1 = 0x2C;
        *vram2 = 0x2C;
    }
    else
    {
        *vram1 = 0x081A;
        *vram2 = 0x081A;
    }
}

// Draws the 4 small navigation circles at the top of the pokemon summary screen.
#ifdef NONMATCHING
void DrawSummaryScreenNavigationDots(void)
{
    void *dest;
    u16 arr[8];
    u8 i = 0;
    struct SummaryScreenStruct *SS = (struct SummaryScreenStruct *)(gSharedMem + 0x18000);
    u16 var1 = 0x4040;
    u16 var2 = 0x404A;

    for (i = 0; i < 4; i++)
    {
        if (i < SS->unk75)
        {
            arr[i * 2] = var1;
            arr[(i * 2) + 1] = var1 + 1;
        }
        else if (i > SS->unk76)
        {
            arr[i * 2] = var2;
            arr[(i * 2) + 1] = var2 + 1;
        }
        else
        {
            if (i < SS->unkB)
            {
                arr[i * 2] = 0x4046;
                arr[(i * 2) + 1] = 0x4046 + 1;
            }

            if (i == SS->unkB)
            {
                if (i != SS->unk76)
                {
                    arr[i * 2] = 0x4041;
                    arr[(i * 2) + 1] = 0x4041 + 1;
                }
                else
                {
                    arr[i * 2] = 0x404B;
                    arr[(i * 2) + 1] = 0x404B + 1;
                }
            }

            if (i > SS->unkB)
            {
                if (i != SS->unk76)
                {
                    arr[i * 2] = 0x4043;
                    arr[(i * 2) + 1] = 0x4043 + 1;
                }
                else
                {
                    arr[i * 2] = 0x4048;
                    arr[(i * 2) + 1] = 0x4048 + 1;
                }
            }
        }
    }

    dest = (void *)(VRAM + 0xE016);
    DmaCopy16(3, arr, dest, 16);

    for (i = 0; i < 8; i++)
    {
        arr[i] += 0x10;
    }

    dest = (void *)(VRAM + 0xE056);
    DmaCopy16(3, arr, dest, 16);
}
#else
__attribute__((naked))
void DrawSummaryScreenNavigationDots(void)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x10\n\
    movs r3, 0\n\
    ldr r6, _080A0F24 @ =gSharedMem + 0x18000\n\
    adds r5, r6, 0\n\
    ldr r1, _080A0F28 @ =0x00004040\n\
    mov r8, r1\n\
    ldr r2, _080A0F2C @ =0x0000404a\n\
    mov r10, r2\n\
_080A0F02:\n\
    adds r0, r5, 0\n\
    adds r0, 0x75\n\
    ldrb r0, [r0]\n\
    cmp r3, r0\n\
    bcs _080A0F30\n\
    lsls r1, r3, 1\n\
    lsls r0, r3, 2\n\
    add r0, sp\n\
    mov r4, r8\n\
    strh r4, [r0]\n\
    adds r1, 0x1\n\
    lsls r1, 1\n\
    mov r7, sp\n\
    adds r0, r7, r1\n\
    strh r4, [r0]\n\
    b _080A0FE2\n\
    .align 2, 0\n\
_080A0F24: .4byte gSharedMem + 0x18000\n\
_080A0F28: .4byte 0x00004040\n\
_080A0F2C: .4byte 0x0000404a\n\
_080A0F30:\n\
    movs r0, 0x76\n\
    adds r0, r6\n\
    mov r12, r0\n\
    ldrb r1, [r0]\n\
    cmp r3, r1\n\
    bls _080A0F52\n\
    lsls r1, r3, 1\n\
    lsls r0, r3, 2\n\
    add r0, sp\n\
    mov r2, r10\n\
    strh r2, [r0]\n\
    adds r1, 0x1\n\
    lsls r1, 1\n\
    mov r4, sp\n\
    adds r0, r4, r1\n\
    strh r2, [r0]\n\
    b _080A0FE2\n\
_080A0F52:\n\
    ldrb r4, [r5, 0xB]\n\
    cmp r3, r4\n\
    bcs _080A0F6E\n\
    lsls r1, r3, 1\n\
    lsls r0, r3, 2\n\
    mov r7, sp\n\
    adds r2, r7, r0\n\
    ldr r0, _080A0F88 @ =0x00004046\n\
    strh r0, [r2]\n\
    adds r1, 0x1\n\
    lsls r1, 1\n\
    add r1, sp\n\
    adds r0, 0x1\n\
    strh r0, [r1]\n\
_080A0F6E:\n\
    cmp r3, r4\n\
    bne _080A0FA6\n\
    mov r0, r12\n\
    ldrb r0, [r0]\n\
    cmp r3, r0\n\
    beq _080A0F90\n\
    lsls r1, r3, 1\n\
    lsls r0, r3, 2\n\
    mov r4, sp\n\
    adds r2, r4, r0\n\
    ldr r0, _080A0F8C @ =0x00004041\n\
    b _080A0F9A\n\
    .align 2, 0\n\
_080A0F88: .4byte 0x00004046\n\
_080A0F8C: .4byte 0x00004041\n\
_080A0F90:\n\
    lsls r1, r3, 1\n\
    lsls r0, r3, 2\n\
    mov r7, sp\n\
    adds r2, r7, r0\n\
    ldr r0, _080A0FC4 @ =0x0000404b\n\
_080A0F9A:\n\
    strh r0, [r2]\n\
    adds r1, 0x1\n\
    lsls r1, 1\n\
    add r1, sp\n\
    adds r0, 0x1\n\
    strh r0, [r1]\n\
_080A0FA6:\n\
    ldrb r0, [r5, 0xB]\n\
    cmp r3, r0\n\
    bls _080A0FE2\n\
    adds r0, r6, 0\n\
    adds r0, 0x76\n\
    ldrb r0, [r0]\n\
    cmp r3, r0\n\
    beq _080A0FCC\n\
    lsls r1, r3, 1\n\
    lsls r0, r3, 2\n\
    mov r4, sp\n\
    adds r2, r4, r0\n\
    ldr r0, _080A0FC8 @ =0x00004043\n\
    b _080A0FD6\n\
    .align 2, 0\n\
_080A0FC4: .4byte 0x0000404b\n\
_080A0FC8: .4byte 0x00004043\n\
_080A0FCC:\n\
    lsls r1, r3, 1\n\
    lsls r0, r3, 2\n\
    mov r7, sp\n\
    adds r2, r7, r0\n\
    ldr r0, _080A1034 @ =0x00004048\n\
_080A0FD6:\n\
    strh r0, [r2]\n\
    adds r1, 0x1\n\
    lsls r1, 1\n\
    add r1, sp\n\
    adds r0, 0x1\n\
    strh r0, [r1]\n\
_080A0FE2:\n\
    adds r0, r3, 0x1\n\
    lsls r0, 24\n\
    lsrs r3, r0, 24\n\
    cmp r3, 0x3\n\
    bls _080A0F02\n\
    ldr r1, _080A1038 @ =0x0600e016\n\
    ldr r0, _080A103C @ =0x040000d4\n\
    mov r2, sp\n\
    str r2, [r0]\n\
    str r1, [r0, 0x4]\n\
    ldr r1, _080A1040 @ =0x80000008\n\
    str r1, [r0, 0x8]\n\
    ldr r0, [r0, 0x8]\n\
    movs r3, 0\n\
_080A0FFE:\n\
    lsls r0, r3, 1\n\
    mov r4, sp\n\
    adds r1, r4, r0\n\
    ldrh r0, [r1]\n\
    adds r0, 0x10\n\
    strh r0, [r1]\n\
    adds r0, r3, 0x1\n\
    lsls r0, 24\n\
    lsrs r3, r0, 24\n\
    cmp r3, 0x7\n\
    bls _080A0FFE\n\
    ldr r1, _080A1044 @ =0x0600e056\n\
    ldr r0, _080A103C @ =0x040000d4\n\
    str r4, [r0]\n\
    str r1, [r0, 0x4]\n\
    ldr r1, _080A1040 @ =0x80000008\n\
    str r1, [r0, 0x8]\n\
    ldr r0, [r0, 0x8]\n\
    add sp, 0x10\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080A1034: .4byte 0x00004048\n\
_080A1038: .4byte 0x0600e016\n\
_080A103C: .4byte 0x040000d4\n\
_080A1040: .4byte 0x80000008\n\
_080A1044: .4byte 0x0600e056\n\
    .syntax divided\n");
}
#endif // NONMATCHING

__attribute__((naked))
void sub_80A1048(u8 taskId)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r8\n\
    push {r7}\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r8, r0\n\
    lsls r0, 2\n\
    add r0, r8\n\
    lsls r0, 3\n\
    ldr r1, _080A10A0 @ =gTasks + 0x8\n\
    adds r6, r0, r1\n\
    ldrh r0, [r6]\n\
    ldrh r1, [r6, 0x2]\n\
    adds r0, r1\n\
    strh r0, [r6, 0x2]\n\
    lsls r0, 16\n\
    cmp r0, 0\n\
    bne _080A106E\n\
    b _080A1224\n\
_080A106E:\n\
    movs r5, 0x2\n\
    ldrsh r2, [r6, r5]\n\
    ldr r0, _080A10A4 @ =0x0000024a\n\
    subs r0, r2\n\
    lsls r0, 1\n\
    ldr r1, _080A10A8 @ =gUnknown_08E73508\n\
    adds r4, r0, r1\n\
    ldr r5, _080A10AC @ =0x0600e480\n\
    lsls r2, 1\n\
    movs r0, 0x80\n\
    lsls r0, 5\n\
    adds r7, r1, 0\n\
    cmp r2, r0\n\
    bhi _080A10B4\n\
    ldr r0, _080A10B0 @ =0x040000d4\n\
    str r4, [r0]\n\
    str r5, [r0, 0x4]\n\
    lsrs r1, r2, 1\n\
    movs r2, 0x80\n\
    lsls r2, 24\n\
    orrs r1, r2\n\
    str r1, [r0, 0x8]\n\
    ldr r0, [r0, 0x8]\n\
    b _080A10E0\n\
    .align 2, 0\n\
_080A10A0: .4byte gTasks + 0x8\n\
_080A10A4: .4byte 0x0000024a\n\
_080A10A8: .4byte gUnknown_08E73508\n\
_080A10AC: .4byte 0x0600e480\n\
_080A10B0: .4byte 0x040000d4\n\
_080A10B4:\n\
    ldr r3, _080A110C @ =0x040000d4\n\
    str r4, [r3]\n\
    str r5, [r3, 0x4]\n\
    ldr r0, _080A1110 @ =0x80000800\n\
    str r0, [r3, 0x8]\n\
    ldr r0, [r3, 0x8]\n\
    movs r0, 0x80\n\
    lsls r0, 5\n\
    adds r4, r0\n\
    adds r5, r0\n\
    ldr r1, _080A1114 @ =0xfffff000\n\
    adds r2, r1\n\
    cmp r2, r0\n\
    bhi _080A10B4\n\
    str r4, [r3]\n\
    str r5, [r3, 0x4]\n\
    lsrs r0, r2, 1\n\
    movs r1, 0x80\n\
    lsls r1, 24\n\
    orrs r0, r1\n\
    str r0, [r3, 0x8]\n\
    ldr r0, [r3, 0x8]\n\
_080A10E0:\n\
    movs r5, 0x2\n\
    ldrsh r0, [r6, r5]\n\
    ldr r1, _080A1118 @ =0x0000026a\n\
    subs r1, r0\n\
    lsls r1, 1\n\
    adds r3, r1, r7\n\
    ldr r4, _080A111C @ =0x0600e4c0\n\
    lsls r1, r0, 1\n\
    movs r0, 0x80\n\
    lsls r0, 5\n\
    cmp r1, r0\n\
    bhi _080A1120\n\
    ldr r0, _080A110C @ =0x040000d4\n\
    str r3, [r0]\n\
    str r4, [r0, 0x4]\n\
    lsrs r1, 1\n\
    movs r2, 0x80\n\
    lsls r2, 24\n\
    orrs r1, r2\n\
    str r1, [r0, 0x8]\n\
    ldr r0, [r0, 0x8]\n\
    b _080A114C\n\
    .align 2, 0\n\
_080A110C: .4byte 0x040000d4\n\
_080A1110: .4byte 0x80000800\n\
_080A1114: .4byte 0xfffff000\n\
_080A1118: .4byte 0x0000026a\n\
_080A111C: .4byte 0x0600e4c0\n\
_080A1120:\n\
    ldr r2, _080A1178 @ =0x040000d4\n\
    str r3, [r2]\n\
    str r4, [r2, 0x4]\n\
    ldr r0, _080A117C @ =0x80000800\n\
    str r0, [r2, 0x8]\n\
    ldr r0, [r2, 0x8]\n\
    movs r0, 0x80\n\
    lsls r0, 5\n\
    adds r3, r0\n\
    adds r4, r0\n\
    ldr r5, _080A1180 @ =0xfffff000\n\
    adds r1, r5\n\
    cmp r1, r0\n\
    bhi _080A1120\n\
    str r3, [r2]\n\
    str r4, [r2, 0x4]\n\
    lsrs r0, r1, 1\n\
    movs r1, 0x80\n\
    lsls r1, 24\n\
    orrs r0, r1\n\
    str r0, [r2, 0x8]\n\
    ldr r0, [r2, 0x8]\n\
_080A114C:\n\
    movs r1, 0x2\n\
    ldrsh r0, [r6, r1]\n\
    ldr r1, _080A1184 @ =0x0000024a\n\
    subs r1, r0\n\
    lsls r1, 1\n\
    adds r3, r1, r7\n\
    ldr r4, _080A1188 @ =0x0600ec80\n\
    lsls r1, r0, 1\n\
    movs r0, 0x80\n\
    lsls r0, 5\n\
    cmp r1, r0\n\
    bhi _080A118C\n\
    ldr r0, _080A1178 @ =0x040000d4\n\
    str r3, [r0]\n\
    str r4, [r0, 0x4]\n\
    lsrs r1, 1\n\
    movs r2, 0x80\n\
    lsls r2, 24\n\
    orrs r1, r2\n\
    str r1, [r0, 0x8]\n\
    ldr r0, [r0, 0x8]\n\
    b _080A11B8\n\
    .align 2, 0\n\
_080A1178: .4byte 0x040000d4\n\
_080A117C: .4byte 0x80000800\n\
_080A1180: .4byte 0xfffff000\n\
_080A1184: .4byte 0x0000024a\n\
_080A1188: .4byte 0x0600ec80\n\
_080A118C:\n\
    ldr r2, _080A11E4 @ =0x040000d4\n\
    str r3, [r2]\n\
    str r4, [r2, 0x4]\n\
    ldr r0, _080A11E8 @ =0x80000800\n\
    str r0, [r2, 0x8]\n\
    ldr r0, [r2, 0x8]\n\
    movs r0, 0x80\n\
    lsls r0, 5\n\
    adds r3, r0\n\
    adds r4, r0\n\
    ldr r5, _080A11EC @ =0xfffff000\n\
    adds r1, r5\n\
    cmp r1, r0\n\
    bhi _080A118C\n\
    str r3, [r2]\n\
    str r4, [r2, 0x4]\n\
    lsrs r0, r1, 1\n\
    movs r1, 0x80\n\
    lsls r1, 24\n\
    orrs r0, r1\n\
    str r0, [r2, 0x8]\n\
    ldr r0, [r2, 0x8]\n\
_080A11B8:\n\
    movs r1, 0x2\n\
    ldrsh r0, [r6, r1]\n\
    ldr r1, _080A11F0 @ =0x0000026a\n\
    subs r1, r0\n\
    lsls r1, 1\n\
    adds r3, r1, r7\n\
    ldr r4, _080A11F4 @ =0x0600ecc0\n\
    lsls r1, r0, 1\n\
    movs r0, 0x80\n\
    lsls r0, 5\n\
    cmp r1, r0\n\
    bhi _080A11F8\n\
    ldr r0, _080A11E4 @ =0x040000d4\n\
    str r3, [r0]\n\
    str r4, [r0, 0x4]\n\
    lsrs r1, 1\n\
    movs r2, 0x80\n\
    lsls r2, 24\n\
    orrs r1, r2\n\
    str r1, [r0, 0x8]\n\
    ldr r0, [r0, 0x8]\n\
    b _080A1224\n\
    .align 2, 0\n\
_080A11E4: .4byte 0x040000d4\n\
_080A11E8: .4byte 0x80000800\n\
_080A11EC: .4byte 0xfffff000\n\
_080A11F0: .4byte 0x0000026a\n\
_080A11F4: .4byte 0x0600ecc0\n\
_080A11F8:\n\
    ldr r2, _080A12B0 @ =0x040000d4\n\
    str r3, [r2]\n\
    str r4, [r2, 0x4]\n\
    ldr r0, _080A12B4 @ =0x80000800\n\
    str r0, [r2, 0x8]\n\
    ldr r0, [r2, 0x8]\n\
    movs r0, 0x80\n\
    lsls r0, 5\n\
    adds r3, r0\n\
    adds r4, r0\n\
    ldr r5, _080A12B8 @ =0xfffff000\n\
    adds r1, r5\n\
    cmp r1, r0\n\
    bhi _080A11F8\n\
    str r3, [r2]\n\
    str r4, [r2, 0x4]\n\
    lsrs r0, r1, 1\n\
    movs r1, 0x80\n\
    lsls r1, 24\n\
    orrs r0, r1\n\
    str r0, [r2, 0x8]\n\
    ldr r0, [r2, 0x8]\n\
_080A1224:\n\
    ldrb r4, [r6, 0x2]\n\
    ldrh r7, [r6, 0x2]\n\
    ldrh r0, [r6]\n\
    mov r12, r0\n\
    cmp r4, 0x9\n\
    bhi _080A1272\n\
    adds r3, r6, 0x4\n\
    ldr r2, _080A12B0 @ =0x040000d4\n\
    ldr r5, _080A12BC @ =0x80000001\n\
_080A1236:\n\
    lsls r1, r4, 1\n\
    ldr r6, _080A12C0 @ =0x0600e480\n\
    adds r0, r1, r6\n\
    str r3, [r2]\n\
    str r0, [r2, 0x4]\n\
    str r5, [r2, 0x8]\n\
    ldr r0, [r2, 0x8]\n\
    adds r6, 0x40\n\
    adds r0, r1, r6\n\
    str r3, [r2]\n\
    str r0, [r2, 0x4]\n\
    str r5, [r2, 0x8]\n\
    ldr r0, [r2, 0x8]\n\
    ldr r6, _080A12C4 @ =0x0600ec80\n\
    adds r0, r1, r6\n\
    str r3, [r2]\n\
    str r0, [r2, 0x4]\n\
    str r5, [r2, 0x8]\n\
    ldr r0, [r2, 0x8]\n\
    ldr r0, _080A12C8 @ =0x0600ecc0\n\
    adds r1, r0\n\
    str r3, [r2]\n\
    str r1, [r2, 0x4]\n\
    str r5, [r2, 0x8]\n\
    ldr r0, [r2, 0x8]\n\
    adds r0, r4, 0x1\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    cmp r4, 0x9\n\
    bls _080A1236\n\
_080A1272:\n\
    mov r1, r12\n\
    lsls r0, r1, 16\n\
    cmp r0, 0\n\
    beq _080A1286\n\
    lsls r0, r7, 16\n\
    asrs r0, 16\n\
    cmp r0, 0\n\
    ble _080A1286\n\
    cmp r0, 0x9\n\
    ble _080A12A4\n\
_080A1286:\n\
    lsls r0, r7, 16\n\
    asrs r0, 16\n\
    cmp r0, 0x9\n\
    ble _080A129A\n\
    ldr r0, _080A12CC @ =gOtherText_Status\n\
    movs r1, 0xD\n\
    movs r2, 0x1\n\
    movs r3, 0x12\n\
    bl sub_80A1FF8\n\
_080A129A:\n\
    bl sub_80A1D18\n\
    mov r0, r8\n\
    bl DestroyTask\n\
_080A12A4:\n\
    pop {r3}\n\
    mov r8, r3\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080A12B0: .4byte 0x040000d4\n\
_080A12B4: .4byte 0x80000800\n\
_080A12B8: .4byte 0xfffff000\n\
_080A12BC: .4byte 0x80000001\n\
_080A12C0: .4byte 0x0600e480\n\
_080A12C4: .4byte 0x0600ec80\n\
_080A12C8: .4byte 0x0600ecc0\n\
_080A12CC: .4byte gOtherText_Status\n\
    .syntax divided\n");
}

void sub_80A12D0(u8 taskId)
{
    u8 newTaskId;

    MenuZeroFillWindowRect(1, 18, 5, 19);
    sub_80A18E4(29);

    newTaskId = CreateTask(sub_80A1048, 0);
    gTasks[newTaskId].data[0] = (s8)taskId;

    if ((s8)taskId < 0)
    {
        gTasks[newTaskId].data[1] = 10;
    }
    else
    {
        gTasks[newTaskId].data[1] = 0;
    }

    gTasks[newTaskId].data[2] = 1;
}

// void sub_80A1334(u8 taskId)
// {
//     u8 i;
//     s16 var1;

//     gTasks[taskId].data[1] += gTasks[taskId].data[0];

//     var1 = 0;
//     if (gTasks[taskId].data[1] >= 0)
//     {
//         var1 = 10;
//         if (gTasks[taskId].data[1] < 10)
//         {
//             var1 = gTasks[taskId].data[1];
//         }
//     }

//     if (var1 > 0)
//     {
//         u8 *vramAddr = (u8 *)(VRAM + 0x5B40);
//         for (i = 0; i < 7; i++)
//         {
//             CpuSet(&gUnknown_08E73E88[(i + 13) * 64], vramAddr, var1 & 0x1FFFFF);
//             vramAddr += 64;
//         }
//     }

//     if (var1 <= 9)
//     {
//         u8 *vramAddr = (u8 *)(VRAM + 0x5B40);
//         for (i = 0; i < 64; i++)
//         {
//             u16 val = gTasks[taskId].data[2];
//             CpuSet(&val, vramAddr, ((10 - var1) & 0x1FFFFF) | 0x800000);
//         }
//     }
//     else
//     {
//         MenuZeroFillWindowRect(0, 19, 9, 19);
//     }

//     if (gTasks[taskId].data[0] == 0 || gTasks[taskId].data[1] < 0)
//     {
//         if (ewramSS.unkB == 2)
//         {
//             MenuZeroFillWindowRect(0, 14, 9, 18);
//             sub_80A0958(ewramSS.unk10);

//             if (GetMonStatusAndPokerus(ewramSS.unk10))
//             {
//                 sub_80A1FF8(gOtherText_Status, 13, 1, 18);
//             }

//             DestroyTask(taskId);
//         }
//     }

//     if (gTasks[taskId].data[1] > 9)
//     {
//         if (ewramSS.unkB == 2)
//         {
//             sub_80A00F4(gTasks[taskId].data[3]);
//         }

//         sub_80A0428(ewramSS.unk10, &gTasks[taskId].data[3]);
//         DestroyTask(taskId);
//     }
// }
__attribute__((naked))
void sub_80A1334(u8 taskId)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x4\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r10, r0\n\
    lsls r0, 2\n\
    add r0, r10\n\
    lsls r0, 3\n\
    ldr r1, _080A13E4 @ =gTasks + 0x8\n\
    adds r7, r0, r1\n\
    ldrh r0, [r7]\n\
    ldrh r1, [r7, 0x2]\n\
    adds r0, r1\n\
    strh r0, [r7, 0x2]\n\
    lsls r0, 16\n\
    asrs r1, r0, 16\n\
    movs r0, 0\n\
    cmp r1, 0\n\
    blt _080A136A\n\
    movs r0, 0xA\n\
    cmp r1, 0xA\n\
    bgt _080A136A\n\
    ldrh r0, [r7, 0x2]\n\
_080A136A:\n\
    lsls r0, 16\n\
    asrs r2, r0, 16\n\
    mov r9, r0\n\
    cmp r2, 0\n\
    ble _080A13A6\n\
    movs r0, 0xA\n\
    subs r0, r2\n\
    lsls r0, 1\n\
    ldr r1, _080A13E8 @ =0x06005b40\n\
    adds r4, r0, r1\n\
    movs r5, 0\n\
    adds r6, r2, 0\n\
    ldr r0, _080A13EC @ =0x001fffff\n\
    mov r8, r0\n\
_080A1386:\n\
    adds r0, r5, 0\n\
    adds r0, 0xD\n\
    lsls r0, 6\n\
    ldr r1, _080A13F0 @ =gUnknown_08E73E88\n\
    adds r0, r1\n\
    adds r1, r4, 0\n\
    mov r2, r8\n\
    ands r2, r6\n\
    bl CpuSet\n\
    adds r4, 0x40\n\
    adds r0, r5, 0x1\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    cmp r5, 0x6\n\
    bls _080A1386\n\
_080A13A6:\n\
    mov r1, r9\n\
    asrs r2, r1, 16\n\
    cmp r2, 0x9\n\
    bgt _080A13F4\n\
    ldr r4, _080A13E8 @ =0x06005b40\n\
    movs r5, 0\n\
    mov r8, sp\n\
    movs r0, 0xA\n\
    subs r6, r0, r2\n\
    ldr r0, _080A13EC @ =0x001fffff\n\
    ands r6, r0\n\
    movs r0, 0x80\n\
    lsls r0, 17\n\
    mov r9, r0\n\
_080A13C2:\n\
    ldrh r0, [r7, 0x4]\n\
    mov r1, r8\n\
    strh r0, [r1]\n\
    mov r0, sp\n\
    adds r1, r4, 0\n\
    mov r2, r9\n\
    orrs r2, r6\n\
    bl CpuSet\n\
    adds r4, 0x40\n\
    adds r0, r5, 0x1\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    cmp r5, 0x6\n\
    bls _080A13C2\n\
    b _080A1400\n\
    .align 2, 0\n\
_080A13E4: .4byte gTasks + 0x8\n\
_080A13E8: .4byte 0x06005b40\n\
_080A13EC: .4byte 0x001fffff\n\
_080A13F0: .4byte gUnknown_08E73E88\n\
_080A13F4:\n\
    movs r0, 0\n\
    movs r1, 0x13\n\
    movs r2, 0x9\n\
    movs r3, 0x13\n\
    bl MenuZeroFillWindowRect\n\
_080A1400:\n\
    movs r1, 0\n\
    ldrsh r0, [r7, r1]\n\
    cmp r0, 0\n\
    beq _080A1410\n\
    movs r1, 0x2\n\
    ldrsh r0, [r7, r1]\n\
    cmp r0, 0\n\
    bge _080A144A\n\
_080A1410:\n\
    ldr r4, _080A1480 @ =gSharedMem + 0x18000\n\
    ldrb r0, [r4, 0xB]\n\
    cmp r0, 0x2\n\
    bne _080A1444\n\
    movs r0, 0\n\
    movs r1, 0xE\n\
    movs r2, 0x9\n\
    movs r3, 0x12\n\
    bl MenuZeroFillWindowRect\n\
    adds r4, 0x10\n\
    adds r0, r4, 0\n\
    bl sub_80A0958\n\
    adds r0, r4, 0\n\
    bl GetMonStatusAndPokerus\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _080A1444\n\
    ldr r0, _080A1484 @ =gOtherText_Status\n\
    movs r1, 0xD\n\
    movs r2, 0x1\n\
    movs r3, 0x12\n\
    bl sub_80A1FF8\n\
_080A1444:\n\
    mov r0, r10\n\
    bl DestroyTask\n\
_080A144A:\n\
    movs r1, 0x2\n\
    ldrsh r0, [r7, r1]\n\
    cmp r0, 0x9\n\
    ble _080A1470\n\
    ldr r4, _080A1480 @ =gSharedMem + 0x18000\n\
    ldrb r0, [r4, 0xB]\n\
    cmp r0, 0x2\n\
    bne _080A1460\n\
    ldrb r0, [r7, 0x6]\n\
    bl sub_80A00F4\n\
_080A1460:\n\
    adds r0, r4, 0\n\
    adds r0, 0x10\n\
    adds r1, r7, 0x6\n\
    bl sub_80A0428\n\
    mov r0, r10\n\
    bl DestroyTask\n\
_080A1470:\n\
    add sp, 0x4\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080A1480: .4byte gSharedMem + 0x18000\n\
_080A1484: .4byte gOtherText_Status\n\
    .syntax divided\n");
}

// Related to re-drawing the summary area underneath the pokemon's picture
// in all of the summary screen tabs.
void sub_80A1488(u8 a, u8 b)
{
    u8 taskId;

    if (ewramSS.unkB == 2)
    {
        MenuZeroFillWindowRect(0, 14, 9, 19);
    }

    taskId = FindTaskIdByFunc(sub_80A1334);
    if (taskId == 0xFF)
    {
        taskId = CreateTask(sub_80A1334, 0);
    }

    gTasks[taskId].data[0] = (s8)a;

    if ((s8)a < 0)
    {
        gTasks[taskId].data[1] = 10;
    }
    else
    {
        gTasks[taskId].data[1] = 0;
    }

    gTasks[taskId].data[2] = 0;
    gTasks[taskId].data[3] = b;
}

__attribute__((naked))
void sub_80A1500(u8 taskId)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x4\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r10, r0\n\
    lsls r0, 2\n\
    add r0, r10\n\
    lsls r0, 3\n\
    ldr r1, _080A15B0 @ =gTasks + 0x8\n\
    adds r7, r0, r1\n\
    ldrh r0, [r7]\n\
    ldrh r1, [r7, 0x2]\n\
    adds r0, r1\n\
    strh r0, [r7, 0x2]\n\
    lsls r0, 16\n\
    asrs r1, r0, 16\n\
    movs r0, 0\n\
    cmp r1, 0\n\
    blt _080A1536\n\
    movs r0, 0xA\n\
    cmp r1, 0xA\n\
    bgt _080A1536\n\
    ldrh r0, [r7, 0x2]\n\
_080A1536:\n\
    lsls r0, 16\n\
    asrs r2, r0, 16\n\
    mov r9, r0\n\
    cmp r2, 0\n\
    ble _080A1572\n\
    movs r0, 0xA\n\
    subs r0, r2\n\
    lsls r0, 1\n\
    ldr r1, _080A15B4 @ =0x06006b40\n\
    adds r4, r0, r1\n\
    movs r5, 0\n\
    adds r6, r2, 0\n\
    ldr r0, _080A15B8 @ =0x001fffff\n\
    mov r8, r0\n\
_080A1552:\n\
    adds r0, r5, 0\n\
    adds r0, 0xD\n\
    lsls r0, 6\n\
    ldr r1, _080A15BC @ =gUnknown_08E74688\n\
    adds r0, r1\n\
    adds r1, r4, 0\n\
    mov r2, r8\n\
    ands r2, r6\n\
    bl CpuSet\n\
    adds r4, 0x40\n\
    adds r0, r5, 0x1\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    cmp r5, 0x6\n\
    bls _080A1552\n\
_080A1572:\n\
    mov r1, r9\n\
    asrs r2, r1, 16\n\
    cmp r2, 0x9\n\
    bgt _080A15C0\n\
    ldr r4, _080A15B4 @ =0x06006b40\n\
    movs r5, 0\n\
    mov r8, sp\n\
    movs r0, 0xA\n\
    subs r6, r0, r2\n\
    ldr r0, _080A15B8 @ =0x001fffff\n\
    ands r6, r0\n\
    movs r0, 0x80\n\
    lsls r0, 17\n\
    mov r9, r0\n\
_080A158E:\n\
    ldrh r0, [r7, 0x4]\n\
    mov r1, r8\n\
    strh r0, [r1]\n\
    mov r0, sp\n\
    adds r1, r4, 0\n\
    mov r2, r9\n\
    orrs r2, r6\n\
    bl CpuSet\n\
    adds r4, 0x40\n\
    adds r0, r5, 0x1\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    cmp r5, 0x6\n\
    bls _080A158E\n\
    b _080A15CC\n\
    .align 2, 0\n\
_080A15B0: .4byte gTasks + 0x8\n\
_080A15B4: .4byte 0x06006b40\n\
_080A15B8: .4byte 0x001fffff\n\
_080A15BC: .4byte gUnknown_08E74688\n\
_080A15C0:\n\
    movs r0, 0\n\
    movs r1, 0x13\n\
    movs r2, 0x9\n\
    movs r3, 0x13\n\
    bl MenuZeroFillWindowRect\n\
_080A15CC:\n\
    movs r1, 0\n\
    ldrsh r0, [r7, r1]\n\
    cmp r0, 0\n\
    beq _080A15DC\n\
    movs r1, 0x2\n\
    ldrsh r0, [r7, r1]\n\
    cmp r0, 0\n\
    bge _080A1616\n\
_080A15DC:\n\
    ldr r4, _080A164C @ =gSharedMem + 0x18000\n\
    ldrb r0, [r4, 0xB]\n\
    cmp r0, 0x3\n\
    bne _080A1610\n\
    movs r0, 0\n\
    movs r1, 0xE\n\
    movs r2, 0x9\n\
    movs r3, 0x12\n\
    bl MenuZeroFillWindowRect\n\
    adds r4, 0x10\n\
    adds r0, r4, 0\n\
    bl sub_80A0958\n\
    adds r0, r4, 0\n\
    bl GetMonStatusAndPokerus\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _080A1610\n\
    ldr r0, _080A1650 @ =gOtherText_Status\n\
    movs r1, 0xD\n\
    movs r2, 0x1\n\
    movs r3, 0x12\n\
    bl sub_80A1FF8\n\
_080A1610:\n\
    mov r0, r10\n\
    bl DestroyTask\n\
_080A1616:\n\
    movs r1, 0x2\n\
    ldrsh r0, [r7, r1]\n\
    cmp r0, 0x9\n\
    ble _080A163C\n\
    ldr r4, _080A164C @ =gSharedMem + 0x18000\n\
    ldrb r0, [r4, 0xB]\n\
    cmp r0, 0x3\n\
    bne _080A162C\n\
    ldrb r0, [r7, 0x6]\n\
    bl sub_80A00F4\n\
_080A162C:\n\
    adds r0, r4, 0\n\
    adds r0, 0x10\n\
    adds r1, r7, 0x6\n\
    bl sub_80A0428\n\
    mov r0, r10\n\
    bl DestroyTask\n\
_080A163C:\n\
    add sp, 0x4\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080A164C: .4byte gSharedMem + 0x18000\n\
_080A1650: .4byte gOtherText_Status\n\
    .syntax divided\n");
}

void sub_80A1654(u8 a, u8 b)
{
    u8 taskId;

    if (ewramSS.unkB == 3)
    {
        MenuZeroFillWindowRect(0, 14, 9, 19);
    }

    taskId = FindTaskIdByFunc(sub_80A1500);
    if (taskId == 0xFF)
    {
        taskId = CreateTask(sub_80A1500, 0);
    }

    gTasks[taskId].data[0] = (s8)a;

    if ((s8)a < 0)
    {
        gTasks[taskId].data[1] = 10;
    }
    else
    {
        gTasks[taskId].data[1] = 0;
    }

    gTasks[taskId].data[2] = 0;
    gTasks[taskId].data[3] = b;
}

#ifdef NONMATCHING
void sub_80A16CC(u8 a)
{
    u8 i;
    u16 *vramAddr = (u16 *)(VRAM + 0x6AD4);

    if (a == 0)
    {
        for (i = 0; i < 20; i++)
        {
            vramAddr[i] = gUnknown_08E94510[i] + 0x1000;
            vramAddr[i + 0x20] = gUnknown_08E94510[i] + 0x1000;
            vramAddr[i + 0x40] = gUnknown_08E94550[i] + 0x1000;
        }
    }
    else
    {
        i = 0;
        for (i = 0; i < 20; i++)
        {
            vramAddr[i] = gUnknown_08E94550[i] + 0x1000;
            vramAddr[i + 0x20] = gUnknown_08E94590[i] + 0x1000;
            vramAddr[i + 0x40] = gUnknown_08E94590[i] + 0x1000;
        }
    }

    vramAddr = (u16 *)(VRAM + 0x5AD4);

    if (a == 0)
    {
        for (i = 0; i < 20; i++)
        {
            vramAddr[i] = gUnknown_08E94510[i] + 0x3000;
            vramAddr[i + 0x20] = gUnknown_08E94510[i] + 0x3000;
            vramAddr[i + 0x40] = gUnknown_08E94550[i] + 0x3000;
        }
    }
    else
    {
        for (i = 0; i < 20; i++)
        {
            vramAddr[i] = gUnknown_08E94550[i] + 0x3000;
            vramAddr[i + 0x20] = gUnknown_08E94590[i] + 0x3000;
            vramAddr[i + 0x40] = gUnknown_08E94590[i] + 0x3000;
        }
    }
}
#else
__attribute__((naked))
void sub_80A16CC(u8 a)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r9\n\
    mov r6, r8\n\
    push {r6,r7}\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r9, r0\n\
    ldr r0, _080A1724 @ =0x06006ad4\n\
    mov r12, r0\n\
    mov r1, r9\n\
    cmp r1, 0\n\
    bne _080A172C\n\
    movs r5, 0\n\
    ldr r7, _080A1728 @ =gUnknown_08E94510\n\
    movs r0, 0x80\n\
    lsls r0, 5\n\
    adds r6, r0, 0\n\
    movs r1, 0x40\n\
    adds r1, r7\n\
    mov r8, r1\n\
_080A16F4:\n\
    lsls r2, r5, 1\n\
    mov r0, r12\n\
    adds r3, r2, r0\n\
    adds r4, r2, r7\n\
    ldrh r1, [r4]\n\
    adds r0, r6, r1\n\
    strh r0, [r3]\n\
    adds r1, r3, 0\n\
    adds r1, 0x40\n\
    ldrh r4, [r4]\n\
    adds r0, r6, r4\n\
    strh r0, [r1]\n\
    adds r3, 0x80\n\
    add r2, r8\n\
    ldrh r2, [r2]\n\
    adds r0, r6, r2\n\
    strh r0, [r3]\n\
    adds r0, r5, 0x1\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    cmp r5, 0x13\n\
    bls _080A16F4\n\
    b _080A1768\n\
    .align 2, 0\n\
_080A1724: .4byte 0x06006ad4\n\
_080A1728: .4byte gUnknown_08E94510\n\
_080A172C:\n\
    movs r5, 0\n\
    ldr r6, _080A17B0 @ =gUnknown_08E94550\n\
    movs r7, 0x80\n\
    lsls r7, 5\n\
    adds r4, r7, 0\n\
    movs r0, 0x40\n\
    adds r0, r6\n\
    mov r8, r0\n\
_080A173C:\n\
    lsls r1, r5, 1\n\
    mov r7, r12\n\
    adds r2, r1, r7\n\
    adds r0, r1, r6\n\
    ldrh r0, [r0]\n\
    adds r0, r4, r0\n\
    strh r0, [r2]\n\
    adds r3, r2, 0\n\
    adds r3, 0x40\n\
    add r1, r8\n\
    ldrh r7, [r1]\n\
    adds r0, r4, r7\n\
    strh r0, [r3]\n\
    adds r2, 0x80\n\
    ldrh r1, [r1]\n\
    adds r0, r4, r1\n\
    strh r0, [r2]\n\
    adds r0, r5, 0x1\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    cmp r5, 0x13\n\
    bls _080A173C\n\
_080A1768:\n\
    ldr r0, _080A17B4 @ =0x06005ad4\n\
    mov r12, r0\n\
    mov r1, r9\n\
    cmp r1, 0\n\
    bne _080A17BC\n\
    movs r5, 0\n\
    ldr r7, _080A17B8 @ =gUnknown_08E94510\n\
    movs r0, 0xC0\n\
    lsls r0, 6\n\
    adds r6, r0, 0\n\
    movs r1, 0x40\n\
    adds r1, r7\n\
    mov r8, r1\n\
_080A1782:\n\
    lsls r2, r5, 1\n\
    mov r0, r12\n\
    adds r3, r2, r0\n\
    adds r4, r2, r7\n\
    ldrh r1, [r4]\n\
    adds r0, r6, r1\n\
    strh r0, [r3]\n\
    adds r1, r3, 0\n\
    adds r1, 0x40\n\
    ldrh r4, [r4]\n\
    adds r0, r6, r4\n\
    strh r0, [r1]\n\
    adds r3, 0x80\n\
    add r2, r8\n\
    ldrh r2, [r2]\n\
    adds r0, r6, r2\n\
    strh r0, [r3]\n\
    adds r0, r5, 0x1\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    cmp r5, 0x13\n\
    bls _080A1782\n\
    b _080A17F8\n\
    .align 2, 0\n\
_080A17B0: .4byte gUnknown_08E94550\n\
_080A17B4: .4byte 0x06005ad4\n\
_080A17B8: .4byte gUnknown_08E94510\n\
_080A17BC:\n\
    movs r5, 0\n\
    ldr r6, _080A1804 @ =gUnknown_08E94550\n\
    movs r7, 0xC0\n\
    lsls r7, 6\n\
    adds r4, r7, 0\n\
    movs r0, 0x40\n\
    adds r0, r6\n\
    mov r8, r0\n\
_080A17CC:\n\
    lsls r1, r5, 1\n\
    mov r7, r12\n\
    adds r2, r1, r7\n\
    adds r0, r1, r6\n\
    ldrh r0, [r0]\n\
    adds r0, r4, r0\n\
    strh r0, [r2]\n\
    adds r3, r2, 0\n\
    adds r3, 0x40\n\
    add r1, r8\n\
    ldrh r7, [r1]\n\
    adds r0, r4, r7\n\
    strh r0, [r3]\n\
    adds r2, 0x80\n\
    ldrh r1, [r1]\n\
    adds r0, r4, r1\n\
    strh r0, [r2]\n\
    adds r0, r5, 0x1\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    cmp r5, 0x13\n\
    bls _080A17CC\n\
_080A17F8:\n\
    pop {r3,r4}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080A1804: .4byte gUnknown_08E94550\n\
    .syntax divided\n");
}
#endif // NONMATCHING

u8 sub_80A1808(struct Pokemon *pokemon)
{
    u16 species;
    u8 spriteId;

    species = GetMonData(pokemon, MON_DATA_SPECIES2);
    spriteId = CreateSprite(&gUnknown_02024E8C, 40, 64, 5);

    FreeSpriteOamMatrix(&gSprites[spriteId]);

    gSprites[spriteId].data0 = species;
    gSprites[spriteId].callback = sub_80A1888;

    if (!IsPokeSpriteNotFlipped(species))
    {
        gSprites[spriteId].hFlip = 1;
    }
    else
    {
        gSprites[spriteId].hFlip = 0;
    }

    return spriteId;
}

void sub_80A1888(struct Sprite *sprite)
{
    if (!gPaletteFade.active)
    {
        sprite->callback = SpriteCallbackDummy;

        if (!GetMonData(&ewramSS.unk10, MON_DATA_IS_EGG))
        {
            PlayCry1(sprite->data0, 0);
        }
    }
}

void sub_80A18C4(void)
{
    u8 i;

    for (i = 0; i < 30; i++)
    {
        ewram1A000[i] = 0xFF;
    }
}

void sub_80A18E4(u8 a)
{
    if (ewram1A000[a] != 0xFF)
    {
        DestroySprite(&gSprites[ewram1A000[a]]);
        ewram1A000[a] = 0xFF;
    }
}

void sub_80A1918(u8 a, u8 invisible)
{
    gSprites[ewram1A000[a]].invisible = invisible;
}

void sub_80A1950(void)
{
    u8 i;

    for (i = 0; i < 5; i++)
    {
        if (ewram1A000[i] == 0xFF)
        {
            ewram1A000[i] = CreateSprite(&gSpriteTemplate_83C11C0, 0, 0, 2);
        }

        sub_80A1918(i, 1);
    }
}

void sub_80A198C(u8 animNum, u8 x, u8 y, u8 d)
{
    StartSpriteAnim(&gSprites[ewram1A000[d]], animNum);

    gSprites[ewram1A000[d]].oam.paletteNum = gUnknown_083C11D8[animNum];
    gSprites[ewram1A000[d]].pos1.x = x + 16;
    gSprites[ewram1A000[d]].pos1.y = y + 8;

    sub_80A1918(d, 0);
}

void sub_80A1A30(u8 a)
{
    u8 i;
    s16 x;
    u8 subPriority = 0;

    if (ewramSS.unkB > 1)
    {
        if (a == 9)
        {
            subPriority = 1;
        }

        for (i = 0; i < 10; i++)
        {
            x = (i * 16) + 0x58;
            ewram1A000[a + i] = CreateSprite(&gSpriteTemplate_83C1280, x, 40, subPriority);

            if (i == 0)
            {
                StartSpriteAnim(&gSprites[ewram1A000[a]], 4);
            }
            else if (i == 9)
            {
                StartSpriteAnim(&gSprites[ewram1A000[a + i]], 5);
            }
            else
            {
                StartSpriteAnim(&gSprites[ewram1A000[a + i]], 6);
            }

            gSprites[ewram1A000[a + i]].callback = sub_80A1BC0;
            gSprites[ewram1A000[a + i]].data0 = a;
            gSprites[ewram1A000[a + i]].data1 = 0;
        }
    }
}

void sub_80A1B1C(u8 a)
{
    u8 i;

    for (i = 0; i < 10; i++)
    {
        sub_80A18E4(a + i);
    }
}

#ifdef NONMATCHING
void sub_80A1B40(u8 a)
{
    u8 i;
    u8 var1 = a * 3;

    StartSpriteAnim(&gSprites[ewram1A000[9]], var1 + 4);

    for (i = 0; i < 8; i++)
    {
        StartSpriteAnim(&gSprites[ewram1A000[10 + i]], var1 + 6);
    }

    StartSpriteAnim(&gSprites[ewram1A000[18]], var1 + 5);
}
#else
__attribute__((naked))
void sub_80A1B40(u8 a)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r8\n\
    push {r7}\n\
    lsls r0, 24\n\
    lsrs r7, r0, 24\n\
    lsls r1, r7, 1\n\
    adds r1, r7\n\
    lsls r1, 24\n\
    ldr r0, _080A1BB4 @ =gSharedMem + 0x1A009\n\
    ldrb r2, [r0]\n\
    lsls r0, r2, 4\n\
    adds r0, r2\n\
    lsls r0, 2\n\
    ldr r2, _080A1BB8 @ =gSprites\n\
    adds r0, r2\n\
    lsrs r7, r1, 24\n\
    movs r2, 0x80\n\
    lsls r2, 19\n\
    adds r1, r2\n\
    lsrs r1, 24\n\
    bl StartSpriteAnim\n\
    movs r4, 0\n\
    adds r0, r7, 0x6\n\
    lsls r0, 24\n\
    mov r8, r0\n\
_080A1B74:\n\
    ldr r6, _080A1BBC @ =gSharedMem + 0x1A00A\n\
    adds r0, r4, r6\n\
    ldrb r1, [r0]\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    ldr r5, _080A1BB8 @ =gSprites\n\
    adds r0, r5\n\
    mov r2, r8\n\
    lsrs r1, r2, 24\n\
    bl StartSpriteAnim\n\
    adds r0, r4, 0x1\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    cmp r4, 0x7\n\
    bls _080A1B74\n\
    ldrb r1, [r6, 0x8]\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r5\n\
    adds r1, r7, 0x5\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
    bl StartSpriteAnim\n\
    pop {r3}\n\
    mov r8, r3\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080A1BB4: .4byte gSharedMem + 0x1A009\n\
_080A1BB8: .4byte gSprites\n\
_080A1BBC: .4byte gSharedMem + 0x1A00A\n\
    .syntax divided\n");
}
#endif // NONMATCHING

void sub_80A1BC0(struct Sprite *sprite)
{
    u8 animNum = sprite->animNum - 4;
    if (animNum < 3)
    {
        sprite->data1 = (sprite->data1 + 1) & 0x1F;

        if (sprite->data1 > 24)
        {
            sprite->invisible = 1;
        }
        else
        {
            sprite->invisible = 0;
        }
    }
    else
    {
        sprite->data1 = 0;
        sprite->invisible = 0;
    }

    if (sprite->data0 == 9)
    {
        sprite->pos2.y = ewramSS.unk79 * 16;
    }
    else
    {
        sprite->pos2.y = ewramSS.unk7A * 16;
    }
}

__attribute__((naked))
void sub_80A1C30(u8 a)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    lsls r0, r4, 2\n\
    adds r0, r4\n\
    lsls r0, 25\n\
    lsrs r3, r0, 24\n\
    adds r4, r3, 0\n\
    adds r0, r3, 0\n\
    adds r0, 0xA\n\
    cmp r3, r0\n\
    bge _080A1C82\n\
    ldr r5, _080A1C88 @ =gSprites\n\
    movs r7, 0x5\n\
    negs r7, r7\n\
    ldr r6, _080A1C8C @ =gSharedMem + 0x1A009\n\
_080A1C50:\n\
    adds r2, r3, r6\n\
    ldrb r1, [r2]\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r5\n\
    movs r1, 0\n\
    strh r1, [r0, 0x30]\n\
    ldrb r0, [r2]\n\
    lsls r1, r0, 4\n\
    adds r1, r0\n\
    lsls r1, 2\n\
    adds r1, r5\n\
    adds r1, 0x3E\n\
    ldrb r2, [r1]\n\
    adds r0, r7, 0\n\
    ands r0, r2\n\
    strb r0, [r1]\n\
    adds r0, r3, 0x1\n\
    lsls r0, 24\n\
    lsrs r3, r0, 24\n\
    adds r0, r4, 0\n\
    adds r0, 0xA\n\
    cmp r3, r0\n\
    blt _080A1C50\n\
_080A1C82:\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080A1C88: .4byte gSprites\n\
_080A1C8C: .4byte gSharedMem + 0x1A009\n\
    .syntax divided\n");
}

u8 pokemon_ailments_get_primary(u32 status)
{
    if (status & 0x88)
        return 1;
    if (status & 0x40)
        return 2;
    if (status & 0x7)
        return 3;
    if (status & 0x20)
        return 4;
    if (status & 0x10)
        return 5;

    return 0;
}

u8 GetMonStatusAndPokerus(struct Pokemon *mon)
{
    u8 statusAilment;

    if (GetMonData(mon, MON_DATA_HP) == 0)
    {
        return 7;
    }

    statusAilment = pokemon_ailments_get_primary(GetMonData(mon, MON_DATA_STATUS));
    if (statusAilment == 0)
    {
        if (!CheckPartyPokerus(mon, 0))
        {
            return 0;
        }
        else
        {
            return 6;
        }
    }

    return statusAilment;
}

#ifdef NONMATCHING
void sub_80A1D18(void)
{
    struct Pokemon mon;
    u8 statusAndPkrs;
    u8 statusAndPkrs2;

    sub_809F678(&mon);
    statusAndPkrs = GetMonStatusAndPokerus(&mon);

    if (statusAndPkrs)
    {
        statusAndPkrs2 = statusAndPkrs - 1;

        if (ewram1A000[29] == 0xFF)
        {
            ewram1A000[29] = CreateSprite(&gSpriteTemplate_83C1304, 64, 152, 0);
        }
    }
    else
    {
        sub_80A18E4(29);
        return;
    }

    StartSpriteAnim(&gSprites[ewram1A000[29]], statusAndPkrs2);
}
#else
__attribute__((naked))
void sub_80A1D18(void)
{
    asm(".syntax unified\n\
    push {r4,r5,lr}\n\
    sub sp, 0x64\n\
    mov r0, sp\n\
    bl sub_809F678\n\
    mov r0, sp\n\
    bl GetMonStatusAndPokerus\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0\n\
    beq _080A1D58\n\
    subs r0, 0x1\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    ldr r4, _080A1D50 @ =gSharedMem + 0x1A01D\n\
    ldrb r0, [r4]\n\
    cmp r0, 0xFF\n\
    bne _080A1D60\n\
    ldr r0, _080A1D54 @ =gSpriteTemplate_83C1304\n\
    movs r1, 0x40\n\
    movs r2, 0x98\n\
    movs r3, 0\n\
    bl CreateSprite\n\
    strb r0, [r4]\n\
    b _080A1D60\n\
    .align 2, 0\n\
_080A1D50: .4byte gSharedMem + 0x1A01D\n\
_080A1D54: .4byte gSpriteTemplate_83C1304\n\
_080A1D58:\n\
    movs r0, 0x1D\n\
    bl sub_80A18E4\n\
    b _080A1D74\n\
_080A1D60:\n\
    ldr r0, _080A1D7C @ =gSharedMem + 0x1A01D\n\
    ldrb r1, [r0]\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    ldr r1, _080A1D80 @ =gSprites\n\
    adds r0, r1\n\
    adds r1, r5, 0\n\
    bl StartSpriteAnim\n\
_080A1D74:\n\
    add sp, 0x64\n\
    pop {r4,r5}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080A1D7C: .4byte gSharedMem + 0x1A01D\n\
_080A1D80: .4byte gSprites\n\
    .syntax divided\n");
}
#endif // NONMATCHING

void sub_80A1D84(struct Pokemon *mon)
{
    struct Sprite *sprite;

    sprite = sub_80F7920(0x7533, 0x7533, gSummaryScreenMonMarkingsPalette);
    gUnknown_020384F4 = sprite;

    if (sprite != NULL)
    {
        u8 markings = GetMonData(mon, MON_DATA_MARKINGS);
        StartSpriteAnim(sprite, markings);

        gUnknown_020384F4->pos1.x = 60;
        gUnknown_020384F4->pos1.y = 26;
    }
}

void sub_80A1DCC(struct Pokemon *mon)
{
    DestroySprite(gUnknown_020384F4);
    sub_80A1D84(mon);
}

void sub_80A1DE8(struct Pokemon *mon)
{
    u8 ball = ball_number_to_ball_processing_index(GetMonData(mon, MON_DATA_POKEBALL));
    sub_80478DC(ball);

    ewramSS.unkD = CreateSprite(&gBallSpriteTemplates[ball], 6, 136, 0);
    gSprites[ewramSS.unkD].callback = SpriteCallbackDummy;
    gSprites[ewramSS.unkD].oam.priority = 3;
}

u8 *sub_80A1E58(u8 *text, u8 id)
{
    if (id != 0xFF)
    {
        const u8 *ptr = gUnknown_083C15BC;
        while (*ptr != 0xFF && *ptr != id)
        {
            ptr += 4;
        }

        text[0] = EXT_CTRL_CODE_BEGIN;
        text[1] = 4;
        text[2] = ptr[1];
        text[3] = ptr[2];
        text[4] = ptr[3];

        text += 5;
    }

    return text;
}

u8 *sub_80A1E9C(u8 *dest, const u8 *src, u8 id)
{
    u8 arr[3];

    sub_8072CD4(&arr[0], &arr[1], &arr[2]);

    dest = sub_80A1E58(dest, id);
    dest = StringCopy(dest, src);

    if (id != 0xFF)
    {
        dest[0] = EXT_CTRL_CODE_BEGIN;
        dest[1] = 4;
        dest[2] = arr[0];
        dest[3] = arr[1];
        dest[4] = arr[2];
        dest[5] = 0xFF;

        dest += 5;
    }

    return dest;
}

void sub_80A1EF8(const u8 *text, u8 id, u8 left, u16 top, s32 e)
{
    sub_80A1E9C(gStringVar4, text, id);
    MenuPrint_PixelCoords(gStringVar4, left, top, (bool8)e);
}

void sub_80A1F48(const u8 *text, u8 id, u8 c, u8 d, u16 e)
{
    sub_80A1E9C(gStringVar4, text, id);
    sub_8072BD8(gStringVar4, c, d, e);
}

void sub_80A1F98(s32 value, u8 id, u8 n, u8 mode, u8 left, u16 top, s32 e)
{
    ConvertIntToDecimalStringN(gStringVar1, value, mode, n);
    sub_80A1EF8(gStringVar1, id, left, top, e);
}

void sub_80A1FF8(const u8 *text, u8 id, u8 left, u8 top)
{
    sub_80A1E9C(gStringVar4, text, id);
    MenuPrint(gStringVar4, left, top);
}

u8 *PokemonSummaryScreen_CopyPokemonLevel(u8 *dest, u8 level)
{
    u8 buffer[12];

    dest[0] = 0x34;
    dest++;

    if (level == 0)
    {
        level = 5;
    }

    ConvertIntToDecimalString(buffer, level);
    dest = sub_80A1E9C(dest, buffer, 14);
    dest = StringCopy(dest, gOtherText_Comma);

    return dest;
}

void sub_80A2078(u32 taskId)
{
    gUnknown_03005CF0 = gTasks[taskId].func;
    gTasks[taskId].func = sub_80A20A8;
    gTasks[taskId].func((u8)taskId);
}

void sub_80A20A8(u8 taskId)
{
    if (sub_8055870() != TRUE)
    {
        gTasks[taskId].func = gUnknown_03005CF0;
    }
}
