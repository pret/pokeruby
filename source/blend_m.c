//=========================================================================
//	ブレンドマシーンゲーム
//
//    Copyright (C) 2001 GAME FREAK inc.
//											By Akito Mori
//=========================================================================

#define DEBUG_NPC_CHANGE
#define DEBUG_NUMPRINT
//#define DEBUG_PARAMETA			//キューブのパラメータを表示

//#define SEEQUENCE_DEBUG

#include "common.h"
#include "evobj.h"
#include "config.h"
#include "multisio.h"
#include "pokesio.h"
#include "cable.h"
#include "mus_tool.h"

#include "intr.h"


#include "calctool.h"
#include "decord.h"
#include "objdata.h"
#include "svld_ini.h"
#include "task.h"
#include "print.h"
#include "fcontext.h"
#include "window.h"
#include "menu.h"
#include "menutool.h"
#include "boxsub.h"

#include "pocketno.h"
#include "item.h"
#include "seed.h"
#include "cube_def.h"
#include "cubecase.h"
#include "actor.h"
#include "actanm.h"
#include "Madefine.h"
#include "palanm.h"
#include "param.h"
#include "fld_main.h"
#include "ev_flag.h"
#include "record.h"

#include "pokeicon.h"
#include "wazatool.h"

#include "blend_m.h"


#include "..\scaddata\blend_r.acl"		//回転面画像
//#include "..\scaddata\b_r.ach"
#include "..\scaddata\b_r.asc"

#include "..\scaddata\blendbak.acl"		//背景
//#include "..\scaddata\blendbak.ach"
//#include "..\scaddata\blendbak.asc"

#include "..\scaddata\blendpat.acl"		//ブレンドゲームパーツ
#include "..\scaddata\blendpat.ach"

#include "blendmsg.h"
//=========================================================================
//	定義
//=========================================================================
//#define name value

#define ROTATE_CENTER_X 	(120)							//回転中心X
#define ROTATE_CENTER_Y 	(80)							//回転中心Y
#define ROTATE_MAP			(8)								//BGMAP上の回転する場所
#define ROTATE_CHARA		(0)								
#define BACK_MAP			(12)							//背景BGMAPｽｸﾘｰﾝ番号
#define BACK_CHARA			(2)								//背景BGｷｬﾗ番号
#define BLEND_BACK_MAP		(BG_VRAM+0x800*BACK_MAP)		//背景BGMAPｽｸﾘｰﾝｱﾄﾞﾚｽ
#define METER1_PAT_0		(0x80e1)						//ﾒｰﾀｰ空白ｷｬﾗ番号
#define METER1_POS_X 		(0xb)							//ﾒｰﾀｰ座標X
#define METER1_POS_Y 		(0)								//ﾒｰﾀｰ座標Y
#define METER1_POS_INDEX	(METER1_POS_X+METER1_POS_Y*32)	//ﾒｰﾀｰｷｬﾗ配置位置
#define METER1_MAP_MAX		(8)								//ﾒｰﾀｰｷｬﾗ最大数
#define METER1_DOT_MAX		(METER1_MAP_MAX*8)				//ﾒｰﾀｰドット数MAX

#define RESULT_X1			(4)
#define RESULT_Y1			(2)
#define RESULT_X2			(25)
#define RESULT_Y2			(17)

#define BLEND_TIME_MAX		((99*60+59)*60)					//９９分５９秒まで

#define SPEED_PAT_0			(0x8072)						//ｽﾋﾟｰﾄﾞﾒｰﾀｰｷｬﾗ番号
#define SPEED_POS_X 		(12)							//ｽﾋﾟｰﾄﾞﾒｰﾀｰ座標X
#define SPEED_POS_Y 		(17)                            //ｽﾋﾟｰﾄﾞﾒｰﾀｰ座標Y
#define SPEED_POS_INDEX		(SPEED_POS_X+SPEED_POS_Y*32)	//ｽﾋﾟｰﾄﾞﾒｰﾀｰ位置

#define ROTATE_DEMO_RATIO		(0x50)
#define ROTATE_FIRST_RATIO		(0x100)
#define ROTATE_DEMO_VSPEED		(512)
#define ROTATE_DEMO_STEP		(4)
#define ROTATE_DEMO_SPEED		((ROTATE_FIRST_RATIO-ROTATE_DEMO_RATIO)/ROTATE_DEMO_STEP)

// ----------ﾃｷｽﾄ表示用ｵﾌｾｯﾄ指定---------------------
#define	NAME_CHR_SIZE	(10*2)				//名前ｵﾌｾｯﾄ
#define	YESNO_CHR_SIZE	(NELEMS(yesno)*2)	//はい・いいえｵﾌｾｯﾄ
#define CURSOR_CHR_SIZE (2)					//ｶｰｿﾙｵﾌｾｯﾄ
#define BLANK_CHR_SIZE (2)					//空白ｷｬﾗｵﾌｾｯﾄ
#define WINMSG_CHR_SIZE	(100)				//ウインドウ内ﾒｯｾｰｼﾞｵﾌｾｯﾄ

#define V_KAKUDO_MIN	(128)				//回転速度MIN
#define V_KAKUDO_MAX	(1500)				//回転速度MAX（しかしJUSTを出すと少しずつ上がる）
#define PLUS_OVER_MAX	(0x80)				//MAXを超えたときにJUSTを出した時用の設定
#define PLUS_V_KAKUDO	(0x100)				//成功の時のﾌﾟﾗｽｽﾋﾟｰﾄﾞ（÷人数）
#define PLUS_JUST_V_KAKUDO	(0x180)			//JUSTの時のﾌﾟﾗﾙｽﾋﾟｰﾄﾞ（÷人数）
#define MINUS_V_KAKUDO	(0x100)				//失敗の時のﾏｲﾅｽｽﾋﾟｰﾄﾞ（÷人数）
#define ENDMETER_MAX	(100*10)			//終了メーターの幅(内部計算用)
#define JUST_PLUS_DIV	(55)				//JUSTの時の計算分母（終了メーター用）
#define PLUS_DIV		(70)				//成功の時の計算分母（終了メーター用）


#define NAME_CHR_START_NO	0				
#define YESNO_CHR_START_NO	(NAME_CHR_START_NO+NAME_CHR_SIZE*4)		//はい・いいえのオフセット
#define CURSOR_CHR_START_NO	(YESNO_CHR_START_NO+YESNO_CHR_SIZE)		//カーソルのオフセット
#define BLANK_CHR_START_NO	(CURSOR_CHR_START_NO+CURSOR_CHR_SIZE)	//空白のオフセット
#define WINMSG_CHR_START_NO	(BLANK_CHR_START_NO+BLANK_CHR_SIZE)		//TALK命令で表示のテキストのオフセット

//-------------通信用コマンド定義-----------------------------------------------
#define COMMAND_BOO		(0x2345)			//通信用ボタン押し失敗コマンド
#define COMMAND_OK		(0x5432)			//通信用ボタン押し成功コマンド
#define COMMAND_JUST	(0x4523)			//通信用ボタン押しジャストコマンド
#define COMMAND_END		(0x2534)			//通信用ブレンド終了コマンド

#define	BLEND_END				(0x1111)	//親からブレンドマシーンを終了するコマンド
#define	BLEND_CONTINUE			(0x2222)	//親から継続してプレイするというコマンド
#define	REASON_NO				(0x3333)	//NOを選択した人がいた
#define	REASON_NOKINOMI			(0x4444)	//だれかがもうきのみがない
#define	REASON_FULLCUBE			(0x5555)	//だれかがキューブケースがいっぱい
#define	REASON_ALLNO			(0x6666)	//全員NOを選択した
#define	SELECT_YES				(0x7779)	//「はい」を選択
#define	SELECT_NO				(0x8888)	//「いいえ」を選択
#define	SELECT_YES_BUT_NOKINOMI	(0x9999)	//「はい」を選択したんだけどきのみがない
#define	SELECT_YES_BUT_FULLCUBE (0xaaaa)	//「はい」を選択したんだけどキューブがもういっぱい



static const s8 arrowmove[4][2]={
	{-1,-1},
	{ 1,-1},
	{-1, 1},
	{ 1, 1},
};

static const u8 namepos[2][4][2]={			//名前の位置	
	{
		{2,6},{23,6},{2,12},{23,12},			//５文字用
	},
	{
		{1,6},{22,6},{1,12},{22,12},			//７文字用
	},
};

static const u8 arrowpos[4][2]={		//矢印（回転用）の位置
	{120-48,80-48},
	{120+48,80-48},
	{120-48,80+48},
	{120+48,80+48},
};

static const u8 table_table[3][4]={		//２～４人プレイの時の配置テーブル
	{0xff, 0, 1,0xff},
	{0xff, 0, 1,   2},
	{   0, 1, 2,   3},
};

//static const u16 start_point[]={0xb480,0x7100,0xf600,0x3200};		//初期位置のホイール角度
//static const u16 start_point[]={0xa000,0x6000,0xe000,0x2000};		//初期位置のホイール角度
static const u16 start_point[]={0x0000,0xc000,0x4000,0x8000};		//初期位置のホイール角度
static const u8  start_tbl[]={1,1,0};								//初期位置のとる場所


//static const u8 hit_table[]={5,1,9,13};
//        0            1
//          C0       80
//　　　　　　×―×
//　　　　　×　　　×
//　　　　　｜　　　｜
//　　　　　×　　　×
//　　　　　　×―×
//          0        40
//        2            3

//        0            1
//          C0       80
//　　　　　　×―×
//　　　　　×　　　×
//　　　　　｜　　　｜
//　　　　　×　　　×
//　　　　　　×―×
//          0        40
//        2            3


static const u8 hit_table[]={0x20, 0xe0, 0x60, 0xa0};





//static const u8 hit_table[]={0xc0, 0x80, 0, 0x40};


void BlendTestInit(void);
void BlendTestMain(void);
void ItemJingle2ContestBgm(u8 no);

extern const u32 DecordAdrs[];
extern void BlendMachineInit();
extern void CubeBlendBagInit();		//ﾊﾞｯｸﾞ画面呼び出し関数
extern u16 ReturnItemNo;			//選択されたタネが格納
extern void kanshi_num_set(u16 w0, u16 w1);
extern void DebugNumPrintInit(u8 pal, u8 select, u8 screen, u8 chara);
extern u32 GetBlendMachineCount();

extern void BlendMachineFunction_Set();	//キー同期関数
extern void BlendMachineStartSend();	//ブレンドマシーンスタート同期用
extern u8 SoftResetDisable;				//ソフトリセット許可不許可

extern u8   SendXydataFlag;
extern SIOTRAINER_INFO SioTrainerInfo[4];
extern u16  RecvBuf[MULTI_SIO_RECV_MAX][MULTI_SIO_PLAYERS_MAX];
extern u16  SendBuf[MULTI_SIO_SEND_MAX];
extern u8	SendPoolBuf[];

extern void PokemonMultiSioInit();
extern void kanshi_network(u8 no);

extern u8 SetTagSeedActEx( u8 no , u8 x ,u8 y, u8 flag);

// =================================================================
// BlendMachineTypeSet
// 概要  : タネブレンダーの設定をする（一人用のときに２人か４人か）
// 引数  : type
//			PLAYER_SIO	0			//通信でプレイ
//          PLAYER_2	1			//コンピュータとプレイ・２人
//          PLAYER_3	2			//コンピュータとプレイ・３人
//          PLAYER_4	3			//コンピュータとプレイ・４人
// 戻り値: extern void
// =================================================================
void BlendMachineTypeSet(u8 type);

// =================================================================
// BlendMachineTitleInit
// 概要  : ブレンドマシーンのスタート
// 引数  : none
// 戻り値: extern void
// =================================================================
void BlendMachineTitleInit();


// =================================================================
// BlendMachineInit
// 概要  : バッグでタネを選択した後に呼ぶメインルーチンへの初期化
// 引数  : none
// 戻り値: GLOBAL void
// =================================================================
void BlendMachineInit();


void BlendMachineMain();
void BlendMachineTitle();

void BlendMachineEnd();
void BlendMachineEnd_Sio();
void BlendMachineEnd_Offline();


void WaitBlendMachineStart(u8 no);
void BlendMachineMemberItem(u8 Id, u16 Item);


static void SioFunc();
static void MeterFunc(u16 meter, u16 max);
static void MeterFuncSub(u16 meter, u16 max);
static void SpeedMeterFunc(u16 v);
static void rotate_func();
static void BlendBGAffineSet(	BgAffineDestData *des);
static void BlendMachineInit_Sio();
static void BlendMachineInit_Offline();

static void hibana_actor_add();
static void hibana_act_move(actWork *act);
static void HanteiMove(actWork *act);
static void HanteiMove2(actWork *act);
static void VsyncRotateSet();
static void VsyncBgOffset();

static void NPC_hantei0(u8 no);
static void NPC_hantei1(u8 no);
static void NPC_hantei2(u8 no);
static void OfflineSendRecvBufInit();


// NPCのブレンダーAIテーブル
static void (* const  NPC_functable[])(u8 no)={
	NPC_hantei0,
	NPC_hantei1,
	NPC_hantei2,
};


static void SpeedUpVibration();
static void SpeedUpVibrationSet(s16 *n, u16 offset);
static void CubeComentSet(CUBE *p, u8 *buf);

static u8 BlendMachineResultPut();
static u8 BlendMachineResultPut2();

static void CountActSeq(actWork *Xreg);			
static void StartActSeq(actWork *Xreg);			

static u8 BlendMachineVibration();


u8 BlendTalkMsgPut( void );
void BlendTalkMsgSet( const u8 * msg, u16 chr_no, u8 x, u8 y );
void BlendMsgPrint( const u8 * msg, u16 chr_no, u8 x, u8 y );
void BlendWindMsgPrint(const u8 *msg, u16 chr_no,u8 x1, u8 y1, u8 x2, u8 y2);
static void BlendMachineNamePrint();
static void PositionTableMake();


//=========================================================================
//	変数
//=========================================================================
//extern type
//-------------------- extern変数  ---------------------------------

//GLOBAL type valiable;
/*-------------------- グローバル 変数  ----------------------------*/

//LOCAL type valiable;
/*-------------------- ローカル 変数 -------------------------------*/
typedef struct{
	u16 no;
	u8 name[SEED_NAME_SIZE+EOM_SIZE];		//名前
	u8 para[7];								//パラメータ
}KINOMIWORK;

typedef struct{
	u32 timer;
	u16	bpm_max;
	u16 etc;
}BLEND_RESULT;

typedef struct{
	u8 			initflag;
	u8			graphic_init;
	TALK_WIN 	tw;					//ﾃｷｽﾄｺﾝﾃｷｽﾄ
	u8			windowwork;
	u8 			end_ok[2];
	u16			sendwork[10];
	u8			exchangeflag;		//
	u8			exchangeold;
	u16			exchangecount;
	u16			endwait;
	u8			actno[3];
	u16 		kakudo;				//回転角	（少数8bit）
	s16 		v_kakudo;			//回転ｽﾋﾟｰﾄﾞ
	u16			oldkakudo;
	u16			bpm_max;			//最高回転スピードの保存ﾊﾞｯﾌｧ
	u8			cursoractno[4];	
	u8			cursorwork[4];
	u8			barno;
	u8			barpoint[10];
	u8			endflag;
	u16			siowork[4];
	u16			sio_reason[2];
	u16			selectwork;
	u8			down_count;
	u16         memberitem[4];
	u8			member_num;
	u16			oldpad[4];
	u16			pad[4];
	u16			table[4];			//２～４人プレイの配置テーブル
	u16			reverse[4];			//逆引き用のテーブル
	u8			cursor;
	u8			strbuf[50];
	u32			timer;
	s32			wait;
	u32			end_watch;			//開始時に通信を３０秒繋ぐことができなかったら終了
	u8			bound[4];			//バウンドして中央に入る木の実ｱｸﾀｰ番号
	u8			boundnum;			//バウンドした回数
	u16			end_meter;			//終了までのメーター
	u16			now_meter;			//アニメさせるためのメーター用のテンポラリ
	u16			Ratio;				//回転面用の関数
	s16			BgOffsetX;			//画面揺れ様の変数X
	s16			BgOffsetY;			//		”		  Y
	u8			NPC_taskno[3];		//NPCプレイヤーﾀｽｸの番号
	u8			NPC_flag;			//NPCプレイヤーがスーパーサイヤ人になるフラグ(L_BUTTON)
	u16			hitcount[4][3];		//ジャスト・成功・失敗を数える
	u8			sort[4];			//ボタン押しの結果でソート
	BgAffineDestData Rotate;		//回転面ｾｯﾄ用のﾊﾞｯﾌｧ
	u16 		nowsong;			//きのみブレンダーが始まるまでなっている曲の番号
	KINOMIWORK	Kinomi[4];			//きのみパラメータ（RAMきのみ対応）
	BLEND_RESULT BlendResult;
	u32			saveseq;
#if SEEQUENCE_DEBUG
	u16			seqlognum;			//
	u8			seqlog[1000];		//シーケンスログ
#endif
}BLENDMACHINE_WORK;

BLENDMACHINE_WORK *bmw;
u8	BlendMachineType;

//#define bmw ((BLENDMACHINE_WORK*)&UserWork[0x18000])



// =============================================
// アクター定義
// =============================================

#include "blendact.h"


static void motor_pitch()
{
	m4aMPlayPitchControl(&m4a_mplay002,0xffff,(bmw->v_kakudo-128)*2);
}

/********************************************************************/
/*                                                                  */
/*				割り込み											*/
/*                                                                  */
/********************************************************************/
static void VInterFunc( void )
{
	VsyncRotateSet();					//回転面ﾚｼﾞｽﾀ設定
	VsyncBgOffset();					//BG1ｵﾌｾｯﾄ設定

	actOAMtrans();						//ｱｸﾀｰ転送処理1
	actDMAtrans();						//ｱｸﾀｰ転送処理2
	PaletteFadeTrans();
}

static void VInterFunc2( void )
{

	actOAMtrans();						//ｱｸﾀｰ転送処理1
	actDMAtrans();						//ｱｸﾀｰ転送処理2
	PaletteFadeTrans();
}


#if SEEQUENCE_DEBUG
static SeekLogCheck()
{
	if(bmw->seqlognum < 1000){
		bmw->seqlog[bmw->seqlognum] = bmw->initflag;
		bmw->seqlognum++;
	}
}
#endif

//===================================================================
//  ﾀﾈﾌﾞﾚﾝﾀﾞｰ用画像転送
//===================================================================
static u8 BlendMachineGraphicSet()
{
	switch(bmw->graphic_init){
		case 0:
			//--------回転面用データセット--------------
			DecordWram((void*)b_r_pch_ADRS, &UserWork[0x10000]);
			bmw->graphic_init++;
			break;
		case 1:
			DIV_DMAARRAYCOPY(3, b_r_Map, BG_VRAM+0x4000, 16);
			PaletteWorkSet(blend_r_Palette, 0, 16*8*2);
			bmw->graphic_init++;
			break;
		case 2:
			DIV_DMACOPY(3, &UserWork[0x10000], BG_VRAM, 0x2000,16)
			bmw->graphic_init++;
			break;
		case 3:
			DecordWram((void*)blendbak_pch_ADRS, &UserWork[0x10000]);
			bmw->graphic_init++;
			break;
		case 4:
			DecordWram((void*)blendbak_psc_ADRS, &UserWork[0x13000]);
			bmw->graphic_init++;
			break;
		case 5:
			//--------背景セット-----------------------
			DIV_DMACOPY(3, &UserWork[0x10000], BG_VRAM+0x8000, 0x1000,16)
			bmw->graphic_init++;
			break;
		case 6:
			//--------背景セット-----------------------
			DIV_DMACOPY(3, &UserWork[0x10000+0x1000], BG_VRAM+0x8000+0x1000, 0x1000,16)
			bmw->graphic_init++;
			break;
		case 7:
			DIV_DMACOPY(3, &UserWork[0x13000], BLEND_BACK_MAP, 0x500,16)
			PaletteWorkSet(blendbak_Palette, 16*8, 16*2);
			bmw->graphic_init++;
			break;

		case 8:
			//--------OBJセット----------------------
			CellSet((CellData *)&CursorActCell);	//セルセット
			CellSet((CellData *)&HibanaActCell);	//セルセット
			CellSet((CellData *)&HanteiActCell);	//セルセット
			bmw->graphic_init++;
			break;

		case 9:
			CellSet((CellData *)&CountActCell);	//セルセット
			CellSet((CellData *)&StartActCell);	//セルセット
			ObjPalSet((PalData *)&CursorActPal);	//パレットセット
			ObjPalSet((PalData *)&BlendPatActPal);	//パレットセット
			bmw->graphic_init=0;
			return 1;
			break;
	}
	return 0;
}



//===================================================================
//  ﾀﾈﾌﾞﾚﾝﾀﾞｰ用画面レジスタ設定
//===================================================================
static void BlendMachineGraphicRegSet()
{
			*(vu16 *)REG_DISPCNT = 	DISP_MODE_1		// BGモード 
    	              |	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
					  | DISP_OBJ_ON
					  | DISP_BG0_ON					// BG0有効
					  | DISP_BG1_ON					// BG0有効
//					  | DISP_BG2_ON					// BG2有効
						;

			//回転面設定
			*(vu16 *)REG_BG2CNT = BG_COLOR_256			// 256色選択
						| BG_SCREEN_SIZE_1				// スクリーンサイズ
						| BG_PRIORITY_0					// BG優先順位
						| ROTATE_MAP << BG_SCREEN_BASE_SHIFT		// スクリーンベースブロック
						| ROTATE_CHARA << BG_CHAR_BASE_SHIFT 		// キャラクタベースブロック
						| BG_LOOP_OFF
						;

			//背景面設定
			*(vu16 *)REG_BG1CNT = BG_COLOR_16			// 16色選択
						| BG_SCREEN_SIZE_0				// スクリーンサイズ
						| BG_PRIORITY_1					// BG優先順位
						| 12 << BG_SCREEN_BASE_SHIFT	// スクリーンベースブロック
						| 2 << BG_CHAR_BASE_SHIFT 		// キャラクタベースブロック
						;

			*(vu16 *)REG_BG0HOFS = 0;
			*(vu16 *)REG_BG0VOFS = 0;
            *(vu16 *)REG_BG1HOFS = 0;
            *(vu16 *)REG_BG1VOFS = 0;
}
//------------------------------------------------------------------
//  タイトル画面
//------------------------------------------------------------------
void BlendMachineTitleInit()
{
	bmw = (BLENDMACHINE_WORK*)&UserWork[0x18000];		//ﾎﾟｲﾝﾀを当てただけ
	bmw->endflag  = 0;
	bmw->initflag = 0;
	bmw->endflag=0;

	BlendMachineTypeSet(ScriptParameter0);
	MainProcChange(BlendMachineTitle);
}

//------------------------------------------------------------------
//  タイトル画面のための場繋ぎ
//------------------------------------------------------------------
void BlendMachineTitle()
{
	int i;
	switch(bmw->initflag){
		case 0:
			*(vu16*)REG_DISPCNT = 0;
//			PokemonMultiSioEnd();
			InitActor();				//アクター初期化
			ObjPalManInit();			//OBJパレットマネージャー初期化
			SetVBlankFunc(NULL);
			PrintScreenInit(BLENDMACHINE_TYPE);
			MsgControlInit(&(bmw->tw), BLENDMACHINE_TYPE);
			bmw->windowwork = NWinFrameInit(256);
//			NWinFrameDataSet(&(bmw->tw));
			NMenuScreenInitEx2(BLENDMACHINE_TYPE,1);			
			
			bmw->initflag++;
			bmw->now_meter = 0;			//アニメさせるためのメーター用のテンポラリ
			bmw->end_meter = 0;
			bmw->Ratio     = ROTATE_DEMO_RATIO;
			bmw->BgOffsetX = 0;			//画面揺れ様の変数X
			bmw->BgOffsetY = 0;			//		”		  Y
			bmw->graphic_init = 0;
			rotate_func();
			break;
		case 1:
			//--------回転面・背景用データセット--------------
			if(BlendMachineGraphicSet()){		//画像転送
				//ｶｰｿﾙｱｸﾀｰ表示
				for(i=0;i<4;i++){
					bmw->cursoractno[i]=AddActor(&CursorHeader,arrowpos[i][0],arrowpos[i][1],1);
					ActAnmChg(&ActWork[bmw->cursoractno[i]],8+i);
				}
				SetVBlankFunc(VInterFunc);
				bmw->initflag++;
			}
			break;
		case 2:
			PaletteFadeReq(0xffffffff,0,16,0,0);			//フェードイン
			rotate_func();
			bmw->initflag++;
			break;
		case 3:
			BlendMachineGraphicRegSet();					//画面レジスタ設定
			if( FadeData.fade_sw == 0 )					
				bmw->initflag++;
			break;
		case 4:
			NMenuWinBoxWrite(0,14,29,19);
			BlendTalkMsgSet( title_msg, WINMSG_CHR_START_NO, 2, 15);

			//画面表示の為に一回だけ回転計算をセット
			bmw->initflag++;
			break;
		case 5:
			if(BlendTalkMsgPut()){		//メッセージの表示終了待ち
				bmw->initflag++;
				PaletteFadeReq(0xffffffff,0,0,16,0);			//フェードイン
			}
			break;
		case 6:
			if( FadeData.fade_sw == 0 ){								//フィールドへ復帰
				CubeBlendBagInit();			//タネ選択画面へ
				bmw->initflag=0;
			}
			break;
	}


	JumpActor();
	SetActor();
	PaletteAnime();
}


enum{
	TANE_HOZONY=0,
	TANE_MOVEX,
	TANE_MOVEY,
	TANE_FIRSTPOWER,
	TANE_POWER,
	TANE_BOUND,
	TANE_MUKI,
	TANE_MUKI2,
};
//===============================================================================
//  バウンドするたねのアクター動作関数
//===============================================================================
static void BoundSeedActMove(actWork *Xreg)
{
	Xreg->work[TANE_MOVEX] += Xreg->work[TANE_MUKI];
	Xreg->work[TANE_MOVEY] -= Xreg->work[TANE_POWER];
	Xreg->work[TANE_MOVEY] += 1  * Xreg->work[TANE_MUKI2];
	Xreg->work[TANE_HOZONY] += 1 * Xreg->work[TANE_MUKI2];
	Xreg->work[TANE_POWER] -= 1;
	if(Xreg->work[TANE_HOZONY]<Xreg->work[TANE_MOVEY]){
		Xreg->work[TANE_POWER] = Xreg->work[TANE_FIRSTPOWER] - 1;
		Xreg->work[TANE_FIRSTPOWER] -= 1;
		Xreg->work[TANE_BOUND]++;
		if(Xreg->work[TANE_BOUND]>3){
			DelActor(Xreg);
		}else{
			SePlay( SE_TB_KARA);
		}
	}
	Xreg->x = Xreg->work[TANE_MOVEX];
	Xreg->y = Xreg->work[TANE_MOVEY];
}


//===============================================================================
//  バウンドするたねのセット関数
//===============================================================================
static void SetBoundSeedActMove(actWork *p,s16 x, s16 y, s16 power, s16 muki,s16 muki2)
{
	p->work[TANE_HOZONY] = y;
	p->work[TANE_MOVEX] = x;
	p->work[TANE_MOVEY] = y;
	p->work[TANE_FIRSTPOWER] = power;
	p->work[TANE_POWER] = 10;
	p->work[TANE_BOUND]	= 0;
	p->work[TANE_MUKI] = muki;
	p->work[TANE_MUKI2] = muki2;
	p->move = BoundSeedActMove;
}

static const s16 BoundActTbl[][5]={
	{-10, 20, 10, 2, 1},
	{250, 20, 10,-2, 1},
	{-10,140, 10, 2,-1},
	{250,140, 10,-2,-1},
};


//=========================================================================
//	バウンドするたねを登録
//=========================================================================
static void SetBoundActor(u16 tane, u8 no)
{
	u8 work;
	
	work = SetTagSeedActEx( tane - ITEM_SEED_START,0,80,no%2);
	SetBoundSeedActMove(&ActWork[work],BoundActTbl[no][0], BoundActTbl[no][1],BoundActTbl[no][2], 
		BoundActTbl[no][3],BoundActTbl[no][4]);
}

// =================================================================
// KinomiWorkSet
// 概要  : きのみ送信用ワークをセット
// 引数  : kp
//       : Item
// 戻り値: none
// =================================================================
static void KinomiWorkSet(KINOMIWORK *kp, u16 Item)
{
	const SEED_PARAM	*sp;

	sp = GetSeedParam(Item - ITEM_SEED_START+1);
	kp->no = Item;					//アイテム番号

	PM_strcpy(kp->name, sp->name);	//名前

	kp->para[0] = sp->karai;			//辛さ
	kp->para[1] = sp->sibui;			//渋さ
	kp->para[2] = sp->amai;				//甘さ
	kp->para[3] = sp->nigai;			//苦さ
	kp->para[4] = sp->suppai;			//酸っぱさ
	kp->para[5] = sp->umai;				//旨さ
	
}


// =================================================================
// BlendMachineTypeSet
// 概要  : タネブレンダーの通信・一人用の設定を行います
// 引数  : type
// 戻り値: none
// =================================================================
void BlendMachineTypeSet(u8 type)
{
	switch(type){
		case PLAYER_SIO:
			BlendMachineType = PLAYER_SIO;
			break;
		case PLAYER_2:
			BlendMachineType = PLAYER_2;
			bmw->member_num = 2;
			PM_strcpy(SioTrainerInfo[0].name,MyData.my_name);
			PM_strcpy(SioTrainerInfo[1].name,npc_name[0]);
			break;

		case PLAYER_3:
			BlendMachineType = PLAYER_3;
			bmw->member_num = 3;
			PM_strcpy(SioTrainerInfo[0].name,MyData.my_name);
			PM_strcpy(SioTrainerInfo[1].name,npc_name[0]);
			PM_strcpy(SioTrainerInfo[2].name,npc_name[1]);
			break;
		case PLAYER_4:
			BlendMachineType = PLAYER_4;
			bmw->member_num = 4;
			PM_strcpy(SioTrainerInfo[0].name,MyData.my_name);
			PM_strcpy(SioTrainerInfo[1].name,npc_name[0]);
			PM_strcpy(SioTrainerInfo[2].name,npc_name[1]);
			PM_strcpy(SioTrainerInfo[3].name,npc_name[2]);
//			BlendMachineMemberItem(0, ITEM_SEED_START);
			break;
	}
}


//------------------------------------------------------------------
//  ブレンドマシーン初期化関数
//------------------------------------------------------------------
void BlendMachineInit()
{
	int i;
	*(vu16*)REG_DISPCNT = 0;
	bmw = (BLENDMACHINE_WORK*)&UserWork[0x18000];		//ﾎﾟｲﾝﾀを当てただけ
	bmw->initflag = 0;
	bmw->end_watch = 0;
#if SEEQUENCE_DEBUG
	bmw->seqlognum = 0;
#endif
	
	for(i=0;i<4;i++) bmw->memberitem[i] = 0;
	BlendMachineTypeSet(ScriptParameter0);
	

	if(ScriptParameter0==PLAYER_SIO)	MainProcChange(BlendMachineInit_Sio);		//通信用
	else								MainProcChange(BlendMachineInit_Offline);		//一人用（２，３，４）
}

enum{
	BLEND_INIT=0,
	BLEND_GRAPHIC_INIT,
	BLEND_ADD_ACTOR,
	BLEND_FADEIN_START,
	BLEND_FADEIN_WAIT,
	BLEND_SIO_INIT,
	BLEND_SIO_START_WAIT,
	BLEND_SIO_START,
	BLEND_SIO_WAIT,
	BLEND_SIO_SEND,
	BLEND_SIO_RECV,
	BLEND_TANE_BOUND,
	BLEND_TANE_BOUND_WAIT,
	BLEND_TOP_CHECK,
	BLEND_SET_DISK,
	BLEND_VIBRATION,
	BLEND_COUNTDOWN_START,
	BLEND_COUNTDOWN,
	BLEND_START,
	BLEND_ITEM_RECV,
	BLEND_TEXT_INIT,
	BLEND_GAMEN_INIT,
};

//------------------------------------------------------------------
//  初期化実体処理(マルチプレイヤー版)
//------------------------------------------------------------------
static void BlendMachineInit_Sio()
{
	int i,w;
	
	switch(bmw->initflag){
		case BLEND_INIT:
			InitActor();				//アクター初期化
			ObjPalManInit();			//OBJパレットマネージャー初期化
			InitTask();
			
			SetVBlankFunc(VInterFunc);

			PrintScreenInit(BLENDMACHINE_TYPE);
			MsgControlInit(&(bmw->tw), BLENDMACHINE_TYPE);
			bmw->windowwork = NWinFrameInit(256);
			NWinFrameDataSet(&(bmw->tw));
//			PaletteWorkSet(Test_Palette,(bmw->tw.context->BasePalette)*16,32);
			NMenuScreenInitEx2(BLENDMACHINE_TYPE,1);			
			PokemonSioNinshouNo = NINSHOU_BLEND_GAME;
			bmw->initflag++;
			bmw->endwait = 0;
			bmw->down_count = 0;
			bmw->BgOffsetX = 0;			//画面揺れ様の変数X
			bmw->BgOffsetY = 0;			//		”		  Y
			for(i=0;i<4;i++){
				bmw->siowork[i]    = 0;
				for(w=0;w<3;w++) 
					bmw->hitcount[i][w] = 0;
			}
			bmw->selectwork = 0;
//			PokemonMultiSioEnd();


			//--------回転面・背景用データセット--------------

			bmw->v_kakudo = 0;
			bmw->kakudo   = 0;
			bmw->bpm_max = 0;
			bmw->graphic_init = 0;

//			DebugNumPrintInit(0,1,12,2);
			break;
		case BLEND_GRAPHIC_INIT:
			if(BlendMachineGraphicSet()){
				bmw->initflag++;	//画像転送
				rotate_func();
			}
			break;
		case BLEND_ADD_ACTOR:		//スイッチの入ってないカーソル配置
			for(i=0;i<4;i++){
					bmw->cursorwork[i] = AddActor(&CursorHeader,
						arrowpos[i][0],arrowpos[i][1],1);
					ActAnmChg(&ActWork[bmw->cursorwork[i]],8+i);
			}
			bmw->initflag++;
			break;

		case BLEND_FADEIN_START:
			PaletteFadeReq(0xffffffff,0,16,0,0);			//フェードイン
			bmw->initflag++;
			break;
		case BLEND_FADEIN_WAIT:
			BlendMachineGraphicRegSet();	//画面ﾚｼﾞｽﾀ設定
			if( FadeData.fade_sw == 0 ){								//フィールドへ復帰
				bmw->initflag++;
			}
			break;

		case BLEND_SIO_INIT:			//もとはここで通信接続してましたが、やめました。
										//現在は受付からずっと接続しっぱなしです。
			BlendWindMsgPrint(taiki_msg,WINMSG_CHR_START_NO,0,13,29,19);
			bmw->initflag = BLEND_SIO_WAIT;
			bmw->wait = 0;
			break;
		case BLEND_SIO_WAIT:
			bmw->initflag++;
			bmw->boundnum = 0;
			KinomiWorkSet(&(bmw->Kinomi[0]),ReturnItemNo);
			memcpy(SendPoolBuf,&(bmw->Kinomi[0]),sizeof(KINOMIWORK));
			
			SetSioSynchronize();				//通信同期開始
			bmw->wait = 0;
			break;
		case BLEND_SIO_SEND:
				if(SplitDataSendStatus()){
					SplitDataResultReset();
					if(GetSioConnectId()==0){				//親はデータ送信
						SplitDataExchangeStart(4);			//40バイト交換
					}
					bmw->initflag++;
				}
			break;
		case BLEND_SIO_RECV:
			if(++bmw->wait > 20){
				NMenuScreenClear();
				if(SplitDataResult()==GetConnectMemberBitData()){
					for(i=0;i<GetConnectSioMenberNum();i++){
						memcpy(&(bmw->Kinomi[i]), RecvPoolBuf[i],sizeof(KINOMIWORK));
						bmw->memberitem[i] = bmw->Kinomi[i].no;
					}
					SplitDataResultReset();
					bmw->initflag++;
				}
			}
			break;
		case BLEND_TANE_BOUND:
			bmw->member_num = GetConnectSioMenberNum();
			for(i=0;i<4;i++){
				if(bmw->boundnum==table_table[bmw->member_num-2][i]){
					SetBoundActor(bmw->memberitem[bmw->boundnum],i);
					break;
				}
			}
			bmw->wait = 0;
			bmw->initflag++;
			bmw->boundnum++;
			break;
		case BLEND_TANE_BOUND_WAIT:
			if(++bmw->wait>60){
				if(bmw->boundnum>=bmw->member_num){
					bmw->initflag++;
					bmw->kakudo = start_point[start_tbl[bmw->member_num-2]]-ROTATE_DEMO_SPEED*ROTATE_DEMO_VSPEED;
				}else{
					bmw->initflag--;
				}
				bmw->wait = 0;
			}
			break;
		case BLEND_TOP_CHECK:
			if(SplitDataSendStatus()){
				bmw->initflag++;
				BlendBGAffineSet(&bmw->Rotate);				//回転計算
			}
			break;
		case BLEND_SET_DISK:
			*(vu16 *)REG_DISPCNT |= DISP_BG2_ON;			// BG2有効
			bmw->kakudo+=ROTATE_DEMO_VSPEED;
			bmw->Ratio+=ROTATE_DEMO_STEP;
			if(bmw->Ratio>=ROTATE_FIRST_RATIO){
				bmw->initflag++;
				bmw->Ratio=ROTATE_FIRST_RATIO;
				bmw->kakudo = start_point[start_tbl[bmw->member_num-2]];
				//回転面設定
				*(vu16 *)REG_BG2CNT = BG_COLOR_256			// 256色選択
						| BG_SCREEN_SIZE_1				// スクリーンサイズ
						| BG_PRIORITY_2					// BG優先順位
						| ROTATE_MAP << BG_SCREEN_BASE_SHIFT		// スクリーンベースブロック
						| ROTATE_CHARA << BG_CHAR_BASE_SHIFT 		// キャラクタベースブロック
						| BG_LOOP_OFF
						;
				bmw->wait = 0;
				PositionTableMake();
				BlendMachineNamePrint();
			}
			BlendBGAffineSet(&bmw->Rotate);				//回転計算
			break;
		case BLEND_VIBRATION:
			if(BlendMachineVibration()){
				bmw->wait = 0;
				bmw->initflag++;
			}
			BlendBGAffineSet(&bmw->Rotate);				//回転計算
			break;

		case BLEND_COUNTDOWN_START:			//カウントダウンスタート
				AddActor(&ActCountHeader,120,-16,3);
				bmw->initflag++;
			break;

		case BLEND_COUNTDOWN:				//ActCountMove内でプラスしてもらう
			
//			bmw->initflag++;
			break;
		case BLEND_START:
			bmw->initflag++;
			break;
		case BLEND_ITEM_RECV:
			
			SetSioSynchronize();				//通信同期開始
			bmw->initflag++;
			break;
		case BLEND_TEXT_INIT:
			if(SplitDataSendStatus()){
				BlendMachineFunction_Set();
				bmw->initflag++;
			}
			break;
		case BLEND_GAMEN_INIT:

			bmw->v_kakudo=V_KAKUDO_MIN;
			bmw->timer = 0;

			MainProcChange(BlendMachineMain);
			if(BGM_GetNowNo()!=MUS_CYCLING)
				bmw->nowsong = BGM_GetNowNo();
			MusicPlay(MUS_CYCLING);
			break;
		case 100:
			NMenuWinBoxWrite(0,13,29,19);
			BlendTalkMsgSet( sioend_msg, WINMSG_CHR_START_NO, 2, 15);
			bmw->initflag++;
			break;
		case 101:
			if(BlendTalkMsgPut()){
				bmw->initflag++;
//				PaletteFadeReq(u32 fade_bit, s8 wait, u8 start_evy, u8 end_evy, u16 next_rgb);
//				LightFadeReq(N_to_B);										//フェードアウト
//				m4aMPlayAllContinue();
			}
			break;
		case 102:
			if( FadeData.fade_sw == 0 ){								//フィールドへ復帰
//				MusicPlay(bmw->nowsong);
				MainProcChange(FieldScriptRecover);
			}
			break;
	}

	MainTask();
	JumpActor();
	SetActor();
	PaletteAnime();
	
}


static void InitBlendMachineGraphic()
{
			*(vu16 *)REG_DISPCNT = 	0;		// BG OFF 
			InitActor();				//アクター初期化
			ObjPalManInit();			//OBJパレットマネージャー初期化
			InitTask();
			
			SetVBlankFunc(VInterFunc);

			PrintScreenInit(BLENDMACHINE_TYPE);
			MsgControlInit(&(bmw->tw), BLENDMACHINE_TYPE);
			bmw->windowwork = NWinFrameInit(256);
			NWinFrameDataSet(&(bmw->tw));
			NMenuScreenInitEx2(BLENDMACHINE_TYPE,1);			
			PokemonSioNinshouNo = NINSHOU_BLEND_GAME;
			bmw->endwait = 0;

			//背景画像は重いので別場所に移動

			bmw->v_kakudo = 0;
			bmw->kakudo   = 0;
			bmw->bpm_max = 0;
			bmw->BgOffsetX = 0;			//画面揺れ様の変数X
			bmw->BgOffsetY = 0;			//		”		  Y

//			DebugNumPrintInit(0,1,12,2);
			bmw->initflag++;

}


#define HIT_RANGE		(48)
#define HIT_RANGE_HALF	(HIT_RANGE/2)
#define JUST_RANGE		(8)
#define JUST_START		(HIT_RANGE_HALF-(JUST_RANGE/2))
#define JUST_END		(JUST_START+JUST_RANGE)
// =================================================================
// hit_check
// 概要  : ホイールのあたり判定を行う
// 引数  : kakudo=ホイールの角度	id=位置
// 戻り値: static u8:	0=なし	1=あたり	2=ジャストあたり
// =================================================================
static u8 hit_check(u16 kakudo, u8 id)
{
	u8  pos;
	u32 hantei_kakudo;
//			hantei_kakudo = bmw->kakudo+0x1800;
		hantei_kakudo = (kakudo>>8)+HIT_RANGE_HALF;
		pos = bmw->reverse[id];
		if(hantei_kakudo >= hit_table[pos] && hantei_kakudo < (hit_table[pos]+HIT_RANGE)){	//ばっちり
			if(hantei_kakudo >= (hit_table[pos]+JUST_START) 
			&& hantei_kakudo< (hit_table[pos]+JUST_END)){		//超ばっちり！
						return 2;
			}else{											//当たり
						return 1;
			}
		}													//ダメ
		return 0;
}

//NPCが入れるきのみのためのテーブル
static const u8 NpcItemTable[][3]={
	{4,3,2},
	{0,4,3},
	{1,0,4},
	{2,1,0},
	{3,2,1},
	{0,2,3},
	{1,3,4},
	{2,4,0},
	{3,0,1},
	{4,1,2},
};

// =================================================================
// NPC_Item_Set
// 概要  : NPCがきのみを入れる処理
// 引数  : MyItem
// 戻り値: none
// =================================================================
static void NPC_ItemSet(u16 MyItem, u8 num, KINOMIWORK *kk)
{
	u16 i,work;

	work = 0;
	if(MyItem==ITEM_NAZONOMI){			//ラムきのみか？
		//ラムきのみ
		for(i=0;i<5;i++)
			if(kk->para[work] > kk->para[i]) work = i;
		work += 5;
	}else{
		//通常きのみ
		work = MyItem-ITEM_SEED_START;	//プレイヤーが選択したきのみをキーにする
		if(work >= 5){
			work = (work%5) + 5;		//0-4まではテーブル通り
		}								//5以上は割った余り+5をテーブルから引いてくる	
	}

	for(i=0;i<num-1;i++){			//コンピュータの選択を通知
		BlendMachineMemberItem(i+1, ITEM_SEED_START + NpcItemTable[work][i]);
	}

}


// =================================================================
// PositionTableMake
// 概要  : ホイールとの位置関係を表すテーブルを作成
// 引数  : none
// 戻り値: none
// =================================================================
static void PositionTableMake()
{
	int i,w;
	
	for(i=0;i<4;i++){					//IDはテーブル配置的に何番になるか。
		bmw->reverse[i] = 0xff;
		bmw->table[i] = table_table[bmw->member_num-2][i];
	}
	for(w=0;w<4;w++){					//IDからテーブル配置の逆引きテーブル作成
		for(i=0;i<4;i++){
			if(bmw->table[i]==w){
				bmw->reverse[w] = i;
			}
		}
	}

}

// =================================================================
// BlendMachineNamePrint
// 概要  : きのみブレンダーに参加してる人の名前を表示
// 引数  : none
// 戻り値: none
// =================================================================
static void BlendMachineNamePrint()
{
	int i;
	u8 strbuf[20],flag;
	for(i=0;i<4;i++){
		if(bmw->table[i]!=0xff){
			bmw->cursoractno[bmw->table[i]]=bmw->cursorwork[i];
			ActAnmChg(&ActWork[bmw->cursoractno[bmw->table[i]]],i);
			strbuf[0] = EOM_;
			if(GetSioConnectId()==bmw->table[i])	PM_strcpy(strbuf,colorchange_msg);	//自分の場合は色を変える
			PM_strcat(strbuf,SioTrainerInfo[bmw->table[i]].name);
			flag = 0;
			if(PM_strlen(SioTrainerInfo[bmw->table[i]].name)>5) flag=1;		//海外対応
			BlendMsgPrint( strbuf,NAME_CHR_START_NO+i*NAME_CHR_SIZE,
				namepos[flag][i][0],namepos[flag][i][1]);
		}
	}

}
//------------------------------------------------------------------
//  初期化実体処理(一人用)
//------------------------------------------------------------------
static void BlendMachineInit_Offline()
{
	int i,w;
	switch(bmw->initflag){
		case BLEND_INIT:
			InitBlendMachineGraphic();
			BlendMachineMemberItem(0, ReturnItemNo);		//自分で選択したきのみを格納
			KinomiWorkSet(&(bmw->Kinomi[0]),ReturnItemNo);	//きのみのパラメータを取得
			NPC_ItemSet(ReturnItemNo, bmw->member_num,&(bmw->Kinomi[0]));
			for(i=0;i<4;i++){
				bmw->siowork[i]    = 0;
				for(w=0;w<3;w++) 
					bmw->hitcount[i][w] = 0;
			}
			bmw->selectwork = 0;
			bmw->graphic_init = 0;

			break;
		case BLEND_GRAPHIC_INIT:
			if(BlendMachineGraphicSet()){
				bmw->initflag++;	//画像転送
				rotate_func();
			}
			break;

		case BLEND_ADD_ACTOR:		//スイッチの入ってないカーソル配置
			for(i=0;i<4;i++){
					bmw->cursorwork[i] = AddActor(&CursorHeader,
						arrowpos[i][0],arrowpos[i][1],1);
					ActAnmChg(&ActWork[bmw->cursorwork[i]],8+i);
			}
			bmw->initflag++;
			break;
		case BLEND_FADEIN_START:
			PaletteFadeReq(0xffffffff,0,16,0,0);			//フェードイン
			bmw->initflag++;
			bmw->wait = 0;
			break;


		case BLEND_FADEIN_WAIT:
			bmw->wait++;
			if(bmw->wait==2){
				BlendMachineGraphicRegSet();	//画面ﾚｼﾞｽﾀ設定
			}
			if( FadeData.fade_sw == 0 ){								//フィールドへ復帰
				bmw->initflag = BLEND_SIO_WAIT;
			}
			break;

		case BLEND_SIO_WAIT:
				bmw->initflag = BLEND_TANE_BOUND;
				bmw->boundnum = 0;
			break;
		case BLEND_TANE_BOUND:
			for(i=0;i<4;i++){
				w = table_table[bmw->member_num-2][i];
				if(bmw->boundnum==w){
//					SetBoundActor(ITEM_SEED_START+bmw->memberitem[i],i);
					SetBoundActor(bmw->memberitem[bmw->boundnum],i);
					break;
				}
			}
			bmw->wait = 0;
			bmw->initflag++;
			bmw->boundnum++;
			break;
		case BLEND_TANE_BOUND_WAIT:
			if(++bmw->wait>60){
				if(bmw->boundnum>=bmw->member_num){
					bmw->kakudo = start_point[start_tbl[bmw->member_num-2]]-ROTATE_DEMO_SPEED*ROTATE_DEMO_VSPEED;
					bmw->initflag++;
//					SetSioSynchronize();
				}else{
					bmw->initflag--;
				}
				bmw->wait = 0;
			}
			break;
		case BLEND_TOP_CHECK:
			bmw->initflag++;
			PositionTableMake();
			SePlay(SE_RU_HYUU);
			BlendBGAffineSet(&bmw->Rotate);				//回転計算
			break;
		case BLEND_SET_DISK:							//回転しながらホイール登場
			*(vu16 *)REG_DISPCNT |= DISP_BG2_ON;			// BG2有効
			bmw->kakudo+=ROTATE_DEMO_VSPEED;
			bmw->Ratio+=ROTATE_DEMO_STEP;
			if(bmw->Ratio>=ROTATE_FIRST_RATIO){
				bmw->initflag++;
				bmw->Ratio=ROTATE_FIRST_RATIO;
			 	bmw->kakudo = start_point[start_tbl[bmw->member_num-2]];
				//回転面設定
				*(vu16 *)REG_BG2CNT = BG_COLOR_256			// 256色選択
						| BG_SCREEN_SIZE_1				// スクリーンサイズ
						| BG_PRIORITY_2					// BG優先順位
						| ROTATE_MAP << BG_SCREEN_BASE_SHIFT		// スクリーンベースブロック
						| ROTATE_CHARA << BG_CHAR_BASE_SHIFT 		// キャラクタベースブロック
						| BG_LOOP_OFF
						;
				bmw->wait = 0;
				SePlay(SE_TRACK_DOOR);
				BlendMachineNamePrint();
			}
			BlendBGAffineSet(&bmw->Rotate);				//回転計算
			break;
		case BLEND_VIBRATION:
			if(BlendMachineVibration()){
				bmw->initflag++;
			}
			BlendBGAffineSet(&bmw->Rotate);				//回転計算
			break;
		case BLEND_COUNTDOWN_START:			//カウントダウンスタート
				AddActor(&ActCountHeader,120,-16,3);
				bmw->initflag++;
			break;

		case BLEND_COUNTDOWN:				//ActCountMove内でプラスしてもらう
			
			break;
		case BLEND_START:
			bmw->initflag++;
			break;
		case BLEND_ITEM_RECV:
				bmw->initflag++;
			break;
		case BLEND_TEXT_INIT:

//			FontScrnAreaClear(&bmw->tw, 0, 0, 30, 20);
			bmw->initflag++;
			break;
		case BLEND_GAMEN_INIT:

			OfflineSendRecvBufInit();
			bmw->v_kakudo=V_KAKUDO_MIN;
			bmw->timer = 0;
			bmw->NPC_flag = 0;
			bmw->down_count = 0;
		

			MainProcChange(BlendMachineMain);					//一人用の場合はNPCを置く
			for(i=0;i<ScriptParameter0;i++)
				bmw->NPC_taskno[i] = AddTask(NPC_functable[i],10+i);	//NPCのﾀｸｽ登録
			if(BGM_GetNowNo()!=MUS_CYCLING)
				bmw->nowsong = BGM_GetNowNo();
			MusicPlay(MUS_CYCLING);			//BGM
			SePlay(SE_MOTER);				//モーター音
			motor_pitch();					//ピッチ制御
			break;
	}

	MainTask();
	JumpActor();
	SetActor();
	PaletteAnime();
	
}

// =================================================================
// OfflineSendRecvBufInit
// 概要  : 受信バッファのクリア（一人用の時のみ）
// 引数  : none
// 戻り値: none
// =================================================================
static void OfflineSendRecvBufInit()
{
	int i;
	for(i=0;i<4;i++){						//判定コマンドの初期化
		SendBuf[0] = 0;
		SendBuf[2] = 0;
		RecvBuf[0][i] = 0;
		RecvBuf[2][i] = 0;
	}
}

// =================================================================
// CommandBooTask
// 概要  : 数シンク送れてから「BOO」コマンドを発行する
// 引数  : no
// 戻り値: none
// =================================================================
static void CommandBooTask(u8 no)
{
	if(++TaskTable[no].work[0]>TaskTable[no].work[1]){
		RecvBuf[2][TaskTable[no].work[2]] = COMMAND_BOO;
		DelTask(no);
	}
}

// =================================================================
// CommandBooSend
// 概要  : 
// 引数  : id
//       : late
// 戻り値: none
// =================================================================
static void CommandBooSend(u8 id, u8 late)
{
	u8 no;
	no = AddTask(CommandBooTask,80);
	TaskTable[no].work[1] = late;
	TaskTable[no].work[2] = id;
}

// =================================================================
// NPC_hantei0
// 概要  : ノンプレイヤーキャラクターの判定タスク（おじさん）
// 引数  : none
// 戻り値: none
// =================================================================
static void NPC_hantei0(u8 no)
{
	u8 result,r;

		result=hit_check(bmw->kakudo,1);
		if(result==2){
			if(TaskTable[no].work[0]==0){
				if(bmw->NPC_flag==0){					//デバッグ処理いり
					r = pp_rand()/(RAND_MAX/100);
					if(bmw->v_kakudo < V_KAKUDO_MAX/3){			//序盤は必ず○
						if(r>75){
							RecvBuf[2][1] = COMMAND_JUST;
						}else if(r<=75){
							RecvBuf[2][1] = COMMAND_OK;
						}
						RecvBuf[2][1] = COMMAND_OK;
					}else if(bmw->v_kakudo<V_KAKUDO_MAX){		//限界速度まで
						if(r>80){
							RecvBuf[2][1] = COMMAND_JUST;
						}else if(r<=80 && r>20){
							RecvBuf[2][1] = COMMAND_OK;
						}else if(r<10){
							CommandBooSend(1, 5);
						}
					}else if(bmw->v_kakudo>=V_KAKUDO_MAX){		//限界速度以上
						if(r>90){
							RecvBuf[2][1] = COMMAND_JUST;
						}else if(r<=90&&r>70){
							RecvBuf[2][1] = COMMAND_OK;
						}else if(r<30){
							CommandBooSend(1, 5);
						}
					}
				}else{
					RecvBuf[2][1] = COMMAND_JUST;					//デバッグフラグが立つと毎回JUST
				}
				TaskTable[no].work[0] = 1;
			}
		}else{
			TaskTable[no].work[0] = 0;
		}
}

// =================================================================
// NPC_hantei1
// 概要  : ２人目のNPCの判定るーちん（おとこのこ）
// 引数  : no
// 戻り値: none
// =================================================================
static void NPC_hantei1(u8 no)
{
	u8 i,w,r;
	u32 hantei_kakudo;

	hantei_kakudo = bmw->kakudo+0x1800;
	hantei_kakudo &= 0xffff;
	w = 2;
	i = bmw->reverse[w];
	if(w!=0xff){

		if(((hantei_kakudo)>>8) > hit_table[i]+20 && 
			((hantei_kakudo)>>8)<hit_table[i]+0x28){	//ばっちり
			if(	TaskTable[no].work[0]==0){
				if(bmw->NPC_flag==0){									//デバッグ用に
					r = pp_rand()/(RAND_MAX/100);
					if(bmw->v_kakudo < V_KAKUDO_MAX/3){
						if(r > 66){
							RecvBuf[2][2] = COMMAND_JUST;
						}else if(r <= 66){
							RecvBuf[2][2] = COMMAND_OK;
						}
					}else if(bmw->v_kakudo>=V_KAKUDO_MAX/3){			//序盤はかならず○
						if(r>65)	
							RecvBuf[2][2] = COMMAND_JUST;
						if(r<=65 && r>40)								
							RecvBuf[2][2] = COMMAND_OK;	
						if(r<10)
							CommandBooSend(2, 5);
					}
					TaskTable[no].work[0] = 1;
				}else{														//フラグが立つと
					RecvBuf[2][2] = COMMAND_JUST;							//毎回ジャストに
					TaskTable[no].work[0] = 1;
				}
			}
		}else{
			TaskTable[no].work[0] = 0;
		}
	}
	
}

// =================================================================
// NPC_hantei2
// 概要  : 3人目のNPCキャラクターの判定ルーチン（おんなのこ）
// 引数  : no
// 戻り値: none
// =================================================================
static void NPC_hantei2(u8 no)
{
	u8 i,w,r;
	u32 hantei_kakudo;

	hantei_kakudo = bmw->kakudo+0x1800;
	hantei_kakudo &= 0xffff;
	w = 3;
	i = bmw->reverse[w];
	if(w!=0xff){

		if(((hantei_kakudo)>>8) > hit_table[i]+20 && 
			((hantei_kakudo)>>8)<hit_table[i]+0x28){	//ばっちり
			if(	TaskTable[no].work[0]==0){
				if(	bmw->NPC_flag==0){							//デバッグ用
					r = pp_rand()/(RAND_MAX/100);
					if(bmw->v_kakudo < V_KAKUDO_MAX/3){
						if(r > 88){
							RecvBuf[2][3] = COMMAND_JUST;
						}else if(r <= 88){
							RecvBuf[2][3] = COMMAND_OK;
						}
					}else if(bmw->v_kakudo>=V_KAKUDO_MAX/3){	//序盤はかならず○
						if(r>60){
							RecvBuf[2][3] = COMMAND_JUST;
						}else if(r<=60 && r>55){
							RecvBuf[2][3] = COMMAND_OK;
						}
						if(r<5)
							CommandBooSend(3, 5);
					}
					TaskTable[no].work[0] = 1;
				}else{														//デバッグフラグが立つと
					RecvBuf[2][3] = COMMAND_JUST;							//毎回ジャスト
					TaskTable[no].work[0] = 1;
				}
			}
		}else{
			TaskTable[no].work[0] = 0;
		}
	}
	
}

// =================================================================
// HanteiActorCall
// 概要  : 判定アクターを表示・ＳＥ発声・火花表示
// 引数  : hantei	判定結果
//       : id		立ち位置
// 戻り値: none
// =================================================================
static void HanteiActorCall(u16 hantei, u8 id)
{
	u8 no;

	no=AddActor(&HanteiHeader,								//判定マークをだす
		arrowpos[id][0]-arrowmove[id][0]*10,arrowpos[id][1]-arrowmove[id][1]*10,1);
	if(hantei==COMMAND_JUST){
		ActAnmChg(&ActWork[no],2);
		ActWork[no].move = HanteiMove2;
		SePlay(SE_RU_GASHIN);
	}else if(hantei==COMMAND_OK){
		ActAnmChg(&ActWork[no],0);
		SePlay(SE_SEIKAI);
	}else if(hantei==COMMAND_BOO){
		ActAnmChg(&ActWork[no],1);
		SePlay(SE_HAZURE);
	}
	hibana_actor_add();
}

static const u8 BlendDivTbl[]={1,1,2,3,4};
// =================================================================
// BlenderSpeedControl
// 概要  : ホイールのスピードを上げ下げする
// 引数  : command
// 戻り値: none
// =================================================================
static void BlenderSpeedControl(u16 command)
{
	motor_pitch();
	switch(command){
		case COMMAND_JUST:
			if(bmw->v_kakudo<V_KAKUDO_MAX){							//限界スピードか？
				bmw->v_kakudo+=PLUS_JUST_V_KAKUDO/BlendDivTbl[bmw->member_num];	//まだ
			}else{												
				bmw->v_kakudo+=PLUS_OVER_MAX/BlendDivTbl[bmw->member_num];		//もう限界か限界越してる
				SpeedUpVibrationSet(&bmw->BgOffsetX,(bmw->v_kakudo/100)-10);	
				SpeedUpVibrationSet(&bmw->BgOffsetY,(bmw->v_kakudo/100)-10);	
			}
			break;
		case COMMAND_OK:
			if(bmw->v_kakudo<V_KAKUDO_MAX)
				bmw->v_kakudo+=PLUS_V_KAKUDO/BlendDivTbl[bmw->member_num];//人数が多いと加速度が下がって加速する
//			if(bmw->end_meter>=ENDMETER_MAX){
//				bmw->end_meter = ENDMETER_MAX;
//			}
			break;
		case COMMAND_BOO:
			bmw->v_kakudo-=MINUS_V_KAKUDO/BlendDivTbl[bmw->member_num];
			if(bmw->v_kakudo<V_KAKUDO_MIN)
				bmw->v_kakudo = V_KAKUDO_MIN;
			break;
	}
}

// ==========================================================================
// HanteiCheck
// 概要  : 判定結果を通信で受け取って処理する
// 引数  : none
// 戻り値: static void
// ==========================================================================
static void HanteiCheck()
{

	int i,w,work;
	
	if(ScriptParameter0)									//一人用の場合もSendBufとRecvBufを利用する
	{
		if(SendBuf[2]!=INVALID_DATA){						//SendBufの内容をRecvBufに移してやる
			RecvBuf[2][0] = SendBuf[2];
			RecvBuf[0][0] = SEND_KEYDATA;
			SendBuf[2]    = INVALID_DATA;
		}
		for(i=1;i<4;i++){
			if(RecvBuf[2][i] != INVALID_DATA)
				RecvBuf[0][i] = SEND_KEYDATA;
		}
	}
	
	
	for(i=0;i<bmw->member_num;i++){
		if(RecvBuf[0][i]==SEND_KEYDATA){
			w = bmw->reverse[i];
			if(RecvBuf[2][i]==COMMAND_JUST){				//ジャスト判定
				BlenderSpeedControl(COMMAND_JUST);
				bmw->end_meter += bmw->v_kakudo/JUST_PLUS_DIV;			//メーターを進める
				if(bmw->end_meter>=ENDMETER_MAX){
					bmw->end_meter = ENDMETER_MAX;
				}
				HanteiActorCall(COMMAND_JUST, w);						//アクター表示
				bmw->hitcount[i][0]++;
			}else if(RecvBuf[2][i]==COMMAND_OK){			//回転成功コマンドが届いた
				BlenderSpeedControl(COMMAND_OK);
				bmw->end_meter += bmw->v_kakudo/PLUS_DIV;
				HanteiActorCall(COMMAND_OK, w);						//アクター表示
				bmw->hitcount[i][1]++;
			}else if (RecvBuf[2][i]==COMMAND_BOO){			//回転失敗コマンドが届いた
				HanteiActorCall(COMMAND_BOO, w);					//アクター表示
				BlenderSpeedControl(COMMAND_BOO);
				if(bmw->hitcount[i][2]<999)		bmw->hitcount[i][2]++;
			}
			if(RecvBuf[2][i]==COMMAND_BOO||RecvBuf[2][i]==COMMAND_JUST||RecvBuf[2][i]==COMMAND_OK){
				if(bmw->v_kakudo>V_KAKUDO_MAX){
					work = (bmw->v_kakudo-(V_KAKUDO_MAX/2))/20+256;
					m4aMPlayTempoControl(&m4a_mplay000, work);	
				}else{
					m4aMPlayTempoControl(&m4a_mplay000, 256);	
				}
			
			}
		}
	}

	
	if(ScriptParameter0){
		for(i=0;i<bmw->member_num;i++){						//判定コマンドの初期化
			RecvBuf[0][i] = 0;
			RecvBuf[2][i] = INVALID_DATA;
		}
	}

}

// =================================================================
// pad_control
// 概要  : タネブレンダーゲーム中のパッド処理
// 引数  : none
// 戻り値: none
// =================================================================
static void pad_control()
{
	u8 result,i,pad;
	pad = 0;
	i   = bmw->reverse[GetSioConnectId()];
	if(bmw->endflag==0){			//終了してなければ
//			if(sys.Trg&A_BUTTON){		//自分の名前の近くでAを押すと回転促進

			if(MyData.key_config == CNT_MD_KATATE){
				if(sys.Trg&A_BUTTON && 
					((sys.RealCont & (A_BUTTON|L_BUTTON))!=(A_BUTTON|L_BUTTON))) pad = 1;
			}else{
				if(sys.Trg&A_BUTTON ) pad = 1;
			}

			if(pad){
				ActAnmChg(&ActWork[bmw->cursoractno[bmw->table[i]]],i+4);		//矢印の色を変える
				result=hit_check(bmw->kakudo,GetSioConnectId());
				if(result==2){
					SendBuf[2] = COMMAND_JUST;				//超ばっちり！
				}else if(result==1){
					SendBuf[2] = COMMAND_OK;				//成功
				}else{
					SendBuf[2] = COMMAND_BOO;				//ダメ
				}
			}
//		if(sys.Trg&START_BUTTON){
//			bmw->endflag++;
//			MainProcChange(BlendMachineEnd);
//		}
	}
	if(++bmw->down_count>5){						//5syncにつきすこしスピードを下げる
		if(bmw->v_kakudo>V_KAKUDO_MIN)
			bmw->v_kakudo--;
		bmw->down_count=0;
	}


#ifdef DEBUG_NPC_CHANGE
	if(DebugMainFlag){
		if(sys.Trg&L_BUTTON) bmw->NPC_flag^=1;
	}
#endif		

}


//------------------------------------------------------------------
//  タネブレンダーメイン
//------------------------------------------------------------------
void BlendMachineMain()
{
	rotate_func();									//回転面処理

	if(bmw->timer < BLEND_TIME_MAX)
		bmw->timer++;								//ﾀｲﾑｶｳﾝﾄ

	pad_control();									//ﾊﾟｯﾄﾞ処理
	
	kanshi_num_set(bmw->v_kakudo, bmw->end_meter);	//ﾃﾞﾊﾞｯｸﾞ用
	HanteiCheck();									//通信で他人の判定結果を受信
	MeterFunc(bmw->end_meter,ENDMETER_MAX);			//メーター処理
	SpeedMeterFunc(bmw->v_kakudo);					//ｽﾋﾟｰﾄﾞﾒｰﾀｰ処理
	SpeedUpVibration();								//振動計算
	SioFunc();										//通信用処理

	if(bmw->endflag==0){						//終了判定
		if(bmw->now_meter>=ENDMETER_MAX){
			bmw->end_meter=ENDMETER_MAX;
			bmw->endflag=1;
			MainProcChange(BlendMachineEnd);
		}
	}


	MainTask();
	JumpActor();
	SetActor();
	PaletteAnime();
}



// =================================================================
// NazonomiHantei
// 概要  : ナゾのみのパラメータを比較して同じかどうかを判定する
// 引数  : mix	:きのみパラメータの配列
//       : k1	:1個目の場所
//       : k2	:2個目の場所
// 戻り値: static u8	0:違う	1:同じ(=くろいポロック)
// =================================================================
static u8 NazonomiHantei(KINOMIWORK	*mix , u8 k1, u8 k2)
{
	if(mix[k1].no != mix[k2].no) return 1;		//ここまで来てアイテム番号が違うのはありえないけど念のため
	
	if(PM_strcmp(mix[k1].name, mix[k2].name)!=0) return 0;
	if(mix[k1].para[0]==mix[k2].para[0]
	     &&mix[k1].para[1]==mix[k2].para[1]
	     &&mix[k1].para[2]==mix[k2].para[2]
	     &&mix[k1].para[3]==mix[k2].para[3]
	     &&mix[k1].para[4]==mix[k2].para[4]
	     &&mix[k1].para[5]==mix[k2].para[5])
	{
		return 1;
	}
	return 0;
}

#define CUBE_PARAM_MAX	(255)				//ポロックの一つのパラメータの最高値
enum{
	DUMMY_CUBE=0,// 00:ダミー
	AKAI_CUBE,// 01:あかいキューブ
	AOI_CUBE,// 02:あおいキューブ
	MOMOIRO_CUBE,// 03:ももいろキューブ
	MIDORI_CUBE,// 04:みどりのキューブ
	KIIRO_CUBE,// 05:きいろのキューブ
	MURASAKI_CUBE,// 06:むらさきキューブ
	KONIRO_CUBE,// 07:こんいろキューブ
	CHAIRO_CUBE,// 08:ちゃいろキューブ
	SORAIRO_CUBE,// 09:そらいろキューブ
	KIMIDORI_CUBE,// 10:きみどりキューブ
	HAIIRO_CUBE,// 11:はいいろキューブ
	KURO_CUBE,// 12:くろいキューブ
	SIRO_CUBE,// 13:しろいキューブ
	KINIRO_CUBE,// 14:きんいろキューブ

	
};


static s16 param[6],work[6], minusline, plusline;
// =========================================================================
// CalcCubeType
// 概要  : タネブレンダーに使われたたねの種類によってキューブの種類を決定
// 引数  : mix			きのみの番号の格納された配列
//       : table		パラメータの格納された配列
//       : num			きのみブレンダーに参加した人数
//		 : minus		マイナスカウント
// 戻り値: static int
// =========================================================================
static int CalcCubeType(KINOMIWORK	*mix, s16 *table,u8 num, u8 minuscount)
{
	int i,w;
	u8 plus;
	s16 param[6];

	for(i=0;i<6;i++)
		param[i] = table[i];


	//くろいキューブチェック						//全部パラメータが0
	w = 0;
	for(i=0;i<5;i++){
		if(param[i]==0) w++;
	}
	if(w==5) return KURO_CUBE;
	if(minuscount>=4) return KURO_CUBE;				//マイナスパラが4箇所
	
	for(i=0;i<num;i++){								
		for(w=0;w<num;w++){
			if(mix[i].no==mix[w].no && i!=w){	//同じたねがはいってたら
				if(mix[i].no==ITEM_NAZONOMI){			//ナゾの実の場合は別処理
					if(NazonomiHantei(mix,i,w)){
						return KURO_CUBE;			//ナゾの実のパラメータも同じ
					}else{
						continue;					//ナゾの実の中身は違った
					}
				}else{
					return KURO_CUBE;				//くろいキューブ
				}
			}
		}
	}
//	if(KuroiCubeCheck(mix,num)) return KURO_CUBE;	//くろいキューブチェック(おなじﾊﾟﾗﾒｰﾀﾁｪｯｸ)

	
	plus  = 0;									//はいいろキューブ・しろいキューブチェック
	for(i=0;i<5;i++){
		if(param[i]>0) plus++;					//プラスに行った種類をカウント
	}
	if(plus>=4) return SIRO_CUBE;				//プラスが４種類あったらしろいキューブ(以上にしてるのは念のため)
	if(plus==3) return HAIIRO_CUBE;				//プラスが３種類あったら灰色キューブ

	//きんいろキューブチェック
	for(i=0;i<5;i++){								//パラメータのどれかが５０を越えていたら
		if(param[i]>50) return KINIRO_CUBE;
	}


	//プラス値が一種類の場合の判定
	if(plus==1){
		if(param[0]>0) return AKAI_CUBE;		//辛がプラスなら　あかいキューブ
		if(param[1]>0) return AOI_CUBE;			//渋がプラスなら　あおいキューブ
		if(param[2]>0) return MOMOIRO_CUBE;		//甘がプラスなら　ももいろキューブ
		if(param[3]>0) return MIDORI_CUBE;		//苦がプラスなら　みどりキューブ
		if(param[4]>0) return KIIRO_CUBE;		//酸がプラスなら　きいろキューブ
	}
	
	//プラス値が二種類の場合の判定
	if(plus==2){
		w = 0;
		for(i=0;i<5;i++){			//プラスの二つのを取り出してみる
			if(param[i]>0){
				work[w] = i;
				w++;
			}
		}
		if(param[work[0]]>=param[work[1]]){			//前者のパラメータの方が大きい＆一緒
			if(work[0]==0) return (MURASAKI_CUBE|(work[1]<<16));	//むらさき
			if(work[0]==1) return (KONIRO_CUBE|(work[1]<<16));		//こんいろ
			if(work[0]==2) return (CHAIRO_CUBE|(work[1]<<16));		//ちゃいろ
			if(work[0]==3) return (SORAIRO_CUBE|(work[1]<<16));		//そらいろ
			if(work[0]==4) return (KIMIDORI_CUBE|(work[1]<<16));	//きみどり
		}else{										//後者のパラメータの方が大きい
			if(work[1]==0) return (MURASAKI_CUBE|(work[0]<<16));	//むらさき
			if(work[1]==1) return (KONIRO_CUBE|(work[0]<<16));		//こんいろ
			if(work[1]==2) return (CHAIRO_CUBE|(work[0]<<16));		//ちゃいろ
			if(work[1]==3) return (SORAIRO_CUBE|(work[0]<<16));		//そらいろ
			if(work[1]==4) return (KIMIDORI_CUBE|(work[0]<<16));	//きみどり
		}
	}
	return DUMMY_CUBE;												//ここにはこないハズ
}

void SetMinusLine(s16 num){
	minusline = num;
}

s16 GetMinusLine()
{
	return minusline;
}
void SetPlusLine(s16 num){
	plusline = num;
}

s16 GetPlusLine()
{
	return plusline;
}

#define FIVE_TO_THREE		(10)		//５つの中から３つ選ぶ場合の数
static const u8 five2three[]={
				//  これらのビットデータを1バイトで表現
	0x1c,0x16,0x13,0x1a,0x19,		//	11100	10110	10011	11010	11001
	0x0e,0x0d,0x0b,0x07,0x15,		//	01110	01101	01011	00111	10101
};


static s32 paramtest[5];
static s32 paramtest2[5];
static s32 paramwork;
// ================================================================================
// Seed2Cube
// 概要  : たねとタネブレンダーの結果からキューブを算出
// 引数  : mix			タネ番号の入った配列
//       : newcube		キューブデータを格納するﾎﾟｲﾝﾀ
//       : num			きのみブレンダーをﾌﾟﾚｲした人数
//       : calc			パラメータの結果を格納して返す配列のポインタ
// 戻り値: none
// ================================================================================
static void Seed2Cube(KINOMIWORK *mix, CUBE *newcube, u8 num, u8 *calc, u16 bpm)
{
	int i,type,w;
	s32 work,mod;
	s32 calcwork;
	u8  minuscount;
	
	for(i=0;i<6;i++) param[i] = 0;					//パラメータ初期化

	for(i=0;i<num;i++){								//パラメータ合計
		for(w=0;w<6;w++)
			param[w] += mix[i].para[w];

	}
	
	
										//減算処理
	work = param[0];					//			辛保存
	param[0] -= param[1];				//辛 - 渋
	param[1] -= param[2];				//渋 - 甘
	param[2] -= param[3];				//甘 - 苦
	param[3] -= param[4];				//苦 - 酸
	param[4] -= work;					//酸 - 辛

	work = 0;							//マイナス値になったパラメータを数える
	for(i=0;i<5;i++){
		if(param[i]<0){
			param[i] = 0;					//マイナス値は0に
			work++;
		}
	}
	minuscount = work;
										//プラスの値をマイナスカウント分引く(マイナスに転じたら0に)
	for(i=0;i<5;i++){
		if(param[i]>0){					//パラメータがプラス
			if(param[i]<work){				//マイナスカウントよりもプラス値が小さい
				param[i] = 0;					//0に
			}else{							//マイナスカウントよりもプラス値が大きい
				param[i] -=work;				//マイナスカウント分引く
			}
		}
	}
	
	for(i=0;i<5;i++) paramtest[i] = param[i];
	
//	work = 100+bpm/1000;				//20002/08/28　修正		1割から3.33割へ
	work = 100+bpm/333;
	paramwork = work;
	for(i=0;i<5;i++){					//最高BPMから掛け率を算出しパラメータにかけ合わせる
		calcwork = param[i];
		calcwork = (calcwork*work)/10;	//四捨五入用に100で割らない
		mod = calcwork%10;				//四捨五入する
		calcwork /=10;
		if(mod>=5)	calcwork++;
		param[i] = calcwork;
	}
	for(i=0;i<5;i++) paramtest2[i] = param[i];

	
	type = CalcCubeType(mix, param,num,minuscount);		//たねからキューブの種類を決定
	newcube->type = type&0xff;

	param[5] /=num;										//旨味パラメータは参加人数の平均を取る
	param[5] -=num;										//その後、参加人数で引く
	if(param[5]<0) param[5] = 0;
	
	
	if(newcube->type==KURO_CUBE){						//くろいキューブの時は
		work = pp_rand()%FIVE_TO_THREE;					//５つの中から３つ選んで値を２にする
		for(i=0;i<5;i++){
			if((five2three[work]>>i)&1) param[i] = 2;
			else						param[i] = 0;
		}
	}
	
	for(i=0;i<6;i++){									//パラメータMAXを超えている場合はMAXで止める
		if(param[i] > CUBE_PARAM_MAX) 
			param[i] = CUBE_PARAM_MAX;
	}
	
	newcube->karai  = param[0];							//キューブにパラメータを格納
	newcube->sibui  = param[1];
	newcube->amai   = param[2];
	newcube->nigai  = param[3];
	newcube->suppai = param[4];
	newcube->umai   = param[5];

	for(i=0;i<6;i++)
		calc[i] = param[i];

}

//------------------------------------------------------------------
//  たねｔｏキューブを外部からも呼べるように
//------------------------------------------------------------------
void FuncSeed2Cube(KINOMIWORK *mix, CUBE *newcube, u8 num, u8 *calc, u16 bpm)
{
	Seed2Cube(mix, newcube,num,calc,bpm);
}


static void SetBorderLine()
{
	u16 time,vmax;
	s16 ret;
	time = bmw->timer;
	vmax = bmw->bpm_max;

	ret = 0;
	if(time<15*60)						ret = 5;
	else if(time>=15*60&&time<25*60)	ret = 4;
	else if(time>=25*60&&time<35*60)	ret = 3;
	else if(time>=35*60&&time<50*60)	ret = 2;
	else if(time>=55*60&&time<60*60)	ret = 1;
	else if(time>=60*60)				ret = 0;
	SetPlusLine(ret);			//しろいキューブボーダーライン設定


	ret = 0;
	if(vmax>64)						ret = 0;
	else if(vmax>= 50 &&  vmax< 100)	ret = -1;
	else if(vmax>= 100 &&  vmax<150)	ret = -2;
	else if(vmax>= 150 &&  vmax< 200)	ret = -3;
	else if(vmax>= 200 &&  vmax< 250)	ret = -4;
	else if(vmax>= 250 &&  vmax< 300)	ret = -5;
	else if(vmax>= 350 &&  vmax< 400)	ret = -6;
	else if(vmax>= 400 &&  vmax< 450)	ret = -7;
	else if(vmax>= 500 &&  vmax< 550)	ret = -8;
	else if(vmax>= 550 &&  vmax< 600)	ret = -9;
	else if(vmax>= 600)		ret = -10;
	SetMinusLine(ret);			//くろいキューブボーダーｰライン設定
	
}

// =================================================================
// BlendYesNoWrite
// 概要  : はい・いいえ選択表示
// 引数  : none
// 戻り値: none
// =================================================================
static void BlendYesNoWrite()
{
	bmw->cursor = 0;
	NMenuWinBoxWrite(23,8,28,13);
	BlendMsgPrint( yesno,YESNO_CHR_START_NO,23+2,8+1);									//「はい　いいえ」
	BlendMsgPrint( yajirushi,CURSOR_CHR_START_NO,23+1,bmw->cursor*2+8+1);
}

// =================================================================
// BlendYesNoCursorMove
// 概要  : はい・いいえ質問でのｶｰｿﾙ移動
// 引数  : no
// 戻り値: none
// =================================================================
static void BlendYesNoCursorMove(u8 no)
{
	bmw->cursor=no;
	BlendMsgPrint( yajirushi,CURSOR_CHR_START_NO,23+1,bmw->cursor*2+8+1);
	BlendMsgPrint( blank,BLANK_CHR_START_NO,23+1,((bmw->cursor)^1)*2+8+1);
	
}

enum{
	BLEND_END_INIT=1,
	BLEND_WHEEL_STOP,

	BLEND_END_KEKKA_TUUSHIN,			//通信時のみ
	BLEND_END_KEKKA_TUUSHIN_WAIT,		//通信時のみ

	BLEND_END_KEKKA,
	BLEND_END_KEKKA2,
	BLEND_END_KEKKA_WAIT,
	BLEND_END_RETRY,
	BLEND_END_SELECT,
	BLEND_END_DECIDE,
	BLEND_END_CHECK,
	BLEND_END_SIO_WAIT,
	BLEND_ENS_MSG_WAIT,
};

static const u8 rpmmaxmsg[]={sa_,ko_,u_,so_,ku_,EOM_};
//------------------------------------------------------------------
//  通信を行ってデモの終了のタイミングを図る
//------------------------------------------------------------------
void BlendMachineEnd()
{
	u8 Id,i;
	BLEND_RESULT *p;
	
	rotate_func();

	Id=GetSioConnectId();

	switch(bmw->endflag){
		case BLEND_END_INIT:							//回転終了待ち
			BlendMachineFunctionClear();				//キー情報送信終了
			m4aMPlayTempoControl(&m4a_mplay000, 256);	
			for(i=0;i<ScriptParameter0;i++)				//NPCのﾀｽｸを終了
				DelTask(bmw->NPC_taskno[i]);
			bmw->endflag++;
			break;
		case BLEND_WHEEL_STOP:
			bmw->v_kakudo-=0x20;
			if(bmw->v_kakudo<=0){			//回転ストップ
				bmw->v_kakudo = 0;
				if(pokemon_sio_flag){		//通信している時はデータ受け取り処理へ
					bmw->endflag++;
				}else{
					bmw->endflag = BLEND_END_KEKKA;
				}
				bmw->initflag = 0;
//				m4aMPlayVolumeControl(&m4a_mplay002,0xffff,bmw->wait);
//				m4aSongNumStop(SE_MOTER);
				m4aMPlayStop(&m4a_mplay002);
			}
			motor_pitch();
			break;
		case BLEND_END_KEKKA_TUUSHIN:
			if(GetSioConnectId()==0){
				if(SplitDataSendStatus()){
					bmw->BlendResult.timer   = bmw->timer;
					bmw->BlendResult.bpm_max = bmw->bpm_max;
					SplitDataSendStart(0, (u8*)&(bmw->BlendResult),40);
					bmw->endflag++;
				}
			}else{
				bmw->endflag++;
			}
			break;
		case BLEND_END_KEKKA_TUUSHIN_WAIT:
			if(SplitDataResult()){
				p = (BLEND_RESULT*)&RecvPoolBuf[0][0];
				bmw->bpm_max = p->bpm_max;
				bmw->timer   = p->timer;
				bmw->endflag++;
				SplitDataResultReset();
			}
			break;
		case BLEND_END_KEKKA:
			if(BlendMachineResultPut2()){			//結果表示画面２
//				m4aMPlayStop(&m4a_mplay002);
				bmw->endflag++;
			}
			break;
		case BLEND_END_KEKKA2:						//結果表示画面
			if(BlendMachineResultPut()){
				if(BlendMachineType == PLAYER_SIO){
					IncRecord(CNT_COMM_CUBE_MAKE);		//通信でポロックを作った回数をインクリメント
				}else{
					IncRecord(CNT_MAKE_CUBE);			//ポロックを作った回数をインクリメント
				}
				bmw->endflag++;
			}

			break;
		case BLEND_END_KEKKA_WAIT:
			bmw->endflag++;
			BlendTalkMsgSet( retry_msg,WINMSG_CHR_START_NO,2,15);			//「もういちどやりますか？」
			break;
		case BLEND_END_RETRY:
			if(BlendTalkMsgPut()){
				bmw->endflag++;
			}
			break;
		case BLEND_END_SELECT:															//「もういちど　やりますか？」
			bmw->cursor=0;
			BlendYesNoWrite();
			bmw->endflag++;															
			break;
		case BLEND_END_DECIDE:
			if(sys.Trg&U_KEY){
				if(bmw->cursor!=0) SePlay(SE_SELECT);
				BlendYesNoCursorMove(0);
			}else if(sys.Trg&D_KEY){
				if(bmw->cursor!=1) SePlay(SE_SELECT);
				BlendYesNoCursorMove(1);
			}else if(sys.Trg&A_BUTTON) {
					SePlay(SE_SELECT);
					bmw->endflag++;
//					MainProcChange(BlendMachineTitleInit);
			}else if(sys.Trg&B_BUTTON){
					SePlay(SE_SELECT);
					bmw->endflag++;
					BlendYesNoCursorMove(1);
			}
			break;
		case BLEND_END_CHECK:
			SendBuf[0] = USER_COMMAND;
			if(bmw->cursor==0){									//はい
				if(PocketCheck(SEED_POCKET)==0){					//残りのタネの確認
					bmw->selectwork = 2;
					SendBuf[1] = SELECT_YES_BUT_NOKINOMI;
				}else if(CheckCube()==-1){								//キューブケースの中を確認
					bmw->selectwork = 3;				//キューブいっぱい
					SendBuf[1] = SELECT_YES_BUT_FULLCUBE;
				}else{
					bmw->selectwork = 0;
					SendBuf[1] = SELECT_YES;
//					MainProcChange(BlendMachineTitleInit);
				}
				bmw->endflag++;
			}else{												//いいえ
				bmw->selectwork = 1;
				SendBuf[1] = SELECT_NO;
				bmw->endflag++;
			}
			break;
		case BLEND_END_SIO_WAIT:
			if(BlendMachineType!=0){
				MainProcChange(BlendMachineEnd_Offline);
				bmw->endflag=0;
				bmw->initflag = 0;
			}else{
				BlendTalkMsgSet( taiki_msg,WINMSG_CHR_START_NO,2,15);			//つうしんたいきちゅうです
				bmw->endflag++;
			}
			break;
		case 	BLEND_ENS_MSG_WAIT:
			if(BlendTalkMsgPut()){
				MainProcChange(BlendMachineEnd_Sio);
				bmw->endflag=0;
				bmw->initflag = 0;
			}
			break;

	}
	SpeedUpVibration();								//振動計算
	SpeedMeterFunc(bmw->v_kakudo);					//ｽﾋﾟｰﾄﾞﾒｰﾀｰ処理

	SioFunc();

	MainTask();
	JumpActor();
	SetActor();
	PaletteAnime();
}

enum{
	BLEND_END_SWITCH=0,
	BLEND_FULLCUBE_MSG,
	BLEND_NOSEED_MSG,
	BLEND_NOSEED_WAIT,
	BLEND_MSG_END,
	BLEND_END_FADEOUT_BEFORE,
	BLEND_END_SAVE_START,
	BLEND_END_SAVE,
	BLEND_END_SAVE_WAIT,
	BLEND_END_FADEOUT,
	BLEND_END_FADEWAIT,
	BLEND_END_SIO_END_BEFORE,
	BLEND_END_SIO_END,
};

static const u8 tuusin_msg[]={
	PO_,KE_,MO_,N_,RE_,PO_,bou_,TO_,ni_,spc_,ka_,ki_,ko_,n_,de_,i_,ma_,su_,spc_,spc_,spc_,spc_,CR_,
	de_,n_,ge_,n_,wo_,spc_,ki_,ra_,na_,i_,de_,spc_,ku_,da_,sa_,i_,spc_,spc_,spc_,spc_,spc_,spc_,EOM_,
};


// =================================================================
// KoukanDemoSaveSeq
// 概要  : 通信ポーズ機能を待ちセーブを行い復帰する処理
// 引数  : none
// 戻り値: u8		0は途中	1で終了
// =================================================================
u8 BlendEndSave()
{

		switch(bmw->saveseq){
			case 0:
					SetSioSynchronize();				//通信同期
					bmw->saveseq = 1;
					bmw->wait = 0;
				break;
			case 1:
				if(SplitDataSendStatus()){				//同期待ち
					bmw->saveseq++;
					SoftResetDisable = 1;				//ソフトリセット処理を無効に
				}
				break;
			case 2:
				PokeAGBSaveFieldDivInit();				//ALLセーブ分割版
				bmw->saveseq++;
				bmw->wait = 0;
				break;
			case 3:										//セーブの間隔取り
				bmw->wait++;
				if(bmw->wait==10){
					SetSioSynchronize();				//通信同期
					bmw->saveseq++;
				}
				break;
			case 4:
				if(SplitDataSendStatus()){				//同期待ち
					if(PokeAGBSaveFieldDiv()){				//１セクタセーブ
						bmw->saveseq = 5;					//ｾｰﾌﾞ終了してたら5へ
					}else{
						bmw->wait = 0;			
						bmw->saveseq = 3;					//終了してなかったら3へﾓﾄﾞﾙ
					}
				}
				break;
			case 5:
					bmw->saveseq++;
					bmw->wait = 0;
				break;
			case 6:										//待ち
				if(++bmw->wait>5){
					SoftResetDisable = 0;					//ソフトリセット処理を有効に
					return 1;
				}
				break;
		}
	return 0;
}

// =================================================================
// BlendMachineEnd_Sio
// 概要  : 通信時の終了関数
// 引数  : none
// 戻り値: none
// =================================================================
void BlendMachineEnd_Sio()
{
	switch(bmw->endflag){
		case BLEND_END_SWITCH:
			if(bmw->siowork[0]==BLEND_CONTINUE){
				bmw->endflag = BLEND_END_FADEOUT_BEFORE;
			}else if(bmw->siowork[0]==BLEND_END){
				if(bmw->sio_reason[0]==SELECT_YES_BUT_NOKINOMI){
					bmw->endflag = BLEND_NOSEED_MSG;
				}else if(bmw->sio_reason[0]==SELECT_YES_BUT_FULLCUBE){
					bmw->endflag = BLEND_FULLCUBE_MSG;
				}else{
					bmw->endflag = BLEND_END_FADEOUT_BEFORE;
				}
			}
//			if(bmw->selectwork==3){
//				bmw->endflag = BLEND_NOSEED_MSG;
//			}
			
			break;
		case BLEND_FULLCUBE_MSG:
			bmw->endflag=BLEND_NOSEED_WAIT;
			NMenuBoxClear(23,8,28,13);
			PM_strcpy(MsgExpandBuffer, SioTrainerInfo[bmw->sio_reason[1]].name);
			PM_strcat(MsgExpandBuffer,sio_fullcube_msg);
			BlendTalkMsgSet( MsgExpandBuffer,WINMSG_CHR_START_NO,2,15);			//キューブケースがいっぱいです
			break;
		case BLEND_NOSEED_MSG:
			bmw->endflag++;
			NMenuBoxClear(23,8,28,13);
			PM_strcpy(MsgExpandBuffer, SioTrainerInfo[bmw->sio_reason[1]].name);
			PM_strcat(MsgExpandBuffer,sio_noseed_msg);
			BlendTalkMsgSet( MsgExpandBuffer,WINMSG_CHR_START_NO,2,15);			//もうきのみがありません
			break;
		case BLEND_NOSEED_WAIT:
			if(BlendTalkMsgPut()){
				bmw->wait = 0;
				bmw->endflag++;
			}
			break;
		case BLEND_MSG_END:
			if(++bmw->wait > 60){
				bmw->endflag = BLEND_END_FADEOUT_BEFORE;
			}
			break;
		case BLEND_END_FADEOUT_BEFORE:
//			PaletteFadeReq(0xffffffff,0,0,16,0);			//フェードイン
//			NMenuBoxClear(23,8,28,13);
			BlendMsgPrint( tuusin_msg,WINMSG_CHR_START_NO+2,2,15);
			SetSioSynchronize();
			bmw->endflag++;
			break;
		case BLEND_END_SAVE_START:
			if(SplitDataSendStatus()){
//				PokeAGBSave( POKEAGB_SVFLD );			//セーブ
//				bmw->endflag++;
				bmw->wait = 0;
				bmw->endflag++;
				bmw->saveseq = 0;
			}
			break;
		case BLEND_END_SAVE:
			if(BlendEndSave()){
				SePlay( SE_SAVE );
				bmw->endflag++;
			}
			break;
		case BLEND_END_SAVE_WAIT:
			bmw->endflag++;
			SetSioSynchronize();
			break;
		case BLEND_END_FADEOUT:
			if(SplitDataSendStatus()){
				PaletteFadeReq(0xffffffff,0,0,16,0);			//フェードイン
				bmw->endflag++;
			}
			break;
		case BLEND_END_FADEWAIT:
			if( FadeData.fade_sw == 0 ){							
				if(bmw->siowork[0]==BLEND_CONTINUE){					//再起動かフィールド復帰か
					MainProcChange(BlendMachineTitleInit);
				}else{
					bmw->wait = 0;
					bmw->endflag++;
				}
			}
			break;
		case BLEND_END_SIO_END_BEFORE:									//FIFO解消のため待機
			if(++bmw->wait>30){
				SetSioEndDataStart();
				bmw->endflag++;
			}
			break;
		case BLEND_END_SIO_END:											//フィールドへ復帰
			if(pokemon_sio_flag==0){
				MainProcChange(FieldScriptRecover);
			}
			break;
	}
	SioFunc();

	MainTask();
	JumpActor();
	SetActor();
	PaletteAnime();
}

// =================================================================
// BlendMachineEnd_Offline
// 概要  : 一人用の時の終了関数
// 引数  : none
// 戻り値: none
// =================================================================
void BlendMachineEnd_Offline()
{
	switch(bmw->endflag){
		case BLEND_END_SWITCH:
			if(bmw->selectwork==0||bmw->selectwork==1){
				bmw->endflag = BLEND_END_FADEOUT;
			}
			if(bmw->selectwork==2){
				bmw->endflag = BLEND_NOSEED_MSG;
			}
			if(bmw->selectwork==3){
				bmw->endflag = BLEND_FULLCUBE_MSG ;
			}
			break;
		case BLEND_FULLCUBE_MSG:
			bmw->endflag=BLEND_NOSEED_WAIT;
			NMenuBoxClear(23,8,28,13);
			BlendTalkMsgSet( fullcube_msg,WINMSG_CHR_START_NO,2,15);			//キューブケースがいっぱいです
			break;
		case BLEND_NOSEED_MSG:
			bmw->endflag++;
			NMenuBoxClear(23,8,28,13);
			BlendTalkMsgSet( noseed_msg,WINMSG_CHR_START_NO,2,15);			//もうきのみがありません
			break;
		case BLEND_NOSEED_WAIT:
			if(BlendTalkMsgPut()){
				bmw->endflag=BLEND_END_FADEOUT;
			}
			break;
		case BLEND_END_FADEOUT:
			LightFadeReq(N_to_B);										//フェードアウト
//			m4aMPlayAllContinue();
			bmw->endflag++;
			break;
		case BLEND_END_FADEWAIT:
			if( FadeData.fade_sw == 0 ){								//通信終了処理
				if(bmw->selectwork==0){
					MainProcChange(BlendMachineTitleInit);
				}else{
//					MusicPlay(bmw->nowsong);
					MainProcChange(FieldScriptRecover);
				}

			}
			break;
	}
	SioFunc();

	MainTask();
	JumpActor();
	SetActor();
	PaletteAnime();

}
//------------------------------------------------------------------
//  通信処理
//------------------------------------------------------------------
static void SioFunc()
{
	u8 i;

//	if(!ScriptParameter0)	return;
	if(!pokemon_sio_flag)	return;

	if(RecvBuf[0][0]==USER_COMMAND){		//親から命令が届く
		if(RecvBuf[1][0]==BLEND_END){			//終了
			switch(RecvBuf[2][0]){
				case SELECT_NO:					//NOを選択した人がいた
					bmw->sio_reason[0] = SELECT_NO;
					bmw->sio_reason[1] = RecvBuf[3][0];
					break;
					
				case SELECT_YES_BUT_NOKINOMI:			//だれかがもうきのみがない
					bmw->sio_reason[0] = SELECT_YES_BUT_NOKINOMI;
					bmw->sio_reason[1] = RecvBuf[3][0];
					break;
					
				case SELECT_YES_BUT_FULLCUBE:			//だれかがキューブケースがいっぱい
					bmw->sio_reason[0] = SELECT_YES_BUT_FULLCUBE;
					bmw->sio_reason[1] = RecvBuf[3][0];
					break;
			}
			bmw->siowork[0] = BLEND_END;
		}else if(RecvBuf[1][0]==BLEND_CONTINUE){//続ける
			bmw->siowork[0] = BLEND_CONTINUE;
		}
	}

	if(GetSioConnectId()==0){								//全員からの返答を親が受け取る
		if(bmw->siowork[0]==BLEND_END||bmw->siowork[0]==BLEND_CONTINUE) return;
		for(i=0;i<GetConnectSioMenberNum();i++){					//集計
			if(RecvBuf[0][i]==USER_COMMAND){
				switch(RecvBuf[1][i]){
					case SELECT_YES:								//はい
						bmw->siowork[i] = SELECT_YES;
						break;
					case SELECT_NO:
						bmw->siowork[i] = SELECT_NO;				//いいえ
						break;
					case SELECT_YES_BUT_NOKINOMI:
						bmw->siowork[i] = SELECT_YES_BUT_NOKINOMI;	//きのみがない
						break;
					case SELECT_YES_BUT_FULLCUBE:
						bmw->siowork[i] = SELECT_YES_BUT_FULLCUBE;	//キューブがいっぱい
						break;
				}
			}
		}
		for(i=0;i<GetConnectSioMenberNum();i++){			//全員から返答がきたか
			if(bmw->siowork[i]==0) break;
		}
		if(i!=GetConnectSioMenberNum()) return;

		for(i=0;i<GetConnectSioMenberNum();i++){			//全員「はい」か
			if(bmw->siowork[i]!=SELECT_YES) break;
		}
		SendBuf[0] = USER_COMMAND;							//ユーザーコマンド発行準備
		if(i==GetConnectSioMenberNum()){
			SendBuf[1] = BLEND_CONTINUE;						//継続コマンド発行
		}else{
			SendBuf[1] = BLEND_END;								//終了こまんど
			SendBuf[2] = bmw->siowork[i];
			SendBuf[3] = i;
		}

//		for(i=0;i<GetConnectSioMenberNum();i++){			//続けられない理由は
//		}
	}
}



// =================================================================
// BlendBGAffineSet
// 概要  : 回転面の設定を行う(ﾚｼﾞｽﾀ設定はVSync中で)
// 引数  : des
// 戻り値: none
// =================================================================
static void BlendBGAffineSet(	BgAffineDestData *des)
{
	BgAffineSrcData src;

	src.SrcCenterX = (0x0f*8)<<8;
	src.SrcCenterY = (0x0a*8)<<8;
	src.DispCenterX = (ROTATE_CENTER_X)-bmw->BgOffsetX;
	src.DispCenterY = (ROTATE_CENTER_Y)-bmw->BgOffsetY;
	src.RatioX      = bmw->Ratio;
	src.RatioY      = bmw->Ratio;
	src.Theta       = bmw->kakudo;
	
	BgAffineSet(&src, des, 1);					//回転BG面レジスタ算出
												//回転BG面レジスタ格納,Vsync割り込み中にセットされる
	
}
//------------------------------------------------------------------
//  回転処理
//------------------------------------------------------------------
static void rotate_func()
{
	bmw->oldkakudo = bmw->kakudo;				
	bmw->kakudo+=bmw->v_kakudo;					//回転加速度をたして回転角を更新

	
	BlendBGAffineSet(&bmw->Rotate);				//回転計算
												//レジスタへの格納はVSync中で


}


static void VsyncRotateSet()
{
	*(vu16*)REG_BG2PA	 = bmw->Rotate.H_DiffX;			//回転BG面レジスタ格納
	*(vu16*)REG_BG2PB	 = bmw->Rotate.V_DiffX;
	*(vu16*)REG_BG2PC	 = bmw->Rotate.H_DiffY;
	*(vu16*)REG_BG2PD	 = bmw->Rotate.V_DiffY;
	*(vu32*)REG_BG2X 	 = bmw->Rotate.StartX ;
	*(vu32*)REG_BG2Y 	 = bmw->Rotate.StartY ;

}

static void VsyncBgOffset()
{
	*(vu16*)REG_BG1HOFS = bmw->BgOffsetX;
	*(vu16*)REG_BG1VOFS = bmw->BgOffsetY;
	*(vu16*)REG_BG0HOFS = bmw->BgOffsetX;
	*(vu16*)REG_BG0VOFS = bmw->BgOffsetY;
}

//=========================================================================
//  火花の動き
//=========================================================================
static void hibana_act_move(actWork *act)
{

	act->work[2] += act->work[0];
	act->work[3] += act->work[1];	
	act->dx = act->work[2]/8;
	act->dy = act->work[3]/8;
	if(act->anmend_sw) DelActor(act);
}

//=========================================================================
//  火花を散らせる
//=========================================================================
static void hibana_actor_add()
{

	int work,wx,wy,i,no;
	u16	kaku;
	
//	work = pp_rand()%5+2;
	work = pp_rand()%2+1;
	for(i=0;i<work;i++){
		kaku=bmw->kakudo+pp_rand()%20;
		wx = (_Cos(kaku&0xff)*64)/256;
		wy = (_Sin(kaku&0xff)*64)/256;
		no=AddActor(&HibanaHeader,wx+120,wy+80,1);
		ActWork[no].work[0] = 8*2-pp_rand()%(4*8);
		ActWork[no].work[1] = 8*2-pp_rand()%(4*8);
		ActWork[no].move = hibana_act_move;
	}

}


//=========================================================================
//  判定アイコンの動き
//=========================================================================
static void HanteiMove(actWork *act)
{
	act->work[0]++;
	act->dy = -(act->work[0]/3);
	if(act->anmend_sw){
		DelActor(act);
	}
}

static void HanteiMove2(actWork *act)
{
	act->work[0]++;
	act->dy = -(act->work[0]*2);
	if(act->dy<-12){
		act->dy=-12;
	}
	if(act->anmend_sw){
		DelActor(act);
	}
}


//=========================================================================
//  通信メンバーの選択アイテムをセットする
//=========================================================================
void BlendMachineMemberItem(u8 Id, u16 Item)
{
	bmw->memberitem[Id]= Item;
	KinomiWorkSet(&bmw->Kinomi[Id],Item);
}



//--------------------------------------------------------------------------------
//  ブレンドマシーンの開始処理
//
//
//  親は一定時間に一回通信を初期化し子の接続状態を監視する。
//  また親のキー操作でブレンドマシーンのスタートする。
//
//	0:一定時間で初期化するカウンタ
//--------------------------------------------------------------------------------
void WaitBlendMachineStart(u8 no)
{
	int i;
	
	TASK_TABLE *my;
	my = &TaskTable[no];

	if(pokemon_sio_flag){					//通信している
		if(GetSioConnectId()==0){			//親
			my->work[0]++;
			if(my->work[0]>120){
//				PokemonMultiSioInit();
				my->work[0]=0;
			}
			if(my->work[0]==100){
				FontScrnAreaClear(&bmw->tw, 0, 0, 16, 20);

				NMenuWinBoxWrite(4,4,4+6,4+8);

				//新規通信テスト用に仮ストップ
				for(i=0;i<3;i++){
					if(SioTrainerInfo[i+1].Id!=0) BlendMsgPrint( ok_msg[i],WINMSG_CHR_START_NO+i*10,5,5+i*2);
					NMenuWinBoxWrite(0,13,29,19);
					BlendMsgPrint( start_msg,WINMSG_CHR_START_NO+10*4,1,15);
				}
			}
			if(sys.Trg&A_BUTTON){				//親だけはブレンドマシーンスタートを走らせる
//				BlendMachineFunction_Set();
				BlendMachineStartSend();
				DelTask(no);
			}
		}else{								//子
			if(my->work[0]==10)
					BlendMsgPrint( wait_msg,100,3,10);
			if(++my->work[0]>120) my->work[0]=0;
			
			if(SendXydataFlag>4&&pokemon_sio_flag==1){
				DelTask(no);
			}
		}
	}
}


//=========================================================================
//  一文字ずつ展開メインルーチン(会話式)
//=========================================================================
u8 BlendTalkMsgPut( void )
{
	return TalkMsgPut( &(bmw->tw) );
}

//=========================================================================
//  一文字ずつ展開メッセージ表示(会話式)
//=========================================================================
void BlendTalkMsgSet( const u8 * msg, u16 chr_no, u8 x, u8 y )
{
	TalkMsgSet(&(bmw->tw), msg, MenuFontStartNo + chr_no, x, y );
}

//=========================================================================
//  一括文字列表示
//
//  ウインドウフォント・システムフォントの後ろから表示します
//=========================================================================
void BlendMsgPrint( const u8 * msg, u16 chr_no, u8 x, u8 y )
{
	MsgPrint(&bmw->tw, msg, MenuFontStartNo + chr_no, x, y);
}

//=========================================================================
//  ウインドウ付き一括表示
//=========================================================================
void BlendWindMsgPrint(const u8 *msg, u16 chr_no, u8 x1, u8 y1, u8 x2, u8 y2)
{
	NMenuWinBoxWrite(x1,y1,x2,y2);
	MsgPrint(&bmw->tw, msg, MenuFontStartNo + chr_no, x1+1, y1+1);

}


//=========================================================================
//  カウンターのアニメ
//
//	work[0]:  状態
//  work[1]:  Y座標
//  work[2]:  ｳｪｲﾄ
//	work[3]:  アニメ番号
//
//=========================================================================
static void CountActSeq(actWork *Xreg)
{
	switch(Xreg->work[0]){
		case 0:
			Xreg->work[1]+=8;					//画面上から下に
			if(Xreg->work[1]>88){
				Xreg->work[1]=88;
				Xreg->work[0]++;
				SePlay(SE_KON);
			}
			break;
		case 1:
			Xreg->work[2]++;
			if(Xreg->work[2]>20){
				Xreg->work[0]++;
				Xreg->work[2]=0;
			}
			break;
		case 2:
			Xreg->work[1]+=4;					//画面上から下に
			if(Xreg->work[1]>160+16){			//画面下に消えたら
				Xreg->work[3]++;
				if(Xreg->work[3]==3){
					DelActor(Xreg);			//１の次は「STATRT」
					AddActor(&ActStartHeader,120,-20,2);
				}else{
					Xreg->work[0]=0;
					Xreg->work[1]=-16;			//OBJの絵を変更してまた画面上部へ
					ActAnmChg(Xreg,Xreg->work[3]);
				}
			}
			break;
	}
	Xreg->dy = Xreg->work[1];
}

//=========================================================================
//  「スタート」のアニメ
//	work[0]:  状態
//  work[1]:  Y座標
//  work[2]:  ｳｪｲﾄ
//=========================================================================
static void StartActSeq(actWork *Xreg)
{
	switch(Xreg->work[0]){
		case 0:
			Xreg->work[1]+=8;					//画面上から下に
			if(Xreg->work[1]>92){
				Xreg->work[1]=92;
				Xreg->work[0]++;
				SePlay(SE_PIN);
			}
			break;
		case 1:
			Xreg->work[2]++;
			if(Xreg->work[2]>20){
				Xreg->work[0]++;
			}
			break;
		case 2:
			Xreg->work[1]+=4;					//画面上から下に
			if(Xreg->work[1]>160+16){			//画面下に消えたら
					bmw->initflag++;
					DelActor(Xreg);				//
			}
			break;
	}
	Xreg->dy = Xreg->work[1];

}


// =============================================
// MeterFunc
// 概要  : アニメーション対応メーター反映ルーチン
// 引数  : meter
//       : max
// 戻り値: static void
// =============================================
static void MeterFunc(u16 meter,u16 max){
	
	if(bmw->now_meter<meter){						//メーターがぐんぐん伸びていくように
		bmw->now_meter+=2;
		MeterFuncSub(bmw->now_meter,max);
	}
}

// =============================================
// MeterFuncSub
// 概要  : メーターのＢＧ操作を行う
// 引数  : 現在のメーター量
// 引数  : メーターの最大値
// =============================================
static void MeterFuncSub(u16 meter, u16 max)
{
	int i,work,w1,w2;
	vu16*	p;
	p = (vu16*)(BLEND_BACK_MAP);

	work = (METER1_DOT_MAX*meter)/max;			//目盛りの量を算出
	w1 = work/8;								//８で埋まってるセルを算出＆セット
	for(i=0;i<w1;i++){
		p[METER1_POS_INDEX   +i] = METER1_PAT_0+8;
		p[METER1_POS_INDEX+32+i] = METER1_PAT_0+8+16;	//一列下のセルも埋める
	}

	w2 = work%8;										//端数の目盛りを算出＆セット
	if(w2!=0){
		p[METER1_POS_INDEX   +i] = METER1_PAT_0+w2;
		p[METER1_POS_INDEX+32+i] = METER1_PAT_0+w2+16;		//一列下のセルも
		i++;
	}
														//後のセルは空白で埋める
	for(;i<METER1_MAP_MAX;i++){
		p[METER1_POS_INDEX   +i] = METER1_PAT_0;
		p[METER1_POS_INDEX+32+i] = METER1_PAT_0+16;	
	
	}
}

//
// 60/0x10000/60 =
// 
//     60           60                        60               60        60*60
// ---------- =  -------------------  =  ---------------   x -----  =  ------------
// 0x10000/60     0x10000x    1            0x10000x   1        60       0x10000
//                         --------                 ----
//                            60                     60

#define BPM_TIME_SECOND		(6000*60)
#define BPM_TIME_AROUND		(0x10000)
// =================================================================
// RotateSpeed2rpm
// 概要  : きのみブレンダー用回転速度を実際の回転速度（ｒｐｍ）へ変換
// 引数  : v_kakudo
// 戻り値: u32		回転速度ｘ１００（小数点2桁）
// =================================================================
u32 RotateSpeed2rpm(u16 v_kakudo)
{
	u32 work;
	work = (BPM_TIME_SECOND*v_kakudo)/BPM_TIME_AROUND;
	return work;
}


// =================================================================
// SpeedMeterFunc
// 概要  : スピードメーターの表示
// 引数  : v
// 戻り値: none
// =================================================================
static void SpeedMeterFunc(u16 v)
{
	u8 work[5],i;
	u16 *p;
	u32 bpm;
	
	bpm = RotateSpeed2rpm(v);		//きのみブレンダー用の回転係数を回転速度（ｒｐｍ）へ変換
	
	if(bmw->bpm_max<bpm)			//最高回転速度を保存
		bmw->bpm_max = bpm;


	for(i=0;i<5;i++){				//下位から表示用のワークにいれていく
		work[i] = bpm%10;
		bpm /= 10;
	}
	p=(u16*)(BLEND_BACK_MAP);
	p[SPEED_POS_INDEX+0] = work[4]+SPEED_PAT_0;		//BGにメーターを反映させる
	p[SPEED_POS_INDEX+1] = work[3]+SPEED_PAT_0;		//手抜き
	p[SPEED_POS_INDEX+2] = work[2]+SPEED_PAT_0;
	p[SPEED_POS_INDEX+4] = work[1]+SPEED_PAT_0;
	p[SPEED_POS_INDEX+5] = work[0]+SPEED_PAT_0;
}

static void SpeedUpVibrationSet(s16 *n, u16 offset)
{
	if(*n==0){			//揺れが格納されてなかったら
		*n = pp_rand()%offset-(offset/2);			//ﾗﾝﾀﾞﾑで格納
	}
}


static void VibrationSub(s16 *n)
{
		if(*n<0) (*n)++;				//0になるまで減らす
		if(*n>0) (*n)--;
}

static void SpeedUpVibration()
{
	VibrationSub(&bmw->BgOffsetX);
	VibrationSub(&bmw->BgOffsetY);
}

// =================================================================
// VibrationCalc
// 概要  : 振動計算
// 引数  : n		振動ｵﾌｾｯﾄを格納するﾎﾟｲﾝﾀ
//       : wait		ﾀｲﾏｰｶｳﾝﾄ
// 戻り値: none
// =================================================================
static void VibrationCalc(s16 *n, u16 wait)
{
	u8 w;
	w = 8;
	if(wait<10){		//揺れてる期間の前半は大きいゆれ
		w = 16;
	}

	if(*n==0){			//揺れが格納されてなかったら
		*n = pp_rand()%w-(w/2);			//ﾗﾝﾀﾞﾑで格納
	}else{
		if(*n<0) (*n)++;				//0になるまで減らす
		if(*n>0) (*n)--;
	}
	
}

// =================================================================
// BlendMachineVibration
// 概要  : 画面の振動制御
// 引数  : none
// 戻り値: static u8
// =================================================================
static u8 BlendMachineVibration()
{
	if(bmw->wait==0){								//揺れモードの初期化
		bmw->BgOffsetX = 0;
		bmw->BgOffsetY = 0;
	}
	bmw->wait++;
	VibrationCalc(&bmw->BgOffsetX,bmw->wait);		//横揺れ
	VibrationCalc(&bmw->BgOffsetY,bmw->wait);		//縦揺れ


	if(bmw->wait==20){								//20ｼﾝｸ揺れたらお終い
		bmw->BgOffsetX = 0;
		bmw->BgOffsetY = 0;
		return 1;
	}
	return 0;
}

// =================================================================
// BlendCursorActMove
// 概要  : カーソルのアクタールーチン
// 引数  : act
// 戻り値: none
// =================================================================
static void BlendCursorActMove(actWork *act)
{
	act->dx = -bmw->BgOffsetX;		//背景の振動にカーソルも対応するため
	act->dy = -bmw->BgOffsetY;
}


// =================================================================
// RankingRPMSet
// 概要  : ＲＰＭのランキングを登録
// 引数  : none
// 戻り値: none
// =================================================================
static void RankingRPMSet()
{
	//通信と通常時で最高速度を分けるのはなくなりました。
//	if(BlendMachineType==PLAYER_SIO)
//	{
//		if(Fld.SioBPMRecord[bmw->member_num-2] < bmw->bpm_max){
//			Fld.SioBPMRecord[bmw->member_num-2] = bmw->bpm_max;
//		}
//	}else{
		if(Fld.NormalBPMRecord[bmw->member_num-2] < bmw->bpm_max){
			Fld.NormalBPMRecord[bmw->member_num-2] = bmw->bpm_max;
		}
//	}
}

// =================================================================
// BlendMachineResultPut
// 概要  : きのみブレンダー結果表示画面その１
// 引数  : none
// 戻り値: static u8
// =================================================================
#define RESULT_X_LINE	6
#define TITLE_X_LINE	12

#define KEKKA1_1LINE_CELL		(i*(10+8)*2)
#define KEKKA1_NAMEPUT_CELL		(WINMSG_CHR_START_NO+24+KEKKA1_1LINE_CELL)
#define KEKKA1_KINOMI_CELL		(KEKKA1_NAMEPUT_CELL+10*2)
#define KEKKA1_MAXSPEED_CELL	(KEKKA1_NAMEPUT_CELL)
#define KEKKA1_MAXPEEDNUM_CELL	(KEKKA1_MAXSPEED_CELL+7*2)
#define KEKKA1_TIME_CELL		(KEKKA1_MAXPEEDNUM_CELL+20)
#define KEKKA1_TIMENUM_CELL		(KEKKA1_TIME_CELL+2*6)

static const u8 strytbl[]={6,6,6,6,5};
static const u8 posytbl[]={3,3,3,2,2};
static u8 BlendMachineResultPut()
{
	u8 calc[6],strwork[20],*p;
	u16 table[4],i,no,byou,hun;
	CUBE cubework;


	switch(bmw->initflag)
	{
		case 0:
			bmw->initflag++;
			bmw->wait = 0x11;
			break;
		case 1:
			bmw->wait-=10;
			if(bmw->wait<0){
				bmw->wait=0;
				bmw->initflag++;
			}
			break;
		case 2:
			if(++bmw->wait>20){
				for(i=0;i<3;i++) DelActor(&ActWork[bmw->actno[i]]);		//前の画面で表示されているアクターを消す
				bmw->wait = 0;
				bmw->initflag++;
			}
			break;
		case 3:

			NMenuWinBoxWrite(RESULT_X1,RESULT_Y1,RESULT_X2,RESULT_Y2);
			BlendMsgPrint( resultmsg0,WINMSG_CHR_START_NO,				TITLE_X_LINE,3);	//まぜたけっか

			for(i=0;i<bmw->member_num;i++){
				no = bmw->sort[i];
				PM_NumMsgSet(bmw->strbuf, i+1, NUM_MODE_LEFT, 1);
				PM_strcat(bmw->strbuf,konmamsg);
				PM_strcat(bmw->strbuf,SioTrainerInfo[no].name);
				BlendMsgPrint( bmw->strbuf,KEKKA1_NAMEPUT_CELL,
					RESULT_X_LINE+1,strytbl[bmw->member_num]+i*posytbl[bmw->member_num]);	//名前
//				PM_strcpy(bmw->strbuf,SeedParameter[bmw->memberitem[no]-ITEM_SEED_START].name);

//				GetItemName(bmw->memberitem[no],bmw->strbuf);
				PM_strcpy(bmw->strbuf,bmw->Kinomi[no].name);


//				bmw->strbuf[3] = EOM_;
				PM_strcat(bmw->strbuf,nomimsg);
				BlendMsgPrint( bmw->strbuf,KEKKA1_KINOMI_CELL,
					RESULT_X_LINE+11,strytbl[bmw->member_num]+i*posytbl[bmw->member_num]);	//いれたタネ
			}
			i=4;
			BlendMsgPrint( resultmsg3,KEKKA1_MAXSPEED_CELL,RESULT_X_LINE,13);	//さいこうそくど
			PM_NumMsgSet(bmw->strbuf, bmw->bpm_max/100, NUM_MODE_SPACE, 3);
			PM_strcat(bmw->strbuf,konmamsg);
			PM_NumMsgSet(strwork, bmw->bpm_max%100, NUM_MODE_ZERO, 2);
			PM_strcat(bmw->strbuf,strwork);
			PM_strcat(bmw->strbuf,kmmsg);
			BlendMsgPrint( bmw->strbuf,KEKKA1_MAXPEEDNUM_CELL,RESULT_X_LINE+8,13);	//さいこうそくど
//+12+10
//+12+10+16
			BlendMsgPrint( resultmsg2,KEKKA1_TIME_CELL,RESULT_X_LINE,15);	//じかん
			byou = (bmw->timer/60)%60;
			hun  = bmw->timer/(60*60);
			PM_NumMsgSet(bmw->strbuf, hun, NUM_MODE_ZERO, 2);
			p = PM_strcat(bmw->strbuf,hunmsg);
			PM_NumMsgSet(p, byou, NUM_MODE_ZERO, 2);
			PM_strcat(bmw->strbuf,byoumsg);
			BlendMsgPrint( bmw->strbuf,KEKKA1_TIMENUM_CELL,RESULT_X_LINE+8,15);	//じかん
				
			bmw->wait = 0;
			bmw->initflag++;
			break;
		case 4:
			if(sys.Trg&A_BUTTON){
	//			SePlay(SE_SELECT);
				bmw->initflag++;
			}
			break;
		case 5:
				NMenuScreenClear();
				NMenuWinBoxWrite(0,14,29,19);
				for(i=0;i<4;i++){
					if(bmw->memberitem[i]>0){				//選択たねの変換作業
						table[i] = bmw->memberitem[i] - ITEM_SEED_START;
					}
				}
				SetBorderLine();
				Seed2Cube(bmw->Kinomi, &cubework, bmw->member_num, calc,bmw->bpm_max);		//たね生成計算
		
				CubeComentSet(&cubework,bmw->strbuf);				//できたポロックのコメントをセット
				
				AddTask(ItemJingle2ContestBgm,6);
#ifdef PM_DEBUG
				PM_HexNumMsgSet(strwork, GetBlendMachineCount(), NUM_MODE_LEFT, 4);
				PM_strcat(strwork,normalwait_msg);
				PM_strcat(bmw->strbuf,strwork);
#endif
				BlendTalkMsgSet(bmw->strbuf, WINMSG_CHR_START_NO, 2, 15);		//「キューブができました」
				SubItem(ReturnItemNo,1);										//タネを減らす

				AddCube(&cubework);
				bmw->initflag++;
				
			break;
		case 6:
			if(BlendTalkMsgPut()){									//テキストのボタン押し待ち
				RankingRPMSet();
				return 1;
			}
			break;
	}

	return 0;
}

// =================================================================
// CubeComentSet
// 概要  : できあがったポロックのコメントをセット
// 引数  : p
//       : buf
// 戻り値: none
// =================================================================
static void CubeComentSet(CUBE *p, u8 *strbuf)
{
	u8 strwork[10],level,nameraka;

	strbuf[0]=EOM_;
	PM_strcpy(strbuf,cube_name[p->type]);				//？？？のポロックができました！
	PM_strcat(strbuf,end_msg);
	PM_strcat(strbuf,crmsg);
#ifdef DEBUG_PARAMETA
	PM_NumMsgSet(strwork, p->karai, NUM_MODE_LEFT, 3);	//デバッグ用に味のパラメータを列記
	PM_strcat(strbuf,strwork);
	PM_strcat(strbuf,spcmsg);
	PM_NumMsgSet(strwork, p->sibui, NUM_MODE_LEFT, 3);
	PM_strcat(strbuf,strwork);
	PM_strcat(strbuf,spcmsg);
	PM_NumMsgSet(strwork, p->amai, NUM_MODE_LEFT, 3);
	PM_strcat(strbuf,strwork);
	PM_strcat(strbuf,spcmsg);
	PM_NumMsgSet(strwork, p->nigai, NUM_MODE_LEFT, 3);
	PM_strcat(strbuf,strwork);
	PM_strcat(strbuf,spcmsg);
	PM_NumMsgSet(strwork, p->suppai, NUM_MODE_LEFT, 3);
	PM_strcat(strbuf,strwork);
	PM_strcat(strbuf,spcmsg);
	PM_NumMsgSet(strwork, p->umai, NUM_MODE_LEFT, 3);
	PM_strcat(strbuf,strwork);
	PM_strcat(strbuf,normalwait_msg);
	PM_strcat(strbuf,crmsg);
#endif				
	level    = CubeLevelGet(p);								//ポロックのレベル取得
	nameraka = CubeNamerakasaGet(p);						//ポロックのなめらかさ取得
	PM_strcat(strbuf,level_msg);
	PM_NumMsgSet(strwork, level, NUM_MODE_LEFT, 3);			//「レベル？？」
	PM_strcat(strbuf,strwork);
	
	
	PM_strcat(strbuf,nameraka_msg);							//「で、なめらかさは？？だ」
	PM_NumMsgSet(strwork, nameraka, NUM_MODE_LEFT, 3);
	PM_strcat(strbuf,strwork);
	PM_strcat(strbuf,comentend_msg);
	PM_strcat(strbuf,normalwait_msg);
	
}

// =================================================================
// KeySort
// 概要  : データをソート
// 引数  : work		並び替える順番
//       : member	人数
//       : data		この配列の成績でworkを並び替える
// 戻り値: none
// =================================================================
static void KeySort(u8 *work, u8 member, u32 *data){
	int i,w;
	u8 tmp;
	
	for(i=0;i<member;i++){						//手抜きバブルソートわはは
		for(w=0;w<member;w++){
			if(data[work[i]]>data[work[w]]){
				tmp = work[i];
				work[i] = work[w];
				work[w] = tmp;
			}
		}
	}
}

// =================================================================
// SortHitResult
// 概要  : きのみブレンダーの成績をソートする
// 引数  : none
// 戻り値: none
// =================================================================
static void SortHitResult()
{
	u8  i;
	u8  work[4];
	u32 keydata[4];
	
	for(i=0;i<bmw->member_num;i++) work[i] = i;
	for(i=0;i<bmw->member_num;i++){								//ソート用にデータを集計
		keydata[i]  = bmw->hitcount[i][0]*1000000;
		keydata[i] += bmw->hitcount[i][1]*1000;
		keydata[i] += 1000-bmw->hitcount[i][2];
	}

	
	KeySort( work, bmw->member_num, keydata);					//ソート

	for(i=0;i<bmw->member_num;i++) bmw->sort[i] = work[i];
}

// =================================================================
// BlendMachineResultPut
// 概要  : きのみブレンダー結果画面その２
// 引数  : none
// 戻り値: static u8
// =================================================================
static const u8 narabi[]={3,3,3,3,2};

#define KEKKA2_TITLE	(WINMSG_CHR_START_NO)
#define KEKKA2_NAME		(KEKKA2_TITLE+24+i*(11+9)*2)
#define KEKKA2_COUNT	(WINMSG_CHR_START_NO+24+((i*(11+9))+9+w*3)*2)

#define HANTEI_ICON_X	128
#define HANTEI_ICON_Y	52

static u8 BlendMachineResultPut2()
{
	u16 i,w,no;


	switch(bmw->initflag)
	{
		case 0:
			bmw->initflag++;
			bmw->wait = 0xff;
			break;
		case 1:
			bmw->wait-=10;
			if(bmw->wait<0){
				bmw->wait=0;
				bmw->initflag++;
			}
			break;
		case 2:
			if(++bmw->wait>20){
//				m4aMPlayVolumeControl(&m4a_mplay002,0xffff,bmw->wait);
//				m4aSongNumStop(SE_MOTER);
				bmw->wait = 0;
				bmw->initflag++;
			}
			break;
		case 3:

			NMenuWinBoxWrite(RESULT_X1,RESULT_Y1,RESULT_X2,RESULT_Y2);
			BlendMsgPrint( rankingmsg,KEKKA2_TITLE,	TITLE_X_LINE,3);	//ランキング

			bmw->actno[0] = AddActor(&HanteiHeader,HANTEI_ICON_X,HANTEI_ICON_Y,0);
			ActAnmChg(&ActWork[bmw->actno[0]],3);
			ActWork[bmw->actno[0]].move = DummyActMove;
			bmw->actno[1] = AddActor(&HanteiHeader,HANTEI_ICON_X+32,HANTEI_ICON_Y,0);
			ActWork[bmw->actno[1]].move = DummyActMove;
			bmw->actno[2] = AddActor(&HanteiHeader,HANTEI_ICON_X+64,HANTEI_ICON_Y,0);
			ActAnmChg(&ActWork[bmw->actno[2]],1);
			ActWork[bmw->actno[2]].move = DummyActMove;

			SortHitResult();										//結果をソート bmw->sort[]に格納
			for(i=0;i<bmw->member_num;i++){
				no = bmw->sort[i];
				PM_NumMsgSet(bmw->strbuf, i+1, NUM_MODE_LEFT, 1);
				PM_strcat(bmw->strbuf,konmamsg);
				PM_strcat(bmw->strbuf,SioTrainerInfo[no].name);
				BlendMsgPrint( bmw->strbuf,KEKKA2_NAME,
					RESULT_X_LINE-1,8+i*narabi[bmw->member_num]);	//名前
				for(w=0;w<3;w++){
					PM_NumMsgSet(bmw->strbuf, bmw->hitcount[no][w], NUM_MODE_SPACE, 3);
					BlendMsgPrint( bmw->strbuf,	KEKKA2_COUNT,
						RESULT_X_LINE+8+4*w,8+i*narabi[bmw->member_num]);	//いれたタネ
				}
			}
				
			bmw->wait = 0;
			bmw->initflag++;
			break;
		case 4:
			if(++bmw->wait>20){
				bmw->initflag++;
			}
			break;
		case 5:
			if(sys.Trg&A_BUTTON){
				SePlay(SE_SELECT);
				bmw->initflag++;
			}
			break;
		case 6:
				bmw->initflag=0;
				return 1;
			break;
	}

	return 0;
}




typedef struct{
	s8		cursorpos;
	s8		seeds[4];
	CUBE	cube;
	u8		rewrite;
	u8		work[6];
	s8      minus;
	s8      plus;
	s16		bpm;
}SEED2CUBE;
static SEED2CUBE	s2c;
//=========================================================================
//きのみ→キューブテスト画面初期化
//=========================================================================
void BlendTestInit(void)
{
	InitActor();				//アクター初期化
	ObjPalManInit();			//OBJパレットマネージャー初期化
	InitTask();


	SetVBlankFunc(VInterFunc2);

	PrintScreenInit(FIELD_MENU_TYPE);
	NMenuScreenInit(FIELD_MENU_TYPE);

	pp_srand(sys.main_timer);

	*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
                          |	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
						  | DISP_BG0_ON					// BG0有効
						  | DISP_BG2_ON					// BG2有効
						  | DISP_OBJ_ON;

	MainTask();
	JumpActor();
	SetActor();
	PaletteAnime();
	
	s2c.bpm = 8000;
	s2c.rewrite++;

	MainProcChange(BlendTestMain);
};




static const u8 kuuhaku[]={spc_,EOM_};
static const u8 bpm_msg[]={B__,P__,M__,EOM_};
static const u8 minus_kigou[]={bou_,EOM_,};

// =================================================================
// write_info
// 概要  : 「キューブテスト」情報表示
// 引数  : none
// 戻り値: none
// =================================================================
static void write_info()
{
	u8 strbuf[128],i;

	PM_strcpy(strbuf,bpm_msg);
	NMenuMsgWrite(strbuf,2,0);
	
	PM_NumMsgSet(strbuf,s2c.bpm/100,NUM_MODE_ZERO,3);
	NMenuMsgWrite(strbuf,6,0);

	for(i=0;i<4;i++){
		if(s2c.cursorpos==i){
			strbuf[0] = cursor_;
//			memcpy(&strbuf[1],SeedParameter[s2c.seeds[i]].name,SEED_NAME_SIZE);
			GetItemName(s2c.seeds[i]+ITEM_SEED_START,&strbuf[1]);
//			strbuf[SEED_NAME_SIZE+1] = EOM_;
		}else{
//			memcpy(strbuf,SeedParameter[s2c.seeds[i]].name,SEED_NAME_SIZE);
			GetItemName(s2c.seeds[i]+ITEM_SEED_START,strbuf);
			strbuf[SEED_NAME_SIZE] = spc_;
			strbuf[SEED_NAME_SIZE+1] = EOM_;
		}
		
		NMenuMsgWrite(strbuf,2,3+3*i);

		PM_NumMsgSet(strbuf,SeedParameter[s2c.seeds[i]].karai,NUM_MODE_ZERO,2);
		PM_strcat(strbuf,kuuhaku);
		PM_NumMsgSet(strbuf+3,SeedParameter[s2c.seeds[i]].sibui,NUM_MODE_ZERO,2);
		PM_strcat(strbuf,kuuhaku);
		PM_NumMsgSet(strbuf+6,SeedParameter[s2c.seeds[i]].amai,NUM_MODE_ZERO,2);
		PM_strcat(strbuf,kuuhaku);
		PM_NumMsgSet(strbuf+9,SeedParameter[s2c.seeds[i]].nigai,NUM_MODE_ZERO,2);
		PM_strcat(strbuf,kuuhaku);
		PM_NumMsgSet(strbuf+12,SeedParameter[s2c.seeds[i]].suppai,NUM_MODE_ZERO,2);
		PM_strcat(strbuf,kuuhaku);
		PM_NumMsgSet(strbuf+15,SeedParameter[s2c.seeds[i]].umai,NUM_MODE_ZERO,2);
		strbuf[17] = EOM_;

		NMenuMsgWrite(strbuf,7,3+3*i);
		
	}

	if(s2c.cube.type!=0){
		PM_strcpy(strbuf,cube_name[s2c.cube.type]);
		NMenuMsgWrite(strbuf,2,3+3*4);

		PM_HexNumMsgSet(strbuf,s2c.work[0],NUM_MODE_ZERO,2);
		PM_strcat(strbuf,kuuhaku);
		PM_HexNumMsgSet(strbuf+3,s2c.work[1],NUM_MODE_ZERO,2);
		PM_strcat(strbuf,kuuhaku);
		PM_HexNumMsgSet(strbuf+6,s2c.work[2],NUM_MODE_ZERO,2);
		PM_strcat(strbuf,kuuhaku);
		PM_HexNumMsgSet(strbuf+9,s2c.work[3],NUM_MODE_ZERO,2);
		PM_strcat(strbuf,kuuhaku);
		PM_HexNumMsgSet(strbuf+12,s2c.work[4],NUM_MODE_ZERO,2);
		PM_strcat(strbuf,kuuhaku);
		PM_HexNumMsgSet(strbuf+15,s2c.work[5],NUM_MODE_ZERO,2);
		strbuf[17] = EOM_;

		NMenuMsgWrite(strbuf,7,3+3*4+2);
	}

//	PM_strcat(strbuf,setuzoku_text[no]);
//	NMenuWinBoxWrite(x,y,x+14,y+5);
	

}

u8  randomtestflag = 0;
u32 randomcount = 0;
u16	randbunpu[10];
u16 firstrandom;
u32 randomhit = 0;
u8  randombit = 0;
static const u8 cr_msg[]={CR_,EOM_};

// =================================================================
// randomtestfunc
// 概要  : ちょっとした乱数のテスト
// 引数  : none
// 戻り値: none
// =================================================================
static void randomtestfunc2()
{
	u16 w,i,*p;
	u8 strbuf[70],strwork[10];
	if(randomtestflag==1){
		for(w=0;w<10;w++) randbunpu[w] = 0;
		firstrandom = pp_rand();
		randomcount=0;
		randomtestflag=2;
		for(i=0;i<100*2;i++) UserWork[i] = 0;
		randombit = 0;
	}
//	for(i=0;i<150;i++){
//		w=pp_srand(sys.main_timer);
//		w=pp_rand();
//		if(w==firstrandom){
//			randomtestflag=3;
//			randomhit = randomcount;
//		}
//		randomcount++;
//	}
	for(i=0;i<100;i++){
		w=pp_rand();
//		w /= (RAND_MAX/100);
//		p = (u16*)UserWork;
//		p[w]++;
		if(((w>>15)&1)==randombit){		//ビットが一緒だったら
			randomcount++;
		}else{						//違ったら反転させて保存
			p = (u16*)UserWork;
			p[randomhit] = randomcount;
			randomhit++;
			randomcount = 0;
			randombit ^= 1;
		}
	}
	
	strbuf[0] = EOM_;
	
	PM_HexNumMsgSet(strwork,firstrandom,NUM_MODE_ZERO,8);
	PM_strcat(strbuf,strwork);
	PM_strcat(strbuf,kuuhaku);
	PM_HexNumMsgSet(strwork,randomcount,NUM_MODE_ZERO,8);
	PM_strcat(strbuf,strwork);

	PM_strcat(strbuf,cr_msg);
	if(randomtestflag==3){
		PM_HexNumMsgSet(strwork,randomhit,NUM_MODE_ZERO,16);
		PM_strcat(strbuf,strwork);
		randomtestflag = 0;
	}
	NMenuMsgWrite(strbuf,2,3+3*4);

}

static void seed2cubepadfunc()
{
	u16 mix[4],i;
	u16 num;
	KINOMIWORK kinomi[4];
	
	if(sys.Trg&R_BUTTON){
		if((s2c.bpm+=1000)>30000) s2c.bpm = 1000;
		s2c.rewrite++;
	}

	if(sys.Trg&L_BUTTON){
		if((s2c.bpm-=1000)<0) s2c.bpm = 30000;
		s2c.rewrite++;
	}
	
	if(sys.Trg&U_KEY){				//カーソル上
		if(--s2c.cursorpos<0) s2c.cursorpos = 3;
		s2c.rewrite++;
	}
	if(sys.Trg&D_KEY){				//カーソルdown
		if(++s2c.cursorpos>3) s2c.cursorpos = 0;
		s2c.rewrite++;
	}
	if(sys.Trg&L_KEY){				//カーソルleft	たね選択
		if(--s2c.seeds[s2c.cursorpos]<0) s2c.seeds[s2c.cursorpos] = NORMAL_SEED_TYPE_MAX;
		s2c.rewrite++;
	}
	if(sys.Trg&R_KEY){				//カーソルright たね選択
		if(++s2c.seeds[s2c.cursorpos]>NORMAL_SEED_TYPE_MAX) s2c.seeds[s2c.cursorpos] = 0;
		s2c.rewrite++;
	}
	if(sys.Trg&A_BUTTON){			//キューブ計算処理
		num=0;
		for(i=0;i<4;i++){
			if(s2c.seeds[i]!=NORMAL_SEED_TYPE_MAX){
				num++;
				mix[i] = s2c.seeds[i];
				KinomiWorkSet(&kinomi[i],s2c.seeds[i]+ITEM_SEED_START);
			}else{
				break;
			}
		}
		if(num>=2){
			FuncSeed2Cube(kinomi,&s2c.cube,num,s2c.work,(u16)s2c.bpm);
			s2c.rewrite++;
		}else{
			s2c.cube.type=0xff;
		}
	}
	if(s2c.rewrite){
		write_info();
		s2c.rewrite = 0;
	}

	//セレクトボタンを押すと乱数テストが開始される	
	if(sys.Trg&SELECT_BUTTON){
		if(!randomtestflag){
			randomtestflag++;
			randomcount = 0;
			pp_srand(sys.main_timer);
		}
	}
	if(randomtestflag)
		randomtestfunc2();
}


static const u8 RET[2] = {CR_,EOM_};

//-------------------------------------------------------------------------
//「キューブテスト」画面メインルーチン
//-------------------------------------------------------------------------
void BlendTestMain(void)
{
	

	//キューブ計算デバッグ
	seed2cubepadfunc();

	MainTask();
	JumpActor();
	SetActor();
	PaletteAnime();
};

#define B_SCORE_WIN_X	6
#define B_SCORE_WIN_Y	3
#define B_SCORE_WIN_X2	23
#define B_SCORE_WIN_Y2	16

#define B_SCORE_TITLE_X	8
#define B_SCORE_TITLE_Y	4

#define B_SCORE_LIST_X	8
#define B_SCORE_LIST_Y	9

#define B_SCORE_SCORE_X	(B_SCORE_LIST_X+5)
#define B_SCORE_SCORE_Y	B_SCORE_LIST_Y

static const u8 str_title[]={
	ki_,no_,mi_,BU_,RE_,N_,DA_,bou_,CR_,sa_,i_,ko_,u_,so_,ku_,do_,spc_,RA_,N_,KI_,N_,GU_,gyoe_,EOM_,
};

static const u8 str_koumoku[]={
	hu_,ta_,ri_,CR_,sa_,n_,ni_,n_,CR_,yo_,ni_,n_,EOM_,
};


//-------------------------------------------------------------------------
//	対戦成績の表示
//-------------------------------------------------------------------------
void PutBlendMachineScoreWindow( void )
{
	int i;
	u32 work;
	u8  strbuf[30];
	u8 *p;

	NMenuWinBoxWrite( B_SCORE_WIN_X, B_SCORE_WIN_Y, B_SCORE_WIN_X2, B_SCORE_WIN_Y2 );

	NMenuMsgWrite( str_title, B_SCORE_TITLE_X, B_SCORE_TITLE_Y );

	NMenuMsgWrite( str_koumoku, B_SCORE_LIST_X, B_SCORE_LIST_Y );
	for ( i=0; i< 3; i++ ) {
//		work = RotateSpeed2rpm(Fld.NormalBPMRecord[i]);
		work = Fld.NormalBPMRecord[i];
		p = PM_NumMsgSet(strbuf, work/100, NUM_MODE_SPACE, 3);
		p = PM_strcat(p,konmamsg);
		p = PM_NumMsgSet(p, work%100, NUM_MODE_ZERO, 2);
		PM_strcat(p,kmmsg);
		NMenuMsgWrite( strbuf, B_SCORE_SCORE_X, B_SCORE_SCORE_Y+2*i);
	}
}


// =================================================================
// ItemJingle2ContestBgm
// 概要  : ポロックを受け取るジングルを鳴らした後、コンテスト会場のＢＧＭに戻す
// 引数  : no
// 戻り値: none
// =================================================================
void ItemJingle2ContestBgm(u8 no)
{
	if(TaskTable[no].work[0]==0){
		JinglePlay(MUS_FANFA1);
		TaskTable[no].work[0]++;
	}
	
	if(JingleWait()){
		MusicPlay(bmw->nowsong);
		DelTask(no);
	}
}