// Copyright(c) 2016 YamaArashi
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

#include <cstdio>
#include <cstdarg>
#include "preproc.h"
#include "c_file.h"
#include "char_util.h"
#include "utf8.h"
#include "string_parser.h"

CFile::CFile(std::string filename) : m_filename(filename)
{
    FILE *fp = std::fopen(filename.c_str(), "rb");

    if (fp == NULL)
        FATAL_ERROR("Failed to open \"%s\" for reading.\n", filename.c_str());

    std::fseek(fp, 0, SEEK_END);

    m_size = std::ftell(fp);

    if (m_size < 0)
        FATAL_ERROR("File size of \"%s\" is less than zero.\n", filename.c_str());

    m_buffer = new char[m_size + 1];

    std::rewind(fp);

    if (std::fread(m_buffer, m_size, 1, fp) != 1)
        FATAL_ERROR("Failed to read \"%s\".\n", filename.c_str());

    m_buffer[m_size] = 0;

    std::fclose(fp);

    m_pos = 0;
    m_lineNum = 1;
}

CFile::CFile(CFile&& other) : m_filename(std::move(other.m_filename))
{
    m_buffer = other.m_buffer;
    m_pos = other.m_pos;
    m_size = other.m_size;
    m_lineNum = other.m_lineNum;

    other.m_buffer = nullptr;
}

CFile::~CFile()
{
    delete[] m_buffer;
}

void CFile::Preproc()
{
    bool inConcatMode = false;
    char stringChar = 0;

    while (m_pos < m_size)
    {
        if (stringChar)
        {
            if (m_buffer[m_pos] == stringChar)
            {
                std::putchar(stringChar);
                m_pos++;
                stringChar = 0;
            }
            else if (m_buffer[m_pos] == '\\' && m_buffer[m_pos + 1] == stringChar)
            {
                std::putchar('\\');
                std::putchar(stringChar);
                m_pos += 2;
            }
            else
            {
                std::putchar(m_buffer[m_pos]);
                m_pos++;
            }
        }
        else
        {
            if (inConcatMode ? m_buffer[m_pos] == '"'
                             : m_buffer[m_pos] == '_' && m_buffer[m_pos + 1] == '"')
            {
                if (!inConcatMode)
                    m_pos++; // skip past underscore

                unsigned char s[kMaxStringLength];
                int length;
                StringParser stringParser(m_buffer, m_size);

                try
                {
                    m_pos += stringParser.ParseString(m_pos, s, length);
                }
                catch (std::runtime_error e)
                {
                    RaiseError(e.what());
                }

                if (!inConcatMode)
                {
                    std::printf("{ ");
                }

                inConcatMode = true;

                for (int i = 0; i < length; i++)
                    printf("0x%02X, ", s[i]);
            }
            else
            {
                char c = m_buffer[m_pos++];

                if (c == '\r')
                {
                    if (m_buffer[m_pos] == '\n')
                    {
                        m_pos++;
                    }

                    c = '\n';
                }

                if ((c != ' ' && c != '\t' && c != '\n') && inConcatMode)
                {
                    std::printf("0xFF }");
                    inConcatMode = false;
                }

                std::putchar(c);

                if (c == '\n')
                    m_lineNum++;
                else if (c == '"')
                    stringChar = '"';
                else if (m_buffer[m_pos] == '\'')
                    stringChar = '\'';
            }
        }
    }

    if (inConcatMode)
    {
        printf("0xFF }");
        RaiseWarning("string at end of file");
    }
}

// Reports a diagnostic message.
void CFile::ReportDiagnostic(const char* type, const char* format, std::va_list args)
{
    const int bufferSize = 1024;
    char buffer[bufferSize];
    std::vsnprintf(buffer, bufferSize, format, args);
    std::fprintf(stderr, "%s:%ld: %s: %s\n", m_filename.c_str(), m_lineNum, type, buffer);
}

#define DO_REPORT(type)                   \
do                                        \
{                                         \
    std::va_list args;                    \
    va_start(args, format);               \
    ReportDiagnostic(type, format, args); \
    va_end(args);                         \
} while (0)

// Reports an error diagnostic and terminates the program.
void CFile::RaiseError(const char* format, ...)
{
    DO_REPORT("error");
    std::exit(1);
}

// Reports a warning diagnostic.
void CFile::RaiseWarning(const char* format, ...)
{
    DO_REPORT("warning");
}
