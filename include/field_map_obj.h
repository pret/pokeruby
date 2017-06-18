#ifndef GUARD_FIELD_MAP_OBJ_H
#define GUARD_FIELD_MAP_OBJ_H

#include "sprite.h"

#define fieldmap_object_cb(setup, callback, table) \
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

struct PairedPalettes
{
    u16 tag;
    const u16 *data;
};

extern const u16 gMapObjectPalette19[];

extern const u32 gMapObjectPic_MovingBox[32];
extern const struct SpriteFrameImage gMapObjectPicTable_PechaBerryTree[];

void sub_805C058(struct MapObject *mapObject, s16 a, s16 b);
void FieldObjectSetDirection(struct MapObject *pObject, u8 unk_18);
void MoveCoords(u8 direction, s16 *x, s16 *y);
void meta_step(struct MapObject *pObject,  struct Sprite *pSprite,  u8 (*d8)(struct MapObject *, struct Sprite *));
void npc_reset(struct MapObject *mapObject, struct Sprite *sprite);

u8 sub_805CAAC(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CADC(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CAEC(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CB00(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CB5C(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CBB8(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CC14(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CC70(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CCAC(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CCE8(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CD24(s16 a0, s16 a1, s16 a2, s16 a3);

u8 sub_805F3EC(struct MapObject *, struct Sprite *, u8, bool8 (*const)(u8));
u8 sub_805F3F0(struct MapObject *, struct Sprite *, u8, bool8 (*const)(u8));
u8 sub_805F438(struct MapObject *, struct Sprite *, u8, bool8 (*const)(u8));
u8 sub_805F4F0(struct MapObject *, struct Sprite *, u8, bool8 (*const)(u8));
u8 sub_805F5A8(struct MapObject *, struct Sprite *, u8, bool8 (*const)(u8));
u8 sub_805F660(struct MapObject *, struct Sprite *, u8, bool8 (*const)(u8));
u8 cph_IM_DIFFERENT(struct MapObject *, struct Sprite *, u8, bool8 (*const)(u8));
u8 sub_805F760(struct MapObject *, struct Sprite *, u8, bool8 (*const)(u8));
u8 oac_hopping(struct MapObject *, struct Sprite *, u8, bool8 (*const)(u8));
u8 sub_805F3EC(struct MapObject *, struct Sprite *, u8, bool8 (*const)(u8));
u8 sub_805F3EC(struct MapObject *, struct Sprite *, u8, bool8 (*const)(u8));

extern bool8 (*const gUnknown_08375684[4])(u8);
extern bool8 (*const gUnknown_08375694[4])(u8);

extern const u8 gUnknown_0837567B[9];
extern const u8 gUnknown_0837574F[8];

extern const u8 gUnknown_08375757[4][4];
extern const u8 gUnknown_08375767[4][4];

extern const struct Coords16 gDirectionToVector[];

extern struct CameraSomething gUnknown_03004880;
extern u16 gUnknown_03004898;
extern u16 gUnknown_0300489C;

extern u32 gUnknown_0202FF84[];

void FieldObjectCB_BerryTree(struct Sprite *);
void FieldObjectCB_Hidden1(struct Sprite *);
void FieldObjectCB_MountainDisguise(struct Sprite *);
void FieldObjectCB_TreeDisguise(struct Sprite *);
void sub_80587B4(struct Sprite *);
void sub_805C884(struct Sprite *);
void sub_805C8AC(struct Sprite *);
void sub_805CDE8(struct Sprite *);
void sub_805CF28(struct Sprite *);
void sub_805D0AC(struct Sprite *);
void sub_805D230(struct Sprite *);
void sub_805D4F4(struct Sprite *);
void sub_805D634(struct Sprite *);
void sub_805D774(struct Sprite *);
void sub_805D8B4(struct Sprite *);
void sub_805D9F4(struct Sprite *);
void sub_805DB34(struct Sprite *);
void sub_805DC74(struct Sprite *);
void sub_805DDB4(struct Sprite *);
void sub_805DEF4(struct Sprite *);
void sub_805E034(struct Sprite *);
void sub_805E174(struct Sprite *);
void sub_805E278(struct Sprite *);
void sub_805E37C(struct Sprite *);
void sub_805E5DC(struct Sprite *);
void sub_805E668(struct Sprite *);
void sub_805E6F4(struct Sprite *);
void sub_805E780(struct Sprite *);
void sub_805E80C(struct Sprite *);
void sub_805E898(struct Sprite *);
void sub_805E924(struct Sprite *);
void sub_805E9B0(struct Sprite *);
void sub_805EA3C(struct Sprite *);
void sub_805EAC8(struct Sprite *);
void sub_805EB54(struct Sprite *);
void sub_805EBE0(struct Sprite *);
void sub_805EC6C(struct Sprite *);
void sub_805ECF8(struct Sprite *);
void sub_805ED84(struct Sprite *);
void sub_805EE10(struct Sprite *);
void sub_805EE9C(struct Sprite *);
void sub_805EF28(struct Sprite *);
void sub_805EFB4(struct Sprite *);
void sub_805F040(struct Sprite *);
void sub_805F0CC(struct Sprite *);
void sub_805F158(struct Sprite *);
void sub_805F1E4(struct Sprite *);
void sub_805F270(struct Sprite *);
void sub_805F2FC(struct Sprite *);
void sub_805F8E0(struct Sprite *);
void sub_805FB20(struct Sprite *);
void sub_805FB90(struct Sprite *);
void sub_805FC00(struct Sprite *);
void sub_805FC70(struct Sprite *);

u8 sub_805C8F0(struct MapObject *, struct Sprite *);
u8 sub_805C904(struct MapObject *, struct Sprite *);
u8 sub_805C930(struct MapObject *, struct Sprite *);
u8 sub_805C96C(struct MapObject *, struct Sprite *);
u8 sub_805C98C(struct MapObject *, struct Sprite *);
u8 sub_805C9D8(struct MapObject *, struct Sprite *);
u8 sub_805CA08(struct MapObject *, struct Sprite *);
u8 sub_805CE2C(struct MapObject *, struct Sprite *);
u8 sub_805CE40(struct MapObject *, struct Sprite *);
u8 sub_805CE6C(struct MapObject *, struct Sprite *);
u8 sub_805CEB0(struct MapObject *, struct Sprite *);
u8 sub_805CEE0(struct MapObject *, struct Sprite *);
u8 sub_805CF6C(struct MapObject *, struct Sprite *);
u8 sub_805CF80(struct MapObject *, struct Sprite *);
u8 sub_805CFAC(struct MapObject *, struct Sprite *);
u8 sub_805CFE8(struct MapObject *, struct Sprite *);
u8 sub_805D008(struct MapObject *, struct Sprite *);
u8 sub_805D054(struct MapObject *, struct Sprite *);
u8 sub_805D084(struct MapObject *, struct Sprite *);
u8 sub_805D0F0(struct MapObject *, struct Sprite *);
u8 sub_805D104(struct MapObject *, struct Sprite *);
u8 sub_805D130(struct MapObject *, struct Sprite *);
u8 sub_805D16C(struct MapObject *, struct Sprite *);
u8 sub_805D18C(struct MapObject *, struct Sprite *);
u8 sub_805D1D8(struct MapObject *, struct Sprite *);
u8 sub_805D208(struct MapObject *, struct Sprite *);
u8 sub_805D274(struct MapObject *, struct Sprite *);
u8 sub_805D2A0(struct MapObject *, struct Sprite *);
u8 sub_805D2C0(struct MapObject *, struct Sprite *);
u8 do_berry_tree_growth_sparkle_1(struct MapObject *, struct Sprite *);
u8 sub_805D3EC(struct MapObject *, struct Sprite *);
u8 do_berry_tree_growth_sparkle_2(struct MapObject *, struct Sprite *);
u8 sub_805D458(struct MapObject *, struct Sprite *);
u8 sub_805D4A8(struct MapObject *, struct Sprite *);
u8 sub_805D538(struct MapObject *, struct Sprite *);
u8 sub_805D54C(struct MapObject *, struct Sprite *);
u8 sub_805D578(struct MapObject *, struct Sprite *);
u8 sub_805D5BC(struct MapObject *, struct Sprite *);
u8 sub_805D5EC(struct MapObject *, struct Sprite *);
u8 sub_805D678(struct MapObject *, struct Sprite *);
u8 sub_805D68C(struct MapObject *, struct Sprite *);
u8 sub_805D6B8(struct MapObject *, struct Sprite *);
u8 sub_805D6FC(struct MapObject *, struct Sprite *);
u8 sub_805D72C(struct MapObject *, struct Sprite *);
u8 sub_805D7B8(struct MapObject *, struct Sprite *);
u8 sub_805D7CC(struct MapObject *, struct Sprite *);
u8 sub_805D7F8(struct MapObject *, struct Sprite *);
u8 sub_805D83C(struct MapObject *, struct Sprite *);
u8 sub_805D86C(struct MapObject *, struct Sprite *);
u8 sub_805D8F8(struct MapObject *, struct Sprite *);
u8 sub_805D90C(struct MapObject *, struct Sprite *);
u8 sub_805D938(struct MapObject *, struct Sprite *);
u8 sub_805D97C(struct MapObject *, struct Sprite *);
u8 sub_805D9AC(struct MapObject *, struct Sprite *);
u8 sub_805DA38(struct MapObject *, struct Sprite *);
u8 sub_805DA4C(struct MapObject *, struct Sprite *);
u8 sub_805DA78(struct MapObject *, struct Sprite *);
u8 sub_805DABC(struct MapObject *, struct Sprite *);
u8 sub_805DAEC(struct MapObject *, struct Sprite *);
u8 sub_805DB78(struct MapObject *, struct Sprite *);
u8 sub_805DB8C(struct MapObject *, struct Sprite *);
u8 sub_805DBB8(struct MapObject *, struct Sprite *);
u8 sub_805DBFC(struct MapObject *, struct Sprite *);
u8 sub_805DC2C(struct MapObject *, struct Sprite *);
u8 sub_805DCB8(struct MapObject *, struct Sprite *);
u8 sub_805DCCC(struct MapObject *, struct Sprite *);
u8 sub_805DCF8(struct MapObject *, struct Sprite *);
u8 sub_805DD3C(struct MapObject *, struct Sprite *);
u8 sub_805DD6C(struct MapObject *, struct Sprite *);
u8 sub_805DDF8(struct MapObject *, struct Sprite *);
u8 sub_805DE0C(struct MapObject *, struct Sprite *);
u8 sub_805DE38(struct MapObject *, struct Sprite *);
u8 sub_805DE7C(struct MapObject *, struct Sprite *);
u8 sub_805DEAC(struct MapObject *, struct Sprite *);
u8 sub_805DF38(struct MapObject *, struct Sprite *);
u8 sub_805DF4C(struct MapObject *, struct Sprite *);
u8 sub_805DF78(struct MapObject *, struct Sprite *);
u8 sub_805DFBC(struct MapObject *, struct Sprite *);
u8 sub_805DFEC(struct MapObject *, struct Sprite *);
u8 sub_805E078(struct MapObject *, struct Sprite *);
u8 sub_805E08C(struct MapObject *, struct Sprite *);
u8 sub_805E0B8(struct MapObject *, struct Sprite *);
u8 sub_805E0FC(struct MapObject *, struct Sprite *);
u8 sub_805E12C(struct MapObject *, struct Sprite *);
u8 sub_805E1B8(struct MapObject *, struct Sprite *);
u8 sub_805E1E4(struct MapObject *, struct Sprite *);
u8 sub_805E208(struct MapObject *, struct Sprite *);
u8 sub_805E234(struct MapObject *, struct Sprite *);
u8 sub_805E2BC(struct MapObject *, struct Sprite *);
u8 sub_805E2E8(struct MapObject *, struct Sprite *);
u8 sub_805E30C(struct MapObject *, struct Sprite *);
u8 sub_805E338(struct MapObject *, struct Sprite *);
u8 sub_805E3C0(struct MapObject *, struct Sprite *);
u8 sub_805E3D4(struct MapObject *, struct Sprite *);
u8 sub_805E40C(struct MapObject *, struct Sprite *);
u8 sub_805E4C4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805E620(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805E6AC(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805E738(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805E7C4(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805E850(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805E8DC(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805E968(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805E9F4(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805EA80(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805EB0C(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805EB98(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805EC24(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805ECB0(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805ED3C(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805EDC8(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805EE54(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805EEE0(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805EF6C(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805EFF8(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805F084(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805F110(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805F19C(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805F228(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805F2B4(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 mss_npc_reset_oampriv3_1_unk2_unk3(struct MapObject *, struct Sprite *);
u8 sub_805F364(struct MapObject *, struct Sprite *);
u8 sub_805F3C4(struct MapObject *, struct Sprite *);
u8 mss_npc_reset_oampriv3_1_unk2_unk3(struct MapObject *, struct Sprite *);
u8 mss_08062EA4(struct MapObject *, struct Sprite *);
u8 sub_805F3C4(struct MapObject *, struct Sprite *);
u8 sub_805FAF8(struct MapObject *, struct Sprite *);
u8 sub_805FB64(struct MapObject *, struct Sprite *);
u8 sub_805FB04(struct MapObject *, struct Sprite *);
u8 sub_805FBD4(struct MapObject *, struct Sprite *);
u8 sub_805FB04(struct MapObject *, struct Sprite *);
u8 sub_805FC44(struct MapObject *, struct Sprite *);
u8 sub_805FB04(struct MapObject *, struct Sprite *);
u8 sub_805FCB4(struct MapObject *, struct Sprite *);
u8 sub_805FCE8(struct MapObject *, struct Sprite *);
u8 sub_805FD08(struct MapObject *, struct Sprite *);

int state_to_direction(u8, u8, u8);
#endif // GUARD_FIELD_MAP_OBJ_H
