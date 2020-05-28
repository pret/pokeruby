//======================================================
//
//    teach.c
//
//    おしえマニア                                  
//                                                      
//    Copyright (C) 2001 GAME FREAK inc.
//======================================================

//命中率０は「－」
//ダメージ１か０は「－」

#include "common.h"
#include "intr.h"
#include "actor.h"
#include "actanm.h"
#include "madefine.h"
#include "palanm.h"
#include "task.h"
#include "agbmons.h"
#include "calctool.h"
#include "mus_tool.h"
#include "print.h"
#include "pm_str.h"
#include "script.h"
#include "wazatool.h"
#include "gamedata.h"
#include "config.h"
#include "ev_fight.h"
#include "..\script\saveflag.h"
#include "fld_main.h"
#include "fld_task.h"
#include "contest.h"
#include "con_tool.h"

#include "server.h"
#include "pokelist.h"
#include "f_pmlist.h"
#include "poketool.h"
#include "zukan.h"
#include "p_status.h"

#include "..\scaddata\teachcur.acl"
#include "..\scaddata\teachcur.ach"



// =================================================================
// extern
// =================================================================
extern const	u8	WazaNameData[][8];
extern const 	u8	ZokuseiMsg[][5];
extern const	u8	WazaInfo[][56];
extern const	WazaTblDat	WTD[];
extern const    u8  str_bou3[];
extern const    u8  dummy_string[];

// =================================================================
// 関数プロトタイプ
// =================================================================
void OshieManiaInit();
static void FightListPut(u8 flg);
static void ContestListPut(u8 flg);
static void FightListMain();
static void ContestListMain();
static void SeqMain();
void OshieManiaMain();
static void teachwork_init();
static void TeachActorSet();
static void WazaListPut();
static void WazaListControl();
static void GetWazaParameter();
static void WazaInfoWrite(u8 info);
static void TeachWindowPut();
static void InitFadeWait( u8 id );


// =================================================================
// 定義
// =================================================================
#define WAZANAME_MAX	8			//名前の最大
#define WAZALIST_MAX	25			//リスト項目の最大
#define WAZALIST_APPEAR	6			//一度に表示できる最大

static const u8 commonwindow_tbl[][4]={		//ウインドウ描画位置
	{ 0, 0,19,13},
	{20, 0,29,13},
	{ 2,14,27,19},
};

static const u8 explain1_mes[]={ta_,ta_,ka_,u_,wa_,za_,EOM_,};
static const u8 explain2_mes[]={KO_,N_,TE_,SU_,TO_,wa_,za_,EOM_,};
static const u8 type_mes[]={TA_,I_,PU_,sura_,EOM_,};
static const u8 pp_mes[]={P__,P__,sura_,EOM_,};
static const u8 iryoku_mes[]={i_,ri_,yyo_,ku_,sura_,EOM_,};
static const u8 hit_mes[]={me_,i_,ti_,yyu_,u_,sura_,EOM_,};
static const u8 apear_mes[]={A_,PI_,bou_,RU_,EOM_,};
static const u8 bougai_mes[]={bo_,u_,ga_,i_,EOM_,};

typedef struct{
	const u8 	*mes;
	u8 			x,y;
	u16			flag;
	
}TEACH_ITEM;

static const TEACH_ITEM hyouji_item[2][5]={		//メッセージ表示用リスト
	{
		{explain1_mes,	7,1,0},
		{type_mes,		 1, 4, 1},
		{iryoku_mes,	11, 4, 2},
		{pp_mes,	     2, 6, 3},
		{hit_mes,		10, 6, 4},
	},
	{
		{explain2_mes,	 7, 1, 0},
		{type_mes,		 1, 4, 5},
//		{pp_mes,		11, 4, 6},
		{apear_mes,		 1, 6, 7},
		{bougai_mes,	11, 6, 8},
	},
};

static const u8 teach1_mes[]={I_MSG_,STR_TEMP_BUF0,ni_,spc_,do_,no_,wa_,za_,wo_,spc_,o_,bo_,e_,sa_,se_,ru_,hate_,EOM_,};
static const u8 teach2_mes[]={
	I_MSG_,STR_TEMP_BUF1,wo_,spc_,o_,bo_,e_,sa_,se_,ma_,su_,ka_,hate_,EOM_,
};

static const u8 teach3_mes[]={
	I_MSG_,STR_TEMP_BUF0,ha_,spc_,a_,ta_,ra_,si_,ku_,CR_,
	I_MSG_,STR_TEMP_BUF1,wo_,spc_,o_,bo_,e_,ta_,gyoe_,EOM_,
};


static const u8 teach4_mes[]={
	I_MSG_,STR_TEMP_BUF0,ha_,spc_,a_,ta_,ra_,si_,ku_,spc_,CR_,
	I_MSG_,STR_TEMP_BUF1,wo_,spc_,o_,bo_,e_,ta_,i_,tenten_,gyoe_,NORMAL_WAIT_,
	si_,ka_,si_,spc_,I_MSG_,STR_TEMP_BUF0,ha_,spc_,wa_,za_,wo_,spc_,n4_,tu_,CR_,
	o_,bo_,e_,te_,i_,ru_,no_,de_,spc_,se_,i_,i_,ttu_,pa_,i_,da_,gyoe_,NORMAL_WAIT_,
	I_MSG_,STR_TEMP_BUF1,no_,spc_,ka_,wa_,ri_,ni_,spc_,ho_,ka_,no_,spc_,wa_,za_,wo_,CR_,wa_,su_,re_,sa_,se_,ma_,su_,ka_,hate_,EOM_,
};

static const u8 teach5_mes[]={
	so_,re_,de_,ha_,tenten_,tenten_,spc_,I_MSG_,STR_TEMP_BUF1,wo_,CR_,
	o_,bo_,e_,ru_,no_,wo_,spc_,a_,ki_,ra_,me_,ma_,su_,ka_,hate_,EOM_,
};

static const u8 teach6_mes[]={
	CTRL_,C_WAIT_,0x20,
	n1_,spc_,CTRL_,C_WAIT_,0xf,
	n2_,no_,spc_,CTRL_,C_WAIT_,0xf,
	tenten_,CTRL_,C_WAIT_,0xf,
	tenten_,CTRL_,C_WAIT_,0xf,
	tenten_,spc_,CTRL_,C_WAIT_,0xf,
//	CTRL_,C_MUSPLAY_,(SE_KON&0xff),((SE_KON&0xff00)>>8),PO_,KA_,N_,gyoe_,NORMAL_WAIT_,
//	C_MUSPLAYはMusicPlayをコールしているので、SEはSePlayで鳴らしたいので、
//	C_SEPLAY_というコマンドを追加
//	changed by soga 2002.09.29
	CTRL_,C_SEPLAY_,(SE_KON&0xff),((SE_KON&0xff00)>>8),PO_,KA_,N_,gyoe_,NORMAL_WAIT_,
	EOM_,
};
static const u8 teach6_1_mes[]={
	I_MSG_,STR_TEMP_BUF0,ha_,spc_,I_MSG_,STR_TEMP_BUF2,no_,spc_,tu_,ka_,i_,ka_,ta_,wo_,CR_,ki_,re_,i_,ni_,spc_,wa_,su_,re_,ta_,gyoe_,NORMAL_WAIT_,
	so_,si_,te_,tenten_,gyoe_,NORMAL_WAIT_,
	I_MSG_,STR_TEMP_BUF0,ha_,spc_,a_,ta_,ra_,si_,ku_,CR_,I_MSG_,STR_TEMP_BUF1,wo_,spc_,o_,bo_,e_,ta_,gyoe_,EOM_,
};

static const u8 teach7_mes[]={
	I_MSG_,STR_TEMP_BUF0,ha_,spc_,I_MSG_,STR_TEMP_BUF1,wo_,spc_,o_,bo_,e_,zu_,ni_,spc_,o_,wa_,ttu_,ta_,gyoe_,EOM_,
};

static const u8 teach8_mes[]={
	I_MSG_,STR_TEMP_BUF0,ni_,spc_,wa_,za_,wo_,spc_,o_,bo_,e_,sa_,se_,ru_,no_,wo_,CR_,a_,ki_,ra_,me_,ma_,su_,ka_,hate_,EOM_,
};
static const u8 teach9_mes[]={
	do_,no_,spc_,wa_,za_,wo_,CR_,wa_,su_,re_,sa_,se_,ta_,i_,hate_,NORMAL_WAIT_,EOM_,
};

static const u8 modoru_mes[]={	mo_,do_,ru_,EOM_};
static const u8 arrow_mes[][2]={	{cursor_,EOM_,},	{spc_, EOM_}};

// =================================================================
// 構造体
// =================================================================
typedef struct{				//選択リスト用構造体
	u8 pos;				//表示位置
	u8 top;				//リスト表示先頭
	u8 max;				//リスト項目数MAX
	u8 select;			//現在選択アイテム
	u8 old;				//過去表示場所
	u8 rewrite_cursor;	//カーソル再描画フラグ
	u8 rewrite;			//リスト再描画フラグ
}LIST;

typedef struct{
	u8  	seq;		//メインシーケンス
	u8  	end;		
	u8		yesno;		
	u8		actno[4+16];	//アクター番号保存(enumでも制御)
	LIST	list;		//リスト構造体
	u16		wazalist[WAZALIST_MAX];					//ポケモンが覚えられる技番号
	u8      wazaname[WAZALIST_MAX][WAZANAME_MAX];	//ポケモンが覚えられる技の名前
	u8		inforewrite;							//説明画面再描画フラグ
	u8		info;									//コンテスト説明か戦闘説明か
	u8		pokeno;									//てもちﾎﾟｹﾓﾝの何番目か
	u8		forget;									//忘れることにしたワザの番号
	u8		returnnum;						
}TEACHMANIA_WORK;

static TEACHMANIA_WORK *tmw;		//ワーク定義



// =================================================================
// アクター定義
// =================================================================
static void teacharrowMove(actWork *Xreg);


//アクター用データ
static const ActOamData TeachCursorOamData[] = {
	{0,0,0,OFF,0,0,0,0,0,0,0,0,0,},	//8x16
	{0,0,0,OFF,0,2,0,0,0,0,0,0,0,},	//8x16
	{0,0,0,OFF,0,1,0,0,0,0,0,0,0,},	//16x8
};

static const actAnm cursorAnm0[]={		//横移動用カーソル左
		{OBJ16_8x16*1,5,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm cursorAnm1[]={		//横移動用カーソル右
		{OBJ16_8x16*0,5,0,0},
		{ACT_ANMEND,0,0,0}
};

static const actAnm *const CursorAnmTbl[]={
		cursorAnm0,
		cursorAnm1,
};


//アニメーションデータフォーマット
/*
	s16 pat;	        //ｷｬﾗｸﾀｰﾃﾞｰﾀﾅﾝﾊﾞｰ
	u8 	wait:6;		//ｳｪｲﾄ
	u8 	hrev:1;		//H反転
	u8 	vrev:1;		//V反転
*/

static const CellData CursorActCell[]={
	{teachcur_Character,(0x20*2)*4+0x20*4,5525},
};

static const PalData CursorActPal = 
{
	teachcur_Palette,
	5526,
};

//-------------------------------------------------------------
//		アクターヘッダー
//-------------------------------------------------------------

static const	actHeader CursorHeader={		//横移動矢印
		5525,
		5526,
		&TeachCursorOamData[1],
		CursorAnmTbl,
		ACT_NTRANS,
		DummyActAffTbl,
		teacharrowMove,
};

//-------------------------------------------------------------
//		アニメ定義
//-------------------------------------------------------------

static const actAnm cursorAnm4[]={		//縦移動矢印下向き
		{OBJ16_16x8*2,5,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm cursorAnm5[]={		//縦移動矢印上向き
		{OBJ16_16x8*3,5,0,0},
		{ACT_ANMEND,0,0,0}
};

static const actAnm *const CursorAnmTbl2[]={
	cursorAnm4,
	cursorAnm5,
};

//-------------------------------------------------------------
//		アクターヘッダー
//-------------------------------------------------------------

static const	actHeader CursorHeader2={		//縦移動矢印
		5525,
		5526,
		&TeachCursorOamData[2],
		CursorAnmTbl2,
		ACT_NTRANS,
		DummyActAffTbl,
		teacharrowMove,
};

//-------------------------------------------------------------
//		アニメ定義
//-------------------------------------------------------------

static const actAnm HeartAnm0[]={		//赤い中身の無いハート
		{OBJ16_8x8*8,5,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm HeartAnm1[]={		//赤いハート
		{OBJ16_8x8*9,5,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm HeartAnm2[]={		//黒い中身の無いハート
		{OBJ16_8x8*10,5,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm HeartAnm3[]={		//黒いハート
		{OBJ16_8x8*11,5,0,0},
		{ACT_ANMEND,0,0,0}
};

static const actAnm *const HeartAnmTbl[]={
	HeartAnm0,
	HeartAnm1,
	HeartAnm2,
	HeartAnm3,
};

//-------------------------------------------------------------
//		アクターヘッダー
//-------------------------------------------------------------

static const	actHeader HeartHeader={		//ハート
		5525,
		5526,
		&TeachCursorOamData[0],
		HeartAnmTbl,
		ACT_NTRANS,
		DummyActAffTbl,
		teacharrowMove,
};

// ============================================================
// アクター番号
// ============================================================
enum{
	LEFTARROW_NO = 0,
	RIGHTARROW_NO,
	UPARROW_NO,
	DOWNARROW_NO,
	HEART1_NO,		//赤
	HEART2_NO,		//赤
	HEART3_NO,		//赤
	HEART4_NO,		//赤
	HEART5_NO,		//赤
	HEART6_NO,		//赤
	HEART7_NO,		//赤
	HEART8_NO,		//赤
	BLACKHEART1_NO, 
	BLACKHEART2_NO, 
	BLACKHEART3_NO, 
	BLACKHEART4_NO, 
	BLACKHEART5_NO, 
	BLACKHEART6_NO, 
	BLACKHEART7_NO, 
	BLACKHEART8_NO, 
};



/********************************************************************/
/*                                                                  */
/*				割り込み											*/
/*                                                                  */
/********************************************************************/
static void VInterFunc( void )
{

	actOAMtrans();						//ｱｸﾀｰ転送処理1
	actDMAtrans();						//ｱｸﾀｰ転送処理2
	PaletteFadeTrans();
}


// =================================================================
// WazaWasureCall
// 概要  : ワザおしえマニアを外部スクリプトからの呼び出す
// 引数  : none
// 戻り値: none
// =================================================================
void WazaOshieManiaCall(void)
{
	u8	id;

	SetForceEvent();
	id = AddTask( InitFadeWait, 10 );
	PaletteFadeReq( 0xffffffff, 0, 0, 16, 0 );
}



static void InitFadeWait( u8 id )
{
	if( !(FadeData.fade_sw) ){
		MainProcChange(OshieManiaInit);
		pFieldRecoverFunc = AddScriptFieldInTask;
//		FadeData.trans_stop = 1;
		DelTask(id);
	}
}




static const u8 testname []={a_,ki_,to_,EOM_};
// =================================================================
// OshieManiaInit
// 概要  : 技おしえマニア画面初期化
// 引数  : none
// 戻り値: none
// =================================================================
void OshieManiaInit()
{
	*(vu16 *)REG_DISPCNT = 	0;	// BGモード 

	InitActor();				//アクター初期化
	ObjPalManInit();			//OBJパレットマネージャー初期化
	InitTask();

	tmw = (TEACHMANIA_WORK*)&UserWork[0x17000];

	teachwork_init();		//ワーク初期化
	tmw->pokeno = ScriptParameter0;			//スクリプト呼び出し時のパラメータを取得

	GetWazaParameter();		//スクリプトからの呼び出された時のパラメータを取得
	

	SetVBlankFunc(VInterFunc);


	PrintScreenInit(FIELD_MENU_TYPE);
	NMenuScreenInit(FIELD_MENU_TYPE);
	NMenuScreenClear();
	


	*(vu16 *)REG_BG0VOFS = 0;
	*(vu16 *)REG_BG0HOFS = 0;


	CellSet((CellData *)&CursorActCell);	//セルセット
	ObjPalSet((PalData *)&CursorActPal);	//パレットセット
	
	TeachActorSet();

//	AddTask(CheckParent,0);

	PaletteWorkClear(0x0000, 0, 2);
	MainTask();
	JumpActor();
	SetActor();
	PaletteAnime();
	
	MainProcChange(OshieManiaMain);

	
}

// =================================================================
// OshieManiaReturnInit
// 概要  : 戻ってきた時用
// 引数  : none
// 戻り値: none
// =================================================================
void OshieManiaReturnInit()
{
	InitActor();				//アクター初期化
	ObjPalManInit();			//OBJパレットマネージャー初期化
	InitTask();

	tmw = (TEACHMANIA_WORK*)&UserWork[0x17000];

	GetWazaParameter();			//
	
	tmw->forget = ScriptParameter1;	//ワザわすれリストの結果を取得

	SetVBlankFunc(VInterFunc);


	PrintScreenInit(FIELD_MENU_TYPE);
	NMenuScreenInit(FIELD_MENU_TYPE);
	NMenuScreenClear();
	

	*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
                          |	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
						  | DISP_BG0_ON					// BG0有効
						  | DISP_OBJ_ON					// OBJ有効
						;

	*(vu16 *)REG_BG0VOFS = 0;
	*(vu16 *)REG_BG0HOFS = 0;


	CellSet((CellData *)&CursorActCell);	//セルセット
	ObjPalSet((PalData *)&CursorActPal);	//パレットセット
	
	TeachActorSet();

	PaletteWorkClear(0x0000, 0, 2);

	MainTask();
	JumpActor();
	SetActor();
	PaletteAnime();
	
	MainProcChange(OshieManiaMain);

}

// =================================================================
// OshieManiaMain
// 概要  : 技おしえマニア画面メイン
// 引数  : none
// 戻り値: none
// =================================================================
void OshieManiaMain()
{
	SeqMain();
	if(tmw->list.rewrite_cursor){
		tmw->list.rewrite_cursor = 0;
		NMenuMsgWrite(arrow_mes[1],21,tmw->list.old*2+1);
		NMenuMsgWrite(arrow_mes[0],21,tmw->list.pos*2+1);
	}
	if(tmw->list.rewrite){
		tmw->list.rewrite = 0;
		WazaListPut();
	}
	if(tmw->inforewrite){
		WazaInfoWrite(tmw->info);
		tmw->inforewrite = 0;
	}


	MainTask();
	JumpActor();
	SetActor();
	PaletteAnime();
	
}


enum{
	TEACHMAIN_INIT,
	TEACHMAIN_FADEIN,
	TEACHMAIN_MESWAIT,

	TEACHMAIN_FIGHT_SET,	
	TEACHMAIN_FIGHT,	
	TEACHMAIN_CONTEST_SET,	
	TEACHMAIN_CONTEST,	
	TEACHMAIN_MAIN,
	TEACHMAIN_YESNO_MES,
	TEACHMAIN_YESNO,
	TEACHMAIN_REWRITE,
	TEACHMAIN_MES,
//	TEACHMAIN_MESWAIT,
	TEACHMAIN_END_MES,
	TEACHMAIN_END_YESNO,
	TEACHMAIN_FADEOUT,
	TEACHMAIN_FADEOUTWAIT,


	TEACHMAIN_FULL_MES_SET,
	TEACHMAIN_FULL_MES,
	TEACHMAIN_FULL_YESNO,
	WAZAWASURE_MES_WAIT,
	WAZAWASURE_FADEOUT,
	TEACHMAIN_SUCCESS_MES,
	WAZAWASURE_FADEIN,
	WAZAWASURE_FADEIN_WAIT,


	WAZAAKIRAME_MES_SET,
	WAZAAKIRAME_MES,
	WAZAAKIRAME_YESNO,							//ワザを覚えるのをあきらめますか？
	TEACHMAIN_BACK,

	TEACHRETURN_INIT,
	TEACHRETURN_WAIT,
	TEACHRETURN_WASURE_MES,
	TEACHRETURN_OBOE_MES,
	TEACHRETURN_JINGLE_WAIT,
	TEACHRETURN_ENDBUTTON_WAIT,

};


// =================================================================
// PutSystemMes
// 概要  : 下段のシステムメッセージをTalkで表示する
// 引数  : mes
// 戻り値: none
// =================================================================
static void PutSystemMes(const u8 mes[])
{
	PM_MsgExpand(MsgExpandBuffer,mes);	
	NMenuTalkMsgSet(MsgExpandBuffer,3,15);
}

// =================================================================
// SeqMain
// 概要  : シーケンス制御
// 引数  : none
// 戻り値: none
// =================================================================
static void SeqMain()
{
	s8  no;
	u16 waza;
	switch(tmw->seq){
		case TEACHMAIN_INIT:			//初期化
			tmw->seq++;
			TeachWindowPut();
			FightListPut(0);
			WazaListPut();
			ActWork[RIGHTARROW_NO].x = 112;
			tmw->inforewrite = 1;
			PaletteFadeReq(0xffffffff,0,16,0,0);
			*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
                          |	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
						  | DISP_BG0_ON					// BG0有効
						  | DISP_OBJ_ON					// OBJ有効
						;
			break;
		case TEACHMAIN_FADEIN:			//フェードイン
			if(FadeData.fade_sw == 0){
				tmw->seq = TEACHMAIN_FIGHT;
			}
			break;
		case TEACHMAIN_MESWAIT:
//			if(NMenuTalkMsgPut()) 
				tmw->seq++;
			break;
		case TEACHMAIN_FIGHT_SET:		//戦闘用ワザ説明表示
			FightListPut(0);
			WazaListPut();
			tmw->inforewrite = 1;
			tmw->seq++;
			ActWork[RIGHTARROW_NO].x = 112;
			break;
		case TEACHMAIN_FIGHT:			//戦闘画面で選択
			FightListMain();
			WazaListControl();
			break;
		case TEACHMAIN_CONTEST_SET:		//コンテスト用ワザ説明表示
			ContestListPut(0);
			WazaListPut();
			tmw->inforewrite = 1;
			ActWork[RIGHTARROW_NO].x = 112+8;
			tmw->seq++;
			break;
		case TEACHMAIN_CONTEST:			//コンテスト画面で選択
			ContestListMain();
			WazaListControl();
			break;
		case TEACHMAIN_YESNO_MES:		//わざをおぼえますか？表示
			if(NMenuTalkMsgPut()){
				YesNoSelectInit(21,7);
				tmw->seq++;
			}
			break;
		case TEACHMAIN_YESNO:			//わざを覚えるか選択
				no = YesNoSelectMain();
				//ワザを覚える
				if(no==CURSOR_YES_VALUE){
					if(PokeWazaSet(&PokeParaMine[tmw->pokeno],tmw->wazalist[tmw->list.select])!=NO_WAZA_SET){
						PutSystemMes(teach3_mes);	//覚えた。
						ScriptParameter0 = 1;	
						tmw->seq = TEACHRETURN_OBOE_MES;
					}else{							//いっぱいで覚えられなかった
						WazaListPut();
						tmw->seq = TEACHMAIN_FULL_MES_SET;
					}
				}else if (no==CURSOR_CANCEL_VALUE || no==CURSOR_NO_VALUE){
					if(tmw->info==0) tmw->seq = TEACHMAIN_FIGHT_SET;
					if(tmw->info==1) tmw->seq = TEACHMAIN_CONTEST_SET;
				}
				break;

		case TEACHMAIN_END_MES:				//やめますか？表示
			if(NMenuTalkMsgPut()){
				YesNoSelectInit(21,7);	
				tmw->seq++;
			}
			break;
		case TEACHMAIN_END_YESNO:			//やめますか？選択
			no = YesNoSelectMain();
			if(no==CURSOR_YES_VALUE){
				ScriptParameter0 = 0;			//ワザをあきらめた。
				tmw->seq = TEACHMAIN_FADEOUT;
			}else if (no==CURSOR_CANCEL_VALUE || no==CURSOR_NO_VALUE){
				if(tmw->info==0) tmw->seq = TEACHMAIN_FIGHT_SET;
				if(tmw->info==1) tmw->seq = TEACHMAIN_CONTEST_SET;
			}
			break;

		case TEACHMAIN_FULL_MES_SET:
			PutSystemMes(teach4_mes);					//ワザがいっぱいで覚えられない
			tmw->seq++;
			break;

		case TEACHMAIN_FULL_MES:
			if(NMenuTalkMsgPut()){
				YesNoSelectInit(21,7);	
				tmw->seq = TEACHMAIN_FULL_YESNO;
			}
			break;
		case TEACHMAIN_FULL_YESNO:					//ワザがいっぱいです、忘れますか？
			no = YesNoSelectMain();
			if(no==CURSOR_YES_VALUE){									//はい
				PutSystemMes(teach9_mes);
				tmw->seq = WAZAWASURE_MES_WAIT;
			}else if (no==CURSOR_CANCEL_VALUE || no==CURSOR_NO_VALUE){	//いいえ
				WazaListPut();
				tmw->seq = WAZAAKIRAME_MES_SET;	
			}
			break;
		
		case WAZAAKIRAME_MES_SET:
			PutSystemMes(teach5_mes);	
			tmw->seq++;
			break;
		case WAZAAKIRAME_MES:
			if(NMenuTalkMsgPut()){
				tmw->seq = WAZAAKIRAME_YESNO;
				YesNoSelectInit(21,7);	
			}
			break;
		case WAZAAKIRAME_YESNO:							//ワザを覚えるのをあきらめますか？
			no = YesNoSelectMain();
			if(no==CURSOR_YES_VALUE){									//はい
				tmw->seq = TEACHMAIN_BACK;
			}else if (no==CURSOR_CANCEL_VALUE || no==CURSOR_NO_VALUE){	//いいえ
				WazaListPut();
				if(tmw->info==0) tmw->seq = TEACHMAIN_FIGHT_SET;
				if(tmw->info==1) tmw->seq = TEACHMAIN_CONTEST_SET;
				tmw->seq = TEACHMAIN_FULL_MES_SET;
			}
			break;
		case TEACHMAIN_BACK:
			if(NMenuTalkMsgPut()){
				if(tmw->info==0) tmw->seq = TEACHMAIN_FIGHT_SET;
				if(tmw->info==1) tmw->seq = TEACHMAIN_CONTEST_SET;
			}
			break;
		
		
		case WAZAWASURE_MES_WAIT:
			if(NMenuTalkMsgPut()){
				tmw->seq = WAZAWASURE_FADEOUT;
				PaletteFadeReq(0xffffffff,0,0,16,0);
			}
			break;
		case WAZAWASURE_FADEOUT:
			if(FadeData.fade_sw == 0){
				PokeNewWazaSet(PokeParaMine,tmw->pokeno,
					PokeCountMine-1,OshieManiaReturnInit,tmw->wazalist[tmw->list.select]);
				tmw->seq = TEACHRETURN_INIT;
			}
			break;
		case TEACHMAIN_SUCCESS_MES:
			if(NMenuTalkMsgPut()){
				tmw->seq = TEACHMAIN_FADEOUT;
			}
			break;
		case WAZAWASURE_FADEIN:
			PaletteFadeReq(0xffffffff,0,16,0,0);
			break;
		case WAZAWASURE_FADEIN_WAIT:
			break;

		case TEACHMAIN_FADEOUT:
			PaletteFadeReq(0xffffffff,0,0,16,0);
			tmw->seq++;
			break;
		case TEACHMAIN_FADEOUTWAIT:
			if(FadeData.fade_sw == 0){
				MainProcChange(FieldMainRecover);
			}
			break;
		case TEACHRETURN_INIT:
			PaletteFadeReq(0xffffffff,0,16,0,0);
			tmw->seq++;
			TeachWindowPut();
			WazaListPut();
			if(tmw->info==0) FightListPut(1);
			if(tmw->info==1){
				ActWork[RIGHTARROW_NO].x = 112+8;
				ContestListPut(1);
			}
			WazaInfoWrite(tmw->info);
			break;
		case TEACHRETURN_WAIT:
			if(FadeData.fade_sw == 0){
				if(tmw->forget==4){
					tmw->seq = WAZAAKIRAME_MES_SET;
				}else{
					//指定の場所にワザを入れる
					waza = PokeParaGet(&PokeParaMine[tmw->pokeno],ID_waza1+tmw->forget);
					PM_strcpy(StrTempBuffer2,WazaNameData[waza]);

					PokePPCountClear(&PokeParaMine[tmw->pokeno],tmw->forget);		//ＰＰをクリア
					PokeWazaSetPos(&PokeParaMine[tmw->pokeno],tmw->wazalist[tmw->list.select],tmw->forget);
					PM_strcpy(StrTempBuffer1,WazaNameData[tmw->wazalist[tmw->list.select]]);
					PutSystemMes(teach6_mes);					//１，２のポカン！…
					tmw->seq = TEACHRETURN_WASURE_MES;
					ScriptParameter0 = 1;	
				}
			}
			break;
		case TEACHRETURN_WASURE_MES:
			if(NMenuTalkMsgPut()){
//				SePlay(SE_KON);
				PutSystemMes(teach6_1_mes);
				tmw->seq = TEACHRETURN_OBOE_MES;
				JinglePlay(MUS_FANFA1);
			}
			break;
		case TEACHRETURN_OBOE_MES:
			if(NMenuTalkMsgPut()){
				JinglePlay(MUS_FANFA1);
				tmw->seq = TEACHRETURN_JINGLE_WAIT;
			}
			break;
		case TEACHRETURN_JINGLE_WAIT:
			if(JingleWait()){
				tmw->seq = TEACHRETURN_ENDBUTTON_WAIT;
			}
			break;
		case TEACHRETURN_ENDBUTTON_WAIT:
			if(sys.Trg&A_BUTTON){
				SePlay(SE_SELECT);
				tmw->seq = TEACHMAIN_FADEOUT;
			}
			break;
	}
}

// =================================================================
// TeachWindowPut
// 概要  : わざおしえマニア画面用のウインドウを表示
// 引数  : none
// 戻り値: none
// =================================================================
static void TeachWindowPut()
{
	int i;
	for(i=0;i<3;i++)
		NMenuWinBoxWrite(commonwindow_tbl[i][0], commonwindow_tbl[i][1], 
						commonwindow_tbl[i][2],commonwindow_tbl[i][3]);
}
// =================================================================
// FightListPut
// 概要  : 戦闘用技リスト表示
// 引数  : none
// 戻り値: none
// =================================================================
static void FightListPut(u8 flg)
{
	int i;


	for(i=0;i<1;i++)
		NMenuWinBoxWrite(commonwindow_tbl[i][0], commonwindow_tbl[i][1], 
						commonwindow_tbl[i][2],commonwindow_tbl[i][3]);
	ActWork[tmw->actno[LEFTARROW_NO]].banish = 0;
	ActWork[tmw->actno[RIGHTARROW_NO]].banish = 0;
	for(i=0;i<16;i++)
		ActWork[tmw->actno[HEART1_NO+i]].banish = 1;

	for(i=0;i<5;i++){
		NMenuMsgWrite(hyouji_item[0][i].mes, hyouji_item[0][i].x, hyouji_item[0][i].y);
	}
	NMenuBoxWrite(1,9,18,9+3);
	NMenuBoxWrite(3,15,26,18);
	if(flg==0){
		PM_MsgExpand(MsgExpandBuffer,teach1_mes);
		NMenuMsgWrite(MsgExpandBuffer,3,15);
	}

}



// =================================================================
// FightListMain
// 概要  : たたかいわざのリスト画面のキーコントロール
// 引数  : none
// 戻り値: none
// =================================================================
static void FightListMain()
{
	u8 flag;
	flag = 0;
	if(sys.Trg&L_KEY || sys.Trg&R_KEY)
		flag++;
	
	if(MyData.key_config == CNT_MD_LR)
		if(sys.Trg&R_BUTTON || sys.Trg&L_BUTTON)
			flag++;

	if(flag){
		SePlay(SE_SELECT);
		tmw->seq = TEACHMAIN_CONTEST_SET;
		tmw->info = 1;
	}
}
// =================================================================
// ContestListPut
// 概要  : コンテスト用技リスト表示
// 引数  : none
// 戻り値: none
// =================================================================
static void ContestListPut(u8 flg)
{
	int i;

	for(i=0;i<1;i++)
		NMenuWinBoxWrite(commonwindow_tbl[i][0], commonwindow_tbl[i][1], 
						commonwindow_tbl[i][2],commonwindow_tbl[i][3]);

	ActWork[tmw->actno[LEFTARROW_NO]].banish  = 0;
	ActWork[tmw->actno[RIGHTARROW_NO]].banish = 0;
	for(i=0;i<16;i++)
		ActWork[tmw->actno[HEART1_NO+i]].banish = 0;

	for(i=0;i<4;i++){
		NMenuMsgWrite(hyouji_item[1][i].mes, hyouji_item[1][i].x, hyouji_item[1][i].y);
	}
	NMenuBoxWrite(1,9,18,9+3);
	NMenuBoxWrite(3,15,26,18);
	if(flg==0){
		PM_MsgExpand(MsgExpandBuffer,teach1_mes);
		NMenuMsgWrite(MsgExpandBuffer,3,15);
	}
}


// =================================================================
// ContestListMain
// 概要  : コンテスト技の時のキーコントロール
// 引数  : none
// 戻り値: none
// =================================================================
static void ContestListMain()
{
	u8 flag;
	flag = 0;
	if(sys.Trg&L_KEY||sys.Trg&R_KEY)
		flag++;

	if(MyData.key_config == CNT_MD_LR)
		if(sys.Trg&R_BUTTON || sys.Trg&L_BUTTON)
			flag++;

	if(flag){
		SePlay(SE_SELECT);
		tmw->seq = TEACHMAIN_FIGHT_SET;
		tmw->info = 0;
	}

}

// =================================================================
// teachwork_init
// 概要  : ワーク初期化
// 引数  : none
// 戻り値: none
// =================================================================
static void teachwork_init()
{
	int i;
	
	tmw->seq   = 0;
	tmw->yesno = 0;

	tmw->list.top = 0;
	tmw->list.pos = 0;
	tmw->list.old = 0;
	tmw->list.max = 0;
	tmw->list.select = 0;
	tmw->list.rewrite_cursor = 0;
	tmw->list.rewrite = 0;
	tmw->inforewrite = 0;
	tmw->info = 0;
	for(i=0;i<20;i++) tmw->wazalist[i] = 0;

}

// =================================================================
// teacharrowMove
// 概要  : アクターシーケンス
// 引数  : Xreg
// 戻り値: none
// =================================================================
static void teacharrowMove(actWork *Xreg)
{
	u16 work;
	work = (Xreg->work[1]*10)&0xff;
	switch(Xreg->work[0]){
		case 0:			//動き無し
			break;
		case 1:			//横揺れ
			Xreg->dx = SinMove(work, 3)*Xreg->work[2];
			
			break;
		case 2:			//縦揺れ
			Xreg->dy = SinMove(work, 1)*Xreg->work[2];
			break;
	}
	Xreg->work[1]++;

}

// =================================================================
// 	TeachActorSet
// 概要  : 画面表示用のアクターをすべてセット
// 引数  : none
// 戻り値: none
// =================================================================
static void 	TeachActorSet()
{
	int i;
	
	tmw->actno[0] = AddActor(&CursorHeader,48,16,0);		//横移動矢印左
	ActWork[tmw->actno[0]].work[0] = 1;
	ActWork[tmw->actno[0]].work[2] = -1;
	
	tmw->actno[1] = AddActor(&CursorHeader,112,16,0);		//横移動矢印右
	ActAnmChg(&ActWork[tmw->actno[1]],1);
	ActWork[tmw->actno[1]].work[0] = 1;
	ActWork[tmw->actno[1]].work[2] = 1;

	tmw->actno[2] = AddActor(&CursorHeader2,200,4,0);		//縦移動矢印上
	ActAnmChg(&ActWork[tmw->actno[2]],1);
	ActWork[tmw->actno[2]].work[0] = 2;
	ActWork[tmw->actno[2]].work[2] = -1;
	tmw->actno[3] = AddActor(&CursorHeader2, 200,108,0);	//縦移動矢印下
	ActWork[tmw->actno[3]].work[0] = 2;
	ActWork[tmw->actno[3]].work[2] = 1;

	//ハート（赤）
	for(i=0;i<8;i++){
		tmw->actno[HEART1_NO+i] = AddActor(&HeartHeader, 44+(i%4)*8, 52+(i/4)*8,0);		
//		ActAnmChg(&ActWork[tmw->actno[HEART1_NO+i]],2);
	}
	
	//ハート（黒）
	for(i=0;i<8;i++){
		tmw->actno[BLACKHEART1_NO+i] = AddActor(&HeartHeader, 124+(i%4)*8,52+(i/4)*8,0);		
		ActAnmChg(&ActWork[tmw->actno[BLACKHEART1_NO+i]],2);
	}

	//全部隠す
	for(i=0;i<4+16;i++){
		ActWork[tmw->actno[i]].banish = 1;
	}
}

// =================================================================
// GetWazaParameter
// 概要  : 初期パラメータを取得
// 引数  : none
// 戻り値: none
// =================================================================
static void GetWazaParameter()
{
	int i;
	u8 strbuf[MONS_NAME_SIZE+EOM_SIZE];

	tmw->list.max	= PokeOboeruWazaGet(&PokeParaMine[tmw->pokeno],tmw->wazalist);
	for(i=0;i<tmw->list.max;i++)
		PM_strcpy(tmw->wazaname[i],WazaNameData[tmw->wazalist[i]]);

	PokeParaGet(&PokeParaMine[tmw->pokeno],ID_nickname,strbuf);	//ポケモン名を格納
	NickNameCopy(StrTempBuffer0,strbuf);
	PM_strcpy(tmw->wazaname[tmw->list.max],modoru_mes);							//「もどる」追加
	tmw->list.max++;															//リスト総数＋１

}

// =================================================================
// SelectCursorPut
// 概要  : カーソルを移動させて表示する
// 引数  : move
// 戻り値: none
// =================================================================
static void SelectCursorPut(s8 move)
{
	tmw->list.old = tmw->list.pos;
	tmw->list.pos += move;		
	tmw->list.rewrite_cursor=1;
}

// =================================================================
// ListControl
// 概要  : リストのキーコントロール
// 引数  : none
// 戻り値: none
// =================================================================
static void WazaListControl()
{
	if(sys.Repeat&U_KEY){
		if(tmw->list.select!=0){
			SePlay(SE_SELECT);
			tmw->list.select--;			//選択項目自体はとにかく引く
			tmw->inforewrite = 1;
			if(tmw->list.pos!=0){		//カーソル位置は最上段か？
				SelectCursorPut(-1);
			}else{
				if(tmw->list.top!=0){	//スクロール位置は最上段か？
					tmw->list.top--;
					tmw->list.rewrite++;
				}
			}
		}
	}else if(sys.Repeat&D_KEY){
		if(tmw->list.select<tmw->list.max-1){
			SePlay(SE_SELECT);
			tmw->list.select++;			//選択項目自体はとにかく足す
			tmw->inforewrite = 1;
			if(tmw->list.pos!=WAZALIST_APPEAR-1){		
				SelectCursorPut(1);		//カーソル位置は最下段か？
			}else{
				if(tmw->list.top!=(tmw->list.max-WAZALIST_APPEAR)){	//スクロール位置は最下段か？
					tmw->list.top++;
					tmw->list.rewrite++;
				}
			}
		}
	
	}else if(sys.Trg&A_BUTTON){					//○○○を覚えさせますか？
		SePlay(SE_SELECT);
		if(tmw->list.select!=tmw->list.max-1){
			tmw->seq = TEACHMAIN_YESNO_MES;
			PM_strcpy(StrTempBuffer1,tmw->wazaname[tmw->list.select]);
			PM_MsgExpand(MsgExpandBuffer,teach2_mes);
			NMenuTalkMsgSet(MsgExpandBuffer,3,15);
		}else{												//「もどる」を選択
			PM_MsgExpand(MsgExpandBuffer,teach8_mes);
			NMenuTalkMsgSet(MsgExpandBuffer,3,15);
			tmw->seq = TEACHMAIN_END_MES;
		}
	}else if(sys.Trg&B_BUTTON){					//わざ選択キャンセル
		SePlay(SE_SELECT);
		tmw->seq = TEACHMAIN_END_MES;
		PM_MsgExpand(MsgExpandBuffer,teach8_mes);
		NMenuTalkMsgSet(MsgExpandBuffer,3,15);
	}
	
	if(tmw->list.max>WAZALIST_APPEAR){				//技リストの上下の矢印の表示を制御
		ActWork[UPARROW_NO].banish = 0;
		ActWork[DOWNARROW_NO].banish = 0;
		if(tmw->list.top==0) ActWork[UPARROW_NO].banish = 1;
		else	if(tmw->list.top==(tmw->list.max-WAZALIST_APPEAR)){
			ActWork[DOWNARROW_NO].banish = 1;
		}
	}
}

// =================================================================
// WazaListPut
// 概要  : 技リスト表示する
// 引数  : none
// 戻り値: none
// =================================================================
static void WazaListPut()
{
	int i,work;

	NMenuBoxWrite(commonwindow_tbl[1][0]+1,commonwindow_tbl[1][1]+1,
					commonwindow_tbl[1][2]-1,commonwindow_tbl[1][3]-1);
	
	if(tmw->list.max<WAZALIST_APPEAR) work = tmw->list.max;
	else							  work = WAZALIST_APPEAR;
	for(i=0;i<work;i++){
		NMenuMsgWrite(tmw->wazaname[i+tmw->list.top],22,1+i*2);
	}
	SelectCursorPut(0);
}

static const u8 infotbl[][3]={
	{5,4,1},		//type
	{16,4,2},		//威力
	{5,6,3},		//pp
	{16,6,4},		//命中率
	{5,4,5},		//コンテストtype
	{8,6,6},		//アピール
	{18,6,7},		//妨害
};

static const u8 infolist[]={0,1,2,3};
static const u8 infolist2[]={4,5,6};

// =================================================================
// PrintInfoMsg
// 概要  : 指定の数値を表示
// 引数  : tbl[]
// 戻り値: none
// =================================================================
static void PrintInfoMsg(u16 no, const u8 tbl[])
{
	u8 strbuf[50],work,i;
	PM_strcpy(strbuf,dummy_string);
	switch(tbl[2]){
		case 1:
			NMenuBoxWrite(tbl[0],tbl[1],tbl[0]+4,tbl[1]+1);
			PM_strcpy(strbuf,ZokuseiMsg[WTD[no].wazatype]);	//属性
			break;	
		case 2:
			NMenuBoxWrite(tbl[0],tbl[1],tbl[0]+2,tbl[1]+1);
			if(WTD[no].damage<=1){			//技ダメージが１か０なら「---」
				PM_strcpy(strbuf,str_bou3);
			}else{
				PM_NumMsgSet(strbuf, WTD[no].damage, NUM_MODE_LEFT, 3);	//ダメージ
			}
			break;
		case 3:
			
			NMenuBoxWrite(tbl[0],tbl[1],tbl[0]+1,tbl[1]+1);
			PM_NumMsgSet(strbuf, WTD[no].pp, NUM_MODE_LEFT, 2);	//PP
			break;
		case 4:
			NMenuBoxWrite(tbl[0],tbl[1],tbl[0]+2,tbl[1]+1);
			if(WTD[no].hitprobability == 0){	//命中率０の時は「---」
				PM_strcpy(strbuf,str_bou3);
			}else{
				PM_NumMsgSet(strbuf, WTD[no].hitprobability, NUM_MODE_LEFT, 3);	//めいちゅうりつ
			}
			break;
		case 5:
			NMenuBoxWrite(tbl[0],tbl[1],tbl[0]+4,tbl[1]+1);
			PM_strcpy(strbuf,ConTypeMsgTbl[ConWazaTbl[no].con_type]);	//コンテスト属性
			break;
		case 6:
			NMenuBoxWrite(tbl[0],tbl[1],tbl[0],tbl[1]+1);
			work = WazaKoukaTbl[ConWazaTbl[no].apno].ap / METER_ONE_AP;
			if(work==0xff) work = 0;
//			PM_NumMsgSet(strbuf, work, NUM_MODE_LEFT, 1);	//アピール
			for(i=0;i<8;i++){
				if(i<work)		ActAnmChg(&ActWork[tmw->actno[HEART1_NO+i]],1);
				else			ActAnmChg(&ActWork[tmw->actno[HEART1_NO+i]],0);
			}
			break;
		case 7:
			NMenuBoxWrite(tbl[0],tbl[1],tbl[0],tbl[1]+1);
			work = WazaKoukaTbl[ConWazaTbl[no].apno].bougai / METER_ONE_AP;
			if(work==0xff) work = 0;
//			PM_NumMsgSet(strbuf, work, NUM_MODE_LEFT, 1);	//ぼうがい
			for(i=0;i<8;i++){
				if(i<work)		ActAnmChg(&ActWork[tmw->actno[BLACKHEART1_NO+i]],3);
				else			ActAnmChg(&ActWork[tmw->actno[BLACKHEART1_NO+i]],2);
			}
			break;
	}
	
	NMenuMsgWrite(strbuf,tbl[0],tbl[1]);
}
// =================================================================
// WazaInfoWrite
// 概要  : 技情報の表示
// 引数  : info
// 戻り値: none
// =================================================================
static void WazaInfoWrite(u8 info)
{
	u16 wazano,i;

	if(tmw->list.select!=tmw->list.max-1){						//「もどる」じゃなかったら
		wazano = tmw->wazalist[tmw->list.select];				//ワザ説明を表示
		if(info){	//コンテスト
			for(i=0;i<16;i++)
				ActWork[tmw->actno[HEART1_NO+i]].banish = 0;
			for(i=0;i<3;i++){
				PrintInfoMsg(wazano,infotbl[infolist2[i]]);
			}
			NMenuBoxWrite(11,4,13,5);		//「PP/」を消す
			NMenuBoxWrite(1,9,18,9+3);		//説明文章を消す
			NMenuMsgWrite(WazaSetumeiMsgTbl[ConWazaTbl[wazano].apno],1,9);//説明表示
		}else{		//戦闘用
			for(i=0;i<4;i++){
				PrintInfoMsg(wazano,infotbl[infolist[i]]);
			}
			NMenuBoxWrite(1,9,18,9+3);		//説明文章を消す
			NMenuMsgWrite(WazaInfo[wazano-1],1,9);	//説明表示
		}
	}else{														//「もどる」選択の時は消去
		if(info){	//コンテスト
			NMenuBoxWrite(11,4,13,5);		//「PP/」を消す
			NMenuBoxWrite(infotbl[4][0],infotbl[4][1],infotbl[4][0]+4,infotbl[4][1]+1);
			NMenuBoxWrite(infotbl[5][0],infotbl[5][1],infotbl[5][0],infotbl[5][1]+1);
			NMenuBoxWrite(infotbl[6][0],infotbl[6][1],infotbl[6][0],infotbl[6][1]+1);
			for(i=0;i<16;i++)
				ActWork[tmw->actno[HEART1_NO+i]].banish = 1;
		}else{		//戦闘
			NMenuBoxWrite(infotbl[0][0],infotbl[0][1],infotbl[0][0]+4,infotbl[0][1]+1);
			NMenuBoxWrite(infotbl[1][0],infotbl[1][1],infotbl[1][0]+2,infotbl[1][1]+1);
			NMenuBoxWrite(infotbl[2][0],infotbl[2][1],infotbl[2][0]+2,infotbl[2][1]+1);
			NMenuBoxWrite(infotbl[3][0],infotbl[3][1],infotbl[3][0]+2,infotbl[3][1]+1);
		}
		NMenuBoxWrite(1,9,18,9+3);
	}
}
