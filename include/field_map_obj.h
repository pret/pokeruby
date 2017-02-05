#ifndef GUARD_FIELD_MAP_OBJ_H
#define GUARD_FIELD_MAP_OBJ_H

#include "sprite.h"

void sub_805C058(struct MapObject *mapObject, s16 a, s16 b);
void FieldObjectSetDirection(struct MapObject *pObject, u8 unk_18);
void MoveCoords(u8 direction, s16 *x, s16 *y);
void meta_step(struct MapObject *pObject,  struct Sprite *pSprite,  u32 (*d8)());

#endif // GUARD_FIELD_MAP_OBJ_H
