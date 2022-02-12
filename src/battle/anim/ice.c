#include "global.h"
#include "main.h"
#include "trig.h"
#include "rom_8077ABC.h"
#include "battle.h"
#include "battle_anim.h"
#include "constants/battle.h"
#include "task.h"
#include "decompress.h"
#include "palette.h"
#include "random.h"

extern s16 gBattleAnimArgs[];
extern u8  gBattleAnimAttacker;
extern u8  gBattleAnimTarget;
extern u8  gAnimVisualTaskCount;
extern u8  gBattlerPositions[];
extern u8  gBattlerSpriteIds[];

extern u16 gBattle_BG1_X;
extern u16 gBattle_BG1_Y;

extern const u8 gUnknown_083970E8[];

extern struct INCBIN_U8 gBattleAnimFogTilemap;
extern struct INCBIN_U8 gWeatherFog1Tiles;

static void sub_80D7704(struct Sprite *sprite);
static void sub_80D7888(struct Sprite *sprite);
static void AnimIcePunchSwirlingParticle(struct Sprite *sprite);
static void AnimIceBeamParticle(struct Sprite *sprite);
static void AnimIceEffectParticle(struct Sprite *sprite);
static void AnimFlickerIceEffectParticle(struct Sprite *sprite);
static void AnimMoveParticleBeyondTarget(struct Sprite *sprite);
static void AnimWaveFromCenterOfTarget(struct Sprite *sprite);
static void InitSwirlingFogAnim(struct Sprite *sprite);
static void AnimThrowMistBall(struct Sprite *sprite);
static void InitPoisonGasCloudAnim(struct Sprite *sprite);
static void AnimHailBegin(struct Sprite *sprite);
void sub_807A9BC(struct Sprite *sprite);
static void InitIceBallAnim(struct Sprite *sprite);
static void InitIceBallParticle(struct Sprite *sprite);
static void AnimSwirlingSnowball_Step1(struct Sprite *sprite);
static void AnimSwirlingSnowball_Step2(struct Sprite *sprite);
static void AnimSwirlingSnowball_Step3(struct Sprite *sprite);
static void AnimSwirlingSnowball_End(struct Sprite *sprite);
static void AnimWiggleParticleTowardsTarget(struct Sprite *sprite);
static void AnimSwirlingFogAnim(struct Sprite *sprite);
static void sub_80D8874(struct Sprite *sprite);
static void AnimHailContinue(struct Sprite *sprite);
static void AnimThrowIceBall(struct Sprite *sprite);
static void AnimIceBallParticle(struct Sprite *sprite);

static void AnimTask_Haze2(u8 taskId);
static void AnimTask_OverlayFogTiles(u8 taskId);
static void AnimTask_Hail2(u8 taskId);
bool8 sub_80D8BA8(u8 hailStructId, u8 affineAnimNum, u8 taskId, u8 c);

struct HailStruct
{
    s32 x:10;
    s32 y:10;
    s32 bPosition:8;
    s32 unk3:4;
};

const union AnimCmd gSpriteAnim_83D9B58[] =
{
    ANIMCMD_FRAME(0, 5, .hFlip = TRUE),
    ANIMCMD_FRAME(1, 5, .hFlip = TRUE),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_83D9B64[] =
{
    gSpriteAnim_83D9B58,
};

// unknown sprite template
const struct SpriteTemplate gSpriteTemplate_83D9B68 =
{
    .tileTag = ANIM_TAG_ICE_CRYSTALS,
    .paletteTag = ANIM_TAG_ICE_CRYSTALS,
    .oam = &gOamData_837DF24,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D7704,
};

const union AnimCmd gSpriteAnim_83D9B80[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D9B88[] =
{
    ANIMCMD_FRAME(4, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D9B90[] =
{
    ANIMCMD_FRAME(6, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D9B98[] =
{
    ANIMCMD_FRAME(7, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D9BA0[] =
{
    ANIMCMD_FRAME(8, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D9BA8[] =
{
    ANIMCMD_FRAME(12, 6),
    ANIMCMD_FRAME(13, 6),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_83D9BB4[] =
{
    gSpriteAnim_83D9B80,
};

const union AnimCmd *const gSpriteAnimTable_83D9BB8[] =
{
    gSpriteAnim_83D9B88,
};

const union AnimCmd *const gSpriteAnimTable_83D9BBC[] =
{
    gSpriteAnim_83D9B90,
};

const union AnimCmd *const gSpriteAnimTable_83D9BC0[] =
{
    gSpriteAnim_83D9B98,
};

const union AnimCmd *const gSpriteAnimTable_83D9BC4[] =
{
    gSpriteAnim_83D9BA0,
};

const union AnimCmd *const gSpriteAnimTable_83D9BC8[] =
{
    gSpriteAnim_83D9BA8,
};

const union AffineAnimCmd gSpriteAffineAnim_83D9BCC[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 40, 1),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D9BDC[] =
{
    gSpriteAffineAnim_83D9BCC,
};

const struct SpriteTemplate gLargeIcePunchCrystalSpriteTemplate =
{
    .tileTag = ANIM_TAG_ICE_CRYSTALS,
    .paletteTag = ANIM_TAG_ICE_CRYSTALS,
    .oam = &gOamData_837E144,
    .anims = gSpriteAnimTable_83D9BB8,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9BDC,
    .callback = AnimIcePunchSwirlingParticle,
};

const struct SpriteTemplate gSmallIcePunchCrystalSpriteTemplate =
{
    .tileTag = ANIM_TAG_ICE_CRYSTALS,
    .paletteTag = ANIM_TAG_ICE_CRYSTALS,
    .oam = &gOamData_837E044,
    .anims = gSpriteAnimTable_83D9BBC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimIcePunchSwirlingParticle,
};

const union AffineAnimCmd gSpriteAffineAnim_83D9C10[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 10, 1),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D9C20[] =
{
    gSpriteAffineAnim_83D9C10,
};

const struct SpriteTemplate IceBeamCenterParticleSpriteTemplate =
{
    .tileTag = ANIM_TAG_ICE_CRYSTALS,
    .paletteTag = ANIM_TAG_ICE_CRYSTALS,
    .oam = &gOamData_837E0E4,
    .anims = gSpriteAnimTable_83D9BB8,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9C20,
    .callback = AnimIceBeamParticle,
};

const struct SpriteTemplate gIceBeamOuterParticleSpriteTemplate =
{
    .tileTag = ANIM_TAG_ICE_CRYSTALS,
    .paletteTag = ANIM_TAG_ICE_CRYSTALS,
    .oam = &gOamData_837E044,
    .anims = gSpriteAnimTable_83D9BBC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimIceBeamParticle,
};

const union AffineAnimCmd gSpriteAffineAnim_83D9C54[] =
{
    AFFINEANIMCMD_FRAME(0xCE, 0xCE, 0, 0),
    AFFINEANIMCMD_FRAME(0x5, 0x5, 0, 10),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 6),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D9C74[] =
{
    gSpriteAffineAnim_83D9C54,
};

const struct SpriteTemplate gLargeIceEffectParticleSpriteTemplate =
{
    .tileTag = ANIM_TAG_ICE_CRYSTALS,
    .paletteTag = ANIM_TAG_ICE_CRYSTALS,
    .oam = &gOamData_837E0E4,
    .anims = gSpriteAnimTable_83D9BB8,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9C74,
    .callback = AnimIceEffectParticle,
};

const struct SpriteTemplate gSmallIceEffectParticleSpriteTemplate =
{
    .tileTag = ANIM_TAG_ICE_CRYSTALS,
    .paletteTag = ANIM_TAG_ICE_CRYSTALS,
    .oam = &gOamData_837E0A4,
    .anims = gSpriteAnimTable_83D9BBC,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9C74,
    .callback = AnimIceEffectParticle,
};

const struct SpriteTemplate gSmallSnowballSpriteTemplate1 =
{
    .tileTag = ANIM_TAG_ICE_CRYSTALS,
    .paletteTag = ANIM_TAG_ICE_CRYSTALS,
    .oam = &gOamData_837DF24,
    .anims = gSpriteAnimTable_83D9BC0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSwirlingSnowball_Step1,
};

const struct SpriteTemplate gLargeSnowballSpriteTemplate =
{
    .tileTag = ANIM_TAG_ICE_CRYSTALS,
    .paletteTag = ANIM_TAG_ICE_CRYSTALS,
    .oam = &gOamData_837DF2C,
    .anims = gSpriteAnimTable_83D9BC4,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimMoveParticleBeyondTarget,
};

const struct SpriteTemplate gSmallSnowballSpriteTemplate2 =
{
    .tileTag = ANIM_TAG_ICE_CRYSTALS,
    .paletteTag = ANIM_TAG_ICE_CRYSTALS,
    .oam = &gOamData_837DF24,
    .anims = gSpriteAnimTable_83D9BC0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimMoveParticleBeyondTarget,
};

const union AnimCmd gSpriteAnim_83D9CF0[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_FRAME(2, 5),
    ANIMCMD_FRAME(4, 5),
    ANIMCMD_FRAME(6, 5),
    ANIMCMD_FRAME(4, 5),
    ANIMCMD_FRAME(2, 5),
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D9D10[] =
{
    gSpriteAnim_83D9CF0,
};

const struct SpriteTemplate gIceSpikeSpriteTemplate =
{
    .tileTag = ANIM_TAG_ICE_SPIKES,
    .paletteTag = ANIM_TAG_ICE_SPIKES,
    .oam = &gOamData_837E084,
    .anims = gSpriteAnimTable_83D9D10,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimWaveFromCenterOfTarget,
};

const union AnimCmd gSpriteAnim_83D9D2C[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(8, 8),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_83D9D38[] =
{
    gSpriteAnim_83D9D2C,
};

const struct SpriteTemplate gMistCloudSpriteTemplate =
{
    .tileTag = ANIM_TAG_MIST_CLOUD,
    .paletteTag = ANIM_TAG_MIST_CLOUD,
    .oam = &gOamData_837E074,
    .anims = gSpriteAnimTable_83D9D38,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = InitSwirlingFogAnim,
};

const struct SpriteTemplate gSmogCloudSpriteTemplate =
{
    .tileTag = ANIM_TAG_PURPLE_GAS_CLOUD,
    .paletteTag = ANIM_TAG_PURPLE_GAS_CLOUD,
    .oam = &gOamData_837E074,
    .anims = gSpriteAnimTable_83D9D38,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = InitSwirlingFogAnim,
};

const u8 gUnknown_083D9D6C[] =
{
    0, 1, 2, 2, 2, 2, 3, 4, 4, 4, 5, 6, 6, 6, 6, 7, 8, 8, 8, 9,
};

const struct SpriteTemplate gMistBallSpriteTemplate =
{
    .tileTag = ANIM_TAG_SMALL_BUBBLES,
    .paletteTag = ANIM_TAG_SMALL_BUBBLES,
    .oam = &gOamData_837DF2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimThrowMistBall,
};

const u8 gUnknown_083D9D98[] =
{
    0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 5,
};

const struct SpriteTemplate gPoisonGasCloudSpriteTemplate =
{
    .tileTag = ANIM_TAG_PURPLE_GAS_CLOUD,
    .paletteTag = ANIM_TAG_PURPLE_GAS_CLOUD,
    .oam = &gOamData_837E074,
    .anims = gSpriteAnimTable_83D9D38,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = InitPoisonGasCloudAnim,
};

const struct HailStruct gUnknown_083D9DC4[] =
{
    {.x = 100, .y = 120, .bPosition = B_POSITION_PLAYER_LEFT,    .unk3 = 2},
    {.x = 85,  .y = 120, .bPosition = B_POSITION_PLAYER_LEFT,    .unk3 = 0},
    {.x = 242, .y = 120, .bPosition = B_POSITION_OPPONENT_LEFT,  .unk3 = 1},
    {.x = 66,  .y = 120, .bPosition = B_POSITION_PLAYER_RIGHT,   .unk3 = 1},
    {.x = 182, .y = 120, .bPosition = B_POSITION_OPPONENT_RIGHT, .unk3 = 0},
    {.x = 60,  .y = 120, .bPosition = B_POSITION_PLAYER_LEFT,    .unk3 = 2},
    {.x = 214, .y = 120, .bPosition = B_POSITION_OPPONENT_LEFT,  .unk3 = 0},
    {.x = 113, .y = 120, .bPosition = B_POSITION_PLAYER_LEFT,    .unk3 = 1},
    {.x = 210, .y = 120, .bPosition = B_POSITION_OPPONENT_RIGHT, .unk3 = 1},
    {.x = 38,  .y = 120, .bPosition = B_POSITION_PLAYER_RIGHT,   .unk3 = 0},
};

const union AffineAnimCmd gSpriteAffineAnim_83D9DEC[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83D9DFC[] =
{
    AFFINEANIMCMD_FRAME(0xF0, 0xF0, 0, 0),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83D9E0C[] =
{
    AFFINEANIMCMD_FRAME(0xE0, 0xE0, 0, 0),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83D9E1C[] =
{
    AFFINEANIMCMD_FRAME(0x150, 0x150, 0, 0),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D9E2C[] =
{
    gSpriteAffineAnim_83D9DEC,
    gSpriteAffineAnim_83D9DFC,
    gSpriteAffineAnim_83D9E0C,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D9E38[] =
{
    gSpriteAffineAnim_83D9E1C,
};

const struct SpriteTemplate gHailSpriteTemplate =
{
    .tileTag = ANIM_TAG_HAIL,
    .paletteTag = ANIM_TAG_HAIL,
    .oam = &gOamData_837DF8C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9E2C,
    .callback = AnimHailBegin,
};

const struct SpriteTemplate gWeatherBallHailSpriteTemplate =
{
    .tileTag = ANIM_TAG_HAIL,
    .paletteTag = ANIM_TAG_HAIL,
    .oam = &gOamData_837DF8C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9E38,
    .callback = sub_807A9BC,
};

const union AnimCmd gSpriteAnim_83D9E6C[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D9E74[] =
{
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_FRAME(48, 4),
    ANIMCMD_FRAME(64, 4),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D9E88[] =
{
    gSpriteAnim_83D9E6C,
    gSpriteAnim_83D9E74,
};

const union AffineAnimCmd gSpriteAffineAnim_83D9E90[] =
{
    AFFINEANIMCMD_FRAME(0xE0, 0xE0, 0, 0),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83D9EA0[] =
{
    AFFINEANIMCMD_FRAME(0x118, 0x118, 0, 0),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83D9EB0[] =
{
    AFFINEANIMCMD_FRAME(0x150, 0x150, 0, 0),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83D9EC0[] =
{
    AFFINEANIMCMD_FRAME(0x180, 0x180, 0, 0),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83D9ED0[] =
{
    AFFINEANIMCMD_FRAME(0x1C0, 0x1C0, 0, 0),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D9EE0[] =
{
    gSpriteAffineAnim_83D9E90,
    gSpriteAffineAnim_83D9EA0,
    gSpriteAffineAnim_83D9EB0,
    gSpriteAffineAnim_83D9EC0,
    gSpriteAffineAnim_83D9ED0,
};

const struct SpriteTemplate gIceBallSpriteTemplate =
{
    .tileTag = ANIM_TAG_ICE_CHUNK,
    .paletteTag = ANIM_TAG_ICE_CHUNK,
    .oam = &gOamData_837DFF4,
    .anims = gSpriteAnimTable_83D9E88,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9EE0,
    .callback = InitIceBallAnim,
};

const struct SpriteTemplate gIceBallParticleSpriteTemplate =
{
    .tileTag = ANIM_TAG_ICE_CRYSTALS,
    .paletteTag = ANIM_TAG_ICE_CRYSTALS,
    .oam = &gOamData_837DF24,
    .anims = gSpriteAnimTable_83D9BBC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = InitIceBallParticle,
};

static void sub_80D7704(struct Sprite *sprite)
{
    s16 targetX, targetY, attackerX, attackerY;

    sprite->oam.tileNum += 7;
    targetX = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2);
    targetY = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET);
    attackerX = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X_2);
    attackerY = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y_PIC_OFFSET);
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[1] = gBattleAnimArgs[0] + attackerX;
    sprite->data[2] = gBattleAnimArgs[2] + targetX;
    sprite->data[3] = gBattleAnimArgs[1] + attackerY;
    sprite->data[4] = gBattleAnimArgs[3] + targetY;
    sub_8078314(sprite);

    for (;(targetX >= -32 && targetX <= 272) && (targetY >= -32 && targetY <= 192);
           targetX += sprite->data[1], targetY += sprite->data[2])
        ;

    sprite->data[1] = -sprite->data[1];
    sprite->data[2] = -sprite->data[2];
    for (;(attackerX >= -32 && attackerX <= 272) && (attackerY >= -32 && attackerY <= 192);
           attackerX += sprite->data[1], attackerY += sprite->data[2])
        ;

    sprite->x = attackerX;
    sprite->y = attackerY;
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[1] = attackerX;
    sprite->data[2] = targetX;
    sprite->data[3] = attackerY;
    sprite->data[4] = targetY;
    sub_8078314(sprite);
    sprite->data[3] = gBattleAnimArgs[5];
    sprite->data[4] = gBattleAnimArgs[6];
    sprite->callback = sub_80D7888;
}

static void sub_80D7888(struct Sprite *sprite)
{
    if (sprite->data[0] != 0)
    {
        sprite->data[5] += sprite->data[1];
        sprite->data[6] += sprite->data[2];
        sprite->x2 = sprite->data[5];
        sprite->y2 = sprite->data[6];
        sprite->x2 += Sin(sprite->data[7], sprite->data[3]); 
        sprite->y2 += Sin(sprite->data[7], sprite->data[3]);
        sprite->data[7] = (sprite->data[7] + sprite->data[4]) & 0xFF;
        sprite->data[0] -= 1;
    }
    else
    {
        DestroyAnimSprite(sprite);
    }
}

// Animates the swirling ice crystals in Ice Punch.
// arg 0: initial position angle around circle (0-256)
static void AnimIcePunchSwirlingParticle(struct Sprite *sprite)
{
    sprite->data[0] = gBattleAnimArgs[0];
    sprite->data[1] = 60; 
    sprite->data[2] = 9; 
    sprite->data[3] = 30; 
    sprite->data[4] = 65024; 
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    sprite->callback = sub_8078174;
    sub_8078174(sprite);
}

// Animates the ice particles in Ice Beam.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: target x offset
// arg 3: target y offset
// arg 4: duration
static void AnimIceBeamParticle(struct Sprite *sprite)
{
    InitAnimSpritePos(sprite, 1);
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, 2);

    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        sprite->data[2] -= gBattleAnimArgs[2];
    else
        sprite->data[2] += gBattleAnimArgs[2];

    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, 3) + gBattleAnimArgs[3];
    sprite->data[0] = gBattleAnimArgs[4];
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    sprite->callback = StartAnimLinearTranslation;
}

// Animates the ice crystals at the end of Ice Punch, Ice Beam, Tri Attack, 
// Weather Ball (Hail), Blizzard, and Powder Snow.
// arg 0: target x offset
// arg 1: target y offset
// arg 2: ??? unknown boolean
static void AnimIceEffectParticle(struct Sprite *sprite)
{
    if (gBattleAnimArgs[2] == 0)
    {
        InitSpritePosToAnimTarget(sprite, TRUE);
    }
    else
    {
        SetAverageBattlerPositions(gBattleAnimTarget, 1, &sprite->x, &sprite->y);
        if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
            gBattleAnimArgs[0] = -gBattleAnimArgs[0];

        sprite->x += gBattleAnimArgs[0];
        sprite->y += gBattleAnimArgs[1];
    }

    StoreSpriteCallbackInData(sprite, AnimFlickerIceEffectParticle);
    sprite->callback = sub_80785E4;
}

static void AnimFlickerIceEffectParticle(struct Sprite *sprite)
{
    sprite->invisible ^= 1;
    sprite->data[0] += 1;
    if (sprite->data[0] == 20)
        DestroySpriteAndMatrix(sprite);
}

// Animates the small snowballs that swirl around the target in Blizzard and Icy Wind.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: target x offset
// arg 3: target y offset
// arg 4: particle speed
// arg 5: multiple targets? (boolean)
static void AnimSwirlingSnowball_Step1(struct Sprite *sprite)
{
    int i;
    s16 tempDataHolder[8];

    InitAnimSpritePos(sprite, 1);

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[1] = sprite->x;
    sprite->data[3] = sprite->y;

    if (!gBattleAnimArgs[5])
    {
        sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, 2);
        sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, 3) + gBattleAnimArgs[3];
    }
    else
    {
        SetAverageBattlerPositions(gBattleAnimTarget, 1, &sprite->data[2], &sprite->data[4]);
    }

    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        sprite->data[2] -= gBattleAnimArgs[2];
    else
        sprite->data[2] += gBattleAnimArgs[2];

    for (i = 0; i < 8; i++)
        tempDataHolder[i] = sprite->data[i];

    sub_8078D60(sprite);
    sprite->data[1] ^= 1;
    sprite->data[2] ^= 1;

    while (1)
    {
        sprite->data[0] = 1;
        sub_8078CE8(sprite);

        if ((u32)(sprite->x + sprite->x2 + 16) > 272
         || sprite->y + sprite->y2 > 160
         || sprite->y + sprite->y2 < -16)
            break;
    }

    sprite->x += sprite->x2;
    sprite->y += sprite->y2;
    sprite->y2 = 0;
    sprite->x2 = 0;

    for (i = 0; i < 8; i++)
        sprite->data[i] = tempDataHolder[i];

    sprite->callback = sub_8078D8C;
    StoreSpriteCallbackInData(sprite, AnimSwirlingSnowball_Step2);
}

static void AnimSwirlingSnowball_Step2(struct Sprite *sprite)
{
    s16 tempVar;

    sprite->x += sprite->x2;
    sprite->y += sprite->y2;
    sprite->y2 = 0;
    sprite->x2 = 0;
    sprite->data[0] = 128;

    tempVar = GetBattlerSide(gBattleAnimAttacker) != 0 ? 20 : 65516;

    sprite->data[3] = Sin(sprite->data[0], tempVar);
    sprite->data[4] = Cos(sprite->data[0], 0xF);
    sprite->data[5] = 0;
    sprite->callback = AnimSwirlingSnowball_Step3;
    AnimSwirlingSnowball_Step3(sprite);
}

static void AnimSwirlingSnowball_Step3(struct Sprite *sprite)
{
    s16 tempVar;
    tempVar = GetBattlerSide(gBattleAnimAttacker) != 0 ? 20 : 65516;

    if (sprite->data[5] <= 31)
    {
        sprite->x2 = Sin(sprite->data[0], tempVar) - sprite->data[3];
        sprite->y2 = Cos(sprite->data[0], 15)      - sprite->data[4];
        sprite->data[0] = (sprite->data[0] + 16) & 0xFF;
        sprite->data[5] += 1;
    }
    else
    {
        sprite->x += sprite->x2;
        sprite->y += sprite->y2;
        sprite->y2 = 0;
        sprite->x2 = 0;
        sprite->data[4] = 0;
        sprite->data[3] = 0;
        sprite->callback = AnimSwirlingSnowball_End;
    }
}

static void AnimSwirlingSnowball_End(struct Sprite *sprite)
{
    sprite->data[0] = 1;
    sub_8078CE8(sprite);

    if ((u32)(sprite->x + sprite->x2 + 16) > 272
     || sprite->y + sprite->y2 > 256
     || sprite->y + sprite->y2 < -16)
        DestroyAnimSprite(sprite);
}

// Moves particles towards the target mon and off the screen. Used to animate
// the large snowballs in Blizzard and the small snowballs in Powder Snow.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: target x offset
// arg 3: target y offset
// arg 4: speed
// arg 5: wave amplitude
// arg 6: wave frequency
// arg 7: multiple targets? (boolean)
static void AnimMoveParticleBeyondTarget(struct Sprite *sprite)
{
    int i;
    s16 tempDataHolder[8];

    InitAnimSpritePos(sprite, 1);

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[1] = sprite->x;
    sprite->data[3] = sprite->y;

    if (!gBattleAnimArgs[7])
    {
        sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, 2);
        sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, 3);
    }
    else
    {
        SetAverageBattlerPositions(gBattleAnimTarget, 1, &sprite->data[2], &sprite->data[4]);
    }

    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        sprite->data[2] -= gBattleAnimArgs[2];
    else
        sprite->data[2] += gBattleAnimArgs[2];

    sprite->data[4] += gBattleAnimArgs[3];
    sub_8078D60(sprite);
    for (i = 0; i < 8; i++)
        tempDataHolder[i] = sprite->data[i];

    sprite->data[1] ^= 1;
    sprite->data[2] ^= 1;

    while (1)
    {
        sprite->data[0] = 1;
        sub_8078CE8(sprite);
        if ((u32)(sprite->x + sprite->x2 + 16) > 272
         || sprite->y + sprite->y2 > 160
         || sprite->y + sprite->y2 < -16)
            break;
    }

    sprite->x += sprite->x2;
    sprite->y += sprite->y2;
    sprite->y2 = 0;
    sprite->x2 = 0;

    for (i = 0; i < 8; i++)
        sprite->data[i] = tempDataHolder[i];

    sprite->data[5] = gBattleAnimArgs[5];
    sprite->data[6] = gBattleAnimArgs[6];
    sprite->callback = AnimWiggleParticleTowardsTarget;
}

// Moves particles in a sine wave towards the target.
static void AnimWiggleParticleTowardsTarget(struct Sprite *sprite)
{
    sub_8078CE8(sprite);
    if (sprite->data[0] == 0)
        sprite->data[0] = 1;

    sprite->y2 += Sin(sprite->data[7], sprite->data[5]);
    sprite->data[7] = (sprite->data[7] + sprite->data[6]) & 0xFF;
    if (sprite->data[0] == 1)
    {
        if ((u32)(sprite->x + sprite->x2 + 16) > 272
         || sprite->y + sprite->y2 > 160
         || sprite->y + sprite->y2 < -16)
            DestroyAnimSprite(sprite);
    }
}

// Animates the ice pilar wave used by Icy Wind.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: ??? unknown boolean
static void AnimWaveFromCenterOfTarget(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        if (gBattleAnimArgs[2] == 0)
        {
            InitSpritePosToAnimTarget(sprite, FALSE);
        }
        else
        {
            SetAverageBattlerPositions(gBattleAnimTarget, 0, &sprite->x, &sprite->y);

            if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
                gBattleAnimArgs[0] = -gBattleAnimArgs[0];

            sprite->x += gBattleAnimArgs[0];
            sprite->y += gBattleAnimArgs[1];
        }

        sprite->data[0]++; 
    }
    else
    {
        if (sprite->animEnded)
            DestroyAnimSprite(sprite);
    }
}

// Animates the fog that swirls around the mon in Mist and Smog.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: change in y pixels per rotation
// arg 3: duration
// arg 4: animate on opponent? (boolean)
// arg 5: ??? unknown boolean
static void InitSwirlingFogAnim(struct Sprite *sprite)
{
    s16 tempVar;
    u8  battler;

    if (gBattleAnimArgs[4] == 0)
    {
        if (gBattleAnimArgs[5] == 0)
        {
            InitAnimSpritePos(sprite, 0);
        }
        else
        {
            SetAverageBattlerPositions(gBattleAnimAttacker, 0, &sprite->x, &sprite->y);
            if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER) 
                sprite->x -= gBattleAnimArgs[0];
            else 
                sprite->x += gBattleAnimArgs[0];

            sprite->y += gBattleAnimArgs[1];
        }

        battler = gBattleAnimAttacker;
    }
    else 
    {
        if (gBattleAnimArgs[5] == 0)
        {
            InitSpritePosToAnimTarget(sprite, FALSE);
        }
        else 
        {
            SetAverageBattlerPositions(gBattleAnimTarget, 0, &sprite->x, &sprite->y);
            if (GetBattlerSide(gBattleAnimTarget) != B_SIDE_PLAYER)
                sprite->x -= gBattleAnimArgs[0];
            else 
                sprite->x += gBattleAnimArgs[0];

            sprite->y += gBattleAnimArgs[1];
        }

        battler = gBattleAnimTarget;
    }

    sprite->data[7] = battler;
    if (gBattleAnimArgs[5] == 0 || !IsDoubleBattle()) 
        tempVar = 0x20;
    else
        tempVar = 0x40;

    sprite->data[6] = tempVar;
    if (GetBattlerSide(gBattleAnimTarget) == B_SIDE_PLAYER)
        sprite->y += 8;

    sprite->data[0] = gBattleAnimArgs[3];
    sprite->data[1] = sprite->x;
    sprite->data[2] = sprite->x;
    sprite->data[3] = sprite->y;
    sprite->data[4] = sprite->y + gBattleAnimArgs[2];

    InitAnimLinearTranslation(sprite);

    sprite->data[5] = 64;
    sprite->callback = AnimSwirlingFogAnim;
    AnimSwirlingFogAnim(sprite);
}

// Animates swirling fog initialized by InitSwirlingFogAnim.
static void AnimSwirlingFogAnim(struct Sprite *sprite)
{
    if (!TranslateAnimLinear(sprite))
    {
        sprite->x2 += Sin(sprite->data[5], sprite->data[6]);
        sprite->y2 += Cos(sprite->data[5], -6);

        if ((u16)(sprite->data[5] - 64) <= 0x7F)
            sprite->oam.priority = GetBattlerSpriteBGPriority(sprite->data[7]); 
        else
            sprite->oam.priority = GetBattlerSpriteBGPriority(sprite->data[7]) + 1;

        sprite->data[5] = (sprite->data[5] + 3) & 0xFF;
    }
    else
    {
        DestroyAnimSprite(sprite);
    }
}

// Fades mons to black and places foggy overlay in Haze.
void AnimTask_Haze1(u8 taskId)
{
    struct Struct_sub_8078914 subStruct;

    REG_BLDCNT = 0x3F42;
    REG_BLDALPHA = 0x1000;
    REG_BG1CNT_BITFIELD.priority = 1;
    REG_BG1CNT_BITFIELD.screenSize = 0;

    if (!IsContest())
        REG_BG1CNT_BITFIELD.charBaseBlock = 1;

    gBattle_BG1_X = 0;
    gBattle_BG1_Y = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;

    sub_8078914(&subStruct);
    DmaFill32Defvars(3, 0, subStruct.field_4, 0x1000);
    DmaCopy16Defvars(3, &gWeatherFog1Tiles, subStruct.field_0, 0x800);
    LZDecompressVram(&gBattleAnimFogTilemap, subStruct.field_4);
    LoadPalette(&gUnknown_083970E8, subStruct.field_8 * 16, 32);

    if (IsContest())
        sub_80763FC(subStruct.field_8, (u16 *)subStruct.field_4, 0, 0);
    
    gTasks[taskId].func = AnimTask_Haze2;
}

static void AnimTask_Haze2(u8 taskId)
{
    struct Struct_sub_8078914 subStruct;

    gBattle_BG1_X += 0xFFFF;
    gBattle_BG1_Y += 0;

    switch (gTasks[taskId].data[12])
    {
    case 0:
        if (++gTasks[taskId].data[10] == 4)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[9]++;
            gTasks[taskId].data[11] = gUnknown_083D9D6C[gTasks[taskId].data[9]];

            REG_BLDALPHA = gTasks[taskId].data[11] | ((16 - gTasks[taskId].data[11]) << 8);
            if (gTasks[taskId].data[11] == 9)
            {
                gTasks[taskId].data[12]++;
                gTasks[taskId].data[11] = 0;
            }
        }
        break;
    case 1:
        if (++gTasks[taskId].data[11] == 0x51)
        {
            gTasks[taskId].data[11] = 9;
            gTasks[taskId].data[12]++;
        }
        break;
    case 2:
        if (++gTasks[taskId].data[10] == 4)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[11]--;

            REG_BLDALPHA = gTasks[taskId].data[11] | ((16 - gTasks[taskId].data[11]) << 8);
            if (gTasks[taskId].data[11] == 0)
            {
                gTasks[taskId].data[12]++;
                gTasks[taskId].data[11] = 0;
            }
        }
        break;
    case 3:
        sub_8078914(&subStruct);
        DmaFill32Large(3, 0, subStruct.field_0, 0x2000, 0x1000);
        DmaClear32(3, subStruct.field_4, 0x800);

        if (!IsContest())
            REG_BG1CNT_BITFIELD.charBaseBlock = 0;

        gTasks[taskId].data[12]++;
        // fall through
    case 4:
        gBattle_BG1_X = 0;
        gBattle_BG1_Y = 0;
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        REG_BG1CNT_BITFIELD.priority = 1;
        DestroyAnimVisualTask(taskId);
    }
} 

// Throws the ball in Mist Ball.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: targey x offset
// arg 3: target y offset
// arg 4: duration
// arg 5: ??? unknown (seems to vibrate target mon somehow)
static void AnimThrowMistBall(struct Sprite *sprite)
{
    sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
    sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
    sprite->callback = TranslateAnimSpriteToTargetMonLocation;
}

// Displays misty background in Mist Ball.
void AnimTask_LoadMistTiles(u8 taskId)
{
    struct Struct_sub_8078914 subStruct;

    REG_BLDCNT = 0x3F42;
    REG_BLDALPHA = 0x1000;
    REG_BG1CNT_BITFIELD.priority = 1;
    REG_BG1CNT_BITFIELD.screenSize = 0; 

    if (!IsContest())
        REG_BG1CNT_BITFIELD.charBaseBlock = 1;

    gBattle_BG1_X = 0;
    gBattle_BG1_Y = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;

    sub_8078914(&subStruct);
    DmaFill32Defvars(3, 0, subStruct.field_4, 0x1000);
    DmaCopy16Defvars(3, &gWeatherFog1Tiles, subStruct.field_0, 0x800);
    LZDecompressVram(&gBattleAnimFogTilemap, subStruct.field_4);
    LoadPalette(&gUnknown_083970E8, subStruct.field_8 * 16, 32);

    if (IsContest())
        sub_80763FC(subStruct.field_8, (u16 *)subStruct.field_4, 0, 0);

    gTasks[taskId].data[15] = -1;
    gTasks[taskId].func = AnimTask_OverlayFogTiles;
}

static void AnimTask_OverlayFogTiles(u8 taskId)
{
    struct Struct_sub_8078914 subStruct;

    gBattle_BG1_X += gTasks[taskId].data[15];
    gBattle_BG1_Y += 0;

    switch (gTasks[taskId].data[12])
    {
    case 0:
        gTasks[taskId].data[9] += 1;
        gTasks[taskId].data[11] = gUnknown_083D9D98[gTasks[taskId].data[9]];
        REG_BLDALPHA = gTasks[taskId].data[11] | ((17 - gTasks[taskId].data[11]) << 8);
        if (gTasks[taskId].data[11] == 5)
        {
            gTasks[taskId].data[12]++;
            gTasks[taskId].data[11] = 0;
        }
        break;
    case 1:
        if (++gTasks[taskId].data[11] == 0x51)
        {
            gTasks[taskId].data[11] = 5;
            gTasks[taskId].data[12]++;
        }
        break;
    case 2:
        if (++gTasks[taskId].data[10] == 4)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[11] -= 1;
            REG_BLDALPHA = gTasks[taskId].data[11] | ((16 - gTasks[taskId].data[11]) << 8);
            if (gTasks[taskId].data[11] == 0)
            {
                gTasks[taskId].data[12]++;
                gTasks[taskId].data[11] = 0;
            }
        }
        break;
    case 3:
        sub_8078914(&subStruct);
        DmaFill32Large(3, 0, subStruct.field_0, 0x2000, 0x1000);
        DmaClear32(3, subStruct.field_4, 0x800);

        if (!IsContest())
            REG_BG1CNT_BITFIELD.charBaseBlock = 0;

        gTasks[taskId].data[12]++;
        // fall through
    case 4:
        gBattle_BG1_X = 0;
        gBattle_BG1_Y = 0;
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        REG_BG1CNT_BITFIELD.priority = 1;
        DestroyAnimVisualTask(taskId);
    }
}

// Initializes gas clouds in the Poison Gas animation.
// arg 0: duration
// arg 1: ? target x offset
// arg 2: ? target y offset
// arg 3: ? swirl start x
// arg 4: ? swirl start y
// arg 5: ??? unknown
// arg 6: ??? unknown
// arg 7: ??? unknown boolean
static void InitPoisonGasCloudAnim(struct Sprite *sprite)
{
    sprite->data[0] = gBattleAnimArgs[0];

    if (GetBattlerSpriteCoord(gBattleAnimAttacker, 2) < GetBattlerSpriteCoord(gBattleAnimTarget, 2))
        sprite->data[7] = 0x8000;

    if (!(gBattlerPositions[gBattleAnimTarget] & 1))
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];

        if ((sprite->data[7] & 0x8000) && !(gBattlerPositions[gBattleAnimAttacker] & 1))
            sprite->subpriority = gSprites[GetAnimBattlerSpriteId(1)].subpriority + 1;

        sprite->data[6] = 1; 
    }

    sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
    sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
    if (gBattleAnimArgs[7])
    {
        sprite->data[1] = sprite->x + gBattleAnimArgs[1];
        sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, 2) + gBattleAnimArgs[3];
        sprite->data[3] = sprite->y + gBattleAnimArgs[2];
        sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, 3) + gBattleAnimArgs[4];
        sprite->data[7] |= GetBattlerSpriteBGPriority(gBattleAnimTarget) << 8;
    }
    else
    {
        sprite->data[1] = sprite->x + gBattleAnimArgs[1];
        sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, 0) + gBattleAnimArgs[3];
        sprite->data[3] = sprite->y + gBattleAnimArgs[2];
        sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, 1) + gBattleAnimArgs[4];
        sprite->data[7] |= GetBattlerSpriteBGPriority(gBattleAnimTarget) << 8;
    } 

    if (IsContest())
    {
        sprite->data[6] = 1;
        sprite->subpriority = 0x80;
    }

    InitAnimLinearTranslation(sprite);
    sprite->callback = sub_80D8874;
}

// Animates the gas clouds towards the target mon in Poison Gas.
static void sub_80D8874(struct Sprite *sprite)
{
    int value;

    switch (sprite->data[7] & 0xFF)
    {
    case 0:
        TranslateAnimLinear(sprite);
        value = gSineTable[sprite->data[5]];
        sprite->x2 += value >> 4;
        if (sprite->data[6])
            sprite->data[5] = (sprite->data[5] - 8) & 0xFF;
        else
            sprite->data[5] = (sprite->data[5] + 8) & 0xFF;

        if (sprite->data[0] <= 0)
        {
            sprite->data[0] = 80;
            sprite->x = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X);
            sprite->data[1] = sprite->x;
            sprite->data[2] = sprite->x;
            sprite->y += sprite->y2;
            sprite->data[3] = sprite->y;
            sprite->data[4] = sprite->y + 29;
            sprite->data[7]++;
            if (!gMain.inBattle)
                sprite->data[5] = 80;
            else if (gBattlerPositions[gBattleAnimTarget] & 1)
                sprite->data[5] = 204;
            else
                sprite->data[5] = 80;

            sprite->y2 = 0;
            value = gSineTable[sprite->data[5]];
            sprite->x2 = value >> 3;
            sprite->data[5] = (sprite->data[5] + 2) & 0xFF;
            InitAnimLinearTranslation(sprite);
        }
        break;
    case 1:
        TranslateAnimLinear(sprite);
        value = gSineTable[sprite->data[5]];
        sprite->x2 += value >> 3;
        sprite->y2 += (gSineTable[sprite->data[5] + 0x40] * -3) >> 8;
        if (gMain.inBattle)
        {
            u16 var0 = sprite->data[5] - 0x40;
            if (var0 <= 0x7F)
                sprite->oam.priority = sprite->data[7] >> 8;
            else
                sprite->oam.priority = (sprite->data[7] >> 8) + 1;

            sprite->data[5] = (sprite->data[5] + 4) & 0xFF;
        }
        else
        {
            u16 var0 = sprite->data[5] - 0x40;
            if (var0 <= 0x7F)
                sprite->subpriority = 128;
            else
                sprite->subpriority = 140;

            sprite->data[5] = (sprite->data[5] - 4) & 0xFF;
        }

        if (sprite->data[0] <= 0)
        {
            sprite->data[0] = 0x300;
            sprite->data[1] = sprite->x += sprite->x2;
            sprite->data[3] = sprite->y += sprite->y2;
            sprite->data[4] = sprite->y + 4;
            if (!gMain.inBattle)
                sprite->data[2] = -0x10;
            else if (gBattlerPositions[gBattleAnimTarget] & 1)
                sprite->data[2] = 0x100;
            else
                sprite->data[2] = -0x10;

            sprite->data[7]++;
            sprite->x2 = sprite->y2 = 0;
            sub_8078BD4(sprite);
        }
        break;
    case 2:
        if (TranslateAnimLinear(sprite))
        {
            if (sprite->oam.affineMode & 1)
            {
                FreeOamMatrix(sprite->oam.matrixNum);
                sprite->oam.affineMode = ST_OAM_AFFINE_OFF;
            }

            DestroySprite(sprite);
            gAnimVisualTaskCount--;
        }
        break;
    }
}

// Creates Hail.
void AnimTask_Hail1(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    task->func = AnimTask_Hail2;
}

static void AnimTask_Hail2(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    switch (task->data[0])
    {
    case 0:
        if (++task->data[4] > 2)
        {
            task->data[4] = 0;
            task->data[5] = 0;
            task->data[2] = 0;
            task->data[0]++;
        }
        break;
    case 1:
        if (task->data[5] == 0)
        {
            if (sub_80D8BA8(task->data[3], task->data[2], taskId, 1))
                task->data[1]++;
            
            if (++task->data[2] == 3)
            {
                if (++task->data[3] == 10)
                    task->data[0]++;
                else
                    task->data[0]--;
            }
            else
            {
                task->data[5] = 1;
            }

        }
        else
        {
            task->data[5]--;
        }
        break;
    case 2:
        if (task->data[1] == 0)
            DestroyAnimVisualTask(taskId);
        break;
    }
}

bool8 sub_80D8BA8(u8 hailStructId, u8 affineAnimNum, u8 taskId, u8 c)
{
    u8 id;
    s16 battlerX, battlerY;
    s16 spriteX;
    bool8 possibleBool = FALSE;
    s8 unk = gUnknown_083D9DC4[hailStructId].unk3;

    if (unk != 2)
    {
        id = GetBattlerAtPosition(gUnknown_083D9DC4[hailStructId].bPosition);
        if (IsAnimBankSpriteVisible(id))
        {
            possibleBool = TRUE;
            battlerX = GetBattlerSpriteCoord(id, BATTLER_COORD_X_2);
            battlerY = GetBattlerSpriteCoord(id, BATTLER_COORD_Y_PIC_OFFSET);
            switch (unk)
            {
            case 0:
                battlerX -= GetBattlerSpriteCoordAttr(id, BATTLER_COORD_ATTR_WIDTH) / 6;
                battlerY -= GetBattlerSpriteCoordAttr(id, BATTLER_COORD_ATTR_HEIGHT) / 6;
                break;
            case 1:
                battlerX += GetBattlerSpriteCoordAttr(id, BATTLER_COORD_ATTR_WIDTH) / 6;
                battlerY += GetBattlerSpriteCoordAttr(id, BATTLER_COORD_ATTR_HEIGHT) / 6;
                break;
            }
        }
        else
        {
            battlerX = (gUnknown_083D9DC4[hailStructId].x);
            battlerY = (gUnknown_083D9DC4[hailStructId].y);
        }
    }
    else
    {
        battlerX = (gUnknown_083D9DC4[hailStructId].x);
        battlerY = (gUnknown_083D9DC4[hailStructId].y);
    }
    spriteX = battlerX - ((battlerY + 8) / 2);
    id = CreateSprite(&gHailSpriteTemplate, spriteX, -8, 18);
    if (id == MAX_SPRITES)
    {
        return FALSE;
    }
    else
    {
        StartSpriteAffineAnim(&gSprites[id], affineAnimNum);
        gSprites[id].data[0] = possibleBool;
        gSprites[id].data[3] = battlerX;
        gSprites[id].data[4] = battlerY;
        gSprites[id].data[5] = affineAnimNum;
        gSprites[id].data[6] = taskId;
        gSprites[id].data[7] = c;
        return TRUE;
    }
}

static void AnimHailBegin(struct Sprite *sprite)
{
    u8 spriteId;

    sprite->x += 4;
    sprite->y += 8;

    if (sprite->x < sprite->data[3] && sprite->y < sprite->data[4])
        return;

    if (sprite->data[0] == 1 && sprite->data[5] == 0)
    {
        spriteId = CreateSprite(&gLargeIceEffectParticleSpriteTemplate, 
                                sprite->data[3], sprite->data[4], sprite->subpriority);

        sprite->data[0] = spriteId;
        if (spriteId != 64)
        {
            gSprites[sprite->data[0]].callback = AnimHailContinue;
            gSprites[sprite->data[0]].data[6] = sprite->data[6];
            gSprites[sprite->data[0]].data[7] = sprite->data[7];
        }

        FreeOamMatrix(sprite->oam.matrixNum);
        DestroySprite(sprite);
    }
    else
    {
        gTasks[sprite->data[6]].data[sprite->data[7]]--;
        FreeOamMatrix(sprite->oam.matrixNum);
        DestroySprite(sprite);
    }
}

static void AnimHailContinue(struct Sprite *sprite)
{
    if (++sprite->data[0] == 20)
    {
        gTasks[sprite->data[6]].data[sprite->data[7]]--;
        FreeOamMatrix(sprite->oam.matrixNum);
        DestroySprite(sprite);
    }
}

// Initializes the animation for Ice Ball.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: target x offset
// arg 3: target y offset
// arg 4: duration
// arg 5: arc height (negative)
static void InitIceBallAnim(struct Sprite *sprite)
{
    u8 animNum = gAnimDisableStructPtr->rolloutTimer2 - gAnimDisableStructPtr->rolloutTimer1 - 1;

    if (animNum > 4)
        animNum = 4;

    StartSpriteAffineAnim(sprite, animNum);
    InitAnimSpritePos(sprite, 1);

    sprite->data[0] = gBattleAnimArgs[4];

    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];

    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, 2) + gBattleAnimArgs[2];
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, 3) + gBattleAnimArgs[3];
    sprite->data[5] = gBattleAnimArgs[5];

    InitAnimArcTranslation(sprite);

    sprite->callback = AnimThrowIceBall;
}

// Throws the ball of ice in Ice Ball.
static void AnimThrowIceBall(struct Sprite *sprite)
{
    if (!TranslateAnimArc(sprite))
        return;

    StartSpriteAnim(sprite, 1);
    sprite->callback = sub_8078600;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

// Initializes the particles that scatter at the end of the Ice Ball animation.
static void InitIceBallParticle(struct Sprite *sprite)
{
    s16 randA, randB;

    sprite->oam.tileNum += 8;
    InitSpritePosToAnimTarget(sprite, TRUE);

    randA = (Random() & 0xFF) + 256;
    randB = Random() & 0x1FF;

    if (randB > 0xFF)
        randB = 256 - randB;

    sprite->data[1] = randA;
    sprite->data[2] = randB;
    sprite->callback = AnimIceBallParticle;
}

// Animates the particles created by InitIceBallParticle.
static void AnimIceBallParticle(struct Sprite *sprite)
{
    sprite->data[3] += sprite->data[1];
    sprite->data[4] += sprite->data[2];

    if (sprite->data[1] & 1)
        sprite->x2 = -(sprite->data[3] >> 8);
    else
        sprite->x2 = sprite->data[3] >> 8;

    sprite->y2 = sprite->data[4] >> 8;

    if (++sprite->data[0] == 21)
        DestroyAnimSprite(sprite);
}

// Counter for Ice Ball.
void AnimTask_CountIceBallThrows(u8 taskId)
{
    u8 arg = gBattleAnimArgs[0];

    gBattleAnimArgs[arg] = gAnimDisableStructPtr->rolloutTimer2 - gAnimDisableStructPtr->rolloutTimer1 - 1;    
    DestroyAnimVisualTask(taskId);
}
