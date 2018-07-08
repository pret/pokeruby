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

void StorageSystemCreatePrimaryMenu(u8 whichMenu);
void sub_80963D0(u8 curBox);
void sub_809658C(void);
void sub_80965F8(void);
void sub_809662C(void);
void sub_809665C(void);
void sub_80966F4(const u8 *sourceString, u16 x, u16 y);
void sub_8096784(struct Sprite *sprite);

EWRAM_DATA struct PokemonStorage gPokemonStorage = {0};
EWRAM_DATA u8 gUnknown_02038470[3] = {};
EWRAM_DATA u8 gUnknown_02038473 = 0;
EWRAM_DATA u8 gUnknown_02038474 = 0;
EWRAM_DATA struct UnkPSSStruct_2002370 *gUnknown_02038478 = NULL;

const struct PSS_MenuStringPtrs gUnknown_083B600C[] = {
    {PCText_WithdrawPoke, PCText_MovePokeToParty},
    {PCText_DepositPoke,  PCText_StorePokeInBox},
    {PCText_MovePoke,     PCText_OrganizeBoxesParty},
    {PCText_SeeYa,        PCText_ReturnToPrevMenu}
};

#if DEBUG
const u16 gUnknown_Debug_083E05F0[2] = {0};
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
        if (GetBoxMonData(gPokemonStorage.boxes[boxId] + i, MON_DATA_SPECIES) != 0)
            count++;
    }
    return count;
}

s16 GetIndexOfFirstEmptySpaceInBoxN(u8 boxId)
{
    u16 i;

    for (i = 0; i < 30; i++)
    {
        if (GetBoxMonData(gPokemonStorage.boxes[boxId] + i, MON_DATA_SPECIES) == 0)
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
    SetMainCallback2(c2_exit_to_overworld_2_switch);
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
            ZeroBoxMonData(gPokemonStorage.boxes[boxId] + boxMon);
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
NAKED
void debug_sub_80A3904(void)
{
	asm("\
	push	{r4, r5, r6, r7, lr}\n\
	mov	r7, sl\n\
	mov	r6, r9\n\
	mov	r5, r8\n\
	push	{r5, r6, r7}\n\
	add	sp, sp, #0xffffffe4\n\
	mov	r0, #0x0\n\
	mov	r8, r0\n\
	mov	r7, r8\n\
	mov	r1, #0x14\n\
	str	r1, [sp, #0x18]\n\
	mov	r2, #0xff\n\
	mov	r9, r2\n\
._162:\n\
	mov	r5, #0x0\n\
	cmp	r7, #0\n\
	beq	._160	@cond_branch\n\
	mov	r0, #0xe\n\
	mov	r8, r0\n\
	b	._158\n\
._160:\n\
	bl	Random\n\
	lsl	r0, r0, #0x10\n\
	lsr	r0, r0, #0x10\n\
	str	r0, [sp, #0x14]\n\
	mov	r2, r8\n\
	lsl	r1, r2, #0x2\n\
	add r1, r1, r8\n\
	lsl	r3, r1, #0x4\n\
	sub	r3, r3, r1\n\
	lsl	r3, r3, #0x5\n\
	lsl	r1, r5, #0x2\n\
	add	r1, r1, r5\n\
	lsl	r1, r1, #0x4\n\
	ldr	r2, ._163       @ gPokemonStorage\n\
	add	r1, r1, r2\n\
	add	r6, r3, r1\n\
	ldr	r2, ._163 + 4   @ gUnknown_Debug_083E05F0\n\
	lsl	r1, r7, #0x1\n\
	add	r1, r1, r2\n\
	ldrh	r4, [r1]\n\
	add	r5, r5, #0x1\n\
	lsl	r2, r5, #0x18\n\
	lsr	r2, r2, #0x18\n\
	mov	r1, #0x0\n\
	str	r1, [sp]\n\
	str	r1, [sp, #0x4]\n\
	mov	r1, #0x1\n\
	mov	sl, r1\n\
	str	r1, [sp, #0x8]\n\
	str	r0, [sp, #0xc]\n\
	add	r0, r6, #0\n\
	add	r1, r4, #0\n\
	mov	r3, #0x20\n\
	bl	CreateBoxMon\n\
	cmp	r4, #0\n\
	beq	._157	@cond_branch\n\
	cmp	r4, #0xac\n\
	bne	._156	@cond_branch\n\
	add	r0, sp, #0x10\n\
	mov	r2, sl\n\
	strb	r2, [r0]\n\
	add	r0, r6, #0\n\
	mov	r1, #0x2d\n\
	add	r2, sp, #0x10\n\
	bl	SetBoxMonData\n\
._156:\n\
	bl	Random\n\
	mov	r1, r9\n\
	and	r1, r1, r0\n\
	str	r1, [sp, #0x14]\n\
	add	r4, sp, #0x14\n\
	add	r0, r6, #0\n\
	mov	r1, #0x16\n\
	add	r2, r4, #0\n\
	bl	SetBoxMonData\n\
	bl	Random\n\
	mov	r1, r9\n\
	and	r1, r1, r0\n\
	str	r1, [sp, #0x14]\n\
	add	r0, r6, #0\n\
	mov	r1, #0x17\n\
	add	r2, r4, #0\n\
	bl	SetBoxMonData\n\
	bl	Random\n\
	mov	r1, r9\n\
	and	r1, r1, r0\n\
	str	r1, [sp, #0x14]\n\
	add	r0, r6, #0\n\
	mov	r1, #0x18\n\
	add	r2, r4, #0\n\
	bl	SetBoxMonData\n\
	bl	Random\n\
	mov	r1, r9\n\
	and	r1, r1, r0\n\
	str	r1, [sp, #0x14]\n\
	add	r0, r6, #0\n\
	mov	r1, #0x21\n\
	add	r2, r4, #0\n\
	bl	SetBoxMonData\n\
	bl	Random\n\
	mov	r1, r9\n\
	and	r1, r1, r0\n\
	str	r1, [sp, #0x14]\n\
	add	r0, r6, #0\n\
	mov	r1, #0x2f\n\
	add	r2, r4, #0\n\
	bl	SetBoxMonData\n\
	bl	Random\n\
	mov	r1, r9\n\
	and	r1, r1, r0\n\
	str	r1, [sp, #0x14]\n\
	add	r0, r6, #0\n\
	mov	r1, #0x30\n\
	add	r2, r4, #0\n\
	bl	SetBoxMonData\n\
	ldr	r0, [sp, #0x18]\n\
	cmp	r0, #0\n\
	beq	._157	@cond_branch\n\
	sub	r0, r0, #0x1\n\
	lsl	r0, r0, #0x10\n\
	lsr	r0, r0, #0x10\n\
	str	r0, [sp, #0x18]\n\
	mov	r1, sl\n\
	str	r1, [sp, #0x14]\n\
	add	r0, r6, #0\n\
	mov	r1, #0x32\n\
	add	r2, r4, #0\n\
	bl	SetBoxMonData\n\
._157:\n\
	add	r0, r7, #1\n\
	lsl	r0, r0, #0x10\n\
	lsr	r7, r0, #0x10\n\
	lsl	r0, r5, #0x10\n\
	lsr	r5, r0, #0x10\n\
	cmp	r5, #0x1d\n\
	bhi	._158	@cond_branch\n\
	cmp	r7, #0\n\
	bne	._159	@cond_branch\n\
	b	._160\n\
._159:\n\
	mov	r2, #0xe\n\
	mov	r8, r2\n\
._158:\n\
	mov	r0, r8\n\
	add	r0, r0, #0x1\n\
	lsl	r0, r0, #0x10\n\
	lsr	r0, r0, #0x10\n\
	mov	r8, r0\n\
	cmp	r0, #0xd\n\
	bhi	._161	@cond_branch\n\
	b	._162\n\
._161:\n\
	add	sp, sp, #0x1c\n\
	pop	{r3, r4, r5}\n\
	mov	r8, r3\n\
	mov	r9, r4\n\
	mov	sl, r5\n\
	pop	{r4, r5, r6, r7}\n\
	pop	{r0}\n\
	bx	r0\n\
._164:\n\
	.align	2, 0\n\
._163:\n\
	.word	gPokemonStorage+0x4\n\
	.word	gUnknown_Debug_083E05F0");
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
            gUnknown_02038478->unk_0004[i]->pos1.x = 0xc4;
            r5 = 2;
        }
        if (i & 1)
        {
            gUnknown_02038478->unk_0004[i]->pos1.y = 0x70;
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
        sprite->pos2.x += sprite->data[0];
        if (++sprite->data[2] > 5)
        {
            sprite->data[2] = 0;
            sprite->pos2.x = 0;
        }
    }
}
