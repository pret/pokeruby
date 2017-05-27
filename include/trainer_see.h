#ifndef GUARD_TRAINER_SEE_H
#define GUARD_TRAINER_SEE_H

#include "sprite.h"
#include "task.h"

bool8 CheckTrainers(void);
bool8 CheckTrainer(u8);
u8 TrainerCanApproachPlayer(struct MapObject *);
bool8 IsTrainerInRangeSouth(struct MapObject *trainerObj, s16 vision, s16 x, s16 y);
bool8 IsTrainerInRangeNorth(struct MapObject *trainerObj, s16 vision, s16 x, s16 y);
bool8 IsTrainerInRangeWest(struct MapObject *trainerObj, s16 vision, s16 x, s16 y);
bool8 IsTrainerInRangeEast(struct MapObject *trainerObj, s16 vision, s16 x, s16 y);
bool8 CheckPathBetweenTrainerAndPlayer(struct MapObject2 *, u8, u8);
void sub_80842C8(struct MapObject *, u8);
void sub_80842FC(void (*func)(u8));
void RunTrainerSeeFuncList(u8);
u8 sub_8084394(void);
s8 sub_8084398(u8 taskId, struct Task *task, struct MapObject *trainerObj);
s8 sub_80843DC(u8 taskId, struct Task *task, struct MapObject *trainerObj);
s8 sub_808441C(u8 taskId, struct Task *task, struct MapObject *trainerObj);
s8 sub_8084478(u8 taskId, struct Task *task, struct MapObject *trainerObj);
s8 sub_8084534(u8 taskId, struct Task *task, struct MapObject *trainerObj);
s8 sub_8084578(u8 taskId, struct Task *task, struct MapObject *trainerObj);
s8 sub_80845AC(u8 taskId, struct Task *task, struct MapObject *trainerObj);
s8 sub_80845C8(u8 taskId, struct Task *task, struct MapObject *trainerObj);
s8 sub_80845FC(u8 taskId, struct Task *task, struct MapObject *trainerObj);
s8 sub_8084654(u8 taskId, struct Task *task, struct MapObject *trainerObj);
s8 sub_80846C8(u8 taskId, struct Task *task, struct MapObject *trainerObj);
void sub_80846E4(u8 taskId);
void sub_8084794(struct MapObject *var);
void sub_80847C8(void);
void sub_80847D8(u8);
void sub_8084894(struct Sprite *sprite, u16 a2, u8 a3);
void objc_exclamation_mark_probably(struct Sprite *sprite);

#endif // GUARD_TRAINER_SEE_H
