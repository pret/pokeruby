#include <stdlib.h>
#include "preproc.h"
#include <string.h>
#include <stdio.h>
#include <limits.h>
// A circular buffer that resizes when needed.
struct Queue
{
    void **buffer;
    unsigned capacity;
    unsigned index;
    unsigned count;
    unsigned item_size;
};

#define at(i) ((m->index + (i)) % m->capacity)

Queue *Queue_NewWithSize(unsigned item_size)
{
    Queue *m = (Queue *)malloc(sizeof(Queue));
    m->buffer = (void **)malloc(4 * sizeof(void *));
    m->capacity = 4;
    m->index = 0;
    m->count = 0;
    m->item_size = item_size;

    return m;
}

void Queue_Delete(Queue *m)
{
    if (m->count != 0)
        FATAL_ERROR("Tried to delete a non-empty queue!\n");

    free(m->buffer);
    free(m);
}

// Double the size of the queue.
void Queue_Grow(Queue *m)
{
    // Safety
    if (m->capacity > UINT_MAX / 2)
        FATAL_ERROR("Queue is out of capacity!\n");

    unsigned new_capacity = m->capacity * 2;

    // Create a new buffer. Simply calling realloc will cause
    // problems if it currently wraps around.
    void **new_buffer = (void **)malloc(new_capacity * sizeof(void *));

    // Copy over the pointers from the old buffer. Start at 0.
    for (unsigned i = 0; i < m->count; i++)
    {
        new_buffer[i] = m->buffer[at(i)];
    }

    free(m->buffer);

    m->buffer = new_buffer;
    m->capacity = new_capacity;
    m->index = 0;
}

// Enqueues an item to the Queue. The original pointer is
// freed, don't try to dereference it.
void Queue_Enqueue(Queue *m, void *item)
{
    if (!item)
        FATAL_ERROR("Queue tried to push a null item!\n");

    // Make sure we have enough.
    if (m->count >= m->capacity)
        Queue_Grow(m);

    m->buffer[at(m->count)] = item;
    m->count++;
}

// Dequeues and returns the item. Don't forget to check for
// NULL and to free when you are done.
void *Queue_Dequeue(Queue *m)
{
    if (m->count == 0)
        return NULL;

    void *ret = m->buffer[m->index];

    m->count--;
    m->index = (m->index + 1) % m->capacity;
    return ret;
}

unsigned Queue_Count(Queue *m) { return m->count; }
