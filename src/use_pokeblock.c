//

// Modified by Dizzy Egg on 8/15/17.
//

#include "global.h"
#include "main.h"
#include "overworld.h"
#include "string_util.h"
#include "strings.h"
#include "sprite.h"
#include "pokemon.h"
#include "pokenav.h"
#include "palette.h"
#include "text.h"
#include "menu.h"
#include "sound.h"
#include "constants/songs.h"
#include "pokeblock.h"

#define GFX_TAG_CONDITIONUPDOWN 0

#ifdef GERMAN
extern const u16 ConditionUpDownPalette[16];
extern const u8 ConditionUpDownTiles[0x200];
#else
const u16 ConditionUpDownPalette[] = INCBIN_U16("graphics/misc/condition_up_down.gbapal");
const u8 ConditionUpDownTiles[] = INCBIN_U8("graphics/misc/condition_up_down.4bpp");
#endif

static const u32 sContestStatsMonData[] = {
    MON_DATA_COOL,
    MON_DATA_TOUGH,
    MON_DATA_SMART,
    MON_DATA_CUTE,
    MON_DATA_BEAUTY
};

static const u8 gUnknown_0840612C[] = {
    0, 4, 3, 2, 1
};

static const u8 *const sContextStatNames[] = {
    OtherText_Coolness,
    OtherText_Toughness,
    OtherText_Smartness,
    OtherText_Cuteness,
    OtherText_Beauty
};

static const struct SpriteSheet gSpriteSheet_ConditionUpDown = {
    ConditionUpDownTiles,
    sizeof ConditionUpDownTiles,
    GFX_TAG_CONDITIONUPDOWN
};

static const struct SpritePalette gSpritePalette_ConditionUpDown = {
    ConditionUpDownPalette,
    GFX_TAG_CONDITIONUPDOWN
};

static const s16 gUnknown_08406158[][2] = {
    {0x9c, 0x1e},
    {0x75, 0x35},
    {0x75, 0x70},
    {0xc5, 0x70},
    {0xc5, 0x35}
};

static const struct OamData gOamData_840616C = {
    .shape = 1,
    .size = 2,
    .priority = 1
};

static const union AnimCmd gSpriteAnim_8406174[] = {
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END
};

static const union AnimCmd gSpriteAnim_840617C[] = {
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_END
};

static const union AnimCmd *const gSpriteAnimTable_8406184[] = {
    gSpriteAnim_8406174,
    gSpriteAnim_840617C
};

static const struct SpriteTemplate gSpriteTemplate_840618C = {
    GFX_TAG_CONDITIONUPDOWN,
    GFX_TAG_CONDITIONUPDOWN,
    &gOamData_840616C,
    gSpriteAnimTable_8406184,
    NULL,
    gDummySpriteAffineAnimTable,
    SpriteCallbackDummy
};

static EWRAM_DATA struct UnkPokenavStruct_Sub1 *gUnknown_02039304 = NULL;
static EWRAM_DATA MainCallback gUnknown_02039308 = NULL;
static EWRAM_DATA struct Pokeblock *gUnknown_0203930C = NULL;
EWRAM_DATA u8 gPokeblockMonID = 0;
EWRAM_DATA s16 gPokeblockGain = 0;

extern u16 gSpecialVar_ItemId; // FIXME: remove after merge of #349 Pokeblock

static void launch_c3_walk_stairs_and_run_once(void (*const)(void));
static void sub_81361E4(void);
static void sub_813622C(void);
static void sub_8136244(void);
static void sub_8136264(void);
static void sub_8136294(void);
static void sub_81365A0(void);
static void sub_81365C8(void);
static void sub_8136638(void);
static void sub_81368A4(void);
void ScanlineEffect_InitHBlankDmaTransfer(void);
static void sub_8136B44(void);
static u8 sub_81370E4(u8);
static void sub_8136BB8(void);
static s8 sub_8136C40(void);
static bool8 sub_8137058(void);
static void sub_8136D60(void);
static void sub_8136808(void);
static void sub_8136D8C(void);
static u8 sub_81370A4(u8);
static void sub_81369CC(void);
static void sub_8136EF0(void);
static void sub_8137138(void);
static void sub_8136C6C(void);
static bool8 sub_8136D00(void);
static void Pokeblock_BufferEnhancedStatText(u8 *, u8, s16);
static void Pokeblock_MenuWindowTextPrint(const u8 *);
static void sub_8136F74(struct Pokeblock *, struct Pokemon *);
static void sub_81371DC(struct Sprite *);

void sub_8136130(struct Pokeblock *pokeblock, MainCallback callback)
{
    gUnknown_02039304 = &gUnknown_083DFEC4->unkD164;
    gUnknown_02039304->pokeblock = pokeblock;
    gUnknown_02039304->callback = callback;
    gUnknown_083DFEC4->unkD162 = 2;
    launch_c3_walk_stairs_and_run_once(sub_8136294);
    SetMainCallback2(sub_8136244);
}

static void sub_8136174(void)
{
    gUnknown_02039304->pokeblock = gUnknown_0203930C;
    gUnknown_02039304->callback = gUnknown_02039308;
    gPokeblockMonID = sub_81370E4(gPokeblockMonID);
    gUnknown_02039304->unk56 = gPokeblockMonID < 4 ? 0 : 1;
    gUnknown_083DFEC4->unkD162 = 2;
    launch_c3_walk_stairs_and_run_once(sub_8136294);
    SetMainCallback2(sub_81361E4);
}

static void sub_81361E4(void)
{
    gUnknown_02039304->unk0();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    if (gUnknown_02039304->unk0 == sub_81365C8)
    {
        REG_DISPCNT = 0;
        gUnknown_02039304->unk50 = 0;
        SetMainCallback2(sub_813622C);
    }
}

static void sub_813622C(void)
{
    sub_81368A4();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_8136244(void)
{
    gUnknown_02039304->unk0();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_8136264(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    sub_80F5CDC(6);
    ScanlineEffect_InitHBlankDmaTransfer();
}

static void launch_c3_walk_stairs_and_run_once(void (*const func)(void))
{
    gUnknown_02039304->unk0 = func;
    gUnknown_02039304->unk50 = 0;
}

static void sub_8136294(void)
{
    bool32 c1LinkRelatedActive;
    switch (gUnknown_02039304->unk50)
    {
        case 0:
            c1LinkRelatedActive = is_c1_link_related_active();
            gUnknown_083DFEC4->unk6DAC = c1LinkRelatedActive;
            if ((bool8)c1LinkRelatedActive == FALSE)
            {
                gUnknown_02039304->unk55 = 0;
                launch_c3_walk_stairs_and_run_once(sub_81365A0);
                gUnknown_02039304->unk50++;
            }
            break;
        case 1:
            ResetSpriteData();
            FreeAllSpritePalettes();
            gUnknown_02039304->unk50++;
            break;
        case 2:
            SetVBlankCallback(NULL);
            gUnknown_02039304->unk50++;
            break;
        case 3:
            Text_LoadWindowTemplate(&gWindowTemplate_81E7080);
            gUnknown_02039304->unk50++;
            break;
        case 4:
            MultistepInitMenuWindowBegin(&gWindowTemplate_81E7080);
            gUnknown_02039304->unk50++;
            break;
        case 5:
            if (MultistepInitMenuWindowContinue())
            {
                gUnknown_02039304->unk50++;
            }
            break;
        case 6:
            gUnknown_083DFEC4->unk76AA = 0;
            gUnknown_083DFEC4->unk87E0 = NULL;
            gUnknown_083DFEC4->unk030C = 0x20;
            gUnknown_02039304->unk50++;
            break;
        case 7:
            sub_80F2688();
            gUnknown_02039304->unk50++;
            // fallthrough
        case 8:
            if (!sub_80F26BC())
            {
                gUnknown_02039304->unk50++;
            }
            break;
        case 9:
            sub_80F2C80(1);
            gUnknown_02039304->unk50++;
            // fallthrough
        case 10:
            if (!sub_80F2CBC(1))
            {
                gUnknown_02039304->unk50++;
            }
            break;
        case 11:
            gKeyRepeatStartDelay = 20;
            gUnknown_083DFEC4->unk8828 = CalculatePlayerPartyCount();
            gUnknown_083DFEC4->unk9344 = 0;
            gUnknown_083DFEC4->unk8768 = NULL;
            sub_80F4BD0();
            gUnknown_083DFEC4->unkD160 = 0;
            gUnknown_02039304->unk50++;
            break;
        case 12:
            if (!sub_80F1778())
            {
                REG_BG2VOFS = 6;
                REG_BG3VOFS = 6;
                gUnknown_02039304->unk50++;
            }
            break;
        case 13:
            sub_80F2E18(0);
            gUnknown_083DFEC4->unk8768->pos2.y = 0xffd8;
            gUnknown_02039304->unk50++;
            break;
        case 14:
            if (!sub_80F170C())
            {
                gUnknown_02039304->unk50++;
            }
            break;
        case 15:
            sub_80F33A8();
            gUnknown_02039304->unk50++;
            break;
        case 16:
            DmaClear32(3, BG_SCREEN_ADDR(31), 0x800);
            REG_BG1VOFS = 0;
            REG_BG1HOFS = 0;
            REG_BG1CNT = BGCNT_SCREENBASE(31);
            gUnknown_02039304->unk50++;
            break;
        case 17:
            sub_80F567C(&gUnknown_083DFEC4->unk8ff0, gUnknown_083DFEC4->unk9004);
            sub_80F5B38();
            gUnknown_02039304->unk50++;
            break;
        case 18:
            if (!sub_80F5B50())
            {
                gUnknown_02039304->unk50++;
            }
            break;
        case 19:
            sub_80F556C(gUnknown_083DFEC4->unk9004[0]);
            gUnknown_02039304->unk50++;
            break;
        case 20:
            sub_80F1934();
            gUnknown_02039304->unk50++;
            break;
        case 21:
            REG_WIN0H = 0xf0;
            REG_WIN1H = 0x9b;
            REG_WIN0V = 0x3273;
            REG_WIN1V = 0x3273;
            REG_WININ = 0x3f3f;
            REG_WINOUT = 0x1b;
            REG_BG0VOFS = 0x28;
            REG_DISPCNT = DISPCNT_OBJ_1D_MAP | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON | DISPCNT_WIN1_ON;
            // fallthrough
        case 22:
            gUnknown_02039304->unk55 = 1;
            launch_c3_walk_stairs_and_run_once(sub_81365C8);
            break;
    }
}

static void sub_81365A0(void)
{
    while (!gUnknown_02039304->unk55)
    {
        sub_8136294();
    }
}

static void sub_81365C8(void)
{
    switch (gUnknown_02039304->unk50)
    {
        case 0:
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
            SetVBlankCallback(sub_8136264);
            gUnknown_02039304->unk50++;
            break;
        case 1:
            if (!gPaletteFade.active)
            {
                sub_80F3C94();
                sub_80F3D00();
                launch_c3_walk_stairs_and_run_once(sub_8136638);
            }
            break;
    }
}

static void sub_8136638(void)
{
    switch (gUnknown_02039304->unk50)
    {
        case 0:
            if (gMain.heldKeys & DPAD_UP)
            {
                PlaySE(SE_SELECT);
                sub_80F5060(TRUE);
                move_anim_execute();
                gUnknown_02039304->unk50 = 1;
            }
            else if (gMain.heldKeys & DPAD_DOWN)
            {
                PlaySE(SE_SELECT);
                sub_80F5060(FALSE);
                move_anim_execute();
                gUnknown_02039304->unk50 = 1;
            }
            else if (gMain.newKeys & B_BUTTON)
            {
                PlaySE(SE_SELECT);
                gUnknown_02039304->unk50 = 3;
            }
            else if (gMain.newKeys & A_BUTTON)
            {
                PlaySE(SE_SELECT);
                if (gUnknown_083DFEC4->unk87DC == gUnknown_083DFEC4->unk87DA - 1)
                {
                    gUnknown_02039304->unk50 = 3;
                }
                else
                {
                    gUnknown_02039304->unk50 = 5;
                }
            }
            break;
        case 1:
            if (!gpu_sync_bg_show())
            {
                gUnknown_02039304->unk50++;
            }
            break;
        case 2:
            if (!sub_8055870())
            {
                sub_80F1934();
                sub_80F3D00();
                gUnknown_02039304->unk50 = 0;
            }
            break;
        case 3:
            launch_c3_walk_stairs_and_run_once(sub_8136B44);
            break;
        case 4:
            break;
        case 5:
            sub_8136BB8();
            gUnknown_02039304->unk50++;
            break;
        case 6:
            switch (sub_8136C40())
            {
                case 1:
                case -1:
                    gUnknown_02039304->unk50 = 0;
                    break;
                case 0:
                    if (sub_8137058())
                    {
                        sub_8136D60();
                        gUnknown_02039304->unk50 = 7;
                    }
                    else
                    {
                        launch_c3_walk_stairs_and_run_once(sub_8136808);
                    }
                    break;
            }
            break;
        case 7:
            if (gMain.newKeys & (A_BUTTON | B_BUTTON))
            {
                sub_8136D8C();
                gUnknown_02039304->unk50 = 0;
            }
            break;
    }
}

static void sub_8136808(void)
{
    switch (gUnknown_02039304->unk50)
    {
        case 0:
            gPokeblockMonID = sub_81370A4(gUnknown_083DFEC4->unk87DC);
            gUnknown_02039308 = gUnknown_02039304->callback;
            gUnknown_0203930C = gUnknown_02039304->pokeblock;
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
            gUnknown_02039304->unk50++;
            break;
        case 1:
            if (!gPaletteFade.active)
            {
                gMain.savedCallback = sub_8136174;
                SetMainCallback2(CB2_PreparePokeblockFeedScene);
            }
            break;
    }
}

static void sub_81368A4(void)
{
    switch (gUnknown_02039304->unk50)
    {
        case 0:
            if (gUnknown_083DFEC4->unk87DC != gPokeblockMonID)
            {
                sub_80F5060(gUnknown_02039304->unk56);
                gUnknown_02039304->unk50++;
            }
            else
            {
                gUnknown_02039304->unk50 = 3;
            }
            break;
        case 1:
            if (!gpu_sync_bg_show())
            {
                gUnknown_02039304->unk50++;
            }
            break;
        case 2:
            if (!sub_8055870())
            {
                sub_80F1934();
                gUnknown_02039304->unk50 = 0;
            }
            break;
        case 3:
            BlendPalettes(0xFFFFFFFF, 16, RGB(0, 0, 0));
            gUnknown_02039304->unk50++;
            break;
        case 4:
            REG_DISPCNT = DISPCNT_OBJ_1D_MAP | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON | DISPCNT_WIN1_ON;
            gUnknown_02039304->unk50++;
            break;
        case 5:
            SetVBlankCallback(sub_8136264);
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
            gUnknown_02039304->unk50++;
            break;
        case 6:
            if (!gPaletteFade.active)
            {
                sub_80F3C94();
                sub_80F3D00();
                launch_c3_walk_stairs_and_run_once(sub_81369CC);
                SetMainCallback2(sub_8136244);
            }
            break;
    }
}

static void sub_81369CC(void)
{
    switch (gUnknown_02039304->unk50)
    {
        case 0:
            gUnknown_02039304->pokemon = &gPlayerParty[0];
            gUnknown_02039304->pokemon = &gPlayerParty[gUnknown_083DFEC4->unk893c[gUnknown_083DFEC4->unk87DC].partyIdx];
            move_anim_execute();
            gUnknown_02039304->unk50++;
            break;
        case 1:
            if (gMain.newKeys & (A_BUTTON | B_BUTTON))
                gUnknown_02039304->unk50++;
            break;
        case 2:
            sub_8136EF0();
            sub_80F567C(gUnknown_02039304->unk5c, gUnknown_083DFEC4->unk9040);
            sub_80F5550(gUnknown_083DFEC4->unk9004[gUnknown_083DFEC4->unk8fe9], gUnknown_083DFEC4->unk9040);
            sub_8137138();
            gUnknown_02039304->unk50++;
            break;
        case 3:
            if (!sub_80F555C())
            {
                sub_80F7224(sub_81370A4(gUnknown_083DFEC4->unk87DC));
                sub_80F3D00();
                gUnknown_02039304->unk52 = 0;
                gUnknown_02039304->unk50++;
            }
            break;
        case 4:
            if ((++gUnknown_02039304->unk52) > 16)
            {
                sub_8136C6C();
                gUnknown_02039304->unk50++;
            }
            break;
        case 5:
            if (gMain.newKeys & (A_BUTTON | B_BUTTON) && !sub_8136D00())
            {
                PokeblockClearIfExists((u8)gSpecialVar_ItemId);
                launch_c3_walk_stairs_and_run_once(sub_8136B44);
            }
            break;
    }
}

static void sub_8136B44(void)
{
    switch (gUnknown_02039304->unk50)
    {
        case 0:
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
            gUnknown_02039304->unk50++;
            break;
        case 1:
            if (!gPaletteFade.active)
            {
                gUnknown_02039304->unk50 = 2;
            }
            break;
        case 2:
            sub_80F5BDC();
            gUnknown_02039304->unk50++;
            break;
        case 3:
            SetMainCallback2(gUnknown_02039304->callback);
            break;
    }
}

static void sub_8136BB8(void)
{
    GetMonData(&gPlayerParty[sub_81370A4(gUnknown_083DFEC4->unk87DC)], MON_DATA_NICKNAME, gUnknown_02039304->stringBuffer);
    StringGetEnd10(gUnknown_02039304->stringBuffer);
    StringAppend(gUnknown_02039304->stringBuffer, gOtherText_GetsAPokeBlock);
    BasicInitMenuWindow(&gWindowTemplate_81E709C);
    Menu_DrawStdWindowFrame(0, 16, 29, 19);
    Menu_PrintText(gUnknown_02039304->stringBuffer, 1, 17);
    DisplayYesNoMenu(23, 10, 1);
    Menu_MoveCursor(0);
}

static s8 sub_8136C40(void)
{
    s8 retval = Menu_ProcessInputNoWrap();
    if ((u8)(retval + 1) < 3)
    {
        Menu_EraseScreen();
        BasicInitMenuWindow(&gWindowTemplate_81E7080);
    }
    return retval;
}

static void sub_8136C6C(void)
{
    BasicInitMenuWindow(&gWindowTemplate_81E709C);
    Menu_DrawStdWindowFrame(0, 16, 29, 19);
    for (gUnknown_02039304->unk53 = 0; gUnknown_02039304->unk53 < 5 && gUnknown_02039304->unk61[gUnknown_02039304->unk53] == 0; gUnknown_02039304->unk53++);
    if (gUnknown_02039304->unk53 < 5)
    {
        Pokeblock_BufferEnhancedStatText(gUnknown_02039304->stringBuffer, gUnknown_02039304->unk53, gUnknown_02039304->unk61[gUnknown_02039304->unk53]);
    }
    else
    {
        Pokeblock_BufferEnhancedStatText(gUnknown_02039304->stringBuffer, gUnknown_02039304->unk53, 0);
    }
    Pokeblock_MenuWindowTextPrint(gUnknown_02039304->stringBuffer);
}

static bool8 sub_8136D00(void)
{
    while (1)
    {
        gUnknown_02039304->unk53++;
        if (gUnknown_02039304->unk53 < 5)
        {
            if (gUnknown_02039304->unk61[gUnknown_02039304->unk53] != 0)
                break;
        }
        else
        {
            gUnknown_02039304->unk53 = 5;
            return FALSE;
        }
    }
    Pokeblock_BufferEnhancedStatText(gUnknown_02039304->stringBuffer, gUnknown_02039304->unk53, gUnknown_02039304->unk61[gUnknown_02039304->unk53]);
    Pokeblock_MenuWindowTextPrint(gUnknown_02039304->stringBuffer);
    return TRUE;
}

static void sub_8136D60(void)
{
    BasicInitMenuWindow(&gWindowTemplate_81E709C);
    Menu_DrawStdWindowFrame(0, 16, 29, 19);
    Menu_PrintText(gOtherText_WontEat, 1, 17);
}

static void sub_8136D8C(void)
{
    Menu_EraseScreen();
    BasicInitMenuWindow(&gWindowTemplate_81E7080);
}

static void Pokeblock_MenuWindowTextPrint(const u8 *message)
{
    Menu_DrawStdWindowFrame(0, 16, 29, 19);
    Menu_PrintText(message, 1, 17);
}

#ifdef NONMATCHING
static void Pokeblock_BufferEnhancedStatText(u8 *dest, u8 statID, s16 a2)
{
    if (a2 != 0)
    {
        StringCopy(dest, sContextStatNames[statID]);
        StringAppend(dest, gOtherText_WasEnhanced);
    }
    else
    {
        StringCopy(dest, gOtherText_NothingChanged);
    }
}
#else
NAKED
static void Pokeblock_BufferEnhancedStatText(u8 *dest, u8 a1, s16 a2)
{
    asm_unified("\tpush {r4,lr}\n"
                    "\tadds r4, r0, 0\n"
                    "\tlsls r1, 24\n"
                    "\tlsrs r3, r1, 24\n"
                    "\tlsls r2, 16\n"
                    "\tlsrs r0, r2, 16\n"
                    "\tasrs r2, 16\n"
                    "\tcmp r2, 0\n"
                    "\tbeq _08136DFC\n"
                    "\tcmp r2, 0\n"
                    "\tble _08136DD8\n"
                    "\tmovs r0, 0\n"
                    "_08136DD8:\n"
                    "\tlsls r0, 16\n"
                    "\tldr r1, _08136DF4 @ =sContextStatNames\n"
                    "\tlsls r0, r3, 2\n"
                    "\tadds r0, r1\n"
                    "\tldr r1, [r0]\n"
                    "\tadds r0, r4, 0\n"
                    "\tbl StringCopy\n"
                    "\tldr r1, _08136DF8 @ =gOtherText_WasEnhanced\n"
                    "\tadds r0, r4, 0\n"
                    "\tbl StringAppend\n"
                    "\tb _08136E04\n"
                    "\t.align 2, 0\n"
                    "_08136DF4: .4byte sContextStatNames\n"
                    "_08136DF8: .4byte gOtherText_WasEnhanced\n"
                    "_08136DFC:\n"
                    "\tldr r1, _08136E0C @ =gOtherText_NothingChanged\n"
                    "\tadds r0, r4, 0\n"
                    "\tbl StringCopy\n"
                    "_08136E04:\n"
                    "\tpop {r4}\n"
                    "\tpop {r0}\n"
                    "\tbx r0\n"
                    "\t.align 2, 0\n"
                    "_08136E0C: .4byte gOtherText_NothingChanged");
}
#endif

static void Pokeblock_GetMonContestStats(struct Pokemon *pokemon, u8 *data)
{
    u16 i;
    for (i=0; i<5; i++)
    {
        data[i] = GetMonData(pokemon, sContestStatsMonData[i]);
    }
}

static void sub_8136E40(struct Pokeblock *pokeblock, struct Pokemon *pokemon)
{
    u16 i;
    s16 cstat;
    u8 data;
    if (GetMonData(pokemon, MON_DATA_SHEEN) != 255)
    {
        sub_8136F74(pokeblock, pokemon);
        for (i=0; i<5; i++)
        {
            data = GetMonData(pokemon, sContestStatsMonData[i]);
            cstat = data + gUnknown_02039304->unk66[i];
            if (cstat < 0)
                cstat = 0;
            if (cstat > 255)
                cstat = 255;
            data = cstat;
            SetMonData(pokemon, sContestStatsMonData[i], &data);
        }
        cstat = (u8)GetMonData(pokemon, MON_DATA_SHEEN);
        cstat = cstat + pokeblock->feel;
        if (cstat > 255)
            cstat = 255;
        data = cstat;
        SetMonData(pokemon, MON_DATA_SHEEN, &data);
    }
}

static void sub_8136EF0(void)
{
    u16 i;
    struct Pokemon *pokemon = gPlayerParty;
    pokemon += gUnknown_083DFEC4->unk893c[gUnknown_083DFEC4->unk87DC].partyIdx;
    Pokeblock_GetMonContestStats(pokemon, gUnknown_02039304->unk57);
    sub_8136E40(gUnknown_02039304->pokeblock, pokemon);
    Pokeblock_GetMonContestStats(pokemon, gUnknown_02039304->unk5c);
    for (i=0; i<5; i++)
    {
        gUnknown_02039304->unk61[i] = gUnknown_02039304->unk5c[i] - gUnknown_02039304->unk57[i];
    }
}

static void sub_8136F74(struct Pokeblock *pokeblock, struct Pokemon *pokemon)
{
    s8 direction;
    s8 i;
    s16 amount;
    s8 boost;
    s8 taste;
    gUnknown_02039304->unk66[0] = pokeblock->spicy;
    gUnknown_02039304->unk66[1] = pokeblock->sour;
    gUnknown_02039304->unk66[2] = pokeblock->bitter;
    gUnknown_02039304->unk66[3] = pokeblock->sweet;
    gUnknown_02039304->unk66[4] = pokeblock->dry;
    if (gPokeblockGain > 0)
        direction = 1;
    else if (gPokeblockGain < 0)
        direction = -1;
    else
        return;
    for (i=0; i<5; i++)
    {
        amount = gUnknown_02039304->unk66[i];
        boost = amount / 10;
        if (amount % 10 >= 5) // round to the nearest
            boost++;
        taste = sub_8040A54(pokemon, gUnknown_0840612C[i]);
        if (taste == direction)
        {
            gUnknown_02039304->unk66[i] += boost * taste;
        }
    }
}

static bool8 sub_8137058(void)
{
    struct Pokemon *pokemon = gPlayerParty;
    pokemon += gUnknown_083DFEC4->unk893c[gUnknown_083DFEC4->unk87DC].partyIdx;
    if (GetMonData(pokemon, MON_DATA_SHEEN) == 255)
        return TRUE;
    return FALSE;
}

static u8 sub_81370A4(u8 a0)
{
    u8 i;
    for (i=0; i<PARTY_SIZE; i++)
    {
        if (!GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG))
        {
            if (a0 == 0)
                return i;
            a0--;
        }
    }
    return 0;
}

static u8 sub_81370E4(u8 a0)
{
    u8 ct;
    u8 i;
    for (i=0, ct=0; i<a0; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG))
        {
            ct++;
        }
    }
    return a0 - ct;
}

u8 sub_8137124(u8 a0)
{
    return sub_81370A4(a0);
}

static void sub_8137138(void)
{
    u16 flavor;
    u8 spriteidx;
    LoadSpriteSheet(&gSpriteSheet_ConditionUpDown);
    LoadSpritePalette(&gSpritePalette_ConditionUpDown);
    gUnknown_02039304->unk54 = 0;
    for (flavor=0; flavor<5; flavor++)
    {
        if (gUnknown_02039304->unk61[flavor] != 0)
        {
            spriteidx = CreateSprite(&gSpriteTemplate_840618C, gUnknown_08406158[flavor][0], gUnknown_08406158[flavor][1], 0);
            if (spriteidx != MAX_SPRITES)
            {
                if (gUnknown_02039304->unk61[flavor] != 0)
                {
                    gSprites[spriteidx].callback = sub_81371DC;
                }
                gUnknown_02039304->unk54++;
            }
        }
    }
}

static void sub_81371DC(struct Sprite *sprite)
{
    if (sprite->data[0] <= 5)
        sprite->pos2.y -= 2;
    else if (sprite->data[0] <= 11)
        sprite->pos2.y += 2;
    if ((++sprite->data[0]) > 60)
    {
        DestroySprite(sprite);
        gUnknown_02039304->unk54--;
    }
}
