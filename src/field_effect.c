#include "global.h"
#include "data2.h"
#include "script.h"
#include "trig.h"
#include "main.h"
#include "field_effect_helpers.h"
#include "field_weather.h"
#include "decompress.h"
#include "sprite.h"
#include "menu.h"
#include "palette.h"
#include "text.h"
#include "overworld.h"
#include "task.h"
#include "sound.h"
#include "decoration.h"
#include "field_player_avatar.h"
#include "event_object_movement.h"
#include "metatile_behavior.h"
#include "field_camera.h"
#include "field_control_avatar.h"
#include "field_effect.h"
#include "field_fadetransition.h"
#include "fieldmap.h"
#include "util.h"
#include "pokemon_storage_system.h"
#include "constants/event_object_movement_constants.h"
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
const u32 gFieldMoveStreaksTiles[] = INCBIN_U32("graphics/misc/field_move_streaks.4bpp");
const u16 gFieldMoveStreaksPalette[16] = INCBIN_U16("graphics/misc/field_move_streaks.gbapal");
const u16 gFieldMoveStreaksTilemap[] = INCBIN_U16("graphics/misc/field_move_streaks_map.bin");

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
    sub_80867AC,
    sub_8086854,
    sub_8086870,
    sub_80868E4,
    sub_808699C,
    sub_80869B8,
    sub_80869F8
};

bool8 (*const gUnknown_0839F2E8[])(struct Task *) = {
    sub_8086AA0,
    sub_8086AC0,
    sub_8086B30,
    sub_8086B54,
    sub_8086B64,
    sub_8086B88
};

bool8 (*const gUnknown_0839F300[])(struct Task *) = {
    sub_8086CF4,
    sub_8086D70,
    sub_8086DB0,
    sub_8086E10,
    sub_8086E50,
    sub_8086EB0,
    sub_8086ED4
};

bool8 (*const gUnknown_0839F31C[])(struct Task *, struct EventObject *) = {
    sub_8086FB0,
    waterfall_1_do_anim_probably,
    waterfall_2_wait_anim_finish_probably,
    sub_8087030,
    sub_8087058
};

bool8 (*const gUnknown_0839F330[])(struct Task *) = {
    sub_8087124,
    dive_2_unknown,
    dive_3_unknown
};

bool8 (*const gUnknown_0839F33C[])(struct Task *, struct EventObject *, struct Sprite *) = {
    sub_808722C,
    sub_8087264,
    sub_8087298,
    sub_80872E4,
    sub_80873D8,
    sub_80873F4
};

bool8 (*const gUnknown_0839F354[])(struct Task *, struct EventObject *, struct Sprite *) = {
    sub_80874CC,
    sub_80874FC,
    sub_8087548,
    sub_808759C
};

bool8 (*const gUnknown_0839F364[])(struct Task *, struct EventObject *, struct Sprite *) = {
    sub_80876C8,
    sub_80876F8,
    sub_8087774,
    sub_80877AC,
    sub_80877D4
};

static void EscapeRopeFieldEffect_Step0(struct Task *);
static void EscapeRopeFieldEffect_Step1(struct Task *);
void (*const gEscapeRopeFieldEffectFuncs[])(struct Task *) = {
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
    DecompressPicFromTable_2(&gMonFrontPicTable[species], gMonFrontPicCoords[species].coords, gMonFrontPicCoords[species].y_offset, gUnknown_081FAF4C[3], gUnknown_081FAF4C[3], species);
    LoadCompressedObjectPalette(&gMonPaletteTable[species]);
    GetMonSpriteTemplate_803C56C(species, 3);
    gUnknown_02024E8C.paletteTag = gMonPaletteTable[0].tag;
    PreservePaletteInWeather(IndexOfSpritePaletteTag(gMonPaletteTable[0].tag) + 0x10);
    return CreateSprite(&gUnknown_02024E8C, x, y, subpriority);
}

u8 CreateMonSprite_FieldMove(u16 species, u32 d, u32 g, s16 x, s16 y, u8 subpriority)
{
    const struct CompressedSpritePalette *spritePalette;

    HandleLoadSpecialPokePic(&gMonFrontPicTable[species], gMonFrontPicCoords[species].coords, gMonFrontPicCoords[species].y_offset, (u32)gUnknown_081FAF4C[3] /* this is actually u8* or something, pointing to ewram */, gUnknown_081FAF4C[3], species, g);
    spritePalette = GetMonSpritePalStructFromOtIdPersonality(species, d, g);
    LoadCompressedObjectPalette(spritePalette);
    GetMonSpriteTemplate_803C56C(species, 3);
    gUnknown_02024E8C.paletteTag = spritePalette->tag;
    PreservePaletteInWeather(IndexOfSpritePaletteTag(spritePalette->tag) + 0x10);
    return CreateSprite(&gUnknown_02024E8C, x, y, subpriority);
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

#ifdef NONMATCHING
void MultiplyInvertedPaletteRGBComponents(u16 i, u8 r, u8 g, u8 b)
{
    int curRed;
    int curGreen;
    int curBlue;

    curRed = gPlttBufferUnfaded[i] & 0x1f;
    curGreen = (gPlttBufferUnfaded[i] & (0x1f << 5)) >> 5;
    curBlue = (gPlttBufferUnfaded[i] & (0x1f << 10)) >> 10;
    curRed += (((0x1f - curRed) * r) >> 4);
    curGreen += (((0x1f - curGreen) * g) >> 4);
    curBlue += (((0x1f - curBlue) * b) >> 4);
    gPlttBufferFaded[i] = RGB(curRed, curGreen, curBlue);
}

void MultiplyPaletteRGBComponents(u16 i, u8 r, u8 g, u8 b)
{
    int curRed;
    int curGreen;
    int curBlue;

    curRed = gPlttBufferUnfaded[i] & 0x1f;
    curGreen = (gPlttBufferUnfaded[i] & (0x1f << 5)) >> 5;
    curBlue = (gPlttBufferUnfaded[i] & (0x1f << 10)) >> 10;
    curRed -= ((curRed * r) >> 4);
    curGreen -= ((curGreen * g) >> 4);
    curBlue -= ((curBlue * b) >> 4);
    gPlttBufferFaded[i] = RGB(curRed, curGreen, curBlue);
}
#else
NAKED
void MultiplyInvertedPaletteRGBComponents(u16 i, u8 r, u8 g, u8 b)
{
    asm(".syntax unified\n"
    "\tpush {r4-r7,lr}\n"
    "\tmov r7, r9\n"
    "\tmov r6, r8\n"
    "\tpush {r6,r7}\n"
    "\tlsls r0, 16\n"
    "\tlsls r1, 24\n"
    "\tlsrs r1, 24\n"
    "\tlsls r2, 24\n"
    "\tlsrs r2, 24\n"
    "\tlsls r3, 24\n"
    "\tlsrs r3, 24\n"
    "\tldr r4, _08085D00 @ =gPlttBufferUnfaded\n"
    "\tlsrs r0, 15\n"
    "\tadds r4, r0, r4\n"
    "\tldrh r4, [r4]\n"
    "\tmovs r5, 0x1F\n"
    "\tmov r9, r5\n"
    "\tmov r8, r4\n"
    "\tmov r6, r8\n"
    "\tands r6, r5\n"
    "\tmov r8, r6\n"
    "\tmovs r6, 0xF8\n"
    "\tlsls r6, 2\n"
    "\tands r6, r4\n"
    "\tlsrs r6, 5\n"
    "\tmovs r5, 0xF8\n"
    "\tlsls r5, 7\n"
    "\tands r4, r5\n"
    "\tlsrs r4, 10\n"
    "\tmov r7, r9\n"
    "\tmov r5, r8\n"
    "\tsubs r7, r5\n"
    "\tmov r12, r7\n"
    "\tmov r7, r12\n"
    "\tmuls r7, r1\n"
    "\tadds r1, r7, 0\n"
    "\tasrs r1, 4\n"
    "\tadd r8, r1\n"
    "\tmov r5, r9\n"
    "\tsubs r1, r5, r6\n"
    "\tmuls r1, r2\n"
    "\tasrs r1, 4\n"
    "\tadds r6, r1\n"
    "\tsubs r5, r4\n"
    "\tmov r9, r5\n"
    "\tmov r1, r9\n"
    "\tmuls r1, r3\n"
    "\tasrs r1, 4\n"
    "\tadds r4, r1\n"
    "\tmov r7, r8\n"
    "\tlsls r7, 16\n"
    "\tlsls r6, 21\n"
    "\torrs r6, r7\n"
    "\tlsls r4, 26\n"
    "\torrs r4, r6\n"
    "\tlsrs r4, 16\n"
    "\tldr r1, _08085D04 @ =gPlttBufferFaded\n"
    "\tadds r0, r1\n"
    "\tstrh r4, [r0]\n"
    "\tpop {r3,r4}\n"
    "\tmov r8, r3\n"
    "\tmov r9, r4\n"
    "\tpop {r4-r7}\n"
    "\tpop {r0}\n"
    "\tbx r0\n"
    "\t.align 2, 0\n"
    "_08085D00: .4byte gPlttBufferUnfaded\n"
    "_08085D04: .4byte gPlttBufferFaded\n"
    ".syntax divided");
}

NAKED
void MultiplyPaletteRGBComponents(u16 i, u8 r, u8 g, u8 b)
{
    asm(".syntax unified\n"
    "\tpush {r4-r6,lr}\n"
    "\tmov r6, r8\n"
    "\tpush {r6}\n"
    "\tlsls r0, 16\n"
    "\tlsls r1, 24\n"
    "\tlsrs r1, 24\n"
    "\tlsls r2, 24\n"
    "\tlsrs r2, 24\n"
    "\tlsls r3, 24\n"
    "\tlsrs r3, 24\n"
    "\tldr r4, _08085D78 @ =gPlttBufferUnfaded\n"
    "\tlsrs r0, 15\n"
    "\tadds r4, r0, r4\n"
    "\tldrh r4, [r4]\n"
    "\tmovs r5, 0x1F\n"
    "\tmov r8, r5\n"
    "\tmov r6, r8\n"
    "\tands r6, r4\n"
    "\tmov r8, r6\n"
    "\tmovs r5, 0xF8\n"
    "\tlsls r5, 2\n"
    "\tands r5, r4\n"
    "\tlsrs r5, 5\n"
    "\tmovs r6, 0xF8\n"
    "\tlsls r6, 7\n"
    "\tands r4, r6\n"
    "\tlsrs r4, 10\n"
    "\tmov r6, r8\n"
    "\tmuls r6, r1\n"
    "\tadds r1, r6, 0\n"
    "\tasrs r1, 4\n"
    "\tmov r6, r8\n"
    "\tsubs r6, r1\n"
    "\tadds r1, r5, 0\n"
    "\tmuls r1, r2\n"
    "\tasrs r1, 4\n"
    "\tsubs r5, r1\n"
    "\tadds r1, r4, 0\n"
    "\tmuls r1, r3\n"
    "\tasrs r1, 4\n"
    "\tsubs r4, r1\n"
    "\tlsls r6, 16\n"
    "\tlsls r5, 21\n"
    "\torrs r5, r6\n"
    "\tlsls r4, 26\n"
    "\torrs r4, r5\n"
    "\tlsrs r4, 16\n"
    "\tldr r1, _08085D7C @ =gPlttBufferFaded\n"
    "\tadds r0, r1\n"
    "\tstrh r4, [r0]\n"
    "\tpop {r3}\n"
    "\tmov r8, r3\n"
    "\tpop {r4-r6}\n"
    "\tpop {r0}\n"
    "\tbx r0\n"
    "\t.align 2, 0\n"
    "_08085D78: .4byte gPlttBufferUnfaded\n"
    "_08085D7C: .4byte gPlttBufferFaded\n"
    ".syntax divided");
}
#endif

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
    sprite->pos2.x = x;
    sprite->pos2.y = y;
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
        endSpriteId = CreateSpriteAtEnd(&gSpriteTemplate_839F208, gUnknown_0839F2A8[sprite->data[2]].x + sprite->pos2.x, gUnknown_0839F2A8[sprite->data[2]].y + sprite->pos2.y, 0);
        gSprites[endSpriteId].oam.priority = 2;
        gSprites[endSpriteId].data[0] = sprite->data[7];
        sprite->data[2]++;
        sprite->data[6]--;
        PlaySE(SE_BOWA);
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
            PlayFanfare(MUS_ME_ASA);
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
    sprite->invisible = 1;
    SetSubspriteTables(sprite, &gUnknown_0839F1A0);
    return spriteIdAtEnd;
}

void SpriteCB_PokecenterMonitor(struct Sprite *sprite)
{
    if (sprite->data[0] != 0)
    {
        sprite->data[0] = 0;
        sprite->invisible = 0;
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
    gSprites[spriteIdAtEnd].invisible = 1;
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

void mapldr_080842E8(void);
void mapldr_08084390(void);
void task00_8084310(u8);
void c3_080843F8(u8);

void sub_80865BC(void)
{
    SetMainCallback2(c2_exit_to_overworld_2_switch);
    gFieldCallback = mapldr_080842E8;
}

void mapldr_080842E8(void)
{
    pal_fill_black();
    CreateTask(task00_8084310, 0);
    ScriptContext2_Enable();
    FreezeEventObjects();
    gFieldCallback = NULL;
}

void task00_8084310(u8 taskId)
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
        gFieldCallback = mapldr_08084390;
        DestroyTask(taskId);
    }
}

void mapldr_08084390(void)
{
    Overworld_PlaySpecialMapMusic();
    pal_fill_black();
    CreateTask(c3_080843F8, 0);
    gEventObjects[gPlayerAvatar.eventObjectId].invisible = 1;
    if (gPlayerAvatar.flags & 0x08)
    {
        EventObjectTurn(&gEventObjects[gPlayerAvatar.eventObjectId], DIR_WEST);
    }
    ScriptContext2_Enable();
    FreezeEventObjects();
    gFieldCallback = NULL;
}

void c3_080843F8(u8 taskId)
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
        UnfreezeEventObjects();
        DestroyTask(taskId);
    }
}

void sub_8086774(u8);
extern void CameraObjectReset2(void);
extern void CameraObjectReset1(void);

void sub_8086748(void)
{
    Overworld_PlaySpecialMapMusic();
    pal_fill_for_map_transition();
    ScriptContext2_Enable();
    FreezeEventObjects();
    CreateTask(sub_8086774, 0);
    gFieldCallback = NULL;
}

void sub_8086774(u8 taskId)
{
    struct Task *task;
    task = &gTasks[taskId];
    while (gUnknown_0839F2CC[task->data[0]](task)); // return code signifies whether to continue blocking here
}

bool8 sub_80867AC(struct Task *task) // gUnknown_0839F2CC[0]
{
    struct EventObject *playerObject;
    struct Sprite *playerSprite;
    playerObject = &gEventObjects[gPlayerAvatar.eventObjectId];
    playerSprite = &gSprites[gPlayerAvatar.spriteId];
    CameraObjectReset2();
    gEventObjects[gPlayerAvatar.eventObjectId].invisible = 1;
    gPlayerAvatar.preventStep = TRUE;
    EventObjectSetHeldMovement(playerObject, GetFaceDirectionMovementAction(GetPlayerFacingDirection()));
    task->data[4] = playerSprite->subspriteMode;
    playerObject->fixedPriority = 1;
    playerSprite->oam.priority = 1;
    playerSprite->subspriteMode = 2;
    task->data[0]++;
    return TRUE;
}

bool8 sub_8086854(struct Task *task) // gUnknown_0839F2CC[1]
{
    if (IsWeatherNotFadingIn())
    {
        task->data[0]++;
    }
    return FALSE;
}

bool8 sub_8086870(struct Task *task) // gUnknown_0839F2CC[2]
{
    struct Sprite *sprite;
    s16 centerToCornerVecY;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    centerToCornerVecY = -(sprite->centerToCornerVecY << 1);
    sprite->pos2.y = -(sprite->pos1.y + sprite->centerToCornerVecY + gSpriteCoordOffsetY + centerToCornerVecY);
    task->data[1] = 1;
    task->data[2] = 0;
    gEventObjects[gPlayerAvatar.eventObjectId].invisible = 0;
    PlaySE(SE_RU_HYUU);
    task->data[0]++;
    return FALSE;
}

bool8 sub_80868E4(struct Task *task)
{
    struct EventObject *eventObject;
    struct Sprite *sprite;

    eventObject = &gEventObjects[gPlayerAvatar.eventObjectId];
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->pos2.y += task->data[1];
    if (task->data[1] < 8)
    {
        task->data[2] += task->data[1];
        if (task->data[2] & 0xf)
        {
            task->data[1] <<= 1;
        }
    }
    if (task->data[3] == 0 && sprite->pos2.y >= -16)
    {
        task->data[3]++;
        eventObject->fixedPriority = 0;
        sprite->subspriteMode = task->data[4];
        eventObject->triggerGroundEffectsOnMove = 1;
    }
    if (sprite->pos2.y >= 0)
    {
        PlaySE(SE_W070);
        eventObject->triggerGroundEffectsOnStop = 1;
        eventObject->landingJump = 1;
        sprite->pos2.y = 0;
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

bool8 sub_80869B8(struct Task *task)
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

bool8 sub_80869F8(struct Task *task)
{
    gPlayerAvatar.preventStep = FALSE;
    ScriptContext2_Disable();
    CameraObjectReset1();
    UnfreezeEventObjects();
    InstallCameraPanAheadCallback();
    DestroyTask(FindTaskIdByFunc(sub_8086774));
    return FALSE;
}

void sub_8086A68(u8);
extern void sub_80B4824(u8);
extern void TryFadeOutOldMapMusic(void);

void sub_8086B98(struct Task *);
void sub_8086BE4(struct Task *);
void sub_8086C30(void);
void sub_8086C40(void);
bool8 BGMusicStopped(void);
void sub_8086C94(void);
void sub_80B483C(void);
void sub_8086CBC(u8);

void sub_8086A2C(u8 a0, u8 priority)
{
    u8 taskId;
    taskId = CreateTask(sub_8086A68, priority);
    gTasks[taskId].data[1] = 0;
    if (a0 == 0x6a)
    {
        gTasks[taskId].data[1] = 1;
    }
}

void sub_8086A68(u8 taskId)
{
    struct Task *task;
    task = &gTasks[taskId];
    while (gUnknown_0839F2E8[task->data[0]](task));
}

bool8 sub_8086AA0(struct Task *task)
{
    FreezeEventObjects();
    CameraObjectReset2();
    sub_80B4824(task->data[1]);
    task->data[0]++;
    return FALSE;
}

bool8 sub_8086AC0(struct Task *task)
{
    struct EventObject *eventObject;
    eventObject = &gEventObjects[gPlayerAvatar.eventObjectId];
    if (!EventObjectIsMovementOverridden(eventObject) || EventObjectClearHeldMovementIfFinished(eventObject))
    {
        EventObjectSetHeldMovement(eventObject, GetFaceDirectionMovementAction(GetPlayerFacingDirection()));
        task->data[0]++;
        task->data[2] = 0;
        task->data[3] = 0;
        if ((u8)task->data[1] == 0)
        {
            task->data[0] = 4;
        }
        PlaySE(SE_ESUKA);
    }
    return FALSE;
}

bool8 sub_8086B30(struct Task *task)
{
    sub_8086B98(task);
    if (task->data[2] > 3)
    {
        sub_8086C30();
        task->data[0]++;
    }
    return FALSE;
}

bool8 sub_8086B54(struct Task *task)
{
    sub_8086B98(task);
    sub_8086C40();
    return FALSE;
}

bool8 sub_8086B64(struct Task *task)
{
    sub_8086BE4(task);
    if (task->data[2] > 3)
    {
        sub_8086C30();
        task->data[0]++;
    }
    return FALSE;
}

bool8 sub_8086B88(struct Task *task)
{
    sub_8086BE4(task);
    sub_8086C40();
    return FALSE;
}

void sub_8086B98(struct Task *task)
{
    struct Sprite *sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->pos2.x = Cos(0x84, task->data[2]);
    sprite->pos2.y = Sin(0x94, task->data[2]);
    task->data[3]++;
    if (task->data[3] & 1)
    {
        task->data[2]++;
    }
}

void sub_8086BE4(struct Task *task)
{
    struct Sprite *sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->pos2.x = Cos(0x7c, task->data[2]);
    sprite->pos2.y = Sin(0x76, task->data[2]);
    task->data[3]++;
    if (task->data[3] & 1)
    {
        task->data[2]++;
    }
}

void sub_8086C30(void)
{
    TryFadeOutOldMapMusic();
    WarpFadeScreen();
}

void sub_8086C40(void)
{
    if (!gPaletteFade.active && BGMusicStopped() == TRUE)
    {
        sub_80B483C();
        WarpIntoMap();
        gFieldCallback = sub_8086C94;
        SetMainCallback2(CB2_LoadMap);
        DestroyTask(FindTaskIdByFunc(sub_8086A68));
    }
}

void sub_8086C94(void)
{
    Overworld_PlaySpecialMapMusic();
    pal_fill_for_map_transition();
    ScriptContext2_Enable();
    CreateTask(sub_8086CBC, 0);
    gFieldCallback = NULL;
}

void sub_8086CBC(u8 taskId)
{
    struct Task *task;
    task = &gTasks[taskId];
    while (gUnknown_0839F300[task->data[0]](task));
}

bool8 sub_8086CF4(struct Task *task)
{
    struct EventObject *eventObject;
    s16 x;
    s16 y;
    u8 behavior;
    CameraObjectReset2();
    eventObject = &gEventObjects[gPlayerAvatar.eventObjectId];
    EventObjectSetHeldMovement(eventObject, GetFaceDirectionMovementAction(DIR_EAST));
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
    sub_80B4824(behavior);
    return TRUE;
}

bool8 sub_8086D70(struct Task *task)
{
    struct Sprite *sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->pos2.x = Cos(0x84, task->data[1]);
    sprite->pos2.y = Sin(0x94, task->data[1]);
    task->data[0]++;
    return FALSE;
}

bool8 sub_8086DB0(struct Task *task)
{
    struct Sprite *sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->pos2.x = Cos(0x84, task->data[1]);
    sprite->pos2.y = Sin(0x94, task->data[1]);
    task->data[2]++;
    if (task->data[2] & 1)
    {
        task->data[1]--;
    }
    if (task->data[1] == 0)
    {
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        task->data[0] = 5;
    }
    return FALSE;
}

bool8 sub_8086E10(struct Task *task)
{
    struct Sprite *sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->pos2.x = Cos(0x7c, task->data[1]);
    sprite->pos2.y = Sin(0x76, task->data[1]);
    task->data[0]++;
    return FALSE;
}

bool8 sub_8086E50(struct Task *task)
{
    struct Sprite *sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->pos2.x = Cos(0x7c, task->data[1]);
    sprite->pos2.y = Sin(0x76, task->data[1]);
    task->data[2]++;
    if (task->data[2] & 1)
    {
        task->data[1]--;
    }
    if (task->data[1] == 0)
    {
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        task->data[0]++;
    }
    return FALSE;
}

extern bool8 sub_80B4850(void);

bool8 sub_8086EB0(struct Task *task)
{
    if (sub_80B4850())
    {
        return FALSE;
    }
    sub_80B483C();
    task->data[0]++;
    return TRUE;
}

bool8 sub_8086ED4(struct Task *task)
{
    struct EventObject *eventObject;
    eventObject = &gEventObjects[gPlayerAvatar.eventObjectId];
    if (EventObjectClearHeldMovementIfFinished(eventObject))
    {
        CameraObjectReset1();
        ScriptContext2_Disable();
        EventObjectSetHeldMovement(eventObject, GetWalkNormalMovementAction(DIR_EAST));
        DestroyTask(FindTaskIdByFunc(sub_8086CBC));
    }
    return FALSE;
}

void sub_8086F64(u8);

bool8 FldEff_UseWaterfall(void)
{
    u8 taskId;
    taskId = CreateTask(sub_8086F64, 0xff);
    gTasks[taskId].data[1] = gFieldEffectArguments[0];
    sub_8086F64(taskId);
    return FALSE;
}

void sub_8086F64(u8 taskId)
{
    while (gUnknown_0839F31C[gTasks[taskId].data[0]](&gTasks[taskId], &gEventObjects[gPlayerAvatar.eventObjectId]));
}

bool8 sub_8086FB0(struct Task *task, struct EventObject *eventObject)
{
    ScriptContext2_Enable();
    gPlayerAvatar.preventStep = TRUE;
    task->data[0]++;
    return FALSE;
}

bool8 waterfall_1_do_anim_probably(struct Task *task, struct EventObject *eventObject)
{
    ScriptContext2_Enable();
    if (!EventObjectIsMovementOverridden(eventObject))
    {
        EventObjectClearHeldMovementIfFinished(eventObject);
        gFieldEffectArguments[0] = task->data[1];
        FieldEffectStart(FLDEFF_FIELD_MOVE_SHOW_MON_INIT);
        task->data[0]++;
    }
    return FALSE;
}

bool8 waterfall_2_wait_anim_finish_probably(struct Task *task, struct EventObject *eventObject)
{
    if (FieldEffectActiveListContains(FLDEFF_FIELD_MOVE_SHOW_MON))
    {
        return FALSE;
    }
    task->data[0]++;
    return TRUE;
}

bool8 sub_8087030(struct Task *task, struct EventObject *eventObject)
{
    EventObjectSetHeldMovement(eventObject, GetWalkSlowMovementAction(DIR_NORTH));
    task->data[0]++;
    return FALSE;
}

bool8 sub_8087058(struct Task *task, struct EventObject *eventObject)
{
    if (!EventObjectClearHeldMovementIfFinished(eventObject))
    {
        return FALSE;
    }
    if (MetatileBehavior_IsWaterfall(eventObject->currentMetatileBehavior))
    {
        task->data[0] = 3;
        return TRUE;
    }
    ScriptContext2_Disable();
    gPlayerAvatar.preventStep = FALSE;
    DestroyTask(FindTaskIdByFunc(sub_8086F64));
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
    while (gUnknown_0839F330[gTasks[taskId].data[0]](&gTasks[taskId]));
}

bool8 sub_8087124(struct Task *task)
{
    gPlayerAvatar.preventStep = TRUE;
    task->data[0]++;
    return FALSE;
}

bool8 dive_2_unknown(struct Task *task)
{
    ScriptContext2_Enable();
    gFieldEffectArguments[0] = task->data[15];
    FieldEffectStart(FLDEFF_FIELD_MOVE_SHOW_MON_INIT);
    task->data[0]++;
    return FALSE;
}

bool8 dive_3_unknown(struct Task *task)
{
    struct MapPosition mapPosition;
    PlayerGetDestCoords(&mapPosition.x, &mapPosition.y);
    if (!FieldEffectActiveListContains(FLDEFF_FIELD_MOVE_SHOW_MON))
    {
        dive_warp(&mapPosition, gEventObjects[gPlayerAvatar.eventObjectId].currentMetatileBehavior);
        DestroyTask(FindTaskIdByFunc(Task_Dive));
        FieldEffectActiveListRemove(FLDEFF_USE_DIVE);
    }
    return FALSE;
}

void sub_80871D0(u8);
void mapldr_080851BC(void);

void sub_80871B8(u8 priority)
{
    CreateTask(sub_80871D0, priority);
}

void sub_80871D0(u8 taskId)
{
    while (gUnknown_0839F33C[gTasks[taskId].data[0]](&gTasks[taskId], &gEventObjects[gPlayerAvatar.eventObjectId], &gSprites[gPlayerAvatar.spriteId]));
}

bool8 sub_808722C(struct Task *task, struct EventObject *eventObject, struct Sprite *sprite)
{
    FreezeEventObjects();
    CameraObjectReset2();
    SetCameraPanningCallback(NULL);
    gPlayerAvatar.preventStep = TRUE;
    eventObject->fixedPriority = 1;
    task->data[1] = 1;
    task->data[0]++;
    return TRUE;
}

bool8 sub_8087264(struct Task *task, struct EventObject *eventObject, struct Sprite *sprite)
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

bool8 sub_8087298(struct Task *task, struct EventObject *eventObject, struct Sprite *sprite)
{
    sprite->pos2.y = 0;
    task->data[3] = 1;
    gFieldEffectArguments[0] = eventObject->currentCoords.x;
    gFieldEffectArguments[1] = eventObject->currentCoords.y;
    gFieldEffectArguments[2] = sprite->subpriority - 1;
    gFieldEffectArguments[3] = sprite->oam.priority;
    FieldEffectStart(FLDEFF_LAVARIDGE_GYM_WARP);
    PlaySE(SE_W153);
    task->data[0]++;
    return TRUE;
}

bool8 sub_80872E4(struct Task *task, struct EventObject *eventObject, struct Sprite *sprite)
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
        if (sprite->pos2.y > -(sprite->pos1.y + sprite->centerToCornerVecY + gSpriteCoordOffsetY + centerToCornerVecY))
        {
            sprite->pos2.y -= task->data[3];
            if (task->data[3] <= 7)
            {
                task->data[3]++;
            }
        } else
        {
            task->data[4] = 1;
        }
    }
    if (task->data[5] == 0 && sprite->pos2.y < -0x10)
    {
        task->data[5]++;
        eventObject->fixedPriority = 1;
        sprite->oam.priority = 1;
        sprite->subspriteMode = 2;
    }
    if (task->data[1] == 0 && task->data[4] != 0)
    {
        task->data[0]++;
    }
    return FALSE;
}

bool8 sub_80873D8(struct Task *task, struct EventObject *eventObject, struct Sprite *sprite)
{
    TryFadeOutOldMapMusic();
    WarpFadeScreen();
    task->data[0]++;
    return FALSE;
}

bool8 sub_80873F4(struct Task *task, struct EventObject *eventObject, struct Sprite *sprite)
{
    if (!gPaletteFade.active && BGMusicStopped() == TRUE)
    {
        WarpIntoMap();
        gFieldCallback = mapldr_080851BC;
        SetMainCallback2(CB2_LoadMap);
        DestroyTask(FindTaskIdByFunc(sub_80871D0));
    }
    return FALSE;
}

void sub_8087470(u8);

void mapldr_080851BC(void)
{
    Overworld_PlaySpecialMapMusic();
    pal_fill_for_map_transition();
    ScriptContext2_Enable();
    gFieldCallback = NULL;
    CreateTask(sub_8087470, 0);
}

void sub_8087470(u8 taskId)
{
    while (gUnknown_0839F354[gTasks[taskId].data[0]](&gTasks[taskId], &gEventObjects[gPlayerAvatar.eventObjectId], &gSprites[gPlayerAvatar.spriteId]));
}

bool8 sub_80874CC(struct Task *task, struct EventObject *eventObject, struct Sprite *sprite)
{
    CameraObjectReset2();
    FreezeEventObjects();
    gPlayerAvatar.preventStep = TRUE;
    eventObject->invisible = 1;
    task->data[0]++;
    return FALSE;
}

bool8 sub_80874FC(struct Task *task, struct EventObject *eventObject, struct Sprite *sprite)
{
    if (IsWeatherNotFadingIn())
    {
        gFieldEffectArguments[0] = eventObject->currentCoords.x;
        gFieldEffectArguments[1] = eventObject->currentCoords.y;
        gFieldEffectArguments[2] = sprite->subpriority - 1;
        gFieldEffectArguments[3] = sprite->oam.priority;
        task->data[1] = FieldEffectStart(FLDEFF_POP_OUT_OF_ASH);
        task->data[0]++;
    }
    return FALSE;
}

bool8 sub_8087548(struct Task *task, struct EventObject *eventObject, struct Sprite *sprite)
{
    sprite = &gSprites[task->data[1]];
    if (sprite->animCmdIndex > 1)
    {
        task->data[0]++;
        eventObject->invisible = 0;
        CameraObjectReset1();
        PlaySE(SE_W091);
        EventObjectSetHeldMovement(eventObject, GetJumpMovementAction(DIR_EAST));
    }
    return FALSE;
}

bool8 sub_808759C(struct Task *task, struct EventObject *eventObject, struct Sprite *sprite)
{
    if (EventObjectClearHeldMovementIfFinished(eventObject))
    {
        gPlayerAvatar.preventStep = FALSE;
        ScriptContext2_Disable();
        UnfreezeEventObjects();
        DestroyTask(FindTaskIdByFunc(sub_8087470));
    }
    return FALSE;
}

extern void sub_8060470(s16 *x, s16 *y, s16 dx, s16 dy);
extern const struct SpriteTemplate *const gFieldEffectObjectTemplatePointers[36];

u8 FldEff_LavaridgeGymWarp(void)
{
    u8 spriteId;
    sub_8060470((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[33], gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    gSprites[spriteId].oam.priority = gFieldEffectArguments[3];
    gSprites[spriteId].coordOffsetEnabled = 1;
    return spriteId;
}

void sub_8087638(struct Sprite *sprite)
{
    if (sprite->animEnded)
    {
        FieldEffectStop(sprite, FLDEFF_LAVARIDGE_GYM_WARP);
    }
}

void sub_808766C(u8);

void sub_8087654(u8 priority)
{
    CreateTask(sub_808766C, priority);
}

void sub_808766C(u8 taskId)
{
    while(gUnknown_0839F364[gTasks[taskId].data[0]](&gTasks[taskId], &gEventObjects[gPlayerAvatar.eventObjectId], &gSprites[gPlayerAvatar.spriteId]));
}

bool8 sub_80876C8(struct Task *task, struct EventObject *eventObject, struct Sprite *sprite)
{
    FreezeEventObjects();
    CameraObjectReset2();
    gPlayerAvatar.preventStep = TRUE;
    eventObject->fixedPriority = 1;
    task->data[0]++;
    return FALSE;
}

bool8 sub_80876F8(struct Task *task, struct EventObject *eventObject, struct Sprite *sprite)
{
    if (EventObjectClearHeldMovementIfFinished(eventObject))
    {
        if (task->data[1] > 3)
        {
            gFieldEffectArguments[0] = eventObject->currentCoords.x;
            gFieldEffectArguments[1] = eventObject->currentCoords.y;
            gFieldEffectArguments[2] = sprite->subpriority - 1;
            gFieldEffectArguments[3] = sprite->oam.priority;
            task->data[1] = FieldEffectStart(FLDEFF_POP_OUT_OF_ASH);
            task->data[0]++;
        } else
        {
            task->data[1]++;
            EventObjectSetHeldMovement(eventObject, GetWalkInPlaceFastestMovementAction(eventObject->facingDirection));
            PlaySE(SE_FU_ZUZUZU);
        }
    }
    return FALSE;
}

bool8 sub_8087774(struct Task *task, struct EventObject *eventObject, struct Sprite *sprite)
{
    if (gSprites[task->data[1]].animCmdIndex == 2)
    {
        eventObject->invisible = 1;
        task->data[0]++;
    }
    return FALSE;
}

bool8 sub_80877AC(struct Task *task, struct EventObject *eventObject, struct Sprite *sprite)
{
    if (!FieldEffectActiveListContains(FLDEFF_POP_OUT_OF_ASH))
    {
        TryFadeOutOldMapMusic();
        WarpFadeScreen();
        task->data[0]++;
    }
    return FALSE;
}

static void DoEscapeRopeFieldEffect(u8);
void mapldr_080859D4(void);

bool8 sub_80877D4(struct Task *task, struct EventObject *eventObject, struct Sprite *sprite)
{
    if (!gPaletteFade.active && BGMusicStopped() == TRUE)
    {
        WarpIntoMap();
        gFieldCallback = sub_8086748;
        SetMainCallback2(CB2_LoadMap);
        DestroyTask(FindTaskIdByFunc(sub_808766C));
    }
    return FALSE;
}

u8 FldEff_PopOutOfAsh(void)
{
    u8 spriteId;
    sub_8060470((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[32], gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    gSprites[spriteId].oam.priority = gFieldEffectArguments[3];
    gSprites[spriteId].coordOffsetEnabled = 1;
    return spriteId;
}

void sub_808788C(struct Sprite *sprite)
{
    if (sprite->animEnded)
    {
        FieldEffectStop(sprite, FLDEFF_POP_OUT_OF_ASH);
    }
}

void StartEscapeRopeFieldEffect(void)
{
    ScriptContext2_Enable();
    FreezeEventObjects();
    CreateTask(DoEscapeRopeFieldEffect, 0x50);
}

static void DoEscapeRopeFieldEffect(u8 taskId)
{
    gEscapeRopeFieldEffectFuncs[gTasks[taskId].data[0]](&gTasks[taskId]);
}

static void EscapeRopeFieldEffect_Step0(struct Task *task)
{
    task->data[0]++;
    task->data[14] = 64;
    task->data[15] = GetPlayerFacingDirection();
}

static void EscapeRopeFieldEffect_Step1(struct Task *task)
{
    struct EventObject *eventObject;
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

    eventObject = &gEventObjects[gPlayerAvatar.eventObjectId];
    if (!EventObjectIsMovementOverridden(eventObject) || EventObjectClearHeldMovementIfFinished(eventObject))
    {
        if (task->data[14] == 0 && !gPaletteFade.active && BGMusicStopped() == TRUE)
        {
            SetEventObjectDirection(eventObject, task->data[15]);
            sub_8053678();
            WarpIntoMap();
            gFieldCallback = mapldr_080859D4;
            SetMainCallback2(CB2_LoadMap);
            DestroyTask(FindTaskIdByFunc(DoEscapeRopeFieldEffect));
        }
        else if (task->data[1] == 0 || (--task->data[1]) == 0)
        {
            EventObjectSetHeldMovement(eventObject, GetFaceDirectionMovementAction(clockwiseDirections[eventObject->facingDirection]));
            if (task->data[2] < 12)
                task->data[2]++;

            task->data[1] = 8 >> (task->data[2] >> 2);
        }
    }
}

void (*const gUnknown_0839F388[])(struct Task *) = {
    sub_8087AA4,
    sub_8087AC8
};

void sub_8087A74(u8);

void mapldr_080859D4(void)
{
    Overworld_PlaySpecialMapMusic();
    pal_fill_for_map_transition();
    ScriptContext2_Enable();
    FreezeEventObjects();
    gFieldCallback = NULL;
    gEventObjects[gPlayerAvatar.eventObjectId].invisible = 1;
    CreateTask(sub_8087A74, 0);
}

void sub_8087A74(u8 taskId)
{
    gUnknown_0839F388[gTasks[taskId].data[0]](&gTasks[taskId]);
}

void sub_8087AA4(struct Task *task)
{
    if (IsWeatherNotFadingIn())
    {
        task->data[0]++;
        task->data[15] = GetPlayerFacingDirection();
    }
}

void sub_8087AC8(struct Task *task)
{
    u8 unknown_0839F380[5] = {1, 3, 4, 2, 1};
    struct EventObject *eventObject = &gEventObjects[gPlayerAvatar.eventObjectId];
    if (task->data[1] == 0 || (--task->data[1]) == 0)
    {
        if (EventObjectIsMovementOverridden(eventObject) && !EventObjectClearHeldMovementIfFinished(eventObject))
        {
            return;
        }
        if (task->data[2] >= 32 && task->data[15] == GetPlayerFacingDirection())
        {
            eventObject->invisible = 0;
            ScriptContext2_Disable();
            UnfreezeEventObjects();
            DestroyTask(FindTaskIdByFunc(sub_8087A74));
            return;
        }
        EventObjectSetHeldMovement(eventObject, GetFaceDirectionMovementAction(unknown_0839F380[eventObject->facingDirection]));
        if (task->data[2] < 32)
        {
            task->data[2]++;
        }
        task->data[1] = task->data[2] >> 2;
    }
    eventObject->invisible ^= 1;
}

static void ExecuteTeleportFieldEffectTask(u8);
static void TeleportFieldEffectTask1(struct Task*);
static void TeleportFieldEffectTask2(struct Task*);
static void TeleportFieldEffectTask3(struct Task*);
static void TeleportFieldEffectTask4(struct Task*);
static void mapldr_08085D88(void);

void CreateTeleportFieldEffectTask(void)
{
    CreateTask(ExecuteTeleportFieldEffectTask, 0);
}

static void (*const sTeleportFieldEffectTasks[])(struct Task *) = {
    TeleportFieldEffectTask1,
    TeleportFieldEffectTask2,
    TeleportFieldEffectTask3,
    TeleportFieldEffectTask4
};

static void ExecuteTeleportFieldEffectTask(u8 taskId)
{
    sTeleportFieldEffectTasks[gTasks[taskId].data[0]](&gTasks[taskId]);
}

static void TeleportFieldEffectTask1(struct Task *task)
{
    ScriptContext2_Enable();
    FreezeEventObjects();
    CameraObjectReset2();
    task->data[15] = GetPlayerFacingDirection();
    task->data[0]++;
}

static void TeleportFieldEffectTask2(struct Task *task)
{
    u8 spinDirections[5] = {DIR_SOUTH, DIR_WEST, DIR_EAST, DIR_NORTH, DIR_SOUTH};
    struct EventObject *eventObject = &gEventObjects[gPlayerAvatar.eventObjectId];
    if (task->data[1] == 0 || (--task->data[1]) == 0)
    {
        EventObjectTurn(eventObject, spinDirections[eventObject->facingDirection]);
        task->data[1] = 8;
        task->data[2]++;
    }
    if (task->data[2] > 7 && task->data[15] == eventObject->facingDirection)
    {
        task->data[0]++;
        task->data[1] = 4;
        task->data[2] = 8;
        task->data[3] = 1;
        PlaySE(SE_TK_WARPIN);
    }
}

static void TeleportFieldEffectTask3(struct Task *task)
{
    u8 spinDirections[5] = {DIR_SOUTH, DIR_WEST, DIR_EAST, DIR_NORTH, DIR_SOUTH};
    struct EventObject *eventObject = &gEventObjects[gPlayerAvatar.eventObjectId];
    struct Sprite *sprite = &gSprites[gPlayerAvatar.spriteId];
    if ((--task->data[1]) <= 0)
    {
        task->data[1] = 4;
        EventObjectTurn(eventObject, spinDirections[eventObject->facingDirection]);
    }
    sprite->pos1.y -= task->data[3];
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

static void TeleportFieldEffectTask4(struct Task *task)
{
    if (!gPaletteFade.active && BGMusicStopped() == TRUE)
    {
        Overworld_SetWarpDestToLastHealLoc();
        WarpIntoMap();
        SetMainCallback2(CB2_LoadMap);
        gFieldCallback = mapldr_08085D88;
        DestroyTask(FindTaskIdByFunc(ExecuteTeleportFieldEffectTask));
    }
}

void sub_8087E1C(u8);

static void mapldr_08085D88(void)
{
    Overworld_PlaySpecialMapMusic();
    pal_fill_for_map_transition();
    ScriptContext2_Enable();
    FreezeEventObjects();
    gFieldCallback = NULL;
    gEventObjects[gPlayerAvatar.eventObjectId].invisible = 1;
    CameraObjectReset2();
    CreateTask(sub_8087E1C, 0);
}

void (*const gUnknown_0839F3A0[])(struct Task *) = {
    sub_8087E4C,
    sub_8087ED8,
    sub_8087FDC
};

void sub_8087E1C(u8 taskId)
{
    gUnknown_0839F3A0[gTasks[taskId].data[0]](&gTasks[taskId]);
}

void sub_8087E4C(struct Task *task)
{
    struct Sprite *sprite;
    s16 centerToCornerVecY;
    if (IsWeatherNotFadingIn())
    {
        sprite = &gSprites[gPlayerAvatar.spriteId];
        centerToCornerVecY = -(sprite->centerToCornerVecY << 1);
        sprite->pos2.y = -(sprite->pos1.y + sprite->centerToCornerVecY + gSpriteCoordOffsetY + centerToCornerVecY);
        gEventObjects[gPlayerAvatar.eventObjectId].invisible = 0;
        task->data[0]++;
        task->data[1] = 8;
        task->data[2] = 1;
        task->data[14] = sprite->subspriteMode;
        task->data[15] = GetPlayerFacingDirection();
        PlaySE(SE_TK_WARPIN);
    }
}

void sub_8087ED8(struct Task *task)
{
    u8 unknown_0839F380[5] = {1, 3, 4, 2, 1};
    struct EventObject *eventObject = &gEventObjects[gPlayerAvatar.eventObjectId];
    struct Sprite *sprite = &gSprites[gPlayerAvatar.spriteId];
    if ((sprite->pos2.y += task->data[1]) >= -8)
    {
        if (task->data[13] == 0)
        {
            task->data[13]++;
            eventObject->triggerGroundEffectsOnMove = 1;
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
    if (sprite->pos2.y >= -0x30 && task->data[1] > 1 && !(sprite->pos2.y & 1))
    {
        task->data[1]--;
    }
    if ((--task->data[2]) == 0)
    {
        task->data[2] = 4;
        EventObjectTurn(eventObject, unknown_0839F380[eventObject->facingDirection]);
    }
    if (sprite->pos2.y >= 0)
    {
        sprite->pos2.y = 0;
        task->data[0]++;
        task->data[1] = 1;
        task->data[2] = 0;
    }
}

void sub_8087FDC(struct Task *task)
{
    u8 unknown_0839F380[5] = {1, 3, 4, 2, 1};
    struct EventObject *eventObject = &gEventObjects[gPlayerAvatar.eventObjectId];
    if ((--task->data[1]) == 0)
    {
        EventObjectTurn(eventObject, unknown_0839F380[eventObject->facingDirection]);
        task->data[1] = 8;
        if ((++task->data[2]) > 4 && task->data[14] == eventObject->facingDirection)
        {
            ScriptContext2_Disable();
            CameraObjectReset1();
            UnfreezeEventObjects();
            DestroyTask(FindTaskIdByFunc(sub_8087E1C));
        }
    }
}

void sub_8088120(u8);
void sub_808847C(u8);
u8 sub_8088830(u32, u32, u32);
void sub_80883DC(void);
void sub_808843C(u16);
void sub_8088890(struct Sprite *);

bool8 FldEff_FieldMoveShowMon(void)
{
    u8 taskId;
    if (is_map_type_1_2_3_5_or_6(Overworld_GetMapTypeOfSaveblockLocation()) == TRUE)
    {
        taskId = CreateTask(sub_8088120, 0xff);
    } else
    {
        taskId = CreateTask(sub_808847C, 0xff);
    }
    gTasks[taskId].data[15] = sub_8088830(gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
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

void (*const gUnknown_0839F3AC[])(struct Task *) = {
    sub_8088150,
    sub_80881C0,
    sub_8088228,
    sub_80882B4,
    sub_80882E4,
    sub_8088338,
    sub_8088380
};

void sub_8088120(u8 taskId)
{
    gUnknown_0839F3AC[gTasks[taskId].data[0]](&gTasks[taskId]);
}

void sub_8088150(struct Task *task)
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
    SetVBlankCallback(sub_80883DC);
    task->data[0]++;
}

void sub_80881C0(struct Task *task)
{
    u16 offset;
    u16 delta;
    offset = ((REG_BG0CNT >> 2) << 14);
    delta = ((REG_BG0CNT >> 8) << 11);
    CpuCopy16(gFieldMoveStreaksTiles, (void *)(VRAM + offset), 0x200);
    CpuFill32(0, (void *)(VRAM + delta), 0x800);
    LoadPalette(gFieldMoveStreaksPalette, 0xf0, 0x20);
    sub_808843C(delta);
    task->data[0]++;
}

void sub_8088228(struct Task *task)
{
    s16 v0;
    s16 v2;
    s16 v3;
    task->data[5] -= 16;
    v0 = ((u16)task->data[1] >> 8);
    v2 = ((u16)task->data[2] >> 8);
    v3 = ((u16)task->data[2] & 0xff);
    v0 -= 16;
    v2 -= 2;
    v3 += 2;
    if (v0 < 0)
    {
        v0 = 0;
    }
    if (v2 < 0x28)
    {
        v2 = 0x28;
    }
    if (v3 > 0x78)
    {
        v3 = 0x78;
    }
    task->data[1] = (v0 << 8) | (task->data[1] & 0xff);
    task->data[2] = (v2 << 8) | v3;
    if (v0 == 0 && v2 == 0x28 && v3 == 0x78)
    {
        gSprites[task->data[15]].callback = sub_8088890;
        task->data[0]++;
    }
}

void sub_80882B4(struct Task *task)
{
    task->data[5] -= 16;
    if (gSprites[task->data[15]].data[7])
    {
        task->data[0]++;
    }
}

void sub_80882E4(struct Task *task)
{
    s16 v2;
    s16 v3;
    task->data[5] -= 16;
    v2 = (task->data[2] >> 8);
    v3 = (task->data[2] & 0xff);
    v2 += 6;
    v3 -= 6;
    if (v2 > 0x50)
    {
        v2 = 0x50;
    }
    if (v3 < 0x51)
    {
        v3 = 0x51;
    }
    task->data[2] = (v2 << 8) | v3;
    if (v2 == 0x50 && v3 == 0x51)
    {
        task->data[0]++;
    }
}

void sub_8088338(struct Task *task)
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

void sub_8088380(struct Task *task)
{
    IntrCallback callback;
    LoadWordFromTwoHalfwords((u16 *)&task->data[13], (u32 *)&callback);
    SetVBlankCallback(callback);
    Text_LoadWindowTemplate(&gMenuTextWindowTemplate);
    InitMenuWindow(&gMenuTextWindowTemplate);
    FreeResourcesAndDestroySprite(&gSprites[task->data[15]]);
    FieldEffectActiveListRemove(FLDEFF_FIELD_MOVE_SHOW_MON);
    DestroyTask(FindTaskIdByFunc(sub_8088120));
}

void sub_80883DC(void)
{
    struct Task *task;
    IntrCallback callback;
    task = &gTasks[FindTaskIdByFunc(sub_8088120)];
    LoadWordFromTwoHalfwords((u16 *)&task->data[13], (u32 *)&callback);
    callback();
    REG_WIN0H = task->data[1];
    REG_WIN0V = task->data[2];
    REG_WININ = task->data[3];
    REG_WINOUT = task->data[4];
    REG_BG0HOFS = task->data[5];
    REG_BG0VOFS = task->data[6];
}

void sub_808843C(u16 offs)
{
    u16 i;
    u16 *dest;
    dest = (u16 *)(VRAM + 0x140 + offs);
    for (i=0; i<0x140; i++, dest++)
    {
        *dest = gFieldMoveStreaksTilemap[i] | 0xf000;
    }
}

void sub_80886B0(void);
bool8 sub_8088708(struct Task *);
void sub_80886F8(struct Task *);
bool8 sub_80887C0(struct Task *);

void (*const gUnknown_0839F3C8[])(struct Task *) = {
    sub_80884AC,
    sub_80884E8,
    sub_8088554,
    sub_80885A8,
    sub_80885D8,
    sub_808860C,
    sub_808862C
};

void sub_808847C(u8 taskId)
{
    gUnknown_0839F3C8[gTasks[taskId].data[0]](&gTasks[taskId]);
}

void sub_80884AC(struct Task *task)
{
    REG_BG0HOFS = task->data[1];
    REG_BG0VOFS = task->data[2];
    StoreWordInTwoHalfwords((u16 *)&task->data[13], (u32)gMain.vblankCallback);
    SetVBlankCallback(sub_80886B0);
    task->data[0]++;
}

void sub_80884E8(struct Task *task)
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

void sub_8088554(struct Task *task)
{
    if (sub_8088708(task))
    {
        REG_WIN1H = 0x00f0;
        REG_WIN1V = 0x2878;
        gSprites[task->data[15]].callback = sub_8088890;
        task->data[0]++;
    }
    sub_80886F8(task);
}

void sub_80885A8(struct Task *task)
{
    sub_80886F8(task);
    if (gSprites[task->data[15]].data[7])
    {
        task->data[0]++;
    }
}

void sub_80885D8(struct Task *task)
{
    sub_80886F8(task);
    task->data[3] = task->data[1] & 7;
    task->data[4] = 0;
    REG_WIN1H = 0xffff;
    REG_WIN1V = 0xffff;
    task->data[0]++;
}

void sub_808860C(struct Task *task)
{
    sub_80886F8(task);
    if (sub_80887C0(task))
    {
        task->data[0]++;
    }
}

void sub_808862C(struct Task *task)
{
    IntrCallback intrCallback;
    u16 bg0cnt;
    bg0cnt = (REG_BG0CNT >> 8) << 11;
    CpuFill32(0, (void *)VRAM + bg0cnt, 0x800);
    LoadWordFromTwoHalfwords((u16 *)&task->data[13], (u32 *)&intrCallback);
    SetVBlankCallback(intrCallback);
    Text_LoadWindowTemplate(&gMenuTextWindowTemplate);
    InitMenuWindow(&gMenuTextWindowTemplate);
    FreeResourcesAndDestroySprite(&gSprites[task->data[15]]);
    FieldEffectActiveListRemove(FLDEFF_FIELD_MOVE_SHOW_MON);
    DestroyTask(FindTaskIdByFunc(sub_808847C));
}

void sub_80886B0(void)
{
    IntrCallback intrCallback;
    struct Task *task;
    task = &gTasks[FindTaskIdByFunc(sub_808847C)];
    LoadWordFromTwoHalfwords((u16 *)&task->data[13], (u32 *)&intrCallback);
    intrCallback();
    REG_BG0HOFS = task->data[1];
    REG_BG0VOFS = task->data[2];
}

void sub_80886F8(struct Task *task)
{
    task->data[1] -= 16;
    task->data[3] += 16;
}

#ifdef NONMATCHING
bool8 sub_8088708(struct Task *task)
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
        for (i=0; i<10; i++)
        {
            dest[dstOffs + i * 32] = gDarknessFieldMoveStreaksTilemap[srcOffs + i * 32] | 0xf000;
            dest[((dstOffs + 1) & 0x1f) + i * 32] = gDarknessFieldMoveStreaksTilemap[((srcOffs + 1) & 0x1f) + i * 32] | 0xf000;
        }
        task->data[4] += 2;
    }
    return FALSE;
}
#else
NAKED
bool8 sub_8088708(struct Task *task)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                    "\tmov r7, r10\n"
                    "\tmov r6, r9\n"
                    "\tmov r5, r8\n"
                    "\tpush {r5-r7}\n"
                    "\tsub sp, 0x4\n"
                    "\tadds r5, r0, 0\n"
                    "\tldrh r2, [r5, 0x10]\n"
                    "\tmovs r1, 0x10\n"
                    "\tldrsh r0, [r5, r1]\n"
                    "\tcmp r0, 0x1F\n"
                    "\tble _08088724\n"
                    "\tmovs r0, 0x1\n"
                    "\tb _080887A8\n"
                    "_08088724:\n"
                    "\tldrh r0, [r5, 0xE]\n"
                    "\tlsls r0, 16\n"
                    "\tasrs r3, r0, 19\n"
                    "\tmovs r1, 0x1F\n"
                    "\tands r3, r1\n"
                    "\tmovs r4, 0x10\n"
                    "\tldrsh r0, [r5, r4]\n"
                    "\tcmp r3, r0\n"
                    "\tblt _080887A6\n"
                    "\tmovs r0, 0x20\n"
                    "\tsubs r3, r0, r3\n"
                    "\tands r3, r1\n"
                    "\tsubs r0, r2\n"
                    "\tmov r12, r0\n"
                    "\tmov r7, r12\n"
                    "\tands r7, r1\n"
                    "\tmov r12, r7\n"
                    "\tldrh r0, [r5, 0x20]\n"
                    "\tldr r1, _080887B8 @ =0x06000140\n"
                    "\tadds r1, r0\n"
                    "\tmov r8, r1\n"
                    "\tmovs r4, 0\n"
                    "\tldr r7, _080887BC @ =gDarknessFieldMoveStreaksTilemap\n"
                    "\tmov r10, r7\n"
                    "\tmovs r0, 0xF0\n"
                    "\tlsls r0, 8\n"
                    "\tmov r9, r0\n"
                    "\tadds r1, r3, 0x1\n"
                    "\tmovs r0, 0x1F\n"
                    "\tands r1, r0\n"
                    "\tstr r1, [sp]\n"
                    "\tmov r6, r12\n"
                    "\tadds r6, 0x1\n"
                    "\tands r6, r0\n"
                    "_08088768:\n"
                    "\tlsls r1, r4, 5\n"
                    "\tadds r2, r1, r3\n"
                    "\tlsls r2, 1\n"
                    "\tadd r2, r8\n"
                    "\tmov r7, r12\n"
                    "\tadds r0, r7, r1\n"
                    "\tlsls r0, 1\n"
                    "\tadd r0, r10\n"
                    "\tldrh r0, [r0]\n"
                    "\tmov r7, r9\n"
                    "\torrs r0, r7\n"
                    "\tstrh r0, [r2]\n"
                    "\tldr r0, [sp]\n"
                    "\tadds r2, r1, r0\n"
                    "\tlsls r2, 1\n"
                    "\tadd r2, r8\n"
                    "\tadds r1, r6, r1\n"
                    "\tlsls r1, 1\n"
                    "\tadd r1, r10\n"
                    "\tldrh r0, [r1]\n"
                    "\tmov r1, r9\n"
                    "\torrs r0, r1\n"
                    "\tstrh r0, [r2]\n"
                    "\tadds r0, r4, 0x1\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r4, r0, 16\n"
                    "\tcmp r4, 0x9\n"
                    "\tbls _08088768\n"
                    "\tldrh r0, [r5, 0x10]\n"
                    "\tadds r0, 0x2\n"
                    "\tstrh r0, [r5, 0x10]\n"
                    "_080887A6:\n"
                    "\tmovs r0, 0\n"
                    "_080887A8:\n"
                    "\tadd sp, 0x4\n"
                    "\tpop {r3-r5}\n"
                    "\tmov r8, r3\n"
                    "\tmov r9, r4\n"
                    "\tmov r10, r5\n"
                    "\tpop {r4-r7}\n"
                    "\tpop {r1}\n"
                    "\tbx r1\n"
                    "\t.align 2, 0\n"
                    "_080887B8: .4byte 0x06000140\n"
                    "_080887BC: .4byte gDarknessFieldMoveStreaksTilemap");
}
#endif

bool8 sub_80887C0(struct Task *task)
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

u8 sub_8088830(u32 a0, u32 a1, u32 a2)
{
    u16 v0;
    u8 monSprite;
    struct Sprite *sprite;
    v0 = (a0 & 0x80000000) >> 16;
    a0 &= 0x7fffffff;
    monSprite = CreateMonSprite_FieldMove(a0, a1, a2, 0x140, 0x50, 0);
    sprite = &gSprites[monSprite];
    sprite->callback = SpriteCallbackDummy;
    sprite->oam.priority = 0;
    sprite->data[0] = a0;
    sprite->data[6] = v0;
    return monSprite;
}

void sub_80888D4(struct Sprite *);

void sub_8088890(struct Sprite *sprite)
{
    if ((sprite->pos1.x -= 20) <= 0x78)
    {
        sprite->pos1.x = 0x78;
        sprite->data[1] = 30;
        sprite->callback = sub_80888D4;
        if (sprite->data[6])
        {
            PlayCry2(sprite->data[0], 0, 0x7d, 0xa);
        } else
        {
            PlayCry1(sprite->data[0], 0);
        }
    }
}

void sub_80888F0(struct Sprite *);

void sub_80888D4(struct Sprite *sprite)
{
    if ((--sprite->data[1]) == 0)
    {
        sprite->callback = sub_80888F0;
    }
}

void sub_80888F0(struct Sprite *sprite)
{
    if (sprite->pos1.x < -0x40)
    {
        sprite->data[7] = 1;
    } else
    {
        sprite->pos1.x -= 20;
    }
}

void sub_8088954(u8);

u8 FldEff_UseSurf(void)
{
    u8 taskId;
    taskId = CreateTask(sub_8088954, 0xff);
    gTasks[taskId].data[15] = gFieldEffectArguments[0];
    Overworld_ClearSavedMusic();
    Overworld_ChangeMusicTo(0x016d);
    return FALSE;
}

void (*const gUnknown_0839F3E4[])(struct Task *) = {
    sub_8088984,
    sub_80889E4,
    sub_8088A30,
    sub_8088A78,
    sub_8088AF4
};

void sub_8088954(u8 taskId)
{
    gUnknown_0839F3E4[gTasks[taskId].data[0]](&gTasks[taskId]);
}

void sub_8088984(struct Task *task)
{
    ScriptContext2_Enable();
    FreezeEventObjects();
    gPlayerAvatar.preventStep = TRUE;
    SetPlayerAvatarStateMask(8);
    PlayerGetDestCoords(&task->data[1], &task->data[2]);
    MoveCoords(gEventObjects[gPlayerAvatar.eventObjectId].movementDirection, &task->data[1], &task->data[2]);
    task->data[0]++;
}

void sub_80889E4(struct Task *task)
{
    struct EventObject *eventObject;
    eventObject = &gEventObjects[gPlayerAvatar.eventObjectId];
    if (!EventObjectIsMovementOverridden(eventObject) || EventObjectClearHeldMovementIfFinished(eventObject))
    {
        sub_8059BF4();
        EventObjectSetHeldMovement(eventObject, MOVEMENT_ACTION_START_ANIM_IN_DIRECTION);
        task->data[0]++;
    }
}

void sub_8088A30(struct Task *task)
{
    struct EventObject *eventObject;
    eventObject = &gEventObjects[gPlayerAvatar.eventObjectId];
    if (EventObjectCheckHeldMovementStatus(eventObject))
    {
        gFieldEffectArguments[0] = task->data[15] | 0x80000000;
        FieldEffectStart(FLDEFF_FIELD_MOVE_SHOW_MON_INIT);
        task->data[0]++;
    }
}

void sub_8088A78(struct Task *task)
{
    struct EventObject *eventObject;
    if (!FieldEffectActiveListContains(FLDEFF_FIELD_MOVE_SHOW_MON))
    {
        eventObject = &gEventObjects[gPlayerAvatar.eventObjectId];
        sub_805B980(eventObject, GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_STATE_SURFING));
        EventObjectClearHeldMovementIfFinished(eventObject);
        EventObjectSetHeldMovement(eventObject, GetJumpSpecialMovementAction(eventObject->movementDirection));
        gFieldEffectArguments[0] = task->data[1];
        gFieldEffectArguments[1] = task->data[2];
        gFieldEffectArguments[2] = gPlayerAvatar.eventObjectId;
        eventObject->fieldEffectSpriteId = FieldEffectStart(FLDEFF_SURF_BLOB);
        task->data[0]++;
    }
}

void sub_8088AF4(struct Task *task)
{
    struct EventObject *eventObject;
    eventObject = &gEventObjects[gPlayerAvatar.eventObjectId];
    if (EventObjectClearHeldMovementIfFinished(eventObject))
    {
        gPlayerAvatar.preventStep = FALSE;
        gPlayerAvatar.flags &= 0xdf;
        EventObjectSetHeldMovement(eventObject, GetFaceDirectionMovementAction(eventObject->movementDirection));
        sub_8127ED0(eventObject->fieldEffectSpriteId, 1);
        UnfreezeEventObjects();
        ScriptContext2_Disable();
        FieldEffectActiveListRemove(FLDEFF_USE_SURF);
        DestroyTask(FindTaskIdByFunc(sub_8088954));
    }
}

void sub_8088BC4(struct Sprite *);

u8 FldEff_NPCFlyOut(void)
{
    u8 spriteId;
    struct Sprite *sprite;
    spriteId = CreateSprite(gFieldEffectObjectTemplatePointers[26], 0x78, 0, 1);
    sprite = &gSprites[spriteId];
    sprite->oam.paletteNum = 0;
    sprite->oam.priority = 1;
    sprite->callback = sub_8088BC4;
    sprite->data[1] = gFieldEffectArguments[0];
    PlaySE(SE_W019);
    return spriteId;
}

void sub_8088BC4(struct Sprite *sprite)
{
    struct Sprite *npcSprite;
    sprite->pos2.x = Cos(sprite->data[2], 0x8c);
    sprite->pos2.y = Sin(sprite->data[2], 0x48);
    sprite->data[2] = (sprite->data[2] + 4) & 0xff;
    if (sprite->data[0])
    {
        npcSprite = &gSprites[sprite->data[1]];
        npcSprite->coordOffsetEnabled = 0;
        npcSprite->pos1.x = sprite->pos1.x + sprite->pos2.x;
        npcSprite->pos1.y = sprite->pos1.y + sprite->pos2.y - 8;
        npcSprite->pos2.x = 0;
        npcSprite->pos2.y = 0;
    }
    if (sprite->data[2] >= 0x80)
    {
        FieldEffectStop(sprite, FLDEFF_NPCFLY_OUT);
    }
}

void sub_8088C70(u8);
extern void sub_8127EFC(u8, u8);
u8 sub_8088F60(void);
bool8 sub_8088FA4(u8);
void sub_8088FC0(u8);
void sub_8088FFC(u8, u8);
void sub_8089018(struct Sprite *);
void sub_80890D8(struct Sprite *);

u8 FldEff_UseFly(void)
{
    u8 taskId;
    taskId = CreateTask(sub_8088C70, 0xfe);
    gTasks[taskId].data[1] = gFieldEffectArguments[0];
    return 0;
}

void (*const gUnknown_0839F3F8[])(struct Task *) = {
    sub_8088CA0,
    sub_8088CF8,
    sub_8088D3C,
    sub_8088D94,
    sub_8088DD8,
    sub_8088E2C,
    sub_8088EB4,
    sub_8088F10,
    sub_8088F30
};

void sub_8088C70(u8 taskId)
{
    gUnknown_0839F3F8[gTasks[taskId].data[0]](&gTasks[taskId]);
}

void sub_8088CA0(struct Task *task)
{
    struct EventObject *eventObject;
    eventObject = &gEventObjects[gPlayerAvatar.eventObjectId];
    if (!EventObjectIsMovementOverridden(eventObject) || EventObjectClearHeldMovementIfFinished(eventObject))
    {
        task->data[15] = gPlayerAvatar.flags;
        gPlayerAvatar.preventStep = TRUE;
        SetPlayerAvatarStateMask(1);
        sub_8059BF4();
        EventObjectSetHeldMovement(eventObject, MOVEMENT_ACTION_START_ANIM_IN_DIRECTION);
        task->data[0]++;
    }
}

void sub_8088CF8(struct Task *task)
{
    struct EventObject *eventObject;
    eventObject = &gEventObjects[gPlayerAvatar.eventObjectId];
    if (EventObjectClearHeldMovementIfFinished(eventObject))
    {
        task->data[0]++;
        gFieldEffectArguments[0] = task->data[1];
        FieldEffectStart(FLDEFF_FIELD_MOVE_SHOW_MON_INIT);
    }
}

void sub_8088D3C(struct Task *task)
{
    struct EventObject *eventObject;
    if (!FieldEffectActiveListContains(FLDEFF_FIELD_MOVE_SHOW_MON))
    {
        eventObject = &gEventObjects[gPlayerAvatar.eventObjectId];
        if (task->data[15] & 0x08)
        {
            sub_8127ED0(eventObject->fieldEffectSpriteId, 2);
            sub_8127EFC(eventObject->fieldEffectSpriteId, 0);
        }
        task->data[1] = sub_8088F60();
        task->data[0]++;
    }
}

void sub_8088D94(struct Task *task)
{
    if (sub_8088FA4(task->data[1]))
    {
        task->data[0]++;
        task->data[2] = 16;
        SetPlayerAvatarTransitionFlags(PLAYER_AVATAR_FLAG_ON_FOOT);
        EventObjectSetHeldMovement(&gEventObjects[gPlayerAvatar.eventObjectId], MOVEMENT_ACTION_FACE_LEFT);
    }
}

void sub_8088DD8(struct Task *task)
{
    struct EventObject *eventObject;
    eventObject = &gEventObjects[gPlayerAvatar.eventObjectId];
    if ((task->data[2] == 0 || (--task->data[2]) == 0) && EventObjectClearHeldMovementIfFinished(eventObject))
    {
        task->data[0]++;
        PlaySE(SE_W019);
        sub_8088FC0(task->data[1]);
    }
}

void sub_8088E2C(struct Task *task)
{
    struct EventObject *eventObject;
    if ((++task->data[2]) >= 8)
    {
        eventObject = &gEventObjects[gPlayerAvatar.eventObjectId];
        sub_805B980(eventObject, GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_STATE_SURFING));
        StartSpriteAnim(&gSprites[eventObject->spriteId], 0x16);
        eventObject->inanimate = 1;
        EventObjectSetHeldMovement(eventObject, MOVEMENT_ACTION_JUMP_IN_PLACE_LEFT);
        if (task->data[15] & 0x08)
        {
            DestroySprite(&gSprites[eventObject->fieldEffectSpriteId]);
        }
        task->data[0]++;
        task->data[2] = 0;
    }
}

void sub_8088EB4(struct Task *task)
{
    struct EventObject *eventObject;
    if ((++task->data[2]) >= 10)
    {
        eventObject = &gEventObjects[gPlayerAvatar.eventObjectId];
        EventObjectClearHeldMovementIfActive(eventObject);
        eventObject->inanimate = 0;
        eventObject->hasShadow = 0;
        sub_8088FFC(task->data[1], eventObject->spriteId);
        CameraObjectReset2();
        task->data[0]++;
    }
}

void sub_8088F10(struct Task *task)
{
    if (sub_8088FA4(task->data[1]))
    {
        WarpFadeScreen();
        task->data[0]++;
    }
}

void sub_8088F30(struct Task *task)
{
    if (!gPaletteFade.active)
    {
        FieldEffectActiveListRemove(FLDEFF_USE_FLY);
        DestroyTask(FindTaskIdByFunc(sub_8088C70));
    }
}

u8 sub_8088F60(void)
{
    u8 spriteId;
    struct Sprite *sprite;
    spriteId = CreateSprite(gFieldEffectObjectTemplatePointers[26], 0xff, 0xb4, 0x1);
    sprite = &gSprites[spriteId];
    sprite->oam.paletteNum = 0;
    sprite->oam.priority = 1;
    sprite->callback = sub_8089018;
    return spriteId;
}

u8 sub_8088FA4(u8 spriteId)
{
    return gSprites[spriteId].data[7];
}

void sub_8088FC0(u8 spriteId)
{
    struct Sprite *sprite;
    sprite = &gSprites[spriteId];
    sprite->callback = sub_80890D8;
    sprite->pos1.x = 0x78;
    sprite->pos1.y = 0x00;
    sprite->pos2.x = 0;
    sprite->pos2.y = 0;
    memset(&sprite->data[0], 0, 8 * sizeof(u16) /* zero all data cells */);
    sprite->data[6] = 0x40;
}

void sub_8088FFC(u8 a0, u8 a1)
{
    gSprites[a0].data[6] = a1;
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

void sub_8089018(struct Sprite *sprite)
{
    if (sprite->data[7] == 0)
    {
        if (sprite->data[0] == 0)
        {
            sprite->oam.affineMode = 3;
            sprite->affineAnims = gSpriteAffineAnimTable_0839F44C;
            InitSpriteAffineAnim(sprite);
            StartSpriteAffineAnim(sprite, 0);
            sprite->pos1.x = 0x76;
            sprite->pos1.y = -0x30;
            sprite->data[0]++;
            sprite->data[1] = 0x40;
            sprite->data[2] = 0x100;
        }
        sprite->data[1] += (sprite->data[2] >> 8);
        sprite->pos2.x = Cos(sprite->data[1], 0x78);
        sprite->pos2.y = Sin(sprite->data[1], 0x78);
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

void sub_80890D8(struct Sprite *sprite)
{
    struct Sprite *sprite1;
    sprite->pos2.x = Cos(sprite->data[2], 0x8c);
    sprite->pos2.y = Sin(sprite->data[2], 0x48);
    sprite->data[2] = (sprite->data[2] + 4) & 0xff;
    if (sprite->data[6] != 0x40)
    {
        sprite1 = &gSprites[sprite->data[6]];
        sprite1->coordOffsetEnabled = 0;
        sprite1->pos1.x = sprite->pos1.x + sprite->pos2.x;
        sprite1->pos1.y = sprite->pos1.y + sprite->pos2.y - 8;
        sprite1->pos2.x = 0;
        sprite1->pos2.y = 0;
    }
    if (sprite->data[2] >= 0x80)
    {
        sprite->data[7] = 1;
    }
}

void sub_808914C(struct Sprite *sprite)
{
    if (sprite->data[7] == 0)
    {
        if (sprite->data[0] == 0)
        {
            sprite->oam.affineMode = 3;
            sprite->affineAnims = gSpriteAffineAnimTable_0839F44C;
            InitSpriteAffineAnim(sprite);
            StartSpriteAffineAnim(sprite, 1);
            sprite->pos1.x = 0x5e;
            sprite->pos1.y = -0x20;
            sprite->data[0]++;
            sprite->data[1] = 0xf0;
            sprite->data[2] = 0x800;
            sprite->data[4] = 0x80;
        }
        sprite->data[1] += sprite->data[2] >> 8;
        sprite->data[3] += sprite->data[2] >> 8;
        sprite->data[1] &= 0xff;
        sprite->pos2.x = Cos(sprite->data[1], 0x20);
        sprite->pos2.y = Sin(sprite->data[1], 0x78);
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
            sprite->invisible = 1;
        }
    }
}

void sub_8089230(u8 spriteId)
{
    sub_8088FC0(spriteId);
    gSprites[spriteId].callback = sub_808914C;
}

void sub_8089270(u8);

u8 FldEff_FlyIn(void)
{
    CreateTask(sub_8089270, 0xfe);
    return 0;
}

void (*const gUnknown_0839F454[])(struct Task *) = {
    sub_80892A0,
    sub_8089354,
    sub_80893C0,
    sub_8089414,
    sub_808948C,
    sub_80894C4,
    fishE
};

void sub_8089270(u8 taskId)
{
    gUnknown_0839F454[gTasks[taskId].data[0]](&gTasks[taskId]);
}

void sub_80892A0(struct Task *task)
{
    struct EventObject *eventObject;
    eventObject = &gEventObjects[gPlayerAvatar.eventObjectId];
    if (!EventObjectIsMovementOverridden(eventObject) || EventObjectClearHeldMovementIfFinished(eventObject))
    {
        task->data[0]++;
        task->data[2] = 17;
        task->data[15] = gPlayerAvatar.flags;
        gPlayerAvatar.preventStep = TRUE;
        SetPlayerAvatarStateMask(0x01);
        if (task->data[15] & 0x08)
        {
            sub_8127ED0(eventObject->fieldEffectSpriteId, 0);
        }
        sub_805B980(eventObject, GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_STATE_SURFING));
        CameraObjectReset2();
        EventObjectTurn(eventObject, DIR_WEST);
        StartSpriteAnim(&gSprites[eventObject->spriteId], 0x16);
        eventObject->invisible = 0;
        task->data[1] = sub_8088F60();
        sub_8088FC0(task->data[1]);
        sub_8088FFC(task->data[1], eventObject->spriteId);
    }
}

void sub_8089354(struct Task *task)
{
    struct EventObject *eventObject;
    struct Sprite *sprite;
    if (task->data[2] == 0 || (--task->data[2]) == 0)
    {
        eventObject = &gEventObjects[gPlayerAvatar.eventObjectId];
        sprite = &gSprites[eventObject->spriteId];
        sub_8088FFC(task->data[1], 0x40);
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        task->data[0]++;
        task->data[2] = 0;
    }
}

void sub_80893C0(struct Task *task)
{
    s16 unknown_0839F470[18] = {
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
    sprite->pos2.y = unknown_0839F470[task->data[2]];
    if ((++task->data[2]) >= 18)
    {
        task->data[0]++;
    }
}

void sub_8089414(struct Task *task)
{
    struct EventObject *eventObject;
    struct Sprite *sprite;
    if (sub_8088FA4(task->data[1]))
    {
        eventObject = &gEventObjects[gPlayerAvatar.eventObjectId];
        sprite = &gSprites[eventObject->spriteId];
        eventObject->inanimate = 0;
        sub_805C058(eventObject, eventObject->currentCoords.x, eventObject->currentCoords.y);
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        sprite->coordOffsetEnabled = 1;
        sub_8059BF4();
        EventObjectSetHeldMovement(eventObject, MOVEMENT_ACTION_START_ANIM_IN_DIRECTION);
        task->data[0]++;
    }
}

void sub_808948C(struct Task *task)
{
    if (EventObjectClearHeldMovementIfFinished(&gEventObjects[gPlayerAvatar.eventObjectId]))
    {
        task->data[0]++;
        sub_8089230(task->data[1]);
    }
}

void sub_80894C4(struct Task *task)
{
    if (sub_8088FA4(task->data[1]))
    {
        DestroySprite(&gSprites[task->data[1]]);
        task->data[0]++;
        task->data[1] = 0x10;
    }
}

void fishE(struct Task *task)
{
    u8 state;
    struct EventObject *eventObject;
    if ((--task->data[1]) == 0)
    {
        eventObject = &gEventObjects[gPlayerAvatar.eventObjectId];
        state = PLAYER_AVATAR_STATE_NORMAL;
        if (task->data[15] & 0x08)
        {
            state = PLAYER_AVATAR_STATE_SURFING;
            sub_8127ED0(eventObject->fieldEffectSpriteId, 1);
        }
        sub_805B980(eventObject, GetPlayerAvatarGraphicsIdByStateId(state));
        EventObjectTurn(eventObject, DIR_SOUTH);
        gPlayerAvatar.flags = task->data[15];
        gPlayerAvatar.preventStep = FALSE;
        FieldEffectActiveListRemove(FLDEFF_FLY_IN);
        DestroyTask(FindTaskIdByFunc(sub_8089270));
    }
}
