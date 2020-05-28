//<mitool.h>
/////////////////////////////////////////////////////////////////
//		
//		現在、岩澤が使用している一部の関数を集めたものです
//
//								02.05.31	By MiyukiIwasawa
/////////////////////////////////////////////////////////////////

#ifndef _M_I_TOOL_H_
#define _M_I_TOOL_H_

////////////////////////////////////////////
//	依存しているライブラリ
////////////////////////////////////////////
#include "common.h"
#include "decord.h"
#include "madefine.h"
#include "actor.h"
#include "palanm.h"

////////////////////////////////////////////
//	依存しているリテラル
///////////////////////////////////////////
//PaletteLumAnime
#define COLANM_MAX		(16)
#define COLANM_CMAX		(31)
#define COLANM_CMIN		(0)

#define COLANM_SW00		(0x0001)
#define COLANM_SW01		(0x0002)
#define COLANM_SW02		(0x0004)
#define COLANM_SW03		(0x0008)
#define COLANM_SW04		(0x0010)
#define COLANM_SW05		(0x0020)
#define COLANM_SW06		(0x0040)
#define COLANM_SW07		(0x0080)
#define COLANM_SW08		(0x0100)
#define COLANM_SW09		(0x0200)
#define COLANM_SW10		(0x0400)
#define COLANM_SW11		(0x0800)
#define COLANM_SW12		(0x1000)
#define COLANM_SW13		(0x2000)
#define COLANM_SW14		(0x4000)
#define COLANM_SW15		(0x8000)

typedef struct{
	u16	r:5;
	u16	g:5;
	u16	b:5;
	u16	d:1;
}_rgb;
typedef struct{
	u16 col;		//カラー
	u16	w_colNo;	//何番のカラーから
	u8	uc_num;		//いくつ？
	
	u8	uc_wait;	//ウェイト？
	u8	uc_loop;	//何回ループ？

	s8	nStep:5;	//何段階？
	s8	type:2;		//タイプ	0:1回,1:loop,2:up down
	s8	dir:1;		//明度を上げる：０、下げる：１
}ColAnmData;
typedef struct{
	u8		st_flg:7;	//現在のステート
	u8		live_sw:1;	//有効１、無効０
	
	u8		uc_wCt;		//ウェイトカウンタ
	u8		uc_dCt;		//差分カウンタ
	s8		dx;			//差分
	
	ColAnmData	dat;	//データ
}ColAnmWork;
typedef struct{
	u8			uc_flg;			//フラグ
	u16			w_actsw;		//ワークのどこを稼動させるかのスイッチ
	ColAnmWork	work[COLANM_MAX];
}ColorAnime;

////////////////////////////////////////////
//	BGマップの制御
////////////////////////////////////////////
//BGスクロール
typedef struct{
	u8	uc_x,uc_y;
}_scroll;

//テキスト256ｘ256マップ
typedef struct{
	u16	usa[32][32];
}_tMap;

//回転拡大256*256マップ
typedef struct{
	u8	ca[32][32];
}_rMap;


//BgAct
//===========================
#define BGACT_NORMAL	(0)
#define BGACT_COMP		(1)
#define BGACT_CELL_MAX	(32)
#define BGACT_OBJ_MAX	(32)
#define BGACT_PAL_MAX	(16)
#define BGACT_CHAR_MAX	(1024)

////////////////////////////////////////////////////////////
//	BGコントロール関係の構造体
////////////////////////////////////////////////////////////
//BG用のセルデータ
typedef struct{
	void*		pCharData;		//キャラクタデータへのアドレス
	u8			uc_xSiz;		//キャラクタサイズX
	u8			uc_ySiz;		//キャラクタサイズY
	u8			uc_ID;			//0以外を指定すること
	u16			us_ofs;			//キャラクタナンバーオフセット(0を指定)
}_bgCell;

//BG用のパレットデータ
typedef struct{
	void*		pPalData;		//16色パレットデータ配列へのポインタ
	u8			uc_ID;			//0以外を指定すること
	u8			uc_palNo;		//パレットナンバー(0を指定)
}_bgPal;

typedef struct{		//_bgObjのセット用構造体
	u16		*pMap;			//スクリーンデータへのポインタ
	u8		uc_cellID;		//使用する_bgCellのID
	u8		uc_palID;		//使用する_bgPalのID
	u8		uc_ID;			//登録用のID(0以外)
}_bgObjData;

typedef struct{
	u8		uc_ID;		//_bgObjのID
	u8		uc_palNo;	//BGパレットナンバー
	u16		us_ofs;		//BGキャラクタオフセットナンバー
	u16*	pMap;		//スクリーンデータへのポインタ
}_bgObj;

typedef struct
{
	u8			uc_nPal;			//登録されたBGパレットの数
	u8			uc_nCell;			//登録されたBGセルの数
	u16			us_nChar;			//最後尾のキャラクタナンバー
	
	u16*		pCharBaseAddr;
	_bgPal		aPal[BGACT_PAL_MAX];	//BG_Pltt データ
	_bgCell		aCell[BGACT_CELL_MAX];	//BG_Cell Data
}_bgAct;

//===============================================================
//	グローバル関数群
//===============================================================

//	カラーアニメーション関係
//====================================
extern void ColorAnimeInit(ColorAnime*);
extern u8	AddColorAnime(ColorAnime*,u8 no,ColAnmData*);
extern u8	DelColorAnime(ColorAnime*,u8 no);
extern void ColorAnimeStart(ColorAnime*,u16 sw);
extern void ColorAnimeEnd(ColorAnime*,u16 sw);
extern void ColorAnimeLum(ColorAnime*);

//	BGスクリーンコントロール関係
//====================================
extern void FillChar16	(u16* ps,u16 srcChar,u8 x,u8 y,u8 nx,u8 ny);
extern void SetChar16	(u16* ps,const u16* srcChar,u8 x,u8 y,u8 nx,u8 ny);
extern void FillChar16R	(_tMap* pMap,u16 srcChar,u8 x,u8 y,u8 nx,u8 ny);
extern void SetChar16R	(_tMap* pMap,const u16* srcChar,u8 x,u8 y,u8 nx,u8 ny);

//	BGアクター関係
//=======================================
extern void	BgActInit(_bgAct* pAct);
extern u8	BgCellSet(_bgAct* pAct,_bgCell *pCell);
extern u8	BgPalSet(_bgAct* pAct,_bgPal *pPal);
extern u8	BgPalSetComp(_bgAct* pAct,_bgPal *pPal);

#endif //_M_I_TOOL_H_

