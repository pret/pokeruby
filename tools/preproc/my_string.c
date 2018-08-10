#include <stdlib.h>
#include <string.h>
#include "my_string.h"

string *string_New(char *str, unsigned len)
{
    string *m = (string *)malloc(sizeof(string));
    if (len > 0 && str)
    {
        m->c_str = (char *)calloc(1, len + 1);
        m->length = len;
        m->dynamic = true;
        m->heap = true;
        m->capacity = len;
        memcpy(m->c_str, str, len);
        m->c_str[len] = 0;
    }
    else
    {
        m->c_str = (char *)"";
        m->length = 0;
        m->capacity = 1;
        m->dynamic = false;
        m->heap = true;
    }
    return m;
}

void string_Delete(string *m)
{
    if (m->dynamic)
        free(m->c_str);
    if (m->heap)
        free(m);
}

bool string_equal(const string *r str1, const string *r str2)
{
    return (str1->length == str2->length && !memcmp(str1->c_str, str2->c_str, str1->length));
}

string *string_add(string *r str1, const string *r str2)
{
    if (str2->length == 0)
        return str1;

    const unsigned newlen = str1->length + str2->length;

    if (str1->dynamic)
    {
        if (str1->capacity < newlen + 1)
        {
            str1->c_str = (char *)realloc(str1->c_str, newlen + 8);
            if (unlikely(!str1->c_str))
                FATAL_ERROR("string: failed to realloc!\n");
            str1->capacity = newlen * 2 + 1;
        }

        memcpy(&str1->c_str[str1->length], str2->c_str, str2->length);
        str1->c_str[newlen] = 0;
        str1->length = newlen;
    }
    else
    {
        char *buf = (char *)malloc(newlen * 2 + 1);
        memcpy(buf, str1->c_str, str1->length);
        // add the zero
        memcpy(&buf[str1->length], str2->c_str, str2->length);
        buf[newlen] = 0;
        str1->c_str = buf;
        str1->dynamic = true;
        str1->length = newlen;
        str1->capacity = newlen * 2 + 1;
    }
    return str1;
}

string *string_add_char(string *str, unsigned char c)
{
    const unsigned newlen = str->length + 1;

    if (str->dynamic)
    {
        if (str->capacity < newlen + 1)
        {
            str->c_str = (char *)realloc(str->c_str, newlen * 2 + 1);
            if (unlikely(!str->c_str))
                FATAL_ERROR("string: failed to realloc!\n");
            str->capacity = newlen * 2 + 1;
        }

        str->c_str[str->length] = (char)c;
        str->c_str[str->length + 1] = 0;
        str->length = newlen;
    }
    else
    {
        char *buf = (char *)malloc(newlen * 2 + 1);
        memcpy(buf, str->c_str, str->length);
        // add the zero
        buf[str->length] = (char)c;
        buf[str->length + 1] = 0;
        str->c_str = buf;
        str->dynamic = true;
        str->length = newlen;
        str->capacity = newlen * 2 + 1;
    }

    return str;
}

void string_reserve(string *str, unsigned count)
{
    if (count + 1 < str->capacity || count == 0)
        return;

    if (str->dynamic)
    {
        str->c_str = (char *)realloc(str->c_str, count + 1);
        if (unlikely(!str->c_str))
            FATAL_ERROR("string: failed to realloc!\n");
    }
    else
    {
        char *buf = (char *)malloc(count + 1);
        memcpy(buf, str->c_str, str->length);
        buf[str->length] = 0;
        str->dynamic = true;
    }
    str->capacity = count + 1;
}
