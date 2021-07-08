#include "global.h"
#include "image_processing_effects.h"
#include "contest_painting.h"

#define GET_R(color) ((color) & 0x1F)
#define GET_G(color) (((color) >> 5) & 0x1F)
#define GET_B(color) (((color) >> 10) & 0x1F)

#define RGB_ALPHA       (1 << 15)
#define IS_ALPHA(color) ((color) & RGB_ALPHA)

#define RGB2(r, g, b) (((b) << 10) | ((g) << 5) | (r))

u16 *gCanvasPixels;
u8 gCanvasColumnStart;
u8 gCanvasRowEnd;
u8 gCanvasRowStart;
u8 gCanvasColumnEnd;
u8 gCanvasHeight;
u8 gCanvasMonPersonality;
u8 gCanvasWidth;
u16 * gCanvasPalette;
u16 gCanvasPaletteStart;

// this file's functions
void ApplyImageEffect_Pointillism(void);
void ApplyImageEffect_Blur(void);
void ApplyImageEffect_BlackOutline(void);
void ApplyImageEffect_Invert(void);
void ApplyImageEffect_BlackAndWhite(void);
void ApplyImageEffect_BlurRight(void);
void ApplyImageEffect_BlurDown(void);
void ApplyImageEffect_Shimmer(void);
void ApplyImageEffect_Grayscale(void);
void ApplyImageEffect_PersonalityColor(u8 personality);
void ApplyImageEffect_RedChannelGrayscale(u8);
void ApplyImageEffect_RedChannelGrayscaleHighlight(u8);
void AddPointillismPoints(u16);
u16 ConvertColorToGrayscale(u16*);
u16 QuantizePixel_Blur(u16 *prevPixel, u16 *curPixel, u16 *nextPixel);
u16 ConvertCoolColor(u16*, u8);
u16 QuantizePixel_BlackAndWhite(u16*);
u16 QuantizePixel_BlackOutline(u16 *colorA, u16 *colorB);
u16 QuantizePixel_Invert(u16*);
u16 QuantizePixel_BlurHard(u16 *prevPixel, u16 *curPixel, u16 *nextPixel);
u16 QuantizePixel_MotionBlur(u16*, u16*);
u16 GetCoolColorFromPersonality(u8);
void QuantizePalette_Standard(bool8);
void SetPresetPalette_PrimaryColors(void);
void QuantizePalette_PrimaryColors(void);
void SetPresetPalette_Grayscale(void);
void QuantizePalette_Grayscale(void);
void SetPresetPalette_GrayscaleSmall(void);
void QuantizePalette_GrayscaleSmall(void);
void SetPresetPalette_BlackAndWhite(void);
void QuantizePalette_BlackAndWhite(void);
u16 QuantizePixel_Standard(u16 *);
u16 QuantizePixel_GrayscaleSmall(u16 *);
u16 QuantizePixel_Grayscale(u16 *);
u16 QuantizePixel_PrimaryColors(u16 *);

#define MAX_DIMENSION 64

#include "data/pointillism_points.h"

void ApplyImageProcessingEffects(struct ImageProcessingContext* info)
{
    gCanvasPixels = info->canvasPixels;
    gCanvasMonPersonality = info->personality;
    gCanvasColumnStart = info->columnStart;
    gCanvasRowStart = info->rowStart;
    gCanvasColumnEnd = info->columnEnd;
    gCanvasRowEnd = info->rowEnd;
    gCanvasWidth = info->canvasWidth;
    gCanvasHeight = info->canvasHeight;
    switch (info->effect)
    {
    case IMAGE_EFFECT_POINTILLISM:
        ApplyImageEffect_Pointillism();
        break;
    case IMAGE_EFFECT_BLUR:
        ApplyImageEffect_Blur();
        break;
    case IMAGE_EFFECT_OUTLINE_COLORED:
        ApplyImageEffect_BlackOutline();
        ApplyImageEffect_PersonalityColor(gCanvasMonPersonality);
        break;
    case IMAGE_EFFECT_INVERT_BLACK_WHITE:
        ApplyImageEffect_BlackOutline();
        ApplyImageEffect_Invert();
        ApplyImageEffect_BlackAndWhite();
    case IMAGE_EFFECT_INVERT:
        ApplyImageEffect_Invert();
        break;
    case IMAGE_EFFECT_THICK_BLACK_WHITE:
        ApplyImageEffect_BlackOutline();
        ApplyImageEffect_BlurRight();
        ApplyImageEffect_BlurRight();
        ApplyImageEffect_BlurDown();
        ApplyImageEffect_BlackAndWhite();
        break;
    case IMAGE_EFFECT_SHIMMER:
        ApplyImageEffect_Shimmer();
        break;
    case IMAGE_EFFECT_OUTLINE:
        ApplyImageEffect_BlackOutline();
        break;
    case IMAGE_EFFECT_BLUR_RIGHT:
        ApplyImageEffect_BlurRight();
        break;
    case IMAGE_EFFECT_BLUR_DOWN:
        ApplyImageEffect_BlurDown();
        break;
    case IMAGE_EFFECT_GRAYSCALE_LIGHT:
        ApplyImageEffect_Grayscale();
        ApplyImageEffect_RedChannelGrayscale(3);
        break;
    case IMAGE_EFFECT_CHARCOAL:
        ApplyImageEffect_BlackOutline();
        ApplyImageEffect_BlurRight();
        ApplyImageEffect_BlurDown();
        ApplyImageEffect_BlackAndWhite();
        ApplyImageEffect_Blur();
        ApplyImageEffect_Blur();
        ApplyImageEffect_RedChannelGrayscale(2);
        ApplyImageEffect_RedChannelGrayscaleHighlight(4);
        break;
    }
}

void ApplyImageEffect_RedChannelGrayscale(u8 delta)
{
    u8 i, j;
    for (i = 0; i < gCanvasRowEnd; i++)
    {
        u16* var2 = &gCanvasPixels[(gCanvasRowStart + i) * gCanvasWidth];
        u16* pal = &var2[gCanvasColumnStart];
        for (j = 0; j < gCanvasColumnEnd; j++, pal++)
        {
            if (!IS_ALPHA(*pal))
            {
                u8 val = (31 & *pal);
                val += delta;
                if (val > 31)
                    val = 31;

                *pal = RGB2(val, val, val);
            }
        }
    }
}

void ApplyImageEffect_RedChannelGrayscaleHighlight(u8 highlight)
{
    u8 i, j;
    for (i = 0; i < gCanvasRowEnd; i++)
    {
        u16* var2 = &gCanvasPixels[(gCanvasRowStart + i) * gCanvasWidth];
        u16* pal = &var2[gCanvasColumnStart];
        for (j = 0; j < gCanvasColumnEnd; j++, pal++)
        {
            if (!IS_ALPHA(*pal))
            {
                u8 val = (31 & *pal);
                if (val > 31 - highlight)
                    val = 31 - (highlight >> 1);

                *pal = RGB2(val, val, val);
            }
        }
    }
}

void ApplyImageEffect_Pointillism(void)
{
    u32 i;
    for (i = 0; i < 3200; i++)
        AddPointillismPoints(i);
}

void ApplyImageEffect_Grayscale(void)
{
    u8 i, j;
    for (i = 0; i < gCanvasRowEnd; i++)
    {
        u16* var2 = &gCanvasPixels[(gCanvasRowStart + i) * gCanvasWidth];
        u16* color = &var2[gCanvasColumnStart];
        for (j = 0; j < gCanvasColumnEnd; j++, color++)
        {
            if (!IS_ALPHA(*color))
            {
                *color = ConvertColorToGrayscale(color);
            }
        }
    }
}

void ApplyImageEffect_Blur(void)
{
    u8 i, j;
    for (i = 0; i < gCanvasColumnEnd; i++)
    {
        u16* var0 = &gCanvasPixels[gCanvasRowStart * gCanvasWidth];
        u16* palette = &var0[gCanvasColumnStart + i];
        u16 color = *palette;
        j = 1;
        palette += gCanvasWidth;
        while (j < gCanvasRowEnd - 1)
        {
            if (!IS_ALPHA(*palette))
            {
                *palette = QuantizePixel_Blur(&color, palette, palette + gCanvasWidth);
                color = *palette;
            }

            j++;
            palette += gCanvasWidth;
        }
    }
}

void ApplyImageEffect_PersonalityColor(u8 personality)
{
    u8 i, j;
    for (i = 0; i < gCanvasRowEnd; i++)
    {
        u16* pixelRow = &gCanvasPixels[(gCanvasRowStart + i) * gCanvasWidth];
        u16* pixel = &pixelRow[gCanvasColumnStart];
        for (j = 0; j < gCanvasColumnEnd; j++, pixel++)
        {
            if (!IS_ALPHA(*pixel))
            {
                *pixel = ConvertCoolColor(pixel, personality);
            }
        }
    }
}

void ApplyImageEffect_BlackAndWhite(void)
{
    u8 i, j;
    for (i = 0; i < gCanvasRowEnd; i++)
    {
        u16* pixelRow = &gCanvasPixels[(gCanvasRowStart + i) * gCanvasWidth];
        u16* pixel = &pixelRow[gCanvasColumnStart];
        for (j = 0; j < gCanvasColumnEnd; j++, pixel++)
        {
            if (!IS_ALPHA(*pixel))
            {
                *pixel = QuantizePixel_BlackAndWhite(pixel);
            }
        }
    }
}
 
void ApplyImageEffect_BlackOutline(void)
{
    u8 i, j;
    u16 *pixel;

    for (i = 0; i < gCanvasRowEnd; i++)
    {
        u16* pixelRow = &gCanvasPixels[(gCanvasRowStart + i) * gCanvasWidth];
        pixel = &pixelRow[gCanvasColumnStart];
        *pixel = QuantizePixel_BlackOutline(pixel, pixel + 1);
        for (j = 1, pixel = pixel + 1; j < gCanvasColumnEnd - 1; j++, pixel++)
        {
            *pixel = QuantizePixel_BlackOutline(pixel, pixel + 1);
            *pixel = QuantizePixel_BlackOutline(pixel, pixel - 1);
        }

        *pixel = QuantizePixel_BlackOutline(pixel, pixel - 1);
    }

    for (j = 0; j < gCanvasColumnEnd; j++)
    {
        u16* var0 = &gCanvasPixels[gCanvasRowStart * gCanvasWidth];
        pixel = &var0[gCanvasColumnStart + j];
        *pixel = QuantizePixel_BlackOutline(pixel, pixel + gCanvasWidth);
        for (i = 1, pixel = pixel + gCanvasWidth; i < gCanvasRowEnd - 1; i++, pixel += gCanvasWidth)
        {
            *pixel = QuantizePixel_BlackOutline(pixel, pixel + gCanvasWidth);
            *pixel = QuantizePixel_BlackOutline(pixel, pixel - gCanvasWidth);
        }

        *pixel = QuantizePixel_BlackOutline(pixel, pixel - gCanvasWidth);
    }
}

void ApplyImageEffect_Invert(void)
{
    u8 i, j;
    for (i = 0; i < gCanvasRowEnd; i++)
    {
        u16* pixelRow = &gCanvasPixels[(gCanvasRowStart + i) * gCanvasWidth];
        u16* pixel = &pixelRow[gCanvasColumnStart];
        for (j = 0; j < gCanvasColumnEnd; j++, pixel++)
        {
            if (!IS_ALPHA(*pixel))
            {
                *pixel = QuantizePixel_Invert(pixel);
            }
        }
    }
}

void ApplyImageEffect_Shimmer(void)
{
    u8 i, j;
    u16 *pixel;
    u16 color;

    pixel = gCanvasPixels;
    for (i = 0; i < 64; i++)
    {
        for (j = 0; j < 64; j++, pixel++)
        {
            if (!IS_ALPHA(*pixel))
            {
                *pixel = QuantizePixel_Invert(pixel);
            }
        }
    }

    for (j = 0; j < 64; j++)
    {
        pixel = &gCanvasPixels[j];
        color = *pixel;
        *pixel = RGB_ALPHA;
        for (i = 1, pixel += 64; i < 63; i++, pixel += 64)
        {
            if (!IS_ALPHA(*pixel))
            {
                *pixel = QuantizePixel_BlurHard(&color, pixel, pixel + 64);
                color = *pixel;
            }
        }

        *pixel = RGB_ALPHA;
        pixel = &gCanvasPixels[j];
        color = *pixel;
        *pixel = RGB_ALPHA;
        for (i = 1, pixel += 64; i < 63; i++, pixel += 64)
        {
            if (!IS_ALPHA(*pixel))
            {
                *pixel = QuantizePixel_BlurHard(&color, pixel, pixel + 64);
                color = *pixel;
            }
        }

        *pixel = RGB_ALPHA;
    }

    pixel = gCanvasPixels;
    for (i = 0; i < 64; i++)
    {
        for (j = 0; j < 64; j++, pixel++)
        {
            if (!IS_ALPHA(*pixel))
            {
                *pixel = QuantizePixel_Invert(pixel);
            }
        }
    }
}

void ApplyImageEffect_BlurRight(void)
{
    u8 i, j;
    for (i = 0; i < gCanvasRowEnd; i++)
    {
        u16* pixelRow = &gCanvasPixels[(gCanvasRowStart + i) * gCanvasWidth];
        u16* pixel = &pixelRow[gCanvasColumnStart];
        u16 color = *pixel;
        for (j = 1, pixel++; j < gCanvasColumnEnd - 1; j++, pixel++)
        {
            if (!IS_ALPHA(*pixel))
            {
                *pixel = QuantizePixel_MotionBlur(&color, pixel);
                color = *pixel;
            }
        }
    }
}

void ApplyImageEffect_BlurDown(void)
{
    u8 i, j;
    for (i = 0; i < gCanvasColumnEnd; i++)
    {
        u16* pixelRow = &gCanvasPixels[gCanvasRowStart * gCanvasWidth];
        u16* pixel = &pixelRow[gCanvasColumnStart + i];
        u16 prevPixel = *pixel;
        for (j = 1, pixel += gCanvasWidth; j < gCanvasRowEnd - 1; j++, pixel += gCanvasWidth)
        {
            if (!IS_ALPHA(*pixel))
            {
                *pixel = QuantizePixel_MotionBlur(&prevPixel, pixel);
                prevPixel = *pixel;
            }
        }
    }
}

struct PointillismPoint
{
    u8 column;
    u8 row;
    u16 delta;
};

void AddPointillismPoints(u16 point)
{
    u8 i;
    bool8 offsetDownLeft;
    u8 colorType;
    struct PointillismPoint points[6];

    points[0].column = sPointillismPoints[point][0];
    points[0].row = sPointillismPoints[point][1];
    points[0].delta = GET_POINT_DELTA(sPointillismPoints[point][2]);

    colorType = GET_POINT_COLOR_TYPE(sPointillismPoints[point][2]);
    offsetDownLeft = GET_POINT_OFFSET_DL(sPointillismPoints[point][2]);
    for (i = 1; i < points[0].delta; i++)
    {
        if (!offsetDownLeft)
        {
            points[i].column = points[0].column - i;
            points[i].row = points[0].row + i;
        }
        else
        {
            points[i].column = points[0].column + 1;
            points[i].row = points[0].row - 1;
        }

        if (points[i].column >= MAX_DIMENSION || points[i].row >= MAX_DIMENSION)
        {
            points[0].delta = i - 1;
            break;
        }

        points[i].delta = points[0].delta - i;
    }

    for (i = 0; i < points[0].delta; i++)
    {
        u16 *pixel = &gCanvasPixels[points[i].row * MAX_DIMENSION] + points[i].column;

        if (!IS_ALPHA(*pixel))
        {
            u16 red =   GET_R(*pixel);
            u16 green = GET_G(*pixel);
            u16 blue =  GET_B(*pixel);

            switch (colorType)
            {
            case 0:
            case 1:
                switch (GET_POINT_DELTA(sPointillismPoints[point][2]) % 3)
                {
                case 0:
                    if (red >= points[i].delta)
                        red -= points[i].delta;
                    else
                        red = 0;
                    break;
                case 1:
                    if (green >= points[i].delta)
                        green -= points[i].delta;
                    else
                        green = 0;
                    break;
                case 2:
                    if (blue >= points[i].delta)
                        blue -= points[i].delta;
                    else
                        blue = 0;
                    break;
                }
                break;
            case 2:
            case 3:
                red += points[i].delta;
                green += points[i].delta;
                blue += points[i].delta;
                if (red > 31)
                    red = 31;
                if (green > 31)
                    green = 31;
                if (blue > 31)
                    blue = 31;
                break;
            }

            *pixel = RGB2(red, green, blue);
        }
    }
}

u16 ConvertColorToGrayscale(u16 *color)
{
    u16 red = GET_R(*color);
    u16 green = GET_G(*color);
    u16 blue = GET_B(*color);
    u16 average = (red + green + blue) / 3;
    return RGB2(average, average, average);
}

// The dark colors are the colored edges of the Cool painting effect.
// Everything else is white.
u16 ConvertCoolColor(u16 *color, u8 personality)
{
    u16 red = GET_R(*color);
    u16 green = GET_G(*color);
    u16 blue = GET_B(*color);
    if (red < 17 && green < 17 && blue < 17)
        return GetCoolColorFromPersonality(personality);
    else
        return RGB_WHITE;
}

// Based on the given value, which comes from the first 8 bits of
// the mon's personality value, return a color.
u16 GetCoolColorFromPersonality(u8 personality)
{
    u16 red = 0;
    u16 green = 0;
    u16 blue = 0;
    u8 strength = (personality / 6) % 3;
    u8 colorType = personality % 6;

    switch (colorType)
    {
    case 0:
        // Teal color
        green = 21 - strength;
        blue = green;
        red = 0;
        break;
    case 1:
        // Yellow color
        blue = 0;
        red = 21 - strength;
        green = red;
        break;
    case 2:
        // Purple color
        blue = 21 - strength;
        green = 0;
        red = blue;
        break;
    case 3:
        // Red color
        blue = 0;
        green = 0;
        red = 23 - strength;
        break;
    case 4:
        // Blue color
        blue = 23 - strength;
        green = 0;
        red = 0;
        break;
    case 5:
        // Green color
        blue = 0;
        green = 23 - strength;
        red = 0;
        break;
    }

    return RGB2(red, green, blue);
}

u16 QuantizePixel_BlackAndWhite(u16 *color)
{
    u16 red = GET_R(*color);
    u16 green = GET_G(*color);
    u16 blue = GET_B(*color);
    if (red < 17 && green < 17 && blue < 17)
        return RGB_BLACK;
    else
        return RGB_WHITE;
}

u16 QuantizePixel_BlackOutline(u16 *colorA, u16 *colorB)
{
    if (*colorA)
    {
        if (IS_ALPHA(*colorA))
            return RGB_ALPHA;
        if (IS_ALPHA(*colorB))
            return RGB_BLACK;

        return *colorA;
    }

    return RGB_BLACK;
}

u16 QuantizePixel_Invert(u16 *color)
{
    u16 red = GET_R(*color);
    u16 green = GET_G(*color);
    u16 blue = GET_B(*color);
    red = 31 - red;
    green = 31 - green;
    blue = 31 - blue;

    return RGB2(red, green, blue);
}

u16 QuantizePixel_MotionBlur(u16 *prevPixel, u16 *curPixel)
{
    u16 pixelChannels[2][3];
    u16 diffs[3];
    u8 i;
    u16 largestDiff;
    u16 r, g, b;

    if (*prevPixel == *curPixel)
        return *curPixel;

    pixelChannels[0][0] = GET_R(*prevPixel);
    pixelChannels[0][1] = GET_G(*prevPixel);
    pixelChannels[0][2] = GET_B(*prevPixel);
    pixelChannels[1][0] = GET_R(*curPixel);
    pixelChannels[1][1] = GET_G(*curPixel);
    pixelChannels[1][2] = GET_B(*curPixel);

    if (pixelChannels[0][0] > 25 && pixelChannels[0][1] > 25 && pixelChannels[0][2] > 25)
        return *curPixel;
    if (pixelChannels[1][0] > 25 && pixelChannels[1][1] > 25 && pixelChannels[1][2] > 25)
        return *curPixel;

    for (i = 0; i < 3; i++)
    {
        if (pixelChannels[0][i] > pixelChannels[1][i])
            diffs[i] = pixelChannels[0][i] - pixelChannels[1][i];
        else
            diffs[i] = pixelChannels[1][i] - pixelChannels[0][i];
    }

    if (diffs[0] >= diffs[1])
    {
        if (diffs[0] >= diffs[2])
            largestDiff = diffs[0];
        else if (diffs[1] >= diffs[2])
            largestDiff = diffs[1];
        else
            largestDiff = diffs[2];
    }
    else
    {
        if (diffs[1] >= diffs[2])
            largestDiff = diffs[1];
        else if (diffs[2] >= diffs[0])
            largestDiff = diffs[2];
        else
            largestDiff = diffs[0];
    }

    r = (pixelChannels[1][0] * (31 - largestDiff / 2)) / 31;
    g = (pixelChannels[1][1] * (31 - largestDiff / 2)) / 31;
    b = (pixelChannels[1][2] * (31 - largestDiff / 2)) / 31;
    return RGB2(r, g, b);
}

u16 QuantizePixel_Blur(u16 *prevPixel, u16 *curPixel, u16 *nextPixel)
{
    u16 red, green, blue;
    u16 avg0, avg1, avg2;
    u16 diff1, diff2;
    u32 minimum;
    u16 factor;

    if (*prevPixel == *curPixel && *nextPixel == *curPixel)
        return *curPixel;

    red = GET_R(*curPixel);
    green = GET_G(*curPixel);
    blue = GET_B(*curPixel);

    avg0 = ((GET_R(*prevPixel)) + (GET_G(*prevPixel)) + (GET_B(*prevPixel))) / 3;
    avg1 = ((GET_R(*curPixel)) + (GET_G(*curPixel)) + (GET_B(*curPixel))) / 3;
    avg2 = ((GET_R(*nextPixel)) + (GET_G(*nextPixel)) + (GET_B(*nextPixel))) / 3;

    if (avg0 == avg1 && avg2 == avg1)
        return *curPixel;

    if (avg0 > avg1)
        diff1 = avg0 - avg1;
    else
        diff1 = avg1 - avg0;

    if (avg2 > avg1)
        diff2 = avg2 - avg1;
    else
        diff2 = avg1 - avg2;

    if (diff1 >= diff2)
        minimum = diff1;
    else
        minimum = diff2;

    factor = 31 - minimum / 2;
    red = red * factor / 31;
    green = green * factor / 31;
    blue = blue * factor / 31;
    return RGB2(red, green, blue);
}

u16 QuantizePixel_BlurHard(u16 *prevPixel, u16 *curPixel, u16 *nextPixel)
{
    u16 red, green, blue;
    u16 avg0, avg1, avg2;
    u16 diff1, diff2;
    u32 minimum;
    u16 factor;

    if (*prevPixel == *curPixel && *nextPixel == *curPixel)
        return *curPixel;

    red = GET_R(*curPixel);
    green = GET_G(*curPixel);
    blue = GET_B(*curPixel);

    avg0 = ((GET_R(*prevPixel)) + (GET_G(*prevPixel)) + (GET_B(*prevPixel))) / 3;
    avg1 = ((GET_R(*curPixel)) + (GET_G(*curPixel)) + (GET_B(*curPixel))) / 3;
    avg2 = ((GET_R(*nextPixel)) + (GET_G(*nextPixel)) + (GET_B(*nextPixel))) / 3;

    if (avg0 == avg1 && avg2 == avg1)
        return *curPixel;

    if (avg0 > avg1)
        diff1 = avg0 - avg1;
    else
        diff1 = avg1 - avg0;

    if (avg2 > avg1)
        diff2 = avg2 - avg1;
    else
        diff2 = avg1 - avg2;

    if (diff1 >= diff2)
        minimum = diff1;
    else
        minimum = diff2;

    factor = 31 - minimum;
    red = red * factor / 31;
    green = green * factor / 31;
    blue = blue * factor / 31;
    return RGB2(red, green, blue);
}

void ConvertImageProcessingToGBA(struct ImageProcessingContext *context)
{
    u16 i, j, k;
    u16 *src, *dest, *src_, *dest_;
    u16 width, height;

    width = context->canvasWidth >> 3;
    height = context->canvasHeight >> 3;
    src_ = context->canvasPixels;
    dest_ = context->dest;

    if (context->bgType == 2)
    {
        for (i = 0; i < height; i++)
        {
            for (j = 0; j < width; j++)
            {
                for (k = 0; k < 8; k++)
                {
                    dest = dest_ + ((i * width + j) << 5) + (k << 2);
                    src = src_ + ((((i << 3) + k) << 3) * width) + (j << 3);

                    dest[0] = src[0] | (src[1] << 8);
                    dest[1] = src[2] | (src[3] << 8);
                    dest[2] = src[4] | (src[5] << 8);
                    dest[3] = src[6] | (src[7] << 8);
                }
            }
        }
    }
    else
    {
        for (i = 0; i < height; i++)
        {
            for (j = 0; j < width; j++)
            {
                for (k = 0; k < 8; k++)
                {
                    dest = dest_ + ((i * width + j) << 4) + (k << 1);
                    src = src_ + ((((i << 3) + k) << 3) * width) + (j << 3);

                    dest[0] = src[0] | (src[1] << 4) | (src[2] << 8) | (src[3] << 12);
                    dest[1] = src[4] | (src[5] << 4) | (src[6] << 8) | (src[7] << 12);
                }
            }
        }
    }
}

void ApplyImageProcessingQuantization(struct ImageProcessingContext *arg0)
{
    gCanvasPaletteStart = arg0->paletteStart * 16;
    gCanvasPalette = &arg0->canvasPalette[gCanvasPaletteStart];
    gCanvasPixels = arg0->canvasPixels;
    gCanvasColumnStart = arg0->columnStart;
    gCanvasRowStart = arg0->rowStart;
    gCanvasColumnEnd = arg0->columnEnd;
    gCanvasRowEnd = arg0->rowEnd;
    gCanvasWidth = arg0->canvasWidth;
    gCanvasHeight = arg0->canvasHeight;

    switch (arg0->quantizeEffect)
    {
    case QUANTIZE_EFFECT_STANDARD:
        QuantizePalette_Standard(FALSE);
        break;
    case QUANTIZE_EFFECT_STANDARD_LIMITED_COLORS:
        QuantizePalette_Standard(TRUE);
        break;
    case QUANTIZE_EFFECT_PRIMARY_COLORS:
        SetPresetPalette_PrimaryColors();
        QuantizePalette_PrimaryColors();
        break;
    case QUANTIZE_EFFECT_GRAYSCALE:
        SetPresetPalette_Grayscale();
        QuantizePalette_Grayscale();
        break;
    case QUANTIZE_EFFECT_GRAYSCALE_SMALL:
        SetPresetPalette_GrayscaleSmall();
        QuantizePalette_GrayscaleSmall();
        break;
    case QUANTIZE_EFFECT_BLACK_WHITE:
        SetPresetPalette_BlackAndWhite();
        QuantizePalette_BlackAndWhite();
        break;
    }
}

void SetPresetPalette_PrimaryColors(void)
{
    gCanvasPalette[0] = RGB_BLACK;
    gCanvasPalette[1] = RGB2(6, 6, 6);
    gCanvasPalette[2] = RGB2(29, 29, 29);
    gCanvasPalette[3] = RGB2(11, 11, 11);
    gCanvasPalette[4] = RGB2(29, 6, 6);
    gCanvasPalette[5] = RGB2(6, 29, 6);
    gCanvasPalette[6] = RGB2(6, 6, 29);
    gCanvasPalette[7] = RGB2(29, 29, 6);
    gCanvasPalette[8] = RGB2(29, 6, 29);
    gCanvasPalette[9] = RGB2(6, 29, 29);
    gCanvasPalette[10] = RGB2(29, 11, 6);
    gCanvasPalette[11] = RGB2(11, 29, 6);
    gCanvasPalette[12] = RGB2(6, 11, 29);
    gCanvasPalette[13] = RGB2(29, 6, 11);
    gCanvasPalette[14] = RGB2(6, 29, 11);
    gCanvasPalette[15] = RGB2(11, 6, 29);
}

void SetPresetPalette_BlackAndWhite(void)
{
    gCanvasPalette[0] = RGB_BLACK;
    gCanvasPalette[1] = RGB_BLACK;
    gCanvasPalette[2] = RGB_WHITE;
}

void SetPresetPalette_GrayscaleSmall(void)
{
    u8 i;

    gCanvasPalette[0] = RGB_BLACK;
    gCanvasPalette[1] = RGB_BLACK;
    for (i = 0; i < 14; i++)
        gCanvasPalette[i + 2] = RGB2(2 * (i + 2), 2 * (i + 2), 2 * (i + 2));
}

void SetPresetPalette_Grayscale(void)
{
    u8 i;

    gCanvasPalette[0] = RGB_BLACK;
    for (i = 0; i < 32; i++)
        gCanvasPalette[i + 1] = RGB2(i, i, i);
}

void QuantizePalette_Standard(bool8 arg0)
{
    u8 i, j;
    u16 maxIndex;

    maxIndex = 0xDF;
    if (!arg0)
        maxIndex = 0xFF;

    for (j = 0; j < maxIndex; j++)
        gCanvasPalette[j] = 0;

    gCanvasPalette[maxIndex] = RGB2(15, 15, 15);
    for (i = 0; i < gCanvasRowEnd; i++)
    {
        u16* var2 = &gCanvasPixels[(gCanvasRowStart + i) * gCanvasWidth];
        u16* pal = &var2[gCanvasColumnStart];
        for (j = 0; j < gCanvasColumnEnd; j++, pal++)
        {
            if (IS_ALPHA(*pal))
            {
                *pal = gCanvasPaletteStart;
            }
            else
            {
                u16 color = QuantizePixel_Standard(pal);
                u8 curIndex = 1;
                if (curIndex < maxIndex)
                {
                    if (gCanvasPalette[curIndex] == RGB_BLACK)
                    {
                        gCanvasPalette[curIndex] = color;
                        *pal = gCanvasPaletteStart + curIndex;
                    }
                    else
                    {
                        while (curIndex < maxIndex)
                        {
                            if (gCanvasPalette[curIndex] == RGB_BLACK)
                            {
                                gCanvasPalette[curIndex] = color;
                                *pal = gCanvasPaletteStart + curIndex;
                                break;
                            }

                            if (gCanvasPalette[curIndex] == color)
                            {
                                *pal = gCanvasPaletteStart + curIndex;
                                break;
                            }

                            curIndex++;
                        }
                    }
                }

                if (curIndex == maxIndex)
                {
                    curIndex = maxIndex;
                    *pal = curIndex;
                }
            }
        }
    }
}

void QuantizePalette_BlackAndWhite(void)
{
    u8 i, j;

    for (i = 0; i < gCanvasRowEnd; i++)
    {
        u16* var2 = &gCanvasPixels[(gCanvasRowStart + i) * gCanvasWidth];
        u16* pal = &var2[gCanvasColumnStart];
        for (j = 0; j < gCanvasColumnEnd; j++, pal++)
        {
            if (IS_ALPHA(*pal))
            {
                *pal = gCanvasPaletteStart;
            }
            else
            {
                if (QuantizePixel_BlackAndWhite(pal) == RGB_BLACK)
                    *pal = gCanvasPaletteStart + 1;
                else
                    *pal = gCanvasPaletteStart + 2;
            }
        }
    }
}

void QuantizePalette_GrayscaleSmall(void)
{
    u8 i, j;

    for (i = 0; i < gCanvasRowEnd; i++)
    {
        u16* var2 = &gCanvasPixels[(gCanvasRowStart + i) * gCanvasWidth];
        u16* pal = &var2[gCanvasColumnStart];
        for (j = 0; j < gCanvasColumnEnd; j++, pal++)
        {
            if (IS_ALPHA(*pal))
                *pal = gCanvasPaletteStart;
            else
                *pal = QuantizePixel_GrayscaleSmall(pal) + gCanvasPaletteStart;
        }
    }
}

void QuantizePalette_Grayscale(void)
{
    u8 i, j;

    for (i = 0; i < gCanvasRowEnd; i++)
    {
        u16* var2 = &gCanvasPixels[(gCanvasRowStart + i) * gCanvasWidth];
        u16* pal = &var2[gCanvasColumnStart];
        for (j = 0; j < gCanvasColumnEnd; j++, pal++)
        {
            if (IS_ALPHA(*pal))
                *pal = gCanvasPaletteStart;
            else
                *pal = QuantizePixel_Grayscale(pal) + gCanvasPaletteStart;
        }
    }
}

void QuantizePalette_PrimaryColors(void)
{
    u8 i, j;

    for (i = 0; i < gCanvasRowEnd; i++)
    {
        u16* var2 = &gCanvasPixels[(gCanvasRowStart + i) * gCanvasWidth];
        u16* pal = &var2[gCanvasColumnStart];
        for (j = 0; j < gCanvasColumnEnd; j++, pal++)
        {
            if (IS_ALPHA(*pal))
                *pal = gCanvasPaletteStart;
            else
                *pal = QuantizePixel_PrimaryColors(pal) + gCanvasPaletteStart;
        }
    }
}

u16 QuantizePixel_Standard(u16 *color)
{
    u16 red = GET_R(*color);
    u16 green = GET_G(*color);
    u16 blue = GET_B(*color);

    if (red & 3)
        red = (red & 0x1C) + 4;
    if (green & 3)
        green = (green & 0x1C) + 4;
    if (blue & 3)
        blue = (blue & 0x1C) + 4;

    if (red < 6)
        red = 6;
    if (red > 30)
        red = 30;

    if (green < 6)
        green = 6;
    if (green > 30)
        green = 30;

    if (blue < 6)
        blue = 6;
    if (blue > 30)
        blue = 30;

    return RGB2(red, green, blue);
}

u16 QuantizePixel_PrimaryColors(u16* color)
{
    u16 red = GET_R(*color);
    u16 green = GET_G(*color);
    u16 blue = GET_B(*color);

    if (red < 12 && green < 11 && blue < 11)
        return 1;

    if (red > 19 && green > 19 && blue > 19)
        return 2;

    if (red > 19)
    {
        if (green > 19)
        {
            if (blue > 14)
                return 2;
            else
                return 7;
        }
        else if (blue > 19)
        {
            if (green > 14)
                return 2;
            else
                return 8;
        }
    }

    if (green > 19 && blue > 19)
    {
        if (red > 14)
            return 2;
        else
            return 9;
    }

    if (red > 19)
    {
        if (green > 11)
        {
            if (blue > 11)
            {
                if (green < blue)
                    return 8;
                else
                    return 7;
            }
            else
            {
                return 10;
            }
        }
        else if (blue > 11)
        {
            return 13;
        }
        else
        {
            return 4;
        }
    }

    if (green > 19)
    {
        if (red > 11)
        {
            if (blue > 11)
            {
                if (red < blue)
                    return 9;
                else
                    return 7;
            }
            else
            {
                return 11;
            }
        }
        else
        {
            if (blue > 11)
                return 14;
            else
                return 5;
        }
    }

    if (blue > 19)
    {
        if (red > 11)
        {
            if (green > 11)
            {
                if (red < green)
                    return 9;
                else
                    return 8;
            }
        }
        else if (green > 11)
        {
            return 12;
        }

        if (blue > 11)
            return 15;
        else
            return 6;
    }

    return 3;
}

u16 QuantizePixel_GrayscaleSmall(u16 *color)
{
    u16 red = GET_R(*color);
    u16 green = GET_G(*color);
    u16 blue = GET_B(*color);
    u16 average = ((red + green + blue) / 3) & 0x1E;
    if (average == 0)
        return 1;
    else
        return average / 2;
}

u16 QuantizePixel_Grayscale(u16 *color)
{
    u16 red = GET_R(*color);
    u16 green = GET_G(*color);
    u16 blue = GET_B(*color);
    u16 average = (red + green + blue) / 3;
    return average + 1;
}
