#ifndef STACK_H
#define STACK_H 1

#include "preproc.h"

#include <stdlib.h>
#include <stdbool.h>

struct Stack;
typedef struct Stack Stack;

Stack *Stack_NewWithSize(unsigned size);
Stack *Stack_NewWithSizeAndDtor(unsigned size, void (*dtor)(void *));
void Stack_Delete(Stack *m);
void Stack_Push(Stack *r m, void *r item);
void Stack_Pop(Stack *m);
unsigned Stack_Count(Stack *m);
void *Stack_Top(Stack *m);
bool Stack_Empty(Stack *m);

#define Stack_NewClass(type)                                                                       \
    Stack_NewWithSizeAndDtor((unsigned)sizeof(struct type *), (void (*)(void *)) & type##_Delete)
#define Stack_NewPrim(type) Stack_NewWithSize((unsigned)sizeof(type))

#endif  // STACK_H
