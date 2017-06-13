//
// Created by scott on 6/8/2017.
//

#include "global.h"
#include "sprite.h"
#include "task.h"
#include "field_effect.h"

#define subsprite_table(ptr) {.subsprites = ptr, .subspriteCount = (sizeof ptr) / (sizeof(struct Subsprite))}

#define obj_frame_tiles(ptr) {.data = (u8 *)ptr, .size = sizeof ptr}

const u32 gSpriteImage_839DC14[] = INCBIN_U32("graphics/birch_speech/birch.4bpp");
const u16 gBirchPalette[16] = INCBIN_U16("graphics/birch_speech/birch.gbapal");
const u32 gSpriteImage_839E434[] = INCBIN_U32("graphics/misc/pokeball_glow.4bpp");
const u16 gFieldEffectObjectPalette4[16] = INCBIN_U16("graphics/field_effect_objects/palettes/04.gbapal");
const u32 gSpriteImage_839E474[] = INCBIN_U32("graphics/misc/pokecenter_monitor/0.4bpp");
const u32 gSpriteImage_839E534[] = INCBIN_U32("graphics/misc/pokecenter_monitor/1.4bpp");
const u32 gSpriteImage_839E5F4[] = INCBIN_U32("graphics/misc/big_hof_monitor.4bpp");
const u32 gSpriteImage_839E7F4[] = INCBIN_U32("graphics/misc/small_hof_monitor.4bpp");
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
    {.data = (u8 *)gSpriteImage_839E7F4, .size = 0x200} // the macro breaks down here
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

bool8 (*const gUnknown_0839F31C[])(struct Task *, struct MapObject *) = {
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

bool8 (*const gUnknown_0839F33C[])(struct Task *, struct MapObject *, struct Sprite *) = {
    sub_808722C,
    sub_8087264,
    sub_8087298,
    sub_80872E4,
    sub_80873D8,
    sub_80873F4
};

bool8 (*const gUnknown_0839F354[])(struct Task *, struct MapObject *, struct Sprite *) = {
    sub_80874CC,
    sub_80874FC,
    sub_8087548,
    sub_808759C
};

bool8 (*const gUnknown_0839F364[])(struct Task *, struct MapObject *, struct Sprite *) = {
    sub_80876C8,
    sub_80876F8,
    sub_8087774,
    sub_80877AC,
    sub_80877D4
};

void (*const gUnknown_0839F378[])(struct Task *) = {
    sub_80878F4,
    sub_8087914
};

const u8 gUnknown_0839F380[] = {1, 3, 4, 2, 1};

void (*const gUnknown_0839F388[])(struct Task *) = {
    sub_8087AA4,
    sub_8087AC8
};

void (*const gUnknown_0839F390[])(struct Task *) = {
    sub_8087BEC,
    sub_8087C14,
    sub_8087CA4,
    sub_8087D78
};

void (*const gUnknown_0839F3A0[])(struct Task *) = {
    sub_8087E4C,
    sub_8087ED8,
    sub_8087FDC
};

void (*const gUnknown_0839F3AC[])(struct Task *) = {
    sub_8088150,
    sub_80881C0,
    sub_8088228,
    sub_80882B4,
    sub_80882E4,
    sub_8088338,
    sub_8088380
};

void (*const gUnknown_0839F3C8[])(struct Task *) = {
    sub_80884AC,
    sub_80884E8,
    sub_8088554,
    sub_80885A8,
    sub_80885D8,
    sub_808860C,
    sub_808862C
};

void (*const gUnknown_0839F3E4[])(struct Task *) = {
    sub_8088984,
    sub_80889E4,
    sub_8088A30,
    sub_8088A78,
    sub_8088AF4
};

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

void (*const gUnknown_0839F454[])(struct Task *) = {
    sub_80892A0,
    sub_8089354,
    sub_80893C0,
    sub_8089414,
    sub_808948C,
    sub_80894C4,
    fishE
};

const s16 gUnknown_0839F470[] = {
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
