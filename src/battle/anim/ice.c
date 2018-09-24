#include "global.h"
#include "main.h"
#include "trig.h"
#include "rom_8077ABC.h"
#include "battle.h"
#include "battle_anim.h"
#include "constants/battle_constants.h"
#include "task.h"
#include "decompress.h"
#include "palette.h"
#include "random.h"

extern s16 gBattleAnimArgs[];
extern u8  gAnimBankAttacker;
extern u8  gAnimBankTarget;
extern u8  gAnimVisualTaskCount;
extern u8  gBanksBySide[];
extern u8  gBankSpriteIds[];

extern u16 gBattle_BG1_X;
extern u16 gBattle_BG1_Y;

extern const u8 gUnknown_083970E8[];

extern struct INCBIN_U8 gBattleAnimFogTilemap;
extern struct INCBIN_U8 gWeatherFog1Tiles;

static void sub_80D7704(struct Sprite *sprite);
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
bool8 sub_80D8BA8(u8 a1, u8 a2, u8 a3, u8 a4);

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
    .tileTag = 10141,
    .paletteTag = 10141,
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
    .tileTag = 10141,
    .paletteTag = 10141,
    .oam = &gOamData_837E144,
    .anims = gSpriteAnimTable_83D9BB8,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9BDC,
    .callback = AnimIcePunchSwirlingParticle,
};

const struct SpriteTemplate gSmallIcePunchCrystalSpriteTemplate =
{
    .tileTag = 10141,
    .paletteTag = 10141,
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
    .tileTag = 10141,
    .paletteTag = 10141,
    .oam = &gOamData_837E0E4,
    .anims = gSpriteAnimTable_83D9BB8,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9C20,
    .callback = AnimIceBeamParticle,
};

const struct SpriteTemplate gIceBeamOuterParticleSpriteTemplate =
{
    .tileTag = 10141,
    .paletteTag = 10141,
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
    .tileTag = 10141,
    .paletteTag = 10141,
    .oam = &gOamData_837E0E4,
    .anims = gSpriteAnimTable_83D9BB8,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9C74,
    .callback = AnimIceEffectParticle,
};

const struct SpriteTemplate gSmallIceEffectParticleSpriteTemplate =
{
    .tileTag = 10141,
    .paletteTag = 10141,
    .oam = &gOamData_837E0A4,
    .anims = gSpriteAnimTable_83D9BBC,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9C74,
    .callback = AnimIceEffectParticle,
};

const struct SpriteTemplate gSmallSnowballSpriteTemplate1 =
{
    .tileTag = 10141,
    .paletteTag = 10141,
    .oam = &gOamData_837DF24,
    .anims = gSpriteAnimTable_83D9BC0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSwirlingSnowball_Step1,
};

const struct SpriteTemplate gLargeSnowballSpriteTemplate =
{
    .tileTag = 10141,
    .paletteTag = 10141,
    .oam = &gOamData_837DF2C,
    .anims = gSpriteAnimTable_83D9BC4,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimMoveParticleBeyondTarget,
};

const struct SpriteTemplate gSmallSnowballSpriteTemplate2 =
{
    .tileTag = 10141,
    .paletteTag = 10141,
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
    .tileTag = 10142,
    .paletteTag = 10142,
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
    .tileTag = 10144,
    .paletteTag = 10144,
    .oam = &gOamData_837E074,
    .anims = gSpriteAnimTable_83D9D38,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = InitSwirlingFogAnim,
};

const struct SpriteTemplate gSmogCloudSpriteTemplate =
{
    .tileTag = 10172,
    .paletteTag = 10172,
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
    .tileTag = 10155,
    .paletteTag = 10155,
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
    .tileTag = 10172,
    .paletteTag = 10172,
    .oam = &gOamData_837E074,
    .anims = gSpriteAnimTable_83D9D38,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = InitPoisonGasCloudAnim,
};

const u8 gUnknown_083D9DC4[][4] =
{
    {0x64, 0xE0, 0x01, 0x20},
    {0x55, 0xE0, 0x01, 0x00},
    {0xF2, 0xE0, 0x11, 0x10},
    {0x42, 0xE0, 0x21, 0x10},
    {0xB6, 0xE0, 0x31, 0x00},
    {0x3C, 0xE0, 0x01, 0x20},
    {0xD6, 0xE0, 0x11, 0x00},
    {0x71, 0xE0, 0x01, 0x10},
    {0xD2, 0xE0, 0x31, 0x10},
    {0x26, 0xE0, 0x21, 0x00},
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
    .tileTag = 10263,
    .paletteTag = 10263,
    .oam = &gOamData_837DF8C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9E2C,
    .callback = AnimHailBegin,
};

const struct SpriteTemplate gWeatherBallHailSpriteTemplate =
{
    .tileTag = 10263,
    .paletteTag = 10263,
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
    .tileTag = 10043,
    .paletteTag = 10043,
    .oam = &gOamData_837DFF4,
    .anims = gSpriteAnimTable_83D9E88,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9EE0,
    .callback = InitIceBallAnim,
};

const struct SpriteTemplate gIceBallParticleSpriteTemplate =
{
    .tileTag = 10141,
    .paletteTag = 10141,
    .oam = &gOamData_837DF24,
    .anims = gSpriteAnimTable_83D9BBC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = InitIceBallParticle,
};

// unknown - potentially used in weather ball
// TODO: decompile function and name it
/*
// NOT EQUIVALENT
static void sub_80D7704(struct Sprite *sprite)
{
    //
    //u16 battler1, battler2, battler3, battler4; //
    u16 r9, r8, r3, r6;
    //s16 r4, r10;

    sprite->oam.tileNum += 7;

    //u8 battler1, battler2, battler3, battler4;

    //battler1 = GetBattlerSpriteCoord(gAnimBankTarget, 2);
    //battler2 = GetBattlerSpriteCoord(gAnimBankTarget, 3);
    //battler3 = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    //battler4 = GetBattlerSpriteCoord(gAnimBankAttacker, 3);

    //sprite->oam.tileNum += 7;

    //sprite->data[0] = gBattleAnimArgs[4];

    //sprite->data[1] = battler3 + gBattleAnimArgs[0]; //???
    //sprite->data[2] = battler1 + gBattleAnimArgs[2];
    //sprite->data[3] = battler4 + gBattleAnimArgs[1];
    //sprite->data[4] = battler2 + gBattleAnimArgs[3];

    r9 = GetBattlerSpriteCoord(gAnimBankTarget, 2);
    r8 = GetBattlerSpriteCoord(gAnimBankTarget, 3);
    r3 = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    r6 = GetBattlerSpriteCoord(gAnimBankAttacker, 3);

    sprite->data[0] = gBattleAnimArgs[4];

    sprite->data[1] = r3 + gBattleAnimArgs[0]; //???
    sprite->data[2] = r9 + gBattleAnimArgs[2];
    sprite->data[3] = r6 + gBattleAnimArgs[1];
    sprite->data[4] = r8 + gBattleAnimArgs[3];

    //sprite->data[0] = gBattleAnimArgs;


    sub_8078314(sprite);

    if ((u32)(r9 + 32) <= 304 || (u32)(r8 + 32) <= 224) // cmp 1
    {
        r4 = sprite->data[1]; 
        r10 = 304;

        // _080D77AA
        for (int i = 0; i < 3; i++)
        {
            //
            if (((u32)((s16)r9 + r4) + (0x80 << 14)) >> 16 > 304
                || ((u32)((s16)r8 + r4) + (0x80 << 14)) >> 16 > 0xE0)
            {
                break;
            }
        }
    }
    // _080D77DE
}
*/

NAKED static void sub_80D7704(struct Sprite *sprite)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r10\n"
                "\tmov r6, r9\n"
                "\tmov r5, r8\n"
                "\tpush {r5-r7}\n"
                "\tsub sp, 0x4\n"
                "\tadds r5, r0, 0\n"
                "\tldrh r2, [r5, 0x4]\n"
                "\tlsls r1, r2, 22\n"
                "\tlsrs r1, 22\n"
                "\tadds r1, 0x7\n"
                "\tldr r3, _080D780C @ =0x000003ff\n"
                "\tadds r0, r3, 0\n"
                "\tands r1, r0\n"
                "\tldr r0, _080D7810 @ =0xfffffc00\n"
                "\tands r0, r2\n"
                "\torrs r0, r1\n"
                "\tstrh r0, [r5, 0x4]\n"
                "\tldr r4, _080D7814 @ =gAnimBankTarget\n"
                "\tldrb r0, [r4]\n"
                "\tmovs r1, 0x2\n"
                "\tbl GetBattlerSpriteCoord\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tmov r9, r0\n"
                "\tldrb r0, [r4]\n"
                "\tmovs r1, 0x3\n"
                "\tbl GetBattlerSpriteCoord\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tmov r8, r0\n"
                "\tldr r4, _080D7818 @ =gAnimBankAttacker\n"
                "\tldrb r0, [r4]\n"
                "\tmovs r1, 0x2\n"
                "\tbl GetBattlerSpriteCoord\n"
                "\tlsls r0, 24\n"
                "\tlsrs r3, r0, 24\n"
                "\tldrb r0, [r4]\n"
                "\tmovs r1, 0x3\n"
                "\tstr r3, [sp]\n"
                "\tbl GetBattlerSpriteCoord\n"
                "\tlsls r0, 24\n"
                "\tlsrs r6, r0, 24\n"
                "\tldr r1, _080D781C @ =gBattleAnimArgs\n"
                "\tldrh r0, [r1, 0x8]\n"
                "\tstrh r0, [r5, 0x2E]\n"
                "\tldrh r0, [r1]\n"
                "\tldr r3, [sp]\n"
                "\tadds r0, r3\n"
                "\tstrh r0, [r5, 0x30]\n"
                "\t ldrh r0, [r1, 0x4]\n"
                "\t mov r4, r9\n"
                "\t adds r0, r4, r0\n"
                "\tstrh r0, [r5, 0x32]\n"
                "\tldrh r0, [r1, 0x2]\n"
                "\tadds r0, r6\n"
                "\tstrh r0, [r5, 0x34]\n"
                "\tldrh r0, [r1, 0x6]\n"
                "\tmov r7, r8\n"
                "\tadds r0, r7, r0\n"
                "\tstrh r0, [r5, 0x36]\n"
                "\tadds r0, r5, 0\n"
                "\tbl sub_8078314\n"
                "\tadds r4, 0x20\n"
                "\tmovs r0, 0x98\n"
                "\tlsls r0, 1\n"
                "\tmov r12, r0\n"
                "\tldr r3, [sp]\n"
                "\tcmp r4, r12\n"
                "\tbhi _080D77DE\n"
                "\tadds r0, r7, 0\n"
                "\tadds r0, 0x20\n"
                "\tldrh r1, [r5, 0x30]\n"
                "\tldrh r2, [r5, 0x32]\n"
                "\tcmp r0, 0xE0\n"
                "\tbhi _080D77DE\n"
                "\tadds r4, r1, 0\n"
                "\tmov r10, r12\n"
                "_080D77AA:\n"
                "\tmov r7, r9\n"
                "\tlsls r1, r7, 16\n"
                "\tasrs r1, 16\n"
                "\tadds r1, r4\n"
                "\tlsls r1, 16\n"
                "\tmov r7, r8\n"
                "\tlsls r0, r7, 16\n"
                "\tasrs r0, 16\n"
                "\tadds r0, r2\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tmov r8, r0\n"
                "\tlsrs r0, r1, 16\n"
                "\tmov r9, r0\n"
                "\tmovs r7, 0x80\n"
                "\tlsls r7, 14\n"
                "\tadds r1, r7\n"
                "\tlsrs r1, 16\n"
                "\tcmp r1, r10\n"
                "\tbhi _080D77DE\n"
                "\tmov r1, r8\n"
                "\tlsls r0, r1, 16\n"
                "\tadds r0, r7\n"
                "\tlsrs r0, 16\n"
                "\tcmp r0, 0xE0\n"
                "\tbls _080D77AA\n"
                "_080D77DE:\n"
                "\tldrh r0, [r5, 0x30]\n"
                "\tnegs r7, r0\n"
                "\tstrh r7, [r5, 0x30]\n"
                "\tldrh r0, [r5, 0x32]\n"
                "\tnegs r4, r0\n"
                "\tstrh r4, [r5, 0x32]\n"
                "\tlsls r0, r3, 16\n"
                "\tmovs r1, 0x80\n"
                "\tlsls r1, 14\n"
                "\tadds r0, r1\n"
                "\tlsrs r0, 16\n"
                "\tmovs r2, 0x98\n"
                "\tlsls r2, 1\n"
                "\tmov r12, r2\n"
                "\tldr r1, _080D781C @ =gBattleAnimArgs\n"
                "\tmov r10, r1\n"
                "\tcmp r0, r12\n"
                "\tbhi _080D784A\n"
                "\tlsls r1, r6, 16\n"
                "\tmovs r2, 0x80\n"
                "\tlsls r2, 14\n"
                "\tadds r0, r1, r2\n"
                "\tb _080D7842\n"
                "\t.align 2, 0\n"
                "_080D780C: .4byte 0x000003ff\n"
                "_080D7810: .4byte 0xfffffc00\n"
                "_080D7814: .4byte gAnimBankTarget\n"
                "_080D7818: .4byte gAnimBankAttacker\n"
                "_080D781C: .4byte gBattleAnimArgs\n"
                "_080D7820:\n"
                "\tlsls r1, r3, 16\n"
                "\tasrs r1, 16\n"
                "\tadds r1, r7\n"
                "\tlsls r1, 16\n"
                "\tasrs r0, r2, 16\n"
                "\tadds r0, r4\n"
                "\tlsls r0, 16\n"
                "\tlsrs r6, r0, 16\n"
                "\tlsrs r3, r1, 16\n"
                "\tmovs r0, 0x80\n"
                "\tlsls r0, 14\n"
                "\tadds r1, r0\n"
                "\tlsrs r1, 16\n"
                "\tcmp r1, r12\n"
                "\tbhi _080D784A\n"
                "\tlsls r1, r6, 16\n"
                "\tadds r0, r1, r0\n"
                "_080D7842:\n"
                "\tlsrs r0, 16\n"
                "\tadds r2, r1, 0\n"
                "\tcmp r0, 0xE0\n"
                "\tbls _080D7820\n"
                "_080D784A:\n"
                "\tstrh r3, [r5, 0x20]\n"
                "\tstrh r6, [r5, 0x22]\n"
                "\tmov r1, r10\n"
                "\tldrh r0, [r1, 0x8]\n"
                "\tstrh r0, [r5, 0x2E]\n"
                "\tstrh r3, [r5, 0x30]\n"
                "\tmov r2, r9\n"
                "\tstrh r2, [r5, 0x32]\n"
                "\tstrh r6, [r5, 0x34]\n"
                "\tmov r3, r8\n"
                "\tstrh r3, [r5, 0x36]\n"
                "\tadds r0, r5, 0\n"
                "\tbl sub_8078314\n"
                "\tmov r7, r10\n"
                "\tldrh r0, [r7, 0xA]\n"
                "\tstrh r0, [r5, 0x34]\n"
                "\tldrh r0, [r7, 0xC]\n"
                "\tstrh r0, [r5, 0x36]\n"
                "\tldr r0, _080D7884 @ =sub_80D7888\n"
                "\tstr r0, [r5, 0x1C]\n"
                "\tadd sp, 0x4\n"
                "\tpop {r3-r5}\n"
                "\tmov r8, r3\n"
                "\tmov r9, r4\n"
                "\tmov r10, r5\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_080D7884: .4byte sub_80D7888");
}

void sub_80D7888(struct Sprite *sprite)
{
    if (sprite->data[0] != 0)
    {
        sprite->data[5] += sprite->data[1];
        sprite->data[6] += sprite->data[2];
        sprite->pos2.x = sprite->data[5];
        sprite->pos2.y = sprite->data[6];
        sprite->pos2.x += Sin(sprite->data[7], sprite->data[3]); 
        sprite->pos2.y += Sin(sprite->data[7], sprite->data[3]);
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
    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2);

    if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
        sprite->data[2] -= gBattleAnimArgs[2];
    else
        sprite->data[2] += gBattleAnimArgs[2];

    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3) + gBattleAnimArgs[3];
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
        sub_8078764(sprite, 1);
    }
    else
    {
        SetAverageBattlerPositions(gAnimBankTarget, 1, &sprite->pos1.x, &sprite->pos1.y);
        if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
            gBattleAnimArgs[0] = -gBattleAnimArgs[0];

        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
    }

    StoreSpriteCallbackInData(sprite, AnimFlickerIceEffectParticle);
    sprite->callback = sub_80785E4;
}

static void AnimFlickerIceEffectParticle(struct Sprite *sprite)
{
    sprite->invisible ^= 1;
    sprite->data[0] += 1;
    if (sprite->data[0] == 20)
        move_anim_8074EE0(sprite);
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
    sprite->data[1] = sprite->pos1.x;
    sprite->data[3] = sprite->pos1.y;

    if (!gBattleAnimArgs[5])
    {
        sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
        sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3) + gBattleAnimArgs[3];
    }
    else
    {
        SetAverageBattlerPositions(gAnimBankTarget, 1, &sprite->data[2], &sprite->data[4]);
    }

    if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
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

        if ((u32)(sprite->pos1.x + sprite->pos2.x + 16) > 272
         || sprite->pos1.y + sprite->pos2.y > 160
         || sprite->pos1.y + sprite->pos2.y < -16)
            break;
    }

    sprite->pos1.x += sprite->pos2.x;
    sprite->pos1.y += sprite->pos2.y;
    sprite->pos2.y = 0;
    sprite->pos2.x = 0;

    for (i = 0; i < 8; i++)
        sprite->data[i] = tempDataHolder[i];

    sprite->callback = sub_8078D8C;
    StoreSpriteCallbackInData(sprite, AnimSwirlingSnowball_Step2);
}

static void AnimSwirlingSnowball_Step2(struct Sprite *sprite)
{
    s16 tempVar;

    sprite->pos1.x += sprite->pos2.x;
    sprite->pos1.y += sprite->pos2.y;
    sprite->pos2.y = 0;
    sprite->pos2.x = 0;
    sprite->data[0] = 128;

    tempVar = GetBattlerSide(gAnimBankAttacker) != 0 ? 20 : 65516;

    sprite->data[3] = Sin(sprite->data[0], tempVar);
    sprite->data[4] = Cos(sprite->data[0], 0xF);
    sprite->data[5] = 0;
    sprite->callback = AnimSwirlingSnowball_Step3;
    AnimSwirlingSnowball_Step3(sprite);
}

static void AnimSwirlingSnowball_Step3(struct Sprite *sprite)
{
    s16 tempVar;
    tempVar = GetBattlerSide(gAnimBankAttacker) != 0 ? 20 : 65516;

    if (sprite->data[5] <= 31)
    {
        sprite->pos2.x = Sin(sprite->data[0], tempVar) - sprite->data[3];
        sprite->pos2.y = Cos(sprite->data[0], 15)      - sprite->data[4];
        sprite->data[0] = (sprite->data[0] + 16) & 0xFF;
        sprite->data[5] += 1;
    }
    else
    {
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.y = 0;
        sprite->pos2.x = 0;
        sprite->data[4] = 0;
        sprite->data[3] = 0;
        sprite->callback = AnimSwirlingSnowball_End;
    }
}

static void AnimSwirlingSnowball_End(struct Sprite *sprite)
{
    sprite->data[0] = 1;
    sub_8078CE8(sprite);

    if ((u32)(sprite->pos1.x + sprite->pos2.x + 16) > 272
     || sprite->pos1.y + sprite->pos2.y > 256
     || sprite->pos1.y + sprite->pos2.y < -16)
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
    sprite->data[1] = sprite->pos1.x;
    sprite->data[3] = sprite->pos1.y;

    if (!gBattleAnimArgs[7])
    {
        sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
        sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3);
    }
    else
    {
        SetAverageBattlerPositions(gAnimBankTarget, 1, &sprite->data[2], &sprite->data[4]);
    }

    if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
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
        if ((u32)(sprite->pos1.x + sprite->pos2.x + 16) > 272
         || sprite->pos1.y + sprite->pos2.y > 160
         || sprite->pos1.y + sprite->pos2.y < -16)
            break;
    }

    sprite->pos1.x += sprite->pos2.x;
    sprite->pos1.y += sprite->pos2.y;
    sprite->pos2.y = 0;
    sprite->pos2.x = 0;

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

    sprite->pos2.y += Sin(sprite->data[7], sprite->data[5]);
    sprite->data[7] = (sprite->data[7] + sprite->data[6]) & 0xFF;
    if (sprite->data[0] == 1)
    {
        if ((u32)(sprite->pos1.x + sprite->pos2.x + 16) > 272
         || sprite->pos1.y + sprite->pos2.y > 160
         || sprite->pos1.y + sprite->pos2.y < -16)
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
            sub_8078764(sprite, 0);
        }
        else
        {
            SetAverageBattlerPositions(gAnimBankTarget, 0, &sprite->pos1.x, &sprite->pos1.y);

            if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
                gBattleAnimArgs[0] = -gBattleAnimArgs[0];

            sprite->pos1.x += gBattleAnimArgs[0];
            sprite->pos1.y += gBattleAnimArgs[1];
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
            SetAverageBattlerPositions(gAnimBankAttacker, 0, &sprite->pos1.x, &sprite->pos1.y);
            if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER) 
                sprite->pos1.x -= gBattleAnimArgs[0];
            else 
                sprite->pos1.x += gBattleAnimArgs[0];

            sprite->pos1.y += gBattleAnimArgs[1];
        }

        battler = gAnimBankAttacker;
    }
    else 
    {
        if (gBattleAnimArgs[5] == 0)
        {
            sub_8078764(sprite, 0);
        }
        else 
        {
            SetAverageBattlerPositions(gAnimBankTarget, 0, &sprite->pos1.x, &sprite->pos1.y);
            if (GetBattlerSide(gAnimBankTarget) != B_SIDE_PLAYER)
                sprite->pos1.x -= gBattleAnimArgs[0];
            else 
                sprite->pos1.x += gBattleAnimArgs[0];

            sprite->pos1.y += gBattleAnimArgs[1];
        }

        battler = gAnimBankTarget;
    }

    sprite->data[7] = battler;
    if (gBattleAnimArgs[5] == 0 || !IsDoubleBattle()) 
        tempVar = 0x20;
    else
        tempVar = 0x40;

    sprite->data[6] = tempVar;
    if (GetBattlerSide(gAnimBankTarget) == B_SIDE_PLAYER)
        sprite->pos1.y += 8;

    sprite->data[0] = gBattleAnimArgs[3];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = sprite->pos1.x;
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = sprite->pos1.y + gBattleAnimArgs[2];

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
        sprite->pos2.x += Sin(sprite->data[5], sprite->data[6]);
        sprite->pos2.y += Cos(sprite->data[5], -6);

        if ((u16)(sprite->data[5] - 64) <= 0x7F)
            sprite->oam.priority = sub_8079ED4(sprite->data[7]); 
        else
            sprite->oam.priority = sub_8079ED4(sprite->data[7]) + 1;

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
    sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
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

    if (GetBattlerSpriteCoord(gAnimBankAttacker, 2) < GetBattlerSpriteCoord(gAnimBankTarget, 2))
        sprite->data[7] = 0x8000;

    if (!(gBanksBySide[gAnimBankTarget] & 1))
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];

        if ((sprite->data[7] & 0x8000) && !(gBanksBySide[gAnimBankAttacker] & 1))
            sprite->subpriority = gSprites[GetAnimBattlerSpriteId(1)].subpriority + 1;

        sprite->data[6] = 1; 
    }

    sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
    if (gBattleAnimArgs[7])
    {
        sprite->data[1] = sprite->pos1.x + gBattleAnimArgs[1];
        sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2) + gBattleAnimArgs[3];
        sprite->data[3] = sprite->pos1.y + gBattleAnimArgs[2];
        sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3) + gBattleAnimArgs[4];
        sprite->data[7] |= sub_8079ED4(gAnimBankTarget) << 8;
    }
    else
    {
        sprite->data[1] = sprite->pos1.x + gBattleAnimArgs[1];
        sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 0) + gBattleAnimArgs[3];
        sprite->data[3] = sprite->pos1.y + gBattleAnimArgs[2];
        sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 1) + gBattleAnimArgs[4];
        sprite->data[7] |= sub_8079ED4(gAnimBankTarget) << 8;
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
// functionally correct, but there appears to be an unused local variable causing
// switch case 1 to not match
#ifdef NONMATCHING
static void sub_80D8874(struct Sprite *sprite)
{
    int value;
    register s16 value2 asm("r5");

    switch (sprite->data[7] & 0xFF)
    {
    case 0:
        TranslateAnimLinear(sprite);
        value = gSineTable[sprite->data[5]];
        sprite->pos2.x += value >> 4;
        if (sprite->data[6])
            sprite->data[5] = (sprite->data[5] - 8) & 0xFF;
        else
            sprite->data[5] = (sprite->data[5] + 8) & 0xFF;

        if (sprite->data[0] <= 0)
        {
            value2 = 80;
            sprite->data[0] = value2;
            sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankTarget, 0);
            sprite->data[1] = sprite->pos1.x;
            sprite->data[2] = sprite->pos1.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->data[3] = sprite->pos1.y;
            sprite->data[4] = sprite->pos1.y + 29;
            sprite->data[7]++;
            if (gMain.inBattle && gBanksBySide[gAnimBankTarget] & 1)
                sprite->data[5] = 204;
            else
                sprite->data[5] = value2;

            sprite->pos2.y = 0;
            value = gSineTable[sprite->data[5]];
            sprite->pos2.x = value >> 3;
            sprite->data[5] = (sprite->data[5] + 2) & 0xFF;
            InitAnimLinearTranslation(sprite);
        }
        break;
    case 1:
        TranslateAnimLinear(sprite);
        value = gSineTable[sprite->data[5]];
        sprite->pos2.x += value >> 3;
        sprite->pos2.y += (gSineTable[sprite->data[5] + 0x40] * -3) >> 8;
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
            asm("mov r2, #0"); // unused local variable?
            sprite->data[0] = 0x300;
            sprite->data[1] = sprite->pos1.x += sprite->pos2.x;
            sprite->data[3] = sprite->pos1.y += sprite->pos2.y;
            sprite->data[4] = sprite->pos1.y + 4;
            if (gMain.inBattle && gBanksBySide[gAnimBankTarget] & 1)
                sprite->data[2] = 0x100;
            else
                sprite->data[2] = -0x10;

            sprite->data[7]++;
            sprite->pos2.x = sprite->pos2.y = 0;
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
#else
NAKED static void sub_80D8874(struct Sprite *sprite)
{
    asm_unified("\tpush {r4-r6,lr}\n"
                "\tadds r4, r0, 0\n"
                "\tldrh r0, [r4, 0x3C]\n"
                "\tmovs r5, 0xFF\n"
                "\tmovs r1, 0xFF\n"
                "\tands r1, r0\n"
                "\tcmp r1, 0x1\n"
                "\tbeq _080D8968\n"
                "\tcmp r1, 0x1\n"
                "\tbgt _080D888E\n"
                "\tcmp r1, 0\n"
                "\tbeq _080D8896\n"
                "\tb _080D8AD0\n"
                "_080D888E:\n"
                "\tcmp r1, 0x2\n"
                "\tbne _080D8894\n"
                "\tb _080D8A94\n"
                "_080D8894:\n"
                "\tb _080D8AD0\n"
                "_080D8896:\n"
                "\tadds r0, r4, 0\n"
                "\tbl TranslateAnimLinear\n"
                "\tldr r1, _080D88C0 @ =gSineTable\n"
                "\tmovs r2, 0x38\n"
                "\tldrsh r0, [r4, r2]\n"
                "\tlsls r0, 1\n"
                "\tadds r0, r1\n"
                "\tmovs r1, 0\n"
                "\tldrsh r0, [r0, r1]\n"
                "\tasrs r0, 4\n"
                "\tldrh r2, [r4, 0x24]\n"
                "\tadds r0, r2\n"
                "\tstrh r0, [r4, 0x24]\n"
                "\tmovs r1, 0x3A\n"
                "\tldrsh r0, [r4, r1]\n"
                "\tcmp r0, 0\n"
                "\tbeq _080D88C4\n"
                "\tldrh r0, [r4, 0x38]\n"
                "\tsubs r0, 0x8\n"
                "\tb _080D88C8\n"
                "\t.align 2, 0\n"
                "_080D88C0: .4byte gSineTable\n"
                "_080D88C4:\n"
                "\tldrh r0, [r4, 0x38]\n"
                "\tadds r0, 0x8\n"
                "_080D88C8:\n"
                "\tands r0, r5\n"
                "\tstrh r0, [r4, 0x38]\n"
                "\tmovs r2, 0x2E\n"
                "\tldrsh r0, [r4, r2]\n"
                "\tcmp r0, 0\n"
                "\tble _080D88D6\n"
                "\tb _080D8AD0\n"
                "_080D88D6:\n"
                "\tmovs r5, 0x50\n"
                "\tstrh r5, [r4, 0x2E]\n"
                "\tldr r6, _080D8928 @ =gAnimBankTarget\n"
                "\tldrb r0, [r6]\n"
                "\tmovs r1, 0\n"
                "\tbl GetBattlerSpriteCoord\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tstrh r0, [r4, 0x20]\n"
                "\tstrh r0, [r4, 0x30]\n"
                "\tstrh r0, [r4, 0x32]\n"
                "\tldrh r0, [r4, 0x26]\n"
                "\tldrh r1, [r4, 0x22]\n"
                "\tadds r0, r1\n"
                "\tstrh r0, [r4, 0x22]\n"
                "\tstrh r0, [r4, 0x34]\n"
                "\tadds r0, 0x1D\n"
                "\tstrh r0, [r4, 0x36]\n"
                "\tldrh r0, [r4, 0x3C]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r4, 0x3C]\n"
                "\tldr r0, _080D892C @ =gMain\n"
                "\tldr r2, _080D8930 @ =0x0000043d\n"
                "\tadds r0, r2\n"
                "\tldrb r1, [r0]\n"
                "\tmovs r0, 0x2\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbeq _080D8938\n"
                "\tldr r1, _080D8934 @ =gBanksBySide\n"
                "\tldrb r0, [r6]\n"
                "\tadds r0, r1\n"
                "\tldrb r1, [r0]\n"
                "\tmovs r0, 0x1\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbeq _080D8938\n"
                "\tmovs r0, 0xCC\n"
                "\tstrh r0, [r4, 0x38]\n"
                "\tb _080D893A\n"
                "\t.align 2, 0\n"
                "_080D8928: .4byte gAnimBankTarget\n"
                "_080D892C: .4byte gMain\n"
                "_080D8930: .4byte 0x0000043d\n"
                "_080D8934: .4byte gBanksBySide\n"
                "_080D8938:\n"
                "\tstrh r5, [r4, 0x38]\n"
                "_080D893A:\n"
                "\tmovs r0, 0\n"
                "\tstrh r0, [r4, 0x26]\n"
                "\tldr r1, _080D8964 @ =gSineTable\n"
                "\tmovs r2, 0x38\n"
                "\tldrsh r0, [r4, r2]\n"
                "\tlsls r0, 1\n"
                "\tadds r0, r1\n"
                "\tmovs r1, 0\n"
                "\tldrsh r0, [r0, r1]\n"
                "\tasrs r0, 3\n"
                "\tstrh r0, [r4, 0x24]\n"
                "\tldrh r0, [r4, 0x38]\n"
                "\tadds r0, 0x2\n"
                "\tmovs r1, 0xFF\n"
                "\tands r0, r1\n"
                "\tstrh r0, [r4, 0x38]\n"
                "\tadds r0, r4, 0\n"
                "\tbl InitAnimLinearTranslation\n"
                "\tb _080D8AD0\n"
                "\t.align 2, 0\n"
                "_080D8964: .4byte gSineTable\n"
                "_080D8968:\n"
                "\tadds r0, r4, 0\n"
                "\tbl TranslateAnimLinear\n"
                "\tldr r1, _080D89C8 @ =gSineTable\n"
                "\tmovs r2, 0x38\n"
                "\tldrsh r0, [r4, r2]\n"
                "\tlsls r0, 1\n"
                "\tadds r0, r1\n"
                "\tmovs r2, 0\n"
                "\tldrsh r0, [r0, r2]\n"
                "\tasrs r0, 3\n"
                "\tldrh r2, [r4, 0x24]\n"
                "\tadds r0, r2\n"
                "\tstrh r0, [r4, 0x24]\n"
                "\tmovs r2, 0x38\n"
                "\tldrsh r0, [r4, r2]\n"
                "\tadds r0, 0x40\n"
                "\tlsls r0, 1\n"
                "\tadds r0, r1\n"
                "\tmovs r2, 0\n"
                "\tldrsh r1, [r0, r2]\n"
                "\tlsls r0, r1, 1\n"
                "\tadds r0, r1\n"
                "\tnegs r0, r0\n"
                "\tasrs r0, 8\n"
                "\tldrh r1, [r4, 0x26]\n"
                "\tadds r0, r1\n"
                "\tstrh r0, [r4, 0x26]\n"
                "\tldr r0, _080D89CC @ =gMain\n"
                "\tldr r2, _080D89D0 @ =0x0000043d\n"
                "\tadds r0, r2\n"
                "\tldrb r1, [r0]\n"
                "\tmovs r0, 0x2\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbeq _080D89F2\n"
                "\tldrh r1, [r4, 0x38]\n"
                "\tadds r0, r1, 0\n"
                "\tsubs r0, 0x40\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tadds r3, r1, 0\n"
                "\tcmp r0, 0x7F\n"
                "\tbhi _080D89D4\n"
                "\tldrh r1, [r4, 0x3C]\n"
                "\tlsls r1, 16\n"
                "\tasrs r1, 24\n"
                "\tb _080D89DC\n"
                "\t.align 2, 0\n"
                "_080D89C8: .4byte gSineTable\n"
                "_080D89CC: .4byte gMain\n"
                "_080D89D0: .4byte 0x0000043d\n"
                "_080D89D4:\n"
                "\tldrh r1, [r4, 0x3C]\n"
                "\tlsls r1, 16\n"
                "\tasrs r1, 24\n"
                "\tadds r1, 0x1\n"
                "_080D89DC:\n"
                "\tmovs r0, 0x3\n"
                "\tands r1, r0\n"
                "\tlsls r1, 2\n"
                "\tldrb r2, [r4, 0x5]\n"
                "\tmovs r0, 0xD\n"
                "\tnegs r0, r0\n"
                "\tands r0, r2\n"
                "\torrs r0, r1\n"
                "\tstrb r0, [r4, 0x5]\n"
                "\tadds r0, r3, 0x4\n"
                "\tb _080D8A12\n"
                "_080D89F2:\n"
                "\tldrh r0, [r4, 0x38]\n"
                "\tsubs r0, 0x40\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tcmp r0, 0x7F\n"
                "\tbhi _080D8A06\n"
                "\tadds r1, r4, 0\n"
                "\tadds r1, 0x43\n"
                "\tmovs r0, 0x80\n"
                "\tb _080D8A0C\n"
                "_080D8A06:\n"
                "\tadds r1, r4, 0\n"
                "\tadds r1, 0x43\n"
                "\tmovs r0, 0x8C\n"
                "_080D8A0C:\n"
                "\tstrb r0, [r1]\n"
                "\tldrh r0, [r4, 0x38]\n"
                "\tsubs r0, 0x4\n"
                "_080D8A12:\n"
                "\tmovs r1, 0xFF\n"
                "\tands r0, r1\n"
                "\tstrh r0, [r4, 0x38]\n"
                "\tmovs r1, 0x2E\n"
                "\tldrsh r0, [r4, r1]\n"
                "\tcmp r0, 0\n"
                "\tbgt _080D8AD0\n"
                "\tmovs r2, 0\n"
                "\tmovs r0, 0xC0\n"
                "\tlsls r0, 2\n"
                "\tstrh r0, [r4, 0x2E]\n"
                "\tldrh r0, [r4, 0x24]\n"
                "\tldrh r1, [r4, 0x20]\n"
                "\tadds r0, r1\n"
                "\tstrh r0, [r4, 0x20]\n"
                "\tstrh r0, [r4, 0x30]\n"
                "\tldrh r0, [r4, 0x26]\n"
                "\tldrh r1, [r4, 0x22]\n"
                "\tadds r0, r1\n"
                "\tstrh r0, [r4, 0x22]\n"
                "\tstrh r0, [r4, 0x34]\n"
                "\tadds r0, 0x4\n"
                "\tstrh r0, [r4, 0x36]\n"
                "\tldr r0, _080D8A68 @ =gMain\n"
                "\tldr r1, _080D8A6C @ =0x0000043d\n"
                "\tadds r0, r1\n"
                "\tldrb r1, [r0]\n"
                "\tmovs r0, 0x2\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbeq _080D8A78\n"
                "\tldr r1, _080D8A70 @ =gBanksBySide\n"
                "\tldr r0, _080D8A74 @ =gAnimBankTarget\n"
                "\tldrb r0, [r0]\n"
                "\tadds r0, r1\n"
                "\tldrb r1, [r0]\n"
                "\tmovs r0, 0x1\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbeq _080D8A78\n"
                "\tmovs r0, 0x80\n"
                "\tlsls r0, 1\n"
                "\tb _080D8A7A\n"
                "\t.align 2, 0\n"
                "_080D8A68: .4byte gMain\n"
                "_080D8A6C: .4byte 0x0000043d\n"
                "_080D8A70: .4byte gBanksBySide\n"
                "_080D8A74: .4byte gAnimBankTarget\n"
                "_080D8A78:\n"
                "\tldr r0, _080D8A90 @ =0x0000fff0\n"
                "_080D8A7A:\n"
                "\tstrh r0, [r4, 0x32]\n"
                "\tldrh r0, [r4, 0x3C]\n"
                "\tadds r0, 0x1\n"
                "\tmovs r1, 0\n"
                "\tstrh r0, [r4, 0x3C]\n"
                "\tstrh r1, [r4, 0x26]\n"
                "\tstrh r1, [r4, 0x24]\n"
                "\tadds r0, r4, 0\n"
                "\tbl sub_8078BD4\n"
                "\tb _080D8AD0\n"
                "\t.align 2, 0\n"
                "_080D8A90: .4byte 0x0000fff0\n"
                "_080D8A94:\n"
                "\tadds r0, r4, 0\n"
                "\tbl TranslateAnimLinear\n"
                "\tlsls r0, 24\n"
                "\tcmp r0, 0\n"
                "\tbeq _080D8AD0\n"
                "\tldrb r0, [r4, 0x1]\n"
                "\tlsls r0, 30\n"
                "\tlsrs r0, 30\n"
                "\tmovs r1, 0x1\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbeq _080D8AC2\n"
                "\tldrb r0, [r4, 0x3]\n"
                "\tlsls r0, 26\n"
                "\tlsrs r0, 27\n"
                "\tbl FreeOamMatrix\n"
                "\tldrb r1, [r4, 0x1]\n"
                "\tmovs r0, 0x4\n"
                "\tnegs r0, r0\n"
                "\tands r0, r1\n"
                "\tstrb r0, [r4, 0x1]\n"
                "_080D8AC2:\n"
                "\tadds r0, r4, 0\n"
                "\tbl DestroySprite\n"
                "\tldr r1, _080D8AD8 @ =gAnimVisualTaskCount\n"
                "\tldrb r0, [r1]\n"
                "\tsubs r0, 0x1\n"
                "\tstrb r0, [r1]\n"
                "_080D8AD0:\n"
                "\tpop {r4-r6}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_080D8AD8: .4byte gAnimVisualTaskCount");
}
#endif // NONMATCHING

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


/*
// Something to do with Hail.
// possibly equivalent, possibly not
bool8 sub_80D8BA8(u8 a1, u8 a2, u8 a3, u8 a4)//(u8 spriteId, u8 taskId, u8 a3)//(u8 taskId)
{
    //
    //struct Task *task = &gTasks[a2];
    //u16 i, j;
    //task->data[3]++;
    //u8 r5bank = ;

    //const struct SpriteTemplate *spriteTemplate;
    u8 spriteId;

    s16 r6, r7;

    u32 tempA, tempB; // u32? s16? u16? u8? int?

    //u8 r6, r7;

    tempA = a3 + 0;
    tempB = 0;

    // is that gunknown a tempvar?

    if (gUnknown_083D9DC4[a1][3] != 2 
        || IsAnimBankSpriteVisible(GetBattlerAtPosition(gUnknown_083D9DC4[a1][2])))
    {
        //return TRUE;
        tempB = 1;

        r7 = GetBattlerSpriteCoord(GetBattlerAtPosition(gUnknown_083D9DC4[a1][2]), 2);
        r6 = GetBattlerSpriteCoord(GetBattlerAtPosition(gUnknown_083D9DC4[a1][2]), 3);

        switch (gUnknown_083D9DC4[a1][3])
        {
        case 0:
            //
            r7 -= sub_807A100(GetBattlerAtPosition(gUnknown_083D9DC4[a1][2]), 1) / 6;
            r6 -= sub_807A100(GetBattlerAtPosition(gUnknown_083D9DC4[a1][2]), 0) / 6;
            break;
        case 1:
            //
            r7 += sub_807A100(GetBattlerAtPosition(gUnknown_083D9DC4[a1][2]), 1) / 6;
            r6 += sub_807A100(GetBattlerAtPosition(gUnknown_083D9DC4[a1][2]), 0) / 6;
        }
    }

    else
    {
        // _94
        r7 = gUnknown_083D9DC4[a1][0];
        r6 = gUnknown_083D9DC4[a1][1];
    }

    spriteId = CreateSprite(&HailSpriteTemplate, r7 - r6, -0x8, 0x12);

    if (spriteId != 0x40)
    {
        //
        StartSpriteAffineAnim(&gSprites[spriteId], a2);

        gSprites[spriteId].data[0] = tempB;
        gSprites[spriteId].data[3] = r7;
        gSprites[spriteId].data[4] = r6;

        gSprites[spriteId].data[5] = a2;
        gSprites[spriteId].data[6] = tempA;
        gSprites[spriteId].data[7] = a4;

        return TRUE;
    }

    return FALSE;

}
//*/

//*
NAKED bool8 sub_80D8BA8(u8 a1, u8 a2, u8 a3, u8 a4)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r10\n"
                "\tmov r6, r9\n"
                "\tmov r5, r8\n"
                "\tpush {r5-r7}\n"
                "\tsub sp, 0x8\n"
                "\tlsls r0, 24\n"
                "\tlsls r1, 24\n"
                "\tlsrs r1, 24\n"
                "\tmov r9, r1\n"
                "\tlsls r2, 24\n"
                "\tlsrs r2, 24\n"
                "\tstr r2, [sp]\n"
                "\tlsls r3, 24\n"
                "\tlsrs r3, 24\n"
                "\tmov r10, r3\n"
                "\tmovs r1, 0\n"
                "\tstr r1, [sp, 0x4]\n"
                "\tldr r1, _080D8C20 @ =gUnknown_083D9DC4\n"
                "\tlsrs r0, 22\n"
                "\tadds r4, r0, r1\n"
                "\tldrb r0, [r4, 0x3]\n"
                "\tlsls r0, 24\n"
                "\tasrs r0, 28\n"
                "\tmov r8, r0\n"
                "\tcmp r0, 0x2\n"
                "\tbeq _080D8C94\n"
                "\tldrh r0, [r4, 0x2]\n"
                "\tlsls r0, 20\n"
                "\tlsrs r0, 24\n"
                "\tbl GetBattlerAtPosition\n"
                "\tlsls r0, 24\n"
                "\tlsrs r5, r0, 24\n"
                "\tadds r0, r5, 0\n"
                "\tbl IsAnimBankSpriteVisible\n"
                "\tlsls r0, 24\n"
                "\tcmp r0, 0\n"
                "\tbeq _080D8C94\n"
                "\tmovs r0, 0x1\n"
                "\tstr r0, [sp, 0x4]\n"
                "\tadds r0, r5, 0\n"
                "\tmovs r1, 0x2\n"
                "\tbl GetBattlerSpriteCoord\n"
                "\tlsls r0, 24\n"
                "\tlsrs r7, r0, 24\n"
                "\tadds r0, r5, 0\n"
                "\tmovs r1, 0x3\n"
                "\tbl GetBattlerSpriteCoord\n"
                "\tlsls r0, 24\n"
                "\tlsrs r6, r0, 24\n"
                "\tmov r1, r8\n"
                "\tcmp r1, 0\n"
                "\tbeq _080D8C24\n"
                "\tcmp r1, 0x1\n"
                "\tbeq _080D8C5A\n"
                "\tb _080D8CA6\n"
                "\t.align 2, 0\n"
                "_080D8C20: .4byte gUnknown_083D9DC4\n"
                "_080D8C24:\n"
                "\tadds r0, r5, 0\n"
                "\tmovs r1, 0x1\n"
                "\tbl sub_807A100\n"
                "\tlsls r0, 16\n"
                "\tasrs r0, 16\n"
                "\tmovs r1, 0x6\n"
                "\tbl __divsi3\n"
                "\tlsls r1, r7, 16\n"
                "\tasrs r1, 16\n"
                "\tsubs r1, r0\n"
                "\tlsls r1, 16\n"
                "\tlsrs r7, r1, 16\n"
                "\tadds r0, r5, 0\n"
                "\tmovs r1, 0\n"
                "\tbl sub_807A100\n"
                "\tlsls r0, 16\n"
                "\tasrs r0, 16\n"
                "\tmovs r1, 0x6\n"
                "\tbl __divsi3\n"
                "\tlsls r1, r6, 16\n"
                "\tasrs r1, 16\n"
                "\tsubs r1, r0\n"
                "\tb _080D8C8E\n"
                "_080D8C5A:\n"
                "\tadds r0, r5, 0\n"
                "\tmovs r1, 0x1\n"
                "\tbl sub_807A100\n"
                "\tlsls r0, 16\n"
                "\tasrs r0, 16\n"
                "\tmovs r1, 0x6\n"
                "\tbl __divsi3\n"
                "\tlsls r1, r7, 16\n"
                "\tasrs r1, 16\n"
                "\tadds r1, r0\n"
                "\tlsls r1, 16\n"
                "\tlsrs r7, r1, 16\n"
                "\tadds r0, r5, 0\n"
                "\tmovs r1, 0\n"
                "\tbl sub_807A100\n"
                "\tlsls r0, 16\n"
                "\tasrs r0, 16\n"
                "\tmovs r1, 0x6\n"
                "\tbl __divsi3\n"
                "\tlsls r1, r6, 16\n"
                "\tasrs r1, 16\n"
                "\tadds r1, r0\n"
                "_080D8C8E:\n"
                "\tlsls r1, 16\n"
                "\tlsrs r6, r1, 16\n"
                "\tb _080D8CA6\n"
                "_080D8C94:\n"
                "\tldrh r0, [r4]\n"
                "\tlsls r0, 22\n"
                "\tasrs r0, 6\n"
                "\tlsrs r7, r0, 16\n"
                "\tldr r0, [r4]\n"
                "\tlsls r0, 12\n"
                "\tasrs r0, 22\n"
                "\tlsls r0, 16\n"
                "\tlsrs r6, r0, 16\n"
                "_080D8CA6:\n"
                "\tlsls r0, r6, 16\n"
                "\tasrs r0, 16\n"
                "\tadds r0, 0x8\n"
                "\tlsrs r1, r0, 31\n"
                "\tadds r0, r1\n"
                "\tasrs r0, 1\n"
                "\tlsls r1, r7, 16\n"
                "\tasrs r1, 16\n"
                "\tsubs r1, r0\n"
                "\tldr r0, _080D8D00 @ =HailSpriteTemplate\n"
                "\tlsls r1, 16\n"
                "\tasrs r1, 16\n"
                "\tmovs r2, 0x8\n"
                "\tnegs r2, r2\n"
                "\tmovs r3, 0x12\n"
                "\tbl CreateSprite\n"
                "\tlsls r0, 24\n"
                "\tlsrs r5, r0, 24\n"
                "\tcmp r5, 0x40\n"
                "\tbeq _080D8D08\n"
                "\tlsls r4, r5, 4\n"
                "\tadds r4, r5\n"
                "\tlsls r4, 2\n"
                "\tldr r0, _080D8D04 @ =gSprites\n"
                "\tadds r4, r0\n"
                "\tadds r0, r4, 0\n"
                "\tmov r1, r9\n"
                "\tbl StartSpriteAffineAnim\n"
                "\tmov r0, sp\n"
                "\tldrh r0, [r0, 0x4]\n"
                "\tstrh r0, [r4, 0x2E]\n"
                "\tstrh r7, [r4, 0x34]\n"
                "\tstrh r6, [r4, 0x36]\n"
                "\tmov r1, r9\n"
                "\tstrh r1, [r4, 0x38]\n"
                "\tmov r0, sp\n"
                "\tldrh r0, [r0]\n"
                "\tstrh r0, [r4, 0x3A]\n"
                "\tmov r1, r10\n"
                "\tstrh r1, [r4, 0x3C]\n"
                "\tmovs r0, 0x1\n"
                "\tb _080D8D0A\n"
                "\t.align 2, 0\n"
                "_080D8D00: .4byte gHailSpriteTemplate\n"
                "_080D8D04: .4byte gSprites\n"
                "_080D8D08:\n"
                "\tmovs r0, 0\n"
                "_080D8D0A:\n"
                "\tadd sp, 0x8\n"
                "\tpop {r3-r5}\n"
                "\tmov r8, r3\n"
                "\tmov r9, r4\n"
                "\tmov r10, r5\n"
                "\tpop {r4-r7}\n"
                "\tpop {r1}\n"
                "\tbx r1");
}
//*/

static void AnimHailBegin(struct Sprite *sprite)
{
    u8 spriteId;

    sprite->pos1.x += 4;
    sprite->pos1.y += 8;

    if (sprite->pos1.x < sprite->data[3] && sprite->pos1.y < sprite->data[4])
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

    if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];

    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2) + gBattleAnimArgs[2];
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3) + gBattleAnimArgs[3];
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
    sub_8078764(sprite, 1);

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
        sprite->pos2.x = -(sprite->data[3] >> 8);
    else
        sprite->pos2.x = sprite->data[3] >> 8;

    sprite->pos2.y = sprite->data[4] >> 8;

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
