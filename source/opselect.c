//=========================================================================
//	
//	ポケモン選択(オープニングイベント)
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
#include "zukan.h"
#include "fld_eff.h"
#include "calctool.h"
#include "ev_flag.h"
#include "mus_tool.h"
#include "monsno.def"
#include "message.h"
#include "laster.h"
#include "opselect.dat"

void	OpPokeSelEvInit(void);
void	OpPokeSelEvMain(void);

extern	const	u32	DecordAdrs[];
extern	void	VoicePlay( u16 no, s8 pan );

static	const	CellData	ObjCell1[];
static	const	CellData	ObjCell2[];
static	const	PalData		ObjPal[];

static	void	OpPokeSelEvSeq1InitTask(u8 id);
static	void	OpPokeSelEvSeq1Task(u8 id);
static	void	OpPokeSelEvSeq1EffectTask(u8 id);
static	void	OpPokeSelEvSeq2InitTask(u8 id);
static	void	OpPokeSelEvSeq2Task(u8 id);
static	void	OpPokeSelEvSeq2RetTask(u8 id);
static	void	BallInfoWindowSet(u8 clr_p,u8 w_p);

static	u8		PokePut(u16 poke_num,u8 x,u8 y);
static	const	actHeader CursorActHeader;
static	const	actHeader MonsterBallActHeader;
static	const	actHeader BallWindowActHeader;
static	const	actAffAnm*	const	PokemonAffTable[];
static	void	BallWindowActMove(actWork* aw);

static	const u8	BallPosTable[3][2]		= {{ 60, 64},{120, 88},{180, 64}};
static	const u8	BallInfoPosTable[3][2]	= {{ 3, 9},{17,10},{12, 4}};

static	const u16	SelectPokemonNumTable[3]= {
MONSNO_KIMORI,		//「ジュモリ」
MONSNO_ATYAMO,		//「アチャモ」		
MONSNO_MIZUGOROU,	//「ミズゴロウ」
};

/********************************************************************/
/*                                                                  */
/*				選択ポケモンナンバー取得							*/
/*                                                                  */
/********************************************************************/
u16	FirstPokemonNumGet(u16	index)
{
	if(index >3)	index = 0;		//Error回避
	return	SelectPokemonNumTable[index];
}


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
/*				初期化												*/
/*                                                                  */
/********************************************************************/
void	OpPokeSelEvInit(void)
{
	u8	taskID;
	u16 act_no;

	SetVBlankFunc(NULL);			//割込み関数設定(VBLANK)

   	*(vu16 *)REG_DISPCNT	= 0;
   	*(vu16 *)REG_BG3CNT		= 0;
   	*(vu16 *)REG_BG2CNT		= 0;
   	*(vu16 *)REG_BG1CNT		= 0;
   	*(vu16 *)REG_BG0CNT		= 0;

	*(vu16 *)REG_BG3HOFS	= 0;
	*(vu16 *)REG_BG3VOFS	= 0;
	*(vu16 *)REG_BG2HOFS	= 0;
	*(vu16 *)REG_BG2VOFS	= 0;
   	*(vu16 *)REG_BG1HOFS	= 0;
   	*(vu16 *)REG_BG1VOFS	= 0; 
   	*(vu16 *)REG_BG0HOFS	= 0;
   	*(vu16 *)REG_BG0VOFS	= 0; 

    DmaClear(3, 0, VRAM, VRAM_SIZE,           16);	// VRAM   初期化
    DmaClear(3, 0, OAM,  OAM_SIZE,            32);	// OAM    初期化
    DmaClear(3, 0, PLTT, PLTT_SIZE,           16);	// ﾊﾟﾚｯﾄ  初期化

	LZ77UnCompVram((void*)opselch_LZ,(void*)(BG_VRAM+0x0000));	//BG  CGX転送
	LZ77UnCompVram((void*)opselsc1_LZ,(void*)(BG_VRAM+0x3000));	//BG2 MAP転送(バッグ)
	LZ77UnCompVram((void*)opselsc2_LZ,(void*)(BG_VRAM+0x3800));	//BG3 MAP転送(背景)

	LasterInit();									// HDMA初期化
	InitTask();										// ﾀｽｸ  初期化
	InitActor();									// ｱｸﾀｰ 初期化
	PaletteAnimeInit();
	ObjPalManInit();								// ｵﾌﾞｼﾞｪﾊﾟﾚｯﾄﾏﾈｰｼﾞｬ初期化

	PaletteWorkSet(opball_Palette,PA_BG0,0x40);		//BG2&BG3 COL転送
	DecordCellSet((CellData*)ObjCell1);
	DecordCellSet((CellData*)ObjCell2);
	ObjPalSets((PalData*)ObjPal);

	PrintScreenInit(DEFAULT_TYPE);
	NMenuScreenInit(FIELD_MENU_TYPE);

	PaletteFadeReq(0xffffffff,0,16,0,0);

	REG_IE_SET( V_BLANK_INTR_FLAG );// VBLANK割込許可
    *(vu16 *)REG_STAT |= STAT_V_BLANK_IF_ENABLE;

	SetVBlankFunc(VInterFunc);			//割込み関数設定(VBLANK)
	MainProcChange(OpPokeSelEvMain);

	*(vu16 *)REG_WININ	= 0x003f;
 	*(vu16 *)REG_WINOUT	= 0x001f;
	*(vu16 *)REG_WIN0H	= 0;
	*(vu16 *)REG_WIN0V	= 0;

   	*(vu16 *)REG_BLDCNT   = 0x00fe;	//半透明設定
   	*(vu16 *)REG_BLDALPHA = 0;
   	*(vu16 *)REG_BLDY	  = 7;

	*(vu16 *)REG_BG3CNT = BG_COLOR_16 | BG_SCREEN_SIZE_0 | BG_PRIORITY_3
						| 7 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT;
	*(vu16 *)REG_BG2CNT = BG_COLOR_16 | BG_SCREEN_SIZE_0 | BG_PRIORITY_2
						| 6 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT;
	*(vu16 *)REG_BG0CNT = BG_COLOR_16 | BG_SCREEN_SIZE_0 | BG_PRIORITY_0
						| 31 << BG_SCREEN_BASE_SHIFT | 2 << BG_CHAR_BASE_SHIFT;

	*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
                          |	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
						  | DISP_BG3_ON					// BG3有効
						  | DISP_BG2_ON					// BG2有効
						  | DISP_BG0_ON					// BG0有効
						  | DISP_WIN0_ON				// WIN0 ON
						  | DISP_OBJ_ON;

	taskID = AddTask(OpPokeSelEvSeq1InitTask, 0);
	TaskTable[taskID].work[0] = 1;		//DefaultPos

	act_no = AddActor(&CursorActHeader,120,56,2);
	ActWork[act_no].work[0] = taskID;

		
	act_no = AddActor(&MonsterBallActHeader,BallPosTable[0][0],BallPosTable[0][1],2);
	ActWork[act_no].work[0] = taskID;
	ActWork[act_no].work[1] = 0;
	act_no = AddActor(&MonsterBallActHeader,BallPosTable[1][0],BallPosTable[1][1],2);
	ActWork[act_no].work[0] = taskID;
	ActWork[act_no].work[1] = 1;
	act_no = AddActor(&MonsterBallActHeader,BallPosTable[2][0],BallPosTable[2][1],2);
	ActWork[act_no].work[0] = taskID;
	ActWork[act_no].work[1] = 2;
}


/********************************************************************/
/*                                                                  */
/*				ﾒｲﾝ													*/
/*                                                                  */
/********************************************************************/
void	OpPokeSelEvMain(void)
{
		MainTask();
		JumpActor();
		SetActor();
		PaletteAnime();
}


/********************************************************************/
/*                                                                  */
/*				メイン制御											*/
/*                                                                  */
/********************************************************************/
/*==================================================================*/
//		ボール選択(初期化)
/*==================================================================*/
static	void	OpPokeSelEvSeq1InitTask(u8 id)
{
	BallInfoWindowSet(0xff,TaskTable[id].work[0]);

	NMenuWinBoxWrite( 2,14,27,19);
	NMenuMsgWrite(opball_sel_msg,3,15);
	TaskTable[id].TaskAdrs = OpPokeSelEvSeq1Task;
}

/*==================================================================*/
//		ボール選択(キー判定)
/*==================================================================*/
static	void	OpPokeSelEvSeq1Task(u8 id)
{
	u8	p_bak;
	u16 act_no;

	p_bak = TaskTable[id].work[0];

	if(sys.Trg & A_BUTTON){
		NMenuBoxClear(	BallInfoPosTable[p_bak][0],BallInfoPosTable[p_bak][1],
						BallInfoPosTable[p_bak][0]+(9-1),BallInfoPosTable[p_bak][1]+(4-1));
		*(vu16 *)REG_WIN0H	= 0;
		*(vu16 *)REG_WIN0V	= 0;

		act_no = AddActor(&BallWindowActHeader,BallPosTable[p_bak][0],BallPosTable[p_bak][1],1);
		TaskTable[id].work[2] = act_no;
		act_no = PokePut(FirstPokemonNumGet(TaskTable[id].work[0]),
				BallPosTable[p_bak][0],BallPosTable[p_bak][1]);
		ActWork[act_no].aff_tbl = PokemonAffTable;
		ActWork[act_no].move	= BallWindowActMove;
		TaskTable[id].work[1]	= act_no;

		TaskTable[id].TaskAdrs = OpPokeSelEvSeq1EffectTask;
		return;
	}
	if((sys.Trg & L_KEY)&&(p_bak > 0)){
		TaskTable[id].work[0]--;
		BallInfoWindowSet(p_bak,TaskTable[id].work[0]);
		return;
	}
	if((sys.Trg & R_KEY)&&(p_bak < 2)){
		TaskTable[id].work[0]++;
		BallInfoWindowSet(p_bak,TaskTable[id].work[0]);
		return;
	}
}

/*==================================================================*/
//		ボールウインドウ展開エフェクト
/*==================================================================*/
static	void	OpPokeSelEvSeq1EffectTask(u8 id)
{
	if((ActWork[TaskTable[id].work[2]].affend_sw)
		&&(ActWork[TaskTable[id].work[2]].x == 120)
		&&(ActWork[TaskTable[id].work[2]].y == 64)){
		TaskTable[id].TaskAdrs = OpPokeSelEvSeq2InitTask;
	}
}

/*==================================================================*/
//		ボール選択確認「はい・いいえ」(初期化)
/*==================================================================*/
static	void	OpPokeSelEvSeq2InitTask(u8 id)
{
	u16	poke_num;

	poke_num = FirstPokemonNumGet(TaskTable[id].work[0]);
	VoicePlay(poke_num,0);

	NMenuWinBoxWrite( 2,14,27,19);
	NMenuMsgWrite(opball_yesno_msg,3,15);

	YesNoSelectInit(21,7);

	TaskTable[id].TaskAdrs = OpPokeSelEvSeq2Task;
}

/*==================================================================*/
//		ボール選択確認「はい・いいえ」(キー判定)
/*==================================================================*/
static	void	OpPokeSelEvSeq2Task(u8 id)
{
	s8	res;
	u8	actnum;

	res = YesNoSelectMain();

	switch(res){

	case	CURSOR_YES_VALUE:	//はい
		AnswerWork = TaskTable[id].work[0];	//返り値設定(ポケモンデータINDEX)
		MainProcChange(sys.pReturnProc);
		break;
	case	CURSOR_NO_VALUE:	//いいえ
	case	CURSOR_CANCEL_VALUE:	//キャンセルされた
		SePlay(SE_SELECT);

		NMenuBoxClear(21, 7,27,12);

		actnum = TaskTable[id].work[1];
		ObjPalRegNumDel( ObjPalNumIdGet(ActWork[actnum].oamData.Pltt) );
		AffineWorkNumDel(ActWork[actnum].oamData.AffineParamNo);	// ｱﾌｨﾝﾏﾈｰｼﾞｬ 使用No削除
		DelActor( &ActWork[actnum] );
		actnum = TaskTable[id].work[2];
		AffineWorkNumDel(ActWork[actnum].oamData.AffineParamNo);	// ｱﾌｨﾝﾏﾈｰｼﾞｬ 使用No削除
		DelActor( &ActWork[actnum] );

		TaskTable[id].TaskAdrs = OpPokeSelEvSeq2RetTask;
		break;
	}
}

/*==================================================================*/
//		ボール選択キャンセル(時間差によるポケモン表示ウインドウ消去)
/*==================================================================*/
static	void	OpPokeSelEvSeq2RetTask(u8 id)
{
	TaskTable[id].TaskAdrs = OpPokeSelEvSeq1InitTask;
}

/********************************************************************/
/*                                                                  */
/*				情報ウインドウ										*/
/*                                                                  */
#if 0
#define COL_NUKE   0x00
#define COL_BLACK  0x01
#define COL_RED    0x02
#define COL_GREEN  0x03
#define COL_BLUE   0x04
#define COL_YELLOW 0x05
#define COL_LBLUE  0x06
#define COL_PURPLE 0x07
#define COL_DGRAY  0x08
#define COL_LGRAY  0x09
#define COL_WHITE  0x0f
#endif
#define BALL_INFOMSG_HEADER_SIZE	(5)
/********************************************************************/
static	void	BallInfoMsgHeaderSet(u8 *str,u8 colb,u8 colf,u8 cols)
{
	*str = CTRL_;
	str++;
	*str = C_ACOL_;
	str++;
	*str = colf;
	str++;
	*str = colb;
	str++;
	*str = cols;
}

static	void	BallInfoWindowSet(u8 clr_p,u8 w_p)
{
	u8	i,j,wx1,wx2,wy1,wy2;
	u8*	type_p;
	u8	typeinfo[BALL_INFOMSG_HEADER_SIZE + ZUKAN_TYPE_SIZE + 4 + EOM_SIZE];
	u8	namestr[BALL_INFOMSG_HEADER_SIZE + MONS_NAME_SIZE + EOM_SIZE];
	u16	poke_num;

	if(clr_p != 0xff){
		NMenuBoxClear(	BallInfoPosTable[clr_p][0],BallInfoPosTable[clr_p][1],
						BallInfoPosTable[clr_p][0]+(9-1),BallInfoPosTable[clr_p][1]+(4-1));
		*(vu16 *)REG_WIN0H	= 0;
		*(vu16 *)REG_WIN0V	= 0;
	}

	poke_num = FirstPokemonNumGet(w_p);

	type_p = ZukanPokeTypeGet(PokeMonsNo2ZukanNoGet(poke_num));
	BallInfoMsgHeaderSet(typeinfo,COL_NUKE,COL_WHITE,COL_DGRAY);
	i = 0;
	j = BALL_INFOMSG_HEADER_SIZE;
	while((type_p[i]!=spc_)&&(i<ZUKAN_TYPE_SIZE)){
		typeinfo[j] = type_p[i];
		i++;
		j++;
	}
	for(i=0;i<5;i++,j++){
		typeinfo[j] = PokemonStr[i];
	}
	typeinfo[j] = EOM_;

	BallInfoMsgHeaderSet(namestr,COL_NUKE,COL_WHITE,COL_DGRAY);
	i = 0;
	j = BALL_INFOMSG_HEADER_SIZE;
	while((PokeNameData[poke_num][i]!=EOM_)&&(i<MONS_NAME_SIZE)){
		namestr[j] = PokeNameData[poke_num][i];
		i++;
		j++;
	}
	namestr[j] = EOM_;

	NMenuMsgWrite(typeinfo,BallInfoPosTable[w_p][0],BallInfoPosTable[w_p][1]);
	NMenuMsgWrite(namestr,BallInfoPosTable[w_p][0]+(9-i),BallInfoPosTable[w_p][1]+2);

	wx1 = (BallInfoPosTable[w_p][0] * 8)-4;
	wx2 = ((BallInfoPosTable[w_p][0]+9) * 8)+4;
	wy1 = (BallInfoPosTable[w_p][1] * 8);
	wy2 = ((BallInfoPosTable[w_p][1]+4) * 8);

	*(vu16 *)REG_WIN0H	= wx1 * 0x100 + wx2;
	*(vu16 *)REG_WIN0V	= wy1 * 0x100 + wy2;
}


/********************************************************************/
/*                                                                  */
/*				OBJｾｯﾄ&動作関連										*/
/*                                                                  */
/********************************************************************/
/*==================================================================*/
/*				ﾎﾟｹﾓﾝ												*/
/*==================================================================*/
static void PokeWait(actWork* aw)
{
}

static u8	PokePut(u16 poke_num,u8 x,u8 y)
{
	u8	actnum;

	DecordPokeCellMake( &PM2FObjDataCell[poke_num],
						pm2fpara[poke_num].size,
						pm2fpara[poke_num].patcnt,
						(void *)DecordAdrs[0],
						(void *)DecordAdrs[1],
						poke_num);
	DecordPalSet( (PalData*)&PM2NObjDataPal[poke_num] );
	PokeActHeaderMake( poke_num, 1 );
	actnum = AddActor( &PokeActHeader,x,y,0);
	ActWork[actnum].move = PokeWait;
	ActWork[actnum].oamData.Priority = 0;

	return	actnum;
}

/*==================================================================*/
/*				ｶｰｿﾙ & ﾘｽﾄﾒｰﾀｰ										*/
/*==================================================================*/
/*------------------------------------------------------------------*/
/*                      OAM基本ﾃﾞｰﾀ                                 */
/*------------------------------------------------------------------*/
static const ActOamData CursorOam = {

160,	//Vﾎﾟｼﾞｼｮﾝ
0,  	//拡大縮小ﾓｰﾄﾞ設定(ON)
0,      //OBJﾓｰﾄﾞ設定(半透明)
0,	//ﾓｻﾞｲｸ設定(OFF)
0,	//ｶﾗｰﾓｰﾄﾞ設定(16色)
0,	//OBJ形状設定(正方形)

0,	//Hﾎﾟｼﾞｼｮﾝ
0,	//拡大縮小ﾊﾟﾗﾒｰﾀﾅﾝﾊﾞｰ設定
2,	//OBJサイズ設定(32dot)

0x0,	//ｷｬﾗｸﾀｰﾅﾝﾊﾞｰ
1,	//表示ﾌﾟﾗｲｵﾘﾃｨｰ設定(第2優先)
0,	//ﾊﾟﾚｯﾄﾅﾝﾊﾞｰ

0,	//拡大縮小ﾊﾟﾗﾒｰﾀ
};

static const ActOamData MonsterBallOam = {

160,	//Vﾎﾟｼﾞｼｮﾝ
0,  	//拡大縮小ﾓｰﾄﾞ設定(ON)
0,      //OBJﾓｰﾄﾞ設定(半透明)
0,	//ﾓｻﾞｲｸ設定(OFF)
0,	//ｶﾗｰﾓｰﾄﾞ設定(16色)
0,	//OBJ形状設定(正方形)

0,	//Hﾎﾟｼﾞｼｮﾝ
0,	//拡大縮小ﾊﾟﾗﾒｰﾀﾅﾝﾊﾞｰ設定
2,	//OBJサイズ設定(32dot)

0x0,	//ｷｬﾗｸﾀｰﾅﾝﾊﾞｰ
1,	//表示ﾌﾟﾗｲｵﾘﾃｨｰ設定(第2優先)
0,	//ﾊﾟﾚｯﾄﾅﾝﾊﾞｰ

0,	//拡大縮小ﾊﾟﾗﾒｰﾀ
};

static const ActOamData BallWindowOam = {

160,	//Vﾎﾟｼﾞｼｮﾝ
3,  	//拡大縮小ﾓｰﾄﾞ設定(ON)
0,      //OBJﾓｰﾄﾞ設定(半透明)
0,	//ﾓｻﾞｲｸ設定(OFF)
0,	//ｶﾗｰﾓｰﾄﾞ設定(16色)
0,	//OBJ形状設定(正方形)

0,	//Hﾎﾟｼﾞｼｮﾝ
0,	//拡大縮小ﾊﾟﾗﾒｰﾀﾅﾝﾊﾞｰ設定
3,	//OBJサイズ設定(32dot)

0x0,	//ｷｬﾗｸﾀｰﾅﾝﾊﾞｰ
1,	//表示ﾌﾟﾗｲｵﾘﾃｨｰ設定(第2優先)
0,	//ﾊﾟﾚｯﾄﾅﾝﾊﾞｰ

0,	//拡大縮小ﾊﾟﾗﾒｰﾀ
};


/*------------------------------------------------------------------*/
/*                      MOVEﾃﾞｰﾀ                                    */
/*------------------------------------------------------------------*/
static const u8 CursorPosTable[3][2] = {{60,32},{120,56},{180,32}};
static void CursorActMove(actWork* aw)
{
	aw->x = CursorPosTable[TaskTable[aw->work[0]].work[0]][0];
	aw->y = CursorPosTable[TaskTable[aw->work[0]].work[0]][1];

	aw->dy = SinMove(aw->work[1],8);
	aw->work[1] = (u8)aw->work[1]+4;
}

static void MonsterBallActMove(actWork* aw)
{
	if(TaskTable[aw->work[0]].work[0] == aw->work[1]){
		ActAnmChkChg(aw,1);		//動く
	}else{
		ActAnmChkChg(aw,0);		//止まる
	}
}

static void BallWindowActMove(actWork* aw)
{
	if(aw->x > 120)	aw->x-=4;
	if(aw->x < 120)	aw->x+=4;
	if(aw->y > 64)	aw->y-=2;
	if(aw->y < 64)	aw->y+=2;
}


/*------------------------------------------------------------------*/
/*                      ANMﾃﾞｰﾀ                                     */
/*------------------------------------------------------------------*/
static const actAnm CursorAnm0[] = {
	{48,30,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm MonsterBallAnm0[] = {
	{ 0,30,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm MonsterBallAnm1[] = {
	{16,4,0,0},
	{ 0,4,0,0},
	{32,4,0,0},
	{ 0,4,0,0},
	{16,4,0,0},
	{ 0,4,0,0},
	{32,4,0,0},
	{ 0,4,0,0},
	{ 0,32,0,0},
	{16,8,0,0},
	{ 0,8,0,0},
	{32,8,0,0},
	{ 0,8,0,0},
	{16,8,0,0},
	{ 0,8,0,0},
	{32,8,0,0},
	{ 0,8,0,0},
	{ACT_ANMLOOP,0,0,0},
};

static const actAnm BallWindowAnm[] = {
	{0,8,0,0},
	{ACT_ANMEND,0,0,0},
};


/*------------------------------------------------------------------*/
/*                      ANMﾃｰﾌﾞﾙ                                    */
/*------------------------------------------------------------------*/
static const actAnm* const CursorAnmTbl[]={
	CursorAnm0,
};

static const actAnm* const MonsterBallAnmTbl[]={
	MonsterBallAnm0,
	MonsterBallAnm1,
};

static const actAnm* const BallWindowAnmTbl[]={
	BallWindowAnm,
};

/*------------------------------------------------------------------*/
/*                      AFFﾃﾞｰﾀ                                     */
/*------------------------------------------------------------------*/
static	const	actAffAnm	PokemonAffPat[] = {
	{0x010,0x010,0,ACT_AFSET},
	{0x10,0x10,0,0x10-1},
	{ACT_AFEND,0,0,0},
};

static	const	actAffAnm	BallWindowAffPat[] = {
	{0x014,0x014,0,ACT_AFSET},
	{0x14,0x14,0,0x10-1},
	{ACT_AFEND,0,0,0},
};

/*------------------------------------------------------------------*/
/*                      AFFﾃｰﾌﾞﾙ                                    */
/*------------------------------------------------------------------*/
static	const	actAffAnm*	const	PokemonAffTable[] = {
	PokemonAffPat,
};

static	const	actAffAnm*	const	BallWindowAffTable[] = {
	BallWindowAffPat,
};

/*------------------------------------------------------------------*/
/*                      ACTORﾍｯﾀﾞ                                   */
/*------------------------------------------------------------------*/
#define	CELLID_OBJ	(0x1000)
#define	PALID_OBJ	(0x1000)
#define	CELLID_OBJ2	(0x1001)
#define	PALID_OBJ2	(0x1001)

static	const	CellData	ObjCell1[]={{(void*)opseloch_LZ,0x800,CELLID_OBJ},{CELL_END,0,0}};
static	const	CellData	ObjCell2[]={{(void*)opselwch_LZ,0x800,CELLID_OBJ2},{CELL_END,0,0}};
static	const	PalData		ObjPal[] = {
	{ op_bobj_Palette	,PALID_OBJ },
	{ op_wobj_Palette	,PALID_OBJ2 },
	{ OBJPAL_END, 0 },
};

static const actHeader CursorActHeader ={
CELLID_OBJ,		//ｾﾙﾅﾝﾊﾞｰ(0xffffの場合はｷｬﾗ転送型)
PALID_OBJ,		//ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬ登録ﾅﾝﾊﾞ
&CursorOam,
CursorAnmTbl,
ACT_NTRANS,
DummyActAffTbl,
CursorActMove,
};

static const actHeader MonsterBallActHeader ={
CELLID_OBJ,		//ｾﾙﾅﾝﾊﾞｰ(0xffffの場合はｷｬﾗ転送型)
PALID_OBJ,		//ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬ登録ﾅﾝﾊﾞ
&MonsterBallOam,
MonsterBallAnmTbl,
ACT_NTRANS,
DummyActAffTbl,
MonsterBallActMove,
};

static const actHeader BallWindowActHeader ={
CELLID_OBJ2,		//ｾﾙﾅﾝﾊﾞｰ(0xffffの場合はｷｬﾗ転送型)
PALID_OBJ2,		//ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬ登録ﾅﾝﾊﾞ
&BallWindowOam,
BallWindowAnmTbl,
ACT_NTRANS,
BallWindowAffTable,
BallWindowActMove,
};


