//========================================================================================
//							木の実のタグ画面（bag.c から独立）
//								2002/07/11 by nakahiro
//========================================================================================
#include "common.h"
#include "intr.h"
#include "task.h"
#include "palanm.h"
#include "menu.h"
#include "item.h"
#include "bag.h"
#include "pocketno.h"
#include "evobj.h"
#include "seed.h"
#include "mus_tool.h"
#include "itemtool.h"
#include "fight.h"
#include "pokelist.h"
#include "decord.h"
#include "message.h"
#include "fld_sio.h"

#include "../data/itemsym.h"

//========================================================================================
//										シンボル
//========================================================================================
#define	GRAPHIC_CNT		UserWork[0x20000-1]

#define	TAG_SCR_SPEED	16
#define	TAG_SEED_X		56
#define	TAG_SEED_Y		64


//========================================================================================
//									プロトタイプ宣言
//========================================================================================
extern u8	SetTagSeedAct( u8, s16, s16 );
extern u8	SetTagMaruAct(s16);
extern void DelSeedObjPal(void);
extern void ReturnBagInit(void);

static void TagBGRegSet(void);
static u8	TagGraphicDataDecord(void);
static void SeedTagMain(u8);
static void DrawTagParam(void);
static void SetSeedAziMaruAct(u8);
static void NextTagScrSet(u8,s8);
static void NextTagScrMain(u8);
static void DrawNextTag(s8);
static void DrawNextTag2(void);


//========================================================================================
//									グローバル変数
//========================================================================================
extern BAG_STATUS	bag[5];		// バッグ用カウンタ
extern MINEITEM * PocketItem;	// 参照するアイテムデータ
extern u16	ReturnItemNo;		// アイテム番号格納場所

extern const CellData TagMaru_Cell;
extern const PalData TagMaru_Pal;

static const u8 * const str_seed_hard00[] = {
	str_seed_hard01,
	str_seed_hard02,
	str_seed_hard03,
	str_seed_hard04,
	str_seed_hard05,
};

static u8	tag_act = 0;
static s16	tag_maru[5] = {};


//--------------------------------------------------
//	タグ画面メイン処理
//--------------------------------------------------
static void TagMain(void)
{
	JumpActor();
	SetActor();
	MainTask();
	PaletteAnime();
}

//--------------------------------------------------
//	割り込み
//--------------------------------------------------
static void VInterFunc(void)
{
	*(vu16 *)REG_BG0VOFS = ScrY1;
	*(vu16 *)REG_BG1VOFS = ScrY1;

	actOAMtrans();						//ｱｸﾀｰ転送処理1
	actDMAtrans();						//ｱｸﾀｰ転送処理2
	PaletteFadeTrans();
}

//--------------------------------------------------
//	初期設定
//--------------------------------------------------
static u8 SeedTagInit2(void)
{
	switch( sys.InitSeqWork ){
	case 0:
		InitHVBlankFunc();			// HVBlank初期化
		ItemToolAGBRegInit();		// レジスタ初期化
		TagBGRegSet();				// BG設定
		*(vu16 *)REG_BLDCNT = 0;
		sys.InitSeqWork++;
		break;

	case 1:
		PaletteAnimeInit();			// ﾊﾟﾚｯﾄｱﾆﾒ 初期化
		FadeData.trans_stop = 1;
		sys.InitSeqWork++;
		break;

	case 2:
		InitActor();				// アクター初期化
		sys.InitSeqWork++;
		break;

	case 3:
		PrintScreenInit( TAG_TYPE );
		sys.InitSeqWork++;
		break;

	case 4:
		NMenuScreenInitStart( TAG_TYPE );
		sys.InitSeqWork++;
		break;

	case 5:
		if( NMenuScreenInitMain() == FALSE ) break;
		GRAPHIC_CNT = 0;
		sys.InitSeqWork++;
		break;

	case 6:
		if( TagGraphicDataDecord() == FALSE )	break;
		GRAPHIC_CNT = 0;
		sys.InitSeqWork++;
		break;

	case 7:
		DrawTagParam();
		sys.InitSeqWork++;
		break;

	case 8:
		tag_act = SetTagSeedAct( ReturnItemNo-SEED_START_NO-1, TAG_SEED_X, TAG_SEED_Y );
		sys.InitSeqWork++;
		break;

	case 9:
		SetSeedAziMaruAct( ReturnItemNo-SEED_START_NO-1 );
		sys.InitSeqWork++;
		break;

	case 10:
		REG_IE_SET( V_BLANK_INTR_FLAG );
	    *(vu16 *)REG_STAT |= STAT_V_BLANK_IF_ENABLE;

		SetVBlankFunc( VInterFunc );		// 割込み関数設定(VBLANK)

		*(vu16 *)REG_DISPCNT = DISP_MODE_0			// BGモード 
							 | DISP_OBJ_CHAR_1D_MAP	// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
							 | DISP_BG3_ON			// BG3有効
							 | DISP_BG2_ON			// BG2有効
							 | DISP_BG1_ON			// BG1有効
							 | DISP_BG0_ON			// BG0有効
							 | DISP_OBJ_ON;

		sys.InitSeqWork++;
		break;

	case 11:
		if( FieldRecvFifoClearWait() == TRUE )	break;
		sys.InitSeqWork++;
		break;

	case 12:
		PaletteFadeReq( 0xffffffff, 0, 16, 0, 0 );
		FadeData.trans_stop = 0;
		MainProcChange( TagMain );
		return	TRUE;
	}

	return	FALSE;
}

void SeedTagInit(void)
{
	while(1){
		if( SeedTagInit2() == TRUE ){
			AddTask( SeedTagMain, 0 );
			break;
		}
		if( ItemToolSioCheck() == TRUE )	break;
	}
}

//--------------------------------------------------
//	BG設定
//--------------------------------------------------
static void TagBGRegSet(void)
{
	// タグ
	*(vu16 *)REG_BG1CNT = BG_COLOR_16					// 16色選択
						| BG_SCREEN_SIZE_0				// スクリーンサイズ
						| BG_PRIORITY_2					// BG優先順位
						| 5 << BG_SCREEN_BASE_SHIFT		// スクリーンベースブロック
						| 0 << BG_CHAR_BASE_SHIFT ;		// キャラクタベースブロック
	// 「きのみのタグ」
	*(vu16 *)REG_BG2CNT = BG_COLOR_16					// 16色選択
						| BG_SCREEN_SIZE_0				// スクリーンサイズ
						| BG_PRIORITY_0					// BG優先順位
						| 6 << BG_SCREEN_BASE_SHIFT		// スクリーンベースブロック
						| 0 << BG_CHAR_BASE_SHIFT ;		// キャラクタベースブロック
	// 背景
	*(vu16 *)REG_BG3CNT = BG_COLOR_16					// 16色選択
						| BG_SCREEN_SIZE_0				// スクリーンサイズ
						| BG_PRIORITY_3					// BG優先順位
						| 7 << BG_SCREEN_BASE_SHIFT		// スクリーンベースブロック
						| 0 << BG_CHAR_BASE_SHIFT ;		// キャラクタベースブロック
	ScrY1 = 0;
}

//--------------------------------------------------
//	グラフィックデータ展開
//--------------------------------------------------
static u8 TagGraphicDataDecord(void)
{
	u16	i;

	switch( GRAPHIC_CNT ){
	case 0:
		DecordVram( (void*)seedtag_pch_ADRS, (void*)BG_VRAM );
		GRAPHIC_CNT++;
		break;
	case 1:
		DecordVram( (void*)s_tag_psc_ADRS, (void*)(BG_VRAM+0x2800) );
		GRAPHIC_CNT++;
		break;
	case 2:
		DecordVram( (void*)s_tag2_psc_ADRS, (void*)(BG_VRAM+0x3000) );
		GRAPHIC_CNT++;
		break;
	case 3:
		for( i=0; i<1024; i++ ){
			if( MyData.my_sex == 0 )	BG2_data[i] = 0x4042;
			else						BG2_data[i] = 0x5042;
		}
		DIV_DMACOPY( 3, BG2_data, BG_VRAM+0x3800, 0x800, 16 );
		GRAPHIC_CNT++;
		break;
	case 4:
		DecordPaletteWork( (void*)seedtag_pcl_ADRS, PA_BG0+PA_COL0, 0xc0 );
		GRAPHIC_CNT++;
		break;
	case 5:
		DecordCellSet( (CellData*)&TagMaru_Cell );
		GRAPHIC_CNT++;
		break;
	case 6:
		DecordPalSet( (PalData*)&TagMaru_Pal );
		GRAPHIC_CNT = 0;
		return	TRUE;
	}

	return	FALSE;
}


//--------------------------------------------------
//	終了処理
//--------------------------------------------------
static void TagExitTask( u8 id )
{
	if( FadeData.fade_sw )	return;

	MainProcChange( ReturnBagInit );
	DelSeedObjPal();
	EvObjPalManInit();
	DelTask(id);
}

static void TagExitInit( u8 id )
{
	SePlay( SE_SELECT );
	PaletteFadeReq( 0xffffffff, 0, 0, 16, 0 );
	TaskTable[id].TaskAdrs = TagExitTask;
}

//--------------------------------------------------
//	タグ画面キー処理
//--------------------------------------------------
static void SeedTagMain( u8 id )
{
	if( FadeData.fade_sw )	return;

	if( ( sys.Repeat & PLUS_KEY_MASK ) == U_KEY)
		NextTagScrSet( id, -1 );
	if( ( sys.Repeat & PLUS_KEY_MASK ) == D_KEY)
		NextTagScrSet( id, 1 );
/*
	if( ( sys.Repeat & PLUS_KEY_MASK ) == L_KEY)
		NextTagScrSet( id, -10 );
	if( ( sys.Repeat & PLUS_KEY_MASK ) == R_KEY)
		NextTagScrSet( id, 10 );
*/
	if( ( sys.Trg & A_BUTTON ) || ( sys.Trg & B_BUTTON ) )
		TagExitInit(id);
}

//--------------------------------------------------
//	タネのパラメータ表示
//--------------------------------------------------
static void DrawTagParam(void)
{
	const SEED_PARAM * p;
	p = GetSeedParam( ReturnItemNo - SEED_START_NO );

	PM_NumMsgSet( StrTempBuffer0, ReturnItemNo-SEED_START_NO, NUM_MODE_ZERO, 2 );
	NMenuMsgWrite( StrTempBuffer0, 12, 4 );
	NMenuMsgWrite( p->name, 15, 4 );

	NMenuMsgWrite( p->tag1, 4, 14 );
	NMenuMsgWrite( p->tag2, 4, 16 );

	// おおきさ
	NMenuMsgWrite( str_tag_size, 11, 7 );
	if( p->size != 0 ){
		PM_NumMsgSet( StrTempBuffer0, p->size/10, NUM_MODE_LEFT, 2 );
		PM_NumMsgSet( StrTempBuffer1, p->size%10, NUM_MODE_LEFT, 2 );
		NMenuMsgWrite( str_tag_dot, 16, 7 );
	}else	NMenuMsgWrite( str_hate3, 16, 7 );


	// かたさ
	NMenuMsgWrite( str_tag_hard, 11, 9 );
	if( p->hardness != 0 )	NMenuMsgWrite( str_seed_hard00[ p->hardness-1 ], 16, 9 );
	else					NMenuMsgWrite( str_hate3, 16, 9 );
}

//--------------------------------------------------
//	味の円表示
//--------------------------------------------------
static void SetSeedAziMaruAct( u8 no )
{
	u16	i;
	const SEED_PARAM * p;
	p = GetSeedParam( no + 1 );

	for( i=0; i<5; i++ )
		tag_maru[i] = -1;
/*
	if( p->karai  != 0 )	tag_maru[0] = SetTagMaruAct( 97 );
	if( p->sibui  != 0 )	tag_maru[1] = SetTagMaruAct( 121 );
	if( p->amai   != 0 )	tag_maru[2] = SetTagMaruAct( 146 );
	if( p->nigai  != 0 )	tag_maru[3] = SetTagMaruAct( 170 );
	if( p->suppai != 0 )	tag_maru[4] = SetTagMaruAct( 194 );
*/

	if( p->karai  != 0 )	tag_maru[0] = SetTagMaruAct( 60 );
	if( p->sibui  != 0 )	tag_maru[1] = SetTagMaruAct( 92 );
	if( p->amai   != 0 )	tag_maru[2] = SetTagMaruAct( 124 );
	if( p->nigai  != 0 )	tag_maru[3] = SetTagMaruAct( 156 );
	if( p->suppai != 0 )	tag_maru[4] = SetTagMaruAct( 188 );

}

static void DelAziMaruAct(void)
{
	u16	i;

	for( i=0; i<5; i++ ){
		if( tag_maru[i] != -1 ){
			DelActor( &ActWork[ tag_maru[i] ] );
			tag_maru[i] = -1;
		}
	}
}

//--------------------------------------------------
//	次のタグへ切り替え
//--------------------------------------------------
static void NextTagScrSet( u8 id, s8 plus )
{
	u8	poke = SEED_POCKET - 1;
	s16 * wk = TaskTable[id].work;

	if( bag[poke].scr + bag[poke].pos == 0 && plus < 0 )	return;
	if( bag[poke].scr + bag[poke].pos + 1 == bag[poke].item_max && plus > 0 )
		return;

	SePlay( SE_SELECT );

	if( bag[poke].scr + bag[poke].pos + plus < 0 ){
		wk[1] = -( bag[poke].scr + bag[poke].pos );
	}else{
		if( bag[poke].scr + bag[poke].pos + plus >= bag[poke].item_max ){
			wk[1] = bag[poke].item_max - bag[poke].scr - bag[poke].pos-1;
		}else	wk[1] = plus;
	}

	TaskTable[id].TaskAdrs = NextTagScrMain;
	if( plus < 0 )	wk[0] = -TAG_SCR_SPEED;
	else			wk[0] = TAG_SCR_SPEED;
}

static void NextTagScrMain( u8 id )
{
	s16 * wk = TaskTable[id].work;

	ScrY1 = ( ScrY1 + wk[0] ) & 0xff;

	if( ( wk[0] > 0 && ScrY1 == 0x90 ) ||
		( wk[0] < 0 && ScrY1 == 0x70 ) )
	{
		DrawNextTag( (s8)TaskTable[id].work[1] );
		DrawNextTag2();
	}

	if( ScrY1 == 0 ){
		TaskTable[id].work[0] = 0;
		TaskTable[id].work[1] = 0;
		TaskTable[id].TaskAdrs = SeedTagMain;
	}
}

//--------------------------------------------------
//	次のタグを表示
//--------------------------------------------------
static void DrawNextTag( s8 plus )
{
	u8	poke = SEED_POCKET - 1;

	if( plus > 0 ){
		if( bag[poke].pos + plus > 7 ){
			bag[poke].scr += plus - ( 7 - bag[poke].pos );
			bag[poke].pos = 7;
		}else	bag[poke].pos += plus;
	}else{
		if( bag[poke].pos + plus < 0 ){
			bag[poke].scr += plus + bag[poke].pos;
			bag[poke].pos = 0;
		}else	bag[poke].pos += plus;
	}

	ReturnItemNo = PocketItem[ bag[poke].scr + bag[poke].pos ].item;
	DelActor( &ActWork[tag_act] );
	DelAziMaruAct();
	DelSeedObjPal();
}
static void DrawNextTag2(void)
{
	NMenuBoxClear( 0, 4, 29, 19 );
	DrawTagParam();
	tag_act = SetTagSeedAct( ReturnItemNo-SEED_START_NO-1, TAG_SEED_X, TAG_SEED_Y );
	SetSeedAziMaruAct( ReturnItemNo-SEED_START_NO-1 );
}
