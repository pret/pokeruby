#include "global.h"
#include "data2.h"
#include "decompress.h"
#include "decoration.h"
#include "event_object_movement.h"
#include "field_camera.h"
#include "field_control_avatar.h"
#include "field_effect.h"
#include "field_effect_helpers.h"
#include "field_fadetransition.h"
#include "field_player_avatar.h"
#include "field_weather.h"
#include "fieldmap.h"
#include "main.h"
#include "menu.h"
#include "metatile_behavior.h"
#include "overworld.h"
#include "palette.h"
#include "pokemon_storage_system.h"
#include "script.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "text.h"
#include "trig.h"
#include "util.h"
#include "constants/event_object_movement.h"
#include "constants/field_effects.h"
#include "constants/songs.h"

#define subsprite_table(ptr) {.subsprites = ptr, .subspriteCount = (sizeof ptr) / (sizeof(struct Subsprite))}

EWRAM_DATA s32 gFieldEffectArguments[8] = {0};

const u32 gSpriteImage_839DC14[] = INCBIN_U32("graphics/birch_speech/birch.4bpp");
const u16 gBirchPalette[16] = INCBIN_U16("graphics/birch_speech/birch.gbapal");
const u32 gSpriteImage_839E434[] = INCBIN_U32("graphics/misc/pokeball_glow.4bpp");
const u16 gFieldEffectObjectPalette4[16] = INCBIN_U16("graphics/field_effect_objects/palettes/04.gbapal");
const u32 gSpriteImage_839E474[] = INCBIN_U32("graphics/misc/pokecenter_monitor/0.4bpp");
const u32 gSpriteImage_839E534[] = INCBIN_U32("graphics/misc/pokecenter_monitor/1.4bpp");
const u32 gSpriteImage_839E5F4[] = INCBIN_U32("graphics/misc/big_hof_monitor.4bpp");
const u8 gSpriteImage_839E7F4[] = INCBIN_U8("graphics/misc/small_hof_monitor.4bpp");
const u16 gFieldEffectObjectPalette5[16] = INCBIN_U16("graphics/field_effect_objects/palettes/05.gbapal");

// Graphics for the lights streaking past your Pokemon when it uses a field move.
const u32 sFieldMoveStreaksOutdoors_Gfx[] = INCBIN_U32("graphics/misc/field_move_streaks.4bpp");
const u16 gFieldMoveStreaksPalette[16] = INCBIN_U16("graphics/misc/field_move_streaks.gbapal");
const u16 sFieldMoveStreaksOutdoors_Tilemap[] = INCBIN_U16("graphics/misc/field_move_streaks_map.bin");

// The following light streaks effect is used when the map is dark (e.g. a cave).
const u32 gDarknessFieldMoveStreaksTiles[] = INCBIN_U32("graphics/misc/darkness_field_move_streaks.4bpp");
const u16 gDarknessFieldMoveStreaksPalette[16] = INCBIN_U16("graphics/misc/darkness_field_move_streaks.gbapal");
const u16 gDarknessFieldMoveStreaksTilemap[] = INCBIN_U16("graphics/misc/darkness_field_move_streaks_map.bin");

bool8 (*const gFieldEffectScriptFuncs[])(u8 **, u32 *) = {
    FieldEffectCmd_loadtiles,
    FieldEffectCmd_loadfadedpal,
    FieldEffectCmd_loadpal,
    FieldEffectCmd_callnative,
    FieldEffectCmd_end,
    FieldEffectCmd_loadgfx_callnative,
    FieldEffectCmd_loadtiles_callnative,
    FieldEffectCmd_loadfadedpal_callnative,
};

const struct OamData gOamData_839F0F4 = {.size = 3};
const struct OamData gOamData_839F0FC = {.size = 0};
const struct OamData gOamData_839F104 = {.size = 1};

const struct SpriteFrameImage gSpriteImageTable_839F10C[] = {
    obj_frame_tiles(gSpriteImage_839DC14)
};
const struct SpritePalette gUnknown_0839F114 = {.data = gBirchPalette, .tag = 0x1006};

const union AnimCmd gSpriteAnim_839F11C[] = {
    ANIMCMD_FRAME(.imageValue = 0, .duration = 1),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_839F124[] = {
    gSpriteAnim_839F11C
};

const struct SpriteTemplate gSpriteTemplate_839F128 = {
    .tileTag = 0xffff,
    .paletteTag = 4102,
    .oam = &gOamData_839F0F4,
    .anims = (const union AnimCmd *const *)&gSpriteAnimTable_839F124,
    .images = gSpriteImageTable_839F10C,
    .affineAnims = (const union AffineAnimCmd *const *)&gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

const struct SpritePalette gFieldEffectObjectPaletteInfo4 = {.data = gFieldEffectObjectPalette4, .tag = 0x1007};
const struct SpritePalette gFieldEffectObjectPaletteInfo5 = {.data = gFieldEffectObjectPalette5, .tag = 0x1010};
const struct OamData gOamData_839F150 = {
    .shape = 1,
    .size = 2
};

const struct SpriteFrameImage gSpriteImageTable_839F158[] = {
    obj_frame_tiles(gSpriteImage_839E434)
};

const struct SpriteFrameImage gSpriteImageTable_839F160[] = {
    obj_frame_tiles(gSpriteImage_839E474),
    obj_frame_tiles(gSpriteImage_839E534)
};

const struct SpriteFrameImage gSpriteImageTable_839F170[] = {
    obj_frame_tiles(gSpriteImage_839E5F4)
};

const struct SpriteFrameImage gSpriteImageTable_839F178[] = {
    {.data = gSpriteImage_839E7F4, .size = 0x200} // the macro breaks down here
};

const struct Subsprite Unknown_39F180[] = {
    {.x = -12, .y = -8, .priority = 2, .tileOffset = 0, .shape = 1, .size = 0},
    {.x =   4, .y = -8, .priority = 2, .tileOffset = 2, .shape = 0, .size = 0},
    {.x = -12, .y =  0, .priority = 2, .tileOffset = 3, .shape = 1, .size = 0},
    {.x =   4, .y =  0, .priority = 2, .tileOffset = 5, .shape = 0, .size = 0}
};

const struct SubspriteTable gUnknown_0839F1A0 = subsprite_table(Unknown_39F180);

const struct Subsprite Unknown_39F1A8[] = {
    {.x = -32, .y = -8, .priority = 2, .tileOffset =  0, .shape = 1, .size = 1},
    {.x =   0, .y = -8, .priority = 2, .tileOffset =  4, .shape = 1, .size = 1},
    {.x = -32, .y =  0, .priority = 2, .tileOffset =  8, .shape = 1, .size = 1},
    {.x =   0, .y =  0, .priority = 2, .tileOffset = 12, .shape = 1, .size = 1}
};

const struct SubspriteTable gUnknown_0839F1C8 = subsprite_table(Unknown_39F1A8);

const union AnimCmd gSpriteAnim_839F1D0[] = {
    ANIMCMD_FRAME(.imageValue = 0, .duration = 1),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gSpriteAnim_839F1D8[] = {
    ANIMCMD_FRAME(.imageValue = 0, .duration = 16),
    ANIMCMD_FRAME(.imageValue = 1, .duration = 16),
    ANIMCMD_FRAME(.imageValue = 0, .duration = 16),
    ANIMCMD_FRAME(.imageValue = 1, .duration = 16),
    ANIMCMD_FRAME(.imageValue = 0, .duration = 16),
    ANIMCMD_FRAME(.imageValue = 1, .duration = 16),
    ANIMCMD_FRAME(.imageValue = 0, .duration = 16),
    ANIMCMD_FRAME(.imageValue = 1, .duration = 16),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_839F1FC[] = {
    gSpriteAnim_839F1D0,
    gSpriteAnim_839F1D8
};

const union AnimCmd *const gSpriteAnimTable_839F204[] = {
    gSpriteAnim_839F1D0
};

const struct SpriteTemplate gSpriteTemplate_839F208 = {
    .tileTag = 0xffff,
    .paletteTag = 4103,
    .oam = &gOamData_839F0FC,
    .anims = gSpriteAnimTable_839F1FC,
    .images = gSpriteImageTable_839F158,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_PokeballGlow
};


const struct SpriteTemplate gSpriteTemplate_839F220 = {
    .tileTag = 0xffff,
    .paletteTag = 4100,
    .oam = &gOamData_839F104,
    .anims = gSpriteAnimTable_839F1FC,
    .images = gSpriteImageTable_839F160,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_PokecenterMonitor
};


const struct SpriteTemplate gSpriteTemplate_839F238 = {
    .tileTag = 0xffff,
    .paletteTag = 4112,
    .oam = &gOamData_839F104,
    .anims = gSpriteAnimTable_839F204,
    .images = gSpriteImageTable_839F170,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_HallOfFameMonitor
};


const struct SpriteTemplate gSpriteTemplate_839F250 = {
    .tileTag = 0xffff,
    .paletteTag = 4112,
    .oam = &gOamData_839F150,
    .anims = gSpriteAnimTable_839F204,
    .images = gSpriteImageTable_839F178,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_HallOfFameMonitor
};

void (*const gUnknown_0839F268[])(struct Task *) = {
    PokecenterHealEffect_0,
    PokecenterHealEffect_1,
    PokecenterHealEffect_2,
    PokecenterHealEffect_3
};

void (*const gUnknown_0839F278[])(struct Task *) = {
    HallOfFameRecordEffect_0,
    HallOfFameRecordEffect_1,
    HallOfFameRecordEffect_2,
    HallOfFameRecordEffect_3
};

void (*const gUnknown_0839F288[])(struct Sprite *) = {
    PokeballGlowEffect_0,
    PokeballGlowEffect_1,
    PokeballGlowEffect_2,
    PokeballGlowEffect_3,
    PokeballGlowEffect_4,
    PokeballGlowEffect_5,
    PokeballGlowEffect_6,
    PokeballGlowEffect_7
};

const struct Coords16 gUnknown_0839F2A8[] = {
    {.x = 0, .y = 0},
    {.x = 6, .y = 0},
    {.x = 0, .y = 4},
    {.x = 6, .y = 4},
    {.x = 0, .y = 8},
    {.x = 6, .y = 8}
};

const u8 gUnknown_0839F2C0[] = {16, 12, 8, 0};
const u8 gUnknown_0839F2C4[] = {16, 12, 8, 0};
const u8 gUnknown_0839F2C8[] = { 0,  0, 0, 0};

bool8 (*const gUnknown_0839F2CC[])(struct Task *) = {
    FallWarpEffect_Init,
    FallWarpEffect_WaitWeather,
    FallWarpEffect_StartFall,
    FallWarpEffect_Fall,
    sub_808699C,
    FallWarpEffect_CameraShake,
    FallWarpEffect_End
};

bool8 (*const sEscalatorWarpOutFieldEffectFuncs[])(struct Task *) = {
    EscalatorWarpOut_Init,
    EscalatorWarpOut_WaitForPlayer,
    EscalatorWarpOut_Up_Ride,
    EscalatorWarpOut_Up_End,
    EscalatorWarpOut_Down_Ride,
    EscalatorWarpOut_Down_End
};

bool8 (*const gUnknown_0839F300[])(struct Task *) = {
    EscalatorWarpIn_Init,
    EscalatorWarpIn_Down_Init,
    EscalatorWarpIn_Down_Ride,
    EscalatorWarpIn_Up_Init,
    EscalatorWarpIn_Up_Ride,
    EscalatorWarpIn_WaitForMovement,
    EscalatorWarpIn_End
};

bool8 (*const sWaterfallFieldEffectFuncs[])(struct Task *, struct ObjectEvent *) = {
    WaterfallFieldEffect_Init,
    WaterfallFieldEffect_ShowMon,
    WaterfallFieldEffect_WaitForShowMon,
    WaterfallFieldEffect_RideUp,
    WaterfallFieldEffect_ContinueRideOrEnd
};

bool8 (*const sDiveFieldEffectFuncs[])(struct Task *) = {
    DiveFieldEffect_Init,
    DiveFieldEffect_ShowMon,
    DiveFieldEffect_TryWarp
};

bool8 (*const gUnknown_0839F33C[])(struct Task *, struct ObjectEvent *, struct Sprite *) = {
    LavaridgeGymB1FWarpEffect_Init,
    LavaridgeGymB1FWarpEffect_CameraShake,
    LavaridgeGymB1FWarpEffect_Launch,
    LavaridgeGymB1FWarpEffect_Rise,
    LavaridgeGymB1FWarpEffect_FadeOut,
    LavaridgeGymB1FWarpEffect_Warp
};

bool8 (*const gUnknown_0839F354[])(struct Task *, struct ObjectEvent *, struct Sprite *) = {
    LavaridgeGymB1FWarpExitEffect_Init,
    LavaridgeGymB1FWarpExitEffect_StartPopOut,
    LavaridgeGymB1FWarpExitEffect_PopOut,
    LavaridgeGymB1FWarpExitEffect_End
};

bool8 (*const sLavaridgeGym1FWarpEffectFuncs[])(struct Task *, struct ObjectEvent *, struct Sprite *) = {
    LavaridgeGym1FWarpEffect_Init,
    LavaridgeGym1FWarpEffect_AshPuff,
    LavaridgeGym1FWarpEffect_Disappear,
    LavaridgeGym1FWarpEffect_FadeOut,
    LavaridgeGym1FWarpEffect_Warp
};

static void EscapeRopeFieldEffect_Step0(struct Task *);
static void EscapeRopeFieldEffect_Step1(struct Task *);
void (*const sEscapeRopeWarpOutEffectFuncs[])(struct Task *) = {
    EscapeRopeFieldEffect_Step0,
    EscapeRopeFieldEffect_Step1
};

static u8 sActiveList[32];

extern u8 *gFieldEffectScriptPointers[];

u32 FieldEffectStart(u8 id)
{
    u8 *script;
    u32 val;

    FieldEffectActiveListAdd(id);

    script = gFieldEffectScriptPointers[id];

    while (gFieldEffectScriptFuncs[*script](&script, &val))
        ;

    return val;
}

bool8 FieldEffectCmd_loadtiles(u8 **script, u32 *val)
{
    (*script)++;
    FieldEffectScript_LoadTiles(script);
    return TRUE;
}

bool8 FieldEffectCmd_loadfadedpal(u8 **script, u32 *val)
{
    (*script)++;
    FieldEffectScript_LoadFadedPalette(script);
    return TRUE;
}

bool8 FieldEffectCmd_loadpal(u8 **script, u32 *val)
{
    (*script)++;
    FieldEffectScript_LoadPalette(script);
    return TRUE;
}

bool8 FieldEffectCmd_callnative(u8 **script, u32 *val)
{
    (*script)++;
    FieldEffectScript_CallNative(script, val);
    return TRUE;
}

bool8 FieldEffectCmd_end(u8 **script, u32 *val)
{
    return FALSE;
}

bool8 FieldEffectCmd_loadgfx_callnative(u8 **script, u32 *val)
{
    (*script)++;
    FieldEffectScript_LoadTiles(script);
    FieldEffectScript_LoadFadedPalette(script);
    FieldEffectScript_CallNative(script, val);
    return TRUE;
}

bool8 FieldEffectCmd_loadtiles_callnative(u8 **script, u32 *val)
{
    (*script)++;
    FieldEffectScript_LoadTiles(script);
    FieldEffectScript_CallNative(script, val);
    return TRUE;
}

bool8 FieldEffectCmd_loadfadedpal_callnative(u8 **script, u32 *val)
{
    (*script)++;
    FieldEffectScript_LoadFadedPalette(script);
    FieldEffectScript_CallNative(script, val);
    return TRUE;
}

u32 FieldEffectScript_ReadWord(u8 **script)
{
    return (*script)[0]
         + ((*script)[1] << 8)
         + ((*script)[2] << 16)
         + ((*script)[3] << 24);
}

void FieldEffectScript_LoadTiles(u8 **script)
{
    struct SpriteSheet *sheet = (struct SpriteSheet *)FieldEffectScript_ReadWord(script);
    if (GetSpriteTileStartByTag(sheet->tag) == 0xFFFF)
        LoadSpriteSheet(sheet);
    (*script) += 4;
}

void FieldEffectScript_LoadFadedPalette(u8 **script)
{
    struct SpritePalette *palette = (struct SpritePalette *)FieldEffectScript_ReadWord(script);
    LoadSpritePalette(palette);
    UpdateSpritePaletteWithWeather(IndexOfSpritePaletteTag(palette->tag));
    (*script) += 4;
}

void FieldEffectScript_LoadPalette(u8 **script)
{
    struct SpritePalette *palette = (struct SpritePalette *)FieldEffectScript_ReadWord(script);
    LoadSpritePalette(palette);
    (*script) += 4;
}

void FieldEffectScript_CallNative(u8 **script, u32 *val)
{
    u32 (*func)(void) = (u32 (*)(void))FieldEffectScript_ReadWord(script);
    *val = func();
    (*script) += 4;
}

void FieldEffectFreeGraphicsResources(struct Sprite *sprite)
{
    u16 sheetTileStart = sprite->sheetTileStart;
    u32 paletteNum = sprite->oam.paletteNum;
    DestroySprite(sprite);
    FieldEffectFreeTilesIfUnused(sheetTileStart);
    FieldEffectFreePaletteIfUnused(paletteNum);
}

void FieldEffectStop(struct Sprite *sprite, u8 id)
{
    FieldEffectFreeGraphicsResources(sprite);
    FieldEffectActiveListRemove(id);
}

void FieldEffectFreeTilesIfUnused(u16 tileStart)
{
    u8 i;
    u16 tag = GetSpriteTileTagByTileStart(tileStart);

    if (tag != 0xFFFF)
    {
        for (i = 0; i < MAX_SPRITES; i++)
            if (gSprites[i].inUse && gSprites[i].usingSheet && tileStart == gSprites[i].sheetTileStart)
                return;
        FreeSpriteTilesByTag(tag);
    }
}

void FieldEffectFreePaletteIfUnused(u8 paletteNum)
{
    u8 i;
    u16 tag = GetSpritePaletteTagByPaletteNum(paletteNum);

    if (tag != 0xFFFF)
    {
        for (i = 0; i < MAX_SPRITES; i++)
            if (gSprites[i].inUse && gSprites[i].oam.paletteNum == paletteNum)
                return;
        FreeSpritePaletteByTag(tag);
    }
}

void FieldEffectActiveListClear(void)
{
    u8 i;
    for (i = 0; i < ARRAY_COUNT(sActiveList); i++)
        sActiveList[i] = 0xFF;
}

void FieldEffectActiveListAdd(u8 id)
{
    u8 i;
    for (i = 0; i < ARRAY_COUNT(sActiveList); i++)
    {
        if (sActiveList[i] == 0xFF)
        {
            sActiveList[i] = id;
            return;
        }
    }
}

void FieldEffectActiveListRemove(u8 id)
{
    u8 i;
    for (i = 0; i < ARRAY_COUNT(sActiveList); i++)
    {
        if (sActiveList[i] == id)
        {
            sActiveList[i] = 0xFF;
            return;
        }
    }
}

bool8 FieldEffectActiveListContains(u8 id)
{
    u8 i;
    for (i = 0; i < ARRAY_COUNT(sActiveList); i++)
        if (sActiveList[i] == id)
            return TRUE;
    return FALSE;
}

u8 CreateTrainerSprite(u8 trainerSpriteID, s16 x, s16 y, u8 subpriority, u8 *buffer)
{
    struct SpriteTemplate spriteTemplate;
    LoadCompressedObjectPaletteOverrideBuffer(&gTrainerFrontPicPaletteTable[trainerSpriteID], buffer);
    LoadCompressedObjectPicOverrideBuffer(&gTrainerFrontPicTable[trainerSpriteID], buffer);
    spriteTemplate.tileTag = gTrainerFrontPicTable[trainerSpriteID].tag;
    spriteTemplate.paletteTag = gTrainerFrontPicPaletteTable[trainerSpriteID].tag;
    spriteTemplate.oam = &gOamData_839F0F4;
    spriteTemplate.anims = gDummySpriteAnimTable;
    spriteTemplate.images = NULL;
    spriteTemplate.affineAnims = gDummySpriteAffineAnimTable;
    spriteTemplate.callback = SpriteCallbackDummy;
    return CreateSprite(&spriteTemplate, x, y, subpriority);
}

void LoadTrainerGfx_TrainerCard(u8 gender, u16 palOffset, u8 *dest)
{
    LZDecompressVram(gTrainerFrontPicTable[gender].data, dest);
    LoadCompressedPalette(gTrainerFrontPicPaletteTable[gender].data, palOffset, 0x20);
}

u8 CreateBirchSprite(s16 x, s16 y, u8 subpriority)
{
    LoadSpritePalette(&gUnknown_0839F114);
    return CreateSprite(&gSpriteTemplate_839F128, x, y, subpriority);
}

u8 CreateMonSprite_PicBox(u16 species, s16 x, s16 y, u8 subpriority)
{
    DecompressPicFromTable_2(&gMonFrontPicTable[species], gMonFrontPicCoords[species].coords, gMonFrontPicCoords[species].y_offset, gMonSpriteGfx_Sprite_ptr[3], gMonSpriteGfx_Sprite_ptr[3], species);
    LoadCompressedObjectPalette(&gMonPaletteTable[species]);
    GetMonSpriteTemplate_803C56C(species, 3);
    gCreatingSpriteTemplate.paletteTag = gMonPaletteTable[0].tag;
    PreservePaletteInWeather(IndexOfSpritePaletteTag(gMonPaletteTable[0].tag) + 0x10);
    return CreateSprite(&gCreatingSpriteTemplate, x, y, subpriority);
}

u8 CreateMonSprite_FieldMove(u16 species, u32 d, u32 g, s16 x, s16 y, u8 subpriority)
{
    const struct CompressedSpritePalette *spritePalette;

    HandleLoadSpecialPokePic(&gMonFrontPicTable[species], gMonFrontPicCoords[species].coords, gMonFrontPicCoords[species].y_offset, gMonSpriteGfx_Sprite_ptr[3] /* this is actually u8* or something, pointing to ewram */, gMonSpriteGfx_Sprite_ptr[3], species, g);
    spritePalette = GetMonSpritePalStructFromOtIdPersonality(species, d, g);
    LoadCompressedObjectPalette(spritePalette);
    GetMonSpriteTemplate_803C56C(species, 3);
    gCreatingSpriteTemplate.paletteTag = spritePalette->tag;
    PreservePaletteInWeather(IndexOfSpritePaletteTag(spritePalette->tag) + 0x10);
    return CreateSprite(&gCreatingSpriteTemplate, x, y, subpriority);
}

void FreeResourcesAndDestroySprite(struct Sprite *sprite)
{
    ResetPreservedPalettesInWeather();
    FreeSpritePaletteByTag(GetSpritePaletteTagByPaletteNum(sprite->oam.paletteNum));
    if (sprite->oam.affineMode != 0)
    {
        FreeOamMatrix(sprite->oam.matrixNum);
    }
    DestroySprite(sprite);
}

// r, g, b are between 0 and 16
void MultiplyInvertedPaletteRGBComponents(u16 i, u8 r, u8 g, u8 b)
{
    int curRed;
    int curGreen;
    int curBlue;
    u16 outPal;

    outPal = gPlttBufferUnfaded[i];
    curRed = outPal & 0x1f;
    curGreen = (outPal & (0x1f << 5)) >> 5;
    curBlue = (outPal & (0x1f << 10)) >> 10;
    curRed += (((0x1f - curRed) * r) >> 4);
    curGreen += (((0x1f - curGreen) * g) >> 4);
    curBlue += (((0x1f - curBlue) * b) >> 4);
    outPal = curRed;
    outPal |= curGreen << 5;
    outPal |= curBlue << 10;
    gPlttBufferFaded[i] = outPal;
}

// r, g, b are between 0 and 16
void MultiplyPaletteRGBComponents(u16 i, u8 r, u8 g, u8 b)
{
    int curRed;
    int curGreen;
    int curBlue;
    u16 outPal;

    outPal = gPlttBufferUnfaded[i];
    curRed = outPal & 0x1f;
    curGreen = (outPal & (0x1f << 5)) >> 5;
    curBlue = (outPal & (0x1f << 10)) >> 10;
    curRed -= ((curRed * r) >> 4);
    curGreen -= ((curGreen * g) >> 4);
    curBlue -= ((curBlue * b) >> 4);
    outPal = curRed;
    outPal |= curGreen << 5;
    outPal |= curBlue << 10;
    gPlttBufferFaded[i] = outPal;
}

void Task_PokecenterHeal(u8 taskId);
u8 CreatePokeballGlowSprite(s16, s16, s16, u16);
u8 PokecenterHealEffectHelper(s16, s16);

bool8 FldEff_PokecenterHeal(void)
{
    u8 nPokemon;
    struct Task *task;

    nPokemon = CalculatePlayerPartyCount();
    task = &gTasks[CreateTask(Task_PokecenterHeal, 0xff)];
    task->data[1] = nPokemon;
    task->data[2] = 0x5d;
    task->data[3] = 0x24;
    task->data[4] = 0x7c;
    task->data[5] = 0x18;
    return FALSE;
}

void Task_PokecenterHeal(u8 taskId)
{
    struct Task *task;
    task = &gTasks[taskId];
    gUnknown_0839F268[task->data[0]](task);
}

void PokecenterHealEffect_0(struct Task *task)
{
    task->data[0]++;
    task->data[6] = CreatePokeballGlowSprite(task->data[1], task->data[2], task->data[3], 1);
    task->data[7] = PokecenterHealEffectHelper(task->data[4], task->data[5]);
}

void PokecenterHealEffect_1(struct Task *task)
{
    if (gSprites[task->data[6]].data[0] > 1)
    {
        gSprites[task->data[7]].data[0]++;
        task->data[0]++;
    }
}

void PokecenterHealEffect_2(struct Task *task)
{
    if (gSprites[task->data[6]].data[0] > 4)
    {
        task->data[0]++;
    }
}

void PokecenterHealEffect_3(struct Task *task)
{
    if (gSprites[task->data[6]].data[0] > 6)
    {
        DestroySprite(&gSprites[task->data[6]]);
        FieldEffectActiveListRemove(FLDEFF_POKECENTER_HEAL);
        DestroyTask(FindTaskIdByFunc(Task_PokecenterHeal));
    }
}

void Task_HallOfFameRecord(u8 taskId);
void HallOfFameRecordEffectHelper(s16, s16, s16, u8);

bool8 FldEff_HallOfFameRecord(void)
{
    u8 nPokemon;
    struct Task *task;

    nPokemon = CalculatePlayerPartyCount();
    task = &gTasks[CreateTask(Task_HallOfFameRecord, 0xff)];
    task->data[1] = nPokemon;
    task->data[2] = 0x75;
    task->data[3] = 0x34;
    return FALSE;
}

void Task_HallOfFameRecord(u8 taskId)
{
    struct Task *task;
    task = &gTasks[taskId];
    gUnknown_0839F278[task->data[0]](task);
}

void HallOfFameRecordEffect_0(struct Task *task)
{
    u8 taskId;
    task->data[0]++;
    task->data[6] = CreatePokeballGlowSprite(task->data[1], task->data[2], task->data[3], 0);
    taskId = FindTaskIdByFunc(Task_HallOfFameRecord);
    HallOfFameRecordEffectHelper(taskId, 0x78, 0x18, 0);
    HallOfFameRecordEffectHelper(taskId, 0x28, 0x08, 1);
    HallOfFameRecordEffectHelper(taskId, 0x48, 0x08, 1);
    HallOfFameRecordEffectHelper(taskId, 0xa8, 0x08, 1);
    HallOfFameRecordEffectHelper(taskId, 0xc8, 0x08, 1);
}

void HallOfFameRecordEffect_1(struct Task *task)
{
    if (gSprites[task->data[6]].data[0] > 1)
    {
        task->data[15]++; // was this ever initialized? is this ever used?
        task->data[0]++;
    }
}

void HallOfFameRecordEffect_2(struct Task *task)
{
    if (gSprites[task->data[6]].data[0] > 4)
    {
        task->data[0]++;
    }
}

void HallOfFameRecordEffect_3(struct Task *task)
{
    if (gSprites[task->data[6]].data[0] > 6)
    {
        DestroySprite(&gSprites[task->data[6]]);
        FieldEffectActiveListRemove(FLDEFF_HALL_OF_FAME_RECORD);
        DestroyTask(FindTaskIdByFunc(Task_HallOfFameRecord));
    }
}

void SpriteCB_PokeballGlowEffect(struct Sprite *);

u8 CreatePokeballGlowSprite(s16 data6, s16 x, s16 y, u16 data5)
{
    u8 spriteId;
    struct Sprite *sprite;
    spriteId = CreateInvisibleSprite(SpriteCB_PokeballGlowEffect);
    sprite = &gSprites[spriteId];
    sprite->x2 = x;
    sprite->y2 = y;
    sprite->data[5] = data5;
    sprite->data[6] = data6;
    sprite->data[7] = spriteId;
    return spriteId;
}

void SpriteCB_PokeballGlowEffect(struct Sprite *sprite)
{
    gUnknown_0839F288[sprite->data[0]](sprite);
}

void PokeballGlowEffect_0(struct Sprite *sprite)
{
    u8 endSpriteId;
    if (sprite->data[1] == 0 || (--sprite->data[1]) == 0)
    {
        sprite->data[1] = 25;
        endSpriteId = CreateSpriteAtEnd(&gSpriteTemplate_839F208, gUnknown_0839F2A8[sprite->data[2]].x + sprite->x2, gUnknown_0839F2A8[sprite->data[2]].y + sprite->y2, 0);
        gSprites[endSpriteId].oam.priority = 2;
        gSprites[endSpriteId].data[0] = sprite->data[7];
        sprite->data[2]++;
        sprite->data[6]--;
        PlaySE(SE_BALL);
    }
    if (sprite->data[6] == 0)
    {
        sprite->data[1] = 32;
        sprite->data[0]++;
    }
}

void PokeballGlowEffect_1(struct Sprite *sprite)
{
    if ((--sprite->data[1]) == 0)
    {
        sprite->data[0]++;
        sprite->data[1] = 8;
        sprite->data[2] = 0;
        sprite->data[3] = 0;
        if (sprite->data[5])
        {
            PlayFanfare(MUS_HEAL);
        }
    }
}

void PokeballGlowEffect_2(struct Sprite *sprite)
{
    u8 phase;
    if ((--sprite->data[1]) == 0)
    {
        sprite->data[1] = 8;
        sprite->data[2]++;
        sprite->data[2] &= 3;
        if (sprite->data[2] == 0)
        {
            sprite->data[3]++;
        }
    }
    phase = (sprite->data[2] + 3) & 3;
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x108, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
    phase = (sprite->data[2] + 2) & 3;
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x106, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
    phase = (sprite->data[2] + 1) & 3;
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x102, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
    phase = sprite->data[2];
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x105, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x103, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
    if (sprite->data[3] > 2)
    {
        sprite->data[0]++;
        sprite->data[1] = 8;
        sprite->data[2] = 0;
    }
}

void PokeballGlowEffect_3(struct Sprite *sprite)
{
    u8 phase;
    if ((--sprite->data[1]) == 0)
    {
        sprite->data[1] = 8;
        sprite->data[2]++;
        sprite->data[2] &= 3;
        if (sprite->data[2] == 3)
        {
            sprite->data[0]++;
            sprite->data[1] = 30;
        }
    }
    phase = sprite->data[2];
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x108, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x106, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x102, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x105, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x103, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
}

void PokeballGlowEffect_4(struct Sprite *sprite)
{
    if ((--sprite->data[1]) == 0)
    {
        sprite->data[0]++;
    }
}

void PokeballGlowEffect_5(struct Sprite *sprite)
{
    sprite->data[0]++;
}

void PokeballGlowEffect_6(struct Sprite *sprite)
{
    if (sprite->data[5] == 0 || IsFanfareTaskInactive())
    {
        sprite->data[0]++;
    }
}

void PokeballGlowEffect_7(struct Sprite *sprite)
{
}

void SpriteCB_PokeballGlow(struct Sprite *sprite)
{
    if (gSprites[sprite->data[0]].data[0] > 4)
    {
        FieldEffectFreeGraphicsResources(sprite);
    }
}

u8 PokecenterHealEffectHelper(s16 x, s16 y)
{
    u8 spriteIdAtEnd;
    struct Sprite *sprite;
    spriteIdAtEnd = CreateSpriteAtEnd(&gSpriteTemplate_839F220, x, y, 0);
    sprite = &gSprites[spriteIdAtEnd];
    sprite->oam.priority = 2;
    sprite->invisible = TRUE;
    SetSubspriteTables(sprite, &gUnknown_0839F1A0);
    return spriteIdAtEnd;
}

void SpriteCB_PokecenterMonitor(struct Sprite *sprite)
{
    if (sprite->data[0] != 0)
    {
        sprite->data[0] = 0;
        sprite->invisible = FALSE;
        StartSpriteAnim(sprite, 1);
    }
    if (sprite->animEnded)
    {
        FieldEffectFreeGraphicsResources(sprite);
    }
}

void HallOfFameRecordEffectHelper(s16 a0, s16 a1, s16 a2, u8 a3)
{
    u8 spriteIdAtEnd;
    if (!a3)
    {
        spriteIdAtEnd = CreateSpriteAtEnd(&gSpriteTemplate_839F238, a1, a2, 0);
        SetSubspriteTables(&gSprites[spriteIdAtEnd], &gUnknown_0839F1C8);
    } else
    {
        spriteIdAtEnd = CreateSpriteAtEnd(&gSpriteTemplate_839F250, a1, a2, 0);
    }
    gSprites[spriteIdAtEnd].invisible = TRUE;
    gSprites[spriteIdAtEnd].data[0] = a0;
}

void SpriteCB_HallOfFameMonitor(struct Sprite *sprite)
{
    if (gTasks[sprite->data[0]].data[15])
    {
        if (sprite->data[1] == 0 || (--sprite->data[1]) == 0)
        {
            sprite->data[1] = 16;
            sprite->invisible ^= 1;
        }
        sprite->data[2]++;
    }
    if (sprite->data[2] > 127)
    {
        FieldEffectFreeGraphicsResources(sprite);
    }
}

void FieldCallback_UseFly(void);
void FieldCallback_FlyIntoMap(void);
void Task_UseFly(u8);
void Task_FlyIntoMap(u8);

void ReturnToFieldFromFlyMapSelect(void)
{
    SetMainCallback2(CB2_ReturnToField);
    gFieldCallback = FieldCallback_UseFly;
}

void FieldCallback_UseFly(void)
{
    FadeInFromBlack();
    CreateTask(Task_UseFly, 0);
    ScriptContext2_Enable();
    FreezeObjectEvents();
    gFieldCallback = NULL;
}

void Task_UseFly(u8 taskId)
{
    struct Task *task;
    task = &gTasks[taskId];
    if (!task->data[0])
    {
        if (!IsWeatherNotFadingIn())
        {
            return;
        }
        gFieldEffectArguments[0] = gLastFieldPokeMenuOpened;
        if ((int)gFieldEffectArguments[0] > 5)
        {
            gFieldEffectArguments[0] = 0;
        }
        FieldEffectStart(FLDEFF_USE_FLY);
        task->data[0]++;
    }
    if (!FieldEffectActiveListContains(FLDEFF_USE_FLY))
    {
        Overworld_ResetStateAfterFly();
        WarpIntoMap();
        SetMainCallback2(CB2_LoadMap);
        gFieldCallback = FieldCallback_FlyIntoMap;
        DestroyTask(taskId);
    }
}

void FieldCallback_FlyIntoMap(void)
{
    Overworld_PlaySpecialMapMusic();
    FadeInFromBlack();
    CreateTask(Task_FlyIntoMap, 0);
    gObjectEvents[gPlayerAvatar.objectEventId].invisible = TRUE;
    if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_SURFING)
    {
        ObjectEventTurn(&gObjectEvents[gPlayerAvatar.objectEventId], DIR_WEST);
    }
    ScriptContext2_Enable();
    FreezeObjectEvents();
    gFieldCallback = NULL;
}

void Task_FlyIntoMap(u8 taskId)
{
    struct Task *task;
    task = &gTasks[taskId];
    if (task->data[0] == 0)
    {
        if (gPaletteFade.active)
        {
            return;
        }
        FieldEffectStart(FLDEFF_FLY_IN);
        task->data[0]++;
    }
    if (!FieldEffectActiveListContains(FLDEFF_FLY_IN))
    {
        ScriptContext2_Disable();
        UnfreezeObjectEvents();
        DestroyTask(taskId);
    }
}

void Task_FallWarpFieldEffect(u8);
extern void CameraObjectReset2(void);
extern void CameraObjectReset1(void);

void FieldCB_FallWarpExit(void)
{
    Overworld_PlaySpecialMapMusic();
    WarpFadeInScreen();
    ScriptContext2_Enable();
    FreezeObjectEvents();
    CreateTask(Task_FallWarpFieldEffect, 0);
    gFieldCallback = NULL;
}

void Task_FallWarpFieldEffect(u8 taskId)
{
    struct Task *task;
    task = &gTasks[taskId];
    while (gUnknown_0839F2CC[task->data[0]](task)); // return code signifies whether to continue blocking here
}

bool8 FallWarpEffect_Init(struct Task *task) // gUnknown_0839F2CC[0]
{
    struct ObjectEvent *playerObject;
    struct Sprite *playerSprite;
    playerObject = &gObjectEvents[gPlayerAvatar.objectEventId];
    playerSprite = &gSprites[gPlayerAvatar.spriteId];
    CameraObjectReset2();
    gObjectEvents[gPlayerAvatar.objectEventId].invisible = TRUE;
    gPlayerAvatar.preventStep = TRUE;
    ObjectEventSetHeldMovement(playerObject, GetFaceDirectionMovementAction(GetPlayerFacingDirection()));
    task->data[4] = playerSprite->subspriteMode;
    playerObject->fixedPriority = 1;
    playerSprite->oam.priority = 1;
    playerSprite->subspriteMode = 2;
    task->data[0]++;
    return TRUE;
}

bool8 FallWarpEffect_WaitWeather(struct Task *task) // gUnknown_0839F2CC[1]
{
    if (IsWeatherNotFadingIn())
        task->data[0]++;

    return FALSE;
}

bool8 FallWarpEffect_StartFall(struct Task *task) // gUnknown_0839F2CC[2]
{
    struct Sprite *sprite;
    s16 centerToCornerVecY;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    centerToCornerVecY = -(sprite->centerToCornerVecY << 1);
    sprite->y2 = -(sprite->y + sprite->centerToCornerVecY + gSpriteCoordOffsetY + centerToCornerVecY);
    task->data[1] = 1;
    task->data[2] = 0;
    gObjectEvents[gPlayerAvatar.objectEventId].invisible = FALSE;
    PlaySE(SE_FALL);
    task->data[0]++;
    return FALSE;
}

bool8 FallWarpEffect_Fall(struct Task *task)
{
    struct ObjectEvent *objectEvent;
    struct Sprite *sprite;

    objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->y2 += task->data[1];
    if (task->data[1] < 8)
    {
        task->data[2] += task->data[1];
        if (task->data[2] & 0xf)
        {
            task->data[1] <<= 1;
        }
    }
    if (task->data[3] == 0 && sprite->y2 >= -16)
    {
        task->data[3]++;
        objectEvent->fixedPriority = 0;
        sprite->subspriteMode = task->data[4];
        objectEvent->triggerGroundEffectsOnMove = 1;
    }
    if (sprite->y2 >= 0)
    {
        PlaySE(SE_M_STRENGTH);
        objectEvent->triggerGroundEffectsOnStop = 1;
        objectEvent->landingJump = 1;
        sprite->y2 = 0;
        task->data[0]++;
    }
    return FALSE;
}

bool8 sub_808699C(struct Task *task)
{
    task->data[0]++;
    task->data[1] = 4;
    task->data[2] = 0;
    SetCameraPanningCallback(NULL);
    return TRUE;
}

bool8 FallWarpEffect_CameraShake(struct Task *task)
{
    SetCameraPanning(0, task->data[1]);
    task->data[1] = -task->data[1];
    task->data[2]++;
    if ((task->data[2] & 3) == 0)
    {
        task->data[1] >>= 1;
    }
    if (task->data[1] == 0)
    {
        task->data[0]++;
    }
    return FALSE;
}

bool8 FallWarpEffect_End(struct Task *task)
{
    gPlayerAvatar.preventStep = FALSE;
    ScriptContext2_Disable();
    CameraObjectReset1();
    UnfreezeObjectEvents();
    InstallCameraPanAheadCallback();
    DestroyTask(FindTaskIdByFunc(Task_FallWarpFieldEffect));
    return FALSE;
}

void Task_EscalatorWarpOut(u8);
extern void StartEscalator(u8);
extern void TryFadeOutOldMapMusic(void);

void RideUpEscalatorOut(struct Task *);
void RideDownEscalatorOut(struct Task *);
void FadeOutAtEndOfEscalator(void);
void WarpAtEndOfEscalator(void);
bool8 BGMusicStopped(void);
void FieldCallback_EscalatorWarpIn(void);
void StopEscalator(void);
void Task_EscalatorWarpIn(u8);

void StartEscalatorWarp(u8 metatileBehavior, u8 priority)
{
    u8 taskId;
    taskId = CreateTask(Task_EscalatorWarpOut, priority);
    gTasks[taskId].data[1] = 0;
    if (metatileBehavior == 0x6a)
    {
        gTasks[taskId].data[1] = 1;
    }
}

void Task_EscalatorWarpOut(u8 taskId)
{
    struct Task *task;
    task = &gTasks[taskId];
    while (sEscalatorWarpOutFieldEffectFuncs[task->data[0]](task));
}

bool8 EscalatorWarpOut_Init(struct Task *task)
{
    FreezeObjectEvents();
    CameraObjectReset2();
    StartEscalator(task->data[1]);
    task->data[0]++;
    return FALSE;
}

bool8 EscalatorWarpOut_WaitForPlayer(struct Task *task)
{
    struct ObjectEvent *objectEvent;
    objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    if (!ObjectEventIsMovementOverridden(objectEvent) || ObjectEventClearHeldMovementIfFinished(objectEvent))
    {
        ObjectEventSetHeldMovement(objectEvent, GetFaceDirectionMovementAction(GetPlayerFacingDirection()));
        task->data[0]++;
        task->data[2] = 0;
        task->data[3] = 0;
        if ((u8)task->data[1] == 0)
        {
            task->data[0] = 4;
        }
        PlaySE(SE_ESCALATOR);
    }
    return FALSE;
}

bool8 EscalatorWarpOut_Up_Ride(struct Task *task)
{
    RideUpEscalatorOut(task);
    if (task->data[2] > 3)
    {
        FadeOutAtEndOfEscalator();
        task->data[0]++;
    }
    return FALSE;
}

bool8 EscalatorWarpOut_Up_End(struct Task *task)
{
    RideUpEscalatorOut(task);
    WarpAtEndOfEscalator();
    return FALSE;
}

bool8 EscalatorWarpOut_Down_Ride(struct Task *task)
{
    RideDownEscalatorOut(task);
    if (task->data[2] > 3)
    {
        FadeOutAtEndOfEscalator();
        task->data[0]++;
    }
    return FALSE;
}

bool8 EscalatorWarpOut_Down_End(struct Task *task)
{
    RideDownEscalatorOut(task);
    WarpAtEndOfEscalator();
    return FALSE;
}

void RideUpEscalatorOut(struct Task *task)
{
    struct Sprite *sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->x2 = Cos(0x84, task->data[2]);
    sprite->y2 = Sin(0x94, task->data[2]);
    task->data[3]++;
    if (task->data[3] & 1)
    {
        task->data[2]++;
    }
}

void RideDownEscalatorOut(struct Task *task)
{
    struct Sprite *sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->x2 = Cos(0x7c, task->data[2]);
    sprite->y2 = Sin(0x76, task->data[2]);
    task->data[3]++;
    if (task->data[3] & 1)
    {
        task->data[2]++;
    }
}

void FadeOutAtEndOfEscalator(void)
{
    TryFadeOutOldMapMusic();
    WarpFadeScreen();
}

void WarpAtEndOfEscalator(void)
{
    if (!gPaletteFade.active && BGMusicStopped() == TRUE)
    {
        StopEscalator();
        WarpIntoMap();
        gFieldCallback = FieldCallback_EscalatorWarpIn;
        SetMainCallback2(CB2_LoadMap);
        DestroyTask(FindTaskIdByFunc(Task_EscalatorWarpOut));
    }
}

void FieldCallback_EscalatorWarpIn(void)
{
    Overworld_PlaySpecialMapMusic();
    WarpFadeInScreen();
    ScriptContext2_Enable();
    CreateTask(Task_EscalatorWarpIn, 0);
    gFieldCallback = NULL;
}

void Task_EscalatorWarpIn(u8 taskId)
{
    struct Task *task;
    task = &gTasks[taskId];
    while (gUnknown_0839F300[task->data[0]](task));
}

bool8 EscalatorWarpIn_Init(struct Task *task)
{
    s16 x;
    s16 y;
    u8 behavior;
    CameraObjectReset2();
    ObjectEventSetHeldMovement(&gObjectEvents[gPlayerAvatar.objectEventId], GetFaceDirectionMovementAction(DIR_EAST));
    PlayerGetDestCoords(&x, &y);
    behavior = MapGridGetMetatileBehaviorAt(x, y);
    task->data[0]++;
    task->data[1] = 16;
    if (behavior == 0x6b)
    {
        behavior = 1;
        task->data[0] = 3;
    } else
    {
        behavior = 0;
    }
    StartEscalator(behavior);
    return TRUE;
}

bool8 EscalatorWarpIn_Down_Init(struct Task *task)
{
    struct Sprite *sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->x2 = Cos(0x84, task->data[1]);
    sprite->y2 = Sin(0x94, task->data[1]);
    task->data[0]++;
    return FALSE;
}

bool8 EscalatorWarpIn_Down_Ride(struct Task *task)
{
    struct Sprite *sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->x2 = Cos(0x84, task->data[1]);
    sprite->y2 = Sin(0x94, task->data[1]);
    task->data[2]++;
    if (task->data[2] & 1)
    {
        task->data[1]--;
    }
    if (task->data[1] == 0)
    {
        sprite->x2 = 0;
        sprite->y2 = 0;
        task->data[0] = 5;
    }
    return FALSE;
}

bool8 EscalatorWarpIn_Up_Init(struct Task *task)
{
    struct Sprite *sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->x2 = Cos(0x7c, task->data[1]);
    sprite->y2 = Sin(0x76, task->data[1]);
    task->data[0]++;
    return FALSE;
}

bool8 EscalatorWarpIn_Up_Ride(struct Task *task)
{
    struct Sprite *sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->x2 = Cos(0x7c, task->data[1]);
    sprite->y2 = Sin(0x76, task->data[1]);
    task->data[2]++;
    if (task->data[2] & 1)
    {
        task->data[1]--;
    }
    if (task->data[1] == 0)
    {
        sprite->x2 = 0;
        sprite->y2 = 0;
        task->data[0]++;
    }
    return FALSE;
}

extern bool8 IsEscalatorMoving(void);

bool8 EscalatorWarpIn_WaitForMovement(struct Task *task)
{
    if (IsEscalatorMoving())
    {
        return FALSE;
    }
    StopEscalator();
    task->data[0]++;
    return TRUE;
}

bool8 EscalatorWarpIn_End(struct Task *task)
{
    struct ObjectEvent *objectEvent;
    objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    if (ObjectEventClearHeldMovementIfFinished(objectEvent))
    {
        CameraObjectReset1();
        ScriptContext2_Disable();
        ObjectEventSetHeldMovement(objectEvent, GetWalkNormalMovementAction(DIR_EAST));
        DestroyTask(FindTaskIdByFunc(Task_EscalatorWarpIn));
    }
    return FALSE;
}

void Task_UseWaterfall(u8);

bool8 FldEff_UseWaterfall(void)
{
    u8 taskId;
    taskId = CreateTask(Task_UseWaterfall, 0xff);
    gTasks[taskId].data[1] = gFieldEffectArguments[0];
    Task_UseWaterfall(taskId);
    return FALSE;
}

void Task_UseWaterfall(u8 taskId)
{
    while (sWaterfallFieldEffectFuncs[gTasks[taskId].data[0]](&gTasks[taskId], &gObjectEvents[gPlayerAvatar.objectEventId]));
}

bool8 WaterfallFieldEffect_Init(struct Task *task, struct ObjectEvent *objectEvent)
{
    ScriptContext2_Enable();
    gPlayerAvatar.preventStep = TRUE;
    task->data[0]++;
    return FALSE;
}

bool8 WaterfallFieldEffect_ShowMon(struct Task *task, struct ObjectEvent *objectEvent)
{
    ScriptContext2_Enable();
    if (!ObjectEventIsMovementOverridden(objectEvent))
    {
        ObjectEventClearHeldMovementIfFinished(objectEvent);
        gFieldEffectArguments[0] = task->data[1];
        FieldEffectStart(FLDEFF_FIELD_MOVE_SHOW_MON_INIT);
        task->data[0]++;
    }
    return FALSE;
}

bool8 WaterfallFieldEffect_WaitForShowMon(struct Task *task, struct ObjectEvent *objectEvent)
{
    if (FieldEffectActiveListContains(FLDEFF_FIELD_MOVE_SHOW_MON))
    {
        return FALSE;
    }
    task->data[0]++;
    return TRUE;
}

bool8 WaterfallFieldEffect_RideUp(struct Task *task, struct ObjectEvent *objectEvent)
{
    ObjectEventSetHeldMovement(objectEvent, GetWalkSlowMovementAction(DIR_NORTH));
    task->data[0]++;
    return FALSE;
}

bool8 WaterfallFieldEffect_ContinueRideOrEnd(struct Task *task, struct ObjectEvent *objectEvent)
{
    if (!ObjectEventClearHeldMovementIfFinished(objectEvent))
    {
        return FALSE;
    }
    if (MetatileBehavior_IsWaterfall(objectEvent->currentMetatileBehavior))
    {
        task->data[0] = 3;
        return TRUE;
    }
    ScriptContext2_Disable();
    gPlayerAvatar.preventStep = FALSE;
    DestroyTask(FindTaskIdByFunc(Task_UseWaterfall));
    FieldEffectActiveListRemove(FLDEFF_USE_WATERFALL);
    return FALSE;
}

static void Task_Dive(u8);

bool8 FldEff_UseDive(void)
{
    u8 taskId;
    taskId = CreateTask(Task_Dive, 0xff);
    gTasks[taskId].data[15] = gFieldEffectArguments[0];
    gTasks[taskId].data[14] = gFieldEffectArguments[1];
    Task_Dive(taskId);
    return FALSE;
}

void Task_Dive(u8 taskId)
{
    while (sDiveFieldEffectFuncs[gTasks[taskId].data[0]](&gTasks[taskId]));
}

bool8 DiveFieldEffect_Init(struct Task *task)
{
    gPlayerAvatar.preventStep = TRUE;
    task->data[0]++;
    return FALSE;
}

bool8 DiveFieldEffect_ShowMon(struct Task *task)
{
    ScriptContext2_Enable();
    gFieldEffectArguments[0] = task->data[15];
    FieldEffectStart(FLDEFF_FIELD_MOVE_SHOW_MON_INIT);
    task->data[0]++;
    return FALSE;
}

bool8 DiveFieldEffect_TryWarp(struct Task *task)
{
    struct MapPosition mapPosition;
    PlayerGetDestCoords(&mapPosition.x, &mapPosition.y);

    // Wait for show mon first
    if (!FieldEffectActiveListContains(FLDEFF_FIELD_MOVE_SHOW_MON))
    {
        TryDoDiveWarp(&mapPosition, gObjectEvents[gPlayerAvatar.objectEventId].currentMetatileBehavior);
        DestroyTask(FindTaskIdByFunc(Task_Dive));
        FieldEffectActiveListRemove(FLDEFF_USE_DIVE);
    }
    return FALSE;
}

void Task_LavaridgeGymB1FWarp(u8);
void FieldCB_LavaridgeGymB1FWarpExit(void);

void StartLavaridgeGymB1FWarp(u8 priority)
{
    CreateTask(Task_LavaridgeGymB1FWarp, priority);
}

void Task_LavaridgeGymB1FWarp(u8 taskId)
{
    while (gUnknown_0839F33C[gTasks[taskId].data[0]](&gTasks[taskId], &gObjectEvents[gPlayerAvatar.objectEventId], &gSprites[gPlayerAvatar.spriteId]));
}

bool8 LavaridgeGymB1FWarpEffect_Init(struct Task *task, struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    FreezeObjectEvents();
    CameraObjectReset2();
    SetCameraPanningCallback(NULL);
    gPlayerAvatar.preventStep = TRUE;
    objectEvent->fixedPriority = 1;
    task->data[1] = 1;
    task->data[0]++;
    return TRUE;
}

bool8 LavaridgeGymB1FWarpEffect_CameraShake(struct Task *task, struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    SetCameraPanning(0, task->data[1]);
    task->data[1] = -task->data[1];
    task->data[2]++;
    if (task->data[2] > 7)
    {
        task->data[2] = 0;
        task->data[0]++;
    }
    return FALSE;
}

bool8 LavaridgeGymB1FWarpEffect_Launch(struct Task *task, struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    sprite->y2 = 0;
    task->data[3] = 1;
    gFieldEffectArguments[0] = objectEvent->currentCoords.x;
    gFieldEffectArguments[1] = objectEvent->currentCoords.y;
    gFieldEffectArguments[2] = sprite->subpriority - 1;
    gFieldEffectArguments[3] = sprite->oam.priority;
    FieldEffectStart(FLDEFF_ASH_LAUNCH);
    PlaySE(SE_M_EXPLOSION);
    task->data[0]++;
    return TRUE;
}

bool8 LavaridgeGymB1FWarpEffect_Rise(struct Task *task, struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    s16 centerToCornerVecY;
    SetCameraPanning(0, task->data[1]);
    if (task->data[1] = -task->data[1], ++task->data[2] <= 17)
    {
        if (!(task->data[2] & 1) && (task->data[1] <= 3))
        {
            task->data[1] <<= 1;
        }
    } else if (!(task->data[2] & 4) && (task->data[1] > 0))
    {
        task->data[1] >>= 1;
    }
    if (task->data[2] > 6)
    {
        centerToCornerVecY = -(sprite->centerToCornerVecY << 1);
        if (sprite->y2 > -(sprite->y + sprite->centerToCornerVecY + gSpriteCoordOffsetY + centerToCornerVecY))
        {
            sprite->y2 -= task->data[3];
            if (task->data[3] <= 7)
            {
                task->data[3]++;
            }
        } else
        {
            task->data[4] = 1;
        }
    }
    if (task->data[5] == 0 && sprite->y2 < -0x10)
    {
        task->data[5]++;
        objectEvent->fixedPriority = 1;
        sprite->oam.priority = 1;
        sprite->subspriteMode = 2;
    }
    if (task->data[1] == 0 && task->data[4] != 0)
    {
        task->data[0]++;
    }
    return FALSE;
}

bool8 LavaridgeGymB1FWarpEffect_FadeOut(struct Task *task, struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    TryFadeOutOldMapMusic();
    WarpFadeScreen();
    task->data[0]++;
    return FALSE;
}

bool8 LavaridgeGymB1FWarpEffect_Warp(struct Task *task, struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (!gPaletteFade.active && BGMusicStopped() == TRUE)
    {
        WarpIntoMap();
        gFieldCallback = FieldCB_LavaridgeGymB1FWarpExit;
        SetMainCallback2(CB2_LoadMap);
        DestroyTask(FindTaskIdByFunc(Task_LavaridgeGymB1FWarp));
    }
    return FALSE;
}

void Task_LavaridgeGymB1FWarpExit(u8);

void FieldCB_LavaridgeGymB1FWarpExit(void)
{
    Overworld_PlaySpecialMapMusic();
    WarpFadeInScreen();
    ScriptContext2_Enable();
    gFieldCallback = NULL;
    CreateTask(Task_LavaridgeGymB1FWarpExit, 0);
}

void Task_LavaridgeGymB1FWarpExit(u8 taskId)
{
    while (gUnknown_0839F354[gTasks[taskId].data[0]](&gTasks[taskId], &gObjectEvents[gPlayerAvatar.objectEventId], &gSprites[gPlayerAvatar.spriteId]));
}

bool8 LavaridgeGymB1FWarpExitEffect_Init(struct Task *task, struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    CameraObjectReset2();
    FreezeObjectEvents();
    gPlayerAvatar.preventStep = TRUE;
    objectEvent->invisible = TRUE;
    task->data[0]++;
    return FALSE;
}

bool8 LavaridgeGymB1FWarpExitEffect_StartPopOut(struct Task *task, struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (IsWeatherNotFadingIn())
    {
        gFieldEffectArguments[0] = objectEvent->currentCoords.x;
        gFieldEffectArguments[1] = objectEvent->currentCoords.y;
        gFieldEffectArguments[2] = sprite->subpriority - 1;
        gFieldEffectArguments[3] = sprite->oam.priority;
        task->data[1] = FieldEffectStart(FLDEFF_ASH_PUFF);
        task->data[0]++;
    }
    return FALSE;
}

bool8 LavaridgeGymB1FWarpExitEffect_PopOut(struct Task *task, struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    sprite = &gSprites[task->data[1]];
    if (sprite->animCmdIndex > 1)
    {
        task->data[0]++;
        objectEvent->invisible = FALSE;
        CameraObjectReset1();
        PlaySE(SE_M_DIG);
        ObjectEventSetHeldMovement(objectEvent, GetJumpMovementAction(DIR_EAST));
    }
    return FALSE;
}

bool8 LavaridgeGymB1FWarpExitEffect_End(struct Task *task, struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (ObjectEventClearHeldMovementIfFinished(objectEvent))
    {
        gPlayerAvatar.preventStep = FALSE;
        ScriptContext2_Disable();
        UnfreezeObjectEvents();
        DestroyTask(FindTaskIdByFunc(Task_LavaridgeGymB1FWarpExit));
    }
    return FALSE;
}

extern void SetSpritePosToOffsetMapCoords(s16 *x, s16 *y, s16 dx, s16 dy);
extern const struct SpriteTemplate *const gFieldEffectObjectTemplatePointers[36];

u8 FldEff_AshLaunch(void)
{
    u8 spriteId;
    SetSpritePosToOffsetMapCoords((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[33], gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    gSprites[spriteId].oam.priority = gFieldEffectArguments[3];
    gSprites[spriteId].coordOffsetEnabled = TRUE;
    return spriteId;
}

void SpriteCB_AshLaunch(struct Sprite *sprite)
{
    if (sprite->animEnded)
        FieldEffectStop(sprite, FLDEFF_ASH_LAUNCH);
}

void Task_LavaridgeGym1FWarp(u8);

void StartLavaridgeGym1FWarp(u8 priority)
{
    CreateTask(Task_LavaridgeGym1FWarp, priority);
}

void Task_LavaridgeGym1FWarp(u8 taskId)
{
    while(sLavaridgeGym1FWarpEffectFuncs[gTasks[taskId].data[0]](&gTasks[taskId], &gObjectEvents[gPlayerAvatar.objectEventId], &gSprites[gPlayerAvatar.spriteId]));
}

bool8 LavaridgeGym1FWarpEffect_Init(struct Task *task, struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    FreezeObjectEvents();
    CameraObjectReset2();
    gPlayerAvatar.preventStep = TRUE;
    objectEvent->fixedPriority = 1;
    task->data[0]++;
    return FALSE;
}

bool8 LavaridgeGym1FWarpEffect_AshPuff(struct Task *task, struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (ObjectEventClearHeldMovementIfFinished(objectEvent))
    {
        if (task->data[1] > 3)
        {
            gFieldEffectArguments[0] = objectEvent->currentCoords.x;
            gFieldEffectArguments[1] = objectEvent->currentCoords.y;
            gFieldEffectArguments[2] = sprite->subpriority - 1;
            gFieldEffectArguments[3] = sprite->oam.priority;
            task->data[1] = FieldEffectStart(FLDEFF_ASH_PUFF);
            task->data[0]++;
        } else
        {
            task->data[1]++;
            ObjectEventSetHeldMovement(objectEvent, GetWalkInPlaceFastestMovementAction(objectEvent->facingDirection));
            PlaySE(SE_LAVARIDGE_FALL_WARP);
        }
    }
    return FALSE;
}

bool8 LavaridgeGym1FWarpEffect_Disappear(struct Task *task, struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (gSprites[task->data[1]].animCmdIndex == 2)
    {
        objectEvent->invisible = TRUE;
        task->data[0]++;
    }
    return FALSE;
}

bool8 LavaridgeGym1FWarpEffect_FadeOut(struct Task *task, struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (!FieldEffectActiveListContains(FLDEFF_ASH_PUFF))
    {
        TryFadeOutOldMapMusic();
        WarpFadeScreen();
        task->data[0]++;
    }
    return FALSE;
}

static void DoEscapeRopeFieldEffect(u8);
void FieldCallback_EscapeRopeWarpIn(void);

bool8 LavaridgeGym1FWarpEffect_Warp(struct Task *task, struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (!gPaletteFade.active && BGMusicStopped() == TRUE)
    {
        WarpIntoMap();
        gFieldCallback = FieldCB_FallWarpExit;
        SetMainCallback2(CB2_LoadMap);
        DestroyTask(FindTaskIdByFunc(Task_LavaridgeGym1FWarp));
    }
    return FALSE;
}

// For the ash effect when a trainer pops out of ash, or when the player enters/exits a warp in Lavaridge Gym 1F
u8 FldEff_AshPuff(void)
{
    u8 spriteId;
    SetSpritePosToOffsetMapCoords((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[32], gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    gSprites[spriteId].oam.priority = gFieldEffectArguments[3];
    gSprites[spriteId].coordOffsetEnabled = 1;
    return spriteId;
}

void SpriteCB_AshPuff(struct Sprite *sprite)
{
    if (sprite->animEnded)
        FieldEffectStop(sprite, FLDEFF_ASH_PUFF);
}

void StartEscapeRopeFieldEffect(void)
{
    ScriptContext2_Enable();
    FreezeObjectEvents();
    CreateTask(DoEscapeRopeFieldEffect, 80);
}

static void DoEscapeRopeFieldEffect(u8 taskId)
{
    sEscapeRopeWarpOutEffectFuncs[gTasks[taskId].data[0]](&gTasks[taskId]);
}

static void EscapeRopeFieldEffect_Step0(struct Task *task)
{
    task->data[0]++;
    task->data[14] = 64;
    task->data[15] = GetPlayerFacingDirection();
}

static void EscapeRopeFieldEffect_Step1(struct Task *task)
{
    struct ObjectEvent *objectEvent;
    u8 clockwiseDirections[5] = {
        DIR_SOUTH,
        DIR_WEST,
        DIR_EAST,
        DIR_NORTH,
        DIR_SOUTH,
    };

    if (task->data[14] != 0 && (--task->data[14]) == 0)
    {
        TryFadeOutOldMapMusic();
        WarpFadeScreen();
    }

    objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    if (!ObjectEventIsMovementOverridden(objectEvent) || ObjectEventClearHeldMovementIfFinished(objectEvent))
    {
        if (task->data[14] == 0 && !gPaletteFade.active && BGMusicStopped() == TRUE)
        {
            SetObjectEventDirection(objectEvent, task->data[15]);
            SetWarpDestinationToEscapeWarp();
            WarpIntoMap();
            gFieldCallback = FieldCallback_EscapeRopeWarpIn;
            SetMainCallback2(CB2_LoadMap);
            DestroyTask(FindTaskIdByFunc(DoEscapeRopeFieldEffect));
        }
        else if (task->data[1] == 0 || (--task->data[1]) == 0)
        {
            ObjectEventSetHeldMovement(objectEvent, GetFaceDirectionMovementAction(clockwiseDirections[objectEvent->facingDirection]));
            if (task->data[2] < 12)
                task->data[2]++;

            task->data[1] = 8 >> (task->data[2] >> 2);
        }
    }
}

void (*const sEscapeRopeWarpInEffectFuncs[])(struct Task *) = {
    EscapeRopeWarpInEffect_Init,
    EscapeRopeWarpInEffect_Spin
};

void Task_EscapeRopeWarpIn(u8);

void FieldCallback_EscapeRopeWarpIn(void)
{
    Overworld_PlaySpecialMapMusic();
    WarpFadeInScreen();
    ScriptContext2_Enable();
    FreezeObjectEvents();
    gFieldCallback = NULL;
    gObjectEvents[gPlayerAvatar.objectEventId].invisible = TRUE;
    CreateTask(Task_EscapeRopeWarpIn, 0);
}

void Task_EscapeRopeWarpIn(u8 taskId)
{
    sEscapeRopeWarpInEffectFuncs[gTasks[taskId].data[0]](&gTasks[taskId]);
}

void EscapeRopeWarpInEffect_Init(struct Task *task)
{
    if (IsWeatherNotFadingIn())
    {
        task->data[0]++;
        task->data[15] = GetPlayerFacingDirection();
    }
}

void EscapeRopeWarpInEffect_Spin(struct Task *task)
{
    u8 spinDirections[5] = {DIR_SOUTH, DIR_WEST, DIR_EAST, DIR_NORTH, DIR_SOUTH};
    struct ObjectEvent *objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    if (task->data[1] == 0 || (--task->data[1]) == 0)
    {
        if (ObjectEventIsMovementOverridden(objectEvent) && !ObjectEventClearHeldMovementIfFinished(objectEvent))
        {
            return;
        }
        if (task->data[2] >= 32 && task->data[15] == GetPlayerFacingDirection())
        {
            objectEvent->invisible = FALSE;
            ScriptContext2_Disable();
            UnfreezeObjectEvents();
            DestroyTask(FindTaskIdByFunc(Task_EscapeRopeWarpIn));
            return;
        }
        ObjectEventSetHeldMovement(objectEvent, GetFaceDirectionMovementAction(spinDirections[objectEvent->facingDirection]));
        if (task->data[2] < 32)
        {
            task->data[2]++;
        }
        task->data[1] = task->data[2] >> 2;
    }
    objectEvent->invisible ^= 1;
}

static void Task_TeleportWarpOut(u8);
static void TeleportWarpOutFieldEffect_Init(struct Task*);
static void TeleportWarpOutFieldEffect_SpinGround(struct Task*);
static void TeleportWarpOutFieldEffect_SpinExit(struct Task*);
static void TeleportWarpOutFieldEffect_End(struct Task*);
static void FieldCallback_TeleportWarpIn(void);

void FldEff_TeleportWarpOut(void)
{
    CreateTask(Task_TeleportWarpOut, 0);
}

static void (*const sTeleportWarpOutFieldEffectFuncs[])(struct Task *) = {
    TeleportWarpOutFieldEffect_Init,
    TeleportWarpOutFieldEffect_SpinGround,
    TeleportWarpOutFieldEffect_SpinExit,
    TeleportWarpOutFieldEffect_End
};

static void Task_TeleportWarpOut(u8 taskId)
{
    sTeleportWarpOutFieldEffectFuncs[gTasks[taskId].data[0]](&gTasks[taskId]);
}

static void TeleportWarpOutFieldEffect_Init(struct Task *task)
{
    ScriptContext2_Enable();
    FreezeObjectEvents();
    CameraObjectReset2();
    task->data[15] = GetPlayerFacingDirection();
    task->data[0]++;
}

static void TeleportWarpOutFieldEffect_SpinGround(struct Task *task)
{
    u8 spinDirections[5] = {DIR_SOUTH, DIR_WEST, DIR_EAST, DIR_NORTH, DIR_SOUTH};
    struct ObjectEvent *objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    if (task->data[1] == 0 || (--task->data[1]) == 0)
    {
        ObjectEventTurn(objectEvent, spinDirections[objectEvent->facingDirection]);
        task->data[1] = 8;
        task->data[2]++;
    }
    if (task->data[2] > 7 && task->data[15] == objectEvent->facingDirection)
    {
        task->data[0]++;
        task->data[1] = 4;
        task->data[2] = 8;
        task->data[3] = 1;
        PlaySE(SE_WARP_IN);
    }
}

static void TeleportWarpOutFieldEffect_SpinExit(struct Task *task)
{
    u8 spinDirections[5] = {DIR_SOUTH, DIR_WEST, DIR_EAST, DIR_NORTH, DIR_SOUTH};
    struct ObjectEvent *objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    struct Sprite *sprite = &gSprites[gPlayerAvatar.spriteId];
    if ((--task->data[1]) <= 0)
    {
        task->data[1] = 4;
        ObjectEventTurn(objectEvent, spinDirections[objectEvent->facingDirection]);
    }
    sprite->y -= task->data[3];
    task->data[4] += task->data[3];
    if ((--task->data[2]) <= 0 && (task->data[2] = 4, task->data[3] < 8))
    {
        task->data[3] <<= 1;
    }
    if (task->data[4] > 8 && (sprite->oam.priority = 1, sprite->subspriteMode != 0))
    {
        sprite->subspriteMode = 2;
    }
    if (task->data[4] >= 0xa8)
    {
        task->data[0]++;
        TryFadeOutOldMapMusic();
        WarpFadeScreen();
    }
}

static void TeleportWarpOutFieldEffect_End(struct Task *task)
{
    if (!gPaletteFade.active && BGMusicStopped() == TRUE)
    {
        Overworld_SetWarpDestToLastHealLoc();
        WarpIntoMap();
        SetMainCallback2(CB2_LoadMap);
        gFieldCallback = FieldCallback_TeleportWarpIn;
        DestroyTask(FindTaskIdByFunc(Task_TeleportWarpOut));
    }
}

void Task_TeleportWarpIn(u8);

static void FieldCallback_TeleportWarpIn(void)
{
    Overworld_PlaySpecialMapMusic();
    WarpFadeInScreen();
    ScriptContext2_Enable();
    FreezeObjectEvents();
    gFieldCallback = NULL;
    gObjectEvents[gPlayerAvatar.objectEventId].invisible = TRUE;
    CameraObjectReset2();
    CreateTask(Task_TeleportWarpIn, 0);
}

void (*const sTeleportWarpInFieldEffectFuncs[])(struct Task *) = {
    TeleportWarpInFieldEffect_Init,
    TeleportWarpInFieldEffect_SpinEnter,
    TeleportWarpInFieldEffect_SpinGround
};

void Task_TeleportWarpIn(u8 taskId)
{
    sTeleportWarpInFieldEffectFuncs[gTasks[taskId].data[0]](&gTasks[taskId]);
}

void TeleportWarpInFieldEffect_Init(struct Task *task)
{
    struct Sprite *sprite;
    s16 centerToCornerVecY;
    if (IsWeatherNotFadingIn())
    {
        sprite = &gSprites[gPlayerAvatar.spriteId];
        centerToCornerVecY = -(sprite->centerToCornerVecY << 1);
        sprite->y2 = -(sprite->y + sprite->centerToCornerVecY + gSpriteCoordOffsetY + centerToCornerVecY);
        gObjectEvents[gPlayerAvatar.objectEventId].invisible = FALSE;
        task->data[0]++;
        task->data[1] = 8;
        task->data[2] = 1;
        task->data[14] = sprite->subspriteMode;
        task->data[15] = GetPlayerFacingDirection();
        PlaySE(SE_WARP_IN);
    }
}

void TeleportWarpInFieldEffect_SpinEnter(struct Task *task)
{
    u8 spinDirections[5] = {DIR_SOUTH, DIR_WEST, DIR_EAST, DIR_NORTH, DIR_SOUTH};
    struct ObjectEvent *objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    struct Sprite *sprite = &gSprites[gPlayerAvatar.spriteId];
    if ((sprite->y2 += task->data[1]) >= -8)
    {
        if (task->data[13] == 0)
        {
            task->data[13]++;
            objectEvent->triggerGroundEffectsOnMove = 1;
            sprite->subspriteMode = task->data[14];
        }
    } else
    {
        sprite->oam.priority = 1;
        if (sprite->subspriteMode != 0)
        {
            sprite->subspriteMode = 2;
        }
    }
    if (sprite->y2 >= -0x30 && task->data[1] > 1 && !(sprite->y2 & 1))
    {
        task->data[1]--;
    }
    if ((--task->data[2]) == 0)
    {
        task->data[2] = 4;
        ObjectEventTurn(objectEvent, spinDirections[objectEvent->facingDirection]);
    }
    if (sprite->y2 >= 0)
    {
        sprite->y2 = 0;
        task->data[0]++;
        task->data[1] = 1;
        task->data[2] = 0;
    }
}

void TeleportWarpInFieldEffect_SpinGround(struct Task *task)
{
    u8 spinDirections[5] = {DIR_SOUTH, DIR_WEST, DIR_EAST, DIR_NORTH, DIR_SOUTH};
    struct ObjectEvent *objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    if ((--task->data[1]) == 0)
    {
        ObjectEventTurn(objectEvent, spinDirections[objectEvent->facingDirection]);
        task->data[1] = 8;
        if ((++task->data[2]) > 4 && task->data[14] == objectEvent->facingDirection)
        {
            ScriptContext2_Disable();
            CameraObjectReset1();
            UnfreezeObjectEvents();
            DestroyTask(FindTaskIdByFunc(Task_TeleportWarpIn));
        }
    }
}

void Task_FieldMoveShowMonOutdoors(u8);
void Task_FieldMoveShowMonIndoors(u8);
u8 InitFieldMoveMonSprite(u32, u32, u32);
void VBlankCB_FieldMoveShowMonOutdoors(void);
void LoadFieldMoveOutdoorStreaksTilemap(u16);
void SpriteCB_FieldMoveMonSlideOnscreen(struct Sprite *);

bool8 FldEff_FieldMoveShowMon(void)
{
    u8 taskId;
    if (IsMapTypeOutdoors(Overworld_GetMapTypeOfSaveblockLocation()) == TRUE)
    {
        taskId = CreateTask(Task_FieldMoveShowMonOutdoors, 0xff);
    } else
    {
        taskId = CreateTask(Task_FieldMoveShowMonIndoors, 0xff);
    }
    gTasks[taskId].data[15] = InitFieldMoveMonSprite(gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    return FALSE;
}

bool8 FldEff_FieldMoveShowMonInit(void)
{
    struct Pokemon *pokemon;
    u32 flag = gFieldEffectArguments[0] & 0x80000000;
    pokemon = &gPlayerParty[(u8)gFieldEffectArguments[0]];
    gFieldEffectArguments[0] = GetMonData(pokemon, MON_DATA_SPECIES);
    gFieldEffectArguments[1] = GetMonData(pokemon, MON_DATA_OT_ID);
    gFieldEffectArguments[2] = GetMonData(pokemon, MON_DATA_PERSONALITY);
    gFieldEffectArguments[0] |= flag;
    FieldEffectStart(FLDEFF_FIELD_MOVE_SHOW_MON);
    FieldEffectActiveListRemove(FLDEFF_FIELD_MOVE_SHOW_MON_INIT);
    return FALSE;
}

void (*const sFieldMoveShowMonOutdoorsEffectFuncs[])(struct Task *) = {
    FieldMoveShowMonOutdoorsEffect_Init,
    FieldMoveShowMonOutdoorsEffect_LoadGfx,
    FieldMoveShowMonOutdoorsEffect_CreateBanner,
    FieldMoveShowMonOutdoorsEffect_WaitForMon,
    FieldMoveShowMonOutdoorsEffect_ShrinkBanner,
    FieldMoveShowMonOutdoorsEffect_RestoreBg,
    FieldMoveShowMonOutdoorsEffect_End,
};

void Task_FieldMoveShowMonOutdoors(u8 taskId)
{
    sFieldMoveShowMonOutdoorsEffectFuncs[gTasks[taskId].data[0]](&gTasks[taskId]);
}

void FieldMoveShowMonOutdoorsEffect_Init(struct Task *task)
{
    task->data[11] = REG_WININ;
    task->data[12] = REG_WINOUT;
    StoreWordInTwoHalfwords(&task->data[13], (u32)gMain.vblankCallback);
    task->data[1] = 0xf0f1;
    task->data[2] = 0x5051;
    task->data[3] = 0x3f;
    task->data[4] = 0x3e;
    REG_WIN0H = task->data[1];
    REG_WIN0V = task->data[2];
    REG_WININ = task->data[3];
    REG_WINOUT = task->data[4];
    SetVBlankCallback(VBlankCB_FieldMoveShowMonOutdoors);
    task->data[0]++;
}

void FieldMoveShowMonOutdoorsEffect_LoadGfx(struct Task *task)
{
    u16 offset = ((REG_BG0CNT >> 2) << 14);
    u16 delta = ((REG_BG0CNT >> 8) << 11);
    CpuCopy16(sFieldMoveStreaksOutdoors_Gfx, (void *)(VRAM + offset), 0x200);
    CpuFill32(0, (void *)(VRAM + delta), 0x800);
    LoadPalette(gFieldMoveStreaksPalette, 0xf0, 0x20);
    LoadFieldMoveOutdoorStreaksTilemap(delta);
    task->data[0]++;
}

void FieldMoveShowMonOutdoorsEffect_CreateBanner(struct Task *task)
{
    s16 horiz;
    s16 vertHi;
    s16 vertLo;
    task->data[5] -= 16;
    // & 0xFF is redundant
    horiz = (task->data[1] >> 8) & 0xFF;
    vertHi = (task->data[2] >> 8) & 0xFF;
    vertLo = (task->data[2] & 0xff);
    horiz -= 16;
    vertHi -= 2;
    vertLo += 2;
    if (horiz < 0)
    {
        horiz = 0;
    }
    if (vertHi < 0x28)
    {
        vertHi = 0x28;
    }
    if (vertLo > 0x78)
    {
        vertLo = 0x78;
    }
    task->data[1] = (horiz << 8) | (task->data[1] & 0xff);
    task->data[2] = (vertHi << 8) | vertLo;
    if (horiz == 0 && vertHi == 0x28 && vertLo == 0x78)
    {
        gSprites[task->data[15]].callback = SpriteCB_FieldMoveMonSlideOnscreen;
        task->data[0]++;
    }
}

void FieldMoveShowMonOutdoorsEffect_WaitForMon(struct Task *task)
{
    task->data[5] -= 16;
    if (gSprites[task->data[15]].data[7])
    {
        task->data[0]++;
    }
}

void FieldMoveShowMonOutdoorsEffect_ShrinkBanner(struct Task *task)
{
    s16 vertHi;
    s16 vertLo;
    task->data[5] -= 16;
    vertHi = (task->data[2] >> 8);
    vertLo = (task->data[2] & 0xff);
    vertHi += 6;
    vertLo -= 6;
    if (vertHi > 0x50)
    {
        vertHi = 0x50;
    }
    if (vertLo < 0x51)
    {
        vertLo = 0x51;
    }
    task->data[2] = (vertHi << 8) | vertLo;
    if (vertHi == 0x50 && vertLo == 0x51)
    {
        task->data[0]++;
    }
}

void FieldMoveShowMonOutdoorsEffect_RestoreBg(struct Task *task)
{
    u16 bg0cnt;
    bg0cnt = (REG_BG0CNT >> 8) << 11;
    CpuFill32(0, (void *)VRAM + bg0cnt, 0x800);
    task->data[1] = 0xf1;
    task->data[2] = 0xa1;
    task->data[3] = task->data[11];
    task->data[4] = task->data[12];
    task->data[0]++;
}

void FieldMoveShowMonOutdoorsEffect_End(struct Task *task)
{
    IntrCallback callback;
    LoadWordFromTwoHalfwords(&task->data[13], (u32 *)&callback);
    SetVBlankCallback(callback);
    Text_LoadWindowTemplate(&gMenuTextWindowTemplate);
    InitMenuWindow(&gMenuTextWindowTemplate);
    FreeResourcesAndDestroySprite(&gSprites[task->data[15]]);
    FieldEffectActiveListRemove(FLDEFF_FIELD_MOVE_SHOW_MON);
    DestroyTask(FindTaskIdByFunc(Task_FieldMoveShowMonOutdoors));
}

void VBlankCB_FieldMoveShowMonOutdoors(void)
{
    IntrCallback callback;
    struct Task *task = &gTasks[FindTaskIdByFunc(Task_FieldMoveShowMonOutdoors)];
    LoadWordFromTwoHalfwords(&task->data[13], (u32 *)&callback);
    callback();
    REG_WIN0H = task->data[1];
    REG_WIN0V = task->data[2];
    REG_WININ = task->data[3];
    REG_WINOUT = task->data[4];
    REG_BG0HOFS = task->data[5];
    REG_BG0VOFS = task->data[6];
}

void LoadFieldMoveOutdoorStreaksTilemap(u16 offs)
{
    u16 i;
    u16 *dest;
    dest = (u16 *)(VRAM + ARRAY_COUNT(sFieldMoveStreaksOutdoors_Tilemap) + offs);
    for (i = 0; i < ARRAY_COUNT(sFieldMoveStreaksOutdoors_Tilemap); i++, dest++)
    {
        *dest = sFieldMoveStreaksOutdoors_Tilemap[i] | 0xF000;
    }
}

void VBlankCB_FieldMoveShowMonIndoors(void);
bool8 SlideIndoorBannerOnscreen(struct Task *);
void AnimateIndoorShowMonBg(struct Task *);
bool8 SlideIndoorBannerOffscreen(struct Task *);

void (*const sFieldMoveShowMonIndoorsEffectFuncs[])(struct Task *) = {
    FieldMoveShowMonIndoorsEffect_Init,
    FieldMoveShowMonIndoorsEffect_LoadGfx,
    FieldMoveShowMonIndoorsEffect_SlideBannerOn,
    FieldMoveShowMonIndoorsEffect_WaitForMon,
    FieldMoveShowMonIndoorsEffect_RestoreBg,
    FieldMoveShowMonIndoorsEffect_SlideBannerOff,
    FieldMoveShowMonIndoorsEffect_End
};

void Task_FieldMoveShowMonIndoors(u8 taskId)
{
    sFieldMoveShowMonIndoorsEffectFuncs[gTasks[taskId].data[0]](&gTasks[taskId]);
}

void FieldMoveShowMonIndoorsEffect_Init(struct Task *task)
{
    REG_BG0HOFS = task->data[1];
    REG_BG0VOFS = task->data[2];
    StoreWordInTwoHalfwords(&task->data[13], (u32)gMain.vblankCallback);
    SetVBlankCallback(VBlankCB_FieldMoveShowMonIndoors);
    task->data[0]++;
}

void FieldMoveShowMonIndoorsEffect_LoadGfx(struct Task *task)
{
    u16 offset;
    u16 delta;
    offset = ((REG_BG0CNT >> 2) << 14);
    delta = ((REG_BG0CNT >> 8) << 11);
    task->data[12] = delta;
    CpuCopy16(gDarknessFieldMoveStreaksTiles, (void *)(VRAM + offset), 0x80);
    CpuFill32(0, (void *)(VRAM + delta), 0x800);
    LoadPalette(gDarknessFieldMoveStreaksPalette, 0xf0, 0x20);
    task->data[0]++;
}

void FieldMoveShowMonIndoorsEffect_SlideBannerOn(struct Task *task)
{
    if (SlideIndoorBannerOnscreen(task))
    {
        REG_WIN1H = 0x00f0;
        REG_WIN1V = 0x2878;
        gSprites[task->data[15]].callback = SpriteCB_FieldMoveMonSlideOnscreen;
        task->data[0]++;
    }
    AnimateIndoorShowMonBg(task);
}

void FieldMoveShowMonIndoorsEffect_WaitForMon(struct Task *task)
{
    AnimateIndoorShowMonBg(task);
    if (gSprites[task->data[15]].data[7])
        task->data[0]++;
}

void FieldMoveShowMonIndoorsEffect_RestoreBg(struct Task *task)
{
    AnimateIndoorShowMonBg(task);
    task->data[3] = task->data[1] & 7;
    task->data[4] = 0;
    REG_WIN1H = 0xffff;
    REG_WIN1V = 0xffff;
    task->data[0]++;
}

void FieldMoveShowMonIndoorsEffect_SlideBannerOff(struct Task *task)
{
    AnimateIndoorShowMonBg(task);
    if (SlideIndoorBannerOffscreen(task))
        task->data[0]++;
}

void FieldMoveShowMonIndoorsEffect_End(struct Task *task)
{
    IntrCallback intrCallback;
    u16 bg0cnt;
    bg0cnt = (REG_BG0CNT >> 8) << 11;
    CpuFill32(0, (void *)VRAM + bg0cnt, 0x800);
    LoadWordFromTwoHalfwords(&task->data[13], (u32 *)&intrCallback);
    SetVBlankCallback(intrCallback);
    Text_LoadWindowTemplate(&gMenuTextWindowTemplate);
    InitMenuWindow(&gMenuTextWindowTemplate);
    FreeResourcesAndDestroySprite(&gSprites[task->data[15]]);
    FieldEffectActiveListRemove(FLDEFF_FIELD_MOVE_SHOW_MON);
    DestroyTask(FindTaskIdByFunc(Task_FieldMoveShowMonIndoors));
}

void VBlankCB_FieldMoveShowMonIndoors(void)
{
    IntrCallback intrCallback;
    struct Task *task;
    task = &gTasks[FindTaskIdByFunc(Task_FieldMoveShowMonIndoors)];
    LoadWordFromTwoHalfwords(&task->data[13], (u32 *)&intrCallback);
    intrCallback();
    REG_BG0HOFS = task->data[1];
    REG_BG0VOFS = task->data[2];
}

void AnimateIndoorShowMonBg(struct Task *task)
{
    task->data[1] -= 16;
    task->data[3] += 16;
}

bool8 SlideIndoorBannerOnscreen(struct Task *task)
{
    u16 i;
    u16 srcOffs;
    u16 dstOffs;
    u16 *dest;
    if (task->data[4] >= 32)
    {
        return TRUE;
    }
    dstOffs = (task->data[3] >> 3) & 0x1f;
    if (dstOffs >= task->data[4])
    {
        dstOffs = (32 - dstOffs) & 0x1f;
        srcOffs = (32 - task->data[4]) & 0x1f;
        dest = (u16 *)(VRAM + 0x140 + (u16)task->data[12]);
        for (i = 0; i < 10; i++)
        {
            dest[dstOffs + i * 32] = gDarknessFieldMoveStreaksTilemap[srcOffs + i * 32];
            dest[dstOffs + i * 32] |= 0xf000;

            dest[((dstOffs + 1) & 0x1f) + i * 32] = gDarknessFieldMoveStreaksTilemap[((srcOffs + 1) & 0x1f) + i * 32] | 0xf000;
            dest[((dstOffs + 1) & 0x1f) + i * 32] |= 0xf000;
        }
        task->data[4] += 2;
    }
    return FALSE;
}

bool8 SlideIndoorBannerOffscreen(struct Task *task)
{
    u16 i;
    u16 dstOffs;
    u16 *dest;
    if (task->data[4] >= 32)
    {
        return TRUE;
    }
    dstOffs = task->data[3] >> 3;
    if (dstOffs >= task->data[4])
    {
        dstOffs = (task->data[1] >> 3) & 0x1f;
        dest = (u16 *)(VRAM + 0x140 + (u16)task->data[12]);
        for (i=0; i<10; i++)
        {
            dest[dstOffs + i * 32] = 0xf000;
            dest[((dstOffs + 1) & 0x1f) + i * 32] = 0xf000;
        }
        task->data[4] += 2;
    }
    return FALSE;
}

u8 InitFieldMoveMonSprite(u32 species, u32 otId, u32 personality)
{
    bool16 noDucking;
    u8 monSprite;
    struct Sprite *sprite;
    noDucking = (species & 0x80000000) >> 16;
    species &= 0x7fffffff;
    monSprite = CreateMonSprite_FieldMove(species, otId, personality, 0x140, 0x50, 0);
    sprite = &gSprites[monSprite];
    sprite->callback = SpriteCallbackDummy;
    sprite->oam.priority = 0;
    sprite->data[0] = species;
    sprite->data[6] = noDucking;
    return monSprite;
}

void SpriteCB_FieldMoveMonWaitAfterCry(struct Sprite *);

void SpriteCB_FieldMoveMonSlideOnscreen(struct Sprite *sprite)
{
    if ((sprite->x -= 20) <= DISPLAY_WIDTH / 2)
    {
        sprite->x = DISPLAY_WIDTH / 2;;
        sprite->data[1] = 30;
        sprite->callback = SpriteCB_FieldMoveMonWaitAfterCry;
        if (sprite->data[6])
        {
            PlayCry_NormalNoDucking((u16)sprite->data[0], 0, 0x7d, 0xa);
        } else
        {
            PlayCry_Normal((u16)sprite->data[0], 0);
        }
    }
}

void SpriteCB_FieldMoveMonSlideOffscreen(struct Sprite *);

void SpriteCB_FieldMoveMonWaitAfterCry(struct Sprite *sprite)
{
    if ((--sprite->data[1]) == 0)
    {
        sprite->callback = SpriteCB_FieldMoveMonSlideOffscreen;
    }
}

void SpriteCB_FieldMoveMonSlideOffscreen(struct Sprite *sprite)
{
    if (sprite->x < -0x40)
    {
        sprite->data[7] = 1;
    } else
    {
        sprite->x -= 20;
    }
}

void Task_SurfFieldEffect(u8);

u8 FldEff_UseSurf(void)
{
    u8 taskId;
    taskId = CreateTask(Task_SurfFieldEffect, 0xff);
    gTasks[taskId].data[15] = gFieldEffectArguments[0];
    Overworld_ClearSavedMusic();
    Overworld_ChangeMusicTo(MUS_SURF);
    return FALSE;
}

void (*const sSurfFieldEffectFuncs[])(struct Task *) = {
    SurfFieldEffect_Init,
    SurfFieldEffect_FieldMovePose,
    SurfFieldEffect_ShowMon,
    SurfFieldEffect_JumpOnSurfBlob,
    SurfFieldEffect_End
};

void Task_SurfFieldEffect(u8 taskId)
{
    sSurfFieldEffectFuncs[gTasks[taskId].data[0]](&gTasks[taskId]);
}

void SurfFieldEffect_Init(struct Task *task)
{
    ScriptContext2_Enable();
    FreezeObjectEvents();
    gPlayerAvatar.preventStep = TRUE;
    SetPlayerAvatarStateMask(8);
    PlayerGetDestCoords(&task->data[1], &task->data[2]);
    MoveCoords(gObjectEvents[gPlayerAvatar.objectEventId].movementDirection, &task->data[1], &task->data[2]);
    task->data[0]++;
}

void SurfFieldEffect_FieldMovePose(struct Task *task)
{
    struct ObjectEvent *objectEvent;
    objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    if (!ObjectEventIsMovementOverridden(objectEvent) || ObjectEventClearHeldMovementIfFinished(objectEvent))
    {
        SetPlayerAvatarFieldMove();
        ObjectEventSetHeldMovement(objectEvent, MOVEMENT_ACTION_START_ANIM_IN_DIRECTION);
        task->data[0]++;
    }
}

void SurfFieldEffect_ShowMon(struct Task *task)
{
    if (ObjectEventCheckHeldMovementStatus(&gObjectEvents[gPlayerAvatar.objectEventId]))
    {
        gFieldEffectArguments[0] = task->data[15] | 0x80000000;
        FieldEffectStart(FLDEFF_FIELD_MOVE_SHOW_MON_INIT);
        task->data[0]++;
    }
}

void SurfFieldEffect_JumpOnSurfBlob(struct Task *task)
{
    struct ObjectEvent *objectEvent;
    if (!FieldEffectActiveListContains(FLDEFF_FIELD_MOVE_SHOW_MON))
    {
        objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
        ObjectEventSetGraphicsId(objectEvent, GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_STATE_SURFING));
        ObjectEventClearHeldMovementIfFinished(objectEvent);
        ObjectEventSetHeldMovement(objectEvent, GetJumpSpecialMovementAction(objectEvent->movementDirection));
        gFieldEffectArguments[0] = task->data[1];
        gFieldEffectArguments[1] = task->data[2];
        gFieldEffectArguments[2] = gPlayerAvatar.objectEventId;
        objectEvent->fieldEffectSpriteId = FieldEffectStart(FLDEFF_SURF_BLOB);
        task->data[0]++;
    }
}

void SurfFieldEffect_End(struct Task *task)
{
    struct ObjectEvent *objectEvent;
    objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    if (ObjectEventClearHeldMovementIfFinished(objectEvent))
    {
        gPlayerAvatar.preventStep = FALSE;
        gPlayerAvatar.flags &= 0xdf;
        ObjectEventSetHeldMovement(objectEvent, GetFaceDirectionMovementAction(objectEvent->movementDirection));
        SetSurfBlob_BobState(objectEvent->fieldEffectSpriteId, 1);
        UnfreezeObjectEvents();
        ScriptContext2_Disable();
        FieldEffectActiveListRemove(FLDEFF_USE_SURF);
        DestroyTask(FindTaskIdByFunc(Task_SurfFieldEffect));
    }
}

void SpriteCB_NPCFlyOut(struct Sprite *);

u8 FldEff_NPCFlyOut(void)
{
    u8 spriteId = CreateSprite(gFieldEffectObjectTemplatePointers[26], 0x78, 0, 1);
    struct Sprite *sprite = &gSprites[spriteId];

    sprite->oam.paletteNum = 0;
    sprite->oam.priority = 1;
    sprite->callback = SpriteCB_NPCFlyOut;
    sprite->data[1] = gFieldEffectArguments[0];
    PlaySE(SE_M_FLY);
    return spriteId;
}

void SpriteCB_NPCFlyOut(struct Sprite *sprite)
{
    struct Sprite *npcSprite;
    sprite->x2 = Cos(sprite->data[2], 0x8c);
    sprite->y2 = Sin(sprite->data[2], 0x48);
    sprite->data[2] = (sprite->data[2] + 4) & 0xff;
    if (sprite->data[0])
    {
        npcSprite = &gSprites[sprite->data[1]];
        npcSprite->coordOffsetEnabled = FALSE;
        npcSprite->x = sprite->x + sprite->x2;
        npcSprite->y = sprite->y + sprite->y2 - 8;
        npcSprite->x2 = 0;
        npcSprite->y2 = 0;
    }
    if (sprite->data[2] >= 0x80)
        FieldEffectStop(sprite, FLDEFF_NPCFLY_OUT);
}

void Task_FlyOut(u8);
extern void SetSurfBlob_DontSyncAnim(u8, u8);
u8 CreateFlyBirdSprite(void);
bool8 GetFlyBirdAnimCompleted(u8);
void StartFlyBirdSwoopDown(u8);
void SetFlyBirdPlayerSpriteId(u8, u8);
void SpriteCB_FlyBirdLeaveBall(struct Sprite *);
void SpriteCB_FlyBirdSwoopDown(struct Sprite *);

u8 FldEff_UseFly(void)
{
    u8 taskId;
    taskId = CreateTask(Task_FlyOut, 0xfe);
    gTasks[taskId].data[1] = gFieldEffectArguments[0];
    return 0;
}

void (*const sFlyOutFieldEffectFuncs[])(struct Task *) = {
    FlyOutFieldEffect_FieldMovePose,
    FlyOutFieldEffect_ShowMon,
    FlyOutFieldEffect_BirdLeaveBall,
    FlyOutFieldEffect_WaitBirdLeave,
    FlyOutFieldEffect_BirdSwoopDown,
    FlyOutFieldEffect_JumpOnBird,
    FlyOutFieldEffect_FlyOffWithBird,
    FlyOutFieldEffect_WaitFlyOff,
    FlyOutFieldEffect_End
};

void Task_FlyOut(u8 taskId)
{
    sFlyOutFieldEffectFuncs[gTasks[taskId].data[0]](&gTasks[taskId]);
}

void FlyOutFieldEffect_FieldMovePose(struct Task *task)
{
    struct ObjectEvent *objectEvent;
    objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    if (!ObjectEventIsMovementOverridden(objectEvent) || ObjectEventClearHeldMovementIfFinished(objectEvent))
    {
        task->data[15] = gPlayerAvatar.flags;
        gPlayerAvatar.preventStep = TRUE;
        SetPlayerAvatarStateMask(1);
        SetPlayerAvatarFieldMove();
        ObjectEventSetHeldMovement(objectEvent, MOVEMENT_ACTION_START_ANIM_IN_DIRECTION);
        task->data[0]++;
    }
}

void FlyOutFieldEffect_ShowMon(struct Task *task)
{
    struct ObjectEvent *objectEvent;
    objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    if (ObjectEventClearHeldMovementIfFinished(objectEvent))
    {
        task->data[0]++;
        gFieldEffectArguments[0] = task->data[1];
        FieldEffectStart(FLDEFF_FIELD_MOVE_SHOW_MON_INIT);
    }
}

void FlyOutFieldEffect_BirdLeaveBall(struct Task *task)
{
    struct ObjectEvent *objectEvent;
    if (!FieldEffectActiveListContains(FLDEFF_FIELD_MOVE_SHOW_MON))
    {
        objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
        if (task->data[15] & 0x08)
        {
            SetSurfBlob_BobState(objectEvent->fieldEffectSpriteId, 2);
            SetSurfBlob_DontSyncAnim(objectEvent->fieldEffectSpriteId, 0);
        }
        task->data[1] = CreateFlyBirdSprite();
        task->data[0]++;
    }
}

void FlyOutFieldEffect_WaitBirdLeave(struct Task *task)
{
    if (GetFlyBirdAnimCompleted(task->data[1]))
    {
        task->data[0]++;
        task->data[2] = 16;
        SetPlayerAvatarTransitionFlags(PLAYER_AVATAR_FLAG_ON_FOOT);
        ObjectEventSetHeldMovement(&gObjectEvents[gPlayerAvatar.objectEventId], MOVEMENT_ACTION_FACE_LEFT);
    }
}

void FlyOutFieldEffect_BirdSwoopDown(struct Task *task)
{
    struct ObjectEvent *objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    if ((task->data[2] == 0 || (--task->data[2]) == 0) && ObjectEventClearHeldMovementIfFinished(objectEvent))
    {
        task->data[0]++;
        PlaySE(SE_M_FLY);
        StartFlyBirdSwoopDown(task->data[1]);
    }
}

void FlyOutFieldEffect_JumpOnBird(struct Task *task)
{
    struct ObjectEvent *objectEvent;
    if ((++task->data[2]) >= 8)
    {
        objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
        ObjectEventSetGraphicsId(objectEvent, GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_STATE_SURFING));
        StartSpriteAnim(&gSprites[objectEvent->spriteId], 0x16);
        objectEvent->inanimate = 1;
        ObjectEventSetHeldMovement(objectEvent, MOVEMENT_ACTION_JUMP_IN_PLACE_LEFT);
        if (task->data[15] & 0x08)
        {
            DestroySprite(&gSprites[objectEvent->fieldEffectSpriteId]);
        }
        task->data[0]++;
        task->data[2] = 0;
    }
}

void FlyOutFieldEffect_FlyOffWithBird(struct Task *task)
{
    struct ObjectEvent *objectEvent;
    if ((++task->data[2]) >= 10)
    {
        objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
        ObjectEventClearHeldMovementIfActive(objectEvent);
        objectEvent->inanimate = 0;
        objectEvent->hasShadow = 0;
        SetFlyBirdPlayerSpriteId(task->data[1], objectEvent->spriteId);
        CameraObjectReset2();
        task->data[0]++;
    }
}

void FlyOutFieldEffect_WaitFlyOff(struct Task *task)
{
    if (GetFlyBirdAnimCompleted(task->data[1]))
    {
        WarpFadeScreen();
        task->data[0]++;
    }
}

void FlyOutFieldEffect_End(struct Task *task)
{
    if (!gPaletteFade.active)
    {
        FieldEffectActiveListRemove(FLDEFF_USE_FLY);
        DestroyTask(FindTaskIdByFunc(Task_FlyOut));
    }
}

u8 CreateFlyBirdSprite(void)
{
    u8 spriteId;
    struct Sprite *sprite;
    spriteId = CreateSprite(gFieldEffectObjectTemplatePointers[26], 0xff, 0xb4, 0x1);
    sprite = &gSprites[spriteId];
    sprite->oam.paletteNum = 0;
    sprite->oam.priority = 1;
    sprite->callback = SpriteCB_FlyBirdLeaveBall;
    return spriteId;
}

u8 GetFlyBirdAnimCompleted(u8 spriteId)
{
    return gSprites[spriteId].data[7];
}

void StartFlyBirdSwoopDown(u8 spriteId)
{
    struct Sprite *sprite;
    sprite = &gSprites[spriteId];
    sprite->callback = SpriteCB_FlyBirdSwoopDown;
    sprite->x = DISPLAY_WIDTH / 2;;
    sprite->y = 0x00;
    sprite->x2 = 0;
    sprite->y2 = 0;
    memset(&sprite->data[0], 0, 8 * sizeof(u16) /* zero all data cells */);
    sprite->data[6] = MAX_SPRITES;
}

void SetFlyBirdPlayerSpriteId(u8 birdSpriteId, u8 playerSpriteId)
{
    gSprites[birdSpriteId].data[6] = playerSpriteId;
}

const union AffineAnimCmd SpriteAffineAnim_839F41C[] = {
    AFFINEANIMCMD_FRAME(8, 8, -30, 0),
    AFFINEANIMCMD_FRAME(28, 28, 0, 30),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd SpriteAffineAnim_839F434[] = {
    AFFINEANIMCMD_FRAME(256, 256, 64, 0),
    AFFINEANIMCMD_FRAME(-10, -10, 0, 22),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_0839F44C[] = {
    SpriteAffineAnim_839F41C,
    SpriteAffineAnim_839F434
};

void SpriteCB_FlyBirdLeaveBall(struct Sprite *sprite)
{
    if (sprite->data[7] == 0)
    {
        if (sprite->data[0] == 0)
        {
            sprite->oam.affineMode = 3;
            sprite->affineAnims = gSpriteAffineAnimTable_0839F44C;
            InitSpriteAffineAnim(sprite);
            StartSpriteAffineAnim(sprite, 0);
            sprite->x = 0x76;
            sprite->y = -0x30;
            sprite->data[0]++;
            sprite->data[1] = 0x40;
            sprite->data[2] = 0x100;
        }
        sprite->data[1] += (sprite->data[2] >> 8);
        sprite->x2 = Cos(sprite->data[1], 0x78);
        sprite->y2 = Sin(sprite->data[1], 0x78);
        if (sprite->data[2] < 0x800)
        {
            sprite->data[2] += 0x60;
        }
        if (sprite->data[1] > 0x81)
        {
            sprite->data[7]++;
            sprite->oam.affineMode = 0;
            FreeOamMatrix(sprite->oam.matrixNum);
            CalcCenterToCornerVec(sprite, sprite->oam.shape, sprite->oam.size, 0);
        }
    }
}

void SpriteCB_FlyBirdSwoopDown(struct Sprite *sprite)
{
    struct Sprite *sprite1;
    sprite->x2 = Cos(sprite->data[2], 0x8c);
    sprite->y2 = Sin(sprite->data[2], 0x48);
    sprite->data[2] = (sprite->data[2] + 4) & 0xff;
    if (sprite->data[6] != 0x40)
    {
        sprite1 = &gSprites[sprite->data[6]];
        sprite1->coordOffsetEnabled = 0;
        sprite1->x = sprite->x + sprite->x2;
        sprite1->y = sprite->y + sprite->y2 - 8;
        sprite1->x2 = 0;
        sprite1->y2 = 0;
    }
    if (sprite->data[2] >= 0x80)
    {
        sprite->data[7] = 1;
    }
}

void SpriteCB_FlyBirdReturnToBall(struct Sprite *sprite)
{
    if (sprite->data[7] == 0)
    {
        if (sprite->data[0] == 0)
        {
            sprite->oam.affineMode = 3;
            sprite->affineAnims = gSpriteAffineAnimTable_0839F44C;
            InitSpriteAffineAnim(sprite);
            StartSpriteAffineAnim(sprite, 1);
            sprite->x = 0x5e;
            sprite->y = -0x20;
            sprite->data[0]++;
            sprite->data[1] = 0xf0;
            sprite->data[2] = 0x800;
            sprite->data[4] = 0x80;
        }
        sprite->data[1] += sprite->data[2] >> 8;
        sprite->data[3] += sprite->data[2] >> 8;
        sprite->data[1] &= 0xff;
        sprite->x2 = Cos(sprite->data[1], 0x20);
        sprite->y2 = Sin(sprite->data[1], 0x78);
        if (sprite->data[2] > 0x100)
        {
            sprite->data[2] -= sprite->data[4];
        }
        if (sprite->data[4] < 0x100)
        {
            sprite->data[4] += 24;
        }
        if (sprite->data[2] < 0x100)
        {
            sprite->data[2] = 0x100;
        }
        if (sprite->data[3] >= 60)
        {
            sprite->data[7]++;
            sprite->oam.affineMode = 0;
            FreeOamMatrix(sprite->oam.matrixNum);
            sprite->invisible = TRUE;
        }
    }
}

void StartFlyBirdReturnToBall(u8 spriteId)
{
    StartFlyBirdSwoopDown(spriteId); // Set up is the same, but overrwrites the callback below
    gSprites[spriteId].callback = SpriteCB_FlyBirdReturnToBall;
}

void Task_FlyIn(u8);

u8 FldEff_FlyIn(void)
{
    CreateTask(Task_FlyIn, 0xfe);
    return 0;
}

void (*const sFlyInFieldEffectFuncs[])(struct Task *) = {
    FlyInFieldEffect_BirdSwoopDown,
    FlyInFieldEffect_FlyInWithBird,
    FlyInFieldEffect_JumpOffBird,
    FlyInFieldEffect_FieldMovePose,
    FlyInFieldEffect_BirdReturnToBall,
    FlyInFieldEffect_WaitBirdReturn,
    FlyInFieldEffect_End
};

void Task_FlyIn(u8 taskId)
{
    sFlyInFieldEffectFuncs[gTasks[taskId].data[0]](&gTasks[taskId]);
}

void FlyInFieldEffect_BirdSwoopDown(struct Task *task)
{
    struct ObjectEvent *objectEvent;
    objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    if (!ObjectEventIsMovementOverridden(objectEvent) || ObjectEventClearHeldMovementIfFinished(objectEvent))
    {
        task->data[0]++;
        task->data[2] = 17;
        task->data[15] = gPlayerAvatar.flags;
        gPlayerAvatar.preventStep = TRUE;
        SetPlayerAvatarStateMask(0x01);
        if (task->data[15] & 0x08)
        {
            SetSurfBlob_BobState(objectEvent->fieldEffectSpriteId, 0);
        }
        ObjectEventSetGraphicsId(objectEvent, GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_STATE_SURFING));
        CameraObjectReset2();
        ObjectEventTurn(objectEvent, DIR_WEST);
        StartSpriteAnim(&gSprites[objectEvent->spriteId], 0x16);
        objectEvent->invisible = FALSE;
        task->data[1] = CreateFlyBirdSprite();
        StartFlyBirdSwoopDown(task->data[1]);
        SetFlyBirdPlayerSpriteId(task->data[1], objectEvent->spriteId);
    }
}

void FlyInFieldEffect_FlyInWithBird(struct Task *task)
{
    struct ObjectEvent *objectEvent;
    struct Sprite *sprite;
    if (task->data[2] == 0 || (--task->data[2]) == 0)
    {
        objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
        sprite = &gSprites[objectEvent->spriteId];
        SetFlyBirdPlayerSpriteId(task->data[1], 0x40);
        sprite->x += sprite->x2;
        sprite->y += sprite->y2;
        sprite->x2 = 0;
        sprite->y2 = 0;
        task->data[0]++;
        task->data[2] = 0;
    }
}

void FlyInFieldEffect_JumpOffBird(struct Task *task)
{
    s16 sYPositions[18] = {
        -2,
        -4,
        -5,
        -6,
        -7,
        -8,
        -8,
        -8,
        -7,
        -7,
        -6,
        -5,
        -3,
        -2,
        0,
        2,
        4,
        8
    };
    struct Sprite *sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->y2 = sYPositions[task->data[2]];
    if ((++task->data[2]) >= (int)ARRAY_COUNT(sYPositions))
    {
        task->data[0]++;
    }
}

void FlyInFieldEffect_FieldMovePose(struct Task *task)
{
    struct ObjectEvent *objectEvent;
    struct Sprite *sprite;
    if (GetFlyBirdAnimCompleted(task->data[1]))
    {
        objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
        sprite = &gSprites[objectEvent->spriteId];
        objectEvent->inanimate = FALSE;
        MoveObjectEventToMapCoords(objectEvent, objectEvent->currentCoords.x, objectEvent->currentCoords.y);
        sprite->x2 = 0;
        sprite->y2 = 0;
        sprite->coordOffsetEnabled = TRUE;
        SetPlayerAvatarFieldMove();
        ObjectEventSetHeldMovement(objectEvent, MOVEMENT_ACTION_START_ANIM_IN_DIRECTION);
        task->data[0]++;
    }
}

void FlyInFieldEffect_BirdReturnToBall(struct Task *task)
{
    if (ObjectEventClearHeldMovementIfFinished(&gObjectEvents[gPlayerAvatar.objectEventId]))
    {
        task->data[0]++;
        StartFlyBirdReturnToBall(task->data[1]);
    }
}

void FlyInFieldEffect_WaitBirdReturn(struct Task *task)
{
    if (GetFlyBirdAnimCompleted(task->data[1]))
    {
        DestroySprite(&gSprites[task->data[1]]);
        task->data[0]++;
        task->data[1] = 0x10;
    }
}

void FlyInFieldEffect_End(struct Task *task)
{
    u8 state;
    struct ObjectEvent *objectEvent;
    if ((--task->data[1]) == 0)
    {
        objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
        state = PLAYER_AVATAR_STATE_NORMAL;
        if (task->data[15] & 0x08)
        {
            state = PLAYER_AVATAR_STATE_SURFING;
            SetSurfBlob_BobState(objectEvent->fieldEffectSpriteId, 1);
        }
        ObjectEventSetGraphicsId(objectEvent, GetPlayerAvatarGraphicsIdByStateId(state));
        ObjectEventTurn(objectEvent, DIR_SOUTH);
        gPlayerAvatar.flags = task->data[15];
        gPlayerAvatar.preventStep = FALSE;
        FieldEffectActiveListRemove(FLDEFF_FLY_IN);
        DestroyTask(FindTaskIdByFunc(Task_FlyIn));
    }
}
