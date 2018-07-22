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
extern u8  gBankSpriteIds[]; // ?

extern u16 gBattle_BG1_X;
extern u16 gBattle_BG1_Y;

extern const u8 gUnknown_083970E8[];

extern struct INCBIN_U8 gBattleAnimFogTilemap;
extern struct INCBIN_U8 gWeatherFog1Tiles; // is this ok or?

void sub_80D7704(struct Sprite *sprite);
void sub_80D78EC(struct Sprite *sprite);
void sub_80D792C(struct Sprite *sprite);
void sub_80D79B4(struct Sprite *sprite);
void sub_80D7A28(struct Sprite *sprite);
void sub_80D7A64(struct Sprite *sprite);
void sub_80D7CD4(struct Sprite *sprite);
void sub_80D7E88(struct Sprite *sprite);
void sub_80D7F10(struct Sprite *sprite);
void sub_80D83E0(struct Sprite *sprite);
void sub_80D8700(struct Sprite *sprite);
void sub_80D8D1C(struct Sprite *sprite);
void sub_807A9BC(struct Sprite *sprite);
void unc_080B06FC(struct Sprite *sprite);
void sub_80D8F10(struct Sprite *sprite);
void sub_80D7BA0(struct Sprite *sprite);
void sub_80D7C08(struct Sprite *sprite);
void sub_80D7C8C(struct Sprite *sprite);
void sub_80D7E18(struct Sprite *sprite);
void sub_80D8048(struct Sprite *sprite);
void sub_80D8874(struct Sprite *sprite);
void sub_80D8E00(struct Sprite *sprite);
void sub_80D8EE0(struct Sprite *sprite);
void sub_80D8F74(struct Sprite *sprite);

void sub_80D81E0(u8 taskId); // static?
void sub_80D851C(u8 taskId);
void sub_80D8AF8(u8 taskId);
void sub_80D8BA8(u8 taskId);

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

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9BE0 =
{
    .tileTag = 10141,
    .paletteTag = 10141,
    .oam = &gOamData_837E144,
    .anims = gSpriteAnimTable_83D9BB8,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9BDC,
    .callback = sub_80D78EC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9BF8 =
{
    .tileTag = 10141,
    .paletteTag = 10141,
    .oam = &gOamData_837E044,
    .anims = gSpriteAnimTable_83D9BBC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D78EC,
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

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9C24 =
{
    .tileTag = 10141,
    .paletteTag = 10141,
    .oam = &gOamData_837E0E4,
    .anims = gSpriteAnimTable_83D9BB8,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9C20,
    .callback = sub_80D792C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9C3C =
{
    .tileTag = 10141,
    .paletteTag = 10141,
    .oam = &gOamData_837E044,
    .anims = gSpriteAnimTable_83D9BBC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D792C,
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

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9C78 =
{
    .tileTag = 10141,
    .paletteTag = 10141,
    .oam = &gOamData_837E0E4,
    .anims = gSpriteAnimTable_83D9BB8,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9C74,
    .callback = sub_80D79B4,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9C90 =
{
    .tileTag = 10141,
    .paletteTag = 10141,
    .oam = &gOamData_837E0A4,
    .anims = gSpriteAnimTable_83D9BBC,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9C74,
    .callback = sub_80D79B4,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9CA8 =
{
    .tileTag = 10141,
    .paletteTag = 10141,
    .oam = &gOamData_837DF24,
    .anims = gSpriteAnimTable_83D9BC0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D7A64,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9CC0 =
{
    .tileTag = 10141,
    .paletteTag = 10141,
    .oam = &gOamData_837DF2C,
    .anims = gSpriteAnimTable_83D9BC4,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D7CD4,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9CD8 =
{
    .tileTag = 10141,
    .paletteTag = 10141,
    .oam = &gOamData_837DF24,
    .anims = gSpriteAnimTable_83D9BC0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D7CD4,
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

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9D14 =
{
    .tileTag = 10142,
    .paletteTag = 10142,
    .oam = &gOamData_837E084,
    .anims = gSpriteAnimTable_83D9D10,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D7E88,
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

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9D3C =
{
    .tileTag = 10144,
    .paletteTag = 10144,
    .oam = &gOamData_837E074,
    .anims = gSpriteAnimTable_83D9D38,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D7F10,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9D54 =
{
    .tileTag = 10172,
    .paletteTag = 10172,
    .oam = &gOamData_837E074,
    .anims = gSpriteAnimTable_83D9D38,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D7F10,
};

const u8 gUnknown_083D9D6C[] =
{
    0, 1, 2, 2, 2, 2, 3, 4, 4, 4, 5, 6, 6, 6, 6, 7, 8, 8, 8, 9,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9D80 =
{
    .tileTag = 10155,
    .paletteTag = 10155,
    .oam = &gOamData_837DF2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D83E0,
};

const u8 gUnknown_083D9D98[] =
{
    0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 5,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9DAC =
{
    .tileTag = 10172,
    .paletteTag = 10172,
    .oam = &gOamData_837E074,
    .anims = gSpriteAnimTable_83D9D38,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D8700,
};

// bitfield array
const u32 gUnknown_083D9DC4[] =
{
    0x2001E064,
    0x0001E055,
    0x1011E0F2,
    0x1021E042,
    0x0031E0B6,
    0x2001E03C,
    0x0011E0D6,
    0x1001E071,
    0x1031E0D2,
    0x0021E026,
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

const struct SpriteTemplate gSpriteTemplate_83D9E3C =
{
    .tileTag = 10263,
    .paletteTag = 10263,
    .oam = &gOamData_837DF8C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9E2C,
    .callback = sub_80D8D1C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9E54 =
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

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9EF4 =
{
    .tileTag = 10043,
    .paletteTag = 10043,
    .oam = &gOamData_837DFF4,
    .anims = gSpriteAnimTable_83D9E88,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9EE0,
    .callback = unc_080B06FC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9F0C =
{
    .tileTag = 10141,
    .paletteTag = 10141,
    .oam = &gOamData_837DF24,
    .anims = gSpriteAnimTable_83D9BBC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D8F10,
};

/* 
 * possible moves include: aurora beam, blizzard, hail, haze, ice ball,  
 *                         ice beam, ice punch, icicle spear, icy wind, 
 *                         mist, powder snow, sheer cold, 
 */

#ifdef NONMATCHING
// NOT EQUIVALENT
void sub_80D7704(struct Sprite *sprite)
{
    //
    u8 r9, r8, r3, r6;
    s16 r4, r10;

    sprite->oam.tileNum += 7;

    r9 = GetBattlerSpriteCoord(gAnimBankTarget, 2);
    r8 = GetBattlerSpriteCoord(gAnimBankTarget, 3);
    r3 = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    r6 = GetBattlerSpriteCoord(gAnimBankAttacker, 3);

    sprite->data[0] = gBattleAnimArgs[4];

    sprite->data[1] = r3 + gBattleAnimArgs[0]; //???
    sprite->data[2] = r9 + gBattleAnimArgs[2];
    sprite->data[3] = r6 + gBattleAnimArgs[1];
    sprite->data[4] = r8 + gBattleAnimArgs[3];

    sub_8078314(sprite);

    if ((u32)(r9 + 32) <= 304 || (u32)(r8 + 32) <= 224) // cmp 1
    {
        r4 = sprite->data[1]; 
        r10 = 304;
        // _080D77AA
    }
    // _080D77DE





    /*sprite->oam.tileNum += 7;

    sprite->data[1] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
    sprite->data[3] = GetBattlerSpriteCoord(gAnimBankTarget, 3);
    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankAttacker, 3);

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[1] = gBattleAnimArgs[0];*/
}
#else
NAKED void sub_80D7704(struct Sprite *sprite)
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
#endif // NONMATCHING 

// MATCHING
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
        DestroyAnimSprite(sprite);
}

// MATCHING
void sub_80D78EC(struct Sprite *sprite)
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

// MATCHING
void sub_80D792C(struct Sprite *sprite)
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

// MATCHING
void sub_80D79B4(struct Sprite *sprite)
{
    if (gBattleAnimArgs[2] == 0)
        sub_8078764(sprite, 1);

    else
    {
        SetAverageBattlerPositions(gAnimBankTarget, 1, &sprite->pos1.x, &sprite->pos1.y);

        if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
            gBattleAnimArgs[0] = -gBattleAnimArgs[0];

        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
    }

    StoreSpriteCallbackInData(sprite, sub_80D7A28);
    sprite->callback = sub_80785E4;
}

// MATCHING
void sub_80D7A28(struct Sprite *sprite)
{
    sprite->invisible ^= 1;

    sprite->data[0] += 1;

    if (sprite->data[0] == 20)
        move_anim_8074EE0(sprite);
}

// MATCHING
void sub_80D7A64(struct Sprite *sprite)
{
    int i;
    s16 tempDataHolder[8];

    InitAnimSpritePos(sprite, 1);

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[3] = sprite->pos1.y;

    if (gBattleAnimArgs[5] == 0)
    {
        sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
        sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3) + gBattleAnimArgs[3];
    }
    else
        SetAverageBattlerPositions(gAnimBankTarget, 1, &sprite->data[2], &sprite->data[4]);

    if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
        sprite->data[2] -= gBattleAnimArgs[2];

    else
        sprite->data[2] += gBattleAnimArgs[2];

    for (i = 0; i < 8; i++)
        tempDataHolder[i] = sprite->data[i];

    sub_8078D60(sprite);

    sprite->data[1] ^= 1;
    sprite->data[2] ^= 1;

    for (;;)
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
    StoreSpriteCallbackInData(sprite, sub_80D7BA0);
}

// MATCHING
void sub_80D7BA0(struct Sprite *sprite)
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
    
    sprite->callback = sub_80D7C08;
    sub_80D7C08(sprite);
}

// MATCHING
void sub_80D7C08(struct Sprite *sprite)
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

        sprite->callback = sub_80D7C8C;
    }
}

// MATCHING
void sub_80D7C8C(struct Sprite *sprite)
{
    sprite->data[0] = 1;
    sub_8078CE8(sprite);

    if ((u32)(sprite->pos1.x + sprite->pos2.x + 16) > 272
     || sprite->pos1.y + sprite->pos2.y > 256
     || sprite->pos1.y + sprite->pos2.y < -16)
        DestroyAnimSprite(sprite);
}

// MATCHED
void sub_80D7CD4(struct Sprite *sprite)
{
    int i;
    s16 tempDataHolder[8];

    InitAnimSpritePos(sprite, 1);

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[3] = sprite->pos1.y;

    if (gBattleAnimArgs[7] == 0)
    {
        sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
        sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3);
    }
    else
        SetAverageBattlerPositions(gAnimBankTarget, 1, &sprite->data[2], &sprite->data[4]);

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

    for (;;)
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

    sprite->callback = sub_80D7E18;
}

// MATCHING
void sub_80D7E18(struct Sprite *sprite)
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

// MATCHING
void sub_80D7E88(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        if (gBattleAnimArgs[2] == 0)
            sub_8078764(sprite, 0);

        else
        {
            SetAverageBattlerPositions(gAnimBankTarget, 0, &sprite->pos1.x, &sprite->pos1.y);

            if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
                gBattleAnimArgs[0] = -gBattleAnimArgs[0];

            sprite->pos1.x += gBattleAnimArgs[0];
            sprite->pos1.y += gBattleAnimArgs[1];
        }
        sprite->data[0] += 1; 
    }
    else
        if (sprite->animEnded)
            DestroyAnimSprite(sprite);
}

// MATCHING
void sub_80D7F10(struct Sprite *sprite)
{
    s16 tempVar;
    u8  battler;

    if (gBattleAnimArgs[4] == 0)
    {
        if (gBattleAnimArgs[5] == 0)
            InitAnimSpritePos(sprite, 0);

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
            sub_8078764(sprite, 0);

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

    if (gBattleAnimArgs[5] == 0 || IsDoubleBattle() == 0) 
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
    
    sprite->callback = sub_80D8048;
    sub_80D8048(sprite);
}

// MATCHING 
void sub_80D8048(struct Sprite *sprite)
{
    if (TranslateAnimLinear(sprite) == 0)
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
        DestroyAnimSprite(sprite);
}

#ifdef NONMATCHING
// haze?
//
void sub_80D80E0(u8 taskId)//??
{
    struct Struct_sub_8078914 subStruct;

    //
    REG_BLDCNT = 0x3F42; // +
    REG_BLDALPHA = 0x1000; // +

    // 
    REG_BG1CNT_BITFIELD.priority = 1;//charBaseBlock = 1; // normal.c <1131>

    REG_BG1CNT_BITFIELD.screenSize = 0; // + // dark.c <844>

    // this bit is different
    if (!IsContest())
        REG_BG1CNT_BITFIELD.charBaseBlock = 1;

    //
    gBattle_BG1_X = 0;
    gBattle_BG1_Y = 0;

    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;

    sub_8078914(&subStruct);

    // <-- ?
    DmaFill32Defvars(3, 0, subStruct.field_4, 0x1000);
    DmaCopy32Defvars(3, &gWeatherFog1Tiles, subStruct.field_0, 0x1000);

    LZDecompressVram(&gBattleAnimFogTilemap, subStruct.field_4);
    // ? -->

    LoadPalette(&gUnknown_083970E8, subStruct.field_8 * 16, 32);

    if (IsContest()) // +
        sub_80763FC(subStruct.field_8, (u16 *)subStruct.field_4, 0, 0); // +

    //
    gTasks[taskId].func = sub_80D81E0; // +
}

#else
NAKED void sub_80D80E0(u8 taskId)
{
    asm_unified(".equ REG_BLDCNT, 0x4000050\n"
                ".equ REG_BG1CNT, 0x400000A\n"
                ".equ REG_BG1HOFS, 0x4000014\n"
                "\tpush {r4,r5,lr}\n"
                "\tsub sp, 0x10\n"
                "\tlsls r0, 24\n"
                "\tlsrs r5, r0, 24\n"
                "\tldr r1, _080D81A8 @ =REG_BLDCNT\n"
                "\tldr r2, _080D81AC @ =0x00003f42\n"
                "\tadds r0, r2, 0\n"
                "\tstrh r0, [r1]\n"
                "\tadds r1, 0x2\n"
                "\tmovs r2, 0x80\n"
                "\tlsls r2, 5\n"
                "\tadds r0, r2, 0\n"
                "\tstrh r0, [r1]\n"
                "\tldr r4, _080D81B0 @ =REG_BG1CNT\n"
                "\tldrb r1, [r4]\n"
                "\tmovs r0, 0x4\n"
                "\tnegs r0, r0\n"
                "\tands r0, r1\n"
                "\tmovs r1, 0x1\n"
                "\torrs r0, r1\n"
                "\tstrb r0, [r4]\n"
                "\tldrb r1, [r4, 0x1]\n"
                "\tmovs r0, 0x3F\n"
                "\tands r0, r1\n"
                "\tstrb r0, [r4, 0x1]\n"
                "\tbl IsContest\n"
                "\tlsls r0, 24\n"
                "\tcmp r0, 0\n"
                "\tbne _080D812A\n"
                "\tldrb r0, [r4]\n"
                "\tmovs r1, 0xD\n"
                "\tnegs r1, r1\n"
                "\tands r1, r0\n"
                "\tmovs r0, 0x4\n"
                "\torrs r1, r0\n"
                "\tstrb r1, [r4]\n"
                "_080D812A:\n"
                "\tldr r0, _080D81B4 @ =gBattle_BG1_X\n"
                "\tmovs r1, 0\n"
                "\tstrh r1, [r0]\n"
                "\tldr r0, _080D81B8 @ =gBattle_BG1_Y\n"
                "\tstrh r1, [r0]\n"
                "\tldr r0, _080D81BC @ =REG_BG1HOFS\n"
                "\tstrh r1, [r0]\n"
                "\tadds r0, 0x2\n"
                "\tstrh r1, [r0]\n"
                "\tmov r0, sp\n"
                "\tbl sub_8078914\n"
                "\tldr r1, [sp, 0x4]\n"
                "\tmovs r0, 0\n"
                "\tstr r0, [sp, 0xC]\n"
                "\tldr r0, _080D81C0 @ =0x040000d4\n"
                "\tadd r2, sp, 0xC\n"
                "\tstr r2, [r0]\n"
                "\tstr r1, [r0, 0x4]\n"
                "\tldr r2, _080D81C4 @ =0x85000400\n"
                "\tstr r2, [r0, 0x8]\n"
                "\tldr r2, [r0, 0x8]\n"
                "\tldr r2, _080D81C8 @ =gWeatherFog1Tiles\n"
                "\tldr r3, [sp]\n"
                "\tstr r2, [r0]\n"
                "\tstr r3, [r0, 0x4]\n"
                "\tldr r2, _080D81CC @ =0x80000400\n"
                "\tstr r2, [r0, 0x8]\n"
                "\tldr r0, [r0, 0x8]\n"
                "\tldr r0, _080D81D0 @ =gBattleAnimFogTilemap\n"
                "\tbl LZDecompressVram\n"
                "\tldr r0, _080D81D4 @ =gUnknown_083970E8\n"
                "\tmov r1, sp\n"
                "\tldrb r1, [r1, 0x8]\n"
                "\tlsls r1, 4\n"
                "\tmovs r2, 0x20\n"
                "\tbl LoadPalette\n"
                "\tbl IsContest\n"
                "\tlsls r0, 24\n"
                "\tcmp r0, 0\n"
                "\tbeq _080D8190\n"
                "\tmov r0, sp\n"
                "\tldrb r0, [r0, 0x8]\n"
                "\tldr r1, [sp, 0x4]\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0\n"
                "\tbl sub_80763FC\n"
                "_080D8190:\n"
                "\tldr r0, _080D81D8 @ =gTasks\n"
                "\tlsls r1, r5, 2\n"
                "\tadds r1, r5\n"
                "\tlsls r1, 3\n"
                "\tadds r1, r0\n"
                "\tldr r0, _080D81DC @ =sub_80D81E0\n"
                "\tstr r0, [r1]\n"
                "\tadd sp, 0x10\n"
                "\tpop {r4,r5}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_080D81A8: .4byte REG_BLDCNT\n"
                "_080D81AC: .4byte 0x00003f42\n"
                "_080D81B0: .4byte REG_BG1CNT\n"
                "_080D81B4: .4byte gBattle_BG1_X\n"
                "_080D81B8: .4byte gBattle_BG1_Y\n"
                "_080D81BC: .4byte REG_BG1HOFS\n"
                "_080D81C0: .4byte 0x040000d4\n"
                "_080D81C4: .4byte 0x85000400\n"
                "_080D81C8: .4byte gWeatherFog1Tiles\n"
                "_080D81CC: .4byte 0x80000400\n"
                "_080D81D0: .4byte gBattleAnimFogTilemap\n"
                "_080D81D4: .4byte gUnknown_083970E8\n"
                "_080D81D8: .4byte gTasks\n"
                "_080D81DC: .4byte sub_80D81E0");
}
#endif // NONMATCHING 
//
// static void sub_80D81E0(u8 taskId);

#ifdef NONMATCHING
// 
void sub_80D81E0(u8 taskId)
{
    //
    gBattle_BG1_X += 0xFFFF;
} 
#else
NAKED void sub_80D81E0(u8 taskId)
{
    asm_unified(".equ REG_BLDCNT, 0x4000050\n"
                ".equ REG_BLDALPHA, 0x4000052\n"
                ".equ REG_BG1CNT, 0x400000A\n"
                ".equ REG_BG1HOFS, 0x4000014\n"
                "\tpush {r4-r7,lr}\n"
                "\tmov r7, r10\n"
                "\tmov r6, r9\n"
                "\tmov r5, r8\n"
                "\tpush {r5-r7}\n"
                "\tsub sp, 0x10\n"
                "\tlsls r0, 24\n"
                "\tlsrs r6, r0, 24\n"
                "\tldr r2, _080D8220 @ =gBattle_BG1_X\n"
                "\tldr r1, _080D8224 @ =0x0000ffff\n"
                "\tadds r0, r1, 0\n"
                "\tldrh r4, [r2]\n"
                "\tadds r0, r4\n"
                "\tstrh r0, [r2]\n"
                "\tldr r1, _080D8228 @ =gBattle_BG1_Y\n"
                "\tldr r3, _080D822C @ =gTasks\n"
                "\tlsls r0, r6, 2\n"
                "\tadds r0, r6\n"
                "\tlsls r0, 3\n"
                "\tadds r0, r3\n"
                "\tmovs r4, 0x20\n"
                "\tldrsh r0, [r0, r4]\n"
                "\tadds r4, r1, 0\n"
                "\tcmp r0, 0x4\n"
                "\tbls _080D8214\n"
                "\tb _080D83B0\n"
                "_080D8214:\n"
                "\tlsls r0, 2\n"
                "\tldr r1, _080D8230 @ =_080D8234\n"
                "\tadds r0, r1\n"
                "\tldr r0, [r0]\n"
                "\tmov pc, r0\n"
                "\t.align 2, 0\n"
                "_080D8220: .4byte gBattle_BG1_X\n"
                "_080D8224: .4byte 0x0000ffff\n"
                "_080D8228: .4byte gBattle_BG1_Y\n"
                "_080D822C: .4byte gTasks\n"
                "_080D8230: .4byte _080D8234\n"
                "\t.align 2, 0\n"
                "_080D8234:\n"
                "\t.4byte _080D8248\n"
                "\t.4byte _080D82A0\n"
                "\t.4byte _080D82C2\n"
                "\t.4byte _080D8304\n"
                "\t.4byte _080D838C\n"
                "_080D8248:\n"
                "\tlsls r0, r6, 2\n"
                "\tadds r0, r6\n"
                "\tlsls r0, 3\n"
                "\tadds r3, r0, r3\n"
                "\tldrh r0, [r3, 0x1C]\n"
                "\tadds r0, 0x1\n"
                "\tmovs r4, 0\n"
                "\tstrh r0, [r3, 0x1C]\n"
                "\tlsls r0, 16\n"
                "\tasrs r0, 16\n"
                "\tcmp r0, 0x4\n"
                "\tbeq _080D8262\n"
                "\tb _080D83B0\n"
                "_080D8262:\n"
                "\tstrh r4, [r3, 0x1C]\n"
                "\tldrh r0, [r3, 0x1A]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r3, 0x1A]\n"
                "\tldr r1, _080D8298 @ =gUnknown_083D9D6C\n"
                "\tmovs r2, 0x1A\n"
                "\tldrsh r0, [r3, r2]\n"
                "\tadds r0, r1\n"
                "\tldrb r1, [r0]\n"
                "\tstrh r1, [r3, 0x1E]\n"
                "\tldr r2, _080D829C @ =REG_BLDALPHA\n"
                "\tmovs r0, 0x10\n"
                "\tsubs r0, r1\n"
                "\tlsls r0, 8\n"
                "\torrs r1, r0\n"
                "\tstrh r1, [r2]\n"
                "\tmovs r1, 0x1E\n"
                "\tldrsh r0, [r3, r1]\n"
                "\tcmp r0, 0x9\n"
                "\tbeq _080D828C\n"
                "\tb _080D83B0\n"
                "_080D828C:\n"
                "\tldrh r0, [r3, 0x20]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r3, 0x20]\n"
                "\tstrh r4, [r3, 0x1E]\n"
                "\tb _080D83B0\n"
                "\t.align 2, 0\n"
                "_080D8298: .4byte gUnknown_083D9D6C\n"
                "_080D829C: .4byte REG_BLDALPHA\n"
                "_080D82A0:\n"
                "\tlsls r0, r6, 2\n"
                "\tadds r0, r6\n"
                "\tlsls r0, 3\n"
                "\tadds r3, r0, r3\n"
                "\tldrh r0, [r3, 0x1E]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r3, 0x1E]\n"
                "\tlsls r0, 16\n"
                "\tasrs r0, 16\n"
                "\tcmp r0, 0x51\n"
                "\tbne _080D83B0\n"
                "\tmovs r0, 0x9\n"
                "\tstrh r0, [r3, 0x1E]\n"
                "\tldrh r0, [r3, 0x20]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r3, 0x20]\n"
                "\tb _080D83B0\n"
                "_080D82C2:\n"
                "\tlsls r0, r6, 2\n"
                "\tadds r0, r6\n"
                "\tlsls r0, 3\n"
                "\tadds r3, r0, r3\n"
                "\tldrh r0, [r3, 0x1C]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r3, 0x1C]\n"
                "\tlsls r0, 16\n"
                "\tasrs r0, 16\n"
                "\tcmp r0, 0x4\n"
                "\tbne _080D83B0\n"
                "\tmovs r0, 0\n"
                "\tstrh r0, [r3, 0x1C]\n"
                "\tldrh r1, [r3, 0x1E]\n"
                "\tsubs r1, 0x1\n"
                "\tstrh r1, [r3, 0x1E]\n"
                "\tldr r2, _080D8300 @ =REG_BLDALPHA\n"
                "\tmovs r0, 0x10\n"
                "\tsubs r0, r1\n"
                "\tlsls r0, 8\n"
                "\torrs r1, r0\n"
                "\tstrh r1, [r2]\n"
                "\tmovs r2, 0x1E\n"
                "\tldrsh r1, [r3, r2]\n"
                "\tcmp r1, 0\n"
                "\tbne _080D83B0\n"
                "\tldrh r0, [r3, 0x20]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r3, 0x20]\n"
                "\tstrh r1, [r3, 0x1E]\n"
                "\tb _080D83B0\n"
                "\t.align 2, 0\n"
                "_080D8300: .4byte REG_BLDALPHA\n"
                "_080D8304:\n"
                "\tmov r0, sp\n"
                "\tbl sub_8078914\n"
                "\tldr r2, [sp]\n"
                "\tmovs r3, 0x80\n"
                "\tlsls r3, 6\n"
                "\tlsls r4, r6, 2\n"
                "\tmov r10, r4\n"
                "\tadd r5, sp, 0xC\n"
                "\tmovs r7, 0\n"
                "\tldr r1, _080D83C0 @ =0x040000d4\n"
                "\tmovs r4, 0x80\n"
                "\tlsls r4, 5\n"
                "\tmov r8, r5\n"
                "\tldr r0, _080D83C4 @ =0x85000400\n"
                "\tmov r12, r0\n"
                "\tmovs r0, 0x85\n"
                "\tlsls r0, 24\n"
                "\tmov r9, r0\n"
                "_080D832A:\n"
                "\tstr r7, [sp, 0xC]\n"
                "\tmov r0, r8\n"
                "\tstr r0, [r1]\n"
                "\tstr r2, [r1, 0x4]\n"
                "\tmov r0, r12\n"
                "\tstr r0, [r1, 0x8]\n"
                "\tldr r0, [r1, 0x8]\n"
                "\tadds r2, r4\n"
                "\tsubs r3, r4\n"
                "\tcmp r3, r4\n"
                "\tbhi _080D832A\n"
                "\tstr r7, [sp, 0xC]\n"
                "\tstr r5, [r1]\n"
                "\tstr r2, [r1, 0x4]\n"
                "\tlsrs r0, r3, 2\n"
                "\tmov r2, r9\n"
                "\torrs r0, r2\n"
                "\tstr r0, [r1, 0x8]\n"
                "\tldr r0, [r1, 0x8]\n"
                "\tldr r1, [sp, 0x4]\n"
                "\tmovs r0, 0\n"
                "\tstr r0, [sp, 0xC]\n"
                "\tldr r0, _080D83C0 @ =0x040000d4\n"
                "\tstr r5, [r0]\n"
                "\tstr r1, [r0, 0x4]\n"
                "\tldr r1, _080D83C8 @ =0x85000200\n"
                "\tstr r1, [r0, 0x8]\n"
                "\tldr r0, [r0, 0x8]\n"
                "\tbl IsContest\n"
                "\tlsls r0, 24\n"
                "\tcmp r0, 0\n"
                "\tbne _080D8378\n"
                "\tldr r2, _080D83CC @ =REG_BG1CNT\n"
                "\tldrb r1, [r2]\n"
                "\tmovs r0, 0xD\n"
                "\tnegs r0, r0\n"
                "\tands r0, r1\n"
                "\tstrb r0, [r2]\n"
                "_080D8378:\n"
                "\tldr r0, _080D83D0 @ =gTasks\n"
                "\tmov r4, r10\n"
                "\tadds r1, r4, r6\n"
                "\tlsls r1, 3\n"
                "\tadds r1, r0\n"
                "\tldrh r0, [r1, 0x20]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r1, 0x20]\n"
                "\tldr r2, _080D83D4 @ =gBattle_BG1_X\n"
                "\tldr r4, _080D83D8 @ =gBattle_BG1_Y\n"
                "_080D838C:\n"
                "\tmovs r1, 0\n"
                "\tstrh r1, [r2]\n"
                "\tstrh r1, [r4]\n"
                "\tldr r0, _080D83DC @ =REG_BLDCNT\n"
                "\tstrh r1, [r0]\n"
                "\tadds r0, 0x2\n"
                "\tstrh r1, [r0]\n"
                "\tldr r2, _080D83CC @ =REG_BG1CNT\n"
                "\tldrb r1, [r2]\n"
                "\tmovs r0, 0x4\n"
                "\tnegs r0, r0\n"
                "\tands r0, r1\n"
                "\tmovs r1, 0x1\n"
                "\torrs r0, r1\n"
                "\tstrb r0, [r2]\n"
                "\tadds r0, r6, 0\n"
                "\tbl DestroyAnimVisualTask\n"
                "_080D83B0:\n"
                "\tadd sp, 0x10\n"
                "\tpop {r3-r5}\n"
                "\tmov r8, r3\n"
                "\tmov r9, r4\n"
                "\tmov r10, r5\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_080D83C0: .4byte 0x040000d4\n"
                "_080D83C4: .4byte 0x85000400\n"
                "_080D83C8: .4byte 0x85000200\n"
                "_080D83CC: .4byte REG_BG1CNT\n"
                "_080D83D0: .4byte gTasks\n"
                "_080D83D4: .4byte gBattle_BG1_X\n"
                "_080D83D8: .4byte gBattle_BG1_Y\n"
                "_080D83DC: .4byte REG_BLDCNT");
}
#endif // NONMATCHING

// MATCHING
void sub_80D83E0(struct Sprite *sprite)
{
    // 
    sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3);

    sprite->callback = TranslateAnimSpriteToTargetMonLocation;
}

#ifdef NONMATCHING
// write down the 0x85000400, 0x040000d4 offset keys
void sub_80D8414(u8 taskId)
{
    //
    struct Struct_sub_8078914 subStruct;

    //
    REG_BLDCNT = 0x3F42; // +
    REG_BLDALPHA = 0x1000; // +

    // 
    REG_BG1CNT_BITFIELD.priority = 1;

    REG_BG1CNT_BITFIELD.screenSize = 0; 

    if (!IsContest())
        REG_BG1CNT_BITFIELD.charBaseBlock = 1;

    //
    gBattle_BG1_X = 0;
    gBattle_BG1_Y = 0;

    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;

    sub_8078914(&subStruct);

    // <-- ?
    DmaFill32Defvars(3, 0, subStruct.field_4, 0x1000);
    DmaCopy32Defvars(3, &gWeatherFog1Tiles, subStruct.field_0, 0x1000);

    LZDecompressVram(&gBattleAnimFogTilemap, subStruct.field_4);
    // ? -->

    LoadPalette(&gUnknown_083970E8, subStruct.field_8 * 16, 32);

    if (IsContest()) // +
        sub_80763FC(subStruct.field_8, (u16 *)subStruct.field_4, 0, 0); // +

    gTasks[taskId].data[15] = 0xFFFF;
    gTasks[taskId].func = sub_80D851C;
}
#else
NAKED
void sub_80D8414(u8 taskId)
{
    asm_unified(".equ REG_BLDCNT, 0x4000050\n"
                ".equ REG_BG1CNT, 0x400000A\n"
                ".equ REG_BG1HOFS, 0x4000014\n"
                "\tpush {r4,r5,lr}\n"
                "\tsub sp, 0x10\n"
                "\tlsls r0, 24\n"
                "\tlsrs r5, r0, 24\n"
                "\tldr r1, _080D84E0 @ =REG_BLDCNT\n"
                "\tldr r2, _080D84E4 @ =0x00003f42\n"
                "\tadds r0, r2, 0\n"
                "\tstrh r0, [r1]\n"
                "\tadds r1, 0x2\n"
                "\tmovs r2, 0x80\n"
                "\tlsls r2, 5\n"
                "\tadds r0, r2, 0\n"
                "\tstrh r0, [r1]\n"
                "\tldr r4, _080D84E8 @ =REG_BG1CNT\n"
                "\tldrb r1, [r4]\n"
                "\tmovs r0, 0x4\n"
                "\tnegs r0, r0\n"
                "\tands r0, r1\n"
                "\tmovs r1, 0x1\n"
                "\torrs r0, r1\n"
                "\tstrb r0, [r4]\n"
                "\tldrb r1, [r4, 0x1]\n"
                "\tmovs r0, 0x3F\n"
                "\tands r0, r1\n"
                "\tstrb r0, [r4, 0x1]\n"
                "\tbl IsContest\n"
                "\tlsls r0, 24\n"
                "\tcmp r0, 0\n"
                "\tbne _080D845E\n"
                "\tldrb r0, [r4]\n"
                "\tmovs r1, 0xD\n"
                "\tnegs r1, r1\n"
                "\tands r1, r0\n"
                "\tmovs r0, 0x4\n"
                "\torrs r1, r0\n"
                "\tstrb r1, [r4]\n"
                "_080D845E:\n"
                "\tldr r0, _080D84EC @ =gBattle_BG1_X\n"
                "\tmovs r1, 0\n"
                "\tstrh r1, [r0]\n"
                "\tldr r0, _080D84F0 @ =gBattle_BG1_Y\n"
                "\tstrh r1, [r0]\n"
                "\tldr r0, _080D84F4 @ =REG_BG1HOFS\n"
                "\tstrh r1, [r0]\n"
                "\tadds r0, 0x2\n"
                "\tstrh r1, [r0]\n"
                "\tmov r0, sp\n"
                "\tbl sub_8078914\n"
                "\tldr r1, [sp, 0x4]\n"
                "\tmovs r0, 0\n"
                "\tstr r0, [sp, 0xC]\n"
                "\tldr r0, _080D84F8 @ =0x040000d4\n"
                "\tadd r2, sp, 0xC\n"
                "\tstr r2, [r0]\n"
                "\tstr r1, [r0, 0x4]\n"
                "\tldr r2, _080D84FC @ =0x85000400\n"
                "\tstr r2, [r0, 0x8]\n"
                "\tldr r2, [r0, 0x8]\n"
                "\tldr r2, _080D8500 @ =gWeatherFog1Tiles\n"
                "\tldr r3, [sp]\n"
                "\tstr r2, [r0]\n"
                "\tstr r3, [r0, 0x4]\n"
                "\tldr r2, _080D8504 @ =0x80000400\n"
                "\tstr r2, [r0, 0x8]\n"
                "\tldr r0, [r0, 0x8]\n"
                "\tldr r0, _080D8508 @ =gBattleAnimFogTilemap\n"
                "\tbl LZDecompressVram\n"
                "\tldr r0, _080D850C @ =gUnknown_083970E8\n"
                "\tmov r1, sp\n"
                "\tldrb r1, [r1, 0x8]\n"
                "\tlsls r1, 4\n"
                "\tmovs r2, 0x20\n"
                "\tbl LoadPalette\n"
                "\tbl IsContest\n"
                "\tlsls r0, 24\n"
                "\tcmp r0, 0\n"
                "\tbeq _080D84C4\n"
                "\tmov r0, sp\n"
                "\tldrb r0, [r0, 0x8]\n"
                "\tldr r1, [sp, 0x4]\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0\n"
                "\tbl sub_80763FC\n"
                "_080D84C4:\n"
                "\tldr r1, _080D8510 @ =gTasks\n"
                "\tlsls r0, r5, 2\n"
                "\tadds r0, r5\n"
                "\tlsls r0, 3\n"
                "\tadds r0, r1\n"
                "\tldr r1, _080D8514 @ =0x0000ffff\n"
                "\tstrh r1, [r0, 0x26]\n"
                "\tldr r1, _080D8518 @ =sub_80D851C\n"
                "\tstr r1, [r0]\n"
                "\tadd sp, 0x10\n"
                "\tpop {r4,r5}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_080D84E0: .4byte REG_BLDCNT\n"
                "_080D84E4: .4byte 0x00003f42\n"
                "_080D84E8: .4byte REG_BG1CNT\n"
                "_080D84EC: .4byte gBattle_BG1_X\n"
                "_080D84F0: .4byte gBattle_BG1_Y\n"
                "_080D84F4: .4byte REG_BG1HOFS\n"
                "_080D84F8: .4byte 0x040000d4\n"
                "_080D84FC: .4byte 0x85000400\n"
                "_080D8500: .4byte gWeatherFog1Tiles\n"
                "_080D8504: .4byte 0x80000400\n"
                "_080D8508: .4byte gBattleAnimFogTilemap\n"
                "_080D850C: .4byte gUnknown_083970E8\n"
                "_080D8510: .4byte gTasks\n"
                "_080D8514: .4byte 0x0000ffff\n"
                "_080D8518: .4byte sub_80D851C");
}
#endif // NONMATCHING

// 
// NAKED
NAKED void sub_80D851C(u8 taskId)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r10\n"
                "\tmov r6, r9\n"
                "\tmov r5, r8\n"
                "\tpush {r5-r7}\n"
                "\tsub sp, 0x10\n"
                "\tlsls r0, 24\n"
                "\tlsrs r6, r0, 24\n"
                "\tldr r3, _080D8558 @ =gBattle_BG1_X\n"
                "\tldr r4, _080D855C @ =gTasks\n"
                "\tlsls r1, r6, 2\n"
                "\tadds r1, r6\n"
                "\tlsls r1, 3\n"
                "\tadds r1, r4\n"
                "\tldrh r0, [r1, 0x26]\n"
                "\tldrh r2, [r3]\n"
                "\tadds r0, r2\n"
                "\tstrh r0, [r3]\n"
                "\tldr r2, _080D8560 @ =gBattle_BG1_Y\n"
                "\tmovs r5, 0x20\n"
                "\tldrsh r0, [r1, r5]\n"
                "\tcmp r0, 0x4\n"
                "\tbls _080D854C\n"
                "\tb _080D86D0\n"
                "_080D854C:\n"
                "\tlsls r0, 2\n"
                "\tldr r1, _080D8564 @ =_080D8568\n"
                "\tadds r0, r1\n"
                "\tldr r0, [r0]\n"
                "\tmov pc, r0\n"
                "\t.align 2, 0\n"
                "_080D8558: .4byte gBattle_BG1_X\n"
                "_080D855C: .4byte gTasks\n"
                "_080D8560: .4byte gBattle_BG1_Y\n"
                "_080D8564: .4byte _080D8568\n"
                "\t.align 2, 0\n"
                "_080D8568:\n"
                "\t.4byte _080D857C\n"
                "\t.4byte _080D85C0\n"
                "\t.4byte _080D85E2\n"
                "\t.4byte _080D8624\n"
                "\t.4byte _080D86AC\n"
                "_080D857C:\n"
                "\tlsls r0, r6, 2\n"
                "\tadds r0, r6\n"
                "\tlsls r0, 3\n"
                "\tadds r4, r0, r4\n"
                "\tldrh r0, [r4, 0x1A]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r4, 0x1A]\n"
                "\tldr r1, _080D85B8 @ =gUnknown_083D9D98\n"
                "\tmovs r2, 0x1A\n"
                "\tldrsh r0, [r4, r2]\n"
                "\tadds r0, r1\n"
                "\tldrb r1, [r0]\n"
                "\tstrh r1, [r4, 0x1E]\n"
                "\tldr r2, _080D85BC @ =REG_BLDALPHA\n"
                "\tmovs r0, 0x11\n"
                "\tsubs r0, r1\n"
                "\tlsls r0, 8\n"
                "\torrs r1, r0\n"
                "\tstrh r1, [r2]\n"
                "\tmovs r5, 0x1E\n"
                "\tldrsh r0, [r4, r5]\n"
                "\tcmp r0, 0x5\n"
                "\tbeq _080D85AC\n"
                "\tb _080D86D0\n"
                "_080D85AC:\n"
                "\tldrh r0, [r4, 0x20]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r4, 0x20]\n"
                "\tmovs r0, 0\n"
                "\tstrh r0, [r4, 0x1E]\n"
                "\tb _080D86D0\n"
                "\t.align 2, 0\n"
                "_080D85B8: .4byte gUnknown_083D9D98\n"
                "_080D85BC: .4byte REG_BLDALPHA\n"
                "_080D85C0:\n"
                "\tlsls r0, r6, 2\n"
                "\tadds r0, r6\n"
                "\tlsls r0, 3\n"
                "\tadds r1, r0, r4\n"
                "\tldrh r0, [r1, 0x1E]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r1, 0x1E]\n"
                "\tlsls r0, 16\n"
                "\tasrs r0, 16\n"
                "\tcmp r0, 0x51\n"
                "\tbne _080D86D0\n"
                "\tmovs r0, 0x5\n"
                "\tstrh r0, [r1, 0x1E]\n"
                "\tldrh r0, [r1, 0x20]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r1, 0x20]\n"
                "\tb _080D86D0\n"
                "_080D85E2:\n"
                "\tlsls r0, r6, 2\n"
                "\tadds r0, r6\n"
                "\tlsls r0, 3\n"
                "\tadds r4, r0, r4\n"
                "\tldrh r0, [r4, 0x1C]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r4, 0x1C]\n"
                "\tlsls r0, 16\n"
                "\tasrs r0, 16\n"
                "\tcmp r0, 0x4\n"
                "\tbne _080D86D0\n"
                "\tmovs r0, 0\n"
                "\tstrh r0, [r4, 0x1C]\n"
                "\tldrh r1, [r4, 0x1E]\n"
                "\tsubs r1, 0x1\n"
                "\tstrh r1, [r4, 0x1E]\n"
                "\tldr r2, _080D8620 @ =REG_BLDALPHA\n"
                "\tmovs r0, 0x10\n"
                "\tsubs r0, r1\n"
                "\tlsls r0, 8\n"
                "\torrs r1, r0\n"
                "\tstrh r1, [r2]\n"
                "\tmovs r0, 0x1E\n"
                "\tldrsh r1, [r4, r0]\n"
                "\tcmp r1, 0\n"
                "\tbne _080D86D0\n"
                "\tldrh r0, [r4, 0x20]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r4, 0x20]\n"
                "\tstrh r1, [r4, 0x1E]\n"
                "\tb _080D86D0\n"
                "\t.align 2, 0\n"
                "_080D8620: .4byte REG_BLDALPHA\n"
                "_080D8624:\n"
                "\tmov r0, sp\n"
                "\tbl sub_8078914\n"
                "\tldr r2, [sp]\n"
                "\tmovs r3, 0x80\n"
                "\tlsls r3, 6\n"
                "\tlsls r1, r6, 2\n"
                "\tmov r10, r1\n"
                "\tadd r5, sp, 0xC\n"
                "\tmovs r7, 0\n"
                "\tldr r1, _080D86E0 @ =0x040000d4\n"
                "\tmovs r4, 0x80\n"
                "\tlsls r4, 5\n"
                "\tmov r8, r5\n"
                "\tldr r0, _080D86E4 @ =0x85000400\n"
                "\tmov r12, r0\n"
                "\tmovs r0, 0x85\n"
                "\tlsls r0, 24\n"
                "\tmov r9, r0\n"
                "_080D864A:\n"
                "\tstr r7, [sp, 0xC]\n"
                "\tmov r0, r8\n"
                "\tstr r0, [r1]\n"
                "\tstr r2, [r1, 0x4]\n"
                "\tmov r0, r12\n"
                "\tstr r0, [r1, 0x8]\n"
                "\tldr r0, [r1, 0x8]\n"
                "\tadds r2, r4\n"
                "\tsubs r3, r4\n"
                "\tcmp r3, r4\n"
                "\tbhi _080D864A\n"
                "\tstr r7, [sp, 0xC]\n"
                "\tstr r5, [r1]\n"
                "\tstr r2, [r1, 0x4]\n"
                "\tlsrs r0, r3, 2\n"
                "\tmov r2, r9\n"
                "\torrs r0, r2\n"
                "\tstr r0, [r1, 0x8]\n"
                "\tldr r0, [r1, 0x8]\n"
                "\tldr r1, [sp, 0x4]\n"
                "\tmovs r0, 0\n"
                "\tstr r0, [sp, 0xC]\n"
                "\tldr r0, _080D86E0 @ =0x040000d4\n"
                "\tstr r5, [r0]\n"
                "\tstr r1, [r0, 0x4]\n"
                "\tldr r1, _080D86E8 @ =0x85000200\n"
                "\tstr r1, [r0, 0x8]\n"
                "\tldr r0, [r0, 0x8]\n"
                "\tbl IsContest\n"
                "\tlsls r0, 24\n"
                "\tcmp r0, 0\n"
                "\tbne _080D8698\n"
                "\tldr r2, _080D86EC @ =REG_BG1CNT\n"
                "\tldrb r1, [r2]\n"
                "\tmovs r0, 0xD\n"
                "\tnegs r0, r0\n"
                "\tands r0, r1\n"
                "\tstrb r0, [r2]\n"
                "_080D8698:\n"
                "\tldr r0, _080D86F0 @ =gTasks\n"
                "\tmov r5, r10\n"
                "\tadds r1, r5, r6\n"
                "\tlsls r1, 3\n"
                "\tadds r1, r0\n"
                "\tldrh r0, [r1, 0x20]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r1, 0x20]\n"
                "\tldr r3, _080D86F4 @ =gBattle_BG1_X\n"
                "\tldr r2, _080D86F8 @ =gBattle_BG1_Y\n"
                "_080D86AC:\n"
                "\tmovs r1, 0\n"
                "\tstrh r1, [r3]\n"
                "\tstrh r1, [r2]\n"
                "\tldr r0, _080D86FC @ =REG_BLDCNT\n"
                "\tstrh r1, [r0]\n"
                "\tadds r0, 0x2\n"
                "\tstrh r1, [r0]\n"
                "\tldr r2, _080D86EC @ =REG_BG1CNT\n"
                "\tldrb r1, [r2]\n"
                "\tmovs r0, 0x4\n"
                "\tnegs r0, r0\n"
                "\tands r0, r1\n"
                "\tmovs r1, 0x1\n"
                "\torrs r0, r1\n"
                "\tstrb r0, [r2]\n"
                "\tadds r0, r6, 0\n"
                "\tbl DestroyAnimVisualTask\n"
                "_080D86D0:\n"
                "\tadd sp, 0x10\n"
                "\tpop {r3-r5}\n"
                "\tmov r8, r3\n"
                "\tmov r9, r4\n"
                "\tmov r10, r5\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_080D86E0: .4byte 0x040000d4\n"
                "_080D86E4: .4byte 0x85000400\n"
                "_080D86E8: .4byte 0x85000200\n"
                "_080D86EC: .4byte REG_BG1CNT\n"
                "_080D86F0: .4byte gTasks\n"
                "_080D86F4: .4byte gBattle_BG1_X\n"
                "_080D86F8: .4byte gBattle_BG1_Y\n"
                "_080D86FC: .4byte REG_BLDCNT");
}

#ifdef NONMATCHING
// 
void sub_80D8700(struct Sprite *sprite)
{
    //
    u8 tempVar;
    u8 attackerCoord;
    u8 targetCoord;
    //u32 
    u8 battler; // battler

    sprite->data[0] = gBattleAnimArgs[0];

    attackerCoord = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    targetCoord = GetBattlerSpriteCoord(gAnimBankTarget, 2);

    // maybe these need to be temp vars
    //if ((u8)(GetBattlerSpriteCoord(gAnimBankAttacker, 2) << 24) >
    //    (u8)(GetBattlerSpriteCoord(gAnimBankTarget, 2) << 24))
    if ((u32)attackerCoord > (u32)targetCoord) // there were << 24 here
    {
        // is this a temp var? or...
        sprite->data[7] = 0x8000;
    }

    // B_SIDE_PLAYER?
    if ((gBanksBySide[gAnimBankTarget] & 1) == 0)
    {
        //
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];

        if ((sprite->data[7] & 0x8000) != 0
         && (gBanksBySide[gAnimBankAttacker] & 1) == 0)
        {
                // u8 spriteId = GetAnimBattlerSpriteId(1)
                sprite->subpriority = gSprites[gBankSpriteIds[GetAnimBattlerSpriteId(1)]].subpriority + 1;
        }
        sprite->data[6] = 1; 
    }
    //
    sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3);

    if (gBattleAnimArgs[7] != 0)
    {
        //
        sprite->data[1] = sprite->pos1.x + gBattleAnimArgs[1];
        sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2) + gBattleAnimArgs[3];
        sprite->data[3] = sprite->pos1.y + gBattleAnimArgs[2];
        battler = gAnimBankAttacker;
        tempVar = 3;
    } // r1 = 3 ; r0 = gAnimBankAttacker
    else
    {
        //
        sprite->data[1] = sprite->pos1.x + gBattleAnimArgs[1];
        sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 0) + gBattleAnimArgs[3];
        sprite->data[3] = sprite->pos1.y + gBattleAnimArgs[2];
        battler = gAnimBankTarget;
        tempVar = 1;
    } // r1 = 1 ; r0 = gAnimBankTarget
    sprite->data[4] = GetBattlerSpriteCoord(battler, tempVar) + gBattleAnimArgs[4];
    sprite->data[7] |= (u16)sub_8079ED4(battler);

    // + 
    if (IsContest() != 0)
    {
        sprite->data[6] = 1;
        sprite->subpriority = 0x80;
    }

    InitAnimLinearTranslation(sprite); // +
    sprite->callback = sub_80D8874; // +

}
#else
NAKED void sub_80D8700(struct Sprite *sprite)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r8\n"
                "\tpush {r7}\n"
                "\tadds r5, r0, 0\n"
                "\tldr r6, _080D87E8 @ =gBattleAnimArgs\n"
                "\tldrh r0, [r6]\n"
                "\tstrh r0, [r5, 0x2E]\n"
                "\tldr r0, _080D87EC @ =gAnimBankAttacker\n"
                "\tmov r8, r0\n"
                "\tldrb r0, [r0]\n"
                "\tmovs r1, 0x2\n"
                "\tbl GetBattlerSpriteCoord\n"
                "\tadds r4, r0, 0\n"
                "\tldr r7, _080D87F0 @ =gAnimBankTarget\n"
                "\tldrb r0, [r7]\n"
                "\tmovs r1, 0x2\n"
                "\tbl GetBattlerSpriteCoord\n"
                "\tlsls r4, 24\n"
                "\tlsls r0, 24\n"
                "\tcmp r4, r0\n"
                "\tbcs _080D8734\n"
                "\tmovs r0, 0x80\n"
                "\tlsls r0, 8\n"
                "\tstrh r0, [r5, 0x3C]\n"
                "_080D8734:\n"
                "\tldr r3, _080D87F4 @ =gBanksBySide\n"
                "\tldrb r0, [r7]\n"
                "\tadds r0, r3\n"
                "\tldrb r1, [r0]\n"
                "\tmovs r2, 0x1\n"
                "\tadds r0, r2, 0\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbne _080D8794\n"
                "\tldrh r0, [r6, 0x2]\n"
                "\tnegs r0, r0\n"
                "\tstrh r0, [r6, 0x2]\n"
                "\tldrh r0, [r6, 0x6]\n"
                "\tnegs r0, r0\n"
                "\tstrh r0, [r6, 0x6]\n"
                "\tmovs r1, 0x3C\n"
                "\tldrsh r0, [r5, r1]\n"
                "\tmovs r1, 0x80\n"
                "\tlsls r1, 8\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbeq _080D8790\n"
                "\tmov r1, r8\n"
                "\tldrb r0, [r1]\n"
                "\tadds r0, r3\n"
                "\tldrb r1, [r0]\n"
                "\tadds r0, r2, 0\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbne _080D8790\n"
                "\tmovs r0, 0x1\n"
                "\tbl GetAnimBattlerSpriteId\n"
                "\tldr r2, _080D87F8 @ =gSprites\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tlsls r1, r0, 4\n"
                "\tadds r1, r0\n"
                "\tlsls r1, 2\n"
                "\tadds r1, r2\n"
                "\tadds r1, 0x43\n"
                "\tldrb r0, [r1]\n"
                "\tadds r0, 0x1\n"
                "\tadds r1, r5, 0\n"
                "\tadds r1, 0x43\n"
                "\tstrb r0, [r1]\n"
                "_080D8790:\n"
                "\tmovs r0, 0x1\n"
                "\tstrh r0, [r5, 0x3A]\n"
                "_080D8794:\n"
                "\tldr r4, _080D87EC @ =gAnimBankAttacker\n"
                "\tldrb r0, [r4]\n"
                "\tmovs r1, 0x2\n"
                "\tbl GetBattlerSpriteCoord\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tstrh r0, [r5, 0x20]\n"
                "\tldrb r0, [r4]\n"
                "\tmovs r1, 0x3\n"
                "\tbl GetBattlerSpriteCoord\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tstrh r0, [r5, 0x22]\n"
                "\tldr r6, _080D87E8 @ =gBattleAnimArgs\n"
                "\tmovs r1, 0xE\n"
                "\tldrsh r0, [r6, r1]\n"
                "\tcmp r0, 0\n"
                "\tbeq _080D87FC\n"
                "\tldrh r0, [r6, 0x2]\n"
                "\tldrh r1, [r5, 0x20]\n"
                "\tadds r0, r1\n"
                "\tstrh r0, [r5, 0x30]\n"
                "\tldr r4, _080D87F0 @ =gAnimBankTarget\n"
                "\tldrb r0, [r4]\n"
                "\tmovs r1, 0x2\n"
                "\tbl GetBattlerSpriteCoord\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tldrh r1, [r6, 0x6]\n"
                "\tadds r0, r1\n"
                "\tstrh r0, [r5, 0x32]\n"
                "\tldrh r0, [r6, 0x4]\n"
                "\tldrh r1, [r5, 0x22]\n"
                "\tadds r0, r1\n"
                "\tstrh r0, [r5, 0x34]\n"
                "\tldrb r0, [r4]\n"
                "\tmovs r1, 0x3\n"
                "\tb _080D8824\n"
                "\t.align 2, 0\n"
                "_080D87E8: .4byte gBattleAnimArgs\n"
                "_080D87EC: .4byte gAnimBankAttacker\n"
                "_080D87F0: .4byte gAnimBankTarget\n"
                "_080D87F4: .4byte gBanksBySide\n"
                "_080D87F8: .4byte gSprites\n"
                "_080D87FC:\n"
                "\tldrh r0, [r6, 0x2]\n"
                "\tldrh r1, [r5, 0x20]\n"
                "\tadds r0, r1\n"
                "\tstrh r0, [r5, 0x30]\n"
                "\tldr r4, _080D886C @ =gAnimBankTarget\n"
                "\tldrb r0, [r4]\n"
                "\tmovs r1, 0\n"
                "\tbl GetBattlerSpriteCoord\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tldrh r1, [r6, 0x6]\n"
                "\tadds r0, r1\n"
                "\tstrh r0, [r5, 0x32]\n"
                "\tldrh r0, [r6, 0x4]\n"
                "\tldrh r1, [r5, 0x22]\n"
                "\tadds r0, r1\n"
                "\tstrh r0, [r5, 0x34]\n"
                "\tldrb r0, [r4]\n"
                "\tmovs r1, 0x1\n"
                "_080D8824:\n"
                "\tbl GetBattlerSpriteCoord\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tldrh r6, [r6, 0x8]\n"
                "\tadds r0, r6\n"
                "\tstrh r0, [r5, 0x36]\n"
                "\tldrb r0, [r4]\n"
                "\tbl sub_8079ED4\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 16\n"
                "\tldrh r1, [r5, 0x3C]\n"
                "\torrs r0, r1\n"
                "\tstrh r0, [r5, 0x3C]\n"
                "\tbl IsContest\n"
                "\tlsls r0, 24\n"
                "\tcmp r0, 0\n"
                "\tbeq _080D8858\n"
                "\tmovs r0, 0x1\n"
                "\tstrh r0, [r5, 0x3A]\n"
                "\tadds r1, r5, 0\n"
                "\tadds r1, 0x43\n"
                "\tmovs r0, 0x80\n"
                "\tstrb r0, [r1]\n"
                "_080D8858:\n"
                "\tadds r0, r5, 0\n"
                "\tbl InitAnimLinearTranslation\n"
                "\tldr r0, _080D8870 @ =sub_80D8874\n"
                "\tstr r0, [r5, 0x1C]\n"
                "\tpop {r3}\n"
                "\tmov r8, r3\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_080D886C: .4byte gAnimBankTarget\n"
                "_080D8870: .4byte sub_80D8874");
}
#endif // NONMATCHING

#ifdef NONMATCHING
// https://pastebin.com/8wvBFV2F
// 
void sub_80D8874(struct Sprite *sprite)
{
    s16 r0, r3;
    s8 r1;

    // is this a temp var?
    if ((sprite->data[7] & 0xFF) != 1) // cmp 1
    {
        //
        if ((sprite->data[7] & 0xFF) <= 1) // cmp 2
        {
            //
            if ((sprite->data[7] & 0xFF) != 0) // cmp 3
            {
                // _AD0
                return;
            }
            // _896 (else?)
            TranslateAnimLinear(sprite);
            sprite->pos2.x += ((sprite->data[5] * 2 + gSineTable[0]) >> 4);

            if (sprite->data[6] != 0) // cmp 5
            {
                // ...
                r0 = sprite->data[5] - 8;
            }
            else // ==
            {
                // _8C4
                r0 = sprite->data[5] + 8;
            }
            // _8C8  
            sprite->data[5] = r0 & 0xFF;

            if (sprite->data[0] >= 0) // cmp 6
            {
                // _AD0
                return;
            }
            // < _8D6 (else?)
            // is this a temp var?
            sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankTarget, 0);
            sprite->data[1] = GetBattlerSpriteCoord(gAnimBankTarget, 0);
            sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 0);

            // is sprite->pos2.y + sprite->pos1.y also a temp var???
            sprite->pos1.y += sprite->pos2.y;
            sprite->data[3] = sprite->pos2.y + sprite->pos1.y;
            sprite->data[4] = sprite->pos2.y + sprite->pos1.y + 0x1D;

            sprite->data[7] += 1;

            if ((gMain.inBattle & 2) != 0 
             || (gBanksBySide[gAnimBankTarget] & 1) != 0) // cmp 7 || cmp 8
            {
                // ...
                sprite->data[5] = 204;
            }
            else
            {
                // _938
                sprite->data[5] = 80;
            }
            // _93A
            sprite->pos2.y = 0;

            sprite->pos2.x = (sprite->data[5] * 2 + gSineTable[0]) >> 3;
            sprite->data[5] = (sprite->data[5] + 2) & 0xFF;

            InitAnimLinearTranslation(sprite);

            return;
        }
        else // > // /?????????? this little bit is at the end
        {
            // _88E // could this be an else if?
            if ((sprite->data[7] & 0xFF) == 2) // cmp 4
            {
                // _A94 
                if (TranslateAnimLinear(sprite) != 0) // cmp 15
                {
                    if ((sprite->oam.affineMode & 1) != 0) // cmp 16
                    {
                        //...
                        FreeOamMatrix(sprite->oam.matrixNum);
                        sprite->oam.affineMode = (sprite->oam.affineMode & -4);
                    }
                    // _AC2
                    DestroySprite(sprite); // &sprite?
                    gAnimVisualTaskCount--;

                    return;
                } // else?
                return;
            }
            else
            {
                // _894
                return;
            }
        }
    }
    else // ==
    {
        // _968
        TranslateAnimLinear(sprite);

        sprite->pos2.x += (sprite->data[5] * 2 + gSineTable[0]) >> 3; // ???
        sprite->pos2.y += (-3 * gSineTable[(sprite->data[5] + 64) << 1]) >> 8; // which one of these is closer?

        if ((gMain.inBattle & 2) != 0) // cmp 9
        {
            // 
            r3 = sprite->data[5];

            if ((u16)(sprite->data[5] - 64) <= 0x7F) // cmp 10
            {
                // ...
                r1 = sprite->data[7];
            }
            else
            {
                // _9D4
                r1 = sprite->data[7] + 1;
            }
            // _9DC
            sprite->oam.priority = (sprite->oam.priority & -13) | (r1 & 3) << 2;
            r0 = r3 + 4;
        }
        else // ==
        {
            // _9F2
            if ((u16)(sprite->data[5] - 64) <= 0x7F) // cmp 11
            {
                // ... &spite->subpriority ??? 
                r1 = sprite->subpriority;
                r0 = 128;
            }
            else // >
            {
                // _A06
                r1 = sprite->subpriority;
                r0 = 140;
            }
            // _A0C // *r1 ???
            sprite->subpriority = r0;
            r0 = sprite->data[5] - 4;
        }
        // _A12
        sprite->data[5] = r0 & 0xFF;
        sprite->data[0] = 768;

        sprite->pos1.x  = sprite->pos2.x + sprite->pos1.x;//+= sprite->pos2.x;
        sprite->data[1] = sprite->pos2.x + sprite->pos1.x;

        sprite->pos1.y = sprite->pos2.y + sprite->pos1.y;
        sprite->data[3] = sprite->pos2.y + sprite->pos1.y;

        sprite->data[4] = sprite->pos2.y + sprite->pos1.y + 4;

        if (sprite->data[0] <= 0) // cmp 12
        {
            //
            if ((gMain.inBattle & 2) != 0 
             || (gBanksBySide[gAnimBankTarget] & 1) != 0) // cmp 13 || cmp 14
            {
                // 
                r0 = 0x80 << 1;
            }
            else
            {
                // _A78
                r0 = 0xFFF0;
            }
            // _A7A
            sprite->data[2] = r0;
            sprite->data[7] += 1;

            sprite->pos2.y = 0;
            sprite->pos1.x = 0;

            sub_8078BD4(sprite);
        }
        // _AD0
        return;
    }

    // _AD0 / return
    return;
}
#else
NAKED void sub_80D8874(struct Sprite *sprite)
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
#endif

// MATCHING
void sub_80D8ADC(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    task->func = sub_80D8AF8;
}

#ifdef NONMATCHING
// 
void sub_80D8AF8(u8 taskId)
{
    //
    struct Task *task = &gTasks[taskId];

    //
    if (task->data[0] != 1) // cmp 1
    {
        //
        if (task->data[0] <= 1) //cmp 2
        {
            // 
            if (task->data[0] != 0) // cmp 3
            {
                //
                return;
            }
            else // ==
            {
                // _26
                task->data[4] += 1;

                if ((s16)task->data[4] > 2) // cmp 5
                {
                    // 
                    task->data[4] = 2;
                    task->data[5] = 2;
                    task->data[2] = 2;
                }
                else // >
                {
                    // ... 
                    return;
                }
            }
        }
        else // >
        {
            // _20
            if (task->data[0] != 2) // cmp 4
            {
                // 
                return;
            }
            // _92

            if (task->data[1] != 0) // cmp 10
            {
                //
                return;
            }
            // ...
            DestroyAnimVisualTask(taskId);

            return;
        }
    }
    else // ==
    {
        // _3C

        if (task->data[5] == 0) // cmp 6
        {
            // ...
            sub_80D8BA8(task->data[3]);

            if ((task->data[3]) != 0) // cmp 7 // << 24
            {
                // ...
                task->data[1] += 1;
            }
            // _5C
            task->data[2] += 1; 

            if ((s16)(task->data[2]) == 3) // cmp 8
            {
                // ...
                task->data[3] += 1;

                if ((s16)(task->data[3]) != 10) // cmp 9
                {
                    // _80 ...
                    task->data[0] -= 1;

                    return;
                }
            }
            else
            {
                // _88
                task->data[5] = 2;

                return;
            }
        }
        else
        {
            // _8C
            task->data[5] -= 1;

            return;
        }
    }

    // _78
    task->data[0] += 1;

    return;
}
#else
NAKED void sub_80D8AF8(u8 taskId)
{
    asm_unified("\tpush {r4,r5,lr}\n"
                "\tlsls r0, 24\n"
                "\tlsrs r2, r0, 24\n"
                "\tlsls r0, r2, 2\n"
                "\tadds r0, r2\n"
                "\tlsls r0, 3\n"
                "\tldr r1, _080D8B1C @ =gTasks\n"
                "\tadds r4, r0, r1\n"
                "\tmovs r0, 0x8\n"
                "\tldrsh r5, [r4, r0]\n"
                "\tcmp r5, 0x1\n"
                "\tbeq _080D8B3C\n"
                "\tcmp r5, 0x1\n"
                "\tbgt _080D8B20\n"
                "\tcmp r5, 0\n"
                "\tbeq _080D8B26\n"
                "\tb _080D8BA0\n"
                "\t.align 2, 0\n"
                "_080D8B1C: .4byte gTasks\n"
                "_080D8B20:\n"
                "\tcmp r5, 0x2\n"
                "\tbeq _080D8B92\n"
                "\tb _080D8BA0\n"
                "_080D8B26:\n"
                "\tldrh r0, [r4, 0x10]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r4, 0x10]\n"
                "\tlsls r0, 16\n"
                "\tasrs r0, 16\n"
                "\tcmp r0, 0x2\n"
                "\tble _080D8BA0\n"
                "\tstrh r5, [r4, 0x10]\n"
                "\tstrh r5, [r4, 0x12]\n"
                "\tstrh r5, [r4, 0xC]\n"
                "\tb _080D8B78\n"
                "_080D8B3C:\n"
                "\tldrh r1, [r4, 0x12]\n"
                "\tmovs r3, 0x12\n"
                "\tldrsh r0, [r4, r3]\n"
                "\tcmp r0, 0\n"
                "\tbne _080D8B8C\n"
                "\tldrb r0, [r4, 0xE]\n"
                "\tldrb r1, [r4, 0xC]\n"
                "\tmovs r3, 0x1\n"
                "\tbl sub_80D8BA8\n"
                "\tlsls r0, 24\n"
                "\tcmp r0, 0\n"
                "\tbeq _080D8B5C\n"
                "\tldrh r0, [r4, 0xA]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r4, 0xA]\n"
                "_080D8B5C:\n"
                "\tldrh r0, [r4, 0xC]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r4, 0xC]\n"
                "\tlsls r0, 16\n"
                "\tasrs r0, 16\n"
                "\tcmp r0, 0x3\n"
                "\tbne _080D8B88\n"
                "\tldrh r0, [r4, 0xE]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r4, 0xE]\n"
                "\tlsls r0, 16\n"
                "\tasrs r0, 16\n"
                "\tcmp r0, 0xA\n"
                "\tbne _080D8B80\n"
                "_080D8B78:\n"
                "\tldrh r0, [r4, 0x8]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r4, 0x8]\n"
                "\tb _080D8BA0\n"
                "_080D8B80:\n"
                "\tldrh r0, [r4, 0x8]\n"
                "\tsubs r0, 0x1\n"
                "\tstrh r0, [r4, 0x8]\n"
                "\tb _080D8BA0\n"
                "_080D8B88:\n"
                "\tstrh r5, [r4, 0x12]\n"
                "\tb _080D8BA0\n"
                "_080D8B8C:\n"
                "\tsubs r0, r1, 0x1\n"
                "\tstrh r0, [r4, 0x12]\n"
                "\tb _080D8BA0\n"
                "_080D8B92:\n"
                "\tmovs r1, 0xA\n"
                "\tldrsh r0, [r4, r1]\n"
                "\tcmp r0, 0\n"
                "\tbne _080D8BA0\n"
                "\tadds r0, r2, 0\n"
                "\tbl DestroyAnimVisualTask\n"
                "_080D8BA0:\n"
                "\tpop {r4,r5}\n"
                "\tpop {r0}\n"
                "\tbx r0");
}
#endif // NONMATCHING

// NOT MATCHING / NONMATCHING
NAKED void sub_80D8BA8(u8 taskId)
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
                "\tldr r0, _080D8D00 @ =gSpriteTemplate_83D9E3C\n"
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
                "_080D8D00: .4byte gSpriteTemplate_83D9E3C\n"
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

// MATCHING
void sub_80D8D1C(struct Sprite *sprite)
{
    u8 spriteId;

    sprite->pos1.x += 4;
    sprite->pos1.y += 8;

    if ((s16)sprite->pos1.x < sprite->data[3]
     && (s16)sprite->pos1.y < sprite->data[4])
        return;

    if (sprite->data[0] == 1 && sprite->data[5] == 0)
    {
        spriteId = CreateSprite(&gBattleAnimSpriteTemplate_83D9C78, 
                         sprite->data[3], sprite->data[4], sprite->subpriority);

        sprite->data[0] = spriteId;

        if (spriteId != 64)
        {
            gSprites[sprite->data[0]].callback = sub_80D8E00;

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

// MATCHING
void sub_80D8E00(struct Sprite *sprite)
{
    sprite->data[0]++;

    if (sprite->data[0] == 20)
    {
        gTasks[sprite->data[6]].data[sprite->data[7]]--;

        FreeOamMatrix(sprite->oam.matrixNum);
        DestroySprite(sprite);
    }
}

// used for icicle spear??
// MATCHING
void unc_080B06FC(struct Sprite *sprite)
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

    sprite->callback = sub_80D8EE0;
}

// MATCHING
void sub_80D8EE0(struct Sprite *sprite)
{
    if (!TranslateAnimArc(sprite))
        return;

    StartSpriteAnim(sprite, 1);

    sprite->callback = sub_8078600;

    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

// MATCHING (but consider renaming temp variables)
void sub_80D8F10(struct Sprite *sprite)
{
    s16 a, b; // x, y ?

    sprite->oam.tileNum += 8;

    sub_8078764(sprite, 1);

    a = (Random() & 0xFF) + 256;
    b = Random() & 0x1FF;

    if (b > 0xFF)
        b = 256 - b;

    sprite->data[1] = a;
    sprite->data[2] = b;

    sprite->callback = sub_80D8F74;
}

#ifdef NONMATCHING
// NONMATCHING
void sub_80D8F74(struct Sprite *sprite)
{
    //
    s16 r0;

    sprite->data[3] += sprite->data[1];
    sprite->data[4] += sprite->data[2];

    if ((sprite->data[1] & 1) != 0)
    {
        //
        r0 = -(sprite->data[1] + sprite->data[3]); // problem 1
    }
    else
    {
        r0 = (sprite->data[1] + sprite->data[3]); // problem 2
    }

    sprite->pos2.x = r0;
    sprite->pos2.y = sprite->data[4];

    sprite->data[0]++;

    if (sprite->data[0] == 0x15)
    {
        DestroyAnimSprite(sprite);
    }
}
#else
NAKED void sub_80D8F74(struct Sprite *sprite)
{
    asm_unified("\tpush {r4,lr}\n"
                "\tadds r2, r0, 0\n"
                "\tldrh r0, [r2, 0x30]\n"
                "\tldrh r1, [r2, 0x34]\n"
                "\tadds r3, r0, r1\n"
                "\tstrh r3, [r2, 0x34]\n"
                "\tldrh r1, [r2, 0x32]\n"
                "\tldrh r4, [r2, 0x36]\n"
                "\tadds r1, r4\n"
                "\tstrh r1, [r2, 0x36]\n"
                "\tmovs r1, 0x1\n"
                "\tands r1, r0\n"
                "\tcmp r1, 0\n"
                "\tbeq _080D8F98\n"
                "\tlsls r0, r3, 16\n"
                "\tasrs r0, 24\n"
                "\tnegs r0, r0\n"
                "\tb _080D8F9C\n"
                "_080D8F98:\n"
                "\tlsls r0, r3, 16\n"
                "\tasrs r0, 24\n"
                "_080D8F9C:\n"
                "\tstrh r0, [r2, 0x24]\n"
                "\tldrh r0, [r2, 0x36]\n"
                "\tlsls r0, 16\n"
                "\tasrs r0, 24\n"
                "\tstrh r0, [r2, 0x26]\n"
                "\tldrh r0, [r2, 0x2E]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r2, 0x2E]\n"
                "\tlsls r0, 16\n"
                "\tasrs r0, 16\n"
                "\tcmp r0, 0x15\n"
                "\tbne _080D8FBA\n"
                "\tadds r0, r2, 0\n"
                "\tbl DestroyAnimSprite\n"
                "_080D8FBA:\n"
                "\tpop {r4}\n"
                "\tpop {r0}\n"
                "\tbx r0");
}
#endif // NONMATCHING

#ifdef NONMATCHING
// should be counter for icicle spear?
// 
void sub_80D8FC0(u8 taskId)//struct Sprite *sprte)
{
    // 
    ///u8 r3 = gAnimDisableStructPtr->rolloutTimer2 - gAnimDisableStructPtr->rolloutTimer1 - 1;
    gBattleAnimArgs[3] = gAnimDisableStructPtr->rolloutTimer2 - gAnimDisableStructPtr->rolloutTimer1 - 1;//r3;
    ///gBattleAnimArgs[3] = gAnimDisableStructPtr->rolloutTimer2 - gAnimDisableStructPtr->rolloutTimer1 - 1;
    //s16 r0[] = *gBattleAnimArgs;
    //r0 = r0 << 1;
    //r0 = r0 + *gBattleAnimArgs;
    //&r0 = gAnimDisableStructPtr->rolloutTimer2 - gAnimDisableStructPtr->rolloutTimer1 - 1;

    DestroyAnimVisualTask(taskId);
}
#else
NAKED void sub_80D8FC0(u8 taskId)
{
    asm_unified("\tpush {lr}\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tldr r1, _080D8FE8 @ =gBattleAnimArgs\n"
                "\tldrb r3, [r1]\n"
                "\tlsls r3, 1\n"
                "\tadds r3, r1\n"
                "\tldr r1, _080D8FEC @ =gAnimDisableStructPtr\n"
                "\tldr r1, [r1]\n"
                "\tldrb r1, [r1, 0x11]\n"
                "\tlsrs r2, r1, 4\n"
                "\tlsls r1, 28\n"
                "\tlsrs r1, 28\n"
                "\tsubs r2, r1\n"
                "\tsubs r2, 0x1\n"
                "\tstrh r2, [r3]\n"
                "\tbl DestroyAnimVisualTask\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_080D8FE8: .4byte gBattleAnimArgs\n"
                "_080D8FEC: .4byte gAnimDisableStructPtr");
}
#endif // NONMATCHING

// 20 MATCHING
// 11 NONMATCHING / NAKED smh