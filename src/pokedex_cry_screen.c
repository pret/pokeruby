#include "global.h"
#include "m4a.h"
#include "main.h"
#include "pokedex_cry_screen.h"
#include "palette.h"
#include "sprite.h"
#include "ewram.h"
#include "trig.h"
#include "sound.h"

extern struct SoundInfo gSoundInfo;
extern struct MusicPlayerInfo gMPlayInfo_BGM;

struct PokedexCryMeterNeedle {
    s8 rotation;
    s8 targetRotation;
    u8 moveIncrement;
    u16 spriteId;
};

struct PokedexCryScreen
{
    u8 cryWaveformBuffer[0x10];
    u8 cryState;
    u8 playhead;
    u8 waveformPreviousY;
    u16 charBase;
    u8 playStartPos;
    u16 species;
    u8 cryOverrideCountdown;
    u8 cryRepeatDelay;
};

void PlayCryScreenCry(u16 species);
void BufferCryWaveformSegment(void);
void DrawWaveformFlatline(void);
void AdvancePlayhead(u8 bgId);
void DrawWaveformSegment(u8 position, u8 amplitude);
void DrawWaveformWindow(void);
void ShiftWaveformOver(u8 bgId, s16 pos, u8 axis);
void SpriteCB_CryMeterNeedle(struct Sprite *);
void SetCryMeterNeedleTarget(s8);

u8 gDexCryScreenState;

// data/pokedex_cry_screen.o

const u16 CryMeterNeedlePalette[] = INCBIN_U16("graphics/pokedex/cry_meter_needle.gbapal");
const u8 CryMeterNeedleTiles[] = INCBIN_U8("graphics/pokedex/cry_meter_needle.4bpp");

#if ENGLISH
const u16 sCryMeter_Tilemap[] = INCBIN_U16("graphics/pokedex/cry_meter_map.bin");
const u16 sCryMeter_Pal[] = INCBIN_U16("graphics/pokedex/cry_meter.gbapal");
const u8 sCryMeter_Gfx[] = INCBIN_U8("graphics/pokedex/cry_meter.4bpp.lz");
#else
extern const u16 sCryMeter_Tilemap[];
extern const u16 sCryMeter_Pal[];
extern const u8 sCryMeter_Gfx[];
#endif // ENGLISH

const u16 sWaveformOffsets[][72] = {
    {
        0x0000, 0x0004, 0x0008, 0x000C, 0x0010, 0x0014, 0x0018, 0x001C,
        0x0400, 0x0404, 0x0408, 0x040C, 0x0410, 0x0414, 0x0418, 0x041C,
        0x0800, 0x0804, 0x0808, 0x080C, 0x0810, 0x0814, 0x0818, 0x081C,
        0x0C00, 0x0C04, 0x0C08, 0x0C0C, 0x0C10, 0x0C14, 0x0C18, 0x0C1C,
        0x1000, 0x1004, 0x1008, 0x100C, 0x1010, 0x1014, 0x1018, 0x101C,
        0x1400, 0x1404, 0x1408, 0x140C, 0x1410, 0x1414, 0x1418, 0x141C,
        0x1800, 0x1804, 0x1808, 0x180C, 0x1810, 0x1814, 0x1818, 0x181C,
        0x1C00, 0x1C04, 0x1C08, 0x1C0C, 0x1C10, 0x1C14, 0x1C18, 0x1C1C,
        0x2000, 0x2004, 0x2008, 0x200C, 0x2010, 0x2014, 0x2018, 0x201C
    }, {
        0x0000, 0x0004, 0x0008, 0x000C, 0x0010, 0x0014, 0x0018, 0x001C,
        0x0400, 0x0404, 0x0408, 0x040C, 0x0410, 0x0414, 0x0418, 0x041C,
        0x0800, 0x0804, 0x0808, 0x080C, 0x0810, 0x0814, 0x0818, 0x081C,
        0x0C00, 0x0C04, 0x0C08, 0x0C0C, 0x0C10, 0x0C14, 0x0C18, 0x0C1C,
        0x1000, 0x1004, 0x1008, 0x100C, 0x1010, 0x1014, 0x1018, 0x101C,
        0x1400, 0x1404, 0x1408, 0x140C, 0x1410, 0x1414, 0x1418, 0x141C,
        0x1800, 0x1804, 0x1808, 0x180C, 0x1810, 0x1814, 0x1818, 0x181C,
        0x1C00, 0x1C04, 0x1C08, 0x1C0C, 0x1C10, 0x1C14, 0x1C18, 0x1C1C,
        0x2000, 0x2004, 0x2008, 0x200C, 0x2010, 0x2014, 0x2018, 0x201C
    }, {
        0x0001, 0x0005, 0x0009, 0x000D, 0x0011, 0x0015, 0x0019, 0x001D,
        0x0401, 0x0405, 0x0409, 0x040D, 0x0411, 0x0415, 0x0419, 0x041D,
        0x0801, 0x0805, 0x0809, 0x080D, 0x0811, 0x0815, 0x0819, 0x081D,
        0x0C01, 0x0C05, 0x0C09, 0x0C0D, 0x0C11, 0x0C15, 0x0C19, 0x0C1D,
        0x1001, 0x1005, 0x1009, 0x100D, 0x1011, 0x1015, 0x1019, 0x101D,
        0x1401, 0x1405, 0x1409, 0x140D, 0x1411, 0x1415, 0x1419, 0x141D,
        0x1801, 0x1805, 0x1809, 0x180D, 0x1811, 0x1815, 0x1819, 0x181D,
        0x1C01, 0x1C05, 0x1C09, 0x1C0D, 0x1C11, 0x1C15, 0x1C19, 0x1C1D,
        0x2001, 0x2005, 0x2009, 0x200D, 0x2011, 0x2015, 0x2019, 0x201D
    }, {
        0x0001, 0x0005, 0x0009, 0x000D, 0x0011, 0x0015, 0x0019, 0x001D,
        0x0401, 0x0405, 0x0409, 0x040D, 0x0411, 0x0415, 0x0419, 0x041D,
        0x0801, 0x0805, 0x0809, 0x080D, 0x0811, 0x0815, 0x0819, 0x081D,
        0x0C01, 0x0C05, 0x0C09, 0x0C0D, 0x0C11, 0x0C15, 0x0C19, 0x0C1D,
        0x1001, 0x1005, 0x1009, 0x100D, 0x1011, 0x1015, 0x1019, 0x101D,
        0x1401, 0x1405, 0x1409, 0x140D, 0x1411, 0x1415, 0x1419, 0x141D,
        0x1801, 0x1805, 0x1809, 0x180D, 0x1811, 0x1815, 0x1819, 0x181D,
        0x1C01, 0x1C05, 0x1C09, 0x1C0D, 0x1C11, 0x1C15, 0x1C19, 0x1C1D,
        0x2001, 0x2005, 0x2009, 0x200D, 0x2011, 0x2015, 0x2019, 0x201D
    }, {
        0x0002, 0x0006, 0x000A, 0x000E, 0x0012, 0x0016, 0x001A, 0x001E,
        0x0402, 0x0406, 0x040A, 0x040E, 0x0412, 0x0416, 0x041A, 0x041E,
        0x0802, 0x0806, 0x080A, 0x080E, 0x0812, 0x0816, 0x081A, 0x081E,
        0x0C02, 0x0C06, 0x0C0A, 0x0C0E, 0x0C12, 0x0C16, 0x0C1A, 0x0C1E,
        0x1002, 0x1006, 0x100A, 0x100E, 0x1012, 0x1016, 0x101A, 0x101E,
        0x1402, 0x1406, 0x140A, 0x140E, 0x1412, 0x1416, 0x141A, 0x141E,
        0x1802, 0x1806, 0x180A, 0x180E, 0x1812, 0x1816, 0x181A, 0x181E,
        0x1C02, 0x1C06, 0x1C0A, 0x1C0E, 0x1C12, 0x1C16, 0x1C1A, 0x1C1E,
        0x2002, 0x2006, 0x200A, 0x200E, 0x2012, 0x2016, 0x201A, 0x201E
    }, {
        0x0002, 0x0006, 0x000A, 0x000E, 0x0012, 0x0016, 0x001A, 0x001E,
        0x0402, 0x0406, 0x040A, 0x040E, 0x0412, 0x0416, 0x041A, 0x041E,
        0x0802, 0x0806, 0x080A, 0x080E, 0x0812, 0x0816, 0x081A, 0x081E,
        0x0C02, 0x0C06, 0x0C0A, 0x0C0E, 0x0C12, 0x0C16, 0x0C1A, 0x0C1E,
        0x1002, 0x1006, 0x100A, 0x100E, 0x1012, 0x1016, 0x101A, 0x101E,
        0x1402, 0x1406, 0x140A, 0x140E, 0x1412, 0x1416, 0x141A, 0x141E,
        0x1802, 0x1806, 0x180A, 0x180E, 0x1812, 0x1816, 0x181A, 0x181E,
        0x1C02, 0x1C06, 0x1C0A, 0x1C0E, 0x1C12, 0x1C16, 0x1C1A, 0x1C1E,
        0x2002, 0x2006, 0x200A, 0x200E, 0x2012, 0x2016, 0x201A, 0x201E
    }, {
        0x0003, 0x0007, 0x000B, 0x000F, 0x0013, 0x0017, 0x001B, 0x001F,
        0x0403, 0x0407, 0x040B, 0x040F, 0x0413, 0x0417, 0x041B, 0x041F,
        0x0803, 0x0807, 0x080B, 0x080F, 0x0813, 0x0817, 0x081B, 0x081F,
        0x0C03, 0x0C07, 0x0C0B, 0x0C0F, 0x0C13, 0x0C17, 0x0C1B, 0x0C1F,
        0x1003, 0x1007, 0x100B, 0x100F, 0x1013, 0x1017, 0x101B, 0x101F,
        0x1403, 0x1407, 0x140B, 0x140F, 0x1413, 0x1417, 0x141B, 0x141F,
        0x1803, 0x1807, 0x180B, 0x180F, 0x1813, 0x1817, 0x181B, 0x181F,
        0x1C03, 0x1C07, 0x1C0B, 0x1C0F, 0x1C13, 0x1C17, 0x1C1B, 0x1C1F,
        0x2003, 0x2007, 0x200B, 0x200F, 0x2013, 0x2017, 0x201B, 0x201F
    }, {
        0x0003, 0x0007, 0x000B, 0x000F, 0x0013, 0x0017, 0x001B, 0x001F,
        0x0403, 0x0407, 0x040B, 0x040F, 0x0413, 0x0417, 0x041B, 0x041F,
        0x0803, 0x0807, 0x080B, 0x080F, 0x0813, 0x0817, 0x081B, 0x081F,
        0x0C03, 0x0C07, 0x0C0B, 0x0C0F, 0x0C13, 0x0C17, 0x0C1B, 0x0C1F,
        0x1003, 0x1007, 0x100B, 0x100F, 0x1013, 0x1017, 0x101B, 0x101F,
        0x1403, 0x1407, 0x140B, 0x140F, 0x1413, 0x1417, 0x141B, 0x141F,
        0x1803, 0x1807, 0x180B, 0x180F, 0x1813, 0x1817, 0x181B, 0x181F,
        0x1C03, 0x1C07, 0x1C0B, 0x1C0F, 0x1C13, 0x1C17, 0x1C1B, 0x1C1F,
        0x2003, 0x2007, 0x200B, 0x200F, 0x2013, 0x2017, 0x201B, 0x201F
    }
};

struct PokedexCryScreen * const gPokedexCryScreenPtr = &ePokedexCryScreen;

const u16 sCryScreenBg_Pal[] = INCBIN_U16("graphics/pokedex/83FB6F8.gbapal");
const u16 sCryScreenBg_Gfx[] = INCBIN_U16("graphics/pokedex/83FB718.4bpp");

const u8 sWaveformTileDataNybbleMasks[] = {0xF0, 0x0F};

// Waveform is blue in the middle (8) grading to white at peaks (15)
// Split into two arrays for the two vertical slice halves
const u8 sWaveformColor[][16] = {
    {
        0x0F, 0x0E, 0x0D, 0x0C, 0x0B, 0x0A, 0x09, 0x08,
        0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F
    }, {
        0xF0, 0xE0, 0xD0, 0xC0, 0xB0, 0xA0, 0x90, 0x80,
        0x80, 0x90, 0xA0, 0xB0, 0xC0, 0xD0, 0xE0, 0xF0
    }
};

struct PokedexCryMeterNeedle * const gPokedexCryScreenPtr2 = &ePokedexCryScreen2;

union AnimCmd sAnim_CryMeterNeedle_0[] = {
    ANIMCMD_FRAME(0, 30),
    ANIMCMD_END
};

const union AnimCmd *sAnimTable_CryMeterNeedle[] = { sAnim_CryMeterNeedle_0 };

struct OamData sOamData_CryMeterNeedle = {
    .y = 160,
    .affineMode = ST_OAM_AFFINE_NORMAL,
    .size = 3,
    .priority = 1
};

struct SpriteTemplate sSpriteTemplate_CryMeterNeedle = {
    0x2000,
    0x2000,
    &sOamData_CryMeterNeedle,
    sAnimTable_CryMeterNeedle,
    NULL,
    gDummySpriteAffineAnimTable,
    SpriteCB_CryMeterNeedle
};

struct SpriteSheet gCryMeterNeedleSpriteSheets[] = {
    {CryMeterNeedleTiles, 0x800, 0x2000},
    {}
};

struct SpritePalette gCryMeterNeedleSpritePalettes[] = {
    {CryMeterNeedlePalette, 0x2000},
    {}
};

#if ENGLISH
#define CRY_METER_MAP_WIDTH 10
#elif GERMAN
#define CRY_METER_MAP_WIDTH 32
#endif

bool8 LoadCryWaveformWindow(struct CryScreenWindow *cry, u8 bgId)
{
    u8 i;
    u8 j;
    u8 position;
    u16 tileNum;
    u16 screenBase;
    bool8 finished = FALSE;

    switch (gDexCryScreenState)
    {
    case 0:
        gPokedexCryScreenPtr->charBase = cry->charBase;
        gPokedexCryScreenPtr->playStartPos = cry->yPos;
        gPokedexCryScreenPtr->cryOverrideCountdown = 0;
        gPokedexCryScreenPtr->cryRepeatDelay = 0;
        gPokedexCryScreenPtr->cryState = 0;
        gPokedexCryScreenPtr->waveformPreviousY = 28;
        gPokedexCryScreenPtr->playhead = 0;
        ShiftWaveformOver(bgId, -8 * cry->xPos, 1);
        for (i = 0; i < 7; i++)
        {
            for (j = 0; j < 32; j++)
            {
                DmaCopy16(3, sCryScreenBg_Gfx, &sCryWaveformWindowTiledata[((32 * i) + j) * 32], 32);
            }
        }
        gDexCryScreenState++;
        break;
    case 1:
        screenBase = cry->screenBase * 0x800;
        tileNum = (cry->paletteNo << 12) + ((cry->charBase >> 5) & 0x1FF);
        for (i = 0; i < 7; i++)
        {
            for (j = 0; j < 32; j++)
            {
                *((u16 *)(VRAM + (2 * j) + (64 * i) + screenBase)) = tileNum++;
            }
        }
        for (position = 0; position < gPokedexCryScreenPtr->playStartPos * 8; position++)
        {
            DrawWaveformSegment(position, 0);
        }
        gDexCryScreenState++;
        break;
    case 2:
        DrawWaveformWindow();
        LoadPalette(sCryScreenBg_Pal, cry->paletteNo * 16, 32);
        finished = TRUE;
        break;
    }
    return finished;
}

void UpdateCryWaveformWindow(u8 bgId)
{
    u8 r4;
    DrawWaveformWindow();
    AdvancePlayhead(bgId);
    if (gPokedexCryScreenPtr->cryRepeatDelay)
        gPokedexCryScreenPtr->cryRepeatDelay--;
    if (gPokedexCryScreenPtr->cryOverrideCountdown && !--gPokedexCryScreenPtr->cryOverrideCountdown)
    {
        PlayCryScreenCry(gPokedexCryScreenPtr->species);
        DrawWaveformFlatline();
        return;
    }
    if (gPokedexCryScreenPtr->cryState == 0)
    {
        DrawWaveformFlatline();
        return;
    }
    if (gPokedexCryScreenPtr->cryState == 1)
    {
        BufferCryWaveformSegment();
    }
    else if (gPokedexCryScreenPtr->cryState > 8)
    {
        if (!IsCryPlaying())
        {
            DrawWaveformFlatline();
            gPokedexCryScreenPtr->cryState = 0;
            return;
        }
        BufferCryWaveformSegment();
        gPokedexCryScreenPtr->cryState = 1;
    }
    r4 = 2 * (gPokedexCryScreenPtr->cryState - 1);
    DrawWaveformSegment(gPokedexCryScreenPtr->playStartPos * 8 + gPokedexCryScreenPtr->playhead - 2,
        gPokedexCryScreenPtr->cryWaveformBuffer[r4]);
    DrawWaveformSegment(gPokedexCryScreenPtr->playStartPos * 8 + gPokedexCryScreenPtr->playhead - 1,
        gPokedexCryScreenPtr->cryWaveformBuffer[r4 + 1]);
    gPokedexCryScreenPtr->cryState++;
}

void CryScreenPlayButton(u16 species)
{
    if (gMPlayInfo_BGM.status & MUSICPLAYER_STATUS_PAUSE && !gPokedexCryScreenPtr->cryOverrideCountdown)
    {
        if (!gPokedexCryScreenPtr->cryRepeatDelay)
        {
            gPokedexCryScreenPtr->cryRepeatDelay = 4;
            if (IsCryPlaying() == TRUE)
            {
                StopCry();
                gPokedexCryScreenPtr->species = species;
                gPokedexCryScreenPtr->cryOverrideCountdown = 2;
            }
            else
                PlayCryScreenCry(species);
        }
    }
}

void PlayCryScreenCry(u16 species)
{
    PlayCry2(species, 0, 125, 10);
    gPokedexCryScreenPtr->cryState = 1;
}

#define GetSrcBufferForCryWaveformSegment(counter) ({ \
    const s8 * p;                     \
    if ((counter) < 2)                \
        p = gSoundInfo.pcmBuffer;     \
    else                              \
        p = gSoundInfo.pcmBuffer + (gSoundInfo.pcmDmaPeriod + 1 - gPcmDmaCounter) * gSoundInfo.pcmSamplesPerVBlank; \
    p + PCM_DMA_BUF_SIZE;             \
})

void BufferCryWaveformSegment(void)
{
    const s8 * src;
    u8 i;

    src = GetSrcBufferForCryWaveformSegment(gPcmDmaCounter);
    for (i = 0; i < 16; i++)
        gPokedexCryScreenPtr->cryWaveformBuffer[i] = src[i * 2] * 2;

}

void DrawWaveformFlatline(void)
{
    DrawWaveformSegment(gPokedexCryScreenPtr->playStartPos * 8 + gPokedexCryScreenPtr->playhead - 2, 0);
    DrawWaveformSegment(gPokedexCryScreenPtr->playStartPos * 8 + gPokedexCryScreenPtr->playhead - 1, 0);
}

void AdvancePlayhead(u8 bgId)
{
    u8 i;
    u16 offset;

    ShiftWaveformOver(bgId, gPokedexCryScreenPtr->playhead, 0);
    gPokedexCryScreenPtr->playhead += 2;
    offset = (gPokedexCryScreenPtr->playhead / 8 + gPokedexCryScreenPtr->playStartPos + 1) % 32;
    for (i = 0; i < 7; i++)
    {
        DmaCopy16(3, sCryScreenBg_Gfx, &sCryWaveformWindowTiledata[32 * (32 * i + offset)], 32);
    }
}

void DrawWaveformSegment(u8 position, u8 amplitude)
{
#define PLAY_START_POS            (position >> 3)
#define PLAYHEAD_POS              (position & ((1 << 3) - 1))
#define VERT_SLICE                (position & 1)
    u8 currentPointY;
    u8 nybble;
    u16 offset;
    u16 temp;
    u8 y;

    temp = (amplitude + 127) * 256;
    y = temp / 1152.0;
    if (y > 71 - 16)
        y = 71 - 16;
    currentPointY = y;
    nybble = VERT_SLICE;
    if (y > gPokedexCryScreenPtr->waveformPreviousY)
    {
        do
        {
            offset = sWaveformOffsets[PLAYHEAD_POS][y] + PLAY_START_POS * TILE_SIZE_4BPP;
            sCryWaveformWindowTiledata[offset] &= sWaveformTileDataNybbleMasks[nybble];
            sCryWaveformWindowTiledata[offset] |= sWaveformColor[nybble][((y / 3) - 1) & 0x0F];
            y--;
        } while (y > gPokedexCryScreenPtr->waveformPreviousY);
    }
    else
    {
        do
        {
            offset = sWaveformOffsets[PLAYHEAD_POS][y] + PLAY_START_POS * TILE_SIZE_4BPP;
            sCryWaveformWindowTiledata[offset] &= sWaveformTileDataNybbleMasks[nybble];
            sCryWaveformWindowTiledata[offset] |= sWaveformColor[nybble][((y / 3) - 1) & 0x0F];
            y++;
        } while (y < gPokedexCryScreenPtr->waveformPreviousY);
    }
    gPokedexCryScreenPtr->waveformPreviousY = currentPointY;
    #undef PLAYHEAD_POS
    #undef PLAY_START_POS
    #undef VERT_SLICE
}

void DrawWaveformWindow(void)
{
    DmaCopy16(3, sCryWaveformWindowTiledata, VRAM + gPokedexCryScreenPtr->charBase, 0x1c00);
}

void ShiftWaveformOver(u8 bgId, s16 pos, u8 axis)
{
    switch (bgId)
    {
        case 0:
            if (axis)
                REG_BG0VOFS = pos;
            else
                REG_BG0HOFS = pos;
            break;
        case 1:
            if (axis)
                REG_BG1VOFS = pos;
            else
                REG_BG1HOFS = pos;
            break;
        case 2:
            if (axis)
                REG_BG2VOFS = pos;
            else
                REG_BG2HOFS = pos;
            break;
        case 3:
            if (axis)
                REG_BG3VOFS = pos;
            else
                REG_BG3HOFS = pos;
            break;
    }
}

bool8 ShowPokedexCryScreen(struct CryScreenWindow *cry, UNUSED u8 arg1) {
    int returnVal = FALSE;

    switch (gDexCryScreenState)
    {
    case 0:
        LZ77UnCompVram(sCryMeter_Gfx, (void *) (VRAM + cry->charBase));
        LoadPalette(sCryMeter_Pal, cry->paletteNo * 16, 0x20);
        gDexCryScreenState++;
        break;

    case 1:
    {
        void *vram;
        u8 row, col;
        u32 r12;
        int x, y;

        vram = BG_SCREEN_ADDR(cry->screenBase);

        r12 = (cry->charBase >> 5) & 0x1FF;

        for (row = 0; row < 8; row++)
        {
            for (col = 0; col < 10; col++)
            {
                y = row + cry->yPos;
                x = col + cry->xPos;
                *(u16 *) (vram + (y * 64 + x * 2)) = (sCryMeter_Tilemap[row * CRY_METER_MAP_WIDTH + col] | (cry->paletteNo << 12)) + r12;
            }
        }

        gDexCryScreenState += 1;
        break;
    }

    case 2:
    {
        LoadSpriteSheets(gCryMeterNeedleSpriteSheets);
        LoadSpritePalettes(gCryMeterNeedleSpritePalettes);
        gPokedexCryScreenPtr2->spriteId = CreateSprite(&sSpriteTemplate_CryMeterNeedle, 40 + cry->xPos * 8, 56 + cry->yPos * 8, 1);
        gPokedexCryScreenPtr2->rotation = 0x20;
        gPokedexCryScreenPtr2->targetRotation = 0x20;
        gPokedexCryScreenPtr2->moveIncrement = 0;

        returnVal = TRUE;
        break;
    }
    }

    return returnVal;
}

void DestroyCryMeterNeedleSprite(void)
{
    FreeSpritePaletteByTag(GetSpritePaletteTagByPaletteNum(gSprites[gPokedexCryScreenPtr2->spriteId].oam.paletteNum));
    DestroySprite(gSprites + gPokedexCryScreenPtr2->spriteId);
}

void SpriteCB_CryMeterNeedle(struct Sprite * sprite)
{
    u16 i;
    s8 peakAmplitude;
    s16 x;
    s16 y;
    struct ObjAffineSrcData affine;
    struct OamMatrix matrix;
    u8 * r0;

    gSprites[gPokedexCryScreenPtr2->spriteId].oam.affineMode = ST_OAM_AFFINE_NORMAL;
    gSprites[gPokedexCryScreenPtr2->spriteId].oam.affineParam = 0;
    switch (gPokedexCryScreenPtr->cryState)
    {
        case 0:
            gPokedexCryScreenPtr2->targetRotation = 0x20;
            if (gPokedexCryScreenPtr2->rotation > 0)
            {
                if (gPokedexCryScreenPtr2->moveIncrement != 1)
                    gPokedexCryScreenPtr2->moveIncrement--;
            }
            else
                gPokedexCryScreenPtr2->moveIncrement = 5;
            break;
        case 2:
            peakAmplitude = 0;
            for (i = 0; i < 16; i++)
            {
                if (peakAmplitude < gPokedexCryScreenPtr->cryWaveformBuffer[i])
                    peakAmplitude = gPokedexCryScreenPtr->cryWaveformBuffer[i];
            }
            SetCryMeterNeedleTarget(peakAmplitude * 0xd0 / 0x100);
            break;
        case 6:
            r0 = &gPokedexCryScreenPtr->cryWaveformBuffer[10];
            SetCryMeterNeedleTarget(*r0 * 0xd0 / 0x100);
            break;
    }
    if (gPokedexCryScreenPtr2->rotation == gPokedexCryScreenPtr2->targetRotation)
        ; // Empty, needle has reached target
    else if (gPokedexCryScreenPtr2->rotation < gPokedexCryScreenPtr2->targetRotation)
    {
        // Rotate needle left
        if ((gPokedexCryScreenPtr2->rotation += gPokedexCryScreenPtr2->moveIncrement) > gPokedexCryScreenPtr2->targetRotation)
        {
            gPokedexCryScreenPtr2->rotation = gPokedexCryScreenPtr2->targetRotation;
            gPokedexCryScreenPtr2->targetRotation = 0;
        }
    }
    else
    {
        // Rotate needle right
        if ((gPokedexCryScreenPtr2->rotation -= gPokedexCryScreenPtr2->moveIncrement) < gPokedexCryScreenPtr2->targetRotation)
        {
            gPokedexCryScreenPtr2->rotation = gPokedexCryScreenPtr2->targetRotation;
            gPokedexCryScreenPtr2->targetRotation = 0;
        }
    }
    affine.xScale = 0x100;
    affine.yScale = 0x100;
    affine.rotation = gPokedexCryScreenPtr2->rotation * 256;
    ObjAffineSet(&affine, &matrix, 1, 2);
    SetOamMatrix(0, matrix.a, matrix.b, matrix.c, matrix.d);
    x = gSineTable[((gPokedexCryScreenPtr2->rotation + 0x7F) & 0xFF)];
    y = gSineTable[((gPokedexCryScreenPtr2->rotation + 0x7F) & 0xFF) + 0x40];
    sprite->x2 = x * 24 / 256;
    sprite->y2 = y * 24 / 256;
}

void SetCryMeterNeedleTarget(s8 offset)
{
    u16 rotation = (0x20 - offset) & 0xff;
    if (rotation > 0x20 && rotation < 0xe0)
        rotation = 0xe0;
    gPokedexCryScreenPtr2->targetRotation = rotation;
    gPokedexCryScreenPtr2->moveIncrement = 5;
}
