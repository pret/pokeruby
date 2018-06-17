#include "global.h"
#include "rom_8077ABC.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankTarget;

void sub_80DDBD8(struct Sprite *);

void sub_80DDB6C(struct Sprite *sprite) {
    InitAnimSpritePos(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3);
    sub_8078BD4(sprite);
    sprite->callback = sub_80DDBD8;
    sprite->data[6] = 0x10;
    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = sprite->data[6];
}