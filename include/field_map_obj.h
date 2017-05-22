#ifndef GUARD_FIELD_MAP_OBJ_H
#define GUARD_FIELD_MAP_OBJ_H

#include "sprite.h"

#define fieldmap_object_cb(setup, callback, table) \
extern u8 (*const table[])(struct MapObject *, struct Sprite *);\
static u8 callback(struct MapObject *, struct Sprite *);\
void setup(struct Sprite *sprite)\
{\
    meta_step(&gMapObjects[sprite->data0], sprite, callback);\
}\
static u8 callback(struct MapObject *mapObject, struct Sprite *sprite)\
{\
    return table[sprite->data1](mapObject, sprite);\
}

#define fieldmap_object_null_cb(setup, callback) \
static u8 callback(struct MapObject *, struct Sprite *);\
void setup(struct Sprite *sprite)\
{\
    meta_step(&gMapObjects[sprite->data0], sprite, callback);\
}\
static u8 callback(struct MapObject *mapObject, struct Sprite *sprite)\
{\
    return 0;\
}

void sub_805C058(struct MapObject *mapObject, s16 a, s16 b);
void FieldObjectSetDirection(struct MapObject *pObject, u8 unk_18);
void MoveCoords(u8 direction, s16 *x, s16 *y);
void meta_step(struct MapObject *pObject,  struct Sprite *pSprite,  u8 (*d8)(struct MapObject *, struct Sprite *));
void npc_reset(struct MapObject *mapObject, struct Sprite *sprite);

extern const u8 gUnknown_08375240[4];
extern u8 (*const gUnknown_08375244[])(s16 a0, s16 a1, s16 a2, s16 a3);

extern const u8 gUnknown_083752A0[2];
extern const u8 gUnknown_083752C0[2];
extern const u8 gUnknown_08375320[2];
extern const u8 gUnknown_08375338[2];
extern const u8 gUnknown_08375350[2];
extern const u8 gUnknown_08375368[2];
extern const u8 gUnknown_08375380[2];
extern const u8 gUnknown_08375398[2];
extern const u8 gUnknown_083753B0[2];
extern const u8 gUnknown_083753C8[2];
extern const u8 gUnknown_083753DC[5];
extern const u8 gUnknown_083753F4[5];

#endif // GUARD_FIELD_MAP_OBJ_H
