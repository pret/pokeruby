// Copyright(c) 2016 huderlem
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
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>

/* extended.c */
void ieee754_write_extended (double, unsigned char*);
double ieee754_read_extended (unsigned char*);

#ifdef _MSC_VER

#define FATAL_ERROR(format, ...)           \
do                                         \
{                                          \
    fprintf(stderr, format, __VA_ARGS__);  \
    exit(1);                               \
} while (0)

#else

#define FATAL_ERROR(format, ...)            \
do                                          \
{                                           \
    fprintf(stderr, format, ##__VA_ARGS__); \
    exit(1);                                \
} while (0)

#endif // _MSC_VER

typedef struct {
	unsigned long num_samples;
	char *samples;
	unsigned char midi_note;
	unsigned long loop_offset;
	double sample_rate;
} AifData;


char * get_file_extension(char *filename)
{
	char *dot = strrchr(filename, '.');
	if (!dot || dot == filename)
	{
		FATAL_ERROR("Input file has no file extension.\n");
	}

	return dot + 1;
}

void change_file_extension(char *filename, const char *new_extension)
{
	char *dot = strrchr(filename, '.');
	if (!dot || dot == filename)
	{
		FATAL_ERROR("Input file has no file extension.\n");
	}

	memcpy(dot + 1, new_extension, 3);
}

AifData *read_aif(char * aif_file_data, unsigned long aif_file_data_size)
{
	AifData *aif_data = (AifData *)malloc(sizeof(AifData));

	unsigned long pos = 0;
	char chunk_name[5]; chunk_name[4] = '\0';
	char chunk_type[5]; chunk_type[4] = '\0';

	// Check for FORM Chunk
	memcpy(chunk_name, aif_file_data + pos, 4);
	pos += 4;
	if (strcmp(chunk_name, "FORM") != 0)
	{
		FATAL_ERROR("Input .aif file has invalid header Chunk '%s'!\n", chunk_name);
	}

	// Read size of whole file.
	unsigned long whole_chunk_size = aif_file_data[pos++] << 24;
	whole_chunk_size |= (aif_file_data[pos++] << 16);
	whole_chunk_size |= (aif_file_data[pos++] <<  8);
	whole_chunk_size |= (unsigned char)aif_file_data[pos++];

	unsigned long expected_whole_chunk_size = aif_file_data_size - 8;
	if (whole_chunk_size != expected_whole_chunk_size)
	{
		FATAL_ERROR("FORM Chunk ckSize '%lu' doesn't match actual size '%lu'!\n", whole_chunk_size, expected_whole_chunk_size);
	}

	// Check for AIFF Form Type
	memcpy(chunk_type, aif_file_data + pos, 4);
	pos += 4;
	if (strcmp(chunk_type, "AIFF") != 0)
	{
		FATAL_ERROR("FORM Type is '%s', but it must be AIFF!", chunk_type);
	}

	unsigned long num_sample_frames = 0;

	// Read all the Chunks to populate the AifData struct.
	while (pos < aif_file_data_size)
	{
		// Read Chunk id
		memcpy(chunk_name, aif_file_data + pos, 4);
		pos += 4;

		unsigned long chunk_size = (aif_file_data[pos++] << 24);
		chunk_size |= (aif_file_data[pos++] << 16);
		chunk_size |= (aif_file_data[pos++] <<  8);
		chunk_size |=  aif_file_data[pos++];

		if (strcmp(chunk_name, "COMM") == 0)
		{
			short num_channels = (aif_file_data[pos++] << 8);
			num_channels |= (unsigned char)aif_file_data[pos++];
			if (num_channels != 1)
			{
				FATAL_ERROR("numChannels (%d) in the COMM Chunk must be 1!\n", num_channels);
			}

			num_sample_frames =  (aif_file_data[pos++] << 24);
			num_sample_frames |= (aif_file_data[pos++] << 16);
			num_sample_frames |= (aif_file_data[pos++] <<  8);
			num_sample_frames |=  (unsigned char)aif_file_data[pos++];

			short sample_size = (aif_file_data[pos++] << 8);
			sample_size |= (unsigned char)aif_file_data[pos++];
			if (sample_size != 8)
			{
				FATAL_ERROR("sampleSize (%d) in the COMM Chunk must be 8!\n", sample_size);
			}

			double sample_rate = ieee754_read_extended((unsigned char*)(aif_file_data + pos));
			pos += 10;

			aif_data->sample_rate = sample_rate;
		}
		else if (strcmp(chunk_name, "MARK") == 0)
		{
			unsigned short num_markers = (aif_file_data[pos++] << 8);
			num_markers |= (unsigned char)aif_file_data[pos++];

			unsigned long loop_start = 0;

			// Read each marker and look for the "START" marker.
			for (int i = 0; i < num_markers; i++)
			{
				unsigned short marker_id = (aif_file_data[pos++] << 8);
				marker_id |= (unsigned char)aif_file_data[pos++];

				unsigned long marker_position = (aif_file_data[pos++] << 24);
				marker_position |= (aif_file_data[pos++] << 16);
				marker_position |= (aif_file_data[pos++] << 8);
				marker_position |=  (unsigned char)aif_file_data[pos++];

				// Marker id is a pascal-style string.
				unsigned char marker_name_size = aif_file_data[pos++];
				char *marker_name = (char *)malloc((marker_name_size + 1) * sizeof(char));
				memcpy(marker_name, aif_file_data + pos, marker_name_size);
				marker_name[marker_name_size] = '\0';
				pos += marker_name_size;

				if (strcmp(marker_name, "START") == 0)
				{
					loop_start = marker_position;
				}
				else if (strcmp(marker_name, "END") == 0)
				{
					aif_data->num_samples = marker_position;
				}

				free(marker_name);
			}

			aif_data->loop_offset = loop_start;
		}
		else if (strcmp(chunk_name, "INST") == 0)
		{
			unsigned char midi_note = (unsigned char)aif_file_data[pos++];

			aif_data->midi_note = midi_note;

			// Skip over data we don't need.
			pos += 19;
		}
		else if (strcmp(chunk_name, "SSND") == 0)
		{
			// SKip offset and blockSize
			pos += 8;

			char *sample_data = (char *)malloc(num_sample_frames * sizeof(char));
			memcpy(sample_data, aif_file_data + pos, num_sample_frames);

			aif_data->samples = sample_data;
			pos += num_sample_frames;
		}
		else
		{
			// Skip over stuff we unsupported chunks.
			pos += chunk_size;
		}
	}

	return aif_data;
}

// Reads an .aif file and produces a .pcm file containing an array of 8-bit samples.
void aif2pcm(const char *aif_filename)
{
	// Get .pcm filename.
	char *pcm_filename = malloc(strlen(aif_filename) + 1);

	if (!pcm_filename)
	{
		FATAL_ERROR("Failed to allocate space for pcm filename.\n");
	}

	strcpy(pcm_filename, aif_filename);
	change_file_extension(pcm_filename, "pcm");

	// Get .metadata filename.
	char *metadata_filename = malloc(strlen(aif_filename) + 1);

	if (!metadata_filename)
	{
		FATAL_ERROR("Failed to allocate space for metadata filename.\n");
	}

	strcpy(metadata_filename, aif_filename);
	change_file_extension(metadata_filename, "bin");

	// Open the given .aif file so we can read its contents.
	FILE *aif_file;
	aif_file = fopen(aif_filename, "rb");
	if (!aif_file)
	{
		FATAL_ERROR("Failed to open '%s' for reading!\n", aif_filename);
	}

	// Get file length.
	fseek(aif_file, 0, SEEK_END);
	unsigned long aif_file_length = ftell(aif_file);
	fseek(aif_file, 0, SEEK_SET);

	// Create buffer for samples.
	char *aif_file_data = (char *)malloc(aif_file_length * sizeof(char));
	if (!aif_file_data)
	{
		FATAL_ERROR("Failed to allocate buffer for aif file data!\n");
	}

	// Populate buffer from file.
	unsigned long read = fread(aif_file_data, aif_file_length, 1, aif_file);
	fclose(aif_file);
	if (read <= 0)
	{
		FATAL_ERROR("Failed to read data from '%s'!\n", aif_filename);
	}

	AifData *aif_data = read_aif(aif_file_data, aif_file_length);

	// Write the output .pcm file
	FILE *pcm_file;
	pcm_file = fopen(pcm_filename, "wb");
	fwrite(aif_data->samples, aif_data->num_samples, 1, pcm_file);
	fclose(pcm_file);

	// Write the output .bin file containing .aif metadata.
	FILE *metadata_file;
	metadata_file = fopen(metadata_filename, "wb");
	uint32_t pitch_adjust = (uint32_t)(aif_data->sample_rate * 1024);
	fwrite(&pitch_adjust, sizeof(uint32_t), 1, metadata_file);
	fwrite(&(aif_data->loop_offset), sizeof(uint32_t), 1, metadata_file);
	uint32_t adjusted_num_samples = (uint32_t)(aif_data->num_samples - 1);
	fwrite(&adjusted_num_samples, sizeof(uint32_t), 1, metadata_file);
	fclose(metadata_file);

	free(aif_data->samples);
	free(aif_data);
	free(aif_file_data);
	free(metadata_filename);
	free(pcm_filename);
}

// Reads a .pcm file containing an array of 8-bit samples and produces an .aif file.
// See http://www-mmsp.ece.mcgill.ca/documents/audioformats/aiff/Docs/AIFF-1.3.pdf for .aif file specification.
void pcm2aif(const char *pcm_filename, char base_note, long pitch_adjust, long loop_start)
{
	// Get .aif filename.
	char *aif_filename = malloc(strlen(pcm_filename) + 1);

	if (!aif_filename)
	{
		FATAL_ERROR("Failed to allocate space for aif filename.\n");
	}

	strcpy(aif_filename, pcm_filename);
	change_file_extension(aif_filename, "aif");

	// Open the given .pcm file so we can read its 8-bit samples.
	FILE *pcm_file;
	pcm_file = fopen(pcm_filename, "rb");
	if (!pcm_file)
	{
		FATAL_ERROR("Failed to open '%s' for reading!\n", pcm_filename);
	}

	// Get file length.
	fseek(pcm_file, 0, SEEK_END);
	unsigned long num_samples = ftell(pcm_file);
	fseek(pcm_file, 0, SEEK_SET);

	unsigned long num_samples_extended = num_samples * 1;

	// Create buffer for samples.
	signed char *pcm_samples = (signed char *)malloc(num_samples_extended * sizeof(signed char));
	if (!pcm_samples)
	{
		FATAL_ERROR("Failed to allocate buffer for pcm samples!\n");
	}

	// Populate buffer from file.
	unsigned long read = fread(pcm_samples, num_samples, 1, pcm_file);
	fclose(pcm_file);
	if (read <= 0)
	{
		FATAL_ERROR("Failed to read data from '%s'!\n", pcm_filename);
	}

	// Allocate buffer for output .aif file.
	unsigned long aif_file_size = 54 + 60 + num_samples_extended;
	char *aif_buffer = (char *)malloc(aif_file_size * sizeof(char));
	if (!aif_buffer)
	{
		FATAL_ERROR("Failed to allocate buffer for aif file!\n");
	}

	long pos = 0;

	// First, write the FORM header chunk.
	// FORM Chunk ckID
	aif_buffer[pos++] = 'F';
	aif_buffer[pos++] = 'O';
	aif_buffer[pos++] = 'R';
	aif_buffer[pos++] = 'M';

	// FORM Chunk ckSize
	unsigned long data_size = aif_file_size - 8;
	aif_buffer[pos++] = ((data_size >> 24) & 0xFF);
	aif_buffer[pos++] = ((data_size >> 16) & 0xFF);
	aif_buffer[pos++] = ((data_size >>  8) & 0xFF);
	aif_buffer[pos++] = (data_size & 0xFF);

	// FORM Chunk formType
	aif_buffer[pos++]  = 'A';
	aif_buffer[pos++]  = 'I';
	aif_buffer[pos++] = 'F';
	aif_buffer[pos++] = 'F';

	// Next, write the Common Chunk
	// Common Chunk ckID
	aif_buffer[pos++] = 'C';
	aif_buffer[pos++] = 'O';
	aif_buffer[pos++] = 'M';
	aif_buffer[pos++] = 'M';

	// Common Chunk ckSize
	aif_buffer[pos++] = 0;
	aif_buffer[pos++] = 0;
	aif_buffer[pos++] = 0;
	aif_buffer[pos++] = 18;

	// Common Chunk numChannels
	aif_buffer[pos++] = 0;
	aif_buffer[pos++] = 1;  // 1 channel

	// Common Chunk numSampleFrames
	aif_buffer[pos++] = ((num_samples_extended >> 24) & 0xFF);
	aif_buffer[pos++] = ((num_samples_extended >> 16) & 0xFF);
	aif_buffer[pos++] = ((num_samples_extended >> 8)  & 0xFF);
	aif_buffer[pos++] = (num_samples_extended & 0xFF);

	// Common Chunk sampleSize
	aif_buffer[pos++] = 0;
	aif_buffer[pos++] = 8;  // 8 bits per sample

	// Common Chunk sampleRate
	double sample_rate = pitch_adjust / 1024.0;
	unsigned char sample_rate_buffer[10];
	ieee754_write_extended(sample_rate, sample_rate_buffer);
	for (int i = 0; i < 10; i++)
	{
		aif_buffer[pos++] = sample_rate_buffer[i];
	}

	// Marker Chunk ckID
	aif_buffer[pos++] = 'M';
	aif_buffer[pos++] = 'A';
	aif_buffer[pos++] = 'R';
	aif_buffer[pos++] = 'K';

	// Marker Chunk ckSize
	aif_buffer[pos++] = 0;
	aif_buffer[pos++] = 0;
	aif_buffer[pos++] = 0;
	aif_buffer[pos++] = 24;

	// Marker Chunk numMarkers
	aif_buffer[pos++] = 0;
	aif_buffer[pos++] = 2;

	// Marker loop start
	aif_buffer[pos++] = 0;
	aif_buffer[pos++] = 1;  // id = 1

	aif_buffer[pos++] = ((loop_start >> 24) & 0xFF);
	aif_buffer[pos++] = ((loop_start >> 16) & 0xFF);
	aif_buffer[pos++] = ((loop_start >> 8)  & 0xFF);
	aif_buffer[pos++] = (loop_start & 0xFF);  // position

	aif_buffer[pos++] = 5;  // pascal-style string length
	aif_buffer[pos++] = 'S';
	aif_buffer[pos++] = 'T';
	aif_buffer[pos++] = 'A';
	aif_buffer[pos++] = 'R';
	aif_buffer[pos++] = 'T';  // markerName

	// Marker loop end
	aif_buffer[pos++] = 0;
	aif_buffer[pos++] = 2;  // id = 2

	long loop_end = num_samples;
	aif_buffer[pos++] = ((loop_end >> 24) & 0xFF);
	aif_buffer[pos++] = ((loop_end >> 16) & 0xFF);
	aif_buffer[pos++] = ((loop_end >> 8)  & 0xFF);
	aif_buffer[pos++] = (loop_end & 0xFF);  // position

	aif_buffer[pos++] = 3;  // pascal-style string length
	aif_buffer[pos++] = 'E';
	aif_buffer[pos++] = 'N';
	aif_buffer[pos++] = 'D';


	// Instrument Chunk ckID
	aif_buffer[pos++] = 'I';
	aif_buffer[pos++] = 'N';
	aif_buffer[pos++] = 'S';
	aif_buffer[pos++] = 'T';

	// Instrument Chunk ckSize
	aif_buffer[pos++] = 0;
	aif_buffer[pos++] = 0;
	aif_buffer[pos++] = 0;
	aif_buffer[pos++] = 20;

	aif_buffer[pos++] = base_note;  // baseNote
	aif_buffer[pos++] = 0;          // detune
	aif_buffer[pos++] = 0;          // lowNote
	aif_buffer[pos++] = 127;        // highNote
	aif_buffer[pos++] = 1;          // lowVelocity
	aif_buffer[pos++] = 127;        // highVelocity
	aif_buffer[pos++] = 0;          // gain (hi)
	aif_buffer[pos++] = 0;          // gain (lo)

	// Instrument Chunk sustainLoop
	aif_buffer[pos++] = 0;
	aif_buffer[pos++] = 1; // playMode = ForwardLooping

	aif_buffer[pos++] = 0;
	aif_buffer[pos++] = 1;  // beginLoop marker id

	aif_buffer[pos++] = 0;
	aif_buffer[pos++] = 2;  // endLoop marker id

		// Instrument Chunk releaseLoop
	aif_buffer[pos++] = 0;
	aif_buffer[pos++] = 1; // playMode = ForwardLooping

	aif_buffer[pos++] = 0;
	aif_buffer[pos++] = 1;  // beginLoop marker id

	aif_buffer[pos++] = 0;
	aif_buffer[pos++] = 2;  // endLoop marker id

	// Finally, write the Sound Data Chunk
	// Sound Data Chunk ckID
	aif_buffer[pos++] = 'S';
	aif_buffer[pos++] = 'S';
	aif_buffer[pos++] = 'N';
	aif_buffer[pos++] = 'D';

	// Sound Data Chunk ckSize
	unsigned long sound_data_size = num_samples_extended + 8;
	aif_buffer[pos++] = ((sound_data_size >> 24) & 0xFF);
	aif_buffer[pos++] = ((sound_data_size >> 16) & 0xFF);
	aif_buffer[pos++] = ((sound_data_size >> 8)  & 0xFF);
	aif_buffer[pos++] = (sound_data_size & 0xFF);

	// Sound Data Chunk offset
	aif_buffer[pos++] = 0;
	aif_buffer[pos++] = 0;
	aif_buffer[pos++] = 0;
	aif_buffer[pos++] = 0;

	// Sound Data Chunk blockSize
	aif_buffer[pos++] = 0;
	aif_buffer[pos++] = 0;
	aif_buffer[pos++] = 0;
	aif_buffer[pos++] = 0;

	// Sound Data Chunk soundData
	for (int i = 0; i < loop_start; i++)
	{
		aif_buffer[pos++] = pcm_samples[i];
	}

	int j = 0;
	for (unsigned int i = loop_start; i < num_samples_extended; i++)
	{
		int pcm_index = loop_start + (j++ % (num_samples - loop_start - 1));
		aif_buffer[pos++] = pcm_samples[pcm_index];
	}

	// Write the .aif file contents.
	FILE *aif_file;
	aif_file = fopen(aif_filename, "wb");
	if (!aif_file)
	{
		FATAL_ERROR("Failed to open '%s' for writing!\n", aif_filename);
	}

	fwrite(aif_buffer, 1, aif_file_size, aif_file);
	fclose(aif_file);

	free(aif_buffer);
	free(pcm_samples);
	free(aif_filename);
}

int main(int argc, char **argv)
{
	if (argc < 2)
	{
		FATAL_ERROR("Usage: aif2pcm <aif_file>\n");
	}

	char *input_filename = argv[1];
	char *extension = get_file_extension(input_filename);

	if (strcmp(extension, "aif") == 0)
	{
		aif2pcm(input_filename);
	}
	else if (strcmp(extension, "pcm") == 0)
	{
		if (argc < 5)
		{
			FATAL_ERROR("Usage: aif2pcm <pcm_file> <midi_note> <pitch_adjust> <loop_start>\n");
		}

		char base_note = atoi(argv[2]);
		long pitch_adjust = atol(argv[3]);
		long loop_start = atol(argv[4]);
		pcm2aif(input_filename, base_note, pitch_adjust, loop_start);
	}
	else
	{
		FATAL_ERROR("Input file must be .aif or .pcm: '%s'\n", input_filename);
	}

	return 0;
}
