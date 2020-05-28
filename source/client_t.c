
//======================================================
//    client_t.c                                           
//                                                      
//    Copyright (C) 2001 GAME FREAK inc.
//======================================================

#include "common.h"
#include "bss.h"		//add
#include "ef_tool.h"
#include "calctool.h"
#include "poketool.h"		//add
#include "decord.h"		//add
#include "objdata.h"		//add
#include "fight.h"		//add

#include "actor.h"
#include "actanm.h"
#include "madefine.h"
#include "cli_num.h"
#include "cli_def.h"
#include "cli_ef.h"
#include "gauge.h"
#include "intr.h"
#include "print.h"
#include "wazatool.h"
#include "client.h"
#include "server.h"
#include "b_pmlist.h"
#include "mus_tool.h"
#include "waza_eff.h"
#include "wazano.def"
#include "monsno.def"
#include "contest.h"


//=========================================================================
//	外部変数
//=========================================================================
extern int BGNo;
extern	TALK_WIN	FightMsg;

//=========================================================================
//	外部関数
//=========================================================================
extern void	MainFight(void);
extern void	fight_v_blank_intr(void);

//=========================================================================
//	プロトタイプ宣言
//=========================================================================
void ClientSystemWorkInit(void);
void ClientSystemWorkInitAll(void);
void PokeShadowSeq(actWork *xreg);
void PokeShadowBanishSeq(actWork *xreg);
void PokeShadowAllDataSet(void);

//=========================================================================
//	データ
//=========================================================================
//----------------------------------------------------------
//	煙(ﾓﾝｽﾀｰﾎﾞｰﾙから出てくるときの)
//----------------------------------------------------------
const CellData MBSmokeCell =
{
	(void *)smokechr_pch_ADRS, OBJ_SIZE16_8x8 * 12, CELLID_MBSmoke
};
const PalData MBSmokePal = 
{
	(void *)smokechr_pcl_ADRS, CELLID_MBSmoke
};


//=========================================================================
//	アクターテーブル
//=========================================================================
//----------------------------------------------------------
//	煙(ﾓﾝｽﾀｰﾎﾞｰﾙから出てくるときの)
//----------------------------------------------------------
const ActOamData MBSmokeOamData = 
{
	0,		//u32 VPos:8;             // Ｙ座標
	0,		//u32 AffineMode:2;       // アフィンモード
	0,		//u32 ObjMode:2;          // ＯＢＪモード
	OFF,	//u32 Mosaic:1;           // モザイク
	0,		//u32 ColorMode:1;        // １６色/２５６色 選択
	0,		//u32 Shape:2;            // ＯＢＪ形状

	0,		//u32 HPos:9;             // Ｘ座標
	0,		//u32 AffineParamNo:5;  // アフィン変換パラメータNo & H,VFlip
	1,		//u32 Size:2;             // ＯＢＪサイズ

	0,		//u32 CharNo:10;          // キャラクタＮｏ
	1,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};

static const actAnm mbsmoke_anm0[] =			//左上
{//ｷｬﾗｸﾀｰﾃﾞｰﾀﾅﾝﾊﾞｰ  ｳｪｲﾄ  Hflip  Vflip
	{OBJ16_8x8 * 0, MBSMOKE_ANMWAIT, 0, 0},
	{OBJ16_8x8 * 4, MBSMOKE_ANMWAIT, 0, 0},
	{OBJ16_8x8 * 8, MBSMOKE_ANMWAIT, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm mbsmoke_anm1[] =			//右上
{//ｷｬﾗｸﾀｰﾃﾞｰﾀﾅﾝﾊﾞｰ  ｳｪｲﾄ  Hflip  Vflip
	{OBJ16_8x8 * 0, MBSMOKE_ANMWAIT, 1, 0},
	{OBJ16_8x8 * 4, MBSMOKE_ANMWAIT, 1, 0},
	{OBJ16_8x8 * 8, MBSMOKE_ANMWAIT, 1, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm mbsmoke_anm2[] =			//左下
{//ｷｬﾗｸﾀｰﾃﾞｰﾀﾅﾝﾊﾞｰ  ｳｪｲﾄ  Hflip  Vflip
	{OBJ16_8x8 * 0, MBSMOKE_ANMWAIT, 0, 1},
	{OBJ16_8x8 * 4, MBSMOKE_ANMWAIT, 0, 1},
	{OBJ16_8x8 * 8, MBSMOKE_ANMWAIT, 0, 1},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm mbsmoke_anm3[] =			//右下
{//ｷｬﾗｸﾀｰﾃﾞｰﾀﾅﾝﾊﾞｰ  ｳｪｲﾄ  Hflip  Vflip
	{OBJ16_8x8 * 0, MBSMOKE_ANMWAIT, 1, 1},
	{OBJ16_8x8 * 4, MBSMOKE_ANMWAIT, 1, 1},
	{OBJ16_8x8 * 8, MBSMOKE_ANMWAIT, 1, 1},
	{ACT_ANMEND, 0, 0, 0},
};

static const actAnm * const MBSmokeAnmTbl[] = 
{
	mbsmoke_anm0,
	mbsmoke_anm1,
	mbsmoke_anm2,
	mbsmoke_anm3,
};

const actHeader MBSmokeHeader = 
{
	CELLID_MBSmoke,
	CELLID_MBSmoke,
	&MBSmokeOamData,
	MBSmokeAnmTbl,
	0,
	DummyActAffTbl,	//MBSmokeAffTbl,
	MBSmokeWait,
};

//----------------------------------------------------------
//	ﾎﾞｰﾙから出入りするときのﾎﾟｹﾓﾝ拡縮
//----------------------------------------------------------
/*const	actAffAnm * const BallPokeAffTbl[] = 
{
	BallOutAffAnm,
	BallInAffAnm,
};*/


//----------------------------------------------------------
//	ポケモンの影
//----------------------------------------------------------
const CellData PokeShadowCell={
	(void *)kage_pch_ADRS,OBJ_SIZE16_8x32*1,	CELLID_POKESHADOW,
};
const ActOamData PokeShadowOamData = 
{
	0,		//u32 VPos:8;             // Ｙ座標
	0,		//u32 AffineMode:2;       // アフィンモード
	0,		//u32 ObjMode:2;          // ＯＢＪモード
	OFF,	//u32 Mosaic:1;           // モザイク
	0,		//u32 ColorMode:1;        // １６色/２５６色 選択
	1,		//u32 Shape:2;            // ＯＢＪ形状

	0,		//u32 HPos:9;             // Ｘ座標
	0,		//u32 AffineParamNo:5;  // アフィン変換パラメータNo & H,VFlip
	1,		//u32 Size:2;             // ＯＢＪサイズ

	0,		//u32 CharNo:10;          // キャラクタＮｏ
	3,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};
const actHeader PokeShadowHeader = 
{
	CELLID_POKESHADOW,
	CELLID_BattleGaugeMine1,	//現状、ﾊﾟﾚｯﾄはHPｹﾞｰｼﾞと一緒
	&PokeShadowOamData,
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	PokeShadowBanishSeq,
};

//=========================================================================
//	プログラム
//=========================================================================


//=========================================================================
//	ﾎﾟｹﾓﾝ セル登録&ﾊﾟﾚｯﾄ登録
// ClientNoによってBGﾊﾟﾚｯﾄ0～3に分ける
//=========================================================================

//const u32 DecordAdrs[]={0x2008000,0x2010000,0x2018000,0x2020000};
//const u32 DecordAdrs[]={0x2008000,0x200c000,0x2010000,0x2014000};
//const u32 DecordAdrs[]={0x2008000,0x200b000,0x200e000,0x2011000};
const u32 DecordAdrs[]={0x2008000,0x200a000,0x200c000,0x200e000};

void PokemonFObjCellPalSet(PokemonParam *pp, u8 client_no)
{
	u8 client_type;
	u16 pokeno;
	u32 personal_rnd;
	u32 rnd;
	u16 obj_palpos;
	u32 poke_id;
	void *paladrs;
	
	personal_rnd = PokeParaGet(pp, ID_personal_rnd);
	if(Climem[client_no].hensin_monsno == 0){
		pokeno = PokeParaGet(pp, ID_monsno);
		rnd	   = personal_rnd;
	}
	else{
		pokeno = Climem[client_no].hensin_monsno;
		rnd	   = HenshinRnd[client_no];
	}
	poke_id = PokeParaGet(pp, ID_id_no);
	
	client_type = ClientTypeGet(client_no);	//add by matsuda 2001.09.26(水)
#if 1
	//へんしん用の個性乱数を使う
	DecordPokeCellMakeBuchi(&PM2FObjDataCell[pokeno], pm2fpara[pokeno].size,
				pm2fpara[pokeno].patcnt, (void*)0x2000000,
				(void*)DecordAdrs[client_type], pokeno, rnd);
#else
	DecordPokeCellMakeBuchi(&PM2FObjDataCell[pokeno], pm2fpara[pokeno].size,
				pm2fpara[pokeno].patcnt, (void*)0x2000000,
				(void*)DecordAdrs[client_type], pokeno, personal_rnd);
#endif
//	DecordPalSet(&PM2NObjDataPal[pokeno]);
	obj_palpos = PA_OBJ0 + 0x10 * client_no;
	if(Climem[client_no].hensin_monsno == 0){
		paladrs = (void*)PokePalGet(pp);
	}else{
		paladrs = (void*)PokePalGetPara(pokeno,poke_id,personal_rnd);
	}
	
	DecordWram(paladrs, (void*)&UserWork[0]);
	PaletteWorkSet((void *)&UserWork[0], obj_palpos, 0x20);
	PaletteWorkSet((void *)&UserWork[0], PA_BG8 + 0x10 * client_no, 0x20);
	//お天気ポケモンは特殊なセットをする
	if(pokeno==MONSNO_POWARUN){
		obj_palpos = PA_OBJ0 + 0x10 * client_no;
//		DecordWram((void*)powawan_pcl_ADRS, (void*)&UserWork[0]);
		DecordWram(paladrs, (void*)&UserWork[POWARUN_PALETTE]);
		PaletteWorkSet((void *)&UserWork[POWARUN_PALETTE+0x20*BattlePokeAnmNo[client_no]],obj_palpos,0x20);
	}
	if(Climem[client_no].hensin_monsno != 0){
		SoftFade(obj_palpos, 16, HENSIN_EVY, 0x7fff);
		CpuCopy(&PaletteWorkTrans[obj_palpos], &PaletteWork[obj_palpos], 0x20, 32);
	}
}
void PokemonBObjCellPalSet(PokemonParam *pp, u8 client_no)
{
	u8 client_type;
	u16 pokeno;
	u32 personal_rnd;
	u32	rnd;
	u16 obj_palpos;
	u32 poke_id;
	void *paladrs;
	
	personal_rnd = PokeParaGet(pp, ID_personal_rnd);
	if(Climem[client_no].hensin_monsno == 0){
		pokeno = PokeParaGet(pp, ID_monsno);
		rnd	   = personal_rnd;
	}
	else{
		pokeno = Climem[client_no].hensin_monsno;
		rnd    = HenshinRnd[client_no];
	}
	poke_id = PokeParaGet(pp, ID_id_no);
	
	client_type = ClientTypeGet(client_no);	//add by matsuda 2001.09.26(水)
#if 1
	//へんしん用の個性乱数を使う
	DecordPokeCellMakeBuchi(&PM2BObjDataCell[pokeno], pm2bpara[pokeno].size,
				pm2bpara[pokeno].patcnt, (void*)0x2000000,
				(void*)DecordAdrs[client_type], pokeno,rnd);
#else
	DecordPokeCellMakeBuchi(&PM2BObjDataCell[pokeno], pm2bpara[pokeno].size,
				pm2bpara[pokeno].patcnt, (void*)0x2000000,
				(void*)DecordAdrs[client_type], pokeno,personal_rnd);
#endif
//	DecordPalSet(&PM2NObjDataPal[pokeno]);
	//											↓2ﾊﾞｲﾄﾃﾞｰﾀなので
	obj_palpos = PA_OBJ0 + 0x10 * client_no;
	if(Climem[client_no].hensin_monsno == 0){
		paladrs = (void*)PokePalGet(pp);
	}else{
		paladrs = (void*)PokePalGetPara(pokeno,poke_id,personal_rnd);
	}
	
	DecordWram(paladrs, (void*)&UserWork[0]);
	PaletteWorkSet((void *)&UserWork[0], obj_palpos, 0x20);
	PaletteWorkSet((void *)&UserWork[0], PA_BG8 + 0x10 * client_no, 0x20);
	//お天気ポケモンは特殊なセットをする
	if(pokeno==MONSNO_POWARUN){
		obj_palpos = PA_OBJ0 + 0x10 * client_no;
//		DecordWram((void*)powawan_pcl_ADRS, (void*)&UserWork[0]);
		DecordWram(paladrs, (void*)&UserWork[POWARUN_PALETTE]);
		PaletteWorkSet((void *)&UserWork[POWARUN_PALETTE+0x20*BattlePokeAnmNo[client_no]],obj_palpos,0x20);
	}
	if(Climem[client_no].hensin_monsno != 0){
		SoftFade(obj_palpos, 16, HENSIN_EVY, 0x7fff);
		CpuCopy(&PaletteWorkTrans[obj_palpos], &PaletteWork[obj_palpos], 0x20, 32);
	}
}

//=========================================================================
//	ﾎﾟｹﾓﾝ ｾﾙ、ﾊﾟﾚｯﾄDel
//=========================================================================
void PokemonFObjCellPalDel(u16 pokeno)
{
	//転送型だからCellDel必要なし、PalSet使ってないからPalDel必要なし
//	CellDel(PM2FObjDataCell[pokeno].act_num);
//	ObjPalRegNumDel(PM2NObjDataPal[pokeno].reg_num);
}
void PokemonBObjCellPalDel(u16 pokeno)
{
	//転送型だからCellDel必要なし、PalSet使ってないからPalDel必要なし
//	CellDel(PM2BObjDataCell[pokeno].act_num);
//	ObjPalRegNumDel(PM2NObjDataPal[pokeno].reg_num);
}

//=========================================================================
//	ﾄﾚｰﾅｰ セル登録&ﾊﾟﾚｯﾄ登録
//=========================================================================
void TrainerFObjCellPalSet(u16 trainer_no, u8 client_no)
{
	u8 client_type;
	CellData ArcCell;

	client_type = ClientTypeGet(client_no);	//add by matsuda 2001.09.26(水)
	DecordPokeCellMake((CellData*)&TRFObjDataCell[trainer_no],trfpara[trainer_no].size,
				trfpara[trainer_no].patcnt, (void*)0x2000000,(void*)DecordAdrs[client_type],0);
	ArcCell.ch_data=(void*)DecordAdrs[client_type];
	ArcCell.size=TRFObjDataCell[trainer_no].size;
	ArcCell.act_num=TRFObjDataCell[trainer_no].act_num;
	DecordCellSet((CellData*)&ArcCell);
//	DecordCellSet((CellData*)&TRFObjDataCell[trainer_no]);
	DecordPalSet((void*)&TRFObjDataPal[trainer_no]);
}

void TrainerBObjCellPalSet(u16 trainer_no, u8 client_no)
{
	u8 client_type;
	client_type = ClientTypeGet(client_no);	//add by matsuda 2001.09.26(水)
	DecordPokeCellMake((CellData*)&TRBObjDataCell[trainer_no],trbpara[trainer_no].size,
				trbpara[trainer_no].patcnt, (void*)0x2000000,(void*)DecordAdrs[client_type],0);
//	DecordPalSet((PalData*)&TRBObjDataPal[trainer_no]);
	DecordPaletteWork((void*)TRBObjDataPal[trainer_no].pal_data,
		PA_OBJ0 + 0x10 * client_no, 0x20);
}
//=========================================================================
//	ﾄﾚｰﾅｰ ｾﾙ、ﾊﾟﾚｯﾄDEL
//=========================================================================
void TrainerBObjCellPalDel(u16 trainer_no)
{
	//転送型だからCellDel必要なし、PalSet使ってないからPalDel必要なし
	//ObjPalRegNumDel(TRBObjDataPal[trainer_no].reg_num);
}
void TrainerFObjCellPalDel(u16 trainer_no)
{
	//Cell,PalSetするようになったのでちゃんとDelする
	ObjPalRegNumDel(TRFObjDataPal[trainer_no].reg_num);
	CellDel(TRFObjDataCell[trainer_no].act_num);
}

//=========================================================================
//	ｹﾞｰｼﾞ本体ｷｬﾗｾｯﾄ
//=========================================================================
void BattleGaugeCellPalSet(void)
{
	u8 i, parts_max;
	
	ObjPalSet((PalData*)&BattleGaugeDataPal[0]);
	ObjPalSet((PalData*)&BattleGaugeDataPal[1]);
	if(FightCheck() == 0)
	{
	#if GAUGE_CHANGE
		DecordCellSet((void*)&BattleGaugeDataCell_1vs1);
	#else
		DecordCellSet((void*)&MineGaugeCell_1vs1);
		DecordCellSet((void*)&EnemyGaugeCell_1vs1);
	#endif
		parts_max = 2;
	}
	else
	{
	#if GAUGE_CHANGE
		DecordCellSet((void*)&BattleGaugeDataCellMine2[0]);
		DecordCellSet((void*)&BattleGaugeDataCellMine2[1]);
		DecordCellSet((void*)&BattleGaugeDataCellEnemy2[0]);
		DecordCellSet((void*)&BattleGaugeDataCellEnemy2[1]);
	#else
		DecordCellSet((void*)&MineGaugeCell_2vs2[0]);
		DecordCellSet((void*)&MineGaugeCell_2vs2[1]);
		DecordCellSet((void*)&EnemyGaugeCell_2vs2[0]);
		DecordCellSet((void*)&EnemyGaugeCell_2vs2[1]);
	#endif
		parts_max = 4;
	}
	for(i = 0; i < parts_max; i++)
		DecordCellSet((void*)&BattleGaugePartsCell[ClientType[i]]);
//	DecordCellSet((void*)&BattleGaugeCursorCell);
}

//----------------------------------------------------------
//	BattleGaugeCellPalSetの分割バージョン
//	戻り値で1が返ってくるまでtrans_noに0から順々に大きい数字を入れて毎Sync呼ぶ
//----------------------------------------------------------
u8 BattleGaugeCellPalDivSet(u8 trans_no)
{
	u8 ret = 0;
	
	if(trans_no == 0)
		;
	else if(trans_no == 1){
		ObjPalSet((PalData*)&BattleGaugeDataPal[0]);
		ObjPalSet((PalData*)&BattleGaugeDataPal[1]);
	}
	else{
		if(FightCheck() == 0)
		{
			if(trans_no == 2){
//changed by soga 2002.06.01
				if(FightType&FIGHT_TYPE_SAFARI)
					DecordCellSet((void*)&MineGaugeCell_Safari);
				else
					DecordCellSet((void*)&MineGaugeCell_1vs1);
			}
			else if(trans_no == 3)
				DecordCellSet((void*)&EnemyGaugeCell_1vs1);
			else if(trans_no == 4)
				DecordCellSet((void*)&BattleGaugePartsCell[ClientType[0]]);
			else if(trans_no == 5)
				DecordCellSet((void*)&BattleGaugePartsCell[ClientType[1]]);
			else{
				ret = 1;
			}
		}
		else
		{
			if(trans_no == 2)
				DecordCellSet((void*)&MineGaugeCell_2vs2[0]);
			else if(trans_no == 3)
				DecordCellSet((void*)&MineGaugeCell_2vs2[1]);
			else if(trans_no == 4)
				DecordCellSet((void*)&EnemyGaugeCell_2vs2[0]);
			else if(trans_no == 5)
				DecordCellSet((void*)&EnemyGaugeCell_2vs2[1]);
			else if(trans_no == 6)
				DecordCellSet((void*)&BattleGaugePartsCell[ClientType[0]]);
			else if(trans_no == 7)
				DecordCellSet((void*)&BattleGaugePartsCell[ClientType[1]]);
			else if(trans_no == 8)
				DecordCellSet((void*)&BattleGaugePartsCell[ClientType[2]]);
			else if(trans_no == 9)
				DecordCellSet((void*)&BattleGaugePartsCell[ClientType[3]]);
			else{
				ret = 1;
			}
		}
	}
	return ret;
}

//=========================================================================
//	ｹﾞｰｼﾞ転送ｷｬﾗﾜｰｸﾗﾑへ展開(戦闘画面用)
// flg = 0:HPｹﾞｰｼﾞ&数字  1:EXPｹﾞｰｼﾞ
//now!! 0:HP  1:数字(LV)  2:数字(HP)  3:EXP
//=========================================================================
void BattleGaugeTransWram(u8 flg)
{
	#if GAUGE_DEBUG == 0
	DecordWram((void*)bg_life1_pch_ADRS, (void*)GAUGE_DECORD_ADR);
	#elif 0
	switch(BGNo)
	{
		case 0:
		case 2:
			DecordWram((void*)bg_life1_pch_ADRS, (void*)GAUGE_DECORD_ADR);
			break;
		default:
			DecordWram((void*)bg_life2_pch_ADRS, (void*)GAUGE_DECORD_ADR);
	}
	#else
//	DecordWram((void*)bg_life2_pch_ADRS, (void*)GAUGE_DECORD_ADR);
	DecordWram((void*)btl_gaug_pch_ADRS, (void*)GAUGE_DECORD_ADR);
	#endif
}






//=========================================================================
//	ClientInitの処理を分割転送用に一つの関数にまとめたもの
//	counter = 毎Syncごとにｲﾝｸﾘﾒﾝﾄされていきます。内部で使用
//	counter2 = 同じく内部で使用
//		※↑どちらのｶｳﾝﾀｰも初回は0クリアした状態で渡してください
//
//	戻り値: 0=まだInit中	1:Init終了
//=========================================================================
enum{
	DIV_0_0_0 = 0,
	DIV_0_0,
	DIV_0_1,
	DIV_0,
	DIV_1,
	DIV_2,
	DIV_3,
	DIV_4,
};
u8 ClientDivInit(u8 *counter, u8 *counter2)
{
	u8 ret = 0;

	switch(*counter){
		case DIV_0_0_0:
			ClientSystemWorkInitAll();
			(*counter)++;
			break;
		case DIV_0_0:
			if(BattleGaugeCellPalDivSet(*counter2)){
				*counter2 = 0;
				(*counter)++;
			}else
				(*counter2)++;
			break;
		case DIV_0_1:
			(*counter)++;
			break;
		case DIV_0:
			//ｹﾞｰｼﾞ本体
//changed by soga 2002.06.01
			if((FightType&FIGHT_TYPE_SAFARI)&&(*counter2==0))
				ClientGaugeSt[*counter2] = GaugeActorSetSafari();
			else
				ClientGaugeSt[*counter2] = GaugeActorSet(*counter2);
			if(++(*counter2) == ClientSetMax){
				*counter2 = 0;
				(*counter)++;
			}
			break;
		case DIV_1:
			GaugeDefaultPosSet(*counter2);
			if(ClientType[*counter2] == BSS_CLIENT_MINE 
					|| ClientType[*counter2] == BSS_CLIENT_ENEMY)
				GaugePriSet(ClientGaugeSt[*counter2], 0);
			else
				GaugePriSet(ClientGaugeSt[*counter2], 1);
			if(++(*counter2) == ClientSetMax){
				*counter2 = 0;
				(*counter)++;
			}
			break;
		case DIV_2:
			//ｹﾞｰｼﾞ転送ｷｬﾗｾｯﾄ
			if(MineEnemyCheck(*counter2) == 0){
//changed by soga 2002.06.01
				if((FightType&FIGHT_TYPE_SAFARI)==0)
					GaugeTransChrSet(ClientGaugeSt[*counter2],
								&PokeParaMine[SelMonsNo[*counter2]], G_ALL);
			}
			else
				GaugeTransChrSet(ClientGaugeSt[*counter2],
							&PokeParaEnemy[SelMonsNo[*counter2]], G_ALL);
			GaugeOFF(ClientGaugeSt[*counter2]);
			if(++(*counter2) == ClientSetMax){
				*counter2 = 0;
				(*counter)++;
			}
			break;
//		default:
		case DIV_3:
			//ポケモンの影をｾｯﾄ
			PokeShadowAllDataSet();
			//戦闘用のﾘｽﾄ画面で使用するﾜｰｸの初期化
			BattleListWorkInit();
			ret = 1;
			break;
	}
	return ret;
}


//=========================================================================
//	ｸﾗｲｱﾝﾄで使用するUserWork上に切られるｼｽﾃﾑ構造体の初期化
//=========================================================================
void ClientSystemWorkInit(void)
{
	memset(CliSys, 0, CLIENT_SYSTEM_SIZEOF);
	memset(BtlWork, 0, BTLWORKDATA_SIZEOF);
}

void ClientSystemWorkInitAll(void)
{
	ClientSystemWorkInit();
	memset(Climem, 0, CLIENT_MEMORY_SIZEOF);
}


//=========================================================================
//	ｴﾌｪｸﾄで操作されたﾊﾞﾆｯｼｭﾌﾗｸﾞを画面切り替え時の為、記憶する
//=========================================================================
void PokeBanishMemory(void)
{
	int i;
	
	//ｴﾌｪｸﾄで操作されたﾊﾞﾆｯｼｭﾌﾗｸﾞを画面切り替え時の為、記憶する
	for(i = 0; i < ClientSetMax; i++)
		Climem[i].act_banish = ActWork[PokemonStruct[i]].banish;
}

void PokeClientBanishMemory(u8 client_no)
{
	//ｴﾌｪｸﾄで操作されたﾊﾞﾆｯｼｭﾌﾗｸﾞを画面切り替え時の為、記憶する
	Climem[client_no].act_banish = ActWork[PokemonStruct[client_no]].banish;
}



//=========================================================================
//	変身、変化時のキャラ差し替え
//
// my_clientのキャラをtarget_clientのキャラに変更します。
// flg = 0:変身(技の「へんしん」)	1:変化(お天気ﾎﾟｹﾓﾝの姿変更など)
//=========================================================================

extern u8 PokeEnemyPosY[2][2];

void HensinChrChange(u8 my_client, u8 target_client, u8 flg)
{
	u8 client_type;
	u16 monsno;
	u32 personal_rnd, id_no;
	u16 obj_palpos;
	void *paladrs;

	if(flg){	//へんげ
		ActAnmChg(&ActWork[PokemonStruct[my_client]],BtlWork->work[0]);
		obj_palpos = PA_OBJ0 + 0x10 * my_client;
//		DecordWram((void*)powawan_pcl_ADRS, (void*)&UserWork[0]);
//		PaletteWorkSet((void *)&UserWork[0x20*BtlWork->work[0]],obj_palpos,0x20);
		PaletteWorkSet((void *)&UserWork[POWARUN_PALETTE+0x20*BtlWork->work[0]],obj_palpos,0x20);
		BattlePokeAnmNo[my_client]=BtlWork->work[0];
		if(Climem[my_client].hensin_monsno != 0){
			SoftFade(obj_palpos, 16, HENSIN_EVY, 0x7fff);
			CpuCopy(&PaletteWorkTrans[obj_palpos], &PaletteWork[obj_palpos], 0x20, 32);
		}
		ActWork[PokemonStruct[my_client]].y = GetPokemonYPos(my_client);
	}
	else{		//へんしん
		if(ContestCheck()){	//コンテスト
			client_type = CONT_POKEDECORD_NO;
			monsno = conpara->hensin_monsno;
			personal_rnd = conpara->personal_rnd;
			id_no = conpara->id_no;
			DecordPokeCellMakeBuchi(&PM2BObjDataCell[monsno], pm2bpara[monsno].size,
				pm2bpara[monsno].patcnt, (void*)0x2000000,
				(void*)DecordAdrs[client_type], monsno, conpara->hensin_personal_rnd);
			
		}
		else{				//戦闘
			client_type = ClientTypeGet(my_client);
			if(MineEnemyCheck(target_client) == SIDE_ENEMY)
				monsno=PokeParaGet(&PokeParaEnemy[SelMonsNo[target_client]], ID_monsno);
			else
				monsno= PokeParaGet(&PokeParaMine[SelMonsNo[target_client]], ID_monsno);

			if(MineEnemyCheck(my_client) == SIDE_MINE){
				//↓ﾊﾟｰｿﾅﾙ乱数は自分のを適用
				personal_rnd = PokeParaGet(&PokeParaMine[SelMonsNo[my_client]],
								 ID_personal_rnd);
				id_no = PokeParaGet(&PokeParaMine[SelMonsNo[my_client]], ID_id_no);
	//			DecordPokeCellMake(&PM2BObjDataCell[monsno], pm2bpara[monsno].size,
	//					pm2bpara[monsno].patcnt, (void*)0x2000000,
	//					(void*)DecordAdrs[client_type], monsno);
#if 1
				//へんしんは、専用の個性乱数を引っ張ってくるようにする
				DecordPokeCellMakeBuchi(&PM2BObjDataCell[monsno], pm2bpara[monsno].size,
						pm2bpara[monsno].patcnt, (void*)0x2000000,
						(void*)DecordAdrs[client_type], monsno, HenshinRnd[my_client]);
#else
				DecordPokeCellMakeBuchi(&PM2BObjDataCell[monsno], pm2bpara[monsno].size,
						pm2bpara[monsno].patcnt, (void*)0x2000000,
						(void*)DecordAdrs[client_type], monsno, personal_rnd);
#endif
			}
			else{
	//			monsno= PokeParaGet(&PokeParaMine[SelMonsNo[target_client]], ID_monsno);
				//↓ﾊﾟｰｿﾅﾙ乱数は自分のを適用
				personal_rnd = PokeParaGet(&PokeParaEnemy[SelMonsNo[my_client]],
								 ID_personal_rnd);
				id_no = PokeParaGet(&PokeParaEnemy[SelMonsNo[my_client]], ID_id_no);
#if 1
				//へんしんは、専用の個性乱数を引っ張ってくるようにする
				DecordPokeCellMakeBuchi(&PM2FObjDataCell[monsno], pm2fpara[monsno].size,
						pm2fpara[monsno].patcnt, (void*)0x2000000,
						(void*)DecordAdrs[client_type], monsno, HenshinRnd[my_client]);
#else
				DecordPokeCellMakeBuchi(&PM2FObjDataCell[monsno], pm2fpara[monsno].size,
						pm2fpara[monsno].patcnt, (void*)0x2000000,
						(void*)DecordAdrs[client_type], monsno, personal_rnd);
#endif
			}
		}
		
		//ｱﾆﾒｰｼｮﾝがないので自動転送されないから、ここでコピーした絵をVramに転送
		DIV_DMACOPY(3, DecordAdrs[client_type], 
			OBJ_MODE0_VRAM + ActWork[PokemonStruct[my_client]].oamData.CharNo*32,0x800,32);

		obj_palpos = PA_OBJ0 + 0x10 * my_client;
		paladrs = (void*)PokePalGetPara(monsno, id_no, personal_rnd);
		DecordWram(paladrs, (void*)&UserWork[0]);
		PaletteWorkSet((void *)&UserWork[0], obj_palpos, 0x20);
		//お天気ポケモンは特殊なセットをする
		if(monsno==MONSNO_POWARUN){
//			DecordWram((void*)powawan_pcl_ADRS, (void*)&UserWork[0]);
			DecordWram(paladrs, (void*)&UserWork[POWARUN_PALETTE]);
			PaletteWorkSet((void *)&UserWork[POWARUN_PALETTE+0x20*BattlePokeAnmNo[target_client]],obj_palpos,0x20);
		}
		SoftFade(obj_palpos, 16, HENSIN_EVY, 0x7fff);
		CpuCopy(&PaletteWorkTrans[obj_palpos], &PaletteWork[obj_palpos], 0x20, 32);
	
		if(ContestCheck() == 0){
			Climem[my_client].hensin_monsno = monsno;
			BattlePokeAnmNo[my_client] = BattlePokeAnmNo[target_client];
		}
		ActWork[PokemonStruct[my_client]].y = GetPokemonYPos(my_client);
		ActAnmChg(&ActWork[PokemonStruct[my_client]],BattlePokeAnmNo[my_client]);
	}
}


//=========================================================================
//	身代わり時のキャラ差し替え
//
//	decord_flg = 0:ﾎﾟｹﾓﾝのｷｬﾗを身代わりのｷｬﾗに差し替え
//				 1:身代わりのｷｬﾗをﾎﾟｹﾓﾝのｷｬﾗに戻す
//=========================================================================
void MigawariChrChange(u8 client_no, u8 decord_flg)
{
	u8 client_type;
	int i;
	u16 obj_palpos;
	
//	Climem[my_client].migawari = 1;
	
	if(decord_flg == 0){
		if(ContestCheck())
			client_type = CONT_POKEDECORD_NO;
		else
			client_type = ClientTypeGet(client_no);
			
		if(ContestCheck())
			DecordVram((void*)migawari_b_pch_ADRS, (void*)DecordAdrs[client_type]);
		else if(MineEnemyCheck(client_no))
			DecordVram((void*)migawari_f_pch_ADRS, (void*)DecordAdrs[client_type]);
		else
			DecordVram((void*)migawari_b_pch_ADRS, (void*)DecordAdrs[client_type]);
		for(i = 1; i < 4; i++){
			DIV_DMACOPY(3, DecordAdrs[client_type], 
				DecordAdrs[client_type]+0x800*i, 0x800, 32);
		}
		obj_palpos = PA_OBJ0 + 0x10 * client_no;
		DecordPaletteWork((void*)s_migawari_pcl_ADRS, obj_palpos, 0x20);
		//↓これっているんだっけ？ 2002.08.15(木) matsuda
	//	DecordPaletteWork((void*)s_migawari_pcl_ADRS, PA_BG8 + 0x10 * client_no, 0x20);
	}
	else if(ContestCheck() == 0){
		if(MineEnemyCheck(client_no))
			PokemonFObjCellPalSet(&PokeParaEnemy[SelMonsNo[client_no]], client_no);
		else
			PokemonBObjCellPalSet(&PokeParaMine[SelMonsNo[client_no]], client_no);
	}
}

//----------------------------------------------------------
//	身代わりのｷｬﾗに差し替えて、ﾎﾟｹﾓﾝのY座標のｵﾌｾｯﾄも身代わりのｷｬﾗ用に変更する
//	decord_flg = 0:ﾎﾟｹﾓﾝのｷｬﾗを身代わりのｷｬﾗに差し替え
//				 1:身代わりのｷｬﾗをﾎﾟｹﾓﾝのｷｬﾗに戻す
//	poke = ﾎﾟｹﾓﾝのActNo
//----------------------------------------------------------
void MigawariChange(u8 client_no, u8 decord_flg, u8 poke)
{
	MigawariChrChange(client_no, decord_flg);
	ActAnmChg(&ActWork[poke], BattlePokeAnmNo[client_no]);//Vramに転送するためにｱﾆﾒ
#if 1
	if(decord_flg == 0)
		ActWork[poke].y = GetMigawariYPos(client_no);
	else
		ActWork[poke].y = GetPokemonYPos(client_no);
#else
	ActWork[poke].y = GetPokemonYPos(client_no);
#endif
}

//----------------------------------------------------------
//	技Noが「みがわり」かチェックして、「みがわり」ならば身代わりﾌﾗｸﾞをｾｯﾄする
//----------------------------------------------------------
void MigawariFlgCheckSet(u8 client_no, u16 wazano)
{
	if(wazano == WAZANO_MIGAWARI)
		Climem[client_no].migawari = 1;
}

//----------------------------------------------------------
//	身代わりﾌﾗｸﾞをリセットする
//----------------------------------------------------------
void MigawariFlgReset(u8 client_no)
{
	Climem[client_no].migawari = 0;
}


//=========================================================================
//	現在のHPのｶﾗｰをﾁｪｯｸしてﾋﾟﾝﾁなら警告音を鳴らす
//	ﾋﾟﾝﾁでないなら警告音を鳴らさない(オフする)
//=========================================================================
void PinchSeCheckPlay(PokemonParam *pp, u8 client_no)
{
	u16 hp, hpmax;
	u8 color;
	
	hp = PokeParaGet(pp, ID_hp);
	hpmax = PokeParaGet(pp, ID_hpmax);
	color = GetGaugeDottoColor(hp, hpmax);
	
	if(color == 1){
		if(Climem[client_no].pinch_se == 0){
			if(Climem[client_no ^2].pinch_se == 0)
				SePlay(SE_HINSI);
			Climem[client_no].pinch_se = 1;
		}
	}
	else{
		Climem[client_no].pinch_se = 0;
		if(FightCheck() == 0)
			m4aSongNumStop(SE_HINSI);
		else if(FightCheck() && Climem[client_no^2].pinch_se == 0)
			m4aSongNumStop(SE_HINSI);
	}
}

//----------------------------------------------------------
//	強制的に音をピンチ時の警告音を止める
//----------------------------------------------------------
void PinchSeStop(void)
{
	u8 client_no;
	
	client_no = ClientNoGet(BSS_CLIENT_MINE);
	Climem[client_no].pinch_se = 0;
	if(FightCheck())
		Climem[client_no^2].pinch_se = 0;
	m4aSongNumStop(SE_HINSI);
}

//----------------------------------------------------------
//	ポケモンのゲージのカラーを取得
//----------------------------------------------------------
u8 PokeGaugeColorGet(PokemonParam *pp)
{
	u8 color;
	s16 hp, hpmax;
	
	hp = PokeParaGet(pp, ID_hp);
	hpmax = PokeParaGet(pp, ID_hpmax);
	color = GetGaugeDottoColor(hp, hpmax);
	return color;
}

//----------------------------------------------------------
//	ｹﾞｰｼﾞのｶﾗｰをﾁｪｯｸしてピンチ時の警告音を止める
//		※ﾜｰｸをいじったりはしない。基本的にはポケモンリスト用
//----------------------------------------------------------
void PinchSeCheckStop(void)
{
	u8 client1, client2;
//	u8 color;
//	u8 stop1, stop2;
	u8 pos1, pos2;

	if(sys.FieldBattleFlag == 0)
		return;
	
	client1 = ClientNoGet(BSS_CLIENT_MINE);
	client2 = ClientNoGet(BSS_CLIENT_MINE2);
	pos1 = SearchListRow(SelMonsNo[client1]);
	pos2 = SearchListRow(SelMonsNo[client2]);
	
	//if(ClientPokeExistCheck(client1))
	if(PokeParaGet(&PokeParaMine[pos1], ID_hp) > 0)
		PinchSeCheckPlay(&PokeParaMine[pos1], client1);
	if(FightCheck() && PokeParaGet(&PokeParaMine[pos2], ID_hp) > 0)
		PinchSeCheckPlay(&PokeParaMine[pos2], client2);
}




//=========================================================================
//	全てのポケモンのAffineﾌﾗｸﾞをOFFする。ｱﾌｨﾝﾏﾈｰｼﾞｬｰから開放するわけではない。
//		※技エフェクト用	拡縮するﾎﾟｹﾓﾝはKakusyukuInitをやるので、そこで
//							AffineがONになる。それ以外のはOBJﾚﾝｼﾞｵｰﾊﾞｰ対策として
//							OFFにしておく
// 	引数: 0=拡縮OFF	1=拡縮ON
//=========================================================================
void PokeAffineON_OFF(u8 on_off)
{
	int i;
	
	for(i = 0; i < ClientSetMax; i++)
	{
//		if(PokeBG2taimeCheck(i) == 0)	2002.09.23(月) Existに変更
		if(ClientPokeExistCheck(i) == 0)
			continue;
		ActWork[PokemonStruct[i]].oamData.AffineMode = on_off;
		
		//保持してるｱﾌｨﾝﾃｰﾌﾞﾙNoによってはH,VﾌﾘｯﾌﾟがONになってしまうので
		if(on_off == 0){
			CliSys[i].poke_aff_no = ActWork[PokemonStruct[i]].oamData.AffineParamNo;
			ActWork[PokemonStruct[i]].oamData.AffineParamNo = 0;
		}
		else{
			ActWork[PokemonStruct[i]].oamData.AffineParamNo = CliSys[i].poke_aff_no;
		}
	}
}


//=========================================================================
//	ポケモンの影、Cell,Pal,Actorを全てｾｯﾄ
//=========================================================================
void PokeShadowAllDataSet(void)
{
	u8 client_no;

	DecordCellSet((void*)&PokeShadowCell);	//現状、ﾊﾟﾚｯﾄはHPｹﾞｰｼﾞと一緒
	client_no = ClientNoGet(BSS_CLIENT_ENEMY);
	CliSys[client_no].shadow_act = AddActor(&PokeShadowHeader, 
		GetWazaEffPos(client_no,EFF_X),
		GetWazaEffPos(client_no,EFF_Y)+32,
		200);
	ActWork[CliSys[client_no].shadow_act].work[0] = client_no;
	if(FightCheck()){
		client_no = ClientNoGet(BSS_CLIENT_ENEMY2);
		CliSys[client_no].shadow_act = AddActor(&PokeShadowHeader, 
			GetWazaEffPos(client_no,EFF_X),
			GetWazaEffPos(client_no,EFF_Y)+32,
			200);
		ActWork[CliSys[client_no].shadow_act].work[0] = client_no;
	}
}

//=========================================================================
//	ポケモンの影アクターシーケンス
//	work[0]に対象ﾎﾟｹﾓﾝのclient_noが入ってる
//=========================================================================
void PokeShadowSeq(actWork *xreg)
{
	actWork *pokeAct;
	u8 client_no;
	u8 banish = 0;
	
	client_no = xreg->work[0];
	pokeAct = &ActWork[PokemonStruct[client_no]];
	if(pokeAct->act_sw == 0 || ClientPokeExistCheck(client_no) == 0){
		xreg->move = PokeShadowBanishSeq;
		return;
	}
	if(WazaEffectFlag || pokeAct->banish)
		banish = 1;	//ｴﾌｪｸﾄ中、対象ﾎﾟｹﾓﾝが消えている時は消す
	else if(Climem[client_no].hensin_monsno != 0){
		if(PokeYOfsTbl[Climem[client_no].hensin_monsno] == 0)
			banish = 1;
	}
	if(Climem[client_no].migawari)
		banish = 1;
	
	xreg->x = pokeAct->x;
	xreg->dx = pokeAct->dx;
	
	xreg->banish = banish;
}

void PokeShadowBanishSeq(actWork *xreg)
{
	xreg->banish = 1;
}

//----------------------------------------------------------
//	ポケモンの影シーケンスを起動する
//----------------------------------------------------------
void PokeShadowSeqSet(u8 client_no, u16 monsno)
{
	if(MineEnemyCheck(client_no) == SIDE_MINE)	//add 2002.09.28(土)
		return;
	
	if(Climem[client_no].hensin_monsno != 0)	//add 2002.09.28(土)
		monsno = Climem[client_no].hensin_monsno;
	
	if(PokeYOfsTbl[monsno] != 0)
		ActWork[CliSys[client_no].shadow_act].move = PokeShadowSeq;
	else
		ActWork[CliSys[client_no].shadow_act].move = PokeShadowBanishSeq;
}

//----------------------------------------------------------
//	ポケモンの影シーケンスをﾊﾞﾆｯｼｭ動作にする
//----------------------------------------------------------
void PokeShadowBanishSeqSet(u8 client_no)
{
	ActWork[CliSys[client_no].shadow_act].move = PokeShadowBanishSeq;
}




//=========================================================================
//
//		ウィンドウの空白部分を黒で埋める
//												by matsuda 2002.08.31(土)
//=========================================================================
#define WIN_MASK_DOTTO	0xf
#define MASK_UP			(WIN_MASK_DOTTO<<4)
#define MASK_DOWN		(WIN_MASK_DOTTO)
void BattleWinPaint(void)
{
	u16 *vram;
	int i, s;
	
	vram = (u16*)(BG_VRAM + 0x12*32);	//winキャラ転送位置
	
	for(i = 0; i < 9; i++){	//ウィンドウキャラ9キャラ
		for(s = 0; s < 32/2; s++){
			if(((*vram) & 0xf000) == 0)
				(*vram) |= 0xf000;//MASK_UP;
			if(((*vram) & 0x0f00) == 0)
				(*vram) |= 0x0f00;//MASK_DOWN;
			if(((*vram) & 0x00f0) == 0)
				(*vram) |= 0x00f0;
			if(((*vram) & 0x000f) == 0)
				(*vram) |= 0x000f;
			vram++;
		}
	}
}




//=========================================================================
//
//		ポケモン入れ替え時にクリアすべきフラグをクリアする
//												by matsuda 2002.09.05(木)
//=========================================================================
//----------------------------------------------------------
//	引数：baton_flg = バトンタッチフラグ
//----------------------------------------------------------
void ClientPokeSysFlagClear(u8 client_no, u8 baton_flg)
{
	Climem[client_no].hensin_monsno = 0;	//変身ﾌﾗｸﾞｸﾘｱ
	BattlePokeAnmNo[client_no]=0;		//お天気ポケモン用のアニメーションナンバー初期化
	if(baton_flg == 0)
		MigawariFlgReset(client_no);			//身代わりﾌﾗｸﾞｸﾘｱ
}

