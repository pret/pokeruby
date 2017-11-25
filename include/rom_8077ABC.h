#ifndef GUARD_ROM_8077ABC_H
#define GUARD_ROM_8077ABC_H

#include "sprite.h"
#include "task.h"

enum
{
    ANIM_BANK_ATK,
    ANIM_BANK_DEF,
    ANIM_BANK_ATK_PARTNER,
    ANIM_BANK_DEF_PARTNER
};

u8 sub_8077ABC(u8, u8);
u8 sub_8077E44(u8 slot, u16 species, u8 a3);
u8 GetAnimBankSpriteId(u8 side);
void StoreSpriteCallbackInData(struct Sprite *sprite, void(*callback)(struct Sprite *));
void sub_8078314(struct Sprite *sprite);
void sub_8078364(struct Sprite *sprite);
void sub_8078458(struct Sprite *sprite);
void sub_80784A8(struct Sprite *sprite);
u8 GetBankSide(u8);
u8 GetBankSide(u8);
u8 GetBankSide(u8 side);
u8 GetBankSide(u8 slot);
u8 GetBankSide(u8);
u8 GetBankIdentity(u8);
u8 GetBankIdentity(u8 slot);
u8 GetBankByPlayerAI(u8);
u8 GetBankByPlayerAI(u8);
u8 GetBankByPlayerAI(u8 state);
u8 AnimBankSpriteExists(u8);
bool8 AnimBankSpriteExists(u8);
bool8 IsDoubleBattle();
u8 IsDoubleBattle(void);
bool8 IsDoubleBattle(void);
void sub_8078914();
u8 sub_80789BC();
void sub_8078A5C(struct Sprite *sprite);
void sub_8078A5C(struct Sprite *sprite);
void obj_translate_based_on_private_1_2_3_4(struct Sprite *sprite);
bool8 sub_8078B5C(struct Sprite *sprite);
void sub_8078BB8(struct Sprite *sprite);
void sub_8078D44(struct Sprite *sprite);
void obj_id_set_rotscale(u8 sprite, s16, s16, u16);
bool8 sub_8078E38();
void sub_8078E70(u8 sprite, u8);
void sub_8078F40(u8 sprite);
void sub_8078F9C(u8 sprite);
void sub_8079518(struct Sprite *sprite);
void sub_80796F8(u8 task);
void sub_80797EC(struct Task *task);
void sub_8079814(u8 taskId);
void sub_8079A64(u8 sprite);
u16 sub_8079B10(u8 sprite);
void sub_8079BF4(s16 *bottom, s16 *top, void *ptr);
void *sub_8079BFC(s16 bottom, s16 top);
void sub_8079E24();
u8 sub_8079E90(u8 slot);
u8 GetBankIdentity_permutated(u8 slot);
void sub_807A784(u8 taskId);
void sub_807A850(struct Task *task, u8 taskId);
void sub_807A8D4(struct Sprite *sprite);
void sub_807A960(struct Sprite *sprite);
void sub_8078A34(struct Sprite *sprite);
void sub_80787B0(struct Sprite *sprite, u8);
void sub_8078764(struct Sprite *sprite, u8);
void sub_8078B34(struct Sprite *sprite);
void sub_8078D60(struct Sprite *sprite);
void sub_80786EC(struct Sprite *sprite);
void sub_80782D8(struct Sprite *sprite);
void sub_8078CC0(struct Sprite *sprite);
void sub_8078600(struct Sprite *sprite);
void sub_8078504(struct Sprite *sprite);
void sub_807861C(struct Sprite *sprite);
void sub_8078650(struct Sprite *sprite);
void sub_8078394(struct Sprite *sprite);
void sub_80785E4(struct Sprite *sprite);
void sub_8078278(struct Sprite *sprite);
void sub_8078C00(struct Sprite *sprite);
void sub_8078114(struct Sprite *sprite);
void sub_80793C4(struct Sprite *sprite);
void sub_807A3FC(u8 slot, u8 a2, s16 *a3, s16 *a4);
u8 sub_8079ED4(u8 slot);
int sub_807A100(u8 slot, u8 a2);
u16 sub_80790F0(s16 a, s16 b);
void sub_8078FDC(struct Sprite *sprite, bool8 a2, s16 xScale, s16 yScale, u16 rotation);
void sub_807867C(struct Sprite *sprite, s16 a2);
u8 sub_8077EE4(u8 slot, u8 a2);
u32 sub_80791A8(u8 a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, u8 a7);
u32 sub_80792C0(u8 a1, u8 a2, u8 a3, u8 a4);
s16 duplicate_obj_of_side_rel2move_in_transparent_mode(u8 a1);
void obj_delete_but_dont_free_vram(struct Sprite *sprite);
void sub_8079108(u16 a1, bool8 a2);
void sub_80798F4(struct Task *task, u8 a2, void *a3);
bool8 sub_807992C(struct Task *task);
u8 sub_8077FC0(u8 slot);
void move_anim_8074EE0(struct Sprite *sprite);
bool8 sub_8078718(struct Sprite *sprite);
bool8 sub_8078CE8(struct Sprite *sprite);

#endif // GUARD_ROM_8077ABC_H
