//=========================================================================
//	
//	ポケモン図鑑ソート
//
//=========================================================================
#include "common.h"
#include "intr.h"
#include "actor.h"
#include "actanm.h"
#include "palanm.h"
#include "task.h"
#include "print.h"
#include "poketool.h"
#include "menu.h"
#include "window.h"
#include "calctool.h"
#include "fight.h"
#include "zukan.h"
#include "ev_flag.h"
#include "message.h"
#include "decord.h"
#include "mus_tool.h"

#include "z_sort.dat"

extern	const u8		ZokuseiMsg[][5];
extern	const CellData  ZukanCell[];
extern	const PalData	ZukanPal[];

/*==================================================================*/
/*                                                                  */
/*				ポケモン検索										*/
/*                                                                  */
/*==================================================================*/
static	const	u8	ZS_NameTbl[][4] = {
//検索開始文字１、検索幅１、検索開始文字２、検索幅２
{  0, 0,  0, 0},{ A_, 5,  0, 0},{KA_, 5,GA_, 5},{SA_, 5,ZA_, 5},{TA_, 5,DA_, 5},
{NA_, 5,  0, 0},{HA_, 5,BA_,10},{MA_, 5,  0, 0},{RA_, 5,  0, 0},{YA_, 3,WA_, 3}
};
static	u16	ZukanSearch(u8 mode,u8 sort,u8 name,u8 color,u8 type1,u8 type2)
{
	u16	rp,wp,pokenum;
	u8	dat;
	u8	work[4];

	//リスト構成（メイン図鑑用、モード＋並び）
	ZukanListMake(mode,sort);
	//「みつけた」ポケモンを検索し、詰める
	for(rp=0,wp=0;rp<POKE_NUM_MAX;rp++){
		if(zw->listWork[rp].look){
			zw->listWork[wp] = zw->listWork[rp];
			wp++;
		}
	}
	zw->listMax = wp;

	//名前検索し、詰める
	if(name != 0xff){
		for(rp=0,wp=0;rp<zw->listMax;rp++){
			pokenum = PokeZukanNo2MonsNoGet(zw->listWork[rp].num);		//全国→開発ナンバー
			dat = PokeNameData[pokenum][0];
			
			if(((dat >= ZS_NameTbl[name][0])&&(dat < ZS_NameTbl[name][0] + ZS_NameTbl[name][1]))
			 ||((dat >= ZS_NameTbl[name][2])&&(dat < ZS_NameTbl[name][2] + ZS_NameTbl[name][3]))){
				zw->listWork[wp] = zw->listWork[rp];
				wp++;
			}
		}
		zw->listMax = wp;
	}
	//色検索し、詰める
	if(color != 0xff){
		for(rp=0,wp=0;rp<zw->listMax;rp++){
			pokenum = PokeZukanNo2MonsNoGet(zw->listWork[rp].num);		//全国→開発ナンバー
			
			if(color == PPD[pokenum].color){
				zw->listWork[wp] = zw->listWork[rp];
				wp++;
			}
		}
		zw->listMax = wp;
	}
	//タイプ検索
	if((type1 != 0xff)||(type2 != 0xff)){
		//指定タイプが１つのとき、type1のみの検索にする
		if(type1 == 0xff){
			type1 = type2;	
			type2 = 0xff;	
		}
		//タイプ＆「つかまえた」ポケモンを検索し、詰める
		if(type2 == 0xff){
			//１つタイプ検索
			for(rp=0,wp=0;rp<zw->listMax;rp++){
				if(zw->listWork[rp].get){
					pokenum = PokeZukanNo2MonsNoGet(zw->listWork[rp].num);		//全国→開発ナンバー
					work[0]	= PPD[pokenum].type1;
					work[1]	= PPD[pokenum].type2;
					if((work[0]==type1)||(work[1]==type1)){
						zw->listWork[wp] = zw->listWork[rp];
						wp++;
					}
				}
			}
		}else{
			//２つタイプ検索
			for(rp=0,wp=0;rp<zw->listMax;rp++){
				if(zw->listWork[rp].get){
					pokenum = PokeZukanNo2MonsNoGet(zw->listWork[rp].num);		//全国→開発ナンバー
					work[0]	= PPD[pokenum].type1;
					work[1]	= PPD[pokenum].type2;
					if(((work[0]==type1)&&(work[1]==type2))
							||((work[0]==type2)&&(work[1]==type1))){
						zw->listWork[wp] = zw->listWork[rp];
						wp++;
					}
				}
			}
		}
		zw->listMax = wp;
	}
	//検索終了処理
	if(zw->listMax){
		for(rp=zw->listMax;rp<POKE_NUM_MAX;rp++){
			zw->listWork[rp].num  = LISTOVER;
			zw->listWork[rp].look = 0;
			zw->listWork[rp].get  = 0;
		}
	}
	return wp;
}










/*==================================================================*/
/*                                                                  */
/*				ポケモン検索操作									*/
/*                                                                  */
/*==================================================================*/
#define	MENU_CP		(0)
#define	MENU_LP		(1)

#define	MODE_CP		(2)
#define	MODE_LP		(3)
#define	SORT_CP		(4)
#define	SORT_LP		(5)
#define	NAME_CP		(6)
#define	NAME_LP		(7)
#define	COLOR_CP	(8)
#define	COLOR_LP	(9)
#define	TYPE1_CP	(10)
#define	TYPE1_LP	(11)
#define	TYPE2_CP	(12)
#define	TYPE2_LP	(13)

#define	MENU_CP_BAK	(14)
#define	MENU_LP_BAK	(15)

#define	ZSP_NAME		(0)
#define	ZSP_COLOR		(1)
#define	ZSP_TYPE1		(2)
#define	ZSP_TYPE2		(3)
#define	ZSP_SORT		(4)
#define	ZSP_MODE		(5)

#define	ZSP_START		(6)
#define	ZSP_NOMOVE		(0xff)

typedef struct {

const u8*	text;

u8	x1;	
u8	y1;	
u8	len1;	

}ZSORT_MAIN_MENU;

typedef struct {

const u8*	text;

u8	x1;	
u8	y1;	
u8	len1;	

u8	x2;	
u8	y2;	
u8	len2;	

}ZSORT_MENU;

typedef struct {

u8	L_keyp;	
u8	R_keyp;	
u8	U_keyp;	
u8	D_keyp;	

}ZSORT_MOVE;

typedef struct {

const u8*	text;
const u8*	list;

}ZSORT_LIST;

typedef struct {

const ZSORT_LIST*	listp;
u8					cp;
u8					lp;
u16					listmax;

}ZSORT_LIST_LIST;

static	const ZSORT_MAIN_MENU	ZsortMainMenu[] = {
{ZsortMenuText0,0, 0, 5},{ZsortMenuText1,6, 0, 5},{ZsortMenuText2,12, 0, 5}
};

static	const ZSORT_MENU	ZsortMenu[] = {
{ZsortMenuText5,		0, 2, 5,	 5, 2,12 },
{ZsortMenuText6,		0, 4, 5,	 5, 4,12 },
{ZsortMenuText7,		0, 6, 5,	 5, 6, 6 },
{ZsortMenuText7,		0, 6, 5,	11, 6, 6 },
{ZsortMenuText4,		0, 8, 5,	 5, 8,12 },
{ZsortMenuText3,		0,10, 5,	 5,10,12 },

{ZsortMenuText8,		0,12, 5,	 0,0,0 },
};

static	const ZSORT_MOVE	ZsortMove1[] = {
{ZSP_NOMOVE,ZSP_NOMOVE,ZSP_NOMOVE,ZSP_COLOR},
{ZSP_NOMOVE,ZSP_NOMOVE,ZSP_NAME,ZSP_TYPE1},	
{ZSP_NOMOVE,ZSP_TYPE2,ZSP_COLOR,ZSP_SORT},
{ZSP_TYPE1,ZSP_NOMOVE,ZSP_COLOR,ZSP_SORT},
{ZSP_NOMOVE,ZSP_NOMOVE,ZSP_TYPE1,ZSP_MODE},
{ZSP_NOMOVE,ZSP_NOMOVE,ZSP_SORT,ZSP_START},

{ZSP_NOMOVE,ZSP_NOMOVE,ZSP_MODE,ZSP_NOMOVE},
};

static	const ZSORT_MOVE	ZsortMove2[] = {
{ZSP_NOMOVE,ZSP_NOMOVE,ZSP_NOMOVE,ZSP_NOMOVE},
{ZSP_NOMOVE,ZSP_NOMOVE,ZSP_NOMOVE,ZSP_NOMOVE},	
{ZSP_NOMOVE,ZSP_NOMOVE,ZSP_NOMOVE,ZSP_NOMOVE},
{ZSP_NOMOVE,ZSP_NOMOVE,ZSP_NOMOVE,ZSP_NOMOVE},
{ZSP_NOMOVE,ZSP_NOMOVE,ZSP_NOMOVE,ZSP_MODE},
{ZSP_NOMOVE,ZSP_NOMOVE,ZSP_SORT,ZSP_START},

{ZSP_NOMOVE,ZSP_NOMOVE,ZSP_MODE,ZSP_NOMOVE},
};

static	const ZSORT_MOVE	ZsortMove3[] = {
{ZSP_NOMOVE,ZSP_NOMOVE,ZSP_NOMOVE,ZSP_COLOR},
{ZSP_NOMOVE,ZSP_NOMOVE,ZSP_NAME,ZSP_TYPE1},	
{ZSP_NOMOVE,ZSP_TYPE2,ZSP_COLOR,ZSP_SORT},
{ZSP_TYPE1,ZSP_NOMOVE,ZSP_COLOR,ZSP_SORT},
{ZSP_NOMOVE,ZSP_NOMOVE,ZSP_TYPE1,ZSP_START},
{ZSP_NOMOVE,ZSP_NOMOVE,ZSP_NOMOVE,ZSP_NOMOVE},

{ZSP_NOMOVE,ZSP_NOMOVE,ZSP_SORT,ZSP_NOMOVE},
};

static	const ZSORT_MOVE	ZsortMove4[] = {
{ZSP_NOMOVE,ZSP_NOMOVE,ZSP_NOMOVE,ZSP_NOMOVE},
{ZSP_NOMOVE,ZSP_NOMOVE,ZSP_NOMOVE,ZSP_NOMOVE},	
{ZSP_NOMOVE,ZSP_NOMOVE,ZSP_NOMOVE,ZSP_NOMOVE},
{ZSP_NOMOVE,ZSP_NOMOVE,ZSP_NOMOVE,ZSP_NOMOVE},
{ZSP_NOMOVE,ZSP_NOMOVE,ZSP_NOMOVE,ZSP_START},
{ZSP_NOMOVE,ZSP_NOMOVE,ZSP_NOMOVE,ZSP_NOMOVE},

{ZSP_NOMOVE,ZSP_NOMOVE,ZSP_SORT,ZSP_NOMOVE},
};


static	const ZSORT_LIST	ZsortList1[] = {
{ZsortList1_1text,ZsortList1_1},
{ZsortList1_2text,ZsortList1_2},
{0,0},
};

static	const ZSORT_LIST	ZsortList2[] = {
{ZsortList2_1text,ZsortList2_1},
{ZsortList2_2text,ZsortList2_2},
{ZsortList2_3text,ZsortList2_3},
{ZsortList2_4text,ZsortList2_4},
{ZsortList2_5text,ZsortList2_5},
{ZsortList2_6text,ZsortList2_6},
{0,0},
};

static	const ZSORT_LIST	ZsortList3[] = {
{ZsortList_Notext,ZsortList_Non},
{ZsortList_Notext,ZsortList3_1},
{ZsortList_Notext,ZsortList3_2},
{ZsortList_Notext,ZsortList3_3},
{ZsortList_Notext,ZsortList3_4},
{ZsortList_Notext,ZsortList3_5},
{ZsortList_Notext,ZsortList3_6},
{ZsortList_Notext,ZsortList3_7},
{ZsortList_Notext,ZsortList3_8},
{ZsortList_Notext,ZsortList3_9},
{0,0},
};

static	const ZSORT_LIST	ZsortList4[] = {
{ZsortList_Notext,ZsortList_Non},
{ZsortList_Notext,ZsortList4_1},
{ZsortList_Notext,ZsortList4_2},
{ZsortList_Notext,ZsortList4_3},
{ZsortList_Notext,ZsortList4_4},
{ZsortList_Notext,ZsortList4_5},
{ZsortList_Notext,ZsortList4_6},
{ZsortList_Notext,ZsortList4_7},
{ZsortList_Notext,ZsortList4_8},
{ZsortList_Notext,ZsortList4_9},
{ZsortList_Notext,ZsortList4_10},
{0,0},
};

static	const ZSORT_LIST	ZsortList5[] = {
{ZsortList_Notext,ZsortList_Non2},
{ZsortList_Notext,&(ZokuseiMsg[0][0])},
{ZsortList_Notext,&(ZokuseiMsg[1][0])},
{ZsortList_Notext,&(ZokuseiMsg[2][0])},
{ZsortList_Notext,&(ZokuseiMsg[3][0])},
{ZsortList_Notext,&(ZokuseiMsg[4][0])},
{ZsortList_Notext,&(ZokuseiMsg[5][0])},
{ZsortList_Notext,&(ZokuseiMsg[6][0])},
{ZsortList_Notext,&(ZokuseiMsg[7][0])},
{ZsortList_Notext,&(ZokuseiMsg[8][0])},
{ZsortList_Notext,&(ZokuseiMsg[10][0])},	//9「はてな」は跳ばす
{ZsortList_Notext,&(ZokuseiMsg[11][0])},
{ZsortList_Notext,&(ZokuseiMsg[12][0])},
{ZsortList_Notext,&(ZokuseiMsg[13][0])},
{ZsortList_Notext,&(ZokuseiMsg[14][0])},
{ZsortList_Notext,&(ZokuseiMsg[15][0])},
{ZsortList_Notext,&(ZokuseiMsg[16][0])},
{ZsortList_Notext,&(ZokuseiMsg[17][0])},
{0,0},
};

static	const u8	ZsortList1MenuTbl[] = {
ZLIST_NEW,
ZLIST_WORLD,
};

static	const u8	ZsortList2MenuTbl[] = {
ZSORT_NUM,
ZSORT_AIU,
ZSORT_OMOI,
ZSORT_KARUI,
ZSORT_TAKAI,
ZSORT_HIKUI,
};

static	const u8	ZsortList5MenuTbl[] = {
0xff,	//Dummy

NORMAL_TYPE,
BATTLE_TYPE,
HIKOU_TYPE,
POISON_TYPE,
JIMEN_TYPE,
IWA_TYPE,
MUSHI_TYPE,
GHOST_TYPE,
METAL_TYPE,

FIRE_TYPE,
WATER_TYPE,
KUSA_TYPE,
ELECTRIC_TYPE,
SP_TYPE,
KOORI_TYPE,
DRAGON_TYPE,
AKU_TYPE,
};

static	const ZSORT_LIST_LIST	ZsortList[] = {
{ZsortList3,	NAME_CP,	NAME_LP,	10},
{ZsortList4,	COLOR_CP,	COLOR_LP,	11},
{ZsortList5,	TYPE1_CP,	TYPE1_LP,	18},
{ZsortList5,	TYPE2_CP,	TYPE2_LP,	18},
{ZsortList2,	SORT_CP,	SORT_LP,	6},
{ZsortList1,	MODE_CP,	MODE_LP,	2},
};

static	void	ZukanSearchInitTask(u8 id);
static	void	ZukanSearchMainMenuKeyInitTask(u8 id);
static	void	ZukanSearchMainMenuKeyTask(u8 id);
static	void	ZukanSearchMenuKeyInitTask(u8 id);
static	void	ZukanSearchMenuKeyTask(u8 id);
static	void	ZukanSearchMainInitTask(u8 id);
static	void	ZukanSearchMainWaitTask(u8 id);
static	void	ZukanSearchMainTask(u8 id);
static	void	ZukanSearchSelectInitTask(u8 id);
static	void	ZukanSearchSelectTask(u8 id);
static	void	ZukanSearchExitInitTask(u8 id);
static	void	ZukanSearchExitTask(u8 id);

static	void	ZukanSearchMainMenuScreenMake(u8 menu_p);
static	void	ZukanSearchMenuScreenMake(u8 menu_p,u8 list_p);

static	void	ZukanSearchWinMake(u8 mode);
static	void	ZukanSearchMenuMake(u8 id);
static	void	ZukanSearchListMake(u8 id);
static	u8		ZukanSearchSortParamGet(u8 id,u8 getmode);

static	void	ZukanSearchDefaultDataGet(u8 id);
static	void	ZsortKeyUDActSet(u8 id);
/*==================================================================*/
/*                                                                  */
/*				検索タスク設定										*/
/*                                                                  */
/*==================================================================*/
u8		ZukanSearchTaskSet(void)
{
	u8	id;

	id = AddTask(ZukanSearchInitTask, 0);

	return	id;
}

/*==================================================================*/
/*                                                                  */
/*				検索画面操作										*/
/*                                                                  */
#define	MODE10_BG2_SCRVRAM	(14)		//ZUKANLIST_TYPE使用
#define	MODE10_BG2_CHRVRAM	(2)			//ZUKANLIST_TYPE使用
#define	MODE10_BG3_SCRVRAM	(15)		//背景
#define	MODE10_BG3_CHRVRAM	(0)			//背景
/*==================================================================*/
static	void	ZukanSearchInitTask(u8 id)
{
	u16	i;

	switch(sys.InitSeqWork){
	default:
	case 0:
		//フェード待ち
		if(FadeData.fade_sw) break;

		zw->mode = Z_MODE2;

		ZukanScreenRegInit(0);	//表示レジスタ初期化
		//ＶＲＡＭ転送
		LZ77UnCompVram((void*)zsort_ch_LZ,(void*)(BG_VRAM + 0x0000));
		LZ77UnCompVram((void*)zsort_sc_LZ,(void*)(BG_VRAM + (MODE10_BG3_SCRVRAM*0x800)));
		PaletteWorkSet(&(zsort_cl_Palette[0x0001]),PA_BG0+PA_COL1,0x80-2);
		if(!ZukanSpecialFlagCheck()){
			//全国図鑑みれない
			for(i=0;i<17;i++){
				*(u16*)(BG_VRAM + (MODE10_BG3_SCRVRAM*0x800) + 10*64 + i*2)
					= *(u16*)(BG_VRAM + (MODE10_BG3_SCRVRAM*0x800) + 12*64 + i*2);
				*(u16*)(BG_VRAM + (MODE10_BG3_SCRVRAM*0x800) + 11*64 + i*2)
					= *(u16*)(BG_VRAM + (MODE10_BG3_SCRVRAM*0x800) + 13*64 + i*2);
				*(u16*)(BG_VRAM + (MODE10_BG3_SCRVRAM*0x800) + 12*64 + i*2) = 0x0001;
				*(u16*)(BG_VRAM + (MODE10_BG3_SCRVRAM*0x800) + 13*64 + i*2) = 0x0001;
			}
		}
		sys.InitSeqWork = 1;
		break;
	case 1:
		//表示ルーチン初期化１
		PrintScreenInit(ZUKANLIST_TYPE);
		NMenuScreenInit(ZUKANLIST_TYPE);
		DecordCellSet((CellData*)ZukanCell);
		ObjPalSets((PalData*)ZukanPal);
		ZsortKeyUDActSet(id);

		for(i=0;i<16;i++)	TaskTable[id].work[i] = 0;
		ZukanSearchDefaultDataGet(id);
		ZukanSearchMainMenuScreenMake(0);
		ZukanSearchMenuMake(id);

		sys.InitSeqWork++;
		break;
	case 2:
		//フェード設定
		PaletteFadeReq(0xffffffff,0,16,0,0);
		sys.InitSeqWork++;
		break;
	case 3:
		*(vu16 *)REG_BG3CNT = BG_COLOR_16					//16色選択
						| BG_SCREEN_SIZE_0				// スクリーンサイズ
						| BG_PRIORITY_3					//BG優先順位
						| MODE10_BG3_SCRVRAM << BG_SCREEN_BASE_SHIFT//スクリーンベースブロック
						| MODE10_BG3_CHRVRAM << BG_CHAR_BASE_SHIFT	//キャラクタベースブロック
						;
		*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
							|	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
							|	DISP_BG2_ON					// BG2有効
							|	DISP_BG3_ON					// BG3有効
							|	DISP_OBJ_ON;
		sys.InitSeqWork++;
		break;
	case 4:
		if(FadeData.fade_sw) break;

		TaskTable[id].TaskAdrs = ZukanSearchMainMenuKeyInitTask;
		sys.InitSeqWork = 0;
		break;
	}
}

/*==================================================================*/
static	void	ZukanSearchMainMenuKeyInitTask(u8 id)
{
	ZukanSearchMainMenuScreenMake(TaskTable[id].work[MENU_CP]);
	ZukanSearchMenuMake(id);

	TaskTable[id].TaskAdrs = ZukanSearchMainMenuKeyTask;
}

/*==================================================================*/
static	void	ZukanSearchMainMenuKeyTask(u8 id)
{
	if(sys.Trg & B_BUTTON){
		SePlay(SE_PC_OFF);
		TaskTable[id].TaskAdrs = ZukanSearchExitInitTask;
		return;
	}
	if(sys.Trg & A_BUTTON){
		switch(TaskTable[id].work[MENU_CP]){

		case 0:
			SePlay(SE_PIN);
			TaskTable[id].work[MENU_LP] = 0;
			TaskTable[id].TaskAdrs = ZukanSearchMenuKeyInitTask;
			break;
		case 1:
			SePlay(SE_PIN);
			TaskTable[id].work[MENU_LP] = 4;
			TaskTable[id].TaskAdrs = ZukanSearchMenuKeyInitTask;
			break;
		case 2:
			SePlay(SE_PC_OFF);
			TaskTable[id].TaskAdrs = ZukanSearchExitInitTask;
			break;
		}
		return;
	}
	if((sys.Trg & L_KEY)&&(TaskTable[id].work[MENU_CP] > 0)){
		SePlay(SE_Z_PAGE);
		TaskTable[id].work[MENU_CP]--;
		ZukanSearchMainMenuScreenMake(TaskTable[id].work[MENU_CP]);
	}
	if((sys.Trg & R_KEY)&&(TaskTable[id].work[MENU_CP] < 2)){
		SePlay(SE_Z_PAGE);
		TaskTable[id].work[MENU_CP]++;
		ZukanSearchMainMenuScreenMake(TaskTable[id].work[MENU_CP]);
	}
}


/*==================================================================*/
static	void	ZukanSearchMenuKeyInitTask(u8 id)
{
	ZukanSearchMenuScreenMake(TaskTable[id].work[MENU_CP],TaskTable[id].work[MENU_LP]);
	ZukanSearchMenuMake(id);

	TaskTable[id].TaskAdrs = ZukanSearchMenuKeyTask;
}

/*==================================================================*/
static	void	ZukanSearchMenuKeyTask(u8 id)
{
	const ZSORT_MOVE*	move;

	if(TaskTable[id].work[MENU_CP]){
		if(!ZukanSpecialFlagCheck()){
			//全国図鑑みれない
			move = (const ZSORT_MOVE*)&ZsortMove4;
		}else{
			move = (const ZSORT_MOVE*)&ZsortMove2;
		}
	}else{
		if(!ZukanSpecialFlagCheck()){
			//全国図鑑みれない
			move = (const ZSORT_MOVE*)&ZsortMove3;
		}else{
			move = (const ZSORT_MOVE*)&ZsortMove1;
		}
	}
	if(sys.Trg & B_BUTTON){
		SePlay(SE_BOWA);
		ZukanSearchDefaultDataGet(id);
		TaskTable[id].TaskAdrs = ZukanSearchMainMenuKeyInitTask;
		return;
	}
	if(sys.Trg & A_BUTTON){
		if(TaskTable[id].work[MENU_LP] == ZSP_START){
			if(TaskTable[id].work[MENU_CP]){
				//きりかえ
				ZukanDialTheta			= DIAL_DEFAULT;
				zw->dial_bak			= DIAL_DEFAULT;
				ZukanListPos			= 0;
				zw->list_p_bak			= 0;
				MyData.Zukan.ListMode	= ZukanSearchSortParamGet(id,ZSP_MODE);
				if(!(ZukanSpecialFlagCheck())){	//再チェック
					MyData.Zukan.ListMode = ZLIST_NEW;
				}
				zw->list_mode_backup	= MyData.Zukan.ListMode;
				MyData.Zukan.ListSort	= ZukanSearchSortParamGet(id,ZSP_SORT);
				zw->list_sort_backup	= MyData.Zukan.ListSort;

				SePlay(SE_PC_OFF);
				TaskTable[id].TaskAdrs = ZukanSearchExitInitTask;
			}else{
				//けんさく
				NMenuBoxClear( 0,14,29,19);
				NMenuMsgWrite(ZsortSearchNowText,2,15);
				TaskTable[id].TaskAdrs = ZukanSearchMainInitTask;
				SePlay(SE_Z_SEARCH);
			}
		}else{
			SePlay(SE_PIN);
			TaskTable[id].TaskAdrs = ZukanSearchSelectInitTask;
		}
		return;
	}
	if((sys.Trg & L_KEY)&&(move[TaskTable[id].work[MENU_LP]].L_keyp != ZSP_NOMOVE)){
		SePlay(SE_SELECT);
		TaskTable[id].work[MENU_LP] = move[TaskTable[id].work[MENU_LP]].L_keyp;
		ZukanSearchMenuScreenMake(TaskTable[id].work[MENU_CP],TaskTable[id].work[MENU_LP]);
	}
	if((sys.Trg & R_KEY)&&(move[TaskTable[id].work[MENU_LP]].R_keyp != ZSP_NOMOVE)){
		SePlay(SE_SELECT);
		TaskTable[id].work[MENU_LP] = move[TaskTable[id].work[MENU_LP]].R_keyp;
		ZukanSearchMenuScreenMake(TaskTable[id].work[MENU_CP],TaskTable[id].work[MENU_LP]);
	}
	if((sys.Trg & U_KEY)&&(move[TaskTable[id].work[MENU_LP]].U_keyp != ZSP_NOMOVE)){
		SePlay(SE_SELECT);
		TaskTable[id].work[MENU_LP] = move[TaskTable[id].work[MENU_LP]].U_keyp;
		ZukanSearchMenuScreenMake(TaskTable[id].work[MENU_CP],TaskTable[id].work[MENU_LP]);
	}
	if((sys.Trg & D_KEY)&&(move[TaskTable[id].work[MENU_LP]].D_keyp != ZSP_NOMOVE)){
		SePlay(SE_SELECT);
		TaskTable[id].work[MENU_LP] = move[TaskTable[id].work[MENU_LP]].D_keyp;
		ZukanSearchMenuScreenMake(TaskTable[id].work[MENU_CP],TaskTable[id].work[MENU_LP]);
	}
}

/*==================================================================*/
static	void	ZukanSearchMainInitTask(u8 id)
{
	ZukanSearch(ZukanSearchSortParamGet(id,ZSP_MODE),
				ZukanSearchSortParamGet(id,ZSP_SORT),
				ZukanSearchSortParamGet(id,ZSP_NAME),
				ZukanSearchSortParamGet(id,ZSP_COLOR),
				ZukanSearchSortParamGet(id,ZSP_TYPE1),
				ZukanSearchSortParamGet(id,ZSP_TYPE2));
	TaskTable[id].TaskAdrs = ZukanSearchMainWaitTask;
};

/*==================================================================*/
static	void	ZukanSearchMainWaitTask(u8 id)
{
	if(SeEndCheck())	return;

	if(zw->listMax){
		SePlay(SE_SEIKAI);
		NMenuBoxClear( 0,14,29,19);
		NMenuMsgWrite(ZsortSearchOkText,2,15);
	}else{
		SePlay(SE_HAZURE);
		NMenuBoxClear( 0,14,29,19);
		NMenuMsgWrite(ZsortSearchNgText,2,15);
	}
	TaskTable[id].TaskAdrs = ZukanSearchMainTask;
}

/*==================================================================*/
static	void	ZukanSearchMainTask(u8 id)
{
	if(sys.Trg & A_BUTTON){
		if(zw->listMax){
			zw->DataModeRetFlag = 1;
			zw->list_mode = ZukanSearchSortParamGet(id,ZSP_MODE);
			zw->list_sort = ZukanSearchSortParamGet(id,ZSP_SORT);	
			TaskTable[id].TaskAdrs = ZukanSearchExitInitTask;
			SePlay(SE_PC_OFF);
		}else{
			TaskTable[id].TaskAdrs = ZukanSearchMenuKeyInitTask;
			SePlay(SE_BOWA);
		}
	}
}

/*==================================================================*/
static	void	ZukanSearchSelectInitTask(u8 id)
{
	u8		mp;
	u16		*cp,*lp;

	ZukanSearchWinMake(0);

	mp	= TaskTable[id].work[MENU_LP];
	cp	= (u16*)&TaskTable[id].work[ZsortList[mp].cp]; 
	lp	= (u16*)&TaskTable[id].work[ZsortList[mp].lp ]; 
	TaskTable[id].work[MENU_CP_BAK] = *cp;
	TaskTable[id].work[MENU_LP_BAK] = *lp;

	ZukanSearchListMake(id);
	NMenuMsgWrite(cursor_str,18, 1+((*cp)*2));

	TaskTable[id].TaskAdrs = ZukanSearchSelectTask;
}

/*==================================================================*/
static	void	ZukanSearchSelectTask(u8 id)
{
	const ZSORT_LIST* list;
	u16	*cp,*lp;
	u16	listmax;
	u8	f,mp;

	mp = TaskTable[id].work[MENU_LP];
	list	= ZsortList[mp].listp;
	cp		= (u16*)(&(TaskTable[id].work[ZsortList[mp].cp])); 
	lp		= (u16*)(&(TaskTable[id].work[ZsortList[mp].lp])); 
	listmax	= ZsortList[mp].listmax - 1;

	if(sys.Trg & A_BUTTON){
		SePlay(SE_PIN);
		NMenuBoxClear(18, 1,28,12);
		ZukanSearchWinMake(1);
		TaskTable[id].TaskAdrs = ZukanSearchMenuKeyInitTask;
		return;
	}
	if(sys.Trg & B_BUTTON){
		SePlay(SE_BOWA);
		NMenuBoxClear(18, 1,28,12);
		ZukanSearchWinMake(1);
		*cp = TaskTable[id].work[MENU_CP_BAK];
		*lp = TaskTable[id].work[MENU_LP_BAK];
		TaskTable[id].TaskAdrs = ZukanSearchMenuKeyInitTask;
		return;
	}
	f = 0;

	if(sys.Repeat & U_KEY){
		if(*cp > 0){
			NMenuMsgWrite(cursorcls_str,18, (*cp)*2+1);
			(*cp)--;
			NMenuMsgWrite(cursor_str,18, (*cp)*2+1);
			f = 1;
		}else{
			if(*lp > 0){
				(*lp)--;
				ZukanSearchListMake(id);
				NMenuMsgWrite(cursor_str,18, (*cp)*2+1);
				f = 1;
			}
		}
		if(f){
			SePlay(SE_SELECT);
			NMenuBoxClear( 0,14,29,19);
			NMenuMsgWrite(list[*cp + *lp].text,2,15);
		}
		return;
	}
	if(sys.Repeat & D_KEY){
		if((*cp < 5)&&(*cp < listmax)){
			NMenuMsgWrite(cursorcls_str,18, (*cp)*2+1);
			(*cp)++;
			NMenuMsgWrite(cursor_str,18, (*cp)*2+1);
			f = 1;
		}else{
			if((listmax > 5)&&(*lp < (listmax - 5))){
				(*lp)++;
				ZukanSearchListMake(id);
				NMenuMsgWrite(cursor_str,18, 5*2+1);
				f = 1;
			}
		}
		if(f){
			SePlay(SE_SELECT);
			NMenuBoxClear( 0,14,29,19);
			NMenuMsgWrite(list[*cp + *lp].text,2,15);
		}
		return;
	}
}

/*==================================================================*/
static	void	ZukanSearchExitInitTask(u8 id)
{
	PaletteFadeReq(0xffffffff,0,0,16,0);
	TaskTable[id].TaskAdrs = ZukanSearchExitTask;
}

/*==================================================================*/
static	void	ZukanSearchExitTask(u8 id)
{
	if(FadeData.fade_sw)	return;

	DelTask(id);
}

/*==================================================================*/
static	void	ZukanSearchMenuScreenMakeSub(u8 atr,u8 x,u8 y,u8 len)
{
	u16	i,cgxnum;

	for(i=0;i<len;i++){
		cgxnum = *(u16 *)(BG_VRAM + (MODE10_BG3_SCRVRAM*0x800) + (y+0)*64 + (x+i)*2);
		cgxnum &= 0x0fff;
		cgxnum |= (atr << 12);
		*(u16 *)(BG_VRAM + (MODE10_BG3_SCRVRAM*0x800) + (y+0)*64 + (x+i)*2) = cgxnum;
   		
		cgxnum = *(u16 *)(BG_VRAM + (MODE10_BG3_SCRVRAM*0x800) + (y+1)*64 + (x+i)*2);
		cgxnum &= 0x0fff;
		cgxnum |= (atr << 12);
		*(u16 *)(BG_VRAM + (MODE10_BG3_SCRVRAM*0x800) + (y+1)*64 + (x+i)*2) = cgxnum;
	}
}

static	void	ZukanSearchMenuScreenSet(u8 menu,u8 off_sw,u8 disable_sw)
{
	u8	attr;

	attr = (off_sw&0x01) + ((disable_sw&0x01)*2);

	switch(menu){

	case 0:	//けんさく
	case 1:	//きりかえ
	case 2:	//やめる
		ZukanSearchMenuScreenMakeSub(attr,ZsortMainMenu[menu].x1,ZsortMainMenu[menu].y1,
									ZsortMainMenu[menu].len1);
		break;
	case 8:	//モード
	case 7:	//ならび
	case 3:	//なまえ
	case 4:	//いろ
		ZukanSearchMenuScreenMakeSub(attr,ZsortMenu[menu-3].x1,ZsortMenu[menu-3].y1,
									ZsortMenu[menu-3].len1);
	case 5:	//タイプ１「欄」
	case 6:	//タイプ２「欄」
		ZukanSearchMenuScreenMakeSub(attr,ZsortMenu[menu-3].x2,ZsortMenu[menu-3].y2,
									ZsortMenu[menu-3].len2);
		break;
	case 10:	//タイプ「ラベル」
		ZukanSearchMenuScreenMakeSub(attr,ZsortMenu[5-3].x1,ZsortMenu[5-3].y1,
									ZsortMenu[5-3].len1);
		break;
	case 9:	//開始
		if(!ZukanSpecialFlagCheck()){
			//全国図鑑みれない
			ZukanSearchMenuScreenMakeSub(attr,ZsortMenu[menu-3].x1,ZsortMenu[menu-3].y1-2,
									ZsortMenu[menu-3].len1);
		}else{
			ZukanSearchMenuScreenMakeSub(attr,ZsortMenu[menu-3].x1,ZsortMenu[menu-3].y1,
									ZsortMenu[menu-3].len1);
		}
		break;
	}
}


/*==================================================================*/
static	void	ZukanSearchMainMenuBaseMake(u8 menu_p)
{
	switch(menu_p){

	case 0:
		ZukanSearchMenuScreenSet(0,0,0);	//けんさく
		ZukanSearchMenuScreenSet(1,1,0);	//きりかえ
		ZukanSearchMenuScreenSet(2,1,0);	//やめる

		ZukanSearchMenuScreenSet(3,1,0);	//なまえ
		ZukanSearchMenuScreenSet(4,1,0);	//いろ

		ZukanSearchMenuScreenSet(10,1,0);	//タイプ「ラベル」
		ZukanSearchMenuScreenSet(5,1,0);	//タイプ１「欄」
		ZukanSearchMenuScreenSet(6,1,0);	//タイプ２「欄」

		ZukanSearchMenuScreenSet(7,1,0);	//ならび
		ZukanSearchMenuScreenSet(8,1,0);	//モード

		ZukanSearchMenuScreenSet(9,1,0);	//開始
		break;
	case 1:
		ZukanSearchMenuScreenSet(0,1,0);	//けんさく
		ZukanSearchMenuScreenSet(1,0,0);	//きりかえ
		ZukanSearchMenuScreenSet(2,1,0);	//やめる

		ZukanSearchMenuScreenSet(3,1,1);	//なまえ
		ZukanSearchMenuScreenSet(4,1,1);	//いろ

		ZukanSearchMenuScreenSet(10,1,1);	//タイプ「ラベル」
		ZukanSearchMenuScreenSet(5,1,1);	//タイプ１「欄」
		ZukanSearchMenuScreenSet(6,1,1);	//タイプ２「欄」

		ZukanSearchMenuScreenSet(7,1,0);	//ならび
		ZukanSearchMenuScreenSet(8,1,0);	//モード

		ZukanSearchMenuScreenSet(9,1,0);	//開始
		break;
	case 2:
		ZukanSearchMenuScreenSet(0,1,0);	//けんさく
		ZukanSearchMenuScreenSet(1,1,0);	//きりかえ
		ZukanSearchMenuScreenSet(2,0,0);	//やめる

		ZukanSearchMenuScreenSet(3,1,1);	//なまえ
		ZukanSearchMenuScreenSet(4,1,1);	//いろ

		ZukanSearchMenuScreenSet(10,1,1);	//タイプ「ラベル」
		ZukanSearchMenuScreenSet(5,1,1);	//タイプ１「欄」
		ZukanSearchMenuScreenSet(6,1,1);	//タイプ２「欄」

		ZukanSearchMenuScreenSet(7,1,1);	//ならび
		ZukanSearchMenuScreenSet(8,1,1);	//モード

		ZukanSearchMenuScreenSet(9,1,1);	//開始
	}
}

/*==================================================================*/
static	void	ZukanSearchMainMenuScreenMake(u8 menu_p)
{
	ZukanSearchMainMenuBaseMake(menu_p);

	NMenuBoxClear( 0,14,29,19);
	NMenuMsgWrite(ZsortMainMenu[menu_p].text, 2,15);
}

/*==================================================================*/
static	void	ZukanSearchMenuScreenMake(u8 menu_p,u8 list_p)
{
	ZukanSearchMainMenuBaseMake(menu_p);

	switch(list_p){

	case 0:
		ZukanSearchMenuScreenSet(3,0,0);	//なまえ
		break;
	case 1:
		ZukanSearchMenuScreenSet(4,0,0);	//いろ
		break;
	case 2:
		ZukanSearchMenuScreenSet(10,0,0);	//タイプ「ラベル」
		ZukanSearchMenuScreenSet(5,0,0);	//タイプ１「欄」
		break;
	case 3:
		ZukanSearchMenuScreenSet(10,0,0);	//タイプ「ラベル」
		ZukanSearchMenuScreenSet(6,0,0);	//タイプ２「欄」
		break;
	case 4:
		ZukanSearchMenuScreenSet(7,0,0);	//ならび
		break;
	case 5:
		ZukanSearchMenuScreenSet(8,0,0);	//モード
		break;
	case 6:
		ZukanSearchMenuScreenSet(9,0,0);	//開始
		break;
	}
	NMenuBoxClear( 0,14,29,19);
	NMenuMsgWrite(ZsortMenu[list_p].text, 2,15);
}

/*==================================================================*/
static	void	ZukanSearchMenuMake(u8 id)
{
	u16	p;

	NMenuBoxClear( 6, 2,15,11);

	p = TaskTable[id].work[NAME_CP] + TaskTable[id].work[NAME_LP];
	NMenuMsgWrite(ZsortList3[p].list, 6, 2);

	p = TaskTable[id].work[COLOR_CP] + TaskTable[id].work[COLOR_LP];
	NMenuMsgWrite(ZsortList4[p].list, 6, 4);

	p = TaskTable[id].work[TYPE1_CP] + TaskTable[id].work[TYPE1_LP];
	NMenuMsgWrite(ZsortList5[p].list, 6, 6);

	p = TaskTable[id].work[TYPE2_CP] + TaskTable[id].work[TYPE2_LP];
	NMenuMsgWrite(ZsortList5[p].list,12, 6);

	p = TaskTable[id].work[SORT_CP] + TaskTable[id].work[SORT_LP];
	NMenuMsgWrite(ZsortList2[p].list, 6, 8);

	if(ZukanSpecialFlagCheck()){
		//全国図鑑みれる
		p = TaskTable[id].work[MODE_CP] + TaskTable[id].work[MODE_LP];
		NMenuMsgWrite(ZsortList1[p].list, 6,10);
	}
}

/*==================================================================*/
static	void	ZukanSearchWinMake(u8 mode)
{
	u16	i,j;

	if(!mode){	//描画
		*(u16*)(BG_VRAM + (MODE10_BG3_SCRVRAM*0x800) + 0*64 + 17*2) = 0x0c0b;
		for(j=18;j<29;j++) *(u16*)(BG_VRAM + (MODE10_BG3_SCRVRAM*0x800) + 0*64 + j*2) = 0x080d;
		*(u16*)(BG_VRAM + (MODE10_BG3_SCRVRAM*0x800) + 0*64 + 29*2) = 0x080b;

		for(i=1;i<13;i++){
			*(u16*)(BG_VRAM + (MODE10_BG3_SCRVRAM*0x800) + i*64 + 17*2) = 0x040a;
			for(j=18;j<29;j++){
				*(u16*)(BG_VRAM + (MODE10_BG3_SCRVRAM*0x800) + i*64 + j*2) = 0x0002;
			}
			*(u16*)(BG_VRAM + (MODE10_BG3_SCRVRAM*0x800) + i*64 + 29*2) = 0x000a;
		}

		*(u16*)(BG_VRAM + (MODE10_BG3_SCRVRAM*0x800) +13*64 + 17*2) = 0x040b;
		for(j=18;j<29;j++) *(u16*)(BG_VRAM + (MODE10_BG3_SCRVRAM*0x800) +13*64 + j*2) = 0x000d;
		*(u16*)(BG_VRAM + (MODE10_BG3_SCRVRAM*0x800) +13*64 + 29*2) = 0x000b;
	}else{		//消去
		for(i=0;i<14;i++){
			for(j=17;j<30;j++){
				*(u16*)(BG_VRAM + (MODE10_BG3_SCRVRAM*0x800) + i*64 + j*2) = 0x004f;
			}
		}
	}
}

/*==================================================================*/
static	void	ZukanSearchListMake(u8 id)
{
	u16	i,j;
	const ZSORT_LIST* list;
	u16	*cp,*lp;

	
	list= ZsortList[TaskTable[id].work[MENU_LP]].listp;
	cp	= (u16*)(&(TaskTable[id].work[ZsortList[TaskTable[id].work[MENU_LP]].cp])); 
	lp	= (u16*)(&(TaskTable[id].work[ZsortList[TaskTable[id].work[MENU_LP]].lp])); 
	
	NMenuBoxClear(18, 1,28,12);

	for(i=0,j=(*lp);i<6;i++,j++){
		if(list[j].list == 0)	break;
		NMenuMsgWrite(list[j].list,19,i*2+1);
	}
	NMenuBoxClear( 0,14,29,19);
	NMenuMsgWrite(list[*cp + *lp].text,2,15);
}

/*==================================================================*/
static	u8	ZukanSearchSortParamGet(u8 id,u8 getmode)
{
	u16	p,*cp,*lp;
	u8	dat;

	cp	= (u16*)(&(TaskTable[id].work[ZsortList[getmode].cp])); 
	lp	= (u16*)(&(TaskTable[id].work[ZsortList[getmode].lp])); 
	p	= *cp + *lp;
	
	switch(getmode){

	default:
		dat = 0;
		break;
	case ZSP_MODE:
		dat = ZsortList1MenuTbl[p];
		break;
	case ZSP_SORT:
		dat = ZsortList2MenuTbl[p];
		break;
	case ZSP_NAME:
		if(p == 0)	dat = 0xff;
		else		dat = p;
		break;
	case ZSP_COLOR:
		if(p == 0)	dat = 0xff;
		else		dat = p-1;
		break;
	case ZSP_TYPE1:
	case ZSP_TYPE2:
		dat = ZsortList5MenuTbl[p];
		break;
	}
	return	dat;
}

/*==================================================================*/
static	void	ZukanSearchDefaultDataGet(u8 id)
{
	u8	dat;

	switch(zw->list_mode_backup){
	default:
	case ZLIST_NEW:
		dat = 0;
		break;
	case ZLIST_WORLD:
		dat = 1;
		break;
	}
	TaskTable[id].work[MODE_CP]	= dat;

	switch(zw->list_sort_backup){
	default:
	case ZSORT_NUM:
		dat = 0;
		break;
	case ZSORT_AIU:
		dat = 1;
		break;
	case ZSORT_OMOI:
		dat = 2;
		break;
	case ZSORT_KARUI:
		dat = 3;
		break;
	case ZSORT_TAKAI:
		dat = 4;
		break;
	case ZSORT_HIKUI:
		dat = 5;
		break;
	}
	TaskTable[id].work[SORT_CP]	= dat;
}

/*==================================================================*/
static	u8	ZukanSearchSelectMinCheck(u8 id)	//１＝最小or消去
{
	u16	*cp,*lp;
	u8	mp;
	u16	listmax;

	mp = TaskTable[id].work[MENU_LP];
	cp = (u16*)(&(TaskTable[id].work[ZsortList[mp].cp])); 
	lp = (u16*)(&(TaskTable[id].work[ZsortList[mp].lp])); 
	listmax	= ZsortList[mp].listmax - 1;

	if(listmax < 6)			return 1; 
	if(!(*lp))				return 1;
	return 0;
}

static	u8	ZukanSearchSelectMaxCheck(u8 id)	//１＝最大or消去
{
	u16	*cp,*lp;
	u8	mp;
	u16	listmax;

	mp = TaskTable[id].work[MENU_LP];
	cp = (u16*)(&(TaskTable[id].work[ZsortList[mp].cp])); 
	lp = (u16*)(&(TaskTable[id].work[ZsortList[mp].lp])); 
	listmax	= ZsortList[mp].listmax - 1;

	if(listmax < 6)				return 1; 
	if(*lp >= (listmax - 5))	return 1; 
	return 0;
}

/*==================================================================*/
/*                                                                  */
/*				キー情報カーソル設定								*/
/*                                                                  */
/*==================================================================*/
extern	const actHeader KeyUDActHeader;

static void ZsortKeyUDActMove(actWork* aw)
{
	u8	theta;

	if(TaskTable[aw->work[0]].TaskAdrs == ZukanSearchSelectTask){
		if(aw->work[1]){
			if(ZukanSearchSelectMaxCheck(aw->work[0]))	aw->banish = 1;
			else										aw->banish = 0;
		}else{
			if(ZukanSearchSelectMinCheck(aw->work[0]))	aw->banish = 1;
			else										aw->banish = 0;
		}
		theta = aw->work[2] + aw->work[1]*0x80;
		aw->dy = 0x2*sin_cos_table[theta]/0x100;
		aw->work[2]+=8;
	}else{
		aw->banish = 1;
	}
}

static void ZsortKeyUDActSet(u8 id)
{
	u8	actnum;

	actnum = AddActor(&KeyUDActHeader,184,0+4,0);
	ActWork[actnum].work[0] = id;
	ActWork[actnum].work[1] = 0;
	ActWork[actnum].move	= ZsortKeyUDActMove;
	actnum = AddActor(&KeyUDActHeader,184,112-4,0);
	ActWork[actnum].work[0] = id;
	ActWork[actnum].work[1] = 1;
	ActWork[actnum].Vflip = 1;
	ActWork[actnum].move	= ZsortKeyUDActMove;

}

