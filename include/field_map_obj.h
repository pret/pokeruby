#ifndef GUARD_FIELD_MAP_OBJ_H
#define GUARD_FIELD_MAP_OBJ_H

#include "sprite.h"

void sub_805C058(struct MapObject *mapObject, s16 a, s16 b);
void FieldObjectSetDirection(struct MapObject *pObject, u8 unk_18);
void MoveCoords(u8 direction, s16 *x, s16 *y);
void meta_step(struct MapObject *pObject,  struct Sprite *pSprite,  u8 (*d8)());

extern const u8 gUnknown_08375240[4];
extern u8 (*const gUnknown_08375244[])(s16 a0, s16 a1, s16 a2, s16 a3);

extern u8 (*const gUnknown_08375270[])(struct MapObject *mapObject, struct Sprite *sprite);
extern u8 (*const gUnknown_08375284[])(struct MapObject *mapObject, struct Sprite *sprite);
extern const u8 gUnknown_083752A0[2];
extern u8 (*const gUnknown_083752A4[])(struct MapObject *mapObject, struct Sprite *sprite);
extern const u8 gUnknown_083752C0[2];
extern u8 (*const gUnknown_083752C4[])(struct MapObject *mapObject, struct Sprite *sprite);
extern u8 (*const gUnknown_083752D0[])(struct MapObject *mapObject, struct Sprite *sprite);
extern u8 (*const gUnknown_083752E4[])(struct MapObject *mapObject, struct Sprite *sprite);
extern u8 (*const gUnknown_083752F8[])(struct MapObject *mapObject, struct Sprite *sprite);
extern u8 (*const gUnknown_0837530C[])(struct MapObject *mapObject, struct Sprite *sprite);
extern const u8 gUnknown_08375320[2];
extern u8 (*const gUnknown_08375324[])(struct MapObject *mapObject, struct Sprite *sprite);
extern const u8 gUnknown_08375338[2];
extern u8 (*const gUnknown_0837533C[])(struct MapObject *mapObject, struct Sprite *sprite);
extern const u8 gUnknown_08375350[2];
extern u8 (*const gUnknown_08375354[])(struct MapObject *mapObject, struct Sprite *sprite);
extern const u8 gUnknown_08375368[2];
extern u8 (*const gUnknown_0837536C[])(struct MapObject *mapObject, struct Sprite *sprite);
extern const u8 gUnknown_08375380[2];
extern u8 (*const gUnknown_08375384[])(struct MapObject *mapObject, struct Sprite *sprite);
extern const u8 gUnknown_08375398[2];
extern u8 (*const gUnknown_0837539C[])(struct MapObject *mapObject, struct Sprite *sprite);
extern const u8 gUnknown_083753B0[2];
extern u8 (*const gUnknown_083753B4[])(struct MapObject *mapObject, struct Sprite *sprite);
extern const u8 gUnknown_083753C8[2];
extern u8 (*const gUnknown_083753CC[])(struct MapObject *mapObject, struct Sprite *sprite);
extern const u8 gUnknown_083753DC[5];

#endif // GUARD_FIELD_MAP_OBJ_H
