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

#define _BSD_SOURCE
#define _GNU_SOURCE
#include "formatter.h"
#include "scaninc.h"
#include <set>
#include <string>
#include <cstring>
#include <fstream>

#if defined(__linux__) || defined(__APPLE__)
#define USE_UNIX_IO
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#endif

static bool CanOpenDirectory(const scaninc::string_view &str)
{
#ifdef USE_UNIX_IO
    struct stat dir;
    int status = stat(str.sv_data(), &dir);
    if (status == 0 && S_ISDIR(dir.st_mode))
        return true;
#else
    DIR *dir = opendir(str.sv_data());
    if (dir)
    {
        closedir(dir);
        return true;
    }
#endif
    return false;
}
// Makes directories recursively if needed. C has no mkdir -p.
static void mkdirs_if_needed(const std::string &str)
{
    scaninc::string_view::size_type pos = 0;

    // First, try to short circuit the search.
    if (CanOpenDirectory(str))
        return;
    // Find each directory, check if it exists, and make it if
    // it doesn't.
    // .d/src/ will loop like so:
    // .d/
    // .d/src/
    while ((pos = str.find('/', pos + 1)) != scaninc::string_view::npos)
    {
        const scaninc::string_view depdir = str.substr(0,pos);

        // Open the directory
        if (!CanOpenDirectory(depdir))
        {
            if (errno == ENOENT) // No such file or directory
            {
                // Make the directory, if mkdir fails it returns non-zero
                if (mkdir(depdir.sv_data(), 0755) != 0 && errno != EEXIST)
                {
                    FATAL_ERROR("could not create directory %s: %s!\n", depdir.sv_data(), strerror(errno));
                }
            }
            else // A different error that is much worse.
            {
                FATAL_ERROR("could not open directory %s: %s!\n", depdir.sv_data(), strerror(errno));
            }
        }
    }
}

// Writes a Makefile dependency file in the style of gcc -M format.
void Formatter::WriteMakefile(const scaninc::string_view &depfile, const scaninc::string_view &path, const std::unordered_set<std::string> &dependencies)
{
    // TODO: reduce the iterations
    const std::size_t filename_index = path.find_last_of('/');
    const std::size_t extension_index = path.find_last_of('.');

    const scaninc::string_view basename = path.substr(filename_index + 1, extension_index - filename_index);

    std::string outfile(depfile);

    if (outfile.empty())
    {
        // src/file.c -> .d/src/
        std::string depdir = ".d/";
        depdir += path.substr(0, filename_index);
        depdir += '/';
        // src/file.c -> .d/src/file.Td
        std::string depfile = depdir;
        depfile += basename;
        depfile += "d";

        outfile.assign(depfile);
    }
    // Make depdir if needed.
    mkdirs_if_needed(outfile.substr(0, outfile.find_last_of('/') + 1));

    std::ios_base::sync_with_stdio(false);

    std::ofstream output(outfile);

    // src/file.c -> $(BUILD_DIR)/src/file.o:
    output << "$(BUILD_DIR)/"
           << path.substr(0, extension_index)
           << ".o: ";
    // src/file.c
    output << path;
    output << ' ';
    // Write the dependencies
    for (const auto &dep : dependencies)
    {
        output << " \\\n" << dep;
    }
    output << '\n';

    // Write the phonies
    for (const auto &dep : dependencies)
    {
        output << dep << ":\n";
    }

    output << '\n';
    output.close();
}
