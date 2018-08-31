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

#include "c_file.h"

CFile::CFile(std::string &path)
{
    m_path = path;

        FILE *fp;
        if (path.empty() || path == "-")
        {
            m_path = "<stdin>";
            fp = stdin;
        }
        else
        {
            fp = std::fopen(path.c_str(), "rb");
        }

        if (fp == NULL)
            FATAL_ERROR("Failed to open \"%s\" for reading.\n", path.c_str());

        m_size = 0;
        std::vector<char> buf;
        ssize_t count;
        char tmp[1024];
        while ((count = fread(tmp, 1, 1024, fp)) != 0)
        {
            if (ferror(fp))
                FATAL_ERROR("Failed to read \"%s\".\n", path.c_str());

            buf.insert(buf.end(), tmp, tmp + count);

            m_size += count;

            if (feof(fp))
                break;
        }
        if (m_size == 0)
            FATAL_ERROR("Empty input!");
        m_buffer = new char[m_size + 1];
        std::copy(buf.begin(), buf.end(), m_buffer);
        m_buffer[m_size] = 0;

        if (fp != stdin)
            fclose(fp);
    m_pos = 0;
    m_lineNum = 1;
}

CFile::~CFile()
{
    delete[] m_buffer;
}

void CFile::FindIncbins()
{
    char stringChar = 0;

    while (m_pos < m_size)
    {
        if (stringChar)
        {
            if (m_buffer[m_pos] == stringChar)
            {
                m_pos++;
                stringChar = 0;
            }
            else if (m_buffer[m_pos] == '\\' && m_buffer[m_pos + 1] == stringChar)
            {
                m_pos += 2;
            }
            else
            {
                if (m_buffer[m_pos] == '\n')
                    m_lineNum++;
                m_pos++;
            }
        }
        else
        {
            SkipWhitespace();
            CheckInclude();
            CheckIncbin();

            if (m_pos >= m_size)
                break;

            char c = m_buffer[m_pos++];

            if (c == '\n')
                m_lineNum++;
            else if (c == '"')
                stringChar = '"';
            else if (c == '\'')
                stringChar = '\'';
            else if (c == 0)
                FATAL_INPUT_ERROR("unexpected null character");
        }
    }
}

bool CFile::ConsumeHorizontalWhitespace()
{
    if (m_buffer[m_pos] == '\t' || m_buffer[m_pos] == ' ')
    {
        m_pos++;
        return true;
    }

    return false;
}

bool CFile::ConsumeNewline()
{
    if (m_buffer[m_pos] == '\n')
    {
        m_pos++;
        m_lineNum++;
        return true;
    }

    if (m_buffer[m_pos] == '\r' && m_buffer[m_pos + 1] == '\n')
    {
        m_pos += 2;
        m_lineNum++;
        return true;
    }

    return false;
}

bool CFile::ConsumeComment()
{
    if (m_buffer[m_pos] == '/')
    {
        if (m_buffer[m_pos + 1] == '*')
        {
	        m_pos += 2;
	        while (m_buffer[m_pos] != '*' && m_buffer[m_pos + 1] != '/')
	        {
	            if (m_buffer[m_pos] == 0)
	                return false;
	            if (!ConsumeNewline())
	                m_pos++;
	        }
	        m_pos += 2;
	        return true;
        }
        else if (m_buffer[m_pos + 1] == '/')
        {
	        m_pos += 2;
	        while (!ConsumeNewline())
	        {
	            if (m_buffer[m_pos] == 0)
	                return false;
	            m_pos++;
	        }
	        return true;
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
    return (std::strncmp(ident.c_str(), m_buffer + m_pos, ident.length()) == 0);
}

void CFile::CheckInclude()
{
    if (m_buffer[m_pos] != '#')
        return;

    static const std::string ident = "#include";

    if (!CheckIdentifier(ident))
    {
        return;
    }

    m_pos += ident.length();

    ConsumeHorizontalWhitespace();

    std::string path = ReadPath();

    if (!path.empty()) {
        m_includes.emplace(std::move(path));
    }
}

void CFile::CheckIncbin()
{
    if (std::strncmp(m_buffer + m_pos, "INCBIN_", 7) != 0)
    {
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

    long oldPos = m_pos;
    long oldLineNum = m_lineNum;

    m_pos += idents[incbinType].length();

    SkipWhitespace();

    if (m_buffer[m_pos] != '(')
    {
        m_pos = oldPos;
        m_lineNum = oldLineNum;
        return;
    }

    m_pos++;

    SkipWhitespace();

    std::string path = ReadPath();

    SkipWhitespace();

    if (m_buffer[m_pos] != ')')
        FATAL_INPUT_ERROR("expected ')'");

    m_pos++;

    m_incbins.emplace(std::move(path));
}

std::string CFile::ReadPath()
{
    if (m_buffer[m_pos] != '"')
    {
        if (m_buffer[m_pos] == '<')
        {
            return std::string();
        }
        FATAL_INPUT_ERROR("expected '\"' or '<'");
    }

    m_pos++;

    int startPos = m_pos;

    while (m_buffer[m_pos] != '"')
    {
        if (m_buffer[m_pos] == 0)
        {
            if (m_pos >= m_size)
                FATAL_INPUT_ERROR("unexpected EOF in path string");
            else
                FATAL_INPUT_ERROR("unexpected null character in path string");
        }

        if (m_buffer[m_pos] == '\r' || m_buffer[m_pos] == '\n')
            FATAL_INPUT_ERROR("unexpected end of line character in path string");

        if (m_buffer[m_pos] == '\\')
            FATAL_INPUT_ERROR("unexpected escape in path string");

        m_pos++;
    }

    m_pos++;

    return std::string(m_buffer + startPos, m_pos - 1 - startPos);
}
