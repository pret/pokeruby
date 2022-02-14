#include "global.h"
#include "palette.h"
#include "constants/songs.h"
#include "sound.h"
#include "field_weather.h"
#include "overworld.h"
#include "field_fadetransition.h"
#include "menu.h"
#include "main.h"
#include "strings.h"
#include "string_util.h"
#include "event_data.h"
#include "script.h"
#include "pokemon_storage_system.h"
#include "random.h"
#include "constants/species.h"

void StorageSystemCreatePrimaryMenu(u8 whichMenu);
void sub_80963D0(u8 curBox);
void sub_809658C(void);
void sub_80965F8(void);
void sub_809662C(void);
void sub_809665C(void);
void sub_80966F4(const u8 *sourceString, u16 x, u16 y);
void sub_8096784(struct Sprite *sprite);

EWRAM_DATA u8 gUnknown_02038474 = 0;
EWRAM_DATA struct UnkPSSStruct_2002370 *gUnknown_02038478 = NULL;

const struct PSS_MenuStringPtrs gUnknown_083B600C[] = {
    {PCText_WithdrawPoke, PCText_MovePokeToParty},
    {PCText_DepositPoke,  PCText_StorePokeInBox},
    {PCText_MovePoke,     PCText_OrganizeBoxesParty},
    {PCText_SeeYa,        PCText_ReturnToPrevMenu}
};

#if DEBUG
const u16 gUnknown_Debug_083E05F0[1] = {0}; // Yeah I know, but debug uses array indexing for this
#endif

const union AnimCmd gSpriteAnim_83B602C[] = {
    ANIMCMD_FRAME( 0, 5),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83B6034[] = {
    ANIMCMD_FRAME( 4, 5),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83B603C[] = {
    ANIMCMD_FRAME( 6, 5),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83B6044[] = {
    ANIMCMD_FRAME(10, 5),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_83B604C[] = {
    gSpriteAnim_83B602C,
    gSpriteAnim_83B6034,
    gSpriteAnim_83B603C,
    gSpriteAnim_83B6044
};

const union AffineAnimCmd gSpriteAffineAnim_83B605C[] = {
    AFFINEANIMCMD_FRAME(0xe0, 0xe0, 0, 0),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83B606C[] = {
    gSpriteAffineAnim_83B605C
};

const u16 gBoxSelectionPopupPalette[] = INCBIN_U16("graphics/pokemon_storage/box_selection_popup.gbapal");

const u8 gBoxSelectionPopupCenterTiles[] = INCBIN_U8("graphics/pokemon_storage/box_selection_popup_center.4bpp");

const u8 gBoxSelectionPopupSidesTiles[] = INCBIN_U8("graphics/pokemon_storage/box_selection_popup_sides.4bpp");

u8 CountPokemonInBoxN(u8 boxId)
{
    u16 i;
    u16 count;

    for (i = 0, count = 0; i < 30; i++)
    {
        if (GetBoxMonData(&gPokemonStorage.boxes[boxId][i], MON_DATA_SPECIES) != 0)
            count++;
    }
    return count;
}

s16 GetIndexOfFirstEmptySpaceInBoxN(u8 boxId)
{
    u16 i;

    for (i = 0; i < 30; i++)
    {
        if (GetBoxMonData(&gPokemonStorage.boxes[boxId][i], MON_DATA_SPECIES) == 0)
            return i;
    }
    return -1;
}

u8 GetNumValidDaycarePartyMons(void)
{
    u16 i;
    u16 count;

    for (i = 0, count = 0; i < PARTY_SIZE; i++)
    {
        struct Pokemon *pokemon = gPlayerParty + i;
        if (GetMonData(pokemon, MON_DATA_SPECIES) != 0 && !GetMonData(pokemon, MON_DATA_IS_EGG))
            count++;
    }
    return count;
}

u8 CountAlivePartyMonsExceptOne(u8 toSkip)
{
    u16 i;
    u16 count;

    for (i = 0, count = 0; i < PARTY_SIZE; i++)
    {
        if (i != toSkip)
        {
            struct Pokemon *pokemon = gPlayerParty + i;
            if (GetMonData(pokemon, MON_DATA_SPECIES) != 0 && !GetMonData(pokemon, MON_DATA_IS_EGG) && GetMonData(pokemon, MON_DATA_HP) != 0)
                count++;
        }
    }
    return count;
}

u8 CountAlivePartyMonsExceptSelectedOne(void)
{
    return CountAlivePartyMonsExceptOne(gSpecialVar_0x8004);
}

u8 StorageSystemGetPartySize(void)
{
    u16 i;
    u16 count;

    for (i = 0, count = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(gPlayerParty + i, MON_DATA_SPECIES) != 0)
            count++;
    }
    return count;
}

u8 *unref_sub_8095C60(u8 *dest, const u8 *src, u16 pad)
{
    u8 *_dest = StringCopy(dest, src);
    while (_dest < dest + pad)
    {
        *_dest++ = CHAR_SPACE;
    }
    *_dest = EOS;
    return _dest;
}

void sub_8095C8C(u16 *dest, u16 dest_left, u16 dest_top, const u16 *src, u16 src_left, u16 src_top, u16 dest_width, u16 dest_height, u16 src_width)
{
    u16 i;

    dest_width *= 2;
    dest += dest_top * 0x20 + dest_left;
    src += src_top * src_width + src_left;
    for (i = 0; i < dest_height; i++)
    {
        CpuCopy16(src, dest, dest_width);
        dest += 0x20;
        src += src_width;
    }
}

#define MAX_DMA_BLOCK_SIZE 0x1000
#define Dma3FillLarge_(value, dest, size, bit)             \
{                                                          \
    void *_dest = dest;                                    \
    u32 _size = size;                                      \
    while (1)                                              \
    {                                                      \
        if (_size <= MAX_DMA_BLOCK_SIZE)                   \
        {                                                  \
            DmaFill##bit(3, value, _dest, _size);          \
            break;                                         \
        }                                                  \
        DmaFill##bit(3, value, _dest, MAX_DMA_BLOCK_SIZE); \
        _dest += MAX_DMA_BLOCK_SIZE;                       \
        _size -= MAX_DMA_BLOCK_SIZE;                       \
    }                                                      \
}

#define Dma3FillLarge16_(value, dest, size) Dma3FillLarge_(value, dest, size, 16)
#define Dma3FillLarge32_(value, dest, size) Dma3FillLarge_(value, dest, size, 32)

void unref_sub_8095D08(u16 *dest, u16 dest_left, u16 dest_top, u16 width, u16 height)
{
    u16 i;

    dest += dest_top * 0x20 + dest_left;
    width *= 2;
    for (i = 0; i < height; dest += 0x20, i++)
        Dma3FillLarge16_(0, dest, width);
}

s16 StorageSystemGetNextMonIndex(struct BoxPokemon *box, s8 startIdx, u8 stopIdx, u8 mode)
{
    s16 i;
    s16 direction;
    if (mode == 0 || mode == 2)
    {
        direction = 1;
    }
    else
    {
        direction = -1;
    }
    if (mode == 2 || mode == 3)
    {
        for (i = startIdx + direction; i >= 0 && i <= stopIdx; i += direction)
        {
            if (GetBoxMonData(box + i, MON_DATA_SPECIES) != 0)
                return i;
        }
    }
    else
    {
        for (i = startIdx + direction; i >= 0 && i <= stopIdx; i += direction)
        {
            if (GetBoxMonData(box + i, MON_DATA_SPECIES) != 0 && !GetBoxMonData(box + i, MON_DATA_IS_EGG))
                return i;
        }
    }
    return -1;
}

void StorageSystemClearMessageWindow(void)
{
    Menu_BlankWindowRect(2, 15, 27, 18);
}

void Task_PokemonStorageSystem(u8 taskId)
{
    struct Task *task = gTasks + taskId;
    switch (task->data[0])
    {
        case 0:
            StorageSystemCreatePrimaryMenu(task->data[1]);
            Menu_DisplayDialogueFrame();
            Menu_PrintText(gUnknown_083B600C[task->data[1]].desc, 2, 15);
            task->data[0]++;
            break;
        case 1:
            if (IsWeatherNotFadingIn())
            {
                task->data[0]++;
            }
            break;
        case 2:
            task->data[2] = Menu_ProcessInput();
            switch(task->data[2])
            {
                case -2:
                    task->data[3] = task->data[1];
                    if (gMain.newKeys & DPAD_UP && --task->data[3] < 0)
                        task->data[3] = 3;

                    if (gMain.newKeys & DPAD_DOWN && ++task->data[3] > 3)
                        task->data[3] = 0;
                    if (task->data[1] != task->data[3])
                    {
                        task->data[1] = task->data[3];
                        StorageSystemClearMessageWindow();
                        Menu_PrintText(gUnknown_083B600C[task->data[1]].desc, 2, 15);
                    }
                    break;
                case -1:
                case  3:
                    Menu_DestroyCursor();
                    Menu_EraseWindowRect(0, 0, 13, 9);
                    ScriptContext2_Disable();
                    EnableBothScriptContexts();
                    DestroyTask(taskId);
                    break;
                default:
                    if (task->data[2] == 0 && StorageSystemGetPartySize() == PARTY_SIZE)
                    {
                        StorageSystemClearMessageWindow();
                        Menu_PrintText(gPCText_PartyFull2, 2, 15);
                        task->data[0] = 3;
                    }
                    else if (task->data[2] == 1 && StorageSystemGetPartySize() == 1)
                    {
                        StorageSystemClearMessageWindow();
                        Menu_PrintText(gPCText_OnlyOne, 2, 15);
                        task->data[0] = 3;
                    }
                    else
                    {
                        FadeScreen(1, 0);
                        task->data[0] = 4;
                    }
                    break;
            }
            break;
        case 3:
            if (gMain.newKeys & (A_BUTTON | B_BUTTON))
            {
                StorageSystemClearMessageWindow();
                Menu_PrintText(gUnknown_083B600C[task->data[1]].desc, 2, 15);
                task->data[0] = 2;
            }
            else if (gMain.newKeys & DPAD_UP)
            {
                if (--task->data[1] < 0)
                    task->data[1] = 3;
                Menu_MoveCursor(-1);
                task->data[1] = Menu_GetCursorPos();
                StorageSystemClearMessageWindow();
                Menu_PrintText(gUnknown_083B600C[task->data[1]].desc, 2, 15);
                task->data[0] = 2;
            }
            else if (gMain.newKeys & DPAD_DOWN)
            {
                if (++task->data[1] > 3)
                    task->data[1] = 0;
                Menu_MoveCursor(1);
                task->data[1] = Menu_GetCursorPos();
                StorageSystemClearMessageWindow();
                Menu_PrintText(gUnknown_083B600C[task->data[1]].desc, 2, 15);
                task->data[0] = 2;
            }
            break;
        case 4:
            if (!gPaletteFade.active)
            {
                task_intro_29(task->data[2]);
                DestroyTask(taskId);
            }
            break;
    }
}

void ShowPokemonStorageSystem(void)
{
    u8 taskId = CreateTask(Task_PokemonStorageSystem, 80);
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = 0;
    ScriptContext2_Enable();
}

void FieldCB_ReturnToOverworld(void)
{
    u8 taskId = CreateTask(Task_PokemonStorageSystem, 80);
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = gUnknown_02038474;
    pal_fill_black();
}

void StorageSystemCreatePrimaryMenu(u8 whichMenu)
{
    Menu_DrawStdWindowFrame(0, 0, 13, 9);
    Menu_PrintItems(1, 1, 4, (const struct MenuAction *)gUnknown_083B600C);
    InitMenu(0, 1, 1, 4, whichMenu, 12);
}

void sub_80961A8(void)
{
    gUnknown_02038474 = gPokemonStorageSystemPtr->unk_0005;
    gFieldCallback = FieldCB_ReturnToOverworld;
    SetMainCallback2(CB2_ReturnToField);
}

void ResetPokemonStorageSystem(void)
{
    u16 boxId;
    u16 boxMon;

    gPokemonStorage.currentBox = 0;
    for (boxId = 0; boxId < 14; boxId++)
    {
        for (boxMon = 0; boxMon < 30; boxMon++)
        {
            ZeroBoxMonData(&gPokemonStorage.boxes[boxId][boxMon]);
        }
    }
    for (boxId = 0; boxId < 14; boxId++)
    {
        u8 *dest = StringCopy(gPokemonStorage.boxNames[boxId], gPCText_BOX);
        ConvertIntToDecimalStringN(dest, boxId + 1, STR_CONV_MODE_LEFT_ALIGN, 2);
    }
    for (boxId = 0; boxId < 14; boxId++)
    {
        gPokemonStorage.wallpaper[boxId] = boxId & 0x03;
    }
}

#if DEBUG
void debug_sub_80A3904(void)
{
    u16 k = 0;
    u16 i = 0;
    u16 j = 0;
    u16 r0 = 0;
    u32 rand;

    // Super redundant, but it has to be this way to match
    k = 0;
    r0 = 20;

    for (i = 0; i < 14; i++)
    {
        for (j = 0; j < 30; j++)
        {
            if (k >= ARRAY_COUNT(gUnknown_Debug_083E05F0))
            {
                i = 14;
                break;
            }

            rand = Random();
            CreateBoxMon(
                &gPokemonStorage.boxes[i][j], gUnknown_Debug_083E05F0[k], j + 1, 32, 0, 0, 1, rand);
            if (gUnknown_Debug_083E05F0[k] == 0)
            {
                k++;
                continue;
            }
            if (gUnknown_Debug_083E05F0[k] == SPECIES_PICHU)
            {
                u8 data = 1;
                SetBoxMonData(&gPokemonStorage.boxes[i][j], MON_DATA_IS_EGG, &data);
            }

            rand = Random() & 0xFF;
            SetBoxMonData(&gPokemonStorage.boxes[i][j], MON_DATA_COOL, (u8 *)(&rand));
            rand = Random() & 0xFF;
            SetBoxMonData(&gPokemonStorage.boxes[i][j], MON_DATA_BEAUTY, (u8 *)(&rand));
            rand = Random() & 0xFF;
            SetBoxMonData(&gPokemonStorage.boxes[i][j], MON_DATA_CUTE, (u8 *)(&rand));
            rand = Random() & 0xFF;
            SetBoxMonData(&gPokemonStorage.boxes[i][j], MON_DATA_SMART, (u8 *)(&rand));
            rand = Random() & 0xFF;
            SetBoxMonData(&gPokemonStorage.boxes[i][j], MON_DATA_TOUGH, (u8 *)(&rand));
            rand = Random() & 0xFF;
            SetBoxMonData(&gPokemonStorage.boxes[i][j], MON_DATA_SHEEN, (u8 *)(&rand));

            if (r0)
            {
                r0--;
                rand = 1;
                SetBoxMonData(&gPokemonStorage.boxes[i][j], MON_DATA_COOL_RIBBON, (u8 *)(&rand));
            }

            k++;
        }
    }
}
#endif

void sub_8096264(struct UnkPSSStruct_2002370 *a0, u16 tileTag, u16 palTag, u8 a3)
{
    struct SpritePalette palette = {
        gBoxSelectionPopupPalette, palTag
    };
    struct SpriteSheet sheets[] = {
        {gBoxSelectionPopupCenterTiles, 0x800, tileTag},
        {gBoxSelectionPopupSidesTiles,  0x180, tileTag + 1},
        {}
    };
    LoadSpritePalette(&palette);
    LoadSpriteSheets(sheets);
    gUnknown_02038478 = a0;
    a0->unk_0240 = tileTag;
    a0->unk_0242 = palTag;
    a0->unk_023e = a3;
}

void sub_8096310(void)
{
    FreeSpritePaletteByTag(gUnknown_02038478->unk_0242);
    FreeSpriteTilesByTag(gUnknown_02038478->unk_0240);
    FreeSpriteTilesByTag(gUnknown_02038478->unk_0240 + 1);
}

void sub_809634C(u8 curBox)
{
    sub_80963D0(curBox);
}

void sub_809635C(void)
{
    sub_809658C();
}

u8 sub_8096368(void)
{
    if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_SELECT);
        return 201;
    }
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        return gUnknown_02038478->curBox;
    }
    if (gMain.newKeys & DPAD_LEFT)
    {
        PlaySE(SE_SELECT);
        sub_809662C();
    }
    else if (gMain.newKeys & DPAD_RIGHT)
    {
        PlaySE(SE_SELECT);
        sub_80965F8();
    }
    return 200;
}

void sub_80963D0(u8 curBox)
{
    u16 i;
    u8 spriteId;
    struct SpriteTemplate template;
    struct OamData oamData = {};
    oamData.size = 3;
    oamData.paletteNum = 1;
    template = (struct SpriteTemplate){
        0, 0, &oamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
    };

    gUnknown_02038478->curBox = curBox;
    template.tileTag = gUnknown_02038478->unk_0240;
    template.paletteTag = gUnknown_02038478->unk_0242;

    spriteId = CreateSprite(&template, 0xA0, 0x60, 0);
    gUnknown_02038478->unk_0000 = gSprites + spriteId;

    oamData.shape = ST_OAM_V_RECTANGLE;
    oamData.size = 1;
    template.tileTag = gUnknown_02038478->unk_0240 + 1;
    template.anims = gSpriteAnimTable_83B604C;
    for (i = 0; i < 4; i++)
    {
        u16 r5;
        spriteId = CreateSprite(&template, 0x7c, 0x50, gUnknown_02038478->unk_023e);
        gUnknown_02038478->unk_0004[i] = gSprites + spriteId;
        r5 = 0;
        if (i & 2)
        {
            gUnknown_02038478->unk_0004[i]->x = 0xc4;
            r5 = 2;
        }
        if (i & 1)
        {
            gUnknown_02038478->unk_0004[i]->y = 0x70;
            gUnknown_02038478->unk_0004[i]->oam.size = 0;
            r5++;
        }
        StartSpriteAnim(gUnknown_02038478->unk_0004[i], r5);
    }
    for (i = 0; i < 2; i++)
    {
        gUnknown_02038478->unk_0020[i] = sub_809A9A0(72 * i + 0x7c, 0x58, i, 0, gUnknown_02038478->unk_023e);
        if (gUnknown_02038478->unk_0020[i])
        {
            gUnknown_02038478->unk_0020[i]->data[0] = (i == 0 ? -1 : 1);
            gUnknown_02038478->unk_0020[i]->callback = sub_8096784;
        }
    }
    sub_809665C();
}

void sub_809658C(void)
{
    u16 i;
    if (gUnknown_02038478->unk_0000)
    {
        DestroySprite(gUnknown_02038478->unk_0000);
        gUnknown_02038478->unk_0000 = NULL;
    }
    for (i = 0; i < 4; i++)
    {
        if (gUnknown_02038478->unk_0004[i])
        {
            DestroySprite(gUnknown_02038478->unk_0004[i]);
            gUnknown_02038478->unk_0004[i] = NULL;
        }
    }
    for (i = 0; i < 2; i++)
    {
        if (gUnknown_02038478->unk_0020[i])
            DestroySprite(gUnknown_02038478->unk_0020[i]);
    }
}

void sub_80965F8(void)
{
    if (++gUnknown_02038478->curBox > 13)
        gUnknown_02038478->curBox = 0;
    sub_809665C();
}

void sub_809662C(void)
{
    gUnknown_02038478->curBox = (gUnknown_02038478->curBox == 0 ? 13 : gUnknown_02038478->curBox - 1);
    sub_809665C();
}

void sub_809665C(void)
{
    u8 nPokemonInBox = CountPokemonInBoxN(gUnknown_02038478->curBox);
    u8 *stringVar = gStringVar1;

    stringVar[0] = EXT_CTRL_CODE_BEGIN;
    stringVar[1] = EXT_CTRL_CODE_COLOR_HIGHLIGHT_SHADOW;
    stringVar[2] = 0x0F; // TEXT_COLOR_WHITE2
    stringVar[3] = 0x01; // TEXT_COLOR_DARK_GREY
    stringVar[4] = 0x0E; // TEXT_COLOR_LIGHT_BLUE
    stringVar += 5;

    stringVar = StringCopy(stringVar, gPokemonStorage.boxNames[gUnknown_02038478->curBox]);

    stringVar[0] = CHAR_NEWLINE;
    stringVar[1] = EXT_CTRL_CODE_BEGIN;
    stringVar[2] = EXT_CTRL_CODE_CLEAR;
    if (nPokemonInBox < 10)
        stringVar[3] = 0x28;
    else
        stringVar[3] = 0x22;
    stringVar += 4;

    stringVar = ConvertIntToDecimalString(stringVar, nPokemonInBox);

    stringVar[0] = CHAR_SLASH;
    stringVar[1] = CHAR_0 + 3;
    stringVar[2] = CHAR_0 + 0;
    stringVar[3] = EOS;
    sub_80966F4(gStringVar1, 0, 1);
}

void sub_80966F4(const u8 *sourceString, u16 x, u16 y)
{
    u16 *vdest = (u16 *)(BG_CHAR_ADDR(4) + (GetSpriteTileStartByTag(gUnknown_02038478->unk_0240) * 32) + y * 256 + x * 32);
    u8 *tileBuff = gUnknown_083B6DB8;
    DmaFill16(3, 0x1111, tileBuff, 0x400);
    Text_InitWindow8004E3C(&gWindowTemplate_81E6D38, tileBuff, sourceString);
    DmaCopy16(3, tileBuff, vdest, 0x400);
}

void sub_8096784(struct Sprite *sprite)
{
    if (++sprite->data[1] > 3)
    {
        sprite->data[1] = 0;
        sprite->x2 += sprite->data[0];
        if (++sprite->data[2] > 5)
        {
            sprite->data[2] = 0;
            sprite->x2 = 0;
        }
    }
}
