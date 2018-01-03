#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"
#include "trig.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;

void sub_80D5038(struct Sprite *);
void sub_80D50E8(struct Sprite *);

void sub_80D4ED8(struct Sprite *sprite) {
    sprite->data[0] = gBattleAnimArgs[0];
    sprite->data[1] = 0x3C;
    sprite->data[2] = 0x9;
    sprite->data[3] = 0x1E;
    sprite->data[4] = 0xFE00;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    sprite->callback = sub_8078174;
    sub_8078174(sprite);
}

void sub_80D4F18(struct Sprite *sprite) {
    sub_807867C(sprite, gBattleAnimArgs[0]);
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[1] = gBattleAnimArgs[2];
    sprite->data[2] = gBattleAnimArgs[3];
    sprite->callback = sub_8078394;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

void sub_80D4F5C(struct Sprite *sprite) {
    sub_8078650(sprite);
    if (GetBankSide(gAnimBankAttacker) << 24) {
        sprite->pos1.x -= gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
        sprite->data[2] = -gBattleAnimArgs[4];
    } else {
        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
        sprite->data[2] = gBattleAnimArgs[4];
    }
    sprite->data[1] = gBattleAnimArgs[2];
    sprite->data[4] = gBattleAnimArgs[3];
    sprite->data[3] = gBattleAnimArgs[5];
    sprite->callback = sub_80D5038;
}

void sub_80D4FCC(struct Sprite *sprite) {
    if (GetBankSide(gAnimBankAttacker) << 24) {
        sprite->pos1.x -= gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
        sprite->data[2] = gBattleAnimArgs[4];
    } else {
        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
        sprite->data[2] = -gBattleAnimArgs[4];
    }
    sprite->data[1] = gBattleAnimArgs[2];
    sprite->data[4] = gBattleAnimArgs[3];
    sprite->data[3] = gBattleAnimArgs[5];
    sprite->callback = sub_80D5038;
}

void sub_80D5038(struct Sprite *sprite) {
    if (++sprite->data[0] < sprite->data[4]) {
        sprite->pos2.x += sprite->data[2];
        sprite->pos2.y += sprite->data[3];
    }
    if (sprite->data[0] == sprite->data[1]) {
        move_anim_8074EE0(sprite);
    }
}

void sub_80D5074(struct Sprite *sprite) {
    sub_8078650(sprite);
    if (GetBankSide(gAnimBankAttacker) << 24) {
        sprite->pos1.x -= gBattleAnimArgs[0];
    } else {
        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->subpriority = 8;
    }
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[2] = gBattleAnimArgs[4];
    sprite->data[3] = gBattleAnimArgs[5];
    sprite->data[4] = gBattleAnimArgs[6];
    sprite->data[5] = 0;
    sprite->callback = sub_80D50E8;
}

void sub_80D50E8(struct Sprite *sprite) {
    if (sprite->data[3]) {
        if(sprite->data[5] > 10000) {
            sprite->subpriority = 1;
        }
        sprite->pos2.x = Sin(sprite->data[0], sprite->data[1] + (sprite->data[5] >> 8));
        sprite->pos2.y = Cos(sprite->data[0], sprite->data[1] + (sprite->data[5] >> 8));
        sprite->data[0] += sprite->data[2];
        sprite->data[5] += sprite->data[4];
        if (sprite->data[0] > 0xFF) {
            sprite->data[0] -= 0x100;
        } else if (sprite->data[0] < 0) {
            sprite->data[0] += 0x100;
        }
        sprite->data[3]--;
    } else {
        move_anim_8074EE0(sprite);
    }
}