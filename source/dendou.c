//=========================================================================
//	
//	殿堂入り
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
#include "decord.h"
#include "objdata.h"
#include "menu.h"
#include "window.h"
#include "calctool.h"
#include "monsno.def"
#include "zukan.h"
#include "record.h"
#include "mus_tool.h"
#include "scr_tool.h"
#include "boxef.h"
#include "message.h"
#include "initgame.h"
#include "laster.h"

#include "svld_ini.h"
#include "svld_sys.h"

#include "dendou.dat"

/*　ポケモン情報ウインドウ用　定義　*/
#define	DP_INFO_NUM_X		(5)
#define	DP_INFO_NICK_X		(12)
#define	DP_INFO_NAME_X		(17)
#define	DP_INFO_LV_X		(6)
#define	DP_INFO_ID_X		(13)

/*　ポケモン情報ウインドウ用　定義　*/
extern	u16							pp_rand(void);
extern	const actAffAnm * const		PmAffAnmTblF[];
extern	const actAnm *const			PokeActAnmTbl[];
extern	const actAnm *const *const	TRFAnmTbl[];
extern	void						FieldMenuRecover(void);
extern	void						EDdemoInit(void);
extern	const u8* const				GetZukanHyoukaMsg(u16 num);
extern	const u8					save_fail2_msg[];

typedef struct {

u32	ID;				//ID
u32	prnd;			//個体乱数
u16	pnum:9;			//ナンバー
u16	level:7;		//レベル
u8	name[10];		//名前

}DENDOU_POKE;

typedef struct {

DENDOU_POKE	pdata[6];

}DENDOU_WORK;

void			DendouInit(void);
void			DendouMain(void);

static	void	DendouVRAMInit(void);
static	void	DendouUtilityInit(void);
static	void	DendouRegInit(void);

static	void	DendouCongraMsgPut(u8 x,u8 y);
static	void	DendouPokeInfoPut(DENDOU_POKE *dp,u8 x,u8 y);
static	void	DendouMineInfoPut(u8 x,u8 y);
u16				DendouPokeActorSet(u16 pnum,s16 x,s16 y,u16 decord_p,u32 p_id,u32 p_rnd);
static	u16		DendouTrainerActorSet(u16 tnum,s16 x,s16 y,u16 decord_p);
static void		PokeCutIn(actWork* aw);
static void		PokeWait(actWork* aw);
static	u16		KamifubukiActorSet(void);

static	void	DendouDataInitTask(u8 id);
static	void	DendouDataTask(u8 id);
static	void	DendouDataWaitTask(u8 id);
static	void	DendouDataNextWaitTask(u8 id);
static	void	DendouDataNextTask(u8 id);

static	void	DendouPokeInitTask(u8 id);
static	void	DendouPokeCutInTask(u8 id);
static	void	DendouPokeWaitTask(u8 id);
static	void	DendouCongraInitTask(u8 id);
static	void	DendouCongraTask(u8 id);
static	void	DendouCongraEndTask(u8 id);
static	void	DendouMineInitTask(u8 id);
static	void	DendouMineWaitTask(u8 id);
static	void	DendouMineTask(u8 id);
static	void	DendouExitInitTask(u8 id);
static	void	DendouExitTask(u8 id);

static	void	DendouLookInitTask(u8 id);
static	void	DendouLookSceneInitTask(u8 id);
static	void	DendouLookKeyInitTask(u8 id);
static	void	DendouLookKeyTask(u8 id);
static	void	DendouLookExitInitTask(u8 id);
static	void	DendouLookExitTask(u8 id);
static	void	DendouLookErrorInitTask(u8 id);
static	void	DendouLookErrorTask(u8 id);

#define		BACK_COLOR	(0x735F)
static	const u16 dendou_Palette[16];
static	const u8 den_ch_LZ[0x1cc];

#define	CELLID_DENDOU	(1001)
#define	PALID_DENDOU	(1001)
static	const	CellData  DendouCell[] = {
{(void*)kamifubuki_pch_ADRS,0x220,CELLID_DENDOU },{CELL_END,0,0}
};

static	const	PalData DendouPal[] = { 
{(void*)kamifubuki_pcl_ADRS,PALID_DENDOU },{OBJPAL_END,0},
};

#define		DENDOU_MAX	(50)
//３体以上
static	const s16	DendouPokePos[][4] = {
	{120	,40+170	,		120, 40},	//中下→中上
	{ 56+270,40+180	,		 56, 40},	//右下→左上
	{184-270,40+180	,		184, 40},	//左下→右上
	{120	,88-170	,		120, 88},	//中上→中下
	{200-270,88-180	,		200, 88},	//左上→右下
	{ 40+270,88-180	,		 40, 88},	//右上→左下
};

//３体以下
static	const s16	DendouPokePos2[][4] = {
	{120	,64+170	,		120, 64},	//中下→中上
	{ 56+270,64+180	,		 56, 64},	//右下→左上
	{184-270,64+180	,		184, 64},	//左下→右上
};
	
extern	u8		GameClearFlag;

u32	dendou_fade_req = {0};
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


/********************************************************************/
/*                                                                  */
/*				メイン												*/
/*                                                                  */
/********************************************************************/
void	DendouMain(void)
{
		MainTask();
		JumpActor();
		SetActor();
		PaletteAnime();
}


/********************************************************************/
/*                                                                  */
/*				メイン制御（殿堂入りデモ）							*/
/*                                                                  */
#define		DENDOU_SV_F	(0)
#define		POKE_POS	(1)
#define		POKE_COUNT	(2)
#define		POKE_WAIT	(3)
#define		MINE_ACTNUM	(4)
#define		POKE_ACTNUM	(5)		//以降６ワーク分使用
/********************************************************************/
/* 共用関数 */
static	u8	DendouInitSub(void)
{
	switch(sys.InitSeqWork){
	default:
	case 0:
		SetVBlankFunc(NULL);			//割込み関数設定(VBLANK)

		DendouVRAMInit();
		sys.InitSeqWork = 1;
		break;
	case 1:
		DendouUtilityInit();

		sys.InitSeqWork++;
		break;
	case 2:
		PaletteFadeReq(0xffffffff,0,16,0,0);
		SetVBlankFunc(VInterFunc);			//割込み関数設定(VBLANK)
		REG_IE_SET( V_BLANK_INTR_FLAG );// VBLANK割込許可
		*(vu16 *)REG_STAT |= STAT_V_BLANK_IF_ENABLE;

		sys.InitSeqWork++;
		break;
	case 3:
		//レジスタ設定
		*(vu16 *)REG_BLDCNT   = 0x3f42;
		*(vu16 *)REG_BLDALPHA = 0x0710;
		*(vu16 *)REG_BLDY	  = 0;
		DendouRegInit();

		sys.InitSeqWork++;
		break;
	case 4:
		PaletteAnime();
		if(FadeData.fade_sw)	break;

		MainProcChange(DendouMain);
		MusicPlay(MUS_DENDOU);
		return 0;
	}
	return 1;
}

/* 殿堂入り（通常） */
void	DendouInit(void)
{
	u8	taskID;

	if(DendouInitSub())	return;

	taskID = AddTask(DendouDataInitTask, 0);
	TaskTable[taskID].work[DENDOU_SV_F]	= 0;
}

/* 殿堂入り（セクタ異常検証後） */
void	DendouInitRecover(void)
{
	u8	taskID;

	if(DendouInitSub())	return;

	taskID = AddTask(DendouDataInitTask, 0);
	TaskTable[taskID].work[DENDOU_SV_F]	= 1;
}

/*------------------------------------------------------------------*/
/*				殿堂入り表示デモ初期化								*/
/*------------------------------------------------------------------*/
static	void	DendouDataInitTask(u8 id)
{
	DENDOU_WORK* dwk;
	u16	i,j;
	u8	nicknameBUF[MONS_NAME_SIZE+EOM_SIZE];

	dwk =(DENDOU_WORK*)(&UserWork[0x1c000]);

	TaskTable[id].work[POKE_COUNT]	= 0;
	for(i=0;i<6;i++){
		if(PokeParaGet(&PokeParaMine[i],ID_monsno)){
			//手持ちポケモンデータ取得
			dwk->pdata[i].pnum	= PokeParaGet(&PokeParaMine[i],ID_monsno_egg);
			dwk->pdata[i].ID	= PokeParaGet(&PokeParaMine[i],ID_id_no);
			dwk->pdata[i].prnd	= PokeParaGet(&PokeParaMine[i],ID_personal_rnd);
			dwk->pdata[i].level	= PokeParaGet(&PokeParaMine[i],ID_level);
			//ニックネーム取得（EOMコードがあるので１１文字）
			PokeParaGet(&PokeParaMine[i],ID_nickname,nicknameBUF);
			//１０文字分だけコピー
			for(j=0;j<10;j++)	dwk->pdata[i].name[j] = nicknameBUF[j];
	
			TaskTable[id].work[POKE_COUNT]++;
		}else{
			//ポケモンなし
			dwk->pdata[i].pnum	= 0;
			dwk->pdata[i].ID	= 0;
			dwk->pdata[i].prnd	= 0;
			dwk->pdata[i].level	= 0;
			dwk->pdata[i].name[0] = EOM_;
		}
	}
	dendou_fade_req = 0;

	TaskTable[id].work[POKE_POS]	= 0;
	TaskTable[id].work[MINE_ACTNUM] = 0xff;
	for(i=0;i<6;i++)	TaskTable[id].work[POKE_ACTNUM + i] = 0xff;
	if(TaskTable[id].work[DENDOU_SV_F]){
		//データセーブはスキップ（セクタ異常検証後）
		TaskTable[id].TaskAdrs = DendouDataNextTask;
	}else{
		//データセーブ（通常）
		TaskTable[id].TaskAdrs = DendouDataTask;
	}
}

/*------------------------------------------------------------------*/
/*				殿堂入りセーブ										*/
/*------------------------------------------------------------------*/
static	void	DendouDataTask(u8 id)
{
	DENDOU_WORK	*dwk,*dwk_sv,*dwk_r,*dwk_w;
	DENDOU_POKE	*dp,*dp_sv;
	u16	i;

	dwk		=(DENDOU_WORK*)(&UserWork[0x1c000]);
	dp		= &(dwk->pdata[0]);
	dwk_sv	=(DENDOU_WORK*)(&UserWork[0x1e000]);

	if(!GameClearFlag){
		for(i=0;i<0x2000;i++)	UserWork[0x1e000 + i] = 0;
	}else{
		PokeAGBLoad(POKEAGB_LDDENDOU);
	}
	
	for(i=0;i<DENDOU_MAX;i++,dwk_sv++){
		dp_sv	= &(dwk_sv->pdata[0]);
		if(!dp_sv->pnum)	break;
	}
	if(i < DENDOU_MAX){
	}else{
		dwk_r	=(DENDOU_WORK*)(&UserWork[0x1e000]);
		dwk_w	=(DENDOU_WORK*)(&UserWork[0x1e000]);
		dwk_r++;

		for(i=0;i<(DENDOU_MAX-1);i++,dwk_w++,dwk_r++)	*dwk_w = *dwk_r;
		dwk_sv--;
	}

	*dwk_sv = *dwk;

	NMenuWinBoxWrite( 2, 14,27, 19);
	NMenuMsgWrite(DendouSaveStr,4,15);
	TaskTable[id].TaskAdrs = DendouDataWaitTask;
}

static	void	DendouDataWaitTask(u8 id)
{
	u8	sv_flag;

	SvRecoverReturnProc = DendouInitRecover;// セクタ検査処理後に復帰する先の関数ポインタ

	sv_flag = PokeAGBSave(POKEAGB_SVDENDOU);

	SePlay( SE_SAVE );
	TaskTable[id].TaskAdrs = DendouDataNextWaitTask;
	TaskTable[id].work[POKE_WAIT] = 0x20;
}

static	void	DendouDataNextWaitTask(u8 id)
{
	if(TaskTable[id].work[POKE_WAIT]){
		TaskTable[id].work[POKE_WAIT]--;
	}else{
		TaskTable[id].TaskAdrs = DendouDataNextTask;
	}
}

static	void	DendouDataNextTask(u8 id)
{
	PrintScreenInit(DENDOU_TYPE);					// CGX_B = 2,SCR_B = 15
	NMenuScreenInit(DENDOU_TYPE);
	TaskTable[id].TaskAdrs = DendouPokeInitTask;
}

/*------------------------------------------------------------------*/
/*				殿堂入りポケモンステータス表示デモ					*/
/*------------------------------------------------------------------*/
static	void	DendouPokeInitTask(u8 id)
{
	DENDOU_WORK* dwk;
	DENDOU_POKE* dp;
	u16	wp;
	u8	actnum;
	s16	px,py,px2,py2;

	dwk =(DENDOU_WORK*)(&UserWork[0x1c000]);

	wp = TaskTable[id].work[POKE_POS];
	dp = &(dwk->pdata[wp]);

	if(TaskTable[id].work[POKE_COUNT] > 3){	
		px = DendouPokePos[wp][0];
		py = DendouPokePos[wp][1];
		px2= DendouPokePos[wp][2];
		py2= DendouPokePos[wp][3];
	}else{
		px = DendouPokePos2[wp][0];
		py = DendouPokePos2[wp][1];
		px2= DendouPokePos2[wp][2];
		py2= DendouPokePos2[wp][3];
	}
	actnum = DendouPokeActorSet(dp->pnum,px,py,wp,dp->ID,dp->prnd);
	ActWork[actnum].work[1] = px2;
	ActWork[actnum].work[2] = py2;

	ActWork[actnum].work[0] = 0;
	ActWork[actnum].move	= PokeCutIn;
	TaskTable[id].work[POKE_ACTNUM + wp] = actnum;

	NMenuBoxClear(0,14,29,19);

	TaskTable[id].TaskAdrs = DendouPokeCutInTask;
}

static	void	DendouPokeCutInTask(u8 id)
{
	DENDOU_WORK* dwk;
	DENDOU_POKE* dp;
	u16	wp;

	dwk =(DENDOU_WORK*)(&UserWork[0x1c000]);

	wp = TaskTable[id].work[POKE_POS];
	dp = &(dwk->pdata[wp]);

	if(!ActWork[TaskTable[id].work[POKE_ACTNUM + wp]].work[0])	return;

	if(dp->pnum != MONSNO_TAMAGO){
		VoicePlay(dp->pnum,0);
	}
	DendouPokeInfoPut(dp,0,14);
	TaskTable[id].work[POKE_WAIT] = 120;
	TaskTable[id].TaskAdrs = DendouPokeWaitTask;
}

static	void	DendouPokeWaitTask(u8 id)
{
	DENDOU_WORK* dwk;
	DENDOU_POKE* dp;
	u16	wp;

	dwk =(DENDOU_WORK*)(&UserWork[0x1c000]);

	wp = TaskTable[id].work[POKE_POS];
	dp = &(dwk->pdata[wp]);

	if(TaskTable[id].work[POKE_WAIT]){
		TaskTable[id].work[POKE_WAIT]--;
		return;
	}
	dendou_fade_req |= 
			(0x00010000 << ActWork[TaskTable[id].work[POKE_ACTNUM + wp]].oamData.Pltt);

	if(TaskTable[id].work[POKE_POS] < 6-1){
		dp++;
		if(dp->pnum){
			TaskTable[id].work[POKE_POS]++;
			PaletteFadeReq(dendou_fade_req,0,12,12,BACK_COLOR);
			ActWork[TaskTable[id].work[POKE_ACTNUM + wp]].oamData.Priority = 1;
			TaskTable[id].TaskAdrs = DendouPokeInitTask;
			return;
		}
	}
	TaskTable[id].TaskAdrs = DendouCongraInitTask;
}

/*------------------------------------------------------------------*/
/*				ポケモン祝福デモ									*/
/*------------------------------------------------------------------*/
static	void	DendouCongraInitTask(u8 id)
{
	u16	i;

	PaletteFadeReq(0xffff0000,0,0,0,0);
	for(i=0;i<6;i++){
		if(TaskTable[id].work[POKE_ACTNUM + i] != 0xff){
			ActWork[TaskTable[id].work[POKE_ACTNUM + i]].oamData.Priority = 0;
		}
	}
	NMenuBoxClear(0,14,29,19);
	DendouCongraMsgPut(0,15);
	SePlay(SE_DENDOU);
	TaskTable[id].work[POKE_WAIT] = 400;

	TaskTable[id].TaskAdrs = DendouCongraTask;
}

static	void	DendouCongraTask(u8 id)
{
	u16	i;

	if(TaskTable[id].work[POKE_WAIT]){
		TaskTable[id].work[POKE_WAIT]--;
		if((!(TaskTable[id].work[POKE_WAIT]&0x0003))
			&&(TaskTable[id].work[POKE_WAIT] > 110)){
			KamifubukiActorSet();
		}
		return;
	}
	for(i=0;i<6;i++){
		if(TaskTable[id].work[POKE_ACTNUM + i] != 0xff){
			ActWork[TaskTable[id].work[POKE_ACTNUM + i]].oamData.Priority = 1;
		}
	}
	PaletteFadeReq(dendou_fade_req,0,12,12,BACK_COLOR);
	NMenuBoxClear(0,14,29,19);
	TaskTable[id].work[POKE_WAIT] = 0x07;
	TaskTable[id].TaskAdrs = DendouCongraEndTask;
}

static	void	DendouCongraEndTask(u8 id)
{
	if(TaskTable[id].work[POKE_WAIT] >= 0x10){
		TaskTable[id].TaskAdrs = DendouMineInitTask;
		return;
	}
	TaskTable[id].work[POKE_WAIT]++;
	*(vu16 *)REG_BLDALPHA = TaskTable[id].work[POKE_WAIT]*0x100;
}

/*------------------------------------------------------------------*/
/*				自機ステータス表示デモ								*/
/*------------------------------------------------------------------*/
static	void	DendouMineInitTask(u8 id)
{
	*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
			                |DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
							|DISP_BG3_ON				// BG3有効
							|DISP_BG0_ON				// BG0有効
							|DISP_OBJ_ON;
	PrintScreenInit(DENDOU2_TYPE);					// CGX_B = 2,SCR_B = 15
	NMenuScreenInit(DENDOU2_TYPE);

	TaskTable[id].work[MINE_ACTNUM] = DendouTrainerActorSet(MyData.my_sex,120,72,6);
	TaskTable[id].work[POKE_WAIT] = 120;
	TaskTable[id].TaskAdrs = DendouMineWaitTask;
}

static	void	DendouMineWaitTask(u8 id)
{
	if(TaskTable[id].work[POKE_WAIT]){
		TaskTable[id].work[POKE_WAIT]--;
		return;
	}
	if(ActWork[TaskTable[id].work[MINE_ACTNUM]].x != 160){
		ActWork[TaskTable[id].work[MINE_ACTNUM]].x++;
		return;
	}
	NMenuWinBoxWrite( 1,2,15,9);
	DendouMineInfoPut(1,2);

	NMenuWinBoxWrite( 2, 14,27, 19);
	NMenuMsgWrite(DendouMineCongraStr,4,15);

	TaskTable[id].TaskAdrs = DendouMineTask;
}

static	void	DendouMineTask(u8 id)
{
	if(sys.Trg & A_BUTTON){
		MusicFadeOutEnd(4);
		TaskTable[id].TaskAdrs = DendouExitInitTask;
	}
}

/*------------------------------------------------------------------*/
/*				殿堂入りデモ終了									*/
/*------------------------------------------------------------------*/
static	void	DendouExitInitTask(u8 id)
{
	CpuCopy(PaletteWorkTrans,PaletteWork,0x400,16);
	PaletteFadeReq(0xffffffff,8,0,16,0);

	TaskTable[id].TaskAdrs = DendouExitTask;
}

static	void	DendouExitTask(u8 id)
{
	if(FadeData.fade_sw)	return;

	DelTask(id);
	MainProcChange( EDdemoInit );
}





/********************************************************************/
/*                                                                  */
/*				メイン制御（殿堂入り確認画面）						*/
/*                                                                  */
#define		DLOOK_STCNT	(0)
#define		DLOOK_DENNO	(1)
#define		DLOOK_POS	(2)
#define		DLOOK_WAIT	(3)
#define		DLOOK_COUNT	(4)
#define		DLOOK_PASTR	(5)		//以降６ワーク分使用

static	const SCAN_WORK	DendouLookStartEf = {
1002,1002,0,0,0,0,0,0,
};
/********************************************************************/
void	DendouLookInit(void)
{
	switch(sys.InitSeqWork){
	default:
	case 0:
		SetVBlankFunc(NULL);			//割込み関数設定(VBLANK)

		DendouVRAMInit();

		sys.InitSeqWork = 1;
		break;
	case 1:
		DendouUtilityInit();

		sys.InitSeqWork++;
		break;
	case 2:
		SetVBlankFunc(VInterFunc);			//割込み関数設定(VBLANK)
		REG_IE_SET( V_BLANK_INTR_FLAG );// VBLANK割込許可
		*(vu16 *)REG_STAT |= STAT_V_BLANK_IF_ENABLE;

		sys.InitSeqWork++;
		break;
	case 3:
		//レジスタ設定
		*(vu16 *)REG_BLDCNT   = 0;
		*(vu16 *)REG_BLDALPHA = 0;
		*(vu16 *)REG_BLDY	  = 0;

		DendouRegInit();
		*(SCAN_WORK *)(&UserWork[0x1c000]) = DendouLookStartEf;

		InitBoxOnEffect((SCAN_WORK *)(&UserWork[0x1c000]));
		sys.InitSeqWork++;
		break;
	case 4:
		JumpActor();
		SetActor();
		PaletteAnime();
		if(!CheckBoxOnEffect())	return;
	
		sys.InitSeqWork++;
		break;
	case 5:
		*(vu16 *)REG_BLDCNT   = 0x3f42;
		*(vu16 *)REG_BLDALPHA = 0x0710;
		*(vu16 *)REG_BLDY	  = 0;

		AddTask(DendouLookInitTask, 0);
		MainProcChange(DendouMain);
	}
}

/*------------------------------------------------------------------*/
/*				殿堂入り確認画面初期化								*/
static	const u8	DendouLookCursorActTbl[]={2,1,3,6,4,5};
/*------------------------------------------------------------------*/
static	void	DendouLookInitTask(u8 id)
{
	DENDOU_WORK	*dwk_ld;
	DENDOU_POKE	*dp_ld;
	u16	i;
	u8	ret_flg;

	ret_flg = PokeAGBLoad(POKEAGB_LDDENDOU);
	if(ret_flg != SVLD_RET_OK){
		TaskTable[id].TaskAdrs = DendouLookErrorInitTask;	//ERROR
		return;
	}
	dwk_ld	=(DENDOU_WORK*)(&UserWork[0x1e000]);

	for(i=0;i<DENDOU_MAX;i++,dwk_ld++){
		dp_ld	= &(dwk_ld->pdata[0]);
		if(!dp_ld->pnum)	break;
	}
	if(i < DENDOU_MAX){
		TaskTable[id].work[DLOOK_STCNT]	= i-1;
	}else{
		TaskTable[id].work[DLOOK_STCNT]	= DENDOU_MAX-1;
	}
	TaskTable[id].work[DLOOK_DENNO]	= GetRecord( CNT_DENDOU );
	
	for(i=0;i<13;i++){
		*(u16*)(BG_VRAM + 0x3800 + 0*64 + (17+i)*2) = 0x0003 + i;
		*(u16*)(BG_VRAM + 0x3800 + 1*64 + (17+i)*2) = 0x0010 + i;
	}
	PrintScreenInit(DENDOU_TYPE);
	NMenuScreenInit(DENDOU_TYPE);
	TaskTable[id].TaskAdrs = DendouLookSceneInitTask;
}

/*------------------------------------------------------------------*/
/*				殿堂履歴きりかえ									*/
/*------------------------------------------------------------------*/
static	void	DendouLookSceneInitTask(u8 id)
{
	DENDOU_WORK	*dwk;
	DENDOU_POKE	*dp;
	u16	i,actnum;
	u8	str[8];
	s16	px,py;

	dwk = (DENDOU_WORK*)(&UserWork[0x1e000]);
		
	for(i=0;i<TaskTable[id].work[DLOOK_STCNT];i++)	dwk++;
	dp = &(dwk->pdata[0]);

	dendou_fade_req = 0;
	TaskTable[id].work[DLOOK_POS]	= 0;
	TaskTable[id].work[DLOOK_COUNT]	= 0;

	for(i=0;i<6;i++,dp++){	
		if(dp->pnum)	TaskTable[id].work[DLOOK_COUNT]++;
	}
	dp = &(dwk->pdata[0]);

	for(i=0;i<6;i++,dp++){	
		if(dp->pnum){
			if(TaskTable[id].work[DLOOK_COUNT] > 3){
				px = DendouPokePos[i][2];
				py = DendouPokePos[i][3];
			}else{
				px = DendouPokePos2[i][2];
				py = DendouPokePos2[i][3];
			}
			actnum = DendouPokeActorSet(dp->pnum,px,py,i,dp->ID,dp->prnd);
			ActWork[actnum].oamData.Priority = 1;
			TaskTable[id].work[DLOOK_PASTR + i] = actnum;
		}else{
			TaskTable[id].work[DLOOK_PASTR + i] = 0xff;
		}
	}
	ColorConceChange(0xffff0000,12,BACK_COLOR);
	NMenuMsgWrite(DendouInfoStr,1,0);
	
	str[0] = n0_ + (TaskTable[id].work[DLOOK_DENNO]/100);
	str[1] = n0_ + (TaskTable[id].work[DLOOK_DENNO]%100/10);
	str[2] = n0_ + (TaskTable[id].work[DLOOK_DENNO]%10);
	if(str[0] == n0_)	str[0] = spc_;
	if((str[0] == spc_)&&(str[1] == n0_))	str[1] = spc_;
	str[3] = EOM_;
	NMenuMsgWrite(str,3,0);

	TaskTable[id].TaskAdrs = DendouLookKeyInitTask;
}

/*------------------------------------------------------------------*/
/*				殿堂履歴内キー操作									*/
/*------------------------------------------------------------------*/
static	void	DendouLookKeyInitTask(u8 id)
{
	DENDOU_WORK	*dwk;
	DENDOU_POKE	*dp;
	u16	i,actnum;

	dwk	= (DENDOU_WORK*)(&UserWork[0x1e000]);
		
	for(i=0;i<TaskTable[id].work[DLOOK_STCNT];i++)	dwk++;
	dp = &(dwk->pdata[0]);

	for(i=0;i<6;i++){	
		actnum = TaskTable[id].work[DLOOK_PASTR + i];
		if(actnum != 0xff) ActWork[actnum].oamData.Priority = 1;
	}
	actnum = TaskTable[id].work[DLOOK_PASTR + TaskTable[id].work[DLOOK_POS]];
	
	ActWork[actnum].oamData.Priority = 0;
	dendou_fade_req = (0x00010000 << ActWork[actnum].oamData.Pltt)^0xffff0000;
	ColorConceChange2(dendou_fade_req,12,BACK_COLOR);

	dp = &(dwk->pdata[TaskTable[id].work[DLOOK_POS]]);
	NMenuBoxClear(0,14,29,19);
	if(dp->pnum != MONSNO_TAMAGO){
		VoicePlayStop();
		VoicePlay(dp->pnum,0);
	}
	DendouPokeInfoPut(dp,0,14);

	TaskTable[id].TaskAdrs = DendouLookKeyTask;
}

static	void	DendouLookKeyTask(u8 id)
{
	u16	i;
	u8	actnum;

	if(sys.Trg & A_BUTTON){
		if(TaskTable[id].work[DLOOK_STCNT]){
			TaskTable[id].work[DLOOK_STCNT]--;
			for(i=0;i<6;i++){
				actnum = TaskTable[id].work[DLOOK_PASTR + i];
				if(actnum != 0xff){
					ObjPalRegNumDel(ObjPalNumIdGet(ActWork[actnum].oamData.Pltt));
					DelActor(&ActWork[actnum]);
				}
			}
			if(TaskTable[id].work[DLOOK_DENNO])	TaskTable[id].work[DLOOK_DENNO]--;

			TaskTable[id].TaskAdrs = DendouLookSceneInitTask;
		}else{
			if(VoiceEndCheck()){
				VoicePlayStop();
				m4aMPlayVolumeControl( &m4a_mplay000, 0xffff, 256 );
			}
			TaskTable[id].TaskAdrs = DendouLookExitInitTask;
		}
		return;
	}
	if(sys.Trg & B_BUTTON){
		if(VoiceEndCheck()){
			VoicePlayStop();
			m4aMPlayVolumeControl( &m4a_mplay000, 0xffff, 256 );
		}
		TaskTable[id].TaskAdrs = DendouLookExitInitTask;
		return;
	}
	if((sys.Trg & U_KEY)&&(TaskTable[id].work[DLOOK_POS])){
		TaskTable[id].work[DLOOK_POS]--;

		TaskTable[id].TaskAdrs = DendouLookKeyInitTask;
		return;
	}
	if((sys.Trg & D_KEY)&&(TaskTable[id].work[DLOOK_POS] < TaskTable[id].work[DLOOK_COUNT]-1)){
		TaskTable[id].work[DLOOK_POS]++;

		TaskTable[id].TaskAdrs = DendouLookKeyInitTask;
		return;
	}
}

/*------------------------------------------------------------------*/
/*				殿堂入り確認画面終了								*/
/*------------------------------------------------------------------*/
static	void	DendouLookExitInitTask(u8 id)
{
	CpuCopy(PaletteWorkTrans,PaletteWork,0x400,16);
	*(SCAN_WORK *)(&UserWork[0x1c000]) = DendouLookStartEf;

	InitBoxOffEffect((SCAN_WORK *)(&UserWork[0x1c000]));

	TaskTable[id].TaskAdrs = DendouLookExitTask;
}

static	void	DendouLookExitTask(u8 id)
{
	if(!CheckBoxOffEffect())	return;

	DelTask(id);
	ScriptDendouRecover();
}

/*------------------------------------------------------------------*/
/*				殿堂入り確認画面ERROR処理							*/
/*------------------------------------------------------------------*/
static	void	DendouLookErrorInitTask(u8 id)
{
	NMenuWinBoxWrite( 2, 14,27, 19);
	NMenuTalkMsgSet(DendouErrorStr,4,15);
		
	TaskTable[id].TaskAdrs = DendouLookErrorTask;
}

static	void	DendouLookErrorTask(u8 id)
{
	if(NMenuTalkMsgPut()){
		if(sys.Trg & A_BUTTON){
			TaskTable[id].TaskAdrs = DendouLookExitInitTask;
		}
	}
}





/********************************************************************/
/*                                                                  */
/*				表示関連											*/
/*                                                                  */
/********************************************************************/
/*------------------------------------------------------------------*/
/*				祝福メッセージ										*/
/*------------------------------------------------------------------*/
static void	DendouCongraMsgPut(u8 x,u8 y)
{
	NMenuMsgWrite(DendouCongraStr,x+7,y+1);
}

/*------------------------------------------------------------------*/
/*				殿堂入りポケモンデータの表示						*/
/*------------------------------------------------------------------*/
static void	DendouPokeInfoPut(DENDOU_POKE *dp,u8 x,u8 y)
{
	u16	i,pnum;
	u8	str[16];

	//ポケモンナンバーの表示
	if(dp->pnum != MONSNO_TAMAGO){
		pnum = PokemonNumberGet(dp->pnum);
		if(pnum != 0xffff){
			NMenuMsgWrite(NumStr,x+DP_INFO_NUM_X,y+1);
			str[0] = n0_ +(pnum/100);
			str[1] = n0_ +(pnum%100/10);
			str[2] = n0_ +(pnum%100%10); 
			str[3] = EOM_;
			NMenuMsgWrite(str,x+DP_INFO_NUM_X+3,y+1);
		}
	}

	//ニックネームの表示
	i=0;
//	while((dp->name[i]!=EOM_)&&(i<MONS_NAME_SIZE)){
	while((dp->name[i]!=EOM_)&&(i<5)){
		str[i] = dp->name[i];
		i++;
	}
	str[i] = EOM_;
	NMenuMsgWrite(str,x+DP_INFO_NICK_X,y+1);

	//ポケモン名の表示
	if(dp->pnum != MONSNO_TAMAGO){
		str[0] = sura_;

		i = 0;
		while((PokeNameData[dp->pnum][i]!=EOM_)&&(i<MONS_NAME_SIZE)){
			str[i+1] = PokeNameData[dp->pnum][i];
			i++;
		}
		if((dp->pnum == MONSNO_NIDORAN_M)||(dp->pnum == MONSNO_NIDORAN_F)){
			str[i+1] = spc_;
		}else{
			switch(PokeSexGetMonsNo(dp->pnum,dp->prnd)){
			case	MONS_MALE:
				str[i+1] = osu_;
				break;
			case	MONS_FEMALE:
				str[i+1] = mesu_;
				break;
			case	MONS_UNKNOWN:
				str[i+1] = spc_;
				break;
			}
		}
		i++;
		str[i+1] = EOM_;
		NMenuMsgWrite(str,x+DP_INFO_NAME_X,y+1);

		//レベルの表示
		NMenuMsgWrite(LVStr,x+DP_INFO_LV_X,y+3);
		if(dp->level/100)	str[0] = n0_ +(dp->level/100);
		else				str[0] = spc_;
		str[1] = n0_ +(dp->level%100/10);
		str[2] = n0_ +(dp->level%100%10); 
		str[3] = EOM_;
		NMenuMsgWrite(str,x+DP_INFO_LV_X+2,y+3);

		//ＩＤの表示
		NMenuMsgWrite(IDnoStr,x+DP_INFO_ID_X,y+3);
		str[0] = n0_ +((dp->ID & 0xffff)%100000/10000);
		str[1] = n0_ +((dp->ID & 0xffff)%10000/1000);
		str[2] = n0_ +((dp->ID & 0xffff)%1000/100);
		str[3] = n0_ +((dp->ID & 0xffff)%100/10);
		str[4] = n0_ +((dp->ID & 0xffff)%10);
		str[5] = EOM_;
		NMenuMsgWrite(str,x+DP_INFO_ID_X+6,y+3);
	}
}

/*------------------------------------------------------------------*/
/*				自機データの表示									*/
/*------------------------------------------------------------------*/
static void	DendouMineInfoPut(u8 x,u8 y)
{
	u16	i;
	u8	str[20];
	u16 ID;

	//名前の表示
	NMenuMsgWrite(NameStr,x+1,y+1);
	for(i=0;i<5;i++)	str[i] = MyData.my_name[i];
	str[i] = EOM_;
	NMenuMsgWrite(str,x+8,y+1);

	//ＩＤの表示
	ID = MyData.ID[0]|(MyData.ID[1]<<8);
	NMenuMsgWrite(IDno2Str,x+1,y+3);
	str[0] = n0_ +ID%100000/10000;
	str[1] = n0_ +ID%10000/1000;
	str[2] = n0_ +ID%1000/100;
	str[3] = n0_ +ID%100/10;
	str[4] = n0_ +ID%10;
	str[5] = EOM_;
	NMenuMsgWrite(str,x+8,y+3);

	//プレイ時間の表示
	NMenuMsgWrite(HeroInfoTimeMsg,x+1,y+5);
	str[0] = n0_ + (MyData.playtime_h/100);
	str[1] = n0_ + (MyData.playtime_h%100/10);
	str[2] = n0_ + (MyData.playtime_h%10);
	if(str[0] == n0_)	str[0] = spc_;
	if((str[0] == spc_)&&(str[1] == n0_))	str[8] = spc_;
	str[3] = colon_;
	str[4] = n0_ + (MyData.playtime_m%100/10);
	str[5] = n0_ + (MyData.playtime_m%10);
	str[6] = EOM_;
	NMenuMsgWrite(str,x+8,y+5);
}





/********************************************************************/
/*                                                                  */
/*				初期化用関数										*/
/*                                                                  */
/********************************************************************/
static	void	DendouVRAMInit(void)
{
	u16	i;

   	*(vu16 *)REG_DISPCNT	= 0;
   	*(vu16 *)REG_BG0CNT		= 0;
   	*(vu16 *)REG_BG0HOFS	= 0;
   	*(vu16 *)REG_BG0VOFS	= 0; 
   	*(vu16 *)REG_BG1CNT		= 0;
   	*(vu16 *)REG_BG1HOFS	= 0;
   	*(vu16 *)REG_BG1VOFS	= 0; 
   	*(vu16 *)REG_BG2CNT		= 0;
   	*(vu16 *)REG_BG2HOFS	= 0;
   	*(vu16 *)REG_BG2VOFS	= 0; 
   	*(vu16 *)REG_BG3CNT		= 0;
   	*(vu16 *)REG_BG3HOFS	= 0;
   	*(vu16 *)REG_BG3VOFS	= 0; 

	DIV_DMACLEAR(3, 0, VRAM, VRAM_SIZE,           16);	// VRAM   初期化
	DIV_DMACLEAR(3, 0, OAM,  OAM_SIZE,            32);	// OAM    初期化
	DIV_DMACLEAR(3, 0, PLTT, PLTT_SIZE,           16);	// ﾊﾟﾚｯﾄ  初期化

	//データ転送
	LZ77UnCompVram((void*)den_ch_LZ,(void*)BG_VRAM);	//BG1 MAP転送(ﾒｲﾝ)
	//BG1
	for(i=0;i<32* 2;i++)	*(u16*)(BG_VRAM + 0x3800 +  0*64 + i*2) = 1;
	for(i=0;i<32* 6;i++)	*(u16*)(BG_VRAM + 0x3800 + 14*64 + i*2) = 1;
	//BG3
	for(i=0;i<32*32;i++)	*(u16*)(BG_VRAM + 0x3000 +  0*64 + i*2) = 2;

	DIV_DMACLEAR(3, 0, UserWork, 0x4000,          16);
	PaletteAnimeInit();
	PaletteWorkSet(&dendou_Palette[0x0000],PA_BG0,0x20);
}

static	void	DendouUtilityInit(void)
{
	LasterInit();									// HDMA初期化
	InitTask();										// ﾀｽｸ  初期化
	InitActor();									// ｱｸﾀｰ 初期化
	ObjPalManInit();								// ｵﾌﾞｼﾞｪﾊﾟﾚｯﾄﾏﾈｰｼﾞｬ初期化
	ObjPalManStart = 8;								// ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬNo開始
	DecordCellSet((CellData*)DendouCell);
	DecordPalSet((PalData*)DendouPal);
	PrintScreenInit(DENDOU2_TYPE);
	NMenuScreenInit(DENDOU2_TYPE);
}

static	void	DendouRegInit(void)
{
	//レジスタ設定
	*(vu16 *)REG_BG1CNT = BG_COLOR_16					//16色選択
						| BG_SCREEN_SIZE_0				// スクリーンサイズ
						| BG_PRIORITY_0					//BG優先順位
						| 7 << BG_SCREEN_BASE_SHIFT	//スクリーンベースブロック
						| 0 << BG_CHAR_BASE_SHIFT	//キャラクタベースブロック
						;
	*(vu16 *)REG_BG3CNT = BG_COLOR_16					//16色選択
						| BG_SCREEN_SIZE_0				// スクリーンサイズ
						| BG_PRIORITY_3					//BG優先順位
						| 6 << BG_SCREEN_BASE_SHIFT	//スクリーンベースブロック
						| 0 << BG_CHAR_BASE_SHIFT	//キャラクタベースブロック
						;
	*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
		                |DISP_OBJ_CHAR_1D_MAP			// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
						|DISP_BG3_ON					// BG3有効
						|DISP_BG1_ON					// BG1有効
						|DISP_BG0_ON					// BG0有効
						|DISP_OBJ_ON;
}





/********************************************************************/
/*                                                                  */
/*				OBJｾｯﾄ&動作関連										*/
/*                                                                  */
/********************************************************************/
/*==================================================================*/
/*				ポケモン＆トレーナー								*/
/*==================================================================*/
static void		PokeCutIn(actWork* aw)
{
	if((aw->x != aw->work[1])||(aw->y != aw->work[2])){
		if(aw->x < aw->work[1])	aw->x += 15;
		if(aw->x > aw->work[1])	aw->x -= 15;
		if(aw->y < aw->work[2])	aw->y += 10;
		if(aw->y > aw->work[2])	aw->y -= 10;
		return;
	}
	aw->work[0] = 1;
	aw->move	= PokeWait;
}

/*==================================================================*/
//VPos,AffineMode,ObjMode,Mosaic,ColorMode,Shape,
//HPos,AffineParamNo,Size,CharNo,Priority,Pltt,(Affine)
static	const ActOamData DendouMonsOamData = {0,0,0,0,0,0,0,0,3,0,0,0,0};
static void		PokeWait(actWork* aw){}

const u32 DendouDecordAdrs[]=
{0x2008000,0x200a000,0x200c000,0x200e000,0x2010000,0x2014000,0x2018000};

static	const	actAnmData actAnmTransDataTable1[] = {
	{(void *)0x2008000+(0x20*64)*0,0x20*64},{(void *)0x2008000+(0x20*64)*1,0x20*64},
	{(void *)0x2008000+(0x20*64)*2,0x20*64},{(void *)0x2008000+(0x20*64)*3,0x20*64},
};
static	const	actAnmData actAnmTransDataTable2[] = {
	{(void *)0x200a000+(0x20*64)*0,0x20*64},{(void *)0x200a000+(0x20*64)*1,0x20*64},
	{(void *)0x200a000+(0x20*64)*2,0x20*64},{(void *)0x200a000+(0x20*64)*3,0x20*64},
};
static	const	actAnmData actAnmTransDataTable3[] = {
	{(void *)0x200c000+(0x20*64)*0,0x20*64},{(void *)0x200c000+(0x20*64)*1,0x20*64},
	{(void *)0x200c000+(0x20*64)*2,0x20*64},{(void *)0x200c000+(0x20*64)*3,0x20*64},
};
static	const	actAnmData actAnmTransDataTable4[] = {
	{(void *)0x200e000+(0x20*64)*0,0x20*64},{(void *)0x200e000+(0x20*64)*1,0x20*64},
	{(void *)0x200e000+(0x20*64)*2,0x20*64},{(void *)0x200e000+(0x20*64)*3,0x20*64},
};
static	const	actAnmData actAnmTransDataTable5[] = {
	{(void *)0x2010000+(0x20*64)*0,0x20*64},{(void *)0x2010000+(0x20*64)*1,0x20*64},
	{(void *)0x2010000+(0x20*64)*2,0x20*64},{(void *)0x2010000+(0x20*64)*3,0x20*64},
};
static	const	actAnmData actAnmTransDataTable6[] = {
	{(void *)0x2014000+(0x20*64)*0,0x20*64},{(void *)0x2014000+(0x20*64)*1,0x20*64},
	{(void *)0x2014000+(0x20*64)*2,0x20*64},{(void *)0x2014000+(0x20*64)*3,0x20*64},
};
static	const	actAnmData actAnmTransDataTable7[] = {
	{(void *)0x2018000+(0x20*64)*0,0x20*64},{(void *)0x2018000+(0x20*64)*1,0x20*64},
	{(void *)0x2018000+(0x20*64)*2,0x20*64},{(void *)0x2018000+(0x20*64)*3,0x20*64},
};

static	const	actAnmData* const	actAnmTransDataTableMain[] =
{
actAnmTransDataTable1, actAnmTransDataTable2, actAnmTransDataTable3,
actAnmTransDataTable4, actAnmTransDataTable5, actAnmTransDataTable6,
actAnmTransDataTable7, 
};

static	const actHeader DendouOamHeader = 
{-1,-1,&DendouMonsOamData,0,actAnmTransDataTable1,DummyActAffTbl,PokeWait};

/*==================================================================*/
//	DendouPokeActHeaderMake(u16 palID,u8 setnum)
//	palID	: パレットＩＤ
//	setnum	: 表示データ格納位置ナンバー 
/*==================================================================*/
void	DendouPokeActHeaderMake(u16 palID,u8 setnum)
{
	PokeActHeader = DendouOamHeader;
	PokeActHeader.palNo=palID;

	PokeActHeader.anmTrans_p = actAnmTransDataTableMain[setnum];
	PokeActHeader.anmData_p = PokeActAnmTbl;
}

/*==================================================================*/
//	DendouTrainerActHeaderMake(u16 palID,u8 setnum)
//	palID : パレットＩＤ
//	setnum	: 表示データ格納位置ナンバー 
/*==================================================================*/
void	DendouTrainerActHeaderMake(u16 palID,u8 setnum)
{
	PokeActHeader = DendouOamHeader;
	PokeActHeader.palNo=palID;

	PokeActHeader.anmTrans_p = actAnmTransDataTableMain[setnum];
	PokeActHeader.anmData_p = TRFAnmTbl[0];
}

/*==================================================================*/
/*				ポケモン＆トレーナー設定							*/
/*==================================================================*/
u16		DendouPokeActorSet(u16 pnum,s16 x,s16 y,u16 decord_p,u32 p_id,u32 p_rnd)
{
	u8	actnum;

	DecordPokeCellMakeRndFB( &PM2FObjDataCell[pnum],pm2fpara[pnum].size,pm2fpara[pnum].patcnt,
							(void *)0x2000000,(void *)DendouDecordAdrs[decord_p],
							pnum,p_rnd,POKE_FRONT);
	DecordPaletteWork( (void*)PokePalGetPara(pnum,p_id,p_rnd),PA_OBJ0+(decord_p*16),0x20 );

	DendouPokeActHeaderMake( decord_p,decord_p );
	actnum = AddActor( &PokeActHeader, x, y, 10 - decord_p );
	ActWork[actnum].oamData.Pltt = decord_p;
	return actnum;
}

static	u16		DendouTrainerActorSet(u16 tnum,s16 x,s16 y,u16 decord_p)
{
	u8	actnum;

	DecordPokeCellMake( &TRFObjDataCell[tnum],trfpara[tnum].size,trfpara[tnum].patcnt,
						(void *)0x2000000,(void *)DendouDecordAdrs[decord_p],tnum);
	DecordPaletteWork( (void*)(TRFObjDataPal[tnum].pal_data),PA_OBJ0+(decord_p*16),0x20 );

	DendouTrainerActHeaderMake(decord_p,decord_p);
	actnum = AddActor( &PokeActHeader, x, y, 1 );
	ActWork[actnum].oamData.Pltt = decord_p;
	return actnum;
}


/*==================================================================*/
/*				紙ふぶき											*/
/*==================================================================*/
static void		KamifubukiActMove(actWork* aw)
{
	u8	theta,r;

	if(aw->dy > 120){
		DelActor(aw);
		return;
	}
	aw->dy += aw->work[1]+1;
	theta = aw->work[0];
	r = 8+(pp_rand()%4);
	aw->dx = r*sin_cos_table[theta]/0x100;
	aw->work[0]+=4;
}

/*==================================================================*/
// OAMﾃﾞｰﾀ 
//VPos,AffineMode,ObjMode,Mosaic,ColorMode,Shape,
//HPos,AffineParamNo,Size,CharNo,Priority,Pltt,(Affine)
static	const ActOamData DendouKamifubukiOamData = {0,0,0,0,0,0,0,0,0,0,0,0,0};

// ANMﾃﾞｰﾀ 
static const actAnm KamifubukiAnm0[]	= {{ 0,30, 0, 0},{ACT_ANMEND,0,0,0}};
static const actAnm KamifubukiAnm1[]	= {{ 1,30, 0, 0},{ACT_ANMEND,0,0,0}};
static const actAnm KamifubukiAnm2[]	= {{ 2,30, 0, 0},{ACT_ANMEND,0,0,0}};
static const actAnm KamifubukiAnm3[]	= {{ 3,30, 0, 0},{ACT_ANMEND,0,0,0}};
static const actAnm KamifubukiAnm4[]	= {{ 4,30, 0, 0},{ACT_ANMEND,0,0,0}};
static const actAnm KamifubukiAnm5[]	= {{ 5,30, 0, 0},{ACT_ANMEND,0,0,0}};
static const actAnm KamifubukiAnm6[]	= {{ 6,30, 0, 0},{ACT_ANMEND,0,0,0}};
static const actAnm KamifubukiAnm7[]	= {{ 7,30, 0, 0},{ACT_ANMEND,0,0,0}};
static const actAnm KamifubukiAnm8[]	= {{ 8,30, 0, 0},{ACT_ANMEND,0,0,0}};
static const actAnm KamifubukiAnm9[]	= {{ 9,30, 0, 0},{ACT_ANMEND,0,0,0}};
static const actAnm KamifubukiAnm10[]	= {{10,30, 0, 0},{ACT_ANMEND,0,0,0}};
static const actAnm KamifubukiAnm11[]	= {{11,30, 0, 0},{ACT_ANMEND,0,0,0}};
static const actAnm KamifubukiAnm12[]	= {{12,30, 0, 0},{ACT_ANMEND,0,0,0}};
static const actAnm KamifubukiAnm13[]	= {{13,30, 0, 0},{ACT_ANMEND,0,0,0}};
static const actAnm KamifubukiAnm14[]	= {{14,30, 0, 0},{ACT_ANMEND,0,0,0}};
static const actAnm KamifubukiAnm15[]	= {{15,30, 0, 0},{ACT_ANMEND,0,0,0}};
static const actAnm KamifubukiAnm16[]	= {{16,30, 0, 0},{ACT_ANMEND,0,0,0}};

// ANMﾃｰﾌﾞﾙ
static const actAnm* const KamifubukiAnmTbl[] = {
KamifubukiAnm0,KamifubukiAnm1,KamifubukiAnm2,KamifubukiAnm3,KamifubukiAnm4,
KamifubukiAnm5,KamifubukiAnm6,KamifubukiAnm7,KamifubukiAnm8,KamifubukiAnm9,
KamifubukiAnm10,KamifubukiAnm11,KamifubukiAnm12,KamifubukiAnm13,
KamifubukiAnm14,KamifubukiAnm15,KamifubukiAnm16,
};

static const actHeader DendouKamifubukiActHeader ={
CELLID_DENDOU,PALID_DENDOU,
&DendouKamifubukiOamData,KamifubukiAnmTbl,ACT_NTRANS,DummyActAffTbl,KamifubukiActMove
};

/*==================================================================*/
/*				紙ふぶき設定										*/
/*==================================================================*/
static	u16		KamifubukiActorSet(void)
{
	s16	x,y;
	u8	actnum;

	x = (pp_rand()%240);
	y = -(pp_rand()%8);
	actnum = AddActor( &DendouKamifubukiActHeader,x,y,0);
	ActAnmChg(&ActWork[actnum],(pp_rand()%17));
	if(pp_rand()&3)	ActWork[actnum].work[1] = 0;
	else			ActWork[actnum].work[1] = 1;

	return  0;
}


