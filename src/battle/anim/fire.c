#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"
#include "trig.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;

void sub_80D5038(struct Sprite *);
void sub_80D50E8(struct Sprite *);

void sub_80D4ED8(struct Sprite *sprite) {
    sprite->data[0] = gBattleAnimArgs[0];
    sprite->data[1] = 60;
    sprite->data[2] = 9;
    sprite->data[3] = 30;
    sprite->data[4] = 65024;
    StoreSpriteCallbackInData(sprite, move_anim_8072740); // DestroyAnimSprite
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
    StoreSpriteCallbackInData(sprite, move_anim_8072740); // DestroyAnimSprite
}

void sub_80D4F5C(struct Sprite *sprite) {
    sub_8078650(sprite);
    if (GetBankSide(gBattleAnimBankAttacker) << 24) { // g.. = gAnimBankAttacker
        sprite->pos1.x = sprite->pos1.x - gBattleAnimArgs[0];
        sprite->pos1.y = sprite->pos1.y + gBattleAnimArgs[1];
        sprite->data[2] = -gBattleAnimArgs[4];
    } else {
        sprite->pos1.x = sprite->pos1.x + gBattleAnimArgs[0];
        sprite->pos1.y = sprite->pos1.y + gBattleAnimArgs[1];
        sprite->data[2] = gBattleAnimArgs[4];
    }
    sprite->data[1] = gBattleAnimArgs[2];
    sprite->data[4] = gBattleAnimArgs[3];
    sprite->data[3] = gBattleAnimArgs[5];
    sprite->callback = sub_80D5038;
}

void sub_80D4FCC(struct Sprite *sprite) {
    if (GetBankSide(gBattleAnimBankAttacker) << 24) { // g.. = gAnimBankAttacker
        sprite->pos1.x = sprite->pos1.x - gBattleAnimArgs[0];
        sprite->pos1.y = sprite->pos1.y + gBattleAnimArgs[1];
        sprite->data[2] = gBattleAnimArgs[4];
    } else {
        sprite->pos1.x = sprite->pos1.x + gBattleAnimArgs[0];
        sprite->pos1.y = sprite->pos1.y + gBattleAnimArgs[1];
        sprite->data[2] = -gBattleAnimArgs[4];
    }
    sprite->data[1] = gBattleAnimArgs[2];
    sprite->data[4] = gBattleAnimArgs[3];
    sprite->data[3] = gBattleAnimArgs[5];
    sprite->callback = sub_80D5038;
}

void sub_80D5038(struct Sprite *sprite) {
    sprite->data[0]++;
    if (sprite->data[0] < sprite->data[4]) {
        sprite->pos2.x = sprite->pos2.x + sprite->data[2];
        sprite->pos2.y = sprite->pos2.y + sprite->data[3];
    }
    if (sprite->data[0] == sprite->data[1]) {
        move_anim_8074EE0(sprite);
    }
}

void sub_80D5074(struct Sprite *sprite) {
    sub_8078650(sprite);
    if (GetBankSide(gBattleAnimBankAttacker) << 24) { // g.. = gAnimBankAttacker
        sprite->pos1.x = sprite->pos1.x - gBattleAnimArgs[0];
    } else {
        sprite->pos1.x = sprite->pos1.x + gBattleAnimArgs[0];
        sprite->subpriority = 8;
    }
    sprite->pos1.y = sprite->pos1.y + gBattleAnimArgs[1];
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
        if(sprite->data[5] > 0x00002710) {
            sprite->subpriority = 1;
        }
        sprite->pos2.x = Sin(sprite->data[0], sprite->data[1] + (sprite->data[5] >> 8));
        sprite->pos2.y = Cos(sprite->data[0], sprite->data[1] + (sprite->data[5] >> 8));
        sprite->data[0] = sprite->data[0] + sprite->data[2];
        sprite->data[5] = sprite->data[5] + sprite->data[4];
        if (sprite->data[0] > 255) {
            sprite->data[0] = sprite->data[0] - 256;
        } else if (sprite->data[0] < 0) {
            sprite->data[0] = sprite->data[0] + 256;
        }
        sprite->data[3]--;
    } else {
        move_anim_8074EE0(sprite);
    }
}