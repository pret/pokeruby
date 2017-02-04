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

#include "c_file.h"

CFile::CFile(std::string path)
{
    m_path = path;

    FILE *fp = fopen(path.c_str(), "rb");

    if (fp == NULL)
        FATAL_ERROR("Failed to open \"%s\" for reading.\n", path.c_str());

    fseek(fp, 0, SEEK_END);

    m_size = ftell(fp);

    m_buffer = new char[m_size + 1];
    m_buffer[m_size] = 0;

    rewind(fp);

    if (fread(m_buffer, m_size, 1, fp) != 1)
        FATAL_ERROR("Failed to read \"%s\".\n", path.c_str());

    fclose(fp);

    m_pos = 0;
    m_lineNum = 1;

    RemoveComments();
}

CFile::~CFile()
{
    delete[] m_buffer;
}

// Removes comments to simplify further processing.
// It stops upon encountering a null character,
// which may or may not be the end of file marker.
// If it's not, the error will be caught later.
void CFile::RemoveComments()
{
    long pos = 0;
    char stringChar = 0;

    for (;;)
    {
        if (m_buffer[pos] == 0)
            return;

        if (stringChar != 0)
        {
            if (m_buffer[pos] == '\\' && m_buffer[pos + 1] == stringChar)
            {
                pos += 2;
            }
            else
            {
                if (m_buffer[pos] == stringChar)
                    stringChar = 0;
                pos++;
            }
        }
        else if (m_buffer[pos] == '/' && m_buffer[pos + 1] == '/')
        {
            while (m_buffer[pos] != '\n' && m_buffer[pos] != 0)
                m_buffer[pos++] = ' ';
        }
        else if (m_buffer[pos] == '/' && m_buffer[pos + 1] == '*')
        {
            m_buffer[pos++] = ' ';
            m_buffer[pos++] = ' ';

            for (;;)
            {
                if (m_buffer[pos] == 0)
                    return;

                if (m_buffer[pos] == '*' && m_buffer[pos + 1] == '/')
                {
                    m_buffer[pos++] = ' ';
                    m_buffer[pos++] = ' ';
                    break;
                }
                else
                {
                    if (m_buffer[pos] != '\n')
                        m_buffer[pos] = ' ';
                    pos++;
                }
            }
        }
        else
        {
            if (m_buffer[pos] == '"' || m_buffer[pos] == '\'')
                stringChar = m_buffer[pos];
            pos++;
        }
    }
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
    if (m_buffer[m_pos] == '\r' && m_buffer[m_pos + 1] == '\n')
    {
        m_pos += 2;
        m_lineNum++;
        return true;
    }

    if (m_buffer[m_pos] == '\n')
    {
        m_pos++;
        m_lineNum++;
        return true;
    }

    return false;
}

void CFile::SkipWhitespace()
{
    while (ConsumeHorizontalWhitespace() || ConsumeNewline())
        ;
}

bool CFile::CheckIdentifier(const std::string& ident)
{
    unsigned int i;

    for (i = 0; i < ident.length() && m_pos + i < (unsigned)m_size; i++)
        if (ident[i] != m_buffer[m_pos + i])
            return false;

    return (i == ident.length());
}

std::unique_ptr<unsigned char[]> CFile::ReadWholeFile(const std::string& path, int& size)
{
    FILE* fp = fopen(path.c_str(), "rb");

    if (fp == nullptr)
        FATAL_INPUT_ERROR("Failed to open \"%s\" for reading.\n", path.c_str());

    fseek(fp, 0, SEEK_END);

    size = ftell(fp);

    std::unique_ptr<unsigned char[]> buffer = std::unique_ptr<unsigned char[]>(new unsigned char[size]);

    rewind(fp);

    if (fread(buffer.get(), size, 1, fp) != 1)
        FATAL_INPUT_ERROR("Failed to read \"%s\".\n", path.c_str());

    fclose(fp);

    return buffer;
}

int ExtractData(const std::unique_ptr<unsigned char[]>& buffer, int offset, int size)
{
    switch (size)
    {
    case 1:
        return buffer[offset];
    case 2:
        return (buffer[offset + 1] << 8)
            | buffer[offset];
    case 4:
        return (buffer[offset + 3] << 24)
            | (buffer[offset + 2] << 16)
            | (buffer[offset + 1] << 8)
            | buffer[offset];
    default:
        FATAL_ERROR("Invalid size passed to ExtractData.\n");
    }
}

void CFile::CheckIncbin()
{
    std::string idents[6] = { "INCBIN_S8", "INCBIN_U8", "INCBIN_S16", "INCBIN_U16", "INCBIN_S32", "INCBIN_U32" };
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

    if (m_buffer[m_pos] != '"')
        FATAL_INPUT_ERROR("expected double quote");

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

    std::string path(&m_buffer[startPos], m_pos - startPos);

    m_pos++;

    SkipWhitespace();

    if (m_buffer[m_pos] != ')')
        FATAL_INPUT_ERROR("expected ')'");

    m_pos++;

    m_incbins.emplace(path);
}
