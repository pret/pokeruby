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
#include <vector>
#include <algorithm>
#include <cstring>
#include <array>

#include "c_file.h"

static const scaninc::string_view include = "#include", incbin = "INCBIN_";

void CFile::FindIncludes()
{
    m_pos = m_buffer.cbegin();
    m_pos = scaninc::search(m_pos, m_buffer.cend(), SEARCHER(include.cbegin(), include.cend()));
    for (; m_pos < m_buffer.cend(); m_pos = scaninc::search(m_pos, m_buffer.cend(), SEARCHER(include.cbegin(), include.cend()))) {
        m_pos += include.length();
        CheckInclude();
    }
}

void CFile::FindIncbins()
{
    m_pos = m_buffer.cbegin();
    m_pos = scaninc::search(m_pos, m_buffer.cend(), SEARCHER(incbin.cbegin(), incbin.cend()));
    for (; m_pos < m_buffer.cend(); m_pos = scaninc::search(m_pos, m_buffer.cend(), SEARCHER(incbin.cbegin(), incbin.cend()))) {
        m_pos += incbin.length();
        CheckIncbin();
    }
}

void CFile::Find()
{
    FindIncbins();
    FindIncludes();
}
//
//bool CFile::ConsumeNewline()
//{
//    if (m_buffer[m_pos] == '\n')
//    {
//        m_pos++;
//        m_lineNum++;
//        return true;
//    }
//
//    if (m_buffer[m_pos] == '\r' && m_buffer[m_pos + 1] == '\n')
//    {
//        m_pos += 2;
//        m_lineNum++;
//        return true;
//    }
//
//    return false;
//}
//
//bool CFile::ConsumeComment()
//{
//    if (m_buffer[m_pos] == '/' && m_buffer[m_pos + 1] == '*')
//    {
//        m_pos += 2;
//        while (m_buffer[m_pos] != '*' || m_buffer[m_pos + 1] != '/')
//        {
//            if (m_buffer[m_pos] == 0)
//                return false;
//            if (!ConsumeNewline())
//                m_pos++;
//        }
//        m_pos += 2;
//        return true;
//    }
//    else if (m_buffer[m_pos] == '/' && m_buffer[m_pos + 1] == '/')
//    {
//        m_pos += 2;
//        while (!ConsumeNewline())
//        {
//            if (m_buffer[m_pos] == 0)
//                return false;
//            m_pos++;
//        }
//        return true;
//    }
//
//    return false;
//}

void CFile::SkipWhitespace()
{
    while (ConsumeHorizontalWhitespace() || ConsumeNewline() || ConsumeComment())
        ;
}

bool CFile::CheckIdentifier(const scaninc::string_view& ident)
{
    if (m_pos + ident.length() == m_buffer.cend())
        return false;
    return std::equal(m_pos, m_pos + ident.length(), ident.cbegin());
}

void CFile::CheckInclude()
{
    ConsumeHorizontalWhitespace();

    const std::string path = ReadPath();
    if (!path.empty()) {
        m_includes.emplace(path);
    }
}
static const scaninc::string_view idents[6] = { "S8", "U8", "S16", "U16", "S32", "U32" };

void CFile::CheckIncbin()
{
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

    if (PeekChar() != '(' || PeekChar(2) == '.')
    {
        return;
    }

    Advance();

    while (true)
    {
        SkipWhitespace();
        const std::string path = ReadPath();

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
