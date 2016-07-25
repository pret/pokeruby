#ifndef GUARD_TASK_H
#define GUARD_TASK_H

typedef void (*TaskFunc)(u8 taskId);

struct Task
{
    TaskFunc func;  //0x00
    bool8 isActive; //0x04
    u8 prev;        //0x05
    u8 next;        //0x06
    u8 priority;    //0x07
    s16 data[16];   //0x08
};

extern struct Task gTasks[];

void ResetTasks();
u8 CreateTask(TaskFunc func, u8 priority);
void DestroyTask(u8 taskId);
void RunTasks();
void TaskDummy(u8 taskId);
void SetTaskFuncWithFollowupFunc(u8 taskId, TaskFunc func, TaskFunc followupFunc);
void SwitchTaskToFollowupFunc(u8 taskId);
bool8 FuncIsActiveTask(TaskFunc func);
u8 FindTaskIdByFunc(TaskFunc func);
u8 GetTaskCount();

#endif // GUARD_TASK_H
