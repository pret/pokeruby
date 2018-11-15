#ifndef SCANINC_FILE_H
#define SCANINC_FILE_H
#include <cstdio>
#include <cerrno>
#include <vector>
#include <string>
#include "scaninc.h"

#ifdef _WIN32
   #include <io.h>
   #define access    _access_s
#else
   #include <unistd.h>
#endif

enum class FileType { C, Assembly };
template <FileType T>
struct File {
protected:
    const std::string m_path;
    mio::mmap_source m_buffer;
    mio::mmap_source::const_iterator m_pos;

    std::unordered_set<std::string> m_incbins;
    std::unordered_set<std::string> m_includes;

public:
    explicit File(const scaninc::string_view &path) : m_path(path)
    {
        if (path.empty() || path == "-")
        {
            FATAL_ERROR("A normal file is required!");
        }

        std::error_code error;
        m_buffer.map(path, error);

        if (error)
            FATAL_ERROR("Failed to open \"%s\" for reading.\n", path.sv_data());

        m_pos = m_buffer.cbegin();
    }

    const std::unordered_set<std::string>& GetIncbins() const { return m_incbins; }
    const std::unordered_set<std::string>& GetIncludes() const { return m_includes; }

    void Find();
protected:

    inline void Advance(int amount = 1)
    {
        m_pos += amount;
    }

    inline char GetChar()
    {
        if ((m_pos + 1) == m_buffer.cend())
            return '\0';
        return *m_pos++;
    }

    inline char PeekChar(int off = 1) const
    {
        if (m_pos + off == m_buffer.cend())
            return '\0';
        return *(m_pos + off - 1);
    }
    bool ConsumeNewline()
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
    inline bool ConsumeHorizontalWhitespace()
    {
        auto start = m_pos;
        m_pos = scaninc::find_if_not(m_pos, m_buffer.cend(), "\t ");
        return m_pos != start;
    }

    bool ConsumeComment()
    {
        if (PeekChar(1) == '/')
        {
            if (PeekChar(2) == '*')
            {
                Advance(2);
                const scaninc::string_view str = "*/";
                auto match = scaninc::search(m_pos, m_buffer.cend(), SEARCHER(str.cbegin(), str.cend()));
                if (match == m_buffer.cend())
                {
                    FATAL_ERROR("Unterminated block comment");
                }
                m_pos = match;
                return true;
            }
            else if (PeekChar(1) == '/')
            {
                m_pos = scaninc::find(m_pos, m_buffer.cend(), '\n') + 1;
                return true;
            }
        }
        // We also have @ comments in ARM assembly.
        else if (T == FileType::Assembly && PeekChar(1) == '@')
        {
            m_pos = scaninc::find(m_pos, m_buffer.cend(), '\n') + 1;
            return true;
        }

        return false;
    }

    void SkipWhitespace();

    const std::string ReadPath()
    {
        ConsumeHorizontalWhitespace();
        if (PeekChar() != '"')
        {
            // Ignore any errors.
            return std::string();
        }
        auto startPos = ++m_pos;
        auto end = m_pos + SCANINC_MAX_PATH;
        // Only on a single line, don't auto advance
        auto endquote = scaninc::find(m_pos, end, '"');
        auto bad = scaninc::find_if(m_pos, end, "\n\r\\");
        if (endquote == end)
        {
            FATAL_INPUT_ERROR("expected ending quote in path string, or path is too long");
        }
        else if (bad != end && bad < endquote)
        {
            if (*bad == '\r' || *bad == '\n')
                FATAL_INPUT_ERROR("unexpected end of line character in path string");
            else
                FATAL_INPUT_ERROR("unexpected escape in path string");
        }

        const std::string str(startPos, endquote);
        m_pos = endquote + 1;
        return str;
    }
};

#endif // SCANINC_FILE_H
