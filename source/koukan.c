//=========================================================================
//	ポケモンこうかんモジュール
//
//    Copyright (C) 2000 GAME FREAK inc.
//											By Akito Mori
//=========================================================================

//KoukanWorkのアドレスをUserWorkから割り付けてますが
//アドレス指定の数字が適当です。壊れる可能性あるので気をつけよう

//その　ポケモンを　こうかんすると		//自分側
//せんとう　できなく　なっちゃうよ！

//
//

#include "common.h"
#include "evobj.h"

#include "calctool.h"
#include "poketool.h"
#include "multisio.h"
#include "pokesio.h"
#include "cable.h"
#include "mus_tool.h"

#include "intr.h"

#include "script.h"
#include "fight.h"
#include "weather.h"

#include "param.h"
#include "fld_main.h"
#include "fld_task.h"
#include "fld_tool.h"
#include "task.h"
#include "print.h"
#include "fcontext.h"
#include "window.h"
#include "menu.h"
#include "menutool.h"
#include "boxsub.h"
#include "p_status.h"

#include "actor.h"
#include "actanm.h"
#include "Madefine.h"
#include "palanm.h"
#include "mail.h"
#include "server.h"

#include "pokeicon.h"
#include "wazatool.h"

#include "gauge.h"
#include "extanm.h"

#include "..\scaddata\kk_bg.acl"		
#include "..\scaddata\kk_bg.ach"		
#include "..\scaddata\kk_bg2.asc"		//ﾒｲﾝのｳｲﾝﾄﾞｳ
#include "..\scaddata\kk_bg2a.asc"		//情報ｳｲﾝﾄﾞｳの時のﾊﾟｰﾂ
#include "..\scaddata\kk_bg2a2.asc"		//ﾒｲﾝｳｲﾝﾄﾞｳに戻すためのﾊﾟｰﾂ
#include "..\scaddata\kk_bg2b.asc"		//ｽｸﾛｰﾙする背景（BG2側）
#include "..\scaddata\kk_bg3b.asc"		//ｽｸﾛｰﾙする背景（BG3側）
#include "..\scaddata\kk_bg4.asc"		//ポケモンの情報ﾐﾆｳｲﾝﾄﾞｳ

#include "..\scaddata\kk_cusor.ach"

#include "koukan.h"	//アクター定義


//#define DEBUG_NUM_PRINT
//#define DEBUG_PRINT
//#define KOUKAN_DEBUG
//#define DEBUG_PLAY


extern u8 multisiotestdata[];
extern const u8 testdata[][256];						//ﾃｽﾄﾃﾞｰﾀ
extern const u8	PokeNameData[][6];
extern const u8	WazaNameData[][8];
extern SIOTRAINER_INFO SioTrainerInfo[];

extern void KoukanDemoInit();
extern void InitFight();
extern void JidouNinshouWatchDog(u8 no);


static u8 count;

extern void CommBattleEnd(void);
extern void CommTradeEnd(void);
extern u8 *PM_SexStrcat(u8 *buf,u8 sex);

extern void kanshi_network(u8 taskno);
extern void kanshi_num_set();
extern void KoukanPokeItemIconActorSet(u8 pokenum[2], u8 iconlist[2][6], u8 side);
extern void ItmeIconCellPalSet(void);


static void KoukanMainInitSub(void);
static u8 RenzokuCellSet();
static void PokeStatusGet(u8 no);
static void PokeIconActionSearch(u8 no);
static void PokeIconActionSet();
static void RibbonInfoCheck();
static u8 StatusSubCheck(u8 *tbl, u8 num, u8 pos);

//=========================================================================
//	外部ワークを確保
//=========================================================================
MAIL_DATA	EnemyMail[6]={};


//=========================================================================
//	定義
//=========================================================================
//#define name value
#define OFFSET_NAME			
#define OFFSET_YESNO
#define OFFSET_ARROW
#define OFFSET_STATUS_NAME
#define OFFSET_STATUS_WAZA

#define YESNO_POS_X1		(24)
#define YESNO_POS_Y1		(14)
#define YESNO_POS_W			(5)
#define YESNO_POS_H			(5)
#define YESNO_POS_X2		(YESNO_POS_X1+YESNO_POS_W)
#define YESNO_POS_Y2		(YESNO_POS_Y1+YESNO_POS_H)

//				NMenuWinBoxWrite(23,14,28,19);

#define STATUSMENU_X1		(18)
#define STATUSMENU_Y1		(14)
#define STATUSMENU_W		(10)
#define STATUSMENU_H		(5)
#define STATUSMENU_X2		(STATUSMENU_X1+STATUSMENU_W)
#define STATUSMENU_Y2		(STATUSMENU_Y1+STATUSMENU_H)


static const u8 yameru_msg[]={ya_,me_,ru_,EOM_,};				//「やめる」
static const u8 select_msg[]={PO_,KE_,MO_,N_,wo_,spc_,e_,ra_,n_,de_,spc_,ku_,da_,sa_,i_,EOM_,};//ﾎﾟｹﾓﾝを　えらんで　ください
static const u8 status_msg[]={tu_,yo_,sa_,wo_,mi_,ru_,EOM_,};	//つよさをみる
static const u8 koukan_msg[]={ko_,u_,ka_,n_,ni_,da_,su_,EOM_,};			//こうかんにだす
static const u8 yamemasuka_msg[]={ko_,u_,ka_,n_,spc_,wo_,spc_,ya_,me_,ma_,su_,ka_,hate_,EOM_,};//こうかんをやめますか
static const u8 bbotande_msg[]={B__,BO_,TA_,N_,spc_,de_,spc_,mo_,do_,ri_,ma_,su_,EOM_,};	//Ｂボタンでもどります

//メッセージテーブル
static const u8  * const kk_msg_tbl[]={
	yameru_msg,				//やめる
	select_msg,				//ﾎﾟｹﾓﾝを  えらんで  ください
	status_msg,				//スタータスをみる
	koukan_msg,				//こうかんにだす
	yamemasuka_msg,			//こうかんをやめますか？
	bbotande_msg,			//Ｂボタンで戻ります。
};


//カーソル移動用のテーブル
//上下左右の順に定義してあります
//  ０ １    ６  ７
//  ２ ３    ８  ９
//  ４ ５  １０１１
//             １２
static const u8 movepostbl[][4][6]={
									//   0 の位置からの4方向の行きつく先の優先度ﾃｰﾌﾞﾙ(上下左右の順)
									//   少ない数字の方が優先度が高い
	{{ 4, 2,12,12},{ 2, 4,12,12},{ 7, 6, 1, 0},{ 1, 6, 7, 0},},		//0
	{{ 5, 3,12,12},{ 3, 5,12,12},{ 0, 7, 6, 1},{ 6, 7, 0, 1},},		
	{{ 0, 0, 0, 0},{ 4, 0, 0, 0},{ 9, 8, 7, 6},{ 3, 1,     },},		
	{{ 1, 1, 1, 1},{ 5, 1, 1, 1},{ 2, 9, 8, 7},{ 8, 9, 6, 6},},		
	{{ 2, 2, 2, 2},{ 0, 0, 0, 0},{11,10,9,8,7,6},{ 5,3,1,  },},		
	{{ 3, 3, 3, 3},{ 1, 1, 1, 1},{ 4, 4, 4, 4},{10, 8, 6,  },},		//5
	{{10, 8,12,  },{ 8,10,12,  },{ 1, 0,     },{ 7, 0, 1,  },},		
	{{12,        },{ 9,12,     },{ 6,        },{ 0,        },},		
	{{ 6,        },{10, 6,     },{ 3, 2, 1, 0},{ 9, 7,     },},		
	{{ 7,        },{11,12,     },{ 8,        },{ 2, 1, 0,  },},		
	{{ 8,        },{ 6,        },{ 5, 4, 3, 2,1,0},{11, 9, 7, },},	//10
	{{ 9,        },{12,        },{10,        },{ 4, 2, 0,  },},		
	{{11, 9, 7, 6},{ 7, 6,     },{12,        },{12,        },},		

};


//ポケモンの名前座標テーブル
static const u8 namepos[13][2]={
	{ 1, 5     },			{ 8, 5     },
	{ 1, 5+5   },			{ 8, 5+5   },
	{ 1, 5+5*2 },			{ 8, 5+5*2 },

	{16, 5     },			{23, 5     },
	{16, 5+5   },			{23, 5+5   },
	{16, 5+5*2 },			{23, 5+5*2 },
	{23, 5+5*2+3},
};

//ポケモンのレベル表示テーブｒ
static const u8 levelpos[12][2]={
	{5,4},		{5+7,4},
	{5,4+5},	{5+7,4+5},
	{5,4+5*2},	{5+7,4+5*2},

	{20,4},		{20+7,4},
	{20,4+5},	{20+7,4+5},
	{20,4+5*2},	{20+7,4+5*2},
};

//ポケモンのレベル表示のウィンドウのテーブル
static const u8 levelwindowpos[12][2]={
	{1,3    },	{8,3    },
	{1,3+5  },	{8,3+5  },
	{1,3+10 },	{8,3+10 },

	{16,3    },	{16+7, 3    },
	{16,3+5  },	{16+7, 3+5  },
	{16,3+10 },	{16+7, 3+10 },
};



static const u8 playername[2][2][2]={
	{
		{60,10},
		{120+60,10},
	},
	{
		{48,10},
		{120+48,10},
	},
};


static const u8 str_status[] = {SU_,TE_,bou_,TA_,SU_,wo_,mi_,ru_,EOM_,};
static const u8 str_koukan[] = {ko_,u_,ka_,n_,ni_,da_,su_,EOM_,};


//-----------------------------------------------------------------------
//  system_message_window用の定義
//-----------------------------------------------------------------------
static const u8 str_taiki[]  = {
	CTRL_,C_FCOL_,COL_BLACK,CTRL_,C_BCOL_,COL_WHITE,CTRL_,C_SCOL_,COL_DGRAY,
	tu_,u_,si_,n_,ta_,i_,ki_,ti_,yyu_,u_,gyoe_,CR_,
	si_,ba_,ra_,ku_,o_,ma_,ti_,ku_,da_,sa_,i_,EOM_,};


static const u8 str_cansel[]  = {
	CTRL_,C_FCOL_,COL_BLACK,CTRL_,C_BCOL_,COL_WHITE,CTRL_,C_SCOL_,COL_DGRAY,
	ko_,u_,ka_,n_,ha_,CR_,KI_,YYA_,N_,SE_,RU_,spc_,sa_,re_,ma_,si_,ta_,gyoe_,EOM_,
};

static const u8 str_notrade1[]={
	CTRL_,C_FCOL_,COL_BLACK,CTRL_,C_BCOL_,COL_WHITE,CTRL_,C_SCOL_,COL_DGRAY,
	so_,no_,PO_,KE_,MO_,N_,wo_,spc_,ko_,u_,ka_,n_,su_,ru_,to_,CR_,
	se_,n_,to_,u_,de_,ki_,na_,ku_,na_,ttu_,ti_,yya_,u_,yo_,gyoe_,EOM_,
};

static const u8 str_notrade2[]={
	CTRL_,C_FCOL_,COL_BLACK,CTRL_,C_BCOL_,COL_WHITE,CTRL_,C_SCOL_,COL_DGRAY,
	ko_,re_,de_,ko_,u_,ka_,n_,su_,ru_,to_,spc_,a_,i_,te_,ga_,CR_,
	se_,n_,to_,u_,de_,ki_,na_,ku_,na_,ttu_,ti_,yya_,u_,yo_,gyoe_,EOM_,
};

static const u8 str_endwait[]={
	CTRL_,C_FCOL_,COL_BLACK,CTRL_,C_BCOL_,COL_WHITE,CTRL_,C_SCOL_,COL_DGRAY,
	to_,mo_,da_,ti_,no_,spc_,si_,yyu_,u_,ri_,yyo_,u_,wo_,CR_,
	ma_,ttu_,te_,i_,ma_,su_,tenten_,tenten_,EOM_,
};

static const u8 str_tradecontinue[]={
	CTRL_,C_FCOL_,COL_BLACK,CTRL_,C_BCOL_,COL_WHITE,CTRL_,C_SCOL_,COL_DGRAY,
	to_,mo_,da_,ti_,ha_,spc_,PO_,KE_,MO_,N_,no_,CR_,
	ko_,u_,ka_,n_,wo_,spc_,si_,ta_,i_,yo_,u_,de_,su_,gyoe_,EOM_,
};


static const u8 * const system_msg[]={
	str_taiki,
	str_cansel,
	str_notrade1,
	str_notrade2,
	str_endwait,
	str_tradecontinue,
};

static const u8 sysmsg_tbl[][4]={		//文字列によってウインドウの大きさを変える
	{	8 , 7, 22, 12	},				//system_msgの文字列に対応した大きさ
	{	8 , 7, 22, 12	},				
//	{	5 , 8, 25, 11,	},
	{	6 , 7, 24, 12	},
	{	6 , 7, 24, 12	},
	{	8 , 7, 22, 12	},
	{	7 , 7, 23, 12	},
};

static const u8 str_to[]={to_, spc_,EOM_};
static const u8 str_simasuka[]={ wo_,spc_,ko_,u_,ka_,n_,si_,ma_,su_,ka_,hate_,EOM_,};

static void Menustatus(void);
static void Menukoukan(void);

static const MENU_ITEM menu[]={
	{str_status,  Menustatus},
	{str_koukan,  Menukoukan},
};

//==========================================================================
static const u8 clear_area[2][2]={
	{0,14,},
	{15,29,},
};

static const u8 statuspos[4][2]={
	{3,5,},
	{3,7},
	{18,5,},
	{18,7},
};


static const u8 colchg[]={EOM_,};
//static const u8 colchg[]={CTRL_,C_FCOL_,COL_BLACK,CTRL_,C_BCOL_,COL_WHITE,EOM_,};
const u8 sex_msg[3][2]={
	{osu_,EOM_,},
	{mesu_, EOM_,},
	{EOM_,EOM_}
};

static const u8 waza_str[]={wa_,za_,EOM_};
static const u8 cr_str[]={CR_,EOM_};
static const u8 str_sura[] = {sura_,EOM_};
static const u8 str_lv[]={L__,v__,EOM_};
static const u8 str_bou[] = {bou_,bou_,bou_,EOM_,};
static const u8 str_hatena[] = {hate_,hate_,hate_,hate_,EOM_,};

typedef struct{
	u8	flg;
	u16 wait;
	u8  funcno;
}QUE_FUNC;


typedef struct{
	u8 x;
	u8 y;
	u16 *src;
	u16 *des;
	u8  w;
	u8  h;
	u16 mask;
	u8  transflag;
	u16	bgvram[32*32];
}BLOCK_COPY_WORK;

#define QUE_MAX	(4)
//=========================================================================
//	変数
//=========================================================================
//GLOBAL type valiable;
/*-------------------- グローバル 変数  ----------------------------*/
u8 exchange_pokemon[2]={0,0};		//自分・相手

//LOCAL type valiable;
/*-------------------- ローカル 変数 -------------------------------*/


typedef struct{
	u8  		bgofs[2];			//背景ｽｸﾛｰﾙの座標
	TALK_WIN 	tw;					//ﾃｷｽﾄｺﾝﾃｷｽﾄ
	u8  		iconno[2][6];		//ﾎﾟｹﾓﾝｱｲｺﾝのｱｸﾀｰNO
	u8			cursorno;			//ｶｰｿﾙのｱｸﾀｰNO
	u8			cursorposno;		//ｶｰｿﾙの位置
	u8			pokenum[2];			//ﾎﾟｹﾓﾝの数
	u8			existtbl[13];		//実際にﾎﾟｹﾓﾝがいるかどうかのﾌﾗｸﾞ
	u8			pokestatus[2][6];	//ポケモンの状態（1:通常・0:異常（瀕死かタマゴ））
	u8			tamago[2][6];		//タマゴかどうかフラグ
	u8			iconaction[2][6];	//ポケモンアイコン用の動作フラグ
	u8			exchangeflag;		//
	u8			exchangeold;
	u16			exchangecount;
	u8			windowwork;
	u8			menuflag;
	u8			menupos;
	u16			inst_no;			//説明文章のOBJVRAM位置
	u8			statuspage_flag[2];
	u8 			statuspage_num[2];

	u8			wait_flag[2];		//完了したというフラグ
	u8			ok_flag[2];			//こうかんＯＫというフラグ
	u8			end_flag[2];		//終了ＯＫのフラグ
	u8			enemy_select;		//相手の選択したポケモン
	u16			sendwork[20];
	u8			wait;
	u8			RibbonTbl[16];		//相手のリボン情報コピー
	BLOCK_COPY_WORK bcw;
	QUE_FUNC	que[QUE_MAX];
}KOUKAN_WORK;

KOUKAN_WORK *kw;

//=========================================================================
//  extern変数
//=========================================================================

/*---------------------- サブルーチン  -----------------------------*/


//=========================================================================
//  extern関数
//=========================================================================

//=========================================================================
//	関数プロトタイプ
//=========================================================================
//GLOBAL type function(arg...);
void KoukanMainInit(void);
void KoukanMain(void);


//LOCAL	type function()
static void VInterFunc( void );
static void koukan_bg_set(u8 turn);
static void pokemonicon_refresh();
static u8 ExchangePoke();
static void PadFunc();
static void statuspage_set(u8 pos);
static u8 pokemon_info_set(u8 *buf, u8 group, u8 pos);
static void level_put(u8 side, u8 n, u8 lx, u8 ly, u8 wx, u8 wy);
static void pokelevel_put(u8 side);

static void statuspage_set_start(u8 pos);
static void statuspage_set(u8 pos);
static void pokemon_waza_set(u8 *buf, u8 group, u8 pos);
static void SetExplainFont32x16(const u8 *str, u8 *dst, u8 max);


void block_map_copy16(BLOCK_COPY_WORK *work,char x, char y, u16*src, char w,char h,u16 mask);
void block_map_copy16_main(BLOCK_COPY_WORK *work);
void block_map_copy_init(BLOCK_COPY_WORK *work, u16* des);
void block_map_refresh(BLOCK_COPY_WORK *work);


static void pokename_put(u8 side);
static void pokeicon_pos_set(u8 side);
static void return_statuspage(u8 side);
static void menu_erase();

void KoukanSioFunc();

static void parent_func(u8 id, u8 result);
static void child_func(u8 id, u8 result);

static void system_message_window(u8 mes);

static void QueFuncSet(u16 wait, u8 funcno);
static void QueFuncMain();

static void fadeout_func();
static void fadeout_func();

static void soujusin_msg(u8 souju, u8 num);



extern void kanshi_network(u8 taskno);


enum{
	KOUKAN_INIT_ENTER=0,
	KOUKAN_INIT_START,
	KOUKAN_SIO_START_WAIT,
	KOUKAN_SIO_START,
	KOUKAN_SIO_WAIT,
	KOUKAN_SIO_EXCHANGE,
	KOUKAN_INIT_POKEGRA,
	KOUKAN_INIT_POKEICON1,
	KOUKAN_INIT_POKEICON2,
	KOUKAN_INIT_TEXT,
	KOUKAN_INIT_CELLSET,
	KOUKAN_INIT_NAME,
	KOUKAN_INIT_GAMEN,
	KOUKAN_INIT_BG_CHECK1,
	KOUKAN_INIT_BG_CHECK2,
	KOUKAN_INIT_BG1,
	KOUKAN_INIT_BG2,
	KOUKAN_INIT_FADEIN,
	KOUKAN_INIT_BGREG,
	KOUKAN_INIT_SEARCH1,
	KOUKAN_INIT_SEARCH2,	
	KOUKAN_INIT_END,
};


//------------------------------------------------------------------------
//  ポケモン交換画面初期化
//------------------------------------------------------------------------
void KoukanMainInit(void)
{
	MainProcChange(KoukanMainInitSub);
}


//=========================================================================
//「ポケモンこうかん」画面初期化
//=========================================================================
static void KoukanMainInitSub(void)
{
	int i;
	u8 id,flag;
	actHeader acttemp;



	switch(sys.InitSeqWork)
	{
		case KOUKAN_INIT_ENTER:
			kw = (KOUKAN_WORK*)&UserWork[0x17000];		//ちょっとUserWorkのｱﾄﾞﾚｽ指定の仕方が
			InitActor();				//アクター初期化
			ObjPalManInit();			//OBJパレットマネージャー初期化
			InitTask();

			block_map_copy_init(&kw->bcw,(u16*)(BG_VRAM+0x2800));	
			SetVBlankFunc(VInterFunc);

			NMenuScreenInit(FIELD_MENU_TYPE);

			PrintScreenInit(KOUKAN_TYPE);
			MsgControlInit(&(kw->tw), KOUKAN_TYPE);
			kw->windowwork = NWinFrameInit(20);
			NWinFrameDataSet(&(kw->tw));

			NMenuScreenClear();


			PokeIconPaletteAllSet();
			kw->exchangeflag = 0;
			kw->menuflag = 0;
			kw->menupos  = 0;
			kw->statuspage_flag[0] = 0;
			kw->statuspage_flag[1] = 0;
			kw->ok_flag[0] = 0;
			kw->ok_flag[1] = 0;
			kw->wait = 0;
			count = 0;
			sys.InitSeqWork++;
			system_message_window(0);		//通信待機中！
			CpuClear(0,&UserWork[0x1d000],0x20*4*2*13,16);					//13個の4x2のOBJの領域をクリア
			for(i=0;i<13;i++){
				NameCellBuf[i] = (u8*)&UserWork[0x1d000+0x20*4*2*i];
			}
			break;
		case KOUKAN_INIT_START:
//			PaletteWorkSet(Test_Palette,(kw->tw.context->BasePalette)*16,32);
			PokemonSioNinshouNo = NINSHOU_KOUKANGAMEN;
			PokemonMultiSioInit();
			for(i=0;i<6;i++)		//ゴミが入っていたとき対策
				PokeParaSet(&PokeParaEnemy[i],0,0,POW_RND,RND_NO_SET,0,ID_NO_SET,0);
			sys.InitSeqWork++;
			kw->wait=0;
			AddTask(JidouNinshouWatchDog,1);			//タイムアウトエラー処理(タスク)
			break;
		case KOUKAN_SIO_START_WAIT:
			kw->wait++;
			if(kw->wait>11){
				kw->wait = 0;
				sys.InitSeqWork++;
			}
			break;
		case KOUKAN_SIO_START:
			if(GetSioRealConnectNumber()>=GetSioReliableNumber()){		//二人接続しかないけどね
				if(GetMyConnectIsParent()){			//親だったら通信スタートの重荷を
					if(++kw->wait>30){
						MultiSioSignalDecision();
						sys.InitSeqWork++;
					}
				}else{								//子は気楽に通信スタート待ち
					sys.InitSeqWork++;
				}
			}
			break;
		case KOUKAN_SIO_WAIT:
			if(pokemon_sio_flag==1 && PokemonNinshouNoCheck()==1){
				PokeCountMineGet();
				sys.InitSeqWork++;
			}
			break;
		case KOUKAN_SIO_EXCHANGE:
			if(ExchangePoke()){
				RibbonInfoCheck();				//リボン情報のチェック
				sys.InitSeqWork++;
			}
			break;
		case KOUKAN_INIT_POKEGRA:
			PokeCountEnemyGet();
			FontScrnBoxFill(&(kw->tw),0,  0, 0, 29, 19);
			*(vu16 *)REG_DISPCNT = 	0;			//表示ｵﾌ 
			kw->pokenum[0] = PokeCountMine;
			kw->pokenum[1] = PokeCountEnemy;

			for(i=0;i<kw->pokenum[0];i++){					//ポケモンアイコン表示
				kw->iconno[0][i]=PokeIconSet2(
					PokeParaGet(&PokeParaMine[i],ID_monsno_egg), 
					PokeIconDmmyMove, namepos[i][0]*8+14, namepos[i][1]*8-12, 1,
					PokeParaGet(&PokeParaMine[i],ID_personal_rnd));
			}
			for(i=0;i<kw->pokenum[1];i++){
				kw->iconno[1][i]=PokeIconSet2(
				PokeParaGet(&PokeParaEnemy[i],ID_monsno_egg,NULL), 
					PokeIconDmmyMove, namepos[i+6][0]*8+14,namepos[i+6][1]*8-12, 1,
					PokeParaGet(&PokeParaEnemy[i],ID_personal_rnd));
			}
			soujusin_msg(2,0);
			sys.InitSeqWork++;
			break;
		case KOUKAN_INIT_POKEICON1:
			ItmeIconCellPalSet();
			KoukanPokeItemIconActorSet(kw->pokenum, kw->iconno, 0);
			sys.InitSeqWork++;
			break;
		case KOUKAN_INIT_POKEICON2:
			KoukanPokeItemIconActorSet(kw->pokenum, kw->iconno, 1);
			sys.InitSeqWork++;
			break;

		case KOUKAN_INIT_TEXT:		//
			BoxDrawFont_32x16(MyData.my_name, NameCellBuf[0], DRAWTYPE_16TRANS, 0, UserWork);		//自分の名前
			id = GetSioConnectId();
			BoxDrawFont_32x16(SioTrainerInfo[id^1].name, NameCellBuf[3], DRAWTYPE_16TRANS, 0, UserWork);		//相手の名前
			BoxDrawFont_32x16(kk_msg_tbl[0], NameCellBuf[6], DRAWTYPE_16TRANS, 0, UserWork);	//「やめる」
			SetExplainFont32x16(kk_msg_tbl[1], NameCellBuf[7], EXPLAIN_CELL);
			soujusin_msg(3,0);
			sys.InitSeqWork++;
			kw->wait = 0;
			break;
		case KOUKAN_INIT_CELLSET:
			soujusin_msg(4,0);
			if(RenzokuCellSet()){
				sys.InitSeqWork++;
			}
			break;
		case KOUKAN_INIT_NAME:
			if(PM_strlen(MyData.my_name)>5) flag = 1;
			else							flag = 0;
			for(i=0;i<3;i++){					//自分の名前表示
				acttemp = ActNameHeader;
				acttemp.cellNo+=i;
				AddActor(&acttemp,playername[flag][0][0]+i*32,playername[flag][0][1],1);
			}
			id = GetSioConnectId();
			if(PM_strlen(SioTrainerInfo[id^1].name)>5) flag = 1;
			else							flag = 0;
			for(i=0;i<3;i++){						//相手の名前表示
				acttemp = ActNameHeader;
				acttemp.cellNo+=i+3;
				AddActor(&acttemp,playername[flag][1][0]+i*32,playername[flag][1][1],1);
			}
			soujusin_msg(5,0);
			sys.InitSeqWork++;
			break;
		case KOUKAN_INIT_GAMEN:
			acttemp = ActNameHeader;				//「やめる」表示
			acttemp.cellNo+=6;
			AddActor(&acttemp,8*0x1a+16,152,1);
			for(i=0;i<6;i++){
				acttemp = ActNameHeader;			//「ポケモンを選んでください」表示
				acttemp.cellNo+=7+i;
				AddActor(&acttemp,8+i*32+16,150,1);
			}
													//カーソル表示
			kw->cursorno = AddActor(&CursorHeader,namepos[0][0]*8+32,namepos[0][1]*8,2);
			kw->cursorposno = 0;
			sys.InitSeqWork++;
			soujusin_msg(6,0);
			break;
		case KOUKAN_INIT_BG_CHECK1:
			PokeStatusGet(0);							//ポケモンの正常異常をチェック
			pokename_put(0);					//ポケモン名前表示
			kw->bgofs[0] = 0;
			kw->bgofs[1] = 0;
			pokemonicon_refresh();
			sys.InitSeqWork++;
			soujusin_msg(7,0);
			
			MusicPlay(MUS_P_SCHOOL);
			break;
		case KOUKAN_INIT_BG_CHECK2:
			PokeStatusGet(1);							//ポケモンの正常異常をチェック
			pokename_put(1);
			sys.InitSeqWork++;
		case KOUKAN_INIT_BG1:
			koukan_bg_set(0);							//BGセット1回目
			sys.InitSeqWork++;
			break;
		case KOUKAN_INIT_BG2:
			koukan_bg_set(1);							//BGセット2回目
			sys.InitSeqWork++;
			break;
		case KOUKAN_INIT_FADEIN:
			PaletteFadeReq(0xffffffff,0,16,0,0);
			sys.InitSeqWork++;
			break;
		case KOUKAN_INIT_BGREG:

			/*---------画面表示開始----------*/
			*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
                          |	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
						  | DISP_BG0_ON					// BG0有効
						  | DISP_BG1_ON					// BG0有効
						  | DISP_BG2_ON					// BG2有効
						  | DISP_BG3_ON					// BG3有効
						  | DISP_OBJ_ON;

#ifdef DEBUG_NUM_PRINT
			DebugNumPrintInit(1,2,6,0);
			AddTask(kanshi_network,0);
#endif
			sys.InitSeqWork++;
			break;
		case KOUKAN_INIT_SEARCH1:	
			PokeIconActionSearch(0);
			sys.InitSeqWork++;
			break;
		case KOUKAN_INIT_SEARCH2:	
			PokeIconActionSearch(1);
			PokeIconActionSet();
			sys.InitSeqWork++;
			break;
		case KOUKAN_INIT_END:
			if( FadeData.fade_sw == 0 ){
//				PushFirstProc  = sys.pFirstProc;
				sys.pFirstProc = KoukanSioFunc;			//通信処理を常駐処理に
				MainProcChange(KoukanMain);
				count = 0;
			}
			break;
	}

	MainTask();
	JumpActor();
	SetActor();
	PaletteAnime();
	
	
};


// =================================================================
// KoukanMainReturnInit
// 概要  : ステータス画面から戻ってきたときの復帰処理
// 引数  : none
// 戻り値: none
// =================================================================
void KoukanMainReturnInit(void)
{

	int i;
	u8 id,flag;
	actHeader acttemp;
	P_StatusSys *pss;


	switch(sys.InitSeqWork)
	{
		case KOUKAN_INIT_ENTER:
			kw = (KOUKAN_WORK*)&UserWork[0x17000];		//ちょっとUserWorkのｱﾄﾞﾚｽ指定の仕方が
			InitActor();				//アクター初期化
			ObjPalManInit();			//OBJパレットマネージャー初期化
			InitTask();

			block_map_copy_init(&kw->bcw,(u16*)(BG_VRAM+0x2800));	
			SetVBlankFunc(VInterFunc);

			NMenuScreenInit(FIELD_MENU_TYPE);

			PrintScreenInit(KOUKAN_TYPE);
			MsgControlInit(&(kw->tw), KOUKAN_TYPE);
			kw->windowwork = NWinFrameInit(20);
			NWinFrameDataSet(&(kw->tw));

			NMenuScreenClear();


			PokeIconPaletteAllSet();
			kw->exchangeflag = 0;
			kw->menuflag = 0;
			kw->menupos  = 0;
			kw->statuspage_flag[0] = 0;
			kw->statuspage_flag[1] = 0;
			kw->ok_flag[0] = 0;
			kw->ok_flag[1] = 0;
			kw->wait = 0;
			count = 0;
			sys.InitSeqWork++;
			for(i=0;i<13;i++){
				NameCellBuf[i] = (u8*)&UserWork[0x1d000+0x20*4*2*i];
			}
			break;
		case KOUKAN_INIT_START:
//			PaletteWorkSet(Test_Palette,(kw->tw.context->BasePalette)*16,32);
			sys.InitSeqWork++;
			kw->wait=0;
			break;
		case KOUKAN_SIO_START_WAIT:
				sys.InitSeqWork++;
			break;
		case KOUKAN_SIO_START:
				sys.InitSeqWork++;
			break;
		case KOUKAN_SIO_WAIT:
			PokeCountMineGet();
			sys.InitSeqWork++;
			break;
		case KOUKAN_SIO_EXCHANGE:
			sys.InitSeqWork++;
			break;
		case KOUKAN_INIT_POKEGRA:
			PokeCountEnemyGet();
			*(vu16 *)REG_DISPCNT = 	0;			//表示ｵﾌ 
			kw->pokenum[0] = PokeCountMine;
			kw->pokenum[1] = PokeCountEnemy;

			pokename_put(0);					//ポケモン名前表示
			pokename_put(1);
			for(i=0;i<kw->pokenum[0];i++){					//ポケモンアイコン表示
				kw->iconno[0][i]=PokeIconSet2(
					PokeParaGet(&PokeParaMine[i],
					ID_monsno_egg,NULL), PokeIconDmmyMove, namepos[i][0]*8+14, namepos[i][1]*8-12, 1,
					PokeParaGet(&PokeParaMine[i],ID_personal_rnd));
			}
			for(i=0;i<kw->pokenum[1];i++){
				kw->iconno[1][i]=PokeIconSet2(
					PokeParaGet(&PokeParaEnemy[i],ID_monsno_egg,NULL), 
					PokeIconDmmyMove, namepos[i+6][0]*8+14,namepos[i+6][1]*8-12, 1,
					PokeParaGet(&PokeParaEnemy[i],ID_personal_rnd));
			}
			soujusin_msg(2,0);
			sys.InitSeqWork++;
			break;
		case KOUKAN_INIT_POKEICON1:
			ItmeIconCellPalSet();
			KoukanPokeItemIconActorSet(kw->pokenum, kw->iconno, 0);
			sys.InitSeqWork++;
			break;
		case KOUKAN_INIT_POKEICON2:
			KoukanPokeItemIconActorSet(kw->pokenum, kw->iconno, 1);
			sys.InitSeqWork++;
			break;

		case KOUKAN_INIT_TEXT:		//
			BoxDrawFont_32x16(MyData.my_name, NameCellBuf[0], DRAWTYPE_16TRANS, 0, UserWork);		//自分の名前
			id = GetSioConnectId();
			BoxDrawFont_32x16(SioTrainerInfo[id^1].name, NameCellBuf[3], DRAWTYPE_16TRANS, 0, UserWork);		//相手の名前
			BoxDrawFont_32x16(kk_msg_tbl[0], NameCellBuf[6], DRAWTYPE_16TRANS, 0, UserWork);	//「やめる」
			SetExplainFont32x16(kk_msg_tbl[1], NameCellBuf[7], EXPLAIN_CELL);
			soujusin_msg(3,0);
			sys.InitSeqWork++;
			kw->wait = 0;
			break;
		case KOUKAN_INIT_CELLSET:
			soujusin_msg(4,0);
			if(RenzokuCellSet()){
				sys.InitSeqWork++;
			}
			break;
		case KOUKAN_INIT_NAME:
			if(PM_strlen(MyData.my_name)>5) flag = 1;
			else							flag = 0;
			for(i=0;i<3;i++){					//自分の名前表示
				acttemp = ActNameHeader;
				acttemp.cellNo+=i;
				AddActor(&acttemp,playername[flag][0][0]+i*32,playername[flag][0][1],1);
			}
			id = GetSioConnectId();
			if(PM_strlen(SioTrainerInfo[id^1].name)>5) flag = 1;
			else							flag = 0;
			for(i=0;i<3;i++){						//相手の名前表示
				acttemp = ActNameHeader;
				acttemp.cellNo+=i+3;
				AddActor(&acttemp,playername[flag][1][0]+i*32,playername[flag][1][1],1);
			}
			soujusin_msg(5,0);
			sys.InitSeqWork++;
			break;
		case KOUKAN_INIT_GAMEN:
			acttemp = ActNameHeader;				//「やめる」表示
			acttemp.cellNo+=6;
			AddActor(&acttemp,8*0x1a+16,152,1);
			for(i=0;i<6;i++){
				acttemp = ActNameHeader;			//「ポケモンを選んでください」表示
				acttemp.cellNo+=7+i;
				AddActor(&acttemp,8+i*32+16,150,1);
			}
													//カーソル復帰
			pss = (P_StatusSys*)&UserWork[P_STATUS_USERADRS];
			if(kw->cursorposno < 6) kw->cursorposno = pss->put_no;
			else					kw->cursorposno = pss->put_no+6;
			kw->cursorno = AddActor(&CursorHeader,
				namepos[kw->cursorposno][0]*8+32,namepos[kw->cursorposno][1]*8,2);
			sys.InitSeqWork=KOUKAN_INIT_BG1;
			soujusin_msg(6,0);
			break;
		case KOUKAN_INIT_BG1:
			koukan_bg_set(0);
			sys.InitSeqWork++;
			break;
		case KOUKAN_INIT_BG2:
			koukan_bg_set(1);							//BGセット2回目
			kw->bgofs[0] = 0;
			kw->bgofs[1] = 0;
			pokemonicon_refresh();
			soujusin_msg(7,0);
			sys.InitSeqWork++;
			break;

		case KOUKAN_INIT_FADEIN:
			PaletteFadeReq(0xffffffff,0,16,0,0);
			sys.InitSeqWork++;
			break;
		case KOUKAN_INIT_BGREG:
			/*---------画面表示開始----------*/
			*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
                          |	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
						  | DISP_BG0_ON					// BG0有効
						  | DISP_BG1_ON					// BG0有効
						  | DISP_BG2_ON					// BG2有効
						  | DISP_BG3_ON					// BG3有効
						  | DISP_OBJ_ON;

#ifdef DEBUG_NUM_PRINT
			DebugNumPrintInit(1,2,6,0);
			AddTask(kanshi_network,0);
#endif
			sys.InitSeqWork++;
			break;
		case KOUKAN_INIT_SEARCH1:	
			sys.InitSeqWork++;
			break;
		case KOUKAN_INIT_SEARCH2:	
			PokeIconActionSet();
			sys.InitSeqWork++;
			break;
		case KOUKAN_INIT_END:
			if( FadeData.fade_sw == 0 ){
				MainProcChange(KoukanMain);
				count = 0;
			}
			break;
	}
	

	MainTask();
	JumpActor();
	SetActor();
	PaletteAnime();
}

/********************************************************************/
/*                                                                  */
/*				割り込み											*/
/*                                                                  */
/********************************************************************/
static void VInterFunc( void )
{
	block_map_copy16_main(&kw->bcw);

	actOAMtrans();						//ｱｸﾀｰ転送処理1
	actDMAtrans();						//ｱｸﾀｰ転送処理2
	PaletteFadeTrans();
}


//=========================================================================
//  フェードアウトセット
//=========================================================================
static void fadeout_func()
{
//	if(SplitDataSendStatus()){
	if(++kw->wait>15){
		PaletteFadeReq(0xffffffff,0,0,16,0);
//		LightFadeReq(N_to_B);
		kw->menuflag = 10;
	}
//	}
}
//=========================================================================
//  フェードアウト待ち（交換デモ行き）
//=========================================================================
static void fadeout_wait_func()
{
	if( FadeData.fade_sw == 0 ){
//			PokemonMultiSioEnd();
			exchange_pokemon[0] = kw->cursorposno;
			exchange_pokemon[1] = kw->enemy_select;
			SetSioEndDataStart();		//通信終了
			kw->menuflag = 13;
	}	
}

static void multisio_end_wait()
{
	if(pokemon_sio_flag==0){
//		sys.pFirstProc = PushFirstProc;
		sys.pFirstProc = NULL;
		MainProcChange(KoukanDemoInit);
	}
}

//-------------------------------------------------------------------------
//「せつぞくじっけん」画面メインルーチン
//-------------------------------------------------------------------------
void KoukanMain(void)
{
	PadFunc();			//ｷｰ操作


	QueFuncMain();		//QUE処理

	statuspage_set(0);	//ステータス画面セットルーチン左側
	statuspage_set(1);	//ステータス画面セットルーチン右側

	*(vu16*)REG_BG2HOFS = kw->bgofs[0]++;		//背景スクロール
	*(vu16*)REG_BG3HOFS = kw->bgofs[1]--;
	MainTask();
	JumpActor();	
	SetActor();
	PaletteAnime();

};



//-------------------------------------------------------------------------
//  こうかん画面BG 設定
//-------------------------------------------------------------------------
// =================================================================
// koukan_bg_set
// 概要  : こうかん画面BG 設定
// 引数  : turn	:	0=分割処理１回目	1=分割処理２回目
// 戻り値: none
// =================================================================
static void koukan_bg_set(u8 turn)
{
	int i;

	switch(turn){
		case 0:
			for(i=0;i<48;i++){
				PaletteWork[i] = kk_bg_Palette[i];
				PaletteWorkTrans[i] = kk_bg_Palette[i];
			}
			DIV_DMAARRAYCOPY(3 , kk_bg_Character , 	BG_VRAM,16);
#ifdef DEBUG_NUM_PRINT
			CpuClear(0, kw->bcw.bgvram,0x800, 32);
#else
			for(i=0;i<32*32;i++){
				kw->bcw.bgvram[i] = kk_bg2_Map[i];
			}
#endif
			DIV_DMAARRAYCOPY(3 , kk_bg2b_Map , 		BG_VRAM+0x3000,16);
			break;

		case 1:
			DIV_DMAARRAYCOPY(3 , kk_bg3b_Map , 		BG_VRAM+0x3800,16);

			pokelevel_put(0);
			pokelevel_put(1);

			block_map_refresh(&kw->bcw);

			*(vu16 *)REG_BG0CNT &= 0xfffc;						//テキスト面のプライオリティを最高に

			*(vu16 *)REG_BG1CNT = BG_COLOR_16					//16色選択
						| BG_SCREEN_SIZE_0				// スクリーンサイズ
						| BG_PRIORITY_1					//BG優先順位
						| 5 << BG_SCREEN_BASE_SHIFT	//スクリーンベースブロック
						| 0 << BG_CHAR_BASE_SHIFT ;		//キャラクタベースブロック
			*(vu16 *)REG_BG2CNT = BG_COLOR_16					//16色選択
						| BG_SCREEN_SIZE_0				// スクリーンサイズ
						| BG_PRIORITY_2					//BG優先順位
						| 6 << BG_SCREEN_BASE_SHIFT	//スクリーンベースブロック
						| 0 << BG_CHAR_BASE_SHIFT ;		//キャラクタベースブロック
			*(vu16 *)REG_BG3CNT = BG_COLOR_16					//16色選択
						| BG_SCREEN_SIZE_0				// スクリーンサイズ
						| BG_PRIORITY_3					//BG優先順位
						| 7 << BG_SCREEN_BASE_SHIFT	//スクリーンベースブロック
						| 0 << BG_CHAR_BASE_SHIFT ;		//キャラクタベースブロック

			*(vu16*)REG_BG0HOFS = 0;
		    *(vu16*)REG_BG1HOFS = 0;
			*(vu16*)REG_BG2HOFS = 0;
		    *(vu16*)REG_BG3HOFS = 0;

			*(vu16*)REG_BG0VOFS = 0;
		    *(vu16*)REG_BG1VOFS = 0;
			*(vu16*)REG_BG2VOFS = 0;
		    *(vu16*)REG_BG3VOFS = 0;
			break;
	}

}

//-------------------------------------------------------------------------
//  ポケモンアイコンの状態を書きなおす
//-------------------------------------------------------------------------
static void pokemonicon_refresh()
{
	int i;
	for(i=0;i<6;i++){
		if(i<kw->pokenum[0]){			//自分側
			ActWork[kw->iconno[0][i]].banish=0;		//ﾎﾟｹﾓﾝｱｲｺﾝを表示
			kw->existtbl[i] = 1;					//存在テーブルのﾌﾗｸﾞを立てる
		}else{
			kw->existtbl[i] = 0;					//存在ﾃｰﾌﾞﾙのﾌﾗｸﾞを下げる
		}

		if(i<kw->pokenum[1]){			//相手側
			ActWork[kw->iconno[1][i]].banish=0;		//ﾎﾟｹﾓﾝｱｲｺﾝを表示
			kw->existtbl[i+6] = 1;                  //存在テーブルのﾌﾗｸﾞを立てる
		}else{                                      
			kw->existtbl[i+6] = 0;                  //存在ﾃｰﾌﾞﾙのﾌﾗｸﾞを下げる
		}
	}
	kw->existtbl[12] = 1;
	
}


#define SOUSIN	(0)
#define JUSIN	(1)

static const u8 souju_msg[][13]={
	{ka_,i_,me_,no_,spc_,so_,u_,si_,n_,EOM_,},
	{ka_,i_,me_,no_,spc_,zi_,yyu_,si_,n_,EOM_,},
{PO_,KE_,MO_,N_,A_,I_,KO_,N_,SE_,TTU_,TO_,EOM_,},
{O__,B__,J__,TE_,KI_,SU_,TO_,SE_,TTU_,TO_,EOM_,},
{SE_,RU_,SE_,TTU_,TO_,EOM_,},
{O__,B__,J__,TE_,KI_,SU_,TO_,A__,D__,D__,EOM_,},
{SI_,SU_,TE_,MU_,ME_,TTU_,SE_,bou_,ZI_,A__,D__,D__,EOM_,},
{ha_,i_,ke_,i_,SE_,TTU_,TO_,EOM_,},	
};

static void soujusin_msg(u8 souju, u8 num)
{

#ifdef DEBUG_PRINT
	u8 strbuf[20];
	PM_NumMsgSet(strbuf,num,NUM_MODE_LEFT,1);
	PM_strcat(strbuf,souju_msg[souju]);
	NMenuMsgWrite(strbuf,1,18);	//送受信状態表示

#endif
}

void memcopy(void *des, void *src, u32 size)
{
	int i;
	u8 *d, *s;
	d = (u8*)des;
	s = (u8*)src;
	for(i=0;i<size;i++)	d[i] = s[i];
}

extern u8 SendPoolBuf[];
//==========================================================================
//  ﾎﾟｹﾓﾝのﾃﾞｰﾀを通信で交換する
//==========================================================================
static u8 ExchangePoke()
{
	u8 id;
	id = GetSioConnectId();
	
	kanshi_num_set(kw->exchangeflag/100,kw->exchangeflag%100);
	

	switch(kw->exchangeflag){
		case 0:												//自分のポケモンの情報をワークにセット
			memcopy(SendPoolBuf,&PokeParaMine[0],200);
			kw->exchangeflag++;
			break;
		case 1:
			if(SplitDataSendStatus()){
				if(SplitDataResult()==0){
					kw->exchangeflag++;
				}else{
					SplitDataResultReset();
					kw->exchangeflag++;
				}
			}
			break;
		case 2:
			if(id==0){										//自分が親だったら１回目の交換開始
				SplitDataExchangeStart(1);
			}
			kw->exchangeflag++;
			break;
		case 3:
			if(SplitDataResult()==0x3){						//自分と相手のデータ受信終了待ち
															//受信した相手のデータだけ取り出し
				memcopy(&PokeParaEnemy[0],&RecvPoolBuf[id^1][0],sizeof(PokemonParam)*2);
				SplitDataResultReset();
				kw->exchangeflag++;
			}
			break;
		case 4:
			memcopy(SendPoolBuf,&PokeParaMine[2],200);
			kw->exchangeflag++;
			break;

		case 5:
			if(id==0){										//自分が親だったら２回目の交換開始
				SplitDataExchangeStart(1);
			}
			kw->exchangeflag++;
			break;
		case 6:
			if(SplitDataResult()==0x3){						//自分と相手のデータ受信終了待ち
															//受信した相手のデータだけ取り出し
				memcopy(&PokeParaEnemy[2],&RecvPoolBuf[id^1][0],sizeof(PokemonParam)*2);
				SplitDataResultReset();
				kw->exchangeflag++;
			}
			break;


		case 7:
			memcopy(SendPoolBuf,&PokeParaMine[4],200);
			kw->exchangeflag++;
			break;

		case 8:
			if(id==0){										//自分が親だったら３回目の交換開始
				SplitDataExchangeStart(1);
			}
			kw->exchangeflag++;
			break;
		case 9:
			if(SplitDataResult()==0x3){						//自分と相手のデータ受信終了待ち
															//受信した相手のデータだけ取り出し
				memcopy(&PokeParaEnemy[4],&RecvPoolBuf[id^1][0],sizeof(PokemonParam)*2);
				SplitDataResultReset();
				kw->exchangeflag++;
			}
			break;
		case 10:
			memcopy(SendPoolBuf,&Fld.MailData[0],220);		//メールデータをコピー
			kw->exchangeflag++;
			break;
		case 11:
			if(id==0){										//自分が親だったら交換スタート
				SplitDataExchangeStart(3);
			}
			kw->exchangeflag++;
			break;
		case 12:
			if(SplitDataResult()==0x3){						//自分と相手のデータ受信終了待ち
															//受信した相手のデータだけ取り出し
				memcopy(&EnemyMail[0],&RecvPoolBuf[id^1][0],sizeof(MAIL_DATA)*6);
				SplitDataResultReset();
				kw->exchangeflag++;
			}
			break;

		case 13:
			memcopy(SendPoolBuf,&Fld.ExRibbonNo,EXTRA_RIBBON_MAX);		//リボンデータをコピー
			kw->exchangeflag++;
			break;
		case 14:
			if(id==0){										//自分が親だったら交換スタート
				SplitDataExchangeStart(4);
			}
			kw->exchangeflag++;
			break;
		case 15:
			if(SplitDataResult()==0x3){						//自分と相手のデータ受信終了待ち
															//受信した相手のデータだけ取り出し
				memcopy(kw->RibbonTbl,&RecvPoolBuf[id^1][0],EXTRA_RIBBON_MAX);
				SplitDataResultReset();
				kw->exchangeflag++;
			}
			break;

		case 16:

			return 1;
			break;
	}


	return 0;
}	



//==========================================================================
//  こうかんしますか？
//==========================================================================
static void koukan_select_set()
{
	u8 strbuf[25];
//	u8 work[10];
	u8 minename[10];
	u8 enemyname[10];


	PokeParaGet(&PokeParaMine[kw->cursorposno],ID_nickname,strbuf);
	NickNameCopy(minename,strbuf);
	PokeParaGet(&PokeParaEnemy[kw->enemy_select%6],ID_nickname,strbuf);
	NickNameCopy(enemyname,strbuf);
//	PM_strcpy(strbuf,PokeNameData[PokeParaGet(&PokeParaMine[kw->cursorposno],ID_monsno,NULL)]);
//	PM_strcpy(work,PokeNameData[PokeParaGet(&PokeParaEnemy[kw->enemy_select%6],ID_monsno,NULL)]);
	PM_strcpy(strbuf,minename);
	PM_strcat(strbuf,str_to);
	PM_strcat(strbuf,enemyname);
	PM_strcat(strbuf,str_simasuka);
	SetExplainFont32x16(strbuf, (u8*)(OBJ_MODE0_VRAM+(kw->inst_no<<5)),EXPLAIN_CELL);


}


//==========================================================================
//  通信してるときの親側の処理
//==========================================================================
static void parent_func(u8 id, u8 result)
{
	if(result&0x1){			//自分で送信したデータ
		switch(RecvPoolBuf[id][0]){
			case KOUKAN_END_SELECT:
				kw->wait_flag[0] = SELECT_END;
				break;
			case KOUKAN_WAIT_IN:
														//自分で「こうかん待機に入りました」
//				kw->my_select = RecvPoolBuf[id][1]+6;	//自分は何を選択したのか取得
				kw->wait_flag[0] = SELECT_KOUKAN;
				break;
			case KOUKAN_SEND_YES:							//自分はＹＥＳ
				kw->ok_flag[0] = KOUKAN_YES;
				break;
			case KOUKAN_SEND_NO:							//自分はＮＯ
				kw->ok_flag[0] = KOUKAN_NO;
				break;
		}
		SplitDataResultReset2(0);
	}
	if(result&0x02){		//子から受信したデータ
		switch(RecvPoolBuf[1][0]){
			case KOUKAN_END_SELECT:
				kw->wait_flag[1] = SELECT_END;
				break;
			case KOUKAN_WAIT_IN:
														//子機から「こうかん待機に入りました」
				kw->enemy_select = RecvPoolBuf[1][1]+6;	//子機は何を選択したのか取得
				kw->wait_flag[1] = SELECT_KOUKAN;
				break;
			case KOUKAN_SEND_YES:							//子機はＹＥＳ
				kw->ok_flag[1] = KOUKAN_YES;
				break;
			case KOUKAN_SEND_NO:							//子機はＮＯ
				kw->ok_flag[1] = KOUKAN_NO;
				break;
		}
	
		SplitDataResultReset2(1);
	}

}

//==========================================================================
//  通信してるときの子側の処理
//==========================================================================
static void child_func(u8 id, u8 result)
{
	if(result&0x1){
		switch(RecvPoolBuf[0][0]){				
			case KOUKAN_END_OK:					//交換終了が確認された
				PaletteFadeReq(0xffffffff,0,0,16,0);
				system_message_window(4);		//ともだちのしゅうりょうを待っています。
				kw->menuflag = 11;
				break;
			case KOUKAN_END_STOP:
				system_message_window(5);		//こうかん画面終了がキャンセルされた
				kw->menuflag = 8;
				break;
			case KOUKAN_NEXT_TERM:				//交換ＹＥＳＮＯ画面へ
				kw->enemy_select = RecvPoolBuf[0][1]+6;
				statuspage_set_start(kw->cursorposno);
				statuspage_set_start(kw->enemy_select);
//				koukan_select_set();
				kw->menuflag=7;
				break;
			case KOUKAN_EXCHANGE:				//こうかん成立
				PaletteFadeReq(0xffffffff,0,0,16,0);
//				LightFadeReq(N_to_B);
				kw->menuflag = 10;
				break;
			case KOUKAN_STOP:					//こうかん中止
				system_message_window(1);
				kw->menuflag = 8;
				break;
		}
	
		SplitDataResultReset2(0);
	}

	if(result&0x2){
		
		SplitDataResultReset2(1);
	}
}


static const u8 seikou_msg[]={ko_,u_,ka_,n_,se_,i_,ri_,tu_,spc_,spc_,spc_,spc_,spc_,EOM_,};
static const u8 dame_msg[]={da_,me_,da_,ta_,ra_,si_,i_,yo_,spc_,spc_,spc_,spc_,spc_,EOM_,};
//==========================================================================
//  通信中、主導権を握っている親側の処理
//==========================================================================
static void koukan_sio_func()
{
	
		if(kw->wait_flag[0]!=0 && kw->wait_flag[1]!=0){
			if(kw->wait_flag[0] == SELECT_KOUKAN && kw->wait_flag[1] == SELECT_KOUKAN){	//両方がこうかんするポケモンを選択した。
				//「Ａ　と　Ｂをこうかんしますか？」
				//「ＹＥＳ」「ＮＯ」	表示
				kw->menuflag=6;
				kw->sendwork[0]  = KOUKAN_NEXT_TERM;//次の処理に移るように子機に指示
				kw->sendwork[1]  = kw->cursorposno;	//その際に親はどのポケモンを選択したか送る
				QueFuncSet(5,0);					//sendworkをSplitDataSendStartで5sync後に送信
				kw->wait_flag[0] = kw->wait_flag[1] = 0;
			}else if(kw->wait_flag[0] == SELECT_KOUKAN && kw->wait_flag[1] == SELECT_END){
				system_message_window(1);			//「こうかんは中止」
				kw->sendwork[0] = KOUKAN_END_STOP;	//終了中止コマンド発行
				kw->sendwork[1] = 0;
				QueFuncSet(5,0);					//sendworkをSplitDataSendStartで5sync後に送信
				kw->ok_flag[0]   = kw->ok_flag[1]   = 0;
				kw->wait_flag[0] = kw->wait_flag[1] = 0;
				kw->menuflag = 8;
			}else if(kw->wait_flag[0] == SELECT_END && kw->wait_flag[1] == SELECT_KOUKAN){
				system_message_window(5);			//終了はキャンセル
				kw->sendwork[0] = KOUKAN_STOP;		//こうかん中止コマンド発行
				kw->sendwork[1] = 0;
				QueFuncSet(5,0);					//sendworkをSplitDataSendStartで5sync後に送信
				kw->ok_flag[0]   = kw->ok_flag[1]   = 0;
				kw->wait_flag[0] = kw->wait_flag[1] = 0;
				kw->menuflag = 8;
			}else if(kw->wait_flag[0] == SELECT_END && kw->wait_flag[1] == SELECT_END){
				kw->sendwork[0] = KOUKAN_END_OK;	//こうかん画面終了発行
				kw->sendwork[1] = 0;
				QueFuncSet(5,0);					//sendworkをSplitDataSendStartで5sync後に送信
				PaletteFadeReq(0xffffffff,0,0,16,0);
				kw->wait_flag[0] = kw->wait_flag[1] = 0;
				kw->menuflag = 11;
			}
			
		}
		if(kw->ok_flag[0]!=0&&kw->ok_flag[1]!=0){		//両方が「こうかんするか？」の選択に答えた
			if(kw->ok_flag[0] == KOUKAN_YES && kw->ok_flag[1] == KOUKAN_YES){	//両方ＹＥＳ
				//こうかんコマンド発行
				kw->sendwork[0] = KOUKAN_EXCHANGE;
				kw->sendwork[1] = 0;
				QueFuncSet(5,0);						//sendworkをSplitDataSendStartで5sync後に送信
				kw->ok_flag[0]=0;
				kw->ok_flag[1]=0;
				kw->menuflag = 9;
			}
			if(kw->ok_flag[0] == KOUKAN_NO || kw->ok_flag[1] == KOUKAN_NO){	//どちらかがＮＯと選択した。
				system_message_window(1);	//「こうかんは中止」
														//こうかん中止コマンド発行
				kw->sendwork[0] = KOUKAN_STOP;
				kw->sendwork[1] = 0;
				QueFuncSet(5,0);						//sendworkをSplitDataSendStartで5sync後に送信
				kw->ok_flag[0]=0;kw->ok_flag[1]=0;
				kw->menuflag = 8;
			}
		}

}
//==========================================================================
//  通信でコマンドのやり取りをする
//
//  セーブする場所を通知する				（親）
//  通信待機状態にはいりました。			（子）
//  交換に対して「はい」をおくります		（子）
//  交換に対して「いいえ」を送ります		（子・親）
//  自分の何番と相手の何番を交換します。	（親）
//==========================================================================
void KoukanSioFunc()
{

	u8 id,result;
	
	id = GetSioConnectId();

	if((result=SplitDataResult())){			//データを受けとったら自分の立場ごとに処理
		if(id==0){
			parent_func(id,result);		//親の処理
		}else{
			
			child_func(id,result);		//子の処理
		}
		SplitDataResultReset();
	}
	
	if(id==0)						//通信の親が主導権を握って進行を進める
		koukan_sio_func();
}

//==========================================================================
//  ｶｰｿﾙの次の移動先は存在しているかを最高6個まで探す
//==========================================================================
static u8  CursorSearch(u8 pos, u8 arrow)
{
	int i,w;
	w = 0;
	for(i=0;i<6;i++){
		if(kw->existtbl[movepostbl[pos][arrow][i]]==1){
			w = movepostbl[pos][arrow][i];
			break;
		}
	}
	return w;
}


//==========================================================================
//  ｶｰｿﾙ移動処理
//==========================================================================
static void CursorForward(u8 *pos, u8 arrow)
{
	u8 w;

	w = CursorSearch(*pos,arrow);
	if(w==12){
		ActAnmChg(&ActWork[kw->cursorno],1);
		ActWork[kw->cursorno].x = 25* 8+32;
		ActWork[kw->cursorno].y = 20* 8;
	}else{
		ActAnmChg(&ActWork[kw->cursorno],0);
		ActWork[kw->cursorno].x = ( namepos[w][0]    )* 8+32;
		ActWork[kw->cursorno].y = ( namepos[w][1]    )* 8;
	}
	if(*pos!=w)					//移動していればSE鳴らす
		SePlay(SE_SELECT);

	*pos = w;					//座標更新
}


//==========================================================================
//  交換するポケモン決定後、相手の通信待ちへ
//==========================================================================
static void koukan_ready()
{
	system_message_window(0);		//通信待機中！
	kw->menuflag=5;
	if(GetSioConnectId()==1){	//子は親にデータを送信
		kw->sendwork[0] = KOUKAN_WAIT_IN;
		kw->sendwork[1] = kw->cursorposno;
		SplitDataSendStart(GetAnotherSendTo(),(u8*)kw->sendwork,20);
	}else{						//親は自分のフラグを立てる
		kw->wait_flag[0] = 1;
	}


}

//==========================================================================
//  通常時ﾊﾟｯﾄﾞ処理
//==========================================================================
static void menu0pad_func()
{
	int i;
	if(sys.Repeat & U_KEY){
		CursorForward(&(kw->cursorposno),0);
	}else if(sys.Repeat & D_KEY){
		CursorForward(&(kw->cursorposno),1);
	}else if(sys.Repeat & L_KEY){
		CursorForward(&(kw->cursorposno),2);
	}else if(sys.Repeat & R_KEY){
		CursorForward(&(kw->cursorposno),3);
	}
	if(sys.Trg&A_BUTTON){
		SePlay(SE_SELECT);
		if(kw->cursorposno<6){					//左の列の時にAﾎﾞﾀﾝ押す
				NWinFrameWrite(&kw->tw, STATUSMENU_X1,STATUSMENU_Y1,STATUSMENU_X2,STATUSMENU_Y2);
//				NMenuWinBoxWrite(18,14,28,19);
				NMenuFixListWrite(STATUSMENU_X1+2, STATUSMENU_Y1+1, 2, menu);
				NMenuVCursorInit(19, 15, 2, 0);
				kw->menuflag=1;					//メニュー選択へ
		}else if(kw->cursorposno<12){			//右の列の時にAﾎﾞﾀﾝ押す
//				statuspage_set_start(kw->cursorposno);
				PaletteFadeReq(0xffffffff,0,0,16,0);
				kw->menuflag = 2;				//ステータス表示へ
		}else if(kw->cursorposno==12){			//「やめる」でAﾎﾞﾀﾝ押す
				NWinFrameWrite(&kw->tw, YESNO_POS_X1,YESNO_POS_Y1,YESNO_POS_X2,YESNO_POS_Y2);
//				NMenuWinBoxWrite(23,14,28,19);
				YesNoSelectStrInit(YESNO_POS_X1,YESNO_POS_Y1);
				kw->menuflag=4;					//終了メニューへ
				SetExplainFont32x16(kk_msg_tbl[4], (u8*)(OBJ_MODE0_VRAM+(kw->inst_no<<5)),EXPLAIN_CELL);
//				BoxDrawFont_32x16(kk_msg_tbl[4], (u8*)(OBJ_MODE0_VRAM+(kw->inst_no<<5)), DRAWTYPE_16TRANS, 0, UserWork);
		}
	}
	if(sys.Trg&R_BUTTON){
		for(i=0;i<10;i++){
			kw->sendwork[i] = i;
		}
		SplitDataSendStart(GetAnotherSendTo(),(u8*)kw->sendwork, 20);
	}

}

//==========================================================================
//  終了ﾒﾆｭｰからの画面復帰
//==========================================================================
static void return_endmenu()
{
	menu_erase();
	kw->menuflag = 0;
	ActWork[kw->cursorno].banish = 0;
	SetExplainFont32x16(kk_msg_tbl[1], (u8*)(OBJ_MODE0_VRAM+(kw->inst_no<<5)),EXPLAIN_CELL);
//	BoxDrawFont_32x16(kk_msg_tbl[1], (u8*)(OBJ_MODE0_VRAM+(kw->inst_no<<5)), DRAWTYPE_16TRANS, 0, UserWork);
}

//==========================================================================
//  「ステータス」「こうかんにだす」選択
//==========================================================================
static void menu1pad_func()
{
	if(sys.Repeat & U_KEY){
		SePlay(SE_SELECT);
		kw->menupos=NMenuVCursorSet(-1);
	}else if(sys.Repeat & D_KEY){
		SePlay(SE_SELECT);
		kw->menupos=NMenuVCursorSet(1);
	}
	if(sys.Trg&A_BUTTON){
		SePlay(SE_SELECT);
		if(NMenuVCursorPosGet()==0){			//「ステータスを表示」を選択
//			statuspage_set_start(kw->cursorposno);
			PaletteFadeReq(0xffffffff,0,0,16,0);
			kw->menuflag=2;						//ステータス表示
		}else{
			
			if(StatusSubCheck(kw->pokestatus[0],kw->pokenum[0],kw->cursorposno)==0){
				QueFuncSet(3,2);			//ﾒｯｾｰｼﾞ表示                        //戦闘ができなくなってしまわないか？
				kw->menuflag = 8;
			}else{
				koukan_ready();						//通信待ちにはいる
				ActWork[kw->cursorno].banish = 1;		//カーソルを消す
			}
		}
	}else if(sys.Trg&B_BUTTON){					//選択をキャンセル
		SePlay(SE_SELECT);
		return_endmenu();
	}

}

static void menu_key_wait()
{
	if(sys.Trg & A_BUTTON || sys.Trg & B_BUTTON){
		SePlay(SE_SELECT);
		return_endmenu();
	}
}

//==========================================================================
//  ステータス画面表示中
//==========================================================================
static void menu2pad_func()
{
	if(FadeData.fade_sw == 0){
		if(kw->cursorposno<6){
			PokeStatusCall2(PokeParaMine,kw->cursorposno,
				kw->pokenum[0]-1,KoukanMainReturnInit,BTL_WAZA);
		}else{
			PokeStatusCall2(PokeParaEnemy,kw->cursorposno-6,
				kw->pokenum[1]-1,KoukanMainReturnInit,BTL_WAZA);
		}
	}
//	if(kw->statuspage_flag[0]==5||kw->statuspage_flag[1]==5)	//アイコン移動が終了していたら
//		if(sys.Trg&B_BUTTON){									
//			SePlay(SE_SELECT);
//			B_button_func();
//		}

}

static u8 AllStatusAdd(u8 *tbl,u8 num)
{
	int i;
	u8 ret = 0;
	for(i=0;i<num;i++) ret += tbl[i];

	return ret;
}

static u8 StatusSubCheck(u8 *tbl, u8 num, u8 pos)
{
	int i;
	u8 ret = 0;
	for(i=0;i<num;i++){
		if(pos!=i)
			ret += tbl[i];
	}
	return ret;
}

// ======================================================================
// SendYesMessageCheck
// 概要  : 「はい」を送るために行うチェック
//
// 戦闘が続けられない交換は避けなければいけない。
// 手持ちがタマゴだけになってしまうとか、タマゴと瀕死のポケモンだけとか
// 引数  : none
// 戻り値: none
// =====================================================================
static void SendYesMessageCheck()
{
	int i;
	u8 work[2][6];
	
	for(i=0;i<kw->pokenum[0];i++) work[0][i] = kw->pokestatus[0][i];	//自分のデータを集計
//	work[0][kw->cursorposno] = kw->pokestatus[1][kw->enemy_select%6];	

//	for(i=0;i<kw->pokenum[1];i++) work[1][i] = kw->pokestatus[1][i];	//相手のデータを交換してみる
//	work[1][kw->enemy_select%6] = kw->pokestatus[0][kw->cursorposno];		

//	if(AllStatusAdd(work[0],kw->pokenum[0])==0){						//この交換をすると自分は
//		QueFuncSet(3,2);			//ﾒｯｾｰｼﾞ表示                        //戦闘ができなくなってしまわないか？
//		kw->sendwork[0] = KOUKAN_SEND_NO;
//		QueFuncSet(180,0);			//キャンセルデータ遅延で送信
		
//	}else if(AllStatusAdd(work[1],kw->pokenum[1])==0){					//この交換をすると相手は
//		QueFuncSet(3,3);			//ﾒｯｾｰｼﾞ表示                        //戦闘ができなくなってしまわないか？
//		kw->sendwork[0] = KOUKAN_SEND_NO;
//		QueFuncSet(180,0);			//キャンセルデータ遅延で送信
	if(StatusSubCheck(work[0],kw->pokenum[0],kw->cursorposno)==0){
		QueFuncSet(3,2);			//ﾒｯｾｰｼﾞ表示                        //戦闘ができなくなってしまわないか？
		kw->sendwork[0] = KOUKAN_SEND_NO;
		QueFuncSet(180,0);			//キャンセルデータ遅延で送信
	}else{																//４つのチェックが通ればＯＫ
		QueFuncSet(3,1);			//ﾒｯｾｰｼﾞ表示
		kw->sendwork[0] = KOUKAN_SEND_YES;
		if(SplitDataSendStatus()){										//送信
			SplitDataSendStart(GetAnotherSendTo(),(u8 *)kw->sendwork,20);
		}
	}

}

//==========================================================================
//  こうかんしますか？YES／NO選択
//==========================================================================
static void menu3pad_func()
{

	if(sys.Repeat & U_KEY){
		SePlay(SE_SELECT);
		kw->menupos=NMenuVCursorSet(-1);
	}else if(sys.Repeat & D_KEY){
		SePlay(SE_SELECT);
		kw->menupos=NMenuVCursorSet(1);
	}
	if(sys.Trg&A_BUTTON){
		
		SePlay(SE_SELECT);
		if(NMenuVCursorPosGet()==0){	//「はい」を選択
			//はいを送るための処理
			SendYesMessageCheck();
		}else{							//「いいえ」を選択
			QueFuncSet(3,1);			//ﾒｯｾｰｼﾞ表示
			if(SplitDataSendStatus()){
				kw->sendwork[0] = KOUKAN_SEND_NO;
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)kw->sendwork,20);
			}
		}
		kw->menuflag = 100;						//空まわしするための番号
	}else if(sys.Trg&B_BUTTON){
		QueFuncSet(3,1);			//ﾒｯｾｰｼﾞ表示
		if(NMenuVCursorPosGet()==0){
			kw->menupos=NMenuVCursorSet(1);
		}
		kw->sendwork[0] = KOUKAN_SEND_NO;
		SplitDataSendStart(GetAnotherSendTo(),(u8 *)kw->sendwork,20);
		kw->menuflag = 100;						//空まわしするための番号
	}
}



//==========================================================================
//  終了するか選択
//==========================================================================
static void menu4pad_func()
{
	if(sys.Repeat & U_KEY){
		SePlay(SE_SELECT);
		kw->menupos=NMenuVCursorSet(-1);
	}else if(sys.Repeat & D_KEY){
		SePlay(SE_SELECT);
		kw->menupos=NMenuVCursorSet(1);
	}
	if(sys.Trg&A_BUTTON){
			SePlay(SE_SELECT);
			if(NMenuVCursorPosGet()==0){	//こうかん画面終了
//				PaletteFadeReq(0xffffffff,0,0,16,0);
//				LightFadeReq(N_to_B);
				system_message_window(4);			//ともだちのしゅうりょうを待っています。
				kw->sendwork[0]  = KOUKAN_END_SELECT;//次の処理に移るように子機に指示
				kw->sendwork[1]  = 0;				//その際に親はどのポケモンを選択したか送る
				QueFuncSet(5,0);					//sendworkをSplitDataSendStartで5sync後に送信
				ActWork[kw->cursorno].banish = 1;	//カーソルを消す

				kw->menuflag = 100;
			}else{
				return_endmenu();
			}
	}else if(sys.Trg&B_BUTTON){
		SePlay(SE_SELECT);
		return_endmenu();
	}

}


//==========================================================================
//  親の場合、サブページのアニメを開始させる
//==========================================================================
static void menu6_func()
{
	if(GetSioConnectId()==0){
			statuspage_set_start(kw->cursorposno);
			statuspage_set_start(kw->enemy_select);
	}
	kw->menuflag=7;
}


//==========================================================================
//  サブページの処理が終了したら「こうかんしますか？」選択へ
//==========================================================================
static void menu7_func()
{
	if(kw->statuspage_flag[0]==5&&kw->statuspage_flag[1]==5){
		koukan_select_set();
		kw->menuflag=14;
	}
}

//==========================================================================
//  サブページの処理が終了したら「こうかんしますか？」選択へ
//==========================================================================
static void menu7b_func()
{
	kw->wait++;
	if(kw->wait>120){
		NWinFrameWrite(&kw->tw, YESNO_POS_X1,YESNO_POS_Y1,YESNO_POS_X2,YESNO_POS_Y2);
		YesNoSelectStrInit(YESNO_POS_X1,YESNO_POS_Y1);
		kw->wait = 0;
		kw->menuflag = 3;
	}
}

//==========================================================================
//  こうかんがキャンセルされた場合のボタン押し待ち
//==========================================================================
static void menu8_func()
{
	if(sys.Trg&A_BUTTON){
		SePlay(SE_SELECT);
		return_statuspage(0);
		return_statuspage(1);
//		for(i=0;i<2;i++){
//			kw->wait_flag[i] = 0;
//			kw->ok_flag[i]   = 0;
//		}
		kw->menuflag=0;
		ActWork[kw->cursorno].banish=0;
	}
}

//==========================================================================
//  こうかん画面終了フェードアウト待ち
//==========================================================================
static void endfadeout_func()
{
	if( FadeData.fade_sw == 0 )
	{
		SetSioEndDataStart();
//		PokemonMultiSioEnd();
	//	ContinueFieldScript();
	//	pFieldRecoverFunc = AddFieldInTask;
	//	SetNextWorldPosition();
	//	sys.pMainProc = CommTradeEnd;
		kw->menuflag=12;
	};

}

static void endsio_func()
{
	if(pokemon_sio_flag==0){
//		sys.pFirstProc = PushFirstProc;			//通信処理を常駐処理に
		MainProcChange(FieldCommRecover);
	}
}
//==========================================================================
//  ﾊﾟｯﾄﾞ処理
//==========================================================================
static void PadFunc()
{

	switch(kw->menuflag){
		case 0:		menu0pad_func();		break;		//通常時
		case 1:		menu1pad_func();		break;		//左列選択時
		case 2:		menu2pad_func();		break;		//「ステータス」選択時
		case 3:		menu3pad_func();		break;		//「こうかん」選択
		case 4:		menu4pad_func();		break;		//「おわる」選択時
		case 6:		menu6_func();			break;		//サブページのアニメを開始させる
		case 7:		menu7_func();			break;		//サブページのアニメ終了待ち
		case 8:		menu8_func();			break;		//こうかんキャンセル後
		case 9:		fadeout_func();			break;		//フェードアウト開始
		case 10: 	fadeout_wait_func();	break;		//こうかんデモ開始
		case 11:	endfadeout_func();		break;		//こうかん画面終了
		case 12:	endsio_func();			break;		//通信終了同期
		case 13:	multisio_end_wait();	break;		//こうかんデモ用通信終了同期
		case 14:	menu7b_func();			break;		//こうかんのはい・いいえに行く前に待ち
		case 15:	menu_key_wait();		break;		//キー待ちして通常画面に戻る
	}

#if 0
	if(sys.Trg&L_BUTTON){
			kw->sendwork[0] = KOUKAN_NEXT_TERM;	//次の処理に移るように子機に指示
			kw->sendwork[1] = kw->cursorposno;	//その際に親はどのポケモンを選択したか送る
			if(SplitDataSendStatus())
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)kw->sendwork,20);
			PaletteWorkSet(Test_Palette,F_PAL*16,32);
	}
	for(i=0;i<200;i++)
		multisiotestdata[i] = testdata[count%3][i];
	SplitDataSendStart((0x01<<(GetSioConnectId()^1)),(u8*)multisiotestdata,200);
	count++;
#endif

}


//==========================================================================
//ステータス画面準備開始
//==========================================================================
static void statuspage_set_start(u8 pos)
{
	u8 side;

	side = pos/6;
	if(kw->statuspage_flag[side]==0){
		kw->statuspage_flag[side] = 1;
		kw->statuspage_num[side]  = pos;
	}
}


static const u8 subwindowpos[2][2]={
	{4,3},	{4+15,3}
};


#define MONS_NAME_INFO	((MONS_NAME_SIZE+6)*2)
//#define MONS_INFO_1SET	(4*WAZA_NAME_SIZE*2+MONS_NAME_INFO)
#define MONS_INFO_1SET	(MONS_NAME_INFO*6)

//==========================================================================
//  ステータス画面表示
//==========================================================================
static void statuspage_set(u8 side)
{
	u8 g,p,i,pos;
	s8 len;
	u8 buf[20],buf2[8*4+5];

	pos = kw->statuspage_num[side];
	if(pos<6)	g = 0;
	else		g = 1;
	p = pos%6;
	len = 0;

	switch(kw->statuspage_flag[side]){
		case 1:
			//選択した側のﾎﾟｹﾓﾝｱｲｺﾝをすべて隠す
			for(i=0;i<kw->pokenum[side];i++)
				ActWork[kw->iconno[g][i]].banish = 1;

			ActWork[kw->iconno[g][p]].banish = 0;							//選択したﾎﾟｹﾓﾝだけｱｲｺﾝ表示
			ActWork[kw->iconno[g][p]].work[0] = 20;
			ActWork[kw->iconno[g][p]].work[2] = ((namepos[g*6][0]+namepos[g*6+1][0])/2)*8+14;	//ｳｲﾝﾄﾞｳ中央上に表示
			ActWork[kw->iconno[g][p]].work[4] = namepos[g*6][1]*8-12;
			SetWorkSeq(&ActWork[kw->iconno[g][p]], PokeIconDmmyMove);
			kw->statuspage_flag[side]++;
			W_StraightMove2(&ActWork[kw->iconno[g][p]]);
			FontScrnBoxFill( &(kw->tw) , 0, clear_area[g][0], 0, clear_area[g][1], 19);	//書き換え領域だけﾃｷｽﾄｸﾘｱ
			block_map_copy16(&kw->bcw,15*side,0,(u16*)kk_bg2a2_Map,15,17,0x0000);
			if(g==0)
				menu_erase();
			break;

		case 2:
			if(ActWork[kw->iconno[g][p]].move==PokeIconDmmyMove)
				kw->statuspage_flag[side]++;
			break;
		case 3:
			//背景ｳｲﾝﾄﾞｳをｽﾃｰﾀｽ用に入れ替える(自分側・相手側を個別にMAP変更する)
			block_map_copy16(&kw->bcw,g*15,0,(u16*)kk_bg2a_Map,15,17,0x0000);

			ActWork[kw->iconno[g][p]].x = ((namepos[g*6][0]+namepos[g*6+1][0])/2)*8+14;	//ｳｲﾝﾄﾞｳ中央上に表示
			ActWork[kw->iconno[g][p]].y = namepos[g*6][1]*8-12;
			ActWork[kw->iconno[g][p]].dx = 0;
			ActWork[kw->iconno[g][p]].dy = 0;

			
			len = pokemon_info_set(buf,g,p);								//名前・性別・ﾚﾍﾞﾙ文字列作成
			if(len>10) len  =-1;
			else		len = 0;

			MsgPrint(&(kw->tw),buf,kw->windowwork+g*MONS_INFO_1SET,
				statuspos[g*2+0][0]+len,statuspos[g*2+0][1]);	//名前表示
//			NMenuMsgWrite(buf,statuspos[g*2+0][0],statuspos[g*2+0][1]);	//名前表示
			
			pokemon_waza_set(buf2,g,p);											//わざﾘｽﾄ文字列作成
			
			MsgPrint(&(kw->tw),waza_str,kw->windowwork+g*MONS_INFO_1SET+MONS_NAME_INFO,
				statuspos[g*2+1][0],statuspos[g*2+1][1]+1);	//「わざ」表示
			MsgPrint(&(kw->tw),buf2,kw->windowwork+g*MONS_INFO_1SET+MONS_NAME_INFO+6,
				statuspos[g*2+1][0]+3,statuspos[g*2+1][1]+1);	//わざﾘｽﾄ表示
//			NMenuMsgWrite(waza_str,statuspos[g*2+1][0],statuspos[g*2+1][1]+1);	//「わざ」表示
//			NMenuMsgWrite(buf2,statuspos[g*2+1][0]+3,statuspos[g*2+1][1]+1);	//わざﾘｽﾄ表示
			kw->statuspage_flag[side]++;
			break;
		case 4:
			SetExplainFont32x16(kk_msg_tbl[5], (u8*)(OBJ_MODE0_VRAM+(kw->inst_no<<5)),EXPLAIN_CELL);
//			BoxDrawFont_32x16(kk_msg_tbl[5], (u8*)(OBJ_MODE0_VRAM+(kw->inst_no<<5)), DRAWTYPE_16TRANS, 0, UserWork);
			level_put(side, p, subwindowpos[side][0]+4,subwindowpos[side][1]+1,subwindowpos[side][0],subwindowpos[side][1]);
			kw->statuspage_flag[side]++;
			break;
	}
}

//==========================================================================
//  選択ポケモン情報文字列作成
//==========================================================================
static u8 pokemon_info_set(u8 *buf, u8 group, u8 pos)
{
	u8 w,lv,work[MONS_NAME_SIZE+EOM_SIZE];

	if(group==0){				//自分側
		PokeParaGet(&PokeParaMine[pos],ID_nickname,work);
		NickNameCopy(buf,work);
		w  = PokeSexGet(&PokeParaMine[pos]);
		lv = PokeParaGet(&PokeParaMine[pos],ID_level);
	}else{						//相手側
		PokeParaGet(&PokeParaEnemy[pos],ID_nickname,work);
		NickNameCopy(buf,work);
		w=PokeSexGet(&PokeParaEnemy[pos]);
		lv = PokeParaGet(&PokeParaEnemy[pos],ID_level);
	}
	if(kw->tamago[group][pos%6]==0){
		PM_SexStrcat(buf,w);
	}
	PM_strcat(buf,str_sura);
	if(kw->tamago[group][pos%6]==0){
		PM_strcat(buf,str_lv);
		PM_NumMsgSet(work, lv, NUM_MODE_LEFT, 3);
		PM_strcat(buf,work);
	}else{
		PM_strcat(buf,str_bou);
	}
	return PM_strlen(buf);
}

//==========================================================================
//  ポケモンの持ってるわざリスト作成
//==========================================================================
static void pokemon_waza_set(u8 *buf, u8 group, u8 pos)
{
	u16 waza[4],i;

	if(kw->tamago[group][pos]==0){
		for(i=0;i<4;i++){
			if(group==0){
				waza[i]=PokeParaGet(&PokeParaMine[pos],ID_waza1+i,NULL);
			}else{
				waza[i]=PokeParaGet(&PokeParaEnemy[pos],ID_waza1+i,NULL);
			}
		}
		PM_strcpy(buf,colchg);
		for(i=0;i<4;i++){
			if(waza[i]!=0)
				PM_strcat(buf,WazaNameData[waza[i]]);
			PM_strcat(buf,cr_str);
		}
	}else{
		PM_strcpy(buf,colchg);
		PM_strcat(buf,str_hatena);
	}
}

//==========================================================================
//  ポケモンの名前を表示（最高６つ）
//
//
//  入力値：0=自分側 1=相手側
//==========================================================================
static void pokename_put(u8 side)
{
	u8 i,w;
	u8  work[20];
	u8	name[20];
	
	for(i=0;i<kw->pokenum[side];i++){					//ポケモンアイコン表示・ポケモン名前表示
		if(!side){
			PokeParaGet(&PokeParaMine[i],ID_nickname,work);				
			NickNameCopy(name,work);
			w=PokeSexGet(&PokeParaMine[i]);
		}else{
			PokeParaGet(&PokeParaEnemy[i],ID_nickname,work);				
			NickNameCopy(name,work);
			w=PokeSexGet(&PokeParaEnemy[i]);
		}
		if(kw->tamago[side][i]==0){
			PM_SexStrcat(name,w);
		}
		MsgPrint(&(kw->tw),name,kw->windowwork+(side*MONS_NAME_SIZE*2*6)+i*MONS_NAME_SIZE*2,
			namepos[i+side*6][0],namepos[i+side*6][1]);
	}

}


#define LEVEL_LEFT_CELLNO (6*16)
#define LEVEL_RIGHT_CELLNO (7*16)
//==========================================================================
//  一体分のポケモンのレベルを表示する
//==========================================================================
static void level_put(u8 side, u8 n, u8 lx, u8 ly, u8 wx, u8 wy)
{
	u8 level;


	block_map_copy16(&kw->bcw,wx, wy,(u16*)kk_bg4_Map,6,3,0x0000);
	if(!side)	level=PokeParaGet(&PokeParaMine[n],ID_level,NULL);				
	else		level=PokeParaGet(&PokeParaEnemy[n],ID_level,NULL);				
	
	if(kw->tamago[side][n]==0){				//タマゴはレベルを表示しない
		if((level/10)!=0)
			kw->bcw.bgvram[lx+ly*32]   = LEVEL_LEFT_CELLNO+level/10;
		kw->bcw.bgvram[lx+ly*32+1]     = LEVEL_RIGHT_CELLNO + level%10;
	}else{
		kw->bcw.bgvram[lx+ly*32-32]    = kw->bcw.bgvram[lx+ly*32-32-1];			//「LV」を潰すために
		kw->bcw.bgvram[lx+ly*32-32+1]  = kw->bcw.bgvram[lx+ly*32-32-4]|(1<<10);	//横のMAP情報を拝借

	}							
}
//==========================================================================
//  ポケモンのレベル表示(BG1)
//==========================================================================
static void pokelevel_put(u8 side)
{
	int i,w;
//	block_map_copy16(&kw->bcw,16+7*(i/3),3+5*(i%3),(u16*)kk_bg4_Map,6,3,0x0000);

	for(i=0;i<kw->pokenum[side];i++){
		w = i+side*6;
		level_put(side,i,levelpos[w][0],levelpos[w][1],levelwindowpos[w][0],levelwindowpos[w][1]);
	}


}

//==========================================================================
// ポケモンアイコンのリスト表示用の座標を設定する
//==========================================================================
static void pokeicon_pos_set(u8 side)
{
	int i;
	for(i=0;i<kw->pokenum[side];i++){
		ActWork[kw->iconno[side][i]].banish = 0;
		ActWork[kw->iconno[side][i]].x  = namepos[i+6*side][0]*8+14;
		ActWork[kw->iconno[side][i]].y  = namepos[i+6*side][1]*8-12;
		ActWork[kw->iconno[side][i]].dx = 0;
		ActWork[kw->iconno[side][i]].dy = 0;
	}
}


//==========================================================================
//
//	「ステータス・こうかんにだす」のメニューを消す
//
//==========================================================================
static void menu_erase()
{
	FontScrnBoxFill( &(kw->tw) , 0, clear_area[1][0], 0, clear_area[1][1], 19);	//書き換え領域だけﾃｷｽﾄｸﾘｱ
	pokename_put(1);
}

//==========================================================================
//
//	こうかんYESNO画面の消去
//
//==========================================================================
static void return_statuspage(u8 side)
{

	if(side==0){
		FontScrnBoxFill( &(kw->tw) , 0, clear_area[0][0], 0, clear_area[0][1], 19);	//書き換え領域だけﾃｷｽﾄｸﾘｱ
		block_map_copy16(&kw->bcw,0,0,(u16*)kk_bg2a2_Map,15,17,0x0000);
		pokelevel_put(0);
		pokename_put(0);
		pokeicon_pos_set(0);
		block_map_refresh(&kw->bcw);
	}else{
		FontScrnBoxFill( &(kw->tw) , 0, clear_area[1][0], 0, clear_area[1][1], 19);	//書き換え領域だけﾃｷｽﾄｸﾘｱ
		block_map_copy16(&kw->bcw,15,0,(u16*)kk_bg2a2_Map,15,17,0x0000);
		pokelevel_put(1);
		pokename_put(1);
		pokeicon_pos_set(1);
		block_map_refresh(&kw->bcw);
	}
	SetExplainFont32x16(kk_msg_tbl[1], (u8*)(OBJ_MODE0_VRAM+(kw->inst_no<<5)),EXPLAIN_CELL);
	kw->statuspage_flag[side] = 0;

}

/*==================================================================*/
/*  仮想VRAMの内容を転送											*/
/*==================================================================*/
void block_map_refresh(BLOCK_COPY_WORK *work)
{
	work->transflag=1;
}

/*==================================================================*/
/*  block_map_copy16()のVSync内用の関数             by  AkitoMori   */
/*																	*/
/*==================================================================*/
void block_map_copy16_main(BLOCK_COPY_WORK *work)
{
	if(work->transflag){
		CpuCopy(work->bgvram,work->des,32*32*2,16);
		work->transflag = 0;
	}
}

/*==================================================================*/
/*  block_map_copy の初期化											*/
/*																	*/
/*																	*/
/*	work:  BLOCK_COPY_WORK構造体のﾎﾟｲﾝﾀを指定						*/
/*	des :  転送先を指定する											*/
/*==================================================================*/
void block_map_copy_init(BLOCK_COPY_WORK *work, u16* des)
{
	work->transflag = 0;
	work->des = des;
}

/*===================================================================*/
/*  block_map_copy16()                              by  AkitoMori    */
/* 32*20のBGﾏｯﾌﾟﾃﾞｰﾀを前提とした空間にそれ以下のMAPﾃﾞｰﾀを転送する命令*/
/* 主に16色用														 */
/*    x:転送する空間へのﾏｯﾌﾟ位置のxｽﾀｰﾄ                              */
/*    y:転送する空間へのﾏｯﾌﾟ位置のyｽﾀｰﾄ                              */
/*  src:転送するﾃﾞｰﾀ                                                 */
/*    w:srcの横の大きさ                                              */
/*    h:srcの縦の大きさ                                              */
/*  mask:転送時にこの値がｏｒされる（ﾊﾟﾚｯﾄ指定するため）             */
/*  32x20のﾏｯﾌﾟに固定												 */
/*																	 */
/*	実際はVSYNC内で呼ばれる関数block_map_copy16_mainで転送する		 */
/*===================================================================*/
void block_map_copy16(BLOCK_COPY_WORK *work,char x, char y, u16*src, char w,char h,u16 mask)
{
	int m,n;

	for(m=0;m<h;m++){				/*ﾏｯﾌﾟﾃﾞｰﾀﾌﾞﾛｯｸｺﾋﾟｰ*/
		for(n=0;n<w;n++){
			work->bgvram[y*32+x+m*32+n] = src[w*m+n]|mask;
		}
	}
		
	work->transflag = 1;
}


// =================================================================
// Menustatus
// 概要  : 画面消去[メニュー項目の選択後]
// 引数  : none
// 戻り値: none
// =================================================================
static void Menustatus()
{
	NMenuScreenClear();
}

// =================================================================
// Menukoukan
// 概要  : 画面消去[メニュー項目の選択後]
// 引数  : none
// 戻り値: none
// =================================================================
static void Menukoukan()
{
	NMenuScreenClear();
}


/*==================================================================*/
/*  画面中央に表示するシステム系のメッセージ						*/
/*==================================================================*/
static void system_message_window(u8 mes)
{

	NWinFrameWrite(&kw->tw, 
		sysmsg_tbl[mes][0],sysmsg_tbl[mes][1],sysmsg_tbl[mes][2],sysmsg_tbl[mes][3]);
	MsgPrint(&(kw->tw),system_msg[mes],kw->windowwork+(MONS_NAME_INFO*6)*2,
		sysmsg_tbl[mes][0]+1,sysmsg_tbl[mes][1]+1);		
	
}

//==========================================================================
//  適当なＱＵＥ処理セットルーチン
//==========================================================================
static void QueFuncSet(u16 wait, u8 funcno)
{
	int i;
	for(i=0;i<QUE_MAX;i++){
		if(kw->que[i].flg==0){
			kw->que[i].wait = wait;
			kw->que[i].funcno = funcno;
			kw->que[i].flg=1;
			break;
		}
	}
}

//==========================================================================
//  適当なＱＵＥ処理メインルーチン
//==========================================================================
static void QueFuncMain()
{
	int i;
	for(i=0;i<QUE_MAX;i++){
		if(kw->que[i].flg){
			if(kw->que[i].wait!=0){
				kw->que[i].wait--;
			}else{
				switch(kw->que[i].funcno){
					case 0:
						SplitDataSendStart(GetAnotherSendTo(),(u8 *)kw->sendwork,20);
						break;
					case 1:
						system_message_window(0);		//「つうしん待機中！」
						break;
					case 2:
						system_message_window(2);		//「そのこうかんをおこなうと…」
						break;
					case 3:
						system_message_window(3);		//「あいては戦闘できなくなっちゃうよ」
						break;
					case 4:
						system_message_window(3);		//「あいては戦闘できなくなっちゃうよ」
						break;
					case 5:
						system_message_window(3);		//「あいては戦闘できなくなっちゃうよ」
						break;
				}
				kw->que[i].flg=0;
			}
		}
	}
}



// =================================================================
// RenzokuCellSet
// 概要  : キャラをちょっとずつVRAMに転送する
// 引数  : none
// 戻り値: static u8
// =================================================================
static u8 RenzokuCellSet()
{
	switch(kw->wait){
		case 0:	CellSet((CellData*)&NameActCell[0]); kw->wait++;		break;
		case 1:	CellSet((CellData*)&NameActCell[1]); kw->wait++;		break;
		case 2:	CellSet((CellData*)&NameActCell[2]); kw->wait++;		break;
		case 3:	CellSet((CellData*)&NameActCell[3]); kw->wait++;		break;
		case 4:	CellSet((CellData*)&NameActCell[4]); kw->wait++;		break;
		case 5:	CellSet((CellData*)&NameActCell[5]); kw->wait++;		break;
		case 6:	CellSet((CellData*)&NameActCell[6]); kw->wait++;		break;
		case 7:
			kw->inst_no = CellSet((CellData *)&NameActCell[7]);
			kw->wait++;
			break;
		case 8:	CellSet((CellData*)&NameActCell[8]); kw->wait++;		break;
		case 9:	CellSet((CellData*)&NameActCell[9]); kw->wait++;		break;
		case 10:CellSet((CellData*)&NameActCell[10]); kw->wait++;	break;
		case 11:CellSet((CellData*)&NameActCell[11]); kw->wait++;	break;
		case 12:CellSet((CellData*)&NameActCell[12]); kw->wait++;	break;
		case 13:ObjPalSet((PalData *)&NameActPal);	 kw->wait++;		break;
		case 14:ObjPalSet((PalData *)&CursorActPal); kw->wait++;		break;
		case 15:CellSet((CellData*)&CursorActCell);  kw->wait++;	break;
		case 16:
			kw->wait = 0;
			return 1;
			break;
	}

	return 0;
}


// ======================================================================
// SetExplainFont32x16
// 概要  : BoxDrawFont_32x16をこうかん画面の説明文章に利用するための関数
// 引数  : str 表示する文字列
//       : dst セル位置のﾎﾟｲﾝﾀ
//       : max  文字列の最大文字数
// 戻り値: none
// ======================================================================
static void SetExplainFont32x16(const u8 *str, u8 *dst, u8 max)
{
	int i;
	u8 STrBuf[(LCD_WIDTH/8)+1];
	
	PM_strclear(STrBuf,spc_,max);
	for(i=0;i<max;i++){
		if(str[i]!=EOM_) STrBuf[i] = str[i];
		else			break;
	}
	BoxDrawFont_32x16(STrBuf, dst, DRAWTYPE_16TRANS, 0, UserWork);
}



// ==================================================================
// PokeStatusGet
// 概要  : ポケモンが瀕死だったりタマゴだったりしないかをチェック
// 引数  : none
// 戻り値: kw->pokestatus[2][6]に正常だったら１、異常だったら０を格納
// ==================================================================
static void PokeStatusGet(u8 no)
{
	int i;

	switch(no){
		case 0:											//自分側のポケモンを調査
			for(i=0;i<kw->pokenum[no];i++){
				if(PokeParaGet(&PokeParaMine[i],ID_tamago_flag)==1){	//たまごか
					kw->pokestatus[no][i] = 0;
					kw->tamago[no][i] = 1;
					continue;
				}else if(PokeParaGet(&PokeParaMine[i],ID_hp)==0){		//瀕死か
					kw->pokestatus[no][i] = 0;
					kw->tamago[no][i] = 0;
				}else{
					kw->pokestatus[no][i] = 1;
					kw->tamago[no][i] = 0;
				}
			}
			break;
		case 1:
			for(i=0;i<kw->pokenum[no];i++){				//相手側のポケモンを調査
				if(PokeParaGet(&PokeParaEnemy[i],ID_tamago_flag)==1){	//たまごか
					kw->pokestatus[no][i] = 0;
					kw->tamago[no][i] = 1;
					continue;
				}else if(PokeParaGet(&PokeParaEnemy[i],ID_hp)==0){		//瀕死か
					kw->pokestatus[no][i] = 0;
					kw->tamago[no][i] = 0;
				}else{
					kw->pokestatus[no][i] = 1;
					kw->tamago[no][i] = 0;
				}
			}
			break;
	}
}


// =================================================================
// PokeIconActionSearch
// 概要  : ポケモンアイコンの動きをつけるために準備する
// 引数  : no
// 戻り値: kw->iconaction[2][6]に動きの値が入る
// =================================================================
static void PokeIconActionSearch(u8 no)
{
	u16 life,max,i;
	switch(no){
		case 0:											//自分側のポケモンを調査
			for(i=0;i<kw->pokenum[0];i++){
				life = PokeParaGet(&PokeParaMine[i],ID_hp);
				max  = PokeParaGet(&PokeParaMine[i],ID_hpmax);
				kw->iconaction[0][i] = GetGaugeDottoColor(life,max);
			}
			break;
		case 1:
			for(i=0;i<kw->pokenum[1];i++){
				life = PokeParaGet(&PokeParaEnemy[i],ID_hp);
				max  = PokeParaGet(&PokeParaEnemy[i],ID_hpmax);
				kw->iconaction[1][i] = GetGaugeDottoColor(life,max);
			}
			break;
	}
	
}

// =================================================================
// PokeIconActionSet
// 概要  : ポケモンアイコンの動作をセットする
// 引数  : none
// 戻り値: none
// =================================================================
static void PokeIconActionSet()
{
	int i,w;
	for(w=0;w<2;w++)
		for(i=0;i<kw->pokenum[w];i++){
			ExtAnmChg(&ActWork[kw->iconno[w][i]],4 - kw->iconaction[w][i]);
		}
}

// =================================================================
// RibbonInfoCheck
// 概要  : リボン情報のチェック・共有
// 引数  : none
// 戻り値: none
// =================================================================
static void RibbonInfoCheck()
{
	int i;
	for(i=0;i<EXTRA_RIBBON_MAX;i++){
		if(Fld.ExRibbonNo[i] == 0){							//もし自分のリボン情報BOXが空で
			if(kw->RibbonTbl[i] != 0){						//相手のBOXには情報があったら
				Fld.ExRibbonNo[i] = kw->RibbonTbl[i];		//もらう
			}	
		}
	}
}
