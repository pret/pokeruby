#ifndef MY_STRING_H
#define MY_STRING_H 1

#include "preproc.h"

#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

// 12/16 bytes
typedef struct string
{
    // C string data
    char *c_str;
    // Length
    unsigned length;
    unsigned capacity;
    // Whether c_str is malloced
    bool dynamic;
    // Whether the struct itself was malloced
    bool heap;
} string;

#define string_literal(str)                                                                        \
    (string[])                                                                                     \
    {                                                                                              \
        { /* c_str    = */ (char *)str, /* length   = */ (unsigned)(sizeof(str) - 1),              \
          /* capacity = */ (unsigned)(sizeof(str) - 1), /* dynamic  = */ false,                    \
          /* heap     = */ false },                                                                \
        {                                                                                          \
            0                                                                                      \
        }                                                                                          \
    }

#define string_tmp_len(str, len)                                                                   \
    (string[])                                                                                     \
    {                                                                                              \
        (string){ str, len, len, false, false }, { 0 }                                             \
    }

inline static string *string_tmp(char *str)
{
    unsigned len = (unsigned)strlen(str);
    return string_tmp_len(str, len);
}

void string_Delete(string *m);
bool string_equal(const string *r str1, const string *r s);
string *string_add(string *r str1, const string *r str2);
string *string_add_char(string *str, unsigned char c);
void string_reserve(string *str, unsigned len);

string *string_New(char *str, unsigned len);
#define string(str, len) string_New(str, len)

#define empty_string() string(NULL, 0)

#endif
