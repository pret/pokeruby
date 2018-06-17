// Copyright (c) 2015 YamaArashi

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <errno.h>
#include <limits.h>
#include "global.h"
#include "util.h"

bool ParseNumber(char *s, char **end, int radix, int *intValue)
{
	char *localEnd;

	if (end == NULL)
		end = &localEnd;

	errno = 0;

	const long longValue = strtol(s, end, radix);

	if (*end == s)
		return false; // not a number

	if ((longValue == LONG_MIN || longValue == LONG_MAX) && errno == ERANGE)
		return false;

	if (longValue > INT_MAX)
		return false;

	if (longValue < INT_MIN)
		return false;

	*intValue = (int)longValue;

	return true;
}

char *GetFileExtension(char *path)
{
	return GetFileExtensionPart(path, 0);
}

// If the path has more than one '.' character, then return the
// specified part, looking backwards.
// For example:
//     GetFileExtensionPart("myfilename.part1.txt", 0) == "txt"
//     GetFileExtensionPart("myfilename.part1.txt", 1) == "part1"
char *GetFileExtensionPart(char *path, int part)
{
	char *extension = path;
	int size = 0;

	while (*extension != 0)
		extension++;

	while (extension > path)
	{
		if (*extension == '.')
		{
			if (part == 0)
				break;

			part--;
			size = 0;
		}
		else
		{
			size++;
		}

		extension--;
	}

	if (extension == path || size == 0)
		return NULL;

	extension++;

	if (*extension == 0)
		return NULL;

	char *extensionPart = malloc(sizeof(char) * (size + 1));
	if (extensionPart == NULL)
		FATAL_ERROR("Failed to allocate memory for file extension part of path \"%s\".\n", path);

	strncpy(extensionPart, extension, size);
	extensionPart[size] = '\0';

	return extensionPart;
}

unsigned char *ReadWholeFile(char *path, int *size)
{
	FILE *fp = fopen(path, "rb");

	if (fp == NULL)
		FATAL_ERROR("Failed to open \"%s\" for reading.\n", path);

	fseek(fp, 0, SEEK_END);

	*size = ftell(fp);

	unsigned char *buffer = malloc(*size);

	if (buffer == NULL)
		FATAL_ERROR("Failed to allocate memory for reading \"%s\".\n", path);

	rewind(fp);

	if (fread(buffer, *size, 1, fp) != 1)
		FATAL_ERROR("Failed to read \"%s\".\n", path);

	fclose(fp);

	return buffer;
}

unsigned char *ReadWholeFileZeroPadded(char *path, int *size, int padAmount)
{
	FILE *fp = fopen(path, "rb");

	if (fp == NULL)
		FATAL_ERROR("Failed to open \"%s\" for reading.\n", path);

	fseek(fp, 0, SEEK_END);

	*size = ftell(fp);

	unsigned char *buffer = calloc(*size + padAmount, 1);

	if (buffer == NULL)
		FATAL_ERROR("Failed to allocate memory for reading \"%s\".\n", path);

	rewind(fp);

	if (fread(buffer, *size, 1, fp) != 1)
		FATAL_ERROR("Failed to read \"%s\".\n", path);

	fclose(fp);

	return buffer;
}

void WriteWholeFile(char *path, void *buffer, int bufferSize)
{
	FILE *fp = fopen(path, "wb");

	if (fp == NULL)
		FATAL_ERROR("Failed to open \"%s\" for writing.\n", path);

	if (fwrite(buffer, bufferSize, 1, fp) != 1)
		FATAL_ERROR("Failed to write to \"%s\".\n", path);

	fclose(fp);
}
