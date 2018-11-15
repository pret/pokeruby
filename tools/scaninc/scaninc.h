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

#ifndef SCANINC_H
#define SCANINC_H

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <algorithm>
#include <unordered_set>
#include <mio/mmap.hpp>
#include <string>
#include <type_traits>

#if __cplusplus >= 201701L &&  __has_include(<string_view>) && !defined(FORCE_NO_SV)
#include <string_view>
#define USE_STRING_VIEW
#define sv_data data
namespace scaninc
{
    using string_view = std::string_view;
}
#else
namespace scaninc
{
    using string_view = std::string;
}
#define sv_data c_str
#endif

#if defined(__cpp_lib_boyer_moore_searcher) && !defined(USE_STRING_H)
#define SEARCHER(begin, end) std::boyer_moore_searcher((begin), (end))
#else
#define SEARCHER(begin, end) (begin), (end)
#endif
namespace scaninc
{
#ifdef USE_STRING_H
template <typename Iterator1>
const char *memmem_(const char *p1, size_t n1, Iterator1 needle, size_t n2) {

	const char *p2 = &(*needle);
    if (n2 == 0)
        return p1;
    if (n2 > n1)
        return nullptr;
    const char *p3 = p1 + n1 - n2 + 1;
    for (const char *p = p1; (p = static_cast<const char *>(memchr(p, *p2, p3 - p))) != nullptr; p++) {
        if (!memcmp(p, p2, n2))
            return p;
    }

    return nullptr;
}

template <typename Iterator>
static inline Iterator find(Iterator _begin, Iterator _end, const char c)
{
	const char *match = static_cast<Iterator>(
			std::memchr(_begin, c, _end - _begin)
	);
	
	return (match != nullptr ? match : _end);
}

template <typename Iterator, typename IteratorOrPtr>
static inline Iterator search(Iterator _begin, Iterator _end,
							IteratorOrPtr _s_begin, IteratorOrPtr _s_end)
{
	const Iterator match = static_cast<Iterator>(
			memmem(_begin, _end - _begin, (const void *)&(*_s_begin), _s_end - _s_begin)
	);

	return (match != nullptr ? match : _end);
}

template <typename Iterator, size_t N>
static inline constexpr Iterator search(Iterator _begin, Iterator _end, const char (&str)[N])
{
	return search(_begin, _end, &str[0], &str[N]);
}

template <size_t accept_len>
static inline const char *mempbrkm_(const char  *data, size_t len, const char *accept)
{
	size_t i, j;

	for (i = 0; i < len; i++)
		for (j = 0; j < accept_len; j++)
			if (accept[j] == data[i])
				return &data[i];
	return nullptr;
}

template <size_t accept_len>
static inline const char *memcpbrkm_(const char  *data, size_t len, const char *accept)
{
	size_t i, j;
	for (i = 0; i < len; i++) {
		bool found = false;
		for (j = 0; j < accept_len; j++)
		{
			if (accept[j] == data[i])
				found = true;
		}
		if (!found)
			 return &data[i];
	}
	return nullptr;
}
template <typename Iterator, size_t N>
static inline Iterator find_if_not(Iterator _begin, Iterator _end, const char (&str)[N])
{
	const char *match = memcpbrkm_<N>(_begin, _end - _begin, str);

	return (match != nullptr ? match : _end);
}

template <typename Iterator, size_t N>
static inline Iterator find_if(Iterator _begin, Iterator _end, const char (&str)[N])
{
	if (N < 2) return find<Iterator>(_begin, _end, str[0]);
	const char *match = mempbrkm_<N>(_begin, _end - _begin , str);

	return (match != nullptr ? match : _end);
}

#else
using std::search;
using std::find;
template <typename Iterator, size_t N>
static inline Iterator find_if(Iterator _begin, Iterator _end, const char (&string)[N])
{
#ifdef USE_STRING_VIEW
    auto i = scaninc::string_view(_begin, _end - _begin).find_first_of(string);
	return i != scaninc::string_view::npos ? _begin + i : _end;
#else
	return std::find_if(_begin, _end, [=] (const uint8_t c) {

	for (size_t j = 0; j < N; ++j)
		if (string[j] == c)
		        return true;
	    return false;
    });
#endif
}

template <typename Iterator, size_t N>
static inline Iterator find_if_not(Iterator _begin, Iterator _end, const char (&string)[N])
{
#ifdef USE_STRING_VIEW
	auto i = scaninc::string_view(_begin, _end - _begin).find_first_not_of(string);
	return i != scaninc::string_view::npos ? _begin + i : _end;
#else
	return std::find_if_not(_begin, _end, [=] (const uint8_t c) {

	for (size_t j = 0; j < N; ++j)
		if (string[j] == c)
			return true;
	return false;
});
#endif
}
#endif
} // namespace scaninc
#ifdef _MSC_VER

#define FATAL_INPUT_ERROR(format, ...)                                        \
do {                                                                          \
    fprintf(stderr, "%s: " format, m_path.c_str(), __VA_ARGS__);              \
    exit(1);                                                                  \
} while (0)

#define FATAL_ERROR(format, ...)          \
do {                                      \
    fprintf(stderr, format, __VA_ARGS__); \
    exit(1);                              \
} while (0)

#else

#define FATAL_INPUT_ERROR(format, ...)                                          \
do {                                                                            \
    fprintf(stderr, "%s: " format, m_path.c_str(), ##__VA_ARGS__);              \
    exit(1);                                                                    \
} while (0)

#define FATAL_ERROR(format, ...)            \
do {                                        \
    fprintf(stderr, format, ##__VA_ARGS__); \
    exit(1);                                \
} while (0)

#endif // _MSC_VER

#define SCANINC_MAX_PATH 255

#endif // SCANINC_H
