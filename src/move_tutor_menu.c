#include "global.h"
#include "contest.h"
#include "data2.h"
#include "ewram.h"
#include "field_fadetransition.h"
#include "main.h"
#include "menu.h"
#include "menu_cursor.h"
#include "move_tutor_menu.h"
#include "overworld.h"
#include "palette.h"
#include "pokemon.h"
#include "pokemon_summary_screen.h"
#include "script.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "strings.h"
#include "strings2.h"
#include "task.h"
#include "trig.h"
#include "constants/songs.h"

extern u16 gSpecialVar_0x8004;
extern u16 gSpecialVar_0x8005;
extern u8 gTileBuffer[];

extern const struct WindowTemplate gMenuTextWindowTemplate;
extern const struct WindowTemplate gMoveTutorMenuFramesWindowTemplate;
extern const u8 *const gContestEffectStrings[];
extern const u8 *const gMoveDescriptions[];
extern const u8 gTypeNames[][7];
extern const u8 *const gContestCategoryNames[];

#ifdef GERMAN
extern const u8 deuOtherText_ForgotAndLearned[];
#endif

static void InitMoveTutorMenuWaitFade(u8);
static void CB2_InitMoveTutorMenu(void);
static void CB2_MoveTutorMenu(void);
static void MoveTutorMain(void);
static void DrawLearnMoveMenuWindow(void);
static void DrawBattleMoveInfoHeaders(bool8);
static u8 ChangeToContestMoveInfoWindow(void);
static void DrawContestMoveInfoHeaders(bool8);
static u8 ChangeToBattleMoveInfoWindow(void);
static void ResetMoveTutorMenu(void);
static void InitMoveTutorMenuSprites(void);
static void InitMoveTutorMenuStrings(void);
static void HandleMoveTutorMenuInput(void);
static void DrawMoveSelectionWindow(void);
static void DrawMoveInfoWindow(bool8, int);
static void RedrawMoveInfoWindow(void);
static void UpdateMoveTutorMenuCursorPosition(struct Sprite *);

struct MoveTutorMenu
{
    u8 state;
    u8 filler1;
    u8 unk2;
    u8 spriteIDs[20];
    u8 filler17;
    u8 cursorPos;
    u8 curMenuChoice;
    u8 numMenuChoices;
    u8 menuSelection;
    u8 previousCursorPos;
    bool8 redrawCursor;
    bool8 redrawMoveSelectionWindow;
    u16 movesToLearn[MAX_MOVE_TUTOR_MOVES];
    u8 filler48[10];
    u8 moveNames[6][25];
    u8 fillerE8[475];
    bool8 redrawMoveInfoWindow;
    bool8 showContestInfo;
    u8 partyMonIndex;
    u8 forgetMoveIndex;
};

static struct MoveTutorMenu *sMoveTutorMenu;

const u16 gMoveTutorMenuArrows_Pal[] = INCBIN_U16("graphics/move_tutor_menu/arrows.gbapal");

const u8 gMoveTutorMenuArrows_Gfx[] = INCBIN_U8("graphics/move_tutor_menu/arrows.4bpp");

const u8 gMoveTutorMenuWindowFrameDimensions[][4] =
{
    { 0,  0,  9, 13},
    {10,  0, 29,  7},
    { 2, 14, 27, 19},
    {10,  8, 29, 13},
};

struct MoveTutorMoveInfoHeaders
{
    const u8 *text;
    u8 left;
    u8 right;
    u8 index; // unused
};

const struct MoveTutorMoveInfoHeaders gMoveTutorMoveInfoHeaders[][4] =
{
    {
        {OtherText_Battle,   1, 1, 0},
        {OtherText_Power,    1, 4, 1},
        {OtherText_Accuracy, 1, 9, 2},
        {NULL,               0, 0, 0},
    },
    {
        {OtherText_Contest,  1, 1, 0},
        {OtherText_Appeal,   1, 4, 1},
        {OtherText_Jam,      1, 9, 2},
        {NULL,               0, 0, 0},
    },
};

// XXX: What are these for?
const u32 unkDataFF00FFEF = 0xFF00FFEF;
const u8 *const gTileBuffer_ = gTileBuffer;

const struct OamData gOamData_8402D50 = {.shape = 0};
const struct OamData gOamData_8402D58 = {.shape = 2};
const struct OamData gOamData_8402D60 = {.shape = 1};

const union AnimCmd gSpriteAnim_8402D68[] =
{
    ANIMCMD_FRAME(2, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_8402D70[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_8402D78[] =
{
    gSpriteAnim_8402D68,
    gSpriteAnim_8402D70,
};

const struct SpriteSheet gMoveTutorMenuArrowsSpriteSheet = {gMoveTutorMenuArrows_Gfx, sizeof(gMoveTutorMenuArrows_Gfx), 5525};
const struct SpritePalette gMoveTutorMenuArrowsPalette = {gMoveTutorMenuArrows_Pal, 5526};

const struct SpriteTemplate gSpriteTemplate_8402D90 =
{
    .tileTag = 5525,
    .paletteTag = 5526,
    .oam = &gOamData_8402D58,
    .anims = gSpriteAnimTable_8402D78,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = UpdateMoveTutorMenuCursorPosition,
};

const union AnimCmd gSpriteAnim_8402DA8[] =
{
    ANIMCMD_FRAME(4, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_8402DB0[] =
{
    ANIMCMD_FRAME(6, 5),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_8402DB8[] =
{
    gSpriteAnim_8402DA8,
    gSpriteAnim_8402DB0,
};

const struct SpriteTemplate gSpriteTemplate_8402DC0 =
{
    .tileTag = 5525,
    .paletteTag = 5526,
    .oam = &gOamData_8402D60,
    .anims = gSpriteAnimTable_8402DB8,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = UpdateMoveTutorMenuCursorPosition,
};

const union AnimCmd gSpriteAnim_8402DD8[] =
{
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_8402DE0[] =
{
    ANIMCMD_FRAME(9, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_8402DE8[] =
{
    ANIMCMD_FRAME(10, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_8402DF0[] =
{
    ANIMCMD_FRAME(11, 5),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_8402DF8[] =
{
    gSpriteAnim_8402DD8,
    gSpriteAnim_8402DE0,
    gSpriteAnim_8402DE8,
    gSpriteAnim_8402DF0,
};

const struct SpriteTemplate gSpriteTemplate_8402E08 =
{
    .tileTag = 5525,
    .paletteTag = 5526,
    .oam = &gOamData_8402D50,
    .anims = gSpriteAnimTable_8402DF8,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = UpdateMoveTutorMenuCursorPosition,
};

const u8 gString_AkitoMori[] = _("あきと");  // programmer Akito Mori?

static void VBlankCB_MoveTutorMenu(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void DisplayMoveTutorMenu(void)
{
    ScriptContext2_Enable();
    CreateTask(InitMoveTutorMenuWaitFade, 10);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
}

static void InitMoveTutorMenuWaitFade(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(CB2_InitMoveTutorMenu);
        gFieldCallback = sub_8080990;
        DestroyTask(taskId);
    }
}

static void CB2_InitMoveTutorMenu(void)
{
    REG_DISPCNT = 0;
    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetTasks();
    sMoveTutorMenu = eMoveTutorMenu;
    ResetMoveTutorMenu();
    sMoveTutorMenu->partyMonIndex = gSpecialVar_0x8004;
    InitMoveTutorMenuStrings();
    SetVBlankCallback(VBlankCB_MoveTutorMenu);

    Text_LoadWindowTemplate(&gMoveTutorMenuFramesWindowTemplate);
    InitMenuWindow(&gMoveTutorMenuFramesWindowTemplate);
    Menu_EraseScreen();

    Text_LoadWindowTemplate(&gMenuTextWindowTemplate);
    InitMenuWindow(&gMenuTextWindowTemplate);
    Menu_EraseScreen();

    REG_BG0VOFS = 0;
    REG_BG0VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1HOFS = 0;

    LoadSpriteSheet(&gMoveTutorMenuArrowsSpriteSheet);
    LoadSpritePalette(&gMoveTutorMenuArrowsPalette);
    InitMoveTutorMenuSprites();
    FillPalette(0, 0, 2);
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    SetMainCallback2(CB2_MoveTutorMenu);
}

void CB2_ReturnToMoveTutorMenu(void)
{
    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetTasks();
    sMoveTutorMenu = eMoveTutorMenu;
    InitMoveTutorMenuStrings();
    sMoveTutorMenu->forgetMoveIndex = gSpecialVar_0x8005;
    SetVBlankCallback(VBlankCB_MoveTutorMenu);

    Text_LoadWindowTemplate(&gMoveTutorMenuFramesWindowTemplate);
    InitMenuWindow(&gMoveTutorMenuFramesWindowTemplate);
    Menu_EraseScreen();

    Text_LoadWindowTemplate(&gMenuTextWindowTemplate);
    InitMenuWindow(&gMenuTextWindowTemplate);
    Menu_EraseScreen();

    REG_DISPCNT = DISPCNT_OBJ_ON | DISPCNT_BG0_ON | DISPCNT_BG1_ON | DISPCNT_OBJ_1D_MAP;
    REG_BG0VOFS = 0;
    REG_BG0HOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1HOFS = 0;

    LoadSpriteSheet(&gMoveTutorMenuArrowsSpriteSheet);
    LoadSpritePalette(&gMoveTutorMenuArrowsPalette);
    InitMoveTutorMenuSprites();
    FillPalette(0, 0, 2);
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    SetMainCallback2(CB2_MoveTutorMenu);
}

static void CB2_MoveTutorMenu(void)
{
    MoveTutorMain();
    if (sMoveTutorMenu->redrawCursor)
    {
        sMoveTutorMenu->redrawCursor = FALSE;
        MenuCursor_SetPos814AD7C(0x58, (sMoveTutorMenu->cursorPos * 2 + 1) * 8);
    }
    if (sMoveTutorMenu->redrawMoveSelectionWindow)
    {
        sMoveTutorMenu->redrawMoveSelectionWindow = 0;
        DrawMoveSelectionWindow();
    }
    if (sMoveTutorMenu->redrawMoveInfoWindow)
    {
        DrawMoveInfoWindow(sMoveTutorMenu->showContestInfo, 1);
        sMoveTutorMenu->redrawMoveInfoWindow = FALSE;
    }
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void PrintMainMoveTutorMenuText(const u8 *str)
{
    StringExpandPlaceholders(gStringVar4, str);
    MenuPrintMessage(gStringVar4, 3, 15);
}

static void MoveTutorMain(void)
{
    switch (sMoveTutorMenu->state)
    {
    case 0:
        sMoveTutorMenu->state++;
        DrawLearnMoveMenuWindow();
        DrawBattleMoveInfoHeaders(FALSE);
        DrawMoveSelectionWindow();
        gSprites[1].pos1.x = 0x48;
        sMoveTutorMenu->redrawMoveInfoWindow = TRUE;
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
        REG_DISPCNT = DISPCNT_OBJ_ON | DISPCNT_BG0_ON | DISPCNT_BG1_ON | DISPCNT_OBJ_1D_MAP;
        break;
    case 1:
        if (!gPaletteFade.active)
            sMoveTutorMenu->state = 4;
        break;
    case 2:
        sMoveTutorMenu->state++;
        break;
    case 3:
        DrawBattleMoveInfoHeaders(FALSE);
        DrawMoveSelectionWindow();
        sMoveTutorMenu->redrawMoveInfoWindow = TRUE;
        sMoveTutorMenu->state++;
        gSprites[1].pos1.x = 0x48;
        break;
    case 4:
        if (!ChangeToContestMoveInfoWindow())
            HandleMoveTutorMenuInput();
        return;
    case 5:
        DrawContestMoveInfoHeaders(FALSE);
        DrawMoveSelectionWindow();
        sMoveTutorMenu->redrawMoveInfoWindow = TRUE;
        gSprites[1].pos1.x = 0x48;
        sMoveTutorMenu->state++;
        break;
    case 6:
        if (!ChangeToBattleMoveInfoWindow())
            HandleMoveTutorMenuInput();
        break;
    case 8:
        if (Menu_UpdateWindowText())
        {
            DisplayYesNoMenu(21, 7, 1);
            sMoveTutorMenu->state++;
        }
        break;
    case 9:
        {
            s8 selection = Menu_ProcessInputNoWrap_();
            if (selection == 0)
            {
                RedrawMoveInfoWindow();
                if (GiveMoveToMon(&gPlayerParty[sMoveTutorMenu->partyMonIndex], sMoveTutorMenu->movesToLearn[sMoveTutorMenu->menuSelection]) != 0xFFFF)
                {
                    PrintMainMoveTutorMenuText(gOtherText_PokeLearnedMove);
                    gSpecialVar_0x8004 = 1;
                    sMoveTutorMenu->state = 31;
                }
                else
                {
                    sMoveTutorMenu->state = 16;
                }
            }
            else if (selection == -1 || selection == 1)
            {
                RedrawMoveInfoWindow();
                if (sMoveTutorMenu->showContestInfo == FALSE)
                    sMoveTutorMenu->state = 3;
                if (sMoveTutorMenu->showContestInfo == TRUE)
                    sMoveTutorMenu->state = 5;
            }
        }
        break;
    case 12:
        if (Menu_UpdateWindowText())
        {
            DisplayYesNoMenu(21, 7, 1);
            sMoveTutorMenu->state++;
        }
        break;
    case 13:
        {
            s8 selection = Menu_ProcessInputNoWrap_();

            if (selection == 0)
            {
                RedrawMoveInfoWindow();
                gSpecialVar_0x8004 = selection;
                sMoveTutorMenu->state = 14;
            }
            else if (selection == -1 || selection == 1)
            {
                RedrawMoveInfoWindow();
                if (sMoveTutorMenu->showContestInfo == FALSE)
                    sMoveTutorMenu->state = 3;
                if (sMoveTutorMenu->showContestInfo == TRUE)
                    sMoveTutorMenu->state = 5;
            }
        }
        break;
    case 16:
        PrintMainMoveTutorMenuText(gOtherText_DeleteOlderMove);
        sMoveTutorMenu->state++;
        break;
    case 17:
        if (Menu_UpdateWindowText())
        {
            DisplayYesNoMenu(21, 7, 1);
            sMoveTutorMenu->state = 18;
        }
        break;
    case 18:
        {
            s8 var = Menu_ProcessInputNoWrap_();

            if (var == 0)
            {
                RedrawMoveInfoWindow();
                PrintMainMoveTutorMenuText(gOtherText_WhichMoveToForget);
                sMoveTutorMenu->state = 19;
            }
            else if (var == -1 || var == 1)
            {
                RedrawMoveInfoWindow();
                sMoveTutorMenu->state = 24;
            }
        }
        break;
    case 24:
        PrintMainMoveTutorMenuText(gOtherText_StopLearningMove);
        sMoveTutorMenu->state++;
        break;
    case 25:
        if (Menu_UpdateWindowText())
        {
            sMoveTutorMenu->state = 26;
            DisplayYesNoMenu(21, 7, 1);
        }
        break;
    case 26:
        {
            s8 var = Menu_ProcessInputNoWrap_();

            if (var == 0)
            {
                RedrawMoveInfoWindow();
                sMoveTutorMenu->state = 27;
            }
            else if (var == -1 || var == 1)
            {
                RedrawMoveInfoWindow();

                // What's the point? It gets set to 16, anyway.
                if (sMoveTutorMenu->showContestInfo == FALSE)
                    sMoveTutorMenu->state = 3;
                if (sMoveTutorMenu->showContestInfo == TRUE)
                    sMoveTutorMenu->state = 5;
                sMoveTutorMenu->state = 16;
            }
        }
        break;
    case 27:
        if (Menu_UpdateWindowText())
        {
            if (sMoveTutorMenu->showContestInfo == FALSE)
                sMoveTutorMenu->state = 3;
            if (sMoveTutorMenu->showContestInfo == TRUE)
                sMoveTutorMenu->state = 5;
        }
        break;
    case 19:
        if (Menu_UpdateWindowText())
        {
            sMoveTutorMenu->state = 20;
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        }
        break;
    case 20:
        if (!gPaletteFade.active)
        {
            ShowSelectMovePokemonSummaryScreen(gPlayerParty, sMoveTutorMenu->partyMonIndex, gPlayerPartyCount - 1, CB2_ReturnToMoveTutorMenu, sMoveTutorMenu->movesToLearn[sMoveTutorMenu->menuSelection]);
            sMoveTutorMenu->state = 28;
        }
        break;
    case 21:
        if (Menu_UpdateWindowText())
            sMoveTutorMenu->state = 14;
        break;
    case 22:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
        break;
    case 14:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        sMoveTutorMenu->state++;
        break;
    case 15:
        if (!gPaletteFade.active)
            SetMainCallback2(c2_exit_to_overworld_2_switch);
        break;
    case 28:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
        sMoveTutorMenu->state++;
        DrawLearnMoveMenuWindow();
        DrawMoveSelectionWindow();
        if (sMoveTutorMenu->showContestInfo == FALSE)
            DrawBattleMoveInfoHeaders(TRUE);
        if (sMoveTutorMenu->showContestInfo == TRUE)
        {
            gSprites[1].pos1.x = 0x48;
            DrawContestMoveInfoHeaders(TRUE);
        }
        DrawMoveInfoWindow(sMoveTutorMenu->showContestInfo, 1);
        break;
    case 29:
        if (!gPaletteFade.active)
        {
            if (sMoveTutorMenu->forgetMoveIndex == 4)
            {
                sMoveTutorMenu->state = 24;
            }
            else
            {
                u16 moveId = GetMonData(&gPlayerParty[sMoveTutorMenu->partyMonIndex], MON_DATA_MOVE1 + sMoveTutorMenu->forgetMoveIndex);

                StringCopy(gStringVar3, gMoveNames[moveId]);
                RemoveMonPPBonus(&gPlayerParty[sMoveTutorMenu->partyMonIndex], sMoveTutorMenu->forgetMoveIndex);
                SetMonMoveSlot(&gPlayerParty[sMoveTutorMenu->partyMonIndex], sMoveTutorMenu->movesToLearn[sMoveTutorMenu->menuSelection], sMoveTutorMenu->forgetMoveIndex);
                StringCopy(gStringVar2, gMoveNames[sMoveTutorMenu->movesToLearn[sMoveTutorMenu->menuSelection]]);
                PrintMainMoveTutorMenuText(gOtherText_ForgotMove123);
                sMoveTutorMenu->state = 30;
                gSpecialVar_0x8004 = 1;
            }
        }
        break;
    case 30:
        if (Menu_UpdateWindowText())
        {
#ifdef GERMAN
            PrintMainMoveTutorMenuText(deuOtherText_ForgotAndLearned);
#else
            PrintMainMoveTutorMenuText(gOtherText_ForgotOrDidNotLearnMove);
#endif
            sMoveTutorMenu->state = 31;
            PlayFanfare(MUS_FANFA1);
        }
        break;
    case 31:
        if (Menu_UpdateWindowText())
        {
            PlayFanfare(MUS_FANFA1);
            sMoveTutorMenu->state = 32;
        }
        break;
    case 32:
        if (IsFanfareTaskInactive())
            sMoveTutorMenu->state = 33;
        break;
    case 33:
        if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            sMoveTutorMenu->state = 14;
        }
        break;
    }
}

static void DrawLearnMoveMenuWindow(void)
{
    u32 i;

    BasicInitMenuWindow(&gMoveTutorMenuFramesWindowTemplate);
    for (i = 0; i < 4; i++)
    {
        Menu_DrawStdWindowFrame(
          gMoveTutorMenuWindowFrameDimensions[i][0],
          gMoveTutorMenuWindowFrameDimensions[i][1],
          gMoveTutorMenuWindowFrameDimensions[i][2],
          gMoveTutorMenuWindowFrameDimensions[i][3]);
    }
    BasicInitMenuWindow(&gMenuTextWindowTemplate);
}

static void DrawBattleMoveInfoHeaders(bool8 noTeachMoveText)
{
    s32 i;

    gSprites[sMoveTutorMenu->spriteIDs[0]].invisible = FALSE;
    gSprites[sMoveTutorMenu->spriteIDs[1]].invisible = FALSE;

    for (i = 0; i < 16; i++)
        gSprites[sMoveTutorMenu->spriteIDs[i + 4]].invisible = TRUE;

    for (i = 0; gMoveTutorMoveInfoHeaders[0][i].text != NULL; i++)
    {
        AlignStringInMenuWindow(gTileBuffer, gMoveTutorMoveInfoHeaders[0][i].text, 64, 2);
        Menu_PrintText(gTileBuffer, gMoveTutorMoveInfoHeaders[0][i].left, gMoveTutorMoveInfoHeaders[0][i].right);
    }

    if (!noTeachMoveText)
        sub_8072AB0(gOtherText_TeachWhichMove, 24, 120, 192, 32, 1);
}

static u8 ChangeToContestMoveInfoWindow(void)
{
    u32 result = (gMain.newKeys & DPAD_LEFT) || (gMain.newKeys & DPAD_RIGHT);

    if (gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR
     && ((gMain.newKeys & L_BUTTON) || (gMain.newKeys & R_BUTTON)))
        result++;

    if (result != 0)
    {
        PlaySE(SE_SELECT);
        sMoveTutorMenu->state = 5;
        sMoveTutorMenu->showContestInfo = TRUE;
    }

    return result;
}

static void DrawContestMoveInfoHeaders(bool8 noTeachMoveText)
{
    s32 i;

    gSprites[sMoveTutorMenu->spriteIDs[0]].invisible = FALSE;
    gSprites[sMoveTutorMenu->spriteIDs[1]].invisible = FALSE;

    for (i = 0; i < 16; i++)
        gSprites[sMoveTutorMenu->spriteIDs[i + 4]].invisible = FALSE;

    for (i = 0; gMoveTutorMoveInfoHeaders[0][i].text != NULL; i++)
    {
        AlignStringInMenuWindow(gTileBuffer, gMoveTutorMoveInfoHeaders[1][i].text, 64, 2);
        Menu_PrintText(gTileBuffer, gMoveTutorMoveInfoHeaders[1][i].left, gMoveTutorMoveInfoHeaders[1][i].right);
        if (i != 0)
        {
            Menu_EraseWindowRect(
              gMoveTutorMoveInfoHeaders[1][i].left,
              gMoveTutorMoveInfoHeaders[1][i].right + 2,
              gMoveTutorMoveInfoHeaders[1][i].left + 7,
              gMoveTutorMoveInfoHeaders[1][i].right + 3);
        }
    }

    if (!noTeachMoveText)
        sub_8072AB0(gOtherText_TeachWhichMove, 24, 120, 192, 32, 1);
}

static u8 ChangeToBattleMoveInfoWindow(void)
{
    u32 result = (gMain.newKeys & DPAD_LEFT) || (gMain.newKeys & DPAD_RIGHT);

    if (gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR
     && ((gMain.newKeys & L_BUTTON) || (gMain.newKeys & R_BUTTON)))
        result++;

    if (result != 0)
    {
        PlaySE(SE_SELECT);
        sMoveTutorMenu->state = 3;
        sMoveTutorMenu->showContestInfo = FALSE;
    }

    return result;
}

static void ResetMoveTutorMenu(void)
{
    s32 i;

    sMoveTutorMenu->state = 0;
    sMoveTutorMenu->unk2 = 0;
    sMoveTutorMenu->curMenuChoice = 0;
    sMoveTutorMenu->cursorPos = 0;
    sMoveTutorMenu->previousCursorPos = 0;
    sMoveTutorMenu->numMenuChoices = 0;
    sMoveTutorMenu->menuSelection = 0;
    sMoveTutorMenu->redrawCursor = FALSE;
    sMoveTutorMenu->redrawMoveSelectionWindow = 0;
    sMoveTutorMenu->redrawMoveInfoWindow = FALSE;
    sMoveTutorMenu->showContestInfo = FALSE;
    for (i = 0; i < MAX_MOVE_TUTOR_MOVES; i++)
        sMoveTutorMenu->movesToLearn[i] = 0;
}

static void UpdateMoveTutorMenuCursorPosition(struct Sprite *sprite)
{
    s16 var = (sprite->data[1] * 10) & 0xFF;

    switch (sprite->data[0])
    {
    case 0:
        break;
    case 1:
        sprite->pos2.x = Sin(var, 3) * sprite->data[2];
        break;
    case 2:
        sprite->pos2.y = Sin(var, 1) * sprite->data[2];
        break;
    }
    sprite->data[1]++;
}

static void InitMoveTutorMenuSprites(void)
{
    s32 i;

    sMoveTutorMenu->spriteIDs[0] = CreateSprite(&gSpriteTemplate_8402D90, 8, 16, 0);
    gSprites[sMoveTutorMenu->spriteIDs[0]].data[0] = 1;
    gSprites[sMoveTutorMenu->spriteIDs[0]].data[2] = -1;

    sMoveTutorMenu->spriteIDs[1] = CreateSprite(&gSpriteTemplate_8402D90, 72, 16, 0);
    StartSpriteAnim(&gSprites[sMoveTutorMenu->spriteIDs[1]], 1);
    gSprites[sMoveTutorMenu->spriteIDs[1]].data[0] = 1;
    gSprites[sMoveTutorMenu->spriteIDs[1]].data[2] = 1;

    sMoveTutorMenu->spriteIDs[2] = CreateSprite(&gSpriteTemplate_8402DC0, 160, 4, 0);
    StartSpriteAnim(&gSprites[sMoveTutorMenu->spriteIDs[2]], 1);
    gSprites[sMoveTutorMenu->spriteIDs[2]].data[0] = 2;
    gSprites[sMoveTutorMenu->spriteIDs[2]].data[2] = -1;

    sMoveTutorMenu->spriteIDs[3] = CreateSprite(&gSpriteTemplate_8402DC0, 160, 60, 0);
    gSprites[sMoveTutorMenu->spriteIDs[3]].data[0] = 2;
    gSprites[sMoveTutorMenu->spriteIDs[3]].data[2] = 1;

    for (i = 0; i < 8; i++)
    {
        sMoveTutorMenu->spriteIDs[i + 4] = CreateSprite(&gSpriteTemplate_8402E08, (i - (i / 4) * 4) * 8 + 0x1C, (i / 4) * 8 + 0x34, 0);
        StartSpriteAnim(&gSprites[sMoveTutorMenu->spriteIDs[i + 4]], 2);
    }

    for (i = 0; i < 8; i++)
    {
        sMoveTutorMenu->spriteIDs[i + 12] = CreateSprite(&gSpriteTemplate_8402E08, (i - (i / 4) * 4) * 8 + 0x1C, (i / 4) * 8 + 0x5C, 0);
        StartSpriteAnim(&gSprites[sMoveTutorMenu->spriteIDs[i + 12]], 2);
    }

    for (i = 0; i < 20; i++)
        gSprites[sMoveTutorMenu->spriteIDs[i]].invisible = TRUE;

    CreateBlendedOutlineCursor(16, 0xFFFF, 12, 0x2D9F, 18);
}

static void InitMoveTutorMenuStrings(void)
{
    s32 i;
    u8 nickname[POKEMON_NAME_LENGTH + 1];

    sMoveTutorMenu->numMenuChoices = GetMoveTutorMoves(&gPlayerParty[sMoveTutorMenu->partyMonIndex], sMoveTutorMenu->movesToLearn);
    for (i = 0; i < sMoveTutorMenu->numMenuChoices; i++)
        StringCopy(sMoveTutorMenu->moveNames[i], gMoveNames[sMoveTutorMenu->movesToLearn[i]]);
    GetMonData(&gPlayerParty[sMoveTutorMenu->partyMonIndex], MON_DATA_NICKNAME, nickname);
    StringCopy10(gStringVar1, nickname);
    StringCopy(sMoveTutorMenu->moveNames[sMoveTutorMenu->numMenuChoices], gOtherText_Exit);
    sMoveTutorMenu->numMenuChoices++;
}

static void MoveCursorPos(s8 delta)
{
    sMoveTutorMenu->previousCursorPos = sMoveTutorMenu->cursorPos;
    sMoveTutorMenu->cursorPos += delta;
    sMoveTutorMenu->redrawCursor = TRUE;
}

static void HandleMoveTutorMenuInput(void)
{
    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        if (sMoveTutorMenu->menuSelection != 0)
        {
            PlaySE(SE_SELECT);
            sMoveTutorMenu->menuSelection--;
            sMoveTutorMenu->redrawMoveInfoWindow = TRUE;
            if (sMoveTutorMenu->cursorPos != 0)
            {
                MoveCursorPos(-1);
            }
            else if (sMoveTutorMenu->curMenuChoice != 0)
            {
                sMoveTutorMenu->curMenuChoice--;
                sMoveTutorMenu->redrawMoveSelectionWindow++;
            }
        }
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        if (sMoveTutorMenu->menuSelection < sMoveTutorMenu->numMenuChoices - 1)
        {
            PlaySE(SE_SELECT);
            sMoveTutorMenu->menuSelection++;
            sMoveTutorMenu->redrawMoveInfoWindow = TRUE;
            if (sMoveTutorMenu->cursorPos != 2)
            {
                MoveCursorPos(1);
            }
            else if (sMoveTutorMenu->curMenuChoice != sMoveTutorMenu->numMenuChoices - 3)
            {
                sMoveTutorMenu->curMenuChoice++;
                sMoveTutorMenu->redrawMoveSelectionWindow++;
            }
        }
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        if (sMoveTutorMenu->menuSelection != sMoveTutorMenu->numMenuChoices - 1)
        {
            sMoveTutorMenu->state = 8;
            StringCopy(gStringVar2, sMoveTutorMenu->moveNames[sMoveTutorMenu->menuSelection]);
            StringExpandPlaceholders(gStringVar4, gOtherText_TeachSpecificMove);
            MenuPrintMessage(gStringVar4, 3, 15);
        }
        else
        {
            StringExpandPlaceholders(gStringVar4, gOtherText_GiveUpTeachingMove);
            MenuPrintMessage(gStringVar4, 3, 15);
            sMoveTutorMenu->state = 12;
        }
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_SELECT);
        sMoveTutorMenu->state = 12;
        StringExpandPlaceholders(gStringVar4, gOtherText_GiveUpTeachingMove);
        MenuPrintMessage(gStringVar4, 3, 15);
    }
    if (sMoveTutorMenu->numMenuChoices > 3)
    {
        gSprites[2].invisible = FALSE;
        gSprites[3].invisible = FALSE;
        if (sMoveTutorMenu->curMenuChoice == 0)
            gSprites[2].invisible = TRUE;
        else if (sMoveTutorMenu->curMenuChoice == sMoveTutorMenu->numMenuChoices - 3)
            gSprites[3].invisible = TRUE;
    }
}

static void DrawMoveSelectionWindow(void)
{
    u8 menuChoice = sMoveTutorMenu->curMenuChoice;
    u8 *str = gTileBuffer;
    s32 i;

    for (i = 0; i < 3; i++)
    {
        if (menuChoice >= sMoveTutorMenu->numMenuChoices)
        {
            str = AlignStringInMenuWindow(str, gEmptyString_81E72B0, 0x90, 0);
        }
        else if (menuChoice == sMoveTutorMenu->numMenuChoices - 1)
        {
            str = AlignStringInMenuWindow(str, gOtherText_Exit, 0x90, 0);
        }
        else
        {
            u16 moveId = sMoveTutorMenu->movesToLearn[menuChoice];

            if (sMoveTutorMenu->showContestInfo)
                str = AlignStringInMenuWindow(str, gContestCategoryNames[gContestMoves[moveId].contestCategory], 0x27, 0);
            else
                str = AlignStringInMenuWindow(str, gTypeNames[gBattleMoves[moveId].type], 0x27, 0);

            str = AlignStringInMenuWindow(str, sMoveTutorMenu->moveNames[menuChoice], 0x72, 0);

            str[0] = CHAR_P;
            str[1] = CHAR_P;
            str[2] = CHAR_SLASH;
            str += 3;

            str = AlignInt1InMenuWindow(str, gBattleMoves[moveId].pp, 0x90, 0);
        }
        *str++ = CHAR_NEWLINE;
        menuChoice++;
    }
    *str = EOS;
    Menu_PrintText(gTileBuffer, 11, 1);
    MoveCursorPos(0);
}

static const u8 sMoveInfoTextCoords[7][3] =
{
    {11,  1,  1},
    { 3,  6,  2},
    {24,  1,  3},
    { 3, 11,  4},
    { 5,  4,  5},
    { 3,  6,  6},
    { 3, 11,  7},
};

static const u8 sBattleMoveInfoCoordIds[] = {0, 1, 2, 3};
static const u8 sContestMoveInfoCoordIds[] = {4, 5, 6};

void PrintMoveInfo(u16 moveId, const u8 *moveInfoCoords)
{
    u8 str[0x34];
    u8 numHearts;
    u8 i;

    StringCopy(str, gExpandedPlaceholder_Empty);
    switch (moveInfoCoords[2])
    {
    case 1:
        break;
    case 2:
        if (gBattleMoves[moveId].power < 2)
            AlignStringInMenuWindow(str, gOtherText_ThreeDashes2, 32, 2);
        else
            AlignInt1InMenuWindow(str, gBattleMoves[moveId].power, 32, 2);
        Menu_PrintText(str, moveInfoCoords[0], moveInfoCoords[1]);
        break;
    case 4:
        if (gBattleMoves[moveId].accuracy == 0)
            AlignStringInMenuWindow(str, gOtherText_ThreeDashes2, 32, 2);
        else
            AlignInt1InMenuWindow(str, gBattleMoves[moveId].accuracy, 32, 2);
        Menu_PrintText(str, moveInfoCoords[0], moveInfoCoords[1]);
        break;
    case 6:
        Menu_EraseWindowRect(moveInfoCoords[0], moveInfoCoords[1], moveInfoCoords[0], moveInfoCoords[1] + 1);
        numHearts = gContestEffects[gContestMoves[moveId].effect].appeal / 10;
        if (numHearts == 255)
            numHearts = 0;
        for (i = 0; i < 8; i++)
        {
            if (i < numHearts)
                StartSpriteAnim(&gSprites[sMoveTutorMenu->spriteIDs[i + 4]], 1);
            else
                StartSpriteAnim(&gSprites[sMoveTutorMenu->spriteIDs[i + 4]], 0);
        }
        break;
    case 7:
        Menu_EraseWindowRect(moveInfoCoords[0], moveInfoCoords[1], moveInfoCoords[0], moveInfoCoords[1] + 1);
        numHearts = gContestEffects[gContestMoves[moveId].effect].jam / 10;
        if (numHearts == 255)
            numHearts = 0;
        for (i = 0; i < 8; i++)
        {
            if (i < numHearts)
                StartSpriteAnim(&gSprites[sMoveTutorMenu->spriteIDs[i + 12]], 3);
            else
                StartSpriteAnim(&gSprites[sMoveTutorMenu->spriteIDs[i + 12]], 2);
        }
        break;
    }
}

static void DrawMoveInfoWindow(bool8 contestInfo, int unused)
{
    u16 i;

    if (sMoveTutorMenu->menuSelection != sMoveTutorMenu->numMenuChoices - 1)
    {
        u16 moveId = sMoveTutorMenu->movesToLearn[sMoveTutorMenu->menuSelection];

        if (contestInfo)
        {
            for (i = 0; i < 16; i++)
                gSprites[sMoveTutorMenu->spriteIDs[i + 4]].invisible = FALSE;
            for (i = 0; i < 3; i++)
                PrintMoveInfo(moveId, sMoveInfoTextCoords[sContestMoveInfoCoordIds[i]]);
            sub_8072AB0(gContestEffectStrings[gContestMoves[moveId].effect], 0x58, 0x48, 0x90, 32, 1);
        }
        else
        {
            u8 var;

            for (i = 0; i < 4; i++)
                PrintMoveInfo(moveId, sMoveInfoTextCoords[sBattleMoveInfoCoordIds[i]]);
            var = sub_8072A18(gMoveDescriptions[moveId - 1], 0x58, 0x48, 0x90, 1);
            if (var < 2)
            {
                u8 r1 = var * 2 + 9;

                Menu_BlankWindowRect(11, r1, 28, 12);
            }
        }
    }
    else
    {
        if (contestInfo)
        {
            Menu_EraseWindowRect(sMoveInfoTextCoords[5][0], sMoveInfoTextCoords[5][1], sMoveInfoTextCoords[5][0], sMoveInfoTextCoords[5][1] + 1);
            Menu_EraseWindowRect(sMoveInfoTextCoords[6][0], sMoveInfoTextCoords[6][1], sMoveInfoTextCoords[6][0], sMoveInfoTextCoords[6][1] + 1);
            for (i = 0; i < 16; i++)
                gSprites[sMoveTutorMenu->spriteIDs[i + 4]].invisible = TRUE;
        }
        else
        {
            Menu_EraseWindowRect(sMoveInfoTextCoords[1][0], sMoveInfoTextCoords[1][1], sMoveInfoTextCoords[1][0] + 3, sMoveInfoTextCoords[1][1] + 1);
            Menu_EraseWindowRect(sMoveInfoTextCoords[3][0], sMoveInfoTextCoords[3][1], sMoveInfoTextCoords[3][0] + 3, sMoveInfoTextCoords[3][1] + 1);
        }
        Menu_EraseWindowRect(11, 9, 28, 12);
    }
}

static void RedrawMoveInfoWindow(void)
{
    Menu_EraseWindowRect(21, 7, 27, 12);
    DrawMoveInfoWindow(sMoveTutorMenu->showContestInfo, 0);
}
