//=========================================================================
//	
//	ポケモンずかんデータ画面
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
#include "fld_eff.h"
#include "calctool.h"
#include "z_naki.h"
#include "mus_tool.h"
#include "fight.h"
#include "b_return.h"
#include "config.h"
#include "message.h"
#include "ev_flag.h"

#define __ZUKAN_DATA_GLOBAL__
#include "zukan.h"

#include "zu_d.dat"

extern	void	affineWorkSet(u8 num,u16 H_X,u16 V_X,u16 H_Y,u16 V_Y);
extern	void	VoicePlay( u16 no, s8 pan );
extern	void	BunpuzuInit(u16 pokeno, pFunc ret_func, pFunc ret_func2);
extern	void	BunpuzuTaskInit(u16 pokeno, u8 *flg);

extern	const actAffAnm * const PmAffAnmTblF[];
extern const actAnm *const PokeActAnmTbl[];
extern	const actAnm *const *const TRFAnmTbl[];

static	void	ZukanDataInitTask(u8 id);
static	void	ZukanDataKeyTask(u8 id);
static	void	ZukanDataChangeTask(u8 id);
static	void	ZukanDataExitTask(u8 id);
static	void	ZukanDataBunpuInitTask(u8 id);
static	void	ZukanDataBunpuKeyTask(u8 id);
static	void	ZukanDataBunpuExitTask(u8 id);
static	void	ZukanDataVoiceInitTask(u8 id);
static	void	ZukanDataVoiceKeyTask(u8 id);
static	void	ZukanDataVoiceExitTask(u8 id);
static	void	ZukanDataOokisaInitTask(u8 id);
static	void	ZukanDataOokisaKeyTask(u8 id);
static	void	ZukanDataOokisaExitTask(u8 id);
static	void	ZukanMenuScrSet(u16 vp);
static	void	ZukanMenuCursorSet(u8 pos,u16 vp);
static	void	ZukanMenu2ScrSet(u16 vp);
static	void	ZukanMenu2CursorSet(u8 pos,u16 vp);

ZUKAN_LIST*	zmd = {0};
pFunc		Z_pVBlank_bak;

static	const	u16	monotone_Palette[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
#define	CHG_REQ	(0)	//切り替えフラグ
#define	ACT_F	(1)	//ポケモンアクター設定フラグ(1 = しない)
#define	FADE_F	(2)	//フェード設定フラグ(1 = メニュー[BG1]は、しない)
#define	VOICE_F	(3)	//なきごえ設定フラグ(1 = しない)
#define	ACT_STR	(4)	//ポケモンアクターSTRUCT

#define	MENU_PAL1	(2)
#define	MENU_PAL2	(4)

#define	MENU_PAL_MASK	((0x00000001 << MENU_PAL1) + (0x00000001 << MENU_PAL2))
/*==================================================================*/
/*                                                                  */
/*				ポケモンデータ画面操作								*/
/*                                                                  */
/*==================================================================*/
/*==================================================================*/
/*                                                                  */
/*				画面操作タスク設定									*/
/*                                                                  */
/*==================================================================*/
u8		ZukanDataTaskSet(ZUKAN_LIST* data,u8 actstr)
{
	u8	id;

	zmd = data;

	id = AddTask(ZukanDataInitTask, 0);

	TaskTable[id].work[CHG_REQ]	= 0;
	TaskTable[id].work[ACT_F]	= 1;
	TaskTable[id].work[FADE_F]	= 0;
	TaskTable[id].work[VOICE_F] = 0;
	TaskTable[id].work[ACT_STR]	= actstr;

	return id;
}

/*==================================================================*/
/*                                                                  */
/*				画面操作タスク切り替え								*/
/*                                                                  */
/*==================================================================*/
u8		ZukanDataTaskChangeCheck(u8 id)
{
	if((!TaskTable[id].work[CHG_REQ])&&(TaskTable[id].TaskAdrs == ZukanDataKeyTask)){
		return	0;
	}else{
		return	1;
	}
}

u8		ZukanDataTaskChange(ZUKAN_LIST* data,u8 id)
{
	zmd = data;

	TaskTable[id].work[CHG_REQ] = 1;
	TaskTable[id].work[ACT_F]	= 0;
	TaskTable[id].work[FADE_F]	= 0;
	TaskTable[id].work[VOICE_F] = 0;

	return id;
}

/*==================================================================*/
/*                                                                  */
/*				画面初期化											*/
/*                                                                  */
/*==================================================================*/
static	void	ZukanDataInitTask(u8 id)
{
	u32	fade;
	u16	data;

	switch(sys.InitSeqWork){
	default:
	case 0:
		//フェード待ち
		if(FadeData.fade_sw) break;

		zw->mode = Z_MODE1;
		Z_pVBlank_bak = sys.pVBlank;
		SetVBlankFunc(NULL);				//割込み関数動作中止

		data = 0;
		if(TaskTable[id].work[ACT_F])	data |= DISP_OBJ_ON;
		if(TaskTable[id].work[FADE_F])	data |= DISP_BG1_ON;
		ZukanScreenRegInit(data);	//表示レジスタ初期化

		sys.InitSeqWork = 1;
		break;
	case 1:
		//データ転送
		LZ77UnCompVram((void*)zkn_ch_LZ,(void*)(BG_VRAM + 0x0000));		//BG CGX転送
		LZ77UnCompVram((void*)zkn_scp_LZ,
					(void*)(BG_VRAM + (MODE1_BG3_SCRVRAM*0x800)));	//BG3 MAP転送(背景)
		ZukanPokeFootTrans(zmd->num,MODE1_BG2_CHRVRAM,MODE1_FOOTCGX_NO);
		sys.InitSeqWork++;
		break;
	case 2:
		ZukanMenuScrSet(MODE1_BG1_SCRVRAM);	//BG1 MAP転送(メニュー));
		ZukanMenuCursorSet(zw->menu_p,MODE1_BG1_SCRVRAM);
		ZukanPaletteSet();
		sys.InitSeqWork++;
		break;
	case 3:
		//表示ルーチン初期化１
		PrintScreenInit(ZUKANLIST_TYPE);
		NMenuScreenInit(ZUKANLIST_TYPE);
		sys.InitSeqWork++;
		break;
	case 4:
		//データ表示
		if(zw->list_mode == ZLIST_NEW){
			ZukanPokeNumPut(PokeZukanNo2HouenNoGet(zmd->num),13,3);	//ナンバー
		}else{
			ZukanPokeNumPut(zmd->num,13,3);			//ナンバー
		}
		ZukanPokeNamePut(zmd->num,17,3);		//名前
		NMenuMsgWrite(Z_Datainfo1str,13,5);		//タイプ（初期設定）
		NMenuMsgWrite(Z_Datainfo2str,16,7);		//たかさ（初期設定）
		NMenuMsgWrite(Z_Datainfo3str,16,9);		//おもさ（初期設定）

		//ポケモン取得時の画面情報変化
		if(zmd->get){
			ZukanDataTypeNamePut((u8*)zukanData[zmd->num].typename,13,5);
			ZukanDataNumPut(zukanData[zmd->num].takasa,16,7);
			ZukanDataNumPut(zukanData[zmd->num].omosa,16,9);
			NMenuMsgWrite(zukanData[zmd->num].text,3,13);
			ZukanPokeFootPut(MODE1_BG2_SCRVRAM,MODE1_FOOTCGX_NO);
		}else{
			NMenuMsgWrite(noget_text,3,13);
			//パレットエフェクト
			PaletteWorkSet(&PaletteWork[0x00+0x01],PA_BG3+PA_COL1,0x20-2);
		}
		sys.InitSeqWork++;
		break;
	case 5:
		//ポケモンＯＢＪ設定
		if(!TaskTable[id].work[ACT_F]){
			TaskTable[id].work[ACT_STR]	= 
				ZukanPokeActorSet(zmd->num,MODE1_POKE_POS_X,MODE1_POKE_POS_Y,0);
			ActWork[TaskTable[id].work[ACT_STR]].oamData.Priority = 0;
		}
		sys.InitSeqWork++;
		break;
	case 6:
		//ＯＢＪ関連表示＆フェード設定
		fade = 0;
		if(TaskTable[id].work[FADE_F]){
			fade |= MENU_PAL_MASK;
		}
		if(TaskTable[id].work[ACT_F]){
			fade |= (0x00000001 << (16+ActWork[TaskTable[id].work[ACT_STR]].oamData.Pltt));
		}
		PaletteFadeReq((0xffffffff^fade),0,16,0,0);
		SetVBlankFunc(Z_pVBlank_bak);				//割込み関数設定(VBLANK)
		sys.InitSeqWork++;
		break;
	case 7:
		//レジスタ設定
		*(vu16 *)REG_BLDCNT   = 0;	//半透明設定
		*(vu16 *)REG_BLDALPHA = 0;
		*(vu16 *)REG_BLDY	  = 0;
		*(vu16 *)REG_BG3CNT = BG_COLOR_16					//16色選択
							| BG_SCREEN_SIZE_0				// スクリーンサイズ
							| BG_PRIORITY_3					//BG優先順位
							| MODE1_BG3_SCRVRAM << BG_SCREEN_BASE_SHIFT	//スクリーンベースブロック
							| MODE1_BG3_CHRVRAM << BG_CHAR_BASE_SHIFT	//キャラクタベースブロック
							;
		*(vu16 *)REG_BG1CNT = BG_COLOR_16					//16色選択
							| BG_SCREEN_SIZE_0				// スクリーンサイズ
							| BG_PRIORITY_0					//BG優先順位
							| MODE1_BG1_SCRVRAM << BG_SCREEN_BASE_SHIFT	//スクリーンベースブロック
							| MODE1_BG1_CHRVRAM << BG_CHAR_BASE_SHIFT	//キャラクタベースブロック
							;
		*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
							  |	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
							  | DISP_BG3_ON					// BG3有効
							  | DISP_BG2_ON					// BG2有効
							  | DISP_BG1_ON					// BG2有効
							  | DISP_OBJ_ON;
		sys.InitSeqWork++;
		break;
	case 8:
		//フェード待ち＆鳴き声再生
		if(FadeData.fade_sw) break;

		sys.InitSeqWork++;
		if(!TaskTable[id].work[VOICE_F]){
			VoicePlayStop();
			VoicePlay2(PokeZukanNo2MonsNoGet(zmd->num),0,125,10);
			break;
		}
		sys.InitSeqWork++;
		break;
	case 9:
		if(VoiceEndCheck())		break;
		sys.InitSeqWork++;
		break;
	case 10:
		TaskTable[id].work[CHG_REQ] = 0;
		TaskTable[id].work[ACT_F]	= 0;
		TaskTable[id].work[FADE_F]	= 1;
		TaskTable[id].work[VOICE_F] = 1;

		TaskTable[id].TaskAdrs = ZukanDataKeyTask;
		sys.InitSeqWork = 0;
		break;
	}
}

/*==================================================================*/
static	void	ZukanDataKeyTask(u8 id)
{
	//データ移動リクエスト
	if(TaskTable[id].work[CHG_REQ]){
		PaletteFadeReq(0xffffffff,0,0,16,0);
		TaskTable[id].TaskAdrs = ZukanDataChangeTask;
		SePlay(SE_Z_SCROLL);
		return;
	}

	//Ｂボタン判定(リスト画面へ)
	if(sys.Trg & B_BUTTON){
		PaletteFadeReq(0xffffffff,0,0,16,0);
		TaskTable[id].TaskAdrs = ZukanDataExitTask;
		SePlay(SE_PC_OFF);
		return;
	}
	//Ａボタン判定(各種データ画面＆コマンド)
	if(sys.Trg & A_BUTTON){
		switch(zw->menu_p){
		case 0:
			//分布図
			PaletteFadeReq((0xffffffff^MENU_PAL_MASK),0,0,16,0);
			TaskTable[id].TaskAdrs = ZukanDataBunpuInitTask;
			SePlay(SE_PIN);
			break;
		case 1:
			//鳴き声
			PaletteFadeReq((0xffffffff^MENU_PAL_MASK),0,0,16,0);
			TaskTable[id].TaskAdrs = ZukanDataVoiceInitTask;
			SePlay(SE_PIN);
			break;
		case 2:
			//おおきさくらべ(ポケモン取得時のみ)
			if(!zmd->get){
				SePlay(SE_HAZURE);
			}else{
				PaletteFadeReq((0xffffffff^MENU_PAL_MASK),0,0,16,0);
				TaskTable[id].TaskAdrs = ZukanDataOokisaInitTask;
				SePlay(SE_PIN);
			}
			break;
		case 3:
			//もどる
			PaletteFadeReq(0xffffffff,0,0,16,0);
			TaskTable[id].TaskAdrs = ZukanDataExitTask;
			SePlay(SE_PC_OFF);
			break;
		}
		return;
	}
	if(((sys.Trg & L_KEY)||((sys.Trg & L_BUTTON)&&(MyData.key_config == CNT_MD_LR)))
		&&(zw->menu_p > 0)){
		zw->menu_p--;
		ZukanMenuCursorSet(zw->menu_p,MODE1_BG1_SCRVRAM);
		SePlay(SE_Z_PAGE);
		return;
	}
	if(((sys.Trg & R_KEY)||((sys.Trg & R_BUTTON)&&(MyData.key_config == CNT_MD_LR)))
		&&(zw->menu_p < 3)){
		zw->menu_p++;
		ZukanMenuCursorSet(zw->menu_p,MODE1_BG1_SCRVRAM);
		SePlay(SE_Z_PAGE);
		return;
	}
}

/*==================================================================*/
static	void	ZukanDataChangeTask(u8 id)
{
	if(FadeData.fade_sw) return;

	TaskTable[id].TaskAdrs = ZukanDataInitTask;
}

/*==================================================================*/
static	void	ZukanDataExitTask(u8 id)
{
	if(FadeData.fade_sw) return;

	DelTask(id);
}










/*==================================================================*/
/*                                                                  */
/*				分布図画面操作										*/
/*                                                                  */
/*==================================================================*/
static	void	ZukanDataBunpuInitTask(u8 id)
{
	switch(sys.InitSeqWork){
	default:
	case 0:
		//フェード待ち
		if(FadeData.fade_sw) break;

		zw->mode = Z_MODE5;
		Z_pVBlank_bak = sys.pVBlank;
		SetVBlankFunc(NULL);			//割込み関数設定(VBLANK)
		ZukanScreenRegInit(DISP_BG1_ON);	//表示レジスタ初期化

		zw->menu_p = 0;
		sys.InitSeqWork = 1;
		break;
	case 1:
		ZukanMenu2ScrSet(MODE5_BG1_SCRVRAM);	//BG1 MAP転送(メニュー));
		ZukanMenu2CursorSet(0,MODE5_BG1_SCRVRAM);
		ZukanPaletteSet();
		*(vu16 *)REG_BG1CNT = BG_COLOR_16					//16色選択
						| BG_SCREEN_SIZE_0				// スクリーンサイズ
						| BG_PRIORITY_0					//BG優先順位
						| MODE5_BG1_SCRVRAM << BG_SCREEN_BASE_SHIFT	//スクリーンベースブロック
						| MODE5_BG1_CHRVRAM << BG_CHAR_BASE_SHIFT	//キャラクタベースブロック
						;
		sys.InitSeqWork++;
		break;
	case 2:
		//分布図画面へ
		BunpuzuTaskInit(PokeZukanNo2MonsNoGet(zmd->num),(u8*)(&(zw->DataModeRetFlag)));
		SetVBlankFunc(Z_pVBlank_bak);				//割込み関数設定(VBLANK)
		zw->DataModeRetFlag = 0;
		sys.InitSeqWork = 0;
		TaskTable[id].TaskAdrs = ZukanDataBunpuKeyTask;
		break;
	}
}

/*==================================================================*/
static	void	ZukanDataBunpuKeyTask(u8 id)
{
	if(!zw->DataModeRetFlag)	return;

	TaskTable[id].TaskAdrs = ZukanDataBunpuExitTask;
}

/*==================================================================*/
static	void	ZukanDataBunpuExitTask(u8 id)
{
	if(FadeData.fade_sw) return;
	//図鑑データ画面へ
	switch(zw->DataModeRetFlag){

	default:
	case 1:
		TaskTable[id].TaskAdrs = ZukanDataInitTask;
		break;
	case 2:
		TaskTable[id].TaskAdrs = ZukanDataVoiceInitTask;
		break;
	}
}










/*==================================================================*/
/*                                                                  */
/*				鳴き声画面操作										*/
/*                                                                  */
/*==================================================================*/
extern	u8		VoiceEndCheck2( void );
static	void	ButtonPaletteEffect(u8 mode);
static	void	ZukanDataVoiceInitTask(u8 id)
{
	u8	offs;
	HakeiSet	hs;
	MeterSet	ms;

	switch(sys.InitSeqWork){
	default:
	case 0:
		//フェード待ち
		if(FadeData.fade_sw) return;

		m4aMPlayStop( &m4a_mplay000 );
		zw->mode = Z_MODE6;
		Z_pVBlank_bak = sys.pVBlank;
		SetVBlankFunc(NULL);			//割込み関数設定(VBLANK)
		ZukanScreenRegInit(DISP_BG1_ON);	//表示レジスタ初期化

		zw->menu_p = 1;
		sys.InitSeqWork = 1;
		break;
	case 1:
		//データ転送
		LZ77UnCompVram((void*)zkn_ch_LZ,(void*)(BG_VRAM + 0x0000));		//BG CGX転送
		LZ77UnCompVram((void*)zkn_scv_LZ,
					(void*)(BG_VRAM + (MODE6_BG2_SCRVRAM*0x800)));	//BG2 MAP転送(背景)
		sys.InitSeqWork++;
		break;
	case 2:
		ZukanMenu2ScrSet(MODE6_BG1_SCRVRAM);	//BG1 MAP転送(メニュー));
		ZukanMenu2CursorSet(1,MODE6_BG1_SCRVRAM);
		ZukanPaletteSet();
		DIV_DMACLEAR(3,0,BG_VRAM + (MODE6_BG0_SCRVRAM * 0x800),0x0500,16);	//BG1 MAP転送(クリア)
		sys.InitSeqWork++;
		break;
	case 3:
		//表示ルーチン初期化１
		PrintScreenInit(ZUKANMAIN_TYPE);				// 図鑑リスト用(CGX_B = 2,SCR_B = 30)
		NMenuScreenInit(ZUKANMAIN_TYPE);				// 図鑑画面用(共用)
		PaletteAnimeInit();
		sys.InitSeqWork++;
		break;
	case 4:
		//データ表示
		offs = ZukanPokeNamePut(zmd->num,11,4);
		NMenuMsgWrite(Z_DataVoiceindexstr,11+offs,4);
		NMenuMsgWrite(Z_DataVoiceindex2str,11,6);
		sys.InitSeqWork++;
		break;
	case 5:
		TaskTable[id].work[ACT_STR]	= 
			ZukanPokeActorSet(zmd->num,MODE1_POKE_POS_X,MODE1_POKE_POS_Y,0);
		ActWork[TaskTable[id].work[ACT_STR]].oamData.Priority = 0;

		//鳴き声画面初期化(ＯＢＪ)
		ZNakiInitSeq = 0;
		sys.InitSeqWork++;
		break;
	case 6:
		//鳴き声画面初期化(波形表示設定)
		hs.ChrAddr	= MODE6_BG0_CHRVRAM*0x4000 + 0x20;	//NULLキャラ用に1キャラずらす
		hs.ScrBlock = MODE6_BG0_SCRVRAM;
		hs.PalNo	= 8;
		hs.XSize	= 30;
		hs.YOffs	= 12;
		if(HakeiInit(&hs,0)){
			sys.InitSeqWork++;
			ZNakiInitSeq = 0;
		}
		break;
	case 7:
		//鳴き声画面初期化(VUメーター表示設定)
		ms.ChrAddr	= MODE6_BG2_CHRVRAM*0x4000 + 0x03000;	//節約のため隙間に入れる
		ms.ScrBlock = MODE6_BG2_SCRVRAM;
		ms.PalNo	= 9;
		ms.XPos		= 18;
		ms.YPos		= 3;
		if(VuMeterInit(&ms,1)){
			sys.InitSeqWork++;
		}
		break;
	case 8:
		//フェード設定
		PaletteFadeReq((0xffffffff^MENU_PAL_MASK),0,16,0,0);
		SetVBlankFunc(Z_pVBlank_bak);				//割込み関数設定(VBLANK)
		sys.InitSeqWork++;
		break;
	case 9:
		//レジスタ設定
		*(vu16 *)REG_BLDCNT   = 0;	//半透明設定
		*(vu16 *)REG_BLDALPHA = 0;
		*(vu16 *)REG_BLDY	  = 0;
		
		*(vu16 *)REG_BG2CNT = BG_COLOR_16					//16色選択
						| BG_SCREEN_SIZE_0				// スクリーンサイズ
						| BG_PRIORITY_2					//BG優先順位
						| MODE6_BG2_SCRVRAM << BG_SCREEN_BASE_SHIFT	//スクリーンベースブロック
						| MODE6_BG2_CHRVRAM << BG_CHAR_BASE_SHIFT	//キャラクタベースブロック
						;
		*(vu16 *)REG_BG0CNT = BG_COLOR_16					//16色選択
						| BG_SCREEN_SIZE_0				// スクリーンサイズ
						| BG_PRIORITY_3					//BG優先順位
						| MODE6_BG0_SCRVRAM << BG_SCREEN_BASE_SHIFT	//スクリーンベースブロック
						| MODE6_BG0_CHRVRAM << BG_CHAR_BASE_SHIFT	//キャラクタベースブロック
						;
		*(vu16 *)REG_BG1CNT = BG_COLOR_16					//16色選択
						| BG_SCREEN_SIZE_0				// スクリーンサイズ
						| BG_PRIORITY_0					//BG優先順位
						| MODE6_BG1_SCRVRAM << BG_SCREEN_BASE_SHIFT	//スクリーンベースブロック
						| MODE6_BG1_CHRVRAM << BG_CHAR_BASE_SHIFT	//キャラクタベースブロック
						;
		*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
                          |	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
						  | DISP_BG3_ON					// BG3有効
						  | DISP_BG2_ON					// BG2有効
						  | DISP_BG1_ON					// BG1有効
						  | DISP_BG0_ON					// BG0有効
						  | DISP_OBJ_ON;
		sys.InitSeqWork++;
		break;
	case 10:
//		if(FadeData.fade_sw) break;//反応が悪いので特例でフェード待ちしない

		zw->DataModeRetFlag = 0;
		sys.InitSeqWork = 0;
		TaskTable[id].TaskAdrs = ZukanDataVoiceKeyTask;
		break;
	}
}

/*==================================================================*/
static	void	ZukanDataVoiceKeyTask(u8 id)
{
	//波形表示＆スクロール処理
	HakeiMain(0);

	if(VoiceEndCheck2()){
		ButtonPaletteEffect(1);
	}else{
		ButtonPaletteEffect(0);
	}
	//Ａボタン判定(鳴き声再生)
	if(sys.Trg & A_BUTTON){
		ButtonPaletteEffect(1);
		HakeiStart(PokeZukanNo2MonsNoGet(zmd->num));
		return;
	}

	//Ａボタン以外はフェード中は反応しない
	if(FadeData.fade_sw) return;

	//Ｂボタン判定(ポケモンデータ画面へ)
	if(sys.Trg & B_BUTTON){
		PaletteFadeReq((0xffffffff^MENU_PAL_MASK),0,0,16,0);
		m4aMPlayContinue( &m4a_mplay000 );
		zw->DataModeRetFlag = 1;
		TaskTable[id].TaskAdrs = ZukanDataVoiceExitTask;
		SePlay(SE_PC_OFF);
		return;
	}
	if((sys.Trg & L_KEY)||((sys.Trg & L_BUTTON)&&(MyData.key_config == CNT_MD_LR))){
		//分布図
		PaletteFadeReq((0xffffffff^MENU_PAL_MASK),0,0,16,0);
		m4aMPlayContinue( &m4a_mplay000 );
		zw->DataModeRetFlag = 2;
		TaskTable[id].TaskAdrs = ZukanDataVoiceExitTask;
		SePlay(SE_Z_PAGE);
		return;
	}
	if((sys.Trg & R_KEY)||((sys.Trg & R_BUTTON)&&(MyData.key_config == CNT_MD_LR))){
		//おおきさくらべ(ポケモン取得時のみ)
		if(!zmd->get){
			SePlay(SE_HAZURE);
		}else{
			PaletteFadeReq((0xffffffff^MENU_PAL_MASK),0,0,16,0);
			m4aMPlayContinue( &m4a_mplay000 );
			zw->DataModeRetFlag = 3;
			TaskTable[id].TaskAdrs = ZukanDataVoiceExitTask;
			SePlay(SE_Z_PAGE);
			return;
		}
	}
}

/*==================================================================*/
static	void	ZukanDataVoiceExitTask(u8 id)
{
	if(FadeData.fade_sw) return;

	VuMeterEnd();			//終了処理(鳴き声画面)
	switch(zw->DataModeRetFlag){

	default:
	case 1:
		//図鑑データ画面へ
		TaskTable[id].TaskAdrs = ZukanDataInitTask;
		break;
	case 2:
		//分布画面へ
		TaskTable[id].TaskAdrs = ZukanDataBunpuInitTask;
		break;
	case 3:
		//おおきさ画面へ
		TaskTable[id].TaskAdrs = ZukanDataOokisaInitTask;
		break;
	}
}

static	void	ButtonPaletteEffect(u8 mode)
{
	u16	pal;

	if(mode)	pal = 0x0392;//ＯＮ
	else		pal = 0x02af;//ＯＦＦ
	PaletteWorkSet(&pal,PA_BG5 + PA_COL13,0x02);
}









/*==================================================================*/
/*                                                                  */
/*				おおきさくらべ画面操作								*/
/*                                                                  */
/*==================================================================*/
static	void	ZukanDataOokisaInitTask(u8 id)
{
	u8	anum;

	switch(sys.InitSeqWork){
	default:
	case 0:
		//フェード待ち
		if(FadeData.fade_sw) break;

		zw->mode = Z_MODE7;
		Z_pVBlank_bak = sys.pVBlank;
		SetVBlankFunc(NULL);			//割込み関数設定(VBLANK)
		ZukanScreenRegInit(DISP_BG1_ON);	//表示レジスタ初期化

		zw->menu_p = 2;
		sys.InitSeqWork = 1;
		break;
	case 1:
		//データ転送
		LZ77UnCompVram((void*)zkn_ch_LZ,(void*)(BG_VRAM + 0x0000));		//BG CGX転送
		LZ77UnCompVram((void*)zkn_scc_LZ,
					(void*)(BG_VRAM + (MODE7_BG2_SCRVRAM*0x800)));	//BG2 MAP転送(背景)
		sys.InitSeqWork++;
		break;
	case 2:
		ZukanMenu2ScrSet(MODE7_BG1_SCRVRAM);	//BG1 MAP転送(メニュー));
		ZukanMenu2CursorSet(2,MODE7_BG1_SCRVRAM);
		ZukanPaletteSet();
		sys.InitSeqWork++;
		break;
	case 3:
		//表示ルーチン初期化１
		PrintScreenInit(ZUKANMAIN_TYPE);				// 図鑑リスト用(CGX_B = 2,SCR_B = 31)
		NMenuScreenInit(ZUKANMAIN_TYPE);				// 図鑑画面用(共用)
		ZukanPokeNamePut(zmd->num,4,15);
		NMenuMsgWrite(Z_DataOokisaindex1str,9,15);
		NMenuMsgWrite(MyData.my_name,11,15);
		NMenuMsgWrite(Z_DataOokisaindex2str,16,15);
		sys.InitSeqWork++;
		break;
	case 4:
		PaletteAnimeInit();
		sys.InitSeqWork++;
		break;
	case 5:
		//トレーナーアクター設定
		anum = ZukanTrainerActorSet(MyData.my_sex,152,64-8,0);
		ActWork[anum].oamData.AffineMode = 1;
		ActWork[anum].oamData.AffineParamNo = 1;
		ActWork[anum].oamData.Priority = 0;
		ActWork[anum].dy = zukanData[zmd->num].y_t;	//高さ指定
		affineWorkSet(1,zukanData[zmd->num].affine_t,0,0,zukanData[zmd->num].affine_t);	//比率指定
		PaletteWorkSet(&monotone_Palette[0],(ActWork[anum].oamData.Pltt+16)*0x10,0x20);
		sys.InitSeqWork++;
		break;
	case 6:
		//ポケモンアクター設定
		anum = ZukanPokeActorSet(zmd->num,88,64-8,1);
		ActWork[anum].oamData.AffineMode = 1;
		ActWork[anum].oamData.AffineParamNo = 2;
		ActWork[anum].oamData.Priority = 0;
		ActWork[anum].dy = zukanData[zmd->num].y_p;	//高さ指定
		affineWorkSet(2,zukanData[zmd->num].affine_p,0,0,zukanData[zmd->num].affine_p);	//比率指定
		PaletteWorkSet(&monotone_Palette[0],(ActWork[anum].oamData.Pltt+16)*0x10,0x20);
		sys.InitSeqWork++;
		break;
	case 7:
		//フェード設定
		PaletteFadeReq((0xffffffff^MENU_PAL_MASK),0,16,0,0);
		SetVBlankFunc(Z_pVBlank_bak);				//割込み関数設定(VBLANK)
		sys.InitSeqWork++;
		break;
	case 8:
		//レジスタ設定
		*(vu16 *)REG_BLDCNT   = 0;	//半透明設定
		*(vu16 *)REG_BLDALPHA = 0;
		*(vu16 *)REG_BLDY	  = 0;
		*(vu16 *)REG_BG2CNT = BG_COLOR_16					//16色選択
						| BG_SCREEN_SIZE_0				// スクリーンサイズ
						| BG_PRIORITY_3					//BG優先順位
						| MODE7_BG2_SCRVRAM << BG_SCREEN_BASE_SHIFT	//スクリーンベースブロック
						| MODE7_BG2_CHRVRAM << BG_CHAR_BASE_SHIFT	//キャラクタベースブロック
						;
		*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
				              |	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
							  | DISP_BG3_ON					// BG3有効
							  | DISP_BG2_ON					// BG2有効
							  | DISP_BG1_ON					// BG2有効
							  | DISP_OBJ_ON;
		sys.InitSeqWork++;
		break;
	case 9:
		if(FadeData.fade_sw) break;

		zw->DataModeRetFlag = 0;
		sys.InitSeqWork = 0;
		TaskTable[id].TaskAdrs = ZukanDataOokisaKeyTask;
		break;
	}
}

/*==================================================================*/
static	void	ZukanDataOokisaKeyTask(u8 id)
{
	//Ｂボタン判定(ポケモンデータ画面へ)
	if(sys.Trg & B_BUTTON){
		PaletteFadeReq((0xffffffff^MENU_PAL_MASK),0,0,16,0);
		zw->DataModeRetFlag = 1;
		TaskTable[id].TaskAdrs = ZukanDataOokisaExitTask;
		SePlay(SE_PC_OFF);
		return;
	}
	if((sys.Trg & L_KEY)||((sys.Trg & L_BUTTON)&&(MyData.key_config == CNT_MD_LR))){
		//鳴き声画面へ
		PaletteFadeReq((0xffffffff^MENU_PAL_MASK),0,0,16,0);
		zw->DataModeRetFlag = 2;
		TaskTable[id].TaskAdrs = ZukanDataOokisaExitTask;
		SePlay(SE_Z_PAGE);
		return;
	}
}

/*==================================================================*/
static	void	ZukanDataOokisaExitTask(u8 id)
{
	if(FadeData.fade_sw) return;

	switch(zw->DataModeRetFlag){

	default:
	case 1:
		//図鑑データ画面へ
		TaskTable[id].TaskAdrs = ZukanDataInitTask;
		break;
	case 2:
		//鳴き声画面へ
		TaskTable[id].TaskAdrs = ZukanDataVoiceInitTask;
		break;
	}
}










/*==================================================================*/
/*                                                                  */
/*				メニュー作成										*/
/*                                                                  */
/*==================================================================*/
/*==================================================================*/
static	void	ZukanMenuScrSet(u16 vp)
{
	//vp はメニュースクリーン設定アドレス。
	LZ77UnCompVram((void*)zkn_scm1_LZ,(void*)(BG_VRAM+(vp*0x800)));	//BG1 MAP転送(メニュー)
	DIV_DMACLEAR(3,0,BG_VRAM + (vp * 0x800) + 0x00c0,0x0440,16);	//BG1 MAP転送(残り)
}

/*==================================================================*/
static	void	ZukanMenu2ScrSet(u16 vp)
{
	//vp はメニュースクリーン設定アドレス。
	LZ77UnCompVram((void*)zkn_scm2_LZ,(void*)(BG_VRAM+(vp*0x800)));	//BG1 MAP転送(メニュー)
	DIV_DMACLEAR(3,0,BG_VRAM + (vp * 0x800) + 0x00c0,0x0440,16);	//BG1 MAP転送(残り)
}

/*==================================================================*/
static	void	ZukanMenuCursorSet(u8 pos,u16 vp)
{
	u8	i,j,x;
	u16	chr,pal;

	for(j=0;j<4;j++){
		x = j*7 + 1;
		if(j == pos){
			pal = 0x2000;
		}else{
			pal = 0x4000;
		}
		for(i=0;i<7;i++){
			chr = *(u16 *)(BG_VRAM + vp*0x800 + (x+i)*2);
			chr &= 0x0fff;
			chr |= pal;
			*(u16 *)(BG_VRAM + vp*0x800 + (x+i)*2) = chr;
	
			chr = *(u16 *)(BG_VRAM + vp*0x800 + 64 + (x+i)*2);
			chr &= 0x0fff;
			chr |= pal;
			*(u16 *)(BG_VRAM + vp*0x800 + 64 + (x+i)*2) = chr;
		}
	}
}

/*==================================================================*/
static	void	ZukanMenu2CursorSet(u8 pos,u16 vp)
{
	u8	i,j,x;
	u16	chr,pal;

	for(j=0;j<4;j++){
		x = j*7 + 1;
		if((j == pos)||(j == 3)){
			pal = 0x2000;
		}else{
			pal = 0x4000;
		}
		for(i=0;i<7;i++){
			chr = *(u16 *)(BG_VRAM + vp*0x800 + (x+i)*2);
			chr &= 0x0fff;
			chr |= pal;
			*(u16 *)(BG_VRAM + vp*0x800 + (x+i)*2) = chr;
	
			chr = *(u16 *)(BG_VRAM + vp*0x800 + 64 + (x+i)*2);
			chr &= 0x0fff;
			chr |= pal;
			*(u16 *)(BG_VRAM + vp*0x800 + 64 + (x+i)*2) = chr;
		}
	}
}










/********************************************************************/
/*                                                                  */
/*				ポケモンデータ表示（ポケモン捕獲時）				*/
/*                                                                  */
#define	SAMPLE_BG0_SCRVRAM	(0)			//未使用
#define	SAMPLE_BG0_CHRVRAM	(0)			//未使用
#define	SAMPLE_BG1_SCRVRAM	(0)			//未使用
#define	SAMPLE_BG1_CHRVRAM	(0)			//未使用
#define	SAMPLE_BG2_SCRVRAM	(14)		//ZUKANLIST_TYPE使用
#define	SAMPLE_BG2_CHRVRAM	(2)			//ZUKANLIST_TYPE使用
#define	SAMPLE_BG3_SCRVRAM	(15)		//背景
#define	SAMPLE_BG3_CHRVRAM	(1)			//背景
/********************************************************************/
static void		SamplePokeMove(actWork* aw);
static	void	ZukanSampleInitTask(u8 id);
static	void	ZukanSampleKeyTask(u8 id);
static	void	ZukanSampleExitTask(u8 id);

u8	ZukanSampleSet(u16 pokenum,u32 id,u32 per_rnd)
{
 	u8	taskID;

 	taskID = AddTask(ZukanSampleInitTask, 0);
 	TaskTable[taskID].work[0] = 0;	//初期化シーケンス
 	TaskTable[taskID].work[1] = pokenum;	//ポケモンナンバー

 	TaskTable[taskID].work[12] = (id & 0x0000ffff);
 	TaskTable[taskID].work[13] = ((id>>16) & 0x0000ffff);
 	TaskTable[taskID].work[14] = (per_rnd & 0x0000ffff);
 	TaskTable[taskID].work[15] = ((per_rnd>>16) & 0x0000ffff);

 	return taskID;
}

static	void	ZukanSampleInitTask(u8 id)
{
	u8	anum;
	u16	i,pokenum,scrdata;

	pokenum = TaskTable[id].work[1];

	switch(TaskTable[id].work[0]){
	default:
	case 0:
 		//フェード待ち
		if(FadeData.fade_sw) break;

		Z_pVBlank_bak = sys.pVBlank;
		SetVBlankFunc(NULL);			//割込み関数設定(VBLANK)

		ZukanScreenRegInit(DISP_BG0_ON);	//表示レジスタ初期化
		TaskTable[id].work[0] = 1;
 		break;
 	case 1:
		//データ転送
		LZ77UnCompVram((void*)zkn_ch_LZ,(void*)(BG_VRAM+0x4000));	//BG CGX転送
		LZ77UnCompVram((void*)zkn_scp_LZ,
					(void*)(BG_VRAM + (SAMPLE_BG3_SCRVRAM*0x800)));	//BG3 MAP転送(背景)
		for(i=0;i<0x500/2;i++){
			scrdata = *(u16*)(BG_VRAM + (SAMPLE_BG3_SCRVRAM*0x800) + (i*2));//BG3 ATTR変更
			scrdata += 0x2000;	//パレット位置２つずらす 
			*(u16*)(BG_VRAM + (SAMPLE_BG3_SCRVRAM*0x800) + (i*2)) = scrdata;
		}
		ZukanPokeFootTrans(TaskTable[id].work[1],SAMPLE_BG2_CHRVRAM,MODE1_FOOTCGX_NO);

		PaletteAnimeInit();
		PaletteWorkSet(&zukan1_Palette[0x0001],PA_BG2+PA_COL1,0xa0-2);//BG0&BG1&BG3 COL転送
		TaskTable[id].work[0]++;
		break;
	case 2:
		//各ユーティリティー初期化
		PrintScreenInit(ZUKANLIST_TYPE);
		NMenuScreenInit(ZUKANLIST_TYPE);
		DIV_DMACLEAR(3,0,BG_VRAM + 0xc000,0x0200,16);	//実験
		TaskTable[id].work[0]++;
		break;
 	case 3:
		//データ表示
		NMenuMsgWrite(ZukanSampleIndex,3,0);

		if(!ZukanSpecialFlagCheck()){
			//全国図鑑みれない
			ZukanPokeNumPut(PokeZukanNo2HouenNoGet(pokenum),13,3);	//ナンバー
		}else{
			ZukanPokeNumPut(pokenum,13,3);			//ナンバー
		}
		ZukanPokeNamePut(pokenum,17,3);		//名前
		NMenuMsgWrite(Z_Datainfo1str,13,5);		//タイプ（初期設定）
		NMenuMsgWrite(Z_Datainfo2str,16,7);		//たかさ（初期設定）
		NMenuMsgWrite(Z_Datainfo3str,16,9);		//おもさ（初期設定）

		ZukanDataTypeNamePut((u8*)zukanData[pokenum].typename,13,5);
		ZukanDataNumPut(zukanData[pokenum].takasa,16,7);
		ZukanDataNumPut(zukanData[pokenum].omosa,16,9);
		NMenuMsgWrite(zukanData[pokenum].text,3,13);
		ZukanPokeFootPut(SAMPLE_BG2_SCRVRAM,MODE1_FOOTCGX_NO);

		TaskTable[id].work[0]++;
		break;
	case 4:
		//ＯＢＪ関連表示＆フェード設定
		anum = ZukanPokeActorSet(pokenum,MODE1_POKE_POS_X,MODE1_POKE_POS_Y,0);
		ActWork[anum].oamData.Priority = 0;
		PaletteFadeReq(0xffffffff,0,16,0,0);
		SetVBlankFunc(Z_pVBlank_bak);	//割込み関数設定(VBLANK)
		TaskTable[id].work[3] = anum;	//アクターSTRUCT保存
		TaskTable[id].work[0]++;
		break;
	case 5:
		//レジスタ設定
		*(vu16 *)REG_BLDCNT   = 0;	//半透明設定
		*(vu16 *)REG_BLDALPHA = 0;
		*(vu16 *)REG_BLDY	  = 0;
		*(vu16 *)REG_BG3CNT = BG_COLOR_16					//16色選択
							| BG_SCREEN_SIZE_0				// スクリーンサイズ
							| BG_PRIORITY_3					//BG優先順位
							| SAMPLE_BG3_SCRVRAM<<BG_SCREEN_BASE_SHIFT	//スクリーンベースブロック
							| SAMPLE_BG3_CHRVRAM<<BG_CHAR_BASE_SHIFT	//キャラクタベースブロック
							;
		*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
							  |	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
							  | DISP_BG3_ON					// BG3有効
							  | DISP_BG2_ON					// BG2有効
							  | DISP_OBJ_ON;
		TaskTable[id].work[0]++;
		break;
	case 6:
 		//フェード待ち＆鳴き声再生
		if(FadeData.fade_sw) break;

		VoicePlay(PokeZukanNo2MonsNoGet(pokenum),0);
		TaskTable[id].work[2] = 0;
		TaskTable[id].TaskAdrs = ZukanSampleKeyTask;
		break;
	}
}

/*==================================================================*/
static	void	ZukanSampleKeyTask(u8 id)
{
	//Ａ＆Ｂボタン判定
	if(sys.Trg & (A_BUTTON|B_BUTTON)){
		PaletteFadeReq(0x0000fffc,0,0,16,0);
		ActWork[TaskTable[id].work[3]].move = SamplePokeMove;
		TaskTable[id].TaskAdrs = ZukanSampleExitTask;
		return;
	}
	//点滅
	if((++TaskTable[id].work[2])&0x0010){
		PaletteWorkSet(&zukan1_Palette[0x00+0x01],PA_BG5+PA_COL1,0x10-2);
	}else{
		PaletteWorkSet(&zukan1_Palette[0x30+0x01],PA_BG5+PA_COL1,0x10-2);
	}
}

/*==================================================================*/
extern	void		FightWindowChrSet(void);

static	void	ZukanSampleExitTask(u8 id)
{
	u32	p_id,per_rnd;
	u16	pokenum;
	u8	pal;

 	if(FadeData.fade_sw)	return;

	*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
						  |	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
						  | DISP_BG3_ON					// BG3有効
						  | DISP_BG0_ON					// BG2有効
						  | DISP_OBJ_ON;
 	pokenum	= PokeZukanNo2MonsNoGet(TaskTable[id].work[1]);
	p_id	= (((u16)TaskTable[id].work[13])<<16) | ((u16)TaskTable[id].work[12]);
	per_rnd = (((u16)TaskTable[id].work[15])<<16) | ((u16)TaskTable[id].work[14]);
	pal		= ActWork[TaskTable[id].work[3]].oamData.Pltt;
	DecordPaletteWork( (void*)PokePalGetPara(pokenum,p_id,per_rnd),PA_OBJ0+(pal*16),0x20 );

	DelTask(id);
	FightWindowChrSet();
}

/*==================================================================*/
static void		SamplePokeMove(actWork* aw)
{
	if(aw->x < 120)	aw->x+=2;
	if(aw->x > 120)	aw->x-=2;
	if(aw->y < 80)	aw->y++;
	if(aw->y > 80)	aw->y--;
}





