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

#include "scaninc.h"
#include "asm_file.h"


// We can make searching faster by searching for .inc only,
// then checking the matches.
static const std::string inc_pat = ".inc";

void AsmFile::Find()
{
    while ((m_pos = search(m_pos, m_buffer.cend(),
                                SEARCHER(inc_pat.cbegin(), inc_pat.cend())))
           != m_buffer.cend())
    {
        m_pos += 4;

        if (std::equal(m_pos, m_pos + 4, /*.inc*/"lude"))
        {
            m_pos += 4;
            const std::string path = ReadPath();
            if (path.empty())
                continue;
            m_includes.emplace(path);
        }
        else if (std::equal(m_pos, m_pos + 3, /*.inc*/"bin"))
        {
            m_pos += 3;
            const std::string path = ReadPath();
            if (path.empty())
                continue;
            m_incbins.emplace(path);
        }
    }
}
