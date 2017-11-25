#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

extern s8 gUnknown_083D680C[11][3];

static void sub_80CBC8C(struct Sprite* sprite);
static void sub_80CBCF8(struct Sprite* sprite);
static void sub_80CBDB0(struct Sprite* sprite);

// switch (makes an item and circles it from side to side on the field.)
// Used in Trick.

void sub_80CBBF0(struct Sprite* sprite)
{
    int a;
    int b;

    if (sprite->data[0] == 0)
    {
        if (!NotInBattle())
        {
            sprite->data[1] = gBattleAnimArgs[1];
            sprite->pos1.x = 0x78;
        }
        else
        {
            a = gBattleAnimArgs[1] - 32;
            if (a < 0)
                b = gBattleAnimArgs[1] + 0xDF;
            else
                b = a;

            sprite->data[1] = a - ((b >> 8) << 8);
            sprite->pos1.x = 0x46;
        }

        sprite->pos1.y = gBattleAnimArgs[0];
        sprite->data[2] = gBattleAnimArgs[0];
        sprite->data[4] = 20;
        sprite->pos2.x = Cos(sprite->data[1], 0x3C);
        sprite->pos2.y = Sin(sprite->data[1], 20);
        sprite->callback = sub_80CBC8C;
        if (sprite->data[1] > 0 && sprite->data[1] < 0xC0)
            sprite->subpriority = 31;
        else
            sprite->subpriority = 29;
    }
}

void sub_80CBC8C(struct Sprite* sprite)
{
    switch (sprite->data[3])
    {
    case 0:
        if (sprite->data[2] > 0x4E)
        {
            sprite->data[3] = 1;
            StartSpriteAffineAnim(sprite, 1);
            break;
        }
        else
        {
            sprite->data[2] += sprite->data[4] / 10;
            sprite->data[4] += 3;
            sprite->pos1.y = sprite->data[2];
            break;
        }
        break;
    case 1:
        if (sprite->data[3] && sprite->affineAnimEnded)
        {
            sprite->data[0] = 0;
            sprite->data[2] = 0;
            sprite->callback = sub_80CBCF8;
        }
        break;
    }
}

void sub_80CBCF8(struct Sprite* sprite)
{
    if (sprite->data[2] == gUnknown_083D680C[sprite->data[0]][1])
	{
	    if (gUnknown_083D680C[sprite->data[0]][2] == 0x7F)
		{
		    sprite->data[0] = 0;
			sprite->callback = sub_80CBDB0;
		}

		sprite->data[2] = 0;
		sprite->data[0]++;
	}
	else
	{
	    sprite->data[2]++;
		sprite->data[1] = (gUnknown_083D680C[sprite->data[0]][0] * gUnknown_083D680C[sprite->data[0]][2] + sprite->data[1]) & 0xFF;
		if (!NotInBattle())
		{
		    if ((u16)(sprite->data[1] - 1) <= 0xBE)
            {
			    sprite->subpriority = 31;
			}
			else
			{
			    sprite->subpriority = 29;
		    }
		}

		sprite->pos2.x = Cos(sprite->data[1], 0x3C);
		sprite->pos2.y = Sin(sprite->data[1], 20);
	}
}

void sub_80CBDB0(struct Sprite* sprite)
{
    if (sprite->data[0] > 20)
        move_anim_8072740(sprite);

	sprite->invisible = sprite->data[0] % 2;
	sprite->data[0]++;
}
