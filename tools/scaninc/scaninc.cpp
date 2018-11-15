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

static bool CanOpenFile(const scaninc::string_view &filename)
{
    return access(filename.sv_data(), 0) == 0;
}

template <typename T>
void ProcessFile(const scaninc::string_view &output, const scaninc::string_view &initialPath, const std::vector<std::string> &includeDirs)
{
    std::queue<std::string> filesToProcess;
    std::unordered_set<std::string> dependencies;

    filesToProcess.emplace(initialPath);

    while (!filesToProcess.empty())
    {
        T file(filesToProcess.front());
        filesToProcess.pop();
        file.Find();

        for (const auto &incbin : file.GetIncbins())
        {
            dependencies.emplace(incbin);
        }
        for (const auto &include : file.GetIncludes())
        {
            if (CanOpenFile(include))
            {
                bool inserted = dependencies.insert(include).second;
                if (inserted)
                {
                    filesToProcess.emplace(include);
                }
            }
            else
            {
                for (const auto &includeDir : includeDirs)
                {
                    const std::string path = includeDir + include;
                    if (CanOpenFile(path))
                    {
                        bool inserted = dependencies.insert(path).second;
                        if (inserted)
                        {
                            filesToProcess.emplace(path);
                        }
                        break;
                    }
                }
            }
        }
    }
    Formatter::WriteMakefile(output, initialPath, dependencies);

}
const char *const USAGE = "Usage: scaninc [-I INCLUDE_PATH] FILE_PATH\n";

int main(int argc, char **argv)
{
    std::vector<std::string> includeDirs;
    scaninc::string_view output;

    argc--;
    argv++;

    while (argc > 1)
    {
        if (argv[0][0] == '-')
        {
            if (argv[0][1] == 'I')
            {
                std::string includeDir;
                if (argv[0][2] == '\0')
                {
                    argc--;
                    argv++;
                    includeDir.assign(argv[0]);
                }
                else
                {
                    includeDir.assign(argv[0] + 2);
                }

                if (includeDir.back() != '/')
                {
                    includeDir += '/';
                }
                includeDirs.emplace_back(includeDir);
            }
            else if (argv[0][1] == 'o' && argc > 2)
            {
                output = argv[1];
            }
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

    const scaninc::string_view initialPath(argv[0]);

    std::size_t pos = initialPath.find_last_of('.');

    if (pos == scaninc::string_view::npos)
        FATAL_ERROR("no file extension in path \"%s\"\n", initialPath.sv_data());

    const scaninc::string_view extension = initialPath.substr(pos + 1);

    std::string srcDir;
    std::size_t slash = initialPath.rfind('/');
    if (slash != scaninc::string_view::npos)
    {
        srcDir = initialPath.substr(0, slash + 1);
    }
    includeDirs.emplace_back(std::move(srcDir));

    if (extension == "c" || extension == "h")
    {
        ProcessFile<CFile>(output, initialPath, includeDirs);
    }
    else if (extension == "s" || extension == "inc")
    {
        ProcessFile<AsmFile>(output, initialPath, includeDirs);
    }
    else
    {
        FATAL_ERROR("unknown extension \"%s\"\n", extension.sv_data());
    }

    return 0;
}
