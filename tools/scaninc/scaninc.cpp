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
#include <cstdlib>
#include <list>
#include <queue>
#include <set>
#include <string>
#include "scaninc.h"
#include "asm_file.h"
#include "c_file.h"
#include "formatter.h"

#ifdef _WIN32
   #include <io.h>
   #define access    _access_s
#else
   #include <unistd.h>
#endif

char *g_buffer = nullptr;
size_t m_bufsize = 0;

/*
bool CanOpenFile(std::string &path)
{
    FILE *fp = std::fopen(path.c_str(), "rb");

    if (fp == NULL)
        return false;

    std::fclose(fp);
    return true;
}
*/

static bool CanOpenFile(const std::string &filename)
{
    return access(filename.c_str(), 0) == 0;
}

const char *const USAGE = "Usage: scaninc [-I INCLUDE_PATH] FILE_PATH\n";

int main(int argc, char **argv)
{
    std::queue<std::string> filesToProcess;
    std::set<std::string> dependencies;

    std::list<std::string> includeDirs;

    argc--;
    argv++;

    while (argc > 1)
    {
        if (argv[0][0] == '-' && argv[0][1] == 'I')
        {
            std::string includeDir = std::string(argv[0] + 2);
            if (includeDir.empty())
            {
                argc--;
                argv++;
                includeDir = std::string(argv[0]);
            }
            if (includeDir.back() != '/')
            {
                includeDir += '/';
            }
            includeDirs.emplace_back(std::move(includeDir));
        }
        else
        {
            FATAL_ERROR(USAGE);
        }
        argc--;
        argv++;
    }

    if (argc != 1) {
        FATAL_ERROR(USAGE);
    }

    std::string initialPath(argv[0]);

    std::size_t pos = initialPath.find_last_of('.');

    if (pos == std::string::npos)
        FATAL_ERROR("no file extension in path \"%s\"\n", initialPath.c_str());

    std::string extension = initialPath.substr(pos + 1);

    std::string srcDir;
    std::size_t slash = initialPath.rfind('/');
    if (slash != std::string::npos)
    {
        srcDir = initialPath.substr(0, slash + 1);
    }
    includeDirs.emplace_back(std::move(srcDir));

    // getline expects the pointer to be allocated with malloc
    g_buffer = (char *)malloc(128);
    m_bufsize = 128;

    if (extension == "c" || extension == "h")
    {
        filesToProcess.push(initialPath);

        while (!filesToProcess.empty())
        {
            CFile file(filesToProcess.front());
            filesToProcess.pop();

            file.FindIncbins();

            for (const auto &incbin : file.GetIncbins())
            {
                dependencies.emplace(std::move(incbin));
            }
            for (const auto &include : file.GetIncludes())
            {
                for (const auto &includeDir : includeDirs)
                {
                    std::string path(includeDir + include);
                    if (CanOpenFile(path))
                    {
                        bool inserted = dependencies.insert(path).second;
                        if (inserted)
                        {
                            filesToProcess.emplace(std::move(path));
                        }
                        break;
                    }
                }
            }
        }
    }
    else if (extension == "s" || extension == "inc")
    {
        filesToProcess.emplace(initialPath);

        while (!filesToProcess.empty())
        {
            AsmFile file(filesToProcess.front());

            filesToProcess.pop();
            IncDirectiveType type;
            std::string path;

            while ((type = file.GetNextIncDirective(path)) != IncDirectiveType::None)
            {
                bool inserted = dependencies.insert(path).second;
                if (inserted
                    && type == IncDirectiveType::Include
                    && CanOpenFile(path))
                    filesToProcess.emplace(std::move(path));
            }
        }
    }
    else
    {
        FATAL_ERROR("unknown extension \"%s\"\n", extension.c_str());
    }

    free(g_buffer);

    Formatter formatter;
    formatter.WriteMakefile(initialPath, dependencies);
    return 0;
}
