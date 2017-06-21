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

extern u32 gUnknown_0202FF84[];

int state_to_direction(u8, u8, u8);

void sub_805AA98();
void sub_805AAB0(void);
u8 sub_805AB54(void);
u8 GetFieldObjectIdByLocalIdAndMap(u8, u8, u8);
bool8 TryGetFieldObjectIdByLocalIdAndMap(u8, u8, u8, u8 *);
u8 GetFieldObjectIdByXY(s16, s16);
u8 GetFieldObjectIdByLocalIdAndMapInternal(u8, u8, u8);
u8 GetFieldObjectIdByLocalId(u8);
u8 GetAvailableFieldObjectSlot(u16, u8, u8, u8 *);
void RemoveFieldObjectByLocalIdAndMap(u8, u8, u8);
void RemoveFieldObjectInternal(struct MapObject *);
u8 SpawnSpecialFieldObject(struct MapObjectTemplate *);
u8 show_sprite(u8, u8, u8);
void MakeObjectTemplateFromFieldObjectTemplate(struct MapObjectTemplate *mapObjTemplate, struct SpriteTemplate *sprTemplate, struct SubspriteTable **subspriteTables);
u8 AddPseudoFieldObject(u16 graphicsId, void (*callback)(struct Sprite *), s16 c, s16 d, u8 subpriority);
u8 sub_805B410(u8, u8, s16, s16, u8, u8);
void sub_805B55C(s16 a, s16 b);
void sub_805B710(u16 i, u16 i1);
void sub_805B980(struct MapObject *, u8);
void FieldObjectTurn(struct MapObject *, u8);
void FieldObjectTurnByLocalIdAndMap(u8, u8, u8, u8);
const struct MapObjectGraphicsInfo *GetFieldObjectGraphicsInfo(u8);
void FieldObjectHandleDynamicGraphicsId(struct MapObject *);
void npc_by_local_id_and_map_set_field_1_bit_x20(u8, u8, u8, u8);
void FieldObjectGetLocalIdAndMap(struct MapObject *, u8 *, u8 *, u8 *);
void sub_805BCC0(s16 x, s16 y);
void sub_805BCF0(u8, u8, u8, u8);
void sub_805BD48(u8, u8, u8);
void sub_805BD90(u8 localId, u8 mapNum, u8 mapGroup, s16 x, s16 y);
void gpu_pal_allocator_reset__manage_upper_four(void);
void sub_805BDF8(u16);
u8 sub_805BE58(const struct SpritePalette *);
void pal_patch_for_npc(u16, u16);
u8 FindFieldObjectPaletteIndexByTag(u16);
void npc_load_two_palettes__no_record(u16, u8);
void npc_load_two_palettes__and_record(u16, u8);
void npc_coords_shift(struct MapObject *pObject, s16 x, s16 y);
void sub_805C0F8(u8, u8, u8, s16, s16);
void npc_coords_shift_still(struct MapObject *pObject);
u8 GetFieldObjectIdByXYZ(u16, u16, u8);
void UpdateFieldObjectsForCameraUpdate(s16, s16);
u8 AddCameraObject(u8);
void CameraObjectReset1(void);
u8 * GetFieldObjectScriptPointerByFieldObjectId(u8);
u16 GetFieldObjectFlagIdByFieldObjectId(u8);
u8 FieldObjectGetBerryTreeId(u8);
struct MapObjectTemplate *GetFieldObjectTemplateByLocalIdAndMap(u8, u8, u8);
void sub_805C754(struct MapObject *pObject);
void sub_805C774(struct MapObject *, u8);
void sub_805C78C(u8, u8, u8);
void sub_805C7C4(u8 i);
u8 FieldObjectDirectionToImageAnimId(u8);
u8 get_go_image_anim_num(u8 unk_19);
u8 sub_805FD98(u8);
u8 sub_805FDE8(u8);
u8 sub_805FDF8(u8);
u8 sub_805FE08(u8);
void npc_set_running_behaviour_etc(struct MapObject *, u8);
u8 npc_running_behaviour_by_direction(u8);
u8 npc_block_way(struct MapObject *, s16, s16, u8);
u8 sub_8060024(struct MapObject *, s16, s16, u8);
u8 sub_8060234(u8, u8, u8);
void sub_8060288(u8, u8, u8);
void sub_8060388(s16, s16, s16 *, s16 *);
void sub_80603CC(s16 x, s16 y, s16 *pInt, s16 *pInt1);
void GetFieldObjectMovingCameraOffset(s16 *, s16 *);
void FieldObjectMoveDestCoords(struct MapObject *pObject, u8 unk_19, s16 *pInt, s16 *pInt1);
bool8 FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(struct MapObject *);
bool8 FieldObjectIsSpecialAnimActive(struct MapObject *);
bool8 FieldObjectSetSpecialAnim(struct MapObject *, u8);
void FieldObjectForceSetSpecialAnim(struct MapObject *pObject, u8 a);
void FieldObjectClearAnimIfSpecialAnimActive(struct MapObject *);
void FieldObjectClearAnim(struct MapObject *);
bool8 FieldObjectCheckIfSpecialAnimFinishedOrInactive(struct MapObject *);
u8 FieldObjectClearAnimIfSpecialAnimFinished(struct MapObject *);
u8 FieldObjectGetSpecialAnim(struct MapObject *);
u8 GetFaceDirectionAnimId(u8);
u8 GetSimpleGoAnimId(u8);
u8 GetGoSpeed0AnimId(u8 a);
u8 sub_8060744(u8 a);
u8 d2s_08064034(u8 a);
u8 sub_806079C(u8 a);
u8 sub_80607F4(u8 a);
u8 GetJumpLedgeAnimId(u8 a);
u8 sub_806084C(u8);
u8 sub_8060878(u8);
u8 sub_80608D0(u8);
u8 GetStepInPlaceDelay32AnimId(u8 a);
u8 GetStepInPlaceDelay16AnimId(u8);
u8 GetStepInPlaceDelay8AnimId(u8 a);
u8 GetStepInPlaceDelay4AnimId(u8 a);
u8 FieldObjectFaceOppositeDirection(struct MapObject *, u8);
u8 sub_80609D8(u8);
u8 sub_8060A04(u8);
u8 sub_8060A30(u8);
u8 sub_8060A5C(u8);
u8 sub_8060A88(u8);
u8 sub_8060AB4(u8);
u8 sub_8060AE0(u8);
u8 sub_8060B0C(u8);
u8 sub_8060B38(u8);
u8 sub_8060B64(u8);
u8 GetOppositeDirection(u8);
void sub_80634D0(struct MapObject *, struct Sprite *);
u8 SpawnSpecialFieldObjectParametrized(u8, u8, u8, s16, s16, u8);
void CameraObjectSetFollowedObjectId(u8);
void sub_805ADDC(u8);

#endif // GUARD_FIELD_MAP_OBJ_H
