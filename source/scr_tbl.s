@===================================================================
@
@	共通スクリプト呼び出し定義
@
@===================================================================


@----------------------------------------------------------
@
@	テーブル定義用のマクロ宣言
@
@----------------------------------------------------------
.MACRO	INIT_SCRIPT_TBL
.IFDEF	SCR_TBL_S_GLOBAL
	.ALIGN
.ENDIF
DEF_SCRIPT_COUNT	=	0
.ENDM

.MACRO	DEF_SCRIPT_TBL	funcID , symname
.IFDEF	SCR_TBL_S_GLOBAL			@ 唯一の個所でしかテーブルは生成しない
.WORD	\symname
.ENDIF
\funcID			=	DEF_SCRIPT_COUNT
DEF_SCRIPT_COUNT 	=	(DEF_SCRIPT_COUNT + 1)
.ENDM

.MACRO	SCRIPT_TBL_LABEL	adrs
.IFDEF	SCR_TBL_S_GLOBAL
	.GLOBAL	\adrs
\adrs:
.ENDIF
.ENDM


@----------------------------------------------------------
@
@----------------------------------------------------------
SCRIPT_TBL_LABEL	CommonScriptTableStart
	INIT_SCRIPT_TBL
	DEF_SCRIPT_TBL	SCRID_ITEM_EVENT,			ev_item_event
	DEF_SCRIPT_TBL	SCRID_FLD_ITEM_EVENT,		ev_fld_item_event
	DEF_SCRIPT_TBL	SCRID_EASYOBJMSGSCRIPT,		EasyObjMessageScript
	DEF_SCRIPT_TBL	SCRID_EASYBGMSGSCRIPT,		EasyBgMessageScript
	DEF_SCRIPT_TBL	SCRID_MSGWAITKEYSCRIPT,		MessageWaitKeyScript
	DEF_SCRIPT_TBL	SCRID_MSGYESNOSCRIPT,		MessageYesNoScript
	DEF_SCRIPT_TBL	SCRID_TRAINEREASYMSG,		TrainerEasyMsgScript
	DEF_SCRIPT_TBL	SCRID_GOODS_EVENT,			ev_goods_event

SCRIPT_TBL_LABEL	CommonScriptTableEnd



