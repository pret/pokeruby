#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern const union AffineAnimCmd gSpriteAffineAnim_83D66BC[];
extern const union AffineAnimCmd gSpriteAffineAnim_83D66DC[];
extern const union AnimCmd *const gSpriteAnimTable_83D66B8[];

void sub_80CBBF0(struct Sprite* sprite);
static void sub_80CBC8C(struct Sprite* sprite);
static void sub_80CBCF8(struct Sprite* sprite);
static void sub_80CBDB0(struct Sprite* sprite);

// switch (makes an item and circles it from side to side on the field.)
// Used in Trick.


const union AffineAnimCmd gSpriteAffineAnim_83D6794[] = {
    AFFINEANIMCMD_FRAME(0, 0, 0, 3),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83D67A4[] = {
    AFFINEANIMCMD_FRAME(0, -10, 0, 3),
    AFFINEANIMCMD_FRAME(0, -6, 0, 3),
    AFFINEANIMCMD_FRAME(0, -2, 0, 3),
    AFFINEANIMCMD_FRAME(0, 0, 0, 3),
    AFFINEANIMCMD_FRAME(0, 2, 0, 3),
    AFFINEANIMCMD_FRAME(0, 6, 0, 3),
    AFFINEANIMCMD_FRAME(0, 10, 0, 3),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D67E4[] = {
    gSpriteAffineAnim_83D6794,
    gSpriteAffineAnim_83D67A4,
    gSpriteAffineAnim_83D66BC,
    gSpriteAffineAnim_83D66DC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D67F4 =
{
    .tileTag = 10224,
    .paletteTag = 10224,
    .oam = &gOamData_837DF94,
    .anims = gSpriteAnimTable_83D66B8,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D67E4,
    .callback = sub_80CBBF0,
};

const s8 gUnknown_083D680C[][3] =
{
    {5, 24,   1},
    {0,  4,   0},
    {8, 16,  -1},
    {0,  2,   0},
    {8, 16,   1},
    {0,  2,   0},
    {8, 16,   1},
    {0,  2,   0},
    {8, 16,   1},
    {0, 16,   0},
    {0,  0, 127},
};

void sub_80CBBF0(struct Sprite* sprite)
{
    int a;
    int b;

    if (sprite->data[0] == 0)
    {
        if (!IsContest())
        {
            sprite->data[1] = gBattleAnimArgs[1];
            sprite->pos1.x = 120;
        }
        else
        {
            a = gBattleAnimArgs[1] - 32;
            if (a < 0)
                b = gBattleAnimArgs[1] + 0xDF;
            else
                b = a;

            sprite->data[1] = a - ((b >> 8) << 8);
            sprite->pos1.x = 70;
        }

        sprite->pos1.y = gBattleAnimArgs[0];
        sprite->data[2] = gBattleAnimArgs[0];
        sprite->data[4] = 20;
        sprite->pos2.x = Cos(sprite->data[1], 60);
        sprite->pos2.y = Sin(sprite->data[1], 20);
        sprite->callback = sub_80CBC8C;
        if (sprite->data[1] > 0 && sprite->data[1] < 0xC0)
            sprite->subpriority = 31;
        else
            sprite->subpriority = 29;
    }
}

static void sub_80CBC8C(struct Sprite* sprite)
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

static void sub_80CBCF8(struct Sprite* sprite)
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
		if (!IsContest())
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

		sprite->pos2.x = Cos(sprite->data[1], 60);
		sprite->pos2.y = Sin(sprite->data[1], 20);
	}
}

static void sub_80CBDB0(struct Sprite* sprite)
{
    if (sprite->data[0] > 20)
        DestroyAnimSprite(sprite);

	sprite->invisible = sprite->data[0] % 2;
	sprite->data[0]++;
}
