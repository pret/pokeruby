#ifndef GUARD_TASK_H
#define GUARD_TASK_H

#define NUM_TASKS 16

// general task defines
#define TASK gTasks[taskId]
#define FUNC func

typedef void (*TaskFunc)(u8 taskId);

struct Task
{
    /*0x00*/ TaskFunc func;
    /*0x04*/ bool8 isActive;
    /*0x05*/ u8 prev;
    /*0x06*/ u8 next;
    /*0x07*/ u8 priority;
    /*0x08*/ s16 data[16];
};

extern struct Task gTasks[];

extern void ResetTasks(void);
extern u8 CreateTask(TaskFunc func, u8 priority);
extern void DestroyTask(u8 taskId);
extern void RunTasks(void);
extern void TaskDummy(u8 taskId);
extern void SetTaskFuncWithFollowupFunc(u8 taskId, TaskFunc func, TaskFunc followupFunc);
extern void SwitchTaskToFollowupFunc(u8 taskId);
extern bool8 FuncIsActiveTask(TaskFunc func);
extern u8 FindTaskIdByFunc(TaskFunc func);
extern u8 GetTaskCount(void);

#endif // GUARD_TASK_H
