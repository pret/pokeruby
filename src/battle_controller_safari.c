#include "global.h"
#include "battle_anim_81258BC.h"
#include "battle.h"
#include "battle_message.h"
#include "menu_cursor.h"
#include "text.h"

extern struct Window gUnknown_03004210;
extern u8 gDisplayedStringBattle[];
extern u8 gActionSelectionCursor[];

extern const u8 gUnknown_08400CBB[];
extern u8 gActiveBank;
extern const u8 gUnknown_08400D15[];

extern void *gBattleBankFunc[];
extern u16 gUnknown_030042A0;
extern u16 gUnknown_030042A4;

#if ENGLISH
#define SUB_812BB10_TILE_DATA_OFFSET 440
#elif GERMAN
#define SUB_812BB10_TILE_DATA_OFFSET 444
#endif

// this file's functions
void SafariHandleGetAttributes(void);
void SafariHandlecmd1(void);
void SafariHandleSetAttributes(void);
void SafariHandlecmd3(void);
void SafariHandleLoadPokeSprite(void);
void SafariHandleSendOutPoke(void);
void SafariHandleReturnPokeToBall(void);
void SafariHandleTrainerThrow(void);
void SafariHandleTrainerSlide(void);
void SafariHandleTrainerSlideBack(void);
void SafariHandlecmd10(void);
void SafariHandlecmd11(void);
void SafariHandlecmd12(void);
void SafariHandleBallThrow(void);
void SafariHandlePuase(void);
void SafariHandleMoveAnimation(void);
void SafariHandlePrintString(void);
void SafariHandlePrintStringPlayerOnly(void);
void SafariHandlecmd18(void);
void SafariHandlecmd19(void);
void SafariHandlecmd20(void);
void SafariHandleOpenBag(void);
void SafariHandlecmd22(void);
void SafariHandlecmd23(void);
void SafariHandleHealthBarUpdate(void);
void SafariHandleExpBarUpdate(void);
void SafariHandleStatusIconUpdate(void);
void SafariHandleStatusAnimation(void);
void SafariHandleStatusXor(void);
void SafariHandlecmd29(void);
void SafariHandleDMATransfer(void);
void SafariHandlecmd31(void);
void SafariHandlecmd32(void);
void SafariHandlecmd33(void);
void SafariHandlecmd34(void);
void SafariHandlecmd35(void);
void SafariHandlecmd36(void);
void SafariHandlecmd37(void);
void SafariHandlecmd38(void);
void SafariHandlecmd39(void);
void SafariHandlecmd40(void);
void SafariHandleHitAnimation(void);
void SafariHandlecmd42(void);
void SafariHandleEffectivenessSound(void);
void SafariHandlecmd44(void);
void SafariHandleFaintingCry(void);
void SafariHandleIntroSlide(void);
void SafariHandleTrainerBallThrow(void);
void SafariHandlecmd48(void);
void SafariHandlecmd49(void);
void SafariHandlecmd50(void);
void SafariHandleSpriteInvisibility(void);
void SafariHandleBattleAnimation(void);
void SafariHandleLinkStandbyMsg(void);
void SafariHandleResetActionMoveSelection(void);
void SafariHandlecmd55(void);
void SafariHandlecmd56(void);

// const data
typedef void (*BattleBufferCmd) (void);
const BattleBufferCmd gSafariBufferCommands[] =
{
    SafariHandleGetAttributes,
    SafariHandlecmd1,
    SafariHandleSetAttributes,
    SafariHandlecmd3,
    SafariHandleLoadPokeSprite,
    SafariHandleSendOutPoke,
    SafariHandleReturnPokeToBall,
    SafariHandleTrainerThrow,
    SafariHandleTrainerSlide,
    SafariHandleTrainerSlideBack,
    SafariHandlecmd10,
    SafariHandlecmd11,
    SafariHandlecmd12,
    SafariHandleBallThrow,
    SafariHandlePuase,
    SafariHandleMoveAnimation,
    SafariHandlePrintString,
    SafariHandlePrintStringPlayerOnly,
    SafariHandlecmd18,
    SafariHandlecmd19,
    SafariHandlecmd20,
    SafariHandleOpenBag,
    SafariHandlecmd22,
    SafariHandlecmd23,
    SafariHandleHealthBarUpdate,
    SafariHandleExpBarUpdate,
    SafariHandleStatusIconUpdate,
    SafariHandleStatusAnimation,
    SafariHandleStatusXor,
    SafariHandlecmd29,
    SafariHandleDMATransfer,
    SafariHandlecmd31,
    SafariHandlecmd32,
    SafariHandlecmd33,
    SafariHandlecmd34,
    SafariHandlecmd35,
    SafariHandlecmd36,
    SafariHandlecmd37,
    SafariHandlecmd38,
    SafariHandlecmd39,
    SafariHandlecmd40,
    SafariHandleHitAnimation,
    SafariHandlecmd42,
    SafariHandleEffectivenessSound,
    SafariHandlecmd44,
    SafariHandleFaintingCry,
    SafariHandleIntroSlide,
    SafariHandleTrainerBallThrow,
    SafariHandlecmd48,
    SafariHandlecmd49,
    SafariHandlecmd50,
    SafariHandleSpriteInvisibility,
    SafariHandleBattleAnimation,
    SafariHandleLinkStandbyMsg,
    SafariHandleResetActionMoveSelection,
    SafariHandlecmd55,
    SafariHandlecmd56,
};
// code

void SafariHandlecmd18(void) {
    int i;

    gUnknown_030042A4 = 0;
    gUnknown_030042A0 = 160;
    gUnknown_03004210.paletteNum = 0;
    FillWindowRect_DefaultPalette(&gUnknown_03004210, 10, 2, 15, 27, 18);
    FillWindowRect_DefaultPalette(&gUnknown_03004210, 10, 2, 35, 16, 36);
    gBattleBankFunc[gActiveBank] = bx_battle_menu_t6_2;

    InitWindow(&gUnknown_03004210, gUnknown_08400D15, 400, 18, 35);
    sub_8002F44(&gUnknown_03004210);
    sub_814A5C0(0, 0xFFFF, 12, 11679, 0);

    for (i = 0; i < 4; i++)
    {
        nullsub_8(i);
    }

    sub_802E3E4(gActionSelectionCursor[gActiveBank], 0);
    StrCpyDecodeToDisplayedStringBattle((u8 *) gUnknown_08400CBB);

    InitWindow(&gUnknown_03004210, gDisplayedStringBattle, SUB_812BB10_TILE_DATA_OFFSET, 2, 35);
    sub_8002F44(&gUnknown_03004210);
}
