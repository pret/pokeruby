#include "stack.h"
#include <limits.h>

struct Stack
{
    void **buffer;
    void (*dtor)(void *);
    unsigned count;
    unsigned capacity;
    unsigned item_size;
};

Stack *Stack_NewWithSizeAndDtor(unsigned size, void (*dtor)(void *))
{
    Stack *m = (Stack *)malloc(sizeof(Stack));
    // Start with 16 items.
    m->buffer = (void **)malloc(16 * sizeof(void *));
    m->capacity = 16;
    m->count = 0;
    m->item_size = size;
    m->dtor = dtor;
    return m;
}

Stack *Stack_NewWithSize(unsigned size) { return Stack_NewWithSizeAndDtor(size, NULL); }

void Stack_Delete(Stack *m)
{
    while (m->count > 0)
        Stack_Pop(m);

    free(m->buffer);
    free(m);
}

void Stack_Grow(Stack *m)
{
    // Safety
    if (unlikely(m->capacity > UINT_MAX / 2))
        FATAL_ERROR("Stack is out of capacity!\n");

    void **newbuf = (void **)realloc(m->buffer, 2 * m->capacity * sizeof(void *));
    if (unlikely(!newbuf))
        FATAL_ERROR("Couldn't grow stack!\n");

    m->buffer = newbuf;
    m->capacity *= 2;
}

/**
 * Pushes an item to the stack. The original pointer is
 * freed, don't try to dereference it.
 */
void Stack_Push(Stack *m, void *item)
{
    if (unlikely(!item))
        FATAL_ERROR("Stack tried to push a null item!\n");

    // Make sure we have enough.
    if (m->count >= m->capacity)
        Stack_Grow(m);

    m->count++;
    m->buffer[m->count - 1] = item;
}

void Stack_Pop(Stack *m)
{
    void *to_delete = Stack_Top(m);
    if (to_delete && m->dtor)
        m->dtor(to_delete);
    m->count--;
}

void *Stack_Top(Stack *m)
{
    if (m->count == 0)
        return NULL;

    void *ret = m->buffer[m->count - 1];

    return ret;
}

unsigned Stack_Count(Stack *m) { return m->count; }

bool Stack_Empty(Stack *m) { return m->count == 0; }
