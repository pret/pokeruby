
#ifndef __EX_LOAD_H__
#define __EX_LOAD_H__

//=========================================================================
//	
//=========================================================================

#undef GLOBAL
#ifdef __EX_LOAD_H_GLOBAL__
#define GLOBAL /*	*/
#else
#define GLOBAL extern
#endif

//=========================================================================
//	定義
//=========================================================================
//#define name value

//typedef ...

#define	EXRUN_RET_NORMAL_END		0	 	//通常終了
#define EXRUN_RET_ERROR_END			1		//エラー、MSGなし
#define	EXRUN_RET_NORMAL_MSG_END	2		//正常終了、MSGあり
#define	EXRUN_RET_ERROR_MSG_END		3		//エラー、MSGあり

#ifndef	ASM_CPP
//=========================================================================
//	変数
//=========================================================================
//GLOBAL type valiable;

#ifdef	PM_DEBUG
//むげんのチケット入手イベント用外部データ
extern const u8 ExtraDataStartMugenTicketScript[];
extern const u8 ExtraDataEndMugenTicketScript[];

//ポケモン入手外部データのサンプル
extern const u8 ExtraDataStartSamplePokeData[];
extern const u8 ExtraDataEndSamplePokeData[];

//外部データアドレスの配列
extern const u8* const ExDataAdrs[][2];

//外部データの指定ID
enum{
	EXDATA_MUGEN_TICKET = 0,
	EXDATA_SAMPLE_POKEDATA,
	EXDATA_SAMPLE_RIBBON,
	EXDATA_SAMPLE_ZUKAN,
	EXDATA_SAMPLE_WORD,

	EXDATA_END,
};

//サンプルデータ生成ルーチンのテーブル
typedef u32 (*ExDataMakeFunc)(u8 *);
typedef struct _EX_SAMPLE_DATA {
	const u8 * title;
	ExDataMakeFunc make_func;
}EX_SAMPLE_DATA;

extern const EX_SAMPLE_DATA  ExDataMaker[];
extern const u8 SizeOfExDataMaker;

#endif	PM_DEBUG


//=========================================================================
//	関数プロトタイプ
//=========================================================================
//GLOBAL type function(arg...);
//-------------------------------------------------------------------------
//外部追加データ処理
//	※外部から追加されたアドレスを解釈、処理する
//	<引数>
//		ex_data			外部データアドレス
//	<戻り値>
//		EXRUN_RET_～	※定義を参照
//-------------------------------------------------------------------------
GLOBAL int RunExtraData( const u8 * ex_data );

//-------------------------------------------------------------------------
//	外部データエラーコードセット
//	<引数>	エラーコード
//			※EXRUN_RET_～の定義を参照
//-------------------------------------------------------------------------
GLOBAL void SetExtraDataError( u32 error );

//-------------------------------------------------------------------------
//	配布アイテムの存在チェック
//-------------------------------------------------------------------------
GLOBAL int CheckExItemExists( void );

//-------------------------------------------------------------------------
//	配布アイテムの消去
//-------------------------------------------------------------------------
GLOBAL void ClearExItem( void );

//-------------------------------------------------------------------------
//	配布アイテムの設定
//	<引数>	type		配布種別（今のところ１種類のみ）
//			count		配布上限
//			number		配布アイテムナンバー
//-------------------------------------------------------------------------
GLOBAL void SetExItem( u8 type, u8 count, u16 number );

//-------------------------------------------------------------------------
//	配布アイテム取得
//	<戻り値>		アイテムナンバー
//					０のとき、存在しない
//	※自動的に配布数をカウントダウンする
//-------------------------------------------------------------------------
GLOBAL u16 GetExItem( void );


//-------------------------------------------------------------------------
//	外部データをフラッシュにセーブする
//	※デバッグ用
//	<引数>	外部データ指定ID
//-------------------------------------------------------------------------
GLOBAL void DebugExtraDataSave( u8 id );


#endif	/* ASM_CPP */

#undef GLOBAL
#endif	/*__EX_LOAD_H__*/

