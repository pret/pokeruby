#ifndef GUARD_DEBUG_H
#define GUARD_DEBUG_H

struct UnkDebugMenu3Items {
    const u8 * text;
    size_t (*func)(u8 * dest);
};

// start_menu_debug
void DebugMenu_8077048(void);

// matsuda_debug_menu
void sub_80AAF30(void);
void Crash(const u8 *text);
bool8 unref_sub_80A9B28(void);

// tomomichi_debug_menu
void debug_nullsub_66(void);

// sound_check_menu
void CB2_StartSoundCheckMenu(void);

// nakamura_debug_menu
void NakaGenderTest(void);

// unk debug menu 3
extern const u8 gUnknown_Debug_842E350;
extern const struct UnkDebugMenu3Items gUnknown_Debug_842E2D0[];

// unknown debug menu
int unref_sub_814A414(void);

// kagaya_debug_menu
bool8 InitKagayaDebugMenu_A(void);

// nohara_debug_menu
bool8 InitNoharaDebugMenu(void);

// watanabe_debug_menu
void InitWatanabeDebugMenu(void);
void InitSizeComparison(void);

#endif // GUARD_DEBUG_H
