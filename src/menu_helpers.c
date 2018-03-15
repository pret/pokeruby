#include "global.h"
#include "item_menu.h"
#include "constants/items.h"
#include "link.h"
#include "mail_data.h"
#include "main.h"
#include "constants/maps.h"
#include "menu.h"
#include "menu_helpers.h"
#include "overworld.h"
#include "constants/songs.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "text.h"

#define SCROLL_INDICATOR_PAL_TAG 6

static void sub_80F9834(struct Sprite *sprite);

static EWRAM_DATA u8 gVerticalScrollIndicatorIds[4] = {0};
static EWRAM_DATA struct YesNoFuncTable gUnknown_020388C4 = {0};

static TaskFunc gUnknown_0300074C;

static const u8 gSpriteImage_83E5808[] = INCBIN_U8("graphics/unknown_sprites/83E59A0/0.4bpp");

static const u8 gSpriteImage_83E5848[] = INCBIN_U8("graphics/unknown_sprites/83E59A0/1.4bpp");

static const u8 gSpriteImage_83E5888[] = INCBIN_U8("graphics/unknown_sprites/83E59B0/0.4bpp");

static const u8 gSpriteImage_83E58C8[] = INCBIN_U8("graphics/unknown_sprites/83E59B0/1.4bpp");

static const u8 gSpriteImage_83E5908[] = INCBIN_U8("graphics/unknown_sprites/83E59C0/0.4bpp");

static const u8 gSpriteImage_83E5928[] = INCBIN_U8("graphics/unknown_sprites/83E59C0/1.4bpp");

static const u16 Palette_3E5948[] = INCBIN_U16("graphics/interface/83E5948.gbapal");

static const struct SpritePalette gUnknown_083E5968 = { Palette_3E5948, SCROLL_INDICATOR_PAL_TAG };

static const struct OamData gOamData_83E5970 =
{
    .tileNum = 1
};

static const struct OamData gOamData_83E5978 =
{
    .shape = ST_OAM_H_RECTANGLE,
    .tileNum = 1
};

static const struct OamData gOamData_83E5980 =
{
    .shape = ST_OAM_V_RECTANGLE,
    .tileNum = 1
};

static const union AnimCmd gSpriteAnim_83E5988[] =
{
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_END,
};

static const union AnimCmd gSpriteAnim_83E5990[] =
{
    ANIMCMD_FRAME(1, 0),
    ANIMCMD_END,
};

static const union AnimCmd *const gSpriteAnimTable_83E5998[] =
{
    gSpriteAnim_83E5988,
    gSpriteAnim_83E5990,
};

static const struct SpriteFrameImage gSpriteImageTable_83E59A0[] =
{
    { gSpriteImage_83E5808, 0x40 },
    { gSpriteImage_83E5848, 0x40 },
};

static const struct SpriteFrameImage gSpriteImageTable_83E59B0[] =
{
    { gSpriteImage_83E5888, 0x40 },
    { gSpriteImage_83E58C8, 0x40 },
};

static const struct SpriteFrameImage gSpriteImageTable_83E59C0[] =
{
    { gSpriteImage_83E5908, 0x20 },
    { gSpriteImage_83E5928, 0x20 },
};

static const struct SpriteTemplate gSpriteTemplate_83E59D0 =
{
    .tileTag = 0xFFFF,
    .paletteTag = SCROLL_INDICATOR_PAL_TAG,
    .oam = &gOamData_83E5978,
    .anims = gSpriteAnimTable_83E5998,
    .images = gSpriteImageTable_83E59A0,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80F9834,
};

static const struct SpriteTemplate gSpriteTemplate_83E59E8 =
{
    .tileTag = 0xFFFF,
    .paletteTag = SCROLL_INDICATOR_PAL_TAG,
    .oam = &gOamData_83E5980,
    .anims = gSpriteAnimTable_83E5998,
    .images = gSpriteImageTable_83E59B0,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80F9834,
};

static const struct SpriteTemplate gSpriteTemplate_83E5A00 =
{
    .tileTag = 0xFFFF,
    .paletteTag = SCROLL_INDICATOR_PAL_TAG,
    .oam = &gOamData_83E5970,
    .anims = gSpriteAnimTable_83E5998,
    .images = gSpriteImageTable_83E59C0,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

void ClearBGTilemapBuffers(void)
{
    memset(&gBGTilemapBuffers[1], 0, 0x800);
    memset(&gBGTilemapBuffers[2], 0, 0x800);
    memset(&gBGTilemapBuffers[3], 0, 0x800);
}

// display message box, fill box with tile if tile is not zero, print string
static void PrintMessage(const u8 *str, u16 tile)
{
    Menu_DisplayDialogueFrame();
    if (tile)
    {
        sub_80A3FA0(&gBGTilemapBuffers[1][0], 2, 15, 26, 4, tile);
    }
    MenuPrintMessageDefaultCoords(str);
}

static void sub_80F9090(u8 taskId)
{
    if (Menu_UpdateWindowText() == TRUE)
    {
        gUnknown_0300074C(taskId);
    }
}

void DisplayItemMessageOnField(u8 taskId, const u8 *str, TaskFunc callback, u16 tile)
{
    PrintMessage(str, tile);
    gUnknown_0300074C = callback;
    gTasks[taskId].func = sub_80F9090;
}

static void Task_CallYesOrNoCallback(u8 taskId)
{
    switch (Menu_ProcessInputNoWrap_())
    {
    case 0:
        PlaySE(SE_SELECT);
        gUnknown_020388C4.yesFunc(taskId);
        break;
    case 1:
    case -1:
        PlaySE(SE_SELECT);
        gUnknown_020388C4.noFunc(taskId);
    }
}

void DoYesNoFuncWithChoice(u8 taskId, const struct YesNoFuncTable *funcTable)
{
    gUnknown_020388C4 = *funcTable;
    gTasks[taskId].func = Task_CallYesOrNoCallback;
}

static void PrintStringWithPalette(const u8 *str, u8 paletteNum, u8 left, u8 top)
{
    u8 paletteStr[] = _("{PALETTE 0}");

    if (paletteNum != 0xFF)
    {
        paletteStr[2] = paletteNum;
        StringCopy(gStringVar4, paletteStr);
        StringAppend(gStringVar4, str);
        paletteStr[2] = gMenuWindowPtr->paletteNum;
        StringAppend(gStringVar4, paletteStr);
    }
    else
    {
        StringCopy(gStringVar4, str);
    }

    Menu_PrintText(gStringVar4, left, top);
}

// unused
void PrintNumberWithPalette(s32 value, u8 paletteNum, u8 n, u8 mode, u8 left, u8 top)
{
    ConvertIntToDecimalStringN(gStringVar1, value, mode, n);
    if (paletteNum != 0xFF)
    {
        PrintStringWithPalette(gStringVar1, paletteNum, left, top);
    }
    else
    {
        Menu_PrintText(gStringVar1, left, top);
    }
}

// unused
void PrintTriangleCursorWithPalette(u8 left, u8 top, u8 paletteNum)
{
    u8 cursorStr[] = _("▶");
    PrintStringWithPalette(cursorStr, paletteNum, left, top);
}

u8 sub_80F9284(void)
{
    if (gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR)
    {
        if (gMain.newKeys & L_BUTTON)
        {
            return 1;
        }
        if (gMain.newKeys & R_BUTTON)
        {
            return 2;
        }
    }

    return 0;
}

u8 sub_80F92BC(void)
{
    if (gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR)
    {
        if (gMain.newAndRepeatedKeys & L_BUTTON)
        {
            return 1;
        }
        if (gMain.newAndRepeatedKeys & R_BUTTON)
        {
            return 2;
        }
    }

    return 0;
}

bool8 sub_80F92F4(u16 itemId)
{
    if (itemId != ITEM_ENIGMA_BERRY)
    {
        return TRUE;
    }

    if (!(gSaveBlock1.location.mapGroup == MAP_GROUP(TRADE_CENTER) && gSaveBlock1.location.mapNum == MAP_NUM(TRADE_CENTER)))
    {
        return TRUE;
    }

    return FALSE;
}

bool8 sub_80F931C(u16 itemId)
{
    if (is_c1_link_related_active() != TRUE)
    {
        return TRUE;
    }

    if (ItemIsMail(itemId) != TRUE)
    {
        return TRUE;
    }

    return FALSE;
}

bool8 sub_80F9344(void)
{
    if (is_c1_link_related_active() == TRUE || gReceivedRemoteLinkPlayers == 1)
    {
        return TRUE;
    }

    return FALSE;
}

void sub_80F9368(void)
{
    REG_DISPCNT = 0;
    REG_BG3CNT = 0;
    REG_BG2CNT = 0;
    REG_BG1CNT = 0;
    REG_BG0CNT = 0;
    REG_BG3HOFS = 0;
    REG_BG3VOFS = 0;
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    DmaFill16Large(3, 0, (u8 *)VRAM, 0x18000, 0x1000);
    DmaClear32(3, OAM, OAM_SIZE);
    DmaClear16(3, PLTT, PLTT_SIZE);
}

void ClearVideoCallbacks(void)
{
    SetVBlankCallback(NULL);
    SetHBlankCallback(NULL);
}

void ClearVerticalScrollIndicatorPalettes(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        gVerticalScrollIndicatorIds[i] = 0xFF;
    }

    FreeSpritePaletteByTag(SCROLL_INDICATOR_PAL_TAG);
    LoadSpritePalette(&gUnknown_083E5968);
}

void sub_80F9480(u8 *data, u8 n)
{
    u8 i;

    for (i = 0; i < n; i++)
    {
        data[i] = 0xFF;
    }
}

void sub_80F94A4(u8 animNum, u8 *spriteId, s16 x, s16 y)
{
    if (animNum <= 5)
    {
        if (*spriteId == 0xFF)
        {
            *spriteId = CreateSprite(&gSpriteTemplate_83E5A00, x, y, 0);
        }
        animNum -= 4;
        StartSpriteAnim(&gSprites[*spriteId], animNum);
    }
}

void sub_80F94F8(u8 *spriteId)
{
    if (*spriteId != 0xFF)
    {
        DestroySprite(&gSprites[*spriteId]);
        *spriteId = 0xFF;
    }
}

void sub_80F9520(u8 *data, u8 n)
{
    u8 i;

    for (i = 0; i < 8; i++)
    {
        sub_80F94F8(&data[i]);
    }
}

void CreateVerticalScrollIndicators(u8 id, u16 x, u16 y)
{
    if (id >= 4)
    {
        return;
    }

    switch (id)
    {
    case TOP_ARROW:
        if (gVerticalScrollIndicatorIds[TOP_ARROW] == 0xFF)
        {
            gVerticalScrollIndicatorIds[TOP_ARROW] = CreateSprite(&gSpriteTemplate_83E59D0, x, y, 0);
            gSprites[gVerticalScrollIndicatorIds[TOP_ARROW]].data[2] = -1;
            if (gVerticalScrollIndicatorIds[BOTTOM_ARROW] != 0xFF)
            {
                gSprites[gVerticalScrollIndicatorIds[TOP_ARROW]].pos2.y = gSprites[gVerticalScrollIndicatorIds[BOTTOM_ARROW]].pos2.y * -1;
                gSprites[gVerticalScrollIndicatorIds[TOP_ARROW]].data[3] = gSprites[gVerticalScrollIndicatorIds[BOTTOM_ARROW]].data[3];
            }
            else
            {
                gSprites[gVerticalScrollIndicatorIds[TOP_ARROW]].data[3] = 0;
            }
        }
        break;

    case BOTTOM_ARROW:
        if (gVerticalScrollIndicatorIds[BOTTOM_ARROW] == 0xFF)
        {
            gVerticalScrollIndicatorIds[BOTTOM_ARROW] = CreateSprite(&gSpriteTemplate_83E59D0, x, y, 0);
            gSprites[gVerticalScrollIndicatorIds[BOTTOM_ARROW]].data[2] = 1;
            if (gVerticalScrollIndicatorIds[TOP_ARROW] != 0xFF)
            {
                gSprites[gVerticalScrollIndicatorIds[BOTTOM_ARROW]].pos2.y = gSprites[gVerticalScrollIndicatorIds[TOP_ARROW]].pos2.y * -1;
                gSprites[gVerticalScrollIndicatorIds[BOTTOM_ARROW]].data[3] = gSprites[gVerticalScrollIndicatorIds[TOP_ARROW]].data[3];
            }
            else
            {
                gSprites[gVerticalScrollIndicatorIds[BOTTOM_ARROW]].data[3] = 0;
            }
        }
        break;

     case LEFT_ARROW:
        if (gVerticalScrollIndicatorIds[LEFT_ARROW] == 0xFF)
        {
            gVerticalScrollIndicatorIds[LEFT_ARROW] = CreateSprite(&gSpriteTemplate_83E59E8, x, y, 0);
            gSprites[gVerticalScrollIndicatorIds[LEFT_ARROW]].data[0] = -1;
            if (gVerticalScrollIndicatorIds[RIGHT_ARROW] != 0xFF)
            {
                gSprites[gVerticalScrollIndicatorIds[LEFT_ARROW]].pos2.x = gSprites[gVerticalScrollIndicatorIds[RIGHT_ARROW]].pos2.x * -1;
                gSprites[gVerticalScrollIndicatorIds[LEFT_ARROW]].data[1] = gSprites[gVerticalScrollIndicatorIds[RIGHT_ARROW]].data[1];
            }
            else
            {
                gSprites[gVerticalScrollIndicatorIds[LEFT_ARROW]].data[1] = 0;
            }
        }
        break;

    case RIGHT_ARROW:
        if (gVerticalScrollIndicatorIds[RIGHT_ARROW] == 0xFF)
        {
            gVerticalScrollIndicatorIds[RIGHT_ARROW] = CreateSprite(&gSpriteTemplate_83E59E8, x, y, 0);
            gSprites[gVerticalScrollIndicatorIds[RIGHT_ARROW]].data[0] = 1;
            if (gVerticalScrollIndicatorIds[LEFT_ARROW] != 0xFF)
            {
                gSprites[gVerticalScrollIndicatorIds[RIGHT_ARROW]].pos2.x = gSprites[gVerticalScrollIndicatorIds[LEFT_ARROW]].pos2.x * -1;
                gSprites[gVerticalScrollIndicatorIds[RIGHT_ARROW]].data[1] = gSprites[gVerticalScrollIndicatorIds[LEFT_ARROW]].data[1];
            }
            else
            {
                gSprites[gVerticalScrollIndicatorIds[RIGHT_ARROW]].data[1] = 0;
            }
        }
        break;
    }

    StartSpriteAnim(&gSprites[gVerticalScrollIndicatorIds[id]], id & 1);
}

void SetVerticalScrollIndicators(u8 id, bool8 invisible)
{
    if (id < 4 && gVerticalScrollIndicatorIds[id] != 0xFF)
    {
        gSprites[gVerticalScrollIndicatorIds[id]].invisible = invisible;
    }
}

void DestroyVerticalScrollIndicator(u8 id)
{
    if (id < 4 && gVerticalScrollIndicatorIds[id] != 0xFF)
    {
        DestroySprite(&gSprites[gVerticalScrollIndicatorIds[id]]);
        gVerticalScrollIndicatorIds[id] = 0xFF;
    }
}

void LoadScrollIndicatorPalette(void)
{
    LoadSpritePalette(&gUnknown_083E5968);
}

void BuyMenuFreeMemory(void)
{
    FreeSpritePaletteByTag(SCROLL_INDICATOR_PAL_TAG);
}

static void sub_80F9834(struct Sprite *sprite)
{
    if (sprite->data[1] == 0)
    {
        sprite->pos2.x += sprite->data[0];
    }
    if (sprite->data[3] == 0)
    {
        sprite->pos2.y += sprite->data[2];
    }
    sprite->data[1]++;
    sprite->data[3]++;
    if (sprite->data[1] > 2)
    {
        sprite->data[1] = 0;
    }
    if (sprite->data[3] > 2)
    {
        sprite->data[3] = 0;
    }
    if (sprite->pos2.x == 8 || sprite->pos2.x == -8)
    {
        sprite->pos2.x = 0;
    }
    if (sprite->pos2.y == 8 || sprite->pos2.y == -8)
    {
        sprite->pos2.y = 0;
    }
}

void StopVerticalScrollIndicators(u8 id)
{
    if (gVerticalScrollIndicatorIds[id] != 0xFF && id < 4)
    {
        gSprites[gVerticalScrollIndicatorIds[id]].callback = SpriteCallbackDummy;
    }
}

void StartVerticalScrollIndicators(u8 id)
{
    if (gVerticalScrollIndicatorIds[id] != 0xFF && id < 4)
    {
        gSprites[gVerticalScrollIndicatorIds[id]].callback = sub_80F9834;
    }
}

static void ResetVerticalScrollIndicators(u8 id)
{
    if (gVerticalScrollIndicatorIds[id] != 0xFF && id < 4)
    {
        gSprites[gVerticalScrollIndicatorIds[id]].pos2.x = 0;
        gSprites[gVerticalScrollIndicatorIds[id]].pos2.y = 0;
        gSprites[gVerticalScrollIndicatorIds[id]].data[1] = 0;
        gSprites[gVerticalScrollIndicatorIds[id]].data[3] = 0;
    }
}

void PauseVerticalScrollIndicator(u8 id)
{
    StopVerticalScrollIndicators(id);
    ResetVerticalScrollIndicators(id);
}

void SetVerticalScrollIndicatorPriority(u8 id, u8 priority)
{
    if (gVerticalScrollIndicatorIds[id] != 0xFF && id < 4)
    {
        gSprites[gVerticalScrollIndicatorIds[id]].oam.priority = priority;
    }
}
