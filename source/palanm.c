
//=========================================================================
//
//		パレットアニメ・フェードアウト、イン
//											01/04/20 by matsuda
//=========================================================================

#include "common.h"
#include "palanm.h"
#include "softfade.h"
#include "ef_tool.h"
#include "decord.h"


//----------------------------------------------------------
//	プロトタイプ宣言	関数＆ﾃﾞｰﾀ
//----------------------------------------------------------
u8 AddPalAnm(const PalAnmData *pAnmDat, u16 pal_no);
u8 PaletteAnime(void);
static void PaletteAnimeEndCheck(PalAnmWorkData *paw);
void DelPalAnm(u16 id_no);
void PalAnmInitWork(u8 pal_anm_no);
void PaletteAnimeInit(void);
void PalAnmPause(u16 id_no);
void PalAnmMove(u16 id_no);
u8 PalAnmGetWorkNumber(u16 id_no);
void PaletteFadeTrans( void );
void PlttCopy(void);
void PaletteAnimeBeforeAfter(u8 trans_type, u32 *PalAnmBit);
static void PaletteAnimeSub(PalAnmWorkData *paw, u32*);
u8 ColorAddSub(void);
static void FadeCheck(PalAnmWorkData *paw, u32 *PalAnmBit);
void FadeWorkInit(void);
u8 LightColorAddSub(void);
static u8 HardColorCalc(void);
static void HardColorRegisterSet(void);
static u8 FadeEndWaitCheck(void);
void LightFadeReqAdj(u8 fade_type, u8 fade_value);
static void LightFadeCommon(u8 fade_type);

//----------------------------------------------------------
//	グローバル変数
//----------------------------------------------------------
u16 PaletteWork[0x200] = {};			//ｵﾘｼﾞﾅﾙ　　BG&OBJﾊﾟﾚｯﾄﾊﾞｯｸｱｯﾌﾟ
u16 PaletteWorkTrans[0x200] = {};		//転送用
PalAnmWorkData PalAnmWork[PAL_ANM_MAX] = {};	//パレットアニメ用ﾜｰｸ
PlttFadeData FadeData = {};				//ﾌｪｰﾄﾞｱｳﾄ、ｲﾝ用構造体
u32 PalAnmFadeBit = 0;	//ﾊﾟﾚｯﾄｱﾆﾒ、ﾌｪｰﾄﾞｲﾝ、ｱｳﾄさせるﾊﾟﾚｯﾄ 各ﾋﾞｯﾄがﾊﾟﾚｯﾄNoに対応

//デバッグ 2002.09.12 TETSU
u16 PaletteWorkTmp[0x200] = {};			//展開テンポラリワーク
//デバッグ
//
//----------------------------------------------------------
//	データ
//----------------------------------------------------------
const PalAnmData DmmyPalAnmDat = 
{
	65535,			//id_no
	0, //*PalData		転送するｶﾗｰﾊﾟﾚｯﾄｱﾄﾞﾚｽ
	PA_BEFORE,      //type			BEFORE:ｶﾗｰ加減算対象　　AFTER:ｶﾗｰ加減算非対象
	PA_BG0+PA_COL0, //pal_no		0～511
	0,              //TransValue	col_noから いくつまでのﾊﾟﾚｯﾄを対象とするか
	0,              //TransWaitDef	次のﾊﾟﾚｯﾄｱﾆﾒに移るまでのｳｪｲﾄ
	0,              //TransValueLoopDef	何回転送を繰り返すか
	PA_END,         //PalAnmSeq		ｱﾆﾒ終了後の処理
	0,             //LoopWaitDef
};




//=========================================================================
//	パレットワークに圧縮されたパレットデータをセット
// 引数:*SrcAdrs = 圧縮されているﾃﾞｰﾀｱﾄﾞﾚｽ
// 		pal_no = 展開する場所  PA_BG0+PA_COL5  PA_OBJ3+PA_COL0 ...等
//		size = ﾊﾞｲﾄｻｲｽﾞ
//=========================================================================
void DecordPaletteWork(void *SrcAdrs, u16 pal_no, u16 size)
{
#if 0
	DecordWram(SrcAdrs, &PaletteWork[pal_no]);
	CpuCopy(&PaletteWork[pal_no], &PaletteWorkTrans[pal_no], size, 16);
#else
	DecordWram(SrcAdrs, &PaletteWorkTmp[0x0000]);
	CpuCopy(&PaletteWorkTmp[0x0000], &PaletteWork[pal_no], size, 16);
	CpuCopy(&PaletteWorkTmp[0x0000], &PaletteWorkTrans[pal_no], size, 16);
#endif
}
//=========================================================================
//	パレットワークに非圧縮のパレットデータをセット
// 引数:*SrcAdrs = 圧縮されているﾃﾞｰﾀｱﾄﾞﾚｽ
// 		pal_no = 展開する場所  PA_BG0+PA_COL5  PA_OBJ3+PA_COL0 ...等
//		size = ﾊﾞｲﾄｻｲｽﾞ
//=========================================================================
void PaletteWorkSet(const u16 *pal_data, u16 pal_no, u16 size)
{
	CpuCopy(pal_data, &PaletteWork[pal_no], size, 16);
	CpuCopy(pal_data, &PaletteWorkTrans[pal_no],size, 16);
}

//=========================================================================
//	パレットワークを指定データでクリアする
// 引数: clear_data = このデータで領域を埋めます。
//		pal_no = ｸﾘｱｰする場所  PA_BG0+PA_COL5  PA_OBJ3+PA_COL0 ...等
//		size = ﾊﾞｲﾄｻｲｽﾞ
//=========================================================================
void PaletteWorkClear(u16 clear_data, u16 pal_no, u16 size)
{
	CpuClear(clear_data, &PaletteWork[pal_no], size, 16);
	CpuClear(clear_data, &PaletteWorkTrans[pal_no], size, 16);
}

/*----------------------------------------------------------*/
/*	Vブランク中の処理										*/
/*	(Vブランク中に常にコールしてください）					*/
/*----------------------------------------------------------*/
void PaletteFadeTrans( void )
{
	if(FadeData.trans_stop == 1)
		return;
	
	DIV_DMACOPY(3, PaletteWorkTrans, PLTT, PLTT_SIZE, 16);
	PalAnmFadeBit = 0;
	if(FadeData.type == 2 && FadeData.fade_sw)
		HardColorRegisterSet();
}

//=========================================================================
//	パレットアニメ		  ※ﾒｲﾝﾙｰﾌﾟ内で呼んでください
// 戻り値: 0=ﾌｪｰﾄﾞﾘｸｴｽﾄがかかってない、又はﾘｸｴｽﾄが終了した
//         1=ﾌｪｰﾄﾞ実行中
//         2=ﾌｪｰﾄﾞﾘｸｴｽﾄはかかっているがｳｪｲﾄ中なので(ﾌｪｰﾄﾞの)処理はしなかった
//      0xff=前回のﾘｸｴｽﾄﾃﾞｰﾀがまだ転送されていない
//=========================================================================
u8 PaletteAnime(void)
{
	u8 temp;
	u32 PalAnmBit = 0;
	
	if(PalAnmFadeBit != 0)
		return 0xff;
	
	if(FadeData.type == 0)
	{
//		PaletteAnimeBeforeAfter(PA_BEFORE, &PalAnmBit);
		temp = ColorAddSub();
//		PaletteAnimeBeforeAfter(PA_AFTER, &PalAnmBit);
	}
	else if(FadeData.type == 1)
	{
//		PaletteAnimeBeforeAfter(PA_BEFORE, &PalAnmBit);
		temp = LightColorAddSub();
//		PaletteAnimeBeforeAfter(PA_AFTER, &PalAnmBit);
	}
	else
	{
//		PaletteAnimeBeforeAfter(PA_BEFORE, &PalAnmBit);
		temp = HardColorCalc();
//		PaletteAnimeBeforeAfter(PA_AFTER, &PalAnmBit);
	}
	
	PalAnmFadeBit = PalAnmBit | FadeData.fade_bit;
	return temp;
}
//----------------------------------------------------------
//	ﾊﾟﾚｯﾄｱﾆﾒﾜｰｸ&ﾌｪｰﾄﾞﾘｸｴｽﾄ用ﾜｰｸ全初期化
//----------------------------------------------------------
void PaletteAnimeInit(void)
{
	u8 i;
	
	for(i = 0; i < PAL_ANM_MAX; i++)
	{
		PalAnmInitWork(i);
	}
	FadeWorkInit();
}
//----------------------------------------------------------
//	PLTT_VRAMのﾃﾞｰﾀを全てPaletteWorkにｺﾋﾟｰ
//----------------------------------------------------------
void PlttCopy(void)
{
	u16 i;
	u16 *dest;
	
	dest = (u16 *)PLTT;
	
	for(i = 0; i < 0x200; i++)
	{
		PaletteWork[i] = dest[i];
		PaletteWorkTrans[i] = dest[i];
	}
}

//----------------------------------------------------------
//	パレット加減算リクエスト  ※ﾘｸｴｽﾄが重なった場合は先勝ちです
//
// fade_bit : パレットを指定（各ビットがパレット番号に対応
//			  ビット0 = BGの0パレット、 Bit16 = OBJの0パレット)
// wait : 値を大きくするとゆっくりﾌｪｰﾄﾞｱｳﾄ、ｲﾝします。
//		  値を小さくすると早くﾌｪｰﾄﾞｱｳﾄ、ｲﾝします。
// start_evy : 最初の色の濃度を指定します(0～16)
// 			   0(元の色)～2,3..(中間色)～16(指定した色)
// end_evy : ﾌｪｰﾄﾞ計算後の最終的な色の濃度を指定します。引数の値は↑と同じです
// next_rgb : 変更後の色を指定
//
// 戻り値: 1=正常終了  0=ｴﾗｰ
//----------------------------------------------------------
u8 PaletteFadeReq(u32 fade_bit, s8 wait, u8 start_evy, u8 end_evy, u16 next_rgb)
{
	u8 temp;
	
	if(FadeData.fade_sw == 1)
		return 0;
	
	FadeData.fade_value = 2;
	if(wait < 0){	//waitがﾏｲﾅｽの時はvalueを大きくしてﾌｪｰﾄﾞを早くする
		FadeData.fade_value += abs(wait);
		wait = 0;
	}
	
	FadeData.fade_bit = fade_bit;
	FadeData.wait = wait;			//初回はﾘｸｴｽﾄかけた瞬間に実行
	FadeData.wait_def = wait;
	FadeData.now_evy = start_evy;
	FadeData.end_evy = end_evy;
	FadeData.next_rgb = next_rgb;
	FadeData.fade_sw = 1;
	FadeData.type = 0;
	if(start_evy < end_evy)
		FadeData.direction = 0;
	else
		FadeData.direction = 1;
	
	PaletteAnime();		//add 2001.06.26(火) ﾘｸｴｽﾄしてすぐに反映させるよう変更
	
	temp = FadeData.trans_stop;
	FadeData.trans_stop = 0;

	//PaletteFadeTrans();	//add 2001.06.26(火)
	CpuCopy(PaletteWorkTrans, PLTT, PLTT_SIZE, 32);
	PalAnmFadeBit = 0;
	if(FadeData.type == 2 && FadeData.fade_sw)
		HardColorRegisterSet();
	
	FadeData.trans_stop = temp;
	
	return 1;
}

u8 PaletteFadeReq2(u32 fade_bit, s8 wait, u8 start_evy, u8 end_evy, u16 next_rgb)
{
	u8 temp;
	
	PlttCopy();
	temp = PaletteFadeReq(fade_bit, wait, start_evy, end_evy, next_rgb);
	return temp;
}

//=========================================================================
//	パレットアニメ メイン
//=========================================================================
void PaletteAnimeBeforeAfter(u8 trans_type, u32 *PalAnmBit)
{
	u8 i;
	PalAnmWorkData *paw;
	
	for(i = 0; i < PAL_ANM_MAX; i++)
	{
		paw = &PalAnmWork[i];

		if(paw->pal_sw == 0 || paw->PalAnmDat->type != trans_type)
			continue;
		
		if(paw->TransValueLoop == paw->PalAnmDat->TransValueLoopDef)
		{
			PaletteAnimeEndCheck(paw);
			if(paw->pal_sw == 0)	//↑のEndCheckでDelされた時のため
				continue;
		}

		if(paw->TransWait == 0)
		{
			PaletteAnimeSub(paw, PalAnmBit);
		}
		else
		{
			paw->TransWait--;
		}
		
		FadeCheck(paw, PalAnmBit);
	}
}

//----------------------------------------------------------
//	パレットアニメ ｳｪｲﾄをﾁｪｯｸしてﾜｰｸへ転送
//----------------------------------------------------------
static void PaletteAnimeSub(PalAnmWorkData *paw, u32 *PalAnmBit)
{
	u8 trans_value = 0;
	u16 now_pal;
	
	now_pal = paw->TransValueLoop * paw->PalAnmDat->TransValue;
	
	if(paw->PalAnmDat->type == PA_BEFORE)
	{
		while(trans_value < paw->PalAnmDat->TransValue)
		{
			PaletteWork[paw->pal_no]
						= paw->PalAnmDat->PalData[now_pal];
			PaletteWorkTrans[paw->pal_no]
						= paw->PalAnmDat->PalData[now_pal];
			trans_value++;
			paw->pal_no++;
			now_pal++;
		}
	}
	else	//PA_AFTER
	{
		while(trans_value < paw->PalAnmDat->TransValue)
		{
			PaletteWorkTrans[paw->pal_no]
						= paw->PalAnmDat->PalData[now_pal];
			trans_value++;
			paw->pal_no++;
			now_pal++;
		}
	}
	
	paw->pal_no = paw->pal_no_def;
	paw->TransWait = paw->PalAnmDat->TransWaitDef;
	
	//if(paw->TransValueLoop < paw->PalAnmDat->TransValueLoopDef)
		paw->TransValueLoop++;
	//else
	if(paw->TransValueLoop >= paw->PalAnmDat->TransValueLoopDef)
	{
		if(paw->LoopWait)
			paw->LoopWait--;
		paw->TransValueLoop = 0;
	}
	
	*PalAnmBit |= GET_PALNO_BIT(paw->pal_no_def);
//	BIT_SET(*PalAnmBit, paw->pal_no_def >> 4);	//変更したﾊﾟﾚｯﾄのﾋﾞｯﾄをｾｯﾄ
}

//----------------------------------------------------------
//	ﾌｪｰﾄﾞとﾊﾟﾚｯﾄｱﾆﾒが同時に動くときの加減算補正
//----------------------------------------------------------
static void FadeCheck(PalAnmWorkData *paw, u32 *PalAnmBit)
{
	u8 i;
	u16 now_pal;
	
	if(FadeData.fade_sw == 0 
		|| ((GET_PALNO_BIT(paw->pal_no_def) & FadeData.fade_bit) == 0))
	{
		return;
	}
	
	if(paw->PalAnmDat->type == PA_BEFORE)
	{
		if(FadeData.wait == FadeData.wait_def)
			return;		//ﾌｪｰﾄﾞで勝手に減色されるのでOK
		
		//ﾌｪｰﾄﾞがｳｪｲﾄで実行されないのでここでやる
		SoftFade(paw->pal_no_def, paw->PalAnmDat->TransValue,
				FadeData.now_evy, FadeData.next_rgb);
	}
	else	//PA_AFTER
	{
		if(FadeData.wait > 0)
			return;		//ﾌｪｰﾄﾞが実行されないので減色されない
		
		if(paw->TransWait == paw->PalAnmDat->TransWaitDef)
			return;		//ﾃﾞｰﾀが転送されたのでOK
		
		//ﾌｪｰﾄﾞで減色されてしまっているので転送しなおす
		now_pal = paw->TransValueLoop * paw->PalAnmDat->TransValue;
		for(i = 0; i < paw->PalAnmDat->TransValue; i++)
		{
			PaletteWorkTrans[paw->pal_no_def+i] = paw->PalAnmDat->PalData[now_pal+i];
			//now_pal++;
		}
	}
}

//----------------------------------------------------------
//	全てのﾙｰﾌﾟ処理が終わった後の処理
//----------------------------------------------------------
static void PaletteAnimeEndCheck(PalAnmWorkData *paw)
{
	if(paw->LoopWait == 0)
	{
		switch(paw->PalAnmDat->PalAnmSeq)
		{
			case PA_LOOP:
				paw->TransValueLoop = 0;
				paw->TransWait = paw->PalAnmDat->TransWaitDef;
				paw->LoopWait = paw->PalAnmDat->LoopWaitDef;
				paw->pal_no = paw->pal_no_def;
				break;
			case PA_OUFUKU:
			case PA_END:
				DelPalAnm(paw->PalAnmDat->id_no);
				break;
			default:
		}
	}
	else
	{
		paw->LoopWait--;
	}
}
//----------------------------------------------------------
//	指定したIDのパレットアニメを削除
//----------------------------------------------------------
void DelPalAnm(u16 id_no)
{
	u8 i;
	
	if((i = PalAnmGetWorkNumber(id_no)) == PAL_ANM_MAX)
		return;		//error
	PalAnmInitWork(i);
}
//----------------------------------------------------------
//	パレットアニメ単発初期化
//----------------------------------------------------------
void PalAnmInitWork(u8 pal_anm_no)
{
	PalAnmWork[pal_anm_no].PalAnmDat = (PalAnmData *)&DmmyPalAnmDat;
	PalAnmWork[pal_anm_no].pal_sw = 0;
	PalAnmWork[pal_anm_no].pal_no_def = 0;
	PalAnmWork[pal_anm_no].pal_no = 0;
	PalAnmWork[pal_anm_no].TransValueLoop = 0;
	PalAnmWork[pal_anm_no].pause = 0;
	PalAnmWork[pal_anm_no].TransWait = 0;
	PalAnmWork[pal_anm_no].LoopWait = 0;
}
//----------------------------------------------------------
//	ﾌｪｰﾄﾞﾘｸｴｽﾄﾜｰｸ初期化
//----------------------------------------------------------
void FadeWorkInit(void)
{
	FadeData.fade_bit = 0;
	FadeData.wait_def = 0;
	FadeData.wait = 0;
	FadeData.now_evy = 0;
	FadeData.end_evy = 0;
	FadeData.next_rgb = 0;
	FadeData.fade_sw = 0;
	FadeData.direction = 0;
	FadeData.trans_stop = 0;
	FadeData.reset_flg = 0;
	FadeData.hard_end = 0;
	FadeData.fade_end = 0;
	FadeData.end_wait = 0;
	FadeData.bg_obj = 0;
	FadeData.fade_value = 2;
}
//----------------------------------------------------------
//	指定したIDのパレットアニメを止める
// 登録されているPalAnmWorkの配列番号が分かっているなら直接いじった方が早い
//----------------------------------------------------------
void PalAnmPause(u16 id_no)
{
	u8 i;
	
	if((i = PalAnmGetWorkNumber(id_no)) == PAL_ANM_MAX)
		return;		//error
	PalAnmWork[i].pause = 1;
}
//----------------------------------------------------------
//	指定したIDのPauseで止めていたﾊﾟﾚｯﾄｱﾆﾒを動かす
// 登録されているPalAnmWorkの配列番号が分かっているなら直接いじった方が早い
//----------------------------------------------------------
void PalAnmMove(u16 id_no)
{
	u8 i;
	
	if((i = PalAnmGetWorkNumber(id_no)) == PAL_ANM_MAX)
		return;		//error
	
	PalAnmWork[i].pause = 0;
}
//----------------------------------------------------------
//	IDからPalAnmWorkの配列番号を出す
//----------------------------------------------------------
u8 PalAnmGetWorkNumber(u16 id_no)
{
	u8 i;
	
	for(i = 0; i < PAL_ANM_MAX; i++)
	{
		if(PalAnmWork[i].PalAnmDat->id_no == id_no)
			return i;
	}
	return PAL_ANM_MAX;	//error
}


//----------------------------------------------------------
//	ソフトフェードイン、アウト(ﾊﾟﾚｯﾄｱﾆﾒﾙｰﾁﾝ用)
// 戻り値: 0=ﾌｪｰﾄﾞﾘｸｴｽﾄがかかってない、又はﾘｸｴｽﾄが終了した
//         1=ﾌｪｰﾄﾞ実行中
//         2=ﾌｪｰﾄﾞﾘｸｴｽﾄはかかっているがｳｪｲﾄ中なので処理はしなかった
//----------------------------------------------------------
#include "softfade.h"
u8 ColorAddSub(void)
{
	u16 offset2;
	u16 next_rgb;
	u32 fade_bit;
	s8  evy;
	
	if(FadeData.fade_sw == 0)
		return 0;
	if(FadeEndWaitCheck())
		return FadeData.fade_sw;
	
	if(FadeData.bg_obj == 0){
		if(FadeData.wait < FadeData.wait_def)
		{
			FadeData.wait++;
			return 2;
		}
		else
			FadeData.wait = 0;
	}

	offset2 = 0;
	next_rgb = FadeData.next_rgb;

	if(FadeData.bg_obj == 0)
		fade_bit = FadeData.fade_bit & 0xffff;
	else{
		fade_bit = FadeData.fade_bit >> 16;
		offset2 = 16*16;
	}
	while(fade_bit)
	{
		if(fade_bit & 1)
			SoftFade(offset2, 16, FadeData.now_evy, FadeData.next_rgb);
		fade_bit >>= 1;
		offset2 += 16;
	}
	FadeData.bg_obj ^= 1;
	if(FadeData.bg_obj)
		return FadeData.fade_sw;

	if(FadeData.now_evy == FadeData.end_evy)
	{
		FadeData.fade_bit = 0;
		//FadeData.fade_sw = 0;
		FadeData.fade_end = 1;
	}
	else if(FadeData.direction == 0)
	{
		evy = FadeData.now_evy;	//31を超えるとｵｰﾊﾞｰﾌﾛｰを起こすので
		evy += FadeData.fade_value;
		if(evy > FadeData.end_evy)
			evy = FadeData.end_evy;
		FadeData.now_evy = evy;
	}
	else
	{
		evy = FadeData.now_evy;	//ﾏｲﾅｽを取るため
		evy -= FadeData.fade_value;
		if(evy < FadeData.end_evy)
			evy = FadeData.end_evy;
		FadeData.now_evy = evy;
	}
	return FadeData.fade_sw;
}







//=========================================================================
//	カラー反転						2001.06.26(火)
// 引数:　bit = カラー反転する対象ﾊﾟﾚｯﾄ   0bit:BGPalette0   16bit:ObjPalette0
//=========================================================================
void ColorReversal(u32 bit)
{
	u16 i = 0;
	u8 j;
	
	while(bit)
	{
		if(bit & 1)
		{
			for(j = 0; j < 16; j++)
				PaletteWorkTrans[i + j] ^= 0xffff;
		}
		bit >>= 1;
		i += 16;
	}
}

//=========================================================================
//	カラー加算						2001.06.29
// 引数:　bit = カラー加算する対象ﾊﾟﾚｯﾄ   0bit:BGPalette0   16bit:ObjPalette0
//=========================================================================
void ColorRandomPlus(u32 bit,s8 red,s8 green, s8 blue)
{
	u16 i = 0;
	u8 j;
	PlttData *p;
	
	while(bit)
	{
		if(bit & 1)
		{
			for(j = 0; j < 16; j++){
				p = (PlttData*)&(PaletteWorkTrans[i + j]);
				p->Red+=red;
				p->Green+=green;
				p->Blue+=blue;
			}
		}
		bit >>= 1;
		i += 16;
	}
}

//=========================================================================
//	カラー加算の後始末					2001.06.29
// 引数:　bit = 戻す対象ﾊﾟﾚｯﾄ   0bit:BGPalette0   16bit:ObjPalette0
//=========================================================================
void ColorRandomPlusEnd(u32 bit)
{
	u16 i = 0;
	u8 j;
	
	while(bit)
	{
		if(bit & 1)
		{
			for(j = 0; j < 16; j++)
				PaletteWorkTrans[i + j] = PaletteWork[i+j];
		}
		bit >>= 1;
		i += 16;
	}
}


//=========================================================================
//	黒と白のみに用途をしぼった高速フェード関数
// fade_type = どのﾌｪｰﾄﾞを行うか
//			   W_to_N:白→ﾉｰﾏﾙ  N_to_W:ﾉｰﾏﾙ→白  B_to_N:黒→ﾉｰﾏﾙ  N_to_B:ﾉｰﾏﾙ→黒
//=========================================================================
void LightFadeReq(u8 fade_type)
{
	FadeData.fade_value = 2;
	LightFadeCommon(fade_type);
}

//----------------------------------------------------------
//	LightFadeReq, LightFadeReqSync共通処理
//----------------------------------------------------------
static void LightFadeCommon(u8 fade_type)
{
	FadeData.now_evy = 31;
	FadeData.wait_def = fade_type;
	FadeData.fade_sw = 1;
	FadeData.type = 1;
	
	if(fade_type == B_to_N)
		CpuArrayClear(0, PaletteWorkTrans, 16)
	if(fade_type == W_to_N)
		CpuArrayClear(0x7fff, PaletteWorkTrans, 16);
	PaletteAnime();		//ﾘｸｴｽﾄしてすぐに反映させるよう変更
}

//----------------------------------------------------------
//	ソフトフェードイン、アウト(ﾊﾟﾚｯﾄｱﾆﾒﾙｰﾁﾝ用)
// 戻り値: 0=ﾌｪｰﾄﾞﾘｸｴｽﾄがかかってない、又はﾘｸｴｽﾄが終了した
//         1=ﾌｪｰﾄﾞ実行中
//----------------------------------------------------------

u8 LightColorAddSub(void)
{
	u16 i;
	u16 start_pal, end_pal;
	s8 red,green,blue,t_red,t_green,t_blue;
	
	if(FadeData.fade_sw == 0)
		return 0;
	if(FadeEndWaitCheck())
		return FadeData.fade_sw;

	if(FadeData.bg_obj){
		start_pal = 0x100;
		end_pal = 0x200;
	}else{
		start_pal = 0;
		end_pal = 0x100;
	}

	switch(FadeData.wait_def)
	{
		case W_to_N:
			for(i = start_pal; i < end_pal; i++)
			{
				red = ((PlttData*)&PaletteWork[i])->Red;
				green = ((PlttData*)&PaletteWork[i])->Green;
				blue = ((PlttData*)&PaletteWork[i])->Blue;
				t_red = ((PlttData*)&PaletteWorkTrans[i])->Red-2;
				t_green = ((PlttData*)&PaletteWorkTrans[i])->Green-2;
				t_blue = ((PlttData*)&PaletteWorkTrans[i])->Blue-2;
				if(t_red < red)
					t_red = red;
				if(t_green < green)
					t_green = green;
				if(t_blue < blue)
					t_blue = blue;
				PaletteWorkTrans[i] = t_red | (t_green<<5) | (t_blue<<10);
			}
			break;
		case N_to_W:
			for(i = start_pal; i < end_pal; i++)
			{
				t_red = ((PlttData*)&PaletteWorkTrans[i])->Red+2;
				t_green = ((PlttData*)&PaletteWorkTrans[i])->Green+2;
				t_blue = ((PlttData*)&PaletteWorkTrans[i])->Blue+2;
				if(t_red > 31)
					t_red = 31;
				if(t_green > 31)
					t_green = 31;
				if(t_blue > 31)
					t_blue = 31;
				PaletteWorkTrans[i] = t_red | (t_green<<5) | (t_blue<<10);
			}
			break;
		case B_to_N:
			for(i = start_pal; i < end_pal; i++)
			{
				red = ((PlttData*)&PaletteWork[i])->Red;
				green = ((PlttData*)&PaletteWork[i])->Green;
				blue = ((PlttData*)&PaletteWork[i])->Blue;
				t_red = ((PlttData*)&PaletteWorkTrans[i])->Red+2;
				t_green = ((PlttData*)&PaletteWorkTrans[i])->Green+2;
				t_blue = ((PlttData*)&PaletteWorkTrans[i])->Blue+2;
				if(t_red > red)
					t_red = red;
				if(t_green > green)
					t_green = green;
				if(t_blue > blue)
					t_blue = blue;
				PaletteWorkTrans[i] = t_red | (t_green<<5) | (t_blue<<10);
			}
			break;
		case N_to_B:
			for(i = start_pal; i < end_pal; i++)
			{
				t_red = ((PlttData*)&PaletteWorkTrans[i])->Red-2;
				t_green = ((PlttData*)&PaletteWorkTrans[i])->Green-2;
				t_blue = ((PlttData*)&PaletteWorkTrans[i])->Blue-2;
				if(t_red < 0)
					t_red = 0;
				if(t_green < 0)
					t_green = 0;
				if(t_blue < 0)
					t_blue = 0;
				PaletteWorkTrans[i] = t_red | (t_green<<5) | (t_blue<<10);
			}
			break;
	}
	
	FadeData.bg_obj ^= 1;
	if(FadeData.bg_obj)
		return FadeData.fade_sw;

	if(FadeData.now_evy - FadeData.fade_value < 0)
		FadeData.now_evy = 0;
	else
		FadeData.now_evy -= FadeData.fade_value;
	if(FadeData.now_evy == 0)
	{
		switch(FadeData.wait_def)
		{	//少数切り捨ての影響で完全にその色にはならないので
			case W_to_N:
			case B_to_N:
				CpuArrayCopy(PaletteWork, PaletteWorkTrans, 32);
				break;
			case N_to_W:
				CpuArrayClear(0xffffffff, PaletteWorkTrans, 32);
				break;
			case N_to_B:
				CpuArrayClear(0, PaletteWorkTrans, 32);
				break;
		}
		FadeData.type = 0;
		//FadeData.fade_sw = 0;
		FadeData.fade_end = 1;
	}

	return FadeData.fade_sw;
}








//----------------------------------------------------------
//	ハードによるパレット加減算リクエスト
//
// fade_bit : 加減算の対象にするBG,OBJを指定(BLDCNTﾚｼﾞｽﾀの第1対象ﾋﾟｸｾﾙに設定するﾋﾞｯﾄ)
//				6,7bit:光度変更ｱｯﾌﾟ、ﾀﾞｳﾝﾋﾞｯﾄ(10:UP	 11:DOWN)
//				5bit:BD(ﾊﾞｯｸｸﾞﾗｳﾝﾄﾞ), 4bit:OBJ, 3:BG3, 2:BG2, 1:BG1, 0:BG0
//
// wait : 値を大きくするとゆっくりﾌｪｰﾄﾞｱｳﾄ、ｲﾝします (MAX:63)
// start_evy : 最初の色の濃度を指定します(0～16)
// 			   0(元の色)～2,3..(中間色)～16(黒、もしくは白)
// end_evy : 最終的な色の濃度を指定します。引数の値は↑と同じです
// reset_flg : ﾌｪｰﾄﾞ終了時にﾚｼﾞｽﾀｰの初期化をするか(0:しない  1:する)
//----------------------------------------------------------
void HardFadeReq(u8 fade_bit, u8 wait, u8 start_evy, u8 end_evy, u8 reset_flg)
{
	FadeData.fade_bit = fade_bit;
	FadeData.wait = wait;			//初回はﾘｸｴｽﾄかけた瞬間に実行
	FadeData.wait_def = wait;
	FadeData.now_evy = start_evy;
	FadeData.end_evy = end_evy;
	FadeData.fade_sw = 1;
	FadeData.type = 2;				//RegisterFade
	FadeData.reset_flg = reset_flg;
	FadeData.hard_end = 0;
	if(start_evy < end_evy)
		FadeData.direction = 0;
	else
		FadeData.direction = 1;
}

//----------------------------------------------------------
//	レジスターフェードイン、アウト(ﾊﾟﾚｯﾄｱﾆﾒﾙｰﾁﾝ用)
// 戻り値: 0=ﾌｪｰﾄﾞﾘｸｴｽﾄがかかってない、又はﾘｸｴｽﾄが終了した
//         1=ﾌｪｰﾄﾞ実行中
//         2=ﾌｪｰﾄﾞﾘｸｴｽﾄはかかっているがｳｪｲﾄ中なので処理はしなかった
//----------------------------------------------------------
static u8 HardColorCalc(void)
{
	s8  evy;
	
	if(FadeData.fade_sw == 0)
		return 0;

	if(FadeData.wait < FadeData.wait_def)
	{
		FadeData.wait++;
		return 2;
	}
	else
		FadeData.wait = 0;

	if(FadeData.direction == 0){
		FadeData.now_evy++;
		if(FadeData.now_evy > FadeData.end_evy){
			FadeData.hard_end++;
			FadeData.now_evy--;
		}
	}
	else
	{
		evy = FadeData.now_evy;	//ﾏｲﾅｽを取るため
		FadeData.now_evy--;
		evy--;
		if(evy < FadeData.end_evy){
			FadeData.hard_end++;
			FadeData.now_evy++;
		}
	}
	
	if(FadeData.hard_end){
		//FadeData.fade_sw = 0;		HardColorRegisterSet関数の中で落とすので
		//FadeData.fade_bit = 0;
		if(FadeData.reset_flg){
			FadeData.fade_bit = 0;
			FadeData.now_evy = 0;
		}
		FadeData.reset_flg = 0;
	}
	return FadeData.fade_sw;
}

static void HardColorRegisterSet(void)
{
	*(vu16 *)REG_BLDCNT = FadeData.fade_bit;
	*(vu16 *)REG_BLDY = FadeData.now_evy;
	if(FadeData.hard_end){
		FadeData.hard_end = 0;
		FadeData.type = 0;
		FadeData.fade_bit = 0;
		FadeData.now_evy = 0;
		FadeData.fade_sw = 0;
	}
}





//=========================================================================
//	ﾌｪｰﾄﾞ終了後、一定Syncｳｪｲﾄを入れる
//	戻り値: 0=まだﾌｪｰﾄﾞ終了してない		1=ｳｪｲﾄ中
//=========================================================================
static u8 FadeEndWaitCheck(void)
{
	if(FadeData.fade_end){
		if(FadeData.end_wait == FADE_END_WAIT){
			FadeData.fade_sw = 0;
			FadeData.fade_end = 0;
			FadeData.end_wait = 0;
		}else
			FadeData.end_wait++;
		return 1;
	}
	return 0;
}




//=========================================================================
//	指定ビットのカラーパレットを呼ばれた瞬間に指定色、指定濃度に変更する
//
// fade_bit : パレットを指定（各ビットがパレット番号に対応
//			  ビット0 = BGの0パレット、 Bit16 = OBJの0パレット)
// start_evy : 変更後の色の濃度を指定します(0～16)
// 			   0(元の色)～2,3..(中間色)～16(指定した色)
// next_rgb : 変更後の色を指定
//=========================================================================
void ColorConceChange(u32 fade_bit, u8 evy, u16 next_rgb)
{
	u16 offset = 0;
	
	while(fade_bit){
		if(fade_bit & 1)
			SoftFade(offset, 16, evy, next_rgb);
		fade_bit >>= 1;
		offset += 16;
	}
}



//=========================================================================
//	指定ビットのカラーパレットを呼ばれた瞬間に指定色、指定濃度に変更する
// ※指定されていないﾋﾞｯﾄのﾊﾟﾚｯﾄは元の色に戻ります。
// fade_bit : パレットを指定（各ビットがパレット番号に対応
//			  ビット0 = BGの0パレット、 Bit16 = OBJの0パレット)
// start_evy : 変更後の色の濃度を指定します(0～16)
// 			   0(元の色)～2,3..(中間色)～16(指定した色)
// next_rgb : 変更後の色を指定
//=========================================================================
void ColorConceChange2(u32 fade_bit, u8 evy, u16 next_rgb)
{
	DIV_DMACOPY(3, PaletteWork, PaletteWorkTrans, 0x400, 32);
	ColorConceChange(fade_bit, evy, next_rgb);
}

