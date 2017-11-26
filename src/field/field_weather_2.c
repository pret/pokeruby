#include "global.h"
#include "field_map_obj.h"
#include "field_weather.h"
#include "overworld.h"
#include "rng.h"
#include "script.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

extern struct Weather *const gWeatherPtr;

const u16 gUnknown_08397108[] = INCBIN_U16("graphics/weather/1.gbapal");
const u16 gUnknown_08397128[] = INCBIN_U16("graphics/weather/2.gbapal");
const u8 gWeatherFog1Tiles[] = INCBIN_U8("graphics/weather/fog1.4bpp");
const u8 gWeatherFog2Tiles[] = INCBIN_U8("graphics/weather/fog2.4bpp");
const u8 gWeatherCloudTiles[] = INCBIN_U8("graphics/weather/cloud.4bpp");
const u8 gWeatherSnow1Tiles[] = INCBIN_U8("graphics/weather/snow0.4bpp");
const u8 gWeatherSnow2Tiles[] = INCBIN_U8("graphics/weather/snow1.4bpp");
const u8 gWeatherBubbleTiles[] = INCBIN_U8("graphics/weather/bubble.4bpp");
const u8 gWeatherAshTiles[] = INCBIN_U8("graphics/weather/ash.4bpp");
const u8 gWeatherRainTiles[] = INCBIN_U8("graphics/weather/rain.4bpp");
const u8 gWeatherSandstormTiles[] = INCBIN_U8("graphics/weather/sandstorm.4bpp");

static const struct Coords16 gUnknown_0839A9C8[] =
{
    { 0, 66},
    { 5, 73},
    {10, 78},
};

static const struct SpriteSheet sCloudSpriteSheet = {gWeatherCloudTiles, 0x800, 0x1200};

static const struct OamData gOamData_839A9DC =
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

static const union AnimCmd gSpriteAnim_839A9E4[] =
{
    ANIMCMD_FRAME(0, 16),
    ANIMCMD_END,
};

static const union AnimCmd *const gSpriteAnimTable_839A9EC[] =
{
    gSpriteAnim_839A9E4,
};

void sub_807E0F4(struct Sprite *);
static const struct SpriteTemplate sCloudSpriteTemplate =
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
extern void Weather_SetTargetBlendCoeffs(u8 a, u8 b, int c);
extern bool8 Weather_UpdateBlend(void);
extern void SetRainStrengthFromSoundEffect(u16 sndEff);
extern void sub_807D5F0(u8 a, u8 b, u8 c);

//------------------------------------------------------------------------------
// Clouds
//------------------------------------------------------------------------------

void Clouds_InitVars(void)
{
    gWeatherPtr->unknown_6C1 = 0;
    gWeatherPtr->unknown_6C2 = 20;
    gWeatherPtr->weatherGfxLoaded = FALSE;
    gWeatherPtr->initStep = 0;
    if (gWeatherPtr->cloudsActive == FALSE)
        Weather_SetBlendCoeffs(0, 16);
}

void Clouds_Main(void);

void Clouds_InitAll(void)
{
    Clouds_InitVars();
    while (gWeatherPtr->weatherGfxLoaded == FALSE)
        Clouds_Main();
}

void CreateCloudSprites(void);

void Clouds_Main(void)
{
    switch (gWeatherPtr->initStep)
    {
    case 0:
        CreateCloudSprites();
        gWeatherPtr->initStep++;
        break;
    case 1:
        Weather_SetTargetBlendCoeffs(12, 8, 1);
        gWeatherPtr->initStep++;
        break;
    case 2:
        if (Weather_UpdateBlend())
        {
            gWeatherPtr->weatherGfxLoaded = TRUE;
            gWeatherPtr->initStep++;
        }
        break;
    }
}

void sub_807E0A0(void);

bool8 Clouds_Finish(void)
{
    switch (gWeatherPtr->unknown_6CE)
    {
    case 0:
        Weather_SetTargetBlendCoeffs(0, 16, 1);
        gWeatherPtr->unknown_6CE++;
        return TRUE;
    case 1:
        if (Weather_UpdateBlend())
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

void CreateCloudSprites(void)
{
    u16 i;

    if (gWeatherPtr->cloudsActive == TRUE)
        return;
    LoadSpriteSheet(&sCloudSpriteSheet);
    sub_807D8C0(gUnknown_08397108);
    for (i = 0; i < 3; i++)
    {
        u8 spriteId = CreateSprite(&sCloudSpriteTemplate, 0, 0, 0xFF);

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
    gWeatherPtr->cloudsActive = TRUE;
}

void sub_807E0A0(void)
{
    u16 i;

    if (gWeatherPtr->cloudsActive == FALSE)
        return;
    for (i = 0; i < 3; i++)
    {
        if (gWeatherPtr->cloudSprites[i] != NULL)
            DestroySprite(gWeatherPtr->cloudSprites[i]);
    }
    FreeSpriteTilesByTag(0x1200);
    gWeatherPtr->cloudsActive = FALSE;
}

void sub_807E0F4(struct Sprite *sprite)
{
    sprite->data[0] = (sprite->data[0] + 1) & 1;
    if (sprite->data[0] != 0)
        sprite->pos1.x--;
}

void sub_807E110(void)
{
    gWeatherPtr->initStep = 0;
    gWeatherPtr->weatherGfxLoaded = FALSE;
    gWeatherPtr->unknown_6C1 = 0;
    gWeatherPtr->unknown_6C2 = 0;
}

void sub_807E174(void);

void sub_807E144(void)
{
    sub_807E110();
    while (gWeatherPtr->weatherGfxLoaded == FALSE)
        sub_807E174();
}

void sub_807E174(void)
{
    switch (gWeatherPtr->initStep)
    {
    case 0:
        if (gWeatherPtr->unknown_6C6 != 0)
            gWeatherPtr->initStep++;
        break;
    case 1:
        sub_807D9A8();
        gWeatherPtr->initStep++;
        break;
    case 2:
        if (sub_807D9C8() == FALSE)
            gWeatherPtr->initStep++;
        break;
    case 3:
        sub_807DA14();
        gWeatherPtr->initStep++;
        break;
    case 4:
        sub_807DA4C();
        if (gWeatherPtr->unknown_73C == 6)
        {
            gWeatherPtr->weatherGfxLoaded = TRUE;
            gWeatherPtr->initStep++;
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
        REG_BLDCNT = BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3 | BLDCNT_TGT1_OBJ
                   | BLDCNT_EFFECT_LIGHTEN;
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
    gWeatherPtr->initStep = 0;
    gWeatherPtr->weatherGfxLoaded = FALSE;
    gWeatherPtr->unknown_6D6 = 0;
    gWeatherPtr->unknown_6DB = 8;
    gWeatherPtr->unknown_6DC = 0;
    gWeatherPtr->unknown_6D9 = 10;
    gWeatherPtr->unknown_6C1 = 3;
    gWeatherPtr->unknown_6C2 = 20;
    SetRainStrengthFromSoundEffect(SE_T_KOAME);
}

void LightRain_Main(void);

void LightRain_InitAll(void)
{
    LightRain_InitVars();
    while (gWeatherPtr->weatherGfxLoaded == FALSE)
        LightRain_Main();
}

void LoadRainSpriteSheet(void);
u8 CreateRainSprites(void);
u8 sub_807E8E8(void);

void LightRain_Main(void)
{
    switch (gWeatherPtr->initStep)
    {
    case 0:
        LoadRainSpriteSheet();
        gWeatherPtr->initStep++;
        break;
    case 1:
        if (CreateRainSprites() == 0)
            gWeatherPtr->initStep++;
        break;
    case 2:
        if (sub_807E8E8() == FALSE)
        {
            gWeatherPtr->weatherGfxLoaded = TRUE;
            gWeatherPtr->initStep++;
        }
        break;
    }
}

void sub_807E974(void);

bool8 LightRain_Finish(void)
{
    switch (gWeatherPtr->unknown_6CE)
    {
    case 0:
        if (gWeatherPtr->nextWeather == WEATHER_RAIN_LIGHT
         || gWeatherPtr->nextWeather == WEATHER_RAIN_MED
         || gWeatherPtr->nextWeather == WEATHER_RAIN_HEAVY)
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

extern const struct SpriteSheet sRainSpriteSheet;  // defined below

void LoadRainSpriteSheet(void)
{
    LoadSpriteSheet(&sRainSpriteSheet);
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

static const struct OamData gOamData_839AA68 =
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

static const union AnimCmd gSpriteAnim_839AA70[] =
{
    ANIMCMD_FRAME(0, 16),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd gSpriteAnim_839AA78[] =
{
    ANIMCMD_FRAME(8, 3),
    ANIMCMD_FRAME(32, 2),
    ANIMCMD_FRAME(40, 2),
    ANIMCMD_END,
};

static const union AnimCmd gSpriteAnim_839AA88[] =
{
    ANIMCMD_FRAME(8, 3),
    ANIMCMD_FRAME(16, 3),
    ANIMCMD_FRAME(24, 4),
    ANIMCMD_END,
};

static const union AnimCmd *const gSpriteAnimTable_839AA98[] =
{
    gSpriteAnim_839AA70,
    gSpriteAnim_839AA78,
    gSpriteAnim_839AA88,
};

static const struct SpriteTemplate sRainSpriteTemplate =
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

static const struct SpriteSheet sRainSpriteSheet = {gWeatherRainTiles, sizeof(gWeatherRainTiles), 0x1206};

static const struct OamData gOamData_839AAD4 =
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

static const struct SpriteFrameImage gSpriteImageTable_839AADC[] =
{
    {gWeatherSnow1Tiles, sizeof(gWeatherSnow1Tiles)},
    {gWeatherSnow2Tiles, sizeof(gWeatherSnow2Tiles)},
};

static const union AnimCmd gSpriteAnim_839AAEC[] =
{
    ANIMCMD_FRAME(0, 16),
    ANIMCMD_END,
};

static const union AnimCmd gSpriteAnim_839AAF4[] =
{
    ANIMCMD_FRAME(1, 16),
    ANIMCMD_END,
};

static const union AnimCmd *const gSpriteAnimTable_839AAFC[] =
{
    gSpriteAnim_839AAEC,
    gSpriteAnim_839AAF4,
};

void sub_807ED48(struct Sprite *);
static const struct SpriteTemplate sSnowflakeSpriteTemplate =
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
static const u16 unusedData_839AB1C[] = {0, 6, 6, 12, 18, 42, 300, 300};

static const struct OamData gOamData_839AB2C =
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

static const union AnimCmd gSpriteAnim_839AB34[] =
{
    ANIMCMD_FRAME(0, 16),
    ANIMCMD_END,
};

static const union AnimCmd gSpriteAnim_839AB3C[] =
{
    ANIMCMD_FRAME(32, 16),
    ANIMCMD_END,
};

static const union AnimCmd gSpriteAnim_839AB44[] =
{
    ANIMCMD_FRAME(64, 16),
    ANIMCMD_END,
};

static const union AnimCmd gSpriteAnim_839AB4C[] =
{
    ANIMCMD_FRAME(96, 16),
    ANIMCMD_END,
};

static const union AnimCmd gSpriteAnim_839AB54[] =
{
    ANIMCMD_FRAME(128, 16),
    ANIMCMD_END,
};

static const union AnimCmd gSpriteAnim_839AB5C[] =
{
    ANIMCMD_FRAME(160, 16),
    ANIMCMD_END,
};

static const union AnimCmd *const gSpriteAnimTable_839AB64[] =
{
    gSpriteAnim_839AB34,
    gSpriteAnim_839AB3C,
    gSpriteAnim_839AB44,
    gSpriteAnim_839AB4C,
    gSpriteAnim_839AB54,
    gSpriteAnim_839AB5C,
};

static const union AffineAnimCmd gSpriteAffineAnim_839AB7C[] =
{
    AFFINEANIMCMD_FRAME(0x200, 0x200, 0, 0),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const gSpriteAffineAnimTable_839AB8C[] =
{
    gSpriteAffineAnim_839AB7C,
};

static void Fog2SpriteCallback(struct Sprite *);
static const struct SpriteTemplate sFog2SpriteTemplate =
{
    .tileTag = 4609,
    .paletteTag = 4608,
    .oam = &gOamData_839AB2C,
    .anims = gSpriteAnimTable_839AB64,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_839AB8C,
    .callback = Fog2SpriteCallback,
};

bool8 CreateRainSprites(void)
{
    u8 r7;
    u8 spriteId;

    if (gWeatherPtr->unknown_6DA == 24)
        return FALSE;

    r7 = gWeatherPtr->unknown_6DA;
    spriteId = CreateSpriteAtEnd(&sRainSpriteTemplate,
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
        gWeatherPtr->rainSprites[r7] = &gSprites[spriteId];
    }
    else
    {
        gWeatherPtr->rainSprites[r7] = NULL;
    }

    if (++gWeatherPtr->unknown_6DA == 24)
    {
        u16 i;

        for (i = 0; i < 24; i++)
        {
            if (gWeatherPtr->rainSprites[i] != NULL)
            {
                if (gWeatherPtr->rainSprites[i]->data[6] == 0)
                    gWeatherPtr->rainSprites[i]->callback = sub_807E5C0;
                else
                    gWeatherPtr->rainSprites[i]->callback = sub_807E6C4;
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
            gWeatherPtr->rainSprites[gWeatherPtr->unknown_6D8++]->data[5] = 1;
        }
        else
        {
            gWeatherPtr->unknown_6D8--;
            gWeatherPtr->rainSprites[gWeatherPtr->unknown_6D8]->data[5] = 0;
            gWeatherPtr->rainSprites[gWeatherPtr->unknown_6D8]->invisible = TRUE;
        }
    }
    return TRUE;
}

void sub_807E974(void)
{
    u16 i;

    for (i = 0; i < gWeatherPtr->unknown_6DA; i++)
    {
        if (gWeatherPtr->rainSprites[i] != NULL)
            DestroySprite(gWeatherPtr->rainSprites[i]);
    }
    gWeatherPtr->unknown_6DA = 0;
    FreeSpriteTilesByTag(0x1206);
}

//------------------------------------------------------------------------------
// Snow
//------------------------------------------------------------------------------

void Snow_InitVars(void)
{
    gWeatherPtr->initStep = 0;
    gWeatherPtr->weatherGfxLoaded = FALSE;
    gWeatherPtr->unknown_6C1 = 3;
    gWeatherPtr->unknown_6C2 = 20;
    gWeatherPtr->unknown_6E5 = 16;
    gWeatherPtr->unknown_6E0 = 0;
}

void Snow_Main(void);
void sub_807ED48(struct Sprite *);

void Snow_InitAll(void)
{
    Snow_InitVars();
    while (gWeatherPtr->weatherGfxLoaded == FALSE)
    {
        u16 i;

        Snow_Main();
        for (i = 0; i < gWeatherPtr->snowflakeSpriteCount; i++)
        {
            sub_807ED48(gWeatherPtr->snowflakeSprites[i]);
        }
    }
}

u8 snowflakes_progress(void);

void Snow_Main(void)
{
    if (gWeatherPtr->initStep == 0 && snowflakes_progress() == FALSE)
    {
        gWeatherPtr->weatherGfxLoaded = TRUE;
        gWeatherPtr->initStep++;
    }
}

bool8 Snow_Finish(void)
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

bool8 CreateSnowflakeSprite(void);
bool8 RemoveSnowflakeSprite(void);

bool8 snowflakes_progress(void)
{
    if (gWeatherPtr->snowflakeSpriteCount == gWeatherPtr->unknown_6E5)
        return FALSE;

    gWeatherPtr->unknown_6E0++;
    if (gWeatherPtr->unknown_6E0 > 36)
    {
        gWeatherPtr->unknown_6E0 = 0;
        if (gWeatherPtr->snowflakeSpriteCount < gWeatherPtr->unknown_6E5)
            CreateSnowflakeSprite();
        else
            RemoveSnowflakeSprite();
    }
    return (gWeatherPtr->snowflakeSpriteCount != gWeatherPtr->unknown_6E5);
}

void sub_807EC40(struct Sprite *);

bool8 CreateSnowflakeSprite(void)
{
    u8 spriteId = CreateSpriteAtEnd(&sSnowflakeSpriteTemplate, 0, 0, 78);

    if (spriteId == 64)
        return FALSE;
    gSprites[spriteId].data[4] = gWeatherPtr->snowflakeSpriteCount;
    sub_807EC40(&gSprites[spriteId]);
    gSprites[spriteId].coordOffsetEnabled = TRUE;
    gWeatherPtr->snowflakeSprites[gWeatherPtr->snowflakeSpriteCount++] = &gSprites[spriteId];
    return TRUE;
}

bool8 RemoveSnowflakeSprite(void)
{
    if (gWeatherPtr->snowflakeSpriteCount != 0)
    {
        DestroySprite(gWeatherPtr->snowflakeSprites[--gWeatherPtr->snowflakeSpriteCount]);
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

void MedRain_InitVars(void)
{
    gWeatherPtr->initStep = 0;
    gWeatherPtr->weatherGfxLoaded = FALSE;
    gWeatherPtr->unknown_6D6 = 0;
    gWeatherPtr->unknown_6DB = 4;
    gWeatherPtr->unknown_6DC = 0;
    gWeatherPtr->unknown_6D9 = 16;
    gWeatherPtr->unknown_6C1 = 3;
    gWeatherPtr->unknown_6C2 = 20;
    gWeatherPtr->weatherGfxLoaded = FALSE;  // duplicate assignment
    gWeatherPtr->unknown_6ED = 0;
    SetRainStrengthFromSoundEffect(SE_T_AME);
}

void Rain_Main(void);

void MedRain_InitAll(void)
{
    MedRain_InitVars();
    while (gWeatherPtr->weatherGfxLoaded == FALSE)
        Rain_Main();
}

//------------------------------------------------------------------------------
// Heavy Rain
//------------------------------------------------------------------------------

void HeavyRain_InitVars(void)
{
    gWeatherPtr->initStep = 0;
    gWeatherPtr->weatherGfxLoaded = FALSE;
    gWeatherPtr->unknown_6D6 = 0;
    gWeatherPtr->unknown_6DB = 4;
    gWeatherPtr->unknown_6DC = 1;
    gWeatherPtr->unknown_6D9 = 24;
    gWeatherPtr->unknown_6C1 = 3;
    gWeatherPtr->unknown_6C2 = 20;
    gWeatherPtr->weatherGfxLoaded = FALSE;  // duplicate assignment
    SetRainStrengthFromSoundEffect(SE_T_OOAME);
}

void HeavyRain_InitAll(void)
{
    HeavyRain_InitVars();
    while (gWeatherPtr->weatherGfxLoaded == FALSE)
        Rain_Main();
}

void UpdateThunderSound(void);
void SetThunderCounter(u16);

void Rain_Main(void)
{
    UpdateThunderSound();
    switch (gWeatherPtr->initStep)
    {
    case 0:
        LoadRainSpriteSheet();
        gWeatherPtr->initStep++;
        break;
    case 1:
        if (CreateRainSprites())
            break;
        gWeatherPtr->initStep++;
        break;
    case 2:
        if (sub_807E8E8())
            break;
        gWeatherPtr->weatherGfxLoaded = TRUE;
        gWeatherPtr->initStep++;
        break;
    case 3:
        if (gWeatherPtr->unknown_6C6 == 0)
            break;
        gWeatherPtr->initStep = 6;
        break;
    case 4:
        gWeatherPtr->unknown_6EA = 1;
        gWeatherPtr->unknown_6E6 = (Random() % 360) + 360;
        gWeatherPtr->initStep++;
        // fall through
    case 5:
        if (--gWeatherPtr->unknown_6E6 != 0)
            break;
        gWeatherPtr->initStep++;
        break;
    case 6:
        gWeatherPtr->unknown_6EA = 1;
        gWeatherPtr->unknown_6EB = Random() % 2;
        gWeatherPtr->initStep++;
        break;
    case 7:
        gWeatherPtr->unknown_6EC = (Random() & 1) + 1;
        gWeatherPtr->initStep++;
        // fall through
    case 8:
        sub_807D5BC(19);
        if (gWeatherPtr->unknown_6EB == 0 && gWeatherPtr->unknown_6EC == 1)
            SetThunderCounter(20);
        gWeatherPtr->unknown_6E6 = (Random() % 3) + 6;
        gWeatherPtr->initStep++;
        break;
    case 9:
        if (--gWeatherPtr->unknown_6E6 != 0)
            break;
        sub_807D5BC(3);
        gWeatherPtr->unknown_6EA = 1;
        if (--gWeatherPtr->unknown_6EC != 0)
        {
            gWeatherPtr->unknown_6E6 = (Random() % 16) + 60;
            gWeatherPtr->initStep = 10;
        }
        else if (gWeatherPtr->unknown_6EB == 0)
        {
            gWeatherPtr->initStep = 4;
        }
        else
        {
            gWeatherPtr->initStep = 11;
        }
        break;
    case 10:
        if (--gWeatherPtr->unknown_6E6 != 0)
            break;
        gWeatherPtr->initStep = 8;
        break;
    case 11:
        gWeatherPtr->unknown_6E6 = (Random() % 16) + 60;
        gWeatherPtr->initStep++;
        break;
    case 12:
        if (--gWeatherPtr->unknown_6E6 != 0)
            break;
        SetThunderCounter(100);
        sub_807D5BC(19);
        // Why use "% 16" everywhere else and "& 0xF" here. So dumb.
        gWeatherPtr->unknown_6E6 = (Random() & 0xF) + 30;
        gWeatherPtr->initStep++;
        break;
    case 13:
        if (--gWeatherPtr->unknown_6E6 != 0)
            break;
        sub_807D5F0(19, 3, 5);
        gWeatherPtr->initStep++;
        break;
    case 14:
        if (gWeatherPtr->unknown_6C6 != 3)
            break;
        gWeatherPtr->unknown_6EA = 1;
        gWeatherPtr->initStep = 4;
        break;
    }
}

bool8 Rain_Finish(void)
{
    switch (gWeatherPtr->unknown_6CE)
    {
    case 0:
        gWeatherPtr->unknown_6EA = 0;
        gWeatherPtr->unknown_6CE++;
        // fall through
    case 1:
        Rain_Main();
        if (gWeatherPtr->unknown_6EA != 0)
        {
            if (gWeatherPtr->nextWeather == WEATHER_RAIN_LIGHT
             || gWeatherPtr->nextWeather == WEATHER_RAIN_MED
             || gWeatherPtr->nextWeather == WEATHER_RAIN_HEAVY)
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

void SetThunderCounter(u16 max)
{
    if (gWeatherPtr->unknown_6ED == 0)
    {
        gWeatherPtr->thunderCounter = Random() % max;
        gWeatherPtr->unknown_6ED = 1;
    }
}

void UpdateThunderSound(void)
{
    if (gWeatherPtr->unknown_6ED == 1)
    {
        if (gWeatherPtr->thunderCounter == 0)
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
            gWeatherPtr->thunderCounter--;
        }
    }
}

//------------------------------------------------------------------------------
// Fog 2
//------------------------------------------------------------------------------

void Fog2_Main(void);
static void CreateFog2Sprites(void);
static void DestroyFog2Sprites(void);

void Fog2_InitVars(void)
{
    gWeatherPtr->initStep = 0;
    gWeatherPtr->weatherGfxLoaded = FALSE;
    gWeatherPtr->unknown_6C1 = 0;
    gWeatherPtr->unknown_6C2 = 20;
    if (gWeatherPtr->unknown_6FB == 0)
    {
        gWeatherPtr->unknown_6F0 = 0;
        gWeatherPtr->unknown_6F2 = 0;
        gWeatherPtr->fog2ScrollPosX = 0;
        Weather_SetBlendCoeffs(0, 16);
    }
}

void Fog2_InitAll(void)
{
    Fog2_InitVars();
    while (gWeatherPtr->weatherGfxLoaded == FALSE)
        Fog2_Main();
}

void Fog2_Main(void)
{
    gWeatherPtr->fog2ScrollPosX = (gSpriteCoordOffsetX - gWeatherPtr->unknown_6F2) & 0xFF;
    if (++gWeatherPtr->unknown_6F0 > 3)
    {
        gWeatherPtr->unknown_6F0 = 0;
        gWeatherPtr->unknown_6F2++;
    }
    switch (gWeatherPtr->initStep)
    {
    case 0:
        CreateFog2Sprites();
        if (gWeatherPtr->currWeather == WEATHER_FOG_2)
            Weather_SetTargetBlendCoeffs(12, 8, 3);
        else
            Weather_SetTargetBlendCoeffs(4, 16, 0);
        gWeatherPtr->initStep++;
        break;
    case 1:
        if (Weather_UpdateBlend())
        {
            gWeatherPtr->weatherGfxLoaded = TRUE;
            gWeatherPtr->initStep++;
        }
        break;
    }
}

bool8 Fog2_Finish(void)
{
    gWeatherPtr->fog2ScrollPosX = (gSpriteCoordOffsetX - gWeatherPtr->unknown_6F2) & 0xFF;
    if (++gWeatherPtr->unknown_6F0 > 3)
    {
        gWeatherPtr->unknown_6F0 = 0;
        gWeatherPtr->unknown_6F2++;
    }
    switch (gWeatherPtr->unknown_6CE)
    {
    case 0:
        Weather_SetTargetBlendCoeffs(0, 16, 3);
        gWeatherPtr->unknown_6CE++;
        break;
    case 1:
        if (!Weather_UpdateBlend())
            break;
        gWeatherPtr->unknown_6CE++;
        break;
    case 2:
        DestroyFog2Sprites();
        gWeatherPtr->unknown_6CE++;
        break;
    default:
        return FALSE;
    }
    return TRUE;
}

#define sprColumn data[0]

static void Fog2SpriteCallback(struct Sprite *sprite)
{
    sprite->pos2.y = (u8)gSpriteCoordOffsetY;
    sprite->pos1.x = gWeatherPtr->fog2ScrollPosX + 32 + sprite->sprColumn * 64;
    if (sprite->pos1.x > 0x10F)
    {
        sprite->pos1.x = 480 + gWeatherPtr->fog2ScrollPosX - (4 - sprite->sprColumn) * 64;
        sprite->pos1.x &= 0x1FF;
    }
}

static void CreateFog2Sprites(void)
{
    u16 i;

    if (gWeatherPtr->unknown_6FB == 0)
    {
        struct SpriteSheet fog2SpriteSheet = {gWeatherFog2Tiles, sizeof(gWeatherFog2Tiles), 0x1201};

        LoadSpriteSheet(&fog2SpriteSheet);
        for (i = 0; i < 20; i++)
        {
            u8 spriteId = CreateSpriteAtEnd(&sFog2SpriteTemplate, 0, 0, 0xFF);

            if (spriteId != MAX_SPRITES)
            {
                struct Sprite *sprite = &gSprites[spriteId];

                sprite->sprColumn = i % 5;
                sprite->pos1.x = (i % 5) * 64 + 32;
                sprite->pos1.y = (i / 5) * 64 + 32;
                ((struct Weather2 *)gWeatherPtr)->fogSprites[i] = sprite;
            }
            else
            {
                ((struct Weather2 *)gWeatherPtr)->fogSprites[i] = NULL;
            }
        }
        gWeatherPtr->unknown_6FB = 1;
    }
}

#undef sprColumn

static void DestroyFog2Sprites(void)
{
    u16 i;

    if (gWeatherPtr->unknown_6FB != 0)
    {
        for (i = 0; i < 20; i++)
        {
            if (((struct Weather2 *)gWeatherPtr)->fogSprites[i] != NULL)
                DestroySprite(((struct Weather2 *)gWeatherPtr)->fogSprites[i]);
        }
        FreeSpriteTilesByTag(0x1201);
        gWeatherPtr->unknown_6FB = 0;
    }
}

//------------------------------------------------------------------------------
// Fog 1
//------------------------------------------------------------------------------

void Fog1_InitVars(void)
{
    gWeatherPtr->initStep = 0;
    gWeatherPtr->weatherGfxLoaded = FALSE;
    gWeatherPtr->unknown_6C1 = 0;
    gWeatherPtr->unknown_6C2 = 20;
    gWeatherPtr->unknown_6FE = 20;
    if (gWeatherPtr->unknown_700 == 0)
    {
        Weather_SetBlendCoeffs(0, 16);
        REG_BLDALPHA = BLDALPHA_BLEND(64, 63);  // Those aren't even valid coefficients!
    }
}

void sub_807F888(void);

void sub_807F858(void)
{
    Fog1_InitVars();
    while (gWeatherPtr->weatherGfxLoaded == FALSE)
        sub_807F888();
}

void sub_807F99C(void);
void sub_807F9AC(void);

void sub_807F888(void)
{
    gWeatherPtr->unknown_6FC = gSpriteCoordOffsetX & 0x1FF;
    while (gWeatherPtr->unknown_6FC > 0xEF)
        gWeatherPtr->unknown_6FC -= 0xF0;
    switch (gWeatherPtr->initStep)
    {
    case 0:
        sub_807F99C();
        gWeatherPtr->initStep++;
        break;
    case 1:
        if (gWeatherPtr->unknown_700 == 0)
            sub_807F9AC();
        Weather_SetTargetBlendCoeffs(16, 0, 1);
        gWeatherPtr->initStep++;
        break;
    case 2:
        if (!Weather_UpdateBlend())
            break;
        gWeatherPtr->weatherGfxLoaded = TRUE;
        gWeatherPtr->initStep++;
        break;
    default:
        Weather_UpdateBlend();
        break;
    }
}

void sub_807FA54(void);

bool8 sub_807F934(void)
{
    switch (gWeatherPtr->unknown_6CE)
    {
    case 0:
        Weather_SetTargetBlendCoeffs(0, 16, 1);
        gWeatherPtr->unknown_6CE++;
        break;
    case 1:
        if (!Weather_UpdateBlend())
            break;
        sub_807FA54();
        gWeatherPtr->unknown_6CE++;
        break;
    case 2:
        REG_BLDALPHA = 0;
        gWeatherPtr->unknown_6CE++;
        return FALSE;
    default:
        return FALSE;
    }
    return TRUE;
}

const struct SpriteSheet gWeatherAshSpriteSheet = {gWeatherAshTiles, sizeof(gWeatherAshTiles), 0x1202};

void sub_807F99C(void)
{
    LoadSpriteSheet(&gWeatherAshSpriteSheet);
}

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

void sub_807F9AC(void)
{
    u8 i;

    if (gWeatherPtr->unknown_700 == 0)
    {
        for (i = 0; i < 20; i++)
        {
            u8 spriteId = CreateSpriteAtEnd(&gSpriteTemplate_839ABD0, 0, 0, 0x4E);

            if (spriteId != MAX_SPRITES)
            {
                struct Sprite *sprite = &gSprites[spriteId];

                sprite->data[1] = 0;
                sprite->data[2] = (u8)(i % 5);
                sprite->data[3] = (u8)(i / 5);
                sprite->data[0] = sprite->data[3] * 64 + 32;
                ((struct Weather2 *)gWeatherPtr)->fog1Sprites[i] = sprite;
            }
            else
            {
                ((struct Weather2 *)gWeatherPtr)->fog1Sprites[i] = NULL;
            }
        }
        gWeatherPtr->unknown_700 = 1;
    }
}

void sub_807FA54(void)
{
    u16 i;

    if (gWeatherPtr->unknown_700 != 0)
    {
        for (i = 0; i < 20; i++)
        {
            if (((struct Weather2 *)gWeatherPtr)->fog1Sprites[i] != NULL)
                DestroySprite(((struct Weather2 *)gWeatherPtr)->fog1Sprites[i]);
        }
        FreeSpriteTilesByTag(0x1202);
        gWeatherPtr->unknown_700 = 0;
    }
}

void sub_807FAA8(struct Sprite *sprite)
{
    sprite->data[1]++;
    if (sprite->data[1] > 5)
    {
        sprite->data[1] = 0;
        sprite->data[0]++;
    }
    sprite->pos1.y = gSpriteCoordOffsetY + sprite->data[0];
    sprite->pos1.x = gWeatherPtr->unknown_6FC + 32 + sprite->data[2] * 64;
    if (sprite->pos1.x > 271)
    {
        sprite->pos1.x = gWeatherPtr->unknown_6FC + 0x1E0 - (4 - sprite->data[2]) * 64;
        sprite->pos1.x &= 0x1FF;
    }
}

void sub_807FB24(void)
{
    gWeatherPtr->initStep = 0;
    gWeatherPtr->weatherGfxLoaded = 0;
    gWeatherPtr->unknown_6C1 = 0;
    gWeatherPtr->unknown_6C2 = 20;
    gWeatherPtr->unknown_6F0 = 0;
    gWeatherPtr->unknown_6F2 = 1;
    if (gWeatherPtr->unknown_724 == 0)
    {
        gWeatherPtr->unknown_71C = 0;
        gWeatherPtr->unknown_71E = 0;
        gWeatherPtr->unknown_720 = 0;
        gWeatherPtr->unknown_722 = 0;
        gWeatherPtr->unknown_718 = 0;
        gWeatherPtr->unknown_71A = 0;
        Weather_SetBlendCoeffs(0, 16);
    }
}

void sub_807FBD8(void);

void sub_807FBA8(void)
{
    sub_807FB24();
    while (gWeatherPtr->weatherGfxLoaded == FALSE)
        sub_807FBD8();
}

void sub_807FC9C(void);
void sub_807FD30(void);

void sub_807FBD8(void)
{
    sub_807FC9C();
    switch (gWeatherPtr->initStep)
    {
    case 0:
        sub_807FD30();
        gWeatherPtr->initStep++;
        break;
    case 1:
        Weather_SetTargetBlendCoeffs(12, 8, 8);
        gWeatherPtr->initStep++;
        break;
    case 2:
        if (!Weather_UpdateBlend())
            break;
        gWeatherPtr->weatherGfxLoaded = TRUE;
        gWeatherPtr->initStep++;
        break;
    }
}

void sub_807FDE8(void);

bool8 sub_807FC3C(void)
{
    sub_807FC9C();
    switch (gWeatherPtr->unknown_6CE)
    {
    case 0:
        Weather_SetTargetBlendCoeffs(0, 16, 1);
        gWeatherPtr->unknown_6CE++;
        break;
    case 1:
        if (!Weather_UpdateBlend())
            break;
        gWeatherPtr->unknown_6CE++;
        break;
    case 2:
        sub_807FDE8();
        gWeatherPtr->unknown_6CE++;
        break;
    default:
        return FALSE;
    }
    return TRUE;
}

void sub_807FC9C(void)
{
    if (++gWeatherPtr->unknown_71C > 2)
    {
        gWeatherPtr->unknown_720++;
        gWeatherPtr->unknown_71C = 0;
    }

    if (++gWeatherPtr->unknown_71E > 4)
    {
        gWeatherPtr->unknown_722++;
        gWeatherPtr->unknown_71E = 0;
    }

    gWeatherPtr->unknown_718 = (gSpriteCoordOffsetX - gWeatherPtr->unknown_720) & 0xFF;
    gWeatherPtr->unknown_71A = gSpriteCoordOffsetY + gWeatherPtr->unknown_722;
}

extern const struct SpriteTemplate gSpriteTemplate_839AC04;  // defined below

void sub_807FD30(void)
{
    u16 i;

    if (gWeatherPtr->unknown_724 == 0)
    {
        struct SpriteSheet fog1SpriteSheet = {gWeatherFog1Tiles, sizeof(gWeatherFog1Tiles), 0x1203};

        LoadSpriteSheet(&fog1SpriteSheet);
        for (i = 0; i < 20; i++)
        {
            u8 spriteId = CreateSpriteAtEnd(&gSpriteTemplate_839AC04, 0, (i / 5) * 64, 0xFF);

            if (spriteId != MAX_SPRITES)
            {
                struct Sprite *sprite = &gSprites[spriteId];

                sprite->data[0] = i % 5;
                sprite->data[1] = i / 5;
                ((struct Weather2 *)gWeatherPtr)->unknown_140[i] = sprite;
            }
            else
            {
                ((struct Weather2 *)gWeatherPtr)->unknown_140[i] = NULL;
            }
        }
        gWeatherPtr->unknown_724 = 1;
    }
}

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

void sub_807FDE8(void)
{
    u16 i;

    if (gWeatherPtr->unknown_724 != 0)
    {
        for (i = 0; i < 20; i++)
        {
            if (((struct Weather2 *)gWeatherPtr)->unknown_140[i] != NULL)
                DestroySprite(((struct Weather2 *)gWeatherPtr)->unknown_140[i]);
        }
        FreeSpriteTilesByTag(0x1203);
        gWeatherPtr->unknown_724 = 0;
    }
}

void sub_807FE3C(struct Sprite *sprite)
{
    sprite->pos2.y = gWeatherPtr->unknown_71A;
    sprite->pos1.x = gWeatherPtr->unknown_718 + 32 + sprite->data[0] * 64;
    if (sprite->pos1.x > 271)
    {
        sprite->pos1.x = gWeatherPtr->unknown_718 + 0x1E0 - (4 - sprite->data[0]) * 64;
        sprite->pos1.x &= 0x1FF;
    }
}

void sub_807FE9C(void)
{
    gWeatherPtr->initStep = 0;
    gWeatherPtr->weatherGfxLoaded = 0;
    gWeatherPtr->unknown_6C1 = 0;
    gWeatherPtr->unknown_6C2 = 20;
    if (gWeatherPtr->unknown_716 == 0)
    {
        gWeatherPtr->unknown_704 = gWeatherPtr->unknown_708 = 0;
        gWeatherPtr->unknown_712 = 8;
        gWeatherPtr->unknown_714 = 0;
        // Dead code. How does the compiler not optimize this out?
        if (gWeatherPtr->unknown_712 > 0x5F)
            gWeatherPtr->unknown_712 = 0x80 - gWeatherPtr->unknown_712;
        Weather_SetBlendCoeffs(0, 16);
    }
}

void sub_807FF4C(void);

void sub_807FF1C(void)
{
    sub_807FE9C();
    while (gWeatherPtr->weatherGfxLoaded == FALSE)
        sub_807FF4C();
}

void sub_808002C(void);
void sub_8080064(void);
void sub_8080178(void);
void sub_8080238(void);

void sub_807FF4C(void)
{
    sub_8080064();
    sub_808002C();
    if (gWeatherPtr->unknown_712 > 0x5F)
        gWeatherPtr->unknown_712 = 32;
    switch (gWeatherPtr->initStep)
    {
    case 0:
        sub_8080178();
        sub_8080238();
        gWeatherPtr->initStep++;
        break;
    case 1:
        Weather_SetTargetBlendCoeffs(16, 0, 0);
        gWeatherPtr->initStep++;
        break;
    case 2:
        if (!Weather_UpdateBlend())
            break;
        gWeatherPtr->weatherGfxLoaded = TRUE;
        gWeatherPtr->initStep++;
        break;
    }
}

void sub_80800E4(void);

bool8 sub_807FFC8(void)
{
    sub_8080064();
    sub_808002C();
    switch (gWeatherPtr->unknown_6CE)
    {
    case 0:
        Weather_SetTargetBlendCoeffs(0, 16, 0);
        gWeatherPtr->unknown_6CE++;
        break;
    case 1:
        if (!Weather_UpdateBlend())
            break;
        gWeatherPtr->unknown_6CE++;
        break;
    case 2:
        sub_80800E4();
        gWeatherPtr->unknown_6CE++;
        break;
    default:
        return FALSE;
    }
    return TRUE;
}

void sub_808002C(void)
{
    if (gWeatherPtr->unknown_714++ > 4)
    {
        gWeatherPtr->unknown_712++;
        gWeatherPtr->unknown_714 = 0;
    }
}

void sub_8080064(void)
{
    gWeatherPtr->unknown_704 -= gSineTable[gWeatherPtr->unknown_712] * 4;
    gWeatherPtr->unknown_708 -= gSineTable[gWeatherPtr->unknown_712];
    gWeatherPtr->unknown_70E = (gSpriteCoordOffsetX + (gWeatherPtr->unknown_704 >> 8)) & 0xFF;
    gWeatherPtr->unknown_710 = gSpriteCoordOffsetY + (gWeatherPtr->unknown_708 >> 8);
}

void sub_80800E4(void)
{
    u16 i;

    if (gWeatherPtr->unknown_716 != 0)
    {
        for (i = 0; i < 20; i++)
        {
            if (((struct Weather2 *)gWeatherPtr)->unknown_190[i] != NULL)
                DestroySprite(((struct Weather2 *)gWeatherPtr)->unknown_190[i]);
        }
        gWeatherPtr->unknown_716 = 0;
        FreeSpriteTilesByTag(0x1204);
    }

    if (gWeatherPtr->unknown_717 != 0)
    {
        for (i = 0; i < 5; i++)
        {
            if (((struct Weather2 *)gWeatherPtr)->unknown_1E0[i] != NULL)
                DestroySprite(((struct Weather2 *)gWeatherPtr)->unknown_1E0[i]);
        }
        gWeatherPtr->unknown_717 = 0;
    }
}

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

const struct SpriteSheet gWeatherSandstormSpriteSheet = {gWeatherSandstormTiles, sizeof(gWeatherSandstormTiles), 0x1204};

void sub_8080178(void)
{
    u16 i;

    if (gWeatherPtr->unknown_716 == 0)
    {
        LoadSpriteSheet(&gWeatherSandstormSpriteSheet);
        sub_807D8C0(gUnknown_08397128);
        for (i = 0; i < 20; i++)
        {
            u8 spriteId = CreateSpriteAtEnd(&gSpriteTemplate_839AC3C, 0, (i / 5) * 64, 1);

            if (spriteId != MAX_SPRITES)
            {
                ((struct Weather2 *)gWeatherPtr)->unknown_190[i] = &gSprites[spriteId];
                ((struct Weather2 *)gWeatherPtr)->unknown_190[i]->data[0] = i % 5;
                ((struct Weather2 *)gWeatherPtr)->unknown_190[i]->data[1] = i / 5;
            }
            else
            {
                ((struct Weather2 *)gWeatherPtr)->unknown_190[i] = NULL;
            }
        }
        gWeatherPtr->unknown_716 = 1;
    }
}

const u16 gUnknown_0839AC5C[] = {0,	120, 80, 160, 40, 0};

void sub_8080398(struct Sprite *);

void sub_8080238(void)
{
    u16 i;

    if (gWeatherPtr->unknown_717 == 0)
    {
        for (i = 0; i < 5; i++)
        {
            u8 spriteId = CreateSpriteAtEnd(&gSpriteTemplate_839AC3C, i * 48 + 0x18, 0xD0, 1);

            if (spriteId != MAX_SPRITES)
            {
                ((struct Weather2 *)gWeatherPtr)->unknown_1E0[i] = &gSprites[spriteId];
                ((struct Weather2 *)gWeatherPtr)->unknown_1E0[i]->oam.size = 2;
                ((struct Weather2 *)gWeatherPtr)->unknown_1E0[i]->data[1] = i * 51;
                ((struct Weather2 *)gWeatherPtr)->unknown_1E0[i]->data[0] = 8;
                ((struct Weather2 *)gWeatherPtr)->unknown_1E0[i]->data[2] = 0;
                ((struct Weather2 *)gWeatherPtr)->unknown_1E0[i]->data[4] = 0x6730;
                ((struct Weather2 *)gWeatherPtr)->unknown_1E0[i]->data[3] = gUnknown_0839AC5C[i];
                StartSpriteAnim(((struct Weather2 *)gWeatherPtr)->unknown_1E0[i], 1);
                CalcCenterToCornerVec(((struct Weather2 *)gWeatherPtr)->unknown_1E0[i], 0, 2, 0);
                ((struct Weather2 *)gWeatherPtr)->unknown_1E0[i]->callback = sub_8080398;
            }
            else
            {
                ((struct Weather2 *)gWeatherPtr)->unknown_1E0[i] = NULL;
            }
            gWeatherPtr->unknown_717 = 1;
        }
    }
}

void sub_8080338(struct Sprite *sprite)
{
    sprite->pos2.y = gWeatherPtr->unknown_710;
    sprite->pos1.x = gWeatherPtr->unknown_70E + 32 + sprite->data[0] * 64;
    if (sprite->pos1.x > 271)
    {
        sprite->pos1.x = gWeatherPtr->unknown_70E + 0x1E0 - (4 - sprite->data[0]) * 64;
        sprite->pos1.x &= 0x1FF;
    }
}

void sub_80803BC(struct Sprite *);

void sub_8080398(struct Sprite *sprite)
{
    if (--sprite->data[3] == -1)
        sprite->callback = sub_80803BC;
}

void sub_80803BC(struct Sprite *sprite)
{
    u32 x;
    u32 y;

    if (--sprite->pos1.y < -48)
    {
        sprite->pos1.y = 208;
        sprite->data[0] = 4;
    }
    x = sprite->data[0] * gSineTable[sprite->data[1]];
    y = sprite->data[0] * gSineTable[sprite->data[1] + 64];
    sprite->pos2.x = x >> 8;
    sprite->pos2.y = y >> 8;
    sprite->data[1] = (sprite->data[1] + 10) & 0xFF;
    if (++sprite->data[2] > 8)
    {
        sprite->data[2] = 0;
        sprite->data[0]++;
    }
}

void sub_8080430(void)
{
    gWeatherPtr->initStep = 0;
    gWeatherPtr->unknown_6C1 = 3;
    gWeatherPtr->unknown_6C2 = 20;
}

void sub_8080460(void)
{
    sub_8080430();
}

void nullsub_56(void)
{
}

bool8 sub_8080470(void)
{
    return FALSE;
}

const u8 gUnknown_0839AC68[] = {40, 90, 60, 90, 2, 60, 40, 30};

const struct SpriteSheet gWeatherBubbleSpriteSheet = {gWeatherBubbleTiles, sizeof(gWeatherBubbleTiles), 0x1205};

void sub_8080474(void)
{
    Fog2_InitVars();
    if (gWeatherPtr->unknown_72E == 0)
    {
        LoadSpriteSheet(&gWeatherBubbleSpriteSheet);
        gWeatherPtr->unknown_728 = 0;
        gWeatherPtr->unknown_726 = gUnknown_0839AC68[0];
        gWeatherPtr->unknown_72A = 0;
        gWeatherPtr->unknown_72C = 0;
    }
}

void sub_80804F8(void);

void sub_80804C8(void)
{
    sub_8080474();
    while (gWeatherPtr->weatherGfxLoaded == FALSE)
        sub_80804F8();
}

void sub_8080588(u16);

void sub_80804F8(void)
{
    Fog2_Main();
    if (++gWeatherPtr->unknown_726 > gUnknown_0839AC68[gWeatherPtr->unknown_728])
    {
        gWeatherPtr->unknown_726 = 0;
        if (++gWeatherPtr->unknown_728 > 7)
            gWeatherPtr->unknown_728 = 0;
        sub_8080588(gWeatherPtr->unknown_72A);
        if (++gWeatherPtr->unknown_72A > 12)
            gWeatherPtr->unknown_72A = 0;
    }
}

void sub_8080610(void);

bool8 sub_808056C(void)
{
    if (!Fog2_Finish())
    {
        sub_8080610();
        return FALSE;
    }
    return TRUE;
}

const s16 gUnknown_0839AC78[][2] =
{
    {120, 160},
    {376, 160},
    { 40, 140},
    {296, 140},
    {180, 130},
    {436, 130},
    { 60, 160},
    {436, 160},
    {220, 180},
    {476, 180},
    { 10,  90},
    {266,  90},
    {256, 160},
};

const union AnimCmd gSpriteAnim_839ACAC[] =
{
    ANIMCMD_FRAME(0, 16),
    ANIMCMD_FRAME(1, 16),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_839ACB8[] =
{
    gSpriteAnim_839ACAC,
};

extern const struct OamData gOamData_837DF24;

void unc_0807DAB4(struct Sprite *);
const struct SpriteTemplate gSpriteTemplate_839ACBC =
{
    .tileTag = 4613,
    .paletteTag = 4608,
    .oam = &gOamData_837DF24,
    .anims = gSpriteAnimTable_839ACB8,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = unc_0807DAB4,
};

void sub_8080588(u16 a)
{
    s16 x = gUnknown_0839AC78[a][0];
    s16 y = gUnknown_0839AC78[a][1] - gSpriteCoordOffsetY;
    u8 spriteId = CreateSpriteAtEnd(
      &gSpriteTemplate_839ACBC,
      x,
      y,
      0);

    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].oam.priority = 1;
        gSprites[spriteId].coordOffsetEnabled = TRUE;
        gSprites[spriteId].data[0] = 0;
        gSprites[spriteId].data[1] = 0;
        gSprites[spriteId].data[2] = 0;
        gWeatherPtr->unknown_72C++;
    }
}

void sub_8080610(void)
{
    u16 i;

    for (i = 0; i < 64; i++)
    {
        if (gSprites[i].template == &gSpriteTemplate_839ACBC)
            DestroySprite(&gSprites[i]);
    }
    FreeSpriteTilesByTag(0x1205);
}

void unc_0807DAB4(struct Sprite *sprite)
{
    ++sprite->data[0];
    if (++sprite->data[0] > 8)  // double increment
    {
        sprite->data[0] = 0;
        if (sprite->data[1] == 0)
        {
            if (++sprite->pos2.x > 4)
                sprite->data[1] = 1;
        }
        else
        {
            if (--sprite->pos2.x <= 0)
                sprite->data[1] = 0;
        }
    }
    sprite->pos1.y -= 3;
    if (++sprite->data[2] > 0x77)
        DestroySprite(sprite);
}

u8 TranslateWeatherNum(u8);
void UpdateRainCounter(u8, u8);

void SetSav1Weather(u32 weather)
{
    u8 oldWeather = gSaveBlock1.weather;

    gSaveBlock1.weather = TranslateWeatherNum(weather);
    UpdateRainCounter(gSaveBlock1.weather, oldWeather);
}

u8 GetSav1Weather(void)
{
    return gSaveBlock1.weather;
}

void SetSav1WeatherFromCurrMapHeader(void)
{
    u8 oldWeather = gSaveBlock1.weather;

    gSaveBlock1.weather = TranslateWeatherNum(gMapHeader.weather);
    UpdateRainCounter(gSaveBlock1.weather, oldWeather);
}

void SetWeather(u32 weather)
{
    SetSav1Weather(weather);
    DoWeatherEffect(GetSav1Weather());
}

void SetWeather_Unused(u32 weather)
{
    SetSav1Weather(weather);
    sub_807C988(GetSav1Weather());
}

void DoCurrentWeather(void)
{
    DoWeatherEffect(GetSav1Weather());
}

void sub_8080750(void)
{
    sub_807C988(GetSav1Weather());
}

static const u8 sWeatherCycle1[] = {2, 3, 5, 3};
static const u8 sWeatherCycle2[] = {2, 2, 3, 2};

u8 TranslateWeatherNum(u8 weather)
{
    switch (weather)
    {
    case 0:  return 0;
    case 1:  return 1;
    case 2:  return 2;
    case 3:  return 3;
    case 4:  return 4;
    case 5:  return 5;
    case 6:  return 6;
    case 7:  return 7;
    case 8:  return 8;
    case 9:  return 9;
    case 10: return 10;
    case 11: return 11;
    case 12: return 12;
    case 13: return 13;
    case 14: return 14;
    case 20: return sWeatherCycle1[gSaveBlock1.filler_2F];
    case 21: return sWeatherCycle2[gSaveBlock1.filler_2F];
    default: return 0;
    }
}

void UpdateWeatherPerDay(u16 increment)
{
    u16 weatherStage = gSaveBlock1.filler_2F + increment;
    weatherStage %= 4;
    gSaveBlock1.filler_2F = weatherStage;
}

void UpdateRainCounter(u8 newWeather, u8 oldWeather)
{
    if (newWeather != oldWeather
     && (newWeather == WEATHER_RAIN_LIGHT || newWeather == WEATHER_RAIN_MED))
        IncrementGameStat(0x28);
}
