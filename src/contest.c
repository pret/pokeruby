#include "global.h"
#include "constants/items.h"
#include "constants/event_objects.h"
#include "constants/moves.h"
#include "constants/songs.h"
#include "constants/species.h"
#include "battle.h"
#include "battle_anim.h"
#include "blend_palette.h"
#include "contest.h"
#include "contest_effect.h"
#include "contest_link_80C857C.h"
#include "data2.h"
#include "decompress.h"
#include "ewram.h"
#include "graphics.h"
#include "link.h"
#include "m4a.h"
#include "main.h"
#include "menu.h"
#include "menu_cursor.h"
#include "overworld.h"
#include "palette.h"
#include "random.h"
#include "rom_8077ABC.h"
#include "script.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
#include "tv.h"
#include "scanline_effect.h"
#include "util.h"
#include "contest_ai.h"

extern u8 gUnknown_020297ED;

extern void sub_80C8A38(u8);
extern void sub_80C8AD0(u8);
extern void sub_80C8C80(u8);

extern struct MusicPlayerInfo gMPlay_SE1;
extern u8 gBattleMonForms[];
extern u8 gDisplayedStringBattle[];
extern u16 gBattleTypeFlags;
extern u8 gBankAttacker;
extern u8 gBankTarget;
extern u8 gBanksBySide[];
extern u8 gBankSpriteIds[];
extern struct Window gUnknown_03004210;
extern u32 gContestRngValue;

extern struct SpriteTemplate gUnknown_02024E8C;
extern const struct ContestPokemon gContestOpponents[60];
extern const u8 gUnknown_083CA308[][2];
extern const u8 gUnknown_083CA310[][2];
extern const u8 gUnknown_083CA318[][2];
extern const u8 gUnknown_083CA330[][2];
extern const u8 gUnknown_083CA338[];
extern const u8 gUnknown_083CA33C[];
extern const u8 gUnknown_083CA340[][4];
extern const struct SpriteSheet gUnknown_083CA350;
extern const struct SpriteTemplate gSpriteTemplate_83CA3AC;
extern const struct CompressedSpriteSheet gUnknown_083CA3C4[];
extern const struct SpritePalette gUnknown_083CA3E4;
extern const struct SpriteTemplate gSpriteTemplate_83CA3F4[];
extern const struct SubspriteTable gSubspriteTables_83CA464[];
extern const struct CompressedSpriteSheet gUnknown_083CA46C;
extern const struct SpritePalette gUnknown_083CA474;
extern const struct SpriteTemplate gSpriteTemplate_83CA484;
extern const struct SpriteTemplate gSpriteTemplate_83CA4A4;
extern const struct CompressedSpriteSheet gUnknown_083CA4BC;
extern const struct CompressedSpriteSheet gUnknown_083CA4C4;
extern const struct CompressedSpritePalette gUnknown_083CA4CC;
extern const struct SpriteTemplate gUnknown_083CA4D4;
extern const struct CompressedSpriteSheet gUnknown_083CC3AC;
extern const struct CompressedSpritePalette gUnknown_083CC3B4[];
extern const struct SpriteTemplate gSpriteTemplate_83CC454[];
extern const u8 gText_Contest_WhichMoveWillBePlayed[];
extern const u8 gText_Contest_ButItCantParticipate[];
extern const u8 gUnknown_083CAFD7[];
extern const u8 gUnknown_083CB00D[];
extern const u8 ContestString_JudgeExpectantly2[];
extern const u8 ContestString_WentOverWell[];
extern const u8 ContestString_WentOverVeryWell[];
extern const u8 ContestString_AppealComboExcellently[];
extern const u8 gUnknown_083CBF60[];
extern const u8 gUnknown_083CB02C[];
extern const u8 *const gContestStandOutStrings[];
extern const u8 ContestString_DissapointedRepeat[];
extern const u8 ContestString_WentOverGreat[];
extern const u8 ContestString_DidntGoWell[];
extern const u8 ContestString_GotCrowdGoing[];
extern const u8 ContestString_CantAppealNextTurn[];
extern const u8 ContestString_CrowdWatches[];
extern const u8 ContestString_Ignored2[];
extern const u8 *const gUnknown_083CC188[];
extern const u8 gText_Contest_Shyness[];
extern const u8 gText_Contest_Anxiety[];
extern const u8 gText_Contest_Laziness[];
extern const u8 gText_Contest_Hesitancy[];
extern const u8 gText_Contest_Fear[];
extern const u8 *const gContestCategoryStrings[];
extern const u8 gUnknown_083CC2EC[];
extern const u8 *const gUnknown_083CC330[];
extern const u8 gUnknownText_UnknownFormatting2[];
extern const u8 gUnknownText_UnknownFormatting3[];
extern const u8 gUnknown_083CC59C[];
extern const u8 gUnknown_083CC5A2[];
extern const u16 gUnknown_083CC5A4[];
extern const struct ContestWinner gUnknown_083CC5D0[];
extern const u8 gUnknownText_MissedTurn[];
extern const u8 gUnknownText_LinkStandbyAndWinner[];
extern void (*const gContestEffectFuncs[])(void);
extern const s8 gContestExcitementTable[][5];

void sub_80AB350(void);
void sub_80AB5D4(u8);
void sub_80AB604(u8);
void sub_80AB678(u8);
void sub_80AB694(u8);
void sub_80AB6B4(u8);
u8 sub_80AB70C(u8 *);
void sub_80AB960(u8);
void sub_80AB9A0(u8);
void ContestMainCallback2(void);
void ContestVBlankCallback(void);
void sub_80ABB70(u8);
void sub_80ABC3C(u8);
void sub_80ABC70(u8);
void sub_80ABCDC(u8);
void sub_80ABEA0(u8);
void sub_80AC0AC(s8);
void nullsub_17(s8);
void sub_80AC0C8(u8);
void sub_80AC15C(u8);
void sub_80AC188(u8);
void sub_80AC204(u8);
void sub_80AC250(u8);
void sub_80AC284(u8);
void sub_80AC2CC(u8);
void sub_80AD8DC(u8);
void sub_80AD8FC(struct Sprite *);
void sub_80AD92C(struct Sprite *);
void sub_80AD960(u8);
void sub_80ADA1C(u8);
void sub_80ADA4C(u8);
void sub_80ADAD8(u8);
void sub_80ADB04(u8);
void sub_80ADB48(u8);
void sub_80ADB88(u8);
void sub_80ADC10(u8);
void sub_80ADC4C(u8);
void sub_80ADC84(u8);
void sub_80ADCB4(u8);
void sub_80ADD04(u8);
void sub_80ADD74(u8);
void sub_80ADDA4(u8);
void sub_80ADE54(u8);
void sub_80ADEAC(u8);
void sub_80ADEEC(u8);
void sub_80ADF4C(u8);
void sub_80ADF98(u8);
void sub_80ADFD8(u8);
void sub_80AE010(void);
void InsertStringDigit(u8 *, s32);
bool8 sub_80AE074(void);
void sub_80AEB4C(void *);
void sub_80AE5BC(u8);
void sub_80AE5D4(u8, u8);
void sub_80AE6CC(u8);
void sub_80AE6E4(u8, u8);
u8 CreateJudgeSprite(void);
u8 sub_80AE8B4(void);
u8 sub_80AE9FC(u16, u32, u32);
void sub_80AEB30(void);
void sub_80AEBEC(u16);
void sub_80AED58(void);
bool8 sub_80AEE54(u8, u8);
bool8 sub_80AF038(u8);
void sub_80AF120(void);
void sub_80AF138(void);
u16 GetChosenMove(u8);
void sub_80AF1B8(void);
void sub_80AF2A0(u8);
void sub_80AF2FC(void);
void sub_80AF3C0(void);
s16 sub_80AF688(u8);
void DetermineFinalStandings(void);
bool8 sub_80AF828(s32, s32, struct UnknownContestStruct6 *);
void sub_80AF860(void);
void sub_80AF94C(u8);
void sub_80AFA5C(void);
u16 sub_80AFB40(u8);
s8 sub_80AFB74(s16);
u8 sub_80AFBA0(s16, s16, u8);
void sub_80AFC74(u8);
void sub_80AFE30(void);
void sub_80AFF10(void);
bool8 sub_80AFF28(void);
void sub_80AFF60(struct Sprite *);
void sub_80AFFE0(bool8);
void sub_80B0034(void);
void CreateApplauseMeterSprite(void);
void nullsub_18(s8);
void sub_80B0238(struct Sprite *);
void sub_80B0280(struct Sprite *);
void sub_80B02A8(struct Sprite *);
void sub_80B02F4(struct Sprite *);
void sub_80B0324(void);
void sub_80B03A8(u8);
void sub_80B03D8(u8);
void sub_80B0458(u8);
void sub_80B0518(void);
void sub_80B0548(u8);
void sub_80B05A4(u8);
void nullsub_19(int);
void sub_80B05FC(u8);
void sub_80B0748(u8);
void sub_80B09B0(u8);
u8 sub_80B09E4(u8);
void sub_80B0BC4(u8, bool8);
void sub_80B0C5C(struct Sprite *);
void sub_80B0CB0(struct Sprite *);
void sub_80B0CDC(u8, int);
void unref_sub_80B0CF4(void);
void sub_80B0D7C(void);
void sub_80B1118(void);
void sub_80B114C(u8);
void sub_80B146C(u8, u8);
void sub_80B159C(void);
void sub_80B1710(u8);
void sub_80B1928(void);
u8 sub_80B1A2C(void);
void c3_08130B10(u8);
void sub_80B1B14(void);
void sub_80B1B68(u8);
void sub_80B1BDC(void);
void sub_80B1C34(u8);
void sub_80B1CBC(s8);
void sub_80B1CFC(u8);
void sub_80B1DDC(void);
void sub_80B1DFC(u8);
void sub_80B1EA8(s8, s8);
void sub_80B1F4C(u8);
void sub_80B1FD0(bool8);
const u8 *GetTurnOrderNumberGfx(u8);
void sub_80B20C4(void);
void sub_80B2184(void);
void sub_80B2280(void);
void sub_80B237C(u8);
void sub_80B23BC(u8);
void sub_80B2400(u8);
void sub_80B253C(u8);
void sub_80B25A4(u8);
void sub_80B25E4(u8);
void sub_80B26C8(u8);
u16 SanitizeMove(u16);
u16 SanitizeSpecies(u16);
void sub_80B2790(u8);
void sub_80B28CC(int);
void sub_80B28F0(u8);
void sub_80B292C(void);
void sub_80B2968(void);
void SelectContestMoveBankTarget(u16);

EWRAM_DATA u8 gUnknown_0203856C = 0;
EWRAM_DATA struct ContestPokemon gContestMons[4] = {0};
EWRAM_DATA s16 gUnknown_02038670[4] = {0};
EWRAM_DATA s16 gUnknown_02038678[4] = {0};
EWRAM_DATA s16 gUnknown_02038680[4] = {0};
EWRAM_DATA u16 gUnknown_02038688[4] = {0};
EWRAM_DATA u8 gContestFinalStandings[4] = {0};  // What "place" each participant came in.
EWRAM_DATA u8 gUnknown_02038694 = 0;
EWRAM_DATA u8 gContestPlayerMonIndex = 0;
EWRAM_DATA u8 gUnknown_02038696[4] = {0};
EWRAM_DATA u8 gIsLinkContest = 0;
EWRAM_DATA u8 gUnknown_0203869B = 0;
EWRAM_DATA u16 gSpecialVar_ContestCategory = 0;
EWRAM_DATA u16 gSpecialVar_ContestRank = 0;

void nullsub_89(u8 taskId)
{
}

void ResetLinkContestBoolean(void)
{
    gIsLinkContest = FALSE;
}

void ResetContestGpuRegs(void)
{
    u16 savedIme;

    REG_DISPCNT = 0x40;
    savedIme = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_IME = savedIme;
    REG_DISPSTAT = 8;
    REG_BG0CNT = 0x9800;
    REG_BG1CNT = 0x9E09;
    REG_BG2CNT = 0x9C00;
    REG_BG3CNT = 0x3A03;
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    REG_BLDY = 0;
    REG_WININ = 0x3F3F;
    REG_WINOUT = 0x3F3F;
    REG_DISPCNT |= 0x7F00;

    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    gBattle_BG1_X = 0;
    gBattle_BG1_Y = 0;
    gBattle_BG2_X = 0;
    gBattle_BG2_Y = 0;
    gBattle_BG3_X = 0;
    gBattle_BG3_Y = 0;
    gBattle_WIN0H = 0;
    gBattle_WIN0V = 0;
    gBattle_WIN1H = 0;
    gBattle_WIN1V = 0;
}

void LoadContestBgAfterMoveAnim(void)
{
    s32 i;

    LZDecompressVram(gContestMiscGfx, (void *)VRAM);
    LZDecompressVram(gContestAudienceGfx, (void *)(VRAM + 0x2000));
    LZDecompressVram(gUnknown_08D1725C, (void *)(VRAM + 0xD000));
    LoadCompressedPalette(gUnknown_08D17144, 0, 0x200);
    sub_80AB350();
    for (i = 0; i < 4; i++)
    {
        u32 var = 5 + i;

        LoadPalette(shared18000.unk18004[var], 16 * (5 + gUnknown_02038696[i]), 16 * sizeof(u16));
    }
}

void SetUpContestWindow(void)
{
    Text_LoadWindowTemplate(&gWindowTemplate_81E6FD8);
    Text_InitWindowWithTemplate(&gUnknown_03004210, &gWindowTemplate_81E6FD8);
    Text_InitWindowWithTemplate(&gMenuWindow, &gWindowTemplate_81E6FF4);
}

void sub_80AB350(void)
{
    u8 i;

    LoadFontDefaultPalette(&gWindowTemplate_81E6FD8);
    FillPalette(0, 0, 2);
    for (i = 10; i < 14; i++)
        LoadPalette(gPlttBufferUnfaded + 241, 240 + i, 2);
    FillPalette(0x7E3F, 0xF3, 2);
}

void ClearContestVars(void)
{
    s32 i;

    memset(&sContest, 0, sizeof(sContest));
    for (i = 0; i < 4; i++)
        sContest.unk19206[i] = 0xFF;

    for (i = 0; i < 4; i++)
        memset(&sContestantStatus[i], 0, sizeof(sContestantStatus[i]));
    for (i = 0; i < 4; i++)
    {
        sContestantStatus[i].unkB_0 = 0;
        sContestantStatus[i].effectStringId = CONTEST_STRING_NONE;
        sContestantStatus[i].effectStringId2 = CONTEST_STRING_NONE;
    }

    memset(&shared192D0, 0, sizeof(shared192D0));
    memset(eContestAI, 0, sizeof(struct ContestAIInfo));
    memset(&shared19328, 0, sizeof(shared19328));
    memset(shared19338, 0, 4 * sizeof(*shared19338));
    if (!(gIsLinkContest & 1))
        sub_80B0F28(0);
    for (i = 0; i < 4; i++)
    {
        sContestantStatus[i].nextTurnOrder = 0xFF;
        sContest.unk19218[i] = gUnknown_02038696[i];
    }
    sub_80B159C();
}

void CB2_StartContest(void)
{
    switch (gMain.state)
    {
    case 0:
        SetVBlankCallback(NULL);
        SetUpContestWindow();
        ResetContestGpuRegs();
        ScanlineEffect_Clear();
        ResetPaletteFade();
        gPaletteFade.bufferTransferDisabled = TRUE;
        DmaClearLarge32(3, (void *)VRAM, VRAM_SIZE, 0x1000);
        ResetSpriteData();
        ResetTasks();
        FreeAllSpritePalettes();
        gReservedSpritePaletteCount = 4;
        //shared18000.unk18000 = 0;
        gSharedMem[0x18000] = 0;
        ClearBattleMonForms();
        ClearContestVars();
        gMain.state++;
        break;
    case 1:
        sub_80AB350();
        gMain.state++;
        break;
    case 2:
        if (sub_80AB70C(&sContest.unk1925D) == 0)
            break;
        sContest.unk1925D = 0;
        gMain.state++;
        break;
    case 3:
        sub_80B2184();
        gBattle_BG1_X = 0;
        gBattle_BG1_Y = 0;
        BeginFastPaletteFade(2);
        gPaletteFade.bufferTransferDisabled = FALSE;
        SetVBlankCallback(ContestVBlankCallback);
        sContest.mainTaskId = CreateTask(sub_80AB5D4, 10);
        SetMainCallback2(ContestMainCallback2);
        break;
    }
}

void sub_80AB5D4(u8 taskId)
{
    if (!gPaletteFade.active)
        gTasks[taskId].func = sub_80AB604;
}

void sub_80AB604(u8 taskId)
{
    if (gIsLinkContest & 1)
    {
        if (!gPaletteFade.active)
        {
            gPaletteFade.bufferTransferDisabled = FALSE;
            sub_80AF860();
            CreateTask(sub_80AB678, 0);
            gTasks[taskId].func = nullsub_89;
        }
    }
    else
    {
        gTasks[taskId].func = sub_80AB960;
    }
}

void sub_80AB678(u8 taskId)
{
    SetTaskFuncWithFollowupFunc(taskId, sub_80C89DC, sub_80AB694);
}

void sub_80AB694(u8 taskId)
{
    u16 one = 1;

    gTasks[taskId].data[0] = one;
    gTasks[taskId].func = sub_80AB6B4;
}

void sub_80AB6B4(u8 taskId)
{
    gTasks[taskId].data[0]--;
    if (gTasks[taskId].data[0] <= 0)
    {
        GetMultiplayerId();  // unused return value
        DestroyTask(taskId);
        gTasks[sContest.mainTaskId].func = sub_80AB960;
        gRngValue = gContestRngValue;
    }
}

u8 sub_80AB70C(u8 *a)
{
    u16 sp0[16];
    u16 sp20[16];

    switch (*a)
    {
    case 0:
        gPaletteFade.bufferTransferDisabled = TRUE;
        DmaClearLarge32(3, (void *)VRAM, VRAM_SIZE, 0x1000);
        break;
    case 1:
        LZDecompressVram(gContestMiscGfx, (void *)VRAM);
        break;
    case 2:
        LZDecompressVram(gContestAudienceGfx, (void *)(VRAM + 0x2000));
        DmaCopyLarge32(3, (void *)(VRAM + 0x2000), shared15800, 0x2000, 0x1000);
        break;
    case 3:
        LZDecompressVram(gUnknown_08D1725C, (void *)(VRAM + 0xD000));
        break;
    case 4:
        LZDecompressVram(gUnknown_08D17424, (void *)(VRAM + 0xE000));
        DmaCopy32Defvars(3, (void *)(VRAM + 0xE000), shared18000.unk18A04, 0x800);
        break;
    case 5:
        LoadCompressedPalette(gUnknown_08D17144, 0, 0x200);
        CpuCopy32(gPlttBufferUnfaded + 128, sp0, 16 * sizeof(u16));
        CpuCopy32(gPlttBufferUnfaded + (5 + gContestPlayerMonIndex) * 16, sp20, 16 * sizeof(u16));
        CpuCopy32(sp20, gPlttBufferUnfaded + 128, 16 * sizeof(u16));
        CpuCopy32(sp0, gPlttBufferUnfaded + (5 + gContestPlayerMonIndex) * 16, 16 * sizeof(u16));
        DmaCopy32Defvars(3, gPlttBufferUnfaded, shared18000.unk18004, 0x200);
        sub_80AB350();
        break;
    case 6:
        sub_80B1118();
        sub_80AFA5C();
        sub_80AEB30();
        sContest.unk19216 = sub_80AE8B4();
        sub_80AFE30();
        sub_80B0034();
        CreateApplauseMeterSprite();
        sub_80B0324();
        sub_80B0518();
        gBanksBySide[0] = 0;
        gBanksBySide[1] = 1;
        gBanksBySide[2] = 3;
        gBanksBySide[3] = 2;
        gBattleTypeFlags = 0;
        gBankAttacker = 2;
        gBankTarget = 3;
        gBankSpriteIds[gBankAttacker] = CreateJudgeSprite();
        sub_80B292C();
        break;
    default:
        *a = 0;
        return 1;
    }

    (*a)++;
    return 0;
}

void sub_80AB960(u8 taskId)
{
    gPaletteFade.bufferTransferDisabled = FALSE;
    if (!gPaletteFade.active)
    {
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].func = sub_80AB9A0;
    }
}

void sub_80AB9A0(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
    case 0:
        if (gTasks[taskId].data[1]++ <= 60)
            break;
        gTasks[taskId].data[1] = 0;
        PlaySE12WithPanning(SE_C_MAKU_U, 0);
        gTasks[taskId].data[0]++;
        break;
    case 1:
        if ((s16)(gBattle_BG1_Y += 7) <= 160)
            break;
        gTasks[taskId].data[0]++;
        break;
    case 2:
        sub_80B2280();
        gTasks[taskId].data[0]++;
        break;
    case 3:
        REG_BG0CNT_BITFIELD.priority = 0;
        REG_BG2CNT_BITFIELD.priority = 0;
        sub_80B1B14();
        gTasks[taskId].data[0]++;
        break;
    case 4:
    default:
        if (sContest.unk1920A_6)
            break;
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].func = sub_80ABB70;
        break;
    }
}

void ContestMainCallback2(void)
{
#if DEBUG
    if (gUnknown_020297ED == 1 && gMain.newKeys == 4)
	unref_sub_80B0CF4();
#endif
    AnimateSprites();
    RunTasks();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void ContestVBlankCallback(void)
{
    REG_BG0HOFS = gBattle_BG0_X;
    REG_BG0VOFS = gBattle_BG0_Y;
    REG_BG1HOFS = gBattle_BG1_X;
    REG_BG1VOFS = gBattle_BG1_Y;
    REG_BG2HOFS = gBattle_BG2_X;
    REG_BG2VOFS = gBattle_BG2_Y;
    REG_BG3HOFS = gBattle_BG3_X;
    REG_BG3VOFS = gBattle_BG3_Y;
    REG_WIN0H = gBattle_WIN0H;
    REG_WIN0V = gBattle_WIN0V;
    REG_WIN1H = gBattle_WIN1H;
    REG_WIN1V = gBattle_WIN1V;
    TransferPlttBuffer();
    LoadOam();
    ProcessSpriteCopyRequests();
    ScanlineEffect_InitHBlankDmaTransfer();
}

void sub_80ABB70(u8 taskId)
{
    gBattle_BG0_Y = 0;
    gBattle_BG2_Y = 0;
    sub_80B0D7C();
    DmaCopy32Defvars(3, gPlttBufferUnfaded, shared18000.unk18204, 0x400);
    if (!Contest_IsMonsTurnDisabled(gContestPlayerMonIndex))
        StringCopy(gDisplayedStringBattle, gText_Contest_WhichMoveWillBePlayed);
    else
        StringCopy(gDisplayedStringBattle, gText_Contest_ButItCantParticipate);
    InsertStringDigit(gDisplayedStringBattle, sContest.turnNumber + 1);
    sub_80AF138();
    StringExpandPlaceholders(gStringVar4, gDisplayedStringBattle);
    Text_InitWindow8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
    gTasks[taskId].func = sub_80ABC3C;
}

void sub_80ABC3C(u8 taskId)
{
    if (Text_UpdateWindowInContest(&gMenuWindow) == 1)
        gTasks[taskId].func = sub_80ABC70;
}

void sub_80ABC70(u8 taskId)
{
    if ((gMain.newKeys & A_BUTTON) || (gMain.newKeys == B_BUTTON))
    {
        PlaySE(SE_SELECT);
        if (!Contest_IsMonsTurnDisabled(gContestPlayerMonIndex))
        {
            sub_80AFFE0(TRUE);
            gTasks[taskId].func = sub_80ABCDC;
        }
        else
        {
            gTasks[taskId].func = sub_80AC0C8;
        }
    }
}

// Print the move list
void sub_80ABCDC(u8 taskId)
{
    u8 i;
    u8 sp8[32];

    gBattle_BG0_Y = 0xA0;
    gBattle_BG2_Y = 0xA0;
    Text_FillWindowRectDefPalette(
      &gUnknown_03004210,
      0,
      gUnknown_083CA340[0][0],
      gUnknown_083CA340[0][1],
      gUnknown_083CA340[0][2],
      gUnknown_083CA340[0][3]);

    for (i = 0; i < 4; i++)
    {
        u16 move = gContestMons[gContestPlayerMonIndex].moves[i];
        u8 *r5 = sp8;

        if (sContestantStatus[gContestPlayerMonIndex].prevMove != MOVE_NONE
         && sub_80B214C(gContestPlayerMonIndex)
         && AreMovesContestCombo(sContestantStatus[gContestPlayerMonIndex].prevMove, move) != 0
         && sContestantStatus[gContestPlayerMonIndex].hasJudgesAttention)
        {
            r5 = StringCopy(sp8, gUnknownText_UnknownFormatting2);
        }
        else if (move != 0
         && sContestantStatus[gContestPlayerMonIndex].prevMove == move
         && gContestMoves[move].effect != CONTEST_EFFECT_REPETITION_NOT_BORING)
        {
            // Gray the text because it is a repeated move
            r5 = StringCopy(sp8, gUnknownText_UnknownFormatting3);
        }
        r5 = StringCopy(r5, gMoveNames[move]);

        Text_InitWindow8002E4C(
          &gUnknown_03004210,
          sp8,
          776 + i * 20,
          gUnknown_083CA340[i][0] * 8 + 4,
          gUnknown_083CA340[i][1] * 8,
          1);
        Text_PrintWindow8002F44(&gUnknown_03004210);
    }

    MenuCursor_Create814A5C0(0, 0xFFFF, 12, 0x2D9F, 72);
    sub_80AC0AC(sContest.playerMoveChoice);
    sub_80AEBEC(gContestMons[gContestPlayerMonIndex].moves[sContest.playerMoveChoice]);
    gTasks[taskId].func = sub_80ABEA0;
}

void debug_sub_80B9EBC(u8);

// Handle move selection input
void sub_80ABEA0(u8 taskId)
{
    u8 numMoves = 0;
    s32 i;

    for (i = 0; i < 4; i++)
    {
        if (gContestMons[gContestPlayerMonIndex].moves[i] != MOVE_NONE)
            numMoves++;
    }

    if (gMain.newKeys & A_BUTTON)
    {
        DestroyMenuCursor();
        PlaySE(SE_SELECT);
        gTasks[taskId].func = sub_80AC0C8;
    }
    else
    {
        switch (gMain.newAndRepeatedKeys)
        {
        case B_BUTTON:
            sub_814A904();
            PlaySE(SE_SELECT);
            sub_80AFFE0(FALSE);
            Text_FillWindowRectDefPalette(
              &gUnknown_03004210,
              0,
              gUnknown_083CA340[0][0],
              gUnknown_083CA340[0][1],
              gUnknown_083CA340[0][2],
              gUnknown_083CA340[0][3]);
            if (!Contest_IsMonsTurnDisabled(gContestPlayerMonIndex))
                StringCopy(gDisplayedStringBattle, gText_Contest_WhichMoveWillBePlayed);
            else
                StringCopy(gDisplayedStringBattle, gText_Contest_ButItCantParticipate);
            InsertStringDigit(gDisplayedStringBattle, sContest.turnNumber + 1);
            sub_80AF138();
            StringExpandPlaceholders(gStringVar4, gDisplayedStringBattle);
            Text_InitWindowAndPrintText(&gMenuWindow, gStringVar4, 776, 1, 15);
            gBattle_BG0_Y = 0;
            gBattle_BG2_Y = 0;
            gTasks[taskId].func = sub_80ABC70;
            break;
        case DPAD_LEFT:
        case DPAD_RIGHT:
            break;
        case DPAD_UP:
            nullsub_17(sContest.playerMoveChoice);
            if (sContest.playerMoveChoice == 0)
                sContest.playerMoveChoice = numMoves - 1;
            else
                sContest.playerMoveChoice--;
            sub_80AC0AC(sContest.playerMoveChoice);
            sub_80AED58();
            sub_80AEBEC(gContestMons[gContestPlayerMonIndex].moves[sContest.playerMoveChoice]);
            if (numMoves > 1)
                PlaySE(SE_SELECT);
            break;
        case DPAD_DOWN:
            nullsub_17(sContest.playerMoveChoice);
            if (sContest.playerMoveChoice == numMoves - 1)
                sContest.playerMoveChoice = 0;
            else
                sContest.playerMoveChoice++;
            sub_80AC0AC(sContest.playerMoveChoice);
            sub_80AED58();
            sub_80AEBEC(gContestMons[gContestPlayerMonIndex].moves[sContest.playerMoveChoice]);
            if (numMoves > 1)
                PlaySE(SE_SELECT);
            break;
#if DEBUG
	case START_BUTTON:
	    if (gUnknown_020297ED == 1 && !(gIsLinkContest & 1))
	    {
		gTasks[taskId].data[0] = 0;
		gTasks[taskId].data[1] = gContestMons[gContestPlayerMonIndex].moves[0];
		gTasks[taskId].func = debug_sub_80B9EBC;
	    }
	    break;
#endif
        }
    }
}

#if DEBUG

void debug_sub_80BA054(u8);

void debug_sub_80B9EBC(u8 taskId)
{
    u8 text[100];

    switch (gTasks[taskId].data[0])
    {
    case 0:
	Text_FillWindowRectDefPalette(
	  &gUnknown_03004210,
	  0,
	  gUnknown_083CA340[0][0],
	  gUnknown_083CA340[0][1],
	  gUnknown_083CA340[0][2],
	  gUnknown_083CA340[0][3]);
	Text_InitWindowAndPrintText(
	  &gUnknown_03004210,
	  gMoveNames[gTasks[taskId].data[1]],
	  776,
	  gUnknown_083CA340[0][0],
	  gUnknown_083CA340[0][1]);
	ConvertIntToDecimalStringN(text, gTasks[taskId].data[1], 2, 3);
	Text_InitWindowAndPrintText(
	  &gUnknown_03004210,
	  text,
	  796,
	  gUnknown_083CA340[1][0],
	  gUnknown_083CA340[1][1]);
	sub_80AED58();
	sub_80AEBEC(gTasks[taskId].data[1]);
	gTasks[taskId].data[0]++;
	break;
    case 1:
	switch (gMain.newAndRepeatedKeys)
	{
	case 0x20:
	    gTasks[taskId].data[1] -= 1;
	    if (gTasks[taskId].data[1] < 1)
		gTasks[taskId].data[1] = 354;
	    gTasks[taskId].data[0]--;
	    break;
	case 0x200:
	    gTasks[taskId].data[1] -= 10;
	    if (gTasks[taskId].data[1] < 1)
		gTasks[taskId].data[1] = 354;
	    gTasks[taskId].data[0]--;
	    break;
	case 0x10:
	    gTasks[taskId].data[1] += 1;
	    if (gTasks[taskId].data[1] > 354)
		gTasks[taskId].data[1] = 1;
	    gTasks[taskId].data[0]--;
	    break;
	case 0x100:
	    gTasks[taskId].data[1] += 10;
	    if (gTasks[taskId].data[1] > 354)
		gTasks[taskId].data[1] = 1;
	    gTasks[taskId].data[0]--;
	    break;
	case 4:
	case 8:
	    gBattle_BG0_Y = 0;
	    gBattle_BG2_Y = 0;
	    sub_80B1BDC();
	    gTasks[taskId].data[0] = 0;
	    gTasks[taskId].func = debug_sub_80BA054;
	    break;
	case 2:
	    gBattle_BG0_Y = DISPLAY_HEIGHT;
	    gBattle_BG2_Y = DISPLAY_HEIGHT;
	    gContestMons[gContestPlayerMonIndex].moves[0] = gTasks[taskId].data[1];
	    gTasks[taskId].data[0] = 0;
	    gTasks[taskId].data[1] = 0;
	    gTasks[taskId].data[2] = 0;
	    gTasks[taskId].data[3] = 0;
	    gTasks[taskId].func = sub_80ABCDC;
	    break;
	}
	break;
    }
}

void debug_sub_80BA054(u8 taskId)
{
    s32 i;
    u8 r6;

    switch (gTasks[taskId].data[0])
    {
    case 0:
	for (i = 0; i < 4; i++)
	    gBattleMonForms[i] = 0;
	memset(&shared19348, 0, sizeof(shared19348));
	sub_80B28F0(gContestPlayerMonIndex);
	r6 = sub_80AE9FC(
	  gContestMons[gContestPlayerMonIndex].species, 
	  gContestMons[gContestPlayerMonIndex].otId, 
	  gContestMons[gContestPlayerMonIndex].personality);
	gSprites[r6].pos2.x = 120;
	gSprites[r6].callback = sub_80AD8FC;
	gTasks[taskId].data[2] = r6;
	gBankSpriteIds[gBankAttacker] = r6;
	gTasks[taskId].data[3] = 0;
	gTasks[taskId].data[0]++;
	sContest.unk1925E = 0;
	break;
    case 1:
	r6 = gTasks[taskId].data[2];
	if (gSprites[r6].callback == SpriteCallbackDummy)
	{
	    sContestantStatus[gContestPlayerMonIndex].currMove = gTasks[taskId].data[1];
	    sub_80B2790(gContestPlayerMonIndex);
	    sub_80B28F0(gContestPlayerMonIndex);
	    SelectContestMoveBankTarget(gTasks[taskId].data[1]);
	    DoMoveAnim(gTasks[taskId].data[1]);
	    gTasks[taskId].data[3] = 0;
	    gTasks[taskId].data[0]++;
	}
	break;
    case 2:
	gAnimScriptCallback();
	if (!gAnimScriptActive)
	{
	    sub_80B28CC(gContestPlayerMonIndex);
	    if (sContest.unk1925E != 0)
	    {
		gTasks[taskId].data[10] = 0;
		gTasks[taskId].data[0] = 20;
	    }
	    else
	    {
		gTasks[taskId].data[0]++;
	    }
	}
	break;
    case 3:
	gTasks[taskId].data[3]++;
	if (gTasks[taskId].data[3] == 21)
	{
	    r6 = gTasks[taskId].data[2];
	    gSprites[r6].callback = sub_80AD92C;
	    sub_80B1B14();
	    gTasks[taskId].data[3] = 0;
	    gTasks[taskId].data[0]++;
	}
	break;
    case 4:
	r6 = gTasks[taskId].data[2];
	if (gSprites[r6].invisible)
	{
	    FreeSpriteOamMatrix(&gSprites[r6]);
	    DestroySprite(&gSprites[r6]);
	    gTasks[taskId].data[0] = 0;
	    gTasks[taskId].func = debug_sub_80B9EBC;
	    gBattle_BG0_Y = DISPLAY_HEIGHT;
	    gBattle_BG2_Y = DISPLAY_HEIGHT;
	}
	break;
    case 20:
	if (gTasks[taskId].data[10]++ > 30)
	{
	    gTasks[taskId].data[10] = 0;
	    gTasks[taskId].data[0] = 1;
	}
	break;
    }
}

#endif

void sub_80AC0AC(s8 a)
{
    MenuCursor_SetPos814A880(4, 88 + a * 16);
}

void nullsub_17(s8 a)
{
}

void sub_80AC0C8(u8 taskId)
{
    if (gIsLinkContest & 1)
    {
        u16 var = GetChosenMove(gContestPlayerMonIndex);
        u8 taskId2;

        sContestantStatus[gContestPlayerMonIndex].currMove = var;
        taskId2 = CreateTask(sub_80C8A38, 0);
        SetTaskFuncWithFollowupFunc(taskId2, sub_80C8A38, sub_80AC15C);
        gTasks[taskId].func = nullsub_89;
        sub_80AF860();
        sub_80AFFE0(FALSE);
    }
    else
    {
        sub_80AF1B8();
        gTasks[taskId].func = sub_80AC188;
    }
}

void sub_80AC15C(u8 taskId)
{
    DestroyTask(taskId);
    gTasks[sContest.mainTaskId].func = sub_80AC188;
}

void sub_80AC188(u8 taskId)
{
    sub_80AF138();
    gBattle_BG0_Y = 0;
    gBattle_BG2_Y = 0;
    sub_80AFFE0(FALSE);
    DmaCopy32Defvars(3, gPlttBufferFaded, shared18000.unk18604, 0x400);
    LoadPalette(shared18000.unk18204, 0, 0x400);
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = 0;
    gTasks[taskId].func = sub_80AC204;
}

void sub_80AC204(u8 taskId)
{
    if (++gTasks[taskId].data[0] > 2)
    {
        gTasks[taskId].data[0] = 0;
        if (++gTasks[taskId].data[1] == 2)
        {
            sub_80B1BDC();
            sub_80B25E4(1);
            gTasks[taskId].func = sub_80AC250;
        }
    }
}

void sub_80AC250(u8 taskId)
{
    if (!sContest.unk1920A_6 && !sContest.unk1920B_1)
        gTasks[taskId].func = sub_80AC284;
}

void sub_80AC284(u8 taskId)
{
    if (++gTasks[taskId].data[0] > 19)
    {
        sContest.unk19214 = 0;
        sContest.unk1921C = gRngValue;
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = sub_80AC2CC;
    }
}

void sub_80AC2CC(u8 taskId)
{
    u8 spriteId;
    s32 i;
    u8 r7 = sContest.unk19215;
    s8 r4;

    switch (gTasks[taskId].data[0])
    {
    case 0:
        sub_80B0D7C();
        for (i = 0; sContest.unk19214 != shared192D0.turnOrder[i]; i++)
            ;
        sContest.unk19215 = i;
        r7 = sContest.unk19215;
        if (gIsLinkContest & 1)
        {
            u8 taskId2;

            sContest.unk1920B_2 = 1;
            if (sub_80AE074())
                sub_80B114C(sContest.unk19215);
            taskId2 = CreateTask(sub_80C8C80, 0);
            SetTaskFuncWithFollowupFunc(taskId2, sub_80C8C80, sub_80AD8DC);
            sub_80AF860();
            gTasks[taskId].data[0] = 1;
        }
        else
        {
            sub_80B114C(sContest.unk19215);
            gTasks[taskId].data[0] = 2;
        }
        return;
    case 1:
        if (!sContest.unk1920B_2)
            gTasks[taskId].data[0] = 2;
        return;
    case 2:
        if (sContestantStatus[r7].numTurnsSkipped != 0
         || sContestantStatus[r7].noMoreTurns)
        {
            gTasks[taskId].data[0] = 31;
        }
        else
        {
            sub_80AF138();
            sub_80B0CDC(r7, 0);
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 3;
        }
        return;
    case 3:
        for (i = 0; i < 4; i++)
            gBattleMonForms[i] = 0;
        memset(&shared19348, 0, sizeof(shared19348));
        sub_80B28F0(sContest.unk19215);
        spriteId = sub_80AE9FC(
          gContestMons[sContest.unk19215].species,
          gContestMons[sContest.unk19215].otId,
          gContestMons[sContest.unk19215].personality);
        gSprites[spriteId].pos2.x = 120;
        gSprites[spriteId].callback = sub_80AD8FC;
        gTasks[taskId].data[2] = spriteId;
        gBankSpriteIds[gBankAttacker] = spriteId;
        sub_80B0BC4(sub_80B09E4(sContest.unk19215), FALSE);
        gTasks[taskId].data[0] = 4;
        return;
    case 4:
        spriteId = gTasks[taskId].data[2];
        if (gSprites[spriteId].callback == SpriteCallbackDummy)
        {
            if (!shared19338[r7].unk2_1)
                gTasks[taskId].data[0] = 5;
        }
        return;
    case 5:
        if (sContestantStatus[r7].nervous)
        {
            gTasks[taskId].data[0] = 33;
        }
        else
        {
            sub_80AF138();
            StringCopy(gStringVar1, gContestMons[r7].nickname);
            if (sContestantStatus[r7].currMove < NUM_MOVES)
                StringCopy(gStringVar2, gMoveNames[sContestantStatus[r7].currMove]);
            else
                StringCopy(gStringVar2, gUnknown_083CC330[sContestantStatus[r7].moveCategory]);
            StringExpandPlaceholders(gStringVar4, gUnknown_083CAFD7);
            Text_InitWindow8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
            gTasks[taskId].data[0] = 6;
        }
        return;
    case 6:
        if (Text_UpdateWindowInContest(&gMenuWindow) != 0)
        {
            sContest.unk1925E = 0;
            gTasks[taskId].data[0] = 7;
        }
        return;
    case 7:
        {
            u16 move = SanitizeMove(sContestantStatus[sContest.unk19215].currMove);

            sub_80B2790(sContest.unk19215);
            sub_80B28F0(sContest.unk19215);
            SelectContestMoveBankTarget(move);
            DoMoveAnim(move);
            gTasks[taskId].data[0] = 8;
        }
        return;
    case 8:
        gAnimScriptCallback();
        if (!gAnimScriptActive)
        {
            sub_80B28CC(r7);
            if (sContest.unk1925E != 0)
            {
                gTasks[taskId].data[10] = 0;
                gTasks[taskId].data[0] = 9;
            }
            else
            {
                if (!sContestantStatus[r7].hasJudgesAttention)
                    sub_80B03A8(r7);
                sub_80B20C4();
                gTasks[taskId].data[0] = 23;
            }
        }
        return;
    case 9:
        if (gTasks[taskId].data[10]++ > 30)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 7;
        }
        return;
    case 23:
        gTasks[taskId].data[1] = 0;
        if (sContestantStatus[r7].effectStringId != CONTEST_STRING_NONE)
        {
            sub_80B146C(r7, sContestantStatus[r7].effectStringId);
            sContestantStatus[r7].effectStringId = CONTEST_STRING_NONE;
            gTasks[taskId].data[0] = 24;
        }
        else
        {
            if (sContestantStatus[r7].effectStringId2 != CONTEST_STRING_NONE)
            {
                for (i = 0; i < 4; i++)
                {
                    if (i != r7 && sContestantStatus[i].effectStringId != CONTEST_STRING_NONE)
                        break;
                }
                if (i == 4)
                {
                    sub_80B146C(r7, sContestantStatus[r7].effectStringId2);
                    sContestantStatus[r7].effectStringId2 = CONTEST_STRING_NONE;
                    gTasks[taskId].data[0] = 24;
                }
                else
                {
                    gTasks[taskId].data[0] = 48;
                }
            }
            else
            {
                gTasks[taskId].data[0] = 48;
            }
        }
        return;
    case 24:
        if (Text_UpdateWindowInContest(&gMenuWindow) != 0)
            gTasks[taskId].data[0] = 23;
        return;
    case 48:
        if (sContestantStatus[r7].turnOrderModAction == 1)
        {
            sub_80B1710(5);
        }
        else if (sContestantStatus[r7].turnOrderModAction == 2)
        {
            sub_80B1710(6);
        }
        else if (sContestantStatus[r7].turnOrderModAction == 3)
        {
            sub_80B1710(7);
        }
        else
        {
            gTasks[taskId].data[0] = 47;
            return;
        }
        gTasks[taskId].data[0] = 49;
        return;
    case 49:
        if (!sContest.unk1920A_4)
            gTasks[taskId].data[0] = 47;
        return;
    case 47:
        sub_80B1FD0(TRUE);
        gTasks[taskId].data[0] = 12;
        return;
    case 12:
        sub_80AFBA0(0, sContestantStatus[r7].appeal2, r7);
        gTasks[taskId].data[0] = 13;
        return;
    case 13:
        if (!shared19338[sContest.unk19215].unk2_2)
            gTasks[taskId].data[0] = 35;
        return;
    case 35:
        if (sContestantStatus[r7].conditionMod == 1)
            sub_80B1710(8);
        gTasks[taskId].data[0] = 36;
        return;
    case 36:
        if (!sContest.unk1920A_4)
            gTasks[taskId].data[0] = 37;
        return;
    case 37:
        if (sub_80AEE54(r7, 1))
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 38;
        }
        else
        {
            gTasks[taskId].data[0] = 50;
        }
        return;
    case 38:
        if (++gTasks[taskId].data[10] > 20)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 50;
        }
        return;
    case 50:
        if (sub_80AF038(r7))
            PlaySE(SE_C_PASI);
        gTasks[taskId].data[0] = 25;
        return;
    case 25:
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].data[0] = 26;
        return;
    case 26:
        {
            s32 r2 = 0;

            r4 = 0;
            for (i = gTasks[taskId].data[1]; i < 4; i++)
            {
                r4 = 0;
                for (r2 = 0; r2 < 4; r2++)
                {
                    if (r2 != r7 && gUnknown_02038696[r2] == i
                     && sContestantStatus[r2].effectStringId != CONTEST_STRING_NONE)
                    {
                        r4 = 1;
                        break;
                    }
                }
                if (r4 != 0)
                    break;
            }
            if (r4)
            {
                gTasks[taskId].data[1] = gUnknown_02038696[r2];
                sub_80B146C(r2, sContestantStatus[r2].effectStringId);
                sContestantStatus[r2].effectStringId = CONTEST_STRING_NONE;
                gTasks[taskId].data[0] = 27;
            }
            else
            {
                gTasks[taskId].data[1] = 0;
                gTasks[taskId].data[10] = 0;
                gTasks[taskId].data[0] = 51;
                sub_80AF120();
            }
        }
        return;
    case 27:
        if (Text_UpdateWindowInContest(&gMenuWindow) != 0)
            gTasks[taskId].data[0] = 28;
        return;
    case 28:
        for (i = 0; gTasks[taskId].data[1] != gUnknown_02038696[i]; i++)
            ;
        sub_80AFBA0(sContestantStatus[i].appeal2 + sContestantStatus[i].jam, -sContestantStatus[i].jam, i);
        gTasks[taskId].data[0] = 29;
        return;
    case 29:
        for (i = 0; gTasks[taskId].data[1] != gUnknown_02038696[i]; i++)
            ;
        if (!shared19338[i].unk2_2)
            gTasks[taskId].data[0] = 39;
        return;
    case 39:
        for (i = 0; gTasks[taskId].data[1] != gUnknown_02038696[i]; i++)
            ;
        if (sub_80AEE54(i, 1))
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 40;
        }
        else
        {
            gTasks[taskId].data[0] = 30;
        }
        return;
    case 40:
        if (++gTasks[taskId].data[10] > 20)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 30;
        }
        return;
    case 30:
        for (i = 0; i < 4; i++)
        {
            if (gUnknown_02038696[i] == gTasks[taskId].data[1])
                break;
        }
        if (sub_80AF038(i))
            PlaySE(SE_C_PASI);
        else
            PlaySE(SE_C_SYU);
        if (sContestantStatus[i].judgesAttentionWasRemoved)
        {
            sub_80B03A8(i);
            sContestantStatus[i].judgesAttentionWasRemoved = 0;
        }
        gTasks[taskId].data[1]++;
        gTasks[taskId].data[0] = 26;
        return;
    case 51:
        if (gTasks[taskId].data[10]++ > 9)
        {
            gTasks[taskId].data[10] = 0;
            if (sContestantStatus[r7].numTurnsSkipped != 0
             || sContestantStatus[r7].turnSkipped)
            {
                sub_80AF138();
                StringCopy(gStringVar1, gContestMons[r7].nickname);
                StringExpandPlaceholders(gStringVar4, ContestString_CantAppealNextTurn);
                Text_InitWindow8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
            }
            gTasks[taskId].data[0] = 52;
        }
        return;
    case 52:
        if (Text_UpdateWindowInContest(&gMenuWindow) != 0)
        {
            if (!sContestantStatus[r7].unk15_6)
                gTasks[taskId].data[0] = 17;
            else
                gTasks[taskId].data[0] = 14;
        }
        return;
    case 14:
        r4 = sContestantStatus[r7].unk16;
        if (sContestantStatus[r7].unk16 != 0)
        {
            sub_80AF138();
            if (r4 == 1)
                Text_InitWindow8002EB0(&gMenuWindow, ContestString_WentOverWell, 776, 1, 15);
            else if (r4 == 2)
                Text_InitWindow8002EB0(&gMenuWindow, ContestString_WentOverVeryWell, 776, 1, 15);
            else
                Text_InitWindow8002EB0(&gMenuWindow, ContestString_AppealComboExcellently, 776, 1, 15);
            sub_80B1710(3);
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 45;
        }
        else
        {
            sub_80AF138();
            StringCopy(gStringVar1, gContestMons[r7].nickname);
            StringExpandPlaceholders(gStringVar4, ContestString_JudgeExpectantly2);
            Text_InitWindow8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
            sub_80B1710(2);
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 45;
        }
        return;
    case 45:
        if (!sContest.unk1920A_4)
        {
            sub_80B09B0(sContest.unk19215);
            gTasks[taskId].data[0] = 15;
        }
        return;
    case 15:
        if (Text_UpdateWindowInContest(&gMenuWindow) != 0)
        {
            if (++gTasks[taskId].data[10] > 50)
            {
                if (!sContestantStatus[r7].hasJudgesAttention)
                {
                    sub_80AFBA0(
                      sContestantStatus[r7].appeal2,
                      sContestantStatus[r7].unk17,
                      r7);
                    sContestantStatus[r7].appeal2 += sContestantStatus[r7].unk17;
                }
                gTasks[taskId].data[0] = 16;
            }
        }
        return;
    case 16:
        if (!shared19338[r7].unk2_2)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 17;
        }
        return;
    case 17:
        if (sContestantStatus[r7].disappointedRepeat)
        {
            sub_80AF138();
            StringCopy(gStringVar1, gContestMons[r7].nickname);
            StringExpandPlaceholders(gStringVar4, ContestString_DissapointedRepeat);
            Text_InitWindow8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
            gTasks[taskId].data[10] = 0;
            sub_80B1710(0);
            gTasks[taskId].data[0] = 46;
        }
        else
        {
            gTasks[taskId].data[0] = 41;
        }
        return;
    case 46:
        if (!sContest.unk1920A_4)
            gTasks[taskId].data[0] = 19;
        return;
    case 19:
        if (Text_UpdateWindowInContest(&gMenuWindow) != 0)
        {
            sub_80AFBA0(sContestantStatus[r7].appeal2, -sContestantStatus[r7].unk18, r7);
            sContestantStatus[r7].appeal2 -= sContestantStatus[r7].unk18;
            gTasks[taskId].data[0] = 18;
        }
        return;
    case 18:
        sub_80B0D7C();
        if (!shared19338[r7].unk2_2)
        {
            gTasks[taskId].data[10] = 0;
            sub_80AF138();
            gTasks[taskId].data[0] = 41;
        }
        return;
    case 41:
        if (shared19328.excitementFrozen && r7 != shared19328.excitementFreezer)
        {
            gTasks[taskId].data[0] = 57;
        }
        else
        {
            r4 = shared19328.bits_0;
            if (sContestantStatus[r7].overrideCategoryExcitementMod)
            {
                r4 = 1;
                StringCopy(gStringVar3, gMoveNames[sContestantStatus[r7].currMove]);
            }
            else
            {
                StringCopy(gStringVar3, gContestCategoryStrings[gContestMoves[sContestantStatus[r7].currMove].contestCategory]);
            }
            if (r4 > 0)
            {
                if (sContestantStatus[r7].disappointedRepeat)
                    r4 = 0;
            }
            sub_80AF138();
            StringCopy(gStringVar1, gContestMons[r7].nickname);
            sContest.applauseLevel += r4;
            if (sContest.applauseLevel < 0)
                sContest.applauseLevel = 0;
            if (r4 == 0)
            {
                gTasks[taskId].data[0] = 55;
            }
            else
            {
                if (r4 < 0)
                    StringExpandPlaceholders(gStringVar4, ContestString_DidntGoWell);
                else if (r4 > 0 && sContest.applauseLevel <= 4)
                    StringExpandPlaceholders(gStringVar4, ContestString_WentOverGreat);
                else
                    StringExpandPlaceholders(gStringVar4, ContestString_GotCrowdGoing);
                Text_InitWindow8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
                gTasks[taskId].data[10] = 0;
                gTasks[taskId].data[11] = 0;
                if (r4 < 0)
                    gTasks[taskId].data[0] = 53;
                else
                    gTasks[taskId].data[0] = 54;
            }
        }
        return;
    case 53:
        switch (gTasks[taskId].data[10])
        {
        case 0:
            sub_80B1EA8(-1, 1);
            PlayFanfare(MUS_ME_ZANNEN);
            gTasks[taskId].data[10]++;
            break;
        case 1:
            if (!sContest.unk1920B_0 && Text_UpdateWindowInContest(&gMenuWindow) != 0)
            {
                sub_80B1CBC(-1);
                gTasks[taskId].data[10]++;
            }
            break;
        case 2:
            if (!sContest.unk1920A_5)
            {
                if (gTasks[taskId].data[11]++ > 29)
                {
                    gTasks[taskId].data[11] = 0;
                    sub_80B1EA8(-1, -1);
                    gTasks[taskId].data[10]++;
                }
            }
            break;
        case 3:
            if (!gPaletteFade.active)
            {
                gTasks[taskId].data[10] = 0;
                gTasks[taskId].data[11] = 0;
                gTasks[taskId].data[0] = 43;
            }
            break;
        }
        return;
    case 54:
        switch (gTasks[taskId].data[10])
        {
        case 0:
            if (Text_UpdateWindowInContest(&gMenuWindow) != 0)
            {
                sub_80B1EA8(1, 1);
                gTasks[taskId].data[10]++;
            }
            break;
        case 1:
            if (!sContest.unk1920B_0)
            {
                sub_80B1DDC();
                PlaySE(SE_W227B);
                sub_80B1CBC(1);
                gTasks[taskId].data[10]++;
            }
            break;
        case 2:
            if (!sContest.unk1920A_5)
            {
                if (gTasks[taskId].data[11]++ > 29)
                {
                    gTasks[taskId].data[11] = 0;
                    sub_80AFBA0(sContestantStatus[r7].appeal2, shared19328.unk2, r7);
                    sContestantStatus[r7].appeal2 += shared19328.unk2;
                    gTasks[taskId].data[10]++;
                }
            }
            break;
        case 3:
            if (!shared19338[r7].unk2_2)
            {
                if (!sContest.unk1920A_7)
                {
                    sub_80B1EA8(1, -1);
                    gTasks[taskId].data[10]++;
                }
            }
            break;
        case 4:
            if (!gPaletteFade.active)
            {
                gTasks[taskId].data[10] = 0;
                gTasks[taskId].data[11] = 0;
                gTasks[taskId].data[0] = 43;
            }
            break;
        }
        return;
    case 43:
        if (!shared19338[r7].unk2_2)
        {
            sub_80AF138();
            gTasks[taskId].data[0] = 55;
        }
        return;
    case 57:
        sub_80AF138();
        StringCopy(gStringVar3, gContestMons[shared19328.excitementFreezer].nickname);
        StringCopy(gStringVar1, gContestMons[r7].nickname);
        StringCopy(gStringVar2, gMoveNames[sContestantStatus[r7].currMove]);
        StringExpandPlaceholders(gStringVar4, ContestString_CrowdWatches);
        Text_InitWindow8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
        gTasks[taskId].data[0] = 58;
        return;
    case 58:
        if (Text_UpdateWindowInContest(&gMenuWindow) != 0)
        {
            sub_80AF138();
            StringExpandPlaceholders(gStringVar4, ContestString_Ignored2);
            Text_InitWindow8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
            gTasks[taskId].data[0] = 59;
        }
        return;
    case 59:
        if (Text_UpdateWindowInContest(&gMenuWindow) != 0)
        {
            sub_80AF138();
            gTasks[taskId].data[0] = 55;
        }
        return;
    case 33:
        if (sContestantStatus[r7].hasJudgesAttention)
            sContestantStatus[r7].hasJudgesAttention = 0;
        sub_80B09B0(r7);
        StringCopy(gStringVar1, gContestMons[r7].nickname);
        StringCopy(gStringVar2, gMoveNames[sContestantStatus[r7].currMove]);
        StringExpandPlaceholders(gStringVar4, gUnknown_083CBF60);
        Text_InitWindow8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
        gTasks[taskId].data[0] = 34;
        return;
    case 34:
        if (Text_UpdateWindowInContest(&gMenuWindow) != 0)
            gTasks[taskId].data[0] = 55;
        return;
    case 55:
        sub_80B1BDC();
        gTasks[taskId].data[0] = 56;
        return;
    case 56:
        if (!sContest.unk1920A_6)
        {
            if (sContest.applauseLevel > 4)
            {
                sContest.applauseLevel = 0;
                sub_80B1928();
            }
            gTasks[taskId].data[0] = 10;
        }
        return;
    case 10:
        spriteId = gTasks[taskId].data[2];
        gSprites[spriteId].callback = sub_80AD92C;
        gTasks[taskId].data[0] = 11;
        return;
    case 11:
        spriteId = gTasks[taskId].data[2];
        if (gSprites[spriteId].invisible)
        {
            FreeSpriteOamMatrix(&gSprites[spriteId]);
            DestroySprite(&gSprites[spriteId]);
            gTasks[taskId].data[0] = 20;
        }
        return;
    case 20:
        for (i = 0; i < 4; i++)
            sub_80B0CDC(i, 1);
        gTasks[taskId].data[10] = 0;
        gTasks[taskId].data[0] = 21;
        return;
    case 31:
        sub_80AF138();
        StringCopy(gStringVar1, gContestMons[r7].nickname);
        StringExpandPlaceholders(gStringVar4, gUnknown_083CB00D);
        Text_InitWindow8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
        gTasks[taskId].data[0] = 32;
        return;
    case 32:
        if (Text_UpdateWindowInContest(&gMenuWindow) != 0)
            gTasks[taskId].data[0] = 21;
        return;
    case 21:
        if (++gTasks[taskId].data[10] > 29)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 22;
        }
        return;
    case 22:
        if (++sContest.unk19214 == 4)
        {
            gTasks[taskId].data[0] = 0;
            gTasks[taskId].data[1] = 0;
            gTasks[taskId].data[2] = 0;
            gTasks[taskId].func = sub_80AD960;
        }
        else
        {
            gTasks[taskId].data[0] = 0;
        }
        nullsub_18(0);
        return;
    }
}

void sub_80AD8DC(u8 taskId)
{
    sContest.unk1920B_2 = 0;
    DestroyTask(taskId);
}

void sub_80AD8FC(struct Sprite *sprite)
{
    if (sprite->pos2.x != 0)
    {
        sprite->pos2.x -= 2;
    }
    else
    {
        if (++sprite->data[0] == 31)
        {
            sprite->data[0] = 0;
            sprite->callback = SpriteCallbackDummy;
        }
    }
}

void sub_80AD92C(struct Sprite *sprite)
{
    sprite->pos2.x -= 6;
    if (sprite->pos1.x + sprite->pos2.x < -32)
    {
        sprite->callback = SpriteCallbackDummy;
        sprite->invisible = TRUE;
    }
}

void sub_80AD960(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
    case 0:
        if (gIsLinkContest & 1)
        {
            u8 taskId2;

            sContest.unk1920B_2 = 1;
            if (sub_80AE074())
            {
                sub_80AF2FC();
                sub_80AF3C0();
            }
            taskId2 = CreateTask(sub_80C8C80, 0);
            SetTaskFuncWithFollowupFunc(taskId2, sub_80C8C80, sub_80AD8DC);
            sub_80AF860();
            gTasks[taskId].data[0] = 1;
        }
        else
        {
            sub_80AF2FC();
            sub_80AF3C0();
            gTasks[taskId].data[0] = 2;
        }
        break;
    case 1:
        if (!sContest.unk1920B_2)
            gTasks[taskId].data[0] = 2;
        break;
    case 2:
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = sub_80ADA1C;
        break;
    }
}

void sub_80ADA1C(u8 taskId)
{
    sub_80B1FD0(FALSE);
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = 0;
    gTasks[taskId].func = sub_80ADA4C;
}

void sub_80ADA4C(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
    case 0:
        if (++gTasks[taskId].data[1] > 20)
        {
            sub_80B25E4(2);
            gTasks[taskId].data[1] = 0;
            gTasks[taskId].data[0]++;
        }
        break;
    case 1:
        if (!sContest.unk1920B_1)
        {
            if (++gTasks[taskId].data[1] > 20)
            {
                gTasks[taskId].data[1] = 0;
                gTasks[taskId].data[0]++;
            }
        }
        break;
    case 2:
        sub_80AFF10();
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].func = sub_80ADAD8;
        break;
    }
}

void sub_80ADAD8(u8 taskId)
{
    if (sub_80AFF28())
        gTasks[taskId].func = sub_80ADB04;
}

void sub_80ADB04(u8 taskId)
{
    DmaCopy32Defvars(3, shared18000.unk18204, gPlttBufferUnfaded, 0x400);
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = 2;
    gTasks[taskId].func = sub_80ADB48;
}

void sub_80ADB48(u8 taskId)
{
    if (++gTasks[taskId].data[0] > 2)
    {
        gTasks[taskId].data[0] = 0;
        if (--gTasks[taskId].data[1] == 0)
            gTasks[taskId].func = sub_80ADB88;
    }
}

void sub_80ADB88(u8 taskId)
{
    u8 r4 = sContestantStatus[gContestPlayerMonIndex].attentionLevel;

    sub_80AF138();
    StringCopy(gStringVar1, gContestMons[gContestPlayerMonIndex].nickname);
    StringExpandPlaceholders(gStringVar4, gContestStandOutStrings[r4]);
    Text_InitWindow8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
    gTasks[taskId].func = sub_80ADC10;
}

void sub_80ADC10(u8 taskId)
{
    if (Text_UpdateWindowInContest(&gMenuWindow) == 1)
    {
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = sub_80ADC4C;
        sub_80B0D7C();
    }
}

void sub_80ADC4C(u8 taskId)
{
    if (gTasks[taskId].data[0]++ > 29)
    {
        gTasks[taskId].data[0] = 0;
        sub_80AFF10();
        gTasks[taskId].func = sub_80ADC84;
    }
}

void sub_80ADC84(u8 taskId)
{
    if (sub_80AFF28())
    {
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = sub_80ADCB4;
    }
}

void sub_80ADCB4(u8 taskId)
{
    sub_80B2184();
    gTasks[taskId].func = sub_80B237C;
}

void sub_80ADCDC(u8 taskId)
{
    sub_80B2280();
    gTasks[taskId].func = sub_80ADD04;
}

void sub_80ADD04(u8 taskId)
{
    REG_BG0CNT_BITFIELD.priority = 0;
    REG_BG2CNT_BITFIELD.priority = 0;
    if (++sContest.turnNumber == 5)
    {
        gTasks[taskId].func = sub_80ADDA4;
    }
    else
    {
        sub_80B1B14();
        gTasks[taskId].func = sub_80ADD74;
    }
}

void sub_80ADD74(u8 taskId)
{
    if (!sContest.unk1920A_6)
        gTasks[taskId].func = sub_80ABB70;
}

void sub_80ADDA4(u8 taskId)
{
    s32 i;

    gBattle_BG0_Y = 0;
    gBattle_BG2_Y = 0;
    for (i = 0; i < 4; i++)
        gUnknown_02038680[i] = sContestantStatus[i].unk4;
    sub_80AF668();
    sub_80AF138();
    sub_80BE23C(sContestantStatus[gContestPlayerMonIndex].prevMove);
    gContestRngValue = gRngValue;
    StringExpandPlaceholders(gStringVar4, gUnknown_083CB02C);
    Text_InitWindow8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
    gTasks[taskId].data[2] = 0;
    gTasks[taskId].func = sub_80ADE54;
}

void sub_80ADE54(u8 taskId)
{
    if (Text_UpdateWindowInContest(&gMenuWindow) == 1)
    {
        sub_80B2184();
        gBattle_BG1_X = 0;
        gBattle_BG1_Y = 160;
        PlaySE12WithPanning(SE_C_MAKU_D, 0);
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = sub_80ADEAC;
    }
}

void sub_80ADEAC(u8 taskId)
{
    if ((s16)(gBattle_BG1_Y -= 7) < 0)
        gBattle_BG1_Y = 0;
    if (gBattle_BG1_Y == 0)  // Why cast?
    {
        gTasks[taskId].func = sub_80ADEEC;
        gTasks[taskId].data[0] = 0;
    }
}

void sub_80ADEEC(u8 taskId)
{
    if (gTasks[taskId].data[0]++ >= 50)
    {
        gTasks[taskId].data[0] = 0;
        if (gIsLinkContest & 1)
        {
            gTasks[taskId].func = sub_80ADF4C;
        }
        else
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
            gTasks[taskId].func = sub_80ADFD8;
        }
    }
}

void sub_80ADF4C(u8 taskId)
{
    u8 taskId2 = CreateTask(sub_80C8AD0, 0);

    SetTaskFuncWithFollowupFunc(taskId2, sub_80C8AD0, sub_80ADF98);
    gTasks[taskId].func = nullsub_89;
    sub_80AF860();
    sub_80AFFE0(FALSE);
}

void sub_80ADF98(u8 taskId)
{
    DestroyTask(taskId);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
    gTasks[sContest.mainTaskId].func = sub_80ADFD8;
}

void sub_80ADFD8(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        DestroyTask(taskId);
        gFieldCallback = sub_80AE010;
        SetMainCallback2(c2_exit_to_overworld_2_switch);
    }
}

void sub_80AE010(void)
{
    // Why disable and re-enable again?
    ScriptContext2_Disable();
    EnableBothScriptContexts();
}

// Expands a one-digit number in the string
void InsertStringDigit(u8 *str, s32 n)
{
    while (1)
    {
        if (*str == EOS)
            break;
        // Find the EXT_CTRL_CODE_BEGIN, 0 sequence, and place the number there
        if (*str == EXT_CTRL_CODE_BEGIN && *(str + 1) == 0)
        {
            u8 *end;

            end = ConvertIntToDecimalStringN(str, n, STR_CONV_MODE_LEFT_ALIGN, 1);
            *end = EOS;  // ConvertIntToDecimalStringN already does this.
            StringAppend(end, str + 2);  // Shift the rest of the string over.
            break;
        }
        str++;
    }
}

void sub_80AE054(void)
{
    if (!(gIsLinkContest & 1))
        gContestPlayerMonIndex = 3;
}

bool8 sub_80AE074(void)
{
    if (gContestPlayerMonIndex == gUnknown_0203869B)
        return TRUE;
    else
        return FALSE;
}

void Contest_CreatePlayerMon(u8 partyIndex)
{
    u8 name[20];
    u16 heldItem;
    s16 cool;
    s16 beauty;
    s16 cute;
    s16 smart;
    s16 tough;

    StringCopy(name, gSaveBlock2.playerName);
    Text_StripExtCtrlCodes(name);
    if (gIsLinkContest & 1)
    {
        u8 temp = name[5];

        name[5] = EOS;
        name[7] = temp;
    }
    memcpy(gContestMons[gContestPlayerMonIndex].trainerName, name, 8);
    if (gSaveBlock2.playerGender == MALE)
        gContestMons[gContestPlayerMonIndex].trainerGfxId = EVENT_OBJ_GFX_LINK_BRENDAN;
    else
        gContestMons[gContestPlayerMonIndex].trainerGfxId = EVENT_OBJ_GFX_LINK_MAY;
    gContestMons[gContestPlayerMonIndex].flags = 0;
    gContestMons[gContestPlayerMonIndex].unk2C[0] = 0;
    gContestMons[gContestPlayerMonIndex].species = GetMonData(&gPlayerParty[partyIndex], MON_DATA_SPECIES);
    GetMonData(&gPlayerParty[partyIndex], MON_DATA_NICKNAME, name);
    StringGetEnd10(name);
    if (gIsLinkContest & 1)
    {
        Text_StripExtCtrlCodes(name);
        if (GetMonData(&gPlayerParty[partyIndex], MON_DATA_LANGUAGE) == LANGUAGE_JAPANESE)
        {
            name[5] = EOS;
            name[10] = EXT_CTRL_CODE_BEGIN;
        }
        else
        {
            u8 temp = name[5];

            name[5] = EOS;
            name[10] = temp;
        }
    }
    memcpy(gContestMons[gContestPlayerMonIndex].nickname, name, 11);
    gContestMons[gContestPlayerMonIndex].cool = GetMonData(&gPlayerParty[partyIndex], MON_DATA_COOL);
    gContestMons[gContestPlayerMonIndex].beauty = GetMonData(&gPlayerParty[partyIndex], MON_DATA_BEAUTY);
    gContestMons[gContestPlayerMonIndex].cute = GetMonData(&gPlayerParty[partyIndex], MON_DATA_CUTE);
    gContestMons[gContestPlayerMonIndex].smart = GetMonData(&gPlayerParty[partyIndex], MON_DATA_SMART);
    gContestMons[gContestPlayerMonIndex].tough = GetMonData(&gPlayerParty[partyIndex], MON_DATA_TOUGH);
    gContestMons[gContestPlayerMonIndex].sheen = GetMonData(&gPlayerParty[partyIndex], MON_DATA_SHEEN);
    gContestMons[gContestPlayerMonIndex].moves[0] = GetMonData(&gPlayerParty[partyIndex], MON_DATA_MOVE1);
    gContestMons[gContestPlayerMonIndex].moves[1] = GetMonData(&gPlayerParty[partyIndex], MON_DATA_MOVE2);
    gContestMons[gContestPlayerMonIndex].moves[2] = GetMonData(&gPlayerParty[partyIndex], MON_DATA_MOVE3);
    gContestMons[gContestPlayerMonIndex].moves[3] = GetMonData(&gPlayerParty[partyIndex], MON_DATA_MOVE4);
    gContestMons[gContestPlayerMonIndex].personality = GetMonData(&gPlayerParty[partyIndex], MON_DATA_PERSONALITY);
    gContestMons[gContestPlayerMonIndex].otId = GetMonData(&gPlayerParty[partyIndex], MON_DATA_OT_ID);

    heldItem = GetMonData(&gPlayerParty[partyIndex], MON_DATA_HELD_ITEM);
    cool   = gContestMons[gContestPlayerMonIndex].cool;
    beauty = gContestMons[gContestPlayerMonIndex].beauty;
    cute   = gContestMons[gContestPlayerMonIndex].cute;
    smart  = gContestMons[gContestPlayerMonIndex].smart;
    tough  = gContestMons[gContestPlayerMonIndex].tough;
    if      (heldItem == ITEM_RED_SCARF)
        cool += 20;
    else if (heldItem == ITEM_BLUE_SCARF)
        beauty += 20;
    else if (heldItem == ITEM_PINK_SCARF)
        cute += 20;
    else if (heldItem == ITEM_GREEN_SCARF)
        smart += 20;
    else if (heldItem == ITEM_YELLOW_SCARF)
        tough += 20;
    if (cool > 255)
        cool = 255;
    if (beauty > 255)
        beauty = 255;
    if (cute > 255)
        cute = 255;
    if (smart > 255)
        smart = 255;
    if (tough > 255)
        tough = 255;
    gContestMons[gContestPlayerMonIndex].cool = cool;
    gContestMons[gContestPlayerMonIndex].beauty = beauty;
    gContestMons[gContestPlayerMonIndex].cute = cute;
    gContestMons[gContestPlayerMonIndex].smart = smart;
    gContestMons[gContestPlayerMonIndex].tough = tough;
}

void Contest_InitAllPokemon(u8 contestType, u8 rank)
{
    s32 i;
    u8 opponentsCount = 0;
    u8 opponents[64];

    sub_80AE054();

    // Find all suitable opponents
    for (i = 0; i < 60; i++)
    {
        if (rank == gContestOpponents[i].whichRank)
        {
            if      (contestType == 0 && gContestOpponents[i].aiPool_Cool)
                opponents[opponentsCount++] = i;
            else if (contestType == 1 && gContestOpponents[i].aiPool_Beauty)
                opponents[opponentsCount++] = i;
            else if (contestType == 2 && gContestOpponents[i].aiPool_Cute)
                opponents[opponentsCount++] = i;
            else if (contestType == 3 && gContestOpponents[i].aiPool_Smart)
                opponents[opponentsCount++] = i;
            else if (contestType == 4 && gContestOpponents[i].aiPool_Tough)
                opponents[opponentsCount++] = i;
        }
    }
    opponents[opponentsCount] = 0xFF;

    // Choose three random opponents from the list
    for (i = 0; i < 3; i++)
    {
        u16 rnd = Random() % opponentsCount;
        s32 j;

        gContestMons[i] = gContestOpponents[opponents[rnd]];
        for (j = rnd; opponents[j] != 0xFF; j++)
            opponents[j] = opponents[j + 1];
        opponentsCount--;
    }

#ifndef NONMATCHING
    // Compiler, please put i in r5. Thanks.
    asm(""::"r"(i));
    asm(""::"r"(i));
    asm(""::"r"(i));
    asm(""::"r"(i));
    asm(""::"r"(i));
#endif

    Contest_CreatePlayerMon(gUnknown_02038694);
}

// GetContestAvailability?
u8 sub_80AE47C(struct Pokemon *pkmn)
{
    u8 ribbon;
    u8 retVal;

    if (GetMonData(pkmn, MON_DATA_IS_EGG))
        return 3;
    if (GetMonData(pkmn, MON_DATA_HP) == 0)
        return 4;
    switch (gSpecialVar_ContestCategory)
    {
    case CONTEST_CATEGORY_COOL:
        ribbon = GetMonData(pkmn, MON_DATA_COOL_RIBBON);
        break;
    case CONTEST_CATEGORY_BEAUTY:
        ribbon = GetMonData(pkmn, MON_DATA_BEAUTY_RIBBON);
        break;
    case CONTEST_CATEGORY_CUTE:
        ribbon = GetMonData(pkmn, MON_DATA_CUTE_RIBBON);
        break;
    case CONTEST_CATEGORY_SMART:
        ribbon = GetMonData(pkmn, MON_DATA_SMART_RIBBON);
        break;
    case CONTEST_CATEGORY_TOUGH:
        ribbon = GetMonData(pkmn, MON_DATA_TOUGH_RIBBON);
        break;
    default:
        return 0;
    }

    // Couldn't get this to match any other way.
    // Returns 2, 1, or 0 respectively if ribbon's rank is above, equal, or below
    // the current contest rank.
    if (ribbon > gSpecialVar_ContestRank)
        retVal = 2;
    else if (ribbon >= gSpecialVar_ContestRank)
        retVal = 1;
    else
        retVal = 0;
    return retVal;
}

void sub_80AE514(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        Text_FillWindowRectDefPalette(
          &gUnknown_03004210,
          0,
          gUnknown_083CA308[gUnknown_02038696[i]][0],
          gUnknown_083CA308[gUnknown_02038696[i]][1],
          gUnknown_083CA310[gUnknown_02038696[i]][0] + 5,
          gUnknown_083CA310[gUnknown_02038696[i]][1] + 1);
        sub_80AE5BC(i);
        sub_80AE6CC(i);
    }
}

u8 *sub_80AE598(u8 *dest, const u8 *b, u8 c)
{
    dest = StringCopy(dest, gUnknown_083CC59C);
    *dest++ = c;
    dest = StringCopy(dest, b);
    return dest;
}

void sub_80AE5BC(u8 a)
{
    sub_80AE5D4(a, a + 10);
}

void sub_80AE5D4(u8 p, u8 b)
{
    u8 *str = gDisplayedStringBattle;

    str = sub_80AE598(str, gEmptyString_81E72B0, b);
    str[0] = EXT_CTRL_CODE_BEGIN;
    str[1] = 6;
    str[2] = 4;
    str += 3;

    *str++ = CHAR_SLASH;

    if ((gIsLinkContest & 1) && gLinkPlayers[p].language == LANGUAGE_JAPANESE)
    {
        StringCopy(str, gLinkPlayers[p].name);
        Text_InitWindow8004D04(
          &gUnknown_03004210,
          gDisplayedStringBattle,
          592 + gUnknown_02038696[p] * 22,
          251 + gUnknown_083CA310[gUnknown_02038696[p]][0] * 8,
          gUnknown_083CA310[gUnknown_02038696[p]][1] * 8,
          1);
    }
    else
    {
        StringCopy(str, gContestMons[p].trainerName);
        Text_InitWindowAndPrintText(
          &gUnknown_03004210,
          gDisplayedStringBattle,
          592 + gUnknown_02038696[p] * 22,
          gUnknown_083CA310[gUnknown_02038696[p]][0],
          gUnknown_083CA310[gUnknown_02038696[p]][1]);
    }
}

void sub_80AE6CC(u8 a)
{
    sub_80AE6E4(a, a + 10);
}

void sub_80AE6E4(u8 a, u8 b)
{
    u8 *str = gDisplayedStringBattle;

    str[0] = EXT_CTRL_CODE_BEGIN;
    str[1] = 6;
    str[2] = 4;
    str += 3;

    str = sub_80AE598(str, gContestMons[a].nickname, b);
    *str = EOS;

    Text_InitWindow8004D04(
      &gUnknown_03004210,
      gDisplayedStringBattle,
      512 + gUnknown_02038696[a] * 20,
      253 + gUnknown_083CA308[gUnknown_02038696[a]][0] * 8,
      gUnknown_083CA308[gUnknown_02038696[a]][1] * 8,
      1);
}

u16 sub_80AE770(u8 a, u8 b)
{
    u8 r5;
    u8 r4;
    u8 r3;

    switch (b)
    {
    case 0:
        r5 = gContestMons[a].cool;
        r4 = gContestMons[a].tough;
        r3 = gContestMons[a].beauty;
        break;
    case 1:
        r5 = gContestMons[a].beauty;
        r4 = gContestMons[a].cool;
        r3 = gContestMons[a].cute;
        break;
    case 2:
        r5 = gContestMons[a].cute;
        r4 = gContestMons[a].beauty;
        r3 = gContestMons[a].smart;
        break;
    case 3:
        r5 = gContestMons[a].smart;
        r4 = gContestMons[a].cute;
        r3 = gContestMons[a].tough;
        break;
    case 4:
    default:
        r5 = gContestMons[a].tough;
        r4 = gContestMons[a].smart;
        r3 = gContestMons[a].cool;
        break;
    }
    return r5 + (r4 + r3 + gContestMons[a].sheen) / 2;
}

void sub_80AE82C(u8 a)
{
    u8 i;

    for (i = 0; i < 4; i++)
        gUnknown_02038670[i] = sub_80AE770(i, a);
}

u8 CreateJudgeSprite(void)
{
    u8 spriteId;

    LoadCompressedObjectPic(&gUnknown_083CA4BC);
    LoadCompressedPalette(gContest2Pal, 0x110, 32);
    spriteId = CreateSprite(&gSpriteTemplate_83CA4A4, 112, 36, 30);
    gSprites[spriteId].oam.paletteNum = 1;
    gSprites[spriteId].callback = SpriteCallbackDummy;
    return spriteId;
}

u8 sub_80AE8B4(void)
{
    u8 spriteId;

    LoadCompressedObjectPic(&gUnknown_083CA4C4);
    LoadCompressedObjectPalette(&gUnknown_083CA4CC);
    spriteId = CreateSprite(&gUnknown_083CA4D4, 96, 10, 29);
    gSprites[spriteId].invisible = TRUE;
    gSprites[spriteId].data[0] = gSprites[spriteId].oam.tileNum;
    return spriteId;
}

u8 unref_sub_80AE908(void)
{
    u16 species = gContestMons[gContestPlayerMonIndex].species;
    u8 spriteId;

    DecompressPicFromTable_2(
      &gMonFrontPicTable[species],
      gMonFrontPicCoords[species].coords,
      gMonFrontPicCoords[species].y_offset,
      (void *)0x02000000,
      gUnknown_081FAF4C[1],
      species);
    LoadCompressedPalette(gMonPaletteTable[species].data, 0x110, 32);
    GetMonSpriteTemplate_803C56C(gContestMons[gContestPlayerMonIndex].species, 1);
    spriteId = CreateSprite(
      &gUnknown_02024E8C,
      112, 80 + (8 - gMonFrontPicCoords[gContestMons[gContestPlayerMonIndex].species].coords) * 4,
      30);
    gSprites[spriteId].oam.paletteNum = 1;
    gSprites[spriteId].callback = SpriteCallbackDummy;
    gSprites[spriteId].affineAnims = gSpriteAffineAnimTable_81E7C18;
    StartSpriteAffineAnim(&gSprites[spriteId], 0);
    return spriteId;
}

u8 sub_80AE9FC(u16 species, u32 otId, u32 personality)
{
    const u8 *lzPaletteData;
    u8 spriteId;

    species = SanitizeSpecies(species);
    HandleLoadSpecialPokePic(
      &gMonBackPicTable[species],
      gMonBackPicCoords[species].coords,
      gMonBackPicCoords[species].y_offset,
      0x02000000,
      gUnknown_081FAF4C[0],
      species,
      personality);
    lzPaletteData = GetMonSpritePalFromOtIdPersonality(species, otId, personality);
    LoadCompressedPalette(lzPaletteData, 0x120, 32);
    GetMonSpriteTemplate_803C56C(species, 0);
    spriteId = CreateSprite(&gUnknown_02024E8C, 112, sub_8077E44(2, species, 0), 30);
    gSprites[spriteId].oam.paletteNum = 2;
    gSprites[spriteId].oam.priority = 2;
    gSprites[spriteId].subpriority = sub_8079E90(2);
    gSprites[spriteId].callback = SpriteCallbackDummy;
    gSprites[spriteId].data[0] = gSprites[spriteId].oam.paletteNum;
    gSprites[spriteId].data[2] = species;
    if (IsSpeciesNotUnown(species))
        gSprites[spriteId].affineAnims = gSpriteAffineAnimTable_81E7C18;
    else
        gSprites[spriteId].affineAnims = gSpriteAffineAnimTable_81E7BEC;
    StartSpriteAffineAnim(&gSprites[spriteId], 0);
    return spriteId;
}

bool8 IsSpeciesNotUnown(u16 species)
{
    if (species == SPECIES_UNOWN)
        return FALSE;
    else
        return TRUE;
}

void sub_80AEB30(void)
{
    sub_80AEB4C((void *)(VRAM + 0xC000));
    sub_80AEB4C((void *)(VRAM + 0xE000));
}

void sub_80AEB4C(void *a)
{
    DmaCopy16Defvars(3, a, (u8 *)a + 0x500, 0x280);
}

u16 sub_80AEB68(u16 move, u8 b)
{
    u16 var;

    switch (gContestEffects[gContestMoves[move].effect].effectType)
    {
    case 0:
    case 1:
    case 8:
        var = 0x9082;
        break;
    case 2:
    case 3:
        var = 0x9088;
        break;
    default:
        var = 0x9086;
        break;
    }
    var += 0x9000 + (b << 12);
    return var;
}

void sub_80AEBEC(u16 a)
{
    u8 category;
    u16 categoryTile;
    s32 i;
    u8 numHearts;

    Text_FillWindowRectDefPalette(&gUnknown_03004210, 0, 11, 31, 16, 34);

    category = gContestMoves[a].contestCategory;
    if      (category == CONTEST_CATEGORY_COOL)
        categoryTile = 0x4040;
    else if (category == CONTEST_CATEGORY_BEAUTY)
        categoryTile = 0x4045;
    else if (category == CONTEST_CATEGORY_CUTE)
        categoryTile = 0x404A;
    else if (category == CONTEST_CATEGORY_SMART)
        categoryTile = 0x406A;
    else
        categoryTile = 0x408A;

    for (i = 0; i < 5; i++)
    {
        *(u16 *)(VRAM + 0xC7D6 + i * 2) = categoryTile;
        *(u16 *)(VRAM + 0xC816 + i * 2) = categoryTile + 16;
        categoryTile++;
    }

    if (gContestEffects[gContestMoves[a].effect].appeal == 0xFF)
        numHearts = 0;
    else
        numHearts = gContestEffects[gContestMoves[a].effect].appeal / 10;
    if (numHearts > 8)
        numHearts = 8;
    for (i = 0; i < 8; i++)
    {
        if (i < numHearts)
            *(u16 *)(VRAM + 0xC7EA + i * 2) = 0x5012;
        else
            *(u16 *)(VRAM + 0xC7EA + i * 2) = 0x5035;
    }

    if (gContestEffects[gContestMoves[a].effect].jam == 0xFF)
        numHearts = 0;
    else
        numHearts = gContestEffects[gContestMoves[a].effect].jam / 10;
    if (numHearts > 8)
        numHearts = 8;
    for (i = 0; i < 8; i++)
    {
        if (i < numHearts)
            *(u16 *)(VRAM + 0xC82A + i * 2) = 0x5014;
        else
            *(u16 *)(VRAM + 0xC82A + i * 2) = 0x5036;
    }

    Text_InitWindowAndPrintText(&gUnknown_03004210, gContestEffectStrings[gContestMoves[a].effect], 868, 11, 35);
    Text_InitWindowAndPrintText(&gUnknown_03004210, gUnknown_083CC5A2, 866, 16, 31);
}

void sub_80AED58(void)
{
    Text_FillWindowRectDefPalette(&gUnknown_03004210, 0, 11, 35, 28, 40);
}

// unused
void sub_80AED7C(u16 move, u8 b)
{
    u8 r5 = gUnknown_02038696[b] * 5 + 2;

    if (!Contest_IsMonsTurnDisabled(b) && move != MOVE_NONE)
    {
        u16 tile = sub_80AEB68(move, b);

        *(u16 *)(VRAM + 0xC028 + r5 * 64) = tile;
        *(u16 *)(VRAM + 0xC028 + r5 * 64 + 2) = tile + 1;

        *(u16 *)(VRAM + 0xC068 + r5 * 64) = tile + 16;
        *(u16 *)(VRAM + 0xC068 + r5 * 64 + 2) = tile + 17;

    }
    else
    {
        *(u16 *)(VRAM + 0xC028 + r5 * 64) = 0;
        *(u16 *)(VRAM + 0xC028 + r5 * 64 + 2) = 0;

        *(u16 *)(VRAM + 0xC068 + r5 * 64) = 0;
        *(u16 *)(VRAM + 0xC068 + r5 * 64 + 2) = 0;
    }
}

void unref_sub_80AEE20(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
        sub_80AED7C(sContestantStatus[i].currMove, i);
}

u16 sub_80AEE4C(u8 unused)
{
    return 0x2034;
}

bool8 sub_80AEE54(u8 a, u8 b)
{
    u8 r9;
    u16 r8;
    s32 r4;

    if (sContestantStatus[a].conditionMod == 0)
        return FALSE;
    r9 = gUnknown_02038696[a] * 5 + 2;
    if (sContestantStatus[a].conditionMod == 1)
    {
        r8 = sub_80AEE4C(a);
        r4 = 0;
        while (sContestantStatus[a].condition / 10 > r4)
        {
            *(u16 *)(VRAM + 0xC026 + (r9 + r4) * 64) = r8;
            r4++;
        }
        if (b != 0)
        {
            PlaySE(SE_EXPMAX);
            sContestantStatus[a].conditionMod = 0;
        }
    }
    else
    {
        r8 = 0;
        r4 = 3;
        while (sContestantStatus[a].condition / 10 < r4)
        {
            *(u16 *)(VRAM + 0xBFE6 + (r9 + r4) * 64) = r8;
            r4--;
        }
        if (b != 0)
        {
            PlaySE(SE_FU_ZAKU2);
            sContestantStatus[a].conditionMod = 0;
        }
    }
    return TRUE;
}

void sub_80AEF50(void)
{
    s32 i;
    s32 r4;

    for (i = 0; i < 4; i++)
    {
        u8 r8 = gUnknown_02038696[i] * 5 + 2;
        u16 r6 = sub_80AEE4C(i);

        r4 = 0;
        while (r4 < sContestantStatus[i].condition / 10)
        {
            *(u16 *)(VRAM + 0xC026 + (r8 + r4) * 64) = r6;
            r4++;
        }
        r6 = 0;
        while (r4 < 3)
        {
            *(u16 *)(VRAM + 0xC026 + (r8 + r4) * 64) = r6;
            r4++;
        }
    }
}

u16 sub_80AEFE8(u8 unused, u8 b)
{
    u16 var = 0;

    switch (b)
    {
    case 0:
        var = 0x80;
        break;
    case 1:
        var = 0x84;
        break;
    case 2:
        var = 0x86;
        break;
    case 3:
        var = 0x88;
        break;
    case 4:
        var = 0x82;
        break;
    }
    var += 0x9000;
    return var;
}

bool8 sub_80AF038(u8 a)
{
    bool8 r5 = TRUE;
    u16 r4 = 0;
    u8 r6 = gUnknown_02038696[a] * 5 + 2;

    if (sContestantStatus[a].resistant != 0 || sContestantStatus[a].immune != 0 || sContestantStatus[a].jamSafetyCount != 0 || sContestantStatus[a].jamReduction != 0)
        r4 = sub_80AEFE8(a, 0);
    else if (sContestantStatus[a].nervous)
        r4 = sub_80AEFE8(a, 1);
    else if (sContestantStatus[a].numTurnsSkipped != 0 || sContestantStatus[a].noMoreTurns)
        r4 = sub_80AEFE8(a, 2);
    else
        r5 = FALSE;
    if (r5)
    {
        *(u16 *)(VRAM + 0xC028 + r6 * 64) = r4;
        *(u16 *)(VRAM + 0xC028 + r6 * 64 + 2) = r4 + 1;
        *(u16 *)(VRAM + 0xC068 + r6 * 64) = r4 + 16;
        *(u16 *)(VRAM + 0xC068 + r6 * 64 + 2) = r4 + 17;
    }
    else
    {
        *(u16 *)(VRAM + 0xC028 + r6 * 64) = 0;
        *(u16 *)(VRAM + 0xC028 + r6 * 64 + 2) = 0;
        *(u16 *)(VRAM + 0xC068 + r6 * 64) = 0;
        *(u16 *)(VRAM + 0xC068 + r6 * 64 + 2) = 0;
    }
    return r5;
}

void sub_80AF120(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
        sub_80AF038(i);
}

void sub_80AF138(void)
{
    Text_FillWindowRectDefPalette(&gUnknown_03004210, 0, 1, 15, 17, 18);
}

u16 GetChosenMove(u8 a)
{
    if (Contest_IsMonsTurnDisabled(a))
        return 0;
    if (a == gContestPlayerMonIndex)
    {
        return gContestMons[a].moves[sContest.playerMoveChoice];
    }
    else
    {
        u8 moveChoice;

        ContestAI_ResetAI(a);
        moveChoice = ContestAI_GetActionToUse();
        return gContestMons[a].moves[moveChoice];
    }
}

void sub_80AF1B8(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
        sContestantStatus[i].currMove = GetChosenMove(i);
}

void sub_80AF1E4(u8 a, u8 b)
{
    u8 r3;

    if (b == 0)
        r3 = a + 10;
    else
        r3 = 14;
    if (sContestantStatus[a].currMove == MOVE_NONE)
        sub_80AE598(gDisplayedStringBattle, gUnknownText_MissedTurn, r3);
    else
        sub_80AE598(gDisplayedStringBattle, gMoveNames[sContestantStatus[a].currMove], r3);
    sub_80AF2A0(a);
    Text_InitWindowAndPrintText(
      &gUnknown_03004210,
      gDisplayedStringBattle,
      696 + a * 20,
      gUnknown_083CA318[a][0],
      gUnknown_083CA318[a][1]);
}

void unref_sub_80AF280(u8 a)
{
    u8 i;

    for (i = 0; i < 4; i++)
        sub_80AF1E4(i, a);
}

void sub_80AF2A0(u8 a)
{
    Text_FillWindowRectDefPalette(
      &gUnknown_03004210,
      0,
      gUnknown_083CA318[a][0],
      gUnknown_083CA318[a][1],
      gUnknown_083CA318[a][0] + 7,
      gUnknown_083CA318[a][1] + 1);
}

void unref_sub_80AF2E0(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
        sub_80AF2A0(i);
}

void sub_80AF2FC(void)
{
    u8 i;
    u8 j;
    s16 arr[4];

    for (i = 0; i < 4; i++)
    {
        sContestantStatus[i].unk4 += sContestantStatus[i].appeal2;
        arr[i] = sContestantStatus[i].unk4;
    }
    for (i = 0; i < 3; i++)
    {
        for (j = 3; j > i; j--)
        {
            if (arr[j - 1] < arr[j])
            {
                u16 temp = arr[j];

                arr[j] = arr[j - 1];
                arr[j - 1] = temp;
            }
        }
    }
    for (i = 0; i < 4; i++)
    {
        for (j = 0; j < 4; j++)
        {
            if (sContestantStatus[i].unk4 == arr[j])
            {
                sContestantStatus[i].unkB_0 = j;
                break;
            }
        }
    }
    sub_80B0F28(1);
    sub_80B159C();
}

void sub_80AF3C0(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        u8 attentionLevel;

        if (sContestantStatus[i].currMove == MOVE_NONE)
            attentionLevel = 5;
        else if (sContestantStatus[i].appeal2 <= 0)
            attentionLevel = 0;
        else if (sContestantStatus[i].appeal2 < 30)
            attentionLevel = 1;
        else if (sContestantStatus[i].appeal2 < 60)
            attentionLevel = 2;
        else if (sContestantStatus[i].appeal2 < 80)
            attentionLevel = 3;
        else
            attentionLevel = 4;

        sContestantStatus[i].attentionLevel = attentionLevel;
    }
}

bool8 sub_80AF404(u8 a)
{
    if (sContestantStatus[a].numTurnsSkipped != 0 || sContestantStatus[a].noMoreTurns)
        return FALSE;
    else
        return TRUE;
}

void sub_80AF438(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        // This is bitfield hell...
        sContestantStatus[i].appeal2 = 0;
        sContestantStatus[i].appeal1 = 0;
        sContestantStatus[i].jamSafetyCount = 0;
        if (sContestantStatus[i].numTurnsSkipped > 0)
            sContestantStatus[i].numTurnsSkipped--;
        sContestantStatus[i].jam = 0;
        sContestantStatus[i].resistant = 0;
        sContestantStatus[i].jamReduction = 0;
        sContestantStatus[i].immune = 0;
        sContestantStatus[i].moreEasilyStartled = 0;
        sContestantStatus[i].usedRepeatableMove = 0;
        sContestantStatus[i].nervous = 0;
        sContestantStatus[i].effectStringId = CONTEST_STRING_NONE;
        sContestantStatus[i].effectStringId2 = CONTEST_STRING_NONE;
        sContestantStatus[i].conditionMod = 0;
        sContestantStatus[i].unk15_2 = sContestantStatus[i].disappointedRepeat;
        sContestantStatus[i].disappointedRepeat = FALSE;
        sContestantStatus[i].turnOrderModAction = 0;
        sContestantStatus[i].appealTripleCondition = 0;
        if (sContestantStatus[i].turnSkipped)
        {
            sContestantStatus[i].numTurnsSkipped = 1;
            sContestantStatus[i].turnSkipped = 0;
        }
        if (sContestantStatus[i].exploded)
        {
            sContestantStatus[i].noMoreTurns = 1;
            sContestantStatus[i].exploded = 0;
        }
        sContestantStatus[i].overrideCategoryExcitementMod = 0;
    }
    for (i = 0; i < 4; i++)
    {
        sContestantStatus[i].prevMove = sContestantStatus[i].currMove;
        sContest.unk19220[sContest.turnNumber][i] = sContestantStatus[i].prevMove;
        sContest.unk19248[sContest.turnNumber][i] = Contest_GetMoveExcitement(sContestantStatus[i].currMove);
        sContestantStatus[i].currMove = MOVE_NONE;
    }
    shared19328.excitementFrozen = 0;
}

bool8 Contest_IsMonsTurnDisabled(u8 a)
{
    if (sContestantStatus[a].numTurnsSkipped != 0 || sContestantStatus[a].noMoreTurns)
        return TRUE;
    else
        return FALSE;
}

bool8 unref_sub_80AF5D0(u8 a, u8 b)
{
    u8 i;

    if (a != gContestPlayerMonIndex)
        return TRUE;
    for (i = 0; i < 4; i++)
    {
        if (b == 3)
        {
            sContest.unk1920A_0 = 1;
            return TRUE;
        }
        if (b == 4)
        {
            sContest.unk1920A_1 = 1;
            return TRUE;
        }
        if (sContest.unk19206[i] == b)
            return TRUE;
        if (sContest.unk19206[i] == 0xFF)
        {
            sContest.unk19206[i] = b;
            return TRUE;
        }
    }
    return FALSE;
}

void sub_80AF630(u8 a)
{
    gUnknown_02038688[a] = sub_80AF688(a);
    gUnknown_02038678[a] = gUnknown_02038670[a] + gUnknown_02038688[a];
}

void sub_80AF668(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
        sub_80AF630(i);
    DetermineFinalStandings();
}

s16 sub_80AF688(u8 a)
{
    return gUnknown_02038680[a] * 2;
}

// Determines standing order?
void DetermineFinalStandings(void)
{
    u16 sp0[4] = {0};
    struct UnknownContestStruct6 sp8[4];
    s32 i;
    s32 j;

    for (i = 0; i < 4; i++)
    {
        s32 r2;

        sp0[i] = Random();
        for (r2 = 0; r2 < i; r2++)
        {
            if (sp0[i] == sp0[r2])
            {
                i--;
                break;
            }
        }
    }

    for (i = 0; i < 4; i++)
    {
        sp8[i].unk0 = gUnknown_02038678[i];
        sp8[i].unk4 = gUnknown_02038670[i];
        sp8[i].unk8 = sp0[i];
        sp8[i].unkC = i;
    }

    for (i = 0; i < 3; i++)
    {
        for (j = 3; j > i; j--)
        {
            if (sub_80AF828(j - 1, j, sp8))
            {
                struct UnknownContestStruct6 temp;

                temp.unk0 = sp8[j - 1].unk0;
                temp.unk4 = sp8[j - 1].unk4;
                temp.unk8 = sp8[j - 1].unk8;
                temp.unkC = sp8[j - 1].unkC;

                sp8[j - 1].unk0 = sp8[j].unk0;
                sp8[j - 1].unk4 = sp8[j].unk4;
                sp8[j - 1].unk8 = sp8[j].unk8;
                sp8[j - 1].unkC = sp8[j].unkC;

                sp8[j].unk0 = temp.unk0;
                sp8[j].unk4 = temp.unk4;
                sp8[j].unk8 = temp.unk8;
                sp8[j].unkC = temp.unkC;
            }
        }
    }

    for (i = 0; i < 4; i++)
        gContestFinalStandings[sp8[i].unkC] = i;
}

bool8 sub_80AF828(s32 a, s32 b, struct UnknownContestStruct6 *c)
{
    bool8 retVal;

    if      (c[a].unk0 < c[b].unk0)
        retVal = TRUE;
    else if (c[a].unk0 > c[b].unk0)
        retVal = FALSE;
    else if (c[a].unk4 < c[b].unk4)
        retVal = TRUE;
    else if (c[a].unk4 > c[b].unk4)
        retVal = FALSE;
    else if (c[a].unk8 < c[b].unk8)
        retVal = TRUE;
    else
        retVal = FALSE;
    return retVal;
}

void sub_80AF860(void)
{
    gBattle_BG0_Y = 0;
    gBattle_BG2_Y = 0;
    sub_80AF138();
    Text_InitWindowAndPrintText(&gMenuWindow, gUnknownText_LinkStandbyAndWinner, 776, 1, 15);
}

u8 unref_sub_80AF89C(s16 a, s16 b, u8 c, u8 d)
{
    u8 taskId;
    u8 r5;
    s8 r4;
    u16 r0;

    shared19338[d].unk2_2 = 1;
    taskId = CreateTask(sub_80AF94C, 20);
    r5 = sub_80AFB74(a);
    r4 = sub_80AFB74(a + b) - r5;
    r0 = sub_80AFB40(d);
    gTasks[taskId].data[0] = r5;
    gTasks[taskId].data[1] = r4;
    gTasks[taskId].data[2] = r0 + c;
    gTasks[taskId].data[3] = d;
    if (b < 0)
        nullsub_19(d);
    return taskId;
}

void sub_80AF94C(u8 taskId)
{
    u8 r5 = gTasks[taskId].data[3];

    if (gTasks[taskId].data[1] == 0)
    {
        nullsub_19(r5);
        DestroyTask(taskId);
        shared19338[r5].unk2_2 = 0;
    }
    else if (++gTasks[taskId].data[10] > 29)
    {
        u8 r6;

        gTasks[taskId].data[10] = 0;
        if (gTasks[taskId].data[1] < 0)
        {
            r6 = gTasks[taskId].data[0]--;
            gTasks[taskId].data[1]++;
            PlaySE(SE_BOO);
        }
        else
        {
            r6 = ++gTasks[taskId].data[0];
            gTasks[taskId].data[1]--;
            PlaySE(SE_PIN);
        }
        if ((u16)gTasks[taskId].data[2] != 0xFFFF)
        {
            RequestSpriteCopy(
              &gTasks[taskId].data[2],
              (void *)(VRAM + 0xC000 + (147 + r6 + r5 * 160) * 2),
              2);
        }
        else
        {
            u8 i;

            for (i = 0; i < 3; i++)
            {
                if (gTasks[taskId].data[i + 4] < 0)
                {
                    RequestSpriteCopy(
                      &gTasks[taskId].data[i + 7],
                      (void *)(VRAM + 0xC000 + (147 + r6 + r5 * 160) * 2),
                      2);
                    gTasks[taskId].data[i + 4]++;
                    break;
                }
            }
        }
    }
}

void sub_80AFA5C(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        DmaClear16(3, (void *)(VRAM + 0xC000 + (86 + i * 160) * 2), 16);
        DmaClear16(3, (void *)(VRAM + 0xC000 + (118 + i * 160) * 2), 16);
    }
}

void unref_sub_80AFAB8(s16 a, u8 b)
{
    u8 r5 = sub_80AFB74(a);
    u16 r2;
    u8 i;
    u16 arr[9];

    if (b == 0)
        r2 = 0x50A2;
    else if (b == 1)
        r2 = 0x60A2;
    else if (b == 2)
        r2 = 0x70A2;
    else
        r2 = 0x80A2;

    for (i = 0; i < 9; i++)
    {
        if (i < r5)
            arr[i] = r2;
        else
            arr[i] = 0;
    }

    DmaCopy16Defvars(3, arr, (void *)(VRAM + 0xC000 + (148 + b * 160) * 2), sizeof(arr));
}

u16 sub_80AFB40(u8 a)
{
    u16 var;

    if (a == 0)
        var = 0x5011;
    else if (a == 1)
        var = 0x6011;
    else if (a == 2)
        var = 0x7011;
    else
        var = 0x8011;
    return var + 1;
}

s8 sub_80AFB74(s16 a)
{
    s8 retVal = a / 10;

    if (retVal > 16)
        retVal = 16;
    else if (retVal < -16)
        retVal = -16;
    return retVal;
}

u8 sub_80AFBA0(s16 a, s16 b, u8 c)
{
    u8 taskId;
    s8 r4;
    s8 r5;

    shared19338[c].unk2_2 = 1;
    taskId = CreateTask(sub_80AFC74, 20);
    r4 = sub_80AFB74(a);
    r5 = sub_80AFB74(a + b) - r4;
    sub_80AFB40(c);  // unused return value
    gTasks[taskId].data[0] = abs(r4);
    gTasks[taskId].data[1] = r5;
    if (r4 > 0 || (r4 == 0 && r5 > 0))
        gTasks[taskId].data[2] = 1;
    else
        gTasks[taskId].data[2] = -1;
    gTasks[taskId].data[3] = c;
    if (b < 0)
        nullsub_19(c);
    return taskId;
}

void sub_80AFC74(u8 taskId)
{
    u8 r7 = gTasks[taskId].data[3];
    s16 r3 = gTasks[taskId].data[0];
    s16 r1 = gTasks[taskId].data[1];

    if (++gTasks[taskId].data[10] > 14)
    {
        u16 r6;
        u8 r5;
        u8 r10;

        gTasks[taskId].data[10] = 0;
        if (gTasks[taskId].data[1] == 0)
        {
            nullsub_19(r7);
            DestroyTask(taskId);
            shared19338[r7].unk2_2 = 0;
            return;
        }
        else if (r3 == 0)
        {
            if (r1 < 0)
            {
                r6 = sub_80AFB40(r7) + 2;
                gTasks[taskId].data[1]++;
            }
            else
            {
                r6 = sub_80AFB40(r7);
                gTasks[taskId].data[1]--;
            }
            r5 = gTasks[taskId].data[0]++;
        }
        else
        {
            if (gTasks[taskId].data[2] < 0)
            {
                if (r1 < 0)
                {
                    r5 = gTasks[taskId].data[0]++;
                    gTasks[taskId].data[1]++;
                    r6 = sub_80AFB40(r7) + 2;
                }
                else
                {
                    r5 = --gTasks[taskId].data[0];
                    r6 = 0;
                    gTasks[taskId].data[1]--;
                }
            }
            else
            {
                if (r1 < 0)
                {
                    r5 = --gTasks[taskId].data[0];
                    r6 = 0;
                    gTasks[taskId].data[1]++;
                }
                else
                {
                    r5 = gTasks[taskId].data[0]++;
                    gTasks[taskId].data[1]--;
                    r6 = sub_80AFB40(r7);
                }
            }
        }
        r10 = r5;
        if (r5 > 7)
            r5 += 24;
        // Seriously, a 2-byte CpuFill? Why?
        CpuFill16(r6, (void *)(VRAM + 0xC000 + (0x56 + r5 + gUnknown_02038696[r7] * 160) * 2), 2);
        if (r1 > 0)
        {
            PlaySE(SE_C_GAJI);
            m4aMPlayImmInit(&gMPlay_SE1);
            m4aMPlayPitchControl(&gMPlay_SE1, 0xFFFF, r10 * 256);
        }
        else
        {
            PlaySE(SE_BOO);
        }
        if (r5 == 0 && r6 == 0)
            gTasks[taskId].data[2] = -gTasks[taskId].data[2];
    }
}

void sub_80AFE30(void)
{
    s32 i;

    LoadSpriteSheet(&gUnknown_083CA350);
    for (i = 0; i < 4; i++)
    {
        u8 y = gUnknown_083CA338[gUnknown_02038696[i]];

        shared19338[i].unk0 = CreateSprite(&gSpriteTemplate_83CA3AC, 180, y, 1);
    }
}

void sub_80AFE78(u8 a)
{
    u8 spriteId;
    s16 r5;

    shared19338[a].unk2_0 = 1;
    spriteId = shared19338[a].unk0;
    r5 = sContestantStatus[a].unk4 / 10 * 2;
    if (r5 > 56)
        r5 = 56;
    else if (r5 < 0)
        r5 = 0;
    gSprites[spriteId].invisible = FALSE;
    gSprites[spriteId].data[0] = a;
    gSprites[spriteId].data[1] = r5;
    if (gSprites[spriteId].data[1] > gSprites[spriteId].pos2.x)
        gSprites[spriteId].data[2] = 1;
    else
        gSprites[spriteId].data[2] = -1;
    gSprites[spriteId].callback = sub_80AFF60;
}

void sub_80AFF10(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
        sub_80AFE78(i);
}

bool8 sub_80AFF28(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        if (shared19338[i].unk2_0)
            break;
    }
    if (i == 4)
        return TRUE;
    else
        return FALSE;
}

void sub_80AFF60(struct Sprite *sprite)
{
    if (sprite->pos2.x == sprite->data[1])
    {
        shared19338[sprite->data[0]].unk2_0 = 0;
        sprite->callback = SpriteCallbackDummy;
    }
    else
    {
        sprite->pos2.x += sprite->data[2];
    }
}

void sub_80AFFA0(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
        gSprites[shared19338[i].unk0].pos1.y = gUnknown_083CA338[gUnknown_02038696[i]];
}

void sub_80AFFE0(bool8 a)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        if (gUnknown_02038696[i] > 1)
        {
            if (!a)
                gSprites[shared19338[i].unk0].pos1.x = 180;
            else
                gSprites[shared19338[i].unk0].pos1.x = 256;
        }
    }
}

void sub_80B0034(void)
{
    s32 i;

    LoadSpritePalette(&gUnknown_083CA3E4);
    for (i = 0; i < 4; i++)
    {
        LoadCompressedObjectPic(&gUnknown_083CA3C4[i]);
        shared19338[i].unk1 = CreateSprite(
          &gSpriteTemplate_83CA3F4[i],
          204, gUnknown_083CA33C[gUnknown_02038696[i]],
          0);
        SetSubspriteTables(&gSprites[shared19338[i].unk1], gSubspriteTables_83CA464);
        gSprites[shared19338[i].unk1].invisible = TRUE;
    }
}

void CreateApplauseMeterSprite(void)
{
    u8 spriteId;

    LoadCompressedObjectPic(&gUnknown_083CA46C);
    LoadSpritePalette(&gUnknown_083CA474);
    spriteId = CreateSprite(&gSpriteTemplate_83CA484, 30, 44, 1);
    gSprites[spriteId].invisible = TRUE;
    sContest.applauseMeterSpriteId = spriteId;
}

void nullsub_18(s8 unused)
{
}

void unref_sub_80B011C(void)
{
    u8 i;

    LoadCompressedObjectPic(&gUnknown_083CC3AC);
    for (i = 0; i < 4; i++)
        LoadCompressedObjectPalette(&gUnknown_083CC3B4[i]);
    for (i = 0; i < 4; i++)
    {
        u8 spriteId = CreateSprite(
          &gSpriteTemplate_83CC454[i],
          gUnknown_083CA330[i][0], gUnknown_083CA330[i][1],
          5);

        gSprites[spriteId].invisible = TRUE;
        gSprites[spriteId].data[0] = i;
        sContest.unk1920D[i] = spriteId;
    }
}

void unref_sub_80B01B0(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
        gSprites[sContest.unk1920D[i]].callback = sub_80B0238;
}

bool8 unref_sub_80B01E0(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        if (gSprites[sContest.unk1920D[i]].callback != SpriteCallbackDummy)
            break;
    }
    if (i == 4)
        return TRUE;
    else
        return FALSE;
}

void sub_80B0238(struct Sprite *sprite)
{
    sprite->oam.affineMode = 1;
    InitSpriteAffineAnim(sprite);
    if (sprite->invisible)
    {
        sprite->callback = sub_80B02A8;
    }
    else
    {
        StartSpriteAffineAnim(sprite, 1);
        sprite->callback = sub_80B0280;
    }
}

void sub_80B0280(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
    {
        sprite->invisible = TRUE;
        sprite->callback = sub_80B02A8;
    }
}

void sub_80B02A8(struct Sprite *sprite)
{
    sprite->invisible = FALSE;
    StartSpriteAnim(sprite, sContestantStatus[sprite->data[0]].unkB_0);
    StartSpriteAffineAnim(sprite, 2);
    sprite->callback = sub_80B02F4;
    PlaySE(SE_JYUNI);
}

void sub_80B02F4(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
    {
        FreeSpriteOamMatrix(sprite);
        sprite->oam.affineMode = 0;
        sprite->callback = SpriteCallbackDummy;
    }
}

void sub_80B0324(void)
{
    u8 i;
    u8 taskId = CreateTask(sub_80B0458, 30);

    sContest.unk19211 = taskId;
    for (i = 0; i < 4; i++)
        gTasks[taskId].data[i * 4] = 0xFF;
}

void sub_80B0368(u8 a)
{
    gTasks[sContest.unk19211].data[a * 4 + 0] = 0;
    gTasks[sContest.unk19211].data[a * 4 + 1] = 0;
}

void sub_80B03A8(u8 a)
{
    u8 taskId = CreateTask(sub_80B03D8, 31);

    gTasks[taskId].data[0] = a;
}

void sub_80B03D8(u8 taskId)
{
    u8 r4 = gTasks[taskId].data[0];

    if (gTasks[sContest.unk19211].data[r4 * 4 + 0] == 0
     || gTasks[sContest.unk19211].data[r4 * 4 + 0] == 0xFF)
    {
        gTasks[sContest.unk19211].data[r4 * 4 + 0] = 0xFF;
        gTasks[sContest.unk19211].data[r4 * 4 + 1] = 0;
        BlendPalette((sContest.unk19218[r4] + 5) * 16 + 6, 2, 0, RGB(31, 31, 18));
        DestroyTask(taskId);
    }
}

void sub_80B0458(u8 taskId)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        u8 r3 = i * 4;

        if (gTasks[taskId].data[r3 + 0] != 0xFF)
        {
            if (gTasks[taskId].data[r3 + 1] == 0)
                gTasks[taskId].data[r3 + 0]++;
            else
                gTasks[taskId].data[r3 + 0]--;

            if (gTasks[taskId].data[r3 + 0] == 16
             || gTasks[taskId].data[r3 + 0] == 0)
                gTasks[taskId].data[r3 + 1] ^= 1;

            BlendPalette(
              (sContest.unk19218[i] + 5) * 16 + 6,
              2,
              gTasks[taskId].data[r3 + 0],
              RGB(31, 31, 18));
        }
    }
}

void sub_80B0518(void)
{
    u8 i;

    sContest.unk19212 = CreateTask(sub_80B05FC, 30);
    for (i = 0; i < 4; i++)
        sub_80B0548(i);
}

void sub_80B0548(u8 a)
{
    gTasks[sContest.unk19212].data[a * 4 + 0] = 0xFF;
    gTasks[sContest.unk19212].data[a * 4 + 1] = 0;
}

void sub_80B0588(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
        sub_80B05A4(i);
}

// TODO: Try to write this better
void sub_80B05A4(u8 a)
{
    u32 var;
    u32 r0;

    sub_80B0548(a);

    // 2-byte DMA copy? Why?

    r0 = a + 5;
    DmaCopy16Defvars(
      3,
      gPlttBufferUnfaded + r0 * 16 + 10,
      gPlttBufferFaded   + r0 * 16 + 10,
      2);

    var = (a + 5) * 16 + 12 + a;
    DmaCopy16Defvars(
      3,
      gPlttBufferUnfaded + var,
      gPlttBufferFaded + var,
      2);
}

void nullsub_19(int unused)
{
}

void sub_80B05FC(u8 taskId)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        u8 r3 = i * 4;

        if (gTasks[taskId].data[r3 + 0] != 0xFF)
        {
            if (++gTasks[taskId].data[r3 + 2] > 2)
            {
                gTasks[taskId].data[r3 + 2] = 0;

                if (gTasks[taskId].data[r3 + 1] == 0)
                    gTasks[taskId].data[r3 + 0]++;
                else
                    gTasks[taskId].data[r3 + 0]--;

                if (gTasks[taskId].data[r3 + 0] == 16
                 || gTasks[taskId].data[r3 + 0] == 0)
                    gTasks[taskId].data[r3 + 1] ^= 1;

                BlendPalette((i + 5) * 16 + 10, 1, gTasks[taskId].data[r3 + 0], RGB(31, 31, 18));
                BlendPalette((i + 5) * 16 + 12 + i, 1, gTasks[taskId].data[r3 + 0], RGB(31, 31, 18));
            }
        }
    }
}

u8 unref_sub_80B06E0(u8 *a)
{
    u8 i;
    u8 taskId = CreateTask(sub_80B0748, 10);

    for (i = 0; i < 4; i++)
    {
        u8 r0 = i * 4;

        gTasks[taskId].data[r0] = a[i];
        if (a[i] != 0)
            shared19338[i].unk2_1 = 1;
    }
    return taskId;
}

#ifdef NONMATCHING
void sub_80B0748(u8 taskId)
{
    u8 i;
    u8 r4_2;
    u8 r1;
    u8 r7;

    for (i = 0; i < 4; i++)
    {
        //#define r4 r4_2
        r4 = gUnknown_02038696[i];
        r1 = r4 * 4;
        r7 = gTasks[taskId].data[r1 + 0];

        if (r7 != 0)
        {
            //_080B079C
            u8 r8 = gTasks[taskId].data[r1 + 1];
            u8 r5 = gTasks[taskId].data[r1 + 2];
            u8 r6 = gTasks[taskId].data[r1 + 3];

            if (r7 == 1)
            {
                r6++;
                if (r6 == 1)
                {
                    //_080B07D2
                    r6 = 0;
                    BlendPalette((r4 + 5) * 16 + 1, 3, r5, RGB(31, 31, 31));
                    if (r5 == 0 && r8 == 4)
                    {
                        gTasks[taskId].data[r1 + 0] = 0;
                        //asm("");
                    }
                    //_080B0800
                    else
                    {
                        r5 += 2;
                        if (r5 > 13)
                        {
                            r5 = 0;
                            r8++;
                        }
                    }
                }
                //to _080B08EA
            }
            //_080B0818
            else if (r7 == 2 || r7 == 4)
            {
                r6++;
                if (r6 == 3)
                {
                    r6 = 0;
                    BlendPalette((r4 + 5) * 16 + 1, 3, r5, gUnknown_083CC5A4[r4]);
                    if (r5 == 0 && r8 == 2)
                    {
                        gTasks[taskId].data[r1 + 0] = 0;
                    }
                    //_080B0858
                    else
                    {
                        r5 += 1;
                        if (r5 == 14)
                        {
                            r5 = 0;
                            r8++;
                            if (r7 == 4 && r8 == 1)
                            {
                                BlendPalette((r4 + 9) * 16 + 2, 1, 4, RGB(0, 0, 0));
                                BlendPalette((r4 + 9) * 16 + 5, 1, 4, RGB(0, 0, 0));
                            }
                        }
                    }
                }
                //to _080B08EA
            }
            //_080B0896
            else if (r7 == 3)
            {
                r6++;
                if (r6 == 12)
                {
                    r6 = 0;
                    BlendPalette((r4 + 5) * 16 + 1, 3, r5, RGB(0, 0, 0));
                    r5 += 1;
                    if (r5 == 5)
                    {
                        // What the hell? These aren't pointers.
                        // This code would crash if run.
                        DmaCopy16Defvars(3, (void *)(u32)gPlttBufferFaded[(r4 + 5) * 16 + 1],
                            (void *)(u32)gPlttBufferUnfaded[(r4 + 5) * 16 + 1], 6);
                        gTasks[taskId].data[r1 + 0] = 0;
                    }
                }
            }
            //_080B08EA
            gTasks[taskId].data[r1 + 1] = r8;
            gTasks[taskId].data[r1 + 2] = r5;
            gTasks[taskId].data[r1 + 3] = r6;
        }
        //_080B0910
    }
    //_080B0920

    #define i r4_2
    for (i = 0; i < 4; i++)  // r4 is i
    {
        if (gTasks[taskId].data[i * 4 + 0] != 0)
            break;
    }
    //_080B0958
    if (i == 4)
    {
        for (i = 0; i < 4; i++)
            shared19338[i].unk2_2 = 0;
        DestroyTask(taskId);
    }
    #undef i
}
#else
NAKED
void sub_80B0748(u8 taskId)
{
    asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r10\n\
	mov r6, r9\n\
	mov r5, r8\n\
	push {r5-r7}\n\
	sub sp, 0x20\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	str r0, [sp]\n\
	movs r0, 0\n\
	str r0, [sp, 0x4]\n\
	ldr r2, _080B07F4 @ =gTasks\n\
	movs r1, 0x8\n\
	adds r1, r2\n\
	mov r10, r1\n\
	ldr r3, [sp]\n\
	lsls r3, 2\n\
	str r3, [sp, 0x1C]\n\
	ldr r1, [sp]\n\
	adds r0, r3, r1\n\
	lsls r0, 3\n\
	str r0, [sp, 0xC]\n\
_080B0774:\n\
	ldr r0, _080B07F8 @ =gUnknown_02038696\n\
	ldr r3, [sp, 0x4]\n\
	adds r0, r3, r0\n\
	ldrb r4, [r0]\n\
	lsls r0, r4, 26\n\
	lsrs r1, r0, 24\n\
	lsls r0, r1, 1\n\
	str r0, [sp, 0x8]\n\
	ldr r3, [sp]\n\
	lsls r0, r3, 2\n\
	adds r0, r3\n\
	lsls r6, r0, 3\n\
	ldr r3, [sp, 0x8]\n\
	adds r0, r3, r6\n\
	add r0, r10\n\
	mov r9, r0\n\
	ldrb r7, [r0]\n\
	cmp r7, 0\n\
	bne _080B079C\n\
	b _080B0910\n\
_080B079C:\n\
	adds r3, r1, 0x1\n\
	lsls r0, r3, 1\n\
	adds r0, r6\n\
	add r0, r10\n\
	ldrb r0, [r0]\n\
	mov r8, r0\n\
	adds r2, r1, 0x2\n\
	lsls r0, r2, 1\n\
	adds r0, r6\n\
	add r0, r10\n\
	ldrb r5, [r0]\n\
	adds r1, 0x3\n\
	lsls r0, r1, 1\n\
	adds r0, r6\n\
	add r0, r10\n\
	ldrb r6, [r0]\n\
	str r3, [sp, 0x10]\n\
	str r2, [sp, 0x14]\n\
	str r1, [sp, 0x18]\n\
	cmp r7, 0x1\n\
	bne _080B0818\n\
	adds r0, r6, 0x1\n\
	lsls r0, 24\n\
	lsrs r6, r0, 24\n\
	cmp r6, 0x1\n\
	beq _080B07D2\n\
	b _080B08EA\n\
_080B07D2:\n\
	movs r6, 0\n\
	adds r0, r4, 0x5\n\
	lsls r0, 4\n\
	adds r0, 0x1\n\
	movs r1, 0x3\n\
	adds r2, r5, 0\n\
	ldr r3, _080B07FC @ =0x00007fff\n\
	bl BlendPalette\n\
	cmp r5, 0\n\
	bne _080B0800\n\
	mov r0, r8\n\
	cmp r0, 0x4\n\
	bne _080B0800\n\
	mov r1, r9\n\
	strh r6, [r1]\n\
	b _080B08EA\n\
	.align 2, 0\n\
_080B07F4: .4byte gTasks\n\
_080B07F8: .4byte gUnknown_02038696\n\
_080B07FC: .4byte 0x00007fff\n\
_080B0800:\n\
	adds r0, r5, 0x2\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
	cmp r5, 0xD\n\
	bls _080B08EA\n\
	movs r5, 0\n\
	mov r0, r8\n\
	adds r0, 0x1\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	mov r8, r0\n\
	b _080B08EA\n\
_080B0818:\n\
	cmp r7, 0x2\n\
	beq _080B0820\n\
	cmp r7, 0x4\n\
	bne _080B0896\n\
_080B0820:\n\
	adds r0, r6, 0x1\n\
	lsls r0, 24\n\
	lsrs r6, r0, 24\n\
	cmp r6, 0x3\n\
	bne _080B08EA\n\
	movs r6, 0\n\
	adds r0, r4, 0x5\n\
	lsls r0, 4\n\
	adds r0, 0x1\n\
	ldr r2, _080B0854 @ =gUnknown_083CC5A4\n\
	lsls r1, r4, 1\n\
	adds r1, r2\n\
	ldrh r3, [r1]\n\
	movs r1, 0x3\n\
	adds r2, r5, 0\n\
	bl BlendPalette\n\
	cmp r5, 0\n\
	bne _080B0858\n\
	mov r2, r8\n\
	cmp r2, 0x2\n\
	bne _080B0858\n\
	mov r3, r9\n\
	strh r6, [r3]\n\
	b _080B08EA\n\
	.align 2, 0\n\
_080B0854: .4byte gUnknown_083CC5A4\n\
_080B0858:\n\
	adds r0, r5, 0x1\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
	cmp r5, 0xE\n\
	bne _080B08EA\n\
	movs r5, 0\n\
	mov r0, r8\n\
	adds r0, 0x1\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	mov r8, r0\n\
	cmp r7, 0x4\n\
	bne _080B08EA\n\
	cmp r0, 0x1\n\
	bne _080B08EA\n\
	adds r4, 0x9\n\
	lsls r4, 4\n\
	adds r0, r4, 0x2\n\
	movs r1, 0x1\n\
	movs r2, 0x4\n\
	movs r3, 0\n\
	bl BlendPalette\n\
	adds r4, 0x5\n\
	adds r0, r4, 0\n\
	movs r1, 0x1\n\
	movs r2, 0x4\n\
	movs r3, 0\n\
	bl BlendPalette\n\
	b _080B08EA\n\
_080B0896:\n\
	cmp r7, 0x3\n\
	bne _080B08EA\n\
	adds r0, r6, 0x1\n\
	lsls r0, 24\n\
	lsrs r6, r0, 24\n\
	cmp r6, 0xC\n\
	bne _080B08EA\n\
	movs r6, 0\n\
	adds r0, r4, 0x5\n\
	lsls r0, 4\n\
	adds r4, r0, 0x1\n\
	adds r0, r4, 0\n\
	movs r1, 0x3\n\
	adds r2, r5, 0\n\
	movs r3, 0\n\
	bl BlendPalette\n\
	adds r0, r5, 0x1\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
	cmp r5, 0x5\n\
	bne _080B08EA\n\
	ldr r0, _080B0930 @ =gPlttBufferFaded\n\
	lsls r1, r4, 1\n\
	adds r0, r1, r0\n\
	ldrh r2, [r0]\n\
	ldr r0, _080B0934 @ =gPlttBufferUnfaded\n\
	adds r1, r0\n\
	ldrh r0, [r1]\n\
	ldr r1, _080B0938 @ =0x040000d4\n\
	str r2, [r1]\n\
	str r0, [r1, 0x4]\n\
	movs r0, 0x80\n\
	lsls r0, 24\n\
	orrs r7, r0\n\
	str r7, [r1, 0x8]\n\
	ldr r0, [r1, 0x8]\n\
	ldr r1, [sp, 0x8]\n\
	ldr r2, [sp, 0xC]\n\
	adds r0, r1, r2\n\
	add r0, r10\n\
	strh r6, [r0]\n\
_080B08EA:\n\
	ldr r3, [sp, 0x10]\n\
	lsls r0, r3, 1\n\
	ldr r1, [sp, 0xC]\n\
	adds r0, r1\n\
	add r0, r10\n\
	mov r2, r8\n\
	strh r2, [r0]\n\
	ldr r3, [sp, 0x14]\n\
	lsls r0, r3, 1\n\
	adds r0, r1\n\
	add r0, r10\n\
	strh r5, [r0]\n\
	ldr r1, [sp, 0x18]\n\
	lsls r0, r1, 1\n\
	ldr r2, [sp, 0xC]\n\
	adds r0, r2\n\
	add r0, r10\n\
	strh r6, [r0]\n\
	ldr r2, _080B093C @ =gTasks\n\
_080B0910:\n\
	ldr r0, [sp, 0x4]\n\
	adds r0, 0x1\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	str r0, [sp, 0x4]\n\
	cmp r0, 0x3\n\
	bhi _080B0920\n\
	b _080B0774\n\
_080B0920:\n\
	movs r4, 0\n\
	ldr r3, [sp, 0x1C]\n\
	ldr r1, [sp]\n\
	adds r0, r3, r1\n\
	lsls r1, r0, 3\n\
	adds r2, 0x8\n\
	adds r0, r1, r2\n\
	b _080B0950\n\
	.align 2, 0\n\
_080B0930: .4byte gPlttBufferFaded\n\
_080B0934: .4byte gPlttBufferUnfaded\n\
_080B0938: .4byte 0x040000d4\n\
_080B093C: .4byte gTasks\n\
_080B0940:\n\
	adds r0, r4, 0x1\n\
	lsls r0, 24\n\
	lsrs r4, r0, 24\n\
	cmp r4, 0x3\n\
	bhi _080B0958\n\
	lsls r0, r4, 3\n\
	adds r0, r1\n\
	adds r0, r2\n\
_080B0950:\n\
	movs r3, 0\n\
	ldrsh r0, [r0, r3]\n\
	cmp r0, 0\n\
	beq _080B0940\n\
_080B0958:\n\
	cmp r4, 0x4\n\
	bne _080B0980\n\
	movs r4, 0\n\
	ldr r3, _080B0990 @ =gSharedMem + 0x19338\n\
	movs r5, 0x3\n\
	negs r5, r5\n\
_080B0964:\n\
	lsls r1, r4, 2\n\
	adds r1, r3\n\
	ldrb r2, [r1, 0x2]\n\
	adds r0, r5, 0\n\
	ands r0, r2\n\
	strb r0, [r1, 0x2]\n\
	adds r0, r4, 0x1\n\
	lsls r0, 24\n\
	lsrs r4, r0, 24\n\
	cmp r4, 0x3\n\
	bls _080B0964\n\
	ldr r0, [sp]\n\
	bl DestroyTask\n\
_080B0980:\n\
	add sp, 0x20\n\
	pop {r3-r5}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	mov r10, r5\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080B0990: .4byte gSharedMem + 0x19338\n\
    .syntax divided\n");
}
#endif

void unref_sub_80B0994(u8 a)
{
    if (a != 0)
        sContest.unk1920A_2 = 1;
}

void sub_80B09B0(u8 a)
{
    if (sContestantStatus[a].hasJudgesAttention)
        sub_80B0368(a);
    else
        sub_80B03A8(a);
}

extern const struct CompressedSpriteSheet gUnknown_083CC4B4[];
extern const struct SpritePalette gUnknown_083CC4D4[];
extern const struct SpriteTemplate gSpriteTemplate_83CC53C[];

u8 sub_80B09E4(u8 a)
{
    u8 r5 = gUnknown_02038696[a] * 40 + 32;
    u8 r8;
    u8 r6;
    volatile u8 zero;

    LoadCompressedObjectPic(&gUnknown_083CC4B4[a]);
    LoadSpritePalette(&gUnknown_083CC4D4[a]);
    r8 = CreateSprite(&gSpriteTemplate_83CC53C[a], 184, r5, 29);
    r6 = CreateSprite(&gSpriteTemplate_83CC53C[a], 248, r5, 29);
    gSprites[r6].oam.tileNum += 64;

    CopySpriteTiles(0, 3, (void *)VRAM, (u16 *)(VRAM + 0xE000 + gUnknown_02038696[a] * 5 * 64 + 0x26), (u8 *)(VRAM + 0x10000 + gSprites[r8].oam.tileNum * 32));
    CopySpriteTiles(0, 3, (void *)VRAM, (u16 *)(VRAM + 0xE000 + gUnknown_02038696[a] * 5 * 64 + 0x36), (u8 *)(VRAM + 0x10000 + gSprites[r6].oam.tileNum * 32));

    DmaFill32Defvars(3, 0, (void *)(VRAM + 0x10000 + (0x28 + gSprites[r8].oam.tileNum) * 32), 0x300);

    // What is this?
    zero = 0;
    zero = 0;

    DmaFill32Defvars(3, 0, (void *)(VRAM + 0x10000 + (0x28 + gSprites[r6].oam.tileNum) * 32), 0x300);

    gSprites[r8].data[0] = r6;
    gSprites[r6].data[0] = r8;
    gSprites[r8].data[1] = a;
    gSprites[r6].data[1] = a;
    return r8;
}

void sub_80B0B5C(u8 spriteId)
{
    u8 spriteId2 = gSprites[spriteId].data[0];

    FreeSpriteOamMatrix(&gSprites[spriteId2]);
    DestroySprite(&gSprites[spriteId2]);
    DestroySpriteAndFreeResources(&gSprites[spriteId]);
}

void sub_80B0B98(void)
{
    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = 0x0907;
}

void sub_80B0BB4(void)
{
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
}

void sub_80B0BC4(u8 a, bool8 b)
{
    u8 r5;

    sub_80B0B98();
    shared19338[gSprites[a].data[1]].unk2_1 = 1;
    r5 = gSprites[a].data[0];
    StartSpriteAffineAnim(&gSprites[a], 1);
    StartSpriteAffineAnim(&gSprites[r5], 1);
    gSprites[a].callback = sub_80B0C5C;
    gSprites[r5].callback = SpriteCallbackDummy;
    if (b == FALSE)
        PlaySE(SE_C_PIKON);
    else
        PlaySE(SE_PC_LOGON);
}

void sub_80B0C5C(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
    {
        u8 r1 = sprite->data[0];

        if (gSprites[r1].affineAnimEnded)
        {
            sprite->invisible = TRUE;
            gSprites[r1].invisible = TRUE;
            sprite->callback = sub_80B0CB0;
        }
    }
}

void sub_80B0CB0(struct Sprite *sprite)
{
    shared19338[sprite->data[1]].unk2_1 = 0;
    sub_80B0B5C(sprite->data[0]);
    sub_80B0BB4();
}

void sub_80B0CDC(u8 a, int unused)
{
    shared19338[a].unk2_1 = 0;
}

void unref_sub_80B0CF4(void)
{
    //shared18000.unk18000 ^= 1;
    gSharedMem[0x18000] ^= 1;
    //if (shared18000.unk18000 == 0)
    if (gSharedMem[0x18000] == 0)
    {
        u8 i;

        for (i = 0; i < 4; i++)
        {
            Text_FillWindowRectDefPalette(
              &gUnknown_03004210,
              0,
              gUnknown_083CA308[i][0],
              gUnknown_083CA308[i][1],
              gUnknown_083CA310[i][0] + 5,
              gUnknown_083CA310[i][1] + 1);
        }
        sub_80AE514();
        sub_80AEB30();
    }
    else
    {
        sub_80B0D7C();
    }
}

void sub_80B0D7C(void)
{
    u8 r5 = 0;
    u8 sp8[8];

    if (gSharedMem[0x18000] != 0)
    {
        u8 i;
        s16 r2;

        for (i = 0; i < 4; i++)
        {
            Text_FillWindowRectDefPalette(
              &gUnknown_03004210,
              0,
              gUnknown_083CA308[i][0],
              gUnknown_083CA308[i][1],
              gUnknown_083CA310[i][0] + 5,
              gUnknown_083CA310[i][1] + 1);
        }
        for (i = 0; i < 4; i++)
        {
            r2 = sContestantStatus[i].unk4;
            if (r2 < 0)
            {
                r2 = -r2;
                sp8[0] = CHAR_HYPHEN;
                r5++;
            }
            ConvertIntToDecimalStringN(sp8 + r5, r2, 0, 4);
            Text_InitWindowAndPrintText(
              &gUnknown_03004210,
              sp8,
              592 + gUnknown_02038696[i] * 22,
              gUnknown_083CA310[gUnknown_02038696[i]][0],
              gUnknown_083CA310[gUnknown_02038696[i]][1]);
            r5 = 0;
        }
        for (i = 0; i < 4; i++)
        {
            r2 = sContestantStatus[i].appeal2;
            if (r2 < 0)
            {
                r2 = -r2;
                sp8[0] = CHAR_HYPHEN;
                r5++;
            }
            ConvertIntToDecimalStringN(sp8 + r5, r2, 0, 4);
            Text_InitWindowAndPrintText(
              &gUnknown_03004210,
              sp8,
              512 + gUnknown_02038696[i] * 20,
              gUnknown_083CA308[gUnknown_02038696[i]][0],
              gUnknown_083CA308[gUnknown_02038696[i]][1]);
            r5 = 0;
        }
        sub_80AEB30();
    }
}

void unref_sub_80B0EE8(s32 *a, s32 b)
{
    s32 i;
    s32 j;

    for (i = 0; i < b - 1; i++)
    {
        for (j = b - 1; j > i; j--)
        {
            if (a[j - 1] > a[j])
            {
                s32 temp = a[j];

                a[j] = a[j - 1];
                a[j - 1] = temp;
            }
        }
    }
}

// something to do with contest NPC opponents, I think.
void sub_80B0F28(u8 a)
{
    u8 sp0[4];
    u16 sp4[4] = {0};
    s32 i;
    s32 r2;
    s32 r4;

    for (i = 0; i < 4; i++)
    {
        sp4[i] = Random();
        for (r2 = 0; r2 < i; r2++)
        {
            if (sp4[i] == sp4[r2])
            {
                i--;
                break;
            }
        }
    }

    if (a == 0)
    {
        for (i = 0; i < 4; i++)
        {
            gUnknown_02038696[i] = i;
            for (r4 = 0; r4 < i; r4++)
            {
                if (gUnknown_02038670[gUnknown_02038696[r4]] < gUnknown_02038670[i]
                 || (gUnknown_02038670[gUnknown_02038696[r4]] == gUnknown_02038670[i] && sp4[gUnknown_02038696[r4]] < sp4[i]))
                {
                    for (r2 = i; r2 > r4; r2--)
                        gUnknown_02038696[r2] = gUnknown_02038696[r2 - 1];
                    gUnknown_02038696[r4] = i;
                    break;
                }
            }
            if (r4 == i)
                gUnknown_02038696[i] = i;
        }
        memcpy(sp0, gUnknown_02038696, sizeof(sp0));
        for (i = 0; i < 4; i++)
            gUnknown_02038696[sp0[i]] = i;
    }
    else
    {
        memset(sp0, 0xFF, sizeof(sp0));
        for (i = 0; i < 4; i++)
        {
            u8 r2 = sContestantStatus[i].unkB_0;

            while (1)
            {
                u8 *ptr = &sp0[r2];
                if (*ptr == 0xFF)
                {
                    *ptr = i;
                    gUnknown_02038696[i] = r2;
                    break;
                }
                r2++;
            }
        }
        for (i = 0; i < 3; i++)
        {
            for (r4 = 3; r4 > i; r4--)
            {
                if (sContestantStatus[r4 - 1].unkB_0 == sContestantStatus[r4].unkB_0
                 && gUnknown_02038696[r4 - 1] < gUnknown_02038696[r4]
                 && sp4[r4 - 1] < sp4[r4])
                {
                    u8 temp = gUnknown_02038696[r4];

                    gUnknown_02038696[r4] = gUnknown_02038696[r4 - 1];
                    gUnknown_02038696[r4 - 1] = temp;
                }
            }
        }
    }
}

void sub_80B1118(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        //LoadPalette(shared18000.unk18004[5 + i], (gUnknown_02038696[i] + 5) * 16, 32);
        LoadPalette(shared18004 + (i + 5) * 16, (gUnknown_02038696[i] + 5) * 16, 32);
    }
    sub_80AE514();
}

void sub_80B114C(u8 contestant)
{
    bool8 r8;
    s32 i;

    sContestantStatus[contestant].appeal2 = 0;
    sContestantStatus[contestant].appeal1 = 0;
    r8 = sub_80AF404(contestant);
    if (r8)
    {
        u16 move = sContestantStatus[contestant].currMove;
        u8 effect = gContestMoves[move].effect;
        u8 rnd;

        sContestantStatus[contestant].moveCategory = gContestMoves[sContestantStatus[contestant].currMove].contestCategory;
        if (sContestantStatus[contestant].currMove == sContestantStatus[contestant].prevMove && sContestantStatus[contestant].currMove != MOVE_NONE)
        {
            sContestantStatus[contestant].disappointedRepeat = TRUE;
            sContestantStatus[contestant].moveRepeatCount++;
        }
        else
        {
            sContestantStatus[contestant].moveRepeatCount = 0;
        }
        sContestantStatus[contestant].appeal1 = gContestEffects[effect].appeal;
        sContestantStatus[contestant].appeal2 = gContestEffects[effect].appeal;
        shared192D0.jam = gContestEffects[effect].jam;
        shared192D0.jam2 = gContestEffects[effect].jam;
        shared192D0.contestant = contestant;
        for (i = 0; i < 4; i++)
        {
            sContestantStatus[i].jam = 0;
            shared192D0.unnervedPokes[i] = 0;
        }
        if (sContestantStatus[contestant].hasJudgesAttention && AreMovesContestCombo(sContestantStatus[contestant].prevMove, sContestantStatus[contestant].currMove) == 0)
            sContestantStatus[contestant].hasJudgesAttention = 0;
        gContestEffectFuncs[effect]();
        if (sContestantStatus[contestant].conditionMod == 1)
            sContestantStatus[contestant].appeal2 += sContestantStatus[contestant].condition - 10;
        else if (sContestantStatus[contestant].appealTripleCondition)
            sContestantStatus[contestant].appeal2 += sContestantStatus[contestant].condition * 3;
        else
            sContestantStatus[contestant].appeal2 += sContestantStatus[contestant].condition;
        sContestantStatus[contestant].unk16 = 0;
        sContestantStatus[contestant].unk15_6 = 0;
        if (sub_80B214C(contestant))
        {
            u8 r2 = AreMovesContestCombo(sContestantStatus[contestant].prevMove, sContestantStatus[contestant].currMove);

            if (r2 != 0 && sContestantStatus[contestant].hasJudgesAttention)
            {
                sContestantStatus[contestant].unk16 = r2;
                sContestantStatus[contestant].unk15_6 = 1;
                sContestantStatus[contestant].hasJudgesAttention = 0;
                sContestantStatus[contestant].unk17 = sContestantStatus[contestant].appeal1 * sContestantStatus[contestant].unk16;
                sContestantStatus[contestant].unk15_3 = 1;
            }
            else
            {
                if (gContestMoves[sContestantStatus[contestant].currMove].comboStarterId != 0)
                {
                    sContestantStatus[contestant].hasJudgesAttention = 1;
                    sContestantStatus[contestant].unk15_6 = 1;
                }
                else
                {
                    sContestantStatus[contestant].hasJudgesAttention = 0;
                }
            }
        }
        if (sContestantStatus[contestant].disappointedRepeat)
            sContestantStatus[contestant].unk18 = (sContestantStatus[contestant].moveRepeatCount + 1) * 10;
        if (sContestantStatus[contestant].nervous)
        {
            sContestantStatus[contestant].hasJudgesAttention = 0;
            sContestantStatus[contestant].appeal2 = 0;
            sContestantStatus[contestant].appeal1 = 0;
        }
        shared19328.bits_0 = Contest_GetMoveExcitement(sContestantStatus[contestant].currMove);
        if (sContestantStatus[contestant].overrideCategoryExcitementMod)
            shared19328.bits_0 = 1;
        if (shared19328.bits_0 > 0)
        {
            if (sContest.applauseLevel + shared19328.bits_0 > 4)
                shared19328.unk2 = 60;
            else
                shared19328.unk2 = 10;
        }
        else
        {
            shared19328.unk2 = 0;
        }

        rnd = Random() % 3;
        for (i = 0; i < 4; i++)
        {
            if (i != contestant)
            {
                if (rnd == 0)
                    break;
                rnd--;
            }
        }
        sContestantStatus[contestant].unk1B = i;
    }
}

void SetContestantEffectStringID(u8 a, u8 b)
{
    sContestantStatus[a].effectStringId = b;
}

void SetContestantEffectStringID2(u8 a, u8 b)
{
    sContestantStatus[a].effectStringId2 = b;
}

void SetStartledString(u8 contestant, u8 jam)
{
    if      (jam >= 60)
        SetContestantEffectStringID(contestant, CONTEST_STRING_TRIPPED_OVER);
    else if (jam >= 40)
        SetContestantEffectStringID(contestant, CONTEST_STRING_LEAPT_UP);
    else if (jam >= 30)
        SetContestantEffectStringID(contestant, CONTEST_STRING_UTTER_CRY);
    else if (jam >= 20)
        SetContestantEffectStringID(contestant, CONTEST_STRING_TURNED_BACK);
    else if (jam >= 10)
        SetContestantEffectStringID(contestant, CONTEST_STRING_LOOKED_DOWN);
}

void sub_80B146C(u8 contestant, u8 stringId)
{
    StringCopy(gStringVar1, gContestMons[contestant].nickname);
    StringCopy(gStringVar2, gMoveNames[sContestantStatus[contestant].currMove]);
    if      (gContestMoves[sContestantStatus[shared192D0.contestant].currMove].contestCategory == CONTEST_CATEGORY_COOL)
        StringCopy(gStringVar3, gText_Contest_Shyness);
    else if (gContestMoves[sContestantStatus[shared192D0.contestant].currMove].contestCategory == CONTEST_CATEGORY_BEAUTY)
        StringCopy(gStringVar3, gText_Contest_Anxiety);
    else if (gContestMoves[sContestantStatus[shared192D0.contestant].currMove].contestCategory == CONTEST_CATEGORY_CUTE)
        StringCopy(gStringVar3, gText_Contest_Laziness);
    else if (gContestMoves[sContestantStatus[shared192D0.contestant].currMove].contestCategory == CONTEST_CATEGORY_SMART)
        StringCopy(gStringVar3, gText_Contest_Hesitancy);
    else
        StringCopy(gStringVar3, gText_Contest_Fear);
    StringExpandPlaceholders(gStringVar4, gUnknown_083CC188[stringId]);
    sub_80AF138();
    Text_InitWindow8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
}

void MakeContestantNervous(u8 p)
{
    sContestantStatus[p].nervous = 1;
    sContestantStatus[p].currMove = MOVE_NONE;
}

// Determines turn order?
void sub_80B159C(void)
{
    u8 r12 = 0;
    s32 i;
    s32 j;
    u8 sp0[4];
    u8 sp4[4];

    for (i = 0; i < 4; i++)
    {
        sp0[i] = gUnknown_02038696[i];
        sp4[i] = 0;
    }

    for (i = 0; i < 4; i++)
    {
        for (j = 0; j < 4; j++)
        {
            if (sContestantStatus[j].nextTurnOrder == i)
            {
                sp0[j] = i;
                sp4[j] = 1;
                break;
            }
        }
        if (j == 4)
        {
            for (j = 0; j < 4; j++)
            {
                if (sp4[j] == 0 && sContestantStatus[j].nextTurnOrder == 0xFF)
                {
                    r12 = j;
                    j++;
                    break;
                }
            }
            for (; j < 4; j++)
            {
                if (sp4[j] == 0 && sContestantStatus[j].nextTurnOrder == 0xFF
                 && gUnknown_02038696[r12] > gUnknown_02038696[j])
                    r12 = j;
            }
            sp0[r12] = i;
            sp4[r12] = 1;
        }
    }

    for (i = 0; i < 4; i++)
    {
        shared192D0.turnOrder[i] = sp0[i];
        sContestantStatus[i].nextTurnOrder = 0xFF;
        sContestantStatus[i].turnOrderMod = 0;
        gUnknown_02038696[i] = sp0[i];
    }
}

void sub_80B16D0(struct Sprite *sprite)
{
    if (sprite->data[1]++ > 84)
    {
        sprite->data[1] = 0;
        sprite->invisible = TRUE;
        sprite->callback = SpriteCallbackDummy;
        sContest.unk1920A_4 = 0;
    }
}

void sub_80B1710(u8 a)
{
    u8 spriteId = sContest.unk19216;

    switch (a)
    {
    case 0:
    case 1:
        gSprites[spriteId].oam.tileNum = gSprites[spriteId].data[0];
        PlaySE(SE_HAZURE);
        break;
    case 2:
        gSprites[spriteId].oam.tileNum = gSprites[spriteId].data[0] + 4;
        PlaySE(SE_SEIKAI);
        break;
    case 3:
        gSprites[spriteId].oam.tileNum = gSprites[spriteId].data[0] + 8;
        PlaySE(SE_SEIKAI);
        break;
    case 4:
        gSprites[spriteId].oam.tileNum = gSprites[spriteId].data[0] + 12;
        PlaySE(SE_TK_WARPIN);
        break;
    case 5:  // exactly the same as case 4
        gSprites[spriteId].oam.tileNum = gSprites[spriteId].data[0] + 12;
        PlaySE(SE_TK_WARPIN);
        break;
    case 6:
        gSprites[spriteId].oam.tileNum = gSprites[spriteId].data[0] + 16;
        PlaySE(SE_TK_WARPIN);
        break;
    case 8:
        gSprites[spriteId].oam.tileNum = gSprites[spriteId].data[0] + 24;
        PlaySE(SE_W215);
        break;
    case 7:
    default:
        gSprites[spriteId].oam.tileNum = gSprites[spriteId].data[0] + 20;
        PlaySE(SE_TK_WARPIN);
        break;
    }
    gSprites[spriteId].data[1] = 0;
    gSprites[spriteId].invisible = FALSE;
    gSprites[spriteId].callback = sub_80B16D0;
    sContest.unk1920A_4 = 1;
}

void sub_80B1928(void)
{
    s32 i;

    for (i = 0; i < 5; i++)
    {
        const u8 *src;

        if (i < sContest.applauseLevel)
            src = gContestApplauseMeterGfx + 64;
        else
            src = gContestApplauseMeterGfx;
        CpuCopy32(src,      (void *)(VRAM + 0x10000 + (gSprites[sContest.applauseMeterSpriteId].oam.tileNum + 17 + i) * 32), 32);
        CpuCopy32(src + 32, (void *)(VRAM + 0x10000 + (gSprites[sContest.applauseMeterSpriteId].oam.tileNum + 25 + i) * 32), 32);
        if (sContest.applauseLevel > 4)
            sub_80B1A2C();
    }
}

void unref_sub_80B19D0(void)
{
    u8 str[20];
    StringCopy(str, gUnknown_083CC2EC);
    Text_InitWindowAndPrintText(&gUnknown_03004210, str, 680, 0, 0);
}

s8 Contest_GetMoveExcitement(u16 move)
{
    return gContestExcitementTable[gSpecialVar_ContestCategory][gContestMoves[move].contestCategory];
}

// Launches crowd movement task, maybe
u8 sub_80B1A2C(void)
{
    u8 taskId = CreateTask(c3_08130B10, 10);

    gTasks[taskId].data[1] = 1;
    gTasks[taskId].data[2] = IndexOfSpritePaletteTag(0x0ABE2);
    return taskId;
}

void c3_08130B10(u8 taskId)
{
    if (++gTasks[taskId].data[0] == 1)
    {
        gTasks[taskId].data[0] = 0;
        if (gTasks[taskId].data[3] == 0)
            gTasks[taskId].data[4]++;
        else
            gTasks[taskId].data[4]--;
        BlendPalette(264 + gTasks[taskId].data[2] * 16, 1, gTasks[taskId].data[4], RGB(31, 31, 31));
        if (gTasks[taskId].data[4] == 0 || gTasks[taskId].data[4] == 16)
        {
            gTasks[taskId].data[3] ^= 1;
            if (sContest.applauseLevel < 5)
            {
                BlendPalette(264 + gTasks[taskId].data[2] * 16, 1, 0, RGB(31, 0, 0));
                DestroyTask(taskId);
            }
        }
    }
}

void sub_80B1B14(void)
{
    CreateTask(sub_80B1B68, 10);
    gSprites[sContest.applauseMeterSpriteId].pos2.x = -70;
    gSprites[sContest.applauseMeterSpriteId].invisible = FALSE;
    sContest.unk1920A_6 = 1;
}

void sub_80B1B68(u8 taskId)
{
    struct Sprite *sprite = &gSprites[sContest.applauseMeterSpriteId];

    gTasks[taskId].data[10] += 1664;
    sprite->pos2.x += gTasks[taskId].data[10] >> 8;
    gTasks[taskId].data[10] = gTasks[taskId].data[10] & 0xFF;
    if (sprite->pos2.x > 0)
        sprite->pos2.x = 0;
    if (sprite->pos2.x == 0)
    {
        sContest.unk1920A_6 = 0;
        DestroyTask(taskId);
    }
}

void sub_80B1BDC(void)
{
    if (gSprites[sContest.applauseMeterSpriteId].invisible == TRUE)
    {
        sContest.unk1920A_6 = 0;
    }
    else
    {
        CreateTask(sub_80B1C34, 10);
        gSprites[sContest.applauseMeterSpriteId].pos2.x = 0;
        sContest.unk1920A_6 = 1;
    }
}

void sub_80B1C34(u8 taskId)
{
    struct Sprite *sprite = &gSprites[sContest.applauseMeterSpriteId];

    gTasks[taskId].data[10] += 1664;
    sprite->pos2.x -= gTasks[taskId].data[10] >> 8;
    gTasks[taskId].data[10] = gTasks[taskId].data[10] & 0xFF;
    if (sprite->pos2.x < -70)
        sprite->pos2.x = -70;
    if (sprite->pos2.x == -70)
    {
        sprite->invisible = TRUE;
        sContest.unk1920A_6 = 0;
        DestroyTask(taskId);
    }
}

void sub_80B1CBC(s8 a)
{
    u8 taskId = CreateTask(sub_80B1CFC, 5);

    gTasks[taskId].data[0] = a;
    sContest.unk1920A_5 = 1;
}

void sub_80B1CFC(u8 taskId)
{
    switch (gTasks[taskId].data[10])
    {
    case 0:
        sub_80B1B14();
        gTasks[taskId].data[10]++;
        break;
    case 1:
        if (!sContest.unk1920A_6)
        {
            nullsub_18(gTasks[taskId].data[0]);
            gTasks[taskId].data[10]++;
        }
        break;
    case 2:
        if (gTasks[taskId].data[11]++ > 20)
        {
            gTasks[taskId].data[11] = 0;
            sub_80B1928();
            sContest.unk1920A_5 = 0;
            DestroyTask(taskId);
        }
        break;
    }
}

void unref_sub_80B1D84(void)
{
    gSprites[sContest.applauseMeterSpriteId].pos2.x = 0;
    gSprites[sContest.applauseMeterSpriteId].invisible = FALSE;
}

void unref_sub_80B1DB8(void)
{
    gSprites[sContest.applauseMeterSpriteId].invisible = TRUE;
}

void sub_80B1DDC(void)
{
    CreateTask(sub_80B1DFC, 15);
    sContest.unk1920A_7 = 1;
}

void sub_80B1DFC(u8 taskId)
{
    if (gTasks[taskId].data[10]++ > 6)
    {
        register struct Task *task asm("r0");
        register u32 r4 asm("r4") = taskId * 4;

        gTasks[taskId].data[10] = 0;
        if (gTasks[taskId].data[11] == 0)
        {
            DmaCopy32Defvars(3, shared16800, (void *)(VRAM + 0x2000), 0x1000);
        }
        else
        {
            DmaCopy32Defvars(3, shared15800, (void *)(VRAM + 0x2000), 0x1000);
            gTasks[taskId].data[12]++;
        }

        // Why won't this match the normal way?
        asm("add %0, %1, #0\n\t"
            "add %0, %3\n\t"
            "lsl %0, #3\n\t"
            "add %0, %2\n\t"
            : "=r"(task):"r"(r4),"r"(gTasks),"r"(taskId));

        //gTasks[taskId].data[11] ^= 1;
        task->data[11] ^= 1;

        //if (gTasks[taskId].data[12] == 9)
        if (task->data[12] == 9)
        {
            sContest.unk1920A_7 = 0;
            DestroyTask(taskId);
        }
    }
}

#define tBlendColor data[0]
#define tBlendCoeff data[1]

void sub_80B1EA8(s8 a, s8 b)
{
    u8 taskId = CreateTask(sub_80B1F4C, 10);
    u16 blendColor;
    u8 blendCoeff;
    u8 r3;

    if (a > 0)
    {
        blendColor = RGB(30, 27, 8);
        if (b > 0)
        {
            blendCoeff = 0;
            r3 = sContest.applauseLevel * 3;
        }
        else
        {
            blendCoeff = sContest.applauseLevel * 3;
            r3 = 0;
        }
    }
    else
    {
        blendColor = 0;
        if (b > 0)
        {
            blendCoeff = 0;
            r3 = 12;
        }
        else
        {
            blendCoeff = 12;
            r3 = 0;
        }
    }
    gTasks[taskId].tBlendColor = blendColor;
    gTasks[taskId].tBlendCoeff = blendCoeff;
    gTasks[taskId].data[2] = b;
    gTasks[taskId].data[3] = r3;
    sContest.unk1920B_0 = 0;
}

void sub_80B1F4C(u8 taskId)
{
    if (gTasks[taskId].data[10]++ >= 0)
    {
        gTasks[taskId].data[10] = 0;
        if (gTasks[taskId].data[2] > 0)
            gTasks[taskId].tBlendCoeff++;
        else
            gTasks[taskId].tBlendCoeff--;
        BlendPalette(17, 1, gTasks[taskId].tBlendCoeff, gTasks[taskId].tBlendColor);
        BlendPalette(26, 1, gTasks[taskId].tBlendCoeff, gTasks[taskId].tBlendColor);
        if (gTasks[taskId].tBlendCoeff == gTasks[taskId].data[3])
        {
            DestroyTask(taskId);
            sContest.unk1920B_0 = 0;
        }
    }
}

#undef tBlendColor
#undef tBlendCoeff

void sub_80B1FD0(bool8 a)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        if (sContestantStatus[i].turnOrderMod != 0 && a)
        {
            CpuCopy32(
              GetTurnOrderNumberGfx(i),
              (void *)(VRAM + 0x10000 + (gSprites[shared19338[i].unk1].oam.tileNum + 5) * 32),
              64);
            gSprites[shared19338[i].unk1].pos1.y = gUnknown_083CA33C[gUnknown_02038696[i]];
            gSprites[shared19338[i].unk1].invisible = FALSE;
        }
        else
        {
            gSprites[shared19338[i].unk1].invisible = TRUE;
        }
    }
}

const u8 *GetTurnOrderNumberGfx(u8 contestant)
{
    if (sContestantStatus[contestant].turnOrderMod != 1)
        return gContestNextTurnRandomGfx;
    else
        return gContestNextTurnNumbersGfx + sContestantStatus[contestant].nextTurnOrder * 64;
}

void sub_80B20C4(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        if (shared192D0.unnervedPokes[i] != 0 && !Contest_IsMonsTurnDisabled(i))
        {
            u8 r4 = gUnknown_02038696[i] * 5 + 2;
            u16 r0 = sub_80AEFE8(i, 3);

            *(u16 *)(VRAM + 0xC000 + r4 * 64 + 0x28) = r0;
            *(u16 *)(VRAM + 0xC000 + r4 * 64 + 0x2A) = r0 + 1;
            *(u16 *)(VRAM + 0xC000 + (r4 + 1) * 64 + 0x28) = r0 + 16;
            *(u16 *)(VRAM + 0xC000 + (r4 + 1) * 64 + 0x2A) = r0 + 17;
            PlaySE(SE_C_PASI);
        }
    }
}

bool8 sub_80B214C(u8 a)
{
    if (sContestantStatus[a].disappointedRepeat || sContestantStatus[a].nervous)
        return FALSE;
    else
        return TRUE;
}

void sub_80B2184(void)
{
    s32 i;

    ((vBgCnt *)&REG_BG1CNT)->priority = 0;
    ((vBgCnt *)&REG_BG1CNT)->screenSize = 1;
    ((vBgCnt *)&REG_BG1CNT)->areaOverflowMode = 0;

    gBattle_BG1_X = DISPLAY_WIDTH;
    gBattle_BG1_Y = DISPLAY_HEIGHT;
    REG_BG1HOFS = DISPLAY_WIDTH;
    REG_BG1VOFS = DISPLAY_HEIGHT;

    DmaClear32(3, (void *)(VRAM + 0xF000), 0x1000);
    LZDecompressVram(gUnknown_08D17C3C, (void *)(VRAM + 0xF000));

    ((vBgCnt *)&REG_BG1CNT)->charBaseBlock = 0;

    for (i = 0; i < 4; i++)
    {
        gSprites[shared19338[i].unk0].oam.priority = 1;
        gSprites[shared19338[i].unk1].oam.priority = 1;
    }

    ((vBgCnt *)&REG_BG2CNT)->priority = 1;
    ((vBgCnt *)&REG_BG0CNT)->priority = 1;
    ((vBgCnt *)&REG_BG1CNT)->screenSize = 2;
}

void sub_80B2280(void)
{
    s32 i;

    DmaClearLarge32(3, (void *)(VRAM + 0x8000), 0x2000, 0x1000);
    DmaClear32(3, (void *)(VRAM + 0xF000), 0x1000);

    gBattle_BG1_X = 0;
    gBattle_BG1_Y = 0;

    ((vBgCnt *)&REG_BG1CNT)->priority = 1;
    ((vBgCnt *)&REG_BG1CNT)->screenSize = 0;
    ((vBgCnt *)&REG_BG1CNT)->areaOverflowMode = 0;
    ((vBgCnt *)&REG_BG1CNT)->charBaseBlock = 2;

    for (i = 0; i < 4; i++)
    {
        gSprites[shared19338[i].unk0].oam.priority = 0;
        gSprites[shared19338[i].unk1].oam.priority = 0;
    }
}

void sub_80B237C(u8 taskId)
{
    gBattle_BG1_X = 0;
    gBattle_BG1_Y = DISPLAY_HEIGHT;
    PlaySE12WithPanning(SE_C_MAKU_D, 0);
    gTasks[taskId].func = sub_80B23BC;
}

void sub_80B23BC(u8 taskId)
{
    if ((s16)(gBattle_BG1_Y -= 7) < 0)
        gBattle_BG1_Y = 0;
    if (gBattle_BG1_Y == 0)  // Why cast?
    {
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].data[2] = 0;
        gTasks[taskId].func = sub_80B2400;
    }
}

void sub_80B2400(u8 taskId)
{
    s32 i;

    switch (gTasks[taskId].data[0])
    {
    case 0:
        for (i = 0; i < 4; i++)
            sContest.unk19218[i] = gUnknown_02038696[i];
        sub_80AFA5C();
        sub_80B0588();
        sub_80AEF50();
        sub_80B1118();
        sub_80B1FD0(TRUE);
        sub_80AFFA0();
        gTasks[taskId].data[0] = 1;
        break;
    case 1:
        if (gIsLinkContest & 1)
        {
            u8 taskId2;

            sContest.unk1920B_2 = 1;
            if (sub_80AE074())
                sub_80AF438();
            taskId2 = CreateTask(sub_80C8C80, 0);
            SetTaskFuncWithFollowupFunc(taskId2, sub_80C8C80, sub_80AD8DC);
            sub_80AF860();
            gTasks[taskId].data[0] = 2;
        }
        else
        {
            sub_80AF438();
            gTasks[taskId].data[0] = 3;
        }
        break;
    case 2:
        if (!sContest.unk1920B_2)
            gTasks[taskId].data[0] = 3;
        break;
    case 3:
        sub_80AF120();
        sub_80AEB30();
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = sub_80B253C;
        break;
    }
}

void sub_80B2508(u8 taskId)
{
    if ((s16)(gBattle_BG1_Y += 7) > DISPLAY_HEIGHT)
        gTasks[taskId].func = sub_80ADCDC;
}

void sub_80B253C(u8 taskId)
{
    if (gTasks[taskId].data[2] < 10)
    {
        gTasks[taskId].data[2]++;
    }
    else
    {
        if (gTasks[taskId].data[1] == 0)
        {
            if (gTasks[taskId].data[0] == 16)
                gTasks[taskId].data[1]++;
            else
                gTasks[taskId].data[0]++;
        }
        else
        {
            if (gTasks[taskId].data[0] == 0)
            {
                gTasks[taskId].data[1] = 0;
                gTasks[taskId].data[2] = 0;
                gTasks[taskId].func = sub_80B25A4;
            }
            else
            {
                gTasks[taskId].data[0]--;
            }
        }
    }
}

void sub_80B25A4(u8 taskId)
{
    if (gTasks[taskId].data[2] < 10)
    {
        gTasks[taskId].data[2]++;
    }
    else
    {
        gTasks[taskId].data[2] = 0;
        PlaySE12WithPanning(SE_C_MAKU_U, 0);
        gTasks[taskId].func = sub_80B2508;
    }
}

void sub_80B25E4(u8 a)
{
    s32 i;
    u8 taskId;

    for (i = 0; i < 4; i++)
    {
        gSprites[shared19338[i].unk0].oam.matrixNum = AllocOamMatrix();
        gSprites[shared19338[i].unk0].oam.affineMode = 1;
        StartSpriteAffineAnim(&gSprites[shared19338[i].unk0], a);
        if (a == 2)
        {
            AnimateSprite(&gSprites[shared19338[i].unk0]);
            gSprites[shared19338[i].unk0].invisible = FALSE;
        }
    }
    taskId = CreateTask(sub_80B26C8, 5);
    gTasks[taskId].data[0] = a;
    sContest.unk1920B_1 = 1;
}

void sub_80B26C8(u8 taskId)
{
    s32 i;

    if (gSprites[shared19338[0].unk0].affineAnimEnded)
    {
        if ((u8)gTasks[taskId].data[0] == 1)
        {
            for (i = 0; i < 4; i++)
                gSprites[shared19338[i].unk0].invisible = TRUE;
        }
        for (i = 0; i < 4; i++)
            FreeSpriteOamMatrix(&gSprites[shared19338[i].unk0]);
        sContest.unk1920B_1 = 0;
        DestroyTask(taskId);
    }
}

u16 SanitizeMove(u16 move)
{
    if (move >= NUM_MOVES)
        move = MOVE_POUND;
    return move;
}

u16 SanitizeSpecies(u16 species)
{
    if (species >= NUM_SPECIES)
        species = SPECIES_NONE;
    return species;
}

void sub_80B2790(u8 a)
{
    s32 i;
    u16 move = SanitizeMove(sContestantStatus[a].currMove);
    u16 species = SanitizeSpecies(gContestMons[a].species);
    u8 r5_2;

    memset(&shared19348, 0, sizeof(shared19348));
    ClearBattleAnimationVars();
    for (i = 0; i < 4; i++)
        gBattleMonForms[i] = 0;
    switch (move)
    {
    case MOVE_CURSE:
        if (gBaseStats[species].type1 == TYPE_GHOST || gBaseStats[species].type2 == TYPE_GHOST)
            gAnimMoveTurn = 0;
        else
            gAnimMoveTurn = 1;
        break;
    case MOVE_TRANSFORM:
    case MOVE_ROLE_PLAY:
        r5_2 = sContestantStatus[a].unk1B;
        shared19348.unk2 = SanitizeSpecies(gContestMons[r5_2].species);
        shared19348.unk10 = gContestMons[r5_2].personality;
        shared19348.unk4_0 = 1;
        break;
    case MOVE_RETURN:
        gAnimFriendship = 0xFF;
        break;
    case MOVE_FRUSTRATION:
        gAnimFriendship = 0;
        break;
    case MOVE_SOLAR_BEAM:
    case MOVE_RAZOR_WIND:
    case MOVE_SKULL_BASH:
    case MOVE_SKY_ATTACK:
        if (sContest.unk1925E == 0)
        {
            sContest.unk1925E = 2;
            gAnimMoveTurn = 0;
        }
        else
        {
            gAnimMoveTurn = 1;
        }
        break;
    }
    sub_80B2968();
}

void sub_80B28CC(int unused)
{
    memset(&shared19348, 0, sizeof(shared19348));
    if (sContest.unk1925E != 0)
        sContest.unk1925E--;
}

void sub_80B28F0(u8 a)
{
    shared19348.unk5 = a;
    shared19348.unk0 = SanitizeSpecies(gContestMons[a].species);
    shared19348.unk8 = gContestMons[a].personality;
    shared19348.unkC = gContestMons[a].otId;
}

void sub_80B292C(void)
{
    gBankSpriteIds[3] = CreateInvisibleSpriteWithCallback(SpriteCallbackDummy);
    InitSpriteAffineAnim(&gSprites[gBankSpriteIds[gBankTarget]]);
    sub_80B2968();
}

void sub_80B2968(void)
{
    struct Sprite *sprite = &gSprites[gBankSpriteIds[3]];

    sprite->pos2.x = 0;
    sprite->pos2.y = 0;
    sprite->pos1.x = GetBattlerSpriteCoord(3, 0);
    sprite->pos1.y = GetBattlerSpriteCoord(3, 1);
    sprite->invisible = TRUE;
}

void SelectContestMoveBankTarget(u16 move)
{
    switch (gBattleMoves[move].target)
    {
    case TARGET_UNK2:
    case TARGET_USER:
        gBankTarget = 2;
        break;
    case TARGET_SELECTED_POKEMON:
    case TARGET_RANDOM:
    case TARGET_BOTH_ENEMIES:
    case TARGET_ALL_EXCEPT_USER:
    default:
        gBankTarget = 3;
        break;
    }
}

bool8 Contest_SaveWinner(u8 a)
{
    s32 i;
    u8 r7 = Random() % 3;

    for (i = 0; i < 3; i++)
    {
        if (gContestFinalStandings[i] == 0)
            break;
    }
    if (a == 0xFF && i != gContestPlayerMonIndex)
        return FALSE;
    switch (gSpecialVar_ContestCategory)
    {
    case CONTEST_CATEGORY_COOL:
        r7 += 0;
        break;
    case CONTEST_CATEGORY_BEAUTY:
        r7 += 3;
        break;
    case CONTEST_CATEGORY_CUTE:
        r7 += 6;
        break;
    case CONTEST_CATEGORY_SMART:
        r7 += 9;
        break;
    case CONTEST_CATEGORY_TOUGH:
        r7 += 12;
        break;
    }
    if (a != 0xFE)
    {
        u8 r4 = sub_80B2C4C(a, 1);

        gSaveBlock1.contestWinners[r4].personality = gContestMons[i].personality;
        gSaveBlock1.contestWinners[r4].species = gContestMons[i].species;
        gSaveBlock1.contestWinners[r4].otId = gContestMons[i].otId;
        StringCopy(gSaveBlock1.contestWinners[r4].nickname, gContestMons[i].nickname);
        StringCopy(gSaveBlock1.contestWinners[r4].trainerName, gContestMons[i].trainerName);
        if (a != 0xFF)
            gSaveBlock1.contestWinners[r4].contestCategory = gSpecialVar_ContestCategory;
        else
            gSaveBlock1.contestWinners[r4].contestCategory = r7;
    }
    else
    {
        shared15DE0.personality = gContestMons[i].personality;
        shared15DE0.otId = gContestMons[i].otId;
        shared15DE0.species = gContestMons[i].species;
        StringCopy(shared15DE0.nickname, gContestMons[i].nickname);
        if (gIsLinkContest & 1)
            StringCopy(shared15DE0.trainerName, gLinkPlayers[i].name);
        else
            StringCopy(shared15DE0.trainerName, gContestMons[i].trainerName);
        shared15DE0.contestCategory = r7;
    }
    return TRUE;
}

u8 sub_80B2C4C(u8 a, u8 b)
{
    s32 i;

    switch (a)
    {
    case 0:
    case 1:
        return a;
    case 2:
        if (b != 0)
        {
            for (i = 4; i >= 3; i--)
                memcpy(&gSaveBlock1.contestWinners[i], &gSaveBlock1.contestWinners[i - 1], sizeof(struct ContestWinner));
        }
        return 2;
    case 3:
        if (b != 0)
        {
            for (i = 7; i >= 6; i--)
                memcpy(&gSaveBlock1.contestWinners[i], &gSaveBlock1.contestWinners[i - 1], sizeof(struct ContestWinner));
        }
        return 5;
    default:
        switch (gSpecialVar_ContestCategory)
        {
        case CONTEST_CATEGORY_COOL:
            return 8;
        case CONTEST_CATEGORY_BEAUTY:
            return 9;
        case CONTEST_CATEGORY_CUTE:
            return 10;
        case CONTEST_CATEGORY_SMART:
            return 11;
        case CONTEST_CATEGORY_TOUGH:
        default:
            return 12;
        }
    }
}

void Contest_ResetWinners(void)
{
    s32 i;

    for (i = 0; i < 8; i++)
        gSaveBlock1.contestWinners[i] = gUnknown_083CC5D0[i];
}
