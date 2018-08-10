#ifndef QUEUE_H
#define QUEUE_H 1

struct Queue;
typedef struct Queue Queue;

#define Queue_New(type) Queue_New_Impl(sizeof(type))
void Queue_Delete(Queue *m);
void Queue_Enqueue(Queue *m, void *item);
void *Queue_Dequeue(Queue *m);
unsigned Queue_Count(Queue *m);

#endif  // QUEUE_H
