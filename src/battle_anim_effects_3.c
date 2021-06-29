#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "blend_palette.h"
#include "contest.h"
#include "data2.h"
#include "decompress.h"
#include "ewram.h"
#include "palette.h"
#include "random.h"
#include "rom_8077ABC.h"
#include "scanline_effect.h"
#include "sound.h"
#include "trig.h"
#include "constants/songs.h"
#include "constants/species.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimAttacker;
extern u8 gBattleAnimTarget;
extern u8 gAnimVisualTaskCount;
extern u8 gAnimFriendship;
extern s32 gAnimMoveDmg;
extern u16 gBattle_WIN0H;
extern u16 gBattle_WIN0V;
extern u16 gBattle_WIN1H;
extern u16 gBattle_WIN1V;
extern u16 gBattle_BG1_X;
extern u16 gBattle_BG1_Y;
extern u16 gBattle_BG2_X;
extern u16 gBattle_BG2_Y;
extern u16 gWeatherMoveAnim;

extern const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7220;
extern const union AffineAnimCmd *const gAffineAnims_BattleSpriteContest[];
extern const union AffineAnimCmd *const gAffineAnims_BattleSpriteOpponentSide[];
extern const u32 gUnknown_08D2AA98[];
extern const u32 gUnknown_08D2A9E0[];
extern const u16 gUnknown_08D2AA80[];
extern const u8 gUnknown_08D2E014[];
extern const u8 gUnknown_08D2E170[];
extern const u16 gUnknown_08D2E150[];
extern u8 gBattleMonForms[];
extern u8 gBattlerSpriteIds[];
extern u16 gBattlerPartyIndexes[];

extern u8 sub_8046234(s16 x, s16 y, u8 a3);
extern void sub_80DA48C(struct Sprite *);
extern void sub_80E3C4C(u8 taskId, int unused, u16 arg2, u8 battler1, u8 arg4, u8 arg5, u8 arg6, u8 arg7, const u8 *arg8, const u8 *arg9, const u16 *palette);

static void sub_812C184(struct Sprite *sprite);
static void sub_812C268(struct Sprite *sprite);
static void sub_812C2A4(struct Sprite *sprite);
static void sub_812C380(struct Sprite *sprite);
static void sub_812C40C(struct Sprite *sprite);
static void sub_812C450(struct Sprite *sprite);
static void sub_812C4FC(struct Sprite *sprite);
static void sub_812C588(u8 taskId);
static void sub_812C64C(u8 taskId);
static void sub_812C798(struct Sprite *sprite);
static void sub_812C7C8(struct Sprite *sprite);
static void sub_812CA04(struct Sprite *sprite);
static void sub_812CAD0(struct Sprite *sprite);
static void sub_812CBB4(struct Sprite *sprite);
static void sub_812CD64(struct Sprite *sprite);
static void sub_812CEF0(u8 taskId);
static void sub_812D06C(u8 taskId);
static void sub_812D254(struct Sprite *sprite);
static void sub_812D4EC(struct Sprite *sprite);
static void sub_812D5E8(struct Sprite *sprite);
static void sub_812DFEC(struct Sprite *sprite);
static void sub_812E09C(struct Sprite *sprite);
static void sub_812E0F8(struct Sprite *sprite);
static void sub_812E638(u8 taskId);
static void sub_812E7F0(struct Sprite *sprite);
static void sub_812E8B4(u8 taskId);
static void sub_812ED24(struct Sprite *sprite);
static void sub_812EE00(struct Sprite *sprite);
static void sub_812EEEC(struct Sprite *sprite);
static void AnimTask_RolePlaySilhouetteStep1(u8 taskId);
static void sub_812F290(u8 taskId);
static void sub_812F474(u8 taskId);
static void sub_812F76C(u8 taskId);
static void sub_812F8DC(struct Sprite *sprite);
static void sub_812FE20(u8 taskId);
static void sub_812FEB8(u8, bool8);
static void sub_813003C(u8 taskId);
static void sub_81301B4(struct Sprite *sprite);
static void sub_81302E4(u8 taskId);
static void sub_8130424(s16, s16, s16, s16, u8, u8, s16*, s16*);
static void sub_81306A4(u8 taskId);
static void sub_813085C(struct Sprite *sprite);
static void sub_8130970(u8 taskId);
static void sub_8130A94(struct Sprite *sprite);
static void sub_8130B38(struct Sprite *sprite);
static void sub_8130DBC(u8 taskId);
static void sub_8130FE0(struct Sprite *sprite);
static void sub_8131408(u8 taskId);
static void sub_81315C8(struct Sprite *sprite);
static void sub_8131810(u8 taskId);
static void sub_8131838(struct Sprite *sprite);
static void sub_812C144(struct Sprite *sprite);
static void sub_812C220(struct Sprite *sprite);
static void sub_812C2BC(struct Sprite *sprite);
static void sub_812C358(struct Sprite *sprite);
static void sub_812C720(struct Sprite *sprite);
static void sub_812C80C(struct Sprite *sprite);
static void sub_812C848(struct Sprite *sprite);
static void sub_812C908(struct Sprite *sprite);
static void sub_812C990(struct Sprite *sprite);
static void sub_812CAFC(struct Sprite *sprite);
static void sub_812CC28(struct Sprite *sprite);
static void sub_812CCE8(struct Sprite *sprite);
static void sub_812D294(struct Sprite *sprite);
static void sub_812D3AC(struct Sprite *sprite);
static void sub_812D4B4(struct Sprite *sprite);
static void sub_812D588(struct Sprite *sprite);
static void sub_812DEAC(struct Sprite *sprite);
static void sub_812D724(struct Sprite *sprite);
static void sub_812E4F0(struct Sprite *sprite);
static void sub_812E7A0(struct Sprite *sprite);
static void sub_812EA4C(struct Sprite *sprite);
static void sub_812EC78(struct Sprite *sprite);
static void sub_812ED84(struct Sprite *sprite);
static void sub_812EEA4(struct Sprite *sprite);
static void sub_812F88C(struct Sprite *sprite);
static void sub_812F948(struct Sprite *sprite);
static void sub_812FF94(struct Sprite *sprite);
static void sub_81300F4(struct Sprite *sprite);
static void sub_81304DC(struct Sprite *sprite);
static void sub_813051C(struct Sprite *sprite);
static void sub_81307B0(struct Sprite *sprite);
static void sub_8130A2C(struct Sprite *sprite);
static void sub_8130AEC(struct Sprite *sprite);
static void sub_8130F5C(struct Sprite *sprite);
static void sub_8131264(struct Sprite *sprite);
extern void sub_80D1FDC(struct Sprite *sprite);// kiss_fountain.c
static void sub_8131564(struct Sprite *sprite);
static void AnimTask_TeeterDanceMovementStep(u8);

/*static*/ void sub_8131EB8(struct Sprite *sprite);// rest not yet decompiled
void AnimKnockOffStrike(struct Sprite *sprite);
void AnimRecycle(struct Sprite *sprite);
static void AnimRecycleStep(struct Sprite *sprite);
static void AnimTask_SlackOffSquishStep(u8 taskId);

const union AnimCmd gSpriteAnim_8402164[] =
{
    ANIMCMD_FRAME(0 , 4),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_FRAME(48, 4),
    ANIMCMD_FRAME(64, 4),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_840217C[] =
{
    gSpriteAnim_8402164,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_8402180 =
{
    .tileTag = ANIM_TAG_SCRATCH,
    .paletteTag = ANIM_TAG_SCRATCH,
    .oam = &gOamData_837E054,
    .anims = gSpriteAnimTable_840217C,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80793C4,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_8402198 =
{
    .tileTag = ANIM_TAG_BLACK_SMOKE,
    .paletteTag = ANIM_TAG_BLACK_SMOKE,
    .oam = &gOamData_837DF54,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_812C144,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_84021B0 =
{
    .tileTag = ANIM_TAG_BLACK_BALL,
    .paletteTag = ANIM_TAG_BLACK_BALL,
    .oam = &gOamData_837DF24,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80794A8,
};

const union AnimCmd gSpriteAnim_84021C8[] =
{
    ANIMCMD_FRAME(0, 40),
    ANIMCMD_FRAME(16, 8),
    ANIMCMD_FRAME(32, 40),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_84021D8[] =
{
    gSpriteAnim_84021C8,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_84021DC =
{
    .tileTag = ANIM_TAG_OPENING_EYE,
    .paletteTag = ANIM_TAG_OPENING_EYE,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_84021D8,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80793C4,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_84021F4 =
{
    .tileTag = ANIM_TAG_ROUND_WHITE_HALO,
    .paletteTag = ANIM_TAG_ROUND_WHITE_HALO,
    .oam = &gOamData_837E05C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_812C220,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_840220C =
{
    .tileTag = ANIM_TAG_TEAL_ALERT,
    .paletteTag = ANIM_TAG_TEAL_ALERT,
    .oam = &gOamData_837DF94,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_812C2BC,
};

const union AffineAnimCmd gSpriteAffineAnim_8402224[] =
{
    AFFINEANIMCMD_FRAME(0x180, 0x180, 0, 0),
    AFFINEANIMCMD_FRAME(0xFFE0, 0x18, 0, 5),
    AFFINEANIMCMD_FRAME(0x18, 0xFFE0, 0, 5),
    AFFINEANIMCMD_JUMP(1),
};

const union AffineAnimCmd gSpriteAffineAnim_8402244[] =
{
    AFFINEANIMCMD_FRAME(0x30, 0x30, 0, 0),
    AFFINEANIMCMD_FRAME(0x20, 0x20, 0, 6),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_840225C[] =
{
    gSpriteAffineAnim_8402224,
    gSpriteAffineAnim_8402244,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_8402264 =
{
    .tileTag = ANIM_TAG_EYE,
    .paletteTag = ANIM_TAG_EYE,
    .oam = &gOamData_837E11C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_840225C,
    .callback = sub_812C358,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_840227C =
{
    .tileTag = ANIM_TAG_SPIKES,
    .paletteTag = ANIM_TAG_SPIKES,
    .oam = &gOamData_837DF2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_812C720,
};

const union AnimCmd gSpriteAnim_8402294[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(16, 3),
    ANIMCMD_FRAME(32, 3),
    ANIMCMD_FRAME(48, 3),
    ANIMCMD_FRAME(64, 3),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_84022AC[] =
{
    gSpriteAnim_8402294,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_84022B0 =
{
    .tileTag = ANIM_TAG_LEER,
    .paletteTag = ANIM_TAG_LEER,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_84022AC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_812C80C,
};

const union AnimCmd gSpriteAnim_84022C8[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_84022D0[] =
{
    gSpriteAnim_84022C8,
};

const union AffineAnimCmd gSpriteAffineAnim_84022D4[] =
{
    AFFINEANIMCMD_FRAME(0xFFF9, 0xFFF9, -3, 16),
    AFFINEANIMCMD_FRAME(0x7, 0x7, 3, 16),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_84022EC[] =
{
    gSpriteAffineAnim_84022D4,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_84022F0 =
{
    .tileTag = ANIM_TAG_LETTER_Z,
    .paletteTag = ANIM_TAG_LETTER_Z,
    .oam = &gOamData_837DF94,
    .anims = gSpriteAnimTable_84022D0,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_84022EC,
    .callback = sub_812C848,
};

const union AnimCmd gSpriteAnim_8402308[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(16, 16),
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_FRAME(48, 4),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_840231C[] =
{
    gSpriteAnim_8402308,
};

const union AffineAnimCmd gSpriteAffineAnim_8402320[] =
{
    AFFINEANIMCMD_FRAME(0x200, 0x200, 0, 0),
    AFFINEANIMCMD_FRAME(0xFFE0, 0xFFE0, 0, 8),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_8402338[] =
{
    gSpriteAffineAnim_8402320,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_840233C =
{
    .tileTag = ANIM_TAG_FANG_ATTACK,
    .paletteTag = ANIM_TAG_FANG_ATTACK,
    .oam = &gOamData_837DFF4,
    .anims = gSpriteAnimTable_840231C,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_8402338,
    .callback = sub_812C908,
};

const union AffineAnimCmd gSpriteAffineAnim_8402354[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x180, 0, 0),
    AFFINEANIMCMD_FRAME(0x10, 0x0, 0, 20),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_840236C[] =
{
    AFFINEANIMCMD_FRAME(0x140, 0x180, 0, 0),
    AFFINEANIMCMD_FRAME(0xFFF0, 0x0, 0, 19),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_8402384[] =
{
    gSpriteAffineAnim_8402354,
    gSpriteAffineAnim_840236C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_840238C =
{
    .tileTag = ANIM_TAG_SPOTLIGHT,
    .paletteTag = ANIM_TAG_SPOTLIGHT,
    .oam = &gOamData_837DFFC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_8402384,
    .callback = sub_812C990,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_84023A4 =
{
    .tileTag = ANIM_TAG_TAG_HAND,
    .paletteTag = ANIM_TAG_TAG_HAND,
    .oam = &gOamData_837DF34,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_812CAFC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_84023BC =
{
    .tileTag = ANIM_TAG_TAG_HAND,
    .paletteTag = ANIM_TAG_TAG_HAND,
    .oam = &gOamData_837DF34,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_812CC28,
};

const union AnimCmd gSpriteAnim_84023D4[] =
{
    ANIMCMD_FRAME(0, 2),
    ANIMCMD_FRAME(8, 2),
    ANIMCMD_FRAME(16, 2),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_84023E4[] =
{
    gSpriteAnim_84023D4,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_84023E8 =
{
    .tileTag = ANIM_TAG_RAPID_SPIN,
    .paletteTag = ANIM_TAG_RAPID_SPIN,
    .oam = &gOamData_837DF54,
    .anims = gSpriteAnimTable_84023E4,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_812CCE8,
};

const union AffineAnimCmd gUnknown_08402400[] =
{
    AFFINEANIMCMD_FRAME(-12, 8, 0, 4),
    AFFINEANIMCMD_FRAME(20, -20, 0, 4),
    AFFINEANIMCMD_FRAME(-8, 12, 0, 4),
    AFFINEANIMCMD_END,
};

const union AnimCmd gSpriteAnim_8402420[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_8402428[] =
{
    gSpriteAnim_8402420,
};

const union AffineAnimCmd gSpriteAffineAnim_840242C[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 5, 40),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 10, 10),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 15, 10),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 20, 40),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_8402454[] =
{
    gSpriteAffineAnim_840242C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_8402458 =
{
    .tileTag = ANIM_TAG_TRI_FORCE_TRIANGLE,
    .paletteTag = ANIM_TAG_TRI_FORCE_TRIANGLE,
    .oam = &gOamData_837DFFC,
    .anims = gSpriteAnimTable_8402428,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_8402454,
    .callback = sub_812D294,
};

const union AnimCmd gSpriteAnim_8402470[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(16, 3),
    ANIMCMD_FRAME(32, 3),
    ANIMCMD_FRAME(48, 3),
    ANIMCMD_FRAME(32, 3, .hFlip = TRUE),
    ANIMCMD_FRAME(16, 3, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 3, .hFlip = TRUE),
    ANIMCMD_LOOP(1),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_8402494[] =
{
    gSpriteAnim_8402470,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_8402498 =
{
    .tileTag = ANIM_TAG_ECLIPSING_ORB,
    .paletteTag = ANIM_TAG_ECLIPSING_ORB,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_8402494,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80793C4,
};

const union AffineAnimCmd gUnknown_084024B0[] =
{
    AFFINEANIMCMD_FRAME(-12, 20, 0, 8),
    AFFINEANIMCMD_FRAME(12, -20, 0, 8),
    AFFINEANIMCMD_LOOP(2),
    AFFINEANIMCMD_END,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_84024D0 =
{
    .tileTag = ANIM_TAG_POKEBALL,
    .paletteTag = ANIM_TAG_POKEBALL,
    .oam = &gOamData_837DF2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_812D3AC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_84024E8 =
{
    .tileTag = ANIM_TAG_GOLD_STARS,
    .paletteTag = ANIM_TAG_GOLD_STARS,
    .oam = &gOamData_837DF2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_812D4B4,
};

const struct SpriteTemplate gSpriteTemplate_8402500 =
{
    .tileTag = ANIM_TAG_GOLD_STARS,
    .paletteTag = ANIM_TAG_GOLD_STARS,
    .oam = &gOamData_837DF24,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_812D588,
};

const union AffineAnimCmd gUnknown_08402518[] =
{
    AFFINEANIMCMD_FRAME(8, -8, 0, 12),
    AFFINEANIMCMD_FRAME(-16, 16, 0, 12),
    AFFINEANIMCMD_FRAME(8, -8, 0, 12),
    AFFINEANIMCMD_LOOP(1),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gUnknown_08402540[] =
{
    AFFINEANIMCMD_FRAME(0, 6, 0, 20),
    AFFINEANIMCMD_FRAME(0, 0, 0, 20),
    AFFINEANIMCMD_FRAME(0, -18, 0, 6),
    AFFINEANIMCMD_FRAME(-18, -18, 0, 3),
    AFFINEANIMCMD_FRAME(0, 0, 0, 15),
    AFFINEANIMCMD_FRAME(4, 4, 0, 13),
    AFFINEANIMCMD_END,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_8402578 =
{
    .tileTag = ANIM_TAG_BLUE_ORB,
    .paletteTag = ANIM_TAG_BLUE_ORB,
    .oam = &gOamData_837DF24,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_812D724,
};

const union AffineAnimCmd gUnknown_08402590[] =
{
    AFFINEANIMCMD_FRAME(0, 6, 0, 20),
    AFFINEANIMCMD_FRAME(0, 0, 0, 20),
    AFFINEANIMCMD_FRAME(7, -30, 0, 6),
    AFFINEANIMCMD_FRAME(0, 0, 0, 20),
    AFFINEANIMCMD_FRAME(-2, 3, 0, 20),
    AFFINEANIMCMD_END,
};

const s8 gUnknown_084025C0[] =
{
    0xE8, 
    0x18, 
    0xFC, 
    0x00,
};

const union AnimCmd gSpriteAnim_84025C4[] =
{
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(4, 6),
    ANIMCMD_JUMP(0),
};

const union AnimCmd gSpriteAnim_84025D0[] =
{
    ANIMCMD_FRAME(8, 6),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_84025D8[] =
{
    ANIMCMD_FRAME(12, 6),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_84025E0[] =
{
    gSpriteAnim_84025C4,
    gSpriteAnim_84025D0,
    gSpriteAnim_84025D8,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_84025EC =
{
    .tileTag = ANIM_TAG_GREEN_STAR,
    .paletteTag = ANIM_TAG_GREEN_STAR,
    .oam = &gOamData_837DF2C,
    .anims = gSpriteAnimTable_84025E0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_812DEAC,
};

const s8 gUnknown_08402604[] =
{
    0x78,
    0x50,
    0x28,
    0x00,
};

const u8 gUnknown_08402608[] =
{
    0,
    0,
    0,
    0,
    50,
};

const union AffineAnimCmd gUnknown_08402610[] =
{
    AFFINEANIMCMD_FRAME(0, -15, 0, 7),
    AFFINEANIMCMD_FRAME(0, 15, 0, 7),
    AFFINEANIMCMD_LOOP(2),
    AFFINEANIMCMD_END,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_8402630 =
{
    .tileTag = ANIM_TAG_ANGER,
    .paletteTag = ANIM_TAG_ANGER,
    .oam = &gOamData_837DF2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_812E4F0,
};

const union AnimCmd gSpriteAnim_8402648[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(1, 8),
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_FRAME(3, 8),
    ANIMCMD_FRAME(3, 8, .vFlip = TRUE),
    ANIMCMD_FRAME(2, 8, .vFlip = TRUE),
    ANIMCMD_FRAME(0, 8, .vFlip = TRUE),
    ANIMCMD_FRAME(1, 8, .vFlip = TRUE),
    ANIMCMD_JUMP(0),
};

const union AnimCmd gSpriteAnim_840266C[] =
{
    ANIMCMD_FRAME(0, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(1, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(2, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(3, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(3, 8, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_FRAME(2, 8, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 8, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_FRAME(1, 8, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_JUMP(0),
};

const union AnimCmd gSpriteAnim_8402690[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_8402698[] =
{
    gSpriteAnim_8402648,
    gSpriteAnim_840266C,
    gSpriteAnim_8402690,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_84026A4 =
{
    .tileTag = ANIM_TAG_PINK_PETAL,
    .paletteTag = ANIM_TAG_PINK_PETAL,
    .oam = &gOamData_837DF24,
    .anims = gSpriteAnimTable_8402698,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_812E7A0,
};

const u16 gUnknown_4026BC[] = INCBIN_U16("graphics/unknown/unknown_4026BC.gbapal");

const union AnimCmd gSpriteAnim_84026DC[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_FRAME(4, 9),
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_84026EC[] =
{
    gSpriteAnim_84026DC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_84026F0 =
{
    .tileTag = ANIM_TAG_PAIN_SPLIT,
    .paletteTag = ANIM_TAG_PAIN_SPLIT,
    .oam = &gOamData_837DF2C,
    .anims = gSpriteAnimTable_84026EC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_812EA4C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_8402708 =
{
    .tileTag = ANIM_TAG_CONFETTI,
    .paletteTag = ANIM_TAG_CONFETTI,
    .oam = &gOamData_837DF24,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_812EC78,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_8402720 =
{
    .tileTag = ANIM_TAG_SPOTLIGHT,
    .paletteTag = ANIM_TAG_SPOTLIGHT,
    .oam = &gOamData_837DFFC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_8402384,
    .callback = sub_812ED84,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_8402738 =
{
    .tileTag = ANIM_TAG_BLUE_ORB,
    .paletteTag = ANIM_TAG_BLUE_ORB,
    .oam = &gOamData_837DF24,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_812EEA4,
};

const union AffineAnimCmd gUnknown_08402750[] =
{
    AFFINEANIMCMD_FRAME(16, 0, 0, 4),
    AFFINEANIMCMD_FRAME(0, -3, 0, 16),
    AFFINEANIMCMD_FRAME(4, 0, 0, 4),
    AFFINEANIMCMD_FRAME(0, 0, 0, 24),
    AFFINEANIMCMD_FRAME(-5, 3, 0, 16),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_8402780[] =
{
    AFFINEANIMCMD_FRAME(0x80, 0x80, 0, 0),
    AFFINEANIMCMD_FRAME(0xFFF8, 0xFFF8, 0, 8),
    AFFINEANIMCMD_FRAME(0x8, 0x8, 0, 8),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd gSpriteAffineAnim_84027A0[] =
{
    AFFINEANIMCMD_FRAME(0xC0, 0xC0, 0, 0),
    AFFINEANIMCMD_FRAME(0x8, 0x8, 0, 8),
    AFFINEANIMCMD_FRAME(0xFFF8, 0xFFF8, 0, 8),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd gSpriteAffineAnim_84027C0[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x8, 0x8, 0, 8),
    AFFINEANIMCMD_FRAME(0xFFF8, 0xFFF8, 0, 8),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_84027E0[] =
{
    gSpriteAffineAnim_8402780,
    gSpriteAffineAnim_84027A0,
    gSpriteAffineAnim_84027C0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_84027EC =
{
    .tileTag = ANIM_TAG_PINK_CLOUD,
    .paletteTag = ANIM_TAG_PINK_CLOUD,
    .oam = &gOamData_837DF94,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_84027E0,
    .callback = sub_812F88C,
};

const union AffineAnimCmd gSpriteAffineAnim_8402804[] =
{
    AFFINEANIMCMD_FRAME(0x80, 0x80, 0, 0),
    AFFINEANIMCMD_FRAME(0xFFFC, 0xFFFA, 0, 16),
    AFFINEANIMCMD_FRAME(0x4, 0x6, 0, 16),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd gSpriteAffineAnim_8402824[] =
{
    AFFINEANIMCMD_FRAME(0xC0, 0xC0, 0, 0),
    AFFINEANIMCMD_FRAME(0x4, 0x6, 0, 16),
    AFFINEANIMCMD_FRAME(0xFFFC, 0xFFFA, 0, 16),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd gSpriteAffineAnim_8402844[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x4, 0x6, 0, 16),
    AFFINEANIMCMD_FRAME(0xFFFC, 0xFFFA, 0, 16),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd gSpriteAffineAnim_8402864[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x8, 0xA, 0, 30),
    AFFINEANIMCMD_FRAME(0xFFF8, 0xFFF6, 0, 16),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_8402884[] =
{
    gSpriteAffineAnim_8402804,
    gSpriteAffineAnim_8402824,
    gSpriteAffineAnim_8402844,
    gSpriteAffineAnim_8402864,
};

//arg[0]: frame (0-3)
//arg[1]: x
//arg[2]: y
//arg[3]: ??? (time on screen?)
const struct SpriteTemplate gPinkSmokeTemplate =
{
    .tileTag = ANIM_TAG_PINK_CLOUD,
    .paletteTag = ANIM_TAG_PINK_CLOUD,
    .oam = &gOamData_837DFF4,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_8402884,
    .callback = sub_812F948,
};

const union AffineAnimCmd gUnknown_084028AC[] =
{
    AFFINEANIMCMD_FRAME(-16, 16, 0, 6),
    AFFINEANIMCMD_FRAME(16, -16, 0, 12),
    AFFINEANIMCMD_FRAME(-16, 16, 0, 6),
    AFFINEANIMCMD_END,
};

const struct SpriteTemplate gSpriteTemplate_84028CC =
{
    .tileTag = ANIM_TAG_SWEAT_DROP,
    .paletteTag = ANIM_TAG_SWEAT_DROP,
    .oam = &gOamData_837DF24,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_812FF94,
};

const u16 gUnknown_084028E4[] = INCBIN_U16("graphics/battle_anims/sprites/effect.gbapal");

const union AnimCmd gSpriteAnim_8402914[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(16, 3),
    ANIMCMD_JUMP(0),
};

const union AnimCmd gSpriteAnim_8402920[] =
{
    ANIMCMD_FRAME(32, 3),
    ANIMCMD_FRAME(48, 3),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_840292C[] =
{
    gSpriteAnim_8402914,
    gSpriteAnim_8402920,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_8402934 =
{
    .tileTag = ANIM_TAG_NOISE_LINE,
    .paletteTag = ANIM_TAG_NOISE_LINE,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_840292C,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_81300F4,
};

const struct SpriteTemplate gSpriteTemplate_840294C =
{
    .tileTag = ANIM_TAG_SMALL_RED_EYE,
    .paletteTag = ANIM_TAG_SMALL_RED_EYE,
    .oam = &gOamData_837DF24,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_81304DC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_8402964 =
{
    .tileTag = ANIM_TAG_PAW_PRINT,
    .paletteTag = ANIM_TAG_PAW_PRINT,
    .oam = &gOamData_837DF34,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813051C,
};

const union AffineAnimCmd gSpriteAffineAnim_840297C[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, -4, 24),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_840298C[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x100, -64, 0),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 4, 24),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_84029A4[] =
{
    gSpriteAffineAnim_840297C,
    gSpriteAffineAnim_840298C,
};

const struct SpriteTemplate gSpriteTemplate_84029AC =
{
    .tileTag = ANIM_TAG_RED_BALL,
    .paletteTag = ANIM_TAG_RED_BALL,
    .oam = &gOamData_837DF94,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_84029A4,
    .callback = SpriteCallbackDummy,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_84029C4 =
{
    .tileTag = ANIM_TAG_TAG_HAND,
    .paletteTag = ANIM_TAG_TAG_HAND,
    .oam = &gOamData_837DF34,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_81307B0,
};

const union AffineAnimCmd gUnknown_084029DC[] =
{
    AFFINEANIMCMD_FRAME(0, -16, 0, 6),
    AFFINEANIMCMD_FRAME(0, 16, 0, 6),
    AFFINEANIMCMD_END,//0
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_84029F4 =
{
    .tileTag = ANIM_TAG_SMELLINGSALT_EFFECT,
    .paletteTag = ANIM_TAG_SMELLINGSALT_EFFECT,
    .oam = &gOamData_837DF34,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_8130A2C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_8402A0C =
{
    .tileTag = ANIM_TAG_TAG_HAND,
    .paletteTag = ANIM_TAG_TAG_HAND,
    .oam = &gOamData_837DF34,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_8130AEC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_8402A24 =
{
    .tileTag = ANIM_TAG_MAGNIFYING_GLASS,
    .paletteTag = ANIM_TAG_MAGNIFYING_GLASS,
    .oam = &gOamData_837E054,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_8130F5C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_8402A3C =
{
    .tileTag = ANIM_TAG_GOLD_STARS,
    .paletteTag = ANIM_TAG_GOLD_STARS,
    .oam = &gOamData_837DF2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_8131264,
};

const struct SpriteTemplate gSpriteTemplate_8402A54 =
{
    .tileTag = ANIM_TAG_GOLD_STARS,
    .paletteTag = ANIM_TAG_GOLD_STARS,
    .oam = &gOamData_837DF2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D1FDC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_8402A6C =
{
    .tileTag = ANIM_TAG_X_SIGN,
    .paletteTag = ANIM_TAG_X_SIGN,
    .oam = &gOamData_837DF3C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_8131564,
};

const struct SpriteTemplate gSpriteTemplate_8402A84 =
{
    .tileTag = ANIM_TAG_ITEM_BAG,
    .paletteTag = ANIM_TAG_ITEM_BAG,
    .oam = &gOamData_837DF34,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_8131EB8,
};

const union AnimCmd gSpriteAnim_8402A9C[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(64, 4),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_8402AA8[] =
{
    gSpriteAnim_8402A9C,
};

const union AffineAnimCmd gSpriteAffineAnim_8402AAC[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x0, 0x0, -4, 8),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_8402AC4[] =
{
    AFFINEANIMCMD_FRAME(0xFF00, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 4, 8),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_8402ADC[] =
{
    gSpriteAffineAnim_8402AAC,
    gSpriteAffineAnim_8402AC4,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_8402AE4 =
{
    .tileTag = ANIM_TAG_SLAM_HIT_2,
    .paletteTag = ANIM_TAG_SLAM_HIT_2,
    .oam = &gOamData_837DF9C,
    .anims = gSpriteAnimTable_8402AA8,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_8402ADC,
    .callback = AnimKnockOffStrike,
};

const union AffineAnimCmd gSpriteAffineAnim_8402AFC[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, -4, 64),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_8402B0C[] =
{
    gSpriteAffineAnim_8402AFC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_8402B10 =
{
    .tileTag = ANIM_TAG_RECYCLE,
    .paletteTag = ANIM_TAG_RECYCLE,
    .oam = &gOamData_837E0BC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_8402B0C,
    .callback = AnimRecycle,
};

const union AffineAnimCmd gSlackOffSquishAffineAnimCmds[] =
{
    AFFINEANIMCMD_FRAME(0, 16, 0, 4),
    AFFINEANIMCMD_FRAME(-2, 0, 0, 8),
    AFFINEANIMCMD_FRAME(0, 4, 0, 4),
    AFFINEANIMCMD_FRAME(0, 0, 0, 24),
    AFFINEANIMCMD_FRAME(1, -5, 0, 16),
    AFFINEANIMCMD_END,
};

static void sub_812C144(struct Sprite *sprite)
{
    sprite->x += gBattleAnimArgs[0];
    sprite->y += gBattleAnimArgs[1];

    if (gBattleAnimArgs[3] == 0)
        sprite->data[0] = gBattleAnimArgs[2];
    else
        sprite->data[0] = -gBattleAnimArgs[2];

    sprite->data[1] = gBattleAnimArgs[4];
    sprite->callback = sub_812C184;
}

static void sub_812C184(struct Sprite *sprite)
{
    if (sprite->data[1] > 0)
    {
        sprite->x2 = sprite->data[2] >> 8;
        sprite->data[2] += sprite->data[0];
        sprite->invisible ^= 1;
        sprite->data[1]--;
    }
    else
    {
        DestroyAnimSprite(sprite);
    }
}

void sub_812C1D0(u8 taskId)
{
    sub_8046234(
        GetBattlerSpriteCoord(gBattleAnimTarget, 2) + 8,
        GetBattlerSpriteCoord(gBattleAnimTarget, 3) + 8,
        0);
    DestroyAnimVisualTask(taskId);

}

static void sub_812C220(struct Sprite *sprite)
{
    sprite->data[0] = 90;
    sprite->callback = WaitAnimForDuration;
    sprite->data[1] = 7;
    StoreSpriteCallbackInData(sprite, sub_812C268);
    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = ((16 - sprite->data[1]) << 8) | sprite->data[1];
}

static void sub_812C268(struct Sprite *sprite)
{
    REG_BLDALPHA = ((16 - sprite->data[1]) << 8) | sprite->data[1];
    if (--sprite->data[1] < 0)
    {
        sprite->invisible = TRUE;
        sprite->callback = sub_812C2A4;
    }
}

static void sub_812C2A4(struct Sprite *sprite)
{
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    DestroyAnimSprite(sprite);
}

static void sub_812C2BC(struct Sprite *sprite)
{
    u16 rotation;
    u8 x = GetBattlerSpriteCoord(gBattleAnimTarget, 2);
    u8 y = GetBattlerSpriteCoord(gBattleAnimTarget, 3);

    sub_8078764(sprite, TRUE);

    rotation = ArcTan2Neg(sprite->x - x, sprite->y - y);
    rotation += 0x6000;
    if (IsContest())
        rotation += 0x4000;

    sub_8078FDC(sprite, 0, 0x100, 0x100, rotation);

    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[2] = x;
    sprite->data[4] = y;
    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

static void sub_812C358(struct Sprite *sprite)
{
    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = 0x1000;
    sprite->data[0] = 4;
    sprite->callback = sub_812C380;
}

static void sub_812C380(struct Sprite *sprite)
{
    REG_BLDALPHA = ((16 - sprite->data[0]) << 8) | sprite->data[0];

    if (sprite->data[1])
        sprite->data[0]--;
    else
        sprite->data[0]++;

    if (sprite->data[0] == 15 || sprite->data[0] == 4)
        sprite->data[1] ^= 1;

    if (sprite->data[2]++ > 70)
    {
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        StartSpriteAffineAnim(sprite, 1);
        sprite->data[2] = 0;
        sprite->invisible = TRUE;
        sprite->affineAnimPaused = 1;
        sprite->callback = sub_812C40C;
    }
}

static void sub_812C40C(struct Sprite *sprite)
{
    if (sprite->data[2]++ > 9)
    {
        sprite->invisible = FALSE;
        sprite->affineAnimPaused = 0;
        if (sprite->affineAnimEnded)
            sprite->callback = sub_812C450;
    }
}

static void sub_812C450(struct Sprite *sprite)
{
    switch (sprite->data[3])
    {
    case 0:
    case 1:
        sprite->x2 = 1;
        sprite->y2 = 0;
        break;
    case 2:
    case 3:
        sprite->x2 = -1;
        sprite->y2 = 0;
        break;
    case 4:
    case 5:
        sprite->x2 = 0;
        sprite->y2 = 1;
        break;
    case 6:
    default:
        sprite->x2 = 0;
        sprite->y2 = -1;
        break;
    }

    if (++sprite->data[3] > 7)
        sprite->data[3] = 0;

    if (sprite->data[4]++ > 15)
    {
        sprite->data[0] = 16;
        sprite->data[1] = 0;
        REG_BLDCNT = 0x3F40;
        REG_BLDALPHA = sprite->data[0];
        sprite->callback = sub_812C4FC;
    }
}

static void sub_812C4FC(struct Sprite *sprite)
{
    REG_BLDALPHA = ((16 - sprite->data[0]) << 8) | sprite->data[0];

    if (sprite->data[1]++ > 1)
    {
        sprite->data[0]--;
        sprite->data[1] = 0;
    }

    if (sprite->data[0] == 0)
        sprite->invisible = TRUE;

    if (sprite->data[0] < 0)
    {
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        DestroyAnimSprite(sprite);
    }
}

void sub_812C560(u8 taskId)
{
    gTasks[taskId].func = sub_812C588;
    gAnimVisualTaskCount--;
}

static void sub_812C588(u8 taskId)
{
    int i;
    u16 lastColor;
    u8 paletteIndex = sub_80789BC();

    if (++gTasks[taskId].data[5] == 4)
    {
        lastColor = gPlttBufferFaded[paletteIndex * 16 + 11];
        for (i = 10; i > 0; i--)
            gPlttBufferFaded[paletteIndex * 16 + i + 1] = gPlttBufferFaded[paletteIndex * 16 + i];

        gPlttBufferFaded[paletteIndex * 16 + 1] = lastColor;
        gTasks[taskId].data[5] = 0;
    }

    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
        DestroyTask(taskId);
}

void sub_812C624(u8 taskId)
{
    gTasks[taskId].func = sub_812C64C;
    gAnimVisualTaskCount--;
}

static void sub_812C64C(u8 taskId)
{
    int i;
    u16 lastColor;
    u8 paletteIndex = sub_80789BC();

    if (++gTasks[taskId].data[5] == 4)
    {
        lastColor = gPlttBufferFaded[paletteIndex * 16 + 11];
        for (i = 10; i > 0; i--)
            gPlttBufferFaded[paletteIndex * 16 + i + 1] = gPlttBufferFaded[paletteIndex * 16 + i];
        gPlttBufferFaded[paletteIndex * 16 + 1] = lastColor;

        lastColor = gPlttBufferUnfaded[paletteIndex * 16 + 11];
        for (i = 10; i > 0; i--)
            gPlttBufferUnfaded[paletteIndex * 16 + i + 1] = gPlttBufferUnfaded[paletteIndex * 16 + i];
        gPlttBufferUnfaded[paletteIndex * 16 + 1] = lastColor;

        gTasks[taskId].data[5] = 0;
    }

    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
        DestroyTask(taskId);
}

static void sub_812C720(struct Sprite *sprite)
{
    u16 x;
    u16 y;

    InitAnimSpritePos(sprite, 1);
    SetAverageBattlerPositions(gBattleAnimTarget, 0, &x, &y);

    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = x + gBattleAnimArgs[2];
    sprite->data[4] = y + gBattleAnimArgs[3];
    sprite->data[5] = -50;

    InitAnimArcTranslation(sprite);
    sprite->callback = sub_812C798;
}

static void sub_812C798(struct Sprite *sprite)
{
    if (TranslateAnimArc(sprite))
    {
        sprite->data[0] = 30;
        sprite->data[1] = 0;
        sprite->callback = WaitAnimForDuration;
        StoreSpriteCallbackInData(sprite, sub_812C7C8);
    }
}

static void sub_812C7C8(struct Sprite *sprite)
{
    if (sprite->data[1] & 1)
        sprite->invisible ^= 1;

    if (++sprite->data[1] == 16)
        DestroyAnimSprite(sprite);
}

static void sub_812C80C(struct Sprite *sprite)
{
    sub_8078650(sprite);
    sub_807867C(sprite, gBattleAnimArgs[0]);
    sprite->y += gBattleAnimArgs[1];
    sprite->callback = sub_8078600;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

// This is likely fakematching due to some strange type casting behavior.
static void sub_812C848(struct Sprite *sprite)
{
    int var0;
    int var1;
    if (sprite->data[0] == 0)
    {
        sub_8078650(sprite);
        sub_807867C(sprite, gBattleAnimArgs[0]);

        if (!IsContest())
        {
            if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER)
            {
                sprite->data[1] = gBattleAnimArgs[2];
                sprite->data[2] = gBattleAnimArgs[3];
            }
            else
            {
                var1 = -gBattleAnimArgs[2];
                sprite->data[1] = var1;
                var1 = -gBattleAnimArgs[3];
                sprite->data[2] = var1;
            }
        }
        else
        {
            var1 = -gBattleAnimArgs[2];
            sprite->data[1] = var1;
            sprite->data[2] = gBattleAnimArgs[3];
        }
    }

    sprite->data[0]++;
    var0 = (sprite->data[0] * 20) & 0xFF;
    sprite->data[3] += sprite->data[1];
    sprite->data[4] += sprite->data[2];
    sprite->x2 = (sprite->data[3] + (s32)((u32)sprite->data[3] >> 31)) >> 1;
    sprite->y2 = Sin(var0 & 0xFF, 5) + ((s32)(sprite->data[4] + ((u32)sprite->data[4] >> 31)) >> 1);

    if ((u16)(sprite->x + sprite->x2) > 240)
        DestroyAnimSprite(sprite);
}

static void sub_812C908(struct Sprite *sprite)
{
    if (sprite->animEnded)
        DestroyAnimSprite(sprite);
}

void sub_812C924(u8 taskId)
{
    if (GetBattlerSide(gBattleAnimTarget) == B_SIDE_OPPONENT)
        gBattleAnimArgs[7] = 0;
    else
        gBattleAnimArgs[7] = 1;

    DestroyAnimVisualTask(taskId);
}

void sub_812C960(u8 taskId)
{
    if (gAnimMoveDmg > 0)
        gBattleAnimArgs[7] = 0;
    else
        gBattleAnimArgs[7] = 1;

    DestroyAnimVisualTask(taskId);
}

static void sub_812C990(struct Sprite *sprite)
{
    REG_WINOUT = 0x1F3F;
    REG_DISPCNT |= DISPCNT_OBJWIN_ON;
    gBattle_WIN0H = 0;
    gBattle_WIN0V = 0;
    REG_WIN0H = 0;
    REG_WIN0V = 0;

    sub_8078764(sprite, FALSE);

    sprite->oam.objMode = ST_OAM_OBJ_WINDOW;
    sprite->invisible = TRUE;
    sprite->callback = sub_812CA04;
}

static void sub_812CA04(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->invisible = FALSE;
        if (sprite->affineAnimEnded)
            sprite->data[0]++;
        break;
    case 1:
    case 3:
        sprite->data[1] += 117;
        sprite->x2 = sprite->data[1] >> 8;
        if (++sprite->data[2] == 21)
        {
            sprite->data[2] = 0;
            sprite->data[0]++;
        }
        break;
    case 2:
        sprite->data[1] -= 117;
        sprite->x2 = sprite->data[1] >> 8;
        if (++sprite->data[2] == 41)
        {
            sprite->data[2] = 0;
            sprite->data[0]++;
        }
        break;
    case 4:
        ChangeSpriteAffineAnim(sprite, 1);
        sprite->data[0]++;
        break;
    case 5:
        if (sprite->affineAnimEnded)
        {
            sprite->invisible = TRUE;
            sprite->callback = sub_812CAD0;
        }
        break;
    }
}

static void sub_812CAD0(struct Sprite *sprite)
{
    REG_WINOUT = 0x3F3F;
    REG_DISPCNT ^= DISPCNT_OBJWIN_ON;
    DestroyAnimSprite(sprite);
}

static void sub_812CAFC(struct Sprite *sprite)
{
    if (gBattleAnimArgs[3] == 0)
    {
        sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, 0);
        sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, 1);
    }

    sprite->x += gBattleAnimArgs[0];
    sprite->y += gBattleAnimArgs[1];
    sprite->oam.tileNum += 16;

    if (gBattleAnimArgs[2] == 0)
    {
        sprite->oam.matrixNum = 8;
        sprite->x2 = -12;
        sprite->data[1] = 2;
    }
    else
    {
        sprite->x2 = 12;
        sprite->data[1] = -2;
    }

    sprite->data[0] = gBattleAnimArgs[4];

    if (sprite->data[3] != 255)
        sprite->data[3] = gBattleAnimArgs[2];

    sprite->callback = sub_812CBB4;
}

static void sub_812CBB4(struct Sprite *sprite)
{
    if (sprite->data[2] == 0)
    {
        sprite->x2 += sprite->data[1];
        if (sprite->x2 == 0)
        {
            sprite->data[2]++;
            if (sprite->data[3] == 0)
            {
                PlaySE1WithPanning(222, BattleAnimAdjustPanning(SOUND_PAN_ATTACKER_NEG));
            }
        }
    }
    else
    {
        sprite->x2 -= sprite->data[1];
        if (abs(sprite->x2) == 12)
        {
            sprite->data[0]--;
            sprite->data[2]--;
        }

    }

    if (sprite->data[0] == 0)
        DestroyAnimSprite(sprite);
}

static void sub_812CC28(struct Sprite *sprite)
{
    sprite->oam.objMode = ST_OAM_OBJ_WINDOW;
    sprite->data[3] = 255;
    sub_812CAFC(sprite);
}

void sub_812CC44(u8 taskId)
{
    if (IsContest())
    {
        REG_WININ = 0x1F3F;
        gBattle_WIN1H = 0x98F0;
        gBattle_WIN1V = 0x00A0;
        REG_WIN1H = gBattle_WIN0H;
        REG_WIN1V = gBattle_WIN0V;
    }

    DestroyAnimVisualTask(taskId);
}

void sub_812CCA8(u8 taskId)
{
    if (IsContest())
    {
        REG_WININ = 0x3F3F;
        gBattle_WIN1H = 0;
        gBattle_WIN1V = 0;
    }

    DestroyAnimVisualTask(taskId);
}

static void sub_812CCE8(struct Sprite *sprite)
{
    int var0;
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, 0) + gBattleAnimArgs[1];
        sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, 1);
    }
    else
    {
        sprite->x = GetBattlerSpriteCoord(gBattleAnimTarget, 0) + gBattleAnimArgs[1];
        sprite->y = GetBattlerSpriteCoord(gBattleAnimTarget, 1);
    }

    sprite->y2 = gBattleAnimArgs[2];
    var0 = 0;
    if (sprite->y2 > gBattleAnimArgs[3])
        var0 = 1;

    sprite->data[0] = var0;
    sprite->data[1] = 0;
    sprite->data[2] = gBattleAnimArgs[4];
    sprite->data[3] = gBattleAnimArgs[5];
    sprite->data[4] = gBattleAnimArgs[3];
    sprite->callback = sub_812CD64;
}

static void sub_812CD64(struct Sprite *sprite)
{
    sprite->data[1] = (sprite->data[1] + sprite->data[2]) & 0xFF;
    sprite->x2 = gSineTable[sprite->data[1]] >> 4;
    sprite->y2 += sprite->data[3];

    if (sprite->data[0])
    {
        if (sprite->y2 < sprite->data[4])
            DestroyAnimSprite(sprite);
    }
    else
    {
        if (sprite->y2 > sprite->data[4])
            DestroyAnimSprite(sprite);
    }
}

void sub_812CDC8(u8 taskId)
{
    s16 var0;
    u8 toBG2;
    s16 var2;
    int var3;
    int var4;
    s16 i;
    struct ScanlineEffectParams scanlineParams;
    struct Task *task = &gTasks[taskId];

    if (gBattleAnimArgs[0] == 0)
    {
        var0 = sub_8077FC0(gBattleAnimAttacker);
        toBG2 = GetBattlerPosition_permutated(gBattleAnimAttacker);
    }
    else
    {
        var0 = sub_8077FC0(gBattleAnimTarget);
        toBG2 = GetBattlerPosition_permutated(gBattleAnimTarget);
    }

    task->data[0] = var0 + 36;
    task->data[1] = task->data[0];
    task->data[2] = var0 - 33;
    if (task->data[2] < 0)
        task->data[2] = 0;

    task->data[3] = task->data[0];
    task->data[4] = 8;
    task->data[5] = gBattleAnimArgs[1];
    task->data[6] = 0;
    task->data[7] = 0;

    if (toBG2 == 1)
    {
        var3 = gBattle_BG1_X;
        task->data[8] = var3;
        var4 = var3 + 240;
    }
    else
    {
        var3 = gBattle_BG2_X;
        task->data[8] = var3;
        var4 = var3 + 240;
    }

    task->data[9] = var4;
    task->data[10] = gBattleAnimArgs[2];

    if (gBattleAnimArgs[2] == 0)
    {
        task->data[11] = var4;
        var2 = task->data[8];
    }
    else
    {
        task->data[11] = var3;
        var2 = task->data[9];
    }

    task->data[15] = 0;

    i = task->data[2];
    while (i <= task->data[3])
    {
        gScanlineEffectRegBuffers[0][i] = var2;
        gScanlineEffectRegBuffers[1][i] = var2;
        i++;
    }

    if (toBG2 == 1)
        scanlineParams.dmaDest = &REG_BG1HOFS;
    else
        scanlineParams.dmaDest = &REG_BG2HOFS;

    scanlineParams.dmaControl = 0xA2600001;
    scanlineParams.initState = 1;
    scanlineParams.unused9 = 0;
    ScanlineEffect_SetParams(scanlineParams);

    task->func = sub_812CEF0;
}

static void sub_812CEF0(u8 taskId)
{
    s16 i;
    struct Task *task = &gTasks[taskId];

    task->data[0] -= task->data[5];
    if (task->data[0] < task->data[2])
        task->data[0] = task->data[2];

    if (task->data[4] == 0)
    {
        task->data[1] -= task->data[5];
        if (task->data[1] < task->data[2])
        {
            task->data[1] = task->data[2];
            task->data[15] = 1;
        }
    }
    else
    {
        task->data[4]--;
    }

    if (++task->data[6] > 1)
    {
        task->data[6] = 0;
        task->data[7] = task->data[7] == 0 ? 1 : 0;

        if (task->data[7])
            task->data[12] = task->data[8];
        else
            task->data[12] = task->data[9];        
    }

    i = task->data[0];
    while (i < task->data[1])
    {
        gScanlineEffectRegBuffers[0][i] = task->data[12];
        gScanlineEffectRegBuffers[1][i] = task->data[12];
        i++;
    }

    i = task->data[1];
    while (i <= task->data[3])
    {
        gScanlineEffectRegBuffers[0][i] = task->data[11];
        gScanlineEffectRegBuffers[1][i] = task->data[11];
        i++;
    }

    if (task->data[15])
    {
        if (task->data[10])
            gScanlineEffect.state = 3;

        DestroyAnimVisualTask(taskId);
    }
}

void sub_812D008(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    task->data[0] = 0;
    task->data[1] = 0;
    task->data[2] = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
    task->data[3] = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
    task->data[4] = 32;
    task->data[5] = -20;
    task->data[6] = 0;
    task->data[15] = GetAnimBattlerSpriteId(0);
    task->func = sub_812D06C;
}

static void sub_812D06C(u8 taskId)
{
    int var0, var1;
    s16 x, y;
    u16 i, j;
    u8 spriteId;
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        var0 = task->data[2];
        if (task->data[1] & 1)
        {
            var1 = task->data[4];
            x = var0 - var1;
        }
        else
        {
            var1 = task->data[4];
            x = var0 + var1;
        }

        y = task->data[3] + task->data[5];
        spriteId = CreateSprite(&gBattleAnimSpriteTemplate_83D7220, x, y, 6 - task->data[1]);
        PlaySE12WithPanning(186, BattleAnimAdjustPanning(SOUND_PAN_ATTACKER_NEG));

        if (spriteId != MAX_SPRITES)
        {
            gSprites[spriteId].hFlip = task->data[1] & 1;
            gSprites[spriteId].callback = SpriteCallbackDummy;
        }

        if (task->data[1] & 1)
        {
            task->data[4] -= 6;
            task->data[5] -= 6;
        }

        PrepareAffineAnimInTaskData(task, task->data[15], gUnknown_08402400);
        task->data[1]++;
        task->data[0] = 1;
        break;
    case 1:
        if (RunAffineAnimFromTaskData(task) == 0)
        {
            if (task->data[1] == 6)
            {
                task->data[6] = 8;
                task->data[0] = 3;
            }
            else
            {
                if (task->data[1] <= 2)
                    task->data[6] = 10;
                else
                    task->data[6] = 0;

                task->data[0] = 2;
            }
        }
        break;
    case 2:
        if (task->data[6] != 0)
            task->data[6]--;
        else
            task->data[0] = 0;
        break;
    case 3:
        if (task->data[6] != 0)
            task->data[6]--;
        else
            task->data[0] = 4;
        break;
    case 4:
        for (i = 0, j = 0; i < MAX_SPRITES; i++)
        {
            if (gSprites[i].template == &gBattleAnimSpriteTemplate_83D7220)
            {
                gSprites[i].data[0] = taskId;
                gSprites[i].data[1] = 6;
                StartSpriteAnim(&gSprites[i], 2);
                gSprites[i].callback = sub_812D254;

                if (++j == 6)
                    break;
            }
        }

        task->data[6] = j;
        task->data[0] = 5;
        break;
    case 5:
        if (task->data[6] == 0)
            DestroyAnimVisualTask(taskId);
        break;
    }
}

static void sub_812D254(struct Sprite *sprite)
{
    if (sprite->animEnded)
    {
        gTasks[sprite->data[0]].data[sprite->data[1]]--;
        DestroySprite(sprite);
    }
}

static void sub_812D294(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
        InitAnimSpritePos(sprite, 0);

    sprite->data[0]++;
    if (sprite->data[0] < 40)
    {
        u16 var = sprite->data[0];
        if ((var & 1) == 0)
            sprite->invisible = TRUE;
        else
            sprite->invisible = FALSE;
    }

    if (sprite->data[0] > 30)
        sprite->invisible = FALSE;

    if (sprite->data[0] == 61)
    {
        StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
        sprite->x += sprite->x2;
        sprite->y += sprite->y2;
        sprite->x2 = 0;
        sprite->y2 = 0;
        sprite->data[0] = 20;
        sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, 2);
        sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, 3);
        sprite->callback = StartAnimLinearTranslation;
    }
}

void sub_812D350(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
    case 0:
        PrepareAffineAnimInTaskData(&gTasks[taskId], GetAnimBattlerSpriteId(0), &gUnknown_084024B0);
        gTasks[taskId].data[0]++;
        break;
    case 1:
        if (RunAffineAnimFromTaskData(&gTasks[taskId]) == 0)
            DestroyAnimVisualTask(taskId);
        break;
    }
}

static void sub_812D3AC(struct Sprite *sprite)
{
    u8 spriteId = GetAnimBattlerSpriteId(0);

    switch (sprite->data[0])
    {
    case 0:
        sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
        sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
        PrepareBattlerSpriteForRotScale(spriteId, 0);
        sprite->data[1] = 256;
        sprite->data[2] = 256;
        sprite->data[0]++;
        break;
    case 1:
        sprite->data[1] += 96;
        sprite->data[2] -= 26;
        obj_id_set_rotscale(spriteId, sprite->data[1], sprite->data[2], 0);

        if (++sprite->data[3] == 5)
            sprite->data[0]++;
        // fall through
    case 2:
        sprite->data[1] += 96;
        sprite->data[2] += 48;
        obj_id_set_rotscale(spriteId, sprite->data[1], sprite->data[2], 0);

        if (++sprite->data[3] == 9)
        {
            sprite->data[3] = 0;
            gSprites[spriteId].invisible = TRUE;
            sub_8078F40(spriteId);
            sprite->data[0]++;
        }
        break;
    case 3:
        sprite->y2 -= 6;
        if (sprite->y + sprite->y2 < -32)
            DestroyAnimSprite(sprite);
        break;
    }
}

static void sub_812D4B4(struct Sprite *sprite)
{
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        sprite->x = -16;
    else
        sprite->x = 256;

    sprite->y = 0;
    sprite->callback = sub_812D4EC;
}

static void sub_812D4EC(struct Sprite *sprite)
{
    u32 newX;

    sprite->data[0] += 72;
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        sprite->x2 = sprite->data[0] >> 4;
    else
        sprite->x2 = -(sprite->data[0] >> 4);

    sprite->data[1] += 16;
    sprite->y2 += sprite->data[1] >> 8;

    if (++sprite->data[2] % 3 == 0)
    {
        CreateSpriteAndAnimate(
            &gSpriteTemplate_8402500,
            sprite->x + sprite->x2,
            sprite->y + sprite->y2,
            sprite->subpriority + 1);
    }

    newX = sprite->x + sprite->x2 + 32;
    if (newX > 304)
        DestroyAnimSprite(sprite);
}

static void sub_812D588(struct Sprite *sprite)
{
    u8 rand;
    s8 y;

    rand = Random() & 3;
    if (rand == 0)
        sprite->oam.tileNum += 4;
    else
        sprite->oam.tileNum += 5;

    y = Random() & 7;
    if (y > 3)
        y = -y;

    sprite->y2 = y;
    sprite->callback = sub_812D5E8;
}

static void sub_812D5E8(struct Sprite *sprite)
{
    if (++sprite->data[0] < 30)
    {
        if (++sprite->data[1] == 2)
        {
            sprite->invisible ^= 1;
            sprite->data[1] = 0;
        }
    }
    else
    {
        if (sprite->data[1] == 2)
            sprite->invisible = FALSE;

        if (sprite->data[1] == 3)
        {
            sprite->invisible = TRUE;
            sprite->data[1] = -1;
        }

        sprite->data[1]++;
    }

    if (sprite->data[0] > 60)
        DestroySprite(sprite);
}

void sub_812D674(u8 taskId)
{
    if (gTasks[taskId].data[0] == 0)
    {
        PrepareAffineAnimInTaskData(&gTasks[taskId], GetAnimBattlerSpriteId(0), &gUnknown_08402518);
        gTasks[taskId].data[0]++;
    }
    else
    {
        if (RunAffineAnimFromTaskData(&gTasks[taskId]) == 0)
            DestroyAnimVisualTask(taskId);
    }
}

void sub_812D6CC(u8 taskId)
{
    if (gTasks[taskId].data[0] == 0)
    {
        PrepareAffineAnimInTaskData(&gTasks[taskId], GetAnimBattlerSpriteId(0), &gUnknown_08402540);
        gTasks[taskId].data[0]++;
    }
    else
    {
        if (RunAffineAnimFromTaskData(&gTasks[taskId]) == 0)
            DestroyAnimVisualTask(taskId);
    }
}

static void sub_812D724(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        InitAnimSpritePos(sprite, 0);
        sprite->data[1] = 0x900;
        sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
        sprite->data[0]++;
        break;
    case 1:
        sprite->y2 -= sprite->data[1] >> 8;
        sprite->data[1] -= 96;
        if (sprite->y + sprite->y2 > sprite->data[2])
            DestroyAnimSprite(sprite);
        break;
    }
}

void sub_812D790(u8 taskId)
{
    if (gTasks[taskId].data[0] == 0)
    {
        PrepareAffineAnimInTaskData(&gTasks[taskId], GetAnimBattlerSpriteId(0), &gUnknown_08402590);
        gTasks[taskId].data[0]++;
    }
    else
    {
        if (RunAffineAnimFromTaskData(&gTasks[taskId]) == 0)
            DestroyAnimVisualTask(taskId);
    }
}

void sub_812D7E8(u8 taskId)
{
    int i, j;
    u8 position;
    struct Struct_sub_8078914 subStruct;
    u8 *dest;
    u8 *src;
    u16 *field_4;
    u16 *ptr;
    u16 stretch;

    switch (gTasks[taskId].data[0])
    {
    case 0:
        REG_MOSAIC = 0;
        if (GetBattlerPosition_permutated(gBattleAnimAttacker) == 1)
            REG_BG1CNT_BITFIELD.mosaic = 1;
        else
            REG_BG2CNT_BITFIELD.mosaic = 1;

        gTasks[taskId].data[10] = gBattleAnimArgs[0];
        gTasks[taskId].data[0]++;
        break;
    case 1:
        if (gTasks[taskId].data[2]++ > 1)
        {
            gTasks[taskId].data[2] = 0;
            gTasks[taskId].data[1]++;
            stretch = gTasks[taskId].data[1];
            REG_MOSAIC = (stretch << 4) | stretch;
            if (stretch == 15)
                gTasks[taskId].data[0]++;
        }
        break;
    case 2:
        sub_8031FC4(gBattleAnimAttacker, gBattleAnimTarget, gTasks[taskId].data[10]);
        sub_8078954(&subStruct, gBattleAnimAttacker);

        if (IsContest())
            position = 0;
        else
            position = GetBattlerPosition(gBattleAnimAttacker);

        dest = gMonSpriteGfx_Sprite_ptr[position] + (gBattleMonForms[gBattleAnimAttacker] << 11);
        src = subStruct.field_0;
        DmaCopy32(3, dest, src, 0x800);

        if (IsContest())
        {
            if (IsSpeciesNotUnown(EWRAM_19348[0]) != IsSpeciesNotUnown(EWRAM_19348[1]))
            {
                field_4 = (u16 *)subStruct.field_4;
                for (i = 0; i < 8; i++)
                {
                    for (j = 0; j < 4; j++)
                    {
                        u16 temp = field_4[j + i * 0x20];
                        field_4[j + i * 0x20] = field_4[(7 - j) + i * 0x20];
                        field_4[(7 - j) + i * 0x20] = temp;
                    }
                }

                for (i = 0; i < 8; i++)
                {
                    for (j = 0; j < 8; j++)
                    {
                       field_4[j + i * 0x20] ^= 0x400;
                    }
                }
            }

            ptr = EWRAM_19348;
            if (IsSpeciesNotUnown(ptr[1]))
                gSprites[gBattlerSpriteIds[gBattleAnimAttacker]].affineAnims =
                    gAffineAnims_BattleSpriteContest;
            else
                gSprites[gBattlerSpriteIds[gBattleAnimAttacker]].affineAnims =
                    gAffineAnims_BattleSpriteOpponentSide;

            StartSpriteAffineAnim(&gSprites[gBattlerSpriteIds[gBattleAnimAttacker]], 0);
        }

        gTasks[taskId].data[0]++;
        break;
    case 3:
        if (gTasks[taskId].data[2]++ > 1)
        {
            gTasks[taskId].data[2] = 0;
            gTasks[taskId].data[1]--;
            stretch = gTasks[taskId].data[1];
            REG_MOSAIC = (stretch << 4) | stretch;

            if (stretch == 0)
                gTasks[taskId].data[0]++;
        }
        break;
    case 4:
        REG_MOSAIC = 0;
        if (GetBattlerPosition_permutated(gBattleAnimAttacker) == 1)
            REG_BG1CNT_BITFIELD.mosaic = 0;
        else
            REG_BG2CNT_BITFIELD.mosaic = 0;

        if (!IsContest())
        {
            if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_OPPONENT)
            {
                if (gTasks[taskId].data[10] == 0)
                    sub_8032984(gBattleAnimAttacker, gBattleSpriteInfo[gBattleAnimAttacker].transformedSpecies);
            }
        }

        DestroyAnimVisualTask(taskId);
        break;
    }
}

void c3_80DFBE4(u8 taskId)
{
    gBattleAnimArgs[7] = gSprites[gBattlerSpriteIds[gBattleAnimAttacker]].invisible;
    DestroyAnimVisualTask(taskId);
}

void sub_812DB58(u8 taskId)
{
    sub_8031FC4(gBattleAnimAttacker, gBattleAnimTarget, 1);
    DestroyAnimVisualTask(taskId);
}

void sub_812DB84(u8 taskId)
{
    struct Struct_sub_8078914 subStruct;

    switch (gTasks[taskId].data[0])
    {
    case 0:
        REG_BLDCNT = BLDCNT_TGT2_BD | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1
                   | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT1_BG1;
        REG_BLDALPHA = 0x1000;
        REG_BG1CNT_BITFIELD.screenSize = 0;
        REG_BG1CNT_BITFIELD.priority = 1;
        if (!IsContest())
            REG_BG1CNT_BITFIELD.charBaseBlock = 1;

        sub_8078914(&subStruct);
        DmaClear32(3, subStruct.field_4, 0x1000);
        LZDecompressVram(gUnknown_08D2AA98, subStruct.field_4);
        LZDecompressVram(gUnknown_08D2A9E0, subStruct.field_0);
        LoadCompressedPalette(gUnknown_08D2AA80, subStruct.field_8 * 16, 32);
        if (IsContest())
        {
            sub_80763FC(subStruct.field_8, (u16 *)subStruct.field_4, 0, 0);
            gBattle_BG1_X = -56;
            gBattle_BG1_Y = 0;
        }
        else
        {
            if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
                gBattle_BG1_X = -135;
            else
                gBattle_BG1_X = -10;

            gBattle_BG1_Y = 0;
        }

        gTasks[taskId].data[10] = gBattle_BG1_X;
        gTasks[taskId].data[11] = gBattle_BG1_Y;

        gTasks[taskId].data[0]++;
        PlaySE12WithPanning(SE_M_MORNING_SUN, BattleAnimAdjustPanning(SOUND_PAN_ATTACKER_NEG));
        break;
    case 1:
        if (gTasks[taskId].data[4]++ > 0)
        {
            gTasks[taskId].data[4] = 0;
            if (++gTasks[taskId].data[1] > 12)
                gTasks[taskId].data[1] = 12;
            
            REG_BLDALPHA = ((16 - gTasks[taskId].data[1]) << 8) | gTasks[taskId].data[1];

            if (gTasks[taskId].data[1] == 12)
                gTasks[taskId].data[0]++;
        }
        break;
    case 2:
        if (--gTasks[taskId].data[1] < 0)
            gTasks[taskId].data[1] = 0;

        REG_BLDALPHA = ((16 - gTasks[taskId].data[1]) << 8) | gTasks[taskId].data[1];

        if (gTasks[taskId].data[1] == 0)
        {
            gBattle_BG1_X = gUnknown_084025C0[gTasks[taskId].data[2]] + gTasks[taskId].data[10];
            if (++gTasks[taskId].data[2] == 4)
                gTasks[taskId].data[0] = 4;
            else
                gTasks[taskId].data[0] = 3;
        }
        break;
    case 3:
        if (++gTasks[taskId].data[3] == 4)
        {
            gTasks[taskId].data[3] = 0;
            gTasks[taskId].data[0] = 1;
            PlaySE12WithPanning(SE_M_MORNING_SUN, BattleAnimAdjustPanning(SOUND_PAN_ATTACKER_NEG));
        }
        break;
    case 4:
        sub_8078914(&subStruct);
        DmaFill32Large(3, 0, subStruct.field_0, 0x2000, 0x1000);
        DmaClear32(3, subStruct.field_4, 0x800);

        if (!IsContest())
            REG_BG1CNT_BITFIELD.charBaseBlock = 0;

        REG_BG1CNT_BITFIELD.priority = 1;
        gBattle_BG1_X = 0;
        gBattle_BG1_Y = 0;
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        DestroyAnimVisualTask(taskId);
        break;
    }
}

static void sub_812DEAC(struct Sprite *sprite)
{
    s16 var0;
    u8 spriteId1;
    u8 spriteId2;

    var0 = Random();
    var0 &= 0x3F;
    if (var0 > 31)
        var0 = 32 - var0;
    
    sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, 0) + var0;
    sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, 1) + 32;
    sprite->data[1] = gBattleAnimArgs[0];
    sprite->data[2] = gBattleAnimArgs[1];

    spriteId1 = CreateSprite(&gBattleAnimSpriteTemplate_84025EC, sprite->x, sprite->y, sprite->subpriority + 1);
    spriteId2 = CreateSprite(&gBattleAnimSpriteTemplate_84025EC, sprite->x, sprite->y, sprite->subpriority + 1);
    StartSpriteAnim(&gSprites[spriteId1], 1);
    StartSpriteAnim(&gSprites[spriteId2], 2);

    gSprites[spriteId1].data[1] = gBattleAnimArgs[0];
    gSprites[spriteId1].data[2] = gBattleAnimArgs[1];
    gSprites[spriteId2].data[1] = gBattleAnimArgs[0];
    gSprites[spriteId2].data[2] = gBattleAnimArgs[1];
    gSprites[spriteId1].data[7] = -1;
    gSprites[spriteId2].data[7] = -1;
    gSprites[spriteId1].invisible = TRUE;
    gSprites[spriteId2].invisible = TRUE;
    gSprites[spriteId1].callback = sub_812E0F8;
    gSprites[spriteId2].callback = sub_812E0F8;

    sprite->data[6] = spriteId1;
    sprite->data[7] = spriteId2;
    sprite->callback = sub_812DFEC;
}

static void sub_812DFEC(struct Sprite *sprite)
{
    int var0;
    s8 var1;
    
    var0 = (u16)sprite->data[2] + (u16)sprite->data[3];
    var1 = var0 >> 8;
    sprite->y2 -= var1;
    sprite->data[3] = var0 & 0xFF;
    if (sprite->data[4] == 0 && sprite->y2 < -8)
    {
        gSprites[sprite->data[6]].invisible = FALSE;
        sprite->data[4]++;
    }

    if (sprite->data[4] == 1 && sprite->y2 < -16)
    {
        gSprites[sprite->data[7]].invisible = FALSE;
        sprite->data[4]++;
    }

    if (--sprite->data[1] == -1)
    {
        sprite->invisible = TRUE;
        sprite->callback = sub_812E09C;
    }
}

static void sub_812E09C(struct Sprite *sprite)
{
    if (gSprites[sprite->data[6]].callback == SpriteCallbackDummy
     && gSprites[sprite->data[7]].callback == SpriteCallbackDummy)
    {
        DestroySprite(&gSprites[sprite->data[6]]);
        DestroySprite(&gSprites[sprite->data[7]]);
        DestroyAnimSprite(sprite);
    }
}

static void sub_812E0F8(struct Sprite *sprite)
{
    if (sprite->invisible)
        return;

    sprite->data[3] += sprite->data[2];
    sprite->y2 -= sprite->data[3] >> 8;
    sprite->data[3] &= 0xFF;
    if (sprite->data[1]-- == 0)
    {
        sprite->invisible = TRUE;
        sprite->callback = SpriteCallbackDummy;
    }
}

void sub_812E14C(u8 taskId)
{
    struct Struct_sub_8078914 subStruct;

    switch (gTasks[taskId].data[0])
    {
    case 0:
        REG_BLDCNT = BLDCNT_TGT2_BD | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1
                   | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT1_BG1;
        REG_BLDALPHA = 0xD03;
        REG_BG1CNT_BITFIELD.screenSize = 0;
        REG_BG1CNT_BITFIELD.priority = 1;

        if (!IsContest())
            REG_BG1CNT_BITFIELD.charBaseBlock = 1;

        sub_8078914(&subStruct);
        DmaClear32(3, subStruct.field_4, 0x1000);
        LZDecompressVram(gUnknown_08D2AA98, subStruct.field_4);
        LZDecompressVram(gUnknown_08D2A9E0, subStruct.field_0);
        LoadCompressedPalette(gUnknown_08D2AA80, subStruct.field_8 * 16, 32);

        if (IsContest())
        {
            sub_80763FC(subStruct.field_8, (u16 *)subStruct.field_4, 0, 0);
            gBattle_BG1_X = -56;
            gBattle_BG1_Y = 0;
        }
        else
        {
            u8 position = GetBattlerPosition(gBattleAnimTarget);
            if (IsDoubleBattle() == TRUE)
            {
                if (position == B_POSITION_OPPONENT_LEFT)
                    gBattle_BG1_X = -155;
                if (position == B_POSITION_OPPONENT_RIGHT)
                    gBattle_BG1_X = -115;
                if (position == B_POSITION_PLAYER_LEFT)
                    gBattle_BG1_X = 14;
                if (position == B_POSITION_PLAYER_RIGHT)
                    gBattle_BG1_X = -20;
            }
            else
            {
                if (position == B_POSITION_OPPONENT_LEFT)
                    gBattle_BG1_X = -135;
                if (position == B_POSITION_PLAYER_LEFT)
                    gBattle_BG1_X = -10;
            }

            gBattle_BG1_Y = 0;
        }

        gTasks[taskId].data[10] = gBattle_BG1_X;
        gTasks[taskId].data[11] = gBattle_BG1_Y;
        gTasks[taskId].data[0]++;
        break;
    case 1:
        gTasks[taskId].data[3] = 0;
        if (GetBattlerSide(gBattleAnimTarget) == B_SIDE_OPPONENT)
            gBattle_BG1_X = gTasks[taskId].data[10] + gUnknown_08402604[gTasks[taskId].data[2]];
        else
            gBattle_BG1_X = gTasks[taskId].data[10] - gUnknown_08402604[gTasks[taskId].data[2]];

        if (++gTasks[taskId].data[2] == 5)
            gTasks[taskId].data[0] = 5;
        else
            gTasks[taskId].data[0]++;
        break;
    case 2:
        if (--gTasks[taskId].data[1] <= 4)
            gTasks[taskId].data[1] = 5;

        REG_BLDALPHA = (gTasks[taskId].data[1] << 8) | 3;
        if (gTasks[taskId].data[1] == 5)
            gTasks[taskId].data[0]++;
        break;
    case 3:
        if (++gTasks[taskId].data[3] > gUnknown_08402608[gTasks[taskId].data[2]])
            gTasks[taskId].data[0]++;
        break;
    case 4:
        if (++gTasks[taskId].data[1] > 13)
            gTasks[taskId].data[1] = 13;

        REG_BLDALPHA = (gTasks[taskId].data[1] << 8) | 3;
        if (gTasks[taskId].data[1] == 13)
            gTasks[taskId].data[0] = 1;
        break;
    case 5:
        sub_8078914(&subStruct);
        DmaClear32(3, subStruct.field_4, 0x800);

        if (!IsContest())
            REG_BG1CNT_BITFIELD.charBaseBlock = 0;
        
        REG_BG1CNT_BITFIELD.priority = 1;
        gBattle_BG1_X = 0;
        gBattle_BG1_Y = 0;
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_812E498(u8 taskId)
{
    if (gTasks[taskId].data[0] == 0)
    {
        PrepareAffineAnimInTaskData(&gTasks[taskId], GetAnimBattlerSpriteId(0), &gUnknown_08402610);
        gTasks[taskId].data[0]++;
    }
    else
    {
        if (!RunAffineAnimFromTaskData(&gTasks[taskId]))
        {
            DestroyAnimVisualTask(taskId);
        }
    }
}

static void sub_812E4F0(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        InitAnimSpritePos(sprite, 0);
        sprite->data[0]++;
    }
    else if (sprite->data[0]++ > 20)
    {
        sprite->data[1] += 160;
        sprite->data[2] += 128;

        if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
            sprite->x2 = -(sprite->data[1] >> 8);
        else
            sprite->x2 = sprite->data[1] >> 8;

        sprite->y2 += sprite->data[2] >> 8;
        if (sprite->y2 > 64)
            DestroyAnimSprite(sprite);
    }
}

void sub_812E568(u8 taskId)
{
    u8 side;
    struct Task *task = &gTasks[taskId];

    if (gBattleAnimArgs[1] == 0)
    {
        DestroyAnimVisualTask(taskId);
        return;
    }

    if (gBattleAnimArgs[2] < 0)
        gBattleAnimArgs[2] = 0;
    if (gBattleAnimArgs[2] > 2)
        gBattleAnimArgs[2] = 2;

    task->data[0] = 0;
    task->data[1] = 0;
    task->data[2] = 0;
    task->data[3] = 8 - (2 * gBattleAnimArgs[2]);
    task->data[4] = 0x100 + (gBattleAnimArgs[2] * 128);
    task->data[5] = gBattleAnimArgs[2] + 2;
    task->data[6] = gBattleAnimArgs[1] - 1;
    task->data[15] = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);

    if (gBattleAnimArgs[0] == 0)
        side = GetBattlerSide(gBattleAnimAttacker);
    else
        side = GetBattlerSide(gBattleAnimTarget);

    if (side == B_SIDE_OPPONENT)
    {
        task->data[4] *= -1;
        task->data[5] *= -1;
    }

    PrepareBattlerSpriteForRotScale(task->data[15], 0);
    task->func = sub_812E638;
}

static void sub_812E638(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        gSprites[task->data[15]].x2 += task->data[5];
        task->data[2] -= task->data[4];
        obj_id_set_rotscale(task->data[15], 0x100, 0x100, task->data[2]);
        sub_8078F9C(task->data[15]);
        if (++task->data[1] >= task->data[3])
        {
            task->data[1] = 0;
            task->data[0]++;
        }
        break;
    case 1:
        gSprites[task->data[15]].x2 -= task->data[5];
        task->data[2] += task->data[4];
        obj_id_set_rotscale(task->data[15], 0x100, 0x100, task->data[2]);
        sub_8078F9C(task->data[15]);
        if (++task->data[1] >= task->data[3] * 2)
        {
            task->data[1] = 0;
            task->data[0]++;
        }
        break;
    case 2:
        gSprites[task->data[15]].x2 += task->data[5];
        task->data[2] -= task->data[4];
        obj_id_set_rotscale(task->data[15], 0x100, 0x100, task->data[2]);
        sub_8078F9C(task->data[15]);
        if (++task->data[1] >= task->data[3])
        {
            if (task->data[6])
            {
                task->data[6]--;
                task->data[1] = 0;
                task->data[0] = 0;
            }
            else
            {
                task->data[0]++;
            }
        }
        break;
    case 3:
        sub_8078F40(task->data[15]);
        DestroyAnimVisualTask(taskId);
        break;
    }
}

static void sub_812E7A0(struct Sprite *sprite)
{
    if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER)
    {
        sprite->x = 0;
        sprite->y = gBattleAnimArgs[0];
    }
    else
    {
        sprite->x = 240;
        sprite->y = gBattleAnimArgs[0] - 30;
    }

    sprite->data[2] = gBattleAnimArgs[2];
    StartSpriteAnim(sprite, gBattleAnimArgs[1]);
    sprite->callback = sub_812E7F0;
}

static void sub_812E7F0(struct Sprite *sprite)
{
    sprite->data[0] += 3;
    if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER)
    {
        sprite->x += 5;
        sprite->y -= 1;

        if (sprite->x > 240)
            DestroyAnimSprite(sprite);

        sprite->y2 = Sin(sprite->data[0] & 0xFF, 16);
    }
    else
    {
        sprite->x -= 5;
        sprite->y += 1;

        if (sprite->x < 0)
            DestroyAnimSprite(sprite);

        sprite->y2 = Cos(sprite->data[0] & 0xFF, 16);
    }
}

void sub_812E860(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    task->data[0] = 0;
    task->data[1] = 0;
    task->data[2] = 0;
    task->data[3] = 0;
    task->data[12] = 0x20;
    task->data[13] = 0x40;
    task->data[14] = 0x800;
    task->data[15] = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);

    PrepareBattlerSpriteForRotScale(task->data[15], 0);
    task->func = sub_812E8B4;
}

static void sub_812E8B4(u8 taskId)
{
    int temp;
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        task->data[2] += 0x200;
        if (task->data[2] >= task->data[14])
        {
            s16 diff = task->data[14] - task->data[2];
            s16 div = diff / (task->data[14] * 2);
            s16 mod = diff % (task->data[14] * 2);

            if ((div & 1) == 0)
            {
                task->data[2] = task->data[14] - mod;
                task->data[0] = 1;
            }
            else
            {
                task->data[2] = mod - task->data[14];
            }
        }
        break;
    case 1:
        task->data[2] -= 0x200;
        if (task->data[2] <= -task->data[14])
        {
            s16 diff = task->data[14] - task->data[2];
            s16 div = diff / (task->data[14] * 2);
            s16 mod = diff % (task->data[14] * 2);

            if ((1 & div) == 0)
            {
                task->data[2] = mod - task->data[14];
                task->data[0] = 0;
            }
            else
            {
                task->data[2] = task->data[14] - mod;
            }
        }
        break;
    case 2:
        sub_8078F40(task->data[15]);
        DestroyAnimVisualTask(taskId);
        return;
    }

    obj_id_set_rotscale(task->data[15], 0x100, 0x100, task->data[2]);
    sub_8078F9C(task->data[15]);
    gSprites[task->data[15]].x2 = -(((temp = task->data[2]) >= 0 ? task->data[2] : temp + 63) >> 6);
    
    if (++task->data[1] > 8)
    {
        if (task->data[12])
        {
            task->data[12]--;
            task->data[14] -= task->data[13];
            if (task->data[14] < 16)
                task->data[14] = 16;
        }
        else
        {
            task->data[0] = 2;
        }
    }
}

static void sub_812EA4C(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        if (gBattleAnimArgs[2] == 0)
        {
            sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
            sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
        }

        sprite->x += gBattleAnimArgs[0];
        sprite->y += gBattleAnimArgs[1];
        sprite->data[1] = 0x80;
        sprite->data[2] = 0x300;
        sprite->data[3] = gBattleAnimArgs[1];
        sprite->data[0]++;
    }
    else
    {
        sprite->x2 = sprite->data[1] >> 8;
        sprite->y2 += sprite->data[2] >> 8;
        if (sprite->data[4] == 0 && sprite->y2 > -sprite->data[3])
        {
            sprite->data[4] = 1;
            sprite->data[2] = (-sprite->data[2] / 3) * 2;
        }

        sprite->data[1] += 192;
        sprite->data[2] += 128;
        if (sprite->animEnded)
            DestroyAnimSprite(sprite);
    }
}

void sub_812EB10(u8 taskId)
{
    u8 spriteId;

    if (gTasks[taskId].data[0] == 0)
    {
        if (gBattleAnimArgs[0] == 0)
            gTasks[taskId].data[11] = gBattleAnimAttacker;
        else
            gTasks[taskId].data[11] = gBattleAnimTarget;

        spriteId = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);
        gTasks[taskId].data[10] = spriteId;
        PrepareBattlerSpriteForRotScale(spriteId, 0);

        switch (gBattleAnimArgs[1])
        {
        case 0:
            obj_id_set_rotscale(spriteId, 0xE0, 0x140, 0);
            sub_8079A64(spriteId);
            break;
        case 1:
            obj_id_set_rotscale(spriteId, 0xD0, 0x130, 0xF00);
            sub_8079A64(spriteId);
            if (IsContest() || GetBattlerSide(gTasks[taskId].data[11]) == B_SIDE_PLAYER)
                gSprites[spriteId].y2 += 16;
            break;
        case 2:
            obj_id_set_rotscale(spriteId, 0xD0, 0x130, 0xF100);
            sub_8079A64(spriteId);
            if (IsContest() || GetBattlerSide(gTasks[taskId].data[11]) == B_SIDE_PLAYER)
                gSprites[spriteId].y2 += 16;
            break;
        }

        gSprites[spriteId].x2 = 2;
        gTasks[taskId].data[0]++;
    }
    else
    {
        spriteId = gTasks[taskId].data[10];
        if (++gTasks[taskId].data[2] == 3)
        {
            gTasks[taskId].data[2] = 0;
            gSprites[spriteId].x2 = -gSprites[spriteId].x2;
        }

        if (++gTasks[taskId].data[1] == 13)
        {
            sub_8078F40(spriteId);
            gSprites[spriteId].x2 = 0;
            gSprites[spriteId].y2 = 0;
            DestroyAnimVisualTask(taskId);
        }
    }
}

static void sub_812EC78(struct Sprite *sprite)
{
    u8 tileOffset;
    int rand1;
    int rand2;

    tileOffset = Random() % 12;
    sprite->oam.tileNum += tileOffset;
    rand1 = Random() & 0x1FF;
    rand2 = Random() & 0xFF;

    if (rand1 & 1)
        sprite->data[0] = 0x5E0 + rand1;
    else
        sprite->data[0] = 0x5E0 - rand1;

    if (rand2 & 1)
        sprite->data[1] = 0x480 + rand2;
    else
        sprite->data[1] = 0x480 - rand2;

    sprite->data[2] = gBattleAnimArgs[0];
    if (sprite->data[2] == 0)
        sprite->x = -8;
    else
        sprite->x = 248;

    sprite->y = 104;
    sprite->callback = sub_812ED24;
}

static void sub_812ED24(struct Sprite *sprite)
{
    if (sprite->data[2] == 0)
    {
        sprite->x2 += sprite->data[0] >> 8;
        sprite->y2 -= sprite->data[1] >> 8;
    }
    else
    {
        sprite->x2 -= sprite->data[0] >> 8;
        sprite->y2 -= sprite->data[1] >> 8;
    }

    sprite->data[0] -= 22;
    sprite->data[1] -= 48;
    if (sprite->data[0] < 0)
        sprite->data[0] = 0;

    if (++sprite->data[3] == 31)
        DestroyAnimSprite(sprite);
}

static void sub_812ED84(struct Sprite *sprite)
{
    REG_WINOUT = 0x1F3F;
    REG_DISPCNT |= DISPCNT_OBJWIN_ON;
    gBattle_WIN0H = 0;
    gBattle_WIN0V = 0;
    REG_WIN0H = 0;
    REG_WIN0V = 0;

    sprite->data[0] = gBattleAnimArgs[2];
    sub_8078764(sprite, FALSE);
    sprite->oam.objMode = ST_OAM_OBJ_WINDOW;
    sprite->invisible = TRUE;
    sprite->callback = sub_812EE00;
}

static void sub_812EE00(struct Sprite *sprite)
{
    switch (sprite->data[1])
    {
    case 0:
        sprite->invisible = FALSE;
        if (sprite->affineAnimEnded)
            sprite->data[1]++;
        break;
    case 1:
        if (--sprite->data[0] == 0)
        {
            ChangeSpriteAffineAnim(sprite, 1);
            sprite->data[1]++;
        }
        break;
    case 2:
        if (sprite->affineAnimEnded)
        {
            sprite->invisible = TRUE;
            sprite->data[1]++;
        }
        break;
    case 3:
        REG_WINOUT = 0x3F3F;
        REG_DISPCNT ^= DISPCNT_OBJWIN_ON;
        DestroyAnimSprite(sprite);
        break;
    }
}

static void sub_812EEA4(struct Sprite *sprite)
{
    sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
    sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
    sprite->data[0] = gBattleAnimArgs[0];
    sprite->data[1] = gBattleAnimArgs[1];
    sprite->callback = sub_812EEEC;
    sprite->callback(sprite);
}

static void sub_812EEEC(struct Sprite *sprite)
{
    sprite->x2 = Sin(sprite->data[1], sprite->data[2] >> 8);
    sprite->y2 = Cos(sprite->data[1], sprite->data[3] >> 8);
    sprite->data[1] = (sprite->data[1] + 9) & 0xFF;

    if ((u16)sprite->data[1] < 64 || sprite->data[1] > 195)
        sprite->subpriority = GetBattlerSubpriority(gBattleAnimAttacker) - 1;
    else
        sprite->subpriority = GetBattlerSubpriority(gBattleAnimAttacker) + 1;

    if (sprite->data[5] == 0)
    {
        sprite->data[2] += 0x400;
        sprite->data[3] += 0x100;
        sprite->data[4]++;
        if (sprite->data[4] == sprite->data[0])
        {
            sprite->data[4] = 0;
            sprite->data[5] = 1;
        }
    }
    else if (sprite->data[5] == 1)
    {
        sprite->data[2] -= 0x400;
        sprite->data[3] -= 0x100;
        sprite->data[4]++;
        if (sprite->data[4] == sprite->data[0])
            DestroyAnimSprite(sprite);
    }
}

// Copies the target mon's sprite, and makes a white silhouette that shrinks away.
void AnimTask_RolePlaySilhouette(u8 taskId)
{
    u8 isBackPic;
    u32 personality;
    u32 otId;
    u16 species;
    s16 xOffset;
    u32 priority;
    u8 spriteId;
    s16 coord1, coord2;

    GetAnimBattlerSpriteId(ANIM_BATTLER_ATTACKER);
    if (IsContest())
    {
        isBackPic = 1;
        personality = eWRAM_19348Struct->personality;
        otId = eWRAM_19348Struct->otId;
        species = eWRAM_19348Struct->species;
        xOffset = 20;
        priority = GetBattlerSpriteBGPriority(gBattleAnimAttacker);
    }
    else
    {
        if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        {
            isBackPic = 0;
            personality = GetMonData(&gPlayerParty[gBattlerPartyIndexes[gBattleAnimTarget]], MON_DATA_PERSONALITY);
            otId = GetMonData(&gPlayerParty[gBattlerPartyIndexes[gBattleAnimTarget]], MON_DATA_OT_ID);
            if (gBattleSpriteInfo[gBattleAnimTarget].transformedSpecies == SPECIES_NONE)
            {
                if (GetBattlerSide(gBattleAnimTarget) == B_SIDE_PLAYER)
                    species = GetMonData(&gPlayerParty[gBattlerPartyIndexes[gBattleAnimTarget]], MON_DATA_SPECIES);
                else
                    species = GetMonData(&gEnemyParty[gBattlerPartyIndexes[gBattleAnimTarget]], MON_DATA_SPECIES);
            }
            else
            {
                species = gBattleSpriteInfo[gBattleAnimTarget].transformedSpecies;
            }

            xOffset = 20;
            priority = GetBattlerSpriteBGPriority(gBattleAnimAttacker);
        }
        else
        {
            isBackPic = 1;
            personality = GetMonData(&gEnemyParty[gBattlerPartyIndexes[gBattleAnimTarget]], MON_DATA_PERSONALITY);
            otId = GetMonData(&gEnemyParty[gBattlerPartyIndexes[gBattleAnimTarget]], MON_DATA_OT_ID);
            if (gBattleSpriteInfo[gBattleAnimTarget].transformedSpecies == SPECIES_NONE)
            {
                if (GetBattlerSide(gBattleAnimTarget) == B_SIDE_PLAYER)
                    species = GetMonData(&gPlayerParty[gBattlerPartyIndexes[gBattleAnimTarget]], MON_DATA_SPECIES);
                else
                    species = GetMonData(&gEnemyParty[gBattlerPartyIndexes[gBattleAnimTarget]], MON_DATA_SPECIES);
            }
            else
            {
                species = gBattleSpriteInfo[gBattleAnimTarget].transformedSpecies;
            }

            xOffset = -20;
            priority = GetBattlerSpriteBGPriority(gBattleAnimAttacker);
        }
    }

    coord1 = GetBattlerSpriteCoord(gBattleAnimAttacker, 0);
    coord2 = GetBattlerSpriteCoord(gBattleAnimAttacker, 1);
    spriteId = sub_8079F44(species, isBackPic, 0, coord1 + xOffset, coord2, 5, personality, otId);

    gSprites[spriteId].oam.priority = priority;
    gSprites[spriteId].oam.objMode = ST_OAM_OBJ_BLEND;
    FillPalette(RGB_WHITE, (gSprites[spriteId].oam.paletteNum << 4) + 0x100, 32);
    gSprites[spriteId].oam.priority = priority;
    REG_BLDCNT = BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_ALL;
    REG_BLDALPHA = BLDALPHA_BLEND(gTasks[taskId].data[1], 16 - gTasks[taskId].data[1]);

    gTasks[taskId].data[0] = spriteId;
    gTasks[taskId].func = AnimTask_RolePlaySilhouetteStep1;
}

static void AnimTask_RolePlaySilhouetteStep1(u8 taskId)
{
    if (gTasks[taskId].data[10]++ > 1)
    {
        gTasks[taskId].data[10] = 0;
        gTasks[taskId].data[1]++;
        REG_BLDALPHA = ((16 - gTasks[taskId].data[1]) << 8) | gTasks[taskId].data[1];
        if (gTasks[taskId].data[1] == 10)
        {
            gTasks[taskId].data[10] = 256;
            gTasks[taskId].data[11] = 256;
            gTasks[taskId].func = sub_812F290;
        }
    }
}

static void sub_812F290(u8 taskId)
{
    u8 spriteId = gTasks[taskId].data[0];
    gTasks[taskId].data[10] -= 16;
    gTasks[taskId].data[11] += 128;
    gSprites[spriteId].oam.affineMode |= 2;
    sub_8078FDC(&gSprites[spriteId], 1, gTasks[taskId].data[10], gTasks[taskId].data[11], 0);
    if (++gTasks[taskId].data[12] == 9)
    {
        sub_8079098(&gSprites[spriteId]);
        DestroySpriteAndFreeResources_(&gSprites[spriteId]);
        gTasks[taskId].func = sub_8078634;
    }
}

void sub_812F314(u8 taskId)
{
    u8 battler;
    u16 bgX, bgY;
    s16 y, i;
    struct ScanlineEffectParams scanlineParams;
    struct Task *task = &gTasks[taskId];

    if (gBattleAnimArgs[0] == 0)
        battler = gBattleAnimAttacker;
    else
        battler = gBattleAnimTarget;

    task->data[0] = 0;
    task->data[1] = 0;
    task->data[2] = 0;
    task->data[3] = 16;
    task->data[4] = 0;
    task->data[5] = battler;
    task->data[6] = 32;
    task->data[7] = 0;
    task->data[8] = 24;

    if (GetBattlerSide(battler) == B_SIDE_OPPONENT)
        task->data[8] *= -1;

    task->data[13] = sub_8077FC0(battler) - 34;
    if (task->data[13] < 0)
        task->data[13] = 0;

    task->data[14] = task->data[13] + 66;
    task->data[15] = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);
    if (GetBattlerPosition_permutated(battler) == 1)
    {
        scanlineParams.dmaDest = &REG_BG1HOFS;
        REG_BLDCNT = 0x3F42;
        bgX = gBattle_BG1_X;
        bgY = gBattle_BG1_Y;
    }
    else
    {
        scanlineParams.dmaDest = &REG_BG2HOFS;
        REG_BLDCNT = 0x3F44;
        bgX = gBattle_BG2_X;
        bgY = gBattle_BG2_Y;
    }

    for (y = 0, i = 0; y < 160; y++, i += 2)
    {
        gScanlineEffectRegBuffers[0][i] = bgX;
        gScanlineEffectRegBuffers[1][i] = bgX;
        gScanlineEffectRegBuffers[0][i + 1] = bgY;
        gScanlineEffectRegBuffers[1][i + 1] = bgY;
    }

    scanlineParams.dmaControl = 0xA6600001;
    scanlineParams.initState = 1;
    scanlineParams.unused9 = 0;
    ScanlineEffect_SetParams(scanlineParams);
    task->func = sub_812F474;
}

static void sub_812F474(u8 taskId)
{
    struct Task *task;
    s16 var1;
    s16 var2;
    s16 bgX, bgY;
    s16 offset;
    s16 var0;
    s16 i;
    s16 sineIndex;
    s16 var3;

    task = &gTasks[taskId];
    if (GetBattlerPosition_permutated(task->data[5]) == 1)
    {
        bgX = gBattle_BG1_X;
        bgY = gBattle_BG1_Y;
    }
    else
    {
        bgX = gBattle_BG2_X;
        bgY = gBattle_BG2_Y;
    }

    switch (task->data[0])
    {
    case 0:
        offset = task->data[14] * 2;
        var1 = 0;
        var2 = 0;
        i = 0;
        task->data[1] = (task->data[1] + 2) & 0xFF;
        sineIndex = task->data[1];
        task->data[9] = 0x7E0 / task->data[6];
        task->data[10] = -((task->data[7] * 2) / task->data[9]);
        task->data[11] = task->data[7];
        var3 = task->data[11] >> 5;
        task->data[12] = var3;
        var0 = task->data[14];
        while (var0 > task->data[13])
        {
            gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][offset + 1] = (i - var2) + bgY;
            gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][offset] = bgX + var3 + (gSineTable[sineIndex] >> 5);
            sineIndex = (sineIndex + 10) & 0xFF;
            task->data[11] += task->data[10];
            var3 = task->data[11] >> 5;
            task->data[12] = var3;

            i++;
            offset -= 2;
            var1 += task->data[6];
            var2 = var1 >> 5;
            var0--;
        }

        var0 *= 2;
        while (var0 >= 0)
        {
            gScanlineEffectRegBuffers[0][var0] = bgX + 240;
            gScanlineEffectRegBuffers[1][var0] = bgX + 240;
            var0 -= 2;
        }

        if (++task->data[6] > 63)
        {
            task->data[6] = 64;
            task->data[2]++;
            if (task->data[2] & 1)
                task->data[3]--;
            else
                task->data[4]++;

            REG_BLDALPHA = (task->data[4] << 8) | task->data[3];
            if (task->data[3] == 0 && task->data[4] == 16)
            {
                task->data[2] = 0;
                task->data[3] = 0;
                task->data[0]++;
            }
        }
        else
        {
            task->data[7] += task->data[8];
        }
        break;
    case 1:
        if (++task->data[2] > 12)
        {
            gScanlineEffect.state = 3;
            task->data[2] = 0;
            task->data[0]++;
        }
        break;
    case 2:
        task->data[2]++;
        if (task->data[2] & 1)
            task->data[3]++;
        else
            task->data[4]--;

        REG_BLDALPHA = (task->data[4] << 8) | task->data[3];
        if (task->data[3] == 16 && task->data[4] == 0)
        {
            task->data[2] = 0;
            task->data[3] = 0;
            task->data[0]++;
        }
        break;
    case 3:
        DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_812F724(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    task->data[0] = 0;
    task->data[15] = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);
    PrepareAffineAnimInTaskData(&gTasks[taskId], task->data[15], &gUnknown_08402750);
    task->func = sub_812F76C;
}

static void sub_812F76C(u8 taskId)
{
    u16 var0;

    struct Task *task = &gTasks[taskId];
    var0 = task->data[0];
    task->data[0]++;
    var0 -= 20;
    if (var0 < 23)
    {
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;
            task->data[2]++;
            if (task->data[2] & 1)
                gSprites[task->data[15]].x2 = 1;
            else
                gSprites[task->data[15]].x2 = -1;
        }
    }
    else
    {
        gSprites[task->data[15]].x2 = 0;
    }

    if (!RunAffineAnimFromTaskData(&gTasks[taskId]))
        DestroyAnimVisualTask(taskId);
}

static void sub_812F804(struct Sprite *sprite, s16 b, s16 c, s16 d, s16 e, u16 f)
{
    sprite->x = b;
    sprite->y = c;
    sprite->data[4] = b << 4;
    sprite->data[5] = c << 4;
    sprite->data[6] = ((d - b) << 4) / f;
    sprite->data[7] = ((e - c) << 4) / f;
}

void sub_812F86C(struct Sprite *sprite)
{
    sprite->data[4] += sprite->data[6];
    sprite->data[5] += sprite->data[7];
    sprite->x = sprite->data[4] >> 4;
    sprite->y = sprite->data[5] >> 4;
}

static void sub_812F88C(struct Sprite *sprite)
{
    s16 x = sprite->x;
    s16 y = sprite->y;

    sub_8078650(sprite);
    StartSpriteAffineAnim(sprite, gBattleAnimArgs[0]);
    sub_812F804(sprite, sprite->x, sprite->y, x, y, 64);
    sprite->data[0] = 0;
    sprite->callback = sub_812F8DC;
}

static void sub_812F8DC(struct Sprite *sprite)
{
    int index;

    sprite->data[0]++;
    index = (sprite->data[0] * 8) & 0xFF;
    sub_812F86C(sprite);
    sprite->y2 = Sin(index, 8);
    if (sprite->data[0] > 58)
    {
        if (++sprite->data[1] > 1)
        {
            sprite->data[1] = 0;
            sprite->data[2]++;
            sprite->invisible = sprite->data[2] & 1;
            if (sprite->data[2] > 3)
                DestroySpriteAndMatrix(sprite);
        }
    }
}

static void sub_812F948(struct Sprite *sprite)
{
    sprite->data[0] = gBattleAnimArgs[3];
    StartSpriteAffineAnim(sprite, gBattleAnimArgs[0]);
    if (GetBattlerSide(gBattleAnimTarget) != B_SIDE_PLAYER)
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];

    sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2) + gBattleAnimArgs[1];
    sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, 3) + gBattleAnimArgs[2];
    sprite->callback = sub_80DA48C;
}

static void sub_812F9B0(u8 taskId)
{
    u16 var0 = 0;
    u16 var1 = 0;

    gTasks[taskId].data[0]--;
    if ((gTasks[taskId].data[6] & 0x8000) && (--gTasks[taskId].data[1] == -1))
    {
        if (gTasks[taskId].data[9] == 0)
        {
            gTasks[taskId].data[9] = gTasks[taskId].data[4];
            gTasks[taskId].data[4] = -gTasks[taskId].data[4];
        }
        else
        {
            gTasks[taskId].data[9] = 0;
        }

        if (gTasks[taskId].data[10] == 0)
        {
            gTasks[taskId].data[10] = gTasks[taskId].data[5];
            gTasks[taskId].data[5] = -gTasks[taskId].data[5];
        }
        else
        {
            gTasks[taskId].data[10] = 0;
        }

        gTasks[taskId].data[1] = gTasks[taskId].data[13];
    }

    var0 = gTasks[taskId].data[7];
    var1 = gTasks[taskId].data[8];
    if (gTasks[taskId].data[2] & 0x8000)
        gSprites[gTasks[taskId].data[15]].x2 = gTasks[taskId].data[9] - (var0 >> 8);
    else
        gSprites[gTasks[taskId].data[15]].x2 = gTasks[taskId].data[9] + (var0 >> 8);

    if (gTasks[taskId].data[3] & 0x8000)
        gSprites[gTasks[taskId].data[15]].y2 = gTasks[taskId].data[10] - (var1 >> 8);
    else
        gSprites[gTasks[taskId].data[15]].y2 = gTasks[taskId].data[10] + (var1 >> 8);

    if (gTasks[taskId].data[0] < 1)
    {
        DestroyTask(taskId);
        gAnimVisualTaskCount--;
    }
}

static void sub_812FAF8(u8 taskId)
{
    u16 var0 = 0;
    u16 var1 = 0;

    gTasks[taskId].data[0]--;
    if ((gTasks[taskId].data[6] & 0x8000) && (--gTasks[taskId].data[1] == -1))
    {
        if (gTasks[taskId].data[9] == 0)
        {
            gTasks[taskId].data[9] = gTasks[taskId].data[4];
            gTasks[taskId].data[4] = -gTasks[taskId].data[4];
        }
        else
        {
            gTasks[taskId].data[9] = var0;
        }

        if (gTasks[taskId].data[10] == 0)
        {
            gTasks[taskId].data[10] = gTasks[taskId].data[5];
            gTasks[taskId].data[5] = -gTasks[taskId].data[5];
        }
        else
        {
            gTasks[taskId].data[10] = 0;
        }

        gTasks[taskId].data[1] = gTasks[taskId].data[13];
    }

    var0 = (gTasks[taskId].data[2] & 0x7FFF) + gTasks[taskId].data[7];
    var1 = (gTasks[taskId].data[3] & 0x7FFF) + gTasks[taskId].data[8];
    if (gTasks[taskId].data[2] & 0x8000)
        gSprites[gTasks[taskId].data[15]].x2 = gTasks[taskId].data[9] - (var0 >> 8);
    else
        gSprites[gTasks[taskId].data[15]].x2 = gTasks[taskId].data[9] + (var0 >> 8);

    if (gTasks[taskId].data[3] & 0x8000)
        gSprites[gTasks[taskId].data[15]].y2 = gTasks[taskId].data[10] - (var1 >> 8);
    else
        gSprites[gTasks[taskId].data[15]].y2 = gTasks[taskId].data[10] + (var1 >> 8);

    gTasks[taskId].data[7] = var0;
    gTasks[taskId].data[8] = var1;
    if (gTasks[taskId].data[0] < 1)
    {
        gTasks[taskId].data[0] = 30;
        gTasks[taskId].data[13] = 0;
        gTasks[taskId].func = sub_812F9B0;
    }
}

void sub_812FC68(u8 taskId)
{
    gTasks[taskId].data[15] = gBattlerSpriteIds[gBattleAnimAttacker];
    gTasks[taskId].data[14] = gBattleAnimArgs[0];
    gTasks[taskId].data[0] = gBattleAnimArgs[0];
    gTasks[taskId].data[13] = gBattleAnimArgs[6];
    if (gBattleAnimArgs[3])
        gTasks[taskId].data[6] = gTasks[taskId].data[6] | -0x8000;

    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
    {
        gTasks[taskId].data[2] = gBattleAnimArgs[1];
        gTasks[taskId].data[3] = gBattleAnimArgs[2];
    }
    else
    {
        if (gBattleAnimArgs[1] & 0x8000)
            gTasks[taskId].data[2] = gBattleAnimArgs[1] & 0x7FFF;
        else
            gTasks[taskId].data[2] = gBattleAnimArgs[1] | -0x8000;

        if (gBattleAnimArgs[2] & 0x8000)
            gTasks[taskId].data[3] = gBattleAnimArgs[2] & 0x7FFF;
        else
            gTasks[taskId].data[3] = gBattleAnimArgs[2] | -0x8000;
    }

    gTasks[taskId].data[8] = 0;
    gTasks[taskId].data[7] = 0;
    gTasks[taskId].data[4] = gBattleAnimArgs[4];
    gTasks[taskId].data[5] = gBattleAnimArgs[5];
    gTasks[taskId].func = sub_812FAF8;
}

void sub_812FD7C(u8 taskId)
{
    u8 battler;
    struct Task *task = &gTasks[taskId];

    if (gBattleAnimArgs[1] == 0)
        DestroyAnimVisualTask(taskId);
    
    task->data[0] = 0;
    task->data[1] = 0;
    task->data[2] = 0;
    task->data[3] = gBattleAnimArgs[1];
    if (gBattleAnimArgs[0] == 0)
        battler = gBattleAnimAttacker;
    else
        battler = gBattleAnimTarget;

    task->data[4] = GetBattlerSpriteCoord(battler, 0);
    task->data[5] = GetBattlerSpriteCoord(battler, 1);
    task->data[6] = GetBattlerSubpriority(battler);
    task->data[15] = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);
    PrepareAffineAnimInTaskData(task, task->data[15], &gUnknown_084028AC);
    task->func = sub_812FE20;
}

static void sub_812FE20(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        if (++task->data[1] == 6)
            sub_812FEB8(taskId, TRUE);

        if (task->data[1] == 18)
            sub_812FEB8(taskId, FALSE);

        if (!RunAffineAnimFromTaskData(task))
        {
            if (--task->data[3] == 0)
            {
                task->data[0]++;
            }
            else
            {
                task->data[1] = 0;
                PrepareAffineAnimInTaskData(task, task->data[15], &gUnknown_084028AC);
            }
        }
        break;
    case 1:
        if (task->data[2] == 0)
            DestroyAnimVisualTask(taskId);
        break;
    }
}

static void sub_812FEB8(u8 taskId, bool8 arg1)
{
    u8 i;
    s8 xOffset, yOffset;
    struct Task *task;
    s16 xCoords[4];
    s16 yCoords[2];

    task = &gTasks[taskId];
    if (!arg1)
    {
        xOffset = 18;
        yOffset = -20;
    }
    else
    {
        xOffset = 30;
        yOffset = 20;
    }

    xCoords[0] = task->data[4] - xOffset;
    xCoords[1] = task->data[4] - xOffset - 4;
    xCoords[2] = task->data[4] + xOffset;
    xCoords[3] = task->data[4] + xOffset + 4;
    yCoords[0] = task->data[5] + yOffset;
    yCoords[1] = task->data[5] + yOffset + 6;

    for (i = 0; i < 4; i++)
    {
        u8 spriteId = CreateSprite(&gSpriteTemplate_84028CC, xCoords[i], yCoords[i & 1], task->data[6] - 5);
        if (spriteId != MAX_SPRITES)
        {
            gSprites[spriteId].data[0] = 0;
            gSprites[spriteId].data[1] = i < 2 ? -2 : 2;
            gSprites[spriteId].data[2] = -1;
            gSprites[spriteId].data[3] = taskId;
            gSprites[spriteId].data[4] = 2;
            task->data[2]++;
        }
    }
}

static void sub_812FF94(struct Sprite *sprite)
{
    sprite->x += sprite->data[1];
    sprite->y += sprite->data[2];
    if (++sprite->data[0] > 6)
    {
        gTasks[sprite->data[3]].data[sprite->data[4]]--;
        DestroySprite(sprite);
    }
}

void sub_812FFE4(u8 taskId)
{
    u8 spriteId;

    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = gBattleAnimArgs[1];
    spriteId = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);
    gTasks[taskId].data[2] = 0x100 + gSprites[spriteId].oam.paletteNum * 16;
    gTasks[taskId].func = sub_813003C;
}

static void sub_813003C(u8 taskId)
{
    if (gTasks[taskId].data[1])
    {
        BlendPalette(gTasks[taskId].data[2], 16, 8, gUnknown_084028E4[gTasks[taskId].data[0]]);
        if (++gTasks[taskId].data[0] > 23)
            gTasks[taskId].data[0] = 0;
        
        gTasks[taskId].data[1]--;
    }
    else
    {
        BlendPalette(gTasks[taskId].data[2], 16, 0, RGB(0, 0, 0));
        DestroyAnimVisualTask(taskId);
    }
}

void sub_81300A4(u8 taskId)
{
    sub_80E3C4C(
        taskId,
        0,
        0x1A0,
        gBattleAnimAttacker,
        gBattleAnimArgs[0],
        10,
        2,
        30,
        gUnknown_08D2E014,
        gUnknown_08D2E170,
        gUnknown_08D2E150);
}

static void sub_81300F4(struct Sprite *sprite)
{
    if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_OPPONENT)
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
    
    sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, 0) + gBattleAnimArgs[0];
    sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, 1) + gBattleAnimArgs[1];
    if (gBattleAnimArgs[2] == 0)
    {
        sprite->data[0] = 640;
        sprite->data[1] = -640;
    }
    else if (gBattleAnimArgs[2] == 1)
    {
        sprite->vFlip = 1;
        sprite->data[0] = 640;
        sprite->data[1] = 640;
    }
    else
    {
        StartSpriteAnim(sprite, 1);
        sprite->data[0] = 640;
    }

    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
    {
        sprite->data[0] = -sprite->data[0];
        sprite->hFlip = 1;
    }

    sprite->callback = sub_81301B4;
}

static void sub_81301B4(struct Sprite *sprite)
{
    sprite->data[6] += sprite->data[0];
    sprite->data[7] += sprite->data[1];
    sprite->x2 = sprite->data[6] >> 8;
    sprite->y2 = sprite->data[7] >> 8;
    if (++sprite->data[5] == 14)
        DestroyAnimSprite(sprite);
}

void sub_81301EC(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (IsContest())
    {
        task->data[5] = 8;
        task->data[6] = 3;
        task->data[7] = 1;
    }
    else
    {
        task->data[5] = 12;
        task->data[6] = 3;
        task->data[7] = 0;
    }

    if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER)
        task->data[11] = GetBattlerSpriteCoord(gBattleAnimAttacker, 2) + GetBattlerSpriteCoordAttr(gBattleAnimAttacker, 0) / 4;
    else
        task->data[11] = GetBattlerSpriteCoord(gBattleAnimAttacker, 2) - GetBattlerSpriteCoordAttr(gBattleAnimAttacker, 0) / 4;

    task->data[12] = GetBattlerSpriteCoord(gBattleAnimAttacker, 3) - GetBattlerSpriteCoordAttr(gBattleAnimAttacker, 0) / 4;
    task->data[13] = GetBattlerSpriteCoord(gBattleAnimTarget, 2);
    task->data[14] = GetBattlerSpriteCoord(gBattleAnimTarget, 3);
    task->func = sub_81302E4;
}

static void sub_81302E4(u8 taskId)
{
    u8 i;
    s16 x, y;
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        if (++task->data[1] > 3)
        {
            task->data[1] = 0;
            sub_8130424(
                task->data[11],
                task->data[12],
                task->data[13],
                task->data[14],
                task->data[5],
                task->data[2],
                &x,
                &y);

            for (i = 0; i < 2; i++)
            {
                u8 spriteId = CreateSprite(&gSpriteTemplate_840294C, x, y, 35);
                if (spriteId != MAX_SPRITES)
                {
                    if (task->data[7] == 0)
                    {
                        if (i == 0)
                            gSprites[spriteId].x2 = gSprites[spriteId].y2 = -task->data[6];
                        else
                            gSprites[spriteId].x2 = gSprites[spriteId].y2 = task->data[6];
                    }
                    else
                    {
                        if (i == 0)
                        {
                            gSprites[spriteId].x2 = -task->data[6];
                            gSprites[spriteId].y2 = task->data[6];
                        }
                        else
                        {
                            gSprites[spriteId].x2 = task->data[6];
                            gSprites[spriteId].y2 = -task->data[6];
                        }
                    }

                    gSprites[spriteId].data[0] = 0;
                    gSprites[spriteId].data[1] = taskId;
                    gSprites[spriteId].data[2] = 10;
                    task->data[10]++;
                }
            }

            if (task->data[2] == task->data[5])
                task->data[0]++;

            task->data[2]++;
        }
        break;
    case 1:
        if (task->data[10] == 0)
            DestroyAnimVisualTask(taskId);
        break;
    }
}

static void sub_8130424(s16 arg0, s16 arg1, s16 arg2, s16 arg3, u8 arg4, u8 arg5, s16 *x, s16 *y)
{
    int x2;
    int y2;

    if (arg5 == 0)
    {
        *x = arg0;
        *y = arg1;
        return;
    }

    if (arg5 >= arg4)
    {
        *x = arg2;
        *y = arg3;
        return;
    }

    arg4--;
    x2 = (arg0 << 8) + arg5 * (((arg2 - arg0) << 8) / arg4);
    y2 = (arg1 << 8) + arg5 * (((arg3 - arg1) << 8) / arg4);
    *x = x2 >> 8;
    *y = y2 >> 8;
}

static void sub_81304DC(struct Sprite *sprite)
{
    if (++sprite->data[0] > 36)
    {
        gTasks[sprite->data[1]].data[sprite->data[2]]--;
        DestroySprite(sprite);
    }
}

static void sub_813051C(struct Sprite *sprite)
{
    sprite->x = gBattleAnimArgs[0];
    sprite->y = gBattleAnimArgs[1];
    sprite->data[2] = gBattleAnimArgs[2];
    sprite->data[4] = gBattleAnimArgs[3];
    sprite->data[0] = gBattleAnimArgs[4];
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    sprite->callback = sub_8078CC0;
}

void sub_8130554(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    task->data[11] = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
    task->data[12] = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
    task->data[13] = GetBattlerSpriteCoord(gBattleAnimTarget, 2);
    task->data[14] = GetBattlerSpriteCoord(gBattleAnimTarget, 3) + GetBattlerSpriteCoordAttr(gBattleAnimTarget, 0) / 4;
    task->data[15] = CreateSprite(&gSpriteTemplate_84029AC, task->data[11], task->data[12], GetBattlerSubpriority(gBattleAnimTarget) - 5);
    if (task->data[15] != MAX_SPRITES)
    {
        gSprites[task->data[15]].data[0] = 16;
        gSprites[task->data[15]].data[2] = task->data[13];
        gSprites[task->data[15]].data[4] = task->data[14];
        gSprites[task->data[15]].data[5] = -32;
        InitAnimArcTranslation(&gSprites[task->data[15]]);
        if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_OPPONENT)
            StartSpriteAffineAnim(&gSprites[task->data[15]], 1);
        
        task->func = sub_81306A4;
    }
    else
    {
        DestroyAnimVisualTask(taskId);
    }
}

static void sub_81306A4(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;
            TranslateAnimArc(&gSprites[task->data[15]]);
            if (++task->data[2] > 7)
                task->data[0]++;
        }
        break;
    case 1:
        if (TranslateAnimArc(&gSprites[task->data[15]]))
        {
            task->data[1] = 0;
            task->data[2] = 0;
            task->data[0]++;
        }
        break;
    case 2:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;
            task->data[2]++;
            gSprites[task->data[15]].invisible = task->data[2] & 1;
            if (task->data[2] == 16)
            {
                FreeOamMatrix(gSprites[task->data[15]].oam.matrixNum);
                DestroySprite(&gSprites[task->data[15]]);
                task->data[0]++;
            }
        }
        break;
    case 3:
        DestroyAnimVisualTask(taskId);
        break;
    }
}

static void sub_81307B0(struct Sprite *sprite)
{
    u8 battler;

    if (gBattleAnimArgs[0] == 0)
        battler = gBattleAnimAttacker;
    else
        battler = gBattleAnimTarget;

    sprite->oam.tileNum += 16;
    sprite->data[6] = gBattleAnimArgs[2];
    sprite->data[7] = gBattleAnimArgs[1] == 0 ? -1 : 1;
    sprite->y = GetBattlerSpriteCoord(battler, 3);
    if (gBattleAnimArgs[1] == 0)
    {
        sprite->oam.matrixNum |= 0x8;
        sprite->x = GetBattlerSpriteCoordAttr(battler, 4) - 8;
    }
    else
    {
        sprite->x = GetBattlerSpriteCoordAttr(battler, 5) + 8;
    }

    sprite->callback = sub_813085C;
}

static void sub_813085C(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        if (++sprite->data[1] > 1)
        {
            sprite->data[1] = 0;
            sprite->x2 += sprite->data[7];
            if (++sprite->data[2] == 12)
                sprite->data[0]++;
        }
        break;
    case 1:
        if (++sprite->data[1] == 8)
        {
            sprite->data[1] = 0;
            sprite->data[0]++;
        }
        break;
    case 2:
        sprite->x2 -= sprite->data[7] * 4;
        if (++sprite->data[1] == 6)
        {
            sprite->data[1] = 0;
            sprite->data[0]++;
        }
        break;
    case 3:
        sprite->x2 += sprite->data[7] * 3;
        if (++sprite->data[1] == 8)
        {
            if (--sprite->data[6])
            {
                sprite->data[1] = 0;
                sprite->data[0]--;
            }
            else
            {
                DestroyAnimSprite(sprite);
            }
        }
        break;
    }
}

void sub_8130918(u8 taskId)
{
    if (gBattleAnimArgs[0] == 0)
    {
        DestroyAnimVisualTask(taskId);
    }
    else
    {
        gTasks[taskId].data[0] = gBattleAnimArgs[1];
        gTasks[taskId].data[15] = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);
        PrepareAffineAnimInTaskData(&gTasks[taskId], gTasks[taskId].data[15], &gUnknown_084029DC);
        gTasks[taskId].func = sub_8130970;
    }
}

static void sub_8130970(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (++task->data[1] > 1)
    {
        task->data[1] = 0;
        if (!(task->data[2] & 1))
            gSprites[task->data[15]].x2 = 2;
        else
            gSprites[task->data[15]].x2 = -2;
    }

    if (!RunAffineAnimFromTaskData(task))
    {
        gSprites[task->data[15]].x2 = 0;
        if (--task->data[0])
        {
            PrepareAffineAnimInTaskData(&gTasks[taskId], gTasks[taskId].data[15], &gUnknown_084029DC);
            task->data[1] = 0;
            task->data[2] = 0;
        }
        else
        {
            DestroyAnimVisualTask(taskId);
        }
    }
}

static void sub_8130A2C(struct Sprite *sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
        sprite->y = GetBattlerSpriteCoordAttr(gBattleAnimAttacker, 2);
    }
    else
    {
        sprite->x = GetBattlerSpriteCoord(gBattleAnimTarget, 2);
        sprite->y = GetBattlerSpriteCoordAttr(gBattleAnimTarget, 2);
    }

    if (sprite->y < 8)
        sprite->y = 8;

    sprite->data[0] = 0;
    sprite->data[1] = gBattleAnimArgs[1];
    sprite->data[2] = 0;
    sprite->data[3] = gBattleAnimArgs[2];
    sprite->callback = sub_8130A94;
}

static void sub_8130A94(struct Sprite *sprite)
{
    if (++sprite->data[0] >= sprite->data[1])
    {
        sprite->data[0] = 0;
        sprite->data[2] = (sprite->data[2] + 1) & 1;
        sprite->invisible = sprite->data[2];
        if (sprite->data[2] && --sprite->data[3] == 0)
            DestroyAnimSprite(sprite);
    }
}

static void sub_8130AEC(struct Sprite *sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->oam.matrixNum |= 0x8;
        sprite->x = 100;
        sprite->data[7] = 1;
    }
    else
    {
        sprite->x = 140;
        sprite->data[7] = -1;
    }

    sprite->y = 56;
    sprite->callback = sub_8130B38;
}

static void sub_8130B38(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->y -= sprite->data[7] * 2;
        if (sprite->data[1] & 1)
            sprite->x -= sprite->data[7] * 2;

        if (++sprite->data[1] == 9)
        {
            sprite->data[1] = 0;
            sprite->data[0]++;
        }
        break;
    case 1:
        if (++sprite->data[1] == 4)
        {
            sprite->data[1] = 0;
            sprite->data[0]++;
        }
        break;
    case 2:
        sprite->data[1]++;
        sprite->y += sprite->data[7] * 3;
        sprite->x2 = sprite->data[7] * (gSineTable[sprite->data[1] * 10] >> 3);
        if (sprite->data[1] == 12)
        {
            sprite->data[1] = 0;
            sprite->data[0]++;
        }
        break;
    case 3:
        if (++sprite->data[1] == 2)
        {
            sprite->data[1] = 0;
            sprite->data[0]++;
        }
        break;
    case 4:
        sprite->data[1]++;
        sprite->y -= sprite->data[7] * 3;
        sprite->x2 = sprite->data[7] * (gSineTable[sprite->data[1] * 10] >> 3);
        if (sprite->data[1] == 12)
            sprite->data[0]++;
        break;
    case 5:
        sprite->data[1]++;
        sprite->y += sprite->data[7] * 3;
        sprite->x2 = sprite->data[7] * (gSineTable[sprite->data[1] * 10] >> 3);
        if (sprite->data[1] == 15)
            sprite->oam.tileNum += 16;
        
        if (sprite->data[1] == 18)
        {
            sprite->data[1] = 0;
            sprite->data[0]++;
        }
        break;
    case 6:
        sprite->x += sprite->data[7] * 6;
        if (++sprite->data[1] == 9)
        {
            sprite->data[1] = 0;
            sprite->data[0]++;
        }
        break;
    case 7:
        sprite->x += sprite->data[7] * 2;
        if (++sprite->data[1] == 1)
        {
            sprite->data[1] = 0;
            sprite->data[0]++;
        }
        break;
    case 8:
        sprite->x -= sprite->data[7] * 3;
        if (++sprite->data[1] == 5)
            DestroyAnimSprite(sprite);
        break;
    }
}

void sub_8130D20(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    task->data[15] = GetAnimBattlerSpriteId(0);
    if (!IsContest())
    {
        if (IsDoubleBattle() == TRUE)
        {
            int x = GetBattlerSpriteCoord(gBattleAnimAttacker, 0);
            int y = GetBattlerSpriteCoord(gBattleAnimAttacker ^ 2, 0);
            if (x > y)
                task->data[14] = 1;
            else
                task->data[14] = -1;
        }
        else
        {
            if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER)
                task->data[14] = -1;
            else
                task->data[14] = 1;
        }
    }
    else
    {
        task->data[14] = 1;
    }

    task->func = sub_8130DBC;
}

static void sub_8130DBC(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        if (++task->data[1] == 13)
        {
            task->data[1] = 0;
            task->data[0]++;
        }
        break;
    case 1:
        gSprites[task->data[15]].x2 -= task->data[14] * 3;
        if (++task->data[1] == 6)
        {
            task->data[1] = 0;
            task->data[0]++;
        }
        break;
    case 2:
        gSprites[task->data[15]].x2 += task->data[14] * 3;
        if (++task->data[1] == 6)
        {
            task->data[1] = 0;
            task->data[0]++;
        }
        break;
    case 3:
        if (++task->data[1] == 2)
        {
            task->data[1] = 0;
            if (task->data[2] == 0)
            {
                task->data[2]++;
                task->data[0] = 1;
            }
            else
            {
                task->data[0]++;
            }
        }
        break;
    case 4:
        gSprites[task->data[15]].x2 += task->data[14];
        if (++task->data[1] == 3)
        {
            task->data[1] = 0;
            task->data[0]++;
        }
        break;
    case 5:
        if (++task->data[1] == 6)
        {
            task->data[1] = 0;
            task->data[0]++;
        }
        break;
    case 6:
        gSprites[task->data[15]].x2 -= task->data[14] * 4;
        if (++task->data[1] == 5)
        {
            task->data[1] = 0;
            task->data[0]++;
        }
        break;
    case 7:
        gSprites[task->data[15]].x2 += task->data[14] * 4;
        if (++task->data[1] == 5)
        {
            task->data[1] = 0;
            task->data[0]++;
        }
        break;
    case 8:
        gSprites[task->data[15]].x2 = 0;
        DestroyAnimVisualTask(taskId);
        break;
    }
}

static void sub_8130F5C(struct Sprite *sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        InitAnimSpritePos(sprite, 1);
        sprite->data[7] = gBattleAnimAttacker;
    }
    else
    {
        sprite->data[7] = gBattleAnimTarget;
    }

    if (GetBattlerSide(sprite->data[7]) == B_SIDE_OPPONENT)
        sprite->oam.matrixNum = 8;

    sprite->oam.priority = GetBattlerSpriteBGPriority(sprite->data[7]);
    sprite->oam.objMode = ST_OAM_OBJ_BLEND;
    sprite->callback = sub_8130FE0;
}

static void sub_8130FE0(struct Sprite *sprite)
{
    u16 x, y;

    switch (sprite->data[5])
    {
    case 0:
        switch (sprite->data[6])
        {
        default:
            sprite->data[6] = 0;
        case 0:
        case 4:
            x = GetBattlerSpriteCoordAttr(sprite->data[7], 5) - 4;
            y = GetBattlerSpriteCoordAttr(sprite->data[7], 3) - 4;
            break;
        case 1:
            x = GetBattlerSpriteCoordAttr(sprite->data[7], 5) - 4;
            y = GetBattlerSpriteCoordAttr(sprite->data[7], 2) + 4;
            break;
        case 2:
            x = GetBattlerSpriteCoordAttr(sprite->data[7], 4) + 4;
            y = GetBattlerSpriteCoordAttr(sprite->data[7], 3) - 4;
            break;
        case 3:
            x = GetBattlerSpriteCoordAttr(sprite->data[7], 4) + 4;
            y = GetBattlerSpriteCoordAttr(sprite->data[7], 2) - 4;
            break;
        case 5:
            x = GetBattlerSpriteCoord(sprite->data[7], 2);
            y = GetBattlerSpriteCoord(sprite->data[7], 3);
            break;
        }

        if (sprite->data[6] == 4)
            sprite->data[0] = 24;
        else if (sprite->data[6] == 5)
            sprite->data[0] = 6;
        else
            sprite->data[0] = 12;

        sprite->data[1] = sprite->x;
        sprite->data[2] = x;
        sprite->data[3] = sprite->y;
        sprite->data[4] = y;
        InitAnimLinearTranslation(sprite);
        sprite->data[5]++;
        break;
    case 1:
        if (TranslateAnimLinear(sprite))
        {
            switch (sprite->data[6])
            {
            default:
                sprite->x += sprite->x2;
                sprite->y += sprite->y2;
                sprite->y2 = 0;
                sprite->x2 = 0;
                sprite->data[0] = 0;
                sprite->data[5]++;
                sprite->data[6]++;
                break;
            case 4:
                sprite->x += sprite->x2;
                sprite->y += sprite->y2;
                sprite->y2 = 0;
                sprite->x2 = 0;
                sprite->data[5] = 0;
                sprite->data[6]++;
                break;
            case 5:
                sprite->data[0] = 0;
                sprite->data[1] = 16;
                sprite->data[2] = 0;
                sprite->data[5] = 3;
                break;
            }
        }
        break;
    case 2:
        if (++sprite->data[0] == 4)
            sprite->data[5] = 0;
        break;
    case 3:
        if (!(sprite->data[0] & 1))
            sprite->data[1]--;
        else
            sprite->data[2]++;

        REG_BLDALPHA = (sprite->data[2] << 8) | sprite->data[1];
        if (++sprite->data[0] == 32)
        {
            sprite->invisible = TRUE;
            sprite->data[5]++;
        }
        break;
    case 4:
        DestroyAnimSprite(sprite);
        break;
    }
}

static void sub_81311E4(struct Sprite *sprite)
{
    sprite->x2 = ((sprite->data[2] - sprite->data[0]) * sprite->data[5]) / sprite->data[4];
    sprite->y2 = ((sprite->data[3] - sprite->data[1]) * sprite->data[5]) / sprite->data[4];
    if (!(sprite->data[5] & 1))
    {
        CreateSprite(
            &gSpriteTemplate_8402500,
            sprite->x + sprite->x2,
            sprite->y + sprite->y2, 5);
    }
    
    if (sprite->data[5] == sprite->data[4])
        DestroyAnimSprite(sprite);

    sprite->data[5]++;
}

static void sub_8131264(struct Sprite *sprite)
{
    GetBattlerSpriteCoord(gBattleAnimTarget, 2); // unused local variable
    GetBattlerSpriteCoord(gBattleAnimTarget, 3); // unused local variable

    if (GetBattlerSide(gBattleAnimTarget) == B_SIDE_PLAYER || IsContest())
    {
        sprite->data[0] = sprite->x - gBattleAnimArgs[0];
        sprite->data[2] = sprite->x - gBattleAnimArgs[2];
    }
    else
    {
        sprite->data[0] = sprite->x + gBattleAnimArgs[0];
        sprite->data[2] = sprite->x + gBattleAnimArgs[2];
    }

    sprite->data[1] = sprite->y + gBattleAnimArgs[1];
    sprite->data[3] = sprite->y + gBattleAnimArgs[3];
    sprite->data[4] = gBattleAnimArgs[4];
    sprite->x = sprite->data[0];
    sprite->y = sprite->data[1];
    sprite->callback = sub_81311E4;
}

void sub_81312E4(u8 taskId)
{
    int i;
    u8 spriteId = GetAnimBattlerSpriteId(0);

    if (gTasks[taskId].data[0] == 0)
    {
        PrepareBattlerSpriteForRotScale(spriteId, 0);
        gTasks[taskId].data[1] = 0x100;
        gTasks[taskId].data[2] = 0x100;
        gTasks[taskId].data[0]++;
    }
    else if (gTasks[taskId].data[0] == 1)
    {
        gTasks[taskId].data[1] += 0x60;
        gTasks[taskId].data[2] -= 0xD;
        obj_id_set_rotscale(spriteId, gTasks[taskId].data[1], gTasks[taskId].data[2], 0);
        if (++gTasks[taskId].data[3] == 9)
        {
            gTasks[taskId].data[3] = 0;
            sub_8078F40(spriteId);
            gSprites[spriteId].invisible = TRUE;
            gTasks[taskId].data[0]++;
        }
    }
    else
    {
        refresh_graphics_maybe(gBattleAnimAttacker, 0, spriteId);
        if (IsContest())
        {
            gSprites[gBattlerSpriteIds[gBattleAnimAttacker]].affineAnims =
                gAffineAnims_BattleSpriteContest;
            StartSpriteAffineAnim(&gSprites[gBattlerSpriteIds[gBattleAnimAttacker]], 0);
        }

        for (i = 0; i < 16; i++)
            gTasks[taskId].data[i] = 0;
        
        gTasks[taskId].func = sub_8131408;
    }
}

static void sub_8131408(u8 taskId)
{
    u8 spriteId = GetAnimBattlerSpriteId(0);

    switch (gTasks[taskId].data[0])
    {
    case 0:
        gSprites[spriteId].y2 = -200;
        gSprites[spriteId].x2 = 200;
        gSprites[spriteId].invisible = FALSE;
        gTasks[taskId].data[10] = 0;
        gTasks[taskId].data[0]++;
        break;
    case 1:
        gTasks[taskId].data[10] += 112;
        gSprites[spriteId].y2 += gTasks[taskId].data[10] >> 8;
        if (gSprites[spriteId].y + gSprites[spriteId].y2 >= -32)
            gSprites[spriteId].x2 = 0;

        if (gSprites[spriteId].y2 > 0)
            gSprites[spriteId].y2 = 0;

        if (gSprites[spriteId].y2 == 0)
        {
            PlaySE12WithPanning(SE_M_BUBBLE2, BattleAnimAdjustPanning(SOUND_PAN_ATTACKER_NEG));
            gTasks[taskId].data[10] -= 0x800;
            gTasks[taskId].data[0]++;
        }
        break;
    case 2:
        gTasks[taskId].data[10] -= 112;
        if (gTasks[taskId].data[10] < 0)
            gTasks[taskId].data[10] = 0;

        gSprites[spriteId].y2 -= gTasks[taskId].data[10] >> 8;
        if (gTasks[taskId].data[10] == 0)
            gTasks[taskId].data[0]++;
        break;
    case 3:
        gTasks[taskId].data[10] += 112;
        gSprites[spriteId].y2 += gTasks[taskId].data[10] >> 8;
        if (gSprites[spriteId].y2 > 0)
            gSprites[spriteId].y2 = 0;

        if (gSprites[spriteId].y2 == 0)
        {
            PlaySE12WithPanning(SE_M_BUBBLE2, BattleAnimAdjustPanning(SOUND_PAN_ATTACKER_NEG));
            DestroyAnimVisualTask(taskId);
        }
        break;
    }
}

static void sub_8131564(struct Sprite *sprite)
{
    s16 y2;

    if (GetBattlerSide(gBattleAnimTarget) == B_SIDE_PLAYER)
    {
        sprite->subpriority = GetBattlerSubpriority(gBattleAnimTarget) - 2;
        y2 = -144;
    }
    else
    {
        sprite->subpriority = GetBattlerSubpriority(gBattleAnimTarget) + 2;
        y2 = -96;
    }

    sprite->y = GetBattlerSpriteCoord(gBattleAnimTarget, 3);
    sprite->y2 = y2;
    sprite->callback = sub_81315C8;
}

static void sub_81315C8(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->y2 += 10;
        if (sprite->y2 >= 0)
        {
            PlaySE12WithPanning(SE_M_SKETCH, BattleAnimAdjustPanning(SOUND_PAN_TARGET));
            sprite->y2 = 0;
            sprite->data[0]++;
        }
        break;
    case 1:
        sprite->data[1] += 4;
        sprite->y2 = -(gSineTable[sprite->data[1]] >> 3);
        if (sprite->data[1] > 127)
        {
            PlaySE12WithPanning(SE_M_SKETCH, BattleAnimAdjustPanning(SOUND_PAN_TARGET));
            sprite->data[1] = 0;
            sprite->y2 = 0;
            sprite->data[0]++;
        }
        break;
    case 2:
        sprite->data[1] += 6;
        sprite->y2 = -(gSineTable[sprite->data[1]] >> 4);
        if (sprite->data[1] > 127)
        {
            sprite->data[1] = 0;
            sprite->y2 = 0;
            sprite->data[0]++;
        }
        break;
    case 3:
        if (++sprite->data[1] > 8)
        {
            PlaySE12WithPanning(SE_M_LEER, BattleAnimAdjustPanning(SOUND_PAN_TARGET));
            sprite->data[1] = 0;
            sprite->data[0]++;
        }
        break;
    case 4:
        if (++sprite->data[1] > 8)
        {
            sprite->data[1] = 0;
            sprite->data[2]++;
            sprite->invisible = sprite->data[2] & 1;
            if (sprite->data[2] == 7)
                DestroyAnimSprite(sprite);
        }
        break;
    }
}

void sub_81316F8(u8 taskId)
{
    s16 spriteId1, spriteId2;

    if (IsContest())
    {
        DestroyAnimVisualTask(taskId);
        return;
    }

    spriteId1 = duplicate_obj_of_side_rel2move_in_transparent_mode(1);
    if (spriteId1 < 0)
    {
        DestroyAnimVisualTask(taskId);
        return;
    }

    spriteId2 = duplicate_obj_of_side_rel2move_in_transparent_mode(1);
    if (spriteId2 < 0)
    {
        obj_delete_but_dont_free_vram(&gSprites[spriteId1]);
        DestroyAnimVisualTask(taskId);
        return;
    }

    gSprites[spriteId2].x2 += 24;
    gSprites[spriteId1].x2 -= 24;
    gSprites[spriteId2].data[0] = 0;
    gSprites[spriteId1].data[0] = 0;
    gSprites[spriteId2].data[1] = 0;
    gSprites[spriteId1].data[1] = 0;
    gSprites[spriteId2].data[2] = 0;
    gSprites[spriteId1].data[2] = 0;
    gSprites[spriteId2].data[3] = 16;
    gSprites[spriteId1].data[3] = -16;
    gSprites[spriteId2].data[4] = 0;
    gSprites[spriteId1].data[4] = 128;
    gSprites[spriteId2].data[5] = 24;
    gSprites[spriteId1].data[5] = 24;
    gSprites[spriteId2].data[6] = taskId;
    gSprites[spriteId1].data[6] = taskId;
    gSprites[spriteId2].data[7] = 0;
    gSprites[spriteId1].data[7] = 0;
    gTasks[taskId].data[0] = 2;
    gSprites[spriteId2].invisible = FALSE;
    gSprites[spriteId1].invisible = TRUE;
    gSprites[spriteId2].oam.objMode = ST_OAM_OBJ_NORMAL;
    gSprites[spriteId1].oam.objMode = ST_OAM_OBJ_NORMAL;
    gSprites[spriteId2].callback = sub_8131838;
    gSprites[spriteId1].callback = sub_8131838;
    gTasks[taskId].func = sub_8131810;
}

static void sub_8131810(u8 taskId)
{
    if (gTasks[taskId].data[0] == 0)
        DestroyAnimVisualTask(taskId);
}

static void sub_8131838(struct Sprite *sprite)
{
    if (++sprite->data[1] > 1)
    {
        sprite->data[1] = 0;
        sprite->invisible ^= 1;
    }

    sprite->data[4] = (sprite->data[4] + sprite->data[3]) & 0xFF;
    sprite->x2 = Cos(sprite->data[4], sprite->data[5]);
    switch (sprite->data[0])
    {
    case 0:
        if (++sprite->data[2] == 60)
        {
            sprite->data[2] = 0;
            sprite->data[0]++;
        }
        break;
    case 1:
        if (++sprite->data[2] > 0)
        {
            sprite->data[2] = 0;
            sprite->data[5] -= 2;
            if (sprite->data[5] < 0)
            {
                gTasks[sprite->data[6]].data[sprite->data[7]]--;
                obj_delete_but_dont_free_vram(sprite);
            }
        }
        break;
    }
}

void AnimTask_GetReturnPowerLevel(u8 taskId)
{
    gBattleAnimArgs[7] = 0;
    if (gAnimFriendship < 60)
        gBattleAnimArgs[7] = 0;
    if (gAnimFriendship > 60 && gAnimFriendship < 92)
        gBattleAnimArgs[7] = 1;
    if (gAnimFriendship > 91 && gAnimFriendship < 201)
        gBattleAnimArgs[7] = 2;
    if (gAnimFriendship > 200)
        gBattleAnimArgs[7] = 3;

    DestroyAnimVisualTask(taskId);
}

#ifdef NONMATCHING
// Makes the mon run out of screen, run past the opposing mon, and return to its original position.
// No args.
void AnimTask_SnatchOpposingMonMove(u8 taskId)
{
    u8 spriteId, spriteId2;
    u32 personality;
    u32 otId;
    u16 species;
    u8 subpriority;
    u8 isBackPic;
    s16 x;	

    switch (gTasks[taskId].data[0])
    {
    case 0:
        spriteId = GetAnimBattlerSpriteId(ANIM_BATTLER_ATTACKER);
        gTasks[taskId].data[1] += 0x800;
        if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER)
            gSprites[spriteId].x2 += (gTasks[taskId].data[1] >> 8);
        else
            gSprites[spriteId].x2 -= (gTasks[taskId].data[1] >> 8);

        gTasks[taskId].data[1] &= 0xFF;
        x = gSprites[spriteId].x + gSprites[spriteId].x2;
        if ((u16)(x + 32) > 304)
        {
            gTasks[taskId].data[1] = 0;
            gTasks[taskId].data[0]++;
        }
        break;
    case 1:
        if (IsContest())
        {
            personality = eWRAM_19348Struct->personality;
            otId = eWRAM_19348Struct->otId;
            species = eWRAM_19348Struct->species;
            subpriority = GetBattlerSubpriority(gBattleAnimAttacker);
            isBackPic = 0;
            x = -32;
        }
        else
        {
            if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER)
            {
                personality = GetMonData(&gPlayerParty[gBattlerPartyIndexes[gBattleAnimAttacker]], MON_DATA_PERSONALITY);
                otId = GetMonData(&gPlayerParty[gBattlerPartyIndexes[gBattleAnimAttacker]], MON_DATA_OT_ID);
                if (gBattleSpriteInfo[gBattleAnimTarget].transformedSpecies == SPECIES_NONE)
                    species = GetMonData(&gPlayerParty[gBattlerPartyIndexes[gBattleAnimAttacker]], MON_DATA_SPECIES);
                else
                    species = gBattleSpriteInfo[gBattleAnimTarget].transformedSpecies;

                subpriority = gSprites[GetAnimBattlerSpriteId(ANIM_BATTLER_TARGET)].subpriority + 1;
                isBackPic = 0;
                x = 272;
            }
            else
            {
                personality = GetMonData(&gEnemyParty[gBattlerPartyIndexes[gBattleAnimAttacker]], MON_DATA_PERSONALITY);
                otId = GetMonData(&gEnemyParty[gBattlerPartyIndexes[gBattleAnimAttacker]], MON_DATA_OT_ID);
                if (gBattleSpriteInfo[gBattleAnimTarget].transformedSpecies == SPECIES_NONE)
                    species = GetMonData(&gEnemyParty[gBattlerPartyIndexes[gBattleAnimAttacker]], MON_DATA_SPECIES);
                else
                    species = gBattleSpriteInfo[gBattleAnimTarget].transformedSpecies;

                subpriority = gSprites[GetAnimBattlerSpriteId(ANIM_BATTLER_TARGET)].subpriority - 1;
                isBackPic = 1;
                x = -32;
            }
        }

        spriteId2 = sub_8079F44(species, isBackPic, 0, x, GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y), subpriority, personality, otId);
        if (gBattleSpriteInfo[gBattleAnimTarget].transformedSpecies != SPECIES_NONE)
            BlendPalette((gSprites[spriteId2].oam.paletteNum * 16) | 0x100, 16, 6, RGB_WHITE);

        gTasks[taskId].data[15] = spriteId2;
        gTasks[taskId].data[0]++;
        break;
    case 2:
        spriteId2 = gTasks[taskId].data[15];
        gTasks[taskId].data[1] += 0x800;
        if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER)
            gSprites[spriteId2].x2 -= (gTasks[taskId].data[1] >> 8);
        else
            gSprites[spriteId2].x2 += (gTasks[taskId].data[1] >> 8);

        gTasks[taskId].data[1] &= 0xFF;
        x = gSprites[spriteId2].x + gSprites[spriteId2].x2;
        if (gTasks[taskId].data[14] == 0)
        {
            if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER)
            {
                if (x < GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X))
                {
                    gTasks[taskId].data[14]++;
                    gBattleAnimArgs[7] = 0xFFFF;
                }
            }
            else
            {
                if (x > GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X))
                {
                    gTasks[taskId].data[14]++;
                    gBattleAnimArgs[7] = 0xFFFF;
                }
            }
        }

        if ((u16)(x + 32) > 304)
        {
            gTasks[taskId].data[1] = 0;
            gTasks[taskId].data[0]++;
        }
        break;
    case 3:
        spriteId = GetAnimBattlerSpriteId(ANIM_BATTLER_ATTACKER);
        spriteId2 = gTasks[taskId].data[15];
        DestroySpriteAndFreeResources_(&gSprites[spriteId2]);
        if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER)
            gSprites[spriteId].x2 = -gSprites[spriteId].x - 32;
        else
            gSprites[spriteId].x2 = 272 - gSprites[spriteId].x;

        gTasks[taskId].data[0]++;
        break;
    case 4:
        spriteId = GetAnimBattlerSpriteId(ANIM_BATTLER_ATTACKER);
        gTasks[taskId].data[1] += 0x800;
        if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER)
        {
            gSprites[spriteId].x2 += (gTasks[taskId].data[1] >> 8);
            if (gSprites[spriteId].x2 + gSprites[spriteId].x >= GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X))
                gSprites[spriteId].x2 = 0;
        }
        else
        {
            gSprites[spriteId].x2 -= (gTasks[taskId].data[1] >> 8);
            if (gSprites[spriteId].x2 + gSprites[spriteId].x <= GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X))
                gSprites[spriteId].x2 = 0;
        }

        gTasks[taskId].data[1] = (u8)gTasks[taskId].data[1];
        if (gSprites[spriteId].x2 == 0)
            DestroyAnimVisualTask(taskId);
        break;
    }
}
#else
NAKED
void AnimTask_SnatchOpposingMonMove(u8 taskId)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
	mov r7, r10\n\
	mov r6, r9\n\
	mov r5, r8\n\
	push {r5-r7}\n\
	sub sp, 0x14\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	mov r8, r0\n\
	ldr r1, _08131974 @ =gTasks\n\
	lsls r0, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	movs r1, 0x8\n\
	ldrsh r0, [r0, r1]\n\
	cmp r0, 0x4\n\
	bls _0813196A\n\
	b _08131EA0\n\
_0813196A:\n\
	lsls r0, 2\n\
	ldr r1, _08131978 @ =_0813197C\n\
	adds r0, r1\n\
	ldr r0, [r0]\n\
	mov pc, r0\n\
	.align 2, 0\n\
_08131974: .4byte gTasks\n\
_08131978: .4byte _0813197C\n\
	.align 2, 0\n\
_0813197C:\n\
	.4byte _08131990\n\
	.4byte _08131A44\n\
	.4byte _08131C20\n\
	.4byte _08131D40\n\
	.4byte _08131DC4\n\
_08131990:\n\
	movs r0, 0\n\
	bl GetAnimBattlerSpriteId\n\
	lsls r0, 24\n\
	lsrs r7, r0, 24\n\
	ldr r1, _081319DC @ =gTasks\n\
	mov r2, r8\n\
	lsls r4, r2, 2\n\
	adds r0, r4, r2\n\
	lsls r0, 3\n\
	adds r6, r0, r1\n\
	movs r3, 0x80\n\
	lsls r3, 4\n\
	adds r0, r3, 0\n\
	ldrh r1, [r6, 0xA]\n\
	adds r0, r1\n\
	strh r0, [r6, 0xA]\n\
	ldr r0, _081319E0 @ =gBattleAnimAttacker\n\
	ldrb r0, [r0]\n\
	bl GetBattlerSide\n\
	lsls r0, 24\n\
	mov r9, r4\n\
	cmp r0, 0\n\
	bne _081319E8\n\
	ldr r2, _081319E4 @ =gSprites\n\
	lsls r3, r7, 4\n\
	adds r1, r3, r7\n\
	lsls r1, 2\n\
	adds r1, r2\n\
	ldrh r0, [r6, 0xA]\n\
	lsls r0, 16\n\
	asrs r0, 24\n\
	ldrh r4, [r1, 0x24]\n\
	adds r0, r4\n\
	strh r0, [r1, 0x24]\n\
	b _08131A02\n\
	.align 2, 0\n\
_081319DC: .4byte gTasks\n\
_081319E0: .4byte gBattleAnimAttacker\n\
_081319E4: .4byte gSprites\n\
_081319E8:\n\
	ldr r3, _08131A3C @ =gSprites\n\
	lsls r4, r7, 4\n\
	adds r2, r4, r7\n\
	lsls r2, 2\n\
	adds r2, r3\n\
	ldrh r1, [r6, 0xA]\n\
	lsls r1, 16\n\
	asrs r1, 24\n\
	ldrh r0, [r2, 0x24]\n\
	subs r0, r1\n\
	strh r0, [r2, 0x24]\n\
	adds r2, r3, 0\n\
	adds r3, r4, 0\n\
_08131A02:\n\
	ldr r1, _08131A40 @ =gTasks\n\
	mov r0, r9\n\
	add r0, r8\n\
	lsls r0, 3\n\
	adds r4, r0, r1\n\
	ldrb r0, [r4, 0xA]\n\
	strh r0, [r4, 0xA]\n\
	adds r1, r3, r7\n\
	lsls r1, 2\n\
	adds r1, r2\n\
	ldrh r0, [r1, 0x24]\n\
	ldrh r1, [r1, 0x20]\n\
	adds r0, r1\n\
	lsls r0, 16\n\
	movs r1, 0x80\n\
	lsls r1, 14\n\
	adds r0, r1\n\
	movs r1, 0x98\n\
	lsls r1, 17\n\
	cmp r0, r1\n\
	bhi _08131A2E\n\
	b _08131EA0\n\
_08131A2E:\n\
	movs r0, 0\n\
	strh r0, [r4, 0xA]\n\
	ldrh r0, [r4, 0x8]\n\
	adds r0, 0x1\n\
	strh r0, [r4, 0x8]\n\
	b _08131EA0\n\
	.align 2, 0\n\
_08131A3C: .4byte gSprites\n\
_08131A40: .4byte gTasks\n\
_08131A44:\n\
	bl IsContest\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	beq _08131A74\n\
	ldr r0, _08131A6C @ =gSharedMem + 0x19348\n\
	ldr r2, [r0, 0x8]\n\
	mov r10, r2\n\
	ldr r3, [r0, 0xC]\n\
	mov r9, r3\n\
	ldrh r5, [r0]\n\
	ldr r0, _08131A70 @ =gBattleAnimAttacker\n\
	ldrb r0, [r0]\n\
	bl GetBattlerSubpriority\n\
	lsls r0, 24\n\
	lsrs r4, r0, 24\n\
	movs r7, 0\n\
	b _08131B92\n\
	.align 2, 0\n\
_08131A6C: .4byte gSharedMem + 0x19348\n\
_08131A70: .4byte gBattleAnimAttacker\n\
_08131A74:\n\
	ldr r4, _08131AD4 @ =gBattleAnimAttacker\n\
	ldrb r0, [r4]\n\
	bl GetBattlerSide\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	bne _08131B10\n\
	ldr r7, _08131AD8 @ =gBattlerPartyIndexes\n\
	ldrb r0, [r4]\n\
	lsls r0, 1\n\
	adds r0, r7\n\
	ldrh r0, [r0]\n\
	movs r6, 0x64\n\
	muls r0, r6\n\
	ldr r5, _08131ADC @ =gPlayerParty\n\
	adds r0, r5\n\
	movs r1, 0\n\
	bl GetMonData\n\
	mov r10, r0\n\
	ldrb r0, [r4]\n\
	lsls r0, 1\n\
	adds r0, r7\n\
	ldrh r0, [r0]\n\
	muls r0, r6\n\
	adds r0, r5\n\
	movs r1, 0x1\n\
	bl GetMonData\n\
	mov r9, r0\n\
	ldrb r2, [r4]\n\
	lsls r1, r2, 2\n\
	ldr r0, _08131AE0 @ =gSharedMem + 0x17800\n\
	adds r1, r0\n\
	ldrh r0, [r1, 0x2]\n\
	cmp r0, 0\n\
	bne _08131AE4\n\
	lsls r0, r2, 1\n\
	adds r0, r7\n\
	ldrh r0, [r0]\n\
	muls r0, r6\n\
	adds r0, r5\n\
	movs r1, 0xB\n\
	bl GetMonData\n\
	lsls r0, 16\n\
	lsrs r5, r0, 16\n\
	b _08131AE6\n\
	.align 2, 0\n\
_08131AD4: .4byte gBattleAnimAttacker\n\
_08131AD8: .4byte gBattlerPartyIndexes\n\
_08131ADC: .4byte gPlayerParty\n\
_08131AE0: .4byte gSharedMem + 0x17800\n\
_08131AE4:\n\
	ldrh r5, [r1, 0x2]\n\
_08131AE6:\n\
	movs r0, 0x1\n\
	bl GetAnimBattlerSpriteId\n\
	ldr r2, _08131B0C @ =gSprites\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	lsls r1, r0, 4\n\
	adds r1, r0\n\
	lsls r1, 2\n\
	adds r1, r2\n\
	adds r1, 0x43\n\
	ldrb r0, [r1]\n\
	adds r0, 0x1\n\
	lsls r0, 24\n\
	lsrs r4, r0, 24\n\
	movs r7, 0\n\
	movs r6, 0x88\n\
	lsls r6, 1\n\
	b _08131B94\n\
	.align 2, 0\n\
_08131B0C: .4byte gSprites\n\
_08131B10:\n\
	ldr r7, _08131B64 @ =gBattlerPartyIndexes\n\
	ldrb r0, [r4]\n\
	lsls r0, 1\n\
	adds r0, r7\n\
	ldrh r0, [r0]\n\
	movs r6, 0x64\n\
	muls r0, r6\n\
	ldr r5, _08131B68 @ =gEnemyParty\n\
	adds r0, r5\n\
	movs r1, 0\n\
	bl GetMonData\n\
	mov r10, r0\n\
	ldrb r0, [r4]\n\
	lsls r0, 1\n\
	adds r0, r7\n\
	ldrh r0, [r0]\n\
	muls r0, r6\n\
	adds r0, r5\n\
	movs r1, 0x1\n\
	bl GetMonData\n\
	mov r9, r0\n\
	ldrb r2, [r4]\n\
	lsls r1, r2, 2\n\
	ldr r0, _08131B6C @ =gSharedMem + 0x17800\n\
	adds r1, r0\n\
	ldrh r0, [r1, 0x2]\n\
	cmp r0, 0\n\
	bne _08131B70\n\
	lsls r0, r2, 1\n\
	adds r0, r7\n\
	ldrh r0, [r0]\n\
	muls r0, r6\n\
	adds r0, r5\n\
	movs r1, 0xB\n\
	bl GetMonData\n\
	lsls r0, 16\n\
	lsrs r5, r0, 16\n\
	b _08131B72\n\
	.align 2, 0\n\
_08131B64: .4byte gBattlerPartyIndexes\n\
_08131B68: .4byte gEnemyParty\n\
_08131B6C: .4byte gSharedMem + 0x17800\n\
_08131B70:\n\
	ldrh r5, [r1, 0x2]\n\
_08131B72:\n\
	movs r0, 0x1\n\
	bl GetAnimBattlerSpriteId\n\
	ldr r2, _08131C04 @ =gSprites\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	lsls r1, r0, 4\n\
	adds r1, r0\n\
	lsls r1, 2\n\
	adds r1, r2\n\
	adds r1, 0x43\n\
	ldrb r0, [r1]\n\
	subs r0, 0x1\n\
	lsls r0, 24\n\
	lsrs r4, r0, 24\n\
	movs r7, 0x1\n\
_08131B92:\n\
	ldr r6, _08131C08 @ =0x0000ffe0\n\
_08131B94:\n\
	ldr r0, _08131C0C @ =gBattleAnimTarget\n\
	ldrb r0, [r0]\n\
	movs r1, 0x1\n\
	bl GetBattlerSpriteCoord\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	lsls r3, r6, 16\n\
	asrs r3, 16\n\
	str r0, [sp]\n\
	str r4, [sp, 0x4]\n\
	mov r4, r10\n\
	str r4, [sp, 0x8]\n\
	mov r0, r9\n\
	str r0, [sp, 0xC]\n\
	adds r0, r5, 0\n\
	adds r1, r7, 0\n\
	movs r2, 0\n\
	bl sub_8079F44\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
	ldr r0, _08131C10 @ =gBattleAnimAttacker\n\
	ldrb r0, [r0]\n\
	lsls r0, 2\n\
	ldr r1, _08131C14 @ =gSharedMem + 0x17800\n\
	adds r0, r1\n\
	ldrh r0, [r0, 0x2]\n\
	cmp r0, 0\n\
	beq _08131BF2\n\
	ldr r1, _08131C04 @ =gSprites\n\
	lsls r0, r5, 4\n\
	adds r0, r5\n\
	lsls r0, 2\n\
	adds r0, r1\n\
	ldrb r0, [r0, 0x5]\n\
	lsrs r0, 4\n\
	lsls r0, 4\n\
	movs r2, 0x80\n\
	lsls r2, 1\n\
	adds r1, r2, 0\n\
	orrs r0, r1\n\
	ldr r3, _08131C18 @ =0x00007fff\n\
	movs r1, 0x10\n\
	movs r2, 0x6\n\
	bl BlendPalette\n\
_08131BF2:\n\
	ldr r0, _08131C1C @ =gTasks\n\
	mov r3, r8\n\
	lsls r1, r3, 2\n\
	add r1, r8\n\
	lsls r1, 3\n\
	adds r1, r0\n\
	strh r5, [r1, 0x26]\n\
	b _08131DB6\n\
	.align 2, 0\n\
_08131C04: .4byte gSprites\n\
_08131C08: .4byte 0x0000ffe0\n\
_08131C0C: .4byte gBattleAnimTarget\n\
_08131C10: .4byte gBattleAnimAttacker\n\
_08131C14: .4byte gSharedMem + 0x17800\n\
_08131C18: .4byte 0x00007fff\n\
_08131C1C: .4byte gTasks\n\
_08131C20:\n\
	ldr r1, _08131C6C @ =gTasks\n\
	mov r0, r8\n\
	lsls r4, r0, 2\n\
	adds r0, r4, r0\n\
	lsls r0, 3\n\
	adds r6, r0, r1\n\
	ldrh r0, [r6, 0x26]\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
	movs r1, 0x80\n\
	lsls r1, 4\n\
	adds r0, r1, 0\n\
	ldrh r2, [r6, 0xA]\n\
	adds r0, r2\n\
	strh r0, [r6, 0xA]\n\
	ldr r0, _08131C70 @ =gBattleAnimAttacker\n\
	ldrb r0, [r0]\n\
	bl GetBattlerSide\n\
	lsls r0, 24\n\
	mov r9, r4\n\
	cmp r0, 0\n\
	bne _08131C78\n\
	ldr r3, _08131C74 @ =gSprites\n\
	lsls r4, r5, 4\n\
	adds r2, r4, r5\n\
	lsls r2, 2\n\
	adds r2, r3\n\
	ldrh r1, [r6, 0xA]\n\
	lsls r1, 16\n\
	asrs r1, 24\n\
	ldrh r0, [r2, 0x24]\n\
	subs r0, r1\n\
	strh r0, [r2, 0x24]\n\
	adds r2, r3, 0\n\
	adds r3, r4, 0\n\
	b _08131C8E\n\
	.align 2, 0\n\
_08131C6C: .4byte gTasks\n\
_08131C70: .4byte gBattleAnimAttacker\n\
_08131C74: .4byte gSprites\n\
_08131C78:\n\
	ldr r2, _08131CDC @ =gSprites\n\
	lsls r3, r5, 4\n\
	adds r1, r3, r5\n\
	lsls r1, 2\n\
	adds r1, r2\n\
	ldrh r0, [r6, 0xA]\n\
	lsls r0, 16\n\
	asrs r0, 24\n\
	ldrh r4, [r1, 0x24]\n\
	adds r0, r4\n\
	strh r0, [r1, 0x24]\n\
_08131C8E:\n\
	ldr r1, _08131CE0 @ =gTasks\n\
	mov r0, r9\n\
	add r0, r8\n\
	lsls r0, 3\n\
	adds r6, r0, r1\n\
	ldrb r0, [r6, 0xA]\n\
	strh r0, [r6, 0xA]\n\
	adds r1, r3, r5\n\
	lsls r1, 2\n\
	adds r1, r2\n\
	ldrh r0, [r1, 0x24]\n\
	ldrh r1, [r1, 0x20]\n\
	adds r0, r1\n\
	lsls r0, 16\n\
	lsrs r5, r0, 16\n\
	movs r1, 0x24\n\
	ldrsh r0, [r6, r1]\n\
	cmp r0, 0\n\
	bne _08131D0E\n\
	ldr r0, _08131CE4 @ =gBattleAnimAttacker\n\
	ldrb r0, [r0]\n\
	bl GetBattlerSide\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	bne _08131CEC\n\
	lsls r4, r5, 16\n\
	asrs r4, 16\n\
	ldr r0, _08131CE8 @ =gBattleAnimTarget\n\
	ldrb r0, [r0]\n\
	movs r1, 0\n\
	bl GetBattlerSpriteCoord\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	cmp r4, r0\n\
	bge _08131D0E\n\
	b _08131D02\n\
	.align 2, 0\n\
_08131CDC: .4byte gSprites\n\
_08131CE0: .4byte gTasks\n\
_08131CE4: .4byte gBattleAnimAttacker\n\
_08131CE8: .4byte gBattleAnimTarget\n\
_08131CEC:\n\
	lsls r4, r5, 16\n\
	asrs r4, 16\n\
	ldr r0, _08131D30 @ =gBattleAnimTarget\n\
	ldrb r0, [r0]\n\
	movs r1, 0\n\
	bl GetBattlerSpriteCoord\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	cmp r4, r0\n\
	ble _08131D0E\n\
_08131D02:\n\
	ldrh r0, [r6, 0x24]\n\
	adds r0, 0x1\n\
	strh r0, [r6, 0x24]\n\
	ldr r1, _08131D34 @ =gBattleAnimArgs\n\
	ldr r0, _08131D38 @ =0x0000ffff\n\
	strh r0, [r1, 0xE]\n\
_08131D0E:\n\
	lsls r0, r5, 16\n\
	movs r2, 0x80\n\
	lsls r2, 14\n\
	adds r0, r2\n\
	movs r1, 0x98\n\
	lsls r1, 17\n\
	cmp r0, r1\n\
	bhi _08131D20\n\
	b _08131EA0\n\
_08131D20:\n\
	ldr r0, _08131D3C @ =gTasks\n\
	mov r1, r9\n\
	add r1, r8\n\
	lsls r1, 3\n\
	adds r1, r0\n\
	movs r0, 0\n\
	strh r0, [r1, 0xA]\n\
	b _08131DB6\n\
	.align 2, 0\n\
_08131D30: .4byte gBattleAnimTarget\n\
_08131D34: .4byte gBattleAnimArgs\n\
_08131D38: .4byte 0x0000ffff\n\
_08131D3C: .4byte gTasks\n\
_08131D40:\n\
	movs r0, 0\n\
	bl GetAnimBattlerSpriteId\n\
	lsls r0, 24\n\
	lsrs r7, r0, 24\n\
	ldr r1, _08131D8C @ =gTasks\n\
	mov r3, r8\n\
	lsls r4, r3, 2\n\
	adds r0, r4, r3\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	ldrh r0, [r0, 0x26]\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
	lsls r0, r5, 4\n\
	adds r0, r5\n\
	lsls r0, 2\n\
	ldr r5, _08131D90 @ =gSprites\n\
	adds r0, r5\n\
	bl DestroySpriteAndFreeResources_\n\
	ldr r0, _08131D94 @ =gBattleAnimAttacker\n\
	ldrb r0, [r0]\n\
	bl GetBattlerSide\n\
	lsls r0, 24\n\
	mov r9, r4\n\
	cmp r0, 0\n\
	bne _08131D98\n\
	lsls r1, r7, 4\n\
	adds r1, r7\n\
	lsls r1, 2\n\
	adds r1, r5\n\
	ldrh r0, [r1, 0x20]\n\
	negs r0, r0\n\
	subs r0, 0x20\n\
	strh r0, [r1, 0x24]\n\
	b _08131DAC\n\
	.align 2, 0\n\
_08131D8C: .4byte gTasks\n\
_08131D90: .4byte gSprites\n\
_08131D94: .4byte gBattleAnimAttacker\n\
_08131D98:\n\
	lsls r0, r7, 4\n\
	adds r0, r7\n\
	lsls r0, 2\n\
	adds r0, r5\n\
	ldrh r2, [r0, 0x20]\n\
	movs r4, 0x88\n\
	lsls r4, 1\n\
	adds r1, r4, 0\n\
	subs r1, r2\n\
	strh r1, [r0, 0x24]\n\
_08131DAC:\n\
	ldr r0, _08131DC0 @ =gTasks\n\
	mov r1, r9\n\
	add r1, r8\n\
	lsls r1, 3\n\
	adds r1, r0\n\
_08131DB6:\n\
	ldrh r0, [r1, 0x8]\n\
	adds r0, 0x1\n\
	strh r0, [r1, 0x8]\n\
	b _08131EA0\n\
	.align 2, 0\n\
_08131DC0: .4byte gTasks\n\
_08131DC4:\n\
	movs r0, 0\n\
	bl GetAnimBattlerSpriteId\n\
	lsls r0, 24\n\
	lsrs r7, r0, 24\n\
	ldr r1, _08131E38 @ =gTasks\n\
	mov r0, r8\n\
	lsls r4, r0, 2\n\
	adds r0, r4, r0\n\
	lsls r0, 3\n\
	adds r2, r0, r1\n\
	movs r1, 0x80\n\
	lsls r1, 4\n\
	adds r0, r1, 0\n\
	ldrh r3, [r2, 0xA]\n\
	adds r0, r3\n\
	strh r0, [r2, 0xA]\n\
	ldr r0, _08131E3C @ =gBattleAnimAttacker\n\
	mov r10, r0\n\
	ldrb r0, [r0]\n\
	str r2, [sp, 0x10]\n\
	bl GetBattlerSide\n\
	lsls r0, 24\n\
	mov r9, r4\n\
	ldr r2, [sp, 0x10]\n\
	cmp r0, 0\n\
	bne _08131E44\n\
	ldr r1, _08131E40 @ =gSprites\n\
	lsls r5, r7, 4\n\
	adds r0, r5, r7\n\
	lsls r0, 2\n\
	adds r6, r0, r1\n\
	ldrh r0, [r2, 0xA]\n\
	lsls r0, 16\n\
	asrs r0, 24\n\
	ldrh r1, [r6, 0x24]\n\
	adds r0, r1\n\
	strh r0, [r6, 0x24]\n\
	movs r2, 0x24\n\
	ldrsh r4, [r6, r2]\n\
	movs r3, 0x20\n\
	ldrsh r0, [r6, r3]\n\
	adds r4, r0\n\
	mov r1, r10\n\
	ldrb r0, [r1]\n\
	movs r1, 0\n\
	bl GetBattlerSpriteCoord\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	adds r3, r5, 0\n\
	cmp r4, r0\n\
	blt _08131E7C\n\
	movs r2, 0\n\
	strh r2, [r6, 0x24]\n\
	b _08131E7C\n\
	.align 2, 0\n\
_08131E38: .4byte gTasks\n\
_08131E3C: .4byte gBattleAnimAttacker\n\
_08131E40: .4byte gSprites\n\
_08131E44:\n\
	ldr r1, _08131EB0 @ =gSprites\n\
	lsls r5, r7, 4\n\
	adds r0, r5, r7\n\
	lsls r0, 2\n\
	adds r6, r0, r1\n\
	ldrh r1, [r2, 0xA]\n\
	lsls r1, 16\n\
	asrs r1, 24\n\
	ldrh r0, [r6, 0x24]\n\
	subs r0, r1\n\
	strh r0, [r6, 0x24]\n\
	movs r3, 0x24\n\
	ldrsh r4, [r6, r3]\n\
	movs r1, 0x20\n\
	ldrsh r0, [r6, r1]\n\
	adds r4, r0\n\
	mov r2, r10\n\
	ldrb r0, [r2]\n\
	movs r1, 0\n\
	bl GetBattlerSpriteCoord\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	adds r3, r5, 0\n\
	cmp r4, r0\n\
	bgt _08131E7C\n\
	movs r4, 0\n\
	strh r4, [r6, 0x24]\n\
_08131E7C:\n\
	ldr r1, _08131EB4 @ =gTasks\n\
	mov r0, r9\n\
	add r0, r8\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	ldrb r1, [r0, 0xA]\n\
	strh r1, [r0, 0xA]\n\
	ldr r1, _08131EB0 @ =gSprites\n\
	adds r0, r3, r7\n\
	lsls r0, 2\n\
	adds r0, r1\n\
	movs r1, 0x24\n\
	ldrsh r0, [r0, r1]\n\
	cmp r0, 0\n\
	bne _08131EA0\n\
	mov r0, r8\n\
	bl DestroyAnimVisualTask\n\
_08131EA0:\n\
	add sp, 0x14\n\
	pop {r3-r5}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	mov r10, r5\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_08131EB0: .4byte gSprites\n\
_08131EB4: .4byte gTasks\n\
    .syntax divided");
}
#endif // NONMATCHING

void sub_8131EB8(struct Sprite *sprite)
{
    switch (sprite->data[7])
    {
    case 0:
        if (gBattleAnimArgs[7] == -1)
        {
            PlaySE12WithPanning(SE_M_VITAL_THROW, BattleAnimAdjustPanning(63));
            sprite->y = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y) + 16;
            sprite->data[0] = -32;
            sprite->data[7]++;
            sprite->invisible = FALSE;
            if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_OPPONENT && !IsContest())
                sprite->subpriority = gSprites[GetAnimBattlerSpriteId(ANIM_BATTLER_TARGET)].subpriority - 1;
        }
        else
        {
            sprite->invisible = TRUE;
        }
        break;
    case 1:
        sprite->y2 = Sin(sprite->data[1], sprite->data[0]);
        sprite->data[1] += 5;
        if (sprite->data[1] > 0x7F)
        {
            sprite->data[0] = sprite->data[0] / 2;
            sprite->data[3]++;
            sprite->data[1] -= 0x7F;
        }

        sprite->data[2] += 0x100;
        if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER)
            sprite->x2 -= (sprite->data[2] >> 8);
        else
            sprite->x2 += (sprite->data[2] >> 8);

        sprite->data[2] &= 0xFF;
        if (sprite->data[3] == 2)
            DestroyAnimSprite(sprite);
        break;
    }
}

// Quickly moves the mon towards its partner and back.
// No args.
void AnimTask_SnatchPartnerMove(u8 taskId)
{
    s16 attackerX, targetX;
    u8 spriteId;

    switch (gTasks[taskId].data[15])
    {
    case 0:
        attackerX = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X);
        targetX = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X);
        gTasks[taskId].data[0] = 6;
        if (attackerX > targetX)
            gTasks[taskId].data[0] *= -1;

        gTasks[taskId].data[1] = attackerX;
        gTasks[taskId].data[2] = targetX;
        gTasks[taskId].data[15]++;
        break;
    case 1:
        spriteId = gBattlerSpriteIds[gBattleAnimAttacker];
        gSprites[spriteId].x2 += gTasks[taskId].data[0];
        if (gTasks[taskId].data[0] > 0)
        {
            if (gSprites[spriteId].x + gSprites[spriteId].x2 >= gTasks[taskId].data[2])
                gTasks[taskId].data[15]++;
        }
        else
        {
            if (gSprites[spriteId].x + gSprites[spriteId].x2 <= gTasks[taskId].data[2])
                gTasks[taskId].data[15]++;
        }
        break;
    case 2:
        gTasks[taskId].data[0] *= -1;
        gTasks[taskId].data[15]++;
        break;
    case 3:
        spriteId = gBattlerSpriteIds[gBattleAnimAttacker];
        gSprites[spriteId].x2 += gTasks[taskId].data[0];
        if (gTasks[taskId].data[0] < 0)
        {
            if (gSprites[spriteId].x + gSprites[spriteId].x2 <= gTasks[taskId].data[1])
                gTasks[taskId].data[15]++;
        }
        else
        {
            if (gSprites[spriteId].x + gSprites[spriteId].x2 >= gTasks[taskId].data[1])
                gTasks[taskId].data[15]++;
        }
        break;
    case 4:
    default:
        spriteId = gBattlerSpriteIds[gBattleAnimAttacker];
        gSprites[spriteId].x2 = 0;
        DestroyAnimVisualTask(taskId);
        break;
    }
}

// Moves the mon's sprite back and forth in an unpredictable swaying motion.
// No args.
void AnimTask_TeeterDanceMovement(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    task->data[3] = GetAnimBattlerSpriteId(ANIM_BATTLER_ATTACKER);
    task->data[4] = GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER ? 1 : -1;
    task->data[6] = gSprites[task->data[3]].y;
    task->data[5] = gSprites[task->data[3]].x;
    task->data[9] = 0;
    task->data[11] = 0;
    task->data[10] = 1;
    task->data[12] = 0;
    task->func = AnimTask_TeeterDanceMovementStep;
}

static void AnimTask_TeeterDanceMovementStep(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    switch (task->data[0])
    {
    case 0:
        task->data[11] += 8;
        task->data[11] &= 0xFF;
        gSprites[task->data[3]].x2 = gSineTable[task->data[11]] >> 5;
        task->data[9] += 2;
        task->data[9] &= 0xFF;
        gSprites[task->data[3]].x = (gSineTable[task->data[9]] >> 3) * task->data[4] + task->data[5];
        if (task->data[9] == 0)
        {
            gSprites[task->data[3]].x = task->data[5];
            task->data[0]++;
        }
        break;
    case 1:
        task->data[11] += 8;
        task->data[11] &= 0xFF;
        gSprites[task->data[3]].x2 = gSineTable[task->data[11]] >> 5;
        if (task->data[11] == 0)
        {
            gSprites[task->data[3]].x2 = 0;
            task->data[0]++;
        }
        break;
    case 2:
        DestroyAnimVisualTask(taskId);
        break;
    }
}

static void AnimKnockOffStrikeStep(struct Sprite *sprite)
{
    // These two cases are identical.
    if (GetBattlerSide(gBattleAnimTarget) == B_SIDE_PLAYER)
    {
        sprite->data[1] += sprite->data[0];
        sprite->data[1] &= 0xFF;
    }
    else
    {
        sprite->data[1] += sprite->data[0];
        sprite->data[1] &= 0xFF;
    }

    sprite->x2 = Cos(sprite->data[1], 20);
    sprite->y2 = Sin(sprite->data[1], 20);
    if (sprite->animEnded)
        DestroyAnimSprite(sprite);

    sprite->data[2]++;
}

// Animates a strike that swipes downard at the target mon.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
void AnimKnockOffStrike(struct Sprite *sprite)
{
    if (GetBattlerSide(gBattleAnimTarget) == B_SIDE_PLAYER)
    {
        sprite->x -= gBattleAnimArgs[0];
        sprite->y += gBattleAnimArgs[1];
        sprite->data[0] = -11;
        sprite->data[1] = 192;
        StartSpriteAffineAnim(sprite, 1);
    }
    else
    {
        sprite->data[0] = 11;
        sprite->data[1] = 192;
        sprite->x += gBattleAnimArgs[0];
        sprite->y += gBattleAnimArgs[1];
    }

    sprite->callback = AnimKnockOffStrikeStep;
}

// Gradually fades a rotating recyle arrow sprite in and back out.
// No args.
void AnimRecycle(struct Sprite *sprite)
{
    sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X_2);
    sprite->y = GetBattlerSpriteCoordAttr(gBattleAnimAttacker, BATTLER_COORD_ATTR_TOP);
    if (sprite->y < 16)
        sprite->y = 16;

    sprite->data[6] = 0;
    sprite->data[7] = 16;
    sprite->callback = AnimRecycleStep;
    REG_BLDALPHA = BLDALPHA_BLEND(sprite->data[6], sprite->data[7]);
}

static void AnimRecycleStep(struct Sprite *sprite)
{
    switch (sprite->data[2])
    {
    case 0:
        if (++sprite->data[0] > 1)
        {
            sprite->data[0] = 0;
            if (!(sprite->data[1] & 1))
            {
                if (sprite->data[6] < 16)
                    sprite->data[6]++;
            }
            else
            {
                if (sprite->data[7] != 0)
                    sprite->data[7]--;
            }

            sprite->data[1]++;
            REG_BLDALPHA = BLDALPHA_BLEND(sprite->data[6], sprite->data[7]);
            if (sprite->data[7] == 0)
                sprite->data[2]++;
        }
        break;
    case 1:
        if (++sprite->data[0] == 10)
        {
            sprite->data[0] = 0;
            sprite->data[1] = 0;
            sprite->data[2]++;
        }
        break;
    case 2:
        if (++sprite->data[0] > 1)
        {
            sprite->data[0] = 0;
            if (!(sprite->data[1] & 1))
            {
                if (sprite->data[6] != 0)
                    sprite->data[6]--;
            }
            else
            {
                if (sprite->data[7] < 16)
                    sprite->data[7]++;
            }

            sprite->data[1]++;
            REG_BLDALPHA = BLDALPHA_BLEND(sprite->data[6], sprite->data[7]);
            if (sprite->data[7] == 16)
                sprite->data[2]++;
        }
        break;
    case 3:
        DestroySpriteAndMatrix(sprite);
        break;
    }
}

void AnimTask_GetWeather(u8 taskId)
{
    gBattleAnimArgs[7] = ANIM_WEATHER_NONE;
    if (gWeatherMoveAnim & WEATHER_SUN_ANY)
        gBattleAnimArgs[7] = ANIM_WEATHER_SUN;
    else if (gWeatherMoveAnim & WEATHER_RAIN_ANY)
        gBattleAnimArgs[7] = ANIM_WEATHER_RAIN;
    else if (gWeatherMoveAnim & WEATHER_SANDSTORM_ANY)
        gBattleAnimArgs[7] = ANIM_WEATHER_SANDSTORM;
    else if (gWeatherMoveAnim & WEATHER_HAIL_ANY)
        gBattleAnimArgs[7] = ANIM_WEATHER_HAIL;

    DestroyAnimVisualTask(taskId);
}

// Squishes the mon sprite vertically, and shakes it back and forth.
// arg 0: which battler
void AnimTask_SlackOffSquish(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    task->data[0] = 0;
    task->data[15] = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);
    PrepareAffineAnimInTaskData(task, task->data[15], gSlackOffSquishAffineAnimCmds);
    task->func = AnimTask_SlackOffSquishStep;
}

static void AnimTask_SlackOffSquishStep(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    gTasks[taskId].data[0]++;
    if (gTasks[taskId].data[0] > 16 && gTasks[taskId].data[0] < 40)
    {
        if (++task->data[1] > 2)
        {
            task->data[1] = 0;
            task->data[2]++;
            if (!(task->data[2] & 1))
                gSprites[task->data[15]].x2 = -1;
            else
                gSprites[task->data[15]].x2 = 1;
        }
    }
    else
    {
        gSprites[task->data[15]].x2 = 0;
    }

    if (!RunAffineAnimFromTaskData(&gTasks[taskId]))
        DestroyAnimVisualTask(taskId);
}
