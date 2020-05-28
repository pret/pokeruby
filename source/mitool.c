//<mitool.c>
//////////////////////////////////////////////////////////////////
//
//	BGコントロール関係
//
//									2002.05.30.	by Miyuki Iwasawa
//////////////////////////////////////////////////////////////////

#include "mitool.h"

//////////////////////////////////////////////////////////////////
//	カラー単位のアニメ
//////////////////////////////////////////////////////////////////
#if 0
static void ColAnmWorkClear(ColAnmWork *pWork)
{
	pWork->st_flg = 0;
	pWork->live_sw = 0;

	pWork->uc_wCt = pWork->uc_dCt = 0;
	pWork->dx = 0;

	memset(&(pWork->dat),0,sizeof(ColAnmData));
}
#endif
void ColorAnimeInit(ColorAnime *pCAnm)
{
	pCAnm->uc_flg = 0;
	pCAnm->w_actsw = 0;

	memset(pCAnm->work,0,sizeof(ColAnmWork)*COLANM_MAX);
}
u8 AddColorAnime(ColorAnime *pCAnm,u8 no,ColAnmData *pData)
{
	if(no >= COLANM_MAX) return 0xFF;			//無効ナンバー
	if(pCAnm->work[no].live_sw) return 0xFF;	//すでにデータが在る
	
	//パラメータを取得
	pCAnm->work[no].dat.col		= pData->col;
	pCAnm->work[no].dat.w_colNo = pData->w_colNo;
	pCAnm->work[no].dat.uc_num	= pData->uc_num;
	pCAnm->work[no].dat.uc_wait = pData->uc_wait;
	pCAnm->work[no].dat.uc_loop = pData->uc_loop;
	
	pCAnm->work[no].dat.nStep	= pData->nStep;
	pCAnm->work[no].dat.type	= pData->type;
	pCAnm->work[no].dat.dir		= pData->dir;

	//ワークエリア初期化
	pCAnm->work[no].st_flg = 0;
	pCAnm->work[no].live_sw = 1;

	pCAnm->work[no].uc_wCt = pCAnm->work[no].uc_dCt = 0;

	if(pCAnm->work[no].dat.dir) pCAnm->work[no].dx = -1;
	else						pCAnm->work[no].dx = 1;

	return no;
}
u8 DelColorAnime(ColorAnime* pCAnm,u8 no)
{
	if(no >= COLANM_MAX) return 0xFF;			//無効ナンバー
	if(!pCAnm->work[no].live_sw) return 0xFF;	//データがない

	memset(&(pCAnm->work[no]),0,sizeof(ColAnmWork));
	return no;
}
//明度の上げ下げアニメーション
static u8 color_anime(ColAnmWork *pWork)
{
	u8	i = 0;
	_rgb	*col,*org;
	
	for(i = 0;i < pWork->dat.uc_num;i++)
	{
		col = (_rgb *)&(PaletteWorkTrans[pWork->dat.w_colNo+i]);
		org = (_rgb *)&(PaletteWork[pWork->dat.w_colNo+i]);
		switch(pWork->st_flg)
		{
		case 1:		//行き
			if(col->r+pWork->dx <= 31 && col->r+pWork->dx >= 0)col->r += pWork->dx;
			if(col->g+pWork->dx <= 31 && col->g+pWork->dx >= 0)col->g += pWork->dx;
			if(col->b+pWork->dx <= 31 && col->b+pWork->dx >= 0)col->b += pWork->dx;
			break;
		case 2:		//帰り
			if(pWork->dx < 0){
				if(col->r+pWork->dx >= org->r) col->r += pWork->dx;
				if(col->g+pWork->dx >= org->g) col->g += pWork->dx;
				if(col->b+pWork->dx >= org->b) col->b += pWork->dx;
			}
			else{
				if(col->r+pWork->dx <= org->r) col->r += pWork->dx;
				if(col->g+pWork->dx <= org->g) col->g += pWork->dx;
				if(col->b+pWork->dx <= org->b) col->b += pWork->dx;
			}
			break;
		}
	}
	if(pWork->uc_dCt++ != (u8)(pWork->dat.nStep)) return 0;

	pWork->uc_dCt = 0;	//カウンタリセット
	pWork->dx *= -1;
	if(pWork->st_flg == 1)	pWork->st_flg++;
	else					pWork->st_flg--;

	return 1;
}
//オリジナルと指定色の点滅
static u8 color_anime2(ColAnmWork *pWork)
{
	u8	i = 0;
	
	switch(pWork->st_flg)
	{
	case 1:
		for(i = 0;i < pWork->dat.uc_num;i++){
			PaletteWorkTrans[pWork->dat.w_colNo+i] = pWork->dat.col;
		}
		pWork->st_flg++;
		break;
	case 2:
		for(i = 0;i < pWork->dat.uc_num;i++){
			PaletteWorkTrans[pWork->dat.w_colNo+i] = 
				PaletteWork[pWork->dat.w_colNo+i];
		}
		pWork->st_flg--;
		break;
	}
	return 1;
}

//PaleteFadeTransの前に呼ぶ
void ColorAnimeLum(ColorAnime *pCAnm)
{
	u8	i = 0;
	
	if(!pCAnm->uc_flg) return;

	for(i = 0;i < COLANM_MAX;i++)
	{
		if(!((pCAnm->w_actsw >> i) & 0x0001) ) continue;

		//アニメ処理
//		if(pCAnm->work[i].uc_wCt++ == pCAnm->work[i].dat.uc_wait){
		if(pCAnm->work[i].uc_wCt-- == 0){
			if(pCAnm->work[i].dat.col & 0x8000){
				color_anime(&(pCAnm->work[i]));
			}
			else{
				color_anime2(&(pCAnm->work[i]));
			}
//			pCAnm->work[i].uc_wCt = 0;
			pCAnm->work[i].uc_wCt = pCAnm->work[i].dat.uc_wait;
		}
	}
	return;
}
void ColorAnimeStart(ColorAnime* pCAnm,u16 sw)
{
	u8	i = 0;
	
	pCAnm->uc_flg++;
	
	for(i = 0;i < COLANM_MAX;i++)
	{
		if(!((sw >> i) & 0x0001))	continue;
		if(!pCAnm->work[i].live_sw) continue;

		//稼動フラグを立てる
		pCAnm->w_actsw |= (0x0001 << i);
		pCAnm->work[i].st_flg = 1;

		//第1回目を処理
#if 0
		if(pCAnm->work[i].dat.col & 0x8000){
			color_anime(&(pCAnm->work[i]));
		}
		else{
			color_anime2(&(pCAnm->work[i]));
		}
#endif		
	}	
}
void ColorAnimeEnd(ColorAnime *pCAnm,u16 sw)
{
	u8	i = 0;

	for(i = 0;i < COLANM_MAX;i++)
	{
		if(!((pCAnm->w_actsw >> i) & 0x0001)) continue;
		if(!pCAnm->work[i].live_sw) continue;
		if(!((sw >> i) & 0x0001))	continue;

		//元のカラーに戻してから終わる
		memcpy(	&(PaletteWorkTrans[pCAnm->work[i].dat.w_colNo]),
				&(PaletteWork[pCAnm->work[i].dat.w_colNo]),
				pCAnm->work[i].dat.uc_num*2);

		pCAnm->work[i].st_flg = 0;
		pCAnm->work[i].uc_wCt = pCAnm->work[i].uc_dCt = 0;

		if(pCAnm->work[i].dat.dir)	pCAnm->work[i].dx = -1;
		else						pCAnm->work[i].dx = 1;
	}
	if(sw == 0xFFFF){ 
		pCAnm->uc_flg = 0;
		pCAnm->w_actsw = 0;
	}
	else{
		pCAnm->w_actsw &= (~sw);
	}
}
//////////////////////////////////////////////////////////////////
//	スクリーンデータの作成
//////////////////////////////////////////////////////////////////
/*-----------------------------------------
	256*256テキストスクリーン(16色モード)内の指定した矩形を
	指定したキャラクタで埋める

	void FillChar16(u16* ps,u16 srcChar,u8 x,u8 y,u8 nx,u8 ny);

	引数：
	io	u16*	１BG分のスクリーンデータを格納するバッファへのポインタ
	i	u16*	埋めるキャラクタデータ
	i	u8		矩形の始点X(キャラクタ数)
	i	u8		矩形の始点Y
	i	u8		矩形のXサイズ
	i	u8		矩形のYサイズ
-------------------------------------------*/
void FillChar16(u16* ps,u16 srcChar,u8 x,u8 y,u8 nx,u8 ny)
{
	u8 width = 0,height = 0;
	u16	*p = NULL;

	ps += y*32 + x;		//矩形の始まる最初のアドレス

	for(height = 0;height < ny;height++ )
	{
		p = ps + height*32;	//X軸がどこからはじめるかを計算
		
		for(width = 0;width < nx;width++)
		{
			*p = srcChar;
			p += 1;
		}
	}
}

/*-----------------------------------------
	256*256テキストスクリーン(16色モード)内の指定した矩形を
	指定したキャラクタ配列で埋める
	*指定するキャラクタ配列は１次元マッピングになっていること

	void SetChar16(u16* ps,const u16* srcChar,u8 x,u8 y,u8 nx,u8 ny);

	引数：
	io	u16*	１BG分のスクリーンデータを格納するバッファへのポインタ
	i	u16*	埋めるキャラクタデータを収めた配列へのポインタ
	i	u8		矩形の始点X(キャラクタ数)
	i	u8		矩形の始点Y
	i	u8		矩形のXサイズ
	i	u8		矩形のYサイズ
-------------------------------------------*/
void SetChar16(u16* ps,const u16* srcChar,u8 x,u8 y,u8 nx,u8 ny)
{
	u8 width = 0,height = 0;
	u16	*p = NULL;
	u16 *pSrc = (u16 *)srcChar;

	ps += y*32 + x;		//矩形の始まる最初のアドレス

	for(height = 0;height < ny;height++ )
	{
		p = ps + height*32;	//X軸がどこからはじめるかを計算
		
		for(width = 0;width < nx;width++)
		{
			*p = *pSrc;
			pSrc++;
			p++;
		}
	}
}

/*-----------------------------------------
	256*256テキストスクリーン(16色モード)内の指定した矩形を
	指定したキャラクタで埋める
	回り込み対応
	
	void FillChar16R(_tMap* ps,u16 srcChar,u8 x,u8 y,u8 nx,u8 ny);

	引数：
	io	u16*	１BG分のスクリーンデータを格納するバッファへのポインタ
	i	u16		埋めるキャラクタデータ
	i	u8		矩形の始点X(キャラクタ数)
	i	u8		矩形の始点Y
	i	u8		矩形のXサイズ
	i	u8		矩形のYサイズ
-------------------------------------------*/
void FillChar16R(_tMap* pMap,u16 srcChar,u8 x,u8 y,u8 nx,u8 ny)
{
	u8	height = 0,width = 0;
	u8	sx = x,sy = y;

	for(height = 0;height < ny;height++ )
	{
		sx = x;		//X値リセット
		for(width = 0;width < nx;width++)
		{
			pMap->usa[sy][sx] = srcChar;

			sx = (sx+1)%32;	//回り込み
		}
		sy = (sy+1)%32;	//Y値回り込み更新
	}
}

/*-----------------------------------------
	256*256テキストスクリーン(16色モード)内の指定した矩形を
	指定したキャラクタ配列で埋める
	*指定するキャラクタ配列は１次元マッピングになっていること
	*回り込み対応

	void SetChar16R(_tMap* ps,const u16* srcChar,u8 x,u8 y,u8 nx,u8 ny);

	引数：
	io	u16*	１BG分のスクリーンデータを格納するバッファへのポインタ
	i	u16*	埋めるキャラクタデータを収めた配列へのポインタ
	i	u8		矩形の始点X(キャラクタ数)
	i	u8		矩形の始点Y
	i	u8		矩形のXサイズ
	i	u8		矩形のYサイズ
-------------------------------------------*/
void SetChar16R(_tMap* pMap,const u16* srcChar,u8 x,u8 y,u8 nx,u8 ny)
{
	u8	height = 0,width = 0;
	u16 *pSrc = (u16 *)srcChar;
	u8	sx = x,sy = y;

	for(height = 0;height < ny;height++ )
	{
		sx = x;		//X値リセット
		for(width = 0;width < nx;width++)
		{
			pMap->usa[sy][sx] = *pSrc;
			pSrc++;
			sx = (sx+1)%32;	//回り込み
		}
		sy = (sy+1)%32;	//Y値回り込み更新
	}
}

//	BGアクター関係のツール
//==========================================================
/*--------------------------------------------------------
	_bgAct構造体の初期化
	
	void  BgActInit(_bgAct* pAct);
----------------------------------------------------------*/
void  BgActInit(_bgAct* pAct)
{
	pAct->uc_nPal = pAct->uc_nCell = 0;
	pAct->us_nChar = 0;

	pAct->pCharBaseAddr = (u16 *)VRAM;
	DmaClear(3,0,&(pAct->aPal),sizeof(_bgPal)*BGACT_PAL_MAX,16);
	DmaClear(3,0,&(pAct->aCell),sizeof(_bgCell)*BGACT_CELL_MAX,16);
	return;	
}

/*-------------------------------------------------------
	_bgActにbgCellを登録
	VRAMにキャラクタデータを転送する

	u8	BgCellSet(_bgAct pAct,_bgCell* pCell);

	io	_bgAct*		bgCellを登録する_bgAct構造体へのポインタ
	i	_bgCell*	登録するbgCellデータへのポインタ

	戻り値
	u8	0:		正常終了
		else:	エラー
--------------------------------------------------------*/
u8	BgCellSet(_bgAct* pAct,_bgCell* pCell)
{
	u16		num = 0;
	
	while(1)
	{
		//配列がいっぱいなのでだめ
		if(pAct->uc_nCell > BGACT_CELL_MAX-1) return 1;
		
		//キャラクタデータがNULLならば抜ける
		if(pCell->pCharData == NULL) break;

		//登録処理、データをコピー
		pAct->aCell[pAct->uc_nCell].pCharData	= pCell->pCharData;
		pAct->aCell[pAct->uc_nCell].uc_ID		= pCell->uc_ID;
		pAct->aCell[pAct->uc_nCell].uc_xSiz		= pCell->uc_xSiz;
		pAct->aCell[pAct->uc_nCell].uc_ySiz		= pCell->uc_ySiz;

		//登録済みのキャラクタ数を更新
		num = pCell->uc_xSiz*pCell->uc_ySiz;
		if(pAct->us_nChar + num > BGACT_CHAR_MAX) return 2;	//登録できるキャラクタの最大値を超えるのでだめ

		//VRAMにキャラクタデータを転送
		if(pCell->us_ofs == BGACT_NORMAL)	//ノーマルデータ
		{
			DmaCopy(3,	pCell->pCharData,
						(vu16 *)(pAct->pCharBaseAddr+(32*pAct->us_nChar)),
						32*num,16);
		}
		else	//圧縮データ
		{
			DecordWram(	pCell->pCharData,
						(void *)(pAct->pCharBaseAddr+(32*pAct->us_nChar)));
		}
		//セルのキャラクタデータへのオフセットを覚えておく
		pAct->aCell[pAct->uc_nCell].us_ofs = pAct->us_nChar;
		pAct->us_nChar += num;		//登録されたキャラクタ数の更新

		//セルデータの数を更新
		pAct->uc_nCell++;

		//アドレス更新
		pCell++;
	}
	return 0;
}

/*-----------------------------------------------
	_bgActに_bgPalを登録

	pPal->uc_palNoに
		圧縮データ		BGACT_COMP
		ノーマルデータ	BGACT_NORMAL
	かのフラグを定義してパラメータとする

	パレットWORKにパレットデータを転送する

	u8	BgPalSet(_bgAct* pAct,_bgPal *pPal);

	引数:
	io	_bgAct*		_bgPalを登録する、_bgAct構造体へのポインタ
	i	_bgPal*		登録したいパレットデータとIDを格納した_bgPal構造体へのポインタ

	戻り値：
	u8		0:成功
			else:	エラーコード
--------------------------------------------------*/
u8	BgPalSet(_bgAct* pAct,_bgPal *pPal)
{
	u16		pal_buf[16];
	
	while(1){
		//配列がいっぱいなのでだめ
		if(pAct->uc_nPal > BGACT_PAL_MAX-1) return 1;

		//パレットデータが空なら抜ける
		if(pPal->pPalData == NULL) break;

		//データをコピーして登録
		pAct->aPal[pAct->uc_nPal].pPalData = pPal->pPalData;
		pAct->aPal[pAct->uc_nPal].uc_ID = pPal->uc_ID;

		//パレットデータをパレットWORKに転送
		if(pPal->uc_palNo == BGACT_NORMAL){
			PaletteWorkSet((const u16 *)(pPal->pPalData),PA_BG0+pAct->uc_nPal*16,32);
		}
		else{
			DecordWram(pPal->pPalData,pal_buf);		
			PaletteWorkSet(pal_buf,PA_BG0+pAct->uc_nPal*16,32);
		}

		//パレットナンバーを記憶
		pAct->aPal[pAct->uc_nPal].uc_palNo = pAct->uc_nPal;
		
		//登録されたパレット数を更新
		pAct->uc_nPal++;

		//ソースアドレス更新
		pPal++;
	}
	return 0;
}

/*-----------------------------------------------
	_bgActに_bgPalを登録-複数パレットが同一シンボル名で圧縮されている場合
	pPal->uc_palNoにパレット数を定義してパラメータとする

	パレットWORKにパレットデータを転送する

	u8	BgPalSetComp(_bgAct* pAct,_bgPal *pPal);

	引数:
	io	_bgAct*		_bgPalを登録する、_bgAct構造体へのポインタ
	i	_bgPal*		登録したいパレットデータとIDを格納した_bgPal構造体へのポインタ

	戻り値：
	u8		0:成功
			else:	エラーコード
--------------------------------------------------*/
u8	BgPalSetComp(_bgAct* pAct,_bgPal *pPal)
{
	u16		pal_buf[16][16] = {};
	u8		ct = 0,num = pPal->uc_palNo;

	//圧縮データをバッファに展開
	DecordWram(pPal->pPalData,pal_buf);
	
	for(ct = pAct->uc_nPal;ct < num;ct++)
	{
		if(pAct->uc_nPal+ct > BGACT_PAL_MAX-1) return 1;
		
		//データを登録
		pAct->aPal[ct].pPalData = pPal->pPalData;
		pAct->aPal[ct].uc_ID = pPal->uc_ID+ct;		//IDは連番
		pAct->aPal[ct].uc_palNo = pAct->uc_nPal;

		PaletteWorkSet(&(pal_buf[ct][0]),PA_BG0+pAct->uc_nPal*16,32);
		pAct->uc_nPal++;
	}
	return 0;
}

