// Copyright(c) 2015-2017 YamaArashi
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
#include <string>

#include <vector>
#include <algorithm>
#include <unistd.h>

#include "scaninc.h"
#include "asm_file.h"


bool AsmFile::NextLine()
{
    ssize_t len;
    // Avoid empty lines too, don't waste the time.
    // TODO: std::getline
    while ((len = getline(&g_buffer, &m_bufsize, m_fp)) <= 0)
    {
        if (len < 0)
        {
            m_size = 0;
            m_pos = 0;
            return false;
        }
    }
    m_size = (int)len;
    m_pos = 0;
    return true;
}


AsmFile::AsmFile(std::string &path)
{
    m_path = path;
    if (path.empty() || path == "-")
    {
        path = "<stdin>";
        m_fp = stdin;
    }
    else
    {
        m_fp = std::fopen(path.c_str(), "rb");
    }

    if (m_fp == nullptr)
        FATAL_ERROR("Failed to open \"%s\" for reading.\n", path.c_str());

    m_pos = 0;
    NextLine();
}

AsmFile::~AsmFile()
{
    if (m_fp != stdin)
        fclose(m_fp);
}


bool AsmFile::StrStr(const char *pattern)
{
    char *str = nullptr;
    while ((str = strstr(&g_buffer[m_pos], pattern)) == nullptr)
    {
        if (!NextLine())
            return false;
    }
    m_pos = str - g_buffer;
    return true;
}


IncDirectiveType AsmFile::GetNextIncDirective(std::string &path)
{
    bool str = StrStr(".inc");
    if (str == false)
        return IncDirectiveType::None;

    if (!strncmp(&g_buffer[m_pos], ".include", 8) && MatchIncDirective(".include", path))
        return IncDirectiveType::Include;

    if (!strncmp(&g_buffer[m_pos], ".incbin", 7) && MatchIncDirective(".incbin", path))
        return IncDirectiveType::Incbin;

    return IncDirectiveType::None;
}

std::string AsmFile::ReadPath()
{
    int startPos = m_pos;

    // Only on a single line, don't auto advance
    const char *endquote = strchr(&g_buffer[m_pos], '"');
    const char *bad = strpbrk(&g_buffer[m_pos], "\r\n\\");
    if (endquote == nullptr || endquote <= &g_buffer[m_pos])
    {
        FATAL_INPUT_ERROR("expected ending quote in path string");
    }
    else if (bad != nullptr && bad < endquote)
    {
        if (bad[0] == '\r' || bad[0] == '\n')
            FATAL_INPUT_ERROR("unexpected end of line character in path string");
        else
            FATAL_INPUT_ERROR("unexpected escape in path string");
    }
    else if (endquote - &g_buffer[startPos] >= SCANINC_MAX_PATH)
        FATAL_INPUT_ERROR("path is too long");

    std::string str(&g_buffer[startPos], endquote - &g_buffer[startPos]);
    Advance(endquote - &g_buffer[m_pos] + startPos - 1);
    return str;
}

void AsmFile::SkipEndOfLineComment()
{
    int c;

    do
    {
        c = GetChar();
    } while (c != -1 && c != '\n');
}

void AsmFile::SkipMultiLineComment()
{
    for (;;)
    {
        int c = GetChar();

        if (c == '*')
        {
            if (PeekChar() == '/')
            {
                m_pos++;
                return;
            }
        }
        else if (c == -1)
        {
            return;
        }
    }
}

void AsmFile::SkipString()
{
    for (;;)
    {
        int c = GetChar();

        if (c == '"')
            break;

        if (c == -1)
            FATAL_INPUT_ERROR("unexpected EOF in string\n");

        if (c == '\\')
        {
            c = GetChar();
        }
    }
}
