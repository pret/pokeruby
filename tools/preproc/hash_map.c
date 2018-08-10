#include <stdlib.h>
#include <limits.h>
#include "preproc.h"
#include "hash_map.h"


struct HashMap
{
    int32_t *keys;
    string **values;
    unsigned count;
    unsigned capacity;
};

static int Hash(const string *str)
{
    uint32_t hash = 5381;

    for (unsigned i = 0; i < str->length; i++)
        hash = (hash * 33) ^ (uint8_t)str->c_str[i];

    return (int)hash;
}

HashMap *HashMap_New(void)
{
    HashMap *m = (HashMap *)malloc(sizeof(HashMap));

    m->keys = (int *)malloc(16 * sizeof(int));
    m->values = (string **)malloc(16 * sizeof(string *));
    m->count = 0;
    m->capacity = 16;

    return m;
}

void HashMap_Delete(HashMap *m)
{
    for (unsigned i = 0; i < m->count; i++)
        string_Delete(m->values[i]);

    free(m->keys);
    free(m->values);
    free(m);
}

string *HashMap_FindInt(HashMap *m, int key)
{
    for (unsigned i = 0; i < m->count; i++)
        if (m->keys[i] == key)
            return m->values[i];
    return NULL;
}

string *HashMap_FindString(HashMap *r m, const string *r key)
{
    int hash = Hash(key);
    return HashMap_FindInt(m, hash);
}

static void Grow(HashMap *m)
{
    if (unlikely(m->capacity > UINT_MAX / 2))
        FATAL_ERROR("HashMap: Out of memory!\n");

    unsigned newcap = m->capacity * 2;

    m->keys = (int *)realloc(m->keys, newcap * sizeof(int));
    m->values = (string **)realloc(m->values, newcap * sizeof(string *));

    if (unlikely(!m->keys || !m->values))
        FATAL_ERROR("HashMap: Out of memory!\n");

    m->capacity = newcap;
}

void HashMap_PutInt(HashMap *r m, int key, string *r value)
{
    for (unsigned i = 0; i < m->count; i++)
    {
        if (m->keys[i] == key)
        {
            string_Delete(m->values[i]);
            m->values[i] = value;
            return;
        }
    }

    if (m->capacity > 0 && m->count >= m->capacity)
        Grow(m);

    m->keys[m->count] = key;
    m->values[m->count] = value;
    m->count++;
}

void HashMap_PutString(HashMap *r m, const string *r key, string *r value)
{
    int hash = Hash(key);

    HashMap_PutInt(m, hash, value);
}
