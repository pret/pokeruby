#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "random.h"

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7594 =
{
    .tileTag = 10175,
    .paletteTag = 10175,
    .oam = &gOamData_837DF2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80794A8,
};
