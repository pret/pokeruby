#ifndef __CONTEST_H__
#define __CONTEST_H__


#include "con_ai.def"



//----------------------------------------------------------
//	定数宣言
//----------------------------------------------------------
#define CONTEST_VERSION	100		//ｺﾝﾃｽﾄのｻｰﾊﾞｰのﾊﾞｰｼﾞｮﾝ

#define BREEDER_MAX		4
#define END_TURN		5
#define BREEDER_AI_DATA_MAX	60	//COMが操作するﾌﾞﾘｰﾀﾞｰﾃﾞｰﾀの数

#define CONT_MINE_CLIENT	2	//自機側のｸﾗｲｱﾝﾄNo
#define CONT_ENEMY_CLIENT	3	//敵側(透明ｱｸﾀｰ)のｸﾗｲｱﾝﾄNo

#define CONT_POKEDECORD_NO	0	//ﾎﾟｹﾓﾝの絵のDecordAdrsへの展開場所

//-- 個々のﾌﾞﾘｰﾀﾞｰの黒のﾊﾟﾚｯﾄNo --//
#define BLD_PAL			0xa	// BLD_PAL+ﾌﾞﾘｰﾀﾞｰNo でそのﾌﾞﾘｰﾀﾞｰのﾊﾟﾚｯﾄ
//-- 前のﾀｰﾝに出した技名を表示する時のﾊﾟﾚｯﾄNo --//
#define CON_GRAYPAL		(BLD_PAL + BREEDER_MAX)

#define METER_WAIT		15	//30	//ｱﾋﾟｰﾙﾒｰﾀｰがあがっていく際のwait

//-- Cell, Pal用ID --//
enum{
	FUKIDASI_ID = 44000,
	VOLTAGEICON_ID,
	VOLTAGEGAUGE_ID,
};

//-- プレーヤー情報を隠す幕 --//
#define CURTAIN_SP		7	//幕が下がる(上がる)時の速度

//-- テンション --//
#define TENSYON_MAX		5	//テンション最大値
#define TENSYON_POINT	10	//技のﾀｲﾌﾟが一致した時にAPに加算される値
#define TENSYON_MAXPOINT	60	//テンションが最大値に達した時にAPに加算される値

//-- ボーナス --//
#define BONUS_POINT		10
#define BONUS_MAX		30

//-- 照明のevy --//
#define LIGHT_EVY		2	//3	//5

//-- 技エフェクト用の定義 --//
#define CONTEST_RIGHTEND	152		//背景面の右端座標

//-- 観客の盛り上がり(盛り下がり)時のカラー --//
#define KANKYAKU_EVY		10
#define TENSYON_DOWN_COLOR	0x0000
#define TENSYON_UP_COLOR	0x237e


//-- AI用の定数 --//
//AI_STATUSFLAG宣言
#define	CONAI_STATUSFLAG_END	0x01			//AIシーケンスの終了
#define	CONAI_STATUSFLAG_END_OFF	(0x01^0xff)	//AIシーケンスの終了
//-- +++++++++ --//

//-- テンション --//
#define TENSYON_GAUGE_UP	1	//ｺﾝﾃｽﾄﾀｲﾌﾟと技ﾀｲﾌﾟが一致した時に上がるｹﾞｰｼﾞのﾎﾟｲﾝﾄ


//----------------------------------------------------------
//	UserWorkの割り振りアドレス
//----------------------------------------------------------
#if 0 //--------- 実際の定義はclient.hでしてる --------------
// 背景切り替えでｽｸﾘｰﾝﾃﾞｰﾀを展開しているのでｺﾝﾃｽﾄでは1000h確保
#define CONTEST_WAZAEFF_USERWORK	0x14800	//ｺﾝﾃｽﾄの技ｴﾌｪｸﾄ用のUserWork
#endif //-------------------------------------------------------
//観客の2ﾊﾟﾀｰﾝｱﾆﾒ用にUserWorkにｷｬﾗﾃﾞｰﾀを展開しておく
#define CONT_KANKYAKU_ADRS	0x15800	//(0x17800 - 0x2000)
/*※ 0x17800～0x18000は戦闘でｸﾗｲｱﾝﾄのｼｽﾃﾑ用ﾜｰｸとして使用している。
	 技ｴﾌｪｸﾄの中ではいじってる可能性もあるので、0x17800～0x18000の間は
	 避けておく*/
#define DEBUG_AP			0x18000	//デバッグ用ﾌﾗｸﾞ
#define CONT_PALETTE_ADRS	(DEBUG_AP + 4)	//BGのﾃﾞﾌｫﾙﾄﾊﾟﾚｯﾄをUserWorkに取っておく
#define CONT_TURN_PLTT	(CONT_PALETTE_ADRS + 0x200)	//毎ﾀｰﾝ最初のﾊﾟﾚｯﾄの状態を取っておく
#define CONT_TURNFADE_PLTT	(CONT_TURN_PLTT + 0x400)//毎ﾀｰﾝ暗くした状態のﾊﾟﾚｯﾄを保存
#define CONT_BGWIN_SCRN_TEMP	(CONT_TURNFADE_PLTT + 0x400)//BGｳｨﾝﾄﾞｳのｽｸﾘｰﾝ一時退避
#define CONT_SYSTEM_ADRS	(CONT_BGWIN_SCRN_TEMP + 1024*2)
#define CONT_APSYSTEM_ADRS	(CONT_SYSTEM_ADRS + sizeof(ContestSys))
#define CONT_WAZAKOUKA_ADRS	(CONT_APSYSTEM_ADRS + sizeof(ContestAPSys)*BREEDER_MAX)
#define CONT_AI_ADRS		(CONT_WAZAKOUKA_ADRS + sizeof(WazaKoukaWork))
#define CONT_CALCWORK_ADRS	(CONT_AI_ADRS + sizeof(ConAIWorkTbl))
#define CONT_BRDSYS_ADRS	(CONT_CALCWORK_ADRS + sizeof(ContestCalcWork)*BREEDER_MAX)
#define CONT_WAZAPARA_ADRS	(CONT_BRDSYS_ADRS + sizeof(BrdSysData)*BREEDER_MAX)

//----------------------------------------------------------
//	ｼｽﾃﾑ構造体にｱｸｾｽする時に使用するマクロ
//----------------------------------------------------------
#define consys	((ContestSys*)&UserWork[CONT_SYSTEM_ADRS])
#define apsys	((ContestAPSys*)&UserWork[CONT_APSYSTEM_ADRS])
#define CONWAZA	((WazaKoukaWork*)&UserWork[CONT_WAZAKOUKA_ADRS])
#define CONAI	((ConAIWorkTbl*)&UserWork[CONT_AI_ADRS])	//AI用ｼｽﾃﾑ構造体
#define ccw		((ContestCalcWork*)&UserWork[CONT_CALCWORK_ADRS])
#define brdsys	((BrdSysData*)&UserWork[CONT_BRDSYS_ADRS])
#define conpara	((ConWazaEffParam*)&UserWork[CONT_WAZAPARA_ADRS])

//----------------------------------------------------------
//	スクリーンデータ
//----------------------------------------------------------
#define COMBO_MARK_SCRN		0x201d
#define WIN_SPC_SCRN		0x000c



//-- 技エフェクト用のVramアドレス --//
#define CONWAZA_BG_CHARBASE	2
#define CONWAZA_BG_SCRNBASE	30
#define CONWAZA_BG_PAL		0xe
//-- BG3(背景)のBGｻｲｽﾞと回り込みﾌﾗｸﾞのデフォルト値 --//
#define CONTEST_HAIKEI_SIZE	0
#define CONTEST_HAIKEI_LOOP	1


//-- 審査員座標 --//
#define CON_JUDGE_X		112//44
#define CON_JUDGE_Y		36
//-- 審判のふきだしアイコン座標 --//
#define CON_FUKIDASI_X	96
#define CON_FUKIDASI_Y	10

// ｽﾗｲﾄﾞしてくるﾎﾟｹﾓﾝの座標
#define CON_POKE_X		112	//120//200//(240+32)	//画面外
#define CON_POKE_Y		80

//-- 技説明文座標 --//
#define CON_RANKU_X		0xb
#define CON_RANKU_Y		(20+15)		// 20 = 次のｽｸﾘｰﾝまでの差分
#define CON_WAZACOM_X	11
#define CON_WAZACOM_Y	(20+15)
#define CON_TYPE_X		0xb
#define CON_TYPE_Y		(20+11)

//-- ｺﾝﾃｽﾄ中に流すﾒｯｾｰｼﾞの座標 --//
#define CON_TALKMSG_X	1
#define CON_TALKMSG_Y	15

//-- 技の座標(ﾋｯﾄする場所) --//
#define CON_ATTACK_X	(CON_POKE_X)
#define CON_ATTACK_Y	CON_POKE_Y
#define CON_DEFENCE_X	48	//24	//122
#define CON_DEFENCE_Y	40	//70

//-- ハートアイコンの初期座標 --//
#define HEARTICON_X		(8*22+4)

//-- ソートアイコンの初期座標 --//
#define SORTICON_X		(8*0x19+4)

//-- 敵がｽﾗｲﾄﾞして出てくるスピード --//
//#define CONTEST_ENEMY_SLIDE_SP	(-3)
//#define CONTEST_ENEMY_SLIDE_WAIT	60

//-- 技を出すﾎﾟｹﾓﾝがｽﾗｲﾄﾞしてくる時に使用する定数値 --//
#define CONTEST_SLIDEIN_SP		(-2)//(-3)	//ｽﾗｲﾄﾞｲﾝしてくる時のｽﾋﾟｰﾄﾞ
#define CONTEST_SLIDEOUT_SP		(-6)	//ｽﾗｲﾄﾞｱｳﾄする時のｽﾋﾟｰﾄﾞ
#define CONTEST_SLIDE_INIT_DX	(-(CONTEST_SLIDEIN_SP * 60))//20))	//初期DX
#define CONTEST_SLIDE_WAIT		30		//ｽﾗｲﾄﾞｲﾝしてきて、技ｴﾌｪｸﾄを出すまでのｳｪｲﾄ


//-- ﾒｯｾｰｼﾞｳｨﾝﾄﾞｳをｸﾘｱｰするための空白ｷｬﾗをBGVRAM上にｾｯﾄする位置 --//
#define MSG_CLEAR_NO	0
#define MSG_START_NO	0x200	//0x100

//-- ﾒｯｾｰｼﾞ関連 --//
#define FONT_BYTE		2		//1文字のﾊﾞｲﾄｻｲｽﾞ
//-- ﾒｯｾｰｼﾞﾌｫﾝﾄ ﾃﾞｰﾀ長 --//
#define CON_POKE_LEN			(10*FONT_BYTE)	//ﾛｰｶﾗｲｽﾞ用に10文字(EOM除く)
#define CON_TRAINER_LEN			(11*FONT_BYTE)	//ﾛｰｶﾗｲｽﾞ用に10文字(EOM除く) + '/'
#define CON_WAZANAME_LEN		(7*FONT_BYTE)	//技名の長さ
#define CON_JYUNNI_MSG_LEN		(4*FONT_BYTE)	//「じゅんい」のﾒｯｾｰｼﾞ
#define CON_NOW_JYUNNI_LEN		(3*FONT_BYTE)	//現在の順位(ｽﾍﾟｰｽ + 数字 +「い」)
//4体分の合計の長さ
#define CON_POKE_ALLLEN			(CON_POKE_LEN*BREEDER_MAX)
#define CON_TRAINER_ALLLEN		(CON_TRAINER_LEN*BREEDER_MAX)
#define CON_WAZA_ALLLEN			(CON_WAZANAME_LEN*BREEDER_MAX)
#define CON_JYUNNI_MSG_ALLLEN	(CON_JYUNNI_MSG_LEN*BREEDER_MAX)
#define CON_NOW_JYUNNI_ALLLEN	(CON_NOW_JYUNNI_LEN*BREEDER_MAX)
#define CON_WAZALIST_ALLLEN		(CON_WAZANAME_LEN*4)	//最大技4つ
//-- ﾒｯｾｰｼﾞﾌｫﾝﾄ転送CGX.No --//
//ｺﾝﾃｽﾄ画面中固定
#define CONTEST_START_FONT	MSG_START_NO
#define CON_POKENAME		CONTEST_START_FONT
#define CON_TRAINER			(CON_POKENAME+CON_POKE_ALLLEN)
#define CON_TENSYON_MSG		(CON_TRAINER+CON_TRAINER_ALLLEN)
#define CON_TENSYON_NUM		(CON_TENSYON_MSG+6*2)

//画面中では同時に出ることはないのでｱﾄﾞﾚｽがかぶる
//かぶるｱﾄﾞﾚｽの先頭
#define CON_OVERLAP_MSG		(CON_TENSYON_NUM+2*2)

#define CON_JYUNNI_MSG		CON_OVERLAP_MSG
#define CON_NOW_JYUNNI		(CON_JYUNNI_MSG+CON_JYUNNI_MSG_ALLLEN)
#define CON_WAZA			CON_OVERLAP_MSG
										//↓順位より技名の方が長いので
#define CON_MSG				(CON_WAZA+CON_WAZA_ALLLEN)	//技を出している時に流れるﾒｯｾｰｼﾞ
#define CON_WAZALIST		(CON_WAZA+CON_WAZA_ALLLEN)	//技選択時
//#define CON_ICON_SRA		(CON_WAZALIST+CON_WAZALIST_ALLLEN)	//ｸﾗｽとﾀｲﾌﾟｱｲｺﾝの間のｽﾗｯｼｭ
//#define CON_WAZAEXPLA		(CON_ICON_SRA+1*2)	//技:説明文
#define CON_TYPETEXT		(CON_WAZALIST+CON_WAZALIST_ALLLEN)	//技の属性
#define CON_WAZASURA		(CON_TYPETEXT+5*2)
#define CON_WAZAEXPLA		(CON_WAZASURA+1*2)

#define CON_TUUSIN_TAIKI_MSG	CON_OVERLAP_MSG


//----------------------------------------------------------
//	ﾃﾞﾊﾞｯｸﾞ用定数やﾌﾟﾛｸﾞﾗﾑﾙｰﾁﾝなどの一時Fixなど
//----------------------------------------------------------
#define CONTEST_DEBUG	0	// 通信ﾃﾞﾊﾞｯｸﾞ用メッセージ表示

//----------------------------------------------------------
//	技を受けた時のメッセージ
//----------------------------------------------------------
enum{
	SIKASIJYAMA_MSG,
	HOKANOPOKE_MSG,
	SIKASISIPPAI_MSG,
	ITUMOYORI_MSG,
	ITUMOYORI_MUCH_MSG,		//次のﾀｰﾝ以降ずっとﾒｯｾｰｼﾞを出す
	MEWOSORASITA_MSG,
	KOREMADENO_MSG,
	KOREIJYOU_MSG,
	KOWAIKURAI_MSG,
	MEDATTEIRUPOKE_MSG,
	KITAIWOKOMETA_MSG,
	KANARIUMAKU_MSG,
	FUTUUYORI_MSG,
};

//----------------------------------------------------------
//	このターンどれだけ目立ったか結果を出すメッセージ
//----------------------------------------------------------
enum{
	ZENZEN_MSG,
	ANMARI_MSG,
	MAAMAA_MSG,
	KANARI_MSG,
	MONOSUGOKU_MSG,
	SITENAI_MSG,
};

//----------------------------------------------------------
//	技データ用
//----------------------------------------------------------
// con_ai.defに書かれている「技のアピール分類」と統一すること
enum{		//区分
	NORMAL_KUBUN,			//ノーマル
	BOUGYO_KUBUN,			//防御
	DIST1_KUBUN,			//妨害1
	DIST2_KUBUN,			//妨害2
	INDIRECT_KUBUN,			//間接妨害
	SPECIAL_KUBUN,			//特殊
	TURNCONT_KUBUN,			//順番制御

	//-- もういらなくなったもの --//
	COMBO1_KUBUN,			//コンボ1
	COMBO2_KUBUN,			//コンボ2
};
enum{		//クラス
	S_CLASS,
	A_CLASS,
	B_CLASS,
	C_CLASS,
	D_CLASS,
};
enum{		//技ﾀｲﾌﾟ
	STYLE_TYPE,
	BEAUTIFUL_TYPE,
	CUTE_TYPE,
	CLEVER_TYPE,
	STRONG_TYPE,
};

//----------------------------------------------------------
//	HeartIconAffEffSet関数で指定するAffineType
//----------------------------------------------------------
enum{
	HEART_AFF_NORMAL = 0,	//通常の大きさにする
	HEART_AFF_SMALL,		//通常から小さくしていく
	HEART_AFF_BIG,			//小さい状態から大きくしていく
};

//----------------------------------------------------------
//	審判のふきだしアイコンのタイプ
//----------------------------------------------------------
enum{
	PENALTY_TYPE,
	TENSYONDOWN_TYPE,
	COMBO1_TYPE,
	COMBO2_TYPE,
	TENSYONUP_TYPE,
	NEXTSORT_FAST_TYPE,
	NEXTSORT_LAST_TYPE,
	NEXTSORT_QUES_TYPE,
	BONUS_TYPE,
};

#define FUKIDASI_PUT_TIME	85	//ふきだしを表示してる時間


//----------------------------------------------------------
//	通信ﾌﾗｸﾞ
//----------------------------------------------------------
#define C_TUUSIN_FLG	1

//----------------------------------------------------------
//	型宣言
//----------------------------------------------------------
typedef void (*pConFunc)(u8);


//----------------------------------------------------------
//	構造体宣言
//----------------------------------------------------------

//-- ｺﾝﾃｽﾄ用ｼｽﾃﾑﾃﾞｰﾀ --//
typedef struct{
//	u8 BreederNo;	//自分のﾌﾞﾘｰﾀﾞｰNo(通信するときに自分が何番か入れるようにして)
	u8 cursor;	//ｶｰｿﾙ位置情報
	u8 turn;	//ﾀｰﾝｶｳﾝﾄ
//	u8 fusanka:1;	//このﾀｰﾝ参加できないときに1がｾｯﾄ

	u8 waza_msg[BREEDER_MAX];	//技を出した(受けた)時に出すﾒｯｾｰｼﾞのﾅﾝﾊﾞｰ
	u8 itumoyori_flg:1;		//次ﾀｰﾝに「いつもより・・・」のﾒｯｾｰｼﾞを出す
	u8 itumoyori_much:1;	//次ﾀｰﾝ以降ずっと「いつもより・・・」のﾒｯｾｰｼﾞを出す
	u8 appeal_msg:1;		//1:「ｱﾋﾟｰﾙ効果!」のﾒｯｾｰｼﾞを出す。 0:出さない
	u8 spotlight_eff:1;		//ｽﾎﾟｯﾄﾗｲﾄｴﾌｪｸﾄ実行中ﾌﾗｸﾞ(1:実行中)
	u8 fukidasi_eff:1;		//審判のふきだしｴﾌｪｸﾄ実行中ﾌﾗｸﾞ(1:実行中)
	u8 voltage_eff:1;		//ﾎﾞﾙﾃｰｼﾞｴﾌｪｸﾄ実行中ﾌﾗｸﾞ(1:実行中)
	u8 voltage_slide_eff:1;	//ﾎﾞﾙﾃｰｼﾞｹﾞｰｼﾞｽﾗｲﾄﾞｴﾌｪｸﾄ実行中ﾌﾗｸﾞ(1:実行中)
	u8 kankyaku_anm:1;		//観客ｱﾆﾒ実行中ﾌﾗｸﾞ(1:実行中)
	
	u8 kankyaku_color_eff:1;//観客の盛り上がり(盛り下がり)時のｶﾗｰﾌｪｰﾄﾞｴﾌｪｸﾄ実行中ﾌﾗｸﾞ
//	u8 tensyon_stop:1;		//ﾌﾗｸﾞが立っている時はﾃﾝｼｮﾝが上昇、下降しない
//	u8 tensyon_stop_brd:3;	//tensyon_stopﾌﾗｸﾞを立てたﾌﾞﾘｰﾀﾞｰのNo
	u8 heart_aff_eff:1;		//ﾊｰﾄｱｲｺﾝがｱﾌｨﾝｴﾌｪｸﾄ中ﾌﾗｸﾞ(1:実行中)
	u8 sio_wazacalc:1;		//技計算データ通信取得待ち
	u8					:1;
	
	u8 id;		//ﾒｲﾝｼｰｹﾝｽとして動いているﾀｽｸのID
	u8 jyunni_icon[BREEDER_MAX];	//順位ｱｲｺﾝのactno
	u8 eye_color;	//ｺﾝﾎﾞ時の目の明滅管理ﾀｽｸNo
	u8 meter_color;	//ﾒｰﾀｰMAX時のｶﾗｰ点滅管理ﾀｽｸNo
	
	s8 kouka_dameji;	//今技を出したﾎﾟｹﾓﾝから発生する、他ﾌﾞﾘｰﾀﾞｰに対してのﾀﾞﾒｰｼﾞﾎﾟｲﾝﾄ
	u8 wazaput_count;	//何匹のﾎﾟｹﾓﾝが技を出したかｶｳﾝﾄしてく(毎ﾀｰﾝｸﾘｱされる)
	u8 wazabrd;			//今、技を出しているﾎﾟｹﾓﾝのﾌﾞﾘｰﾀﾞｰNo
	
	u8 fukidasi_act;	//審判のふきだしアイコンのActNo
	s8 tensyon;			//現在のテンションﾎﾟｲﾝﾄ
//	u8 next_sort[BREEDER_MAX];	//次のﾀｰﾝ何番目にｱﾋﾟｰﾙするか
	u8 nowturn_sort[BREEDER_MAX];	//現在のﾀｰﾝにｱﾋﾟｰﾙする順番(基本的にはBrdSortと同じ。										//ただBrdSortはｱﾋﾟｰﾙ終了時に更新されるが、これは
									//ﾀｰﾝ終了時に更新される

	unsigned long r_next;	//ﾗﾝﾀﾞﾑの種、退避エリア

	u16	WazaHistory[END_TURN][BREEDER_MAX];	//各ﾌﾞﾘｰﾀﾞｰが出した技の履歴
	s8	TensyonHistory[END_TURN][BREEDER_MAX];	//各ﾌﾞﾘｰﾀﾞｰが上下させたﾃﾝｼｮﾝの履歴

//	u8 voltage_act;		//ﾎﾞﾙﾃｰｼﾞｱｲｺﾝのActNo
	u8 volgauge_act;	//ﾎﾞﾙﾃｰｼﾞｹﾞｰｼﾞのActNo
//	u8 volgaugesub_act;	//ﾎﾞﾙﾃｰｼﾞｹﾞｰｼﾞの右端のActNo
	
//	u16 UseWaza[BREEDER_MAX];	//繰り出す技のﾅﾝﾊﾞｰ
//	u16 UseWazaOld[BREEDER_MAX];	//前のﾀｰﾝに繰り出した技
//	u8 BreederRanking[BREEDER_MAX];	//各ﾌﾞﾘｰﾀﾞｰの現在の順位
	
//	s16 ap[BREEDER_MAX];		//各ﾌﾞﾘｰﾀﾞｰが出した技の基本AP
//	s16 total_ap[BREEDER_MAX];	//今までの累計AP
	u8 init_counter;	//InitContest時に初期化ｶｳﾝﾀｰとして使用
	u8 eff_loop;		//技ｴﾌｪｸﾄ繰り返しｶｳﾝﾀｰ
}ContestSys;

//-- 各ﾌﾞﾘｰﾀﾞｰ毎に持つﾌﾗｸﾞ等の集合体 --//
typedef struct{
	//-- 元apsys --//
	u8 heart_actno;			//ハートアイコンのActNo
	u8 sorticon_actno;		//順番制御ｱｲｺﾝのActNo
	u8 heart_move:1;		//ハートアイコンが動作中か(0:非動作	1:動作中)
	u8 win_eff:1;			//各ﾌﾞﾘｰﾀﾞｰのｳｨﾝﾄﾞｳに対してのｴﾌｪｸﾄ実行中ﾌﾗｸﾞ(1:実行中)
	u8 meter_eff:1;			//各ﾌﾞﾘｰﾀﾞｰのﾒｰﾀｰに対してのｴﾌｪｸﾄ実行中ﾌﾗｸﾞ(1:実行中)
}BrdSysData;

//-- 技効果、AP計算に使用するﾌﾗｸﾞ類 --//
typedef struct{
	s16	found_ap;		//基本AP
	s16 ap;				//現在のﾀｰﾝのAP値
	s16 total_ap;		//今までの累計AP
//	s16 add_ap;			//現在のターンで足すAP値
//	s16 sub_ap;			//現在のターンで引くAP値
	
	u16 use_waza;		//繰り出す技のﾅﾝﾊﾞｰ
	u16 use_wazaold;	//前のﾀｰﾝに繰り出した技
	u8	con_type;		//繰り出す技のタイプ(かっこいい、可愛い等)
	
//	u8 ballact[2];			//結果発表画面で使用するﾎﾞｰﾙのactno
	
	u8 ranking:2;			//現在の自分の順位
//	u8 reflect_flg:1;		//妨害ｱﾋﾟｰﾙを跳ね返す
//	u8 surru_flg:1;			//妨害ｱﾋﾟｰﾙを別のﾌﾞﾘｰﾀﾞｰにｽﾙｰする
//	u8 surru_no:2;			//↑で代わりに受けてもらうﾌﾞﾘｰﾀﾞｰNoが入る
//	u8 SpeUseless_flg:1;	//ﾌﾗｸﾞが立っていると技の特殊効果が発動しない
	u8 				:2;
	
	u8 conti_count:3;		//連続して同じ技を出したときのｶｳﾝﾀ
	u8 endAppeal_flg:1;		//もうｱﾋﾟｰﾙできない
//	u8 eachTime_flg:1;		//毎ﾀｰﾝAPに+5する
//	u8 kouka_flg:1;			//ｱﾋﾟｰﾙ効果を受けたか
	u8 miss_flg:1;			//ｱﾋﾟｰﾙ失敗フラグ
	
	// turn = 次のﾀｰﾝにｸﾘｱｰされるﾌﾗｸﾞ(ｾｯﾄされたﾀｰﾝに-1されるので2をﾃﾞﾌｫﾙﾄでｾｯﾄするﾌﾗｸﾞ)
	u8 yasumi_turn:2;		//1回休み
//	u8 AtoD_turn:2;			//次ﾀｰﾝA～Dｸﾗｽの技でｱﾋﾟｰﾙするとその技の基本ｱﾋﾟｰﾙを *2 をする
//	u8 combo_turn:2;			//ｺﾝﾎﾞ1の技を出したときにｾｯﾄ
	
//	u8 bougai_count:7;		//妨害を受けた数	※←↓のﾌﾗｸﾞはそれぞれ独立したもの
//	u8 bougai_flg:1;		//妨害されたら立つ。次のﾀｰﾝにはｸﾘｱされる
	
//	u8 waza_pri;			//何番目に技を繰り出すか(出す技の優先順位によって決まる)
	s8 bonus;				//ｱﾋﾟｰﾙﾎﾞｰﾅｽ(毎ﾀｰﾝｱﾋﾟｰﾙﾎﾟｲﾝﾄに加算)
	
	u8 bougai;				//今 出ている技の効果で受けた妨害ﾎﾟｲﾝﾄ
							//(次の技が出る時には0クリアされる)
	
	u8 invalid;				//妨害耐性 この値だけ妨害ダメージから減らす

	u8 invalid10:1;			//妨害を受けた時 ダメージを10にする
	u8 Ashield_flg:1;		//妨害 絶対防御
	u8 bougai2bai:1;		//妨害されると大幅にAP値が落ちる。妨害値＝妨害値×２
	u8 penalty0:1;			//連続して出してもペナルティを受けない
	u8 bonus_flg:2;			//このﾀｰﾝでﾎﾞｰﾅｽが付いた、消えた(1:付いた、2:消えた)
	u8 nextsort_flg:2;		//「つぎ　ばん」の表示(0:表示なし 1:　に番号  2:　に？)
	
	u8 now_nextsort:2;		//今自分が出した技で順番制御が発生したか
							//(0:発生してない　1:1番目　2:4番目　3:？番目)
	u8 next_yasumi_turn:1;	//今のﾀｰﾝが終了したら休みフラグを立てる
	u8 next_endAppeal_flg:1;	//今のﾀｰﾝが終了したら永久休みﾌﾗｸﾞを立てる
	u8 tensyon_up:1;		//ﾌﾗｸﾞが立っている時は必ずﾃﾝｼｮﾝが上昇する
	u8 bonus3bai:1;			//ﾎﾞｰﾅｽを3倍にする
	u8				:2;
	
	u8 shield_flg;			//耐久値がある限り防御
	
	u8 msgid;				//技効果時の表示するメッセージ
	u8 msgid2nd;			//
	
	u8 penalty:1;			//このﾀｰﾝﾍﾟﾅﾙﾃｨが発生した
	u8 before_turn_penalty:1;	//前のﾀｰﾝにﾍﾟﾅﾙﾃｨが発生してた
	u8 combo1_invalid:1;	//前のﾀｰﾝに出した技のｺﾝﾎﾞ1効果無効
	u8 combo_conti_flg:1;	//ｺﾝﾎﾞを出したことがあるか(0:出してない	1:出したことがある)
	u8 combo1_flg:1;		// 1:現在ｺﾝﾎﾞ1発動中　0:ｺﾝﾎﾞ1状態でない
	u8 combo1_del:1;		//技効果によってｺﾝﾎﾞ1が無効化された時に1がｾｯﾄされる
	u8 combo_hassei:1;		//1=ｺﾝﾎﾞ1、又はｺﾝﾎﾞが成立。　0=ｺﾝﾎﾞの効果は何も発生してない
	u8 		:1;
	u8 combo_level;			//ｺﾝﾎﾞ成立時のｺﾝﾎﾞﾚﾍﾞﾙ。0の時はｺﾝﾎﾞ不成立
	
	u8 comboAP;
	u8 penaltyAP;
	u8 next_sort;	//次のﾀｰﾝ何番目にｱﾋﾟｰﾙするか
	u8 kekka_msgid;			//ﾀｰﾝ終了時のｱﾋﾟｰﾙ結果のMsgID
	
	u8 hensin_monsno;	//[へんしん][なりきり]をした時に何番目のﾌﾞﾘｰﾀﾞｰのﾎﾟｹﾓﾝに化けるか
}ContestAPSys;

//-- 親のみが値を変更出来るシステムワーク 子は参照のみ--//
typedef struct{
//	u8 nowturn_sort[BREEDER_MAX];	//現在のﾀｰﾝにｱﾋﾟｰﾙする順番(基本的にはBrdSortと同じ。										//ただBrdSortはｱﾋﾟｰﾙ終了時に更新されるが、これは
									//ﾀｰﾝ終了時に更新される
	//s8 tensyon;					//現在のﾃﾝｼｮﾝﾎﾟｲﾝﾄ
	s8 tensyon_updown;			//出した技によってテンションの変化する値
	u8 tensyon_stop:1;			//ﾌﾗｸﾞが立っている時はﾃﾝｼｮﾝが上昇、下降しない
	u8 tensyon_stop_brd:3;		//tensyon_stopﾌﾗｸﾞを立てたﾌﾞﾘｰﾀﾞｰのNo
	u8				:4;
	s8 tensyonAdd;
}ContestCalcWork;

//-- 子が --//


//-- ブリーダー --//
typedef struct{
	u16 monsno;				//持ちﾎﾟｹﾓﾝ
	u8 nickname[MONS_NAME_SIZE+EOM_SIZE];		//持ちﾎﾟｹﾓﾝニックネーム
	u8 name[PERSON_NAME_SIZE+EOM_SIZE];			//ブリーダー名	11
	
	u8 pattern;				//ブリーダー分類(OBJコード)
	//u8 ai;					//AIパターン
	u32 ai;					//AIパターン
	u8 rank:2;				//登場する場所(0:ﾉｰﾏﾙ、1:ｽｰﾊﾟｰ、2:ﾊｲﾊﾟｰ、3:ﾏｽﾀｰ)
	u8 style_appear:1;		//かっこよさｺﾝﾃｽﾄに登場するか(0:登場しない 1:登場する)
	u8 beautiful_appear:1;	//美しさｺﾝﾃｽﾄに登場するか(0:登場しない 1:登場する)
	u8 cute_appear:1;		//可愛さｺﾝﾃｽﾄに登場するか(0:登場しない 1:登場する)
	u8 clever_appear:1;		//賢さｺﾝﾃｽﾄに登場するか(0:登場しない 1:登場する)
	u8 strong_appear:1;		//逞しさｺﾝﾃｽﾄに登場するか(0:登場しない 1:登場する)
	u8				:1;
	//u8 dmmy;				4バイト境界ｵﾌｾｯﾄ
	
	u16 waza[4];			//持ちﾎﾟｹﾓﾝの技

	u8 style;				//持ちﾎﾟｹﾓﾝの格好よさ
	u8 beautiful;			//持ちﾎﾟｹﾓﾝの美しさ
	u8 cute;				//持ちﾎﾟｹﾓﾝの可愛さ
	u8 clever;				//持ちﾎﾟｹﾓﾝの賢さ
	
	u8 strong;				//持ちﾎﾟｹﾓﾝのたくましさ
	u8 fur;					//持ちﾎﾟｹﾓﾝのけづや
	//u8 dmmy[2];			//4ﾊﾞｲﾄ境界ｵﾌｾｯﾄ
	
	u8 msg[12];				//メッセージ(簡易会話)
	u32	personal_rnd;		//個性乱数
	u32 id_no;				//ポケモンのID
}BreederData;


#if 0	//審査員データはなくなった 2002.08.05(月)
//-- 審査員データ --//
typedef struct{
	u8 type;				//好きなﾀｲﾌﾟ
	u8 form;				//好きな形
	u8 waza;				//好きな技
	
	u8 dmmy;				//4ﾊﾞｲﾄ境界ｵﾌｾｯﾄ
}JudgeData;
#endif

//-- 技ﾃﾞｰﾀ格納ﾃﾝﾎﾟﾗﾘ --//
typedef struct{
	u8 Sort[BREEDER_MAX];	//ｴﾝﾄﾘｰNoXのﾌﾞﾘｰﾀﾞｰは何番目の位置にあるか
	s16 bougai;				//妨害値
	s16 bougai_calc;			//計算後の妨害値
	u8 target[BREEDER_MAX+1];	//終端に0xff
	u8 nowwaza_target[BREEDER_MAX];	//今出した技の妨害ﾀｰｹﾞｯﾄになったﾌﾞﾘｰﾀﾞｰNoの所に1が立つ
	u8 nowbrd;
}WazaKoukaWork;

//-- 新・技ﾃﾞｰﾀ --//
typedef struct{
	u8 apno;				//技効果No
	
	u8 con_type	:3;			//属性(かっこいい、かわいい、たくましい等)
	u8			:5;
	
	u8 combo1;			//ｺﾝﾎﾞ1
	u8 combo2_0;			//ｺﾝﾎﾞ2
	
	u8 combo2_1;			//ｺﾝﾎﾞ2
	u8 combo2_2;			//ｺﾝﾎﾞ2
	u8 combo2_3;			//ｺﾝﾎﾞ2
	
	u8 dmmy[1];
}ConWazaData2;

//-- 新・技効果ﾃﾞｰﾀ --//
typedef struct{
	u8 class;				//分類
	u8 ap;					//評価値
	u8 bougai;				//妨害値
	u8 dmmy;				//4バイト境界オフセット
}WazaKoukaData;

//-- 技ｴﾌｪｸﾄのルーチンで必要なデータ --//
typedef struct{
	u16 monsno;
	u16 hensin_monsno;
	u8 hensin_flg:1;
	u8 			:7;
	u8 brd;
	u32	personal_rnd;		//個性乱数
	u32 id_no;				//ポケモンのID
	u32 hensin_personal_rnd;	//変身後の個性乱数(ｱﾝﾉｰﾝ、ﾊﾟｯﾁｰﾙのみ)
}ConWazaEffParam;

//=========================================================================
//	AI用の構造体宣言
//=========================================================================

typedef struct{
	u8	AI_SEQNO;		//AIﾙｰﾁﾝのﾒｲﾝのｼｰｹﾝｽNo
	u16	AI_WAZANO;		//現在の技No
	u8	AI_WAZAPOS;
	u8	AI_WAZAPOINT[4];	//AIでの評価値 基本100でAIによって加減算されていく
	u8	AI_STATUSFLAG;		//ｼｽﾃﾑの状態ﾌﾗｸﾞ(現状終了ｺｰﾄﾞのみに使用)
	u32	AI_CALC_WORK;		//AIのｻﾌﾞﾙｰﾁﾝの戻り値が入る
	u8	AI_THINK_NO;		//
	u32	AI_THINK_BIT;		//
	s16 RetWork;			//コマンドの結果が入る
	s16	work[2];			//ﾃﾝﾎﾟﾗﾘﾜｰｸ。ｽｸﾘﾌﾟﾄ側で使用
	u8	*PushAdrsBuf[8];	//ｻﾌﾞﾙｰﾁﾝｺｰﾙ時のｽﾀｯｸ
	u8	PushAdrsCnt;		//ｽﾀｯｸされている数をｶｳﾝﾄ
	u8  AI_Brd;
}ConAIWorkTbl;

//----------------------------------------------------------
//	外部関数宣言
//----------------------------------------------------------
extern void InitContest(void);
extern void InfoMaskEffectEnd(u8 id);
extern void ContestHaikeiRecover(void);
extern void ContWazaCalcDatatWait(u8 id);


//----------------------------------------------------------
//	グローバル変数
//----------------------------------------------------------
extern BreederData BreederParam[BREEDER_MAX];	//ﾌﾞﾘｰﾀﾞｰﾃﾞｰﾀ
/*
extern u8 BreederNo;		//自分のﾌﾞﾘｰﾀﾞｰNo(通信するときに自分が何番か入れるようにして)
extern u16 ConWaza[BREEDER_MAX];	//繰り出す技のﾅﾝﾊﾞｰ
extern u8 ConCursor;	//ｶｰｿﾙ位置情報
extern u8 BreederRanking[BREEDER_MAX];	//各ﾌﾞﾘｰﾀﾞｰの現在の順位
*/
//extern ContestSys *consys;
//extern ContestAPSys *apsys;
//extern JudgeData Judge;
extern s16 ContEvaluation[BREEDER_MAX];
extern s16 ContBP[BREEDER_MAX];
//extern u8 conkind;
extern u8 ContestJyunni[BREEDER_MAX];
extern u8 ConTemotiNo;
extern u8 MyBreederNo;
extern u8 ContestTuusin;
extern u8 ContestSioOya;
extern u16 ContestKind;
extern u16 ContestRank;
extern u8 BrdSort[BREEDER_MAX];
extern unsigned long temp_rand;
extern s16 ContAP[BREEDER_MAX];
extern s16 NijiPoint[BREEDER_MAX];

//----------------------------------------------------------
//	データ
//----------------------------------------------------------
extern const BreederData bd_tbl[];
extern const u8 C_PokeNamePos[][2];
extern const u8 C_BreederPos[][2];
extern const u8 C_RankingPos[][2];
extern const u8 C_RankingNoPos[][2];
extern const u8 C_IconPos[][2];
extern const u8 C_JyunniIconPos[][2];
extern const u8 C_WazaList[4][2];
extern const u8 * const ConWazaDamejiMsgTbl[];
extern const u8 * const TurnKekkaMsgTbl[];
extern const u8 *const WazaCommentMsgTbl[];
extern const u8 *const ComboIMSG_Tbl[];
extern const CellData HeartIconCell;
extern const PalData HeartIconPal;
extern const actHeader HeartIconHeader;
extern const actHeader JudgeHeader;
extern const CellData JudgeCell;
extern const u8 HeartIconYPos[];
extern const u8 *const WazaSetumeiMsgTbl[];
extern const ConWazaData2 ConWazaTbl[];
extern const WazaKoukaData WazaKoukaTbl[];
extern const u8 *const ConTypeMsgTbl[];
extern const u8 ComboLevelTbl[];
extern const CellData FukidasiCell;
extern const PalData FukidasiPal;
extern const	actHeader FukidasiHeader;
extern const CellData VoltageIconCell;
extern const actHeader VoltageIconHeader;
extern const CellData VoltageGaugeCell;
extern const PalData VoltageGaugePal;
extern const actHeader VoltageGaugeHeader;
extern const actHeader VoltageGaugeSubHeader;
extern const CellData SortIconCell[];
extern const actHeader SortIconHeader[];
extern const u8 SortIconYPos[];
extern const OAMPatSt SortIconPat;
extern const PalData SortIconPal;














//=========================================================================
//
//		コンテストAI用の定義類
//												by matsuda 2002.05.25(土)
//=========================================================================

#endif	//__CONTEST_H__

