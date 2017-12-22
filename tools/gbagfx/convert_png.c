// Copyright (c) 2015 YamaArashi

#include <stdio.h>
#include "lodepng.h"
#include "global.h"
#include "convert_png.h"
#include "gfx.h"
#include "util.h"

static unsigned char *ConvertBitDepth(unsigned char *src, int srcBitDepth, int destBitDepth, int numPixels)
{
    // Round the number of bits up to the next 8 and divide by 8 to get the number of bytes.
    int srcSize = ((numPixels * srcBitDepth + 7) & ~7) / 8;
    int destSize = ((numPixels * destBitDepth + 7) & ~7) / 8;
    unsigned char *output = calloc(destSize, 1);
    unsigned char *dest = output;
    int i;
    int j;
    int destBit = 8 - destBitDepth;

    for (i = 0; i < srcSize; i++)
    {
        unsigned char srcByte = src[i];

        for (j = 8 - srcBitDepth; j >= 0; j -= srcBitDepth)
        {
            unsigned char pixel = (srcByte >> j) % (1 << srcBitDepth);

            if (pixel >= (1 << destBitDepth))
                FATAL_ERROR("Image exceeds the maximum color value for a %ibpp image.\n", destBitDepth);
            *dest |= pixel << destBit;
            destBit -= destBitDepth;
            if (destBit < 0)
            {
                dest++;
                destBit = 8 - destBitDepth;
            }
        }
    }

    return output;
}

void ReadPng(char *path, struct Image *image)
{
    LodePNGState state;
    unsigned int error;
    int filesize;
    unsigned int width, height;
    unsigned int color_type;
    int bit_depth;
    unsigned char *buffer = ReadWholeFile(path, &filesize);

    lodepng_state_init(&state);

    state.decoder.color_convert = 0;

    error = lodepng_decode(&image->pixels, &width, &height, &state, buffer, filesize);
    if (error)
        FATAL_ERROR("Failed to decode image \"%s\": %s\n", path, lodepng_error_text(error));

    bit_depth = lodepng_get_bpp(&state.info_png.color);
    color_type = state.info_png.color.colortype;

    if (color_type != LCT_GREY && color_type != LCT_PALETTE)
        FATAL_ERROR("\"%s\" has an unsupported color type.\n", path);

	// Check if the image has a palette so that we can tell if the colors need to be inverted later.
	// Don't read the palette because it's not needed for now.
    image->hasPalette = (color_type == LCT_PALETTE);

    image->width = width;
    image->height = height;

    free(buffer);

    if (bit_depth != image->bitDepth)
    {
        unsigned char *src = image->pixels;

        if (bit_depth != 1 && bit_depth != 2 && bit_depth != 4 && bit_depth != 8)
            FATAL_ERROR("Bit depth of image must be 1, 2, 4, or 8.\n");
        image->pixels = ConvertBitDepth(image->pixels, bit_depth, image->bitDepth, image->width * image->height);
        free(src);
        image->bitDepth = bit_depth;
    }
}

void ReadPngPalette(char *path, struct Palette *palette)
{
    // LodePNG doesn't seem to provide a method to read the palette without
    // decoding the whole file.
    LodePNGState state;
    unsigned int error;
    int filesize;
    unsigned char *buffer = ReadWholeFile(path, &filesize);
    unsigned char *dummy;
    unsigned int dummy_w, dummy_h;

    lodepng_state_init(&state);

    state.decoder.color_convert = 0;

    error = lodepng_decode(&dummy, &dummy_w, &dummy_h, &state, buffer, filesize);
    if (error)
        FATAL_ERROR("Failed to decode image \"%s\": %s\n", path, lodepng_error_text(error));

    if (state.info_png.color.colortype != LCT_PALETTE)
        FATAL_ERROR("The image \"%s\" does not contain a palette.\n", path);

    if (state.info_png.color.palettesize > 256)
        FATAL_ERROR("Images with more than 256 colors are not supported.\n");

    palette->numColors = state.info_png.color.palettesize;

    if (1 << state.info_png.color.bitdepth < palette->numColors)
        FATAL_ERROR("Palette size of %i colors is larger than bit depth %ibpp can support.\n",
          palette->numColors, state.info_png.color.bitdepth);

    for (int i = 0; i < palette->numColors; i++)
    {
        palette->colors[i].red   = state.info_png.color.palette[i * 4 + 0];
        palette->colors[i].green = state.info_png.color.palette[i * 4 + 1];
        palette->colors[i].blue  = state.info_png.color.palette[i * 4 + 2];
    }

    free(dummy);
}

static void SetPngPalette(LodePNGState *state, struct Palette *palette, int hasTransparency)
{
    unsigned char *colors = malloc(palette->numColors * 4);

    if (colors == NULL)
        FATAL_ERROR("Failed to allocate PNG palette.\n");

    for (int i = 0; i < palette->numColors; i++)
    {
        colors[i * 4 + 0] = palette->colors[i].red;
        colors[i * 4 + 1] = palette->colors[i].green;
        colors[i * 4 + 2] = palette->colors[i].blue;
        colors[i * 4 + 3] = 255;
    }

    // Make the first color transparent
    if (hasTransparency)
        colors[0 * 4 + 3] = 0;

    state->info_png.color.palette = colors;
    state->info_png.color.palettesize = palette->numColors;
}

void WritePng(char *path, struct Image *image)
{
    LodePNGState state;
    unsigned int error;
    unsigned char *buffer;
    size_t filesize;

    lodepng_state_init(&state);

    state.encoder.auto_convert = 0;
    state.info_png.color.colortype = image->hasPalette ? LCT_PALETTE : LCT_GREY;
    state.info_png.color.bitdepth = image->bitDepth;

    if (image->hasPalette)
        SetPngPalette(&state, &image->palette, image->hasTransparency);

    error = lodepng_encode(&buffer, &filesize, image->pixels, image->width, image->height, &state);
    if (error)
        FATAL_ERROR("Failed to encode PNG\n");

    WriteWholeFile(path, buffer, filesize);
}
