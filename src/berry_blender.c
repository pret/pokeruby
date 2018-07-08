#include "global.h"
#include "berry.h"
#include "decompress.h"
#include "event_data.h"
#include "ewram.h"
#include "item.h"
#include "link.h"
#include "m4a.h"
#include "main.h"
#include "menu.h"
#include "menu_cursor.h"
#include "overworld.h"
#include "palette.h"
#include "pokeblock.h"
#include "random.h"
#include "save.h"
#include "sound.h"
#include "string_util.h"
#include "strings2.h"
#include "task.h"
#include "text_window.h"
#include "trig.h"
#include "constants/songs.h"
#include "constants/items.h"

#define BLENDER_SCORE_BEST      0
#define BLENDER_SCORE_GOOD      1
#define BLENDER_SCORE_MISS      2

#define BLENDER_MAX_PLAYERS 4
#define BLENDER_SCORES_NO   3

#define FLAVOUR_SPICY       0
#define FLAVOUR_DRY         1
#define FLAVOUR_SWEET       2
#define FLAVOUR_BITTER      3
#define FLAVOUR_SOUR        4

struct BlenderBerry
{
    u16 itemID;
    u8 name[7];
    u8 flavours[5];
    u8 smoothness;
};

struct BerryBlenderData
{
    u8 field_0;
    u8 field_1;
    struct Window field_4;
    u8 field_35;
    u8 field_36;
    u8 field_37;
    u8 field_38;
    u8 field_39;
    u8 field_3A;
    u8 field_3B;
    u8 field_3C;
    u8 field_3D;
    u8 field_3E;
    u8 field_3F;
    u8 field_40;
    u8 field_41;
    u8 field_42;
    u8 field_43;
    u8 field_44;
    u8 field_45;
    u8 field_46;
    u8 field_47;
    u8 field_48;
    u8 field_49;
    u8 field_4A;
    u8 field_4B;
    u8 field_4C;
    u8 field_4D;
    u16 field_4E;
    u8 scoreIconIDs[3];
    u16 arrowPos;
    s16 field_56;
    s16 field_58;
    u16 max_RPM;
    u8 SyncArrowSpriteID[BLENDER_MAX_PLAYERS];
    u8 SyncArrowSprite2ID[BLENDER_MAX_PLAYERS];
    u8 field_64;
    u8 field_65;
    u8 field_66;
    u8 field_67;
    u8 field_68;
    u8 field_69;
    u8 field_6A;
    u8 field_6B;
    u8 field_6C;
    u8 field_6D;
    u8 field_6E;
    u8 field_6F;
    u16 field_70[BLENDER_MAX_PLAYERS];
    u16 field_78;
    u16 field_7A;
    u16 field_7C;
    u8 field_7E;
    u8 field_7F;
    u16 chosenItemID[BLENDER_MAX_PLAYERS];
    u8 playersNo;
    u8 field_89;
    u8 field_8A;
    u8 field_8B;
    u8 field_8C;
    u8 field_8D;
    u8 field_8E;
    u8 field_8F;
    u8 field_90;
    u8 field_91;
    u8 field_92;
    u8 field_93;
    u16 field_94;
    u8 field_96;
    u8 field_97;
    u8 field_98;
    u8 field_99;
    u16 field_9A[BLENDER_MAX_PLAYERS];
    u16 field_A2[BLENDER_MAX_PLAYERS];
    u8 field_AA;
    u8 stringVar[129];
    u32 gameFrameTime;
    s32 framesToWait;
    u32 field_134;
    u8 field_138;
    u8 field_139;
    u8 field_13A;
    u8 field_13B;
    u8 field_13C;
    u8 field_13D;
    u16 field_13E;
    u16 field_140;
    u16 field_142;
    s16 field_144;
    s16 field_146;
    u8 field_148[3];
    u8 field_14B;
    u16 scores[BLENDER_MAX_PLAYERS][3];
    u8 playerPlaces[BLENDER_MAX_PLAYERS];
    struct BgAffineDstData field_168;
    u16 field_178;
    struct BlenderBerry blendedBerries[BLENDER_MAX_PLAYERS];
    u32 field_1BC;
    u16 field_1C0;
    u16 field_1C2;
    u32 field_1C4;
};

struct BlenderDebug
{
    s8 cursorPos;
    s8 berries[4];
    struct Pokeblock pokeblock;
    u8 field_10;
    u8 spicy;
    u8 dry;
    u8 sweet;
    u8 bitter;
    u8 sour;
    u8 feel;
    s8 field_17;
    s8 field_18;
    s8 field_19;
    s16 BPM;
};

// other files functions
void m4aMPlayPitchControl(struct MusicPlayerInfo *mplayInfo, u16 trackBits, s16 pitch);
void m4aMPlayTempoControl(struct MusicPlayerInfo *mplayInfo, u16 tempo);
void m4aMPlayStop(struct MusicPlayerInfo *mplayInfo);
void sub_80A6978(void);
u8 sub_80A7DEC(u8 berryId, u8 x, u8 y, bool8 animate);
void MenuCursor_SetPos814A880(u8 a1, u8 a2);
u8 MenuCursor_Create814A5C0(u8 a1, u16 a2, u8 a3, u16 a4, u8 a5);
s8 GetFirstFreePokeblockSlot(void);
#ifdef GERMAN
extern void de_sub_8073110();
#endif

extern struct MusicPlayerInfo gMPlay_SE2;
extern struct MusicPlayerInfo gMPlay_BGM;
extern u16 gSpecialVar_ItemId;
extern u8 gUnknown_020297ED;
extern u8 byte_3002A68;

extern const u8 gUnknown_08E6C100[];
extern const u8 gUnknown_08E6C920[];
extern const u8 gUnknown_08E6D354[];
extern const struct WindowTemplate gWindowTemplate_81E6F68;
extern const u8 *const gPokeblockNames[];
extern const struct Berry gBerries[];

extern const u8 gBerryBlenderArrowTiles[];
extern const u8 gBerryBlenderMarubatsuTiles[];
extern const u8 gBerryBlenderParticlesTiles[];
extern const u8 gBerryBlenderCountdownNumbersTiles[];
extern const u8 gBerryBlenderStartTiles[];
extern const u16 gBerryBlenderMiscPalette[];
extern const u16 gBerryBlenderArrowPalette[];

// ewram
static EWRAM_DATA u8 gUnknown_020297DC = 0;
static EWRAM_DATA u32 gUnknown_020297E0 = 0;
static EWRAM_DATA u32 gUnknown_020297E4 = 0;
static EWRAM_DATA u8 gUnknown_020297E8 = 0;

// iwram common
u16 gUnknown_03004830;
u8 gInGameOpponentsNo;
u16 gUnknown_03004840[10];
struct BerryBlenderData* gBerryBlenderData;

// iwram bss
IWRAM_DATA s16 gUnknown_03000510[8];
IWRAM_DATA s16 gUnknown_03000520[6];
IWRAM_DATA s16 gUnknown_0300052C;
IWRAM_DATA s16 gUnknown_0300052E;
IWRAM_DATA s32 gUnknown_03000530[6];
IWRAM_DATA s32 gUnknown_03000548[5];
IWRAM_DATA u32 gUnknown_0300055C;
IWRAM_DATA struct BlenderDebug sBlenderDebug;

// this file's functions
void Blender_SetBankBerryData(u8 bank, u16 itemID);

static void sub_80514A4(void);
static void sub_80514F0(void);
static void sub_804E56C(void);
static void Blender_SetPlayerNamesLocal(u8 NoOfOpponents);
static void sub_8051474(void);
static void sub_804E9F8(void);
static void sub_804F378(void);
static void sub_8051414(struct BgAffineDstData *dest);
static void sub_804F238(void);
static void sub_80501FC(void);
static bool8 sub_8051B8C(void);
static void sub_804F2A8(void);
static void sub_804F81C(void);
static void sub_805156C(void);
void sub_8051684(struct Sprite* sprite);
static void sub_8051AC8(s16* a0, u16 a1);
static void sub_805194C(u16 a0, u16 a1);
static void sub_8051A3C(u16 a0);
static void sub_8051B18(void);
static void sub_805123C(void);
static void sub_8050954(void);
static bool8 Blender_PrintBlendingRanking(void);
bool8 Blender_PrintBlendingResults(void);
static void sub_80510E8(void);
static void sub_8050E30(void);
static void sub_805197C(u16 a0, u16 a1);
static void Blender_PrintMadePokeblockString(struct Pokeblock* pokeblock, u8* dst);
static void sub_8052BD0(u8 taskID);
static void sub_8052AF8(void);
static void sub_804F8C8(u8 taskID);
static void sub_804F9F4(u8 taskID);
static void sub_804FB1C(u8 taskID);
static void sub_8051C04(struct Sprite* sprite);
static void sub_8051650(struct Sprite* sprite);
static void sub_805181C(struct Sprite* sprite);
static void sub_80518CC(struct Sprite* sprite);

// const data
static const u16 sBlenderCenterPal[] = INCBIN_U16("graphics/berry_blender/center.gbapal");
static const u8 sBlenderCenterMap[] = INCBIN_U8("graphics/berry_blender/center_map.bin");
static const u16 sBlenderOuterPal[] = INCBIN_U16("graphics/berry_blender/outer.gbapal");

// unreferenced pals?
static const u16 sUnknownPal_0[] = INCBIN_U16("graphics/unused/unknown/821604C.gbapal");
static const u16 sUnknownArray_1[224] = {0};

// unreferenced Japanese strings
static const u8 sUnknownJpnString0[] = _("▶");
static const u8 sUnknownJpnString1[] = _(" ");
static const u8 sUnknownJpnString2[] = _("カッコイ"); // "cool" (missing an イ at the end)
static const u8 sUnknownJpnString3[] = _("カワイイ"); // "cute"
static const u8 sUnknownJpnString4[] = _("ウツクシ"); // "beautiful" (missing an イ at the end)
static const u8 sUnknownJpnString5[] = _("カシコイ"); // "smart"
static const u8 sUnknownJpnString6[] = _("タクマシ"); // "tough" (missing an イ at the end)

static const u8 gUnknown_08216249[] = _("\p");

// unreferenced; These appear to be the first names of four people who worked on the game.
static const u8 sUnknownJpnString7[10] = _("てつじ"); // Tetsuji (Ohta)
static const u8 sUnknownJpnString8[10] = _("あきと"); // Akito (Mori)
static const u8 sUnknownJpnString9[10] = _("シゲル"); // Shigeru (Ohmori)
static const u8 sUnknownJpnString10[10] = _("ヨシノリ"); // Yoshinori (Matsuda)

static const u8 sUnknownText_2Pok[] = _("2Pok");
static const u8 sUnknownText_3Pok[] = _("3Pok");
static const u8 sUnknownText_4Pok[] = _("4Pok");
static const u8* const gUnknown_08216284[] =
{
      sUnknownText_2Pok, sUnknownText_3Pok, sUnknownText_4Pok
};

// unreferenced player strings
static const u8 sUnknown1PString[4] = _("1P");
static const u8 sUnknown2PString[4] = _("2P");
static const u8 sUnknown3PString[4] = _("3P");
static const u8 sUnknown4PString[4] = _("4P");

#ifdef ENGLISH
static const u8 sBlenderOpponentName1[] = _("MISTER");
static const u8 sBlenderOpponentName2[] = _("LADDIE");
static const u8 sBlenderOpponentName3[] = _("LASSIE");
#else // GERMAN
static const u8 sBlenderOpponentName1[] = _("OPI");
static const u8 sBlenderOpponentName2[] = _("KUMPEL");
static const u8 sBlenderOpponentName3[] = _("TUSSI");
#endif // ENGLISH
static const u8* const sBlenderOpponentsNames[] =
{
    sBlenderOpponentName1, sBlenderOpponentName2, sBlenderOpponentName3
};

static const u8 sRedColorString[] = _("{COLOR RED}");
static const u8 sNewLineString_0[] = _("\n");
static const u8 sSpaceString_0[] = _(" ");

static const s8 gUnknown_082162CC[][2] =
{
    {-1, -1}, {1, -1}, {-1, 1}, {1, 1}
};

static const u8 gUnknown_082162D4[][2] =
{
    {2, 6}, {23, 6}, {2, 12}, {23, 12}, {1, 6}, {22, 6}, {1, 12}, {22, 12}
};

static const u8 sBlenderSyncArrowsPos[][2] =
{
    {72, 32}, {168, 32}, {72, 128}, {168, 128}
};

static const u8 gUnknown_082162EC[3][4] =
{
    {-1, 0, 1, -1}, {-1, 0, 1, 2}, {0, 1, 2, 3}
};

static const u16 gUnknown_082162F8[] = {0, 0xC000, 0x4000, 0x8000};
static const u8 gUnknown_08216300[] = {1, 1, 0};
static const u8 gUnknown_08216303[] = {32, 224, 96, 160, 0};

static const TaskFunc gUnknown_08216308[] =
{
    sub_804F8C8, sub_804F9F4, sub_804FB1C
};

static const struct OamData sOamData_8216314 =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 2,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd sSpriteAnim_821631C[] =
{
    ANIMCMD_FRAME(16, 5, 1, 1),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_8216324[] =
{
    ANIMCMD_FRAME(16, 5, .vFlip = TRUE),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_821632C[] =
{
    ANIMCMD_FRAME(16, 5, .hFlip = TRUE),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_8216334[] =
{
    ANIMCMD_FRAME(16, 5, 0, 0),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_821633C[] =
{
    ANIMCMD_FRAME(48, 2, 1, 1),
    ANIMCMD_FRAME(32, 5, 1, 1),
    ANIMCMD_FRAME(48, 3, 1, 1),
    ANIMCMD_FRAME(16, 5, 1, 1),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_8216350[] =
{
    ANIMCMD_FRAME(48, 2, .vFlip = TRUE),
    ANIMCMD_FRAME(32, 5, .vFlip = TRUE),
    ANIMCMD_FRAME(48, 3, .vFlip = TRUE),
    ANIMCMD_FRAME(16, 5, .vFlip = TRUE),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_8216364[] =
{
    ANIMCMD_FRAME(48, 2, .hFlip = TRUE),
    ANIMCMD_FRAME(32, 5, .hFlip = TRUE),
    ANIMCMD_FRAME(48, 3, .hFlip = TRUE),
    ANIMCMD_FRAME(16, 5, .hFlip = TRUE),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_8216378[] =
{
    ANIMCMD_FRAME(48, 2, 0, 0),
    ANIMCMD_FRAME(32, 5, 0, 0),
    ANIMCMD_FRAME(48, 3, 0, 0),
    ANIMCMD_FRAME(16, 5, 0, 0),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_821638C[] =
{
    ANIMCMD_FRAME(0, 5, 1, 1),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_8216394[] =
{
    ANIMCMD_FRAME(0, 5, .vFlip = TRUE),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_821639C[] =
{
    ANIMCMD_FRAME(0, 5, .hFlip = TRUE),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_82163A4[] =
{
    ANIMCMD_FRAME(0, 5, 0, 0),
    ANIMCMD_END
};

static const union AnimCmd *const sSpriteAnimTable_82163AC[] =
{
    sSpriteAnim_821631C,
    sSpriteAnim_8216324,
    sSpriteAnim_821632C,
    sSpriteAnim_8216334,
    sSpriteAnim_821633C,
    sSpriteAnim_8216350,
    sSpriteAnim_8216364,
    sSpriteAnim_8216378,
    sSpriteAnim_821638C,
    sSpriteAnim_8216394,
    sSpriteAnim_821639C,
    sSpriteAnim_82163A4
};

static const struct SpriteSheet gUnknown_082163DC =
{
    gBerryBlenderArrowTiles, 0x800, 46545
};

static const struct SpritePalette gUnknown_082163E4 =
{
    gBerryBlenderMiscPalette, 46546
};

static const struct SpritePalette gUnknown_082163EC =
{
    gBerryBlenderArrowPalette, 12312
};

static const struct SpriteTemplate sBlenderSyncArrow_SpriteTemplate =
{
    .tileTag = 46545,
    .paletteTag = 12312,
    .oam = &sOamData_8216314,
    .anims = sSpriteAnimTable_82163AC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_8051C04
};

static const struct OamData sOamData_821640C =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 1,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd sSpriteAnim_8216414[] =
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_821641C[] =
{
    ANIMCMD_FRAME(4, 20, 1, 0),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_8216424[] =
{
    ANIMCMD_FRAME(8, 4),
    ANIMCMD_FRAME(12, 4),
    ANIMCMD_FRAME(8, 4),
    ANIMCMD_FRAME(12, 4),
    ANIMCMD_FRAME(8, 4),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_821643C[] =
{
    ANIMCMD_FRAME(8, 4),
    ANIMCMD_END
};

static const union AnimCmd *const sSpriteAnimTable_8216444[] =
{
    sSpriteAnim_8216414,
    sSpriteAnim_821641C,
    sSpriteAnim_8216424,
    sSpriteAnim_821643C,
};

static const struct SpriteSheet gUnknown_08216454 =
{
    gBerryBlenderMarubatsuTiles, 0x200, 48888
};

static const struct SpriteTemplate sSpriteTemplate_821645C =
{
    .tileTag = 48888,
    .paletteTag = 46546,
    .oam = &sOamData_821640C,
    .anims = sSpriteAnimTable_8216444,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_8051650
};

static const struct OamData sOamData_8216474 =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 0,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd sSpriteAnim_821647C[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(3, 5),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_8216494[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_FRAME(4, 5),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_82164AC[] =
{
    ANIMCMD_FRAME(0, 2),
    ANIMCMD_FRAME(1, 2),
    ANIMCMD_FRAME(2, 2),
    ANIMCMD_FRAME(4, 4),
    ANIMCMD_FRAME(3, 3),
    ANIMCMD_FRAME(2, 2),
    ANIMCMD_FRAME(1, 2),
    ANIMCMD_FRAME(0, 2),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_82164D0[] =
{
    ANIMCMD_FRAME(5, 5, 1, 1),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_82164D8[] =
{
    ANIMCMD_FRAME(6, 5, 1, 1),
    ANIMCMD_END
};

static const union AnimCmd *const sSpriteAnimTable_82164E0[] =
{
    sSpriteAnim_821647C,
    sSpriteAnim_8216494,
    sSpriteAnim_82164AC,
    sSpriteAnim_82164D0,
    sSpriteAnim_82164D8,
};

static const struct SpriteSheet gUnknown_082164F4 =
{
    gBerryBlenderParticlesTiles, 0xE0, 23456
};

static const struct SpriteTemplate sSpriteTemplate_82164FC =
{
    .tileTag = 23456,
    .paletteTag = 46546,
    .oam = &sOamData_8216474,
    .anims = sSpriteAnimTable_82164E0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct OamData sOamData_8216514 =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 2,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd sSpriteAnim_821651C[] =
{
    ANIMCMD_FRAME(32, 30),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_8216524[] =
{
    ANIMCMD_FRAME(16, 30),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_821652C[] =
{
    ANIMCMD_FRAME(0, 30),
    ANIMCMD_END
};

static const union AnimCmd *const sSpriteAnimTable_8216534[] =
{
    sSpriteAnim_821651C,
    sSpriteAnim_8216524,
    sSpriteAnim_821652C,
};

static const struct SpriteSheet gUnknown_08216540 =
{
    gBerryBlenderCountdownNumbersTiles, 0x600, 12345
};

static const struct SpriteTemplate sSpriteTemplate_8216548 =
{
    .tileTag = 12345,
    .paletteTag = 46546,
    .oam = &sOamData_8216514,
    .anims = sSpriteAnimTable_8216534,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_805181C
};

static const struct OamData sOamData_8216560 =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 1,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd sSpriteAnim_8216568[] =
{
    ANIMCMD_FRAME(0, 30),
    ANIMCMD_END
};

static const union AnimCmd *const sSpriteAnimTable_8216570[] =
{
    sSpriteAnim_8216568,
};

static const struct SpriteSheet gUnknown_08216574 =
{
    gBerryBlenderStartTiles, 0x400, 12346
};

static const struct SpriteTemplate sSpriteTemplate_821657C =
{
    .tileTag = 12346,
    .paletteTag = 46546,
    .oam = &sOamData_8216560,
    .anims = sSpriteAnimTable_8216570,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80518CC
};

static const s16 gUnknown_08216594[][5] =
{
    {-10,  20,  10,   2,   1},
    {250,  20,  10,  -2,   1},
    {-10, 140,  10,   2,  -1},
    {250, 140,  10,  -2,  -1},
};

static const u8 gUnknown_082165BC[][3] =
{
    {4, 3, 2}, {0, 4, 3}, {1, 0, 4}, {2, 1, 0}, {3, 2, 1}, {0, 2, 3}, {1, 3, 4}, {2, 4, 0}, {3, 0, 1}, {4, 1, 2},
};

static const u8 gUnknown_082165DA[] = {1, 1, 2, 3, 4};
static const u8 gUnknown_082165DF[] = {0x1C, 0x16, 0x13, 0x1A, 0x19, 0x0E, 0x0D, 0x0B, 0x07, 0x15};
static const u8 gUnknown_082165E9[] = {6, 6, 6, 6, 5};
static const u8 gUnknown_082165EE[] = {3, 3, 3, 2, 2};
static const u8 gUnknown_082165F3[] = {3, 3, 3, 3, 2};

static const u8 sText_Space[] = _(" ");
static const u8 sText_BPM[] = _("BPM");
static const u8 sText_Dash[] = _("-");
static const u8 sNewLineString_1[] = _("\n");
static const u8 sNewLineString_2[] = _("\n");

static void Blender_ControlHitPitch(void)
{
    m4aMPlayPitchControl(&gMPlay_SE2, 0xFFFF, (gBerryBlenderData->field_56 - 128) * 2);
}

static void VBlankCB0_BerryBlender(void)
{
    sub_80514A4();
    sub_80514F0();
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void VBlankCB1_BerryBlender(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static bool8 sub_804E2EC(void)
{
    switch (gBerryBlenderData->field_1)
    {
    case 0:
        LZDecompressWram(gUnknown_08E6C100, ewram10000);
        gBerryBlenderData->field_1++;
        break;
    case 1:
        DmaCopy16Defvars(3, sBlenderCenterMap, (void *)(VRAM + 0x4000), 0x400);
        LoadPalette(sBlenderCenterPal, 0, 0x100);
        gBerryBlenderData->field_1++;
        break;
    case 2:
        DmaCopyLarge16(3, ewram10000, (void *)(VRAM + 0x0), 0x2000, 0x1000);
        gBerryBlenderData->field_1++;
        break;
    case 3:
        LZDecompressWram(gUnknown_08E6C920, ewram10000);
        gBerryBlenderData->field_1++;
        break;
    case 4:
        LZDecompressWram(gUnknown_08E6D354, ewram13000);
        gBerryBlenderData->field_1++;
        break;
    case 5:
        DmaCopy16Defvars(3, ewram10000, (void *)(VRAM + 0xE000), 0x1000);
        gBerryBlenderData->field_1++;
        break;
    case 6:
		DmaCopy16Defvars(3, ewram11000, (void *)(VRAM + 0xF000), 0x1000);
        gBerryBlenderData->field_1++;
        break;
    case 7:
        {
            u16 i;
            u16* palStore = (u16*)(ewram13000);

            for (i = 0; i < 640; i++)
            {
                *(palStore + i) |= 0x100;
            }
            DmaCopy16Defvars(3, ewram13000, (void *)(VRAM + 0x6000), 0x500);
            LoadPalette(sBlenderOuterPal, 0x80, 0x20);
            gBerryBlenderData->field_1++;
        }
        break;
    case 8:
        LoadSpriteSheet(&gUnknown_082163DC);
        LoadSpriteSheet(&gUnknown_082164F4);
        LoadSpriteSheet(&gUnknown_08216454);
        gBerryBlenderData->field_1++;
        break;
    case 9:
        LoadSpriteSheet(&gUnknown_08216540);
        LoadSpriteSheet(&gUnknown_08216574);
        LoadSpritePalette(&gUnknown_082163EC);
        LoadSpritePalette(&gUnknown_082163E4);
        gBerryBlenderData->field_1 = 0;
        return TRUE;
    }
    return FALSE;
}

static void sub_804E4FC(void)
{
    REG_DISPCNT = 0x1341;
    REG_BG2CNT = 0x4880;
    REG_BG1CNT = 0xC0D;
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
}

void DoBerryBlending(void)
{
    u8* field6F; //this temp value is needed to match

    gBerryBlenderData = eBerryBlenderData;

    field6F = &gBerryBlenderData->field_6F;
    gBerryBlenderData->field_0 = 0;
    *field6F = 0;

    Blender_SetPlayerNamesLocal(gSpecialVar_0x8004);
    SetMainCallback2(sub_804E56C);
}

static void sub_804E56C(void)
{
    s32 i;
    switch (gBerryBlenderData->field_0)
    {
    case 0:
        REG_DISPCNT = 0;
        ResetSpriteData();
        FreeAllSpritePalettes();
        SetVBlankCallback(NULL);
        Text_LoadWindowTemplate(&gWindowTemplate_81E6F68);
        InitMenuWindow(&gWindowTemplate_81E6F68);
        gBerryBlenderData->field_0++;
        gBerryBlenderData->field_140 = 0;
        gBerryBlenderData->field_13E = 0;
        gBerryBlenderData->field_142 = 0x50;
        gBerryBlenderData->field_144 = 0;
        gBerryBlenderData->field_146 = 0;
        gBerryBlenderData->field_1 = 0;
        sub_8051474();
        break;
    case 1:
        if (sub_804E2EC())
        {
            for (i = 0; i < BLENDER_MAX_PLAYERS; i++)
            {
                gBerryBlenderData->SyncArrowSpriteID[i] = CreateSprite(&sBlenderSyncArrow_SpriteTemplate, sBlenderSyncArrowsPos[i][0], sBlenderSyncArrowsPos[i][1], 1);
                StartSpriteAnim(&gSprites[gBerryBlenderData->SyncArrowSpriteID[i]], i + 8);
            }
            SetVBlankCallback(VBlankCB0_BerryBlender);
            gBerryBlenderData->field_0++;
        }
        break;
    case 2:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
        sub_8051474();
        gBerryBlenderData->field_0++;
        break;
    case 3:
        sub_804E4FC();
        if (!gPaletteFade.active)
        {
            gBerryBlenderData->field_0++;
        }
        break;
    case 4:
        Menu_DrawStdWindowFrame(0, 14, 29, 19);
        MenuPrintMessage(gOtherText_BlenderChooseBerry, 1, 15);
        gBerryBlenderData->field_0++;
        break;
    case 5:
        if (Menu_UpdateWindowText())
        {
            gBerryBlenderData->field_0++;
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        }
        break;
    case 6:
        if (!gPaletteFade.active)
        {
            sub_80A6978();
            gBerryBlenderData->field_0 = 0;
        }
        break;
    }
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_804E738(struct Sprite* sprite)
{
    sprite->data[1] += sprite->data[6];
    sprite->data[2] -= sprite->data[4];
    sprite->data[2] += sprite->data[7];
    sprite->data[0] += sprite->data[7];
    sprite->data[4]--;

    if (sprite->data[0] < sprite->data[2])
    {
        sprite->data[3] = sprite->data[4] = sprite->data[3] - 1;
        if (++sprite->data[5] > 3)
            DestroySprite(sprite);
        else
            PlaySE(SE_TB_KARA);
    }
    sprite->pos1.x = sprite->data[1];
    sprite->pos1.y = sprite->data[2];
}

void sub_804E794(struct Sprite* sprite, s16 a2, s16 a3, s16 a4, s16 a5, s16 a6)
{
    sprite->data[0] = a3;
    sprite->data[1] = a2;
    sprite->data[2] = a3;
    sprite->data[3] = a4;
    sprite->data[4] = 10;
    sprite->data[5] = 0;
    sprite->data[6] = a5;
    sprite->data[7] = a6;
    sprite->callback = sub_804E738;
}

static void sub_804E7C0(u16 a0, u8 a1)
{
    u8 spriteID = sub_80A7DEC(a0 + 123, 0, 80, a1 & 1);
    sub_804E794(&gSprites[spriteID], gUnknown_08216594[a1][0], gUnknown_08216594[a1][1], gUnknown_08216594[a1][2], gUnknown_08216594[a1][3], gUnknown_08216594[a1][4]);
}

static void Blender_CopyBerryData(struct BlenderBerry* berry, u16 itemID)
{
    const struct Berry *berryInfo = GetBerryInfo(itemID + 124);
    berry->itemID = itemID;
    StringCopy(berry->name, berryInfo->name);
    berry->flavours[FLAVOUR_SPICY] = berryInfo->spicy;
    berry->flavours[FLAVOUR_DRY] = berryInfo->dry;
    berry->flavours[FLAVOUR_SWEET] = berryInfo->sweet;
    berry->flavours[FLAVOUR_BITTER] = berryInfo->bitter;
    berry->flavours[FLAVOUR_SOUR] = berryInfo->sour;
    berry->smoothness = berryInfo->smoothness;
}

static void Blender_SetPlayerNamesLocal(u8 NoOfOpponents)
{
    int i;
    if (NoOfOpponents)
    {
        for (i = 0; i < 4; i++)
            gLinkPlayers[i].language = GAME_LANGUAGE;
    }
    switch (NoOfOpponents)
    {
    case 0:
        gInGameOpponentsNo = 0;
        break;
    case 1:
        gInGameOpponentsNo = 1;
        gBerryBlenderData->playersNo = 2;
        StringCopy(gLinkPlayers[0].name, gSaveBlock2.playerName);
        StringCopy(gLinkPlayers[1].name, sBlenderOpponentsNames[0]);
        break;
    case 2:
        gInGameOpponentsNo = 2;
        gBerryBlenderData->playersNo = 3;
        StringCopy(gLinkPlayers[0].name, gSaveBlock2.playerName);
        StringCopy(gLinkPlayers[1].name, sBlenderOpponentsNames[0]);
        StringCopy(gLinkPlayers[2].name, sBlenderOpponentsNames[1]);
        break;
    case 3:
        gInGameOpponentsNo = 3;
        gBerryBlenderData->playersNo = 4;
        StringCopy(gLinkPlayers[0].name, gSaveBlock2.playerName);
        StringCopy(gLinkPlayers[1].name, sBlenderOpponentsNames[0]);
        StringCopy(gLinkPlayers[2].name, sBlenderOpponentsNames[1]);
        StringCopy(gLinkPlayers[3].name, sBlenderOpponentsNames[2]);
        break;
    }
}

void sub_804E990(void)
{
    s32 i;

    REG_DISPCNT = 0;
    gBerryBlenderData = eBerryBlenderData;
    gBerryBlenderData->field_0 = 0;
    gBerryBlenderData->field_134 = 0;
    for (i = 0; i < BLENDER_MAX_PLAYERS; i++)
    {
        gBerryBlenderData->chosenItemID[i] = 0;
    }
    Blender_SetPlayerNamesLocal(gSpecialVar_0x8004);
    if (gSpecialVar_0x8004 == 0)
        SetMainCallback2(sub_804E9F8);
    else
        SetMainCallback2(sub_804F378);
}

static void sub_804E9F8(void)
{
    int i, j;
    switch (gBerryBlenderData->field_0)
    {
    case 0:
        ResetSpriteData();
        FreeAllSpritePalettes();
        ResetTasks();
        SetVBlankCallback(VBlankCB0_BerryBlender);
        Text_LoadWindowTemplate(&gWindowTemplate_81E6F68);
        InitMenuWindow(&gWindowTemplate_81E6F68);
        gLinkType = 0x4422;
        gBerryBlenderData->field_0++;
        gBerryBlenderData->field_4E = 0;
        gBerryBlenderData->field_7E = 0;
        gBerryBlenderData->field_144 = 0;
        gBerryBlenderData->field_146 = 0;
        for (i = 0; i < BLENDER_MAX_PLAYERS; i++)
        {
            gBerryBlenderData->field_70[i] = 0;
            for (j = 0; j < 3; j++)
            {
                gBerryBlenderData->scores[i][j] = 0;
            }
        }
        gBerryBlenderData->field_7C = 0;
        gBerryBlenderData->field_56 = 0;
        gBerryBlenderData->arrowPos = 0;
        gBerryBlenderData->max_RPM = 0;
        gBerryBlenderData->field_1 = 0;
        break;
    case 1:
        if (sub_804E2EC())
        {
            gBerryBlenderData->field_0++;
            sub_8051474();
        }
        break;
    case 2:
        for (i = 0; i < BLENDER_MAX_PLAYERS; i++)
        {
            gBerryBlenderData->SyncArrowSprite2ID[i] = CreateSprite(&sBlenderSyncArrow_SpriteTemplate, sBlenderSyncArrowsPos[i][0], sBlenderSyncArrowsPos[i][1], 1);
            StartSpriteAnim(&gSprites[gBerryBlenderData->SyncArrowSprite2ID[i]], i + 8);
        }
        gBerryBlenderData->field_0++;
        break;
    case 3:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
        gBerryBlenderData->field_0++;
        break;
    case 4:
        sub_804E4FC();
        if (!gPaletteFade.active)
        {
            gBerryBlenderData->field_0++;
        }
        break;
    case 5:
        Menu_DrawStdWindowFrame(0, 13, 29, 19);
        Menu_PrintText(gOtherText_LinkStandby3, 1, 14);
        gBerryBlenderData->field_0 = 8;
        gBerryBlenderData->framesToWait = 0;
        break;
    case 8:
        gBerryBlenderData->field_0++;
        gBerryBlenderData->field_13C = 0;
        Blender_CopyBerryData(&gBerryBlenderData->blendedBerries[0], gSpecialVar_ItemId);
        memcpy(gBlockSendBuffer, &gBerryBlenderData->blendedBerries[0], sizeof(struct BlenderBerry));
        sub_80084A4();
        gBerryBlenderData->framesToWait = 0;
        break;
    case 9:
        if (IsLinkTaskFinished())
        {
            ResetBlockReceivedFlags();
            if (GetMultiplayerId() == 0)
                sub_8007E9C(4);
            gBerryBlenderData->field_0++;
        }
        break;
    case 10:
        if (++gBerryBlenderData->framesToWait > 20)
        {
            Menu_EraseScreen();
            if (GetBlockReceivedStatus() == sub_8008198())
            {
                for (i = 0; i < GetLinkPlayerCount(); i++)
                {
                    memcpy(&gBerryBlenderData->blendedBerries[i], &gBlockRecvBuffer[i][0], sizeof(struct BlenderBerry));
                    gBerryBlenderData->chosenItemID[i] = gBerryBlenderData->blendedBerries[i].itemID;
                }
                ResetBlockReceivedFlags();
                gBerryBlenderData->field_0++;
            }
        }
        break;
    case 11:
        gBerryBlenderData->playersNo = GetLinkPlayerCount();
        for (i = 0; i < BLENDER_MAX_PLAYERS; i++)
        {
            if (gBerryBlenderData->field_13C == gUnknown_082162EC[gBerryBlenderData->playersNo - 2][i])
            {
                sub_804E7C0(gBerryBlenderData->chosenItemID[gBerryBlenderData->field_13C], i);
                break;
            }
        }
        gBerryBlenderData->framesToWait = 0;
        gBerryBlenderData->field_0++;
        gBerryBlenderData->field_13C++;
        break;
    case 12:
        if (++gBerryBlenderData->framesToWait > 60)
        {
            if (gBerryBlenderData->field_13C >= gBerryBlenderData->playersNo)
            {
                gBerryBlenderData->field_0++;
                gBerryBlenderData->arrowPos = gUnknown_082162F8[gUnknown_08216300[gBerryBlenderData->playersNo - 2]] - 22528;
            }
            else
                gBerryBlenderData->field_0--;
            gBerryBlenderData->framesToWait = 0;
        }
        break;
    case 13:
        if (IsLinkTaskFinished())
        {
            gBerryBlenderData->field_0++;
            sub_8051414(&gBerryBlenderData->field_168);
        }
        break;
    case 14:
        REG_DISPCNT |= 0x400;
        gBerryBlenderData->arrowPos += 0x200;
        gBerryBlenderData->field_142 += 4;
        if (gBerryBlenderData->field_142 > 255)
        {
            gBerryBlenderData->field_0++;
            gBerryBlenderData->field_142 = 256;
            gBerryBlenderData->arrowPos = gUnknown_082162F8[gUnknown_08216300[gBerryBlenderData->playersNo - 2]];
            REG_BG2CNT = 0x4882;
            gBerryBlenderData->framesToWait = 0;
            sub_804F238();
            sub_804F2A8();
        }
        sub_8051414(&gBerryBlenderData->field_168);
        break;
    case 15:
        if (sub_8051B8C())
        {
            gBerryBlenderData->framesToWait = 0;
            gBerryBlenderData->field_0++;
        }
        sub_8051414(&gBerryBlenderData->field_168);
        break;
    case 16:
        CreateSprite(&sSpriteTemplate_8216548, 120, -16, 3);
        gBerryBlenderData->field_0++;
        break;
    case 18:
        gBerryBlenderData->field_0++;
        break;
    case 19:
        sub_80084A4();
        gBerryBlenderData->field_0++;
        break;
    case 20:
        if (IsLinkTaskFinished())
        {
            sub_8007E24();
            gBerryBlenderData->field_0++;
        }
        break;
    case 21:
        gBerryBlenderData->field_56 = 128;
        gBerryBlenderData->gameFrameTime = 0;
        SetMainCallback2(sub_80501FC);
        if (GetCurrentMapMusic() != 403)
        {
            gBerryBlenderData->field_178 = GetCurrentMapMusic();
        }
        PlayBGM(MUS_CYCLING);
        break;
    case 100:
        Menu_DrawStdWindowFrame(0, 13, 29, 19);
        MenuPrintMessage(gOtherText_LinkNotFound, 1, 15);
        gBerryBlenderData->field_0++;
        break;
    case 101:
        if (Menu_UpdateWindowText())
            gBerryBlenderData->field_0++;
        break;
    case 102:
        if (!gPaletteFade.active)
            SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
        break;
    }
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_804F0F4(void)
{
    REG_DISPCNT = 0;

    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetTasks();

    SetVBlankCallback(VBlankCB0_BerryBlender);

    Text_LoadWindowTemplate(&gWindowTemplate_81E6F68);
    InitMenuWindow(&gWindowTemplate_81E6F68);

    gLinkType = 0x4422;

    gBerryBlenderData->field_4E = 0;
    gBerryBlenderData->field_56 = 0;
    gBerryBlenderData->arrowPos = 0;
    gBerryBlenderData->max_RPM = 0;
    gBerryBlenderData->field_144 = 0;
    gBerryBlenderData->field_146 = 0;
    gBerryBlenderData->field_0++;
}

static u8 sub_804F16C(u16 arrowPos, u8 a1)
{
    u32 var1 = (arrowPos / 256) + 24;
    u8 arrID = gBerryBlenderData->field_A2[a1];
    u32 var2 = gUnknown_08216303[arrID];

    if (var1 >= var2 && var1 < var2 + 48)
    {
        if (var1 >= var2 + 20 && var1 < var2 + 28)
            return 2;
        else
            return 1;
    }
    else
        return 0;
}

static void sub_804F1BC(u16 itemID, u8 a1, struct BlenderBerry* berry)
{
    u16 r4 = 0;
    u16 i;
    if (itemID == ITEM_ENIGMA_BERRY)
    {
        for (i = 0; i < 5; i++)
        {
            if (berry->flavours[r4] > berry->flavours[i])
                r4 = i;
        }
        r4 += 5;
    }
    else
    {
        r4 = itemID - 133;
        if (r4 >= 5)
            r4 = (r4 % 5) + 5;
    }
    for (i = 0; i < a1 - 1; i++)
    {
        Blender_SetBankBerryData(i + 1, gUnknown_082165BC[r4][i] + 133);
    }
}

static void sub_804F238(void)
{
    s32 i, j;
    for (i = 0; i < BLENDER_MAX_PLAYERS; i++)
    {
        gBerryBlenderData->field_A2[i] = 0xFF;
        gBerryBlenderData->field_9A[i] = gUnknown_082162EC[gBerryBlenderData->playersNo - 2][i];
    }
    for (j = 0; j < BLENDER_MAX_PLAYERS; j++)
    {
        for (i = 0; i < BLENDER_MAX_PLAYERS; i++)
        {
            if (gBerryBlenderData->field_9A[i] == j)
                gBerryBlenderData->field_A2[j] = i;
        }
    }
}

static void sub_804F2A8(void)
{
    int i;
    for (i = 0; i < BLENDER_MAX_PLAYERS; i++)
    {
        if (gBerryBlenderData->field_9A[i] != 0xFF)
        {
            u8* stringPtr = gStringVar1;

            gBerryBlenderData->SyncArrowSpriteID[gBerryBlenderData->field_9A[i]] = gBerryBlenderData->SyncArrowSprite2ID[i];
            StartSpriteAnim(&gSprites[gBerryBlenderData->SyncArrowSpriteID[gBerryBlenderData->field_9A[i]]], i);
            if (GetMultiplayerId() == gBerryBlenderData->field_9A[i])
                stringPtr = StringCopy(stringPtr, sRedColorString);
            StringCopy(stringPtr, gLinkPlayers[gBerryBlenderData->field_9A[i]].name);
            Menu_PrintTextPixelCoords(gStringVar1, gUnknown_082162D4[i][0] * 8 + 1, gUnknown_082162D4[i][1] * 8, 1);
        }
    }
}

static void sub_804F378(void)
{
    s32 i, j;
    switch (gBerryBlenderData->field_0)
    {
    case 0:
        sub_804F0F4();
        Blender_SetBankBerryData(0, gSpecialVar_ItemId);
        Blender_CopyBerryData(&gBerryBlenderData->blendedBerries[0], gSpecialVar_ItemId);
        sub_804F1BC(gSpecialVar_ItemId, gBerryBlenderData->playersNo, &gBerryBlenderData->blendedBerries[0]);
        for (i = 0; i < BLENDER_MAX_PLAYERS; i++)
        {
            gBerryBlenderData->field_70[i] = 0;
            for (j = 0; j < 3; j++)
            {
                gBerryBlenderData->scores[i][j] = 0;
            }
        }
        gBerryBlenderData->field_7C = 0;
        gBerryBlenderData->field_1 = 0;
        break;
    case 1:
        if (sub_804E2EC())
        {
            gBerryBlenderData->field_0++;
            sub_8051474();
        }
        break;
    case 2:
        for (i = 0; i < BLENDER_MAX_PLAYERS; i++)
        {
            gBerryBlenderData->SyncArrowSprite2ID[i] = CreateSprite(&sBlenderSyncArrow_SpriteTemplate, sBlenderSyncArrowsPos[i][0], sBlenderSyncArrowsPos[i][1], 1);
            StartSpriteAnim(&gSprites[gBerryBlenderData->SyncArrowSprite2ID[i]], i + 8);
        }
        gBerryBlenderData->field_0++;
        break;
    case 3:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
        gBerryBlenderData->field_0++;
        gBerryBlenderData->framesToWait = 0;
        break;
    case 4:
        if (++gBerryBlenderData->framesToWait == 2)
            sub_804E4FC();
        if (!gPaletteFade.active)
            gBerryBlenderData->field_0 = 8;
        break;
    case 8:
        gBerryBlenderData->field_0 = 11;
        gBerryBlenderData->field_13C = 0;
        break;
    case 11:
        for (i = 0; i < BLENDER_MAX_PLAYERS; i++)
        {
            u32 var = gUnknown_082162EC[gBerryBlenderData->playersNo - 2][i];
            if (gBerryBlenderData->field_13C == var)
            {
                sub_804E7C0(gBerryBlenderData->chosenItemID[gBerryBlenderData->field_13C], i);
                break;
            }
        }
        gBerryBlenderData->framesToWait = 0;
        gBerryBlenderData->field_0++;
        gBerryBlenderData->field_13C++;
        break;
    case 12:
        if (++gBerryBlenderData->framesToWait > 60)
        {
            if (gBerryBlenderData->field_13C >= gBerryBlenderData->playersNo)
            {
                gBerryBlenderData->arrowPos = gUnknown_082162F8[gUnknown_08216300[gBerryBlenderData->playersNo - 2]] - 22528;
                gBerryBlenderData->field_0++;
            }
            else
                gBerryBlenderData->field_0--;
            gBerryBlenderData->framesToWait = 0;
        }
        break;
    case 13:
        gBerryBlenderData->field_0++;
        sub_804F238();
        PlaySE(SE_RU_HYUU);
        sub_8051414(&gBerryBlenderData->field_168);
        break;
    case 14:
        REG_DISPCNT |= 0x400;
        gBerryBlenderData->arrowPos += 0x200;
        gBerryBlenderData->field_142 += 4;
        if (gBerryBlenderData->field_142 > 255)
        {
            gBerryBlenderData->field_0++;
            gBerryBlenderData->field_142 = 256;
            gBerryBlenderData->arrowPos = gUnknown_082162F8[gUnknown_08216300[gBerryBlenderData->playersNo - 2]];
            REG_BG2CNT = 0x4882;
            gBerryBlenderData->framesToWait = 0;
            PlaySE(SE_TRACK_DOOR);;
            sub_804F2A8();
        }
        sub_8051414(&gBerryBlenderData->field_168);
        break;
    case 15:
        if (sub_8051B8C())
        {
            gBerryBlenderData->field_0++;
        }
        sub_8051414(&gBerryBlenderData->field_168);
        break;
    case 16:
        CreateSprite(&sSpriteTemplate_8216548, 120, -16, 3);
        gBerryBlenderData->field_0++;
        break;
    case 18:
        gBerryBlenderData->field_0++;
        break;
    case 19:
        gBerryBlenderData->field_0++;
        break;
    case 20:
        gBerryBlenderData->field_0++;
        break;
    case 21:
        sub_804F81C();
        gBerryBlenderData->field_56 = 128;
        gBerryBlenderData->gameFrameTime = 0;
        gBerryBlenderData->field_14B = 0;
        gBerryBlenderData->field_7E = 0;
        SetMainCallback2(sub_80501FC);

        for (i = 0; i < gSpecialVar_0x8004; i++)
        {
            gBerryBlenderData->field_148[i] = CreateTask(gUnknown_08216308[i], 10 + i);
        }

        if (GetCurrentMapMusic() != 403)
        {
            gBerryBlenderData->field_178 = GetCurrentMapMusic();
        }
        PlayBGM(MUS_CYCLING);
        PlaySE(SE_MOTER);
        Blender_ControlHitPitch();
        break;
    }
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_804F81C(void)
{
    s32 i;
    for (i = 0; i < 4; i++)
    {
        gSendCmd[0] = 0;
        gSendCmd[2] = 0;
        gRecvCmds[0][i] = 0;
        gRecvCmds[2][i] = 0;
    }
}

static void sub_804F844(u8 taskID)
{
   if(++gTasks[taskID].data[0] > gTasks[taskID].data[1])
   {
        gRecvCmds[2][gTasks[taskID].data[2]] = 0x2345;
        DestroyTask(taskID);
   }
}

static void sub_804F890(u8 a0, u8 a1)
{
    u8 taskID = CreateTask(sub_804F844, 80);
    gTasks[taskID].data[1] = a1;
    gTasks[taskID].data[2] = a0;
}

static void sub_804F8C8(u8 taskID)
{
    if (sub_804F16C(gBerryBlenderData->arrowPos, 1) == 2)
    {
        if (gTasks[taskID].data[0] == 0)
        {
            if (gBerryBlenderData->field_14B == 0)
            {
                u8 rand = Random() / 655;
                if (gBerryBlenderData->field_56 < 500)
                {
                    if (rand > 75)
                        gRecvCmds[2][1] = 0x4523;
                    else
                        gRecvCmds[2][1] = 0x5432;
                    gRecvCmds[2][1] = 0x5432; // ???
                }
                else if (gBerryBlenderData->field_56 < 1500)
                {
                    if (rand > 80)
                        gRecvCmds[2][1] = 0x4523;
                    else
                    {
                        u8 value = rand - 21;
                        if (value < 60)
                            gRecvCmds[2][1] = 0x5432;
                        else if (rand < 10)
                            sub_804F890(1, 5);
                    }
                }
                else if (rand <= 90)
                {
                    u8 value = rand - 71;
                    if (value < 20)
                        gRecvCmds[2][1] = 0x5432;
                    else if (rand < 30)
                        sub_804F890(1, 5);
                }
                else
                   gRecvCmds[2][1] = 0x4523;
            }
            else
                gRecvCmds[2][1] = 0x4523;

            gTasks[taskID].data[0] = 1;
        }
    }
    else
        gTasks[taskID].data[0] = 0;
}

static void sub_804F9F4(u8 taskID)
{
    u32 var1 = (gBerryBlenderData->arrowPos + 0x1800) & 0xFFFF;
    u32 var2 = gBerryBlenderData->field_A2[2] & 0xFF;
    if ((var1 >> 8) > gUnknown_08216303[var2] + 20 && (var1 >> 8) < gUnknown_08216303[var2] + 40)
    {
        if (gTasks[taskID].data[0] == 0)
        {
            if (gBerryBlenderData->field_14B == 0)
            {
                u8 rand = Random() / 655;
                if (gBerryBlenderData->field_56 < 500)
                {
                    if (rand > 66)
                        gRecvCmds[2][2] = 0x4523;
                    else
                        gRecvCmds[2][2] = 0x5432;
                }
                else
                {
                    u8 value;
                    if (rand > 65)
                        gRecvCmds[2][2] = 0x4523;
                    value = rand - 41;
                    if (value < 25)
                        gRecvCmds[2][2] = 0x5432;
                    if (rand < 10)
                        sub_804F890(2, 5);
                }

                gTasks[taskID].data[0] = 1;
            }
            else
            {
                gRecvCmds[2][2] = 0x4523;
                gTasks[taskID].data[0] = 1;
            }
        }
    }
    else
        gTasks[taskID].data[0] = 0;
}

static void sub_804FB1C(u8 taskID)
{
    u32 var1, var2;

    var1 = (gBerryBlenderData->arrowPos + 0x1800) & 0xFFFF;
    var2 = gBerryBlenderData->field_A2[3] & 0xFF;
    if ((var1 >> 8) > gUnknown_08216303[var2] + 20 && (var1 >> 8) < gUnknown_08216303[var2] + 40)
    {
        if (gTasks[taskID].data[0] == 0)
        {
            if (gBerryBlenderData->field_14B == 0)
            {
                u8 rand = (Random() / 655);
                if (gBerryBlenderData->field_56 < 500)
                {
                    if (rand > 88)
                        gRecvCmds[2][3] = 0x4523;
                    else
                        gRecvCmds[2][3] = 0x5432;
                }
                else
                {
                    if (rand > 60)
                        gRecvCmds[2][3] = 0x4523;
                    else
                    {
                        s8 value = rand - 56; // makes me wonder what the original code was
                        u8 value2 = value;
                        if (value2 < 5)
                            gRecvCmds[2][3] = 0x5432;
                    }
                    if (rand < 5)
                        sub_804F890(3, 5);
                }
                gTasks[taskID].data[0] = 1;
            }
            else
            {
                gRecvCmds[2][3] = 0x4523;
                gTasks[taskID].data[0] = 1;
            }
        }
    }
    else
        gTasks[taskID].data[0] = 0;
}

static void sub_804FC48(u16 a0, u8 a1)
{
    u8 spriteID;

    spriteID = CreateSprite(&sSpriteTemplate_821645C,
                            sBlenderSyncArrowsPos[a1][0] - (10 * gUnknown_082162CC[a1][0]),
                            sBlenderSyncArrowsPos[a1][1] - (10 * gUnknown_082162CC[a1][1]),
                            1);
    if (a0 == 0x4523)
    {
        StartSpriteAnim(&gSprites[spriteID], 2);
        gSprites[spriteID].callback = sub_8051684;
        PlaySE(SE_RU_GASHIN);
    }
    else if (a0 == 0x5432)
    {
        StartSpriteAnim(&gSprites[spriteID], 0);
        PlaySE(SE_SEIKAI);
    }
    else if (a0 == 0x2345)
    {
        StartSpriteAnim(&gSprites[spriteID], 1);
        PlaySE(SE_HAZURE);
    }
    sub_805156C();
}

static void sub_804FD30(u16 a0)
{
    Blender_ControlHitPitch();
    switch (a0)
    {
    case 0x4523:
        if (gBerryBlenderData->field_56 < 1500)
            gBerryBlenderData->field_56 += (384 / gUnknown_082165DA[gBerryBlenderData->playersNo]);
        else
        {
            gBerryBlenderData->field_56 += (128 / gUnknown_082165DA[gBerryBlenderData->playersNo]);
            sub_8051AC8(&gBerryBlenderData->field_144, (gBerryBlenderData->field_56 / 100) - 10);
            sub_8051AC8(&gBerryBlenderData->field_146, (gBerryBlenderData->field_56 / 100) - 10);
        }
        break;
    case 0x5432:
        if (gBerryBlenderData->field_56 < 1500)
            gBerryBlenderData->field_56 += (256 / gUnknown_082165DA[gBerryBlenderData->playersNo]);
        break;
    case 0x2345:
        gBerryBlenderData->field_56 -= (256 / gUnknown_082165DA[gBerryBlenderData->playersNo]);
        if (gBerryBlenderData->field_56 < 128)
            gBerryBlenderData->field_56 = 128;
        break;
    }
}

static void sub_804FE70(void)
{
    s32 i;

    if (gSpecialVar_0x8004 != 0)
    {
        if (gSendCmd[2] != 0)
        {
            gRecvCmds[2][0] = gSendCmd[2];
            gRecvCmds[0][0] = 0x4444;
            gSendCmd[2] = 0;
        }
        for (i = 1; i < 4; i++)
        {
            if (gRecvCmds[2][i] != 0)
                gRecvCmds[0][i] = 0x4444;
        }
    }
    for (i = 0; i < gBerryBlenderData->playersNo; i++)
    {
        if (gRecvCmds[0][i] == 0x4444)
        {
            u32 var = gBerryBlenderData->field_A2[i];
            if (gRecvCmds[2][i] == 0x4523)
            {
                sub_804FD30(0x4523);
                gBerryBlenderData->field_13E += (gBerryBlenderData->field_56 / 55);
                if (gBerryBlenderData->field_13E >= 1000)
                    gBerryBlenderData->field_13E = 1000;
                sub_804FC48(0x4523, var);
                gBerryBlenderData->scores[i][BLENDER_SCORE_BEST]++;
            }
            else if (gRecvCmds[2][i] == 0x5432)
            {
                sub_804FD30(0x5432);
                gBerryBlenderData->field_13E += (gBerryBlenderData->field_56 / 70);
                sub_804FC48(0x5432, var);
                gBerryBlenderData->scores[i][BLENDER_SCORE_GOOD]++;
            }
            else if (gRecvCmds[2][i] == 0x2345)
            {
                sub_804FC48(0x2345, var);
                sub_804FD30(0x2345);
                // looks like a bug
                if (gBerryBlenderData->field_4.win_field_F > 1000)
                    gBerryBlenderData->field_13E = 1000;
                if (gBerryBlenderData->scores[i][BLENDER_SCORE_MISS] < 999)
                    gBerryBlenderData->scores[i][BLENDER_SCORE_MISS]++;
            }
            if (gRecvCmds[2][i] == 0x2345 || gRecvCmds[2][i] == 0x4523 || gRecvCmds[2][i] == 0x5432)
            {
                if (gBerryBlenderData->field_56 > 1500)
                    m4aMPlayTempoControl(&gMPlay_BGM, ((gBerryBlenderData->field_56 - 750) / 20) + 256);
                else
                    m4aMPlayTempoControl(&gMPlay_BGM, 256);
            }
        }
    }
    if (gSpecialVar_0x8004 != 0)
    {
        for (i = 0; i < gBerryBlenderData->playersNo; i++)
        {
            gRecvCmds[0][i] = 0;
            gRecvCmds[2][i] = 0;
        }
    }
}

static void sub_80500A8(void)
{
    bool8 A_pressed = 0;
    u8 var2 = gBerryBlenderData->field_A2[GetMultiplayerId()];
    if (gBerryBlenderData->field_6F == 0)
    {
        if (gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_L_EQUALS_A && gMain.newKeys & A_BUTTON)
            A_pressed = ((gMain.heldKeysRaw & (A_BUTTON | L_BUTTON)) != (A_BUTTON | L_BUTTON));
        else if (gMain.newKeys & A_BUTTON)
            A_pressed = 1;
        if (A_pressed)
        {
            u8 var3;
            StartSpriteAnim(&gSprites[gBerryBlenderData->SyncArrowSpriteID[gBerryBlenderData->field_9A[var2]]], var2 + 4);
            var3 = sub_804F16C(gBerryBlenderData->arrowPos, GetMultiplayerId());
            if (var3 == 2)
                gSendCmd[2] = 0x4523;
            else if (var3 == 1)
                gSendCmd[2] = 0x5432;
            else
                gSendCmd[2] = 0x2345;
        }
    }
    if (++gBerryBlenderData->field_7E > 5)
    {
        if (gBerryBlenderData->field_56 > 128)
            gBerryBlenderData->field_56--;
        gBerryBlenderData->field_7E = 0;
    }
    if (gUnknown_020297ED && gMain.newKeys & L_BUTTON)
        gBerryBlenderData->field_14B ^= 1;
}

static void sub_80501FC(void)
{
    sub_8051474();
    if (gBerryBlenderData->gameFrameTime < (99 * 60 * 60) + (59 * 60)) // game time can't be longer than 99 minutes and 59 seconds, can't print 3 digits
        gBerryBlenderData->gameFrameTime++;
    sub_80500A8();
    SetLinkDebugValues((u16)(gBerryBlenderData->field_56), gBerryBlenderData->field_13E);
    sub_804FE70();
    sub_805194C(gBerryBlenderData->field_13E, 1000);
    sub_8051A3C(gBerryBlenderData->field_56);
    sub_8051B18();
    sub_805123C();
    if (gBerryBlenderData->field_6F == 0 && gBerryBlenderData->field_140 >= 1000)
    {
        gBerryBlenderData->field_13E = 1000;
        gBerryBlenderData->field_6F = 1;
        SetMainCallback2(sub_8050954);
    }
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static bool8 sub_80502A4(struct BlenderBerry* berries, u8 index1, u8 index2)
{
    if (berries[index1].itemID != berries[index2].itemID
     || (StringCompare(berries[index1].name, berries[index2].name) == 0
      && (berries[index1].flavours[0] == berries[index2].flavours[0]
       && berries[index1].flavours[1] == berries[index2].flavours[1]
       && berries[index1].flavours[2] == berries[index2].flavours[2]
       && berries[index1].flavours[3] == berries[index2].flavours[3]
       && berries[index1].flavours[4] == berries[index2].flavours[4]
       && berries[index1].smoothness == berries[index2].smoothness)))
        return TRUE;
    else
        return FALSE;
}

u32 Blender_GetPokeblockColor(struct BlenderBerry* berries, s16* a1, u8 playersNo, u8 a3)
{
    s16 vars[5];
    s32 i;
    s32 r6;
    u8 r2;

    for (i = 0; i <= 5; i++) // bug, writing one index too far
        vars[i] = a1[i];
    r6 = 0;
    for (i = 0; i < 5; i++)
    {
        if (vars[i] == 0)
            r6++;
    }
    if (r6 == 5 || a3 > 3)
        return PBLOCK_CLR_BLACK;
    for (i = 0; i < playersNo; i++)
    {
        for (r6 = 0; r6 < playersNo; r6++)
        {
            if (berries[i].itemID == berries[r6].itemID && i != r6
                && (berries[i].itemID != ITEM_ENIGMA_BERRY || sub_80502A4(berries, i, r6)))
                    return PBLOCK_CLR_BLACK;
        }
    }
    r2 = 0;
    for (r2 = 0, i = 0; i < 5; i++)
    {
        if (vars[i] > 0)
            r2++;
    }
    if (r2 > 3)
        return PBLOCK_CLR_WHITE;
    if (r2 == 3)
        return PBLOCK_CLR_GRAY;
    for (i = 0; i < 5; i++)
    {
        if (vars[i] > 50)
            return PBLOCK_CLR_GOLD;
    }
    if (r2 == 1 && vars[0] > 0)
        return PBLOCK_CLR_RED;
    if (r2 == 1 && vars[1] > 0)
        return PBLOCK_CLR_BLUE;
    if (r2 == 1 && vars[2] > 0)
        return PBLOCK_CLR_PINK;
    if (r2 == 1 && vars[3] > 0)
        return PBLOCK_CLR_GREEN;
    if (r2 == 1 && vars[4] > 0)
        return PBLOCK_CLR_YELLOW;
    if (r2 == 2)
    {
        s32 var = 0;
        for (i = 0; i < 5; i++)
        {
            if (vars[i] > 0)
                gUnknown_03000520[var++] = i;
        }
        if (vars[gUnknown_03000520[0]] >= vars[gUnknown_03000520[1]])
        {
            if (gUnknown_03000520[0] == 0)
                return (gUnknown_03000520[1] << 16) | PBLOCK_CLR_PURPLE;
            if (gUnknown_03000520[0] == 1)
                return (gUnknown_03000520[1] << 16) | PBLOCK_CLR_INDIGO;
            if (gUnknown_03000520[0] == 2)
                return (gUnknown_03000520[1] << 16) | PBLOCK_CLR_BROWN;
            if (gUnknown_03000520[0] == 3)
                return (gUnknown_03000520[1] << 16) | PBLOCK_CLR_LITEBLUE;
            if (gUnknown_03000520[0] == 4)
                return (gUnknown_03000520[1] << 16) | PBLOCK_CLR_OLIVE;
        }
        else
        {
            if (gUnknown_03000520[1] == 0)
                return (gUnknown_03000520[0] << 16) | PBLOCK_CLR_PURPLE;
            if (gUnknown_03000520[1] == 1)
                return (gUnknown_03000520[0] << 16) | PBLOCK_CLR_INDIGO;
            if (gUnknown_03000520[1] == 2)
                return (gUnknown_03000520[0] << 16) | PBLOCK_CLR_BROWN;
            if (gUnknown_03000520[1] == 3)
                return (gUnknown_03000520[0] << 16) | PBLOCK_CLR_LITEBLUE;
            if (gUnknown_03000520[1] == 4)
                return (gUnknown_03000520[0] << 16) | PBLOCK_CLR_OLIVE;
        }
    }
    return 0;
}

static void sub_80504F0(s16 value)
{
    gUnknown_0300052C = value;
}

s16 unref_sub_80504FC(void)
{
    return gUnknown_0300052C;
}

static void sub_8050508(s16 value)
{
    gUnknown_0300052E = value;
}

s16 unref_sub_8050514(void)
{
    return gUnknown_0300052E;
}

static void Blender_CalculatePokeblock(struct BlenderBerry* berries, struct Pokeblock* pokeblock, u8 playersNo, u8* flavours, u16 maxRPM)
{
    s32 i;
    s32 j;
    s32 var3;
    s32 var4;
    s32 var6;
    u8 r10;

    for (i = 0; i < 6; i++)
        gUnknown_03000510[i] = 0;
    for (i = 0; i < playersNo; i++)
    {
        for (j = 0; j < 6; j++)
            gUnknown_03000510[j] += berries[i].flavours[j];
    }

    var6 = gUnknown_03000510[0];
    gUnknown_03000510[0] -= gUnknown_03000510[1];
    gUnknown_03000510[1] -= gUnknown_03000510[2];
    gUnknown_03000510[2] -= gUnknown_03000510[3];
    gUnknown_03000510[3] -= gUnknown_03000510[4];
    gUnknown_03000510[4] -= var6;

    var6 = 0;
    for (i = 0; i < 5; i++)
    {
        if (gUnknown_03000510[i] < 0)
        {
            gUnknown_03000510[i] = 0;
            var6++;
        }
    }
    r10 = var6;
    for (i = 0; i < 5; i++)
    {
        if (gUnknown_03000510[i] > 0)
        {
            if (gUnknown_03000510[i] < var6)
                gUnknown_03000510[i] = 0;
            else
                gUnknown_03000510[i] -= var6;
        }
    }
    for (i = 0; i < 5; i++)
    {
        gUnknown_03000530[i] = gUnknown_03000510[i];
    }

    var6 = maxRPM / 333 + 100;
    gUnknown_0300055C = var6;

    for (i = 0; i < 5; i++)
    {
        var3 = gUnknown_03000510[i];
        var3 = (var3 * var6) / 10;
        var4 = var3 % 10;
        var3 /= 10;
        if (var4 > 4)
            var3++;
        gUnknown_03000510[i] = var3;
    }
    for (i = 0; i < 5; i++)
    {
        gUnknown_03000548[i] = gUnknown_03000510[i];
    }
    pokeblock->color = Blender_GetPokeblockColor(berries, &gUnknown_03000510[0], playersNo, r10);
    gUnknown_03000510[5] = (gUnknown_03000510[5] / playersNo) - playersNo;
    if (gUnknown_03000510[5] < 0)
        gUnknown_03000510[5] = 0;
    if (pokeblock->color == 12)
    {
        var6 = Random() % 10;
        for (i = 0; i < 5; i++)
        {
            if ((gUnknown_082165DF[var6] >> i) & 1)
                gUnknown_03000510[i] = 2;
            else
                gUnknown_03000510[i] = 0;
        }
    }
    for (i = 0; i < 6; i++)
    {
        if (gUnknown_03000510[i] > 255)
            gUnknown_03000510[i] = 255;
    }
    pokeblock->spicy = gUnknown_03000510[0];
    pokeblock->dry = gUnknown_03000510[1];
    pokeblock->sweet = gUnknown_03000510[2];
    pokeblock->bitter = gUnknown_03000510[3];
    pokeblock->sour = gUnknown_03000510[4];
    pokeblock->feel = gUnknown_03000510[5];
    for (i = 0; i < 6; i++)
    {
        flavours[i] = gUnknown_03000510[i];
    }
}

static void BlenderDebug_CalculatePokeblock(struct BlenderBerry* berries, struct Pokeblock* pokeblock, u8 playersNo, u8* flavours, u16 a4)
{
    Blender_CalculatePokeblock(berries, pokeblock, playersNo, flavours, a4);
}

/*static*/ void sub_8050760(void)
{
    u32 frames = (u16)(gBerryBlenderData->gameFrameTime);
    u16 max_RPM = gBerryBlenderData->max_RPM;
    s16 var = 0;

    if (frames < 900)
        var = 5;
    else if ((u16)(frames - 900) < 600)
        var = 4;
    else if ((u16)(frames - 1500) < 600)
        var = 3;
    else if ((u16)(frames - 2100) < 900)
        var = 2;
    else if ((u16)(frames - 3300) < 300)
        var = 1;
    sub_8050508(var);

    var = 0;
    if (max_RPM <= 64)
    {
        if (max_RPM >= 50 && max_RPM < 100)
            var = -1;
        else if (max_RPM >= 100 && max_RPM < 150)
            var = -2;
        else if (max_RPM >= 150 && max_RPM < 200)
            var = -3;
        else if (max_RPM >= 200 && max_RPM < 250)
            var = -4;
        else if (max_RPM >= 250 && max_RPM < 300)
            var = -5;
        else if (max_RPM >= 350 && max_RPM < 400)
            var = -6;
        else if (max_RPM >= 400 && max_RPM < 450)
            var = -7;
        else if (max_RPM >= 500 && max_RPM < 550)
            var = -8;
        else if (max_RPM >= 550 && max_RPM < 600)
            var = -9;
        else if (max_RPM >= 600)
            var = -10;
    }
    sub_80504F0(var);
}

static void sub_80508D4(u8 value)
{
    gBerryBlenderData->field_AA = value;
    MenuCursor_SetPos814A880(192, (gBerryBlenderData->field_AA * 16) + 72);
}

static void sub_80508FC(void)
{
    gBerryBlenderData->field_AA = 0;
    Menu_DrawStdWindowFrame(23, 8, 28, 13);
    MenuCursor_Create814A5C0(0, -1, 12, 0x2D9F, 32);
    Menu_PrintText(gOtherText_YesNoTerminating, 24, 9);
    sub_80508D4(gBerryBlenderData->field_AA);
}

static void sub_8050954(void)
{
    u8 i;
    u8 multiplayerID; // unused

    sub_8051474();
    multiplayerID = GetMultiplayerId();
    switch (gBerryBlenderData->field_6F)
    {
    case 1:
        ClearLinkCallback();
        m4aMPlayTempoControl(&gMPlay_BGM, 256);
        for (i = 0; i < gSpecialVar_0x8004; i++)
        {
            DestroyTask(gBerryBlenderData->field_148[i]);
        }
        gBerryBlenderData->field_6F++;
        break;
    case 2:
        gBerryBlenderData->field_56 -= 32;
        if (gBerryBlenderData->field_56 <= 0)
        {
            gBerryBlenderData->field_56 = 0;
            if (gReceivedRemoteLinkPlayers != 0)
                gBerryBlenderData->field_6F++;
            else
                gBerryBlenderData->field_6F = 5;
            gBerryBlenderData->field_0 = 0;
            m4aMPlayStop(&gMPlay_SE2);
        }
        Blender_ControlHitPitch();
        break;
    case 3:
        if (/*multiplayerID != 0*/ GetMultiplayerId() != 0)
            gBerryBlenderData->field_6F++;
        else if (IsLinkTaskFinished())
        {
            gBerryBlenderData->field_1BC = gBerryBlenderData->gameFrameTime;
            gBerryBlenderData->field_1C0 = gBerryBlenderData->max_RPM;
            SendBlock(0, &gBerryBlenderData->field_1BC, 40);
            gBerryBlenderData->field_6F++;
        }
        break;
    case 4:
        if (GetBlockReceivedStatus())
        {
            u32* ptr = ((u32*)(&gBlockRecvBuffer[0][0]));
            gBerryBlenderData->max_RPM = gBlockRecvBuffer[0][2];
            gBerryBlenderData->gameFrameTime = *ptr;
            gBerryBlenderData->field_6F++;
            ResetBlockReceivedFlags();
        }
        break;
    case 5:
        if (Blender_PrintBlendingRanking())
            gBerryBlenderData->field_6F++;
        break;
    case 6:
        if (Blender_PrintBlendingResults())
        {
            if (gInGameOpponentsNo == 0)
                IncrementGameStat(GAME_STAT_POKEBLOCKS_WITH_FRIENDS);
            else
                IncrementGameStat(GAME_STAT_POKEBLOCKS);
            gBerryBlenderData->field_6F++;
        }
        break;
    case 7:
        gBerryBlenderData->field_6F++;
        Menu_DrawStdWindowFrame(0, 14, 29, 19);
        MenuPrintMessage(gOtherText_BlendAnotherBerryPrompt, 1, 15);
        break;
    case 8:
        if (Menu_UpdateWindowText())
            gBerryBlenderData->field_6F++;
        break;
    case 9:
        gBerryBlenderData->field_AA = 0;
        sub_80508FC();
        gBerryBlenderData->field_6F++;
        break;
    case 10:
        if (gMain.newKeys & DPAD_UP)
        {
            if (gBerryBlenderData->field_AA != 0)
                PlaySE(SE_SELECT);
            sub_80508D4(0);
        }
        else if (gMain.newKeys & DPAD_DOWN)
        {
            if (gBerryBlenderData->field_AA != 1)
                PlaySE(SE_SELECT);
            sub_80508D4(1);
        }
        else if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            gBerryBlenderData->field_6F++;
        }
        else if (gMain.newKeys & B_BUTTON)
        {
            PlaySE(SE_SELECT);
            gBerryBlenderData->field_6F++;
            sub_80508D4(1);
        }
        break;
    case 11:
        gSendCmd[0] = 0x2FFF;
        if (gBerryBlenderData->field_AA == 0)
        {
            if (IsBagPocketNonEmpty(BAG_BERRIES) == FALSE) // is empty
            {
                gBerryBlenderData->field_7C = 2;
                gSendCmd[1] = 0x9999;
            }
            else if (GetFirstFreePokeblockSlot() == -1)
            {
                gBerryBlenderData->field_7C = 3;
                gSendCmd[1] = 0xAAAA;
            }
            else
            {
                gBerryBlenderData->field_7C = 0;
                gSendCmd[1] = 0x7779;
            }
            gBerryBlenderData->field_6F++;
        }
        else
        {
            gBerryBlenderData->field_7C = 1;
            gSendCmd[1] = 0x8888;
            gBerryBlenderData->field_6F++;
        }
        break;
    case 12:
        if (gInGameOpponentsNo)
        {
            SetMainCallback2(sub_80510E8);
            gBerryBlenderData->field_6F = 0;
            gBerryBlenderData->field_0 = 0;
        }
        else
        {
            MenuPrintMessage(gOtherText_LinkStandby3, 1, 15);
            gBerryBlenderData->field_6F++;
        }
        break;
    case 13:
        if (Menu_UpdateWindowText())
        {
            SetMainCallback2(sub_8050E30);
            gBerryBlenderData->field_6F = 0;
            gBerryBlenderData->field_0 = 0;
        }
        break;
    }
    sub_8051B18();
    sub_8051A3C(gBerryBlenderData->field_56);
    sub_805123C();
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

bool8 sub_8050CE8(void)
{
    switch (gBerryBlenderData->field_1C4)
    {
    case 0:
        sub_80084A4();
        gBerryBlenderData->field_1C4 = 1;
        gBerryBlenderData->framesToWait = 0;
        break;
    case 1:
        if (IsLinkTaskFinished())
        {
            gBerryBlenderData->field_1C4++;
            gSoftResetDisabled = TRUE;
        }
        break;
    case 2:
        sub_8125E2C();
        gBerryBlenderData->field_1C4++;
        gBerryBlenderData->framesToWait = 0;
        break;
    case 3:
        if (++gBerryBlenderData->framesToWait == 10)
        {
            sub_80084A4();
            gBerryBlenderData->field_1C4++;
        }
        break;
    case 4:
        if (IsLinkTaskFinished())
        {
            if (sub_8125E6C())
                gBerryBlenderData->field_1C4 = 5;
            else
            {
                gBerryBlenderData->framesToWait = 0;
                gBerryBlenderData->field_1C4 = 3;
            }
        }
        break;
    case 5:
        gBerryBlenderData->field_1C4++;
        gBerryBlenderData->framesToWait = 0;
        break;
    case 6:
        if (++gBerryBlenderData->framesToWait > 5)
        {
            gSoftResetDisabled = FALSE;
            return TRUE;
        }
        break;
    }
    return FALSE;
}

static void sub_8050E30(void)
{
    switch (gBerryBlenderData->field_6F)
    {
    case 0:
        if (gBerryBlenderData->field_70[0] == 0x2222)
            gBerryBlenderData->field_6F = 5;
        else if (gBerryBlenderData->field_70[0] == 0x1111)
        {
            if (gBerryBlenderData->field_78 == 0x9999)
                gBerryBlenderData->field_6F = 2;
            else if (gBerryBlenderData->field_78 == 0xAAAA)
                gBerryBlenderData->field_6F = 1;
            else
                gBerryBlenderData->field_6F = 5;
        }
        break;
    case 1:
        gBerryBlenderData->field_6F = 3;
        DestroyMenuCursor();
        Menu_EraseWindowRect(23, 8, 28, 13);
#ifdef ENGLISH
        StringCopy(gStringVar4, gLinkPlayers[gBerryBlenderData->field_7A].name);
        StringAppend(gStringVar4, gOtherText_OtherCaseIsFull);
#else
        StringCopy(gStringVar4, gOtherText_OtherCaseIsFull);
        de_sub_8073110(gStringVar4, gLinkPlayers[gBerryBlenderData->field_7A].name);
#endif
        MenuPrintMessage(gStringVar4, 1, 15);
        break;
    case 2:
        gBerryBlenderData->field_6F++;
        DestroyMenuCursor();
        Menu_EraseWindowRect(23, 8, 28, 13);
#ifdef ENGLISH
        StringCopy(gStringVar4, gLinkPlayers[gBerryBlenderData->field_7A].name);
        StringAppend(gStringVar4, gOtherText_NoBerriesForBlend);
#else
        StringCopy(gStringVar4, gOtherText_NoBerriesForBlend);
        de_sub_8073110(gStringVar4, gLinkPlayers[gBerryBlenderData->field_7A].name);
#endif
        MenuPrintMessage(gStringVar4, 1, 15);
        break;
    case 3:
        if (Menu_UpdateWindowText())
        {
            gBerryBlenderData->framesToWait = 0;
            gBerryBlenderData->field_6F++;
        }
        break;
    case 4:
        if (++gBerryBlenderData->framesToWait > 60)
            gBerryBlenderData->field_6F = 5;
        break;
    case 5:
        Menu_DrawStdWindowFrame(0, 14, 29, 19);
        Menu_PrintText(gMultiText_Saving, 2, 15);
        sub_80084A4();
        gBerryBlenderData->field_6F++;
        break;
    case 6:
        if (IsLinkTaskFinished())
        {
            gBerryBlenderData->framesToWait = 0;
            gBerryBlenderData->field_6F++;
            gBerryBlenderData->field_1C4 = 0;
        }
        break;
    case 7:
        if (sub_8050CE8())
        {
            PlaySE(SE_SAVE);
            gBerryBlenderData->field_6F++;
        }
        break;
    case 8:
        gBerryBlenderData->field_6F++;
        sub_80084A4();
        break;
    case 9:
        if (IsLinkTaskFinished())
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
            gBerryBlenderData->field_6F++;
        }
        break;
    case 10:
        if (!gPaletteFade.active)
        {
            if (gBerryBlenderData->field_70[0] == 0x2222)
                SetMainCallback2(DoBerryBlending);
            else
            {
                gBerryBlenderData->framesToWait = 0;
                gBerryBlenderData->field_6F++;
            }
        }
        break;
    case 11:
        if (++gBerryBlenderData->framesToWait > 30)
        {
            sub_800832C();
            gBerryBlenderData->field_6F++;
        }
        break;
    case 12:
        if (gReceivedRemoteLinkPlayers == 0)
            SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
        break;
    }

    sub_805123C();
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_80510E8(void)
{
    switch (gBerryBlenderData->field_6F)
    {
    case 0:
        if (gBerryBlenderData->field_7C < 2)
            gBerryBlenderData->field_6F = 9;
        if (gBerryBlenderData->field_7C == 2)
            gBerryBlenderData->field_6F = 2;
        if (gBerryBlenderData->field_7C == 3)
            gBerryBlenderData->field_6F =1;
        break;
    case 1:
        gBerryBlenderData->field_6F = 3;
        DestroyMenuCursor();
        Menu_EraseWindowRect(23, 8, 28, 13);
        MenuPrintMessage(gOtherText_CaseIsFull, 1, 15);
        break;
    case 2:
        gBerryBlenderData->field_6F++;
        DestroyMenuCursor();
        Menu_EraseWindowRect(23, 8, 28, 13);
        MenuPrintMessage(gOtherText_OutOfBerries, 1, 15);
        break;
    case 3:
        if (Menu_UpdateWindowText())
            gBerryBlenderData->field_6F = 9;
        break;
    case 9:
        BeginFastPaletteFade(3);
        gBerryBlenderData->field_6F++;
        break;
    case 10:
        if (!gPaletteFade.active)
        {
            if (gBerryBlenderData->field_7C == 0)
                SetMainCallback2(DoBerryBlending);
            else
                SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
        }
        break;
    }

    sub_805123C();
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_805123C(void)
{
    if (gReceivedRemoteLinkPlayers)
    {
        if (gRecvCmds[0][0] == 0x2FFF)
        {
            if (gRecvCmds[1][0] == 0x1111)
            {
                switch (gRecvCmds[2][0])
                {
                case 0x8888:
                    gBerryBlenderData->field_78 = 0x8888;
                    gBerryBlenderData->field_7A = gRecvCmds[3][0];
                    break;
                case 0x9999:
                    gBerryBlenderData->field_78 = 0x9999;
                    gBerryBlenderData->field_7A = gRecvCmds[3][0];
                    break;
                case 0xAAAA:
                    gBerryBlenderData->field_78 = 0xAAAA;
                    gBerryBlenderData->field_7A = gRecvCmds[3][0];
                    break;
                }
                gBerryBlenderData->field_70[0] = 0x1111;
            }
            else if (gRecvCmds[1][0] == 0x2222)
                gBerryBlenderData->field_70[0] = 0x2222;
        }
        if (GetMultiplayerId() == 0 && gBerryBlenderData->field_70[0] != 0x1111 && gBerryBlenderData->field_70[0] != 0x2222)
        {
            u8 i;
            for (i = 0; i < GetLinkPlayerCount(); i++)
            {
                if (gRecvCmds[0][i] == 0x2FFF)
                {
                    switch (gRecvCmds[1][i])
                    {
                    case 0x8888:
                        gBerryBlenderData->field_70[i] = 0x8888;
                        break;
                    case 0x7779:
                        gBerryBlenderData->field_70[i] = 0x7779;
                        break;
                    case 0x9999:
                        gBerryBlenderData->field_70[i] = 0x9999;
                        break;
                    case 0xAAAA:
                        gBerryBlenderData->field_70[i] = 0xAAAA;
                        break;
                    }
                }
            }
            for (i = 0; i < GetLinkPlayerCount(); i++)
            {
                if (gBerryBlenderData->field_70[i] == 0)
                    break;
            }
            if (i == GetLinkPlayerCount())
            {
                for (i = 0; i < GetLinkPlayerCount(); i++)
                {
                    if (gBerryBlenderData->field_70[i] != 0x7779)
                        break;
                }
                gSendCmd[0] = 0x2FFF;
                if (i == GetLinkPlayerCount())
                    gSendCmd[1] = 0x2222;
                else
                {
                    gSendCmd[1] = 0x1111;
                    gSendCmd[2] = gBerryBlenderData->field_70[i];
                    gSendCmd[3] = i;
                }
            }
        }
    }
}

static void sub_8051414(struct BgAffineDstData *dest)
{
    struct BgAffineSrcData affineSrc;
    affineSrc.texX = 30720;
    affineSrc.texY = 20480;
    affineSrc.scrX = 120 - gBerryBlenderData->field_144;
    affineSrc.scrY = 80 - gBerryBlenderData->field_146;
    affineSrc.sx = gBerryBlenderData->field_142;
    affineSrc.sy = gBerryBlenderData->field_142;
    affineSrc.alpha = gBerryBlenderData->arrowPos;
    BgAffineSet(&affineSrc, dest, 1);
}

static void sub_8051474(void)
{
    gBerryBlenderData->field_58 = gBerryBlenderData->arrowPos;
    gBerryBlenderData->arrowPos += gBerryBlenderData->field_56;
    sub_8051414(&gBerryBlenderData->field_168);
}

static void sub_80514A4(void)
{
    REG_BG2PA = gBerryBlenderData->field_168.pa;
    REG_BG2PB = gBerryBlenderData->field_168.pb;
    REG_BG2PC = gBerryBlenderData->field_168.pc;
    REG_BG2PD = gBerryBlenderData->field_168.pd;
    REG_BG2X = gBerryBlenderData->field_168.dx;
    REG_BG2Y = gBerryBlenderData->field_168.dy;
}

static void sub_80514F0(void)
{
    REG_BG1HOFS = gBerryBlenderData->field_144;
    REG_BG1VOFS = gBerryBlenderData->field_146;
    REG_BG0HOFS = gBerryBlenderData->field_144;
    REG_BG0VOFS = gBerryBlenderData->field_146;
}

void sub_8051524(struct Sprite* sprite)
{
    sprite->data[2] += sprite->data[0];
    sprite->data[3] += sprite->data[1];
    sprite->pos2.x = sprite->data[2] / 8;
    sprite->pos2.y = sprite->data[3] / 8;
    if (sprite->animEnded)
        DestroySprite(sprite);
}

static void sub_805156C(void)
{
    s32 limit = (Random() % 2) + 1;
    s32 i;

    for (i = 0; i < limit; i++)
    {
        u16 rand;
        s32 x, y;
        u8 spriteID;

        rand = gBerryBlenderData->arrowPos + (Random() % 20);

        x = gSineTable[(rand & 0xFF) + 64] / 4;
        y = gSineTable[(rand & 0xFF)] / 4;

        spriteID = CreateSprite(&sSpriteTemplate_82164FC, x + 120, y + 80, 1);
        gSprites[spriteID].data[0] = 16 - (Random() % 32);
        gSprites[spriteID].data[1] = 16 - (Random() % 32);

        gSprites[spriteID].callback = sub_8051524;
    }
}

static void sub_8051650(struct Sprite* sprite)
{
    sprite->data[0]++;
    sprite->pos2.y = -(sprite->data[0] / 3);
    if (sprite->animEnded)
        DestroySprite(sprite);
}

void sub_8051684(struct Sprite* sprite)
{
    sprite->data[0]++;
    sprite->pos2.y = -(sprite->data[0] * 2);
    if (sprite->pos2.y < -12)
        sprite->pos2.y = -12;
    if (sprite->animEnded)
        DestroySprite(sprite);
}

void Blender_SetBankBerryData(u8 bank, u16 itemID)
{
    gBerryBlenderData->chosenItemID[bank] = itemID;
    Blender_CopyBerryData(&gBerryBlenderData->blendedBerries[bank], itemID);
}

void unref_sub_80516F8(u8 taskID)
{
    struct Task* task = &gTasks[taskID];
    if (gReceivedRemoteLinkPlayers)
    {
        s32 i;
        if (GetMultiplayerId() == 0)
        {
            if (++task->data[0] > 120)
                task->data[0] = 0;
            if (task->data[0] == 100)
            {
                Text_EraseWindowRect(&gBerryBlenderData->field_4, 0, 0, 16, 20);
                Menu_DrawStdWindowFrame(4, 4, 10, 12);
                for (i = 0; i < 3; i++)
                {
                    if (gLinkPlayers[i + 1].trainerId != 0)
                        Menu_PrintText(gUnknown_08216284[i], 5, (2 * i) + 5);
                    Menu_DrawStdWindowFrame(0, 13, 29, 19);
                    Menu_PrintText(gOtherText_PressAToStart, 1, 15);
                }
            }
            if (gMain.newKeys & A_BUTTON)
            {
                sub_8007E4C();
                DestroyTask(taskID);
            }
        }
        else
        {
            if (task->data[0] == 10)
                Menu_PrintText(gOtherText_PleaseWait, 3, 10);
            if (++task->data[0] > 120)
                task->data[0] = 0;
            if (byte_3002A68 > 4 && gReceivedRemoteLinkPlayers == 1)
                DestroyTask(taskID);
        }
    }
}

static void sub_805181C(struct Sprite* sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->data[1] += 8;
        if (sprite->data[1] > 88)
        {
            sprite->data[1] = 88;
            sprite->data[0]++;
            PlaySE(SE_KON);
        }
        break;
    case 1:
        sprite->data[2] += 1;
        if (sprite->data[2] > 20)
        {
            sprite->data[0]++;
            sprite->data[2] = 0;
        }
        break;
    case 2:
        sprite->data[1] += 4;
        if (sprite->data[1] > 176)
        {
            if (++sprite->data[3] == 3)
            {
                DestroySprite(sprite);
                CreateSprite(&sSpriteTemplate_821657C, 120, -20, 2);
            }
            else
            {
                sprite->data[0] = 0;
                sprite->data[1] = -16;
                StartSpriteAnim(sprite, sprite->data[3]);
            }
        }
        break;
    }
    sprite->pos2.y = sprite->data[1];
}

static void sub_80518CC(struct Sprite* sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->data[1] += 8;
        if (sprite->data[1] > 92)
        {
            sprite->data[1] = 92;
            sprite->data[0]++;
            PlaySE(SE_PIN);
        }
        break;
    case 1:
        sprite->data[2] += 1;
        if (sprite->data[2] > 20)
            sprite->data[0]++;
        break;
    case 2:
        sprite->data[1] += 4;
        if (sprite->data[1] > 176)
        {
            gBerryBlenderData->field_0++;
            DestroySprite(sprite);
        }
        break;
    }
    sprite->pos2.y = sprite->data[1];
}

static void sub_805194C(u16 a0, u16 a1)
{
    if (gBerryBlenderData->field_140 < a0)
    {
        gBerryBlenderData->field_140 += 2;
        sub_805197C(gBerryBlenderData->field_140, a1);
    }
}

static void sub_805197C(u16 a0, u16 a1)
{
    s32 var1, var2, var3, var4;
    u16* vram;

    vram = (u16*)(VRAM + 0x6000);
    var1 = (a0 * 64) / a1;
    var2 = var1 / 8;
    for (var4 = 0; var4 < var2; var4++)
    {
        vram[11 + var4] = 0x81E9;
        vram[43 + var4] = 0x81F9;
    }
    var3 = var1 % 8;
    if (var3 != 0)
    {
        vram[11 + var4] = var3 - 32287;
        vram[43 + var4] = var3 - 32271;
        var4++;
    }
    for (; var4 < 8; var4++)
    {
        vram[11 + var4] = 33249;
        vram[43 + var4] = 33249 + 16;
    }
}

static u32 sub_8051A1C(u16 a0)
{
    return 360000 * a0 / 0x10000;
}

static void sub_8051A3C(u16 a0)
{
    u8 i;
    u8 palAdders[5];

    u32 var = sub_8051A1C(a0);
    if (gBerryBlenderData->max_RPM < var)
        gBerryBlenderData->max_RPM = var;
    for (i = 0; i < 5; i++)
    {
        palAdders[i] = var % 10;
        var /= 10;
    }
    *((u16*)(VRAM + 0x6458)) = palAdders[4] + 0x8172;
    *((u16*)(VRAM + 0x645A)) = palAdders[3] + 0x8172;
    *((u16*)(VRAM + 0x645C)) = palAdders[2] + 0x8172;
    *((u16*)(VRAM + 0x6460)) = palAdders[1] + 0x8172;
    *((u16*)(VRAM + 0x6462)) = palAdders[0] + 0x8172;
}

static void sub_8051AC8(s16* a0, u16 a1)
{
    if (*a0 == 0)
        *a0 = (Random() % a1) - (a1 / 2);
}

static void sub_8051AF4(s16* a0)
{
    if (*a0 < 0 )
        (*a0)++;
    if (*a0 > 0 )
        (*a0)--;
}

static void sub_8051B18(void)
{
    sub_8051AF4(&gBerryBlenderData->field_144);
    sub_8051AF4(&gBerryBlenderData->field_146);
}

static void sub_8051B40(s16* a0, u16 a1)
{
    s32 var;
    if (a1 < 10)
        var = 16;
    else
        var = 8;
    if (*a0 == 0)
        *a0 = (Random() % var) - (var / 2);
    else
    {
        if (*a0 < 0)
            (*a0)++;
        if (*a0 > 0)
            (*a0)--;
    }
}

static bool8 sub_8051B8C(void)
{
    if (gBerryBlenderData->framesToWait == 0)
    {
        gBerryBlenderData->field_144 = 0;
        gBerryBlenderData->field_146 = 0;
    }
    gBerryBlenderData->framesToWait++;
    sub_8051B40(&gBerryBlenderData->field_144, gBerryBlenderData->framesToWait);
    sub_8051B40(&gBerryBlenderData->field_146, gBerryBlenderData->framesToWait);
    if (gBerryBlenderData->framesToWait == 20)
    {
        gBerryBlenderData->field_144 = 0;
        gBerryBlenderData->field_146 = 0;
        return TRUE;
    }
    else
        return FALSE;
}

static void sub_8051C04(struct Sprite* sprite)
{
   sprite->pos2.x = -(gBerryBlenderData->field_144);
   sprite->pos2.y = -(gBerryBlenderData->field_146);
}

/*static*/ void Blender_TrySettingRecord(void)
{
    if (gSaveBlock1.berryBlenderRecords[gBerryBlenderData->playersNo - 2] < gBerryBlenderData->max_RPM)
        gSaveBlock1.berryBlenderRecords[gBerryBlenderData->playersNo - 2] = gBerryBlenderData->max_RPM;
}

bool8 Blender_PrintBlendingResults(void)
{
    u16 i;

    struct Pokeblock pokeblock;
    u8 flavours[6];
    u8 text[2][10];
    u16 berryIDs[4]; // unused

    switch (gBerryBlenderData->field_0)
    {
    case 0:
        gBerryBlenderData->field_0++;
        gBerryBlenderData->framesToWait = 17;
        break;
    case 1:
        gBerryBlenderData->framesToWait -= 10;
        if (gBerryBlenderData->framesToWait < 0)
        {
            gBerryBlenderData->framesToWait = 0;
            gBerryBlenderData->field_0++;
        }
        break;
    case 2:
        if (++gBerryBlenderData->framesToWait > 20)
        {
            for (i = 0; i < 3; i++)
                DestroySprite(&gSprites[gBerryBlenderData->scoreIconIDs[i]]);
            gBerryBlenderData->framesToWait = 0;
            gBerryBlenderData->field_0++;
        }
        break;
    case 3:
        {
            u8* textPtr;
            u16 secondsPassed, minutes, seconds;

            Menu_DrawStdWindowFrame(4, 2, 25, 17);
            MenuPrint_Centered(gOtherText_ResultsOfBlending, 5, 3, 160);
            for (i = 0; i < gBerryBlenderData->playersNo; i++)
            {
                u8 place = gBerryBlenderData->playerPlaces[i];
                textPtr = text[0];

                StringCopy(textPtr, gBerryBlenderData->blendedBerries[place].name);
                ConvertInternationalString(textPtr, gLinkPlayers[place].language);
#ifdef ENGLISH
                StringAppend(textPtr, gOtherText_Berry);
#else
                de_sub_8073174(textPtr, gOtherText_Berry);
#endif
                textPtr = gBerryBlenderData->stringVar;
                textPtr = ConvertIntToDecimalString(textPtr, i + 1);
                textPtr[0] = CHAR_SPACE;
                textPtr[1] = CHAR_PERIOD;
                textPtr[2] = CHAR_SPACE;
                textPtr += 3;
                textPtr = AlignStringInMenuWindow(textPtr, gLinkPlayers[place].name, 88, 0);
                AlignStringInMenuWindow(textPtr, text[0], 157, 0);
                Menu_PrintText(gBerryBlenderData->stringVar, 5, gUnknown_082165E9[gBerryBlenderData->playersNo] + (i * gUnknown_082165EE[gBerryBlenderData->playersNo]));
            }
            ConvertIntToDecimalStringN(text[0], gBerryBlenderData->max_RPM % 100, 2, 2);
            textPtr = gBerryBlenderData->stringVar;
            textPtr = StringCopy(textPtr, gOtherText_MaxSpeed);
            textPtr = AlignInt1InMenuWindow(textPtr, gBerryBlenderData->max_RPM / 100, 121, 1);

#ifdef ENGLISH
            textPtr[0] = CHAR_SPACE;
            textPtr[1] = CHAR_PERIOD;
            textPtr[2] = CHAR_SPACE;
            textPtr += 3;
            textPtr = AlignStringInMenuWindow(textPtr, text[0], 142, 1);
#else
            *textPtr++ = CHAR_COMMA;
            textPtr = AlignStringInMenuWindow(textPtr, text[0], 136, 1);
#endif
            StringCopy(textPtr, gOtherText_RPM);
            Menu_PrintText(gBerryBlenderData->stringVar, 5, 13);

            secondsPassed = gBerryBlenderData->gameFrameTime / 60;
            seconds = secondsPassed % 60;
            minutes = secondsPassed / 60;
            ConvertIntToDecimalStringN(text[0], minutes, 2, 2);
            ConvertIntToDecimalStringN(text[1], seconds, 2, 2);
            textPtr = gBerryBlenderData->stringVar;
            textPtr = StringCopy(textPtr, gOtherText_RequiredTime);

#ifdef ENGLISH
            textPtr = AlignStringInMenuWindow(textPtr, text[0], 102, 1);
#else
            textPtr = AlignStringInMenuWindow(textPtr, text[0], 99, 1);
#endif
            textPtr = StringAppend(textPtr, gOtherText_Min);

            textPtr = AlignStringInMenuWindow(textPtr, text[1], 136, 1);
            StringCopy(textPtr, gOtherText_Sec);

            Menu_PrintText(gBerryBlenderData->stringVar, 5, 15);

            gBerryBlenderData->framesToWait = 0;
            gBerryBlenderData->field_0++;
        }
        break;
    case 4:
        if (gMain.newKeys & A_BUTTON)
            gBerryBlenderData->field_0++;
        break;
    case 5:
        Menu_EraseScreen();
        Menu_DrawStdWindowFrame(0, 14, 29, 19);
        for (i = 0; i < BLENDER_MAX_PLAYERS; i++)
        {
            if (gBerryBlenderData->chosenItemID[i] != 0)
                berryIDs[i] = gBerryBlenderData->chosenItemID[i] - 133;
        }
        sub_8050760();
        Blender_CalculatePokeblock(gBerryBlenderData->blendedBerries, &pokeblock, gBerryBlenderData->playersNo, flavours, gBerryBlenderData->max_RPM);
        Blender_PrintMadePokeblockString(&pokeblock, gBerryBlenderData->stringVar);
        CreateTask(sub_8052BD0, 6);
#if DEBUG
        ConvertIntToHexStringN(text[0], sub_8007E40(), 0, 4);
        StringAppend(text[0], gUnknown_08216249);
        StringAppend(gBerryBlenderData->stringVar, text[0]);
#endif
        MenuPrintMessage(gBerryBlenderData->stringVar, 1, 15);
        RemoveBagItem(gSpecialVar_ItemId, 1);
        GivePokeblock(&pokeblock);
        gBerryBlenderData->field_0++;
        break;
    case 6:
        if (Menu_UpdateWindowText())
        {
            Blender_TrySettingRecord();
            return TRUE;
        }
        break;
    }
    return FALSE;
}

static void Blender_PrintMadePokeblockString(struct Pokeblock* pokeblock, u8* dst)
{
    u8 text[12];
    u8 flavourLvl, feel;

    dst[0] = EOS;
    StringCopy(dst, gPokeblockNames[pokeblock->color]);
#ifdef ENGLISH
    StringAppend(dst, gOtherText_PokeBlockMade);
#else
    de_sub_8073174(dst, gOtherText_PokeBlockMade);
#endif
    StringAppend(dst, sNewLineString_0);

    flavourLvl = sub_810C9B0(pokeblock);
    feel = sub_810C9E8(pokeblock);

    StringAppend(dst, gOtherText_BlockLevelIs);
    ConvertIntToDecimalStringN(text, flavourLvl, 0, 3);
    StringAppend(dst, text);

    StringAppend(dst, gOtherText_BlockFeelIs);
    ConvertIntToDecimalStringN(text, feel, 0, 3);
    StringAppend(dst, text);

    StringAppend(dst, gOtherText_Period);
    StringAppend(dst, gUnknown_08216249);
}

static void Blender_SortBasedOnPoints(u8* places, u8 playersNum, u32* scores)
{
    s32 i, j;
    for (i = 0; i < playersNum; i++)
    {
        for (j = 0; j < playersNum; j++)
        {
            if (scores[places[i]] > scores[places[j]])
            {
                u8 temp = places[i];
                places[i] = places[j];
                places[j] = temp;
            }
        }
    }
}

static void Blender_SortScores(void)
{
    u8 i;
    u8 places[4];
    u32 points[4];

    for (i = 0; i < gBerryBlenderData->playersNo; i++)
        places[i] = i;
    for (i = 0; i < gBerryBlenderData->playersNo; i++)
    {
        points[i] = 1000000 * gBerryBlenderData->scores[i][BLENDER_SCORE_BEST];
        points[i] += 1000 * gBerryBlenderData->scores[i][BLENDER_SCORE_GOOD];
        points[i] += 1000 - gBerryBlenderData->scores[i][BLENDER_SCORE_MISS];
    }
    Blender_SortBasedOnPoints(places, gBerryBlenderData->playersNo, points);
    for (i = 0; i < gBerryBlenderData->playersNo; i++)
        gBerryBlenderData->playerPlaces[i] = places[i];
}

static bool8 Blender_PrintBlendingRanking(void)
{
    u16 i;
    switch (gBerryBlenderData->field_0)
    {
    case 0:
        gBerryBlenderData->field_0++;
        gBerryBlenderData->framesToWait = 255;
        break;
    case 1:
        gBerryBlenderData->framesToWait -= 10;
        if (gBerryBlenderData->framesToWait < 0)
        {
            gBerryBlenderData->framesToWait = 0;
            gBerryBlenderData->field_0++;
        }
        break;
    case 2:
        if (++gBerryBlenderData->framesToWait > 20)
        {
            gBerryBlenderData->framesToWait = 0;
            gBerryBlenderData->field_0++;
        }
        break;
    case 3:
        Menu_DrawStdWindowFrame(4, 2, 25, 17);
        MenuPrint_Centered(gOtherText_Ranking, 5, 3, 160);

        gBerryBlenderData->scoreIconIDs[BLENDER_SCORE_BEST] = CreateSprite(&sSpriteTemplate_821645C, 140, 52, 0);
        gSprites[gBerryBlenderData->scoreIconIDs[BLENDER_SCORE_BEST]].callback = SpriteCallbackDummy;
        StartSpriteAnim(&gSprites[gBerryBlenderData->scoreIconIDs[BLENDER_SCORE_BEST]], 3);

        gBerryBlenderData->scoreIconIDs[BLENDER_SCORE_GOOD] = CreateSprite(&sSpriteTemplate_821645C, 164, 52, 0);
        gSprites[gBerryBlenderData->scoreIconIDs[BLENDER_SCORE_GOOD]].callback = SpriteCallbackDummy;

        gBerryBlenderData->scoreIconIDs[BLENDER_SCORE_MISS] = CreateSprite(&sSpriteTemplate_821645C, 188, 52, 0);
        gSprites[gBerryBlenderData->scoreIconIDs[BLENDER_SCORE_MISS]].callback = SpriteCallbackDummy;
        StartSpriteAnim(&gSprites[gBerryBlenderData->scoreIconIDs[BLENDER_SCORE_MISS]], 1);

        Blender_SortScores();

        for (i = 0; i < gBerryBlenderData->playersNo; i++)
        {
            u8 place = gBerryBlenderData->playerPlaces[i];
            u8* txtPtr = gBerryBlenderData->stringVar;

            txtPtr[0] = EXT_CTRL_CODE_BEGIN;
            txtPtr[1] = 0x13;
            txtPtr[2] = 4;
            txtPtr += 3;

            txtPtr = ConvertIntToDecimalString(txtPtr, i + 1);

            txtPtr[0] = CHAR_SPACE;
            txtPtr[1] = CHAR_PERIOD;
            txtPtr[2] = CHAR_SPACE;
            txtPtr += 3;

            txtPtr = StringCopy(txtPtr, gLinkPlayers[place].name);

            txtPtr = AlignInt1InMenuWindow(txtPtr, gBerryBlenderData->scores[place][BLENDER_SCORE_BEST], 108, 1);
            txtPtr = AlignInt1InMenuWindow(txtPtr, gBerryBlenderData->scores[place][BLENDER_SCORE_GOOD], 132, 1);
            txtPtr = AlignInt1InMenuWindow(txtPtr, gBerryBlenderData->scores[place][BLENDER_SCORE_MISS], 156, 1);

            Menu_PrintText(gBerryBlenderData->stringVar, 5, i * gUnknown_082165F3[gBerryBlenderData->playersNo] + 8);
        }
        gBerryBlenderData->framesToWait = 0;
        gBerryBlenderData->field_0++;
        break;
    case 4:
        if (++gBerryBlenderData->framesToWait > 20)
            gBerryBlenderData->field_0++;
        break;
    case 5:
        if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            gBerryBlenderData->field_0++;
        }
        break;
    case 6:
        gBerryBlenderData->field_0 = 0;
        return TRUE;
    }
    return FALSE;
}

// debug menu goes here

void debug_sub_80524BC(void)
{
    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetTasks();
    SetVBlankCallback(VBlankCB1_BerryBlender);
    Text_LoadWindowTemplate(&gMenuTextWindowTemplate);
    InitMenuWindow(&gMenuTextWindowTemplate);
    SeedRng(gMain.vblankCounter1);
    REG_DISPCNT = 0x1540;
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    sBlenderDebug.BPM = 8000;
    sBlenderDebug.field_10++;
    SetMainCallback2(sub_8052AF8);
}

static void BlenderDebug_PrintBerryData(void)
{
    u8 text[128];
    u8 i;

    StringCopy(text, sText_BPM);
    Menu_PrintText(text, 2, 0);

    ConvertIntToDecimalStringN(text, sBlenderDebug.BPM / 100, 2, 3);
    Menu_PrintText(text, 6, 0);

    for (i = 0; i < 4; i++)
    {
        u8 var;

        if (sBlenderDebug.cursorPos == i)
        {
            text[0] = 0xEF;
            CopyItemName(sBlenderDebug.berries[i] + 133, &text[1]);
        }
        else
        {
            CopyItemName(sBlenderDebug.berries[i] + 133, &text[0]);
            text[6] = CHAR_SPACE;
            text[7] = EOS;
        }
        var = (i * 3) + 3;
        Menu_PrintText(text, 2, var);

        ConvertIntToDecimalStringN(&text[0], gBerries[sBlenderDebug.berries[i]].spicy, 2, 2);
        StringAppend(text, sText_Space);

        ConvertIntToDecimalStringN(&text[3], gBerries[sBlenderDebug.berries[i]].dry, 2, 2);
        StringAppend(text, sText_Space);

        ConvertIntToDecimalStringN(&text[6], gBerries[sBlenderDebug.berries[i]].sweet, 2, 2);
        StringAppend(text, sText_Space);

        ConvertIntToDecimalStringN(&text[9], gBerries[sBlenderDebug.berries[i]].bitter, 2, 2);
        StringAppend(text, sText_Space);

        ConvertIntToDecimalStringN(&text[12], gBerries[sBlenderDebug.berries[i]].sour, 2, 2);
        StringAppend(text, sText_Space);

        ConvertIntToDecimalStringN(&text[15], gBerries[sBlenderDebug.berries[i]].smoothness, 2, 2);

        text[17] = EOS;
        Menu_PrintText(text, 7, var);
    }
    if (sBlenderDebug.pokeblock.color != 0)
    {
        StringCopy(text, gPokeblockNames[sBlenderDebug.pokeblock.color]);
        Menu_PrintText(text, 2, 15);

        ConvertIntToHexStringN(&text[0], sBlenderDebug.spicy, 2, 2);
        StringAppend(text, sText_Space);

        ConvertIntToHexStringN(&text[3], sBlenderDebug.dry, 2, 2);
        StringAppend(text, sText_Space);

        ConvertIntToHexStringN(&text[6], sBlenderDebug.sweet, 2, 2);
        StringAppend(text, sText_Space);

        ConvertIntToHexStringN(&text[9], sBlenderDebug.bitter, 2, 2);
        StringAppend(text, sText_Space);

        ConvertIntToHexStringN(&text[12], sBlenderDebug.sour, 2, 2);
        StringAppend(text, sText_Space);

        ConvertIntToHexStringN(&text[15], sBlenderDebug.feel, 2, 2);

        text[17] = EOS;
        Menu_PrintText(text, 7, 17);
    }
}

static void sub_80527BC(void)
{
    u8 text[70];
    u8 buffer[10];
    u16 i;

    if (gUnknown_020297DC == 1)
    {
        u16 j;
        for (j = 0; j < 10; j++)
            gUnknown_03004840[j] = 0;
        gUnknown_03004830 = Random();
        gUnknown_020297E0 = 0;
        gUnknown_020297DC = 2;
        for (i = 0; i < 200; i++)
            gSharedMem[i] = 0;
        gUnknown_020297E8 = 0;
    }
    for (i = 0; i < 100; i++)
    {
        if (((Random() >> 15) & 1) == gUnknown_020297E8)
            gUnknown_020297E0++;
        else
        {
            u16* ewramPtr = ((u16*)(gSharedMem));
            ewramPtr[gUnknown_020297E4] = gUnknown_020297E0;
            gUnknown_020297E4++;
            gUnknown_020297E0 = 0;
            gUnknown_020297E8 ^= 1;
        }
    }
    text[0] = EOS;

    ConvertIntToHexStringN(buffer, gUnknown_03004830, 2, 8);
    StringAppend(text, buffer);
    StringAppend(text, sText_Space);

    ConvertIntToHexStringN(buffer, gUnknown_020297E0, 2, 8);
    StringAppend(text, buffer);
    StringAppend(text, sNewLineString_1);

    if (gUnknown_020297DC == 3)
    {
        ConvertIntToHexStringN(buffer, gUnknown_020297E4, 2, 16);
        StringAppend(text, buffer);
        gUnknown_020297DC = 0;
    }

    Menu_PrintText(text, 2, 15);
}

static void sub_8052918(void)
{
    if (gMain.newKeys & R_BUTTON)
    {
        sBlenderDebug.BPM += 1000;
        if (sBlenderDebug.BPM > 30000)
            sBlenderDebug.BPM = 1000;
        sBlenderDebug.field_10++;
    }
    if (gMain.newKeys & L_BUTTON)
    {
        sBlenderDebug.BPM -= 1000;
        if (sBlenderDebug.BPM < 0)
            sBlenderDebug.BPM = 30000;
        sBlenderDebug.field_10++;
    }
    if (gMain.newKeys & DPAD_UP)
    {
        sBlenderDebug.cursorPos -= 1;
        if (sBlenderDebug.cursorPos < 0)
            sBlenderDebug.cursorPos = 3;
        sBlenderDebug.field_10++;
    }
    if (gMain.newKeys & DPAD_DOWN)
    {
        sBlenderDebug.cursorPos += 1;
        if (sBlenderDebug.cursorPos > 3)
            sBlenderDebug.cursorPos = 0;
        sBlenderDebug.field_10++;
    }
    if (gMain.newKeys & DPAD_LEFT)
    {
        if (--sBlenderDebug.berries[sBlenderDebug.cursorPos] < 0)
            sBlenderDebug.berries[sBlenderDebug.cursorPos] = 42;
        sBlenderDebug.field_10++;
    }
    if (gMain.newKeys & DPAD_RIGHT)
    {
        if (++sBlenderDebug.berries[sBlenderDebug.cursorPos] > 42)
            sBlenderDebug.berries[sBlenderDebug.cursorPos] = 0;
        sBlenderDebug.field_10++;
    }
    if (gMain.newKeys & A_BUTTON)
    {
        u16 berryIDs[4];
        struct BlenderBerry berries[4];

        u16 i, notEnigma = 0;
        for (i = 0; i < 4; i++)
        {
            if (sBlenderDebug.berries[i] != 42)
            {
                notEnigma++;
                berryIDs[i] = sBlenderDebug.berries[i];
                Blender_CopyBerryData(&berries[i], sBlenderDebug.berries[i] + 133);
            }
            else
                break;
        }
        if (notEnigma > 1)
        {
            BlenderDebug_CalculatePokeblock(berries, &sBlenderDebug.pokeblock, notEnigma, &sBlenderDebug.spicy, sBlenderDebug.BPM);
            sBlenderDebug.field_10++;
        }
        else
            sBlenderDebug.pokeblock.color = 0xFF;
    }
    if (sBlenderDebug.field_10)
    {
        BlenderDebug_PrintBerryData();
        sBlenderDebug.field_10 = 0;
    }
    if (gMain.newKeys & SELECT_BUTTON && gUnknown_020297DC == 0)
    {
        gUnknown_020297DC++;
        gUnknown_020297E0 = 0;
        SeedRng(gMain.vblankCounter1);
    }
    if (gUnknown_020297DC != 0)
        sub_80527BC();
}

static void sub_8052AF8(void)
{
    sub_8052918();
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

// debug menu ends
// blender record window begins

void ShowBerryBlenderRecordWindow(void)
{
    u8 text[30];
    s32 i;

    Menu_DrawStdWindowFrame(6, 3, 23, 16);
    Menu_PrintText(gMultiText_BerryBlenderMaxSpeedRecord, 8, 4);
    Menu_PrintText(gMultiText_2P3P4P, 8, 9);

    for (i = 0; i < 3; i++)
    {
        u32 record = gSaveBlock1.berryBlenderRecords[i];
        u8* txtPtr = AlignInt1InMenuWindow(text, record / 100, 18, 1);

#ifdef ENGLISH
        txtPtr[0] = CHAR_SPACE;
        txtPtr[1] = CHAR_PERIOD;
        txtPtr[2] = CHAR_SPACE;
        txtPtr += 3;
#else
        *txtPtr++ = CHAR_COMMA;
#endif

        txtPtr = ConvertIntToDecimalStringN(txtPtr, record % 100, 2, 2);
        StringAppend(txtPtr, gOtherText_RPM);
        Menu_PrintText(text, 15, i * 2 + 9);
    }
}

static void sub_8052BD0(u8 taskID)
{
    if (gTasks[taskID].data[0] == 0)
    {
        PlayFanfare(MUS_FANFA1);
        gTasks[taskID].data[0]++;
    }
    if (IsFanfareTaskInactive())
    {
        PlayBGM(gBerryBlenderData->field_178);
        DestroyTask(taskID);
    }
}
