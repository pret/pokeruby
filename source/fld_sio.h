
#ifndef __FLD_SIO_H__
#define __FLD_SIO_H__


//=========================================================================
//	
//=========================================================================

#undef GLOBAL
#ifdef __FLD_SIO_H_GLOBAL_
#define GLOBAL /*	*/
#else
#define GLOBAL extern
#endif

//=========================================================================
//	定義
//=========================================================================

//フィールドでの通信状態監視機能を有効にするための定義（デバッグ）
//#define	FIELD_TUUSHIN_DEBUG



//FIFO解消システム用の定義
enum {
	//FIFO解消を停止するFIFO段数
	FLD_RFIFO_LIMIT_VALUE	=	2,
	FLD_SFIFO_LIMIT_VALUE	=	2,

	//FIFO解消を開始するFIFO段数
	FLD_RFIFO_CLEAR_VALUE	=	4,
	FLD_SFIFO_CLEAR_VALUE	=	4,
};


#if	defined(FIELD_TUUSHIN_DEBUG) && defined(PM_DEBUG)
enum {
	//デバッグ用ワークの大きさ定義
	DB_INFO_MAX		=	4,

};
#define	DB_SIO_PLAYER_MAX	(4)

	#if	defined(MULTI_SIO_PLAYERS_MAX) && (MULTI_SIO_PLAYERS_MAX!=DB_SIO_PLAYER_MAX)
	#error SIOプレイの最大人数が違う！！
	#endif

	#if	defined(COMM_PLAYER_MAX) && (COMM_PLAYER_MAX != DB_SIO_PLAYER_MAX)
	#error SIOプレイの最大人数が違う！！
	#endif

#endif

//=========================================================================
//	変数
//=========================================================================
//GLOBAL type valiable;

#if	defined(PM_DEBUG) && defined(FIELD_TUUSHIN_DEBUG)
extern u8 debug_comm_info[DB_INFO_MAX][DB_SIO_PLAYER_MAX];
extern u16 debug_player_cmd[DB_SIO_PLAYER_MAX];
#endif

//=========================================================================
//	関数プロトタイプ
//=========================================================================
//GLOBAL type function(arg...);

//-------------------------------------------------------------
//受信FIFOの解消待ち
//<戻り値>	TRUE	解消待ち中
//			FALSE	解消待ち終了
//-------------------------------------------------------------
extern int FieldRecvFifoClearWait( void );	//fld_main.c

//-------------------------------------------------------------
//受信FIFOの解消を許可するか?
//-------------------------------------------------------------
extern int IsEnableClearRecvFifo( void );	//fld_main.c

//-------------------------------------------------------------
//送信FIFOの解消を許可するか?
//-------------------------------------------------------------
extern int IsEnableClearSendFifo( void );	//fld_main.c

//-------------------------------------------------------------
//メイン処理のスキップを許可するか?
//-------------------------------------------------------------
extern int IsEnableSkipFieldMain( void );	//fld_main.c


#undef GLOBAL
#endif	/*__FLD_SIO_H__*/

