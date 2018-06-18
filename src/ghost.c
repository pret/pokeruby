#include "global.h"
#include "rom_8077ABC.h"
#include "sound.h"
#include "trig.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankTarget;
extern u8 gUnknown_0202F7D2;

void sub_80DDBD8(struct Sprite *);
void sub_80DDC4C(struct Sprite *);
void sub_80DDCC8(struct Sprite *);

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