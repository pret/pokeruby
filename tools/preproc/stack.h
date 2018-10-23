#ifndef STACK_H
#define STACK_H 1

#include "preproc.h"

#include <stdlib.h>
#include <stdbool.h>

struct Stack;
typedef struct Stack Stack;

__attribute__((__malloc__))
Stack *Stack_NewWithSize(unsigned size);
__attribute__((__malloc__))
Stack *Stack_NewWithSizeAndDtor(unsigned size, void (*dtor)(void *));

void Stack_Delete(Stack *m);
void Stack_Push(Stack *restrict m, void *restrict item);
void Stack_Pop(Stack *m);

__attribute__((__pure__)) unsigned Stack_Count(const Stack *const restrict m);
__attribute__((__pure__)) void *Stack_Top(const Stack *const restrict m);
__attribute__((__pure__)) bool Stack_Empty(const Stack *const restrict m);

#define Stack_NewClass(type)                                                                       \
    Stack_NewWithSizeAndDtor((unsigned)sizeof(struct type *), (void (*)(void *)) & type##_Delete)
#define Stack_NewPrim(type) Stack_NewWithSize((unsigned)sizeof(type))

#endif  // STACK_H
