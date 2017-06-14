#ifndef GUARD_NAMINGSCREEN_H
#define GUARD_NAMINGSCREEN_H

#include "main.h"

#define KBEVENT_NONE 0
#define KBEVENT_PRESSED_A 5
#define KBEVENT_PRESSED_B 6
#define KBEVENT_PRESSED_SELECT 8
#define KBEVENT_PRESSED_START 9

enum
{
    NAMING_SCREEN_TEMPLATE_PLAYER_NAME,
    NAMING_SCREEN_TEMPLATE_BOX_NAME,
    NAMING_SCREEN_TEMPLATE_MON_NAME,
};

struct NamingScreenTemplate
{
    u8 unk0;
    u8 maxChars;
    u8 unk2;
    u8 unk3;
    u8 unk4;  //mode?
    u8 unk5;
    u8 unk6;
    u8 unk7;
    const u8 *title;
};

struct NamingScreenData
{
 /*0x00*/ u8 state;
 /*0x01*/ u8 templateNum;
 /*0x02*/ u16 unk2;
 /*0x04*/ u16 bg1vOffset;
 /*0x06*/ u16 bg2vOffset;
 /*0x08*/ u16 unk8;
 /*0x0A*/ u16 unkA;
 /*0x0C*/ u8 unkC;
 /*0x0D*/ u8 unkD;
 /*0x0E*/ u8 currentPage;
 /*0x0F*/ u8 cursorSpriteId;
 /*0x10*/ u8 unk10;
 /*0x11*/ u8 textBuffer[0x10];
 /*0x21*/ u8 filler21[0x13];
            const struct NamingScreenTemplate *template;
 /*0x38*/ u8 *destBuffer;
 /*0x3C*/ u16 unk3C;  //savedKeyRepeatStartDelay
 /*0x3E*/ u16 unk3E;
 /*0x40*/ u16 unk40;
 /*0x42*/ u32 unk42;
 /*0x46*/ MainCallback returnCallback;
};

enum
{
    PAGE_UPPER,
    PAGE_LOWER,
    PAGE_OTHERS,
};

enum
{
    MAIN_STATE_BEGIN_FADE_IN,
    MAIN_STATE_WAIT_FADE_IN,
    MAIN_STATE_HANDLE_INPUT,
    MAIN_STATE_MOVE_TO_OK_BUTTON,
    MAIN_STATE_START_PAGE_SWAP,
    MAIN_STATE_WAIT_PAGE_SWAP,
    MAIN_STATE_6,
    MAIN_STATE_UPDATE_SENT_TO_PC_MESSAGE,
    MAIN_STATE_BEGIN_FADE_OUT,
};

enum
{
    INPUT_STATE_DISABLED,
    INPUT_STATE_ENABLED,
};

void DoNamingScreen(u8 r0, u8 *r1, u16 r2, u16 r3, u32 s0, MainCallback s4);

#endif
