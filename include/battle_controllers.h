#ifndef GUARD_BATTLE_CONTROLLERS_H
#define GUARD_BATTLE_CONTROLLERS_H

#define RET_VALUE_LEVELLED_UP   11
enum
{
    REQUEST_ALL_BATTLE,
    REQUEST_SPECIES_BATTLE,
    REQUEST_HELDITEM_BATTLE,
    REQUEST_MOVES_PP_BATTLE,
    REQUEST_MOVE1_BATTLE,
    REQUEST_MOVE2_BATTLE,
    REQUEST_MOVE3_BATTLE,
    REQUEST_MOVE4_BATTLE,
    REQUEST_PP_DATA_BATTLE,
    REQUEST_PPMOVE1_BATTLE,
    REQUEST_PPMOVE2_BATTLE,
    REQUEST_PPMOVE3_BATTLE,
    REQUEST_PPMOVE4_BATTLE,
    REQUEST_UNUSED_13_BATTLE,
    REQUEST_UNUSED_14_BATTLE,
    REQUEST_UNUSED_15_BATTLE,
    REQUEST_UNUSED_16_BATTLE,
    REQUEST_OTID_BATTLE,
    REQUEST_EXP_BATTLE,
    REQUEST_HP_EV_BATTLE,
    REQUEST_ATK_EV_BATTLE,
    REQUEST_DEF_EV_BATTLE,
    REQUEST_SPEED_EV_BATTLE,
    REQUEST_SPATK_EV_BATTLE,
    REQUEST_SPDEF_EV_BATTLE,
    REQUEST_FRIENDSHIP_BATTLE,
    REQUEST_POKERUS_BATTLE,
    REQUEST_MET_LOCATION_BATTLE,
    REQUEST_MET_LEVEL_BATTLE,
    REQUEST_MET_GAME_BATTLE,
    REQUEST_POKEBALL_BATTLE,
    REQUEST_ALL_IVS_BATTLE,
    REQUEST_HP_IV_BATTLE,
    REQUEST_ATK_IV_BATTLE,
    REQUEST_DEF_IV_BATTLE,
    REQUEST_SPEED_IV_BATTLE,
    REQUEST_SPATK_IV_BATTLE,
    REQUEST_SPDEF_IV_BATTLE,
    REQUEST_PERSONALITY_BATTLE,
    REQUEST_CHECKSUM_BATTLE,
    REQUEST_STATUS_BATTLE,
    REQUEST_LEVEL_BATTLE,
    REQUEST_HP_BATTLE,
    REQUEST_MAX_HP_BATTLE,
    REQUEST_ATK_BATTLE,
    REQUEST_DEF_BATTLE,
    REQUEST_SPEED_BATTLE,
    REQUEST_SPATK_BATTLE,
    REQUEST_SPDEF_BATTLE,
    REQUEST_COOL_BATTLE,
    REQUEST_BEAUTY_BATTLE,
    REQUEST_CUTE_BATTLE,
    REQUEST_SMART_BATTLE,
    REQUEST_TOUGH_BATTLE,
    REQUEST_SHEEN_BATTLE,
    REQUEST_COOL_RIBBON_BATTLE,
    REQUEST_BEAUTY_RIBBON_BATTLE,
    REQUEST_CUTE_RIBBON_BATTLE,
    REQUEST_SMART_RIBBON_BATTLE,
    REQUEST_TOUGH_RIBBON_BATTLE,
};

enum
{
    CONTROLLER_GETMONDATA,
    CONTROLLER_GETRAWMONDATA,
    CONTROLLER_SETMONDATA,
    CONTROLLER_SETRAWMONDATA,
    CONTROLLER_LOADMONSPRITE,
    CONTROLLER_SWITCHINANIM,
    CONTROLLER_RETURNMONTOBALL,
    CONTROLLER_DRAWTRAINERPIC,
    CONTROLLER_TRAINERSLIDE,
    CONTROLLER_TRAINERSLIDEBACK,
    CONTROLLER_FAINTANIMATION,
    CONTROLLER_PALETTEFADE,
    CONTROLLER_SUCCESSBALLTHROWANIM,
    CONTROLLER_BALLTHROWANIM,
    CONTROLLER_PAUSE,
    CONTROLLER_MOVEANIMATION,
    CONTROLLER_PRINTSTRING,
    CONTROLLER_PRINTSTRINGPLAYERONLY,
    CONTROLLER_CHOOSEACTION,
    CONTROLLER_UNKNOWNYESNOBOX,
    CONTROLLER_CHOOSEMOVE,
    CONTROLLER_OPENBAG,
    CONTROLLER_CHOOSEPOKEMON,
    CONTROLLER_23,
    CONTROLLER_HEALTHBARUPDATE,
    CONTROLLER_EXPUPDATE,
    CONTROLLER_STATUSICONUPDATE,
    CONTROLLER_STATUSANIMATION,
    CONTROLLER_STATUSXOR,
    CONTROLLER_DATATRANSFER,
    CONTROLLER_DMA3TRANSFER,
    CONTROLLER_31,
    CONTROLLER_32,
    CONTROLLER_TWORETURNVALUES,
    CONTROLLER_CHOSENMONRETURNVALUE,
    CONTROLLER_ONERETURNVALUE,
    CONTROLLER_ONERETURNVALUE_DUPLICATE,
    CONTROLLER_37,
    CONTROLLER_38,
    CONTROLLER_39,
    CONTROLLER_40,
    CONTROLLER_HITANIMATION,
    CONTROLLER_42,
    CONTROLLER_EFFECTIVENESSSOUND,
    CONTROLLER_PLAYFANFAREORBGM,
    CONTROLLER_FAINTINGCRY,
    CONTROLLER_INTROSLIDE,
    CONTROLLER_INTROTRAINERBALLTHROW,
    CONTROLLER_DRAWPARTYSTATUSSUMMARY,
    CONTROLLER_HIDEPARTYSTATUSSUMMARY,
    CONTROLLER_ENDBOUNCE,
    CONTROLLER_SPRITEINVISIBILITY,
    CONTROLLER_BATTLEANIMATION,
    CONTROLLER_LINKSTANDBYMSG,
    CONTROLLER_RESETACTIONMOVESELECTION,
    CONTROLLER_55,
    /*new controllers should go here*/
    CONTROLLER_TERMINATOR_NOP,
    CONTROLLER_CMDS_COUNT
};

struct HpAndStatus
{
    u16 hp;
    u32 status;
};

struct DisableStruct;

// emitters
void HandleLinkBattleSetup(void);
void SetUpBattleVarsAndBirchPoochyena();
void sub_800B950(void);
void InitLinkBtlControllers(void);
void PrepareBufferDataTransferLink(u8 a, u16, u8 *c);
void TryReceiveLinkBattleData(void);
void BtlController_EmitGetMonData(u8 a, u8 b, u8 c);
void BtlController_EmitGetRawMonData(u8 a, u8 b, u8 c);
void BtlController_EmitLoadMonSprite(u8 a);
void BtlController_EmitSwitchInAnim(u8, u8, u8);
void BtlController_EmitReturnMonToBall(u8 a, u8 b);
void BtlController_EmitDrawTrainerPic(u8 a);
void BtlController_EmitTrainerSlide(u8 a);
void BtlController_EmitTrainerSlideBack(u8 a);
void BtlController_EmitFaintAnimation(u8 a);
void BtlController_EmitPaletteFade(u8 a);
void BtlController_EmitSuccessBallThrowAnim(u8 a);
void BtlController_EmitBallThrowAnim(u8 a, u8 b);
void BtlController_EmitMoveAnimation(u8 a, u16 b, u8 c, u16 d, s32 e, u8 f, struct DisableStruct *g);
void BtlController_EmitPrintString(u8 a, u16 b);
void BtlController_EmitPrintSelectionString(u8 a, u16 stringID);
void BtlController_EmitChooseAction(u8 a, u8 b, u16 c);
void BtlController_EmitChooseMove(u8 a, u8 b, u8 c, u8 *d);
void BtlController_EmitChooseItem(u8 a, u8 *b);
void BtlController_EmitChoosePokemon(u8 a, u8 b, u8 c, u8 d, u8 *e);
void BtlController_EmitCmd23(u8 a);
void BtlController_EmitHealthBarUpdate(u8 a, u16 b);
void BtlController_EmitExpUpdate(u8 a, u8 b, u16 c);
void BtlController_EmitStatusIconUpdate(u8 a, u32 b, u32 c);
void BtlController_EmitStatusAnimation(u8 a, u8 b, u32 c);
void BtlController_EmitStatusXor(u8 a, u8 b);
void BtlController_EmitDataTransfer(u8, u16, u8 *);
void BtlController_EmitTwoReturnValues(u8 a, u8 b, u16 c);
void BtlController_EmitChosenMonReturnValue(u8 a, u8 b, u8 *c);
void BtlController_EmitOneReturnValue(u8 a, u16 b);
void BtlController_EmitOneReturnValue_Duplicate(u8 a, u16 b);
void BtlController_EmitCmd37(u8 a);
void BtlController_EmitCmd38(u8 a, u8 b);
void BtlController_EmitCmd39(u8 a);
void BtlController_EmitCmd40(u8 a);
void BtlController_EmitHitAnimation(u8 a);
void BtlController_EmitCmd42(u8 a);
void BtlController_EmitPlaySE(u8 a, u16 b);
void BtlController_EmitPlayFanfareOrBGM(u8 a, u16 b);
void BtlController_EmitFaintingCry(u8 a);
void BtlController_EmitIntroSlide(u8 a, u8 b);
void BtlController_EmitIntroTrainerBallThrow(u8 a);
void BtlController_EmitDrawPartyStatusSummary(u8 a, struct HpAndStatus *hpAndStatus, u8 c); //0x30
void BtlController_EmitHidePartyStatusSummary(u8 a);
void BtlController_EmitEndBounceEffect(u8 a);
void BtlController_EmitSpriteInvisibility(u8 a, u8 b);
void BtlController_EmitBattleAnimation(u8 a, u8 b, u16 c);
void BtlController_EmitLinkStandbyMsg(u8 a, u8 b);
void BtlController_EmitResetActionMoveSelection(u8 a, u8 b);
void BtlController_EmitCmd55(u8 a, u8 b);

#endif // GUARD_BATTLE_CONTROLLERS_H
