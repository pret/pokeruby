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
extern bool8 (*const gUnknown_08375684[4])(u8);
extern bool8 (*const gUnknown_08375694[4])(u8);

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
extern const u8 gUnknown_08375418[4];
extern const u8 gUnknown_08375428[4];
extern const u8 gUnknown_08375438[4];
extern const u8 gUnknown_08375448[4];
extern const u8 gUnknown_08375458[4];
extern const u8 gUnknown_08375468[4];
extern const u8 gUnknown_08375240[4];
extern const u8 gUnknown_08375484[4];
extern const u8 gUnknown_08375494[4];
extern const u8 gUnknown_083754A4[4];
extern const u8 gUnknown_083754B4[4];
extern const u8 gUnknown_083754C4[4];
extern const u8 gUnknown_083754D4[4];
extern const u8 gUnknown_083754E4[4];
extern const u8 gUnknown_083754F4[4];
extern const u8 gUnknown_08375504[4];
extern const u8 gUnknown_08375514[4];
extern const u8 gUnknown_08375524[4];
extern const u8 gUnknown_08375534[4];
extern const u8 gUnknown_08375544[4];
extern const u8 gUnknown_08375554[4];
extern const u8 gUnknown_08375564[4];
extern const u8 gUnknown_08375574[4];
extern const u8 gUnknown_08375584[4];

extern const u8 gUnknown_0837567B[9];
extern const u8 gUnknown_0837574F[8];

extern const u8 gUnknown_08375757[4][4];
extern const u8 gUnknown_08375767[4][4];

extern const struct Coords16 gDirectionToVector[];

extern u8 (**const gUnknown_08375778[])(struct MapObject *, struct Sprite *);

extern struct CameraSomething gUnknown_03004880;
extern u16 gUnknown_03004898;
extern u16 gUnknown_0300489C;

#endif // GUARD_FIELD_MAP_OBJ_H
