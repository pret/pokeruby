#include "global.h"
#include "trig.h"
#include "rom_8077ABC.h"
#include "battle_anim.h"
#include "constants/battle_constants.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

//extern u16 temp_1;
//extern u16 temp_2;

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
    sprite->data[1] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
    sprite->data[3] = GetBattlerSpriteCoord(gAnimBankTarget, 3);
    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankAttacker, 3);

    u8 r6;
    u32 r1 = _080D781C;
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

#ifdef NONMATCHING
// this is very wrong but my brain cannot right now so pce
// CLOSE
void sub_80D7A64(struct Sprite *sprite)
{
    s16 i = 0;

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
    {
        SetAverageBattlerPositions(gAnimBankTarget, 1, &sprite->data[2], &sprite->data[3]);
    }

    if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
    {
        sprite->data[2] -= gBattleAnimArgs[2];
    }

    else
    {
        sprite->data[2] += gBattleAnimArgs[2];
    }

    // !!!!! YOU ARE HERE
    //s16 i = 0;

    for (i = 7; i >= 0; i--)
    {
        // do i an need offset? this will break maybe
        sprite->data[i] = sprite->data[i-1];
    }

    //
    sub_8078D60(sprite);

    sprite->data[1] ^= 1;
    sprite->data[2] ^= 1;

    sprite->data[0] = 1;

    while (0) //(sub_8078CE8(sprite)) // is this an if / else if ? <-- NO!
    {
        if (sprite->pos1.x + sprite->pos2.x + 1 > 272)
        {
            // break while?
            break;
        }
        if (sprite->pos1.y + sprite->pos2.y > 160)
        {
            break;
        }
        if (sprite->pos1.y + sprite->pos2.y >= -16)
        {
            break;
        }
    }

    //
    sprite->pos1.x += sprite->pos2.x;
    sprite->pos1.y += sprite->pos2.y;

    sprite->pos2.y = 0;
    sprite->pos2.x = 0;

    for (i = 7; i >= 0; i--)
    {
        // there is no way this is right
        sprite->data[i] = sprite->data[i + 1];
    }

    // this should be correct at least
    sprite->callback = sub_8078D8C;
    StoreSpriteCallbackInData(sprite, sub_80D7BA0);
}
#else
NAKED void sub_80D7A64(struct Sprite *sprite)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tsub sp, 0x10\n"
                "\tadds r5, r0, 0\n"
                "\tmovs r1, 0x1\n"
                "\tbl InitAnimSpritePos\n"
                "\tldr r6, _080D7AAC @ =gBattleAnimArgs\n"
                "\tldrh r0, [r6, 0x8]\n"
                "\tstrh r0, [r5, 0x2E]\n"
                "\tldrh r0, [r5, 0x20]\n"
                "\tstrh r0, [r5, 0x30]\n"
                "\tldrh r0, [r5, 0x22]\n"
                "\tstrh r0, [r5, 0x34]\n"
                "\tmovs r1, 0xA\n"
                "\tldrsh r0, [r6, r1]\n"
                "\tcmp r0, 0\n"
                "\tbne _080D7AB4\n"
                "\tldr r4, _080D7AB0 @ =gAnimBankTarget\n"
                "\tldrb r0, [r4]\n"
                "\tmovs r1, 0x2\n"
                "\tbl GetBattlerSpriteCoord\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tstrh r0, [r5, 0x32]\n"
                "\tldrb r0, [r4]\n"
                "\tmovs r1, 0x3\n"
                "\tbl GetBattlerSpriteCoord\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tldrh r6, [r6, 0x6]\n"
                "\tadds r0, r6\n"
                "\tstrh r0, [r5, 0x36]\n"
                "\tb _080D7AC6\n"
                "\t.align 2, 0\n"
                "_080D7AAC: .4byte gBattleAnimArgs\n"
                "_080D7AB0: .4byte gAnimBankTarget\n"
                "_080D7AB4:\n"
                "\tldr r0, _080D7AE0 @ =gAnimBankTarget\n"
                "\tldrb r0, [r0]\n"
                "\tadds r2, r5, 0\n"
                "\tadds r2, 0x32\n"
                "\tadds r3, r5, 0\n"
                "\tadds r3, 0x36\n"
                "\tmovs r1, 0x1\n"
                "\tbl SetAverageBattlerPositions\n"
                "_080D7AC6:\n"
                "\tldr r0, _080D7AE4 @ =gAnimBankAttacker\n"
                "\tldrb r0, [r0]\n"
                "\tbl GetBattlerSide\n"
                "\tlsls r0, 24\n"
                "\tcmp r0, 0\n"
                "\tbeq _080D7AEC\n"
                "\tldr r0, _080D7AE8 @ =gBattleAnimArgs\n"
                "\tldrh r1, [r5, 0x32]\n"
                "\tldrh r0, [r0, 0x4]\n"
                "\tsubs r1, r0\n"
                "\tstrh r1, [r5, 0x32]\n"
                "\tb _080D7AF6\n"
                "\t.align 2, 0\n"
                "_080D7AE0: .4byte gAnimBankTarget\n"
                "_080D7AE4: .4byte gAnimBankAttacker\n"
                "_080D7AE8: .4byte gBattleAnimArgs\n"
                "_080D7AEC:\n"
                "\tldr r0, _080D7B94 @ =gBattleAnimArgs\n"
                "\tldrh r0, [r0, 0x4]\n"
                "\tldrh r2, [r5, 0x32]\n"
                "\tadds r0, r2\n"
                "\tstrh r0, [r5, 0x32]\n"
                "_080D7AF6:\n"
                "\tadds r7, r5, 0\n"
                "\tadds r7, 0x2E\n"
                "\tadds r2, r7, 0\n"
                "\tmov r1, sp\n"
                "\tmovs r4, 0x7\n"
                "_080D7B00:\n"
                "\tldrh r0, [r2]\n"
                "\tstrh r0, [r1]\n"
                "\tadds r2, 0x2\n"
                "\tadds r1, 0x2\n"
                "\tsubs r4, 0x1\n"
                "\tcmp r4, 0\n"
                "\tbge _080D7B00\n"
                "\tadds r0, r5, 0\n"
                "\tbl sub_8078D60\n"
                "\tldrh r0, [r5, 0x30]\n"
                "\tmovs r1, 0x1\n"
                "\teors r0, r1\n"
                "\tstrh r0, [r5, 0x30]\n"
                "\tldrh r0, [r5, 0x32]\n"
                "\teors r0, r1\n"
                "\tstrh r0, [r5, 0x32]\n"
                "_080D7B22:\n"
                "\tmovs r0, 0x1\n"
                "\tstrh r0, [r5, 0x2E]\n"
                "\tadds r0, r5, 0\n"
                "\tbl sub_8078CE8\n"
                "\tmovs r0, 0x20\n"
                "\tldrsh r1, [r5, r0]\n"
                "\tmovs r2, 0x24\n"
                "\tldrsh r0, [r5, r2]\n"
                "\tadds r1, r0\n"
                "\tadds r1, 0x10\n"
                "\tmovs r0, 0x88\n"
                "\tlsls r0, 1\n"
                "\tcmp r1, r0\n"
                "\tbhi _080D7B56\n"
                "\tmovs r0, 0x22\n"
                "\tldrsh r1, [r5, r0]\n"
                "\tmovs r2, 0x26\n"
                "\tldrsh r0, [r5, r2]\n"
                "\tadds r1, r0\n"
                "\tcmp r1, 0xA0\n"
                "\tbgt _080D7B56\n"
                "\tmovs r0, 0x10\n"
                "\tnegs r0, r0\n"
                "\tcmp r1, r0\n"
                "\tbge _080D7B22\n"
                "_080D7B56:\n"
                "\tldrh r0, [r5, 0x24]\n"
                "\tldrh r1, [r5, 0x20]\n"
                "\tadds r0, r1\n"
                "\tmovs r1, 0\n"
                "\tstrh r0, [r5, 0x20]\n"
                "\tldrh r0, [r5, 0x26]\n"
                "\tldrh r2, [r5, 0x22]\n"
                "\tadds r0, r2\n"
                "\tstrh r0, [r5, 0x22]\n"
                "\tstrh r1, [r5, 0x26]\n"
                "\tstrh r1, [r5, 0x24]\n"
                "\tldr r6, _080D7B98 @ =sub_8078D8C\n"
                "\tldr r1, _080D7B9C @ =sub_80D7BA0\n"
                "\tmov r3, sp\n"
                "\tadds r2, r7, 0\n"
                "\tmovs r4, 0x7\n"
                "_080D7B76:\n"
                "\tldrh r0, [r3]\n"
                "\tstrh r0, [r2]\n"
                "\tadds r3, 0x2\n"
                "\tadds r2, 0x2\n"
                "\tsubs r4, 0x1\n"
                "\tcmp r4, 0\n"
                "\tbge _080D7B76\n"
                "\tstr r6, [r5, 0x1C]\n"
                "\tadds r0, r5, 0\n"
                "\tbl StoreSpriteCallbackInData\n"
                "\tadd sp, 0x10\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_080D7B94: .4byte gBattleAnimArgs\n"
                "_080D7B98: .4byte sub_8078D8C\n"
                "_080D7B9C: .4byte sub_80D7BA0");
}
#endif // NONMATCHING

// MATCHING
void sub_80D7BA0(struct Sprite *sprite)
{
    s16 tempVar;

    sprite->pos1.x += sprite->pos2.x;
    sprite->pos1.y += sprite->pos2.y;

    sprite->pos2.y = 0;
    sprite->pos2.x = 0;

    sprite->data[0] = 128;

    tempVar = GetBattlerSide(gAnimBankAttacker) << 24 != 0 ? 20 : 65516;

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
    tempVar = GetBattlerSide(gAnimBankAttacker) << 24 != 0 ? 20 : 65516;

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

    if (GetBattlerSide(gAnimBankAttacker) << 24 != B_SIDE_PLAYER)
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

            if (GetBattlerSide(gAnimBankAttacker) << 24 != B_SIDE_PLAYER)
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


























