#include "global.h"
#include "field_map_obj.h"
#include "field_weather.h"
#include "rng.h"
#include "script.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

extern struct Weather *const gWeatherPtr;

//extern const s16 gUnknown_0839A9C8[][2];
extern const struct SpriteSheet gWeatherCloudSpriteSheet;
extern const struct SpriteTemplate gSpriteTemplate_839A9F0;
extern const struct SpriteTemplate gSpriteTemplate_839AAA4;
extern const struct SpriteTemplate gSpriteTemplate_839AB04;

const u16 gUnknown_08397108[] = INCBIN_U16("graphics/weather/1.gbapal");
const u16 gUnknown_08397128[] = INCBIN_U16("graphics/weather/2.gbapal");
const u8 WeatherFog0Tiles[] = INCBIN_U8("graphics/weather/fog0.4bpp");
const u8 gWeatherFog1Tiles[] = INCBIN_U8("graphics/weather/fog1.4bpp");
const u8 WeatherCloudTiles[] = INCBIN_U8("graphics/weather/cloud.4bpp");
const u8 gSpriteImage_8398948[] = INCBIN_U8("graphics/weather/snow0.4bpp");
const u8 gSpriteImage_8398968[] = INCBIN_U8("graphics/weather/snow1.4bpp");
const u8 WeatherBubbleTiles[] = INCBIN_U8("graphics/weather/bubble.4bpp");
const u8 WeatherAshTiles[] = INCBIN_U8("graphics/weather/ash.4bpp");
const u8 WeatherRainTiles[] = INCBIN_U8("graphics/weather/rain.4bpp");
const u8 WeatherSandstormTiles[] = INCBIN_U8("graphics/weather/sandstorm.4bpp");

const struct Coords16 gUnknown_0839A9C8[] =
{
    { 0, 66},
    { 5, 73},
    {10, 78},
};

const struct SpriteSheet gWeatherCloudSpriteSheet = {WeatherCloudTiles, 0x800, 0x1200};

const struct OamData gOamData_839A9DC =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 1,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 3,
    .paletteNum = 0,
    .affineParam = 0,
};

const union AnimCmd gSpriteAnim_839A9E4[] =
{
    ANIMCMD_FRAME(0, 16),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_839A9EC[] =
{
    gSpriteAnim_839A9E4,
};

void sub_807E0F4(struct Sprite *);
const struct SpriteTemplate gSpriteTemplate_839A9F0 =
{
    .tileTag = 4608,
    .paletteTag = 4609,
    .oam = &gOamData_839A9DC,
    .anims = gSpriteAnimTable_839A9EC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_807E0F4,
};

extern void sub_807D5BC(s8 a);
extern void sub_807D8C0(const u16 *palette);
extern void sub_807D9A8(void);
extern bool8 sub_807D9C8(void);
extern void sub_807DA14(void);
extern void sub_807DA4C(void);
extern void sub_807DBA4(u8 a, u8 b, int c);
extern bool8 sub_807DBE8(void);
extern void SetRainStrengthFromSoundEffect(u16 sndEff);
extern void sub_807D5F0(u8 a, u8 b, u8 c);

//------------------------------------------------------------------------------
// Clouds
//------------------------------------------------------------------------------

void sub_807DE78(void)
{
    gWeatherPtr->unknown_6C1 = 0;
    gWeatherPtr->unknown_6C2 = 20;
    gWeatherPtr->unknown_6D2 = 0;
    gWeatherPtr->unknown_6CC = 0;
    if (gWeatherPtr->unknown_6DE == 0)
        sub_807DB64(0, 16);
}

void sub_807DEF4(void);

void sub_807DEC4(void)
{
    sub_807DE78();
    while (gWeatherPtr->unknown_6D2 == 0)
        sub_807DEF4();
}

void sub_807DFD4(void);

void sub_807DEF4(void)
{
    switch (gWeatherPtr->unknown_6CC)
    {
    case 0:
        sub_807DFD4();
        gWeatherPtr->unknown_6CC++;
        break;
    case 1:
        sub_807DBA4(12, 8, 1);
        gWeatherPtr->unknown_6CC++;
        break;
    case 2:
        if (sub_807DBE8())
        {
            gWeatherPtr->unknown_6D2 = 1;
            gWeatherPtr->unknown_6CC++;
        }
        break;
    }
}

void sub_807E0A0(void);

bool8 sub_807DF54(void)
{
    switch (gWeatherPtr->unknown_6CE)
    {
    case 0:
        sub_807DBA4(0, 16, 1);
        gWeatherPtr->unknown_6CE++;
        return TRUE;
    case 1:
        if (sub_807DBE8())
        {
            sub_807E0A0();
            gWeatherPtr->unknown_6CE++;
        }
        return TRUE;
    }
    return FALSE;
}

void sub_807DF9C(void)
{
    gWeatherPtr->unknown_6C1 = 0;
    gWeatherPtr->unknown_6C2 = 20;
}

void sub_807DFC0(void)
{
    sub_807DF9C();
}

void nullsub_55(void)
{
}

int sub_807DFD0(void)
{
    return 0;
}

void sub_807DFD4(void)
{
    u16 i;

    if (gWeatherPtr->unknown_6DE == 1)
        return;
    LoadSpriteSheet(&gWeatherCloudSpriteSheet);
    sub_807D8C0(gUnknown_08397108);
    for (i = 0; i < 3; i++)
    {
        u8 spriteId = CreateSprite(&gSpriteTemplate_839A9F0, 0, 0, 0xFF);

        if (spriteId != 64)
        {
            struct Sprite *sprite;

            gWeatherPtr->cloudSprites[i] = &gSprites[spriteId];
            sprite = gWeatherPtr->cloudSprites[i];
            sub_80603CC(gUnknown_0839A9C8[i].x + 7, gUnknown_0839A9C8[i].y + 7, &sprite->pos1.x, &sprite->pos1.y);
            sprite->coordOffsetEnabled = TRUE;
        }
        else
        {
            gWeatherPtr->cloudSprites[i] = NULL;
        }
    }
    gWeatherPtr->unknown_6DE = 1;
}

void sub_807E0A0(void)
{
    u16 i;

    if (gWeatherPtr->unknown_6DE == 0)
        return;
    for (i = 0; i < 3; i++)
    {
        if (gWeatherPtr->cloudSprites[i] != NULL)
            DestroySprite(gWeatherPtr->cloudSprites[i]);
    }
    FreeSpriteTilesByTag(0x1200);
    gWeatherPtr->unknown_6DE = 0;
}

void sub_807E0F4(struct Sprite *sprite)
{
    sprite->data[0] = (sprite->data[0] + 1) & 1;
    if (sprite->data[0] != 0)
        sprite->pos1.x--;
}

void sub_807E110(void)
{
    gWeatherPtr->unknown_6CC = 0;
    gWeatherPtr->unknown_6D2 = 0;
    gWeatherPtr->unknown_6C1 = 0;
    gWeatherPtr->unknown_6C2 = 0;
}

void sub_807E174(void);

void sub_807E144(void)
{
    sub_807E110();
    while (gWeatherPtr->unknown_6D2 == 0)
        sub_807E174();
}

void sub_807E174(void)
{
    switch (gWeatherPtr->unknown_6CC)
    {
    case 0:
        if (gWeatherPtr->unknown_6C6 != 0)
            gWeatherPtr->unknown_6CC++;
        break;
    case 1:
        sub_807D9A8();
        gWeatherPtr->unknown_6CC++;
        break;
    case 2:
        if (sub_807D9C8() == FALSE)
            gWeatherPtr->unknown_6CC++;
        break;
    case 3:
        sub_807DA14();
        gWeatherPtr->unknown_6CC++;
        break;
    case 4:
        sub_807DA4C();
        if (gWeatherPtr->unknown_73C == 6)
        {
            gWeatherPtr->unknown_6D2 = 1;
            gWeatherPtr->unknown_6CC++;
        }
        break;
    default:
        sub_807DA4C();
        break;
    }
}

int sub_807E258(void)
{
    return 0;
}

void task50_0807B6D4(u8);

void sub_807E25C(void)
{
    CreateTask(task50_0807B6D4, 0x50);
}

#define tState      data[0]
#define tBlendY     data[1]
#define tBlendDelay data[2]
#define tWinRange   data[3]

void task50_0807B6D4(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->tState)
    {
    case 0:
        task->tBlendY = 0;
        task->tBlendDelay = 0;
        task->tWinRange = REG_WININ;
        REG_WININ = WIN_RANGE(63, 63);
        REG_BLDCNT = 0x9E;
        REG_BLDY = 0;
        task->tState++;
        // fall through
    case 1:
        task->tBlendY += 3;
        if (task->tBlendY > 16)
            task->tBlendY = 16;
        REG_BLDY = task->tBlendY;
        if (task->tBlendY >= 16)
            task->tState++;
        break;
    case 2:
        task->tBlendDelay++;
        if (task->tBlendDelay > 9)
        {
            task->tBlendDelay = 0;
            task->tBlendY--;
            if (task->tBlendY <= 0)
            {
                task->tBlendY = 0;
                task->tState++;
            }
            REG_BLDY = task->tBlendY;
        }
        break;
    case 3:
        REG_BLDCNT = 0;
        REG_BLDY = 0;
        REG_WININ = task->tWinRange;
        task->tState++;
        break;
    case 4:
        EnableBothScriptContexts();
        DestroyTask(taskId);
        break;
    }
}

#undef tState
#undef tBlendY
#undef tBlendDelay
#undef tWinRange

//------------------------------------------------------------------------------
// Light Rain
//------------------------------------------------------------------------------

void LightRain_InitVars(void)
{
    gWeatherPtr->unknown_6CC = 0;
    gWeatherPtr->unknown_6D2 = 0;
    gWeatherPtr->unknown_6D6 = 0;
    gWeatherPtr->unknown_6DB = 8;
    gWeatherPtr->unknown_6DC = 0;
    gWeatherPtr->unknown_6D9 = 10;
    gWeatherPtr->unknown_6C1 = 3;
    gWeatherPtr->unknown_6C2 = 20;
    SetRainStrengthFromSoundEffect(SE_T_KOAME);
}

void sub_807E400(void);

void sub_807E3D0(void)
{
    LightRain_InitVars();
    while (gWeatherPtr->unknown_6D2 == 0)
        sub_807E400();
}

void sub_807E7A4(void);
u8 sub_807E7B4(void);
u8 sub_807E8E8(void);

void sub_807E400(void)
{
    switch (gWeatherPtr->unknown_6CC)
    {
    case 0:
        sub_807E7A4();
        gWeatherPtr->unknown_6CC++;
        break;
    case 1:
        if (sub_807E7B4() == 0)
            gWeatherPtr->unknown_6CC++;
        break;
    case 2:
        if (sub_807E8E8() == FALSE)
        {
            gWeatherPtr->unknown_6D2 = 1;
            gWeatherPtr->unknown_6CC++;
        }
        break;
    }
}

void sub_807E974(void);

bool8 sub_807E460(void)
{
    switch (gWeatherPtr->unknown_6CE)
    {
    case 0:
        if (gWeatherPtr->unknown_6D1 == 3
         || gWeatherPtr->unknown_6D1 == 5
         || gWeatherPtr->unknown_6D1 == 13)
        {
            gWeatherPtr->unknown_6CE = 0xFF;
            return FALSE;
        }
        else
        {
            gWeatherPtr->unknown_6D9 = 0;
            gWeatherPtr->unknown_6CE++;
        }
        // fall through
    case 1:
        if (sub_807E8E8() == FALSE)
        {
            sub_807E974();
            gWeatherPtr->unknown_6CE++;
            return FALSE;
        }
        return TRUE;
    }
    return FALSE;
}

// defined below
extern const s16 gUnknown_0839AABC[][2];
extern const u16 gUnknown_0839AAC4[][2];

void sub_807E4EC(struct Sprite *sprite)
{
    u32 randVal;
    u16 r6;
    s32 r4;
    s32 r0;

    if (sprite->data[1] == 0)
        sprite->data[1] = 361;
    randVal = sprite->data[1] * 1103515245 + 12345;
    sprite->data[1] = ((randVal & 0x7FFF0000) >> 16) % 600;

    r6 = gUnknown_0839AAC4[gWeatherPtr->unknown_6DC][0];

    r4 = sprite->data[1] % 30;
    sprite->data[2] = r4 * 8;  // useless assignment

    r0 = sprite->data[1] / 30;
    sprite->data[3] = r0 * 8;  // useless assignment

    sprite->data[2] = r4;
    sprite->data[2] <<= 7;

    sprite->data[3] = r0;
    sprite->data[3] <<= 7;

    sprite->data[2] -= gUnknown_0839AABC[gWeatherPtr->unknown_6DC][0] * r6;
    sprite->data[3] -= gUnknown_0839AABC[gWeatherPtr->unknown_6DC][1] * r6;

    StartSpriteAnim(sprite, 0);
    sprite->data[4] = 0;
    sprite->coordOffsetEnabled = FALSE;
    sprite->data[0] = r6;
}

void sub_807E5C0(struct Sprite *sprite)
{
    if (sprite->data[4] == 0)
    {
        sprite->data[2] += gUnknown_0839AABC[gWeatherPtr->unknown_6DC][0];
        sprite->data[3] += gUnknown_0839AABC[gWeatherPtr->unknown_6DC][1];
        sprite->pos1.x = sprite->data[2] >> 4;
        sprite->pos1.y = sprite->data[3] >> 4;

        if (sprite->data[5] != 0
         && (sprite->pos1.x >= -8 && sprite->pos1.x <= 248)
         && sprite->pos1.y >= -16 && sprite->pos1.y <= 176)
            sprite->invisible = FALSE;
        else
            sprite->invisible = TRUE;

        sprite->data[0]--;
        if (sprite->data[0] == 0)
        {
            StartSpriteAnim(sprite, gWeatherPtr->unknown_6DC + 1);
            sprite->data[4] = 1;
            sprite->pos1.x -= gSpriteCoordOffsetX;
            sprite->pos1.y -= gSpriteCoordOffsetY;
            sprite->coordOffsetEnabled = TRUE;
        }
    }
    else if (sprite->animEnded)
    {
        sprite->invisible = TRUE;
        sub_807E4EC(sprite);
    }
}

void sub_807E6C4(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        sub_807E4EC(sprite);
        sprite->callback = sub_807E5C0;
    }
    else
    {
        sprite->data[0]--;
    }
}

void sub_807E6F0(struct Sprite *sprite, u16 b)
{
    u16 r8 = gUnknown_0839AAC4[gWeatherPtr->unknown_6DC][0];
    u16 r6 = b / (gUnknown_0839AAC4[gWeatherPtr->unknown_6DC][1] + r8);
    u16 r4 = b % (gUnknown_0839AAC4[gWeatherPtr->unknown_6DC][1] + r8);

    while (--r6 != 0xFFFF)
        sub_807E4EC(sprite);
    if (r4 < r8)
    {
        while (--r4 != 0xFFFF)
            sub_807E5C0(sprite);
        sprite->data[6] = 0;
    }
    else
    {
        sprite->data[0] = r4 - r8;
        sprite->invisible = TRUE;
        sprite->data[6] = 1;
    }
}

extern const struct SpriteSheet gUnknown_0839AACC;  // defined below

void sub_807E7A4(void)
{
    LoadSpriteSheet(&gUnknown_0839AACC);
}

const struct Coords16 gUnknown_0839AA08[] =
{
    {  0,   0},
    {  0, 160},
    {  0,  64},
    {144, 224},
    {144, 128},
    { 32,  32},
    { 32, 192},
    { 32,  96},
    { 72, 128},
    { 72,  32},
    { 72, 192},
    {216,  96},
    {216,   0},
    {104, 160},
    {104,  64},
    {104, 224},
    {144,   0},
    {144, 160},
    {144,  64},
    { 32, 224},
    { 32, 128},
    { 72,  32},
    { 72, 192},
    { 48,  96},
};

const struct OamData gOamData_839AA68 =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 2,
    .x = 0,
    .matrixNum = 0,
    .size = 2,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 2,
    .affineParam = 0,
};

const union AnimCmd gSpriteAnim_839AA70[] =
{
    ANIMCMD_FRAME(0, 16),
    ANIMCMD_JUMP(0),
};

const union AnimCmd gSpriteAnim_839AA78[] =
{
    ANIMCMD_FRAME(8, 3),
    ANIMCMD_FRAME(32, 2),
    ANIMCMD_FRAME(40, 2),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_839AA88[] =
{
    ANIMCMD_FRAME(8, 3),
    ANIMCMD_FRAME(16, 3),
    ANIMCMD_FRAME(24, 4),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_839AA98[] =
{
    gSpriteAnim_839AA70,
    gSpriteAnim_839AA78,
    gSpriteAnim_839AA88,
};

const struct SpriteTemplate gSpriteTemplate_839AAA4 =
{
    .tileTag = 4614,
    .paletteTag = 4608,
    .oam = &gOamData_839AA68,
    .anims = gSpriteAnimTable_839AA98,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_807E5C0,
};


const s16 gUnknown_0839AABC[][2] =
{
	{-104, 208},
	{-160, 320},
};

const u16 gUnknown_0839AAC4[][2] =
{
    {18, 7},
    {12, 10},
};

const struct SpriteSheet gUnknown_0839AACC = {WeatherRainTiles, sizeof(WeatherRainTiles), 0x1206};

const struct OamData gOamData_839AAD4 =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 0,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};

const struct SpriteFrameImage gSpriteImageTable_839AADC[] =
{
    {gSpriteImage_8398948, sizeof(gSpriteImage_8398948)},
    {gSpriteImage_8398968, sizeof(gSpriteImage_8398968)},
};

const union AnimCmd gSpriteAnim_839AAEC[] =
{
    ANIMCMD_FRAME(0, 16),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_839AAF4[] =
{
    ANIMCMD_FRAME(1, 16),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_839AAFC[] =
{
    gSpriteAnim_839AAEC,
    gSpriteAnim_839AAF4,
};

void sub_807ED48(struct Sprite *);
const struct SpriteTemplate gSpriteTemplate_839AB04 =
{
    .tileTag = 0xFFFF,
    .paletteTag = 4608,
    .oam = &gOamData_839AAD4,
    .anims = gSpriteAnimTable_839AAFC,
    .images = gSpriteImageTable_839AADC,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_807ED48,
};

// unused data
const u16 unusedData_839AB1C[] = {0, 6, 6, 12, 18, 42, 300, 300};

const struct OamData gOamData_839AB2C =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 1,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0,
};

const union AnimCmd gSpriteAnim_839AB34[] =
{
    ANIMCMD_FRAME(0, 16),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_839AB3C[] =
{
    ANIMCMD_FRAME(32, 16),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_839AB44[] =
{
    ANIMCMD_FRAME(64, 16),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_839AB4C[] =
{
    ANIMCMD_FRAME(96, 16),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_839AB54[] =
{
    ANIMCMD_FRAME(128, 16),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_839AB5C[] =
{
    ANIMCMD_FRAME(160, 16),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_839AB64[] =
{
    gSpriteAnim_839AB34,
    gSpriteAnim_839AB3C,
    gSpriteAnim_839AB44,
    gSpriteAnim_839AB4C,
    gSpriteAnim_839AB54,
    gSpriteAnim_839AB5C,
};

const union AffineAnimCmd gSpriteAffineAnim_839AB7C[] =
{
    AFFINEANIMCMD_FRAME(0x200, 0x200, 0, 0),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_839AB8C[] =
{
    gSpriteAffineAnim_839AB7C,
};

void sub_807F688(struct Sprite *);
const struct SpriteTemplate gSpriteTemplate_839AB90 =
{
    .tileTag = 4609,
    .paletteTag = 4608,
    .oam = &gOamData_839AB2C,
    .anims = gSpriteAnimTable_839AB64,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_839AB8C,
    .callback = sub_807F688,
};

const struct SpriteSheet gWeatherFog1SpriteSheet = {gWeatherFog1Tiles, sizeof(gWeatherFog1Tiles), 0x1201};
const struct SpriteSheet gWeatherAshSpriteSheet = {WeatherAshTiles, sizeof(WeatherAshTiles), 0x1202};

const struct OamData gOamData_839ABB8 =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 1,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 15,
    .affineParam = 0,
};

const union AnimCmd gSpriteAnim_839ABC0[] =
{
    ANIMCMD_FRAME(0, 60),
    ANIMCMD_FRAME(64, 60),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_839ABCC[] =
{
    gSpriteAnim_839ABC0,
};

void sub_807FAA8(struct Sprite *);
const struct SpriteTemplate gSpriteTemplate_839ABD0 =
{
    .tileTag = 4610,
    .paletteTag = 4608,
    .oam = &gOamData_839ABB8,
    .anims = gSpriteAnimTable_839ABCC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_807FAA8,
};

const struct SpriteSheet gWeatherFog0SpriteSheet = {WeatherFog0Tiles, sizeof(WeatherFog0Tiles), 0x1203};

const struct OamData gOamData_839ABF0 =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 1,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0,
};

const union AnimCmd gSpriteAnim_839ABF8[] =
{
    ANIMCMD_FRAME(0, 16),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_839AC00[] =
{
    gSpriteAnim_839ABF8,
};

void sub_807FE3C(struct Sprite *);
const struct SpriteTemplate gSpriteTemplate_839AC04 =
{
    .tileTag = 4611,
    .paletteTag = 4608,
    .oam = &gOamData_839ABF0,
    .anims = gSpriteAnimTable_839AC00,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_807FE3C,
};

const struct OamData gOamData_839AC1C =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 1,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};

const union AnimCmd gSpriteAnim_839AC24[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_839AC2C[] =
{
    ANIMCMD_FRAME(64, 3),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_839AC34[] =
{
    gSpriteAnim_839AC24,
    gSpriteAnim_839AC2C,
};

void sub_8080338(struct Sprite *);
const struct SpriteTemplate gSpriteTemplate_839AC3C =
{
    .tileTag = 4612,
    .paletteTag = 4609,
    .oam = &gOamData_839AC1C,
    .anims = gSpriteAnimTable_839AC34,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_8080338,
};

const struct SpriteSheet gWeatherSandstormSpriteSheet = {WeatherSandstormTiles, sizeof(WeatherSandstormTiles), 0x1204};

bool8 sub_807E7B4(void)
{
    u8 r7;
    u8 spriteId;

    if (gWeatherPtr->unknown_6DA == 24)
        return FALSE;

    r7 = gWeatherPtr->unknown_6DA;
    spriteId = CreateSpriteAtEnd(&gSpriteTemplate_839AAA4,
      gUnknown_0839AA08[r7].x, gUnknown_0839AA08[r7].y, 78);
    if (spriteId != 64)
    {
        gSprites[spriteId].data[5] = 0;
        gSprites[spriteId].data[1] = r7 * 145;
        while (gSprites[spriteId].data[1] >= 600)
            gSprites[spriteId].data[1] -= 600;
        sub_807E4EC(&gSprites[spriteId]);
        sub_807E6F0(&gSprites[spriteId], r7 * 9);
        gSprites[spriteId].invisible = TRUE;
        gWeatherPtr->unknown_0[r7] = &gSprites[spriteId];
    }
    else
    {
        gWeatherPtr->unknown_0[r7] = NULL;
    }

    if (++gWeatherPtr->unknown_6DA == 24)
    {
        u16 i;

        for (i = 0; i < 24; i++)
        {
            if (gWeatherPtr->unknown_0[i] != NULL)
            {
                if (gWeatherPtr->unknown_0[i]->data[6] == 0)
                    gWeatherPtr->unknown_0[i]->callback = sub_807E5C0;
                else
                    gWeatherPtr->unknown_0[i]->callback = sub_807E6C4;
            }
        }
        return FALSE;
    }
    return TRUE;
}

bool8 sub_807E8E8(void)
{
    if (gWeatherPtr->unknown_6D8 == gWeatherPtr->unknown_6D9)
        return FALSE;

    if (++gWeatherPtr->unknown_6D6 > gWeatherPtr->unknown_6DB)
    {
        gWeatherPtr->unknown_6D6 = 0;
        if (gWeatherPtr->unknown_6D8 < gWeatherPtr->unknown_6D9)
        {
            gWeatherPtr->unknown_0[gWeatherPtr->unknown_6D8++]->data[5] = 1;
        }
        else
        {
            gWeatherPtr->unknown_6D8--;
            gWeatherPtr->unknown_0[gWeatherPtr->unknown_6D8]->data[5] = 0;
            gWeatherPtr->unknown_0[gWeatherPtr->unknown_6D8]->invisible = TRUE;
        }
    }
    return TRUE;
}

void sub_807E974(void)
{
    u16 i;

    for (i = 0; i < gWeatherPtr->unknown_6DA; i++)
    {
        if (gWeatherPtr->unknown_0[i] != NULL)
            DestroySprite(gWeatherPtr->unknown_0[i]);
    }
    gWeatherPtr->unknown_6DA = 0;
    FreeSpriteTilesByTag(0x1206);
}

//------------------------------------------------------------------------------
// Snow
//------------------------------------------------------------------------------

void Snow_InitVars(void)
{
    gWeatherPtr->unknown_6CC = 0;
    gWeatherPtr->unknown_6D2 = 0;
    gWeatherPtr->unknown_6C1 = 3;
    gWeatherPtr->unknown_6C2 = 20;
    gWeatherPtr->unknown_6E5 = 16;
    gWeatherPtr->unknown_6E0 = 0;
}

void snowflakes_progress2(void);
void sub_807ED48(struct Sprite *);

void sub_807EA18(void)
{
    Snow_InitVars();
    while (gWeatherPtr->unknown_6D2 == 0)
    {
        u16 i;

        snowflakes_progress2();
        for (i = 0; i < gWeatherPtr->unknown_6E4; i++)
        {
            sub_807ED48(gWeatherPtr->snowflakeSprites[i]);
        }
    }
}

u8 snowflakes_progress(void);

void snowflakes_progress2(void)
{
    if (gWeatherPtr->unknown_6CC == 0 && snowflakes_progress() == FALSE)
    {
        gWeatherPtr->unknown_6D2 = 1;
        gWeatherPtr->unknown_6CC++;
    }
}

bool8 sub_807EAC0(void)
{
    switch (gWeatherPtr->unknown_6CE)
    {
    case 0:
        gWeatherPtr->unknown_6E5 = 0;
        gWeatherPtr->unknown_6E0 = 0;
        gWeatherPtr->unknown_6CE++;
        // fall through
    case 1:
        if (snowflakes_progress() == FALSE)
        {
            gWeatherPtr->unknown_6CE++;
            return FALSE;
        }
        return TRUE;
    }
    return FALSE;
}

bool8 snowflake_add(void);
bool8 snowflake_remove(void);

bool8 snowflakes_progress(void)
{
    if (gWeatherPtr->unknown_6E4 == gWeatherPtr->unknown_6E5)
        return FALSE;

    gWeatherPtr->unknown_6E0++;
    if (gWeatherPtr->unknown_6E0 > 36)
    {
        gWeatherPtr->unknown_6E0 = 0;
        if (gWeatherPtr->unknown_6E4 < gWeatherPtr->unknown_6E5)
            snowflake_add();
        else
            snowflake_remove();
    }
    return (gWeatherPtr->unknown_6E4 != gWeatherPtr->unknown_6E5);
}

void sub_807EC40(struct Sprite *);

bool8 snowflake_add(void)
{
    u8 spriteId = CreateSpriteAtEnd(&gSpriteTemplate_839AB04, 0, 0, 78);

    if (spriteId == 64)
        return FALSE;
    gSprites[spriteId].data[4] = gWeatherPtr->unknown_6E4;
    sub_807EC40(&gSprites[spriteId]);
    gSprites[spriteId].coordOffsetEnabled = TRUE;
    gWeatherPtr->snowflakeSprites[gWeatherPtr->unknown_6E4++] = &gSprites[spriteId];
    return TRUE;
}

bool8 snowflake_remove(void)
{
    if (gWeatherPtr->unknown_6E4 != 0)
    {
        DestroySprite(gWeatherPtr->snowflakeSprites[--gWeatherPtr->unknown_6E4]);
        return TRUE;
    }
    return FALSE;
}

void sub_807EC40(struct Sprite *sprite)
{
    u16 r4 = ((sprite->data[4] * 5) & 7) * 30 + (Random() % 30);
    u16 r6;

    sprite->pos1.y = -3 - (gSpriteCoordOffsetY + sprite->centerToCornerVecY);
    sprite->pos1.x = r4 - (gSpriteCoordOffsetX + sprite->centerToCornerVecX);
    sprite->data[0] = sprite->pos1.y * 128;
    sprite->pos2.x = 0;
    r6 = Random();
    sprite->data[1] = (r6 & 3) * 5 + 64;
    sprite->data[7] = (r6 & 3) * 5 + 64;
    StartSpriteAnim(sprite, (r6 & 1) ? 0 : 1);
    sprite->data[3] = 0;
    sprite->data[2] = ((r6 & 3) == 0) ? 2 : 1;
    sprite->data[6] = (r6 & 0x1F) + 210;
    sprite->data[5] = 0;
}

void sub_807ECEC(struct Sprite *sprite)
{
    if (gWeatherPtr->unknown_6E2 > 18)
    {
        sprite->invisible = FALSE;
        sprite->callback = sub_807ED48;
        sprite->pos1.y = 0xFA - (gSpriteCoordOffsetY + sprite->centerToCornerVecY);
        sprite->data[0] = sprite->pos1.y * 128;
        gWeatherPtr->unknown_6E2 = 0;
    }
}

void sub_807ED48(struct Sprite *sprite)
{
    s16 r3;
    s16 r2;

    sprite->data[0] += sprite->data[1];
    sprite->pos1.y = sprite->data[0] >> 7;
    sprite->data[3] = (sprite->data[3] + sprite->data[2]) & 0xFF;
    sprite->pos2.x = gSineTable[sprite->data[3]] / 64;

    r3 = (sprite->pos1.x + sprite->centerToCornerVecX + gSpriteCoordOffsetX) & 0x1FF;
    if (r3 & 0x100)
        r3 = -0x100 | r3;  // hmm... what is this?
    if (r3 < -3)
        sprite->pos1.x = 242 - (gSpriteCoordOffsetX + sprite->centerToCornerVecX);
    else if (r3 > 242)
        sprite->pos1.x = -3 - (gSpriteCoordOffsetX + sprite->centerToCornerVecX);

    r2 = (sprite->pos1.y + sprite->centerToCornerVecY + gSpriteCoordOffsetY) & 0xFF;
    if (r2 > 163 && r2 < 171)
    {
        sprite->pos1.y = 250 - (gSpriteCoordOffsetY + sprite->centerToCornerVecY);
        sprite->data[0] = sprite->pos1.y * 128;
        sprite->data[5] = 0;
        sprite->data[6] = 220;
    }
    else if (r2 > 242 && r2 < 250)
    {
        sprite->pos1.y = 163;
        sprite->data[0] = sprite->pos1.y * 128;
        sprite->data[5] = 0;
        sprite->data[6] = 220;
        sprite->invisible = TRUE;
        sprite->callback = sub_807ECEC;
    }

    sprite->data[5]++;
    if (sprite->data[5] == sprite->data[6])
    {
        sub_807EC40(sprite);
        sprite->pos1.y = 250;
        sprite->invisible = TRUE;
        sprite->callback = sub_807ECEC;
    }
}

//------------------------------------------------------------------------------
// Medium Rain
//------------------------------------------------------------------------------

void sub_807EE80(void)
{
    gWeatherPtr->unknown_6CC = 0;
    gWeatherPtr->unknown_6D2 = 0;
    gWeatherPtr->unknown_6D6 = 0;
    gWeatherPtr->unknown_6DB = 4;
    gWeatherPtr->unknown_6DC = 0;
    gWeatherPtr->unknown_6D9 = 16;
    gWeatherPtr->unknown_6C1 = 3;
    gWeatherPtr->unknown_6C2 = 20;
    gWeatherPtr->unknown_6D2 = 0;  // duplicate assignment
    gWeatherPtr->unknown_6ED = 0;
    SetRainStrengthFromSoundEffect(SE_T_AME);
}

void sub_807EFC0(void);

void sub_807EEF4(void)
{
    sub_807EE80();
    while (gWeatherPtr->unknown_6D2 == 0)
        sub_807EFC0();
}

//------------------------------------------------------------------------------
// Heavy Rain
//------------------------------------------------------------------------------

void sub_807EF24(void)
{
    gWeatherPtr->unknown_6CC = 0;
    gWeatherPtr->unknown_6D2 = 0;
    gWeatherPtr->unknown_6D6 = 0;
    gWeatherPtr->unknown_6DB = 4;
    gWeatherPtr->unknown_6DC = 1;
    gWeatherPtr->unknown_6D9 = 24;
    gWeatherPtr->unknown_6C1 = 3;
    gWeatherPtr->unknown_6C2 = 20;
    gWeatherPtr->unknown_6D2 = 0;  // duplicate assignment
    SetRainStrengthFromSoundEffect(SE_T_OOAME);
}

void sub_807EF90(void)
{
    sub_807EF24();
    while (gWeatherPtr->unknown_6D2 == 0)
        sub_807EFC0();
}

void sub_807F434(void);
void sub_807F3F8(u16);

void sub_807EFC0(void)
{
    sub_807F434();
    switch (gWeatherPtr->unknown_6CC)
    {
    case 0:
        sub_807E7A4();
        gWeatherPtr->unknown_6CC++;
        break;
    case 1:
        if (sub_807E7B4())
            break;
        gWeatherPtr->unknown_6CC++;
        break;
    case 2:
        if (sub_807E8E8())
            break;
        gWeatherPtr->unknown_6D2 = 1;
        gWeatherPtr->unknown_6CC++;
        break;
    case 3:
        if (gWeatherPtr->unknown_6C6 == 0)
            break;
        gWeatherPtr->unknown_6CC = 6;
        break;
    case 4:
        gWeatherPtr->unknown_6EA = 1;
        gWeatherPtr->unknown_6E6 = (Random() % 360) + 360;
        gWeatherPtr->unknown_6CC++;
        // fall through
    case 5:
        if (--gWeatherPtr->unknown_6E6 != 0)
            break;
        gWeatherPtr->unknown_6CC++;
        break;
    case 6:
        gWeatherPtr->unknown_6EA = 1;
        gWeatherPtr->unknown_6EB = Random() % 2;
        gWeatherPtr->unknown_6CC++;
        break;
    case 7:
        gWeatherPtr->unknown_6EC = (Random() & 1) + 1;
        gWeatherPtr->unknown_6CC++;
        // fall through
    case 8:
        sub_807D5BC(19);
        if (gWeatherPtr->unknown_6EB == 0 && gWeatherPtr->unknown_6EC == 1)
            sub_807F3F8(20);
        gWeatherPtr->unknown_6E6 = (Random() % 3) + 6;
        gWeatherPtr->unknown_6CC++;
        break;
    case 9:
        if (--gWeatherPtr->unknown_6E6 != 0)
            break;
        sub_807D5BC(3);
        gWeatherPtr->unknown_6EA = 1;
        if (--gWeatherPtr->unknown_6EC != 0)
        {
            gWeatherPtr->unknown_6E6 = (Random() % 16) + 60;
            gWeatherPtr->unknown_6CC = 10;
        }
        else if (gWeatherPtr->unknown_6EB == 0)
        {
            gWeatherPtr->unknown_6CC = 4;
        }
        else
        {
            gWeatherPtr->unknown_6CC = 11;
        }
        break;
    case 10:
        if (--gWeatherPtr->unknown_6E6 != 0)
            break;
        gWeatherPtr->unknown_6CC = 8;
        break;
    case 11:
        gWeatherPtr->unknown_6E6 = (Random() % 16) + 60;
        gWeatherPtr->unknown_6CC++;
        break;
    case 12:
        if (--gWeatherPtr->unknown_6E6 != 0)
            break;
        sub_807F3F8(100);
        sub_807D5BC(19);
        // Why use "% 16" everywhere else and "& 0xF" here. So dumb.
        gWeatherPtr->unknown_6E6 = (Random() & 0xF) + 30;
        gWeatherPtr->unknown_6CC++;
        break;
    case 13:
        if (--gWeatherPtr->unknown_6E6 != 0)
            break;
        sub_807D5F0(19, 3, 5);
        gWeatherPtr->unknown_6CC++;
        break;
    case 14:
        if (gWeatherPtr->unknown_6C6 != 3)
            break;
        gWeatherPtr->unknown_6EA = 1;
        gWeatherPtr->unknown_6CC = 4;
        break;
    }
}

bool8 sub_807F34C(void)
{
    switch (gWeatherPtr->unknown_6CE)
    {
    case 0:
        gWeatherPtr->unknown_6EA = 0;
        gWeatherPtr->unknown_6CE++;
        // fall through
    case 1:
        sub_807EFC0();
        if (gWeatherPtr->unknown_6EA != 0)
        {
            if (gWeatherPtr->unknown_6D1 == 3
             || gWeatherPtr->unknown_6D1 == 5
             || gWeatherPtr->unknown_6D1 == 13)
                return FALSE;
            gWeatherPtr->unknown_6D9 = 0;
            gWeatherPtr->unknown_6CE++;
        }
        break;
    case 2:
        if (sub_807E8E8())
            break;
        sub_807E974();
        gWeatherPtr->unknown_6ED = 0;
        gWeatherPtr->unknown_6CE++;
        return FALSE;
    default:
        return FALSE;
    }
    return TRUE;
}

void sub_807F3F8(u16 a)
{
    if (gWeatherPtr->unknown_6ED == 0)
    {
        gWeatherPtr->unknown_6E8 = Random() % a;
        gWeatherPtr->unknown_6ED = 1;
    }
}

void sub_807F434(void)
{
    if (gWeatherPtr->unknown_6ED == 1)
    {
        if (gWeatherPtr->unknown_6E8 == 0)
        {
            if (IsSEPlaying())
                return;
            if (Random() & 1)
                PlaySE(SE_T_KAMI);
            else
                PlaySE(SE_T_KAMI2);
            gWeatherPtr->unknown_6ED = 0;
        }
        else
        {
            gWeatherPtr->unknown_6E8--;
        }
    }
}

void sub_807F49C(void)
{
    gWeatherPtr->unknown_6CC = 0;
    gWeatherPtr->unknown_6D2 = 0;
    gWeatherPtr->unknown_6C1 = 0;
    gWeatherPtr->unknown_6C2 = 20;
    if (gWeatherPtr->unknown_6FB == 0)
    {
        gWeatherPtr->unknown_6F0 = 0;
        gWeatherPtr->unknown_6F2 = 0;
        gWeatherPtr->unknown_6EE = 0;
        sub_807DB64(0, 16);
    }
}

void sub_807F52C(void);

void sub_807F4FC(void)
{
    sub_807F49C();
    while (gWeatherPtr->unknown_6D2 == 0)
        sub_807F52C();
}

void sub_807F6E8(void);

void sub_807F52C(void)
{
    gWeatherPtr->unknown_6EE = (gSpriteCoordOffsetX - gWeatherPtr->unknown_6F2) & 0xFF;
    if (++gWeatherPtr->unknown_6F0 > 3)
    {
        gWeatherPtr->unknown_6F0 = 0;
        gWeatherPtr->unknown_6F2++;
    }
    switch (gWeatherPtr->unknown_6CC)
    {
    case 0:
        sub_807F6E8();
        if (gWeatherPtr->currWeather == 6)
            sub_807DBA4(12, 8, 3);
        else
            sub_807DBA4(4, 16, 0);
        gWeatherPtr->unknown_6CC++;
        break;
    case 1:
        if (sub_807DBE8())
        {
            gWeatherPtr->unknown_6D2 = 1;
            gWeatherPtr->unknown_6CC++;
        }
        break;
    }
}

void sub_807F7A4(void);

bool8 sub_807F5EC(void)
{
    gWeatherPtr->unknown_6EE = (gSpriteCoordOffsetX - gWeatherPtr->unknown_6F2) & 0xFF;
    if (++gWeatherPtr->unknown_6F0 > 3)
    {
        gWeatherPtr->unknown_6F0 = 0;
        gWeatherPtr->unknown_6F2++;
    }
    switch (gWeatherPtr->unknown_6CE)
    {
    case 0:
        sub_807DBA4(0, 16, 3);
        gWeatherPtr->unknown_6CE++;
        break;
    case 1:
        if (!sub_807DBE8())
            break;
        gWeatherPtr->unknown_6CE++;
        break;
    case 2:
        sub_807F7A4();
        gWeatherPtr->unknown_6CE++;
        break;
    default:
        return FALSE;
    }
    return TRUE;
}

void sub_807F688(struct Sprite *sprite)
{
    sprite->pos2.y = (u8)gSpriteCoordOffsetY;
    sprite->pos1.x = gWeatherPtr->unknown_6EE + 32 + sprite->data[0] * 64;
    if (sprite->pos1.x > 0x10F)
    {
        sprite->pos1.x = 480 + gWeatherPtr->unknown_6EE - (4 - sprite->data[0]) * 64;
        sprite->pos1.x &= 0x1FF;
    }
}
