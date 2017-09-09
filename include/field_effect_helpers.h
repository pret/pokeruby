#ifndef GUARD_FIELD_EFFECT_HELPERS_H
#define GUARD_FIELD_EFFECT_HELPERS_H

extern const struct SpriteTemplate *const gFieldEffectObjectTemplatePointers[];

void sub_812869C(struct MapObject *);
bool8 sub_81286C4(struct MapObject *);
void oamc_shadow(struct Sprite *);
void sub_8087638(struct Sprite *);
void sub_808788C(struct Sprite *);
void sub_8127334(struct Sprite *);
void sub_8127584(struct Sprite *);
void sub_81276B4(struct Sprite *);
void sub_8127A7C(struct Sprite *);
void sub_8127D84(struct Sprite *);
void sub_8127F7C(struct Sprite *);
void sub_81282E0(struct Sprite *);
void sub_8128410(struct Sprite *);
void sub_81285AC(struct Sprite *);
void sub_8128774(struct Sprite *);
void sub_81287C4(struct Sprite *);
void sub_8128800(struct Sprite *);
void unc_grass_normal(struct Sprite *);
void unc_grass_tall(struct Sprite *);
u8 sub_8126B54(void);
void objid_set_invisible(u8);
void sub_8126BC4(u8 unk_1B, u8 r6, s16 x, s16 y);
void sub_8127ED0(u8, u8);
void sub_8127F28(u8, u8, s16);
u8 sub_8128124(u8 id);
void ash(s16, s16, u16, u8);
void SetUpReflection(struct MapObject *mapObj, struct Sprite *sprite, u8 a);
u32 oe_exec_and_other_stuff(u8 fieldEffectId, struct MapObject *mapObject);
u8 sub_8126FF0(u8 localId, u8 mapNum, u8 mapGroup, s16 x, s16 y);

#endif // GUARD_FIELD_EFFECT_HELPERS_H
