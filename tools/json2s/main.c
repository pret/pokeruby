// Copyright(c) 2018 huderlem
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include "cJSON.h"
#include "global.h"
#include "util.h"

#define MAX(a, b) ((a) >= (b)) ? (a) : (b)

enum Mode
{
	MODE_NONE,
	MODE_MAP_HEADER,
};

const char *MODE_STR_NONE = "none";
const char *MODE_STR_MAP_HEADER = "mapheader";

struct ConversionModeHandler
{
	enum Mode mode;
	void (*function)(char *outputFile, cJSON *json);
};

char *Concat(char *dest, char *src, int *destSize, int *destCapacity)
{
	int srcSize = strlen(src);
	if (*destSize + srcSize + 1 > *destCapacity)
	{
		// Reallocate a larger destination buffer.
		*destCapacity = MAX(2 * (*destSize + srcSize), 2 * (*destCapacity));
		dest = realloc(dest, sizeof(char) * (*destCapacity));
	}

	strcat(dest, src);
	*destSize += srcSize;

	return dest;
}

char *OutputJsonValue(char *output, cJSON *json, char *propertyName, char *prefix, char *suffix, int *outputSize, int *outputCapacity)
{
	cJSON *property = cJSON_GetObjectItemCaseSensitive(json, propertyName);
	if (property == NULL)
		FATAL_ERROR("Required json property \"%s\" is missing", propertyName);

	output = Concat(output, prefix, outputSize, outputCapacity);
	if (cJSON_IsString(property) && property->valuestring != NULL)
	{
		output = Concat(output, property->valuestring, outputSize, outputCapacity);
	}
	else if (cJSON_IsNumber(property))
	{
		char intStr[20];
		sprintf(intStr, "%d", property->valueint);
		output = Concat(output, intStr, outputSize, outputCapacity);
	}

	output = Concat(output, suffix, outputSize, outputCapacity);
	return output;
}

void ConvertMapHeader(char *outputFile, cJSON *json)
{
	int capacity = 512;
	int size = 0;
	char *output = calloc(capacity, sizeof(char));

	output = OutputJsonValue(output, json, "name", "", "::\n", &size, &capacity);
	output = OutputJsonValue(output, json, "mapData", "\t.4byte ", "\n", &size, &capacity);
	output = OutputJsonValue(output, json, "events", "\t.4byte ", "\n", &size, &capacity);
	output = OutputJsonValue(output, json, "mapScripts", "\t.4byte ", "\n", &size, &capacity);
	output = OutputJsonValue(output, json, "connections", "\t.4byte ", "\n", &size, &capacity);
	output = OutputJsonValue(output, json, "music", "\t.2byte ", "\n", &size, &capacity);
	output = OutputJsonValue(output, json, "mapDataId", "\t.2byte ", "\n", &size, &capacity);
	output = OutputJsonValue(output, json, "regionMapSectionId", "\t.byte ", "\n", &size, &capacity);
	output = OutputJsonValue(output, json, "cave", "\t.byte ", "\n", &size, &capacity);
	output = OutputJsonValue(output, json, "weather", "\t.byte ", "\n", &size, &capacity);
	output = OutputJsonValue(output, json, "mapType", "\t.byte ", "\n", &size, &capacity);
	output = Concat(output, "\t.2byte 0\n", &size, &capacity); // 2 filler bytes in the MapHeader struct
	output = OutputJsonValue(output, json, "flags", "\t.byte ", "\n", &size, &capacity);
	output = OutputJsonValue(output, json, "battleType", "\t.byte ", "\n", &size, &capacity);

	WriteWholeFile(outputFile, output, size);
}

enum Mode GetModeFromStr(char *modeStr)
{
	if (strcmp(modeStr, MODE_STR_MAP_HEADER) == 0)
		return MODE_MAP_HEADER;

	return MODE_NONE;
}

const char *GetModeStr(enum Mode mode)
{
	switch (mode)
	{
	case MODE_MAP_HEADER:
		return MODE_STR_MAP_HEADER;
	default:
		return MODE_STR_NONE;
	}
}

char *NewFileExtension(char *filename, char *ext)
{
	char *index = strrchr(filename, '.');
	if (!index || index == filename)
	{
		index = filename + strlen(filename);
	}

	int length = index - filename;
	char *newFilename = malloc(length + 1 + strlen(ext) + 1);
	if (newFilename)
	{
		strcpy(newFilename, filename);
		newFilename[length] = '.';
		strcpy(newFilename + length + 1, ext);
	}

	return newFilename;
}

// Reads a json file and outputs the corresponding assembler file content, based on what
// conversion mode is specified. The mode can be explicitly set as an optional argument,
// or it is inferred from the input filename.
int main(int argc, char **argv)
{
	if (argc < 2)
		FATAL_ERROR("Usage: json2s INPUT_FILE [mode]\n");

	enum Mode mode = MODE_NONE;
	if (argc == 2)
	{
		// Get the mode from the file extension. The mode should be present
		// between the name and the .json extension. For example, myfile.<mode>.json
		char *modeStr = GetFileExtensionPart(argv[1], 1);
		if (modeStr != NULL)
		{
			mode = GetModeFromStr(modeStr);
			free(modeStr);
		}
	}
	else
	{
		mode = GetModeFromStr(argv[2]);
	}

	if (mode == MODE_NONE)
		FATAL_ERROR("Invalid mode specified for json conversion. Valid modes are: 'mapheader'");

	// Read and parse the input JSON file.
	int fileSize;
	unsigned char *fileContents = ReadWholeFile(argv[1], &fileSize);
	cJSON *json = cJSON_Parse((const char *)fileContents);
	free(fileContents);
	if (json == NULL)
		FATAL_ERROR("Failed to parse json file \"%s\". Check for json syntax errors.", argv[1]);

	struct ConversionModeHandler handlers[] =
	{
		{MODE_MAP_HEADER, ConvertMapHeader},
		{MODE_NONE, NULL},
	};

	for (int i = 0; handlers[i].function != NULL; i++)
	{
		if (mode == handlers[i].mode)
		{
			char *outputFile = NewFileExtension(argv[1], "json.inc");
			handlers[i].function(outputFile, json);
			free(outputFile);
			break;
		}
	}

	free(json);

	return 0;
}
