#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"
#include "sound.h"
#include "trig.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankTarget;
extern u8 gUnknown_0202F7D2;
extern u8 gAnimBankAttacker;

void sub_80DDBD8(struct Sprite *);
void sub_80DDC4C(struct Sprite *);
void sub_80DDCC8(struct Sprite *);
void sub_80DDD78(struct Sprite *);
void sub_80DDE7C(u8 taskId);
void sub_80DDED0(u8 taskId);
void sub_80DDFE8(struct Sprite *);

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

void sub_80DDBD8(struct Sprite *sprite) {
    s16 r0;
    s16 r2;
    sub_80DDCC8(sprite);
    if (TranslateAnimSpriteByDeltas(sprite)) {
        sprite->callback = sub_80DDC4C;
        return;
    }
    sprite->pos2.x += Sin(sprite->data[5], 10);
    sprite->pos2.y += Cos(sprite->data[5], 15);
    r2 = sprite->data[5];
    sprite->data[5] = (sprite->data[5] + 5) & 0xFF;
    r0 = sprite->data[5];
    if (r2 != 0) {
        if (r2 <= 0xC4)
            return;
    }
    if (r0 <= 0)
        return;
    PlaySE12WithPanning(0xC4, gUnknown_0202F7D2);
}

void sub_80DDC4C(struct Sprite *sprite)
{
	s16 r2;
	s16 r0;
	sprite->data[0] = 1;
	TranslateAnimSpriteByDeltas(sprite);
	sprite->pos2.x += Sin(sprite->data[5],10);
	sprite->pos2.y += Cos(sprite->data[5],15);
	
	r2 = sprite->data[5];
	sprite->data[5] = (sprite->data[5] + 5) & 0xFF;
	r0 = sprite->data[5];
	
	if(r2 == 0 || r2 > 0xC4)
	{
		if(r0 > 0)
			PlaySE(0xC4);
	}
	
	if(sprite->data[6] == 0)
	{
		sprite->invisible = TRUE; 
		sprite->callback = sub_807861C;
	}
	else
		sub_80DDCC8(sprite);
}

void sub_80DDCC8(struct Sprite *sprite)
{
	
	s16 r0; 
	if(sprite->data[6] > 0xFF)
	{
		if(++sprite->data[6] == 0x10d)
			sprite->data[6] = 0;
		return;	
	}
	
	r0 = sprite->data[7];
	sprite->data[7]++;
	
	if((r0 & 0xFF) == 0)
	{
		sprite->data[7] &= 0xff00;
		if((sprite->data[7] & 0x100) != 0)
			sprite->data[6]++;
		else
			sprite->data[6]--;
	}
	else
		return;
	
	REG_BLDALPHA = ((16 - sprite->data[6]) << 8) | sprite->data[6];
	if(sprite->data[6] == 0 || sprite->data[6] == 16)
	{
		sprite->data[7] ^= 0x100;
	}	
	if(sprite->data[6] == 0)
		sprite->data[6] = 0x100;
}

void sub_80DDD58(struct Sprite *sprite)
{
	sub_8078764(sprite, 1);
	sprite->callback = sub_80DDD78;
	sub_80DDD78(sprite);
}

void sub_80DDD78(struct Sprite *sprite) {
    u16 temp1;
    sprite->pos2.x = Sin(sprite->data[0], 32);
    sprite->pos2.y = Cos(sprite->data[0], 8);
    temp1 = sprite->data[0] - 65;
    if (temp1 <= 130) {
        sprite->oam.priority = 2;
    } else {
        sprite->oam.priority = 1;
    }
    sprite->data[0] = (sprite->data[0] + 0x13) & 0xFF;
    sprite->data[2] += 80;
    sprite->pos2.y += sprite->data[2] >> 8;
    sprite->data[7] += 1;
    if (sprite->data[7] == 0x3D) {
        DestroyAnimSprite(sprite);
    }
}

void sub_80DDDF0(u8 r5) {
	u8 r4;
	REG_BLDCNT = 0x3F40;
	REG_BLDALPHA = 0x1000;
	r4 = GetAnimBattlerSpriteId(0);
	sub_8078E70(r4, 1);
	obj_id_set_rotscale(r4, 0x80, 0x80, 0);
	gSprites[r4].invisible = FALSE;
	gTasks[r5].data[0] = 0x80;
	gTasks[r5].data[1] = *gBattleAnimArgs;
	gTasks[r5].data[2] = 0;
	gTasks[r5].data[3] = 0x10;
	gTasks[r5].func = &sub_80DDE7C;
}

void sub_80DDE7C(u8 taskId) {
	gTasks[taskId].data[10] += 1;
	if (gTasks[taskId].data[10] == 3) {
		gTasks[taskId].data[10] = 0;
		gTasks[taskId].data[2] += 1;
		gTasks[taskId].data[3] -= 1;
		REG_BLDALPHA = gTasks[taskId].data[3] << 8 | gTasks[taskId].data[2];
		if (gTasks[taskId].data[2] != 9)
			return;
		gTasks[taskId].func = &sub_80DDED0;
	}
}

void sub_80DDED0(u8 taskId) {
	u8 r1;
	if (gTasks[taskId].data[1] > 0) {
		gTasks[taskId].data[1] -= 1;
		return;
	}
	r1 = GetAnimBattlerSpriteId(0);
	gTasks[taskId].data[0] += 8;
	if (gTasks[taskId].data[0] <= 0xFF) {
		obj_id_set_rotscale(r1, gTasks[taskId].data[0], gTasks[taskId].data[0], 0);
		return;
	}
	sub_8078F40(r1);
	DestroyAnimVisualTask(taskId);
	REG_BLDCNT = 0;
	REG_BLDALPHA = 0;
}

void sub_80DDF40(struct Sprite *sprite) {
	u16 r5, r6;
	r5 = sprite->pos1.x;
	r6 = sprite->pos1.y;
	sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
	sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
	sprite->data[0] = 0;
	sprite->data[1] = gBattleAnimArgs[0];
	sprite->data[2] = gBattleAnimArgs[1];
	sprite->data[3] = gBattleAnimArgs[2];
	sprite->data[4] = sprite->pos1.x << 4;
	sprite->data[5] = sprite->pos1.y << 4;
	sprite->data[6] = (((s16)r5 - sprite->pos1.x) << 4) / (gBattleAnimArgs[0] << 1);
	sprite->data[7] = (((s16)r6 - sprite->pos1.y) << 4) / (gBattleAnimArgs[0] << 1);
	sprite->callback = &sub_80DDFE8;
}