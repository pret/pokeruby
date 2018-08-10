#ifndef HASH_MAP_H
#define HASH_MAP_H 1

#include "preproc.h"
#include "my_string.h"

struct HashMap;
typedef struct HashMap HashMap;

HashMap *HashMap_New(void);
void HashMap_Delete(HashMap *m);
string *HashMap_FindInt(HashMap *m, int key);
string *HashMap_FindString(HashMap *r m, const string *r key);
void HashMap_PutInt(HashMap *r m, int key, string *r value);
void HashMap_PutString(HashMap *r m, const string *r key, string *r value);


#endif  // HASH_MAP_H
