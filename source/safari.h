
#ifndef __SAFARI_H__
#define __SAFARI_H__

//=========================================================================
//	
//		サファリ関連ヘッダ
//
//=========================================================================

#undef GLOBAL
#ifdef __SAFARI_H_GLOBAL__
#define GLOBAL /*	*/
#else
#define GLOBAL extern
#endif

//=========================================================================
//	定義
//=========================================================================
//#define name value

//typedef ...

#define	SAFARI_BALL_MAX		30
#define	SAFARI_STEP_MAX		500


//=========================================================================
//	変数
//=========================================================================
//GLOBAL type valiable;

//サファリボールの数
extern u8 SafariBallCount;
extern u16 SafariStepCount;

//=========================================================================
//	関数プロトタイプ
//=========================================================================
//GLOBAL type function(arg...);

GLOBAL int IsFieldSafariMode( void );//	サファリモードかどうかのチェック
GLOBAL void SetFieldSafariMode( void );
GLOBAL void ClearFieldSafariMode( void );

GLOBAL void SafariModeStart( void );	//	サファリモード開始
GLOBAL void SafariModeEnd( void );		//	サファリモード終了
GLOBAL u8 SafariStepCheck( void );		//	サファリの歩数チェック

//	サファリモードをやめるかどうかをたずねるスクリプトを呼び出す
GLOBAL void SafariCancelAskStart( void );	

//	サファリでのエンカウント戦終了後の処理
GLOBAL void SafariEncountEnd( void );

//-------------------------------------------------------------------------
//	キューブ置き場のデータを初期化
//-------------------------------------------------------------------------
GLOBAL void SafariCubeTableInit( u8 no );	// 個々
GLOBAL void SafariCubeTableInitAll(void);	// 全部

//-------------------------------------------------------------------------
//	キューブ置き場にキューブが置かれているか
//	置かれている   : AnswerWork = i
//	置かれていない : AnswerWork = 0xffff
//-------------------------------------------------------------------------
GLOBAL void SafariCubeTableCheck(void);

//-------------------------------------------------------------------------
//	キューブ置き場のキューブのパラメータを取得
//	戻り値 : 置かれている   = キューブデータのアドレス
//		   : 置かれていない = NULL
//-------------------------------------------------------------------------
GLOBAL CUBE * SafariCubeTableGet(void);
GLOBAL CUBE * SafariCubeTableGet2(void);

//-------------------------------------------------------------------------
//	キューブ置き場にキューブをセット
//	引数 : no = 手持ちキューブの番号
//-------------------------------------------------------------------------
GLOBAL void SafariCubeTableSet( u8 no );

//-------------------------------------------------------------------------
//	デバッグ用キューブ情報取得
//	<戻り値>	FALSE		キューブが存在しない
//				TRUE		キューブあり
//	StrTempBuffer0 = 名前、StrTempBuffer1 = 残り歩数
//-------------------------------------------------------------------------
GLOBAL int DebugSafariCubeInfo( void );

#undef GLOBAL
#endif	/*__SAFARI_H__*/

