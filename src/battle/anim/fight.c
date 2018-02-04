#include "global.h"
#include "battle_anim.h"
#include "blend_palette.h"
#include "decompress.h"
#include "ewram.h"
#include "palette.h"
#include "rom_8077ABC.h"
#include "scanline_effect.h"
#include "sound.h"
#include "sprite.h"
#include "trig.h"
#include "constants/battle_constants.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern u8 gObjectBankIDs[];
extern u16 gBattle_BG1_X;
extern u16 gBattle_BG1_Y;
extern u16 gBattle_BG2_X;
extern u16 gBattle_BG2_Y;
extern u16 gBattle_WIN0H;
extern u16 gBattle_WIN0V;
extern u16 gBattlePartyID[];
extern u8 gAnimMoveTurn;

void sub_080B08A0(struct Sprite *sprite)
{
    sub_807867C(sprite, gBattleAnimArgs[0]);
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = 15;
    sprite->callback = sub_80782D8;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

void sub_80D902C(struct Sprite *sprite)
{
    if (gBattleAnimArgs[7] == 1 && GetBankSide(gAnimBankAttacker) != SIDE_PLAYER)
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
    }

    StartSpriteAnim(sprite, gBattleAnimArgs[6]);
    gBattleAnimArgs[6] = 0;
    sub_8079534(sprite);
}

void sub_80D9078(struct Sprite *sprite)
{
    if (IsContest())
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
    }

    sub_80D902C(sprite);
}

void sub_80D90A4(struct Sprite *sprite)
{
    StartSpriteAnim(sprite, gBattleAnimArgs[4]);

    if (gBattleAnimArgs[3] == 0)
        sub_80787B0(sprite, 1);
    else
        sub_8078764(sprite, 1);

    sprite->data[0] = gBattleAnimArgs[2];
    sprite->callback = sub_80782D8;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}
