#ifndef FLD_MAIN_H
#define FLD_MAIN_H

//=========================================================================
//	
//	フィールドメイン制御
//
//=========================================================================


#undef GLOBAL
#ifdef FLD_MAIN_H_GLOBAL
#define GLOBAL /*	*/
#else
#define GLOBAL extern
#endif

//=========================================================================
//	定義
//=========================================================================
//#define name value

//typedef ...

//=========================================================================
//	変数
//=========================================================================
//GLOBAL type valiable;

extern pFunc pFieldRecoverFunc;		// フィールド復帰処理の関数ポインタ

extern u8 comm_player_num;			//通信同期時の人数
extern u8 comm_my_id;				//通信同期時の自分のID
extern u16 my_command;				//通信時の動作コード受け渡し用変数

//=========================================================================
//	関数プロトタイプ
//=========================================================================
//GLOBAL type function(arg...);

GLOBAL void NormalGameStart(void);		//通常ゲーム開始
GLOBAL void DebugGameStart(void);		//デバッグモードゲーム開始
GLOBAL void GameOverRestart(void);		//ゲームオーバー時の再開
GLOBAL void ContinueGameStart(void);	//「つづきから」開始
GLOBAL void FieldMainInit(void);		//マップ遷移時のリスタート
GLOBAL void FieldMainCommInit(void);
GLOBAL void FieldMainRecover(void);		//画面切り替え時の復帰
GLOBAL void FieldMenuRecover(void);		//メニューへの復帰
GLOBAL void FieldScriptRecover(void);	//スクリプト実行への復帰
GLOBAL void FieldScriptRecoverBGMNotStart(void);	//スクリプト実行への復帰(BGMそのまま)
GLOBAL void FieldCommRecover(void);		//通信同期状態への復帰
GLOBAL void FieldNormalRecover( void );	//何もせずにフィールド復帰

GLOBAL void FieldContestInit( void );	//マップ遷移から（コンテスト専用）

GLOBAL void FieldMain(void);
GLOBAL void FieldEffectMain(void);

//-------------------------------------------------------------
//	フィールド通信モードかどうかのチェック
//	※今は関数ポインタを見ているがフラグに変更するかも
//-------------------------------------------------------------
GLOBAL int IsFieldCommMode( void );

// 通信中の制御
//-------------------------------------------------------------
//イベント開始待ちチェック
//	<戻り値>
//	0		待ち状態
//	1		イベント開始
//	2		イベントキャンセル（出口処理へ）
//-------------------------------------------------------------
GLOBAL int CommEventWaitCheck(void);

//-------------------------------------------------------------
//	通信終了チェック
//	<戻り値>	TRUE	だれかがやめるをえらんだ
//				FALSE
//-------------------------------------------------------------
GLOBAL int CommEventEndCheck(void);

GLOBAL int CommEventWaitStart( void );		//イベント開始待ちスタート
GLOBAL int CommEventWaitCancel( void );		//イベント開始待ちキャンセル
GLOBAL int CommExitWaitStart( void );		//通信終了スタート


#undef GLOBAL
#endif	/*FLD_MAIN_H*/

