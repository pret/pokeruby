#include "global.h"
#include "data2.h"
#include "field_fadetransition.h"
#include "main.h"
#include "menu.h"
#include "menu_cursor.h"
#include "palette.h"
#include "pokemon.h"
#include "rom4.h"
#include "script.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "strings.h"
#include "strings2.h"
#include "task.h"
#include "trig.h"

extern u8 ewram[];
extern u16 gSpecialVar_0x8004;
extern u16 gSpecialVar_0x8005;
extern u8 gTileBuffer[];

struct ContestMove
{
    u8 effect;
    u8 contestCategory:3;
    u8 comboStarterId;
    u8 comboMoves[4];
};

struct ContestEffect
{
    u8 effectType;
    u8 appeal;
    u8 jam;
};

extern const struct ContestMove gContestMoves[];
extern const struct ContestEffect gContestEffects[];
extern const struct WindowConfig gWindowConfig_81E6CE4;
extern const struct WindowConfig gWindowConfig_81E7240;
extern const u8 *const gUnknown_083CADD4[];
extern const u8 *const gMoveDescriptions[];
extern const u8 gTypeNames[][7];
extern const u8 *const gUnknown_083CAF70[];

extern void sub_809D9F0(struct Pokemon *, u8, u8, void *, u32);

struct LearnMoveStruct
{
    u8 state;
    u8 filler1;
    u8 unk2;
    u8 spriteIDs[20];
    u8 filler17[1];
    u8 unk18;
    u8 unk19;
    u8 numMenuChoices;
    u8 menuSelection;
    u8 unk1C;
    bool8 unk1D;
    u8 unk1E;
    u8 filler1F;
    /*0x020*/ u16 movesToLearn[20];
    u8 filler48[0x52-0x48];
    u8 moveNames[6][0x19];
    u8 fillerE8[0x2C3-0xE8];
    bool8 unk2C3;
    bool8 showContestInfo;
    /*0x2C5*/ u8 partyMon;
    u8 unk2C6;
};

static struct LearnMoveStruct *sLearnMoveStruct;

const u16 gDexArrows_Pal[] = INCBIN_U16("graphics/pokedex/arrows.gbapal");

const u8 gDexArrows_Gfx[] = INCBIN_U8("graphics/pokedex/arrows.4bpp");

const u8 gUnknown_08402CF8[][4] =
{
    { 0,  0,  9, 13},
    {10,  0, 29,  7},
    { 2, 14, 27, 19},
    {10,  8, 29, 13},
};

struct UnknownStruct1
{
    const u8 *unk0;
    u8 unk4;
    u8 unk5;
    u8 unk6;
};

const struct UnknownStruct1 gUnknown_08402D08[][4] =
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

const struct SpriteSheet gUnknown_08402D80 = {gDexArrows_Gfx, sizeof(gDexArrows_Gfx), 5525};
const struct SpritePalette gUnknown_08402D88 = {gDexArrows_Pal, 5526};

void sub_8133300(struct Sprite *);
const struct SpriteTemplate gSpriteTemplate_8402D90 =
{
    .tileTag = 5525,
    .paletteTag = 5526,
    .oam = &gOamData_8402D58,
    .anims = gSpriteAnimTable_8402D78,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_8133300,
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
    .callback = sub_8133300,
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
    .callback = sub_8133300,
};

const u8 gString_AkitoMori[] = _("あきと");  // programmer Akito Mori?

void sub_813269C(u8);
void CB2_InitLearnMove(void);
void CB2_LearnMove(void);
void LearnMoveMain(void);
void DrawLearnMoveMenuWindow(void);
void sub_8133030(bool8);
u8 sub_81330E8(void);
void sub_8133140(u8);
u8 sub_8133248(void);
void ClearLearnMoveVars(void);
void sub_8133358(void);
void sub_8133558(void);
void sub_813362C(void);
void sub_8133800(void);
void sub_8133AEC(bool8, int);
void sub_8133CA4(void);

void VBlankCB_LearnMove(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_8132670(void)
{
    ScriptContext2_Enable();
    CreateTask(sub_813269C, 10);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
}

void sub_813269C(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(CB2_InitLearnMove);
        gFieldCallback = sub_8080990;
        DestroyTask(taskId);
    }
}

void CB2_InitLearnMove(void)
{
    REG_DISPCNT = 0;
    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetTasks();
    sLearnMoveStruct = (struct LearnMoveStruct *)(ewram + 0x17000);
    ClearLearnMoveVars();
    sLearnMoveStruct->partyMon = gSpecialVar_0x8004;
    sub_8133558();
    SetVBlankCallback(VBlankCB_LearnMove);

    SetUpWindowConfig(&gWindowConfig_81E7240);
    InitMenuWindow(&gWindowConfig_81E7240);
    MenuZeroFillScreen();

    SetUpWindowConfig(&gWindowConfig_81E6CE4);
    InitMenuWindow(&gWindowConfig_81E6CE4);
    MenuZeroFillScreen();

    REG_BG0VOFS = 0;
    REG_BG0VOFS = 0;  // huh?
    REG_BG1HOFS = 0;
    REG_BG1HOFS = 0;  // huh?

    LoadSpriteSheet(&gUnknown_08402D80);
    LoadSpritePalette(&gUnknown_08402D88);
    sub_8133358();
    FillPalette(0, 0, 2);
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    SetMainCallback2(CB2_LearnMove);
}

void sub_81327A4(void)
{
    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetTasks();
    sLearnMoveStruct = (struct LearnMoveStruct *)(ewram + 0x17000);
    sub_8133558();
    sLearnMoveStruct->unk2C6 = gSpecialVar_0x8005;
    SetVBlankCallback(VBlankCB_LearnMove);

    SetUpWindowConfig(&gWindowConfig_81E7240);
    InitMenuWindow(&gWindowConfig_81E7240);
    MenuZeroFillScreen();

    SetUpWindowConfig(&gWindowConfig_81E6CE4);
    InitMenuWindow(&gWindowConfig_81E6CE4);
    MenuZeroFillScreen();

    REG_DISPCNT = 0x1340;
    REG_BG0VOFS = 0;
    REG_BG0HOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1HOFS = 0;  // huh?

    LoadSpriteSheet(&gUnknown_08402D80);
    LoadSpritePalette(&gUnknown_08402D88);
    sub_8133358();
    FillPalette(0, 0, 2);
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    SetMainCallback2(CB2_LearnMove);
}

void CB2_LearnMove(void)
{
    LearnMoveMain();
    if (sLearnMoveStruct->unk1D)
    {
        sLearnMoveStruct->unk1D = FALSE;
        sub_814AD7C(0x58, (sLearnMoveStruct->unk18 * 2 + 1) * 8);
    }
    if (sLearnMoveStruct->unk1E != 0)
    {
        sLearnMoveStruct->unk1E = 0;
        sub_8133800();
    }
    if (sLearnMoveStruct->unk2C3)
    {
        sub_8133AEC(sLearnMoveStruct->showContestInfo, 1);
        sLearnMoveStruct->unk2C3 = FALSE;
    }
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_81328E8(const u8 *a)
{
    StringExpandPlaceholders(gStringVar4, a);
    MenuPrintMessage(gStringVar4, 3, 15);
}

void LearnMoveMain(void)
{
    switch (sLearnMoveStruct->state)
    {
    case 0:
        sLearnMoveStruct->state++;
        DrawLearnMoveMenuWindow();
        sub_8133030(FALSE);
        sub_8133800();
        gSprites[1].pos1.x = 0x48;
        sLearnMoveStruct->unk2C3 = TRUE;
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
        REG_DISPCNT = 0x1340;
        break;
    case 1:
        if (!gPaletteFade.active)
            sLearnMoveStruct->state = 4;
        break;
    case 2:
        sLearnMoveStruct->state++;
        break;
    case 3:
        sub_8133030(FALSE);
        sub_8133800();
        sLearnMoveStruct->unk2C3 = TRUE;
        sLearnMoveStruct->state++;
        gSprites[1].pos1.x = 0x48;
        break;
    case 4:
        if (sub_81330E8() == 0)
            sub_813362C();
        return;
    case 5:
        sub_8133140(0);
        sub_8133800();
        sLearnMoveStruct->unk2C3 = TRUE;
        gSprites[1].pos1.x = 0x48;
        sLearnMoveStruct->state++;
        break;
    case 6:
        if (sub_8133248() == 0)
            sub_813362C();
        break;
    case 8:
        if (MenuUpdateWindowText())
        {
            DisplayYesNoMenu(21, 7, 1);
            sLearnMoveStruct->state++;
        }
        break;
    case 9:
        {
            s8 selection = ProcessMenuInputNoWrap_();

            if (selection == 0)
            {
                sub_8133CA4();
                if (GiveMoveToMon(&gPlayerParty[sLearnMoveStruct->partyMon], sLearnMoveStruct->movesToLearn[sLearnMoveStruct->menuSelection]) != 0xFFFF)
                {
                    sub_81328E8(gOtherText_PokeLearnedMove);
                    gSpecialVar_0x8004 = 1;
                    sLearnMoveStruct->state = 31;
                }
                else
                {
                    sLearnMoveStruct->state = 16;
                }
            }
            else if (selection == -1 || selection == 1)
            {
                sub_8133CA4();
                if (sLearnMoveStruct->showContestInfo == FALSE)
                    sLearnMoveStruct->state = 3;
                if (sLearnMoveStruct->showContestInfo == TRUE)
                    sLearnMoveStruct->state = 5;
            }
        }
        break;
    case 12:
        if (MenuUpdateWindowText())
        {
            DisplayYesNoMenu(21, 7, 1);
            sLearnMoveStruct->state++;
        }
        break;
    case 13:
        {
            s8 selection = ProcessMenuInputNoWrap_();

            if (selection == 0)
            {
                sub_8133CA4();
                gSpecialVar_0x8004 = selection;
                sLearnMoveStruct->state = 14;
            }
            else if (selection == -1 || selection == 1)
            {
                sub_8133CA4();
                if (sLearnMoveStruct->showContestInfo == FALSE)
                    sLearnMoveStruct->state = 3;
                if (sLearnMoveStruct->showContestInfo == TRUE)
                    sLearnMoveStruct->state = 5;
            }
        }
        break;
    case 16:
        sub_81328E8(gOtherText_DeleteOlderMove);
        sLearnMoveStruct->state++;
        break;
    case 17:
        if (MenuUpdateWindowText())
        {
            DisplayYesNoMenu(21, 7, 1);
            sLearnMoveStruct->state = 18;
        }
        break;
    case 18:
        {
            s8 var = ProcessMenuInputNoWrap_();

            if (var == 0)
            {
                sub_8133CA4();
                sub_81328E8(gOtherText_WhichMoveToForget);
                sLearnMoveStruct->state = 19;
            }
            else if (var == -1 || var == 1)
            {
                sub_8133CA4();
                sLearnMoveStruct->state = 24;
            }
        }
        break;
    case 24:
        sub_81328E8(gOtherText_StopLearningMove);
        sLearnMoveStruct->state++;
        break;
    case 25:
        if (MenuUpdateWindowText())
        {
            sLearnMoveStruct->state = 26;
            DisplayYesNoMenu(21, 7, 1);
        }
        break;
    case 26:
        {
            s8 var = ProcessMenuInputNoWrap_();

            if (var == 0)
            {
                sub_8133CA4();
                sLearnMoveStruct->state = 27;
            }
            else if (var == -1 || var == 1)
            {
                sub_8133CA4();

                // What's the point? It gets set to 16, anyway.
                if (sLearnMoveStruct->showContestInfo == FALSE)
                    sLearnMoveStruct->state = 3;
                if (sLearnMoveStruct->showContestInfo == TRUE)
                    sLearnMoveStruct->state = 5;
                sLearnMoveStruct->state = 16;
            }
        }
        break;
    case 27:
        if (MenuUpdateWindowText())
        {
            if (sLearnMoveStruct->showContestInfo == FALSE)
                sLearnMoveStruct->state = 3;
            if (sLearnMoveStruct->showContestInfo == TRUE)
                sLearnMoveStruct->state = 5;
        }
        break;
    case 19:
        if (MenuUpdateWindowText())
        {
            sLearnMoveStruct->state = 20;
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
        }
        break;
    case 20:
        if (!gPaletteFade.active)
        {
            sub_809D9F0(gPlayerParty, sLearnMoveStruct->partyMon, gPlayerPartyCount - 1, sub_81327A4, sLearnMoveStruct->movesToLearn[sLearnMoveStruct->menuSelection]);
            sLearnMoveStruct->state = 28;
        }
        break;
    case 21:
        if (MenuUpdateWindowText())
            sLearnMoveStruct->state = 14;
        break;
    case 22:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
        break;
    case 14:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
        sLearnMoveStruct->state++;
        break;
    case 15:
        if (!gPaletteFade.active)
            SetMainCallback2(c2_exit_to_overworld_2_switch);
        break;
    case 28:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
        sLearnMoveStruct->state++;
        DrawLearnMoveMenuWindow();
        sub_8133800();
        if (sLearnMoveStruct->showContestInfo == FALSE)
            sub_8133030(TRUE);
        if (sLearnMoveStruct->showContestInfo == TRUE)
        {
            gSprites[1].pos1.x = 0x48;
            sub_8133140(1);
        }
        sub_8133AEC(sLearnMoveStruct->showContestInfo, 1);
        break;
    case 29:
        if (!gPaletteFade.active)
        {
            if (sLearnMoveStruct->unk2C6 == 4)
            {
                sLearnMoveStruct->state = 24;
            }
            else
            {
                u16 moveId = GetMonData(&gPlayerParty[sLearnMoveStruct->partyMon], MON_DATA_MOVE1 + sLearnMoveStruct->unk2C6);

                StringCopy(gStringVar3, gMoveNames[moveId]);
                RemoveMonPPBonus(&gPlayerParty[sLearnMoveStruct->partyMon], sLearnMoveStruct->unk2C6);
                SetMonMoveSlot(&gPlayerParty[sLearnMoveStruct->partyMon], sLearnMoveStruct->movesToLearn[sLearnMoveStruct->menuSelection], sLearnMoveStruct->unk2C6);
                StringCopy(gStringVar2, gMoveNames[sLearnMoveStruct->movesToLearn[sLearnMoveStruct->menuSelection]]);
                sub_81328E8(gOtherText_ForgotMove123);
                sLearnMoveStruct->state = 30;
                gSpecialVar_0x8004 = 1;
            }
        }
        break;
    case 30:
        if (MenuUpdateWindowText())
        {
#ifdef ENGLISH
            sub_81328E8(gOtherText_ForgotOrDidNotLearnMove);
#else
            sub_81328E8(deuOtherText_ForgotAndLearned);
#endif
            sLearnMoveStruct->state = 31;
            PlayFanfare(BGM_FANFA1);
        }
        break;
    case 31:
        if (MenuUpdateWindowText())
        {
            PlayFanfare(BGM_FANFA1);
            sLearnMoveStruct->state = 32;
        }
        break;
    case 32:
        if (IsFanfareTaskInactive())
            sLearnMoveStruct->state = 33;
        break;
    case 33:
        if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            sLearnMoveStruct->state = 14;
        }
        break;
    }
}

void DrawLearnMoveMenuWindow(void)
{
    u32 i;

    BasicInitMenuWindow(&gWindowConfig_81E7240);
    for (i = 0; i < 4; i++)
    {
        MenuDrawTextWindow(
          gUnknown_08402CF8[i][0],
          gUnknown_08402CF8[i][1],
          gUnknown_08402CF8[i][2],
          gUnknown_08402CF8[i][3]);
    }
    BasicInitMenuWindow(&gWindowConfig_81E6CE4);
}

void sub_8133030(bool8 a)
{
    s32 i;

    gSprites[sLearnMoveStruct->spriteIDs[0]].invisible = FALSE;
    gSprites[sLearnMoveStruct->spriteIDs[1]].invisible = FALSE;

    for (i = 0; i < 16; i++)
        gSprites[sLearnMoveStruct->spriteIDs[i + 4]].invisible = TRUE;

    for (i = 0; gUnknown_08402D08[0][i].unk0 != NULL; i++)
    {
        sub_8072C74(gTileBuffer, gUnknown_08402D08[0][i].unk0, 64, 2);
        MenuPrint(gTileBuffer, gUnknown_08402D08[0][i].unk4, gUnknown_08402D08[0][i].unk5);
    }

    if (!a)
        sub_8072AB0(gOtherText_TeachWhichMove, 24, 120, 192, 32, 1);
}

u8 sub_81330E8(void)
{
    u32 result = (gMain.newKeys & DPAD_LEFT) || (gMain.newKeys & DPAD_RIGHT);

    if (gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR
     && ((gMain.newKeys & L_BUTTON) || (gMain.newKeys & R_BUTTON)))
        result++;

    if (result != 0)
    {
        PlaySE(SE_SELECT);
        sLearnMoveStruct->state = 5;
        sLearnMoveStruct->showContestInfo = TRUE;
    }

    return result;
}

void sub_8133140(bool8 a)
{
    s32 i;

    gSprites[sLearnMoveStruct->spriteIDs[0]].invisible = FALSE;
    gSprites[sLearnMoveStruct->spriteIDs[1]].invisible = FALSE;

    for (i = 0; i < 16; i++)
        gSprites[sLearnMoveStruct->spriteIDs[i + 4]].invisible = FALSE;

    for (i = 0; gUnknown_08402D08[0][i].unk0 != NULL; i++)
    {
        sub_8072C74(gTileBuffer, gUnknown_08402D08[1][i].unk0, 64, 2);
        MenuPrint(gTileBuffer, gUnknown_08402D08[1][i].unk4, gUnknown_08402D08[1][i].unk5);
        if (i != 0)
        {
            MenuZeroFillWindowRect(
              gUnknown_08402D08[1][i].unk4,
              gUnknown_08402D08[1][i].unk5 + 2,
              gUnknown_08402D08[1][i].unk4 + 7,
              gUnknown_08402D08[1][i].unk5 + 3);
        }
    }

    if (!a)
        sub_8072AB0(gOtherText_TeachWhichMove, 24, 120, 192, 32, 1);
}

u8 sub_8133248(void)
{
    u32 result = (gMain.newKeys & DPAD_LEFT) || (gMain.newKeys & DPAD_RIGHT);

    if (gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR
     && ((gMain.newKeys & L_BUTTON) || (gMain.newKeys & R_BUTTON)))
        result++;

    if (result != 0)
    {
        PlaySE(SE_SELECT);
        sLearnMoveStruct->state = 3;
        sLearnMoveStruct->showContestInfo = FALSE;
    }

    return result;
}

void ClearLearnMoveVars(void)
{
    s32 i;

    sLearnMoveStruct->state = 0;
    sLearnMoveStruct->unk2 = 0;
    sLearnMoveStruct->unk19 = 0;
    sLearnMoveStruct->unk18 = 0;
    sLearnMoveStruct->unk1C = 0;
    sLearnMoveStruct->numMenuChoices = 0;
    sLearnMoveStruct->menuSelection = 0;
    sLearnMoveStruct->unk1D = FALSE;
    sLearnMoveStruct->unk1E = 0;
    sLearnMoveStruct->unk2C3 = FALSE;
    sLearnMoveStruct->showContestInfo = FALSE;
    for (i = 0; i < 20; i++)
        sLearnMoveStruct->movesToLearn[i] = 0;
}

void sub_8133300(struct Sprite *sprite)
{
    s16 var = (sprite->data1 * 10) & 0xFF;

    switch (sprite->data0)
    {
    case 0:
        break;
    case 1:
        sprite->pos2.x = Sin(var, 3) * sprite->data2;
        break;
    case 2:
        sprite->pos2.y = Sin(var, 1) * sprite->data2;
        break;
    }
    sprite->data1++;
}

void sub_8133358(void)
{
    s32 i;

    sLearnMoveStruct->spriteIDs[0] = CreateSprite(&gSpriteTemplate_8402D90, 8, 16, 0);
    gSprites[sLearnMoveStruct->spriteIDs[0]].data0 = 1;
    gSprites[sLearnMoveStruct->spriteIDs[0]].data2 = -1;

    sLearnMoveStruct->spriteIDs[1] = CreateSprite(&gSpriteTemplate_8402D90, 72, 16, 0);
    StartSpriteAnim(&gSprites[sLearnMoveStruct->spriteIDs[1]], 1);
    gSprites[sLearnMoveStruct->spriteIDs[1]].data0 = 1;
    gSprites[sLearnMoveStruct->spriteIDs[1]].data2 = 1;

    sLearnMoveStruct->spriteIDs[2] = CreateSprite(&gSpriteTemplate_8402DC0, 160, 4, 0);
    StartSpriteAnim(&gSprites[sLearnMoveStruct->spriteIDs[2]], 1);
    gSprites[sLearnMoveStruct->spriteIDs[2]].data0 = 2;
    gSprites[sLearnMoveStruct->spriteIDs[2]].data2 = -1;

    sLearnMoveStruct->spriteIDs[3] = CreateSprite(&gSpriteTemplate_8402DC0, 160, 60, 0);
    gSprites[sLearnMoveStruct->spriteIDs[3]].data0 = 2;
    gSprites[sLearnMoveStruct->spriteIDs[3]].data2 = 1;

    for (i = 0; i < 8; i++)
    {
        sLearnMoveStruct->spriteIDs[i + 4] = CreateSprite(&gSpriteTemplate_8402E08, (i - (i / 4) * 4) * 8 + 0x1C, (i / 4) * 8 + 0x34, 0);
        StartSpriteAnim(&gSprites[sLearnMoveStruct->spriteIDs[i + 4]], 2);
    }

    for (i = 0; i < 8; i++)
    {
        sLearnMoveStruct->spriteIDs[i + 12] = CreateSprite(&gSpriteTemplate_8402E08, (i - (i / 4) * 4) * 8 + 0x1C, (i / 4) * 8 + 0x5C, 0);
        StartSpriteAnim(&gSprites[sLearnMoveStruct->spriteIDs[i + 12]], 2);
    }

    for (i = 0; i < 20; i++)
        gSprites[sLearnMoveStruct->spriteIDs[i]].invisible = TRUE;

    CreateBlendedOutlineCursor(16, 0xFFFF, 12, 0x2D9F, 18);
}

void sub_8133558(void)
{
    s32 i;
    u8 nickname[POKEMON_NAME_LENGTH + 1];

    sLearnMoveStruct->numMenuChoices = GetMoveRelearnerMoves(&gPlayerParty[sLearnMoveStruct->partyMon], sLearnMoveStruct->movesToLearn);
    for (i = 0; i < sLearnMoveStruct->numMenuChoices; i++)
        StringCopy(sLearnMoveStruct->moveNames[i], gMoveNames[sLearnMoveStruct->movesToLearn[i]]);
    GetMonData(&gPlayerParty[sLearnMoveStruct->partyMon], MON_DATA_NICKNAME, nickname);
    StringCopy10(gStringVar1, nickname);
    StringCopy(sLearnMoveStruct->moveNames[sLearnMoveStruct->numMenuChoices], gUnknownText_Exit);
    sLearnMoveStruct->numMenuChoices++;
}

void sub_813360C(s8 delta)
{
    sLearnMoveStruct->unk1C = sLearnMoveStruct->unk18;
    sLearnMoveStruct->unk18 += delta;
    sLearnMoveStruct->unk1D = TRUE;
}

void sub_813362C(void)
{
    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        if (sLearnMoveStruct->menuSelection != 0)
        {
            PlaySE(SE_SELECT);
            sLearnMoveStruct->menuSelection--;
            sLearnMoveStruct->unk2C3 = TRUE;
            if (sLearnMoveStruct->unk18 != 0)
            {
                sub_813360C(-1);
            }
            else if (sLearnMoveStruct->unk19 != 0)
            {
                sLearnMoveStruct->unk19--;
                sLearnMoveStruct->unk1E++;
            }
        }
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        if (sLearnMoveStruct->menuSelection < sLearnMoveStruct->numMenuChoices - 1)
        {
            PlaySE(SE_SELECT);
            sLearnMoveStruct->menuSelection++;
            sLearnMoveStruct->unk2C3 = TRUE;
            if (sLearnMoveStruct->unk18 != 2)
            {
                sub_813360C(1);
            }
            else if (sLearnMoveStruct->unk19 != sLearnMoveStruct->numMenuChoices - 3)
            {
                sLearnMoveStruct->unk19++;
                sLearnMoveStruct->unk1E++;
            }
        }
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        if (sLearnMoveStruct->menuSelection != sLearnMoveStruct->numMenuChoices - 1)
        {
            sLearnMoveStruct->state = 8;
            StringCopy(gStringVar2, sLearnMoveStruct->moveNames[sLearnMoveStruct->menuSelection]);
            StringExpandPlaceholders(gStringVar4, gOtherText_TeachSpecificMove);
            MenuPrintMessage(gStringVar4, 3, 15);
        }
        else
        {
            StringExpandPlaceholders(gStringVar4, gOtherText_GiveUpTeachingMove);
            MenuPrintMessage(gStringVar4, 3, 15);
            sLearnMoveStruct->state = 12;
        }
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_SELECT);
        sLearnMoveStruct->state = 12;
        StringExpandPlaceholders(gStringVar4, gOtherText_GiveUpTeachingMove);
        MenuPrintMessage(gStringVar4, 3, 15);
    }
    if (sLearnMoveStruct->numMenuChoices > 3)
    {
        gSprites[2].invisible = FALSE;
        gSprites[3].invisible = FALSE;
        if (sLearnMoveStruct->unk19 == 0)
            gSprites[2].invisible = TRUE;
        else if (sLearnMoveStruct->unk19 == sLearnMoveStruct->numMenuChoices - 3)
            gSprites[3].invisible = TRUE;
    }
}

void sub_8133800(void)
{
    u8 r6 = sLearnMoveStruct->unk19;
    u8 *str = gTileBuffer;
    s32 i;

    for (i = 0; i < 3; i++)
    {
        if (r6 >= sLearnMoveStruct->numMenuChoices)
        {
            str = sub_8072C74(str, gEmptyString_81E72B0, 0x90, 0);
        }
        else if (r6 == sLearnMoveStruct->numMenuChoices - 1)
        {
            str = sub_8072C74(str, gUnknownText_Exit, 0x90, 0);
        }
        else
        {
            u16 moveId = sLearnMoveStruct->movesToLearn[r6];

            if (sLearnMoveStruct->showContestInfo)
                str = sub_8072C74(str, gUnknown_083CAF70[gContestMoves[moveId].contestCategory], 0x27, 0);
            else
                str = sub_8072C74(str, gTypeNames[gBattleMoves[moveId].type], 0x27, 0);

            str = sub_8072C74(str, sLearnMoveStruct->moveNames[r6], 0x72, 0);

            str[0] = CHAR_P;
            str[1] = CHAR_P;
            str[2] = CHAR_SLASH;
            str += 3;

            str = sub_8072C14(str, gBattleMoves[moveId].pp, 0x90, 0);
        }
        *str++ = CHAR_NEWLINE;
        r6++;
    }
    *str = EOS;
    MenuPrint(gTileBuffer, 11, 1);
    sub_813360C(0);
}

const u8 gUnknown_08402E24[7][3] =
{
    {11,  1,  1},
    { 3,  6,  2},
    {24,  1,  3},
    { 3, 11,  4},
    { 5,  4,  5},
    { 3,  6,  6},
    { 3, 11,  7},
};

const u8 gUnknown_08402E39[] = {0, 1, 2, 3};
const u8 gUnknown_08402E3D[] = {4, 5, 6};

void PrintMoveInfo(u16 moveId, const u8 *b)
{
    u8 str[0x34];
    u8 numHearts;
    u8 i;

    StringCopy(str, gExpandedPlaceholder_Empty);
    switch (b[2])
    {
    case 1:
        break;
    case 2:
        if (gBattleMoves[moveId].power < 2)
            sub_8072C74(str, gOtherText_ThreeDashes2, 32, 2);
        else
            sub_8072C14(str, gBattleMoves[moveId].power, 32, 2);
        MenuPrint(str, b[0], b[1]);
        break;
    case 4:
        if (gBattleMoves[moveId].accuracy == 0)
            sub_8072C74(str, gOtherText_ThreeDashes2, 32, 2);
        else
            sub_8072C14(str, gBattleMoves[moveId].accuracy, 32, 2);
        MenuPrint(str, b[0], b[1]);
        break;
    case 6:
        MenuZeroFillWindowRect(b[0], b[1], b[0], b[1] + 1);
        numHearts = gContestEffects[gContestMoves[moveId].effect].appeal / 10;
        if (numHearts == 255)
            numHearts = 0;
        for (i = 0; i < 8; i++)
        {
            if (i < numHearts)
                StartSpriteAnim(&gSprites[sLearnMoveStruct->spriteIDs[i + 4]], 1);
            else
                StartSpriteAnim(&gSprites[sLearnMoveStruct->spriteIDs[i + 4]], 0);
        }
        break;
    case 7:
        MenuZeroFillWindowRect(b[0], b[1], b[0], b[1] + 1);
        numHearts = gContestEffects[gContestMoves[moveId].effect].jam / 10;
        if (numHearts == 255)
            numHearts = 0;
        for (i = 0; i < 8; i++)
        {
            if (i < numHearts)
                StartSpriteAnim(&gSprites[sLearnMoveStruct->spriteIDs[i + 12]], 3);
            else
                StartSpriteAnim(&gSprites[sLearnMoveStruct->spriteIDs[i + 12]], 2);
        }
        break;
    }
}

void sub_8133AEC(bool8 contestInfo, int unused)
{
    u16 i;

    if (sLearnMoveStruct->menuSelection != sLearnMoveStruct->numMenuChoices - 1)
    {
        u16 moveId = sLearnMoveStruct->movesToLearn[sLearnMoveStruct->menuSelection];

        if (contestInfo)
        {
            for (i = 0; i < 16; i++)
                gSprites[sLearnMoveStruct->spriteIDs[i + 4]].invisible = FALSE;
            for (i = 0; i < 3; i++)
                PrintMoveInfo(moveId, gUnknown_08402E24[gUnknown_08402E3D[i]]);
            sub_8072AB0(gUnknown_083CADD4[gContestMoves[moveId].effect], 0x58, 0x48, 0x90, 32, 1);
        }
        else
        {
            u8 var;

            for (i = 0; i < 4; i++)
                PrintMoveInfo(moveId, gUnknown_08402E24[gUnknown_08402E39[i]]);
            var = sub_8072A18(gMoveDescriptions[moveId - 1], 0x58, 0x48, 0x90, 1);
            if (var < 2)
            {
                u8 r1 = var * 2 + 9;

                MenuFillWindowRectWithBlankTile(11, r1, 28, 12);
            }
        }
    }
    else
    {
        if (contestInfo)
        {
            MenuZeroFillWindowRect(gUnknown_08402E24[5][0], gUnknown_08402E24[5][1], gUnknown_08402E24[5][0], gUnknown_08402E24[5][1] + 1);
            MenuZeroFillWindowRect(gUnknown_08402E24[6][0], gUnknown_08402E24[6][1], gUnknown_08402E24[6][0], gUnknown_08402E24[6][1] + 1);
            for (i = 0; i < 16; i++)
                gSprites[sLearnMoveStruct->spriteIDs[i + 4]].invisible = TRUE;
        }
        else
        {
            MenuZeroFillWindowRect(gUnknown_08402E24[1][0], gUnknown_08402E24[1][1], gUnknown_08402E24[1][0] + 3, gUnknown_08402E24[1][1] + 1);
            MenuZeroFillWindowRect(gUnknown_08402E24[3][0], gUnknown_08402E24[3][1], gUnknown_08402E24[3][0] + 3, gUnknown_08402E24[3][1] + 1);
        }
        MenuZeroFillWindowRect(11, 9, 28, 12);
    }
}

void sub_8133CA4(void)
{
    MenuZeroFillWindowRect(21, 7, 27, 12);
    sub_8133AEC(sLearnMoveStruct->showContestInfo, 0);
}
