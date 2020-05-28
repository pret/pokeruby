#ifndef __CONRES_H__
#define __CONRES_H__

#include "contest.h"


//----------------------------------------------------------
//	定数宣言
//----------------------------------------------------------
#define CRES_SPACE		0//382		//結果発表画面でのｸﾘｱ用ｽﾍﾟｰｽのｷｬﾗ位置
#define BALL_PUT_WAIT	35		//ボールを一個一個出していく間隔
#define RANKING_PUT_WAIT	20	//ﾎﾞｰﾙを表示し終わってからﾗﾝｷﾝｸﾞを出すまでのｳｪｲﾄ
#define POKEWIN_PUT_WAIT	30	//優勝したﾎﾟｹﾓﾝとｳｨﾝﾄﾞｳﾒｯｾｰｼﾞが出るまでのｳｪｲﾄ

//-- ﾒｯｾｰｼﾞ転送ｷｬﾗ位置 --//
#define CRES_MSG_START	0x200//0x100
#define CRES_NAME_LEN	(5*2)
#define CRES_OYA_LEN	(6*2)	//ｽﾗｯｼｭ付きなので6
#define CRES_NAME		CRES_MSG_START
#define CRES_OYA		(CRES_NAME + CRES_NAME_LEN*BREEDER_MAX)
#define CRES_WINMSG		(CRES_OYA + CRES_OYA_LEN*BREEDER_MAX)

//=========================================================================
//	新規
//=========================================================================
//----------------------------------------------------------
//	メッセージVRAM
//----------------------------------------------------------
//-- メッセージCGX長 --//
#define CRES_POKENAME_LEN		(MONS_NAME_SIZE*2)
#define CRES_BRDNAME_LEN		((PERSON_NAME_SIZE+1)*2)	//+1 = ｽﾗｯｼｭの分

//-- メッセージVRAM展開位置 --//
#define CRES_MSGCGX_START	(512+256)
#define CRES_CLEAR_MSG		CRES_MSGCGX_START
#define CRES_POKE_NAMECGX	(CRES_CLEAR_MSG+2)	//+2 = ｸﾘｱ用ｽﾍﾟｰｽの分
#define CRES_BRD_NAMECGX	(CRES_POKE_NAMECGX+CRES_POKENAME_LEN*BREEDER_MAX)

//ポケモンアイコン展開先の先頭キャラナンバー
#define CRES_POKEICON_TOPCHRNO	512

//----------------------------------------------------------
//	座標
//----------------------------------------------------------
#define CRES_STAR_X0	19	//最初のﾌﾞﾘｰﾀﾞｰの星のｷｬﾗ先頭座標
#define CRES_STAR_Y0	5
#define CRES_HEART_X0	CRES_STAR_X0	//最初のﾌﾞﾘｰﾀﾞｰのﾊｰﾄのｷｬﾗ先頭座標
#define CRES_HEART_Y0	(CRES_STAR_Y0+1)

//----------------------------------------------------------
//	スクリーンデータ定数
//----------------------------------------------------------
#define CRES_HEART_SPACE	0x60a2		//ﾊｰﾄ空白ｷｬﾗ
#define CRES_HEART_FIX		0x60a3		//ﾊｰﾄﾌｪｰﾄﾞしないｷｬﾗ
#define CRES_HEART_FADE		0x60a4		//ﾊｰﾄﾌｪｰﾄﾞするｷｬﾗ

#define CRES_HEARTBL_SPACE	CRES_HEART_SPACE		//黒ﾊｰﾄ空白ｷｬﾗ
#define CRES_HEARTBL_FIX	0x60a5		//黒ﾊｰﾄﾌｪｰﾄﾞしないｷｬﾗ
#define CRES_HEARTBL_FADE	0x60a6		//黒ﾊｰﾄﾌｪｰﾄﾞするｷｬﾗ

#define CRES_STAR_SPACE		0x60b2		//星空白ｷｬﾗ
#define CRES_STAR_FIX		0x60b3		//星ﾌｪｰﾄﾞしないキャラ
#define CRES_STAR_FADE		0x60b4		//星ﾌｪｰﾄﾞするｷｬﾗ

//----------------------------------------------------------
//	BGレジスタ設定
//----------------------------------------------------------
//キャラベースNo
#define CRES_HAIKEI_CHARBASE_NO	0	//背景用ｷｬﾗﾍﾞｰｽNo
#define CRES_EFF_CHARBASE_NO	CRES_HAIKEI_CHARBASE_NO	//ｴﾌｪｸﾄ用ｷｬﾗﾍﾞｰｽNo
#define CRES_FONT_CHARBASE_NO	CRES_HAIKEI_CHARBASE_NO	//ﾌｫﾝﾄ・ﾎﾟｹﾓﾝｱｲｺﾝ・ｹﾞｰｼﾞ用ｷｬﾗﾍﾞｰｽNo
//スクリーンNo
#define CRES_EFF_SCRN_NO		30
#define CRES_HAIKEI_SCRN_NO		26
#define CRES_FONT_SCRN_NO		24
#define CRES_WIN_SCRN_NO		28
//キャラベースアドレス
#define CRES_EFF_VRAM			(BG_VRAM+0x4000*CRES_EFF_CHARBASE_NO)
#define CRES_HAIKEI_VRAM		(BG_VRAM+0x4000*CRES_HAIKEI_CHARBASE_NO)
#define CRES_FONT_VRAM			(BG_VRAM+0x4000*CRES_FONT_CHARBASE_NO+0x4000)
//スクリーンアドレス
#define CRES_EFF_SCRN			(BG_VRAM+0x800*CRES_EFF_SCRN_NO)
#define CRES_HAIKEI_SCRN		(BG_VRAM+0x800*CRES_HAIKEI_SCRN_NO)
#define CRES_FONT_SCRN			(BG_VRAM+0x800*CRES_FONT_SCRN_NO)
#define CRES_WIN_SCRN			(BG_VRAM+0x800*CRES_WIN_SCRN_NO)

//----------------------------------------------------------
//	
//----------------------------------------------------------
#define	CRES_POKEICON_BGPALNO	10//ﾎﾟｹﾓﾝｱｲｺﾝで使用するBGﾊﾟﾚｯﾄの開始No(ここから4本使用)

//----------------------------------------------------------
//	UserWorkｱﾄﾞﾚｽ割り振り定義
//----------------------------------------------------------
#define CRES_USERWORK_START		0x18000
#define CRES_SYSTEM_ADRS		CRES_USERWORK_START
#define CRES_GRAPH_ADRS			(CRES_SYSTEM_ADRS + sizeof(CresSys))
#define CRES_MSG_DECORD_USER	(CRES_GRAPH_ADRS + sizeof(ConGraph)*BREEDER_MAX)//ﾒｯｾｰｼﾞ一時展開領域

//-- マクロ --//
#define cres	((CresSys*)&UserWork[CRES_SYSTEM_ADRS])
#define cgraph	((ConGraph*)&UserWork[CRES_GRAPH_ADRS])
#define CRES_MSG_DECORD_ADR		(&UserWork[CRES_MSG_DECORD_USER])

//----------------------------------------------------------
//	メッセージウィンドウ
//----------------------------------------------------------
#define MSGWINOBJ_DEFAULT_X		(240+32)	//画面外 X座標
#define MSGWINOBJ_DEFAULT_Y		144			//通常ﾒｯｾｰｼﾞ時のY座標
#define MSGWINOBJ_SIOWAIT_Y		80			//「つうしんたいきちゅう」時のY座標
#define MSGWINOBJ_INOUT_SP		0x0440		//ｽﾗｲﾄﾞｲﾝ、ｱｳﾄ、標準速度
enum{	//現在状況を示す定数
	WO_TAIKI_OUT = 0,	//画面外待機
	WO_SLIDEIN,			//ｽﾗｲﾄﾞｲﾝ中
	WO_TAIKI_IN,		//画面内で待機
	WO_SLIDEOUT,		//ｽﾗｲﾄﾞｱｳﾄ中
};
#define NEXT_MSG_WAIT			20			//次のﾒｯｾｰｼﾞを流すまでのｳｪｲﾄ

//----------------------------------------------------------
//	星とハート
//----------------------------------------------------------
#define CRES_STAR_MAX	10
#define CRES_HEART_MAX	10

//----------------------------------------------------------
//	メインタスクのワーク割り振り
//----------------------------------------------------------
enum{
	MAIN_SEQ=0,	//各シーケンスの中で使用。使用した場合次のｼｰｹﾝｽに移る前に必ず0初期化
	MAIN_TEMP,
	MAIN_WORK0,
	MAIN_WORK1,
	MAIN_WORK2,
	MAIN_WORK3,
	MAIN_WORK4,
	MAIN_WORK5,
	MAIN_WORK6,
	MAIN_WORK7,
};

//----------------------------------------------------------
//	CELL ID
//----------------------------------------------------------
enum{
	CELLID_HyoukaBall0 = 3000,
	CELLID_HyoukaBall1,
	CELLID_HyoukaBall2,
	CELLID_HyoukaBall3,
	CELLID_HyoukaBall4,
	CELLID_HyoukaBall5,
	CELLID_HyoukaBall6,
	CELLID_HyoukaBall7,
	//-- 順位(数字) --//
	CELLID_JyunniNum,

	//-- 新規 2002.06.24(月)--//
	CELLID_MSGWIN0,
	CELLID_MSGWIN1,
	CELLID_MSGWIN2,
	CELLID_MSGWIN3,
	CELLID_MSGWIN4,
	CELLID_MSGWIN5,
	CELLID_MSGWIN6,
	CELLID_MSGWIN7,
	
	CELLID_KAMIFUBUKI,
};

//----------------------------------------------------------
//	外部関数宣言
//----------------------------------------------------------
extern void ContestResultInit(void);


//----------------------------------------------------------
//	構造体定義
//----------------------------------------------------------
//-- ｼｽﾃﾑ構造体 --//
typedef struct{
	u8 win_act;		//ｳｨﾝﾄﾞｳOBJの親のActNo
	u8 siowin_act;	//通信ﾒｯｾｰｼﾞ用のｳｨﾝﾄﾞｳOBJの親のActNo
	u8 main_id;		//メインタスクのID
	u8 champ_winpal_task;	//ﾁｬﾝﾋﾟｵﾝｳｨﾝﾄﾞｳのﾊﾟﾚｯﾄｱﾆﾒ制御タスク
	
	u8 win_status;	//ﾒｯｾｰｼﾞｳｨﾝﾄﾞｳの現在状況 ※enum参照
	u8 jyunni_put;	//各ﾌﾞﾘｰﾀﾞｰの順位を表示したらｲﾝｸﾘﾒﾝﾄしていく
	u8 poke_appear;	//ﾎﾟｹﾓﾝの状況 1:ｽﾗｲﾄﾞｲﾝ終了 2:ｽﾗｲﾄﾞｱｳﾄ終了
	u8 kamifubuki_num;	//Addされている紙ふぶきｱｸﾀｰの数
	u8 poke_act;	//ﾎﾟｹﾓﾝのActNo
	u8 kamifubuki_end;	//1がｾｯﾄされたら紙ふぶきをやめる
	u8 gauge_fade;	//0=星、ﾊｰﾄのﾌｪｰﾄﾞが素の状態のとき  1=ﾌｪｰﾄﾞがかかっている
	
	s16 meter[BREEDER_MAX];	//現在のﾒｰﾀｰドット数
	u8 meter_eff;	// 1以上はﾒｰﾀｰ動作中	0は何も動いてない
}CresSys;

//-- ﾒｰﾀｰ制御構造体 --//
typedef struct{
	s32 itiji;		//一次審査ポイントが所有するパーセンテージ
	s32 niji;		//二次審査ポイントが所有するパーセンテージ
	u32 itiji_dotto;	//一次審査分の所有しているドット数
	u32 niji_dotto;		//二次審査分の所有しているドット数
	u8	niji_mainasu;	//二時審査ポイントﾏｲﾅｽﾌﾗｸﾞ(1がｾｯﾄされていると2次審査ﾎﾟｲﾝﾄはﾏｲﾅｽ)
	u8 itiji_starnum;	//表示される星(一次審査結果)の数
	u8 niji_heartnum;	//表示されるﾊｰﾄ(二次審査結果)の数
}ConGraph;


#endif

