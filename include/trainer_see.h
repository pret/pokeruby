#ifndef GUARD_TRAINER_SEE_H
#define GUARD_TRAINER_SEE_H

#include "sprite.h"
#include "task.h"

bool8 CheckTrainers(void);
bool8 CheckTrainer(u8);
u8 TrainerCanApproachPlayer(struct MapObject *);

bool8 CheckPathBetweenTrainerAndPlayer(struct MapObject2 *, u8, u8);
void sub_80842C8(struct MapObject *, u8);
void sub_80842FC(void (*func)(u8));
void RunTrainerSeeFuncList(u8);
void sub_8084794(struct MapObject *var);
void ScrSpecial_EndTrainerApproach(void);
void sub_80847D8(u8);
void sub_8084894(struct Sprite *sprite, u16 a2, u8 a3);
void objc_exclamation_mark_probably(struct Sprite *sprite);

#endif // GUARD_TRAINER_SEE_H
