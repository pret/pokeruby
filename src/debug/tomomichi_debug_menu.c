#if DEBUG
#include "global.h"
#include "palette.h"
#include "event_data.h"
#include "constants/flags.h"
#include "constants/songs.h"
#include "overworld.h"
#include "script.h"
#include "menu.h"
#include "start_menu.h"
#include "main.h"
#include "contest_painting.h"
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
bool8 debug_sub_808C280(void);
void debug_sub_808F168(u32 a0);
bool8 debug_sub_808C2E4(void);
bool8 debug_sub_808D8D8(void);
bool8 debug_sub_808CD08(void);
bool8 debug_sub_808CD60(void);
bool8 debug_sub_808CDB8(void);
bool8 debug_sub_808C85C(void);
bool8 debug_sub_808C8B4(void);
bool8 debug_sub_808C90C(void);
bool8 debug_sub_808C964(void);
bool8 debug_sub_808C9BC(void);
bool8 debug_sub_808CA14(void);
bool8 debug_sub_808CA6C(void);
bool8 debug_sub_808CAC4(void);
bool8 debug_sub_808CB1C(void);
bool8 debug_sub_808C3B0(void);
bool8 debug_sub_808C408(void);
bool8 debug_sub_808C460(void);
bool8 debug_sub_808C4B8(void);
bool8 debug_sub_808C510(void);
bool8 debug_sub_808C568(void);
bool8 debug_sub_808C5C0(void);
bool8 debug_sub_808C618(void);
bool8 debug_sub_808C670(void);
bool8 debug_sub_808C36C(void);
bool8 debug_sub_808C6C8(void);
void debug_sub_808C714(u8, u8);
void debug_sub_808C764(u8);
void debug_sub_808F2E0(u8, u8, bool8);
bool8 debug_sub_808C818(void);
bool8 debug_sub_808CB74(void);

extern const u8 DebugScript_081C1CFE[];
extern const u8 DebugScript_081C1D07[];
extern const u8 DebugScript_081C1D1E[];
extern const u8 DebugScript_081C1D24[];
extern const u8 DebugScript_081C1D2A[];
extern const u8 DebugScript_081C1D35[];
extern const u8 DebugScript_081C1D46[];
extern const u8 DebugScript_081C221F[];
extern const u8 DebugScript_081C23E2[];
extern const u8 DebugScript_081C23E6[];
extern const u8 DebugScript_081C23F6[];
extern const u8 DebugScript_081C2482[];
extern const u8 DebugScript_081C23FD[];
extern const u8 DebugScript_081C2518[];
extern const u8 DebugScript_081C2507[];

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

const u16 gUnknown_Debug_083C1196[][9] = {
    {0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19},
    {0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f, 0x20}
};

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

const u16 gUnknown_Debug_083C12D2[][9] = {
    {0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09},
    {0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10}
};

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

const u8 gUnknown_Debug_083C19BC[] = {8, 7, 9, 4, 9, 9, 9, 7, 5};

const u16 gUnknown_Debug_083C19C6[][9] = {
    {FLAG_BADGE01_GET, FLAG_BADGE02_GET, FLAG_BADGE03_GET, FLAG_BADGE04_GET, FLAG_BADGE05_GET, FLAG_BADGE06_GET, FLAG_BADGE07_GET, FLAG_BADGE08_GET},
    {FLAG_VISITED_LITTLEROOT_TOWN, FLAG_VISITED_OLDALE_TOWN, FLAG_VISITED_DEWFORD_TOWN, FLAG_VISITED_LAVARIDGE_TOWN, FLAG_VISITED_FALLARBOR_TOWN, FLAG_VISITED_VERDANTURF_TOWN, FLAG_VISITED_PACIFIDLOG_TOWN},
    {FLAG_VISITED_PETALBURG_CITY, FLAG_VISITED_SLATEPORT_CITY, FLAG_VISITED_MAUVILLE_CITY, FLAG_VISITED_RUSTBORO_CITY, FLAG_VISITED_FORTREE_CITY, FLAG_VISITED_LILYCOVE_CITY, FLAG_VISITED_MOSSDEEP_CITY, FLAG_VISITED_SOOTOPOLIS_CITY, FLAG_VISITED_EVER_GRANDE_CITY},
    {FLAG_SYS_POKEMON_GET, FLAG_SYS_POKEDEX_GET, FLAG_SYS_POKENAV_GET, FLAG_SYS_RIBBON_GET},
    {FLAG_SYS_GAME_CLEAR, FLAG_SYS_CHAT_USED, FLAG_SYS_HIPSTER_MEET, FLAG_SYS_USE_FLASH, FLAG_SYS_USE_STRENGTH, FLAG_SYS_WEATHER_CTRL, FLAG_SYS_CYCLING_ROAD, FLAG_SYS_SAFARI_MODE, FLAG_SYS_CRUISE_MODE},
    {FLAG_SYS_TV_HOME, FLAG_SYS_TV_WATCH, FLAG_SYS_TV_START, FLAG_SYS_POPWORD_INPUT, FLAG_SYS_MIX_RECORD, FLAG_SYS_CLOCK_SET, FLAG_SYS_CAVE_SHIP, FLAG_SYS_CAVE_WONDER, FLAG_SYS_CAVE_BATTLE},
    {FLAG_SYS_NATIONAL_DEX, FLAG_SYS_SHOAL_TIDE, FLAG_SYS_RIBBON_GET, FLAG_SYS_PC_LANETTE, FLAG_SYS_EXDATA_ENABLE, FLAG_SYS_BRAILLE_DIG, FLAG_SYS_BRAILLE_STRENGTH, FLAG_SYS_BRAILLE_WAIT, FLAG_SYS_BRAILLE_FLY},
    {FLAG_SYS_ENC_UP_ITEM, FLAG_SYS_ENC_DOWN_ITEM, FLAG_SYS_HAS_EON_TICKET, FLAG_SYS_TV_LATI, FLAG_SYS_SHOAL_ITEM, FLAG_SYS_B_DASH, FLAG_SYS_CTRL_OBJ_DELETE},
    {FLAG_LANDMARK_SEAFLOOR_CAVERN, FLAG_LANDMARK_BATTLE_TOWER, FLAG_LANDMARK_SOUTHERN_ISLAND, FLAG_SYS_POKEMON_LEAGUE_FLY, FLAG_LANDMARK_SKY_PILLAR}
};

const u8 gDebug_0x83C1A68[] = _("FVーBALL　パート1");

const struct MenuAction gUnknown_Debug_083C1A78[] = {
	{gDebug_0x83C1A68, debug_sub_808D8D8}
};

const u8 gUnknown_Debug_083C1A80[] = _("FVーBALL1ー78");
const u8 gUnknown_Debug_083C1A8C[] = _("FVーBALL1ー133");

const struct MenuAction gUnknown_Debug_083C1A9C[] = {
	{gUnknown_Debug_083C1A80, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1A8C, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C1AAC[] = {2};

const u16 gUnknown_Debug_083C1AAE[][9] = {
    {FLAG_ITEM_ABANDONED_SHIP_HIDDEN_FLOOR_ROOMS_2, FLAG_ITEM_MOSSDEEP_STEVENS_HOUSE_1}
};

const u8 gUnknown_Debug_083C1AC0[] = _("ジムリーダー");
const u8 gUnknown_Debug_083C1AC7[] = _("してんのう");
const u8 gUnknown_Debug_083C1ACD[] = _("みつる/Champロード");

const struct MenuAction gUnknown_Debug_083C1ADC[] = {
	{gUnknown_Debug_083C1AC0, debug_sub_808CD08},
	{gUnknown_Debug_083C1AC7, debug_sub_808CD60},
	{gUnknown_Debug_083C1ACD, debug_sub_808CDB8}
};

const u8 gUnknown_Debug_083C1AF4[] = _("FTーGYMー01ーLEADER");
const u8 gUnknown_Debug_083C1B05[] = _("FTーGYMー02ーLEADER");
const u8 gUnknown_Debug_083C1B16[] = _("FTーGYMー03ーLEADER");
const u8 gUnknown_Debug_083C1B27[] = _("FTーGYMー04ーLEADER");
const u8 gUnknown_Debug_083C1B38[] = _("FTーGYMー05ーLEADER");
const u8 gUnknown_Debug_083C1B49[] = _("FTーGYMー06ーLEADER");
const u8 gUnknown_Debug_083C1B5A[] = _("FTーGYMー07ーLEADER");
const u8 gUnknown_Debug_083C1B6B[] = _("FTーGYMー08ーLEADER");

const struct MenuAction gUnknown_Debug_083C1B7C[] = {
	{gUnknown_Debug_083C1AF4, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1B05, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1B16, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1B27, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1B38, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1B49, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1B5A, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1B6B, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C1BBC[] = _("FTーSHITENー01");
const u8 gUnknown_Debug_083C1BC9[] = _("FTーSHITENー02");
const u8 gUnknown_Debug_083C1BD6[] = _("FTーSHITENー03");
const u8 gUnknown_Debug_083C1BE3[] = _("FTーSHITENー04");

const struct MenuAction gUnknown_Debug_083C1BF0[] = {
	{gUnknown_Debug_083C1BBC, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1BC9, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1BD6, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1BE3, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C1C10[] = _("FTーMITSURUー01ーCAVEーD1301");

const struct MenuAction gUnknown_Debug_083C1C2C[] = {
	{gUnknown_Debug_083C1C10, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C1C34[] = {8, 4, 1};
const u16 gUnknown_Debug_083C1C38[][9] = {
    {FLAG_DEFEATED_RUSTBORO_GYM, FLAG_DEFEATED_DEWFORD_GYM, FLAG_DEFEATED_MAUVILLE_GYM, FLAG_DEFEATED_LAVARIDGE_GYM, FLAG_DEFEATED_PETALBURG_GYM, FLAG_DEFEATED_FORTREE_GYM, FLAG_DEFEATED_MOSSDEEP_GYM, FLAG_DEFEATED_SOOTOPOLIS_GYM},
    {FLAG_DEFEATED_ELITE_4_SYDNEY, FLAG_DEFEATED_ELITE_4_PHOEBE, FLAG_DEFEATED_ELITE_4_GLACIA, FLAG_DEFEATED_ELITE_4_DRAKE},
    {0x04E1}
};

const u8 gUnknown_Debug_083C1C6E[] = _("120/119ばんどうろカクレオン");
const u8 gUnknown_Debug_083C1C80[] = _("そのた1　/　SUPPORTM/W");
const u8 gUnknown_Debug_083C1C92[] = _("ODAMAKI/FIGHTER1");
const u8 gUnknown_Debug_083C1CA3[] = _("MITSURU/TENKI");
const u8 gUnknown_Debug_083C1CB1[] = _("そのた2　/DAIGO");
const u8 gUnknown_Debug_083C1CBD[] = _("POKE/POKEMON");
const u8 gUnknown_Debug_083C1CCA[] = _("MAMA/SUPPORT02");
const u8 gUnknown_Debug_083C1CD9[] = _("HAGI");
const u8 gUnknown_Debug_083C1CDE[] = _("SUPPORT01");

const struct MenuAction gUnknown_Debug_083C1CE8[] = {
	{gUnknown_Debug_083C1C6E, debug_sub_808C85C},
	{gUnknown_Debug_083C1C80, debug_sub_808C8B4},
	{gUnknown_Debug_083C1C92, debug_sub_808C90C},
	{gUnknown_Debug_083C1CA3, debug_sub_808C964},
	{gUnknown_Debug_083C1CB1, debug_sub_808C9BC},
	{gUnknown_Debug_083C1CBD, debug_sub_808CA14},
	{gUnknown_Debug_083C1CCA, debug_sub_808CA6C},
	{gUnknown_Debug_083C1CD9, debug_sub_808CAC4},
	{gUnknown_Debug_083C1CDE, debug_sub_808CB1C}
};

const u8 gUnknown_Debug_083C1D30[] = _("FVーKAKUREONBー01ーFIELDーR120");
const u8 gUnknown_Debug_083C1D4B[] = _("FVーKAKUREー01ーFIELDーR120");
const u8 gUnknown_Debug_083C1D63[] = _("FVーKAKUREー02ーFIELDーR120");
const u8 gUnknown_Debug_083C1D7B[] = _("FVーKAKUREー03ーFIELDーR120");
const u8 gUnknown_Debug_083C1D93[] = _("FVーKAKUREー04ーFIELDーR120");
const u8 gUnknown_Debug_083C1DAB[] = _("FVーKAKUREー05ーFIELDーR120");
const u8 gUnknown_Debug_083C1DC3[] = _("FVーKAKUREー06ーFIELDーR120");
const u8 gUnknown_Debug_083C1DDB[] = _("FVーKAKUREー01ーFIELDーR119");
const u8 gUnknown_Debug_083C1DF3[] = _("FVーKAKUREー02ーFIELDーR119");

const struct MenuAction gUnknown_Debug_083C1E0C[] = {
	{gUnknown_Debug_083C1D30, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1D4B, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1D63, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1D7B, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1D93, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1DAB, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1DC3, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1DDB, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1DF3, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C1E54[] = _("FVーBALLー01ーC107ーR0501");
const u8 gUnknown_Debug_083C1E6A[] = _("FVーWORKERM1ー04ーFIELDーC104");
const u8 gUnknown_Debug_083C1E84[] = _("FVーSUBMARINEー06ーCAVEーD1101");
const u8 gUnknown_Debug_083C1E9F[] = _("FVーGUESTーALLーC106ーR0102");
const u8 gUnknown_Debug_083C1EB7[] = _("FVーHORIDASIー01ーC106ーR1106");
const u8 gUnknown_Debug_083C1ED1[] = _("FVーMIDDLEM1ー01ーR110ーR0101");
const u8 gUnknown_Debug_083C1EEB[] = _("FVーFUNEー01ーC102ーR0601");
const u8 gUnknown_Debug_083C1F01[] = _("FVーSUPPORTWー01ーT101ーR0202");
const u8 gUnknown_Debug_083C1F1B[] = _("FVーSUPPORTMー01ーT101ーR0102");

const struct MenuAction gUnknown_Debug_083C1F38[] = {
	{gUnknown_Debug_083C1E54, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1E6A, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1E84, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1E9F, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1EB7, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1ED1, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1EEB, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1F01, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1F1B, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C1F80[] = _("FVーODAMAKIー01ーFIELDーR101");
const u8 gUnknown_Debug_083C1F99[] = _("FVーODAMAKIー01ーT101ーR0301");
const u8 gUnknown_Debug_083C1FB2[] = _("FVーODAMAKIーHYOKAーT101ーR0301");
const u8 gUnknown_Debug_083C1FCE[] = _("FVーODAMAKIーHYOKAーFIELDーR101");
const u8 gUnknown_Debug_083C1FEA[] = _("FVーODAMAKIーHYOKAーFIELDーR103");
const u8 gUnknown_Debug_083C2006[] = _("FVーODAMAKIー01ーC109ーR0105");
const u8 gUnknown_Debug_083C201F[] = _("FVーFIGHTERー01ーCAVEーD0201");
const u8 gUnknown_Debug_083C2038[] = _("FVーFIGHTERー01ーT106ーR0201");
const u8 gUnknown_Debug_083C2051[] = _("FVーFIGHTERー01ーFIELDーR116");

const struct MenuAction gUnknown_Debug_083C206C[] = {
	{gUnknown_Debug_083C1F80, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1F99, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1FB2, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1FCE, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C1FEA, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C2006, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C201F, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C2038, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C2051, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C20B4[] = _("FVーMITSURUー01ーFIELDーC101");
const u8 gUnknown_Debug_083C20CD[] = _("FVーMITSURUー02ーCAVEーD1301");
const u8 gUnknown_Debug_083C20E6[] = _("FVーMITSURUー01ーFIELDーC103");
const u8 gUnknown_Debug_083C20FF[] = _("FVーMITSURUー01ーT106ーR0201");
const u8 gUnknown_Debug_083C2118[] = _("FVーMITSURUー01ーCAVEーD1301");
const u8 gUnknown_Debug_083C2131[] = _("FVーMITSURUー01ーC101ーR0201");
const u8 gUnknown_Debug_083C214A[] = _("FVーMITSURUー01ーFIELDーR102");
const u8 gUnknown_Debug_083C2163[] = _("FVーTENKIー01ーR119ーR101");
const u8 gUnknown_Debug_083C2179[] = _("FVーTENKIー01ーR119ーR102");

const struct MenuAction gUnknown_Debug_083C2190[] = {
	{gUnknown_Debug_083C20B4, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C20CD, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C20E6, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C20FF, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C2118, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C2131, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C214A, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C2163, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C2179, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C21D8[] = _("FVーDAIGOー01ーCAVEーD0504");
const u8 gUnknown_Debug_083C21EF[] = _("FVーDAIGOー01ーFIELDーR128");
const u8 gUnknown_Debug_083C2206[] = _("FVーDAIGOー01ーFIELDーR118");
const u8 gUnknown_Debug_083C221D[] = _("FVーDAIGOー01ーC107ーR0501");
const u8 gUnknown_Debug_083C2234[] = _("FVーDAIGOー01ーFIELDーR120");
const u8 gUnknown_Debug_083C224B[] = _("FVーDAIGOー01ーFIELDーR108");

const struct MenuAction gUnknown_Debug_083C2264[] = {
	{gUnknown_Debug_083C21D8, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C21EF, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C2206, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C221D, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C2234, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C224B, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C2294[] = _("FVーPOKE1ー02ーCAVEーD1111");
const u8 gUnknown_Debug_083C22AB[] = _("FVーPOKE1ー01ーCAVEーD0601");
const u8 gUnknown_Debug_083C22C2[] = _("FVーPOKE1ー02ーCAVEーD0601");
const u8 gUnknown_Debug_083C22D9[] = _("FVーPOKE1ー01ーFIELDーR101");
const u8 gUnknown_Debug_083C22F0[] = _("FVーPOKE1ー01ーOPENINGーROOM01");
const u8 gUnknown_Debug_083C230B[] = _("FVーPOKE1ー02ーOPENINGーROOM01");
const u8 gUnknown_Debug_083C2326[] = _("FVーPOKE1ー01ーCAVEーD2308");
const u8 gUnknown_Debug_083C233D[] = _("FVーPOKEMONー01ーCAVEーD0201");
const u8 gUnknown_Debug_083C2356[] = _("FVーPOKEMONー01ーR104ーR0101");

const struct MenuAction gUnknown_Debug_083C2370[] = {
	{gUnknown_Debug_083C2294, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C22AB, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C22C2, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C22D9, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C22F0, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C230B, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C2326, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C233D, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C2356, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C23B8[] = _("FVーMAMAー01ーFIELDーT101");
const u8 gUnknown_Debug_083C23CE[] = _("FVーMAMAー01ーOPENINGーROOM02");
const u8 gUnknown_Debug_083C23E8[] = _("FVーMAMAー01ーT101ーR0101");
const u8 gUnknown_Debug_083C23FE[] = _("FVーMAMAー01ーT101ーR0201");
const u8 gUnknown_Debug_083C2414[] = _("FVーMAMAー02ーT101ーR0101");
const u8 gUnknown_Debug_083C242A[] = _("FVーMAMAー02ーT101ーR0201");
const u8 gUnknown_Debug_083C2440[] = _("FVーSUPPORTー02ーFIELDーR110");
const u8 gUnknown_Debug_083C2459[] = _("FVーSUPPORTー02ーFIELDーR119");
const u8 gUnknown_Debug_083C2472[] = _("FVーSUPPORTー02ーFIELDーT104");

const struct MenuAction gUnknown_Debug_083C248C[] = {
	{gUnknown_Debug_083C23B8, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C23CE, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C23E8, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C23FE, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C2414, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C242A, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C2440, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C2459, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C2472, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C24D4[] = _("FVーHAGIー01ーFIELDーR104");
const u8 gUnknown_Debug_083C24EA[] = _("FVーHAGIー01ーR104ーR0101");
const u8 gUnknown_Debug_083C2500[] = _("FVーHAGIー01ーFIELDーT103");
const u8 gUnknown_Debug_083C2516[] = _("FVーHAGIー01ーFIELDーR109");
const u8 gUnknown_Debug_083C252C[] = _("FVーHAGIー01ーC102ーR0601");
const u8 gUnknown_Debug_083C2542[] = _("FVーHAGIー01ーC102ーR0101");
const u8 gUnknown_Debug_083C2558[] = _("FVーHAGIー01ーCAVEーD0201");
const u8 gUnknown_Debug_083C256E[] = _("FVーHAGIー01ーFIELDーR116");
const u8 gUnknown_Debug_083C2584[] = _("FVーHAGIー01ーSPーSHIP01");

const struct MenuAction gUnknown_Debug_083C259C[] = {
	{gUnknown_Debug_083C24D4, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C24EA, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C2500, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C2516, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C252C, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C2542, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C2558, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C256E, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C2584, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C25E4[] = _("FVーSUPPORTー01ーT101ーR0301");
const u8 gUnknown_Debug_083C25FD[] = _("FVーSUPPORTー01ーC109ーR0105");
const u8 gUnknown_Debug_083C2616[] = _("FVーSUPPORTー01ーFIELDーC104");
const u8 gUnknown_Debug_083C262F[] = _("FVーSUPPORTー01ーFIELDーC106");
const u8 gUnknown_Debug_083C2648[] = _("FVーSUPPORTー01ーFIELDーR103");
const u8 gUnknown_Debug_083C2661[] = _("FVーSUPPORTー01ーFIELDーR110");
const u8 gUnknown_Debug_083C267A[] = _("FVーSUPPORTー01ーFIELDーR119");
const u8 gUnknown_Debug_083C2693[] = _("FVーSUPPORTー01ーFIELDーT104");
const u8 gUnknown_Debug_083C26AC[] = _("FVーSUPPORTー01ーFIELDーT102");

const struct MenuAction gUnknown_Debug_083C26C8[] = {
	{gUnknown_Debug_083C25E4, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C25FD, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C2616, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C262F, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C2648, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C2661, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C267A, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C2693, TomomichiDebugMenu_Config},
	{gUnknown_Debug_083C26AC, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C2710[] = {9, 9, 9, 9, 6, 9, 9, 9, 9};

const u16 gUnknown_Debug_083C271A[][9] = {
    {FLAG_HIDE_KECLEON_ROUTE120_2, FLAG_HIDE_KECLEON_ROUTE120_1, FLAG_HIDE_KECLEON_ROUTE120_3, FLAG_HIDE_KECLEON_ROUTE120_4, FLAG_HIDE_KECLEON_ROUTE120_5, FLAG_HIDE_KECLEON_ROUTE120_6, FLAG_HIDE_KECLEON_ROUTE120_7, FLAG_HIDE_KECLEON_ROUTE119_1, FLAG_HIDE_KECLEON_ROUTE119_2},
    {FLAG_HIDE_BELDUM_BALL_STEVENS_HOUSE, FLAG_HIDE_DEVON_RUSTBORO, FLAG_HIDE_UNDERWATER_SUBMARINE_INTERACTION, FLAG_HIDE_LILYCOVE_MOTEL_PEOPLE, FLAG_HIDE_ROOFTOP_LADY_LILYCOVE_MART, FLAG_HIDE_TRICKMASTER_ENTRANCE, 0x352, FLAG_HIDE_MAY_UPSTAIRS, FLAG_HIDE_BRENDAN_UPSTAIRS},
    {FLAG_HIDE_BIRCH_BATTLE_POOCHYENA, FLAG_HIDE_BIRCH_IN_LAB, FLAG_UNKNOWN_BIRCH_380, FLAG_HIDE_BIRCH_ROUTE101, FLAG_HIDE_BIRCH_ROUTE103, FLAG_HIDE_BIRCH_CHAMPIONS_ROOM, FLAG_HIDE_BOYFRIEND_RUSTURF_TUNNEL, FLAG_HIDE_BOYFRIEND_WANDAS_HOUSE, FLAG_HIDE_TUNNER_DIGGER_ROUTE116},
    {FLAG_HIDE_WALLY_PETALBURG, FLAG_HIDE_WALLY_DEFEATED_VICTORY_ROAD, FLAG_HIDE_WALLY_MAUVILLE, FLAG_HIDE_WALLY_WANDAS_HOUSE, FLAG_HIDE_WALLY_BATTLE_VICTORY_ROAD, FLAG_HIDE_WALLY_PETALBURG_GYM, FLAG_UNKNOWN_363, FLAG_HIDE_WEATHER_INSTITUTE_WORKERS_1F, FLAG_HIDE_WEATHER_INSTITUTE_WORKERS_2F},
    {FLAG_HIDE_STEVEN_GRANITE_CAVE, FLAG_HIDE_STEVEN_ROUTE128, FLAG_HIDE_STEVEN_ROUTE118, FLAG_HIDE_STEVEN_STEVENS_HOUSE, FLAG_HIDE_STEVEN_ROUTE120, FLAG_HIDE_STEVEN_SOOTOPOLIS},
    {FLAG_HIDE_SLEEPING_MON_SEAFLOOR_CAVERN, FLAG_UNKNOWN_2E1, FLAG_UNKNOWN_2EC, FLAG_HIDE_POOCHYENA_ROUTE101, FLAG_HIDE_MACHOKE_MOVER_1, FLAG_HIDE_MACHOKE_MOVER_2, 0x305, FLAG_HIDE_PEEKO_RUSTURF_TUNNEL, FLAG_HIDE_PEEKO_BRINEY_HOUSE},
    {FLAG_HIDE_MOM_LITTLEROOT, FLAG_HIDE_MOM_UPSTAIRS, FLAG_HIDE_BRENDAN_MOM_DOWNSTAIRS, FLAG_HIDE_MAY_MOM_DOWNSTAIRS, FLAG_UNKNOWN_30E, FLAG_UNKNOWN_30F, FLAG_HIDE_RIVAL_ON_BIKE_ROUTE110, FLAG_HIDE_RIVAL_ROUTE119_ON_BIKE, FLAG_HIDE_RIVAL_LAVARIDGE_2},
    {FLAG_HIDE_MR_BRINEY_ROUTE104, FLAG_HIDE_MR_BRINEY_ROUTE104_HOUSE, FLAG_HIDE_MR_BRINEY_DEWFORD_TOWN, FLAG_HIDE_MR_BRINEY_ROUTE109, FLAG_UNKNOWN_34F, FLAG_HIDE_BRINEY_SLATEPORT_SHIPYARD, FLAG_HIDE_BRINEY_RUSTURF_TUNNEL, FLAG_HIDE_BRINEY_ROUTE116, FLAG_HIDE_BRINEY_AND_PEEKO_SS_TIDAL},
    {FLAG_HIDE_RIVAL_BIRCH_LAB, FLAG_HIDE_RIVAL_CHAMPIONS_ROOM, FLAG_HIDE_RIVAL_RUSTBORO, FLAG_HIDE_RIVAL_LILYCOVE_MART, FLAG_HIDE_RIVAL_ROUTE103, FLAG_HIDE_RIVAL_ROUTE110, FLAG_HIDE_RIVAL_ROUTE119, FLAG_HIDE_RIVAL_LAVARIDGE_1, FLAG_HIDE_RIVAL_OLDALE_TOWN}
};

const u8 gUnknown_Debug_083C27BC[] = _("FEひでんわざ/デボンかんれん");
const u8 gUnknown_Debug_083C27CC[] = _("FEだいじなアイテムPART1");
const u8 gUnknown_Debug_083C27DC[] = _("そのた1");
const u8 gUnknown_Debug_083C27E1[] = _("MITSURU/DOOR");
const u8 gUnknown_Debug_083C27EE[] = _("カラクリやしき10のやじるし/GYM07");
const u8 gUnknown_Debug_083C2803[] = _("SUPPORT/そのた4");
const u8 gUnknown_Debug_083C2810[] = _("DAISUKI/そのた5");
const u8 gUnknown_Debug_083C281D[] = _("そのた2");
const u8 gUnknown_Debug_083C2822[] = _("そのた6");

const struct MenuAction gUnknown_Debug_083C2828[] = {
	{gUnknown_Debug_083C27BC, debug_sub_808C3B0},
	{gUnknown_Debug_083C27CC, debug_sub_808C408},
	{gUnknown_Debug_083C27DC, debug_sub_808C460},
	{gUnknown_Debug_083C27E1, debug_sub_808C4B8},
	{gUnknown_Debug_083C27EE, debug_sub_808C510},
	{gUnknown_Debug_083C2803, debug_sub_808C568},
	{gUnknown_Debug_083C2810, debug_sub_808C5C0},
	{gUnknown_Debug_083C281D, debug_sub_808C618},
	{gUnknown_Debug_083C2822, debug_sub_808C670}
};

const u8 gUnknown_Debug_083C2870[] = _("FEーHWAZA01ーGET");
const u8 gUnknown_Debug_083C287F[] = _("FEーHWAZA02ー01ーFIELDR119");
const u8 gUnknown_Debug_083C2897[] = _("FEーHWAZA03ーGET");
const u8 gUnknown_Debug_083C28A6[] = _("FEーHWAZA04ー01ーT106ーR0201");
const u8 gUnknown_Debug_083C28BF[] = _("FEーHWAZA05ー01ーCAVEーD0502");
const u8 gUnknown_Debug_083C28D8[] = _("FEーHWAZA04ー01ーC103ーR0301");
const u8 gUnknown_Debug_083C28F1[] = _("FEーDEBONーNIMOTSUーRETURN");
const u8 gUnknown_Debug_083C2909[] = _("FEーDEBONー01ーFIELDーC104");
const u8 gUnknown_Debug_083C2920[] = _("FEーDEBONー02ーFIELDーC104");

const struct MenuAction gUnknown_Debug_083C2938[] = {
    {gUnknown_Debug_083C2870, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C287F, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2897, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C28A6, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C28BF, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C28D8, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C28F1, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2909, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2920, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C2980[] = _("FEーCYCLEー01ーP01ーP01ーC103ーR0201");
const u8 gUnknown_Debug_083C299F[] = _("FEーSCOOPー01ーP01ーFIELDーR115");
const u8 gUnknown_Debug_083C29BA[] = _("FEーROPEー01ーP01ーFIELDーR114");
const u8 gUnknown_Debug_083C29D4[] = _("FEーKAMAー01ーP01ーFIELDーR119");
const u8 gUnknown_Debug_083C29EE[] = _("FEーZYOUROーGET");
const u8 gUnknown_Debug_083C29FC[] = _("FEーCUBECASEーGET");
const u8 gUnknown_Debug_083C2A0C[] = _("FEーBORONOTURIZAOーGET");
const u8 gUnknown_Debug_083C2A21[] = _("FEーIITURIZAOーGET");
const u8 gUnknown_Debug_083C2A32[] = _("FEーSUGOITURIZAOーGET");

const struct MenuAction gUnknown_Debug_083C2A48[] = {
    {gUnknown_Debug_083C2980, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C299F, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C29BA, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C29D4, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C29EE, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C29FC, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2A0C, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2A21, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2A32, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C2A90[] = _("FEーBOSSー01ーCAVEーD0701");
const u8 gUnknown_Debug_083C2AA6[] = _("FEーTANTIKIーRETURN");
const u8 gUnknown_Debug_083C2AB8[] = _("FEーPOKE1ー01ーCAVEーD1111");
const u8 gUnknown_Debug_083C2ACF[] = _("FEーPOKE1ー01ーCAVEーD1206");
const u8 gUnknown_Debug_083C2AE6[] = _("FEーSHOPー01ーC104ーFS01");
const u8 gUnknown_Debug_083C2AFB[] = _("FEーHUNENOTIKETTーGET");
const u8 gUnknown_Debug_083C2B0F[] = _("FEーKAKUREー01ーFIELDーC105");
const u8 gUnknown_Debug_083C2B27[] = _("FEーKASEKIーRETURN");
const u8 gUnknown_Debug_083C2B38[] = _("FEーWINー01ーSPーSHIP01");

const struct MenuAction gUnknown_Debug_083C2B4C[] = {
    {gUnknown_Debug_083C2A90, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2AA6, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2AB8, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2ACF, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2AE6, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2AFB, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2B0F, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2B27, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2B38, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C2B94[] = _("FEーMITSURUー01ーT106ーR0201");
const u8 gUnknown_Debug_083C2BAD[] = _("FEーMITSURUー01ーCAVEーD1301");
const u8 gUnknown_Debug_083C2BC6[] = _("FEーMITSURUー02ーFIELDーC103");
const u8 gUnknown_Debug_083C2BDF[] = _("FEーMITSURUー02ーT106ーR0201");
const u8 gUnknown_Debug_083C2BF8[] = _("FEーMITSURUー01ーFIELDーC103");
const u8 gUnknown_Debug_083C2C11[] = _("FEーDOORーOPENー01ーCAVEーD1712");
const u8 gUnknown_Debug_083C2C2C[] = _("FEーDOORーOPENー02ーCAVEーD1712");
const u8 gUnknown_Debug_083C2C47[] = _("FEーDOORーOPENー04ーCAVEーD1712");
const u8 gUnknown_Debug_083C2C62[] = _("FEーDOORーOPENー06ーCAVEーD1712");

const struct MenuAction gUnknown_Debug_083C2C80[] = {
    {gUnknown_Debug_083C2B94, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2BAD, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2BC6, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2BDF, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2BF8, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2C11, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2C2C, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2C47, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2C62, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C2CC8[] = _("FEーKARAKURI10ーSWITCHー01");
const u8 gUnknown_Debug_083C2CE0[] = _("FEーKARAKURI10ーSWITCHー02");
const u8 gUnknown_Debug_083C2CF8[] = _("FEーKARAKURI10ーSWITCHー03");
const u8 gUnknown_Debug_083C2D10[] = _("FEーKARAKURI10ーSWITCHー04");
const u8 gUnknown_Debug_083C2D28[] = _("FEーKARAKURI10ーSWITCHー05");
const u8 gUnknown_Debug_083C2D40[] = _("FEーGYM07ーSWITCHー01");
const u8 gUnknown_Debug_083C2D53[] = _("FEーGYM07ーSWITCHー02");
const u8 gUnknown_Debug_083C2D66[] = _("FEーGYM07ーSWITCHー03");
const u8 gUnknown_Debug_083C2D79[] = _("FEーGYM07ーSWITCHー04");

const struct MenuAction gUnknown_Debug_083C2D8C[] = {
    {gUnknown_Debug_083C2CC8, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2CE0, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2CF8, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2D10, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2D28, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2D40, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2D53, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2D66, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2D79, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C2DD4[] = _("FEーSUPPORTー01ーFIELDーR103");
const u8 gUnknown_Debug_083C2DED[] = _("FEーSUPPORTー01ーFIELDーC106");
const u8 gUnknown_Debug_083C2E06[] = _("FEーSUPPORTー01ーFIELDーR104");
const u8 gUnknown_Debug_083C2E1F[] = _("FEーSUPPORTー02ーFIELDーC106");
const u8 gUnknown_Debug_083C2E38[] = _("FEーSUPPORTー01ーT101ーR0202");
const u8 gUnknown_Debug_083C2E51[] = _("FEーMAMAー01ーP01ーT101ーR0101");
const u8 gUnknown_Debug_083C2E6B[] = _("FEーCLOCKーSET");
const u8 gUnknown_Debug_083C2E78[] = _("FEーODAMAKIー01ーP01ーT101ーR03");
const u8 gUnknown_Debug_083C2E93[] = _("FEーPAPAー01ーP01ーC101ーR0201");

const struct MenuAction gUnknown_Debug_083C2EB0[] = {
    {gUnknown_Debug_083C2DD4, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2DED, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2E06, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2E1F, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2E38, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2E51, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2E6B, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2E78, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2E93, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C2EF8[] = _("FEーDAISUKIーGOODSーFLAG01");
const u8 gUnknown_Debug_083C2F10[] = _("FEーDAISUKIーGOODSーFLAG02");
const u8 gUnknown_Debug_083C2F28[] = _("FEーDAISUKIーGOODSーFLAG03");
const u8 gUnknown_Debug_083C2F40[] = _("FEーDAISUKIーGOODSーFLAG04");
const u8 gUnknown_Debug_083C2F58[] = _("FEーDAISUKIーGOODSーFLAG05");
const u8 gUnknown_Debug_083C2F70[] = _("FEーBASHAー01ーP01ーFIELDーC101ー");
const u8 gUnknown_Debug_083C2F8C[] = _("FEーBASHAー01ーP02ーFIELDーC101ー");
const u8 gUnknown_Debug_083C2FA8[] = _("FEーBALLー01ーP01ーSPーCONTEST");
const u8 gUnknown_Debug_083C2FC2[] = _("FEーWOMAN2ー01ーP01ーT101ーR0201");

const struct MenuAction gUnknown_Debug_083C2FE0[] = {
    {gUnknown_Debug_083C2EF8, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2F10, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2F28, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2F40, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2F58, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2F70, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2F8C, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2FA8, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C2FC2, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C3028[] = _("FEーSOUKOーOPENーCAVEーD1704");
const u8 gUnknown_Debug_083C3041[] = _("FEーSORAISIー01ーCAVEーD0101");
const u8 gUnknown_Debug_083C305A[] = _("FEーMAYUMIー01ーーR114ーR0201");
const u8 gUnknown_Debug_083C3073[] = _("FEーKUSUNOKIー01ーC102ーR0601");
const u8 gUnknown_Debug_083C308D[] = _("FEーOLDWOMAN1ー01ーCAVEーD0808");
const u8 gUnknown_Debug_083C30A8[] = _("FEーTRAINERM1ー01ーC109ーR0206");
const u8 gUnknown_Debug_083C30C3[] = _("FEーSOONANOーTAMAGOーGET");
const u8 gUnknown_Debug_083C30D9[] = _("FEーDASHーSHOESーGET");
const u8 gUnknown_Debug_083C30EB[] = _("FEーDEBONSUKOOPUーGET");

const struct MenuAction gUnknown_Debug_083C3100[] = {
    {gUnknown_Debug_083C3028, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C3041, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C305A, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C3073, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C308D, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C30A8, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C30C3, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C30D9, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C30EB, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C3148[] = _("FEーSTUDYM1ー01ーP01ーT101R0301");
const u8 gUnknown_Debug_083C3164[] = _("FEーWORKERM1ー01ーC103ーR0201");
const u8 gUnknown_Debug_083C317E[] = _("FEーHIMITSUーGET");
const u8 gUnknown_Debug_083C318D[] = _("");
const u8 gUnknown_Debug_083C318E[] = _("");
const u8 gUnknown_Debug_083C318F[] = _("");
const u8 gUnknown_Debug_083C3190[] = _("");
const u8 gUnknown_Debug_083C3191[] = _("");
const u8 gUnknown_Debug_083C3192[] = _("");

const struct MenuAction gUnknown_Debug_083C3194[] = {
    {gUnknown_Debug_083C3148, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C3164, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C317E, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C318D, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C318E, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C318F, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C3190, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C3191, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C3192, TomomichiDebugMenu_Config}
};

const u8 gUnknown_Debug_083C31DC[] = {9, 9, 9, 9, 9, 9, 9, 9, 3};

const u16 gUnknown_Debug_83C31E6[][9] = {
    {FLAG_RECEIVED_HM01, FLAG_RECEIVED_HM02, FLAG_RECEIVED_HM03, FLAG_RECEIVED_HM04, FLAG_RECEIVED_HM05, FLAG_RECEIVED_HM06, FLAG_RETURNED_DEVON_GOODS, FLAG_DEVON_GOODS_STOLEN, FLAG_RECOVERED_DEVON_GOODS},
    {FLAG_RECEIVED_BIKE, 0x05B, 0x05C, 0x05D, FLAG_RECEIVED_WAILMER_PAIL, FLAG_RECEIVED_POKEBLOCK_CASE, FLAG_RECEIVED_OLD_ROD, FLAG_RECEIVED_GOOD_ROD, FLAG_RECEIVED_SUPER_ROD},
    {FLAG_DEFEATED_EVIL_TEAM_MT_CHIMNEY, FLAG_EXCHANGED_SCANNER, FLAG_LEGEND_ESCAPED_SEAFLOOR_CAVERN, FLAG_LEGENDARY_BATTLE_COMPLETED, FLAG_RECEIVED_REPEAT_BALL, FLAG_RECEIVED_SS_TICKET, FLAG_KECLEON_FLED_FORTREE, FLAG_RECEIVED_FOSSIL_MON, FLAG_DEFEATED_SS_TIDAL_TRAINERS},
    {0x06C, FLAG_DEFEATED_WALLY_VICTORY_ROAD, FLAG_DEFEATED_WALLY_MAUVILLE, FLAG_WALLY_SPEECH, FLAG_DECLINED_WALLY_BATTLE_MAUVILLE, FLAG_USED_ROOM_1_KEY, FLAG_USED_ROOM_2_KEY, FLAG_USED_ROOM_4_KEY, FLAG_USED_ROOM_6_KEY},
    {FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_1, FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_2, FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_3, FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_4, FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_5, FLAG_MOSSDEEP_GYM_SWITCH_1, FLAG_MOSSDEEP_GYM_SWITCH_2, FLAG_MOSSDEEP_GYM_SWITCH_3, FLAG_MOSSDEEP_GYM_SWITCH_4},
    {FLAG_DEFEATED_RIVAL_ROUTE103, FLAG_DECLINED_RIVAL_BATTLE_LILYCOVE, FLAG_MET_RIVAL_RUSTBORO, FLAG_MET_RIVAL_LILYCOVE, FLAG_MET_RIVAL_IN_HOUSE_AFTER_LILYCOVE, 0x050, FLAG_SET_WALL_CLOCK, FLAG_RESCUED_BIRCH, 0x055},
    {FLAG_RECEIVED_RED_SCARF, FLAG_RECEIVED_BLUE_SCARF, FLAG_RECEIVED_PINK_SCARF, FLAG_RECEIVED_GREEN_SCARF, FLAG_RECEIVED_YELLOW_SCARF, 0x053, 0x054, FLAG_LINK_CONTEST_ROOM_POKEBALL, FLAG_MET_RIVAL_MOM},
    {FLAG_USED_STORAGE_KEY, FLAG_MET_PROF_COSMO, FLAG_RECEIVED_DOLL_LANETTE, FLAG_EVIL_TEAM_ESCAPED_STERN_SPOKE, FLAG_RETURNED_RED_OR_BLUE_ORB, FLAG_ENTERED_ELITE_FOUR, FLAG_RECEIVED_LAVARIDGE_EGG, FLAG_RECEIVED_RUNNING_SHOES, FLAG_RECEIVED_DEVON_SCOPE},
    {FLAG_BIRCH_AIDE_MET, FLAG_DECLINED_BIKE, FLAG_RECEIVED_SECRET_POWER}
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

bool8 debug_sub_808C064(void)
{
    s8 input = Menu_ProcessInput();

    if (input == -2)
        return FALSE;
    if (input == -1)
    {
        CloseMenu();
        return TRUE;
    }
    gMenuCallback = gUnknown_Debug_083C0F79[input].func;
    return FALSE;
}

bool8 debug_sub_808C0A8(void)
{
    s8 input = Menu_ProcessInput();

    if (input == -2)
        return FALSE;
    if (input == -1)
    {
        CloseMenu();
        return TRUE;
    }
    gMenuCallback = gUnknown_Debug_083C0FFC[input].func;
    return FALSE;
}

bool8 debug_sub_808C0EC(void)
{
    ScriptContext1_SetupScript(DebugScript_081C1CFE);
    CloseMenu();
    return TRUE;
}

bool8 debug_sub_808C104(void)
{
    ScriptContext1_SetupScript(DebugScript_081C1D07);
    CloseMenu();
    return TRUE;
}

bool8 debug_sub_808C11C(void)
{
    ScriptContext1_SetupScript(DebugScript_081C1D1E);
    CloseMenu();
    return TRUE;
}

bool8 debug_sub_808C134(void)
{
    ScriptContext1_SetupScript(DebugScript_081C1D24);
    CloseMenu();
    return TRUE;
}

bool8 debug_sub_808C14C(void)
{
    ScriptContext1_SetupScript(DebugScript_081C1D2A);
    CloseMenu();
    return TRUE;
}

bool8 debug_sub_808C164(void)
{
    ScriptContext1_SetupScript(DebugScript_081C1D35);
    CloseMenu();
    return TRUE;
}

bool8 debug_sub_808C17C(void)
{
    ScriptContext1_SetupScript(DebugScript_081C1D46);
    CloseMenu();
    return TRUE;
}

bool8 debug_sub_808C194(void)
{
    ScriptContext1_SetupScript(DebugScript_081C221F);
    CloseMenu();
    return TRUE;
}

bool8 debug_sub_808C1AC(void)
{
    ScriptContext1_SetupScript(DebugScript_081C23E2);
    CloseMenu();
    return TRUE;
}

bool8 debug_sub_808C1C4(void)
{
    ScriptContext1_SetupScript(DebugScript_081C23E6);
    CloseMenu();
    return TRUE;
}

bool8 debug_sub_808C1DC(void)
{
    ScriptContext1_SetupScript(DebugScript_081C23F6);
    CloseMenu();
    return TRUE;
}

bool8 debug_sub_808C1F4(void)
{
    ScriptContext1_SetupScript(DebugScript_081C2482);
    CloseMenu();
    return TRUE;
}

bool8 debug_sub_808C20C(void)
{
    ScriptContext1_SetupScript(DebugScript_081C23FD);
    CloseMenu();
    return TRUE;
}

bool8 debug_sub_808C224(void)
{
    ScriptContext1_SetupScript(DebugScript_081C2518);
    CloseMenu();
    return TRUE;
}

bool8 debug_sub_808C23C(void)
{
    ScriptContext1_SetupScript(DebugScript_081C2507);
    CloseMenu();
    return TRUE;
}

bool8 TomomichiDebugMenu_ContestGraphics_Show(void)
{
    BeginNormalPaletteFade(0xffffffff, 0, 0, 16, 0);
    gMenuCallback = debug_sub_808C280;
    return FALSE;
}

bool8 debug_sub_808C280(void)
{
    if (!UpdatePaletteFade())
    {
        CloseMenu();
        debug_sub_808F168(0);
        SetMainCallback2(CB2_ContestPainting);
        gMain.savedCallback = debug_sub_808B868;
        return TRUE;
    }
    return FALSE;
}

bool8 TomomichiDebugMenu_MuseumGraphics_Show(void)
{
    BeginNormalPaletteFade(0xffffffff, 0, 0, 16, 0);
    gMenuCallback = debug_sub_808C2E4;
    return FALSE;
}

bool8 debug_sub_808C2E4(void)
{
    if (!UpdatePaletteFade())
    {
        CloseMenu();
        debug_sub_808F168(1);
        SetMainCallback2(CB2_ContestPainting);
        gMain.savedCallback = debug_sub_808B868;
        return TRUE;
    }
    return FALSE;
}

bool8 debug_sub_808C31C(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 28, 19);
    Menu_PrintItems(2, 1, ARRAY_COUNT(gUnknown_Debug_083C2828), gUnknown_Debug_083C2828);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C2828), 0, 27);
    gMenuCallback = debug_sub_808C36C;
    return FALSE;
}

bool8 debug_sub_808C36C(void)
{
    s8 input = Menu_ProcessInput();

    if (input == -2)
        return FALSE;
    if (input == -1)
    {
        CloseMenu();
        return TRUE;
    }
    gMenuCallback = gUnknown_Debug_083C2828[input].func;
    return FALSE;
}

bool8 debug_sub_808C3B0(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 29, 2 * ARRAY_COUNT(gUnknown_Debug_083C2938) + 1);
    Menu_PrintItems(2, 1, ARRAY_COUNT(gUnknown_Debug_083C2938), gUnknown_Debug_083C2938);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C2938), 0, 28);
    gDebug_0300070F = 0;
    gMenuCallback = debug_sub_808C6C8;
    return FALSE;
}

bool8 debug_sub_808C408(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 29, 2 * ARRAY_COUNT(gUnknown_Debug_083C2A48) + 1);
    Menu_PrintItems(2, 1, ARRAY_COUNT(gUnknown_Debug_083C2A48), gUnknown_Debug_083C2A48);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C2A48), 0, 28);
    gDebug_0300070F = 1;
    gMenuCallback = debug_sub_808C6C8;
    return FALSE;
}

bool8 debug_sub_808C460(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 29, 2 * ARRAY_COUNT(gUnknown_Debug_083C2B4C) + 1);
    Menu_PrintItems(2, 1, ARRAY_COUNT(gUnknown_Debug_083C2B4C), gUnknown_Debug_083C2B4C);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C2B4C), 0, 28);
    gDebug_0300070F = 2;
    gMenuCallback = debug_sub_808C6C8;
    return FALSE;
}

bool8 debug_sub_808C4B8(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 29, 2 * ARRAY_COUNT(gUnknown_Debug_083C2C80) + 1);
    Menu_PrintItems(2, 1, ARRAY_COUNT(gUnknown_Debug_083C2C80), gUnknown_Debug_083C2C80);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C2C80), 0, 28);
    gDebug_0300070F = 3;
    gMenuCallback = debug_sub_808C6C8;
    return FALSE;
}

bool8 debug_sub_808C510(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 29, 2 * ARRAY_COUNT(gUnknown_Debug_083C2D8C) + 1);
    Menu_PrintItems(2, 1, ARRAY_COUNT(gUnknown_Debug_083C2D8C), gUnknown_Debug_083C2D8C);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C2D8C), 0, 28);
    gDebug_0300070F = 4;
    gMenuCallback = debug_sub_808C6C8;
    return FALSE;
}

bool8 debug_sub_808C568(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 29, 2 * ARRAY_COUNT(gUnknown_Debug_083C2EB0) + 1);
    Menu_PrintItems(2, 1, ARRAY_COUNT(gUnknown_Debug_083C2EB0), gUnknown_Debug_083C2EB0);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C2EB0), 0, 28);
    gDebug_0300070F = 5;
    gMenuCallback = debug_sub_808C6C8;
    return FALSE;
}

bool8 debug_sub_808C5C0(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 29, 2 * ARRAY_COUNT(gUnknown_Debug_083C2FE0) + 1);
    Menu_PrintItems(2, 1, ARRAY_COUNT(gUnknown_Debug_083C2FE0), gUnknown_Debug_083C2FE0);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C2FE0), 0, 28);
    gDebug_0300070F = 6;
    gMenuCallback = debug_sub_808C6C8;
    return FALSE;
}

bool8 debug_sub_808C618(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 29, 2 * ARRAY_COUNT(gUnknown_Debug_083C3100) + 1);
    Menu_PrintItems(2, 1, ARRAY_COUNT(gUnknown_Debug_083C3100), gUnknown_Debug_083C3100);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C3100), 0, 28);
    gDebug_0300070F = 7;
    gMenuCallback = debug_sub_808C6C8;
    return FALSE;
}

bool8 debug_sub_808C670(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 29, 2 * 3 + 1);
    Menu_PrintItems(2, 1, 3, gUnknown_Debug_083C3194);
    InitMenu(0, 1, 1, 3, 0, 28);
    gDebug_0300070F = 8;
    gMenuCallback = debug_sub_808C6C8;
    return FALSE;
}

bool8 debug_sub_808C6C8(void)
{
    s8 input = Menu_ProcessInput();
    s8 cursorPos = Menu_GetCursorPos();

    debug_sub_808C714(gDebug_0300070F, cursorPos);
    debug_sub_808C764(gDebug_0300070F);
    if (input == -2)
        return FALSE;
    if (input == -1)
    {
        CloseMenu();
        return TRUE;
    }
    return FALSE;
}

void debug_sub_808C714(u8 whichMenu, u8 cursorPos)
{
    if (gMain.newKeys & R_BUTTON)
    {
        u16 flag = gUnknown_Debug_83C31E6[whichMenu][cursorPos];
        if (!FlagGet(flag))
            FlagSet(flag);
        else
            FlagClear(flag);
    }
}

void debug_sub_808C764(u8 whichMenu)
{
    u8 i;

    for (i = 0; i < gUnknown_Debug_083C31DC[whichMenu]; i++)
    {
        debug_sub_808F2E0(28, 2 * i + 1, FlagGet(gUnknown_Debug_83C31E6[whichMenu][i]) ? TRUE : FALSE);
    }
}

bool8 debug_sub_808C7C8(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 28, 19);
    Menu_PrintItems(2, 1, ARRAY_COUNT(gUnknown_Debug_083C1CE8), gUnknown_Debug_083C1CE8);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C1CE8), 0, 27);
    gMenuCallback = debug_sub_808C818;
    return FALSE;
}

bool8 debug_sub_808C818(void)
{
    s8 input = Menu_ProcessInput();

    if (input == -2)
        return FALSE;
    if (input == -1)
    {
        CloseMenu();
        return TRUE;
    }
    gMenuCallback = gUnknown_Debug_083C1CE8[input].func;
    return FALSE;
}

bool8 debug_sub_808C85C(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 29, 2 * ARRAY_COUNT(gUnknown_Debug_083C1E0C) + 1);
    Menu_PrintItems(2, 1, ARRAY_COUNT(gUnknown_Debug_083C1E0C), gUnknown_Debug_083C1E0C);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C1E0C), 0, 28);
    gDebug_0300070F = 0;
    gMenuCallback = debug_sub_808CB74;
    return FALSE;
}

bool8 debug_sub_808C8B4(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 29, 2 * ARRAY_COUNT(gUnknown_Debug_083C1F38) + 1);
    Menu_PrintItems(2, 1, ARRAY_COUNT(gUnknown_Debug_083C1F38), gUnknown_Debug_083C1F38);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C1F38), 0, 28);
    gDebug_0300070F = 1;
    gMenuCallback = debug_sub_808CB74;
    return FALSE;
}

bool8 debug_sub_808C90C(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 29, 2 * ARRAY_COUNT(gUnknown_Debug_083C206C) + 1);
    Menu_PrintItems(2, 1, ARRAY_COUNT(gUnknown_Debug_083C206C), gUnknown_Debug_083C206C);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C206C), 0, 28);
    gDebug_0300070F = 2;
    gMenuCallback = debug_sub_808CB74;
    return FALSE;
}

bool8 debug_sub_808C964(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 29, 2 * ARRAY_COUNT(gUnknown_Debug_083C2190) + 1);
    Menu_PrintItems(2, 1, ARRAY_COUNT(gUnknown_Debug_083C2190), gUnknown_Debug_083C2190);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C2190), 0, 28);
    gDebug_0300070F = 3;
    gMenuCallback = debug_sub_808CB74;
    return FALSE;
}

bool8 debug_sub_808C9BC(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 29, 2 * ARRAY_COUNT(gUnknown_Debug_083C2264) + 1);
    Menu_PrintItems(2, 1, ARRAY_COUNT(gUnknown_Debug_083C2264), gUnknown_Debug_083C2264);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C2264), 0, 28);
    gDebug_0300070F = 4;
    gMenuCallback = debug_sub_808CB74;
    return FALSE;
}

bool8 debug_sub_808CA14(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 29, 2 * ARRAY_COUNT(gUnknown_Debug_083C2370) + 1);
    Menu_PrintItems(2, 1, ARRAY_COUNT(gUnknown_Debug_083C2370), gUnknown_Debug_083C2370);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C2370), 0, 28);
    gDebug_0300070F = 5;
    gMenuCallback = debug_sub_808CB74;
    return FALSE;
}

bool8 debug_sub_808CA6C(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 29, 2 * ARRAY_COUNT(gUnknown_Debug_083C248C) + 1);
    Menu_PrintItems(2, 1, ARRAY_COUNT(gUnknown_Debug_083C248C), gUnknown_Debug_083C248C);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C248C), 0, 28);
    gDebug_0300070F = 6;
    gMenuCallback = debug_sub_808CB74;
    return FALSE;
}

bool8 debug_sub_808CAC4(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 29, 2 * ARRAY_COUNT(gUnknown_Debug_083C259C) + 1);
    Menu_PrintItems(2, 1, ARRAY_COUNT(gUnknown_Debug_083C259C), gUnknown_Debug_083C259C);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C259C), 0, 27);
    gDebug_0300070F = 7;
    gMenuCallback = debug_sub_808CB74;
    return FALSE;
}

bool8 debug_sub_808CB1C(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 29, 2 * ARRAY_COUNT(gUnknown_Debug_083C26C8) + 1);
    Menu_PrintItems(2, 1, ARRAY_COUNT(gUnknown_Debug_083C26C8), gUnknown_Debug_083C26C8);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C26C8), 0, 28);
    gDebug_0300070F = 8;
    gMenuCallback = debug_sub_808CB74;
    return FALSE;
}

#endif
