#include "global.h"
#include "battle_transition.h"
#include "main.h"
#include "overworld.h"
#include "task.h"
#include "palette.h"
#include "trig.h"
#include "field_effect.h"
#include "field_weather.h"
#include "random.h"
#include "sprite.h"
#include "sound.h"
#include "trainer.h"
#include "field_camera.h"
#include "ewram.h"
#include "scanline_effect.h"
#include "constants/songs.h"
#include "constants/field_effects.h"

void ScanlineEffect_Clear(void);

extern const struct OamData gFieldOamData_32x32;

struct TransitionData
{
    vs8 VBlank_DMA;
    u16 WININ;
    u16 WINOUT;
    u16 field_6;
    u16 WIN0V;
    u16 field_A;
    u16 field_C;
    u16 BLDCNT;
    u16 BLDALPHA;
    u16 BLDY;
    s16 field_14;
    s16 field_16;
    s16 field_18;
    s16 field_1A;
    s16 field_1C;
    s16 field_1E; // unused
    s16 field_20;
    s16 field_22; // unused
    s16 data[11];
};

typedef bool8 (*TransitionState)(struct Task* task);
typedef bool8 (*TransitionSpriteCallback)(struct Sprite* sprite);

// this file's functions
static void LaunchBattleTransitionTask(u8 transitionID);
static void Task_BattleTransitionMain(u8 taskID);
static void Phase1Task_TransitionAll(u8 taskID);
static void Phase2Task_Transition_Blur(u8 taskID);
static void Phase2Task_Transition_Swirl(u8 taskID);
static void Phase2Task_Transition_Shuffle(u8 taskID);
static void Phase2Task_Transition_BigPokeball(u8 taskID);
static void Phase2Task_Transition_PokeballsTrail(u8 taskID);
static void Phase2Task_Transition_Clockwise_BlackFade(u8 taskID);
static void Phase2Task_Transition_Ripple(u8 taskID);
static void Phase2Task_Transition_Wave(u8 taskID);
static void Phase2Task_Transition_Slice(u8 taskID);
static void Phase2Task_Transition_WhiteFade(u8 taskID);
static void Phase2Task_Transition_GridSquares(u8 taskID);
static void Phase2Task_Transition_Shards(u8 taskID);
static void Phase2Task_Transition_Sydney(u8 taskID);
static void Phase2Task_Transition_Phoebe(u8 taskID);
static void Phase2Task_Transition_Glacia(u8 taskID);
static void Phase2Task_Transition_Drake(u8 taskID);
static void Phase2Task_Transition_Steven(u8 taskID);
static bool8 Transition_Phase1(struct Task* task);
static bool8 Transition_WaitForPhase1(struct Task* task);
static bool8 Transition_Phase2(struct Task* task);
static bool8 Transition_WaitForPhase2(struct Task* task);
static void VBlankCB_Phase2_Transition_Swirl(void);
static void HBlankCB_Phase2_Transition_Swirl(void);
static void VBlankCB_Phase2_Transition_Shuffle(void);
static void HBlankCB_Phase2_Transition_Shuffle(void);
static void VBlankCB0_Phase2_Transition_BigPokeball(void);
static void VBlankCB1_Phase2_Transition_BigPokeball(void);
static void VBlankCB_Phase2_Transition_Clockwise_BlackFade(void);
static void VBlankCB_Phase2_Transition_Ripple(void);
static void HBlankCB_Phase2_Transition_Ripple(void);
static void VBlankCB_Phase2_Transition_Wave(void);
static void VBlankCB_Phase2_Transition_Slice(void);
static void HBlankCB_Phase2_Transition_Slice(void);
static void VBlankCB0_Phase2_Transition_WhiteFade(void);
static void VBlankCB1_Phase2_Transition_WhiteFade(void);
static void HBlankCB_Phase2_Transition_WhiteFade(void);
static void VBlankCB0_Phase2_Mugshots(void);
static void VBlankCB1_Phase2_Mugshots(void);
static void HBlankCB_Phase2_Mugshots(void);
static void VBlankCB_Phase2_Transition_Shards(void);
static bool8 Phase2_Transition_Blur_Func1(struct Task* task);
static bool8 Phase2_Transition_Blur_Func2(struct Task* task);
static bool8 Phase2_Transition_Blur_Func3(struct Task* task);
static bool8 Phase2_Transition_Swirl_Func1(struct Task* task);
static bool8 Phase2_Transition_Swirl_Func2(struct Task* task);
static bool8 Phase2_Transition_Shuffle_Func1(struct Task* task);
static bool8 Phase2_Transition_Shuffle_Func2(struct Task* task);
static bool8 Phase2_Transition_BigPokeball_Func1(struct Task* task);
static bool8 Phase2_Transition_BigPokeball_Func2(struct Task* task);
static bool8 Phase2_Transition_BigPokeball_Func3(struct Task* task);
static bool8 Phase2_Transition_BigPokeball_Func4(struct Task* task);
static bool8 Phase2_Transition_BigPokeball_Func5(struct Task* task);
static bool8 Phase2_Transition_BigPokeball_Func6(struct Task* task);
static bool8 Phase2_Transition_PokeballsTrail_Func1(struct Task* task);
static bool8 Phase2_Transition_PokeballsTrail_Func2(struct Task* task);
static bool8 Phase2_Transition_PokeballsTrail_Func3(struct Task* task);
static bool8 Phase2_Transition_Clockwise_BlackFade_Func1(struct Task* task);
static bool8 Phase2_Transition_Clockwise_BlackFade_Func2(struct Task* task);
static bool8 Phase2_Transition_Clockwise_BlackFade_Func3(struct Task* task);
static bool8 Phase2_Transition_Clockwise_BlackFade_Func4(struct Task* task);
static bool8 Phase2_Transition_Clockwise_BlackFade_Func5(struct Task* task);
static bool8 Phase2_Transition_Clockwise_BlackFade_Func6(struct Task* task);
static bool8 Phase2_Transition_Clockwise_BlackFade_Func7(struct Task* task);
static bool8 Phase2_Transition_Ripple_Func1(struct Task* task);
static bool8 Phase2_Transition_Ripple_Func2(struct Task* task);
static bool8 Phase2_Transition_Wave_Func1(struct Task* task);
static bool8 Phase2_Transition_Wave_Func2(struct Task* task);
static bool8 Phase2_Transition_Wave_Func3(struct Task* task);
static bool8 Phase2_Transition_Slice_Func1(struct Task* task);
static bool8 Phase2_Transition_Slice_Func2(struct Task* task);
static bool8 Phase2_Transition_Slice_Func3(struct Task* task);
static bool8 Phase2_Transition_WhiteFade_Func1(struct Task* task);
static bool8 Phase2_Transition_WhiteFade_Func2(struct Task* task);
static bool8 Phase2_Transition_WhiteFade_Func3(struct Task* task);
static bool8 Phase2_Transition_WhiteFade_Func4(struct Task* task);
static bool8 Phase2_Transition_WhiteFade_Func5(struct Task* task);
static bool8 Phase2_Transition_GridSquares_Func1(struct Task* task);
static bool8 Phase2_Transition_GridSquares_Func2(struct Task* task);
static bool8 Phase2_Transition_GridSquares_Func3(struct Task* task);
static bool8 Phase2_Transition_Shards_Func1(struct Task* task);
static bool8 Phase2_Transition_Shards_Func2(struct Task* task);
static bool8 Phase2_Transition_Shards_Func3(struct Task* task);
static bool8 Phase2_Transition_Shards_Func4(struct Task* task);
static bool8 Phase2_Transition_Shards_Func5(struct Task* task);
static bool8 Phase2_Mugshot_Func1(struct Task* task);
static bool8 Phase2_Mugshot_Func2(struct Task* task);
static bool8 Phase2_Mugshot_Func3(struct Task* task);
static bool8 Phase2_Mugshot_Func4(struct Task* task);
static bool8 Phase2_Mugshot_Func5(struct Task* task);
static bool8 Phase2_Mugshot_Func6(struct Task* task);
static bool8 Phase2_Mugshot_Func7(struct Task* task);
static bool8 Phase2_Mugshot_Func8(struct Task* task);
static bool8 Phase2_Mugshot_Func9(struct Task* task);
static bool8 Phase2_Mugshot_Func10(struct Task* task);
static void Phase2Task_MugShotTransition(u8 taskID);
static void Mugshots_CreateOpponentPlayerSprites(struct Task* task);
static void sub_811CA10(s16 spriteID, s16 value);
static void sub_811CA28(s16 spriteID);
static s16 sub_811CA44(s16 spriteID);
static bool8 sub_811C934(struct Sprite* sprite);
static bool8 sub_811C938(struct Sprite* sprite);
static bool8 sub_811C984(struct Sprite* sprite);
static bool8 sub_811C9B8(struct Sprite* sprite);
static bool8 sub_811C9E4(struct Sprite* sprite);
static void CreatePhase1Task(s16 a0, s16 a1, s16 a2, s16 a3, s16 a4);
static bool8 sub_811D52C(void);
static void Phase1_Task_RunFuncs(u8 taskID);
static bool8 Phase1_TransitionAll_Func1(struct Task* task);
static bool8 Phase1_TransitionAll_Func2(struct Task* task);
static void sub_811D658(void);
static void VBlankCB_BattleTransition(void);
static void sub_811D6A8(u16** a0, u16** a1);
static void sub_811D690(u16** a0);
static void sub_811D6D4(void);
static void sub_811D6E8(s16* array, s16 sinAdd, s16 index, s16 indexIncrementer, s16 amplitude, s16 arrSize);
static void sub_811D764(u16* a0, s16 a1, s16 a2, s16 a3);
static void sub_811D8FC(s16* a0, s16 a1, s16 a2, s16 a3, s16 a4, s16 a5, s16 a6);
static bool8 sub_811D978(s16* a0, bool8 a1, bool8 a2);
static void sub_811CFD0(struct Sprite* sprite);
static void sub_811B720(struct Sprite* sprite);
static void sub_811C90C(struct Sprite* sprite);

// const data

static const u32 sBigPokeball_Tileset[] = INCBIN_U32("graphics/battle_transitions/big_pokeball.4bpp");
static const u32 sPokeballTrail_Tileset[] = INCBIN_U32("graphics/battle_transitions/pokeball_trail.4bpp");
static const u8 sSpriteImage_83FC148[] = INCBIN_U8("graphics/battle_transitions/pokeball.4bpp");
static const u32 sUnknown_083FC348[] = INCBIN_U32("graphics/battle_transitions/elite_four_bg.4bpp");
static const u8 sSpriteImage_83FC528[] = INCBIN_U8("graphics/battle_transitions/unused_brendan.4bpp");
static const u8 sSpriteImage_83FCD28[] = INCBIN_U8("graphics/battle_transitions/unused_lass.4bpp");
static const u32 sShrinkingBoxTileset[] = INCBIN_U32("graphics/battle_transitions/shrinking_box.4bpp");

static struct TransitionData * const sTransitionStructPtr = &TRANSITION_STRUCT;

static const TaskFunc sPhase1_Tasks[TRANSITIONS_NO] =
{
    [0 ... TRANSITIONS_NO - 1] = &Phase1Task_TransitionAll
};

static const TaskFunc sPhase2_Tasks[TRANSITIONS_NO] =
{
    Phase2Task_Transition_Blur,                        // 0
    Phase2Task_Transition_Swirl,                       // 1
    Phase2Task_Transition_Shuffle,                     // 2
    Phase2Task_Transition_BigPokeball,                 // 3
    Phase2Task_Transition_PokeballsTrail,              // 4
    Phase2Task_Transition_Clockwise_BlackFade,         // 5
    Phase2Task_Transition_Ripple,                      // 6
    Phase2Task_Transition_Wave,                        // 7
    Phase2Task_Transition_Slice,                       // 8
    Phase2Task_Transition_WhiteFade,                   // 9
    Phase2Task_Transition_GridSquares,                 // 10
    Phase2Task_Transition_Shards,                      // 11
    Phase2Task_Transition_Sydney,                      // 12
    Phase2Task_Transition_Phoebe,                      // 13
    Phase2Task_Transition_Glacia,                      // 14
    Phase2Task_Transition_Drake,                       // 15
    Phase2Task_Transition_Steven,                      // 16
};

static const TransitionState sMainTransitionPhases[] =
{
    &Transition_Phase1,
    &Transition_WaitForPhase1,
    &Transition_Phase2,
    &Transition_WaitForPhase2
};

static const TransitionState sPhase2_Transition_Blur_Funcs[] =
{
    Phase2_Transition_Blur_Func1,
    Phase2_Transition_Blur_Func2,
    Phase2_Transition_Blur_Func3
};

static const TransitionState sPhase2_Transition_Swirl_Funcs[] =
{
    Phase2_Transition_Swirl_Func1,
    Phase2_Transition_Swirl_Func2,
};

static const TransitionState sPhase2_Transition_Shuffle_Funcs[] =
{
    Phase2_Transition_Shuffle_Func1,
    Phase2_Transition_Shuffle_Func2,
};

static const TransitionState sPhase2_Transition_BigPokeball_Funcs[] =
{
    Phase2_Transition_BigPokeball_Func1,
    Phase2_Transition_BigPokeball_Func2,
    Phase2_Transition_BigPokeball_Func3,
    Phase2_Transition_BigPokeball_Func4,
    Phase2_Transition_BigPokeball_Func5,
    Phase2_Transition_BigPokeball_Func6
};

static const TransitionState sPhase2_Transition_PokeballsTrail_Funcs[] =
{
    Phase2_Transition_PokeballsTrail_Func1,
    Phase2_Transition_PokeballsTrail_Func2,
    Phase2_Transition_PokeballsTrail_Func3
};

static const s16 sUnknown_083FD7E4[2] = {-16, 256};
static const s16 sUnknown_083FD7E8[5] = {0, 32, 64, 18, 48};
static const s16 sUnknown_083FD7F2[2] = {8, -8};

static const TransitionState sPhase2_Transition_Clockwise_BlackFade_Funcs[] =
{
    Phase2_Transition_Clockwise_BlackFade_Func1,
    Phase2_Transition_Clockwise_BlackFade_Func2,
    Phase2_Transition_Clockwise_BlackFade_Func3,
    Phase2_Transition_Clockwise_BlackFade_Func4,
    Phase2_Transition_Clockwise_BlackFade_Func5,
    Phase2_Transition_Clockwise_BlackFade_Func6,
    Phase2_Transition_Clockwise_BlackFade_Func7
};

static const TransitionState sPhase2_Transition_Ripple_Funcs[] =
{
    Phase2_Transition_Ripple_Func1,
    Phase2_Transition_Ripple_Func2
};

static const TransitionState sPhase2_Transition_Wave_Funcs[] =
{
    Phase2_Transition_Wave_Func1,
    Phase2_Transition_Wave_Func2,
    Phase2_Transition_Wave_Func3
};

static const TransitionState sPhase2_Mugshot_Transition_Funcs[] =
{
    Phase2_Mugshot_Func1,
    Phase2_Mugshot_Func2,
    Phase2_Mugshot_Func3,
    Phase2_Mugshot_Func4,
    Phase2_Mugshot_Func5,
    Phase2_Mugshot_Func6,
    Phase2_Mugshot_Func7,
    Phase2_Mugshot_Func8,
    Phase2_Mugshot_Func9,
    Phase2_Mugshot_Func10
};

static const u8 sMugshotsTrainerPicIDsTable[MUGSHOTS_NO] = {TRAINER_PIC_SIDNEY, TRAINER_PIC_PHOEBE, TRAINER_PIC_GLACIA, TRAINER_PIC_DRAKE, TRAINER_PIC_STEVEN};
static const s16 sMugshotsOpponentRotationScales[MUGSHOTS_NO][2] =
{
    {0x200, 0x200},
    {0x200, 0x200},
    {0x1B0, 0x1B0},
    {0x1A0, 0x1A0},
    {0x188, 0x188},
};
static const s16 sMugshotsOpponentCoords[MUGSHOTS_NO][2] =
{
    {0,     0},
    {0,     0},
    {-4,    4},
    {0,     5},
    {0,     7},
};

static const TransitionSpriteCallback sUnknown_083FD880[] =
{
    sub_811C934,
    sub_811C938,
    sub_811C984,
    sub_811C9B8,
    sub_811C934,
    sub_811C9E4,
    sub_811C934
};

static const s16 sUnknown_083FD89C[2] = {12, -12};
static const s16 sUnknown_083FD8A0[2] = {-1, 1};

static const TransitionState sPhase2_Transition_Slice_Funcs[] =
{
    Phase2_Transition_Slice_Func1,
    Phase2_Transition_Slice_Func2,
    Phase2_Transition_Slice_Func3
};

static const TransitionState sPhase2_Transition_WhiteFade_Funcs[] =
{
    Phase2_Transition_WhiteFade_Func1,
    Phase2_Transition_WhiteFade_Func2,
    Phase2_Transition_WhiteFade_Func3,
    Phase2_Transition_WhiteFade_Func4,
    Phase2_Transition_WhiteFade_Func5
};

static const s16 sUnknown_083FD8C4[8] = {0, 20, 15, 40, 10, 25, 35, 5};

static const TransitionState sPhase2_Transition_GridSquares_Funcs[] =
{
    Phase2_Transition_GridSquares_Func1,
    Phase2_Transition_GridSquares_Func2,
    Phase2_Transition_GridSquares_Func3
};

static const TransitionState sPhase2_Transition_Shards_Funcs[] =
{
    Phase2_Transition_Shards_Func1,
    Phase2_Transition_Shards_Func2,
    Phase2_Transition_Shards_Func3,
    Phase2_Transition_Shards_Func4,
    Phase2_Transition_Shards_Func5
};

static const s16 sUnknown_083FD8F4[][5] =
{
    {56,    0,      0,      160,    0},
    {104,   160,    240,    88,     1},
    {240,   72,     56,     0,      1},
    {0,     32,     144,    160,    0},
    {144,   160,    184,    0,      1},
    {56,    0,      168,    160,    0},
    {168,   160,    48,     0,      1},
};

static const s16 sUnknown_083FD93A[] = {8, 4, 2, 1, 1, 1, 0};

static const TransitionState sPhase1_TransitionAll_Funcs[] =
{
    Phase1_TransitionAll_Func1,
    Phase1_TransitionAll_Func2
};

static const struct SpriteFrameImage sSpriteImageTable_83FD950[] =
{
    sSpriteImage_83FC148, 0x200
};

static const union AnimCmd sSpriteAnim_83FD958[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END
};

static const union AnimCmd *const sSpriteAnimTable_83FD960[] =
{
    sSpriteAnim_83FD958
};

static const union AffineAnimCmd sSpriteAffineAnim_83FD964[] =
{
    AFFINEANIMCMD_FRAME(0, 0, -4, 1),
    AFFINEANIMCMD_JUMP(0)
};

static const union AffineAnimCmd sSpriteAffineAnim_83FD974[] =
{
    AFFINEANIMCMD_FRAME(0, 0, 4, 1),
    AFFINEANIMCMD_JUMP(0)
};

static const union AffineAnimCmd *const sSpriteAffineAnimTable_83FD984[] =
{
    sSpriteAffineAnim_83FD964,
    sSpriteAffineAnim_83FD974
};

static const struct SpriteTemplate sSpriteTemplate_83FD98C =
{
    .tileTag = 0xFFFF,
    .paletteTag = 4105,
    .oam = &gFieldOamData_32x32,
    .anims = sSpriteAnimTable_83FD960,
    .images = sSpriteImageTable_83FD950,
    .affineAnims = sSpriteAffineAnimTable_83FD984,
    .callback = sub_811B720
};

static const struct OamData gOamData_83FD9A4 =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};

static const struct SpriteFrameImage sSpriteImageTable_83FD9AC[] =
{
    sSpriteImage_83FC528, 0x800
};

static const struct SpriteFrameImage sSpriteImageTable_83FD9B4[] =
{
    sSpriteImage_83FCD28, 0x800
};

static const union AnimCmd sSpriteAnim_83FD9BC[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END
};

static const union AnimCmd *const sSpriteAnimTable_83FD9C4[] =
{
    sSpriteAnim_83FD9BC
};

static const struct SpriteTemplate sSpriteTemplate_83FD9C8 =
{
    .tileTag = 0xFFFF,
    .paletteTag = 4106,
    .oam = &gOamData_83FD9A4,
    .anims = sSpriteAnimTable_83FD9C4,
    .images = sSpriteImageTable_83FD9AC,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_811C90C
};

static const struct SpriteTemplate sSpriteTemplate_83FD9E0 =
{
    .tileTag = 0xFFFF,
    .paletteTag = 4106,
    .oam = &gOamData_83FD9A4,
    .anims = sSpriteAnimTable_83FD9C4,
    .images = sSpriteImageTable_83FD9B4,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_811C90C
};

static const u16 gFieldEffectObjectPalette10[] = INCBIN_U16("graphics/field_effect_objects/palettes/10.gbapal");

const struct SpritePalette gFieldEffectObjectPaletteInfo10 =
{
    gFieldEffectObjectPalette10, 0x1009
};

static const u16 sMugshotPal_Sydney[] = INCBIN_U16("graphics/battle_transitions/sidney_bg.gbapal");
static const u16 sMugshotPal_Phoebe[] = INCBIN_U16("graphics/battle_transitions/phoebe_bg.gbapal");
static const u16 sMugshotPal_Glacia[] = INCBIN_U16("graphics/battle_transitions/glacia_bg.gbapal");
static const u16 sMugshotPal_Drake[] = INCBIN_U16("graphics/battle_transitions/drake_bg.gbapal");
static const u16 sMugshotPal_Steven[] = INCBIN_U16("graphics/battle_transitions/steven_bg.gbapal");
static const u16 sMugshotPal_Brendan[] = INCBIN_U16("graphics/battle_transitions/brendan_bg.gbapal");
static const u16 sMugshotPal_May[] = INCBIN_U16("graphics/battle_transitions/may_bg.gbapal");

static const u16 * const sOpponentMugshotsPals[MUGSHOTS_NO] =
{
    sMugshotPal_Sydney,
    sMugshotPal_Phoebe,
    sMugshotPal_Glacia,
    sMugshotPal_Drake,
    sMugshotPal_Steven
};

static const u16 * const sPlayerMugshotsPals[2] =
{
    sMugshotPal_Brendan,
    sMugshotPal_May
};

static const u16 sUnusedTrainerPalette[] = INCBIN_U16("graphics/battle_transitions/unused_trainer.gbapal");
static const struct SpritePalette sSpritePalette_UnusedTrainer =
{
    sUnusedTrainerPalette, 0x100A
};

static const u16 sBigPokeball_Tilemap[] = INCBIN_U16("graphics/battle_transitions/big_pokeball_map.bin");
static const u16 sMugshotsTilemap[] = INCBIN_U16("graphics/battle_transitions/elite_four_bg_map.bin");

// actual code starts here

void BattleTransition_StartOnField(u8 transitionID)
{
    gMain.callback2 = CB2_OverworldBasic;
    LaunchBattleTransitionTask(transitionID);
}

void BattleTransition_Start(u8 transitionID)
{
    LaunchBattleTransitionTask(transitionID);
}

#define tState          data[0]
#define tTransitionID   data[1]
#define tTransitionDone data[15]

bool8 IsBattleTransitionDone(void)
{
    u8 taskID = FindTaskIdByFunc(Task_BattleTransitionMain);
    if (gTasks[taskID].tTransitionDone)
    {
        DestroyTask(taskID);
        return TRUE;
    }
    else
        return FALSE;
}

static void LaunchBattleTransitionTask(u8 transitionID)
{
    u8 taskID = CreateTask(Task_BattleTransitionMain, 2);
    gTasks[taskID].tTransitionID = transitionID;
}

static void Task_BattleTransitionMain(u8 taskID)
{
    while (sMainTransitionPhases[gTasks[taskID].tState](&gTasks[taskID]));
}

static bool8 Transition_Phase1(struct Task* task)
{
    SetWeatherScreenFadeOut();
    CpuCopy32(gPlttBufferFaded, gPlttBufferUnfaded, 0x400);
    if (sPhase1_Tasks[task->tTransitionID] != NULL)
    {
        CreateTask(sPhase1_Tasks[task->tTransitionID], 4);
        task->tState++;
        return FALSE;
    }
    else
    {
        task->tState = 2;
        return TRUE;
    }
}

static bool8 Transition_WaitForPhase1(struct Task* task)
{
    if (FindTaskIdByFunc(sPhase1_Tasks[task->tTransitionID]) == 0xFF)
    {
        task->tState++;
        return TRUE;
    }
    else
        return FALSE;
}

static bool8 Transition_Phase2(struct Task* task)
{
    CreateTask(sPhase2_Tasks[task->tTransitionID], 0);
    task->tState++;
    return FALSE;
}

static bool8 Transition_WaitForPhase2(struct Task* task)
{
    task->tTransitionDone = 0;
    if (FindTaskIdByFunc(sPhase2_Tasks[task->tTransitionID]) == 0xFF)
        task->tTransitionDone = 1;
    return FALSE;
}

static void Phase1Task_TransitionAll(u8 taskID)
{
    if (gTasks[taskID].tState == 0)
    {
        gTasks[taskID].tState++;
        CreatePhase1Task(0, 0, 3, 2, 2);
    }
    else if (sub_811D52C())
        DestroyTask(taskID);
}

static void Phase2Task_Transition_Blur(u8 taskID)
{
    while (sPhase2_Transition_Blur_Funcs[gTasks[taskID].tState](&gTasks[taskID]));
}

static bool8 Phase2_Transition_Blur_Func1(struct Task* task)
{
    REG_MOSAIC = 0;
    REG_BG1CNT |= BGCNT_MOSAIC;
    REG_BG2CNT |= BGCNT_MOSAIC;
    REG_BG3CNT |= BGCNT_MOSAIC;
    task->tState++;
    return TRUE;
}

static bool8 Phase2_Transition_Blur_Func2(struct Task* task)
{
    if (task->data[1] != 0)
        task->data[1]--;
    else
    {
        task->data[1] = 4;
        if (++task->data[2] == 10)
            BeginNormalPaletteFade(0xFFFFFFFF, -1, 0, 16, RGB(0, 0, 0));
        REG_MOSAIC = (task->data[2] & 15) * 17;
        if (task->data[2] > 14)
            task->tState++;
    }
    return FALSE;
}

static bool8 Phase2_Transition_Blur_Func3(struct Task* task)
{
    if (!gPaletteFade.active)
    {
        u8 taskID = FindTaskIdByFunc(Phase2Task_Transition_Blur);
        DestroyTask(taskID);
    }
    return FALSE;
}

static void Phase2Task_Transition_Swirl(u8 taskID)
{
    while (sPhase2_Transition_Swirl_Funcs[gTasks[taskID].tState](&gTasks[taskID]));
}

static bool8 Phase2_Transition_Swirl_Func1(struct Task* task)
{
    u16 savedIME;

    sub_811D658();
    ScanlineEffect_Clear();
    BeginNormalPaletteFade(0xFFFFFFFF, 4, 0, 16, RGB(0, 0, 0));
    sub_811D6E8(gScanlineEffectRegBuffers[1], TRANSITION_STRUCT.field_14, 0, 2, 0, 160);

    SetVBlankCallback(VBlankCB_Phase2_Transition_Swirl);
    SetHBlankCallback(HBlankCB_Phase2_Transition_Swirl);

    savedIME = REG_IME;
    REG_IME = 0;
    REG_IE |= (INTR_FLAG_VBLANK | INTR_FLAG_HBLANK);
    REG_IME = savedIME;
    REG_DISPSTAT |= (DISPSTAT_VBLANK_INTR | DISPSTAT_HBLANK_INTR);

    task->tState++;
    return FALSE;
}

static bool8 Phase2_Transition_Swirl_Func2(struct Task* task)
{
    TRANSITION_STRUCT.VBlank_DMA = 0;
    task->data[1] += 4;
    task->data[2] += 8;

    sub_811D6E8(gScanlineEffectRegBuffers[0], TRANSITION_STRUCT.field_14, task->data[1], 2, task->data[2], 160);

    if (!gPaletteFade.active)
    {
        u8 taskID = FindTaskIdByFunc(Phase2Task_Transition_Swirl);
        DestroyTask(taskID);
    }

    TRANSITION_STRUCT.VBlank_DMA++;
    return FALSE;
}

static void VBlankCB_Phase2_Transition_Swirl(void)
{
    VBlankCB_BattleTransition();
    if (TRANSITION_STRUCT.VBlank_DMA)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 320);
}

static void HBlankCB_Phase2_Transition_Swirl(void)
{
    u16 var = gScanlineEffectRegBuffers[1][REG_VCOUNT];
    REG_BG1HOFS = var;
    REG_BG2HOFS = var;
    REG_BG3HOFS = var;
}

static void Phase2Task_Transition_Shuffle(u8 taskID)
{
    while (sPhase2_Transition_Shuffle_Funcs[gTasks[taskID].tState](&gTasks[taskID]));
}

static bool8 Phase2_Transition_Shuffle_Func1(struct Task* task)
{
    u16 savedIME;

    sub_811D658();
    ScanlineEffect_Clear();

    BeginNormalPaletteFade(0xFFFFFFFF, 4, 0, 16, RGB(0, 0, 0));
    memset(gScanlineEffectRegBuffers[1], TRANSITION_STRUCT.field_16, 0x140);

    SetVBlankCallback(VBlankCB_Phase2_Transition_Shuffle);
    SetHBlankCallback(HBlankCB_Phase2_Transition_Shuffle);

    savedIME = REG_IME;
    REG_IME = 0;
    REG_IE |= (INTR_FLAG_VBLANK | INTR_FLAG_HBLANK);
    REG_IME = savedIME;
    REG_DISPSTAT |= (DISPSTAT_VBLANK_INTR | DISPSTAT_HBLANK_INTR);

    task->tState++;
    return FALSE;
}

static bool8 Phase2_Transition_Shuffle_Func2(struct Task* task)
{
    u8 i;
    u16 r3, r4;

    TRANSITION_STRUCT.VBlank_DMA = 0;
    r4 = task->data[1];
    r3 = task->data[2] >> 8;
    task->data[1] += 4224;
    task->data[2] += 384;

    for (i = 0; i < 160; i++, r4 += 4224)
    {
        u16 var = r4 / 256;
        gScanlineEffectRegBuffers[0][i] = TRANSITION_STRUCT.field_16 + Sin(var, r3);
    }

    if (!gPaletteFade.active)
        DestroyTask(FindTaskIdByFunc(Phase2Task_Transition_Shuffle));

    TRANSITION_STRUCT.VBlank_DMA++;
    return FALSE;
}

static void VBlankCB_Phase2_Transition_Shuffle(void)
{
    VBlankCB_BattleTransition();
    if (TRANSITION_STRUCT.VBlank_DMA)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 320);
}

static void HBlankCB_Phase2_Transition_Shuffle(void)
{
    u16 var = gScanlineEffectRegBuffers[1][REG_VCOUNT];
    REG_BG1VOFS = var;
    REG_BG2VOFS = var;
    REG_BG3VOFS = var;
}

static void Phase2Task_Transition_BigPokeball(u8 taskID)
{
    while (sPhase2_Transition_BigPokeball_Funcs[gTasks[taskID].tState](&gTasks[taskID]));
}

static bool8 Phase2_Transition_BigPokeball_Func1(struct Task* task)
{
    u16 i;
    u16 *dst1, *dst2;

    sub_811D658();
    ScanlineEffect_Clear();

    task->data[1] = 16;
    task->data[2] = 0;
    task->data[4] = 0;
    task->data[5] = 0x4000;
    TRANSITION_STRUCT.WININ = 63;
    TRANSITION_STRUCT.WINOUT = 0;
    TRANSITION_STRUCT.field_6 = 240;
    TRANSITION_STRUCT.WIN0V = 160;
    TRANSITION_STRUCT.BLDCNT = 0x3F41;
    TRANSITION_STRUCT.BLDALPHA = task->data[1] * 256; // 16 * 256 = 0x1000

    for (i = 0; i < 160; i++)
    {
        gScanlineEffectRegBuffers[1][i] = 240;
    }

    SetVBlankCallback(VBlankCB0_Phase2_Transition_BigPokeball);

    sub_811D6A8(&dst1, & dst2);
    CpuFill16(0, dst1, 0x800);
    CpuSet(sBigPokeball_Tileset, dst2, 0x2C0);
    LoadPalette(gFieldEffectObjectPalette10, 240, 32);

    task->tState++;
    return FALSE;
}

static bool8 Phase2_Transition_BigPokeball_Func2(struct Task* task)
{
    s16 i, j;
    u16 *dst1, *dst2;
    const u16* BigPokeballMap;

    BigPokeballMap = sBigPokeball_Tilemap;
    sub_811D6A8(&dst1, &dst2);
    for (i = 0; i < 20; i++)
    {
        for (j = 0; j < 30; j++, BigPokeballMap++)
        {
            dst1[i * 32 + j] = *BigPokeballMap | 0xF000;
        }
    }
    sub_811D6E8(gScanlineEffectRegBuffers[0], 0, task->data[4], 132, task->data[5], 160);

    task->tState++;
    return TRUE;
}

static bool8 Phase2_Transition_BigPokeball_Func3(struct Task* task)
{
    TRANSITION_STRUCT.VBlank_DMA = 0;
    if (task->data[3] == 0 || --task->data[3] == 0)
    {
        task->data[2]++;
        task->data[3] = 2;
    }
    TRANSITION_STRUCT.BLDALPHA = (task->data[1] << 8) | task->data[2];
    if (task->data[2] > 15)
        task->tState++;
    task->data[4] += 8;
    task->data[5] -= 256;

    sub_811D6E8(gScanlineEffectRegBuffers[0], 0, task->data[4], 132, task->data[5] >> 8, 160);

    TRANSITION_STRUCT.VBlank_DMA++;
    return FALSE;
}

static bool8 Phase2_Transition_BigPokeball_Func4(struct Task* task)
{
    TRANSITION_STRUCT.VBlank_DMA = 0;
    if (task->data[3] == 0 || --task->data[3] == 0)
    {
        task->data[1]--;
        task->data[3] = 2;
    }
    TRANSITION_STRUCT.BLDALPHA = (task->data[1] << 8) | task->data[2];
    if (task->data[1] == 0)
        task->tState++;
    task->data[4] += 8;
    task->data[5] -= 256;

    sub_811D6E8(gScanlineEffectRegBuffers[0], 0, task->data[4], 132, task->data[5] >> 8, 160);

    TRANSITION_STRUCT.VBlank_DMA++;
    return FALSE;
}

static bool8 Phase2_Transition_BigPokeball_Func5(struct Task* task)
{
    TRANSITION_STRUCT.VBlank_DMA = 0;
    task->data[4] += 8;
    task->data[5] -= 256;

    sub_811D6E8(gScanlineEffectRegBuffers[0], 0, task->data[4], 132, task->data[5] >> 8, 160);

    if (task->data[5] <= 0)
    {
        task->tState++;
        task->data[1] = 160;
        task->data[2] = 256;
        task->data[3] = 0;
    }

    TRANSITION_STRUCT.VBlank_DMA++;
    return FALSE;
}

static bool8 Phase2_Transition_BigPokeball_Func6(struct Task* task)
{
    TRANSITION_STRUCT.VBlank_DMA = 0;
    if (task->data[2] < 1024)
        task->data[2] += 128;
    if (task->data[1] != 0)
    {
        task->data[1] -= (task->data[2] >> 8);
        if (task->data[1] < 0)
            task->data[1] = 0;
    }
    sub_811D764(gScanlineEffectRegBuffers[0], 120, 80, task->data[1]);
    if (task->data[1] == 0)
    {
        DmaStop(0);
        sub_811D6D4();
        DestroyTask(FindTaskIdByFunc(Phase2Task_Transition_BigPokeball));
    }
    if (task->data[3] == 0)
    {
        task->data[3]++;
        SetVBlankCallback(VBlankCB1_Phase2_Transition_BigPokeball);
    }

    TRANSITION_STRUCT.VBlank_DMA++;
    return FALSE;
}

static void Transition_BigPokeball_Vblank(void)
{
    DmaStop(0);
    VBlankCB_BattleTransition();
    if (TRANSITION_STRUCT.VBlank_DMA)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 320);
    REG_WININ = TRANSITION_STRUCT.WININ;
    REG_WINOUT = TRANSITION_STRUCT.WINOUT;
    REG_WIN0V = TRANSITION_STRUCT.WIN0V;
    REG_BLDCNT = TRANSITION_STRUCT.BLDCNT;
    REG_BLDALPHA = TRANSITION_STRUCT.BLDALPHA;
}

static void VBlankCB0_Phase2_Transition_BigPokeball(void)
{
    Transition_BigPokeball_Vblank();
    DmaSet(0, gScanlineEffectRegBuffers[1], &REG_BG0HOFS, 0xA2400001);
}

static void VBlankCB1_Phase2_Transition_BigPokeball(void)
{
    Transition_BigPokeball_Vblank();
    DmaSet(0, gScanlineEffectRegBuffers[1], &REG_WIN0H, 0xA2400001);
}

static void Phase2Task_Transition_PokeballsTrail(u8 taskID)
{
    while (sPhase2_Transition_PokeballsTrail_Funcs[gTasks[taskID].tState](&gTasks[taskID]));
}

static bool8 Phase2_Transition_PokeballsTrail_Func1(struct Task* task)
{
    u16 *dst1, *dst2;

    sub_811D6A8(&dst1, &dst2);
    CpuSet(sPokeballTrail_Tileset, dst2, 0x20);
    CpuFill32(0, dst1, 0x800);
    LoadPalette(gFieldEffectObjectPalette10, 0xF0, 0x20);

    task->tState++;
    return FALSE;
}

static bool8 Phase2_Transition_PokeballsTrail_Func2(struct Task* task)
{
    s16 i;
    s16 rand;
    s16 arr0[2];
    s16 arr1[5];

    memcpy(arr0, sUnknown_083FD7E4, sizeof(sUnknown_083FD7E4));
    memcpy(arr1, sUnknown_083FD7E8, sizeof(sUnknown_083FD7E8));
    rand = Random() & 1;
    for (i = 0; i <= 4; i++, rand ^= 1)
    {
        gFieldEffectArguments[0] = arr0[rand];      // x
        gFieldEffectArguments[1] = (i * 32) + 16;   // y
        gFieldEffectArguments[2] = rand;
        gFieldEffectArguments[3] = arr1[i];
        FieldEffectStart(FLDEFF_POKEBALL);
    }

    task->tState++;
    return FALSE;
}

static bool8 Phase2_Transition_PokeballsTrail_Func3(struct Task* task)
{
    if (!FieldEffectActiveListContains(FLDEFF_POKEBALL))
    {
        sub_811D6D4();
        DestroyTask(FindTaskIdByFunc(Phase2Task_Transition_PokeballsTrail));
    }
    return FALSE;
}

bool8 FldEff_Pokeball(void)
{
    u8 spriteID = CreateSpriteAtEnd(&sSpriteTemplate_83FD98C, gFieldEffectArguments[0], gFieldEffectArguments[1], 0);
    gSprites[spriteID].oam.priority = 0;
    gSprites[spriteID].oam.affineMode = 1;
    gSprites[spriteID].data[0] = gFieldEffectArguments[2];
    gSprites[spriteID].data[1] = gFieldEffectArguments[3];
    gSprites[spriteID].data[2] = -1;
    InitSpriteAffineAnim(&gSprites[spriteID]);
    StartSpriteAffineAnim(&gSprites[spriteID], gFieldEffectArguments[2]);
    return FALSE;
}

#define SOME_VRAM_STORE(ptr, posY, posX, toStore)                       \
{                                                                       \
    u32 index = (posY) * 32 + posX;                                     \
    ptr[index] = toStore;                                               \
}

static void sub_811B720(struct Sprite* sprite)
{
    s16 arr0[2];

    memcpy(arr0, sUnknown_083FD7F2, sizeof(sUnknown_083FD7F2));
    if (sprite->data[1] != 0)
        sprite->data[1]--;
    else
    {
        if (sprite->pos1.x >= 0 && sprite->pos1.x <= 240)
        {
            s16 posX = sprite->pos1.x >> 3;
            s16 posY = sprite->pos1.y >> 3;

            if (posX != sprite->data[2])
            {
                u32 var;
                u16 *ptr;

                sprite->data[2] = posX;
                var = (((REG_BG0CNT >> 8) & 0x1F) << 11);  // r2
                ptr = (u16 *)(VRAM + var);

                SOME_VRAM_STORE(ptr, posY - 2, posX, 0xF001);
                SOME_VRAM_STORE(ptr, posY - 1, posX, 0xF001);
                SOME_VRAM_STORE(ptr, posY - 0, posX, 0xF001);
                SOME_VRAM_STORE(ptr, posY + 1, posX, 0xF001);
            }
        }
        sprite->pos1.x += arr0[sprite->data[0]];
        if (sprite->pos1.x < -15 || sprite->pos1.x > 255)
            FieldEffectStop(sprite, FLDEFF_POKEBALL);
    }
}

static void Phase2Task_Transition_Clockwise_BlackFade(u8 taskID)
{
    while (sPhase2_Transition_Clockwise_BlackFade_Funcs[gTasks[taskID].tState](&gTasks[taskID]));
}

static bool8 Phase2_Transition_Clockwise_BlackFade_Func1(struct Task* task)
{
    u16 i;

    sub_811D658();
    ScanlineEffect_Clear();

    TRANSITION_STRUCT.WININ = 0;
    TRANSITION_STRUCT.WINOUT = 63;
    TRANSITION_STRUCT.field_6 = -3855;
    TRANSITION_STRUCT.WIN0V = 160;

    for (i = 0; i < 160; i++)
    {
        gScanlineEffectRegBuffers[1][i] = 0xF3F4;
    }

    SetVBlankCallback(VBlankCB_Phase2_Transition_Clockwise_BlackFade);
    TRANSITION_STRUCT.data[4] = 120;

    task->tState++;
    return TRUE;
}

static bool8 Phase2_Transition_Clockwise_BlackFade_Func2(struct Task* task)
{
    TRANSITION_STRUCT.VBlank_DMA = 0;

    sub_811D8FC(TRANSITION_STRUCT.data, 120, 80, TRANSITION_STRUCT.data[4], -1, 1, 1);
    do
    {
        gScanlineEffectRegBuffers[0][TRANSITION_STRUCT.data[3]] = (TRANSITION_STRUCT.data[2] + 1) | 0x7800;
    } while (!sub_811D978(TRANSITION_STRUCT.data, 1, 1));

    TRANSITION_STRUCT.data[4] += 16;
    if (TRANSITION_STRUCT.data[4] >= 240)
    {
        TRANSITION_STRUCT.data[5] = 0;
        task->tState++;
    }

    TRANSITION_STRUCT.VBlank_DMA++;
    return FALSE;
}

static bool8 Phase2_Transition_Clockwise_BlackFade_Func3(struct Task* task)
{
    s16 r1, r3;
    vu8 var = 0;

    TRANSITION_STRUCT.VBlank_DMA = 0;

    sub_811D8FC(TRANSITION_STRUCT.data, 120, 80, 240, TRANSITION_STRUCT.data[5], 1, 1);

    while (1)
    {
        r1 = 120, r3 = TRANSITION_STRUCT.data[2] + 1;
        if (TRANSITION_STRUCT.data[5] >= 80)
            r1 = TRANSITION_STRUCT.data[2], r3 = 240;
        gScanlineEffectRegBuffers[0][TRANSITION_STRUCT.data[3]] = (r3) | (r1 << 8);
        if (var != 0)
            break;
        var = sub_811D978(TRANSITION_STRUCT.data, 1, 1);
    }

    TRANSITION_STRUCT.data[5] += 8;
    if (TRANSITION_STRUCT.data[5] >= 160)
    {
        TRANSITION_STRUCT.data[4] = 240;
        task->tState++;
    }
    else
    {
        while (TRANSITION_STRUCT.data[3] < TRANSITION_STRUCT.data[5])
        {
            gScanlineEffectRegBuffers[0][++TRANSITION_STRUCT.data[3]] = (r3) | (r1 << 8);
        }
    }

    TRANSITION_STRUCT.VBlank_DMA++;
    return FALSE;
}

static bool8 Phase2_Transition_Clockwise_BlackFade_Func4(struct Task* task)
{
    TRANSITION_STRUCT.VBlank_DMA = 0;

    sub_811D8FC(TRANSITION_STRUCT.data, 120, 80, TRANSITION_STRUCT.data[4], 160, 1, 1);
    do
    {
        gScanlineEffectRegBuffers[0][TRANSITION_STRUCT.data[3]] = (TRANSITION_STRUCT.data[2] << 8) | 0xF0;
    } while (!sub_811D978(TRANSITION_STRUCT.data, 1, 1));

    TRANSITION_STRUCT.data[4] -= 16;
    if (TRANSITION_STRUCT.data[4] <= 0)
    {
        TRANSITION_STRUCT.data[5] = 160;
        task->tState++;
    }

    TRANSITION_STRUCT.VBlank_DMA++;
    return FALSE;
}

static bool8 Phase2_Transition_Clockwise_BlackFade_Func5(struct Task* task)
{
    s16 r1, r2, r3;
    vu8 var = 0;

    TRANSITION_STRUCT.VBlank_DMA = 0;

    sub_811D8FC(TRANSITION_STRUCT.data, 120, 80, 0, TRANSITION_STRUCT.data[5], 1, 1);

    while (1)
    {
        r1 = gScanlineEffectRegBuffers[0][TRANSITION_STRUCT.data[3]] & 0xFF, r2 = TRANSITION_STRUCT.data[2];
        if (TRANSITION_STRUCT.data[5] <= 80)
            r2 = 120, r1 = TRANSITION_STRUCT.data[2];
        gScanlineEffectRegBuffers[0][TRANSITION_STRUCT.data[3]] = (r1) | (r2 << 8);
        r3 = 0;
        if (var != 0)
            break;
        var = sub_811D978(TRANSITION_STRUCT.data, 1, 1);
    }

    TRANSITION_STRUCT.data[5] -= 8;
    if (TRANSITION_STRUCT.data[5] <= 0)
    {
        TRANSITION_STRUCT.data[4] = r3;
        task->tState++;
    }
    else
    {
        while (TRANSITION_STRUCT.data[3] > TRANSITION_STRUCT.data[5])
        {
            gScanlineEffectRegBuffers[0][--TRANSITION_STRUCT.data[3]] = (r1) | (r2 << 8);
        }
    }

    TRANSITION_STRUCT.VBlank_DMA++;
    return FALSE;
}

static bool8 Phase2_Transition_Clockwise_BlackFade_Func6(struct Task* task)
{
    TRANSITION_STRUCT.VBlank_DMA = 0;

    sub_811D8FC(TRANSITION_STRUCT.data, 120, 80, TRANSITION_STRUCT.data[4], 0, 1, 1);
    do
    {
        s16 r2, r3;

        r2 = 120, r3 = TRANSITION_STRUCT.data[2];
        if (TRANSITION_STRUCT.data[2] >= 120)
            r2 = 0, r3 = 240;
        gScanlineEffectRegBuffers[0][TRANSITION_STRUCT.data[3]] = (r3) | (r2 << 8);

    } while (!sub_811D978(TRANSITION_STRUCT.data, 1, 1));

    TRANSITION_STRUCT.data[4] += 16;
    if (TRANSITION_STRUCT.data[2] > 120)
        task->tState++;

    TRANSITION_STRUCT.VBlank_DMA++;
    return FALSE;
}

static bool8 Phase2_Transition_Clockwise_BlackFade_Func7(struct Task* task)
{
    DmaStop(0);
    sub_811D6D4();
    DestroyTask(FindTaskIdByFunc(Phase2Task_Transition_Clockwise_BlackFade));
    return FALSE;
}

static void VBlankCB_Phase2_Transition_Clockwise_BlackFade(void)
{
    DmaStop(0);
    VBlankCB_BattleTransition();
    if (TRANSITION_STRUCT.VBlank_DMA != 0)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 320);
    REG_WININ = TRANSITION_STRUCT.WININ;
    REG_WINOUT = TRANSITION_STRUCT.WINOUT;
    REG_WIN0V = TRANSITION_STRUCT.WIN0V;
    REG_WIN0H = gScanlineEffectRegBuffers[1][0];
    DmaSet(0, gScanlineEffectRegBuffers[1], &REG_WIN0H, 0xA2400001);
}

static void Phase2Task_Transition_Ripple(u8 taskID)
{
    while (sPhase2_Transition_Ripple_Funcs[gTasks[taskID].tState](&gTasks[taskID]));
}

static bool8 Phase2_Transition_Ripple_Func1(struct Task* task)
{
    u8 i;

    sub_811D658();
    ScanlineEffect_Clear();

    for (i = 0; i < 160; i++)
    {
        gScanlineEffectRegBuffers[1][i] = TRANSITION_STRUCT.field_16;
    }

    SetVBlankCallback(VBlankCB_Phase2_Transition_Ripple);
    SetHBlankCallback(HBlankCB_Phase2_Transition_Ripple);

    REG_IE |= INTR_FLAG_HBLANK;
    REG_DISPSTAT |= DISPSTAT_HBLANK_INTR;

    task->tState++;
    return TRUE;
}

static bool8 Phase2_Transition_Ripple_Func2(struct Task* task)
{
    u8 i;
    s16 r3;
    u16 r4, r8;

    TRANSITION_STRUCT.VBlank_DMA = 0;

    r3 = task->data[2] >> 8;
    r4 = task->data[1];
    r8 = 384;
    task->data[1] += 0x400;
    if (task->data[2] <= 0x1FFF)
        task->data[2] += 0x180;

    for (i = 0; i < 160; i++, r4 += r8)
    {
        // todo: fix the asm
        s16 var = r4 >> 8;
        asm("");
        gScanlineEffectRegBuffers[0][i] = TRANSITION_STRUCT.field_16 + Sin(var, r3);
        asm("");
    }

    if (++task->data[3] == 81)
    {
        task->data[4]++;
        BeginNormalPaletteFade(0xFFFFFFFF, -2, 0, 16, RGB(0, 0, 0));
    }

    if (task->data[4] != 0 && !gPaletteFade.active)
        DestroyTask(FindTaskIdByFunc(Phase2Task_Transition_Ripple));

    TRANSITION_STRUCT.VBlank_DMA++;
    return FALSE;
}

static void VBlankCB_Phase2_Transition_Ripple(void)
{
    VBlankCB_BattleTransition();
    if (TRANSITION_STRUCT.VBlank_DMA)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 320);
}

static void HBlankCB_Phase2_Transition_Ripple(void)
{
    u16 var = gScanlineEffectRegBuffers[1][REG_VCOUNT];
    REG_BG1VOFS = var;
    REG_BG2VOFS = var;
    REG_BG3VOFS = var;
}

static void Phase2Task_Transition_Wave(u8 taskID)
{
    while (sPhase2_Transition_Wave_Funcs[gTasks[taskID].tState](&gTasks[taskID]));
}

static bool8 Phase2_Transition_Wave_Func1(struct Task* task)
{
    u8 i;

    sub_811D658();
    ScanlineEffect_Clear();

    TRANSITION_STRUCT.WININ = 63;
    TRANSITION_STRUCT.WINOUT = 0;
    TRANSITION_STRUCT.field_6 = 240;
    TRANSITION_STRUCT.WIN0V = 160;

    for (i = 0; i < 160; i++)
    {
        gScanlineEffectRegBuffers[1][i] = 242;
    }

    SetVBlankCallback(VBlankCB_Phase2_Transition_Wave);

    task->tState++;
    return TRUE;
}

static bool8 Phase2_Transition_Wave_Func2(struct Task* task)
{
    u8 i, r5;
    u16* toStore;
    bool8 nextFunc;

    TRANSITION_STRUCT.VBlank_DMA = 0;
    toStore = gScanlineEffectRegBuffers[0];
    r5 = task->data[2];
    task->data[2] += 16;
    task->data[1] += 8;

    for (i = 0, nextFunc = TRUE; i < 160; i++, r5 += 4, toStore++)
    {
        s16 value = task->data[1] + Sin(r5, 40);
        if (value < 0)
            value = 0;
        if (value > 240)
            value = 240;
        *toStore = (value << 8) | (0xF1);
        if (value < 240)
            nextFunc = FALSE;
    }
    if (nextFunc)
        task->tState++;

    TRANSITION_STRUCT.VBlank_DMA++;
    return FALSE;
}

static bool8 Phase2_Transition_Wave_Func3(struct Task* task)
{
    DmaStop(0);
    sub_811D6D4();
    DestroyTask(FindTaskIdByFunc(Phase2Task_Transition_Wave));
    return FALSE;
}

static void VBlankCB_Phase2_Transition_Wave(void)
{
    DmaStop(0);
    VBlankCB_BattleTransition();
    if (TRANSITION_STRUCT.VBlank_DMA != 0)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 320);
    REG_WININ = TRANSITION_STRUCT.WININ;
    REG_WINOUT = TRANSITION_STRUCT.WINOUT;
    REG_WIN0V = TRANSITION_STRUCT.WIN0V;
    DmaSet(0, gScanlineEffectRegBuffers[1], &REG_WIN0H, 0xA2400001);
}

#define tMugshotOpponentID  data[13]
#define tMugshotPlayerID    data[14]
#define tMugshotID          data[15]

static void Phase2Task_Transition_Sydney(u8 taskID)
{
    gTasks[taskID].tMugshotID = MUGSHOT_SYDNEY;
    Phase2Task_MugShotTransition(taskID);
}

static void Phase2Task_Transition_Phoebe(u8 taskID)
{
    gTasks[taskID].tMugshotID = MUGSHOT_PHOEBE;
    Phase2Task_MugShotTransition(taskID);
}

static void Phase2Task_Transition_Glacia(u8 taskID)
{
    gTasks[taskID].tMugshotID = MUGSHOT_GLACIA;
    Phase2Task_MugShotTransition(taskID);
}

static void Phase2Task_Transition_Drake(u8 taskID)
{
    gTasks[taskID].tMugshotID = MUGSHOT_DRAKE;
    Phase2Task_MugShotTransition(taskID);
}

static void Phase2Task_Transition_Steven(u8 taskID)
{
    gTasks[taskID].tMugshotID = MUGSHOT_STEVEN;
    Phase2Task_MugShotTransition(taskID);
}

static void Phase2Task_MugShotTransition(u8 taskID)
{
    while (sPhase2_Mugshot_Transition_Funcs[gTasks[taskID].tState](&gTasks[taskID]));
}

static bool8 Phase2_Mugshot_Func1(struct Task* task)
{
    u8 i;

    sub_811D658();
    ScanlineEffect_Clear();
    Mugshots_CreateOpponentPlayerSprites(task);

    task->data[1] = 0;
    task->data[2] = 1;
    task->data[3] = 239;
    TRANSITION_STRUCT.WININ = 63;
    TRANSITION_STRUCT.WINOUT = 62;
    TRANSITION_STRUCT.WIN0V = 160;

    for (i = 0; i < 160; i++)
    {
        gScanlineEffectRegBuffers[1][i] = 0xF0F1;
    }

    SetVBlankCallback(VBlankCB0_Phase2_Mugshots);

    task->tState++;
    return FALSE;
}

static bool8 Phase2_Mugshot_Func2(struct Task* task)
{
    s16 i, j;
    u16 *dst1, *dst2;
    const u16* MugshotsMap;

    MugshotsMap = sMugshotsTilemap;
    sub_811D6A8(&dst1, &dst2);
    CpuSet(sUnknown_083FC348, dst2, 0xF0);
    LoadPalette(sOpponentMugshotsPals[task->tMugshotID], 0xF0, 0x20);
    LoadPalette(sPlayerMugshotsPals[gSaveBlock2.playerGender], 0xFA, 0xC);

    for (i = 0; i < 20; i++)
    {
        for (j = 0; j < 32; j++, MugshotsMap++)
        {
            dst1[i * 32 + j] = *MugshotsMap | 0xF000;
        }
    }

    REG_IE |= INTR_FLAG_HBLANK;
    REG_DISPSTAT |= DISPSTAT_HBLANK_INTR;
    SetHBlankCallback(HBlankCB_Phase2_Mugshots);
    task->tState++;
    return FALSE;
}

static bool8 Phase2_Mugshot_Func3(struct Task* task)
{
    u8 i, r5;
    u16* toStore;
    s16 value;
    s32 mergedValue;

    TRANSITION_STRUCT.VBlank_DMA = 0;

    toStore = gScanlineEffectRegBuffers[0];
    r5 = task->data[1];
    task->data[1] += 0x10;

    for (i = 0; i < 80; i++, toStore++, r5 += 0x10)
    {
        value = task->data[2] + Sin(r5, 0x10);
        if (value < 0)
            value = 1;
        if (value > 0xF0)
            value = 0xF0;
        *toStore = value;
    }
    for (; i < 160; i++, toStore++, r5 += 0x10)
    {
        value = task->data[3] - Sin(r5, 0x10);
        if (value < 0)
            value = 0;
        if (value > 0xEF)
            value = 0xEF;
        *toStore = (value << 8) | (0xF0);
    }

    task->data[2] += 8;
    task->data[3] -= 8;
    if (task->data[2] > 0xF0)
        task->data[2] = 0xF0;
    if (task->data[3] < 0)
        task->data[3] = 0;
    mergedValue = *(s32*)(&task->data[2]);
    if (mergedValue == 0xF0)
        task->tState++;

    TRANSITION_STRUCT.field_18 -= 8;
    TRANSITION_STRUCT.field_1A += 8;
    TRANSITION_STRUCT.VBlank_DMA++;
    return FALSE;
}

static bool8 Phase2_Mugshot_Func4(struct Task* task)
{
    u8 i;
    u16* toStore;

    TRANSITION_STRUCT.VBlank_DMA = 0;

    for (i = 0, toStore = gScanlineEffectRegBuffers[0]; i < 160; i++, toStore++)
    {
        *toStore = 0xF0;
    }

    task->tState++;
    task->data[1] = 0;
    task->data[2] = 0;
    task->data[3] = 0;
    TRANSITION_STRUCT.field_18 -= 8;
    TRANSITION_STRUCT.field_1A += 8;

    sub_811CA10(task->tMugshotOpponentID, 0);
    sub_811CA10(task->tMugshotPlayerID, 1);
    sub_811CA28(task->tMugshotOpponentID);

    PlaySE(SE_BT_START);

    TRANSITION_STRUCT.VBlank_DMA++;
    return FALSE;
}

static bool8 Phase2_Mugshot_Func5(struct Task* task)
{
    TRANSITION_STRUCT.field_18 -= 8;
    TRANSITION_STRUCT.field_1A += 8;
    if (sub_811CA44(task->tMugshotOpponentID))
    {
        task->tState++;
        sub_811CA28(task->tMugshotPlayerID);
    }
    return FALSE;
}

static bool8 Phase2_Mugshot_Func6(struct Task* task)
{
    TRANSITION_STRUCT.field_18 -= 8;
    TRANSITION_STRUCT.field_1A += 8;
    if (sub_811CA44(task->tMugshotPlayerID))
    {
        TRANSITION_STRUCT.VBlank_DMA = 0;
        SetVBlankCallback(NULL);
        DmaStop(0);
        memset(gScanlineEffectRegBuffers[0], 0, 0x140);
        memset(gScanlineEffectRegBuffers[1], 0, 0x140);
        REG_WIN0H = 0xF0;
        REG_BLDY = 0;
        task->tState++;
        task->data[3] = 0;
        task->data[4] = 0;
        TRANSITION_STRUCT.BLDCNT = 0xBF;
        SetVBlankCallback(VBlankCB1_Phase2_Mugshots);
    }
    return FALSE;
}

static bool8 Phase2_Mugshot_Func7(struct Task* task)
{
    bool32 r6;

    TRANSITION_STRUCT.VBlank_DMA = 0;
    r6 = TRUE;
    TRANSITION_STRUCT.field_18 -= 8;
    TRANSITION_STRUCT.field_1A += 8;

    if (task->data[4] < 0x50)
        task->data[4] += 2;
    if (task->data[4] > 0x50)
        task->data[4] = 0x50;

    if (++task->data[3] & 1)
    {
        s16 i;
        for (i = 0, r6 = FALSE; i <= task->data[4]; i++)
        {
            s16 index1 = 0x50 - i;
            s16 index2 = 0x50 + i;
            if (gScanlineEffectRegBuffers[0][index1] <= 15)
            {
                r6 = TRUE;
                gScanlineEffectRegBuffers[0][index1]++;
            }
            if (gScanlineEffectRegBuffers[0][index2] <= 15)
            {
                r6 = TRUE;
                gScanlineEffectRegBuffers[0][index2]++;
            }
        }
    }

    if (task->data[4] == 0x50 && !r6)
        task->tState++;

    TRANSITION_STRUCT.VBlank_DMA++;
    return FALSE;
}

static bool8 Phase2_Mugshot_Func8(struct Task* task)
{
    TRANSITION_STRUCT.VBlank_DMA = 0;
    BlendPalettes(0xFFFFFFFF, 16, RGB(31, 31, 31));
    TRANSITION_STRUCT.BLDCNT = 0xFF;
    task->data[3] = 0;

    task->tState++;
    return TRUE;
}

static bool8 Phase2_Mugshot_Func9(struct Task* task)
{
    TRANSITION_STRUCT.VBlank_DMA = 0;

    task->data[3]++;
    memset(gScanlineEffectRegBuffers[0], task->data[3], 0x140);
    if (task->data[3] > 15)
        task->tState++;

    TRANSITION_STRUCT.VBlank_DMA++;
    return FALSE;
}

static bool8 Phase2_Mugshot_Func10(struct Task* task)
{
    DmaStop(0);
    sub_811D6D4();
    DestroyTask(FindTaskIdByFunc(task->func));
    return FALSE;
}

static void VBlankCB0_Phase2_Mugshots(void)
{
    DmaStop(0);
    VBlankCB_BattleTransition();
    if (TRANSITION_STRUCT.VBlank_DMA != 0)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 320);
    REG_BG0VOFS = TRANSITION_STRUCT.field_1C;
    REG_WININ = TRANSITION_STRUCT.WININ;
    REG_WINOUT = TRANSITION_STRUCT.WINOUT;
    REG_WIN0V = TRANSITION_STRUCT.WIN0V;
    DmaSet(0, gScanlineEffectRegBuffers[1], &REG_WIN0H, 0xA2400001);
}

static void VBlankCB1_Phase2_Mugshots(void)
{
    DmaStop(0);
    VBlankCB_BattleTransition();
    if (TRANSITION_STRUCT.VBlank_DMA != 0)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 320);
    REG_BLDCNT = TRANSITION_STRUCT.BLDCNT;
    DmaSet(0, gScanlineEffectRegBuffers[1], &REG_BLDY, 0xA2400001);
}

static void HBlankCB_Phase2_Mugshots(void)
{
    if (REG_VCOUNT < 80)
        REG_BG0HOFS = TRANSITION_STRUCT.field_18;
    else
        REG_BG0HOFS = TRANSITION_STRUCT.field_1A;
}

static void Mugshots_CreateOpponentPlayerSprites(struct Task* task)
{
    struct Sprite *opponentSprite, *playerSprite;

    s16 mugshotID = task->tMugshotID;
    task->tMugshotOpponentID = CreateTrainerSprite(sMugshotsTrainerPicIDsTable[mugshotID],
                                                     sMugshotsOpponentCoords[mugshotID][0] - 32,
                                                     sMugshotsOpponentCoords[mugshotID][1] + 42,
                                                     0, ewramC03C);
    task->tMugshotPlayerID = CreateTrainerSprite(gSaveBlock2.playerGender, 272, 106, 0, ewramC03C);

    opponentSprite = &gSprites[task->tMugshotOpponentID];
    playerSprite = &gSprites[task->tMugshotPlayerID];

    opponentSprite->callback = sub_811C90C;
    playerSprite->callback = sub_811C90C;

    opponentSprite->oam.affineMode = 3;
    playerSprite->oam.affineMode = 3;

    opponentSprite->oam.matrixNum = AllocOamMatrix();
    playerSprite->oam.matrixNum = AllocOamMatrix();

    opponentSprite->oam.shape = 1;
    playerSprite->oam.shape = 1;

    opponentSprite->oam.size = 3;
    playerSprite->oam.size = 3;

    CalcCenterToCornerVec(opponentSprite, 1, 3, 3);
    CalcCenterToCornerVec(playerSprite, 1, 3, 3);

    SetOamMatrixRotationScaling(opponentSprite->oam.matrixNum, sMugshotsOpponentRotationScales[mugshotID][0], sMugshotsOpponentRotationScales[mugshotID][1], 0);
    SetOamMatrixRotationScaling(playerSprite->oam.matrixNum, -512, 0x200, 0);
}

static void sub_811C90C(struct Sprite* sprite)
{
    while (sUnknown_083FD880[sprite->data[0]](sprite));
}

static bool8 sub_811C934(struct Sprite* sprite)
{
    return FALSE;
}

static bool8 sub_811C938(struct Sprite* sprite)
{
    s16 arr0[2];
    s16 arr1[2];

    memcpy(arr0, sUnknown_083FD89C, sizeof(sUnknown_083FD89C));
    memcpy(arr1, sUnknown_083FD8A0, sizeof(sUnknown_083FD8A0));

    sprite->data[0]++;
    sprite->data[1] = arr0[sprite->data[7]];
    sprite->data[2] = arr1[sprite->data[7]];
    return TRUE;
}

static bool8 sub_811C984(struct Sprite* sprite)
{
    sprite->pos1.x += sprite->data[1];
    if (sprite->data[7] && sprite->pos1.x < 133)
        sprite->data[0]++;
    else if (!sprite->data[7] && sprite->pos1.x > 103)
        sprite->data[0]++;
    return FALSE;
}

static bool8 sub_811C9B8(struct Sprite* sprite)
{
    sprite->data[1] += sprite->data[2];
    sprite->pos1.x += sprite->data[1];
    if (sprite->data[1] == 0)
    {
        sprite->data[0]++;
        sprite->data[2] = -sprite->data[2];
        sprite->data[6] = 1;
    }
    return FALSE;
}

static bool8 sub_811C9E4(struct Sprite* sprite)
{
    sprite->data[1] += sprite->data[2];
    sprite->pos1.x += sprite->data[1];
    if (sprite->pos1.x < -31 || sprite->pos1.x > 271)
        sprite->data[0]++;
    return FALSE;
}

static void sub_811CA10(s16 spriteID, s16 value)
{
    gSprites[spriteID].data[7] = value;
}

static void sub_811CA28(s16 spriteID)
{
    gSprites[spriteID].data[0]++;
}

static s16 sub_811CA44(s16 spriteID)
{
    return gSprites[spriteID].data[6];
}

#undef tMugshotOpponentID
#undef tMugshotPlayerID
#undef tMugshotID

static void Phase2Task_Transition_Slice(u8 taskID)
{
    while (sPhase2_Transition_Slice_Funcs[gTasks[taskID].tState](&gTasks[taskID]));
}

static bool8 Phase2_Transition_Slice_Func1(struct Task* task)
{
    u16 i;

    sub_811D658();
    ScanlineEffect_Clear();

    task->data[2] = 256;
    task->data[3] = 1;
    TRANSITION_STRUCT.WININ = 63;
    TRANSITION_STRUCT.WINOUT = 0;
    TRANSITION_STRUCT.WIN0V = 160;

    for (i = 0; i < 160; i++)
    {
        gScanlineEffectRegBuffers[1][i] = TRANSITION_STRUCT.field_14;
        gScanlineEffectRegBuffers[1][160 + i] = 0xF0;
    }

    REG_IE |= INTR_FLAG_HBLANK;
    REG_DISPSTAT |= DISPSTAT_HBLANK_INTR;

    SetVBlankCallback(VBlankCB_Phase2_Transition_Slice);
    SetHBlankCallback(HBlankCB_Phase2_Transition_Slice);

    task->tState++;
    return TRUE;
}

static bool8 Phase2_Transition_Slice_Func2(struct Task* task)
{
    u16 i;

    TRANSITION_STRUCT.VBlank_DMA = 0;

    task->data[1] += (task->data[2] >> 8);
    if (task->data[1] > 0xF0)
        task->data[1] = 0xF0;
    if (task->data[2] <= 0xFFF)
        task->data[2] += task->data[3];
    if (task->data[3] < 128)
        task->data[3] <<= 1; // multiplying by two

    for (i = 0; i < 160; i++)
    {
        u16* storeLoc1 = &gScanlineEffectRegBuffers[0][i];
        u16* storeLoc2 = &gScanlineEffectRegBuffers[0][i + 160];
        if (1 & i)
        {
            *storeLoc1 = TRANSITION_STRUCT.field_14 + task->data[1];
            *storeLoc2 = 0xF0 - task->data[1];
        }
        else
        {
            *storeLoc1 = TRANSITION_STRUCT.field_14 - task->data[1];
            *storeLoc2 = (task->data[1] << 8) | (0xF1);
        }
    }

    if (task->data[1] > 0xEF)
        task->tState++;

    TRANSITION_STRUCT.VBlank_DMA++;
    return FALSE;
}

static bool8 Phase2_Transition_Slice_Func3(struct Task* task)
{
    DmaStop(0);
    sub_811D6D4();
    DestroyTask(FindTaskIdByFunc(Phase2Task_Transition_Slice));
    return FALSE;
}

static void VBlankCB_Phase2_Transition_Slice(void)
{
    DmaStop(0);
    VBlankCB_BattleTransition();
    REG_WININ = TRANSITION_STRUCT.WININ;
    REG_WINOUT = TRANSITION_STRUCT.WINOUT;
    REG_WIN0V = TRANSITION_STRUCT.WIN0V;
    if (TRANSITION_STRUCT.VBlank_DMA)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 640);
    DmaSet(0, &gScanlineEffectRegBuffers[1][160], &REG_WIN0H, 0xA2400001);
}

static void HBlankCB_Phase2_Transition_Slice(void)
{
    u16 var = gScanlineEffectRegBuffers[1][REG_VCOUNT];
    REG_BG1HOFS = var;
    REG_BG2HOFS = var;
    REG_BG3HOFS = var;
}

static void Phase2Task_Transition_WhiteFade(u8 taskID)
{
    while (sPhase2_Transition_WhiteFade_Funcs[gTasks[taskID].tState](&gTasks[taskID]));
}

static bool8 Phase2_Transition_WhiteFade_Func1(struct Task* task)
{
    u16 i;

    sub_811D658();
    ScanlineEffect_Clear();

    TRANSITION_STRUCT.BLDCNT = 0xBF;
    TRANSITION_STRUCT.BLDY = 0;
    TRANSITION_STRUCT.WININ = 0x1E;
    TRANSITION_STRUCT.WINOUT = 0x3F;
    TRANSITION_STRUCT.WIN0V = 0xA0;

    for (i = 0; i < 160; i++)
    {
        gScanlineEffectRegBuffers[1][i] = 0;
        gScanlineEffectRegBuffers[1][i + 160] = 0xF0;
    }

    REG_IE |= INTR_FLAG_HBLANK;
    REG_DISPSTAT |= DISPSTAT_HBLANK_INTR;

    SetHBlankCallback(HBlankCB_Phase2_Transition_WhiteFade);
    SetVBlankCallback(VBlankCB0_Phase2_Transition_WhiteFade);

    task->tState++;
    return FALSE;
}

static bool8 Phase2_Transition_WhiteFade_Func2(struct Task* task)
{
    s16 i, posY;
    s16 arr1[8];
    struct Sprite* sprite;

    memcpy(arr1, sUnknown_083FD8C4, sizeof(sUnknown_083FD8C4));
    for (i = 0, posY = 0; i < 8; i++, posY += 0x14)
    {
        sprite = &gSprites[CreateInvisibleSprite(sub_811CFD0)];
        sprite->pos1.x = 0xF0;
        sprite->pos1.y = posY;
        sprite->data[5] = arr1[i];
    }
    sprite->data[6]++;

    task->tState++;
    return FALSE;
}

static bool8 Phase2_Transition_WhiteFade_Func3(struct Task* task)
{
    TRANSITION_STRUCT.VBlank_DMA = 0;
    if (TRANSITION_STRUCT.field_20 > 7)
    {
        BlendPalettes(0xFFFFFFFF, 16, RGB(31, 31, 31));
        task->tState++;
    }
    return FALSE;
}

static bool8 Phase2_Transition_WhiteFade_Func4(struct Task* task)
{
    TRANSITION_STRUCT.VBlank_DMA = 0;

    DmaStop(0);
    SetVBlankCallback(0);
    SetHBlankCallback(0);

    TRANSITION_STRUCT.field_6 = 0xF0;
    TRANSITION_STRUCT.BLDY = 0;
    TRANSITION_STRUCT.BLDCNT = 0xFF;
    TRANSITION_STRUCT.WININ = 0x3F;

    SetVBlankCallback(VBlankCB1_Phase2_Transition_WhiteFade);

    task->tState++;
    return FALSE;
}

static bool8 Phase2_Transition_WhiteFade_Func5(struct Task* task)
{
   if (++TRANSITION_STRUCT.BLDY > 16)
   {
       sub_811D6D4();
       DestroyTask(FindTaskIdByFunc(Phase2Task_Transition_WhiteFade));
   }
   return FALSE;
}

static void VBlankCB0_Phase2_Transition_WhiteFade(void)
{
    DmaStop(0);
    VBlankCB_BattleTransition();
    REG_BLDCNT = TRANSITION_STRUCT.BLDCNT;
    REG_WININ = TRANSITION_STRUCT.WININ;
    REG_WINOUT = TRANSITION_STRUCT.WINOUT;
    REG_WIN0V = TRANSITION_STRUCT.field_6;
    if (TRANSITION_STRUCT.VBlank_DMA)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 640);
    DmaSet(0, &gScanlineEffectRegBuffers[1][160], &REG_WIN0H, 0xA2400001);
}

static void VBlankCB1_Phase2_Transition_WhiteFade(void)
{
    VBlankCB_BattleTransition();
    REG_BLDY = TRANSITION_STRUCT.BLDY;
    REG_BLDCNT = TRANSITION_STRUCT.BLDCNT;
    REG_WININ = TRANSITION_STRUCT.WININ;
    REG_WINOUT = TRANSITION_STRUCT.WINOUT;
    REG_WIN0H = TRANSITION_STRUCT.field_6;
    REG_WIN0V = TRANSITION_STRUCT.WIN0V;
}

static void HBlankCB_Phase2_Transition_WhiteFade(void)
{
    REG_BLDY = gScanlineEffectRegBuffers[1][REG_VCOUNT];
}

static void sub_811CFD0(struct Sprite* sprite)
{
    if (sprite->data[5])
    {
        sprite->data[5]--;
        if (sprite->data[6])
            TRANSITION_STRUCT.VBlank_DMA = 1;
    }
    else
    {
        u16 i;
        u16* ptr1 = &gScanlineEffectRegBuffers[0][sprite->pos1.y];
        u16* ptr2 = &gScanlineEffectRegBuffers[0][sprite->pos1.y + 160];
        for (i = 0; i < 20; i++)
        {
            ptr1[i] = sprite->data[0] >> 8;
            ptr2[i] = (u8)(sprite->pos1.x);
        }
        if (sprite->pos1.x == 0 && sprite->data[0] == 0x1000)
            sprite->data[1] = 1;

        sprite->pos1.x -= 16;
        sprite->data[0] += 0x80;

        if (sprite->pos1.x < 0)
            sprite->pos1.x = 0;
        if (sprite->data[0] > 0x1000)
            sprite->data[0] = 0x1000;

        if (sprite->data[6])
            TRANSITION_STRUCT.VBlank_DMA = 1;

        if (sprite->data[1])
        {
            if (sprite->data[6] == 0 || (TRANSITION_STRUCT.field_20 > 6 && sprite->data[2]++ > 7))
            {
                TRANSITION_STRUCT.field_20++;
                DestroySprite(sprite);
            }
        }
    }
}

static void Phase2Task_Transition_GridSquares(u8 taskID)
{
    while (sPhase2_Transition_GridSquares_Funcs[gTasks[taskID].tState](&gTasks[taskID]));
}

static bool8 Phase2_Transition_GridSquares_Func1(struct Task* task)
{
    u16 *dst1, *dst2;

    sub_811D6A8(&dst1, &dst2);
    CpuSet(sShrinkingBoxTileset, dst2, 0x10);
    CpuFill16(0xF000, dst1, 0x800);
    LoadPalette(gFieldEffectObjectPalette10, 0xF0, 0x20);

    task->tState++;
    return FALSE;
}

static bool8 Phase2_Transition_GridSquares_Func2(struct Task* task)
{
    u16* dst1;

    if (task->data[1] == 0)
    {
        sub_811D690(&dst1);
        task->data[1] = 3;
        task->data[2]++;
        CpuSet(sShrinkingBoxTileset + (task->data[2] * 8), dst1, 0x10);
        if (task->data[2] > 0xD)
        {
            task->tState++;
            task->data[1] = 16;
        }
    }

    task->data[1]--;
    return FALSE;
}

static bool8 Phase2_Transition_GridSquares_Func3(struct Task* task)
{
    if (--task->data[1] == 0)
    {
        sub_811D6D4();
        DestroyTask(FindTaskIdByFunc(Phase2Task_Transition_GridSquares));
    }
    return FALSE;
}

static void Phase2Task_Transition_Shards(u8 taskID)
{
    while (sPhase2_Transition_Shards_Funcs[gTasks[taskID].tState](&gTasks[taskID]));
}

static bool8 Phase2_Transition_Shards_Func1(struct Task* task)
{
    u16 i;

    sub_811D658();
    ScanlineEffect_Clear();

    TRANSITION_STRUCT.WININ = 0x3F;
    TRANSITION_STRUCT.WINOUT = 0;
    TRANSITION_STRUCT.WIN0V = 0xA0;

    for (i = 0; i < 160; i++)
    {
        gScanlineEffectRegBuffers[0][i] = 0xF0;
    }

    CpuSet(gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 0xA0);
    SetVBlankCallback(VBlankCB_Phase2_Transition_Shards);

    task->tState++;
    return TRUE;
}

static bool8 Phase2_Transition_Shards_Func2(struct Task* task)
{
    sub_811D8FC(TRANSITION_STRUCT.data,
                sUnknown_083FD8F4[task->data[1]][0],
                sUnknown_083FD8F4[task->data[1]][1],
                sUnknown_083FD8F4[task->data[1]][2],
                sUnknown_083FD8F4[task->data[1]][3],
                1, 1);
    task->data[2] = sUnknown_083FD8F4[task->data[1]][4];
    task->tState++;
    return TRUE;
}

static bool8 Phase2_Transition_Shards_Func3(struct Task* task)
{
    s16 i;
    bool8 nextFunc;

    TRANSITION_STRUCT.VBlank_DMA = 0;

    for (i = 0, nextFunc = FALSE; i < 16; i++)
    {
        s16 r3 = gScanlineEffectRegBuffers[0][TRANSITION_STRUCT.data[3]] >> 8;
        s16 r4 = gScanlineEffectRegBuffers[0][TRANSITION_STRUCT.data[3]] & 0xFF;
        if (task->data[2] == 0)
        {
            if (r3 < TRANSITION_STRUCT.data[2])
                r3 = TRANSITION_STRUCT.data[2];
            if (r3 > r4)
                r3 = r4;
        }
        else
        {
            if (r4 > TRANSITION_STRUCT.data[2])
                r4 = TRANSITION_STRUCT.data[2];
            if (r4 <= r3)
                r4 = r3;
        }
        gScanlineEffectRegBuffers[0][TRANSITION_STRUCT.data[3]] = (r4) | (r3 << 8);
        if (nextFunc)
        {
            task->tState++;
            break;
        }
        else
            nextFunc = sub_811D978(TRANSITION_STRUCT.data, 1, 1);
    }

    TRANSITION_STRUCT.VBlank_DMA++;
    return FALSE;
}

static bool8 Phase2_Transition_Shards_Func4(struct Task* task)
{
    if (++task->data[1] < 7)
    {
        task->tState++;
        task->data[3] = sUnknown_083FD93A[task->data[1] - 1];
        return TRUE;
    }
    else
    {
        DmaStop(0);
        sub_811D6D4();
        DestroyTask(FindTaskIdByFunc(Phase2Task_Transition_Shards));
        return FALSE;
    }
}

static bool8 Phase2_Transition_Shards_Func5(struct Task* task)
{
    if (--task->data[3] == 0)
    {
        task->tState = 1;
        return TRUE;
    }
    else
        return FALSE;
}

static void VBlankCB_Phase2_Transition_Shards(void)
{
    DmaStop(0);
    VBlankCB_BattleTransition();
    if (TRANSITION_STRUCT.VBlank_DMA)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 320);
    REG_WININ = TRANSITION_STRUCT.WININ;
    REG_WINOUT = TRANSITION_STRUCT.WINOUT;
    REG_WIN0V = TRANSITION_STRUCT.WIN0V;
    REG_WIN0H = gScanlineEffectRegBuffers[1][0];
    DmaSet(0, gScanlineEffectRegBuffers[1], &REG_WIN0H, 0xA2400001);
}

static void CreatePhase1Task(s16 a0, s16 a1, s16 a2, s16 a3, s16 a4)
{
    u8 taskID = CreateTask(Phase1_Task_RunFuncs, 3);
    gTasks[taskID].data[1] = a0;
    gTasks[taskID].data[2] = a1;
    gTasks[taskID].data[3] = a2;
    gTasks[taskID].data[4] = a3;
    gTasks[taskID].data[5] = a4;
    gTasks[taskID].data[6] = a0;
}

static bool8 sub_811D52C(void)
{
    if (FindTaskIdByFunc(Phase1_Task_RunFuncs) == 0xFF)
        return TRUE;
    else
        return FALSE;
}

static void Phase1_Task_RunFuncs(u8 taskID)
{
    while (sPhase1_TransitionAll_Funcs[gTasks[taskID].tState](&gTasks[taskID]));
}

static bool8 Phase1_TransitionAll_Func1(struct Task* task)
{
    if (task->data[6] == 0 || --task->data[6] == 0)
    {
        task->data[6] = task->data[1];
        task->data[7] += task->data[4];
        if (task->data[7] > 16)
            task->data[7] = 16;
        BlendPalettes(0xFFFFFFFF, task->data[7], RGB(11, 11, 11));
    }
    if (task->data[7] > 15)
    {
        task->tState++;
        task->data[6] = task->data[2];
    }
    return FALSE;
}

static bool8 Phase1_TransitionAll_Func2(struct Task* task)
{
    if (task->data[6] == 0 || --task->data[6] == 0)
    {
        task->data[6] = task->data[2];
        task->data[7] -= task->data[5];
        if (task->data[7] < 0)
            task->data[7] = 0;
        BlendPalettes(0xFFFFFFFF, task->data[7], RGB(11, 11, 11));
    }
    if (task->data[7] == 0)
    {
        if (--task->data[3] == 0)
            DestroyTask(FindTaskIdByFunc(Phase1_Task_RunFuncs));
        else
        {
            task->data[6] = task->data[1];
            task->tState = 0;
        }
    }
    return FALSE;
}

static void sub_811D658(void)
{
    struct TransitionData* const* dummy = &sTransitionStructPtr;
    memset(*dummy, 0, sizeof(struct TransitionData));
    sub_8057B14(&TRANSITION_STRUCT.field_14, &TRANSITION_STRUCT.field_16);
}

static void VBlankCB_BattleTransition(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void sub_811D690(u16** a0)
{
    u16 reg, *vram;

    reg = REG_BG0CNT >> 2;
    reg <<= 0xE;
    vram = (u16*)(VRAM + reg);

    *a0 = vram;
}

static void sub_811D6A8(u16** a0, u16** a1)
{
    u16 reg0, reg1, *vram0, *vram1;

    reg0 = REG_BG0CNT >> 8;
    reg1 = REG_BG0CNT >> 2;

    reg0 <<= 0xB;
    reg1 <<= 0xE;

    vram0 = (u16*)(VRAM + reg0);
    *a0 = vram0;

    vram1 = (u16*)(VRAM + reg1);
    *a1 = vram1;
}

static void sub_811D6D4(void)
{
    BlendPalettes(0xFFFFFFFF, 16, RGB(0, 0, 0));
}

static void sub_811D6E8(s16* array, s16 sinAdd, s16 index, s16 indexIncrementer, s16 amplitude, s16 arrSize)
{
    u8 i;
    for (i = 0; arrSize > 0; arrSize--, i++, index += indexIncrementer)
    {
        array[i] = sinAdd + Sin(0xFF & index, amplitude);
    }
}

static void sub_811D764(u16* array, s16 a1, s16 a2, s16 a3)
{
    s16 i;

    memset(array, 0xA, 160 * sizeof(s16));
    for (i = 0; i < 64; i++)
    {
        s16 sinResult, cosResult;
        s16 toStoreOrr, r2, r3, toStore, r7, r8;

        sinResult = Sin(i, a3);
        cosResult = Cos(i, a3);

        toStoreOrr = a1 - sinResult;
        toStore = a1 + sinResult;
        r7 = a2 - cosResult;
        r8 = a2 + cosResult;

        if (toStoreOrr < 0)
            toStoreOrr = 0;
        if (toStore > 0xF0)
            toStore = 0xF0;
        if (r7 < 0)
            r7 = 0;
        if (r8 > 0x9F)
            r8 = 0x9F;

        toStore |= (toStoreOrr << 8);
        array[r7] = toStore;
        array[r8] = toStore;

        cosResult = Cos(i + 1, a3);
        r3 = a2 - cosResult;
        r2 = a2 + cosResult;

        if (r3 < 0)
            r3 = 0;
        if (r2 > 0x9F)
            r2 = 0x9F;

        while (r7 > r3)
            array[--r7] = toStore;
        while (r7 < r3)
            array[++r7] = toStore;

        while (r8 > r2)
            array[--r8] = toStore;
        while (r8 < r2)
            array[++r8] = toStore;
    }
}

static void sub_811D8FC(s16* data, s16 a1, s16 a2, s16 a3, s16 a4, s16 a5, s16 a6)
{
    data[0] = a1;
    data[1] = a2;
    data[2] = a1;
    data[3] = a2;
    data[4] = a3;
    data[5] = a4;
    data[6] = a5;
    data[7] = a6;
    data[8] = a3 - a1;
    if (data[8] < 0)
    {
        data[8] = -data[8];
        data[6] = -a5;
    }
    data[9] = a4 - a2;
    if (data[9] < 0)
    {
        data[9] = -data[9];
        data[7] = -a6;
    }
    data[10] = 0;
}

static bool8 sub_811D978(s16* data, bool8 a1, bool8 a2)
{
    u8 var;
    if (data[8] > data[9])
    {
        data[2] += data[6];
        data[10] += data[9];
        if (data[10] > data[8])
        {
            data[3] += data[7];
            data[10] -= data[8];
        }
    }
    else
    {
        data[3] += data[7];
        data[10] += data[8];
        if (data[10] > data[9])
        {
            data[2] += data[6];
            data[10] -= data[9];
        }
    }
    var = 0;
    if ((data[6] > 0 && data[2] >= data[4]) || (data[6] < 0 && data[2] <= data[4]))
    {
        var++;
        if (a1)
            data[2] = data[4];
    }
    if ((data[7] > 0 && data[3] >= data[5]) || (data[7] < 0 && data[3] <= data[5]))
    {
        var++;
        if (a2)
            data[3] = data[5];
    }
    if (var == 2)
        return TRUE;
    else
        return FALSE;
}
