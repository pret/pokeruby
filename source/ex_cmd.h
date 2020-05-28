#ifndef	__EX_CMD_H__
#define	__EX_CMD_H__

//-------------------------------------------------------------------------
//	外部データ認証用のコード
//-------------------------------------------------------------------------

#define		MASK_VALUE(id)	(1<<(id-1))

//	バージョンコード指定
#define		VER_ID_RED					1
#define		VER_ID_GREEN				2
#define		VER_ID_BLUE					3
#define		VER_ID_YELLOW				4
#define		VER_ID_GOLD					5
#define		VER_ID_SILVER				6
#define		VER_ID_CRYSTAL				7
#define		VER_ID_RUBY					8
#define		VER_ID_SAPPHIRE				9

//	世代別コード指定
#define		GEN_ID_PM1					1
#define		GEN_ID_PM2					2
#define		GEN_ID_RUBY_SAPPHIRE		3

//	地域コード指定
#define		AREA_ID_JAPAN				1
#define		AREA_ID_NORTHAMERICA		2
#define		AREA_ID_EUROPA				3
#define		AREA_ID_AUSTRALIA			4
#define		AREA_ID_ASIA				5

//	言語コード指定
#define		LANGAREA_ID_JAPAN			1
#define		LANGAREA_ID_USA				2
#define		LANGAREA_ID_GERMANY			3
#define		LANGAREA_ID_FRANCE			4
#define		LANGAREA_ID_ITARY			5
#define		LANGAREA_ID_SPAIN			6
#define		LANGAREA_ID_PORTUGUESE		7
#define		LANGAREA_ID_UK				8
#define		LANGAREA_ID_AUSTRALIA		9



#if	(PM_LANG==LANG_JAPAN)

#define	EXDATA_AREA_VALUE		MASK_VALUE(AREA_ID_JAPAN)
#define	EXDATA_LANGAREA_VALUE	MASK_VALUE(LANGAREA_ID_JAPAN)

#endif



#if	(PM_VERSION==VERSION_RUBY)

#define	EXDATA_VER_VALUE	MASK_VALUE(VER_ID_RUBY)
#define	EXDATA_GEN_VALUE	MASK_VALUE(GEN_ID_RUBY_SAPPHIRE)

#elif	(PM_VERSION==VERSION_SAPPHIRE)

#define	EXDATA_VER_VALUE	MASK_VALUE(VER_ID_SAPPHIRE)
#define	EXDATA_GEN_VALUE	MASK_VALUE(GEN_ID_RUBY_SAPPHIRE)

#endif


#ifdef	ASM_CPP

@==========================================================
@
@	外部データ用コマンド
@
@==========================================================

@----------------------------------------------------------
@
@	コマンド定義用のマクロ宣言
@
@----------------------------------------------------------
.MACRO	INIT_EX_CMD
.IFDEF	EX_CMD_S_GLOBAL
	.ALIGN
.ENDIF
DEF_EX_CMD_COUNT	=	0
.ENDM

.MACRO	DEF_EX_CMD	symname , funcname
.IFDEF	EX_CMD_S_GLOBAL			@ 唯一の個所でしかテーブルは生成しない
.WORD	\funcname
.ENDIF
\symname	=	DEF_EX_CMD_COUNT
DEF_EX_CMD_COUNT 	=	(DEF_EX_CMD_COUNT + 1)
.ENDM

.MACRO	DEF_EX_LABEL	symbol
.IFDEF	EX_CMD_S_GLOBAL
	.GLOBAL \symbol
\symbol:
.ENDIF
.ENDM


@----------------------------------------------------------
@
@		コマンドテーブル
@
@----------------------------------------------------------
	INIT_EX_CMD
	DEF_EX_LABEL	ExtraDataCommandStart

	DEF_EX_CMD		EX_CMD_NOP,			ExCmdNop
	DEF_EX_CMD		EX_CMD_START,		ExCmdSetStart
	DEF_EX_CMD		EX_CMD_END,			ExCmdEnd
	DEF_EX_CMD		EX_CMD_SET_MSG,		ExCmdSetMessage
	DEF_EX_CMD		EX_CMD_SET_RESULT,	ExCmdSetResult
	DEF_EX_CMD		EX_CMD_DO_SCRIPT,	ExCmdDoScriptDirect
	DEF_EX_CMD		EX_CMD_SET_SCRIPT,	ExCmdSetScript
	DEF_EX_CMD		EX_CMD_SET_SEED,	ExCmdSetSeed
	DEF_EX_CMD		EX_CMD_SET_RIBBON,	ExCmdSetRibbon
	DEF_EX_CMD		EX_CMD_SET_SP_ZUKAN,ExCmdSetSpecialZukan
	DEF_EX_CMD		EX_CMD_SET_WORD,	ExCmdSetKaiwaWord
	DEF_EX_CMD		EX_CMD_SET_DISTITEM,ExCmdSetDistributeItem
	DEF_EX_CMD		EX_CMD_SET_POKEMON,	ExCmdSetPokemon
	DEF_EX_CMD		EX_CMD_SET_TRAINER,	ExCmdSetBattleTrainer
	DEF_EX_CMD		EX_CMD_SET_RTC,		ExCmdSetGameTimeReset
	DEF_EX_CMD		EX_CMD_CHECKSUM,	ExCmdCheckSum
	DEF_EX_CMD		EX_CMD_CHECKCRC,	ExCmdCheckCRC

	DEF_EX_LABEL	ExtraDataCommandEnd


@==========================================================
@==========================================================

.MACRO	_EXTRA_LABEL	adrs
	.GLOBAL	\adrs
\adrs:
.ENDM

@----------------------------------------------------------
@	外部データ開始
@	・データ先頭に必ず必要。
@	・相対アドレスを算出するのに使用している
@----------------------------------------------------------
.MACRO	_EXTRA_DATA_START_LABEL	adrs
	.GLOBAL \adrs
\adrs:
	.byte	EX_CMD_START
	.word	\adrs
.ENDM

@----------------------------------------------------------
@	外部データ終了
@	・すべてのデータの一番最後に配置する
@----------------------------------------------------------
.MACRO	_EXTRA_DATA_END_LABEL	adrs
	.GLOBAL	\adrs
\adrs:
.ENDM


@----------------------------------------------------------
@	外部データ認識コード（自国用）
@----------------------------------------------------------
.MACRO	_EXTRA_DATA_MINE_VALUE
	.2byte		EXDATA_AREA_VALUE
	.4byte		EXDATA_LANGAREA_VALUE
	.2byte		EXDATA_GEN_VALUE
	.4byte		EXDATA_VER_VALUE
.ENDM

@----------------------------------------------------------
@	外部データ処理終了
@----------------------------------------------------------
.MACRO		_EXTRA_DATA_END
	.byte	EX_CMD_END
.ENDM

@----------------------------------------------------------
@	メッセージをセットする
@----------------------------------------------------------
.MACRO		_EXTRA_SET_NORMAL_MSG	adrs
	.byte	EX_CMD_SET_MSG
	.byte	EXRUN_RET_NORMAL_MSG_END
	.word	\adrs
.ENDM

.MACRO		_EXTRA_SET_ERROR_MSG	adrs
	.byte	EX_CMD_SET_MSG
	.byte	EXRUN_RET_ERROR_MSG_END
	.word	\adrs
.ENDM

.MACRO		_EXTRA_SET_MESSAGE	adrs
	.byte	EX_CMD_SET_MSG
	.byte	0xff
	.word	\adrs
.ENDM


@----------------------------------------------------------
@	終了結果コードのセット
@----------------------------------------------------------
.MACRO		_EXTRA_SET_RESULT	code
	.byte	EX_CMD_SET_RESULT
	.byte	\code
.ENDM


@----------------------------------------------------------
@	スクリプトの実行
@----------------------------------------------------------
.MACRO		_EXTRA_DO_SCRIPT	adrs
	.byte	EX_CMD_DO_SCRIPT
	.word	\adrs
.ENDM

@----------------------------------------------------------
@	追加スクリプトをセットする
@----------------------------------------------------------
.MACRO		_EXTRA_SET_SCRIPT	div,map,obj,start,end
	_EXTRA_SET_SCROBJ	\div,\map,\obj
	_EXTRA_SET_SCRADRS	\start,\end
.ENDM

.MACRO		_EXTRA_SET_SCROBJ	div,map,obj
	.byte	EX_CMD_SET_SCRIPT
	.byte	\div,\map,\obj
.ENDM

.MACRO		_EXTRA_SET_SCRADRS	start,end
	.word	\start
	.word	\end
.ENDM

@----------------------------------------------------------
@	ＲＡＭ木の実をセットする
@----------------------------------------------------------
.MACRO		_EXTRA_SET_RAM_SEED		adrs
	.byte	EX_CMD_SET_SEED
	.word	\adrs
.ENDM

@----------------------------------------------------------
@	外部リボンを追加する
@----------------------------------------------------------
.MACRO		_EXTRA_SET_RIBBON		pos,type
	.byte	EX_CMD_SET_RIBBON
	.byte	\pos,\type
.ENDM

@----------------------------------------------------------
@	図鑑全国モードを有効にする
@----------------------------------------------------------
.MACRO		_EXTRA_SET_SPECIAL_ZUKAN
	.byte	EX_CMD_SET_SP_ZUKAN
.ENDM

@----------------------------------------------------------
@	簡易会話用単語フラグをセットする
@----------------------------------------------------------
.MACRO		_EXTRA_SET_KAIWA_WORD	word_no
	.byte	EX_CMD_SET_WORD
	.byte	\word_no
.ENDM

@----------------------------------------------------------
@	配布アイテムデータをセット
@----------------------------------------------------------
.MACRO		_EXTRA_SET_DISTITEM	type,count,item_no
	.byte	EX_CMD_SET_DISTITEM
	.byte	\type
	.byte	\count
	.short	\item_no
.ENDM

@----------------------------------------------------------
@	ポケモンデータをセット
@----------------------------------------------------------
.MACRO		_EXTRA_SET_POKEMON	mons_data
	.byte	EX_CMD_SET_POKEMON
	.word	\mons_data
.ENDM

@----------------------------------------------------------
@	対戦トレーナーのデータをセット
@----------------------------------------------------------
.MACRO	_EXTRA_SET_BATTLETRAINER	adrs
	.byte	EX_CMD_SET_TRAINER
	.word	\adrs
.ENDM

@----------------------------------------------------------
@	時間再設定を許可する
@----------------------------------------------------------
.MACRO	_EXTRA_SET_RTCRESET_ENABLE
	.byte	EX_CMD_SET_RTC
.ENDM

@----------------------------------------------------------
@	チェックサムの検査
@----------------------------------------------------------
.MACRO	_EXTRA_CHECKSUM	value,start,end
	.byte	EX_CMD_CHECKSUM
	.word	\value
	.word	\start
	.word	\end
.ENDM

@----------------------------------------------------------
@	ＣＲＣの検査
@----------------------------------------------------------
.MACRO	_EXTRA_CHECK_CRC	value,start,end
	.byte	EX_CMD_CHECKCRC
	.word	\value
	.word	\start
	.word	\end
.ENDM


#endif /* ASM_CPP */


#endif /* __EX_CMD_H__ */

