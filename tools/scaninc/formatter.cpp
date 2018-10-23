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

#include "formatter.h"
#include "scaninc.h"
#include <set>
#include <string>
#include <cstring>

// Makes directories recursively if needed. C has no mkdir -p.
static void mkdirs_if_needed(const std::string &str)
{
    std::string::size_type pos = 0;

    // First, try to short circuit the search.
    DIR *dir = opendir(str.c_str());
    if (dir)
    {
        closedir(dir);
        return;
    }
    // Find each directory, check if it exists, and make it if
    // it doesn't.
    // .d/src/ will loop like so:
    // .d/
    // .d/src/
    while ((pos = str.find('/', pos + 1)) != std::string::npos)
    {
        std::string depdir = str.substr(0,pos);

        // Open the directory
        dir = opendir(depdir.c_str());
        if (!dir)
        {
            if (errno == ENOENT) // No such file or directory
            {
                // Make the directory, if mkdir fails it returns non-zero
                if (mkdir(depdir.c_str(), 0755) != 0 && errno != EEXIST)
                {
                    FATAL_ERROR("could not create directory %s: %s!\n", depdir.c_str(), strerror(errno));
                }
            }
            else // A different error that is much worse.
            {
                FATAL_ERROR("could not open directory %s: %s!\n", depdir.c_str(), strerror(errno));
            }
        }
        else
        {
            closedir(dir);
        }
    }
}

// Manages two buffers, one that has the dependencies and another
// that manages the phony rules.
void Formatter::WriteFilename(const std::string &str)
{
    // Wrap the long lines
    if (line_len + str.length() >= 78)
    {
        line_len = 0;
        // backslashed newline
        targetstream += "\\\n";
    }

    targetstream += str;
    targetstream += ' ';

    line_len += str.length() + 1;

    // Create phony rules, just the source file.
    phonystream += '\n';
    phonystream += str;
    phonystream += ":\n";
}

// Writes a Makefile dependency file in the style of gcc -M format.
void Formatter::WriteMakefile(const std::string &path, const std::set<std::string> &dependencies)
{
    // TODO: reduce the iterations
    const std::size_t filename_index = path.find_last_of('/');
    const std::size_t extension_index = path.find_last_of('.');

    const std::string basename = path.substr(filename_index + 1, extension_index - filename_index);

    // src/file.c -> .d/src/
    std::string depdir = ".d/";
    depdir += path.substr(0, filename_index);
    depdir += '/';
    // src/file.c -> .d/src/file.Td
    std::string depfile = depdir;
    depfile += basename;
    depfile += "d";
    // src/file.c -> $(BUILD_DIR)/src/file.o:
    std::string targetname = "$(BUILD_DIR)/";
    targetname += path.substr(0, extension_index);
    targetname += ".o: ";

    // Make depdir if needed.
    mkdirs_if_needed(depdir);

    FILE *f = std::fopen(depfile.c_str(), "wb");
    if (!f)
    {
        FATAL_ERROR("could not open file %s: %s\n", depfile.c_str(), strerror(errno));
    }

    // $(BUILD_DIR)/src/file.o:
    targetstream += targetname;
    // src/file.c
    targetstream += path;
    targetstream += ' ';

    // Write all the dependencies
    for (const auto &dep : dependencies)
    {
        WriteFilename(dep);
    }

    // Merge the two buffers together
    const std::string output = targetstream + '\n' + phonystream;
    std::fwrite(output.c_str(), output.length(), 1, f);
    if (ferror(f))
    {
        std::fclose(f);
        FATAL_ERROR("could not write to file %s: %s\n", depfile.c_str(), strerror(errno));
    }

    std::fclose(f);
}


