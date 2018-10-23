// Copyright(c) 2017 YamaArashi
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
#include <sys/types.h>
#include <sys/stat.h>
#include <vector>
#include <algorithm>
#include <cstring>
#include <unistd.h>

#include "c_file.h"

bool CFile::NextLine()
{
    ssize_t len;
    // Avoid empty lines too, don't waste the time.
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

CFile::CFile(std::string &path)
{
    m_path = path;
    if (path.empty() || path == "-")
    {
        m_path = "<stdin>";
        m_fp = stdin;
    }
    else
    {
        m_fp = std::fopen(path.c_str(), "rb");
    }

    if (m_fp == nullptr)
        FATAL_ERROR("Could not open file!");

    m_size = 0;
    m_pos = 0;
    NextLine();
}

CFile::~CFile()
{
    if (m_fp != stdin)
        fclose(m_fp);
}

void CFile::FindIncbins()
{
    m_pos = 0;
    const char *match;
    do {
        // TODO: # include
        if ((match = strstr(&g_buffer[m_pos], "#include")) != NULL)
        {
            m_pos = (match - g_buffer);
            CheckInclude();
        }
        else
        {
            while ((match = strstr(&g_buffer[m_pos], "INCBIN_")) != NULL)
            {
                m_pos = (match - g_buffer);
                CheckIncbin();
            }
        }
    } while (NextLine());
}

bool CFile::StrChr(char pattern)
{
    char *str = nullptr;
    while ((str = strchr(&g_buffer[m_pos], pattern)) == nullptr)
    {
        if (!NextLine())
            return false;
    }
    m_pos = str - g_buffer;
    return true;
}

bool CFile::StrStr(const char *pattern)
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

bool CFile::ConsumeHorizontalWhitespace()
{
//    if (PeekChar() != '\t' && PeekChar() != ' ')
//        return false;
    size_t length = strspn(&g_buffer[m_pos], "\t ");
    if (length == 0)
        return false;

    Advance((int)length);

    return true;
}

bool CFile::ConsumeNewline()
{
    if (PeekChar() == '\n')
    {
        Advance();
        return true;
    }

    if (PeekChar() == '\r' && PeekChar(2) == '\n')
    {
        Advance(2);
        return true;
    }

    return false;
}

bool CFile::ConsumeComment()
{
    if (PeekChar(1) == '/')
    {
        if (PeekChar(2) == '*')
        {
            Advance(2);
            if (!StrStr("*/"))
            {
                FATAL_ERROR("Unterminated block comment");
            }
            return true;
        }
        else if (PeekChar(1) == '/')
        {
            return NextLine();
        }
    }

    return false;
}

void CFile::SkipWhitespace()
{
    while (ConsumeHorizontalWhitespace() || ConsumeNewline() || ConsumeComment())
        ;
}

bool CFile::CheckIdentifier(const std::string& ident)
{
    return (std::strncmp(ident.c_str(), g_buffer + m_pos, ident.length()) == 0);
}

void CFile::CheckInclude()
{
    if (PeekChar() != '#')
        return;

    static const std::string ident = "#include";

    if (!CheckIdentifier(ident))
    {
        return;
    }

    Advance(ident.length());

    ConsumeHorizontalWhitespace();

    std::string path = ReadPath();
    if (!path.empty()) {
        m_includes.emplace(std::move(path));
    }
}

void CFile::CheckIncbin()
{
    if (std::strncmp(g_buffer + m_pos, "INCBIN_", 7) != 0 || !std::strncmp(g_buffer, "#define ", 7))
    {
        Advance();
        return;
    }

    static const std::string idents[6] = { "INCBIN_S8", "INCBIN_U8", "INCBIN_S16", "INCBIN_U16", "INCBIN_S32", "INCBIN_U32" };
    int incbinType = -1;

    for (int i = 0; i < 6; i++)
    {
        if (CheckIdentifier(idents[i]))
        {
            incbinType = i;
            break;
        }
    }

    if (incbinType == -1)
        return;

    Advance(idents[incbinType].length());

    SkipWhitespace();

    if (PeekChar() != '(')
    {
        return;
    }

    Advance();

    while (true)
    {
        SkipWhitespace();

        std::string path = ReadPath();

        SkipWhitespace();

        m_incbins.emplace(path);

        if (PeekChar() != ',')
            break;

        Advance();
    }

    if (PeekChar() != ')')
        FATAL_INPUT_ERROR("expected ')'");
    Advance();
}

std::string CFile::ReadPath()
{
    if (PeekChar() != '"')
    {
        if (PeekChar() == '<')
        {
            return std::string();
        }
        FATAL_INPUT_ERROR("expected '\"' or '<'");
    }

    Advance(1);

    int startPos = m_pos;

    // Only on a single line, don't auto advance
    const char *endquote = strchr(&g_buffer[m_pos], '"');
    const char *bad = strpbrk(&g_buffer[m_pos], "\r\n\\");

    if (endquote == nullptr || endquote <= &g_buffer[m_pos])
    {
        FATAL_INPUT_ERROR("expected ending quote in path string");
    }
    // if anything matched by strpbrk comes before endquote
    else if (bad != nullptr && bad < endquote)
    {
        if (bad[0] == '\r' || bad[0] == '\n')
            FATAL_INPUT_ERROR("unexpected end of line character in path string");
        else
            FATAL_INPUT_ERROR("unexpected escape in path string");
    }

    std::string str(&g_buffer[startPos], endquote - &g_buffer[startPos]);
    Advance(endquote - &g_buffer[m_pos] + 1);
    return str;
}
