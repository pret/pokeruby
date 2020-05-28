//========================================================================================
//								 ポロックを食べるデモ
//								2002/07/29 by nakahiro
//========================================================================================
#include "common.h"
#include "intr.h"
#include "actor.h"
#include "actanm.h"
#include "palanm.h"
#include "objdata.h"
#include "menu.h"
#include "task.h"
#include "poketool.h"
#include "screen.h"
#include "itemtool.h"
#include "cubecase.h"
#include "mus_tool.h"
#include "fld_sio.h"
#include "decord.h"
#include "bss.h"
#include "MaDefine.h"
#include "message.h"
#include "calctool.h"
#include "pokelist.h"
#include "cubedemo.h"

#include "hyougen.h"


//========================================================================================
//										シンボル
//========================================================================================
#define	POKE_ACT_X		48		// ポケモンOBJの座標
#define	POKE_ACT_Y		80

#define	CASE_ACT_X		188		// ケースOBJの座標
#define	CASE_ACT_Y		100

#define	POLOCK_ACT_X	174		// ポロックOBJの座標
#define	POLOCK_ACT_Y	84

#define	POLOCK_ID		14818

#if		0		// 中村君オリジナル
#define	CASE_MOVE_CNT		16
#define	POLOCK_ADD_CNT		( CASE_MOVE_CNT + 14 )
#define	POKE_MOVE_CNT		( POLOCK_ADD_CNT + 12 )
#define	OBJ_MOVE_END_CNT	( POKE_MOVE_CNT + 16 )
#else			// 間借りした結果・・・
#define	CASE_MOVE_CNT		255
#define	POLOCK_ADD_CNT		( CASE_MOVE_CNT + 14 )
#define	POKE_MOVE_CNT		( POLOCK_ADD_CNT + 12 )
#define	OBJ_MOVE_END_CNT	( POKE_MOVE_CNT + 16 )
#endif


// ユーザーワーク
#define	GRAPHIC_CNT		UserWork[0x20000-1]
#define	POKE_ACT_NO		UserWork[0x20000-2]
#define	CASE_ACT_NO		UserWork[0x20000-3]
#define	POLOCK_ACT_NO	UserWork[0x20000-4]


//========================================================================================
//									プロトタイプ宣言
//========================================================================================
static void PolockEatRegSet(void);						// レジスタセット
static u8	PolockEatGraphicSet( PokemonParam * pp );	// グラフィック展開
static void PolockPalSet( u8 no );						// ポロックのパレットをセット

static void PolockEatDemoTaskSet( u8 flg );		// メインタスクセット
static void PolockEatMsgSet( u8 id );			// 送りメッセージセット
static void PolockEatDemoEndInit( u8 id );		// 終了処理
static void PolockEatDemoEnd( u8 id );

// ポケモンOBJ
static u8	PokeActSet( PokemonParam * pp );
static void PokeActMoveSet( u8 act );
static void PokeActMove( actWork * act );

// ポロックケース
static u8	CaseActSet(void);
static void CaseActAnmSet( u8 act, u8 flg );

// ポロック
static u8	PolockActSet(void);
static void PolockActMove( actWork * act );



//========================================================================================
//									グローバル変数
//========================================================================================
extern const u32 DecordAdrs[];
extern u16	ReturnItemNo;

static const void * const PolockPalTbl[] = {
	(void *)polock1_pcl_ADRS,
	(void *)polock2_pcl_ADRS,
	(void *)polock3_pcl_ADRS,
	(void *)polock4_pcl_ADRS,
	(void *)polock5_pcl_ADRS,
	(void *)polock6_pcl_ADRS,
	(void *)polock7_pcl_ADRS,
	(void *)polock8_pcl_ADRS,
	(void *)polock9_pcl_ADRS,
	(void *)polock10_pcl_ADRS,
	(void *)polock11_pcl_ADRS,
	(void *)polock12_pcl_ADRS,
	(void *)polock13_pcl_ADRS,
	(void *)polock14_pcl_ADRS,
};


// ポケモン反転パラメータ
static const actAffAnm PmAffFlip[] =
{
	{ -0x100, 0x100, 0, ACT_AFSET },
	{ ACT_AFEND, 0, 0, 0 },
};

static const actAffAnm * const PmAffTbl[] = {
	PmAffFlip,
};



// ケース回転アニメ
static const actAffAnm CaseAffAnm00[] =
{
	{ -0x100, 0x100, 0, ACT_AFSET },
	{ 0, 0, -8, 1 },
	{ 0, 0, -8, 1 },
	{ 0, 0, -8, 1 },
	{ 0, 0, -8, 1 },
	{ 0, 0, 0, 8 },
	{ 0, 0, 16, 1 },
	{ 0, 0, 16, 1 },
	{ 0, 0, 16, 1 },
	{ -0x100, 0x100, 0, ACT_AFSET },
	{ ACT_AFEND, 0, 0, 0 },
};

static const actAffAnm CaseAffAnm01[] =
{
	{ -0x100, 0x100, 0, ACT_AFSET },
	{ 0, 0, 8, 1 },
	{ 0, 0, 8, 1 },
	{ 0, 0, 8, 1 },
	{ 0, 0, 8, 1 },
	{ 0, 0, 0, 8 },
	{ 0, 0, -16, 1 },
	{ 0, 0, -16, 1 },
	{ 0, 0, -16, 1 },
	{ -0x100, 0x100, 0, ACT_AFSET },
	{ ACT_AFEND, 0, 0, 0 },
};

static const actAffAnm * const CaseAffTbl[] = {
	PmAffFlip,
};

static const actAffAnm * const CaseAffTbl2[] =
{
	CaseAffAnm00,
};

static const actAffAnm * const CaseAffTbl3[] =
{
	CaseAffAnm01,
};


// ポロックのアクターデータ
static const ActOamData Polock_OamData = {
	0,		//u32 VPos:8;			// Ｙ座標
	3,		//u32 AffineMode:2;		// アフィンモード
	0,		//u32 ObjMode:2;		// ＯＢＪモード
	OFF,	//u32 Mosaic:1;			// モザイク
	0,		//u32 ColorMode:1;		// １６色/２５６色 選択
	0,		//u32 Shape:2;			// ＯＢＪ形状

	0,		//u32 HPos:9;			// Ｘ座標
	0,		//u32 AffineParamNo:5;	// アフィン変換パラメータNo & H,VFlip
	0,		//u32 Size:2;			// ＯＢＪサイズ

	0,		//u32 CharNo:10;		// キャラクタＮｏ
	1,		//u32 Priority:2;		// 表示優先
	0,		//u32 Pltt:4;			// パレットＮｏ
	0,
};

static const actAnm Polock_Anm00[] =
{
	{ OBJ16_8x8 * 0, 0, 0, 0 },
	{ ACT_ANMEND, 0, 0, 0 }
};

static const actAnm * const Polock_AnmTbl[] = {
	Polock_Anm00,
};

static const actAffAnm PolockAffAnm00[] =
{
	{ 0x100, 0x100, 0, ACT_AFSET },
	{ -8, -8, 0, 1 },
	{ ACT_AFLOOP, 1, 0, 0 },
};

static const actAffAnm * const PolockAffTbl[] =
{
	PolockAffAnm00,
};

static const CellData Polock_Cell = {
	(void *)polock_d_pch_ADRS, OBJ_SIZE16_8x8 * 1, POLOCK_ID
};

static PalData Polock_Pal = { NULL, 0 };

static const actHeader Polock_Header = {
	POLOCK_ID,
	POLOCK_ID,
	&Polock_OamData,
	Polock_AnmTbl,
	0,
	PolockAffTbl,
	PolockActMove,
};


//------------------------------------------
//	メイン
//------------------------------------------
static void PolockDemo_Main(void)
{
	JumpActor();
	SetActor();
	MainTask();
	PaletteAnime();
}

//------------------------------------------
//	割り込み
//------------------------------------------
static void VInterFunc( void )
{
	actOAMtrans();						//ｱｸﾀｰ転送処理1
	actDMAtrans();						//ｱｸﾀｰ転送処理2
	PaletteFadeTrans();
}

//------------------------------------------
//	初期化処理
//------------------------------------------
static u8 PolockEatDemoSet(void)
{
	switch( sys.InitSeqWork ){
	case 0:
		InitHVBlankFunc();				// HVBlank初期化
		ItemToolAGBRegInit();			// レジスタ初期化
		PolockEatRegSet();				// レジスタセット
		sys.InitSeqWork++;
		break;

	case 1:
		PaletteAnimeInit();			// ﾊﾟﾚｯﾄｱﾆﾒ 初期化
		FadeData.trans_stop = 1;
		sys.InitSeqWork++;
		break;

	case 2:
		InitActor();				// ｱｸﾀｰ初期化
		sys.InitSeqWork++;
		break;

	case 3:
		ObjPalManInit();
		sys.InitSeqWork++;
		break;

	case 4:
		PrintScreenInit( CUBECASE_TYPE2 );	// ﾒｯｾｰｼﾞ表示領域初期化
		sys.InitSeqWork++;
		break;

	case 5:
		NMenuScreenInitStart( CUBECASE_TYPE2 );
		sys.InitSeqWork++;
		break;

	case 6:
		if ( NMenuScreenInitMain() == FALSE ) break;
		GRAPHIC_CNT = 0;
		sys.InitSeqWork++;
		break;

	case 7:
		if( PolockEatGraphicSet( &PokeParaMine[CubeDemoPokeNo] ) == FALSE )
			break;
		sys.InitSeqWork++;
		break;

	case 8:
		CASE_ACT_NO = CaseActSet();
		sys.InitSeqWork++;
		break;

	case 9:
		POKE_ACT_NO = PokeActSet( &PokeParaMine[CubeDemoPokeNo] );
		sys.InitSeqWork++;
		break;

	case 10:
		NMenuWinBoxWrite( 0, 14, 29, 19 );
		sys.InitSeqWork++;
		break;

	case 11:
		REG_IE_SET( V_BLANK_INTR_FLAG );
	    *(vu16 *)REG_STAT |= STAT_V_BLANK_IF_ENABLE;
		SetVBlankFunc( VInterFunc );
		sys.InitSeqWork++;
		break;

	case 12:
		if( FieldRecvFifoClearWait() == TRUE )	break;
		sys.InitSeqWork++;
		break;

	case 13:
		PaletteFadeReq( 0xffffffff, 0, 16, 0, 0 );
		FadeData.trans_stop = 0;
		MainProcChange( PolockDemo_Main );
		return	TRUE;
	}

	return	FALSE;
}

void PolockEatDemoInit(void)
{
	while(1){
		if( PolockEatDemoSet() == TRUE ){
			PolockEatDemoTaskSet(1);
//			AddTask( DebugKeyWait, 0 );	// デバッグ用キー入力処理
			break;
		}
		if( ItemToolSioCheck() == TRUE )	break;
	}
}


//------------------------------------------
//	レジスタセット
//------------------------------------------
static void PolockEatRegSet(void)
{
	*(vu16 *)REG_BG1CNT = BG_COLOR_16					// 16色選択
						| BG_SCREEN_SIZE_0				// スクリーンサイズ
						| BG_PRIORITY_2					// BG優先順位
						| 29 << BG_SCREEN_BASE_SHIFT	// スクリーンベースブロック
						| 2 << BG_CHAR_BASE_SHIFT ;		// キャラクタベースブロック

	*(vu16 *)REG_DISPCNT = DISP_MODE_0			// BGモード 
						 | DISP_OBJ_CHAR_1D_MAP	// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
//						 | DISP_BG2_ON			// BG2有効
						 | DISP_BG1_ON			// BG1有効
						 | DISP_BG0_ON			// BG0有効
						 | DISP_OBJ_ON;
}

//------------------------------------------
//	グラフィック展開
//------------------------------------------
static u8 PolockEatGraphicSet( PokemonParam * pp )
{
	PalData * pal;
	u16 monsno;
	u32	rnd;
	u32	id;

	switch( GRAPHIC_CNT ){
	case 0:
		monsno = PokeParaGet( pp, ID_monsno_egg );
		rnd    = PokeParaGet( pp, ID_personal_rnd );
		DecordPokeCellMakeBuchi(
				&PM2FObjDataCell[monsno], pm2fpara[monsno].size, pm2fpara[monsno].patcnt,
				(void*)0x2000000, (void*)DecordAdrs[BSS_CLIENT_ENEMY], monsno, rnd );
		GRAPHIC_CNT++;
		break;

	case 1:
		monsno = PokeParaGet( pp, ID_monsno_egg );
		rnd    = PokeParaGet( pp, ID_personal_rnd );
		id     = PokeParaGet( pp, ID_id_no );
		pal    = (PalData *)PokePalDataGetPara( monsno, id, rnd );
		DecordPalSet( pal );
		PokeActHeaderMake( pal->reg_num, 1 );
		GRAPHIC_CNT++;
		break;

	case 2:
		DecordCellSet( (CellData *)&CubeCase_Cell );
		GRAPHIC_CNT++;
		break;

	case 3:
		DecordPalSet( (PalData *)&CubeCase_Pal );
		GRAPHIC_CNT++;
		break;

	case 4:
		DecordCellSet( (CellData *)&Polock_Cell );
		GRAPHIC_CNT++;
		break;

	case 5:
		PolockPalSet( (u8)ReturnItemNo );
		DecordPalSet( (PalData *)&Polock_Pal );
		GRAPHIC_CNT++;
		break;

	case 6:
		DecordVram( (void*)ground0_pch_ADRS, (void*)CHAR_BASE2_ADDR );
		GRAPHIC_CNT++;
		break;

	case 7:
		DecordVram( (void*)groundbg_psc_ADRS, (void*)SCREEN_BASE29_ADDR );
		GRAPHIC_CNT++;
		break;

	case 8:
		DecordPaletteWork( (void*)ground0_pcl_ADRS, PA_BG2+PA_COL0, 0x60 );
		GRAPHIC_CNT = 0;
		return	TRUE;
	}

	return	FALSE;
}

//------------------------------------------
//	ポロックのパレットをセット
//------------------------------------------
static void PolockPalSet( u8 no )
{
	u8	type;

	type = (u8)GetCubeParam( &Fld.MyCube[no], PM_CUBE_TYPE );

	Polock_Pal.pal_data = PolockPalTbl[type-1];
	Polock_Pal.reg_num  = POLOCK_ID;
}


//------------------------------------------
//	メインタスク
//------------------------------------------
static void PolockEatDemoTask( u8 id )
{
	if( FadeData.fade_sw )	return;

	switch( TaskTable[id].work[0] ){
	case	0 :							// 性格表現初期動作のためのステップ
		SeqHyoGen = 0 ;
		pat_c = 0 ;						// 表現動作のカウンタ
		CalcPcount() ;
		break ;
	case CASE_MOVE_CNT:
		CaseActAnmSet( CASE_ACT_NO, (u8)TaskTable[id].work[1] );
		break;
	case POLOCK_ADD_CNT:
		POLOCK_ACT_NO = PolockActSet();
		break;
	case POKE_MOVE_CNT:
		PokeActMoveSet( POKE_ACT_NO );
		break;
	case OBJ_MOVE_END_CNT:
		TaskTable[id].TaskAdrs = PolockEatMsgSet;
		return;
	}

	// 性格表現動作とポロックデモとのタグ合わせ
	if(pat_c < Ka_Pcount) {
		HyoGenMain() ;
	} else if(pat_c == Ka_Pcount) {
		TaskTable[id].work[0] = CASE_MOVE_CNT - 1 ;
	}
	pat_c++ ;
	TaskTable[id].work[0]++;
}

//------------------------------------------
//	メインタスクセット
//------------------------------------------
static void PolockEatDemoTaskSet( u8 flg )
{
	u8	id;

	id = AddTask( PolockEatDemoTask, 0 );

	TaskTable[id].work[0] = 0;
	TaskTable[id].work[1] = flg;
}


//---------------------------------------
//	送りメッセージ
//---------------------------------------
//終了処理
static void EndTalkMsg( u8 id )
{
	if( NMenuTalkMsgPut() == 1 )
		TaskTable[id].TaskAdrs = PolockEatDemoEndInit;
}
//セット
static void PolockEatMsgSet( u8 id )
{
	PokemonParam * pp;
	CUBE * cube;

	pp   = &PokeParaMine[CubeDemoPokeNo];
	cube = &Fld.MyCube[ ReturnItemNo ];

	CubeDemoLike = CheckCubeLike( PokeSeikakuGet( pp ), cube );

	PokeNickNameSet( pp, StrTempBuffer0 );
	SetCubeName( cube, StrTempBuffer1 );

	if( CubeDemoLike == 0 )		// 普通
		PM_MsgExpand( MsgExpandBuffer, msg_polock_eat_demo00 );
	else if( CubeDemoLike > 0 )	// 好き
		PM_MsgExpand( MsgExpandBuffer, msg_polock_eat_demo01 );
	else						// 嫌い
		PM_MsgExpand( MsgExpandBuffer, msg_polock_eat_demo02 );

	NMenuTalkMsgSet( MsgExpandBuffer, 1, 15 );
	TaskTable[id].TaskAdrs = EndTalkMsg;

}


//------------------------------------------
//	終了処理
//------------------------------------------
static void PolockEatDemoEnd( u8 id )
{
	if( FadeData.fade_sw )	return;

	m4aMPlayVolumeControl( &m4a_mplay000, 0xffff, 256 );
	MainProcChange( sys.pReturnProc );
	DelTask(id);
}

static void PolockEatDemoEndInit( u8 id )
{
	PaletteFadeReq( 0xffffffff, 0, 0, 16, 0 );
	TaskTable[id].TaskAdrs = PolockEatDemoEnd;
}


//========================================================================================
//										アクター処理
//========================================================================================
//------------------------------------------
//	ポケモン
//------------------------------------------
extern	u8	PokeSeikakuGet(PokemonParam *PP) ;


static u8 PokeActSet( PokemonParam * pp )
{
	u8	act;
	u16	monsno;

	monsno = PokeParaGet( pp, ID_monsno_egg );
	act = AddActor( &PokeActHeader, POKE_ACT_X, POKE_ACT_Y, 2 );

	// 表現動作のための必要なデータ取得
	Ka_PMn = monsno ;
	Ka_act = act ;
	Ka_Seikaku = PokeSeikakuGet(pp) ;

	ActWork[ act ].work[2] = monsno;
	ActWork[ act ].move = DummyActMove;

	Ka_FF = 1 ;
	if( PokeReverseCheck( monsno ) == 0 ) {
		ActWork[ act ].aff_tbl = PmAffTbl;


		ActWork[ act ].oamData.AffineMode = 3;

		actCenterCalc(
			&ActWork[ act ], ActWork[ act ].oamData.Shape,
			ActWork[ act ].oamData.Size, ActWork[ act ].oamData.AffineMode );



		Ka_FF = 0 ;
	}

	return	act;
}

static void PokeActMoveSet( u8 act )
{
	ActWork[ act ].x = POKE_ACT_X;
	ActWork[ act ].y = POKE_ACT_Y;
	ActWork[ act ].work[0] = -8;
	ActWork[ act ].work[1] = 1;
	ActWork[ act ].move = PokeActMove;
}

static void PokeActMove( actWork * act )
{
	act->x += 4;
	act->y += act->work[0];
	act->work[0] += act->work[1];

	if( act->work[0] == 0 )	VoicePlay( act->work[2], 0 );	//ﾎﾟｹﾓﾝの鳴き声

	if( act->work[0] == 9 )	act->move = DummyActMove;
}


//------------------------------------------
//	ポロックケース
//------------------------------------------
static u8 CaseActSet(void)
{
	u8	act;

	act = CubeCaseActSet( CASE_ACT_X, CASE_ACT_Y, 2 );

	ActWork[ act ].oamData.AffineMode = 1;
	ActWork[ act ].aff_tbl = CaseAffTbl;
	ActWork[ act ].move = DummyActMove;
	AffineNumSet( &ActWork[ act ] );

	return	act;
}

static void CaseActAnmSet( u8 act, u8 flg )
{
	AffineWorkNumDel( ActWork[ act ].oamData.AffineParamNo );
	ActWork[ act ].oamData.AffineMode = 3;
	if( flg == 0 )	ActWork[ act ].aff_tbl = CaseAffTbl2;
	else			ActWork[ act ].aff_tbl = CaseAffTbl3;
	AffineNumSet( &ActWork[ act ] );
}


//------------------------------------------
//	ポロック
//------------------------------------------
static u8 PolockActSet(void)
{
	u8	act;

	act = AddActor( &Polock_Header, POLOCK_ACT_X, POLOCK_ACT_Y, 1 );

	ActWork[ act ].work[0] = -12;
	ActWork[ act ].work[1] = 1;

	return	act;
}

static void PolockActMove( actWork * act )
{
	act->x -= 4;
	act->y += act->work[0];
	act->work[0] += act->work[1];

	if( act->work[0] == 10 )	DelActor(act);
}











//========================================================================================
// 間借りします・・・・
// 2002.07.31
// By Aspirin.
//========================================================================================

/********************************************************************/
/* Function Name : hyougen.c										*/
/* Outline       : ポケモン仕草表現									*/
/* Author        : Original (Nori)									*/
/*               : Custom Ver.1 (Tomo)								*/
/*               : Custom Ver.2 (Nori)								*/
/* Custumed      : 2002/07/15                                       */
/* Custumed      : 2002/07/31                                       */
/********************************************************************/


// 表現動作のトータル処理数を求める
static	void	CalcPcount(void)
{
	u8	cmnd ;
	u8	i ;


	Ka_Pcount = 1 ;
	i = HGindex[Ka_Seikaku][0] ;			// For debug pattern data(valued)

	for(cmnd = 0 ; cmnd < 8 ; cmnd++, i++) {		// Max command lots = 8
		Ka_Pcount += HGtbl[i][P_LOOP_CNT] ;
		if(HGtbl[i][P_CONTINUE] == 1) {
			break ;
		}
	}
}


//====================================
// ポケモン仕草（動き）本体
//====================================
#define		SEQ_00		0
#define		SEQ_01		10
#define		SEQ_02		20
#define		SEQ_03		30
#define		SEQ_04		40
#define		SEQ_05		50
#define		SEQ_06		60
#define		SEQ_07		70
#define		SEQ_08		80
#define		SEQ_09		90


static	void	HyoGenMain(void)
{
	switch(SeqHyoGen) {
		case	SEQ_00 :
			HGtp = HGindex[Ka_Seikaku][0] ;
			HGActReg = &ActWork[Ka_act] ;		// アクターアドレス保管
			HGActTmp = *HGActReg ;				// アクターデータの保管
			SeqHyoGen = SEQ_01 ;
			break ;
		case	SEQ_01 :		// 初期化
			ArcMoveInit() ;
			if(HGindex[Ka_Seikaku][1] != 0) {
				HGActReg->oamData.AffineMode = 3 ;
				HGActReg->oamData.AffineParamNo = 0 ;
				HGActReg->aff_tbl = HGAnmTbl ;
				AffineNumSet(HGActReg) ;
			}
			SeqHyoGen = SEQ_05 ;
		case	SEQ_05 :		// 性格動作準備
			if(HGindex[Ka_Seikaku][1] != 0) {
				if(Ka_FF == 0) {
					ActAffAnmChg(HGActReg, HGindex[Ka_Seikaku][1] + 10) ;
				} else {
					ActAffAnmChg(HGActReg, HGindex[Ka_Seikaku][1]) ;
				}
			}
			SeqHyoGen = SEQ_06 ;
			break ;
		case	SEQ_06 :		// 動きメイン部分
			if(ArcMoveMain() == 1) {
				if(HGwork[P_CONTINUE] == 0) {		// continue ?
					HGtp++ ;						// next pattern
					ArcMoveInit() ;
					SeqHyoGen = SEQ_06 ;
				} else {
					AffineWorkNumDel(HGActReg->oamData.AffineParamNo) ;		// Pat clear
					SeqHyoGen = SEQ_07 ;
				}
			}
			break ;
		case	SEQ_07 :		// 終了処理
			ArcMoveEnd() ;
			HGtp = 0 ;
			SeqHyoGen = SEQ_00 ;
			break ;
		case	SEQ_02 :
		case	SEQ_03 :
		case	SEQ_04 :
		case	SEQ_08 :
		case	SEQ_09 :
		default :
//			HGActReg = NULL ;
			break ;
	}
}


// 動き系初期化
static	u8	ArcMoveInit(void)
{
	u8	i ;


	for(i = 0 ; i < HGTBL_PARAM_MAX ; i++) {		//計算用ワークへコピー
		HGwork[i] = HGtbl[HGtp][i] ;
	}

	if(HGwork[P_LOOP_CNT] == 0) {			//アニメが必要ないときはすぐに終了
		return(1) ;
	}

	HGwork[P_SIN_MOVE_INIT] = SinMove(HGwork[P_ANGLE_INIT],HGwork[P_SWING_X]) ;
	HGwork[P_COS_MOVE_INIT] = CosMove(HGwork[P_ANGLE_INIT],HGwork[P_SWING_Y]) ;
	HGwork[P_ALL_CNT] = HGwork[P_LOOP_CNT] ;

	HGwork[P_START_X] = HGActReg->dx ;			// 初期位置保存
	HGwork[P_START_Y] = HGActReg->dy ;			// 初期位置保存

	MoveTblGet() ;
	HGwork[P_LOOP_CNT] = HGwork[P_ALL_CNT] ;	// Cntが計算で壊れたので戻す

	PosOffset() ;
	HGwork[P_LOOP_CNT] = HGwork[P_ALL_CNT] ;	// Cntが計算で壊れたので戻す
	return(0) ;
}


// 動きメイン関数
static u8 ArcMoveMain(void)
{
	u16		cnt ;


	cnt = HGwork[P_ALL_CNT] - HGwork[P_LOOP_CNT] ;
	HGActReg->dx = MoveTbl_X[cnt] ;				// 2倍角補正
	HGActReg->dy = MoveTbl_Y[cnt] ;				// 2倍角補正
	HGwork[P_LOOP_CNT]-- ;

	if(HGwork[P_LOOP_CNT] == 0) {
		return(1) ;				// Finish
	}
	return(0) ;					// Continue
}


// 終了処理
static	u8		ArcMoveEnd(void)
{
	AffineDelActor(HGActReg);
	return(0) ;
}


// 終了位置への補正処理
static void PosOffset(void)
{
	u16		i,cnt, ofs_area_cnt ;
	s16		abs_x, abs_y, sa_x, sa_y ;


	// 補正カウントからSTART
	cnt = HGwork[P_BACK_START_CNT] ;

	// 補正するカウント(時間)取得
	ofs_area_cnt = HGwork[P_ALL_CNT] - HGwork[P_BACK_START_CNT] ;

	// End位置（絶対座標)dx, dy
	abs_x = HGwork[P_START_X] + HGwork[P_END_X] ;
	abs_y = HGwork[P_START_Y] + HGwork[P_END_Y] ;

	for(i = 0 ; i < (ofs_area_cnt - 1) ; i++) {
		sa_x = MoveTbl_X[cnt+i] - abs_x ;
		sa_y = MoveTbl_Y[cnt+i] - abs_y ;
		MoveTbl_X[cnt+i] -= (sa_x*(i+1)/ofs_area_cnt) ;
		MoveTbl_Y[cnt+i] -= (sa_y*(i+1)/ofs_area_cnt) ;
	}

	MoveTbl_X[cnt+ofs_area_cnt-1] = abs_x ;							//
	MoveTbl_Y[cnt+ofs_area_cnt-1] = abs_y ;							//
}


// 動きをテーブルに記録
static	void	MoveTblGet(void)
{
	s16		offsetX, offsetY ;
	u16		acce, acce_next ;
	u8		mainasu ;
	u16		cnt ;


	mainasu = 0 ;
	offsetX = HGwork[P_START_X] - HGwork[P_SIN_MOVE_INIT] ;
	offsetY = HGwork[P_START_Y] - HGwork[P_COS_MOVE_INIT] ;

	for(;;) {
		acce = abs(HGwork[P_ACCELERATION]) ;
		acce_next = HGwork[P_SWING_Y] ;
		acce_next += acce ;
		HGwork[P_SWING_Y] = acce_next ;

		if(HGwork[P_SWING_X] < 0) {
			mainasu = 1 ;
		}

		cnt = HGwork[P_ALL_CNT] - HGwork[P_LOOP_CNT] ;
	
		if(HGwork[P_LOOP_CNT]) {
			if(mainasu == 0) {
				MoveTbl_X[cnt] = SinMove(HGwork[P_ANGLE_INIT],
									HGwork[P_SWING_X] + (acce_next>>8)) + offsetX ;
				MoveTbl_Y[cnt] = CosMove(HGwork[P_ANGLE_INIT],
									HGwork[P_SWING_Y] + (acce_next>>8)) + offsetY ;
			} else {
				MoveTbl_X[cnt] = SinMove(HGwork[P_ANGLE_INIT],
									HGwork[P_SWING_X] - (acce_next>>8)) + offsetX ;
				MoveTbl_Y[cnt] = CosMove(HGwork[P_ANGLE_INIT],
									HGwork[P_SWING_Y] - (acce_next>>8)) + offsetY ;
			}
			HGwork[P_ANGLE_INIT] = 0xff & (HGwork[P_ANGLE_INIT] + HGwork[P_ANGLE_ADD]) ;
			HGwork[P_LOOP_CNT]-- ;
		} else {
			return ;
		}
	}
}













