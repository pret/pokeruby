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

#ifndef ASM_FILE_H
#define ASM_FILE_H

#include <string>
#include <string.h>
#include "scaninc.h"

enum class IncDirectiveType
{
    None,
    Include,
    Incbin
};

class AsmFile
{
public:
    AsmFile(std::string &path);
    ~AsmFile();
    IncDirectiveType GetNextIncDirective(std::string &path);

private:
    int m_pos;
    int m_size;
    std::string m_path;
    FILE *m_fp;

    inline void Advance(int amount = 1)
    {
        if (m_pos + amount >= m_size)
        {
            m_pos = (m_pos + m_size - amount);
            NextLine();
        }
        else
        {
            m_pos += amount;
        }
    }

    inline char GetChar()
    {
        if ((g_buffer == nullptr || m_pos + 1 >= m_size) && !NextLine())
            return -1;
        return g_buffer[m_pos++];
    }

    inline char PeekChar()
    {
        if (g_buffer == nullptr || m_pos + 1 >= m_size)
            return -1;

        return g_buffer[m_pos];
    }

    void SkipTabsAndSpaces()
    {
        while (PeekChar() == '\t' || PeekChar() == ' ')
            Advance();
    }

    bool MatchIncDirective(const char *directiveName, std::string &path)
    {
        int tmp = m_pos + strlen(directiveName) + 1;
        if (tmp >= m_size)
            return false;

        m_pos = tmp;

        SkipTabsAndSpaces();

        if (GetChar() != '"')
            FATAL_INPUT_ERROR("no path after \"%s\" directive\n", directiveName);

        path = ReadPath();

        return true;
    }

    std::string ReadPath();
    void SkipEndOfLineComment();
    void SkipMultiLineComment();
    void SkipString();
    bool NextLine();
    bool StrStr(const char *pattern);

};

#endif // ASM_FILE_H
