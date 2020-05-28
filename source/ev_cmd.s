@===================================================================
@
@	スクリプトコマンドテーブル定義
@
@	_2001_08_24 by tama
@
@===================================================================


@----------------------------------------------------------
@
@	スクリプトコマンド定義用のマクロ宣言
@
@----------------------------------------------------------
	.MACRO	INIT_CMD
.IFDEF	EV_CMD_S_GLOBAL
	.ALIGN
.ENDIF
DEF_CMD_COUNT	=	0
	.ENDM

	.MACRO	DEF_CMD	symname , funcname

.IFDEF	EV_CMD_S_GLOBAL			@ 唯一の個所でしかテーブルは生成しない
.WORD	\funcname
.ENDIF
\symname	=	DEF_CMD_COUNT
DEF_CMD_COUNT 	=	(DEF_CMD_COUNT + 1)

	.ENDM

	.MACRO	DEF_CMD_LABEL	label
.IFDEF	EV_CMD_S_GLOBAL
	.GLOBAL	\label
\label:
.ENDIF
	.ENDM

@----------------------------------------------------------
@	スクリプトコマンド定義テーブル
@----------------------------------------------------------
@	.GLOBAL	ScriptCommand		@ 関数テーブルシンボル
@	.GLOBAL	ScriptCommandEnd	@ コマンドの最後をさす

	INIT_CMD

	DEF_CMD_LABEL	ScriptCommand

	DEF_CMD	EVCMD_NOP			,EvCmdNop
	DEF_CMD	EVCMD_DUMMY			,EvCmdDummy
	DEF_CMD	EVCMD_END			,EvCmdEnd

	DEF_CMD	EVCMD_RET			,EvCmdRet
	DEF_CMD	EVCMD_GLOBAL_CALL	,EvCmdGlobalCall
	DEF_CMD	EVCMD_GLOBAL_JUMP	,EvCmdGlobalJump
	DEF_CMD	EVCMD_IFJUMP		,EvCmdIfJump
	DEF_CMD	EVCMD_IFCALL		,EvCmdIfCall

	DEF_CMD	EVCMD_JUMPID		,EvCmdJumpID
	DEF_CMD	EVCMD_CALLID		,EvCmdCallID
	DEF_CMD	EVCMD_IFJUMPID		,EvCmdIfJumpID
	DEF_CMD	EVCMD_IFCALLID		,EvCmdIfCallID
	DEF_CMD	EVCMD_CHG_SCRIPT	,EvCmdChangeScript
	DEF_CMD	EVCMD_CLR_EXSCRIPT	,EvCmdClearExScript
	DEF_CMD	EVCMD_SET_EXERROR	,EvCmdSetExDataError

	DEF_CMD EVCMD_LD_REG_WDATA	,EvCmdLoadRegWData
	DEF_CMD	EVCMD_LD_REG_VAL	,EvCmdLoadRegValue
	DEF_CMD	EVCMD_LD_ADR_VAL	,EvCmdLoadAdrsValue
	DEF_CMD	EVCMD_LD_REG_ADR	,EvCmdLoadRegAdrs
	DEF_CMD	EVCMD_LD_ADR_REG	,EvCmdLoadAdrsReg
	DEF_CMD	EVCMD_LD_REG_REG	,EvCmdLoadRegReg
	DEF_CMD	EVCMD_LD_ADR_ADR	,EvCmdLoadAdrsAdrs
	DEF_CMD	EVCMD_LD_WK_VAL		,EvCmdLoadWkValue
	DEF_CMD	EVCMD_WK_ADD		,EvCmdWkAdd			@01/10/15 nohara
	DEF_CMD	EVCMD_WK_SUB		,EvCmdWkSub			@02/07/17 nohara
	DEF_CMD	EVCMD_LD_WK_WK		,EvCmdLoadWkWk
	DEF_CMD	EVCMD_LD_WK_WKVAL	,EvCmdLoadWkWkValue	@01/10/19 nohara

	DEF_CMD	EVCMD_CP_REG_REG	,EvCmdCmpRegReg
	DEF_CMD	EVCMD_CP_REG_VAL	,EvCmdCmpRegValue
	DEF_CMD	EVCMD_CP_REG_ADR	,EvCmdCmpRegAdrs
	DEF_CMD	EVCMD_CP_ADR_REG	,EvCmdCmpAdrsReg
	DEF_CMD	EVCMD_CP_ADR_VAL	,EvCmdCmpAdrsValue
	DEF_CMD	EVCMD_CP_ADR_ADR	,EvCmdCmpAdrsAdrs
	DEF_CMD	EVCMD_CP_WK_VAL		,EvCmdCmpWkValue
	DEF_CMD	EVCMD_CP_WK_WK		,EvCmdCmpWkWk

	DEF_CMD	EVCMD_SUBROUTINE	,EvCmdSubroutine				
	DEF_CMD	EVCMD_SETWAITSUB	,EvCmdSetWaitRoutine 
	DEF_CMD	EVCMD_PROGRAM		,EvCmdProgram
	DEF_CMD	EVCMD_FUNCCALL		,EvCmdFunctionCall
	DEF_CMD	EVCMD_STOPSCRIPT	,EvCmdStopScript
	DEF_CMD	EVCMD_TIMEWAIT		,EvCmdTimeWait

	DEF_CMD	EVCMD_FLAGSET		,EvCmdFlagSet
	DEF_CMD	EVCMD_FLAGRESET		,EvCmdFlagReset
	DEF_CMD	EVCMD_FLAGCHECK		,EvCmdFlagCheck

	DEF_CMD	EVCMD_SET_TIME		,EvCmdSetGameTime
	DEF_CMD	EVCMD_UPDATE_TIME	,EvCmdUpdateGameTime
	DEF_CMD	EVCMD_GET_TIME		,EvCmdGetGameTime
	DEF_CMD	EVCMD_SET_SE		,EvCmdSetSE
	DEF_CMD	EVCMD_SE_WAIT		,EvCmdSEWait
	DEF_CMD	EVCMD_SET_JINGLE	,EvCmdSetJingle
	DEF_CMD	EVCMD_JINGLE_WAIT	,EvCmdJingleWait
	DEF_CMD	EVCMD_BGM_SET		,EvCmdBGMSet
	DEF_CMD	EVCMD_BGM_SP_SET	,EvCmdBGMSpecialSet
	DEF_CMD	EVCMD_BGM_NOW_SET	,EvCmdBGMNowSet
	DEF_CMD	EVCMD_BGM_FADE_CHG	,EvCmdBGMFadeChg
	DEF_CMD	EVCMD_BGM_FADEOUT	,EvCmdBGMFadeOut
	DEF_CMD	EVCMD_BGM_FADEIN	,EvCmdBGMFadeIn
	DEF_CMD	EVCMD_MAP_CHANGE	,EvCmdMapChange
	DEF_CMD	EVCMD_MAP_CHG_SENOT	,EvCmdMapChangeSeNot
	DEF_CMD	EVCMD_DOORMAP_CHANGE,EvCmdDoorMapChange
	DEF_CMD EVCMD_MAP_CHG_FALL	,EvCmdMapChangeFall
	DEF_CMD EVCMD_MAP_CHG_WARP	,EvCmdMapChangeWarp
	DEF_CMD	EVCMD_SET_MAP_CHG	,EvCmdSetMapChangePos
	DEF_CMD EVCMD_SETSPMAPID	,EvCmdSetSPMapID
	DEF_CMD EVCMD_SETDIVINGID	,EvCmdSetDivingMapID
	DEF_CMD EVCMD_SETPITFALLID	,EvCmdSetPitfallMapID
	DEF_CMD	EVCMD_GET_MAPPOS	,EvCmdGetMapPosition
	DEF_CMD	EVCMD_GETTEMOTINUM	,EvCmdGetTemotiNum

	DEF_CMD	EVCMD_ADDITEM		,EvCmdAddItem
	DEF_CMD	EVCMD_SUBITEM		,EvCmdSubItem
	DEF_CMD	EVCMD_ADDITEMCHK	,EvCmdAddItemChk
	DEF_CMD	EVCMD_CHECKITEM		,EvCmdCheckItem
	DEF_CMD	EVCMD_GETPOCKETNO	,EvCmdGetPocketNo
	DEF_CMD	EVCMD_ADDBOXITEM	,EvCmdAddPCBoxItem
	DEF_CMD	EVCMD_CHECKBOXITEM	,EvCmdCheckPCBoxItem

	DEF_CMD	EVCMD_ADDGOODS		,EvCmdAddGoods
	DEF_CMD	EVCMD_SUBGOODS		,EvCmdSubGoods
	DEF_CMD	EVCMD_CHECKGOODS	,EvCmdCheckGoods
	DEF_CMD	EVCMD_ADDGOODSCHK	,EvCmdAddGoodsChk

	DEF_CMD	EVCMD_OBJANIME		,EvCmdObjAnime
	DEF_CMD	EVCMD_OBJANIMESP	,EvCmdObjAnimeSP
	DEF_CMD	EVCMD_OBJANIMEWAIT	,EvCmdObjAnimeWait
	DEF_CMD	EVCMD_OBJANIMEWAITSP,EvCmdObjAnimeWaitSP
	DEF_CMD	EVCMD_OBJDEL		,EvCmdObjDel
	DEF_CMD	EVCMD_OBJDELSP		,EvCmdObjDelSP
	DEF_CMD	EVCMD_OBJAPPEAR		,EvCmdObjAppear
	DEF_CMD	EVCMD_OBJAPPEARSP	,EvCmdObjAppearSP
	DEF_CMD	EVCMD_OBJ_POSCHG	,EvCmdObjPosChg
	DEF_CMD	EVCMD_OBJ_VISIBLE	,EvCmdObjSetVisible
	DEF_CMD	EVCMD_OBJ_INVISIBLE	,EvCmdObjSetInvisible
	DEF_CMD	EVCMD_OBJ_TO_HERO	,EvCmdObjSiteToHero
	DEF_CMD	EVCMD_OBJSITECHG	,EvCmdObjSiteChg

	DEF_CMD	EVCMD_TRAINERSET	,EvCmdTrainerDataSet
	DEF_CMD	EVCMD_TRAINERFIGHT	,EvCmdTrainerFightStart
	DEF_CMD	EVCMD_TRAINERAFTER	,EvCmdTrainerAfterScript
	DEF_CMD	EVCMD_TRN_END_SCRIPT,EvCmdTrainerBattleEndScript
	DEF_CMD	EVCMD_TRN_FLAG_CHK	,EvCmdTrainerFlagCheck
	DEF_CMD	EVCMD_TRN_FLAG_SET	,EvCmdTrainerFlagSet
	DEF_CMD	EVCMD_TRN_FLAG_RESET,EvCmdTrainerFlagReset

	DEF_CMD	EVCMD_SXYPOS_CHG	,EvCmdSxyPosChange
	DEF_CMD	EVCMD_SXYPOS_OWRITE	,EvCmdSxyPosOverWrite
	DEF_CMD	EVCMD_SXYSITE_CHG	,EvCmdSxySiteChange
	DEF_CMD	EVCMD_TALKWAIT		,EvCmdTalkWait
	DEF_CMD	EVCMD_TALKMSG		,EvCmdTalkMsg
	DEF_CMD	EVCMD_TALKCLOSE		,EvCmdTalkWinClose
	DEF_CMD	EVCMD_TALKSTART		,EvCmdTalkStart
	DEF_CMD	EVCMD_TALKOBJSTART	,EvCmdTalkObjStart
	DEF_CMD	EVCMD_TALKEND		,EvCmdTalkEnd
	DEF_CMD	EVCMD_TALKOBJEND	,EvCmdTalkObjEnd

	DEF_CMD	EVCMD_ABKEY_WAIT	,EvCmdABKeyWait
	DEF_CMD	EVCMD_YESNOWIN		,EvCmdYesNoWin
	DEF_CMD	EVCMD_SELECTWIN		,EvCmdSelectWin
	DEF_CMD	EVCMD_SELECTWINCSR	,EvCmdSelectWinCsr
	DEF_CMD	EVCMD_HVWIN			,EvCmdHVWin
	DEF_CMD	EVCMD_WINWRITE		,EvCmdWinWrite
	DEF_CMD	EVCMD_WINCLEAR		,EvCmdWinClear
	DEF_CMD	EVCMD_MENUWRITE		,EvCmdSelectMenu
	DEF_CMD	EVCMD_POKECGWRITE	,EvCmdPokeCGWinOpen
	DEF_CMD	EVCMD_POKECGERASE	,EvCmdPokeCGWinErase
	DEF_CMD	EVCMD_PUTPORTRAIT	,EvCmdPutPortrait
	DEF_CMD	EVCMD_TENJIMSGPUT	,EvCmdTenjiMsgPut

	DEF_CMD	EVCMD_ADDPOKE		,EvCmdAddPokemon
	DEF_CMD	EVCMD_ADDTAMAGO		,EvCmdAddTamago			// matsuda 2002.08.13(火)
	DEF_CMD	EVCMD_PM_WAZA_CHANGE,EvCmdPokeWazaChange
	DEF_CMD EVCMD_PM_WAZA_CHECK ,EvCmdPokeWazaCheck		// 2002/01/23 by nakahiro
	DEF_CMD	EVCMD_GETMONSNAME	,EvCmdGetMonsName
	DEF_CMD	EVCMD_GETTEMOTIMONSNAME,EvCmdGetTemotiMonsName
	DEF_CMD	EVCMD_GETNICKNAME	,EvCmdGetNickName
	DEF_CMD	EVCMD_GETITEMNAME	,EvCmdGetItemName
	DEF_CMD	EVCMD_GETGOODSNAME	,EvCmdGetGoodsName
	DEF_CMD	EVCMD_GETWAZANAME	,EvCmdGetWazaName
	DEF_CMD	EVCMD_GETNUMMSG		,EvCmdGetNumMsg
	DEF_CMD	EVCMD_SETBUF		,EvCmdSetBuf
	DEF_CMD	EVCMD_COPYBUF		,EvCmdCopyBuf

	DEF_CMD	EVCMD_SHOPSTART		,EvCmdShopStart
	DEF_CMD	EVCMD_GD_SHOPSTART	,EvCmdGoodsShopStart
	DEF_CMD	EVCMD_FL_SHOPSTART	,EvCmdFlowerShopStart
	DEF_CMD	EVCMD_SLOTMACHINE	,EvCmdSlotMachine
	DEF_CMD	EVCMD_SET_SEED		,EvCmdSetSeed

	DEF_CMD	EVCMD_CONPOKELIST	,EvCmdConPokeList
	DEF_CMD	EVCMD_CONNIJICALL	,EvCmdConNijiCall
	DEF_CMD	EVCMD_CONRESULTSCR	,EvCmdConResultScr
	DEF_CMD	EVCMD_CONTUUSININIT	,EvCmdConTuusinInit

	DEF_CMD	EVCMD_GETRND		,EvCmdGetRand
	DEF_CMD	EVCMD_ADDGOLD		,EvCmdAddGold
	DEF_CMD	EVCMD_SUBGOLD		,EvCmdSubGold
	DEF_CMD	EVCMD_COMPGOLD		,EvCmdCompGold
	DEF_CMD	EVCMD_GOLDWINWRITE	,EvCmdGoldWinWrite
	DEF_CMD	EVCMD_GOLDWINDEL	,EvCmdGoldWinDel
	DEF_CMD	EVCMD_GOLDWRITE		,EvCmdGoldWrite

	DEF_CMD	EVCMD_CMEVENTSTARTCHK,EvCmdCMEventStartChk

	DEF_CMD	EVCMD_FIELDFADE		,EvCmdFieldFade
	DEF_CMD	EVCMD_FIELDFADEWAIT	,EvCmdFieldFadeWait
	DEF_CMD	EVCMD_CHG_BRIGHT	,EvCmdChangeBrightValue
	DEF_CMD	EVCMD_BRIGHT_EFF	,EvCmdChangeBrightCircle

	DEF_CMD	EVCMD_SYSTALKMSG	,EvCmdSysTalkMsg

	DEF_CMD	EVCMD_SETFLDEFF		,EvCmdSetFldEff
	DEF_CMD	EVCMD_SETFEWORK		,EvCmdSetFEWork		// 2002/01/24 by nakahiro
	DEF_CMD	EVCMD_FLDEFFWAIT	,EvCmdFldEffWait

	DEF_CMD	EVCMD_SETWARPID		,EvCmdSetWarpID

	DEF_CMD	EVCMD_GETMYSEX		,EvCmdGetMySex
	DEF_CMD	EVCMD_VOICEPLAY		,EvCmdVoicePlay

	DEF_CMD	EVCMD_SETCELL		,EvCmdSetCell

	DEF_CMD	EVCMD_INIT_WEATHER	,EvCmdInitWeather
	DEF_CMD	EVCMD_SET_WEATHER	,EvCmdSetWeather
	DEF_CMD	EVCMD_UPDATE_WEATHER,EvCmdUpdateWeather
	DEF_CMD EVCMD_SET_MAPEFFECT	,EvCmdSetMapEffect
	DEF_CMD	EVCMD_CHG_MAPSCREEN	,EvCmdChangeMapScreen

	DEF_CMD	EVCMD_OBJPRICHG		,EvCmdObjPriChg
	DEF_CMD	EVCMD_OBJPRIOFF		,EvCmdObjPriOff

	DEF_CMD	EVCMD_OBJDMYACTADD	,EvCmdObjDmyActAdd
	DEF_CMD	EVCMD_OBJDMYSITECHG	,EvCmdObjDmySiteChg

	DEF_CMD	EVCMD_OPENDOORANIME	,EvCmdOpenDoorAnime
	DEF_CMD	EVCMD_CLOSEDOORANIME,EvCmdCloseDoorAnime
	DEF_CMD	EVCMD_DOORANIMEWAIT	,EvCmdDoorAnimeWait
	DEF_CMD	EVCMD_OPENDOORSET	,EvCmdOpenDoorSet
	DEF_CMD	EVCMD_CLOSEDOORSET	,EvCmdCloseDoorSet

	DEF_CMD	EVCMD_ELEVATORSET	,EvCmdElevatorSet
	DEF_CMD	EVCMD_ELEVATORSTART	,EvCmdElevatorStart

	DEF_CMD	EVCMD_CHECKCOIN		,EvCmdCheckCoin		@ 2002/07/03 by nakahiro
	DEF_CMD	EVCMD_ADDCOIN		,EvCmdAddCoin
	DEF_CMD	EVCMD_SUBCOIN		,EvCmdSubCoin

	DEF_CMD	EVCMD_SET_WILDFIGHT	,EvCmdWildFightSet
	DEF_CMD	EVCMD_START_WILDFIGHT, EvCmdWildFightStart

	DEF_CMD	EVCMD_SET_RELADRS	,EvCmdSetRelativeAdrs
	DEF_CMD	EVCMD_JUMPR			,EvCmdJumpRelative
	DEF_CMD	EVCMD_CALLR			,EvCmdCallRelative
	DEF_CMD	EVCMD_IFJUMPR		,EvCmdIfJumpRelative
	DEF_CMD	EVCMD_IFCALLR		,EvCmdIfCallRelative
	DEF_CMD	EVCMD_TALKMSG_REL	,EvCmdTalkMsgRelative
	DEF_CMD EVCMD_EXPANDMSG_REL	,EvCmdExpandMsgRelative
	DEF_CMD	EVCMD_COPYBUF_REL	,EvCmdCopyBufRelative

	DEF_CMD	EVCMD_COINWINWRITE  ,EvCmdCoinWinWrite
	DEF_CMD	EVCMD_COINWINDEL	,EvCmdCoinWinDel
	DEF_CMD	EVCMD_COINWRITE		,EvCmdCoinWrite
	DEF_CMD	EVCMD_INC_RECORD	,EvCmdIncRecord

	DEF_CMD EVCMD_SET_ESCMAPID	,EvCmdSetEscapeMapID

	DEF_CMD	EVCMD_VOICE_WAIT	,EvCmdVoicePlayWait

	DEF_CMD_LABEL		ScriptCommandEnd

	DEF_CMD	EVCMD_NOTHING		,EvCmdNop




@===================================================================
@
@===================================================================
@----------------------------------------------------------
@	イベントラベルの宣言
@----------------------------------------------------------
.MACRO	EVENT_LABEL	label
	.GLOBAL	\label
\label:
.ENDM

@----------------------------------------------------------
@	スクリプト開始宣言
@----------------------------------------------------------
@---------------------------------------------
@---------------------------------------------
@スクリプトヘッダデータ記述
.MACRO	EVENT_DATA_START	label,flag
	EVENT_LABEL	\label
	.short	\flag
.ENDM

@スクリプトヘッダデータ終了
.MACRO	EVENT_DATA_END
	.byte	HEAD_NO_WORK
.ENDM

@---------------------------------------------
@	特殊スクリプト記述：ＢＧ書き換え
@	※仮想マップ構築のタイミングで呼ばれている
@---------------------------------------------
.MACRO	BG_CHANGE_LABEL	script
	.byte	HEAD_BG_CHANGE
	.word	\script
.ENDM

@---------------------------------------------
@	特殊スクリプト記述：シーンスクリプト起動
@	※常時条件を監視している。
@---------------------------------------------
.MACRO	SP_SCRIPT_LABEL	adr
	.byte	HEAD_SCENE_CHK
	.word	\adr
.ENDM

@シーンスクリプト起動条件記述
@ wk == num の場合、labelのスクリプトを起動する
.MACRO	SP_SCRIPT_DATA	wk,num,label
	.short	\wk
	.short	\num
	.word	\label
.ENDM

@シーンスクリプト記述終了
.MACRO	SP_SCRIPT_END
	.short	0
.ENDM

@---------------------------------------------
@	特殊スクリプト記述：フラグ操作
@	※マップ遷移タイミングで一度だけ呼ばれる
@---------------------------------------------
.MACRO	FLAG_CHANGE_LABEL	script
	.byte	HEAD_FLAG_CTRL
	.word	\script
.ENDM

@---------------------------------------------
@	特殊スクリプト記述：フラグ操作
@	※フィールド初期化時に毎回呼ばれる
@---------------------------------------------
.MACRO	INIT_CTRL_LABEL	script
	.byte	HEAD_INIT_CTRL
	.word	\script
.ENDM

@---------------------------------------------
@	特殊スクリプト記述：リンク操作
@	現状、ダイビング接続の特殊制御のみで使用
@---------------------------------------------
.MACRO	LINK_CTRL_LABEL	script
	.byte	HEAD_LINK_CTRL
	.word	\script
.ENDM

@---------------------------------------------
@	特殊スクリプト記述：ＯＢＪ操作
@	※マップ遷移タイミングで一度だけ呼ばれる
@---------------------------------------------
.MACRO	OBJ_CTRL_LABEL	adr
	.byte	HEAD_OBJ_CTRL
	.word	\adr
.ENDM

@ＯＢＪ制御スクリプト起動条件記述
@ wk == num の場合、labelのスクリプトを起動する
.MACRO	OBJ_CTRL_DATA	wk,num,label
	.short	\wk
	.short	\num
	.word	\label
.ENDM

@ＯＢＪ制御スクリプト記述終了
.MACRO	OBJ_CTRL_END
	.short	0
.ENDM


@----------------------------------------------------------
@	スクリプト用ラベル宣言
@----------------------------------------------------------
.MACRO	SCRIPT_LABEL	label
	EVENT_LABEL \label
.ENDM

@----------------------------------------------------------
@	隠しアイテムのフラグ宣言
@----------------------------------------------------------
.MACRO	HIDE_ITEM_DATA	flag,item,num
	.short	\flag
	.short	\item,\num
.ENDM

@---------------------------------------------
@
@---------------------------------------------
@===================================================================
@
@	スクリプトコマンドの定義
@
@===================================================================

@----------------------------------------------------------
@ 基本コマンド
@----------------------------------------------------------
.MACRO	_NOP
	.byte	EVCMD_NOP
.ENDM

.MACRO	_DUMMY
	.byte	EVCMD_DUMMY
.ENDM

.MACRO	_END
	.byte	EVCMD_END
.ENDM

@----------------------------------------------------------
@ 基本分岐コマンド
@----------------------------------------------------------
.MACRO	_RET
	.byte	EVCMD_RET
.ENDM

.MACRO	_GLOBAL_CALL	ADDRESS
	.byte	EVCMD_GLOBAL_CALL
	.word	\ADDRESS
.ENDM

.MACRO	_GLOBAL_JUMP	ADDRESS
	.byte	EVCMD_GLOBAL_JUMP
	.word	\ADDRESS
.ENDM

@ スクリプト呼び出し
.MACRO	_CALL	ADDRESS
	_GLOBAL_CALL	\ADDRESS
.ENDM

@ ジャンプ
.MACRO	_JUMP	ADDRESS
	_GLOBAL_JUMP	\ADDRESS
.ENDM

@---------------------------------------------
@	外部指定したスクリプトに分岐
@---------------------------------------------
.MACRO	_CHANGE_SCRIPT
	.byte	EVCMD_CHG_SCRIPT
.ENDM

@---------------------------------------------
@	外部スクリプトのクリア＆終了
@---------------------------------------------
.MACRO	_CLEAR_EX_SCRIPT
	.byte	EVCMD_CLR_EXSCRIPT
.ENDM
@---------------------------------------------
@	外部スクリプトのエラーコードセット
@---------------------------------------------
.MACRO	_SET_EXDATA_ERROR	error
	.byte	EVCMD_SET_EXERROR
	.byte	\error
.ENDM

@----------------------------------------------------------
@
@	スクリプトからプログラムを呼ぶコマンド
@
@----------------------------------------------------------
@---------------------------------------------
@ ID による登録プログラムの呼び出し
@---------------------------------------------
.MACRO	_PROGRAM	id
	.byte	EVCMD_PROGRAM
	.short	\id
.ENDM

@---------------------------------------------
@ ID による登録プログラムの呼び出し
@ ※wkで指定したワークにu8の戻り値が入る
@---------------------------------------------
.MACRO	_FUNC_CALL	wk,id
	.byte	EVCMD_FUNCCALL
	.short	\wk,\id
.ENDM

@---------------------------------------------
@スクリプトの停止
@※通常はタスクなどに制御を渡すために使用する
@---------------------------------------------
.MACRO	_STOP_SCRIPT
	.byte	EVCMD_STOPSCRIPT
.ENDM

@----------------------------------------------------------
@
@		ワークの操作
@
@----------------------------------------------------------
@ ワークに値を代入
.MACRO	_LDVAL	wk,val
	.byte	EVCMD_LD_WK_VAL
	.short	\wk
	.short	\val
.ENDM

@ ワークに値を足す
.MACRO	_ADDWK	wk,add
	.byte	EVCMD_WK_ADD
	.short	\wk
	.short	\add
.ENDM

@ ワークから値を引く
.MACRO	_SUBWK	wk,sub
	.byte	EVCMD_WK_SUB
	.short	\wk
	.short	\sub
.ENDM

@ ワークにワークの値を代入
.MACRO	_LDWK	wk1,wk2
	.byte	EVCMD_LD_WK_WK
	.short	\wk1
	.short	\wk2
.ENDM

@ ワークに値かワークの値を代入
.MACRO	_LDWKVAL	wk1,wk2
	.byte	EVCMD_LD_WK_WKVAL
	.short	\wk1
	.short	\wk2
.ENDM

@ ワークと値の比較
.MACRO	_CMPVAL	wk,val
	.byte	EVCMD_CP_WK_VAL
	.short	\wk
	.short	\val
.ENDM

@ ワークとワークの比較
.MACRO	_CMPWK	wk1,wk2
	.byte	EVCMD_CP_WK_WK
	.short	\wk1
	.short	\wk2
.ENDM

@ 乱数の取得(0～指定した値-1までの乱数を取得してAnswerWorkに入れる)
.MACRO	_GET_RND	limit
	.byte	EVCMD_GETRND
	.short	\limit					@shortでよい？
.ENDM


@----------------------------------------------------------
@ 条件付き分岐コマンド
@----------------------------------------------------------
@ 条件によって分岐
.MACRO	_IF_JUMP	cond,adr
	.byte	EVCMD_IFJUMP
	.byte	\cond
	.word	\adr
.ENDM

@ 条件によって分岐(CALL)							02/03/05	nohara	
.MACRO	_IF_CALL	cond,adr
	.byte	EVCMD_IFCALL
	.byte	\cond
	.word	\adr
.ENDM

@ ワークと値を比較、条件どおりの場合分岐
.MACRO	_IFVAL_JUMP	wk,cond,val,adr
	_CMPVAL	\wk,\val
	.byte	EVCMD_IFJUMP
	.byte	\cond
	.word	\adr
.ENDM

@ ワークと値を比較、条件どおりの場合分岐(CALL)		02/03/04	nohara
.MACRO	_IFVAL_CALL	wk,cond,val,adr
	_CMPVAL	\wk,\val
	.byte	EVCMD_IFCALL
	.byte	\cond
	.word	\adr
.ENDM

@ ワークとワークを比較、条件どおりの場合分岐
.MACRO	_IFWK_JUMP	wk1,cond,wk2,adr
	_CMPWK	\wk1,\wk2
	.byte	EVCMD_IFJUMP
	.byte	\cond
	.word	\adr
.ENDM

@ ワークとワークを比較、条件どおりの場合分岐(CALL)	02/03/04	nohara
.MACRO	_IFWK_CALL	wk1,cond,wk2,adr
	_CMPWK	\wk1,\wk2
	.byte	EVCMD_IFCALL
	.byte	\cond
	.word	\adr
.ENDM

@ ANSWORKが0の場合ジャンプ
.MACRO	_IF_ZERO_JUMP	adr
	_CMPVAL	ANSWORK,0
	.byte	EVCMD_IFJUMP
	.byte	EQ
	.word	\adr
.ENDM

@----------------------------------------------------------
@	ＩＤによる共通スクリプトへの分岐
@----------------------------------------------------------
.MACRO	_JUMPID		id
	.byte	EVCMD_JUMPID
	.byte	\id
.ENDM

.MACRO	_CALLID		id
	.byte	EVCMD_CALLID
	.byte	\id
.ENDM

.MACRO	_IFJUMPID	cond,id
	.byte	EVCMD_IFJUMPID
	.byte	\cond
	.byte	\id
.ENDM

.MACRO	_IFCALLID	cond,id
	.byte	EVCMD_IFCALLID
	.byte	\cond
	.byte	\id
.ENDM

.MACRO	_IFVAL_JUMPID	wk,cond,val,id
	_CMPVAL	\wk,\val
	_IFJUMPID	\cond,\id
.ENDM

.MACRO	_IFVAL_CALLID	wk,cond,val,id
	_CMPVAL	\wk,\val
	_IFCALLID	\cond,\id
.ENDM

.MACRO	_IFWK_JUMPID	wk,cond,val,id
	_CMPWK	\wk,\val
	_IFJUMPID	\cond,\id
.ENDM

.MACRO	_IFWK_CALLID	wk,cond,val,id
	_CMPWK	\wk,\val
	_IFCALLID	\cond,\id
.ENDM

@----------------------------------------------------------
@	switch ～ case 構文
@----------------------------------------------------------
.MACRO	_SWITCH	wk
	_LDWK	RG0,\wk
.ENDM

.MACRO	_CASEJUMP	val,adr
	_CMPVAL	RG0,\val
	_IF_JUMP	EQ,\adr
.ENDM

@スクリプトウィンドウ表示中にBキャンセル
@ev_win.cにdefine ANS_CANCEL 127がある(ANSWORKに入る)
.MACRO	_CASECANCEL	adr
	_CMPVAL	RG0,127
	_IF_JUMP	EQ,\adr
.ENDM


@----------------------------------------------------------
@ フラグ関連
@----------------------------------------------------------
@ フラグセット
.MACRO	_FLAG_SET	flag
	.byte	EVCMD_FLAGSET
	.short	\flag
.ENDM

@ フラグリセット
.MACRO	_FLAG_RESET	flag
	.byte	EVCMD_FLAGRESET
	.short	\flag
.ENDM

@ フラグがONのとき分岐
.MACRO	_IF_FLAGON_JUMP	flag,adr
	.byte	EVCMD_FLAGCHECK
	.short	\flag
	_IF_JUMP FLGON ,\adr
.ENDM

@ フラグがONのとき分岐(CALL)				02/03/05	nohara
.MACRO	_IF_FLAGON_CALL	flag,adr
	.byte	EVCMD_FLAGCHECK
	.short	\flag
	_IF_CALL FLGON ,\adr
.ENDM

@ フラグがOFFのとき分岐
.MACRO	_IF_FLAGOFF_JUMP	flag,adr
	.byte	EVCMD_FLAGCHECK
	.short	\flag
	_IF_JUMP FLGOFF ,\adr
.ENDM

@ フラグがOFFのとき分岐(CALL)				02/03/05	nohara
.MACRO	_IF_FLAGOFF_CALL	flag,adr
	.byte	EVCMD_FLAGCHECK
	.short	\flag
	_IF_CALL FLGOFF ,\adr
.ENDM

@

@----------------------------------------------------------
@	天候制御関連
@----------------------------------------------------------
@---------------------------------------------
@	天候コードの初期化
@---------------------------------------------
.MACRO	_INIT_WEATHER
	.byte	EVCMD_INIT_WEATHER
.ENDM

@---------------------------------------------
@	天候コードのセット
@---------------------------------------------
.MACRO	_SET_WEATHER	weather_id
	.byte	EVCMD_SET_WEATHER
	.short	\weather_id
.ENDM

@---------------------------------------------
@	天候コードの反映
@---------------------------------------------
.MACRO	_UPDATE_WEATHER
	.byte	EVCMD_UPDATE_WEATHER
.ENDM

@----------------------------------------------------------
@----------------------------------------------------------
@---------------------------------------------
@	マップ固有のエフェクトを設定
@---------------------------------------------
.MACRO	_SET_MAP_EFFECT	id
	.byte	EVCMD_SET_MAPEFFECT
	.byte	\id
.ENDM

@---------------------------------------------
@	マップスクリーンの切り替え
@	※FLAG_CHANGE_LABELのタイミングで呼ぶこと
@---------------------------------------------
.MACRO	_CHANGE_MAP_SCREEN	screen_id
	.byte	EVCMD_CHG_MAPSCREEN
	.short	\screen_id
.ENDM

@----------------------------------------------------------
@	時間制御関連
@----------------------------------------------------------
@---------------------------------------------
@	ゲーム内時間のセット
@---------------------------------------------
.MACRO	_SET_GAME_TIME	hour,min
	.byte	EVCMD_SET_TIME
	.short	\hour
	.short	\min
.ENDM

@---------------------------------------------
@	ゲーム内時間＆関連フラグ更新
@---------------------------------------------
.MACRO	_UPDATE_GAME_TIME
	.byte	EVCMD_UPDATE_TIME
.ENDM

@---------------------------------------------
@	ゲーム内時間を取得する(RG0,RG1,RG2に代入する)
@---------------------------------------------
.MACRO	_GET_GAME_TIME
	.byte	EVCMD_GET_TIME
.ENDM


@----------------------------------------------------------
@	音楽・ＳＥ関連
@----------------------------------------------------------
.MACRO	_SE	se_no
	.byte	EVCMD_SET_SE
	.short	\se_no
.ENDM

.MACRO	_JINGLE	mus_no
	.byte	EVCMD_SET_JINGLE
	.short	\mus_no
.ENDM

.MACRO	_JINGLE_WAIT
	.byte	EVCMD_JINGLE_WAIT
.ENDM

.MACRO	_BGM_SET	bgm_no, flag=0
	.byte	EVCMD_BGM_SET
	.short	\bgm_no
	.byte	\flag
.ENDM

.MACRO	_BGM_SPECIAL_SET	bgm_no
	.byte	EVCMD_BGM_SP_SET
	.short	\bgm_no
.ENDM

.MACRO	_BGM_SPECIAL_CLR	bgm_no
	.byte	EVCMD_BGM_SP_SET
	.short	0
.ENDM

.MACRO	_BGM_NOW_SET
	.byte	EVCMD_BGM_NOW_SET
.ENDM

.MACRO	_BGM_FADE_CHG		bgm_no
	.byte	EVCMD_BGM_FADE_CHG
	.short	\bgm_no
.ENDM

.MACRO	_BGM_FADEOUT	sec=0
	.byte	EVCMD_BGM_FADEOUT
	.byte	\sec
.ENDM

.MACRO	_BGM_FADEIN		sec=0
	.byte	EVCMD_BGM_FADEIN
	.byte	\sec
.ENDM

@----------------------------------------------------------
@	ウェイト（１／６０単位）
@----------------------------------------------------------
.MACRO	_TIME_WAIT	cnt
	.byte	EVCMD_TIMEWAIT
	.short	\cnt
.ENDM

@----------------------------------------------------------
@　道具関連
@----------------------------------------------------------
.MACRO	_ADD_ITEM	item,num
	.byte	EVCMD_ADDITEM
	.short	\item
	.short	\num
.ENDM

.MACRO	_SUB_ITEM	item,num
	.byte	EVCMD_SUBITEM
	.short	\item
	.short	\num
.ENDM

@アイテム加えられるかのチェック
.MACRO	_ADD_ITEM_CHK	item,num
	.byte	EVCMD_ADDITEMCHK
	.short	\item
	.short	\num
.ENDM

@アイテムを持っているかのチェック(バック)
.MACRO	_CHECK_ITEM	item,num
	.byte	EVCMD_CHECKITEM
	.short	\item
	.short	\num
.ENDM

@ ポケットの番号を取得
.MACRO	_GET_POCKET_NO	item
	.byte	EVCMD_GETPOCKETNO
	.short	\item
.ENDM

@ アイテム取得メッセージ
@.MACRO	_ADD_ITEM_MSG
@	_CALL	ev_itemget_p01
@.ENDM

@ アイテム取得失敗メッセージ

@ アイテム取得共通イベント
@ _LDWKVALで値渡してもワーク渡してもいいようにしている
.MACRO	_ITEM_EVENT	no,num
	_LDWKVAL	RG0,\no
	_LDWKVAL	RG1,\num
	_CALLID	SCRID_ITEM_EVENT
@	_CALL	ev_item_event
.ENDM

@フィールド上のアイテム取得処理
.MACRO	_FLD_ITEM_EVENT	no,num
	_LDWKVAL	RG0,\no
	_LDWKVAL	RG1,\num
	_CALLID	SCRID_FLD_ITEM_EVENT
@	_CALL		ev_fld_item_event
.ENDM

@---------------------------------------------
//	パソコンにどうぐを入れる
@---------------------------------------------
.MACRO	_ADD_BOX_ITEM	item,num
	.byte	EVCMD_ADDBOXITEM
	.short	\item
	.short	\num
.ENDM

@---------------------------------------------
//	パソコンのどうぐチェック
@---------------------------------------------
.MACRO	_CHECK_BOX_ITEM	item,num
	.byte	EVCMD_CHECKBOXITEM
	.short	\item
	.short	\num
.ENDM

@----------------------------------------------------------
@　グッズ関連
@----------------------------------------------------------
.MACRO	_ADD_GOODS	goods
	.byte	EVCMD_ADDGOODS
	.short	\goods
.ENDM

.MACRO	_SUB_GOODS	goods
	.byte	EVCMD_SUBGOODS
	.short	\goods
.ENDM

@グッズを加えられるかのチェック
.MACRO	_ADD_GOODS_CHK	goods
	.byte	EVCMD_ADDGOODSCHK
	.short	\goods
.ENDM

@グッズを持っているかのチェック
.MACRO	_CHECK_GOODS	goods
	.byte	EVCMD_CHECKGOODS
	.short	\goods
.ENDM

@ グッズ取得共通イベント
@ _LDWKVALで値渡してもワーク渡してもいいようにしている
.MACRO	_GOODS_EVENT	wk0
	_LDWKVAL	RG0,\wk0
	_CALLID	SCRID_GOODS_EVENT
.ENDM

@----------------------------------------------------------
@	ＯＢＪアニメ制御関連
@----------------------------------------------------------
@ SPと頭についているコマンドはマップ間を主人公がまたいで
@ 今いるマップではないところのOBJの操作をする時に使用する

@ OBJアニメセット
@	id = OBJ指定
@	adrs = アニメデータのラベル
.MACRO	_SET_OBJ_ANIME	id,adrs
	.byte	EVCMD_OBJANIME
	@.byte	\id
	.short	\id
	.word	\adrs
.ENDM

@ OBJアニメセット(div,mapIDを指定する)
@	id = OBJ指定
@	adrs = アニメデータのラベル
.MACRO	_SP_SET_OBJ_ANIME	id,adrs,div,map
	.byte	EVCMD_OBJANIMESP
	.short	\id
	.word	\adrs
	.byte	\div,\map
.ENDM

@ OBJアニメ終了待ち
@	id = OBJ指定,指定なしの場合は
@			最後にアニメをセットしたOBJ
.MACRO	_OBJ_ANIME_WAIT	id = 0
	.byte	EVCMD_OBJANIMEWAIT
	@.byte	\id
	.short	\id
.ENDM

@ OBJアニメ終了待ち(div,mapIDを指定する)
@	id = OBJ指定,指定なしの場合は
@			最後にアニメをセットしたOBJ
.MACRO	_SP_OBJ_ANIME_WAIT	id,div,map
	.byte	EVCMD_OBJANIMEWAITSP
	.short	\id
	.byte	\div,\map
.ENDM

@ OBJ消去
.MACRO	_OBJ_DELETE	id
	.byte	EVCMD_OBJDEL
	.short	\id
.ENDM

@ OBJ消去(div,mapIDを指定する)
.MACRO	_SP_OBJ_DELETE	id,div,map
	.byte	EVCMD_OBJDELSP
	.short	\id
	.byte	\div,\map
.ENDM

@ OBJ出現
.MACRO	_OBJ_APPEAR	id
	.byte	EVCMD_OBJAPPEAR
	@.byte	\id
	.short	\id
.ENDM

@ OBJ出現(div,mapIDを指定する)
.MACRO	_SP_OBJ_APPEAR	id,div,map
	.byte	EVCMD_OBJAPPEARSP
	.short	\id
	.byte	\div,\map
.ENDM

@ OBJ表示位置変更
.MACRO	_OBJ_POS_CHANGE	id,x,y
	.byte	EVCMD_OBJ_POSCHG
	.short \id,\x,\y
.ENDM

@ 表示フラグの制御(見えるようにする）
.MACRO	_OBJ_VISIBLE	id,div,map
	.byte	EVCMD_OBJ_VISIBLE
	.short	\id
	.byte	\div,\map
.ENDM

@ 表示フラグの制御(見えないようにする）
.MACRO	_OBJ_INVISIBLE	id,div,map
	.byte	EVCMD_OBJ_INVISIBLE
	.short	\id
	.byte	\div,\map
.ENDM

@SXYデータの位置を現在の位置で上書きする
.MACRO	_SXY_POS_OVERWRITE		id
	.byte	EVCMD_SXYPOS_OWRITE
	.short	\id
.ENDM

@SXYデータの位置情報を書き換える
.MACRO	_SXY_POS_CHANGE	id,x,y
	.byte	EVCMD_SXYPOS_CHG
	.short	\id,\x,\y
.ENDM

@ OBJの向きを変更
.MACRO	_OBJ_SITE_CHG	id,site
	.byte	EVCMD_OBJSITECHG
	.short	\id
	.byte	\site
.ENDM

@SXYデータの移動属性を書きかえる
.MACRO	_SXY_SITE_CHANGE	id,site
	.byte	EVCMD_SXYSITE_CHG
	@.short	\id,\site
	.short	\id
	.byte	\site
.ENDM

@----------------------------------------------------------
@	ＯＢＪアニメ制御関連
@----------------------------------------------------------
@
@ OBJのプライオリティ変更
.MACRO	_OBJ_PRI_CHG	id,div,map,pri
	.byte	EVCMD_OBJPRICHG
	.short	\id
	.byte	\div,\map,\pri
.ENDM

@ OBJのプライオリティを今いる位置に修正する(固定フラグもクリアする)
.MACRO	_OBJ_PRI_OFF	id,div,map
	.byte	EVCMD_OBJPRIOFF
	.short	\id
	.byte	\div,\map
.ENDM

@----------------------------------------------------------
@	フィールドＯＢＪダミーアクター追加
@----------------------------------------------------------
@
@ 追加
.MACRO	_DMY_OBJ_ADD	code,id,x,y,h,site
	.byte	EVCMD_OBJDMYACTADD
	.byte	\code,\id
	.short	\x,\y
	.byte	\h,\site
.ENDM

@ 向き変更
.MACRO	_DMY_OBJ_SITE_CHG	id,site
	.byte	EVCMD_OBJDMYSITECHG
	.byte	\id,\site
.ENDM

@----------------------------------------------------------
@	 会話制御関連
@----------------------------------------------------------

@---------------------------------------------
@会話開始（自機動作終了待ち、すべてのＯＢＪの静止セット）
@---------------------------------------------
.MACRO	_TALK_START
	.byte	EVCMD_TALKSTART
.ENDM

@---------------------------------------------
@会話終了（会話ウィンドウ消去、すべてのＯＢＪの静止解除）
@---------------------------------------------
.MACRO	_TALK_END
	.byte	EVCMD_TALKEND
.ENDM

@---------------------------------------------
@ＯＢＪ話しかけ用会話開始
@---------------------------------------------
.MACRO	_TALK_OBJ_START
	.byte	EVCMD_TALKOBJSTART
	.byte	EVCMD_OBJ_TO_HERO
.ENDM

@---------------------------------------------
@ＯＢＪ話しかけ用会話終了
@---------------------------------------------
.MACRO	_TALK_OBJ_END
	.byte	EVCMD_TALKOBJEND
.ENDM

@---------------------------------------------
@メインが切り替わったあと、スクリプト復帰時に呼ぶ
@自機動作終了待ち、すべてのＯＢＪの静止セットをセットする
@必要な処理を追加していく
@---------------------------------------------
.MACRO	_TALK_OBJ_RECOVER
	_TALK_OBJ_START
.ENDM

.MACRO	_TALK_RECOVER
	_TALK_START
.ENDM

@---------------------------------------------
@ メッセージ表示をよびだし
@---------------------------------------------
.MACRO	_TALKMSG	ADDRESS
	.byte	EVCMD_TALKMSG
	.word	\ADDRESS
.ENDM

@---------------------------------------------
@ メッセージ送り禁止のメッセージ表示セット
@---------------------------------------------
.MACRO	_SYSTALKMSG	ADDRESS
	.byte	EVCMD_SYSTALKMSG
	.word	\ADDRESS
.ENDM

@---------------------------------------------
@ メッセージ表示終了待ちをセット
@---------------------------------------------
.MACRO	_TALK_WAIT
	.byte	EVCMD_TALKWAIT
.ENDM

@---------------------------------------------
@ メッセージウィンドウを閉じる
@---------------------------------------------
.MACRO	_TALK_CLOSE
	.byte	EVCMD_TALKCLOSE
.ENDM

@---------------------------------------------
@ 簡易メッセージ呼び出しＯＢＪ用
@ 主人公の向きに合わせる
@---------------------------------------------
.MACRO	_EASY_OBJ_MSG	msg
	_LD_REG_WDATA	0,\msg
	_CALLID	SCRID_EASYOBJMSGSCRIPT
@	_CALL	EasyObjMessageScript
.ENDM

@---------------------------------------------
@ 簡易メッセージ呼び出しＢＧ用
@ ＢＧ・話し掛けから始まらないもの(強制イベントなど)
@---------------------------------------------
.MACRO	_EASY_MSG	msg
	_LD_REG_WDATA	0,\msg
	_CALLID	SCRID_EASYBGMSGSCRIPT
@	_CALL	EasyBgMessageScript
.ENDM

@---------------------------------------------
@ ウィンドウを閉じたくないとき用(_TALKMSG,_TALK_WAIT,_AB_KEYWAIT)
@---------------------------------------------
.MACRO	_TALK_KEYWAIT	msg
	_LD_REG_WDATA	0,\msg
	_CALLID	SCRID_MSGWAITKEYSCRIPT
@	_CALL	MessageWaitKeyScript
.ENDM

@---------------------------------------------
@ ABキー待ち
@---------------------------------------------
.MACRO	_AB_KEYWAIT
	.byte	EVCMD_ABKEY_WAIT
.ENDM

@---------------------------------------------
@　「はい・いいえ」ウィンドウ
@---------------------------------------------
.MACRO	_YES_NO_WINDOW	xpos,ypos
	.byte	EVCMD_YESNOWIN
	.byte	\xpos,\ypos
.ENDM

@---------------------------------------------
@ 「はい・いいえ」ノーマルウィンドウ
@---------------------------------------------
.MACRO	_YES_NO_NORMAL_WIN
	@_YES_NO_WINDOW	3,3			@左上
	_YES_NO_WINDOW	20,8		@右下
.ENDM

@---------------------------------------------
@メッセージ表示して、「はい・いいえ」を表示する
@---------------------------------------------
.MACRO	_TALK_YES_NO	msg
	_LD_REG_WDATA	0,\msg
	_CALLID	SCRID_MSGYESNOSCRIPT
@	_CALL	MessageYesNoScript
.ENDM

@---------------------------------------------
@　スクリプトウィンドウ
@---------------------------------------------
@.MACRO	_SELECT_WINDOW	xpos,ypos,xpos2,ypos2,mojino,mojimax
@	.byte	EVCMD_SELECTWIN
@	.byte	\xpos,\ypos,\xpos2,\ypos2,\mojino,\mojimax
@.ENDM

@---------------------------------------------
@　スクリプトウィンドウ
@ check = Bキャンセルを有効にするか,指定なし(0)の場合は有効
@---------------------------------------------
.MACRO	_SELECT_WINDOW	xpos,ypos,mojino,check = 0
	.byte	EVCMD_SELECTWIN
	.byte	\xpos,\ypos,\mojino
	.byte	\check
.ENDM

@---------------------------------------------
@　スクリプトウィンドウ
@ check = Bキャンセルを有効にするか,指定なし(0)の場合は有効
@ カーソルの初期位置を指定出来る
@---------------------------------------------
.MACRO	_SELECT_WINDOW_CSR	xpos,ypos,mojino,csr,check=0
	.byte	EVCMD_SELECTWINCSR
	.byte	\xpos,\ypos,\mojino,\csr
	.byte	\check
.ENDM

@---------------------------------------------
@　縦横ウィンドウ
@ check = Bキャンセルを有効にするか,指定なし(0)の場合は有効
@---------------------------------------------
.MACRO	_HV_WINDOW	xpos,ypos,mojino,arrange,check = 0
	.byte	EVCMD_HVWIN
	.byte	\xpos,\ypos,\mojino,\arrange
	.byte	\check
.ENDM

//020717 tomo コインウインドウ系追加
@---------------------------------------------
@ 所持コインウィンドウ表示
@---------------------------------------------
.MACRO	_COIN_WIN_WRITE	x,y
	.byte	EVCMD_COINWINWRITE
	.byte	\x,\y
.ENDM

@---------------------------------------------
@ 所持コインウィンドウ削除
@---------------------------------------------
.MACRO	_COIN_WIN_DEL	x,y
	.byte	EVCMD_COINWINDEL
	.byte	\x,\y
.ENDM

@---------------------------------------------
@ 所持コインウィンドウ更新
@---------------------------------------------
.MACRO	_COIN_WRITE	x,y
	.byte	EVCMD_COINWRITE
	.byte	\x,\y
.ENDM

@---------------------------------------------
@　ウィンドウ(のみ)表示
@---------------------------------------------
.MACRO	_WINDOW_WRITE	xpos,ypos,xpos2,ypos2
	.byte	EVCMD_WINWRITE
	.byte	\xpos,\ypos,\xpos2,\ypos2
.ENDM

@---------------------------------------------
@　指定範囲をクリア
@---------------------------------------------
.MACRO	_WINDOW_CLEAR	xpos,ypos,xpos2,ypos2
	.byte	EVCMD_WINCLEAR
	.byte	\xpos,\ypos,\xpos2,\ypos2
.ENDM

@---------------------------------------------
@---------------------------------------------
.MACRO	_SCREEN_CLEAR
	_WINDOW_CLEAR	0,0,29,19
.ENDM

@---------------------------------------------
@　メニュー(のみ)表示
@---------------------------------------------
.MACRO	_MENU_WRITE	xpos,ypos,mojino,check = 0
	.byte	EVCMD_MENUWRITE
	.byte	\xpos,\ypos,\mojino
	.byte	\check
.ENDM

@---------------------------------------------
@　ポケモンCG表示ウィンドウ表示
@---------------------------------------------
.MACRO	_POKE_CG_WRITE	no,xpos,ypos
	.byte	EVCMD_POKECGWRITE
	.short	\no
	.byte	\xpos,\ypos
.ENDM

@---------------------------------------------
@　ポケモンCG表示ウィンドウ消去
@---------------------------------------------
.MACRO	_POKE_CG_ERASE
	.byte	EVCMD_POKECGERASE
.ENDM


@---------------------------------------------
@	似顔絵表示
@	number == 似顔絵データナンバー、1～13
@---------------------------------------------
.MACRO	_PUT_PORTRAIT	number
//	.byte	EVCMD_PUTPORTRAIT
//	.byte	\number
//	_TIME_WAIT		1
//	_AB_KEYWAIT
//	_SCREEN_CLEAR

	_FLD_FADE_BLACKOUT
	.byte	EVCMD_PUTPORTRAIT
	.byte	\number
.ENDM

@---------------------------------------------
@		点字メッセージ表示
@---------------------------------------------
.MACRO	_PUT_TENJI	adrs
	.byte	EVCMD_TENJIMSGPUT
	.word	\adrs
.ENDM

.MACRO	_EASY_PUT_TENJI	adrs
	_TALK_START
	_PUT_TENJI	\adrs
	_AB_KEYWAIT
	_SCREEN_CLEAR
	_TALK_END
.ENDM

@----------------------------------------------------------
@
@	ポケモン関連
@
@----------------------------------------------------------
@---------------------------------------------
@　ポケモンを手持ちに加える
@---------------------------------------------
.MACRO	_ADD_POKEMON	monsno,lv,itemno,adrs1,adrs2,name_sw
	.byte	EVCMD_ADDPOKE
	.short	\monsno
	.byte	\lv
	.short	\itemno
	.word	\adrs1,\adrs2
	.byte	\name_sw
.ENDM

@---------------------------------------------
@　タマゴを手持ちに加える
@---------------------------------------------
.MACRO	_ADD_TAMAGO		monsno
	.byte	EVCMD_ADDTAMAGO
	.short	\monsno
.ENDM

@---------------------------------------------
@ 手持ちポケモンの技を置き換える
@---------------------------------------------
.MACRO	_WAZA_CHANGE pos,waza_pos,wazano
	.byte	EVCMD_PM_WAZA_CHANGE
	.byte	\pos
	.byte	\waza_pos
	.short	\wazano
.ENDM

@---------------------------------------------
@ 指定された技を覚えている手持ちポケモンを調べる	2002/01/23 by nakahiro
@---------------------------------------------
.MACRO	_WAZA_CHECK	wazano
	.byte	EVCMD_PM_WAZA_CHECK
	.short	\wazano
.ENDM

@----------------------------------------------------------
@
@	文字列操作関連
@
@----------------------------------------------------------
@---------------------------------------------
@　文字列取得(ポケモン)
@---------------------------------------------
.MACRO	_GET_MONSNAME	buf,monsno
	.byte	EVCMD_GETMONSNAME
	.byte	\buf
	.short	\monsno
.ENDM

@---------------------------------------------
@　文字列取得(手持ちの先頭のポケモン)
@---------------------------------------------
.MACRO	_GET_TEMOTI_MONSNAME	buf
	.byte	EVCMD_GETTEMOTIMONSNAME
	.byte	\buf
.ENDM

@---------------------------------------------
@　文字列取得(ポケモンニックネーム)
@---------------------------------------------
.MACRO	_GET_NICKNAME	buf,no
	.byte	EVCMD_GETNICKNAME
	.byte	\buf
	.short	\no
.ENDM

@---------------------------------------------
@　文字列取得(アイテム)
@---------------------------------------------
.MACRO	_GET_ITEMNAME	buf,itemno
	.byte	EVCMD_GETITEMNAME
	.byte	\buf
	.short	\itemno
.ENDM

@---------------------------------------------
@　文字列取得(グッズ)
@---------------------------------------------
.MACRO	_GET_GOODSNAME	buf,goodsno
	.byte	EVCMD_GETGOODSNAME
	.byte	\buf
	.short	\goodsno
.ENDM

@---------------------------------------------
@　文字列取得(技)
@---------------------------------------------
.MACRO	_GET_WAZANAME	buf,waza
	.byte	EVCMD_GETWAZANAME
	.byte	\buf
	.short	\waza
.ENDM

@---------------------------------------------
@　文字列取得(数字)
@---------------------------------------------
.MACRO	_GET_NUM_MSG	buf,num
	.byte	EVCMD_GETNUMMSG
	.byte	\buf
	.short	\num
.ENDM

@---------------------------------------------
@　文字列取得
@---------------------------------------------
.MACRO	_SET_BUF	buf,no
	.byte	EVCMD_SETBUF
	.byte	\buf
	.short	\no
.ENDM

@---------------------------------------------
@	指定文字列をバッファにコピー
@---------------------------------------------
.MACRO	_COPY_BUF	buf,str
	.byte	EVCMD_COPYBUF
	.byte	\buf
	.word	\str
.ENDM

@----------------------------------------------------------
@	野生ポケモン戦関連
@----------------------------------------------------------

@---------------------------------------------
@	野生ポケモンデータセット
@---------------------------------------------
.MACRO	_WILD_FIGHT_SET	pokeno,level,itemno
	.byte	EVCMD_SET_WILDFIGHT
	.short	\pokeno
	.byte	\level
	.short	\itemno
.ENDM

@---------------------------------------------
@	野生ポケモン　エンカウント戦スタート
@---------------------------------------------
.MACRO	_WILD_FIGHT_START
	.byte	EVCMD_START_WILDFIGHT
.ENDM


@----------------------------------------------------------
@	トレーナー処理関連
@----------------------------------------------------------
@---------------------------------------------
@	トレーナー戦の呼び出し
@---------------------------------------------
.MACRO	_TRAINER_FIGHT
	.byte	EVCMD_TRAINERFIGHT
.ENDM

@---------------------------------------------
@	トレーナー戦終了後のスクリプト呼び出し
@---------------------------------------------
.MACRO	_TRAINER_AFTER
	.byte	EVCMD_TRAINERAFTER
.ENDM

@---------------------------------------------
@	トレーナー戦終了後のスクリプト呼び出し
@---------------------------------------------
.MACRO	_TRAINER_BATTLE_END_SCRIPT
	.byte	EVCMD_TRN_END_SCRIPT
.ENDM

@---------------------------------------------
@	トレーナー用会話開始
@※現状は_TALK_OBJ_STARTとほぼ同じだが
@　今後の仕様変更なども考慮して別コマンドで
@　用意している
@---------------------------------------------
.MACRO	_TRAINER_OBJ_START
	.byte	EVCMD_TALKOBJSTART
.ENDM

@---------------------------------------------
@
@---------------------------------------------
.MACRO	_TRAINER_EVENT_FIGHT	id,msg
	.byte	EVCMD_TRAINERSET
	.byte	TR_TYPE_FORCE
	.short	\id,0
	.word	\msg
.ENDM

@---------------------------------------------
@	トレーナー戦後の簡易ＭＳＧ表示
@---------------------------------------------
.MACRO	_TRAINER_EASY_MSG	msg
	_LD_REG_WDATA	0,\msg
	_CALLID	SCRID_TRAINEREASYMSG
@	_CALL	TrainerEasyMsgScript
.ENDM


@	トレーナーデータの記述

@---------------------------------------------
@通常のトレーナーデータ開始
@---------------------------------------------
.MACRO	_TRAINER_DATA_START
	.byte	EVCMD_TRAINERSET
	.byte	TR_TYPE_NORMAL
.ENDM

@---------------------------------------------
@イベントがらみのトレーナーデータ開始
@---------------------------------------------
.MACRO	_EVTRAINER_DATA_START
	.byte	EVCMD_TRAINERSET
	.byte	TR_TYPE_EVENT
.ENDM

@---------------------------------------------
@ジムリーダーのトレーナーデータ開始
@---------------------------------------------
.MACRO	_LEADER_DATA_START
	.byte	EVCMD_TRAINERSET
	.byte	TR_TYPE_LEADER
.ENDM

@---------------------------------------------
@2vs2対戦のトレーナーデータ定義
@---------------------------------------------
.MACRO	_TRAINER2vs2_DATA_START
	.byte	EVCMD_TRAINERSET
	.byte	TR_TYPE_2VS2
.ENDM

@---------------------------------------------
@イベントがらみの2vs2対戦のトレーナーデータ定義
@---------------------------------------------
.MACRO	_EVTRAINER2vs2_DATA_START
	.byte	EVCMD_TRAINERSET
	.byte	TR_TYPE_EVENT2VS2
.ENDM

@---------------------------------------------
@2vs2対戦ジムリーダーのトレーナーデータ定義
@---------------------------------------------
.MACRO	_LEADER2vs2_DATA_START
	.byte	EVCMD_TRAINERSET
	.byte	TR_TYPE_LEADER2VS2
.ENDM

@---------------------------------------------
@再戦タイプのトレーナーデータ定義
@---------------------------------------------
.MACRO	_REVENGE_TRAINER_DATA_START
	.byte	EVCMD_TRAINERSET
	.byte	TR_TYPE_REVENGE
.ENDM

@---------------------------------------------
@2vs2再戦タイプのトレーナーデータ定義
@---------------------------------------------
.MACRO	_REVENGE2vs2_TRAINER_DATA_START
	.byte	EVCMD_TRAINERSET
	.byte	TR_TYPE_REVENGE2VS2
.ENDM


@トレーナーID（+トレーナーOBJ）の定義
.MACRO	_TRAINER_DATA1	id,obj=0
	.short	\id,\obj
.ENDM

@戦闘開始前MSG
.MACRO	_TRAINER_DATA2	before_msg
	.word	\before_msg
.ENDM

@戦闘終了直後MSG（戦闘画面内で表示）
.MACRO	_TRAINER_DATA3	after_msg
	.word	\after_msg
.ENDM

@戦闘しない場合のMSG（2vs2対戦専用、他は不要）
@		あるいは
@イベントトレーナーの対戦後スクリプト指定
.MACRO	_TRAINER_DATA4	nofight_msg
	.word	\nofight_msg
.ENDM

@2vs2対戦でイベントトレーナーの場合の対戦後スクリプト指定
.MACRO	_TRAINER_DATA5	after_script
	.word	\after_script
.ENDM

@データブロック終了（現状ダミー）
.MACRO	_TRAINER_DATA_END
.ENDM


@---------------------------------------------
@ トレーナーフラグ関連
@---------------------------------------------
@ フラグセット
.MACRO	_TR_FLAG_SET	flag
	.byte	EVCMD_TRN_FLAG_SET
	.short	\flag
.ENDM

@ フラグリセット
.MACRO	_TR_FLAG_RESET	flag
	.byte	EVCMD_TRN_FLAG_RESET
	.short	\flag
.ENDM

@ フラグがONのとき分岐
.MACRO	_IF_TR_FLAGON_JUMP	flag,adr
	.byte	EVCMD_TRN_FLAG_CHK
	.short	\flag
	_IF_JUMP FLGON ,\adr
.ENDM

@ フラグがONのとき分岐(CALL)				02/03/05	nohara
.MACRO	_IF_TR_FLAGON_CALL	flag,adr
	.byte	EVCMD_TRN_FLAG_CHK
	.short	\flag
	_IF_CALL FLGON ,\adr
.ENDM

@ フラグがOFFのとき分岐
.MACRO	_IF_TR_FLAGOFF_JUMP	flag,adr
	.byte	EVCMD_TRN_FLAG_CHK
	.short	\flag
	_IF_JUMP FLGOFF ,\adr
.ENDM

@ フラグがOFFのとき分岐(CALL)				02/03/05	nohara
.MACRO	_IF_TR_FLAGOFF_CALL	flag,adr
	.byte	EVCMD_TRN_FLAG_CHK
	.short	\flag
	_IF_CALL FLGOFF ,\adr
.ENDM

@----------------------------------------------------------
@ プログラムを直接操作する命令(通常は使わない）
@----------------------------------------------------------
@---------------------------------------------
@ 処理待ち関数をセット
@---------------------------------------------
.MACRO	_SET_WAIT_FUNC	function
	.byte	EVCMD_SETWAITSUB
	.word	\function
.ENDM

@---------------------------------------------
@ プログラム直接呼出し
@---------------------------------------------
.MACRO	_FUNC_DIRECT_CALL	adrs
	.byte	EVCMD_SUBROUTINE
	.word	\adrs
.ENDM


@----------------------------------------------------------
@ Load Command
@----------------------------------------------------------
.MACRO	_LD_REG_WDATA	r,wdata
	.byte	EVCMD_LD_REG_WDATA
	.byte	\r
	.word	\wdata
.ENDM

.MACRO	_LD_REG_REG	r1,r2
	.byte	EVCMD_LD_REG_REG
	.byte	\r1,\r2
.ENDM

.MACRO	_LD_REG_VAL	r,val
	.byte	EVCMD_LD_REG_VAL
	.byte	\r
	.byte	\val
.ENDM

.MACRO	_LD_REG_ADR	reg,ADDRESS
	.byte	EVCMD_LD_REG_ADR
	.byte	\reg
	.word	\ADDRESS
.ENDM

.MACRO	_LD_ADR_REG	adrs,reg
	.byte	EVCMD_LD_ADR_REG
	.byte	\reg
	.word	\adrs
.ENDM

.MACRO	_LD_ADR_VAL	adrs,val
	.byte	EVCMD_LD_ADR_VAL
	.word	\adrs
	.byte	\val
.ENDM

.MACRO	_LD_ADR_ADR	adr1,adr2
	.byte	EVCMD_LD_ADR_ADR
	.word	\adr1
	.word	\adr2
.ENDM

@----------------------------------------------------------
@ compare command
@----------------------------------------------------------
.MACRO	_CP_REG_REG	r1,r2
	.byte	EVCMD_CP_REG_REG
	.byte	\r1,\r2
.ENDM

.MACRO	_CP_REG_VAL	r1,val
	.byte	EVCMD_CP_REG_VAL
	.byte	\r1,\val
.ENDM

.MACRO	_CP_REG_ADR	r1,adrs
	.byte	EVCMD_CP_REG_ADR
	.byte	\r1
	.word	\adrs
.ENDM

.MACRO	_CP_ADR_REG	adrs,r1
	.byte	EVCMD_CP_ADR_REG
	.word	\adrs
	.byte	\r1
.ENDM

.MACRO	_CP_ADR_VAL	adrs,val
	.byte	EVCMD_CP_ADR_VAL
	.word	\adrs
	.byte	\val
.ENDM

.MACRO	_CP_ADR_ADR	adr1,adr2
	.byte	EVCMD_CP_ADR_ADR
	.word	\adr1
	.word	\adr2
.ENDM

@----------------------------------------------------------
@	フェードコマンド
@----------------------------------------------------------
@ 
.MACRO	_FLD_FADE_BLACKIN
	.byte	EVCMD_FIELDFADE
	.byte	0
.ENDM

.MACRO	_FLD_FADE_BLACKOUT
	.byte	EVCMD_FIELDFADE
	.byte	1
.ENDM

.MACRO	_FLD_FADE_WHITEIN
	.byte	EVCMD_FIELDFADE
	.byte	2
.ENDM

.MACRO	_FLD_FADE_WHITEOUT
	.byte	EVCMD_FIELDFADE
	.byte	3
.ENDM

.MACRO	_FLD_FADE_WAIT	type,wait
	.byte	EVCMD_FIELDFADEWAIT
	.byte	\type,\wait
.ENDM

@---------------------------------------------
@	フィールド視界の制御
@---------------------------------------------
.MACRO	_FLD_BRIGHT_CHANGE	val
	.byte	EVCMD_CHG_BRIGHT
	.short	\val
.ENDM

.MACRO	_FLD_BRIGHT_EFFECT	end
	.byte	EVCMD_BRIGHT_EFF
	.byte	\end
.ENDM

@----------------------------------------------------------
@	マップ遷移
@----------------------------------------------------------
@---------------------------------------------
@	場所を指定してマップ移動
@ このコマンドの後に_STOP_SCRIPTを書くようにする(自機の動作をとめる)
@---------------------------------------------
.MACRO	_MAP_CHANGE	div,map,x,y
	.byte	EVCMD_MAP_CHANGE
	.byte	\div,\map,NO_EXIT_ID
	.short	\x,\y
.ENDM

@---------------------------------------------
@	場所を指定してマップ移動(SEなし)
@ このコマンドの後に_STOP_SCRIPTを書くようにする(自機の動作をとめる)
@---------------------------------------------
.MACRO	_MAP_CHG_SENOT	div,map,x,y
	.byte	EVCMD_MAP_CHG_SENOT
	.byte	\div,\map,NO_EXIT_ID
	.short	\x,\y
.ENDM

@---------------------------------------------
@	(ドアに入って)場所を指定してマップ移動
@ このコマンドの後に_STOP_SCRIPTを書くようにする(自機の動作をとめる)
@---------------------------------------------
.MACRO	_DOOR_MAP_CHANGE	div,map,x,y
	.byte	EVCMD_DOORMAP_CHANGE
	.byte	\div,\map,NO_EXIT_ID
	.short	\x,\y
.ENDM

@---------------------------------------------
@	マップ移動の場所を指定
@※このコマンドだけではマップ遷移はしない
@---------------------------------------------
.MACRO	_SET_MAP_CHANGE_POS	div,map,x,y
	.byte	EVCMD_SET_MAP_CHG
	.byte	\div,\map,NO_EXIT_ID
	.short	\x,\y
.ENDM


@---------------------------------------------
@	場所を指定してマップ移動
@	※ただし座標は現在位置をそのまま引き継ぐ
@---------------------------------------------
.MACRO	_MAP_CHANGE_FALL	div,map
	.byte	EVCMD_MAP_CHG_FALL
	.byte	\div,\map
.ENDM

@---------------------------------------------
@	場所を指定してマップ移動
@	SE_WARPIN,SE_WARPOUTが入っている
@---------------------------------------------
.MACRO	_MAP_CHANGE_WARP	div,map,x,y
	.byte	EVCMD_MAP_CHG_WARP
	.byte	\div,\map,NO_EXIT_ID
	@.byte	\x,\y
	.short	\x,\y
.ENDM

@---------------------------------------------
@	通信部屋へのマップ遷移
@---------------------------------------------
.MACRO	_COMM_MAP_CHANGE	div,map,x,y
	.byte	EVCMD_MAP_CHANGE
	.byte	\div,\map,NO_EXIT_ID
	.short	\x,\y
.ENDM

@---------------------------------------------
@	通信コンテスト専用のマップ遷移
@---------------------------------------------
.MACRO	_MAP_CHANGE_CONTEST	div,map,x,y
	_SET_MAP_CHANGE_POS	\div,\map,\x,\y
	_PROGRAM	CONTEST_MAP_CHANGE
	_STOP_SCRIPT
.ENDM

@---------------------------------------------
@	特殊接続セット
@---------------------------------------------
.MACRO	_SET_SP_MAP_ID	div,map,x,y
	.byte	EVCMD_SETSPMAPID
	.byte	\div,\map,NO_EXIT_ID
	.short	\x,\y
.ENDM

@---------------------------------------------
@	ダイビング接続先セット
@---------------------------------------------
.MACRO	_SET_DIVING_MAP_ID	div,map,x,y
	.byte	EVCMD_SETDIVINGID
	.byte	\div,\map,NO_EXIT_ID
	.short	\x,\y
.ENDM

@---------------------------------------------
@	落とし穴接続先セット
@---------------------------------------------
.MACRO	_SET_PITFALL_MAP_ID	div,map,x,y
	.byte	EVCMD_SETPITFALLID
	.byte	\div,\map,NO_EXIT_ID
	.short	\x,\y
.ENDM

@---------------------------------------------
@	あなぬけ接続先セット
@---------------------------------------------
.MACRO	_SET_ESCAPE_MAP_ID	div,map,x,y
	.byte	EVCMD_SET_ESCMAPID
	.byte	\div,\map,NO_EXIT_ID
	.short	\x,\y
.ENDM

@---------------------------------------------
@	ワープの戻り先をセットする(戦闘で敗北した時など)
@---------------------------------------------
@ 
.MACRO	_SET_WARP_ID	id
	.byte	EVCMD_SETWARPID
	.short	\id
.ENDM

@---------------------------------------------
@	現在のマップ位置の取得
@---------------------------------------------
.MACRO	_GET_MAP_POS	x,y
	.byte	EVCMD_GET_MAPPOS
	.short	\x,\y
.ENDM

@----------------------------------------------------------
@	指定位置にセルをセット
@----------------------------------------------------------
@ 
.MACRO	_SET_CELL		x,y,code,chk
	.byte	EVCMD_SETCELL
	.short	\x,\y,\code,\chk
.ENDM

@---------------------------------------------
@	手持ちのポケモンの人数を取得
@---------------------------------------------
.MACRO	_GET_TEMOTI_NUM
	.byte	EVCMD_GETTEMOTINUM
.ENDM


@----------------------------------------------------------
@	お金関連
@----------------------------------------------------------
@ 
@---------------------------------------------
@ お金を加える
@ code = 処理を行う場所,指定なしの場合は手持ち
@---------------------------------------------
.MACRO	_ADD_GOLD	gold,code = 0
	.byte	EVCMD_ADDGOLD
	.word	\gold
	.byte	\code
.ENDM

@---------------------------------------------
@ お金を引く
@ code = 処理を行う場所,指定なしの場合は手持ち
@---------------------------------------------
.MACRO	_SUB_GOLD	gold,code = 0
	.byte	EVCMD_SUBGOLD
	.word	\gold
	.byte	\code
.ENDM

@---------------------------------------------
@ 金額を調べる
@ code = 処理を行う場所,指定なしの場合は手持ち
@---------------------------------------------
.MACRO	_COMP_GOLD	gold,code = 0
	.byte	EVCMD_COMPGOLD
	.word	\gold
	.byte	\code
.ENDM

@---------------------------------------------
@ 所持金ウィンドウ表示
@ code = 処理を行う場所,指定なしの場合は手持ち
@---------------------------------------------
.MACRO	_GOLD_WIN_WRITE	x,y,code = 0
	.byte	EVCMD_GOLDWINWRITE
	.byte	\x,\y,\code
.ENDM

@---------------------------------------------
@ 所持金ウィンドウ削除
@---------------------------------------------
.MACRO	_GOLD_WIN_DEL	x,y
	.byte	EVCMD_GOLDWINDEL
	.byte	\x,\y
.ENDM

@---------------------------------------------
@ 所持金ウィンドウ更新
@ code = 処理を行う場所,指定なしの場合は手持ち
@---------------------------------------------
.MACRO	_GOLD_WRITE	x,y,code = 0
	.byte	EVCMD_GOLDWRITE
	.byte	\x,\y,\code
.ENDM

@----------------------------------------------------------
@	ショップ関連
@----------------------------------------------------------
@---------------------------------------------
@　ショップ呼び出し
@---------------------------------------------
// フレンドリィショップ
.MACRO	_SHOP_START	menu
	.byte	EVCMD_SHOPSTART
	.word	\menu
	_TALK_KEYWAIT	msg_shop_p02
	_TALK_OBJ_END
	_END
.ENDM

// グッズショップ
.MACRO	_GOODS_SHOP_START	menu
	.byte	EVCMD_GD_SHOPSTART
	.word	\menu
	_TALK_KEYWAIT	msg_shop_p02
	_TALK_OBJ_END
	_END
.ENDM

// フラワーショップ
.MACRO	_FLOWER_SHOP_START	menu
	.byte	EVCMD_FL_SHOPSTART
	.word	\menu
	_TALK_KEYWAIT	msg_shop_p02
	_TALK_OBJ_END
	_END
.ENDM

@---------------------------------------------
@	ショップメニュー記述用定義
@---------------------------------------------
.MACRO	_SHOP_MENU_START	menu
	.ALIGN
\menu:
.ENDM

.MACRO	_SHOP_MENU	item
	.short	\item
.ENDM
.MACRO	_SHOP_MENU_END
	.short	0
.ENDM

@----------------------------------------------------------
@	カジノ関連
@----------------------------------------------------------
@---------------------------------------------
@	スロットマシーン
@---------------------------------------------
.MACRO	_SLOT_MACHINE	type
	.byte	EVCMD_SLOTMACHINE
	.short	\type
.ENDM

@----------------------------------------------------------
@		きのみ関連
@----------------------------------------------------------
.MACRO	_SET_SEED	bed_no,type,growth
	.byte	EVCMD_SET_SEED
	.byte	\bed_no,\type,\growth
.ENDM

@----------------------------------------------------------
@	ＴＶ企画
@----------------------------------------------------------
@ 
@ 開催しているCMデータがあるか
.MACRO	_CM_EVENT_START_CHK	type
	.byte	EVCMD_CMEVENTSTARTCHK
	.short	\type
.ENDM

@----------------------------------------------------------
@	コンテスト
@----------------------------------------------------------
@ 
@　コンテストのポケモン選択(ステータス画面)呼び出し
.MACRO	_CON_POKELIST
	.byte	EVCMD_CONPOKELIST
.ENDM

@　二次審査を呼び出す
.MACRO	_CON_NIJI_CALL
	.byte	EVCMD_CONNIJICALL
.ENDM

@　結果発表画面を呼び出す
.MACRO	_CON_RESULTSCR
	.byte	EVCMD_CONRESULTSCR
.ENDM

@　コンテスト通信
.MACRO	_CON_TUUSIN_INIT
	.byte	EVCMD_CONTUUSININIT
.ENDM

@----------------------------------------------------------
@	フィールドエフェクト
@----------------------------------------------------------
@ 
@　呼び出し
.MACRO	_SET_FLD_EFF		no
	.byte	EVCMD_SETFLDEFF
	.short	\no
.ENDM

@　ワークセット		2002/01/24 by nakahiro
.MACRO	_SET_FE_WORK		no,param
	.byte	EVCMD_SETFEWORK
	.byte	\no
	.short	\param
.ENDM

@  エフェクト終了待ち(code = エフェクトコード)
.MACRO	_FLD_EFF_WAIT	code
	.byte	EVCMD_FLDEFFWAIT
	.short	\code
.ENDM


@----------------------------------------------------------
@	性別を取得する
@----------------------------------------------------------
@ 
.MACRO	_GET_MY_SEX
	.byte	EVCMD_GETMYSEX
.ENDM

@----------------------------------------------------------
@	ポケモンの泣き声を鳴らす
@----------------------------------------------------------
@ 
.MACRO	_VOICE_PLAY		no,ptn
	_SE_WAIT
	.byte	EVCMD_VOICEPLAY
	.short	\no,\ptn
.ENDM

.MACRO	_VOICE_WAIT
	.byte	EVCMD_VOICE_WAIT
.ENDM

@----------------------------------------------------------
@	ドアアニメ呼び出し
@----------------------------------------------------------
@ 
@ドアアニメーション(あける)
.MACRO	_OPEN_DOOR_ANIME		x,y
	.byte	EVCMD_OPENDOORANIME
	.short	\x,\y
.ENDM

@ドアアニメーション(しめる)
.MACRO	_CLOSE_DOOR_ANIME		x,y
	.byte	EVCMD_CLOSEDOORANIME
	.short	\x,\y
.ENDM

@ドアアニメーション終了待ち
.MACRO	_DOOR_ANIME_WAIT
	.byte	EVCMD_DOORANIMEWAIT
.ENDM

@ドアのセルをセットする(あいている状態にする)
.MACRO	_OPEN_DOOR_SET	x,y
	.byte	EVCMD_OPENDOORSET
	.short	\x,\y
.ENDM

@ドアのセルをセットする(しまっている状態にする)
.MACRO	_CLOSE_DOOR_SET	x,y
	.byte	EVCMD_CLOSEDOORSET
	.short	\x,\y
.ENDM

@----------------------------------------------------------
@	エレベータ関連
@----------------------------------------------------------

@---------------------------------------------
@	エレベータ記述用定義
@---------------------------------------------
.MACRO	_ELEVATOR_MENU	msg,div,map,exit
	.byte	EVCMD_ELEVATORSET
	.byte	\msg
	.short	\div,\map,\exit
.ENDM

.MACRO	_ELEVATOR_MENU_START
	_TALKMSG	msg_elevator_p01
	_TALK_WAIT
	.byte	EVCMD_ELEVATORSTART
.ENDM


@----------------------------------------------------------
@	コイン関連	2002/07/03 by nakahiro
@----------------------------------------------------------
@ 手持ちコインの枚数をチェック
.MACRO	_CHECK_COIN	wk
	.byte	EVCMD_CHECKCOIN
	.short	\wk
.ENDM

@ 手持ちコインを加える
.MACRO	_ADD_COIN	coin
	.byte	EVCMD_ADDCOIN
	.short	\coin
.ENDM

@ 手持ちコインを減らす
.MACRO	_SUB_COIN	coin
	.byte	EVCMD_SUBCOIN
	.short	\coin
.ENDM



@===================================================================
@
@
@	相対アドレス利用命令
@	
@	※配布用スクリプトのアドレスが不定なので
@	　データ・スクリプト分岐などすべて相対アドレス表記する。
@
@===================================================================

@----------------------------------------------------------
@	分岐命令関連
@----------------------------------------------------------

@---------------------------------------------
@	相対アドレス使用宣言
@---------------------------------------------
.MACRO		_INIT_RELATIVE_ADRS	adrs
	.GLOBAL	\adrs
\adrs:
	.byte	EVCMD_SET_RELADRS
	.word	\adrs
.ENDM

@---------------------------------------------
@	相対アドレスジャンプ
@---------------------------------------------
.MACRO		_JUMPR	adrs
	.byte	EVCMD_JUMPR
	.word	\adrs
.ENDM

@---------------------------------------------
@	相対アドレスコール
@---------------------------------------------
.MACRO		_CALLR	adrs
	.byte	EVCMD_CALLR
	.word	\adrs
.ENDM

@---------------------------------------------
@	条件付き相対アドレスジャンプ
@---------------------------------------------
.MACRO		_IF_JUMPR	cond,adrs
	.byte	EVCMD_IFJUMPR
	.byte	\cond
	.word	\adrs
.ENDM

@---------------------------------------------
@	条件付き相対アドレスコール
@---------------------------------------------
.MACRO		_IF_CALLR	cond,adrs
	.byte	EVCMD_IFCALLR
	.byte	\cond
	.word	\adrs
.ENDM

@ フラグがONのとき分岐
.MACRO	_IF_FLAGON_JUMPR	flag,adr
	.byte	EVCMD_FLAGCHECK
	.short	\flag
	_IF_JUMPR FLGON ,\adr
.ENDM

@ フラグがONのとき分岐(CALL)				02/03/05	nohara
.MACRO	_IF_FLAGON_CALLR	flag,adr
	.byte	EVCMD_FLAGCHECK
	.short	\flag
	_IF_CALLR FLGON ,\adr
.ENDM

@ フラグがOFFのとき分岐
.MACRO	_IF_FLAGOFF_JUMPR	flag,adr
	.byte	EVCMD_FLAGCHECK
	.short	\flag
	_IF_JUMPR FLGOFF ,\adr
.ENDM

@ フラグがOFFのとき分岐(CALL)				02/03/05	nohara
.MACRO	_IF_FLAGOFF_CALLR	flag,adr
	.byte	EVCMD_FLAGCHECK
	.short	\flag
	_IF_CALLR FLGOFF ,\adr
.ENDM

@ワークと値を比較、条件どおりの場合分岐
.MACRO	_IFVAL_JUMPR	wk,cond,val,adr
	_CMPVAL	\wk,\val
	.byte	EVCMD_IFJUMPR
	.byte	\cond
	.word	\adr
.ENDM

@ワークと値を比較、条件どおりの場合分岐
.MACRO	_IFVAL_CALLR	wk,cond,val,adr
	_CMPVAL	\wk,\val
	.byte	EVCMD_IFCALLR
	.byte	\cond
	.word	\adr
.ENDM

@ ワークとワークを比較、条件どおりの場合分岐
.MACRO	_IFWK_JUMPR	wk1,cond,wk2,adr
	_CMPWK	\wk1,\wk2
	.byte	EVCMD_IFJUMPR
	.byte	\cond
	.word	\adr
.ENDM

@ ワークとワークを比較、条件どおりの場合分岐
.MACRO	_IFWK_CALLR	wk1,cond,wk2,adr
	_CMPWK	\wk1,\wk2
	.byte	EVCMD_IFCALLR
	.byte	\cond
	.word	\adr
.ENDM

@----------------------------------------------------------
@----------------------------------------------------------
@---------------------------------------------
@	会話ＭＳＧ表示（相対アドレス指定）
@---------------------------------------------
.MACRO	_TALKMSG_REL	ADDRESS
	.byte	EVCMD_TALKMSG_REL
	.word	\ADDRESS
.ENDM

@---------------------------------------------
@	指定メッセージの展開をおこなう(相対アドレス指定）
@---------------------------------------------
.MACRO	_EXPAND_MSG_REL	ADDRESS
	.byte	EVCMD_EXPANDMSG_REL
	.word	\ADDRESS
.ENDM

@---------------------------------------------
@	指定文字列をバッファにコピー(相対アドレス指定）
@---------------------------------------------
.MACRO	_COPY_BUF_REL	buf_no,	ADDRESS
	.byte	EVCMD_COPYBUF_REL
	.byte	\buf_no
	.word	\ADDRESS
.ENDM

@----------------------------------------------------------
@	でんせつ関連
@		でんせつ用記録のカウントアップ
@----------------------------------------------------------
.MACRO	_INC_RECORD	record_id
	.byte	EVCMD_INC_RECORD
	.byte	\record_id
.ENDM

@----------------------------------------------------------
@	音楽・ＳＥ関連
@	ＳＥ終了待ち	
@----------------------------------------------------------
.MACRO	_SE_WAIT
	.byte	EVCMD_SE_WAIT
.ENDM

