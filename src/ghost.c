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
void sub_80DE114(struct Sprite *);
void sub_80DE2DC(u8 taskId);
void sub_80DE3D4(u8 taskId);

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

void sub_80DDFE8(struct Sprite *sprite) {
	switch (sprite->data[0]) {
	case 0:
		sprite->data[4] += sprite->data[6];
		sprite->data[5] += sprite->data[7];
		sprite->pos1.x = sprite->data[4] >> 4;
		sprite->pos1.y = sprite->data[5] >> 4;
		sprite->data[1] -= 1;
		if (sprite->data[1] > 0)
			break;
		sprite->data[0] += 1;
		break;
	case 1:
		sprite->data[2] -= 1;
		if (sprite->data[2] > 0)
			break;
		sprite->data[1] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
		sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 3);
		sprite->data[4] = sprite->pos1.x << 4;
		sprite->data[5] = sprite->pos1.y << 4;
		sprite->data[6] = ((sprite->data[1] - sprite->pos1.x) << 4) / sprite->data[3];
		sprite->data[7] = ((sprite->data[2] - sprite->pos1.y) << 4) / sprite->data[3];
		sprite->data[0] += 1;
		break;
	case 2:
		sprite->data[4] += sprite->data[6];
		sprite->data[5] += sprite->data[7];
		sprite->pos1.x = sprite->data[4] >> 4;
		sprite->pos1.y = sprite->data[5] >> 4;
		sprite->data[3] -= 1;
		if (sprite->data[3] > 0)
			break;
		sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankTarget, 2);
		sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankTarget, 3);
		sprite->data[0] += 1;
		break;
	case 3:
		move_anim_8074EE0(sprite);
	}
}

void sub_80DE0FC(struct Sprite *sprite) {
	sub_8078764(sprite, 1);
	sprite->callback = &sub_80DE114;
}

#ifdef NONMATCHING /* I couldn't do this one. */
void sub_80DE114(struct Sprite *sprite) {}
#else
NAKED
void sub_80DE114(struct Sprite *sprite) {
	asm_unified("\tpush {r4-r6,lr}\n"
				"\tadds r3, r0, 0\n"
				"\tmovs r5, 0\n"
				"\tmovs r6, 0\n"
				"\tadds r0, 0x3F\n"
				"\tldrb r1, [r0]\n"
				"\tmovs r0, 0x10\n"
				"\tands r0, r1\n"
				"\tcmp r0, 0\n"
				"\tbeq _080DE1AA\n"
				"\tadds r1, r3, 0\n"
				"\tadds r1, 0x3E\n"
				"\tldrb r2, [r1]\n"
				"\tmovs r0, 0x4\n"
				"\tands r0, r2\n"
				"\tadds r4, r1, 0\n"
				"\tcmp r0, 0\n"
				"\tbne _080DE13E\n"
				"\tmovs r0, 0x4\n"
				"\torrs r0, r2\n"
				"\tstrb r0, [r4]\n"
				"_080DE13E:\n"
				"\tmovs r1, 0x2E\n"
				"\tldrsh r0, [r3, r1]\n"
				"\tcmp r0, 0\n"
				"\tbeq _080DE14E\n"
				"\tcmp r0, 0x1\n"
				"\tbeq _080DE158\n"
				"\tmovs r6, 0x1\n"
				"\tb _080DE162\n"
				"_080DE14E:\n"
				"\tmovs r1, 0x30\n"
				"\tldrsh r0, [r3, r1]\n"
				"\tcmp r0, 0x2\n"
				"\tbne _080DE162\n"
				"\tb _080DE166\n"
				"_080DE158:\n"
				"\tmovs r1, 0x30\n"
				"\tldrsh r0, [r3, r1]\n"
				"\tcmp r0, 0x4\n"
				"\tbne _080DE162\n"
				"\tmovs r5, 0x1\n"
				"_080DE162:\n"
				"\tcmp r5, 0\n"
				"\tbeq _080DE198\n"
				"_080DE166:\n"
				"\tldrb r2, [r4]\n"
				"\tlsls r0, r2, 29\n"
				"\tlsrs r0, 31\n"
				"\tmovs r1, 0x1\n"
				"\teors r1, r0\n"
				"\tlsls r1, 2\n"
				"\tmovs r0, 0x5\n"
				"\tnegs r0, r0\n"
				"\tands r0, r2\n"
				"\torrs r0, r1\n"
				"\tstrb r0, [r4]\n"
				"\tldrh r0, [r3, 0x32]\n"
				"\tadds r0, 0x1\n"
				"\tmovs r1, 0\n"
				"\tstrh r0, [r3, 0x32]\n"
				"\tstrh r1, [r3, 0x30]\n"
				"\tlsls r0, 16\n"
				"\tasrs r0, 16\n"
				"\tcmp r0, 0x5\n"
				"\tbne _080DE1AA\n"
				"\tstrh r1, [r3, 0x32]\n"
				"\tldrh r0, [r3, 0x2E]\n"
				"\tadds r0, 0x1\n"
				"\tstrh r0, [r3, 0x2E]\n"
				"\tb _080DE1AA\n"
				"_080DE198:\n"
				"\tcmp r6, 0\n"
				"\tbeq _080DE1A4\n"
				"\tadds r0, r3, 0\n"
				"\tbl DestroyAnimSprite\n"
				"\tb _080DE1AA\n"
				"_080DE1A4:\n"
				"\tldrh r0, [r3, 0x30]\n"
				"\tadds r0, 0x1\n"
				"\tstrh r0, [r3, 0x30]\n"
				"_080DE1AA:\n"
				"\tpop {r4-r6}\n"
				"\tpop {r0}\n"
				"\tbx r0\n");
}
#endif

void sub_80DE1B0(u8 taskId) {
	struct Task *task;
	
	task = &gTasks[taskId];
	task->data[0] = duplicate_obj_of_side_rel2move_in_transparent_mode(1);
	if (task->data[0] < 0) {
		DestroyAnimVisualTask(taskId);
		return;
	}
	task->data[1] = 0;
	task->data[2] = 15;
	task->data[3] = 2;
	task->data[4] = 0;
	REG_BLDCNT = 0x3F40;
	REG_BLDALPHA = (task->data[3] << 8) | task->data[2];
	gSprites[task->data[0]].data[0] = 80;
	if (GetBattlerSide(gAnimBankTarget) == 0) {
		gSprites[task->data[0]].data[1] = 0xff70;
		gSprites[task->data[0]].data[2] = 0x70;
	} else {
		gSprites[task->data[0]].data[1] = 0x90;
		gSprites[task->data[0]].data[2] = 0xff90;
	}
	gSprites[task->data[0]].data[3] = 0;
	gSprites[task->data[0]].data[4] = 0;
	StoreSpriteCallbackInData(&gSprites[task->data[0]], SpriteCallbackDummy);
	gSprites[task->data[0]].callback = &sub_8078394;
	task->func = &sub_80DE2DC;
}

void sub_80DE2DC(u8 taskId) {
	struct Task *task;
	
	task = &gTasks[taskId];
	switch (task->data[4]) {
	case 0:
		task->data[1] += 1;
		task->data[5] = task->data[1] & 3;
		if (task->data[5] == 1) {
			if (task->data[2] > 0)
				task->data[2] -= 1;
		}
		if (task->data[5] == 3) {
			if (task->data[3] <= 15)
				task->data[3] += 1;
		}
		REG_BLDALPHA = (task->data[3] << 8) | task->data[2];
		if (task->data[3] != 16 || task->data[2] != 0)
			break;
		if (task->data[1] <= 80)
			break;
		obj_delete_but_dont_free_vram(&gSprites[task->data[0]]);
		task->data[4] = 1;
		break;
	case 1:
		task->data[6] += 1;
		if (task->data[6] <= 1)
			break;
		REG_BLDCNT = 0;
		REG_BLDALPHA = 0;
		task->data[4] += 1;
		break;
	case 2:
		DestroyAnimVisualTask(taskId);
	}
}

void sub_80DE3AC(u8 taskId) {
	struct Task *task;

	task = &gTasks[taskId];
	task->data[15] = 0;
	task->func = &sub_80DE3D4;
	sub_80DE3D4(taskId);
}