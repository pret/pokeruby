#if DEBUG
#include "global.h"
#include "constants/songs.h"
#include "overworld.h"
#include "menu.h"
#include "start_menu.h"
#include "main.h"
#include "sound.h"

// These should be static, uninitialized once it gets decompiled.
#define BSS_DATA __attribute__((section(".bss")))
BSS_DATA u16 gDebug_03000700 = 0;
BSS_DATA u32 gDebug_03000704 = 0;
BSS_DATA u32 gDebug_03000708 = 0;
BSS_DATA u8 gDebug_0300070C = 0;
BSS_DATA u8 gDebug_0300070D = 0;
BSS_DATA u8 gDebug_0300070E = 0;
BSS_DATA u8 gDebug_0300070F = 0;
BSS_DATA u8 gDebug_03000710[13] = {0};
BSS_DATA u8 gDebug_0300071D = 0;
BSS_DATA u8 gDebug_0300071E = 0;
BSS_DATA u8 gDebug_0300071F = 0;
BSS_DATA u8 gDebug_03000720 = 0;
BSS_DATA u8 gDebug_03000721 = 0;

bool8 debug_sub_808B874(void);
bool8 debug_sub_808B8C8(void);
bool8 TomomichiDebugMenu_ContestGraphics(void);
bool8 TomomichiDebugMenu_ArtMusGraphics(void);
bool8 TomomichiDebugMenu_PreviewData(void);
bool8 TomomichiDebugMenu_TrickHouse(void);
bool8 TomomichiDebugMenu_ControlEvents(void);
bool8 TomomichiDebugMenu_ControlFlags(void);
bool8 TomomichiDebugMenu_ControlWorks(void);
bool8 TomomichiDebugMenu_Config(void);
bool8 TomomichiDebugMenu_ContestGraphics_Show(void);
bool8 debug_sub_808BC48(void);
bool8 debug_sub_808BCBC(void);
bool8 TomomichiDebugMenu_MuseumGraphics_Show(void);
bool8 debug_sub_808BD30(void);
bool8 debug_sub_808BDA4(void);
bool8 debug_sub_808BE2C(void);
bool8 debug_sub_808BEB4(void);
bool8 debug_sub_808BF3C(void);
bool8 debug_sub_808ECA4(void);
bool8 debug_sub_808EB58(void);
bool8 debug_sub_808EBB4(void);
bool8 debug_sub_808BFC4(void);
bool8 debug_sub_808C014(void);
bool8 debug_sub_808C31C(void);
bool8 debug_sub_808C7C8(void);
bool8 debug_sub_808CC74(void);
bool8 debug_sub_808CF10(void);
bool8 debug_sub_808D844(void);
bool8 debug_sub_808D600(void);
bool8 debug_sub_808D3BC(void);
bool8 debug_sub_808DB0C(void);
bool8 debug_sub_808E36C(void);
bool8 debug_sub_808E6C0(void);
bool8 debug_sub_808E90C(void);
bool8 debug_sub_808DA30(void);
bool8 debug_sub_808DFC0(void);
void debug_sub_808ED0C(void);
void debug_sub_808ED9C(void);
void debug_sub_808EE3C(void);
void debug_sub_808EE9C(void);
void debug_sub_808EF14(void);
void debug_sub_808EF8C(u32 a0);
bool8 debug_sub_808C064(void);
bool8 debug_sub_808C0EC(void);
bool8 debug_sub_808C104(void);
bool8 debug_sub_808C11C(void);
bool8 debug_sub_808C134(void);
bool8 debug_sub_808C14C(void);
bool8 debug_sub_808C164(void);
bool8 debug_sub_808C17C(void);
bool8 debug_sub_808C194(void);
bool8 debug_sub_808C1AC(void);
bool8 debug_sub_808C0A8(void);
bool8 debug_sub_808C1C4(void);
bool8 debug_sub_808C1DC(void);
bool8 debug_sub_808C1F4(void);
bool8 debug_sub_808C20C(void);
bool8 debug_sub_808C224(void);
bool8 debug_sub_808C23C(void);
bool8 debug_sub_808D450(void);
bool8 debug_sub_808D4A8(void);
bool8 debug_sub_808D694(void);
bool8 debug_sub_808D6EC(void);
bool8 debug_sub_808CFA4(void);
bool8 debug_sub_808CFFC(void);
bool8 debug_sub_808D054(void);
bool8 debug_sub_808D0AC(void);
bool8 debug_sub_808D104(void);
bool8 debug_sub_808D15C(void);
bool8 debug_sub_808D1B4(void);
bool8 debug_sub_808D20C(void);
bool8 debug_sub_808D264(void);

const u8 gUnknown_Debug_083C0C54[] = _("Contest graphics");
const u8 gUnknown_Debug_083C0C65[] = _("Art Mus. graphics");
const u8 gUnknown_Debug_083C0C77[] = _("Preview data");
const u8 gUnknown_Debug_083C0C84[] = _("TRICK HOUSE");
const u8 gUnknown_Debug_083C0C90[] = _("Control events");
const u8 gUnknown_Debug_083C0C9F[] = _("Control flags");
const u8 gUnknown_Debug_083C0CAD[] = _("Control WORK");

const struct MenuAction gUnknown_Debug_083C0CBA[] = {
    {gUnknown_Debug_083C0C54, TomomichiDebugMenu_ContestGraphics},
    {gUnknown_Debug_083C0C65, TomomichiDebugMenu_ArtMusGraphics},
    {gUnknown_Debug_083C0C77, TomomichiDebugMenu_PreviewData},
    {gUnknown_Debug_083C0C84, TomomichiDebugMenu_TrickHouse},
    {gUnknown_Debug_083C0C90, TomomichiDebugMenu_ControlEvents},
    {gUnknown_Debug_083C0C9F, TomomichiDebugMenu_ControlFlags},
    {gUnknown_Debug_083C0CAD, TomomichiDebugMenu_ControlWorks},
};

const u8 gUnknown_Debug_083C0CF4[] = _("Contest");

const u8 gUnknown_Debug_083C0CFC[] = _("Pokémon No.");
const u8 gUnknown_Debug_083C0D08[] = _("ID rnd. digit");
const u8 gUnknown_Debug_083C0D16[] = _("Contest Type");
const u8 gUnknown_Debug_083C0D23[] = _("Poké Art");

const struct MenuAction gUnknown_Debug_083C0D2C[] = {
    {gUnknown_Debug_083C0CFC, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C0D08, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C0D16, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C0D23, TomomichiDebugMenu_ContestGraphics_Show}
};

const u8 gUnknown_Debug_083C0D4C[] = _("Art Mus.");
const u8 gUnknown_Debug_083C0D55[] = _("Pokémon No.");
const u8 gUnknown_Debug_083C0D61[] = _("ID rnd. digit");
const u8 gUnknown_Debug_083C0D6F[] = _("Title Type");
const u8 gUnknown_Debug_083C0D7A[] = _("Poké Art");

const struct MenuAction gUnknown_Debug_083C0D83[] = {
    {gUnknown_Debug_083C0D55, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C0D61, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C0D6F, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C0D7A, TomomichiDebugMenu_MuseumGraphics_Show}
};

const u8 gUnknown_Debug_083C0DA4[] = _("Preview");

const u8 gUnknown_Debug_083C0DAC[] = _("Pokémon No.");
const u8 gUnknown_Debug_083C0DB8[] = _("ID rnd. digit");
const u8 gUnknown_Debug_083C0DC6[] = _("Type");
const u8 gUnknown_Debug_083C0DCB[] = _("Poké Art");

const struct MenuAction gUnknown_Debug_083C0DD4[] = {
    {gUnknown_Debug_083C0DAC, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C0DB8, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C0DC6, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C0DCB, debug_sub_808ECA4}
};

const u8 gUnknown_Debug_083C0DF4[] = _("Trick related");

const u8 gUnknown_Debug_083C0E02[] = _("Level");
const u8 gUnknown_Debug_083C0E08[] = _("Trick Master");

const struct MenuAction gUnknown_Debug_083C0E15[] = {
    {gUnknown_Debug_083C0E02, debug_sub_808EB58},
    {gUnknown_Debug_083C0E08, debug_sub_808EBB4}
};

const u8 gUnknown_Debug_083C0E28[] = _("パート1");
const u8 gUnknown_Debug_083C0E2D[] = _("パート2");

const struct MenuAction gUnknown_Debug_083C0E32[] = {
    {gUnknown_Debug_083C0E28, debug_sub_808BFC4},
    {gUnknown_Debug_083C0E2D, debug_sub_808C014}
};

const u8 gUnknown_Debug_083C0E44[] = _("イベントFLAG");
const u8 gUnknown_Debug_083C0E4D[] = _("バニシュFLAG");
const u8 gUnknown_Debug_083C0E56[] = _("トレーナーFLAG");
const u8 gUnknown_Debug_083C0E60[] = _("SYSFLAG");
const u8 gUnknown_Debug_083C0E68[] = _("BALLバニシュFLAG");
const u8 gUnknown_Debug_083C0E75[] = _("FH");
const u8 gUnknown_Debug_083C0E78[] = _("FH-OBJ");

const struct MenuAction gUnknown_Debug_083C0E7F[] = {
    {gUnknown_Debug_083C0E44, debug_sub_808C31C},
    {gUnknown_Debug_083C0E4D, debug_sub_808C7C8},
    {gUnknown_Debug_083C0E56, debug_sub_808CC74},
    {gUnknown_Debug_083C0E60, debug_sub_808CF10},
    {gUnknown_Debug_083C0E68, debug_sub_808D844},
    {gUnknown_Debug_083C0E75, debug_sub_808D600},
    {gUnknown_Debug_083C0E78, debug_sub_808D3BC}
};

const u8 gUnknown_Debug_083C0EB8[] = _("SAVEWORK");

const u8 gUnknown_Debug_083C0EC1[] = _("SYSWORK");
const u8 gUnknown_Debug_083C0EC9[] = _("LOCALWORK");
const u8 gUnknown_Debug_083C0ED3[] = _("OBJWORK");
const u8 gUnknown_Debug_083C0EDB[] = _("ANSWORK");
const u8 gUnknown_Debug_083C0EE3[] = _("SAVEWORK　パート2");

const struct MenuAction gUnknown_Debug_083C0EF1[] = {
    {gUnknown_Debug_083C0EB8, debug_sub_808DB0C},
    {gUnknown_Debug_083C0EC1, debug_sub_808E36C},
    {gUnknown_Debug_083C0EC9, debug_sub_808E6C0},
    {gUnknown_Debug_083C0ED3, debug_sub_808E90C},
    {gUnknown_Debug_083C0EDB, debug_sub_808DA30},
    {gUnknown_Debug_083C0EE3, debug_sub_808DFC0}
};

const u8 gUnknown_Debug_083C0F24[] = _("クリアご");
const u8 gUnknown_Debug_083C0F29[] = _("コインこうにゅうかのう");
const u8 gUnknown_Debug_083C0F35[] = _("コトキサポーターセット");
const u8 gUnknown_Debug_083C0F41[] = _("ニューキンセツOPEN");
const u8 gUnknown_Debug_083C0F4D[] = _("れんらくせんにのれる");
const u8 gUnknown_Debug_083C0F58[] = _("タマゴついか");
const u8 gUnknown_Debug_083C0F5F[] = _("アイテムいっぱい");
const u8 gUnknown_Debug_083C0F68[] = _("グッズいっぱい");
const u8 gUnknown_Debug_083C0F70[] = _("COINいっぱい");

const struct MenuAction gUnknown_Debug_083C0F79[] = {
    {gUnknown_Debug_083C0F24, debug_sub_808C0EC},
    {gUnknown_Debug_083C0F29, debug_sub_808C104},
    {gUnknown_Debug_083C0F35, debug_sub_808C11C},
    {gUnknown_Debug_083C0F41, debug_sub_808C134},
    {gUnknown_Debug_083C0F4D, debug_sub_808C14C},
    {gUnknown_Debug_083C0F58, debug_sub_808C164},
    {gUnknown_Debug_083C0F5F, debug_sub_808C17C},
    {gUnknown_Debug_083C0F68, debug_sub_808C194},
    {gUnknown_Debug_083C0F70, debug_sub_808C1AC}
};

const u8 gUnknown_Debug_083C0FC4[] = _("ムロジムOPEN");
const u8 gUnknown_Debug_083C0FCD[] = _("おかねを0へ");
const u8 gUnknown_Debug_083C0FD4[] = _("ドジョッチ　FULL");
const u8 gUnknown_Debug_083C0FDF[] = _("キノココ　FULL");
const u8 gUnknown_Debug_083C0FE9[] = _("ドジョッチ　タマゴ");
const u8 gUnknown_Debug_083C0FF3[] = _("キノココ　タマゴ");

const struct MenuAction gUnknown_Debug_083C0FFC[] = {
    {gUnknown_Debug_083C0FC4, debug_sub_808C1C4},
    {gUnknown_Debug_083C0FCD, debug_sub_808C1DC},
    {gUnknown_Debug_083C0FD4, debug_sub_808C1F4},
    {gUnknown_Debug_083C0FDF, debug_sub_808C20C},
    {gUnknown_Debug_083C0FE9, debug_sub_808C224},
    {gUnknown_Debug_083C0FF3, debug_sub_808C23C}
};

const u8 gUnknown_Debug_083C102C[] = _("ANSWORK　みかんせい");

const struct MenuAction gUnknown_Debug_083C103A[] = {
    {gUnknown_Debug_083C102C, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C1044[] = _("FHーOBJ00ー08");
const u8 gUnknown_Debug_083C1050[] = _("FHーOBJ09ー15");

const struct MenuAction gUnknown_Debug_083C105C[] = {
    {gUnknown_Debug_083C1044, debug_sub_808D450},
    {gUnknown_Debug_083C1050, debug_sub_808D4A8}
};

const u8 gUnknown_Debug_083C106C[] = _("FHーOBJ00");
const u8 gUnknown_Debug_083C1075[] = _("FHーOBJ01");
const u8 gUnknown_Debug_083C107E[] = _("FHーOBJ02");
const u8 gUnknown_Debug_083C1087[] = _("FHーOBJ03");
const u8 gUnknown_Debug_083C1090[] = _("FHーOBJ04");
const u8 gUnknown_Debug_083C1099[] = _("FHーOBJ05");
const u8 gUnknown_Debug_083C10A2[] = _("FHーOBJ06");
const u8 gUnknown_Debug_083C10AB[] = _("FHーOBJ07");
const u8 gUnknown_Debug_083C10B4[] = _("FHーOBJ08");

const struct MenuAction gUnknown_Debug_083C10BD[] = {
    {gUnknown_Debug_083C106C, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1075, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C107E, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1087, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1090, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1099, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C10A2, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C10AB, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C10B4, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C1108[] = _("FH-OBJ09");
const u8 gUnknown_Debug_083C1111[] = _("FH-OBJ10");
const u8 gUnknown_Debug_083C111A[] = _("FH-OBJ11");
const u8 gUnknown_Debug_083C1123[] = _("FH-OBJ12");
const u8 gUnknown_Debug_083C112C[] = _("FH-OBJ13");
const u8 gUnknown_Debug_083C1135[] = _("FH-OBJ14");
const u8 gUnknown_Debug_083C113E[] = _("FH-OBJ15");
const u8 gUnknown_Debug_083C1147[] = _("");
const u8 gUnknown_Debug_083C1148[] = _("");

const struct MenuAction gUnknown_Debug_083C1149[] = {
    {gUnknown_Debug_083C1108, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1111, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C111A, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1123, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C112C, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1135, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C113E, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1147, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1148, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C1194[] = {9, 7};

const u16 gUnknown_Debug_083C1196[] = {0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f, 0x20, 0x00, 0x00};

const u8 gUnknown_Debug_083C11BA[] = _("FH-00-08");
const u8 gUnknown_Debug_083C11C3[] = _("FH-09-15");

const struct MenuAction gUnknown_Debug_083C11CC[] = {
    {gUnknown_Debug_083C11BA, debug_sub_808D694},
    {gUnknown_Debug_083C11C3, debug_sub_808D6EC}
};

const u8 gUnknown_Debug_083C11DC[] = _("FH-00");
const u8 gUnknown_Debug_083C11E2[] = _("FH-01");
const u8 gUnknown_Debug_083C11E8[] = _("FH-02");
const u8 gUnknown_Debug_083C11EE[] = _("FH-03");
const u8 gUnknown_Debug_083C11F4[] = _("FH-04");
const u8 gUnknown_Debug_083C11FA[] = _("FH-05");
const u8 gUnknown_Debug_083C1200[] = _("FH-06");
const u8 gUnknown_Debug_083C1206[] = _("FH-07");
const u8 gUnknown_Debug_083C120C[] = _("FH-08");

const struct MenuAction gUnknown_Debug_083C1212[] = {
    {gUnknown_Debug_083C11DC, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C11E2, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C11E8, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C11EE, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C11F4, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C11FA, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1200, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1206, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C120C, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C125C[] = _("FHー09");
const u8 gUnknown_Debug_083C1262[] = _("FHー10");
const u8 gUnknown_Debug_083C1268[] = _("FHー11");
const u8 gUnknown_Debug_083C126E[] = _("FHー12");
const u8 gUnknown_Debug_083C1274[] = _("FHー13");
const u8 gUnknown_Debug_083C127A[] = _("FHー14");
const u8 gUnknown_Debug_083C1280[] = _("FHー15");
const u8 gUnknown_Debug_083C1286[] = _("");
const u8 gUnknown_Debug_083C1287[] = _("");

const struct MenuAction gUnknown_Debug_083C1288[] = {
    {gUnknown_Debug_083C125C, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1262, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1268, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C126E, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1274, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C127A, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1280, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1286, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1287, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C12D0[] = {9, 7};

const u16 gUnknown_Debug_083C12D2[] = {0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x00, 0x00};

const u8 gUnknown_Debug_083C12F6[] = _("BATCH");

const u8 gUnknown_Debug_083C12FC[] = _("タウンとうちゃく");

const u8 gUnknown_Debug_083C1305[] = _("シティとうちゃく");

const u8 gUnknown_Debug_083C130E[] = _("GET");

const u8 gUnknown_Debug_083C1312[] = _("そのた1");

const u8 gUnknown_Debug_083C1317[] = _("そのた2");

const u8 gUnknown_Debug_083C131C[] = _("そのた3");

const u8 gUnknown_Debug_083C1321[] = _("そのた4");

const u8 gUnknown_Debug_083C1326[] = _("そのた　とうちゃく");

const struct MenuAction gUnknown_Debug_083C1330[] = {
    {gUnknown_Debug_083C12F6, debug_sub_808CFA4},
    {gUnknown_Debug_083C12FC, debug_sub_808CFFC},
    {gUnknown_Debug_083C1305, debug_sub_808D054},
    {gUnknown_Debug_083C130E, debug_sub_808D0AC},
    {gUnknown_Debug_083C1312, debug_sub_808D104},
    {gUnknown_Debug_083C1317, debug_sub_808D15C},
    {gUnknown_Debug_083C131C, debug_sub_808D1B4},
    {gUnknown_Debug_083C1321, debug_sub_808D20C},
    {gUnknown_Debug_083C1326, debug_sub_808D264}
};

const u8 gUnknown_Debug_083C1378[] = _("BATCH01ーGET");

const u8 gUnknown_Debug_083C1384[] = _("BATCH02ーGET");

const u8 gUnknown_Debug_083C1390[] = _("BATCH03ーGET");

const u8 gUnknown_Debug_083C139C[] = _("BATCH04ーGET");

const u8 gUnknown_Debug_083C13A8[] = _("BATCH05ーGET");

const u8 gUnknown_Debug_083C13B4[] = _("BATCH06ーGET");

const u8 gUnknown_Debug_083C13C0[] = _("BATCH07ーGET");

const u8 gUnknown_Debug_083C13CC[] = _("BATCH08ーGET");

const struct MenuAction gUnknown_Debug_083C13D8[] = {
    {gUnknown_Debug_083C1378, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1384, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1390, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C139C, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C13A8, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C13B4, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C13C0, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C13CC, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C1418[] = _("T101ARRIVE");

const u8 gUnknown_Debug_083C1423[] = _("T102ARRIVE");

const u8 gUnknown_Debug_083C142E[] = _("T103ARRIVE");

const u8 gUnknown_Debug_083C1439[] = _("T104ARRIVE");

const u8 gUnknown_Debug_083C1444[] = _("T105ARRIVE");

const u8 gUnknown_Debug_083C144F[] = _("T106ARRIVE");

const u8 gUnknown_Debug_083C145A[] = _("T107ARRIVE");

const struct MenuAction gUnknown_Debug_083C1465[] = {
    {gUnknown_Debug_083C1418, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1423, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C142E, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1439, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1444, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C144F, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C145A, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C14A0[] = _("C101ARRIVE");

const u8 gUnknown_Debug_083C14AB[] = _("C102ARRIVE");

const u8 gUnknown_Debug_083C14B6[] = _("C103ARRIVE");

const u8 gUnknown_Debug_083C14C1[] = _("C104ARRIVE");

const u8 gUnknown_Debug_083C14CC[] = _("C105ARRIVE");

const u8 gUnknown_Debug_083C14D7[] = _("C106ARRIVE");

const u8 gUnknown_Debug_083C14E2[] = _("C107ARRIVE");

const u8 gUnknown_Debug_083C14ED[] = _("C108ARRIVE");

const u8 gUnknown_Debug_083C14F8[] = _("C109ARRIVE");

const struct MenuAction gUnknown_Debug_083C1503[] = {
    {gUnknown_Debug_083C14A0, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C14AB, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C14B6, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C14C1, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C14CC, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C14D7, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C14E2, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C14ED, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C14F8, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C154C[] = _("SYSーPOKEMONーGET");

const u8 gUnknown_Debug_083C155C[] = _("SYSーZUKANーGET");

const u8 gUnknown_Debug_083C156A[] = _("SYSーPOKEGEARーGET");

const u8 gUnknown_Debug_083C157B[] = _("SYSーRIBBONーGET");

const struct MenuAction gUnknown_Debug_083C158A[] = {
    {gUnknown_Debug_083C154C, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C155C, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C156A, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C157B, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C15AC[] = _("SYSーGAMEーCLEAR");

const u8 gUnknown_Debug_083C15BB[] = _("SYSーKAIWAーUSED");

const u8 gUnknown_Debug_083C15CA[] = _("SYSーNOWーOYAJIーMEET");

const u8 gUnknown_Debug_083C15DD[] = _("SYSーUSEーWAZAーFLASH");

const u8 gUnknown_Debug_083C15F0[] = _("SYSーUSEーWAZAーKAIRIKI");

const u8 gUnknown_Debug_083C1605[] = _("SYSーWEATHERーCTRL");

const u8 gUnknown_Debug_083C1616[] = _("SYSーCYCLINGーROAD");

const u8 gUnknown_Debug_083C1627[] = _("SYSーSAFARIーMODE");

const u8 gUnknown_Debug_083C1637[] = _("SYSーCRUISEーMODE");

const struct MenuAction gUnknown_Debug_083C1647[] = {
    {gUnknown_Debug_083C15AC, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C15BB, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C15CA, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C15DD, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C15F0, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1605, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1616, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1627, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1637, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C1690[] = _("SYSーTVーHOME");

const u8 gUnknown_Debug_083C169C[] = _("SYSーTVーWATCH");

const u8 gUnknown_Debug_083C16A9[] = _("SYSーTVSTART");

const u8 gUnknown_Debug_083C16B5[] = _("SYSーPOPWORDーINPUT");

const u8 gUnknown_Debug_083C16C7[] = _("SYSーMIXーRECORD");

const u8 gUnknown_Debug_083C16D6[] = _("SYSーCLOCKーSET");

const u8 gUnknown_Debug_083C16E4[] = _("SYSーCAVEーSHIP");

const u8 gUnknown_Debug_083C16F2[] = _("SYSーCAVEーWONDER");

const u8 gUnknown_Debug_083C1702[] = _("SYSーCAVEーBATTLE");

const struct MenuAction gUnknown_Debug_083C1712[] = {
    {gUnknown_Debug_083C1690, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C169C, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C16A9, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C16B5, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C16C7, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C16D6, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C16E4, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C16F2, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1702, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C175C[] = _("SYSーSPECIALーZUKAN");

const u8 gUnknown_Debug_083C176E[] = _("SYSーASASEーTIDE");

const u8 gUnknown_Debug_083C177D[] = _("SYSーRIBBONーGET");

const u8 gUnknown_Debug_083C178C[] = _("SYSーPASOーMAYUMI");

const u8 gUnknown_Debug_083C179C[] = _("SYSーEXDATAーENABLE");

const u8 gUnknown_Debug_083C17AE[] = _("SYSーTENJIーANAWOHORU");

const u8 gUnknown_Debug_083C17C2[] = _("SYSーTENJIーKAIRIKI");

const u8 gUnknown_Debug_083C17D4[] = _("SYSーTENJIーWAIT");

const u8 gUnknown_Debug_083C17E3[] = _("SYSーTENJIーSORAWOTOBU");

const struct MenuAction gUnknown_Debug_083C17F8[] = {
    {gUnknown_Debug_083C175C, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C176E, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C177D, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C178C, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C179C, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C17AE, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C17C2, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C17D4, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C17E3, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C1840[] = _("SYSーENCーUPーITEM");

const u8 gUnknown_Debug_083C1850[] = _("SYSーENEーDOWNーITEM");

const u8 gUnknown_Debug_083C1862[] = _("SYSーKOKOROーEVENT");

const u8 gUnknown_Debug_083C1873[] = _("SYSーMOVEーPOKEーNEWS");

const u8 gUnknown_Debug_083C1886[] = _("SYSーASASEーITEM");

const u8 gUnknown_Debug_083C1895[] = _("SYSーBーDASH");

const u8 gUnknown_Debug_083C18A0[] = _("SYSーCTRLーOBJーDELETE");

const u8 gUnknown_Debug_083C18B4[] = _("");

const u8 gUnknown_Debug_083C18B5[] = _("");

const struct MenuAction gUnknown_Debug_083C18B8[] = {
    {gUnknown_Debug_083C1840, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1850, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1862, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1873, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1886, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1895, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C18A0, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C18B4, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C18B5, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C1900[] = _("SYSーARRIVEーSUBMARINECAVE");

const u8 gUnknown_Debug_083C1919[] = _("SYSーARRIVEーBATTLETOWER");

const u8 gUnknown_Debug_083C1930[] = _("SYSーARRIVEーISLAND");

const u8 gUnknown_Debug_083C1942[] = _("SYSーARRIVEーLEAGUE");

const u8 gUnknown_Debug_083C1954[] = _("SYSーARRIVEーSORANOHASHIRA");

const u8 gUnknown_Debug_083C196D[] = _("");

const u8 gUnknown_Debug_083C196E[] = _("");

const u8 gUnknown_Debug_083C196F[] = _("");

const u8 gUnknown_Debug_083C1970[] = _("");

const struct MenuAction gDebug_0x83C1974[] = {
    {gUnknown_Debug_083C1900, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1919, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1930, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1942, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1954, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C196D, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C196E, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C196F, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C1970, TomomichiDebugMenu_Config}
};

bool8 InitTomomichiDebugWindow(void)
{
    debug_sub_808B874();
    return FALSE;
}

void debug_sub_808B868(void)
{
    c2_exit_to_overworld_1_continue_scripts_restart_music();
}

bool8 debug_sub_808B874(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 13, 15);
    Menu_PrintItems(1, 1, ARRAY_COUNT(gUnknown_Debug_083C0CBA), gUnknown_Debug_083C0CBA);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C0CBA), gDebug_0300071D, 12);
    gMenuCallback = debug_sub_808B8C8;
    return FALSE;
}

bool8 debug_sub_808B8C8(void)
{
    if (gMain.newKeys & DPAD_UP)
    {
        PlaySE(SE_SELECT);
        gDebug_0300071D = Menu_MoveCursor(-1);
    }
    if (gMain.newKeys & DPAD_DOWN)
    {
        PlaySE(SE_SELECT);
        gDebug_0300071D = Menu_MoveCursor(+1);
    }
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        return gUnknown_Debug_083C0CBA[gDebug_0300071D].func();
    }
    if (gMain.newKeys & (B_BUTTON | START_BUTTON))
    {
        CloseMenu();
        return TRUE;
    }
    return FALSE;
}

bool8 TomomichiDebugMenu_ContestGraphics(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 20, 11);
    Menu_PrintText(gUnknown_Debug_083C0CF4, 1, 1);
    Menu_PrintItems(2, 3, ARRAY_COUNT(gUnknown_Debug_083C0D2C), gUnknown_Debug_083C0D2C);
    InitMenu(0, 1, 3, ARRAY_COUNT(gUnknown_Debug_083C0D2C), 0, 19);
    gMenuCallback = debug_sub_808BC48;
    gDebug_03000700 = 1;
    gDebug_03000704 = 0x6f33;
    gDebug_03000708 = 0;
    gDebug_0300070C = 1;
    return FALSE;
}

bool8 TomomichiDebugMenu_ArtMusGraphics(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 20, 11);
    Menu_PrintText(gUnknown_Debug_083C0D4C, 1, 1);
    Menu_PrintItems(2, 3, ARRAY_COUNT(gUnknown_Debug_083C0D83), gUnknown_Debug_083C0D83);
    InitMenu(0, 1, 3, ARRAY_COUNT(gUnknown_Debug_083C0D83), 0, 19);
    gMenuCallback = debug_sub_808BCBC;
    gDebug_03000700 = 1;
    gDebug_03000704 = 0x6f33;
    gDebug_03000708 = 0;
    gDebug_0300070D = 1;
    return FALSE;
}

bool8 TomomichiDebugMenu_PreviewData(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 20, 11);
    Menu_PrintText(gUnknown_Debug_083C0DA4, 1, 1);
    Menu_PrintItems(2, 3, ARRAY_COUNT(gUnknown_Debug_083C0DD4), gUnknown_Debug_083C0DD4);
    InitMenu(0, 1, 3, ARRAY_COUNT(gUnknown_Debug_083C0DD4), 0, 19);
    gMenuCallback = debug_sub_808BD30;
    gDebug_03000700 = 1;
    gDebug_03000704 = 0x6f33;
    gDebug_03000708 = 0;
    gDebug_0300070E = 1;
    return FALSE;
}

bool8 TomomichiDebugMenu_TrickHouse(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 24, 7);
    Menu_PrintText(gUnknown_Debug_083C0DF4, 1, 1);
    Menu_PrintItems(2, 3, ARRAY_COUNT(gUnknown_Debug_083C0E15), gUnknown_Debug_083C0E15);
    InitMenu(0, 1, 3, ARRAY_COUNT(gUnknown_Debug_083C0E15), gDebug_0300071E, 23);
    gMenuCallback = debug_sub_808BDA4;
    return FALSE;
}

bool8 TomomichiDebugMenu_ControlEvents(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 24, 5);
    Menu_PrintItems(2, 1, ARRAY_COUNT(gUnknown_Debug_083C0E32), gUnknown_Debug_083C0E32);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C0E32), gDebug_0300071F, 23);
    gMenuCallback = debug_sub_808BE2C;
    return FALSE;
}

bool8 TomomichiDebugMenu_ControlFlags(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 24, 15);
    Menu_PrintItems(2, 1, ARRAY_COUNT(gUnknown_Debug_083C0E7F), gUnknown_Debug_083C0E7F);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C0E7F), gDebug_03000720, 23);
    gMenuCallback = debug_sub_808BEB4;
    return FALSE;
}

bool8 TomomichiDebugMenu_ControlWorks(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 24, 13);
    Menu_PrintItems(2, 1, ARRAY_COUNT(gUnknown_Debug_083C0EF1), gUnknown_Debug_083C0EF1);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C0EF1), gDebug_03000721, 23);
    gMenuCallback = debug_sub_808BF3C;
    return FALSE;
}

bool8 debug_sub_808BC48(void)
{
    s8 input = Menu_ProcessInput();
    s8 cursorPos = Menu_GetCursorPos();

    switch (cursorPos)
    {
        case 0:
            debug_sub_808ED0C();
            break;
        case 1:
            debug_sub_808ED9C();
            break;
        case 2:
            debug_sub_808EE3C();
            break;
    }
    debug_sub_808EF8C(0);
    if (input == -2)
        return FALSE;
    if (input == -1)
    {
        CloseMenu();
        return TRUE;
    }
    if (input == 3)
    {
        gMenuCallback = gUnknown_Debug_083C0D2C[3].func;
        return FALSE;
    }
    return FALSE;
}

bool8 debug_sub_808BCBC(void)
{
    s8 input = Menu_ProcessInput();
    s8 cursorPos = Menu_GetCursorPos();

    switch (cursorPos)
    {
        case 0:
            debug_sub_808ED0C();
            break;
        case 1:
            debug_sub_808ED9C();
            break;
        case 2:
            debug_sub_808EE9C();
            break;
    }
    debug_sub_808EF8C(1);
    if (input == -2)
        return FALSE;
    if (input == -1)
    {
        CloseMenu();
        return TRUE;
    }
    if (input == 3)
    {
        gMenuCallback = gUnknown_Debug_083C0D83[3].func;
        return FALSE;
    }
    return FALSE;
}

bool8 debug_sub_808BD30(void)
{
    s8 input = Menu_ProcessInput();
    s8 cursorPos = Menu_GetCursorPos();

    switch (cursorPos)
    {
        case 0:
            debug_sub_808ED0C();
            break;
        case 1:
            debug_sub_808ED9C();
            break;
        case 2:
            debug_sub_808EF14();
            break;
    }
    debug_sub_808EF8C(2);
    if (input == -2)
        return FALSE;
    if (input == -1)
    {
        CloseMenu();
        return TRUE;
    }
    if (input == 3)
    {
        gMenuCallback = gUnknown_Debug_083C0DD4[3].func;
        return FALSE;
    }
    return FALSE;
}

bool8 debug_sub_808BDA4(void)
{
    if (gMain.newKeys & DPAD_UP)
    {
        PlaySE(SE_SELECT);
        gDebug_0300071E = Menu_MoveCursor(-1);
    }
    if (gMain.newKeys & DPAD_DOWN)
    {
        PlaySE(SE_SELECT);
        gDebug_0300071E = Menu_MoveCursor(+1);
    }
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        return gUnknown_Debug_083C0E15[gDebug_0300071E].func();
    }
    if (gMain.newKeys & (B_BUTTON | START_BUTTON))
    {
        CloseMenu();
        return TRUE;
    }
    return FALSE;
}

bool8 debug_sub_808BE2C(void)
{
    if (gMain.newKeys & DPAD_UP)
    {
        PlaySE(SE_SELECT);
        gDebug_0300071F = Menu_MoveCursor(-1);
    }
    if (gMain.newKeys & DPAD_DOWN)
    {
        PlaySE(SE_SELECT);
        gDebug_0300071F = Menu_MoveCursor(+1);
    }
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        return gUnknown_Debug_083C0E32[gDebug_0300071F].func();
    }
    if (gMain.newKeys & (B_BUTTON | START_BUTTON))
    {
        CloseMenu();
        return TRUE;
    }
    return FALSE;
}

bool8 debug_sub_808BEB4(void)
{
    if (gMain.newKeys & DPAD_UP)
    {
        PlaySE(SE_SELECT);
        gDebug_03000720 = Menu_MoveCursor(-1);
    }
    if (gMain.newKeys & DPAD_DOWN)
    {
        PlaySE(SE_SELECT);
        gDebug_03000720 = Menu_MoveCursor(+1);
    }
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        return gUnknown_Debug_083C0E7F[gDebug_03000720].func();
    }
    if (gMain.newKeys & (B_BUTTON | START_BUTTON))
    {
        CloseMenu();
        return TRUE;
    }
    return FALSE;
}

bool8 debug_sub_808BF3C(void)
{
    if (gMain.newKeys & DPAD_UP)
    {
        PlaySE(SE_SELECT);
        gDebug_03000721 = Menu_MoveCursor(-1);
    }
    if (gMain.newKeys & DPAD_DOWN)
    {
        PlaySE(SE_SELECT);
        gDebug_03000721 = Menu_MoveCursor(+1);
    }
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        return gUnknown_Debug_083C0EF1[gDebug_03000721].func();
    }
    if (gMain.newKeys & (B_BUTTON | START_BUTTON))
    {
        CloseMenu();
        return TRUE;
    }
    return FALSE;
}

bool8 debug_sub_808BFC4(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 28, 19);
    Menu_PrintItems(2, 1, ARRAY_COUNT(gUnknown_Debug_083C0F79), gUnknown_Debug_083C0F79);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C0F79), 0, 27);
    gMenuCallback = debug_sub_808C064;
    return FALSE;
}

bool8 debug_sub_808C014(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 28, 13);
    Menu_PrintItems(2, 1, ARRAY_COUNT(gUnknown_Debug_083C0FFC), gUnknown_Debug_083C0FFC);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C0FFC), 0, 27);
    gMenuCallback = debug_sub_808C0A8;
    return FALSE;
}

#endif
