#include "global.h"
#include "sprite.h"
#include "palette.h"
#include "task.h"
#include "m4a.h"
#include "main.h"
#include "text.h"
#include "menu.h"
#include "songs.h"
#include "title_screen.h"
#include "sound.h"
#include "pokedex_cry_screen.h"

// local task defines
#define WINDOW_SELECTED data[0]
#define BGM_INDEX data[1]
#define SE_INDEX data[2]
#define UNK_DATA3 data[3]
#define UNK_DATA4 data[4]
// data 5-7 are not used
// i dont have a define for data 8 yet because its used in a nonmatching and I can't be sure yet its actually used.

// window selections
enum
{
    BGM_WINDOW,
    SE_WINDOW
};

// driver test cry enums
enum
{
    CRY_TEST_UNK0,
    CRY_TEST_VOLUME,
    CRY_TEST_PANPOT,
    CRY_TEST_PITCH,
    CRY_TEST_LENGTH,
    CRY_TEST_RELEASE,
    CRY_TEST_PROGRESS,
    CRY_TEST_CHORUS,
    CRY_TEST_PRIORITY
};

// minmax range enums
enum
{
    MIN,
    MAX
};

extern struct ToneData voicegroup_84537C0[];
extern struct ToneData voicegroup_8452590[];
extern struct ToneData voicegroup_8453DC0[];
extern struct ToneData voicegroup_8452B90[];
extern struct ToneData voicegroup_84543C0[];
extern struct ToneData voicegroup_8453190[];
extern struct ToneData voicegroup_84549C0[];
extern struct ToneData voicegroup_8453790[];

extern int gUnknown_020387B4[9];

extern s8 gUnknown_020387B3;
extern u8 gUnknown_020387B1;
extern u8 gUnknown_020387B2;
extern u8 gUnknown_020387D8;
extern u8 gUnknown_020387D9;
extern u8 gUnknown_020387B0;
extern u16 gUnknown_03005D34;
extern u8 gUnknown_03005E98;

extern struct MusicPlayerInfo *gUnknown_03005D30;
extern struct MusicPlayerInfo gMPlay_BGM;

static const u8 gDebugText_SoundCheckJap[] = _("サウンドチェック");
static const u8 gDebugText_BGM[] = _("BGM");
static const u8 gDebugText_SE[] = _("SE ");
static const u8 gDebugText_ABDesc[] = _("A‥さいせい　B‥おわり");
static const u8 gDebugText_UpDown[] = _("L‥UP R‥DOWN");
static const u8 gDebugText_DriverTest[] = _("R‥DRIVER-TEST");

// ideally this should be a multi Coords8 struct, but it wont match when its treated like a struct.
static const u8 gUnknown_083D0300[] = { 1, 1, 1, 3, 1, 5, 1, 7, 1, 9, 1, 11, 1, 13, 1, 15, 1, 17 };

static const u8 gDebugText_BBack[] = _("Bぼたんで　もどる");
static const u8 gDebugText_APlay[] = _("Aぼたんで　さいせい");
static const u8 gDebugText_Voice[] = _("VOICE‥‥‥‥");
static const u8 gDebugText_Volume[] = _("VOLUME‥‥‥");
static const u8 gDebugText_Panpot[] = _("PANPOT‥‥‥");
static const u8 gDebugText_Pitch[] = _("PITCH‥‥‥‥");
static const u8 gDebugText_Length[] = _("LENGTH‥‥‥");
static const u8 gDebugText_Release[] = _("RELEASE‥‥");
static const u8 gDebugText_Progress[] = _("PROGRESS‥");
static const u8 gDebugText_Chorus[] = _("CHORUS‥‥‥");
static const u8 gDebugText_Priority[] = _("PRIORITY‥");
static const u8 gDebugText_Playing[] = _("さいせいちゆう‥"); // 再生中 (playing)
static const u8 gDebugText_Reverse[] = _("はんてん‥‥‥‥"); // 反転 (reverse)
static const u8 gDebugText_Stereo[] = _("すてれお‥‥‥‥"); // stereo

// also ideally should be a MinMax struct, but any attempt to make this into a struct causes it to not match due to the weird multi dim access.
static const int gUnknown_083D039C[16] =
{
    0, 387,
    0, 127,
    -127, 127,
    -128, 32639,
    0, 65535,
    0, 255,
    0, 65535,
    -64, 63
};

static const u8 gUnknown_083D03DC[] = _("▶");
static const u8 gUnknown_083D03DE[] = _(" ");

// why not just use Powers of ten from string_util?
static const int gUnknown_083D03E0[6] =
{
          1,
         10,
        100,
       1000,
      10000,
     100000
};

static const s8 gUnknown_083D03F8[5] = { 0x3F, 0x00, 0xC0, 0x7F, 0x80 };

static const u8 gOtherText_SE[] = _("SE");
static const u8 gOtherText_Pan[] = _("PAN");
static const u8 gOtherText_LR[] = _("  LR");
static const u8 gOtherText_RL[] = _("  RL");

// bgm names
static const u8 BGMName_STOP[] = _("STOP");
static const u8 BGMName_TETSUJI[] = _("TETSUJI");
static const u8 BGMName_FIELD13[] = _("FIELD13");
static const u8 BGMName_KACHI22[] = _("KACHI22");
static const u8 BGMName_KACHI2[] = _("KACHI2");
static const u8 BGMName_KACHI3[] = _("KACHI3");
static const u8 BGMName_KACHI5[] = _("KACHI5");
static const u8 BGMName_PCC[] = _("PCC");
static const u8 BGMName_NIBI[] = _("NIBI");
static const u8 BGMName_SUIKUN[] = _("SUIKUN");
static const u8 BGMName_DOORO1[] = _("DOORO1");
static const u8 BGMName_DOORO_X1[] = _("DOORO-X1");
static const u8 BGMName_DOORO_X3[] = _("DOORO-X3");
static const u8 BGMName_MACHI_S2[] = _("MACHI-S2");
static const u8 BGMName_MACHI_S4[] = _("MACHI-S4");
static const u8 BGMName_GIM[] = _("GIM");
static const u8 BGMName_NAMINORI[] = _("NAMINORI");
static const u8 BGMName_DAN01[] = _("DAN01");
static const u8 BGMName_FANFA1[] = _("FANFA1");
static const u8 BGMName_ME_ASA[] = _("ME-ASA");
static const u8 BGMName_ME_BACHI[] = _("ME-BACHI");
static const u8 BGMName_FANFA4[] = _("FANFA4");
static const u8 BGMName_FANFA5[] = _("FANFA5");
static const u8 BGMName_ME_WAZA[] = _("ME-WAZA");
static const u8 BGMName_BIJYUTU[] = _("BIJYUTU");
static const u8 BGMName_DOORO_X4[] = _("DOORO-X4");
static const u8 BGMName_FUNE_KAN[] = _("FUNE-KAN");
static const u8 BGMName_ME_SHINKA[] = _("ME-SHINKA");
static const u8 BGMName_SHINKA[] = _("SHINKA");
static const u8 BGMName_ME_WASURE[] = _("ME-WASURE");
static const u8 BGMName_SYOUJOEYE[] = _("SYOUJOEYE");
static const u8 BGMName_BOYEYE[] = _("BOYEYE");
static const u8 BGMName_DAN02[] = _("DAN02");
static const u8 BGMName_MACHI_S3[] = _("MACHI-S3");
static const u8 BGMName_ODAMAKI[] = _("ODAMAKI");
static const u8 BGMName_B_TOWER[] = _("B-TOWER");
static const u8 BGMName_SWIMEYE[] = _("SWIMEYE");
static const u8 BGMName_DAN03[] = _("DAN03");
static const u8 BGMName_ME_KINOMI[] = _("ME-KINOMI");
static const u8 BGMName_ME_TAMA[] = _("ME-TAMA");
static const u8 BGMName_ME_B_BIG[] = _("ME-B-BIG");
static const u8 BGMName_ME_B_SMALL[] = _("ME-B-SMALL");
static const u8 BGMName_ME_ZANNEN[] = _("ME-ZANNEN");
static const u8 BGMName_BD_TIME[] = _("BD-TIME");
static const u8 BGMName_TEST1[] = _("TEST1");
static const u8 BGMName_TEST2[] = _("TEST2");
static const u8 BGMName_TEST3[] = _("TEST3");
static const u8 BGMName_TEST4[] = _("TEST4");
static const u8 BGMName_TEST[] = _("TEST");
static const u8 BGMName_GOMACHI0[] = _("GOMACHI0");
static const u8 BGMName_GOTOWN[] = _("GOTOWN");
static const u8 BGMName_POKECEN[] = _("POKECEN");
static const u8 BGMName_NEXTROAD[] = _("NEXTROAD");
static const u8 BGMName_GRANROAD[] = _("GRANROAD");
static const u8 BGMName_CYCLING[] = _("CYCLING");
static const u8 BGMName_FRIENDLY[] = _("FRIENDLY");
static const u8 BGMName_MISHIRO[] = _("MISHIRO");
static const u8 BGMName_TOZAN[] = _("TOZAN");
static const u8 BGMName_GIRLEYE[] = _("GIRLEYE");
static const u8 BGMName_MINAMO[] = _("MINAMO");
static const u8 BGMName_ASHROAD[] = _("ASHROAD");
static const u8 BGMName_EVENT0[] = _("EVENT0");
static const u8 BGMName_DEEPDEEP[] = _("DEEPDEEP");
static const u8 BGMName_KACHI1[] = _("KACHI1");
static const u8 BGMName_TITLE3[] = _("TITLE3");
static const u8 BGMName_DEMO1[] = _("DEMO1");
static const u8 BGMName_GIRL_SUP[] = _("GIRL-SUP");
static const u8 BGMName_HAGESHII[] = _("HAGESHII");
static const u8 BGMName_KAKKOII[] = _("KAKKOII");
static const u8 BGMName_KAZANBAI[] = _("KAZANBAI");
static const u8 BGMName_AQA_0[] = _("AQA-0");
static const u8 BGMName_TSURETEK[] = _("TSURETEK");
static const u8 BGMName_BOY_SUP[] = _("BOY-SUP");
static const u8 BGMName_RAINBOW[] = _("RAINBOW");
static const u8 BGMName_AYASII[] = _("AYASII");
static const u8 BGMName_KACHI4[] = _("KACHI4");
static const u8 BGMName_ROPEWAY[] = _("ROPEWAY");
static const u8 BGMName_CASINO[] = _("CASINO");
static const u8 BGMName_HIGHTOWN[] = _("HIGHTOWN");
static const u8 BGMName_SAFARI[] = _("SAFARI");
static const u8 BGMName_C_ROAD[] = _("C-ROAD");
static const u8 BGMName_AJITO[] = _("AJITO");
static const u8 BGMName_M_BOAT[] = _("M-BOAT");
static const u8 BGMName_M_DUNGON[] = _("M-DUNGON");
static const u8 BGMName_FINECITY[] = _("FINECITY");
static const u8 BGMName_MACHUPI[] = _("MACHUPI");
static const u8 BGMName_P_SCHOOL[] = _("P-SCHOOL");
static const u8 BGMName_DENDOU[] = _("DENDOU");
static const u8 BGMName_TONEKUSA[] = _("TONEKUSA");
static const u8 BGMName_MABOROSI[] = _("MABOROSI");
static const u8 BGMName_CON_FAN[] = _("CON-FAN");
static const u8 BGMName_CONTEST0[] = _("CONTEST0");
static const u8 BGMName_MGM0[] = _("MGM0");
static const u8 BGMName_T_BATTLE[] = _("T-BATTLE");
static const u8 BGMName_OOAME[] = _("OOAME");
static const u8 BGMName_HIDERI[] = _("HIDERI");
static const u8 BGMName_RUNECITY[] = _("RUNECITY");
static const u8 BGMName_CON_K[] = _("CON-K");
static const u8 BGMName_EIKOU_R[] = _("EIKOU-R");
static const u8 BGMName_KARAKURI[] = _("KARAKURI");
static const u8 BGMName_HUTAGO[] = _("HUTAGO");
static const u8 BGMName_SITENNOU[] = _("SITENNOU");
static const u8 BGMName_YAMA_EYE[] = _("YAMA-EYE");
static const u8 BGMName_CONLOBBY[] = _("CONLOBBY");
static const u8 BGMName_INTER_V[] = _("INTER-V");
static const u8 BGMName_DAIGO[] = _("DAIGO");
static const u8 BGMName_THANKFOR[] = _("THANKFOR");
static const u8 BGMName_END[] = _("END");
static const u8 BGMName_BATTLE27[] = _("BATTLE27");
static const u8 BGMName_BATTLE31[] = _("BATTLE31");
static const u8 BGMName_BATTLE20[] = _("BATTLE20");
static const u8 BGMName_BATTLE32[] = _("BATTLE32");
static const u8 BGMName_BATTLE33[] = _("BATTLE33");
static const u8 BGMName_BATTLE36[] = _("BATTLE36");
static const u8 BGMName_BATTLE34[] = _("BATTLE34");
static const u8 BGMName_BATTLE35[] = _("BATTLE35");
static const u8 BGMName_BATTLE38[] = _("BATTLE38");
static const u8 BGMName_BATTLE30[] = _("BATTLE30");

static const u8 *const gBGMNames[] =
{
    BGMName_STOP,
    BGMName_TETSUJI,
    BGMName_FIELD13,
    BGMName_KACHI22,
    BGMName_KACHI2,
    BGMName_KACHI3,
    BGMName_KACHI5,
    BGMName_PCC,
    BGMName_NIBI,
    BGMName_SUIKUN,
    BGMName_DOORO1,
    BGMName_DOORO_X1,
    BGMName_DOORO_X3,
    BGMName_MACHI_S2,
    BGMName_MACHI_S4,
    BGMName_GIM,
    BGMName_NAMINORI,
    BGMName_DAN01,
    BGMName_FANFA1,
    BGMName_ME_ASA,
    BGMName_ME_BACHI,
    BGMName_FANFA4,
    BGMName_FANFA5,
    BGMName_ME_WAZA,
    BGMName_BIJYUTU,
    BGMName_DOORO_X4,
    BGMName_FUNE_KAN,
    BGMName_ME_SHINKA,
    BGMName_SHINKA,
    BGMName_ME_WASURE,
    BGMName_SYOUJOEYE,
    BGMName_BOYEYE,
    BGMName_DAN02,
    BGMName_MACHI_S3,
    BGMName_ODAMAKI,
    BGMName_B_TOWER,
    BGMName_SWIMEYE,
    BGMName_DAN03,
    BGMName_ME_KINOMI,
    BGMName_ME_TAMA,
    BGMName_ME_B_BIG,
    BGMName_ME_B_SMALL,
    BGMName_ME_ZANNEN,
    BGMName_BD_TIME,
    BGMName_TEST1,
    BGMName_TEST2,
    BGMName_TEST3,
    BGMName_TEST4,
    BGMName_TEST,
    BGMName_GOMACHI0,
    BGMName_GOTOWN,
    BGMName_POKECEN,
    BGMName_NEXTROAD,
    BGMName_GRANROAD,
    BGMName_CYCLING,
    BGMName_FRIENDLY,
    BGMName_MISHIRO,
    BGMName_TOZAN,
    BGMName_GIRLEYE,
    BGMName_MINAMO,
    BGMName_ASHROAD,
    BGMName_EVENT0,
    BGMName_DEEPDEEP,
    BGMName_KACHI1,
    BGMName_TITLE3,
    BGMName_DEMO1,
    BGMName_GIRL_SUP,
    BGMName_HAGESHII,
    BGMName_KAKKOII,
    BGMName_KAZANBAI,
    BGMName_AQA_0,
    BGMName_TSURETEK,
    BGMName_BOY_SUP,
    BGMName_RAINBOW,
    BGMName_AYASII,
    BGMName_KACHI4,
    BGMName_ROPEWAY,
    BGMName_CASINO,
    BGMName_HIGHTOWN,
    BGMName_SAFARI,
    BGMName_C_ROAD,
    BGMName_AJITO,
    BGMName_M_BOAT,
    BGMName_M_DUNGON,
    BGMName_FINECITY,
    BGMName_MACHUPI,
    BGMName_P_SCHOOL,
    BGMName_DENDOU,
    BGMName_TONEKUSA,
    BGMName_MABOROSI,
    BGMName_CON_FAN,
    BGMName_CONTEST0,
    BGMName_MGM0,
    BGMName_T_BATTLE,
    BGMName_OOAME,
    BGMName_HIDERI,
    BGMName_RUNECITY,
    BGMName_CON_K,
    BGMName_EIKOU_R,
    BGMName_KARAKURI,
    BGMName_HUTAGO,
    BGMName_SITENNOU,
    BGMName_YAMA_EYE,
    BGMName_CONLOBBY,
    BGMName_INTER_V,
    BGMName_DAIGO,
    BGMName_THANKFOR,
    BGMName_END,
    BGMName_BATTLE27,
    BGMName_BATTLE31,
    BGMName_BATTLE20,
    BGMName_BATTLE32,
    BGMName_BATTLE33,
    BGMName_BATTLE36,
    BGMName_BATTLE34,
    BGMName_BATTLE35,
    BGMName_BATTLE38,
    BGMName_BATTLE30
};

// SE names
static const u8 SEName_STOP[] = _("STOP");
static const u8 SEName_KAIFUKU[] = _("KAIFUKU");
static const u8 SEName_PC_LOGON[] = _("PC-LOGON");
static const u8 SEName_PC_OFF[] = _("PC-OFF");
static const u8 SEName_PC_ON[] = _("PC-ON");
static const u8 SEName_SELECT[] = _("SELECT");
static const u8 SEName_WIN_OPEN[] = _("WIN-OPEN");
static const u8 SEName_WALL_HIT[] = _("WALL-HIT");
static const u8 SEName_DOOR[] = _("DOOR");
static const u8 SEName_KAIDAN[] = _("KAIDAN");
static const u8 SEName_DANSA[] = _("DANSA");
static const u8 SEName_JITENSYA[] = _("JITENSYA");
static const u8 SEName_KOUKA_L[] = _("KOUKA-L");
static const u8 SEName_KOUKA_M[] = _("KOUKA-M");
static const u8 SEName_KOUKA_H[] = _("KOUKA-H");
static const u8 SEName_BOWA2[] = _("BOWA2");
static const u8 SEName_POKE_DEAD[] = _("POKE-DEAD");
static const u8 SEName_NIGERU[] = _("NIGERU");
static const u8 SEName_JIDO_DOA[] = _("JIDO-DOA");
static const u8 SEName_NAMINORI[] = _("NAMINORI");
static const u8 SEName_BAN[] = _("BAN");
static const u8 SEName_PIN[] = _("PIN");
static const u8 SEName_BOO[] = _("BOO");
static const u8 SEName_BOWA[] = _("BOWA");
static const u8 SEName_JYUNI[] = _("JYUNI");
static const u8 SEName_A[] = _("A");
static const u8 SEName_I[] = _("I");
static const u8 SEName_U[] = _("U");
static const u8 SEName_E[] = _("E");
static const u8 SEName_O[] = _("O");
static const u8 SEName_N[] = _("N");
static const u8 SEName_SEIKAI[] = _("SEIKAI");
static const u8 SEName_HAZURE[] = _("HAZURE");
static const u8 SEName_EXP[] = _("EXP");
static const u8 SEName_JITE_PYOKO[] = _("JITE-PYOKO");
static const u8 SEName_MU_PACHI[] = _("MU-PACHI");
static const u8 SEName_TK_KASYA[] = _("TK-KASYA");
static const u8 SEName_FU_ZAKU[] = _("FU-ZAKU");
static const u8 SEName_FU_ZAKU2[] = _("FU-ZAKU2");
static const u8 SEName_FU_ZUZUZU[] = _("FU-ZUZUZU");
static const u8 SEName_RU_GASHIN[] = _("RU-GASHIN");
static const u8 SEName_RU_GASYAN[] = _("RU-GASYAN");
static const u8 SEName_RU_BARI[] = _("RU-BARI");
static const u8 SEName_RU_HYUU[] = _("RU-HYUU");
static const u8 SEName_KI_GASYAN[] = _("KI-GASYAN");
static const u8 SEName_TK_WARPIN[] = _("TK-WARPIN");
static const u8 SEName_TK_WARPOUT[] = _("TK-WARPOUT");
static const u8 SEName_TU_SAA[] = _("TU-SAA");
static const u8 SEName_HI_TURUN[] = _("HI-TURUN");
static const u8 SEName_TRACK_MOVE[] = _("TRACK-MOVE");
static const u8 SEName_TRACK_STOP[] = _("TRACK-STOP");
static const u8 SEName_TRACK_HAIK[] = _("TRACK-HAIK");
static const u8 SEName_TRACK_DOOR[] = _("TRACK-DOOR");
static const u8 SEName_MOTER[] = _("MOTER");
static const u8 SEName_CARD[] = _("CARD");
static const u8 SEName_SAVE[] = _("SAVE");
static const u8 SEName_KON[] = _("KON");
static const u8 SEName_KON2[] = _("KON2");
static const u8 SEName_KON3[] = _("KON3");
static const u8 SEName_KON4[] = _("KON4");
static const u8 SEName_SUIKOMU[] = _("SUIKOMU");
static const u8 SEName_NAGERU[] = _("NAGERU");
static const u8 SEName_TOY_C[] = _("TOY-C");
static const u8 SEName_TOY_D[] = _("TOY-D");
static const u8 SEName_TOY_E[] = _("TOY-E");
static const u8 SEName_TOY_F[] = _("TOY-F");
static const u8 SEName_TOY_G[] = _("TOY-G");
static const u8 SEName_TOY_A[] = _("TOY-A");
static const u8 SEName_TOY_B[] = _("TOY-B");
static const u8 SEName_TOY_C1[] = _("TOY-C1");
static const u8 SEName_MIZU[] = _("MIZU");
static const u8 SEName_HASHI[] = _("HASHI");
static const u8 SEName_DAUGI[] = _("DAUGI");
static const u8 SEName_PINPON[] = _("PINPON");
static const u8 SEName_FUUSEN1[] = _("FUUSEN1");
static const u8 SEName_FUUSEN2[] = _("FUUSEN2");
static const u8 SEName_FUUSEN3[] = _("FUUSEN3");
static const u8 SEName_TOY_KABE[] = _("TOY-KABE");
static const u8 SEName_TOY_DANGO[] = _("TOY-DANGO");
static const u8 SEName_DOKU[] = _("DOKU");
static const u8 SEName_ESUKA[] = _("ESUKA");
static const u8 SEName_T_AME[] = _("T-AME");
static const u8 SEName_T_AME_E[] = _("T-AME-E");
static const u8 SEName_T_OOAME[] = _("T-OOAME");
static const u8 SEName_T_OOAME_E[] = _("T-OOAME-E");
static const u8 SEName_T_KOAME[] = _("T-KOAME");
static const u8 SEName_T_KOAME_E[] = _("T-KOAME-E");
static const u8 SEName_T_KAMI[] = _("T-KAMI");
static const u8 SEName_T_KAMI2[] = _("T-KAMI2");
static const u8 SEName_ELEBETA[] = _("ELEBETA");
static const u8 SEName_HINSI[] = _("HINSI");
static const u8 SEName_EXPMAX[] = _("EXPMAX");
static const u8 SEName_TAMAKORO[] = _("TAMAKORO");
static const u8 SEName_TAMAKORO_E[] = _("TAMAKORO-E");
static const u8 SEName_BASABASA[] = _("BASABASA");
static const u8 SEName_REGI[] = _("REGI");
static const u8 SEName_C_GAJI[] = _("C-GAJI");
static const u8 SEName_C_MAKU_U[] = _("C-MAKU-U");
static const u8 SEName_C_MAKU_D[] = _("C-MAKU-D");
static const u8 SEName_C_PASI[] = _("C-PASI");
static const u8 SEName_C_SYU[] = _("C-SYU");
static const u8 SEName_C_PIKON[] = _("C-PIKON");
static const u8 SEName_REAPOKE[] = _("REAPOKE");
static const u8 SEName_OP_BASYU[] = _("OP-BASYU");
static const u8 SEName_BT_START[] = _("BT-START");
static const u8 SEName_DENDOU[] = _("DENDOU");
static const u8 SEName_JIHANKI[] = _("JIHANKI");
static const u8 SEName_TAMA[] = _("TAMA");
static const u8 SEName_Z_SCROLL[] = _("Z-SCROLL");
static const u8 SEName_Z_PAGE[] = _("Z-PAGE");
static const u8 SEName_PN_ON[] = _("PN-ON");
static const u8 SEName_PN_OFF[] = _("PN-OFF");
static const u8 SEName_Z_SEARCH[] = _("Z-SEARCH");
static const u8 SEName_TAMAGO[] = _("TAMAGO");
static const u8 SEName_TB_START[] = _("TB-START");
static const u8 SEName_TB_KON[] = _("TB-KON");
static const u8 SEName_TB_KARA[] = _("TB-KARA");
static const u8 SEName_BIDORO[] = _("BIDORO");
static const u8 SEName_W085[] = _("W085");
static const u8 SEName_W085B[] = _("W085B");
static const u8 SEName_W231[] = _("W231");
static const u8 SEName_W171[] = _("W171");
static const u8 SEName_W233[] = _("W233");
static const u8 SEName_W233B[] = _("W233B");
static const u8 SEName_W145[] = _("W145");
static const u8 SEName_W145B[] = _("W145B");
static const u8 SEName_W145C[] = _("W145C");
static const u8 SEName_W240[] = _("W240");
static const u8 SEName_W015[] = _("W015");
static const u8 SEName_W081[] = _("W081");
static const u8 SEName_W081B[] = _("W081B");
static const u8 SEName_W088[] = _("W088");
static const u8 SEName_W016[] = _("W016");
static const u8 SEName_W016B[] = _("W016B");
static const u8 SEName_W003[] = _("W003");
static const u8 SEName_W104[] = _("W104");
static const u8 SEName_W013[] = _("W013");
static const u8 SEName_W196[] = _("W196");
static const u8 SEName_W086[] = _("W086");
static const u8 SEName_W004[] = _("W004");
static const u8 SEName_W025[] = _("W025");
static const u8 SEName_W025B[] = _("W025B");
static const u8 SEName_W152[] = _("W152");
static const u8 SEName_W026[] = _("W026");
static const u8 SEName_W172[] = _("W172");
static const u8 SEName_W172B[] = _("W172B");
static const u8 SEName_W053[] = _("W053");
static const u8 SEName_W007[] = _("W007");
static const u8 SEName_W092[] = _("W092");
static const u8 SEName_W221[] = _("W221");
static const u8 SEName_W221B[] = _("W221B");
static const u8 SEName_W052[] = _("W052");
static const u8 SEName_W036[] = _("W036");
static const u8 SEName_W059[] = _("W059");
static const u8 SEName_W059B[] = _("W059B");
static const u8 SEName_W010[] = _("W010");
static const u8 SEName_W011[] = _("W011");
static const u8 SEName_W017[] = _("W017");
static const u8 SEName_W019[] = _("W019");
static const u8 SEName_W028[] = _("W028");
static const u8 SEName_W013B[] = _("W013B");
static const u8 SEName_W044[] = _("W044");
static const u8 SEName_W029[] = _("W029");
static const u8 SEName_W057[] = _("W057");
static const u8 SEName_W056[] = _("W056");
static const u8 SEName_W250[] = _("W250");
static const u8 SEName_W030[] = _("W030");
static const u8 SEName_W039[] = _("W039");
static const u8 SEName_W054[] = _("W054");
static const u8 SEName_W077[] = _("W077");
static const u8 SEName_W020[] = _("W020");
static const u8 SEName_W082[] = _("W082");
static const u8 SEName_W047[] = _("W047");
static const u8 SEName_W195[] = _("W195");
static const u8 SEName_W006[] = _("W006");
static const u8 SEName_W091[] = _("W091");
static const u8 SEName_W146[] = _("W146");
static const u8 SEName_W120[] = _("W120");
static const u8 SEName_W153[] = _("W153");
static const u8 SEName_W071B[] = _("W071B");
static const u8 SEName_W071[] = _("W071");
static const u8 SEName_W103[] = _("W103");
static const u8 SEName_W062[] = _("W062");
static const u8 SEName_W062B[] = _("W062B");
static const u8 SEName_W048[] = _("W048");
static const u8 SEName_W187[] = _("W187");
static const u8 SEName_W118[] = _("W118");
static const u8 SEName_W155[] = _("W155");
static const u8 SEName_W122[] = _("W122");
static const u8 SEName_W060[] = _("W060");
static const u8 SEName_W185[] = _("W185");
static const u8 SEName_W014[] = _("W014");
static const u8 SEName_W043[] = _("W043");
static const u8 SEName_W207[] = _("W207");
static const u8 SEName_W207B[] = _("W207B");
static const u8 SEName_W215[] = _("W215");
static const u8 SEName_W109[] = _("W109");
static const u8 SEName_W173[] = _("W173");
static const u8 SEName_W280[] = _("W280");
static const u8 SEName_W202[] = _("W202");
static const u8 SEName_W060B[] = _("W060B");
static const u8 SEName_W076[] = _("W076");
static const u8 SEName_W080[] = _("W080");
static const u8 SEName_W100[] = _("W100");
static const u8 SEName_W107[] = _("W107");
static const u8 SEName_W166[] = _("W166");
static const u8 SEName_W129[] = _("W129");
static const u8 SEName_W115[] = _("W115");
static const u8 SEName_W112[] = _("W112");
static const u8 SEName_W197[] = _("W197");
static const u8 SEName_W199[] = _("W199");
static const u8 SEName_W236[] = _("W236");
static const u8 SEName_W204[] = _("W204");
static const u8 SEName_W268[] = _("W268");
static const u8 SEName_W070[] = _("W070");
static const u8 SEName_W063[] = _("W063");
static const u8 SEName_W127[] = _("W127");
static const u8 SEName_W179[] = _("W179");
static const u8 SEName_W151[] = _("W151");
static const u8 SEName_W201[] = _("W201");
static const u8 SEName_W161[] = _("W161");
static const u8 SEName_W161B[] = _("W161B");
static const u8 SEName_W227[] = _("W227");
static const u8 SEName_W227B[] = _("W227B");
static const u8 SEName_W226[] = _("W226");
static const u8 SEName_W208[] = _("W208");
static const u8 SEName_W213[] = _("W213");
static const u8 SEName_W213B[] = _("W213B");
static const u8 SEName_W234[] = _("W234");
static const u8 SEName_W260[] = _("W260");
static const u8 SEName_W328[] = _("W328");
static const u8 SEName_W320[] = _("W320");
static const u8 SEName_W255[] = _("W255");
static const u8 SEName_W291[] = _("W291");
static const u8 SEName_W089[] = _("W089");
static const u8 SEName_W239[] = _("W239");
static const u8 SEName_W230[] = _("W230");
static const u8 SEName_W281[] = _("W281");
static const u8 SEName_W327[] = _("W327");
static const u8 SEName_W287[] = _("W287");
static const u8 SEName_W257[] = _("W257");
static const u8 SEName_W253[] = _("W253");
static const u8 SEName_W258[] = _("W258");
static const u8 SEName_W322[] = _("W322");
static const u8 SEName_W298[] = _("W298");
static const u8 SEName_W287B[] = _("W287B");
static const u8 SEName_W114[] = _("W114");
static const u8 SEName_W063B[] = _("W063B");

static const u8 *const gSENames[] =
{
    SEName_STOP,
    SEName_KAIFUKU,
    SEName_PC_LOGON,
    SEName_PC_OFF,
    SEName_PC_ON,
    SEName_SELECT,
    SEName_WIN_OPEN,
    SEName_WALL_HIT,
    SEName_DOOR,
    SEName_KAIDAN,
    SEName_DANSA,
    SEName_JITENSYA,
    SEName_KOUKA_L,
    SEName_KOUKA_M,
    SEName_KOUKA_H,
    SEName_BOWA2,
    SEName_POKE_DEAD,
    SEName_NIGERU,
    SEName_JIDO_DOA,
    SEName_NAMINORI,
    SEName_BAN,
    SEName_PIN,
    SEName_BOO,
    SEName_BOWA,
    SEName_JYUNI,
    SEName_A,
    SEName_I,
    SEName_U,
    SEName_E,
    SEName_O,
    SEName_N,
    SEName_SEIKAI,
    SEName_HAZURE,
    SEName_EXP,
    SEName_JITE_PYOKO,
    SEName_MU_PACHI,
    SEName_TK_KASYA,
    SEName_FU_ZAKU,
    SEName_FU_ZAKU2,
    SEName_FU_ZUZUZU,
    SEName_RU_GASHIN,
    SEName_RU_GASYAN,
    SEName_RU_BARI,
    SEName_RU_HYUU,
    SEName_KI_GASYAN,
    SEName_TK_WARPIN,
    SEName_TK_WARPOUT,
    SEName_TU_SAA,
    SEName_HI_TURUN,
    SEName_TRACK_MOVE,
    SEName_TRACK_STOP,
    SEName_TRACK_HAIK,
    SEName_TRACK_DOOR,
    SEName_MOTER,
    SEName_CARD,
    SEName_SAVE,
    SEName_KON,
    SEName_KON2,
    SEName_KON3,
    SEName_KON4,
    SEName_SUIKOMU,
    SEName_NAGERU,
    SEName_TOY_C,
    SEName_TOY_D,
    SEName_TOY_E,
    SEName_TOY_F,
    SEName_TOY_G,
    SEName_TOY_A,
    SEName_TOY_B,
    SEName_TOY_C1,
    SEName_MIZU,
    SEName_HASHI,
    SEName_DAUGI,
    SEName_PINPON,
    SEName_FUUSEN1,
    SEName_FUUSEN2,
    SEName_FUUSEN3,
    SEName_TOY_KABE,
    SEName_TOY_DANGO,
    SEName_DOKU,
    SEName_ESUKA,
    SEName_T_AME,
    SEName_T_AME_E,
    SEName_T_OOAME,
    SEName_T_OOAME_E,
    SEName_T_KOAME,
    SEName_T_KOAME_E,
    SEName_T_KAMI,
    SEName_T_KAMI2,
    SEName_ELEBETA,
    SEName_HINSI,
    SEName_EXPMAX,
    SEName_TAMAKORO,
    SEName_TAMAKORO_E,
    SEName_BASABASA,
    SEName_REGI,
    SEName_C_GAJI,
    SEName_C_MAKU_U,
    SEName_C_MAKU_D,
    SEName_C_PASI,
    SEName_C_SYU,
    SEName_C_PIKON,
    SEName_REAPOKE,
    SEName_OP_BASYU,
    SEName_BT_START,
    SEName_DENDOU,
    SEName_JIHANKI,
    SEName_TAMA,
    SEName_Z_SCROLL,
    SEName_Z_PAGE,
    SEName_PN_ON,
    SEName_PN_OFF,
    SEName_Z_SEARCH,
    SEName_TAMAGO,
    SEName_TB_START,
    SEName_TB_KON,
    SEName_TB_KARA,
    SEName_BIDORO,
    SEName_W085,
    SEName_W085B,
    SEName_W231,
    SEName_W171,
    SEName_W233,
    SEName_W233B,
    SEName_W145,
    SEName_W145B,
    SEName_W145C,
    SEName_W240,
    SEName_W015,
    SEName_W081,
    SEName_W081B,
    SEName_W088,
    SEName_W016,
    SEName_W016B,
    SEName_W003,
    SEName_W104,
    SEName_W013,
    SEName_W196,
    SEName_W086,
    SEName_W004,
    SEName_W025,
    SEName_W025B,
    SEName_W152,
    SEName_W026,
    SEName_W172,
    SEName_W172B,
    SEName_W053,
    SEName_W007,
    SEName_W092,
    SEName_W221,
    SEName_W221B,
    SEName_W052,
    SEName_W036,
    SEName_W059,
    SEName_W059B,
    SEName_W010,
    SEName_W011,
    SEName_W017,
    SEName_W019,
    SEName_W028,
    SEName_W013B,
    SEName_W044,
    SEName_W029,
    SEName_W057,
    SEName_W056,
    SEName_W250,
    SEName_W030,
    SEName_W039,
    SEName_W054,
    SEName_W077,
    SEName_W020,
    SEName_W082,
    SEName_W047,
    SEName_W195,
    SEName_W006,
    SEName_W091,
    SEName_W146,
    SEName_W120,
    SEName_W153,
    SEName_W071B,
    SEName_W071,
    SEName_W103,
    SEName_W062,
    SEName_W062B,
    SEName_W048,
    SEName_W187,
    SEName_W118,
    SEName_W155,
    SEName_W122,
    SEName_W060,
    SEName_W185,
    SEName_W014,
    SEName_W043,
    SEName_W207,
    SEName_W207B,
    SEName_W215,
    SEName_W109,
    SEName_W173,
    SEName_W280,
    SEName_W202,
    SEName_W060B,
    SEName_W076,
    SEName_W080,
    SEName_W100,
    SEName_W107,
    SEName_W166,
    SEName_W129,
    SEName_W115,
    SEName_W112,
    SEName_W197,
    SEName_W199,
    SEName_W236,
    SEName_W204,
    SEName_W268,
    SEName_W070,
    SEName_W063,
    SEName_W127,
    SEName_W179,
    SEName_W151,
    SEName_W201,
    SEName_W161,
    SEName_W161B,
    SEName_W227,
    SEName_W227B,
    SEName_W226,
    SEName_W208,
    SEName_W213,
    SEName_W213B,
    SEName_W234,
    SEName_W260,
    SEName_W328,
    SEName_W320,
    SEName_W255,
    SEName_W291,
    SEName_W089,
    SEName_W239,
    SEName_W230,
    SEName_W281,
    SEName_W327,
    SEName_W287,
    SEName_W257,
    SEName_W253,
    SEName_W258,
    SEName_W322,
    SEName_W298,
    SEName_W287B,
    SEName_W114,
    SEName_W063B
};

void sub_80BA258(u8);
void sub_80BA384(u8);
void sub_80BA65C(u8);
void sub_80BA68C(u8);
void sub_80BA6B8(u8);
void sub_80BA700(u16, u16, u16);
void sub_80BA79C(const u8 *const, u16, u16);
void sub_80BA800(u8);
void sub_80BAA48(u8);
void sub_80BACDC(s8);
void sub_80BAD5C(void);
void sub_80BAE10(u8, u8);
void sub_80BAE78(int, u16, u16, u8);
void sub_80BAF84(u8);
void sub_80BB038(u8);
void sub_80BB1D4(void);
void sub_80BB25C(u8);
void sub_80BB3B4(u8);
void sub_80BB494(void);

void sub_80BA0A8(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_80BA0C0(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();

    if(gUnknown_020387B0 != 0)
    {
        m4aSoundMain();
        m4aSoundMain();
        m4aSoundMain();
    }
}

// unused
void CB2_StartSoundCheckMenu(void)
{
    u8 taskId;

    SetVBlankCallback(NULL);
    REG_DISPCNT = 0;
    REG_BG2CNT = 0;
    REG_BG1CNT = 0;
    REG_BG0CNT = 0;
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    DmaFill16(3, 0, VRAM, VRAM_SIZE);
    DmaFill32(3, 0, OAM, OAM_SIZE);
    DmaFill16(3, 0, PLTT, PLTT_SIZE);
    ResetPaletteFade();
    ResetTasks();
    ResetSpriteData();
    SetUpWindowConfig(&gWindowConfig_81E6C3C);
    InitMenuWindow(&gWindowConfig_81E6CE4);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
    REG_WIN0H = 0;
    REG_WIN0V = 0;
    REG_WIN1H = 0;
    REG_WIN1V = 0;
    REG_WININ = 0x1111;
    REG_WINOUT = 0x31;
    REG_BLDCNT = 0xE1;
    REG_BLDALPHA = 0;
    REG_BLDY = 7;
    REG_IE = 1; // could be a typo of REG_IME
    REG_IE |= 1;
    REG_DISPSTAT |= 8;
    SetVBlankCallback(sub_80BA0C0);
    SetMainCallback2(sub_80BA0A8);
    REG_DISPCNT = 0x7140;
    taskId = CreateTask(sub_80BA258, 0);
    TASK.WINDOW_SELECTED = BGM_WINDOW;
    TASK.BGM_INDEX = 0;
    TASK.SE_INDEX = 0;
    TASK.UNK_DATA3 = 0;
    gUnknown_020387B0 = 0;
    TASK.UNK_DATA3 = 0; // why?
    m4aSoundInit();
}

// Task_InitSoundCheckMenu
void sub_80BA258(u8 taskId)
{
    u8 soundcheckStr[9];
    u8 bgmStr[4];
    u8 seStr[4];
    u8 abDescStr[13];
    u8 upDownStr[12];
    u8 driverStr[14];

    // these probably used size of the strings themselves, but they are not in the C file yet.
    memcpy(soundcheckStr, gDebugText_SoundCheckJap, sizeof soundcheckStr);
    memcpy(bgmStr, gDebugText_BGM, sizeof bgmStr);
    memcpy(seStr, gDebugText_SE, sizeof seStr);
    memcpy(abDescStr, gDebugText_ABDesc, sizeof abDescStr);
    memcpy(upDownStr, gDebugText_UpDown, sizeof upDownStr);
    memcpy(driverStr, gDebugText_DriverTest, sizeof driverStr);

    if(!gPaletteFade.active)
    {
        MenuDrawTextWindow(0x2, 0, 0x1B, 0x3);
        MenuDrawTextWindow(0x2, 0x5, 0x1B, 0xA);
        MenuDrawTextWindow(0x2, 0xC, 0x1B, 0x11);
        MenuPrint(soundcheckStr, 4, 1);
        MenuPrint(abDescStr, 14, 1);
        MenuPrint(bgmStr, 4, 6);
        MenuPrint(upDownStr, 14, 6);
        MenuPrint(seStr, 4, 13);
        MenuPrint(upDownStr, 14, 13);
        MenuPrint(driverStr, 14, 18);
        TASK.FUNC = sub_80BA384;
        REG_WIN0H = 0x11DF;
        REG_WIN0V = 0x11F; 
    }
}

void sub_80BA384(u8 taskId) // Task_HandleDrawingSoundCheckMenuText
{
    sub_80BA6B8(TASK.WINDOW_SELECTED);
    sub_80BA700(TASK.BGM_INDEX + BGM_STOP, 7, 8); // print by BGM index
    sub_80BA79C(gBGMNames[TASK.BGM_INDEX], 11, 8);
    sub_80BA700(TASK.SE_INDEX, 7, 15);
    sub_80BA79C(gSENames[TASK.SE_INDEX], 11, 15);
    TASK.FUNC = sub_80BA65C;
}

#ifdef NONMATCHING
bool8 sub_80BA400(u8 taskId) // Task_ProcessSoundCheckMenuInput
{
    if(gMain.newKeys & R_BUTTON) // driver test
    {
        TASK.FUNC = sub_80BA800;
        return FALSE;
    }
    if(gMain.newKeys & L_BUTTON)
    {
        TASK.FUNC = sub_80BAF84;
        return FALSE;
    }
    if(gMain.newKeys & START_BUTTON)
    {
        TASK.FUNC = sub_80BB25C;
        return FALSE;
    }
    if(gMain.newKeys & A_BUTTON) // both these cases insist on non reuses of certain data variables and cause the function to not match.
    {
        if(TASK.WINDOW_SELECTED != 0) // is playing?
        {
            if(TASK.UNK_DATA4 != 0)
            {
                if(TASK.SE_INDEX != 0) // why are you insiting on a non signed halfword?
                {
                    m4aSongNumStop(TASK.UNK_DATA4);
                }
                else
                {
                    m4aSongNumStop(TASK.SE_INDEX);
                    TASK.UNK_DATA4 = TASK.SE_INDEX;
                    return FALSE;
                }
            }
            else if(TASK.SE_INDEX == 0) // _080BA4BA
            {
                return FALSE;
            }
            // _080BA4C4
            m4aSongNumStart(TASK.SE_INDEX);
            TASK.UNK_DATA4 = TASK.SE_INDEX;
            return FALSE;
        }
        else // _080BA4D0
        {
            if(TASK.UNK_DATA3 != 0)
            {
                if(TASK.BGM_INDEX != 0)
                {
                    m4aSongNumStop(TASK.UNK_DATA3 + BGM_STOP);
                }
                else // _080BA500
                {
                    m4aSongNumStop(TASK.UNK_DATA3 + BGM_STOP);
                    TASK.UNK_DATA3 = TASK.BGM_INDEX;
                    return FALSE;
                }
            }
            else if(TASK.BGM_INDEX == 0) // _080BA514
                return FALSE;

            m4aSongNumStart(TASK.BGM_INDEX + BGM_STOP);
            TASK.UNK_DATA3 = TASK.BGM_INDEX;
        }
        return FALSE;
    }
    if(gMain.newKeys & B_BUTTON)
    {
        m4aSongNumStart(5);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
        TASK.FUNC = sub_80BA68C;
        return FALSE;
    }
    if(gMain.newAndRepeatedKeys & DPAD_UP)
    {
        TASK.data[8] ^= A_BUTTON; // huh?
        return TRUE;
    }
    if(gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        TASK.data[8] ^= A_BUTTON; // huh?
        return TRUE;
    }
    else
    {
    u16 keys = gMain.newAndRepeatedKeys & DPAD_RIGHT;
    if(keys)
    {
        if(TASK.WINDOW_SELECTED != 0)
        {
            if(TASK.SE_INDEX > 0)
            {
                TASK.SE_INDEX--;
            }
            else
            {
                TASK.SE_INDEX = 0xF7;
            }
        }
        else if(TASK.BGM_INDEX > 0)
        {
            TASK.BGM_INDEX--;
        }
        else
        {
            TASK.BGM_INDEX = 0x75;
        }
        return TRUE;
    }
    if(gMain.newAndRepeatedKeys & DPAD_LEFT)
    {
        if(TASK.WINDOW_SELECTED != 0)
        {
            if(TASK.SE_INDEX < 0xF7)
            {
                TASK.SE_INDEX++;
            }
            else
            {
                TASK.SE_INDEX = keys; // ??
            }
        }
        else if(TASK.BGM_INDEX < 0x75)
        {
            TASK.BGM_INDEX++;
            return TRUE;
        }
        else
        {
            TASK.BGM_INDEX = TASK.SE_INDEX;
            return TRUE;
        }
        return TRUE;
    }
    if(gMain.heldKeys & SELECT_BUTTON)
    {
        gUnknown_020387B0 = A_BUTTON;
        return FALSE;
    }
    else
    {
        gUnknown_020387B0 = (gMain.heldKeys & SELECT_BUTTON);
        return FALSE;
    }
    }
}
#else
__attribute__((naked))
bool8 sub_80BA400(u8 taskId)
{
    asm(".syntax unified\n\
    push {r4-r6,lr}\n\
    sub sp, 0x4\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    ldr r2, _080BA428 @ =gMain\n\
    ldrh r1, [r2, 0x2E]\n\
    movs r0, 0x80\n\
    lsls r0, 1\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080BA434\n\
    ldr r0, _080BA42C @ =gTasks\n\
    lsls r1, r4, 2\n\
    adds r1, r4\n\
    lsls r1, 3\n\
    adds r1, r0\n\
    ldr r0, _080BA430 @ =sub_80BA800\n\
    str r0, [r1]\n\
    b _080BA64C\n\
    .align 2, 0\n\
_080BA428: .4byte gMain\n\
_080BA42C: .4byte gTasks\n\
_080BA430: .4byte sub_80BA800\n\
_080BA434:\n\
    movs r0, 0x80\n\
    lsls r0, 2\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080BA458\n\
    ldr r0, _080BA450 @ =gTasks\n\
    lsls r1, r4, 2\n\
    adds r1, r4\n\
    lsls r1, 3\n\
    adds r1, r0\n\
    ldr r0, _080BA454 @ =sub_80BAF84\n\
    str r0, [r1]\n\
    b _080BA64C\n\
    .align 2, 0\n\
_080BA450: .4byte gTasks\n\
_080BA454: .4byte sub_80BAF84\n\
_080BA458:\n\
    movs r0, 0x8\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080BA478\n\
    ldr r0, _080BA470 @ =gTasks\n\
    lsls r1, r4, 2\n\
    adds r1, r4\n\
    lsls r1, 3\n\
    adds r1, r0\n\
    ldr r0, _080BA474 @ =sub_80BB25C\n\
    str r0, [r1]\n\
    b _080BA64C\n\
    .align 2, 0\n\
_080BA470: .4byte gTasks\n\
_080BA474: .4byte sub_80BB25C\n\
_080BA478:\n\
    movs r6, 0x1\n\
    movs r5, 0x1\n\
    ands r5, r1\n\
    cmp r5, 0\n\
    beq _080BA538\n\
    ldr r0, _080BA4AC @ =gTasks\n\
    lsls r1, r4, 2\n\
    adds r1, r4\n\
    lsls r1, 3\n\
    adds r5, r1, r0\n\
    movs r1, 0x8\n\
    ldrsh r0, [r5, r1]\n\
    cmp r0, 0\n\
    beq _080BA4D0\n\
    movs r2, 0x10\n\
    ldrsh r0, [r5, r2]\n\
    cmp r0, 0\n\
    beq _080BA4BA\n\
    movs r3, 0xC\n\
    ldrsh r4, [r5, r3]\n\
    cmp r4, 0\n\
    beq _080BA4B0\n\
    ldrh r0, [r5, 0x10]\n\
    bl m4aSongNumStop\n\
    b _080BA4C4\n\
    .align 2, 0\n\
_080BA4AC: .4byte gTasks\n\
_080BA4B0:\n\
    ldrh r0, [r5, 0x10]\n\
    bl m4aSongNumStop\n\
    strh r4, [r5, 0x10]\n\
    b _080BA64C\n\
_080BA4BA:\n\
    movs r4, 0xC\n\
    ldrsh r0, [r5, r4]\n\
    cmp r0, 0\n\
    bne _080BA4C4\n\
    b _080BA64C\n\
_080BA4C4:\n\
    ldrh r0, [r5, 0xC]\n\
    bl m4aSongNumStart\n\
    ldrh r0, [r5, 0xC]\n\
    strh r0, [r5, 0x10]\n\
    b _080BA64C\n\
_080BA4D0:\n\
    ldrh r1, [r5, 0xE]\n\
    movs r2, 0xE\n\
    ldrsh r0, [r5, r2]\n\
    cmp r0, 0\n\
    beq _080BA514\n\
    movs r3, 0xA\n\
    ldrsh r4, [r5, r3]\n\
    cmp r4, 0\n\
    beq _080BA500\n\
    ldr r0, _080BA4FC @ =0x0000015d\n\
    adds r4, r0, 0\n\
    adds r0, r1, r4\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    bl m4aSongNumStop\n\
    ldrh r1, [r5, 0xA]\n\
    adds r4, r1\n\
    lsls r4, 16\n\
    lsrs r4, 16\n\
    adds r0, r4, 0\n\
    b _080BA528\n\
    .align 2, 0\n\
_080BA4FC: .4byte 0x0000015d\n\
_080BA500:\n\
    ldr r2, _080BA510 @ =0x0000015d\n\
    adds r0, r1, r2\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    bl m4aSongNumStop\n\
    strh r4, [r5, 0xE]\n\
    b _080BA64C\n\
    .align 2, 0\n\
_080BA510: .4byte 0x0000015d\n\
_080BA514:\n\
    ldrh r1, [r5, 0xA]\n\
    movs r3, 0xA\n\
    ldrsh r0, [r5, r3]\n\
    cmp r0, 0\n\
    bne _080BA520\n\
    b _080BA64C\n\
_080BA520:\n\
    ldr r4, _080BA534 @ =0x0000015d\n\
    adds r0, r1, r4\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
_080BA528:\n\
    bl m4aSongNumStart\n\
    ldrh r0, [r5, 0xA]\n\
    strh r0, [r5, 0xE]\n\
    b _080BA64C\n\
    .align 2, 0\n\
_080BA534: .4byte 0x0000015d\n\
_080BA538:\n\
    movs r0, 0x2\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080BA570\n\
    movs r0, 0x5\n\
    bl m4aSongNumStart\n\
    movs r0, 0x1\n\
    negs r0, r0\n\
    str r5, [sp]\n\
    movs r1, 0\n\
    movs r2, 0\n\
    movs r3, 0x10\n\
    bl BeginNormalPaletteFade\n\
    ldr r1, _080BA568 @ =gTasks\n\
    lsls r0, r4, 2\n\
    adds r0, r4\n\
    lsls r0, 3\n\
    adds r0, r1\n\
    ldr r1, _080BA56C @ =sub_80BA68C\n\
    str r1, [r0]\n\
    b _080BA64C\n\
    .align 2, 0\n\
_080BA568: .4byte gTasks\n\
_080BA56C: .4byte sub_80BA68C\n\
_080BA570:\n\
    ldrh r1, [r2, 0x30]\n\
    movs r0, 0x40\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _080BA582\n\
    movs r0, 0x80\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080BA59C\n\
_080BA582:\n\
    ldr r0, _080BA598 @ =gTasks\n\
    lsls r1, r4, 2\n\
    adds r1, r4\n\
    lsls r1, 3\n\
    adds r1, r0\n\
    ldrh r0, [r1, 0x8]\n\
    eors r0, r6\n\
    strh r0, [r1, 0x8]\n\
_080BA592:\n\
    movs r0, 0x1\n\
    b _080BA64E\n\
    .align 2, 0\n\
_080BA598: .4byte gTasks\n\
_080BA59C:\n\
    movs r0, 0x10\n\
    ands r0, r1\n\
    lsls r0, 16\n\
    lsrs r3, r0, 16\n\
    cmp r3, 0\n\
    beq _080BA5EA\n\
    ldr r0, _080BA5CC @ =gTasks\n\
    lsls r1, r4, 2\n\
    adds r1, r4\n\
    lsls r1, 3\n\
    adds r1, r0\n\
    movs r2, 0x8\n\
    ldrsh r0, [r1, r2]\n\
    cmp r0, 0\n\
    beq _080BA5D6\n\
    ldrh r2, [r1, 0xC]\n\
    movs r3, 0xC\n\
    ldrsh r0, [r1, r3]\n\
    cmp r0, 0\n\
    ble _080BA5D0\n\
    subs r0, r2, 0x1\n\
    strh r0, [r1, 0xC]\n\
    b _080BA592\n\
    .align 2, 0\n\
_080BA5CC: .4byte gTasks\n\
_080BA5D0:\n\
    movs r0, 0xF7\n\
    strh r0, [r1, 0xC]\n\
    b _080BA592\n\
_080BA5D6:\n\
    ldrh r2, [r1, 0xA]\n\
    movs r4, 0xA\n\
    ldrsh r0, [r1, r4]\n\
    cmp r0, 0\n\
    ble _080BA5E4\n\
    subs r0, r2, 0x1\n\
    b _080BA5E6\n\
_080BA5E4:\n\
    movs r0, 0x75\n\
_080BA5E6:\n\
    strh r0, [r1, 0xA]\n\
    b _080BA592\n\
_080BA5EA:\n\
    movs r0, 0x20\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080BA630\n\
    ldr r1, _080BA614 @ =gTasks\n\
    lsls r0, r4, 2\n\
    adds r0, r4\n\
    lsls r0, 3\n\
    adds r1, r0, r1\n\
    movs r0, 0x8\n\
    ldrsh r2, [r1, r0]\n\
    cmp r2, 0\n\
    beq _080BA61C\n\
    ldrh r2, [r1, 0xC]\n\
    movs r4, 0xC\n\
    ldrsh r0, [r1, r4]\n\
    cmp r0, 0xF6\n\
    bgt _080BA618\n\
    adds r0, r2, 0x1\n\
    strh r0, [r1, 0xC]\n\
    b _080BA592\n\
    .align 2, 0\n\
_080BA614: .4byte gTasks\n\
_080BA618:\n\
    strh r3, [r1, 0xC]\n\
    b _080BA592\n\
_080BA61C:\n\
    ldrh r3, [r1, 0xA]\n\
    movs r4, 0xA\n\
    ldrsh r0, [r1, r4]\n\
    cmp r0, 0x74\n\
    bgt _080BA62C\n\
    adds r0, r3, 0x1\n\
    strh r0, [r1, 0xA]\n\
    b _080BA592\n\
_080BA62C:\n\
    strh r2, [r1, 0xA]\n\
    b _080BA592\n\
_080BA630:\n\
    ldrh r1, [r2, 0x2C]\n\
    movs r0, 0x4\n\
    ands r0, r1\n\
    lsls r0, 16\n\
    lsrs r1, r0, 16\n\
    cmp r1, 0\n\
    beq _080BA648\n\
    ldr r0, _080BA644 @ =gUnknown_020387B0\n\
    strb r6, [r0]\n\
    b _080BA64C\n\
    .align 2, 0\n\
_080BA644: .4byte gUnknown_020387B0\n\
_080BA648:\n\
    ldr r0, _080BA658 @ =gUnknown_020387B0\n\
    strb r1, [r0]\n\
_080BA64C:\n\
    movs r0, 0\n\
_080BA64E:\n\
    add sp, 0x4\n\
    pop {r4-r6}\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_080BA658: .4byte gUnknown_020387B0\n\
    .syntax divided");
}
#endif

void sub_80BA65C(u8 taskId)
{
    if(sub_80BA400(taskId) != FALSE)
        TASK.FUNC = sub_80BA384;
}

void sub_80BA68C(u8 taskId)
{
    if(!gPaletteFade.active)
    {
        DestroyTask(taskId);
        SetMainCallback2(CB2_InitTitleScreen);
    }
}

void sub_80BA6B8(u8 windowType)
{
    switch(windowType)
    {
        case BGM_WINDOW:
        default:
            REG_WIN1H = 0x11DF;
            REG_WIN1V = 0x2957;
            break;
        case SE_WINDOW:
            REG_WIN1H = 0x11DF;
            REG_WIN1V = 0x618F;
            break;
    }
}

void sub_80BA700(u16 soundIndex, u16 x, u16 y) // PrintSoundNumber ?
{
    u8 i;
    u8 str[5];
    bool8 someBool;
    u8 divisorValue;

    for(i = 0; i < 3; i++)
        str[i] = 0; // initialize array

    str[3] = 0xB0;
    str[4] = 0xFF;
    someBool = FALSE;

    divisorValue = soundIndex / 100;
    if(divisorValue)
    {
        str[0] = divisorValue + 0xA1;
        someBool = TRUE;
    }

    divisorValue = (soundIndex % 100) / 10;
    if(divisorValue || someBool != FALSE)
        str[1] = divisorValue + 0xA1;

    str[2] = ((soundIndex % 100) % 10) + 0xA1;
    MenuPrint(str, x, y);
}

void sub_80BA79C(const u8 *const string, u16 x, u16 y)
{
    u8 i;
    u8 str[11];

    for(i = 0; i < 11; i++)
        str[i] = 0; // format string.

    str[10] = 0xFF; // the above for loop formats the last element of the array unnecessarily.

    for(i = 0; string[i] != 0xFF && i < 10; i++)
        str[i] = string[i];

    MenuPrint(str, x, y);
}

void sub_80BA800(u8 taskId) // Task_DrawDriverTestMenu
{
    u8 bbackStr[10];
    u8 aplayStr[11];
    u8 voiceStr[10];
    u8 volumeStr[10];
    u8 panpotStr[10];
    u8 pitchStr[10];
    u8 lengthStr[10];
    u8 releaseStr[10];
    u8 progressStr[10];
    u8 chorusStr[10];
    u8 priorityStr[10];
    u8 playingStr[9];
    u8 reverseStr[9];
    u8 stereoStr[9];

    memcpy(bbackStr, gDebugText_BBack, sizeof bbackStr);
    memcpy(aplayStr, gDebugText_APlay, sizeof aplayStr);
    memcpy(voiceStr, gDebugText_Voice, sizeof voiceStr);
    memcpy(volumeStr, gDebugText_Volume, sizeof volumeStr);
    memcpy(panpotStr, gDebugText_Panpot, sizeof panpotStr);
    memcpy(pitchStr, gDebugText_Pitch, sizeof pitchStr);
    memcpy(lengthStr, gDebugText_Length, sizeof lengthStr);
    memcpy(releaseStr, gDebugText_Release, sizeof releaseStr);
    memcpy(progressStr, gDebugText_Progress, sizeof progressStr);
    memcpy(chorusStr, gDebugText_Chorus, sizeof chorusStr);
    memcpy(priorityStr, gDebugText_Priority, sizeof priorityStr);
    memcpy(playingStr, gDebugText_Playing, sizeof playingStr);
    memcpy(reverseStr, gDebugText_Reverse, sizeof reverseStr);
    memcpy(stereoStr, gDebugText_Stereo, sizeof stereoStr);

    REG_DISPCNT = 0x3140;
    MenuDrawTextWindow(0, 0, 0x1D, 0x13);
    MenuPrint(bbackStr, 0x13, 0x4);
    MenuPrint(aplayStr, 0x13, 0x2);
    MenuPrint(voiceStr, 0x2, 0x1);
    MenuPrint(volumeStr, 0x2, 0x3);
    MenuPrint(panpotStr, 0x2, 0x5);
    MenuPrint(pitchStr, 0x2, 0x7);
    MenuPrint(lengthStr, 0x2, 0x9);
    MenuPrint(releaseStr, 0x2, 0xB);
    MenuPrint(progressStr, 0x2, 0xD);
    MenuPrint(chorusStr, 0x2, 0xF);
    MenuPrint(priorityStr, 0x2, 0x11);
    MenuPrint(playingStr, 0x13, 0x10);
    MenuPrint(reverseStr, 0x13, 0xE);
    MenuPrint(stereoStr, 0x13, 0xC);
    REG_WIN0H = 0xF0;
    REG_WIN0V = 0xA0;
    gUnknown_020387B3 = 0;
    gUnknown_020387B1 = 0;
    gUnknown_020387B2 = 0;
    gUnknown_03005D30 = NULL;
    gUnknown_020387D8 = 0;
    gUnknown_020387D9 = 1;
    gUnknown_020387B4[CRY_TEST_UNK0] = 0;
    gUnknown_020387B4[CRY_TEST_VOLUME] = 0x78;
    gUnknown_020387B4[CRY_TEST_PANPOT] = 0;
    gUnknown_020387B4[CRY_TEST_PITCH] = 0x3C00;
    gUnknown_020387B4[CRY_TEST_LENGTH] = 0xB4;
    gUnknown_020387B4[CRY_TEST_PROGRESS] = 0;
    gUnknown_020387B4[CRY_TEST_RELEASE] = 0;
    gUnknown_020387B4[CRY_TEST_CHORUS] = 0;
    gUnknown_020387B4[CRY_TEST_PRIORITY] = 2;
    sub_80BAD5C();
    sub_80BAE10(0, 0);
    TASK.FUNC = sub_80BAA48;
}

void sub_80BAA48(u8 taskId) // Task_ProcessDriverTestInput
{
    if(gMain.newKeys & 0x2)
    {
        REG_DISPCNT = 0x7140;
        REG_WIN0H = 0x11DF;
        REG_WIN0V = 0x11F;
        MenuZeroFillWindowRect(0, 0, 0x1D, 0x13);
        TASK.FUNC = sub_80BA258;
        return;
    }
    if(gMain.newAndRepeatedKeys & 0x40) // _080BAAA8
    {
        u8 backupVar = gUnknown_020387B3;
        if(--gUnknown_020387B3 < 0)
            gUnknown_020387B3 = 8;

        sub_80BAE10(backupVar, gUnknown_020387B3);
        return;
    }
    if(gMain.newAndRepeatedKeys & 0x80) // _080BAAD0
    {
        u8 backupVar = gUnknown_020387B3;
        if(++gUnknown_020387B3 > 8)
            gUnknown_020387B3 = 0;

        sub_80BAE10(backupVar, gUnknown_020387B3);
        return;
    }
    if(gMain.newKeys & 0x8) // _080BAAF8
    {
        gUnknown_020387D8 ^= 1;
        sub_80BAD5C();
        return;
    }
    if(gMain.newKeys & 0x4) // _080BAB14
    {
        gUnknown_020387D9 ^= 1;
        sub_80BAD5C();
        SetPokemonCryStereo(gUnknown_020387D9);
        return;
    }
    if(gMain.newAndRepeatedKeys & 0x100) // _080BAB38
    {
        sub_80BACDC(10);
        sub_80BAD5C();
        return;
    }
    if(gMain.newAndRepeatedKeys & 0x200) // _080BAB46
    {
        sub_80BACDC(-10);
        sub_80BAD5C();
        return;
    }
    if(gMain.newAndRepeatedKeys & 0x20) // _080BAB56
    {
        sub_80BACDC(-1);
        sub_80BAD5C();
        return;
    }
    if(gMain.newAndRepeatedKeys & 0x10) // _080BAB64
    {
        sub_80BACDC(1);
        sub_80BAD5C();
        return;
    }
    if(gMain.newKeys & 0x1) // _080BAB78
    {
        u8 divide, remaining;

        SetPokemonCryVolume(gUnknown_020387B4[CRY_TEST_VOLUME]);
        SetPokemonCryPanpot(gUnknown_020387B4[CRY_TEST_PANPOT]);
        SetPokemonCryPitch(gUnknown_020387B4[CRY_TEST_PITCH]);
        SetPokemonCryLength(gUnknown_020387B4[CRY_TEST_LENGTH]);
        SetPokemonCryProgress(gUnknown_020387B4[CRY_TEST_PROGRESS]);
        SetPokemonCryRelease(gUnknown_020387B4[CRY_TEST_RELEASE]);
        SetPokemonCryChorus(gUnknown_020387B4[CRY_TEST_CHORUS]);
        SetPokemonCryPriority(gUnknown_020387B4[CRY_TEST_PRIORITY]);

        remaining = gUnknown_020387B4[CRY_TEST_UNK0] % 128;
        divide = gUnknown_020387B4[CRY_TEST_UNK0] / 128;

        switch(divide)
        {
            case 0:
                if(gUnknown_020387D8)
                    gUnknown_03005D30 = SetPokemonCryTone(&voicegroup_84537C0[remaining]);
                else
                    gUnknown_03005D30 = SetPokemonCryTone(&voicegroup_8452590[remaining]);
                break;
            case 1:
                if(gUnknown_020387D8)
                    gUnknown_03005D30 = SetPokemonCryTone(&voicegroup_8453DC0[remaining]);
                else
                    gUnknown_03005D30 = SetPokemonCryTone(&voicegroup_8452B90[remaining]);
                break;
            case 2:
                if(gUnknown_020387D8)
                    gUnknown_03005D30 = SetPokemonCryTone(&voicegroup_84543C0[remaining]);
                else
                    gUnknown_03005D30 = SetPokemonCryTone(&voicegroup_8453190[remaining]);
                break;
            case 3:
                if(gUnknown_020387D8)
                    gUnknown_03005D30 = SetPokemonCryTone(&voicegroup_84549C0[remaining]);
                else
                    gUnknown_03005D30 = SetPokemonCryTone(&voicegroup_8453790[remaining]);
                break;
        }
    }

    // _080BACA2
    if(gUnknown_03005D30 != NULL)
    {
        gUnknown_020387B1 = IsPokemonCryPlaying(gUnknown_03005D30);

        if(gUnknown_020387B1 != gUnknown_020387B2)
            sub_80BAD5C();

        gUnknown_020387B2 = gUnknown_020387B1;
    }
}

void sub_80BACDC(s8 var)
{
    int minMaxArray[16];

    memcpy(minMaxArray, gUnknown_083D039C, sizeof minMaxArray);
    gUnknown_020387B4[gUnknown_020387B3] += var;

    if(gUnknown_020387B4[gUnknown_020387B3] > minMaxArray[MULTI_DIM_ARR(gUnknown_020387B3, B_16, MAX)])
        gUnknown_020387B4[gUnknown_020387B3] = minMaxArray[MULTI_DIM_ARR(gUnknown_020387B3, B_16, MIN)];

    if(gUnknown_020387B4[gUnknown_020387B3] < minMaxArray[MULTI_DIM_ARR(gUnknown_020387B3, B_16, MIN)])
        gUnknown_020387B4[gUnknown_020387B3] = minMaxArray[MULTI_DIM_ARR(gUnknown_020387B3, B_16, MAX)];
}

void sub_80BAD5C(void)
{
    sub_80BAE78(gUnknown_020387B4[CRY_TEST_UNK0] + 1, 0xB, 0x1, 0x5);
    sub_80BAE78(gUnknown_020387B4[CRY_TEST_VOLUME], 0xB, 0x3, 0x5);
    sub_80BAE78(gUnknown_020387B4[CRY_TEST_PANPOT], 0xB, 0x5, 0x5);
    sub_80BAE78(gUnknown_020387B4[CRY_TEST_PITCH], 0xB, 0x7, 0x5);
    sub_80BAE78(gUnknown_020387B4[CRY_TEST_LENGTH], 0xB, 0x9, 0x5);
    sub_80BAE78(gUnknown_020387B4[CRY_TEST_RELEASE], 0xB, 0xB, 0x5);
    sub_80BAE78(gUnknown_020387B4[CRY_TEST_PROGRESS], 0xB, 0xD, 0x5);
    sub_80BAE78(gUnknown_020387B4[CRY_TEST_CHORUS], 0xB, 0xF, 0x5);
    sub_80BAE78(gUnknown_020387B4[CRY_TEST_PRIORITY], 0xB, 0x11, 0x5);
    sub_80BAE78(gUnknown_020387B1, 0x1B, 0x10, 0x1);
    sub_80BAE78(gUnknown_020387D8, 0x1B, 0xE, 0x1);
    sub_80BAE78(gUnknown_020387D9, 0x1B, 0xC, 0x1);
}

void sub_80BAE10(u8 var1, u8 var2)
{
    u8 str1[2];
    u8 str2[2];

    memcpy(str1, gUnknown_083D03DC, sizeof str1);
    memcpy(str2, gUnknown_083D03DE, sizeof str2);

    MenuPrint(str2, gUnknown_083D0300[MULTI_DIM_ARR(var1, B_16, 0)], gUnknown_083D0300[MULTI_DIM_ARR(var1, B_16, 1)]);
    MenuPrint(str1, gUnknown_083D0300[MULTI_DIM_ARR(var2, B_16, 0)], gUnknown_083D0300[MULTI_DIM_ARR(var2, B_16, 1)]);
}

/*void sub_80BAE78(int var1, u16 var2, u16 var3, u8 var4)
{
    u32 powers[6];
    u8 str[8];
    u8 i;
    u8 someVar, someVar2;

    memcpy(powers, gUnknown_083D03E0, sizeof powers);

    for(i = 0; i < var4; i++)
        str[i] = 0;

    str[var4 + 1] = 0xFF;
    someVar = 0;

    if(var1 < 0) // make absolute value? wtf
    {
        var1 = -var1; // just use abs?
        someVar = 1;
    }

    // _080BAED6
    someVar2 = 0;
    if(var4 == 1)
        someVar2 = 1;

    // _080BAEE2
    for(;;)
    {
        
    }
}*/

// no.
__attribute__((naked))
void sub_80BAE78(int var1, u16 var2, u16 var3, u8 var4)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x2C\n\
    mov r8, r0\n\
    lsls r1, 16\n\
    lsrs r6, r1, 16\n\
    lsls r2, 16\n\
    lsrs r2, 16\n\
    lsls r3, 24\n\
    lsrs r7, r3, 24\n\
    mov r1, sp\n\
    ldr r0, _080BAF80 @ =gUnknown_083D03E0\n\
    ldm r0!, {r3-r5}\n\
    stm r1!, {r3-r5}\n\
    ldm r0!, {r3-r5}\n\
    stm r1!, {r3-r5}\n\
    movs r5, 0\n\
    add r0, sp, 0x18\n\
    mov r9, r0\n\
    cmp r5, r7\n\
    bgt _080BAEC0\n\
    mov r4, r9\n\
    movs r3, 0\n\
_080BAEAC:\n\
    lsls r0, r5, 24\n\
    asrs r0, 24\n\
    adds r1, r4, r0\n\
    strb r3, [r1]\n\
    adds r0, 0x1\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    asrs r0, 24\n\
    cmp r0, r7\n\
    ble _080BAEAC\n\
_080BAEC0:\n\
    adds r0, r7, 0x1\n\
    add r0, r9\n\
    movs r1, 0xFF\n\
    strb r1, [r0]\n\
    movs r1, 0\n\
    mov r3, r8\n\
    cmp r3, 0\n\
    bge _080BAED6\n\
    negs r3, r3\n\
    mov r8, r3\n\
    movs r1, 0x1\n\
_080BAED6:\n\
    movs r4, 0\n\
    mov r10, r4\n\
    cmp r7, 0x1\n\
    bne _080BAEE2\n\
    movs r5, 0x1\n\
    mov r10, r5\n\
_080BAEE2:\n\
    subs r0, r7, 0x1\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    lsls r0, r5, 24\n\
    lsls r6, 24\n\
    str r6, [sp, 0x24]\n\
    lsls r2, 24\n\
    str r2, [sp, 0x28]\n\
    cmp r0, 0\n\
    blt _080BAF62\n\
    str r1, [sp, 0x20]\n\
_080BAEF8:\n\
    asrs r6, r0, 24\n\
    lsls r0, r6, 2\n\
    add r0, sp\n\
    ldr r1, [r0]\n\
    mov r0, r8\n\
    bl __divsi3\n\
    lsls r0, 24\n\
    lsrs r2, r0, 24\n\
    cmp r0, 0\n\
    bne _080BAF1A\n\
    mov r0, r10\n\
    cmp r0, 0\n\
    bne _080BAF1A\n\
    lsls r4, r5, 24\n\
    cmp r6, 0\n\
    bne _080BAF46\n\
_080BAF1A:\n\
    lsls r4, r5, 24\n\
    ldr r3, [sp, 0x20]\n\
    cmp r3, 0\n\
    beq _080BAF34\n\
    mov r5, r10\n\
    cmp r5, 0\n\
    bne _080BAF34\n\
    asrs r0, r4, 24\n\
    subs r0, r7, r0\n\
    subs r0, 0x1\n\
    add r0, r9\n\
    movs r1, 0xAE\n\
    strb r1, [r0]\n\
_080BAF34:\n\
    asrs r1, r4, 24\n\
    subs r1, r7, r1\n\
    add r1, r9\n\
    lsls r0, r2, 24\n\
    asrs r0, 24\n\
    subs r0, 0x5F\n\
    strb r0, [r1]\n\
    movs r0, 0x1\n\
    mov r10, r0\n\
_080BAF46:\n\
    asrs r4, 24\n\
    lsls r0, r4, 2\n\
    add r0, sp\n\
    ldr r1, [r0]\n\
    mov r0, r8\n\
    bl __modsi3\n\
    mov r8, r0\n\
    subs r4, 0x1\n\
    lsls r4, 24\n\
    lsrs r5, r4, 24\n\
    lsls r0, r5, 24\n\
    cmp r0, 0\n\
    bge _080BAEF8\n\
_080BAF62:\n\
    ldr r3, [sp, 0x24]\n\
    lsrs r1, r3, 24\n\
    ldr r4, [sp, 0x28]\n\
    lsrs r2, r4, 24\n\
    mov r0, r9\n\
    bl MenuPrint\n\
    add sp, 0x2C\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080BAF80: .4byte gUnknown_083D03E0\n\
    .syntax divided");
}

void sub_80BAF84(u8 taskId)
{
    u8 seStr[3];
    u8 panStr[4];
    u8 playingStr[9];

    memcpy(seStr, gOtherText_SE, sizeof seStr);
    memcpy(panStr, gOtherText_Pan, sizeof panStr);
    memcpy(playingStr, gDebugText_Playing, sizeof playingStr);

    REG_DISPCNT = 0x3140;
    MenuDrawTextWindow(0, 0, 0x1D, 0x13);
    MenuPrint(seStr, 3, 2);
    MenuPrint(panStr, 3, 4);
    MenuPrint(playingStr, 3, 8);
    REG_WIN0H = 0xF0;
    REG_WIN0V = 0xA0;
    gUnknown_020387B4[CRY_TEST_UNK0] = 1;
    gUnknown_020387B4[CRY_TEST_PANPOT] = 0;
    gUnknown_020387B4[CRY_TEST_CHORUS] = 0;
    gUnknown_020387B4[CRY_TEST_PROGRESS] = 0;
    gUnknown_020387B4[CRY_TEST_RELEASE] = 0;
    sub_80BB1D4();
    TASK.FUNC = sub_80BB038;
}

void sub_80BB038(u8 taskId)
{
    sub_80BB1D4();
    if(gUnknown_020387B4[CRY_TEST_PROGRESS])
    {
        if(gUnknown_020387B4[CRY_TEST_RELEASE])
        {
            gUnknown_020387B4[CRY_TEST_RELEASE]--;
        }
        else // _080BB05C
        {
            s8 panpot = gUnknown_083D03F8[gUnknown_020387B4[CRY_TEST_PANPOT]];
            if(panpot != -128)
            {
                if(panpot == 0x7F)
                {
                    gUnknown_020387B4[CRY_TEST_CHORUS] += 2;
                    if(gUnknown_020387B4[CRY_TEST_CHORUS] < 0x3F)
                        SE12PanpotControl(gUnknown_020387B4[CRY_TEST_CHORUS]);
                }
            }
            else // _080BB08C
            {
                gUnknown_020387B4[CRY_TEST_CHORUS] -= 2;
                if(gUnknown_020387B4[CRY_TEST_CHORUS] > -0x40)
                    SE12PanpotControl(gUnknown_020387B4[CRY_TEST_CHORUS]);
            }
        }
    }
     // _080BB0A2
    if(gMain.newKeys & 0x2)
    {
        REG_DISPCNT = 0x7140;
        REG_WIN0H = 0x11DF;
        REG_WIN0V = 0x11F;
        MenuZeroFillWindowRect(0, 0, 0x1D, 0x13);
        TASK.FUNC = sub_80BA258;
        return;
    }
    if(gMain.newKeys & 0x1) // _080BB104
    {
        s8 panpot = gUnknown_083D03F8[gUnknown_020387B4[CRY_TEST_PANPOT]];
        if(panpot != -128)
        {
            if(panpot == 0x7F)
            {
                PlaySE12WithPanning(gUnknown_020387B4[CRY_TEST_UNK0], -0x40);
                gUnknown_020387B4[CRY_TEST_CHORUS] = -0x40;
                gUnknown_020387B4[CRY_TEST_PROGRESS] = 1;
                gUnknown_020387B4[CRY_TEST_RELEASE] = 0x1E;
                return;
            }
        }
        else // _080BB140
        {
            PlaySE12WithPanning(gUnknown_020387B4[CRY_TEST_UNK0], 0x3F);
            gUnknown_020387B4[CRY_TEST_CHORUS] = 0x3F;
            gUnknown_020387B4[CRY_TEST_PROGRESS] = 1;
            gUnknown_020387B4[CRY_TEST_RELEASE] = 0x1E;
            return;
        }
        // _080BB154
        PlaySE12WithPanning(gUnknown_020387B4[CRY_TEST_UNK0], panpot);
        gUnknown_020387B4[CRY_TEST_PROGRESS] = 0;
        return;
    }
    if(gMain.newKeys & 0x200) // _080BB15E
    {
        gUnknown_020387B4[CRY_TEST_PANPOT]++;
        if(gUnknown_020387B4[CRY_TEST_PANPOT] > 4)
            gUnknown_020387B4[CRY_TEST_PANPOT] = 0;
    }
    if(gMain.newKeys & 0x100) // _080BB176
    {
        gUnknown_020387B4[CRY_TEST_PANPOT]--;
        if(gUnknown_020387B4[CRY_TEST_PANPOT] < 0)
            gUnknown_020387B4[CRY_TEST_PANPOT] = 4;
    }
    if(gMain.newAndRepeatedKeys & 0x10) // _080BB192
    {
        gUnknown_020387B4[CRY_TEST_UNK0]++;
        if(gUnknown_020387B4[CRY_TEST_UNK0] > 0xF7)
            gUnknown_020387B4[CRY_TEST_UNK0] = 0;
    }
    else if(gMain.newAndRepeatedKeys & 0x20) // _080BB1B0
    {
        gUnknown_020387B4[CRY_TEST_UNK0]--;
        if(gUnknown_020387B4[CRY_TEST_UNK0] < 0)
            gUnknown_020387B4[CRY_TEST_UNK0] = 0xF7;
    }
}

void sub_80BB1D4(void)
{
    u8 lrStr[5];
    u8 rlStr[5];

    memcpy(lrStr, gOtherText_LR, sizeof lrStr);
    memcpy(rlStr, gOtherText_RL, sizeof rlStr);

    sub_80BAE78(gUnknown_020387B4[CRY_TEST_UNK0], 7, 2, 3);

    switch(gUnknown_083D03F8[gUnknown_020387B4[CRY_TEST_PANPOT]])
    {
        case 0x7F:
            MenuPrint(lrStr, 7, 4);
            break;
        case -0x80:
            MenuPrint(rlStr, 7, 4);
            break;
        default:
            sub_80BAE78(gUnknown_083D03F8[gUnknown_020387B4[CRY_TEST_PANPOT]], 7, 4, 3);
            break;
    }
    sub_80BAE78(IsSEPlaying(), 12, 8, 1);
}

void sub_80BB25C(u8 taskId)
{
    struct CryRelatedStruct cryStruct, cryStruct2;
    u8 zero;

    SetUpWindowConfig(&gWindowConfig_81E6C3C);
    InitMenuWindow(&gWindowConfig_81E6CE4);
    gUnknown_03005D34 = 1;
    ResetSpriteData();
    FreeAllSpritePalettes();

    cryStruct.unk0 = 0x2000;
    cryStruct.unk2 = 29;
    cryStruct.paletteNo = 12;
    cryStruct.yPos = 30;
    cryStruct.xPos = 4;

    zero = 0; // wtf?
    gUnknown_03005E98 = 0;

    while(sub_8119E3C(&cryStruct, 3) == FALSE);

    cryStruct2.unk0 = 0;
    cryStruct2.unk2 = 15;
    cryStruct2.paletteNo = 13;
    cryStruct2.xPos = 12;
    cryStruct2.yPos = 12;

    zero = 0; // wtf?
    gUnknown_03005E98 = 0;

    while(ShowPokedexCryScreen(&cryStruct2, 2) == FALSE);

    MenuDrawTextWindow(0, 16, 5, 19);
    sub_80BB494();
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG2CNT = 0xF01;
    REG_BG3CNT = 0x1D03;
    REG_DISPCNT = 0x1d40;
    m4aMPlayFadeOutTemporarily(&gMPlay_BGM, 2);
    TASK.FUNC = sub_80BB3B4;
}

void sub_80BB3B4(u8 taskId)
{
    sub_8119F88(3);

    if(gMain.newKeys & 0x1)
    {
        sub_811A050(gUnknown_03005D34);
    }
    if(gMain.newKeys & 0x100)
    {
        StopCryAndClearCrySongs();
    }
    if(gMain.newAndRepeatedKeys & 0x40)
    {
        if(--gUnknown_03005D34 == 0)
            gUnknown_03005D34 = 384; // total species
        sub_80BB494();
    }
    if(gMain.newAndRepeatedKeys & 0x80)
    {
        if(++gUnknown_03005D34 > 384)
            gUnknown_03005D34 = 1;
        sub_80BB494();
    }
    if(gMain.newKeys & 0x2)
    {
        REG_DISPCNT = 0x7140;
        REG_WIN0H = 0x11DF;
        REG_WIN0V = 0x11F;
        MenuZeroFillWindowRect(0, 0, 0x1D, 0x13);
        TASK.FUNC = sub_80BA258;
        DestroyCryMeterNeedleSprite();
    }
}

void sub_80BB494(void)
{
    sub_80BAE78(gUnknown_03005D34, 1, 17, 3);
}
